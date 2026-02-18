---
--- AtlasOptionsUI.lua - Atlas options UI frame and components
---
--- This file contains the options UI frame creation and management for Atlas-TW.
--- It handles the options window interface, UI controls, frame positioning,
--- and provides the visual components for Atlas configuration settings.
---
--- Features:
--- - Options frame creation and styling
--- - UI control initialization
--- - Frame positioning and movement
--- - Visual component management
--- - Options interface layout
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = AtlasTW or {}

local L = AtlasTW.Localization.UI
local LS = AtlasTW.Localization.Spells

do
    -- Create the main options frame
    local optionsFrame = CreateFrame("Frame", "AtlasTWOptionsFrame", UIParent)
    optionsFrame:SetFrameStrata("DIALOG")
    optionsFrame:SetHeight(570)
    optionsFrame:SetWidth(570)
    optionsFrame:SetPoint("CENTER", 0, 0)
    optionsFrame:SetMovable(true)
    optionsFrame:RegisterForDrag("LeftButton")
    optionsFrame:EnableMouse(true)
    optionsFrame:SetClampedToScreen(true)
    optionsFrame:Hide()
    tinsert(UISpecialFrames, "AtlasTWOptionsFrame")
    optionsFrame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    optionsFrame:SetBackdropColor(0, 0, 0, 1)
    optionsFrame:SetBackdropBorderColor(0.80, 0.60, 0.25, 1)

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

        -- Reagent Options
        if AtlasTWOptionReagentRowsSlider then
            AtlasTWOptionReagentRowsSlider:SetValue(AtlasTWOptions.ReagentRows or 20)
            AtlasOptions_UpdateSlider(L["Reagent Rows"])
        end

        if AtlasTWOptions.ReagentProfessions then
            if AtlasTWOptionReagentAlchemy then AtlasTWOptionReagentAlchemy:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Alchemy"]) end
            if AtlasTWOptionReagentBS then AtlasTWOptionReagentBS:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Blacksmithing"]) end
            if AtlasTWOptionReagentEnchant then AtlasTWOptionReagentEnchant:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Enchanting"]) end
            if AtlasTWOptionReagentEngi then AtlasTWOptionReagentEngi:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Engineering"]) end
            if AtlasTWOptionReagentLW then AtlasTWOptionReagentLW:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Leatherworking"]) end
            if AtlasTWOptionReagentTailor then AtlasTWOptionReagentTailor:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Tailoring"]) end
            if AtlasTWOptionReagentCooking then AtlasTWOptionReagentCooking:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Cooking"]) end
            if AtlasTWOptionReagentFirstAid then AtlasTWOptionReagentFirstAid:SetChecked(AtlasTWOptions
                .ReagentProfessions["First Aid"]) end
            if AtlasTWOptionReagentJC then AtlasTWOptionReagentJC:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Jewelcrafting"]) end
            if AtlasTWOptionReagentMining then AtlasTWOptionReagentMining:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Mining"]) end
            if AtlasTWOptionReagentPoisons then AtlasTWOptionReagentPoisons:SetChecked(AtlasTWOptions.ReagentProfessions
                ["Poisons"]) end
        end
    end)

    -- Title
    local title = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", optionsFrame, "TOP", 0, -15)
    title:SetText(L["Options"])

    -- AtlasOptionsText
    local atlasOptionText = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    atlasOptionText:SetPoint("BOTTOM", title, "BOTTOM", -160, -25)
    atlasOptionText:SetText("AtlasTW")

    -- Atlas Options Checkboxes Data
    local atlasCheckboxes = {
        {
            name = "AtlasTWOptionToggleButton",
            text = L["Show Button on Minimap"],
            script = function()
                AtlasTW.MinimapButtonOnClick()
            end
        },
        {
            name = "AtlasTWOptionAutoSelect",
            text = L["Auto-Select Instance Map"],
            script = function()
                AtlasTW.OptionsAutoSelectOnClick()
            end
        },
        {
            name = "AtlasTWOptionRightClick",
            text = L["Right-Click for World Map"],
            script = function()
                AtlasTW.OptionsWorldMapOnClick()
            end
        },
        {
            name = "AtlasTWOptionAcronyms",
            text = L["Show Acronyms"],
            script = function()
                AtlasTW.OptionsAcronymsOnClick()
            end
        },
        {
            name = "AtlasTWOptionClamped",
            text = L["Clamp window to screen"],
            script = function()
                AtlasTW.OptionsClampedOnClick()
            end
        },
        {
            name = "AtlasTWOptionCursorCoords",
            text = L["Show Cursor Coordinates on Map"],
            script = function()
                AtlasTW.OptionsCursorCoordsOnClick()
            end
        },
        {
            name = "AtlasTWOptionMapMarkers",
            text = L["Show Map Markers"],
            script = function()
                AtlasTW.OptionMapMarkersOnClick()
            end
        },
        {
            name = "AtlasTWOptionPfUI",
            text = L["Enable pfUI Styling"],
            script = function()
                AtlasTW.OptionsPfUIOnClick()
            end
        },
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
            _G[checkbox:GetName() .. "Text"]:SetText(config.text)
            checkbox:SetScript("OnClick", config.script)
            previousElement = checkbox
        end
        return previousElement
    end

    -- Atlas Options Sliders Data
    local atlasSliders = {
        {
            name = "AtlasTWOptionSliderButtonPos",
            label = L["Button Position"],
            min = 0,
            max = 360,
            step = 1,
            value = 336,
            option = "AtlasButtonPosition",
            updateFunc = AtlasTW.MinimapButtonUpdatePosition
        },
        {
            name = "AtlasTWOptionSliderButtonRad",
            label = L["Button Radius"],
            min = 0,
            max = 200,
            step = 1,
            value = 78,
            option = "AtlasButtonRadius",
            updateFunc = AtlasTW.MinimapButtonUpdatePosition
        },
        {
            name = "AtlasTWOptionSliderAlpha",
            label = L["Transparency"],
            min = 0.25,
            max = 1.0,
            step = 0.01,
            value = 1.0,
            option = "AtlasAlpha",
            updateFunc = AtlasTW.OptionsUpdateAlpha
        },
        {
            name = "AtlasTWOptionSliderScale",
            label = L["Scale"],
            min = 0.25,
            max = 1.5,
            step = 0.01,
            value = 1.0,
            option = "AtlasScale",
            updateFunc = AtlasTW.OptionsUpdateScale
        }
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
                _G[slider:GetName() .. "Text"]:SetText(config.label .. " (" .. slider:GetValue() .. ")")
                _G[slider:GetName() .. "Low"]:SetText(tostring(config.min or 0))
                _G[slider:GetName() .. "High"]:SetText(tostring(config.max or 1))
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
    resetPosition:SetWidth(120)
    resetPosition:SetText(L["Reset Position"])
    resetPosition:SetScript("OnClick", function()
        AtlasTW.OptionResetPosition()
    end)

    -- Default settings button
    local defaultSettingsButton = CreateFrame("Button", nil, resetPosition, "OptionsButtonTemplate")
    defaultSettingsButton:SetPoint("RIGHT", 150, 0)
    defaultSettingsButton:SetWidth(140)
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

    -- Categories dropdown (Hewdrop-based)
    local dropDownCats = CreateFrame("Button", "AtlasTWOptionsFrameDropDownCats", optionsFrame)
    dropDownCats:SetWidth(100)
    dropDownCats:SetHeight(20)
    dropDownCats:SetPoint("TOP", doneButton, "TOP", 5, 30)

    -- Background texture
    local dropDownCatsBg = dropDownCats:CreateTexture(nil, "BACKGROUND")
    dropDownCatsBg:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    dropDownCatsBg:SetVertexColor(0.1, 0.1, 0.1, 0.8)
    dropDownCatsBg:SetAllPoints(dropDownCats)

    -- Text display
    local dropDownCatsText = dropDownCats:CreateFontString("AtlasTWOptionsFrameDropDownCatsText", "OVERLAY",
        "GameFontHighlightSmall")
    dropDownCatsText:SetPoint("RIGHT", dropDownCats, "RIGHT", -20, 0)
    dropDownCatsText:SetJustifyH("LEFT")

    -- Arrow texture
    local dropDownCatsArrow = dropDownCats:CreateTexture(nil, "OVERLAY")
    dropDownCatsArrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
    dropDownCatsArrow:SetWidth(16)
    dropDownCatsArrow:SetHeight(16)
    dropDownCatsArrow:SetPoint("RIGHT", dropDownCats, "RIGHT", -2, 0)

    -- Highlight
    local dropDownCatsHighlight = dropDownCats:CreateTexture(nil, "HIGHLIGHT")
    dropDownCatsHighlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    dropDownCatsHighlight:SetBlendMode("ADD")
    dropDownCatsHighlight:SetAllPoints(dropDownCats)

    dropDownCats:SetScript("OnClick", function()
        if AtlasTW.HewdropMenus:IsOpen(dropDownCats) then
            AtlasTW.HewdropMenus:Close()
        else
            AtlasTW.HewdropMenus:OpenSortByMenu(dropDownCats)
        end
    end)

    local dropDownCatsLabel = dropDownCats:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall")
    dropDownCatsLabel:SetText(L["Sort Instance by:"])
    dropDownCatsLabel:SetPoint("TOP", 0, 12)

    dropDownCats:SetScript("OnShow", function()
        AtlasTW.OptionFrameDropDownCatsOnShow()
    end)

    -- QuestOptionsText
    local questOptionText = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    questOptionText:SetPoint("BOTTOM", title, "BOTTOM", 120, -25)
    questOptionText:SetText(L["Quest"])

    -- Quest Checkboxes Data
    local questCheckboxes = {
        {
            name = "AtlasTWOptionAutoshow",
            text = L["Show the Quest Panel with AtlasTW"],
            script = function()
                AtlasTW.OptionAutoshowOnClick()
            end
        },
        {
            name = "AtlasTWOptionLeftSide",
            text = L["Show Quest Panel on the Left"],
            script = function()
                AtlasTW.OptionLeftSideOnClick()
            end
        },
        {
            name = "AtlasTWOptionColor",
            text = L["Color Quests by Level"],
            script = function()
                AtlasTW.OptionColorOnClick()
            end
        },
        {
            name = "AtlasTWOptionQuestlog",
            text = L["Color Quests from the Questlog"],
            script = function()
                AtlasTW.OptionQuestlogOnClick()
            end
        },
        {
            name = "AtlasTWOptionAutoQuery",
            text = L["Auto-Query Unknown Items"],
            script = function()
                AtlasTW.OptionAutoQueryOnClick()
            end
        },
    }

    -- Optimized function to create quest checkboxes
    do
        local previousCheckbox = nil
        for i, config in ipairs(questCheckboxes) do
            local checkbox = CreateFrame("CheckButton", config.name, optionsFrame, "OptionsCheckButtonTemplate")
            if i == 1 then
                checkbox:SetPoint("BOTTOM", questOptionText, "BOTTOM", -125, -35)
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
        {
            name = "AtlasTWOptionSafeLinks",
            text = L["Safe Chat Links |cff1eff00(recommended)|r"],
            script = function()
                AtlasTW.OptionSafeLinksOnClick()
            end
        },
        {
            name = "AtlasTWOptionAllLinks",
            text = L["Enable all Chat Links"],
            script = function()
                AtlasTW.OptionAllLinksOnClick()
            end
        },
        {
            name = "AtlasTWOptionShowSource",
            text = L["Show Source on Tooltips"],
            script = function()
                AtlasTW.OptionShowSourceOnClick()
            end
        },
        {
            name = "AtlasTWOptionShowPanel",
            text = L["Show Loot Panel with AtlasTW"],
            script = function()
                AtlasTW.OptionShowPanelOnClick()
            end
        },
        {
            name = "AtlasTWOptionEquipCompare",
            text = L["Use EquipCompare"],
            script = function()
                AtlasTW.OptionEquipCompareOnClick()
            end
        },
        {
            name = "AtlasTWOptionOpaque",
            text = L["Make Loot Table Opaque"],
            script = function()
                AtlasTW.OptionOpaqueOnClick()
            end
        },
        {
            name = "AtlasTWOptionTooltipID",
            text = L["Show IDs in Tooltips"],
            script = function()
                AtlasTW.OptionTooltipIDOnClick()
            end
        },
        {
            name = "AtlasTWOptionTooltipIcon",
            text = L["Show Icon in Tooltips"],
            script = function()
                AtlasTW.OptionTooltipIconOnClick()
            end
        }
    }

    do
        local previousCheckbox = nil
        for i, config in ipairs(lootCheckboxes) do
            local checkbox = CreateFrame("CheckButton", config.name, optionsFrame, "OptionsCheckButtonTemplate")
            if i == 1 then
                checkbox:SetPoint("BOTTOM", lootOptionText, "BOTTOM", -78, -35)
            elseif i <= 5 then
                checkbox:SetPoint("BOTTOM", previousCheckbox, "BOTTOM", 0, -25)
            else
                local referenceCheckbox = lootCheckboxes[i - 5].name
                checkbox:SetPoint("RIGHT", referenceCheckbox, "RIGHT", 235, 0)
            end
            _G[config.name .. "Text"]:SetText(config.text)
            checkbox:SetScript("OnClick", config.script)
            previousCheckbox = checkbox
        end
        -- Reagent Options Section
        local reagentOptionText = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        reagentOptionText:SetPoint("BOTTOM", title, "BOTTOM", 130, -170)
        reagentOptionText:SetText(L["Reagent Tooltip Options"])

        -- Reagent Rows Slider
        local reagentRowsSlider = CreateFrame("Slider", "AtlasTWOptionReagentRowsSlider", optionsFrame,
            "OptionsSliderTemplate")
        reagentRowsSlider:SetPoint("TOPLEFT", reagentOptionText, "BOTTOMLEFT", -120, -25)
        reagentRowsSlider:SetMinMaxValues(0, 30)
        reagentRowsSlider:SetValueStep(1)
        reagentRowsSlider:SetWidth(180)
        _G[reagentRowsSlider:GetName() .. "Text"]:SetText(L["Reagent Rows"])
        _G[reagentRowsSlider:GetName() .. "Low"]:SetText("0")
        _G[reagentRowsSlider:GetName() .. "High"]:SetText("30")

        reagentRowsSlider:SetScript("OnValueChanged", function()
            AtlasOptions_UpdateSlider(L["Reagent Rows"])
            AtlasTWOptions.ReagentRows = this:GetValue()
        end)

        -- Profession Filters
        local function CreateProfCheckbox(name, text, key, x, y, anchor)
            local cb = CreateFrame("CheckButton", "AtlasTWOptionReagent" .. name, optionsFrame,
                "OptionsCheckButtonTemplate")
            cb:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", x, y)
            _G[cb:GetName() .. "Text"]:SetText(text)
            cb:SetScript("OnClick", function()
                AtlasTWOptions.ReagentProfessions[key] = this:GetChecked() and true or false
            end)
            return cb
        end

        local profAnchor = reagentRowsSlider
        local col1X, col2X = -10, 100

        local p1 = CreateProfCheckbox("Alchemy", LS["Alchemy"], "Alchemy", col1X, -15, profAnchor)
        local p2 = CreateProfCheckbox("BS", LS["Blacksmithing"], "Blacksmithing", 0, -5, p1)
        local p3 = CreateProfCheckbox("Enchant", LS["Enchanting"], "Enchanting", 0, -5, p2)
        local p4 = CreateProfCheckbox("Engi", LS["Engineering"], "Engineering", 0, -5, p3)
        p4:SetPoint("TOPLEFT", p1, "TOPLEFT", col2X, 0)
        local p5 = CreateProfCheckbox("LW", LS["Leatherworking"], "Leatherworking", 0, -5, p4)
        local p6 = CreateProfCheckbox("Tailor", LS["Tailoring"], "Tailoring", 0, -5, p5)
        local p7 = CreateProfCheckbox("Cooking", LS["Cooking"], "Cooking", 0, -5, p6)
        p7:SetPoint("TOPLEFT", p4, "TOPLEFT", col2X, 0)
        local p8 = CreateProfCheckbox("FirstAid", LS["First Aid"], "First Aid", 0, -5, p7)
        local p9 = CreateProfCheckbox("JC", LS["Jewelcrafting"], "Jewelcrafting", 0, -5, p8)
        local p10 = CreateProfCheckbox("Mining", LS["Mining"], "Mining", 0, -5, p9)
        local p11 = CreateProfCheckbox("Poisons", LS["Poisons"], "Poisons", 0, -5, p10)
    end
end
