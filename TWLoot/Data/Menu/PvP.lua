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
    { name = L["PvP Weapons"], icon = "Interface\\Icons\\INV_Sword_10", lootpage = "PVPWeapons" },
	{ name = L["PvP Armor Sets"], icon = "Interface\\Icons\\INV_Helmet_03", lootpage = "AtlasTWLootPVPSetMenu" },
	{},
    { name = L["PvP Mounts"], Extra = L["Rank"].." 11", icon = "Interface\\Icons\\Ability_Mount_RidingHorse", lootpage = "PvPMountsPvP" },
    { name = L["PvP Accessories"], Extra = L["Rank"].." 2-9", icon = "Interface\\Icons\\INV_Jewelry_Talisman_09", lootpage = "PvP60Accessories" },
    { name = L["PvP Armor Sets"].." 1.18", Extra = L["Rank"].." 7-13", icon = "Interface\\Icons\\INV_Helmet_05", lootpage = "AtlasTWLootPVPSet118Menu" },
    { name = L["PvP Weapons"].." 1.18", Extra = L["Rank"].." 14", icon = "Interface\\Icons\\INV_Sword_11", lootpage = "PVPWeapons118" },
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

AtlasTW.MenuData.PVPSets118 = {
    {},
    {},
    { name = Colors.Priest..LC["Priest"], icon = "Interface\\Icons\\Spell_Holy_PowerWordShield", lootpage = "PVPPriest118" },
    { name = Colors.Mage..LC["Mage"], icon = "Interface\\Icons\\Spell_Frost_IceStorm", lootpage = "PVPMage118" },
    { name = Colors.Warlock..LC["Warlock"], icon = "Interface\\Icons\\Spell_Shadow_CurseOfTounges", lootpage = "PVPWarlock118" },
    { name = Colors.Rogue..LC["Rogue"], icon = "Interface\\Icons\\Ability_BackStab", lootpage = "PVPRogue118" },
    { name = Colors.Druid..LC["Druid"], icon = "Interface\\Icons\\Spell_Nature_Regeneration", lootpage = "PVPDruid118" },
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
    { name = Colors.Hunter..LC["Hunter"], icon = "Interface\\Icons\\Ability_Hunter_RunningShot", lootpage = "PVPHunter118" },
    { name = Colors.Shaman..LC["Shaman"], icon = "Interface\\Icons\\Spell_FireResistanceTotem_01", lootpage = "PVPShaman118" },
    { name = Colors.Paladin..LC["Paladin"], icon = "Interface\\Icons\\Spell_Holy_SealOfMight", lootpage = "PVPPaladin118" },
    { name = Colors.Warrior..LC["Warrior"], icon = "Interface\\Icons\\INV_Shield_05", lootpage = "PVPWarrior118" },
}

---
--- Displays the PvP armor sets menu organized by class
--- Shows rank 7-13 PvP armor sets for all classes with color-coded class names
--- @return nil
--- @usage AtlasTWLootPVPSet118Menu()
---
function AtlasTWLootPVPSet118Menu()
    AtlasTW.LootBrowserUI.PrepMenu(L["PvP Armor Sets"].." 1.18", AtlasTW.MenuData.PVPSets118, L["PvP Rewards"])
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
--- @return nil
--- @usage AtlasTWLootPVPSetMenu()
---
function AtlasTWLootPVPSetMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["PvP Armor Sets"], AtlasTW.MenuData.PVPSets, L["PvP Rewards"])
end