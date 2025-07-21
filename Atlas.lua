local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.UI = AtlasTW.UI or {}
local L = AtlasTW.Local
local atlas_Ints_Ent_DropDown = {}
--local atlasData = {}
local frame
local loadingStartTime -- Время загрузки

-- Color constants organized in a table
local Colors = {
    BLUE = "|cff6666ff",
    GREY = "|cff999999",
    GREEN = "|cff66cc33",
    RED = "|cffcc6666",
    ORANGE = "|cffcc9933",
    PURPLE = "|cff9900ff",
    WHITE = "|cffffffff"
}

AtlasTW.Version = GetAddOnMetadata(AtlasTW.Name, "Version")

local function debug(info)
	if AtlasTW.DEBUGMODE then
		DEFAULT_CHAT_FRAME:AddMessage("["..AtlasTW.Name.."] "..info)
	end
end

-- Events: HookScript (function)
local function hookScript(frame1, scriptType, handler)
    -- Store original script handler
    local originalScript = frame1:GetScript(scriptType)
    -- Set new script that chains both handlers
    frame1:SetScript(scriptType, function()
        -- Call original handler if it exists
        if originalScript then
            originalScript()
        end
        -- Call our new handler
        handler()
    end)
end

local function setupPfUITooltip()
	if not (AtlasTWOptions.QuestCompareTooltip and IsAddOnLoaded("pfUI") and not AtlasTW.Quest.Tooltip.backdrop) then
		return
	end
	-- Create pfUI tooltip backdrop
	pfUI.api.CreateBackdrop(AtlasTW.Quest.Tooltip)
	pfUI.api.CreateBackdropShadow(AtlasTW.Quest.Tooltip)
	-- Setup equipment comparison if available
	if pfUI.eqcompare then
		hookScript(AtlasTW.Quest.Tooltip, "OnShow", pfUI.eqcompare.GameTooltipShow)
		hookScript(AtlasTW.Quest.Tooltip, "OnHide", function()
			ShoppingTooltip1:Hide()
			ShoppingTooltip2:Hide()
		end)
	end
end

local function PerformSearch(data, search_text)

	local function makeBossLineText(items, new, n, searchText, format_line)
		for _, item in ipairs(items or {}) do
			local name = item.name
			if name then
				local line = format_line(item)
				-- Если поисковый запрос пустой, показываем все элементы
				if searchText == "" or string.find(string.lower(line), searchText) then
					new[n] = {
						line = line,
						name = name,
					}
					n = n + 1
				end
			end
		end
		return n
	end

	local new = {}
	local n = 1
	n = makeBossLineText(data["Reputation"], new, n, search_text, function(item)
		return Colors.ORANGE .. L["Reputation"] .. ": " .. item.name
	end)
	n = makeBossLineText(data["Keys"], new, n, search_text, function(item)
		return Colors.GREEN .. L["Key"] .. ": " .. item.name .. (item.info and " <" .. item.info .. ">" or "")
	end)
	n = makeBossLineText(data["Bosses"], new, n, search_text, function(item)
		return Colors.WHITE .. (item.prefix and (item.prefix .. " ") or "") .. item.name
	end)
	return new
end

--Removal of articles in map names (for proper alphabetic sorting)
--For example: "The Deadmines" will become "Deadmines"
--Thus it will be sorted under D and not under T
local function atlas_SanitizeName(text)
	text = string.lower(text)
	if AtlasSortIgnore then
		for _,v in pairs(AtlasSortIgnore) do
			local match
			if string.gmatch then
				match = string.gmatch(text, v)()
			else
				match = string.gfind(text, v)()
			end
			if match and (string.len(text) - string.len(match)) <= 4 then
				return match
			end
		end
	end
	return text
end

--Comparator function for alphabetic sorting of maps
--yey, one function for everything
local function atlas_SortZonesAlpha(a, b)
	local aa = atlas_SanitizeName(AtlasMaps[a].ZoneName)
	local bb = atlas_SanitizeName(AtlasMaps[b].ZoneName)
	return aa < bb
end

--Updates the appearance of the lock button based on the status of AtlasLocked
local function atlas_UpdateLock()
	if(AtlasTWOptions.AtlasLocked) then
		AtlasLockNorm:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\LockButton-Locked-Up")
		AtlasLockPush:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\LockButton-Locked-Down")
	else
		AtlasLockNorm:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\LockButton-Unlocked-Up")
		AtlasLockPush:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\LockButton-Unlocked-Down")
	end
end

