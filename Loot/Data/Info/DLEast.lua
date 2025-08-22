-- DLEast Info Data
-- Compatible with Atlas Loot TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")

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
            color = "|cff6666ff",
        },
        {
            id = "DLArathiBasin",
            prefix = "B)",
            name = BZ["Arathi Basin"],
            postfix = BZ["Arathi Highlands"],
            color = "|cff6666ff",
        },
        {
            id = "DLBloodRing",
            prefix = "C)",
            name = BZ["Blood Ring"] .. " Arena",
            postfix = BZ["Stranglethorn Vale"],
            color = "|cff6666ff",
        },
        {
            id = "DLScarletMonastery",
            prefix = "1)",
            name = BZ["Scarlet Monastery"],
            postfix = BZ["Tirisfal Glades"],
            color = "|cff999999",
        },
        {
            id = "DLStratholme",
            prefix = "2)",
            name = BZ["Stratholme"],
            postfix = BZ["Eastern Plaguelands"],
            color = "|cff999999",
        },
        {
            id = "DLNaxxramas",
            prefix = "3)",
            name = BZ["Naxxramas"],
            postfix = BZ["Eastern Plaguelands"],
            color = "|cff999999",
        },
        {
            id = "DLScholomance",
            prefix = "4)",
            name = BZ["Scholomance"],
            postfix = BZ["Western Plaguelands"],
            color = "|cff999999",
        },
        {
            id = "DLShadowfangKeep",
            prefix = "5)",
            name = BZ["Shadowfang Keep"],
            postfix = BZ["Silverpine Forest"],
            color = "|cff999999",
        },
        {
            id = "DLGilneasCity",
            prefix = "6)",
            name = BZ["Gilneas City"],
            postfix = BZ["Gilneas"],
            color = "|cff999999",
        },
        {
            id = "DLGnomeregan",
            prefix = "7)",
            name = BZ["Gnomeregan"],
            postfix = BZ["Dun Morogh"],
            color = "|cff999999",
        },
        {
            id = "DLUldaman",
            prefix = "8)",
            name = BZ["Uldaman"],
            postfix = BZ["Badlands"],
            color = "|cff999999",
        },
        {
            id = "DLBlackwingLair",
            prefix = "9)",
            name = BZ["Blackwing Lair"],
            postfix = BZ["Blackrock Spire"],
            color = "|cff999999",
        },
        {
            id = "DLBlackrockDepths",
            name = BZ["Blackrock Depths"],
            postfix = BZ["Blackrock Mountain"],
            color = "|cff999999",
        },
        {
            id = "DLBlackrockSpire",
            name = BZ["Blackrock Spire"],
            postfix = BZ["Blackrock Mountain"],
            color = "|cff999999",
        },
        {
            id = "DLMoltenCore",
            name = BZ["Molten Core"],
            postfix = BZ["Blackrock Depths"],
            color = "|cff999999",
        },
        {
            id = "DLHateforgeQuarry",
            prefix = "10)",
            name = BZ["Hateforge Quarry"],
            postfix = BZ["Burning Steppes"],
            color = "|cff999999",
        },
        {
            id = "DLTheStockade",
            prefix = "11)",
            name = BZ["The Stockade"],
            postfix = BZ["Stormwind City"],
            color = "|cff999999",
        },
        {
            id = "DLStormwindVault",
            name = BZ["Stormwind Vault"],
            postfix = BZ["Stormwind City"],
            color = "|cff999999",
        },
        {
            id = "DLTheDeadmines",
            prefix = "12)",
            name = BZ["The Deadmines"],
            postfix = BZ["Westfall"],
            color = "|cff999999",
        },
        {
            id = "DLKarazhanCrypt",
            prefix = "13)",
            name = BZ["Karazhan Crypt"],
            postfix = BZ["Deadwind Pass"],
            color = "|cff999999",
        },
        {
            id = "DLLowerKarazhanHalls",
            name = BZ["Lower Karazhan Halls"],
            postfix = BZ["Deadwind Pass"],
            color = "|cff999999",
        },
        {
            id = "DLTowerOfKarazhan",
            name = BZ["Tower of Karazhan"],
            postfix = BZ["Deadwind Pass"],
            color = "|cff999999",
        },
        {
            id = "DLSunkenTemple",
            prefix = "14)",
            name = L["Sunken Temple"],
            postfix = BZ["Swamp of Sorrows"],
            color = "|cff999999",
        },
        {
            id = "DLZulGurub",
            prefix = "15)",
            name = BZ["Zul'Gurub"],
            postfix = BZ["Stranglethorn Vale"],
            color = "|cff999999",
        },
        {
            id = "DLDragonmawRetreat",
            prefix = "16)",
            name = BZ["Dragonmaw Retreat"],
            postfix = BZ["Wetlands"],
            color = "|cff999999",
        },
        {
            id = "DLStormwroughtRuins",
            prefix = "17)",
            name = BZ["Stormwrought Ruins"],
            postfix = BZ["Balor"],
            color = "|cff999999",
        },
    },
}