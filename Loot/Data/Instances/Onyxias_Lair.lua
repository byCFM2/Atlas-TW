-- OnyxiasLair.lua - Данные предметов из Логова Ониксии
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Логова Ониксии
AtlasTW.InstanceData.OnyxiasLair = {
    Name = BZ["Onyxia's Lair"],
    Location = BZ["Dustwallow Marsh"],
    Level = 60,
    Acronym = "Ony",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Fire"],
    Entrances = {
        { letter = "A"..")"..") " .. L["Entrance"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = L["Onyxian Warders"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name = L["Whelp Eggs"],
            color = "|cff9d9d9d",
        },
        {
            id = "Onyxia",
            prefix = "3)",
            name = BB["Onyxia"],
            defaults = { dropRate = 13 },
            loot = {
                {id=16921, container={47206}},
                {id=16914, container={47086}},
                {id=16929, container={47284}},
                {id=16908},
                {id=16900, container={47346,47354}},
                {id=16939},
                {id=16947, container={47136,47144}},
                {id=16955, container={47016,47024}},
                {id=16963, container={47248}},
                {},
                {},
                {id=18423, dropRate=100, container={18403,18404,18406,15138}},
                {id=18422, dropRate=100, container={18403,18404,18406,15138}},
                {},
                {id=18705, dropRate=40, container={18714,18713,18715}},
                {id=18205, dropRate=25},
                {id=17078, dropRate=25},
                {id=17067, dropRate=25},
                {},
                {id=18813, dropRate=25},
                {id=17064, dropRate=8},
                {},
                {id=17068, dropRate=8},
                {id=17075, dropRate=8},
                {},
                {id=17966, disc=L["Bag"], dropRate=100},
                {},
                {id=17962, disc=L["Container"], dropRate=20, container={12361,1529,7909,7910,55250,55251,3864,7971,13926}}, --Blue sack of gems
                {},
                {id=15410, disc=L["Reagent"], dropRate=100},
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.OnyxiasLair.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end