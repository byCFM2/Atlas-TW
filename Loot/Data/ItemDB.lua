-- ItemDB.lua - Центральная база данных предметов
-- Современная модульная структура для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
AtlasTW.ItemDB = {}

AtlasTW.ItemDB.SLOT_KEYWORDS = {
    [L["Head"]] = 0, [L["Shoulder"]] = 0, [L["Tabard"]] = 0,
    [L["Chest"]] = 0,[L["Wrist"]] = 0, [L["Hands"]] = 0, [L["Relic"]] = 0,
    [L["Legs"]] = 0, [L["Feet"]] = 0, [L["Main Hand"]] = 0, [L["One-Hand"]] = 0,
    [L["Off Hand"]] = 0, [L["Waist"]] = 0, [L["Two-Hand"]] = 0, [L["Ranged"]] = 0,
}
AtlasTW.ItemDB.SLOT2_KEYWORDS = {
    [L["Cloth"]] = 0,  [L["Leather"]] = 0, [L["Mail"]] = 0,[L["Plate"]] = 0,
    [L["Mace"]] = 0, [L["Axe"]] = 0, [L["Dagger"]] = 0, [L["Sword"]] = 0, [L["Totem"]] = 0,
    [L["Held In Off-hand"]] = 0, [L["Shield"]] = 0, [L["Finger"]] = 0, [L["Neck"]] = 0,
    [L["Trinket"]] = 0, [L["Back"]] = 0, [L["Bow"]] = 0, [L["Crossbow"]] = 0,
    [L["Gun"]] = 0, [L["Polearm"]] = 0, [L["Libram"]] = 0, [L["Staff"]] = 0, [L["Idol"]] = 0,
    [L["Thrown"]] = 0, [L["Wand"]] = 0, [L["Fist Weapon"]] = 0,[L["Fishing Pole"]] = 0,
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
        local canWear = string.find(text, L["Cloth"]) or string.find(text, L["Fishing Pole"]) or string.find(text, L["Tabard"])
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

-- Функция для парсинга подсказки предмета
function AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext)
    if not itemID or itemID == 0 then return end
    local tooltipName = "AtlasLootHiddenTooltip"
    local tooltip = _G[tooltipName]
    if not tooltip then
        tooltip = CreateFrame("GameTooltip", tooltipName, UIParent, "GameTooltipTemplate")
        tooltip:SetOwner(UIParent, "ANCHOR_NONE")
        _G[tooltipName] = tooltip -- Кэшируем ссылку на фрейм в _G
    end
    tooltip:ClearLines()
    tooltip:SetHyperlink("item:"..tostring(itemID))
    --AtlasLoot_CacheItem(itemID)
    local info = {}
    if extratext and extratext ~= "" then table.insert(info, extratext) end
    local line, line2, text, text2
    local tooltipTextLeftPrefix = tooltipName .. "TextLeft"
    local tooltipTextRightPrefix = tooltipName .. "TextRight"
    for i = 1, 12 do --TODO нужна доработка, есть проблемы с off hand
        line = _G[tooltipTextLeftPrefix .. i]
        line2 = _G[tooltipTextRightPrefix .. i]
        if line then
            text = line:GetText()
            text2 = line2:GetText()
            if text then
                -- Ищем строку с предметом для задания
                if string.find(text, L["Quest Item"]) then
                    table.insert(info, text)
                -- Ищем строку с маунтом
                elseif string.find(text, string.lower(" "..L["Mount"].." ")) then
                    table.insert(info, L["Mount"])
                    break
                -- Ищем строку с глифом
                elseif string.find(text, string.lower(L["Glyph"])) then
                    table.insert(info, L["Glyph"])
                -- Ищем строку с петом
                elseif string.find(text, string.lower(" "..L["Companion"].." ")) then
                    table.insert(info, L["Pet"])
                -- Ищем строку с начинающим задание
                elseif string.find(text, L["This Item Begins a Quest"]) then
                    table.insert(info, text)
                end
                -- Ищем тип слота (Feet, Chest, etc.) и тип брони (Cloth, Leather, etc.)
                if AtlasTW.ItemDB.SLOT_KEYWORDS[text]  then
                    print(text.." text and text2 "..(text2 or ""))
                    if text2 and AtlasTW.ItemDB.SLOT2_KEYWORDS[text2] then
                        table.insert(info, getColoredText(text.." "..text2, "slot"))
                    else
                        table.insert(info, getColoredText(text, "slot"))
                    end
                end
                if AtlasTW.ItemDB.SLOT2_KEYWORDS[text] then
                    print(text.." text and text2 "..(text2 or ""))
                    if text == L["Finger"] then
                        table.insert(info, "|cff00ff00"..L["Ring"].."|r")
                    else
                        print(text.." slot2")
                        table.insert(info, getColoredText(text, "slot2"))
                    end
                -- Ищем строку с классами
                elseif string.find(text, L["Classes"]) then
                    table.insert(info, getColoredText(text, "class"))
                -- Ищем строку с требованиями
                elseif string.find(text, L["Requires"]) then
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
        count = data.count,
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