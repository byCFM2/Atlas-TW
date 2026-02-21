local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.ProfessionHooks = AtlasTW.ProfessionHooks or {}

local L = AtlasTW.Localization.UI
local LS = AtlasTW.Localization.Spells

-- Configuration
local TABS_ORDER = {
    "Alchemy", "Blacksmithing", "Enchanting", "Engineering",
    "Leatherworking", "Tailoring", "Jewelcrafting",
    "Cooking", "First Aid", "Mining", "Poisons", "Smelting"
}

-- Cache for skill levels: Name -> "<1/50/100/150>"
local skillLevelCache = {}
local scannedProfessions = {}
local processingQueue = {}
local isProcessing = false

-- Tooltip scanner
local scanner = CreateFrame("GameTooltip", "AtlasTWProfessionScanner", nil, "GameTooltipTemplate")
scanner:SetOwner(WorldFrame, "ANCHOR_NONE")

-- Helper: Get Names from ID (returns list of potential names)
function AtlasTW.ProfessionHooks.GetNamesFromID(id)
    if not id then return {} end
    local names = {}
    local seen = {}

    local function addName(n)
        if n and n ~= "" and not seen[n] then
            table.insert(names, n)
            seen[n] = true
        end
    end

    -- 1. Check SpellDB
    if AtlasTW.SpellDB then
        local function checkDB(db)
            if db and db[id] then
                if db[id].name then
                    addName(db[id].name)
                elseif db[id].item then
                    -- Use scanner to get item name (reliable even if not cached)
                    scanner:SetOwner(WorldFrame, "ANCHOR_NONE")
                    scanner:ClearLines()
                    if pcall(scanner.SetHyperlink, scanner, "item:" .. db[id].item) then
                        local textObj = _G["AtlasTWProfessionScannerTextLeft1"]
                        if textObj then
                            addName(textObj:GetText())
                        end
                    end
                end
            end
        end

        checkDB(AtlasTW.SpellDB.enchants)
        checkDB(AtlasTW.SpellDB.craftspells)
    end

    -- 2. Tooltip Scan (Spell)
    scanner:SetOwner(WorldFrame, "ANCHOR_NONE")
    scanner:ClearLines()
    if scanner.SetHyperlink then
        if pcall(scanner.SetHyperlink, scanner, "spell:" .. id) then
            local textObj = _G["AtlasTWProfessionScannerTextLeft1"]
            if textObj then
                local text = textObj:GetText()
                if text then
                    addName(text)
                    -- Try to strip Rank if present (e.g. "Instant Poison Rank 1" -> "Instant Poison")
                    -- This helps matching with TradeSkill names which often omit rank
                    local pattern = L["Rank Pattern"] or " %a+ %d+$"
                    local noRank = string.gsub(text, pattern, "") -- Basic " Rank N" matching
                    if noRank ~= text then addName(noRank) end
                end
            end
        end
    end

    return names
end

-- Helper: Format skill levels
local function FormatSkillLevels(skillTable)
    if not skillTable or type(skillTable) ~= "table" then return "" end
    local Colors = AtlasTW.Colors
    local O = Colors.ORANGE or "|cffFF8000"
    local Y = Colors.YELLOW or "|cffFFFF00"
    local G = Colors.GREEN or "|cff00FF00"
    local Gr = Colors.GREY or "|cff808080"
    local W = "|r"

    local s1 = (skillTable[1] and (O .. skillTable[1] .. W)) or "?"
    local s2 = (skillTable[2] and (Y .. skillTable[2] .. W)) or "?"
    local s3 = (skillTable[3] and (G .. skillTable[3] .. W)) or "?"
    local s4 = (skillTable[4] and (Gr .. skillTable[4] .. W)) or "?"

    return "<" .. s1 .. "/" .. s2 .. "/" .. s3 .. "/" .. s4 .. ">"
end

