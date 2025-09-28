---
--- TheBlackMorass.lua - The Black Morass instance loot data
---
--- This module contains comprehensive loot tables and boss data for The Black Morass
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
--- @since 1.0.1
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.CavernsOfTimeBlackMorass = {
    Name = BZ["Black Morass"],
    Location = BZ["Tanaris"],
    Level = { 58, 60 },
    Acronym = "BM",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] },
        { letter = "B) " .. L["Connection"] }
    },
    Reputation = {
        { name = BF["Wardens of Time"], loot = "WardensofTime" }
    },
    Bosses = {
        {
            id = "COTBMChronar",
            prefix = "1)",
            name = BB["Chronar"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 61018 }, -- Cloak of Elemental Warding
                { id = 61036 }, -- Boots of the Riftwalker
                { id = 61047 }, -- Monolith Headguard
                { id = 61048 }, -- Girdle of Distant Stars
                {},
                { id = 61019 }, -- Wand of the Eclipse
                { id = 61016 }, -- Time-Lost Claymore
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 50203, quantity = { 10, 15 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
                { id = 41458, dropRate = 100 }, -- Time-Worn Spear
                { id = 60496, dropRate = 100 }, -- Head of Chronar
            }
        },
        {
            id = "COTBMEpidamu",
            prefix = "2)",
            name = BB["Epidamu"],
            defaults = { dropRate = 13 },
            loot = {
                {},
                { id = 50431 }, -- Extremely Well Crafted Cuffs
                { id = 61032 }, -- Band of Infinite Possibilities
                { id = 61041 }, -- Imbued Planar Belt
                { id = 61045 }, -- Nexus Shoulderpads
                { id = 61055 }, -- Tome of Riftmancy
                { id = 61056 }, -- Arcanoweave Boots
                { id = 61700 }, -- Fabric of Time
                { id = 61698 }, -- Totem of the Calming River
                {},
                { id = 50203, quantity = { 15, 20 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
            }
        },
        {
            id = "COTBMDriftingAvatar",
            prefix = "3)",
            name = BB["Drifting Avatar of Sand"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 61015 }, -- Hollowbone Choker
                { id = 61024 }, -- Greaves of the Elusive
                { id = 61033 }, -- Nightwind Leggings
                { id = 61038 }, -- Pauldrons of the Timeless
                { id = 61042 }, -- Stormfist
                { id = 61044 }, -- Gavel of the Northwind
                { id = 61057 }, -- Arcanic Gloves
                {},
                { id = 61020, dropRate = 2 }, -- Lodestone
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 50203, quantity = { 15, 20 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
            }
        },
        {
            id = "COTBMTimeLordEpochronos",
            prefix = "4)",
            name = BB["Time-Lord Epochronos"],
            defaults = { dropRate = 12 },
            loot = {
                { id = 50428 }, -- Ancient Clutch
                { id = 50430 }, -- Magic-infused Cloak
                { id = 61017 }, -- Shoulderguards of the Defiler
                { id = 61021 }, -- Shadowshifter Armguards
                { id = 61028 }, -- Bulwark of the Crimson Guard
                { id = 61054 }, -- Azurite Legguards
                { id = 61058 }, -- Leggings of the Nullifier
                { id = 61022 }, -- Dagger of the Currents
                {},
                { id = 61049, dropRate = 0.95 }, -- Chronobreaker
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 50203, quantity = { 15, 20 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
            }
        },
        {
            id = "COTBMMossheart",
            prefix = "5)",
            name = BB["Mossheart"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 61050 }, -- Gauntlets of the Bogbeast
                { id = 61051 }, -- Blackthorn Band
                { id = 61059 }, -- Mossheart's Heart
                { id = 61060 }, -- Thornweave Mask
                { id = 61061 }, -- Regenerating Robe
                { id = 61062 }, -- Corroded Plate Belt
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 50203, quantity = { 20, 25 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
            }
        },
        {
            id = "COTBMAntnormi",
            prefix = "6)",
            name = BB["Antnormi"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 50427, dropRate = 50 }, -- Time-blackened Chestpiece
                { id = 61053, dropRate = 50 }, -- Timeloop Headguard
                {},
                { id = 61046 }, -- Shadowreaper
                { id = 50429 }, -- Spear of the Endless Hunt
                { id = 61037 }, -- Breastplate of the Lost Champion
                {},
                { id = 61031 }, -- Riftweaver
                { id = 61027 }, -- Epaulets of the Forgotten Past
                { id = 61040 }, -- Gloves of the Unknown
                {},
                { id = 61014, dropRate = 1 }, -- Temporal Anomaly
                { id = 61043, dropRate = 1.1 }, -- Eye of the Abyss
                {},
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 51044, disc = L["Quest Item"], dropRate = 100, container = { 82950, 82951, 82952, 82953 } }, -- Antnormi's Head
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                        70234, 70235, 70236, 70238 } },
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 50203, quantity = { 10, 15 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
                { id = 51217, quantity = 2, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
            }
        },
        {
            id = "COTBMRotmaw",
            prefix = "7)",
            name = BB["Rotmaw"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 61023 }, -- Breastplate of the Wild Hunt
                { id = 61025 }, -- Pyreflame Lantern
                { id = 61029 }, -- Crocolisk Tooth Necklace
                { id = 61030 }, -- The Murkfisher
                { id = 61034 }, -- Band of the Marsh Bog
                { id = 61063 }, -- Rotmaw's Tooth
                { id = 61699 }, -- Idol of Savagery
                { id = 61701 }, -- Wraps of the Transmogrified
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 50203, quantity = { 10, 15 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
            }
        },
        {
            id = "COTTrash",
            name = L["Trash Mobs"].."-"..BZ["Black Morass"],
            defaults = { dropRate = .001 },
            loot = {
                { id = 61564 }, -- Chromie's Broken Pocket Watch
                { id = 61565 }, -- Crochide Wrists
                { id = 61571 }, -- Leeching Fang
                { id = 61570 }, -- Old Champion's Helmet
                { id = 61568 }, -- Overcharged Belt
                { id = 61569 }, -- Time Frozen Bow
                { id = 61567 }, -- Timewarper's Staff
                { id = 61566 }, -- Windchanneler
                {},
                { id = 54003, dropRate = .03 }, -- Infinite Frog
                {},
                { id = 61673, disc = L["Reagent"], dropRate = 4 }, -- Arcane Essence
                {},
                { id = 50203, quantity = { 1, 3 }, disc = L["Quest Item"], dropRate = 100 }, -- Corrupted Sand
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.CavernsOfTimeBlackMorass.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
