-- World_Bosses.lua - Данные предметов с мировых боссов
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные мировых боссов
AtlasTW.InstanceData.Concavius = {
    Name = BB["Concavius"],
    Location = BZ["Desolace"],
    Level = {1, 60},
    Acronym = "Concavius",
    MaxPlayers = 40,
    DamageType = L["Shadow"],
    Bosses = {
        {
            id = "WBConcavius",
            prefix = "1)",
            name = BB["Concavius"],
            defaults = { dropRate = 17 },
            loot = {
                {id=83233}, -- Charm of Dark Domination (амулет)
                {id=83234}, -- Voidclaw Choker (амулет)
                {id=83237}, -- Band of Ancient Lethality (кольцо)
                {id=83238}, -- Ring of the Abyss Watcher (кольцо)
                {id=83239}, -- Signet of the Voidwalker (кольцо)
                {id=83240}, -- Ring of the Whispering Mist (кольцо)
                {},
                {id=83236, disc=L["Container"], dropRate=100, container={7076, 7078, 7080, 7082, 7971, 12361, 12363,
                    12364, 12800, 11370, 13468, 14256, 15416, 20520}}, -- Void-Linked Satchel of Goods
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Concavius.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end