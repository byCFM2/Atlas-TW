-- TransportRoutes Info Data
-- Compatible with Atlas Loot TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")

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
            color = "|cff999999",
        },
        {
            id = "TRAuberdine",
            prefix = "2)",
            name = BZ["Auberdine"],
            postfix = BZ["Darkshore"]..", "..L["Alliance"],
            color = "|cff999999",
        },
        {
            id = "TROrgrimmar",
            prefix = "3)",
            name = BZ["Orgrimmar"],
            postfix = BZ["The Barrens"]..", "..L["Horde"],
            color = "|cff999999",
        },
        {
            id = "TRSparkwaterPort",
            prefix = "4)",
            name = L["Sparkwater Port"],
            postfix = BZ["The Barrens"]..", "..L["Horde"],
            color = "|cff999999",
        },
        {
            id = "TRRatchet",
            prefix = "5)",
            name = BZ["Ratchet"],
            postfix = BZ["The Barrens"]..", "..L["Neutral"],
            color = "|cff999999",
        },
        {
            id = "TRThunderBluff",
            prefix = "6)",
            name = BZ["Thunder Bluff"],
            postfix = BZ["Mulgore"]..", "..L["Horde"],
            color = "|cff999999",
        },
        {
            id = "TRFeathermoonStronghold",
            prefix = "7)",
            name = L["Feathermoon Stronghold"],
            postfix = BZ["Feralas"]..", "..L["Alliance"],
            color = "|cff999999",
        },
        {
            id = "TRTheramoreIsle",
            prefix = "8)",
            name = BZ["Theramore Isle"],
            postfix = BZ["Dustwallow Marsh"]..", "..L["Alliance"],
            color = "|cff999999",
        },
        {
            id = "TRAlahThalas",
            prefix = "9)",
            name = L["Alah'Thalas"],
            postfix = BZ["Thalassian Highlands"]..", "..L["Alliance"],
            color = "|cff999999",
        },
        {
            id = "TRUndercity",
            prefix = "10)",
            name = BZ["Undercity"],
            postfix = BZ["Tirisfal Glades"]..", "..L["Horde"],
            color = "|cff999999",
        },
        {
            id = "TRRevantuskVillage",
            prefix = "11)",
            name = L["Revantusk Village"],
            postfix = BZ["The Hinterlands"]..", "..L["Horde"],
            color = "|cff999999",
        },
        {
            id = "TRMenethilHarbor",
            prefix = "12)",
            name = BZ["Menethil Harbor"],
            postfix = BZ["Wetlands"]..", "..L["Alliance"],
            color = "|cff999999",
        },
        {
            id = "TRIronforge",
            prefix = "13)",
            name = BZ["Ironforge"],
            postfix = BZ["Dun Morogh"]..", "..L["Alliance"],
            color = "|cff999999",
        },
        {
            id = "TRKargath",
            prefix = "14)",
            name = L["Kargath"],
            postfix = BZ["Badlands"]..", "..L["Horde"],
            color = "|cff999999",
        },
        {
            id = "TRStormwindCity",
            prefix = "15)",
            name = BZ["Stormwind City"],
            postfix = BZ["Elwynn Forest"]..", "..L["Alliance"],
            color = "|cff999999",
        },
        {
            id = "TRGromgolBaseCamp",
            prefix = "16)",
            name = BZ["Grom'gol Base Camp"],
            postfix = BZ["Stranglethorn Vale"]..", "..L["Horde"],
            color = "|cff999999",
        },
        {
            id = "TRBootyBay",
            prefix = "17)",
            name = BZ["Booty Bay"],
            postfix = BZ["Stranglethorn Vale"]..", "..L["Neutral"],
            color = "|cff999999",
        },
    },
}