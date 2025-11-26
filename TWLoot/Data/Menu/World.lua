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
--- @compatible World of Warcraft 1.12
---

AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}

local L = AtlasTW.Localization.UI
local LB = AtlasTW.Localization.Bosses

AtlasTW.MenuData.WorldBosses = {
    { name = LB["Azuregos"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Blue", lootpage = "Azuregos" },
    { name = LB["Emeriss"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
    { name = LB["Lethon"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
    { name = LB["Taerar"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
    { name = LB["Ysondre"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "FourDragons" },
	{},
    { name = LB["Lord Kazzak"], extra = "Blasted Lands", icon = "Interface\\Icons\\warlock_summon_doomguard", lootpage = "LordKazzak" },
    { name = LB["Nerubian Overseer"], extra = "Eastern Plaguelands", icon = "Interface\\Icons\\Spell_Nature_Web", lootpage = "Nerubian" },
    { name = LB["Dark Reaver of Karazhan"], extra = "Deadwind Pass", icon = "Interface\\Icons\\Ability_Mount_Dreadsteed", lootpage = "Reaver" },
    { name = LB["Ostarius"], extra = "Tanaris", icon = "Interface\\Icons\\INV_Misc_Platnumdisks", lootpage = "Ostarius" },
    { name = LB["Concavius"], extra = "Desolace", icon = "Interface\\Icons\\Spell_Shadow_SummonVoidWalker", lootpage = "Concavius" },
	{},
    { name = LB["Moo"], extra = "Moomoo Grove", icon = "Interface\\Icons\\Spell_Nature_Polymorph_Cow", lootpage = "CowKing" },
    { name = LB["Cla'ckora"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Birdbeck_02", lootpage = "Clackora" },
    { name = L["Rare Mobs"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Head_Undead_01", lootpage = "RareMobs" },
}

---
-- Display the World Bosses menu in AtlasTWLoot
-- @function AtlasTWLoot_WorldMenu
-- @usage AtlasTWLoot_WorldMenu()
---
function AtlasTWLoot_WorldMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["World"], AtlasTW.MenuData.WorldBosses)
end