-- Helper: Process Queue
local function ProcessQueue()
    if not isProcessing then return end

    local startTime = GetTime()
    local processed = 0

    while table.getn(processingQueue) > 0 do
        local task = table.remove(processingQueue, 1)

        local names = AtlasTW.ProfessionHooks.GetNamesFromID(task.id)
        local skillText = FormatSkillLevels(task.skill)

        for _, name in ipairs(names) do
            skillLevelCache[name] = skillText
        end

        processed = processed + 1

        -- Yield every 20ms or 50 items to avoid freeze
        if (GetTime() - startTime > 0.02) or (processed > 50) then
            if AtlasTW.Timer and AtlasTW.Timer.Start then
                AtlasTW.Timer.Start(0.05, ProcessQueue)
            else
                -- Fallback if Timer not available (shouldn't happen)
                ProcessQueue()
            end
            return
        end
    end

    isProcessing = false

    -- Refresh UI when done
    if TradeSkillFrame and TradeSkillFrame:IsVisible() then
        AtlasTW.ProfessionHooks.OnTradeSkillUpdate()
    end
    if CraftFrame and CraftFrame:IsVisible() then
        AtlasTW.ProfessionHooks.OnCraftUpdate()
    end
end

-- Helper: Queue Profession for Scanning
local function ScanProfession(profName)
    if scannedProfessions[profName] then return end
    scannedProfessions[profName] = true

    if not AtlasTWLoot_Data then return end

    for key, data in pairs(AtlasTWLoot_Data) do
        if type(data) == "table" and type(key) == "string" then
            for _, recipe in ipairs(data) do
                if recipe.id and recipe.skill then
                    table.insert(processingQueue, { id = recipe.id, skill = recipe.skill })
                end
            end
        end
    end

    if not isProcessing and table.getn(processingQueue) > 0 then
        isProcessing = true
        ProcessQueue()
    end
end

-- Side Tabs Implementation
local sideTabs = {}

function AtlasTW.ProfessionHooks.UpdateSideTabs(frame)
    if not AtlasTWOptions or not AtlasTWOptions.ProfessionInfo then
        for _, tab in ipairs(sideTabs) do tab:Hide() end
        return
    end

    local playerProfessions = {}
    local numTabs = GetNumSpellTabs()

    -- Scan spellbook
    for i = 1, numTabs do
        local name, texture, offset, numSpells = GetSpellTabInfo(i)
        for s = offset + 1, offset + numSpells do
            local spellName, rank = GetSpellName(s, "BOOKTYPE_SPELL")
            local texture = GetSpellTexture(s, "BOOKTYPE_SPELL")

            local found = false
            for _, engName in ipairs(TABS_ORDER) do
                local locName = LS[engName] or engName
                if spellName == locName then
                    found = true
                    break
                end
            end

            if found then
                table.insert(playerProfessions, { name = spellName, texture = texture })
            end
        end
    end

    -- Create/Update Tabs
    for i, prof in ipairs(playerProfessions) do
        if not sideTabs[i] then
            local tab = CreateFrame("CheckButton", "AtlasTWProfessionTab" .. i, frame, "SpellBookSkillLineTabTemplate")
            tab:SetWidth(32)
            tab:SetHeight(32)

            local bg = tab:CreateTexture(nil, "BACKGROUND")
            bg:SetTexture("Interface\\SpellBook\\SpellBook-SkillLineTab")
            bg:SetWidth(64)
            bg:SetHeight(64)
            bg:SetPoint("TOPLEFT", -3, 11)
            tab.bg = bg

            tab:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
            tab:GetHighlightTexture():SetBlendMode("ADD")

            tab:SetCheckedTexture("Interface\\Buttons\\CheckButtonHilight")
            tab:GetCheckedTexture():SetBlendMode("ADD")

            tab:SetScript("OnEnter", function()
                GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
                GameTooltip:SetText(this.spellName)
            end)
            tab:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)

            sideTabs[i] = tab
        end

        local tab = sideTabs[i]
        tab:SetParent(frame)
        -- Ensure frame level is high enough. TradeSkillFrame is usually around level 1-5.
        -- We want to be above the frame and its standard children.
        tab:SetFrameLevel(frame:GetFrameLevel() + 5)
        tab:Show()
        tab:ClearAllPoints()
        tab:SetPoint("TOPLEFT", frame, "TOPRIGHT", 0, -30 + (i - 1) * -50)

        tab:SetNormalTexture(prof.texture)
        tab.spellName = prof.name

        local currentName = nil
        if frame == TradeSkillFrame then
            currentName = GetTradeSkillLine()
        elseif frame == CraftFrame then
            currentName = GetCraftDisplaySkillLine()
        end

        tab:SetChecked(currentName == prof.name)

        tab:SetScript("OnClick", function()
            CastSpellByName(this.spellName)
        end)
    end

    for i = table.getn(playerProfessions) + 1, table.getn(sideTabs) do
        sideTabs[i]:Hide()
    end
