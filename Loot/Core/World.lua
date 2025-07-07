local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.Loot.WorldBossesData = {
    { name = BB["Azuregos"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Blue", lootpage = "WBAzuregos" },
    { name = BB["Emeriss"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "WBEmeriss" },
    { name = BB["Lethon"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "WBLethon" },
    { name = BB["Taerar"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "WBTaerar" },
    { name = BB["Ysondre"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Green", lootpage = "WBYsondre" },
	{},
    { name = BB["Lord Kazzak"], extra = "Blasted Lands", icon = "Interface\\Icons\\warlock_summon_doomguard", lootpage = "WBLordKazzak" },
    { name = BB["Nerubian Overseer"], extra = "Eastern Plaguelands", icon = "Interface\\Icons\\Spell_Nature_Web", lootpage = "WBNerubian" },
    { name = BB["Dark Reaver of Karazhan"], extra = "Deadwind Pass", icon = "Interface\\Icons\\Ability_Mount_Dreadsteed", lootpage = "WBReaver" },
    { name = BB["Ostarius"], extra = "Tanaris", icon = "Interface\\Icons\\INV_Misc_Platnumdisks", lootpage = "WBOstarius" },
    { name = BB["Concavius"], extra = "Desolace", icon = "Interface\\Icons\\Spell_Shadow_SummonVoidWalker", lootpage = "WBConcavius" },
	{},
    { name = BB["Moo"], extra = "Moomoo Grove", icon = "Interface\\Icons\\Spell_Nature_Polymorph_Cow", lootpage = "WBCowKing" },
    { name = BB["Cla'ckora"], extra = "Azshara", icon = "Interface\\Icons\\INV_Misc_Birdbeck_02", lootpage = "WBClackora" },
    { name = L["Rare Mobs"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Head_Undead_01", lootpage = "ShadeMage" },
}

function AtlasLoot_WorldMenu()
    AtlasLoot_PrepMenu(nil, L["World"], "World")
    AtlasLoot_ShowMenu(AtlasTW.Loot.WorldBossesData, { maxItems = table.getn(AtlasTW.Loot.WorldBossesData) })
end