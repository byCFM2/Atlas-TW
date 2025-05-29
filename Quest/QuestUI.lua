
-----------------------------------------------------------------------------
-- Atlas Quest UI Module - Refactored for QuestConfig Integration
-- Версия: 2.1 - Оптимизированная для WoW 1.12 с использованием QuestConfig
-- Совместимость: Lua 5.0
-- Автор: Vitali
-- Дата: 29.05.2025
-----------------------------------------------------------------------------

local _G = getfenv()

--[[
=============================================================================
МОДУЛЬНАЯ СИСТЕМА UI ДЛЯ ATLAS QUEST
=============================================================================

Основные улучшения:
1. Полная интеграция с QuestConfig.lua
2. Модульная фабрика UI элементов
3. Централизованная конфигурация
4. Оптимизированное позиционирование
5. Улучшенная читаемость и поддерживаемость

=============================================================================
]]

-- ========================================================================
-- ИМПОРТ КОНФИГУРАЦИИ И ПРОВЕРКА ЗАВИСИМОСТЕЙ
-- ========================================================================

-- Проверяем доступность конфигурации
if not KQuestConfig then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest UI Error:|r KQuestConfig не найден! Убедитесь что QuestConfig.lua загружен первым.")
    return
end

-- Импортируем необходимые константы и утилиты
local Colors = KQuestConfig.Colors
local UI = KQuestConfig.UI
local Constants = KQuestConfig.Constants
local ColorUtils = KQuestConfig.ColorUtils
local UIUtils = KQuestConfig.UIUtils

-- ========================================================================
-- КОНСТАНТЫ UI ИЗ КОНФИГУРАЦИИ
-- ========================================================================

local FRAME_CONFIG = {
    -- Основной фрейм
    Main = {
        width = 220,
        height = 570,
        strata = "HIGH",
        backdrop = {
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        }
    },

    -- Кнопки
    Buttons = {
        Close = {
            width = 27,
            height = 27,
            point = "TOPLEFT",
            x = 10,
            y = -10
        },
        Options = {
            width = 80,
            height = 20,
            point = "BOTTOMRIGHT",
            x = -20,
            y = 15
        },
        Story = {
            width = 70,
            height = 20,
            point = "TOP",
            x = 0,
            y = -13
        }
    },

    -- Чекбоксы фракций
    FactionCheckbox = {
        alliance = {
            point = "TOPLEFT",
            x = 12,
            y = -30,
            width = 30,
            height = 30,
        },
        horde = {
            point = "TOPRIGHT",
            x = -12,
            y = -30,
            width = 30,
            height = 30,
        }
    },

    -- Текстуры фракций
    FactionTexture = {
        alliance = {
            point = "TOPLEFT",
            x = 38,
            y = -30,
            width = 50,
            height = 50,
            texture = "Interface\\TargetingFrame\\UI-PVP-Alliance"
        },
        horde = {
            point = "TOPRIGHT",
            x = -26,
            y = -30,
            width = 50,
            height = 50,
            texture = "Interface\\TargetingFrame\\UI-PVP-Horde"
        }
    },

    -- Кнопки квестов
    QuestButton = {
        width = 165,
        height = 20,
        startY = -60,
        spacing = -20,
        point = "TOPLEFT",
        x = 15
    }
}

-- ========================================================================
-- ОБРАБОТЧИКИ СОБЫТИЙ (обновленные с интеграцией конфигурации)
-- ========================================================================

-- Автоматическое определение фракции при показе
function KQ_OnShow()
    local isHorde = UnitFactionGroup("player") == "Horde"
    AtlasKTW.isHorde = isHorde

    -- Используем безопасные обращения к UI элементам
    local hordeCheckbox = UIUtils.getUIElement("KQuestHordeCheckBox")
    local allianceCheckbox = UIUtils.getUIElement("KQuestAllianceCheckBox")

    if hordeCheckbox then hordeCheckbox:SetChecked(isHorde) end
    if allianceCheckbox then allianceCheckbox:SetChecked(not isHorde) end

    KQuestSetTextandButtons()
end