end

-- Hook for TradeSkillFrame
function AtlasTW.ProfessionHooks.OnTradeSkillUpdate()
    AtlasTW.ProfessionHooks.UpdateSideTabs(TradeSkillFrame)

    local profName = GetTradeSkillLine()
    if profName and not scannedProfessions["GLOBAL"] then
        ScanProfession("GLOBAL") -- Scan all
    end

    -- Check if Profession Info option is enabled
    if not AtlasTWOptions or not AtlasTWOptions.ProfessionInfo then
        return
    end

    local numSkills = GetNumTradeSkills()
    local skillOffset = FauxScrollFrame_GetOffset(TradeSkillListScrollFrame)

    for i = 1, TRADE_SKILLS_DISPLAYED do
        local skillIndex = skillOffset + i
        local skillButton = _G["TradeSkillSkill" .. i]
        local skillText = _G["TradeSkillSkill" .. i .. "Text"]

        if skillIndex <= numSkills then
            local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(skillIndex)

            if skillType ~= "header" and skillLevelCache[skillName] then
                local currentText = skillText:GetText()
                if currentText and not string.find(currentText, "<") then
                    skillText:SetText(currentText .. " " .. skillLevelCache[skillName])
                end
            end
        end
    end
end

-- Hook for CraftFrame
function AtlasTW.ProfessionHooks.OnCraftUpdate()
    AtlasTW.ProfessionHooks.UpdateSideTabs(CraftFrame)

    local profName = GetCraftDisplaySkillLine()
    if profName and not scannedProfessions["GLOBAL"] then
        ScanProfession("GLOBAL")
    end

    -- Check if Profession Info option is enabled
    if not AtlasTWOptions or not AtlasTWOptions.ProfessionInfo then
        return
    end

    local numCrafts = GetNumCrafts()
    local craftOffset = FauxScrollFrame_GetOffset(CraftListScrollFrame)

    for i = 1, CRAFTS_DISPLAYED do
        local craftIndex = craftOffset + i
        local craftButton = _G["Craft" .. i]
        local craftText = _G["Craft" .. i .. "Text"]

        if craftIndex <= numCrafts then
            local craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(craftIndex)

            if craftType ~= "header" and skillLevelCache[craftName] then
                local currentText = craftText:GetText()
                if currentText and not string.find(currentText, "<") then
                    craftText:SetText(currentText .. " " .. skillLevelCache[craftName])
                end
            end
        end
    end
end

