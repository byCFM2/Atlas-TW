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

local LM = AtlasTW.Localization.MapData
local LZ = AtlasTW.Localization.Zones

local BLUE = AtlasTW.Colors.BLUE2

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.DLEast = {
    Name = LM["Dungeon Locations"] .. " (" .. LZ["Eastern Kingdoms"] .. ")",
    Location = LZ["Eastern Kingdoms"],
    Bosses = {
        {
            id = "DLAlteracValley",
            prefix = "A)",
            name = LZ["Alterac Valley"],
            postfix = LZ["Alterac Mountains"] .. " / " .. LZ["Hillsbrad Foothills"],
            color = BLUE,
        },
        {
            id = "DLArathiBasin",
            prefix = "B)",
            name = LZ["Arathi Basin"],
            postfix = LZ["Arathi Highlands"],
            color = BLUE,
        },
        {
            id = "DLBloodRing",
            prefix = "C)",
            name = LZ["Blood Ring"] .. LM[" Arena"],
            postfix = LZ["Stranglethorn Vale"],
            color = BLUE,
        },
        {
            id = "DLScarletMonastery",
            prefix = "1)",
            name = LZ["Scarlet Monastery"],
            postfix = LZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryGraveyard",
            name = LZ["Scarlet Monastery (Graveyard)"],
            postfix = LZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryLibrary",
            name = LZ["Scarlet Monastery (Library)"],
            postfix = LZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryArmory",
            name = LZ["Scarlet Monastery (Armory)"],
            postfix = LZ["Tirisfal Glades"],
        },
        {
            id = "DLScarletMonasteryCathedral",
            name = LZ["Scarlet Monastery (Cathedral)"],
            postfix = LZ["Tirisfal Glades"],
        },
        {
            id = "DLStratholme",
            prefix = "2)",
            name = LZ["Stratholme"],
            postfix = LZ["Eastern Plaguelands"],
        },
        {
            id = "DLNaxxramas",
            prefix = "3)",
            name = LZ["Naxxramas"],
            postfix = LZ["Eastern Plaguelands"],
        },
        {
            id = "DLScholomance",
            prefix = "4)",
            name = LZ["Scholomance"],
            postfix = LZ["Western Plaguelands"],
        },
        {
            id = "DLShadowfangKeep",
            prefix = "5)",
            name = LZ["Shadowfang Keep"],
            postfix = LZ["Silverpine Forest"],
        },
        {
            id = "DLGilneasCity",
            prefix = "6)",
            name = LZ["Gilneas City"],
            postfix = LZ["Gilneas"],
        },
        {
            id = "DLGnomeregan",
            prefix = "7)",
            name = LZ["Gnomeregan"],
            postfix = LZ["Dun Morogh"],
        },
        {
            id = "DLUldaman",
            prefix = "8)",
            name = LZ["Uldaman"],
            postfix = LZ["Badlands"],
        },
        {
            id = "DLBlackwingLair",
            prefix = "9)",
            name = LZ["Blackwing Lair"],
            postfix = LZ["Blackrock Spire"],
        },
        {
            id = "DLBlackrockDepths",
            name = LZ["Blackrock Depths"],
            postfix = LZ["Blackrock Mountain"],
        },
        {
            id = "DLBlackrockSpire",
            name = LZ["Blackrock Spire"],
            postfix = LZ["Blackrock Mountain"],
        },
        {
            id = "DLMoltenCore",
            name = LZ["Molten Core"],
            postfix = LZ["Blackrock Depths"],
        },
        {
            id = "DLHateforgeQuarry",
            prefix = "10)",
            name = LZ["Hateforge Quarry"],
            postfix = LZ["Burning Steppes"],
        },
        {
            id = "DLTheStockade",
            prefix = "11)",
            name = LZ["The Stockade"],
            postfix = LZ["Stormwind City"],
        },
        {
            id = "DLStormwindVault",
            name = LZ["Stormwind Vault"],
            postfix = LZ["Stormwind City"],
        },
        {
            id = "DLTheDeadmines",
            prefix = "12)",
            name = LZ["The Deadmines"],
            postfix = LZ["Westfall"],
        },
        {
            id = "DLKarazhanCrypt",
            prefix = "13)",
            name = LZ["Karazhan Crypt"],
            postfix = LZ["Deadwind Pass"],
        },
        {
            id = "DLLowerKarazhanHalls",
            name = LZ["Lower Karazhan Halls"],
            postfix = LZ["Deadwind Pass"],
        },
        {
            id = "DLTowerOfKarazhan",
            name = LZ["Tower of Karazhan"],
            postfix = LZ["Deadwind Pass"],
        },
        {
            id = "DLSunkenTemple",
            prefix = "14)",
            name = LM["Sunken Temple"],
            postfix = LZ["Swamp of Sorrows"],
        },
        {
            id = "DLZulGurub",
            prefix = "15)",
            name = LZ["Zul'Gurub"],
            postfix = LZ["Stranglethorn Vale"],
        },
        {
            id = "DLDragonmawRetreat",
            prefix = "16)",
            name = LZ["Dragonmaw Retreat"],
            postfix = LZ["Wetlands"],
        },
        {
            id = "DLStormwroughtRuins",
            prefix = "17)",
            name = LZ["Stormwrought Ruins"],
            postfix = LZ["Balor"],
        },
    },
}