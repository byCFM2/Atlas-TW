---
--- Hewdrop menu construction and handlers for AtlasLoot
--- Provides dropdown registration and click handlers for loot browser navigation
--- @since 1.0.0
---

--Make the Hewdrop menu in the standalone loot browser accessible here
AtlasLoot_Hewdrop = AceLibrary("Hewdrop-2.0")

-- Instance required libraries
local _G = getfenv()
AtlasTW = _G.AtlasTW
local L = AtlasTW.Local
AtlasTW.MenuData = AtlasTW.MenuData or {}
local BS = AceLibrary("Babble-Spell-2.2a")

-- Cache for localized strings (optimization)
local LocalizedStrings = {
    DungeonsRaids = L["Dungeons & Raids"],
    World = L["World"],
    PvPRewards = L["PvP Rewards"],
    Collections = L["Collections"],
    Factions = L["Factions"],
    WorldEvents = L["World Events"],
    Crafting = L["Crafting"],
    RareMobs = L["Rare Mobs"]
}

--- Counts the maximum numeric index in a sparse array
--- @param tbl table The table to analyze for maximum numeric index
--- @return number The highest numeric key found in the table
--- @usage local max = GetMaxNumericIndex({[1] = "a", [5] = "b"}) -- returns 5
--- @since 1.0.0
local function GetMaxNumericIndex(tbl)
    local maxIndex = 0
    for k, v in pairs(tbl) do
        if type(k) == "number" and k > maxIndex and v then
            maxIndex = k
        end
    end
    return maxIndex
end

--- Processes category data for loot configuration
--- @param data table The raw category data to process
--- @param categoryName string The name of the category being processed
--- @param specialHandler function|nil Optional special handler function
--- @return table|nil Processed category data structure
--- @usage local category = ProcessCategoryData(dungeonData, "Dungeons", nil)
--- @since 1.0.0
local function ProcessCategoryData(data, categoryName, specialHandler)
    if not data then return nil end

    local category = {}
    category[categoryName] = {}
    local categoryList = category[categoryName]

    if specialHandler then
        return specialHandler(data, category, categoryList)
    else
        -- Standard processing with sparse array support
        local maxIndex = GetMaxNumericIndex(data)
        for i = 1, maxIndex do
            local item = data[i]
            if item and item.name and item.lootpage then
                table.insert(categoryList, { { item.name, item.lootpage } })
            end
        end
    end

    return category
end

--- Special handler to process World category (ensures Rare Mobs entry is placed last)
--- @param data table Raw world bosses data
--- @param category table Output category table reference
--- @param categoryList table Output list reference inside category
--- @return table category The processed category table
--- @usage local cat = ProcessWorldCategory(MenuData.WorldBosses, {}, {})
--- @since 1.0.0
---
local function ProcessWorldCategory(data, category, categoryList)
    local rareMobsEntry = nil
    local maxIndex = GetMaxNumericIndex(data)

    for i = 1, maxIndex do
        local boss = data[i]
        if boss and boss.name and boss.lootpage then
            if boss.name == LocalizedStrings.RareMobs then
                rareMobsEntry = { { boss.name, boss.lootpage } }
            else
                table.insert(categoryList, { { boss.name, boss.lootpage } })
            end
        end
    end

    if rareMobsEntry then
        table.insert(categoryList, rareMobsEntry)
    end

    return category
end

--- Special handler to process Dungeons & Raids category
--- @param menuData table Raw dungeon menu data
--- @return table|nil category The processed category or nil when input is invalid
--- @usage local cat = ProcessDungeonsCategory(MenuData.Dungeons)
--- @since 1.0.0
---
local function ProcessDungeonsCategory(menuData)
    if not menuData then return nil end

    local category = {}
    category[LocalizedStrings.DungeonsRaids] = {}
    local categoryList = category[LocalizedStrings.DungeonsRaids]

    -- Combine processing of two arrays into one loop with sparse array support
    local totalCount = GetMaxNumericIndex(menuData)
    for i = 1, totalCount do
        local dung = menuData[i]
        if dung and dung.name and dung.lootpage then
            table.insert(categoryList, { { dung.name, dung.lootpage } }) --dung.name_orig or 
        end
    end
    return category
end

