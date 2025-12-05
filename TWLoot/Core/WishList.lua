---
--- WishList.lua - Wish list management system
---
--- This module provides comprehensive wish list functionality for Atlas-TW.
--- It allows players to create, manage, and organize their desired items with
--- categorization, search capabilities, and persistent storage across sessions.
---
--- Features:
--- • Personal item wish list management
--- • Categorized item organization
--- • Search and filter capabilities
--- • Cache optimization for performance
--- • Cross-session persistence
---
--- @compatible World of Warcraft 1.12
---

local L = AtlasTW.Localization.UI
local LS = AtlasTW.Localization.Spells

-- Cache for categorizing WishList/SearchResult results
if not AtlasTW then AtlasTW = {} end
if not AtlasTW._CatCache then AtlasTW._CatCache = {} end
if not AtlasTW._CatRev then AtlasTW._CatRev = {} end

---
--- Invalidates the categorized list cache for a specific key
--- @param key string - The cache key to invalidate
--- @return nil
--- @usage AtlasTWLoot_InvalidateCategorizedList("wishlist")
---
function AtlasTWLoot_InvalidateCategorizedList(key)
	if not key then return end
	if not AtlasTW then return end
	if not AtlasTW._CatRev then AtlasTW._CatRev = {} end
	AtlasTW._CatRev[key] = (AtlasTW._CatRev[key] or 0) + 1
	if AtlasTW._CatCache and AtlasTW._CatCache[key] then
		AtlasTW._CatCache[key].data = nil
		AtlasTW._CatCache[key].rev = AtlasTW._CatRev[key]
	end
end

-- Forward declaration to use function before its definition
local _GetInstanceKeyByName

---
--- Displays the WishList interface and normalizes wish list data
--- @return nil
--- @usage AtlasTWLoot_ShowWishList()
---
function AtlasTWLoot_ShowWishList()
	-- Initialize wish list if it doesn't exist
	if not AtlasTWCharDB.WishList then
		AtlasTWCharDB.WishList = {}
	end

	local m = table.getn(AtlasTWCharDB.WishList)
	for i = 1, m do
		local v = AtlasTWCharDB.WishList[i]
		if v then
			-- Normalize instance field: if name is recorded, replace with key
			if v.instance and v.instance ~= "" then
				if not (AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[v.instance]) then
					local k = _GetInstanceKeyByName(v.instance)
					if k then v.instance = k end
				end
			end
			-- Normalize sourcePage: second part should be a key
			if v.sourcePage and v.sourcePage ~= "" then
				local bossName, instPart = AtlasTW.LootUtils.Strsplit("|", v.sourcePage)
				if instPart and instPart ~= "" then
					if not (AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[instPart]) then
						local k = _GetInstanceKeyByName(instPart)
						if k then
							v.sourcePage = (bossName or (v.element or "")).."|"..k
							if not v.instance or v.instance == "" then v.instance = k end
						end
					end
				end
			elseif v.element and v.instance and v.element ~= "" and v.instance ~= "" then
				v.sourcePage = v.element.."|"..v.instance
			end
		end
	end

	-- Reset scroll position
	FauxScrollFrame_SetOffset(AtlasTWLootScrollBar, 0)
	AtlasTWLootScrollBarScrollBar:SetValue(0)

	-- Set data for displaying wish list
	AtlasTWLootItemsFrame.StoredElement = "WishList"
	AtlasTWLootItemsFrame.StoredMenu = nil
	AtlasTWLootItemsFrame.activeElement = nil

	-- Invalidate cache after possible data normalization
	AtlasTWLoot_InvalidateCategorizedList("WishList")

	-- Update display
	AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
end

