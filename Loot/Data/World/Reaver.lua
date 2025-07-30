-- Reaver.lua - Данные предметов с мирового босса Dark Reaver of Karazhan
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные мирового босса Dark Reaver of Karazhan
AtlasTW.InstanceData.Reaver = {
    Name = BB["Dark Reaver of Karazhan"],
    Location = BZ["Deadwind Pass"],
    Level = 60,
    Acronym = "Reaver",
    MaxPlayers = 40,
    DamageType = L["Shadow"],
    Bosses = {
        {
            id = "WBReaver",
            prefix = "1)",
            name = BB["Dark Reaver of Karazhan"],
            defaults = { dropRate = 4 },
            loot = {
                {id=51778}, -- Lost Crusader's Artifact (левая рука)
                {id=51779}, -- Greataxe of the Decrepit Crypt (топор, двуручное)
                {id=51780}, -- Ghoulslayer Shotgun (ружье)
                {id=51796}, -- Shield of Consuming Darkness (щит)
                {id=51797}, -- Claw of the Wildshifter (кулак, одноручное)
                {id=51799}, -- Libram of Veracity (реликвия паладина)
                {id=51800}, -- Totem of Earthstorm (реликвия шамана)
                {id=51798}, -- Idol of the Wildshifter (реликвия друида)
                {id=51782}, -- Mindpiercer Band (палец)
                {},
                {},
                {id=51777}, -- Necromancer's Visage (голова, ткань)
                {id=51789}, -- Circlet of Forlorn Spirits (голова, ткань)
                {id=51781}, -- Necrotic Wake Mantle (плечи, ткань)
                {id=51784}, -- Belt of Archaic Power (пояс, ткань)
                {id=51788}, -- Visage of the Forgotten (голова, кожа)
                {id=51787}, -- Spaulders of Insight (плечи, кожа)
                {id=51783}, -- Shadowskin Bracers (запястья, кожа)
                {id=51776}, -- Plagued Mind Leggings (ноги, кожа)
                {},
                {id=51786}, -- Cryptbone Hauberk (грудь, кольчуга)
                {id=51785}, -- Stoneslate Belt (пояс, кольчуга)
                {},
                {id=51769}, -- Crown of the Dark Reaver (голова, пластины)
                {id=51770}, -- Shoulderguards of the Dark Reaver (плечи, пластины)
                {id=51771}, -- Chestplate of the Dark Reaver (грудь, пластины)
                {id=51772}, -- Grasp of the Dark Reaver (кисти, пластины)
                {id=51773}, -- Girdle of the Dark Reaver (пояс, пластины)
                {id=51775}, -- Legguards of the Dark Reaver (ноги, пластины)
                {id=51774}, -- Sabatons of the Dark Reaver (ступни, пластины)
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Reaver.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end