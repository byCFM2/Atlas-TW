---
--- Search.lua - Advanced item search functionality
---
--- This module provides comprehensive search functionality across items, spells, and enchantments
--- for Atlas-TW. It enables users to quickly find specific items using various search criteria
--- including name patterns, item types, and source locations.
---
--- Features:
--- • Multi-criteria item searching
--- • Real-time search result filtering
--- • Integration with loot frame display
--- • Search history and suggestions
--- • Performance-optimized search algorithms
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.SearchLib = AtlasTW.SearchLib or {}

local L = AtlasTW.Localization.UI

-- Cached global functions for performance
local GetItemInfo = GetItemInfo
local string_lower = string.lower
local string_find = string.find
local string_gsub = string.gsub
local string_sub = string.sub
local string_len = string.len
local type = type
local ipairs = ipairs
local pairs = pairs
local table_insert = table.insert
local table_getn = table.getn
local tostring = tostring

---
--- Shows search results in the loot frame
--- @return nil
--- @usage AtlasTWLoot.Search.ShowResult()
---
function AtlasTW.SearchLib.ShowResult()
    -- Reset scroll position
    FauxScrollFrame_SetOffset(AtlasTWLootScrollBar, 0)
    AtlasTWLootScrollBarScrollBar:SetValue(0)
    -- Set data for displaying search results
    AtlasTWLootItemsFrame.StoredElement = "SearchResult"
    AtlasTWLootItemsFrame.StoredMenu = nil
    AtlasTWLootItemsFrame.activeElement = nil
    -- Update display
    AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
end

---
--- Trims whitespace from string
--- @param s string - String to trim
--- @return string - Trimmed string
--- @usage local trimmed = strtrim(" hello ")
---
local function strtrim(s)
    return (string_gsub(s, "^%s*(.-)%s*$", "%1"))
end
---
--- Main search function for items, spells, and enchantments
--- @param Text string - Search query text
--- @param callback function|nil - Optional callback to invoke after search and caching completes
--- @return nil
--- @usage AtlasTW.SearchLib.Search("Thunderfury")
---
function AtlasTW.SearchLib.Search(Text, callback)
    if not Text then return end
    Text = strtrim(Text)
    if Text == "" then return end

    AtlasTWCharDB.SearchResult = {}
    AtlasTWLoot_InvalidateCategorizedList("SearchResult")
    AtlasTWCharDB.LastSearchedText = Text

    local partial = AtlasTWCharDB.PartialMatching
    -- Note: DataIndex.FindItems handles string_len < 3 check internally if needed,
    -- but we can pass the preference.

    -- Use centralized DataIndex for search
    -- This avoids redundant calculations and uses the shared index
    if AtlasTW.DataIndex and AtlasTW.DataIndex.FindItems then
        local results = AtlasTW.DataIndex.FindItems(Text, {
            partial = partial,
            types = { item = true, spell = true, enchant = true } -- explicit types to match legacy behavior (no quests)
        })
        AtlasTWCharDB.SearchResult = results
    else
        -- Fallback if DataIndex is missing (should not happen)
        PrintA("Error: AtlasTW.DataIndex.FindItems not found.")
    end

    AtlasTWLoot_InvalidateCategorizedList("SearchResult")

    if table.getn(AtlasTWCharDB.SearchResult) == 0 then
        PrintA(L["No match found for"] .. " \"" .. Text .. "\".")
        if callback then
            callback()
        else
            AtlasTW.SearchLib.ShowResult()
        end
    else
        -- Display all results, scroll is handled by loot frame
        -- Ensure all results are cached so names and icons appear
        AtlasTW.LootCache.CacheAllItems(AtlasTWCharDB.SearchResult, function()
            if callback then
                callback()
            else
                AtlasTW.SearchLib.ShowResult()
            end
        end)
    end
end

---
--- Shows search options dropdown menu
--- @param button table - Button frame to anchor the dropdown to
--- @return nil
--- @usage AtlasTW.SearchLib.ShowOptions(someButton)
---
function AtlasTW.SearchLib.ShowOptions(button)
    local Hewdrop = _G.ATWHewdrop
    if not Hewdrop then return end
    if Hewdrop:IsOpen(button) then
        Hewdrop:Close(1)
    else
        local setOptions = function()
            Hewdrop:AddLine(
                "text", L["Search options"],
                "isTitle", true,
                "notCheckable", true
            )
            Hewdrop:AddLine(
                "text", L["Partial matching"],
                "checked", AtlasTWCharDB.PartialMatching,
                "tooltipTitle", L["Partial matching"],
                "tooltipText", L["If checked, AtlasTWLoot searches item names for a partial match."],
                "func", function()
                    AtlasTWCharDB.PartialMatching = not AtlasTWCharDB.PartialMatching
                    Hewdrop:Refresh(1)
                end
            )
            Hewdrop:AddLine(
                "text", L["Predict search"],
                "checked", AtlasTWCharDB.PredictSearch ~= false,
                "tooltipTitle", L["Predict search"],
                "tooltipText", L["If checked, AtlasTWLoot predicts search results."],
                "func", function()
                    local enabled = AtlasTWCharDB.PredictSearch ~= false
                    AtlasTWCharDB.PredictSearch = not enabled
                    Hewdrop:Refresh(1)
                end
            )
        end
        Hewdrop:Open(button,
            'point', function(parent)
                return "BOTTOMLEFT", "BOTTOMRIGHT"
            end,
            "children", setOptions
        )
    end
end

---
--- Gets original data from search result by item ID
--- @param itemID number - The item ID to find data for
--- @param elementType string|nil - Optional type filter ("item", "spell", "enchant")
--- @return ... - Unpacked search result data (id, bossName, instanceKey, type, sourcePage)
--- @usage local id, boss, instance = AtlasTW.SearchLib.GetOriginalDataFromSearchResult(12345)
---
function AtlasTW.SearchLib.GetOriginalDataFromSearchResult(itemID, elementType)
    local fallback = nil
    for i, v in ipairs(AtlasTWCharDB.SearchResult) do
        if v and v[1] == itemID then
            if elementType and v[4] == elementType then
                return unpack(v)
            end
            if not fallback then
                fallback = v
            end
        end
    end
    if fallback then
        return unpack(fallback)
    end
end
