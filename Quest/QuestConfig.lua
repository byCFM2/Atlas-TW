
-----------------------------------------------------------------------------
-- Atlas Quest Configuration and Constants
-- Версия: 2.0
-- Совместимость: WoW 1.12 (Lua 5.0)
-- Автор: Vitali
-- Дата: 29.05.2025
-----------------------------------------------------------------------------

--[[
=============================================================================
МОДУЛЬНАЯ СИСТЕМА КОНФИГУРАЦИИ ДЛЯ ATLAS QUEST
=============================================================================

Этот файл содержит все константы, настройки и конфигурации для Atlas Quest.
Организован по принципу модульности для легкой поддержки и расширения.

Основные разделы:
1. Цвета и форматирование текста
2. Константы системы
3. Настройки UI и позиционирования
4. Конфигурация квестов
5. Утилиты и вспомогательные функции
6. Валидация и проверки

=============================================================================
]]

-- ========================================================================
-- ГЛОБАЛЬНОЕ ПРОСТРАНСТВО ИМЕН
-- ========================================================================
local _G = getfenv()

-- ========================================================================
-- ПРОВЕРКА И ИНИЦИАЛИЗАЦИЯ ПЕРЕМЕННЫХ
-- ========================================================================
local kQuestConfig = {}

-- Глобальные переменные
kQuestConfig.Variables = {
    CURRENT_MAP_TEXTURE = nil,
    CURRENT_INSTANCE = 99,
    NEED_UPDATE = true,
}

-- ========================================================================
-- 1. ЦВЕТА И ФОРМАТИРОВАНИЕ ТЕКСТА
-- ========================================================================

kQuestConfig.Colors = {
    -- Основные цвета качества предметов
    white = "|cffFFFFFF",           -- Обычный
    grey = "|cff808080",            -- Серый
    green = "|cff1eff00",           -- Необычный
    blue = "|cff0070dd",            -- Редкий
    purple = "|cffa335ee",          -- Эпический
    orange = "|cffff8000",          -- Легендарный

    -- Дополнительные цвета для интерфейса
    red = "|cffff0000",             -- Ошибки, важные предупреждения
    yellow = "|cffffd200",          -- Координаты, важная информация
    lightBlue = "|cff00ccff",       -- Ссылки, дополнительная информация
    lightGreen = "|cff40ff40",      -- Успешные операции

    -- Цвета для фракций
    alliance = "|cff0078ff",        -- Синий Альянса
    horde = "|cffb30000",           -- Красный Орды
    neutral = "|cffffd700",         -- Золотой для нейтральных

    -- Специальные цвета
    highlight = "|cffff6600",       -- Выделение
    muted = "|cff999999",           -- Приглушенный текст
    success = "|cff00ff00",         -- Успех
    warning = "|cffffff00",         -- Предупреждение
    error = "|cffff4444"            -- Ошибка
}

-- Цветовые схемы для различных типов контента
kQuestConfig.ColorSchemes = {
    questLevel = {
        trivial = kQuestConfig.Colors.grey,
        easy = kQuestConfig.Colors.green,
        normal = kQuestConfig.Colors.yellow,
        hard = kQuestConfig.Colors.orange,
        elite = kQuestConfig.Colors.red
    },

    questType = {
        elite = kQuestConfig.Colors.red,
        dungeon = kQuestConfig.Colors.blue,
        raid = kQuestConfig.Colors.purple,
        pvp = kQuestConfig.Colors.orange,
        daily = kQuestConfig.Colors.green
    }
}

-- ========================================================================
-- 2. КОНСТАНТЫ СИСТЕМЫ
-- ========================================================================