---
--- Helper function: find first location of ID (numeric) in instance database
--- @param targetId number - The target ID to search for
--- @return string|nil, string|nil - The element name and instance key if found
--- @usage local elem, inst = FindLocationById(12345)
---
local function FindLocationById(targetId)
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
					if scanItems(it.container) then return true end
				end
			end
		end
		return false
	end
	for instKey, inst in pairs(AtlasTW.InstanceData) do
		if inst.Reputation then
			for _, src in ipairs(inst.Reputation) do
				if scanItems(src.items or src.loot) then
					return (src.name or "Reputation"), instKey
				end
			end
		end
		if inst.Keys then
			for _, src in ipairs(inst.Keys) do
				if scanItems(src.items or src.loot) then
					return (src.name or "Keys"), instKey
				end
			end
		end
		if inst.Bosses then
			for _, boss in ipairs(inst.Bosses) do
				if scanItems(boss.items or boss.loot) then
					return (boss.name or boss.Name or "?"), instKey
				end
			end
		end
	end
	return nil, nil
end

---
--- Helper function to get instance key by name or return key as is
--- @param instName string - The instance name to look up
--- @return string|nil - The instance key or nil if not found
--- @usage local key = _GetInstanceKeyByName("Molten Core")
---
_GetInstanceKeyByName = function(instName)
	if not instName or instName == "" then return nil end
	if AtlasTW and AtlasTW.InstanceData then
		if AtlasTW.InstanceData[instName] then return instName end
		for key, inst in pairs(AtlasTW.InstanceData) do
			if inst and inst.Name == instName then
				return key
			end
		end
	end
	return nil
end

---
--- Finds instance by element name and returns instance key and normalized element name
--- @param elemName string - The element name to search for
--- @return string|nil, string - The instance key and normalized element name
--- @usage local instKey, elemName = FindInstanceByElemName("Thunderfury")
---
local function FindInstanceByElemName(elemName)
	if not elemName or not AtlasTW or not AtlasTW.InstanceData then
		return nil, elemName
	end
	for instKey, instanceData in pairs(AtlasTW.InstanceData) do
		-- Search in reputations
		if instanceData.Reputation then
			for _, v in ipairs(instanceData.Reputation) do
				if v.name == elemName or v.loot == elemName then
					return instKey, (v.name or elemName)
				end
			end
		end
		-- Search in keys
		if instanceData.Keys then
			for _, v in ipairs(instanceData.Keys) do
				if v.name == elemName or v.loot == elemName then
					return instKey, (v.name or elemName)
				end
			end
		end
		-- Search in bosses
		if instanceData.Bosses then
			for _, bossData in ipairs(instanceData.Bosses) do
				if bossData.name == elemName or bossData.id == elemName then
					return instKey, (bossData.name or elemName)
				end
			end
		end
	end
	return nil, elemName
end

---
--- Returns localized/readable name for loot page by its key
--- @param pageKey string - The loot page key to get display name for
--- @return string|nil - The display name if found, nil otherwise
--- @usage local name = AtlasTWLoot_GetLootPageDisplayName("BWL_Nefarian")
---
local function AtlasTWLoot_GetLootPageDisplayName(pageKey)
	if not pageKey or pageKey == "" then return nil end
	if AtlasTW.DataResolver.IsLootTableAvailable(pageKey) and AtlasTWLoot_Data and AtlasTWLoot_Data[pageKey] then
		local page = AtlasTWLoot_Data[pageKey]
		if type(page) == "table" then
			local m = table.getn(page)
			for i = 1, m do
				local e = page[i]
				if type(e) == "table" and e.name and e.name ~= "" then
					return e.name
				end
			end
		end
	end
	return pageKey
end

---
--- New helper: find first craft loot page by spell ID
--- @param spellID number - The spell ID to search for
--- @return string|nil - The loot page key if found, nil otherwise
--- @usage local pageKey = FindFirstCraftLootPageForSpell(12345)
---
local function FindFirstCraftLootPageForSpell(spellID)
	if not AtlasTWLoot_Data or not spellID then return nil end
	local m = table.getn(AtlasTWLoot_Data)
	for key, tbl in pairs(AtlasTWLoot_Data) do
		if type(tbl) == "table" then
			for i = 1, m do
				local el = tbl[i]
				if type(el) == "table" and el.id and el.id == spellID then
					return key
				end
			end
		end
	end
	return nil
end

