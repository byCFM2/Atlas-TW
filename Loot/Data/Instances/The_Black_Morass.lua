-- The_Black_Morass.lua - Данные предметов из Черной Топи
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Черной Топи
AtlasTW.InstanceData.TheBlackMorass = {
    Name = BZ["Caverns of Time: Black Morass"],
    Location = BZ["Tanaris"],
    Level = {58,60},
    Acronym = "BM",
    Attunement = false,
    MaxPlayers = 5,
    DamageType = L["All"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] },
        { letter = "B) " .. L["Connection"] }
    },
    Bosses = {
        {
            id = "COTBMChronar",
            prefix = "1)",
            name = BB["Chronar"],
            defaults = { dropRate = 17 },
            loot = {
                {id=50203, disc=L["Quest Item"], dropRate=100},
                {},
                {id=61016},
                {id=61018},
                {id=61019},
                {id=61036},
                {id=61047},
                {id=61048},
                {},
                {id=60496, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "COTBMEpidamu",
            prefix = "2)",
            name = BB["Epidamu"],
            defaults = { dropRate = 13 },
            loot = {
                {id=50203, disc=L["Quest Item"], dropRate=100},
                {},
                {id=50431},
                {id=61032},
                {id=61041},
                {id=61045},
                {id=61055},
                {id=61056},
                {id=61700},
                {id=61698, disc=L["Shaman"]},
            }
        },
        {
            id = "COTBMDriftingAvatar",
            prefix = "3)",
            name = BB["Drifting Avatar of Sand"],
            defaults = { dropRate = 14 },
            loot = {
                {id=50203, disc=L["Quest Item"], dropRate=100},
                {},
                {id=61015},
                {id=61024},
                {id=61033},
                {id=61038},
                {id=61042},
                {id=61044},
                {id=61057},
                {},
                {id=61020, dropRate=2},
            }
        },
        {
            id = "COTBMTimeLordEpochronos",
            prefix = "4)",
            name = BB["Time-Lord Epochronos"],
            defaults = { dropRate = 12 },
            loot = {
                {id=50203, disc=L["Quest Item"], dropRate=100},
                {},
                {id=50428},
                {id=50430},
                {id=61017},
                {id=61021},
                {id=61028},
                {id=61054},
                {id=61058},
                {id=61022},
                {},
                {id=61049, dropRate=0.95},
            }
        },
        {
            id = "COTBMMossheart",
            prefix = "5)",
            name = BB["Mossheart"],
            defaults = { dropRate = 17 },
            loot = {
                {id=50203, disc=L["Quest Item"], dropRate=100},
                {},
                {id=61050},
                {id=61051},
                {id=61059},
                {id=61060},
                {id=61061},
                {id=61062},
            }
        },
        {
            id = "COTBMAntnormi",
            prefix = "6)",
            name = BB["Antnormi"],
            defaults = { dropRate = 33 },
            loot = {
                {id=50203, disc=L["Quest Item"], dropRate=100},
                {},
                {id=50427, dropRate=50},
                {id=61053, dropRate=50},
                {},
                {id=61046},
                {id=50429},
                {id=61037},
                {},
                {id=61031},
                {id=61027},
                {id=61040},
                {},
                {id=61014, dropRate=1},
                {id=61043, dropRate=1.1},
                {id=51044, disc=L["Quest Item"], dropRate=100},
                {},
                {id=51217, disc=L["Fashion Coin"], dropRate=100},
            }
        },
        {
            id = "COTBMRotmaw",
            prefix = "7)",
            name = BB["Rotmaw"],
            defaults = { dropRate = 13 },
            loot = {
                {id=50203, disc=L["Quest Item"], dropRate=100},
                {},
                {id=61023},
                {id=61025},
                {id=61029},
                {id=61030},
                {id=61034},
                {id=61063},
                {id=61699, disc=L["Druid"]},
                {id=61701},
            }
        },
        {
            id = "COTTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0.001 },
            loot = {
                {id=50203, disc=L["Quest Item"]},
                {},
                {id=61564},
                {id=61565},
                {id=61571},
                {id=61570},
                {id=61568},
                {id=61569},
                {id=61567},
                {id=61566},
                {},
                {id=54003, disc=L["Pet"], dropRate=0.03},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheBlackMorass.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end