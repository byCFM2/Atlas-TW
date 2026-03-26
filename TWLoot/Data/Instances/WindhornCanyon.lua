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
            id = "WHCPathunBuskhide",
            prefix = "1)",
            name = LB["Pathun Buskhide"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33025 }, -- Blackwind Striker
                { id = 33026 }, -- Sacred Windhorn Shoulders
                { id = 33028 }, -- Hatchet of the Long Hunt
                { id = 33027 }, -- Huntsman's Halfhorn
               {},
               { id = 70242, dropRate = 6, container = { 42205 } }, -- Plans: Kodoheart Necklace
            }
        },
        {
            id = "WHCAhgktosthePure",
            prefix = "2)",
            name = LB["Ahgk'tos the Pure"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33021 }, -- Sacred Windhorn Gloves
                { id = 33022 }, -- Windserpent Hauberk
                { id = 33023 }, -- Coilscale Ring
                { id = 33024 }, -- Tooth of Ahgk'tos
            }
        },
        {
            id = "WHCAmbassadorVortalus",
            prefix = "3)",
            name = LB["Ambassador Vortalus"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33029 }, -- Sacred Windhorn Footwraps
                { id = 33030 }, -- Knuckles of Vortalus
                { id = 33031 }, -- Thunderstrike Pike
                { id = 33032 }, -- Galvanized Wrists
            }
        },
        {
            id = "WHCWalganBloodcaller",
            prefix = "4)",
            name = LB["Walgan Bloodcaller"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33033 }, -- Footwraps of Perfect Form
                { id = 33035 }, -- Sacred Windhorn Pants
                { id = 33082 }, -- Bloodcaller's Decapitator
                { id = 42275 }, -- Canyonhide Gloves
            }
        },
        {
            id = "WHCBonespeakerNarlgom",
            prefix = "5)",
            name = LB["Bonespeaker Narlgom"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33037 }, -- Sacred Windhorn Robe
                { id = 33038 }, -- Bonespeaker Cane
                { id = 33040 }, -- Reedwoven Epaulets
                { id = 42276 }, -- Cloudrender Pants
            }
        },
        { name = LB["Spirit of Champion Rotag"], color = Colors.GREY },
        {
            id = "WHCProphetStormhoof",
            prefix = "6)",
            name = LB["Prophet Stormhoof"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33041 }, -- Deathtotem Relic
                { id = 33042 }, -- Sacred Windhorn Headdress
                { id = 33043 }, -- Blackwind Facemask
                { id = 33044 }, -- Elder Crone's Sigil Ring
                {},
                { id = 70244, dropRate = 6, container = { 42203 } }, -- Plans: Ceremonial Belt Buckle
            }
        },
        {
            prefix = "1')",
            name = LB["Grand Elder Skystider"],
            color = Colors.GREEN,
        },
        {
            id = "WHCChieftainShalkBlackwind",
            prefix = "7)",
            name = LB["Chieftain Shalk Blackwind"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33045 }, -- The Blackwind Pillar
                { id = 33046 }, -- Canyon's Barricade
                { id = 33047 }, -- Ar'pora, the Chieftain's Judgement
                { id = 33048 }, -- Heart of Windhorn
                {},
                { id = 70243, dropRate = 6, container = { 42204 } }, -- Plans: Grimtotem Bracers
                {},
                { id = 42277, dropRate = 1.3 }, -- Hawkfeather Crown
            }
        },
        {
            id = "WHCTrash",
            name = L["Trash Mobs"].."-"..LZ["Windhorn Canyon"],
            defaults = { dropRate = .1 },
            loot = {
                { id = 33034 }, -- Kodospine Crossbow
               -- { id = 33036 }, -- Headsplitter Blunderbuss BOP
                { id = 33039 }, -- Fleshrender
                { id = 33179 }, -- Kodo Skull Crown TODO
                { id = 33181 }, -- Ancestral Greaves
                { id = 33183 }, -- Horned Trophy Cord
                { id = 33185 }, -- Sash of the Wind Serpents
            }
        },
        { name = LIS["Sacred Windhorn Attire"], items = "SacredWindhorn" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.WindhornCanyon.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end