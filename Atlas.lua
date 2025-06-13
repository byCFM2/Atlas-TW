local _G = getfenv()
local atlasTW = _G.AtlasTW
local atlas_Ints_Ent_DropDown = {}
local atlasData = {}
local frame

atlasTW.Version = GetAddOnMetadata(atlasTW.Name, "Version")

local function debug(info)
	if atlasTW.DebugMode then
		DEFAULT_CHAT_FRAME:AddMessage("["..atlasTW.Name.."] "..info)
	end
end

local defaultAtlasTWOptions = {
    AtlasButtonPosition = 336,
    AtlasButtonRadius = 78,
    AtlasButtonShown = true,
    AtlasRightClick = false,
    AtlasType = 1,
    AtlasScale = 1,
    AtlasVersion = atlasTW.Version,
    AtlasZone = 1,
    AtlasSortBy = 1,
    AtlasAutoSelect = false,
    AtlasLocked = false,
    AtlasAlpha = 1.0,
    AtlasAcronyms = true,
    AtlasClamped = true,
    QuestCurrentSide = "Left",
    QuestWithAtlas = true,
    QuestColourCheck = true,
    QuestCheckQuestlog = true,
    QuestAutoQuery = true,
    QuestQuerySpam = true,
    QuestCompareTooltip = true,
}

local function cloneTable(t)
	local new = {}					-- create a new table
	local i, v = next(t, nil)		-- i is an index of t, v = t[i]
	while i do
		if type(v)=="table" then
			v=cloneTable(v)
		end
		new[i] = v
		i, v = next(t, i)			-- get next index
	end
	return new
end

--resets all saved variables to the default values
local function atlas_FreshOptions()
	AtlasTWOptions = cloneTable(defaultAtlasTWOptions)
end

local function atlasSimpleSearch(data, text)
	if not text then
		return
	end
	local new = {}
	local i, n
	local search_text = string.lower(text)
	search_text = string.gsub(search_text, "([%^%$%(%)%%%.%[%]%+%-%?])", "%%%1")
	search_text = string.gsub(search_text, "%*", ".*")
	local match
	i,_ = next(data, nil)-- i is an index of data, v = data[i]
	n = i
	while i do
		if type(i) == "number" then
			if string.gmatch then
				match = string.gmatch(string.lower(data[i][1]), search_text)()
			else
				match = string.gfind(string.lower(data[i][1]), search_text)()
			end
			if match then
				new[n] = {}
				new[n][1] = data[i][1]
				n = n + 1
			end
		end
		i,_ = next(data, i)
	end
	return new
end

local function atlas_Search(text)
	local data = atlasSimpleSearch(atlasData, text)

	--populate the scroll frame entries list, the update func will do the rest
	local i = 1
	while ( data and data[i] ~= nil ) do
		atlasTW.ScrollList[i] = data[i][1]
		i = i + 1
	end

	atlasTW.CurrentLine = i - 1
end

function Atlas_SearchAndRefresh(text)
	atlas_Search(text)
	AtlasLoot_AtlasScrollBar_Update()
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
	local aa = atlas_SanitizeName(AtlasMaps[a].ZoneName[1])
	local bb = atlas_SanitizeName(AtlasMaps[b].ZoneName[1])
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
function Atlas_Init()
	-- Валидация данных AtlasMaps
	if atlasTW.DebugMode then
		local errors = AtlasUtils.ValidateAllData()
		for _, dungeonErrors in pairs(errors) do
			for _, error in pairs(dungeonErrors) do
				debug("Data validation error: " .. error)
			end
		end
	end

	-- Инициализируем UI фреймы
	AtlasLoot_InitializeUI()

	--clear saved vars for a new ver (or a new install!)
	if AtlasTWOptions == nil or AtlasTWOptions["AtlasVersion"] ~= atlasTW.Version then
		atlas_FreshOptions()
	end

	--populate the dropdown lists...yeeeah this is so much nicer!
	-- Добавить валидацию dropdown данных
    if atlasTW.DebugMode then
        local dropdownErrors = AtlasTW_DropDownValidateData()
        if table.getn(dropdownErrors) > 0 then
            for _, error in pairs(dropdownErrors) do
                debug("DropDown validation error: " .. error)
            end
        end
    end
	Atlas_PopulateDropdowns()

	if atlasTW.DropDowns[AtlasTWOptions.AtlasType] == nil then
		AtlasTWOptions.AtlasType = 1
		AtlasTWOptions.AtlasZone = 1
	end

	--Now that saved variables have been loaded, update everything accordingly
	Atlas_Refresh()
	atlas_UpdateLock()
	Atlas_UpdateAlpha()
	AtlasFrame:SetClampedToScreen(AtlasTWOptions.AtlasClamped)
	AtlasButton_UpdatePosition()
	AtlasOptions_Init()
