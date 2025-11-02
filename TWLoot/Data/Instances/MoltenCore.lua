---
--- MoltenCore.lua - Molten Core raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Molten Core
--- 40-player raid instance. It includes all boss encounters, shared loot pools,
--- tier set items, legendary drops, and crafting patterns with their drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Shared loot pool definitions
--- • Tier 1 set items and tokens
--- • Legendary weapon drops
--- • Crafting patterns and recipes
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}
local mCShareloot = {
    {},
    { id = 18264, dropRate = 1, container = { 18262 } }, -- Plans: Elemental Sharpening Stone
    { id = 18292, dropRate = 1, container = { 18282 } }, -- Schematic: Core Marksman Rifle
    { id = 18291, dropRate = 1, container = { 18168 } }, -- Schematic: Force Reactive Disk
    { id = 18290, dropRate = 1, container = { 18283 } }, -- Schematic: Biznicks 247x128 Accurascope
    { id = 18252, dropRate = 1, container = { 18251 } }, -- Pattern: Core Armor Kit
    { id = 18265, dropRate = 1, container = { 18263 } }, -- Pattern: Flarecore Wraps
    { id = 21371, dropRate = 1, container = { 21342 } }, -- Pattern: Core Felcloth Bag
    { id = 18257, dropRate = 1, container = { 18253 } }, -- Recipe: Major Rejuvenation Potion
    { id = 18259, dropRate = 1 }, -- Formula: Enchant Weapon - Spell Power
    { id = 18260, dropRate = 1 }, -- Formula: Enchant Weapon - Healing Power
}

