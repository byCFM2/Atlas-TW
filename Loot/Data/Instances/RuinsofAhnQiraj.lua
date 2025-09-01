-- Ruins_of_AhnQiraj.lua - Данные предметов из Руин Ан'Киража
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Общий лут для капитанов и майоров
local captainLoot = {
    {id = 21809, dropRate = 8},
    {id = 21810, dropRate = 8},
    {id = 21806, dropRate = 5},
}

-- Данные Руин Ан'Киража
AtlasTW.InstanceData.TheRuinsofAhnQiraj = {
    Name = BZ["Ruins of Ahn'Qiraj"],
    Location = BZ["Silithus"],
    Level = 60,
    Acronym = "AQ20",
    MaxPlayers = 20,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A".." " .. L["Entrance"] }
    },
    Reputation = {
         { name = BF["Cenarion Circle"], loot = "CenarionCircle" },
    },
    Bosses = {
        {
            id = "Kurinnaxx",
            prefix = "1)",
            name = BB["Kurinnaxx"],
            defaults = { dropRate = 17 },
            loot = {
                {id=21499},
                {id=21498},
                {},
                {id=21502},
                {id=21501},
                {id=21500},
                {id=21503},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=20888, dropRate=25, container={21402,21405,21411,21417}},
                {id=20884, dropRate=25, container={21393,21396,21399,21414,21408}},
                {},
                {id=20885, dropRate=25, container={21394,21406,21412,21415}},
                {id=20889, dropRate=25, container={21397,21403,21400,21418,21409}},
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            name = L["Lieutenant General Andorov"],
            loot = {
                {id=22221, container={22191}},
                {id=22219, container={22198}},
            },

        },
        {
            name = L["Four Kaldorei Elites"],
            color = "|cff9d9d9d",
        },
        {
            id = "GeneralRajaxx",
            prefix = "2)",
            name = BB["General Rajaxx"],
            defaults = { dropRate = 17 },
            loot = {
                {id=21493},
                {id=21492},
                {id=81004, dropRate=10},
                {},
                {id=21496},
                {id=21494},
                {id=21495},
                {id=21497},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=20888, dropRate=25, container={21402,21405,21411,21417}},
                {id=20884, dropRate=25, container={21393,21396,21399,21414,21408}},
                {},
                {id=20885, dropRate=25, container={21394,21406,21412,21415}},
                {id=20889, dropRate=25, container={21397,21403,21400,21418,21409}},
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            name = L["Captain Qeez"],
            loot = captainLoot
        },
        {
            name = L["Captain Tuubid"],
            loot = captainLoot
        },
        {
            name = L["Captain Drenn"],
            loot = captainLoot
        },
        {
            name = L["Captain Xurrem"],
            loot = captainLoot
        },
        {
            name = L["Major Yeggeth"],
            loot = captainLoot
        },
        {
            name = L["Major Pakkon"],
            loot = captainLoot
        },
        {
            name = L["Colonel Zerran"],
            loot = captainLoot
        },
        {
            id = "Moam",
            prefix = "3)",
            name = BB["Moam"],
            postfix = L["Optional"],
            defaults = { dropRate = 25 },
            loot = {
                {id=21472},
                {id=21467},
                {id=21479},
                {id=21471},
                {},
                {id=21455, dropRate=11},
                {id=21468, dropRate=11},
                {id=21474, dropRate=11},
                {id=21470, dropRate=11},
                {id=21469, dropRate=11},
                {id=21476, dropRate=11},
                {id=21475, dropRate=11},
                {id=21477, dropRate=11},
                {id=21473, dropRate=11},
                {},
                {id=20888, container={21402,21405,21411,21417}},
                {id=20884, container={21393,21396,21399,21414,21408}},
                {},
                {id=22220, dropRate=15, container={22194}},
                {},
                {id=20890, container={21410,21413,21416,21407}},
                {id=20886, container={21392,21395,21401,21404,21398}},
                {},
                {id=83005, disc=L["Quest Item"], dropRate=100, container={83002}},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            id = "BurutheGorger",
            prefix = "4)",
            name = BB["Buru the Gorger"],
            postfix = L["Optional"],
            defaults = { dropRate = 14 },
            loot = {
                {id=21487},
                {id=21486},
                {id=21485},
                {},
                {id=21491},
                {id=21489},
                {id=21490},
                {id=21488},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=20888, dropRate=17, container={21402,21405,21411,21417}},
                {id=20884, dropRate=17, container={21393,21396,21399,21414,21408}},
                {},
                {id=20885, dropRate=17, container={21394,21406,21412,21415}},
                {id=20889, dropRate=17, container={21397,21403,21400,21418,21409}},
                {},
                {id=20890, dropRate=17, container={21410,21413,21416,21407}},
                {id=20886, dropRate=17, container={21392,21395,21401,21404,21398}},
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            id = "AyamisstheHunter",
            prefix = "5)",
            name = BB["Ayamiss the Hunter"],
            postfix = L["Optional"],
            defaults = { dropRate = 13 },
            loot = {
                {id=21479},
                {id=21478},
                {id=21466},
                {},
                {id=21484},
                {id=21480},
                {id=21482},
                {id=21481},
                {id=21483},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=20888, dropRate=17, container={21402,21405,21411,21417}},
                {id=20884, dropRate=17, container={21393,21396,21399,21414,21408}},
                {},
                {id=20885, dropRate=17, container={21394,21406,21412,21415}},
                {id=20889, dropRate=17, container={21397,21403,21400,21418,21409}},
                {},
                {id=20890, dropRate=17, container={21410,21413,21416,21407}},
                {id=20886, dropRate=17, container={21392,21395,21401,21404,21398}},
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        {
            id = "OssiriantheUnscarred",
            prefix = "6)",
            name = BB["Ossirian the Unscarred"],
            defaults = { dropRate = 15 },
            loot = {
                {id=21460},
                {id=21454, dropRate=18},
                {id=21453, dropRate=18},
                {id=21456, dropRate=18},
                {id=21464},
                {id=21457},
                {id=21462},
                {id=21458, dropRate=18},
                {id=21463},
                {id=21461},
                {},
                {id=21459},
                {id=21715},
                {id=21452, dropRate=18},
                {},
                {id=21220, dropRate=100, container={21504,21507,21505,21506}},
                {},
                {id=20890, dropRate=50, container={21410,21413,21416,21407}},
                {id=20886, dropRate=50, container={21392,21395,21401,21404,21398}},
                {},
		        { id=132, dropRate = 6, container = { 103 } }, --Plans: Obsidian Belt Buckle
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 } -- Crest of Heroism
            }
        },
        { prefix = "1') ", name = L["Safe Room"], color = "|cff00FF00" },
        {
            id = "AQ20Trash",
            name = L["Trash Mobs"].."-"..BZ["Ruins of Ahn'Qiraj"],
            defaults = { dropRate = 2 },
            loot = {
                {id=21804, dropRate=0.2},
                {id=21803, dropRate=0.02},
                {id=21805, dropRate=0.02},
                {},
                {id=20873, dropRate=0.4},
                {id=20869, dropRate=0.4},
                {id=20866, dropRate=0.4},
                {id=20870, dropRate=0.4},
                {id=20868, dropRate=0.4},
                {id=20871, dropRate=0.4},
                {id=20867, dropRate=0.4},
                {id=20872, dropRate=0.4},
                {},
                {id=21761, disc = L["Key"], dropRate=7},
                {id=21156, disc = L["Container"], dropRate=0.1, container={20859,20862,20863,20858,20860,20861,20864,20865}},
                {id=21801, dropRate=0.1},
                {id=21800, dropRate=0.1},
                {id=21802, dropRate=0.1},
                {},
                {id=20864, disc = L["Quest Item"]},
                {id=20861, disc = L["Quest Item"]},
                {id=20863, disc = L["Quest Item"]},
                {id=20862, disc = L["Quest Item"]},
                {id=20859, disc = L["Quest Item"]},
                {id=20865, disc = L["Quest Item"]},
                {id=20860, disc = L["Quest Item"]},
                {id=20858, disc = L["Quest Item"]},
                {},
                {id=22203, disc = L["Reagent"], dropRate=1},
                {id=22202, disc = L["Reagent"], dropRate=1},
            }
        },
        {
            id = "AQEnchants",
            name = L["AQ Enchants"],
            defaults = { dropRate = 1 },
            loot = {
                {id=20728},
                {id=20731},
                {id=20734},
                {id=20729},
                {id=20736},
                {id=20730},
                {id=20727},
            }
        },
        {
            id = "AQ20ClassBooks",
            name = L["Class Books"],
            defaults = { dropRate = 4 },
            loot = {
                {id=21284},
                {id=21287},
                {id=21285},
                {id=21279},
                {id=21214},
                {id=21280},
                {id=21281},
                {id=21283},
                {id=21282},
                {id=21300},
                {id=21303},
                {id=21302},
                {id=21294},
                {id=21296},
                {id=21295},
                {id=21306},
                {id=21304},
                {id=21307},
                {id=21291},
                {id=21292},
                {id=21293},
                {id=21288},
                {id=21289},
                {id=21290},
                {id=21298},
                {id=21299},
                {id=21297},
            }
        },
        { name = L["Ruins of Ahn'Qiraj Sets"], items = "AtlasLootAQ20SetMenu" },
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheRuinsofAhnQiraj.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end