-- ModernDataAdapter.lua - Адаптер для интеграции новой модульной системы
-- Обеспечивает совместимость между новой структурой данных и существующим UI

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.ModernAdapter = {}

-- Кэш для конвертированных данных
local dataCache = {}
local cacheTimeout = 300 -- 5 минут
local lastCacheUpdate = 0

-- Функция очистки кэша
local function ClearCache()
    dataCache = {}
    lastCacheUpdate = GetTime()
end

-- Функция проверки актуальности кэша
local function IsCacheValid()
    return (GetTime() - lastCacheUpdate) < cacheTimeout
end

-- Функция конвертации современного предмета в старый формат
local function ConvertItemToLegacy(modernItem)
    if not modernItem then
        return nil
    end
    
    -- Если это разделитель
    if modernItem.isSeparator then
        return {
            0,
            modernItem.icon or "INV_Box_01",
            "=q" .. (modernItem.quality or 6) .. "=" .. (modernItem.name or ""),
            ""
        }
    end
    
    -- Обычный предмет
    local name = "=q" .. (modernItem.quality or 1) .. "=" .. (modernItem.name or "Unknown Item")
    local description = "=ds=" .. (modernItem:GetDescription() or "")
    local dropRate = modernItem:GetDropRateText() or ""
    
    return {
        modernItem.id or 0,
        modernItem.icon or "INV_Misc_QuestionMark",
        name,
        description,
        dropRate
    }
end

-- Функция получения данных в старом формате для конкретного босса/источника
function AtlasTW.ModernAdapter.GetLegacyData(category, bossName)
    local cacheKey = category .. "_" .. bossName
    
    -- Проверяем кэш
    if IsCacheValid() and dataCache[cacheKey] then
        return dataCache[cacheKey]
    end
    
    local legacyData = {}
    
    -- Получаем данные из новой системы
    if category == "instances" then
        -- Ищем в данных подземелий
        if AtlasTW.InstanceData then
            for instanceName, instanceData in pairs(AtlasTW.InstanceData) do
                if type(instanceData) == "table" and instanceData.bosses then
                    local boss = instanceData.bosses[bossName]
                    if boss and boss.items then
                        for i = 1, getn(boss.items) do
                            local legacyItem = ConvertItemToLegacy(boss.items[i])
                            if legacyItem then
                                tinsert(legacyData, legacyItem)
                            end
                        end
                        break
                    end
                end
            end
        end
    elseif category == "world" then
        -- Ищем в данных мировых боссов
        if AtlasTW.WorldData and AtlasTW.WorldData.WorldBosses then
            local boss = AtlasTW.WorldData.WorldBosses[bossName]
            if boss and boss.items then
                for i = 1, getn(boss.items) do
                    local legacyItem = ConvertItemToLegacy(boss.items[i])
                    if legacyItem then
                        tinsert(legacyData, legacyItem)
                    end
                end
            end
        end
    end
    
    -- Кэшируем результат
    dataCache[cacheKey] = legacyData
    
    return legacyData
end

-- Функция получения списка всех доступных боссов/источников
function AtlasTW.ModernAdapter.GetAvailableSources(category)
    local sources = {}
    
    if category == "instances" and AtlasTW.InstanceData then
        for instanceName, instanceData in pairs(AtlasTW.InstanceData) do
            if type(instanceData) == "table" and instanceData.bosses then
                for bossName, bossData in pairs(instanceData.bosses) do
                    tinsert(sources, {
                        id = bossName,
                        name = bossData.name or bossName,
                        instance = instanceData.name or instanceName,
                        level = bossData.level or instanceData.level
                    })
                end
            end
        end
    elseif category == "world" and AtlasTW.WorldData then
        for sourceName, sourceData in pairs(AtlasTW.WorldData) do
            if type(sourceData) == "table" then
                if sourceData.name then
                    -- Одиночный босс
                    tinsert(sources, {
                        id = sourceName,
                        name = sourceData.name,
                        zone = sourceData.zone,
                        level = sourceData.level
                    })
                else
                    -- Группа боссов (например, изумрудные драконы)
                    for bossName, bossData in pairs(sourceData) do
                        if type(bossData) == "table" and bossData.name then
                            tinsert(sources, {
                                id = bossName,
                                name = bossData.name,
                                zone = bossData.zone,
                                level = bossData.level,
                                group = sourceData.name or sourceName
                            })
                        end
                    end
                end
            end
        end
    end
    
    return sources
end

-- Функция поиска предметов с расширенными возможностями
function AtlasTW.ModernAdapter.SearchItems(searchTerm, filters)
    filters = filters or {}
    
    local allItems = AtlasTW.DataLoader.SearchItems(searchTerm)
    local filteredItems = {}
    
    for i = 1, getn(allItems) do
        local item = allItems[i]
        local include = true
        
        -- Фильтр по качеству
        if filters.quality and item.quality ~= filters.quality then
            include = false
        end
        
        -- Фильтр по слоту
        if filters.slot and item.slot ~= filters.slot then
            include = false
        end
        
        -- Фильтр по типу брони
        if filters.armorType and item.armorType ~= filters.armorType then
            include = false
        end
        
        -- Фильтр по классу
        if filters.class and not item:IsValidForClass(filters.class) then
            include = false
        end
        
        -- Фильтр по источнику
        if filters.source and item.source ~= filters.source then
            include = false
        end
        
        -- Фильтр по зоне
        if filters.zone and item.zone ~= filters.zone then
            include = false
        end
        
        if include then
            tinsert(filteredItems, item)
        end
    end
    
    return filteredItems
