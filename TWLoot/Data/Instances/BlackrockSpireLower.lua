---
--- BlackrockSpireLower.lua - Lower Blackrock Spire dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Lower Blackrock Spire
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
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2a")
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.BlackrockSpireLower = {
    Name = BZ["Lower Blackrock Spire"],
    Location = BZ["Blackrock Mountain"],
    Level = { 55, 60 },
    Acronym = "LBRS",
    MaxPlayers = 10,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] },
        { letter = "B)", info = BZ["Upper Blackrock Spire"] },
        { letter = "C-F)", info = L["Connections"] }
    },
    Keys = {
        { name = "Brazier of Invocation", loot = "VanillaKeys", info = L["Tier 0.5 Summon"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = L["Vaelan"],
            postfix = L["Upper"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name = L["Warosh"],
            postfix = L["Wanders"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Elder Stonefort"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            id = "LBRSPike",
            prefix = "3)",
            name = L["Roughshod Pike"],
            loot = {
                { id = 12533, disc = L["Used to summon boss"], dropRate = 100 }, -- Roughshod Pike
            }
        },
        {
            id = "LBRSSpirestoneButcher",
            prefix = "4)",
            name = L["Spirestone Butcher"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 12608 }, -- Butcher's Apron
                {},
                { id = 13286 }, -- Rivenspike
            }
        },
        {
            id = "LBRSOmokk",
            prefix = "5)",
            name = BB["Highlord Omokk"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 16670, disc = L["Shaman"]..", T0", container = { 22096 } }, -- Boots of Elements
                {},
                { id = 13166 }, -- Slamshot Shoulders
                { id = 13168 }, -- Plate of the Shaman King
                { id = 13170 }, -- Skyshroud Leggings
                { id = 13169 }, -- Tressermane Leggings
                {},
                { id = 13167 }, -- Fist of Omokk
                {},
                { id = 12534, disc = L["Used to summon boss"], dropRate = 100 }, -- Omokk's Head
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 12336, disc = L["Quest Item"], dropRate = 25, container = { 12344 } }, -- Gemstone of Spirestone
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 21982, quantity = { 2,3 } , dropRate = 50, container = { 22149, 22150 } }, -- Ogre Warbeads
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSSpirestoneBattleLord",
            prefix = "6)",
            name = L["Spirestone Battle Lord"],
            postfix = L["Rare"],
            loot = {
                { id = 13284, dropRate = 40 }, -- Swiftdart Battleboots
                {},
                { id = 13285, dropRate = 60 }, -- The Blackrock Slicer
                {},
                { id = 21982, dropRate = 14, container = { 22149, 22150 } }, -- Ogre Warbeads
            }
        },
        {
            id = "LBRSSpirestoneLordMagus",
            name = L["Spirestone Lord Magus"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 13282 }, -- Ogreseer Tower Boots
                { id = 13283 }, -- Magus Ring
                { id = 13261 }, -- Globe of D'sak
                { id = 21982, dropRate = 50, container = { 22149, 22150 } }, -- Ogre Warbeads
            }
        },
        {
            id = "LBRSVosh",
            prefix = "7)",
            name = BB["Shadow Hunter Vosh'gajin"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 16712, disc = L["Rogue"]..", T0", container = { 22002 } }, -- Shadowcraft Gloves
                {},
                { id = 13257 }, -- Demonic Runed Spaulders
                { id = 12626 }, -- Funeral Cuffs
                { id = 13255 }, -- Trueaim Gauntlets
                { id = 12653 }, -- Riphook
                { id = 12651 }, -- Blackcrow
                { id = 12654, dropRate = 25 }, -- Doomshot
                {},
                { id = 13352, dropRate = 100, container = { 12821 } }, -- Vosh'gajin's Snakestone
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            name = L["Fifth Mosh'aru Tablet"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "8)",
            name = L["Bijou"],
            color = "|cff9d9d9d",
        },
        {
            id = "LBRSVoone",
            prefix = "9)",
            name = BB["War Master Voone"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 16676, disc = L["Hunter"]..", T0", container = { 22015 } }, -- Beaststalker's Gloves
                {},
                { id = 13177 }, -- Talisman of Evasion
                { id = 13179 }, -- Brazecore Armguards
                { id = 22231 }, -- Kayser's Boots of Precision
                {},
                { id = 13173, dropRate = 100 }, -- Flightblade Throwing Axe
                { id = 12582 }, -- Keris of Zul'Serak
                {},
                { id = 12335, disc = L["Quest Item"], dropRate = 20, container = { 12344 } }, -- Gemstone of Smolderthorn
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41454, disc = L["Quest Item"], dropRate = 100 }, -- Throwing Axes of the Amani
                { id = 60714, disc = L["Quest Item"], dropRate = 100 }, -- War Master Voone's Tusks
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSGrayhoof",
            name = BB["Mor Grayhoof"],
            postfix = L["Summon"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 22306 }, -- Ironweave Belt
                { id = 22325 }, -- Belt of the Trickster
                { id = 22319 }, -- Tome of Divine Right
                { id = 22398 }, -- Idol of Rejuvenation
                {},
                { id = 22322 }, -- The Jaw Breaker
            }
        },
        {
            name = L["Sixth Mosh'aru Tablet"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "10)",
            name = L["Bijou's Belongings"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "11)",
            name = L["Human Remains"],
            postfix = L["Lower"],
            loot = {
                { id = 12812, disc = L["Quest Item"], dropRate = 100 }, -- Unfired Plate Gauntlets
            }
        },
        {
            name = L["Unfired Plate Gauntlets"],
            postfix = L["Lower"],
            color = "|cff9d9d9d",
        },
        {
            id = "LBRSGrimaxe",
            prefix = "12)",
            name = BB["Bannok Grimaxe"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 12637 }, -- Backusarian Gauntlets
                { id = 12634 }, -- Chiselbrand Girdle
                {},
                { id = 12621 }, -- Demonfork
                {},
                { id = 12838, dropRate = 7, container = { 12784 } }, -- Plans: Arcanite Reaper
            }
        },
        {
            id = "LBRSSmolderweb",
            prefix = "13)",
            name = BB["Mother Smolderweb"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 16715, disc = L["Druid"]..", T0", container = { 22107 } }, -- Wildheart Boots
                {},
                { id = 13244 }, -- Gilded Gauntlets
                { id = 13213 }, -- Smolderweb's Eye
                {},
                { id = 13183 }, -- Venomspitter
                {},
                { id = 80758, dropRate = 40 }, -- Carapace of the Spider Queen
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSCrystalFang",
            prefix = "14)",
            name = BB["Crystal Fang"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 13185 }, -- Sunderseer Mantle
                { id = 13184 }, -- Fallbrush Handgrips
                {},
                { id = 13218 }, -- Fang of the Crystal Spider
            }
        },
        {
            prefix = "15)",
            name = L["Urok's Tribute Pile"],
            color = "|cff9d9d9d",
        },
        {
            id = "LBRSDoomhowl",
            name = BB["Urok Doomhowl"],
            postfix = L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 13258 }, -- Slaghide Gauntlets
                { id = 22232 }, -- Marksman's Girdle
                { id = 13259 }, -- Ribsteel Footguards
                { id = 13178 }, -- Rosewine Circle
                {},
                { id = 18784, dropRate = 16 }, -- Top Half of Advanced Armorsmithing: Volume III
                { id = 12725, container = { 12620 }, dropRate = 0 }, -- Plans: Enchanted Thorium Helm
                {},
                { id = 12712, disc = L["Quest Item"], dropRate = 100, container = { 15867 } }, -- Warosh's Mojo
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 21982, quantity = { 2,3 } , dropRate = 50, container = { 22149, 22150 } }, -- Ogre Warbeads
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSZigris",
            prefix = "16)",
            name = BB["Quartermaster Zigris"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 13253 }, -- Hands of Power
                { id = 13252 }, -- Cloudrunner Girdle
                {},
                { id = 12835, container = { 12798 } }, -- Plans: Annihilator
                {},
                { id = 80759 }, -- Cloak of the Protector
                {},
                { id = 13446, quantity = 5, dropRate = 100  }, -- Major Healing Potion
                { id = 13444, quantity = 5, dropRate = 100  }, -- Major Mana Potion
                {},
                { id = 56101, disc = L["Quest Item"], dropRate = 30 }, -- Bottom Half of Advanced Goldsmithing I
                { id = 22138, dropRate = 80 }, -- Blackrock Bracer
                { id = 41478, dropRate = 100, container = { 41465 } }, -- Lower Half of the Thunderbrew Golden Lager Plans
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSHalycon",
            prefix = "17)",
            name = BB["Halycon"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 13212 }, -- Halycon's Spiked Collar
                { id = 22313 }, -- Ironweave Bracers
                { id = 13211 }, -- Slashclaw Bracers
                { id = 13210 }, -- Pads of the Dread Wolf
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSSlavener",
            name = BB["Gizrul the Slavener"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 16718, disc = L["Druid"]..", T0", container = { 22112 } }, -- Wildheart Spaulders
                {},
                { id = 13208 }, -- Bleak Howler Armguards
                { id = 13206 }, -- Wolfshear Leggings
                {},
                { id = 13205 }, -- Rhombeard Protector
                {},
                { id = 83573, disc = L["Book"], dropRate = 15 }, -- Book of Shred VI
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSBashguud",
            prefix = "18)",
            name = BB["Ghok Bashguud"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 13203 }, -- Armswake Cloak
                {},
                { id = 13198 }, -- Hurd Smasher
                { id = 13204 }, -- Bashguuder
                {},
                { id = 22138, dropRate = 80, container = { 22057 } }, -- Blackrock Bracer
            }
        },
        {
            id = "LBRSWyrmthalak",
            prefix = "19)",
            name = BB["Overlord Wyrmthalak"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 16679, disc = L["Hunter"]..", T0", container = { 22016 } }, -- Beaststalker's Mantle
                {},
                { id = 13162 }, -- Reiver Claws
                { id = 13164 }, -- Heart of the Scale
                { id = 22321 }, -- Heart of Wyrmthalak
                { id = 80760 }, -- Spireblade Band
                {},
                { id = 13163 }, -- Relentless Scythe
                { id = 13148 }, -- Chillpike
                { id = 13161 }, -- Trindlehaven Staff
                {},
                { id = 12780, dropRate = 100, container = { 13966, 13968, 13965 } }, -- General Drakkisath's Command
                {},
                { id = 13143, dropRate = 2 }, -- Mark of the Dragon Lord
                {},
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 12337, disc = L["Quest Item"], dropRate = 30, container = { 12344 } }, -- Gemstone of Bloodaxe
                { id = 16786, dropRate = 80, quantity = 2, container = { 16309 } }, -- Black Dragonspawn Eye
                { id = 41985, quantity = 3, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                { id = 61459, dropRate = 100, container = { 61465 } }, -- Eye of Wyrmthalak
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 100, quantity = 2 }, -- Fashion Coin
            }
        },
        {
            id = "LBRSFelguard",
            prefix = "1')",
            name = L["Burning Felguard"],
            postfix = L["Rare"]..", "..L["Summon"],
            color = "|cff00FF00",
            defaults = { dropRate = 50 },
            loot = {
                { id = 13181 }, -- Demonskin Gloves
                {},
                { id = 13182 }, -- Phase Blade
            }
        },
        {
            id = "LBRSTrash",
            name = L["Trash Mobs"].."-"..BZ["Lower Blackrock Spire"],
            defaults = { dropRate = 2 },
            loot = {
                { id = 14513, dropRate = 10, container = { 14152 } }, -- Pattern: Robe of the Archmage
                {},
                { id = 16696, disc = L["Priest"]..", T0", container = { 22078 } }, -- Devout Belt
                { id = 16685, disc = L["Mage"]..", T0", container = { 22062 } }, -- Magister's Belt
                { id = 16683, dropRate = 1, disc = L["Mage"]..", T0", container = { 22063 } }, -- Magister's Bindings
                { id = 16703, disc = L["Warlock"]..", T0", container = { 22071 } }, -- Dreadmist Bracers
                { id = 16713, disc = L["Rogue"]..", T0", container = { 22002 } }, -- Shadowcraft Belt
                { id = 16716, dropRate = 1, disc = L["Druid"]..", T0", container = { 22106 } }, -- Wildheart Belt
                { id = 16680, dropRate = 1, disc = L["Hunter"]..", T0", container = { 22010 } }, -- Beaststalker's Belt
                { id = 16673, disc = L["Shaman"]..", T0", container = { 22098 } }, -- Cord of Elements
                { id = 16736, disc = L["Warrior"]..", T0", container = { 21994 } }, -- Belt of Valor
                { id = 16735, disc = L["Warrior"]..", T0", container = { 21996 } }, -- Bracers of Valor
                {},
                { id = 9214, disc = L["Book"], dropRate = 5 }, -- Grimoire of Inferno
                {},
                { id = 15749, dropRate = 5, container = { 15053 } }, -- Pattern: Volcanic Breastplate
                { id = 15775, dropRate = 23, container = { 15055 } }, -- Pattern: Volcanic Shoulders
                { id = 13494, container = { 13457 } }, -- Recipe: Greater Fire Protection Potion
                { id = 16250, dropRate = 3 }, -- Formula: Enchant Weapon - Superior Striking
                { id = 16244, dropRate = 10 }, -- Formula: Enchant Gloves - Greater Strength
                {},
                { id = 12219, disc = L["Quest Item"], dropRate = 8, container = { 12344 } }, -- Unadorned Seal of Ascension
                { id = 12586, disc = L["Consumable"], dropRate = 80 }, -- Immature Venom Sac
            }
        },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
        { name = BIS["Spider's Kiss"], items = "SpiderKiss" },
        { name = L["Tier 0/0.5 Sets"], items = "AtlasTWLootT0SetMenu" },
    }
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockSpireLower.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
