---
--- AtlasOptions.lua - Atlas configuration and options management
--- 
--- This file contains the options and configuration system for Atlas-TW.
--- It handles user preferences, settings persistence, UI customization,
--- and provides the interface for configuring Atlas behavior and appearance.
--- 
--- Features:
--- - Options frame and UI management
--- - Settings persistence and loading
--- - User preference handling
--- - Configuration validation
--- - Default settings management
--- 
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

---------------
--- COLOURS ---
---------------
local red = "|cffff0000"
local blue = "|cff0070dd"
-- Local references to global functions for performance
local _G = getfenv()
local AtlasTW = _G.AtlasTW
local L = AtlasTW.Local
local uIDropDownMenu_SetSelectedID = UIDropDownMenu_SetSelectedID

-- Local variables for frequently used UI elements
local atlasOptionsFrame, atlasFrame  = AtlasOptionsFrame, AtlasFrame

--- Rounds a number to specified decimal places
--- @param num number The number to round
--- @param idp number|nil Number of decimal places (default: 0)
--- @return number The rounded number
--- @usage local rounded = round(3.14159, 2) -- returns 3.14
--- @since 1.0.0
local function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

--- Handles click events on category dropdown menu items
--- Updates sort settings and refreshes the Atlas interface
--- @return nil
--- @usage Called automatically by UI dropdown system
--- @since 1.0.0
local function atlasOptionsFrameDropDownCats_OnClick()
    local thisID = this:GetID()
    uIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, thisID)
    AtlasTWOptions.AtlasSortBy = thisID
    AtlasTWOptions.AtlasZone = 1
    AtlasTWOptions.AtlasType = 1

    -- Update the interface
    AtlasTW.PopulateDropdowns()
    AtlasTW.Refresh()
    AtlasTW.FrameDropDownTypeOnShow()
    AtlasTW.FrameDropDownOnShow()
end

--- Initializes the category dropdown menu with sort options
--- Populates dropdown with available sorting categories
--- @return nil
--- @usage UIDropDownMenu_Initialize(dropdown, atlasOptionsFrameDropDownCats_Initialize)
--- @since 1.0.0
local function atlasOptionsFrameDropDownCats_Initialize()
    local info
    local dropDownOrder = AtlasTW_DropDownSortOrder

    if not dropDownOrder then
        return
    end

    for i = 1, getn(dropDownOrder) do
        info = {
            text = dropDownOrder[i],
            func = atlasOptionsFrameDropDownCats_OnClick
        }
        UIDropDownMenu_AddButton(info)
    end
end

--- Sets default configuration options for Atlas-TW
--- Initializes all addon settings to their default values
--- @return nil
--- @usage AtlasTW.OptionDefaultSettings() -- Reset to defaults
--- @since 1.0.0
function AtlasTW.OptionDefaultSettings()
    AtlasTWOptions = {
        AtlasButtonPosition = 305,
        AtlasButtonRadius = 76,
        AtlasButtonShown = true,
        AtlasRightClick = false,
        AtlasType = 1,
        AtlasScale = 1,
        AtlasVersion = AtlasTW.Version,
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
        LootSafeLinks = true,
        LootAllLinks = false,
        LootDefaultTT = true,
        LootlinkTT = false,
        LootItemSyncTT = false,
        LootShowSource = true,
        LootEquipCompare = false,
        LootOpaque = true,
        LootItemIDs = true,
        LootItemSpam = true,
        LootShowPanel = true
    }
	AtlasTWCharDB.PartialMatching = true
	AtlasTWCharDB["QuickLooks"] = {}
	AtlasTWCharDB["WishList"] = {}
	AtlasLoot_RefreshQuickLookButtons()
	AtlasTW.OptionsInit()
	print(blue.."Atlas-TW"..": "..red..L["Default settings applied!"])
end

--- Toggles the bottom loot panel visibility
--- Updates AtlasTWOptions.LootShowPanel and shows/hides AtlasLootPanel
--- @return nil
--- @usage AtlasTW.OptionShowPanelOnClick()
--- @since 1.0.0
---
function AtlasTW.OptionShowPanelOnClick()
    local showPanelStatus = AtlasTWOptions.LootShowPanel
    AtlasTWOptions.LootShowPanel = not showPanelStatus
    if showPanelStatus then
        AtlasLootPanel:Hide()
    else
        AtlasLootPanel:Show()
    end
    AtlasTWOptionShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
	AtlasTW.OptionsInit()
end

