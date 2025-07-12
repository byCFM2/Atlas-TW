-- ItemDB.lua - Центральная база данных предметов
-- Современная модульная структура для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
AtlasTW.ItemDB = {}

-- Константы качества предметов
local ITEM_QUALITY = {
    POOR = 0,
    COMMON = 1,
    UNCOMMON = 2,
    RARE = 3,
    EPIC = 4,
    LEGENDARY = 5,
    ARTIFACT = 6
}

-- Константы типов брони
local ARMOR_TYPE_LEGACY = {
    CLOTH = "a1",
    LEATHER = "a2",
    MAIL = "a3",
    PLATE = "a4"
}

local SLOT_TYPE = {
    CLOTH = L["Cloth"],
    LEATHER = L["Leather"],
    MAIL = L["Mail"],
    PLATE = L["Plate"],

    AXE = L["Axe"],
    BOW = L["Bow"],
    CROSSBOW = L["Crossbow"],
    DAGGER = L["Dagger"],
    GUN = L["Gun"],
    MACE = L["Mace"],
    POLEARM = L["Polearm"],
    SHIELD = L["Shield"],
    STAFF = L["Staff"],
    SWORD = L["Sword"],
    THROWN = L["Thrown"],
    WAND = L["Wand"],
    FISTWEAPON = L["Fist Weapon"],
    FISHINGPOLE = L["Fishing Pole"],
}

-- Константы слотов экипировки
local EQUIPMENT_SLOT_LEGACY = {
    HEAD = "s1",
    NECK = "s2",
    SHOULDER = "s3",
    BACK = "s4",
    CHEST = "s5",
    WRIST = "s8",
    HANDS = "s9",
    WAIST = "s10",
    LEGS = "s11",
    FEET = "s12",
    RING = "s13",
    TRINKET = "s14",
    HELDINOFFHAND = "s15",
    RELIC = "s16",
}

local EQUIPMENT_SLOT = {
    HEAD = L["Head"],
    NECK = L["Neck"],
    SHOULDER = L["Shoulder"],
    BACK = L["Back"],
    CHEST = L["Chest"],
    WRIST = L["Wrist"],
    HANDS = L["Hands"],
    WAIST = L["Waist"],
    LEGS = L["Legs"],
    FEET = L["Feet"],
    RING = L["Ring"],
    TRINKET = L["Trinket"],
    HELDINOFFHAND = L["Held In Off-hand"],
    RELIC = L["Relic"],
    ONEHAND = L["One-Hand"],
    TWOHAND = L["Two-Hand"],
    MAINHAND = L["Main Hand"],
    OFFHAND = L["Off Hand"],

--[[     BOOK = L["Book"],
    AMMO = L["Ammo"],
    QUIVER = L["Quiver"],
    CURRENCY = L["Currency"],
    MISC = L["Miscellaneous"], ]]
}

-- Прототип предмета
local ItemPrototype = {
    -- Получить отформатированное имя с цветом качества
    GetFormattedName = function(this)
        local qualityColors = {
            [0] = "|cff9d9d9d", -- Серый
            [1] = "|cffffffff", -- Белый
            [2] = "|cff1eff00", -- Зеленый
            [3] = "|cff0070dd", -- Синий
            [4] = "|cffa335ee", -- Фиолетовый
            [5] = "|cffff8000", -- Оранжевый
            [6] = "|cffe6cc80"  -- Артефакт
        }

        local color = qualityColors[this.quality] or "|cffffffff"
        return color .. this.name .. "|r"
    end,

    -- Получить описание предмета
    GetDescription = function(this)
        local desc = ""

        if this.slot then
            desc = desc .. "#" .. this.slot .. "#"
        end

        if this.slotType then
            desc = desc .. ", #" .. this.slotType .. "#"
        end

        if this.class then
            desc = desc .. " =q" .. (this.classQuality or 1) .. "=#" .. this.class .. "#"
        end

        return desc
    end,

    -- Получить шанс выпадения как строку
    GetDropRateText = function(this)
        if this.dropRate then
            return tostring(this.dropRate) .. "%"
        end
        return ""
    end,

    -- Проверить, подходит ли предмет для класса
    IsValidForClass = function(this, playerClass)
        if not this.validClasses then
            return true -- Если не указаны классы, предмет подходит всем
        end

        for i = 1, getn(this.validClasses) do
            if this.validClasses[i] == playerClass then
                return true
            end
        end

        return false
    end
}

-- Функция создания нового предмета
function AtlasTW.ItemDB.CreateItem(data)
    -- Проверяем обязательные поля
    if not data.id then
        DEFAULT_CHAT_FRAME:AddMessage("ItemDB: Ошибка создания предмета - отсутствуют обязательные поля")
        return nil
    end

    -- Устанавливаем значения по умолчанию
    local item = {
        id = data.id,
        name = data.name or "",
        icon = data.icon or "INV_Misc_QuestionMark",
        quality = data.quality or ITEM_QUALITY.EPIC,
        slot = data.slot or "",
        slotType = data.slotType or "",
        class = data.class or "",
        classQuality = data.classQuality or "",
        dropRate = data.dropRate or "",
        validClasses = data.validClasses or "",
        --[[ 
        source = data.source, -- Источник получения (босс, квест и т.д.)
        zone = data.zone,     -- Зона получения ]]
        notes = data.notes    -- Дополнительные заметки
    }

    -- Устанавливаем метатаблицу для доступа к методам
    setmetatable(item, {__index = ItemPrototype})

    return item