--Initializes everything relating to saved variables and data in other lua files
--This should be called ONLY when we're sure our variables are in memory
local function Atlas_Init()
	-- Инициализируем UI фреймы
	AtlasLoot_InitializeUI()

	--clear saved vars for a new ver (or a new install!)
	if AtlasTWOptions == nil or AtlasTWOptions["AtlasVersion"] ~= AtlasTW.Version or AtlasTWCharDB.FirstTime then
		AtlasTW.OptionDefaultSettings()
	end

	--populate the dropdown lists...yeeeah this is so much nicer!
	-- Добавить валидацию dropdown данных
    if AtlasTW.DEBUGMODE then
        local dropdownErrors = AtlasTW_DropDownValidateData()
        if table.getn(dropdownErrors) > 0 then
            for _, error in pairs(dropdownErrors) do
                debug("DropDown validation error: " .. error)
            end
        end
    end

	AtlasTW.PopulateDropdowns()

	if AtlasTW.DropDowns[AtlasTWOptions.AtlasType] == nil then
		AtlasTWOptions.AtlasType = 1
		AtlasTWOptions.AtlasZone = 1
	end

	--Now that saved variables have been loaded, update everything accordingly
	AtlasTW.Refresh()
	atlas_UpdateLock()
	AtlasTW.OptionsUpdateAlpha()
	AtlasFrame:SetClampedToScreen(AtlasTWOptions.AtlasClamped)
	AtlasTW.MinimapButtonUpdatePosition()
	AtlasTW.OptionsInit()
end

-- Performs a search through Atlas data based on input text
-- @param text The search text to filter Atlas entries by
function AtlasTW.Search(text)
	if not text then text = "" end
	local search_text = string.lower(text)
	search_text = string.gsub(search_text, "([%^%$%(%)%%%.%[%]%+%-%?])", "%%%1")
	search_text = string.gsub(search_text, "%*", ".*")
	local data = PerformSearch(AtlasSearchEditBox.Data, search_text)

	--populate the scroll frame entries list, the update func will do the rest
	local i = 1
	while ( data and data[i] and data[i].line ~= nil ) do
		AtlasTW.ScrollList[i] = { line=data[i].line, name=data[i].name }
		i = i + 1
	end
	AtlasTW.CurrentLine = i - 1
end

--Main Atlas event handler
function AtlasTW.OnEvent()
	if arg1 == AtlasTW.Name then
		Atlas_Init()
	elseif not arg1 then
		AtlasTW.isHorde = UnitFactionGroup("player") == "Horde"
	end
	if event == "ADDON_LOADED" then
		if not loadingStartTime then
			loadingStartTime = GetTime()
		end
	elseif event == "PLAYER_ENTERING_WORLD" and loadingStartTime then
		local loadingTime = (GetTime() - loadingStartTime) * 1000
		DEFAULT_CHAT_FRAME:AddMessage(string.format("Load time: %.2f ", loadingTime))
		loadingStartTime = nil
	end
end

function AtlasTW.PopulateDropdowns()
    local sortType = AtlasTW_DropDownSortOrder[AtlasTWOptions.AtlasSortBy]
    local subcatOrder = AtlasTW_DropDownGetLayoutOrder(sortType)
    local layouts = AtlasTW_DropDownGetLayout(sortType)
    for n = 1, getn(subcatOrder) do
        local subcatItems = layouts[subcatOrder[n]]
        AtlasTW.DropDowns[n] = {}
        for _,v in pairs(subcatItems) do
            table.insert(AtlasTW.DropDowns[n], v)
        end
        if subcatOrder[n] ~= L["Showing all instances_1"] and subcatOrder[n] ~= L["Showing all instances_2"] and subcatOrder[n] ~= L["World"] then
            table.sort(AtlasTW.DropDowns[n], atlas_SortZonesAlpha)
        end
    end
end

--Simple function to toggle the Atlas frame's lock status and update it's appearance
function AtlasTW.ToggleLock()
	AtlasTWOptions.AtlasLocked = not AtlasTWOptions.AtlasLocked
	atlas_UpdateLock()
end

local function atlasSwitchDD_Set(index)
	for k,v in pairs(AtlasTW.DropDowns) do
		for k2,v2 in pairs(v) do
			if v2 == atlas_Ints_Ent_DropDown[index] then
				AtlasTWOptions.AtlasType = k
				AtlasTWOptions.AtlasZone = k2
			end
		end
	end
	AtlasTW.FrameDropDownTypeOnShow()
	AtlasTW.FrameDropDownOnShow()
	AtlasTW.Refresh()
end

local function atlasSwitchDD_OnClick()
	atlasSwitchDD_Set(this:GetID())
