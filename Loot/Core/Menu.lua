---
--- Hewdrop menu construction and handlers for AtlasLoot
--- Provides dropdown registration and click handlers for loot browser navigation
--- @since 1.0.0
---

--Make the Hewdrop menu in the standalone loot browser accessible here
AtlasLoot_Hewdrop = AceLibrary("Hewdrop-2.0")

local _G = getfenv()
AtlasTW = _G.AtlasTW
--Instance required libraries
local L = AtlasTW.Local
local BS = AceLibrary("Babble-Spell-2.2a")

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
		[L["Crafting"]] = "AtlasLoot_CraftingMenu",
		[L["World"]] = "AtlasLoot_WorldMenu",
		[L["PvP Rewards"]] = "AtlasLootPvPMenu",
		[L["World Events"]] = "AtlasLootWorldEventMenu",
		[L["Collections"]] = "AtlasLootSetMenu",
		[L["Factions"]] = "AtlasLootRepMenu",
		[L["Dungeons & Raids"]] = "AtlasLoot_DungeonsMenu",
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

local L = AtlasTW.Local

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
							if AtlasTW.Refresh then AtlasTW.Refresh() end
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
	AtlasLoot_ShowScrollBarLoading()

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
		AtlasLoot_HideScrollBarLoading()
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