-- Upper_Blackrock_Spire.lua - Данные предметов из Верхней части Пика Черной горы
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

-- Данные Верхней части Пика Черной горы
AtlasTW.InstanceData.BlackrockSpireUpper = {
    Name = BZ["Upper Blackrock Spire"],
    Location = BZ["Blackrock Mountain"],
    Level = {55,60},
    Acronym = "UBRS",
    Attunement = false,
    MaxPlayers = 10,
    DamageType = L["Fire"],L["Physical"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] },
        { letter = "B)", info = BZ["Lower Blackrock Spire"]},
        { letter = "C-E)", info = L["Connections"] }
    },
    Keys = {
        { name = "Seal of Ascension", loot = "VanillaKeys" },
        { name = "Brazier of Invocation", loot = "VanillaKeys", info = L["Tier 0.5 Summon"] }
    },
    Bosses = {
        {
            id = "UBRSEmberseer",
            prefix = "1)",
            name = BB["Pyroguard Emberseer"],
            defaults = { dropRate = 20 },
            loot = {
                {id=16672, disc=L["Shaman"]..", ".."T0"},
                {},
                {id=12929},
                {id=12927},
                {id=12905},
                {id=12926},
                {},
                {id=23320, disc=L["Book"], dropRate=8},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "UBRSSolakar",
            prefix = "2)",
            name = BB["Solakar Flamewreath"],
            defaults = { dropRate = 20 },
            loot = {
                {id=16695, disc=L["Priest"]..", ".."T0"},
                {},
                {id=12609},
                {id=12603},
                {id=12589},
                {id=12606},
                {},
                {id=18657, dropRate=6, container={18638}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "UBRSFlame",
            name = L["Father Flame"],
            loot = {
                {id=13371, dropRate=.08},
            }
        },
        {
            prefix = "3)",
            name = L["Darkstone Tablet"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Doomrigger's Coffer"],
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSRunewatcher",
            prefix = "4)",
            name = BB["Jed Runewatcher"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=12604},
                {},
                {id=12930},
                {},
                {id=12605},
            }
        },
        {
            id = "UBRSAnvilcrack",
            prefix = "5)",
            name = BB["Goraluk Anvilcrack"],
            postfix = L["Rare"],
            defaults = { dropRate = 14 },
            loot = {
                {id=13502},
                {id=13498},
                {id=18047},
                {id=18048},
                {},
                {id=12834,container={12790}},
                {id=12837,container={12794}},
                {id=12728,container={12641}},
                {},
                {id=18779,dropRate=15},
                {id=12727,container={12618}},
                {},
                { name=L["Small Rocket Recipes"] },
                {id=12806,dropRate=100},
                {id=12696,container={12628}},
            }
        },
        {
            id = "UBRSRend",
            prefix = "6)",
            name = BB["Warchief Rend Blackhand"],
            defaults = { dropRate = 17 },
            loot = {
                {id=12587, dropRate=23},
                {id=12588},
                {id=12936},
                {id=18104},
                {id=12935, dropRate=23},
                {id=18102, dropRate=23},
                {id=22247},
                {},
                {id=18103, dropRate=23},
                {},
                {id=12583, dropRate=8},
                {id=12940, dropRate=8},
                {id=12939, dropRate=8},
                {id=12590, dropRate=1},
                {},
                {id=16733, disc=L["Warrior"]..", ".."T0"},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "UBRSGyth",
            name = BB["Gyth"],
            defaults = { dropRate = 20 },
            loot = {
                {id=16669, disc=L["Shaman"]..", ".."T0"},
                {},
                {id=22225},
                {id=12960},
                {id=12953},
                {id=12952},
                {},
                {id=13522, dropRate=3,container={13513}},
                {},
                {id=12871,disc=L["Quest Item"], dropRate=4},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            prefix = "7)",
            name = L["Awbee"],
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSBeast",
            prefix = "8)",
            name = BB["The Beast"],
            defaults = { dropRate = 10 },
            loot = {
                {id=16729, disc=L["Paladin"]..", ".."T0", dropRate=10},
                {},
                {id=12967},
                {id=12968},
                {id=12966},
                {id=12965},
                {id=12963},
                {id=12964},
                {id=22311},
                {},
                {id=12709},
                {id=12969},
                {},
                {id=24101,disc=L["Book"], dropRate=13},
                {id=19227,disc=L["Darkmoon Faire Card"], dropRate=5},
                {id=12731,disc=L["Misc"], dropRate=2},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "UBRSValthalak",
            name = BB["Lord Valthalak"],
            postfix = L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                {name=L["Tier 0.5 Summonable"],icon="INV_Misc_Bag_09"},
                {id=22302},
                {id=22340},
                {id=22337},
                {id=22343},
                {id=22342},
                {},
                {id=22339},
                {},
                {id=22336},
                {id=22335},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            name = L["Finkle Einhorn"],
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSDrakkisath",
            prefix = "9)",
            name = BB["General Drakkisath"],
            defaults = { dropRate = 11 },
            loot = {
                {id=22267, dropRate=25},
                {id=13141, dropRate=25},
                {id=22269, dropRate=25},
                {id=13142, dropRate=25},
                {id=13098, dropRate=25},
                {id=22268, dropRate=25},
                {id=22253, dropRate=25},
                {id=13090, dropRate=10},
                {},
                {id=12602, dropRate=25},
                {id=12592, dropRate=1},
                {},
                {id=15730, dropRate=4,container={15047}},
                {},
                {id=13519, dropRate=3,container={13510}},
                {id=16690, disc=L["Priest"]..", ".."T0"},
                {id=16688, disc=L["Mage"]..", ".."T0"},
                {id=16700, disc=L["Warlock"]..", ".."T0"},
                {id=16721, disc=L["Rogue"]..", ".."T0"},
                {id=16706, disc=L["Druid"]..", ".."T0"},
                {id=16674, disc=L["Hunter"]..", ".."T0"},
                {id=16666, disc=L["Shaman"]..", ".."T0"},
                {id=16726, disc=L["Paladin"]..", ".."T0"},
                {id=16730, disc=L["Warrior"]..", ".."T0"},
                {},
                {id=51217, disc=L["Transmogrification"]..", "..L["Quantity of"].." 3", dropRate=100},
            }
        },
        {
            name = L["Drakkisath's Brand"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "10)",
            name = BZ["Blackwing Lair"],
            postfix = "BWL",
            color = "|cff9d9d9d",
        },
        {
            id = "UBRSTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 2 },
            loot = {
                {id=13260, dropRate=.05},
                {},
                {id=16696, disc=L["Priest"]..", ".."T0", dropRate=2.25},
                {id=16683, disc=L["Mage"]..", ".."T0", dropRate=1.5},
                {id=16703, disc=L["Warlock"]..", ".."T0", dropRate=2.5},
                {id=16713, disc=L["Rogue"]..", ".."T0"},
                {id=16681, disc=L["Hunter"]..", ".."T0", dropRate=1.75},
                {id=16680, disc=L["Hunter"]..", ".."T0", dropRate=1.5},
                {id=16673, disc=L["Shaman"]..", ".."T0"},
                {id=16735, disc=L["Warrior"]..", ".."T0"},
                {},
                {id=24102, disc=L["Book"], dropRate=10},
                {},
                {id=16247, dropRate=3},
            }
        },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
        { name = BIS["Dal'Rend's Arms"], items = "DalRend" },
        { name = L["Tier 0/0.5 Sets"], items = "T0Set" },
    }
}

 -- Инициализация предметов для всех боссов
 for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockSpireUpper.Bosses) do
     bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
     bossData.loot = nil -- Очищаем временные данные
 end