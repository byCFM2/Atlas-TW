---
--- Hewdrop menu construction and handlers for AtlasTWLoot
--- Provides dropdown registration and click handlers for loot browser navigation
---

-- Instance required libraries
local _G = getfenv()
AtlasTW = _G.AtlasTW

--Make the Hewdrop menu in the standalone loot browser accessible here
AtlasTWLoot_Hewdrop = _G.ATWHewdrop

local L = AtlasTW.Localization.UI
local LM = AtlasTW.Localization.MapData
local LS = AtlasTW.Localization.Spells

AtlasTW.MenuData = AtlasTW.MenuData or {}

-- Cache for localized strings (optimization)
local LocalizedStrings = {
    DungeonsRaids = L["Dungeons & Raids"],
    World = L["World"],
    PvPRewards = L["PvP Rewards"],
    Collections = L["Collections"],
    Factions = L["Factions"],
    WorldEvents = L["World Events"],
    Crafting = L["Crafting"],
	WeaponSkills = L["Weapon Skills"],
    RareMobs = L["Rare Mobs"]
}

--- Counts the maximum numeric index in a sparse array
--- @param tbl table The table to analyze for maximum numeric index
--- @return number The highest numeric key found in the table
--- @usage local max = GetMaxNumericIndex({[1] = "a", [5] = "b"}) -- returns 5

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

--- Generates the dropdown menu structure for AtlasTWLoot
--- Creates optimized menu categories for dungeons, world, PvP, collections, etc.
--- @return table Complete dropdown menu structure for AtlasTWLoot
--- @usage local menu = GenerateHewdropDown()

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
    if not AtlasTWLoot_HewdropDown then
        AtlasTWLoot_HewdropDown = GenerateHewdropDown()
    end
end

