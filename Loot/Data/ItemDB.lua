-- ItemDB.lua - Центральная база данных предметов
-- Современная модульная структура для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
AtlasTW.ItemDB = {}

AtlasTW.ItemDB.SLOT_KEYWORDS = {
    [L["Head"]] = 0, [L["Shoulder"]] = 0,
    [L["Chest"]] = 0,[L["Wrist"]] = 0, [L["Hands"]] = 0,
    [L["Legs"]] = 0, [L["Feet"]] = 0, [L["Main Hand"]] = 0, [L["One-Hand"]] = 0,
    [L["Off Hand"]] = 0, [L["Waist"]] = 0, [L["Two-Hand"]] = 0,
}
AtlasTW.ItemDB.SLOT2_KEYWORDS = {
    [L["Cloth"]] = 0,  [L["Leather"]] = 0, [L["Mail"]] = 0,[L["Plate"]] = 0,
    [L["Mace"]] = 0, [L["Axe"]] = 0, [L["Dagger"]] = 0, [L["Sword"]] = 0,
    [L["Held In Off-hand"]] = 0, [L["Shield"]] = 0, [L["Finger"]] = 0, [L["Neck"]] = 0,
    [L["Trinket"]] = 0, [L["Back"]] = 0, [L["Bow"]] = 0, [L["Crossbow"]] = 0,
    [L["Gun"]] = 0, [L["Polearm"]] = 0, [L["Relic"]] = 0, [L["Staff"]] = 0,
    [L["Thrown"]] = 0, [L["Wand"]] = 0, [L["Fist Weapon"]] = 0,[L["Fishing Pole"]] = 0,
}
AtlasTW.ItemDB.ClassItems = {
    [L["Druid"]] = {L["Leather"],L["Dagger"],L["Mace"],L["Fist Weapon"],L["Polearm"],L["Staff"],L["Two-Hand"].." "..L["Mace"]},
    [L["Hunter"]] = {L["Leather"],L["Mail"],L["Axe"],L["Dagger"],L["Sword"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],
        L["Polearm"],L["Staff"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"]},
    [L["Mage"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [L["Paladin"]] = {L["Leather"],L["Mail"],L["Plate"],L["Sword"],L["Mace"],L["Axe"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],L["Polearm"]},
    [L["Priest"]] = {L["Dagger"],L["Staff"],L["Mace"],L["Wand"]},
    [L["Rogue"]] = {L["Leather"],L["Dagger"],L["Sword"],L["Mace"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"]},
    [L["Shaman"]] = {L["Leather"],L["Mail"],L["Dagger"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"]},
    [L["Warlock"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [L["Warrior"]] = {L["Leather"],L["Mail"],L["Plate"],L["Dagger"],L["Sword"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"],L["Polearm"],
        L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"]},
}
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
local function getColoredText(text, typeText)
    local colorCode = "|cff00ff00" -- зеленый по умолчанию
    local playerClass, playerLevel = UnitClass("player"), UnitLevel("player")
    local classText = string.gsub(text, L["Classes"]..": ", "")
    if (typeText or nil) == "slot" then
        local canWear = (string.find(text, L["Cloth"]) or string.find(text, L["Fishing Pole"])) and true or false
        for _, v in pairs(AtlasTW.ItemDB.ClassItems[playerClass]) do
            if (string.find(text, L["Two-Hand"]) and v == text) or string.find(text, v) then
                canWear = true
                break
            end
        end
        if not canWear then
            colorCode = "|cffff0000" -- красный если класс не совпадает
        end
    end
    -- Проверяем, содержит ли текст текущий класс игрока
    if (typeText or nil) == "class" then
        if classText ~= playerClass then
            colorCode = "|cffff0000" -- красный если класс не совпадает
        end
        return colorCode..classText.."|r"
    end
    if (typeText or nil) == "requires" then
        local levelText = string.gsub(text, L["Requires"].." ", "")
        local level = string.gsub(levelText, L["Level"].." ", "")
        -- Проверяем, содержит ли текст текущий класс игрока
        if playerLevel < (tonumber(level) or 0) then
            colorCode = "|cffff0000" -- красный если класс не совпадает
        end
        return colorCode..levelText.."|r"
    end
    return colorCode..text.."|r"
end
-- Функция для парсинга подсказки предмета
function AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext)
    if not itemID or itemID == 0 then return end
    local tooltipName = "AtlasLootHiddenTooltip"
    local tooltip = _G[tooltipName]
    if not tooltip then
        tooltip = CreateFrame("GameTooltip", tooltipName, UIParent, "GameTooltipTemplate")
        tooltip:SetOwner(UIParent, "ANCHOR_NONE")
    end
    tooltip:ClearLines()
    tooltip:SetHyperlink("item:"..tostring(itemID))
    AtlasLoot_CacheItem(itemID)
    local info = {}
    if extratext and extratext ~= "" then table.insert(info, extratext) end
    local line, line2, text, text2
    for i = 1, 10 do
        line = _G[tooltipName .. "TextLeft" .. i]
        line2 = _G[tooltipName.. "TextRight".. i]
        if line then
            text = line:GetText()
            text2 = line2:GetText()
            if text then
                -- Ищем тип слота (Feet, Chest, etc.) и тип брони (Cloth, Leather, etc.)
                if AtlasTW.ItemDB.SLOT_KEYWORDS[text]  then
                    if text2 and AtlasTW.ItemDB.SLOT2_KEYWORDS[text2] then
                        table.insert(info, getColoredText(text.." "..text2, "slot"))
                    else
                        table.insert(info, getColoredText(text, "slot"))
                    end
                end
                if AtlasTW.ItemDB.SLOT2_KEYWORDS[text] then
                    if text == L["Finger"] then
                        table.insert(info, "|cff00ff00"..L["Ring"].."|r")
                    else
                        table.insert(info, getColoredText(text, "slot2"))
                    end
                end
                -- Ищем строку с классами
                if string.find(text, L["Classes"]) then
                    table.insert(info, getColoredText(text, "class"))
                end
                if string.find(text, L["Requires"]) then
                    table.insert(info, getColoredText(text, "requires"))
                end

            end
        end
    end

    return table.concat(info, ", ")
end

-- Функция для кэша предмета по линку или ID
function AtlasLoot_CacheItem(linkOrID)
    if not linkOrID or linkOrID == 0 then
        return false
    end
    if tonumber(linkOrID) then
        if GetItemInfo(linkOrID) then
            return true
        else
            local item = "item:" .. linkOrID .. ":0:0:0"
            local _, _, itemLink = string.find(item, "(item:%d+:%d+:%d+:%d+)")
            linkOrID = itemLink
        end
    else
        if type(linkOrID) ~= "string" then
            return false
        end
        if string.find(linkOrID, "|", 1, true) then
            local _, _, itemLink = string.find(linkOrID, "(item:%d+:%d+:%d+:%d+)")
            linkOrID = itemLink
            if GetItemInfo(AtlasLoot_IDFromLink(linkOrID)) then
                return true
            end
        end
    end
    GameTooltip:SetHyperlink(linkOrID)
end
-- Функция создания нового предмета
function AtlasTW.ItemDB.CreateItem(data)
    -- Проверяем обязательные поля
    if not data.id then
        return nil
    end

    -- Устанавливаем значения по умолчанию
    local item = {
        id = data.id,
       -- name = data.name,
      --  info = data.info,
       -- icon = data.icon,
        disc = data.disc,
       -- slot = data.slot,
      --  slotType = data.slotType,
        dropRate = data.dropRate,
        container = data.container,
        --[[ 
        source = data.source, -- Источник получения (босс, квест и т.д.)
        zone = data.zone,     -- Зона получения ]]
        --notes = data.notes    -- Дополнительные заметки
    }

    -- Устанавливаем метатаблицу для доступа к методам
    setmetatable(item, {__index = ItemPrototype})

    return item
end

-- Функция создания разделителя/заголовка
function AtlasTW.ItemDB.CreateSeparator(text, icon, quality)
    return {
        name = text or "",
        texture = icon and ("Interface\\Icons\\"..icon) or "Interface\\Icons\\INV_Box_01",
        quality = quality or 5,
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