kQuestConfig.Constants = {
    -- Ограничения системы
    MAX_INSTANCES = 99,             -- Максимальное количество инстансов
    MAX_QUESTS_PER_INSTANCE = 23,   -- Максимальное количество квестов на инстанс
    DEFAULT_INSTANCE = 99,          -- ID инстанса по умолчанию

    -- Значения по умолчанию для квестов
    NO_PREQUEST = "No",             -- Отсутствие предварительного квеста
    NO_FOLGEQUEST = "No",           -- Отсутствие последующего квеста
    DEFAULT_LEVEL = "1",            -- Уровень квеста по умолчанию
    DEFAULT_ATTAIN = "1",           -- Требуемый уровень по умолчанию

    -- Константы UI
    TOOLTIP_DELAY = 0.5,            -- Задержка показа тултипа (секунды)
    FRAME_FADE_TIME = 0.3,          -- Время анимации исчезновения
    BUTTON_HIGHLIGHT_ALPHA = 0.3,   -- Прозрачность подсветки кнопок

    -- Константы квестов
    QUEST_ITEM_ICON_SIZE = 24,      -- Размер иконки предмета квеста
    QUEST_LIST_MAX_VISIBLE = 6,     -- Максимальное количество видимых квестов

    -- Размеры кеша
    CACHE_SIZE_LIMIT = 200,         -- Максимальный размер кеша
    CACHE_CLEANUP_THRESHOLD = 150,  -- Порог для очистки кеша

    -- Версионирование
    CONFIG_VERSION = "1.0",                                             -- Версия конфигурации
    MIN_ATLAS_VERSION = "1.30",                                         -- Минимальная версия Atlas
    -- Путь к изображениям и суффикс для карт входа в инстанс
    MAP_PATH = "Interface\\AddOns\\Atlas-TW\\Images\\Maps\\",           -- Путь к картам
    ENTRANCE_SUFFIX = "Ent",                                            -- Суффикс для базовой карты
}

-- ========================================================================
-- 3. НАСТРОЙКИ UI И ПОЗИЦИОНИРОВАНИЯ
-- ========================================================================

kQuestConfig.UI = {
    -- Основное окно квестов
    MainFrame = {
        width = 510,
        height = 510,
        point = "TOPLEFT",
        relativePoint = "TOPLEFT",
        x = 18,
        y = -84,
        strata = "HIGH",
        level = 10
    },

    -- Позиции для показа окна квестов
    Positions = {
        Left = {
            point = "TOPRIGHT",
            relativeTo = "AtlasFrame",
            relativePoint = "TOPLEFT",
            x = -5,
            y = 0
        },
        Right = {
            point = "TOPLEFT",
            relativeTo = "AtlasFrame",
            relativePoint = "TOPRIGHT",
            x = 5,
            y = 0
        },
        Custom = {
            point = "CENTER",
            relativeTo = "UIParent",
            relativePoint = "CENTER",
            x = 0,
            y = 0
        }
    },

    -- Настройки кнопок
    Buttons = {
        CloseButton = {
            width = 30,
            height = 30,
            point = "TOPRIGHT",
            x = -5,
            y = -3,
            text = "X"
        },

        NavigationButton = {
            width = 40,
            height = 40,
            point = "BOTTOM",
            y = 10
        },

        ToggleButton = {
            width = 90,
            height = 20,
            point = "TOPRIGHT",
            x = -120,
            y = -61
        }
    },

    -- Настройки элементов квестов
    QuestItem = {
        width = 236,
        height = 30,
        iconSize = 24,
        nameWidth = 205,
        nameHeight = 12,
        extraHeight = 10,
        spacing = 5
    },

    -- Позиции фреймов квестов (сетка 2x3)
    QuestFramePositions = {
        {x = 20, y = 120},   -- Левая колонка, верх
        {x = 266, y = 120},  -- Правая колонка, верх
        {x = 20, y = 70},    -- Левая колонка, середина
        {x = 266, y = 70},   -- Правая колонка, середина
        {x = 20, y = 20},    -- Левая колонка, низ
        {x = 266, y = 20}    -- Правая колонка, низ
    },

    -- Настройки чекбокса
    Checkbox = {
        width = 25,
        height = 25,
        point = "TOP",
        x = 150,
        y = -43
    },

    -- Настройки шрифтов
    Fonts = {
        QuestTitle = "GameFontNormalLarge",
        QuestText = "GameFontNormal",
        QuestDetails = "GameFontNormalSmall",
        QuestLevel = "GameFontNormalSmall",
        QuestReward = "GameFontNormal"
    }
}

