-- HateforgeQuarry.lua - Данные предметов из Hateforge Quarry
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Hateforge Quarry
AtlasTW.InstanceData.HateforgeQuarry = {
    Name = BZ["Hateforge Quarry"],
    Location = BZ["Burning Steppes"],
    Level = {48,60},
    Acronym = "HQ",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Bosses = {
        {
            id = "HQHighForemanBargulBlackhammer",
            prefix = "1)",
            name = BB["High Foreman Bargul Blackhammer"],
            defaults = { dropRate = 20 },
            loot = {
                {id=60566},
                {id=60569},
                {id=60567},
                {id=60568},
                {id=60570, dropRate=15},
                {id=60565},
                {},
                {id=60775, disc=L["Book"], dropRate=15},
                {},
                {id = 41985, dropRate = 100, container = { 41986 }}, --Crest of Valor
                {id=41460, dropRate=100},
                {id=61462, dropRate=100,container={61465}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "HQEngineerFiggles",
            prefix = "2)",
            name = BB["Engineer Figgles"],
            defaults = { dropRate = 20 },
            loot = {
                {id=60540},
                {id=60542},
                {id=60541},
                {id=60543},
                {id=60545},
                {},
                {id=60539, dropRate=15},
                {},
                {id=13325, dropRate=.025},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            prefix = "a)",
            name = L["Hateforge Chemistry Documents"],
            color = "|cff9d9d9d",
        },
        {
            id = "HQCorrosis",
            prefix = "3)",
            name = BB["Corrosis"],
            defaults = { dropRate = 20 },
            loot = {
                {id=80672},
                {id=80673},
                {id=80670},
                {id=80671},
                {},
                {id=41003, dropRate=100,container={40080}},
                {id=80674},
            }
        },
        {
            id = "HQHatereaverAnnihilator",
            prefix = "4)",
            name = BB["Hatereaver Annihilator"],
            defaults = { dropRate = 20 },
            loot = {
                {id=60562},
                {id=60564},
                {id=60563},
                {id=60561},
                {id=60559},
                {},
                {id=60560, dropRate=15},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "HQHargeshDoomcaller",
            prefix = "5)",
            name = BB["Har'gesh Doomcaller"],
            defaults = { dropRate = 25 },
            loot = {
                {id=51045},
                {id=51047},
                {id=51048},
                {id=51046},
                {},
                {id=60549, dropRate=20},
                {id=60548, dropRate=20},
                {id=60550, dropRate=20},
                {id=60547, dropRate=20},
                {id=60546, dropRate=20},
                {},
                {id=60551, dropRate=1.2},
                {},
                {id = 41985, dropRate = 100, container = { 41986 }}, --Crest of Valor
                {id=70226, disc=L["Quest Item"],dropRate=3,container={70227,70228,70229,70230,70231,70232,70233,
                    70234,70235,70236,70238}},
                {id=51217, disc=L["Transmogrification"], dropRate=100},
            }
        },
        {
            id = "HQTrash",
            name = L["Trash Mobs"].."-"..BZ["Hateforge Quarry"],
            defaults = { dropRate=.005 },
            loot = {
                {id=84010, container={60576}},
                {id=84011, container={60578}},
                {id=84012, container={60577}},
                {id=84013, container={60574}},
                {id=84014, container={60573}},
                {id=84015, container={60575}},
                {},
                {id=60616},
                {id=60582},
                {id=60572, disc=L["Outside"], dropRate=.1},
                {id=60612, dropRate=.0025},
            }
        },
        { name = BIS["Incendosaur Skin Armor"], items = "IncendosaurSkinArmor" },
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.HateforgeQuarry.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end