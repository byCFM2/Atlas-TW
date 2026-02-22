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
local FASHION_COIN_ID = 51217

-- ============================================================================
-- GLOBAL FUNCTION CACHING (WOW 1.12 Performance Optimization)
-- ============================================================================

local strfind = string.find
local tonumber = tonumber
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

-- Relies on centralized AtlasTW.DataIndex module (Core/DataIndex.lua)
-- No local indexing logic is needed here.


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

-- IsItemInPage and FindItemSourceInMenuData have been moved to AtlasTW.LootUtils
-- as IsItemInLootPage and GetLootPageDisplayName respectively.

local function FindItemSource(itemID)
    if not AtlasTW.DataIndex or not AtlasTW.DataIndex.SourceCache then return nil end

    -- Use centralized index
    local source = AtlasTW.DataIndex.SourceCache[itemID]

    -- Trigger indexing if not ready
    if not AtlasTW.DataIndex.isIndexed and not AtlasTW.DataIndex.isIndexing then
        AtlasTW.DataIndex.BuildIndex(true)
    end

    -- Handle false (cached as missing)
    if source == false then return nil end
    if source then return source end

    -- Fallback for Transmogrification (Custom IDs)
    local name = GetItemInfo(itemID)
    if name and AtlasTW.DataIndex.NameToID then
        local originalID = AtlasTW.DataIndex.NameToID[name]
        if originalID and originalID ~= itemID then
            local originalSource = AtlasTW.DataIndex.SourceCache[originalID]
            if originalSource then
                AtlasTW.DataIndex.SourceCache[itemID] = originalSource
                return originalSource
            end
        end
    end

    return nil
end

local function GetItemIDByName(name)
    if not AtlasTW.DataIndex then return nil end
    return AtlasTW.DataIndex.NameToID and AtlasTW.DataIndex.NameToID[name]
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

    -- Add recipe usage information
    local itemID = tonumber(tooltip.itemID)
    if itemID and AtlasTW.ReagentData and AtlasTW.ReagentData.GetRecipes and AtlasTWOptions and (AtlasTWOptions.ReagentRows or 0) > 0 then
        local recipes = AtlasTW.ReagentData.GetRecipes(itemID)
        if recipes and next(recipes) then
            -- Filter recipes based on professions option
            local filteredRecipes = {}
            for _, recipe in ipairs(recipes) do
                local key = recipe.professionKey or "Other"
                local isEnabled = true
                if AtlasTWOptions.ReagentProfessions and AtlasTWOptions.ReagentProfessions[key] == false then
                    isEnabled = false
                end

                if isEnabled then
                    table.insert(filteredRecipes, recipe)
                end
            end

            if table.getn(filteredRecipes) > 0 then
                local maxRows = AtlasTWOptions.ReagentRows or 20
                local count = 0
                local lastProfession = nil

                for _, recipe in ipairs(filteredRecipes) do
                    -- Check profession filter
                    -- We need to check if the profession is enabled.
                    -- Since we only have the localized name, we might have issues if languages differ.
                    -- Ideally ReagentData should provide the key.
                    -- Let's assume for now we skip filtering if key is missing, or rely on English match if playing in English.

                    -- Check row limit
                    if count >= maxRows then
                        tooltip:AddLine(string.format(L["... %d more"], (table.getn(filteredRecipes) - count)), 0.5, 0.5,
                            0.5)
                        break
                    end

                    -- Grouping by profession
                    local currentProfession = recipe.profession or L["Other"]
                    if currentProfession ~= lastProfession then
                        tooltip:AddLine(currentProfession, 0, 1, 0) -- Green Header
                        lastProfession = currentProfession
                    end

                    local name = recipe.name
                    if not name and recipe.itemID then
                        name = GetItemInfo(recipe.itemID)
                        if name then
                            recipe.name = name -- Cache for future use
                        elseif AtlasTW.LootCache and AtlasTW.LootCache.ForceCacheItem then
                            AtlasTW.LootCache.ForceCacheItem(recipe.itemID)
                        end
                    end
                    name = name or string.format(L["Recipe #%d"], recipe.spellID)

                    -- Determine colors
                    local r, g, b = 1, 0.2, 0.2 -- Default Red (Cannot learn/No profession)

                    local professionSkill = AtlasTW.ReagentData.GetPlayerProfessionSkill(recipe.profession)

                    -- Gray out if skill is significantly higher (likely known/trivial)
                    -- 40 is a common threshold for recipes turning gray
                    if professionSkill > 0 and recipe.skill then
                        if professionSkill >= (recipe.skill + 40) then
                            r, g, b = 0.5, 0.5, 0.5 -- Gray
                        elseif professionSkill >= recipe.skill then
                            r, g, b = 0, 1, 0       -- Green
                        end
                    end

                    local rightText = ""
                    if recipe.skill and recipe.skill > 0 then
                        rightText = "(" .. recipe.skill .. ")"
                    end

                    tooltip:AddDoubleLine("-" .. name, rightText, r, g, b, r, g, b)
                    count = count + 1
                end
                tooltip:Show()
            end
        end
    end

    -- Add money information if present
    if ModuleState.tooltipMoney > 0 then
        original_SetTooltipMoney(tooltip, ModuleState.tooltipMoney)
        tooltip:Show()
    end

    -- Universal enhancements (Icon and ItemID)
    if AtlasTW.TooltipExtras then
        local itemID = tonumber(tooltip.itemID)
        if itemID then
            -- ONLY show icon for ItemRefTooltip (chat) as requested
            local isItemRef = (tooltip:GetName() == "ItemRefTooltip")
            AtlasTW.TooltipExtras.Extend(tooltip, itemID, isItemRef)
        end
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
    if not originalMethod then return end

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

