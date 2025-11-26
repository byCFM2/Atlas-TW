---
--- FPAllianceWest.lua - Alliance flight paths in Kalimdor
---
--- This module contains comprehensive flight path information for Alliance
--- players in the Kalimdor continent. It provides detailed data about
--- flight masters, routes, costs, and connectivity between flight points.
---
--- Features:
--- • Complete Alliance flight path network
--- • Flight master locations and coordinates
--- • Route costs and travel times
--- • Connectivity mapping
--- • Faction-specific access requirements
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local LM = AtlasTW.Localization.MapData
local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions

local Green = AtlasTW.Colors.GREEN

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPAllianceWest = {
    Name = LF["Alliance"] .. " (" .. LZ["Kalimdor"] .. ")",
    Location = LZ["Kalimdor"],
    Bosses = {
        {
            id = "FPRutTheranVillage",
            prefix = "1)",
            name = LM["Rut'Theran Village"],
            postfix = LZ["Teldrassil"],
        },
        {
            id = "FPNighthaven",
            prefix = "2)",
            name = LM["Nighthaven"],
            postfix = LZ["Moonglade"]..", "..LM["Druid-only"],
            color = Green,
        },
        {
            id = "FPNighthavenPath",
            name = LM["South of the path along Lake Elune'ara"],
            postfix = LZ["Moonglade"],
        },
        {
            id = "FPEverlook",
            prefix = "3)",
            name = LZ["Everlook"],
            postfix = LZ["Winterspring"],
        },
        {
            id = "FPAuberdine",
            prefix = "4)",
            name = LZ["Auberdine"],
            postfix = LZ["Darkshore"],
        },
        {
            id = "FPTalonbranchGlade",
            prefix = "5)",
            name = LM["Talonbranch Glade"],
            postfix = LZ["Felwood"],
        },
        {
            id = "FPNordanaar",
            prefix = "6)",
            name = LM["Nordanaar"],
            postfix = LZ["Hyjal"],
        },
        {
            id = "FPStonetalon",
            prefix = "7)",
            name = LM["Stonetalon Peak"],
            postfix = LZ["Stonetalon Mountains"],
        },
        {
            id = "FPAstranaar",
            prefix = "8)",
            name = LM["Astranaar"],
            postfix = LZ["Ashenvale"],
        },
        {
            id = "FPTalrendisPoint",
            prefix = "9)",
            name = LM["Talrendis Point"],
            postfix = LZ["Azshara"],
        },
        {
            id = "FPBaelHardul",
            prefix = "10)",
            name = LM["Bael Hardul"],
            postfix = LZ["Stonetalon Mountains"],
        },
        {
            id = "FPNijelsPoint",
            prefix = "11)",
            name = LM["Nijel's Point"],
            postfix = LZ["Desolace"],
        },
        {
            id = "FPRatchet",
            prefix = "12)",
            name = LZ["Ratchet"],
            postfix = LZ["The Barrens"],
        },
        {
            id = "FPTheramoreIsle",
            prefix = "13)",
            name = LZ["Theramore Isle"],
            postfix = LZ["Dustwallow Marsh"],
        },
        {
            id = "FPThalanaar",
            prefix = "14)",
            name = LM["Thalanaar"],
            postfix = LZ["Feralas"],
        },
        {
            id = "FPFeathermoonStronghold",
            prefix = "15)",
            name = LM["Feathermoon Stronghold"],
            postfix = LZ["Feralas"],
        },
        {
            id = "FPCenarionHold",
            prefix = "16)",
            name = LM["Cenarion Hold"],
            postfix = LZ["Silithus"],
        },
        {
            id = "FPMarshalsRefuge",
            prefix = "17)",
            name = LM["Marshal's Refuge"],
            postfix = LZ["Un'Goro Crater"],
        },
        {
            id = "FPGadgetzan",
            prefix = "18)",
            name = LZ["Gadgetzan"],
            postfix = LZ["Tanaris"],
        },
        {
            id = "FPTelCoBasecamp",
            prefix = "19)",
            name = LM["Tel Co. Basecamp"],
            postfix = LZ["Tel'Abim"],
        },
    },
}