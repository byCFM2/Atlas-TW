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
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
---
--- Main search function for items, spells, and enchantments
--- @param Text string - Search query text
--- @return nil
--- @usage AtlasTW.SearchLib.Search("Thunderfury")
---
function AtlasTW.SearchLib.Search(Text)
    if not Text then return end
    Text = strtrim(Text)
    if Text == "" then return end
    local text = string.lower(Text)

    AtlasTWCharDB.SearchResult = {}
    AtlasTWLoot_InvalidateCategorizedList("SearchResult")
    AtlasTWCharDB.LastSearchedText = Text

    local partial = AtlasTWCharDB.PartialMatching

    local function isMatch(name)
        if not name then return false end
        local ln = string_lower(name)
        if partial then
            return string_find(ln, text, 1, true)
        else
            return ln == text
        end
    end

    -- Local cache of already added results (uniqueness by type, id, AND source page)
    -- This allows the same item to appear from multiple sources (e.g., Black Lotus from world AND Herbalism)
    local seen = {}
    local function addUnique(entry)
        local ty = entry[4] or "item"
        local id = entry[1]
        local sourcePage = entry[5] or entry[3] or ""
        -- Include source page in uniqueness key so same item can appear from different sources
        local key = ty .. ":" .. tostring(id) .. ":" .. tostring(sourcePage)
        if not seen[key] then
            table_insert(AtlasTWCharDB.SearchResult, entry)
            seen[key] = true
        end
    end

    -- Local cache for page key resolution
    local pageKeyCache = {}
    local function resolveBossAndInstanceFromPageKey(pageKey)
        if not pageKey or type(pageKey) ~= "string" then return nil, nil end

        -- Check cache first
        if pageKeyCache[pageKey] then
            local cached = pageKeyCache[pageKey]
            return cached[1], cached[2]
        end

        local bossName, instKey = nil, nil
        if AtlasTW.LootUtils and AtlasTW.LootUtils.GetBossAndInstanceFromPageKey then
            bossName, instKey = AtlasTW.LootUtils.GetBossAndInstanceFromPageKey(pageKey)
        end

        -- Cache result (even if nil, to avoid re-scanning)
        pageKeyCache[pageKey] = { bossName, instKey }
        return bossName, instKey
    end

    -- Main item search using IterateAllLootItems
    if AtlasTW.LootUtils and AtlasTW.LootUtils.IterateAllLootItems then
        AtlasTW.LootUtils.IterateAllLootItems(function(idOrItem, pageKey, itemData)
            local itemID = idOrItem
            if type(itemData) == "table" and itemData.id then itemID = itemData.id end
            if not itemID or itemID == 0 then return end

            -- Filtering logic
            -- Treat as item only if this is a real item entry.
            local isExplicitItem = (type(itemData) == "table" and itemData.type and itemData.type == "item")
            local isSpellLike = false
            if type(itemData) == "table" and itemData.skill and not isExplicitItem then
                local sid = itemData.id
                if sid and AtlasTW and AtlasTW.SpellDB and ((AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[sid]) or (AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[sid])) then
                    isSpellLike = true
                end
            end

            if not isSpellLike then
                local itemName = GetItemInfo(itemID)
                if itemName and isMatch(itemName) then
                    local bossName, instanceKey = resolveBossAndInstanceFromPageKey(pageKey)
                    if bossName and instanceKey and instanceKey ~= "" then
                        -- [1]=id, [2]=bossName, [3]=instanceKey, [4]=type, [5]=sourcePage
                        addUnique({ itemID, bossName, instanceKey, "item", bossName .. "|" .. instanceKey })
                    else
                        local displayName = AtlasTWLoot_GetLootPageDisplayName(pageKey)
                        addUnique({ itemID, displayName, pageKey, "item", pageKey })
                    end
                end
            end
        end)
    end

    -- Search for items in craft table containers (materials/reagents like Black Lotus)
    -- These items may not have skill field but are referenced in container arrays
    if AtlasTW.LootUtils and AtlasTW.LootUtils.IterateCraftLootItems then
        AtlasTW.LootUtils.IterateCraftLootItems(function(idOrItem, pageKey, itemData)
            local itemID = idOrItem
            if type(itemData) == "table" and itemData.id then itemID = itemData.id end
            if not itemID or itemID == 0 then return end

            -- Only check if this is a container item (material/reagent)
            if type(itemData) == "table" and itemData.isContainer then
                local itemName = GetItemInfo(itemID)
                if itemName and isMatch(itemName) then
                    local displayName = AtlasTWLoot_GetLootPageDisplayName(pageKey)
                    addUnique({ itemID, displayName, pageKey, "item", pageKey })
                end
            end
        end, false)  -- Search all pages (primary and secondary)
    end

    -- Use the unified craft page search function from LootUtils
    -- This ensures we only search craft tables, not instance data
    -- Prevents spell ID 2169 (Dark Leather Tunic) from matching item ID 2169 (Buzzer Blade in Deadmines)
    local function findCraftLootPageLocal(spellID)
        if AtlasTW.LootUtils and AtlasTW.LootUtils.FindCraftLootPageForSpell then
            return AtlasTW.LootUtils.FindCraftLootPageForSpell(spellID)
        end
        return nil
    end

    -- Search for enchantments by name in new spell database
    if AtlasTW.SpellDB and AtlasTW.SpellDB.enchants then
        for spellID, data in pairs(AtlasTW.SpellDB.enchants) do
            local nm = data and data.name
            -- Fallback: if enchantment name not in database, try to get name by itemID
            if (not nm or nm == "") and data and data.item then
                nm = GetItemInfo(data.item)
            end
            if isMatch(nm) then
                -- Try to bind to craft/profession page if found
                local lootPage = findCraftLootPageLocal(spellID)
                if lootPage then
                    local displayName = AtlasTWLoot_GetLootPageDisplayName(lootPage)
                    addUnique({ spellID, displayName, lootPage, "enchant", lootPage })
                else
                    -- Without instance and craft page: remains empty
                    addUnique({ spellID, "", "", "enchant" })
                end
            end
        end
    end

    -- Craft page locator: use the unified function from LootUtils
    local function findFirstCraftLootPageForSpell(spellID)
        return findCraftLootPageLocal(spellID)
    end

    -- Search for craft spells: by spell name if available, otherwise by created item name
    if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells then
        for spellID, data in pairs(AtlasTW.SpellDB.craftspells) do
            local nm = data and data.name
            if not nm and data and data.item then
                nm = GetItemInfo(data.item)
            end
            if isMatch(nm) then
                -- Try to bind to craft page if found
                local lootPage = findFirstCraftLootPageForSpell(spellID)
                if lootPage then
                    local displayName = AtlasTWLoot_GetLootPageDisplayName(lootPage)
                    addUnique({ spellID, displayName, lootPage, "spell", lootPage })
                else
                    addUnique({ spellID, "", "", "spell" })
                end
            end
        end
    end

    AtlasTWLoot_InvalidateCategorizedList("SearchResult")
    if table_getn(AtlasTWCharDB.SearchResult) == 0 then
        PrintA(L["No match found for"] .. " \"" .. Text .. "\".")
    else
        -- Display all results, scroll is handled by loot frame
        AtlasTW.SearchLib.ShowResult()
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
