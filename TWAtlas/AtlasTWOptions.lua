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
--- @compatible World of Warcraft 1.12
---

-- Local references to global functions for performance
local _G                            = getfenv()
local AtlasTW                       = _G.AtlasTW

local L                             = AtlasTW.Localization.UI

local uIDropDownMenu_SetSelectedID  = UIDropDownMenu_SetSelectedID

---------------
--- COLOURS ---
---------------
local red                           = AtlasTW.Colors.RED
local blue                          = AtlasTW.Colors.BLUE

-- Local variables for frequently used UI elements
local atlasOptionsFrame, atlasFrame = AtlasTWOptionsFrame, AtlasTWFrame

--- Rounds a number to specified decimal places
--- @param num number The number to round
--- @param idp number|nil Number of decimal places (default: 0)
--- @return number The rounded number
--- @usage local rounded = round(3.14159, 2) -- returns 3.14
local function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end



--- Toggles the bottom loot panel visibility
--- Updates AtlasTWOptions.LootShowPanel and shows/hides AtlasTWLootPanel
--- @return nil
--- @usage AtlasTW.OptionShowPanelOnClick()
---
function AtlasTW.OptionShowPanelOnClick()
    local showPanelStatus = AtlasTWOptions.LootShowPanel
    AtlasTWOptions.LootShowPanel = not showPanelStatus
    if showPanelStatus then
        AtlasTWLootPanel:Hide()
    else
        AtlasTWLootPanel:Show()
    end
    AtlasTWOptionShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
    AtlasTW.OptionsInit()
end

--- Toggles loot filtering mode
--- Cycles through 0: All, 1: My Class, 2: Available
--- @return nil
function AtlasTW.OptionFilterModeOnClick()
    if not AtlasTWOptions.LootFilterMode then
        AtlasTWOptions.LootFilterMode = 0
    end
    AtlasTWOptions.LootFilterMode = math.mod(AtlasTWOptions.LootFilterMode + 1, 3)

    -- Update UI if button exists
    if AtlasTWLootFilterButton then
        local filterText = ""
        if AtlasTWOptions.LootFilterMode == 0 then
            filterText = L["Filter: No Filter"]
        elseif AtlasTWOptions.LootFilterMode == 1 then
            filterText = L["Filter: My Class"]
        elseif AtlasTWOptions.LootFilterMode == 2 then
            filterText = L["Filter: Available"]
        end
        AtlasTWLootFilterButton:SetText(filterText)
    end

    -- Refresh loot display
    if AtlasTW.LootBrowserUI and AtlasTW.LootBrowserUI.ScrollBarLootUpdate then
        AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    end
end

---
--- Toggles the visibility of the Atlas options frame
--- Shows or hides the options panel and refreshes tooltip settings
--- @return nil
--- @usage AtlasTW.OptionsOnClick() -- Called by options button click
---
function AtlasTW.OptionsOnClick()
    if atlasOptionsFrame:IsVisible() then
        atlasOptionsFrame:Hide()
    else
        atlasOptionsFrame:Show()
    end
end

---
--- Toggles the auto-select feature for Atlas maps
--- Enables or disables automatic map selection based on player location
--- @return nil
--- @usage AtlasTW.OptionsAutoSelectOnClick() -- Called by checkbox click
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
---
function AtlasTW.OptionsClampedOnClick()
    AtlasTWOptions.AtlasClamped = not AtlasTWOptions.AtlasClamped
    atlasFrame:SetClampedToScreen(AtlasTWOptions.AtlasClamped)
    AtlasTW.OptionsInit()
    AtlasTW.Refresh()
end

---
--- Toggles showing cursor coordinates on the Atlas map
--- Updates AtlasTWOptions.AtlasCursorCoords and shows/hides the overlay
--- @return nil
--- @usage AtlasTW.OptionsCursorCoordsOnClick() -- Called by checkbox click
---
function AtlasTW.OptionsCursorCoordsOnClick()
    AtlasTWOptions.AtlasCursorCoords = not AtlasTWOptions.AtlasCursorCoords
    if AtlasMapOverlay then
        if AtlasTWOptions.AtlasCursorCoords then
            AtlasMapOverlay:Show()
            PrintA("Cursor coordinates on map enabled")
        else
            AtlasMapOverlay:Hide()
            PrintA("Cursor coordinates on map disabled")
        end
    end
    if AtlasTWOptionCursorCoords then
        AtlasTWOptionCursorCoords:SetChecked(AtlasTWOptions.AtlasCursorCoords)
    end
end

