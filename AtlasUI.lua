local _G = getfenv()
local atlasTW = _G.AtlasTW
local L = AceLibrary("AceLocale-2.2"):new("Atlas")

local function atlas_CreateFrames()
    -- Create the main Atlas frame
    local atlasFrame = CreateFrame("Frame", "AtlasFrame", UIParent)
    atlasFrame:SetFrameStrata("HIGH")
    atlasFrame:SetToplevel(true)
    atlasFrame:SetWidth(921)
    atlasFrame:SetHeight(601)
    atlasFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -104)
    atlasFrame:Hide()
    atlasFrame:SetMovable(true)
    atlasFrame:EnableMouse(true)
	atlasFrame:RegisterForDrag("LeftButton")
	atlasFrame:RegisterEvent("ADDON_LOADED")

    --Allows Atlas to be closed with the Escape key
	tinsert(UISpecialFrames, "AtlasFrame")

	--Setting up slash commands involves referencing some strage auto-generated variables
	SLASH_ATLAS1 = "/atlas"
	SlashCmdList["ATLAS"] = Atlas_SlashCommand

    -- Close button
    local closeButton = CreateFrame("Button", "AtlasFrameCloseButton", atlasFrame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", atlasFrame, "TOPRIGHT", 5, -7)

    -- Lock button
    local lockButton = CreateFrame("Button", "AtlasFrameLockButton", atlasFrame)
    lockButton:SetWidth(32)
    lockButton:SetHeight(32)
    lockButton:SetPoint("RIGHT", closeButton, "LEFT", 10, 0)
    lockButton:SetScript("OnClick", function()
        Atlas_ToggleLock()
    end)

    -- Создаем глобальные текстуры
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
    dropDownType:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 60, -50)
    local dropDownTypeLabel = dropDownType:CreateFontString("AtlasFrameDropDownTypeLabel", "BACKGROUND", "GameFontNormalSmall")
    dropDownTypeLabel:SetText(ATLAS_STRING_SELECT_CAT)
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
    searchBox:SetPoint("BOTTOMRIGHT", atlasFrame, "BOTTOMRIGHT", -160, 15)
    searchBox:SetMaxLetters(80)
    searchBox:SetAutoFocus(false)
    searchBox:SetTextInsets(0, 8, 0, 0)

    searchBox:SetScript("OnEnterPressed", function()
        Atlas_SearchAndRefresh(this:GetText())
        this:ClearFocus()
    end)

    searchBox:CreateFontString("AtlasSearchString", "BACKGROUND", "GameFontNormal")

    -- Switch dropdown
    CreateFrame("Frame", "AtlasSwitchDD", atlasFrame, "UIDropDownMenuTemplate")

    -- Switch button
    local switchButton = CreateFrame("Button", "AtlasSwitchButton", searchBox, "UIPanelButtonTemplate2")
    switchButton:SetWidth(80)
    switchButton:SetHeight(20)
    switchButton:SetPoint("RIGHT", searchBox, "LEFT", -6, 0)
    switchButton:SetScript("OnClick", function()
        AtlasSwitchButton_OnClick()
    end)

    -- Search button
    local searchButton = CreateFrame("Button", "AtlasSearchButton", searchBox, "UIPanelButtonTemplate2")
    searchButton:SetWidth(69)
    searchButton:SetHeight(32)
    searchButton:SetPoint("LEFT", searchBox, "RIGHT", 1, 0)
    searchButton:SetText(L["Search"])
    searchButton:SetScript("OnClick", function()
        Atlas_SearchAndRefresh(AtlasSearchEditBox:GetText())
        AtlasSearchEditBox:ClearFocus()
    end)

    -- Clear button
    local clearButton = CreateFrame("Button", "AtlasSearchClearButton", searchBox, "UIPanelButtonTemplate2")
    clearButton:SetWidth(72)
    clearButton:SetHeight(32)
    clearButton:SetPoint("LEFT", searchButton, "RIGHT", 0, 0)
    clearButton:SetText(L["Clear"])
    clearButton:SetScript("OnClick", function()
        AtlasSearchEditBox:SetText("")
        Atlas_SearchAndRefresh(AtlasSearchEditBox:GetText())
        AtlasSearchEditBox:ClearFocus()
    end)

    -- Options button
    local optionsButton = CreateFrame("Button", "AtlasFrameOptionsButton", atlasFrame, "UIPanelButtonTemplate2")
    optionsButton:SetWidth(80)
    optionsButton:SetPoint("TOPRIGHT", atlasFrame, "TOPRIGHT", -18, -60)
    optionsButton:SetText(L["Options"])
    optionsButton:SetScript("OnClick", function()
        AtlasOptions_Toggle()
    end)

    -- Hide Quests button
    local questsToggleButton = CreateFrame("Button", "", atlasFrame, "OptionsButtonTemplate")
    questsToggleButton:SetPoint("LEFT", optionsButton, "LEFT", -95, 0)
    questsToggleButton:SetText(L["Quests"])
    questsToggleButton:SetScript("OnClick", function()
        KQuestCLOSE_OnClick()
    end)

    -- Hide Loot Panel button
    local hidePanelButton = CreateFrame("Button", "", atlasFrame, "OptionsButtonTemplate")
    hidePanelButton:SetText(L["Loot Panel"])
    hidePanelButton:SetPoint("LEFT", questsToggleButton, "LEFT", -95, 0)
    hidePanelButton:SetScript("OnClick", function()
        local hidePanelStatus = AtlasLootCharDB.HidePanel
        AtlasLootCharDB.HidePanel = not hidePanelStatus
        if hidePanelStatus then
            AtlasLootPanel:Show()
        else
            AtlasLootPanel:Hide()
        end
        AtlasLoot_SetupForAtlas()
    end)

    -- Scroll frame
    local scrollBar = CreateFrame("ScrollFrame", "AtlasScrollBar", atlasFrame, "FauxScrollFrameTemplate")
    scrollBar:SetWidth(351)
    scrollBar:SetHeight(367)
    scrollBar:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 530, -186)
    scrollBar:SetScript("OnVerticalScroll", function()
        FauxScrollFrame_OnVerticalScroll(15, AtlasLoot_AtlasScrollBar_Update)
    end)
    scrollBar:SetScript("OnShow", function()
        AtlasLoot_AtlasScrollBar_Update()
    end)

    -- Search container
    local searchContainer = CreateFrame("Frame", "AtlasSearchContainer", atlasFrame)
    searchContainer:SetWidth(362)
    searchContainer:SetHeight(32)
    searchContainer:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 540, -555)

    local noSearch = searchContainer:CreateFontString("AtlasNoSearch", "ARTWORK", "GameFontDisableSmall")
    noSearch:SetText(ATLAS_SEARCH_UNAVAIL)
    noSearch:SetPoint("CENTER", searchContainer, "CENTER")
    noSearch:SetTextColor(1, 1, 1, 0.4)

    -- Zone name frame
    local zoneName = CreateFrame("Frame", "AtlasText_ZoneName", atlasFrame)
    zoneName:SetWidth(351)
    zoneName:SetHeight(20)
    zoneName:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 546, -97)

    local zoneText = zoneName:CreateFontString("AtlasText_ZoneName_Text", "OVERLAY", "GameFontHighlightLarge")
    zoneText:SetWidth(351)
    zoneText:SetHeight(20)
    zoneText:SetAllPoints(zoneName)
    zoneText:SetJustifyH("LEFT")

    zoneName:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Location frame
    local location = CreateFrame("Frame", "AtlasText_Location", atlasFrame)
    location:SetWidth(351)
    location:SetHeight(15)
    location:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -20)

    local locationText = location:CreateFontString("AtlasText_Location_Text", "OVERLAY", "GameFontNormal")
    locationText:SetWidth(351)
    locationText:SetHeight(15)
    locationText:SetAllPoints(location)
    locationText:SetJustifyH("LEFT")

    location:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Level range frame
    local levelRange = CreateFrame("Frame", "AtlasText_LevelRange", atlasFrame)
    levelRange:SetWidth(351)
    levelRange:SetHeight(15)
    levelRange:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -35)

    local levelRangeText = levelRange:CreateFontString("AtlasText_LevelRange_Text", "OVERLAY", "GameFontNormal")
    levelRangeText:SetWidth(351)
    levelRangeText:SetHeight(15)
    levelRangeText:SetAllPoints(levelRange)
    levelRangeText:SetJustifyH("LEFT")

    levelRange:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Min level frame
    local minLevel = CreateFrame("Frame", "AtlasText_MinLevel", atlasFrame)
    minLevel:SetWidth(351)
    minLevel:SetHeight(15)
    minLevel:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -50)

    local minLevelText = minLevel:CreateFontString("AtlasText_MinLevel_Text", "OVERLAY", "GameFontNormal")
    minLevelText:SetWidth(351)
    minLevelText:SetHeight(15)
    minLevelText:SetAllPoints(minLevel)
    minLevelText:SetJustifyH("LEFT")

    minLevel:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Player limit frame
    local playerLimit = CreateFrame("Frame", "AtlasText_PlayerLimit", atlasFrame)
    playerLimit:SetWidth(351)
    playerLimit:SetHeight(15)
    playerLimit:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -65)

    local playerLimitText = playerLimit:CreateFontString("AtlasText_PlayerLimit_Text", "OVERLAY", "GameFontNormal")
    playerLimitText:SetWidth(351)
    playerLimitText:SetHeight(15)
    playerLimitText:SetAllPoints(playerLimit)
    playerLimitText:SetJustifyH("LEFT")

    playerLimit:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Textures
    local topTexture = atlasFrame:CreateTexture(nil, "ARTWORK")
    topTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Top")
    topTexture:SetWidth(512)
    topTexture:SetHeight(128)
    topTexture:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 0, 0)

    local leftTexture = atlasFrame:CreateTexture(nil, "ARTWORK")
    leftTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Left")
    leftTexture:SetWidth(32)
    leftTexture:SetHeight(256)
    leftTexture:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 0, -128)

    local bottomTexture = atlasFrame:CreateTexture(nil, "ARTWORK")
    bottomTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Bottom")
    bottomTexture:SetWidth(512)
    bottomTexture:SetHeight(256)
    bottomTexture:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 0, -384)

    local bottom2Texture = atlasFrame:CreateTexture(nil, "ARTWORK")
    bottom2Texture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Bottom2")
    bottom2Texture:SetWidth(512)
    bottom2Texture:SetHeight(128)
    bottom2Texture:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 512, -512)

    local rightTexture = atlasFrame:CreateTexture(nil, "ARTWORK")
    rightTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Right")
    rightTexture:SetWidth(512)
    rightTexture:SetHeight(512)
    rightTexture:SetPoint("TOPLEFT", atlasFrame, "TOPLEFT", 512, 0)

    local titleText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    titleText:SetText(atlasTW.Name)
    titleText:SetPoint("TOP", atlasFrame, "TOP", 20, -17)

    local versionText = atlasFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    versionText:SetText(atlasTW.Version)
    versionText:SetTextColor(0.4, 0.4, 0.4)
    versionText:SetPoint("TOPRIGHT", atlasFrame, "TOPRIGHT", -52, -18)

    -- Map texture
    atlasFrame:CreateTexture("AtlasMap", "BACKGROUND")
	AtlasMap:SetWidth(512)
	AtlasMap:SetHeight(512)
	AtlasMap:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84)

    -- Scripts
    atlasFrame:SetScript("OnEvent", function()
        Atlas_OnEvent()
    end)

    atlasFrame:SetScript("OnShow", function()
        Atlas_OnShow()
    end)

    atlasFrame:SetScript("OnHide", function()
        atlasFrame:StopMovingOrSizing()
    end)

    atlasFrame:SetScript("OnDragStart", function()
        if(arg1 == "LeftButton") then
            Atlas_StartMoving()
        end
    end)

    atlasFrame:SetScript("OnDragStop", function()
        atlasFrame:StopMovingOrSizing()
    end)

    atlasFrame:SetScript("OnMouseUp", function()
        atlasFrame:StopMovingOrSizing()
        Atlas_OnClick()
    end)

