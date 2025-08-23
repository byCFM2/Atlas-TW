-- World_Bosses.lua - Данные предметов с мировых боссов
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные мировых боссов
AtlasTW.InstanceData.Clackora = {
    Name = BB["Cla'ckora"],
    Location = BZ["Azshara"],
    Level = {1, 60},
    Acronym = "Clackora",
    MaxPlayers = 40,
    DamageType = L["Frost"],
    Bosses = {
        {
            id = "WBClackora",
            prefix = "1)",
            name = BB["Cla'ckora"],
            defaults = { dropRate = 20 },
            loot = {
                {id=55501}, -- Sphere of the Endless Gulch (аксессуар)
                {id=55494}, -- The Abyssal Pincer (кулак, оружие)
                {id=55495}, -- Zandalar Predator's Glaive (копье, двуручное)
                {id=55498}, -- Clamshell of the Depths (щит)
                {id=55504}, -- Anchor of the Wavecutter (молот, двуручное)
                {},
                {id=55502}, -- Iceplated Leggings (ноги, кожа)
                {id=55499}, -- Primal Murloc Scale Belt (пояс, кольчуга)
                {id=55500}, -- Barnacle Vambraces (запястья, пластины)
                {id=55496}, -- Polychromatic Pearl Necklace (шея)
                {id=55503}, -- Loop of Unceasing Frost (кольцо)
                {id=55497}, -- Idol of Ebb and Flow (реликвия друида)
                {},
                {id=92020, dropRate=5}, -- Spawn of Cla'ckora (питомец)
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Clackora.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end