---
--- Handles toggle of pfUI styling option
--- Enables or disables pfUI integration styling
--- @return nil
--- @usage Called when user clicks pfUI styling checkbox
---
function AtlasTW.OptionsPfUIOnClick()
    AtlasTWOptions.pfUIEnabled = not AtlasTWOptions.pfUIEnabled
    if AtlasTWOptionPfUI then
        AtlasTWOptionPfUI:SetChecked(AtlasTWOptions.pfUIEnabled)
    end

    -- Inform user that UI reload is required
    if AtlasTWOptions.pfUIEnabled then
        PrintA(L["pfUI styling enabled. Type /reload to apply changes."])
    else
        PrintA(L["pfUI styling disabled. Type /reload to apply changes."])
    end
end

---
--- Initializes all Atlas-TW option settings and UI elements
--- Sets checkbox states, slider values, and frame visibility based on saved options
--- @return nil
--- @usage AtlasTW.OptionsInit() -- Called after option changes
---
function AtlasTW.OptionsInit()
    if not AtlasTWOptions then
        PrintA("Failed to initialize local references.")
        return
    end

    -- Ensure Reagent options exist for old configs
    if AtlasTWOptions.ReagentRows == nil then AtlasTWOptions.ReagentRows = 20 end
    if AtlasTWOptions.ReagentProfessions == nil then
        AtlasTWOptions.ReagentProfessions = {
            ["Alchemy"] = true,
            ["Blacksmithing"] = true,
            ["Enchanting"] = true,
            ["Engineering"] = true,
            ["Leatherworking"] = true,
            ["Tailoring"] = true,
            ["Cooking"] = true,
            ["First Aid"] = true,
            ["Jewelcrafting"] = true,
            ["Poisons"] = true,
            ["Mining"] = true,
        }
    end

    if AtlasTWOptions.QuestWithAtlas then
        AtlasTW.Quest.UI_Main.Frame:Show()
    else
        AtlasTW.Quest.UI_Main.Frame:Hide()
    end
    -- Consult the saved variable table to see whether to show the bottom panel
    if AtlasTWOptions.LootShowPanel then
        AtlasTWLootPanel:Show()
    else
        AtlasTWLootPanel:Hide()
    end
    -- Set values on load
    AtlasTWOptionToggleButton:SetChecked(AtlasTWOptions.AtlasButtonShown)
    AtlasTWOptionAutoSelect:SetChecked(AtlasTWOptions.AtlasAutoSelect)
    AtlasTWOptionRightClick:SetChecked(AtlasTWOptions.AtlasRightClick)
    AtlasTWOptionAcronyms:SetChecked(AtlasTWOptions.AtlasAcronyms)
    AtlasTWOptionClamped:SetChecked(AtlasTWOptions.AtlasClamped)
    AtlasTWOptionCursorCoords:SetChecked(AtlasTWOptions.AtlasCursorCoords)

    -- pfUI option (only show if pfUI is loaded)
    if IsAddOnLoaded("pfUI") and AtlasTWOptionPfUI then
        AtlasTWOptionPfUI:SetChecked(AtlasTWOptions.pfUIEnabled)
    elseif AtlasTWOptionPfUI then
        -- Hide the checkbox if pfUI is not loaded
        AtlasTWOptionPfUI:Hide()
        _G[AtlasTWOptionPfUI:GetName() .. "Text"]:Hide()
    end

    AtlasTWOptionSliderButtonPos:SetValue(AtlasTWOptions.AtlasButtonPosition)
    AtlasTWOptionSliderButtonRad:SetValue(AtlasTWOptions.AtlasButtonRadius)
    AtlasTWOptionSliderAlpha:SetValue(AtlasTWOptions.AtlasAlpha)
    AtlasTWOptionSliderScale:SetValue(AtlasTWOptions.AtlasScale)

    -- Quest Options
    AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTWOptionLeftSide:SetChecked(AtlasTWOptions.QuestCurrentSide)

    local function IsPfUIStylingEnabled()
        return IsAddOnLoaded("pfUI") and pfUI and (not AtlasTWOptions or AtlasTWOptions.pfUIEnabled ~= false)
    end

    if IsPfUIStylingEnabled() then
        AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
        if AtlasTWOptionLeftSide:GetChecked() then
            AtlasTW.Quest.UI_Main.Frame:SetPoint("TOPRIGHT", "AtlasTWFrame", "TOPLEFT", -1, 0)
        else
            AtlasTW.Quest.UI_Main.Frame:SetPoint("TOPLEFT", "AtlasTWFrame", "TOPRIGHT", 1, 0)
        end
    else
        if AtlasTWOptionLeftSide:GetChecked() then
            AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasTWFrame", -556, -36)
        else
            AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasTWFrame", 567, -36)
        end
    end
    AtlasTWOptionColor:SetChecked(AtlasTWOptions.QuestColourCheck)
    AtlasTWOptionQuestlog:SetChecked(AtlasTWOptions.QuestCheckQuestlog)
    AtlasTWOptionAutoQuery:SetChecked(AtlasTWOptions.QuestAutoQuery)

    -- Loot Options
    AtlasTWOptionSafeLinks:SetChecked(AtlasTWOptions.LootSafeLinks)
    AtlasTWOptionAllLinks:SetChecked(AtlasTWOptions.LootAllLinks)
    AtlasTWOptionShowSource:SetChecked(AtlasTWOptions.LootShowSource)
    AtlasTWOptionEquipCompare:SetChecked(AtlasTWOptions.LootEquipCompare)
    AtlasTWOptionOpaque:SetChecked(AtlasTWOptions.LootOpaque)
    AtlasTWOptionShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
    AtlasTWOptionTooltipID:SetChecked(AtlasTWOptions.TooltipShowID)
    AtlasTWOptionTooltipIcon:SetChecked(AtlasTWOptions.TooltipShowIcon)

    -- Update Loot Filter button text
    if AtlasTWLootFilterButton then
        local filterText = ""
        local mode = AtlasTWOptions.LootFilterMode or 0
        if mode == 0 then
            filterText = L["Filter: No Filter"]
        elseif mode == 1 then
            filterText = L["Filter: My Class"]
        elseif mode == 2 then
            filterText = L["Filter: Available"]
        end
        AtlasTWLootFilterButton:SetText(filterText)
    end