---
--- Returns localized profession name by loot page key (craft page)
--- @param pageKey string - The loot page key to get profession for
--- @return string|nil - The localized profession name if found
--- @usage local profession = GetProfessionByLootPageKey("Alchemy1")
---
local function GetProfessionByLootPageKey(pageKey)
	if not pageKey or type(pageKey) ~= "string" then return nil end
	if not AtlasTW or not AtlasTW.MenuData then return nil end

	local MenuData = AtlasTW.MenuData

	-- Mapping menu table keys to localized profession names
	local ProfByTableKey = {
		Alchemy = LS["Alchemy"] or "Alchemy",
		Smithing = LS["Blacksmithing"] or "Blacksmithing",
		Enchanting = LS["Enchanting"] or "Enchanting",
		Engineering = LS["Engineering"] or "Engineering",
		Leatherworking = LS["Leatherworking"] or "Leatherworking",
		Mining = LS["Mining"] or "Mining",
		Tailoring = LS["Tailoring"] or "Tailoring",
		Jewelcrafting = LS["Jewelcrafting"] or "Jewelcrafting",
		Cooking = LS["Cooking"] or "Cooking",
		FirstAid = LS["First Aid"] or "First Aid",
		Poisons = LS["Poisons"] or "Poisons",
		Herbalism = LS["Herbalism"] or "Herbalism",
		Survival = LS["Survival"] or "Survival",
	}

	-- Local helper: safe traversal of sparse arrays
	local function GetMaxNumericIndex(tbl)
		local maxIndex = 0
		for k, v in pairs(tbl) do
			if type(k) == "number" and k > maxIndex and v then
				maxIndex = k
			end
		end
		return maxIndex
	end

	-- Local helper: attempt to find profession by menu table
	local function TryResolveByTable(tableKey)
		local t = MenuData[tableKey]
		if not t or type(t) ~= "table" then return nil end
		local maxIndex = GetMaxNumericIndex(t)
		for i = 1, maxIndex do
			local e = t[i]
			if e and e.lootpage == pageKey then
				-- If there's a prefix before colon in the name - use it (e.g. "Alchemy: Apprentice")
				if e.name and type(e.name) == "string" then
					local pos = string.find(e.name, ":")
					if pos and pos > 1 then
						return string.sub(e.name, 1, pos - 1)
					end
				end
				-- Otherwise return localized name by menu table key
				return ProfByTableKey[tableKey]
			end
		end
		return nil
	end

	-- 1) Direct match in main profession tables
	for tableKey, _ in pairs(ProfByTableKey) do
		local r = TryResolveByTable(tableKey)
		if r and r ~= "" then return r end
	end

	-- 2) Match in top-level Crafting (in case profession menu key like "AtlasTWLoot_AlchemyMenu" was passed)
	if MenuData.Crafting and type(MenuData.Crafting) == "table" then
		local maxIndex = GetMaxNumericIndex(MenuData.Crafting)
		for i = 1, maxIndex do
			local e = MenuData.Crafting[i]
			if e and e.lootpage == pageKey then
				if e.name and e.name ~= "" then
					return e.name
				end
				break
			end
		end
	end

	-- 3) Fallback to prefixes (as before) if not found in MenuData
	if string.sub(pageKey, 1, 11) == "Engineering" then return LS and LS["Engineering"] or "Engineering" end
	if string.sub(pageKey, 1, 10) == "Enchanting" then return LS and LS["Enchanting"] or "Enchanting" end
	if string.sub(pageKey, 1, 9) == "Tailoring" then return LS and LS["Tailoring"] or "Tailoring" end
	if string.sub(pageKey, 1, 8) == "Smithing" then return LS and LS["Blacksmithing"] or "Blacksmithing" end
	if string.sub(pageKey, 1, 8) == "Alchemy" then return LS and LS["Alchemy"] or "Alchemy" end
	if string.sub(pageKey, 1, 7) == "Leather" then return LS and LS["Leatherworking"] or "Leatherworking" end
	if string.sub(pageKey, 1, 7) == "Cooking" then return LS and LS["Cooking"] or "Cooking" end
	if string.sub(pageKey, 1, 7) == "Mining" then return LS and LS["Mining"] or "Mining" end
	if string.sub(pageKey, 1, 13) == "Jewelcrafting" then return LS and LS["Jewelcrafting"] or "Jewelcrafting" end

	return nil
end

