---
--- Hewdrop menu construction and handlers for AtlasLoot
--- Provides dropdown registration and click handlers for loot browser navigation
--- @author Atlas-TW Team
--- @since 1.0.0
---

--Make the Hewdrop menu in the standalone loot browser accessible here
AtlasLoot_Hewdrop = AceLibrary("Hewdrop-2.0")

---
--- Handles clicks on AtlasLoot Hewdrop menu items
--- Opens the appropriate loot table or submenu based on selection type
--- @param tablename string Internal loot table key or submenu identifier
--- @param text string Display text of the menu item for UI updates
--- @param tabletype string Type of the item ("Boss", "Submenu", "Table")
--- @return nil
--- @usage AtlasLoot_HewdropClick("MC_Ragnaros", "Ragnaros", "Boss")
--- @since 1.0.0
--- @author Atlas-TW Team
---
function AtlasLoot_HewdropClick(tablename, text, tabletype)
	if tabletype == "Submenu" then
		AtlasLoot_OpenMenu(tablename)
	else
		AtlasLoot_ShowLootPage(tablename, text, tabletype)
	end
	AtlasLootItemsFrame_SelectedCategory:SetText(AtlasLoot_Truncate(text, 30))
	AtlasLootItemsFrame_SelectedCategory:Show()
	AtlasLoot_Hewdrop:Close(1)
end

---
--- Constructs and registers the main category menu
--- Creates tiered dropdown menu structure for loot browsing with Hewdrop-2.0
--- @return nil
--- @usage AtlasLoot_HewdropRegister()
--- @since 1.0.0
--- @author Atlas-TW Team
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
			end
		end
	end)
end