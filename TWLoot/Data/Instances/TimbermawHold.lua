---
--- TimbermawHold.lua - Timbermaw Hold instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Timbermaw Hold
--- instance. It includes all boss encounters, rare drops,
--- and instance-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Rare and epic item drops
--- • Instance entrance and layout data
--- • Level-appropriate loot organization
--- • Quest reward items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI
local LB = AtlasTW.Localization.Bosses
local LZ = AtlasTW.Localization.Zones
local LIS = AtlasTW.Localization.ItemSets
local LMD = AtlasTW.Localization.MapData

local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TimbermawHold = {
    Name = LZ["Timbermaw Hold"],
    Location = LZ["Azshara"],
    Level = 60,
    Acronym = "TH",
    MaxPlayers = 20,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"].." "..LZ["Azshara"] },
        { letter = "B)"..L["Entrance"].." "..LZ["Felwood"] },
    },
--[[     Keys = {
        { name = LMD["Key to Stormwrought Castle"], loot = "VanillaKeys", info = "6+" },
    }, ]]
    Bosses = {
        {
            id = "THKarrshtheSentinel",
            name = LB["Karrsh the Sentinel"],
            defaults = { dropRate = 0 },
            loot = {
                { id = 33237 }, -- Timbermaw Defenders
                {},
                { id = 33345 }, -- Treads of the Pathfinder
                {},
                --! pendant of the sentinel (quest item)
            }
        },
        {
            id = "THRotgrowl",
            prefix = " ",
            name = LB["Rotgrowl"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 16768 }, -- Furbolg Medicine Pouch
                { id = 33245 }, -- Tealeaf Waistwrap
                --! recipe: honeycomb delight
            }
        },
        {
            id = "THKodiak",
            name = LB["Kodiak"],
        },
        {
            id = "THArchdruidKronn",
            name = LB["Archdruid Kronn"],
            defaults = { dropRate = 0 },
            loot = {
            }
        },
        {
            id = "THXavianForm",
            name = LB["Xavian Form"],
        },
        {
            id = "THTriochtheDevourer",
            name = LB["Trioch the Devourer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33293 }, -- Trifang Shredders
                { id = 33339 }, -- Ritualistic Leggings
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THOrmanostheCracked",
            prefix = " ",
            name = LB["Ormanos the Cracked"],
            defaults = { dropRate = 0 },
            loot = {
                { id = 33258 }, -- Visor of the Mending Cracks
                { id = 33338 }, -- Ritualistic Gloves
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THLoktanagtheVile",
            name = LB["Loktanag the Vile"],
            defaults = { dropRate = 0 },
            loot = {
                { id = 33251 }, -- Drape of Contagion
                { id = 33340 }, -- Ritualistic Boots
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THSelenaxxFoulheart",
            name = LB["Selenaxx Foulheart"],
            defaults = { dropRate = 0 },
            loot = {
            }
        },
        {
            id = "THChieftainPartath",
            name = LB["Chieftain Partath"],
            defaults = { dropRate = 0 },
            loot = {
            }
        },
        {
            id = "THTrash",
            name = L["Trash Mobs"].."-"..LZ["Timbermaw Hold"],
            defaults = { dropRate = .1 },
            loot = {
            }
        },
        --{ name = LIS["Stormreaver Attire"], items = "Stormreaver" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.TimbermawHold.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end