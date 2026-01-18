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
    -- Prepare search text
        local text = string_lower(Text)

        -- Strip "id" or "ид" prefix if present for numeric search
        -- We handle both ASCII "id" and localized "ид" (UTF-8 or CP1251)
        local numericText = text
        numericText = string_gsub(numericText, "^id", "")
        numericText = string_gsub(numericText, "^ид", "") -- UTF-8 "ид"
        -- If the above didn't work and it's CP1251, it might be different bytes,
        -- but string_gsub with literal "ид" usually works if the file itself is saved in the same encoding.

        -- Remove any leading spaces or special chars from numericText
        numericText = strtrim(numericText)

        -- If the resulting numericText is empty (user just typed "id"), fallback to original text
        if numericText == "" then numericText = text end

        AtlasTWCharDB.SearchResult = {}
        AtlasTWLoot_InvalidateCategorizedList("SearchResult")
        AtlasTWCharDB.LastSearchedText = Text

        local partial = AtlasTWCharDB.PartialMatching
        if string_len(text) < 3 then
            partial = false
        end

        local function isMatch(name, id)
            -- Priority: ID match (works for uncached items)
            if id then
                local sid = tostring(id)
                if partial then
                    if string_find(sid, numericText, 1, true) then return true end
                else
                    if sid == numericText then return true end
                end
            end

            -- Name match (only works for cached items)
            if name then
                local ln = string_lower(name)
                if partial then
                    if string_find(ln, text, 1, true) then return true end
                else
                    if ln == text then return true end
                end
            end

            return false
        end

        local seen = {}
        local function addUnique(entry)
            local ty = entry[4] or "item"
            local id = entry[1]
            local sourcePage = entry[5] or entry[3] or ""

            -- Use nested table for O(1) lookup without string concatenation overhead
            if not seen[ty] then seen[ty] = {} end
            if not seen[ty][id] then seen[ty][id] = {} end

            if not seen[ty][id][sourcePage] then
                table_insert(AtlasTWCharDB.SearchResult, entry)
                seen[ty][id][sourcePage] = true
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
                    -- Match by ID first (works for uncached items)
                    if isMatch(nil, itemID) then
                        local bossName, instanceKey = resolveBossAndInstanceFromPageKey(pageKey)
                        if bossName and instanceKey and instanceKey ~= "" then
                            addUnique({ itemID, bossName, instanceKey, "item", bossName .. "|" .. instanceKey })
                        else
                            local displayName = AtlasTWLoot_GetLootPageDisplayName(pageKey)
                            addUnique({ itemID, displayName, pageKey, "item", pageKey })
                        end
                    else
                        -- Match by name (only for cached items)
                        local itemName = GetItemInfo(itemID)
                        if itemName and isMatch(itemName, nil) then
                            local bossName, instanceKey = resolveBossAndInstanceFromPageKey(pageKey)
                            if bossName and instanceKey and instanceKey ~= "" then
                                addUnique({ itemID, bossName, instanceKey, "item", bossName .. "|" .. instanceKey })
                            else
                                local displayName = AtlasTWLoot_GetLootPageDisplayName(pageKey)
                                addUnique({ itemID, displayName, pageKey, "item", pageKey })
                            end
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
                    -- Match by ID first
                    if isMatch(nil, itemID) then
                        local displayName = AtlasTWLoot_GetLootPageDisplayName(pageKey)
                        addUnique({ itemID, displayName, pageKey, "item", pageKey })
                    else
                        -- Match by name
                        local itemName = GetItemInfo(itemID)
                        if itemName and isMatch(itemName, nil) then
                            local displayName = AtlasTWLoot_GetLootPageDisplayName(pageKey)
                            addUnique({ itemID, displayName, pageKey, "item", pageKey })
                        end
                    end
                end
            end, false) -- Search all pages (primary and secondary)
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
                if isMatch(nm, spellID) then
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
                if isMatch(nm, spellID) then
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
