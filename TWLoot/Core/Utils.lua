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