-- Обработчик закрытия основного фрейма
function KQCLOSE1_OnClick()
    HideUIPanel(KQuestFrame)
end

-- Обработчик кнопки опций
function KQOPTION1_OnClick()
    local optionFrame = UIUtils.getUIElement("KQuestOptionFrame")
    if optionFrame then
        if optionFrame:IsVisible() then
            HideUIPanel(optionFrame)
        else
            optionFrame:Show()
        end
    end
end

-- Обработчик кнопки истории
function KQSTORY1_OnClick()
    KQuestHideAL()
    local insideFrame = UIUtils.getUIElement("KQuestInsideFrame")
    if insideFrame then
        if not insideFrame:IsVisible() then
            ShowUIPanel(insideFrame)
            KQuestWhichButton = STORY
            KQuestButtonStory_SetText()
        elseif KQuestWhichButton == STORY then
            HideUIPanel(insideFrame)
        else
            KQuestWhichButton = STORY
            KQuestButtonStory_SetText()
        end
    end
end

-- Обработчик чекбокса Альянса
function Alliance_OnClick()
    AtlasKTW.isHorde = false
    local allianceCheckbox = UIUtils.getUIElement("KQuestAllianceCheckBox")
    local hordeCheckbox = UIUtils.getUIElement("KQuestHordeCheckBox")

    if allianceCheckbox then allianceCheckbox:SetChecked(true) end
    if hordeCheckbox then hordeCheckbox:SetChecked(false) end

    KQuest_SaveData()
    AtlasKTW.QUpdateNOW = true
end

-- Обработчик чекбокса Орды
function Horde_OnClick()
    AtlasKTW.isHorde = true
    local allianceCheckbox = UIUtils.getUIElement("KQuestAllianceCheckBox")
    local hordeCheckbox = UIUtils.getUIElement("KQuestHordeCheckBox")

    if allianceCheckbox then allianceCheckbox:SetChecked(false) end
    if hordeCheckbox then hordeCheckbox:SetChecked(true) end

    KQuest_SaveData()
    AtlasKTW.QUpdateNOW = true
end

-- Обработчик общей кнопки
function AQGeneral_OnClick(button)
    -- Очистка дисплея
    KQClearALL()
    KQuestHideAL()

    local insideFrame = UIUtils.getUIElement("KQuestInsideFrame")
    if insideFrame then
        if insideFrame:IsVisible() then
            HideUIPanel(insideFrame)
        else
            ShowUIPanel(insideFrame)
        end
    end

    local instGeneral = _G["Inst"..AtlasKTW.Instances.."General"]
    if instGeneral then
        local questName = UIUtils.getUIElement("KQuestName")
        local questStory = UIUtils.getUIElement("KQuestStory")

        if questName then
            questName:SetText(ColorUtils.colorText(instGeneral[1][1], Colors.blue))
        end

        if questStory then
            local storyText = ColorUtils.colorText(instGeneral[1][2], Colors.white) .. "\n \n" .. instGeneral[1][3]
            questStory:SetText(storyText)
        end

        -- Показываем кнопку следующей страницы если доступна
        AQ_NextPageCount = "Boss"
        if instGeneral[2] then
            local rightButton = UIUtils.getUIElement("KQNextPageButton_Right")
            if rightButton then ShowUIPanel(rightButton) end

            AtlasKTW.Q.CurrentPage = 1
            local pageCount = UIUtils.getUIElement("KQuestPageCount")
            if pageCount then
                pageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..getn(instGeneral))
            end
        end
    end
end

-- ========================================================================
-- ФУНКЦИИ РАБОТЫ С КВЕСТАМИ
-- ========================================================================

-- Вставка информации о квесте в чат
local function kQInsertQuestInformation()
    local questID = AtlasKTW.Q.ShownQuest
    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
    local questName = nil

    if KQuestInstanceData and
       KQuestInstanceData[AtlasKTW.Instances] and
       KQuestInstanceData[AtlasKTW.Instances].Quests and
       KQuestInstanceData[AtlasKTW.Instances].Quests[faction] and
       KQuestInstanceData[AtlasKTW.Instances].Quests[faction][questID] then
        questName = KQuestInstanceData[AtlasKTW.Instances].Quests[faction][questID].Title
    end

    if questName then
        -- Удаляем префикс уровня если присутствует
        local levelPattern = "^%d+%. "
        questName = string.gsub(questName, levelPattern, "")
        ChatFrameEditBox:Insert("["..questName.."]")
    end
