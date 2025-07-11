local L = AtlasTW.Local

AtlasTW.Loot.WorldEventsData = {
	{},
    { name = L["Abyssal Council"], extra = "Silithus", icon = "Interface\\Icons\\Spell_Nature_TimeStop", lootpage = "AbyssalTemplars" },
    { name = L["Elemental Invasion"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Ammo_FireTar", lootpage = "ElementalInvasion" },
    { name = L["Gurubashi Arena"], extra = "Stranglethorn Vale", icon = "Interface\\Icons\\INV_Box_02", lootpage = "GurubashiArena" },
    { name = L["Harvest Festival"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Food_Wheat_01", lootpage = "HarvestFestival" },
    { name = L["Lunar Festival"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_ElvenCoins", lootpage = "LunarFestival1" },
    { name = L["Noblegarden"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Egg_03", lootpage = "Noblegarden" },
    { name = L["Stranglethorn Fishing Extravaganza"], extra = "Stranglethorn Vale", icon = "Interface\\Icons\\INV_Fishingpole_01", lootpage = "FishingExtravaganza" },
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
    { name = L["Children's Week"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\Ability_Hunter_BeastCall", lootpage = "ChildrensWeek" },
    { name = L["Feast of Winter Veil"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Holiday_Christmas_Present_01", lootpage = "Winterviel1" },
    { name = L["Hallow's End"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Misc_Food_59", lootpage = "Halloween1" },
    { name = L["Love is in the Air"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_ValentinesBoxOfChocolates02", lootpage = "Valentineday" },
    { name = L["Midsummer Fire Festival"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_SummerFest_Symbol_Medium", lootpage = "MidsummerFestival" },
    { name = L["Scourge Invasion"], extra = "Various Locations", libExtra = L, icon = "Interface\\Icons\\INV_Jewelry_Talisman_13", lootpage = "ScourgeInvasionEvent1" },
}

function AtlasLootWorldEventMenu()
    AtlasLoot_PrepMenu(nil, L["World Events"], "WorldEvents")
    AtlasLoot_ShowMenu(AtlasTW.Loot.WorldEventsData, { maxItems = table.getn(AtlasTW.Loot.WorldEventsData) })
end