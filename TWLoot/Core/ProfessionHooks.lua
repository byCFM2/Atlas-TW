local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.ProfessionHooks = AtlasTW.ProfessionHooks or {}

local LS = AtlasTW.Localization.Spells

-- Configuration
local TABS_ORDER = {
    "Alchemy", "Blacksmithing", "Enchanting", "Engineering",
    "Leatherworking", "Tailoring", "Jewelcrafting",
    "Cooking", "First Aid", "Mining", "Poisons", "Smelting"
}

-- Cache logic moved to Core/DataIndex.lua
-- This module now only handles UI hooking and display

-- Register callback to update UI when indexing progresses
if AtlasTW.DataIndex and AtlasTW.DataIndex.RegisterCallback then
    AtlasTW.DataIndex.RegisterCallback(function()
        if TradeSkillFrame and TradeSkillFrame:IsVisible() then
            AtlasTW.ProfessionHooks.OnTradeSkillUpdate()
        end
        if CraftFrame and CraftFrame:IsVisible() then
            AtlasTW.ProfessionHooks.OnCraftUpdate()
        end
    end)
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
        local _, _, offset, numSpells = GetSpellTabInfo(i)
        for s = offset + 1, offset + numSpells do
            local spellName, _ = GetSpellName(s, "BOOKTYPE_SPELL")
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
            -- Flag to prevent session termination
            AtlasTW.ProfessionHooks.IsSwitching = true

            -- Save position of the current window
            local currentFrame
            if TradeSkillFrame and TradeSkillFrame:IsVisible() then
                currentFrame = TradeSkillFrame
            elseif CraftFrame and CraftFrame:IsVisible() then
                currentFrame = CraftFrame
            end

            if currentFrame then
                local point, relativeTo, relativePoint, xOfs, yOfs = currentFrame:GetPoint()
                AtlasTW.ProfessionHooks.SavedPosition = { point, relativeTo, relativePoint, xOfs, yOfs }

                -- Close the current frame before switching
                -- This prevents multiple profession frames from being open at once
                -- (Enchanting uses CraftFrame, others use TradeSkillFrame)
                HideUIPanel(currentFrame)
            end

            -- Let CastSpellByName handle the switch naturally
            -- The IsSwitching flag will prevent OnHide hooks from calling CloseTradeSkill/CloseCraft
            CastSpellByName(this.spellName)

            -- Reset flag after a short delay to ensure events are processed
            if AtlasTW.Timer and AtlasTW.Timer.Start then
                AtlasTW.Timer.Start(0.5, function()
                    AtlasTW.ProfessionHooks.IsSwitching = false
                end)
            else
                -- Fallback if Timer not available (should be loaded though)
                AtlasTW.ProfessionHooks.IsSwitching = false
            end
        end)
    end

    for i = table.getn(playerProfessions) + 1, table.getn(sideTabs) do
        sideTabs[i]:Hide()
    end
end

-- Hook for TradeSkillFrame
AtlasTW.ProfessionHooks.LinkCache = AtlasTW.ProfessionHooks.LinkCache or {}

-- Async availability scanner for TradeSkill
AtlasTW.ProfessionHooks.TSAvailCache = {}
AtlasTW.ProfessionHooks.TSScanIndex = 0
AtlasTW.ProfessionHooks.TSScanTotal = 0
AtlasTW.ProfessionHooks.TSScanActive = false

local RECIPES_PER_FRAME = 2