--- Generates the dropdown menu structure for AtlasLoot
--- Creates optimized menu categories for dungeons, world, PvP, collections, etc.
--- @return table Complete dropdown menu structure for AtlasLoot
--- @usage local menu = GenerateHewdropDown()
--- @since 1.0.0
local function GenerateHewdropDown()

    local MenuData = AtlasTW.MenuData
    local hewdropDown = {}
    local category

    -- 1. Dungeons & Raids (optimized processing)
    category = ProcessDungeonsCategory(MenuData.Dungeons)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 2. World (optimized processing)
    category = ProcessCategoryData(MenuData.WorldBosses, LocalizedStrings.World, ProcessWorldCategory)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 3. PvP Rewards (optimized processing)
    category = ProcessCategoryData(MenuData.PVP, LocalizedStrings.PvPRewards)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 4. Collections (optimized processing)
    category = ProcessCategoryData(MenuData.Sets, LocalizedStrings.Collections)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 5. Factions (optimized processing)
    category = ProcessCategoryData(MenuData.Factions, LocalizedStrings.Factions)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 6. World Events (optimized processing)
    category = ProcessCategoryData(MenuData.WorldEvents, LocalizedStrings.WorldEvents)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 7. Crafting (optimized processing)
    category = ProcessCategoryData(MenuData.Crafting, LocalizedStrings.Crafting)
    if category then
        table.insert(hewdropDown, category)
    end

    return hewdropDown
end

-- Generate data on load (with lazy initialization)
do
    if not AtlasLoot_HewdropDown then
        AtlasLoot_HewdropDown = GenerateHewdropDown()
    end
end

---
--- Opens a specific loot menu category
--- Maps menu names to their corresponding functions and executes them
--- @param menuName string Name of the menu to open
--- @return nil
--- @usage AtlasLoot_OpenMenu("Crafting") -- Opens crafting menu
--- @since 1.0.0
---
function AtlasLoot_OpenMenu(menuName)
	AtlasLoot_QuickLooks:Hide()
	AtlasLootQuickLooksButton:Hide()
	AtlasLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(menuName, 30))
	local menuMapping = {
		[LocalizedStrings.Crafting] = "AtlasLoot_CraftingMenu",
		[LocalizedStrings.World] = "AtlasLoot_WorldMenu",
		[LocalizedStrings.PvPRewards] = "AtlasLootPvPMenu",
		[LocalizedStrings.WorldEvents] = "AtlasLootWorldEventMenu",
		[LocalizedStrings.Collections] = "AtlasLootSetMenu",
		[LocalizedStrings.Factions] = "AtlasLootRepMenu",
		[LocalizedStrings.DungeonsRaids] = "AtlasLoot_DungeonsMenu",
		[BS["Alchemy"]] = "AtlasLoot_AlchemyMenu",
		[BS["Blacksmithing"]] = "AtlasLoot_SmithingMenu",
		[BS["Enchanting"]] = "AtlasLoot_EnchantingMenu",
		[BS["Engineering"]] = "AtlasLoot_EngineeringMenu",
		[BS["Leatherworking"]] = "AtlasLoot_LeatherworkingMenu",
		[BS["Mining"]] = "AtlasLoot_MiningMenu",
		[BS["Tailoring"]] = "AtlasLoot_TailoringMenu",
		[BS["Jewelcrafting"]] = "AtlasLoot_JewelcraftingMenu",
		[BS["Cooking"]] = "AtlasLoot_CookingMenu",
		[L["Crafted Sets"]] = "AtlasLootCraftedSetMenu",
		[L["PvP Armor Sets"]] = "AtlasLootPVPSetMenu",
		[L["Priest Sets"]] = "AtlasLootPriestSetMenu",
		[L["Mage Sets"]] = "AtlasLootMageSetMenu",
		[L["Warrior Sets"]] = "AtlasLootWarriorSetMenu",
		[L["Rogue Sets"]] = "AtlasLootRogueSetMenu",
		[L["Shaman Sets"]] = "AtlasLootShamanSetMenu",
		[L["Paladin Sets"]] = "AtlasLootPaladinSetMenu",
		[L["Druid Sets"]] = "AtlasLootDruidSetMenu",
		[L["Hunter Sets"]] = "AtlasLootHunterSetMenu",
		[L["Warlock Sets"]] = "AtlasLootWarlockSetMenu",
		[L["Pre 60 Sets"]] = "AtlasLootPRE60SetMenu",
		[L["Zul'Gurub Sets"]] = "AtlasLootZGSetMenu",
		[L["Temple of Ahn'Qiraj Sets"]] = "AtlasLootAQ40SetMenu",
		[L["Ruins of Ahn'Qiraj Sets"]] = "AtlasLootAQ20SetMenu",
		[L["Tower of Karazhan Sets"]] = "AtlasLootUKSetMenu",
		[L["Tier 0/0.5 Sets"]] = "AtlasLootT0SetMenu",
		[L["Tier 1 Sets"]] = "AtlasLootT1SetMenu",
		[L["Tier 2 Sets"]] = "AtlasLootT2SetMenu",
		[L["Tier 3 Sets"]] = "AtlasLootT3SetMenu",
		[L["World Blues"]] = "AtlasLootWorldBluesMenu",
	}

	local lootTable = menuMapping[menuName]
	if lootTable then
		AtlasLootItemsFrame.StoredElement = { menuName = menuName }
		AtlasLootItemsFrame.StoredMenu = lootTable
		-- Call menu function
		if type(_G[lootTable]) == "function" then
			_G[lootTable]()
		else
			AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
		end
	end
	CloseDropDownMenus()
