---
--- ItemDB.lua - Central item database and tooltip parsing system
---
--- This module provides comprehensive item database functionality for Atlas-TW,
--- including item information parsing, tooltip analysis, class-based item filtering,
--- and caching mechanisms for optimal performance.
---
--- Features:
--- • Item tooltip parsing and information extraction
--- • Class-based equipment compatibility checking
--- • Color-coded item display based on player restrictions
--- • Intelligent caching system for parsed tooltip data
--- • Item creation utilities for loot tables
--- • Equipment slot and type classification
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
AtlasTW.ItemDB = {}

AtlasTW.ItemDB.SLOT_KEYWORDS = {
    [L["Head"]] = 0, [L["Shoulder"]] = 0, [L["Tabard"]] = 0,[L["Projectile"]] = 0,
    [L["Chest"]] = 0,[L["Wrist"]] = 0, [L["Hands"]] = 0, [L["Relic"]] = 0,
    [L["Legs"]] = 0, [L["Feet"]] = 0, [L["Main Hand"]] = 0, [L["One-Hand"]] = 0,
    [L["Off Hand"]] = 0, [L["Waist"]] = 0, [L["Two-Hand"]] = 0, [L["Ranged"]] = 0,
}
AtlasTW.ItemDB.SLOT2_KEYWORDS = {
    [L["Cloth"]] = 0,  [L["Leather"]] = 0, [L["Mail"]] = 0,[L["Plate"]] = 0,[L["Bullet"]] = 0,[L["Shirt"]] = 0,
    [L["Mace"]] = 0, [L["Axe"]] = 0, [L["Dagger"]] = 0, [L["Sword"]] = 0, [L["Totem"]] = 0,
    [L["Held In Off-hand"]] = 0, [L["Shield"]] = 0, [L["Finger"]] = 0, [L["Neck"]] = 0, [L["16 Slot Ammo Pouch"]] = 0,
    [L["Trinket"]] = 0, [L["Back"]] = 0, [L["Bow"]] = 0, [L["Crossbow"]] = 0,[L["Arrow"]] = 0,
    [L["Gun"]] = 0, [L["Polearm"]] = 0, [L["Libram"]] = 0, [L["Staff"]] = 0, [L["Idol"]] = 0,
    [L["Thrown"]] = 0, [L["Wand"]] = 0, [L["Fist Weapon"]] = 0,[L["Fishing Pole"]] = 0, [L["16 Slot Quiver"]] = 0,
}
AtlasTW.ItemDB.ClassItems = {
    [L["Druid"]] = {L["Leather"],L["Dagger"],L["Mace"],L["Fist Weapon"],L["Polearm"],L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Idol"]},
    [L["Hunter"]] = {L["Leather"],L["Mail"],L["Axe"],L["Dagger"],L["Sword"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],
        L["Polearm"],L["Staff"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Off Hand"],L["Thrown"]},
    [L["Mage"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [L["Paladin"]] = {L["Leather"],L["Mail"],L["Plate"],L["Sword"],L["Mace"],L["Axe"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],L["Polearm"],L["Libram"]},
    [L["Priest"]] = {L["Dagger"],L["Staff"],L["Mace"],L["Wand"]},
    [L["Rogue"]] = {L["Leather"],L["Dagger"],L["Sword"],L["Mace"],L["Off Hand"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"]},
    [L["Shaman"]] = {L["Leather"],L["Mail"],L["Dagger"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Totem"]},
    [L["Warlock"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [L["Warrior"]] = {L["Leather"],L["Mail"],L["Plate"],L["Dagger"],L["Off Hand"],L["Sword"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"],L["Polearm"],
        L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"]},
}

---
-- Get colored text based on player class and level restrictions
-- @function getColoredText
-- @param text string - The text to color
-- @param typeText string - The type of text ("slot", "slot2", "class", "requires")
-- @return string - Colored text with appropriate color codes
-- @usage local coloredText = getColoredText("Plate", "slot")
-- @version 1.0
---
local function getColoredText(text, typeText)
    -- Color constants
    local COLOR_GREEN = "|cff00ff00"
    local COLOR_RED = "|cffff0000"
    local COLOR_END = "|r"
    local playerClass = UnitClass("player")
    local playerLevel = UnitLevel("player")

    -- Default to green
    local colorCode = COLOR_GREEN

    -- Handle different text types
    if typeText == "slot" then
        local canWear = string.find(text, L["Cloth"]) or string.find(text, L["Fishing Pole"])
            or string.find(text, L["Tabard"]) or string.find(text, L["Bullet"]) or string.find(text, L["Arrow"])
            or string.find(text, L["Ammo Pouch"]) or string.find(text, L["Quiver"])
        if not canWear then
            local classItems = AtlasTW.ItemDB.ClassItems[playerClass]
            for _, item in pairs(classItems) do
                if (string.find(text, L["Two-Hand"]) and item == text) or string.find(text, item) then
                    canWear = true
                    break
                end
            end
        end
        if not canWear then
            colorCode = COLOR_RED
        end
    elseif typeText == "slot2" then
        local canWear = not (text == L["Wand"] or text == L["Gun"] or text == L["Bow"] or text == L["Crossbow"]
            or text == L["Thrown"])
        if not canWear then
            local classItems = AtlasTW.ItemDB.ClassItems[playerClass]
            for _, item in pairs(classItems) do
                if string.find(text, item) then
                    canWear = true
                    break
                end
            end
        end
        if not canWear then
            colorCode = COLOR_RED
        end
    elseif typeText == "class" then
        local classText = string.gsub(text, L["Classes"]..": ", "")
        if not string.find(classText, playerClass) then
            colorCode = COLOR_RED
        end
        return colorCode..classText..COLOR_END
    elseif typeText == "requires" then
        local levelText = string.gsub(text, L["Requires"].." ", "")
        local level = tonumber(string.gsub(levelText, L["Level"].." ", "") or 0) or 0
        if playerLevel < level then
            colorCode = COLOR_RED
        end
        return colorCode..levelText..COLOR_END
    end
    return colorCode..text..COLOR_END
end

-- Cache for parsed tooltip results
local ParsedTooltipCache = {}
local ParsedTooltipCacheSize = 0
local MAX_CACHE_SIZE = 200

-- Static references for optimization
local tooltipElementsCache = {}
local sharedTooltip = nil

---
-- Clean up tooltip cache when it exceeds maximum size
-- @function CleanupTooltipCache
-- @usage CleanupTooltipCache()
-- @version 1.0
---
local function CleanupTooltipCache()
    if ParsedTooltipCacheSize > MAX_CACHE_SIZE then
        ParsedTooltipCache = {}
        ParsedTooltipCacheSize = 0
    end
end

---
-- Parse item tooltip to extract item information
-- @function AtlasTW.ItemDB.ParseTooltipForItemInfo
-- @param itemID number - The item ID to parse
-- @param extratext string - Additional text to include
-- @return string - Parsed item information with color coding
-- @usage local info = AtlasTW.ItemDB.ParseTooltipForItemInfo(12345, "Epic Item")
-- @version 1.0
---
function AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext)
    if not itemID or itemID == 0 then
        return extratext or ""
    end

    -- Ensure the item is cached
    if not GetItemInfo(itemID) then
        return extratext or ""
    end

    -- Create a cache key
    local cacheKey = itemID .. "_" .. (extratext or "")

    -- Check cache results
    if ParsedTooltipCache[cacheKey] then
        return ParsedTooltipCache[cacheKey]
    end

    CleanupTooltipCache()

    local tooltipName = "AtlasLootHiddenTooltip"

    -- Lazy-initialize the shared tooltip
    if not sharedTooltip then
        sharedTooltip = CreateFrame("GameTooltip", tooltipName, UIParent, "GameTooltipTemplate")
        if not sharedTooltip then
            return extratext or ""
        end
        sharedTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    end

    local tooltip = sharedTooltip

    -- Fast clear without protection (optimization)
    tooltip:Hide()
    tooltip:ClearLines()

    -- Fast hyperlink setup
    local success = pcall(function()
        tooltip:SetOwner(UIParent, "ANCHOR_NONE")
        tooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
    end)

    if not success then
        return extratext or ""
    end

    -- Check the first line
    local firstLine = _G[tooltipName .. "TextLeft1"]
    if not firstLine or not firstLine:GetText() or firstLine:GetText() == "" then
        return extratext or ""
    end

    local info = {}
    if extratext and extratext ~= "" then
        table.insert(info, extratext)
    end

    -- Cache UI elements on first access only
    if not tooltipElementsCache.initialized then
        tooltipElementsCache.leftElements = {}
        tooltipElementsCache.rightElements = {}
        for i = 1, 12 do
            tooltipElementsCache.leftElements[i] = _G[tooltipName .. "TextLeft" .. i]
            tooltipElementsCache.rightElements[i] = _G[tooltipName .. "TextRight" .. i]
        end
        tooltipElementsCache.initialized = true
    end

    -- Optimized parsing
    local parseSuccess = pcall(function()
        local text, text2

        for i = 1, 12 do
            local line = tooltipElementsCache.leftElements[i]
            local line2 = tooltipElementsCache.rightElements[i]

            if line then
                text = line:GetText()
                if text then
                    text2 = line2 and line2:GetText() or nil

                    -- Fast keyword checks (avoid extra string.find calls)
                    local lowerText = string.lower(text)

                    -- Quest item
                    if string.find(text, L["Quest Item"]) then
                        table.insert(info, text)
                    -- Mount
                    elseif string.find(lowerText, string.lower(" "..L["Mount"].." ")) then
                        table.insert(info, L["Mount"])
                        break
                    -- Glyph
                    elseif string.find(lowerText, string.lower(L["Glyph"])) then
                        table.insert(info, L["Glyph"])
                    -- Pet (companion)
                    elseif string.find(lowerText, string.lower(" "..L["Companion"].." ")) then
                        table.insert(info, L["Pet"])
                    -- Starts a quest
                    elseif string.find(text, L["This Item Begins a Quest"]) then
                        table.insert(info, text)
                    end

                    -- Optimized slot check
                    if AtlasTW.ItemDB.SLOT_KEYWORDS[text] then
                        if text2 and AtlasTW.ItemDB.SLOT2_KEYWORDS[text2] then
                            table.insert(info, getColoredText(text.." "..text2, "slot"))
                        else
                            table.insert(info, getColoredText(text, "slot"))
                        end
                    elseif AtlasTW.ItemDB.SLOT2_KEYWORDS[text] then
                        if text == L["Finger"] then
                            table.insert(info, "|cff00ff00"..L["Ring"].."|r")
                        else
                            table.insert(info, getColoredText(text, "slot2"))
                        end
                    -- Classes
                    elseif string.find(text, L["Classes"]) then
                        table.insert(info, getColoredText(text, "class"))
                    -- Requirements
                    elseif string.find(text, L["Requires"]) then
                        table.insert(info, getColoredText(text, "requires"))
                    end
                end
            end
        end
    end)

    -- Fast clear
    tooltip:Hide()
    tooltip:ClearLines()

    local result = extratext or ""
    if parseSuccess and table.getn(info) > 0 then
        result = table.concat(info, ", ")
    end

    -- Save to cache
    ParsedTooltipCache[cacheKey] = result
    ParsedTooltipCacheSize = ParsedTooltipCacheSize + 1

    return result
end

---
-- Start a timer with specified delay and callback function
-- @function StartTimer
-- @param delaySeconds number - Delay in seconds before executing callback
-- @param callbackFunc function - Function to execute after delay
-- @usage StartTimer(2.0, function() print("Timer finished") end)
-- @version 1.0
---
function StartTimer(delaySeconds, callbackFunc)
    -- Create a unique frame for each timer
    local timerFrame = CreateFrame("Frame")
    local startTime = GetTime()

    local function OnTimerUpdate()
        if GetTime() - startTime >= delaySeconds then
            timerFrame:Hide()
            timerFrame:SetScript("OnUpdate", nil)
            if callbackFunc then
                callbackFunc()
            end
        end
    end

    timerFrame:SetScript("OnUpdate", OnTimerUpdate)
    timerFrame:Show()
end

---
-- Force cache an item with delay between attempts
-- @function AtlasLoot_ForceCacheItemWithDelay
-- @param itemID number - The item ID to cache
-- @param delayBetweenAttempts number - Delay between cache attempts (default: 0.1)
-- @param maxAttempts number - Maximum number of attempts (default: 10)
-- @return boolean - Success status of caching operation
-- @usage AtlasLoot_ForceCacheItemWithDelay(12345, 0.2, 5)
-- @version 1.0
---
function AtlasLoot_ForceCacheItemWithDelay(itemID, delayBetweenAttempts, maxAttempts)
    if not itemID or itemID == 0 then
        return false
    end
    maxAttempts = maxAttempts or 10
    delayBetweenAttempts = delayBetweenAttempts or 0.1
    local attempts = 0
    local function tryCache()
        if GetItemInfo(itemID) then
            return true
        end
        GameTooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
        attempts = attempts + 1
        if attempts < maxAttempts then
            -- Schedule next attempt after a delay
            StartTimer(delayBetweenAttempts, tryCache)
        else
            return false
        end
    end
    tryCache()
end
---
-- Force cache an item with multiple attempts
-- @function AtlasLoot_ForceCacheItem
-- @param itemID number - The item ID to cache
-- @param maxAttempts number - Maximum number of attempts (default: 3)
-- @return boolean - Success status of caching operation
-- @usage AtlasLoot_ForceCacheItem(12345, 5)
-- @version 1.0
---
function AtlasLoot_ForceCacheItem(itemID, maxAttempts)
    if not itemID or itemID == 0 then
        return false
    end
    maxAttempts = maxAttempts or 3
    local attempts = 0
    local function tryCache()
        if GetItemInfo(itemID) then
            return true
        end
        GameTooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
        attempts = attempts + 1
        if attempts < maxAttempts then
            -- Start next attempt
            tryCache()
        else
            return false
        end
    end
    tryCache()
end
---
-- Cache an item by link or ID
-- @function AtlasLoot_CacheItem
-- @param linkOrID number|string - Item ID or item link to cache
-- @return boolean - Success status of caching operation
-- @usage AtlasLoot_CacheItem(12345) or AtlasLoot_CacheItem("item:12345:0:0:0")
-- @version 1.0
---
function AtlasLoot_CacheItem(linkOrID)
    if not linkOrID or linkOrID == 0 then
        return false
    end
    if tonumber(linkOrID) then
        if GetItemInfo(linkOrID) then
            return true
        else
            local item = "item:" .. linkOrID .. ":0:0:0"
            local _, _, itemLink = string.find(item, "(item:%d+:%d+:%d+:%d+)")
            linkOrID = itemLink
        end
    else
        if type(linkOrID) ~= "string" then
            return false
        end
        if string.find(linkOrID, "|", 1, true) then
            local _, _, itemLink = string.find(linkOrID, "(item:%d+:%d+:%d+:%d+)")
            linkOrID = itemLink
            if GetItemInfo(AtlasLoot_IDFromLink(linkOrID)) then
                return true
            end
        end
    end
    GameTooltip:SetHyperlink(linkOrID)
end

---
-- Create items from a loot table with default values applied
-- @function AtlasTW.CreateItemsFromLootTable
-- @param bossData table - Boss data containing loot table and defaults
-- @return table - Array of created items
-- @usage local items = AtlasTW.CreateItemsFromLootTable(bossData)
-- @version 1.0
---
function AtlasTW.CreateItemsFromLootTable(bossData)
    if not bossData.loot then return end
    local items = {}
    local defaults = bossData.defaults or {}
    for _, itemData in ipairs(bossData.loot) do
        -- Apply default values
        for key, value in pairs(defaults) do
            if itemData[key] == nil then
                itemData[key] = value
            end
        end
        table.insert(items, AtlasTW.ItemDB.CreateItem(itemData))
    end
    return items
end

---
-- Create a new item from data
-- @function AtlasTW.ItemDB.CreateItem
-- @param data table - Item data containing id, name, and other properties
-- @return table|nil - Created item object or nil if invalid data
-- @usage local item = AtlasTW.ItemDB.CreateItem({id = 12345, name = "Epic Sword"})
-- @version 1.0
---
function AtlasTW.ItemDB.CreateItem(data)
    -- Validate required fields
    if not data.id and not data.name then return nil end
    -- Set default values
    local item = {
        id = data.id,
        name = data.name,
        disc = data.disc,
        dropRate = data.dropRate,
        container = data.container,
        quantity = data.quantity,
        skill = data.skill,
    }
    return item
end

---
-- Create a separator or header item for loot tables
-- @function AtlasTW.ItemDB.CreateSeparator
-- @param text string - Text for the separator (default: "")
-- @param icon string - Icon name for the separator (default: "INV_Box_01")
-- @param quality number - Quality level for the separator (default: 5)
-- @return table - Separator item object
-- @usage local separator = AtlasTW.ItemDB.CreateSeparator("Boss Loot", "INV_Crown_01", 4)
-- @version 1.0
---
function AtlasTW.ItemDB.CreateSeparator(text, icon, quality)
    return {
        name = text or "",
        texture = icon and ("Interface\\Icons\\"..icon) or "Interface\\Icons\\INV_Box_01",
        quality = quality or 5,
    }
end