---
--- Adds an item to the player's wish list with context information
--- @param itemID number - The item/spell/enchant ID to add
--- @param elemFromSearch string|table - Element name from search results
--- @param instKeyFromSearch string - Instance key from search results
--- @param typeFromSearch string - Type of element (item/spell/enchant)
--- @param srcFromSearch string - Source information from search
--- @return nil
--- @usage AtlasTWLoot_AddToWishlist(12345, "Thunderfury", "MC", "item", "Bindings")
---
function AtlasTWLoot_AddToWishlist(itemID, elemFromSearch, instKeyFromSearch, typeFromSearch, srcFromSearch)
 	-- Initialize wish list if it doesn't exist
 	if not AtlasTWCharDB.WishList then
 		AtlasTWCharDB.WishList = {}
 	end
	-- Determine element type and get corresponding information
	local elementType = typeFromSearch or "item"
	local name = nil
	local actualItemID = itemID

	-- If type didn't come from search, determine by databases
	if not typeFromSearch then
		if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[itemID] then
			elementType = "spell"
			local spellData = AtlasTW.SpellDB.craftspells[itemID]
			name = spellData.name
			actualItemID = itemID
		elseif AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[itemID] then
			elementType = "enchant"
			local enchantData = AtlasTW.SpellDB.enchants[itemID]
			name = enchantData.name
			actualItemID = itemID
		else
			name = GetItemInfo(itemID)
			actualItemID = itemID
		end
	else
		-- Type came from search: substitute name for debugging/name search if needed
		if elementType == "spell" and AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[itemID] then
			name = AtlasTW.SpellDB.craftspells[itemID].name
		elseif elementType == "enchant" and AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[itemID] then
			name = AtlasTW.SpellDB.enchants[itemID].name
		else
			name = GetItemInfo(itemID)
		end
	end
	-- Take data from search result if it was passed
	local currentElement = elemFromSearch
	local currentInstanceKey = instKeyFromSearch

	-- Normalization: if element came as table (e.g., { menuName = ... })
	if type(currentElement) == "table" then
		if currentElement.menuName then
			currentElement = currentElement.menuName
		elseif currentElement.name then
			currentElement = currentElement.name
		else
			currentElement = tostring(currentElement)
		end
	end

	-- UI fallback: if context not passed but boss loot page is currently open - use it
	if (not currentElement or currentElement == "") and (not currentInstanceKey or currentInstanceKey == "") then
		if AtlasTWLootItemsFrame and AtlasTWLootItemsFrame.StoredElement and AtlasTWLootItemsFrame.StoredMenu then
			currentElement = AtlasTWLootItemsFrame.StoredElement
			currentInstanceKey = AtlasTWLootItemsFrame.StoredMenu
		end
	end

	-- If nothing came from search, try to determine location and source only for items
	if (not currentElement and not currentInstanceKey) and elementType == "item" then
		local foundElem, foundInst = FindLocationById(actualItemID)
		currentElement = foundElem
		currentInstanceKey = foundInst
		-- If not found by ID, try by name
		if not currentElement then
			local instKeyByName, normalizedElem = FindInstanceByElemName(name)
			currentElement = normalizedElem
			currentInstanceKey = instKeyByName
		end
	end

  	-- Form record for WishList
  	local record = {
  		id = actualItemID,
  		element = currentElement,
  		instance = currentInstanceKey,
  		type = elementType,
  	}

	-- Form sourcePage: prioritize value from search (e.g., craft page)
	if type(srcFromSearch) == "string" and srcFromSearch ~= "" then
		record.sourcePage = srcFromSearch
	elseif currentElement and currentInstanceKey then
		record.sourcePage = currentElement.."|"..currentInstanceKey
	-- Don't set sourcePage if only instance key is known: such key cannot be opened directly
	end

	-- If sourcePage is not set yet and there are valid elem/inst
	if not record.sourcePage and currentElement and currentInstanceKey then
		record.sourcePage = currentElement.."|"..currentInstanceKey
	end

	-- Check for duplicate addition (by type+id pair)
	local isDuplicate = false
	local m = table.getn(AtlasTWCharDB.WishList)
	for i = 1, m do
		local w = AtlasTWCharDB.WishList[i]
		if w and w.id == actualItemID then
			local wtype = w.type or "item"
			if wtype == elementType then
				isDuplicate = true
				break
			end
		end
	end
	if isDuplicate then
		if name and name ~= "" then
			PrintA(name..L[" already in the WishList!"])
		else
			PrintA(tostring(actualItemID)..L[" already in the WishList!"])
		end
		return
	end

  	-- Save to wish list
	table.insert(AtlasTWCharDB.WishList, record)

	-- Chat message about addition
	if name and name ~= "" then
		PrintA(name..L[" added to the WishList."])
	else
		PrintA(tostring(actualItemID)..L[" added to the WishList."])
	end

	-- Invalidate category cache for wish list
	if AtlasTWLoot_InvalidateCategorizedList then
		AtlasTWLoot_InvalidateCategorizedList("WishList")
	end

	-- Update only if WishList page is currently open
	if AtlasTWLootItemsFrame and AtlasTWLootItemsFrame.storedBoss and AtlasTWLootItemsFrame.storedBoss.name == "WishList" then
		AtlasTWLoot_ShowWishList()
	end
