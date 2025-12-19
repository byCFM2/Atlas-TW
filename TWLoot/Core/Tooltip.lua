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
--- @author Original by Otari98
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

-- Cache for item name to ID lookups
local NameToIDCache = {}

-- Cache for item source lookups
local SourceCache = {}

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
--- Finds item source in professions
--- @param itemID number - The item ID to search for
--- @return string|nil - Formatted source string or nil if not found
---
--- Recursively checks if an item ID exists in a loot page
--- @param data table - The loot page data (list of items/tables)
--- @param searchID number - The item ID to search for
--- @return boolean - True if found
---
local function IsItemInPage(data, searchID)
    if type(data) ~= "table" then return false end
    for _, item in pairs(data) do
        if type(item) == "table" then
            -- Check item ID
            if item.id == searchID then return true end
            -- Check first element if it's an ID (legacy format)
            if item[1] == searchID then return true end

            -- Recursive check for containers
            if item.container and type(item.container) == "table" then
                if IsItemInPage(item.container, searchID) then
                    return true
                end
            end
        elseif type(item) == "number" then
            if item == searchID then return true end
        end
    end
    return false
end

local function FindItemSourceInProfessions(itemID)
    if not itemID or not AtlasTW.SpellDB or not AtlasTW.SpellDB.craftspells or not AtlasTW.SpellDB.enchants then return nil end

    local foundSpellID, foundSpellName = nil, nil

    -- 1. Check Enchants (Reverse lookup for formulas/scrolls)
    if not foundSpellID and AtlasTW.SpellDB.enchants then
        for spellID, data in pairs(AtlasTW.SpellDB.enchants) do
            if data.item == itemID then
                foundSpellID = spellID
                foundSpellName = data.name
                if not foundSpellName then
                    -- For enchants, name might be the enchant name itself
                     foundSpellName = data.name
                     if not foundSpellName and GetItemInfo then
                        foundSpellName = GetItemInfo(data.item)
                     end
                end
                break
            end
        end
    end

    -- 2. Check Craft Spells (Reverse lookup)
    if AtlasTW.SpellDB.craftspells then
        for spellID, data in pairs(AtlasTW.SpellDB.craftspells) do
            if data.item == itemID then
                foundSpellID = spellID
                foundSpellName = data.name
                if not foundSpellName then
                    foundSpellName = GetItemInfo(data.item)
                end
                break
            end
        end
    end

    if foundSpellID then
        -- Find profession name via strictly prioritized search
        if AtlasTW.MenuData then
            -- Helper to search in a specific menu table (linear scan = priority based on index)
            local function findInMenu(menuTable)
                if type(menuTable) ~= "table" then return nil end
                -- Iterate in ipairs to respect order (Apprentice -> Journeyman -> ... -> Misc)
                for _, entry in ipairs(menuTable) do
                    if type(entry) == "table" and entry.lootpage then
                         local pageData = AtlasTWLoot_Data[entry.lootpage]
                         if pageData and IsItemInPage(pageData, foundSpellID) then
                            return entry.name
                         end
                    end
                end
                return nil
            end

            -- List of menu keys to check (most likely first)
            -- Ordering of keys is less important than ordering WITHIN keys, but still good to keep main professions first
            local menuKeysToCheck = {
                "Alchemy", "Smithing", "Enchanting", "Engineering",
                "Leatherworking", "Mining", "Tailoring", "Jewelcrafting",
                "Cooking", "FirstAid", "Survival", "Crafting", "CraftedSet"
            }

            for _, key in ipairs(menuKeysToCheck) do
                local name = findInMenu(AtlasTW.MenuData[key])
                if name then
                    return name
                end
            end
        else
            -- Fallback to old "any page" locator if MenuData missing (unlikely)
            local pageKey = AtlasTW.LootUtils.IterateAllLootItems(function(id, key)
                if id == foundSpellID then return key end
            end)
            if pageKey then return "Crafting: " .. tostring(pageKey) end
        end

        return "Crafted: " .. (foundSpellName or "Unknown")
    end

    return nil
end




---
--- Main item source finder with caching support
--- @param itemID number - The item ID to find source for
--- @return string|nil - Formatted source string or nil if not found
--- @usage local source = FindItemSource(12345)
---
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

---
--- Checks if an item determines from a Quest
--- @param itemID number
--- @return string|nil Quest Source string
---
local function FindItemQuestSource(itemID)
    if not AtlasTW.Quest.DataBase then return nil end

    for _, instanceData in pairs(AtlasTW.Quest.DataBase) do
        -- Helper to check faction tables
        local function checkFaction(questList)
            if not questList then return nil end
            for _, quest in pairs(questList) do
                if quest.Rewards then
                    for _, reward in pairs(quest.Rewards) do
                        if type(reward) == "table" and reward.id == itemID then
                            local instanceName = instanceData.Caption
                            if instanceName and type(instanceName) == "table" then
                                instanceName = instanceName[1]
                            end

                            local questTitle = quest.Title or "?"
                            if instanceName ~= "" then
                                return instanceName .. " " .. L["Quest"] .. ": " .. questTitle
                            else
                                return L["Quest"] .. ": " .. questTitle
                            end
                        end
                    end
                end
            end
            return nil
        end

        local source = checkFaction(instanceData.Alliance) or checkFaction(instanceData.Horde)
        if source then return source end
    end
    return nil
