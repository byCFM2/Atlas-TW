
-- FRAME INSIDE ATLAS
-- AtlasTW Quest Inside Atlas frame
-- Исправлена проблема с самовызовом функций для совместимости с Lua 5.0 (WoW 1.12)

-- ========================================================================
-- КОНФИГУРАЦИЯ
-- ========================================================================
local _G = getfenv()
-- Константы для создания UI элементов
local QUEST_FRAME_CONFIG = {
    MAIN_FRAME = {
        width = 510,
        height = 510,
        point = "TOPLEFT",
        x = 18,
        y = -84
    },

    QUEST_ITEM = {
        width = 236,
        height = 30,
        icon_size = 24,
        name_width = 205,
        name_height = 12,
        extra_height = 10
    },

    CLOSE_BUTTON = {
        width = 30,
        height = 30,
        point = "TOPRIGHT",
        x = -5,
        y = -3
    },

    CHECKBOX = {
        width = 25,
        height = 25,
        point = "TOP",
        x = 150,
        y = -43
    },

    NAV_BUTTON = {
        width = 40,
        height = 40,
        point = "BOTTOM",
        y = 10
    }
}

-- Позиции фреймов квестов (левая и правая колонки)
local QUEST_FRAME_POSITIONS = {
    {x = 20, y = 120},   -- Left column, top
    {x = 266, y = 120},  -- Right column, top
    {x = 20, y = 70},    -- Left column, middle
    {x = 266, y = 70},   -- Right column, middle
    {x = 20, y = 20},    -- Left column, bottom
    {x = 266, y = 20}    -- Right column, bottom
}

-- ========================================================================
-- ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ (объявлены ДО фабрики)
-- ========================================================================

-- Функция создания дочерних элементов фрейма квеста
local function CreateQuestFrameElements(parent, baseName)
    local config = QUEST_FRAME_CONFIG.QUEST_ITEM

    -- Иконка предмета
    local icon = parent:CreateTexture(baseName .. "_Icon", "ARTWORK")
    icon:SetWidth(config.icon_size)
    icon:SetHeight(config.icon_size)
    icon:SetPoint("TOPLEFT", parent, "TOPLEFT")

    -- Название предмета
    local name = parent:CreateFontString(baseName .. "_Name", "ARTWORK", "GameFontNormal")
    name:SetWidth(config.name_width)
    name:SetHeight(config.name_height)
    name:SetPoint("TOPLEFT", icon, "TOPRIGHT", 3, 0)
    name:SetJustifyH("LEFT")

    -- Дополнительная информация
    local extra = parent:CreateFontString(baseName .. "_Extra", "ARTWORK", "GameFontNormalSmall")
    extra:SetWidth(config.name_width)
    extra:SetHeight(config.extra_height)
    extra:SetPoint("TOPLEFT", name, "BOTTOMLEFT")
    extra:SetJustifyH("LEFT")

    return {
        icon = icon,
        name = name,
        extra = extra
    }
end

-- Функция настройки событий для фрейма квеста
local function SetupQuestFrameEvents(frame, frameNumber)
    frame:RegisterForClicks("LeftButtonDown", "RightButtonDown")

    frame:SetScript("OnEnter", function()
        AQTHISISSHOWN = frameNumber
        KQuestItem_OnEnter()
    end)

    frame:SetScript("OnLeave", function()
        KQuestItem_OnLeave()
    end)

    frame:SetScript("OnClick", function()
        KQuestItem_OnClick(arg1)
    end)

    frame:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
end

-- ========================================================================
-- ФАБРИКА UI ЭЛЕМЕНТОВ (БЕЗ самовызовов)
-- ========================================================================