---
--- Opens a specific loot menu category
--- Maps menu names to their corresponding functions and executes them
--- @param menuName string Name of the menu to open
--- @return nil
--- @usage AtlasTWLoot_OpenMenu("Crafting") -- Opens crafting menu
---
function AtlasTWLoot_OpenMenu(menuName)
	AtlasTWLoot_QuickLooks:Hide()
	AtlasTWLootQuickLooksButton:Hide()
	AtlasTWLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(menuName, 30))
	local menuMapping = {
		[LocalizedStrings.Crafting] = "AtlasTWLoot_CraftingMenu",
		[LocalizedStrings.World] = "AtlasTWLoot_WorldMenu",
		[LocalizedStrings.PvPRewards] = "AtlasTWLootPvPMenu",
		[LocalizedStrings.WorldEvents] = "AtlasTWLootWorldEventMenu",
		[LocalizedStrings.WeaponSkills] = "AtlasTWLootWeaponSkillsMenu",
		[LocalizedStrings.Collections] = "AtlasTWLootSetMenu",
		[LocalizedStrings.Factions] = "AtlasTWLootRepMenu",
		[LocalizedStrings.DungeonsRaids] = "AtlasTWLoot_DungeonsMenu",
		[LS["Alchemy"]] = "AtlasTWLoot_AlchemyMenu",
		[LS["Blacksmithing"]] = "AtlasTWLoot_SmithingMenu",
		[LS["Enchanting"]] = "AtlasTWLoot_EnchantingMenu",
		[LS["Engineering"]] = "AtlasTWLoot_EngineeringMenu",
		[LS["Leatherworking"]] = "AtlasTWLoot_LeatherworkingMenu",
		[LS["Mining"]] = "AtlasTWLoot_MiningMenu",
		[LS["First Aid"]] = "AtlasTWLoot_FirstAidMenu",
		[LS["Survival"]] = "AtlasTWLoot_SurvivalMenu",
		[LS["Tailoring"]] = "AtlasTWLoot_TailoringMenu",
		[LS["Jewelcrafting"]] = "AtlasTWLoot_JewelcraftingMenu",
		[LS["Cooking"]] = "AtlasTWLoot_CookingMenu",
		[LS["Poisons"]] = "AtlasTWLoot_PoisonsMenu",
		[LS["Herbalism"]] = "AtlasTWLoot_HerbalismMenu",
		[LS["Fishing"]] = "AtlasTWLoot_FishingMenu",
		[LS["Skinning"]] = "AtlasTWLoot_SkinningMenu",
		[L["Crafted Sets"]] = "AtlasTWLootCraftedSetMenu",
		[L["PvP Armor Sets"]] = "AtlasTWLootPVPSetMenu",
		[L["Priest Sets"]] = "AtlasTWLootPriestSetMenu",
		[L["Mage Sets"]] = "AtlasTWLootMageSetMenu",
		[L["Warrior Sets"]] = "AtlasTWLootWarriorSetMenu",
		[L["Rogue Sets"]] = "AtlasTWLootRogueSetMenu",
		[L["Shaman Sets"]] = "AtlasTWLootShamanSetMenu",
		[L["Paladin Sets"]] = "AtlasTWLootPaladinSetMenu",
		[L["Druid Sets"]] = "AtlasTWLootDruidSetMenu",
		[L["Hunter Sets"]] = "AtlasTWLootHunterSetMenu",
		[L["Warlock Sets"]] = "AtlasTWLootWarlockSetMenu",
		[L["Pre 60 Sets"]] = "AtlasTWLootPRE60SetMenu",
		[L["Zul'Gurub Sets"]] = "AtlasTWLootZGSetMenu",
		[L["Temple of Ahn'Qiraj Sets"]] = "AtlasTWLootAQ40SetMenu",
		[L["Ruins of Ahn'Qiraj Sets"]] = "AtlasTWLootAQ20SetMenu",
		[L["Tower of Karazhan Sets"]] = "AtlasTWLootT35SetMenu",
		[L["Tier 0/0.5 Sets"]] = "AtlasTWLootT0SetMenu",
		[L["Tier 1 Sets"]] = "AtlasTWLootT1SetMenu",
		[L["Tier 2 Sets"]] = "AtlasTWLootT2SetMenu",
		[L["Tier 3 Sets"]] = "AtlasTWLootT3SetMenu",
		[L["World Blues"]] = "AtlasTWLootWorldBluesMenu",
	}

	local lootTable = menuMapping[menuName]
	if lootTable then
		AtlasTWLootItemsFrame.StoredElement = { menuName = menuName }
		AtlasTWLootItemsFrame.StoredMenu = lootTable
		-- Call menu function
		if type(_G[lootTable]) == "function" then
			_G[lootTable]()
		else
			AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
		end
	end
	if AtlasTWLoot_Hewdrop and AtlasTWLoot_Hewdrop.Close then
		AtlasTWLoot_Hewdrop:Close(1)
	end
	CloseDropDownMenus()
end

