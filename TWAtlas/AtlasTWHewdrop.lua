---
--- AtlasTWHewdrop.lua - Hewdrop-based dropdown menu system for Atlas-TW
---
--- This file provides wrapper functions AND the minimized Hewdrop library itself
--- to replace the standard UIDropDownMenu which has a ~32 element limit.
--- Hewdrop supports unlimited elements with mouse wheel scrolling.
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

-----------------------------------------------------------------------------
-- Minimized Hewdrop Library Implementation (Embedded)
-----------------------------------------------------------------------------

local Hewdrop = {}
local levels = {}
local buttons = {}
local START_LEVEL = 1000 -- Frame level start

local lua51 = loadstring("return function(...) return ... end") and true or false

-- Helper to create tables with specific keys
local tmp
do
	local t = {}
	function tmp(...)
		for k in pairs(t) do t[k] = nil end
        -- Handle table wrapper if first arg is table (legacy/compatibility)
        if type(arg[1]) == "table" then
            for k,v in pairs(arg[1]) do t[k] = v end
            return t
        end
        -- Iterate varargs in pairs
        for i = 1, arg.n, 2 do
            local k = arg[i]
            local v = arg[i+1]
            if k then t[k] = v end
        end
		return t
	end
end

local function StartCounting(self, levelNum)
	local n = table.getn(levels)
	for i = levelNum, n do
		if levels[i] then
			levels[i].count = 3
		end
	end
end

local function StopCounting(self, level)
	for i = level, 1, -1 do
		if levels[i] then
			levels[i].count = nil
		end
	end
end

local function OnUpdate(self, arg1)
	for _,level in ipairs(levels) do
		if level.count then
			level.count = level.count - arg1
			if level.count < 0 then
				level.count = nil
				self:Close(level.num)
			end
		end
	end
end

-- Forward declarations
local Open, Refresh, Clear

local function ReleaseButton(self, level, index)
	if not level.buttons or not level.buttons[index] then return end
	local button = level.buttons[index]
	button:Hide()
	if button.highlight then button.highlight:Hide() end
	button.arrow:SetHeight(16)
	button.arrow:SetWidth(16)
	table.remove(level.buttons, index)
	table.insert(buttons, button)
	return true
end

local function Scroll(self, level, down)
	if down then
		if level:GetBottom() < 0 then
			local point, parent, relativePoint, x, y = level:GetPoint(1)
			level:SetPoint(point, parent, relativePoint, x, y + 50)
			if level:GetBottom() > 0 then
				level:SetPoint(point, parent, relativePoint, x, y + 50 - level:GetBottom())
			end
		end
	else
		if level:GetTop() > GetScreenHeight() then
			local point, parent, relativePoint, x, y = level:GetPoint(1)
			level:SetPoint(point, parent, relativePoint, x, y - 50)
			if level:GetTop() < GetScreenHeight() then
				level:SetPoint(point, parent, relativePoint, x, y - 50 + GetScreenHeight() - level:GetTop())
			end
		end
	end
end

