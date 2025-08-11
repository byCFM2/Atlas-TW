-- StormwroughtRuins.lua - Данные предметов из Stormwrought Ruins
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Stormwrought Ruins
AtlasTW.InstanceData.DragonmawRetreat = {
    Name = BZ["Dragonmaw Retreat"],
    Location = BZ["Grim Reaches"],
    Level = {27,33},
    Acronym = "DR",
    MaxPlayers = 5,
    DamageType = L["Physical"],  --?
    Entrances = {
        { letter = "A)"..L["Entrance"] }
    },
    Bosses = {
        {
            id = "DRTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0 },
            loot = {
                -- TODO: Добавить предметы когда будут доступны данные
            }
        }
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.DragonmawRetreat.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end