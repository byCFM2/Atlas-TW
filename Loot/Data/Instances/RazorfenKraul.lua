-- RazorfenKraul Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

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
            id = "RFKRoogug",
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
                {id=6681, disc=L["Quest Item"], dropRate=100},
                {},
                {id=80732},
                {id=80733},
            }
        },
        {
            id = "RFKDeathSpeakerJargba",
            prefix = "3)",
            name = BB["Death Speaker Jargba"],
            defaults = { dropRate = 33 },
            loot = {
                {id=2816},
                {id=6685},
                {id=6682},
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
            }
        },
        {
            id = "RFKRazorfenSpearhide",
            name = L["Razorfen Spearhide"],
            postfix = L["Rare"],
            color = "|cff9d9d9d",
            loot = {
                {id=6679, dropRate=80},
            }
        },
        {
            id = "RFKAgathelos",
            prefix = "5)",
            name = BB["Agathelos the Raging"],
            defaults = { dropRate = 25 },
            loot = {
                {id=6691},
                {id=6690},
                {},
                {id=80736},
                {id=80735},
                {},
                {id=69170, disc=L["Pet"]},
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
                {id=17008, disc=L["Quest Item"], dropRate=100},
                {id=17043, disc=L["Quest Reward"]},
                {id=17042, disc=L["Quest Reward"]},
                {id=17039, disc=L["Quest Reward"]},
                {},
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
            }
        },
        {
            id = "RFKTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=80789, dropRate=.02},
                {id=2264, dropRate=.02},
                {id=1488},
                {id=4438},
                {id=1978, dropRate=.02},
                {id=2039, dropRate=.02},
                {id=1727, dropRate=.02},
                {id=776},
                {id=1976, dropRate=.02},
                {id=1975, dropRate=.02},
                {id=2549, dropRate=.02},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.RazorfenKraul.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end