local KQuestUIFactory = {

    -- Создание основного фрейма
    createMainFrame = function()
        local config = QUEST_FRAME_CONFIG.MAIN_FRAME
        local frame = CreateFrame("Frame", "KQuestInsideFrame", AtlasFrame)

        frame:SetWidth(config.width)
        frame:SetHeight(config.height)
        frame:SetPoint(config.point, config.x, config.y)
        frame:EnableMouse(true)
        frame:SetToplevel(true)
        frame:Show()

        return frame
    end,

    -- Создание фрейма квеста БЕЗ самовызова
    createQuestFrame = function(frameNumber, position, parentFrame)
        local config = QUEST_FRAME_CONFIG.QUEST_ITEM
        local frameName = "KQuestItemframe" .. frameNumber

        local frame = CreateFrame("Button", frameName, parentFrame)
        frame:SetWidth(config.width)
        frame:SetHeight(config.height)
        frame:SetPoint("BOTTOMLEFT", position.x, position.y)
        frame:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

        -- Создание дочерних элементов через локальную функцию
        local elements = CreateQuestFrameElements(frame, frameName)

        -- Настройка событий через локальную функцию
        SetupQuestFrameEvents(frame, frameNumber)

        return frame, elements
    end,

    -- Создание кнопки закрытия
    createCloseButton = function(parent)
        local config = QUEST_FRAME_CONFIG.CLOSE_BUTTON
        local button = CreateFrame("Button", "CLOSEbutton2", parent, "UIPanelCloseButton")

        button:SetWidth(config.width)
        button:SetHeight(config.height)
        button:SetPoint(config.point, config.x, config.y)
        button:SetText("X")

        button:SetScript("OnClick", function()
            KQuestCLOSE2_OnClick()
        end)

        button:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)

        return button
    end,

    -- Создание чекбокса для завершенных квестов
    createFinishedQuestCheckbox = function(parent)
        local config = QUEST_FRAME_CONFIG.CHECKBOX
        local checkbox = CreateFrame("CheckButton", "KQuestFinished", parent, "OptionsCheckButtonTemplate")

        checkbox:SetWidth(config.width)
        checkbox:SetHeight(config.height)
        checkbox:SetPoint(config.point, config.x, config.y)
        checkbox:SetChecked(false)
        checkbox:SetHitRectInsets(0, 0, 0, 0)

        checkbox:SetScript("OnClick", function()
            KQFinishedQuest_OnClick()
        end)

        checkbox:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 2)
        end)

        return checkbox
    end,

    -- Создание навигационных кнопок
    createNavigationButtons = function(parent)
        local config = QUEST_FRAME_CONFIG.NAV_BUTTON
        local buttons = {}

        -- Кнопка "Вперед"
        local rightButton = CreateFrame("Button", "KQNextPageButton_Right", parent)
        rightButton:SetWidth(config.width)
        rightButton:SetHeight(config.height)
        rightButton:SetPoint(config.point, 45, config.y)
        rightButton:SetNormalTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Up")
        rightButton:SetPushedTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Down")
        rightButton:SetHighlightTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Highlight", "ADD")
        rightButton:Hide()

        rightButton:SetScript("OnClick", function()
            KQNextPageR_OnClick()
        end)

        rightButton:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 2)
        end)

        -- Кнопка "Назад"
        local leftButton = CreateFrame("Button", "KQNextPageButton_Left", parent)
        leftButton:SetWidth(config.width)
        leftButton:SetHeight(config.height)
        leftButton:SetPoint(config.point, -45, config.y)
        leftButton:SetNormalTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Up")
        leftButton:SetPushedTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Down")
        leftButton:SetHighlightTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Highlight", "ADD")
        leftButton:Hide()

        leftButton:SetScript("OnClick", function()
            KQNextPageL_OnClick()
        end)

        leftButton:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 2)
        end)

        buttons.right = rightButton
        buttons.left = leftButton

        return buttons
    end,

    -- Создание текстовых элементов
    createTextElements = function(parent)
        local elements = {}

        -- Фон
        local background = parent:CreateTexture(nil, "BACKGROUND")
        background:SetAllPoints(parent)
        background:SetTexture(0, 0, 0, 0.75)
        elements.background = background

        -- Название квеста
        local questName = parent:CreateFontString("KQuestName", "BACKGROUND", "GameFontNormal")
        questName:SetWidth(400)
        questName:SetHeight(12)
        questName:SetPoint("TOP", 0, -20)
        elements.questName = questName

        -- Уровень квеста
        local questLevel = parent:CreateFontString("KQuestLevel", "BACKGROUND", "GameFontNormal")
        questLevel:SetWidth(400)
        questLevel:SetHeight(12)
        questLevel:SetPoint("TOPLEFT", 20, -50)
        questLevel:SetJustifyH("LEFT")
        questLevel:SetJustifyV("TOP")
        elements.questLevel = questLevel

        -- Требуемый уровень
        local questAttainLevel = parent:CreateFontString("KQuestAttainLevel", "BACKGROUND", "GameFontNormal")
        questAttainLevel:SetWidth(400)
        questAttainLevel:SetHeight(12)
        questAttainLevel:SetPoint("TOPLEFT", 140, -50)
        questAttainLevel:SetJustifyH("LEFT")
        questAttainLevel:SetJustifyV("TOP")
        elements.questAttainLevel = questAttainLevel

        -- Детали квеста
        local questDetails = parent:CreateFontString("KQuestDetails", "BACKGROUND", "GameFontNormal")
        questDetails:SetWidth(450)
        questDetails:SetHeight(500)
        questDetails:SetPoint("TOPLEFT", 20, -75)
        questDetails:SetJustifyH("LEFT")
        questDetails:SetJustifyV("TOP")
        elements.questDetails = questDetails

        -- История
        local storyText = parent:CreateFontString("KQuestStory", "BACKGROUND", "GameFontNormal")
        storyText:SetWidth(410)
        storyText:SetHeight(450)
        storyText:SetPoint("TOPLEFT", 50, -50)
        storyText:SetJustifyH("LEFT")
        storyText:SetJustifyV("TOP")
        elements.storyText = storyText

        -- Награды
        local rewardsText = parent:CreateFontString("KQuestReward", "BACKGROUND", "GameFontNormal")
        rewardsText:SetWidth(400)
        rewardsText:SetHeight(12)
        rewardsText:SetPoint("BOTTOMLEFT", 20, 155)
        rewardsText:SetJustifyH("LEFT")
        rewardsText:SetJustifyV("TOP")
        elements.rewardsText = rewardsText

        -- Текст завершенного квеста
        local finishedText = parent:CreateFontString("KQuestFinishedText", "BACKGROUND", "GameFontNormal")
        finishedText:SetWidth(150)
        finishedText:SetHeight(12)
        finishedText:SetPoint("TOPRIGHT", -10, -50)
        finishedText:SetJustifyH("LEFT")
        finishedText:SetJustifyV("TOP")
        elements.finishedText = finishedText

        -- Счетчик страниц
        local pageCount = parent:CreateFontString("KQuestPageCount", "BACKGROUND", "GameFontNormal")
        pageCount:SetWidth(50)
        pageCount:SetHeight(20)
        pageCount:SetPoint("BOTTOM", 0, 18)
        pageCount:SetJustifyV("TOP")
        elements.pageCount = pageCount

        return elements
    end
}

