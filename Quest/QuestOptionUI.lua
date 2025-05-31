
-----------------------------------------------------------------------------
-- Atlas Quest Option UI
-- Версия: 2.0 - Оптимизированная для WoW 1.12
-- Совместимость: Lua 5.0
-- Исправлены проблемы с дублированием кода и улучшена модульность
-----------------------------------------------------------------------------
local _G = getfenv()
--[[
=============================================================================
МОДУЛЬНАЯ СИСТЕМА ОПЦИЙ ATLAS QUEST
=============================================================================

Основные улучшения:
1. Объединенные обработчики событий
2. Устранение дублирования кода
3. Централизованная конфигурация
4. Улучшенная валидация
5. Поддержка новых опций

=============================================================================
]]

-- ========================================================================
-- ИМПОРТ КОНФИГУРАЦИИ И ЗАВИСИМОСТЕЙ
-- ========================================================================
local questConfig = KQuestConfig
-- Убеждаемся что конфигурация загружена
if not questConfig then
    DEFAULT_CHAT_FRAME:AddMessage("Quest config не найден! Убедитесь что QuestConfig.lua загружен первым.")
end
local variables = questConfig.Variables
local ui = questConfig.UI

-- ========================================================================
-- КОНСТАНТЫ И НАСТРОЙКИ
-- ========================================================================

local OPTION_CONFIG = {
    -- Основные настройки фрейма опций
    Frame = {
        width = 320,
        height = 380,
        point = "CENTER",
        x = 0,
        y = -240,
        strata = "DIALOG"
    },

    -- Настройки чекбоксов
    Checkbox = {
        width = 30,
        height = 30,
        leftOffset = 10,
        textOffset = 45,
        spacing = 30
    },

    -- Настройки текста опций
    Text = {
        width = 240,
        height = 25,
        extendedHeight = 35
    }
}

-- Определение всех опций в одном месте для легкого управления
local OPTION_DEFINITIONS = {
    {
        name = "KQAutoshowOption",
        textKey = "KQAutoshowOptionTEXT",
        localKey = "KQAutoshowOptionLocal",
        yOffset = -50,
        configPath = "WithAtlas",
        handler = "autoshow",
        messageKeys = {"AQAtlasAutoON", "AQAtlasAutoOFF"}
    },
    {
        name = "KQLEFTOption",
        textKey = "KQLEFTOptionTEXT",
        localKey = "KQLEFTOptionLocal",
        yOffset = -80,
        configPath = "ShownSide",
        handler = "position",
        handlerParam = "Left"
    },
    {
        name = "KQRIGHTOption",
        textKey = "KQRIGHTOptionTEXT",
        localKey = "KQRIGHTOptionLocal",
        yOffset = -110,
        configPath = "ShownSide",
        handler = "position",
        handlerParam = "Right"
    },
    {
        name = "KQColourOption",
        textKey = "KQColourOptionTEXT",
        localKey = "KQColourOptionLocal",
        yOffset = -140,
        configPath = "ColourCheck",
        handler = "color",
        messageKeys = {"AQCCON", "AQCCOFF"},
        updateRequired = true
    },
    {
        name = "KQCheckQuestlogButton",
        textKey = "KQCheckQuestlogTEXT",
        localKey = "KQCheckQuestlogLocal",
        yOffset = -170,
        configPath = "CheckQuestlog",
        handler = "questlog",
        updateRequired = true
    },
    {
        name = "KQAutoQueryOption",
        textKey = "KQAutoQueryTEXT",
        localKey = "KQAutoQueryLocal",
        yOffset = -200,
        textHeight = OPTION_CONFIG.Text.extendedHeight,
        configPath = "AutoQuery",
        handler = "autoquery"
    },
    {
        name = "KQQuerySpamOption",
        textKey = "KQQuerySpamTEXT",
        localKey = "KQQuerySpamLocal",
        yOffset = -235,
        textHeight = OPTION_CONFIG.Text.extendedHeight,
        configPath = "QuerySpam",
        handler = "queryspam"
    },
    {
        name = "KQCompareTooltipOption",
        textKey = "KQCompareTooltipTEXT",
        localKey = "KQCompareTooltipLocal",
        yOffset = -270,
        textHeight = OPTION_CONFIG.Text.extendedHeight,
        configPath = "CompareTooltip",
        handler = "tooltip"
    }
}

