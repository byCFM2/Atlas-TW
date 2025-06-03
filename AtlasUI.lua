local _G = getfenv()
local function atlas_CreateFrames()
    -- Create the AtlasEntryTemplate button template
    local function CreateAtlasEntryTemplate(name)
        local button = CreateFrame("Button", name, nil, nil)
        button:Hide()
        button:SetWidth(330)
        button:SetHeight(15)

        local text = button:CreateFontString(name.."_Text", "OVERLAY", "GameFontHighlight")
        text:SetWidth(330)
        text:SetHeight(15)
        text:SetJustifyH("LEFT")
        text:SetWordWrap(false)

        button:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        return button
    end

    -- Create the main Atlas frame
    local AtlasFrame = CreateFrame("Frame", "AtlasFrame", UIParent)
    AtlasFrame:SetFrameStrata("HIGH")
    AtlasFrame:SetWidth(921)
    AtlasFrame:SetHeight(601)
    AtlasFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -104)
    AtlasFrame:SetMovable(true)
    AtlasFrame:EnableMouse(true)
    AtlasFrame:Hide()

    -- Close button
    local closeButton = CreateFrame("Button", "AtlasFrameCloseButton", AtlasFrame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", AtlasFrame, "TOPRIGHT", 5, -7)

    -- Lock button
    local lockButton = CreateFrame("Button", "AtlasFrameLockButton", AtlasFrame)
    lockButton:SetWidth(32)
    lockButton:SetHeight(32)
    lockButton:SetPoint("RIGHT", closeButton, "LEFT", 10, 0)
    lockButton:SetScript("OnClick", function()
        Atlas_ToggleLock()
    end)

    local lockNorm = lockButton:CreateTexture("AtlasLockNorm", "BORDER")
    lockButton:SetNormalTexture(lockNorm)

    local lockPush = lockButton:CreateTexture("AtlasLockPush", "BORDER")
    lockButton:SetPushedTexture(lockPush)

    local lockHighlight = lockButton:CreateTexture()
    lockHighlight:SetTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    lockHighlight:SetBlendMode("ADD")
    lockButton:SetHighlightTexture(lockHighlight)

    -- Type dropdown
    local dropDownType = CreateFrame("Button", "AtlasFrameDropDownType", AtlasFrame, "UIDropDownMenuTemplate")
    dropDownType:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 60, -50)

    local dropDownTypeLabel = dropDownType:CreateFontString("AtlasFrameDropDownTypeLabel", "BACKGROUND", "GameFontNormalSmall")
    dropDownTypeLabel:SetText("ATLAS_STRING_SELECT_CAT")
    dropDownTypeLabel:SetPoint("BOTTOMLEFT", dropDownType, "TOPLEFT", 21, 0)

    -- Map dropdown
    local dropDown = CreateFrame("Button", "AtlasFrameDropDown", AtlasFrame, "UIDropDownMenuTemplate")
    dropDown:SetPoint("LEFT", dropDownType, "RIGHT", 0, 0)

    local dropDownLabel = dropDown:CreateFontString("AtlasFrameDropDownLabel", "BACKGROUND", "GameFontNormalSmall")
    dropDownLabel:SetText("ATLAS_STRING_SELECT_MAP")
    dropDownLabel:SetPoint("BOTTOMLEFT", dropDown, "TOPLEFT", 21, 0)

    -- Search box
    local searchBox = CreateFrame("EditBox", "AtlasSearchEditBox", AtlasFrame, "InputBoxTemplate")
    searchBox:SetWidth(132)
    searchBox:SetHeight(32)
    searchBox:SetPoint("BOTTOMRIGHT", AtlasFrame, "BOTTOMRIGHT", -160, 15)
    searchBox:SetMaxLetters(80)
    searchBox:SetScript("OnLoad", function()
        this:SetAutoFocus(false)
        this:SetTextInsets(0, 8, 0, 0)
    end)
    searchBox:SetScript("OnEnterPressed", function()
        Atlas_SearchAndRefresh(this:GetText())
        this:ClearFocus()
    end)

    local searchString = searchBox:CreateFontString("AtlasSearchString", "BACKGROUND", "GameFontNormal")

    -- Switch dropdown
    local switchDD = CreateFrame("Frame", "AtlasSwitchDD", AtlasFrame, "UIDropDownMenuTemplate")

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
    searchButton:SetText("ATLAS_STRING_SEARCH")
    searchButton:SetScript("OnClick", function()
        Atlas_SearchAndRefresh(AtlasSearchEditBox:GetText())
        AtlasSearchEditBox:ClearFocus()
    end)

    -- Clear button
    local clearButton = CreateFrame("Button", "AtlasSearchClearButton", searchBox, "UIPanelButtonTemplate2")
    clearButton:SetWidth(72)
    clearButton:SetHeight(32)
    clearButton:SetPoint("LEFT", searchButton, "RIGHT", 0, 0)
    clearButton:SetText("ATLAS_STRING_CLEAR")
    clearButton:SetScript("OnClick", function()
        AtlasSearchEditBox:SetText("")
        Atlas_SearchAndRefresh(AtlasSearchEditBox:GetText())
        AtlasSearchEditBox:ClearFocus()
    end)

    -- Options button
    local optionsButton = CreateFrame("Button", "AtlasFrameOptionsButton", AtlasFrame, "UIPanelButtonTemplate2")
    optionsButton:SetWidth(80)
    optionsButton:SetHeight(20)
    optionsButton:SetPoint("TOPRIGHT", AtlasFrame, "TOPRIGHT", -18, -60)
    optionsButton:SetText("ATLAS_OPTIONS_BUTTON")
    optionsButton:SetScript("OnClick", function()
        AtlasOptions_Toggle()
    end)

    -- Scroll frame
    local scrollBar = CreateFrame("ScrollFrame", "AtlasScrollBar", AtlasFrame, "FauxScrollFrameTemplate")
    scrollBar:SetWidth(351)
    scrollBar:SetHeight(367)
    scrollBar:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 530, -186)
    scrollBar:SetScript("OnVerticalScroll", function()
        FauxScrollFrame_OnVerticalScroll(15, AtlasScrollBar_Update)
    end)
    scrollBar:SetScript("OnShow", function()
        AtlasScrollBar_Update()
    end)

    -- Search container
    local searchContainer = CreateFrame("Frame", "AtlasSearchContainer", AtlasFrame)
    searchContainer:SetWidth(362)
    searchContainer:SetHeight(32)
    searchContainer:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 540, -555)

    local noSearch = searchContainer:CreateFontString("AtlasNoSearch", "ARTWORK", "GameFontDisableSmall")
    noSearch:SetText("ATLAS_SEARCH_UNAVAIL")
    noSearch:SetPoint("CENTER", searchContainer, "CENTER")
    noSearch:SetTextColor(1, 1, 1, 0.4)

    -- Zone name frame
    local zoneName = CreateFrame("Frame", "AtlasText_ZoneName", AtlasFrame)
    zoneName:SetWidth(351)
    zoneName:SetHeight(20)
    zoneName:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 546, -97)

    local zoneText = zoneName:CreateFontString("AtlasText_ZoneName_Text", "OVERLAY", "GameFontHighlightLarge")
    zoneText:SetWidth(351)
    zoneText:SetHeight(20)
    zoneText:SetJustifyH("LEFT")

    zoneName:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Location frame
    local location = CreateFrame("Frame", "AtlasText_Location", AtlasFrame)
    location:SetWidth(351)
    location:SetHeight(15)
    location:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -20)

    local locationText = location:CreateFontString("AtlasText_Location_Text", "OVERLAY", "GameFontNormal")
    locationText:SetWidth(351)
    locationText:SetHeight(15)
    locationText:SetJustifyH("LEFT")

    location:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Level range frame
    local levelRange = CreateFrame("Frame", "AtlasText_LevelRange", AtlasFrame)
    levelRange:SetWidth(351)
    levelRange:SetHeight(15)
    levelRange:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -35)

    local levelRangeText = levelRange:CreateFontString("AtlasText_LevelRange_Text", "OVERLAY", "GameFontNormal")
    levelRangeText:SetWidth(351)
    levelRangeText:SetHeight(15)
    levelRangeText:SetJustifyH("LEFT")

    levelRange:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Health frame
    local health = CreateFrame("Frame", "AtlasText_Health", AtlasFrame)
    health:SetWidth(351)
    health:SetHeight(15)
    health:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -50)

    local healthText = health:CreateFontString("AtlasText_Health_Text", "OVERLAY", "GameFontNormal")
    healthText:SetWidth(351)
    healthText:SetHeight(15)
    healthText:SetJustifyH("LEFT")

    health:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Mana frame
    local mana = CreateFrame("Frame", "AtlasText_Mana", AtlasFrame)
    mana:SetWidth(351)
    mana:SetHeight(15)
    mana:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -65)

    local manaText = mana:CreateFontString("AtlasText_Mana_Text", "OVERLAY", "GameFontNormal")
    manaText:SetWidth(351)
    manaText:SetHeight(15)
    manaText:SetJustifyH("LEFT")

    mana:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Min level frame
    local minLevel = CreateFrame("Frame", "AtlasText_MinLevel", AtlasFrame)
    minLevel:SetWidth(351)
    minLevel:SetHeight(15)
    minLevel:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -50)

    local minLevelText = minLevel:CreateFontString("AtlasText_MinLevel_Text", "OVERLAY", "GameFontNormal")
    minLevelText:SetWidth(351)
    minLevelText:SetHeight(15)
    minLevelText:SetJustifyH("LEFT")

    minLevel:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Player limit frame
    local playerLimit = CreateFrame("Frame", "AtlasText_PlayerLimit", AtlasFrame)
    playerLimit:SetWidth(351)
    playerLimit:SetHeight(15)
    playerLimit:SetPoint("TOPLEFT", zoneName, "TOPLEFT", 0, -65)

    local playerLimitText = playerLimit:CreateFontString("AtlasText_PlayerLimit_Text", "OVERLAY", "GameFontNormal")
    playerLimitText:SetWidth(351)
    playerLimitText:SetHeight(15)
    playerLimitText:SetJustifyH("LEFT")

    playerLimit:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Textures
    local topTexture = AtlasFrame:CreateTexture(nil, "ARTWORK")
    topTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Top")
    topTexture:SetWidth(512)
    topTexture:SetHeight(128)
    topTexture:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 0, 0)

    local leftTexture = AtlasFrame:CreateTexture(nil, "ARTWORK")
    leftTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Left")
    leftTexture:SetWidth(32)
    leftTexture:SetHeight(256)
    leftTexture:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 0, -128)

    local bottomTexture = AtlasFrame:CreateTexture(nil, "ARTWORK")
    bottomTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Bottom")
    bottomTexture:SetWidth(512)
    bottomTexture:SetHeight(256)
    bottomTexture:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 0, -384)

    local bottom2Texture = AtlasFrame:CreateTexture(nil, "ARTWORK")
    bottom2Texture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Bottom2")
    bottom2Texture:SetWidth(512)
    bottom2Texture:SetHeight(128)
    bottom2Texture:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 512, -512)

    local rightTexture = AtlasFrame:CreateTexture(nil, "ARTWORK")
    rightTexture:SetTexture("Interface\\AddOns\\Atlas-TW\\Images\\AtlasFrame-Right")
    rightTexture:SetWidth(512)
    rightTexture:SetHeight(512)
    rightTexture:SetPoint("TOPLEFT", AtlasFrame, "TOPLEFT", 512, 0)

    local titleText = AtlasFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    titleText:SetText("Atlas-TW")
    titleText:SetPoint("TOP", AtlasFrame, "TOP", 20, -17)

    local versionText = AtlasFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    versionText:SetText("ATLASTW_VERSION")
    versionText:SetTextColor(0.4, 0.4, 0.4)
    versionText:SetPoint("TOPRIGHT", AtlasFrame, "TOPRIGHT", -52, -18)

    -- Map texture
    local mapTexture = AtlasFrame:CreateTexture("AtlasMap", "BACKGROUND")

    -- Scripts
    AtlasFrame:SetScript("OnLoad", function()
        Atlas_OnLoad()
    end)

    AtlasFrame:SetScript("OnEvent", function()
        Atlas_OnEvent()
    end)

    AtlasFrame:SetScript("OnShow", function()
        Atlas_OnShow()
    end)

    AtlasFrame:SetScript("OnHide", function()
        AtlasFrame:StopMovingOrSizing()
    end)

    AtlasFrame:SetScript("OnDragStart", function()
        if(arg1 == "LeftButton") then
            Atlas_StartMoving()
        end
    end)

    AtlasFrame:SetScript("OnDragStop", function()
        AtlasFrame:StopMovingOrSizing()
    end)

    AtlasFrame:SetScript("OnMouseUp", function()
        AtlasFrame:StopMovingOrSizing()
        Atlas_OnClick()
    end)

    -- World map frame
    local worldMapFrame = CreateFrame("Frame", "Atlas_WorldMap_Frame", WorldMapFrame)
    worldMapFrame:Hide()

    local worldMapText = worldMapFrame:CreateFontString("Atlas_WorldMap_Frame_Text", "OVERLAY", "GameFontHighlightSmall")
    worldMapText:SetPoint("BOTTOM", WorldMapPositioningGuide, "BOTTOM", 0, 11)

    worldMapFrame:SetScript("OnHide", function()
        SetMapToCurrentZone()
    end)

    -- Register the template for future use
    AtlasEntryTemplate = CreateAtlasEntryTemplate

    return AtlasFrame
end

local function atlasButton_CreateFrames()
    -- Create the main button frame
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
        AtlasButton_UpdatePosition()
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
        if(this.dragme == true) then
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
--atlas_CreateFrames()
atlasButton_CreateFrames()