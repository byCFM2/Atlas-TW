---
--- DragonmawRetreat.lua - Dragonmaw Retreat instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Dragonmaw Retreat
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
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.DragonmawRetreat = {
    Name = BZ["Dragonmaw Retreat"],
    Location = BZ["Wetlands"],
    Level = { 27, 33 },
    Acronym = "DR",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"] },
        { letter = "B)"..L["Exit"] }
    },
    Keys = {
        { name = L["Lower Reserve Key"], loot = "VanillaKeys", info = "9+" },
    },
    Bosses = {
        {
            id = "DRGowlfang",
            prefix = "1)",
            name = BB["Gowlfang"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 41571 }, -- Snickerclaw
                { id = 41572 }, -- Gowlfang's Collar
                { id = 41573 }, -- Mosshide Trousers
                { id = 41574 }, -- Gnoll Battle Gloves
                { id = 41575 }, -- Gnoll Hide Cuffs
                {},
                { id = 41829, container = { 41830 } }, -- Head of Gowlfang
            }
        },
        {
            name = BB["Bogpaw Truthsay"],
            color = "|cff9d9d9d",
        },
        {
            id = "DRCavernwebBroodmother",
            prefix = "2)",
            name = BB["Cavernweb Broodmother"],--62066
            postfix = L["Lower"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 58039 }, -- Fang of the Broodmother
                { id = 58040 }, -- Cavernweb Cuffs
                { id = 58041 }, -- Fangmother Essence
                { id = 58042 }, -- Venomtouched Gloves
                { id = 58043 }, -- Cavern Silk Trousers
                {},
                { id = 37009, dropRate = 10 }, -- Cavernweb Hatchling
                { id = 41834, dropRate = 100 }, -- Broodmother's Sac
            }
        },
        {
            id = "DRWebMasterTorkon",--29
            prefix = "3)",
            name = BB["Web Master Torkon"],
            postfix = L["Lower"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 41566 }, -- Webmaster's Ring
                { id = 41567 }, -- Cavernrock Stompers
                { id = 41568 }, -- Torkon's Belt
                { id = 41569 }, -- Tattered Orcish Shawl
                { id = 41570 }, -- Idol of Nethalakk
                {},
                { id = 41874, disc = L["Quest Item"] }, -- Fragment of Algoron
            }
        },
        {
            id = "DRGarlockFlamekeeper",--31
            prefix = "4)",
            name = BB["Garlock Flamekeeper"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41578 }, -- Flamekeeper's Robe
                { id = 41579 }, -- Sash of Flamebinding
                { id = 41580 }, -- Udor's Pendant
                { id = 41581 }, -- The Bane of Althazz
            }
        },
        {
            id = "DRHalganRedbrand",--31
            prefix = "5)",
            name = BB["Halgan Redbrand"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58044 }, -- Ceremonial Dwarven Staff
                { id = 58045 }, -- Ancient Legplates
                { id = 58046 }, -- Shield of Galoraz
                { id = 58047 }, -- Grasp of Ancestors
                {},
                { id = 76, dropRate = 6, container = { 156 } }, -- Plans: Refined Dwarven Necklace
                { id = 77, dropRate = 6, container = { 56112 } }, -- Plans: Ancient Dwarven Gemstone
            }
        },
        {
            name = L["Pedestal of Unity"],
            color = "|cff9d9d9d",
        },
        {
            id = "DRSlagfistDestroyer",--30
            prefix = "6)",
            name = BB["Slagfist Destroyer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41558 }, -- The Slagbinder
                { id = 41559 }, -- Rock Carver
                { id = 41560 }, -- Shalestone Amulet
                { id = 41719 }, -- Stonelink Leggings
            }
        },
        {
            id = "DROverlordBlackheart",--30
            prefix = "7)",
            name = BB["Overlord Blackheart"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41726 }, -- Slaver's Gauntlets
                { id = 41725 }, -- Dragonmaw Battle Bow
                { id = 41724 }, -- Dragonmaw Shoulders
                { id = 41727 }, -- Blackheart Armor
                {},
                { id = 74, dropRate = 6, container = { 58112 } }, -- Pattern: Dragonmaw Gloves
                {},
                { id = 41841, dropRate = 100, container = { 41842, 41843, 41844 } }, -- Blackheart's Head
            }
        },
        {
            id = "DRElderHollowblood",--32
            prefix = "8)",
            name = BB["Elder Hollowblood"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41720 }, -- Earthweaver Kilt
                { id = 41721 }, -- Bulwark of the Old Horde
                { id = 41722 }, -- Rockspeaker Bracers
                { id = 41723 }, -- Cudgel of Binding
                {},
                { id = 31, dropRate = 6 }, -- Formula: Enchant Boots - Lesser Intellect
            }
        },
        {
            id = "DRChestofDathronag",--object
            prefix = "a)",
            name = L["Chest of Dathronag"],
            color = "|cff00FF00",
            loot = {
                { id = 41875, disc = L["Quest Item"], dropRate = 100 }, -- Fragment of Dathronag
            }
        },
        {
            id = "DRSearistrasz",--32
            prefix = "9)",
            name = BB["Searistrasz"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41561 }, -- Flame of Eternal Searing
                { id = 41562 }, -- Flamescale Pike
                { id = 41563 }, -- Flamelash Boots
                { id = 41564 }, -- Emberclaw
                { id = 41565 }, -- Cloak of Draconic Madness
            }
        },
        {
            id = "DRZuluhedtheWracked",--32
            prefix = "10)",
            name = BB["Zuluhed the Wracked"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 41845 }, -- Algo'rath the Unbinder
                { id = 41846 }, -- Cindermaw Leggings
                { id = 41847 }, -- Chieftain's Baton
                { id = 41848 }, -- Dragontrance Ring
                { id = 58099 }, -- Dragonmaw Helmet
                {},
                { id = 69, container = { 65 }, dropRate = 4.5 }, -- Pattern: Dragonmaw Armor Kit
                { id = 71, container = { 66 }, dropRate = 4.5 }, -- Plans: Gold Belt Buckle
                {},
                { id = 41895, dropRate = 1.5, container = { 58234, 58235, 58236 } }, -- Shard of the Demon Soul
                {},
                { id = 41711, container = { 41713, 41714, 41715 }, dropRate = 100 }, -- Letter from Korlag Doomsong
                { id = 41981, container = { 41982, 41713, 41714, 41715 }, dropRate = 100 }, -- Letter from Korlag Doomsong
            }
        },
        {
            id = "DRTrash",
            name = L["Trash Mobs"].."-"..BZ["Dragonmaw Retreat"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 58102 }, -- Dragonmaw Bulwark
                { id = 58103 }, -- Drakeflame Girdle
                { id = 58104 }, -- Magmascarred Cloak
                { id = 58105 }, -- Bindings of the Forebearer
                { id = 58106 }, -- Coal-Dusted Worker's Vest
                { id = 58107 }, -- Ancestor's Wisdom
                { id = 58108 }, -- Drakeskin Gloves
                { id = 58109 }, -- Kindling Signet
                { id = 58110 }, -- Lantern-Helm of the Deep
                { id = 58111, dropRate = 1.35 }, -- Dragonmaw Hauberk
                { id = 58113, dropRate = 1.35 }, -- Dragonmaw Bracers
                { id = 58114, dropRate = 1.35 }, -- Dragonmaw Leggings
                { id = 58115, dropRate = 1.35 }, -- Dragonmaw Greaves
                { id = 70119, container = { 56046 } }, -- Plans: Circlet of Dampening
                { id = 41825, container = { 41826, 41827, 41828 }, dropRate = 50 }, -- Stone Golem Runestone from Crumbling Stone Golem
            },
        },
        { name = BIS["Dragonmaw Battlegarb"], items = "DragonmawBattlegarb" },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.DragonmawRetreat.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
