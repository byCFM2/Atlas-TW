-- RazorfenKraul Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.RazorfenKraul = {
    Name = BZ["Razorfen Kraul"],
    Location = BZ["The Barrens"],
    Level = {19,38},
    Acronym = "RFK",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = BB["Roogug"],
            color = "|cff9d9d9d",
        },
        {
            id = "RFKAggem",
            prefix = "2)",
            name = BB["Aggem Thorncurse"],
            defaults = { dropRate = 35 },
            loot = {
                {id=6681, dropRate=100},
                {},
                {id=80732},
                {id=80733},
                {},
                {id=80789, dropRate=.1},
                {},
                {id=5825, dropRate=10, container={6751,6752}}, --Treshala's Pendant
            }
        },
        {
            id = "RFKDeathSpeakerJargba",
            prefix = "3)",
            name = BB["Death Speaker Jargba"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6685},
                {id=6682},
                {id=2816},
                {},
                {id=5825, dropRate=10, container={6751,6752}}, --Treshala's Pendant
            }
        },
        {
            id = "RFKOverlordRamtusk",
            prefix = "4)",
            name = BB["Overlord Ramtusk"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6687},
                {id=6686},
                {id=80734},
                {},
                {id=5825, dropRate=10, container={6751,6752}}, --Treshala's Pendant
            }
        },
        {
            id = "RFKRazorfenSpearhide",
            name = L["Razorfen Spearhide"],
            postfix = L["Rare"],
            loot = {
                {id=6679, dropRate=80},
                {},
                {id=5825, dropRate=10, container={6751,6752}}, --Treshala's Pendant
            }
        },
        {
            id = "RFKAgathelos",
            prefix = "5)",
            name = BB["Agathelos the Raging"],
            defaults = { dropRate = 25 },
            loot = {
                {id=6690},
                {id=6691},
                {id=80736},
                {id=80735},
                {},
                {id=69170, dropRate=.5},
            }
        },
        {
            id = "RFKBlindHunter",
            prefix = "6)",
            name = BB["Blind Hunter"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6695},
                {id=6697},
                {id=6696},
            }
        },
        {
            id = "RFKCharlgaRazorflank",
            prefix = "7)",
            name = BB["Charlga Razorflank"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6693},
                {id=6694},
                {id=6692},
                {},
                {id=17008, dropRate=100, container={17042,17043,17039}}, --Small Scroll
                {},
                {id=5825, dropRate=10, container={6751,6752}}, --Treshala's Pendant
                {id=5792, dropRate=100, container={4197,6725,6742}}, --Razorflank's Medallion
                {id=5793, dropRate=100, container={4197,6725,6742}}, --Razorflank's Heart
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "RFKWillixtheImporter",
            prefix = "8)",
            name = L["Willix the Importer"],
            color = "|cff9d9d9d",
        },
        {
            id = "RFKHeralathFallowbrook",
            name = L["Heralath Fallowbrook"],
            color = "|cff9d9d9d",
        },
        {
            id = "RFKEarthcallerHalmgar",
            prefix = "9)",
            name = BB["Earthcaller Halmgar"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6689},
                {},
                {id=6688},
                {},
                {id=5825, dropRate=10, container={6751,6752}}, --Treshala's Pendant
            }
        },
        {
            id = "RFKTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .1 },
            loot = {
                {id=80789},
                {id=2264},
                {id=1488},
                {id=4438},
                {id=1978},
                {id=2039},
                {id=1727},
                {id=776},
                {id=1976},
                {id=1975},
                {id=2549},
                {},
                {id=5825, dropRate=10, container={6751,6752}}, --Treshala's Pendant
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.RazorfenKraul.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end