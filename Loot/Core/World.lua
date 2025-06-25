local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BB = AceLibrary("Babble-Boss-2.2a")

local worldBossesData = {
    { name = BB["Azuregos"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Blue", lootpage = "AAzuregos" },
    { name = BB["Emeriss"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "DEmeriss" },
    { name = BB["Lethon"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "DLethon" },
    { name = BB["Taerar"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "DTaerar" },
    { name = BB["Ysondre"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "DYsondre" },
	{},
    { name = BB["Lord Kazzak"], extra = "Blasted Lands", icon = "Interface\\Icons\\warlock_summon_doomguard", lootpage = "KKazzak" },
    { name = BB["Nerubian Overseer"], extra = "Eastern Plaguelands", icon = "Interface\\Icons\\Spell_Nature_Web", lootpage = "Nerubian" },
    { name = BB["Dark Reaver of Karazhan"], extra = "Deadwind Pass", icon = "Interface\\Icons\\Ability_Mount_Dreadsteed", lootpage = "Reaver" },
    { name = BB["Ostarius"], extra = "Tanaris", icon = "Interface\\Icons\\INV_Misc_Platnumdisks", lootpage = "Ostarius" },
    { name = BB["Concavius"], extra = "Desolace", icon = "Interface\\Icons\\Spell_Shadow_SummonVoidWalker", lootpage = "Concavius" },
	{},
    { name = BB["Moo"], extra = "Moomoo Grove", icon = "Interface\\Icons\\Spell_Nature_Polymorph_Cow", lootpage = "CowKing" },
    { name = BB["Cla'ckora"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Birdbeck_02", lootpage = "Clackora" },
    { name = L["Rare Mobs"], extra = L["Various Locations"], libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Undead_01", lootpage = "ShadeMage" },
}

function AtlasLoot_WorldMenu()
    AtlasLoot_PrepMenu(nil, L["World"])
    AtlasTWCharDB.LastBoss = "WORLDMENU"
    AtlasTWCharDB.LastBossText = L["World"]
    AtlasLoot_ShowMenu(worldBossesData, { maxItems = table.getn(worldBossesData) })
end