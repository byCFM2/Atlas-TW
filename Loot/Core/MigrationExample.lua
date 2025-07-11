-- MigrationExample.lua - Пример постепенной миграции на новую систему
-- Показывает, как интегрировать новую модульную структуру с существующим кодом

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.Migration = {}

-- Флаги для управления миграцией
local USE_MODERN_SYSTEM = true
local ENABLE_LEGACY_FALLBACK = true
local DEBUG_MIGRATION = true

-- Функция логирования для отладки миграции
local function DebugLog(message)
    if DEBUG_MIGRATION then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Migration]|r " .. message)
    end
end

-- Функция проверки доступности новой системы
local function IsModernSystemAvailable()
    return AtlasTW.DataLoader and
           AtlasTW.ItemDB and
           AtlasTW.ModernAdapter and
           AtlasTW.UIIntegration
end

-- Улучшенная версия оригинальной функции из AtlasLootMenu.lua
-- Заменяет строку 92: local button = _G["AtlasLootMenuItem_" .. i]
function AtlasTW.Migration.GetOrCreateItemButton(index)
    local buttonName = "AtlasLootMenuItem_" .. index
    local button = _G[buttonName]

    if USE_MODERN_SYSTEM and IsModernSystemAvailable() then
        DebugLog("Используем современную систему для кнопки " .. index)

        -- Используем новую систему создания кнопок
        if not button then
            button = AtlasTW.UIIntegration.CreateItemButton(index)
            _G[buttonName] = button
        end

        return button
    else
        DebugLog("Используем устаревшую систему для кнопки " .. index)

        -- Fallback на оригинальную логику
        if not button then
            -- Создаем кнопку по старому методу
            button = CreateFrame("Button", buttonName, AtlasLootItemsFrame)
            -- Здесь была бы оригинальная логика создания кнопки
        end

        return button
    end
end

-- Улучшенная функция загрузки данных предметов
function AtlasTW.Migration.LoadItemData(category, source)
    DebugLog("Загрузка данных: категория=" .. (category or "nil") .. ", источник=" .. (source or "nil"))

    if USE_MODERN_SYSTEM and IsModernSystemAvailable() then
        DebugLog("Загружаем данные через современную систему")

        -- Используем новую систему
        local modernData = AtlasTW.ModernAdapter.GetLegacyData(category, source)

        if modernData and getn(modernData) > 0 then
            DebugLog("Загружено " .. getn(modernData) .. " предметов через современную систему")
            return modernData
        elseif ENABLE_LEGACY_FALLBACK then
            DebugLog("Современная система не вернула данных, используем fallback")
            return AtlasTW.Migration.LoadLegacyData(source)
        else
            DebugLog("Данные не найдены в современной системе")
            return {}
        end
    else
        DebugLog("Загружаем данные через устаревшую систему")
        return AtlasTW.Migration.LoadLegacyData(source)
    end
end

-- Функция загрузки данных из старой системы
function AtlasTW.Migration.LoadLegacyData(source)
    if AtlasLoot_Data and AtlasLoot_Data[source] then
        DebugLog("Найдены данные в AtlasLoot_Data для " .. source)
        return AtlasLoot_Data[source]
    else
        DebugLog("Данные не найдены в AtlasLoot_Data для " .. (source or "nil"))
        return {}
    end
end

-- Функция обновления отображения с поддержкой обеих систем
function AtlasTW.Migration.UpdateDisplay(category, source, page)
    DebugLog("Обновление отображения: " .. (category or "nil") .. "/" .. (source or "nil") .. "/" .. (page or "1"))

    if USE_MODERN_SYSTEM and IsModernSystemAvailable() then
        -- Используем новую систему отображения
        AtlasTW.UIIntegration.UpdateItemDisplay(category, source, page)
    else
        -- Используем старую систему отображения
        AtlasTW.Migration.UpdateLegacyDisplay(category, source, page)
    end
end

-- Функция обновления отображения в старом стиле
function AtlasTW.Migration.UpdateLegacyDisplay(category, source, page)
    local items = AtlasTW.Migration.LoadLegacyData(source)

    -- Здесь была бы оригинальная логика отображения
    for i = 1, min(30, getn(items)) do
        local button = AtlasTW.Migration.GetOrCreateItemButton(i)
        local itemData = items[i]

        if itemData then
            -- Настройка кнопки по старому методу
            AtlasTW.Migration.SetupLegacyButton(button, itemData)
            button:Show()
        else
            button:Hide()
        end
    end
end

