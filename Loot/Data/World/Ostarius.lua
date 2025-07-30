-- World_Bosses.lua - Данные предметов с мировых боссов
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные мировых боссов
AtlasTW.InstanceData.Ostarius = {
    Name = BB["Ostarius"],
    Location = BZ["Tanaris"],
    Level = 60,
    Acronym = "Ostarius",
    MaxPlayers = 40,
    DamageType = L["Arcane"],
    Bosses = {
        {
            id = "WBOstarius",
            prefix = "1)",
            name = BB["Ostarius"],
            defaults = { dropRate = 17 },
            loot = {
                {id=83530}, -- Turban of Veiled Mists (голова, ткань)
                {id=83531}, -- Clutch of Mending Winds (пояс, кожа)
                {id=83486}, -- Sandstalker's Shroud (плащ)
                {id=83488}, -- Uldum Construct Stompers (ступни, кольчуга)
                {id=83485}, -- Fists of the Makers (кисти рук, пластины)
                {id=83487}, -- Blade of the Fallen Star (меч, одноручное)
                {},
                {id=83483}, -- Crown of Divine Justice (голова, пластины)
                {id=83532}, -- Bracers of the Crescent Moon (запястья, кожа)
                {id=83484}, -- Desert Wind Talisman (ожерелье)
                {id=83482}, -- Distress Signal Pulser (оффхенд)
                {id=83481}, -- Failsafe Activation Key (оффхенд)
                {id=83480}, -- Tome of Infalliable Truth (оффхенд)
                {},
                {id=83235, dropRate=100}, -- Ancient Locking Mechanism (коллекционный предмет)
                {id=17962, disc=L["Container"], dropRate=20, container={13926,7971,3864,55251,55250,7910,7909,1529,12361}}, -- Blue Sack of Gems
                {id=17963, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12364}}, -- Green Sack of Gems
                {id=17965, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12363}}, -- Yellow Sack of Gems
                {id=17969, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12799,6332}}, -- Red Sack of Gemstones
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Ostarius.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end