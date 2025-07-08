local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BC = AceLibrary("Babble-Class-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

local data = AtlasLoot_Data["AtlasLootSetItems"]

local function CreateMenu(menuTitle, menuItems, prevMenu, prevMenuText)
    AtlasLoot_PrepMenu(prevMenu, menuTitle)
    if prevMenu then
        AtlasTWCharDB.LastBoss = prevMenu
        AtlasTWCharDB.LastBossText = prevMenuText
    end
    AtlasLoot_ShowMenu(menuItems)
--[[     if menuItems.name then
        AtlasTW.Loot.BackTableRegistry[menuItems.name] = "Collections"
    end ]]
end

AtlasTW.Loot.SetsMenuData = {
    { name = L["Pre 60 Sets"], icon = "Interface\\Icons\\INV_Sword_43", lootpage = "Pre60Set" },
    { name = L["Zul'Gurub Sets"], icon = "Interface\\Icons\\INV_Sword_55", lootpage = "ZgSet" },
    { name = L["Ruins of Ahn'Qiraj Sets"], icon = "Interface\\Icons\\INV_Axe_15", lootpage = "Aq20Set" },
    { name = L["Temple of Ahn'Qiraj Sets"], icon = "Interface\\Icons\\INV_Sword_59", lootpage = "Aq40Set" },
    { name = L["Tower of Karazhan Sets"], icon = "Interface\\Icons\\INV_Staff_Medivh", lootpage = "K40Set" },
    {},
    { name = "|cffffffff"..L["Priest Sets"], icon = "Interface\\Icons\\Spell_Holy_PowerWordShield", lootpage = "PriestSet" },
    { name = "|cff68ccef"..L["Mage Sets"], icon = "Interface\\Icons\\Spell_Frost_IceStorm", lootpage = "MageSet" },
    { name = "|cff9382c9"..L["Warlock Sets"], icon = "Interface\\Icons\\Spell_Shadow_CurseOfTounges", lootpage = "WarlockSet" },
    { name = "|cfffff468"..L["Rogue Sets"], icon = "Interface\\Icons\\Ability_BackStab", lootpage = "RogueSet" },
    { name = "|cffff7c0a"..L["Druid Sets"], icon = "Interface\\Icons\\Spell_Nature_Regeneration", lootpage = "DruidSet" },
    { name = "|cffaad372"..L["Hunter Sets"], icon = "Interface\\Icons\\Ability_Hunter_RunningShot", lootpage = "HunterSet" },
    { name = "|cff2773ff"..L["Shaman Sets"], icon = "Interface\\Icons\\Spell_FireResistanceTotem_01", lootpage = "ShamanSet" },
    { name = "|cfff48cba"..L["Paladin Sets"], icon = "Interface\\Icons\\Spell_Holy_SealOfMight", lootpage = "PaladinSet" },
    { name = "|cffc69b6d"..L["Warrior Sets"], icon = "Interface\\Icons\\INV_Shield_05", lootpage = "WarriorSet" },
    { name = L["Tier 0/0.5 Sets"], icon = "Interface\\Icons\\INV_Chest_Chain_03", lootpage = "T0Set" },
    { name = L["Tier 1 Sets"], icon = "Interface\\Icons\\INV_Pants_Mail_03", lootpage = "T1Set" },
    { name = L["Tier 2 Sets"], icon = "Interface\\Icons\\INV_Shoulder_32", lootpage = "T2Set" },
    { name = L["Tier 3 Sets"], icon = "Interface\\Icons\\INV_Chest_Plate02", lootpage = "T3Set" },
    {},
    { name = L["World Blues"], icon = "Interface\\Icons\\INV_Box_01", lootpage = "WorldBlues" },
    { name = L["World Epics"], icon = "Interface\\Icons\\INV_Box_04", lootpage = "WorldEpics1" },
    { name = L["Legendary Items"], icon = "Interface\\Icons\\INV_Staff_Medivh", lootpage = "Legendaries" },
    { name = L["Artifact Items"], icon = "Interface\\Icons\\INV_Sword_07", lootpage = "Artifacts" },
    { name = L["Rare Pets"], icon = "Interface\\Icons\\Ability_Seal", lootpage = "RarePets1" },
    { name = L["Rare Mounts"], icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_05", lootpage = "RareMounts" },
    { name = L["Old Mounts"], icon = "Interface\\Icons\\Ability_Mount_RidingHorse", lootpage = "OldMounts" },
    { name = L["Unobtainable Mounts"], icon = "Interface\\Icons\\Ability_Mount_Whitetiger", lootpage = "UnobMounts" },
    { name = L["Tabards"], icon = "Interface\\Icons\\INV_Shirt_GuildTabard_01", lootpage = "Tabards" },
}

function AtlasLootSetMenu()
    CreateMenu(L["Collections"], AtlasTW.Loot.SetsMenuData)
end

--[[ local worldEpicsMenuData = {
    {},
    {},
    {},
    { name = L["Level 30-39"], icon = "Interface\\Icons\\INV_Jewelry_Ring_15", lootpage = "WorldEpics1" },
    { name = L["Level 40-49"], icon = "Interface\\Icons\\INV_Staff_29", lootpage = "WorldEpics2" },
    { name = L["Level 50-60"], icon = "Interface\\Icons\\INV_Sword_19", lootpage = "WorldEpics3" },
}

function AtlasLootWorldEpicsMenu()
    CreateMenu(L["World Epics"], worldEpicsMenuData, "Collections", L["Collections"])
end ]]

local worldBluesMenuData = {
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

function AtlasLootWorldBluesMenu()
    CreateMenu(L["World Blues"], worldBluesMenuData, "Collections", L["Collections"])
end

local function CreateClassSetMenu(class, color, icon)
    local menuData = {
        { name = color..L["Tier 0/0.5 Sets"], icon = icon, lootpage = "T0"..class, container = data["T0"..class.."C"] },
        { name = color..L["Tier 1 Sets"], icon = icon, lootpage = "T1"..class, container = data["T1"..class.."C"] },
        { name = color..L["Zul'Gurub Sets"], icon = icon, lootpage = "ZG"..class, container = data["ZG"..class.."C"] },
        { name = color..L["Ruins of Ahn'Qiraj Sets"], icon = icon, lootpage = "AQ20"..class, container = data["AQ20"..class.."C"] },
        { name = color..L["Tier 2 Sets"], icon = icon, lootpage = "T2"..class, container = data["T2"..class.."C"] },
        { name = color..L["Temple of Ahn'Qiraj Sets"], icon = icon, lootpage = "AQ40"..class, container = data["AQ40"..class.."C"] },
        { name = color..L["Tier 3 Sets"], icon = icon, lootpage = "T3"..class, container = data["T3"..class.."C"] },
        { name = color..L["Tower of Karazhan Sets"], icon = icon, lootpage = "T35"..class, container = data["T35"..class.."C"] },
    }
    return menuData
end

function AtlasLootPriestSetMenu()
    local menuData = CreateClassSetMenu("Priest", "|cffffffff", "Interface\\Icons\\Spell_Holy_PowerWordShield")
    CreateMenu(L["Priest Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootMageSetMenu()
    local menuData = CreateClassSetMenu("Mage", "|cff68ccef", "Interface\\Icons\\Spell_Frost_IceStorm")
    CreateMenu(L["Mage Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootWarlockSetMenu()
    local menuData = CreateClassSetMenu("Warlock", "|cff9382c9", "Interface\\Icons\\Spell_Shadow_CurseOfTounges")
    CreateMenu(L["Warlock Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootRogueSetMenu()
    local menuData = CreateClassSetMenu("Rogue", "|cfffff468", "Interface\\Icons\\Ability_BackStab")
    CreateMenu(L["Rogue Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootDruidSetMenu()
    local menuData = CreateClassSetMenu("Druid", "|cffff7c0a", "Interface\\Icons\\Spell_Nature_Regeneration")
    CreateMenu(L["Druid Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootHunterSetMenu()
    local menuData = CreateClassSetMenu("Hunter", "|cffaad372", "Interface\\Icons\\Ability_Hunter_RunningShot")
    CreateMenu(L["Hunter Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootShamanSetMenu()
    local menuData = CreateClassSetMenu("Shaman", "|cff2773ff", "Interface\\Icons\\Spell_FireResistanceTotem_01")
    CreateMenu(L["Shaman Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootPaladinSetMenu()
    local menuData = CreateClassSetMenu("Paladin", "|cfff48cba", "Interface\\Icons\\Spell_Holy_SealOfMight")
    CreateMenu(L["Paladin Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootWarriorSetMenu()
    local menuData = CreateClassSetMenu("Warrior", "|cffc69b6d", "Interface\\Icons\\INV_Shield_05")
    CreateMenu(L["Warrior Sets"], menuData, "Collections", L["Collections"])
end

local pre60SetsMenuData = {
    {},
    { name = BIS["Defias Leather"], extra = "The Deadmines", icon = "Interface\\Icons\\INV_Pants_12", lootpage = "DEADMINES", container = data.DeadminesC },
    { name = BIS["Embrace of the Viper"], extra = "Wailing Caverns", icon = "Interface\\Icons\\INV_Shirt_16", lootpage = "WAILING", container = data.WailingC },
    { name = BIS["Chain of the Scarlet Crusade"], extra = "Scarlet Monastery", icon = "Interface\\Icons\\INV_Gauntlets_19", lootpage = "SCARLET", container = data.ScarletC },
    { name = BIS["Greymane Armor"], extra = "Gilneas City", icon = "Interface\\Icons\\inv_helmet_02", lootpage = "GreymaneArmor", container = data.GilneasC },
    { name = BIS["Incendosaur Skin Armor"], extra = "Hateforge Quarry", icon = "Interface\\Icons\\INV_Shoulder_23", lootpage = "IncendosaurSkinArmor", container = data.HateforgeC },
    { name = BIS["The Gladiator"], extra = "Blackrock Depths", icon = "Interface\\Icons\\INV_Helmet_01", lootpage = "BLACKROCKD", container = data.BlackrockdC },
    { name = BIS["Ironweave Battlesuit"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Boots_Cloth_05", lootpage = "IRONWEAVE", container = data.IronweaveC },
    { name = BIS["The Postmaster"], extra = "Stratholme", icon = "Interface\\Icons\\INV_Boots_02", lootpage = "STRAT", container = data.StratC },
    { name = BIS["Necropile Raiment"], extra = "Scholomance", icon = "Interface\\Icons\\INV_Shoulder_02", lootpage = "ScholoCloth", container = data.ScholoClothC },
    { name = BIS["Cadaverous Garb"], extra = "Scholomance", icon = "Interface\\Icons\\INV_Belt_16", lootpage = "ScholoLeather", container = data.ScholoLeatherC },
    { name = BIS["Bloodmail Regalia"], extra = "Scholomance", icon = "Interface\\Icons\\INV_Gauntlets_26", lootpage = "ScholoMail", container = data.ScholoMailC },
    { name = BIS["Deathbone Guardian"], extra = "Scholomance", icon = "Interface\\Icons\\INV_Belt_12", lootpage = "ScholoPlate", container = data.ScholoPlateC },
    { name = L["Scourge Invasion"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Jewelry_Talisman_13", lootpage = "ScourgeInvasion", container = data.ScourgeInvasionC },
    {},
    {},
    { name = BIS["Spider's Kiss"], extra = "Lower Blackrock Spire", icon = "Interface\\Icons\\INV_Weapon_ShortBlade_16", lootpage = "SpiderKiss", container = data.SpiderKissC },
    { name = BIS["Dal'Rend's Arms"], extra = "Upper Blackrock Spire", icon = "Interface\\Icons\\INV_Sword_43", lootpage = "DalRend", container = data.DalRendC },
    { name = L["Zul'Gurub Rings"], extra = "Zul'Gurub", icon = "Interface\\Icons\\INV_Bijou_Orange", lootpage = "ZGRings", container = data.ZGRingsC },
    { name = BIS["Primal Blessing"], extra = "Zul'Gurub", icon = "Interface\\Icons\\INV_Weapon_Hand_01", lootpage = "PrimalBlessing", container = data.PrimalBlessingC },
    { name = BIS["The Twin Blades of Hakkari"], extra = "Zul'Gurub", icon = "Interface\\Icons\\INV_Sword_55", lootpage = "HakkariBlades", container = data.HakkariBladesC },
    { name = BIS["Shard of the Gods"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_MonsterScales_15", lootpage = "ShardOfGods", container = data.ShardOfGodsC },
    { name = BIS["Spirit of Eskhandar"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_MonsterClaw_04", lootpage = "SpiritofEskhandar", container = data.SpiritofEskhandarC },
}

function AtlasLootPRE60SetMenu()
    CreateMenu(L["Pre 60 Sets"], pre60SetsMenuData, "Collections", L["Collections"])
end

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
			if AtlasLoot_Data["AtlasLootSetItems"][lootpage] then
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

function AtlasLootZGSetMenu()
    local menuData = CreateDungeonSetMenu("ZG")
    menuData[23] = { name = L["Zul'Gurub Rings"], icon = "Interface\\Icons\\INV_Jewelry_Ring_46", lootpage = "ZGRings", container = data.ZGRingsC }
    menuData[24] = { name = L["Primal Blessing"], icon = "Interface\\Icons\\INV_Weapon_Hand_01", lootpage = "PrimalBlessing", container = data.PrimalBlessingC }
    menuData[25] = { name = L["The Twin Blades of Hakkari"], icon = "Interface\\Icons\\INV_Sword_55", lootpage = "HakkariBlades", container = data.HakkariBladesC }
    CreateMenu(L["Zul'Gurub Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootAQ40SetMenu()
    local menuData = CreateDungeonSetMenu("AQ40")
    CreateMenu(L["Temple of Ahn'Qiraj Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootAQ20SetMenu()
    local menuData = CreateDungeonSetMenu("AQ20")
    CreateMenu(L["Ruins of Ahn'Qiraj Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootT0SetMenu()
    local menuData = CreateDungeonSetMenu("T0")
    CreateMenu(L["Tier 0/0.5 Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootT1SetMenu()
    local menuData = CreateDungeonSetMenu("T1")
    CreateMenu(L["Tier 1 Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootT2SetMenu()
    local menuData = CreateDungeonSetMenu("T2")
    CreateMenu(L["Tier 2 Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootT3SetMenu()
    local menuData = CreateDungeonSetMenu("T3")
    CreateMenu(L["Tier 3 Sets"], menuData, "Collections", L["Collections"])
end

function AtlasLootUKSetMenu()
    local menuData = CreateDungeonSetMenu("T35")
    CreateMenu(L["Tower of Karazhan Sets"], menuData, "Collections", L["Collections"])
end