AtlasTW.InstanceData.MoltenCore = {
    Name = BZ["Molten Core"],
    Location = BZ["Blackrock Depths"],
    Level = 60,
    Acronym = "MC",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Fire"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Hydraxian Waterlords"], loot = "HydroxianWaterLords" },
    },
    Keys = {
        { name = L["Aqual Quintessence"], loot = "VanillaKeys", info = L["Boss"] },
        { name = L["Eternal Quintessence"], loot = "VanillaKeys", info = L["Boss"] }
    },
    Bosses = {
        {
            id = "Incindis",
            prefix = "1)",
            name = BB["Incindis"],--52145
            defaults = { dropRate = 5 },
            loot = {
                { id = 16812, dropRate = 25, container = { 47202 } }, -- Gloves of Prophecy
                { id = 16839, dropRate = 25, container = { 47124, 47132 } }, -- Earthfury Gloves
                { id = 16860, dropRate = 25, container = { 47004, 47012 } }, -- Lawbringer Gloves
                { id = 16826, dropRate = 25 }, -- Nightslayer Gloves
                { id = 16862, dropRate = 25, container = { 47247 } }, -- Sabatons of Might
                { id = 16849, dropRate = 25 }, -- Giantstalker's Boots
                {},
                { id = 58205, dropRate = 20 }, -- Primal Flameslinger
                { id = 58206, dropRate = 20 }, -- Idol of the Forgotten Wilds
                { id = 58207, dropRate = 20 }, -- Fist of the Flamewaker
                { id = 58208, dropRate = 20 }, -- Shroud of Flowing Magma
                { id = 58209, dropRate = 20 }, -- Sizzling Pyrestone Aureole
                {},
                { id = 17077 }, -- Crimson Shocker
                { id = 18861 }, -- Flamewaker Legplates
                { id = 18870 }, -- Helm of the Lifegiver
                { id = 18872 }, -- Manastorm Leggings
                { id = 18875 }, -- Salamander Scale Pants
                { id = 18878 }, -- Sorcerous Dagger
                { id = 18879 }, -- Heavy Dark Iron Ring
                { id = 19145 }, -- Robe of Volatile Power
                { id = 19146 }, -- Wristguards of Stability
                { id = 19147 }, -- Ring of Spell Power
                { id = 41988, dropRate = 100, container = { 41990 } }, -- Molten Scale
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
                {},
                unpack(mCShareloot),
            }
        },
        {
            id = "Lucifron",
            prefix = "2)",
            name = BB["Lucifron"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 16800, dropRate = 20, container = { 47085 } }, -- Arcanist Boots
                { id = 16829, dropRate = 20, container = { 47337, 47345 } }, -- Cenarion Boots
                { id = 16837, dropRate = 20, container = { 47127, 47135 } }, -- Earthfury Boots
                { id = 16859, dropRate = 20, container = { 47007, 47015 } }, -- Lawbringer Boots
                { id = 16863, dropRate = 30, container = { 47244 } }, -- Gauntlets of Might
                { id = 16805, dropRate = 30, container = { 47280 } }, -- Felheart Gloves
                {},
                { id = 16665, disc = L["Book"], dropRate = 100 }, -- Tome of Tranquilizing Shot
                { id = 18870 }, -- Helm of the Lifegiver
                { id = 17109, dropRate = 20 }, -- Choker of Enlightenment
                { id = 19145 }, -- Robe of Volatile Power
                { id = 19146 }, -- Wristguards of Stability
                { id = 18872 }, -- Manastorm Leggings
                { id = 18875 }, -- Salamander Scale Pants
                { id = 18861 }, -- Flamewaker Legplates
                { id = 18879 }, -- Heavy Dark Iron Ring
                { id = 19147 }, -- Ring of Spell Power
                { id = 17077 }, -- Crimson Shocker
                { id = 18878 }, -- Sorcerous Dagger
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Magmadar",
            prefix = "3)",
            name = BB["Magmadar"],
            defaults = { dropRate = 5 },
            loot = {
                { id = 16814, dropRate = 20, container = { 47204 } }, -- Trousers of Prophecy
                { id = 16796, dropRate = 20, container = { 47084 } }, -- Arcanist Leggings
                { id = 16810, dropRate = 20, container = { 47282 } }, -- Felheart Pants
                { id = 16835, dropRate = 17, container = { 47336, 47344 } }, -- Cenarion Leggings
                { id = 16843, dropRate = 17, container = { 47126, 47134 } }, -- Earthfury Pants
                { id = 16855, dropRate = 17, container = { 47006, 47014 } }, -- Lawbringer Legplates
                { id = 16867, dropRate = 17, container = { 47246 } }, -- Legplates of Might
                { id = 16822, dropRate = 20 }, -- Nightslayer Pants
                { id = 16847, dropRate = 17 }, -- Giantstalker's Leggings
                {},
                { id = 19142 }, -- Fire Runed Grimoire
                { id = 17069, dropRate = 20 }, -- Striker's Mark
                { id = 18203, dropRate = 20 }, -- Eskhandar's Right Claw
                { id = 17073, dropRate = 20 }, -- Earthshaker
                { id = 18822, dropRate = 5 }, -- Obsidian Edged Blade
                { id = 17065, dropRate = 17 }, -- Medallion of Steadfast Might
                { id = 18829 }, -- Deep Earth Spaulders
                { id = 18823 }, -- Aged Core Leather Gloves
                { id = 19143 }, -- Flameguard Gauntlets
                { id = 19136 }, -- Mana Igniting Cord
                { id = 18861 }, -- Flamewaker Legplates
                { id = 19144 }, -- Sabatons of the Flamewalker
                { id = 18824 }, -- Magma Tempered Boots
                { id = 18821 }, -- Quick Strike Ring
                { id = 18820 }, -- Talisman of Ephemeral Power
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Garr",
            prefix = "4)",
            name = BB["Garr"],
            defaults = { dropRate = 5 },
            loot = {
                { id = 16813, dropRate = 20, container = { 47198 } }, -- Circlet of Prophecy
                { id = 16795, dropRate = 20, container = { 47078 } }, -- Arcanist Crown
                { id = 16808, dropRate = 20, container = { 47276 } }, -- Felheart Horns
                { id = 16821, dropRate = 20 }, -- Nightslayer Cover
                { id = 16834, dropRate = 17, container = { 47330, 47338 } }, -- Cenarion Helm
                { id = 16846, dropRate = 17 }, -- Giantstalker's Helmet
                { id = 16842, dropRate = 17, container = { 47120, 47128 } }, -- Earthfury Helmet
                { id = 16854, dropRate = 17, container = { 47000, 47008 } }, -- Lawbringer Helm
                { id = 16866, dropRate = 17, container = { 47240 } }, -- Helm of Might
                {},
                { id = 17782 }, -- Talisman of Binding Shard
                { id = 18564, disc = L["Quest Item"]..", "..L["Right Half"], container = { 19019 } }, -- Bindings of the Windseeker
                { id = 18829 }, -- Deep Earth Spaulders
                { id = 18823 }, -- Aged Core Leather Gloves
                { id = 19143 }, -- Flameguard Gauntlets
                { id = 19136 }, -- Mana Igniting Cord
                { id = 18861 }, -- Flamewaker Legplates
                { id = 19144, dropRate = 11 }, -- Sabatons of the Flamewalker
                { id = 18824 }, -- Magma Tempered Boots
                { id = 18821 }, -- Quick Strike Ring
                { id = 18820 }, -- Talisman of Ephemeral Power
                { id = 19142 }, -- Fire Runed Grimoire
                { id = 17066, dropRate = 17 }, -- Drillborer Disk
                { id = 17071, dropRate = 20 }, -- Gutgore Ripper
                { id = 17105, dropRate = 20 }, -- Aurastone Hammer
                { id = 18832, dropRate = 20 }, -- Brutality Blade
                { id = 18822, dropRate = 5 }, -- Obsidian Edged Blade
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Shazzrah",
            prefix = "5)",
            name = BB["Shazzrah"],
            defaults = { dropRate = 3 },
            loot = {
                { id = 16811, dropRate = 25, container = { 47205 } }, -- Boots of Prophecy
                { id = 16803, dropRate = 25, container = { 47283 } }, -- Felheart Slippers
                { id = 16824, dropRate = 25 }, -- Nightslayer Boots
                {},
                { id = 16831, dropRate = 33, container = { 47334, 47342 } }, -- Cenarion Gloves
                { id = 16801, dropRate = 33, container = { 47082 } }, -- Arcanist Gloves
                { id = 16852, dropRate = 33 }, -- Giantstalker's Gloves
                {},
                { id = 18870 }, -- Helm of the Lifegiver
                { id = 19145 }, -- Robe of Volatile Power
                { id = 19146 }, -- Wristguards of Stability
                { id = 18872 }, -- Manastorm Leggings
                { id = 18875 }, -- Salamander Scale Pants
                { id = 18861 }, -- Flamewaker Legplates
                { id = 18879 }, -- Heavy Dark Iron Ring
                { id = 19147 }, -- Ring of Spell Power
                {},
                { id = 17077 }, -- Crimson Shocker
                { id = 18878 }, -- Sorcerous Dagger
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "BaronGeddon",
            prefix = "6)",
            name = BB["Baron Geddon"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 16797, dropRate = 33, container = { 47079 } }, -- Arcanist Mantle
                { id = 16807, dropRate = 33, container = { 47277 } }, -- Felheart Shoulder Pads
                { id = 16836, dropRate = 30, container = { 47331, 47339 } }, -- Cenarion Spaulders
                { id = 16844, dropRate = 30, container = { 47121, 47358 } }, -- Earthfury Spaulders
                { id = 16856, dropRate = 60, container = { 47001, 47009 } }, -- Lawbringer Spaulders
                {},
                { id = 18563, dropRate = 6, disc = L["Quest Item"]..", "..L["Left Half"], container = { 19019 } }, -- Bindings of the Windseeker
                { id = 18829 }, -- Deep Earth Spaulders
                { id = 18823, dropRate = 1 }, -- Aged Core Leather Gloves
                { id = 19143 }, -- Flameguard Gauntlets
                { id = 19136 }, -- Mana Igniting Cord
                { id = 18861 }, -- Flamewaker Legplates
                { id = 19144 }, -- Sabatons of the Flamewalker
                { id = 18824 }, -- Magma Tempered Boots
                {},
                { id = 18821 }, -- Quick Strike Ring
                { id = 17110 }, -- Seal of the Archmagus
                { id = 18820 }, -- Talisman of Ephemeral Power
                {},
                { id = 19142 }, -- Fire Runed Grimoire
                { id = 18822, dropRate = 8 }, -- Obsidian Edged Blade
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Golemagg",
            prefix = "7)",
            name = BB["Golemagg the Incinerator"],
            defaults = { dropRate = 2 },
            loot = {
                { id = 16815, dropRate = 25, container = { 47200 } }, -- Robes of Prophecy
                { id = 16798, dropRate = 25, container = { 47080 } }, -- Arcanist Robes
                { id = 16809, dropRate = 25, container = { 47278 } }, -- Felheart Robes
                { id = 16820, dropRate = 25 }, -- Nightslayer Chestpiece
                { id = 16833, dropRate = 20, container = { 47332, 47340 } }, -- Cenarion Vestments
                { id = 16845, dropRate = 20 }, -- Giantstalker's Breastplate
                { id = 16841, dropRate = 20, container = { 47122, 47130 } }, -- Earthfury Chestpiece
                { id = 16853, dropRate = 20, container = { 47002, 47010 } }, -- Lawbringer Breastplate
                { id = 16865, dropRate = 20, container = { 47242 } }, -- Breastplate of Might
                {},
                { id = 17203, dropRate = 80, disc = L["Reagent"], container = { 17182 } }, -- Sulfuron Ingot
                { id = 18829 }, -- Deep Earth Spaulders
                { id = 18823 }, -- Aged Core Leather Gloves
                { id = 19143 }, -- Flameguard Gauntlets
                { id = 19136 }, -- Mana Igniting Cord
                { id = 18861 }, -- Flamewaker Legplates
                { id = 19144 }, -- Sabatons of the Flamewalker
                { id = 18824 }, -- Magma Tempered Boots
                { id = 18821 }, -- Quick Strike Ring
                { id = 18820 }, -- Talisman of Ephemeral Power
                {},
                { id = 19142 }, -- Fire Runed Grimoire
                { id = 17072, dropRate = 25 }, -- Blastershot Launcher
                { id = 17103, dropRate = 25 }, -- Azuresong Mageblade
                { id = 18822, dropRate = 2 }, -- Obsidian Edged Blade
                { id = 18842, dropRate = 25 }, -- Staff of Dominance
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Sulfuron",
            prefix = "8)",
            name = BB["Sulfuron Harbinger"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 16816, dropRate = 33, container = { 47199 } }, -- Mantle of Prophecy
                { id = 16823, dropRate = 30 }, -- Nightslayer Shoulder Pads
                { id = 16848, dropRate = 33 }, -- Giantstalker's Epaulets
                { id = 16868, dropRate = 30, container = { 47241 } }, -- Pauldrons of Might
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 18870 }, -- Helm of the Lifegiver
                { id = 19145 }, -- Robe of Volatile Power
                { id = 19146 }, -- Wristguards of Stability
                { id = 18872 }, -- Manastorm Leggings
                { id = 18875 }, -- Salamander Scale Pants
                { id = 18861 }, -- Flamewaker Legplates
                {},
                { id = 18879 }, -- Heavy Dark Iron Ring
                { id = 19147 }, -- Ring of Spell Power
                {},
                { id = 17077 }, -- Crimson Shocker
                { id = 18878 }, -- Sorcerous Dagger
                { id = 17074, dropRate = 3, container = { 17223 } }, -- Shadowstrike
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Majordomo",
            prefix = "9)",
            name = BB["Majordomo Executus"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 19139 }, -- Fireguard Shoulders
                { id = 18810 }, -- Wild Growth Spaulders
                { id = 18811 }, -- Fireproof Cloak
                { id = 18808 }, -- Gloves of the Hypnotic Flame
                { id = 18809 }, -- Sash of Whispered Secrets
                { id = 18812 }, -- Wristguards of True Flight
                { id = 18806 }, -- Core Forged Greaves
                {},
                { id = 19140 }, -- Cauterizing Band
                {},
                { id = 18805 }, -- Core Hound Tooth
                { id = 18803 }, -- Finkle's Lava Dredger
                {},
                {},
                {},
                { id = 18703, dropRate = 50, container = { 18714, 18713, 18715 } }, -- Ancient Petrified Leaf
                {},
                { id = 18646, dropRate = 50, container = { 18608, 18609 } }, -- The Eye of Divinity
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Basalthar",
            prefix = "10)",
            name = BB["Basalthar"],--65020
            defaults = { dropRate = 11 },
            loot = {
                { id = 58210, dropRate = 17 }, -- Grasps of Sundering Power
                { id = 58212, dropRate = 17 }, -- Treads of Scalding Rage
                { id = 58215, dropRate = 17 }, -- Ash-Forged Greaves
                { id = 58237, dropRate = 17 }, -- Emberwoven Binding Garments
                { id = 58238, dropRate = 17 }, -- Runed Wardstone
                { id = 58242, dropRate = 17 }, -- Sulfuron Aegis
                {},
                { id = 18820 }, -- Talisman of Ephemeral Power
                { id = 18821 }, -- Quick Strike Ring
                { id = 18822 }, -- Obsidian Edged Blade
                { id = 18823 }, -- Aged Core Leather Gloves
                { id = 18824 }, -- Magma Tempered Boots
                { id = 18829 }, -- Deep Earth Spaulders
                { id = 18861 }, -- Flamewaker Legplates
                { id = 19136 }, -- Mana Igniting Cord
                { id = 19142 }, -- Fire Runed Grimoire
                { id = 19143 }, -- Flameguard Gauntlets
                { id = 19144 }, -- Sabatons of the Flamewalker
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "Smoldaris",
            name = BB["Smoldaris"],--65021
            defaults = { dropRate = 25 },
            loot = {
                { id = 58211 }, -- Molten Emberstone
                { id = 58213 }, -- Smoldaris’ Fractured Eye
                { id = 58239 }, -- Overheated Skyrazors
                { id = 58241 }, -- Totem of Eruption
                {},
                { id = 58246, dropRate = 100 }, -- Tablet of Molten Blast VI
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
                {},
                unpack(mCShareloot),
            }
        },
        {
            id = "SorcererThaneThaurissan",
            prefix = "11)",
            name = BB["Sorcerer-Thane Thaurissan"],--57642
            defaults = { dropRate = 11 },
            loot = {
                { id = 58210, dropRate = 17 }, -- Grasps of Sundering Power
                { id = 58212, dropRate = 17 }, -- Treads of Scalding Rage
                { id = 58215, dropRate = 17 }, -- Ash-Forged Greaves
                { id = 58237, dropRate = 17 }, -- Emberwoven Binding Garments
                { id = 58238, dropRate = 17 }, -- Runed Wardstone
                { id = 58242, dropRate = 17 }, -- Sulfuron Aegis
                {},
                { id = 18820 }, -- Talisman of Ephemeral Power
                { id = 18821 }, -- Quick Strike Ring
                { id = 18822 }, -- Obsidian Edged Blade
                { id = 18823 }, -- Aged Core Leather Gloves
                { id = 18824 }, -- Magma Tempered Boots
                { id = 18829 }, -- Deep Earth Spaulders
                { id = 18861 }, -- Flamewaker Legplates
                { id = 19136 }, -- Mana Igniting Cord
                { id = 19142 }, -- Fire Runed Grimoire
                { id = 19143 }, -- Flameguard Gauntlets
                { id = 19144 }, -- Sabatons of the Flamewalker
                {},
                { id = 58214, dropRate = 25 }, -- Modrag'zan, Heart of the Mountain
                { id = 58240, dropRate = 25 }, -- Libram of Final Judgement
                { id = 58243, dropRate = 25 }, -- Leggings of the Deep Delve
                { id = 58244, dropRate = 25 }, -- Sigil of Ancient Accord
                {},
                { id = 41989, dropRate = 100, container = { 41990 } }, -- Signet of Thaurissan
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
                {},
                unpack(mCShareloot),
            }
        },
        {
            id = "Ragnaros",
            prefix = "12)",
            name = BB["Ragnaros"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16922, dropRate = 13, container = { 47212 } }, -- Leggings of Transcendence
                { id = 16915, dropRate = 13, container = { 47092 } }, -- Netherwind Pants
                { id = 16930, dropRate = 13, container = { 47290 } }, -- Nemesis Pants
                { id = 16909, dropRate = 13 }, -- Bloodfang Pants
                { id = 16901, dropRate = 13, container = { 47352, 47360 } }, -- Stormrage Legguards
                { id = 16938, dropRate = 13 }, -- Dragonstalker's Legguards
                { id = 16946, dropRate = 13, container = { 47142, 47150 } }, -- Legplates of Ten Storms
                { id = 16954, dropRate = 13, container = { 47022, 47030 } }, -- Judgement Legplates
                { id = 16962, dropRate = 13, container = { 47254 } }, -- Legplates of Wrath
                {},
                { id = 18817 }, -- Crown of Destruction
                { id = 18814 }, -- Choker of the Fire Lord
                { id = 17102 }, -- Cloak of the Shrouded Mists
                { id = 17107 }, -- Dragon's Blood Cape
                { id = 19137 }, -- Onslaught Girdle
                { id = 17063 }, -- Band of Accuria
                { id = 18815, dropRate = 8 }, -- Essence of the Pure Flame
                { id = 17082, dropRate = 8 }, -- Shard of the Flame
                { id = 17106 }, -- Malistar's Defender
                { id = 18816 }, -- Perdition's Blade
                { id = 17104, dropRate = 8 }, -- Spinal Reaper
                { id = 17076, dropRate = 8 }, -- Bonereaver's Edge
                {},
                { id = 19138, container = { 58088 } }, -- Band of Sulfuras
                {},
                { id = 17204, dropRate = 6, disc = L["Reagent"], container = { 17182 } }, -- Eye of Sulfuras
                { id = 19017, dropRate = 20, container = { 19019 } }, -- Essence of the Firelord
                {},
                { id = 70171, dropRate = 100, container = { 56060 } }, -- Plans: Crown of Molten Ascension
                { id = 92080, dropRate = 1 }, -- Molten Corehound
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        {
            id = "MCTrash",
            name = L["Trash Mobs"].."-"..BZ["Molten Core"],
            defaults = { dropRate = .3 },
            loot = {
                { id = 16817, container = { 47203 } }, -- Girdle of Prophecy
                { id = 16802, container = { 47083 } }, -- Arcanist Belt
                { id = 16806, container = { 47281 } }, -- Felheart Belt
                { id = 16827 }, -- Nightslayer Belt
                { id = 16828, container = { 47335, 47343 } }, -- Cenarion Belt
                { id = 16851 }, -- Giantstalker's Belt
                { id = 16838, container = { 47125, 47133 } }, -- Earthfury Belt
                { id = 16858, container = { 47005, 47013 } }, -- Lawbringer Belt
                { id = 16864, container = { 47245 } }, -- Belt of Might
                {},
                { id = 17011, disc = L["Reagent"], dropRate = 15 }, -- Lava Core
                { id = 17010, disc = L["Reagent"], dropRate = 35 }, -- Fiery Core
                { id = 11382, disc = L["Reagent"]..", "..L["Molten Destroyer"], dropRate = 7 }, -- Blood of the Mountain
                { id = 17012, disc = L["Reagent"], dropRate = 100 }, -- Core Leather
                { id = 70101, dropRate = .56, container = { 56032 } }, -- Plans: Ruby Ring of Ruin
                { id = 16819, container = { 47201 } }, -- Vambraces of Prophecy
                { id = 16799, container = { 47081 } }, -- Arcanist Bindings
                { id = 16804, container = { 47279 } }, -- Felheart Bracers
                { id = 16825 }, -- Nightslayer Bracelets
                { id = 16830, container = { 47333, 47341 } }, -- Cenarion Bracers
                { id = 16850 }, -- Giantstalker's Bracers
                { id = 16840, container = { 47123, 47131 } }, -- Earthfury Bracers
                { id = 16857, container = { 47003, 47011 } }, -- Lawbringer Bracers
                { id = 16861, container = { 47243 } }, -- Bracers of Might
                { id = 81260, dropRate = .2 }, -- Lavashard Axe
                { id = 81261, dropRate = .2 }, -- Boots of Blistering Flames
                { id = 81262, dropRate = .2 }, -- Core Forged Helmet
                { id = 81263, dropRate = .2 }, -- Lost Dark Iron Chain
                { id = 81264, dropRate = .2 }, -- Shoulderpads of True Flight
                { id = 81265, dropRate = .2 }, -- Ashskin Belt
                { id = 20951, dropRate = 1, container = { 18253 } }, -- Narain's Scrying Goggles
            }
        },
        { name = L["Tier 1 Sets"], items = "AtlasTWLootT1SetMenu" },
        { name = L["Tier 2 Sets"], items = "AtlasTWLootT2SetMenu" },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