local numButtons = 0
local function AcquireButton(self, level)
	if not levels[level] then return end
	level = levels[level]
	if not level.buttons then level.buttons = {} end

	local button
	if table.getn(buttons) == 0 then
		numButtons = numButtons + 1
		button = CreateFrame("Button", "Hewdrop20Button" .. numButtons, nil)
		button:SetFrameStrata("FULLSCREEN_DIALOG")
		button:SetHeight(16)

		local highlight = button:CreateTexture(nil, "HIGHLIGHT")
		highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
		button.highlight = highlight
		highlight:SetBlendMode("ADD")
		highlight:SetAllPoints(button)
		highlight:Hide()

		local check = button:CreateTexture(nil, "ARTWORK")
		button.check = check
		check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
		check:SetPoint("CENTER", button, "LEFT", 12, 0)
		check:SetWidth(24)
		check:SetHeight(24)

		local radioHighlight = button:CreateTexture(nil, "ARTWORK")
		button.radioHighlight = radioHighlight
		radioHighlight:SetTexture("Interface\\Buttons\\UI-RadioButton")
		radioHighlight:SetAllPoints(check)
		radioHighlight:SetBlendMode("ADD")
		radioHighlight:SetTexCoord(0.5, 0.75, 0, 1)
		radioHighlight:Hide()

		button:SetScript("OnEnter", function()
			local this = this
			self:Close(this.level.num + 1)
			if not this.disabled and this.hasArrow then
				Open(self, this, nil, this.level.num + 1, this.value)
			end
			if not this.level then return end
			StopCounting(self, this.level.num + 1)
			if not this.disabled then
				highlight:Show()
				if this.isRadio then button.radioHighlight:Show() end
			end
            if this.tooltipTitle or this.tooltipText then
                GameTooltip_SetDefaultAnchor(GameTooltip, this)
                if this.tooltipTitle then
                    GameTooltip:SetText(this.tooltipTitle, 1, 1, 1, 1)
                    if this.tooltipText then
                        GameTooltip:AddLine(this.tooltipText, 1, 1, 1, 1)
                    end
                else
                    GameTooltip:SetText(this.tooltipText, 1, 1, 1, 1)
                end
                GameTooltip:Show()
            end
		end)

		button:SetScript("OnLeave", function()
			highlight:Hide()
			button.radioHighlight:Hide()
            if this.hasArrow and this.arrow then
                this.arrow:SetWidth(16)
                this.arrow:SetHeight(16)
            end
			if this.level then StartCounting(self, this.level.num) end
			GameTooltip:Hide()
		end)

		button:SetScript("OnClick", function()
			if not this.disabled then
				if this.func then
                    this.func(this.arg1, this.arg2, this.arg3)
                    if this.closeWhenClicked then
                        self:Close()
                    elseif level:IsShown() then
                    end
				elseif this.closeWhenClicked then
					self:Close()
				end
			end
		end)

		local text = button:CreateFontString(nil, "ARTWORK")
		button.text = text
		text:SetFontObject(GameFontHighlightSmall)

		local arrow = button:CreateTexture(nil, "ARTWORK")
		button.arrow = arrow
		arrow:SetPoint("LEFT", button, "RIGHT", -16, 0)
		arrow:SetWidth(16)
		arrow:SetHeight(16)
		arrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
        arrow:SetAlpha(0) -- Default hidden
	else
		local n = table.getn(buttons)
		button = buttons[n]
		table.remove(buttons, n)
	end

	button:ClearAllPoints()
	button:SetParent(level)
	button:SetFrameStrata(level:GetFrameStrata())
	button:SetFrameLevel(level:GetFrameLevel() + 1)
	button:SetPoint("LEFT", level, "LEFT", 10, 0)
	button:SetPoint("RIGHT", level, "RIGHT", -10, 0)

	local n = table.getn(level.buttons)
	if n == 0 then
		button:SetPoint("TOP", level, "TOP", 0, -10)
	else
		button:SetPoint("TOP", level.buttons[n], "BOTTOM", 0, 0)
	end

	button.text:SetPoint("LEFT", button, "LEFT", 24, 0)
	button:Show()
	button.level = level
	table.insert(level.buttons, button)

	button:SetAlpha(1)
	return button
end

local function CheckDualMonitor(self, frame)
	local ratio = GetScreenWidth() / GetScreenHeight()
	if ratio >= 2.4 and frame:GetRight() > GetScreenWidth() / 2 and frame:GetLeft() < GetScreenWidth() / 2 then
		local offsetx
		if GetCursorPosition() / GetScreenHeight() * 768 < GetScreenWidth() / 2 then
			offsetx = GetScreenWidth() / 2 - frame:GetRight()
		else
			offsetx = GetScreenWidth() / 2 - frame:GetLeft()
		end
		local point, parent, relativePoint, x, y = frame:GetPoint(1)
		frame:SetPoint(point, parent, relativePoint, (x or 0) + offsetx, y or 0)
	end
end

