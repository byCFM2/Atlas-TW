-- FPHordeEast Info Data
-- Compatible with Atlas Loot TW

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
            color = "|cff999999",
        },
        {
            id = "FPUndercity",
            prefix = "2)",
            name = BZ["Undercity"],
            postfix = BZ["Tirisfal Glades"],
            color = "|cff999999",
        },
        {
            id = "FPTheSepulcher",
            prefix = "3)",
            name = L["The Sepulcher"],
            postfix = BZ["Silverpine Forest"],
            color = "|cff999999",
        },
        {
            id = "FPTarrenMill",
            prefix = "4)",
            name = L["Tarren Mill"],
            postfix = BZ["Hillsbrad Foothills"],
            color = "|cff999999",
        },
        {
            id = "FPRevantuskVillage",
            prefix = "5)",
            name = L["Revantusk Village"],
            postfix = BZ["The Hinterlands"],
            color = "|cff999999",
        },
        {
            id = "FPHammerfall",
            prefix = "6)",
            name = L["Hammerfall"],
            postfix = BZ["Arathi Highlands"],
            color = "|cff999999",
        },
        {
            id = "FPStillwardChurch",
            prefix = "7)",
            name = L["Stillward Church"],
            postfix = BZ["Gilneas"],
            color = "|cff999999",
        },
        {
            id = "FPShatterbladePost",
            prefix = "8)",
            name = L["Shatterblade Post"],
            postfix = BZ["Grim Reaches"],
            color = "|cff999999",
        },
        {
            id = "FPThoriumPoint",
            prefix = "9)",
            name = L["Thorium Point"],
            postfix = BZ["Searing Gorge"],
            color = "|cff999999",
        },
        {
            id = "FPKargath",
            prefix = "10)",
            name = L["Kargath"],
            postfix = BZ["Badlands"],
            color = "|cff999999",
        },
        {
            id = "FPFlameCrest",
            prefix = "11)",
            name = L["Flame Crest"],
            postfix = BZ["Burning Steppes"],
            color = "|cff999999",
        },
        {
            id = "FPStormbreakerPoint",
            prefix = "12)",
            name = L["Stormbreaker Point"],
            postfix = BZ["Balor"],
            color = "|cff999999",
        },
        {
            id = "FPStonard",
            prefix = "13)",
            name = L["Stonard"],
            postfix = BZ["Swamp of Sorrows"],
            color = "|cff999999",
        },
        {
            id = "FPGromgolBaseCamp",
            prefix = "14)",
            name = BZ["Grom'gol Base Camp"],
            postfix = BZ["Stranglethorn Vale"],
            color = "|cff999999",
        },
        {
            id = "FPBootyBay",
            prefix = "15)",
            name = L["Booty Bay"],
            postfix = BZ["Stranglethorn Vale"],
            color = "|cff999999",
        },
        {
            id = "FPMauloggRefuge",
            prefix = "16)",
            name = L["Maul'ogg Refuge"],
            postfix = BZ["Gillijim's Isle"],
            color = "|cff999999",
        },
    },
}