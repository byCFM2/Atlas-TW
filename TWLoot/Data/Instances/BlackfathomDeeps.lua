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

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local Colors = AtlasTW.Colors
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.BlackfathomDeepsEnt = {
    Name = BZ["Blackfathom Deeps"] .. " (" .. L["Entrance"] .. ")",
    Acronym = "BFD",
    Location = BZ["Ashenvale"],
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = BZ["Blackfathom Deeps"] }
    },
    Bosses = {}
}

AtlasTW.InstanceData.BlackfathomDeeps = {
    Name = BZ["Blackfathom Deeps"],
    Location = BZ["Ashenvale"],
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
            name = BB["Ghamoo-ra"],
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
            name = L["Lorgalis Manuscript"],
            color = Colors.GREEN,
        },
        {
            id = "BFDLadySarevess",
            prefix = "2)",
            name = BB["Lady Sarevess"],
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
            name = L["Argent Guard Thaelrid"],
            color = Colors.GREEN,
        },
        {
            id = "BFDGelihast",
            prefix = "3)",
            name = BB["Gelihast"],
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
            name = L["Shrine of Gelihast"],
            color = Colors.GRAY,
        },
        {
            id = "BFDLorgusJett",
            prefix = "c)",
            name = BB["Lorgus Jett"],
            postfix = L["Varies"],
            color = Colors.GREEN,
        },
        {
            id = "BFDVelthelaxxtheDefiler",
            prefix = "4)",
            name = BB["Velthelaxx the Defiler"],
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
            name = BB["Baron Aquanis"],
            loot = {
                { id = 16782, dropRate = 100, container = { 16886, 16887 } }, -- Strange Water Globe
            }
        },
        {
            id = "BFDFathomStone",
            name = L["Fathom Stone"],
            loot = {
                { id = 16762, dropRate = 100 }, -- Fathom Core
            }
        },
        {
            id = "BFDTwilightLordKelris",
            prefix = "6)",
            name = BB["Twilight Lord Kelris"],
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
            name = BB["Old Serra'kis"],
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
            name = BB["Aku'mai"],
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
            name = L["Morridune"],
            color = Colors.GRAY,
        },
        {
            id = "BFDAltaroftheDeeps",
            name = L["Altar of the Deeps"],
            color = Colors.GRAY,
        },
        {
            id = "BFDTrash",
            name = L["Trash Mobs"].."-"..BZ["Blackfathom Deeps"],
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
