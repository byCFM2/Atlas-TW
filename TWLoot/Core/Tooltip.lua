---
--- Tooltip.lua - Tooltip enhancement system for Atlas-TW
---
--- This module provides enhanced tooltip functionality with item source information
--- for Atlas-TW. It extends the default WoW tooltips to show additional details about
--- where items can be obtained, their drop rates, and related quest information.
---
--- Features:
--- • Enhanced item source information
--- • Drop rate and location display
--- • Quest reward integration
--- • Performance-optimized tooltip rendering
--- • Configurable tooltip options
---
--- @author idea by Otari98
--- @compatible World of Warcraft 1.12
---

-- ============================================================================
-- CONSTANTS AND CONFIGURATION
-- ============================================================================

local TIP_NAME = "AtlasTWLootTip"
local GREY = AtlasTW.Colors.GREY
local L = AtlasTW.Localization.UI
local MAX_ITEM_SEARCH_RANGE = 99999
local FASHION_COIN_ID = 51217

-- ============================================================================
-- GLOBAL FUNCTION CACHING (WOW 1.12 Performance Optimization)
-- ============================================================================

local strfind = string.find
local tonumber = tonumber
local tostring = tostring
local pairs = pairs
local ipairs = ipairs
local getglobal = getglobal
local type = type

-- WOW API Functions
local GetItemInfo = GetItemInfo
local CreateFrame = CreateFrame
local IsShiftKeyDown = IsShiftKeyDown
local IsControlKeyDown = IsControlKeyDown
local IsAddOnLoaded = IsAddOnLoaded
local GetLootRollItemLink = GetLootRollItemLink
local GetLootSlotLink = GetLootSlotLink
local GetMerchantItemLink = GetMerchantItemLink
local GetQuestLogItemLink = GetQuestLogItemLink
local GetQuestItemLink = GetQuestItemLink
local GetContainerItemLink = GetContainerItemLink
local GetInventoryItemLink = GetInventoryItemLink
local GetCraftReagentItemLink = GetCraftReagentItemLink
local GetCraftItemLink = GetCraftItemLink
local GetTradeSkillReagentItemLink = GetTradeSkillReagentItemLink
local GetTradeSkillItemLink = GetTradeSkillItemLink
local GetAuctionItemLink = GetAuctionItemLink
local GetAuctionSellItemInfo = GetAuctionSellItemInfo
local GetTradePlayerItemLink = GetTradePlayerItemLink
local GetTradeTargetItemLink = GetTradeTargetItemLink
local SetTooltipMoney = SetTooltipMoney
local GetInboxItem = GetInboxItem

-- ============================================================================
-- MODULE INITIALIZATION
-- ============================================================================

local AtlasTWLootTip = CreateFrame("Frame", TIP_NAME, GameTooltip)

-- ============================================================================
-- STATE MANAGEMENT
-- ============================================================================

local ModuleState = {
    insideHook = false,
    tooltipMoney = 0,
    lastItemID = nil,
    lastSourceStr = nil
}

-- ============================================================================
-- CACHING SYSTEMS
-- ============================================================================

-- Global index for fast lookups (O(1) instead of O(N))
local GlobalIndex = {
    itemID = {},      -- itemID -> sourceString
    spellID = {},     -- spellID -> sourceString
    nameToID = {},    -- itemName -> itemID
    isIndexed = false
}

-- Cache for items not found in Atlas-TW database
local NegativeCache = {}
local NegativeCacheSize = 0
local NEGATIVE_CACHE_LIMIT = 1000

-- ============================================================================
-- MONEY TOOLTIP HOOK
-- ============================================================================

local original_SetTooltipMoney = SetTooltipMoney
---
--- Overrides the default SetTooltipMoney function to capture money values
--- @param frame table - The tooltip frame to set money on
--- @param money number - The money amount to display
--- @return nil
--- @usage Called automatically by WoW tooltip system
---
function SetTooltipMoney(frame, money)
    if ModuleState.insideHook then
        ModuleState.tooltipMoney = money or 0
    else
        original_SetTooltipMoney(frame, money)
    end
end

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