local tsScanFrame = CreateFrame("Frame")
tsScanFrame:Hide()
tsScanFrame:SetScript("OnUpdate", function()
    if not AtlasTW.ProfessionHooks.TSScanActive then
        tsScanFrame:Hide()
        return
    end
    if not TradeSkillFrame or not TradeSkillFrame:IsVisible() then
        AtlasTW.ProfessionHooks.TSScanActive = false
        tsScanFrame:Hide()
        return
    end

    local numSkills = GetNumTradeSkills()
    if numSkills ~= AtlasTW.ProfessionHooks.TSScanTotal then
        -- Recipe list changed, restart
        AtlasTW.ProfessionHooks.TSAvailCache = {}
        AtlasTW.ProfessionHooks.TSScanIndex = 0
        AtlasTW.ProfessionHooks.TSScanTotal = numSkills
    end

    local processed = 0
    local idx = AtlasTW.ProfessionHooks.TSScanIndex

    while processed < RECIPES_PER_FRAME and idx < numSkills do
        idx = idx + 1
        local skillName, skillType, numAvailable = GetTradeSkillInfo(idx)

        if skillName and skillType ~= "header" and numAvailable and numAvailable >= 0 then
            local minCrafts = 99999
            local hasNonVendorReagent = false

            for r = 1, GetTradeSkillNumReagents(idx) do
                local _, _, rCount, playerRCount = GetTradeSkillReagentInfo(idx, r)
                local rLink = GetTradeSkillReagentItemLink(idx, r)
                if rLink then
                    local rID = AtlasTW.ProfessionHooks.LinkCache[rLink]
                    if rID == nil then
                        local _, _, parsedID = string.find(rLink, "item:(%d+)")
                        rID = tonumber(parsedID)
                        AtlasTW.ProfessionHooks.LinkCache[rLink] = rID or false
                    end

                    if rID and AtlasTW.Integrations and AtlasTW.Integrations.IsVendorItem(rID) then
                        -- skip vendor items
                    else
                        hasNonVendorReagent = true
                        local crafts = math.floor(playerRCount / rCount)
                        if crafts < minCrafts then
                            minCrafts = crafts
                        end
                    end
                end
            end

            if not hasNonVendorReagent then
                minCrafts = numAvailable
            end

            if minCrafts ~= 99999 and minCrafts > numAvailable then
                AtlasTW.ProfessionHooks.TSAvailCache[idx] = minCrafts
            else
                AtlasTW.ProfessionHooks.TSAvailCache[idx] = nil
            end

            processed = processed + 1
        end
    end

    AtlasTW.ProfessionHooks.TSScanIndex = idx

    if idx >= numSkills then
        AtlasTW.ProfessionHooks.TSScanActive = false
        tsScanFrame:Hide()
        -- Refresh display with final results
        if TradeSkillFrame and TradeSkillFrame:IsVisible() then
            AtlasTW.ProfessionHooks.OnTradeSkillUpdate()
        end
    end
end)

function AtlasTW.ProfessionHooks.StartTSScan()
    AtlasTW.ProfessionHooks.TSAvailCache = {}
    AtlasTW.ProfessionHooks.TSScanIndex = 0
    AtlasTW.ProfessionHooks.TSScanTotal = 0
    AtlasTW.ProfessionHooks.TSScanActive = true
    tsScanFrame:Show()
end

-- Event-driven scan triggers
local tsEventFrame = CreateFrame("Frame")
tsEventFrame:RegisterEvent("BAG_UPDATE")
tsEventFrame:RegisterEvent("TRADE_SKILL_UPDATE")
tsEventFrame:SetScript("OnEvent", function()
    if TradeSkillFrame and TradeSkillFrame:IsVisible() then
        AtlasTW.ProfessionHooks.StartTSScan()
    end
end)

