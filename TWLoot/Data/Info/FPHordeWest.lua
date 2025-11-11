---
--- FPHordeWest.lua - Horde flight paths in Kalimdor
---
--- This module contains comprehensive flight path information for Horde
--- players in the Kalimdor continent. It provides detailed data about
--- flight masters, routes, costs, and connectivity between flight points.
---
--- Features:
--- • Complete Horde flight path network
--- • Flight master locations and coordinates
--- • Route costs and travel times
--- • Connectivity mapping
--- • Faction-specific access requirements
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local Green = AtlasTW.Colors.GREEN

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
            color = Green,
        },
        {
            id = "FPNighthavenPath",
            name = L["West of the path to Timbermaw Hold"],
            postfix = BZ["Moonglade"],
        },
        {
            id = "FPEverlook",
            prefix = "2)",
            name = L["Everlook"],
            postfix = BZ["Winterspring"],
        },
        {
            id = "FPNordanaar",
            prefix = "3)",
            name = L["Nordanaar"],
            postfix = BZ["Hyjal"],
        },
        {
            id = "FPBloodvenomPost",
            prefix = "4)",
            name = L["Bloodvenom Post"],
            postfix = BZ["Felwood"],
        },
        {
            id = "FPValormok",
            prefix = "5)",
            name = L["Valormok"],
            postfix = BZ["Azshara"],
        },
        {
            id = "FPOrgrimmar",
            prefix = "6)",
            name = BZ["Orgrimmar"],
            postfix = BZ["Durotar"],
        },
        {
            id = "FPSplintertreePost",
            prefix = "7)",
            name = L["Splintertree Post"],
            postfix = BZ["Ashenvale"],
        },
        {
            id = "FPZoramgarOutpost",
            prefix = "8)",
            name = L["Zoram'gar Outpost"],
            postfix = BZ["Ashenvale"],
        },
        {
            id = "FPSunRockRetreat",
            prefix = "9)",
            name = L["Sun Rock Retreat"],
            postfix = BZ["Stonetalon Mountains"],
        },
        {
            id = "FPCrossroads",
            prefix = "10)",
            name = L["Crossroads"],
            postfix = BZ["The Barrens"],
        },
        {
            id = "FPRatchet",
            prefix = "11)",
            name = L["Ratchet"],
            postfix = BZ["The Barrens"],
        },
        {
            id = "FPThunderBluff",
            prefix = "12)",
            name = BZ["Thunder Bluff"],
            postfix = BZ["Mulgore"],
        },
        {
            id = "FPShadowpreyVillage",
            prefix = "13)",
            name = L["Shadowprey Village"],
            postfix = BZ["Desolace"],
        },
        {
            id = "FPCampTaurajo",
            prefix = "14)",
            name = L["Camp Taurajo"],
            postfix = BZ["The Barrens"],
        },
        {
            id = "FPBrackenwallVillage",
            prefix = "15)",
            name = L["Brackenwall Village"],
            postfix = BZ["Dustwallow Marsh"],
        },
        {
            id = "FPMudsprocket",
            prefix = "16)",
            name = L["Mudsprocket"],
            postfix = BZ["Dustwallow Marsh"],
        },
        {
            id = "FPFreewindPost",
            prefix = "17)",
            name = L["Freewind Post"],
            postfix = BZ["Thousand Needles"],
        },
        {
            id = "FPCampMojache",
            prefix = "18)",
            name = L["Camp Mojache"],
            postfix = BZ["Feralas"],
        },
        {
            id = "FPGadgetzan",
            prefix = "19)",
            name = BZ["Gadgetzan"],
            postfix = BZ["Tanaris"],
        },
        {
            id = "FPTelCoBasecamp",
            prefix = "20)",
            name = L["Tel Co. Basecamp"],
            postfix = BZ["Tel'Abim"],
        },
        {
            id = "FPMarshalsRefuge",
            prefix = "21)",
            name = L["Marshal's Refuge"],
            postfix = BZ["Un'Goro Crater"],
        },
        {
            id = "FPCenarionHold",
            prefix = "22)",
            name = L["Cenarion Hold"],
            postfix = BZ["Silithus"],
        },
        {
            id = "FPSlickwickOilRig",
            prefix = "23)",
            name = L["Slickwick Oil Rig"],
            postfix = BZ["Tanaris"],
        },
    },
}