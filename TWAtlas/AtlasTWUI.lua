---
--- AtlasUI.lua - Atlas main UI frame and interface components
---
--- This file contains the main UI frame creation and management for Atlas-TW.
--- It handles the primary Atlas window, frame positioning, event registration,
--- and provides the foundation for all Atlas UI components and interactions.
---
--- Features:
--- - Main Atlas frame creation and configuration
--- - Frame positioning and movement handling
--- - Event registration and handling
--- - UI component initialization
--- - Frame visibility and state management
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
local Colors = AtlasTW.Colors

local L = AtlasTW.Localization.UI

do
    -- Create the main Atlas frame
    local atlasFrame = CreateFrame("Frame", "AtlasTWFrame", UIParent)
    atlasFrame:SetFrameStrata("HIGH")
    atlasFrame:SetWidth(921)
    atlasFrame:SetHeight(601)
    atlasFrame:SetPoint("TOPLEFT", 0, -104)
    atlasFrame:Hide()
    atlasFrame:SetMovable(true)
    atlasFrame:EnableMouse(true)
    atlasFrame:RegisterForDrag("LeftButton")
    atlasFrame:RegisterEvent("ADDON_LOADED")
    atlasFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

    -- Scripts
    atlasFrame:SetScript("OnEvent", function()
        AtlasTW.OnEvent()
    end)

    atlasFrame:SetScript("OnShow", function()
        AtlasTW.OnShow()
    end)

    atlasFrame:SetScript("OnHide", function()
        atlasFrame:StopMovingOrSizing()
        atlasFrame.isMoving = false

        -- Persist state (Last Opened Page)
        -- Check if LootFrame is active (IsShown returns true if Show() was called, even if parent hidden)
        if AtlasTWLootItemsFrame and AtlasTWLootItemsFrame:IsShown() and AtlasTWLootItemsFrame.StoredElement then
            if not AtlasTWCharDB.LastOpened then AtlasTWCharDB.LastOpened = {} end
            AtlasTWCharDB.LastOpened.StoredElement = AtlasTWLootItemsFrame.StoredElement
            AtlasTWCharDB.LastOpened.StoredMenu = AtlasTWLootItemsFrame.StoredMenu
            if AtlasTWOptions then
                AtlasTWCharDB.LastOpened.AtlasType = AtlasTWOptions.AtlasType
                AtlasTWCharDB.LastOpened.AtlasZone = AtlasTWOptions.AtlasZone
            end
        else
            -- Clear if we are not on a loot page to avoid restoring old state when user consciously closed it
            if AtlasTWCharDB and AtlasTWCharDB.LastOpened then
                AtlasTWCharDB.LastOpened = nil
            end
        end
    end)

    atlasFrame:SetScript("OnDragStart", function()
        AtlasTW.StartMoving()
    end)

    atlasFrame:SetScript("OnDragStop", function()
        atlasFrame:StopMovingOrSizing()
        atlasFrame.isMoving = false
    end)

    atlasFrame:SetScript("OnMouseUp", function()
        atlasFrame:StopMovingOrSizing()
        atlasFrame.isMoving = false
        AtlasTW.OnClick()
    end)

    --Allows Atlas to be closed with the Escape key
    tinsert(UISpecialFrames, "AtlasTWFrame")

    --Setting up slash commands involves referencing some strage auto-generated variables
    SLASH_ATLASTW1 = "/atlastw"
    SlashCmdList["ATLASTW"] = AtlasTW.SlashCommand

    -- Close button
    local closeButton = CreateFrame("Button", "AtlasTWCloseButton", atlasFrame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", 5, -7)

    -- Lock button
    local lockButton = CreateFrame("Button", "AtlasTWLockButton", atlasFrame)
    lockButton:SetWidth(32)
    lockButton:SetHeight(32)
    lockButton:SetPoint("RIGHT", closeButton, "LEFT", 10, 0)
    lockButton:SetScript("OnClick", function()
        AtlasTW.ToggleLock()
    end)

    -- Create the main textures
    local lockNorm = lockButton:CreateTexture("AtlasTWLockNorm", "BORDER")
    lockButton:SetNormalTexture(lockNorm)
    lockNorm:SetAllPoints(lockButton)
    local lockPush = lockButton:CreateTexture("AtlasTWLockPush", "BORDER")
    lockButton:SetPushedTexture(lockPush)
    lockPush:SetAllPoints(lockButton)
    local lockHighlight = lockButton:CreateTexture(nil, "HIGHLIGHT")
    lockHighlight:SetTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    lockHighlight:SetBlendMode("ADD")
    lockHighlight:SetAllPoints(lockButton)
    lockButton:SetHighlightTexture(lockHighlight)

    -- Type dropdown (Hewdrop-based)
    local dropDownType = CreateFrame("Button", "AtlasTWFrameDropDownType", atlasFrame)
    dropDownType:SetWidth(210)
    dropDownType:SetHeight(24)
    dropDownType:SetPoint("TOPLEFT", 80, -55)

    -- Background texture for dropdown button
    local dropDownTypeBg = dropDownType:CreateTexture(nil, "BACKGROUND")
    dropDownTypeBg:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    dropDownTypeBg:SetVertexColor(0.1, 0.1, 0.1, 0.8)
    dropDownTypeBg:SetAllPoints(dropDownType)

    -- Text display for current selection
    local dropDownTypeText = dropDownType:CreateFontString("AtlasTWFrameDropDownTypeText", "OVERLAY",
        "GameFontHighlightSmall")
    dropDownTypeText:SetPoint("LEFT", dropDownType, "LEFT", 8, 0)
    dropDownTypeText:SetPoint("RIGHT", dropDownType, "RIGHT", -20, 0)
    dropDownTypeText:SetJustifyH("LEFT")

    -- Arrow texture
    local dropDownTypeArrow = dropDownType:CreateTexture(nil, "OVERLAY")
    dropDownTypeArrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
    dropDownTypeArrow:SetWidth(16)
    dropDownTypeArrow:SetHeight(16)
    dropDownTypeArrow:SetPoint("RIGHT", dropDownType, "RIGHT", -2, 0)

    -- Highlight texture
    local dropDownTypeHighlight = dropDownType:CreateTexture(nil, "HIGHLIGHT")
    dropDownTypeHighlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    dropDownTypeHighlight:SetBlendMode("ADD")
    dropDownTypeHighlight:SetAllPoints(dropDownType)

    -- Label above dropdown
    local dropDownTypeLabel = dropDownType:CreateFontString("AtlasTWFrameDropDownTypeLabel", "BACKGROUND",
        "GameFontNormalSmall")
    dropDownTypeLabel:SetText(L["Select Category"])
    dropDownTypeLabel:SetPoint("BOTTOMLEFT", dropDownType, "TOPLEFT", 0, 2)

    -- OnClick to open Hewdrop menu
    dropDownType:SetScript("OnClick", function()
        if AtlasTW.HewdropMenus:IsOpen(dropDownType) then
            AtlasTW.HewdropMenus:Close()
        else
            AtlasTW.HewdropMenus:Close()
            AtlasTW.HewdropMenus:OpenCategoryMenu(dropDownType)
        end
    end)

    -- Map dropdown (Hewdrop-based)
    local dropDown = CreateFrame("Button", "AtlasTWFrameDropDown", atlasFrame)
    dropDown:SetWidth(210)
    dropDown:SetHeight(24)
    dropDown:SetPoint("LEFT", dropDownType, "RIGHT", 10, 0)

    -- Background texture
    local dropDownBg = dropDown:CreateTexture(nil, "BACKGROUND")
    dropDownBg:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    dropDownBg:SetVertexColor(0.1, 0.1, 0.1, 0.8)
    dropDownBg:SetAllPoints(dropDown)

    -- Text display for current selection
    local dropDownText = dropDown:CreateFontString("AtlasTWFrameDropDownText", "OVERLAY", "GameFontHighlightSmall")
    dropDownText:SetPoint("LEFT", dropDown, "LEFT", 8, 0)
    dropDownText:SetPoint("RIGHT", dropDown, "RIGHT", -20, 0)
    dropDownText:SetJustifyH("LEFT")

    -- Arrow texture
    local dropDownArrow = dropDown:CreateTexture(nil, "OVERLAY")
    dropDownArrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
    dropDownArrow:SetWidth(16)
    dropDownArrow:SetHeight(16)
    dropDownArrow:SetPoint("RIGHT", dropDown, "RIGHT", -2, 0)

    -- Highlight texture
    local dropDownHighlight = dropDown:CreateTexture(nil, "HIGHLIGHT")
    dropDownHighlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    dropDownHighlight:SetBlendMode("ADD")
    dropDownHighlight:SetAllPoints(dropDown)

    -- Label above dropdown
    local dropDownLabel = dropDown:CreateFontString("AtlasTWFrameDropDownLabel", "BACKGROUND", "GameFontNormalSmall")
    dropDownLabel:SetText(L["Select Map"])
    dropDownLabel:SetPoint("BOTTOMLEFT", dropDown, "TOPLEFT", 0, 2)

    -- OnClick to open Hewdrop menu
    dropDown:SetScript("OnClick", function()
        if AtlasTW.HewdropMenus:IsOpen(dropDown) then
            AtlasTW.HewdropMenus:Close()
        else
            AtlasTW.HewdropMenus:Close()
            AtlasTW.HewdropMenus:OpenInstanceMenu(dropDown)
        end
    end)

    -- Search box
    local searchBox = CreateFrame("EditBox", "AtlasTWSearchEditBox", atlasFrame, "InputBoxTemplate")
    searchBox:SetWidth(132)
    searchBox:SetHeight(32)
    searchBox:SetPoint("BOTTOMRIGHT", -160, 15)
    searchBox:SetMaxLetters(80)
    searchBox:SetAutoFocus(false)
    searchBox:SetTextInsets(0, 8, 0, 0)

    searchBox:SetScript("OnEnterPressed", function()
        AtlasTW.Search(this:GetText())
        this:ClearFocus()
        AtlasTW.LootBrowserUI.ScrollBarUpdate()
    end)


    -- Switch dropdown is now handled by Hewdrop in AtlasTW.SwitchButtonOnClick()

    -- Switch button
    local switchButton = CreateFrame("Button", "AtlasTWSwitchButton", searchBox, "UIPanelButtonTemplate2")
    switchButton:SetWidth(80)
    switchButton:SetHeight(20)
    switchButton:SetPoint("RIGHT", searchBox, "LEFT", -6, 0)
    switchButton:SetScript("OnClick", function()
        AtlasTW.SwitchButtonOnClick()
    end)

    -- Search button
    local searchButton = CreateFrame("Button", nil, searchBox, "OptionsButtonTemplate")
    searchButton:SetWidth(70)
    searchButton:SetPoint("LEFT", searchBox, "RIGHT", 1, 0)
    searchButton:SetText(L["Search"])
    searchButton:SetScript("OnClick", function()
        AtlasTW.Search(AtlasTWSearchEditBox:GetText())
        AtlasTWSearchEditBox:ClearFocus()
        AtlasTW.LootBrowserUI.ScrollBarUpdate()
    end)

    -- Clear button
    local clearButton = CreateFrame("Button", nil, searchBox, "OptionsButtonTemplate")
    clearButton:SetWidth(70)
    clearButton:SetPoint("LEFT", searchButton, "RIGHT", 0, 0)
    clearButton:SetText(L["Clear"])
    clearButton:SetScript("OnClick", function()
        AtlasTWSearchEditBox:SetText("")
        AtlasTW.Search(AtlasTWSearchEditBox:GetText())
        AtlasTWSearchEditBox:ClearFocus()
        AtlasTW.LootBrowserUI.ScrollBarUpdate()
    end)

    -- Options button
    local optionsButton = CreateFrame("Button", nil, atlasFrame, "OptionsButtonTemplate")
    optionsButton:SetWidth(80)
    optionsButton:SetPoint("TOPRIGHT", -10, -60)
    optionsButton:SetText(L["Options"])
    optionsButton:SetScript("OnClick", function()
        AtlasTW.OptionsOnClick()
    end)
    -- Hide Quests button
    local questsToggleButton = CreateFrame("Button", nil, atlasFrame, "OptionsButtonTemplate")
    questsToggleButton:SetPoint("LEFT", optionsButton, -90, 0)
    questsToggleButton:SetText(L["Quests"])
    questsToggleButton:SetScript("OnClick", function()
        AtlasTW.Quest.ToggleQuestFrame()
    end)

    -- Hide Loot Panel button
    local ShowPanelButton = CreateFrame("Button", nil, atlasFrame, "OptionsButtonTemplate")
    ShowPanelButton:SetText(L["Loot Panel"])
    ShowPanelButton:SetPoint("LEFT", questsToggleButton, -90, 0)
    ShowPanelButton:SetScript("OnClick", function()
        AtlasTW.OptionShowPanelOnClick()
    end)

    -- Loot Filter button
    local filterButton = CreateFrame("Button", "AtlasTWLootFilterButton", atlasFrame, "OptionsButtonTemplate")
    filterButton:SetWidth(130)
    filterButton:SetPoint("LEFT", ShowPanelButton, -130, 0)
    filterButton:SetScript("OnClick", function()
        AtlasTW.OptionFilterModeOnClick()
    end)

    -- Scroll frame
    local scrollBar = CreateFrame("ScrollFrame", "AtlasTWScrollBar", atlasFrame, "FauxScrollFrameTemplate")
    scrollBar:SetWidth(351)
    scrollBar:SetHeight(367)
    scrollBar:SetPoint("TOPLEFT", 530, -186)
    scrollBar:SetScript("OnVerticalScroll", function()
        FauxScrollFrame_OnVerticalScroll(15, AtlasTW.LootBrowserUI.ScrollBarUpdate)
    end)
    scrollBar:SetScript("OnShow", function()
        AtlasTW.LootBrowserUI.ScrollBarUpdate()
    end)

    -- Search container
    local noSearch = atlasFrame:CreateFontString("AtlasTWNoSearch", "ARTWORK", "GameFontDisableSmall")
    noSearch:SetText(L["Search Unavailable"])
    noSearch:SetPoint("TOPLEFT", 540, -555)
    noSearch:SetTextColor(1, 1, 1, 0.4)

    local zoneText = atlasFrame:CreateFontString("AtlasTWZoneText", "OVERLAY", "GameFontHighlightLarge")
    zoneText:SetWidth(295)
    zoneText:SetHeight(20)
    zoneText:SetAlpha(.8)
    zoneText:SetPoint("TOPLEFT", 546, -95)
    zoneText:SetJustifyH("LEFT")

    local locationText = atlasFrame:CreateFontString("AtlasTWLocationText", "OVERLAY", "GameFontNormal")
    locationText:SetWidth(188)
    locationText:SetHeight(15)
    locationText:SetPoint("TOPLEFT", zoneText, 0, -18)
    locationText:SetJustifyH("LEFT")

    local levelRangeText = atlasFrame:CreateFontString("AtlasTWLevelRangeText", "OVERLAY", "GameFontNormal")
    levelRangeText:SetWidth(200)
    levelRangeText:SetHeight(15)
    levelRangeText:SetPoint("TOPLEFT", zoneText, 0, -30)
    levelRangeText:SetJustifyH("LEFT")

    local playerLimitText = atlasFrame:CreateFontString("AtlasTWPlayerLimitText", "OVERLAY", "GameFontNormal")
    playerLimitText:SetWidth(200)
    playerLimitText:SetHeight(15)
    playerLimitText:SetPoint("TOPLEFT", zoneText, 0, -42)
    playerLimitText:SetJustifyH("LEFT")

    local attunText = atlasFrame:CreateFontString("AtlasTWAttunText", "OVERLAY", "GameFontNormal")
    attunText:SetWidth(130)
    attunText:SetHeight(15)
    attunText:SetPoint("TOPLEFT", zoneText, 0, -54)
    attunText:SetJustifyH("LEFT")

    local damageTypeText = atlasFrame:CreateFontString("AtlasTWDamageTypeText", "OVERLAY", "GameFontNormal")
    damageTypeText:SetWidth(300)
    damageTypeText:SetHeight(15)
    damageTypeText:SetPoint("TOPLEFT", zoneText, 0, -67)
    damageTypeText:SetJustifyH("LEFT")

    local entranceText = atlasFrame:CreateFontString("AtlasTWTextentr", "OVERLAY", "GameFontNormal")
    entranceText:SetWidth(70)
    entranceText:SetHeight(15)
    entranceText:SetPoint("TOPLEFT", zoneText, 295, 0)
    entranceText:SetJustifyH("LEFT")
    local entrance1Text = atlasFrame:CreateFontString("AtlasTWTextentr1", "OVERLAY", "GameFontNormal")
    entrance1Text:SetWidth(168)
    entrance1Text:SetHeight(15)
    entrance1Text:SetPoint("TOPLEFT", zoneText, 190, -21)
    entrance1Text:SetJustifyH("LEFT")
    local entrance2Text = atlasFrame:CreateFontString("AtlasTWTextentr2", "OVERLAY", "GameFontNormal")
    entrance2Text:SetWidth(168)
    entrance2Text:SetHeight(15)
    entrance2Text:SetPoint("TOPLEFT", zoneText, 190, -32)
    entrance2Text:SetJustifyH("LEFT")
    local entrance3Text = atlasFrame:CreateFontString("AtlasTWTextentr3", "OVERLAY", "GameFontNormal")
    entrance3Text:SetWidth(168)
    entrance3Text:SetHeight(15)
    entrance3Text:SetPoint("TOPLEFT", zoneText, 190, -44)
    entrance3Text:SetJustifyH("LEFT")
    local entrance4Text = atlasFrame:CreateFontString("AtlasTWTextentr4", "OVERLAY", "GameFontNormal")
    entrance4Text:SetWidth(168)
    entrance4Text:SetHeight(15)
    entrance4Text:SetPoint("TOPLEFT", zoneText, 190, -56)
    entrance4Text:SetJustifyH("LEFT")
    local entrance5Text = atlasFrame:CreateFontString("AtlasTWTextentr5", "OVERLAY", "GameFontNormal")
    entrance5Text:SetWidth(168)
    entrance5Text:SetHeight(15)
    entrance5Text:SetPoint("TOPLEFT", zoneText, 190, -68)
    entrance5Text:SetJustifyH("LEFT")

    -- Textures
    local topTexture = atlasFrame:CreateTexture("ARTWORK")
    topTexture:SetTexture(AtlasTW.PATH .. "Images\\AtlasTWFrame-Top")
    topTexture:SetVertexColor(0.80, 0.60, 0.25)
    topTexture:SetWidth(512)
    topTexture:SetHeight(128)
    topTexture:SetPoint("TOPLEFT", 0, 0)

    local leftTexture = atlasFrame:CreateTexture("ARTWORK")
    leftTexture:SetTexture(AtlasTW.PATH .. "Images\\AtlasTWFrame-Left")
    leftTexture:SetVertexColor(0.80, 0.60, 0.25)
    leftTexture:SetWidth(32)
    leftTexture:SetHeight(256)
    leftTexture:SetPoint("TOPLEFT", 0, -128)

    local bottomTexture = atlasFrame:CreateTexture("ARTWORK")
    bottomTexture:SetTexture(AtlasTW.PATH .. "Images\\AtlasTWFrame-Bottom")
    bottomTexture:SetVertexColor(0.80, 0.60, 0.25)
    bottomTexture:SetWidth(512)
    bottomTexture:SetHeight(256)
    bottomTexture:SetPoint("TOPLEFT", 0, -384)

    local bottom2Texture = atlasFrame:CreateTexture("ARTWORK")
    bottom2Texture:SetTexture(AtlasTW.PATH .. "Images\\AtlasTWFrame-Bottom2")
    bottom2Texture:SetVertexColor(0.80, 0.60, 0.25)
    bottom2Texture:SetWidth(512)
    bottom2Texture:SetHeight(128)
    bottom2Texture:SetPoint("TOPLEFT", 512, -512)

    local rightTexture = atlasFrame:CreateTexture(nil, "ARTWORK")
    rightTexture:SetTexture(AtlasTW.PATH .. "Images\\AtlasTWFrame-Right")
    rightTexture:SetVertexColor(0.80, 0.60, 0.25)
    rightTexture:SetWidth(512)
    rightTexture:SetHeight(512)
    rightTexture:SetPoint("TOPLEFT", 512, 0)

    local titleText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    titleText:SetText(Colors.YELLOW .. AtlasTW.Name)
    titleText:SetPoint("TOPLEFT", 200, -17)

    local versionText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    versionText:SetText(AtlasTW.Version)
    versionText:SetTextColor(0.4, 0.4, 0.4)
    versionText:SetPoint("TOPRIGHT", -52, -17)

    -- Update marker (shown when a newer version is available)
    local updateMarker = atlasFrame:CreateFontString("AtlasTWUpdateMarker", "ARTWORK", "GameFontNormalSmall")
    updateMarker:SetText(Colors.RED2 .. L["Update available"])
    updateMarker:SetPoint("RIGHT", titleText, "LEFT", -10, 0)
    updateMarker:Hide()

    -- Notice text
    local noticeText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    noticeText:SetText(Colors.RED .. L["NoticeText"])
    noticeText:SetPoint("TOP", -20, -17)

    -- Notice link
    local noticeBox = CreateFrame("EditBox", nil, atlasFrame, "InputBoxTemplate")
    noticeBox:SetWidth(230)
    noticeBox:SetHeight(16)
    noticeBox:SetPoint("TOP", 240, -15)
    noticeBox:SetMaxLetters(48)
    noticeBox:SetAutoFocus(false)
    noticeBox:SetText(Colors.RED .. L["NoticeLink"])
    noticeBox:SetScript("OnTextChanged", function()
        if noticeBox:GetText() ~= Colors.RED .. L["NoticeLink"] then
            noticeBox:SetText(Colors.RED .. L["NoticeLink"])
        end
    end)

    -- Map texture
    atlasFrame:CreateTexture("AtlasTWMap", "BACKGROUND")
    AtlasTWMap:SetWidth(512)
    AtlasTWMap:SetHeight(512)
    AtlasTWMap:SetPoint("TOPLEFT", 18, -84)
end

do
    -- Create the minimap button frame
    local buttonFrame = CreateFrame("Frame", "AtlasTWButtonFrame", Minimap)
    buttonFrame:SetFrameStrata("MEDIUM")
    buttonFrame:SetWidth(32)
    buttonFrame:SetHeight(32)
    buttonFrame:SetPoint("TOPLEFT", 2, 0)
    buttonFrame:EnableMouse(true)
    buttonFrame:RegisterEvent("VARIABLES_LOADED")
    buttonFrame:Show()

    -- Frame scripts
    buttonFrame:SetScript("OnEvent", function()
        AtlasTW.MinimapButtonInit()
    end)

    -- Create the button
    local button = CreateFrame("Button", "AtlasTWMinimapButton", buttonFrame)
    button:SetWidth(33)
    button:SetHeight(33)
    button:SetPoint("TOPLEFT", 0, 0)
    button:RegisterForDrag("RightButton")

    -- Button scripts
    button:SetScript("OnHide", function()
        button:StopMovingOrSizing()
        button.isMoving = false
    end)
    button:SetScript("OnDragStart", function()
        button.isMoving = true
        AtlasTW.MinimapButtonBeingDragged()
    end)
    button:SetScript("OnDragStop", function()
        button:StopMovingOrSizing()
        button.isMoving = false
    end)

    button:SetScript("OnClick", function() AtlasTW.ToggleAtlas() end)
    button:SetScript("OnMouseUp", function()
        button:StopMovingOrSizing()
        button.isMoving = false
        if (arg1 == "MiddleButton") then
            AtlasTW.OptionsOnClick()
        end
    end)
    button:SetScript("OnEnter", function() AtlasTW.MinimapButtonOnEnter() end)
    button:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Button textures
    local icon = button:CreateTexture("AtlasTWButtonIcon", "BORDER")
    icon:SetTexture("Interface\\WorldMap\\WorldMap-Icon")
    icon:SetWidth(20)
    icon:SetHeight(20)
    icon:SetPoint("CENTER", -2, 1)
    icon:SetVertexColor(1, 1, 0)

    local border = button:CreateTexture("AtlasTWButtonBorder", "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetWidth(52)
    border:SetHeight(52)
    border:SetPoint("TOPLEFT", 0, 0)

    local highlight = button:CreateTexture()
    highlight:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    highlight:SetBlendMode("ADD")
    button:SetHighlightTexture(highlight)
end

-- World Map cursor coordinates (shows cursor coords on default World Map)
-- Respects AtlasTWOptions.AtlasCursorCoords setting
do
    -- Create the coordinates if Blizzard world map frames are available
    local function CreateAtlasWorldMapCoords()
        if AtlasTWWorldMapCursorText then return true end
        if not WorldMapFrame or not WorldMapDetailFrame then return false end

        local wmCoordText = WorldMapDetailFrame:CreateFontString("AtlasTWWorldMapCursorText", "OVERLAY", "GameFontNormal")
        wmCoordText:SetTextColor(1, 1, 1)
        wmCoordText:Hide()
        -- Anchor text at the bottom-left of the World Map (fixed position)
        wmCoordText:SetPoint("BOTTOMLEFT", WorldMapDetailFrame, 10, 8)

        local function wm_round1(x)
            return math.floor(x * 10 + .5) / 10
        end

        -- Helper: approximate effective scale for frames in WoW 1.12 (multiply parent scales)
        local function wm_getEffectiveScale(f)
            local s = 1
            while f do
                local fs = f:GetScale()
                if fs then s = s * fs end
                f = f:GetParent()
            end
            return s
        end

        WorldMapDetailFrame:SetScript("OnUpdate", function()
            -- Respect option and visibility
            if not AtlasTWOptions or not AtlasTWOptions.AtlasCursorCoords or not WorldMapFrame:IsVisible() then
                wmCoordText:Hide()
                return
            end
            local cursorX, cursorY = GetCursorPosition()
            -- Use effective scale of the detail frame to be correct when the map is reduced
            local wmScale = wm_getEffectiveScale(WorldMapDetailFrame) or 1
            cursorX = cursorX / wmScale
            cursorY = cursorY / wmScale
            local mapLeft, mapBottom = WorldMapDetailFrame:GetLeft(), WorldMapDetailFrame:GetBottom()
            local mapWidth, mapHeight = WorldMapDetailFrame:GetWidth(), WorldMapDetailFrame:GetHeight()
            if not mapLeft or not mapBottom or not mapWidth or not mapHeight then
                wmCoordText:Hide()
                return
            end
            local relX = cursorX - mapLeft
            local relY = cursorY - mapBottom
            if relX < 0 or relY < 0 or relX > mapWidth or relY > mapHeight then
                wmCoordText:Hide()
                return
            end
            if not wmCoordText:IsShown() then wmCoordText:Show() end
            local fracX = relX / mapWidth
            local fracY = 1 - (relY / mapHeight)
            local xPercent = wm_round1(fracX * 100)
            local yPercent = wm_round1(fracY * 100)
            wmCoordText:SetText(xPercent .. ", " .. yPercent)
        end)
        return true
    end

    -- Try to create immediately
    CreateAtlasWorldMapCoords()
end
