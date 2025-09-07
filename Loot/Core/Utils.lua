---
-- Utils.lua - Common string and link utilities for Atlas-TW Loot
-- Provides helper functions for text formatting and WoW item link parsing
-- Features:
-- 1) Strip WoW formatting codes from text
-- 2) Truncate text safely with ellipsis
-- 3) Extract item ID from WoW item link
-- @since 1.0.0
-- @compatible World of Warcraft 1.12
---

---
--- Removes all WoW formatting codes from text
--- Strips color codes, links, icons, and other formatting elements
--- @param text string Text to strip formatting from
--- @return string Clean text without formatting codes
--- @usage local clean = AtlasLoot_StripFormatting("|cffff0000Red Text|r")
--- @since 1.0.0
---
function AtlasLoot_StripFormatting(text)
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
--- @usage local short = AtlasLoot_Truncate("Very long text", 10)
--- @since 1.0.0
---
function AtlasLoot_Truncate(text, maxLength)
    local stripped_text = AtlasLoot_StripFormatting(text)
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
--- @usage local id = AtlasLoot_IdFromLink(itemLink)
--- @since 1.0.0
---
function AtlasLoot_IdFromLink(itemlink)
    if itemlink then
        local _, _, id = string.find(itemlink, "|Hitem:([^:]+)%:")
        return tonumber(id)
    end
    return nil
end