-- ========================================================================
-- 4. КОНФИГУРАЦИЯ КВЕСТОВ
-- ========================================================================

kQuestConfig.Quest = {
    -- Настройки отображения
    Display = {
        showLevel = true,               -- Показывать уровень квеста
        showAttainLevel = true,         -- Показывать требуемый уровень
        showQuestType = true,           -- Показывать тип квеста
        showRewards = true,             -- Показывать награды
        showPrequests = true,           -- Показывать предварительные квесты

        colorByLevel = true,            -- Окрашивать по уровню
        colorByType = true,             -- Окрашивать по типу
        colorByCompletion = true,       -- Окрашивать по завершению

        useShortNames = false,          -- Использовать короткие названия
        truncateLongNames = true,       -- Обрезать длинные названия
        maxNameLength = 40              -- Максимальная длина названия
    },

    -- Фильтры квестов
    Filters = {
        showCompleted = true,           -- Показывать завершенные
        showUnavailable = false,        -- Показывать недоступные
        showLowLevel = true,            -- Показывать низкоуровневые
        showHighLevel = true,           -- Показывать высокоуровневые

        levelRange = {
            min = 1,                    -- Минимальный уровень
            max = 60                    -- Максимальный уровень
        },

        factionFilter = "auto",         -- "auto", "alliance", "horde", "all"
        typeFilter = "all"              -- "all", "elite", "dungeon", "raid"
    },

    -- Сортировка квестов
    Sorting = {
        method = "level",               -- "level", "name", "type", "completion"
        ascending = true,               -- По возрастанию
        groupByType = false,            -- Группировать по типу
        completedLast = true            -- Завершенные в конце
    }
}

-- ========================================================================
-- 5. НАСТРОЙКИ ПРОИЗВОДИТЕЛЬНОСТИ
-- ========================================================================

kQuestConfig.Performance = {
    -- Кеширование
    Cache = {
        enabled = true,                 -- Включить кеширование
        maxSize = 200,                  -- Максимальный размер кеша
        cleanupThreshold = 150,         -- Порог для очистки
        ttl = 300                       -- Время жизни записи (секунды)
    },

    -- Обновления UI
    UpdateFrequency = {
        questList = 1.0,                -- Частота обновления списка квестов
        tooltip = 0.1,                  -- Частота обновления тултипов
        framePosition = 0.5             -- Частота проверки позиции фрейма
    },

    -- Оптимизации
    Optimization = {
        lazyLoading = true,             -- Ленивая загрузка данных
        batchUpdates = true,            -- Пакетные обновления
        throttleEvents = true,          -- Троттлинг событий
        preloadCommonData = true        -- Предзагрузка часто используемых данных
    }
}

-- ========================================================================
-- 6. НАСТРОЙКИ ЛОКАЛИЗАЦИИ
-- ========================================================================

kQuestConfig.Localization = {
    -- Текущая локаль
    currentLocale = GetLocale() or "enUS",

    -- Поддерживаемые локали
    supportedLocales = {
        "enUS",
    },

    -- Форматирование
    Format = {
        dateTime = "%d.%m.%Y %H:%M",    -- Формат даты и времени
        coordinates = "%.1f, %.1f",     -- Формат координат
        percentage = "%.1f%%",          -- Формат процентов
        currency = "%d|TInterface\\MoneyFrame\\UI-GoldIcon:12:12|t"
    }
}

-- ========================================================================
-- 7. НАСТРОЙКИ ИНТЕГРАЦИИ
-- ========================================================================

kQuestConfig.Integration = {
    -- Интеграция с Atlas
    Atlas = {
        autoShow = true,                -- Автоматически показывать с Atlas
        followMapChanges = true,        -- Следовать за изменениями карты
        sharePosition = true,          -- Использовать ту же позицию
        syncVisibility = true           -- Синхронизировать видимость
    },

    -- Интеграция с другими аддонами
    Addons = {
        questie = {
            enabled = false,            -- Интеграция с Questie
            shareData = false           -- Обмен данными
        },

        carbonite = {
            enabled = false,            -- Интеграция с Carbonite
            shareQuests = false         -- Обмен квестами
        }
    }
}

