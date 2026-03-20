---
--- WindhornCanyon.lua - Windhorn Canyon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Windhorn Canyon
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

AtlasTW.InstanceData.WindhornCanyon = {
    Name = LZ["Windhorn Canyon"],
    Location = LZ["Thousand Needles"],
    Level = { 26, 30 },
    Acronym = "WHC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"] },
    },
    Bosses = {
        {
            id = "WHCAmbassadorVortalus",
            prefix = "1)",
            name = LB["Ambassador Vortalus"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33031 }, -- Thunderstrike Pike
            }
        },
        {
            id = "WHCWalganBloodcaller",
            prefix = "2)",
            name = LB["Walgan Bloodcaller"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33035 }, -- Sacred Windhorn Pants
            }
        },
        {
            id = "WHCBonespeakerNarlgom",
            prefix = "3)",
            name = LB["Bonespeaker Narlgom"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 42276 }, -- Cloudrender Pants
            }
        },
        {
            id = "WHCProphetStormhoof",
            prefix = "4)",
            name = LB["Prophet Stormhoof"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33042 }, -- Sacred Windhorn Headdress
                {},
                { id = 70244 }, -- Plans: Ceremonial Belt Buckle
            }
        },
        {
            id = "WHCChieftainShalkBlackwind",
            prefix = "5)",
            name = LB["Chieftain Shalk Blackwind"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33047 }, -- Ar'pora, the Chieftain's Judgement]
            }
        },
        {
            id = "WHCPathunBuskhide",
            prefix = "6)",
            name = LB["Pathun Buskhide"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33026 }, -- Sacred Windhorn Shoulders
            }
        },
        {
            id = "WHCPathunBuskhide",
            prefix = "7)",
            name = LB["Ahgk'tos the Pure"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33022 }, -- Windserpent Hauberk
            }
        },
--[[         {
            id = "WHCTrash",
            name = L["Trash Mobs"].."-"..LZ["Windhorn Canyon"],
            defaults = { dropRate = .1 },
            loot = {
            }
        }, ]]
        { name = LIS["Sacred Windhorn Attire"], items = "SacredWindhorn" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.WindhornCanyon.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end