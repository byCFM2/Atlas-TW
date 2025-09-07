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
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local L = AtlasTW.Local
local RED = "|cffff0000"
local WHITE = "|cffFFFFFF"

---
--- Shows search results in the loot frame
--- @return nil
--- @usage AtlasLoot:ShowSearchResult()
--- @since 1.0.0
---
function AtlasLoot:ShowSearchResult()
	-- Reset scroll position
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)
	-- Set data for displaying search results
	AtlasLootItemsFrame.StoredElement = "SearchResult"
	AtlasLootItemsFrame.StoredMenu = nil
	AtlasLootItemsFrame.activeElement = nil
	-- Update display
	AtlasTW.Loot.ScrollBarLootUpdate()
end

---
--- Trims whitespace from string
--- @param s string - String to trim
--- @return string - Trimmed string
--- @usage local trimmed = strtrim(" hello ")
--- @since 1.0.0
---
local function strtrim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
---
--- Main search function for items, spells, and enchantments
--- @param Text string - Search query text
--- @return nil
--- @usage AtlasLoot:Search("Thunderfury")
--- @since 1.0.0
---
function AtlasLoot:Search(Text)
    if not Text then return end
    Text = strtrim(Text)
    if Text == "" then return end
    local text = string.lower(Text)

    AtlasTWCharDB.SearchResult = {}
    AtlasLoot_InvalidateCategorizedList("SearchResult")
    AtlasTWCharDB.LastSearchedText = Text

    local partial = AtlasTWCharDB.PartialMatching

    local function isMatch(name)
        if not name then return false end
        local ln = string.lower(name)
        if partial then
            return string.find(ln, text, 1, true)
        else
            return ln == text
        end
    end

    -- Local cache of already added results (uniqueness by type and id)
    local seen = {}
    local function addUnique(entry)
        local ty = entry[4] or "item"
        local id = entry[1]
        local key = ty .. ":" .. tostring(id)
        if not seen[key] then
            table.insert(AtlasTWCharDB.SearchResult, entry)
            seen[key] = true
        end
    end

    -- Search for first occurrence of id (item/spell/enchant) in instance database to get boss and instanceKey
    local function findFirstLocationForId(targetId)
        if not targetId or not AtlasTW or not AtlasTW.InstanceData then return nil, nil end
        local function scanItems(items)
            if not items then return false end
            if type(items) == "string" then return false end
            if type(items) ~= "table" then return false end
            for _, it in ipairs(items) do
                if type(it) == "number" then
                    if it == targetId then return true end
                elseif type(it) == "table" then
                    if it.id and it.id == targetId then return true end
                    if it.container then
                        local f = scanItems(it.container)
                        if f then return true end
                    end
                end
            end
            return false
        end
        for instKey, inst in pairs(AtlasTW.InstanceData) do
            if inst.Bosses then
                for _, boss in ipairs(inst.Bosses) do
                    local bossName = boss.name or boss.Name or "?"
                    local items = boss.items or boss.loot
                    if scanItems(items) then
                        return bossName, instKey
                    end
                end
            end
            if inst.Reputation then
                for _, src in pairs(inst.Reputation) do
                    local items = src.items or src.loot
                    local label = (src.name or "Reputation")
                    if scanItems(items) then
                        return label, instKey
                    end
                end
            end
            if inst.Keys then
                for _, src in pairs(inst.Keys) do
                    local items = src.items or src.loot
                    local label = (src.name or "Keys")
                    if scanItems(items) then
                        return label, instKey
                    end
                end
            end
        end
        return nil, nil
    end

    local function addItemResult(itemID, bossName, instanceName, instanceKey)
        if not itemID or itemID == 0 then return end
        local itemName = GetItemInfo(itemID)
        if itemName and isMatch(itemName) then
            -- In SearchResult we store: [1]=id, [2]=bossName, [3]=instanceKey, [4]=type, [5]=sourcePage (optional)
            local entry = { itemID, bossName, instanceKey, "item" }
            if instanceKey and instanceKey ~= "" then
                table.insert(entry, (bossName or "").."|"..instanceKey)
            end
            addUnique(entry)
        end
    end

    local function searchItemsList(items, bossName, instanceName, instanceKey)
        if not items then return end
        if type(items) == "string" then
            -- Skip old reference table formats
            return
        end
        if type(items) ~= "table" then return end
        for _, it in ipairs(items) do
            if type(it) == "number" then
                addItemResult(it, bossName, instanceName, instanceKey)
            elseif type(it) == "table" then
                if it.id then
                    addItemResult(it.id, bossName, instanceName, instanceKey)
                end
                if it.container then
                    searchItemsList(it.container, bossName, instanceName, instanceKey)
                end
            end
        end
    end

    -- Search for items in instances/bosses of new structure
    if AtlasTW.InstanceData then
        for instKey, inst in pairs(AtlasTW.InstanceData) do
            local instanceName = inst.Name or instKey
            if inst.Bosses then
                for _, boss in ipairs(inst.Bosses) do
                    local bossName = boss.name or boss.Name or "?"
                    local items = boss.items or boss.loot
                    searchItemsList(items, bossName, instanceName, instKey)
                end
            end
            -- Additionally check auxiliary sources if specified
            if inst.Reputation then
                for _, src in pairs(inst.Reputation) do
                    local items = src.items or src.loot
                    local label = (src.name or "Reputation")
                    searchItemsList(items, label, instanceName, instKey)
                end
            end
            if inst.Keys then
                for _, src in pairs(inst.Keys) do
                    local items = src.items or src.loot
                    local label = (src.name or "Keys")
                    searchItemsList(items, label, instanceName, instKey)
                end
            end
        end
    end

    -- Additional search for items on craft/profession pages and other loot pages (AtlasLoot_Data)
    local function searchItemsInLootTables()
        if not AtlasLoot_Data then return end
        local function considerItem(itemID, pageKey)
            if not itemID or itemID == 0 then return end
            local itemName = GetItemInfo(itemID)
            if itemName and isMatch(itemName) then
                -- [1]=id, [2]=bossName, [3]=instanceKey, [4]=type, [5]=sourcePage (page key)
                addUnique({ itemID, "", "", "item", pageKey })
            end
        end
        for key, tbl in pairs(AtlasLoot_Data) do
            if type(tbl) == "table" then
                for i = 1, table.getn(tbl) do
                    local el = tbl[i]
                    if type(el) == "table" then
                        if el.id then
                            considerItem(el.id, key)
                        end
                        if el.container and type(el.container) == "table" then
                            for j = 1, table.getn(el.container) do
                                local c = el.container[j]
                                if type(c) == "number" then
                                    considerItem(c, key)
                                elseif type(c) == "table" then
                                    if c[1] then
                                        considerItem(c[1], key)
                                    elseif c.id then
                                        considerItem(c.id, key)
                                    end
                                end
                            end
                        end
                    elseif type(el) == "number" then
                        considerItem(el, key)
                    end
                end
            end
        end
    end
    searchItemsInLootTables()

    -- Craft/profession page locator: find first loot table where spellID occurs (local for use in enchants)
    local function findCraftLootPageLocal(spellID)
        if not AtlasLoot_Data then return nil end
        for key, tbl in pairs(AtlasLoot_Data) do
            if type(tbl) == "table" then
                for i = 1, table.getn(tbl) do
                    local el = tbl[i]
                    if type(el) == "table" and el.id and el.id == spellID then
                        return key
                    end
                end
            end
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
                local bossName, instKey = findFirstLocationForId(spellID)
                if bossName and instKey then
                    addUnique({ spellID, bossName, instKey, "enchant", bossName.."|"..instKey })
                else
                    -- Try to bind to craft/profession page if found
                    local lootPage = findCraftLootPageLocal(spellID)
                    if lootPage then
                        addUnique({ spellID, "", "", "enchant", lootPage })
                    else
                        -- Without instance and craft page: remains empty
                        addUnique({ spellID, "", "", "enchant" })
                    end
                end
            end
        end
    end

    -- Craft page locator: find first loot table where spellID occurs
    local function findFirstCraftLootPageForSpell(spellID)
        if not AtlasLoot_Data then return nil end
        for key, tbl in pairs(AtlasLoot_Data) do
            if type(tbl) == "table" then
                -- Use table.getn since # is not supported in 1.12
                for i = 1, table.getn(tbl) do
                    local el = tbl[i]
                    if type(el) == "table" and el.id and el.id == spellID then
                        return key
                    end
                end
            end
        end
        return nil
    end

    -- Search for craft spells: by spell name if available, otherwise by created item name
    if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells then
        for spellID, data in pairs(AtlasTW.SpellDB.craftspells) do
            local nm = data and data.name
            if not nm and data and data.item then
                nm = GetItemInfo(data.item)
            end
            if isMatch(nm) then
                local bossName, instKey = findFirstLocationForId(spellID)
                if bossName and instKey then
                    addUnique({ spellID, bossName, instKey, "spell", bossName.."|"..instKey })
                else
                    -- Try to bind to craft page if found
                    local lootPage = findFirstCraftLootPageForSpell(spellID)
                    if lootPage then
                        addUnique({ spellID, "", "", "spell", lootPage })
                    else
                        addUnique({ spellID, "", "", "spell" })
                    end
                end
            end
        end
    end

    AtlasLoot_InvalidateCategorizedList("SearchResult")
    if table.getn(AtlasTWCharDB.SearchResult) == 0 then
        print(RED.."AtlasLoot"..": "..WHITE..L["No match found for"].." \""..Text.."\".")
    else
        -- Display all results, scroll is handled by loot frame
        AtlasLoot:ShowSearchResult()
    end
end

---
--- Shows search options dropdown menu
--- @param button table - Button frame to anchor the dropdown to
--- @return nil
--- @usage AtlasLoot:ShowSearchOptions(someButton)
--- @since 1.0.0
---
function AtlasLoot:ShowSearchOptions(button)
	local Hewdrop = AceLibrary("Hewdrop-2.0")
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
				"tooltipText", L["If checked, AtlasLoot searches item names for a partial match."],
				"func", function() AtlasTWCharDB.PartialMatching = not AtlasTWCharDB.PartialMatching end
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
--- @return ... - Unpacked search result data (id, bossName, instanceKey, type, sourcePage)
--- @usage local id, boss, instance = AtlasLoot:GetOriginalDataFromSearchResult(12345)
--- @since 1.0.0
---
function AtlasLoot:GetOriginalDataFromSearchResult(itemID)
	for i, v in ipairs(AtlasTWCharDB.SearchResult) do
		if v[1] == itemID then return unpack(v) end
	end
end