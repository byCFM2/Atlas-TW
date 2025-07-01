local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")
local title = L["Dungeons & Raids"]
--temporary
AtlasTWLoot_BackTableRegistry = {}

-- Get the formatted string for the instance and make back navigation button
local function getFormString(instanceType, mainString, extraString)
    local index
    if extraString then
        index = mainString.." "..extraString
    else
        index = mainString
    end
    if instanceType == "[60]" then
        AtlasTWLoot_BackTableRegistry[index] = "DUNGEONSMENU2"
    end
    if instanceType == "[RAID]" then
        AtlasTWLoot_BackTableRegistry[index] = "DUNGEONSMENU2"
        return "|cffff0000"..instanceType.." |cffffd200"..BZ[mainString]..": "..(extraString or "")
    else
        AtlasTWLoot_BackTableRegistry[index] = AtlasTWLoot_BackTableRegistry[index] or "DUNGEONSMENU1"
        return "|cffffffff"..instanceType.." |cffffd200"..BZ[mainString]..": "..(extraString or "")
    end
end
-- Data for Dungeons & Raids (Page 1)
local dungeonsMenu1Data = {
    { name = getFormString("[13-18]", "Ragefire Chasm"),               extra = "Orgrimmar",            lootpage = "RFCTaragaman" },
    { name = getFormString("[17-24]", "Wailing Caverns"),              extra = "The Barrens",          lootpage = "WCLordCobrahn" },
    { name = getFormString("[17-24]", "The Deadmines"),                extra = "Westfall",             lootpage = "DMRhahkZor" },
    { name = getFormString("[22-30]", "Shadowfang Keep"),              extra = "Silverpine Forest",    lootpage = "SFKRethilgore" },
    { name = getFormString("[23-32]", "Blackfathom Deeps"),            extra = "Ashenvale",            lootpage = "BFDGhamoora" },
    { name = getFormString("[22-30]", "The Stockade"),                 extra = "Stormwind",            lootpage = "SWStTargorr", libExtra = BF },
    { name = getFormString("[29-38]", "Gnomeregan"),                   extra = "Dun Morogh",           lootpage = "GnGrubbis" },
    { name = getFormString("[29-38]", "Razorfen Kraul"),               extra = "The Barrens",          lootpage = "RFKAggem" },
    { name = getFormString("[32-38]", "The Crescent Grove"),           extra = "Ashenvale",            lootpage = "TCGGrovetenderEngryss" },
    { name = getFormString("[27-36]", "Scarlet Monastery", L["(Graveyard)"]), extra = "Tirisfal Glades", lootpage = "SMVishas" },
    { name = getFormString("[28-39]", "Scarlet Monastery", L["(Library)"]),   extra = "Tirisfal Glades", lootpage = "SMHoundmasterLoksey" },
    { name = getFormString("[32-41]", "Scarlet Monastery", L["(Armory)"]),    extra = "Tirisfal Glades", lootpage = "SMHerod" },
    { name = getFormString("[35-45]", "Scarlet Monastery", L["(Cathedral)"]),  extra = "Tirisfal Glades", lootpage = "SMFairbanks" },
    { name = getFormString("[35-42]", "Stormwrought Ruins"),           extra = "Balor",                lootpage = "RFCTaragaman" },  --TODO change RFCTaragaman when instance are release
    { name = getFormString("[36-46]", "Razorfen Downs"),               extra = "The Barrens",          lootpage = "RFDTutenkash" },
    { name = getFormString("[40-51]", "Uldaman"),                      extra = "Badlands",             lootpage = "UldBaelog" },
    { name = getFormString("[42-50]", "Gilneas City"),                 extra = "Gilneas",              lootpage = "GCMatthiasHoltz" },
    { name = getFormString("[45-55]", "Maraudon"),                     extra = "Desolace",             lootpage = "MaraNoxxion" },
    { name = getFormString("[44-54]", "Zul'Farrak"),                   extra = "Tanaris",              lootpage = "ZFAntusul" },
    { name = getFormString("[50-60]", "The Sunken Temple"),            extra = "Swamp of Sorrows",     lootpage = "STBalconyMinibosses" },
    { name = getFormString("[50-60]", "Hateforge Quarry"),             extra = "Burning Steppes",      lootpage = "HQHighForemanBargulBlackhammer" },
    { name = getFormString("[52-60]", "Blackrock Depths"),             extra = "Burning Steppes",      lootpage = "BRDLordRoccor" },
    { name = getFormString("[55-60]", "Dire Maul", L["(East)"]),         extra = "Feralas",              lootpage = "DMEPusillin" },
    { name = getFormString("[57-60]", "Dire Maul", L["(West)"]),         extra = "Feralas",              lootpage = "DMWTendrisWarpwood" },
    { name = getFormString("[57-60]", "Dire Maul", L["(North)"]),        extra = "Feralas",              lootpage = "DMNGuardMoldar" },
    { name = getFormString("[58-60]", "Scholomance"),                  extra = "Western Plaguelands",   lootpage = "SCHOLOKirtonostheHerald" },
    { name = getFormString("[58-60]", "Stratholme"),                   extra = "Eastern Plaguelands",   lootpage = "STRATSkull" },
    { name = getFormString("[55-60]", "Lower Blackrock Spire"),        extra = "Burning Steppes",      lootpage = "LBRSSpirestoneButcher" },
    { name = getFormString("[58-60]", "Upper Blackrock Spire"),        extra = "Burning Steppes",      lootpage = "UBRSEmberseer" },
    { name = getFormString("[58-60]", "Karazhan Crypt"),               extra = "Deadwind Pass",        lootpage = "KCMarrowspike" },
}

