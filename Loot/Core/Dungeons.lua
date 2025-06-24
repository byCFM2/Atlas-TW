local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

-- Data for Dungeons & Raids (Page 1)
local dungeonsMenu1Data = {
    { name = "[13-18] Ragefire Chasm",               extra = "Orgrimmar",            lootpage = "RFCTaragaman" },
    { name = "[17-24] Wailing Caverns",              extra = "The Barrens",          lootpage = "WCLordCobrahn" },
    { name = "[17-24] The Deadmines",                extra = "Westfall",             lootpage = "DMRhahkZor" },
    { name = "[22-30] Shadowfang Keep",              extra = "Silverpine Forest",    lootpage = "SFKRethilgore" },
    { name = "[23-32] Blackfathom Deeps",            extra = "Ashenvale",            lootpage = "BFDGhamoora" },
    { name = "[22-30] The Stockade",                 extra = "Stormwind",            lootpage = "SWStTargorr", lib = BF },
    { name = "[29-38] Gnomeregan",                   extra = "Dun Morogh",           lootpage = "GnGrubbis" },
    { name = "[29-38] Razorfen Kraul",               extra = "The Barrens",          lootpage = "RFKAggem" },
    { name = "[32-38] The Crescent Grove",           extra = "Ashenvale",            lootpage = "TCGGrovetenderEngryss" },
    { name = "[27-36] Scarlet Monastery (Graveyard)",extra = "Tirisfal Glades",      lootpage = "SMVishas" },
    { name = "[28-39] Scarlet Monastery (Library)",  extra = "Tirisfal Glades",      lootpage = "SMHoundmasterLoksey" },
    { name = "[32-41] Scarlet Monastery (Armory)",   extra = "Tirisfal Glades",      lootpage = "SMHerod" },
    { name = "[35-45] Scarlet Monastery (Cathedral)",extra = "Tirisfal Glades",      lootpage = "SMFairbanks" },
    { name = "[35-42] Stormwrought Ruins",           extra = "Balor",                lootpage = "RFCTaragaman" },  --TODO change RFCTaragaman when instance are release
    { name = "[36-46] Razorfen Downs",               extra = "The Barrens",          lootpage = "RFDTutenkash" },
    { name = "[40-51] Uldaman",                      extra = "Badlands",             lootpage = "UldBaelog" },
    { name = "[42-50] Gilneas City",                 extra = "Gilneas",              lootpage = "GCMatthiasHoltz" },
    { name = "[45-55] Maraudon",                     extra = "Desolace",             lootpage = "MaraNoxxion" },
    { name = "[44-54] Zul'Farrak",                   extra = "Tanaris",              lootpage = "ZFAntusul" },
    { name = "[50-60] The Sunken Temple",            extra = "Swamp of Sorrows",     lootpage = "STBalconyMinibosses" },
    { name = "[50-60] Hateforge Quarry",             extra = "Burning Steppes",      lootpage = "HQHighForemanBargulBlackhammer" },
    { name = "[52-60] Blackrock Depths",             extra = "Burning Steppes",      lootpage = "BRDLordRoccor" },
    { name = "[55-60] Dire Maul (East)",             extra = "Feralas",              lootpage = "DMEPusillin" },
    { name = "[57-60] Dire Maul (West)",             extra = "Feralas",              lootpage = "DMWTendrisWarpwood" },
    { name = "[57-60] Dire Maul (North)",            extra = "Feralas",              lootpage = "DMNGuardMoldar" },
    { name = "[58-60] Scholomance",                  extra = "Western Plaguelands",  lootpage = "SCHOLOKirtonostheHerald" },
    { name = "[58-60] Stratholme",                   extra = "Eastern Plaguelands",  lootpage = "STRATSkull" },
    { name = "[55-60] Lower Blackrock Spire",        extra = "Burning Steppes",      lootpage = "LBRSSpirestoneButcher" },
    { name = "[58-60] Upper Blackrock Spire",        extra = "Burning Steppes",      lootpage = "UBRSEmberseer" },
    { name = "[58-60] Karazhan Crypt",               extra = "Deadwind Pass",        lootpage = "KCMarrowspike" },
}

-- Data for Dungeons & Raids (Page 2)
local dungeonsMenu2Data = {
    { name = "[60] Caverns of Time: Black Morass", extra = "Tanaris", lootpage = "COTBMChronar", icon = "Interface\\Icons\\Spell_Arcane_PortalIronForge"  },
    { name = "[60] Stormwind Vault", extra = "Stormwind", lib = BF, lootpage = "SWVAszoshGrimflame", icon = "Interface\\Icons\\Spell_Arcane_PortalIronForge" },
	{}, -- space for a gap
    { name = "[RAID] Zul'Gurub", extra = "Stranglethorn Vale", lootpage = "ZGJeklik" },
    { name = "[RAID] Ruins of Ahn'Qiraj", extra = "Silithus", lootpage = "AQ20Kurinnaxx" },
    { name = "[RAID] Molten Core", extra = "Burning Steppes", lootpage = "MCLucifron" },
    { name = "[RAID] Onyxia's Lair", extra = "Dustwallow Marsh", lootpage = "Onyxia" },
    { name = "[RAID] Lower Karazhan Halls", extra = "Deadwind Pass", lootpage = "LKHRolfen" },
    { name = "[RAID] Blackwing Lair", extra = "Burning Steppes", lootpage = "BWLRazorgore" },
    { name = "[RAID] Emerald Sanctum", extra = "Hyjal", lootpage = "ESErennius" },
    { name = "[RAID] Temple of Ahn'Qiraj", extra = "Silithus", lootpage = "AQ40Skeram" },
    { name = "[RAID] Naxxramas", extra = "Eastern Plaguelands", lootpage = "NAXPatchwerk" },
    { name = "[RAID] Tower of Karazhan", extra = "Deadwind Pass", lootpage = "K40Gnarlmoon" },
}

local function AtlasLoot_DungeonsMenu(menuData, lastBoss, defaultIcon)
    AtlasLoot_PrepMenu(nil, L["Dungeons & Raids"])
    AtlasTWCharDB.LastBoss = lastBoss
    AtlasTWCharDB.LastBossText = L["Dungeons & Raids"]
    AtlasLootItemsFrame_PREV:Show()
    AtlasLootItemsFrame_NEXT:Show()

    for i = 1, 30 do
        local itemData = menuData[i]
        local menuItem = getglobal("AtlasLootMenuItem_"..i)
        if itemData and itemData.name then
            local lib = itemData.lib or BZ
            getglobal("AtlasLootMenuItem_"..i.."_Name"):SetText(L[itemData.name]);
            getglobal("AtlasLootMenuItem_"..i.."_Extra"):SetText(lib[itemData.extra]);
            getglobal("AtlasLootMenuItem_"..i.."_Icon"):SetTexture(itemData.icon or defaultIcon);
            menuItem.lootpage = itemData.lootpage;
            menuItem:Show();
        else
            menuItem:Hide();
        end
    end
end

function AtlasLoot_DungeonsMenu1()
    AtlasLoot_DungeonsMenu(dungeonsMenu1Data, "DUNGEONSMENU1", "Interface\\Icons\\Spell_Arcane_PortalIronForge")
end

function AtlasLoot_DungeonsMenu2()
    AtlasLoot_DungeonsMenu(dungeonsMenu2Data, "DUNGEONSMENU2", "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar")
end