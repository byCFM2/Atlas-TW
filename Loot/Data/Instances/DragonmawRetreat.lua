-- StormwroughtRuins.lua - Данные предметов из Stormwrought Ruins
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Stormwrought Ruins
AtlasTW.InstanceData.DragonmawRetreat = {
    Name = BZ["Dragonmaw Retreat"],
    Location = BZ["Wetlands"],
    Level = {27,33},
    Acronym = "DR",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"] },
        { letter = "B)"..L["Exit"] }
    },
    Keys = {
        { name = L["Lower Reserve Key"], loot = "VanillaKeys", info = "8+" },
    },
    Bosses = {
        {
            id = "DRGowlfang",
            prefix = "1)",
            name = BB["Gowlfang"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 41571 }, --Snickerclaw
                { id = 41572 }, --Gowlfang's Collar
                { id = 41573 }, --Mosshide Trousers
                { id = 41574 }, --Gnoll Battle Gloves
                { id = 41575 }, --Gnoll Hide Cuffs
                {},
                { id = 41829, container={41830} }, --Head of Gowlfang
            }
        },
        {
            name = BB["Bogpaw Truthsay"],
            color = "|cff9d9d9d",
        },
        {
            id = "DRCavernwebBroodmother",
            prefix = "2)",
            name = BB["Cavernweb Broodmother"], --62066
            postfix = L["Lower"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 58039 }, --Fang of the Broodmother
                { id = 58040 }, --Cavernweb Cuffs
                { id = 58041 }, --Fangmother Essence
                { id = 58042 }, --Venomtouched Gloves
                { id = 58043 }, --Cavern Silk Trousers
                {},
                { id = 37009, dropRate=10 }, --Cavernweb Hatchling
                { id = 41834, dropRate=100 }, --Broodmother's Sac
            }
        },
        {
            id = "DRWebMasterTorkon", --29
            prefix = "3)",
            name = BB["Web Master Torkon"],
            postfix = L["Lower"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 41566 }, --Webmaster's Ring
                { id = 41567 }, --Cavernrock Stompers
                { id = 41568 }, --Torkon's Belt
                { id = 41569 }, --Tattered Orcish Shawl
                { id = 41570 }, --Idol of Nethalakk
                {},
                { id = 41874, disc=L["Quest Item"] }, --Fragment of Algoron
            }
        },
        {
            id = "DRHalganRedbrand", --31
            prefix = "4)",
            name = BB["Halgan Redbrand"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58044 }, --Ceremonial Dwarven Staff
                { id = 58045 }, --Ancient Legplates
                { id = 58046 }, --Shield of Galoraz
                { id = 58047 }, --Grasp of Ancestors
                {},
                { id = 76, dropRate=6, container={156} }, --Plans: Refined Dwarven Necklace
                { id = 77, dropRate=6, container={56112} }, --Plans: Ancient Dwarven Gemstone
            }
        },
        {
            name = L["Pedestal of Unity"],
            color = "|cff9d9d9d",
        },
        {
            id = "DRSlagfistDestroyer", --30
            prefix = "5)",
            name = BB["Slagfist Destroyer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41558 }, --The Slagbinder
                { id = 41559 }, --Rock Carver
                { id = 41560 }, --Shalestone Amulet
                { id = 41719 }, --Stonelink Leggings
            }
        },
        {
            id = "DRGarlockFlamekeeper", --31
            prefix = "6)",
            name = BB["Garlock Flamekeeper"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41578 }, --Flamekeeper's Robe
                { id = 41579 }, --Sash of Flamebinding
                { id = 41580 }, --Udor's Pendant
                { id = 41581 }, --The Bane of Althazz
            }
        },
        {
            id = "DRElderHollowblood", --32
            prefix = "7)",
            name = BB["Elder Hollowblood"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41720 }, --Earthweaver Kilt
                { id = 41721 }, --Bulwark of the Old Horde
                { id = 41722 }, --Rockspeaker Bracers
                { id = 41723 }, --Cudgel of Binding
                {},
                { id = 31, dropRate=6 }, --Formula: Enchant Boots - Lesser Intellect
            }
        },
        {
            id = "DRChestofDathronag", --object
            prefix = "a)",
            name = L["Chest of Dathronag"],
            color = "|cff00FF00",
            loot = {
                { id = 41875, disc=L["Quest Item"], dropRate=100 }, --Fragment of Dathronag
            }
        },
        {
            id = "DRSearistrasz", --32
            prefix = "8)",
            name = BB["Searistrasz"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 41561 }, --Flame of Eternal Searing
                { id = 41562 }, --Flamescale Pike
                { id = 41563 }, --Flamelash Boots
                { id = 41564 }, --Emberclaw
                { id = 41565 }, --Cloak of Draconic Madness
            }
        },
        {
            id = "DRZuluhedtheWracked", --32
            prefix = "9)",
            name = BB["Zuluhed the Wracked"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 41845 }, --Algo'rath the Unbinder
                { id = 41846 }, --Cindermaw Leggings
                { id = 41847 }, --Chieftain's Baton
                { id = 41848 }, --Dragontrance Ring
                { id = 58099 }, --Dragonmaw Helmet
                {},
                { id = 69, container={65}, dropRate = 4.5 }, --Pattern: Dragonmaw Armor Kit
                { id = 71, container={66}, dropRate = 4.5 }, --Plans: Gold Belt Buckle
                {},
                { id = 41895, dropRate = 1.5 }, --Shard of the Demon Soul
                {},
                { id = 41711, dropRate = 100 }, --Letter from Korlag Doomsong
                { id = 41981, container = {41982}, dropRate = 100 }, --Letter from Korlag Doomsong 'ally'
            }
        },
        {
            id = "DRTrash",
            name = L["Trash Mobs"].."-"..BZ["Dragonmaw Retreat"],
            defaults = { dropRate = .1 },
            loot = {
                { id = 70119, container={56046} }, --Plans: Circlet of Dampening
                { id = 74, dropRate = 6, container={ 58112 } }, --Pattern: Dragonmaw Gloves --Overlord Blackheart
            }
        },
        { name = BIS["Dragonmaw Battlegarb"], items = "DragonmawBattlegarb" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.DragonmawRetreat.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end