end

-- Обработчик кликов по кнопкам квестов
function Quest_OnClick(button)
    -- Проверяем shift-клик при открытом чате (для вставки ссылки на квест)
    if ChatFrameEditBox:IsVisible() and IsShiftKeyDown() then
        kQInsertQuestInformation()
    else
        -- Скрываем фрейм AtlasLoot если видимый
        KQuestHideAL()

        -- Очищаем текст истории
        local questStory = UIUtils.getUIElement("KQuestStory")
        if questStory then questStory:SetText("") end

        -- Переключаем видимость фрейма деталей квеста
        local insideFrame = UIUtils.getUIElement("KQuestInsideFrame")
        if insideFrame then
            if not insideFrame:IsVisible() then
                ShowUIPanel(insideFrame)
                KQuestWhichButton = AtlasKTW.Q.ShownQuest
                KQButton_SetText()
            elseif KQuestWhichButton == AtlasKTW.Q.ShownQuest then
                HideUIPanel(insideFrame)
                KQuestWhichButton = 0
            else
                KQuestWhichButton = AtlasKTW.Q.ShownQuest
                KQButton_SetText()
            end
        end
    end
end

-- ========================================================================
-- ФАБРИКА UI ЭЛЕМЕНТОВ
-- ========================================================================

local UIElementFactory = {
    -- Создание кнопки с конфигурацией
    createButton = function(name, parent, config, text, onClick, template)
        template = template or "OptionsButtonTemplate"
        local button = CreateFrame("Button", name, parent, template)

        button:SetWidth(config.width)
        button:SetHeight(config.height)
        button:SetPoint(config.point, parent, config.relativePoint or config.point, config.x, config.y)

        if text then button:SetText(text) end
        if onClick then button:SetScript("OnClick", onClick) end

        button:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return button
    end,

    -- Создание чекбокса с конфигурацией
    createCheckbox = function(name, parent, config, onClick)
        local checkbox = CreateFrame("CheckButton", name, parent, "OptionsCheckButtonTemplate")

        checkbox:SetWidth(config.width)
        checkbox:SetHeight(config.height)
        checkbox:SetPoint(config.point, parent, config.relativePoint or config.point, config.x, config.y)
        checkbox:SetChecked(false)
        checkbox:SetHitRectInsets(0, 0, 0, 0)

        if onClick then checkbox:SetScript("OnClick", onClick) end

        checkbox:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return checkbox
    end,

    -- Создание текстуры фракции
    createFactionTexture = function(parent, faction, config)
        local texture = parent:CreateTexture("AQ_" .. faction .. "Texture", "OVERLAY")
        texture:SetWidth(config.width)
        texture:SetHeight(config.height)
        texture:SetPoint(config.point, parent, config.relativePoint or config.point, config.x, config.y)
        texture:SetTexture(config.texture)
        return texture
    end,

    -- Создание кнопки квеста
    createQuestButton = function(index, parent, prevButton)
        local config = FRAME_CONFIG.QuestButton
        local button = CreateFrame("Button", "AQQuestbutton" .. index, parent)

        button:SetWidth(config.width)
        button:SetHeight(config.height)

        if index == 1 then
            button:SetPoint(config.point, parent, config.point, config.x, config.startY)
        else
            button:SetPoint(config.point, prevButton, config.point, 0, config.spacing)
        end

        button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
        button:SetText(index)

        button:SetScript("OnClick", function()
            AtlasKTW.Q.ShownQuest = index
            Quest_OnClick(arg1)
        end)

        button:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return button
    end,

    -- Создание стрелки
    createArrow = function(index, parent, prevArrow)
        local config = FRAME_CONFIG.QuestButton
        local arrow = parent:CreateTexture("KQuestlineArrow_" .. index, "OVERLAY")

        arrow:SetWidth(13)
        arrow:SetHeight(15)

        if index == 1 then
            arrow:SetPoint("TOPLEFT", parent, "TOPLEFT", config.x + 1, config.startY - 5)
        else
            arrow:SetPoint("TOPLEFT", prevArrow, "TOPLEFT", 0, config.spacing)
        end

        arrow:SetTexture("Interface\\Glues\\Login\\UI-BackArrow")
        return arrow
    end,

    -- Создание текста кнопки
    createButtonText = function(index, parent, prevText)
        local config = FRAME_CONFIG.QuestButton
        local text = parent:CreateFontString("AQBUTTONTEXT" .. index, "OVERLAY", "GameFontNormalSmall")

        text:SetWidth(config.width)
        text:SetHeight(config.height)
        text:SetJustifyH("LEFT")

        if index == 1 then
            text:SetPoint("TOPLEFT", parent, "TOPLEFT", config.x + 15, config.startY)
        else
            text:SetPoint("TOPLEFT", prevText, "TOPLEFT", 0, config.spacing)
        end

        text:SetText(index)
        return text
    end
}

