---
--- BlackrockDepths.lua - Blackrock Depths dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Blackrock Depths
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Rare and epic item drops
--- • Dungeon entrance and layout data
--- • Level-appropriate loot organization
--- • Quest reward items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.BlackrockDepths = {
    Name = BZ["Blackrock Depths"],
    Location = BZ["Blackrock Mountain"],
    Level = { 42, 60 },
    Acronym = "BRD",
    MaxPlayers = 10,
    Keys = {
        { name = L["Shadowforge Key"], loot = "VanillaKeys" },
        { name = L["Prison Cell Key"], loot = "VanillaKeys" },
        { name = L["Banner of Provocation"], loot = "VanillaKeys", info = L["Tier 0.5 Summon"] },
    },
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Bosses = {
        {
            id = "BRDLordRoccor",
            prefix = "1)",
            name = L["Lord Roccor"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 22234 }, -- Mantle of Lost Hope
                { id = 11632 }, -- Earthslag Shoulders
                { id = 11631 }, -- Stoneshell Guard
                { id = 22397 }, -- Idol of Ferocity
                {},
                { id = 11630, dropRate = 16 }, -- Rockshard Pellets
                {},
                { id = 11813, dropRate = 15, container = { 11811 } }, -- Formula: Smoking Heart of the Mountain
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 11129, quantity = { 2, 3 }, dropRate = 80, container = { 12038 } }, -- Essence of the Elements
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            prefix = "2)",
            name = L["Kharan Mighthammer"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "3)",
            name = L["Commander Gor'shak"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "3)",
            name = L["Marshal Windsor"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDHighInterrogatorGerstahn",
            prefix = "5)",
            name = L["High Interrogator Gerstahn"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11626 }, -- Blackveil Cape
                { id = 11624 }, -- Kentic Amice
                { id = 22240 }, -- Greaves of Withering Despair
                { id = 11625 }, -- Enthralled Sphere
                {},
                { id = 11140, disc = L["Key"], dropRate = 100 }, -- Prison Cell Key
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            prefix = "6)",
            name = L["Ring of Law"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDAnubshiah",
            name = L["Anub'shiah"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 11678, dropRate = 15 }, -- Carapace of Anub'shiah
                {},
                { id = 11677 }, -- Graverot Cape
                { id = 11675 }, -- Shadefiend Boots
                { id = 11731 }, -- Savage Gladiator Greaves
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDEviscerator",
            name = L["Eviscerator"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11685 }, -- Splinthide Shoulders
                { id = 11679 }, -- Rubicund Armguards
                { id = 11730 }, -- Savage Gladiator Grips
                { id = 11686 }, -- Girdle of Beastial Fury
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDGorosh",
            name = L["Gorosh the Dervish"],
            loot = {
                { id = 11726, dropRate = 15 }, -- Savage Gladiator Chain
                { id = 22271, dropRate = 30 }, -- Leggings of Frenzied Magic
                { id = 22257, dropRate = 30 }, -- Bloodclot Band
                { id = 22266, dropRate = 25 }, -- Flarethorn
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDGrizzle",
            name = L["Grizzle"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11722 }, -- Dregmetal Spaulders
                { id = 11703 }, -- Stonewall Girdle
                { id = 22270 }, -- Entrenching Boots
                { id = 11702 }, -- Grizzle's Skinner
                {},
                { id = 11610, dropRate = 100, container = { 11608 } }, -- Plans: Dark Iron Pulverizer
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDHedrum",
            name = L["Hedrum the Creeper"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11729 }, -- Savage Gladiator Helm
                { id = 11633 }, -- Spiderfang Carapace
                { id = 11634 }, -- Silkweb Gloves
                { id = 11635 }, -- Hookfang Shanker
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDOkthor",
            name = L["Ok'thor the Breaker"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11665 }, -- Ogreseer Fists
                { id = 11662 }, -- Ban'thok Sash
                { id = 11728 }, -- Savage Gladiator Leggings
                { id = 11824 }, -- Cyclopean Band
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDTheldren",
            name = L["Theldren"],
            postfix = L["Summon"],
            loot = {
                { id = 22305, dropRate = 38 }, -- Ironweave Mantle
                { id = 22330, dropRate = 19 }, -- Shroud of Arcane Mastery
                { id = 22318, dropRate = 26 }, -- Malgen's Long Bow
                { id = 22317, dropRate = 17 }, -- Lefty's Brass Knuckle
                {},
                { id = 22047, dropRate = 17, container = { 22057 } }, -- Top Piece of Lord Valthalak's Amulet
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            name = L["Lefty"],
            postfix = BC["Rogue"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Malgen Longspear"],
            postfix = BC["Hunter"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Gnashjaw"],
            postfix = L["Pet"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Korv"],
            postfix = BC["Shaman"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Rezznik"],
            postfix = L["Engineer"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Rotfang"],
            postfix = BC["Rogue"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Snokh Blackspine"],
            postfix = BC["Mage"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Va'jashni"],
            postfix = BC["Priest"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Volida"],
            postfix = BC["Mage"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDHoundmaster",
            name = L["Houndmaster Grebmar"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11623 }, -- Spritecaster Cape
                { id = 11627 }, -- Fleetfoot Greaves
                { id = 11628 }, -- Houndmaster's Bow
                { id = 11629 }, -- Houndmaster's Rifle
                {},
                { id = 41455, dropRate = 100 }, -- Blackrock Powder
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            name = L["Elder Morndeep"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            name = L["High Justice Grimstone"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDForgewright",
            prefix = "7)",
            name = L["Monument of Franclorn Forgewright"],
            loot = {
                { id = 11000, disc = L["Key"] }, -- Shadowforge Key
            }
        },
        {
            id = "BRDPyromancerLoregrain",
            name = L["Pyromancer Loregrain"],
            postfix = L["Rare"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11747 }, -- Flamestrider Robes
                { id = 11749 }, -- Searingscale Leggings
                { id = 11748 }, -- Pyric Caduceus
                { id = 11750 }, -- Kindling Stave
                {},
                { id = 11207, dropRate = 16 }, -- Formula: Enchant Weapon - Fiery Weapon
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
            }
        },
        {
            id = "BRDTheVault",
            prefix = "8)",
            name = L["The Vault"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11197, disc = L["Key"], dropRate = 100 }, -- Dark Keeper Key
                {},
                {},
                { id = 22256 }, -- Mana Shaping Handwraps
                { id = 22205 }, -- Black Steel Bindings
                { id = 22255 }, -- Magma Forged Band
                { id = 22254 }, -- Wand of Eternal Light
                {},
                { id = 11945, dropRate = .5 }, -- Dark Iron Ring
                { id = 11946, dropRate = .4 }, -- Fire Opal Necklace
                {},
                { id = 11752, disc = L["Quest Item"], dropRate = 100, container = { 11644 } }, -- Black Blood of the Tormented
                { id = 11751, disc = L["Quest Item"], dropRate = 100, container = { 11622 } }, -- Burning Essence
                { id = 11753, disc = L["Quest Item"], dropRate = 100, container = { 11643 } }, -- Eye of Kajal
            }
        },
        {
            id = "BRDWarderStilgiss",
            name = L["Warder Stilgiss"],
            postfix = L["Rare"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11782 }, -- Boreal Mantle
                { id = 22241 }, -- Dark Warder's Pauldrons
                { id = 11783 }, -- Chillsteel Girdle
                { id = 11784 }, -- Arbiter's Blade
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
            }
        },
        {
            id = "BRDVerek",
            name = L["Verek"],
            postfix = L["Rare"],
            defaults = { dropRate = 12.5 },
            loot = {
                { id = 11755 }, -- Verek's Collar
                { id = 22242 }, -- Verek's Leash
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
            }
        },
        {
            name = BB["Watchman Doomgrip"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDFineousDarkvire",
            prefix = "9)",
            name = L["Fineous Darkvire"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11839 }, -- Chief Architect's Monocle
                { id = 22223 }, -- Foreman's Head Protector
                { id = 11842 }, -- Lead Surveyor's Mantle
                { id = 11841 }, -- Senior Designer's Pantaloons
                {},
                { id = 11840, dropRate = 5 }, -- Master Builder's Shirt
                {},
                { id = 56098, disc = L["Quest Item"], dropRate = 9, container = { 70175 } }, -- Bottom Half of Advanced Jewelcrafting XI: Hard as Diamonds
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 11468, quantity = { 3, 5 }, dropRate = 80, container = { 11883 } }, -- Dark Iron Fanny Pack
                { id = 10999, dropRate = 100, container = { 11000 } }, -- Ironfel
                { id = 41379, dropRate = 100, container = { 70223 } }, -- Dark Iron Prospecting Lens
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDLordIncendius",
            prefix = "10)",
            name = L["Lord Incendius"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11766 }, -- Flameweave Cuffs
                { id = 11764 }, -- Cinderhide Armsplints
                { id = 11765 }, -- Pyremail Wristguards
                { id = 11767 }, -- Emberplate Armguards
                {},
                { id = 19268, dropRate = 2, container = { 19289 } }, -- Ace of Elementals
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 11129, quantity = { 1, 3 }, dropRate = 80, container = { 12038 } }, -- Essence of the Elements
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 11126, dropRate = 100, container = { 12113, 12112, 12114, 12115 } }, -- Tablet of Kurniya
                { id = 21987, dropRate = 100, container = { 22057 } }, -- Incendicite of Incendius
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDBaelGar",
            prefix = "11)",
            name = L["Bael'Gar"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11807 }, -- Sash of the Burning Heart
                { id = 11802 }, -- Lavacrest Leggings
                { id = 11805 }, -- Rubidium Hammer
                { id = 11803 }, -- Force of Magma
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            prefix = "12)",
            name = L["Shadowforge Lock"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDGeneralAngerforge",
            prefix = "13)",
            name = L["General Angerforge"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 11820 }, -- Royal Decorated Armor
                { id = 11821 }, -- Warstrife Leggings
                { id = 11810 }, -- Force of Will
                { id = 11817 }, -- Lord General's Sword
                { id = 11816 }, -- Angerforge's Battle Axe
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 11468, quantity = { 3, 10 }, dropRate = 80, container = { 11883 } }, -- Dark Iron Fanny Pack
                { id = 11464, dropRate = 100, container = { 12061, 12062, 12065 } }, -- Marshal Windsor's Lost Information
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDGolemLordArgelmach",
            prefix = "14)",
            name = L["Golem Lord Argelmach"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11823 }, -- Luminary Kilt
                { id = 11822 }, -- Omnicast Boots
                { id = 11669 }, -- Naglering
                { id = 11819 }, -- Second Wind
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 11468, quantity = { 5, 8 }, dropRate = 80, container = { 11883 } }, -- Dark Iron Fanny Pack
                { id = 11465, dropRate = 100, container = { 12061, 12062, 12065 } }, -- Marshal Windsor's Lost Information
                { id = 11268, dropRate = 100, container = { 12108, 12109, 12110, 12111 } }, -- Head of Argelmach
                { id = 60671, dropRate = 100, container = { 60672 } }, -- Arcane Golem Core
                { id = 81281, dropRate = 100, container = { 81250, 81251, 81252, 81253 } }, -- Perfect Golem Core
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            name = L["Field Repair Bot 74A"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Blacksmithing Plans"].." ",
            color = "|cff9d9d9d",
        },
        {
            id = "BRDGuzzler",
            prefix = "15)",
            name = L["The Grim Guzzler"],
            color = "|cff9d9d9d"
        },
        {
            id = "BRDHurley",
            name = BB["Hurley Blackbreath"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11735 }, -- Ragefury Eyepatch
                { id = 18043 }, -- Coal Miner Boots
                { id = 22275 }, -- Firemoss Boots
                { id = 18044 }, -- Hurley's Tankard
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                {},
                { id = 11468, dropRate = 80, container = { 11883 } }, -- Dark Iron Fanny Pack
                { id = 11312, dropRate = 100, container = { 12000, 11964 } }, -- Lost Thunderbrew Recipe
                { id = 41477, dropRate = 100, container = { 41465 } }, -- Upper Half of the Thunderbrew Golden Lager Plans
            },
        },
        {
            id = "BRDLokhtos",
            name = L["Lokhtos Darkbargainer"],
            postfix = L["Vendor"],
            loot = {
                { id = 18592, disc = L["Quest"], container = { 17193 } }, -- Plans: Sulfuron Hammer
                { id = 70178, container = { 56067 } }, -- Plans: Dark Iron Signet Ring
                { id = 17051, container = { 17014 } }, -- Plans: Dark Iron Bracers
                { id = 17060, container = { 17016 } }, -- Plans: Dark Iron Destroyer
                { id = 17052, container = { 17013 } }, -- Plans: Dark Iron Leggings
                { id = 17059, container = { 17015 } }, -- Plans: Dark Iron Reaver
                { id = 17049, container = { 16989 } }, -- Plans: Fiery Chain Girdle
                { id = 17053, container = { 16988 } }, -- Plans: Fiery Chain Shoulders
                { id = 19209, container = { 19167 } }, -- Plans: Blackfury
                { id = 19211, container = { 19168 } }, -- Plans: Blackguard
                { id = 20040, container = { 20039 } }, -- Plans: Dark Iron Boots
                { id = 19207, container = { 19164 } }, -- Plans: Dark Iron Gauntlets
                { id = 19210, container = { 19170 } }, -- Plans: Ebon Hand
                { id = 19212, container = { 19169 } }, -- Plans: Nightfall
                { id = 62004, container = { 65039 } }, -- Plans: Fiery Chain Breastplate
                { id = 62005, container = { 65035 } }, -- Pattern: Flarecore Boots
                { id = 62007, container = { 65037 } }, -- Pattern: Molten Leggings
                { id = 62003, container = { 65038 } }, -- Pattern: Corehound Gloves
                { id = 62006, container = { 65036 } }, -- Pattern: Chromatic Leggings
            },
        },
        {
            name = L["Mistress Nagmara"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDPhalanx",
            name = BB["Phalanx"],
            loot = {
                { id = 22212, dropRate = 33 }, -- Golem Fitted Pauldrons
                { id = 11745, dropRate = 33 }, -- Fists of Phalanx
                {},
                { id = 11744, dropRate = 33 }, -- Bloodfist
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
            }
        },
        {
            id = "BRDPlugger",
            name = BB["Plugger Spazzring"],
            loot = {
                { id = 12793, dropRate = 18 }, -- Mixologist's Tunic
                { id = 12791, dropRate = 18 }, -- Barman Shanker
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 18653, dropRate = 18, container = { 18587 } }, -- Schematic: Goblin Jumper Cables XL
                {},
                { id = 13483, disc = L["Vendor"], container = { 7076 } }, -- Recipe: Transmute Fire to Earth
                { id = 15759, disc = L["Vendor"], container = { 15050 } }, -- Pattern: Black Dragonscale Breastplate
                {},
                { id = 11325, quantity = { 0, 10 }, disc = L["Vendor"] }, -- Dark Iron Ale Mug
                {},
                { id = 11602, dropRate = 100, disc = L["Pickpocketed"] }, -- Grim Guzzler Key
            },
        },
        {
            name = L["Private Rocknot"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDRibbly",
            name = BB["Ribbly Screwspigot"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 2662 }, -- Ribbly's Quiver
                { id = 2663 }, -- Ribbly's Bandolier
                {},
                { id = 11612, container = { 11604 } }, -- Plans: Dark Iron Plate
                {},
                { id = 11742, disc = L["Bag"] }, -- Wayfarer's Knapsack
                {},
                { id = 11313, container = { 11865, 11963, 12049 } }, -- Ribbly's Head
            }
        },
        {
            id = "BRDFlamelash",
            prefix = "16)",
            name = L["Ambassador Flamelash"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11808, dropRate = 2 }, -- Circle of Flame
                {},
                { id = 11812 }, -- Cape of the Fire Salamander
                { id = 11814 }, -- Molten Fists
                { id = 11832 }, -- Burst of Knowledge
                { id = 11809 }, -- Flame Wrath
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 11129, quantity = { 3, 5 }, dropRate = 80, container = { 12038 } }, -- Essence of the Elements
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDPanzor",
            prefix = "17)",
            name = L["Panzor the Invincible"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 22245 }, -- Soot Encrusted Footwear
                { id = 11787 }, -- Shalehusk Boots
                { id = 11785 }, -- Rock Golem Bulwark
                { id = 11786 }, -- Stone of the Earth
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 11129, quantity = { 3, 5 }, dropRate = 80, container = { 12038 } }, -- Essence of the Elements
            }
        },
        {
            name = L["Blacksmithing Plans"].." ",
            color = "|cff9d9d9d",
        },
        {
            name = L["Chest of The Seven"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDTomb",
            prefix = "18)",
            name = L["Summoner's Tomb"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11920 }, -- Wraith Scythe
                { id = 11923 }, -- The Hammer of Grace
                { id = 11926 }, -- Deathdealer Breastplate
                { id = 11929 }, -- Haunting Specter Leggings
                {},
                { id = 11921 }, -- Impervious Giant
                { id = 11922 }, -- Blood-etched Blade
                { id = 11925 }, -- Ghostshroud
                { id = 11927 }, -- Legplates of the Eternal Guardian
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
            }
        },
        {
            id = "BRDLyceum",
            prefix = "19)",
            name = L["The Lyceum"],
            loot = {
                { id = 11885, disc = L["Misc"], dropRate = 94 }, -- Shadowforge Torch
            }
        },
        {
            id = "BRDMagmus",
            prefix = "20)",
            name = L["Magmus"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 11746 }, -- Golem Skull Helm
                { id = 11935 }, -- Magmus Stone
                { id = 22395 }, -- Totem of Rage
                { id = 22400 }, -- Libram of Truth
                { id = 22208 }, -- Lavastone Hammer
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "BRDEmperorDagranThaurissan",
            prefix = "21)",
            name = L["Emperor Dagran Thaurissan"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 11684, dropRate = 1 }, -- Ironfoe
                {},
                { id = 11933 }, -- Imperial Jewel
                { id = 11930 }, -- The Emperor's New Cape
                { id = 22204 }, -- Wristguards of Renown
                { id = 11815 }, -- Hand of Justice
                { id = 11931 }, -- Dreadforge Retaliator
                {},
                { id = 11924 }, -- Robes of the Royal Crown
                { id = 22207 }, -- Sash of the Grand Hunt
                { id = 11934 }, -- Emperor's Seal
                { id = 11928 }, -- Thaurissan's Royal Scepter
                { id = 11932 }, -- Guiding Stave of Wisdom
                {},
                { id = 12033, disc = L["Container"], dropRate = 2, container = { 12364, 1206, 12800, 5500, 7971, -- Thaurissan Family Jewels
                        55249, 12799, 3864, 1705, 12361, 55250, 7909, 55251, 7910, 1529 } },
                { id = 61463, dropRate = 100, container = { 61465 } }, -- Hammer of the Depths
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 11468, quantity = { 4, 9 }, dropRate = 80, container = { 11883 } }, -- Dark Iron Fanny Pack
                { id = 56104, disc = BS["Gemology"], dropRate = 30, container = { 56109 } }, -- Bottom Half of Advanced Gemology I
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                        70234, 70235, 70236, 70238 } },
                { id = 61791, dropRate = .25, container = { 61784 } }, -- Plans: Arcanite Belt Buckle
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
            }
        },
        {
            id = "BRDPrincess",
            name = L["Princess Moira Bronzebeard"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 12557 }, -- Ebonsteel Spaulders
                { id = 12554 }, -- Hands of the Exalted Herald
                { id = 12556 }, -- High Priestess Boots
                { id = 12553 }, -- Swiftwalker Boots
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
                { id = 11468, dropRate = 80, container = { 11883 } }, -- Dark Iron Fanny Pack
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            prefix = "22)",
            name = L["The Black Forge"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "23)",
            name = BZ["Molten Core"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Core Fragment"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDPyron",
            prefix = "24)",
            name = L["Overmaster Pyron"],
            loot = {
                { id = 14486, dropRate = 18, container = { 14134 } }, -- Pattern: Cloak of Fire
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
            }
        },
        {
            id = "BRDBSPlans",
            prefix = "25)",
            name = L["Blacksmithing Plans"],
            loot = {
                { id = 11614, dropRate = 39, container = { 11606 } }, -- Plans: Dark Iron Mail
                { id = 11615, dropRate = 18, container = { 11605 } }, -- Plans: Dark Iron Shoulders
            }
        },
        {
            id = "BRDTrash",
            name = L["Trash Mobs"].."-"..BZ["Blackrock Depths"],
            defaults = { dropRate = .2 },
            loot = {
                { id = 12549 }, -- Braincage
                { id = 12552 }, -- Blisterbane Wrap
                { id = 12551 }, -- Stoneshield Cloak
                { id = 12542 }, -- Funeral Pyre Vestment
                { id = 12546 }, -- Aristocratic Cuffs
                { id = 12550 }, -- Runed Golem Shackles
                { id = 12547 }, -- Mar Alom's Grip
                { id = 12555, dropRate = 1 }, -- Battlechaser's Greaves
                { id = 12527 }, -- Ribsplitter
                { id = 12531 }, -- Searing Needle
                { id = 12535 }, -- Doomforged Straightedge
                { id = 12528 }, -- The Judge's Gavel
                { id = 12532 }, -- Spire of the Stoneshaper
                {},
                {},
                { id = 15781, dropRate = 4, container = { 15052 } }, -- Pattern: Black Dragonscale Leggings
                { id = 15770, dropRate = 4, container = { 15051 } }, -- Pattern: Black Dragonscale Shoulders
                { id = 11611, dropRate = 9, container = { 11607 } }, -- Plans: Dark Iron Sunderer
                { id = 11614, container = { 11606 } }, -- Plans: Dark Iron Mail
                { id = 11615, container = { 11605 } }, -- Plans: Dark Iron Shoulders
                { id = 16048, dropRate = 1.8, container = { 16004 } }, -- Schematic: Dark Iron Rifle
                { id = 16053, dropRate = .7, container = { 16008 } }, -- Schematic: Master Engineer's Goggles
                { id = 16049, dropRate = 1, container = { 16005 } }, -- Schematic: Dark Iron Bomb
                { id = 18654, dropRate = 2, container = { 18645 } }, -- Schematic: Gnomish Alarm-O-Bot
                { id = 18661, dropRate = 2, container = { 18660 } }, -- Schematic: World Enlarger
                {},
                { id = 18232 }, -- Field Repair Bot 74A
                {},
                { id = 11446, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
            }
        },
        { name = BIS["The Gladiator"], items = "TheGladiator" },
        { name = BIS["Arms of Thaurissan"], items = "ArmsofThaurissan" },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockDepths.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