end

---
--- Handles clicks on AtlasLoot Hewdrop menu items
--- Opens the appropriate loot table or submenu based on selection type
--- @param tablename string Internal loot table key or submenu identifier
--- @param text string Display text of the menu item for UI updates
--- @param tabletype string Type of the item ("Boss", "Submenu", "Table")
--- @return nil
--- @usage AtlasLoot_HewdropClick("MC_Ragnaros", "Ragnaros", "Boss")
--- @since 1.0.0
---
function AtlasLoot_HewdropClick(tablename, text, tabletype)
	-- Reset scroll to top, as in clicks on dungeon page items
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)

	if not tablename then return end

	-- Save parent menu for "Back" button
	local prevStored = AtlasLootItemsFrame.StoredElement
	if type(prevStored) == "table" and prevStored.menuName then
		AtlasLootItemsFrame.StoredBackMenuName = prevStored.menuName
	end

	-- Initialize table source and page name
	local TableSource = tablename
	local pagename = text

	-- If item from Dungeons, try to determine instance and first boss
	local effectiveInstanceKey, effectiveFirstBoss
	if type(tablename) == "string" and AtlasTW and AtlasTW.MenuData and AtlasTW.MenuData.Dungeons then
		for _, entry in ipairs(AtlasTW.MenuData.Dungeons) do
			if entry and (entry.lootpage == tablename or entry.lootpage == tablename) then
				effectiveInstanceKey = entry.lootpage
				effectiveFirstBoss = entry.firstBoss
				break
			end
		end
	end

	if effectiveInstanceKey and effectiveFirstBoss then
		TableSource = effectiveInstanceKey
		pagename = effectiveFirstBoss
		AtlasLootItemsFrame.StoredCurrentInstance = effectiveInstanceKey

		-- Set current instance in Atlas dropdown lists
		local function FindAndSetAtlasIndicesByInstance(instKey)
			if not (AtlasTW and AtlasTW.DropDowns and instKey) then return false end
			local ddCount = table.getn(AtlasTW.DropDowns)
			for typeIndex = 1, ddCount do
				local dropDownData = AtlasTW.DropDowns[typeIndex]
				if type(dropDownData) == "table" then
					for zoneIndex = 1, table.getn(dropDownData) do
						if dropDownData[zoneIndex] == instKey then
							AtlasTWOptions.AtlasType = typeIndex
							AtlasTWOptions.AtlasZone = zoneIndex
							AtlasTW.Refresh()
							AtlasTW.FrameDropDownTypeOnShow()
							AtlasTW.FrameDropDownOnShow()
							return true
						end
					end
				end
			end
			return false
		end
		local matched = FindAndSetAtlasIndicesByInstance(effectiveInstanceKey)
		if not matched then
			if AtlasTW and AtlasTW.PopulateDropdowns then AtlasTW.PopulateDropdowns() end
			matched = FindAndSetAtlasIndicesByInstance(effectiveInstanceKey)
		end
		-- After changing instance, select first boss in right list if it exists
		if effectiveFirstBoss then
			AtlasLootItemsFrame.activeElement = nil
			if AtlasTW and AtlasTW.ScrollList and AtlasTW.CurrentLine then
				for i = 1, AtlasTW.CurrentLine do
					local e = AtlasTW.ScrollList[i]
					if e then
						if e.id == effectiveFirstBoss or (type(effectiveFirstBoss) == "string" and (e.name == effectiveFirstBoss or e.line == effectiveFirstBoss)) then
							AtlasLootItemsFrame.activeElement = i
							break
						end
					end
				end
			end
			AtlasTW.LootBrowserUI.ScrollBarUpdate()
		end
	end
	-- Special handling for Rare Mobs
	if pagename == L["Rare Mobs"] then
		pagename = L["Shade Mage"]
	end

	-- Remove color codes from text if available
	pagename = AtlasTW.LootUtils.StripFormatting(pagename)

	-- Display and loading
	AtlasLootItemsFrame:Show()
	AtlasTW.LootBrowserUI.ShowScrollBarLoading()

	AtlasLootItemsFrame.StoredElement = pagename
	AtlasLootItemsFrame.StoredMenu = TableSource

	local newTable = nil
	if type(TableSource) == "table" then
		newTable = TableSource
	elseif type(TableSource) == "string" then
		newTable = AtlasLoot_Data[TableSource]
		if not newTable and type(pagename) == "string" then
			newTable = AtlasTW.DataResolver.GetLootByElemName(pagename, TableSource)
		end
		if not newTable and type(pagename) == "string" then
			newTable = AtlasTW.DataResolver.GetLootByElemName(pagename)
		end
		if not newTable then
			newTable = AtlasTW.DataResolver.GetLootByElemName(TableSource)
		end
	end

	AtlasTW.LootCache.CacheAllItems(newTable, function()
		AtlasTW.LootBrowserUI.HideScrollBarLoading()
		AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
	end)

	AtlasLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(pagename, 30))
	AtlasLootItemsFrame_SelectedCategory:Show()
	AtlasLoot_Hewdrop:Close(1)
