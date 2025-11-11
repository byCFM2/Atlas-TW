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
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BLUE = AtlasTW.Colors.BLUE2

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.DLWest = {
    Name = L["Dungeon Locations"] .. " (" .. BZ["Kalimdor"] .. ")",
    Location = BZ["Kalimdor"],
    Bosses = {
        {
            id = "DLWarsongGulch",
            prefix = "A)",
            name = BZ["Warsong Gulch"],
            postfix = BZ["The Barrens"] .. " / " .. BZ["Ashenvale"],
            color = BLUE,
        },
        {
            id = "DLSunnygladeValley",
            prefix = "B)",
            name = L["Sunnyglade Valley"],
            postfix = L["Caverns of Time"],
            color = BLUE,
        },
        {
            id = "DLEmeraldSanctum",
            prefix = "1)",
            name = BZ["Emerald Sanctum"],
            postfix = BZ["Hyjal"],
        },
        {
            id = "DLBlackfathomDeeps",
            prefix = "2)",
            name = BZ["Blackfathom Deeps"],
            postfix = BZ["Ashenvale"],
        },
        {
            id = "DLTheCrescentGrove",
            prefix = "3)",
            name = BZ["The Crescent Grove"],
            postfix = BZ["Ashenvale"],
        },
        {
            id = "DLRagefireChasm",
            prefix = "4)",
            name = BZ["Ragefire Chasm"],
            postfix = BZ["Orgrimmar"],
        },
        {
            id = "DLWailingCaverns",
            prefix = "5)",
            name = BZ["Wailing Caverns"],
            postfix = BZ["The Barrens"],
        },
        {
            id = "DLMaraudon",
            prefix = "6)",
            name = BZ["Maraudon"],
            postfix = BZ["Desolace"],
        },
        {
            id = "DLDireMaul",
            prefix = "7)",
            name = BZ["Dire Maul"],
            postfix = BZ["Feralas"],
        },
        {
            id = "DLDireMaulWest",
            name = BZ["Dire Maul (West)"],
            postfix = BZ["Feralas"],
        },
        {
            id = "DLDireMaulNorth",
            name = BZ["Dire Maul (North)"],
            postfix = BZ["Feralas"],
        },
        {
            id = "DLDireMaulEast",
            name = BZ["Dire Maul (East)"],
            postfix = BZ["Feralas"],
        },
        {
            id = "DLRazorfenKraul",
            prefix = "8)",
            name = BZ["Razorfen Kraul"],
            postfix = BZ["The Barrens"],
        },
        {
            id = "DLRazorfenDowns",
            prefix = "9)",
            name = BZ["Razorfen Downs"],
            postfix = BZ["The Barrens"],
        },
        {
            id = "DLOnyxiasLair",
            prefix = "10)",
            name = BZ["Onyxia's Lair"],
            postfix = BZ["Dustwallow Marsh"],
        },
        {
            id = "DLZulFarrak",
            prefix = "11)",
            name = BZ["Zul'Farrak"],
            postfix = BZ["Tanaris"],
        },
        {
            id = "DLBlackMorass",
            prefix = "12)",
            name = BZ["Black Morass"],
            postfix = BZ["Tanaris"],
        },
        {
            id = "DLRuinsOfAhnQiraj",
            prefix = "13)",
            name = BZ["Ruins of Ahn'Qiraj"],
            postfix = BZ["Silithus"],
        },
        {
            id = "DLTempleOfAhnQiraj",
            name = BZ["Temple of Ahn'Qiraj"],
            postfix = BZ["Silithus"],
        },
    },
}