function AtlasTW.ProfessionHooks.OnTradeSkillUpdate()
    -- Reentrancy guard: SetText() can trigger TradeSkillFrame_Update again
    if AtlasTW.ProfessionHooks._updatingTS then return end

    -- Only update if frame is visible to prevent stealing tabs
    if not TradeSkillFrame or not TradeSkillFrame:IsVisible() then return end

    -- Restore position if switching professions
    if AtlasTW.ProfessionHooks.SavedPosition then
        local p = AtlasTW.ProfessionHooks.SavedPosition
        TradeSkillFrame:ClearAllPoints()
        TradeSkillFrame:SetPoint(p[1], p[2], p[3], p[4], p[5])
        AtlasTW.ProfessionHooks.SavedPosition = nil
    end

    AtlasTW.ProfessionHooks.UpdateSideTabs(TradeSkillFrame)

    -- Check if Profession Info option is enabled
    if not AtlasTWOptions or not AtlasTWOptions.ProfessionInfo then
        return
    end

    -- Start async scan if not already running
    if not AtlasTW.ProfessionHooks.TSScanActive and AtlasTW.ProfessionHooks.TSScanIndex == 0 then
        AtlasTW.ProfessionHooks.StartTSScan()
    end

    AtlasTW.ProfessionHooks._updatingTS = true

    local numSkills = GetNumTradeSkills()
    local skillOffset = FauxScrollFrame_GetOffset(TradeSkillListScrollFrame)

    for i = 1, TRADE_SKILLS_DISPLAYED do
        local skillIndex = skillOffset + i
        local skillButton = _G["TradeSkillSkill" .. i]
        local skillText = _G["TradeSkillSkill" .. i .. "Text"]

        -- Create icon if needed
        if not skillButton.atlasIcon then
            skillButton.atlasIcon = skillButton:CreateTexture(nil, "ARTWORK")
            skillButton.atlasIcon:SetWidth(12)
            skillButton.atlasIcon:SetHeight(12)
        end
        local icon = skillButton.atlasIcon
        icon:Hide()

        if skillIndex <= numSkills then
            local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(skillIndex)

            if skillName and skillType ~= "header" then
                -- Read from async cache (nil means not yet computed or same as numAvailable)
                local customAvailable = AtlasTW.ProfessionHooks.TSAvailCache[skillIndex] or numAvailable or 0

                -- Construct Text
                local countText = ""
                local displayNum = numAvailable or 0
                if customAvailable > 0 then
                    if customAvailable > displayNum then
                        countText = "[" .. customAvailable .. "/" .. displayNum .. "] "
                    else
                        countText = "[" .. customAvailable .. "] "
                    end
                elseif displayNum > 0 then
                    countText = "[" .. displayNum .. "] "
                end

                local nameText = skillName
                local levels = AtlasTW.DataIndex and AtlasTW.DataIndex.GetSkillLevels(skillName)
                if levels then
                    nameText = nameText .. " " .. levels
                end

                local texture = GetTradeSkillIcon(skillIndex)
                if texture then
                    -- Add spacer for icon (7 spaces)
                    local spacer = "       "

                    -- Measure width of countText to position icon correctly
                    skillText:SetText(countText)
                    local width = skillText:GetStringWidth()

                    skillText:SetText(countText .. spacer .. nameText)

                    icon:SetTexture(texture)
                    icon:ClearAllPoints()
                    icon:SetPoint("LEFT", skillText, "LEFT", width, 0)
                    icon:Show()
                else
                    skillText:SetText(countText .. nameText)
                end
            else
                -- Header: ensure default text is kept (TradeSkillFrame_Update handles it)
            end
        else
            -- Empty button
        end
    end

    AtlasTW.ProfessionHooks._updatingTS = nil
end

-- Async availability scanner for CraftFrame
AtlasTW.ProfessionHooks.CraftAvailCache = {}
AtlasTW.ProfessionHooks.CraftScanIndex = 0
AtlasTW.ProfessionHooks.CraftScanTotal = 0
AtlasTW.ProfessionHooks.CraftScanActive = false

local craftScanFrame = CreateFrame("Frame")
craftScanFrame:Hide()
craftScanFrame:SetScript("OnUpdate", function()
    if not AtlasTW.ProfessionHooks.CraftScanActive then
        craftScanFrame:Hide()
        return
    end
    if not CraftFrame or not CraftFrame:IsVisible() then
        AtlasTW.ProfessionHooks.CraftScanActive = false
        craftScanFrame:Hide()
        return
    end

    local numCrafts = GetNumCrafts()
    if numCrafts ~= AtlasTW.ProfessionHooks.CraftScanTotal then
        AtlasTW.ProfessionHooks.CraftAvailCache = {}
        AtlasTW.ProfessionHooks.CraftScanIndex = 0
        AtlasTW.ProfessionHooks.CraftScanTotal = numCrafts
    end

    local processed = 0
    local idx = AtlasTW.ProfessionHooks.CraftScanIndex

    while processed < RECIPES_PER_FRAME and idx < numCrafts do
        idx = idx + 1
        local craftName, craftSubSpellName, craftType, numAvailable = GetCraftInfo(idx)

        if craftName and craftType ~= "header" and numAvailable and numAvailable >= 0 then
            local minCrafts = 99999
            local hasNonVendorReagent = false

            for r = 1, GetCraftNumReagents(idx) do
                local _, _, rCount, playerRCount = GetCraftReagentInfo(idx, r)
                local rLink = GetCraftReagentItemLink(idx, r)
                if rLink then
                    local rID = AtlasTW.ProfessionHooks.LinkCache[rLink]
                    if rID == nil then
                        local _, _, parsedID = string.find(rLink, "item:(%d+)")
                        rID = tonumber(parsedID)
                        AtlasTW.ProfessionHooks.LinkCache[rLink] = rID or false
                    end

                    if rID and AtlasTW.Integrations and AtlasTW.Integrations.IsVendorItem(rID) then
                        -- skip vendor items
                    else
                        hasNonVendorReagent = true
                        local crafts = math.floor(playerRCount / rCount)
                        if crafts < minCrafts then
                            minCrafts = crafts
                        end
                    end
                end
            end

            if not hasNonVendorReagent then
                minCrafts = numAvailable
            end

            if minCrafts ~= 99999 and minCrafts > numAvailable then
                AtlasTW.ProfessionHooks.CraftAvailCache[idx] = minCrafts
            else
                AtlasTW.ProfessionHooks.CraftAvailCache[idx] = nil
            end

            processed = processed + 1
        end
    end

    AtlasTW.ProfessionHooks.CraftScanIndex = idx

    if idx >= numCrafts then
        AtlasTW.ProfessionHooks.CraftScanActive = false
        craftScanFrame:Hide()
        if CraftFrame and CraftFrame:IsVisible() then
            AtlasTW.ProfessionHooks.OnCraftUpdate()
        end
    end
end)

