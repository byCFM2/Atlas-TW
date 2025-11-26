---
--- FPHordeEast.lua - Horde flight paths in Eastern Kingdoms
---
--- This module contains comprehensive flight path information for Horde
--- players in the Eastern Kingdoms continent. It provides detailed data about
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

local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions
local LMD = AtlasTW.Localization.MapData

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPHordeEast = {
    Name = LF["Horde"] .. " (" .. LZ["Eastern Kingdoms"] .. ")",
    Location = LZ["Eastern Kingdoms"],
    Bosses = {
        {
            id = "FPLightsHopeChapel",
            prefix = "1)",
            name = LMD["Light's Hope Chapel"],
            postfix = LZ["Eastern Plaguelands"],
        },
        {
            id = "FPUndercity",
            prefix = "2)",
            name = LZ["Undercity"],
            postfix = LZ["Tirisfal Glades"],
        },
        {
            id = "FPSteepcliffPort",
            prefix = "3)",
            name = LMD["Steepcliff Port"],
            postfix = LZ["Tirisfal Glades"],
        },
        {
            id = "FPTheSepulcher",
            prefix = "4)",
            name = LMD["The Sepulcher"],
            postfix = LZ["Silverpine Forest"],
        },
        {
            id = "FPTarrenMill",
            prefix = "5)",
            name = LMD["Tarren Mill"],
            postfix = LZ["Hillsbrad Foothills"],
        },
        {
            id = "FPRevantuskVillage",
            prefix = "6)",
            name = LMD["Revantusk Village"],
            postfix = LZ["The Hinterlands"],
        },
        {
            id = "FPHammerfall",
            prefix = "7)",
            name = LMD["Hammerfall"],
            postfix = LZ["Arathi Highlands"],
        },
        {
            id = "FPStillwardChurch",
            prefix = "8)",
            name = LMD["Stillward Church"],
            postfix = LZ["Gilneas"],
        },
        {
            id = "FPShatterbladePost",
            prefix = "9)",
            name = LMD["Shatterblade Post"],
            postfix = LZ["Grim Reaches"],
        },
        {
            id = "FPKargath",
            prefix = "10)",
            name = LMD["Kargath"],
            postfix = LZ["Badlands"],
        },
        {
            id = "FPThoriumPoint",
            prefix = "11)",
            name = LMD["Thorium Point"],
            postfix = LZ["Searing Gorge"],
        },
        {
            id = "FPFlameCrest",
            prefix = "12)",
            name = LMD["Flame Crest"],
            postfix = LZ["Burning Steppes"],
        },
        {
            id = "FPStormbreakerPoint",
            prefix = "13)",
            name = LMD["Stormbreaker Point"],
            postfix = LZ["Balor"],
        },
        {
            id = "FPStonard",
            prefix = "14)",
            name = LMD["Stonard"],
            postfix = LZ["Swamp of Sorrows"],
        },
        {
            id = "FPGromgolBaseCamp",
            prefix = "15)",
            name = LZ["Grom'gol Base Camp"],
            postfix = LZ["Stranglethorn Vale"],
        },
        {
            id = "FPBootyBay",
            prefix = "16)",
            name = LZ["Booty Bay"],
            postfix = LZ["Stranglethorn Vale"],
        },
        {
            id = "FPMauloggRefuge",
            prefix = "17)",
            name = LMD["Maul'ogg Refuge"],
            postfix = LZ["Gillijim's Isle"],
        },
    },
}