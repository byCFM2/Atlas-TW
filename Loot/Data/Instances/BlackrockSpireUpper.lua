---
--- BlackrockSpireUpper.lua - Upper Blackrock Spire raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Upper Blackrock Spire
--- 10-player raid instance. It includes all boss encounters, rare drops,
--- and raid-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Rare and epic item drops
--- • Raid entrance and layout data
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

AtlasTW.InstanceData.BlackrockSpireUpper = {
    Name = BZ["Upper Blackrock Spire"],
    Location = BZ["Blackrock Mountain"],
    Level = { 55, 60 },
    Acronym = "UBRS",
    MaxPlayers = 10,
    DamageType = L["Fire"], L["Physical"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] },
        { letter = "B)", info = BZ["Lower Blackrock Spire"] },
        { letter = "C-E)", info = L["Connections"] }
    },
    Keys = {
        { name = "Seal of Ascension", loot = "VanillaKeys" },
        { name = "Brazier of Invocation", loot = "VanillaKeys", info = L["Tier 0.5 Summon"] }
    },
    Bosses = {
        {
            id = "UBRSEmberseer",
            prefix = "1)",
            name = BB["Pyroguard Emberseer"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16672, disc = L["Shaman"]..", ".."T0" }, -- Gauntlets of Elements
                {},
                { id = 12929 }, -- Emberfury Talisman
                { id = 12927 }, -- Truestrike Shoulders
                { id = 12905 }, -- Wildfire Cape
                { id = 12926 }, -- Flaming Band
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 23320, disc = L["Book"], dropRate = 8 }, -- Tablet of Flame Shock VI
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "UBRSSolakar",
            prefix = "2)",
            name = BB["Solakar Flamewreath"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16695, disc = L["Priest"]..", ".."T0" }, -- Devout Mantle
                {},
                { id = 12609 }, -- Polychromatic Visionwrap
                { id = 12603 }, -- Nightbrace Tunic
                { id = 12589 }, -- Dustfeather Sash
                { id = 12606 }, -- Crystallized Girdle
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 18657, dropRate = 6, container = { 18638 } }, -- Schematic: Hyper-Radiant Flame Reflector
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "UBRSFlame",
            name = L["Father Flame"],
            loot = {
                { id = 13371, dropRate = .08 }, -- Father Flame
            }
        },
        {
            prefix = "3)",
            name = L["Darkstone Tablet"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Doomrigger's Coffer"],
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSRunewatcher",
            prefix = "4)",
            name = BB["Jed Runewatcher"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 12604 }, -- Starfire Tiara
                {},
                { id = 12930 }, -- Briarwood Reed
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                {},
                { id = 12605 }, -- Serpentine Skuller
            }
        },
        {
            id = "UBRSAnvilcrack",
            prefix = "5)",
            name = BB["Goraluk Anvilcrack"],
            postfix = L["Rare"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 13502 }, -- Handcrafted Mastersmith Girdle
                { id = 13498 }, -- Handcrafted Mastersmith Leggings
                { id = 18047 }, -- Flame Walkers
                { id = 18048 }, -- Mastersmith's Hammer
                {},
                { id = 12834, container = { 12790 } }, -- Plans: Arcanite Champion
                { id = 12837, container = { 12794 } }, -- Plans: Masterwork Stormhammer
                { id = 12728, container = { 12641 } }, -- Plans: Invulnerable Mail
                {},
                { id = 18779, dropRate = 15 }, -- Bottom Half of Advanced Armorsmithing: Volume I
                { id = 12727, container = { 12618 } }, -- Plans: Enchanted Thorium Breastplate
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                {},
                { name = L["Small Rocket Recipes"] },
                { id = 12806, dropRate = 100 }, -- Unforged Rune Covered Breastplate
                { id = 12696, container = { 12628 } }, -- Plans: Demon Forged Breastplate
            }
        },
        {
            id = "UBRSRend",
            prefix = "6)",
            name = BB["Warchief Rend Blackhand"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 12587, dropRate = 23 }, -- Eye of Rend
                { id = 12588 }, -- Bonespike Shoulder
                { id = 12936 }, -- Battleborn Armbraces
                { id = 18104 }, -- Feralsurge Girdle
                { id = 12935, dropRate = 23 }, -- Warmaster Legguards
                { id = 18102, dropRate = 23 }, -- Dragonrider Boots
                { id = 22247 }, -- Faith Healer's Boots
                {},
                { id = 18103, dropRate = 23 }, -- Band of Rumination
                {},
                { id = 12583, dropRate = 8 }, -- Blackhand Doomsaw
                { id = 12940, dropRate = 8 }, -- Dal'Rend's Sacred Charge
                { id = 12939, dropRate = 8 }, -- Dal'Rend's Tribal Guardian
                { id = 12590, dropRate = 1 }, -- Felstriker
                {},
                { id = 16733, disc = L["Warrior"]..", ".."T0" }, -- Spaulders of Valor
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "UBRSGyth",
            name = BB["Gyth"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 16669, disc = L["Shaman"]..", ".."T0" }, -- Pauldrons of Elements
                {},
                { id = 22225 }, -- Dragonskin Cowl
                { id = 12960 }, -- Tribal War Feathers
                { id = 12953 }, -- Dragoneye Coif
                { id = 12952 }, -- Gyth's Skull
                {},
                { id = 13522, dropRate = 3, container = { 13513 } }, -- Recipe: Flask of Chromatic Resistance
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 12871, disc = L["Quest Item"], dropRate = 4 }, -- Chromatic Carapace
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            prefix = "7)",
            name = L["Awbee"],
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSBeast",
            prefix = "8)",
            name = BB["The Beast"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 16729, disc = L["Paladin"]..", ".."T0", dropRate = 10 }, -- Lightforge Spaulders
                {},
                { id = 12967 }, -- Bloodmoon Cloak
                { id = 12968 }, -- Frostweaver Cape
                { id = 12966 }, -- Blackmist Armguards
                { id = 12965 }, -- Spiritshroud Leggings
                { id = 12963 }, -- Blademaster Leggings
                { id = 12964 }, -- Tristam Legguards
                { id = 22311 }, -- Ironweave Boots
                {},
                { id = 12709 }, -- Finkle's Skinner
                { id = 12969 }, -- Seeping Willow
                {},
                { id = 24101, disc = L["Book"], dropRate = 13 }, -- Book of Ferocious Bite VI
                { id = 19227, disc = L["Darkmoon Faire Card"], dropRate = 5, container = { 19288 } }, -- Ace of Beasts
                { id = 12731, disc = L["Misc"], dropRate = 2 }, -- Pristine Hide of the Beast
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "UBRSValthalak",
            name = BB["Lord Valthalak"],
            postfix = L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                { name = L["Tier 0.5 Summonable"], icon = "INV_Misc_Bag_09" },
                { id = 22302 }, -- Ironweave Cowl
                { id = 22340 }, -- Pendant of Celerity
                { id = 22337 }, -- Shroud of Domination
                { id = 22343 }, -- Handguards of Savagery
                { id = 22342 }, -- Leggings of Torment
                {},
                { id = 22339 }, -- Rune Band of Wizardry
                {},
                { id = 22336 }, -- Draconian Aegis of the Legion
                { id = 22335 }, -- Lord Valthalak's Staff of Command
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            name = L["Finkle Einhorn"],
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSDrakkisath",
            prefix = "9)",
            name = BB["General Drakkisath"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 22267, dropRate = 25 }, -- Spellweaver's Turban
                { id = 13141, dropRate = 25 }, -- Tooth of Gnarr
                { id = 22269, dropRate = 25 }, -- Shadow Prowler's Cloak
                { id = 13142, dropRate = 25 }, -- Brigam Girdle
                { id = 13098, dropRate = 25 }, -- Painweaver Band
                { id = 22268, dropRate = 25 }, -- Draconic Infused Emblem
                { id = 22253, dropRate = 25 }, -- Tome of the Lost
                { id = 13090, dropRate = 10 }, -- Breastplate of the Chosen
                {},
                { id = 12602, dropRate = 25 }, -- Draconian Deflector
                { id = 12592, dropRate = 1 }, -- Blackblade of Shahram
                {},
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 15730, dropRate = 4, container = { 15047 } }, -- Pattern: Red Dragonscale Breastplate
                {},
                { id = 13519, dropRate = 3, container = { 13510 } }, -- Recipe: Flask of the Titans
                { id = 16690, disc = L["Priest"]..", ".."T0" }, -- Devout Robe
                { id = 16688, disc = L["Mage"]..", ".."T0" }, -- Magister's Robes
                { id = 16700, disc = L["Warlock"]..", ".."T0" }, -- Dreadmist Robe
                { id = 16721, disc = L["Rogue"]..", ".."T0" }, -- Shadowcraft Tunic
                { id = 16706, disc = L["Druid"]..", ".."T0" }, -- Wildheart Vest
                { id = 16674, disc = L["Hunter"]..", ".."T0" }, -- Beaststalker's Tunic
                { id = 16666, disc = L["Shaman"]..", ".."T0" }, -- Vest of Elements
                { id = 16726, disc = L["Paladin"]..", ".."T0" }, -- Lightforge Breastplate
                { id = 16730, disc = L["Warrior"]..", ".."T0" }, -- Breastplate of Valor
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], quantity = 3, dropRate = 100 }, -- Fashion Coin
            }
        },
        {
            name = L["Drakkisath's Brand"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "10)",
            name = BZ["Blackwing Lair"],
            postfix = "BWL",
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSTrash",
            name = L["Trash Mobs"].."-"..BZ["Upper Blackrock Spire"],
            defaults = { dropRate = 2 },
            loot = {
                { id = 13260, dropRate = .05 }, -- Wind Dancer Boots
                {},
                { id = 16696, disc = L["Priest"]..", ".."T0", dropRate = 2.25 }, -- Devout Belt
                { id = 16683, disc = L["Mage"]..", ".."T0", dropRate = 1.5 }, -- Magister's Bindings
                { id = 16703, disc = L["Warlock"]..", ".."T0", dropRate = 2.5 }, -- Dreadmist Bracers
                { id = 16713, disc = L["Rogue"]..", ".."T0" }, -- Shadowcraft Belt
                { id = 16681, disc = L["Hunter"]..", ".."T0", dropRate = 1.75 }, -- Beaststalker's Bindings
                { id = 16680, disc = L["Hunter"]..", ".."T0", dropRate = 1.5 }, -- Beaststalker's Belt
                { id = 16673, disc = L["Shaman"]..", ".."T0" }, -- Cord of Elements
                { id = 16735, disc = L["Warrior"]..", ".."T0" }, -- Bracers of Valor
                {},
                { id = 24102, disc = L["Book"], dropRate = 10 }, -- Manual of Eviscerate IX
                {},
                { id = 16247, dropRate = 3 }, -- Formula: Enchant 2H Weapon - Superior Impact
            }
        },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
        { name = BIS["Dal'Rend's Arms"], items = "DalRend" },
        { name = L["Tier 0/0.5 Sets"], items = "AtlasLootT0SetMenu" },
    }
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockSpireUpper.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
