---
--- ZulFarrak.lua - Zul'Farrak dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Zul'Farrak
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Mid-level dungeon item drops
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
local LS = AtlasTW.Localization.Spells
local LMD = AtlasTW.Localization.MapData

local GREY = AtlasTW.Colors.GREY

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.ZulFarrak = {
    Name = LZ["Zul'Farrak"],
    Location = LZ["Tanaris"],
    Level = { 30, 54 },
    Acronym = "ZF",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Keys = {
        { name = LMD["Mallet of Zul'Farrak"], loot = "VanillaKeys", info = LB["Gahz'rilla"] }
    },

    Bosses = {
        {
            id = "ZFAntusul",
            prefix = "1)",
            name = LB["Antu'sul"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 9640 }, -- Vice Grips
                { id = 9641 }, -- Lifeblood Amulet
                { id = 9639 }, -- The Hand of Antu'sul
                {},
                { id = 9379, container = { 9372 } }, -- Sang'thraze the Deflector
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "ZFThekatheMartyr",
            prefix = "2)",
            name = LMD["Theka the Martyr"],
            loot = {
                { id = 10660, dropRate = 100, container = { 10749, 10750, 10751 } }, -- First Mosh'aru Tablet
            }
        },
        {
            id = "ZFWitchDoctorZumrah",
            prefix = "3)",
            name = LB["Witch Doctor Zum'rah"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 18083 }, -- Jumanza Grips
                { id = 18082 }, -- Zum'rah's Vexing Cane
                {},
                { id = 51803, dropRate = 8 }, -- Totem of the Endless Flicker
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "ZFZulFarrakDeadHero",
            name = LMD["Zul'Farrak Dead Hero"],
            color = GREY,
        },
        {
            id = "ZFNekrumGutchewer",
            prefix = "4)",
            name = LMD["Nekrum Gutchewer"],
            loot = {
                { id = 9471, dropRate = 100, container = { 9651, 9652 } }, -- Nekrum's Medallion
            }
        },
        {
            id = "ZFSezzziz",
            name = LB["Shadowpriest Sezz'ziz"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 9470 }, -- Bad Mojo Mask
                { id = 9473 }, -- Jinxed Hoodoo Skin
                { id = 9474 }, -- Jinxed Hoodoo Kilt
                { id = 9475 }, -- Diabolic Skiver
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "ZFDustwraith",
            name = LMD["Dustwraith"],
            postfix = L["Rare"],
            loot = {
                { id = 12471, dropRate = 19 }, -- Desertwalker Cane
            }
        },
        {
            id = "ZFSergeantBly",
            prefix = "5)",
            name = LMD["Sergeant Bly"],
            loot = {
                { id = 8548, dropRate = 100, container = { 9533, 9534 } }, -- Divino-matic Rod
            }
        },
        {
            id = "ZFWeegliBastfuse",
            name = LMD["Weegli Blastfuse"],
            color = GREY,
        },
        {
            id = "ZFMurtaGrimgut",
            name = LMD["Murta Grimgut"],
            color = GREY,
        },
        {
            id = "ZFRaven",
            name = LMD["Raven"],
            color = GREY,
        },
        {
            id = "ZFOroEyegouge",
            name = LMD["Oro Eyegouge"],
            color = GREY,
        },
        {
            id = "ZFSandfury",
            name = LMD["Sandfury Executioner"],
            loot = {
                { id = 8444, dropRate = 20 }, -- Executioner's Key
            }
        },
        {
            id = "ZFChiefUkorzSandscalp",
            prefix = "6)",
            name = LB["Chief Ukorz Sandscalp"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 9479 }, -- Embrace of the Lycan
                { id = 9476 }, -- Big Bad Pauldrons
                {},
                { id = 9477 }, -- The Chief's Enforcer
                { id = 9478 }, -- Ripsaw
                { id = 11086, container = { 9372 } }, -- Jang'thraze the Protector
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "ZFRuuzlu",
            name = LB["Ruuzlu"],
            color = GREY,
        },
        {
            id = "ZFFlameOfFarrak",
            name = LMD["Flame of Farrak"],
            loot = {
                { id = 41685, dropRate = 100 }, -- Flame of Farrak (for 8 boss vulnerable) --1.18
            }
        },
        {
            id = "ZFElderWildmane",
            name = LMD["Elder Wildmane"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            id = "ZFHydromancerVelratha",
            prefix = "7)",
            name = LMD["Hydromancer Velratha"],
            loot = {
                { id = 9234, dropRate = 100, container = { 9527, 9531 } }, -- Tiara of the Deep
                { id = 10661, dropRate = 100, container = { 10749, 10750, 10751 } }, -- Second Mosh'aru Tablet
            }
        },
        {
            id = "ZFGahzrilla",
            name = LB["Gahz'rilla"],
            postfix = L["Summon"],
            loot = {
                { id = 9469, dropRate = 50 }, -- Gahz'rilla Scale Armor
                { id = 9467, dropRate = 30 }, -- Gahz'rilla Fang
                { id = 80747, dropRate = 20 }, -- Electrified Gloves
                {},
                { id = 8707, dropRate = 100, container = { 11122 } }, -- Gahz'rilla's Electrified Scale
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "ZFZeljebTheAncient", --1.18
            prefix = "8)",
            name = LB["Zel'jeb the Ancient"],
            defaults = { dropRate = 25 },
            postfix = LMD["Flame of Farrak"],
            loot = {
                { id = 58116 }, -- Bloodstained Fangblade
                { id = 58117 }, -- Staff of the Bloodbound
                { id = 58118 }, -- Sash of Ritual Scars
                { id = 58119 }, -- Bracers of the Bloodbound

            }
        },
        {
            name = LZ["Farraki Arena"], --1.18
            prefix = "9)",
            color = GREY,
        },
        {
            name = LB["Juthza the Cunning"], --1.18
            color = GREY,
        },
        {
            name = LB["Kath'zen the Brutal"], --1.18
            color = GREY,
        },
        {
            id = "ZFRazjalTheQuick", --1.18
            name = LB["Champion Razjal the Quick"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58092 }, -- Champion's Sandhelm
                { id = 58093 }, -- Libram of the Farraki Zealot
                { id = 58094 }, -- Gilded Blade of Razjal
                { id = 58095 }, -- Talisman of the Sandborn
            }
        },
        {
            id = "ZFZerillis",
            prefix = "10)",
            name = LMD["Zerillis"],
            postfix = L["Rare"]..L[", "]..L["Wanders"],
            loot = {
                { id = 12470, dropRate = 19 }, -- Sandstalker Ankleguards
            }
        },
        {
            id = "ZFTrash",
            name = L["Trash Mobs"].."-"..LZ["Zul'Farrak"],
            defaults = { dropRate = .02 },
            loot = {
                { id = 9512 }, -- Blackmetal Cape
                { id = 9484 }, -- Spellshock Leggings
                { id = 862 }, -- Runed Ring
                { id = 6440 }, -- Brainlash
                { id = 9483 }, -- Flaming Incinerator
                { id = 2040 }, -- Troll Protector
                { id = 5616 }, -- Gutwrencher
                { id = 9511 }, -- Bloodletter Scalpel
                { id = 9481 }, -- The Minotaur
                { id = 9480 }, -- Eyegouger
                { id = 9482 }, -- Witch Doctor's Cane
                {},
                { id = 9243, dropRate = 2 }, -- Shriveled Heart
                {},
                { id = 70167, LS["Gemology"], dropRate = .04, container = { 56018 } }, -- Plans: Enchanted Emerald Gemstone
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.ZulFarrak.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end