end

--Main Atlas event handler
function Atlas_OnEvent()
	if arg1 == atlasTW.Name then
		Atlas_Init()
	end
end

function Atlas_PopulateDropdowns()
    local sortType = AtlasTW_DropDownSortOrder[AtlasTWOptions.AtlasSortBy]
    local subcatOrder = AtlasTW_DropDownGetLayoutOrder(sortType)
    local layouts = AtlasTW_DropDownGetLayout(sortType)
    for n = 1, getn(subcatOrder) do
        local subcatItems = layouts[subcatOrder[n]]
        atlasTW.DropDowns[n] = {}
        for _,v in pairs(subcatItems) do
            table.insert(atlasTW.DropDowns[n], v)
        end
        if subcatOrder[n] ~= ATLAS_DDL_ALL_MENU1 and subcatOrder[n] ~= ATLAS_DDL_ALL_MENU2 and subcatOrder[n] ~= ATLAS_DDL_WORLD then
            table.sort(atlasTW.DropDowns[n], atlas_SortZonesAlpha)
        end
    end
end

--Simple function to toggle the Atlas frame's lock status and update it's appearance
function Atlas_ToggleLock()
	AtlasTWOptions.AtlasLocked = not AtlasTWOptions.AtlasLocked
	atlas_UpdateLock()
end

--Begin moving the Atlas frame if it's unlocked
function Atlas_StartMoving()
	if not AtlasTWOptions.AtlasLocked then
		AtlasFrame:StartMoving()
	end
end

--Parses slash commands
--If an unrecognized command is given, toggle Atlas
function Atlas_SlashCommand(msg)
	if msg == "options" or msg == "opt" then
		AtlasOptions_Toggle()
	else
		Atlas_Toggle()
	end
end

--Sets the transparency of the Atlas frame based on AtlasAlpha
function Atlas_UpdateAlpha()
	AtlasFrame:SetAlpha(AtlasTWOptions.AtlasAlpha)
end

--Sets the scale of the Atlas frame based on AtlasScale
function Atlas_UpdateScale()
	AtlasFrame:SetScale(AtlasTWOptions.AtlasScale)
end

--Simple function to toggle the visibility of the Atlas frame
function Atlas_Toggle()
	if AtlasFrame:IsVisible() then
		HideUIPanel(AtlasFrame)
	else
		ShowUIPanel(AtlasFrame)
	end
end

local function atlasSwitchDD_Set(index)
	for k,v in pairs(atlasTW.DropDowns) do
		for k2,v2 in pairs(v) do
			if v2 == atlas_Ints_Ent_DropDown[index] then
				AtlasTWOptions.AtlasType = k
				AtlasTWOptions.AtlasZone = k2
			end
		end
	end
	AtlasFrameDropDownType_OnShow()
	AtlasFrameDropDown_OnShow()
	Atlas_Refresh()
end

local function atlasSwitchDD_OnClick()
	atlasSwitchDD_Set(this:GetID())
end

local function atlasSwitchDD_OnLoad()
	local info
	for _,v in pairs(atlas_Ints_Ent_DropDown) do
		info = {
			text = AtlasMaps[v].ZoneName[1],
			func = atlasSwitchDD_OnClick
		}
		UIDropDownMenu_AddButton(info)
	end
end

local function atlasSwitchDD_Sort(a, b)
	local aa = AtlasMaps[a].ZoneName[1]
	local bb = AtlasMaps[b].ZoneName[1]
	return aa < bb
end

