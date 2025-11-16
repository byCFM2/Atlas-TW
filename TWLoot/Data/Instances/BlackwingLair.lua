---
--- BlackwingLair.lua - Blackwing Lair raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Blackwing Lair
--- 40-player raid instance. It includes all boss encounters, tier set items,
--- legendary drops, and unique weapons with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Tier 2 set items and tokens
--- • Legendary weapon drops
--- • Unique trinkets and accessories
--- • Attunement requirement tracking
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.BlackwingLair = {
    Name = BZ["Blackwing Lair"],
    Location = BZ["Blackrock Spire"],
    Level = 60,
    Acronym = "BWL",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Fire"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] },
        { letter = "B) ".. L["Connection"] },
        { letter = "C) ".. L["Connection"] }
    },
    Bosses = {
        {
            id = "Razorgore",
            prefix = "1)",
            name = BB["Razorgore the Untamed"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 16926, container = { 47209 } }, -- Bindings of Transcendence
                { id = 16918, container = { 47089 } }, -- Netherwind Bindings
                { id = 16934, container = { 47287 } }, -- Nemesis Bracers
                { id = 16911 }, -- Bloodfang Bracers
                { id = 16904, container = { 47349, 47357 } }, -- Stormrage Bracers
                { id = 16935 }, -- Dragonstalker's Bracers
                { id = 16943, container = { 47139, 47147 } }, -- Bindings of Ten Storms
                { id = 16951, container = { 47019, 47027 } }, -- Judgement Bracers
                { id = 16959, container = { 47251 } }, -- Bracelets of Wrath
                {},
                {},
                {},
                {},
                { id = 19336, dropRate = 20 }, -- Arcane Infused Gem
                { id = 19337, dropRate = 20 }, -- The Black Book
                { id = 19370, dropRate = 20 }, -- Mantle of the Blackwing Cabal
                { id = 19369, dropRate = 20 }, -- Gloves of Rapid Evolution
                {},
                { id = 19335, dropRate = 10 }, -- Spineshatter
                { id = 19334, dropRate = 10 }, -- The Untamed Blade
            }
        },
        {
            id = "Vaelastrasz",
            prefix = "2)",
            name = BB["Vaelastrasz the Corrupt"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 16925, container = { 47211 } }, -- Belt of Transcendence
                { id = 16818, container = { 47091 } }, -- Netherwind Belt
                { id = 16933, container = { 47289 } }, -- Nemesis Belt
                { id = 16910 }, -- Bloodfang Belt
                { id = 16903, container = { 47351, 47359 } }, -- Stormrage Belt
                { id = 16936 }, -- Dragonstalker's Belt
                { id = 16944, container = { 47141, 47149 } }, -- Sash of Ten Storms
                { id = 16952, container = { 47021, 47029 } }, -- Judgement Belt
                { id = 16960, container = { 47253 } }, -- Waistband of Wrath
                {},
                {},
                {},
                {},
                { id = 19339, dropRate = 20 }, -- Mind Quickening Gem
                { id = 19340, dropRate = 20 }, -- Rune of Metamorphosis
                { id = 19372, dropRate = 20 }, -- Helm of Endless Rage
                { id = 19371, dropRate = 20 }, -- Pendant of the Fallen Dragon
                {},
                { id = 19348, dropRate = 10 }, -- Red Dragonscale Protector
                { id = 19346, dropRate = 10 }, -- Dragonfang Blade
            }
        },
        {
            id = "Lashlayer",
            prefix = "3)",
            name = BB["Broodlord Lashlayer"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 16919, container = { 47213 } }, -- Boots of Transcendence
                { id = 16912, container = { 47093 } }, -- Netherwind Boots
                { id = 16927, container = { 47291 } }, -- Nemesis Slippers
                { id = 16906 }, -- Bloodfang Boots
                { id = 16898, container = { 47353, 47361 } }, -- Stormrage Boots
                { id = 16941 }, -- Dragonstalker's Greaves
                { id = 16949, container = { 47143, 47151 } }, -- Greaves of Ten Storms
                { id = 16957, container = { 47023, 47031 } }, -- Judgement Boots
                { id = 16965, container = { 47255 } }, -- Sabatons of Wrath
                {},
                {},
                {},
                {},
                { id = 19341, dropRate = 20 }, -- Lifegiving Gem
                { id = 19342, dropRate = 20 }, -- Venomous Totem
                { id = 19373, dropRate = 20 }, -- Black Brood Pauldrons
                { id = 19374, dropRate = 20 }, -- Bracers of Arcane Accuracy
                {},
                { id = 19350, dropRate = 10 }, -- Heartstriker
                { id = 19351, dropRate = 10 }, -- Maladath, Runed Blade of the Black Flight
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 20383, dropRate = 100 }, -- Head of the Broodlord Lashlayer
            }
        },
        {
            id = "Firemaw",
            prefix = "4)",
            name = BB["Firemaw"],
            defaults = { dropRate = 7 },
            loot = {
                { id = 16920, container = { 47210 } }, -- Gloves of Transcendence
                { id = 16913, container = { 47090 } }, -- Netherwind Gloves
                { id = 16928, container = { 47288 } }, -- Nemesis Gloves
                { id = 16907 }, -- Bloodfang Gloves
                { id = 16899, container = { 47350, 47358 } }, -- Stormrage Gloves
                { id = 16940 }, -- Dragonstalker's Gauntlets
                { id = 16948, container = { 47140, 47148 } }, -- Gauntlets of Ten Storms
                { id = 16956, container = { 47020, 47028 } }, -- Judgement Gloves
                { id = 16964, container = { 47252 } }, -- Gauntlets of Wrath
                {},
                {},
                {},
                {},
                { id = 19344, dropRate = 13 }, -- Natural Alignment Crystal
                { id = 19343, dropRate = 13 }, -- Scrolls of Blinding Light
                { id = 19394 }, -- Drake Talon Pauldrons
                { id = 19398, dropRate = 13 }, -- Cloak of Firemaw
                { id = 19399, dropRate = 13 }, -- Black Ash Robe
                { id = 19400, dropRate = 13 }, -- Firemaw's Clutch
                { id = 19396, dropRate = 13 }, -- Taut Dragonhide Belt
                { id = 19401, dropRate = 13 }, -- Primalist's Linked Legguards
                { id = 19402, dropRate = 13 }, -- Legguards of the Fallen Crusader
                {},
                { id = 19365, dropRate = 13 }, -- Claw of the Black Drake
                { id = 19353 }, -- Drake Talon Cleaver
                { id = 19355 }, -- Shadow Wing Focus Staff
                {},
                {},
                { id = 19397 }, -- Ring of Blackrock
                { id = 19395 }, -- Rejuvenating Gem
            }
        },
        { prefix = "5)", name = L["Master Elemental Shaper Krixix"], color = Colors.GREY, },
        {
            id = "Ebonroc",
            prefix = "6)",
            name = BB["Ebonroc"],
            defaults = { dropRate = 7 },
            loot = {
                { id = 16920, container = { 47210 } }, -- Gloves of Transcendence
                { id = 16913, container = { 47090 } }, -- Netherwind Gloves
                { id = 16928, container = { 47288 } }, -- Nemesis Gloves
                { id = 16907 }, -- Bloodfang Gloves
                { id = 16899, container = { 47350, 47358 } }, -- Stormrage Gloves
                { id = 16940 }, -- Dragonstalker's Gauntlets
                { id = 16948, container = { 47140, 47148 } }, -- Gauntlets of Ten Storms
                { id = 16956, container = { 47020, 47028 } }, -- Judgement Gloves
                { id = 16964, container = { 47252 } }, -- Gauntlets of Wrath
                {},
                {},
                {},
                {},
                {},
                { id = 19345, dropRate = 17 }, -- Aegis of Preservation
                { id = 19394 }, -- Drake Talon Pauldrons
                { id = 19407, dropRate = 17 }, -- Ebony Flame Gloves
                { id = 19396 }, -- Taut Dragonhide Belt
                { id = 19405, dropRate = 17 }, -- Malfurion's Blessed Bulwark
                {},
                { id = 19368, dropRate = 17 }, -- Dragonbreath Hand Cannon
                { id = 19353 }, -- Drake Talon Cleaver
                { id = 19355 }, -- Shadow Wing Focus Staff
                {},
                {},
                {},
                { id = 19403, dropRate = 17 }, -- Band of Forced Concentration
                { id = 19397 }, -- Ring of Blackrock
                { id = 19406, dropRate = 17 }, -- Drake Fang Talisman
                { id = 19395 }, -- Rejuvenating Gem
            }
        },
        {
            id = "Flamegor",
            prefix = "7)",
            name = BB["Flamegor"],
            defaults = { dropRate = 7 },
            loot = {
                { id = 16920, container = { 47210 } }, -- Gloves of Transcendence
                { id = 16913, container = { 47090 } }, -- Netherwind Gloves
                { id = 16928, container = { 47288 } }, -- Nemesis Gloves
                { id = 16907 }, -- Bloodfang Gloves
                { id = 16899, container = { 47350, 47358 } }, -- Stormrage Gloves
                { id = 16940 }, -- Dragonstalker's Gauntlets
                { id = 16948, container = { 47140, 47148 } }, -- Gauntlets of Ten Storms
                { id = 16956, container = { 47020, 47028 } }, -- Judgement Gloves
                { id = 16964, container = { 47252 } }, -- Gauntlets of Wrath
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 19394 }, -- Drake Talon Pauldrons
                { id = 19430, dropRate = 17 }, -- Shroud of Pure Thought
                { id = 19396 }, -- Taut Dragonhide Belt
                { id = 19433, dropRate = 17 }, -- Emberweave Leggings
                {},
                { id = 19367, dropRate = 17 }, -- Dragon's Touch
                { id = 19353 }, -- Drake Talon Cleaver
                { id = 19357, dropRate = 17 }, -- Herald of Woe
                { id = 19355 }, -- Shadow Wing Focus Staff
                {},
                {},
                { id = 19432, dropRate = 17 }, -- Circle of Applied Force
                { id = 19397 }, -- Ring of Blackrock
                { id = 19395 }, -- Rejuvenating Gem
                { id = 19431, dropRate = 17 }, -- Styleen's Impeding Scarab
            }
        },
        {
            id = "Chromaggus",
            prefix = "8)",
            name = BB["Chromaggus"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 16924, container = { 47207 } }, -- Pauldrons of Transcendence
                { id = 16917, container = { 47087 } }, -- Netherwind Mantle
                { id = 16932, container = { 47285 } }, -- Nemesis Spaulders
                { id = 16832 }, -- Bloodfang Spaulders
                { id = 16902, container = { 47347, 47355 } }, -- Stormrage Pauldrons
                { id = 16937 }, -- Dragonstalker's Spaulders
                { id = 16945, container = { 47137, 47145 } }, -- Epaulets of Ten Storms
                { id = 16953, container = { 47017, 47025 } }, -- Judgement Spaulders
                { id = 16961, container = { 47249 } }, -- Pauldrons of Wrath
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 19389, dropRate = 16 }, -- Taut Dragonhide Shoulderpads
                { id = 19386, dropRate = 16 }, -- Elementium Threaded Cloak
                { id = 19390, dropRate = 16 }, -- Taut Dragonhide Gloves
                { id = 19388, dropRate = 20 }, -- Angelista's Grasp
                { id = 19393, dropRate = 16 }, -- Primalist's Linked Waistguard
                { id = 19392, dropRate = 16 }, -- Girdle of the Fallen Crusader
                { id = 19385, dropRate = 20 }, -- Empowered Leggings
                { id = 19391, dropRate = 16 }, -- Shimmering Geta
                { id = 19387, dropRate = 20 }, -- Chromatic Boots
                {},
                {},
                { id = 19361, dropRate = 10 }, -- Ashjre'thul, Crossbow of Smiting
                { id = 19349, dropRate = 10 }, -- Elementium Reinforced Bulwark
                { id = 19347, dropRate = 10 }, -- Claw of Chromaggus
                { id = 19352, dropRate = 10 }, -- Chromatically Tempered Sword
            }
        },
        {
            id = "Nefarian",
            prefix = "9)",
            name = BB["Nefarian"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 16923, container = { 47208 } }, -- Robes of Transcendence
                { id = 16916, container = { 47088 } }, -- Netherwind Robes
                { id = 16931, container = { 47286 } }, -- Nemesis Robes
                { id = 16905 }, -- Bloodfang Chestpiece
                { id = 16897, container = { 47348, 47356 } }, -- Stormrage Chestguard
                { id = 16942 }, -- Dragonstalker's Breastplate
                { id = 16950, container = { 47138, 47146 } }, -- Raiments of Ten Storms
                { id = 16958, container = { 47018, 47026 } }, -- Judgement Breastplate
                { id = 16966, container = { 47250 } }, -- Breastplate of Wrath
                {},
                { id = 19003, dropRate = 100, container = { 19383, 19384, 19366 } }, -- Head of Nefarian (Alliance)
                { id = 19002, dropRate = 100, container = { 19383, 19384, 19366 } }, -- Head of Nefarian (Horde)
                {},
                { id = 36551, dropRate = 1 }, -- Black Drake
                { id = 19360, dropRate = 10 }, -- Lok'amir il Romathis
                { id = 19363, dropRate = 10 }, -- Crul'shorukh, Edge of Chaos
                { id = 19364, dropRate = 10 }, -- Ashkandi, Greatsword of the Brotherhood
                { id = 19356, dropRate = 10 }, -- Staff of the Shadow Flame
                {},
                { id = 19375, dropRate = 20 }, -- Mish'undare, Circlet of the Mind Flayer
                { id = 19377, dropRate = 20 }, -- Prestor's Talisman of Connivery
                { id = 19378, dropRate = 20 }, -- Cloak of the Brood Lord
                { id = 19380, dropRate = 20 }, -- Therazane's Link
                { id = 19381, dropRate = 20 }, -- Boots of the Shadow Flame
                {},
                { id = 19376, dropRate = 20 }, -- Archimtiros' Ring of Reckoning
                { id = 19382, dropRate = 20 }, -- Pure Elementium Band
                { id = 19379, dropRate = 20 }, -- Neltharion's Tear
                {},
                { id = 61760, dropRate = 100, container = { 55505 } }, -- Burnt Copy of "Vorgendor"
                {},
                { id = 17962, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 3864, 55251, 55250, 7910, 7909, 1529, 12361 } }, -- Blue Sack of Gems
                { id = 17963, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12364 } }, -- Green Sack of Gems
                { id = 17964, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12800 } }, -- Gray Sack of Gems
                { id = 17965, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12363 } }, -- Yellow Sack of Gems
                { id = 17969, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12799 } }, -- Red Sack of Gems
            }
        },
        {
            id = "EzzelDarkbrewer",
            prefix = "10)",
            name = BB["Ezzel Darkbrewer"],
            postfix = L["Optional"],
            defaults = { dropRate = 20 },
            loot = {
                --TODO Ezzel Darkbrewer loot
            }
        },
        { prefix = "1)", name = L["Alchemy Lab"], color = Colors.GREEN },
        { prefix = "2)", name = L["Draconic for Dummies"], color = Colors.GREEN },
        {
            id = "BWLTrash",
            name = L["Trash Mobs"].."-"..BZ["Blackwing Lair"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 19436 }, -- Cloak of Draconic Might
                { id = 19439, dropRate = 5 }, -- Interlaced Shadow Jerkin
                { id = 19437 }, -- Boots of Pure Thought
                { id = 19438, dropRate = 5 }, -- Ringo's Blizzard Boots
                {},
                { id = 19434, dropRate = 2 }, -- Band of Dark Dominion
                {},
                { id = 19435, dropRate = 2 }, -- Essence Gatherer
                { id = 19362, dropRate = 2 }, -- Doom's Edge
                { id = 19354, dropRate = 5 }, -- Draconic Avenger
                { id = 19358 }, -- Draconic Maul
                {},
                { id = 18562, disc = L["Trade Goods"], dropRate = 8 }, -- Elementium Ore
                { id = 19183, quantity = { 1, 2 }, disc = L["Consumable"], dropRate = 47 }, -- Hourglass Sand
                { id = 70173, dropRate = 2, container = { 56062 } }, -- Plans: Blackwing Signet of Command
            }
        },
        { name = L["Tier 2 Sets"], items = "AtlasTWLootT2SetMenu" },
    }
}

