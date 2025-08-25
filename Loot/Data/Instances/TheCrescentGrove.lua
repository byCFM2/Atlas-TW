-- TheCrescentGrove.lua - Данные предметов из The Crescent Grove
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные The Crescent Grove
AtlasTW.InstanceData.TheCrescentGrove = {
    Name = BZ["The Crescent Grove"],
    Location = BZ["Ashenvale"],
    Level = {32,38},
    Acronym = "CG",
    MaxPlayers = 5,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A" }
    },
    Bosses = {
        {
            prefix = "a)",
            name = L["Kalanar's Strongbox"],
            color = "|cff9d9d9d",
        },
        {
            id = "TCGGrovetenderEngryss",
            prefix = "1)",
            name = BB["Grovetender Engryss"],
            defaults = { dropRate = 24 },
            loot = {
                {id=83220},
                {id=83221},
                {id=83222},
                {id=83223},
                {},
                {id=83224, dropRate=5},
                {},
                {id=60176, dropRate=100},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1}, -- Fashion Coin
            }
        },
        {
            id = "TCGKeeperRanathos",
            prefix = "2)",
            name = BB["Keeper Ranathos"],
            defaults = { dropRate = 24 },
            loot = {
                {id=83225},
                {id=83227},
                {id=83226},
                {id=83228},
                {},
                {id=83229, dropRate=5},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1}, -- Fashion Coin
            }
        },
        {
            id = "TCGHighPriestessAlathea",
            prefix = "3)",
            name = BB["High Priestess A'lathea"],
            defaults = { dropRate = 30 },
            loot = {
                {id=83208},
                {id=83209},
                {id=83211},
                {},
                {id=83210, dropRate=10},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1}, -- Fashion Coin
            }
        },
        {
            id = "TCGFenektistheDeceiver",
            prefix = "4)",
            name = BB["Fenektis the Deceiver"],
            defaults = { dropRate = 25 },
            loot = {
                {id=83212},
                {id=83213},
                {id=83214},
                {id=83215},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1}, -- Fashion Coin
            }
        },
        {
            id = "TCGMasterRaxxieth",
            prefix = "5)",
            name = BB["Master Raxxieth"],
            defaults = { dropRate = 25 },
            loot = {
                {id=60258, dropRate=0.5},
                {},
                {id=83216},
                {id=83217},
                {id=83218},
                {id=83219},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5}, -- Fashion Coin
            }
        },
        {
            id = "TCGTrash",
            name = L["Trash Mobs"].." "..BZ["The Crescent Grove"],
            defaults = { dropRate = .01 },
            loot = {
                {id=83203},
                {id=83204, dropRate=.5},
                {id=83207, dropRate=.10},
                {id=83201, dropRate=.5},
                {id=83206},
                {id=83202, dropRate=.5},
                {id=83200},
                {id=83205, dropRate=.5},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheCrescentGrove.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end