---
--- Extracts item ID from an item link string
--- @param link string - The item link to parse
--- @return number|nil - The extracted item ID or nil if not found
--- @usage local itemID = ExtractItemID(itemLink)
---
local function ExtractItemID(link)
    if not link then return nil end
    local _, _, id = strfind(link, "item:(%d+)")
    return tonumber(id)
end

-- ============================================================================
-- ITEM SEARCH FUNCTIONS
-- ============================================================================


---
--- Recursively checks if an item ID exists in a loot page
--- @param data table - The loot page data (list of items/tables)
--- @param searchID number - The item ID to search for
--- @return boolean - True if found
---
local function IsItemInPage(data, searchID)
    if type(data) ~= "table" then return false end
    -- table.getn is used for compatibility with WoW 1.12
    for i = 1, table.getn(data) do
        local item = data[i]
        if type(item) == "table" then
            if item.id == searchID or item[1] == searchID then return true end
            if item.container and IsItemInPage(item.container, searchID) then
                return true
            end
        elseif item == searchID then
            return true
        end
    end
    return false
end

---
--- Searches for a page identifier in the MenuData tables to find a localized name
--- @param pageKey string The loot table key
--- @return string|nil Localized source name or nil
---
local function FindItemSourceInMenuData(pageKey)
    if not AtlasTW.MenuData then return nil end

    -- Helper to match pageKey with lootpage strings
    -- Handles both direct match and "AtlasTWLoot[PageKey]Menu" pattern
    local function isMatch(lootpage)
        if not lootpage or not pageKey then return false end
        if lootpage == pageKey then return true end
        local _, _, shortName = strfind(lootpage, "AtlasTWLoot(.+)Menu")
        if shortName == pageKey then return true end
        return false
    end

    local menuTablesToCheck = {
        AtlasTW.MenuData.WorldEvents,
        AtlasTW.MenuData.Factions,
        AtlasTW.MenuData.PVP,
        AtlasTW.MenuData.PVPSets,
        AtlasTW.MenuData.Sets,
        AtlasTW.MenuData.Alchemy,
        AtlasTW.MenuData.Smithing,
        AtlasTW.MenuData.Enchanting,
        AtlasTW.MenuData.Engineering,
        AtlasTW.MenuData.Herbalism,
        AtlasTW.MenuData.Leatherworking,
        AtlasTW.MenuData.Mining,
        AtlasTW.MenuData.Tailoring,
        AtlasTW.MenuData.Jewelcrafting,
        AtlasTW.MenuData.Cooking,
        AtlasTW.MenuData.FirstAid,
        AtlasTW.MenuData.Survival,
        AtlasTW.MenuData.Skinning,
        AtlasTW.MenuData.Fishing,
        AtlasTW.MenuData.Poisons,
    }

    for _, menuTable in pairs(menuTablesToCheck) do
        if type(menuTable) == "table" then
            for _, entry in pairs(menuTable) do
                if type(entry) == "table" and isMatch(entry.lootpage) and entry.name then
                    return entry.name
                end
            end
        end
    end

    return nil
end

