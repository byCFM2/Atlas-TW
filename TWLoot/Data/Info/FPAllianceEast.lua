---
--- FPAllianceEast.lua - Alliance flight paths in Eastern Kingdoms
---
--- This module contains comprehensive flight path information for Alliance
--- players in the Eastern Kingdoms continent. It provides detailed data about
--- flight masters, routes, costs, and connectivity between flight points.
---
--- Features:
--- • Complete Alliance flight path network
--- • Flight master locations and coordinates
--- • Route costs and travel times
--- • Connectivity mapping
--- • Faction-specific access requirements
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions
local LMD = AtlasTW.Localization.MapData

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FPAllianceEast = {
    Name = LF["Alliance"] .. " (" .. LZ["Eastern Kingdoms"] .. ")",
    Location = LZ["Eastern Kingdoms"],
    Bosses = {
        {
            id = "FPAlahThalas",
            prefix = "1)",
            name = LMD["Alah'Thalas"],
            postfix = LZ["Thalassian Highlands"],
        },
        {
            id = "FPLightsHope",
            prefix = "2)",
            name = LMD["Light's Hope Chapel"],
            postfix = LZ["Eastern Plaguelands"],
        },
        {
            id = "FPChillwind",
            prefix = "3)",
            name = LMD["Chillwind Point"],
            postfix = LZ["Western Plaguelands"],
        },
        {
            id = "FPAeriePeak",
            prefix = "4)",
            name = LMD["Aerie Peak"],
            postfix = LZ["The Hinterlands"],
        },
        {
            id = "FPSouthshore",
            prefix = "5)",
            name = LMD["Southshore"],
            postfix = LZ["Hillsbrad Foothills"],
        },
        {
            id = "FPRefugePointe",
            prefix = "6)",
            name = LMD["Refuge Pointe"],
            postfix = LZ["Arathi Highlands"],
        },
        {
            id = "FPRavenshire",
            prefix = "7)",
            name = LMD["Ravenshire"],
            postfix = LZ["Gilneas"],
        },
        {
            id = "FPMenethilHarbor",
            prefix = "8)",
            name = LZ["Menethil Harbor"],
            postfix = LZ["Wetlands"],
        },
        {
            id = "FPDunAgrath",
            prefix = "9)",
            name = LMD["Dun Agrath"],
            postfix = LZ["Wetlands"],
        },
        {
            id = "FPDunKithas",
            prefix = "10)",
            name = LMD["Dun Kithas"],
            postfix = LZ["Grim Reaches"],
        },
        {
            id = "FPThelsamar",
            prefix = "11)",
            name = LMD["Thelsamar"],
            postfix = LZ["Loch Modan"],
        },
        {
            id = "FPIronforgeAirfields",
            prefix = "12",
            name = LMD["Ironforge Airfields"],
            postfix = LZ["Dun Morogh"],
        },
        {
            id = "FPIronforge",
            prefix = "13)",
            name = LZ["Ironforge"],
            postfix = LZ["Dun Morogh"],
        },
        {
            id = "FPGnomeregan",
            prefix = "14)",
            name = LMD["Gnomeregan Reclamation Facility"],
            postfix = LZ["Dun Morogh"],
        },
        {
            id = "FPThoriumPoint",
            prefix = "15)",
            name = LMD["Thorium Point"],
            postfix = LZ["Searing Gorge"],
        },
        {
            id = "FPAmbershire",
            prefix = "16)",
            name = LMD["Ambershire"],
            postfix = LZ["Northwind"],
        },
        {
            id = "FPMorgansVigil",
            prefix = "17)",
            name = LMD["Morgan's Vigil"],
            postfix = LZ["Burning Steppes"],
        },
        {
            id = "FPLakeshire",
            prefix = "18)",
            name = LMD["Lakeshire"],
            postfix = LZ["Redridge Mountains"],
        },
        {
            id = "FPStormwindCity",
            prefix = "19)",
            name = LZ["Stormwind City"],
            postfix = LZ["Elwynn Forest"],
        },
        {
            id = "FPSI7Outpost",
            prefix = "20)",
            name = LMD["SI:7 Outpost"],
            postfix = LZ["Balor"],
        },
        {
            id = "FPSentinelHill",
            prefix = "21)",
            name = LMD["Sentinel Hill"],
            postfix = LZ["Westfall"],
        },
        {
            id = "FPDarkshire",
            prefix = "22)",
            name = LMD["Darkshire"],
            postfix = LZ["Duskwood"],
        },
        {
            id = "FPNethergardeKeep",
            prefix = "23)",
            name = LMD["Nethergarde Keep"],
            postfix = LZ["Blasted Lands"],
        },
        {
            id = "FPBootyBay",
            prefix = "24)",
            name = LZ["Booty Bay"],
            postfix = LZ["Stranglethorn Vale"],
        },
        {
            id = "FPCaelansRest",
            prefix = "25)",
            name = LMD["Caelan's Rest"],
            postfix = LZ["Lapidis Isle"],
        },
    },
}