-- ========================================================================
-- 8. УТИЛИТЫ И ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
-- ========================================================================

-- Утилиты для работы с цветами
kQuestConfig.ColorUtils = {
    -- Применение цвета к тексту
    colorText = function(text, color)
        if not text or not color then
            return text or ""
        end
        return color .. text .. "|r"
    end,

    -- Получение цвета по уровню квеста
    getQuestLevelColor = function(questLevel, playerLevel)
        playerLevel = playerLevel or UnitLevel("player")
        local diff = questLevel - playerLevel

        if diff >= 5 then
            return kQuestConfig.ColorSchemes.questLevel.elite
        elseif diff >= 3 then
            return kQuestConfig.ColorSchemes.questLevel.hard
        elseif diff >= -2 then
            return kQuestConfig.ColorSchemes.questLevel.normal
        elseif diff >= -7 then
            return kQuestConfig.ColorSchemes.questLevel.easy
        else
            return kQuestConfig.ColorSchemes.questLevel.trivial
        end
    end,

    -- Получение цвета качества предмета
    getQualityColor = function(quality)
        local colors = {
            [0] = kQuestConfig.Colors.grey,     -- Серый
            [1] = kQuestConfig.Colors.white,    -- Белый
            [2] = kQuestConfig.Colors.green,    -- Зеленый
            [3] = kQuestConfig.Colors.blue,     -- Синий
            [4] = kQuestConfig.Colors.purple,   -- Фиолетовый
            [5] = kQuestConfig.Colors.orange    -- Оранжевый
        }
        return colors[quality] or kQuestConfig.Colors.white
    end
}

-- Утилиты для работы с UI
kQuestConfig.UIUtils = {
    -- Безопасное получение элемента UI
    getUIElement = function(name)
        return _G[name]
    end,

    -- Установка позиции фрейма
    setFramePosition = function(frame, positionConfig)
        if not frame or not positionConfig then
            return false
        end

        frame:ClearAllPoints()
        frame:SetPoint(
            positionConfig.point or "CENTER",
            positionConfig.relativeTo or "UIParent",
            positionConfig.relativePoint or positionConfig.point or "CENTER",
            positionConfig.x or 0,
            positionConfig.y or 0
        )

        return true
    end,

    -- Создание простого фрейма с настройками
    createSimpleFrame = function(name, parent, config)
        local frame = CreateFrame("Frame", name, parent)

        if config.width then frame:SetWidth(config.width) end
        if config.height then frame:SetHeight(config.height) end
        if config.strata then frame:SetFrameStrata(config.strata) end
        if config.level then frame:SetFrameLevel(config.level) end

        return frame
    end,
    -- Обновление чекбокса
    UpdateCheckbox = function(name, checked)
        local checkbox = _G[name]
        if checkbox and checkbox.SetChecked then
            checkbox:SetChecked(checked)
            return true
        end
        return false
    end,

    -- Безопасное обновление текстового элемента
    updateTextElement = function(name, text)
        local element = _G[name]
        if element and element.SetText then
            element:SetText(text)
            return true
        end
        return false
    end,

    -- Переключение видимости элемента
    toggleElementVisibility = function(name)
        local element = _G[name]
        if element then
            if element:IsVisible() then
                HideUIPanel(element)
            else
                ShowUIPanel(element)
            end
            return true
        end
        return false
    end,

    -- Установка позиции элемента
    SetPosition = function(element, point, relative, relativePoint, x, y)
        if element and element.SetPoint then
            element:ClearAllPoints()
            element:SetPoint(point, relative, relativePoint, x, y)
            return false
        end
        return false
    end,
}

