-- FourDragons.lua - Данные предметов с изумрудных драконов
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local ShareLoot = {
    {},
    -- Общие предметы драконов (11% шанс)
    {id=20579, dropRate=11}, -- Green Dragonskin Cloak (плащ)
    {id=20615, dropRate=11}, -- Dragonspur Wraps (запястья, кожа)
    {id=20616, dropRate=11}, -- Dragonbone Wristguards (запястья, пластины)
    {id=20618, dropRate=11}, -- Gloves of Delusional Power (перчатки, ткань)
    {id=20617, dropRate=11}, -- Ancient Corroded Leggings (ноги, кольчуга)
    {id=20619, dropRate=11}, -- Acid Inscribed Greaves (ступни, пластины)
    {id=20582, dropRate=11}, -- Trance Stone (аксессуар)
    {id=20644, dropRate=100, container={20600}}, -- Nightmare Engulfed Object (квестовый предмет)
    {},
    {id=17962, disc=L["Container"], dropRate=20, container={13926,7971,3864,55251,55250,7910,7909,1529,12361}}, -- Blue Sack of Gems
    {id=17963, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12364}}, -- Green Sack of Gems
    {id=17964, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12800}}, -- Gray Sack of Gems
    {id=17965, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12363}}, -- Yellow Sack of Gems
    {id=17969, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12799,6332}}, -- Red Sack of Gems
    -- Редкие предметы (общие для всех драконов)
    {},
    {id=20580, dropRate=8.93}, -- Hammer of Bestial Fury (молот, двуручное)
    {id=20581, dropRate=9.70}, -- Staff of Rampant Growth (посох)
    {},
    {id=20381, disc=L["Reagent"], dropRate=100}, -- Dreamscale (материал для профессий)
}
-- Данные изумрудных драконов
AtlasTW.InstanceData.FourDragons = {
    Name = L["Emerald Dragons"],
    Location = L["Various Locations"],
    Level = {1, 60},
    Acronym = "ED",
    MaxPlayers = 40,
    DamageType = L["Nature"]..", ".. L["Shadow"],
    Bosses = {
        {
            id = "WBLethon",
            prefix = "1)",
            name = BB["Lethon"],
            postfix = BZ["Duskwood"],
            defaults = { dropRate = 14 },
            loot = {
                {id=20628}, -- Deviate Growth Cap (голова, кожа)
                {id=20626}, -- Black Bark Wristbands (запястья, ткань)
                {id=20630}, -- Gauntlets of the Shining Light (перчатки, пластины)
                {id=20625}, -- Belt of the Dark Bog (пояс, ткань)
                {id=20627}, -- Dark Heart Pants (ноги, кожа)
                {id=20629}, -- Malignant Footguards (ступни, кольчуга)
                {id=65102}, -- Hood of Delusional Power (голова, ткань)
                unpack(ShareLoot)
            }
        },
        {
            id = "WBEmeriss",
            prefix = "2)",
            name = BB["Emeriss"],
            postfix = BZ["The Hinterlands"],
            defaults = { dropRate = 14 },
            loot = {
                {id=20623}, -- Circlet of Restless Dreams (голова, кожа)
                {id=20622}, -- Dragonheart Necklace (ожерелье)
                {id=20624}, -- Ring of the Unliving (кольцо)
                {id=20621}, -- Boots of the Endless Moor (ступни, кольчуга)
                {id=20599}, -- Polished Ironwood Crossbow (арбалет)
                {id=65100}, -- Dragonspur Boots (ступни, кожа)
                {id=65101}, -- Dragonbone Waistguard (пояс, пластины)
                unpack(ShareLoot)
            }
        },
        {
            id = "WBTaerar",
            prefix = "3)",
            name = BB["Taerar"],
            postfix = BZ["Feralas"],
            defaults = { dropRate = 17 },
            loot = {
                {id=20633}, -- Unnatural Leather Spaulders (плечи, кожа)
                {id=20631}, -- Mendicant's Slippers (ступни, ткань)
                {id=20634}, -- Boots of Fright (ступни, кожа)
                {id=20632}, -- Mindtear Band (кольцо)
                {id=20577}, -- Nightmare Blade (меч, одноручное)
                {id=65105}, -- Scale of the Wakener (аксессуар)
                unpack(ShareLoot)
            }
        },
        {
            id = "WBYsondre",
            prefix = "4)",
            name = BB["Ysondre"],
            postfix = BZ["Ashenvale"],
            defaults = { dropRate = 13 },
            loot = {
                {id=20637}, -- Acid Inscribed Pauldrons (плечи, пластины)
                {id=20635}, -- Jade Inlaid Vestments (грудь, ткань)
                {id=20638}, -- Leggings of the Demented Mind (ноги, кольчуга)
                {id=20639}, -- Strangely Glyphed Legplates (ноги, пластины)
                {id=20636}, -- Hibernation Crystal (аксессуар)
                {id=20578}, -- Emerald Dragonfang (кинжал, одноручное)
                {id=65103}, -- Shell of the Great Sleeper (щит)
                unpack(ShareLoot)
            }
        },
        {
            id = "WBEDTrash",
            name = L["Trash Mobs"] .. " (" .. L["Emerald Dragons"] .. ")",
            loot = {
                {id=21146, dropRate=5}, -- Fragment of the Nightmare's Corruption
                {id=21147, dropRate=5}, -- Fragment of the Nightmare's Corruption
                {id=21148, dropRate=5}, -- Fragment of the Nightmare's Corruption
                {id=21149, dropRate=100}, -- Fragment of the Nightmare's Corruption (гарантированный)
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.FourDragons.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end