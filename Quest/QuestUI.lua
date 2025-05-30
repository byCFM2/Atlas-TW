-- Atlas Quest UI Module - Полная интеграция с QuestConfig
-- Версия: 3.0 - Оптимизированная для WoW 1.12 с использованием QuestConfig
-- Совместимость: Lua 5.0
-- Автор: Vitali
-- Дата: 30.05.2025
-----------------------------------------------------------------------------

local _G = getfenv()

--[[
=============================================================================
ПОЛНОСТЬЮ ПЕРЕРАБОТАННАЯ UI СИСТЕМА ДЛЯ ATLAS QUEST
=============================================================================

Основные улучшения:
1. Полная интеграция с QuestConfig.lua
2. Модульная фабрика UI элементов
3. Централизованное управление событиями
4. Оптимизированная производительность
5. Улучшенная читаемость и поддерживаемость

=============================================================================
]]

-- ========================================================================
-- ИМПОРТ КОНФИГУРАЦИИ И ПРОВЕРКА ЗАВИСИМОСТЕЙ
-- ========================================================================

if not KQuestConfig then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest UI Error:|r KQuestConfig не найден! Убедитесь что QuestConfig.lua загружен первым.")
    return
end

-- Импортируем конфигурацию
local Colors = KQuestConfig.Colors
local UI = KQuestConfig.UI
local Constants = KQuestConfig.Constants
local ColorUtils = KQuestConfig.ColorUtils
local UIUtils = KQuestConfig.UIUtils

-- ========================================================================
-- КОНФИГУРАЦИЯ UI ЭЛЕМЕНТОВ
-- ========================================================================