end

---
--- Constructs and registers the main category menu
--- Creates tiered dropdown menu structure for loot browsing with Hewdrop-2.0
--- @return nil
--- @usage AtlasLoot_HewdropRegister()
--- @since 1.0.0
---
function AtlasLoot_HewdropRegister()
	AtlasLoot_Hewdrop:Register(AtlasLootItemsFrame_Menu,
		'point', function()
			return "TOP", "BOTTOM"
		end,
		'children', function(level, value)
			if level == 1 then
				if AtlasLoot_HewdropDown then
					for _,v in ipairs(AtlasLoot_HewdropDown) do
						--If a link to show a submenu
						if type(v[1]) == "table" and type(v[1][1]) == "string" then
							if v[1][3] == "Submenu" then
								AtlasLoot_Hewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_HewdropClick,
									'arg1', v[1][2],
									'arg2', v[1][1],
									'arg3', v[1][3],
									'notCheckable', true
								)
							end
						else
							local lock=0
							--If an entry linked to a subtable
							for i,j in pairs(v) do
								if lock==0 then
									AtlasLoot_Hewdrop:AddLine(
										'text', i,
										'textR', 1,
										'textG', 0.82,
										'textB', 0,
										'hasArrow', true,
										'value', j,
										'func', AtlasLoot_OpenMenu,
										'arg1', i,
										'notCheckable', true
									)
									lock=1
								end
							end
						end
					end
				end
			elseif level == 2 then
				if value then
					for _,v in ipairs(value) do
						if type(v) == "table" then
							if type(v[1]) == "table" and type(v[1][1]) == "string" then
								--If an entry to show a submenu
								if v[1][3] == "Submenu" then
									AtlasLoot_Hewdrop:AddLine(
										'text', v[1][1],
										'textR', 1,
										'textG', 0.82,
										'textB', 0,
										'func', AtlasLoot_HewdropClick,
										'arg1', v[1][2],
										'arg2', v[1][1],
										'arg3', v[1][3],
										'notCheckable', true
								)
								--An entry to show a specific loot page
							else
								AtlasLoot_Hewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_HewdropClick,
									'arg1', v[1][2],
									'arg2', v[1][1],
									'arg3', v[1][3] or "Table",
									'notCheckable', true
								)
							end
							else
								local lock=0
								--Entry to link to a sub table
								for i,j in pairs(v) do
									if lock==0 then
										AtlasLoot_Hewdrop:AddLine(
											'text', i,
											'textR', 1,
											'textG', 0.82,
											'textB', 0,
											'hasArrow', true,
											'value', j,
											'notCheckable', true
										)
										lock=1
									end
								end
							end
						end
					end
				end
			elseif level == 3 then
				--Essentially the same as level == 2
				if value then
					for k,v in pairs(value) do
						if type(v[1]) == "string" then
							if v[3] == "Submenu" then
								AtlasLoot_Hewdrop:AddLine(
									'text', v[1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_HewdropClick,
									'arg1', v[2],
									'arg2', v[1],
									'arg3', v[3],
									'notCheckable', true
								)
							else
							AtlasLoot_Hewdrop:AddLine(
								'text', v[1],
								'textR', 1,
								'textG', 0.82,
								'textB', 0,
								'func', AtlasLoot_HewdropClick,
								'arg1', v[2],
								'arg2', v[1],
								'arg3', v[3] or "Table",
								'notCheckable', true
							)
							end
						elseif type(v) == "table" then
							AtlasLoot_Hewdrop:AddLine(
								'text', k,
								'textR', 1,
								'textG', 0.82,
								'textB', 0,
								'hasArrow', true,
								'value', v,
								'notCheckable', true
							)
						end
					end
				end
			end
		end,
		'dontHook', true
	)
end