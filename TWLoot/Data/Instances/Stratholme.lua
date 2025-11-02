---
--- Stratholme.lua - Stratholme dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Stratholme
--- 5-player dungeon instance. It includes both Living and Undead sides with
--- all boss encounters, rare drops, and dungeon set items.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Dungeon set items (Tier 0.5)
--- • Rare and epic weapon drops
--- • Side-specific loot organization
--- • Key and attunement items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.Stratholme = {
    Name = BZ["Stratholme"],
    Location = BZ["Eastern Plaguelands"],
    Level = { 45, 60 },
    Acronym = "Strat",
    MaxPlayers = 10,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Front"] },
        { letter = "B) " .. L["Side"] }
    },
    Reputation = {
        { name = BF["Argent Dawn"], loot = "ArgentDawn" }
    },
    Keys = {
        { name = L["The Scarlet Key"], loot = "VanillaKeys", info = L["Living Side"] },
        { name = L["Key to the City"], loot = "VanillaKeys", info = L["Undead Side"] },
        { name = L["Brazier of Invocation"], loot = "VanillaKeys", info = L["Tier 0.5 Summon"] },
    },
    Bosses = {
        {
            id = "STRATSkull",
            prefix = "1)",
            name = BB["Skul"],
            postfix = L["Rare"]..", "..L["Varies"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 13394 }, -- Skul's Cold Embrace
                { id = 13395 }, -- Skul's Fingerbone Claws
                {},
                { id = 13396 }, -- Skul's Ghastly Touch
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
            }
        },
        {
            id = "STRATStratholmeCourier",
            name = L["Stratholme Courier"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 13302 }, -- Market Row Postbox Key
                { id = 13303 }, -- Crusaders' Square Postbox Key
                { id = 13304 }, -- Festival Lane Postbox Key
                { id = 13305 }, -- Elders' Square Postbox Key
                { id = 13306 }, -- King's Square Postbox Key
                { id = 13307 }, -- Fras Siabi's Postbox Key
            }
        },
        {
            id = "STRATFrasSiabi",
            name = L["Fras Siabi"],
            loot = {
                { id = 13171, dropRate = 100 }, -- Smokey's Lighter
            }
        },
        {
            id = "STRATAtiesh",
            prefix = "2)",
            name = BB["Rethilgore"],
            postfix = L["Summon"],
            loot = {
                { id = 22736, dropRate = 100 }, -- Andonisus, Reaper of Souls
            }
        },
        {
            id = "STRATBalzaphon",
            name = BB["Balzaphon"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 23125 }, -- Chains of the Lich
                { id = 23126 }, -- Waistband of Balzaphon
                {},
                { id = 23124 }, -- Staff of Balzaphon
            }
        },
        {
            id = "STRATHearthsingerForresten",
            prefix = "3)",
            name = BB["Hearthsinger Forresten"],
            postfix = L["Rare"]..", "..L["Varies"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16682, disc = L["Mage"]..", T0", container = { 22064 } }, -- Magister's Boots
                {},
                { id = 13378 }, -- Songbird Blouse
                { id = 13384 }, -- Rainbow Girdle
                { id = 13383 }, -- Woollies of the Prancing Minstrel
                { id = 13379 }, -- Piccolo of the Flaming Fire
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 13174, quantity = { 1, 3 }, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
            }
        },
        {
            id = "STRATTheUnforgiven",
            prefix = "4)",
            name = BB["The Unforgiven"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16717, disc = L["Druid"]..", T0", container = { 22110 } }, -- Wildheart Gloves
                {},
                { id = 13404 }, -- Mask of the Unforgiven
                { id = 13405 }, -- Wailing Nightbane Pauldrons
                { id = 13409 }, -- Tearfall Bracers
                {},
                { id = 13408 }, -- Soul Breaker
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 13174, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            prefix = "5)",
            name = L["Elder Farwhisper"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            id = "STRATTimmytheCruel",
            prefix = "6)",
            name = BB["Timmy the Cruel"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16724, disc = L["Paladin"]..", T0", container = { 22090 } }, -- Lightforge Gauntlets
                {},
                { id = 13400 }, -- Vambraces of the Sadist
                { id = 13403 }, -- Grimgore Noose
                { id = 13402 }, -- Timmy's Galoshes
                { id = 13401 }, -- The Cruel Hand of Timmy
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 13174, quantity = { 2, 4 }, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATMalor",
            prefix = "7)",
            name = BB["Malor the Zealous"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 81016 }, -- Bleeding Heart Talisman
                { id = 81017 }, -- Girdle of Fading Hope
                { id = 81019 }, -- Gauntlets of Myrmidon
                { id = 81122 }, -- Bloodfallen Cloak
                { id = 81123 }, -- Crimson Defender's Leggings
                { id = 81124 }, -- Helmet of the Scarlet Avenger
                { id = 81131 }, -- Helmet of the Scarlet Avenger
                {},
                { id = 81018 }, -- Crimson Spellblade
                { id = 81125 }, -- Inquisitor's Orb
                {},
                { id = 83575, disc = L["Book"], dropRate = 10 }, -- Codex of Smite IX
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATMalorsStrongbox",
            name = L["Malor's Strongbox"],
            loot = {
                { id = 12845, disc = L["Quest Item"], dropRate = 100 }, -- Medallion of Faith
            }
        },
        {
            id = "STRATCrimsonHammersmith",
            prefix = "8)",
            name = L["Crimson Hammersmith"],
            postfix = L["Summon"],
            loot = {
                { id = 18781, dropRate = 40, container = { 18770 } }, -- Bottom Half of Advanced Armorsmithing: Volume II
                { id = 12726, container = { 12619 } }, -- Plans: Enchanted Thorium Leggings
                {},
                { id = 13351, dropRate = 100, container = { 12824 } }, -- Crimson Hammersmith's Apron
                { id = 12824, container = { 12776 } }, -- Plans: Enchanted Battlehammer
                {},
                { id = 124, dropRate = 6, container = { 87 } }, -- Plans: Enchanted Thorium Belt Buckle
            }
        },
        {
            id = "STRATBSPlansSerenity",
            name = L["Blacksmithing Plans"],
            loot = {
                { id = 12827, dropRate = 32, container = { 12781 } }, -- Plans: Serenity
            }
        },
        {
            id = "STRATCannonMasterWilley",
            prefix = "9)",
            name = BB["Cannon Master Willey"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 16708, disc = L["Rogue"]..", T0", container = { 22008 } }, -- Shadowcraft Spaulders
                {},
                { id = 22407 }, -- Helm of the New Moon
                { id = 22403 }, -- Diana's Pearl Necklace
                { id = 22405 }, -- Mantle of the Scarlet Crusade
                { id = 18721 }, -- Barrage Girdle
                { id = 13381 }, -- Master Cannoneer Boots
                { id = 13382 }, -- Cannonball Runner
                {},
                { id = 13380 }, -- Willey's Portable Howitzer
                { id = 22404 }, -- Willey's Back Scratcher
                { id = 22406 }, -- Redemption
                {},
                { id = 13377, dropRate = 100 }, -- Miniature Cannon Balls
                {},
                { id = 12839, dropRate = 6, container = { 12783 } }, -- Plans: Heartseeker
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 41985, quantity = 2, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATArchivistGalford",
            prefix = "10)",
            name = BB["Archivist Galford"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16692, disc = L["Priest"]..", T0", container = { 22081 } }, -- Devout Gloves
                {},
                { id = 13386 }, -- Archivist Cape
                { id = 13387 }, -- Foresight Girdle
                { id = 18716 }, -- Ash Covered Boots
                { id = 13385 }, -- Tome of Knowledge
                {},
                { id = 12811, disc = L["Trade Goods"], dropRate = 18 }, -- Righteous Orb
                {},
                { id = 22897, disc = L["Book"], dropRate = 14 }, -- Tome of Conjure Food VII
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATDathrohan",
            prefix = "11)",
            name = L["Grand Crusader Dathrohan"],
            color = "|cff9d9d9d",
        },
        {
            id = "STRATBalnazzar",
            name = BB["Balnazzar"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 16725, disc = L["Paladin"]..", T0", container = { 22087 } }, -- Lightforge Boots
                {},
                { id = 13359 }, -- Crown of Tyranny
                { id = 18718 }, -- Grand Crusader's Helm
                { id = 12103 }, -- Star of Mystaria
                { id = 18720 }, -- Shroud of the Nathrezim
                { id = 13358 }, -- Wyrmtongue Shoulders
                { id = 13369 }, -- Fire Striders
                {},--weapon
                { id = 13348 }, -- Demonshear
                { id = 18717 }, -- Hammer of the Grand Crusader
                { id = 13360 }, -- Gift of the Elven Magi
                {},
                {},
                { id = 13353, dropRate = 1.37 }, -- Book of the Dead
                { id = 83501, dropRate = 17, container = { 60288 } }, -- Plans: Rune-Etched Greaves
                { id = 83502, dropRate = 17, container = { 60289 } }, -- Plans: Rune-Etched Legplates
                { id = 83503, dropRate = 17, container = { 60290 } }, -- Plans: Rune-Etched Breastplate
                { id = 83504, dropRate = 17, container = { 60291 } }, -- Plans: Rune-Etched Crown
                { id = 83505, dropRate = 17, container = { 60292 } }, -- Plans: Rune-Etched Mantle
                { id = 83506, dropRate = 17, container = { 60287 } }, -- Plans: Rune-Etched Grips
                { id = 83500, dropRate = 5, container = { 60293 } }, -- Plans: Untempered Runeblade
                { id = 14512, dropRate = 6, container = { 14154 } }, -- Pattern: Truefaith Vestments
                { id = 13520, dropRate = 3, container = { 13511 } }, -- Recipe: Flask of Distilled Wisdom
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 13250 }, -- Head of Balnazzar
                {},
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                        70234, 70235, 70236, 70238 } },
                { id = 41985, quantity = 3, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
            }
        },
        {
            id = "STRATSothosJarien",
            name = BB["Sothos"].." & "..BB["Jarien"],
            postfix = L["Summon"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 22327 }, -- Amulet of the Redeemed
                { id = 22301 }, -- Ironweave Robe
                { id = 22328 }, -- Legplates of Vigilance
                {},
                { id = 22334 }, -- Band of Mending
                {},
                { id = 22329 }, -- Scepter of Interminable Focus
            }
        },
        {
            id = "STRATMagistrateBarthilas",
            prefix = "12)",
            name = BB["Magistrate Barthilas"],
            postfix = L["Varies"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 18727 }, -- Crimson Felt Hat
                { id = 13376 }, -- Royal Tribunal Cloak
                { id = 18726 }, -- Magistrate's Cuffs
                { id = 18722 }, -- Death Grips
                {},
                { id = 23198 }, -- Idol of Brutality
                {},
                { id = 18725 }, -- Peacemaker
                {},
                { id = 12382, disc = L["Key"], dropRate = 100 }, -- Key to the City
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 13174, quantity = { 2, 4 }, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            prefix = "13)",
            name = L["Aurius"],
            color = "|cff9d9d9d",
        },
        {
            id = "STRATStonespine",
            prefix = "14)",
            name = BB["Stonespine"],
            postfix = L["Rare"] ..", ".. L["Wanders"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 13397 }, -- Stoneskin Gargoyle Cape
                { id = 13954 }, -- Verdant Footpads
                {},
                { id = 13399 }, -- Gargoyle Shredder Talons
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
            }
        },
        {
            id = "STRATBaronessAnastari",
            prefix = "15)",
            name = BB["Baroness Anastari"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16704, disc = L["Warlock"]..", T0", container = { 22076 } }, -- Dreadmist Sandals
                {},
                { id = 18728 }, -- Anastari Heirloom
                { id = 18730 }, -- Shadowy Laced Handwraps
                { id = 18729 }, -- Screeching Bow
                { id = 13534 }, -- Banshee Finger
                {},
                { id = 13538 }, -- Windshrieker Pauldrons
                { id = 13535 }, -- Coldtouch Phantom Wraps
                { id = 13537 }, -- Chillhide Bracers
                { id = 13539 }, -- Banshee's Touch
                { id = 13514 }, -- Wail of the Banshee
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 13174, quantity = { 1, 3 }, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATBlackGuardSwordsmith",
            name = L["Black Guard Swordsmith"],
            postfix = L["Summon"],
            loot = {
                { id = 18783, dropRate = 40, container = { 18771 } }, -- Bottom Half of Advanced Armorsmithing: Volume III
                { id = 12725, container = { 12620 } }, -- Plans: Enchanted Thorium Helm
                {},
                { id = 13350, dropRate = 100, container = { 12825 } }, -- Insignia of the Black Guard
                { id = 12825, container = { 12777 } }, -- Plans: Blazing Rapier
            }
        },
        {
            id = "STRATBSPlansCorruption",
            name = L["Blacksmithing Plans"],
            loot = {
                { id = 12830, dropRate = .02, container = { 12782 } }, -- Plans: Corruption
            }
        },
        {
            id = "STRATNerubenkan",
            prefix = "16)",
            name = BB["Nerub'enkan"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16675, disc = L["Hunter"]..", T0", container = { 22061 } }, -- Beaststalker's Boots
                {},
                { id = 18740 }, -- Thuzadin Sash
                { id = 18739 }, -- Chitinous Plate Legguards
                {},
                { id = 18738 }, -- Carapace Spine Crossbow
                { id = 13529 }, -- Husk of Nerub'enkan
                {},
                { id = 13533 }, -- Acid-etched Pauldrons
                { id = 13532 }, -- Darkspinner Claws
                { id = 13531 }, -- Crypt Stalker Leggings
                { id = 13530 }, -- Fangdrip Runners
                { id = 13508 }, -- Eye of Arachnida
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 13174, quantity = { 2, 4 }, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text

                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATMalekithePallid",
            prefix = "17)",
            name = BB["Maleki the Pallid"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16691, disc = L["Priest"]..", T0", container = { 22084 } }, -- Devout Sandals
                {},
                { id = 18734 }, -- Pale Moon Cloak
                { id = 18735 }, -- Maleki's Footwraps
                { id = 13524 }, -- Skull of Burning Shadows
                {},
                { id = 18737 }, -- Bone Slicing Hatchet
                {},
                { id = 13528 }, -- Twilight Void Bracers
                { id = 13525 }, -- Darkbind Fingers
                { id = 13526 }, -- Flamescarred Girdle
                { id = 13527 }, -- Lavawalker Greaves
                { id = 13509 }, -- Clutch of Foresight
                {},
                { id = 12833, dropRate = 6, container = { 12796 } }, -- Plans: Hammer of the Titans
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATRamsteintheGorger",
            prefix = "18)",
            name = BB["Ramstein the Gorger"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 16737, disc = L["Warrior"]..", T0", container = { 21998 } }, -- Gauntlets of Valor
                {},
                { id = 18723 }, -- Animated Chain Necklace
                { id = 13374 }, -- Soulstealer Mantle
                { id = 13373 }, -- Band of Flesh
                { id = 13515 }, -- Ramstein's Lightning Bolts
                {},
                { id = 13375 }, -- Crest of Retribution
                { id = 13372 }, -- Slavedriver's Cane
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 15880, dropRate = 100, container = { 18022, 17001 } }, -- Head of Ramstein the Gorger
                { id = 13174, quantity = { 1, 4 }, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                { id = 41985, quantity = 2, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "STRATBaronRivendare",
            prefix = "19)",
            name = BB["Baron Rivendare"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 13335, dropRate = 0.02 }, -- Rivendare's Deathcharger
                { id = 13505, dropRate = 1 }, -- Runeblade of Baron Rivendare
                {},
                { id = 22411, dropRate = 20 }, -- Helm of the Executioner
                { id = 22412, dropRate = 20 }, -- Thuzadin Mantle
                { id = 13340, dropRate = 14 }, -- Cape of the Black Baron
                { id = 13346, dropRate = 14 }, -- Robes of the Exalted
                { id = 22409, dropRate = 20 }, -- Tunic of the Crescent Moon
                { id = 13344, dropRate = 14 }, -- Dracorian Gauntlets
                { id = 22410, dropRate = 20 }, -- Gauntlets of Deftness
                { id = 13345, dropRate = 14 }, -- Seal of Rivendare
                { id = 22408, dropRate = 20 }, -- Ritssyn's Wand of Bad Mojo
                { id = 13349, dropRate = 14 }, -- Scepter of the Unholy
                { id = 13368, dropRate = 14 }, -- Bonescraper
                { id = 13361, dropRate = 14 }, -- Skullforge Reaver
                { id = 16694, disc = L["Priest"]..", T0", container = { 22085 } }, -- Devout Skirt
                { id = 16687, disc = L["Mage"]..", T0", container = { 22067 } }, -- Magister's Leggings
                { id = 16699, disc = L["Warlock"]..", T0", container = { 22072 } }, -- Dreadmist Leggings
                { id = 16709, disc = L["Rogue"]..", T0", container = { 22007 } }, -- Shadowcraft Pants
                { id = 16719, disc = L["Druid"]..", T0", container = { 22111 } }, -- Wildheart Kilt
                { id = 16678, disc = L["Hunter"]..", T0", container = { 22017 } }, -- Beaststalker's Pants
                { id = 16668, disc = L["Shaman"]..", T0", container = { 22100 } }, -- Kilt of Elements
                { id = 16728, disc = L["Paladin"]..", T0", container = { 22092 } }, -- Lightforge Legplates
                { id = 16732, disc = L["Warrior"]..", T0", container = { 22000 } }, -- Legplates of Valor
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                        70234, 70235, 70236, 70238 } },
                { id = 13251, dropRate = 100, container = { 13246, 13243, 13249 } }, -- Head of Baron Rivendare
                { id = 13174, quantity = { 4, 6 }, dropRate = 80, container = { 13209, 19812 } }, -- Plagued Flesh Sample
                { id = 41985, quantity = 3, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
            }
        },
        { name = L["Ysida Harmon"], color = "|cff9d9d9d" },
        { prefix = "1')", name = L["Crusaders' Square Postbox"], color = "|cff00FF00" },
        { prefix = "2')", name = L["Market Row Postbox"], color = "|cff00FF00" },
        { prefix = "3')", name = L["Festival Lane Postbox"], color = "|cff00FF00" },
        { prefix = "4')", name = L["Elders' Square Postbox"], color = "|cff00FF00" },
        { prefix = "5')", name = L["King's Square Postbox"], color = "|cff00FF00" },
        { prefix = "6')", name = L["Fras Siabi's Postbox"], color = "|cff00FF00" },
        {
            id = "STRATPostmaster",
            name = L["Third Postbox Opened"].. ": " .. BB["Postmaster Malown"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 13390 }, -- The Postmaster's Band
                { id = 13388 }, -- The Postmaster's Tunic
                { id = 13389 }, -- The Postmaster's Trousers
                { id = 13391 }, -- The Postmaster's Treads
                { id = 13392 }, -- The Postmaster's Seal
                {},
                { id = 13393 }, -- Malown's Slam
            },
        },
        {
            id = "STRATTrash",
            name = L["Trash Mobs"].."-"..BZ["Stratholme"],
            defaults = { dropRate = 2 },
            loot = {
                { id = 16697, disc = L["Priest"]..", T0", container = { 22079 } }, -- Devout Bracers
                { id = 16685, disc = L["Mage"]..", T0", container = { 22062 } }, -- Magister's Belt
                { id = 16702, disc = L["Warlock"]..", T0", dropRate = 1, container = { 22070 } }, -- Dreadmist Belt
                { id = 16710, disc = L["Rogue"]..", T0", container = { 22004 } }, -- Shadowcraft Bracers
                { id = 16714, disc = L["Druid"]..", T0", dropRate = 1.7, container = { 22108 } }, -- Wildheart Bracers
                { id = 16681, disc = L["Hunter"]..", T0", dropRate = 1.7, container = { 22011 } }, -- Beaststalker's Bindings
                { id = 16671, disc = L["Shaman"]..", T0", container = { 22095 } }, -- Bindings of Elements
                { id = 16723, disc = L["Paladin"]..", T0", dropRate = 1, container = { 22086 } }, -- Lightforge Belt
                { id = 16736, disc = L["Warrior"]..", T0", container = { 21994 } }, -- Belt of Valor
                {},
                { id = 12811, disc = L["Reagent"], dropRate = 5 }, -- Righteous Orb
                { id = 12735, dropRate = 15 }, -- Frayed Abomination Stitching
                { id = 12843 }, -- Corruptor's Scourgestone
                { id = 12841 }, -- Invader's Scourgestone
                { id = 12840 }, -- Minion's Scourgestone
                { id = 70163, dropRate = 3, container = { 56016 } }, -- Plans: Arcane Emerald Gemstone
                { id = 18742, dropRate = .02 }, -- Stratholme Militia Shoulderguard
                { id = 18743, dropRate = .1 }, -- Gracious Cape
                { id = 17061, dropRate = .02 }, -- Juno's Shadow
                { id = 18741, dropRate = .02 }, -- Morlune's Bracer
                { id = 18744, dropRate = .02 }, -- Plaguebat Fur Gloves
                { id = 18745, dropRate = .02 }, -- Sacred Cloth Leggings
                { id = 18736, dropRate = .02 }, -- Plaguehound Leggings
                { id = 12827, dropRate = .1, container = { 12781 } }, -- Plans: Serenity
                { id = 16249 }, -- Formula: Enchant 2H Weapon - Major Intellect
                { id = 16248, dropRate = .88 }, -- Formula: Enchant Weapon - Unholy
                { id = 14495, container = { 14144 } }, -- Pattern: Ghostweave Pants
                { id = 15777, container = { 15096 }, dropRate = .99 }, -- Pattern: Runic Leather Shoulders
                { id = 15768, container = { 15088 } }, -- Pattern: Wicked Leather Belt
                { id = 18658, container = { 18639 }, dropRate = 4 }, -- Schematic: Ultra-Flash Shadow Reflector
                { id = 16052, container = { 16009 }, dropRate = 5 }, -- Schematic: Voice Amplification Modulator
                { id = 56026, container = { 55259 }, dropRate = .08 }, -- Plans: Sapphire Luminescence
            }
        },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
        { name = BIS["The Postmaster"], items = "Strat" },
        { name = L["Tier 0/0.5 Sets"], items = "AtlasTWLootT0SetMenu" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.Stratholme.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end
