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

local questconfig = _G.KQuestConfig

if not questconfig then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest UI Error:|r Quest Config не найден! Убедитесь что QuestConfig.lua загружен первым.")
    return
end

-- Импортируем конфигурацию
local colors = questconfig.Colors
local ui = questconfig.UI
local constants = questconfig.Constants
local variables = questconfig.Variables
local currentInstance = questconfig.Variables.CURRENT_INSTANCE
local colorUtils = questconfig.ColorUtils
local uiUtils = questconfig.UIUtils

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
        maxCount = constants.MAX_QUESTS_PER_INSTANCE
    }
}

-- ========================================================================
-- ОБРАБОТЧИКИ СОБЫТИЙ
-- ========================================================================

-- Обработчик очистки
local function KQClearALL()
    if questconfig and uiUtils then
        -- Очистка элементов
        local elementsToHide = {
            "KQuestPageCount", "KQNextPageButton_Right", "KQNextPageButton_Left",
            "KQuestName", "KQuestLevel", "KQuestDetails", "KQuestAttainLevel",
            "KQuestReward", "KQuestStory", "KQuestFinishedText", "KQuestFinished"
        }

        for _, elementName in ipairs(elementsToHide) do
            uiUtils.updateTextElement(elementName, "")
        end

        -- Очистка фреймов предметов
        for i = 1, 6 do
            local frameName = "KQuestItemframe" .. i
            uiUtils.updateTextElement(frameName .. "_Name", "")
            uiUtils.updateTextElement(frameName .. "_Extra", "")

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


-- Автоматическое определение фракции при показе
function KQ_OnShow()
    local isHorde = UnitFactionGroup("player") == "Horde"
    AtlasKTW.isHorde = isHorde
    -- Обновляем чекбоксы
    uiUtils.UpdateCheckbox("KQuestHordeCheckBox", isHorde)
    uiUtils.UpdateCheckbox("KQuestAllianceCheckBox", not isHorde)

    KQuestSetTextandButtons()
end

-- Обработчик закрытия основного фрейма
function KQCLOSE1_OnClick()
    HideUIPanel(KQuestFrame)
end

-- Обработчик кнопки опций
function KQOPTION1_OnClick()
    local optionFrame = uiUtils.getUIElement("KQuestOptionFrame")
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
    local insideFrame = uiUtils.getUIElement("KQuestInsideFrame")
    if insideFrame then
        if not insideFrame:IsVisible() then
            ShowUIPanel(insideFrame)
            KQuestWhichButton = -1
            KQuestButtonStory_SetText()
        elseif KQuestWhichButton == -1 then
            HideUIPanel(insideFrame)
        else
            KQuestWhichButton = -1
            KQuestButtonStory_SetText()
        end
    end
end

-- Обработчик чекбокса Альянса
function Alliance_OnClick()
    AtlasKTW.isHorde = false
    uiUtils.UpdateCheckbox("KQuestAllianceCheckBox", true)
    uiUtils.UpdateCheckbox("KQuestHordeCheckBox", false)

    KQuest_SaveData()
    variables.NEED_UPDATE = true
end

-- Обработчик чекбокса Орды
function Horde_OnClick()
    AtlasKTW.isHorde = true
    uiUtils.UpdateCheckbox("KQuestAllianceCheckBox", false)
    uiUtils.UpdateCheckbox("KQuestHordeCheckBox", true)

    KQuest_SaveData()
    variables.NEED_UPDATE = true
end