-- Create Atlas Button
function AtlasTW.ProfessionHooks.CreateAtlasButton(frame)
    local btnName = frame:GetName() .. "AtlasButton"
    local btn = _G[btnName]

    if not btn then
        btn = CreateFrame("Button", btnName, frame, "UIPanelButtonTemplate")
        btn:SetScript("OnClick", function()
            if AtlasTWFrame and AtlasTWFrame:IsVisible() then
                AtlasTWFrame:Hide()
            else
                AtlasTWFrame:Show()

                -- Hide Quest UI if visible
                if AtlasTW.Quest and AtlasTW.Quest.UI and AtlasTW.Quest.UI.InsideAtlasFrame then
                    AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
                end

                -- Navigation Logic
                local profName = nil
                if frame == TradeSkillFrame then
                    profName = GetTradeSkillLine()
                elseif frame == CraftFrame then
                    profName = GetCraftDisplaySkillLine()
                end

                if profName and AtlasTW.MenuData and AtlasTW.MenuData.Crafting then
                    local foundPage = nil
                    local function clean(s) return string.lower(s or "") end

                    for _, entry in ipairs(AtlasTW.MenuData.Crafting) do
                        if entry.name and entry.lootpage then
                            local entryName = clean(entry.name)
                            local targetName = clean(profName)

                            -- Exact match or partial match (for "Mining, Smelting")
                            if entryName == targetName or string.find(entryName, targetName, 1, true) then
                                foundPage = entry.lootpage
                                break
                            end
                        end
                    end

                    if foundPage then
                        if type(_G[foundPage]) == "function" then
                            _G[foundPage]()
                            if AtlasTWFrame and not AtlasTWFrame:IsVisible() then
                                AtlasTWFrame:Show()
                            end
                            if AtlasTWLootItemsFrame then
                                AtlasTWLootItemsFrame:Show()
                            end
                        elseif AtlasTW.LootBrowserUI.ShowLootPage then
                            AtlasTW.LootBrowserUI.ShowLootPage(foundPage)
                        else
                            -- Fallback implementation if ShowLootPage is missing
                            if AtlasTWLootItemsFrame then
                                AtlasTWLootItemsFrame.StoredElement = foundPage
                                AtlasTWLootItemsFrame.StoredMenu = nil -- Reset menu context if needed

                                -- Force update
                                if AtlasTW.LootBrowserUI.ScrollBarLootUpdate then
                                    AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
                                end

                                -- Ensure frames are shown
                                if AtlasTWFrame and not AtlasTWFrame:IsVisible() then
                                    AtlasTWFrame:Show()
                                end
                                AtlasTWLootItemsFrame:Show()
                            end
                        end
                    end
                end
            end
        end)

        -- Style for pfUI if needed
        if AtlasTW.pfUI and AtlasTW.pfUI.RestyleButton then
            AtlasTW.pfUI.RestyleButton(btnName)
        end
    end

    -- Check if Profession Info option is enabled
    if not AtlasTWOptions or not AtlasTWOptions.ProfessionInfo then
        if btn then btn:Hide() end
        return btn
    end

    btn:Show()
    btn:SetText("AtlasTW")

    -- Auto-resize width based on text
    local fontString = btn:GetFontString()
    if fontString then
        local width = fontString:GetStringWidth()
        btn:SetWidth(width + 20) -- Add padding
    else
        btn:SetWidth(70)         -- Fallback
    end
    btn:SetHeight(22)

    -- Position next to Close Button
    local closeBtn = _G[frame:GetName() .. "CloseButton"]
    if closeBtn then
        btn:SetPoint("RIGHT", closeBtn, "LEFT", -2, 0)
    else
        btn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -30, -8)
    end

    return btn
end

-- Initialize Hooks
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function()
    if arg1 == "Blizzard_TradeSkillUI" then
        hooksecurefunc("TradeSkillFrame_Update", AtlasTW.ProfessionHooks.OnTradeSkillUpdate)
        AtlasTW.ProfessionHooks.CreateAtlasButton(TradeSkillFrame)
        ScanProfession("GLOBAL") -- Start scanning immediately when UI loads
    elseif arg1 == "Blizzard_CraftUI" then
        hooksecurefunc("CraftFrame_Update", AtlasTW.ProfessionHooks.OnCraftUpdate)
        AtlasTW.ProfessionHooks.CreateAtlasButton(CraftFrame)
        ScanProfession("GLOBAL")
    end
end)

-- 1.12 Hook Compatibility
if not hooksecurefunc then
    function hooksecurefunc(name, func)
        local original = _G[name]
        _G[name] = function(...)
            if original then original(unpack(arg)) end
            func(unpack(arg))
        end
    end
end
