-- NerubianOverseer.lua - Данные предметов с мирового босса Nerubian Overseer
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные мирового босса Nerubian Overseer
AtlasTW.InstanceData.Nerubian = {
    Name = BB["Nerubian Overseer"],
    Location = BZ["Eastern Plaguelands"],
    Level = {1, 60},
    Acronym = "Spooder",
    MaxPlayers = 40,
    DamageType = L["Nature"] .. ", " .. L["Shadow"],
    Bosses = {
        {
            id = "WBNerubian",
            prefix = "1)",
            name = BB["Nerubian Overseer"],
            defaults = { dropRate = 20 },
            loot = {
                {id=51738}, -- Tunnel Field Carapace (грудь, кожа)
                {id=51737}, -- Vestments of Eternal Autumn (грудь, кожа)
                {id=51736}, -- Plauge-Infected Robe (грудь, ткань)
                {id=51735}, -- Scourgelord's Fang (жезл)
                {id=51740}, -- Crown of Skittering Shadows (голова, ткань)
                {},
                {id=51734}, -- Shawl of Haunted Memories (плащ)
                {id=51733}, -- Shadow-Weaver's Cape (плащ)
                {id=51732}, -- Silken Mantle of Dying Hope (плащ)
                {id=51731}, -- Venom Covered Cloak (плащ)
                {id=51730}, -- Shawl of Nerubian Silk (плащ)
                {},
                {id=12717, dropRate=5, container={12640}}, -- Plans: Lionheart Helm (выкройка кузнечества)
                {id=22388, dropRate=5, container={22385}}, -- Plans: Titanic Leggings (выкройка кузнечества)
                {id=83547, dropRate=5, container={65014}}, -- Plans: Pauldron of Deflection (выкройка кузнечества)
                {id=51739, dropRate=100}, -- Little Ball of Spider Web (Pet)
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Nerubian.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end