local function CheckSize(self, level)
	if not level.buttons then return end
	local height = 20
	for _, button in ipairs(level.buttons) do
		height = height + button:GetHeight()
	end
	level:SetHeight(height)
	local width = 160
	for _, button in ipairs(level.buttons) do
		local extra = 1
		if button.hasArrow or button.hasColorSwatch then extra = extra + 16 end
		if not button.notCheckable then extra = extra + 24 end

		button.text:SetFont(StandardTextFont or "Fonts\\FRIZQT__.TTF", 10)
		if button.text:GetWidth() + extra > width then
			width = button.text:GetWidth() + extra
		end
	end
	level:SetWidth(width + 20)

	if level:GetLeft() and level:GetRight() and level:GetTop() and level:GetBottom() and (level:GetLeft() < 0 or level:GetRight() > GetScreenWidth() or level:GetTop() > GetScreenHeight() or level:GetBottom() < 0) then
		level:ClearAllPoints()
		if level.lastDirection == "RIGHT" then
			if level.lastVDirection == "DOWN" then
				level:SetPoint("TOPLEFT", level.parent or level:GetParent(), "TOPRIGHT", 5, 10)
			else
				level:SetPoint("BOTTOMLEFT", level.parent or level:GetParent(), "BOTTOMRIGHT", 5, -10)
			end
		else
			if level.lastVDirection == "DOWN" then
				level:SetPoint("TOPRIGHT", level.parent or level:GetParent(), "TOPLEFT", -5, 10)
			else
				level:SetPoint("BOTTOMRIGHT", level.parent or level:GetParent(), "BOTTOMLEFT", -5, -10)
			end
		end
	end
	local dirty = false
	if not level:GetRight() then
		self:Close()
		return
	end
	if level:GetRight() > GetScreenWidth() and level.lastDirection == "RIGHT" then
		level.lastDirection = "LEFT"
		dirty = true
	elseif level:GetLeft() < 0 and level.lastDirection == "LEFT" then
		level.lastDirection = "RIGHT"
		dirty = true
	end
	if level:GetTop() > GetScreenHeight() and level.lastVDirection == "UP" then
		level.lastVDirection = "DOWN"
		dirty = true
	elseif level:GetBottom() < 0 and level.lastVDirection == "DOWN" then
		level.lastVDirection = "UP"
		dirty = true
	end
	if dirty then
		level:ClearAllPoints()
		if level.lastDirection == "RIGHT" then
			if level.lastVDirection == "DOWN" then
				level:SetPoint("TOPLEFT", level.parent or level:GetParent(), "TOPRIGHT", 5, 10)
			else
				level:SetPoint("BOTTOMLEFT", level.parent or level:GetParent(), "BOTTOMRIGHT", 5, -10)
			end
		else
			if level.lastVDirection == "DOWN" then
				level:SetPoint("TOPRIGHT", level.parent or level:GetParent(), "TOPLEFT", -5, 10)
			else
				level:SetPoint("BOTTOMRIGHT", level.parent or level:GetParent(), "BOTTOMLEFT", -5, -10)
			end
		end
	end
	if level:GetTop() > GetScreenHeight() then
		local top = level:GetTop()
		local point, parent, relativePoint, x, y = level:GetPoint(1)
		level:ClearAllPoints()
		level:SetPoint(point, parent, relativePoint, x or 0, (y or 0) + GetScreenHeight() - top)
	elseif level:GetBottom() < 0 then
		local bottom = level:GetBottom()
		local point, parent, relativePoint, x, y = level:GetPoint(1)
		level:ClearAllPoints()
		level:SetPoint(point, parent, relativePoint, x or 0, (y or 0) - bottom)
	end
	CheckDualMonitor(self, level)
	if math.mod(level.num, 5) == 0 then
		local left, bottom = level:GetLeft(), level:GetBottom()
		level:ClearAllPoints()
		level:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left, bottom)
	end
end


local numLevels = 0
local function AcquireLevel(self, level)
	if not levels[level] then
		local n = table.getn(levels) + 1
		for i = n, level, -1 do
			numLevels = numLevels + 1
			local frame = CreateFrame("Button", "Hewdrop20Level" .. numLevels, nil)
			levels[i] = frame
			frame.num = i
			frame:SetParent(UIParent)
			frame:SetFrameStrata("FULLSCREEN_DIALOG")
			frame:Hide()
			frame:SetWidth(180)
			frame:SetHeight(10)
			frame:SetFrameLevel(i * 3 + START_LEVEL)
			frame:SetScript("OnHide", function() self:Close(level + 1) end)
			frame:EnableMouse(true)
			frame:EnableMouseWheel(true)

			local backdrop = CreateFrame("Frame", nil, frame)
			backdrop:SetAllPoints(frame)
			backdrop:SetBackdrop({
				bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
				tile = true, tileSize = 16, edgeSize = 16,
				insets = { left = 5, right = 5, top = 5, bottom = 5 }
			})
			backdrop:SetBackdropBorderColor(1, 1, 1)
			backdrop:SetBackdropColor(0, 0, 0, 1)

			frame:SetScript("OnClick", function() self:Close(i) end)
			frame:SetScript("OnEnter", function() StopCounting(self, i) end)
			frame:SetScript("OnLeave", function() StartCounting(self, i) end)
			frame:SetScript("OnMouseWheel", function() Scroll(self, frame, arg1 < 0) end)

			if i == 1 then
				frame:SetScript("OnUpdate", function() OnUpdate(self, arg1) end)
			end

            -- Hook for pfUI styling
            if AtlasTW and AtlasTW.pfUI and AtlasTW.pfUI.StyleHewdropLevel then
                AtlasTW.pfUI.StyleHewdropLevel(numLevels)
            end
		end
	end
	return levels[level]
