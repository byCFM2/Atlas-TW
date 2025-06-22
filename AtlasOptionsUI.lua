local _G = getfenv()
AtlasTW = AtlasTW or {}
local L = AceLibrary("AceLocale-2.2"):new("Atlas")

do
    -- Create the main options frame
    local optionsFrame = CreateFrame("Frame", "AtlasOptionsFrame", UIParent)
    optionsFrame:SetFrameStrata("MEDIUM")
    optionsFrame:SetHeight(550)
    optionsFrame:SetWidth(550)
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
    local title = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", optionsFrame, "TOP", 0, -15)
    title:SetText(L["Options"])

    -- AtlasOptionsText
    local atlasOptionText = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    atlasOptionText:SetPoint("BOTTOM", title, "BOTTOM", -160, -25)
    atlasOptionText:SetText(L["Atlas"])

    -- Atlas Options Checkboxes Data
    local atlasCheckboxes = {
        { name = "AtlasTWOptionToggleButton", text = L["Show Button on Minimap"], script = function() AtlasTW.MinimapButtonOnClick() end },
        { name = "AtlasTWOptionAutoSelect", text = L["Auto-Select Instance Map"], script = function() AtlasTW.OptionsAutoSelectOnClick() end },
        { name = "AtlasTWOptionRightClick", text = L["Right-Click for World Map"], script = function() AtlasTW.OptionsWorldMapOnClick() end },
        { name = "AtlasTWOptionAcronyms", text = L["Show Acronyms"], script = function() AtlasTW.OptionsAcronymsOnClick() end },
        { name = "AtlasTWOptionClamped", text = L["Clamp window to screen"], script = function() AtlasTW.OptionsClampedOnClick() end }
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
        { name = "AtlasTWOptionSliderButtonPos", label = L["Button Position"], min = 0, max = 360, step = 1, value = 336,
            option = "AtlasButtonPosition", updateFunc = AtlasTW.MinimapButtonUpdatePosition },
        { name = "AtlasTWOptionSliderButtonRad", label = L["Button Radius"], min = 0, max = 200, step = 1, value = 78,
            option = "AtlasButtonRadius", updateFunc = AtlasTW.MinimapButtonUpdatePosition },
        { name = "AtlasTWOptionSliderAlpha", label = L["Transparency"], min = 0.25, max = 1.0, step = 0.01, value = 1.0,
            option = "AtlasAlpha", updateFunc = AtlasTW.OptionsUpdateAlpha },
        { name = "AtlasTWOptionSliderScale", label = L["Scale"], min = 0.25, max = 1.5, step = 0.01, value = 1.0,
            option = "AtlasScale", updateFunc = AtlasTW.OptionsUpdateScale }
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
    local resetPosition = CreateFrame("Button", nil, optionsFrame, "OptionsButtonTemplate")
    resetPosition:SetPoint("BOTTOMLEFT", 20, 15)
    resetPosition:SetText(L["Reset Position"])
    resetPosition:SetScript("OnClick", function()
        AtlasTW.OptionResetPosition()
    end)

    -- Default settings button
    local defaultSettingsButton = CreateFrame("Button", nil, resetPosition, "OptionsButtonTemplate")
    defaultSettingsButton:SetPoint("RIGHT", 100, 0)
    defaultSettingsButton:SetText(L["Reset Settings"])
    defaultSettingsButton:SetScript("OnClick", function()
        AtlasTW.OptionDefaultSettings()
    end)
    -- Done button
    local doneButton = CreateFrame("Button", nil, optionsFrame, "OptionsButtonTemplate")
    doneButton:SetPoint("BOTTOMRIGHT", -20, 15)
    doneButton:SetText(L["Done"])
    doneButton:SetScript("OnClick", function()
        AtlasTW.OptionsOnClick()
    end)

    -- Categories dropdown
    local dropDownCats = CreateFrame("Button", "AtlasOptionsFrameDropDownCats", optionsFrame, "UIDropDownMenuTemplate")
    dropDownCats:SetPoint("TOP", doneButton, "TOP", 0, 30)
    UIDropDownMenu_SetWidth(80, dropDownCats)

    local dropDownCatsLabel = dropDownCats:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall")
    dropDownCatsLabel:SetText(L["Sort Instance by:"])
    dropDownCatsLabel:SetPoint("TOP", 0, 10)

    dropDownCats:SetScript("OnShow", function()
        AtlasTW.OptionFrameDropDownCatsOnShow()
    end)

    -- QuestOptionsText
    local questOptionText = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    questOptionText:SetPoint("BOTTOM", title, "BOTTOM", 100, -25)
    questOptionText:SetText(L["Quest"])

    -- Quest Checkboxes Data
    local questCheckboxes = {
        { name = "AtlasTWOptionAutoshow", text = L["Show the Quest Panel with Atlas"], script = function() AtlasTW.OptionAutoshowOnClick() end },
        { name = "AtlasTWOptionLeftSide", text = L["Show Quest Panel on the Left"], script = function() AtlasTW.OptionLeftSideOnClick() end },
        { name = "AtlasTWOptionRightSide", text = L["Show Quest Panel on the Right"], script = function() AtlasTW.OptionRightSideOnClick() end },
        { name = "AtlasTWOptionColor", text = L["Color Quests by Level"], script = function() AtlasTW.OptionColorOnClick() end },
        { name = "AtlasTWOptionQuestlog", text = L["Color Quests from the Questlog"], script = function() AtlasTW.OptionQuestlogOnClick() end },
        { name = "AtlasTWOptionAutoQuery", text = L["Auto-Query Unknown Items"], script = function() AtlasTW.OptionAutoQueryOnClick() end },
        { name = "AtlasTWOptionQuerySpam", text = L["Suppress Server Query Spam"], script = function() AtlasTW.OptionQuerySpamOnClick() end },
        { name = "AtlasTWOptionCompareTooltip", text = L["Compare Rewards and Gear (/rl)"], script = function() AtlasTW.OptionCompareTooltipOnClick() end }
    }

    -- Optimized function to create quest checkboxes
	do
        local previousCheckbox = nil
        for i, config in ipairs(questCheckboxes) do
            local checkbox = CreateFrame("CheckButton", config.name, optionsFrame, "OptionsCheckButtonTemplate")
            if i == 1 then
                checkbox:SetPoint("BOTTOM", questOptionText, "BOTTOM", -145, -35)
            else
                checkbox:SetPoint("BOTTOM", previousCheckbox, "BOTTOM", 0, -25)
            end
            _G[config.name .. "Text"]:SetText(config.text)
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
        { name = "AtlasTWOptionSafeLinks", text = L["Safe Chat Links |cff1eff00(recommended)|r"], script = function() AtlasTW.OptionSafeLinksOnClick() end },
        { name = "AtlasTWOptionAllLinks", text = L["Enable all Chat Links"], script = function() AtlasTW.OptionAllLinksOnClick() end },
        { name = "AtlasTWOptionDefaultTT", text = L["Default Tooltips"], script = function() AtlasTW.OptionDefaultTTOnClick() end },
        { name = "AtlasTWOptionLootlinkTT", text = L["Lootlink Tooltips"], script = function() AtlasTW.OptionLootlinkTTOnClick() end },
        { name = "AtlasTWOptionItemSyncTT", text = L["ItemSync Tooltips"], script = function() AtlasTW.OptionItemSyncTTOnClick() end },
        { name = "AtlasTWOptionShowSource", text = L["Show Source on Tooltips"], script = function() AtlasTW.OptionShowSourceOnClick() end },
        { name = "AtlasTWOptionShowPanel", text = L["Show Loot Panel with Atlas"], script = function() AtlasTW.OptionShowPanelOnClick() end},
        { name = "AtlasTWOptionEquipCompare", text = L["Use EquipCompare"], script = function() AtlasTW.OptionEquipCompareOnClick() end },
        { name = "AtlasTWOptionItemID", text = L["Show IDs at all times"], script = function() AtlasTW.OptionItemIDOnClick() end },
        { name = "AtlasTWOptionOpaque", text = L["Make Loot Table Opaque"], script = function() AtlasTW.OptionOpaqueOnClick() end },
        { name = "AtlasTWOptionItemSpam", text = L["Suppress Text Spam"], script = function() AtlasTW.OptionItemSpamOnClick() end }
    }

    do
        local previousCheckbox = nil
        for i, config in ipairs(lootCheckboxes) do
            local checkbox = CreateFrame("CheckButton", config.name, optionsFrame, "OptionsCheckButtonTemplate")
            if i == 1 then
                checkbox:SetPoint("BOTTOM", lootOptionText, "BOTTOM", -78, -35)
            elseif i <= 6 then
                checkbox:SetPoint("BOTTOM", previousCheckbox, "BOTTOM", 0, -25)
            else
                local referenceCheckbox = lootCheckboxes[i - 6].name
                checkbox:SetPoint("RIGHT", referenceCheckbox, "RIGHT", 195, 0)
            end
            _G[config.name .. "Text"]:SetText(config.text)
            checkbox:SetScript("OnClick", config.script)
            previousCheckbox = checkbox
        end
    end
end