--Refreshes the Atlas frame, usually because a new map needs to be displayed
--The zoneID variable represents the internal name used for each map
--Also responsible for updating all the text when a map is changed
function Atlas_Refresh()
	local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
	local data = AtlasMaps
	local base = {}
	local textLocation, textLevelRange, textMinLevel, textPlayerLimit = "", "", "", ""
	local red = "|cffcc6666"

	-- Валидация текущего подземелья
    local errors = AtlasUtils.ValidateDungeonData(zoneID, data[zoneID])
    if table.getn(errors) > 0 and atlasTW.DebugMode then
        for _, error in pairs(errors) do
            debug("Current dungeon validation error: " .. error)
        end
    end

	AtlasLoot_SetupForAtlas()

	--If a first time user, set up options
	if AtlasLootCharDB.FirstTime == nil or AtlasLootCharDB.FirstTime == true then
		StaticPopup_Show("ATLASLOOT_SETUP")
		AtlasLootCharDB.FirstTime = false
	end

	--Reset which loot page is 'current'
	AtlasLootItemsFrame.activeBoss = nil

	--Get boss name information
	for k,v in pairs(data[zoneID]) do
		base[k] = v
	end

	--Display the newly selected texture
	AtlasMap:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\Maps\\"..zoneID)

	--Setup info panel above boss listing
	local tName = base.ZoneName[1]
	if AtlasTWOptions.AtlasAcronyms and base.Acronym ~= nil then
		tName = tName..red.." ["..base.Acronym.."]"
	end
	AtlasText_ZoneName_Text:SetText(tName)
	if base.Location[1] then
		textLocation = ATLAS_STRING_LOCATION..": "..base.Location[1]
	end
	if base.LevelRange then
		textLevelRange = ATLAS_STRING_LEVELRANGE..": "..base.LevelRange
	end
	if base.MinLevel then
		textMinLevel = ATLAS_STRING_MINLEVEL..": "..base.MinLevel
	end
	if base.PlayerLimit then
		textPlayerLimit = ATLAS_STRING_PLAYERLIMIT..": "..base.PlayerLimit
	end
	AtlasText_Location_Text:SetText(textLocation)
	AtlasText_LevelRange_Text:SetText(textLevelRange)
	AtlasText_MinLevel_Text:SetText(textMinLevel)
	AtlasText_PlayerLimit_Text:SetText(textPlayerLimit)

	atlasData = base

	if (data.Search ~= false) then
		AtlasSearchEditBox:Show();
		AtlasNoSearch:Hide();
	else
		AtlasSearchEditBox:Hide();
		AtlasNoSearch:Show();
		ATLAS_SEARCH_METHOD = nil;
	end

	--populate the scroll frame entries list, the update func will do the rest
	atlas_Search("")
	AtlasSearchEditBox:SetText("")
	AtlasSearchEditBox:ClearFocus()

	--create and align any new entry buttons that we need
 	for i = 1, atlasTW.CurrentLine do
		if not _G["AtlasBossLine"..i] then
			frame = AtlasLoot_CreateButtonFromTemplate("AtlasBossLine"..i, AtlasFrame, "AtlasLootNewBossLineTemplate")
			frame:SetFrameStrata("HIGH")
			if i ~= 1 then
				frame:SetPoint("TOPLEFT", "AtlasBossLine"..(i-1), "BOTTOMLEFT")
			else
				frame:SetPoint("TOPLEFT", "AtlasScrollBar", "TOPLEFT", 16, -3)
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
	end --TODO нужно постараться создавать в уи файле

	--Hide the loot frame now that a pristine Atlas instance is created
	AtlasLootItemsFrame:Hide()

	--Make sure the scroll bar is correctly offset
	AtlasLoot_AtlasScrollBar_Update()

	--see if we should display the entrance/instance button or not, and decide what it should say
	local matchFound = {}
	local sayEntrance = nil
	for k,v in pairs(atlasTW.EntToInstMatches) do
		if k == zoneID then
			matchFound = v
			sayEntrance = false
		end
	end
	if not matchFound[1] then
		for k,v in pairs(atlasTW.InstToEntMatches) do
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
			AtlasSwitchButton:SetText(ATLAS_ENTRANCE_BUTTON)
		else
			AtlasSwitchButton:SetText(ATLAS_INSTANCE_BUTTON)
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
function AtlasSwitchButton_OnClick()
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
	AtlasFrameDropDown_OnShow()
	Atlas_Refresh()
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
	Atlas_Refresh()
end