---
--- Toggles the visibility of the Atlas options frame
--- Shows or hides the options panel and refreshes tooltip settings
--- @return nil
--- @usage AtlasTW.OptionsOnClick() -- Called by options button click
--- @since 1.0.0
---
function AtlasTW.OptionsOnClick()
    if atlasOptionsFrame:IsVisible() then
        atlasOptionsFrame:Hide()
    else
        atlasOptionsFrame:Show()
    end
    -- Refresh tooltip settings to ensure they take effect immediately
    if AtlasTWOptions.LootDefaultTT then
        AtlasTW.OptionDefaultTTOnClick()
    elseif AtlasTWOptions.LootlinkTT then
        AtlasTW.OptionLootlinkTTOnClick()
    elseif AtlasTWOptions.LootItemSyncTT then
        AtlasTW.OptionItemSyncTTOnClick()
    end
end

---
--- Toggles the auto-select feature for Atlas maps
--- Enables or disables automatic map selection based on player location
--- @return nil
--- @usage AtlasTW.OptionsAutoSelectOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionsAutoSelectOnClick()
    AtlasTWOptions.AtlasAutoSelect = not AtlasTWOptions.AtlasAutoSelect
    AtlasTW.OptionsInit()
end

---
--- Toggles the world map right-click integration feature
--- Enables or disables Atlas opening on world map right-click
--- @return nil
--- @usage AtlasTW.OptionsWorldMapOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionsWorldMapOnClick()
    AtlasTWOptions.AtlasRightClick = not AtlasTWOptions.AtlasRightClick
    AtlasTW.OptionsInit()
end

---
--- Toggles the display of instance acronyms in Atlas
--- Shows or hides abbreviated instance names and refreshes display
--- @return nil
--- @usage AtlasTW.OptionsAcronymsOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionsAcronymsOnClick()
    AtlasTWOptions.AtlasAcronyms = not AtlasTWOptions.AtlasAcronyms
    AtlasTW.OptionsInit()
    AtlasTW.Refresh()
end

--- Toggles clamping Atlas frame to the screen
--- Updates AtlasTWOptions.AtlasClamped and refreshes the UI
--- @return nil
--- @usage AtlasTW.OptionsClampedOnClick()
--- @since 1.0.0
---
function AtlasTW.OptionsClampedOnClick()
    AtlasTWOptions.AtlasClamped = not AtlasTWOptions.AtlasClamped
    atlasFrame:SetClampedToScreen(AtlasTWOptions.AtlasClamped)
    AtlasTW.OptionsInit()
    AtlasTW.Refresh()
end

