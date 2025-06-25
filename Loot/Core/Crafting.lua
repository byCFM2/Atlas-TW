local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

local RED = "|cffff0000"

local function getExtraText(itemData)
    return itemData.extraText or ""
end

local craftingMenuData = {
    {},
    { name = BS["Alchemy"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "ALCHEMYMENU" },
    { name = BS["Blacksmithing"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SMITHINGMENU" },
    { name = BS["Enchanting"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "ENCHANTINGMENU" },
    { name = BS["Engineering"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "ENGINEERINGMENU" },
    { name = BS["Herbalism"], icon = "Interface\\Icons\\Trade_Herbalism", lootpage = "Herbalism1" },
    { name = BS["Leatherworking"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LEATHERWORKINGMENU" },
    { name = BS["Mining"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "MININGMENU" },
    { name = BS["Tailoring"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TAILORINGMENU" },
    { name = BS["Jewelcrafting"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JEWELCRAFTMENU" },
    { name = BS["Cooking"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "COOKINGMENU" },
    { name = BS["First Aid"], icon = "Interface\\Icons\\Spell_Holy_SealOfSacrifice", lootpage = "FirstAid1" },
    { name = BS["Survival"], icon = "Interface\\Icons\\Trade_Survival", lootpage = "SURVIVALMENU" },
    {},
    { name = BS["Poisons"], extraText = BC["Rogue"], icon = "Interface\\Icons\\Trade_BrewPoison", lootpage = "Poisons1" },
    {},
    { name = "Crafted Sets (Cloth, Leather)", icon = "Interface\\Icons\\INV_Box_01", lootpage = "CRAFTSET" },
    { name = "Crafted Sets (Mail, Plate)", icon = "Interface\\Icons\\INV_Box_02", lootpage = "CRAFTSET2" },
    {},
    { name = L["Crafted Epic Weapons"], icon = "Interface\\Icons\\INV_Hammer_Unique_Sulfuras", lootpage = "CraftedWeapons1" },
}

function AtlasLoot_CraftingMenu()
	AtlasLoot_PrepMenu(nil, L["Crafting"])
	AtlasTWCharDB.LastBoss = "CRAFTINGMENU"
	AtlasTWCharDB.LastBossText = L["Crafting"]
    AtlasLoot_ShowMenu(craftingMenuData, { maxItems = table.getn(craftingMenuData), getExtraText = getExtraText })
end

local craftedSetMenuData = {
    { name = RED..BS["Tailoring"], icon = "Interface\\Icons\\INV_Chest_Cloth_21", isheader = true },
    {},
    { name = BIS["Augerer's Attire"], icon = "Interface\\Icons\\INV_Helmet_11", lootpage = "AugerersAttire" },
    { name = BIS["Shadoweave"], icon = "Interface\\Icons\\INV_Helmet_27", lootpage = "ShadoweaveSet" },
    { name = BIS["Diviner's Garments"], icon = "Interface\\Icons\\INV_Helmet_33", lootpage = "DivinersGarments" },
    { name = BIS["Pillager's Garb"], icon = "Interface\\Icons\\INV_Helmet_28", lootpage = "PillagersGarb" },
    { name = BIS["Mooncloth Regalia"], icon = "Interface\\Icons\\inv_misc_bandana_01", lootpage = "MoonclothRegalia" },
    { name = BIS["Bloodvine Garb"], icon = "Interface\\Icons\\INV_Pants_Cloth_14", lootpage = "BloodvineG" },
    { name = BIS["Flarecore Regalia"], icon = "Interface\\Icons\\inv_chest_cloth_18", lootpage = "FlarecoreRegalia" },
    { name = BIS["Dreamthread Regalia"], icon = "Interface\\Icons\\INV_Gauntlets_23", lootpage = "DreamthreadRegalia" },
    {},
    {},
    {},
    {},
    {},
    { name = RED..BS["Leatherworking"], "Leather", libExtra = L, icon = "Interface\\Icons\\INV_Chest_Leather_04", isheader = true },
    {},
    { name = BIS["Grifter's Armor"], icon = "Interface\\Icons\\INV_Helmet_33", lootpage = "GriftersArmor" },
    { name = BIS["Primalist's Trappings"], icon = "Interface\\Icons\\Inv_Chest_Plate06", lootpage = "PrimalistsTrappings" },
    { name = BIS["Volcanic Armor"], extra = "Fire Resistance Gear", libExtra = L, icon = "Interface\\Icons\\INV_Pants_06", lootpage = "VolcanicArmor" },
    { name = BIS["Ironfeather Armor"], icon = "Interface\\Icons\\INV_Chest_Leather_06", lootpage = "IronfeatherArmor" },
    { name = BIS["Stormshroud Armor"], icon = "Interface\\Icons\\INV_Chest_Leather_08", lootpage = "StormshroudArmor" },
    { name = BIS["Devilsaur Armor"], icon = "Interface\\Icons\\INV_Pants_Wolf", lootpage = "DevilsaurArmor" },
    { name = BIS["Blood Tiger Harness"], icon = "Interface\\Icons\\INV_Shoulder_23", lootpage = "BloodTigerH" },
    { name = BIS["Primal Batskin"], icon = "Interface\\Icons\\INV_Chest_Leather_03", lootpage = "PrimalBatskin" },
    { name = BIS["Convergence of the Elements"], icon = "Interface\\Icons\\INV_Helmet_13", lootpage = "ConvergenceoftheElements" },
    { name = BIS["Dreamhide Battlegarb"], icon = "Interface\\Icons\\inv_shoulder_18", lootpage = "DreamhideBattlegarb" },
}

function AtlasLootCraftedSetMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", L["Crafted Sets"])
    AtlasLoot_ShowMenu(craftedSetMenuData, { maxItems = table.getn(craftedSetMenuData) })
end

local craftedSet2MenuData = {
    { name = RED..BS["Leatherworking"], extra = "Mail", libExtra = L, icon = "Interface\\Icons\\INV_Chest_Chain_12", isheader = true },
    {},
    { name = BIS["Red Dragon Mail"], extra = "Fire Resistance Gear", libExtra = L, icon = "Interface\\Icons\\inv_chest_chain_06", lootpage = "RedDragonM" },
    { name = BIS["Green Dragon Mail"], extra = "Nature Resistance Gear", libExtra = L, icon = "Interface\\Icons\\INV_Pants_05", lootpage = "GreenDragonM" },
    { name = BIS["Blue Dragon Mail"], extra = "Arcane Resistance Gear", libExtra = L, icon = "Interface\\Icons\\INV_Chest_Chain_04", lootpage = "BlueDragonM" },
    { name = BIS["Black Dragon Mail"], extra = "Fire Resistance Gear", libExtra = L, icon = "Interface\\Icons\\INV_Pants_03", lootpage = "BlackDragonM" },
    {},
    { name = RED..BS["Blacksmithing"], extra = "Mail", libExtra = L, icon = "Interface\\Icons\\INV_Chest_Chain_04", isheader = true },
    { name = BIS["Bloodsoul Embrace"], icon = "Interface\\Icons\\INV_Shoulder_15", lootpage = "BloodsoulEmbrace" },
    { name = BIS["Hateforge Armor"], icon = "Interface\\Icons\\INV_Helmet_10", lootpage = "HateforgeArmor" },
    { name = BIS["Towerforge Battlegear"], icon = "Interface\\Icons\\INV_Helmet_37", lootpage = "TowerforgeBattlegear" },
    {},
    {},
    {},
    {},
    { name = RED..BS["Blacksmithing"], extra = "Plate", libExtra = L, icon = "Interface\\Icons\\INV_Chest_Chain_04", isheader = true },
    {},
    { name = BIS["Steel Plate"], icon = "Interface\\Icons\\INV_Helmet_25", lootpage = "SteelPlate" },
    { name = BIS["Imperial Plate"], icon = "Interface\\Icons\\INV_Belt_01", lootpage = "ImperialPlate" },
    { name = BIS["Rune-Etched Armor"], icon = "Interface\\Icons\\inv_helmet_06", lootpage = "RuneEtchedArmor" },
    { name = BIS["The Darksoul"], icon = "Interface\\Icons\\INV_Shoulder_01", lootpage = "TheDarksoul" },
    { name = BIS["Dreamsteel Armor"], icon = "Interface\\Icons\\INV_Bracer_03", lootpage = "DreamsteelArmor" },
}

function AtlasLootCraftedSet2Menu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", "Crafted Sets 2")
    AtlasLoot_ShowMenu(craftedSet2MenuData, { maxItems = table.getn(craftedSet2MenuData) })
end

local alchemyMenuData = {
    {},
    { name = BS["Alchemy"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyApprentice1" },
    { name = BS["Alchemy"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyJourneyman1" },
    { name = BS["Alchemy"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyExpert1" },
    { name = BS["Alchemy"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyArtisan1" },
    {},
    { name = BS["Alchemy"]..": "..L["Flasks"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyFlasks1" },
    { name = BS["Alchemy"]..": "..L["Protection Potions"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyProtectionPots1" },
    { name = BS["Alchemy"]..": "..L["Healing and Mana Potions"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyHealingAndMana1" },
    { name = BS["Alchemy"]..": "..L["Transmutes"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyTransmutes1" },
    { name = BS["Alchemy"]..": "..L["Defensive Potions and Elixirs"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyDefensive1" },
    { name = BS["Alchemy"]..": "..L["Offensive Potions and Elixirs"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyOffensive1" },
    { name = BS["Alchemy"]..": "..L["Other"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyOther1" },
}

function AtlasLoot_AlchemyMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Alchemy"])
    AtlasLoot_ShowMenu(alchemyMenuData, { maxItems = table.getn(alchemyMenuData) })
end

local smithingMenuData = {
    {},
    { name = BS["Blacksmithing"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingApprentice1" },
    { name = BS["Blacksmithing"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingJourneyman1" },
    { name = BS["Blacksmithing"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingExpert1" },
    { name = BS["Blacksmithing"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingArtisan1" },
    {},
    { name = BS["Blacksmithing"]..": "..L["Helm"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingHelm1" },
    { name = BS["Blacksmithing"]..": "..L["Shoulders"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingShoulders1" },
    { name = BS["Blacksmithing"]..": "..L["Chest"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingChest1" },
    { name = BS["Blacksmithing"]..": "..L["Bracers"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingBracers1" },
    { name = BS["Blacksmithing"]..": "..L["Gloves"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingGloves1" },
    { name = BS["Blacksmithing"]..": "..L["Belt"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingBelt1" },
    { name = BS["Blacksmithing"]..": "..L["Pants"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingPants1" },
    { name = BS["Blacksmithing"]..": "..L["Boots"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingBoots1" },
    { name = BS["Blacksmithing"]..": "..L["Shields"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingShields1" },
    {},
    { name = BS["Blacksmithing"]..": "..L["Weapons"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingWeapons1" },
    { name = BS["Blacksmithing"]..": "..L["Other"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingOther1" },
}

function AtlasLoot_SmithingMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Blacksmithing"])
    AtlasLoot_ShowMenu(smithingMenuData, { maxItems = table.getn(smithingMenuData) })
end

local enchantingMenuData = {
    {},
    { name = BS["Enchanting"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingApprentice1" },
    { name = BS["Enchanting"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingJourneyman1" },
    { name = BS["Enchanting"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingExpert1" },
    { name = BS["Enchanting"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingArtisan1" },
    {},
    { name = BS["Enchanting"]..": "..L["Cloak"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingCloak1" },
    { name = BS["Enchanting"]..": "..L["Chest"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingChest1" },
    { name = BS["Enchanting"]..": "..L["Bracers"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingBracer1" },
    { name = BS["Enchanting"]..": "..L["Gloves"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingGlove1" },
    { name = BS["Enchanting"]..": "..L["Boots"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingBoots1" },
    { name = BS["Enchanting"]..": "..L["2H Weapon"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "Enchanting2HWeapon1" },
    { name = BS["Enchanting"]..": "..L["Weapon"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingWeapon1" },
    { name = BS["Enchanting"]..": "..L["Shield"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingShield1" },
    { name = BS["Enchanting"]..": "..L["Misc"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingMisc1" },
}

function AtlasLoot_EnchantingMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Enchanting"])
    AtlasLoot_ShowMenu(enchantingMenuData, { maxItems = table.getn(enchantingMenuData) })
end

local engineeringMenuData = {
    {},
    { name = BS["Engineering"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringApprentice1" },
    { name = BS["Engineering"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringJourneyman1" },
    { name = BS["Engineering"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringExpert1" },
    { name = BS["Engineering"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringArtisan1" },
    {},
    { name = BS["Engineering"]..": "..L["Equipment"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringEquipment1" },
    { name = BS["Engineering"]..": "..L["Trinkets"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringTrinkets1" },
    { name = BS["Engineering"]..": "..L["Explosives"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringExplosives1" },
    { name = BS["Engineering"]..": "..L["Weapons"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringWeapons1" },
    { name = BS["Engineering"]..": "..L["Parts"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringParts1" },
    { name = BS["Engineering"]..": "..L["Misc"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringMisc1" },
    {},
    {},
    {},
    {},
    { name = L["Gnomish Engineering"], icon = "Interface\\Icons\\INV_Gizmo_02", lootpage = "Gnomish1" },
    { name = L["Goblin Engineering"], icon = "Interface\\Icons\\Spell_Fire_Selfdestruct", lootpage = "Goblin1" },
}

function AtlasLoot_EngineeringMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Engineering"])
    AtlasLoot_ShowMenu(engineeringMenuData, { maxItems = table.getn(engineeringMenuData) })
end

local leatherworkingMenuData = {
    {},
    { name = BS["Leatherworking"]..": "..L["Apprentice"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherApprentice1" },
    { name = BS["Leatherworking"]..": "..L["Journeyman"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherJourneyman1" },
    { name = BS["Leatherworking"]..": "..L["Expert"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherExpert1" },
    { name = BS["Leatherworking"]..": "..L["Artisan"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherArtisan1" },
    {},
    { name = BS["Leatherworking"]..": "..L["Helm"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherHelm1" },
    { name = BS["Leatherworking"]..": "..L["Shoulders"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherShoulders1" },
    { name = BS["Leatherworking"]..": "..L["Cloak"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherCloak1" },
    { name = BS["Leatherworking"]..": "..L["Chest"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherChest1" },
    { name = BS["Leatherworking"]..": "..L["Bracers"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBracers1" },
    { name = BS["Leatherworking"]..": "..L["Gloves"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherGloves1" },
    { name = BS["Leatherworking"]..": "..L["Belt"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBelt1" },
    { name = BS["Leatherworking"]..": "..L["Pants"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherPants1" },
    { name = BS["Leatherworking"]..": "..L["Boots"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBoots1" },
    {},
    { name = BS["Leatherworking"]..": "..L["Bags"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBags1" },
    { name = BS["Leatherworking"]..": "..L["Misc"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherMisc1" },
    {},
    { name = BS["Dragonscale Leatherworking"], icon = "Interface\\Icons\\INV_Misc_MonsterScales_03", lootpage = "Dragonscale1" },
    { name = BS["Tribal Leatherworking"], icon = "Interface\\Icons\\Spell_Nature_NullWard", lootpage = "Tribal1" },
    { name = BS["Elemental Leatherworking"], icon = "Interface\\Icons\\Spell_Fire_Volcano", lootpage = "Elemental1" },
}

function AtlasLoot_LeatherworkingMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Leatherworking"])
    AtlasLoot_ShowMenu(leatherworkingMenuData, { maxItems = table.getn(leatherworkingMenuData) })
end

local miningMenuData = {
    {},
    { name = BS["Mining"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "Mining1" },
    { name = BS["Smelting"], icon = "Interface\\Icons\\Spell_Fire_FlameBlades", lootpage = "Smelting1" },
}

function AtlasLoot_MiningMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Mining"])
    AtlasLoot_ShowMenu(miningMenuData, { maxItems = table.getn(miningMenuData) })
end

local tailoringMenuData = {
    {},
    { name = BS["Tailoring"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringApprentice1" },
    { name = BS["Tailoring"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringJourneyman1" },
    { name = BS["Tailoring"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringExpert1" },
    { name = BS["Tailoring"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringArtisan1" },
    {},
    { name = BS["Tailoring"]..": "..L["Helm"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringHelm1" },
    { name = BS["Tailoring"]..": "..L["Shoulders"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringShoulders1" },
    { name = BS["Tailoring"]..": "..L["Cloak"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringCloak1" },
    { name = BS["Tailoring"]..": "..L["Chest"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringChest1" },
    { name = BS["Tailoring"]..": "..L["Bracers"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBracers1" },
    { name = BS["Tailoring"]..": "..L["Gloves"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringGloves1" },
    { name = BS["Tailoring"]..": "..L["Belt"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBelt1" },
    { name = BS["Tailoring"]..": "..L["Pants"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringPants1" },
    { name = BS["Tailoring"]..": "..L["Boots"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBoots1" },
    {},
    { name = BS["Tailoring"]..": "..L["Shirt"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringShirt1" },
    { name = BS["Tailoring"]..": "..L["Bags"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBags1" },
    { name = BS["Tailoring"]..": "..L["Misc"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringMisc1" },
}

function AtlasLoot_TailoringMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Tailoring"])
    AtlasLoot_ShowMenu(tailoringMenuData, { maxItems = table.getn(tailoringMenuData) })
end

local jewelcraftMenuData = {
    {},
    { name = BS["Jewelcrafting"]..":"..L["Apprentice"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingApprentice1" },
    { name = BS["Jewelcrafting"]..":"..L["Journeyman"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingJourneyman1" },
    { name = BS["Jewelcrafting"]..":"..L["Expert"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingExpert1" },
    { name = BS["Jewelcrafting"]..":"..L["Artisan"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingArtisan1" },
    {},
    { name = BS["Jewelcrafting"]..":"..L["Gemstones"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingGemstones1" },
    { name = BS["Jewelcrafting"]..":"..L["Rings"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingRings1" },
    { name = BS["Jewelcrafting"]..":"..L["Amulets"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingAmulets1" },
    { name = BS["Jewelcrafting"]..":"..L["Head"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingHelm1" },
    { name = BS["Jewelcrafting"]..":"..L["Bracers"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingBracers1" },
    { name = BS["Jewelcrafting"]..":"..L["Off-hand"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingOffHands1" },
    { name = BS["Jewelcrafting"]..":"..L["Staff"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingStaves1" },
    { name = BS["Jewelcrafting"]..":"..L["Trinkets"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingTrinkets1" },
    { name = BS["Jewelcrafting"]..":"..L["Misc"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingMisc1" },
    {},
    { name = BS["Jewelcrafting"]..":"..BS["Gemology"], icon = "Interface\\Icons\\INV_Misc_Gem_Variety_01", lootpage = "JewelcraftingGemology1" },
    { name = BS["Jewelcrafting"]..":"..BS["Goldsmithing"], icon = "Interface\\Icons\\INV_Jewelry_Ring_03", lootpage = "JewelcraftingGoldsmithing1" },
}

function AtlasLoot_JewelcraftingMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Jewelcrafting"])
    AtlasLoot_ShowMenu(jewelcraftMenuData, { maxItems = table.getn(jewelcraftMenuData) })
end

local cookingMenuData = {
    {},
    { name = BS["Cooking"]..": "..L["Apprentice"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingApprentice1" },
    { name = BS["Cooking"]..": "..L["Journeyman"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingJourneyman1" },
    { name = BS["Cooking"]..": "..L["Expert"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingExpert1" },
    { name = BS["Cooking"]..": "..L["Artisan"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingArtisan1" },
}

function AtlasLoot_CookingMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", BS["Cooking"])
    AtlasLoot_ShowMenu(cookingMenuData, { maxItems = table.getn(cookingMenuData) })
end

local survivalMenuData = {
    {},
    { name = BS["Survival"], icon = "Interface\\Icons\\Trade_Survival", lootpage = "Survival1" },
    { name = BS["Garderning"], icon = "Interface\\Icons\\trade_herbalism", lootpage = "Survival2" },
}

function AtlasLoot_SurvivalMenu()
	AtlasLoot_PrepMenu("CRAFTINGMENU", L["Crafting"])
    AtlasLoot_ShowMenu(survivalMenuData, { maxItems = table.getn(survivalMenuData) })
end