-- Функция настройки кнопки в старом стиле
function AtlasTW.Migration.SetupLegacyButton(button, itemData)
    -- Здесь была бы оригинальная логика настройки кнопки
    if button and itemData then
        -- Простая настройка для примера
        button.itemData = itemData

        if button.icon and itemData[2] then
            button.icon:SetTexture("Interface\\Icons\\" .. itemData[2])
        end

        if button.text and itemData[3] then
            button.text:SetText(itemData[3])
        end
    end
end

-- Функция поиска с поддержкой обеих систем
function AtlasTW.Migration.SearchItems(searchTerm, filters)
    DebugLog("Поиск предметов: " .. (searchTerm or "пустой запрос"))

    if USE_MODERN_SYSTEM and IsModernSystemAvailable() then
        -- Используем новую систему поиска
        return AtlasTW.ModernAdapter.SearchItems(searchTerm, filters)
    else
        -- Используем старую систему поиска
        return AtlasTW.Migration.SearchLegacyItems(searchTerm)
    end
end

-- Функция поиска в старой системе
function AtlasTW.Migration.SearchLegacyItems(searchTerm)
    local results = {}

    if not searchTerm or searchTerm == "" then
        return results
    end

    -- Поиск по всем данным AtlasLoot_Data
    if AtlasLoot_Data then
        for sourceName, sourceData in pairs(AtlasLoot_Data) do
            if type(sourceData) == "table" then
                for i = 1, getn(sourceData) do
                    local item = sourceData[i]
                    if item and item[3] then
                        local itemName = string.lower(item[3])
                        if string.find(itemName, string.lower(searchTerm)) then
                            tinsert(results, item)
                        end
                    end
                end
            end
        end
    end

    DebugLog("Найдено " .. getn(results) .. " предметов в старой системе")
    return results
end

-- Функция получения статистики системы
function AtlasTW.Migration.GetSystemStats()
    local stats = {
        modernSystemAvailable = IsModernSystemAvailable(),
        usingModernSystem = USE_MODERN_SYSTEM,
        legacyFallbackEnabled = ENABLE_LEGACY_FALLBACK,
        modernItemCount = 0,
        legacyItemCount = 0,
        loadedModules = {}
    }

    -- Статистика современной системы
    if IsModernSystemAvailable() then
        local categories = {"instances", "world"}
        for i = 1, getn(categories) do
            local items = AtlasTW.DataLoader.GetAllItems(categories[i])
            stats.modernItemCount = stats.modernItemCount + getn(items)
        end

        stats.loadedModules = AtlasTW.DataLoader.GetModuleStatus()
    end

    -- Статистика старой системы
    if AtlasLoot_Data then
        for sourceName, sourceData in pairs(AtlasLoot_Data) do
            if type(sourceData) == "table" then
                stats.legacyItemCount = stats.legacyItemCount + getn(sourceData)
            end
        end
    end

    return stats
end

-- Функция переключения между системами
function AtlasTW.Migration.ToggleModernSystem(enable)
    if enable == nil then
        USE_MODERN_SYSTEM = not USE_MODERN_SYSTEM
    else
        USE_MODERN_SYSTEM = enable
    end

    local status = USE_MODERN_SYSTEM and "включена" or "выключена"
    DEFAULT_CHAT_FRAME:AddMessage("Современная система " .. status)

    -- Обновляем отображение
    if AtlasTW.UIIntegration then
        local state = AtlasTW.UIIntegration.GetCurrentState()
        AtlasTW.Migration.UpdateDisplay(state.category, state.source, state.page)
    end
end

-- Функция переключения fallback режима
function AtlasTW.Migration.ToggleLegacyFallback(enable)
    if enable == nil then
        ENABLE_LEGACY_FALLBACK = not ENABLE_LEGACY_FALLBACK
    else
        ENABLE_LEGACY_FALLBACK = enable
    end

    local status = ENABLE_LEGACY_FALLBACK and "включен" or "выключен"
    DEFAULT_CHAT_FRAME:AddMessage("Legacy fallback " .. status)
end

-- Функция тестирования миграции
function AtlasTW.Migration.RunMigrationTest()
    DEFAULT_CHAT_FRAME:AddMessage("=== Тест миграции Atlas-TW ===")

    local stats = AtlasTW.Migration.GetSystemStats()

    DEFAULT_CHAT_FRAME:AddMessage("Современная система доступна: " .. (stats.modernSystemAvailable and "Да" or "Нет"))
    DEFAULT_CHAT_FRAME:AddMessage("Используется современная система: " .. (stats.usingModernSystem and "Да" or "Нет"))
    DEFAULT_CHAT_FRAME:AddMessage("Legacy fallback включен: " .. (stats.legacyFallbackEnabled and "Да" or "Нет"))
    DEFAULT_CHAT_FRAME:AddMessage("Предметов в современной системе: " .. stats.modernItemCount)
    DEFAULT_CHAT_FRAME:AddMessage("Предметов в старой системе: " .. stats.legacyItemCount)

    -- Тест поиска
    local searchResults = AtlasTW.Migration.SearchItems("Thunderfury")
    DEFAULT_CHAT_FRAME:AddMessage("Результатов поиска 'Thunderfury': " .. getn(searchResults))

    -- Тест загрузки данных
    local testData = AtlasTW.Migration.LoadItemData("instances", "Lucifron")
    DEFAULT_CHAT_FRAME:AddMessage("Предметов у Lucifron: " .. getn(testData))

    DEFAULT_CHAT_FRAME:AddMessage("=== Тест завершен ===")
