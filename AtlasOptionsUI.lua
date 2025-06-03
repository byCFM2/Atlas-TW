local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("Atlas")

local function atlasOptions_CreateFrames()
    -- Create the main options frame
    local optionsFrame = CreateFrame("Frame", "AtlasOptionsFrame", UIParent)
    optionsFrame:SetFrameStrata("HIGH")
    optionsFrame:SetToplevel(true)
    optionsFrame:SetWidth(300)
    optionsFrame:SetHeight(570)
    optionsFrame:SetPoint("CENTER", UIParent, "CENTER")
    optionsFrame:SetMovable(true)
    optionsFrame:RegisterForDrag("LeftButton")
    optionsFrame:EnableMouse(true)
    optionsFrame:SetClampedToScreen(true)
    optionsFrame:Hide()

    -- Frame scripts
    optionsFrame:SetScript("OnDragStart", function()
        this:StartMoving()
        this.isMoving = true
    end)

    optionsFrame:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
        this.isMoving = false
    end)

    -- Background
    optionsFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "",
        tile = false
    })

    -- Title
    local title = optionsFrame:CreateFontString("AtlasOptionsFrame_Title", "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", optionsFrame, "TOP", 0, -15)
    title:SetText(L["Atlas Options"])

    -- Toggle button
    local toggleButton = CreateFrame("CheckButton", "AtlasOptionsFrameToggleButton", optionsFrame, "OptionsCheckButtonTemplate")
    toggleButton:SetPoint("TOPLEFT", optionsFrame, "TOPLEFT", 20, -60)
    _G[toggleButton:GetName().."Text"]:SetText(ATLAS_OPTIONS_SHOWBUT)
    toggleButton:SetScript("OnClick", function()
        AtlasButton_Toggle()
    end)

    -- Auto select button
    local autoSelect = CreateFrame("CheckButton", "AtlasOptionsFrameAutoSelect", optionsFrame, "OptionsCheckButtonTemplate")
    autoSelect:SetPoint("TOPLEFT", optionsFrame, "TOPLEFT", 20, -90)
    _G[autoSelect:GetName().."Text"]:SetText(ATLAS_OPTIONS_AUTOSEL)
    autoSelect:SetScript("OnClick", function()
        AtlasOptions_AutoSelectToggle()
    end)

    -- Right click button
    local rightClick = CreateFrame("CheckButton", "AtlasOptionsFrameRightClick", optionsFrame, "OptionsCheckButtonTemplate")
    rightClick:SetPoint("TOPLEFT", optionsFrame, "TOPLEFT", 20, -120)
    _G[rightClick:GetName().."Text"]:SetText(ATLAS_OPTIONS_RCLICK)
    rightClick:SetScript("OnClick", function()
        AtlasOptions_RightClickToggle()
    end)

    -- Acronyms button
    local acronyms = CreateFrame("CheckButton", "AtlasOptionsFrameAcronyms", optionsFrame, "OptionsCheckButtonTemplate")
    acronyms:SetPoint("TOPLEFT", optionsFrame, "TOPLEFT", 20, -150)
    _G[acronyms:GetName().."Text"]:SetText(ATLAS_OPTIONS_ACRONYMS)
    acronyms:SetScript("OnClick", function()
        AtlasOptions_AcronymsToggle()
    end)

    -- Clamped button
    local clamped = CreateFrame("CheckButton", "AtlasOptionsFrameClamped", optionsFrame, "OptionsCheckButtonTemplate")
    clamped:SetPoint("TOPLEFT", optionsFrame, "TOPLEFT", 20, -180)
    _G[clamped:GetName().."Text"]:SetText(ATLAS_OPTIONS_CLAMPED)
    clamped:SetScript("OnClick", function()
        AtlasOptions_ClampedToggle()
    end)

    -- Button position slider
    local sliderButtonPos = CreateFrame("Slider", "AtlasOptionsFrameSliderButtonPos", optionsFrame, "OptionsSliderTemplate")
    sliderButtonPos:SetWidth(240)
    sliderButtonPos:SetHeight(16)
    sliderButtonPos:SetPoint("TOP", optionsFrame, "TOP", 0, -300)
    -- Manually initialize slider instead of OnLoad
    sliderButtonPos:SetMinMaxValues(0, 360)
    sliderButtonPos:SetValueStep(1)
    sliderButtonPos:SetValue(336)
    _G[sliderButtonPos:GetName().."Text"]:SetText(ATLAS_OPTIONS_BUTPOS.." ("..sliderButtonPos:GetValue()..")")
    _G[sliderButtonPos:GetName().."Low"]:SetText("0")
    _G[sliderButtonPos:GetName().."High"]:SetText("360")
    sliderButtonPos:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(ATLAS_OPTIONS_BUTPOS)
        AtlasTWOptions.AtlasButtonPosition = this:GetValue()
        AtlasButton_UpdatePosition()
    end)

    -- Button radius slider
    local sliderButtonRad = CreateFrame("Slider", "AtlasOptionsFrameSliderButtonRad", optionsFrame, "OptionsSliderTemplate")
    sliderButtonRad:SetWidth(240)
    sliderButtonRad:SetHeight(16)
    sliderButtonRad:SetPoint("TOP", optionsFrame, "TOP", 0, -340)
    -- Manually initialize slider
    sliderButtonRad:SetMinMaxValues(0, 200)
    sliderButtonRad:SetValueStep(1)
    sliderButtonRad:SetValue(78)
    _G[sliderButtonRad:GetName().."Text"]:SetText(ATLAS_OPTIONS_BUTRAD.." ("..sliderButtonRad:GetValue()..")")
    _G[sliderButtonRad:GetName().."Low"]:SetText("0")
    _G[sliderButtonRad:GetName().."High"]:SetText("200")
    sliderButtonRad:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(ATLAS_OPTIONS_BUTRAD)
        AtlasTWOptions.AtlasButtonRadius = this:GetValue()
        AtlasButton_UpdatePosition()
    end)

    -- Alpha slider
    local sliderAlpha = CreateFrame("Slider", "AtlasOptionsFrameSliderAlpha", optionsFrame, "OptionsSliderTemplate")
    sliderAlpha:SetWidth(240)
    sliderAlpha:SetHeight(16)
    sliderAlpha:SetPoint("TOP", optionsFrame, "TOP", 0, -380)
    -- Manually initialize slider
    sliderAlpha:SetMinMaxValues(0.25, 1.0)
    sliderAlpha:SetValueStep(0.01)
    sliderAlpha:SetValue(1.0)
    _G[sliderAlpha:GetName().."Text"]:SetText(ATLAS_OPTIONS_TRANS.." ("..sliderAlpha:GetValue()..")")
    _G[sliderAlpha:GetName().."Low"]:SetText("0.25")
    _G[sliderAlpha:GetName().."High"]:SetText("1.0")
    sliderAlpha:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(ATLAS_OPTIONS_TRANS)
        AtlasTWOptions.AtlasAlpha = this:GetValue()
        Atlas_UpdateAlpha()
    end)

    -- Scale slider
    local sliderScale = CreateFrame("Slider", "AtlasOptionsFrameSliderScale", optionsFrame, "OptionsSliderTemplate")
    sliderScale:SetWidth(240)
    sliderScale:SetHeight(16)
    sliderScale:SetPoint("TOP", optionsFrame, "TOP", 0, -420)
    -- Manually initialize slider
    sliderScale:SetMinMaxValues(0.25, 1.5)
    sliderScale:SetValueStep(0.01)
    sliderScale:SetValue(1.0)
    _G[sliderScale:GetName().."Text"]:SetText(ATLAS_OPTIONS_SCALE.." ("..sliderScale:GetValue()..")")
    _G[sliderScale:GetName().."Low"]:SetText("0.25")
    _G[sliderScale:GetName().."High"]:SetText("1.5")
    sliderScale:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(ATLAS_OPTIONS_SCALE)
        AtlasTWOptions.AtlasScale = this:GetValue()
        Atlas_UpdateScale()
    end)

    -- Categories dropdown
    local dropDownCats = CreateFrame("Button", "AtlasOptionsFrameDropDownCats", optionsFrame, "UIDropDownMenuTemplate")
    dropDownCats:SetPoint("TOPLEFT", optionsFrame, "TOPLEFT", 5, -475)

    local dropDownCatsLabel = dropDownCats:CreateFontString("AtlasOptionsFrameDropDownCatsLabel", "BACKGROUND", "GameFontNormalSmall")
    dropDownCatsLabel:SetText(ATLAS_OPTIONS_CATDD)
    dropDownCatsLabel:SetPoint("BOTTOMLEFT", dropDownCats, "TOPLEFT", 21, 0)

    dropDownCats:SetScript("OnShow", function()
        AtlasOptionsFrameDropDownCats_OnShow()
    end)

    -- Reset position button
    local resetPosition = CreateFrame("Button", "AtlasOptionsFrameResetPosition", optionsFrame, "UIPanelButtonTemplate2")
    resetPosition:SetWidth(160)
    resetPosition:SetHeight(32)
    resetPosition:SetPoint("BOTTOMLEFT", optionsFrame, "BOTTOMLEFT", 22, 18)
    resetPosition:SetText(ATLAS_OPTIONS_RESETPOS)
    resetPosition:SetScript("OnClick", function()
        AtlasOptions_ResetPosition()
    end)

    -- Done button
    local doneButton = CreateFrame("Button", "AtlasOptionsFrameDone", optionsFrame, "UIPanelButtonTemplate2")
    doneButton:SetWidth(80)
    doneButton:SetHeight(32)
    doneButton:SetPoint("BOTTOMRIGHT", optionsFrame, "BOTTOMRIGHT", -22, 18)
    doneButton:SetText(ATLAS_OPTIONS_DONE)
    doneButton:SetScript("OnClick", function()
        AtlasOptions_Toggle()
    end)

    -- Set up frame show script to initialize values
    optionsFrame:SetScript("OnShow", function()
        AtlasOptions_Init()
    end)

    return optionsFrame
end

-- Call the function to create frames when this file is loaded
atlasOptions_CreateFrames()