local _G = getfenv()
local AtlasTW = AtlasTW or {}
local L = AceLibrary("AceLocale-2.2"):new("Atlas")

-----------------------------------------------------------------------------
-- Option handlers
-----------------------------------------------------------------------------
-- Autoshow
local function KQAutoshowOption_OnClick()
	AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
	KQAutoshowOption:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTW.OptionsInit()
end

-- Right position
local function KQRIGHTOption_OnClick()
    AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
    AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", 567, -36)
	KQRIGHTOption:SetChecked(true)
	KQLEFTOption:SetChecked(false)
	AtlasTWOptions.QuestCurrentSide = "Right"
	AtlasTW.OptionsInit()
end

-- Left position
local function KQLEFTOption_OnClick()
    if AtlasTWOptions.QuestCurrentSide == "Right" then
        AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", -556, -36)
    end
	KQRIGHTOption:SetChecked(false)
	KQLEFTOption:SetChecked(true)
	AtlasTWOptions.QuestCurrentSide = "Left"
	AtlasTW.OptionsInit()
end

-- Color check
local function KQColourOption_OnClick()
	AtlasTWOptions.QuestColourCheck = not AtlasTWOptions.QuestColourCheck
	KQColourOption:SetChecked(AtlasTWOptions.QuestColourCheck)
	AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

-- Questlog check
local function KQCheckQuestlogButton_OnClick()
	AtlasTWOptions.QuestCheckQuestlog = not AtlasTWOptions.QuestCheckQuestlog
	KQCheckQuestlogButton:SetChecked(AtlasTWOptions.QuestCheckQuestlog)
	AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

-- Auto query
local function KQAutoQueryOption_OnClick()
	AtlasTWOptions.QuestAutoQuery = not AtlasTWOptions.QuestAutoQuery
	KQAutoQueryOption:SetChecked(AtlasTWOptions.QuestAutoQuery)
	AtlasTW.OptionsInit()
end

-- Query spam suppression
local function KQQuerySpamOption_OnClick()
	AtlasTWOptions.QuestQuerySpam = not AtlasTWOptions.QuestQuerySpam
	KQQuerySpamOption:SetChecked(AtlasTWOptions.QuestQuerySpam)
	AtlasTW.OptionsInit()
end

-- Tooltip comparison
local function KQCompareTooltipOption_OnClick()
	AtlasTWOptions.QuestCompareTooltip = not AtlasTWOptions.QuestCompareTooltip
	KQCompareTooltipOption:SetChecked(AtlasTWOptions.QuestCompareTooltip)
	if AtlasTWOptions.QuestCompareTooltip then
		AtlasTW.Quest.Tooltip:Register()
	else
		AtlasTW.Quest.Tooltip:Unregister()
	end
	AtlasTW.OptionsInit()
end

local function AtlasLootOptions_SafeLinksToggle()
	AtlasTWOptions.LootSafeLinks = not AtlasTWOptions.LootSafeLinks
	if AtlasTWOptions.LootSafeLinks then
		AtlasTWOptions.LootAllLinks = false
    else
		AtlasTWOptions.LootAllLinks = true
	end
	AtlasTW.OptionsInit()
end

local function AtlasLootOptions_AllLinksToggle()
	AtlasTWOptions.LootAllLinks = not AtlasTWOptions.LootAllLinks
	if AtlasTWOptions.LootAllLinks then
		AtlasTWOptions.LootSafeLinks = false
    else
		AtlasTWOptions.LootSafeLinks = true
	end
	AtlasTW.OptionsInit()
end

function AtlasLootOptions_DefaultTTToggle()
	AtlasTWOptions.LootDefaultTT = true
	AtlasTWOptions.LootlinkTT = false
	AtlasTWOptions.LootItemSyncTT = false
	AtlasTW.OptionsInit()
end

function AtlasLootOptions_LootlinkTTToggle()
	AtlasTWOptions.LootDefaultTT = false
	AtlasTWOptions.LootlinkTT = true
	AtlasTWOptions.LootItemSyncTT = false
	AtlasTW.OptionsInit()
end

function AtlasLootOptions_ItemSyncTTToggle()
	AtlasTWOptions.LootDefaultTT = false
	AtlasTWOptions.LootlinkTT = false
	AtlasTWOptions.LootItemSyncTT = true
	AtlasTW.OptionsInit()
