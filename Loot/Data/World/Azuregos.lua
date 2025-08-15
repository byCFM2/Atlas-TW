-- World_Bosses.lua - Данные предметов с мировых боссов
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные мировых боссов
AtlasTW.InstanceData.Azuregos = {
    Name = BB["Azuregos"],
    Location = BZ["Azshara"],
    Level = {1, 60},
    Acronym = "AZ",
    MaxPlayers = 40,
    DamageType = L["Frost"],
    Bosses = {
        {
            id = "WBAzuregos",
            prefix = "1)",
            name = BB["Azuregos"],
            defaults = { dropRate = 10 },
            loot = {
                {id=19132}, -- Crystal Adorned Crown (голова, ткань)+
                {id=18208}, -- Drape of Benediction (плащ)+
                {id=18541, dropRate=11.71}, -- Puissant Cape (плащ)
                {id=18547}, -- Unmelting Ice Girdle (пояс, пластины)
                {id=18545}, -- Leggings of Arcane Supremacy (ноги, ткань)+
                {id=19131}, -- Snowblind Shoes (ступни, ткань)
                {id=19130}, -- Cold Snap (жезл)+
                {id=17070}, -- Fang of the Mystics (кинжал, одноручное)+
                {id=18202}, -- Eskhandar's Left Claw (кулак, оружие)+
                {id=18542}, -- Typhoon (меч, двуручное)
                {},
                {id=18704, disc=L["Quest Item"], dropRate=100, container={18714}}, -- Mature Blue Dragon Sinew (материал для лука охотника)
                {},
                {id=83544, dropRate=40, container={65006}}, -- Pattern: Stormscale Leggings (выкройка кожевничества)
            }
        },
        {
            id = "WBSpiritA",
            name = L["Spirit of Azuregos"],
            loot = {
                 {id=20949, container={21526,21527}}, -- Magical Ledger (квестовый предмет)
             }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Azuregos.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end