end

---
--- Resets Atlas frame position and related settings to defaults
--- Clears frame anchors and restores default button position, radius, alpha, and scale
--- @return nil
--- @usage AtlasTW.OptionResetPosition() -- Called by reset button
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
--- @param frame table Optional frame to update, defaults to 'this'
--- @return nil
--- @usage AtlasOptions_UpdateSlider("Scale") -- Called by slider OnValueChanged
---
function AtlasOptions_UpdateSlider(text, frame)
    local slider = frame or this
    if not slider or type(slider.GetValue) ~= "function" then
        return
    end
    local sliderName = slider:GetName()
    local textElement = _G[sliderName .. "Text"]
    if textElement then
        textElement:SetText(text .. " (" .. round(slider:GetValue(), 2) .. ")")
    end
end

--- Sets default configuration options for Atlas-TW
--- Initializes all addon settings to their default values
--- @return nil
--- @usage AtlasTW.OptionDefaultSettings() -- Reset to defaults
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
        AtlasCursorCoords = true,
        QuestCurrentSide = "Left",
        QuestWithAtlas = true,
        QuestColourCheck = true,
        QuestCheckQuestlog = true,
        QuestAutoQuery = true,
        LootSafeLinks = true,
        LootAllLinks = false,
        LootShowSource = true,
        LootEquipCompare = false,
        LootOpaque = true,
        LootShowPanel = true,
        LootFilterMode = 0,
        ReagentRows = 20,
        ReagentProfessions = {
            ["Alchemy"] = true,
            ["Blacksmithing"] = true,
            ["Enchanting"] = true,
            ["Engineering"] = true,
            ["Leatherworking"] = true,
            ["Tailoring"] = true,
            ["Cooking"] = true,
            ["First Aid"] = true,
            ["Jewelcrafting"] = true,
            ["Poisons"] = true,
            ["Mining"] = true,
        },
        TooltipShowID = true,
        TooltipShowIcon = true,
        pfUIEnabled = true
    }
    AtlasTWCharDB.PartialMatching = true
    AtlasTWCharDB["QuickLooks"] = {}
    AtlasTWCharDB["WishList"] = {}
    AtlasTW.QuickLook.RefreshButtons()
    AtlasTW.OptionsInit()
    PrintA(red .. L["Default settings applied!"])
end

--- Shows and initializes the categories dropdown menu
--- Sets up the dropdown with available sort categories and selects current option
--- @return nil
--- @usage AtlasTW.OptionFrameDropDownCatsOnShow() -- Called by dropdown OnShow event
---
function AtlasTW.OptionFrameDropDownCatsOnShow()
    if AtlasTW.HewdropMenus and AtlasTW.HewdropMenus.UpdateSortByLabel then
        AtlasTW.HewdropMenus.UpdateSortByLabel()
    end
