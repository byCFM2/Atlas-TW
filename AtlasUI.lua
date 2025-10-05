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
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

local L = AtlasTW.Local

do
    -- Create the main Atlas frame
    local atlasFrame = CreateFrame("Frame", "AtlasFrame", UIParent)
    atlasFrame:SetFrameStrata("LOW")
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
	tinsert(UISpecialFrames, "AtlasFrame")

	--Setting up slash commands involves referencing some strage auto-generated variables
	SLASH_ATLAS1 = "/atlas"
	SlashCmdList["ATLAS"] = AtlasTW.SlashCommand

    -- Close button
    local closeButton = CreateFrame("Button", "AtlasFrameCloseButton", atlasFrame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", 5, -7)

    -- Lock button
    local lockButton = CreateFrame("Button", "AtlasFrameLockButton", atlasFrame)
    lockButton:SetWidth(32)
    lockButton:SetHeight(32)
    lockButton:SetPoint("RIGHT", closeButton, "LEFT", 10, 0)
    lockButton:SetScript("OnClick", function()
        AtlasTW.ToggleLock()
    end)

    -- Create the main textures
    local lockNorm = lockButton:CreateTexture("AtlasLockNorm", "BORDER")
    lockButton:SetNormalTexture(lockNorm)
    lockNorm:SetAllPoints(lockButton)
    local lockPush  = lockButton:CreateTexture("AtlasLockPush", "BORDER")
    lockButton:SetPushedTexture(lockPush)
    lockPush:SetAllPoints(lockButton)
    local lockHighlight = lockButton:CreateTexture(nil, "HIGHLIGHT")
    lockHighlight:SetTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    lockHighlight:SetBlendMode("ADD")
    lockHighlight:SetAllPoints(lockButton)
    lockButton:SetHighlightTexture(lockHighlight)

    -- Type dropdown
    local dropDownType = CreateFrame("Button", "AtlasFrameDropDownType", atlasFrame, "UIDropDownMenuTemplate")
    dropDownType:SetPoint("TOPLEFT", 60, -50)
    local dropDownTypeLabel = dropDownType:CreateFontString("AtlasFrameDropDownTypeLabel", "BACKGROUND", "GameFontNormalSmall")
    dropDownTypeLabel:SetText(L["Select Category"])
    dropDownTypeLabel:SetPoint("BOTTOMLEFT", dropDownType, "TOPLEFT", 21, 0)

    -- Map dropdown
    local dropDown = CreateFrame("Button", "AtlasFrameDropDown", atlasFrame, "UIDropDownMenuTemplate")
    dropDown:SetPoint("LEFT", dropDownType, "RIGHT", 0, 0)
    local dropDownLabel = dropDown:CreateFontString("AtlasFrameDropDownLabel", "BACKGROUND", "GameFontNormalSmall")
    dropDownLabel:SetText(L["Select Map"])
    dropDownLabel:SetPoint("BOTTOMLEFT", dropDown, "TOPLEFT", 21, 0)

    -- Search box
    local searchBox = CreateFrame("EditBox", "AtlasSearchEditBox", atlasFrame, "InputBoxTemplate")
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

    -- Switch dropdown
    CreateFrame("Frame", "AtlasSwitchDD", atlasFrame, "UIDropDownMenuTemplate")

    -- Switch button
    local switchButton = CreateFrame("Button", "AtlasSwitchButton", searchBox, "UIPanelButtonTemplate2")
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
        AtlasTW.Search(AtlasSearchEditBox:GetText())
        AtlasSearchEditBox:ClearFocus()
        AtlasTW.LootBrowserUI.ScrollBarUpdate()
    end)

    -- Clear button
    local clearButton = CreateFrame("Button", nil, searchBox, "OptionsButtonTemplate")
    clearButton:SetWidth(70)
    clearButton:SetPoint("LEFT", searchButton, "RIGHT", 0, 0)
    clearButton:SetText(L["Clear"])
    clearButton:SetScript("OnClick", function()
        AtlasSearchEditBox:SetText("")
        AtlasTW.Search(AtlasSearchEditBox:GetText())
        AtlasSearchEditBox:ClearFocus()
        AtlasTW.LootBrowserUI.ScrollBarUpdate()
    end)

    -- Options button
    local optionsButton = CreateFrame("Button", nil, atlasFrame, "OptionsButtonTemplate")
    optionsButton:SetWidth(80)
    optionsButton:SetPoint("TOPRIGHT", -18, -60)
    optionsButton:SetText(L["Options"])
    optionsButton:SetScript("OnClick", function()
        AtlasTW.OptionsOnClick()
    end)
    -- Hide Quests button
    local questsToggleButton = CreateFrame("Button", nil, atlasFrame, "OptionsButtonTemplate")
    questsToggleButton:SetPoint("LEFT", optionsButton, "LEFT", -95, 0)
    questsToggleButton:SetText(L["Quests"])
    questsToggleButton:SetScript("OnClick", function()
        AtlasTW.Quest.ToggleQuestFrame()
    end)

    -- Hide Loot Panel button
    local ShowPanelButton = CreateFrame("Button", nil, atlasFrame, "OptionsButtonTemplate")
    ShowPanelButton:SetText(L["Loot Panel"])
    ShowPanelButton:SetPoint("LEFT", questsToggleButton, "LEFT", -95, 0)
    ShowPanelButton:SetScript("OnClick", function()
        AtlasTW.OptionShowPanelOnClick()
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
    zoneText:SetWidth(350)
    zoneText:SetHeight(20)
    zoneText:SetPoint("TOPLEFT", 546, -95)
    zoneText:SetJustifyH("LEFT")

    local locationText = atlasFrame:CreateFontString("AtlasTWLocationText", "OVERLAY", "GameFontNormal")
    locationText:SetWidth(200)
    locationText:SetHeight(15)
    locationText:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 0, -18)
    locationText:SetJustifyH("LEFT")

    local levelRangeText = atlasFrame:CreateFontString("AtlasTWLevelRangeText", "OVERLAY", "GameFontNormal")
    levelRangeText:SetWidth(200)
    levelRangeText:SetHeight(15)
    levelRangeText:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 0, -30)
    levelRangeText:SetJustifyH("LEFT")

    local playerLimitText = atlasFrame:CreateFontString("AtlasTWPlayerLimitText", "OVERLAY", "GameFontNormal")
    playerLimitText:SetWidth(200)
    playerLimitText:SetHeight(15)
    playerLimitText:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 0, -42)
    playerLimitText:SetJustifyH("LEFT")

    local attunText = atlasFrame:CreateFontString("AtlasTWAttunText", "OVERLAY", "GameFontNormal")
    attunText:SetWidth(130)
    attunText:SetHeight(15)
    attunText:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 0, -54)
    attunText:SetJustifyH("LEFT")

    local damageTypeText = atlasFrame:CreateFontString("AtlasTWDamageTypeText", "OVERLAY", "GameFontNormal")
    damageTypeText:SetWidth(300)
    damageTypeText:SetHeight(15)
    damageTypeText:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 0, -67)
    damageTypeText:SetJustifyH("LEFT")

    local entranceText = atlasFrame:CreateFontString("AtlasTWTextentr", "OVERLAY", "GameFontNormal")
    entranceText:SetWidth(70)
    entranceText:SetHeight(15)
    entranceText:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 295, 0)
    entranceText:SetJustifyH("LEFT")
    local entrance1Text = atlasFrame:CreateFontString("AtlasTWTextentr1", "OVERLAY", "GameFontNormal")
    entrance1Text:SetWidth(168)
    entrance1Text:SetHeight(15)
    entrance1Text:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 190, -21)
    entrance1Text:SetJustifyH("LEFT")
    local entrance2Text = atlasFrame:CreateFontString("AtlasTWTextentr2", "OVERLAY", "GameFontNormal")
    entrance2Text:SetWidth(168)
    entrance2Text:SetHeight(15)
    entrance2Text:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 190, -32)
    entrance2Text:SetJustifyH("LEFT")
    local entrance3Text = atlasFrame:CreateFontString("AtlasTWTextentr3", "OVERLAY", "GameFontNormal")
    entrance3Text:SetWidth(168)
    entrance3Text:SetHeight(15)
    entrance3Text:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 190, -44)
    entrance3Text:SetJustifyH("LEFT")
    local entrance4Text = atlasFrame:CreateFontString("AtlasTWTextentr4", "OVERLAY", "GameFontNormal")
    entrance4Text:SetWidth(168)
    entrance4Text:SetHeight(15)
    entrance4Text:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 190, -56)
    entrance4Text:SetJustifyH("LEFT")
    local entrance5Text = atlasFrame:CreateFontString("AtlasTWTextentr5", "OVERLAY", "GameFontNormal")
    entrance5Text:SetWidth(168)
    entrance5Text:SetHeight(15)
    entrance5Text:SetPoint("TOPLEFT", zoneText, "TOPLEFT", 190, -68)
    entrance5Text:SetJustifyH("LEFT")

    -- Textures
    local topTexture = atlasFrame:CreateTexture("ARTWORK")
    topTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Top")
    topTexture:SetVertexColor(0.80, 0.60, 0.25)
    topTexture:SetWidth(512)
    topTexture:SetHeight(128)
    topTexture:SetPoint("TOPLEFT", 0, 0)

    local leftTexture = atlasFrame:CreateTexture("ARTWORK")
    leftTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Left")
    leftTexture:SetVertexColor(0.80, 0.60, 0.25)
    leftTexture:SetWidth(32)
    leftTexture:SetHeight(256)
    leftTexture:SetPoint("TOPLEFT", 0, -128)

    local bottomTexture = atlasFrame:CreateTexture("ARTWORK")
    bottomTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Bottom")
    bottomTexture:SetVertexColor(0.80, 0.60, 0.25)
    bottomTexture:SetWidth(512)
    bottomTexture:SetHeight(256)
    bottomTexture:SetPoint("TOPLEFT", 0, -384)

    local bottom2Texture = atlasFrame:CreateTexture("ARTWORK")
    bottom2Texture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Bottom2")
    bottom2Texture:SetVertexColor(0.80, 0.60, 0.25)
    bottom2Texture:SetWidth(512)
    bottom2Texture:SetHeight(128)
    bottom2Texture:SetPoint("TOPLEFT", 512, -512)

    local rightTexture = atlasFrame:CreateTexture(nil, "ARTWORK")
    rightTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Right")
    rightTexture:SetVertexColor(0.80, 0.60, 0.25)
    rightTexture:SetWidth(512)
    rightTexture:SetHeight(512)
    rightTexture:SetPoint("TOPLEFT", 512, 0)

    local titleText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    titleText:SetText("|cFFD8D800"..AtlasTW.Name)
    titleText:SetPoint("TOPLEFT", 200, -17)

    local versionText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    versionText:SetText(AtlasTW.Version)
    versionText:SetTextColor(0.4, 0.4, 0.4)
    versionText:SetPoint("TOPRIGHT", -52, -17)

    -- Notice text
    local noticeText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    noticeText:SetText(L["NoticeText"])
    noticeText:SetPoint("TOP", -20, -17)

    -- Notice link
    local noticeBox = CreateFrame("EditBox", nil, atlasFrame, "InputBoxTemplate")
    noticeBox:SetWidth(230)
    noticeBox:SetHeight(16)
    noticeBox:SetPoint("TOP", 240, -15)
    noticeBox:SetMaxLetters(48)
    noticeBox:SetAutoFocus(false)
    noticeBox:SetText(L["NoticeLink"])
    noticeBox:SetScript("OnTextChanged", function()
        if noticeBox:GetText() ~= L["NoticeLink"] then
            noticeBox:SetText(L["NoticeLink"])
        end
    end)

    -- Map texture
    atlasFrame:CreateTexture("AtlasMap", "BACKGROUND")
	AtlasMap:SetWidth(512)
	AtlasMap:SetHeight(512)
	AtlasMap:SetPoint("TOPLEFT", 18, -84)
