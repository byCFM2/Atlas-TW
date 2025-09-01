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
AtlasTW.InstanceData.CavernsOfTimeBlackMorass = {
    Name = BZ["Black Morass"],
    Location = BZ["Tanaris"],
    Level = {58,60},
    Acronym = "BM",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] },
        { letter = "B) " .. L["Connection"] }
    },
    Reputation = {
        { name = BF["Wardens of Time"], loot = "WardensofTime" }
    },
    Bosses = {
        {
            id = "COTBMChronar",
            prefix = "1)",
            name = BB["Chronar"],
            defaults = { dropRate = 17 },
            loot = {
                {id=61018},
                {id=61036},
                {id=61047},
                {id=61048},
                {},
                {id=61019},
                {id=61016},
                {},
                {id = 41985, dropRate = 100, container = { 41986 }}, --Crest of Valor
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=50203, quantity={10,15}, disc=L["Quest Item"], dropRate=100},
                {id=41458, dropRate=100},
                {id=60496, dropRate=100},
            }
        },
        {
            id = "COTBMEpidamu",
            prefix = "2)",
            name = BB["Epidamu"],
            defaults = { dropRate = 13 },
            loot = {
                {},
                {id=50431},
                {id=61032},
                {id=61041},
                {id=61045},
                {id=61055},
                {id=61056},
                {id=61700},
                {id=61698},
                {},
                {id=50203, quantity={15,20}, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "COTBMDriftingAvatar",
            prefix = "3)",
            name = BB["Drifting Avatar of Sand"],
            defaults = { dropRate = 14 },
            loot = {
                {id=61015},
                {id=61024},
                {id=61033},
                {id=61038},
                {id=61042},
                {id=61044},
                {id=61057},
                {},
                {id=61020, dropRate=2},
                {},
                {id = 41985, dropRate = 100, container = { 41986 }}, --Crest of Valor
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=50203, quantity={15,20}, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "COTBMTimeLordEpochronos",
            prefix = "4)",
            name = BB["Time-Lord Epochronos"],
            defaults = { dropRate = 12 },
            loot = {
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
                {},
                {id = 41985, dropRate = 100, container = { 41986 }}, --Crest of Valor
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=50203, quantity={15,20}, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "COTBMMossheart",
            prefix = "5)",
            name = BB["Mossheart"],
            defaults = { dropRate = 17 },
            loot = {
                {id=61050},
                {id=61051},
                {id=61059},
                {id=61060},
                {id=61061},
                {id=61062},
                {},
                {id = 41985, dropRate = 100, container = { 41986 }}, --Crest of Valor
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=50203, quantity={20,25}, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "COTBMAntnormi",
            prefix = "6)",
            name = BB["Antnormi"],
            defaults = { dropRate = 33 },
            loot = {
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
                {},
                {id=47413, dropRate=10, container={47412}}, --Recipe: Concoction of the Arcane Giant
                {id=47415, dropRate=10, container={47414}}, --Recipe: Concoction of the Dreamwater
                {id=51044, disc=L["Quest Item"], dropRate=100,container={82950,82951,82952,82953}},
                {id=70226, disc=L["Quest Item"],dropRate=3,container={70227,70228,70229,70230,70231,70232,70233,
                    70234,70235,70236,70238}},
                {id = 41985, dropRate = 100, container = { 41986 }}, --Crest of Valor
                {id=50203, quantity={10,15}, disc=L["Quest Item"], dropRate=100},
                {id=51217, quantity=2, disc=L["Transmogrification"], dropRate=100},
            }
        },
        {
            id = "COTBMRotmaw",
            prefix = "7)",
            name = BB["Rotmaw"],
            defaults = { dropRate = 13 },
            loot = {
                {id=61023},
                {id=61025},
                {id=61029},
                {id=61030},
                {id=61034},
                {id=61063},
                {id=61699},
                {id=61701},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=50203, quantity={10,15}, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "COTTrash",
            name = L["Trash Mobs"].."-"..BZ["Black Morass"],
            defaults = { dropRate = .001 },
            loot = {
                {id=61564},
                {id=61565},
                {id=61571},
                {id=61570},
                {id=61568},
                {id=61569},
                {id=61567},
                {id=61566},
                {},
                {id=54003, dropRate=.03},
                {},
                {id=61673, disc=L["Reagent"], dropRate=4},
                {},
                {id=50203, quantity={1,3}, disc=L["Quest Item"], dropRate=100},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.CavernsOfTimeBlackMorass.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end