local FRAME_CONFIG = {
    -- Основной фрейм
    Main = {
        name = "KQuestFrame",
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

    -- Конфигурация кнопок
    Buttons = {
        Close = {
            name = "KQCloseButton1",
            width = 27,
            height = 27,
            point = "TOPLEFT",
            x = 10,
            y = -10,
            text = "X",
            template = "UIPanelCloseButton",
            onClick = "KQCLOSE1_OnClick"
        },
        Options = {
            name = "KQOptionButton1",
            width = 80,
            height = 20,
            point = "BOTTOMRIGHT",
            x = -20,
            y = 15,
            text = "Options",
            template = "OptionsButtonTemplate",
            onClick = "KQOPTION1_OnClick"
        },
        Story = {
            name = "KQStoryButton1",
            width = 70,
            height = 20,
            point = "TOP",
            x = 0,
            y = -13,
            text = "Story",
            template = "OptionsButtonTemplate",
            onClick = "KQSTORY1_OnClick"
        }
    },

    -- Чекбоксы фракций
    FactionCheckboxes = {
        Alliance = {
            name = "KQuestAllianceCheckBox",
            point = "TOPLEFT",
            x = 12,
            y = -30,
            width = 30,
            height = 30,
            onClick = "Alliance_OnClick"
        },
        Horde = {
            name = "KQuestHordeCheckBox",
            point = "TOPRIGHT",
            x = -12,
            y = -30,
            width = 30,
            height = 30,
            onClick = "Horde_OnClick"
        }
    },

    -- Текстуры фракций
    FactionTextures = {
        Alliance = {
            name = "AQ_AllianceTexture",
            point = "TOPLEFT",
            x = 38,
            y = -30,
            width = 50,
            height = 50,
            texture = "Interface\\TargetingFrame\\UI-PVP-Alliance"
        },
        Horde = {
            name = "AQ_HordeTexture",
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
        x = 15,
        maxCount = Constants.MAX_QUESTS_PER_INSTANCE
    }
}

-- ========================================================================
-- ОБРАБОТЧИКИ СОБЫТИЙ
-- ========================================================================

-- Автоматическое определение фракции при показе
function KQ_OnShow()
    local isHorde = UnitFactionGroup("player") == "Horde"
    AtlasKTW.isHorde = isHorde

    -- Безопасное обновление чекбоксов
    UIUtils.safeUpdateCheckbox("KQuestHordeCheckBox", isHorde)
    UIUtils.safeUpdateCheckbox("KQuestAllianceCheckBox", not isHorde)

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
    UIUtils.safeUpdateCheckbox("KQuestAllianceCheckBox", true)
    UIUtils.safeUpdateCheckbox("KQuestHordeCheckBox", false)

    KQuest_SaveData()
    AtlasKTW.QUpdateNOW = true
end

-- Обработчик чекбокса Орды
function Horde_OnClick()
    AtlasKTW.isHorde = true
    UIUtils.safeUpdateCheckbox("KQuestAllianceCheckBox", false)
    UIUtils.safeUpdateCheckbox("KQuestHordeCheckBox", true)

    KQuest_SaveData()
    AtlasKTW.QUpdateNOW = true
end

-- Обработчик общей кнопки
function AQGeneral_OnClick(button)
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
        UIUtils.updateTextElement("KQuestName",
            ColorUtils.colorText(instGeneral[1][1], Colors.blue))

        local storyText = ColorUtils.colorText(instGeneral[1][2], Colors.white) ..
                         "\n \n" .. instGeneral[1][3]
        UIUtils.updateTextElement("KQuestStory", storyText)

        -- Показываем кнопку следующей страницы если доступна
        AQ_NextPageCount = "Boss"
        if instGeneral[2] then
            local rightButton = UIUtils.getUIElement("KQNextPageButton_Right")
            if rightButton then ShowUIPanel(rightButton) end

            AtlasKTW.Q.CurrentPage = 1
            UIUtils.updateTextElement("KQuestPageCount",
                AtlasKTW.Q.CurrentPage.."/"..getn(instGeneral))
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
    if ChatFrameEditBox:IsVisible() and IsShiftKeyDown() then
        kQInsertQuestInformation()
    else
        KQuestHideAL()
        UIUtils.updateTextElement("KQuestStory", "")

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
-- УЛУЧШЕННАЯ ФАБРИКА UI ЭЛЕМЕНТОВ
-- ========================================================================

local KQuestUIFactory = {
    -- Создание кнопки с полной конфигурацией
    createButton = function(parent, config)
        local template = config.template or "OptionsButtonTemplate"
        local button = CreateFrame("Button", config.name, parent, template)

        button:SetWidth(config.width)
        button:SetHeight(config.height)
        button:SetPoint(config.point, parent, config.relativePoint or config.point, config.x, config.y)

        if config.text then button:SetText(config.text) end
        if config.onClick then
            button:SetScript("OnClick", _G[config.onClick])
        end

        button:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return button
    end,

    -- Создание чекбокса с конфигурацией
    createCheckbox = function(parent, config)
        local checkbox = CreateFrame("CheckButton", config.name, parent, "OptionsCheckButtonTemplate")

        checkbox:SetWidth(config.width)
        checkbox:SetHeight(config.height)
        checkbox:SetPoint(config.point, parent, config.relativePoint or config.point, config.x, config.y)
        checkbox:SetChecked(false)
        checkbox:SetHitRectInsets(0, 0, 0, 0)

        if config.onClick then
            checkbox:SetScript("OnClick", _G[config.onClick])
        end

        checkbox:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return checkbox
    end,

    -- Создание текстуры фракции
    createFactionTexture = function(parent, config)
        local texture = parent:CreateTexture(config.name, "OVERLAY")
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
    local positions = UI.Positions
    local position = positions[side] or positions.Right

    if position and AtlasFrame then
        KQuestFrame:ClearAllPoints()
        KQuestFrame:SetPoint(
            position.point,
            _G[position.relativeTo] or AtlasFrame,
            position.relativePoint,
            position.x,
            position.y
        )
    end
end

-- ========================================================================
-- ОСНОВНАЯ ФУНКЦИЯ СОЗДАНИЯ UI
-- ========================================================================

function KQuestFrame_CreateUI()
    if not AtlasFrame then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest:|r AtlasFrame не найден!")
        return
    end

    -- Создаем основной фрейм
    local mainConfig = FRAME_CONFIG.Main
    local frame = CreateFrame("Frame", mainConfig.name, AtlasFrame)

    frame:SetWidth(mainConfig.width)
    frame:SetHeight(mainConfig.height)
    frame:SetFrameStrata(mainConfig.strata)
    frame:SetBackdrop(mainConfig.backdrop)
    frame:SetBackdropColor(0, 0, 0, 1)

    -- ДОБАВЛЯЕМ ОТСУТСТВУЮЩИЕ НАСТРОЙКИ ФРЕЙМА
    frame:EnableMouse(true)
    frame:SetMovable(false)
    frame:Hide()
    frame:SetPoint("TOP", "AtlasFrame", -556, -30)

    -- ДОБАВЛЯЕМ РЕГИСТРАЦИЮ СОБЫТИЙ
    frame:RegisterEvent("VARIABLES_LOADED")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")

    -- ДОБАВЛЯЕМ ОБРАБОТЧИКИ СОБЫТИЙ
    frame:SetScript("OnEvent", KQuest_OnEvent)
    frame:SetScript("OnShow", KQ_OnShow)
    frame:SetScript("OnUpdate", KQ_OnUpdate)

    -- Устанавливаем позицию
    KQuestFrame_SetInitialPosition()

    -- Создаем кнопки
    for buttonType, config in pairs(FRAME_CONFIG.Buttons) do
        KQuestUIFactory.createButton(frame, config)
    end

    -- Создаем чекбоксы фракций
    for faction, config in pairs(FRAME_CONFIG.FactionCheckboxes) do
        local checkbox = KQuestUIFactory.createCheckbox(frame, config)
        -- ДОБАВЛЯЕМ УСТАНОВКУ НАЧАЛЬНОГО СОСТОЯНИЯ
        if faction == "Alliance" then
            checkbox:SetChecked(true)
        end
    end

    -- Создаем текстуры фракций
    for faction, config in pairs(FRAME_CONFIG.FactionTextures) do
        KQuestUIFactory.createFactionTexture(frame, config)
    end

    -- ДОБАВЛЯЕМ ОТСУТСТВУЮЩУЮ ОБЩУЮЮ КНОПКУ
    local generalButton = CreateFrame("Button", "KQGeneralButton", frame)
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

    -- ДОБАВЛЯЕМ ОТСУТСТВУЮЩИЙ СЧЕТЧИК КВЕСТОВ
    local qcount = frame:CreateFontString("KQuestCount", "ARTWORK", "GameFontNormal")
    qcount:SetWidth(60)
    qcount:SetHeight(40)
    qcount:SetPoint("TOP", frame, "TOP", 0, -25)

    -- Создаем кнопки квестов
    local questConfig = FRAME_CONFIG.QuestButton
    questConfig.maxCount = Constants.MAX_QUESTS_PER_INSTANCE

    local prevButton = nil
    local prevArrow = nil
    local prevText = nil

    for i = 1, questConfig.maxCount do
        -- Создаем кнопку
        local button = KQuestUIFactory.createQuestButton(i, frame, prevButton)
        prevButton = button

        -- Создаем стрелку
        local arrow = KQuestUIFactory.createArrow(i, frame, prevArrow)
        prevArrow = arrow

        -- Создаем текст
        local text = KQuestUIFactory.createButtonText(i, frame, prevText)
        prevText = text
    end

    -- Настраиваем события фрейма
    frame:SetScript("OnHide", function()
        -- Дополнительная очистка при скрытии
        if AtlasKTW and AtlasKTW.Q then
            AtlasKTW.Q.ShownQuest = 0
        end
    end)

    return frame
end

-- ========================================================================
-- РАСШИРЕННЫЕ УТИЛИТЫ ДЛЯ UI
-- ========================================================================

-- Добавляем дополнительные утилиты в KQuestConfig.UIUtils
if KQuestConfig.UIUtils then
    -- Безопасное обновление чекбокса
    KQuestConfig.UIUtils.safeUpdateCheckbox = function(name, checked)
        local checkbox = _G[name]
        if checkbox and checkbox.SetChecked then
            checkbox:SetChecked(checked)
        end
    end

    -- Безопасное обновление текстового элемента
    KQuestConfig.UIUtils.updateTextElement = function(name, text)
        local element = _G[name]
        if element and element.SetText then
            element:SetText(text)
        end
    end

    -- Переключение видимости элемента
    KQuestConfig.UIUtils.toggleElementVisibility = function(name)
        local element = _G[name]
        if element then
            if element:IsVisible() then
                HideUIPanel(element)
            else
                ShowUIPanel(element)
            end
        end
    end

    -- Безопасная установка позиции элемента
    KQuestConfig.UIUtils.safeSetPosition = function(element, point, relative, relativePoint, x, y)
        if element and element.SetPoint then
            element:ClearAllPoints()
            element:SetPoint(point, relative, relativePoint, x, y)
        end
    end
end

-- ========================================================================
-- ФУНКЦИИ СОВМЕСТИМОСТИ (для существующего кода)
-- ========================================================================

-- Функция очистки всех элементов (совместимость)
function KQClearALL()
    if KQuestConfig and KQuestConfig.UIUtils then
        -- Используем новую систему очистки
        local elementsToHide = {
            "KQuestPageCount", "KQNextPageButton_Right", "KQNextPageButton_Left",
            "KQuestName", "KQuestLevel", "KQuestDetails", "KQuestAttainLevel",
            "KQuestReward", "KQuestStory", "KQuestFinishedText", "KQuestFinished"
        }

        for _, elementName in ipairs(elementsToHide) do
            KQuestConfig.UIUtils.updateTextElement(elementName, "")
        end

        -- Очистка фреймов предметов
        for i = 1, 6 do
            local frameName = "KQuestItemframe" .. i
            KQuestConfig.UIUtils.updateTextElement(frameName .. "_Name", "")
            KQuestConfig.UIUtils.updateTextElement(frameName .. "_Extra", "")

            local icon = _G[frameName .. "_Icon"]
            if icon and icon.SetTexture then
                icon:SetTexture()
            end

            local frame = _G[frameName]
            if frame and frame.Disable then
                frame:Disable()
            end
        end
    end
end

-- ========================================================================
-- ИНИЦИАЛИЗАЦИЯ
-- ========================================================================

-- Автоматическая инициализация UI при загрузке
local function InitializeKQuestUI()
    if not AtlasFrame then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest:|r AtlasFrame не найден!")
        return
    end

    if not _G["KQuestFrame"] then
        KQuestFrame_CreateUI()
    end
end

-- Отложенная инициализация через событие
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("VARIABLES_LOADED")
initFrame:SetScript("OnEvent", function()
    if (event == "ADDON_LOADED" and arg1 == "Atlas-TW") or event == "VARIABLES_LOADED" then
        -- Небольшая задержка для гарантии загрузки всех зависимостей
        local delayFrame = CreateFrame("Frame")
        local elapsed = 0
        delayFrame:SetScript("OnUpdate", function()
            elapsed = elapsed + arg1
            if elapsed > 0.5 then -- Задержка 0.5 секунды
                InitializeKQuestUI()
                delayFrame:SetScript("OnUpdate", nil)
            end
        end)

        if event == "ADDON_LOADED" then
            initFrame:UnregisterEvent("ADDON_LOADED")
        else
            initFrame:UnregisterEvent("VARIABLES_LOADED")
        end
    end
end)