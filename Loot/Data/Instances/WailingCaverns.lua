---
--- WailingCaverns.lua - Wailing Caverns dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Wailing Caverns
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
--- @since 1.0.1
--- @compatible World of Warcraft 1.12
---

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.WailingCavernsEnt = {
    Name = BZ["Wailing Caverns"] .. " (" .. L["Entrance"] .. ")",
    Acronym = "WC",
    Location = BZ["The Barrens"],
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = BZ["Wailing Caverns"] }
    },
    Bosses = {
        {
            id = "WCMadMagglish",
            prefix = "1)",
            name = BB["Mad Magglish"],
            postfix = L["Varies"],
            loot = {
                { id = 5334, dropRate = 100 }, -- 99-Year-Old Port
            }
        },
        {
            prefix = "2)",
            name = BB["Trigore the Lasher"],
            color = "|cffcc9933",
        },
        {
            id = "WCBoahn",
            prefix = "3)",
            name = BB["Boahn"],
            loot = {
                { id = 5422, dropRate = 70 }, -- Brambleweed Leggings
                {},
                { id = 5423, dropRate = 30 }, -- Boahn's Fang
            }
        },
        {
            name = L["Above the Entrance:"],
            color = "|cffcc9933",
        },
        {
            name = BB["Ebru"],
            color = "|cff999999",
        },
        {
            name = L["Nalpak"],
            color = "|cff999999",
        },
        {
            id = "WCKalldanFelmoon",
            name = L["Kalldan Felmoon"],
            loot = {
                { id = 6474, disc = L["Vendor"], container = { 6466 } }, -- Pattern: Deviate Scale Cloak
                { id = 6475, disc = L["Vendor"], container = { 6467 } }, -- Pattern: Deviate Scale Gloves
                { id = 6476, disc = L["Vendor"], container = { 6468 } }, -- Pattern: Deviate Scale Belt
            }
        },
        {
            name = L["Waldor"],
            color = "|cff999999",
        },
    }
}

