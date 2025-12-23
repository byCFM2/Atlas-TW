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
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Localization.UI
local LMD = AtlasTW.Localization.MapData

local LS = AtlasTW.Localization.Spells
local LC = AtlasTW.Localization.Classes

local Colors = AtlasTW.Colors

AtlasTW.ItemDB = {}

AtlasTW.ItemDB.SLOT_KEYWORDS = {
    [L["Head"]] = 0, [L["Shoulder"]] = 0, [L["Projectile"]] = 0,
    [L["Chest"]] = 0,[L["Wrist"]] = 0, [L["Hands"]] = 0, [L["Relic"]] = 0,
    [L["Legs"]] = 0, [L["Feet"]] = 0, [L["Main Hand"]] = 0, [L["One-Hand"]] = 0,
    [L["Off Hand"]] = 0, [L["Waist"]] = 0, [L["Two-Hand"]] = 0, [L["Ranged"]] = 0,
}
AtlasTW.ItemDB.SLOT2_KEYWORDS = {
    [LS["Cloth"]] = 0, [LS["Leather"]] = 0, [LS["Mail"]] = 0,[LS["Plate"]] = 0,[L["Bullet"]] = 0,[L["Shirt"]] = 0,
    [L["Mace"]] = 0, [L["Axe"]] = 0, [L["Dagger"]] = 0, [L["Sword"]] = 0, [L["Totem"]] = 0, [L["Tabard"]] = 0,
    [L["Held In Off-hand"]] = 0, [L["Shield"]] = 0, [L["Finger"]] = 0, [L["Neck"]] = 0, [L["16 Slot Ammo Pouch"]] = 0,
    [L["Trinket"]] = 0, [L["BackEquip"]] = 0, [L["Bow"]] = 0, [L["Crossbow"]] = 0,[L["Arrow"]] = 0,
    [L["Gun"]] = 0, [L["Polearm"]] = 0, [L["Libram"]] = 0, [L["Staff"]] = 0, [L["Idol"]] = 0,
    [L["Thrown"]] = 0, [L["Wand"]] = 0, [L["Fist Weapon"]] = 0,[L["Fishing Pole"]] = 0, [L["16 Slot Quiver"]] = 0,
}
AtlasTW.ItemDB.CommonItems = {
    [LS["Cloth"]] = true, [L["Fishing Pole"]] = true, [L["Tabard"]] = true,
    [L["Bullet"]] = true, [L["Arrow"]] = true, [L["Ammo Pouch"]] = true,
    [L["Quiver"]] = true, [L["Shirt"]] = true, [L["Held In Off-hand"]] = true,
    [L["Neck"]] = true, [L["Finger"]] = true, [L["Trinket"]] = true, [L["BackEquip"]] = true,
}
AtlasTW.ItemDB.ClassItems = {
    [LC["Druid"]] = {LS["Leather"],L["Dagger"],L["Mace"],L["Fist Weapon"],L["Polearm"],L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Idol"]},
    [LC["Hunter"]] = {LS["Leather"],LS["Mail"],L["Axe"],L["Dagger"],L["Sword"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],
        L["Polearm"],L["Staff"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Off Hand"],L["Thrown"]},
    [LC["Mage"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [LC["Paladin"]] = {LS["Leather"],LS["Mail"],LS["Plate"],L["Sword"],L["Mace"],L["Axe"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],L["Polearm"],L["Libram"],L["Shield"]},
    [LC["Priest"]] = {L["Dagger"],L["Staff"],L["Mace"],L["Wand"]},
    [LC["Rogue"]] = {LS["Leather"],L["Dagger"],L["Sword"],L["Mace"],L["Off Hand"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"]},
    [LC["Shaman"]] = {LS["Leather"],LS["Mail"],L["Dagger"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Totem"],L["Shield"]},
    [LC["Warlock"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [LC["Warrior"]] = {LS["Leather"],LS["Mail"],LS["Plate"],L["Dagger"],L["Off Hand"],L["Sword"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"],L["Polearm"],
        L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],L["Shield"]},
}

---
-- Get colored text based on player class and level restrictions
-- @function getColoredText
-- @param text string - The text to color
-- @param typeText string - The type of text ("slot", "slot2", "class", "requires")
-- @return string - Colored text with appropriate color codes
-- @usage local coloredText = getColoredText("Plate", "slot")
---
-- State caching for performance
local PlayerAllowedLookup = nil
local ColoredTextCache = {}
local ParsedTooltipCache = {}
local ParsedTooltipCacheSize = 0
local ParsedSuitabilityCache = {}
local MAX_CACHE_SIZE = 1000

-- Timer system optimization: reusing a single frame
local activeTimers = {}
local timerFrame = nil

-- Static references for optimization
local tooltipElementsCache = {}
local sharedTooltip = nil

-- Copy global keywords to local for much faster table lookups
local SLOT_KEYWORDS = AtlasTW.ItemDB.SLOT_KEYWORDS
local SLOT2_KEYWORDS = AtlasTW.ItemDB.SLOT2_KEYWORDS
local COMMON_ITEMS = AtlasTW.ItemDB.CommonItems or {}
-- Pre-cached lowercase strings for very fast keyword matching
local L_MOUNT = string.lower(L["a mount"])
local L_COMPANION = string.lower(L["a companion"])
local L_BAG = string.lower(L["Slot Bag"])
local L_GLYPH = string.lower(L["new Glyph"])

-- Pre-calculate lengths for fast prefix checking
local L_CLASSES = L["Classes"]
local L_CLASSES_LEN = string.len(L_CLASSES)
local L_REQUIRES = L["Requires"]
local L_REQUIRES_LEN = string.len(L_REQUIRES)
local function InitializeClassLookup()
    if PlayerAllowedLookup then return end
    PlayerAllowedLookup = {}
    local playerClass = AtlasTW.PlayerClass
    local classItems = AtlasTW.ItemDB.ClassItems[playerClass]
    if classItems then
        for _, item in ipairs(classItems) do
            PlayerAllowedLookup[item] = true
        end
    end
end

---
-- Get colored text based on player class and level restrictions
-- @function getColoredText
-- @param text string - The text to color
-- @param typeText string - The type of text ("slot", "slot2", "class", "requires")
-- @return string - Colored text with appropriate color codes
---
local function getColoredText(text, typeText)
    -- Color constants
    local COLOR_GREEN = Colors.GREEN
    local COLOR_RED = Colors.RED
    local COLOR_END = "|r"
    local playerClass = AtlasTW.PlayerClass
    local playerLevel = UnitLevel("player")

    -- Handle text types with specific cache keys if they depend on state
    local cacheKey = text .. "||" .. typeText
    if typeText == "requires" then
        cacheKey = cacheKey .. "||" .. playerLevel
    end

    if ColoredTextCache[cacheKey] then
        return ColoredTextCache[cacheKey]
    end

    InitializeClassLookup()

    -- Default to green
    local colorCode = COLOR_GREEN

    -- Handle different text types
    if typeText == "slot" then
        local canWear = false
        -- Loop check for common items available to everyone (handles Cloth, Shirt, etc.)
        for item in pairs(COMMON_ITEMS) do
            if string.find(text, item, 1, true) then
                canWear = true
                break
            end
        end

        if not canWear then
            -- Check for Dual Wield requirement if it's a weapon item in Off Hand slot
            local isOffHand = string.find(text, L["Off Hand"], 1, true)
            local isShield = string.find(text, L["Shield"], 1, true)

            if isOffHand and not isShield and not PlayerAllowedLookup[L["Off Hand"]] then
                -- Player doesn't have Dual Wield skill
                canWear = false
            elseif PlayerAllowedLookup[text] then
                canWear = true
            else
                -- Fallback for partially matching strings or special combinations
                -- e.g. "Two-Hand Mace" vs "Mace"
                local isTwoHand = string.find(text, L["Two-Hand"], 1, true)
                for item in pairs(PlayerAllowedLookup) do
                    if isTwoHand then
                        -- For two-handed weapons, strict matching for ambiguous types (Sword, Mace, Axe)
                        if item == text then
                            canWear = true
                            break
                        elseif string.find(text, item, 1, true) then
                            -- If "item" is not an ambiguous type, we allow substring match (e.g. "Staff" in "Two-Hand Staff")
                            if item ~= L["Sword"] and item ~= L["Mace"] and item ~= L["Axe"] then
                                canWear = true
                                break
                            end
                        end
                    else
                        -- For one-handed, we allow finding the weapon type within the slot string
                        if string.find(text, item, 1, true) then
                            canWear = true
                            break
                        end
                    end
                end
            end
        end
        if not canWear then
            colorCode = COLOR_RED
        end
    elseif typeText == "slot2" then
        local canWear = false
        -- Loop check for common items available to everyone (handles Cloth, Shirt, etc.)
        for item in pairs(COMMON_ITEMS) do
            if string.find(text, item, 1, true) then
                canWear = true
                break
            end
        end

        if not canWear then
            if PlayerAllowedLookup[text] then
                canWear = true
            else
                local isTwoHand = string.find(text, L["Two-Hand"], 1, true)
                for item in pairs(PlayerAllowedLookup) do
                    if isTwoHand then
                        if item == text then
                            canWear = true
                            break
                        elseif string.find(text, item, 1, true) then
                            if item ~= L["Sword"] and item ~= L["Mace"] and item ~= L["Axe"] then
                                canWear = true
                                break
                            end
                        end
                    else
                        if string.find(text, item, 1, true) then
                            canWear = true
                            break
                        end
                    end
                end
            end
        end
        if not canWear then
            colorCode = COLOR_RED
        end
    elseif typeText == "class" then
        local classText = string.gsub(text, L["Classes"]..": ", "")
        if not string.find(classText, playerClass, 1, true) then
            colorCode = COLOR_RED
        end
        local res = colorCode..classText..COLOR_END
        ColoredTextCache[cacheKey] = res
        return res
    elseif typeText == "requires" then
        local levelText = string.gsub(text, L["Requires"].." ", "")
        local levelString = string.gsub(levelText, L["Level"].." ", "") or "0"
        local level = tonumber(levelString) or 0
        if playerLevel < level then
            colorCode = COLOR_RED
        end
        local res = colorCode..levelText..COLOR_END
        ColoredTextCache[cacheKey] = res
        return res
    end

    local res = colorCode..text..COLOR_END
    ColoredTextCache[cacheKey] = res
    return res
end

---
-- Clean up tooltip cache when it exceeds maximum size
-- @function CleanupTooltipCache
---
local function CleanupTooltipCache()
    if ParsedTooltipCacheSize > MAX_CACHE_SIZE then
        ParsedTooltipCache = {}
        ParsedSuitabilityCache = {}
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
---
function AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext)
    if not itemID or itemID == 0 then
        return extratext or ""
    end
    -- Create a suitability entry if it doesn't exist
    if not ParsedSuitabilityCache[itemID] then
        ParsedSuitabilityCache[itemID] = { class = true, level = true }
    end
    local suitability = ParsedSuitabilityCache[itemID]
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

    local tooltipName = "AtlasTWLootHiddenTooltip"

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

    -- Local aliases for extreme performance in loops
    local strfind = string.find
    local strlower = string.lower
    local strsub = string.sub
    local tinsert = table.insert

    -- Optimized parsing
    local parseSuccess = pcall(function()
        for i = 1, 12 do
            local line = tooltipElementsCache.leftElements[i]
            local text = line and line:GetText()

            if text and text ~= "" then
                local line2 = tooltipElementsCache.rightElements[i]
                local text2 = line2 and line2:GetText()

                -- Fast check for standalone exact matches first (Quest items)
                if text == L["Quest Item"] or text == L["This Item Begins a Quest"] then
                    tinsert(info, text)
                else
                    -- Only compute lowercase if exact match fails
                    local lowerText = strlower(text)

                    -- Mount check (often terminates further parsing for this item)
                    if strfind(lowerText, " "..L_MOUNT.." ", 1, true) then
                        tinsert(info, L["Mount"])
                        break
                    elseif strfind(lowerText, " "..L_COMPANION.." ", 1, true) then
                        tinsert(info, L["Pet"])
                    elseif strfind(lowerText, L_BAG, 1, true) then
                        tinsert(info, L["Bag"])
                    elseif strfind(lowerText, L_GLYPH, 1, true) then
                        tinsert(info, L["Glyph"])
                    end
                end

                -- Optimized slot check
                if SLOT_KEYWORDS[text] then
                    local colorStr
                    if text2 and SLOT2_KEYWORDS[text2] then
                        colorStr = getColoredText(text.." "..text2, "slot")
                    else
                        colorStr = getColoredText(text, "slot")
                    end
                    if colorStr and strfind(colorStr, Colors.RED, 1, true) then suitability.class = false end
                    tinsert(info, colorStr)
                elseif SLOT2_KEYWORDS[text] then
                    if text == L["Finger"] then
                        tinsert(info, Colors.GREEN..L["Ring"].."|r")
                    else
                        local colorStr = getColoredText(text, "slot2")
                        if colorStr and strfind(colorStr, Colors.RED, 1, true) then suitability.class = false end
                        tinsert(info, colorStr)
                    end
                -- Classes (Prefix check is faster than find)
                elseif strsub(text, 1, L_CLASSES_LEN) == L_CLASSES then
                    local colorStr = getColoredText(text, "class")
                    if colorStr and strfind(colorStr, Colors.RED, 1, true) then suitability.class = false end
                    tinsert(info, colorStr)
                -- Requirements (Prefix check is faster than find)
                elseif strsub(text, 1, L_REQUIRES_LEN) == L_REQUIRES then
                    local colorStr = getColoredText(text, "requires")
                    if colorStr and strfind(colorStr, Colors.RED, 1, true) then suitability.level = false end
                    tinsert(info, colorStr)
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
-- Check if an item is suitable based on filter mode
-- @function AtlasTW.ItemDB.IsItemSuitable
-- @param itemID number - The item ID to check
-- @param mode number - Filter mode (0: All, 1: Class, 2: Available)
-- @return boolean - True if item matches filter criteria
---
function AtlasTW.ItemDB.IsItemSuitable(itemID, mode)
    if not mode or mode == 0 then return true end
    if not itemID or itemID == 0 then return true end

    -- Ensure suitability data is populated
    if not ParsedSuitabilityCache[itemID] then
        AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID)
    end

    local suitability = ParsedSuitabilityCache[itemID]
    if not suitability then return true end

    if mode == 1 then
        return suitability.class
    elseif mode == 2 then
        return suitability.class and suitability.level
    end

    return true
end

---
-- Start a timer with specified delay and callback function
-- @function StartTimer
-- @param delaySeconds number - Delay in seconds before executing callback
-- @param callbackFunc function - Function to execute after delay
-- @usage StartTimer(2.0, function() PrintA("Timer finished") end)
---
local function OnTimerUpdate()
    local now = GetTime()
    local i = 1
    while i <= table.getn(activeTimers) do
        local timer = activeTimers[i]
        if now >= timer.time then
            table.remove(activeTimers, i)
            if timer.callback then
                timer.callback()
            end
            -- Don't increment i, as we removed an element
        else
            i = i + 1
        end
    end
    if table.getn(activeTimers) == 0 then
        timerFrame:Hide()
    end
end

---
-- Start a timer with specified delay and callback function
-- @function StartTimer
-- @param delaySeconds number - Delay in seconds before executing callback
-- @param callbackFunc function - Function to execute after delay
---
function StartTimer(delaySeconds, callbackFunc)
    if not timerFrame then
        timerFrame = CreateFrame("Frame")
        timerFrame:SetScript("OnUpdate", OnTimerUpdate)
    end

    table.insert(activeTimers, {
        time = GetTime() + delaySeconds,
        callback = callbackFunc
    })
    timerFrame:Show()
end

---
-- Force cache an item with delay between attempts
-- @function AtlasTWLoot_ForceCacheItemWithDelay
-- @param itemID number - The item ID to cache
-- @param delayBetweenAttempts number - Delay between cache attempts (default: 0.1)
-- @param maxAttempts number - Maximum number of attempts (default: 10)
-- @return boolean - Success status of caching operation
-- @usage AtlasTWLoot_ForceCacheItemWithDelay(12345, 0.2, 5)
---
function AtlasTWLoot_ForceCacheItemWithDelay(itemID, delayBetweenAttempts, maxAttempts)
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
-- Create items from a loot table with default values applied
-- @function AtlasTW.CreateItemsFromLootTable
-- @param bossData table - Boss data containing loot table and defaults
-- @return table - Array of created items
-- @usage local items = AtlasTW.CreateItemsFromLootTable(bossData)
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
---
function AtlasTW.ItemDB.CreateSeparator(text, icon, quality)
    return {
        name = text or "",
        texture = icon and ("Interface\\Icons\\"..icon) or "Interface\\Icons\\INV_Box_01",
        quality = quality or 5,
    }
end