AtlasTW.InstanceData.BlackrockMountainEnt = {
    Name = BZ["Blackrock Mountain"] .. " (" .. L["Entrance"] .. ")",
    Location = BZ["Blackrock Mountain"],
    Entrances = {
        { letter = "A) " .. BZ["Searing Gorge"] },
        { letter = "B) " .. BZ["Burning Steppes"] },
        { letter = "C) " .. BZ["Blackrock Depths"] .. " (BRD)" },
        { letter = "D) " .. BZ["Lower Blackrock Spire"] .. " (LBRS)" }
    },
    Bosses = {
        {
            name = BZ["Molten Core"] .. " (MC) (" .. L["through "] .. "BRD)",
            color = Colors.BLUE
        },
        {
            name = BZ["Upper Blackrock Spire"] .. " (UBRS)",
            color = Colors.BLUE
        },
        {
            name = BZ["Blackwing Lair"] .. " (BWL) (" .. L["through "] .. "UBRS)",
            color = Colors.BLUE
        },
        {
            name = L["Bodley"] .. " (" .. L["Ghost"] .. ")",
            color = Colors.BLUE
        },
        {
            id = "BRDPyron",
            prefix = "1)",
            name = BB["Overmaster Pyron"],
            postfix = L["Wanders"],
            loot = {
                { id = 14486, dropRate = 18, container = { 14134 } }, -- Pattern: Cloak of Fire
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
            }
        },
        {
            prefix = "2)",
            name = BB["Lothos Riftwaker"],
            postfix = "MC " .. L["Teleport"],
            color = Colors.GREY,
        },
        {
            prefix = "3)",
            name = BB["Franclorn Forgewright"],
            postfix = L["Ghost"],
            color = Colors.GREY,
        },
        {
            prefix = "4)",
            name = L["Meeting Stone"] .. " (BRD)",
            color = Colors.GREY,
        },
        {
            prefix = "5)",
            name = L["Orb of Command"] .. " (BWL " .. L["Teleport"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "6)",
            name = L["Meeting Stone"] .. " (LBRS, UBRS)",
            color = Colors.GREY,
        },
        {
            id = "BRMScarshieldQuartermaster",
            prefix = "7)",
            name = BB["Scarshield Quartermaster"],
            postfix = L["Rare"],
            loot = {
                { id = 13254, dropRate = 3 }, -- Astral Guard
                { id = 13248, dropRate = 3 }, -- Burstshot Harquebus
                {},
                { id = 18987, dropRate = 100 }, -- Blackhand's Command
            }
        },
        {
            id = "BRMBehemoth",
            prefix = "8)",
            name = BB["The Behemoth"],
            postfix = L["Rare"],
            loot = {
                { id = 11603, dropRate = 99 }, -- Vilerend Slicer
                {},
                { id = 11446, dropRate = 25, container = { 12061, 12062, 12065 } }, -- A Crumpled Up Note
            }
        }
    }
}

for _, bossData in ipairs(AtlasTW.InstanceData.BlackwingLair.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end

for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockMountainEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end