-- ========================================================================
-- ВСПОМОГАТЕЛЬНЫЕ УТИЛИТЫ
-- ========================================================================

local OptionUtils = {
    -- Безопасное получение конфигурационного значения
    getConfigValue = function(configPath)
        if not AtlasKTW or not AtlasKTW.Q then
            return false
        end
        return AtlasKTW.Q[configPath]
    end,

    -- Безопасная установка конфигурационного значения
    setConfigValue = function(configPath, value)
        if not AtlasKTW then
            AtlasKTW = {}
        end
        if not AtlasKTW.Q then
            AtlasKTW.Q = {}
        end
        AtlasKTW.Q[configPath] = value
    end,

    -- Безопасное получение локализованной строки
    getLocalizedText = function(key)
        return _G[key] or key
    end,

    -- Отправка сообщения в чат
    sendChatMessage = function(message)
        if message and DEFAULT_CHAT_FRAME then
            DEFAULT_CHAT_FRAME:AddMessage(message)
        end
    end,

    -- Установка позиции квест фрейма
    setQuestFramePosition = function(side)
        if not KQuestFrame then
            return false
        end

        KQuestFrame:ClearAllPoints()

        if side == "Right" then
            if questConfig and ui and ui.Positions then
                local pos = ui.Positions.Right
                local atlasFrame = _G[pos.relativeTo]
                if atlasFrame then
                    KQuestFrame:SetPoint(pos.point, atlasFrame, pos.relativePoint, pos.x, pos.y)
                else
                    -- Fallback если AtlasFrame не найден
                    KQuestFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 600, -100)
                end
            end
        else -- Left
            if questConfig and ui and ui.Positions then
                local pos = ui.Positions.Left
                local atlasFrame = _G[pos.relativeTo]
                if atlasFrame then
                    KQuestFrame:SetPoint(pos.point, atlasFrame, pos.relativePoint, pos.x, pos.y)
                else
                    -- Fallback если AtlasFrame не найден
                    KQuestFrame:SetPoint("TOPRIGHT", UIParent, "TOPLEFT", 300, -100)
                end
            end
        end
        return true
    end
}

-- ========================================================================
-- ОБЪЕДИНЕННЫЕ ОБРАБОТЧИКИ ОПЦИЙ
-- ========================================================================