end

function Clear(self, level)
	if level and level.buttons then
		local n = table.getn(level.buttons)
		for i = n, 1, -1 do
			ReleaseButton(self, level, i)
		end
	end
end

local baseFunc, currentLevel

function Refresh(self, level)
	if type(level) == "number" then level = levels[level] end
	if not level then return end

	if baseFunc then
		Clear(self, level)
		currentLevel = level.num
        -- Call the menu generation function
		baseFunc(currentLevel, level.value)
		currentLevel = nil
		CheckSize(self, level)
	end
end

function Open(self, parent, func, level, value, point, relativePoint)
	self:Close(level)

	local frame = AcquireLevel(self, level)
	if level == 1 then
		frame.lastDirection = "RIGHT"
		frame.lastVDirection = "DOWN"
	else
		frame.lastDirection = levels[level - 1].lastDirection or "RIGHT"
		frame.lastVDirection = levels[level - 1].lastVDirection or "DOWN"
	end
	frame:ClearAllPoints()
	frame.parent = parent
	frame:SetPoint("LEFT", UIParent, "RIGHT", 10000, 0) -- Offscreen init
	frame:Show()

	if level == 1 then baseFunc = func end
	levels[level].value = value

    -- Arrow on parent
	if parent.arrow then
		parent.arrow:SetHeight(24)
		parent.arrow:SetWidth(24)
	end

	Refresh(self, levels[level])

	if point then
		frame:ClearAllPoints()
		frame:SetPoint(point, parent, relativePoint or point)

		if string.sub(point, 1, 3) ~= string.sub(relativePoint or point, 1, 3) then
			if frame:GetBottom() < 0 then
				local point, parent, relativePoint, x, y = frame:GetPoint(1)
				local change = GetScreenHeight() - frame:GetTop()
				local otherChange = -frame:GetBottom()
				if otherChange < change then
					change = otherChange
				end
				frame:SetPoint(point, parent, relativePoint, x, y + change)
			elseif frame:GetTop() > GetScreenHeight() then
				local point, parent, relativePoint, x, y = frame:GetPoint(1)
				local change = GetScreenHeight() - frame:GetTop()
				local otherChange = -frame:GetBottom()
				if otherChange < change then
					change = otherChange
				end
				frame:SetPoint(point, parent, relativePoint, x, y + change)
			end
		end
	end

	CheckDualMonitor(self, frame)
	StartCounting(self, level)
end
-----------------------------------------------------------------------------

local regTable = {}

function Hewdrop:Register(parent, ...)
    if not parent then return end
    local info = tmp(unpack(arg))
    regTable[parent] = {
        children = info.children,
        point = info.point,
        relativePoint = info.relativePoint,
        dontHook = info.dontHook
    }

    if not info.dontHook then
        parent:SetScript("OnClick", function()
             if self:IsOpen(parent) then
                 self:Close()
             else
                 self:Open(parent)
             end
        end)
    end
end

function Hewdrop:Unregister(parent)
    if not parent then return end
    regTable[parent] = nil
end

function Hewdrop:Open(parent, ...)
    if not parent then return end
    local info = tmp(unpack(arg))

    -- Check if registered via Register(parent, ...)
    -- Only check if no explicit args passed in info (e.g. just parent passed or parent+point args but no children)
    if not info.children and regTable[parent] then
        local reg = regTable[parent]
        local children = reg.children
        local point, relativePoint

        if type(reg.point) == "function" then
            point, relativePoint = reg.point()
        else
            point = reg.point
            relativePoint = reg.relativePoint
        end
        -- Override if passed in args
        if info.point then
             if type(info.point) == 'function' then
                 point, relativePoint = info.point(parent)
             else
                 point = info.point
                 relativePoint = info.relativePoint
             end
        end

        Open(self, parent, children, 1, nil, point, relativePoint)
        return
    end

    local children = info.children

    local point, relativePoint
    if info.point then
        if type(info.point) == "function" then
             point, relativePoint = info.point(parent)
        else
             point = info.point
             relativePoint = info.relativePoint
        end
    end

    Open(self, parent, children, 1, nil, point, relativePoint)
