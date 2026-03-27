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
            id = "THRotgrowl",
            prefix = " ",
            name = LB["Rotgrowl"],
            defaults = { dropRate = 0 },
            loot = {
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
            id = "THTriochtheDevourer",
            name = LB["Trioch the Devourer"],
            defaults = { dropRate = 0 },
            loot = {
            }
        },
        {
            id = "THKarrshtheSentinel",
            name = LB["Karrsh the Sentinel"],
            defaults = { dropRate = 0 },
            loot = {
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
            id = "THOrmanostheCracked",
            prefix = " ",
            name = LB["Ormanos the Cracked"],
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