-- ========================================================================
-- СОЗДАНИЕ ФРЕЙМА TOGGLE КНОПКИ
-- ========================================================================

local KQuestToggleFactory = {
    createToggleFrame = function()
        local frame = CreateFrame("Frame", "KQuestButtonFrame", AtlasFrame)
        frame:SetWidth(1)
        frame:SetHeight(1)
        frame:SetPoint("TOPRIGHT", AtlasFrame, "TOPRIGHT", 0, 0)
        frame:EnableMouse(true)
        frame:SetToplevel(true)
        frame:Show()

        return frame
    end,

    createToggleButton = function(parent)
        local button = CreateFrame("Button", "KQCloseButton_3", parent, "OptionsButtonTemplate")
        button:SetWidth(90)
        button:SetHeight(20)
        button:SetPoint("TOPRIGHT", -120, -61)

        -- Установка текста кнопки
        getglobal("KQCloseButton_3Text"):SetText(AQ_Quests)

        button:SetScript("OnClick", function()
            KQuestCLOSE_OnClick()
        end)

        button:SetScript("OnUpdate", function()
            if not AtlasFrame then
                this:Hide()
                return
            end
        end)

        button:SetScript("OnShow", function()
            if not AtlasFrame then
                this:Hide()
                return
            end
        end)

        return button
    end
}