--Function used to initialize the main dropdown menu
--Looks at the status of AtlasType to determine how to populate the list
local function atlasFrameDropDown_Initialize()
	local info
	for _,v in pairs(atlasTW.DropDowns[AtlasTWOptions.AtlasType]) do
		info = {
			text = AtlasMaps[v].ZoneName[1],
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
local function atlas_AutoSelect()
	local currentZone = atlas_GetFixedZoneText()
	local currentSubZone = GetSubZoneText()
	debug("Using auto-select to open the best map.")

	if atlasTW.AssocDefaults[currentZone] then
		debug("You're in a zone where SubZone data is relevant.")
		if atlasTW.SubZoneData[currentSubZone] then
			debug("There's data for your current SubZone.")
			for ka,va in pairs(atlasTW.DropDowns) do
				for kb,vb in pairs(va) do
					if atlasTW.SubZoneData[currentSubZone] == vb then
						AtlasTWOptions.AtlasType = ka
						AtlasTWOptions.AtlasZone = kb
						Atlas_Refresh()
						debug("Map changed directly based on SubZone data.")
						return
					end
				end
			end
		else
			debug("No applicable SubZone data exists.")
			if currentZone == atlasTW.SubZoneAssoc[atlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]] then
				debug("You're in the same instance as the former map. Doing nothing.")
				return
			else
				for ka,va in pairs(atlasTW.DropDowns) do
					for kb,vb in pairs(va) do
						if atlasTW.AssocDefaults[currentZone] == vb then
							AtlasTWOptions.AtlasType = ka
							AtlasTWOptions.AtlasZone = kb
							Atlas_Refresh()
							debug("You just arrived here. Using the default map.")
							return
						end
					end
				end
			end
		end
	else
		debug("SubZone data isn't relevant here.")
		if atlasTW.OutdoorZoneToAtlas[currentZone] then
			debug("This world zone is associated with a map.")
			for ka,va in pairs(atlasTW.DropDowns) do
				for kb,vb in pairs(va) do
					if atlasTW.OutdoorZoneToAtlas[currentZone] == vb then
						AtlasTWOptions.AtlasType = ka
						AtlasTWOptions.AtlasZone = kb
						Atlas_Refresh()
						debug("Map changed to the associated map.")
						return
					end
				end
			end
		elseif atlasTW.InstToEntMatches[atlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]] then
			for _,va in pairs(atlasTW.InstToEntMatches[atlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]]) do
				if currentZone == AtlasMaps[va].ZoneName[1] then
					debug("Instance/entrance pair found. Doing nothing.")
					return
				end
			end
		elseif atlasTW.EntToInstMatches[atlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]] then
			for _,va in pairs(atlasTW.EntToInstMatches[atlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]]) do
				if currentZone == AtlasMaps[va].ZoneName[1] then
					debug("Instance/entrance pair found. Doing nothing.")
					return
				end
			end
		end
		debug("Searching through all maps for a ZoneName match.")
		for ka,va in pairs(atlasTW.DropDowns) do
			for kb,vb in pairs(va) do
				-- Compare the currentZone to the new substr of ZoneName
				if currentZone == strsub(AtlasMaps[vb].ZoneName[1], strlen(AtlasMaps[vb].ZoneName[1]) - strlen(currentZone) + 1) then
					AtlasTWOptions.AtlasType = ka
					AtlasTWOptions.AtlasZone = kb
					Atlas_Refresh()
					debug("Found a match. Map has been changed.")
					return
				end
			end
		end
	end
	debug("Nothing changed because no match was found.")
end

--Called whenever the map type dropdown menu is shown
function AtlasFrameDropDownType_OnShow()
	UIDropDownMenu_Initialize(AtlasFrameDropDownType, atlasFrameDropDownType_Initialize)
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDownType, AtlasTWOptions.AtlasType)
	UIDropDownMenu_SetWidth(190, AtlasFrameDropDownType)
end

--Called whenever the main dropdown menu is shown
function AtlasFrameDropDown_OnShow()
	UIDropDownMenu_Initialize(AtlasFrameDropDown, atlasFrameDropDown_Initialize)
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDown, AtlasTWOptions.AtlasZone)
	UIDropDownMenu_SetWidth(190, AtlasFrameDropDown)
end

--Called whenever the Atlas frame is displayed
function Atlas_OnShow()
	AtlasTWQuest_Run()
	if(AtlasTWOptions.AtlasAutoSelect) then
		atlas_AutoSelect()
	end

	--sneakiness
	AtlasFrameDropDownType_OnShow()
	AtlasFrameDropDown_OnShow()
	Atlas_Refresh()

	--If a boss has been selected, show the loot frame
	if AtlasLootItemsFrame.activeBoss then
		AtlasLootItemsFrame:Show()
	end

	--Consult the saved variable table to see whether to show the bottom panel
	if AtlasLootCharDB.HidePanel then
		AtlasLootPanel:Hide()
	else
		AtlasLootPanel:Show()
	end
--	AtlasLoot_Atlas_OnShow()
end

--RightButton closes Atlas and open the World Map if the RightClick option is turned on
function Atlas_OnClick()
	if arg1 == "RightButton" then
		if AtlasTWOptions.AtlasRightClick then
			Atlas_Toggle()
			ToggleWorldMap()
		end
	end
end