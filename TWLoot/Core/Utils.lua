---
-- Utils.lua - Common string and link utilities for Atlas-TW Loot
-- Provides helper functions for text formatting and WoW item link parsing
-- Features:
-- 1) Strip WoW formatting codes from text
-- 2) Truncate text safely with ellipsis
-- 3) Extract item ID from WoW item link
-- @compatible World of Warcraft 1.12

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.LootUtils = AtlasTW.LootUtils or {}
local L = AtlasTW.Localization.UI
local RED = AtlasTW.Colors.RED
local WHITE = AtlasTW.Colors.WHITE

-- Timer system
AtlasTW.Timer = {}
local activeTimers = {}
local timerFrame = nil

local function OnTimerUpdate()
    local now = GetTime()
    local i = 1
    while i <= table.getn(activeTimers) do
        local timer = activeTimers[i]
        if now >= timer.time then
            table.remove(activeTimers, i)
            if timer.callback then
                pcall(timer.callback) -- Protected call needed for callbacks
            end
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
-- @function AtlasTW.Timer.Start
-- @param delaySeconds number - Delay in seconds before executing callback
-- @param callbackFunc function - Function to execute after delay
-- @usage AtlasTW.Timer.Start(2.0, function() PrintA("Timer finished") end)
---
function AtlasTW.Timer.Start(delaySeconds, callbackFunc)
    if not timerFrame then
        timerFrame = CreateFrame("Frame", "AtlasTWTimerFrame")
        timerFrame:SetScript("OnUpdate", OnTimerUpdate)
    end

    table.insert(activeTimers, {
        time = GetTime() + delaySeconds,
        callback = callbackFunc
    })
    timerFrame:Show()
end

-- Compatibility wrapper for modules expecting global StartTimer
function StartTimer(delay, callback)
    AtlasTW.Timer.Start(delay, callback)
end

---
-- @module AtlasTW.LootUtils
-- @description Common string and link utilities for Atlas-TW Loot
---
function AtlasTW.LootUtils.GetChatLink(id)
	local itemName, itemLink, itemQuality = GetItemInfo(tonumber(id))
	if not itemName or not itemLink or not itemQuality then
		-- If item is not cached, return simple link
		return "[Item:" .. tostring(id) .. "]"
	end

	local _, _, _, colorCode = GetItemQualityColor(itemQuality)
	local colorHex = string.sub(colorCode, 2)
	return "\124" .. colorHex .. "\124H" .. itemLink .. "\124h[" .. itemName .. "]\124h\124r"
end

---
--- Removes all WoW formatting codes from text
--- Strips color codes, links, icons, and other formatting elements
--- @param text string Text to strip formatting from
--- @return string Clean text without formatting codes
--- @usage local clean = AtlasTWLoot_StripFormatting("|cffff0000Red Text|r")
---
function AtlasTW.LootUtils.StripFormatting(text)
    if not text then return "" end
    -- Remove color codes |cffRRGGBB and closing |r
    text = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
    text = string.gsub(text, "|r", "")
    -- Remove links |Hlink|htext|h but keep text
    text = string.gsub(text, "|H(.-)|h(.-)|h", "%2")
    -- Remove icons |Tpath|t
    text = string.gsub(text, "|T.-|t", "")
    -- Remove line breaks |n
    text = string.gsub(text, "|n", "")
    -- Remove any other codes starting with |
    text = string.gsub(text, "|%w+", "")
    text = string.gsub(text, "|%d+", "")
    -- Remove remaining single |
    text = string.gsub(text, "|", "")
    -- Remove all types of brackets and their content
    text = string.gsub(text, "%(.-%)", "")  -- ()
    text = string.gsub(text, "%[.-%]", "")  -- []
    text = string.gsub(text, "%{.-%}", "")  -- {}
    text = string.gsub(text, "%<.-%>", "")  -- <>
    return text
end

---
--- Truncates text to specified length with ellipsis
--- Strips formatting before measuring length and adds "..." if needed
--- @param text string Text to truncate
--- @param maxLength number Maximum allowed length
--- @return string Truncated text with ellipsis if needed
--- @usage local short = AtlasTW.LootUtils.TruncateText("Very long text", 10)
---
function AtlasTW.LootUtils.TruncateText(text, maxLength)
    local stripped_text = AtlasTW.LootUtils.StripFormatting(text)
    local current_len = string.len(stripped_text)
    if current_len > maxLength then
        if maxLength <= 3 then
            return "..."
        end
        local truncated_stripped_text = string.sub(stripped_text, 1, maxLength - 3) .. "..."
        return truncated_stripped_text
    else
        return stripped_text
    end