---
--- Initializes all Atlas-TW option settings and UI elements
--- Sets checkbox states, slider values, and frame visibility based on saved options
--- @return nil
--- @usage AtlasTW.OptionsInit() -- Called after option changes
--- @since 1.0.0
---
function AtlasTW.OptionsInit()
    if not AtlasTWOptions then
        print(AtlasTW.Name..": Failed to initialize local references.")
        return
    end
    if AtlasTWOptions.QuestWithAtlas then
        AtlasTW.Quest.UI_Main.Frame:Show()
    else
        AtlasTW.Quest.UI_Main.Frame:Hide()
    end
	-- Consult the saved variable table to see whether to show the bottom panel
	if AtlasTWOptions.LootShowPanel then
		AtlasLootPanel:Show()
	else
		AtlasLootPanel:Hide()
	end
    -- Set values on load
    AtlasTWOptionToggleButton:SetChecked(AtlasTWOptions.AtlasButtonShown)
    AtlasTWOptionAutoSelect:SetChecked(AtlasTWOptions.AtlasAutoSelect)
    AtlasTWOptionRightClick:SetChecked(AtlasTWOptions.AtlasRightClick)
    AtlasTWOptionAcronyms:SetChecked(AtlasTWOptions.AtlasAcronyms)
    AtlasTWOptionClamped:SetChecked(AtlasTWOptions.AtlasClamped)
    AtlasTWOptionSliderButtonPos:SetValue(AtlasTWOptions.AtlasButtonPosition)
    AtlasTWOptionSliderButtonRad:SetValue(AtlasTWOptions.AtlasButtonRadius)
    AtlasTWOptionSliderAlpha:SetValue(AtlasTWOptions.AtlasAlpha)
    AtlasTWOptionSliderScale:SetValue(AtlasTWOptions.AtlasScale)

	-- Quest Options
	AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
	AtlasTWOptionLeftSide:SetChecked(AtlasTWOptions.QuestCurrentSide == "Left")
	AtlasTWOptionRightSide:SetChecked(AtlasTWOptions.QuestCurrentSide == "Right")
     if AtlasTWOptionRightSide:GetChecked() then
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", 567, -36)
    else
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", -556, -36)
    end
	AtlasTWOptionColor:SetChecked(AtlasTWOptions.QuestColourCheck)
	AtlasTWOptionQuestlog:SetChecked(AtlasTWOptions.QuestCheckQuestlog)
	AtlasTWOptionAutoQuery:SetChecked(AtlasTWOptions.QuestAutoQuery)
	AtlasTWOptionQuerySpam:SetChecked(AtlasTWOptions.QuestQuerySpam)
	AtlasTWOptionCompareTooltip:SetChecked(AtlasTWOptions.QuestCompareTooltip)

	-- Loot Options
	AtlasTWOptionSafeLinks:SetChecked(AtlasTWOptions.LootSafeLinks)
	AtlasTWOptionAllLinks:SetChecked(AtlasTWOptions.LootAllLinks)
	AtlasTWOptionDefaultTT:SetChecked(AtlasTWOptions.LootDefaultTT)
	AtlasTWOptionLootlinkTT:SetChecked(AtlasTWOptions.LootlinkTT)
	AtlasTWOptionItemSyncTT:SetChecked(AtlasTWOptions.LootItemSyncTT)
	AtlasTWOptionShowSource:SetChecked(AtlasTWOptions.LootShowSource)
	AtlasTWOptionEquipCompare:SetChecked(AtlasTWOptions.LootEquipCompare)
	AtlasTWOptionOpaque:SetChecked(AtlasTWOptions.LootOpaque)
	AtlasTWOptionItemID:SetChecked(AtlasTWOptions.LootItemIDs)
	AtlasTWOptionItemSpam:SetChecked(AtlasTWOptions.LootItemSpam)
    AtlasTWOptionShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
end

---
--- Resets Atlas frame position and related settings to defaults
--- Clears frame anchors and restores default button position, radius, alpha, and scale
--- @return nil
--- @usage AtlasTW.OptionResetPosition() -- Called by reset button
--- @since 1.0.0
---
function AtlasTW.OptionResetPosition()
    atlasFrame:ClearAllPoints()
    atlasFrame:SetPoint("TOP", 0, -104)

    -- Reset settings to default values
    AtlasTWOptions.AtlasButtonPosition = 305
    AtlasTWOptions.AtlasButtonRadius = 76
    AtlasTWOptions.AtlasAlpha = 1.0
    AtlasTWOptions.AtlasScale = 1.0

    AtlasTW.OptionsInit()
end

---
--- Updates slider display text with current value
--- Shows the slider label with current rounded value in parentheses
--- @param text string The base text label for the slider
--- @return nil
--- @usage AtlasOptions_UpdateSlider("Scale") -- Called by slider OnValueChanged
--- @since 1.0.0
---
function AtlasOptions_UpdateSlider(text)
    local sliderName = this:GetName()
    local textElement = _G[sliderName .. "Text"]
    if textElement then
        textElement:SetText(text .. " (" .. round(this:GetValue(), 2) .. ")")
    end
end

---
--- Shows and initializes the categories dropdown menu
--- Sets up the dropdown with available sort categories and selects current option
--- @return nil
--- @usage AtlasTW.OptionFrameDropDownCatsOnShow() -- Called by dropdown OnShow event
--- @since 1.0.0
---
function AtlasTW.OptionFrameDropDownCatsOnShow()
    local dropDownCats = AtlasOptionsFrameDropDownCats

    UIDropDownMenu_Initialize(dropDownCats, atlasOptionsFrameDropDownCats_Initialize)
    uIDropDownMenu_SetSelectedID(dropDownCats, AtlasTWOptions.AtlasSortBy)
end

-----------------------------------------------------------------------------
-- Option handlers
-----------------------------------------------------------------------------
---
--- Toggles automatic quest panel display feature
--- Shows or hides quest panel when Atlas is opened and updates UI state
--- @return nil
--- @usage AtlasTW.OptionAutoshowOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionAutoshowOnClick()
	AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
	AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTW.OptionsInit()
end

