---
--- TowerofKarazhan.lua - Tower of Karazhan instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Tower of Karazhan
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

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local ephemeralPendant = {
    { id = 55482, dropRate = 20, disc = L["Neck"], container = { 47275, 47233, 47239, 47311, 47317, 47323, 47395, 47401, 47407, 47065, 47071, 47077, -- Ephemeral Pendant
            47329, 47185, 47191, 47197, 47113, 47119 } },
}

AtlasTW.InstanceData.TowerofKarazhan = {
    Name = LZ["Tower of Karazhan"],
    Location = LZ["Deadwind Pass"],
    Level = 60,
    Acronym = "KARA40",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Shadow"], L["Fire"], L["Arcane"],
    Keys = {
        { name = LMD["Upper Karazhan Tower Key"], loot = "VanillaKeys", info = L["Quests"] },
        { name = LMD["The Scepter of Medivh"], loot = "VanillaKeys", info = "6+" },
    },
    Entrances = {
        { letter = "A".." "..L["Entrance"] },
        { letter = "B".." "..L["Connection"] }
    },
    Bosses = {
        {
            id = "KeeperGnarlmoon",
            prefix = "1)",
            name = LB["Keeper Gnarlmoon"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55078 }, -- Ley-attuned Choker
                { id = 55084 }, -- Torn Wings of Midnight
                { id = 55081 }, -- Manadrenched Feather Slippers
                { id = 55285 }, -- Crite's Holy Hands
                { id = 55079 }, -- Ravenkeeper's Frenzied Embrace
                { id = 55083 }, -- Crown of the Wildpack
                {},
                { id = 55080 }, -- Bloodmoon, Sickle of the Murderous Flight
                {},
                { id = 55082 }, -- Idol of Laceration
            }
        },
        {
            id = "LeyWatcherIncantagos",
            prefix = "2)",
            name = LB["Ley-Watcher Incantagos"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55086 }, -- Magehunter Belt
                { id = 55099 }, -- Leysteel Legplates
                { id = 55089 }, -- Bands of the Surgebreaker
                { id = 55507 }, -- Choker of Terminal Arcanum
                { id = 55085 }, -- Magispark Leggings
                {},
                { id = 55087 }, -- Jewel of Wild Magics
                { id = 55091 }, -- Loop of Infused Renewal
                {},
                { id = 55090 }, -- Scaleshield of Azure Flight
                {},
                {},
                {},
                {},
                {},
                { id = 41403, dropRate = 100, container = { 55133, 55134, 55135 } }, -- Enchanted Amethyst
                {},
                { id = 41485, dropRate = 3, disc = L["Reagent"] }, -- Pristine Ley Crystal
                { id = 41373, disc = L["Quest Item"], dropRate = 100 }, -- Draconic Focus
            }
        },
        {
            id = "Anomalus",
            prefix = "3)",
            name = LB["Anomalus"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55097 }, -- Choker of Chromatic Power
                { id = 55106 }, -- Bindings of Contained Magic
                { id = 55098 }, -- Gloves of Nourishment
                { id = 55092 }, -- Manahide Slippers
                { id = 55095 }, -- Cloak of the Bloody Ravager
                {},
                { id = 55093 }, -- Remains of Overwhelming Power
                {},
                { id = 55096 }, -- Phase-shifting Crossbow
                { id = 55279 }, -- Branch of Resolute Defense
                {},
                { id = 41485, dropRate = 3, disc = L["Reagent"] }, -- Pristine Ley Crystal
                { id = 41412, dropRate = 100 }, -- Cosmic Residue
            }
        },
        {
            id = "EchoofMedivh",
            prefix = "4)",
            name = LB["Echo of Medivh"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55112 }, -- Pendant of Forgiven Mistakes
                { id = 55108 }, -- Dreadslayer Shoulderblades
                { id = 55109 }, -- Legwraps of Meticulous Planning
                { id = 55107 }, -- Gloves of Leyline Convergence
                {},
                { id = 55111 }, -- Eye of Dormant Corruption
                { id = 55110 }, -- Libram of the Eternal Tower
                { id = 55094 }, -- Medivh's Hindsight
                {},
                { id = 55276 }, -- Forgotten Raven's Mallet
                {},
                { id = 41485, dropRate = 3, disc = L["Reagent"] }, -- Pristine Ley Crystal
                { id = 41414, dropRate = 100 }, -- Anima of the Guardian
            }
        },
        {
            id = "King",
            prefix = "5)",
            name = LB["King"] .. LMD[" (Chess fight)"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 55088 }, -- Dragonclaw Gauntlets
                { id = 55102 }, -- Insomnius' Retribution
                { id = 55104 }, -- Pawn's Advance
                { id = 55105 }, -- Bishop's Reverence
                { id = 55274 }, -- Chain-Cloak of the Rookguard
                {},
                { id = 55101 }, -- King's Edict
                { id = 55103 }, -- Royal Seal of Greymane
                {},
                { id = 55100 }, -- Checkmate
                {},
                {},
                {},
                {},
                { id = 20739, dropRate = 3 }, -- Mechanical Horse
                { id = 55483, dropRate = 50, container = { 47232, 47238, 47310, 47316, 47274, 47394, 47400, 47406 } }, -- Ethereal Boots of Conquest
                { id = 55484, dropRate = 50, container = { 47064, 47070, 47076, 47322, 47328, 47184, 47190, 47196, 47112, 47118 } }, -- Ethereal Boots of Ascendancy
                {},
                { id = 41485, dropRate = 100, disc = L["Reagent"] }, -- Pristine Ley Crystal
                unpack(ephemeralPendant),
            }
        },
        {
            id = "SanvTasdal",
            prefix = "6)",
            name = LB["Sanv Tas'dal"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 55113 }, -- Dreadslayer Horns
                { id = 55117 }, -- Girdle of the Faded Primals
                { id = 55118 }, -- Kum'isha's Tattered Drape
                { id = 55119 }, -- Forgotten Hide Helm
                {},
                { id = 55114 }, -- Totem of Broken Earth
                {},
                { id = 55115 }, -- Riftcarver's Implement
                { id = 55116 }, -- Raka'shishi, Spear of the Adrift Hunt
                {},
                { id = 69001, dropRate = 100 }, -- Tiny Warp Stalker
                {},
                {},
                {},
                {},
                { id = 55485, dropRate = 50, container = { 47229, 47235, 47307, 47313, 47271, 47391, 47397, 47403 } }, -- Shifting Mantle of Conquest
                { id = 55486, dropRate = 50, container = { 47061, 47067, 47073, 47319, 47325, 47181, 47187, 47193, 47109, 47115 } }, -- Shifting Mantle of Ascendancy
                {},
                { id = 41485, dropRate = 100, disc = L["Reagent"] }, -- Pristine Ley Crystal
                unpack(ephemeralPendant),
            }
        },
        {
            id = "RupturanTheBroken",
            prefix = "7)",
            name = LB["Rupturan the Broken"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 55122 }, -- Earthquake Leggings
                { id = 55125 }, -- Handwraps of Dead Winds
                { id = 55126 }, -- Mantle of the Drifting Stars
                {},
                { id = 55123 }, -- Loop of Hardened Slate
                { id = 55124 }, -- Pure Jewel of Draenor
                {},
                { id = 55120 }, -- Al'Kazeth, Claw of Ruptured Elements
                { id = 55121 }, -- Bulwark of Enduring Earth
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 55487, dropRate = 50, container = { 47228, 47234, 47306, 47312, 47270, 47390, 47396, 47402 } }, -- Fractured Crown of Conquest
                { id = 55488, dropRate = 50, container = { 47060, 47066, 47072, 47318, 47324, 47180, 47186, 47192, 47108, 47114 } }, -- Fractured Crown of Ascendancy
                {},
                { id = 41485, dropRate = 100, disc = L["Reagent"] }, -- Pristine Ley Crystal
                unpack(ephemeralPendant),
            }
        },
        {
            id = "Kruul",
            prefix = "8)",
            name = LB["Kruul"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 55132 }, -- Pendant of Purified Demon's Blood
                { id = 55130 }, -- Wristwraps of Exiled Radiance
                { id = 55506 }, -- Worldbreaker Girdle
                {},
                { id = 55131 }, -- Shieldrender Talisman
                {},
                { id = 55511 }, -- Hellflame
                { id = 55127 }, -- Shar'tateth, the Shattered Edge
                { id = 55129 }, -- Desecration
                { id = 55128 }, -- Comet Signaller
                { id = 55510 }, -- Fragments of Aldrach
                {},
                {},
                {},
                {},
                { id = 55489, dropRate = 50, container = { 47273, 47231, 47237, 47309, 47315, 47393, 47399, 47405 } }, -- Brutal Leggings of Conquest
                { id = 55490, dropRate = 50, container = { 47063, 47069, 47075, 47321, 47327, 47183, 47189, 47195, 47111, 47117 } }, -- Brutal Leggings of Ascendancy
                {},
                { id = 41485, dropRate = 3, disc = L["Reagent"] }, -- Pristine Ley Crystal
                unpack(ephemeralPendant),
            }
        },
        {
            id = "Mephistroth",
            prefix = "9)",
            name = LB["Mephistroth"],
            defaults = { dropRate = 7 },
            loot = {
                { id = 55351 }, -- Turalyon's Hope
                { id = 55356 }, -- Netherwrought Bracers
                { id = 55513 }, -- Tunic of Demonic Deception
                { id = 55357 }, -- Sash of the Grand Betrayal
                { id = 55352 }, -- Cloak of Rapid Regeneration
                { id = 55354 }, -- Khadgar's Guidance
                { id = 55355 }, -- Memory of the Last Guardian
                { id = 55512 }, -- Forgotten Hide Pauldrons
                {},
                { id = 55346 }, -- Rain of Spiders
                { id = 55347 }, -- Thunderfall, Stormhammer of the Chief Thane
                { id = 55348 }, -- Kirel'narak, the Death Sentence
                { id = 55349 }, -- Nethraka, Wing of Oblivion
                { id = 55350 }, -- Censer of Soulwarding
                {},
                { id = 55353 }, -- Mephistroth's Cunning
                {},
                { id = 55579, dropRate = 100, container = { 55515, 55516, 55517 } }, -- Heart of Mephistroth
                {},
                unpack(ephemeralPendant),
                {},
                { id = 55491, dropRate = 100, container = { 47230, 47236, 47308, 47314, 47272, 47392, 47398, 47404 } }, -- Nathrezim Armor of Treachery
                { id = 55492, dropRate = 100, container = { 47062, 47068, 47074, 47320, 47326, 47182, 47188, 47194, 47110, 47116 } }, -- Nathrezim Armor of Deceit
                {},
                { id = 41485, dropRate = 100, disc = L["Reagent"] }, -- Pristine Ley Crystal
                { id = 41447, dropRate = 100 }, -- Soul of the Dreadlord
                {},
                { id = 92082, dropRate = 5 }, -- Felforged Dreadhound
            }
        },
        {
            id = "K40Trash",
            name = L["Trash Mobs"].."-"..LZ["Tower of Karazhan"],
            defaults = { dropRate = .25 },
            loot = {
                { id = 55278 }, -- Ques' Gauntlets of Precision
                { id = 55280 }, -- Boots of Elemental Fury
                { id = 55281 }, -- Gauntlets of Elemental Fury
                { id = 55282 }, -- Boots of the Grand Crusader
                { id = 55283 }, -- Gauntlets of the Grand Crusader
                { id = 55284 }, -- Dragunovi's Sash of Domination
                {},
                { id = 55286 }, -- Ring of Holy Light
                { id = 55508 }, -- Brand of Karazhan
                { id = 55275 }, -- Slivers of Nullification
                {},
                { id = 55277 }, -- The End of All Ambitions
                {},
                { id = 41485, dropRate = .4, disc = L["Reagent"] }, -- Pristine Ley Crystal
            }
        },
        { name = LMD["Tower of Karazhan Sets"], items = "AtlasTWLootT35SetMenu" },
    }
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.TowerofKarazhan.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end