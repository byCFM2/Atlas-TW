---
--- TempleofAhnQiraj.lua - Temple of Ahn'Qiraj raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Temple of Ahn'Qiraj
--- 40-player raid instance. It includes all boss encounters, tier set items,
--- legendary drops, and unique Qiraji weapons with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Tier 2.5 set items and tokens
--- • Legendary weapon drops
--- • Unique Qiraji items and mounts
--- • Scarab Lord quest items
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local imperialRegalia = {
    { id = 21237, disc = L["Quest Item"], dropRate = 4, container = { 21268, 21273, 21275 } }, -- Imperial Qiraji Regalia
}

local imperialArmaments = {
    { id = 21232, disc = L["Quest Item"], dropRate = 4, container = { 21242, 21244, 21272, 21269 } }, -- Imperial Qiraji Armaments
}
local QirajiBindingsOfCommand = {
    { id = 20928, disc = L["Quest Item"], dropRate = 100, container = { 21330, 21333, 21367, 21365, 21361, 21359, 21350, 47215, 21349, 47218 } }, -- Qiraji Bindings of Command
}
local QirajiBindingsOfDominance = {
    { id = 20932, disc = L["Quest Item"], dropRate = 100, container = { 21391, 47038, 47033, 21388, 47036, 47041, 21345, 47095, 21344, 47098, 21335, -- Qiraji Bindings of Dominance
            47293, 21338, 47296, 21376, 47153, 47158, 21373, 47156, 47161, 21354, 47363, 47368, 21355, 47366, 47371 } },
}

