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
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.ZulFarrak = {
    Name = BZ["Zul'Farrak"],
    Location = BZ["Tanaris"],
    Level = { 30, 54 },
    Acronym = "ZF",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Keys = {
        { name = L["Mallet of Zul'Farrak"], loot = "VanillaKeys", info = BB["Gahz'rilla"] }
    },

    Bosses = {
        {
            id = "ZFAntusul",
            prefix = "1)",
            name = BB["Antu'sul"],
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
            name = L["Theka the Martyr"],
            loot = {
                { id = 10660, dropRate = 100, container = { 10749, 10750, 10751 } }, -- First Mosh'aru Tablet
            }
        },
        {
            id = "ZFWitchDoctorZumrah",
            prefix = "3)",
            name = BB["Witch Doctor Zum'rah"],
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
            name = L["Zul'Farrak Dead Hero"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFNekrumGutchewer",
            prefix = "4)",
            name = L["Nekrum Gutchewer"],
            loot = {
                { id = 9471, dropRate = 100, container = { 9651, 9652 } }, -- Nekrum's Medallion
            }
        },
        {
            id = "ZFSezzziz",
            name = BB["Shadowpriest Sezz'ziz"],
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
            name = L["Dustwraith"],
            postfix = L["Rare"],
            loot = {
                { id = 12471, dropRate = 19 }, -- Desertwalker Cane
            }
        },
        {
            id = "ZFSergeantBly",
            prefix = "5)",
            name = L["Sergeant Bly"],
            loot = {
                { id = 8548, dropRate = 100, container = { 9533, 9534 } }, -- Divino-matic Rod
            }
        },
        {
            id = "ZFWeegliBastfuse",
            name = L["Weegli Blastfuse"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFMurtaGrimgut",
            name = L["Murta Grimgut"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFRaven",
            name = L["Raven"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFOroEyegouge",
            name = L["Oro Eyegouge"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFSandfury",
            name = L["Sandfury Executioner"],
            loot = {
                { id = 80747, dropRate = 20 }, -- Electrified Gloves
            }
        },
        {
            id = "ZFChiefUkorzSandscalp",
            prefix = "6)",
            name = BB["Chief Ukorz Sandscalp"],
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
            name = L["Ruuzlu"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFElderWildmane",
            name = L["Elder Wildmane"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            id = "ZFHydromancerVelratha",
            prefix = "7)",
            name = L["Hydromancer Velratha"],
            loot = {
                { id = 9234, dropRate = 100, container = { 9527, 9531 } }, -- Tiara of the Deep
                { id = 10661, dropRate = 100, container = { 10749, 10750, 10751 } }, -- Second Mosh'aru Tablet
            }
        },
        {
            id = "ZFGahzrilla",
            name = BB["Gahz'rilla"],
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
            id = "ZFZeljebTheAncient",
            prefix = "8)",
            name = BB["Zel'jeb the Ancient"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58116 }, -- Bloodstained Fangblade
                { id = 58117 }, -- Staff of the Bloodbound
                { id = 58118 }, -- Sash of Ritual Scars
                { id = 58119 }, -- Bracers of the Bloodbound

            }
        },
        {
            name = BZ["Farraki Arena"],
            prefix = "9)",
            color = "|cff9d9d9d",
        },
        {
            name = BB["Juthza the Cunning"],
            color = "|cff9d9d9d",
        },
        {
            name = BB["Kath'zen the Brutal"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFRazjalTheQuick",
            name = BB["Champion Razjal the Quick"],
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
            name = L["Zerillis"],
            postfix = L["Rare"]..L[", "]..L["Wanders"],
            loot = {
                { id = 12470, dropRate = 19 }, -- Sandstalker Ankleguards
            }
        },
        {
            id = "ZFTrash",
            name = L["Trash Mobs"].."-"..BZ["Zul'Farrak"],
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
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.ZulFarrak.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