end

function Hewdrop:Close(level)
	if not level then level = 1 end
	if level == 1 and levels[level] then levels[level].parented = false end

    local n = table.getn(levels)
	for i = level, n do
		if levels[i] then
			Clear(self, levels[i])
			levels[i]:Hide()
			levels[i]:ClearAllPoints()
			levels[i]:SetPoint("CENTER", UIParent, "CENTER")
		end
	end

    if level == 1 then baseFunc = nil end
end

function Hewdrop:AddLine(...)
	local info = tmp(unpack(arg))
    local level = currentLevel
	local button = AcquireButton(self, level)

    button.disabled = info.disabled or info.isTitle -- Removed `or info.notClickable` to be safe, as it usually only affects checkmark
    button.isTitle = info.isTitle
    button.notClickable = info.notClickable

    if button.isTitle then
        button.text:SetFontObject(GameFontNormalSmall)
    else
        button.text:SetFontObject(GameFontHighlightSmall)
    end

    if info.disabled then
        button.text:SetTextColor(0.5, 0.5, 0.5)
    else
        if info.textR and info.textG and info.textB then
            button.text:SetTextColor(info.textR, info.textG, info.textB)
        else
            button.text:SetTextColor(1, 1, 1)
        end
    end

    button.notCheckable = info.notCheckable
    button.text:SetPoint("LEFT", button, "LEFT", button.notCheckable and 0 or 24, 0)
    button.checked = not info.notCheckable and info.checked
    button.isRadio = not info.notCheckable and info.isRadio

    if button.isRadio then
        button.check:Show()
        button.check:SetTexture("Interface\\Buttons\\UI-RadioButton")
        button.check:SetWidth(16)
        button.check:SetHeight(16)
        if button.checked then
            button.check:SetTexCoord(0.25, 0.5, 0, 1)
            button.check:SetVertexColor(1, 1, 1, 1)
        else
            button.check:SetTexCoord(0, 0.25, 0, 1)
            button.check:SetVertexColor(1, 1, 1, 0.5)
        end
    else
        button.check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
        button.check:SetWidth(20) -- Slightly larger for checkbox
        button.check:SetHeight(20)
        button.check:SetTexCoord(0, 1, 0, 1)
        if button.checked then
             button.check:SetVertexColor(1, 1, 1, 1)
        else
             button.check:SetVertexColor(1, 1, 1, 0)
        end
    end

    button.func = info.func
    button.arg1 = info.arg1
    button.arg2 = info.arg2
    button.arg3 = info.arg3
    button.closeWhenClicked = info.closeWhenClicked

    button.hasArrow = info.hasArrow or false
    if button.hasArrow then
        button.arrow:SetAlpha(1)
        button.value = info.value -- Store value for submenu
    else
        button.arrow:SetAlpha(0)
    end

    button.text:SetText(info.text)

    -- Tooltip
    button.tooltipTitle = info.tooltipTitle
    button.tooltipText = info.tooltipText
end

function Hewdrop:IsOpen(parent)
	return levels[1] and levels[1]:IsShown() and (not parent or parent == levels[1].parent)
end

 function Hewdrop:Refresh(level)
 	Refresh(self, level)
 end

-- Hook WorldFrame to close menu on click
local WorldFrame_OnMouseDown = WorldFrame:GetScript("OnMouseDown")
WorldFrame:SetScript("OnMouseDown", function()
    if WorldFrame_OnMouseDown then WorldFrame_OnMouseDown() end
    Hewdrop:Close()
end)

-- EXPORT FOR COMPATIBILITY
_G.ATWHewdrop = Hewdrop
_G.AtlasTWLoot_Hewdrop = Hewdrop -- Export for TWLoot compatibility

-----------------------------------------------------------------------------
-- Atlas-TW Wrapper
-----------------------------------------------------------------------------

-- Module namespace
AtlasTW.HewdropMenus = {}