local OptionHandlers = {
    -- Автопоказ с Atlas
    autoshow = function()
        local currentValue = OptionUtils.getConfigValue("WithAtlas")
        local newValue = not currentValue

        OptionUtils.setConfigValue("WithAtlas", newValue)

        local checkbox = _G.KQAutoshowOption
        if checkbox then
            checkbox:SetChecked(newValue)
        end

        local messageKey = newValue and "AQAtlasAutoON" or "AQAtlasAutoOFF"
        OptionUtils.sendChatMessage(OptionUtils.getLocalizedText(messageKey))
    end,

    -- Позиционирование окна квестов
    position = function(side)
        if not side then
            return
        end

        -- Сохраняем предыдущую настройку
        local oldSide = OptionUtils.getConfigValue("ShownSide") or "Right"

        -- Сначала обновляем настройки
        OptionUtils.setConfigValue("ShownSide", side)

        -- Затем устанавливаем позицию фрейма
        if not OptionUtils.setQuestFramePosition(side) then
            -- ИСПРАВЛЕНИЕ: добавляем реальный код вместо пустого комментария
            if KQuestFrame then
                KQuestFrame:ClearAllPoints()
                local atlasFrame = _G["AtlasFrame"]
                if atlasFrame then
                    if side == "Right" then
                        KQuestFrame:SetPoint("TOPLEFT", atlasFrame, "TOPRIGHT", 5, 0)
                    else
                        KQuestFrame:SetPoint("TOPRIGHT", atlasFrame, "TOPLEFT", -5, 0)
                    end
                else
                    -- Если AtlasFrame недоступен, используем UIParent
                    if side == "Right" then
                        KQuestFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 600, -100)
                    else
                        KQuestFrame:SetPoint("TOPRIGHT", UIParent, "TOPLEFT", 300, -100)
                    end
                end
            end
        end


        -- Обновляем чекбоксы
        local rightCheckbox = _G.KQRIGHTOption
        local leftCheckbox = _G.KQLEFTOption

        if rightCheckbox then
            rightCheckbox:SetChecked(side == "Right")
        end
        if leftCheckbox then
            leftCheckbox:SetChecked(side == "Left")
        end


        -- Показываем сообщение только при переключении на левую сторону
        if side == "Left" and oldSide ~= "Left" then
            OptionUtils.sendChatMessage(OptionUtils.getLocalizedText(KQLEFTOptionLocal))
        else
            OptionUtils.sendChatMessage(OptionUtils.getLocalizedText(KQRIGHTOptionLocal))
        end
    end,

    -- Цветовая схема
    color = function()
        local currentValue = OptionUtils.getConfigValue("ColourCheck")
        local newValue = not currentValue

        OptionUtils.setConfigValue("ColourCheck", newValue)

        local checkbox = _G.KQColourOption
        if checkbox then
            checkbox:SetChecked(newValue)
        end

        local messageKey = newValue and "AQCCON" or "AQCCOFF"
        OptionUtils.sendChatMessage(OptionUtils.getLocalizedText(messageKey))

        -- Помечаем что нужно обновить UI
        variables.NEED_UPDATE = true
    end,

    -- Проверка журнала квестов
    questlog = function()
        local currentValue = OptionUtils.getConfigValue("CheckQuestlog")
        local newValue = not currentValue

        OptionUtils.setConfigValue("CheckQuestlog", newValue)

        local checkbox = _G.KQCheckQuestlogButton
        if checkbox then
            checkbox:SetChecked(newValue)
        end

        -- Помечаем что нужно обновить UI
        variables.NEED_UPDATE = true
    end,

    -- Автоматический запрос
    autoquery = function()
        local currentValue = OptionUtils.getConfigValue("AutoQuery")
        local newValue = not currentValue

        OptionUtils.setConfigValue("AutoQuery", newValue)

        local checkbox = _G.KQAutoQueryOption
        if checkbox then
            checkbox:SetChecked(newValue)
        end
    end,

    -- Подавление спама запросов
    queryspam = function()
        local currentValue = OptionUtils.getConfigValue("QuerySpam")
        local newValue = not currentValue

        OptionUtils.setConfigValue("QuerySpam", newValue)

        local checkbox = _G.KQQuerySpamOption
        if checkbox then
            checkbox:SetChecked(newValue)
        end
    end,

    -- Сравнение в тултипах
    tooltip = function()
        local currentValue = OptionUtils.getConfigValue("CompareTooltip")
        local newValue = not currentValue

        OptionUtils.setConfigValue("CompareTooltip", newValue)

        local checkbox = _G.KQCompareTooltipOption
        if checkbox then
            checkbox:SetChecked(newValue)
        end

        -- Регистрируем/отменяем регистрацию тултипов
        if newValue then
            if KQuestRegisterTooltip then
                KQuestRegisterTooltip()
            end
        else
            if KQuestUnRegisterTooltip then
                KQuestUnRegisterTooltip()
            end
        end
    end
}

