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
            -- Force close current window to prevent overlap and state confusion
            if TradeSkillFrame and TradeSkillFrame:IsVisible() then HideUIPanel(TradeSkillFrame) end
            if CraftFrame and CraftFrame:IsVisible() then HideUIPanel(CraftFrame) end

            CastSpellByName(this.spellName)
        end)
    end

    for i = table.getn(playerProfessions) + 1, table.getn(sideTabs) do
        sideTabs[i]:Hide()
    end
end

-- Hook for TradeSkillFrame
function AtlasTW.ProfessionHooks.OnTradeSkillUpdate()
    -- Only update if frame is visible to prevent stealing tabs
    if not TradeSkillFrame or not TradeSkillFrame:IsVisible() then return end

    AtlasTW.ProfessionHooks.UpdateSideTabs(TradeSkillFrame)

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

            if skillType ~= "header" then
                -- Construct Text
                local countText = ""
                if numAvailable > 0 then
                    countText = "[" .. numAvailable .. "] "
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
end

-- Hook for CraftFrame
function AtlasTW.ProfessionHooks.OnCraftUpdate()
    -- Only update if frame is visible to prevent stealing tabs
    if not CraftFrame or not CraftFrame:IsVisible() then return end

    AtlasTW.ProfessionHooks.UpdateSideTabs(CraftFrame)

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

        -- Create icon if needed
        if not craftButton.atlasIcon then
            craftButton.atlasIcon = craftButton:CreateTexture(nil, "ARTWORK")
            craftButton.atlasIcon:SetWidth(12)
            craftButton.atlasIcon:SetHeight(12)
        end
        local icon = craftButton.atlasIcon
        icon:Hide()

        if craftIndex <= numCrafts then
            local craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(craftIndex)

            if craftType ~= "header" then
                -- Construct Text
                local countText = ""
                if numAvailable > 0 then
                    countText = "[" .. numAvailable .. "] "
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
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" then
        if arg1 == "Blizzard_TradeSkillUI" then
            hooksecurefunc("TradeSkillFrame_Update", AtlasTW.ProfessionHooks.OnTradeSkillUpdate)
            AtlasTW.ProfessionHooks.CreateAtlasButton(TradeSkillFrame)
        elseif arg1 == "Blizzard_CraftUI" then
            hooksecurefunc("CraftFrame_Update", AtlasTW.ProfessionHooks.OnCraftUpdate)
            AtlasTW.ProfessionHooks.CreateAtlasButton(CraftFrame)
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Check if already loaded (e.g. if loaded before AtlasTW or reloaded)
        if IsAddOnLoaded("Blizzard_TradeSkillUI") then
            -- Only hook if not already hooked (we assume button existence implies hooked)
            if not _G["TradeSkillFrameAtlasButton"] then
                hooksecurefunc("TradeSkillFrame_Update", AtlasTW.ProfessionHooks.OnTradeSkillUpdate)
            end
            -- Ensure button is created and updated (visibility checks inside)
            AtlasTW.ProfessionHooks.CreateAtlasButton(TradeSkillFrame)
        end

        if IsAddOnLoaded("Blizzard_CraftUI") then
            if not _G["CraftFrameAtlasButton"] then
                hooksecurefunc("CraftFrame_Update", AtlasTW.ProfessionHooks.OnCraftUpdate)
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