end

---
--- Group items with zone/event name etc, and format them by adding subheadings and empty lines
--- This function returns a single table with all items
--- @param wishList table - The wish list to categorize (e.g., AtlasTWCharDB.WishList)
--- @return table - Categorized list with headers and items
--- @usage local categorized = AtlasTWLoot_CategorizeWishList(AtlasTWCharDB.WishList)
---
function AtlasTWLoot_CategorizeWishList(wishList)
	local result = {}

	if not wishList then return result end
	-- Use cache for WishList/SearchResult
	local cacheKey = nil
	if AtlasTWCharDB then
		if wishList == AtlasTWCharDB.WishList then
			cacheKey = "WishList"
		elseif wishList == AtlasTWCharDB.SearchResult then
			cacheKey = "SearchResult"
		end
	end
	if cacheKey and AtlasTW and AtlasTW._CatCache and AtlasTW._CatRev then
		local currRev = AtlasTW._CatRev[cacheKey] or 0
		local c = AtlasTW._CatCache[cacheKey]
		if c and c.rev == currRev and c.data then
			return c.data
		end
	end

	-- Go through list without sorting and add headers when category changes
	local lastCategoryKey = nil
	local m = table.getn(wishList)
	for i = 1, m do
		local v = wishList[i]
		local currentCategory

		-- Support both formats: dictionary (WishList) and array (SearchResult)
		local elem = (v.element ~= nil) and v.element or v[2]
		local inst = (v.instance ~= nil) and v.instance or v[3]
		local src = (v.sourcePage ~= nil) and v.sourcePage or v[5]

		-- Element type and ID for additional definitions (spells/enchants)
		local elementType = (v.type ~= nil) and v.type or v[4] or "item"
		local elemId = (v.id ~= nil) and v.id or v[1]

		-- Type normalization: accept only strings/numbers; discard other types (tables, functions, bool)
		if not (type(elem) == "string" or type(elem) == "number") then elem = nil end
		if not (type(inst) == "string" or type(inst) == "number") then inst = nil end
		if type(src) ~= "string" then src = nil end

		local elemOK = (elem ~= nil and elem ~= "")
		local instOK = (inst ~= nil and inst ~= "")

		local predefinedHeaderName = nil
		local predefinedExtraText = nil

		if elemOK and instOK then
			currentCategory = AtlasTWLoot_GetWishListSubheadingBoss(elem, inst)
		elseif src and src ~= "" then
			-- Try to extract boss|instance from sourcePage
			local b, ik = AtlasTW.LootUtils.Strsplit("|", src)
			-- Normalization: AtlasTW.LootUtils.Strsplit returns table of parts
			if type(b) == "table" then
				if not ik then ik = b[2] end
				b = b[1]
			end
			if type(ik) == "table" then ik = ik[1] end
			if (type(ik) == "string" or type(ik) == "number") and ik ~= "" then
				currentCategory = AtlasTWLoot_GetWishListSubheadingBoss(b, ik)
				if not elemOK then elem = b end
				if not instOK then inst = ik end
				elemOK = (elem ~= nil and elem ~= "")
				instOK = (inst ~= nil and inst ~= "")
			else
				-- src can be loot page key (e.g., craft) - localize name by page data
				local displayName = AtlasTWLoot_GetLootPageDisplayName(src)
				-- For craft pages, make header the short category name without profession prefix
				local headerName = displayName
				local profName = GetProfessionByLootPageKey(src)
				if displayName and profName then
					local prefix = profName..": "
					if string.sub(displayName, 1, string.len(prefix)) == prefix then
						headerName = string.sub(displayName, string.len(prefix) + 1)
					end
				end
				currentCategory = (headerName and headerName ~= "") and headerName or (displayName and displayName ~= "" and displayName or src)
				if not elemOK then elem = currentCategory end
				-- Pre-fill subtitle with profession
				predefinedExtraText = GetProfessionByLootPageKey(src) or nil
			end
		else
			-- Try to calculate header/subtitle for spells/enchants by craft page
			if (elementType == "spell" or elementType == "enchant") and elemId and elemId ~= 0 then
				local lootPage = FindFirstCraftLootPageForSpell(elemId)
				if lootPage then
					local displayName = AtlasTWLoot_GetLootPageDisplayName(lootPage)
					local headerName = displayName
					local profName = GetProfessionByLootPageKey(lootPage)
					if displayName and profName then
						local prefix = profName..": "
						if string.sub(displayName, 1, string.len(prefix)) == prefix then
							headerName = string.sub(displayName, string.len(prefix) + 1)
						end
					end
					predefinedHeaderName = (headerName and headerName ~= "") and headerName or (displayName and displayName ~= "" and displayName or lootPage)
					predefinedExtraText = profName or nil
				end
			end
			-- If couldn't calculate - use neutral header
			currentCategory = predefinedHeaderName or L["Search Result"]
		end

		-- Pre-calculate extratext for forming category key
		local extratext = ""
		if instOK then
			extratext = GetLootTableParent(elem, inst) or ""
		elseif src and src ~= "" then
			local b, ik = AtlasTW.LootUtils.Strsplit("|", src)
			-- Normalization: AtlasTW.LootUtils.Strsplit returns table of parts
			if type(b) == "table" then
				if not ik then ik = b[2] end
				b = b[1]
			end
			if type(ik) == "table" then ik = ik[1] end
			if (type(ik) == "string" or type(ik) == "number") and ik ~= "" then
				extratext = GetLootTableParent(b, ik) or ""
			else
				-- If this is craft page, subtitle is profession name
				extratext = GetProfessionByLootPageKey(src) or ""
			end
		end
		-- Fallback: if subtitle is empty and this is spell/enchant, try to determine profession
		if (not extratext or extratext == "") and (elementType == "spell" or elementType == "enchant") then
			if predefinedExtraText and predefinedExtraText ~= "" then
				extratext = predefinedExtraText
			elseif elementType == "enchant" then
				extratext = LS and LS["Enchanting"] or "Enchanting"
			else
				local lootPage = FindFirstCraftLootPageForSpell(elemId)
				if lootPage then
					extratext = GetProfessionByLootPageKey(lootPage) or ""
				end
			end
		end

		local currentCategoryKey = tostring(currentCategory or "") .. "||" .. tostring(extratext or "")

		-- If category changed, add header
		if currentCategoryKey ~= lastCategoryKey then
			-- Add empty line between categories (except first)
			if table.getn(result) > 0 then
				table.insert(result, {})
			end

			-- Add category header: boss/page name as header, instance/profession as extratext
			table.insert(result, { 0, currentCategory, extratext })
			lastCategoryKey = currentCategoryKey
		end

		-- Add item considering element type
		local displayItem = { (v.id ~= nil) and v.id or v[1], elem, inst, elementType }
		-- Pass through 5th element (sourcePage) only if it's a string
		local src2 = nil
		if type(v.sourcePage) == "string" then
			src2 = v.sourcePage
		elseif type(v[5]) == "string" then
			src2 = v[5]
		end
		-- Fallback: for spells/enchants, if sourcePage is missing, determine craft page
		if not src2 and (elementType == "spell" or elementType == "enchant") then
			local eid = (v.id ~= nil) and v.id or v[1]
			if eid and eid ~= 0 then
				local lp = FindFirstCraftLootPageForSpell(eid)
				if lp then
					src2 = lp
				end
			end
		end
		if src2 then
			table.insert(displayItem, src2)
		end
		table.insert(result, displayItem)
	end

	--collectgarbage()
	-- Save result to cache
	if cacheKey then
		if not AtlasTW._CatCache then AtlasTW._CatCache = {} end
		if not AtlasTW._CatRev then AtlasTW._CatRev = {} end
		AtlasTW._CatCache[cacheKey] = { data = result, rev = AtlasTW._CatRev[cacheKey] or 0 }
	end
	return result