-- ========================================================================
-- ГЛОБАЛЬНЫЕ ОБРАБОТЧИКИ СОБЫТИЙ (для совместимости)
-- ========================================================================

-- Упрощенные обработчики используют централизованную систему
function KQAutoshowOption_OnClick()
    OptionHandlers.autoshow()
    KQuest_SaveData()
end

function KQRIGHTOption_OnClick()
    OptionHandlers.position("Right")
    KQuest_SaveData()
end

function KQLEFTOption_OnClick()
    OptionHandlers.position("Left")
    KQuest_SaveData()
end

function KQColourOption_OnClick()
    OptionHandlers.color()
    KQuest_SaveData()
end

function KQCheckQuestlogButton_OnClick()
    OptionHandlers.questlog()
    KQuest_SaveData()
end

function KQAutoQueryOption_OnClick()
    OptionHandlers.autoquery()
    KQuest_SaveData()
end

function KQQuerySpamOption_OnClick()
    OptionHandlers.queryspam()
    KQuest_SaveData()
end

function KQCompareTooltipOption_OnClick()
    OptionHandlers.tooltip()
    KQuest_SaveData()
end

-- ========================================================================
-- ИНИЦИАЛИЗАЦИЯ ОПЦИЙ ПРИ ПОКАЗЕ ПАНЕЛИ
-- ========================================================================

function KQuestOptionFrame_OnShow()
    -- Инициализируем все опции из определений
    for _, optionDef in ipairs(OPTION_DEFINITIONS) do
        local checkbox = _G[optionDef.name]
        if checkbox then
            local value
            if optionDef.configPath == "ShownSide" then
                local side = OptionUtils.getConfigValue("ShownSide") or "Right"
                value = (side == optionDef.handlerParam)
            else
                value = OptionUtils.getConfigValue(optionDef.configPath) or false
            end
            checkbox:SetChecked(value)
        end
    end
end

-- ========================================================================
-- СОЗДАНИЕ UI ЭЛЕМЕНТОВ
-- ========================================================================

local FrameFactory = {
    -- Создание основного фрейма опций
    createMainFrame = function()
        local config = OPTION_CONFIG.Frame
        local frame = CreateFrame("Frame", "KQuestOptionFrame", UIParent)

        frame:EnableMouse(true)
        frame:SetMovable(true)
        frame:Hide()
        frame:SetFrameStrata(config.strata)
        frame:EnableKeyboard(true)
        frame:SetToplevel(true)
        frame:SetWidth(config.width)
        frame:SetHeight(config.height)
        frame:SetPoint(config.point, config.x, config.y)
        frame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "",
            tile = false
        })

        return frame
    end,

    -- Создание заголовка
    createTitle = function(parent)
        local title = parent:CreateFontString("$parent_Title", "ARTWORK", "GameFontNormal")
        title:SetPoint("TOP", 0, -15)
        title:SetText(OptionUtils.getLocalizedText("AQOptionsCaptionTEXT"))
        title:SetJustifyH("CENTER")
        return title
    end,

    -- Создание кнопки закрытия
    createCloseButton = function(parent)
        local closeButton = CreateFrame("Button", "KQOptionCloseButton", parent, "OptionsButtonTemplate")
        closeButton:SetWidth(80)
        closeButton:SetHeight(20)
        closeButton:SetPoint("BOTTOM", 0, 15)
        closeButton:SetText(OptionUtils.getLocalizedText("AQ_OK"))

        closeButton:SetScript("OnClick", function()
            HideUIPanel(KQuestOptionFrame)
        end)

        closeButton:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return closeButton
    end,

    -- Создание текста опции
    createOptionText = function(parent, name, yOffset, height)
        local config = OPTION_CONFIG.Text
        local text = parent:CreateFontString(name, "ARTWORK", "GameFontNormalSmall")
        text:SetWidth(config.width)
        text:SetHeight(height or config.height)
        text:SetPoint("TOPLEFT", OPTION_CONFIG.Checkbox.textOffset, yOffset)
        text:SetJustifyH("LEFT")
        text:SetText(OptionUtils.getLocalizedText(string.gsub(name, "TEXT", "Local")))
        return text
    end,

    -- Создание чекбокса
    createCheckbox = function(parent, name, yOffset, onClickHandler)
        local config = OPTION_CONFIG.Checkbox
        local checkbox = CreateFrame("CheckButton", name, parent, "OptionsCheckButtonTemplate")
        checkbox:SetWidth(config.width)
        checkbox:SetHeight(config.height)
        checkbox:SetPoint("TOPLEFT", config.leftOffset, yOffset)
        checkbox:SetChecked(true)
        checkbox:SetHitRectInsets(0, 0, 0, 0)
        checkbox:SetScript("OnClick", onClickHandler)

        checkbox:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return checkbox
    end
}

