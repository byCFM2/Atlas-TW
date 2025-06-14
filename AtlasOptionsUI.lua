local _G = getfenv()
local variables = AtlasKTW
local L = AceLibrary("AceLocale-2.2"):new("Atlas")

-----------------------------------------------------------------------------
-- Option handlers
-----------------------------------------------------------------------------
-- Autoshow
local function KQAutoshowOption_OnClick()
	variables.QWithAtlas = not variables.QWithAtlas
	KQAutoshowOption:SetChecked(variables.QWithAtlas)
	ChatFrame1:AddMessage(variables.QWithAtlas and AQAtlasAutoON or AQAtlasAutoOFF)
	KQuest_SaveData()
end

-- Right position
local function KQRIGHTOption_OnClick()
	KQuestFrame:ClearAllPoints()
	KQuestFrame:SetPoint("TOP", "AtlasFrame", 567, -36)
	KQRIGHTOption:SetChecked(true)
	KQLEFTOption:SetChecked(false)
	variables.QCurrentSide = "Right"
	KQuest_SaveData()
end

-- Left position
local function KQLEFTOption_OnClick()
	if variables.QCurrentSide == "Right" then
		KQuestFrame:ClearAllPoints()
		KQuestFrame:SetPoint("TOP", "AtlasFrame", -556, -36)
	end
	KQRIGHTOption:SetChecked(false)
	KQLEFTOption:SetChecked(true)
	if variables.QCurrentSide ~= "Left" then
		ChatFrame1:AddMessage(AQShowLeft)
	end
	variables.QCurrentSide = "Left"
	KQuest_SaveData()
end

-- Color check
local function KQColourOption_OnClick()
	variables.QColourCheck = not variables.QColourCheck
	KQColourOption:SetChecked(variables.QColourCheck)
	ChatFrame1:AddMessage(variables.QColourCheck and AQCCON or AQCCOFF)
	KQuest_SaveData()
	variables.QUpdateNow = true
end

-- Questlog check
local function KQCheckQuestlogButton_OnClick()
	variables.QCheckQuestlog = not variables.QCheckQuestlog
	KQCheckQuestlogButton:SetChecked(variables.QCheckQuestlog)
	KQuest_SaveData()
	variables.QUpdateNow = true
end

-- Auto query
local function KQAutoQueryOption_OnClick()
	variables.QAutoQuery = not variables.QAutoQuery
	KQAutoQueryOption:SetChecked(variables.QAutoQuery)
	KQuest_SaveData()
end

-- Query spam suppression
local function KQQuerySpamOption_OnClick()
	variables.QQuerySpam = not variables.QQuerySpam
	KQQuerySpamOption:SetChecked(variables.QQuerySpam)
	KQuest_SaveData()
end

-- Tooltip comparison
local function KQCompareTooltipOption_OnClick()
	variables.QCompareTooltip = not variables.QCompareTooltip
	KQCompareTooltipOption:SetChecked(variables.QCompareTooltip)
	if variables.QCompareTooltip then
		if KQuestRegisterTooltip then
			KQuestRegisterTooltip()
		end
	else
		if KQuestUnRegisterTooltip then
			KQuestUnRegisterTooltip()
		end
	end
	KQuest_SaveData()
end

local function AtlasLootOptions_SafeLinksToggle()
	AtlasLootCharDB.SafeLinks = not AtlasLootCharDB.SafeLinks
	if AtlasLootCharDB.SafeLinks then
		AtlasLootCharDB.AllLinks = false
    else
		AtlasLootCharDB.AllLinks = true
	end
	AtlasOptions_Init()
end

local function AtlasLootOptions_AllLinksToggle()
	AtlasLootCharDB.AllLinks = not AtlasLootCharDB.AllLinks
	if AtlasLootCharDB.AllLinks then
		AtlasLootCharDB.SafeLinks = false
    else
		AtlasLootCharDB.SafeLinks = true
	end
	AtlasOptions_Init()
end

