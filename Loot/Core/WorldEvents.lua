AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}
local L = AtlasTW.Local

AtlasTW.MenuData.WorldEvents = {
	{},
    { name = L["Abyssal Council"], extra = "Silithus", icon = "Interface\\Icons\\Spell_Nature_TimeStop", lootpage = "AbyssalTemplars" },
    { name = L["Elemental Invasion"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Ammo_FireTar", lootpage = "ElementalInvasion" },
    { name = L["Gurubashi Arena"], extra = "Stranglethorn Vale", icon = "Interface\\Icons\\INV_Box_02", lootpage = "GurubashiArena" },
    { name = L["Harvest Festival"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Food_Wheat_01", lootpage = "HarvestFestival" },
    { name = L["Lunar Festival"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_ElvenCoins", lootpage = "LunarFestival" },
    { name = L["Noblegarden"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Egg_03", lootpage = "Noblegarden" },
    { name = L["Stranglethorn Fishing Extravaganza"], extra = "Stranglethorn Vale", icon = "Interface\\Icons\\INV_Fishingpole_01", lootpage = "FishingExtravaganza" },
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
    { name = L["Children's Week"], Extra = L["Various Locations"], icon = "Interface\\Icons\\Ability_Hunter_BeastCall", lootpage = "ChildrensWeek" },
    { name = L["Feast of Winter Veil"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Holiday_Christmas_Present_01", lootpage = "Winterviel" },
    { name = L["Hallow's End"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Misc_Food_59", lootpage = "Halloween" },
    { name = L["Love is in the Air"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_ValentinesBoxOfChocolates02", lootpage = "Valentineday" },
    { name = L["Midsummer Fire Festival"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_SummerFest_Symbol_Medium", lootpage = "MidsummerFestival" },
    { name = L["Scourge Invasion"], Extra = L["Various Locations"], icon = "Interface\\Icons\\INV_Jewelry_Talisman_13", lootpage = "ScourgeInvasionF" },
}

function AtlasLootWorldEventMenu()
    AtlasTW.Loot.PrepMenu(L["World Events"], AtlasTW.MenuData.WorldEvents)
end