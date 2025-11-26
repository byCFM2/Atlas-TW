---
--- PvP.lua - PvP rewards and battleground loot system
---
--- This module handles PvP-related loot tables and menu systems for Atlas-TW.
--- It provides access to battleground rewards, PvP armor sets, weapons, and accessories
--- organized by rank requirements and battleground locations.
---
--- Features:
--- • Battleground-specific reward catalogs
--- • PvP rank requirement tracking
--- • Honor system integration
--- • Cross-battleground item organization
--- • Faction-specific PvP rewards
---
--- @compatible World of Warcraft 1.12
---

AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LC = AtlasTW.Localization.Classes

local Colors = AtlasTW.Colors

AtlasTW.MenuData.PVP = {
    {},
    {},
    {},
    { name = LZ["Alterac Valley"], icon = "Interface\\Icons\\INV_Jewelry_Necklace_21", lootpage = "StormpikeFrostwolf" },
    { name = LZ["Arathi Basin"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07", lootpage = "ArathorDefilers" },
    { name = LZ["Warsong Gulch"], icon = "Interface\\Icons\\INV_Misc_Rune_07", lootpage = "SentinelsOutriders" },
    { name = LZ["Blood Ring"], icon = "Interface\\Icons\\inv_jewelry_ring_04", lootpage = "SteamwheedleBloodRing" },
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
    { name = L["PvP Armor Sets"], Extra = L["Rank"].." 7-13", icon = "Interface\\Icons\\INV_Helmet_05", lootpage = "AtlasTWLootPVPSetMenu" },
    { name = L["PvP Weapons"], Extra = L["Rank"].." 14", icon = "Interface\\Icons\\INV_Sword_11", lootpage = "PVPWeapons" },
}

---
--- Displays the main PvP rewards menu
--- Shows battleground locations, PvP mounts, accessories, armor sets, and weapons
--- @return nil
--- @usage AtlasTWLootPvPMenu()
---
function AtlasTWLootPvPMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["PvP Rewards"], AtlasTW.MenuData.PVP)
end

AtlasTW.MenuData.PVPSets = {
    {},
    {},
    { name = Colors.Priest..LC["Priest"], icon = "Interface\\Icons\\Spell_Holy_PowerWordShield", lootpage = "PVPPriest" },
    { name = Colors.Mage..LC["Mage"], icon = "Interface\\Icons\\Spell_Frost_IceStorm", lootpage = "PVPMage" },
    { name = Colors.Warlock..LC["Warlock"], icon = "Interface\\Icons\\Spell_Shadow_CurseOfTounges", lootpage = "PVPWarlock" },
    { name = Colors.Rogue..LC["Rogue"], icon = "Interface\\Icons\\Ability_BackStab", lootpage = "PVPRogue" },
    { name = Colors.Druid..LC["Druid"], icon = "Interface\\Icons\\Spell_Nature_Regeneration", lootpage = "PVPDruid" },
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
    { name = Colors.Hunter..LC["Hunter"], icon = "Interface\\Icons\\Ability_Hunter_RunningShot", lootpage = "PVPHunter" },
    { name = Colors.Shaman..LC["Shaman"], icon = "Interface\\Icons\\Spell_FireResistanceTotem_01", lootpage = "PVPShaman" },
    { name = Colors.Paladin..LC["Paladin"], icon = "Interface\\Icons\\Spell_Holy_SealOfMight", lootpage = "PVPPaladin" },
    { name = Colors.Warrior..LC["Warrior"], icon = "Interface\\Icons\\INV_Shield_05", lootpage = "PVPWarrior" },
}

---
--- Displays the PvP armor sets menu organized by class
--- Shows rank 7-13 PvP armor sets for all classes with color-coded class names
--- @return nil
--- @usage AtlasTWLootPVPSetMenu()
---
function AtlasTWLootPVPSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["PvP Armor Sets"], AtlasTW.MenuData.PVPSets, L["PvP Rewards"])
end