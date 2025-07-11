-- Molten_Core.lua - Данные предметов из Огненных Недр
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Подключаем ItemDB для создания предметов
local ItemDB = AtlasTW.ItemDB

-- Данные Огненных Недр
AtlasTW.InstanceData.MoltenCore = {
    name = BZ["Molten Core"],
    location = BZ["Blackrock Depths"],
    level = {60, 60},
    acronym = "MC",
    type = "raid",
    attunement = true,
    maxPlayers = 40,
    reputation = {
        name = "Hydraxian Waterlords", table = "WaterLords1"
    },
    keys = {
        { name = "Aqual Quintessence", table = "VanillaKeys", info = L["Boss"] },
        { name = "Eternal Quintessence", table = "VanillaKeys", info = L["Boss"] }
    },
    entrances = {
        { letter = "A" }
    },
    damageType = L["Fire"],
    bosses = {
        -- Лусифрон
        Lucifron = {
            name = BB["Lucifron"],
            items = {
                ItemDB.CreateItem({id=16800, name=L["Arcanist Boots"], slot=ItemDB.EQUIPMENT_SLOT.FEET, slotType=ItemDB.SLOT_TYPE.CLOTH, validClasses={"PRIEST"}, dropRate="20%"}),
                ItemDB.CreateItem({id=16829, name=L["Cenarion Boots"], slot=ItemDB.EQUIPMENT_SLOT.FEET, slotType=ItemDB.SLOT_TYPE.LEATHER, validClasses={"DRUID"}, dropRate="20%"}),
                ItemDB.CreateItem({id=16837, name=L["Earthfury Boots"], slot=ItemDB.EQUIPMENT_SLOT.FEET, slotType=ItemDB.SLOT_TYPE.MAIL, validClasses={"SHAMAN"}, dropRate="20%"}),
                ItemDB.CreateItem({id=16859, name=L["Lawbringer Boots"], slot=ItemDB.EQUIPMENT_SLOT.FEET, slotType=ItemDB.SLOT_TYPE.PLATE, validClasses={"PALADIN"}, dropRate="20%"}),
                ItemDB.CreateItem({id=16863, name=L["Gauntlets of Might"], slot=ItemDB.EQUIPMENT_SLOT.HANDS, slotType=ItemDB.SLOT_TYPE.PLATE, validClasses={"WARRIOR"}, dropRate="30%"}),
                ItemDB.CreateItem({id=16805, name=L["Felheart Gloves"], slot=ItemDB.EQUIPMENT_SLOT.HANDS, slotType=ItemDB.SLOT_TYPE.CLOTH, validClasses={"WARLOCK"}, dropRate="30%"}),
                ItemDB.CreateItem({id=18870, name=L["Helm of the Lifegiver"], slot=ItemDB.EQUIPMENT_SLOT.HEAD, slotType=ItemDB.SLOT_TYPE.MAIL, dropRate="4%"}),
                ItemDB.CreateItem({id=17109, name=L["Choker of Enlightenment"], slot=ItemDB.EQUIPMENT_SLOT.NECK, dropRate="20%"}),
                ItemDB.CreateItem({id=19145, name=L["Robe of Volatile Power"], slot=ItemDB.EQUIPMENT_SLOT.CHEST, slotType=ItemDB.SLOT_TYPE.CLOTH, dropRate="4%"}),
                ItemDB.CreateItem({id=19146, name=L["Wristguards of Stability"], slot=ItemDB.EQUIPMENT_SLOT.WRISTS, slotType=ItemDB.SLOT_TYPE.LEATHER, dropRate="4%"}),
                ItemDB.CreateItem({id=18872, name=L["Manastorm Leggings"], slot=ItemDB.EQUIPMENT_SLOT.LEGS, slotType=ItemDB.SLOT_TYPE.CLOTH, dropRate="4%"}),
                ItemDB.CreateItem({id=18875, name=L["Salamander Scale Pants"], slot=ItemDB.EQUIPMENT_SLOT.LEGS, slotType=ItemDB.SLOT_TYPE.LEATHER, dropRate="4%"}),
                ItemDB.CreateItem({id=18861, name=L["Flamewaker Legplates"], slot=ItemDB.EQUIPMENT_SLOT.LEGS, slotType=ItemDB.SLOT_TYPE.PLATE, dropRate="4%"}),
                ItemDB.CreateItem({id=18879, name=L["Heavy Dark Iron Ring"], slot=ItemDB.EQUIPMENT_SLOT.FINGER, dropRate="4%"}),
                ItemDB.CreateItem({id=19147, name=L["Ring of Spell Power"], slot=ItemDB.EQUIPMENT_SLOT.FINGER, dropRate="4%"}),
                ItemDB.CreateItem({id=17077, name=L["Crimson Shocker"], slot=ItemDB.EQUIPMENT_SLOT.ONE_HAND, slotType=ItemDB.SLOT_TYPE.WAND, dropRate="4%"}),
                ItemDB.CreateItem({id=18878, name=L["Sorcerous Dagger"], slot=ItemDB.EQUIPMENT_SLOT.ONE_HAND, slotType=ItemDB.SLOT_TYPE.DAGGER, dropRate="4%"}),
                ItemDB.CreateItem({id=16665, name=L["Tome of Tranquilizing Shot"], slot=L["Book"], slotType=BC["Hunter"], quality=ItemDB.ITEM_QUALITY.UNCOMMON, dropRate="100%"}),
            }
        },

    },

    -- Общие предметы (мусор, материалы и т.д.)
    trash = {
    }
}

-- Функция получения всех предметов из подземелья
function AtlasTW.InstanceData.MoltenCore.GetAllItems()
    local allItems = {}
    for bossName, bossData in pairs(AtlasTW.InstanceData.MoltenCore.bosses) do
        if bossData.items then
            for i = 1, getn(bossData.items) do
                local item = bossData.items[i]
                tinsert(allItems, item)
            end
        end
    end
    for i = 1, getn(AtlasTW.InstanceData.MoltenCore.trash) do
        local item = AtlasTW.InstanceData.MoltenCore.trash[i]
        item.source = "Trash Mobs"
        item.zone = "Molten Core"
        tinsert(allItems, item)
    end
    return allItems
end

-- Функция получения предметов для конкретного босса
function AtlasTW.InstanceData.MoltenCore.GetBossItems(bossName)
    if AtlasTW.InstanceData.MoltenCore.bosses[bossName] then
        return AtlasTW.InstanceData.MoltenCore.bosses[bossName].items
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