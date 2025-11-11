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
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local Green = AtlasTW.Colors.GREEN

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPAllianceWest = {
    Name = BF["Alliance"] .. " (" .. BZ["Kalimdor"] .. ")",
    Location = BZ["Kalimdor"],
    Bosses = {
        {
            id = "FPRutTheranVillage",
            prefix = "1)",
            name = L["Rut'Theran Village"],
            postfix = BZ["Teldrassil"],
        },
        {
            id = "FPNighthaven",
            prefix = "2)",
            name = L["Nighthaven"],
            postfix = BZ["Moonglade"]..", "..L["Druid-only"],
            color = Green,
        },
        {
            id = "FPNighthavenPath",
            name = L["South of the path along Lake Elune'ara"],
            postfix = BZ["Moonglade"],
        },
        {
            id = "FPEverlook",
            prefix = "3)",
            name = L["Everlook"],
            postfix = BZ["Winterspring"],
        },
        {
            id = "FPAuberdine",
            prefix = "4)",
            name = L["Auberdine"],
            postfix = BZ["Darkshore"],
        },
        {
            id = "FPTalonbranchGlade",
            prefix = "5)",
            name = L["Talonbranch Glade"],
            postfix = BZ["Felwood"],
        },
        {
            id = "FPNordanaar",
            prefix = "6)",
            name = L["Nordanaar"],
            postfix = BZ["Hyjal"],
        },
        {
            id = "FPStonetalon",
            prefix = "7)",
            name = L["Stonetalon Peak"],
            postfix = BZ["Stonetalon Mountains"],
        },
        {
            id = "FPAstranaar",
            prefix = "8)",
            name = L["Astranaar"],
            postfix = BZ["Ashenvale"],
        },
        {
            id = "FPTalrendisPoint",
            prefix = "9)",
            name = L["Talrendis Point"],
            postfix = BZ["Azshara"],
        },
        {
            id = "FPBaelHardul",
            prefix = "10)",
            name = L["Bael Hardul"],
            postfix = BZ["Stonetalon Mountains"],
        },
        {
            id = "FPNijelsPoint",
            prefix = "11)",
            name = L["Nijel's Point"],
            postfix = BZ["Desolace"],
        },
        {
            id = "FPRatchet",
            prefix = "12)",
            name = L["Ratchet"],
            postfix = BZ["The Barrens"],
        },
        {
            id = "FPTheramoreIsle",
            prefix = "13)",
            name = L["Theramore Isle"],
            postfix = BZ["Dustwallow Marsh"],
        },
        {
            id = "FPThalanaar",
            prefix = "14)",
            name = L["Thalanaar"],
            postfix = BZ["Feralas"],
        },
        {
            id = "FPFeathermoonStronghold",
            prefix = "15)",
            name = L["Feathermoon Stronghold"],
            postfix = BZ["Feralas"],
        },
        {
            id = "FPCenarionHold",
            prefix = "16)",
            name = L["Cenarion Hold"],
            postfix = BZ["Silithus"],
        },
        {
            id = "FPMarshalsRefuge",
            prefix = "17)",
            name = L["Marshal's Refuge"],
            postfix = BZ["Un'Goro Crater"],
        },
        {
            id = "FPGadgetzan",
            prefix = "18)",
            name = BZ["Gadgetzan"],
            postfix = BZ["Tanaris"],
        },
        {
            id = "FPTelCoBasecamp",
            prefix = "19)",
            name = L["Tel Co. Basecamp"],
            postfix = BZ["Tel'Abim"],
        },
    },
}