---
--- Creates a wrapper for tooltip methods that clear or reset content
--- @param tooltip table - The tooltip frame to wrap
--- @param methodName string - The method name to wrap
--- @return nil
---
local function CreateTooltipClearWrapper(tooltip, methodName)
    local originalMethod = tooltip[methodName]
    if not originalMethod then return end

    tooltip[methodName] = function(self, arg1, arg2, arg3, arg4, arg5)
        -- Clear item state
        self.itemID = nil
        ModuleState.tooltipMoney = 0

        -- Hide icon ONLY if this is the tooltip that was cleared
        -- and only if AtlasTW.TooltipExtras is present
        if AtlasTW.TooltipExtras and AtlasTW.TooltipExtras.HideIcon then
            if AtlasTWTooltipIcon:GetParent() == self then
                AtlasTW.TooltipExtras.HideIcon()
            end
        end

        return originalMethod(self, arg1, arg2, arg3, arg4, arg5)
    end
end

-- Tooltip hook configuration table
local TooltipHooks = {
    { "SetLootRollItem",  function(rollID) return ExtractItemID(GetLootRollItemLink(rollID)) end },
    { "SetLootItem",      function(slot) return ExtractItemID(GetLootSlotLink(slot)) end },
    { "SetMerchantItem",  function(merchantIndex) return ExtractItemID(GetMerchantItemLink(merchantIndex)) end },
    { "SetQuestLogItem",  function(itemType, index) return ExtractItemID(GetQuestLogItemLink(itemType, index)) end },
    { "SetQuestItem",     function(itemType, index) return ExtractItemID(GetQuestItemLink(itemType, index)) end },
    { "SetHyperlink",     function(link) return ExtractItemID(link) end },
    { "SetBagItem",       function(container, slot) return ExtractItemID(GetContainerItemLink(container, slot)) end },
    { "SetInboxItem",     function(mailID, attachmentIndex) return GetItemIDByName(GetInboxItem(mailID)) end },
    { "SetInventoryItem", function(unit, slot) return ExtractItemID(GetInventoryItemLink(unit, slot)) end },
    { "SetCraftItem",     function(skill, slot) return ExtractItemID(GetCraftReagentItemLink(skill, slot)) end },
    { "SetCraftSpell",    function(slot) return ExtractItemID(GetCraftItemLink(slot)) end },
    { "SetTradeSkillItem", function(skillIndex, reagentIndex)
        if reagentIndex then
            return ExtractItemID(GetTradeSkillReagentItemLink(skillIndex, reagentIndex))
        else
            return ExtractItemID(GetTradeSkillItemLink(skillIndex))
        end
    end },
    { "SetAuctionItem",     function(atype, index) return ExtractItemID(GetAuctionItemLink(atype, index)) end },
    { "SetAuctionSellItem", function() return GetItemIDByName(GetAuctionSellItemInfo()) end },
    { "SetTradePlayerItem", function(index) return ExtractItemID(GetTradePlayerItemLink(index)) end },
    { "SetTradeTargetItem", function(index) return ExtractItemID(GetTradeTargetItemLink(index)) end }
}

-- Methods that clear or reset tooltip content (non-item methods)
local ClearHooks = {
    "ClearLines",
    "SetUnit",
    "SetUnitCharacter",
    "SetAction",
    "SetSpell",
    "SetPetAction",
    "SetText",
    "SetOwner"
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
        if AtlasTW.TooltipExtras and AtlasTW.TooltipExtras.HideIcon then
            if AtlasTWTooltipIcon:GetParent() == this then
                AtlasTW.TooltipExtras.HideIcon()
            end
        end
    end)

    -- Hook all item methods from configuration table
    for _, hookData in ipairs(TooltipHooks) do
        local methodName, linkExtractor = hookData[1], hookData[2]
        CreateTooltipWrapper(tooltip, methodName, linkExtractor)
    end

    -- Hook all clear methods
    for _, methodName in ipairs(ClearHooks) do
        CreateTooltipClearWrapper(tooltip, methodName)
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

    -- Clear state first
    ItemRefTooltip.itemID = nil
    if AtlasTW.TooltipExtras and AtlasTW.TooltipExtras.HideIcon then
        AtlasTW.TooltipExtras.HideIcon()
    end

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
    if AtlasTW.TooltipExtras and AtlasTW.TooltipExtras.HideIcon then
        AtlasTW.TooltipExtras.HideIcon()
    end
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

-- Build global index when Atlas window is first shown to avoid loading lag
AtlasTWLootTip.HookAddonOrVariable("AtlasTW", function()
    if AtlasTW and AtlasTW.OnShow then
        local original_OnShow = AtlasTW.OnShow
        AtlasTW.OnShow = function()
            if original_OnShow then original_OnShow() end
            if AtlasTW.DataIndex and AtlasTW.DataIndex.BuildIndex then
                AtlasTW.DataIndex.BuildIndex(true)
            end
        end
    else
        -- Fallback if AtlasTW not fully initialized yet
        if AtlasTW.DataIndex and AtlasTW.DataIndex.BuildIndex then
            AtlasTW.DataIndex.BuildIndex(true)
        end
    end
end)
