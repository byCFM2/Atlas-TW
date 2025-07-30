-- FPHordeWest Info Data
-- Compatible with Atlas Loot TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPHordeWest = {
    Name = BF["Horde"] .. " (" .. BZ["Kalimdor"] .. ")",
    Location = BZ["Kalimdor"],
    Bosses = {
        {
            id = "FPNighthaven",
            prefix = "1)",
            name = L["Nighthaven"],
            postfix = BZ["Moonglade"]..", "..L["Druid-only"],
            color = "|cff999999",
        },
        {
            id = "FPNighthavenPath",
            prefix = "",
            name = L["West of the path to Timbermaw Hold"],
            postfix = BZ["Moonglade"],
            color = "|cff999999",
        },
        {
            id = "FPEverlook",
            prefix = "2)",
            name = L["Everlook"],
            postfix = BZ["Winterspring"],
            color = "|cff999999",
        },
        {
            id = "FPNordanaar",
            prefix = "3)",
            name = L["Nordanaar"],
            postfix = BZ["Hyjal"],
            color = "|cff999999",
        },
        {
            id = "FPBloodvenomPost",
            prefix = "4)",
            name = L["Bloodvenom Post"],
            postfix = BZ["Felwood"],
            color = "|cff999999",
        },
        {
            id = "FPZoramgarOutpost",
            prefix = "5)",
            name = L["Zoram'gar Outpost"],
            postfix = BZ["Ashenvale"],
            color = "|cff999999",
        },
        {
            id = "FPValormok",
            prefix = "6)",
            name = L["Valormok"],
            postfix = BZ["Azshara"],
            color = "|cff999999",
        },
        {
            id = "FPSplintertreePost",
            prefix = "7)",
            name = L["Splintertree Post"],
            postfix = BZ["Ashenvale"],
            color = "|cff999999",
        },
        {
            id = "FPOrgrimmar",
            prefix = "8)",
            name = BZ["Orgrimmar"],
            postfix = BZ["Durotar"],
            color = "|cff999999",
        },
        {
            id = "FPSunRockRetreat",
            prefix = "9)",
            name = L["Sun Rock Retreat"],
            postfix = BZ["Stonetalon Mountains"],
            color = "|cff999999",
        },
        {
            id = "FPCrossroads",
            prefix = "10)",
            name = L["Crossroads"],
            postfix = BZ["The Barrens"],
            color = "|cff999999",
        },
        {
            id = "FPRatchet",
            prefix = "11)",
            name = L["Ratchet"],
            postfix = BZ["The Barrens"],
            color = "|cff999999",
        },
        {
            id = "FPShadowpreyVillage",
            prefix = "12)",
            name = L["Shadowprey Village"],
            postfix = BZ["Desolace"],
            color = "|cff999999",
        },
        {
            id = "FPThunderBluff",
            prefix = "13)",
            name = BZ["Thunder Bluff"],
            postfix = BZ["Mulgore"],
            color = "|cff999999",
        },
        {
            id = "FPCampTaurajo",
            prefix = "14)",
            name = L["Camp Taurajo"],
            postfix = BZ["The Barrens"],
            color = "|cff999999",
        },
        {
            id = "FPBrackenwallVillage",
            prefix = "15)",
            name = L["Brackenwall Village"],
            postfix = BZ["Dustwallow Marsh"],
            color = "|cff999999",
        },
        {
            id = "FPMudsprocket",
            prefix = "16)",
            name = L["Mudsprocket"],
            postfix = BZ["Dustwallow Marsh"],
            color = "|cff999999",
        },
        {
            id = "FPCampMojache",
            prefix = "17)",
            name = L["Camp Mojache"],
            postfix = BZ["Feralas"],
            color = "|cff999999",
        },
        {
            id = "FPFreewindPost",
            prefix = "18)",
            name = L["Freewind Post"],
            postfix = BZ["Thousand Needles"],
            color = "|cff999999",
        },
        {
            id = "FPMarshalsRefuge",
            prefix = "19)",
            name = L["Marshal's Refuge"],
            postfix = BZ["Un'Goro Crater"],
            color = "|cff999999",
        },
        {
            id = "FPCenarionHold",
            prefix = "20)",
            name = L["Cenarion Hold"],
            postfix = BZ["Silithus"],
            color = "|cff999999",
        },
        {
            id = "FPGadgetzan",
            prefix = "21)",
            name = BZ["Gadgetzan"],
            postfix = BZ["Tanaris"],
            color = "|cff999999",
        },
        {
            id = "FPTelCoBasecamp",
            prefix = "22)",
            name = L["Tel Co. Basecamp"],
            postfix = BZ["Tel'Abim"],
            color = "|cff999999",
        },
    },
}