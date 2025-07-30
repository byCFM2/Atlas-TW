-- World_Bosses.lua - Данные предметов с мировых боссов
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные мировых боссов
AtlasTW.InstanceData.CowKing = {
    Name = BB["Moo"],
    Location = BZ["Moomoo Grove"],
    Level = 60,
    Acronym = "CowKing",
    MaxPlayers = 20,
    DamageType = L["Physical"],
    Bosses = {
        {
            id = "WBCowKing",
            prefix = "1)",
            name = BB["Moo"],
            default = { dropRate = 50 },
            loot = {
                {id=60486, dropRate=25}, -- Fishbringer (булава, двуручное)
                {},
                {id=60487,}, -- Cloak of the Moo Lord (плащ)
                {id=60488}, -- Drape of the Herd (плащ)
                {id=60489}, -- Cap of the Cow Savant (голова, ткань)
                {id=60490}, -- Cowskin Chapeau (голова, ткань)
                {},
                {id=4144, disc=L["Book"], dropRate=100}, -- Tome of Polymorph: Cow (книга заклинаний мага)
                {},
                {id=60485, disc=L["Misc"], dropRate=100}, -- Sealed Diablo II Lord of Destruction Collectors Edition (разное)
                {id=60491, disc=L["Misc"], dropRate=100}, -- The Moo Stone (разное)
                {},
                {id=51261, dropRate=100}, -- Little Cow (питомец)
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.CowKing.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end