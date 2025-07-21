-- Emerald_Sanctum.lua - Данные предметов из Изумрудного Святилища
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Изумрудного Святилища
AtlasTW.InstanceData.EmeraldSanctum = {
    Name = BZ["Emerald Sanctum"],
    Location = BZ["Hyjal"],
    Level = 60,
    Acronym = "ES",
    MaxPlayers = 40,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A"..")", info = L["Entrance"] },
        { letter = "B", info = L["Connection"] }
    },
    Bosses = {
        {
            id = "Erennius",
            prefix = "1)",
            name = BB["Erennius"],
            defaults = { dropRate = 15 },
            loot = {
                {id=61652}, -- Claw of Erennius
                {id=61650}, -- Jadestone Skewer
                {id=61651}, -- Jadestone Mallet
                {id=61740}, -- Claw of Senthos
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=61198}, -- Small Dream Shard
                {id=61197}, -- Fading Dream Fragment
                {id=20381}, -- Dreamscale
                {},
                {},
                {},
                {},
                {},
                {},
                {},
            }
        },
        {
            id = "Solnius",
            prefix = "2)",
            name = BB["Solnius the Awakener"],
            defaults = { dropRate = 12 },
            loot = {
                {id=61206}, -- Robe of the Dreamways
                {id=61211}, -- Sandals of Lucidity
                {id=61213}, -- Talonwind Gauntlets
                {id=61239}, -- Ancient Jade Leggings
                {id=61210}, -- Veil of Nightmare
                {id=61212}, -- Sanctum Bark Wraps
                {id=61207}, -- Jadestone Helmet
                {id=61214}, -- Mantle of the Wakener
                {id=61205}, -- Ring of Nature's Duality
                {id=61209}, -- Shard of Nightmare
                {id=41076}, -- Aspect of Seradane
                {id=61237}, -- Mallet of the Awakening
                {id=61238}, -- Scaleshield of Emerald Flight
                {id=61448}, -- Axe of Dormant Slumber
                {id=61208}, -- Staff of the Dreamer
                {id=61455}, -- Idol of the Emerald Rot
                {id=61203}, -- Libram of the Dreamguard
                {id=61204}, -- Totem of the Stonebreaker
                {id=61215}, -- Head of Solnius
                {},
                {},
                {},
                {},
                {},
            }
        },
        {
            id = "HardMode",
            prefix = "3)",
            name = L["Favor of Erennius (ES Hard Mode)"],
            defaults = { dropRate = 20 },
            loot = {
                {id=61524}, -- Naturecaller's Tunic
                {id=61522}, -- Choker of the Emerald Lord
                {id=61527}, -- Breath of Solnius
                {},
                {id=61523}, -- Crystal Sword of the Blossom
                {id=61525}, -- Nature's Call
                {id=61526}, -- Jadestone Protector
                {},
                {id=61197}, -- Fading Dream Fragment
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
            }
        },
        {
            id = "Trash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 5 },
            loot = {
                {id=84502, dropRate=5}, -- Verdant Dreamer's Boots
                {id=84505, dropRate=3}, -- Infused Wildthorn Bracers
                {id=84506, dropRate=2}, -- Sleeper's Ring
                {id=84504, dropRate=8}, -- Lasher's Whip
                {id=84501, dropRate=6}, -- Corrupted Reed
                {id=84500, dropRate=1}, -- Lucid Nightmare
                {id=84509, dropRate=1}, -- Emerald Rod
                {id=84503, dropRate=1}, -- Nature's Gift
                {},
                {id=61198, dropRate=8}, -- Small Dream Shard
                {id=20381, dropRate=5}, -- Dreamscale
                {id=61197, dropRate=0.35}, -- Fading Dream Fragment
                {},
                {},
                {},
                {},
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.EmeraldSanctum.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end