-- ========================================================================
-- ОСНОВНАЯ ФУНКЦИЯ СОЗДАНИЯ ИНТЕРФЕЙСА
-- ========================================================================

function CreateKQuestOptionFrame()
    -- Создаем основной фрейм
    local frame = FrameFactory.createMainFrame()

    -- Настраиваем события фрейма
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnShow", KQuestOptionFrame_OnShow)
    frame:SetScript("OnKeyDown", function()
        if arg1 == "ESCAPE" then
            HideUIPanel(this)
        end
    end)
    frame:SetScript("OnHide", function()
        KQuestOptionFrame:StopMovingOrSizing()
    end)
    frame:SetScript("OnDragStart", function()
        this:StartMoving()
        this.isMoving = true
    end)
    frame:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
        this.isMoving = false
    end)

    -- Создаем заголовок
    FrameFactory.createTitle(frame)

    -- Создаем кнопку закрытия
    FrameFactory.createCloseButton(frame)

    -- Создаем все опции на основе определений
    for _, optionDef in ipairs(OPTION_DEFINITIONS) do
        -- Создаем текст
        FrameFactory.createOptionText(
            frame,
            optionDef.textKey,
            optionDef.yOffset,
            optionDef.textHeight
        )

        -- Создаем чекбокс
        FrameFactory.createCheckbox(
            frame,
            optionDef.name,
            optionDef.yOffset,
            _G[optionDef.name .. "_OnClick"]
        )
    end

    return frame
end

-- ========================================================================
-- УТИЛИТЫ ДЛЯ ВНЕШНЕГО ИСПОЛЬЗОВАНИЯ
-- ========================================================================

-- Экспорт утилит для использования в других модулях
_G.KQuestOptionUtils = {
    getConfigValue = OptionUtils.getConfigValue,
    setConfigValue = OptionUtils.setConfigValue,
    applyOption = function(optionName, value)
        if OptionHandlers[optionName] then
            if optionName == "position" then
                OptionHandlers[optionName](value)
            else
                OptionHandlers[optionName]()
            end
            KQuest_SaveData()
        end
    end
}

--[[
=============================================================================
ОСНОВНЫЕ УЛУЧШЕНИЯ В ЭТОЙ ВЕРСИИ:
=============================================================================

1. **Устранение дублирования**: Объединенные обработчики событий
2. **Централизованная конфигурация**: Все настройки в OPTION_DEFINITIONS
3. **Модульность**: Разделение на утилиты, обработчики и фабрики
4. **Безопасность**: Проверки существования объектов
5. **Расширяемость**: Легко добавлять новые опции
6. **Совместимость**: Сохранена обратная совместимость с API
7. **Оптимизация**: Уменьшено количество повторяющегося кода
8. **Валидация**: Безопасное получение/установка значений

Преимущества:
- Код стал более читаемым и поддерживаемым
- Легко добавлять новые опции
- Централизованная обработка ошибок
- Улучшенная производительность
- Лучшая организация кода

=============================================================================
]]