end

local function atlasSwitchDD_OnLoad()
	local info
	for _,v in pairs(atlas_Ints_Ent_DropDown) do
		info = {
			text = AtlasMaps[v].ZoneName,
			func = atlasSwitchDD_OnClick
		}
		UIDropDownMenu_AddButton(info)
	end
end

local function atlasSwitchDD_Sort(a, b)
	local aa = AtlasMaps[a].ZoneName
	local bb = AtlasMaps[b].ZoneName
	return aa < bb
end

--Refreshes the Atlas frame, usually because a new map needs to be displayed
--The zoneID variable represents the internal name used for each map
--Also responsible for updating all the text when a map is changed
function AtlasTW.Refresh()
	local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
	DEFAULT_CHAT_FRAME:AddMessage("AtlasTW.Refresh: Загружаем инстанс " .. (zoneID or "nil"))
	--local data = AtlasMaps
	local data = AtlasTW.InstanceData
	local base = {}

	--If a first time user, set up options
	if AtlasTWCharDB.FirstTime == nil or AtlasTWCharDB.FirstTime == true then
		StaticPopup_Show("ATLASLOOT_SETUP")
		AtlasTWCharDB.FirstTime = false
	end

	--Reset which loot page is 'current'
	AtlasLootItemsFrame.activeBoss = nil

	--Get boss name information
	for key, value in pairs(data[zoneID] or {}) do
		base[key] = value
	end

	--Display the selected texture
	AtlasMap:SetTexture(AtlasTW.MAPPATH..zoneID)

	--Update the quest frame
	AtlasTW.CurrentMap = zoneID
	AtlasTW.Quest.Update()

	--Setup info panel above boss listing
	local function SetAtlasText(frame2, label, value, color)
		local text = color or ""
		if value then
			if label then
				text = text..L[label] .. ": "
			end
			if type(value) == "table" then
				text = text .. value[1] .. "-" .. value[2]
			else
				text = text .. value
			end
		end
		frame2:SetText(text)
	end

	local zoneName = base.Name
	if AtlasTWOptions.AtlasAcronyms and base.Acronym ~= nil then
		zoneName = zoneName .. Colors.RED .. " [" .. base.Acronym .. "]"
	end
	AtlasTWZoneText:SetText(zoneName)
	SetAtlasText(AtlasTWLocationText, "Location", base.Location)
	SetAtlasText(AtlasTWLevelRangeText, "Level", base.Level)
	SetAtlasText(AtlasTWPlayerLimitText, "Player Limit", base.MaxPlayers)
	SetAtlasText(AtlasTWAttunText, nil, base.Attunement and L["Attunement Required"], Colors.RED)
	SetAtlasText(AtlasTWDamageTypeText, "Damage", base.DamageType, Colors.RED)
	local entranceText = {}
	for i, entranceData in ipairs(base.Entrances or {}) do
		if entranceData and entranceData.letter then
			entranceText[i] = entranceData.letter
			if entranceData.info then
				entranceText[i] = entranceText[i] .. " (" .. entranceData.info .. ")"
			end
		end
	end
	AtlasTWTextentr:SetText("")
	for i = 1, 5 do
		SetAtlasText(_G["AtlasTWTextentr"..i], nil, entranceText[i], Colors.BLUE)
		if entranceText[i] then
			AtlasTWTextentr:SetText(L["Entrances"])
		end
	end

	--atlasData = base

	if (data.Search ~= false) then
		AtlasSearchEditBox:Show()
		AtlasTWNoSearch:Hide()
	else
		AtlasSearchEditBox:Hide()
		AtlasTWNoSearch:Show()
		ATLAS_SEARCH_METHOD = nil
	end

	--Store zoneLines for search
	AtlasSearchEditBox.Data = base

	--populate the scroll frame entries list, the update func will do the rest
	AtlasTW.Search("")
	AtlasSearchEditBox:SetText("")
	AtlasSearchEditBox:ClearFocus()

		--create and align any new entry buttons that we need
 	for i = 1, AtlasTW.CurrentLine do
		if not _G["AtlasBossLine"..i] then
			frame = AtlasLoot_CreateButtonFromTemplate("AtlasBossLine"..i, AtlasFrame, "AtlasLootNewBossLineTemplate")
			frame:SetFrameStrata("MEDIUM")
			if i ~= 1 then
				frame:SetPoint("TOPLEFT", "AtlasBossLine"..(i-1), "BOTTOMLEFT")
			else
				frame:SetPoint("TOPLEFT", "AtlasTWScrollBar", "TOPLEFT", 16, -3)
			end
			-- Ограничиваем кнопки границами скролла (24 линии * 15 пикселей = 360 пикселей)
			if i > 24 then
				frame:EnableMouse(false)
				frame:Hide()
			end
		else
			_G["AtlasBossLine"..i.."_Loot"]:Hide()
			_G["AtlasBossLine"..i.."_Selected"]:Hide()
			-- Также ограничиваем существующие кнопки
			if i > 24 then
				_G["AtlasBossLine"..i]:EnableMouse(false)
				_G["AtlasBossLine"..i]:Hide()
			end
		end
	end

	--Hide the loot frame now that a pristine Atlas instance is created
	AtlasLootItemsFrame:Hide()

	-- Обновляем скроллбар после создания элементов
	AtlasTW.Loot.ScrollBarUpdate()

	--see if we should display the entrance/instance button or not, and decide what it should say
	local matchFound = {}
	local sayEntrance = nil
	for k,v in pairs(AtlasTW.EntToInstMatches) do
		if k == zoneID then
			matchFound = v
			sayEntrance = false
		end
	end
	if not matchFound[1] then
		for k,v in pairs(AtlasTW.InstToEntMatches) do
			if k == zoneID then
				matchFound = v
				sayEntrance = true
			end
		end
	end

	--set the button's text, populate the dropdown menu, and show or hide the button
	if matchFound[1] ~= nil then
		atlas_Ints_Ent_DropDown = {}
		for _,v in pairs(matchFound) do
			table.insert(atlas_Ints_Ent_DropDown, v)
		end
		table.sort(atlas_Ints_Ent_DropDown, atlasSwitchDD_Sort)
		if sayEntrance then
			AtlasSwitchButton:SetText(L["Entrance"])
		else
			AtlasSwitchButton:SetText(L["Instance"])
		end
		AtlasSwitchButton:Show()
		UIDropDownMenu_Initialize(AtlasSwitchDD, atlasSwitchDD_OnLoad)
	else
		AtlasSwitchButton:Hide()
	end