end

---
--- Extracts numeric item ID from a WoW item link
--- Supports links like |cff..|Hitem:12345:...|h[Name]|h|r
--- @param itemlink string WoW item hyperlink
--- @return number|nil Numeric item ID or nil if not found
--- @usage local id = AtlasTW.LootUtils.IdFromLink(itemLink)
---
function AtlasTW.LootUtils.IdFromLink(itemlink)
    if itemlink then
        local _, _, id = string.find(itemlink, "|Hitem:([^:]+)%:")
        return tonumber(id)
    end
    return nil
end

---
--- Splits a string by delimiter with optional limits
--- Custom string splitting with control over result count
--- WoW 1.12 compatible using string.gfind
--- @param delim string Delimiter to split by
--- @param str string String to split
--- @param maxNb number|nil Maximum number of splits (0 for unlimited)
--- @param onlyLast boolean|nil If true, return only the last part
--- @return any Returns last part if onlyLast, otherwise returns first two parts for convenience
--- @usage local a,b = AtlasTW.LootUtils.Strsplit("|", "a|b|c")
---
function AtlasTW.LootUtils.Strsplit(delim, str, maxNb, onlyLast)
	if not str or not delim then return { str } end
	if string.find(str, delim) == nil then
		return { str }
	end
	if maxNb == nil or maxNb < 1 then
		maxNb = 0
	end
	local result = {}
	local pat = "(.-)" .. delim .. "()"
	local nb = 0
	local lastPos
	for part, pos in string.gfind(str, pat) do
		nb = nb + 1
		result[nb] = part
		lastPos = pos
		if nb == maxNb then break end
	end
	if nb ~= maxNb then
		result[nb+1] = string.sub(str, lastPos)
	end
	if onlyLast then
		return result[nb+1]
	else
		return result[1], result[2]
	end
end

---
--- Checks player bags for specific items and quantities
--- Returns colored item name based on availability in bags
--- @param id number|string Item ID to search for
--- @param qty number Quantity required (default: 1)
--- @return string Colored item name (WHITE if found, RED if missing)
--- @usage local result = AtlasTW.LootUtils.CheckBagsForItems(12345, 5)
---
function AtlasTW.LootUtils.CheckBagsForItems(id, qty)
    if not id then return end
    if not qty then qty = 1 end
    local itemsfound = 0
    if not GetItemInfo then return (RED or "") .. (L and L["Unknown"] or "Unknown") end

    local itemName = GetItemInfo(id)
    if not itemName then itemName = L["Unknown"] end

    for i = 0, NUM_BAG_FRAMES do
        for j = 1, GetContainerNumSlots(i) do
            local itemLink = GetContainerItemLink(i, j)
            if itemLink and AtlasTW.LootUtils.IdFromLink(itemLink) == tonumber(id) then
                local _, stackCount = GetContainerItemInfo(i, j)
                itemsfound = itemsfound + (stackCount or 0)
                if itemsfound >= qty then
                    if qty == 1 then
                        return (WHITE or "") .. itemName
                    else
                        return (WHITE or "") .. itemName .. " (" .. qty .. ")"
                    end
                end
            end
        end
    end

    if qty == 1 then
        return (RED or "") .. itemName
    else
        return (RED or "") .. itemName .. " (" .. qty .. ")"
    end
end


