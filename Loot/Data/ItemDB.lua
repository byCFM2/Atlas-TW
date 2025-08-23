-- ItemDB.lua - Центральная база данных предметов
-- Современная модульная структура для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
AtlasTW.ItemDB = {}

AtlasTW.ItemDB.SLOT_KEYWORDS = {
    [L["Head"]] = 0, [L["Shoulder"]] = 0, [L["Tabard"]] = 0,[L["Projectile"]] = 0,
    [L["Chest"]] = 0,[L["Wrist"]] = 0, [L["Hands"]] = 0, [L["Relic"]] = 0,
    [L["Legs"]] = 0, [L["Feet"]] = 0, [L["Main Hand"]] = 0, [L["One-Hand"]] = 0,
    [L["Off Hand"]] = 0, [L["Waist"]] = 0, [L["Two-Hand"]] = 0, [L["Ranged"]] = 0,
}
AtlasTW.ItemDB.SLOT2_KEYWORDS = {
    [L["Cloth"]] = 0,  [L["Leather"]] = 0, [L["Mail"]] = 0,[L["Plate"]] = 0,[L["Bullet"]] = 0,
    [L["Mace"]] = 0, [L["Axe"]] = 0, [L["Dagger"]] = 0, [L["Sword"]] = 0, [L["Totem"]] = 0,
    [L["Held In Off-hand"]] = 0, [L["Shield"]] = 0, [L["Finger"]] = 0, [L["Neck"]] = 0, [L["16 Slot Ammo Pouch"]] = 0,
    [L["Trinket"]] = 0, [L["Back"]] = 0, [L["Bow"]] = 0, [L["Crossbow"]] = 0,[L["Arrow"]] = 0,
    [L["Gun"]] = 0, [L["Polearm"]] = 0, [L["Libram"]] = 0, [L["Staff"]] = 0, [L["Idol"]] = 0,
    [L["Thrown"]] = 0, [L["Wand"]] = 0, [L["Fist Weapon"]] = 0,[L["Fishing Pole"]] = 0, [L["16 Slot Quiver"]] = 0,
}
AtlasTW.ItemDB.ClassItems = {
    [L["Druid"]] = {L["Leather"],L["Dagger"],L["Mace"],L["Fist Weapon"],L["Polearm"],L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Idol"]},
    [L["Hunter"]] = {L["Leather"],L["Mail"],L["Axe"],L["Dagger"],L["Sword"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],
        L["Polearm"],L["Staff"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Off Hand"],L["Thrown"]},
    [L["Mage"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [L["Paladin"]] = {L["Leather"],L["Mail"],L["Plate"],L["Sword"],L["Mace"],L["Axe"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"],L["Polearm"],L["Libram"]},
    [L["Priest"]] = {L["Dagger"],L["Staff"],L["Mace"],L["Wand"]},
    [L["Rogue"]] = {L["Leather"],L["Dagger"],L["Sword"],L["Mace"],L["Off Hand"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"]},
    [L["Shaman"]] = {L["Leather"],L["Mail"],L["Dagger"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Totem"]},
    [L["Warlock"]] = {L["Dagger"],L["Staff"],L["Sword"],L["Wand"]},
    [L["Warrior"]] = {L["Leather"],L["Mail"],L["Plate"],L["Dagger"],L["Off Hand"],L["Sword"],L["Mace"],L["Axe"],L["Fist Weapon"],L["Bow"],L["Crossbow"],L["Gun"],L["Thrown"],L["Polearm"],
        L["Staff"],L["Two-Hand"].." "..L["Mace"],L["Two-Hand"].." "..L["Axe"],L["Two-Hand"].." "..L["Sword"]},
}

-- Прототип предмета
local ItemPrototype = {
    -- Получить шанс выпадения как строку
    GetDropRateText = function(this)
        if not this.dropRate or this.dropRate == 0 then return nil end
        return this.dropRate .. "%"
    end,
}

local function getColoredText(text, typeText)
    -- Color constants
    local COLOR_GREEN = "|cff00ff00"
    local COLOR_RED = "|cffff0000"
    local COLOR_END = "|r"
    local playerClass = UnitClass("player")
    local playerLevel = UnitLevel("player")

    -- Default to green
    local colorCode = COLOR_GREEN

    -- Handle different text types
    if typeText == "slot" then
        local canWear = string.find(text, L["Cloth"]) or string.find(text, L["Fishing Pole"])
            or string.find(text, L["Tabard"]) or string.find(text, L["Bullet"]) or string.find(text, L["Arrow"])
            or string.find(text, L["Ammo Pouch"]) or string.find(text, L["Quiver"])
        if not canWear then
            local classItems = AtlasTW.ItemDB.ClassItems[playerClass]
            for _, item in pairs(classItems) do
                if (string.find(text, L["Two-Hand"]) and item == text) or string.find(text, item) then
                    canWear = true
                    break
                end
            end
        end
        if not canWear then
            colorCode = COLOR_RED
        end
    elseif typeText == "slot2" then
        local canWear = not (text == L["Wand"] or text == L["Gun"] or text == L["Bow"] or text == L["Crossbow"]
            or text == L["Thrown"])
        if not canWear then
            local classItems = AtlasTW.ItemDB.ClassItems[playerClass]
            for _, item in pairs(classItems) do
                if string.find(text, item) then
                    canWear = true
                    break
                end
            end
        end
        if not canWear then
            colorCode = COLOR_RED
        end
    elseif typeText == "class" then
        local classText = string.gsub(text, L["Classes"]..": ", "")
        if not string.find(classText, playerClass) then
            colorCode = COLOR_RED
        end
        return colorCode..classText..COLOR_END
    elseif typeText == "requires" then
        local levelText = string.gsub(text, L["Requires"].." ", "")
        local level = tonumber(string.gsub(levelText, L["Level"].." ", "") or 0) or 0
        if playerLevel < level then
            colorCode = COLOR_RED
        end
        return colorCode..levelText..COLOR_END
    end
    return colorCode..text..COLOR_END
end

-- Кэш для результатов парсинга подсказок
local ParsedTooltipCache = {}
local ParsedTooltipCacheSize = 0
local MAX_CACHE_SIZE = 200

-- Статические reference для оптимизации
local tooltipElementsCache = {}
local sharedTooltip = nil

-- Функция очистки кэша
local function CleanupTooltipCache()
    if ParsedTooltipCacheSize > MAX_CACHE_SIZE then
        ParsedTooltipCache = {}
        ParsedTooltipCacheSize = 0
    end
end

-- Функция для парсинга подсказки предмета (улучшенная версия)
function AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext)
    if not itemID or itemID == 0 then
        return extratext or ""
    end

    -- Проверяем, что предмет кэширован
    if not GetItemInfo(itemID) then
        return extratext or ""
    end

    -- Создаем ключ для кэша
    local cacheKey = itemID .. "_" .. (extratext or "")

    -- Проверяем кэш результатов
    if ParsedTooltipCache[cacheKey] then
        return ParsedTooltipCache[cacheKey]
    end

    CleanupTooltipCache()

    local tooltipName = "AtlasLootHiddenTooltip"

    -- Lazy-инициализация разделяемого тултипа
    if not sharedTooltip then
        sharedTooltip = CreateFrame("GameTooltip", tooltipName, UIParent, "GameTooltipTemplate")
        if not sharedTooltip then
            return extratext or ""
        end
        sharedTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    end

    local tooltip = sharedTooltip

    -- Быстрая очистка без защиты (оптимизация)
    tooltip:Hide()
    tooltip:ClearLines()

    -- Быстрая установка гиперссылки
    local success = pcall(function()
        tooltip:SetOwner(UIParent, "ANCHOR_NONE")
        tooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
    end)

    if not success then
        return extratext or ""
    end

    -- Проверяем первую строку
    local firstLine = _G[tooltipName .. "TextLeft1"]
    if not firstLine or not firstLine:GetText() or firstLine:GetText() == "" then
        return extratext or ""
    end

    local info = {}
    if extratext and extratext ~= "" then
        table.insert(info, extratext)
    end

    -- Кэшируем элементы UI только при первом доступе
    if not tooltipElementsCache.initialized then
        tooltipElementsCache.leftElements = {}
        tooltipElementsCache.rightElements = {}
        for i = 1, 12 do
            tooltipElementsCache.leftElements[i] = _G[tooltipName .. "TextLeft" .. i]
            tooltipElementsCache.rightElements[i] = _G[tooltipName .. "TextRight" .. i]
        end
        tooltipElementsCache.initialized = true
    end

    -- Оптимизированный парсинг
    local parseSuccess = pcall(function()
        local text, text2

        for i = 1, 12 do
            local line = tooltipElementsCache.leftElements[i]
            local line2 = tooltipElementsCache.rightElements[i]

            if line then
                text = line:GetText()
                if text then
                    text2 = line2 and line2:GetText() or nil

                    -- Быстрые проверки по ключевым словам (без лишних вызовов string.find)
                    local lowerText = string.lower(text)

                    -- Предмет для задания
                    if string.find(text, L["Quest Item"]) then
                        table.insert(info, text)
                    -- Маунт
                    elseif string.find(lowerText, string.lower(" "..L["Mount"].." ")) then
                        table.insert(info, L["Mount"])
                        break
                    -- Глиф
                    elseif string.find(lowerText, string.lower(L["Glyph"])) then
                        table.insert(info, L["Glyph"])
                    -- Пет
                    elseif string.find(lowerText, string.lower(" "..L["Companion"].." ")) then
                        table.insert(info, L["Pet"])
                    -- Начинает задание
                    elseif string.find(text, L["This Item Begins a Quest"]) then
                        table.insert(info, text)
                    end

                    -- Оптимизированная проверка слотов
                    if AtlasTW.ItemDB.SLOT_KEYWORDS[text] then
                        if text2 and AtlasTW.ItemDB.SLOT2_KEYWORDS[text2] then
                            table.insert(info, getColoredText(text.." "..text2, "slot"))
                        else
                            table.insert(info, getColoredText(text, "slot"))
                        end
                    elseif AtlasTW.ItemDB.SLOT2_KEYWORDS[text] then
                        if text == L["Finger"] then
                            table.insert(info, "|cff00ff00"..L["Ring"].."|r")
                        else
                            table.insert(info, getColoredText(text, "slot2"))
                        end
                    -- Классы
                    elseif string.find(text, L["Classes"]) then
                        table.insert(info, getColoredText(text, "class"))
                    -- Требования
                    elseif string.find(text, L["Requires"]) then
                        table.insert(info, getColoredText(text, "requires"))
                    end
                end
            end
        end
    end)

    -- Быстрая очистка
    tooltip:Hide()
    tooltip:ClearLines()

    local result = extratext or ""
    if parseSuccess and table.getn(info) > 0 then
        result = table.concat(info, ", ")
    end

    -- Сохраняем в кэш
    ParsedTooltipCache[cacheKey] = result
    ParsedTooltipCacheSize = ParsedTooltipCacheSize + 1

    return result
end

-- Функция для запуска таймера (исправленная версия)
function StartTimer(delaySeconds, callbackFunc)
    -- Создаем уникальный фрейм для каждого таймера
    local timerFrame = CreateFrame("Frame")
    local startTime = GetTime()

    local function OnTimerUpdate()
        if GetTime() - startTime >= delaySeconds then
            timerFrame:Hide()
            timerFrame:SetScript("OnUpdate", nil)
            if callbackFunc then
                callbackFunc()
            end
        end
    end

    timerFrame:SetScript("OnUpdate", OnTimerUpdate)
    timerFrame:Show()
end

function AtlasLoot_ForceCacheItemWithDelay(itemID, delayBetweenAttempts, maxAttempts)
    if not itemID or itemID == 0 then
        return false
    end
    maxAttempts = maxAttempts or 10
    delayBetweenAttempts = delayBetweenAttempts or 0.1
    local attempts = 0
    local function tryCache()
        if GetItemInfo(itemID) then
            return true
        end
        GameTooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
        attempts = attempts + 1
        if attempts < maxAttempts then
            -- Запуск следующей попытки через задержку
            StartTimer(delayBetweenAttempts, tryCache)
        else
            return false
        end
    end
    tryCache()
end
function AtlasLoot_ForceCacheItem(itemID, maxAttempts)
    if not itemID or itemID == 0 then
        return false
    end
    maxAttempts = maxAttempts or 3
    local attempts = 0
    local function tryCache()
        if GetItemInfo(itemID) then
            return true
        end
        GameTooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
        attempts = attempts + 1
        if attempts < maxAttempts then
            -- Запуск следующей попытки
            tryCache()
        else
            return false
        end
    end
    tryCache()
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

-- Вспомогательная функция для создания предметов из таблицы loot
function AtlasTW.CreateItemsFromLootTable(bossData)
    if not bossData.loot then return end
    local items = {}
    local defaults = bossData.defaults or {}
    for _, itemData in ipairs(bossData.loot) do
        -- Применяем значения по умолчанию
        for key, value in pairs(defaults) do
            if itemData[key] == nil then
                itemData[key] = value
            end
        end
        table.insert(items, AtlasTW.ItemDB.CreateItem(itemData))
    end
    return items
end

-- Функция создания нового предмета
function AtlasTW.ItemDB.CreateItem(data)
    -- Проверяем обязательные поля
    if not data.id and not data.name then return nil end
    -- Устанавливаем значения по умолчанию
    local item = {
        id = data.id,
        name = data.name,
        disc = data.disc,
        dropRate = data.dropRate,
        container = data.container,
        quantity = data.quantity,
        skill = data.skill,
    }
    -- Устанавливаем метатаблицу для доступа к методам
    --setmetatable(item, {__index = ItemPrototype})

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