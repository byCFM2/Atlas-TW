---
--- World.lua - World boss loot system
---
--- This module handles world boss loot tables and menu systems for Atlas-TW.
--- It provides access to outdoor raid bosses, world dragons, and other rare
--- spawns with their unique loot tables and spawn information.
---
--- Features:
--- • World boss loot catalogs
--- • Spawn location information
--- • Rare drop tracking
--- • Cross-zone boss organization
--- • Integration with Babble localization
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}
local L = AtlasTW.Local
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.MenuData.WorldBosses = {
    { name = BB["Azuregos"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Blue", lootpage = "Azuregos" },
    { name = BB["Emeriss"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
    { name = BB["Lethon"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
    { name = BB["Taerar"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
    { name = BB["Ysondre"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
	{},
    { name = BB["Lord Kazzak"], extra = "Blasted Lands", icon = "Interface\\Icons\\warlock_summon_doomguard", lootpage = "LordKazzak" },
    { name = BB["Nerubian Overseer"], extra = "Eastern Plaguelands", icon = "Interface\\Icons\\Spell_Nature_Web", lootpage = "Nerubian" },
    { name = BB["Dark Reaver of Karazhan"], extra = "Deadwind Pass", icon = "Interface\\Icons\\Ability_Mount_Dreadsteed", lootpage = "Reaver" },
    { name = BB["Ostarius"], extra = "Tanaris", icon = "Interface\\Icons\\INV_Misc_Platnumdisks", lootpage = "Ostarius" },
    { name = BB["Concavius"], extra = "Desolace", icon = "Interface\\Icons\\Spell_Shadow_SummonVoidWalker", lootpage = "Concavius" },
	{},
    { name = BB["Moo"], extra = "Moomoo Grove", icon = "Interface\\Icons\\Spell_Nature_Polymorph_Cow", lootpage = "CowKing" },
    { name = BB["Cla'ckora"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Birdbeck_02", lootpage = "Clackora" },
    { name = L["Rare Mobs"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Undead_01", lootpage = "RareMobs" },
}

---
-- Display the World Bosses menu in AtlasLoot
-- @function AtlasLoot_WorldMenu
-- @usage AtlasLoot_WorldMenu()
-- @version 1.0
---
function AtlasLoot_WorldMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["World"], AtlasTW.MenuData.WorldBosses)
end