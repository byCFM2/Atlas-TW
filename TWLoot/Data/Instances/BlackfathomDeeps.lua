---
--- BlackfathomDeeps.lua - Blackfathom Deeps dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Blackfathom Deeps
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Rare and uncommon item drops
--- • Dungeon entrance and layout data
--- • Level-appropriate loot organization
--- • Quest reward items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LB = AtlasTW.Localization.Bosses
local LMD = AtlasTW.Localization.MapData

local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.BlackfathomDeepsEnt = {
    Name = LZ["Blackfathom Deeps"] .. " (" .. L["Entrance"] .. ")",
    Acronym = "BFD",
    Location = LZ["Ashenvale"],
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = LZ["Blackfathom Deeps"] }
    },
    Bosses = {}
}

AtlasTW.InstanceData.BlackfathomDeeps = {
    Name = LZ["Blackfathom Deeps"],
    Location = LZ["Ashenvale"],
    Level = { 19, 32 },
    Acronym = "BFD",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Bosses = {
        {
            id = "BFDGhamoora",
            prefix = "1)",
            name = LB["Ghamoo-ra"],
            loot = {
                { id = 6907, dropRate = 50 }, -- Tortoise Armor
                { id = 6908, dropRate = 50 }, -- Ghamoo-ra's Bind
                {},
                { id = 80718, dropRate = 35 }, -- Ghamoo-ra's Guard
            }
        },
        {
            id = "BFDLorgalisManuscript",
            prefix = "a)",
            name = LMD["Lorgalis Manuscript"],
            color = Colors.GREEN,
        },
        {
            id = "BFDLadySarevess",
            prefix = "2)",
            name = LB["Lady Sarevess"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 888 }, -- Naga Battle Gloves
                {},
                { id = 3078 }, -- Naga Heartpiercer
                { id = 11121 }, -- Darkwater Talwar
                {},
                { id = 5952, dropRate = 80, container = { 7003, 7004 } }, -- Corrupted Brain Stem
            }
        },
        {
            id = "BFDArgentGuardThaelrid",
            prefix = "b)",
            name = LMD["Argent Guard Thaelrid"],
            color = Colors.GREEN,
        },
        {
            id = "BFDGelihast",
            prefix = "3)",
            name = LB["Gelihast"],
            loot = {
                { id = 6906, dropRate = 50 }, -- Algae Fists
                { id = 6905, dropRate = 50 }, -- Reef Axe
                {},
                { id = 80720, dropRate = 35 }, -- Deep Striders
                {},
                { id = 1470, dropRate = 15 }, -- Murloc Skin Bag
            }
        },
        {
            id = "BFDShrineofGelihast",
            name = LMD["Shrine of Gelihast"],
            color = Colors.GREY,
        },
        {
            id = "BFDLorgusJett",
            prefix = "c)",
            name = LB["Lorgus Jett"],
            postfix = L["Varies"],
            color = Colors.GREEN,
        },
        {
            id = "BFDVelthelaxxtheDefiler",
            prefix = "4)",
            name = LB["Velthelaxx the Defiler"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58120 }, -- Cowl of Whispering Shadows
                { id = 58121 }, -- Totem of the Corrupted Current
                { id = 58122 }, -- Bracers of Sinister Rites
                { id = 58123 }, -- Felhoof Sabatons
            }
        },
        {
            id = "BFDBaronAquanis",
            prefix = "5)",
            name = LB["Baron Aquanis"],
            loot = {
                { id = 16782, dropRate = 100, container = { 16886, 16887 } }, -- Strange Water Globe
            }
        },
        {
            id = "BFDFathomStone",
            name = LMD["Fathom Stone"],
            loot = {
                { id = 16762, dropRate = 100 }, -- Fathom Core
            }
        },
        {
            id = "BFDTwilightLordKelris",
            prefix = "6)",
            name = LB["Twilight Lord Kelris"],
            loot = {
                { id = 1155, dropRate = 50 }, -- Rod of the Sleepwalker
                { id = 6903, dropRate = 35 }, -- Gaze Dreamer Pants
                { id = 80719, dropRate = 15 }, -- Pendant of the Deeps
                {},
                { id = 5881, dropRate = 100, container = { 7001, 7002 } }, -- Head of Kelris
            }
        },
        {
            id = "BFDOldSerrakis",
            prefix = "7)",
            name = LB["Old Serra'kis"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6901 }, -- Glowing Thresher Cape
                { id = 6902 }, -- Bands of Serra'kis
                {},
                { id = 6904 }, -- Bite of Serra'kis
            }
        },
        {
            id = "BFDAkumai",
            prefix = "8)",
            name = LB["Aku'mai"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6911 }, -- Moss Cinch
                { id = 6910 }, -- Leech Pants
                {},
                { id = 6909 }, -- Strike of the Hydra
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "BFDMorridune",
            name = LMD["Morridune"],
            color = Colors.GREY,
        },
        {
            id = "BFDAltaroftheDeeps",
            name = LMD["Altar of the Deeps"],
            color = Colors.GREY,
        },
        {
            id = "BFDTrash",
            name = L["Trash Mobs"].."-"..LZ["Blackfathom Deeps"],
            defaults = { dropRate = .1 },
            loot = {
                { id = 1486 }, -- Tree Bark Jacket
                { id = 3416 }, -- Martyr's Chain
                { id = 1491 }, -- Ring of Precision
                { id = 3414 }, -- Crested Scepter
                { id = 1454 }, -- Axe of the Enforcer
                { id = 1481 }, -- Grimclaw
                { id = 2567 }, -- Evocator's Blade
                { id = 3413 }, -- Doomspike
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.BlackfathomDeeps.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end