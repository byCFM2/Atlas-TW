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

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions
local LM = AtlasTW.Localization.MapData

local colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TransportRoutes = {
    Name = L["Transport Routes"],
    Location = LM["Azeroth"],
    Bosses = {
        {
            id = "TRRutTheranVillage",
            prefix = "1)",
            name = LM["Rut'Theran Village"],
            postfix = LZ["Teldrassil"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRAuberdine",
            prefix = "2)",
            name = LZ["Auberdine"],
            postfix = LZ["Darkshore"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TROrgrimmar",
            prefix = "3)",
            name = LZ["Orgrimmar"],
            postfix = LZ["The Barrens"]..", "..LF["Horde"],
            color = colors.RED,
        },
        {
            id = "TRSparkwaterPort",
            prefix = "4)",
            name = LM["Sparkwater Port"],
            postfix = LZ["The Barrens"]..", "..LF["Neutral"],
            color = colors.RED,
        },
        {
            id = "TRRatchet",
            prefix = "5)",
            name = LZ["Ratchet"],
            postfix = LZ["The Barrens"]..", "..LF["Neutral"],
            color = colors.YELLOW2,
        },
        {
            id = "TRThunderBluff",
            prefix = "6)",
            name = LZ["Thunder Bluff"],
            postfix = LZ["Mulgore"]..", "..LF["Horde"],
            color = colors.RED,
        },
        {
            id = "TRFeathermoonStronghold",
            prefix = "7)",
            name = LM["Feathermoon Stronghold"],
            postfix = LZ["Feralas"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRTheramoreIsle",
            prefix = "8)",
            name = LZ["Theramore Isle"],
            postfix = LZ["Dustwallow Marsh"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRAlahThalas",
            prefix = "9)",
            name = LM["Alah'Thalas"],
            postfix = LZ["Thalassian Highlands"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRUndercity",
            prefix = "10)",
            name = LZ["Undercity"],
            postfix = LZ["Tirisfal Glades"]..", "..LF["Horde"],
            color = colors.RED,
        },
        {
            id = "TRRevantuskVillage",
            prefix = "11)",
            name = LM["Revantusk Village"],
            postfix = LZ["The Hinterlands"]..", "..LF["Horde"],
            color = colors.RED,
        },
        {
            id = "TRMenethilHarbor",
            prefix = "12)",
            name = LZ["Menethil Harbor"],
            postfix = LZ["Wetlands"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRIronforge",
            prefix = "13)",
            name = LZ["Ironforge"],
            postfix = LZ["Dun Morogh"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRKargath",
            prefix = "14)",
            name = LM["Kargath"],
            postfix = LZ["Badlands"]..", "..LF["Horde"],
            color = colors.RED,
        },
        {
            id = "TRStormwindCity",
            prefix = "15)",
            name = LZ["Stormwind City"],
            postfix = LZ["Elwynn Forest"]..", "..LF["Alliance"],
            color = colors.BLUE,
        },
        {
            id = "TRGromgolBaseCamp",
            prefix = "16)",
            name = LZ["Grom'gol Base Camp"],
            postfix = LZ["Stranglethorn Vale"]..", "..LF["Horde"],
            color = colors.RED,
        },
        {
            id = "TRBootyBay",
            prefix = "17)",
            name = LZ["Booty Bay"],
            postfix = LZ["Stranglethorn Vale"]..", "..LF["Neutral"],
            color = colors.YELLOW2,
        },
    },
}