-- FPAllianceEast Info Data
-- Compatible with Atlas Loot TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPAllianceEast = {
    Name = BF["Alliance"] .. " (" .. BZ["Eastern Kingdoms"] .. ")",
    Location = BZ["Eastern Kingdoms"],
    Bosses = {
        {
            id = "FPAlahThalas",
            prefix = "1)",
            name = L["Alah'Thalas"],
            postfix = BZ["Thalassian Highlands"],
            color = "|cff999999",
        },
        {
            id = "FPLightsHope",
            prefix = "2)",
            name = L["Light's Hope Chapel"],
            postfix = BZ["Eastern Plaguelands"],
            color = "|cff999999",
        },
        {
            id = "FPChillwind",
            prefix = "3)",
            name = L["Chillwind Point"],
            postfix = BZ["Western Plaguelands"],
            color = "|cff999999",
        },
        {
            id = "FPAeriePeak",
            prefix = "4)",
            name = L["Aerie Peak"],
            postfix = BZ["The Hinterlands"],
            color = "|cff999999",
        },
        {
            id = "FPRavenshire",
            prefix = "5)",
            name = L["Ravenshire"],
            postfix = BZ["Gilneas"],
            color = "|cff999999",
        },
        {
            id = "FPSouthshore",
            prefix = "6)",
            name = L["Southshore"],
            postfix = BZ["Hillsbrad Foothills"],
            color = "|cff999999",
        },
        {
            id = "FPRefugePointe",
            prefix = "7)",
            name = L["Refuge Pointe"],
            postfix = BZ["Arathi Highlands"],
            color = "|cff999999",
        },
        {
            id = "FPMenethilHarbor",
            prefix = "8)",
            name = L["Menethil Harbor"],
            postfix = BZ["Wetlands"],
            color = "|cff999999",
        },
        {
            id = "FPDunAgrath",
            prefix = "9)",
            name = L["Dun Agrath"],
            postfix = BZ["Wetlands"],
            color = "|cff999999",
        },
        {
            id = "FPIronforge",
            prefix = "10)",
            name = BZ["Ironforge"],
            postfix = BZ["Dun Morogh"],
            color = "|cff999999",
        },
        {
            id = "FPIronforgeAirfields",
            prefix = "",
            name = L["Ironforge Airfields"],
            postfix = BZ["Dun Morogh"],
            color = "|cff999999",
        },
        {
            id = "FPDunKithas",
            prefix = "11)",
            name = L["Dun Kithas"],
            postfix = BZ["Grim Reaches"],
            color = "|cff999999",
        },
        {
            id = "FPThelsamar",
            prefix = "12)",
            name = L["Thelsamar"],
            postfix = BZ["Loch Modan"],
            color = "|cff999999",
        },
        {
            id = "FPThoriumPoint",
            prefix = "13)",
            name = L["Thorium Point"],
            postfix = BZ["Searing Gorge"],
            color = "|cff999999",
        },
        {
            id = "FPAmbershire",
            prefix = "14)",
            name = L["Ambershire"],
            postfix = BZ["Northwind"],
            color = "|cff999999",
        },
        {
            id = "FPMorgansVigil",
            prefix = "15)",
            name = L["Morgan's Vigil"],
            postfix = BZ["Burning Steppes"],
            color = "|cff999999",
        },
        {
            id = "FPStormwindCity",
            prefix = "16)",
            name = BZ["Stormwind City"],
            postfix = BZ["Elwynn Forest"],
            color = "|cff999999",
        },
        {
            id = "FPSI7Outpost",
            prefix = "17)",
            name = L["SI:7 Outpost"],
            postfix = BZ["Balor"],
            color = "|cff999999",
        },
        {
            id = "FPLakeshire",
            prefix = "18)",
            name = L["Lakeshire"],
            postfix = BZ["Redridge Mountains"],
            color = "|cff999999",
        },
        {
            id = "FPSentinelHill",
            prefix = "19)",
            name = L["Sentinel Hill"],
            postfix = BZ["Westfall"],
            color = "|cff999999",
        },
        {
            id = "FPDarkshire",
            prefix = "20)",
            name = L["Darkshire"],
            postfix = BZ["Duskwood"],
            color = "|cff999999",
        },
        {
            id = "FPNethergardeKeep",
            prefix = "21)",
            name = L["Nethergarde Keep"],
            postfix = BZ["Blasted Lands"],
            color = "|cff999999",
        },
        {
            id = "FPBootyBay",
            prefix = "22)",
            name = BZ["Booty Bay"],
            postfix = BZ["Stranglethorn Vale"],
            color = "|cff999999",
        },
        {
            id = "FPCaelansRest",
            prefix = "23)",
            name = L["Caelan's Rest"],
            postfix = BZ["Lapidis Isle"],
            color = "|cff999999",
        },
    },
}