function AtlasLootOptions_DefaultTTToggle()
	AtlasLootCharDB.DefaultTT = true
	AtlasLootCharDB.LootlinkTT = false
	AtlasLootCharDB.ItemSyncTT = false
	AtlasOptions_Init()
end

function AtlasLootOptions_LootlinkTTToggle()
	AtlasLootCharDB.DefaultTT = false
	AtlasLootCharDB.LootlinkTT = true
	AtlasLootCharDB.ItemSyncTT = false
	AtlasOptions_Init()
end

function AtlasLootOptions_ItemSyncTTToggle()
	AtlasLootCharDB.DefaultTT = false
	AtlasLootCharDB.LootlinkTT = false
	AtlasLootCharDB.ItemSyncTT = true
	AtlasOptions_Init()
end

local function AtlasLootOptions_ShowSourceToggle()
	AtlasLootCharDB.ShowSource = not AtlasLootCharDB.ShowSource
	AtlasOptions_Init()
end

local function AtlasLootOptions_EquipCompareToggle()
	AtlasLootCharDB.EquipCompare = not AtlasLootCharDB.EquipCompare
	if AtlasLootCharDB.EquipCompare then
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
	AtlasOptions_Init()
end

local function AtlasLootOptions_OpaqueToggle()
	AtlasLootCharDB.Opaque=AtlasLootOptionsFrameOpaque:GetChecked()
	if AtlasLootCharDB.Opaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
	AtlasOptions_Init()
end

local function AtlasLootOptions_ItemIDToggle()
	AtlasLootCharDB.ItemIDs = not AtlasLootCharDB.ItemIDs
	AtlasOptions_Init()
end

local function AtlasLootOptions_ItemSpam()
	AtlasLootCharDB.ItemSpam = not AtlasLootCharDB.ItemSpam
	AtlasOptions_Init()
end

