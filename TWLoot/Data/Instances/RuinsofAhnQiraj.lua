---
--- RuinsofAhnQiraj.lua - Ruins of Ahn'Qiraj raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Ruins of Ahn'Qiraj
--- 20-player raid instance. It includes all boss encounters, rare drops,
--- and raid-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Rare and epic item drops
--- • Raid entrance and layout data
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
local LF = AtlasTW.Localization.Factions
local LMD = AtlasTW.Localization.MapData

local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local captainLoot = {
    { id = 21809, dropRate = 8 }, -- Fury of the Forgotten Swarm
    { id = 21810, dropRate = 8 }, -- Treads of the Wandering Nomad
    { id = 21806, dropRate = 5 }, -- Gavel of Qiraji Authority
}

AtlasTW.InstanceData.TheRuinsofAhnQiraj = {
    Name = LZ["Ruins of Ahn'Qiraj"],
    Location = LZ["Silithus"],
    Level = 60,
    Acronym = "AQ20",
    MaxPlayers = 20,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A".." " .. L["Entrance"] }
    },
    Reputation = {
        { name = LF["Cenarion Circle"], loot = "CenarionCircle" },
    },
    Bosses = {
        {
            id = "Kurinnaxx",
            prefix = "1)",
            name = LB["Kurinnaxx"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 21499 }, -- Vestments of the Shifting Sands
                { id = 21498 }, -- Qiraji Sacrificial Dagger
                {},
                { id = 21502 }, -- Sand Reaver Wristguards
                { id = 21501 }, -- Toughened Silithid Hide Gloves
                { id = 21500 }, -- Belt of the Inquisition
                { id = 21503 }, -- Belt of the Sand Reaver
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 20888, dropRate = 25, container = { 21402, 21405, 21411, 21417 } }, -- Qiraji Ceremonial Ring
                { id = 20884, dropRate = 25, container = { 21393, 21396, 21399, 21414, 21408 } }, -- Qiraji Magisterial Ring
                {},
                { id = 20885, dropRate = 25, container = { 21394, 21406, 21412, 21415 } }, -- Qiraji Martial Drape
                { id = 20889, dropRate = 25, container = { 21397, 21403, 21400, 21418, 21409 } }, -- Qiraji Regal Drape
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            name = LB["Lieutenant General Andorov"],
            loot = {
                { id = 22221, container = { 22191 } }, -- Plans: Obsidian Mail Tunic
                { id = 22219, container = { 22198 } }, -- Plans: Jagged Obsidian Shield
            },

        },
        {
            name = LMD["Four Kaldorei Elites"],
            color = Colors.GREY,
        },
        {
            id = "GeneralRajaxx",
            prefix = "2)",
            name = LB["General Rajaxx"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 21493 }, -- Boots of the Vanguard
                { id = 21492 }, -- Manslayer of the Qiraji
                { id = 81004, dropRate = 10 }, -- Sandswept Obsidian Dagger
                {},
                { id = 21496 }, -- Bracers of Qiraji Command
                { id = 21494 }, -- Southwind's Grasp
                { id = 21495 }, -- Legplates of the Qiraji Command
                { id = 21497 }, -- Boots of the Qiraji General
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 20888, dropRate = 25, container = { 21402, 21405, 21411, 21417 } }, -- Qiraji Ceremonial Ring
                { id = 20884, dropRate = 25, container = { 21393, 21396, 21399, 21414, 21408 } }, -- Qiraji Magisterial Ring
                {},
                { id = 20885, dropRate = 25, container = { 21394, 21406, 21412, 21415 } }, -- Qiraji Martial Drape
                { id = 20889, dropRate = 25, container = { 21397, 21403, 21400, 21418, 21409 } }, -- Qiraji Regal Drape
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            name = LMD["Captain Qeez"],
            loot = captainLoot
        },
        {
            name = LMD["Captain Tuubid"],
            loot = captainLoot
        },
        {
            name = LMD["Captain Drenn"],
            loot = captainLoot
        },
        {
            name = LMD["Captain Xurrem"],
            loot = captainLoot
        },
        {
            name = LMD["Major Yeggeth"],
            loot = captainLoot
        },
        {
            name = LMD["Major Pakkon"],
            loot = captainLoot
        },
        {
            name = LMD["Colonel Zerran"],
            loot = captainLoot
        },
        {
            id = "Moam",
            prefix = "3)",
            name = LB["Moam"],
            postfix = L["Optional"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 21472 }, -- Dustwind Turban
                { id = 21467 }, -- Thick Silithid Chestguard
                { id = 21479 }, -- Gauntlets of the Immovable
                { id = 21471 }, -- Talon of Furious Concentration
                {},
                { id = 21455, dropRate = 11 }, -- Southwind Helm
                { id = 21468, dropRate = 11 }, -- Mantle of Maz'Nadir
                { id = 21474, dropRate = 11 }, -- Chitinous Shoulderguards
                { id = 21470, dropRate = 11 }, -- Cloak of the Savior
                { id = 21469, dropRate = 11 }, -- Gauntlets of Southwind
                { id = 21476, dropRate = 11 }, -- Obsidian Scaled Leggings
                { id = 21475, dropRate = 11 }, -- Legplates of the Destroyer
                { id = 21477, dropRate = 11 }, -- Ring of Fury
                { id = 21473, dropRate = 11 }, -- Eye of Moam
                {},
                { id = 20888, container = { 21402, 21405, 21411, 21417 } }, -- Qiraji Ceremonial Ring
                { id = 20884, container = { 21393, 21396, 21399, 21414, 21408 } }, -- Qiraji Magisterial Ring
                {},
                { id = 22220, dropRate = 15, container = { 22194 } }, -- Plans: Black Grasp of the Destroyer
                {},
                { id = 20890, container = { 21410, 21413, 21416, 21407 } }, -- Qiraji Ornate Hilt
                { id = 20886, container = { 21392, 21395, 21401, 21404, 21398 } }, -- Qiraji Spiked Hilt
                {},
                { id = 83005, disc = L["Quest Item"], dropRate = 100, container = { 83002 } }, -- Perfect Obsidian Shard
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            id = "BurutheGorger",
            prefix = "4)",
            name = LB["Buru the Gorger"],
            postfix = L["Optional"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 21487 }, -- Slimy Scaled Gauntlets
                { id = 21486 }, -- Gloves of the Swarm
                { id = 21485 }, -- Buru's Skull Fragment
                {},
                { id = 21491 }, -- Scaled Bracers of the Gorger
                { id = 21489 }, -- Quicksand Waders
                { id = 21490 }, -- Slime Kickers
                { id = 21488 }, -- Fetish of Chitinous Spikes
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 20888, dropRate = 17, container = { 21402, 21405, 21411, 21417 } }, -- Qiraji Ceremonial Ring
                { id = 20884, dropRate = 17, container = { 21393, 21396, 21399, 21414, 21408 } }, -- Qiraji Magisterial Ring
                {},
                { id = 20885, dropRate = 17, container = { 21394, 21406, 21412, 21415 } }, -- Qiraji Martial Drape
                { id = 20889, dropRate = 17, container = { 21397, 21403, 21400, 21418, 21409 } }, -- Qiraji Regal Drape
                {},
                { id = 20890, dropRate = 17, container = { 21410, 21413, 21416, 21407 } }, -- Qiraji Ornate Hilt
                { id = 20886, dropRate = 17, container = { 21392, 21395, 21401, 21404, 21398 } }, -- Qiraji Spiked Hilt
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            id = "AyamisstheHunter",
            prefix = "5)",
            name = LB["Ayamiss the Hunter"],
            postfix = L["Optional"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 21479 }, -- Gauntlets of the Immovable
                { id = 21478 }, -- Bow of Taut Sinew
                { id = 21466 }, -- Stinger of Ayamiss
                {},
                { id = 21484 }, -- Helm of Regrowth
                { id = 21480 }, -- Scaled Silithid Gauntlets
                { id = 21482 }, -- Boots of the Fiery Sands
                { id = 21481 }, -- Boots of the Desert Protector
                { id = 21483 }, -- Ring of the Desert Winds
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 20888, dropRate = 17, container = { 21402, 21405, 21411, 21417 } }, -- Qiraji Ceremonial Ring
                { id = 20884, dropRate = 17, container = { 21393, 21396, 21399, 21414, 21408 } }, -- Qiraji Magisterial Ring
                {},
                { id = 20885, dropRate = 17, container = { 21394, 21406, 21412, 21415 } }, -- Qiraji Martial Drape
                { id = 20889, dropRate = 17, container = { 21397, 21403, 21400, 21418, 21409 } }, -- Qiraji Regal Drape
                {},
                { id = 20890, dropRate = 17, container = { 21410, 21413, 21416, 21407 } }, -- Qiraji Ornate Hilt
                { id = 20886, dropRate = 17, container = { 21392, 21395, 21401, 21404, 21398 } }, -- Qiraji Spiked Hilt
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            id = "OssiriantheUnscarred",
            prefix = "6)",
            name = LB["Ossirian the Unscarred"],
            defaults = { dropRate = 15 },
            loot = {
                { id = 21460 }, -- Helm of Domination
                { id = 21454, dropRate = 18 }, -- Runic Stone Shoulders
                { id = 21453, dropRate = 18 }, -- Mantle of the Horusath
                { id = 21456, dropRate = 18 }, -- Sandstorm Cloak
                { id = 21464 }, -- Shackles of the Unscarred
                { id = 21457 }, -- Bracers of Brutality
                { id = 21462 }, -- Gloves of Dark Wisdom
                { id = 21458, dropRate = 18 }, -- Gauntlets of New Life
                { id = 21463 }, -- Ossirian's Binding
                { id = 21461 }, -- Leggings of the Black Blizzard
                {},
                { id = 21459 }, -- Crossbow of Imminent Doom
                { id = 21715 }, -- Sand Polished Hammer
                { id = 21452, dropRate = 18 }, -- Staff of the Ruins
                {},
                { id = 21220, dropRate = 100, container = { 21504, 21507, 21505, 21506 } }, -- Head of Ossirian the Unscarred
                {},
                { id = 20890, dropRate = 50, container = { 21410, 21413, 21416, 21407 } }, -- Qiraji Ornate Hilt
                { id = 20886, dropRate = 50, container = { 21392, 21395, 21401, 21404, 21398 } }, -- Qiraji Spiked Hilt
                {},
                { id = 132, dropRate = 6, container = { 103 } }, -- Plans: Obsidian Belt Buckle
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        { prefix = "1') ", name = LMD["Safe Room"], color = Colors.GREEN },
        {
            id = "AQ20Trash",
            name = L["Trash Mobs"].."-"..LZ["Ruins of Ahn'Qiraj"],
            defaults = { dropRate = 2 },
            loot = {
                { id = 21804, dropRate = 0.2 }, -- Coif of Elemental Fury
                { id = 21803, dropRate = 0.02 }, -- Helm of the Holy Avenger
                { id = 21805, dropRate = 0.02 }, -- Polished Obsidian Pauldrons
                {},
                { id = 20873, dropRate = 0.4 }, -- Alabaster Idol
                { id = 20869, dropRate = 0.4 }, -- Amber Idol
                { id = 20866, dropRate = 0.4 }, -- Azure Idol
                { id = 20870, dropRate = 0.4 }, -- Jasper Idol
                { id = 20868, dropRate = 0.4 }, -- Lambent Idol
                { id = 20871, dropRate = 0.4 }, -- Obsidian Idol
                { id = 20867, dropRate = 0.4 }, -- Onyx Idol
                { id = 20872, dropRate = 0.4 }, -- Vermillion Idol
                {},
                { id = 21761, disc = L["Key"], dropRate = 7 }, -- Scarab Coffer Key
                { id = 21156, disc = L["Container"], dropRate = 0.1, container = { 20859, 20862, 20863, 20858, 20860, 20861, 20864, 20865 } }, -- Scarab Bag
                { id = 21801, dropRate = 0.1 }, -- Antenna of Invigoration
                { id = 21800, dropRate = 0.1 }, -- Silithid Husked Launcher
                { id = 21802, dropRate = 0.1 }, -- The Lost Kris of Zedd
                {},
                { id = 20864, disc = L["Quest Item"] }, -- Bone Scarab
                { id = 20861, disc = L["Quest Item"] }, -- Bronze Scarab
                { id = 20863, disc = L["Quest Item"] }, -- Clay Scarab
                { id = 20862, disc = L["Quest Item"] }, -- Crystal Scarab
                { id = 20859, disc = L["Quest Item"] }, -- Gold Scarab
                { id = 20865, disc = L["Quest Item"] }, -- Ivory Scarab
                { id = 20860, disc = L["Quest Item"] }, -- Silver Scarab
                { id = 20858, disc = L["Quest Item"] }, -- Stone Scarab
                {},
                { id = 22203, disc = L["Reagent"], dropRate = 1 }, -- Large Obsidian Shard
                { id = 22202, disc = L["Reagent"], dropRate = 1 }, -- Small Obsidian Shard
            }
        },
        {
            id = "AQEnchants",
            name = LMD["AQ Enchants"],
            defaults = { dropRate = 1 },
            loot = {
                { id = 20728 }, -- Formula: Enchant Gloves - Frost Power
                { id = 20731 }, -- Formula: Enchant Gloves - Superior Agility
                { id = 20734 }, -- Formula: Enchant Cloak - Stealth
                { id = 20729 }, -- Formula: Enchant Gloves - Fire Power
                { id = 20736 }, -- Formula: Enchant Cloak - Dodge
                { id = 20730 }, -- Formula: Enchant Gloves - Healing Power
                { id = 20727 }, -- Formula: Enchant Gloves - Shadow Power
            }
        },
        {
            id = "AQ20ClassBooks",
            name = LMD["Class Books"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 21284 }, -- Codex of Greater Heal V
                { id = 21287 }, -- Codex of Prayer of Healing V
                { id = 21285 }, -- Codex of Renew X
                { id = 21279 }, -- Tome of Fireball XII
                { id = 21214 }, -- Tome of Frostbolt XI
                { id = 21280 }, -- Tome of Arcane Missiles VIII
                { id = 21281 }, -- Grimoire of Shadow Bolt X
                { id = 21283 }, -- Grimoire of Corruption VII
                { id = 21282 }, -- Grimoire of Immolate VIII
                { id = 21300 }, -- Handbook of Backstab IX
                { id = 21303 }, -- Handbook of Feint V
                { id = 21302 }, -- Handbook of Lethal Poisons
                { id = 21294 }, -- Book of Healing Touch XI
                { id = 21296 }, -- Book of Rejuvenation XI
                { id = 21295 }, -- Book of Starfire VII
                { id = 21306 }, -- Guide: Serpent Sting IX
                { id = 21304 }, -- Guide: Multi-Shot V
                { id = 21307 }, -- Guide: Aspect of the Hawk VII
                { id = 21291 }, -- Tablet of Healing Wave X
                { id = 21292 }, -- Tablet of Strength of Earth Totem V
                { id = 21293 }, -- Tablet of Grace of Air Totem III
                { id = 21288 }, -- Libram: Blessing of Wisdom VI
                { id = 21289 }, -- Libram: Blessing of Might VII
                { id = 21290 }, -- Libram: Holy Light IX
                { id = 21298 }, -- Manual of Battle Shout VII
                { id = 21299 }, -- Manual of Revenge VI
                { id = 21297 }, -- Manual of Heroic Strike IX
            }
        },
        { name = L["Ruins of Ahn'Qiraj Sets"], items = "AtlasTWLootAQ20SetMenu" },
    }
}

for _, bossData in ipairs(AtlasTW.InstanceData.TheRuinsofAhnQiraj.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end