end

--when the switch button is clicked
--we can basically assume that there's a match
--find it, set it, then update menus and the maps
function AtlasTW.SwitchButtonOnClick()
	if getn(atlas_Ints_Ent_DropDown) == 1 then
		--one link, so we can just go there right away
		atlasSwitchDD_Set(1)
	else
		--more than one link, so it's dropdown menu time
		ToggleDropDownMenu(1, nil, AtlasSwitchDD, "AtlasSwitchButton", 0, 0)
	end
end

--Called whenever an item in the map type dropdown menu is clicked
--Sets the main dropdown menu contents to reflect the category of map selected
local function atlasFrameDropDownType_OnClick()
	local thisID = this:GetID()
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDownType, thisID)
	AtlasTWOptions.AtlasType = thisID
	AtlasTWOptions.AtlasZone = 1
	AtlasTW.FrameDropDownOnShow()
	AtlasTW.Refresh()
end

--Function used to initialize the map type dropdown menu
local function atlasFrameDropDownType_Initialize()
	local info
    local sortType = AtlasTW_DropDownSortOrder[AtlasTWOptions.AtlasSortBy]
    local subcatOrder = AtlasTW_DropDownGetLayoutOrder(sortType)
    for i = 1, getn(subcatOrder) do
        info = {
            text = subcatOrder[i],
            func = atlasFrameDropDownType_OnClick
        }
        UIDropDownMenu_AddButton(info)
    end
end

--Called whenever an item in the main dropdown menu is clicked
--Sets the newly selected map as current and refreshes the frame
local function atlasFrameDropDown_OnClick()
	local i = this:GetID()
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDown, i)
	AtlasTWOptions.AtlasZone = i
	AtlasTW.Refresh()
end

--Function used to initialize the main dropdown menu
--Looks at the status of AtlasType to determine how to populate the list
local function atlasFrameDropDown_Initialize()
	local info
	for _,v in pairs(AtlasTW.DropDowns[AtlasTWOptions.AtlasType]) do
		info = {
			text = AtlasMaps[v].ZoneName,
			func = atlasFrameDropDown_OnClick
		}
		UIDropDownMenu_AddButton(info)
	end
end

--Modifies the value of GetRealZoneText to account for some naming conventions
--Always use this function instead of GetRealZoneText within Atlas
local function atlas_GetFixedZoneText()
	local currentZone = GetRealZoneText()
	if AtlasZoneSubstitutions[currentZone] then
		return AtlasZoneSubstitutions[currentZone]
	end
	return currentZone
