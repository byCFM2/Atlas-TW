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
    { name = BS["Alchemy"], icon = "Interface\\Icons\\Trade_Alchemy", lootpage = "AtlasLoot_AlchemyMenu" },
    { name = BS["Blacksmithing"], icon = "Interface\\Icons\\Trade_BlackSmithing", lootpage = "AtlasLoot_SmithingMenu" },
    { name = BS["Enchanting"], icon = "Interface\\Icons\\Trade_Engraving", lootpage = "AtlasLoot_EnchantingMenu" },
    { name = BS["Engineering"], icon = "Interface\\Icons\\Trade_Engineering", lootpage = "AtlasLoot_EngineeringMenu" },
    { name = BS["Herbalism"], icon = "Interface\\Icons\\Trade_Herbalism", lootpage = "Herbalism" },
    { name = BS["Leatherworking"], icon = "Interface\\Icons\\INV_Misc_ArmorKit_17", lootpage = "AtlasLoot_LeatherworkingMenu" },
    { name = BS["Mining"]..", "..BS["Smelting"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "AtlasLoot_MiningMenu" },
    { name = BS["Tailoring"], icon = "Interface\\Icons\\Trade_Tailoring", lootpage = "AtlasLoot_TailoringMenu" },
    { name = BS["Jewelcrafting"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "AtlasLoot_JewelcraftingMenu" },
    { name = BS["Cooking"], icon = "Interface\\Icons\\INV_Misc_Food_15", lootpage = "AtlasLoot_CookingMenu" },
    { name = BS["First Aid"], icon = "Interface\\Icons\\Spell_Holy_SealOfSacrifice", lootpage = "FirstAid" },
    { name = BS["Survival"]..", "..BS["Gardening"], icon = "Interface\\Icons\\Trade_Survival", lootpage = "Survival" },
    {},
    { name = BS["Poisons"], extraText = BC["Rogue"], icon = "Interface\\Icons\\Trade_BrewPoison", lootpage = "Poisons" },
    {},
    { name = L["Crafted Sets"].." ("..BS["Cloth"]..", "..BS["Leather"]..")", icon = "Interface\\Icons\\INV_Box_01", lootpage = "AtlasLootCraftedSetMenu" },
    { name = L["Crafted Sets"].." ("..BS["Mail"]..", "..BS["Plate"]..")", icon = "Interface\\Icons\\INV_Box_02", lootpage = "AtlasLootCraftedSet2Menu" },
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
    { name = BS["Alchemy"]..": "..L["Apprentice"], lootpage = "AlchemyApprentice" },
    { name = BS["Alchemy"]..": "..L["Journeyman"], lootpage = "AlchemyJourneyman" },
    { name = BS["Alchemy"]..": "..L["Expert"], lootpage = "AlchemyExpert" },
    { name = BS["Alchemy"]..": "..L["Artisan"], lootpage = "AlchemyArtisan" },
    {},
    { name = BS["Alchemy"]..": "..L["Flasks"], lootpage = "AlchemyFlasks" },
    { name = BS["Alchemy"]..": "..L["Protection Potions"], lootpage = "AlchemyProtectionPots" },
    { name = BS["Alchemy"]..": "..L["Healing and Mana Potions"], lootpage = "AlchemyHealingAndMana" },
    { name = BS["Alchemy"]..": "..L["Transmutes"], lootpage = "AlchemyTransmutes" },
    { name = BS["Alchemy"]..": "..L["Defensive Potions and Elixirs"], lootpage = "AlchemyDefensive" },
    { name = BS["Alchemy"]..": "..L["Offensive Potions and Elixirs"], lootpage = "AlchemyOffensive" },
    { name = BS["Alchemy"]..": "..L["Other"], lootpage = "AlchemyOther" },
}

function AtlasLoot_AlchemyMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Alchemy"])
    AtlasLoot_ShowMenu(alchemyMenuData, { maxItems = table.getn(alchemyMenuData), defaultIcon = "Interface\\Icons\\Trade_Alchemy" })

end

local smithingMenuData = {
    {},
    { name = BS["Blacksmithing"]..": "..L["Apprentice"], lootpage = "SmithingApprentice" },
    { name = BS["Blacksmithing"]..": "..L["Journeyman"], lootpage = "SmithingJourneyman" },
    { name = BS["Blacksmithing"]..": "..L["Expert"], lootpage = "SmithingExpert" },
    { name = BS["Blacksmithing"]..": "..L["Artisan"], lootpage = "SmithingArtisan" },
    {},
    { name = BS["Blacksmithing"]..": "..L["Helm"], lootpage = "SmithingHelm" },
    { name = BS["Blacksmithing"]..": "..L["Shoulders"], lootpage = "SmithingShoulders" },
    { name = BS["Blacksmithing"]..": "..L["Chest"], lootpage = "SmithingChest" },
    { name = BS["Blacksmithing"]..": "..L["Bracers"], lootpage = "SmithingBracers" },
    { name = BS["Blacksmithing"]..": "..L["Gloves"], lootpage = "SmithingGloves" },
    { name = BS["Blacksmithing"]..":"..L["Belt"], lootpage = "SmithingBelt" },
    { name = BS["Blacksmithing"]..":"..L["Pants"], lootpage = "SmithingPants" },
    { name = BS["Blacksmithing"]..":"..L["Boots"], lootpage = "SmithingBoots" },
    { name = BS["Blacksmithing"]..":"..L["Belt Buckles"], lootpage = "SmithingBuckles" },
    {},
    { name = BS["Blacksmithing"]..": "..L["Axes"], lootpage = "SmithingAxes" },
    { name = BS["Blacksmithing"]..": "..L["Swords"], lootpage = "SmithingSwords" },
    { name = BS["Blacksmithing"]..": "..L["Maces"], lootpage = "SmithingMaces" },
    { name = BS["Blacksmithing"]..": "..L["Fist"], lootpage = "SmithingFist" },
    { name = BS["Blacksmithing"]..": "..L["Daggers"], lootpage = "SmithingDaggers" },
    { name = BS["Blacksmithing"]..":"..L["Misc"], lootpage = "SmithingMisc" },
    {},
    { name = BS["Blacksmithing"]..": "..BS["Armorsmith"], icon = "Interface\\Icons\\INV_Chest_Plate04", lootpage = "Armorsmith" },
    { name = BS["Blacksmithing"]..": "..BS["Weaponsmith"], icon = "Interface\\Icons\\INV_Sword_25", lootpage = "Weaponsmith" },
    { name = BS["Blacksmithing"]..": "..L["Master Axesmith"], icon = "Interface\\Icons\\INV_Axe_05", lootpage = "Axesmith" },
    { name = BS["Blacksmithing"]..": "..L["Master Hammersmith"], icon = "Interface\\Icons\\INV_Hammer_23", lootpage = "Hammersmith" },
    { name = BS["Blacksmithing"]..": "..L["Master Swordsmith"], icon = "Interface\\Icons\\INV_Sword_41", lootpage = "Swordsmith" },
}

function AtlasLoot_SmithingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Blacksmithing"])
    AtlasLoot_ShowMenu(smithingMenuData, { maxItems = table.getn(smithingMenuData), defaultIcon = "Interface\\Icons\\Trade_BlackSmithing" })

end

local enchantingMenuData = {
    {},
    { name = BS["Enchanting"]..": "..L["Apprentice"], lootpage = "EnchantingApprentice" },
    { name = BS["Enchanting"]..": "..L["Journeyman"], lootpage = "EnchantingJourneyman" },
    { name = BS["Enchanting"]..": "..L["Expert"], lootpage = "EnchantingExpert" },
    { name = BS["Enchanting"]..": "..L["Artisan"], lootpage = "EnchantingArtisan" },
    {},
    { name = BS["Enchanting"]..": "..L["Cloak"], lootpage = "EnchantingCloak" },
    { name = BS["Enchanting"]..": "..L["Chest"], lootpage = "EnchantingChest" },
    { name = BS["Enchanting"]..": "..L["Bracers"], lootpage = "EnchantingBracer" },
    { name = BS["Enchanting"]..": "..L["Gloves"], lootpage = "EnchantingGlove" },
    { name = BS["Enchanting"]..": "..L["Boots"], lootpage = "EnchantingBoots" },
    { name = BS["Enchanting"]..": "..L["2H Weapon"], lootpage = "Enchanting2HWeapon" },
    { name = BS["Enchanting"]..": "..L["Weapon"], lootpage = "EnchantingWeapon" },
    { name = BS["Enchanting"]..": "..L["Shield"], lootpage = "EnchantingShield" },
    { name = BS["Enchanting"]..": "..L["Misc"], lootpage = "EnchantingMisc" },
}

function AtlasLoot_EnchantingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Enchanting"])
    AtlasLoot_ShowMenu(enchantingMenuData, { maxItems = table.getn(enchantingMenuData), defaultIcon = "Interface\\Icons\\Trade_Engraving" })

end

local engineeringMenuData = {
    {},
    { name = BS["Engineering"]..": "..L["Apprentice"], lootpage = "EngineeringApprentice" },
    { name = BS["Engineering"]..": "..L["Journeyman"], lootpage = "EngineeringJourneyman" },
    { name = BS["Engineering"]..": "..L["Expert"], lootpage = "EngineeringExpert" },
    { name = BS["Engineering"]..": "..L["Artisan"], lootpage = "EngineeringArtisan" },
    {},
    { name = BS["Engineering"]..": "..L["Equipment"], lootpage = "EngineeringEquipment" },
    { name = BS["Engineering"]..": "..L["Trinkets"], lootpage = "EngineeringTrinkets" },
    { name = BS["Engineering"]..": "..L["Explosives"], lootpage = "EngineeringExplosives" },
    { name = BS["Engineering"]..": "..L["Weapons"], lootpage = "EngineeringWeapons" },
    { name = BS["Engineering"]..": "..L["Parts"], lootpage = "EngineeringParts" },
    { name = BS["Engineering"]..": "..L["Misc"], lootpage = "EngineeringMisc" },
    {},
    {},
    {},
    {},
    { name = L["Gnomish Engineering"], icon = "Interface\\Icons\\INV_Gizmo_02", lootpage = "Gnomish" },
    { name = L["Goblin Engineering"], icon = "Interface\\Icons\\Spell_Fire_Selfdestruct", lootpage = "Goblin" },
}

function AtlasLoot_EngineeringMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Engineering"])
    AtlasLoot_ShowMenu(engineeringMenuData, { maxItems = table.getn(engineeringMenuData), defaultIcon = "Interface\\Icons\\Trade_Engineering" })

end

local leatherworkingMenuData = {
    {},
    { name = BS["Leatherworking"]..": "..L["Apprentice"], lootpage = "LeatherApprentice" },
    { name = BS["Leatherworking"]..": "..L["Journeyman"], lootpage = "LeatherJourneyman" },
    { name = BS["Leatherworking"]..": "..L["Expert"], lootpage = "LeatherExpert" },
    { name = BS["Leatherworking"]..": "..L["Artisan"], lootpage = "LeatherArtisan" },
    {},
    { name = BS["Leatherworking"]..": "..L["Helm"], lootpage = "LeatherHelm" },
    { name = BS["Leatherworking"]..": "..L["Shoulders"], lootpage = "LeatherShoulders" },
    { name = BS["Leatherworking"]..": "..L["Cloak"], lootpage = "LeatherCloak" },
    { name = BS["Leatherworking"]..": "..L["Chest"], lootpage = "LeatherChest" },
    { name = BS["Leatherworking"]..": "..L["Bracers"], lootpage = "LeatherBracers" },
    { name = BS["Leatherworking"]..": "..L["Gloves"], lootpage = "LeatherGloves" },
    { name = BS["Leatherworking"]..": "..L["Belt"], lootpage = "LeatherBelt" },
    { name = BS["Leatherworking"]..": "..L["Pants"], lootpage = "LeatherPants" },
    { name = BS["Leatherworking"]..": "..L["Boots"], lootpage = "LeatherBoots" },
    {},
    { name = BS["Leatherworking"]..": "..L["Bags"], lootpage = "LeatherBags" },
    { name = BS["Leatherworking"]..": "..L["Misc"], lootpage = "LeatherMisc" },
    {},
    { name = BS["Dragonscale Leatherworking"], icon = "Interface\\Icons\\INV_Misc_MonsterScales_03", lootpage = "Dragonscale" },
    { name = BS["Tribal Leatherworking"], icon = "Interface\\Icons\\Spell_Nature_NullWard", lootpage = "Tribal" },
    { name = BS["Elemental Leatherworking"], icon = "Interface\\Icons\\Spell_Fire_Volcano", lootpage = "Elemental" },
}

function AtlasLoot_LeatherworkingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Leatherworking"])
    AtlasLoot_ShowMenu(leatherworkingMenuData, { maxItems = table.getn(leatherworkingMenuData), defaultIcon = "Interface\\Icons\\INV_Misc_ArmorKit_17" })

end

local miningMenuData = {
    {},
    { name = BS["Mining"], icon = "Interface\\Icons\\Trade_Mining", lootpage = "MiningTable" },
    { name = BS["Smelting"], icon = "Interface\\Icons\\Spell_Fire_FlameBlades", lootpage = "Smelting" },
}

function AtlasLoot_MiningMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Mining"])
    AtlasLoot_ShowMenu(miningMenuData, { maxItems = table.getn(miningMenuData) })
end

local tailoringMenuData = {
    {},
    { name = BS["Tailoring"]..": "..L["Apprentice"], lootpage = "TailoringApprentice" },
    { name = BS["Tailoring"]..": "..L["Journeyman"], lootpage = "TailoringJourneyman" },
    { name = BS["Tailoring"]..": "..L["Expert"], lootpage = "TailoringExpert" },
    { name = BS["Tailoring"]..": "..L["Artisan"], lootpage = "TailoringArtisan" },
    {},
    { name = BS["Tailoring"]..": "..L["Helm"], lootpage = "TailoringHelm" },
    { name = BS["Tailoring"]..": "..L["Shoulders"], lootpage = "TailoringShoulders" },
    { name = BS["Tailoring"]..": "..L["Cloak"], lootpage = "TailoringCloak" },
    { name = BS["Tailoring"]..": "..L["Chest"], lootpage = "TailoringChest" },
    { name = BS["Tailoring"]..": "..L["Bracers"], lootpage = "TailoringBracers" },
    { name = BS["Tailoring"]..": "..L["Gloves"], lootpage = "TailoringGloves" },
    { name = BS["Tailoring"]..": "..L["Belt"], lootpage = "TailoringBelt" },
    { name = BS["Tailoring"]..": "..L["Pants"], lootpage = "TailoringPants" },
    { name = BS["Tailoring"]..": "..L["Boots"], lootpage = "TailoringBoots" },
    {},
    { name = BS["Tailoring"]..": "..L["Shirt"], lootpage = "TailoringShirt" },
    { name = BS["Tailoring"]..": "..L["Bags"], lootpage = "TailoringBags" },
    { name = BS["Tailoring"]..": "..L["Misc"], lootpage = "TailoringMisc" },
}

function AtlasLoot_TailoringMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Tailoring"])
    AtlasLoot_ShowMenu(tailoringMenuData, { maxItems = table.getn(tailoringMenuData), defaultIcon = "Interface\\Icons\\Trade_Tailoring" })

end

local jewelcraftMenuData = {
    {},
    { name = BS["Jewelcrafting"]..": "..L["Apprentice"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingApprentice" },
    { name = BS["Jewelcrafting"]..": "..L["Journeyman"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingJourneyman" },
    { name = BS["Jewelcrafting"]..": "..L["Expert"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingExpert" },
    { name = BS["Jewelcrafting"]..": "..L["Artisan"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_11", lootpage = "JewelcraftingArtisan" },
    {},
    { name = BS["Jewelcrafting"]..": "..L["Gemstones"], lootpage = "JewelcraftingGemstones" },
    { name = BS["Jewelcrafting"]..": "..L["Rings"], lootpage = "JewelcraftingRings" },
    { name = BS["Jewelcrafting"]..": "..L["Amulets"], lootpage = "JewelcraftingAmulets" },
    { name = BS["Jewelcrafting"]..": "..L["Head"], lootpage = "JewelcraftingHelm" },
    { name = BS["Jewelcrafting"]..": "..L["Bracers"], lootpage = "JewelcraftingBracers" },
    { name = BS["Jewelcrafting"]..": "..L["Off-hand"], lootpage = "JewelcraftingOffHands" },
    { name = BS["Jewelcrafting"]..": "..L["Staff"], lootpage = "JewelcraftingStaves" },
    { name = BS["Jewelcrafting"]..": "..L["Trinkets"], lootpage = "JewelcraftingTrinkets" },
    { name = BS["Jewelcrafting"]..": "..L["Misc"], lootpage = "JewelcraftingMisc" },
    {},
    { name = BS["Jewelcrafting"]..": "..BS["Gemology"], icon = "Interface\\Icons\\INV_Misc_Gem_Variety_01", lootpage = "JewelcraftingGemology" },
    { name = BS["Jewelcrafting"]..": "..BS["Goldsmithing"], icon = "Interface\\Icons\\INV_Jewelry_Ring_03", lootpage = "JewelcraftingGoldsmithing" },
}

function AtlasLoot_JewelcraftingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Jewelcrafting"])
    AtlasLoot_ShowMenu(jewelcraftMenuData, { maxItems = table.getn(jewelcraftMenuData), defaultIcon = "Interface\\Icons\\INV_Jewelry_Necklace_01" })

end

local cookingMenuData = {
    {},
    { name = BS["Cooking"]..": "..L["Apprentice"], lootpage = "CookingApprentice" },
    { name = BS["Cooking"]..": "..L["Journeyman"], lootpage = "CookingJourneyman" },
    { name = BS["Cooking"]..": "..L["Expert"], lootpage = "CookingExpert" },
    { name = BS["Cooking"]..": "..L["Artisan"], lootpage = "CookingArtisan" },
}

function AtlasLoot_CookingMenu()
	AtlasLoot_PrepMenu("Crafting", BS["Cooking"])
    AtlasLoot_ShowMenu(cookingMenuData, { maxItems = table.getn(cookingMenuData), defaultIcon = "Interface\\Icons\\INV_Misc_Food_15" })

end