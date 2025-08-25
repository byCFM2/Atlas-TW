-- StormwindVault.lua - Данные предметов из Хранилища Штормграда
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Хранилища Штормграда
AtlasTW.InstanceData.StormwindVault = {
    Name = BZ["Stormwind Vault"],
    Location = BZ["Stormwind City"],
    Level = {58,60},
    Acronym = "SV",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A", info = L["Entrance"] }
    },
    Bosses = {
        {
            id = "AszoshGrimflame",
            prefix = "1)",
            name = BB["Aszosh Grimflame"],
            defaults = { dropRate = 17 },
            loot = {
                {id=60504},
                {id=60419},
                {id=60425},
                {id=60434},
                {},
                {id=60431},--weap
                {id=60418},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5}
            }
        },
        {
            id = "ThamGrarr",
            prefix = "2)",
            name = BB["Tham'Grarr"],
            defaults = { dropRate = 17 },
            loot = {
                {id=60502, disc=L["Random stats"]},
                {id=60415},
                {id=60424},
                {id=60435},
                {},
                {id=60416},--weap
                {id=60417},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5}
            }
        },
        {
            id = "BlackBride",
            prefix = "3)",
            name = BB["Black Bride"],
            defaults = { dropRate = 20 },
            loot = {
                {id=60408},
                {id=60409},
                {id=60411},
                {id=60436},
                {},
                {id=60410},--weap
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5}
            }
        },
        { name = L["Tome of Arcane Intricacies and Magical Phenomenon IX"], color = "|cff9d9d9d"},
        {
            id = "Damian",
            prefix = "4)",
            name = BB["Damian"],
            defaults = { dropRate = 20 },
            loot = {
                {id=60421},
                {id=60423},
                {id=60433},
                {id=60500},
                {},
                {id=60427},--weap
                {id=60422, dropRate=1},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=41463, dropRate=100},
                {id=51217, disc=L["Transmogrification"], dropRate=5}
            }
        },
        {
            id = "VolkanCruelblade",
            prefix = "5)",
            name = BB["Volkan Cruelblade"],
            postfix = L["Optional"],
            defaults = { dropRate = 20 },
            loot = {
                {id=60412},
                {id=60414},
                {id=60432},
                {id=60503},
                {},
                {id=60413},--weap
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5}
            }
        },
        {
            id = "VaultArmoryEquipment",
            prefix = "6)",
            name = L["Arc'tiras / Vault Armory Equipment"],
            defaults = { dropRate = 25 },
            loot = {
                {id=40003},
                {id=60505},
                {id=60506},
                {id=60501},
                {},
                {id=60420},
                {id=60426},
                {id=60429},
                {id=60430},
                {},
                {id=83570, dropRate=15},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=80},
                {id=41700,dropRate=100,container={41704}},
                {id=41406, dropRate=100,container={55133,55134,55135}}

            }
        },
        {
            id = "TrashMobs",
            name = L["Trash Mobs"].."-"..BZ["Stormwind Vault"],
            defaults = { dropRate = .02 },
            loot = {
                {id=61592},
                {id=61590},
                {id=61591},
                {id=61593},
                {},
                {id=61563},
                {},
                {id=61594},
                {id=61595}
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.StormwindVault.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end