AtlasTW.InstanceData.TheTempleofAhnQiraj = {
    Name = BZ["Temple of Ahn'Qiraj"],
    Location = BZ["Silithus"],
    Level = 60,
    Acronym = "AQ40",
    MaxPlayers = 40,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A"..". "..L["Entrance"] }
    },
    Reputation = {
        { name = BF["Brood of Nozdormu"], loot = "BroodOfNozdormu" },
    },

    Bosses = {
        {
            id = "TheProhetSkeram",
            prefix = "1)",
            name = BB["The Prophet Skeram"],
            defaults = { dropRate = 15 },
            loot = {
                { id = 21699, dropRate = 18 }, -- Barrage Shoulders
                { id = 21814 }, -- Breastplate of Annihilation
                { id = 21708 }, -- Beetle Scaled Wristguards
                { id = 21698, dropRate = 18 }, -- Leggings of Immersion
                { id = 21705 }, -- Boots of the Fallen Prophet
                { id = 21704 }, -- Boots of the Redeemed Prophecy
                { id = 21706 }, -- Boots of the Unwavering Will
                {},
                {},
                { id = 21702, dropRate = 18 }, -- Amulet of Foul Warding
                { id = 21700, dropRate = 18 }, -- Pendant of the Qiraji Guardian
                { id = 21701, dropRate = 18 }, -- Cloak of Concentrated Hatred
                { id = 21707 }, -- Ring of Swarming Thought
                { id = 21703, dropRate = 10 }, -- Hammer of Ji'zhi
                { id = 21128, dropRate = 10 }, -- Staff of the Qiraji Prophets
                unpack(imperialRegalia),
                unpack(imperialArmaments),
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
                {},
                { id = 22222, container = { 22196 } }, -- Plans: Thick Obsidian Breastplate
            }
        },
        {
            id = "TheBugFamily",
            prefix = "2)",
            name = BB["The Bug Family"],
            postfix = L["Optional"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 21693, dropRate = 17, disc = L["Shared"] }, -- Guise of the Devourer
                { id = 21694, dropRate = 17, disc = L["Shared"] }, -- Ternary Mantle
                { id = 21697, dropRate = 17, disc = L["Shared"] }, -- Cape of the Trinity
                { id = 21696, dropRate = 17, disc = L["Shared"] }, -- Robes of the Triumvirate
                { id = 21692, dropRate = 17, disc = L["Shared"] }, -- Triad Girdle
                { id = 21695, dropRate = 17, disc = L["Shared"] }, -- Angelista's Touch
                {},
                unpack(imperialRegalia),
                unpack(imperialArmaments),
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
                {},
                { id = 21680, disc = BB["Lord Kri"] }, -- Vest of Swift Execution
                { id = 21681, disc = BB["Lord Kri"] }, -- Ring of the Devoured
                { id = 21685, disc = BB["Lord Kri"] }, -- Petrified Scarab
                { id = 21603, disc = BB["Lord Kri"] }, -- Wand of Qiraji Nobility
                { id = 21690, disc = BB["Vem"] }, -- Angelista's Charm
                { id = 21689, disc = BB["Vem"] }, -- Gloves of Ebru
                { id = 21691, disc = BB["Vem"] }, -- Ooze-ridden Gauntlets
                { id = 21688, disc = BB["Vem"] }, -- Boots of the Fallen Hero
                {},
                { id = 21686, disc = BB["Princess Yauj"] }, -- Mantle of Phrenic Power
                { id = 21684, disc = BB["Princess Yauj"] }, -- Mantle of the Fallen Prophet
                { id = 21683, disc = BB["Princess Yauj"] }, -- Mantle of the Redeemed Prophecy
                { id = 21682, disc = BB["Princess Yauj"] }, -- Bile-Covered Gauntlets
                { id = 21687, disc = BB["Princess Yauj"] }, -- Ukko's Ring of Darkness
            }
        },
        {
            name = BB["Vem"],
            color = "|cff9d9d9d",
        },
        {
            name = BB["Lord Kri"],
            color = "|cff9d9d9d",
        },
        {
            name = BB["Princess Yauj"],
            color = "|cff9d9d9d",
        },
        {
            id = "BattleguardSartura",
            prefix = "3)",
            name = BB["Battleguard Sartura"],
            defaults = { dropRate = 15 },
            loot = {
                { id = 21669 }, -- Creeping Vine Helm
                { id = 21678, dropRate = 18 }, -- Necklace of Purity
                { id = 21671 }, -- Robes of the Battleguard
                { id = 21672 }, -- Gloves of Enforcement
                { id = 21674, dropRate = 18 }, -- Gauntlets of Steadfast Determination
                { id = 21675, dropRate = 18 }, -- Thick Qirajihide Belt
                { id = 21676, dropRate = 18 }, -- Leggings of the Festering Swarm
                { id = 21668 }, -- Scaled Leggings of Qiraji Fury
                { id = 21667 }, -- Legplates of Blazing Light
                { id = 21648, dropRate = 18 }, -- Recomposed Boots
                {},
                { id = 21670 }, -- Badge of the Swarmguard
                {},
                { id = 21666, dropRate = 10 }, -- Sartura's Might
                { id = 21673, dropRate = 10 }, -- Silithid Claw
                unpack(imperialRegalia),
                unpack(imperialArmaments),
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
            }
        },
        {
            id = "FankrisstheUnyielding",
            prefix = "4)",
            name = BB["Fankriss the Unyielding"],
            defaults = { dropRate = 15 },
            loot = {
                { id = 21665, dropRate = 18 }, -- Mantle of Wicked Revenge
                { id = 21639 }, -- Pauldrons of the Unrelenting
                { id = 21627 }, -- Cloak of Untold Secrets
                { id = 21663, dropRate = 18 }, -- Robes of the Guardian Saint
                { id = 21652, dropRate = 18 }, -- Silithid Carapace Chestguard
                { id = 21651, dropRate = 18 }, -- Scaled Sand Reaver Leggings
                { id = 21645 }, -- Hive Tunneler's Boots
                {},
                { id = 21650, dropRate = 10 }, -- Ancient Qiraji Ripper
                { id = 21635, dropRate = 10 }, -- Barb of the Sand Reaver
                { id = 21664, dropRate = 18 }, -- Barbed Choker
                { id = 21647 }, -- Fetish of the Sand Reaver
                { id = 22402 }, -- Libram of Grace
                { id = 22396 }, -- Totem of Life
                {},
                unpack(imperialRegalia),
                unpack(imperialArmaments),
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
            }
        },
        {
            id = "Viscidus",
            prefix = "5)",
            name = BB["Viscidus"],
            postfix = L["Optional"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 21624 }, -- Gauntlets of Kalimdor
                { id = 21623 }, -- Gauntlets of the Righteous Champion
                { id = 21626 }, -- Slime-coated Leggings
                { id = 21622 }, -- Sharpened Silithid Femur
                {},
                { id = 21677, dropRate = 2.93 }, -- Ring of the Qiraji Fury
                { id = 21625 }, -- Scarab Brooch
                { id = 22399 }, -- Idol of Health
                {},
                unpack(QirajiBindingsOfCommand),
                unpack(QirajiBindingsOfDominance),
                {},
                unpack(imperialRegalia),
                unpack(imperialArmaments),
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
            }
        },
        {
            id = "PrincessHuhuran",
            prefix = "6)",
            name = BB["Princess Huhuran"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 21621 }, -- Cloak of the Golden Hive
                { id = 21618 }, -- Hive Defiler Wristguards
                { id = 21619 }, -- Gloves of the Messiah
                { id = 21617 }, -- Wasphide Gauntlets
                { id = 21620 }, -- Ring of the Martyr
                { id = 21616 }, -- Huhuran's Stinger
                {},
                unpack(QirajiBindingsOfCommand),
                unpack(QirajiBindingsOfDominance),
                {},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
                {},
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
            }
        },
        {
            id = "TheTwinEmperors",
            prefix = "7)",
            name = BB["The Twin Emperors"],
            defaults = { dropRate = 14 },
            loot = {
                { name = BB["Emperor Vek'lor"] },
                { id = 20930, dropRate = 100, container = { 21387, 47032, 47037, 21366, 21360, -- Vek'lor's Diadem
                        21372, 47152, 47157, 21353, 47362, 47367 } },
                {},
                { id = 21602, dropRate = 17 }, -- Qiraji Execution Bracers
                { id = 21599, dropRate = 17 }, -- Vek'lor's Gloves of Devastation
                { id = 21598, dropRate = 17 }, -- Royal Qiraji Belt
                { id = 21600, dropRate = 17 }, -- Boots of Epiphany
                { id = 21601, dropRate = 17 }, -- Ring of Emperor Vek'lor
                { id = 21597, dropRate = 17 }, -- Royal Scepter of Vek'lor
                { id = 20735, dropRate = 7 }, -- Formula: Enchant Cloak - Subtlety
                {},
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
                unpack(imperialArmaments),
                {},
                {},
                { name = BB["Emperor Vek'nilash"] },
                { id = 20926, dropRate = 100, container = { 21329, 21348, 47214, 21347, 47094, 21337, 47292 } }, -- Vek'nilash's Circlet
                {},
                { id = 21608 }, -- Amulet of Vek'nilash
                { id = 21604 }, -- Bracelets of Royal Redemption
                { id = 21605 }, -- Gloves of the Hidden Temple
                { id = 21609 }, -- Regenerating Belt of Vek'nilash
                { id = 21607, dropRate = 7 }, -- Grasp of the Fallen Emperor
                { id = 21606, dropRate = 7 }, -- Belt of the Fallen Emperor
                { id = 21679, dropRate = 7 }, -- Kalimdor's Revenge
                { id = 20726, dropRate = 7 }, -- Formula: Enchant Gloves - Threat
                {},
                unpack(imperialRegalia),
                {},
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
            }
        },
        {
            name = "Emperor Vek'lor",
            color = "|cff9d9d9d",
        },
        {
            name = "Emperor Vek'nilash",
            color = "|cff9d9d9d",
        },
        {
            id = "Ouro",
            prefix = "8)",
            name = BB["Ouro"],
            postfix = L["Optional"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 21615 }, -- Don Rigoberto's Lost Hat
                { id = 21611 }, -- Burrower Bracers
                { id = 23558 }, -- The Burrower's Shell
                { id = 23570 }, -- Jom Gabbar
                { id = 21610 }, -- Wormscale Blocker
                { id = 23557 }, -- Larvae of the Great Worm
                { id = 21613 }, -- Wormhide Boots
                { id = 21612 }, -- Wormscale Stompers
                {},
                { id = 21614 }, -- Wormhide Protector
                { id = 55554 }, -- Carapace Handguards
                { id = 55553 }, -- Gloves of the Primordial Burrower
                { id = 55555 }, -- Ivonor, Maiden's Mallet
                {},
                { id = 21229, disc = L["Quest Item"], dropRate = 100 }, -- Qiraji Lord's Insignia
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
                {},
                { id = 20927, dropRate = 100, container = { 21332, 21362, 21352, 47217, 21346, 47097 } }, -- Ouro's Intact Hide
                { id = 20931, dropRate = 100, container = { 21390, 47035, 47040, 21368, 21375, 47155, 47160, 21336, 47295, 21356, 47365, 47370 } }, -- Skin of the Great Sandworm
            }
        },
        {
            id = "CThun",
            prefix = "9)",
            name = BB["C'Thun"],
            defaults = { dropRate = 18 },
            loot = {
                { id = 22732, dropRate = 21 }, -- Mark of C'Thun
                { id = 21583, dropRate = 21 }, -- Cloak of Clarity
                { id = 22731 }, -- Cloak of the Devoured
                { id = 22730 }, -- Eyestalk Waist Cord
                { id = 21582, dropRate = 21 }, -- Grasp of the Old God
                { id = 21586 }, -- Belt of Never-ending Agony
                { id = 21585 }, -- Dark Storm Gauntlets
                { id = 21581, dropRate = 21 }, -- Gauntlets of Annihilation
                { id = 41077, dropRate = 8 }, -- Yshgo'lar, Cowl of Fanatical Devotion
                {},
                { id = 21596 }, -- Ring of the Godslayer
                { id = 21579, dropRate = 15 }, -- Vanquished Tentacle of C'Thun
                {},
                {},
                {},
                { id = 21839, dropRate = 8 }, -- Scepter of the False Prophet
                { id = 21126, dropRate = 8 }, -- Death's Sting
                { id = 21134, dropRate = 8 }, -- Dark Edge of Insanity
                { id = 60003, dropRate = 8 }, -- Remnants of an Old God
                {},
                { id = 21221, dropRate = 100, container = { 21712, 21710, 21709 } }, -- Eye of C'Thun
                {},
                { id = 20929, dropRate = 100, container = { 21331, 21389, 47034, 47039, 21374, 47154, 47159, 21370, 21364 } }, -- Carapace of the Old God
                { id = 20933, dropRate = 100, container = { 21351, 47216, 21343, 47096, 21334, 47294, 21357, 47364, 47369 } }, -- Husk of the Old God
                {},
                { id = 22734, dropRate = 100, container = { 22631, 22589, 22630, 22632 } }, -- Base of Atiesh
            }
        },
        { prefix = "1') ", name = "Andorgos", color = "|cff00FF00" },
        { name = L["Vethsera"], color = "|cff00FF00" },
        { name = L["Kandrostrasz"], color = "|cff00FF00" },
        { prefix = "2') ", name = "Arygos", color = "|cff00FF00" },
        { name = L["Caelestrasz"], color = "|cff00FF00" },
        { name = L["Merithra of the Dream"], color = "|cff00FF00" },
        {
            id = "AQ40Trash",
            name = L["Trash Mobs"].."-"..BZ["Temple of Ahn'Qiraj"],
            defaults = { dropRate = 2 },
            loot = {
                { id = 21838, dropRate = 0.7 }, -- Garb of Royal Ascension
                { id = 21888, dropRate = 0.2 }, -- Gloves of the Immortal
                { id = 21890, dropRate = 1 }, -- Gloves of the Fallen Prophet
                { id = 21889, dropRate = 1 }, -- Gloves of the Redeemed Prophecy
                { id = 21856, dropRate = 0.2 }, -- Neretzek, The Blood Drinker
                { id = 21837, dropRate = 0.2 }, -- Anubisath Warhammer
                { id = 21836, dropRate = 0.25 }, -- Ritssyn's Ring of Chaos
                { id = 21891, dropRate = 0.5 }, -- Shard of the Fallen Star
                {},
                { id = 21218, dropRate = 12 }, -- Blue Qiraji Resonating Crystal
                { id = 21324, dropRate = 15 }, -- Yellow Qiraji Resonating Crystal
                { id = 21323, dropRate = 17 }, -- Green Qiraji Resonating Crystal
                { id = 21321, dropRate = 1.5 }, -- Red Qiraji Resonating Crystal
                {},
                { id = 21230, disc = L["Quest Item"], dropRate = 5 }, -- Ancient Qiraji Artifact
                { id = 20876, dropRate = 0.4 }, -- Idol of Death
                { id = 20879, dropRate = 1 }, -- Idol of Life
                { id = 20875, dropRate = 1 }, -- Idol of Night
                { id = 20878, dropRate = 1 }, -- Idol of Rebirth
                { id = 20881, dropRate = 1 }, -- Idol of Strife
                { id = 20877, dropRate = 1 }, -- Idol of the Sage
                { id = 20874, dropRate = 1 }, -- Idol of the Sun
                { id = 20882, dropRate = 1 }, -- Idol of War
                {},
                { id = 21762, disc = L["Key"], dropRate = 7 }, -- Greater Scarab Coffer Key
                { id = 21156, disc = L["Container"], dropRate = 0.1, container = { 20859, 20862, 20863, 20858, 20860, 20861, 20864, 20865 } }, -- Scarab Bag
                {},
                { id = 22203, disc = L["Reagent"] }, -- Large Obsidian Shard
                { id = 22202, disc = L["Reagent"] }, -- Small Obsidian Shard
                {},
                {},
                { id = 20864, disc = L["Currency"] }, -- Bone Scarab
                { id = 20861, disc = L["Currency"] }, -- Bronze Scarab
                { id = 20863, disc = L["Currency"] }, -- Clay Scarab
                { id = 20862, disc = L["Currency"] }, -- Crystal Scarab
                { id = 20859, disc = L["Currency"] }, -- Gold Scarab
                { id = 20865, disc = L["Currency"] }, -- Ivory Scarab
                { id = 20860, disc = L["Currency"] }, -- Silver Scarab
                { id = 20858, disc = L["Currency"] }, -- Stone Scarab
            }
        },
        {
            id = "AQEnchants",
            name = L["AQ Enchants"],
            defaults = { dropRate = 1 },
            loot = {
                { id = 20728 }, -- Formula: Enchant Gloves - Frost Power
                { id = 20731 }, -- Formula: Enchant Gloves - Superior Agility
                { id = 20734 }, -- Formula: Enchant Cloak - Stealth
                { id = 20729 }, -- Formula: Enchant Gloves - Fire Power
                { id = 20736 }, -- Formula: Enchant Cloak - Dodge
                { id = 20730 }, -- Formula: Enchant Gloves - Healing Power
                { id = 20727 }, -- Formula: Enchant Gloves - Shadow Power
            }
        },
        {
            id = "AQOpening",
            name = L["AQ Opening Quest Chain"],
            loot = {
                { id = 21138 }, -- Red Scepter Shard
                { id = 21529 }, -- Amulet of Shadow Shielding
                { id = 21530 }, -- Onyx Embedded Leggings
                {},
                { id = 21139 }, -- Green Scepter Shard
                { id = 21531 }, -- Drake Tooth Necklace
                { id = 21532 }, -- Drudge Boots
                {},
                { id = 21137 }, -- Blue Scepter Shard
                { id = 21517 }, -- Gnomish Turban of Psychic Might
                { id = 21527 }, -- Darkwater Robes
                { id = 21526 }, -- Band of Icy Depths
                { id = 21025 }, -- Recipe: Dirge's Kickin' Chimaerok Chops
                {},
                {},
                { id = 21175, disc = L["Quest Item"] }, -- The Scepter of the Shifting Sands
                { id = 21176 }, -- Black Qiraji Resonating Crystal
                { id = 21523 }, -- Fang of Korialstrasz
                { id = 21521 }, -- Runesword of the Red
                { id = 21522 }, -- Shadowsong's Sorrow
                { id = 21520 } -- Ravencrest's Legacy
            }
        },
        { name = L["Temple of Ahn'Qiraj Sets"], items = "AtlasLootAQ40SetMenu" },
    }
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.TheTempleofAhnQiraj.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