--- Iterates over all items in AtlasTWLoot_Data and InstanceData
--- @param callback function Function to call for each item (arg: itemID, pageKey). Return non-nil to stop.
--- @return any The value returned by callback that stopped iteration, or nil.
--- @usage AtlasTW.LootUtils.IterateAllLootItems(function(id, key) ... end)
---
--- Iterates over all items in AtlasTWLoot_Data and InstanceData
--- @param callback function Function to call for each item (arg: itemID, pageKey, itemData). Return non-nil to stop.
--- @return any The value returned by callback that stopped iteration, or nil.
--- @usage AtlasTW.LootUtils.IterateAllLootItems(function(id, key, data) ... end)
---
function AtlasTW.LootUtils.IterateAllLootItems(callback)
    if not callback then return end

    -- Helper to iterate a single list of items
    local function IterateList(list, key)
        if type(list) ~= "table" then return end
        local m = table.getn(list)
        for i = 1, m do
            local el = list[i]
            if type(el) == "table" then
                -- Check standard id
                if el.id then
                    local res = callback(el.id, key, el)
                    if res then return res end
                end
                -- Check legacy/tuple format id
                if el[1] and type(el[1]) == "number" then
                     local res = callback(el[1], key, el)
                     if res then return res end
                end

                -- Recursive check for containers
                if el.container and type(el.container) == "table" then
                    local res = IterateList(el.container, key)
                    if res then return res end
                end
            elseif type(el) == "number" then
                local res = callback(el, key, el)
                if res then return res end
            end
        end
    end

    -- 1. Iterate InstanceData
    if AtlasTW.InstanceData then
         for _, instanceData in pairs(AtlasTW.InstanceData) do
            -- Bosses
            if instanceData.Bosses then
                for _, boss in ipairs(instanceData.Bosses) do
                    -- Only iterate if items is a TABLE (unique to this boss), not a string reference
                    local items = boss.items or boss.loot
                    if type(items) == "table" and boss.id then
                        local res = IterateList(items, boss.id)
                        if res then return res end
                    end
                end
            end
            -- Reputation
            if instanceData.Reputation then
                for _, rep in pairs(instanceData.Reputation) do
                    local items = rep.items or rep.loot
                    if type(items) == "table" then
                         -- Reputation usually doesn't have a unique ID like bosses, 
                         -- but we can use "Reputation" or derived name if needed.
                         -- However, IterateList requires a 'key'.
                         -- Often these tables are referenced by string key in AtlasTWLoot_Data. 
                         -- If 'items' is a table here, it means it's an inline table? 
                         -- Typically Reputation items are string keys.
                         -- If it IS a table, we should process it. 
                         -- We'll use instance name or a placeholder if no specific key.
                        local res = IterateList(items, rep.name or "Reputation")
                        if res then return res end
                    end
                end
            end
            -- Keys
            if instanceData.Keys then
                for _, keySrc in pairs(instanceData.Keys) do
                    local items = keySrc.items or keySrc.loot
                    if type(items) == "table" then
                        local res = IterateList(items, keySrc.name or "Keys")
                        if res then return res end
                    end
                end
            end
        end
    end

    -- 2. Iterate AtlasTWLoot_Data
    if AtlasTWLoot_Data then
        for key, tbl in pairs(AtlasTWLoot_Data) do
            local res = IterateList(tbl, key)
            if res then return res end
        end
    end
end


