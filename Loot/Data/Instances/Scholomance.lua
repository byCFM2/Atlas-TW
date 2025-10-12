---
--- Scholomance.lua - Scholomance dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Scholomance
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- dungeon set items, and unique necromantic equipment.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Dungeon set items (Tier 0.5)
--- • Rare and epic weapon drops
--- • Unique necromantic items
--- • Key and quest item drops
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

local scholoShareLoot = {
    { id = 18681, dropRate = 4 }, -- Burial Shawl
    { id = 14633, dropRate = 4 }, -- Necropile Mantle
    { id = 14626, dropRate = 4 }, -- Necropile Robe
    { id = 14637, dropRate = 4 }, -- Cadaverous Armor
    { id = 14611, dropRate = 4 }, -- Bloodmail Hauberk
    { id = 14624, dropRate = 4 }, -- Deathbone Chestplate
    { id = 14629, dropRate = 4 }, -- Necropile Cuffs
    { id = 14640, dropRate = 4 }, -- Cadaverous Gloves
    { id = 14615, dropRate = 4 }, -- Bloodmail Gauntlets
    { id = 14622, dropRate = 4 }, -- Deathbone Gauntlets
    { id = 14636, dropRate = 4 }, -- Cadaverous Belt
    { id = 14614, dropRate = 4 }, -- Bloodmail Belt
    { id = 14620, dropRate = 4 }, -- Deathbone Girdle
    { id = 14632, dropRate = 4 }, -- Necropile Leggings
    { id = 14638, dropRate = 4 }, -- Cadaverous Leggings
    { id = 18682, dropRate = 4 }, -- Ghoul Skin Leggings
    { id = 14612, dropRate = 4 }, -- Bloodmail Legguards
    { id = 14623, dropRate = 4 }, -- Deathbone Legguards
    { id = 14631, dropRate = 4 }, -- Necropile Boots
    { id = 14641, dropRate = 4 }, -- Cadaverous Walkers
    { id = 14616, dropRate = 4 }, -- Bloodmail Boots
    { id = 14621, dropRate = 4 }, -- Deathbone Sabatons
    { id = 18684, dropRate = 4 }, -- Dimly Opalescent Ring
    { id = 23201, dropRate = 4 }, -- Libram of Divinity
    { id = 23200, dropRate = 4 }, -- Totem of Sustaining
    { id = 18680, dropRate = 4 }, -- Ancient Bone Bow
    { id = 18683, dropRate = 4 }, -- Hammer of the Vesper
}