-- Data for Dungeons & Raids (Page 2)
local dungeonsMenu2Data = {
    { name = getFormString("[60]", "Caverns of Time: Black Morass"), extra = "Tanaris", lootpage = "COTBMChronar", icon = "Interface\\Icons\\Spell_Arcane_PortalIronForge"  },
    { name = getFormString("[60]", "Stormwind Vault"), extra = "Stormwind", libExtra = BF, lootpage = "SWVAszoshGrimflame", icon = "Interface\\Icons\\Spell_Arcane_PortalIronForge" },
	{}, -- space for a gap
    { name = getFormString("[RAID]", "Zul'Gurub"), extra = "Stranglethorn Vale", lootpage = "ZGJeklik" },
    { name = getFormString("[RAID]", "Ruins of Ahn'Qiraj"), extra = "Silithus", lootpage = "AQ20Kurinnaxx" },
    { name = getFormString("[RAID]", "Molten Core"), extra = "Burning Steppes", lootpage = "MCLucifron" },
    { name = getFormString("[RAID]", "Onyxia's Lair"), extra = "Dustwallow Marsh", lootpage = "Onyxia" },
    { name = getFormString("[RAID]", "Lower Karazhan Halls"), extra = "Deadwind Pass", lootpage = "LKHRolfen" },
    { name = getFormString("[RAID]", "Blackwing Lair"), extra = "Burning Steppes", lootpage = "BWLRazorgore" },
    { name = getFormString("[RAID]", "Emerald Sanctum"), extra = "Hyjal", lootpage = "ESErennius" },
    { name = getFormString("[RAID]", "Temple of Ahn'Qiraj"), extra = "Silithus", lootpage = "AQ40Skeram" },
    { name = getFormString("[RAID]", "Naxxramas"), extra = "Eastern Plaguelands", lootpage = "NAXPatchwerk" },
    { name = getFormString("[RAID]", "Tower of Karazhan"), extra = "Deadwind Pass", lootpage = "K40Gnarlmoon" },
}

function AtlasLoot_DungeonsMenu1()
    AtlasLoot_PrepMenu(nil, title, "DUNGEONSMENU1")
    AtlasLootItemsFrame_PREV:Show()
    AtlasLootItemsFrame_NEXT:Show()
    AtlasLoot_ShowMenu(dungeonsMenu1Data, { defaultIcon = "Interface\\Icons\\Spell_Arcane_PortalIronForge", maxItems = table.getn(dungeonsMenu1Data) })
end

function AtlasLoot_DungeonsMenu2()
    AtlasLoot_PrepMenu(nil, title, "DUNGEONSMENU2")
    AtlasLootItemsFrame_PREV:Show()
    AtlasLootItemsFrame_NEXT:Show()
    AtlasLoot_ShowMenu(dungeonsMenu2Data, { defaultIcon = "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar", maxItems = table.getn(dungeonsMenu2Data) })
end