function AtlasTW.ProfessionHooks.StartCraftScan()
    AtlasTW.ProfessionHooks.CraftAvailCache = {}
    AtlasTW.ProfessionHooks.CraftScanIndex = 0
    AtlasTW.ProfessionHooks.CraftScanTotal = 0
    AtlasTW.ProfessionHooks.CraftScanActive = true
    craftScanFrame:Show()
end

-- Event-driven craft scan triggers
local craftEventFrame = CreateFrame("Frame")
craftEventFrame:RegisterEvent("BAG_UPDATE")
craftEventFrame:RegisterEvent("CRAFT_UPDATE")
craftEventFrame:SetScript("OnEvent", function()
    if CraftFrame and CraftFrame:IsVisible() then
        AtlasTW.ProfessionHooks.StartCraftScan()
    end
end)

function AtlasTW.ProfessionHooks.OnCraftUpdate()
    -- Reentrancy guard: SetText() can trigger CraftFrame_Update again
    if AtlasTW.ProfessionHooks._updatingCraft then return end

    -- Only update if frame is visible to prevent stealing tabs
    if not CraftFrame or not CraftFrame:IsVisible() then return end

    -- Restore position if switching professions
    if AtlasTW.ProfessionHooks.SavedPosition then
        local p = AtlasTW.ProfessionHooks.SavedPosition
        CraftFrame:ClearAllPoints()
        CraftFrame:SetPoint(p[1], p[2], p[3], p[4], p[5])
        AtlasTW.ProfessionHooks.SavedPosition = nil
    end

    AtlasTW.ProfessionHooks.UpdateSideTabs(CraftFrame)

    -- Check if Profession Info option is enabled
    if not AtlasTWOptions or not AtlasTWOptions.ProfessionInfo then
        return
    end

    -- Start async scan if not already running
    if not AtlasTW.ProfessionHooks.CraftScanActive and AtlasTW.ProfessionHooks.CraftScanIndex == 0 then
        AtlasTW.ProfessionHooks.StartCraftScan()
    end

    AtlasTW.ProfessionHooks._updatingCraft = true

    local numCrafts = GetNumCrafts()
    local craftOffset = FauxScrollFrame_GetOffset(CraftListScrollFrame)

    for i = 1, CRAFTS_DISPLAYED do
        local craftIndex = craftOffset + i
        local craftButton = _G["Craft" .. i]
        local craftText = _G["Craft" .. i .. "Text"]

        -- Create icon if needed
        if not craftButton.atlasIcon then
            craftButton.atlasIcon = craftButton:CreateTexture(nil, "ARTWORK")
            craftButton.atlasIcon:SetWidth(12)
            craftButton.atlasIcon:SetHeight(12)
        end
        local icon = craftButton.atlasIcon
        icon:Hide()

        if craftIndex <= numCrafts then
            local craftName, _, craftType, numAvailable, _ = GetCraftInfo(craftIndex)

            if craftName and craftType ~= "header" then
                -- Read from async cache
                local customAvailable = AtlasTW.ProfessionHooks.CraftAvailCache[craftIndex] or numAvailable or 0

                -- Construct Text
                local countText = ""
                local displayNum = numAvailable or 0
                if customAvailable > 0 then
                    if customAvailable > displayNum then
                        countText = "[" .. customAvailable .. "/" .. displayNum .. "] "
                    else
                        countText = "[" .. customAvailable .. "] "
                    end
                elseif displayNum > 0 then
                    countText = "[" .. displayNum .. "] "
                end

                local nameText = craftName
                local levels = AtlasTW.DataIndex and AtlasTW.DataIndex.GetSkillLevels(craftName)
                if levels then
                    nameText = nameText .. " " .. levels
                end

                local texture = GetCraftIcon(craftIndex)
                if texture then
                    -- Add spacer for icon (7 spaces)
                    local spacer = "       "

                    -- Measure width of countText
                    craftText:SetText(countText)
                    local width = craftText:GetStringWidth()

                    craftText:SetText(countText .. spacer .. nameText)

                    icon:SetTexture(texture)
                    icon:ClearAllPoints()
                    icon:SetPoint("LEFT", craftText, "LEFT", width, 0)
                    icon:Show()
                else
                    craftText:SetText(countText .. nameText)
                end
            else
                -- Header
            end
        else
            -- Empty
        end
    end

    AtlasTW.ProfessionHooks._updatingCraft = nil
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