AtlasTW.InstanceData.Scholomance = {
    Name = BZ["Scholomance"],
    Location = BZ["Western Plaguelands"],
    Level = { 45, 60 },
    Acronym = "Scholo",
    MaxPlayers = 5,
    DamageType = L["Shadow"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Argent Dawn"], loot = "ArgentDawn" }
    },
    Keys = {
        { name = L["Skeleton Key"], loot = "VanillaKeys", info = L["Key"] }
    },
    Bosses = {
        {
            id = "BloodStewardofKirtonos",
            prefix = "1)",
            name = L["Blood Steward of Kirtonos"],
            loot = {
                { id = 13523, disc = L["Used to summon boss"], dropRate = 100 }, -- Blood of Innocents
            }
        },
        { name = L["The Deed to Southshore"], color = "|cff9d9d9d" },
        {
            id = "KirtonostheHerald",
            prefix = "2)",
            name = BB["Kirtonos the Herald"],
            postfix = L["Summon"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 16734, disc = L["Warrior"]..", T0", container = { 21995 } }, -- Boots of Valor
                {},
                { id = 13960 }, -- Heart of the Fiend
                { id = 13967 }, -- Windreaver Greaves
                { id = 13955 }, -- Stoneform Shoulders
                { id = 13969 }, -- Loomguard Armbraces
                { id = 13957 }, -- Gargoyle Slashers
                { id = 13956 }, -- Clutch of Andros
                { id = 13958 }, -- Wyrmthalak's Shackles
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "JandiceBarov",
            prefix = "3)",
            name = BB["Jandice Barov"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 16701, disc = L["Warlock"]..", T0", container = { 22073 } }, -- Dreadmist Mantle
                {},
                { id = 14548 }, -- Royal Cap Spaulders
                { id = 18689 }, -- Phantasmal Cloak
                { id = 14545 }, -- Ghostloom Leggings
                { id = 18690 }, -- Wraithplate Leggings
                { id = 14541 }, -- Barovian Family Sword
                { id = 22394 }, -- Staff of Metanoia
                {},
                {},
                { id = 13523, disc = L["Used to summon boss"], dropRate = 100 }, -- Blood of Innocents
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        { name = L["Journal of Jandice Barov"], color = "|cff9d9d9d" },
        { prefix = "4)", name = L["The Deed to Tarren Mill"], color = "|cff9d9d9d" },
        {
            id = "LordBlackwood",
            name = BB["Lord Blackwood"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 23156 }, -- Blackwood's Thigh
                {},
                { id = 23132 }, -- Lord Blackwood's Blade
                { id = 23139 }, -- Lord Blackwood's Buckler
            }
        },
        {
            id = "Rattlegore",
            prefix = "5)",
            name = BB["Rattlegore"],
            postfix = L["Lower"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 16711, disc = L["Rogue"]..", T0", container = { 22003 } }, -- Shadowcraft Boots
                {},
                { id = 14539 }, -- Bone Ring Helm
                { id = 14538 }, -- Deadwalker Mantle
                { id = 18686 }, -- Bone Golem Shoulders
                { id = 14537 }, -- Corpselight Greaves
                { id = 14528 }, -- Rattlecage Buckler
                { id = 14531 }, -- Frightskull Shaft
                {},
                { id = 18782, dropRate = 40 }, -- Top Half of Advanced Armorsmithing: Volume II
                { id = 12726, container = { 12619 }, dropRate = 0 }, -- Plans: Enchanted Thorium Leggings
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 13873, disc = L["Key"], dropRate = 100 }, -- Viewing Room Key
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "DeathKnight",
            name = BB["Death Knight Darkreaver"],
            postfix = L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 18760 }, -- Necromantic Band
                {},
                { id = 18761 }, -- Oblivion's Touch
                { id = 18758 }, -- Specter's Blade
                { id = 18759 }, -- Malicious Axe
            }
        },
        {
            id = "MardukBlackpool",
            prefix = "6)",
            name = BB["Marduk Blackpool"],
            defaults = { dropRate = 7 },
            loot = {
                { id = 18692 }, -- Death Knight Sabatons
                {},
                { id = 14576 }, -- Ebon Hilt of Marduk
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "Vectus",
            name = BB["Vectus"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 18691 }, -- Dark Advisor's Pendant
                { id = 14577 }, -- Skullsmoke Pants
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "RasFrostwhisper",
            prefix = "7)",
            name = BB["Ras Frostwhisper"],
            defaults = { dropRate = 8 },
            loot = {
                { id = 16689, disc = L["Mage"]..", T0", container = { 22068 } }, -- Magister's Mantle
                {},
                { id = 14503 }, -- Death's Clutch
                { id = 14340 }, -- Freezing Lich Robes
                { id = 18693 }, -- Shivery Handwraps
                { id = 14525 }, -- Boneclenched Gauntlets
                { id = 14502 }, -- Frostbite Girdle
                { id = 14522 }, -- Maelstrom Leggings
                { id = 18694 }, -- Shadowy Mail Greaves
                { id = 18695 }, -- Spellbound Tome
                { id = 18696 }, -- Intricately Runed Shield
                { id = 13952 }, -- Iceblade Hacker
                { id = 14487 }, -- Bonechill Hammer
                { id = 13314, dropRate = 2 }, -- Alanna's Embrace
                {},
                { id = 13521, dropRate = 3, container = { 13512 } }, -- Recipe: Flask of Supreme Power
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        { name = L["The Deed to Brill"], color = "|cff9d9d9d" },
        {
            id = "Kormok",
            name = BB["Kormok"],
            postfix = L["Summon"],
            defaults = { dropRate = 20 },
            loot = {
                { name = L["Tier 0.5 Summonable"], icon = "INV_Misc_Bag_09" },
                { id = 22303 }, -- Ironweave Pants
                { id = 22326 }, -- Amalgam's Band
                { id = 22331 }, -- Band of the Steadfast Hero
                { id = 22332 }, -- Blade of Necromancy
                {},
                { id = 22333 }, -- Hammer of Divine Might
            }
        },
        {
            id = "InstructorMalicia",
            prefix = "8)",
            name = BB["Instructor Malicia"],
            loot = {
                { id = 16710, disc = L["Rogue"]..", T0", container = { 22004 }, dropRate = 4 }, -- Shadowcraft Bracers
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "DoctorTheolenKrastinov",
            prefix = "9)",
            name = BB["Doctor Theolen Krastinov"],
            loot = {
                { id = 16684, disc = L["Mage"]..", T0", container = { 22066 }, dropRate = 14 }, -- Magister's Gloves
                { id = 14617, disc = L["Shirt"], dropRate = 2 }, -- Sawbones Shirt
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                unpack(scholoShareLoot),
            }
        },
        {
            id = "LorekeeperPolkelt",
            prefix = "10)",
            name = BB["Lorekeeper Polkelt"],
            loot = {
                { id = 16705, disc = L["Warlock"]..", T0", container = { 22077 }, dropRate = 17 }, -- Dreadmist Wraps
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "TheRavenian",
            prefix = "11)",
            name = BB["The Ravenian"],
            loot = {
                { id = 16716, disc = L["Druid"]..", T0", container = { 22106 }, dropRate = 17 }, -- Wildheart Belt
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "LordAlexeiBarov",
            prefix = "12)",
            name = BB["Lord Alexei Barov"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 16722, disc = L["Paladin"]..", T0", container = { 22088 }, dropRate = 5 }, -- Lightforge Bracers
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(scholoShareLoot),
            }
        },
        { name = L["The Deed to Caer Darrow"], color = "|cff9d9d9d" },
        {
            id = "LadyIlluciaBarov",
            prefix = "13)",
            name = BB["Lady Illucia Barov"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "DarkmasterGandling",
            prefix = "14)",
            name = BB["Darkmaster Gandling"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 16693, disc = L["Priest"]..", T0", container = { 22080 } }, -- Devout Crown
                { id = 16686, disc = L["Mage"]..", T0", container = { 22065 } }, -- Magister's Crown
                { id = 16698, disc = L["Warlock"]..", T0", container = { 22074 } }, -- Dreadmist Mask
                { id = 16707, disc = L["Rogue"]..", T0", container = { 22005 } }, -- Shadowcraft Cap
                { id = 16720, disc = L["Druid"]..", T0", container = { 22109 } }, -- Wildheart Cowl
                { id = 16677, disc = L["Hunter"]..", T0", container = { 22013 } }, -- Beaststalker's Cap
                { id = 16667, disc = L["Shaman"]..", T0", container = { 22097 } }, -- Coif of Elements
                { id = 16727, disc = L["Paladin"]..", T0", container = { 22091 } }, -- Lightforge Helm
                { id = 16731, disc = L["Warrior"]..", T0", container = { 21999 } }, -- Helm of Valor
                {},
                { id = 13944, dropRate = 14 }, -- Tombstone Breastplate
                { id = 13951, dropRate = 14 }, -- Vigorsteel Vambraces
                { id = 13950, dropRate = 14 }, -- Detention Strap
                { id = 13398, dropRate = 14 }, -- Boots of the Shrieker
                { id = 22433, dropRate = 14 }, -- Don Mauricio's Band of Domination
                { id = 13938, dropRate = 14 }, -- Bonecreeper Stylus
                { id = 13953, dropRate = 14 }, -- Silent Fang
                { id = 13964, dropRate = 14 }, -- Witchblade
                {},
                { id = 13937, dropRate = 1 }, -- Headmaster's Charge
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 19276, disc = L["Darkmoon Faire Card"], dropRate = 3, container = { 19290 } }, -- Ace of Portals
                {},
                { id = 13501, dropRate = 10, container = { 13444 } }, -- Recipe: Major Mana Potion
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 14514, dropRate = 7, container = { 14513 } }, -- Pattern: Robe of the Void
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
            }
        },
        { prefix = "1')", name = L["Torch Lever"], color = "|cff00FF00" },
        { prefix = "2')", name = L["Old Treasure Chest"], color = "|cff00FF00" },
        { prefix = "3')", name = L["Alchemy Lab"], color = "|cff00FF00" },
        {
            id = "SCHOLOTrash",
            name = L["Trash Mobs"].."-"..BZ["Scholomance"],
            loot = {
                { id = 16685, disc = L["Mage"]..", T0", container = { 22062 }, dropRate = 1.5 }, -- Magister's Belt
                { id = 16702, disc = L["Warlock"]..", T0", container = { 22070 }, dropRate = 1.5 }, -- Dreadmist Belt
                { id = 16710, disc = L["Rogue"]..", T0", container = { 22004 }, dropRate = 2 }, -- Shadowcraft Bracers
                { id = 16714, disc = L["Druid"]..", T0", container = { 22108 }, dropRate = 1.75 }, -- Wildheart Bracers
                { id = 16716, disc = L["Druid"]..", T0", container = { 22106 }, dropRate = 2 }, -- Wildheart Belt
                { id = 16671, disc = L["Shaman"]..", T0", container = { 22095 }, dropRate = 1.5 }, -- Bindings of Elements
                { id = 16722, disc = L["Paladin"]..", T0", container = { 22088 }, dropRate = 3 }, -- Lightforge Bracers
                {},
                { id = 12843 }, -- Corruptor's Scourgestone
                { id = 12841 }, -- Invader's Scourgestone
                { id = 12840 }, -- Minion's Scourgestone
                {},
                { id = 20520, disc = L["Reagent"], dropRate = 25 }, -- Dark Rune
                { id = 12753, disc = L["Reagent"], dropRate = 18 }, -- Skin of Shadow
                {},
                { id = 18698, dropRate = .04 }, -- Tattered Leather Hood
                { id = 18699, dropRate = .03 }, -- Icy Tomb Spaulders
                { id = 14536, dropRate = .04 }, -- Bonebrace Hauberk
                { id = 18700, dropRate = .25 }, -- Malefic Bracers
                { id = 18702, dropRate = .02 }, -- Belt of the Ordained
                { id = 18697, dropRate = .2 }, -- Coldstone Slippers
                { id = 18701, dropRate = .4 }, -- Innervating Band
                {},
                { id = 16254, dropRate = 1 }, -- Formula: Enchant Weapon - Lifestealing
                { id = 16255, dropRate = 2 }, -- Formula: Enchant 2H Weapon - Major Spirit
                { id = 15773, dropRate = 7, container = { 15085 } }, -- Pattern: Wicked Leather Armor
                { id = 15776, dropRate = 4, container = { 15090 } }, -- Pattern: Runic Leather Armor
                {},
                { id = 13920, dropRate = 6 }, -- Healthy Dragon Scale
            }
        },
        { name = BZ["Scholomance"].." "..L["Sets"], items = "Scholo" },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
        { name = L["Tier 0/0.5 Sets"], items = "AtlasLootT0SetMenu" },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Scholomance.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