---
--- Handles clicks on AtlasTWLoot Hewdrop menu items
--- Opens the appropriate loot table or submenu based on selection type
--- @param tablename string Internal loot table key or submenu identifier
--- @param text string Display text of the menu item for UI updates
--- @param tabletype string Type of the item ("Boss", "Submenu", "Table")
--- @return nil
--- @usage AtlasTWLoot_HewdropClick("MC_Ragnaros", "Ragnaros", "Boss")
---
function AtlasTWLoot_HewdropClick(tablename, text, tabletype)
	-- Reset scroll to top, as in clicks on dungeon page items
	FauxScrollFrame_SetOffset(AtlasTWLootScrollBar, 0)
	AtlasTWLootScrollBarScrollBar:SetValue(0)

	if not tablename then return end

	-- Save parent menu for "Back" button
	local prevStored = AtlasTWLootItemsFrame.StoredElement
	if type(prevStored) == "table" and prevStored.menuName then
		AtlasTWLootItemsFrame.StoredBackMenuName = prevStored.menuName
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
		AtlasTWLootItemsFrame.StoredCurrentInstance = effectiveInstanceKey

		-- Set current instance in Atlas dropdown lists
		local function FindAndSetAtlasIndicesByInstance(instKey)
			if not (AtlasTW and AtlasTW.DropDowns and instKey) then return false end
			local ddCount = table.getn(AtlasTW.DropDowns)
			for typeIndex = 1, ddCount do
				local dropDownData = AtlasTW.DropDowns[typeIndex]
				if type(dropDownData) == "table" then
					local m = table.getn(dropDownData)
					for zoneIndex = 1, m do
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
			AtlasTWLootItemsFrame.activeElement = nil
			if AtlasTW and AtlasTW.ScrollList and AtlasTW.CurrentLine then
				for i = 1, AtlasTW.CurrentLine do
					local e = AtlasTW.ScrollList[i]
					if e then
						if e.id == effectiveFirstBoss or (type(effectiveFirstBoss) == "string" and (e.name == effectiveFirstBoss or e.line == effectiveFirstBoss)) then
							AtlasTWLootItemsFrame.activeElement = i
							break
						end
					end
				end
			end
			AtlasTW.LootBrowserUI.ScrollBarUpdate()
		end
	end
	-- Special handling for Rare Mobs
	if pagename == LocalizedStrings.RareMobs then
		pagename = LM["Shade Mage"]
	end

	-- Remove color codes from text if available
	pagename = AtlasTW.LootUtils.StripFormatting(pagename)

	-- Display and loading
	AtlasTWLootItemsFrame:Show()
	AtlasTW.LootBrowserUI.ShowScrollBarLoading()

	AtlasTWLootItemsFrame.StoredElement = pagename
	AtlasTWLootItemsFrame.StoredMenu = TableSource

	local newTable = nil
	if type(TableSource) == "table" then
		newTable = TableSource
	elseif type(TableSource) == "string" then
		newTable = AtlasTWLoot_Data[TableSource]
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

	AtlasTWLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(pagename, 30))
	AtlasTWLootItemsFrame_SelectedCategory:Show()
	AtlasTWLoot_Hewdrop:Close(1)
end

---
--- Constructs and registers the main category menu
--- Creates tiered dropdown menu structure for loot browsing with Hewdrop-2.0
--- @return nil
--- @usage AtlasTWLoot_HewdropRegister()
---
function AtlasTWLoot_HewdropRegister()
	AtlasTWLoot_Hewdrop:Register(AtlasTWLootItemsFrame_Menu,
		'point', function()
			return "TOP", "BOTTOM"
		end,
		'children', function(level, value)
			if level == 1 then
				if AtlasTWLoot_HewdropDown then
					for _,v in ipairs(AtlasTWLoot_HewdropDown) do
						--If a link to show a submenu
						if type(v[1]) == "table" and type(v[1][1]) == "string" then
							if v[1][3] == "Submenu" then
								AtlasTWLoot_Hewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasTWLoot_HewdropClick,
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
									AtlasTWLoot_Hewdrop:AddLine(
										'text', i,
										'textR', 1,
										'textG', 0.82,
										'textB', 0,
										'hasArrow', true,
										'value', j,
										'func', AtlasTWLoot_OpenMenu,
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
									AtlasTWLoot_Hewdrop:AddLine(
										'text', v[1][1],
										'textR', 1,
										'textG', 0.82,
										'textB', 0,
										'func', AtlasTWLoot_HewdropClick,
										'arg1', v[1][2],
										'arg2', v[1][1],
										'arg3', v[1][3],
										'notCheckable', true
								)
								--An entry to show a specific loot page
							else
								AtlasTWLoot_Hewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasTWLoot_HewdropClick,
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
										AtlasTWLoot_Hewdrop:AddLine(
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
								AtlasTWLoot_Hewdrop:AddLine(
									'text', v[1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasTWLoot_HewdropClick,
									'arg1', v[2],
									'arg2', v[1],
									'arg3', v[3],
									'notCheckable', true
								)
							else
							AtlasTWLoot_Hewdrop:AddLine(
								'text', v[1],
								'textR', 1,
								'textG', 0.82,
								'textB', 0,
								'func', AtlasTWLoot_HewdropClick,
								'arg1', v[2],
								'arg2', v[1],
								'arg3', v[3] or "Table",
								'notCheckable', true
							)
							end
						elseif type(v) == "table" then
							AtlasTWLoot_Hewdrop:AddLine(
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