-- Утилиты для валидации
kQuestConfig.Validator = {
    -- Проверка корректности данных квеста
    validateQuestData = function(questData)
        if not questData then
            return false, "Отсутствуют данные квеста"
        end

        if not questData.Title or questData.Title == "" then
            return false, "Отсутствует название квеста"
        end

        if not questData.Level or questData.Level == "" then
            return false, "Отсутствует уровень квеста"
        end

        return true, "OK"
    end,

    -- Проверка поддержки локализации
    validateLocale = function(locale)
        if not locale then
            return false
        end

        for _, supportedLocale in ipairs(kQuestConfig.Localization.supportedLocales) do
            if locale == supportedLocale then
                return true
            end
        end

        return false
    end,

    -- Проверка конфигурации UI
    validateUIConfig = function(config)
        if not config then
            return false, "Отсутствует конфигурация UI"
        end

        -- Проверяем обязательные поля
        local required = {"width", "height", "point"}
        for _, field in ipairs(required) do
            if not config[field] then
                return false, "Отсутствует поле: " .. field
            end
        end

        return true, "OK"
    end
}

-- ========================================================================
-- 9. ИНИЦИАЛИЗАЦИЯ И НАСТРОЙКИ ПО УМОЛЧАНИЮ
-- ========================================================================

-- Функция инициализации конфигурации
function kQuestConfig.Initialize()
    -- Проверяем версию WoW
    local version, build, date, tocversion = GetBuildInfo()
    if tocversion and tocversion < 11200 then
        DEFAULT_CHAT_FRAME:AddMessage(
            kQuestConfig.ColorUtils.colorText(
                "Внимание: Atlas Quest может работать нестабильно на версии WoW ниже 1.12",
                kQuestConfig.Colors.warning
            )
        )
    end

    -- Инициализируем настройки по умолчанию
    if not AtlasKTW then
        AtlasKTW = {}
    end

    if not AtlasKTW.Q then
        AtlasKTW.Q = {
            WithAtlas = true,
            ShownSide = "Right",
            ColourCheck = true,
            ShowLevel = true,
            ShowAttain = true
        }
    end

    -- Регистрируем события
    if kQuestConfig.Integration.Atlas.followMapChanges then
        -- Здесь можно зарегистрировать события для отслеживания изменений Atlas
    end
end

-- Автоматическая инициализация при загрузке
if AtlasFrame then
    -- Atlas уже загружен, инициализируем сразу
    kQuestConfig.Initialize()
else
    -- Ждем загрузки Atlas
    local initFrame = CreateFrame("Frame")
    initFrame:RegisterEvent("ADDON_LOADED")
    initFrame:SetScript("OnEvent", function()
        if arg1 == "Atlas" or arg1 == "Atlas-TW" then
            kQuestConfig.Initialize()
            initFrame:UnregisterEvent("ADDON_LOADED")
        end
    end)
end
-- ========================================================================
-- УВЕДОМЛЕНИЕ О ЗАГРУЗКЕ КОНФИГУРАЦИИ
-- ========================================================================

-- Устанавливаем флаг загрузки
kQuestConfig.isLoaded = true

-- ========================================================================
-- 10. ЭКСПОРТ
-- ========================================================================

-- Экспорт основных функций в глобальное пространство
_G.KQuestConfig = kQuestConfig

--[[
=============================================================================
СПРАВОЧНАЯ ИНФОРМАЦИЯ
=============================================================================

Этот файл конфигурации предоставляет:

1. **Централизованные настройки**: Все константы и настройки в одном месте
2. **Модульную организацию**: Логическое разделение по функциональности
3. **Утилиты**: Вспомогательные функции для работы с UI и данными
4. **Валидацию**: Проверка корректности данных и настроек
5. **Обратную совместимость**: Поддержка старого API
6. **Производительность**: Настройки кеширования и оптимизации
7. **Локализацию**: Поддержка множественных языков
8. **Интеграцию**: Настройки для работы с другими аддонами

Использование:
- kQuestConfig.Colors.red - для получения красного цвета
- kQuestConfig.UI.MainFrame - для настроек основного окна
- kQuestConfig.ColorUtils.colorText(text, color) - для окрашивания текста
- kQuestConfig.Validator.validateQuestData(data) - для проверки данных

=============================================================================
]]