end

-- Функция создания разделителя/заголовка
function AtlasTW.ItemDB.CreateSeparator(text, quality)
    return {
        id = 0,
        name = text or "",
        icon = "INV_Box_01",
        quality = quality or 6,
        isSeparator = true
    }
end

-- Функция конвертации из старого формата в новый
function AtlasTW.ItemDB.ConvertFromLegacyFormat(legacyItem)
    if not legacyItem or getn(legacyItem) < 4 then
        return nil
    end

    local id = legacyItem[1]
    local icon = legacyItem[2]
    local nameWithQuality = legacyItem[3]
    local description = legacyItem[4]
    local dropRate = legacyItem[5]

    -- Если это разделитель
    if id == 0 then
        local quality = 6 -- По умолчанию для заголовков
        if nameWithQuality and strfind(nameWithQuality, "=q(%d)=") then
            local _, _, q = strfind(nameWithQuality, "=q(%d)=")
            quality = tonumber(q) or 6
        end

        local text = nameWithQuality or ""
        text = gsub(text, "=q%d+=", "")

        return AtlasTW.ItemDB.CreateSeparator(text, quality)
    end

    -- Парсим качество из имени
    local quality = ITEM_QUALITY.COMMON
    local name = nameWithQuality
    if nameWithQuality and strfind(nameWithQuality, "=q(%d)=") then
        local _, _, q = strfind(nameWithQuality, "=q(%d)=")
        quality = tonumber(q) or ITEM_QUALITY.COMMON
        name = gsub(nameWithQuality, "=q%d+=", "")
    end

    -- Парсим описание
    local slot, slotType, class, classQuality
    if description then
        -- Парсим слот
        if strfind(description, "#(s%d+)#") then
            local _, _, s = strfind(description, "#(s%d+)#")
            slot = s
        end

        -- Парсим тип брони
        if strfind(description, "#(a%d+)#") then
            local _, _, a = strfind(description, "#(a%d+)#")
            slotType = a
        end

        -- Парсим класс
        if strfind(description, "=q(%d+)=#(c%d+)#") then
            local _, _, cq, c = strfind(description, "=q(%d+)=#(c%d+)#")
            classQuality = tonumber(cq)
            class = c
        end
    end

    -- Парсим шанс выпадения
    local dropRateNum
    if dropRate and dropRate ~= "" then
        local _, _, rate = strfind(dropRate, "(%d+)%%?")
        dropRateNum = tonumber(rate)
    end

    return AtlasTW.ItemDB.CreateItem({
        id = id,
        name = name,
        icon = icon,
        quality = quality,
        slot = slot,
        slotType = slotType,
        class = class,
        classQuality = classQuality,
        dropRate = dropRateNum
    })
end

-- Функция получения всех предметов (новый API)
function AtlasTW.ItemDB.GetAllItems(category, subcategory)
    local items = {}

    if category == "instances" and AtlasTW.InstanceData then
        if subcategory and AtlasTW.InstanceData[subcategory] then
            if AtlasTW.InstanceData[subcategory].GetAllItems then
                items = AtlasTW.InstanceData[subcategory].GetAllItems()
            end
        else
            -- Получаем предметы из всех подземелий
            for instanceName, instanceData in pairs(AtlasTW.InstanceData) do
                if type(instanceData) == "table" and instanceData.GetAllItems then
                    local instanceItems = instanceData.GetAllItems()
                    for i = 1, getn(instanceItems) do
                        tinsert(items, instanceItems[i])
                    end
                end
            end
        end
    elseif category == "world" and AtlasTW.WorldData then
        if subcategory and AtlasTW.WorldData[subcategory] then
            if AtlasTW.WorldData[subcategory].GetAllItems then
                items = AtlasTW.WorldData[subcategory].GetAllItems()
            end
        else
            -- Получаем предметы из всех мировых источников
            for sourceName, sourceData in pairs(AtlasTW.WorldData) do
                if type(sourceData) == "table" and sourceData.GetAllItems then
                    local sourceItems = sourceData.GetAllItems()
                    for i = 1, getn(sourceItems) do
                        tinsert(items, sourceItems[i])
                    end
                end
            end
        end
    end

    return items
end

-- Функция поиска предметов
function AtlasTW.ItemDB.SearchItems(searchTerm, category)
    local allItems

    if category then
        allItems = AtlasTW.ItemDB.GetAllItems(category)
    else
        -- Поиск во всех категориях
        allItems = {}
        local categories = {"instances", "world"}

        for i = 1, getn(categories) do
            local categoryItems = AtlasTW.ItemDB.GetAllItems(categories[i])
            for j = 1, getn(categoryItems) do
                tinsert(allItems, categoryItems[j])
            end
        end
    end

    local foundItems = {}
    searchTerm = strlower(searchTerm)

    for i = 1, getn(allItems) do
        local item = allItems[i]
        if item.name and strfind(strlower(item.name), searchTerm) then
            tinsert(foundItems, item)
        end
    end

    return foundItems
end

-- Экспорт констант
AtlasTW.ItemDB.ITEM_QUALITY = ITEM_QUALITY
AtlasTW.ItemDB.SLOT_TYPE = SLOT_TYPE
AtlasTW.ItemDB.EQUIPMENT_SLOT = EQUIPMENT_SLOT