local function BuildGlobalIndex()
    if GlobalIndex.isIndexed then return end

    -- 1. Index Quests (High Priority)
    if AtlasTW.Quest and AtlasTW.Quest.DataBase then
        for _, instanceData in pairs(AtlasTW.Quest.DataBase) do
            local instanceName = instanceData.Caption
            if type(instanceName) == "table" then instanceName = instanceName[1] end

            local function indexQuests(questList)
                if not questList then return end
                for _, quest in pairs(questList) do
                    if quest.Rewards then
                        for _, reward in pairs(quest.Rewards) do
                            local rID = type(reward) == "table" and reward.id or reward
                            if rID then
                                local questTitle = quest.Title or "?"
                                local source = (instanceName ~= "" and instanceName .. " " or "") .. L["Quest"] .. ": " .. questTitle
                                if not GlobalIndex.itemID[rID] then
                                    GlobalIndex.itemID[rID] = source
                                end
                            end
                        end
                    end
                end
            end
            indexQuests(instanceData.Alliance)
            indexQuests(instanceData.Horde)
        end
    end

    -- 2. Index Sets (Medium Priority - used for combining later)
    local itemToSetMap = {}
    if AtlasTW.MenuData and AtlasTW.MenuData.Sets then
        for _, setCat in ipairs(AtlasTW.MenuData.Sets) do
            if setCat.lootpage then
                local _, _, shortName = strfind(setCat.lootpage, "AtlasTWLoot(.+)Menu")
                local menuTable = AtlasTW.MenuData[shortName or setCat.lootpage]
                if not menuTable and shortName then
                     local _, _, baseName = strfind(shortName, "^(.+)Set$")
                     if baseName then menuTable = AtlasTW.MenuData[baseName] end
                end

                if menuTable then
                    for _, entry in pairs(menuTable) do
                        if entry.lootpage and AtlasTWLoot_Data[entry.lootpage] then
                            local lootData = AtlasTWLoot_Data[entry.lootpage]
                            -- Helper to populate itemToSetMap
                            local function mapItems(data)
                                if type(data) ~= "table" then return end
                                for i = 1, table.getn(data) do
                                    local item = data[i]
                                    if type(item) == "table" then
                                        local id = item.id or item[1]
                                        if id and not itemToSetMap[id] then
                                            itemToSetMap[id] = setCat.name
                                        end
                                        if item.container then mapItems(item.container) end
                                    elseif type(item) == "number" then
                                        if not itemToSetMap[item] then
                                            itemToSetMap[item] = setCat.name
                                        end
                                    end
                                end
                            end
                            mapItems(lootData)
                        end
                    end
                end
            end
        end
    end

    -- 3. Index Professions
    if AtlasTW.SpellDB and AtlasTW.MenuData then
        local profPages = {}
        local menuKeys = {"Alchemy", "Smithing", "Enchanting", "Engineering", "Leatherworking", "Mining", "Tailoring", "Jewelcrafting", "Cooking", "FirstAid", "Survival", "Crafting", "CraftedSet"}
        for _, key in ipairs(menuKeys) do
            local menu = AtlasTW.MenuData[key]
            if menu then
                for _, entry in ipairs(menu) do
                    if entry.lootpage and entry.name then
                        table.insert(profPages, { pageKey = entry.lootpage, name = entry.name })
                    end
                end
            end
        end

        local function indexProfItems(spellList)
            if not spellList then return end
            for spellID, data in pairs(spellList) do
                for _, profEntry in ipairs(profPages) do
                    local pageKey = profEntry.pageKey
                    local profName = profEntry.name
                    if AtlasTWLoot_Data[pageKey] and IsItemInPage(AtlasTWLoot_Data[pageKey], spellID) then
                        GlobalIndex.spellID[spellID] = profName
                        break
                    end
                end
                if data.item then GlobalIndex.itemID[data.item] = GlobalIndex.spellID[spellID] end
            end
        end
        indexProfItems(AtlasTW.SpellDB.enchants)
        indexProfItems(AtlasTW.SpellDB.craftspells)
    end

    -- 4. Index Loot Tables (Instances/Bosses)
    -- Modified to use safer iteration logic via centralized Utils
    if AtlasTW.LootUtils and AtlasTW.LootUtils.IterateAllLootItems then

        AtlasTW.LootUtils.IterateAllLootItems(function(idOrItem, pageKey, itemData)
            -- While iterating, update nameToID
            local itemID = idOrItem
            if type(itemData) == "table" and itemData.id then itemID = itemData.id end

            if GetItemInfo then
                local name = GetItemInfo(itemID)
                if name then GlobalIndex.nameToID[name] = itemID end
            end

            -- Filtering logic from Search.lua (adapted)
            -- If it looks like a spell/skill but not an explicit item, skip it for GlobalIndex
            -- checking if it's a spell-like entry
            local isExplicitItem = (type(itemData) == "table" and itemData.type and itemData.type == "item")
            local isSpellLike = false
            if type(itemData) == "table" and itemData.skill and not isExplicitItem then
                local sid = itemData.id
                if sid and AtlasTW and AtlasTW.SpellDB and ((AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[sid]) or (AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[sid])) then
                    isSpellLike = true
                end
            end

            if isSpellLike then return end

            -- Continue with Source naming logic
            local isCraft = false
            local craftPrefixes = {"Alchemy", "Smithing", "Smith", "Enchanting", "Engineering", "Leatherworking", "Tailoring", "Smelting", "Jewelcraft", "Cooking", "FirstAid", "Survival"}
            for _, prefix in ipairs(craftPrefixes) do
                if strfind(pageKey, "^" .. prefix) then isCraft = true break end
            end

            if not isCraft then
                local isBoss = false
                local source = AtlasTW.LootUtils.GetLootTableSource(pageKey)
                if source then
                    isBoss = true
                else
                    source = FindItemSourceInMenuData(pageKey)
                end
                source = source or pageKey

                -- Combine with Set information if available
                local setInfo = itemToSetMap[itemID]
                if setInfo then
                    if isBoss then
                        -- "Molten Core - Lucifron (T1 Set)"
                        source = source .. " (" .. setInfo .. ")"
                    else
                        -- If it's a world drop or generic category, prefer Set Name
                        if strfind(pageKey, "World") or source == pageKey then
                            source = setInfo
                        else
                            source = source .. " (" .. setInfo .. ")"
                        end
                    end
                end

                -- Final assignment (only if not already set by higher priority like Quest)
                if not GlobalIndex.itemID[itemID] then
                    GlobalIndex.itemID[itemID] = source
                end
            end
        end)

        GlobalIndex.isIndexed = true
    end