---
--- Resolves a loot table key to a human-readable source string (Instance - Boss)
--- @param pageKey string The loot table key (e.g. "MCBoss1")
--- @return string|nil Formatted source string or nil if not found
--- @usage local source = AtlasTW.LootUtils.GetLootTableSource("MCBoss1")
---
---
--- Iterates over ONLY craft/profession tables in AtlasTWLoot_Data (NOT InstanceData)
--- Used for finding spell/enchant loot pages without accidentally matching dungeon boss items with same ID
--- @param callback function Function to call for each item (arg: itemID, pageKey, itemData). Return non-nil to stop.
--- @param primaryOnly boolean|nil If true, only iterate primary skill-level pages (Apprentice/Journeyman/Expert/Artisan)
--- @return any The value returned by callback that stopped iteration, or nil.
--- @usage AtlasTW.LootUtils.IterateCraftLootItems(function(id, key, data) ... end)
---
function AtlasTW.LootUtils.IterateCraftLootItems(callback, primaryOnly)
    if not callback or not AtlasTWLoot_Data then return end

    -- Primary page patterns (skill level based, not slot-based convenience pages)
    local PRIMARY_PATTERNS = {
        "Apprentice", "Journeyman", "Expert", "Artisan",
        "Table$", "Smelting", "Swordsmith", "Hammersmith",
        "Axesmith", "Armorsmith", "Weaponsmith", "Tribal",
        "Elemental", "Dragonscale", "Goblin", "Gnomish",
        "JewelcraftingGemology", "JewelcraftingGoldsmithing"
    }

    local function isPrimaryPage(pageKey)
        if not pageKey or type(pageKey) ~= "string" then return false end
        for i = 1, table.getn(PRIMARY_PATTERNS) do
            if string.find(pageKey, PRIMARY_PATTERNS[i]) then
                return true
            end
        end
        return false
    end

    -- Helper to iterate a single list of items
    local function IterateList(list, key)
        if type(list) ~= "table" then return end
        local m = table.getn(list)
        for i = 1, m do
            local el = list[i]
            if type(el) == "table" then
                -- Only process craft entries (those with skill field or explicit type)
                -- This ensures we don't accidentally match dungeon boss items
                if el.id and el.skill then
                    local res = callback(el.id, key, el)
                    if res then return res end
                end
                -- Also check items in container arrays (reagents/materials)
                -- Container format: { itemID } or { {itemID, {qty}} }
                if el.container and type(el.container) == "table" then
                    local containerSize = table.getn(el.container)
                    for j = 1, containerSize do
                        local containerItem = el.container[j]
                        local itemIDInContainer = nil

                        if type(containerItem) == "number" then
                            -- Simple format: { 13468 }
                            itemIDInContainer = containerItem
                        elseif type(containerItem) == "table" and containerItem[1] then
                            -- Complex format: { {13468, {1,3}} }
                            itemIDInContainer = containerItem[1]
                        end

                        if itemIDInContainer then
                            local res = callback(itemIDInContainer, key, { id = itemIDInContainer, isContainer = true })
                            if res then return res end
                        end
                    end
                end
                -- Recursive check for nested containers
                if el.container and type(el.container) == "table" then
                    local res = IterateList(el.container, key)
                    if res then return res end
                end
            end
        end
    end

    -- Only iterate AtlasTWLoot_Data (craft tables), NOT InstanceData
    for key, tbl in pairs(AtlasTWLoot_Data) do
        -- If primaryOnly flag is set, skip non-primary pages
        if not primaryOnly or isPrimaryPage(key) then
            local res = IterateList(tbl, key)
            if res then return res end
        end
    end
end

---
--- Finds the first craft/profession loot page containing a specific spell ID
--- Only searches in AtlasTWLoot_Data craft tables (not instance bosses)
--- Prioritizes primary skill-level pages (Apprentice/Journeyman/Expert/Artisan)
--- over secondary convenience pages (Helm/Chest/Boots/etc.)
--- @param spellID number The spell ID to search for
--- @return string|nil The loot page key if found, nil otherwise
--- @usage local pageKey = AtlasTW.LootUtils.FindCraftLootPageForSpell(2169)
---
function AtlasTW.LootUtils.FindCraftLootPageForSpell(spellID)
    if not spellID then return nil end
    -- First, search only in primary pages (skill-level based)
    local primaryResult = AtlasTW.LootUtils.IterateCraftLootItems(function(id, key, itemData)
        if id == spellID then return key end
    end, true)  -- true = primaryOnly

    if primaryResult then
        return primaryResult
    end

    -- Fallback: search all pages (including secondary/convenience pages)
    return AtlasTW.LootUtils.IterateCraftLootItems(function(id, key, itemData)
        if id == spellID then return key end
    end, false)  -- false = search all
end

function AtlasTW.LootUtils.GetLootTableSource(pageKey)
    if not pageKey or not AtlasTW or not AtlasTW.InstanceData then return nil end

    -- Search in InstanceData to find which instance/boss owns this pageKey
    for instanceKey, instanceData in pairs(AtlasTW.InstanceData) do
        local instanceName = instanceData.Name or instanceKey

        -- Check Bosses
        if instanceData.Bosses then
            for _, boss in ipairs(instanceData.Bosses) do
                local items = boss.items or boss.loot
                if items == pageKey or boss.id == pageKey then
                    local bossName = boss.name or boss.Name or "?"
                    return instanceName .. " - " .. bossName
                end
            end
        end

        -- Check Reputation
        if instanceData.Reputation then
            for _, rep in pairs(instanceData.Reputation) do
                local items = rep.items or rep.loot
                if items == pageKey then
                    local repName = rep.name or "Reputation"
                    return instanceName .. " - " .. repName
                end
            end
        end

        -- Check Keys
        if instanceData.Keys then
            for _, keySrc in pairs(instanceData.Keys) do
                local items = keySrc.items or keySrc.loot
                if items == pageKey then
                    local keyName = keySrc.name or "Keys"
                    return instanceName .. " - " .. keyName
                end
            end
        end

        -- Check Collections/Sets if applicable (Add more categories as needed)
    end

    return nil
end