---
--- Sets quest panel to right side position
--- Moves the quest UI frame to the right side of Atlas and updates settings
--- @return nil
--- @usage AtlasTW.OptionRightSideOnClick() -- Called by radio button click
--- @since 1.0.0
---
function AtlasTW.OptionRightSideOnClick()
    AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
    AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", 567, -36)
	AtlasTWOptionRightSide:SetChecked(true)
	AtlasTWOptionLeftSide:SetChecked(false)
	AtlasTWOptions.QuestCurrentSide = "Right"
	AtlasTW.OptionsInit()
end

---
--- Sets quest panel to left side position
--- Moves the quest UI frame to the left side of Atlas and updates settings
--- @return nil
--- @usage AtlasTW.OptionLeftSideOnClick() -- Called by radio button click
--- @since 1.0.0
---
function AtlasTW.OptionLeftSideOnClick()
    if AtlasTWOptions.QuestCurrentSide == "Right" then
        AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", -556, -36)
    end
	AtlasTWOptionRightSide:SetChecked(false)
	AtlasTWOptionLeftSide:SetChecked(true)
	AtlasTWOptions.QuestCurrentSide = "Left"
	AtlasTW.OptionsInit()
end

---
--- Toggles quest color coding feature
--- Enables or disables color-coded quest display and updates quest buttons
--- @return nil
--- @usage AtlasTW.OptionColorOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionColorOnClick()
	AtlasTWOptions.QuestColourCheck = not AtlasTWOptions.QuestColourCheck
	AtlasTWOptionColor:SetChecked(AtlasTWOptions.QuestColourCheck)
	AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

---
--- Toggles questlog integration feature
--- Enables or disables checking against player's questlog and updates quest buttons
--- @return nil
--- @usage AtlasTW.OptionQuestlogOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionQuestlogOnClick()
	AtlasTWOptions.QuestCheckQuestlog = not AtlasTWOptions.QuestCheckQuestlog
	AtlasTWOptionQuestlog:SetChecked(AtlasTWOptions.QuestCheckQuestlog)
	AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

---
--- Toggles automatic quest query feature
--- Enables or disables automatic querying of quest information
--- @return nil
--- @usage AtlasTW.OptionAutoQueryOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionAutoQueryOnClick()
	AtlasTWOptions.QuestAutoQuery = not AtlasTWOptions.QuestAutoQuery
	AtlasTWOptionAutoQuery:SetChecked(AtlasTWOptions.QuestAutoQuery)
	AtlasTW.OptionsInit()
end

---
--- Toggles query spam suppression feature
--- Enables or disables filtering of repeated quest query messages
--- @return nil
--- @usage AtlasTW.OptionQuerySpamOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionQuerySpamOnClick()
	AtlasTWOptions.QuestQuerySpam = not AtlasTWOptions.QuestQuerySpam
	AtlasTWOptionQuerySpam:SetChecked(AtlasTWOptions.QuestQuerySpam)
	AtlasTW.OptionsInit()
end

---
--- Toggles quest tooltip comparison feature
--- Enables or disables quest item comparison in tooltips and registers/unregisters tooltip handlers
--- @return nil
--- @usage AtlasTW.OptionCompareTooltipOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionCompareTooltipOnClick()
	AtlasTWOptions.QuestCompareTooltip = not AtlasTWOptions.QuestCompareTooltip
	AtlasTWOptionCompareTooltip:SetChecked(AtlasTWOptions.QuestCompareTooltip)
	if AtlasTWOptions.QuestCompareTooltip then
		AtlasTW.Quest.Tooltip:Register()
	else
		AtlasTW.Quest.Tooltip:Unregister()
	end
	AtlasTW.OptionsInit()
end
---
--- Toggles safe links feature for loot items
--- Enables safe linking mode and disables all links mode when activated
--- @return nil
--- @usage AtlasTW.OptionSafeLinksOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionSafeLinksOnClick()
	AtlasTWOptions.LootSafeLinks = not AtlasTWOptions.LootSafeLinks
	if AtlasTWOptions.LootSafeLinks then
		AtlasTWOptions.LootAllLinks = false
    else
		AtlasTWOptions.LootAllLinks = true
	end
	AtlasTW.OptionsInit()
end

---
--- Toggles all links feature for loot items
--- Enables all links mode and disables safe links mode when activated
--- @return nil
--- @usage AtlasTW.OptionAllLinksOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionAllLinksOnClick()
	AtlasTWOptions.LootAllLinks = not AtlasTWOptions.LootAllLinks
	if AtlasTWOptions.LootAllLinks then
		AtlasTWOptions.LootSafeLinks = false
    else
		AtlasTWOptions.LootSafeLinks = true
	end
	AtlasTW.OptionsInit()
