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
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Nature"],
--[[     Entrances = {
        { letter = "A"..")", info = L["Entrance"] },
    }, ]]
    Bosses = {
        {
            id = "Erennius",
            prefix = "1)",
            name = BB["Erennius"],
            defaults = { dropRate = 48 },
            loot = {
                {id=61652, dropRate=100, container={61650,61651,61740}}, -- Claw of Erennius
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
                {},
                {},
                {},
                {id=61198, disc=L["Reagent"], dropRate=100}, -- Small Dream Shard (2-5)
                {id=61197, disc=L["Reagent"]}, -- Fading Dream Fragment
                {id=20381, disc=L["Reagent"]}, -- Dreamscale
            }
        },
        {
            id = "Solnius",
            prefix = "2)",
            name = BB["Solnius the Awakener"],
            defaults = { dropRate = 17 },
            loot = {
                {id=61206}, -- Robe of the Dreamways
                {id=61211}, -- Sandals of Lucidity
                {id=61213}, -- Talonwind Gauntlets
                {id=61239}, -- Ancient Jade Leggings
                {id=61210}, -- Veil of Nightmare
                {id=61212}, -- Sanctum Bark Wraps
                {id=61207}, -- Jadestone Helmet
                {id=61214}, -- Mantle of the Wakener
                {},
                {id=61205}, -- Ring of Nature's Duality
                {id=61209}, -- Shard of Nightmare
                {},
                {id=61455}, -- Idol of the Emerald Rot
                {id=61203}, -- Libram of the Dreamguard
                {id=61204}, -- Totem of the Stonebreaker
                {id=41076}, -- Aspect of Seradane
                {id=61237}, -- Mallet of the Awakening
                {id=61238}, -- Scaleshield of Emerald Flight
                {id=61448}, -- Axe of Dormant Slumber
                {id=61208}, -- Staff of the Dreamer
                {},
                {id=61215, dropRate=100, container={61195,61194,61193}}, -- Head of Solnius
                {id=61444, dropRate=20, container={61445}}, -- Smoldering Dream Essence
                {},
                {id=51361, dropRate=14}, -- Glyph of the Dreamkin
                {id=61196, disc=L["Bag"], dropRate=15}, -- Bag of the Vast Conscious
                {},
                {id=61733, dropRate=1}, -- Formula: Eternal Dreamstone Shard
                {id=61217, dropRate=4}, -- Formula: Enchant Chest - Mighty Mana
                {id=70000, dropRate=4}, -- Formula: Enchant Gloves - Nature Power
                {},
                {id=61218, dropRate=4, container={50237}}, -- Recipe: Elixir of Greater Nature Power
                {},
                {id=61428, dropRate=4, container={61356}}, -- Pattern: Dreamhide Mantle
                {id=61432, dropRate=4, container={61360}}, -- Pattern: Dreamthread Mantle
                {},
                {id=61424, dropRate=4, container={61364}}, -- Plans: Dreamsteel Mantle
                {},
                {id=17962, disc=L["Container"], dropRate=20, container={12361,1529,7909,7910,55250,55251,3864,7971,13926}}, -- Blue Sack of Gems
            }
        },
        {
            id = "HardMode",
            prefix = "3)",
            name = L["Favor of Erennius (ES Hard Mode)"],
            defaults = { dropRate = 17 },
            loot = {
                {id=61524}, -- Naturecaller's Tunic
                {id=61522}, -- Choker of the Emerald Lord
                {id=61527}, -- Breath of Solnius
                {},
                {id=61523}, -- Crystal Sword of the Blossom
                {id=61525}, -- Nature's Call
                {id=61526}, -- Jadestone Protector
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=61197, disc=L["Reagent"], dropRate=48}, -- Fading Dream Fragment
            }
        },
        {
            id = "Trash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 1 },
            loot = {
                {id=84502, dropRate=5}, -- Verdant Dreamer's Boots
                {id=84505, dropRate=3}, -- Infused Wildthorn Bracers
                {},
                {id=84506, dropRate=2}, -- Sleeper's Ring
                {id=84504, dropRate=8}, -- Lasher's Whip
                {id=84501, dropRate=6}, -- Corrupted Reed
                {},
                {id=84500}, -- Lucid Nightmare
                {id=84509}, -- Emerald Rod
                {id=84503}, -- Nature's Gift
                {},
                {},
                {},
                {},
                {},
                {id=61198, disc=L["Reagent"], dropRate=8}, -- Small Dream Shard
                {id=20381, disc=L["Reagent"], dropRate=5}, -- Dreamscale
                {id=61197, disc=L["Reagent"], dropRate=0.35}, -- Fading Dream Fragment
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.EmeraldSanctum.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end