end

do
    -- Create the minimap button frame
    local buttonFrame = CreateFrame("Frame", "AtlasButtonFrame", Minimap)
    buttonFrame:SetFrameStrata("LOW")
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
    local button = CreateFrame("Button", "AtlasMinimapButton", buttonFrame)
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
    local icon = button:CreateTexture("AtlasButtonIcon", "BORDER")
    icon:SetTexture("Interface\\WorldMap\\WorldMap-Icon")
    icon:SetWidth(20)
    icon:SetHeight(20)
    icon:SetPoint("CENTER", -2, 1)
    icon:SetVertexColor(1, 1, 0)

    local border = button:CreateTexture("AtlasButtonBorder", "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetWidth(52)
    border:SetHeight(52)
    border:SetPoint("TOPLEFT", 0, 0)

    local highlight = button:CreateTexture()
    highlight:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    highlight:SetBlendMode("ADD")
    button:SetHighlightTexture(highlight)
end

-- World Map cursor coordinates overlay (shows cursor coords on default World Map)
-- Creates an overlay on the WorldMap that displays the cursor coordinates
-- Respects AtlasTWOptions.AtlasCursorCoords setting
-- @since 1.1.0
do
    -- Create the overlay if Blizzard world map frames are available
    local function CreateAtlasWorldMapOverlay()
        if AtlasWorldMapCursorOverlay then return true end
        if not WorldMapFrame or not WorldMapDetailFrame then return false end

        local worldMapOverlay = CreateFrame("Frame", "AtlasWorldMapCursorOverlay", WorldMapFrame)
        worldMapOverlay:SetFrameStrata("TOOLTIP")
        worldMapOverlay:ClearAllPoints()
        worldMapOverlay:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", 0, 0)
        worldMapOverlay:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT", 0, 0)
        worldMapOverlay:Show()

        local wmCoordText = worldMapOverlay:CreateFontString("AtlasWorldMapCursorOverlayText", "OVERLAY", "GameFontNormal")
        wmCoordText:SetText("")
        wmCoordText:SetTextColor(1, 1, 1)
        wmCoordText:SetShadowColor(0, 0, 0)
        wmCoordText:SetShadowOffset(1, -1)
        wmCoordText:Hide()
        -- Anchor text at the bottom-left of the World Map (fixed position)
        wmCoordText:ClearAllPoints()
        wmCoordText:SetPoint("BOTTOMLEFT", worldMapOverlay, "BOTTOMLEFT", 10, 8)
        local function wm_round1(x)
            return math.floor(x * 10 + 0.5) / 10
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

        worldMapOverlay:SetScript("OnUpdate", function()
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
    CreateAtlasWorldMapOverlay()
    -- Also try on relevant events until it succeeds
    local init = CreateFrame("Frame", "AtlasWorldMapCursorOverlayInit", UIParent)
    init:RegisterEvent("WORLD_MAP_UPDATE")
    init:RegisterEvent("PLAYER_ENTERING_WORLD")
    init:SetScript("OnEvent", function()
        if CreateAtlasWorldMapOverlay() then
            init:UnregisterEvent("WORLD_MAP_UPDATE")
            init:UnregisterEvent("PLAYER_ENTERING_WORLD")
        end
    end)
end