end

---
--- Sets tooltip display to default mode
--- Enables default tooltips and disables other tooltip modes
--- @return nil
--- @usage AtlasTW.OptionDefaultTTOnClick() -- Called by radio button click
--- @since 1.0.0
---
function AtlasTW.OptionDefaultTTOnClick()
	AtlasTWOptions.LootDefaultTT = true
	AtlasTWOptions.LootlinkTT = false
	AtlasTWOptions.LootItemSyncTT = false
	AtlasTW.OptionsInit()
end

---
--- Sets tooltip display to Lootlink mode
--- Enables Lootlink tooltips and disables other tooltip modes
--- @return nil
--- @usage AtlasTW.OptionLootlinkTTOnClick() -- Called by radio button click
--- @since 1.0.0
---
function AtlasTW.OptionLootlinkTTOnClick()
	AtlasTWOptions.LootDefaultTT = false
	AtlasTWOptions.LootlinkTT = true
	AtlasTWOptions.LootItemSyncTT = false
	AtlasTW.OptionsInit()
end

---
--- Sets tooltip display to ItemSync mode
--- Enables ItemSync tooltips and disables other tooltip modes
--- @return nil
--- @usage AtlasTW.OptionItemSyncTTOnClick() -- Called by radio button click
--- @since 1.0.0
---
function AtlasTW.OptionItemSyncTTOnClick()
	AtlasTWOptions.LootDefaultTT = false
	AtlasTWOptions.LootlinkTT = false
	AtlasTWOptions.LootItemSyncTT = true
	AtlasTW.OptionsInit()
end

---
--- Toggles loot source display feature
--- Shows or hides the source information for loot items
--- @return nil
--- @usage AtlasTW.OptionShowSourceOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionShowSourceOnClick()
	AtlasTWOptions.LootShowSource = not AtlasTWOptions.LootShowSource
	AtlasTW.OptionsInit()
end

---
--- Toggles EquipCompare addon integration
--- Registers or unregisters Atlas tooltips with EquipCompare/EQCompare addons
--- @return nil
--- @usage AtlasTW.OptionEquipCompareOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionEquipCompareOnClick()
	AtlasTWOptions.LootEquipCompare = not AtlasTWOptions.LootEquipCompare
	if AtlasTWOptions.LootEquipCompare then
		-- Register tooltips if EquipCompare is enabled
		if IsAddOnLoaded("EquipCompare") then
			EquipCompare_RegisterTooltip(AtlasLootTooltip)
			EquipCompare_RegisterTooltip(AtlasLootTooltip2)
		end
		if IsAddOnLoaded("EQCompare") then
			EQCompare:RegisterTooltip(AtlasLootTooltip)
			EQCompare:RegisterTooltip(AtlasLootTooltip2)
		end
	else
		-- Unregister tooltips if EquipCompare is disabled
		if IsAddOnLoaded("EquipCompare") then
			EquipCompare_UnregisterTooltip(AtlasLootTooltip)
			EquipCompare_UnregisterTooltip(AtlasLootTooltip2)
		end
		if IsAddOnLoaded("EQCompare") then
			EQCompare:UnRegisterTooltip(AtlasLootTooltip)
			EQCompare:UnRegisterTooltip(AtlasLootTooltip2)
		end
	end
	AtlasTW.OptionsInit()
end

---
--- Toggles loot frame opacity setting
--- Changes the background transparency of the loot items frame
--- @return nil
--- @usage AtlasTW.OptionOpaqueOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionOpaqueOnClick()
	AtlasTWOptions.LootOpaque=AtlasTWOptionOpaque:GetChecked()
	if AtlasTWOptions.LootOpaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
	AtlasTW.OptionsInit()
end

---
--- Toggles item ID display feature
--- Shows or hides item IDs in loot tooltips and displays
--- @return nil
--- @usage AtlasTW.OptionItemIDOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionItemIDOnClick()
	AtlasTWOptions.LootItemIDs = not AtlasTWOptions.LootItemIDs
	AtlasTW.OptionsInit()
end

---
--- Toggles item spam prevention feature
--- Enables or disables filtering of repeated item messages
--- @return nil
--- @usage AtlasTW.OptionItemSpamOnClick() -- Called by checkbox click
--- @since 1.0.0
---
function AtlasTW.OptionItemSpamOnClick()
	AtlasTWOptions.LootItemSpam = not AtlasTWOptions.LootItemSpam
	AtlasTW.OptionsInit()
end