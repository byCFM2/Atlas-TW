-- Molten_Core.lua - Данные предметов из Огненных Недр
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Подключаем ItemDB для создания предметов
local ItemDB = AtlasTW.ItemDB

-- Данные Огненных Недр
AtlasTW.InstanceData.MoltenCore = {
    Name = BZ["Molten Core"],
    Location = BZ["Blackrock Depths"],
    Level = 60,
    Acronym = "MC",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Fire"],
    Entrances = {
        { letter = "A"..") " .. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Hydraxian Waterlords"], loot = "WaterLords1" }
    },
    Keys = {
        { name = L["Aqual Quintessence"], loot = "VanillaKeys", info = L["Boss"] },
        { name = L["Eternal Quintessence"], loot = "VanillaKeys", info = L["Boss"] }
    },
    Bosses = {
        {
            id = "Lucifron",
            prefix = "1)",
            name = BB["Lucifron"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16800, dropRate=20, container={47085}},{id=16829, dropRate=20, container={47337,47345}}, {id=16837, dropRate=20, container={47127,47135}},
                {id=16859, dropRate=20, container={47007,47015}}, {id=16863, dropRate=30, container={47244}}, {id=16805, dropRate=30, container={47280}},{},
                {id=18870}, {id=17109, dropRate=20}, {id=19145}, {id=19146}, {id=18872}, {id=18875}, {id=18861}, {id=18879}, {id=19147}, {id=17077},
                {id=18878}, {}, {id=16665, disc=L["Book"], dropRate=100},
            }
        },
        {
            id = "Trash",
            name = L["Trash Mobs"],
            loot = {

            },
        },
        {   id = "Randombossloot",
            name = L["Random Boss Loot"],
            loot = {

            },
        },
    },
}

-- Вспомогательная функция для создания предметов из таблицы loot
local function CreateItemsFromLootTable(bossData)
    if not bossData.loot then return {} end
    local items = {}
    local defaults = bossData.defaults or {}
    for _, itemData in ipairs(bossData.loot) do
        -- Применяем значения по умолчанию
        for key, value in pairs(defaults) do
            if itemData[key] == nil then
                itemData[key] = value
            end
        end
        table.insert(items, ItemDB.CreateItem(itemData))
    end
    return items
end

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
    bossData.Items = CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

-- Функция получения всех предметов из подземелья
function AtlasTW.InstanceData.MoltenCore.GetAllItems()
    local allItems = {}
    for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
        if bossData.Items then
            for i = 1, getn(bossData.Items) do
                local item = bossData.Items[i]
                tinsert(allItems, item)
            end
        end
    end
    for i = 1, getn(AtlasTW.InstanceData.MoltenCore.Trash) do
        local item = AtlasTW.InstanceData.MoltenCore.Trash[i]
        --[[ 
        item.source = L["Trash Mobs"]
        item.zone = BZ["Molten Core"] ]]
        tinsert(allItems, item)
    end
    return allItems
end

-- Функция получения предметов для конкретного босса
function AtlasTW.InstanceData.MoltenCore.GetBossItems(bossName)
    for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
        if bossData.name == BB[bossName] then
            return bossData.Items
        end
    end
    return {}
end

-- Функция получения предметов для определенного класса
function AtlasTW.InstanceData.MoltenCore.GetItemsForClass(className)
    local classItems = {}
    local allItems = AtlasTW.InstanceData.MoltenCore.GetAllItems()
    for i = 1, getn(allItems) do
        if allItems[i]:IsValidForClass(className) then
            tinsert(classItems, allItems[i])
        end
    end
    return classItems
end