local L = AtlasTW.Local
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

local RED = "|cffff0000"

local function getExtraText(itemData)
    return itemData.extraText or ""
end

AtlasTW.Loot.CraftingMenuData = {
    {},
    { name = BS["Alchemy"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "Alchemy" },
    { name = BS["Blacksmithing"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "Blacksmithing" },
    { name = BS["Enchanting"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "Enchanting" },
    { name = BS["Engineering"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "Engineering" },
    { name = BS["Herbalism"], icon = "Interface\\Icons\\Trade_Herbalism", lootpage = "Herbalism" },
    { name = BS["Leatherworking"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "Leatherworking" },
    { name = BS["Mining"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "Mining" },
    { name = BS["Tailoring"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "Tailoring" },
    { name = BS["Jewelcrafting"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "Jewelcrafting" },
    { name = BS["Cooking"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "Cooking" },
    { name = BS["First Aid"], icon = "Interface\\Icons\\Spell_Holy_SealOfSacrifice", lootpage = "FirstAid" },
    { name = BS["Survival"], icon = "Interface\\Icons\\Trade_Survival", lootpage = "Survival" },
    {},
    { name = BS["Poisons"], extraText = BC["Rogue"], icon = "Interface\\Icons\\Trade_BrewPoison", lootpage = "Poisons" },
    {},
    { name = L["Crafted Sets"].." ("..BS["Cloth"]..", "..BS["Leather"]..")", icon = "Interface\\Icons\\INV_Box_01", lootpage = "CraftSet" },
    { name = L["Crafted Sets"].." ("..BS["Mail"]..", "..BS["Plate"]..")", icon = "Interface\\Icons\\INV_Box_02", lootpage = "CraftSet2" },
    {},
    { name = L["Crafted Epic Weapons"], icon = "Interface\\Icons\\INV_Hammer_Unique_Sulfuras", lootpage = "CraftedWeapons" },
}

function AtlasLoot_CraftingMenu()
	AtlasLoot_PrepMenu(nil, L["Crafting"], "Crafting")
    AtlasLoot_ShowMenu(AtlasTW.Loot.CraftingMenuData, { maxItems = table.getn(AtlasTW.Loot.CraftingMenuData), getExtraText = getExtraText })
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
    { name = RED..BS["Leatherworking"], Extra = BS["Leather"], icon = "Interface\\Icons\\INV_Chest_Leather_04", isheader = true },
    {},
    { name = BIS["Grifter's Armor"], icon = "Interface\\Icons\\INV_Helmet_33", lootpage = "GriftersArmor" },
    { name = BIS["Primalist's Trappings"], icon = "Interface\\Icons\\Inv_Chest_Plate06", lootpage = "PrimalistsTrappings" },
    { name = BIS["Volcanic Armor"], Extra = L["Fire Resistance Gear"], icon = "Interface\\Icons\\INV_Pants_06", lootpage = "VolcanicArmor" },
     { name = BIS["Ironfeather Armor"], icon = "Interface\\Icons\\INV_Chest_Leather_06", lootpage = "IronfeatherArmor" },
    { name = BIS["Stormshroud Armor"], icon = "Interface\\Icons\\INV_Chest_Leather_08", lootpage = "StormshroudArmor" },
    { name = BIS["Devilsaur Armor"], icon = "Interface\\Icons\\INV_Pants_Wolf", lootpage = "DevilsaurArmor" },
    { name = BIS["Blood Tiger Harness"], icon = "Interface\\Icons\\INV_Shoulder_23", lootpage = "BloodTigerH" },
    { name = BIS["Primal Batskin"], icon = "Interface\\Icons\\INV_Chest_Leather_03", lootpage = "PrimalBatskin" },
    { name = BIS["Convergence of the Elements"], icon = "Interface\\Icons\\INV_Helmet_13", lootpage = "ConvergenceoftheElements" },
    { name = BIS["Dreamhide Battlegarb"], icon = "Interface\\Icons\\inv_shoulder_18", lootpage = "DreamhideBattlegarb" },
}

function AtlasLootCraftedSetMenu()
	AtlasLoot_PrepMenu("Crafting", L["Crafted Sets"])
    AtlasLoot_ShowMenu(craftedSetMenuData, { maxItems = table.getn(craftedSetMenuData) })
end

local craftedSet2MenuData = {
    { name = RED..BS["Leatherworking"], Extra = BS["Mail"], icon = "Interface\\Icons\\INV_Chest_Chain_12", isheader = true },
    {},
    { name = BIS["Red Dragon Mail"], Extra = L["Fire Resistance Gear"], icon = "Interface\\Icons\\inv_chest_chain_06", lootpage = "RedDragonM" },
    { name = BIS["Green Dragon Mail"], Extra = L["Nature Resistance Gear"], icon = "Interface\\Icons\\INV_Pants_05", lootpage = "GreenDragonM" },
    { name = BIS["Blue Dragon Mail"], Extra = L["Arcane Resistance Gear"], icon = "Interface\\Icons\\INV_Chest_Chain_04", lootpage = "BlueDragonM" },
    { name = BIS["Black Dragon Mail"], Extra = L["Fire Resistance Gear"], icon = "Interface\\Icons\\INV_Pants_03", lootpage = "BlackDragonM" },
    {},
    { name = RED..BS["Blacksmithing"], Extra = BS["Mail"], icon = "Interface\\Icons\\INV_Chest_Chain_04", isheader = true },
    { name = BIS["Bloodsoul Embrace"], icon = "Interface\\Icons\\INV_Shoulder_15", lootpage = "BloodsoulEmbrace" },
    { name = BIS["Hateforge Armor"], icon = "Interface\\Icons\\INV_Helmet_10", lootpage = "HateforgeArmor" },
    { name = BIS["Towerforge Battlegear"], icon = "Interface\\Icons\\INV_Helmet_37", lootpage = "TowerforgeBattlegear" },
    {},
    {},
    {},
    {},
    { name = RED..BS["Blacksmithing"], extra = "Plate", libExtra = BS, icon = "Interface\\Icons\\INV_Chest_Chain_04", isheader = true },
    {},
    { name = BIS["Steel Plate Armor"], icon = "Interface\\Icons\\INV_Helmet_25", lootpage = "SteelPlate" },
    { name = BIS["Imperial Plate"], icon = "Interface\\Icons\\INV_Belt_01", lootpage = "ImperialPlate" },
    { name = BIS["Rune-Etched Armor"], icon = "Interface\\Icons\\inv_helmet_06", lootpage = "RuneEtchedArmor" },
    { name = BIS["The Darksoul"], icon = "Interface\\Icons\\INV_Shoulder_01", lootpage = "TheDarksoul" },
    { name = BIS["Dreamsteel Armor"], icon = "Interface\\Icons\\INV_Bracer_03", lootpage = "DreamsteelArmor" },
}

function AtlasLootCraftedSet2Menu()
	AtlasLoot_PrepMenu("Crafting", L["Crafted Sets"].." 2")
    AtlasLoot_ShowMenu(craftedSet2MenuData, { maxItems = table.getn(craftedSet2MenuData) })
end

local alchemyMenuData = {
    {},
    { name = BS["Alchemy"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyApprentice" },
    { name = BS["Alchemy"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyJourneyman" },
    { name = BS["Alchemy"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyExpert" },
    { name = BS["Alchemy"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyArtisan" },
    {},
    { name = BS["Alchemy"]..": "..L["Flasks"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyFlasks" },
    { name = BS["Alchemy"]..": "..L["Protection Potions"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyProtectionPots" },
    { name = BS["Alchemy"]..": "..L["Healing and Mana Potions"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyHealingAndMana" },
    { name = BS["Alchemy"]..": "..L["Transmutes"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyTransmutes" },
    { name = BS["Alchemy"]..": "..L["Defensive Potions and Elixirs"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyDefensive" },
    { name = BS["Alchemy"]..": "..L["Offensive Potions and Elixirs"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyOffensive" },
    { name = BS["Alchemy"]..": "..L["Other"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AlchemyOther" },
}

function AtlasLoot_AlchemyMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Alchemy"])
    AtlasLoot_ShowMenu(alchemyMenuData, { maxItems = table.getn(alchemyMenuData) })
end

local smithingMenuData = {
    {},
    { name = BS["Blacksmithing"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingApprentice" },
    { name = BS["Blacksmithing"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingJourneyman" },
    { name = BS["Blacksmithing"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingExpert" },
    { name = BS["Blacksmithing"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingArtisan" },
    {},
    { name = BS["Blacksmithing"]..": "..L["Helm"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingHelm" },
    { name = BS["Blacksmithing"]..": "..L["Shoulders"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingShoulders" },
    { name = BS["Blacksmithing"]..": "..L["Chest"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingChest" },
    { name = BS["Blacksmithing"]..": "..L["Bracers"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingBracers" },
    { name = BS["Blacksmithing"]..": "..L["Gloves"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingGloves" },
    { name = BS["Blacksmithing"]..":"..L["Belt"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingBelt" },
    { name = BS["Blacksmithing"]..":"..L["Pants"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingPants" },
    { name = BS["Blacksmithing"]..":"..L["Boots"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingBoots" },
    { name = BS["Blacksmithing"]..":"..L["Belt Buckles"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingBuckles" },
    {},
    { name = BS["Blacksmithing"]..": "..L["Axes"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingAxes" },
    { name = BS["Blacksmithing"]..": "..L["Swords"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingSwords" },
    { name = BS["Blacksmithing"]..": "..L["Maces"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingMaces" },
    { name = BS["Blacksmithing"]..": "..L["Fist"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingFist" },
    { name = BS["Blacksmithing"]..": "..L["Daggers"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingDaggers" },
    { name = BS["Blacksmithing"]..":"..L["Misc"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "SmithingMisc" },
    {},
    { name = BS["Blacksmithing"]..": "..BS["Armorsmith"], icon = "Interface\\Icons\\INV_Chest_Plate04", lootpage = "Armorsmith" },
    { name = BS["Blacksmithing"]..": "..BS["Weaponsmith"], icon = "Interface\\Icons\\INV_Sword_25", lootpage = "Weaponsmith" },
    { name = BS["Blacksmithing"]..": "..L["Master Axesmith"], icon = "Interface\\Icons\\INV_Axe_05", lootpage = "Axesmith" },
    { name = BS["Blacksmithing"]..": "..L["Master Hammersmith"], icon = "Interface\\Icons\\INV_Hammer_23", lootpage = "Hammersmith" },
    { name = BS["Blacksmithing"]..": "..L["Master Swordsmith"], icon = "Interface\\Icons\\INV_Sword_41", lootpage = "Swordsmith" },
}

function AtlasLoot_SmithingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Blacksmithing"])
    AtlasLoot_ShowMenu(smithingMenuData, { maxItems = table.getn(smithingMenuData) })
end

local enchantingMenuData = {
    {},
    { name = BS["Enchanting"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingApprentice" },
    { name = BS["Enchanting"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingJourneyman" },
    { name = BS["Enchanting"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingExpert" },
    { name = BS["Enchanting"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingArtisan" },
    {},
    { name = BS["Enchanting"]..": "..L["Cloak"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingCloak" },
    { name = BS["Enchanting"]..": "..L["Chest"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingChest" },
    { name = BS["Enchanting"]..": "..L["Bracers"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingBracer" },
    { name = BS["Enchanting"]..": "..L["Gloves"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingGlove" },
    { name = BS["Enchanting"]..": "..L["Boots"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingBoots" },
    { name = BS["Enchanting"]..": "..L["2H Weapon"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "Enchanting2HWeapon" },
    { name = BS["Enchanting"]..": "..L["Weapon"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingWeapon" },
    { name = BS["Enchanting"]..": "..L["Shield"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingShield" },
    { name = BS["Enchanting"]..": "..L["Misc"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "EnchantingMisc" },
}

function AtlasLoot_EnchantingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Enchanting"])
    AtlasLoot_ShowMenu(enchantingMenuData, { maxItems = table.getn(enchantingMenuData) })
end

local engineeringMenuData = {
    {},
    { name = BS["Engineering"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringApprentice" },
    { name = BS["Engineering"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringJourneyman" },
    { name = BS["Engineering"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringExpert" },
    { name = BS["Engineering"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringArtisan" },
    {},
    { name = BS["Engineering"]..": "..L["Equipment"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringEquipment" },
    { name = BS["Engineering"]..": "..L["Trinkets"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringTrinkets" },
    { name = BS["Engineering"]..": "..L["Explosives"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringExplosives" },
    { name = BS["Engineering"]..": "..L["Weapons"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringWeapons" },
    { name = BS["Engineering"]..": "..L["Parts"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringParts" },
    { name = BS["Engineering"]..": "..L["Misc"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "EngineeringMisc" },
    {},
    {},
    {},
    {},
    { name = L["Gnomish Engineering"], icon = "Interface\\Icons\\INV_Gizmo_02", lootpage = "Gnomish" },
    { name = L["Goblin Engineering"], icon = "Interface\\Icons\\Spell_Fire_Selfdestruct", lootpage = "Goblin" },
}

function AtlasLoot_EngineeringMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Engineering"])
    AtlasLoot_ShowMenu(engineeringMenuData, { maxItems = table.getn(engineeringMenuData) })
end

local leatherworkingMenuData = {
    {},
    { name = BS["Leatherworking"]..": "..L["Apprentice"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherApprentice" },
    { name = BS["Leatherworking"]..": "..L["Journeyman"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherJourneyman" },
    { name = BS["Leatherworking"]..": "..L["Expert"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherExpert" },
    { name = BS["Leatherworking"]..": "..L["Artisan"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherArtisan" },
    {},
    { name = BS["Leatherworking"]..": "..L["Helm"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherHelm" },
    { name = BS["Leatherworking"]..": "..L["Shoulders"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherShoulders" },
    { name = BS["Leatherworking"]..": "..L["Cloak"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherCloak" },
    { name = BS["Leatherworking"]..": "..L["Chest"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherChest" },
    { name = BS["Leatherworking"]..": "..L["Bracers"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBracers" },
    { name = BS["Leatherworking"]..": "..L["Gloves"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherGloves" },
    { name = BS["Leatherworking"]..": "..L["Belt"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBelt" },
    { name = BS["Leatherworking"]..": "..L["Pants"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherPants" },
    { name = BS["Leatherworking"]..": "..L["Boots"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBoots" },
    {},
    { name = BS["Leatherworking"]..": "..L["Bags"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherBags" },
    { name = BS["Leatherworking"]..": "..L["Misc"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "LeatherMisc" },
    {},
    { name = BS["Dragonscale Leatherworking"], icon = "Interface\\Icons\\INV_Misc_MonsterScales_03", lootpage = "Dragonscale" },
    { name = BS["Tribal Leatherworking"], icon = "Interface\\Icons\\Spell_Nature_NullWard", lootpage = "Tribal" },
    { name = BS["Elemental Leatherworking"], icon = "Interface\\Icons\\Spell_Fire_Volcano", lootpage = "Elemental" },
}

function AtlasLoot_LeatherworkingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Leatherworking"])
    AtlasLoot_ShowMenu(leatherworkingMenuData, { maxItems = table.getn(leatherworkingMenuData) })
end

local miningMenuData = {
    {},
    { name = BS["Mining"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "Mining" },
    { name = BS["Smelting"], icon = "Interface\\Icons\\Spell_Fire_FlameBlades", lootpage = "Smelting" },
}

function AtlasLoot_MiningMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Mining"])
    AtlasLoot_ShowMenu(miningMenuData, { maxItems = table.getn(miningMenuData) })
end

local tailoringMenuData = {
    {},
    { name = BS["Tailoring"]..": "..L["Apprentice"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringApprentice" },
    { name = BS["Tailoring"]..": "..L["Journeyman"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringJourneyman" },
    { name = BS["Tailoring"]..": "..L["Expert"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringExpert" },
    { name = BS["Tailoring"]..": "..L["Artisan"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringArtisan" },
    {},
    { name = BS["Tailoring"]..": "..L["Helm"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringHelm" },
    { name = BS["Tailoring"]..": "..L["Shoulders"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringShoulders" },
    { name = BS["Tailoring"]..": "..L["Cloak"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringCloak" },
    { name = BS["Tailoring"]..": "..L["Chest"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringChest" },
    { name = BS["Tailoring"]..": "..L["Bracers"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBracers" },
    { name = BS["Tailoring"]..": "..L["Gloves"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringGloves" },
    { name = BS["Tailoring"]..": "..L["Belt"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBelt" },
    { name = BS["Tailoring"]..": "..L["Pants"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringPants" },
    { name = BS["Tailoring"]..": "..L["Boots"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBoots" },
    {},
    { name = BS["Tailoring"]..": "..L["Shirt"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringShirt" },
    { name = BS["Tailoring"]..": "..L["Bags"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringBags" },
    { name = BS["Tailoring"]..": "..L["Misc"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "TailoringMisc" },
}

function AtlasLoot_TailoringMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Tailoring"])
    AtlasLoot_ShowMenu(tailoringMenuData, { maxItems = table.getn(tailoringMenuData) })
end

local jewelcraftMenuData = {
    {},
    { name = BS["Jewelcrafting"]..":"..L["Apprentice"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingApprentice" },
    { name = BS["Jewelcrafting"]..":"..L["Journeyman"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingJourneyman" },
    { name = BS["Jewelcrafting"]..":"..L["Expert"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingExpert" },
    { name = BS["Jewelcrafting"]..":"..L["Artisan"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingArtisan" },
    {},
    { name = BS["Jewelcrafting"]..":"..L["Gemstones"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingGemstones" },
    { name = BS["Jewelcrafting"]..":"..L["Rings"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingRings" },
    { name = BS["Jewelcrafting"]..":"..L["Amulets"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingAmulets" },
    { name = BS["Jewelcrafting"]..":"..L["Head"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingHelm" },
    { name = BS["Jewelcrafting"]..":"..L["Bracers"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingBracers" },
    { name = BS["Jewelcrafting"]..":"..L["Off-hand"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingOffHands" },
    { name = BS["Jewelcrafting"]..":"..L["Staff"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingStaves" },
    { name = BS["Jewelcrafting"]..":"..L["Trinkets"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingTrinkets" },
    { name = BS["Jewelcrafting"]..":"..L["Misc"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_01", lootpage = "JewelcraftingMisc" },
    {},
    { name = BS["Jewelcrafting"]..":"..BS["Gemology"], icon = "Interface\\Icons\\INV_Misc_Gem_Variety_01", lootpage = "JewelcraftingGemology" },
    { name = BS["Jewelcrafting"]..":"..BS["Goldsmithing"], icon = "Interface\\Icons\\INV_Jewelry_Ring_03", lootpage = "JewelcraftingGoldsmithing" },
}

function AtlasLoot_JewelcraftingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Jewelcrafting"])
    AtlasLoot_ShowMenu(jewelcraftMenuData, { maxItems = table.getn(jewelcraftMenuData) })
end

local cookingMenuData = {
    {},
    { name = BS["Cooking"]..": "..L["Apprentice"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingApprentice" },
    { name = BS["Cooking"]..": "..L["Journeyman"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingJourneyman" },
    { name = BS["Cooking"]..": "..L["Expert"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingExpert" },
    { name = BS["Cooking"]..": "..L["Artisan"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "CookingArtisan" },
}

function AtlasLoot_CookingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Cooking"])
    AtlasLoot_ShowMenu(cookingMenuData, { maxItems = table.getn(cookingMenuData) })
end

local survivalMenuData = {
    {},
    { name = BS["Survival"], icon = "Interface\\Icons\\Trade_Survival", lootpage = "Survival" },
    { name = BS["Garderning"], icon = "Interface\\Icons\\trade_herbalism", lootpage = "Survival2" },
}

function AtlasLoot_SurvivalMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Survival"])
    AtlasLoot_ShowMenu(survivalMenuData, { maxItems = table.getn(survivalMenuData) })
end