end

-- Функция получения статистики по предметам
function AtlasTW.ModernAdapter.GetItemStatistics(category)
    local stats = {
        totalItems = 0,
        byQuality = {},
        bySlot = {},
        bySource = {},
        byClass = {}
    }
    
    local items = AtlasTW.DataLoader.GetAllItems(category)
    
    for i = 1, getn(items) do
        local item = items[i]
        
        if not item.isSeparator then
            stats.totalItems = stats.totalItems + 1
            
            -- Статистика по качеству
            local quality = item.quality or 0
            stats.byQuality[quality] = (stats.byQuality[quality] or 0) + 1
            
            -- Статистика по слотам
            if item.slot then
                stats.bySlot[item.slot] = (stats.bySlot[item.slot] or 0) + 1
            end
            
            -- Статистика по источникам
            if item.source then
                stats.bySource[item.source] = (stats.bySource[item.source] or 0) + 1
            end
            
            -- Статистика по классам
            if item.validClasses then
                for j = 1, getn(item.validClasses) do
                    local class = item.validClasses[j]
                    stats.byClass[class] = (stats.byClass[class] or 0) + 1
                end
            end
        end
    end
    
    return stats
end

-- Функция получения рекомендаций для игрока
function AtlasTW.ModernAdapter.GetPlayerRecommendations(playerClass, playerLevel)
    local recommendations = {}
    
    -- Получаем все предметы
    local allItems = {}
    local categories = {"instances", "world"}
    
    for i = 1, getn(categories) do
        local categoryItems = AtlasTW.DataLoader.GetAllItems(categories[i])
        for j = 1, getn(categoryItems) do
            tinsert(allItems, categoryItems[j])
        end
    end
    
    -- Фильтруем подходящие предметы
    for i = 1, getn(allItems) do
        local item = allItems[i]
        
        if not item.isSeparator and item:IsValidForClass(playerClass) then
            -- Проверяем качество (эпики и легендарки приоритетнее)
            if item.quality >= AtlasTW.ItemDB.ITEM_QUALITY.RARE then
                tinsert(recommendations, {
                    item = item,
                    priority = item.quality,
                    reason = "Высокое качество предмета"
                })
            end
        end
    end
    
    -- Сортируем по приоритету
    table.sort(recommendations, function(a, b)
        return a.priority > b.priority
    end)
    
    -- Возвращаем топ-20 рекомендаций
    local topRecommendations = {}
    for i = 1, min(20, getn(recommendations)) do
        tinsert(topRecommendations, recommendations[i])
    end
    
    return topRecommendations
end

-- Функция обновления кэша
function AtlasTW.ModernAdapter.RefreshCache()
    ClearCache()
    DEFAULT_CHAT_FRAME:AddMessage("ModernAdapter: Кэш обновлен")
end

-- Функция получения информации о системе
function AtlasTW.ModernAdapter.GetSystemInfo()
    local info = {
        cacheSize = 0,
        cacheAge = GetTime() - lastCacheUpdate,
        loadedModules = {},
        totalItems = 0
    }
    
    -- Подсчитываем размер кэша
    for key, data in pairs(dataCache) do
        info.cacheSize = info.cacheSize + getn(data)
    end
    
    -- Получаем информацию о загруженных модулях
    if AtlasTW.DataLoader then
        info.loadedModules = AtlasTW.DataLoader.GetModuleStatus()
    end
    
    -- Подсчитываем общее количество предметов
    local categories = {"instances", "world"}
    for i = 1, getn(categories) do
        local items = AtlasTW.DataLoader.GetAllItems(categories[i])
        info.totalItems = info.totalItems + getn(items)
    end
    
    return info
end

-- Команды для отладки
SLASH_ATLASTW_MODERN1 = "/atlastw"
SLASH_ATLASTW_MODERN2 = "/atm"

function SlashCmdList.ATLASTW_MODERN(msg)
    local command, arg = strsplit(" ", msg, 2)
    command = strlower(command or "")
    
    if command == "info" then
        local info = AtlasTW.ModernAdapter.GetSystemInfo()
        DEFAULT_CHAT_FRAME:AddMessage("=== Atlas-TW Modern System Info ===")
        DEFAULT_CHAT_FRAME:AddMessage("Кэш: " .. info.cacheSize .. " записей, возраст " .. floor(info.cacheAge) .. " сек")
        DEFAULT_CHAT_FRAME:AddMessage("Всего предметов: " .. info.totalItems)
    elseif command == "refresh" then
        AtlasTW.ModernAdapter.RefreshCache()
    elseif command == "search" and arg then
        local items = AtlasTW.DataLoader.SearchItems(arg)
        DEFAULT_CHAT_FRAME:AddMessage("Найдено предметов: " .. getn(items))
        for i = 1, min(5, getn(items)) do
            DEFAULT_CHAT_FRAME:AddMessage("- " .. items[i]:GetFormattedName())
        end
    elseif command == "stats" then
        local stats = AtlasTW.ModernAdapter.GetItemStatistics("instances")
        DEFAULT_CHAT_FRAME:AddMessage("=== Статистика предметов (подземелья) ===")
        DEFAULT_CHAT_FRAME:AddMessage("Всего предметов: " .. stats.totalItems)
    else
        DEFAULT_CHAT_FRAME:AddMessage("Atlas-TW Modern Commands:")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw info - информация о системе")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw refresh - обновить кэш")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw search <название> - поиск предметов")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw stats - статистика предметов")
    end
end

DEFAULT_CHAT_FRAME:AddMessage("ModernAdapter: Модуль загружен")