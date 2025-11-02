---
--- Maraudon.lua - Maraudon dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Maraudon
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

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.MaraudonEnt = {
    Name = BZ["Maraudon"].." ("..L["Entrance"]..")",
    Location = BZ["Desolace"],
    Acronym = "Mara",
    Entrances = {
        { letter = "A", info = L["Entrance"] },
        { letter = "B", info = BZ["Maraudon"] .. " (" .. L["Purple"] .. ")" },
        { letter = "C", info = BZ["Maraudon"] .. " (" .. L["Orange"] .. ")" },
        { letter = "D", info = BZ["Maraudon"] .. " (" .. L["Portal"] .. ")" },
    },
    Bosses = {
        {
            id = "MARANamelessProphet",
            name = L["The Nameless Prophet"],
            loot = {
                { id = 17757, disc = L["Quest Item"], dropRate = 100, container = { 17774 } }, -- Amulet of Spirits
            }
        },
        {
            id = "MARAKhanKolk",
            prefix = "1)",
            name = BB["Kolk"],
            loot = {
                { id = 17761, disc = L["Quest Item"], dropRate = 100, container = { 17774 } }, -- Gem of the First Khan
            }
        },
        {
            id = "MARAKhanGelk",
            prefix = "2)",
            name = BB["Gelk"],
            loot = {
                { id = 17762, disc = L["Quest Item"], dropRate = 100, container = { 17774 } }, -- Gem of the Second Khan
            }
        },
        {
            id = "MARAKhanMagra",
            prefix = "3)",
            name = BB["Magra"],
            loot = {
                { id = 17763, disc = L["Quest Item"], dropRate = 100, container = { 17774 } }, -- Gem of the Third Khan
            }
        },
        { prefix = "4)", name = BB["Cavindra"], color = "|cff9d9d9d" },
        { prefix = "5)", name = BB["Cursed Centaur"], postfix = L["Rare"]..", "..L["Varies"], color = "|cff9d9d9d" },
    }
}