end

-- Команды для управления миграцией
SLASH_ATLASTW_MIGRATION1 = "/atlastw-migration"
SLASH_ATLASTW_MIGRATION2 = "/atm-migration"

function SlashCmdList.ATLASTW_MIGRATION(msg)
    local command, arg = strsplit(" ", msg, 2)
    command = strlower(command or "")

    if command == "toggle" then
        AtlasTW.Migration.ToggleModernSystem()
    elseif command == "enable" then
        AtlasTW.Migration.ToggleModernSystem(true)
    elseif command == "disable" then
        AtlasTW.Migration.ToggleModernSystem(false)
    elseif command == "fallback" then
        AtlasTW.Migration.ToggleLegacyFallback()
    elseif command == "stats" then
        local stats = AtlasTW.Migration.GetSystemStats()
        DEFAULT_CHAT_FRAME:AddMessage("=== Статистика миграции ===")
        for key, value in pairs(stats) do
            if type(value) ~= "table" then
                DEFAULT_CHAT_FRAME:AddMessage(key .. ": " .. tostring(value))
            end
        end
    elseif command == "test" then
        AtlasTW.Migration.RunMigrationTest()
    elseif command == "debug" then
        DEBUG_MIGRATION = not DEBUG_MIGRATION
        DEFAULT_CHAT_FRAME:AddMessage("Отладка миграции: " .. (DEBUG_MIGRATION and "включена" or "выключена"))
    else
        DEFAULT_CHAT_FRAME:AddMessage("Atlas-TW Migration Commands:")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw-migration toggle - переключить современную систему")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw-migration enable - включить современную систему")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw-migration disable - выключить современную систему")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw-migration fallback - переключить legacy fallback")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw-migration stats - показать статистику")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw-migration test - запустить тест миграции")
        DEFAULT_CHAT_FRAME:AddMessage("/atlastw-migration debug - переключить отладку")
    end
end

-- Пример интеграции с существующим кодом
-- Эта функция заменяет оригинальную логику из AtlasLootMenu.lua
function AtlasTW.Migration.ShowLoot(category, source, page)
    DebugLog("ShowLoot вызвана: " .. (category or "nil") .. "/" .. (source or "nil"))

    -- Проверяем, нужно ли использовать новую систему
    if USE_MODERN_SYSTEM and IsModernSystemAvailable() then
        -- Новая логика
        AtlasTW.Migration.UpdateDisplay(category, source, page)

        -- Дополнительные возможности новой системы
        if AtlasTW.ModernAdapter then
            local stats = AtlasTW.ModernAdapter.GetItemStatistics(category)
            DebugLog("Статистика категории " .. category .. ": " .. stats.totalItems .. " предметов")
        end
    else
        -- Старая логика (совместимость)
        AtlasTW.Migration.UpdateLegacyDisplay(category, source, page)
    end
end

-- Функция инициализации миграции
function AtlasTW.Migration.Initialize()
    DebugLog("Инициализация системы миграции")

    -- Проверяем доступность компонентов
    local modernAvailable = IsModernSystemAvailable()
    DebugLog("Современная система доступна: " .. (modernAvailable and "Да" or "Нет"))

    if modernAvailable then
        DebugLog("Все компоненты современной системы загружены")
    else
        DebugLog("Некоторые компоненты современной системы недоступны")
        if not AtlasTW.DataLoader then DebugLog("- DataLoader не загружен") end
        if not AtlasTW.ItemDB then DebugLog("- ItemDB не загружен") end
        if not AtlasTW.ModernAdapter then DebugLog("- ModernAdapter не загружен") end
        if not AtlasTW.UIIntegration then DebugLog("- UIIntegration не загружен") end
    end

    -- Устанавливаем начальные настройки
    if modernAvailable then
        USE_MODERN_SYSTEM = true
        DebugLog("Современная система включена по умолчанию")
    else
        USE_MODERN_SYSTEM = false
        DebugLog("Используется только старая система")
    end
end

-- Автоматическая инициализация
AtlasTW.Migration.Initialize()

DEFAULT_CHAT_FRAME:AddMessage("Migration: Система миграции загружена")