AtlasTW.InstanceData.WailingCaverns = {
    Name = BZ["Wailing Caverns"],
    Location = BZ["The Barrens"],
    Level = { 10, 24 },
    Acronym = "WC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Bosses = {
        {
            id = "WCDisciple",
            prefix = "1)",
            name = L["Disciple of Naralex"],
            color = "|cff9d9d9d",
        },
        {
            id = "WCLordCobrahn",
            prefix = "2)",
            name = BB["Lord Cobrahn"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6460 }, -- Cobrahn's Grasp
                { id = 10410 }, -- Leggings of the Fang
                {},
                { id = 6465 }, -- Robe of the Moccasin
                {},
                { id = 9738, dropRate = 100, container = { 6504, 6505 } }, -- Gem of Cobrahn
            }
        },
        {
            id = "WCLadyAnacondra",
            prefix = "3)",
            name = BB["Lady Anacondra"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 10412 }, -- Belt of the Fang
                { id = 5404 }, -- Serpent's Shoulders
                {},
                { id = 80709 }, -- Guardian Staff
                {},
                { id = 6446 }, -- Snakeskin Bag
                {},
                { id = 23800, dropRate = .2 }, -- Violet Feral Raptor
                {},
                { id = 9739, dropRate = 100, container = { 6504, 6505 } }, -- Gem of Anacondra
            }
        },
        {
            id = "WCKresh",
            prefix = "4)",
            name = BB["Kresh"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 13245 }, -- Kresh's Back
                { id = 6447 }, -- Worn Turtle Shell Shield
                {},
                { id = 80710 }, -- Turtle Scale Shoulderguards
                {},
                { id = 6443, dropRate = 80, container = { 6480, 918 } }, -- Deviate Hide
            }
        },
        {
            id = "WCDeviateFaerieDragon",
            prefix = "5)",
            name = BB["Deviate Faerie Dragon"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 5243 }, -- Firebelcher
                { id = 6632 }, -- Feyscale Cloak
                {},
                { id = 6443, dropRate = 80, container = { 6480, 918 } }, -- Deviate Hide
            }
        },
        {
            id = "WCZandara",
            prefix = "6)",
            name = BB["Zandara Windhoof"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55371, dropRate = 50 }, -- Windborne Sash
                {},
                { id = 55369 }, -- Kolkar Marauder Gauntlets
                { id = 55370 }, -- Totem of Static Charge
                {},
                { id = 41410, dropRate = 100, container = { 70224 } }, -- Zandara's Head
            }
        },
        {
            id = "WCLordPythas",
            prefix = "7)",
            name = BB["Lord Pythas"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6473 }, -- Armor of the Fang
                { id = 80711 }, -- Bracers of Wild Growth
                {},
                { id = 6472 }, -- Stinging Viper
                {},
                { id = 9740, dropRate = 100, container = { 6504, 6505 } }, -- Gem of Pythas
                { id = 80864, dropRate = 100, container = { 80860, 80861 } }, -- Everchanging Essence
            }
        },
        {
            id = "WCSkum",
            prefix = "8)",
            name = BB["Skum"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6448 }, -- Tail Spike
                {},
                { id = 6449 }, -- Glowing Lizardscale Cloak
                { id = 80712 }, -- Charged Leggings
                {},
                { id = 6443, dropRate = 80, container = { 6480, 918 } }, -- Deviate Hide
            }
        },
        {
            id = "WCVangros",
            prefix = "9)",
            name = BB["Vangros"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55374, dropRate = 50 }, -- Enraging Waistwraps
                {},
                { id = 55372 }, -- Band of the Claw
                { id = 55373 }, -- Idol of the Apex Predator
            }
        },
        {
            id = "WCLordSerpentis",
            prefix = "10)",
            name = BB["Lord Serpentis"],
            postfix = L["Upper"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 6469 }, -- Venomstrike
                { id = 5970 }, -- Serpent Gloves
                { id = 10411 }, -- Footpads of the Fang
                { id = 6459 }, -- Savage Trodders
                {},
                { id = 9741, dropRate = 100, container = { 6504, 6505 } }, -- Gem of Serpentis
                { id = 80863, container = { 80860, 80861 } }, -- Crystal of the Serpent
            }
        },
        {
            id = "WCVerdan",
            prefix = "11)",
            name = BB["Verdan the Everliving"],
            postfix = L["Upper"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6629 }, -- Sporid Cape
                {},
                { id = 6630 }, -- Seedcloud Buckler
                { id = 6631 }, -- Living Root
                {},
                { id = 6443, dropRate = 80, container = { 6480, 918 } }, -- Deviate Hide
            }
        },
        {
            id = "WCMutanus",
            prefix = "12)",
            name = BB["Mutanus the Devourer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 6461 }, -- Slime-encrusted Pads
                { id = 6627 }, -- Mutant Scale Breastplate
                { id = 6463 }, -- Deep Fathom Ring
                { id = 81006 }, -- Cowl of the Fang
                {},
                { id = 10441, container = { 10657, 10658 } }, -- Glowing Shard
                { id = 6443, dropRate = 80, container = { 6480, 918 } }, -- Deviate Hide
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "WCNaralex",
            name = L["Naralex"],
            color = "|cff9d9d9d",
        },
        {
            id = "WCTrash",
            name = L["Trash Mobs"].."-"..BZ["Wailing Caverns"],
            loot = {
                { id = 10413, dropRate = 2 }, -- Gloves of the Fang
                {},
                { id = 55381, dropRate = 25 }, -- Phytolance
                { id = 80807, dropRate = .02 }, -- Serpent's Bite
                {},
                { id = 80862, dropRate = 30, container = { 80860, 80861 } }, -- Moontouched Wood
            }
        },
        { name = BIS["Embrace of the Viper"], items = "Wailing" },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.WailingCavernsEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.WailingCaverns.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