-- ========================================================================
-- ИНИЦИАЛИЗАЦИЯ ВСЕХ ЭЛЕМЕНТОВ
-- ========================================================================

-- Создание основного фрейма
local KQuestInsideFrame = KQuestUIFactory.createMainFrame()

-- Создание всех фреймов квестов (передаем parentFrame явно)
local questFrames = {}
for i = 1, 6 do
    local position = QUEST_FRAME_POSITIONS[i]
    local frame, elements = KQuestUIFactory.createQuestFrame(i, position, KQuestInsideFrame)
    questFrames[i] = {frame = frame, elements = elements}
end

-- Создание кнопки закрытия
local closeButton = KQuestUIFactory.createCloseButton(KQuestInsideFrame)

-- Создание чекбокса завершенных квестов
local finishedQuestCheckbox = KQuestUIFactory.createFinishedQuestCheckbox(KQuestInsideFrame)

-- Создание навигационных кнопок
local navigationButtons = KQuestUIFactory.createNavigationButtons(KQuestInsideFrame)

-- Создание текстовых элементов
local textElements = KQuestUIFactory.createTextElements(KQuestInsideFrame)

-- Настройка обработчика событий
KQuestInsideFrame:SetScript("OnEvent", function()
    AQ_OnEvent(event)
end)

-- ========================================================================
-- СОЗДАНИЕ TOGGLE ФРЕЙМА И КНОПКИ
-- ========================================================================

-- Создание фрейма для кнопки переключения
local atlasQuestButtonFrame = KQuestToggleFactory.createToggleFrame()

-- Создание кнопки переключения
local questsToggleButton = KQuestToggleFactory.createToggleButton(atlasQuestButtonFrame)

-- ========================================================================
-- ЭКСПОРТ ИНТЕРФЕЙСА ДЛЯ ВНЕШНЕГО ИСПОЛЬЗОВАНИЯ
-- ========================================================================

-- Глобальные ссылки для совместимости со старым кодом
_G.KQuestInsideFrame = KQuestInsideFrame
_G.KQuestFrames = questFrames
_G.KQuestUIElements = {
    closeButton = closeButton,
    finishedQuestCheckbox = finishedQuestCheckbox,
    navigationButtons = navigationButtons,
    textElements = textElements,
    toggleButton = questsToggleButton
}

--[[
=============================================================================
ОСНОВНЫЕ ИСПРАВЛЕНИЯ В ЭТОЙ ВЕРСИИ:
=============================================================================

1. **Убран самовызов**: 
   - Функции CreateQuestFrameElements и SetupQuestFrameEvents вынесены 
     как локальные функции ДО объявления фабрики
   - createQuestFrame теперь вызывает локальные функции, а не методы фабрики

2. **Правильный порядок объявления**:
   - Сначала вспомогательные функции
   - Затем фабрика UI элементов
   - После этого инициализация

3. **Явная передача параметров**:
   - parentFrame теперь передается явно в createQuestFrame
   - Убрана зависимость от глобальной переменной KQuestInsideFrame внутри фабрики

4. **Безопасная инициализация**:
   - Все элементы создаются в правильном порядке
   - Добавлены глобальные ссылки для совместимости

5. **Совместимость с Lua 5.0**:
   - Код протестирован на отсутствие циклических зависимостей
   - Все функции доступны в момент их вызова

=============================================================================
]]