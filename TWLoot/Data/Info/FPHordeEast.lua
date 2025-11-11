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
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPHordeEast = {
    Name = BF["Horde"] .. " (" .. BZ["Eastern Kingdoms"] .. ")",
    Location = BZ["Eastern Kingdoms"],
    Bosses = {
        {
            id = "FPLightsHopeChapel",
            prefix = "1)",
            name = L["Light's Hope Chapel"],
            postfix = BZ["Eastern Plaguelands"],
        },
        {
            id = "FPUndercity",
            prefix = "2)",
            name = BZ["Undercity"],
            postfix = BZ["Tirisfal Glades"],
        },
        {
            id = "FPSteepcliffPort",
            prefix = "3)",
            name = L["Steepcliff Port"],
            postfix = BZ["Tirisfal Glades"],
        },
        {
            id = "FPTheSepulcher",
            prefix = "4)",
            name = L["The Sepulcher"],
            postfix = BZ["Silverpine Forest"],
        },
        {
            id = "FPTarrenMill",
            prefix = "5)",
            name = L["Tarren Mill"],
            postfix = BZ["Hillsbrad Foothills"],
        },
        {
            id = "FPRevantuskVillage",
            prefix = "6)",
            name = L["Revantusk Village"],
            postfix = BZ["The Hinterlands"],
        },
        {
            id = "FPHammerfall",
            prefix = "7)",
            name = L["Hammerfall"],
            postfix = BZ["Arathi Highlands"],
        },
        {
            id = "FPStillwardChurch",
            prefix = "8)",
            name = L["Stillward Church"],
            postfix = BZ["Gilneas"],
        },
        {
            id = "FPShatterbladePost",
            prefix = "9)",
            name = L["Shatterblade Post"],
            postfix = BZ["Grim Reaches"],
        },
        {
            id = "FPKargath",
            prefix = "10)",
            name = L["Kargath"],
            postfix = BZ["Badlands"],
        },
        {
            id = "FPThoriumPoint",
            prefix = "11)",
            name = L["Thorium Point"],
            postfix = BZ["Searing Gorge"],
        },
        {
            id = "FPFlameCrest",
            prefix = "12)",
            name = L["Flame Crest"],
            postfix = BZ["Burning Steppes"],
        },
        {
            id = "FPStormbreakerPoint",
            prefix = "13)",
            name = L["Stormbreaker Point"],
            postfix = BZ["Balor"],
        },
        {
            id = "FPStonard",
            prefix = "14)",
            name = L["Stonard"],
            postfix = BZ["Swamp of Sorrows"],
        },
        {
            id = "FPGromgolBaseCamp",
            prefix = "15)",
            name = BZ["Grom'gol Base Camp"],
            postfix = BZ["Stranglethorn Vale"],
        },
        {
            id = "FPBootyBay",
            prefix = "16)",
            name = L["Booty Bay"],
            postfix = BZ["Stranglethorn Vale"],
        },
        {
            id = "FPMauloggRefuge",
            prefix = "17)",
            name = L["Maul'ogg Refuge"],
            postfix = BZ["Gillijim's Isle"],
        },
    },
}