end

---
--- Checks if an item belongs to a Set Category in MenuData
--- @param itemID number
--- @return string|nil Localized Set Categpry Name (e.g. "Ruins of Ahn'Qiraj Sets")
---
local function GetItemSetCategory(itemID)
    if not AtlasTW.MenuData or not AtlasTW.MenuData.Sets then return nil end

    -- Helper to check a Menu Table (list of sub-pages)
    local function checkMenuTable(menuTable)
        if type(menuTable) ~= "table" then return false end
        for _, entry in pairs(menuTable) do
            if entry.lootpage and AtlasTWLoot_Data[entry.lootpage] then
                if IsItemInPage(AtlasTWLoot_Data[entry.lootpage], itemID) then
                    return true
                end
            end
        end
        return false
    end

    for _, setCat in ipairs(AtlasTW.MenuData.Sets) do
        if setCat.lootpage then
            -- Try to Map string "AtlasTWLootXMenu" to AtlasTW.MenuData.X
            local key = setCat.lootpage
            local menuTable = nil

            -- Regex extraction (WoW 1.12 compatible)
            local _, _, shortName = strfind(key, "AtlasTWLoot(.+)Menu")
            if shortName then
                menuTable = AtlasTW.MenuData[shortName] -- e.g. "AQ20Set"
                if not menuTable then
                    -- Try removing "Set" suffix (e.g. "PriestSet" -> "Priest")
                    local _, _, baseName = strfind(shortName, "^(.+)Set$")
                    if baseName then
                        menuTable = AtlasTW.MenuData[baseName]
                    end
                end
            end

            if menuTable and checkMenuTable(menuTable) then
                return setCat.name -- Localized name
            end
        end
    end
    return nil
end

local function FindItemSource(itemID)
    if not itemID then return nil end

    -- Check global index first
    BuildGlobalIndex()
    if GlobalIndex.itemID[itemID] then
        return GlobalIndex.itemID[itemID]
    end

    -- Support for Transmogrification (Custom IDs)
    -- If the ID isn't in our database, try looking up the item by name
    -- to see if it matches an existing item in our Atlas-TW index.
    local name = GetItemInfo(itemID)
    if name then
        local originalID = GlobalIndex.nameToID[name]
        if originalID and originalID ~= itemID then
            local source = GlobalIndex.itemID[originalID]
            if source then
                -- Cache the result for this specific custom ID to speed up future hovers
                GlobalIndex.itemID[itemID] = source
                return source
            end
        end
    end

    -- Check negative cache to avoid repeated failed lookups
    if NegativeCache[itemID] then return nil end

    -- For items not in Atlas database, they might be in sets
    local setCategory = GetItemSetCategory(itemID)
    if setCategory then
        GlobalIndex.itemID[itemID] = setCategory
        return setCategory
    end

    -- If still not found, cache as missing
    NegativeCache[itemID] = true
    NegativeCacheSize = NegativeCacheSize + 1
    if NegativeCacheSize > NEGATIVE_CACHE_LIMIT then
        NegativeCache = {}
        NegativeCacheSize = 0
    end
    return nil
