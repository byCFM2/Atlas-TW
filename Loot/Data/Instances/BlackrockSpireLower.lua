-- BlackrockSpireLower.lua - Данные предметов из Нижней части Пика Черной горы
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2a")
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Нижней части Пика Черной горы
AtlasTW.InstanceData.BlackrockSpireLower = {
    Name = BZ["Lower Blackrock Spire"],
    Location = BZ["Blackrock Mountain"],
    Level = {55,60},
    Acronym = "LBRS",
    Attunement = false,
    MaxPlayers = 10,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] },
        { letter = "B)", info = BZ["Upper Blackrock Spire"]},
        { letter = "C-F)", info = L["Connections"] }
    },
    Keys = {
        { name = "Brazier of Invocation", loot = "VanillaKeys", info = L["Tier 0.5 Summon"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name=L["Vaelan"],
            postfix = L["Upper"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name=L["Warosh"],
            postfix = L["Wanders"],
            color = "|cff9d9d9d",
        },
        {
            name=L["Elder Stonefort"],
            postfix = L["Lunar Festival"],
            --loot = "LunarFestival",    TODO need support string in loot
        },
        {
            id = "LBRSPike",
            prefix = "3)",
            name = L["Roughshod Pike"],
            loot = {
                {id=12533,disc=L["Used to summon boss"], dropRate=100},
            }
        },
        {
            id = "LBRSSpirestoneButcher",
            prefix = "4)",
            name = L["Spirestone Butcher"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                {id=12608},
                {},
                {id=13286},
            }
        },
        {
            id = "LBRSOmokk",
            prefix = "5)",
            name = BB["Highlord Omokk"],
            defaults = { dropRate = 17 },
            loot = {
                {id=16670, disc=L["Shaman"]..", T0", container={22096}},
                {},
                {id=13166},
                {id=13168},
                {id=13170},
                {id=13169},
                {},
                {id=13167},
                {},
                {id=12534, disc=L["Used to summon boss"], dropRate=100},
                {},
                {id=12336, disc=L["Quest Item"], dropRate=25,container={12344}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=21982,dropRate=50,container={22149,22150}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "LBRSSpirestoneBattleLord",
            prefix = "6)",
            name = L["Spirestone Battle Lord"],
            postfix = L["Rare"],
            loot = {
                {id=13284, dropRate=40},
                {},
                {id=13285, dropRate=60},
                {},
                {id=21982,dropRate=14,container={22149,22150}},
            }
        },
        {
            id = "LBRSSpirestoneLordMagus",
            name = L["Spirestone Lord Magus"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=13282},
                {id=13283},
                {id=13261},
                {id=21982,dropRate=50,container={22149,22150}},
            }
        },
        {
            id = "LBRSVosh",
            prefix = "7)",
            name = BB["Shadow Hunter Vosh'gajin"],
            defaults = { dropRate = 17 },
            loot = {
                {id=16712, disc=L["Rogue"]..", T0", container={22002}},
                {},
                {id=13257},
                {id=12626},
                {id=13255},
                {id=12653},
                {id=12651},
                {id=12654, dropRate=25},
                {},
                {id=13352, dropRate=100,container={12821}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            name=L["Fifth Mosh'aru Tablet"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "8)",
            name=L["Bijou"],
            color = "|cff9d9d9d",
        },
        {
            id = "LBRSVoone",
            prefix = "9)",
            name = BB["War Master Voone"],
            defaults = { dropRate = 17 },
            loot = {
                {id=16676, disc=L["Hunter"]..", T0", container={22015}},
                {},
                {id=13177},
                {id=13179},
                {id=22231},
                {},
                {id=13173, dropRate=100},
                {id=12582},
                {},
                {id=12335, disc=L["Quest Item"], dropRate=20,container={12344}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=41454, disc=L["Quest Item"], dropRate=100},
                {id=60714, disc=L["Quest Item"], dropRate=100},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "LBRSGrayhoof",
            name = BB["Mor Grayhoof"],
            postfix = L["Summon"],
            defaults = { dropRate = 20 },
            loot = {
                {id=22306},
                {id=22325},
                {id=22319},
                {id=22398},
                {},
                {id=22322},
            }
        },
        {
            name=L["Sixth Mosh'aru Tablet"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "10)",
            name=L["Bijou's Belongings"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "11)",
            name=L["Human Remains"],
            postfix = L["Lower"],
            loot = {
                {id=12812, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            name=L["Unfired Plate Gauntlets"],
            postfix = L["Lower"],
            color = "|cff9d9d9d",
        },
        {
            id = "LBRSGrimaxe",
            prefix = "12)",
            name = BB["Bannok Grimaxe"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=12637},
                {id=12634},
                {},
                {id=12621},
                {},
                {id=12838, dropRate=7, container={12784}},
            }
        },
        {
            id = "LBRSSmolderweb",
            prefix = "13)",
            name = BB["Mother Smolderweb"],
            defaults = { dropRate = 25 },
            loot = {
                {id=16715, disc=L["Druid"]..", T0", container={22107}},
                {},
                {id=13244},
                {id=13213},
                {},
                {id=13183},
                {},
                {id=80758, dropRate=40},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "LBRSCrystalFang",
            prefix = "14)",
            name = BB["Crystal Fang"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=13185},
                {id=13184},
                {},
                {id=13218},
            }
        },
        {
            prefix = "15)",
            name=L["Urok's Tribute Pile"],
            color = "|cff9d9d9d",
        },
        {
            id = "LBRSDoomhowl",
            name = BB["Urok Doomhowl"],
            postfix = L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                {id=13258},
                {id=22232},
                {id=13259},
                {id=13178},
                {},
                {id=18784, dropRate=16},
                {id=12725, container={12620}, dropRate=0},
                {},
                {id=12712, disc=L["Quest Item"],dropRate=100,container={15867}},
                {id=21982,dropRate=50,container={22149,22150}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "LBRSZigris",
            prefix = "16)",
            name = BB["Quartermaster Zigris"],
            defaults = { dropRate = 10 },
            loot = {
                {id=13253},
                {id=13252},
                {},
                {id=12835,container={12798}},
                {},
                {id=80759},
                {},
                {id=13446, count=5}, --TODO need support for count
                {id=13444, count=5}, --TODO need support for count
                {},
                {id=56101, disc=L["Quest Item"], dropRate=30},
                {id=22138, disc=L["Quest Item"], dropRate=80},
                {id=41478, disc=L["Quest Item"], dropRate=100},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "LBRSHalycon",
            prefix = "17)",
            name = BB["Halycon"],
            defaults = { dropRate = 25 },
            loot = {
                {id=13212},
                {id=22313},
                {id=13211},
                {id=13210},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "LBRSSlavener",
            name = BB["Gizrul the Slavener"],
            defaults = { dropRate = 25 },
            loot = {
                {id=16718, disc=L["Druid"]..", T0", container={22112}},
                {},
                {id=13208},
                {id=13206},
                {},
                {id=13205},
                {},
                {id=83573, disc=L["Book"], dropRate=15},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "LBRSBashguud",
            prefix = "18)",
            name = BB["Ghok Bashguud"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=13203},
                {},
                {id=13198},
                {id=13204},
                {},
                {id=22138,dropRate=80},
            }
        },
        {
            id = "LBRSWyrmthalak",
            prefix = "19)",
            name = BB["Overlord Wyrmthalak"],
            defaults = { dropRate = 13 },
            loot = {
                {id=16679, disc=L["Hunter"]..", T0", container={22016}},
                {},
                {id=13162},
                {id=13164},
                {id=22321},
                {id=80760},
                {},
                {id=13163},
                {id=13148},
                {id=13161},
                {},
                {id=12780, dropRate=100, container={13966,13968,13965}},
                {},
                {id=13143, dropRate=2},
                {},
                {id=12337, disc=L["Quest Item"], dropRate=30,container={12344}},
                {id=16786, dropRate=80, count=2,container={16309}},
                {id=41700,dropRate=100,container={41704}},
                {id=61459, dropRate=100,container={61465}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=100, count=2},
            }
        },
        {
            id = "LBRSFelguard",
            prefix = "1')",
            name = L["Burning Felguard"],
            postfix = L["Rare"]..", "..L["Summon"],
            color = "|cff00FF00",
            defaults = { dropRate = 50 },
            loot = {
                {id=13181},
                {},
                {id=13182},
            }
        },
        {
            id = "LBRSTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 2 },
            loot = {
                {id=14513, dropRate=10, container={14152}},
                {},
                {id=16696, disc=L["Priest"]..", T0", container={22078}},
                {id=16685, disc=L["Mage"]..", T0", container={22062}},
                {id=16683, dropRate=1, disc=L["Mage"]..", T0", container={22063}},
                {id=16703, disc=L["Warlock"]..", T0", container={22071}},
                {id=16713, disc=L["Rogue"]..", T0", container={22002}},
                {id=16716, dropRate=1, disc=L["Druid"]..", T0", container={22106}},
                {id=16680, dropRate=1, disc=L["Hunter"]..", T0", container={22010}},
                {id=16673, disc=L["Shaman"]..", T0", container={22098}},
                {id=16736, disc=L["Warrior"]..", T0", container={21994}},
                {id=16735, disc=L["Warrior"]..", T0", container={21996}},
                {},
                {id=9214, disc=L["Book"], dropRate=5},
                {},
                {id=15749, dropRate=5, container={15053}},
                {id=15775, dropRate=23, container={15055}},
                {id=13494, container={13457}},
                {id=16250, dropRate=3},
                {id=16244, dropRate=10},
                {},
                {id=12219, disc=L["Quest Item"], dropRate=8,container={12344}},
                {id=12586, disc=L["Consumable"], dropRate=80},
            }
        },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
        { name = BIS["Spider's Kiss"], items = "SpiderKiss" },
        { name = L["Tier 0/0.5 Sets"], items = "T0Set" },
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockSpireLower.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end