-- ========================================================================
-- ФУНКЦИЯ ИНИЦИАЛИЗАЦИИ ПОЗИЦИОНИРОВАНИЯ
-- ========================================================================

function KQuestFrame_SetInitialPosition()
    if not KQuestFrame then
        return
    end

    -- Получаем сохраненную настройку или используем "Right" по умолчанию
    local side = "Right"
    if AtlasKTW and AtlasKTW.Q and AtlasKTW.Q.ShownSide then
        side = AtlasKTW.Q.ShownSide
    end

    -- Используем конфигурацию позиций из KQuestConfig
    if UI.Positions and UI.Positions[side] then
        UIUtils.setFramePosition(KQuestFrame, UI.Positions[side])
    else
        -- Fallback позиционирование
        KQuestFrame:ClearAllPoints()
        local atlasFrame = UIUtils.getUIElement("AtlasFrame")
        if atlasFrame then
            if side == "Right" then
                KQuestFrame:SetPoint("TOPLEFT", atlasFrame, "TOPRIGHT", 5, 0)
            else
                KQuestFrame:SetPoint("TOPRIGHT", atlasFrame, "TOPLEFT", -5, 0)
            end
        else
            -- Если AtlasFrame недоступен
            if side == "Right" then
                KQuestFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 600, -100)
            else
                KQuestFrame:SetPoint("TOPRIGHT", UIParent, "TOPLEFT", 300, -100)
            end
        end
    end
end

-- ========================================================================
-- ОСНОВНАЯ ФУНКЦИЯ СОЗДАНИЯ ФРЕЙМА
-- ========================================================================

