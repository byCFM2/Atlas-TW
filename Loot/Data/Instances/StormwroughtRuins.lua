-- StormwroughtRuins.lua - Данные предметов из Stormwrought Ruins
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Stormwrought Ruins
AtlasTW.InstanceData.StormwroughtRuins = {
    Name = BZ["Stormwrought Ruins"],
    Location = BZ["Balor"],
    Level = {35,42},
    Acronym = "SR",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"] }
    },
    Bosses = {
        {
            id = "SRTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0 },
            loot = {
                -- TODO: Добавить предметы когда будут доступны данные
            }
        }
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.StormwroughtRuins.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end