--- Opens the sorting selection menu (Continent, Level, etc)
function AtlasTW.HewdropMenus:OpenSortByMenu(parent)
    local dropDownOrder = AtlasTW_DropDownSortOrder
    if not dropDownOrder then return end

    Hewdrop:Open(parent,
        'children', function(level, value)
            for i, sortName in ipairs(dropDownOrder) do
                local index = i
                local checked = (AtlasTWOptions.AtlasSortBy == index)
                Hewdrop:AddLine(
                    'text', sortName,
                    'checked', checked,
                    'isRadio', true,
                    'func', function()
                        AtlasTWOptions.AtlasSortBy = index
                        AtlasTWOptions.AtlasZone = 1
                        AtlasTWOptions.AtlasType = 1
                        AtlasTW.PopulateDropdowns()
                        AtlasTW.Refresh()
                        AtlasTW.UpdateDropdownLabels()
                        if AtlasTW.HewdropMenus.UpdateSortByLabel then
                            AtlasTW.HewdropMenus.UpdateSortByLabel()
                        end
                    end,
                    'closeWhenClicked', true
                )
            end
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Updates the sort by label in the options frame
function AtlasTW.HewdropMenus:UpdateSortByLabel()
    local dropDownOrder = AtlasTW_DropDownSortOrder
    if not dropDownOrder then return end

    local sortName = dropDownOrder[AtlasTWOptions.AtlasSortBy]
    if sortName and AtlasTWOptionsFrameDropDownCatsText then
        AtlasTWOptionsFrameDropDownCatsText:SetText(sortName)
    end
end

--- Opens the category selection menu (Continent, Party Size, Level, Type, All)
function AtlasTW.HewdropMenus:OpenCategoryMenu(parent)
    -- Ensure data is initialized
    if not AtlasTW.DropDowns or not next(AtlasTW.DropDowns) then
        if AtlasTW.PopulateDropdowns then
            AtlasTW.PopulateDropdowns()
        end
    end

    local sortType = AtlasTW_DropDownSortOrder and AtlasTW_DropDownSortOrder[AtlasTWOptions.AtlasSortBy]
    if not sortType then return end

    local subcatOrder = AtlasTW_DropDownGetLayoutOrder and AtlasTW_DropDownGetLayoutOrder(sortType)
    if not subcatOrder then return end

    Hewdrop:Open(parent,
        'children', function(level, value)
            for i, catName in ipairs(subcatOrder) do
                local index = i
                local checked = (AtlasTWOptions.AtlasType == index)
                Hewdrop:AddLine(
                    'text', catName,
                    'checked', checked,
                    'isRadio', true,
                    'func', function()
                        AtlasTWOptions.AtlasType = index
                        AtlasTWOptions.AtlasZone = 1
                        AtlasTW.UpdateDropdownLabels()
                        AtlasTW.Refresh()
                    end,
                    'closeWhenClicked', true
                )
            end
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Opens the instance/map selection menu
function AtlasTW.HewdropMenus:OpenInstanceMenu(parent)
    -- Ensure DropDowns are populated
    if not AtlasTW.DropDowns or not next(AtlasTW.DropDowns) then
        if AtlasTW.PopulateDropdowns then
            AtlasTW.PopulateDropdowns()
        end
    end

    local instances = (AtlasTW.DropDowns and AtlasTW.DropDowns[AtlasTWOptions.AtlasType]) or {}

    if table.getn(instances) == 0 then
        -- Try to repopulate if empty
        if AtlasTW.PopulateDropdowns then
            AtlasTW.PopulateDropdowns()
            instances = (AtlasTW.DropDowns and AtlasTW.DropDowns[AtlasTWOptions.AtlasType]) or {}
        end
    end

    Hewdrop:Open(parent,
        'children', function(level, value)
            for i, v in ipairs(instances) do
                local index = i
                local checked = (AtlasTWOptions.AtlasZone == index)
                local instanceName = AtlasTW.InstanceData[v] and AtlasTW.InstanceData[v].Name or v
                Hewdrop:AddLine(
                    'text', instanceName,
                    'checked', checked,
                    'isRadio', true,
                    'func', function()
                        AtlasTWOptions.AtlasZone = index
                        AtlasTW.UpdateDropdownLabels()
                        AtlasTW.Refresh()
                    end,
                    'closeWhenClicked', true
                )
            end
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Opens the entrance/instance switch menu
function AtlasTW.HewdropMenus:OpenSwitchMenu(parent, switchData, onSelect)
    if not switchData or table.getn(switchData) == 0 then
        return
    end

    Hewdrop:Open(parent,
        'children', function(level, value)
            for i, v in ipairs(switchData) do
                local index = i
                local instanceName = AtlasTW.InstanceData[v] and AtlasTW.InstanceData[v].Name or v
                Hewdrop:AddLine(
                    'text', instanceName,
                    'notCheckable', true,
                    'func', function()
                        if onSelect then
                            onSelect(index)
                        end
                    end,
                    'closeWhenClicked', true
                )
            end
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Opens the WishList sorting menu
function AtlasTW.HewdropMenus:OpenWishListSortMenu(parent)
    local L = AtlasTW.Localization.UI
    Hewdrop:Open(parent,
        'children', function(level, value)
            -- Default sorting
            local isDefault = (AtlasTWCharDB.WishListSortMode == "Default")
            Hewdrop:AddLine(
                'text', L["Default"],
                'checked', isDefault,
                'isRadio', true,
                'func', function()
                    AtlasTWCharDB.WishListSortMode = "Default"
                    AtlasTW.HewdropMenus.UpdateWishListSortLabel()
                    if AtlasTWLoot_InvalidateCategorizedList then
                        AtlasTWLoot_InvalidateCategorizedList("WishList")
                    end
                    if AtlasTW.LootBrowserUI and AtlasTW.LootBrowserUI.ScrollBarLootUpdate then
                        AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
                    end
                end,
                'closeWhenClicked', true
            )

            -- Group by Source
            local isSource = (AtlasTWCharDB.WishListSortMode == "Source" or AtlasTWCharDB.WishListSortMode == "Instance")
            Hewdrop:AddLine(
                'text', L["Group by Source"],
                'checked', isSource,
                'isRadio', true,
                'func', function()
                    AtlasTWCharDB.WishListSortMode = "Source"
                    AtlasTW.HewdropMenus.UpdateWishListSortLabel()
                    if AtlasTWLoot_InvalidateCategorizedList then
                        AtlasTWLoot_InvalidateCategorizedList("WishList")
                    end
                    if AtlasTW.LootBrowserUI and AtlasTW.LootBrowserUI.ScrollBarLootUpdate then
                        AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
                    end
                end,
                'closeWhenClicked', true
            )
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Updates the WishList sort dropdown label
function AtlasTW.HewdropMenus.UpdateWishListSortLabel()
    if AtlasTWLootWishListSortDropDown and AtlasTWLootWishListSortDropDownText then
        local L = AtlasTW.Localization.UI
        local mode = AtlasTWCharDB.WishListSortMode or "Default"
        if mode == "Instance" then mode = "Source" end

        local text = L["Default"]
        if mode == "Source" then
            text = L["Group by Source"]
        end
        AtlasTWLootWishListSortDropDownText:SetText(text)
    end
end

--- Closes any open Hewdrop menu
function AtlasTW.HewdropMenus:Close()
    Hewdrop:Close()
end

--- Checks if a Hewdrop menu is currently open
function AtlasTW.HewdropMenus:IsOpen(parent)
    return Hewdrop:IsOpen(parent)
end

--- Updates the text labels on dropdown buttons to show current selection
function AtlasTW.UpdateDropdownLabels()
    -- Update category button text
    if AtlasTWFrameDropDownType and AtlasTWFrameDropDownTypeText then
        local sortType = AtlasTW_DropDownSortOrder and AtlasTW_DropDownSortOrder[AtlasTWOptions.AtlasSortBy]
        local subcatOrder = sortType and AtlasTW_DropDownGetLayoutOrder and AtlasTW_DropDownGetLayoutOrder(sortType) or {}
        local catName = subcatOrder[AtlasTWOptions.AtlasType] or ""
        AtlasTWFrameDropDownTypeText:SetText(catName)
    end

    -- Update instance button text
    if AtlasTWFrameDropDown and AtlasTWFrameDropDownText then
        local instances = AtlasTW.DropDowns and AtlasTW.DropDowns[AtlasTWOptions.AtlasType] or {}
        local instanceKey = instances[AtlasTWOptions.AtlasZone]
        local instanceName = ""
        if instanceKey and AtlasTW.InstanceData and AtlasTW.InstanceData[instanceKey] then
            instanceName = AtlasTW.InstanceData[instanceKey].Name
        end
        AtlasTWFrameDropDownText:SetText(instanceName)
    end
end