end

---
--- Gets item ID by name with caching support
--- @param name string - The item name to search for
--- @return number|nil - The item ID or nil if not found
--- @usage local itemID = GetItemIDByName("Thunderfury")
---
local function GetItemIDByName(name)
    if not name then return nil end
    BuildGlobalIndex()

    local foundID = GlobalIndex.nameToID[name]
    if foundID then return foundID end

    -- If not in our index, we still avoid the 100k loop because it's too expensive.
    -- We can try to use GetItemInfo dynamically if we encounter this name often,
    -- but for now, we just return nil to protect performance.
    return nil
end

-- ============================================================================
-- SIMPLIFIED TOOLTIP ENHANCEMENT
-- ============================================================================

-- Simplified tooltip extension function
---
--- Extends tooltip with additional information (source and money)
--- @param tooltip table - The tooltip frame to extend
--- @return nil
--- @usage ExtendTooltip(GameTooltip)
---
local function ExtendTooltip(tooltip)
    -- Add source information if enabled
    if AtlasTWOptions and AtlasTWOptions.LootShowSource then
        local itemID = tonumber(tooltip.itemID)
        if itemID and itemID ~= FASHION_COIN_ID then
            -- Use caching to avoid repeated lookups
            if itemID ~= ModuleState.lastItemID then
                ModuleState.lastItemID = itemID
                ModuleState.lastSourceStr = nil

                local source = FindItemSource(itemID)
                if source then
                    ModuleState.lastSourceStr = GREY .. source .. "|r"
                end
            end

            -- Simply add source line at the end with text wrapping
            if ModuleState.lastSourceStr then
                tooltip:AddLine(ModuleState.lastSourceStr, nil, nil, nil, true)
                tooltip:Show()
            end
        end
    end

    -- Add money information if present
    if ModuleState.tooltipMoney > 0 then
        original_SetTooltipMoney(tooltip, ModuleState.tooltipMoney)
        tooltip:Show()
    end
end

-- ============================================================================
-- TOOLTIP HOOKING SYSTEM
-- ============================================================================

---
--- Creates a wrapper for tooltip methods to add custom functionality
--- @param tooltip table - The tooltip frame to wrap
--- @param methodName string - The method name to wrap
--- @param linkExtractor function - Function to extract item links
--- @return nil
--- @usage CreateTooltipWrapper(GameTooltip, "SetHyperlink", ExtractItemID)
---
local function CreateTooltipWrapper(tooltip, methodName, linkExtractor)
    local originalMethod = tooltip[methodName]

    tooltip[methodName] = function(self, arg1, arg2, arg3, arg4, arg5)
        ModuleState.insideHook = true
        ModuleState.tooltipMoney = 0
        -- Use pcall to guarantee insideHook reset even on error
        local ok, r1, r2, r3, r4, r5 = pcall(originalMethod, self, arg1, arg2, arg3, arg4, arg5)
        ModuleState.insideHook = false

        if not ok then
            -- Error occurred, but hook state is safely reset
            return
        end

        -- Extract item ID using provided function
        self.itemID = linkExtractor(arg1, arg2, arg3, arg4, arg5)
        ExtendTooltip(self)

        return r1, r2, r3, r4, r5
    end
end