--[[     -- World map frame -- TODO не знаю зачем это
    local worldMapFrame = CreateFrame("Frame", "Atlas_WorldMap_Frame", WorldMapFrame)
    worldMapFrame:Hide()

    local worldMapText = worldMapFrame:CreateFontString("Atlas_WorldMap_Frame_Text", "OVERLAY", "GameFontHighlightSmall")
    worldMapText:SetPoint("BOTTOM", WorldMapPositioningGuide, "BOTTOM", 0, 11)

    worldMapFrame:SetScript("OnHide", function()
        SetMapToCurrentZone()
    end)
 ]]
    return atlasFrame
end

local function atlasButton_CreateFrames()
    -- Create the minimap button frame
    local buttonFrame = CreateFrame("Frame", "AtlasButtonFrame", Minimap)
    buttonFrame:SetFrameStrata("LOW")
    buttonFrame:SetWidth(32)
    buttonFrame:SetHeight(32)
    buttonFrame:SetPoint("TOPLEFT", Minimap, "RIGHT", 2, 0)
    buttonFrame:EnableMouse(true)
    buttonFrame:RegisterEvent("VARIABLES_LOADED")
    buttonFrame:Show()

    -- Frame scripts
    buttonFrame:SetScript("OnEvent", function()
        AtlasButton_Init()
    end)

    -- Create the button
    local button = CreateFrame("Button", "AtlasButton", buttonFrame)
    button:SetWidth(33)
    button:SetHeight(33)
    button:SetPoint("TOPLEFT", buttonFrame, "TOPLEFT", 0, 0)
    button:RegisterForDrag("RightButton")
    button.dragme = false

    -- Button scripts
    button:SetScript("OnDragStart", function()
        this.dragme = true
    end)
    button:SetScript("OnDragStop", function()
        this.dragme = false
    end)

    button:SetScript("OnUpdate", function()
        if (this.dragme == true) then
            AtlasButton_BeingDragged()
        end
    end)

    button:SetScript("OnClick", function()
        AtlasButton_OnClick()
    end)

    button:SetScript("OnMouseUp", function()
        if (arg1 == "MiddleButton") then
            AtlasOptions_Toggle()
        end
    end)

    button:SetScript("OnEnter", function()
        AtlasButton_OnEnter()
    end)

    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Button textures
    local icon = button:CreateTexture("AtlasButtonIcon", "BORDER")
    icon:SetTexture("Interface\\WorldMap\\WorldMap-Icon")
    icon:SetWidth(20)
    icon:SetHeight(20)
    icon:SetPoint("CENTER", button, "CENTER", -2, 1)
    icon:SetVertexColor(1, 1, 0)

    local border = button:CreateTexture("AtlasButtonBorder", "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetWidth(52)
    border:SetHeight(52)
    border:SetPoint("TOPLEFT", button, "TOPLEFT")

    local highlight = button:CreateTexture()
    highlight:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    highlight:SetBlendMode("ADD")
    button:SetHighlightTexture(highlight)

    return buttonFrame
end

-- Call the function to create frames when this file is loaded
atlas_CreateFrames()
atlasButton_CreateFrames()