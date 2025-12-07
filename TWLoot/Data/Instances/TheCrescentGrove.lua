---
--- TheCrescentGrove.lua - The Crescent Grove instance loot data
---
--- This module contains comprehensive loot tables and boss data for The Crescent Grove
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
local LZ = AtlasTW.Localization.Zones
local LB = AtlasTW.Localization.Bosses
local LMD = AtlasTW.Localization.MapData

local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TheCrescentGrove = {
    Name = LZ["The Crescent Grove"],
    Location = LZ["Ashenvale"],
    Level = { 32, 38 },
    Acronym = "CG",
    MaxPlayers = 5,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A" }
    },
    Bosses = {
        {
            prefix = "a)",
            name = LMD["Kalanar's Strongbox"],
            loot = {
                { id = 60472, dropRate = 100 }, -- Kalanar's Mallet
            }
        },
        {
            id = "TCGGrovetenderEngryss",
            prefix = "1)",
            name = LB["Grovetender Engryss"],
            defaults = { dropRate = 24 },
            loot = {
                { id = 83220 }, -- Groveweald Tribal Necklace
                { id = 83221 }, -- Thornroot Maul
                { id = 83222 }, -- Groveweald Elder Cuffs
                { id = 83223 }, -- Furbolg Battle Grips
                {},
                { id = 83224, dropRate = 5 }, -- Horn of Engryss
                {},
                { id = 60176, dropRate = 100 }, -- Groveweald Badge
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "TCGElderBlackmaw",
            name = LB["Elder Blackmaw"],
            defaults = { dropRate = 100 },
            loot = {
                { id = 60178, container = { 60179 } }, -- Paw of Elder Blackmaw
                { id = 60176 }, --Groveweald Badge
            }
        },
        {
            id = "TCGElderOneEye",
            name = LB["Elder 'One Eye'"],
            defaults = { dropRate = 100 },
            loot = {
                { id = 60177, container = { 60179 } }, -- Paw of Elder 'One Eye'
                { id = 60176 }, --Groveweald Badge
            }
        },
        {
            id = "TCGKeeperRanathos",
            prefix = "2)",
            name = LB["Keeper Ranathos"],
            defaults = { dropRate = 24 },
            loot = {
                { id = 83225 }, -- Bow of the Grove
                { id = 83227 }, -- Glademender's Robes
                { id = 83226 }, -- Bands of Ranathos
                { id = 83228 }, -- Treads of the Keeper
                {},
                { id = 83229, dropRate = 5 }, -- Circlet of Cenarius
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "TCGHighPriestessAlathea",
            prefix = "3)",
            name = LB["High Priestess A'lathea"],
            defaults = { dropRate = 30 },
            loot = {
                { id = 83208 }, -- Circlet of the Crescent Moon
                { id = 83209 }, -- Sentinel's Moonslicer
                { id = 83211 }, -- Moontouched Shoulders
                {},
                { id = 83210, dropRate = 10 }, -- Crescent Sigil
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "TCGFenektistheDeceiver",
            prefix = "4)",
            name = LB["Fenektis the Deceiver"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 83212 }, -- Felflame Shard
                { id = 83213 }, -- Trickster's Wraps
                { id = 83214 }, -- Betrayer
                { id = 83215 }, -- Blackflame Wand
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "TCGMasterRaxxieth",
            prefix = "5)",
            name = LB["Master Raxxieth"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 60258, dropRate = 0.5 }, -- Crown of Corruption
                {},
                { id = 83216 }, -- Blood-Spattered Helm
                { id = 83217 }, -- Ring of Demonic Fury
                { id = 83218 }, -- Shadowthread Cloak
                { id = 83219 }, -- Slayer's Edge
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "TCGTrash",
            name = L["Trash Mobs"].."-"..LZ["The Crescent Grove"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 83203 }, -- Lifeflow Necklace
                { id = 83204, dropRate = .5 }, -- Canopy Cloak
                { id = 83207, dropRate = .10 }, -- Feymist Robe
                { id = 83201, dropRate = .5 }, -- Grizzlehide Brawlers
                { id = 83206 }, -- Living Moss Gauntlets
                { id = 83202, dropRate = .5 }, -- Grizzlehide Belt
                { id = 83200 }, -- Verdant Cane
                { id = 83205, dropRate = .5 }, -- Thornwood Claw
            }
        },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.TheCrescentGrove.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end