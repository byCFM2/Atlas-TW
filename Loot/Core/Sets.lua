---
--- Sets.lua - Item sets and collections management
---
--- This module provides comprehensive set browsing functionality for all WoW item sets
--- in Atlas-TW. It organizes and displays various equipment sets including dungeon sets,
--- raid sets, PvP sets, and crafted sets with detailed information and requirements.
---
--- Features:
--- • Complete item set catalogs
--- • Set bonus information display
--- • Level and source requirement tracking
--- • Cross-set comparison tools
--- • Integration with Babble localization
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}
AtlasTW.Loot = AtlasTW.Loot or {}
local L = AtlasTW.Local
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

local data = AtlasLoot_Data

AtlasTW.MenuData.Sets = {
    { name = L["Pre 60 Sets"], icon = "Interface\\Icons\\INV_Sword_43", lootpage = "AtlasLootPRE60SetMenu" },
    { name = L["Zul'Gurub Sets"], icon = "Interface\\Icons\\INV_Sword_55", lootpage = "AtlasLootZGSetMenu" },
    { name = L["Ruins of Ahn'Qiraj Sets"], icon = "Interface\\Icons\\INV_Axe_15", lootpage = "AtlasLootAQ20SetMenu" },
    { name = L["Temple of Ahn'Qiraj Sets"], icon = "Interface\\Icons\\INV_Sword_59", lootpage = "AtlasLootAQ40SetMenu" },
    { name = L["Tower of Karazhan Sets"], icon = "Interface\\Icons\\INV_Staff_Medivh", lootpage = "AtlasLootUKSetMenu" },
    {},
    { name = "|cffffffff"..L["Priest Sets"], icon = "Interface\\Icons\\Spell_Holy_PowerWordShield", lootpage = "AtlasLootPriestSetMenu" },
    { name = "|cff68ccef"..L["Mage Sets"], icon = "Interface\\Icons\\Spell_Frost_IceStorm", lootpage = "AtlasLootMageSetMenu" },
    { name = "|cff9382c9"..L["Warlock Sets"], icon = "Interface\\Icons\\Spell_Shadow_CurseOfTounges", lootpage = "AtlasLootWarlockSetMenu" },
    { name = "|cfffff468"..L["Rogue Sets"], icon = "Interface\\Icons\\Ability_BackStab", lootpage = "AtlasLootRogueSetMenu" },
    { name = "|cffff7c0a"..L["Druid Sets"], icon = "Interface\\Icons\\Spell_Nature_Regeneration", lootpage = "AtlasLootDruidSetMenu" },
    { name = "|cffaad372"..L["Hunter Sets"], icon = "Interface\\Icons\\Ability_Hunter_RunningShot", lootpage = "AtlasLootHunterSetMenu" },
    { name = "|cff2773ff"..L["Shaman Sets"], icon = "Interface\\Icons\\Spell_FireResistanceTotem_01", lootpage = "AtlasLootShamanSetMenu" },
    { name = "|cfff48cba"..L["Paladin Sets"], icon = "Interface\\Icons\\Spell_Holy_SealOfMight", lootpage = "AtlasLootPaladinSetMenu" },
    { name = "|cffc69b6d"..L["Warrior Sets"], icon = "Interface\\Icons\\INV_Shield_05", lootpage = "AtlasLootWarriorSetMenu" },
    { name = L["Tier 0/0.5 Sets"], icon = "Interface\\Icons\\INV_Chest_Chain_03", lootpage = "AtlasLootT0SetMenu" },
    { name = L["Tier 1 Sets"], icon = "Interface\\Icons\\INV_Pants_Mail_03", lootpage = "AtlasLootT1SetMenu" },
    { name = L["Tier 2 Sets"], icon = "Interface\\Icons\\INV_Shoulder_32", lootpage = "AtlasLootT2SetMenu" },
    { name = L["Tier 3 Sets"], icon = "Interface\\Icons\\INV_Chest_Plate02", lootpage = "AtlasLootT3SetMenu" },
    {},
    { name = L["World Blues"], icon = "Interface\\Icons\\INV_Box_01", lootpage = "AtlasLootWorldBluesMenu" },
    { name = L["World Epics"], icon = "Interface\\Icons\\INV_Box_04", lootpage = "WorldEpics" },
    { name = L["Legendary Items"], icon = "Interface\\Icons\\INV_Staff_Medivh", lootpage = "Legendaries" },
    { name = L["Artifact Items"], icon = "Interface\\Icons\\INV_Sword_07", lootpage = "Artifacts" },
    { name = L["Rare Pets"], icon = "Interface\\Icons\\Ability_Seal", lootpage = "RarePets" },
    { name = L["Rare Mounts"], icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_05", lootpage = "RareMounts" },
    { name = L["Old Mounts"], icon = "Interface\\Icons\\Ability_Mount_RidingHorse", lootpage = "OldMounts" },
    { name = L["Tabards"], icon = "Interface\\Icons\\INV_Shirt_GuildTabard_01", lootpage = "Tabards" },
}

---
--- Main sets menu function
--- @return nil
--- @usage AtlasLootSetMenu()
--- @since 1.0.0
---
function AtlasLootSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Collections"], AtlasTW.MenuData.Sets)
end

AtlasTW.MenuData.WorldBlues = {
    {},
    { name = L["Head"], icon = "Interface\\Icons\\INV_Helmet_01", lootpage = "WorldBluesHead" },
    { name = L["Neck"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "WorldBluesNeck" },
    { name = L["Shoulder"], icon = "Interface\\Icons\\INV_Shoulder_02", lootpage = "WorldBluesShoulder" },
    { name = L["Back"], icon = "Interface\\Icons\\INV_Misc_Cape_19", lootpage = "WorldBluesBack" },
    { name = L["Chest"], icon = "Interface\\Icons\\INV_Chest_Cloth_51", lootpage = "WorldBluesChest" },
    { name = L["Wrist"], icon = "Interface\\Icons\\INV_Bracer_01", lootpage = "WorldBluesWrist" },
    { name = L["Hands"], icon = "Interface\\Icons\\INV_Gauntlets_14", lootpage = "WorldBluesHands" },
    { name = L["Waist"], icon = "Interface\\Icons\\INV_Belt_02", lootpage = "WorldBluesWaist" },
    { name = L["Legs"], icon = "Interface\\Icons\\INV_Pants_01", lootpage = "WorldBluesLegs" },
    { name = L["Feet"], icon = "Interface\\Icons\\INV_Boots_01", lootpage = "WorldBluesFeet" },
    { name = L["Rings"], icon = "Interface\\Icons\\INV_Jewelry_Ring_13", lootpage = "WorldBluesRing" },
    { name = L["Trinkets"], icon = "Interface\\Icons\\INV_Misc_EngGizmos_12", lootpage = "WorldBluesTrinket" },
    { name = L["Wands"], icon = "Interface\\Icons\\INV_Wand_05", lootpage = "WorldBluesWand" },
    { name = L["Off Hand"].." & "..L["Relics"], icon = "Interface\\Icons\\INV_Misc_Book_06", lootpage = "WorldBluesHeldInOffhand" },
    {},
    { name = L["One-Handed Axes"], icon = "Interface\\Icons\\INV_ThrowingAxe_01", lootpage = "WorldBlues1HAxes" },
    { name = L["One-Handed Maces"], icon = "Interface\\Icons\\INV_Hammer_15", lootpage = "WorldBlues1HMaces" },
    { name = L["One-Handed Swords"], icon = "Interface\\Icons\\INV_Sword_05", lootpage = "WorldBlues1HSwords" },
    { name = L["Two-Handed Axes"], icon = "Interface\\Icons\\INV_ThrowingAxe_06", lootpage = "WorldBlues2HAxes" },
    { name = L["Two-Handed Maces"], icon = "Interface\\Icons\\INV_Hammer_17", lootpage = "WorldBlues2HMaces" },
    { name = L["Two-Handed Swords"], icon = "Interface\\Icons\\INV_Sword_23", lootpage = "WorldBlues2HSwords" },
    { name = L["Daggers"], icon = "Interface\\Icons\\INV_Sword_33", lootpage = "WorldBluesDaggers" },
    { name = L["Fist Weapons"], icon = "Interface\\Icons\\INV_Gauntlets_04", lootpage = "WorldBluesFistWeapons" },
    { name = L["Polearms"], icon = "Interface\\Icons\\INV_Spear_05", lootpage = "WorldBluesPolearms" },
    { name = L["Staves"], icon = "Interface\\Icons\\INV_Staff_29", lootpage = "WorldBluesStaves" },
    { name = L["Bows"], icon = "Interface\\Icons\\INV_Weapon_Bow_02", lootpage = "WorldBluesBows" },
    { name = L["Crossbows"], icon = "Interface\\Icons\\INV_Weapon_Crossbow_02", lootpage = "WorldBluesCrossbows" },
    { name = L["Guns"], icon = "Interface\\Icons\\INV_Weapon_Rifle_07", lootpage = "WorldBluesGuns" },
    { name = L["Shields"], icon = "Interface\\Icons\\INV_Shield_04", lootpage = "WorldBluesShields" },
}

---
--- World blues menu function
--- @return nil
--- @usage AtlasLootWorldBluesMenu()
--- @since 1.0.0
---
function AtlasLootWorldBluesMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["World Blues"], AtlasTW.MenuData.WorldBlues, L["Collections"])
end

---
--- Creates class-specific set menu data
--- @param class string - The class name (e.g., "Priest", "Mage")
--- @param color string - Color code for the class
--- @param icon string - Icon path for the class
--- @return table - Menu data table for the class
--- @usage local priestMenu = createClassSetMenu("Priest", "|cffffffff", "Interface\\Icons\\Spell_Holy_PowerWordShield")
--- @since 1.0.0
---
local function createClassSetMenu(class, color, icon)
    local menuData = {
        { name = color..L["Tier 0/0.5 Sets"], icon = icon, lootpage = "T0"..class },
        { name = color..L["Tier 1 Sets"], icon = icon, lootpage = "T1"..class },
        { name = color..L["Zul'Gurub Sets"], icon = icon, lootpage = "ZG"..class },
        { name = color..L["Ruins of Ahn'Qiraj Sets"], icon = icon, lootpage = "AQ20"..class },
        { name = color..L["Tier 2 Sets"], icon = icon, lootpage = "T2"..class },
        { name = color..L["Temple of Ahn'Qiraj Sets"], icon = icon, lootpage = "AQ40"..class },
        { name = color..L["Tier 3 Sets"], icon = icon, lootpage = "T3"..class },
        { name = color..L["Tower of Karazhan Sets"], icon = icon, lootpage = "T35"..class },
    }
    return menuData
end

AtlasTW.MenuData.Priest = createClassSetMenu("Priest", "|cffffffff", "Interface\\Icons\\Spell_Holy_PowerWordShield")
AtlasTW.MenuData.Mage = createClassSetMenu("Mage", "|cff68ccef", "Interface\\Icons\\Spell_Frost_IceStorm")
AtlasTW.MenuData.Warlock = createClassSetMenu("Warlock", "|cff9382c9", "Interface\\Icons\\Spell_Shadow_CurseOfTounges")
AtlasTW.MenuData.Rogue = createClassSetMenu("Rogue", "|cfffff468", "Interface\\Icons\\Ability_BackStab")
AtlasTW.MenuData.Druid = createClassSetMenu("Druid", "|cffff7c0a", "Interface\\Icons\\Spell_Nature_Regeneration")
AtlasTW.MenuData.Hunter = createClassSetMenu("Hunter", "|cffaad372", "Interface\\Icons\\Ability_Hunter_RunningShot")
AtlasTW.MenuData.Shaman = createClassSetMenu("Shaman", "|cff2773ff", "Interface\\Icons\\Spell_FireResistanceTotem_01")
AtlasTW.MenuData.Paladin = createClassSetMenu("Paladin", "|cfff48cba", "Interface\\Icons\\Spell_Holy_SealOfMight")
AtlasTW.MenuData.Warrior = createClassSetMenu("Warrior", "|cffc69b6d", "Interface\\Icons\\INV_Shield_05")

---
--- Priest sets menu function
--- @return nil
--- @usage AtlasLootPriestSetMenu()
--- @since 1.0.0
---
function AtlasLootPriestSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Priest Sets"], AtlasTW.MenuData.Priest, L["Collections"])
end

---
--- Mage sets menu function
--- @return nil
--- @usage AtlasLootMageSetMenu()
--- @since 1.0.0
---
function AtlasLootMageSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Mage Sets"], AtlasTW.MenuData.Mage, L["Collections"])
end

---
--- Warlock sets menu function
--- @return nil
--- @usage AtlasLootWarlockSetMenu()
--- @since 1.0.0
---
function AtlasLootWarlockSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Warlock Sets"], AtlasTW.MenuData.Warlock, L["Collections"])
end

---
--- Rogue sets menu function
--- @return nil
--- @usage AtlasLootRogueSetMenu()
--- @since 1.0.0
---
function AtlasLootRogueSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Rogue Sets"], AtlasTW.MenuData.Rogue, L["Collections"])
end

---
--- Druid sets menu function
--- @return nil
--- @usage AtlasLootDruidSetMenu()
--- @since 1.0.0
---
function AtlasLootDruidSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Druid Sets"], AtlasTW.MenuData.Druid, L["Collections"])
end

---
--- Hunter sets menu function
--- @return nil
--- @usage AtlasLootHunterSetMenu()
--- @since 1.0.0
---
function AtlasLootHunterSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Hunter Sets"], AtlasTW.MenuData.Hunter, L["Collections"])
end

---
--- Shaman sets menu function
--- @return nil
--- @usage AtlasLootShamanSetMenu()
--- @since 1.0.0
---
function AtlasLootShamanSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Shaman Sets"], AtlasTW.MenuData.Shaman, L["Collections"])
end

---
--- Paladin sets menu function
--- @return nil
--- @usage AtlasLootPaladinSetMenu()
--- @since 1.0.0
---
function AtlasLootPaladinSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Paladin Sets"], AtlasTW.MenuData.Paladin, L["Collections"])
end

---
--- Warrior sets menu function
--- @return nil
--- @usage AtlasLootWarriorSetMenu()
--- @since 1.0.0
---
function AtlasLootWarriorSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Warrior Sets"], AtlasTW.MenuData.Warrior, L["Collections"])
end

AtlasTW.MenuData.Pre60Sets = {
    { name = BIS["Defias Leather"], extra = "The Deadmines", icon = "Interface\\Icons\\INV_Pants_12", lootpage = "Deadmines" },
    { name = BIS["Embrace of the Viper"], extra = "Wailing Caverns", icon = "Interface\\Icons\\INV_Shirt_16", lootpage = "Wailing" },
    { name = BIS["Dragonmaw Battlegarb"], extra = "Dragonmaw Retreat", icon = "Interface\\Icons\\INV_misc_bone_taurenskull_01", lootpage = "DragonmawBattlegarb" },
    { name = BIS["Chain of the Scarlet Crusade"], extra = "Scarlet Monastery", icon = "Interface\\Icons\\INV_Gauntlets_19", lootpage = "Scarlet" },
    { name = BIS["Stormreaver Attire"], extra = "Stormwrought Ruins", icon = "Interface\\Icons\\INV_Gauntlets_09", lootpage = "Stormreaver" },
    { name = BIS["Greymane Armor"], extra = "Gilneas City", icon = "Interface\\Icons\\inv_helmet_02", lootpage = "GreymaneArmor" },
    { name = BIS["Incendosaur Skin Armor"], extra = "Hateforge Quarry", icon = "Interface\\Icons\\INV_Shoulder_23", lootpage = "IncendosaurSkinArmor" },
    { name = BIS["The Gladiator"], extra = "Blackrock Depths", icon = "Interface\\Icons\\INV_Helmet_01", lootpage = "TheGladiator" },
    { name = BIS["Ironweave Battlesuit"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Boots_Cloth_05", lootpage = "Ironweave" },
    { name = BIS["The Postmaster"], extra = "Stratholme", icon = "Interface\\Icons\\INV_Boots_02", lootpage = "Strat" },
    { name = BZ["Scholomance"].." "..L["Sets"], extra = "Scholomance", icon = "Interface\\Icons\\INV_Shoulder_02", lootpage = "Scholo" },
    { name = L["Scourge Invasion"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Jewelry_Talisman_13", lootpage = "ScourgeInvasion" },
    { name = BIS["Arms of Thaurissan"], Extra = L["Various Locations"], icon = "Interface\\Icons\\spell_fire_flametounge", lootpage = "ArmsofThaurissan" }, --MoltenCore and BRD
    {},
    { name = BIS["Spider's Kiss"], extra = "Lower Blackrock Spire", icon = "Interface\\Icons\\INV_Weapon_ShortBlade_16", lootpage = "SpiderKiss" },
    { name = BIS["Dal'Rend's Arms"], extra = "Upper Blackrock Spire", icon = "Interface\\Icons\\INV_Sword_43", lootpage = "DalRend" },
    { name = BIS["Shard of the Gods"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_MonsterScales_15", lootpage = "ShardOfGods" },
    { name = BIS["Spirit of Eskhandar"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_MonsterClaw_04", lootpage = "SpiritofEskhandar" },
}

---
--- Pre-60 sets menu function
--- @return nil
--- @usage AtlasLootPRE60SetMenu()
--- @since 1.0.0
---
function AtlasLootPRE60SetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Pre 60 Sets"], AtlasTW.MenuData.Pre60Sets, L["Collections"])
end

---
--- Creates dungeon-specific set menu data for all classes
--- @param dungeonName string - The dungeon prefix (e.g., "ZG", "AQ40", "T1")
--- @return table - Menu data table with class-specific entries
--- @usage local zgMenu = CreateDungeonSetMenu("ZG")
--- @since 1.0.0
---
local function CreateDungeonSetMenu(dungeonName)
    local menuData = {}
    local classData = {
		{},
		{},
        { name = "Priest", color = "|cffffffff", icon = "Interface\\Icons\\Spell_Holy_PowerWordShield" },
        { name = "Mage", color = "|cff68ccef", icon = "Interface\\Icons\\Spell_Frost_IceStorm" },
        { name = "Warlock", color = "|cff9382c9", icon = "Interface\\Icons\\Spell_Shadow_CurseOfTounges" },
        { name = "Rogue", color = "|cfffff468", icon = "Interface\\Icons\\Ability_BackStab" },
        { name = "Druid", color = "|cffff7c0a", icon = "Interface\\Icons\\Spell_Nature_Regeneration" },
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
        { name = "Hunter", color = "|cffaad372", icon = "Interface\\Icons\\Ability_Hunter_RunningShot" },
        { name = "Shaman", color = "|cff2773ff", icon = "Interface\\Icons\\Spell_FireResistanceTotem_01" },
        { name = "Paladin", color = "|cfff48cba", icon = "Interface\\Icons\\Spell_Holy_SealOfMight" },
        { name = "Warrior", color = "|cffc69b6d", icon = "Interface\\Icons\\INV_Shield_05" },
    }

    for i, classInfo in ipairs(classData) do
		if classInfo.name then
        	local lootpage = dungeonName .. classInfo.name
        	local container = data[lootpage .. "C"]
			if data[lootpage] then
				menuData[i] = {
					name = classInfo.color .. BC[classInfo.name],
					icon = classInfo.icon,
					lootpage = lootpage,
					container = container
				}
			end
		end
    end
    return menuData
end
AtlasTW.MenuData.ZGSet = CreateDungeonSetMenu("ZG")
AtlasTW.MenuData.ZGSet[23] = { name = L["Zul'Gurub Rings"], icon = "Interface\\Icons\\INV_Jewelry_Ring_46", lootpage = "ZGRings" }
AtlasTW.MenuData.ZGSet[24] = { name = L["Primal Blessing"], icon = "Interface\\Icons\\INV_Weapon_Hand_01", lootpage = "PrimalBlessing" }
AtlasTW.MenuData.ZGSet[25] = { name = L["The Twin Blades of Hakkari"], icon = "Interface\\Icons\\INV_Sword_55", lootpage = "HakkariBlades" }
AtlasTW.MenuData.AQ40Set = CreateDungeonSetMenu("AQ40")
AtlasTW.MenuData.AQ20Set = CreateDungeonSetMenu("AQ20")
AtlasTW.MenuData.T0Set = CreateDungeonSetMenu("T0")
AtlasTW.MenuData.T1Set = CreateDungeonSetMenu("T1")
AtlasTW.MenuData.T2Set = CreateDungeonSetMenu("T2")
AtlasTW.MenuData.T3Set = CreateDungeonSetMenu("T3")
AtlasTW.MenuData.T35Set = CreateDungeonSetMenu("T35")

---
--- Zul'Gurub sets menu function
--- @return nil
--- @usage AtlasLootZGSetMenu()
--- @since 1.0.0
---
function AtlasLootZGSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Zul'Gurub Sets"], AtlasTW.MenuData.ZGSet, L["Collections"])
end

---
--- Temple of Ahn'Qiraj sets menu function
--- @return nil
--- @usage AtlasLootAQ40SetMenu()
--- @since 1.0.0
---
function AtlasLootAQ40SetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Temple of Ahn'Qiraj Sets"], AtlasTW.MenuData.AQ40Set, L["Collections"])
end

---
--- Ruins of Ahn'Qiraj sets menu function
--- @return nil
--- @usage AtlasLootAQ20SetMenu()
--- @since 1.0.0
---
function AtlasLootAQ20SetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Ruins of Ahn'Qiraj Sets"], AtlasTW.MenuData.AQ20Set, L["Collections"])
end

---
--- Tier 0/0.5 sets menu function
--- @return nil
--- @usage AtlasLootT0SetMenu()
--- @since 1.0.0
---
function AtlasLootT0SetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Tier 0/0.5 Sets"], AtlasTW.MenuData.T0Set, L["Collections"])
end

---
--- Tier 1 sets menu function
--- @return nil
--- @usage AtlasLootT1SetMenu()
--- @since 1.0.0
---
function AtlasLootT1SetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Tier 1 Sets"], AtlasTW.MenuData.T1Set, L["Collections"])
end

---
--- Tier 2 sets menu function
--- @return nil
--- @usage AtlasLootT2SetMenu()
--- @since 1.0.0
---
function AtlasLootT2SetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Tier 2 Sets"], AtlasTW.MenuData.T2Set, L["Collections"])
end

---
--- Tier 3 sets menu function
--- @return nil
--- @usage AtlasLootT3SetMenu()
--- @since 1.0.0
---
function AtlasLootT3SetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Tier 3 Sets"], AtlasTW.MenuData.T3Set, L["Collections"])
end

---
--- Tower of Karazhan sets menu function
--- @return nil
--- @usage AtlasLootUKSetMenu()
--- @since 1.0.0
---
function AtlasLootUKSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Tower of Karazhan Sets"], AtlasTW.MenuData.T35Set, L["Collections"])
end