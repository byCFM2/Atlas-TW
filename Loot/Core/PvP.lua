local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2a")

local pvpMenuData = {
    {},
    { name = BZ["Alterac Valley"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "AVRepMenu" },
    { name = BZ["Arathi Basin"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepMenu" },
    {},
    {},
    { name = L["PvP Mounts"], icon = "Interface\\Icons\\Ability_Mount_RidingHorse", lootpage = "PvPMountsPvP" },
    {},
    { name = L["PvP Armor Sets"], extra = "Rank 7-13", libExtra = L, icon = "Interface\\Icons\\INV_Helmet_05", lootpage = "PVPSET" },
    { name = L["PvP Accessories"], extra = "Rank 2-9", libExtra = L, icon = "Interface\\Icons\\INV_Jewelry_Talisman_09", lootpage = "PvP60Accessories1" },
	{},
	{},
	{},
	{},
	{},
	{},
	{},
    { name = BZ["Warsong Gulch"], icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepMenu" },
    { name = BZ["Blood Ring"], icon = "Interface\\Icons\\inv_jewelry_ring_04", lootpage = "BRRepMenu" },
	{},
	{},
	{},
	{},
    { name = L["PvP Weapons"], extra = "Rank 14", libExtra = L, icon = "Interface\\Icons\\INV_Sword_11", lootpage = "PVPWeapons1" },
}

function AtlasLootPvPMenu()
    AtlasLoot_PrepMenu(nil, L["PvP Rewards"])
    AtlasTWCharDB.LastBoss = "PVPMENU"
    AtlasTWCharDB.LastBossText = L["PvP Rewards"]
    AtlasLoot_ShowMenu(pvpMenuData, { maxItems = table.getn(pvpMenuData) })
end

local brRepMenuData = {
    {},
    { name = "Friendly Reputation Rewards", icon = "Interface\\Icons\\inv_jewelry_ring_04", lootpage = "BRRepFriendly" },
    { name = "Honored Reputation Rewards", icon = "Interface\\Icons\\inv_jewelry_ring_04", lootpage = "BRRepHonored" },
    { name = "Revered Reputation Rewards", icon = "Interface\\Icons\\inv_jewelry_ring_04", lootpage = "BRRepRevered" },
    { name = "Exalted Reputation Rewards", icon = "Interface\\Icons\\inv_jewelry_ring_04", lootpage = "BRRepExalted" },
    { name = "Token of Blood Rewards", icon = "Interface\\Icons\\inv_jewelry_talisman_04", lootpage = "BRRepTokens" },
}

function AtlasLootBRRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Blood Ring"])
    AtlasLoot_ShowMenu(brRepMenuData, { maxItems = table.getn(brRepMenuData) })
end

local wsgRepMenuData = {
    {},
    { name = L["Friendly Reputation Rewards"], icon = "Interface\\Icons\\INV_Misc_Rune_07", isheader = true },
    { name = "20-29", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepFriendly2029" },
    { name = "30-39", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepFriendly3039" },
    { name = "40-49", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepFriendly4049" },
    {},
    { name = L["Honored Reputation Rewards"], icon = "Interface\\Icons\\INV_Misc_Rune_07", isheader = true },
    { name = "10-19", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepHonored1019" },
    { name = "20-29", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepHonored2029" },
    { name = "30-39", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepHonored3039" },
    { name = "40-49", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepHonored4049" },
    { name = "50-59", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepHonored5059" },
    {},
    {},
    {},
    {},
    { name = L["Exalted Reputation Rewards"], icon = "Interface\\Icons\\INV_Misc_Rune_07", isheader = true },
    { name = "40-49", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepExalted4049" },
    { name = "50-59", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepExalted5059" },
    { name = "60", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepExalted60" },
    {},
    { name = L["Revered Reputation Rewards"], icon = "Interface\\Icons\\INV_Misc_Rune_07", isheader = true },
    { name = "10-19", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepRevered1019" },
    { name = "20-29", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepRevered2029" },
    { name = "30-39", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepRevered3039" },
    { name = "40-49", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepRevered4049" },
    { name = "50-59", icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "WSGRepRevered5059" },
}

function AtlasLootWSGRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Warsong Gulch"])
    AtlasLoot_ShowMenu(wsgRepMenuData, { maxItems = table.getn(wsgRepMenuData) })
end

local abRepMenuData = {
    {},
    { name = L["Friendly Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", isheader = true },
    { name = "20-29", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepFriendly2029" },
    { name = "30-39", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepFriendly3039" },
    { name = "40-49", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepFriendly4049" },
    { name = "50-59", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepFriendly5059" },
    {},
    { name = L["Honored Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", isheader = true },
    { name = "20-29", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepHonored2029" },
    { name = "30-39", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepHonored3039" },
    { name = "40-49", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepHonored4049" },
    { name = "50-59", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepHonored5059" },
    {},
    {},
    {},
    {},
    { name = L["Exalted Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", isheader = true },
    { name = "60", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepExalted" },
    {},
    {},
    {},
    {},
    { name = L["Revered Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", isheader = true },
    { name = "20-29", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepRevered2029" },
    { name = "30-39", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepRevered3039" },
    { name = "40-49", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepRevered4049" },
    { name = "50-59", icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ABRepRevered5059" },
}

function AtlasLootABRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Arathi Basin"])
    AtlasLoot_ShowMenu(abRepMenuData, { maxItems = table.getn(abRepMenuData) })
end

local avRepMenuData = {
    {},
    { name = L["Friendly Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "AVRepFriendly" },
    { name = L["Honored Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "AVRepHonored" },
    { name = L["Revered Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "AVRepRevered" },
    { name = L["Exalted Reputation Rewards"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "AVRepExalted" },
    { name = L["Korrak the Bloodrager"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "AVKorrak" },
    { name = L["Ivus & Lokholar"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "AVLokholarIvus" },
}

function AtlasLootAVRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Alterac Valley"])
    AtlasLoot_ShowMenu(avRepMenuData, { maxItems = table.getn(avRepMenuData) })
end

local pvpSetMenuData = {
    {},
    {},
    { name = "|cffffffff"..BC["Priest"], icon = "Interface\\Icons\\Spell_Holy_PowerWordShield", lootpage = "PVPPriest" },
    { name = "|cff68ccef"..BC["Mage"], icon = "Interface\\Icons\\Spell_Frost_IceStorm", lootpage = "PVPMage" },
    { name = "|cff9382c9"..BC["Warlock"], icon = "Interface\\Icons\\Spell_Shadow_CurseOfTounges", lootpage = "PVPWarlock" },
    { name = "|cfffff468"..BC["Rogue"], icon = "Interface\\Icons\\Ability_BackStab", lootpage = "PVPRogue" },
    { name = "|cffff7c0a"..BC["Druid"], icon = "Interface\\Icons\\Spell_Nature_Regeneration", lootpage = "PVPDruid" },
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
    { name = "|cffaad372"..BC["Hunter"], icon = "Interface\\Icons\\Ability_Hunter_RunningShot", lootpage = "PVPHunter" },
    { name = "|cff2773ff"..BC["Shaman"], icon = "Interface\\Icons\\Spell_FireResistanceTotem_01", lootpage = "PVPShaman" },
    { name = "|cfff48cba"..BC["Paladin"], icon = "Interface\\Icons\\Spell_Holy_SealOfMight", lootpage = "PVPPaladin" },
    { name = "|cffc69b6d"..BC["Warrior"], icon = "Interface\\Icons\\INV_Shield_05", lootpage = "PVPWarrior" },
}

function AtlasLootPVPSetMenu()
	AtlasLoot_PrepMenu("PVPMENU", L["PvP Armor Sets"])
    AtlasLoot_ShowMenu(pvpSetMenuData, { maxItems = table.getn(pvpSetMenuData) })
end