-- Tooltip hook configuration table
local TooltipHooks = {
    {"SetLootRollItem", function(rollID) return ExtractItemID(GetLootRollItemLink(rollID)) end},
    {"SetLootItem", function(slot) return ExtractItemID(GetLootSlotLink(slot)) end},
    {"SetMerchantItem", function(merchantIndex) return ExtractItemID(GetMerchantItemLink(merchantIndex)) end},
    {"SetQuestLogItem", function(itemType, index) return ExtractItemID(GetQuestLogItemLink(itemType, index)) end},
    {"SetQuestItem", function(itemType, index) return ExtractItemID(GetQuestItemLink(itemType, index)) end},
    {"SetHyperlink", function(link) return ExtractItemID(link) end},
    {"SetBagItem", function(container, slot) return ExtractItemID(GetContainerItemLink(container, slot)) end},
    {"SetInboxItem", function(mailID, attachmentIndex) return GetItemIDByName(GetInboxItem(mailID)) end},
    {"SetInventoryItem", function(unit, slot) return ExtractItemID(GetInventoryItemLink(unit, slot)) end},
    {"SetCraftItem", function(skill, slot) return ExtractItemID(GetCraftReagentItemLink(skill, slot)) end},
    {"SetCraftSpell", function(slot) return ExtractItemID(GetCraftItemLink(slot)) end},
    {"SetTradeSkillItem", function(skillIndex, reagentIndex)
        if reagentIndex then
            return ExtractItemID(GetTradeSkillReagentItemLink(skillIndex, reagentIndex))
        else
            return ExtractItemID(GetTradeSkillItemLink(skillIndex))
        end
    end},
    {"SetAuctionItem", function(atype, index) return ExtractItemID(GetAuctionItemLink(atype, index)) end},
    {"SetAuctionSellItem", function() return GetItemIDByName(GetAuctionSellItemInfo()) end},
    {"SetTradePlayerItem", function(index) return ExtractItemID(GetTradePlayerItemLink(index)) end},
    {"SetTradeTargetItem", function(index) return ExtractItemID(GetTradeTargetItemLink(index)) end}
}

---
--- Hooks all tooltip methods to add custom functionality
--- @param tooltip table - The tooltip frame to hook
--- @return nil
--- @usage HookTooltip(GameTooltip)
---
local function HookTooltip(tooltip)
    -- Store original OnHide handler
    local originalOnHide = tooltip:GetScript("OnHide")

    -- Set new OnHide handler
    tooltip:SetScript("OnHide", function()
        if originalOnHide then originalOnHide() end
        this.itemID = nil
        ModuleState.tooltipMoney = 0
    end)

    -- Hook all methods from configuration table
    for _, hookData in ipairs(TooltipHooks) do
        local methodName, linkExtractor = hookData[1], hookData[2]
        CreateTooltipWrapper(tooltip, methodName, linkExtractor)
    end
end

-- ============================================================================
-- ITEM REFERENCE TOOLTIP HANDLING
-- ============================================================================

---
--- Hooks SetItemRef to handle item links in chat
--- @param link string - The item link
--- @param text string - The link text
--- @param button string - The mouse button used
--- @return nil
--- @usage Called automatically by WoW when clicking item links
---
local original_SetItemRef = SetItemRef
function SetItemRef(link, text, button)
    local startIndex, _, id = strfind(link or "", "item:(%d+)")
    ItemRefTooltip.itemID = tonumber(id)
    original_SetItemRef(link, text, button)

    if not IsShiftKeyDown() and not IsControlKeyDown() and startIndex then
        ExtendTooltip(ItemRefTooltip)
    end
end

-- Hook ItemRefTooltip OnHide
local original_ItemRefOnHide = ItemRefTooltip:GetScript("OnHide")
ItemRefTooltip:SetScript("OnHide", function()
    if original_ItemRefOnHide then original_ItemRefOnHide() end
    ItemRefTooltip.itemID = nil
end)

-- ============================================================================
-- ADDON INTEGRATION SYSTEM
-- ============================================================================

---
--- Dynamic addon/variable hooking system
--- @param addonName string - Name of the addon to wait for
--- @param hookFunction function - Function to call when addon is loaded
--- @return nil
--- @usage AtlasTWLootTip.HookAddonOrVariable("SomeAddon", function() end)
---
AtlasTWLootTip.HookAddonOrVariable = function(addonName, hookFunction)
    local lurkerFrame = CreateFrame("Frame")
    lurkerFrame.hookFunc = hookFunction
    lurkerFrame:RegisterEvent("ADDON_LOADED")
    lurkerFrame:RegisterEvent("VARIABLES_LOADED")
    lurkerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

    lurkerFrame:SetScript("OnEvent", function()
        if IsAddOnLoaded(addonName) or getglobal(addonName) then
            this:UnregisterAllEvents()
            this.hookFunc()
        end
    end)
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Hook main tooltips
HookTooltip(GameTooltip)

-- Build global index on startup to avoid hover delays
AtlasTWLootTip.HookAddonOrVariable("AtlasTW", function()
    BuildGlobalIndex()
end)