end

local function AtlasLootOptions_ShowSourceToggle()
	AtlasTWOptions.LootShowSource = not AtlasTWOptions.LootShowSource
	AtlasTW.OptionsInit()
end

local function AtlasLootOptions_ShowPanel_OnClick()
	AtlasTWOptions.LootShowPanel = not AtlasTWOptions.LootShowPanel
	AtlasTW.OptionsInit()
end

local function AtlasLootOptions_EquipCompareToggle()
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

local function AtlasLootOptions_OpaqueToggle()
	AtlasTWOptions.LootOpaque=AtlasLootOptionsFrameOpaque:GetChecked()
	if AtlasTWOptions.LootOpaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
	AtlasTW.OptionsInit()
end

local function AtlasLootOptions_ItemIDToggle()
	AtlasTWOptions.LootItemIDs = not AtlasTWOptions.LootItemIDs
	AtlasTW.OptionsInit()
end

local function AtlasLootOptions_ItemSpam()
	AtlasTWOptions.LootItemSpam = not AtlasTWOptions.LootItemSpam
	AtlasTW.OptionsInit()
end

local function atlasOptions_CreateFrames()
    -- Create the main options frame
    local optionsFrame = CreateFrame("Frame", "AtlasOptionsFrame", UIParent)
    optionsFrame:SetFrameStrata("MEDIUM")
    optionsFrame:SetWidth(550)
    optionsFrame:SetHeight(550)
    optionsFrame:SetPoint("CENTER", 0, 0)
    optionsFrame:SetMovable(true)
    optionsFrame:RegisterForDrag("LeftButton")
    optionsFrame:EnableMouse(true)
    optionsFrame:SetClampedToScreen(true)
    optionsFrame:Hide()
	tinsert(UISpecialFrames, "AtlasOptionsFrame")
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

    -- Frame scripts
    optionsFrame:SetScript("OnDragStart", function()
        this:StartMoving()
        this.isMoving = true
    end)
    optionsFrame:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
        this.isMoving = false
    end)
    -- Set up frame show script to initialize values
    optionsFrame:SetScript("OnShow", function()
        AtlasTW.OptionsInit()
    end)

    -- Title
    local title = optionsFrame:CreateFontString("", "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", optionsFrame, "TOP", 0, -15)
    title:SetText(L["Options"])

    -- AtlasOptionsText
    local atlasOptionText = optionsFrame:CreateFontString("", "ARTWORK", "GameFontNormal")
    atlasOptionText:SetPoint("BOTTOM", title, "BOTTOM", -160, -25)
    atlasOptionText:SetText(L["Atlas"])

    -- Atlas Options Checkboxes Data
    local atlasCheckboxes = {
        { name = "AtlasOptionsFrameToggleButton", text = L["Show Button on Minimap"], script = function() AtlasButton_Toggle() end },
        { name = "AtlasOptionsFrameAutoSelect", text = L["Auto-Select Instance Map"], script = function() AtlasOptions_AutoSelectToggle() end },
        { name = "AtlasOptionsFrameRightClick", text = L["Right-Click for World Map"], script = function() AtlasOptions_RightClickToggle() end },
        { name = "AtlasOptionsFrameAcronyms", text = L["Show Acronyms"], script = function() AtlasOptions_AcronymsToggle() end },
        { name = "AtlasOptionsFrameClamped", text = L["Clamp window to screen"], script = function() AtlasOptions_ClampedToggle() end }
    }

    -- Optimized function to create atlas checkboxes
    local function CreateAtlasCheckboxes()
        local previousElement = atlasOptionText
        for i, config in ipairs(atlasCheckboxes) do
            local checkbox = CreateFrame("CheckButton", config.name, optionsFrame, "OptionsCheckButtonTemplate")
            if i == 1 then
                checkbox:SetPoint("BOTTOM", previousElement, "BOTTOM", -80, -35)
            else
                checkbox:SetPoint("BOTTOM", previousElement, "BOTTOM", 0, -25)
            end
            _G[checkbox:GetName().."Text"]:SetText(config.text)
            checkbox:SetScript("OnClick", config.script)
            previousElement = checkbox
        end
        return previousElement
    end


    -- Atlas Options Sliders Data
    local atlasSliders = {
        { name = "AtlasOptionsFrameSliderButtonPos", label = L["Button Position"], min = 0, max = 360, step = 1, value = 336,
            option = "AtlasButtonPosition", updateFunc = AtlasButton_UpdatePosition },
        { name = "AtlasOptionsFrameSliderButtonRad", label = L["Button Radius"], min = 0, max = 200, step = 1, value = 78,
            option = "AtlasButtonRadius", updateFunc = AtlasButton_UpdatePosition },
        { name = "AtlasOptionsFrameSliderAlpha", label = L["Transparency"], min = 0.25, max = 1.0, step = 0.01, value = 1.0,
            option = "AtlasAlpha", updateFunc = Atlas_UpdateAlpha },
        { name = "AtlasOptionsFrameSliderScale", label = L["Scale"], min = 0.25, max = 1.5, step = 0.01, value = 1.0,
            option = "AtlasScale", updateFunc = Atlas_UpdateScale }
    }
    -- Creates slider controls for Atlas options
    -- @param startElement - The UI element to position sliders relative to
    -- @return The last created slider element for further positioning
    -- Each slider controls different Atlas settings like button position, transparency etc.
    local function CreateAtlasSliders(startElement)
        local previousElement = startElement
        local xOffset, yOffset = 0, -27
        for i, config in ipairs(atlasSliders) do
            if config and config.name and config.label then
                local slider = CreateFrame("Slider", config.name, optionsFrame, "OptionsSliderTemplate")
                slider:SetWidth(180)
                xOffset = (i == 1) and 78 or 0
                slider:SetPoint("BOTTOM", previousElement, "BOTTOM", xOffset, yOffset)
                slider:SetMinMaxValues(config.min or 0, config.max or 1)
                slider:SetValueStep(config.step or 0.01)
                slider:SetValue(config.value or 0)
                _G[slider:GetName().."Text"]:SetText(config.label.." ("..slider:GetValue()..")")
                _G[slider:GetName().."Low"]:SetText(tostring(config.min or 0))
                _G[slider:GetName().."High"]:SetText(tostring(config.max or 1))
                local sliderLabel = config.label
                local optionName = config.option
                local updateFunc = config.updateFunc
                slider:SetScript("OnValueChanged", function()
                    AtlasOptions_UpdateSlider(sliderLabel)
                    AtlasTWOptions[optionName] = this:GetValue()
                    updateFunc()
                end)
                previousElement = slider
            end
        end
        return previousElement
    end

    local lastElement = CreateAtlasCheckboxes()
    lastElement = CreateAtlasSliders(lastElement)

    -- Reset position button
    local resetPosition = CreateFrame("Button", "nil", optionsFrame, "OptionsButtonTemplate")
    resetPosition:SetPoint("BOTTOMLEFT", 20, 15)
    resetPosition:SetText(L["Reset Position"])
    resetPosition:SetScript("OnClick", function()
        AtlasOptions_ResetPosition()
    end)

    -- Default settings button
    local defaultSettingsButton = CreateFrame("Button", "asd", resetPosition, "OptionsButtonTemplate")
    defaultSettingsButton:SetPoint("RIGHT", 100, 0)
    defaultSettingsButton:SetText(L["Reset Settings"])
    defaultSettingsButton:SetScript("OnClick", function()
        AtlasOptions_DefaultSettings()
    end)
    -- Done button
    local doneButton = CreateFrame("Button", "AtlasOptionsFrameDone", optionsFrame, "OptionsButtonTemplate")
    doneButton:SetPoint("BOTTOMRIGHT", -20, 15)
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

    -- Quest Checkboxes Data
    local questCheckboxes = {
        { name = "KQAutoshowOption", script = KQAutoshowOption_OnClick },
        { name = "KQLEFTOption", script = KQLEFTOption_OnClick },
        { name = "KQRIGHTOption", script = KQRIGHTOption_OnClick },
        { name = "KQColourOption", script = KQColourOption_OnClick },
        { name = "KQCheckQuestlogButton", script = KQCheckQuestlogButton_OnClick },
        { name = "KQAutoQueryOption", script = KQAutoQueryOption_OnClick },
        { name = "KQQuerySpamOption", script = KQQuerySpamOption_OnClick },
        { name = "KQCompareTooltipOption", script = KQCompareTooltipOption_OnClick }
    }

    -- Optimized function to create quest checkboxes
	local function CreateCheckboxesQuest()
        local previousCheckbox = nil
        for i, config in ipairs(questCheckboxes) do
            local checkbox = CreateFrame("CheckButton", config.name, optionsFrame, "OptionsCheckButtonTemplate")
            if i == 1 then
                checkbox:SetPoint("BOTTOM", questOptionText, "BOTTOM", -145, -35)
            else
                checkbox:SetPoint("BOTTOM", previousCheckbox, "BOTTOM", 0, -25)
            end
            _G[config.name .. "Text"]:SetText(_G[config.name .. "Local"])
            checkbox:SetScript("OnClick", config.script)
            previousCheckbox = checkbox
        end
    end

    -- Loot Options Text
    local lootOptionText = optionsFrame:CreateFontString("", "ARTWORK", "GameFontNormal")
    lootOptionText:SetPoint("BOTTOM", lastElement, "BOTTOM", 0, -25)
    lootOptionText:SetText(L["Loot"])

    -- Checkbox configuration
    local lootCheckboxes = {
        { name = "AtlasLootOptionsFrameSafeLinks", text = L["Safe Chat Links |cff1eff00(recommended)|r"], script = AtlasLootOptions_SafeLinksToggle },
        { name = "AtlasLootOptionsFrameAllLinks", text = L["Enable all Chat Links"], script = AtlasLootOptions_AllLinksToggle },
        { name = "AtlasLootOptionsFrameDefaultTT", text = L["Default Tooltips"], script = AtlasLootOptions_DefaultTTToggle },
        { name = "AtlasLootOptionsFrameLootlinkTT", text = L["Lootlink Tooltips"], script = AtlasLootOptions_LootlinkTTToggle },
        { name = "AtlasLootOptionsFrameItemSyncTT", text = L["ItemSync Tooltips"], script = AtlasLootOptions_ItemSyncTTToggle },
        { name = "AtlasLootOptionsFrameShowSource", text = L["Show Source on Tooltips"], script = AtlasLootOptions_ShowSourceToggle },
        { name = "AtlasLootOptionsFrameShowPanel", text = L["Show Loot Panel with Atlas"], script = AtlasLootOptions_ShowPanel_OnClick },
        { name = "AtlasLootOptionsFrameEquipCompare", text = L["Use EquipCompare"], script = AtlasLootOptions_EquipCompareToggle },
        { name = "AtlasLootOptionsFrameItemID", text = L["Show IDs at all times"], script = AtlasLootOptions_ItemIDToggle },
        { name = "AtlasLootOptionsFrameOpaque", text = L["Make Loot Table Opaque"], script = AtlasLootOptions_OpaqueToggle },
        { name = "AtlasLootOptionsFrameItemSpam", text = L["Suppress text spam when querying items"], script = AtlasLootOptions_ItemSpam }
    }

    -- Optimized function to create checkboxes
    local function CreateCheckboxesLoot()
        local previousCheckbox = nil
        for i, config in ipairs(lootCheckboxes) do
            local checkbox = CreateFrame("CheckButton", config.name, optionsFrame, "OptionsCheckButtonTemplate")

            -- Simplified positioning logic
            if i == 1 then
                checkbox:SetPoint("BOTTOM", lootOptionText, "BOTTOM", -78, -35)
            elseif i <= 6 then
                checkbox:SetPoint("BOTTOM", previousCheckbox, "BOTTOM", 0, -25)
            else
                -- Second column (items 7-10)
                local referenceCheckbox = lootCheckboxes[i - 6].name
                checkbox:SetPoint("RIGHT", referenceCheckbox, "RIGHT", 195, 0)
            end

            _G[config.name .. "Text"]:SetText(config.text)
            checkbox:SetScript("OnClick", config.script)
            previousCheckbox = checkbox
        end
    end

	-- Create checkboxes
	CreateCheckboxesQuest()
    CreateCheckboxesLoot()

    return optionsFrame
end

-- Call the function to create frames when this file is loaded
atlasOptions_CreateFrames()