-- Hook Reagent Buttons for clicking
function AtlasTW.ProfessionHooks.HookReagentButtons(prefix)
    for i = 1, 8 do
        local btn = _G[prefix .. i]
        if btn and not btn.atlasHooked then
            btn.atlasHooked = true
            btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            local origOnClick = btn:GetScript("OnClick")
            btn:SetScript("OnClick", function()
                if origOnClick then origOnClick() end

                if not IsShiftKeyDown() and AtlasTW.Integrations and AtlasTW.Integrations.HasPfQuest() then
                    local nameStr = nil
                    if prefix == "TradeSkillReagent" then
                        local skillIndex = GetTradeSkillSelectionIndex()
                        if skillIndex > 0 then
                            nameStr = GetTradeSkillReagentInfo(skillIndex, this:GetID())
                        end
                    else
                        local craftIndex = GetCraftSelectionIndex()
                        if craftIndex > 0 then
                            nameStr = GetCraftReagentInfo(craftIndex, this:GetID())
                        end
                    end

                    if nameStr then
                        AtlasTW.Integrations.SearchPfQuest(nameStr)
                    end
                end
            end)
        end
    end
end

-- Initialize Hooks
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" then
        if arg1 == "Blizzard_TradeSkillUI" then
            hooksecurefunc("TradeSkillFrame_Update", AtlasTW.ProfessionHooks.OnTradeSkillUpdate)
            AtlasTW.ProfessionHooks.CreateAtlasButton(TradeSkillFrame)
            AtlasTW.ProfessionHooks.HookReagentButtons("TradeSkillReagent")
        elseif arg1 == "Blizzard_CraftUI" then
            hooksecurefunc("CraftFrame_Update", AtlasTW.ProfessionHooks.OnCraftUpdate)
            AtlasTW.ProfessionHooks.CreateAtlasButton(CraftFrame)
            AtlasTW.ProfessionHooks.HookReagentButtons("CraftReagent")
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Check if already loaded (e.g. if loaded before AtlasTW or reloaded)
        if IsAddOnLoaded("Blizzard_TradeSkillUI") then
            -- Only hook if not already hooked (we assume button existence implies hooked)
            if not _G["TradeSkillFrameAtlasButton"] then
                hooksecurefunc("TradeSkillFrame_Update", AtlasTW.ProfessionHooks.OnTradeSkillUpdate)
                AtlasTW.ProfessionHooks.HookReagentButtons("TradeSkillReagent")
            end
            -- Ensure button is created and updated (visibility checks inside)
            AtlasTW.ProfessionHooks.CreateAtlasButton(TradeSkillFrame)
        end

        if IsAddOnLoaded("Blizzard_CraftUI") then
            if not _G["CraftFrameAtlasButton"] then
                hooksecurefunc("CraftFrame_Update", AtlasTW.ProfessionHooks.OnCraftUpdate)
                AtlasTW.ProfessionHooks.HookReagentButtons("CraftReagent")
            end
            AtlasTW.ProfessionHooks.CreateAtlasButton(CraftFrame)
        end
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

-- Hook OnHide to prevent session termination during switch
-- This mimics Artisan behavior where the session is kept alive
local function HookOnHide(funcName)
    local original = _G[funcName]
    if original then
        _G[funcName] = function()
            if AtlasTW.ProfessionHooks.IsSwitching then
                -- Skip calling CloseTradeSkill/CloseCraft
                return
            end
            original()
        end
    end
end

HookOnHide("TradeSkillFrame_OnHide")
HookOnHide("CraftFrame_OnHide")