end

--Checks the player's current location against all Atlas maps
--If a match is found display that map right away
local function atlasAutoSelect()
	local currentZone = atlas_GetFixedZoneText()
	local currentSubZone = GetSubZoneText()
	debug("Using auto-select to open the best map.")

	if AtlasTW.AssocDefaults[currentZone] then
		debug("You're in a zone where SubZone data is relevant.")
		if AtlasTW.SubZoneData[currentSubZone] then
			debug("There's data for your current SubZone.")
			for ka,va in pairs(AtlasTW.DropDowns) do
				for kb,vb in pairs(va) do
					if AtlasTW.SubZoneData[currentSubZone] == vb then
						AtlasTWOptions.AtlasType = ka
						AtlasTWOptions.AtlasZone = kb
						AtlasTW.Refresh()
						debug("Map changed directly based on SubZone data.")
						return
					end
				end
			end
		else
			debug("No applicable SubZone data exists.")
			if currentZone == AtlasTW.SubZoneAssoc[AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]] then
				debug("You're in the same instance as the former map. Doing nothing.")
				return
			else
				for ka,va in pairs(AtlasTW.DropDowns) do
					for kb,vb in pairs(va) do
						if AtlasTW.AssocDefaults[currentZone] == vb then
							AtlasTWOptions.AtlasType = ka
							AtlasTWOptions.AtlasZone = kb
							AtlasTW.Refresh()
							debug("You just arrived here. Using the default map.")
							return
						end
					end
				end
			end
		end
	else
		debug("SubZone data isn't relevant here.")
		if AtlasTW.OutdoorZoneToAtlas[currentZone] then
			debug("This world zone is associated with a map.")
			for ka,va in pairs(AtlasTW.DropDowns) do
				for kb,vb in pairs(va) do
					if AtlasTW.OutdoorZoneToAtlas[currentZone] == vb then
						AtlasTWOptions.AtlasType = ka
						AtlasTWOptions.AtlasZone = kb
						AtlasTW.Refresh()
						debug("Map changed to the associated map.")
						return
					end
				end
			end
		elseif AtlasTW.InstToEntMatches[AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]] then
			for _,va in pairs(AtlasTW.InstToEntMatches[AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]]) do
				if currentZone == AtlasMaps[va].ZoneName then
					debug("Instance/entrance pair found. Doing nothing.")
					return
				end
			end
		elseif AtlasTW.EntToInstMatches[AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]] then
			for _,va in pairs(AtlasTW.EntToInstMatches[AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]]) do
				if currentZone == AtlasMaps[va].ZoneName then
					debug("Instance/entrance pair found. Doing nothing.")
					return
				end
			end
		end
		debug("Searching through all maps for a ZoneName match.")
		for ka,va in pairs(AtlasTW.DropDowns) do
			for kb,vb in pairs(va) do
				-- Compare the currentZone to the new substr of ZoneName
				if currentZone == strsub(AtlasMaps[vb].ZoneName, strlen(AtlasMaps[vb].ZoneName) - strlen(currentZone) + 1) then
					AtlasTWOptions.AtlasType = ka
					AtlasTWOptions.AtlasZone = kb
					AtlasTW.Refresh()
					debug("Found a match. Map has been changed.")
					return
				end
			end
		end
	end
	debug("Nothing changed because no match was found.")
end

--Called whenever the map type dropdown menu is shown
function AtlasTW.FrameDropDownTypeOnShow()
	UIDropDownMenu_Initialize(AtlasFrameDropDownType, atlasFrameDropDownType_Initialize)
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDownType, AtlasTWOptions.AtlasType)
	UIDropDownMenu_SetWidth(190, AtlasFrameDropDownType)
end

--Called whenever the main dropdown menu is shown
function AtlasTW.FrameDropDownOnShow()
	UIDropDownMenu_Initialize(AtlasFrameDropDown, atlasFrameDropDown_Initialize)
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDown, AtlasTWOptions.AtlasZone)
	UIDropDownMenu_SetWidth(190, AtlasFrameDropDown)
end

--Called whenever the Atlas frame is displayed
function AtlasTW.OnShow()
	setupPfUITooltip()
	if(AtlasTWOptions.AtlasAutoSelect) then
		atlasAutoSelect()
	end

	AtlasTW.FrameDropDownTypeOnShow()
	AtlasTW.FrameDropDownOnShow()
	AtlasTW.Refresh()

	--If a boss has been selected, show the loot frame
	if AtlasLootItemsFrame.activeBoss then
		AtlasLootItemsFrame:Show()
	end
end