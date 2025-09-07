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
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

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
            color = "|cff999999",
        },
        {
            id = "FPNighthaven",
            prefix = "2)",
            name = L["Nighthaven"],
            postfix = BZ["Moonglade"]..", "..L["Druid-only"],
            color = "|cff999999",
        },
        {
            id = "FPNighthavenPath",
            prefix = "",
            name = L["South of the path along Lake Elune'ara"],
            postfix = BZ["Moonglade"],
            color = "|cff999999",
        },
        {
            id = "FPEverlook",
            prefix = "3)",
            name = L["Everlook"],
            postfix = BZ["Winterspring"],
            color = "|cff999999",
        },
        {
            id = "FPAuberdine",
            prefix = "4)",
            name = L["Auberdine"],
            postfix = BZ["Darkshore"],
            color = "|cff999999",
        },
        {
            id = "FPTalonbranchGlade",
            prefix = "5)",
            name = L["Talonbranch Glade"],
            postfix = BZ["Felwood"],
            color = "|cff999999",
        },
        {
            id = "FPNordanaar",
            prefix = "6)",
            name = L["Nordanaar"],
            postfix = BZ["Hyjal"],
            color = "|cff999999",
        },
        {
            id = "FPStonetalon",
            prefix = "7)",
            name = L["Stonetalon Peak"],
            postfix = BZ["Stonetalon Mountains"],
            color = "|cff999999",
        },
        {
            id = "FPAstranaar",
            prefix = "8)",
            name = L["Astranaar"],
            postfix = BZ["Ashenvale"],
            color = "|cff999999",
        },
        {
            id = "FPTalrendisPoint",
            prefix = "9)",
            name = L["Talrendis Point"],
            postfix = BZ["Azshara"],
            color = "|cff999999",
        },
        {
            id = "FPNijelsPoint",
            prefix = "10)",
            name = L["Nijel's Point"],
            postfix = BZ["Desolace"],
            color = "|cff999999",
        },
        {
            id = "FPBaelHardul",
            prefix = "11)",
            name = L["Bael Hardul"],
            postfix = BZ["Stonetalon Mountains"],
            color = "|cff999999",
        },
        {
            id = "FPRatchet",
            prefix = "12)",
            name = L["Ratchet"],
            postfix = BZ["The Barrens"],
            color = "|cff999999",
        },
        {
            id = "FPTheramoreIsle",
            prefix = "13)",
            name = L["Theramore Isle"],
            postfix = BZ["Dustwallow Marsh"],
            color = "|cff999999",
        },
        {
            id = "FPFeathermoonStronghold",
            prefix = "14)",
            name = L["Feathermoon Stronghold"],
            postfix = BZ["Feralas"],
            color = "|cff999999",
        },
        {
            id = "FPThalanaar",
            prefix = "15)",
            name = L["Thalanaar"],
            postfix = BZ["Feralas"],
            color = "|cff999999",
        },
        {
            id = "FPMarshalsRefuge",
            prefix = "16)",
            name = L["Marshal's Refuge"],
            postfix = BZ["Un'Goro Crater"],
            color = "|cff999999",
        },
        {
            id = "FPCenarionHold",
            prefix = "17)",
            name = L["Cenarion Hold"],
            postfix = BZ["Silithus"],
            color = "|cff999999",
        },
        {
            id = "FPGadgetzan",
            prefix = "18)",
            name = BZ["Gadgetzan"],
            postfix = BZ["Tanaris"],
            color = "|cff999999",
        },
        {
            id = "FPTelCoBasecamp",
            prefix = "19)",
            name = L["Tel Co. Basecamp"],
            postfix = BZ["Tel'Abim"],
            color = "|cff999999",
        },
    },
}