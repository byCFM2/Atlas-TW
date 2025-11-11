---
--- TransportRoutes.lua - Transportation route data
---
--- This module contains comprehensive transportation route information for
--- Azeroth. It provides detailed data about boats, zeppelins, portals,
--- and other transportation methods connecting different zones and continents.
---
--- Features:
--- • Complete transportation network mapping
--- • Boat and zeppelin schedules
--- • Portal locations and requirements
--- • Cross-continent travel routes
--- • Transportation costs and timings
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TransportRoutes = {
    Name = L["Transport Routes"],
    Location = L["Azeroth"],
    Bosses = {
        {
            id = "TRRutTheranVillage",
            prefix = "1)",
            name = L["Rut'Theran Village"],
            postfix = BZ["Teldrassil"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRAuberdine",
            prefix = "2)",
            name = BZ["Auberdine"],
            postfix = BZ["Darkshore"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TROrgrimmar",
            prefix = "3)",
            name = BZ["Orgrimmar"],
            postfix = BZ["The Barrens"]..", "..L["Horde"],
            color = colors.RED,
        },
        {
            id = "TRSparkwaterPort",
            prefix = "4)",
            name = L["Sparkwater Port"],
            postfix = BZ["The Barrens"]..", "..L["Horde"],
            color = colors.RED,
        },
        {
            id = "TRRatchet",
            prefix = "5)",
            name = BZ["Ratchet"],
            postfix = BZ["The Barrens"]..", "..L["Neutral"],
            color = colors.YELLOW2,
        },
        {
            id = "TRThunderBluff",
            prefix = "6)",
            name = BZ["Thunder Bluff"],
            postfix = BZ["Mulgore"]..", "..L["Horde"],
            color = colors.RED,
        },
        {
            id = "TRFeathermoonStronghold",
            prefix = "7)",
            name = L["Feathermoon Stronghold"],
            postfix = BZ["Feralas"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRTheramoreIsle",
            prefix = "8)",
            name = BZ["Theramore Isle"],
            postfix = BZ["Dustwallow Marsh"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRAlahThalas",
            prefix = "9)",
            name = L["Alah'Thalas"],
            postfix = BZ["Thalassian Highlands"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRUndercity",
            prefix = "10)",
            name = BZ["Undercity"],
            postfix = BZ["Tirisfal Glades"]..", "..L["Horde"],
            color = colors.RED,
        },
        {
            id = "TRRevantuskVillage",
            prefix = "11)",
            name = L["Revantusk Village"],
            postfix = BZ["The Hinterlands"]..", "..L["Horde"],
            color = colors.RED,
        },
        {
            id = "TRMenethilHarbor",
            prefix = "12)",
            name = BZ["Menethil Harbor"],
            postfix = BZ["Wetlands"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRIronforge",
            prefix = "13)",
            name = BZ["Ironforge"],
            postfix = BZ["Dun Morogh"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRKargath",
            prefix = "14)",
            name = L["Kargath"],
            postfix = BZ["Badlands"]..", "..L["Horde"],
            color = colors.RED,
        },
        {
            id = "TRStormwindCity",
            prefix = "15)",
            name = BZ["Stormwind City"],
            postfix = BZ["Elwynn Forest"]..", "..L["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRGromgolBaseCamp",
            prefix = "16)",
            name = BZ["Grom'gol Base Camp"],
            postfix = BZ["Stranglethorn Vale"]..", "..L["Horde"],
            color = colors.RED,
        },
        {
            id = "TRBootyBay",
            prefix = "17)",
            name = BZ["Booty Bay"],
            postfix = BZ["Stranglethorn Vale"]..", "..L["Neutral"],
            color = colors.YELLOW2,
        },
    },
}