function CreateKQuestFrame()
    local frameConfig = FRAME_CONFIG.Main
    local frame = CreateFrame("Frame", "KQuestFrame", AtlasFrame)

    -- Основные настройки фрейма
    frame:EnableMouse(true)
    frame:SetMovable(false)
    frame:Hide()
    frame:SetWidth(frameConfig.width)
    frame:SetHeight(frameConfig.height)
    frame:SetFrameStrata(frameConfig.strata)

    -- НЕ устанавливаем позицию здесь - это будет сделано в функции инициализации

    -- Установка фона
    if frameConfig.backdrop then
        frame:SetBackdrop(frameConfig.backdrop)
    end

    -- Регистрация событий
    frame:RegisterEvent("VARIABLES_LOADED")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")

    -- Установка обработчиков событий
    frame:SetScript("OnEvent", KQuest_OnEvent)
    frame:SetScript("OnShow", KQ_OnShow)
    frame:SetScript("OnUpdate", KQ_OnUpdate)

    -- ========================================================================
    -- СОЗДАНИЕ UI ЭЛЕМЕНТОВ С ИСПОЛЬЗОВАНИЕМ ФАБРИКИ
    -- ========================================================================

    -- Кнопка закрытия
    UIElementFactory.createButton(
        "CLOSEbutton",
        frame,
        FRAME_CONFIG.Buttons.Close,
        "X",
        KQCLOSE1_OnClick,
        "UIPanelCloseButton"
    )

    -- Кнопка опций
    UIElementFactory.createButton(
        "OPTIONbutton",
        frame,
        FRAME_CONFIG.Buttons.Options,
        AQOptionB,
        KQOPTION1_OnClick
    )

    -- Кнопка истории
    UIElementFactory.createButton(
        "STORYbutton",
        frame,
        FRAME_CONFIG.Buttons.Story,
        AQStoryB,
        KQSTORY1_OnClick
    )

    -- Чекбоксы фракций
    local allianceCheckbox = UIElementFactory.createCheckbox(
        "KQuestAllianceCheckBox",
        frame,
        FRAME_CONFIG.FactionCheckbox.alliance,
        Alliance_OnClick
    )
    allianceCheckbox:SetChecked(true)

    UIElementFactory.createCheckbox(
        "KQuestHordeCheckBox",
        frame,
        FRAME_CONFIG.FactionCheckbox.horde,
        Horde_OnClick
    )

    -- Текстуры фракций
    UIElementFactory.createFactionTexture(frame, "Alliance", FRAME_CONFIG.FactionTexture.alliance)
    UIElementFactory.createFactionTexture(frame, "Horde", FRAME_CONFIG.FactionTexture.horde)

    -- Кнопка "Общее"
    local generalButton = CreateFrame("Button", "AQGeneralButton", frame)
    generalButton:SetWidth(165)
    generalButton:SetHeight(20)
    generalButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -30)
    generalButton:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    generalButton:SetText("G")
    generalButton:SetScript("OnClick", function()
        AQGeneral_OnClick(arg1)
    end)
    generalButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- Текстовое поле количества квестов
    local questCount = frame:CreateFontString("AtlasQuestAnzahl", "ARTWORK", "GameFontNormal")
    questCount:SetWidth(60)
    questCount:SetHeight(40)
    questCount:SetPoint("TOP", frame, "TOP", 0, -25)

    -- Создание кнопок квестов, стрелок и текстов
    local prevButton, prevArrow, prevText = nil, nil, nil

    for i = 1, 23 do
        if i == 1 then
            prevButton = UIElementFactory.createQuestButton(i, frame, nil)
            prevArrow = UIElementFactory.createArrow(i, frame, nil)
            prevText = UIElementFactory.createButtonText(i, frame, nil)
        else
            prevButton = UIElementFactory.createQuestButton(i, frame, prevButton)
            prevArrow = UIElementFactory.createArrow(i, frame, prevArrow)
            prevText = UIElementFactory.createButtonText(i, frame, prevText)
        end
    end

    return frame
end

-- ========================================================================
-- ЭКСПОРТ УТИЛИТ ДЛЯ ВНЕШНЕГО ИСПОЛЬЗОВАНИЯ
-- ========================================================================

-- Экспорт функций для использования в других модулях
_G.KQuestUIUtils = {
    setFramePosition = KQuestFrame_SetInitialPosition,
    getFrameConfig = function() return FRAME_CONFIG end,
    createUIElement = UIElementFactory
}

--[[
=============================================================================
ОСНОВНЫЕ УЛУЧШЕНИЯ В ЭТОЙ ВЕРСИИ:
=============================================================================

1. **Полная интеграция с KQuestConfig**: Все настройки берутся из централизованной конфигурации
2. **Модульная фабрика UI**: Унифицированное создание элементов через фабрику
3. **Улучшенное позиционирование**: Использует систему позиций из конфигурации
4. **Безопасные обращения к UI**: Все обращения идут через UIUtils.getUIElement
5. **Цветовая схема**: Использует централизованную систему цветов
6. **Конфигурируемость**: Легко изменять параметры через KQuestConfig
7. **Читаемость**: Четкая структура и документация
8. **Совместимость**: Сохранена обратная совместимость с существующими функциями

Преимущества:
- Централизованная конфигурация всех UI элементов
- Легкое изменение параметров без редактирования кода
- Улучшенная поддерживаемость и расширяемость
- Консистентность с остальными модулями
- Оптимизированная производительность

=============================================================================
]]