-- Обработчик общей кнопки
function KQuestGeneral_OnClick()
    KQClearALL()
    KQuestHideAL()

    local insideFrame = uiUtils.getUIElement("KQuestInsideFrame")
    if insideFrame then
        if insideFrame:IsVisible() then
            HideUIPanel(insideFrame)
        else
            ShowUIPanel(insideFrame)
        end
    end

    local instGeneral = _G["Inst"..currentInstance.."General"]
    if instGeneral then
        uiUtils.updateTextElement("KQuestName",
            colorUtils.colorText(instGeneral[1][1], colors.blue))

        local storyText = colorUtils.colorText(instGeneral[1][2], colors.white) ..
                         "\n \n" .. instGeneral[1][3]
        uiUtils.updateTextElement("KQuestStory", storyText)

        -- Показываем кнопку следующей страницы если доступна
        AQ_NextPageCount = "Boss"
        if instGeneral[2] then
            local rightButton = uiUtils.getUIElement("KQNextPageButton_Right")
            if rightButton then ShowUIPanel(rightButton) end

            AtlasKTW.Q.CurrentPage = 1
            uiUtils.updateTextElement("KQuestPageCount",
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
       KQuestInstanceData[currentInstance] and
       KQuestInstanceData[currentInstance].Quests and
       KQuestInstanceData[currentInstance].Quests[faction] and
       KQuestInstanceData[currentInstance].Quests[faction][questID] then
        questName = KQuestInstanceData[currentInstance].Quests[faction][questID].Title
    end

    if questName then
        -- Удаляем префикс уровня если присутствует
        local levelPattern = "^%d+%. "
        questName = string.gsub(questName, levelPattern, "")
        ChatFrameEditBox:Insert("["..questName.."]")
    end
end

-- Обработчик кликов по кнопкам квестов
function Quest_OnClick()
    if ChatFrameEditBox:IsVisible() and IsShiftKeyDown() then
        kQInsertQuestInformation()
    else
        KQuestHideAL()
        uiUtils.updateTextElement("KQuestStory", "")

        local insideFrame = uiUtils.getUIElement("KQuestInsideFrame")
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

local kQuestUIFactory = {
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
        local button = CreateFrame("Button", "KQuestbutton" .. index, parent)

        button:SetWidth(config.width)
        button:SetHeight(config.height)

        if index ~= 1 then
            button:SetPoint(config.point, prevButton, config.point, 0, config.spacing)
        else
            button:SetPoint(config.point, parent, config.point, config.x, config.startY)
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
        local text = parent:CreateFontString("KQuestButtonText" .. index, "OVERLAY", "GameFontNormalSmall")

        text:SetWidth(config.width)
        text:SetHeight(config.height)
        text:SetJustifyH("LEFT")

        if index ~= 1 then
            text:SetPoint("TOPLEFT", prevText, "TOPLEFT", 0, config.spacing)
        else
            text:SetPoint("TOPLEFT", parent, "TOPLEFT", config.x + 15, config.startY)
        end

        text:SetText(index)
        return text
    end,

    createMainFrame = function()
        local config = FRAME_CONFIG.Main
        local frame = CreateFrame("Frame", config.name, UIParent)
 
        frame:SetWidth(config.width)
        frame:SetHeight(config.height)
        frame:SetFrameStrata(config.strata)
        frame:EnableMouse(true)
        frame:SetMovable(false)
        frame:SetPoint("TOP", "AtlasFrame", -556, -30)
        -- Устанавливаем фон
        if config.backdrop then
            frame:SetBackdrop(config.backdrop)
            frame:SetBackdropColor(0, 0, 0, 0.8)
            frame:SetBackdropBorderColor(1, 1, 1, 1)
        end
 
        -- События
        frame:SetScript("OnEvent", function() KQuest_OnEvent() end)
        frame:SetScript("OnShow", function() KQ_OnShow() end)
        frame:SetScript("OnUpdate", function() KQ_OnUpdate() end)
        frame:Hide()

        return frame
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

    -- Используем конфигурацию позиций из kQuestConfig
    local positions = ui.Positions
    local position = positions[side] or positions.Right

    if position and AtlasFrame then
        KQuestFrame:ClearAllPoints()
       -- KQuestFrame:SetPoint(position.point,_G[position.relativeTo] or AtlasFrame,position.relativePoint,position.x,position.y)
       KQuestFrame:SetPoint(position.point,AtlasFrame,position.relativePoint,position.x,position.y)
    else
        -- Позиция по умолчанию если нет AtlasFrame
        KQuestFrame:SetPoint("CENTER", UIParent, "CENTER", -300, 0)
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
    local frame = kQuestUIFactory.createMainFrame()
    -- Устанавливаем позицию
    KQuestFrame_SetInitialPosition()

    -- Создаем кнопки
    for buttonType, config in pairs(FRAME_CONFIG.Buttons) do
        kQuestUIFactory.createButton(frame, config)
    end

    -- Создаем чекбоксы фракций
    for faction, config in pairs(FRAME_CONFIG.FactionCheckboxes) do
        local checkbox = kQuestUIFactory.createCheckbox(frame, config)
        if faction == "Alliance" then
            checkbox:SetChecked(true)
        end
    end

    -- Создаем текстуры фракций
    for faction, config in pairs(FRAME_CONFIG.FactionTextures) do
        kQuestUIFactory.createFactionTexture(frame, config)
    end

    -- ДОБАВЛЯЕМ ОБЩУЮ КНОПКУ
    local generalButton = CreateFrame("Button", "KQuestGeneralButton", frame)
    generalButton:SetWidth(165)
    generalButton:SetHeight(20)
    generalButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -30)
    generalButton:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    generalButton:SetText("G")
    generalButton:SetScript("OnClick", function()
        KQuestGeneral_OnClick()
    end)
    generalButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- ДОБАВЛЯЕМ СЧЕТЧИК КВЕСТОВ
    local qcount = frame:CreateFontString("KQuestCount", "ARTWORK", "GameFontNormal")
    qcount:SetWidth(60)
    qcount:SetHeight(40)
    qcount:SetPoint("TOP", frame, "TOP", 0, -25)

    -- Создаем кнопки квестов
    local qConfig = FRAME_CONFIG.QuestButton
    qConfig.maxCount = constants.MAX_QUESTS_PER_INSTANCE

    local prevButton = nil
    local prevArrow = nil
    local prevText = nil

    for i = 1, qConfig.maxCount do
        -- Создаем кнопку
        local button = kQuestUIFactory.createQuestButton(i, frame, prevButton)
        prevButton = button

        -- Создаем стрелку
        local arrow = kQuestUIFactory.createArrow(i, frame, prevArrow)
        prevArrow = arrow

        -- Создаем текст
        local text = kQuestUIFactory.createButtonText(i, frame, prevText)
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
-- ИНИЦИАЛИЗАЦИЯ
-- ========================================================================

-- Автоматическая инициализация UI при загрузке
function InitializeKQuestUI()
    if not AtlasFrame then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest:|r AtlasFrame не найден!")
        return
    end
    if not KQuestFrame then
        KQuestFrame_CreateUI()
    end
end