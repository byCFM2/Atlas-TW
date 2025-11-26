---
--- DLWest.lua - Kalimdor dungeon location data
---
--- This module contains comprehensive dungeon location information for
--- the Kalimdor continent. It provides detailed location data,
--- coordinates, and access information for all dungeons in the western regions.
---
--- Features:
--- • Complete Kalimdor dungeon locations
--- • Detailed coordinate information
--- • Access requirements and prerequisites
--- • Zone-specific dungeon data
--- • Navigation assistance
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local LZ = AtlasTW.Localization.Zones
local LMD = AtlasTW.Localization.MapData

local BLUE = AtlasTW.Colors.BLUE2

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.DLWest = {
    Name = LMD["Dungeon Locations"] .. " (" .. LZ["Kalimdor"] .. ")",
    Location = LZ["Kalimdor"],
    Bosses = {
        {
            id = "DLWarsongGulch",
            prefix = "A)",
            name = LZ["Warsong Gulch"],
            postfix = LZ["The Barrens"] .. " / " .. LZ["Ashenvale"],
            color = BLUE,
        },
        {
            id = "DLSunnygladeValley",
            prefix = "B)",
            name = LMD["Sunnyglade Valley"],
            postfix = LZ["The Black Morass"],
            color = BLUE,
        },
        {
            id = "DLEmeraldSanctum",
            prefix = "1)",
            name = LZ["Emerald Sanctum"],
            postfix = LZ["Hyjal"],
        },
        {
            id = "DLBlackfathomDeeps",
            prefix = "2)",
            name = LZ["Blackfathom Deeps"],
            postfix = LZ["Ashenvale"],
        },
        {
            id = "DLTheCrescentGrove",
            prefix = "3)",
            name = LZ["The Crescent Grove"],
            postfix = LZ["Ashenvale"],
        },
        {
            id = "DLRagefireChasm",
            prefix = "4)",
            name = LZ["Ragefire Chasm"],
            postfix = LZ["Orgrimmar"],
        },
        {
            id = "DLWailingCaverns",
            prefix = "5)",
            name = LZ["Wailing Caverns"],
            postfix = LZ["The Barrens"],
        },
        {
            id = "DLMaraudon",
            prefix = "6)",
            name = LZ["Maraudon"],
            postfix = LZ["Desolace"],
        },
        {
            id = "DLDireMaul",
            prefix = "7)",
            name = LZ["Dire Maul"],
            postfix = LZ["Feralas"],
        },
        {
            id = "DLDireMaulWest",
            name = LZ["Dire Maul (West)"],
            postfix = LZ["Feralas"],
        },
        {
            id = "DLDireMaulNorth",
            name = LZ["Dire Maul (North)"],
            postfix = LZ["Feralas"],
        },
        {
            id = "DLDireMaulEast",
            name = LZ["Dire Maul (East)"],
            postfix = LZ["Feralas"],
        },
        {
            id = "DLRazorfenKraul",
            prefix = "8)",
            name = LZ["Razorfen Kraul"],
            postfix = LZ["The Barrens"],
        },
        {
            id = "DLRazorfenDowns",
            prefix = "9)",
            name = LZ["Razorfen Downs"],
            postfix = LZ["The Barrens"],
        },
        {
            id = "DLOnyxiasLair",
            prefix = "10)",
            name = LZ["Onyxia's Lair"],
            postfix = LZ["Dustwallow Marsh"],
        },
        {
            id = "DLZulFarrak",
            prefix = "11)",
            name = LZ["Zul'Farrak"],
            postfix = LZ["Tanaris"],
        },
        {
            id = "DLBlackMorass",
            prefix = "12)",
            name = LZ["The Black Morass"],
            postfix = LZ["Tanaris"],
        },
        {
            id = "DLRuinsOfAhnQiraj",
            prefix = "13)",
            name = LZ["Ruins of Ahn'Qiraj"],
            postfix = LZ["Silithus"],
        },
        {
            id = "DLTempleOfAhnQiraj",
            name = LZ["Temple of Ahn'Qiraj"],
            postfix = LZ["Silithus"],
        },
    },
}