end

---
--- Searches for a page identifier in the MenuData tables to find a localized name
--- @param pageKey string The loot table key
--- @return string|nil Localized source name or nil
---
local function FindItemSourceInMenuData(pageKey)
    if not AtlasTW.MenuData then return nil end

    -- List of menu tables to check (Order matters slightly for performance, but keys should be unique)
    local menuTablesToCheck = {
        AtlasTW.MenuData.WorldEvents,
        AtlasTW.MenuData.Factions,
        AtlasTW.MenuData.PVP,
        AtlasTW.MenuData.PVPSets,
        AtlasTW.MenuData.Sets,
        -- Profession Menus
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
        -- Add others if needed
    }

    for _, menuTable in pairs(menuTablesToCheck) do
        if type(menuTable) == "table" then
            for _, entry in pairs(menuTable) do
                if type(entry) == "table" and entry.lootpage == pageKey and entry.name then
                    -- Extract pure name if it contains color codes or extra info (optional)
                    -- For now, return the name as is (formatting is usually stripped by tooltip anyway or acceptable)
                    return entry.name
                end
            end
        end
    end

    return nil
end

local function FindItemSource(itemID)
    if not itemID then return nil end
    -- Check cache first
    local cached = SourceCache[itemID]
    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    local finalSource = nil

    -- 1. Check Quests (Top Priority)
    -- Returns "Instance Quest: Title"
    local questSource = FindItemQuestSource(itemID)
    if questSource then
        finalSource = questSource
    end

    -- 2. Check Crafted/Enchants
    if not finalSource then
        finalSource = FindItemSourceInProfessions(itemID)
    end

    -- 3. Check Sets (Prepare info)
    local setCategory = GetItemSetCategory(itemID)

    -- Helper to check if a page key belongs to crafting pages (where IDs are SpellIDs, not ItemIDs)
    local function IsCraftPage(pageKey)
        if not pageKey or type(pageKey) ~= "string" then return false end
        -- Known craft page prefixes where ID entries are SpellIDs
        local craftPrefixes = {
            "Alchemy", "Smithing", "Smith", "Enchanting", "Engineering", "Leatherworking",
            "Tailoring", "Mining", "Jewelcraft", "Cooking", "FirstAid", "Survival",
            "Armorsmith", "Weaponsmith", "Axesmith", "Hammersmith", "Swordsmith",
            "Dragonscale", "Elemental", "Tribal", "Gnomish", "Goblin"
        }
        for _, prefix in ipairs(craftPrefixes) do
            if strfind(pageKey, "^" .. prefix) then
                return true
            end
        end
        return false
    end

    -- 4. Check Loot Tables (Instance/Boss/Generic)
    if not finalSource then
        local pageKey = AtlasTW.LootUtils.IterateAllLootItems(function(id, key)
            -- Skip craft pages where 'id' is a SpellID, not an ItemID
            -- This prevents false matches like SpellID 16987 matching ItemID 16987
            if IsCraftPage(key) then return nil end
            if id == itemID then return key end
        end)

        if pageKey then
             -- Try to get source from InstanceData (Bosses, etc.)
             local instanceSource = AtlasTW.LootUtils.GetLootTableSource(pageKey)
             if instanceSource then
                 finalSource = instanceSource
             else
                 -- Try to get localized name from MenuData (World Events, Factions, etc.)
                 local menuSource = FindItemSourceInMenuData(pageKey)
                 if menuSource then
                     finalSource = menuSource
                 else
                     -- Fallback to key ONLY if not belonging to a Set
                     if not setCategory then
                        finalSource = tostring(pageKey)
                     end
                 end
             end
        end
    end

    -- 5. Append Set info if we have a source, or use Set as source if we don't
    if setCategory then
        if finalSource then
            if finalSource ~= setCategory then
                finalSource = finalSource .. " (" .. setCategory .. ")"
            end
        else
            finalSource = setCategory
        end
    end

    if finalSource then
        SourceCache[itemID] = finalSource
        return finalSource
    end

    -- Cache negative result
    SourceCache[itemID] = false
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

    -- Check cache first
    local cached = NameToIDCache[name]
    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    -- Search through item IDs
    local foundID = nil
    for itemID = 1, MAX_ITEM_SEARCH_RANGE do
        local itemName = GetItemInfo(itemID)
        if itemName and itemName == name then
            foundID = itemID
            break
        end
    end

    -- Cache result (false for not found, itemID for found)
    NameToIDCache[name] = foundID or false
    return foundID
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
        local result1, result2, result3 = originalMethod(self, arg1, arg2, arg3, arg4, arg5)
        ModuleState.insideHook = false

        -- Extract item ID using provided function
        self.itemID = linkExtractor(arg1, arg2, arg3, arg4, arg5)
        ExtendTooltip(self)

        return result1, result2, result3
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