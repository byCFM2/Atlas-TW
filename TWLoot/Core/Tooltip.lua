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

local ADDON_NAME = "AtlasTWLootTip"
local GREY_COLOR = "|cff999999"
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

local AtlasTWLootTip = CreateFrame("Frame", ADDON_NAME, GameTooltip)

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
--- Searches for an item ID within a data table structure
--- @param data table - The data table to search in
--- @param itemID number - The item ID to search for
--- @return boolean - True if item is found, false otherwise
--- @usage local found = FindItemInData(lootTable, 12345)
---
local function FindItemInData(data, itemID)
    if type(data) ~= "table" or not itemID then
        return false
    end

    for _, item in pairs(data) do
        if item then
            -- Direct ID match (number or table with ID)
            if item == itemID or
               (type(item) == "table" and (item[1] == itemID or item.id == itemID)) then
                return true
            end

            -- Container search
            if type(item) == "table" and item.container then
                if FindItemInData(item.container, itemID) then
                    return true
                end
            end
        end
    end

    return false
end

---
--- Gets display name for a source object
--- @param source table - The source object to get name from
--- @param fallback string - Fallback name if no name found
--- @return string - The display name for the source
--- @usage local name = GetSourceDisplayName(sourceObj, "Unknown")
---
local function GetSourceDisplayName(source, fallback)
    if source.name then
        return source.name
    elseif source.loot then
        return source.loot
    elseif source.id then
        return tostring(source.id)
    else
        return fallback or "?"
    end
end

---
--- Universal source search function for finding items in source lists
--- @param list table - The list of sources to search in
--- @param label string - Default label for sources without names
--- @param instanceName string - Name of the instance
--- @param itemID number - The item ID to search for
--- @return string|nil - Formatted source string or nil if not found
--- @usage local source = SearchInSourceList(repList, "Reputation", "Molten Core", 12345)
---
local function SearchInSourceList(list, label, instanceName, itemID)
    if type(list) ~= "table" then
        return nil
    end

    for _, source in pairs(list) do
        if source then
            local items = source.items or source.loot
            local found = false

            if type(items) == "string" then
                -- Reference to AtlasTWLoot_Data
                local data = AtlasTWLoot_Data and AtlasTWLoot_Data[items]
                found = FindItemInData(data, itemID)
            else
                -- Direct items list
                found = FindItemInData(items, itemID)
            end

            if found then
                local displayName = GetSourceDisplayName(source, label)
                return instanceName.." - "..tostring(displayName)
            end
        end
    end

    return nil
end

-- ============================================================================
-- ITEM SOURCE LOOKUP
-- ============================================================================

---
--- Finds item source within a specific instance
--- @param instanceKey string - The instance key identifier
--- @param instance table - The instance data table
--- @param itemID number - The item ID to search for
--- @return string|nil - Formatted source string or nil if not found
--- @usage local source = FindItemSourceInInstance("MC", instanceData, 12345)
---
local function FindItemSourceInInstance(instanceKey, instance, itemID)
    if type(instance) ~= "table" then
        return nil
    end

    local instanceName = instance.Name or instanceKey

    -- Search in bosses
    if instance.Bosses then
        for _, boss in ipairs(instance.Bosses) do
            local bossName = GetSourceDisplayName(boss, "?")
            local items = boss.items or boss.loot
            local found = false

            if type(items) == "string" then
                -- Reference to AtlasTWLoot_Data
                local data = AtlasTWLoot_Data and AtlasTWLoot_Data[items]
                found = FindItemInData(data, itemID)
            else
                -- Direct items list
                found = FindItemInData(items, itemID)
            end

            if found then
                return instanceName.." - "..tostring(bossName)
            end
        end
    end

    -- Search in other sources using unified function
    local result = SearchInSourceList(instance.Reputation, "Reputation", instanceName, itemID)
    if result then return result end

    result = SearchInSourceList(instance.Keys, "Keys", instanceName, itemID)
    if result then return result end

    return nil
end

---
--- Finds item source in AtlasTWLoot_Data tables
--- @param itemID number - The item ID to search for
--- @return string|nil - Formatted source string or nil if not found
--- @usage local source = FindItemSourceInAtlasTWLootData(12345)
---
local function FindItemSourceInAtlasTWLootData(itemID)
    if not AtlasTWLoot_Data then
        return nil
    end

    for dataSource, sourceData in pairs(AtlasTWLoot_Data) do
        if type(sourceData) == "table" then
            for dataID, data in pairs(sourceData) do
                if type(data) == "table" then
                    for _, record in pairs(data) do
                        if type(record) == "table" and type(record[1]) == "number" and record[1] == itemID then
                            -- Try to find zone name in AtlasTW.InstanceData
                            local zoneName = nil
                            if AtlasTW and AtlasTW.InstanceData then
                                for instanceKey, instanceData in pairs(AtlasTW.InstanceData) do
                                    if instanceData.Bosses then
                                        for _, bossData in ipairs(instanceData.Bosses) do
                                            if bossData.id == dataID or bossData.name == dataID then
                                                zoneName = instanceData.Name
                                                break
                                            end
                                        end
                                    end
                                    if zoneName then break end
                                end
                            end

                            if zoneName then
                                return tostring(zoneName).." - "..tostring(dataID)
                            else
                                return tostring(dataSource).." - "..tostring(dataID)
                            end
                        end
                    end
                end
            end
        end
    end

    return nil
end

---
--- Main item source finder with caching support
--- @param itemID number - The item ID to find source for
--- @return string|nil - Formatted source string or nil if not found
--- @usage local source = FindItemSource(12345)
---
local function FindItemSource(itemID)
    if not itemID then
        return nil
    end

    -- Check cache first
    local cached = SourceCache[itemID]
    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    -- Search in AtlasTW instance data
    if AtlasTW and AtlasTW.InstanceData then
        for instanceKey, instance in pairs(AtlasTW.InstanceData) do
            local source = FindItemSourceInInstance(instanceKey, instance, itemID)
            if source then
                SourceCache[itemID] = source
                return source
            end
        end
    end

    -- Search in AtlasTWLoot_Data
    local source = FindItemSourceInAtlasTWLootData(itemID)
    if source then
        SourceCache[itemID] = source
        return source
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
                    ModuleState.lastSourceStr = GREY_COLOR .. source .. "|r"
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
--HookTooltip(ItemRefTooltip)
--[[ 
AtlasTWLootTip.HookAddonOrVariable("AtlasTWLootTooltip", function()
    HookTooltip(AtlasTWLootTooltip)
end) ]]