end

-----------------------------------------------------------------------------
-- Option handlers
-----------------------------------------------------------------------------
---
--- Toggles automatic quest panel display feature
--- Shows or hides quest panel when Atlas is opened and updates UI state
--- @return nil
--- @usage AtlasTW.OptionAutoshowOnClick() -- Called by checkbox click
---
function AtlasTW.OptionAutoshowOnClick()
    AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
    AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTW.OptionsInit()
end

---
--- Toggles quest panel position between left and right side
--- Moves the quest UI frame and updates settings
--- @return nil
--- @usage AtlasTW.OptionLeftSideOnClick() -- Called by checkbox click
---
function AtlasTW.OptionLeftSideOnClick()
    AtlasTWOptions.QuestCurrentSide = not AtlasTWOptions.QuestCurrentSide
    if not AtlasTWOptions.QuestCurrentSide then
        AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasTWFrame", -556, -36)
    end
    AtlasTW.OptionsInit()
end

---
--- Toggles quest color coding feature
--- Enables or disables color-coded quest display and updates quest buttons
--- @return nil
--- @usage AtlasTW.OptionColorOnClick() -- Called by checkbox click
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
---
function AtlasTW.OptionAutoQueryOnClick()
    AtlasTWOptions.QuestAutoQuery = not AtlasTWOptions.QuestAutoQuery
    AtlasTWOptionAutoQuery:SetChecked(AtlasTWOptions.QuestAutoQuery)
    AtlasTW.OptionsInit()
end

---
--- Toggles safe links feature for loot items
--- Enables safe linking mode and disables all links mode when activated
--- @return nil
--- @usage AtlasTW.OptionSafeLinksOnClick() -- Called by checkbox click
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
--- Toggles loot source display feature
--- Shows or hides the source information for loot items
--- @return nil
--- @usage AtlasTW.OptionShowSourceOnClick() -- Called by checkbox click
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
---
function AtlasTW.OptionEquipCompareOnClick()
    AtlasTWOptions.LootEquipCompare = not AtlasTWOptions.LootEquipCompare
    if AtlasTWOptions.LootEquipCompare then
        -- Register tooltips if EquipCompare is enabled
        if IsAddOnLoaded("EquipCompare") then
            EquipCompare_RegisterTooltip(AtlasTWLootTooltip)
            EquipCompare_RegisterTooltip(AtlasTWLootTooltip2)
        end
        if IsAddOnLoaded("EQCompare") then
            EQCompare:RegisterTooltip(AtlasTWLootTooltip)
            EQCompare:RegisterTooltip(AtlasTWLootTooltip2)
        end
    else
        -- Unregister tooltips if EquipCompare is disabled
        if IsAddOnLoaded("EquipCompare") then
            EquipCompare_UnregisterTooltip(AtlasTWLootTooltip)
            EquipCompare_UnregisterTooltip(AtlasTWLootTooltip2)
        end
        if IsAddOnLoaded("EQCompare") then
            EQCompare:UnRegisterTooltip(AtlasTWLootTooltip)
            EQCompare:UnRegisterTooltip(AtlasTWLootTooltip2)
        end
    end
    AtlasTW.OptionsInit()
end

---
--- Toggles loot frame opacity setting
--- Changes the background transparency of the loot items frame
--- @return nil
--- @usage AtlasTW.OptionOpaqueOnClick() -- Called by checkbox click
---
function AtlasTW.OptionOpaqueOnClick()
    AtlasTWOptions.LootOpaque = AtlasTWOptionOpaque:GetChecked()
    if AtlasTWOptions.LootOpaque then
        AtlasTWLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
    else
        AtlasTWLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
    end
    AtlasTW.OptionsInit()
end

---
--- Toggles universal tooltip item ID display
--- @return nil
---
function AtlasTW.OptionTooltipIDOnClick()
    AtlasTWOptions.TooltipShowID = not AtlasTWOptions.TooltipShowID
    AtlasTW.OptionsInit()
end

---
--- Toggles universal tooltip item icon display
--- @return nil
---
function AtlasTW.OptionTooltipIconOnClick()
    AtlasTWOptions.TooltipShowIcon = not AtlasTWOptions.TooltipShowIcon
    AtlasTW.OptionsInit()
end

-- Popup Box for first time users
StaticPopupDialogs["AtlasTWLoot_SETUP"] = {
    text = L["Welcome to Atlas-TW Edition. Please take a moment to set your preferences."],
    button1 = L["Setup"],
    OnAccept = function()
        AtlasTW.OptionsOnClick()
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}