end

---
--- Gets the subheading for wish list boss entries
--- @param bossName string - The boss name
--- @param instanceName string - The instance name
--- @return string - The formatted subheading
--- @usage local heading = AtlasTWLoot_GetWishListSubheadingBoss("Nefarian", "BWL")
---
function AtlasTWLoot_GetWishListSubheadingBoss(bossName, instanceName)
	-- Return boss or page name as header
	if bossName and bossName ~= "" then
		return bossName
	end

	-- If no boss name, return instance name
	if instanceName and instanceName ~= "" then
		if AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[instanceName] and AtlasTW.InstanceData[instanceName].Name then
			return AtlasTW.InstanceData[instanceName].Name
		end
		return instanceName
	end

	-- Return "Unknown" if nothing found
	return L["Unknown"] or "Unknown"
end

---
--- Removes an element from the wish list by its ID
--- @param elemID number - The ID of the element to remove
--- @return nil
--- @usage AtlasTWLoot_DeleteFromWishList(12345)
---
function AtlasTWLoot_DeleteFromWishList(elemID)
	-- Removes element by its ID from wish list (supports both record formats)
	if not elemID then return end
	if not AtlasTWCharDB or not AtlasTWCharDB.WishList then return end

	local removed = false
	local removedName = nil
	local removedType = nil
	local newList = {}
	local m = table.getn(AtlasTWCharDB.WishList)
	for i = 1, m do
		local v = AtlasTWCharDB.WishList[i]
		if v then
			local vId = v.id or v[1]
			if vId ~= elemID then
				table.insert(newList, v)
			else
				removed = true
				removedType = v.type or v[4] or "item"
				-- Get name before deletion
				if removedType == "spell" then
					if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[vId] then
						removedName = AtlasTW.SpellDB.craftspells[vId].name
					end
				elseif removedType == "enchant" then
					if AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[vId] then
						removedName = AtlasTW.SpellDB.enchants[vId].name
					end
				else
					removedName = GetItemInfo(vId)
				end
			end
		end
	end
	AtlasTWCharDB.WishList = newList

	if removed then
		if removedName and removedName ~= "" then
			PrintA(removedName..L[" deleted from the WishList."])
		else
			PrintA(tostring(elemID)..L[" deleted from the WishList."])
		end
	else
		PrintA(tostring(elemID)..L[" not found in the WishList."])
	end

	-- Update display
	AtlasTWLoot_InvalidateCategorizedList("WishList")
	AtlasTWLoot_ShowWishList()
end

---
--- Gets the parent instance name for a loot table
--- @param bossName string - The boss name
--- @param instanceName string - The instance name
--- @return string - The parent instance display name
--- @usage local parent = GetLootTableParent("Nefarian", "BWL")
---
function GetLootTableParent(bossName, instanceName)
	-- Return instance name as extratext (subtitle)
	if instanceName and instanceName ~= "" then
		if AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[instanceName] and AtlasTW.InstanceData[instanceName].Name then
			return AtlasTW.InstanceData[instanceName].Name
		end
		return instanceName
	end

	-- If no instance name, try to find it by boss name
	if bossName and AtlasTW.InstanceData then
		for instanceKey, instanceData in pairs(AtlasTW.InstanceData) do
			if instanceData.Bosses then
				for _, bossData in ipairs(instanceData.Bosses) do
					if bossData.name == bossName then
						return instanceData.Name or instanceKey
					end
				end
			end
		end
	end

	return L["Unknown"] or "Unknown"
end
