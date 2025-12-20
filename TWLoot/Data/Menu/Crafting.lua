---
--- Crafting.lua - Crafting professions menu and data management
---
--- This module provides comprehensive crafting profession support for Atlas-TW,
--- organizing all tradeskill-related loot tables and profession menus.
--- It handles the display and navigation of crafting recipes, materials,
--- and profession-specific items across all available tradeskills.
---
--- Features:
--- • Complete profession menu structure
--- • Tradeskill categorization and organization
--- • Recipe and material data management
--- • Integration with Babble localization libraries
--- • Support for all classic WoW professions
---
--- @compatible World of Warcraft 1.12
---

AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}

local L = AtlasTW.Localization.UI
local LC = AtlasTW.Localization.Classes
local LS = AtlasTW.Localization.Spells
local LIS = AtlasTW.Localization.ItemSets

local RED = AtlasTW.Colors.RED

AtlasTW.MenuData.Crafting = {
    {},
    { name = LS["Alchemy"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AtlasTWLoot_AlchemyMenu" },
    { name = LS["Blacksmithing"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "AtlasTWLoot_SmithingMenu" },
    { name = LS["Enchanting"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "AtlasTWLoot_EnchantingMenu" },
    { name = LS["Engineering"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "AtlasTWLoot_EngineeringMenu" },
    { name = LS["Herbalism"], icon = "Interface\\Icons\\Trade_Herbalism", lootpage = "AtlasTWLoot_HerbalismMenu" },
    { name = LS["Leatherworking"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "AtlasTWLoot_LeatherworkingMenu" },
    { name = LS["Mining"]..", "..LS["Smelting"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "AtlasTWLoot_MiningMenu" },
    { name = LS["Tailoring"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "AtlasTWLoot_TailoringMenu" },
    { name = LS["Jewelcrafting"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "AtlasTWLoot_JewelcraftingMenu" },
    { name = LS["Cooking"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "AtlasTWLoot_CookingMenu" },
    { name = LS["First Aid"], icon = "Interface\\Icons\\Spell_Holy_SealOfSacrifice", lootpage = "AtlasTWLoot_FirstAidMenu" },
    { name = LS["Survival"]..", "..LS["Gardening"], icon = "Interface\\Icons\\Trade_Survival", lootpage = "AtlasTWLoot_SurvivalMenu" },
    {},
    { name = LS["Poisons"], Extra = LC["Rogue"], icon = "Interface\\Icons\\Trade_BrewPoison", lootpage = "AtlasTWLoot_PoisonsMenu" },
    {},
    { name = L["Crafted Sets"], icon = "Interface\\Icons\\INV_Box_01", lootpage = "AtlasTWLootCraftedSetMenu" },
    {},
    { name = L["Crafted Epic Weapons"], icon = "Interface\\Icons\\INV_Hammer_Unique_Sulfuras", lootpage = "CraftedWeapons" },
}

---
--- Displays the crafting professions menu in AtlasTWLoot
--- Shows all available crafting professions and their loot tables
--- @return nil
--- @usage AtlasTWLoot_CraftingMenu() -- Show crafting menu

function AtlasTWLoot_CraftingMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Crafting"], AtlasTW.MenuData.Crafting)
end

AtlasTW.MenuData.CraftedSet = {
    { name = RED..LS["Tailoring"].." - "..LS["Cloth"], icon = "Interface\\Icons\\INV_Chest_Cloth_21", isheader = true }, -- use cloth in name coz resolve navigation problem same name with parrent Tailoring page
    { name = LIS["Augerer's Attire"], icon = "Interface\\Icons\\INV_Helmet_11", lootpage = "AugerersAttire" },
    { name = LIS["Diviner's Garments"], icon = "Interface\\Icons\\INV_Helmet_33", lootpage = "DivinersGarments" },
    { name = LIS["Pillager's Garb"], icon = "Interface\\Icons\\INV_Helmet_28", lootpage = "PillagersGarb" },
    { name = LIS["Mooncloth Regalia"], icon = "Interface\\Icons\\inv_misc_bandana_01", lootpage = "MoonclothRegalia" },
    { name = LIS["Bloodvine Garb"], icon = "Interface\\Icons\\INV_Pants_Cloth_14", lootpage = "BloodvineG" },
    { name = LIS["Flarecore Regalia"], icon = "Interface\\Icons\\inv_chest_cloth_18", lootpage = "FlarecoreRegalia" },
    { name = LIS["Dreamthread Regalia"], icon = "Interface\\Icons\\INV_Gauntlets_23", lootpage = "DreamthreadRegalia" },
    {},
    { name = RED..LS["Leatherworking"].." - "..LS["Mail"], icon = "Interface\\Icons\\INV_Chest_Chain_12", isheader = true },
    { name = LIS["Red Dragon Mail"], Extra = L["Fire Resistance Gear"], icon = "Interface\\Icons\\inv_chest_chain_06", lootpage = "RedDragonM" },
    { name = LIS["Green Dragon Mail"], Extra = L["Nature Resistance Gear"], icon = "Interface\\Icons\\INV_Pants_05", lootpage = "GreenDragonM" },
    { name = LIS["Blue Dragon Mail"], Extra = L["Arcane Resistance Gear"], icon = "Interface\\Icons\\INV_Chest_Chain_04", lootpage = "BlueDragonM" },
    { name = LIS["Black Dragon Mail"], Extra = L["Fire Resistance Gear"], icon = "Interface\\Icons\\INV_Pants_03", lootpage = "BlackDragonM" },
    {},
    { name = RED..LS["Leatherworking"].." - "..LS["Leather"], icon = "Interface\\Icons\\INV_Chest_Leather_04", isheader = true },
    { name = LIS["Grifter's Armor"], icon = "Interface\\Icons\\INV_Helmet_33", lootpage = "GriftersArmor" },
    { name = LIS["Primalist's Trappings"], icon = "Interface\\Icons\\Inv_Chest_Plate06", lootpage = "PrimalistsTrappings" },
    { name = LIS["Volcanic Armor"], Extra = L["Fire Resistance Gear"], icon = "Interface\\Icons\\INV_Pants_06", lootpage = "VolcanicArmor" },
     { name = LIS["Ironfeather Armor"], icon = "Interface\\Icons\\INV_Chest_Leather_06", lootpage = "IronfeatherArmor" },
    { name = LIS["Stormshroud Armor"], icon = "Interface\\Icons\\INV_Chest_Leather_08", lootpage = "StormshroudArmor" },
    { name = LIS["Devilsaur Armor"], icon = "Interface\\Icons\\INV_Pants_Wolf", lootpage = "DevilsaurArmor" },
    { name = LIS["Blood Tiger Harness"], icon = "Interface\\Icons\\INV_Shoulder_23", lootpage = "BloodTigerH" },
    { name = LIS["Primal Batskin"], icon = "Interface\\Icons\\INV_Chest_Leather_03", lootpage = "PrimalBatskin" },
    { name = LIS["Convergence of the Elements"], icon = "Interface\\Icons\\INV_Helmet_13", lootpage = "ConvergenceoftheElements" },
    { name = LIS["Dreamhide Battlegarb"], icon = "Interface\\Icons\\inv_shoulder_18", lootpage = "DreamhideBattlegarb" },
    {},
    { name = RED..LS["Blacksmithing"].." - "..LS["Plate"], icon = "Interface\\Icons\\INV_Chest_Chain_04", isheader = true },
    { name = LIS["Steel Plate Armor"], icon = "Interface\\Icons\\INV_Helmet_25", lootpage = "SteelPlate" },
    { name = LIS["Imperial Plate"], icon = "Interface\\Icons\\INV_Belt_01", lootpage = "ImperialPlate" },
    { name = RED..LS["Blacksmithing"].." - "..LS["Mail"], icon = "Interface\\Icons\\INV_Chest_Chain_04", isheader = true },
    { name = LIS["Bloodsoul Embrace"], icon = "Interface\\Icons\\INV_Shoulder_15", lootpage = "BloodsoulEmbrace" },
    { name = LIS["Hateforge Armor"], icon = "Interface\\Icons\\INV_Helmet_10", lootpage = "HateforgeArmor" },
    { name = LIS["Towerforge Battlegear"], icon = "Interface\\Icons\\INV_Helmet_37", lootpage = "TowerforgeBattlegear" },
    {},
    { name = RED..LS["Jewelcrafting"], icon = "Interface\\Icons\\INV_Chest_Chain_04", isheader = true },
    { name = LIS["Midnight Regalia"], icon = "Interface\\Icons\\BTNBlackPendant", lootpage = "MidnightRegalia" },
    { name = LIS["Goldmaster's Jewelry"], icon = "Interface\\Icons\\INV_Jewelry_Ring_Emerald", lootpage = "GoldmastersJewelry" },
    { name = LIS["Aquamarine Jewelry"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_03", lootpage = "AquamarineJewelry" },
    { name = LIS["Ornate Mithril Jewelry"], icon = "Interface\\Icons\\INV_Bracer_14", lootpage = "OrnateMithrilJewelry" },
    { name = LIS["Spellweaver's Accessories"], icon = "Interface\\Icons\\INV_Staff_13", lootpage = "SpellweaversAccessories" },
    { name = LIS["Stormcloud Jewelry"], icon = "Interface\\Icons\\INV_Jewelry_Ring_Saphire", lootpage = "StormcloudJewelry" },
    { name = LIS["Mastercrafted Diamond Jewelry"], icon = "Interface\\Icons\\INV_Crown_02", lootpage = "MastercraftedDiamondJewelry" },
    {},
    {},
    { name = LIS["Rune-Etched Armor"], icon = "Interface\\Icons\\inv_helmet_06", lootpage = "RuneEtchedArmor" },
    { name = LIS["The Darksoul"], icon = "Interface\\Icons\\INV_Shoulder_01", lootpage = "TheDarksoul" },
    { name = LIS["Dreamsteel Armor"], icon = "Interface\\Icons\\INV_Bracer_03", lootpage = "DreamsteelArmor" },
}

---
--- Opens the Crafted Sets menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLootCraftedSetMenu()

function AtlasTWLootCraftedSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Crafted Sets"], AtlasTW.MenuData.CraftedSet, L["Crafting"])
end

AtlasTW.MenuData.Alchemy = {
    { name = LS["Alchemy"]..": "..L["Apprentice"], lootpage = "AlchemyApprentice" },
    { name = LS["Alchemy"]..": "..L["Journeyman"], lootpage = "AlchemyJourneyman" },
    { name = LS["Alchemy"]..": "..L["Expert"], lootpage = "AlchemyExpert" },
    { name = LS["Alchemy"]..": "..L["Artisan"], lootpage = "AlchemyArtisan" },
    {},
    { name = LS["Alchemy"]..": "..L["Flasks"], lootpage = "AlchemyFlasks" },
    { name = LS["Alchemy"]..": "..L["Protection Potions"], lootpage = "AlchemyProtectionPots" },
    { name = LS["Alchemy"]..": "..L["Healing and Mana Potions"], lootpage = "AlchemyHealingAndMana" },
    { name = LS["Alchemy"]..": "..L["Transmutes"], lootpage = "AlchemyTransmutes" },
    { name = LS["Alchemy"]..": "..L["Defensive Potions and Elixirs"], lootpage = "AlchemyDefensive" },
    { name = LS["Alchemy"]..": "..L["Offensive Potions and Elixirs"], lootpage = "AlchemyOffensive" },
    { name = LS["Alchemy"]..": "..L["Miscellaneous"], lootpage = "AlchemyMisc" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "AlchemyTrainers" },
}

---
--- Opens the Alchemy crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_AlchemyMenu()
---
function AtlasTWLoot_AlchemyMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Alchemy"], AtlasTW.MenuData.Alchemy, L["Crafting"], "Interface\\Icons\\Trade_Alchemy")
end

AtlasTW.MenuData.Smithing = {
    { name = LS["Blacksmithing"]..": "..L["Apprentice"], lootpage = "SmithingApprentice" },
    { name = LS["Blacksmithing"]..": "..L["Journeyman"], lootpage = "SmithingJourneyman" },
    { name = LS["Blacksmithing"]..": "..L["Expert"], lootpage = "SmithingExpert" },
    { name = LS["Blacksmithing"]..": "..L["Artisan"], lootpage = "SmithingArtisan" },
    {},
    { name = LS["Blacksmithing"]..": "..LS["Armorsmith"], icon = "Interface\\Icons\\INV_Chest_Plate04", lootpage = "Armorsmith" },
    { name = LS["Blacksmithing"]..": "..LS["Weaponsmith"], icon = "Interface\\Icons\\INV_Sword_25", lootpage = "Weaponsmith" },
    { name = LS["Blacksmithing"]..": "..L["Master Axesmith"], icon = "Interface\\Icons\\INV_Axe_05", lootpage = "Axesmith" },
    { name = LS["Blacksmithing"]..": "..L["Master Hammersmith"], icon = "Interface\\Icons\\INV_Hammer_23", lootpage = "Hammersmith" },
    { name = LS["Blacksmithing"]..": "..L["Master Swordsmith"], icon = "Interface\\Icons\\INV_Sword_41", lootpage = "Swordsmith" },
    {},
    {},
    {},
    {},
    {},
    { name = LS["Blacksmithing"]..": "..L["Helm"], lootpage = "SmithingHelm" },
    { name = LS["Blacksmithing"]..": "..L["Shoulders"], lootpage = "SmithingShoulders" },
    { name = LS["Blacksmithing"]..": "..L["Chest"], lootpage = "SmithingChest" },
    { name = LS["Blacksmithing"]..": "..L["Bracers"], lootpage = "SmithingBracers" },
    { name = LS["Blacksmithing"]..": "..L["Gloves"], lootpage = "SmithingGloves" },
    { name = LS["Blacksmithing"]..": "..L["Belt"], lootpage = "SmithingBelt" },
    { name = LS["Blacksmithing"]..": "..L["Pants"], lootpage = "SmithingPants" },
    { name = LS["Blacksmithing"]..": "..L["Boots"], lootpage = "SmithingBoots" },
    { name = LS["Blacksmithing"]..": "..L["Belt Buckles"], lootpage = "SmithingBuckles" },
    { name = LS["Blacksmithing"]..": "..L["Axes"], lootpage = "SmithingAxes" },
    { name = LS["Blacksmithing"]..": "..L["Swords"], lootpage = "SmithingSwords" },
    { name = LS["Blacksmithing"]..": "..L["Maces"], lootpage = "SmithingMaces" },
    { name = LS["Blacksmithing"]..": "..L["Fist"], lootpage = "SmithingFist" },
    { name = LS["Blacksmithing"]..": "..L["Daggers"], lootpage = "SmithingDaggers" },
    { name = LS["Blacksmithing"]..": "..L["Misc"], lootpage = "SmithingMisc" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "BlacksmithingTrainers" },
}

---
--- Opens the Blacksmithing crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_SmithingMenu()
---
function AtlasTWLoot_SmithingMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Blacksmithing"],AtlasTW.MenuData.Smithing,L["Crafting"],"Interface\\Icons\\Trade_BlackSmithing")
end

AtlasTW.MenuData.Enchanting = {
    { name = LS["Enchanting"]..": "..L["Apprentice"], lootpage = "EnchantingApprentice" },
    { name = LS["Enchanting"]..": "..L["Journeyman"], lootpage = "EnchantingJourneyman" },
    { name = LS["Enchanting"]..": "..L["Expert"], lootpage = "EnchantingExpert" },
    { name = LS["Enchanting"]..": "..L["Artisan"], lootpage = "EnchantingArtisan" },
    {},
    { name = LS["Enchanting"]..": "..L["Cloak"], lootpage = "EnchantingCloak" },
    { name = LS["Enchanting"]..": "..L["Chest"], lootpage = "EnchantingChest" },
    { name = LS["Enchanting"]..": "..L["Bracers"], lootpage = "EnchantingBracer" },
    { name = LS["Enchanting"]..": "..L["Gloves"], lootpage = "EnchantingGlove" },
    { name = LS["Enchanting"]..": "..L["Boots"], lootpage = "EnchantingBoots" },
    { name = LS["Enchanting"]..": "..L["2H Weapon"], lootpage = "Enchanting2HWeapon" },
    { name = LS["Enchanting"]..": "..L["Weapon"], lootpage = "EnchantingWeapon" },
    { name = LS["Enchanting"]..": "..L["Shield"], lootpage = "EnchantingShield" },
    { name = LS["Enchanting"]..": "..L["Misc"], lootpage = "EnchantingMisc" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "EnchantingTrainers" },
}

---
--- Opens the Enchanting crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_EnchantingMenu()

function AtlasTWLoot_EnchantingMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Enchanting"], AtlasTW.MenuData.Enchanting, L["Crafting"], "Interface\\Icons\\Trade_Engraving")
end

AtlasTW.MenuData.Engineering = {
    { name = LS["Engineering"]..": "..L["Apprentice"], lootpage = "EngineeringApprentice" },
    { name = LS["Engineering"]..": "..L["Journeyman"], lootpage = "EngineeringJourneyman" },
    { name = LS["Engineering"]..": "..L["Expert"], lootpage = "EngineeringExpert" },
    { name = LS["Engineering"]..": "..L["Artisan"], lootpage = "EngineeringArtisan" },
    {},
    { name = L["Gnomish Engineering"], icon = "Interface\\Icons\\INV_Gizmo_02", lootpage = "Gnomish" },
    { name = L["Goblin Engineering"], icon = "Interface\\Icons\\Spell_Fire_Selfdestruct", lootpage = "Goblin" },
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    { name = LS["Engineering"]..": "..L["Equipment"], lootpage = "EngineeringEquipment" },
    { name = LS["Engineering"]..": "..L["Trinkets"], lootpage = "EngineeringTrinkets" },
    { name = LS["Engineering"]..": "..L["Explosives"], lootpage = "EngineeringExplosives" },
    { name = LS["Engineering"]..": "..L["Weapons"], lootpage = "EngineeringWeapons" },
    { name = LS["Engineering"]..": "..L["Parts"], lootpage = "EngineeringParts" },
    { name = LS["Engineering"]..": "..L["Misc"], lootpage = "EngineeringMisc" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "EngineeringTrainers" },
}

---
--- Opens the Engineering crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_EngineeringMenu()

function AtlasTWLoot_EngineeringMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Engineering"], AtlasTW.MenuData.Engineering, L["Crafting"], "Interface\\Icons\\Trade_Engineering")
end

AtlasTW.MenuData.Leatherworking = {
    { name = LS["Leatherworking"]..": "..L["Apprentice"], lootpage = "LeatherApprentice" },
    { name = LS["Leatherworking"]..": "..L["Journeyman"], lootpage = "LeatherJourneyman" },
    { name = LS["Leatherworking"]..": "..L["Expert"], lootpage = "LeatherExpert" },
    { name = LS["Leatherworking"]..": "..L["Artisan"], lootpage = "LeatherArtisan" },
    {},
    { name = LS["Dragonscale Leatherworking"], icon = "Interface\\Icons\\INV_Misc_MonsterScales_03", lootpage = "Dragonscale" },
    { name = LS["Tribal Leatherworking"], icon = "Interface\\Icons\\Spell_Nature_NullWard", lootpage = "Tribal" },
    { name = LS["Elemental Leatherworking"], icon = "Interface\\Icons\\Spell_Fire_Volcano", lootpage = "Elemental" },
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    { name = LS["Leatherworking"]..": "..L["Helm"], lootpage = "LeatherHelm" },
    { name = LS["Leatherworking"]..": "..L["Shoulders"], lootpage = "LeatherShoulders" },
    { name = LS["Leatherworking"]..": "..L["Cloak"], lootpage = "LeatherCloak" },
    { name = LS["Leatherworking"]..": "..L["Chest"], lootpage = "LeatherChest" },
    { name = LS["Leatherworking"]..": "..L["Bracers"], lootpage = "LeatherBracers" },
    { name = LS["Leatherworking"]..": "..L["Gloves"], lootpage = "LeatherGloves" },
    { name = LS["Leatherworking"]..": "..L["Belt"], lootpage = "LeatherBelt" },
    { name = LS["Leatherworking"]..": "..L["Pants"], lootpage = "LeatherPants" },
    { name = LS["Leatherworking"]..": "..L["Boots"], lootpage = "LeatherBoots" },
    {},
    { name = LS["Leatherworking"]..": "..L["Bags"], lootpage = "LeatherBags" },
    { name = LS["Leatherworking"]..": "..L["Misc"], lootpage = "LeatherMisc" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "LeatherworkingTrainers" },
}

---
--- Opens the Leatherworking crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_LeatherworkingMenu()

function AtlasTWLoot_LeatherworkingMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Leatherworking"], AtlasTW.MenuData.Leatherworking, L["Crafting"], "Interface\\Icons\\INV_Misc_ArmorKit_17")
end

AtlasTW.MenuData.Mining = {
    { name = LS["Mining"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "MiningTable" },
    { name = LS["Smelting"], icon = "Interface\\Icons\\Spell_Fire_FlameBlades", lootpage = "Smelting" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "MiningTrainers" },
}

---
--- Opens the Mining profession menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_MiningMenu()

function AtlasTWLoot_MiningMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Mining"], AtlasTW.MenuData.Mining, L["Crafting"], "Interface\\Icons\\Trade_Mining")
end

AtlasTW.MenuData.Tailoring = {
    { name = LS["Tailoring"]..": "..L["Apprentice"], lootpage = "TailoringApprentice" },
    { name = LS["Tailoring"]..": "..L["Journeyman"], lootpage = "TailoringJourneyman" },
    { name = LS["Tailoring"]..": "..L["Expert"], lootpage = "TailoringExpert" },
    { name = LS["Tailoring"]..": "..L["Artisan"], lootpage = "TailoringArtisan" },
    {},
    { name = LS["Tailoring"]..": "..L["Helm"], lootpage = "TailoringHelm" },
    { name = LS["Tailoring"]..": "..L["Shoulders"], lootpage = "TailoringShoulders" },
    { name = LS["Tailoring"]..": "..L["Cloak"], lootpage = "TailoringCloak" },
    { name = LS["Tailoring"]..": "..L["Chest"], lootpage = "TailoringChest" },
    { name = LS["Tailoring"]..": "..L["Bracers"], lootpage = "TailoringBracers" },
    { name = LS["Tailoring"]..": "..L["Gloves"], lootpage = "TailoringGloves" },
    { name = LS["Tailoring"]..": "..L["Belt"], lootpage = "TailoringBelt" },
    { name = LS["Tailoring"]..": "..L["Pants"], lootpage = "TailoringPants" },
    { name = LS["Tailoring"]..": "..L["Boots"], lootpage = "TailoringBoots" },
    {},
    { name = LS["Tailoring"]..": "..L["Shirt"], lootpage = "TailoringShirt" },
    { name = LS["Tailoring"]..": "..L["Bags"], lootpage = "TailoringBags" },
    { name = LS["Tailoring"]..": "..L["Misc"], lootpage = "TailoringMisc" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "TailoringTrainers" },
}

---
--- Opens the Tailoring crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_TailoringMenu()

function AtlasTWLoot_TailoringMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Tailoring"], AtlasTW.MenuData.Tailoring, L["Crafting"], "Interface\\Icons\\Trade_Tailoring")
end

AtlasTW.MenuData.Jewelcrafting = {
    { name = LS["Jewelcrafting"]..": "..L["Apprentice"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingApprentice" },
    { name = LS["Jewelcrafting"]..": "..L["Journeyman"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingJourneyman" },
    { name = LS["Jewelcrafting"]..": "..L["Expert"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingExpert" },
    { name = LS["Jewelcrafting"]..": "..L["Artisan"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingArtisan" },
    {},
    { name = LS["Jewelcrafting"]..": "..LS["Gemology"], icon = "Interface\\Icons\\INV_Misc_Gem_Variety_01", lootpage = "JewelcraftingGemology" },
    { name = LS["Jewelcrafting"]..": "..LS["Goldsmithing"], icon = "Interface\\Icons\\INV_Jewelry_Ring_03", lootpage = "JewelcraftingGoldsmithing" },
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    { name = LS["Jewelcrafting"]..": "..L["Gemstones"], lootpage = "JewelcraftingGemstones" },
    { name = LS["Jewelcrafting"]..": "..L["Rings"], lootpage = "JewelcraftingRings" },
    { name = LS["Jewelcrafting"]..": "..L["Amulets"], lootpage = "JewelcraftingAmulets" },
    { name = LS["Jewelcrafting"]..": "..L["Head"], lootpage = "JewelcraftingHelm" },
    { name = LS["Jewelcrafting"]..": "..L["Bracers"], lootpage = "JewelcraftingBracers" },
    { name = LS["Jewelcrafting"]..": "..L["Off Hand"], lootpage = "JewelcraftingOffHands" },
    { name = LS["Jewelcrafting"]..": "..L["Staff"], lootpage = "JewelcraftingStaves" },
    { name = LS["Jewelcrafting"]..": "..L["Trinkets"], lootpage = "JewelcraftingTrinkets" },
    { name = LS["Jewelcrafting"]..": "..L["Misc"], lootpage = "JewelcraftingMisc" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "JewelcraftingTrainers" },
}

---
--- Opens the Jewelcrafting crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_JewelcraftingMenu()

function AtlasTWLoot_JewelcraftingMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Jewelcrafting"], AtlasTW.MenuData.Jewelcrafting, L["Crafting"], "Interface\\Icons\\INV_Jewelry_Necklace_01")
end

AtlasTW.MenuData.Cooking = {
    { name = LS["Cooking"]..": "..L["Apprentice"], lootpage = "CookingApprentice" },
    { name = LS["Cooking"]..": "..L["Journeyman"], lootpage = "CookingJourneyman" },
    { name = LS["Cooking"]..": "..L["Expert"], lootpage = "CookingExpert" },
    { name = LS["Cooking"]..": "..L["Artisan"], lootpage = "CookingArtisan" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "CookingTrainers" },
}

---
--- Opens the Cooking crafting menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_CookingMenu()

function AtlasTWLoot_CookingMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Cooking"], AtlasTW.MenuData.Cooking, L["Crafting"], "Interface\\Icons\\INV_Misc_Food_15")
end

AtlasTW.MenuData.FirstAid = {
    { name = LS["First Aid"], icon = "Interface\\Icons\\Spell_Holy_SealOfSacrifice", lootpage = "FirstAidTable" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "FirstAidTrainers" },
}

---
--- Opens the First Aid menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_FirstAidMenu()

function AtlasTWLoot_FirstAidMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["First Aid"], AtlasTW.MenuData.FirstAid, L["Crafting"], "Interface\\Icons\\Spell_Holy_SealOfSacrifice")
end

AtlasTW.MenuData.Herbalism = {
    { name = LS["Herbalism"], icon = "Interface\\Icons\\Trade_Herbalism", lootpage = "HerbalismTable" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "HerbalismTrainers" },
}

---
--- Opens the Herbalism menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_HerbalismMenu()

function AtlasTWLoot_HerbalismMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Herbalism"], AtlasTW.MenuData.Herbalism, L["Crafting"], "Interface\\Icons\\Trade_Herbalism")
end

AtlasTW.MenuData.Survival = {
    { name = LS["Survival"]..", "..LS["Gardening"], lootpage = "SurvivalTable" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "SurvivalTrainers" },
}

---
--- Opens the Survival menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_SurvivalMenu()

function AtlasTWLoot_SurvivalMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Survival"], AtlasTW.MenuData.Survival, L["Crafting"], "Interface\\Icons\\Trade_Survival")
end

AtlasTW.MenuData.Poisons = {
    { name = LS["Poisons"], icon = "Interface\\Icons\\Trade_BrewPoison", lootpage = "PoisonsTable" },
    {},
    { name = L["Trainers"], icon = "Interface\\Icons\\INV_Misc_Book_09", lootpage = "PoisonsTrainers" },
}

---
--- Opens the Poisons menu in AtlasTWLoot
--- @return nil
--- @usage AtlasTWLoot_PoisonsMenu()

function AtlasTWLoot_PoisonsMenu()
    AtlasTW.LootBrowserUI.PrepMenu(LS["Poisons"], AtlasTW.MenuData.Poisons, L["Crafting"], "Interface\\Icons\\Trade_BrewPoison")
end