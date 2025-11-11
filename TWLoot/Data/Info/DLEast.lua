---
--- DLEast.lua - Eastern Kingdoms dungeon location data
---
--- This module contains comprehensive dungeon location information for
--- the Eastern Kingdoms continent. It provides detailed location data,
--- coordinates, and access information for all dungeons in the eastern regions.
---
--- Features:
--- • Complete Eastern Kingdoms dungeon locations
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

AtlasTW.InstanceData.DLEast = {
    Name = L["Dungeon Locations"] .. " (" .. BZ["Eastern Kingdoms"] .. ")",
    Location = BZ["Eastern Kingdoms"],
    Bosses = {
        {
            id = "DLAlteracValley",
            prefix = "A)",
            name = BZ["Alterac Valley"],
            postfix = BZ["Alterac Mountains"] .. " / " .. BZ["Hillsbrad Foothills"],
            color = BLUE,
        },
        {
            id = "DLArathiBasin",
            prefix = "B)",
            name = BZ["Arathi Basin"],
            postfix = BZ["Arathi Highlands"],
            color = BLUE,
        },
        {
            id = "DLBloodRing",
            prefix = "C)",
            name = BZ["Blood Ring"] .. " Arena",
            postfix = BZ["Stranglethorn Vale"],
            color = BLUE,
        },
        {
            id = "DLScarletMonastery",
            prefix = "1)",
            name = BZ["Scarlet Monastery"],
            postfix = BZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryGraveyard",
            name = BZ["Scarlet Monastery (Graveyard)"],
            postfix = BZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryLibrary",
            name = BZ["Scarlet Monastery (Library)"],
            postfix = BZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryArmory",
            name = BZ["Scarlet Monastery (Armory)"],
            postfix = BZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryCathedral",
            name = BZ["Scarlet Monastery (Cathedral)"],
            postfix = BZ["Tirisfal Glades"],
        },
        {
            id = "DLStratholme",
            prefix = "2)",
            name = BZ["Stratholme"],
            postfix = BZ["Eastern Plaguelands"],
        },
        {
            id = "DLNaxxramas",
            prefix = "3)",
            name = BZ["Naxxramas"],
            postfix = BZ["Eastern Plaguelands"],
        },
        {
            id = "DLScholomance",
            prefix = "4)",
            name = BZ["Scholomance"],
            postfix = BZ["Western Plaguelands"],
        },
        {
            id = "DLShadowfangKeep",
            prefix = "5)",
            name = BZ["Shadowfang Keep"],
            postfix = BZ["Silverpine Forest"],
        },
        {
            id = "DLGilneasCity",
            prefix = "6)",
            name = BZ["Gilneas City"],
            postfix = BZ["Gilneas"],
        },
        {
            id = "DLGnomeregan",
            prefix = "7)",
            name = BZ["Gnomeregan"],
            postfix = BZ["Dun Morogh"],
        },
        {
            id = "DLUldaman",
            prefix = "8)",
            name = BZ["Uldaman"],
            postfix = BZ["Badlands"],
        },
        {
            id = "DLBlackwingLair",
            prefix = "9)",
            name = BZ["Blackwing Lair"],
            postfix = BZ["Blackrock Spire"],
        },
        {
            id = "DLBlackrockDepths",
            name = BZ["Blackrock Depths"],
            postfix = BZ["Blackrock Mountain"],
        },
        {
            id = "DLBlackrockSpire",
            name = BZ["Blackrock Spire"],
            postfix = BZ["Blackrock Mountain"],
        },
        {
            id = "DLMoltenCore",
            name = BZ["Molten Core"],
            postfix = BZ["Blackrock Depths"],
        },
        {
            id = "DLHateforgeQuarry",
            prefix = "10)",
            name = BZ["Hateforge Quarry"],
            postfix = BZ["Burning Steppes"],
        },
        {
            id = "DLTheStockade",
            prefix = "11)",
            name = BZ["The Stockade"],
            postfix = BZ["Stormwind City"],
        },
        {
            id = "DLStormwindVault",
            name = BZ["Stormwind Vault"],
            postfix = BZ["Stormwind City"],
        },
        {
            id = "DLTheDeadmines",
            prefix = "12)",
            name = BZ["The Deadmines"],
            postfix = BZ["Westfall"],
        },
        {
            id = "DLKarazhanCrypt",
            prefix = "13)",
            name = BZ["Karazhan Crypt"],
            postfix = BZ["Deadwind Pass"],
        },
        {
            id = "DLLowerKarazhanHalls",
            name = BZ["Lower Karazhan Halls"],
            postfix = BZ["Deadwind Pass"],
        },
        {
            id = "DLTowerOfKarazhan",
            name = BZ["Tower of Karazhan"],
            postfix = BZ["Deadwind Pass"],
        },
        {
            id = "DLSunkenTemple",
            prefix = "14)",
            name = L["Sunken Temple"],
            postfix = BZ["Swamp of Sorrows"],
        },
        {
            id = "DLZulGurub",
            prefix = "15)",
            name = BZ["Zul'Gurub"],
            postfix = BZ["Stranglethorn Vale"],
        },
        {
            id = "DLDragonmawRetreat",
            prefix = "16)",
            name = BZ["Dragonmaw Retreat"],
            postfix = BZ["Wetlands"],
        },
        {
            id = "DLStormwroughtRuins",
            prefix = "17)",
            name = BZ["Stormwrought Ruins"],
            postfix = BZ["Balor"],
        },
    },
}