local function atlasOptions_CreateFrames()
    -- Create the main options frame
    local optionsFrame = CreateFrame("Frame", "AtlasOptionsFrame", UIParent)
    optionsFrame:SetFrameStrata("HIGH")
    optionsFrame:SetToplevel(true)
    optionsFrame:SetWidth(550)
    optionsFrame:SetHeight(550)
    optionsFrame:SetPoint("CENTER", UIParent, "CENTER")
    optionsFrame:SetMovable(true)
    optionsFrame:RegisterForDrag("LeftButton")
    optionsFrame:EnableMouse(true)
    optionsFrame:SetClampedToScreen(true)
    optionsFrame:Hide()

	tinsert(UISpecialFrames, "AtlasOptionsFrame")

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
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    optionsFrame:SetBackdropColor(0, 0, 0, 1)
    optionsFrame:SetBackdropBorderColor(0, 0, 0, 1)

    -- Close button

    -- Set up frame show script to initialize values
    optionsFrame:SetScript("OnShow", function()
        AtlasOptions_Init()
    end)

    -- Title
    local title = optionsFrame:CreateFontString("", "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", optionsFrame, "TOP", 0, -15)
    title:SetText(L["Options"])

    -- AtlasOptionsText
    local atlasOptionText = optionsFrame:CreateFontString("", "ARTWORK", "GameFontNormal")
    atlasOptionText:SetPoint("BOTTOM", title, "BOTTOM", -160, -25)
    atlasOptionText:SetText(L["Atlas"])

    -- Toggle button
    local toggleButton = CreateFrame("CheckButton", "AtlasOptionsFrameToggleButton", optionsFrame, "OptionsCheckButtonTemplate")
    toggleButton:SetPoint("BOTTOM", atlasOptionText, "BOTTOM", -80, -35)
    _G[toggleButton:GetName().."Text"]:SetText(L["Show Button on Minimap"])
    toggleButton:SetScript("OnClick", function()
        AtlasButton_Toggle()
    end)

    -- Auto select button
    local autoSelect = CreateFrame("CheckButton", "AtlasOptionsFrameAutoSelect", optionsFrame, "OptionsCheckButtonTemplate")
    autoSelect:SetPoint("BOTTOM", toggleButton, "BOTTOM", 0, -25)
    _G[autoSelect:GetName().."Text"]:SetText(L["Auto-Select Instance Map"])
    autoSelect:SetScript("OnClick", function()
        AtlasOptions_AutoSelectToggle()
    end)

    -- Right click button
    local rightClick = CreateFrame("CheckButton", "AtlasOptionsFrameRightClick", optionsFrame, "OptionsCheckButtonTemplate")
    rightClick:SetPoint("BOTTOM", autoSelect, "BOTTOM", 0, -25)
    _G[rightClick:GetName().."Text"]:SetText(L["Right-Click for World Map"])
    rightClick:SetScript("OnClick", function()
        AtlasOptions_RightClickToggle()
    end)

    -- Acronyms button
    local acronyms = CreateFrame("CheckButton", "AtlasOptionsFrameAcronyms", optionsFrame, "OptionsCheckButtonTemplate")
    acronyms:SetPoint("BOTTOM", rightClick, "BOTTOM", 0, -25)
    _G[acronyms:GetName().."Text"]:SetText(L["Show Acronyms"])
    acronyms:SetScript("OnClick", function()
        AtlasOptions_AcronymsToggle()
    end)

    -- Clamped button
    local clamped = CreateFrame("CheckButton", "AtlasOptionsFrameClamped", optionsFrame, "OptionsCheckButtonTemplate")
    clamped:SetPoint("BOTTOM", acronyms, "BOTTOM", 0, -25)
    _G[clamped:GetName().."Text"]:SetText(L["Clamp window to screen"])
    clamped:SetScript("OnClick", function()
        AtlasOptions_ClampedToggle()
    end)

    -- Button position slider
    local sliderButtonPos = CreateFrame("Slider", "AtlasOptionsFrameSliderButtonPos", optionsFrame, "OptionsSliderTemplate")
    sliderButtonPos:SetWidth(180)
    sliderButtonPos:SetPoint("BOTTOM", clamped, "BOTTOM", 78, -27)
    sliderButtonPos:SetMinMaxValues(0, 360)
    sliderButtonPos:SetValueStep(1)
    sliderButtonPos:SetValue(336)
    _G[sliderButtonPos:GetName().."Text"]:SetText(L["Button Position"].." ("..sliderButtonPos:GetValue()..")")
    _G[sliderButtonPos:GetName().."Low"]:SetText("0")
    _G[sliderButtonPos:GetName().."High"]:SetText("360")
    sliderButtonPos:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(L["Button Position"])
        AtlasTWOptions.AtlasButtonPosition = this:GetValue()
        AtlasButton_UpdatePosition()
    end)

    -- Button radius slider
    local sliderButtonRad = CreateFrame("Slider", "AtlasOptionsFrameSliderButtonRad", optionsFrame, "OptionsSliderTemplate")
    sliderButtonRad:SetWidth(180)
    sliderButtonRad:SetPoint("BOTTOM", sliderButtonPos, "BOTTOM", 0, -27)
    sliderButtonRad:SetMinMaxValues(0, 200)
    sliderButtonRad:SetValueStep(1)
    sliderButtonRad:SetValue(78)
    _G[sliderButtonRad:GetName().."Text"]:SetText(L["Button Radius"].." ("..sliderButtonRad:GetValue()..")")
    _G[sliderButtonRad:GetName().."Low"]:SetText("0")
    _G[sliderButtonRad:GetName().."High"]:SetText("200")
    sliderButtonRad:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(L["Button Radius"])
        AtlasTWOptions.AtlasButtonRadius = this:GetValue()
        AtlasButton_UpdatePosition()
    end)
    -- Alpha slider
    local sliderAlpha = CreateFrame("Slider", "AtlasOptionsFrameSliderAlpha", optionsFrame, "OptionsSliderTemplate")
    sliderAlpha:SetWidth(180)
    sliderAlpha:SetPoint("BOTTOM", sliderButtonRad, "BOTTOM", 0, -27)
    sliderAlpha:SetMinMaxValues(0.25, 1.0)
    sliderAlpha:SetValueStep(0.01)
    sliderAlpha:SetValue(1.0)
    _G[sliderAlpha:GetName().."Text"]:SetText(L["Transparency"].." ("..sliderAlpha:GetValue()..")")
    _G[sliderAlpha:GetName().."Low"]:SetText("0.25")
    _G[sliderAlpha:GetName().."High"]:SetText("1.0")
    sliderAlpha:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(L["Transparency"])
        AtlasTWOptions.AtlasAlpha = this:GetValue()
        Atlas_UpdateAlpha()
    end)

    -- Scale slider
    local sliderScale = CreateFrame("Slider", "AtlasOptionsFrameSliderScale", optionsFrame, "OptionsSliderTemplate")
    sliderScale:SetWidth(180)
    sliderScale:SetPoint("BOTTOM", sliderAlpha, "BOTTOM", 0, -27)
    sliderScale:SetMinMaxValues(0.25, 1.5)
    sliderScale:SetValueStep(0.01)
    sliderScale:SetValue(1.0)
    _G[sliderScale:GetName().."Text"]:SetText(L["Scale"].." ("..sliderScale:GetValue()..")")
    _G[sliderScale:GetName().."Low"]:SetText("0.25")
    _G[sliderScale:GetName().."High"]:SetText("1.5")
    sliderScale:SetScript("OnValueChanged", function()
        AtlasOptions_UpdateSlider(L["Scale"])
        AtlasTWOptions.AtlasScale = this:GetValue()
        Atlas_UpdateScale()
    end)


    -- Reset position button
    local resetPosition = CreateFrame("Button", "AtlasOptionsFrameResetPosition", optionsFrame, "UIPanelButtonTemplate2")
    resetPosition:SetWidth(160)
    resetPosition:SetHeight(32)
    resetPosition:SetPoint("BOTTOMLEFT", optionsFrame, "BOTTOMLEFT", 22, 18)
    resetPosition:SetText(L["Reset Position"])
    resetPosition:SetScript("OnClick", function()
        AtlasOptions_ResetPosition()
    end)

    -- Done button
    local doneButton = CreateFrame("Button", "AtlasOptionsFrameDone", optionsFrame, "UIPanelButtonTemplate2")
    doneButton:SetWidth(80)
    doneButton:SetHeight(32)
    doneButton:SetPoint("BOTTOMRIGHT", optionsFrame, "BOTTOMRIGHT", -22, 18)
    doneButton:SetText(L["Done"])
    doneButton:SetScript("OnClick", function()
        AtlasOptions_Toggle()
    end)

    -- Categories dropdown
    local dropDownCats = CreateFrame("Button", "AtlasOptionsFrameDropDownCats", optionsFrame, "UIDropDownMenuTemplate")
    dropDownCats:SetPoint("TOP", doneButton, "TOP", 0, 30)
    UIDropDownMenu_SetWidth(80, dropDownCats)

    local dropDownCatsLabel = dropDownCats:CreateFontString("", "BACKGROUND", "GameFontNormalSmall")
    dropDownCatsLabel:SetText(L["Sort Instance by:"])
    dropDownCatsLabel:SetPoint("TOP", 0, 10)

    dropDownCats:SetScript("OnShow", function()
        AtlasOptionsFrameDropDownCats_OnShow()
    end)

    -- QuestOptionsText
    local questOptionText = optionsFrame:CreateFontString("", "ARTWORK", "GameFontNormal")
    questOptionText:SetPoint("BOTTOM", title, "BOTTOM", 100, -25)
    questOptionText:SetText(L["Quest"])

    -- Checkboxes
    local checkboxesQuest = {
        "KQAutoshowOption",
        "KQLEFTOption",
        "KQRIGHTOption",
        "KQColourOption",
        "KQCheckQuestlogButton",
        "KQAutoQueryOption",
        "KQQuerySpamOption",
        "KQCompareTooltipOption"
    }

    -- List of OnClick functions
    local scriptQuest = {
        KQAutoshowOption_OnClick,
        KQLEFTOption_OnClick,
        KQRIGHTOption_OnClick,
        KQColourOption_OnClick,
        KQCheckQuestlogButton_OnClick,
        KQAutoQueryOption_OnClick,
        KQQuerySpamOption_OnClick,
        KQCompareTooltipOption_OnClick
    }

    -- Function to create checkbox
	local function CreateCheckboxesQuest()
        for i = 1, table.getn(checkboxesQuest) do
            local name = checkboxesQuest[i]
            local checkbox = CreateFrame("CheckButton", name, optionsFrame, "OptionsCheckButtonTemplate")
            if i ~= 1 then
                checkbox:SetPoint("BOTTOM", checkboxesQuest[i-1], "BOTTOM", 0, -25)
            else
                checkbox:SetPoint("BOTTOM", questOptionText, "BOTTOM", -145, -35)
            end
            _G[name.."Text"]:SetText(_G[name.."Local"])
            checkbox:SetScript("OnClick", scriptQuest[i])
        end
	end

    -- Loot Options Text
    local lootOptionText = optionsFrame:CreateFontString("", "ARTWORK", "GameFontNormal")
    lootOptionText:SetPoint("BOTTOM", sliderScale, "BOTTOM", 0, -25)
    lootOptionText:SetText(L["Loot"])

    -- Checkboxes
    local checkboxLoot = {
        "AtlasLootOptionsFrameSafeLinks",
        "AtlasLootOptionsFrameAllLinks",
        "AtlasLootOptionsFrameDefaultTT",
        "AtlasLootOptionsFrameLootlinkTT",
        "AtlasLootOptionsFrameItemSyncTT",
        "AtlasLootOptionsFrameShowSource",
        "AtlasLootOptionsFrameEquipCompare",
        "AtlasLootOptionsFrameItemID",
        "AtlasLootOptionsFrameOpaque",
        "AtlasLootOptionsFrameItemSpam"
    }

    -- List of scripts
    local scriptLoot = {
        AtlasLootOptions_SafeLinksToggle,
        AtlasLootOptions_AllLinksToggle,
        AtlasLootOptions_DefaultTTToggle,
        AtlasLootOptions_LootlinkTTToggle,
        AtlasLootOptions_ItemSyncTTToggle,
        AtlasLootOptions_ShowSourceToggle,
        AtlasLootOptions_EquipCompareToggle,
        AtlasLootOptions_ItemIDToggle,
        AtlasLootOptions_OpaqueToggle,
        AtlasLootOptions_ItemSpam,
    }

    -- List of text for checkboxes
    local textCheckboxLoot = {
    	L["Safe Chat Links |cff1eff00(recommended)|r"],
    	L["Enable all Chat Links"],
    	L["Default Tooltips"],
    	L["Lootlink Tooltips"],
    	L["ItemSync Tooltips"],
    	L["Show Source on Tooltips"],
    	L["Use EquipCompare"],
        L["Show IDs at all times"],
        L["Make Loot Table Opaque"],
        L["Suppress text spam when querying items"]
    }
        -- Function to create checkbox
	local function CreateCheckboxesLoot()
        for i = 1, table.getn(checkboxLoot) do
            local name = checkboxLoot[i]
            local checkbox = CreateFrame("CheckButton", name, optionsFrame, "OptionsCheckButtonTemplate")
            if i > 1 and i <= 6 then
                checkbox:SetPoint("BOTTOM", checkboxLoot[i-1], "BOTTOM", 0, -25)
            elseif i > 6 then
                checkbox:SetPoint("RIGHT", checkboxLoot[i-6], "RIGHT", 195, 0)
            else
                checkbox:SetPoint("BOTTOM", lootOptionText, "BOTTOM", -78, -35)
            end
            _G[name.."Text"]:SetText(textCheckboxLoot[i])
            checkbox:SetScript("OnClick", scriptLoot[i])
        end
	end

	-- Create checkboxes
	CreateCheckboxesQuest()
    CreateCheckboxesLoot()

    return optionsFrame
end

-- Call the function to create frames when this file is loaded
atlasOptions_CreateFrames()