AtlasTW.InstanceData.Maraudon = {
    Name = BZ["Maraudon"],
    Location = BZ["Desolace"],
    Level = { 35, 55 },
    Acronym = "Mara",
    MaxPlayers = 5,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A", info = L["Orange"] },
        { letter = "B", info = L["Purple"] },
        { letter = "C", info = L["Portal"] }
    },
    Keys = {
        { name = L["Scepter of Celebras"], loot = "VanillaKeys", info = L["Portal"] }
    },

    Bosses = {
        {
            id = "MARAKhanVeng",
            prefix = "1)",
            name = L["Veng"],
            loot = {
                { id = 17765, disc = L["Quest Item"], dropRate = 100, container = { 17774 } }, -- Gem of the Fifth Khan
            }
        },
        {
            id = "MARANoxxion",
            prefix = "2)",
            name = BB["Noxxion"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 17746 }, -- Noxxion's Shackles
                { id = 17744 }, -- Heart of Noxxion
                {},
                { id = 17745 }, -- Noxious Shooter
                { id = 17702, dropRate = 100, container = { 17191 } }, -- Celebrian Rod
            }
        },
        {
            id = "MARARazorlash",
            prefix = "3)",
            name = BB["Razorlash"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 17749 }, -- Phytoskin Spaulders
                { id = 17748 }, -- Vinerot Sandals
                { id = 17750 }, -- Chloromesh Girdle
                { id = 17751 }, -- Brusslehide Leggings
                {},
                { id = 60780, dropRate = 3, container = { 65022 } }, -- Pattern: Breastplate of the Earth
                {},
                { id = 51802, dropRate = 8 }, -- Idol of Evergrowth
            }
        },
        {
            id = "MARAKhanMaraudos",
            prefix = "4)",
            name = L["Maraudos"],
            loot = {
                { id = 17764, disc = L["Quest Item"], dropRate = 100, container = { 17774 } }, -- Gem of the Fourth Khan
            }
        },
        {
            id = "MARALordVyletongue",
            prefix = "5)",
            name = BB["Lord Vyletongue"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 17755 }, -- Satyrmane Sash
                { id = 17754 }, -- Infernal Trickster Leggings
                {},
                { id = 17752 }, -- Satyr's Lash
                {},
                { id = 17684, dropRate = 80, container = { 17775, 17776, 17777, 17779 } }, -- Theradric Crystal Carving
                { id = 61748, dropRate = 100, container = { 61517 } }, -- Harness of Chimaeran
                { id = 17703, dropRate = 100, container = { 17191 } }, -- Celebrian Diamond
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "MARAMeshloktheHarvester",
            prefix = "6)",
            name = BB["Meshlok the Harvester"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 17767 }, -- Bloomsprout Headpiece
                { id = 17741 }, -- Nature's Embrace
                { id = 17742 }, -- Fungus Shroud Armor
                {},
                { id = 60780, dropRate = 10, container = { 65022 } }, -- Pattern: Breastplate of the Earth
            }
        },
        {
            id = "MARACelebrastheCursed",
            prefix = "7)",
            name = BB["Celebras the Cursed"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 17740 }, -- Soothsayer's Headdress
                { id = 17739 }, -- Grovekeeper's Drape
                { id = 17738 }, -- Claw of Celebras
                {},
                { id = 60780, dropRate = 3, container = { 65022 } }, -- Pattern: Breastplate of the Earth
                {},
                { id = 17684, dropRate = 80, container = { 17775, 17776, 17777, 17779 } }, -- Theradric Crystal Carving
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "MARALandslide",
            prefix = "8)",
            name = BB["Landslide"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 17734 }, -- Helm of the Mountain
                { id = 17736 }, -- Rockgrip Gauntlets
                { id = 17737 }, -- Cloud Stone
                { id = 17943 }, -- Fist of Stone
                {},
                { id = 17684, dropRate = 80, container = { 17775, 17776, 17777, 17779 } }, -- Theradric Crystal Carving
                { id = 41002, dropRate = 100, container = { 40080 } }, -- Heart of Landslide
                { id = 41356, disc = BS["Gemology"], dropRate = 100 }, -- Marbled Stone Slab
            }
        },
        {
            id = "MARATinkererGizlock",
            prefix = "9)",
            name = BB["Tinkerer Gizlock"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 17718 }, -- Gizlock's Hypertech Buckler
                { id = 17717 }, -- Megashot Rifle
                { id = 17719 }, -- Inventor's Focal Sword
                {},
                { id = 40083, dropRate = 8, container = { 41327 } }, -- Schematic: Jewelry Scope
                { id = 51809, dropRate = 8, container = { 60098 } }, -- Schematic: Hypertech Essentials
                {},
                { id = 17684, dropRate = 80, container = { 17775, 17776, 17777, 17779 } }, -- Theradric Crystal Carving
            }
        },
        {
            id = "MARARotgrip",
            prefix = "10)",
            name = BB["Rotgrip"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 17732 }, -- Rotgrip Mantle
                { id = 17728 }, -- Albino Crocscale Boots
                { id = 17730 }, -- Gatorbite Axe
                {},
                { id = 17684, dropRate = 80, container = { 17775, 17776, 17777, 17779 } }, -- Theradric Crystal Carving
            }
        },
        {
            id = "MARAPrincessTheradras",
            prefix = "11)",
            name = BB["Princess Theradras"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 17780, dropRate = 1 }, -- Blade of Eternal Darkness
                {},
                { id = 17715 }, -- Eye of Theradras
                { id = 17707 }, -- Gemshard Heart
                { id = 17714 }, -- Bracers of the Stone Princess
                { id = 17711 }, -- Elemental Rockridge Leggings
                { id = 17713 }, -- Blackstone Ring
                {},
                { id = 17710 }, -- Charstone Dirk
                { id = 17766 }, -- Princess Theradras' Scepter
                {},
                { id = 17684, dropRate = 80, container = { 17775, 17776, 17777, 17779 } }, -- Theradric Crystal Carving
                { id = 61458, dropRate = 100 }, -- 52nd Package
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "MARAElderSplitrock",
            prefix = "12)",
            name = L["Elder Splitrock"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            id = "MARATrash",
            name = L["Trash Mobs"].."-"..BZ["Maraudon"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 80756 }, -- Vinebound Headband
                { id = 80753 }, -- Vileplate Pauldrons
                { id = 80752 }, -- Cape of Unbridled Growth
                { id = 80755 }, -- Befouled Handwraps
                { id = 80749 }, -- Pysan's Lost Girdle
                { id = 80754 }, -- Earthsong Treaders
                {},
                { id = 62008 }, -- Thornpod
                {},
                { id = 80750 }, -- Thornfist
                { id = 80751 }, -- Thornclad Warhammer
                { id = 80748 }, -- Corrupter's Focus
                {},
                { id = 60780, dropRate = .5, container = { 65022 } }, -- Pattern: Breastplate of the Earth
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Maraudon.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.MaraudonEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
