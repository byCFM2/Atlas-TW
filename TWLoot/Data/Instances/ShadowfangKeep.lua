---
--- ShadowfangKeep.lua - Shadowfang Keep dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Shadowfang Keep
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Low-level dungeon item drops
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

AtlasTW.InstanceData.ShadowfangKeep = {
    Name = BZ["Shadowfang Keep"],
    Location = BZ["Silverpine Forest"],
    Level = { 14, 30 },
    Acronym = "SFK",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },

    Bosses = {
        {
            id = "SFKRethilgore",
            prefix = "1)",
            name = BB["Rethilgore"],
            defaults = { dropRate = 35 },
            loot = {
                { id = 5254, dropRate = 100 }, -- Rugged Spaulders
                {},
                { id = 80713 }, -- Padded Keeper Tunic
                { id = 80714 }, -- Binding Chain
            }
        },
        {
            name = L["Sorcerer Ashcrombe"],
            color = Colors.GREY,
        },
        {
            name = L["Deathstalker Adamant"],
            color = Colors.GREY,
        },
        {
            prefix = "2)",
            name = L["Deathstalker Vincent"],
            color = Colors.GREY,
        },
        {
            id = "SFKFelSteed",
            prefix = "3)",
            name = L["Fel Steed"],
            loot = {
                { id = 6341, dropRate = 8 }, -- Eerie Stable Lantern
                {},
                { id = 932, dropRate = 29 }, -- Fel Steed Saddlebags
            }
        },
        {
            id = "SFKJordansHammer",
            name = L["Jordan's Hammer"],
            loot = {
                { id = 6895, dropRate = 100, container = { 6953 } }, -- Jordan's Smithing Hammer
            }
        },
        {
            id = "SFKRazorclawtheButcher",
            prefix = "4)",
            name = BB["Razorclaw the Butcher"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6226 }, -- Bloody Apron
                { id = 6633 }, -- Butcher's Slicer
                {},
                { id = 1292 }, -- Butcher's Cleaver
            }
        },
        {
            id = "SFKSilverlaine",
            prefix = "5)",
            name = BB["Baron Silverlaine"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 6321 }, -- Silverlaine's Family Seal
                { id = 6323 }, -- Baron's Scepter
                {},
                { id = 80715, dropRate = 35 }, -- Gloves of the Lifted Cup
            }
        },
        {
            id = "SFKSpringvale",
            prefix = "6)",
            name = BB["Commander Springvale"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 6320 }, -- Commander's Crest
                { id = 3191 }, -- Arced War Axe
                {},
                { id = 80717, dropRate = 35 }, -- Commander's Greaves
            }
        },
        {
            id = "SFKSever",
            prefix = "7)",
            name = BB["Sever"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 23173 }, -- Abomination Skin Leggings
                { id = 23171 }, -- The Axe of Severing
            }
        },
        {
            id = "SFKOdotheBlindwatcher",
            prefix = "8)",
            name = BB["Odo the Blindwatcher"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 6319 }, -- Girdle of the Blindwatcher
                {},
                { id = 6318 }, -- Odo's Ley Staff
            }
        },
        {
            id = "SFKDeathswornCaptain",
            prefix = "9)",
            name = BB["Deathsworn Captain"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 6642 }, -- Phantom Armor
                { id = 6641 }, -- Haunting Blade
            }
        },
        {
            id = "SFKFenrustheDevourer",
            prefix = "10)",
            name = BB["Fenrus the Devourer"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 6340 }, -- Fenrus' Hide
                { id = 3230 }, -- Black Wolf Bracers
            }
        },
        {
            id = "SFKArugalsVoidwalker",
            name = BB["Arugal's Voidwalker"],
            loot = {
                { id = 5943, dropRate = 3 }, -- Rift Bracers
            }
        },
        {
            id = "SFKBookofUr",
            name = L["The Book of Ur"],
            loot = {
                { id = 6283, dropRate = 100, container = { 6335, 4534 } }, -- The Book of Ur
            }
        },
        {
            id = "SFKWolfMasterNandos",
            prefix = "11)",
            name = BB["Wolf Master Nandos"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 3748 }, -- Feline Mantle
                { id = 6314 }, -- Wolfmaster Cape
                {},
                { id = 80716, dropRate = 35 }, -- Claw of the Worgen
            }
        },
        {
            id = "SFKArchmageArugal",
            prefix = "12)",
            name = BB["Archmage Arugal"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 6324 }, -- Robes of Arugal
                { id = 6392 }, -- Belt of Arugal
                {},
                { id = 6220 }, -- Meteor Shard
                {},
                { id = 5442, dropRate = 100, container = { 6414 } }, -- Head of Arugal
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "SFKPrelate",
            prefix = "13)",
            name = BB["Prelate Ironmane"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55385 }, -- Signet of Faded Sermons
                { id = 55384 }, -- Hilt of Radiance
                { id = 55383 }, -- Prelate's Sigil
                { id = 55382 }, -- Mitre of the First Light
            }
        },
        {
            id = "SFKTrash",
            name = L["Trash Mobs"].."-"..BZ["Shadowfang Keep"],
            defaults = { dropRate = .07 },
            loot = {
                { id = 2292 }, -- Necrology Robes
                { id = 1489 }, -- Gloomshroud Armor
                { id = 1974 }, -- Mindthrust Bracers
                { id = 2807 }, -- Guillotine Axe
                { id = 1482 }, -- Shadowfang
                { id = 1935 }, -- Assassin's Blade
                { id = 1483 }, -- Face Smasher
                { id = 1318 }, -- Night Reaver
                { id = 3194 }, -- Black Malice
                { id = 2205 }, -- Duskbringer
                { id = 1484 }, -- Witching Stave
                {},
                { id = 41420, dropRate = 10, container = { 55505 } }, -- Shadowfang Blood
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.ShadowfangKeep.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
