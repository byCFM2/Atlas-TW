--[[
Name: Hewdrop
Revision: $Rev: 17883 $
Author(s): ckknight (ckknight@gmail.com)
Website: http://ckknight.wowinterface.com/
Documentation: http://wiki.wowace.com/index.php/Hewdrop
SVN: http://svn.wowace.com/root/trunk/HewdropLib/Hewdrop
Description: A library to provide a clean dropdown menu interface.
Dependencies: None (standalone version)
]]

local MINOR_VERSION = 17883

-- Standalone version check
if ATWHewdrop and ATWHewdrop.minor and ATWHewdrop.minor >= MINOR_VERSION then return end

local Hewdrop = ATWHewdrop or {}

local lua51 = loadstring("return function(...) return ... end") and true or false

local table_setn = lua51 and function() end or table.setn

local function new(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
	local t = {}
	if k1 then t[k1] = v1
	if k2 then t[k2] = v2
	if k3 then t[k3] = v3
	if k4 then t[k4] = v4
	if k5 then t[k5] = v5
	if k6 then t[k6] = v6
	if k7 then t[k7] = v7
	if k8 then t[k8] = v8
	if k9 then t[k9] = v9
	if k10 then t[k10] = v10
	if k11 then t[k11] = v11
	if k12 then t[k12] = v12
	if k13 then t[k13] = v13
	if k14 then t[k14] = v14
	if k15 then t[k15] = v15
	if k16 then t[k16] = v16
	if k17 then t[k17] = v17
	if k18 then t[k18] = v18
	if k19 then t[k19] = v19
	if k20 then t[k20] = v20
	end end end end end end end end end end end end end end end end end end end end
	return t
end
if lua51 then
	new = loadstring("return function(...) local t = {}; for i = 1, select('#', ...), 2 do if select(i, ...) then t[select(i, ...)] = select(i+1, ...); else break; end; end; return t; end")()
end

local tmp
do
	local t = {}
	function tmp(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
		for k in pairs(t) do
			t[k] = nil
		end
		if type(k1) == "table" then
			for k,v in pairs(k1) do
				t[k] = v
			end
		else
			if k1 then t[k1] = v1
			if k2 then t[k2] = v2
			if k3 then t[k3] = v3
			if k4 then t[k4] = v4
			if k5 then t[k5] = v5
			if k6 then t[k6] = v6
			if k7 then t[k7] = v7
			if k8 then t[k8] = v8
			if k9 then t[k9] = v9
			if k10 then t[k10] = v10
			if k11 then t[k11] = v11
			if k12 then t[k12] = v12
			if k13 then t[k13] = v13
			if k14 then t[k14] = v14
			if k15 then t[k15] = v15
			if k16 then t[k16] = v16
			if k17 then t[k17] = v17
			if k18 then t[k18] = v18
			if k19 then t[k19] = v19
			if k20 then t[k20] = v20
			end end end end end end end end end end end end end end end end end end end end
		end
		return t
	end
	if lua51 then
		tmp = loadstring("local t = {}; return function(...) for k in pairs(t) do t[k] = nil end; for i = 1, select('#', ...), 2 do if select(i, ...) then t[select(i, ...)] = select(i+1, ...) else break; end; end; return t; end")()
	end
end
local tmp2
do
	local t = {}
	function tmp2(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
		for k in pairs(t) do
			t[k] = nil
		end
		if k1 then t[k1] = v1
		if k2 then t[k2] = v2
		if k3 then t[k3] = v3
		if k4 then t[k4] = v4
		if k5 then t[k5] = v5
		if k6 then t[k6] = v6
		if k7 then t[k7] = v7
		if k8 then t[k8] = v8
		if k9 then t[k9] = v9
		if k10 then t[k10] = v10
		if k11 then t[k11] = v11
		if k12 then t[k12] = v12
		if k13 then t[k13] = v13
		if k14 then t[k14] = v14
		if k15 then t[k15] = v15
		if k16 then t[k16] = v16
		if k17 then t[k17] = v17
		if k18 then t[k18] = v18
		if k19 then t[k19] = v19
		if k20 then t[k20] = v20
		end end end end end end end end end end end end end end end end end end end end
		return t
	end
	if lua51 then
		tmp2 = loadstring("local t = {}; return function(...) for k in pairs(t) do t[k] = nil end; for i = 1, select('#', ...), 2 do if select(i, ...) then t[select(i, ...)] = select(i+1, ...) else break; end; end; return t; end")()
	end
end
local levels
local buttons

local function GetScaledCursorPosition()
	local x, y = GetCursorPosition()
	local scale = UIParent:GetEffectiveScale()
	return x / scale, y / scale
end

local function StartCounting(self, levelNum)
	for i = levelNum, table.getn(levels) do
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
	if not level.buttons then
		return
	end
	local height = 20
	for _, button in ipairs(level.buttons) do
		height = height + button:GetHeight()
	end
	level:SetHeight(height)
	local width = 160
	for _, button in ipairs(level.buttons) do
		local extra = 1
		if button.hasArrow or button.hasColorSwatch then
			extra = extra + 16
		end
		if not button.notCheckable then
			extra = extra + 24
		end
		button.text:SetFont(STANDARD_TEXT_FONT, button.textHeight)
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
	if mod(level.num, 5) == 0 then
		local left, bottom = level:GetLeft(), level:GetBottom()
		level:ClearAllPoints()
		level:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left, bottom)
	end
end

local Open
local OpenSlider
local OpenEditBox
local Refresh
local Clear
local function ReleaseButton(self, level, index)
	if not level.buttons then
		return
	end
	if not level.buttons[index] then
		return
	end
	local button = level.buttons[index]
	button:Hide()
	if button.highlight then
		button.highlight:Hide()
	end
--	button.arrow:SetVertexColor(1, 1, 1)
	button.arrow:SetHeight(16)
	button.arrow:SetWidth(16)
	table.remove(level.buttons, index)
	table.insert(buttons, button)
	for k in pairs(button) do
		if k ~= 0 and k ~= "text" and k ~= "check" and k ~= "arrow" and k ~= "colorSwatch" and k ~= "highlight" and k ~= "radioHighlight" then
			button[k] = nil
		end
	end
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

local sliderFrame
local editBoxFrame

local numButtons = 0
local function AcquireButton(self, level)
	if not levels[level] then
		return
	end
	level = levels[level]
	if not level.buttons then
		level.buttons = {}
	end
	local button
	if table.getn(buttons) == 0 then
		numButtons = numButtons + 1
		button = CreateFrame("Button", "Hewdrop20Button" .. numButtons, nil)
		button:SetFrameStrata("FULLSCREEN_DIALOG")
		button:SetHeight(16)
		local highlight = button:CreateTexture(nil, "BACKGROUND")
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
			if (sliderFrame and sliderFrame:IsShown() and sliderFrame.mouseDown and sliderFrame.level == this.level.num + 1) or (editBoxFrame and editBoxFrame:IsShown() and editBoxFrame.mouseDown and editBoxFrame.level == this.level.num + 1) then
				for i = 1, this.level.num do
					Refresh(self, levels[i])
				end
				return
			end
			self:Close(this.level.num + 1)
			if not this.disabled then
				if this.hasSlider then
					OpenSlider(self, this)
				elseif this.hasEditBox then
					OpenEditBox(self, this)
				elseif this.hasArrow then
					Open(self, this, nil, this.level.num + 1, this.value)
				end
			end
			if not this.level then -- button reclaimed
				return
			end
			StopCounting(self, this.level.num + 1)
			if not this.disabled then
				highlight:Show()
				if this.isRadio then
					button.radioHighlight:Show()
				end
			end
			if this.tooltipTitle or this.tooltipText then
				GameTooltip_SetDefaultAnchor(GameTooltip, this)
				local disabled = not this.isTitle and this.disabled
				if this.tooltipTitle then
					if disabled then
						GameTooltip:SetText(this.tooltipTitle, 0.5, 0.5, 0.5, 1)
					else
						GameTooltip:SetText(this.tooltipTitle, 1, 1, 1, 1)
					end
					if this.tooltipText then
						if disabled then
							GameTooltip:AddLine(this.tooltipText, (NORMAL_FONT_COLOR.r + 0.5) / 2, (NORMAL_FONT_COLOR.g + 0.5) / 2, (NORMAL_FONT_COLOR.b + 0.5) / 2, 1)
						else
							GameTooltip:AddLine(this.tooltipText, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
						end
					end
				else
					if disabled then
						GameTooltip:SetText(this.tooltipText, 0.5, 0.5, 0.5, 1)
					else
						GameTooltip:SetText(this.tooltipText, 1, 1, 1, 1)
					end
				end
				GameTooltip:Show()
			end
			if this.tooltipFunc then
				GameTooltip:SetOwner(this, "ANCHOR_NONE")
				GameTooltip:SetPoint("TOPLEFT", this, "TOPRIGHT", 5, 0)
				this.tooltipFunc(this.tooltipArg1, this.tooltipArg2, this.tooltipArg3, this.tooltipArg4)
				GameTooltip:Show()
			end
		end)
		button:SetScript("OnLeave", function()
			highlight:Hide()
			button.radioHighlight:Hide()
			if this.level then
				StartCounting(self, this.level.num)
			end
			GameTooltip:Hide()
		end)
		button:SetScript("OnClick", function()
			if not this.disabled then
				if this.hasColorSwatch then
					local func = button.colorFunc
					local a1,a2,a3,a4 = button.colorArg1, button.colorArg2, button.colorArg3, button.colorArg4
					local hasOpacity = this.hasOpacity
					ColorPickerFrame.func = function()
						if func then
							local r,g,b = ColorPickerFrame:GetColorRGB()
							local a = hasOpacity and 1 - OpacitySliderFrame:GetValue() or nil
							if a1 == nil then
								func(r, g, b, a)
							elseif a2 == nil then
								func(a1, r, g, b, a)
							elseif a3 == nil then
								func(a1, a2, r, g, b, a)
							elseif a4 == nil then
								func(a1, a2, a3, r, g, b, a)
							else
								func(a1, a2, a3, a4, r, g, b, a)
							end
						end
					end
					ColorPickerFrame.hasOpacity = this.hasOpacity
					ColorPickerFrame.opacityFunc = ColorPickerFrame.func
					ColorPickerFrame.opacity = 1 - this.opacity
					ColorPickerFrame:SetColorRGB(this.r, this.g, this.b)
					local r, g, b, a = this.r, this.g, this.b, this.opacity
					ColorPickerFrame.cancelFunc = function()
						if a1 == nil then
							func(r, g, b, a)
						elseif a2 == nil then
							func(a1, r, g, b, a)
						elseif a3 == nil then
							func(a1, a2, r, g, b, a)
						else
							func(a1, a2, a3, r, g, b, a)
						end
					end
					self:Close(1)
					ColorPickerFrame:Show()
				elseif this.func then
					local level = button.level
					if type(this.func) == "string" then
						self:assert(type(this.arg1[this.func]) == "function", "Cannot call method " .. this.func)
						this.arg1[this.func](this.arg1, this.arg2, this.arg3, this.arg4)
					else
						this.func(this.arg1, this.arg2, this.arg3, this.arg4)
					end
					if this.closeWhenClicked then
						self:Close()
					elseif level:IsShown() then
						for i = 1, level.num do
							Refresh(self, levels[i])
						end
					end
				elseif this.closeWhenClicked then
					self:Close()
				end
			end
		end)
		local text = button:CreateFontString(nil, "ARTWORK")
		button.text = text
		text:SetFontObject(GameFontHighlightSmall)
		button.text:SetFont(STANDARD_TEXT_FONT, UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT)
		button:SetScript("OnMouseDown", function()
			if not this.disabled and (this.func or this.colorFunc or this.closeWhenClicked) then
				text:SetPoint("LEFT", button, "LEFT", this.notCheckable and 1 or 25, -1)
			end
		end)
		button:SetScript("OnMouseUp", function()
			if not this.disabled and (this.func or this.colorFunc or this.closeWhenClicked) then
				text:SetPoint("LEFT", button, "LEFT", this.notCheckable and 0 or 24, 0)
			end
		end)
		local arrow = button:CreateTexture(nil, "ARTWORK")
		button.arrow = arrow
		arrow:SetPoint("LEFT", button, "RIGHT", -16, 0)
		arrow:SetWidth(16)
		arrow:SetHeight(16)
		arrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
		local colorSwatch = button:CreateTexture(nil, "OVERLAY")
		button.colorSwatch = colorSwatch
		colorSwatch:SetWidth(20)
		colorSwatch:SetHeight(20)
		colorSwatch:SetTexture("Interface\\ChatFrame\\ChatFrameColorSwatch")
		local texture = button:CreateTexture(nil, "OVERLAY")
		colorSwatch.texture = texture
		texture:SetTexture(1, 1, 1)
		texture:SetWidth(11.5)
		texture:SetHeight(11.5)
		texture:Show()
		texture:SetPoint("CENTER", colorSwatch, "CENTER")
		colorSwatch:SetPoint("RIGHT", button, "RIGHT", 0, 0)
	else
		button = buttons[table.getn(buttons)]
		table.remove(buttons, table.getn(buttons))
	end
	button:ClearAllPoints()
	button:SetParent(level)
	button:SetFrameStrata(level:GetFrameStrata())
	button:SetFrameLevel(level:GetFrameLevel() + 1)
	button:SetPoint("LEFT", level, "LEFT", 10, 0)
	button:SetPoint("RIGHT", level, "RIGHT", -10, 0)
	if table.getn(level.buttons) == 0 then
		button:SetPoint("TOP", level, "TOP", 0, -10)
	else
		button:SetPoint("TOP", level.buttons[table.getn(level.buttons)], "BOTTOM", 0, 0)
	end
	button.text:SetPoint("LEFT", button, "LEFT", 24, 0)
	button:Show()
	button.level = level
	table.insert(level.buttons, button)
	if not level.parented then
		level.parented = true
		level:ClearAllPoints()
		if level.num == 1 then
			if level.parent ~= UIParent then
				level:SetPoint("TOPRIGHT", level.parent, "TOPLEFT")
			else
				level:SetPoint("CENTER", level.parent, "CENTER")
			end
		else
			if level.lastDirection == "RIGHT" then
				if level.lastVDirection == "DOWN" then
					level:SetPoint("TOPLEFT", level.parent, "TOPRIGHT", 5, 10)
				else
					level:SetPoint("BOTTOMLEFT", level.parent, "BOTTOMRIGHT", 5, -10)
				end
			else
				if level.lastVDirection == "DOWN" then
					level:SetPoint("TOPRIGHT", level.parent, "TOPLEFT", -5, 10)
				else
					level:SetPoint("BOTTOMRIGHT", level.parent, "BOTTOMLEFT", -5, -10)
				end
			end
		end
		level:SetFrameStrata("FULLSCREEN_DIALOG")
	end
	button:SetAlpha(1)
	return button
end

local numLevels = 0
local function AcquireLevel(self, level)
	if not levels[level] then
		for i = table.getn(levels) + 1, level, -1 do
			local i = i
			numLevels = numLevels + 1
			local frame = CreateFrame("Button", "Hewdrop20Level" .. numLevels, nil)
			if i == 1 then
				if lua51 then
					local old_CloseSpecialWindows = CloseSpecialWindows
					function CloseSpecialWindows()
						local found = old_CloseSpecialWindows()
						if levels[1]:IsShown() then
							self:Close()
							return 1
						end
						return found
					end
				else
					local old_CloseWindows = CloseWindows
					function CloseWindows(ignoreCenter)
						local found = old_CloseWindows(ignoreCenter)
						if levels[1]:IsShown() then
							self:Close()
							return 1
						end
						return found
					end
				end
			end
			levels[i] = frame
			frame.num = i
			frame:SetParent(UIParent)
			frame:SetFrameStrata("FULLSCREEN_DIALOG")
			frame:Hide()
			frame:SetWidth(180)
			frame:SetHeight(10)
			frame:SetFrameLevel(i * 3)
			frame:SetScript("OnHide", function()
				self:Close(level + 1)
			end)
			if frame.SetTopLevel then
				frame:SetTopLevel(true)
			end
			frame:EnableMouse(true)
			frame:EnableMouseWheel(true)
			local backdrop = CreateFrame("Frame", nil, frame)
			backdrop:SetAllPoints(frame)
			backdrop:SetBackdrop(tmp(
				'bgFile', "Interface\\ChatFrame\\ChatFrameBackground",
				'edgeFile', "Interface\\Tooltips\\UI-Tooltip-Border",
				'tile', true,
				'insets', tmp2(
					'left', 5,
					'right', 5,
					'top', 5,
					'bottom', 5
				),
				'tileSize', 16,
				'edgeSize', 16
			))
			backdrop:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b)
			backdrop:SetBackdropColor(0, 0, 0, 1)
			frame:SetScript("OnClick", function()
				self:Close(i)
			end)
			frame:SetScript("OnEnter", function()
				StopCounting(self, i)
			end)
			frame:SetScript("OnLeave", function()
				StartCounting(self, i)
			end)
			frame:SetScript("OnMouseWheel", function()
				Scroll(self, frame, arg1 < 0)
			end)
			if i == 1 then
				frame:SetScript("OnUpdate", function()
					OnUpdate(self, arg1)
				end)
				levels[1].lastDirection = "RIGHT"
				levels[1].lastVDirection = "DOWN"
			else
				levels[i].lastDirection = levels[i - 1].lastDirection
				levels[i].lastVDirection = levels[i - 1].lastVDirection
			end
		end
	end
	local fullscreenFrame = GetFullScreenFrame()
	local l = levels[level]
	local strata, framelevel = l:GetFrameStrata(), l:GetFrameLevel()
	if fullscreenFrame then
		l:SetParent(fullscreenFrame)
	else
		l:SetParent(UIParent)
	end
	l:SetFrameStrata(strata)
	l:SetFrameLevel(framelevel)
	l:SetAlpha(1)
	return l
end

local baseFunc, currentLevel

function Refresh(self, level)
	if type(level) == "number" then
		level = levels[level]
	end
	if not level then
		return
	end
	if baseFunc then
		Clear(self, level)
		currentLevel = level.num
		if type(baseFunc) == "table" then
			if currentLevel == 1 then
				local handler = baseFunc.handler
				if handler then
					local name = tostring(handler)
					if not string.find(name, '^table:') then
						name = string.gsub(name, "|c%x%x%x%x%x%x%x%x(.-)|r", "%1")
						self:AddLine(
							'text', name,
							'isTitle', true
						)
					end
				end
--			elseif level.parentText then
--				self:AddLine(
--					'text', level.parentText,
--					'tooltipTitle', level.parentTooltipTitle,
--					'tooltipText', level.parentTooltipText,
--					'tooltipFunc', level.parentTooltipFunc,
--					'isTitle', true
--				)
			end
			self:FeedAceOptionsTable(baseFunc)
			if currentLevel == 1 then
				self:AddLine(
					'text', CLOSE,
					'closeWhenClicked', true
				)
			end
		else
--			if level.parentText then
--				self:AddLine(
--					'text', level.parentText,
--					'tooltipTitle', level.parentTooltipTitle,
--					'tooltipText', level.parentTooltipText,
--					'tooltipFunc', level.parentTooltipFunc,
--					'isTitle', true
--				)
--			end
			baseFunc(currentLevel, level.value, levels[level.num - 1] and levels[level.num - 1].value, levels[level.num - 2] and levels[level.num - 2].value, levels[level.num - 3] and levels[level.num - 3].value, levels[level.num - 4] and levels[level.num - 4].value)
		end
		currentLevel = nil
		CheckSize(self, level)
	end
end

function Hewdrop:Refresh(level)
	Refresh(self, levels[level])
end

function Hewdrop:IsOpen(parent)
	return levels[1] and levels[1]:IsShown() and (not parent or parent == levels[1].parent or parent == levels[1]:GetParent())
end

function Hewdrop:GetOpenedParent()
	return (levels[1] and levels[1]:IsShown()) and (levels[1].parent or levels[1]:GetParent())
end

function Open(self, parent, func, level, value, point, relativePoint, cursorX, cursorY)
	self:Close(level)
	if HewdropLib then
		local d = HewdropLib:GetInstance('1.0')
		local ret, val = pcall(d, IsOpen, d)
		if ret and val then
			HewdropLib:GetInstance('1.0'):Close()
		end
	end
	parent:GetCenter()
	local frame = AcquireLevel(self, level)
	if level == 1 then
		frame.lastDirection = "RIGHT"
		frame.lastVDirection = "DOWN"
	else
		frame.lastDirection = levels[level - 1].lastDirection
		frame.lastVDirection = levels[level - 1].lastVDirection
	end
	frame:SetFrameStrata("FULLSCREEN_DIALOG")
	frame:ClearAllPoints()
	frame.parent = parent
	frame:SetPoint("LEFT", UIParent, "RIGHT", 10000, 0)
	frame:Show()
	if level == 1 then
		baseFunc = func
	end
	levels[level].value = value
--	levels[level].parentText = parent.text and parent.text:GetText() or nil
--	levels[level].parentTooltipTitle = parent.tooltipTitle
--	levels[level].parentTooltipText = parent.tooltipText
--	levels[level].parentTooltipFunc = parent.tooltipFunc
	if parent.arrow then
--		parent.arrow:SetVertexColor(0.2, 0.6, 0)
		parent.arrow:SetHeight(24)
		parent.arrow:SetWidth(24)
	end
	relativePoint = relativePoint or point
	Refresh(self, levels[level])
	if point or (cursorX and cursorY) then
		frame:ClearAllPoints()
		if cursorX and cursorY then
			local curX, curY = GetScaledCursorPosition()
			if curY < GetScreenHeight() / 2 then
				point, relativePoint = "BOTTOM", "BOTTOM"
			else
				point, relativePoint = "TOP", "TOP"
			end
			if curX < GetScreenWidth() / 2 then
				point, relativePoint = point .. "LEFT", relativePoint .. "RIGHT"
			else
				point, relativePoint = point .. "RIGHT", relativePoint .. "LEFT"
			end
		end
		frame:SetPoint(point, parent, relativePoint)
		if cursorX and cursorY then
			local left = frame:GetLeft()
			local width = frame:GetWidth()
			local bottom = frame:GetBottom()
			local height = frame:GetHeight()
			local curX, curY = GetScaledCursorPosition()
			frame:ClearAllPoints()
			relativePoint = relativePoint or point
			if point == "BOTTOM" or point == "TOP" then
				if curX < GetScreenWidth() / 2 then
					point = point .. "LEFT"
				else
					point = point .. "RIGHT"
				end
			elseif point == "CENTER" then
				if curX < GetScreenWidth() / 2 then
					point = "LEFT"
				else
					point = "RIGHT"
				end
			end
			local xOffset, yOffset = 0, 0
			if curY > GetScreenHeight() / 2 then
				yOffset = -height
			end
			if curX > GetScreenWidth() / 2 then
				xOffset = -width
			end
			frame:SetPoint(point, parent, relativePoint, curX - left + xOffset, curY - bottom + yOffset)
			if level == 1 then
				frame.lastDirection = "RIGHT"
			end
		elseif cursorX then
			local left = frame:GetLeft()
			local width = frame:GetWidth()
			local curX, curY = GetScaledCursorPosition()
			frame:ClearAllPoints()
			relativePoint = relativePoint or point
			if point == "BOTTOM" or point == "TOP" then
				if curX < GetScreenWidth() / 2 then
					point = point .. "LEFT"
				else
					point = point .. "RIGHT"
				end
			elseif point == "CENTER" then
				if curX < GetScreenWidth() / 2 then
					point = "LEFT"
				else
					point = "RIGHT"
				end
			end
			frame:SetPoint(point, parent, relativePoint, curX - left - width / 2, 0)
			if level == 1 then
				frame.lastDirection = "RIGHT"
			end
		elseif cursorY then
			local bottom = frame:GetBottom()
			local height = frame:GetHeight()
			local curX, curY = GetScaledCursorPosition()
			frame:ClearAllPoints()
			relativePoint = relativePoint or point
			if point == "LEFT" or point == "RIGHT" then
				if curX < GetScreenHeight() / 2 then
					point = point .. "BOTTOM"
				else
					point = point .. "TOP"
				end
			elseif point == "CENTER" then
				if curX < GetScreenHeight() / 2 then
					point = "BOTTOM"
				else
					point = "TOP"
				end
			end
			frame:SetPoint(point, parent, relativePoint, 0, curY - bottom - height / 2)
			if level == 1 then
				frame.lastDirection = "DOWN"
			end
		end
		if (strsub(point, 1, 3) ~= strsub(relativePoint, 1, 3)) then
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

function Hewdrop:IsRegistered(parent)
	return not not self.registry[parent]
end

function Hewdrop:Register(parent, k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
	if self.registry[parent] then
		self:Unregister(parent)
	end
	local info = new(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
	if type(info.children) == "table" then
		local err, position = validateOptions(info.children)

		if err then
			if position then
				Hewdrop:error(position .. ": " .. err)
			else
				Hewdrop:error(err)
			end
		end
	end
	self.registry[parent] = info
	if not info.dontHook and not self.onceRegistered[parent] then
		if parent:HasScript("OnMouseUp") then
			local script = parent:GetScript("OnMouseUp")
			parent:SetScript("OnMouseUp", function()
				if script then
					script()
				end
				if arg1 == "RightButton" and self.registry[parent] then
					if self:IsOpen(parent) then
						self:Close()
					else
						self:Open(parent)
					end
				end
			end)
		end
		if parent:HasScript("OnMouseDown") then
			local script = parent:GetScript("OnMouseDown")
			parent:SetScript("OnMouseDown", function()
				if script then
					script()
				end
				if self.registry[parent] then
					self:Close()
				end
			end)
		end
	end
	self.onceRegistered[parent] = true
end

function Hewdrop:Unregister(parent)
	self.registry[parent] = nil
end

function Hewdrop:Open(parent, k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
	local info
	if type(k1) == "table" and k1[0] and k1.IsFrameType and self.registry[k1] then
		info = tmp()
		for k,v in pairs(self.registry[k1]) do
			info[k] = v
		end
	else
		info = tmp(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
		if self.registry[parent] then
			for k,v in pairs(self.registry[parent]) do
				if info[k] == nil then
					info[k] = v
				end
			end
		end
	end
	local point = info.point
	local relativePoint = info.relativePoint
	local cursorX = info.cursorX
	local cursorY = info.cursorY
	if type(point) == "function" then
		local b
		point, b = point(parent)
		if b then
			relativePoint = b
		end
	end
	if type(relativePoint) == "function" then
		relativePoint = relativePoint(parent)
	end
	Open(self, parent, info.children, 1, nil, point, relativePoint, cursorX, cursorY)
end

function Clear(self, level)
	if level then
		if level.buttons then
			for i = table.getn(level.buttons), 1, -1 do
				ReleaseButton(self, level, i)
			end
		end
	end
end

function Hewdrop:Close(level)
	if DropDownList1:IsShown() then
		DropDownList1:Hide()
	end
	if HewdropLib then
		local d = HewdropLib:GetInstance('1.0')
		local ret, val = pcall(d, IsOpen, d)
		if ret and val then
			HewdropLib:GetInstance('1.0'):Close()
		end
	end
	if not level then
		level = 1
	end
	if level == 1 and levels[level] then
		levels[level].parented = false
	end
	if level > 1 and levels[level-1].buttons then
		local buttons = levels[level-1].buttons
		for _,button in ipairs(buttons) do
			button.arrow:SetWidth(16)
			button.arrow:SetHeight(16)
--			button.arrow:SetVertexColor(1, 1, 1)
		end
	end
	if sliderFrame and sliderFrame.level >= level then
		sliderFrame:Hide()
	end
	if editBoxFrame and editBoxFrame.level >= level then
		editBoxFrame:Hide()
	end
	for i = level, table.getn(levels) do
		Clear(self, levels[level])
		levels[level]:Hide()
		levels[i]:ClearAllPoints()
		levels[i]:SetPoint("CENTER", UIParent, "CENTER")
	end
end

function Hewdrop:AddLine(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
	local info = tmp(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5, k6, v6, k7, v7, k8, v8, k9, v9, k10, v10, k11, v11, k12, v12, k13, v13, k14, v14, k15, v15, k16, v16, k17, v17, k18, v18, k19, v19, k20, v20)
	local level = info.level or currentLevel
	info.level = nil
	local button = AcquireButton(self, level)
	if not next(info) then
		info.disabled = true
	end
	button.disabled = info.isTitle or info.notClickable or info.disabled
	button.isTitle = info.isTitle
	button.notClickable = info.notClickable
	if button.isTitle then
		button.text:SetFontObject(GameFontNormalSmall)
	elseif button.notClickable then
		button.text:SetFontObject(GameFontHighlightSmall)
	elseif button.disabled then
		button.text:SetFontObject(GameFontDisableSmall)
	else
		button.text:SetFontObject(GameFontHighlightSmall)
	end
	if info.disabled then
		button.arrow:SetDesaturated(true)
		button.check:SetDesaturated(true)
	else
		button.arrow:SetDesaturated(false)
		button.check:SetDesaturated(false)
	end
	if info.textR and info.textG and info.textB then
		button.textR = info.textR
		button.textG = info.textG
		button.textB = info.textB
		button.text:SetTextColor(button.textR, button.textG, button.textB)
	else
		button.text:SetTextColor(button.text:GetFontObject():GetTextColor())
	end
	button.notCheckable = info.notCheckable
	button.text:SetPoint("LEFT", button, "LEFT", button.notCheckable and 0 or 24, 0)
	button.checked = not info.notCheckable and info.checked
	button.isRadio = not info.notCheckable and info.isRadio
	if info.isRadio then
		button.check:Show()
		button.check:SetTexture(info.checkIcon or "Interface\\Buttons\\UI-RadioButton")
		if button.checked then
			button.check:SetTexCoord(0.25, 0.5, 0, 1)
			button.check:SetVertexColor(1, 1, 1, 1)
		else
			button.check:SetTexCoord(0, 0.25, 0, 1)
			button.check:SetVertexColor(1, 1, 1, 0.5)
		end
		button.radioHighlight:SetTexture(info.checkIcon or "Interface\\Buttons\\UI-RadioButton")
		button.check:SetWidth(16)
		button.check:SetHeight(16)
	elseif info.icon then
		button.check:Show()
		button.check:SetTexture(info.icon)
		if info.iconWidth and info.iconHeight then
			button.check:SetWidth(info.iconWidth)
			button.check:SetHeight(info.iconHeight)
		else
			button.check:SetWidth(16)
			button.check:SetHeight(16)
		end
		if info.iconCoordLeft and info.iconCoordRight and info.iconCoordTop and info.iconCoordBottom then
			button.check:SetTexCoord(info.iconCoordLeft, info.iconCoordRight, info.iconCoordTop, info.iconCoordBottom)
		elseif string.find(info.icon, "^Interface\\Icons\\") then
			button.check:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		else
			button.check:SetTexCoord(0, 1, 0, 1)
		end
		button.check:SetVertexColor(1, 1, 1, 1)
	else
		if button.checked then
			if info.checkIcon then
				button.check:SetWidth(16)
				button.check:SetHeight(16)
				button.check:SetTexture(info.checkIcon)
				if string.find(info.checkIcon, "^Interface\\Icons\\") then
					button.check:SetTexCoord(0.05, 0.95, 0.05, 0.95)
				else
					button.check:SetTexCoord(0, 1, 0, 1)
				end
			else
				button.check:SetWidth(24)
				button.check:SetHeight(24)
				button.check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
				button.check:SetTexCoord(0, 1, 0, 1)
			end
			button.check:SetVertexColor(1, 1, 1, 1)
		else
			button.check:SetVertexColor(1, 1, 1, 0)
		end
	end
	if not button.disabled then
		button.func = info.func
	end
	button.hasColorSwatch = info.hasColorSwatch
	if button.hasColorSwatch then
		button.colorSwatch:Show()
		button.colorSwatch.texture:Show()
		button.r = info.r or 1
		button.g = info.g or 1
		button.b = info.b or 1
		button.colorSwatch.texture:SetTexture(button.r, button.g, button.b)
		button.checked = false
		button.func = nil
		button.colorFunc = info.colorFunc
		button.colorArg1 = info.colorArg1
		button.colorArg2 = info.colorArg2
		button.colorArg3 = info.colorArg3
		button.colorArg4 = info.colorArg4
		button.hasOpacity = info.hasOpacity
		button.opacity = info.opacity or 1
	else
		button.colorSwatch:Hide()
		button.colorSwatch.texture:Hide()
	end
	button.hasArrow = not button.hasColorSwatch and (info.value or info.hasSlider or info.hasEditBox) and info.hasArrow
	if button.hasArrow then
		button.arrow:SetAlpha(1)
		if info.hasSlider then
			button.hasSlider = true
			button.sliderMin = info.sliderMin or 0
			button.sliderMax = info.sliderMax or 1
			button.sliderStep = info.sliderStep or 0
			button.sliderIsPercent = info.sliderIsPercent and true or false
			button.sliderMinText = info.sliderMinText or button.sliderIsPercent and string.format("%.0f%%", button.sliderMin * 100) or button.sliderMin
			button.sliderMaxText = info.sliderMaxText or button.sliderIsPercent and string.format("%.0f%%", button.sliderMax * 100) or button.sliderMax
			button.sliderFunc = info.sliderFunc
			button.sliderValue = info.sliderValue
			button.sliderArg1 = info.sliderArg1
			button.sliderArg2 = info.sliderArg2
			button.sliderArg3 = info.sliderArg3
			button.sliderArg4 = info.sliderArg4
		elseif info.hasEditBox then
			button.hasEditBox = true
			button.editBoxText = info.editBoxText or ""
			button.editBoxFunc = info.editBoxFunc
			button.editBoxArg1 = info.editBoxArg1
			button.editBoxArg2 = info.editBoxArg2
			button.editBoxArg3 = info.editBoxArg3
			button.editBoxArg4 = info.editBoxArg4
			button.editBoxChangeFunc = info.editBoxChangeFunc
			button.editBoxChangeArg1 = info.editBoxChangeArg1
			button.editBoxChangeArg2 = info.editBoxChangeArg2
			button.editBoxChangeArg3 = info.editBoxChangeArg3
			button.editBoxChangeArg4 = info.editBoxChangeArg4
			button.editBoxValidateFunc = info.editBoxValidateFunc
			button.editBoxValidateArg1 = info.editBoxValidateArg1
			button.editBoxValidateArg2 = info.editBoxValidateArg2
			button.editBoxValidateArg3 = info.editBoxValidateArg3
			button.editBoxValidateArg4 = info.editBoxValidateArg4
			button.editBoxIsKeybinding = info.editBoxIsKeybinding
		else
			button.value = info.value
		end
	else
		button.arrow:SetAlpha(0)
	end
	button.arg1 = info.arg1
	button.arg2 = info.arg2
	button.arg3 = info.arg3
	button.arg4 = info.arg4
	button.closeWhenClicked = info.closeWhenClicked
	button.textHeight = info.textHeight or UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT or 10
	local font,_ = button.text:GetFont()
	button.text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", button.textHeight)
	button:SetHeight(button.textHeight + 6)
	button.text:SetPoint("RIGHT", button.arrow, (button.hasColorSwatch or button.hasArrow) and "LEFT" or "RIGHT")
	button.text:SetJustifyH(info.justifyH or "LEFT")
	button.text:SetText(info.text)
	button.tooltipTitle = info.tooltipTitle
	button.tooltipText = info.tooltipText
	button.tooltipFunc = info.tooltipFunc
	button.tooltipArg1 = info.tooltipArg1
	button.tooltipArg2 = info.tooltipArg2
	button.tooltipArg3 = info.tooltipArg3
	button.tooltipArg4 = info.tooltipArg4
	if not button.tooltipTitle and not button.tooltipText and not button.tooltipFunc and not info.isTitle then
		button.tooltipTitle = info.text
	end
	if type(button.func) == "string" then
		self:assert(type(button.arg1) == "table", "Cannot call method " .. button.func .. " on a non-table")
		self:assert(type(button.arg1[button.func]) == "function", "Method " .. button.func .. " nonexistant.")
	end
end

-- Standalone initialization (no AceLibrary)
local function initializeHewdrop()
	Hewdrop.minor = MINOR_VERSION
	Hewdrop.registry = Hewdrop.registry or {}
	Hewdrop.onceRegistered = Hewdrop.onceRegistered or {}

	-- Only set up hooks once
	if not Hewdrop._initialized then
		Hewdrop._initialized = true

		local WorldFrame_OnMouseDown = WorldFrame:GetScript("OnMouseDown")
		local WorldFrame_OnMouseUp = WorldFrame:GetScript("OnMouseUp")
		local oldX, oldY, clickTime
		WorldFrame:SetScript("OnMouseDown", function()
			oldX,oldY = GetCursorPosition()
			clickTime = GetTime()
			if WorldFrame_OnMouseDown then
				WorldFrame_OnMouseDown()
			end
		end)

		WorldFrame:SetScript("OnMouseUp", function()
			local x,y = GetCursorPosition()
			if not oldX or not oldY or not x or not y or not clickTime then
				Hewdrop:Close()
				if WorldFrame_OnMouseUp then
					WorldFrame_OnMouseUp()
				end
				return
			end
			local d = math.abs(x - oldX) + math.abs(y - oldY)
			if d <= 5 and GetTime() - clickTime < 0.5 then
				Hewdrop:Close()
			end
			if WorldFrame_OnMouseUp then
				WorldFrame_OnMouseUp()
			end
		end)

		if hooksecurefunc then
			hooksecurefunc(DropDownList1, "Show", function()
				if levels[1] and levels[1]:IsVisible() then
					Hewdrop:Close()
				end
			end)
		else
			local DropDownList1_Show = DropDownList1.Show
			function DropDownList1.Show(DropDownList1)
				if levels[1] and levels[1]:IsVisible() then
					Hewdrop:Close()
				end
				DropDownList1_Show(DropDownList1)
			end
		end

		if hooksecurefunc then
			hooksecurefunc("HideDropDownMenu", function()
				if levels[1] and levels[1]:IsVisible() then
					Hewdrop:Close()
				end
			end)
		else
			local old_HideDropDownMenu = HideDropDownMenu
			function HideDropDownMenu(num)
				if levels[1] and levels[1]:IsVisible() then
					Hewdrop:Close()
				end
				old_HideDropDownMenu(num)
			end
		end

		if hooksecurefunc then
			hooksecurefunc("CloseDropDownMenus", function()
				if levels[1] and levels[1]:IsVisible() then
					Hewdrop:Close()
				end
			end)
		else
			local old_CloseDropDownMenus = CloseDropDownMenus
			function CloseDropDownMenus(num)
				if levels[1] and levels[1]:IsVisible() then
					Hewdrop:Close()
				end
				old_CloseDropDownMenus(num)
			end
		end
	end
	levels = {}
	buttons = {}
end

-- Initialize and export to global
initializeHewdrop()
_G.ATWHewdrop = Hewdrop
