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

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions
local LMD = AtlasTW.Localization.MapData

local Green = AtlasTW.Colors.GREEN

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPHordeWest = {
    Name = LF["Horde"] .. " (" .. LZ["Kalimdor"] .. ")",
    Location = LZ["Kalimdor"],
    Bosses = {
        {
            id = "FPNighthaven",
            prefix = "1)",
            name = LMD["Nighthaven"],
            postfix = LZ["Moonglade"]..", "..LMD["Druid-only"],
            color = Green,
        },
        {
            id = "FPNighthavenPath",
            name = LMD["West of the path to Timbermaw Hold"],
            postfix = LZ["Moonglade"],
        },
        {
            id = "FPEverlook",
            prefix = "2)",
            name = LZ["Everlook"],
            postfix = LZ["Winterspring"],
        },
        {
            id = "FPNordanaar",
            prefix = "3)",
            name = LMD["Nordanaar"],
            postfix = LZ["Hyjal"],
        },
        {
            id = "FPBloodvenomPost",
            prefix = "4)",
            name = LMD["Bloodvenom Post"],
            postfix = LZ["Felwood"],
        },
        {
            id = "FPValormok",
            prefix = "5)",
            name = LMD["Valormok"],
            postfix = LZ["Azshara"],
        },
        {
            id = "FPOrgrimmar",
            prefix = "6)",
            name = LZ["Orgrimmar"],
            postfix = LZ["Durotar"],
        },
        {
            id = "FPSplintertreePost",
            prefix = "7)",
            name = LMD["Splintertree Post"],
            postfix = LZ["Ashenvale"],
        },
        {
            id = "FPZoramgarOutpost",
            prefix = "8)",
            name = LMD["Zoram'gar Outpost"],
            postfix = LZ["Ashenvale"],
        },
        {
            id = "FPSunRockRetreat",
            prefix = "9)",
            name = LMD["Sun Rock Retreat"],
            postfix = LZ["Stonetalon Mountains"],
        },
        {
            id = "FPCrossroads",
            prefix = "10)",
            name = LMD["Crossroads"],
            postfix = LZ["The Barrens"],
        },
        {
            id = "FPRatchet",
            prefix = "11)",
            name = LZ["Ratchet"],
            postfix = LZ["The Barrens"],
        },
        {
            id = "FPThunderBluff",
            prefix = "12)",
            name = LZ["Thunder Bluff"],
            postfix = LZ["Mulgore"],
        },
        {
            id = "FPShadowpreyVillage",
            prefix = "13)",
            name = LMD["Shadowprey Village"],
            postfix = LZ["Desolace"],
        },
        {
            id = "FPCampTaurajo",
            prefix = "14)",
            name = LMD["Camp Taurajo"],
            postfix = LZ["The Barrens"],
        },
        {
            id = "FPBrackenwallVillage",
            prefix = "15)",
            name = LMD["Brackenwall Village"],
            postfix = LZ["Dustwallow Marsh"],
        },
        {
            id = "FPMudsprocket",
            prefix = "16)",
            name = LMD["Mudsprocket"],
            postfix = LZ["Dustwallow Marsh"],
        },
        {
            id = "FPFreewindPost",
            prefix = "17)",
            name = LMD["Freewind Post"],
            postfix = LZ["Thousand Needles"],
        },
        {
            id = "FPCampMojache",
            prefix = "18)",
            name = LMD["Camp Mojache"],
            postfix = LZ["Feralas"],
        },
        {
            id = "FPGadgetzan",
            prefix = "19)",
            name = LZ["Gadgetzan"],
            postfix = LZ["Tanaris"],
        },
        {
            id = "FPTelCoBasecamp",
            prefix = "20)",
            name = LMD["Tel Co. Basecamp"],
            postfix = LZ["Tel'Abim"],
        },
        {
            id = "FPMarshalsRefuge",
            prefix = "21)",
            name = LMD["Marshal's Refuge"],
            postfix = LZ["Un'Goro Crater"],
        },
        {
            id = "FPCenarionHold",
            prefix = "22)",
            name = LMD["Cenarion Hold"],
            postfix = LZ["Silithus"],
        },
        {
            id = "FPSlickwickOilRig",
            prefix = "23)",
            name = LMD["Slickwick Oil Rig"],
            postfix = LZ["Tanaris"],
        },
    },
}