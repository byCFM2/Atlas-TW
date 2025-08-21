local L = AtlasTW.Local
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2a")

AtlasTW.Loot.PvpMenuData = {
    {},
    {},
    {},
    { name = BZ["Alterac Valley"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "StormpikeFrostwolf" },
    { name = BZ["Arathi Basin"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ArathorDefilers" },
    { name = BZ["Warsong Gulch"], icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "SentinelsOutriders" },
    { name = BZ["Blood Ring"], icon = "Interface\\Icons\\inv_jewelry_ring_04", lootpage = "SteamwheedleBloodRing" },
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
	{},
    { name = L["PvP Mounts"], Extra = L["Rank"].." 11", icon = "Interface\\Icons\\Ability_Mount_RidingHorse", lootpage = "PvPMountsPvP" },
    { name = L["PvP Accessories"], Extra = L["Rank"].." 2-9", icon = "Interface\\Icons\\INV_Jewelry_Talisman_09", lootpage = "PvP60Accessories" },
    { name = L["PvP Armor Sets"], Extra = L["Rank"].." 7-13", icon = "Interface\\Icons\\INV_Helmet_05", lootpage = "AtlasLootPVPSetMenu" },
    { name = L["PvP Weapons"], Extra = L["Rank"].." 14", icon = "Interface\\Icons\\INV_Sword_11", lootpage = "PVPWeapons" },
}

function AtlasLootPvPMenu()
    AtlasLoot_ShowMenu(AtlasTW.Loot.PvpMenuData, { menuName = L["PvP Rewards"] })
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
    AtlasLoot_ShowMenu(pvpSetMenuData, { menuName = L["PvP Armor Sets"] })
end