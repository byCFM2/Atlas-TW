-- Temple_of_AhnQiraj.lua - Данные предметов из Храма Ан'Киража
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Общие предметы Imperial Qiraji Regalia
local imperialRegalia = {
    {id=21237, dropRate=4, container={21268,21273,21275}},
}
-- Общие предметы Imperial Qiraji Armaments
local imperialArmaments = {
    {id=21232, dropRate=4, container={21242,21244,21272,21269}},
}
local QirajiBindingsOfCommand = {
    {id=20928, dropRate=100, container={21330,21333,21367,21365,21361,21359,21350,47215,21349,47218}},
}
local QirajiBindingsOfDominance = {
    {id=20932, dropRate=100, container={21391,47038,47033,21388,47036,47041,21345,47095,21344,47098,21335,
        47293,21338,47296,21376,47153,47158,21373,47156,47161,21354,47363,47368,21355,47366,47371}},
}

-- Данные Храма Ан'Киража
AtlasTW.InstanceData.TheTempleofAhnQiraj = {
    Name = BZ["Temple of Ahn'Qiraj"],
    Location = BZ["Silithus"],
    Level = 60,
    Acronym = "AQ40",
    Attunement = false,
    MaxPlayers = 40,
    DamageType = "Nature",
    Entrances = {
        { letter = "A"..". "..L["Entrance"] }
    },
    Reputation = {
        { name = BF["Brood of Nozdormu"], loot = "BroodOfNozdormu" },
    },

    Bosses = {
        {
            id = "TheProhetSkeram",
            prefix = "1)",
            name = BB["The Prophet Skeram"],
            defaults = { dropRate = 15 },
            loot = {
                {id=21699, dropRate=18},
                {id=21814},
                {id=21708},
                {id=21698, dropRate=18},
                {id=21705},
                {id=21704},
                {id=21706},
                {},
                {id=21702, dropRate=18},
                {id=21700, dropRate=18},
                {id=21701, dropRate=18},
                {id=21707},
                {id=21703, dropRate=10},
                {id=21128, dropRate=10},
                {},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
                {},
                {id=22222, container={22196}},
            }
        },
        {
            id = "TheBugFamily",
            prefix = "2)",
            name = BB["The Bug Family"],
            postfix = L["Optional"],
            defaults = { dropRate = 25 },
            loot = {
                {id=21693, dropRate=17, disc = L["Shared"]},
                {id=21694, dropRate=17, disc = L["Shared"]},
                {id=21697, dropRate=17, disc = L["Shared"]},
                {id=21696, dropRate=17, disc = L["Shared"]},
                {id=21692, dropRate=17, disc = L["Shared"]},
                {id=21695, dropRate=17, disc = L["Shared"]},
                {},
                unpack(imperialRegalia),
                unpack(imperialArmaments),
                {},
                {id=21680, disc = BB["Lord Kri"]},
                {id=21681, disc = BB["Lord Kri"]},
                {id=21685, disc = BB["Lord Kri"]},
                {id=21603, disc = BB["Lord Kri"]},
                {},
                {id=21690, disc = BB["Vem"]},
                {id=21689, disc = BB["Vem"]},
                {id=21691, disc = BB["Vem"]},
                {id=21688, disc = BB["Vem"]},
                {},
                {id=21686, disc = BB["Princess Yauj"]},
                {id=21684, disc = BB["Princess Yauj"]},
                {id=21683, disc = BB["Princess Yauj"]},
                {id=21682, disc = BB["Princess Yauj"]},
                {id=21687, disc = BB["Princess Yauj"]},
            }
        },
        {
            name = BB["Vem"],
            color = "|cff9d9d9d",
        },
        {
            name = BB["Lord Kri"],
            color = "|cff9d9d9d",
        },
        {
            name = BB["Princess Yauj"],
            color = "|cff9d9d9d",
        },
        {
            id = "BattleguardSartura",
            prefix = "3)",
            name = BB["Battleguard Sartura"],
            defaults = { dropRate = 15 },
            loot = {
                {id=21669},
                {id=21678, dropRate=18},
                {id=21671},
                {id=21672},
                {id=21674, dropRate=18},
                {id=21675, dropRate=18},
                {id=21676, dropRate=18},
                {id=21668},
                {id=21667},
                {id=21648, dropRate=18},
                {},
                {id=21670},
                {id=21666, dropRate=10},
                {},
                {id=21673, dropRate=10},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
            }
        },
        {
            id = "FankrisstheUnyielding",
            prefix = "4)",
            name = BB["Fankriss the Unyielding"],
            defaults = { dropRate = 15 },
            loot = {
                {id=21665, dropRate=18},
                {id=21639},
                {id=21627},
                {id=21663, dropRate=18},
                {id=21652, dropRate=18},
                {id=21651, dropRate=18},
                {id=21645},
                {},
                {id=21650, dropRate=10},
                {id=21635, dropRate=10},
                {id=21664, dropRate=18},
                {id=21647},
                {id=22402},
                {id=22396},
                {},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
            }
        },
        {
            id = "Viscidus",
            prefix = "5)",
            name = BB["Viscidus"],
            postfix = L["Optional"],
            defaults = { dropRate = 14 },
            loot = {
                {id=21624},
                {id=21623},
                {id=21626},
                {id=21622},
                {},
                {id=21677, dropRate=2.93},
                {id=21625},
                {id=22399},
                {},
                unpack(QirajiBindingsOfCommand),
                unpack(QirajiBindingsOfDominance),
                {},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
            }
        },
        {
            id = "PrincessHuhuran",
            prefix = "6)",
            name = BB["Princess Huhuran"],
            defaults = { dropRate = 17 },
            loot = {
                {id=21621},
                {id=21618},
                {id=21619},
                {id=21617},
                {id=21620},
                {id=21616},
                {},
                unpack(QirajiBindingsOfCommand),
                unpack(QirajiBindingsOfDominance),
                {},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
            }
        },
        {
            id = "TheTwinEmperors",
            prefix = "7)",
            name = BB["The Twin Emperors"],
            defaults = { dropRate = 14 },
            loot = {
                {id=20930, dropRate=100, disc = "Vek'lor"},
                {id=21602, dropRate=17, disc = "Vek'lor"},
                {id=21599, dropRate=17, disc = "Vek'lor"},
                {id=21598, dropRate=17, disc = "Vek'lor"},
                {id=21600, dropRate=17, disc = "Vek'lor"},
                {id=21601, dropRate=17, disc = "Vek'lor"},
                {id=21597, dropRate=17, disc = "Vek'lor"},
                {id=20735, dropRate=7, disc = "Vek'lor"},
                {},
                unpack(imperialArmaments),
                {},
                {id=20926, dropRate=100, disc = "Vek'nilash"},
                {id=21608, disc = "Vek'nilash"},
                {id=21604, disc = "Vek'nilash"},
                {id=21605, disc = "Vek'nilash"},
                {id=21609, disc = "Vek'nilash"},
                {id=21607, disc = "Vek'nilash"},
                {id=21606, disc = "Vek'nilash"},
                {id=21679, disc = "Vek'nilash"},
                {id=20726, dropRate=7, disc = "Vek'nilash"},
                {},
                unpack(imperialRegalia),
            }
        },
        {
            name = "Emperor Vek'lor",
            color = "|cff9d9d9d",
        },
        {
            name = "Emperor Vek'nilash",
            color = "|cff9d9d9d",
        },
        {
            id = "Ouro",
            prefix = "8)",
            name = BB["Ouro"],
            postfix = L["Optional"],
            defaults = { dropRate = 14 },
            loot = {
                {id=21615},
                {id=21611},
                {id=21610},
                {id=21614},
                {id=23558, dropRate=18},
                {id=21613},
                {id=21612},
                {},
                {id=20927, dropRate=100},
                {id=20931, dropRate=100},
                {},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
            }
        },
        {
            id = "CThun",
            prefix = "9)",
            name = BB["C'Thun"],
            defaults = { dropRate = 14 },
            loot = {
                {id=21596},
                {id=21581},
                {id=21582},
                {id=21583},
                {id=21585},
                {id=21586},
                {id=21584},
                {id=21579},
                {id=21839, dropRate=18},
                {id=21126, dropRate=10},
                {},
                {id=21221, dropRate=100, container={21712,21710,21709}},
                {},
                {id=20929, dropRate=100},
                {id=20933, dropRate=100},
                {},
                unpack(imperialRegalia),
                {},
                unpack(imperialArmaments),
            }
        },
        { prefix = "1') ", name = "Andorgos", color = "|cff00FF00" },
        { name = L["Vethsera"], color = "|cff00FF00" },
        { name = L["Kandrostrasz"], color = "|cff00FF00" },
        { prefix = "2') ", name = "Arygos", color = "|cff00FF00" },
        { name = L["Caelestrasz"], color = "|cff00FF00" },
        { name = L["Merithra of the Dream"], color = "|cff00FF00" },
        {
            id = "AQ40Trash1",
            name = L["Trash Mobs"],
            defaults = { dropRate = 2 },
            loot = {
                {id=21838, dropRate=0.6},
                {id=21888, dropRate=0.02},
                {id=21890, dropRate=0.02},
                {id=21889, dropRate=0.02},
                {},
                {id=21889, dropRate=0.02},
                {id=20876, dropRate=0.4},
                {id=20879, dropRate=0.4},
                {id=20875, dropRate=0.4},
                {id=20878, dropRate=0.4},
                {id=20881, dropRate=0.4},
                {id=20877, dropRate=0.4},
                {id=20874, dropRate=0.4},
                {id=20882, dropRate=0.4},
                {id=20880, dropRate=0.4},
                {},
                {id=21762, disc = L["Key"], dropRate=7},
                {id=21156, disc = L["Container"], dropRate=0.1, container={20859,20862,20863,20858,20860,20861,20864,20865}},
                {id=21218, dropRate=0.1},
                {id=21217, dropRate=0.1},
                {id=21219, dropRate=0.1},
                {},
                {id=20864},
                {id=20861},
                {id=20863},
                {id=20862},
                {id=20859},
                {id=20865},
                {id=20860},
                {id=20858},
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
            id = "AQOpening",
            name = L["AQ Opening Quest Chain"],
            loot = {
                { id = 21138 },
                { id = 21529 },
                { id = 21530 },
                {},
                { id = 21139 },
                { id = 21531 },
                { id = 21532 },
                {},
                { id = 21137 },
                { id = 21517 },
                { id = 21527 },
                { id = 21526 },
                { id = 21025 },
                {},
                {},
                { id = 21175 },
                { id = 21176 },
                { id = 21523 },
                { id = 21521 },
                { id = 21522 },
                { id = 21520 }
            }
        },
        { name = L["Temple of Ahn'Qiraj Sets"], items = "Aq40Set" },
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheTempleofAhnQiraj.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end