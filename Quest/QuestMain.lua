
-----------------------------------------------------------------------------
-- Atlas Quest Main Module - Refactored for QuestConfig Integration
-- Версия: 2.1 - Оптимизированная для WoW 1.12 с использованием QuestConfig
-- Совместимость: Lua 5.0
-- Автор: Vitali
-- Дата: 29.05.2025
-----------------------------------------------------------------------------

local _G = getfenv()

--[[
=============================================================================
МОДУЛЬНАЯ СИСТЕМА ГЛАВНОГО МОДУЛЯ ATLAS QUEST
=============================================================================

Основные улучшения:
1. Интеграция с QuestConfig.lua для централизованной конфигурации
2. Модульная структура утилит
3. Упрощенная обработка событий
4. Оптимизированная производительность
5. Улучшенная читаемость кода

=============================================================================
]]

-- ========================================================================
-- ИМПОРТ КОНФИГУРАЦИИ И ПРОВЕРКА ЗАВИСИМОСТЕЙ
-- ========================================================================

-- Проверяем доступность конфигурации
if not KQuestConfig then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest Error:|r KQuestConfig не найден! Убедитесь что QuestConfig.lua загружен первым.")
    return
end

-- Импортируем необходимые константы и утилиты
local Colors = KQuestConfig.Colors
local Constants = KQuestConfig.Constants
local UI = KQuestConfig.UI

-- ========================================================================
-- ЛОКАЛЬНЫЕ ПЕРЕМЕННЫЕ И КЕШИРОВАНИЕ
-- ========================================================================

local initialized -- Флаг инициализации переменных
local kQQuestColor
local playerName = UnitName("player")

-- Кеширование глобальных переменных для оптимизации
AtlasKTW = AtlasKTW or {}
AtlasKTW.Q = AtlasKTW.Q or {}
AtlasKTW.isHorde = AtlasKTW.isHorde or false
AtlasKTW.Instances = AtlasKTW.Instances or Constants.DEFAULT_INSTANCE

-- ========================================================================
-- УТИЛИТЫ ДЛЯ РАБОТЫ С КВЕСТАМИ
-- ========================================================================

local KQuestUtils = {
    -- Получение данных квеста с проверками
    getQuestData = function(instanceId, questId, faction, field)
        instanceId = instanceId or AtlasKTW.Instances
        questId = questId or AtlasKTW.Q.ShownQuest
        faction = faction or (AtlasKTW.isHorde and "Horde" or "Alliance")
        field = field or "Title"

        local instanceData = KQuestInstanceData and KQuestInstanceData[instanceId]
        if not instanceData or not instanceData.Quests or
           not instanceData.Quests[faction] or
           not instanceData.Quests[faction][questId] then
            return nil
        end

        return instanceData.Quests[faction][questId][field]
    end,

    -- Проверка существования квеста
    questExists = function(instanceId, questId, faction)
        return KQuestUtils.getQuestData(instanceId, questId, faction) ~= nil
    end,

    -- Очистка всех UI элементов
    clearAllFrames = function()
        local elementsToHide = {
            "KQuestPageCount", "KQNextPageButton_Right", "KQNextPageButton_Left",
            "KQuestName", "KQuestLevel", "KQuestDetails", "KQuestAttainLevel",
            "KQuestReward", "KQuestStory", "KQuestFinishedText", "KQuestFinished"
        }

        for _, elementName in ipairs(elementsToHide) do
            local element = _G[elementName]
            if element then
                if element.SetText then
                    element:SetText()
                else
                    HideUIPanel(element)
                end
            end
        end

        -- Очистка фреймов предметов
        for i = 1, Constants.QUEST_LIST_MAX_VISIBLE do
            local frameName = "KQuestItemframe" .. i
            _G[frameName .. "_Icon"]:SetTexture()
            _G[frameName .. "_Name"]:SetText()
            _G[frameName .. "_Extra"]:SetText()
            _G[frameName]:Disable()
        end
    end,

    -- Получение данных награды квеста
    getRewardItemData = function(questData, itemIndex, field)
        if questData and questData.Rewards and
           questData.Rewards[itemIndex] and
           questData.Rewards[itemIndex][field] then
            return questData.Rewards[itemIndex][field]
        end
        return nil
    end,

    -- Форматирование текста квеста с цветами
    formatQuestText = function(title, level, attain, details, rewards)
        local text = Colors.blue .. title .. "\n\n"
        if level then
            text = text .. Colors.blue .. AQDiscription_LEVEL .. Colors.white .. level .. "\n"
        end
        if attain then
            text = text .. Colors.blue .. AQDiscription_ATTAIN .. Colors.white .. attain .. "\n\n"
        end
        if details then
            text = text .. details .. "\n\n"
        end
        if rewards then
            text = text .. Colors.blue .. AQDiscription_REWARD .. Colors.white .. rewards
        end
        return text
    end
}

-- ========================================================================
-- ОСНОВНЫЕ ФУНКЦИИ ИНТЕРФЕЙСА
-- ========================================================================

-- Очистка всех элементов (замена старой функции)
function KQClearALL()
    KQuestUtils.clearAllFrames()
end

-- Обработка кнопки закрытия панели
function KQuestCLOSE_OnClick()
    if KQuestFrame and KQuestFrame:IsVisible() then
        HideUIPanel(KQuestFrame)
        HideUIPanel(KQuestInsideFrame)
    else
        ShowUIPanel(KQuestFrame)
    end
    AtlasKTW.QUpdateNOW = true
end

-- Обработка внутренней кнопки закрытия
function KQuestCLOSE2_OnClick()
    HideUIPanel(KQuestInsideFrame)
    KQuestWhichButton = 0
end

-- Скрытие фрейма AtlasLoot если доступен
function KQuestHideAL()
    if AtlasLootItemsFrame ~= nil then
        AtlasLootItemsFrame:Hide()
    end
end

-- ========================================================================
-- ОБРАБОТКА ДАННЫХ КВЕСТОВ
-- ========================================================================

-- Функция получения данных квеста (обновленная)
local function kQGetQuestData(instanceId, questId, faction, field)
    return KQuestUtils.getQuestData(instanceId, questId, faction, field)
end

-- Функция проверки существования квеста (обновленная)
local function kQQuestExists(instanceId, questId, faction)
    return KQuestUtils.questExists(instanceId, questId, faction)
end

-- Сравнение квеста с журналом квестов игрока
local function kQCompareQuestLogtoQuest(questId)
    if not AtlasKTW or not AtlasKTW.Q or not AtlasKTW.Q.CheckQuestlog then
        return false
    end

    local targetQuest = questId or AtlasKTW.Q.ShownQuest
    if not targetQuest or not AtlasKTW.Instances then
        return false
    end

    local instanceData = KQuestInstanceData and KQuestInstanceData[AtlasKTW.Instances]
    if not instanceData or not instanceData.Quests then
        return false
    end

    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
    local questData = instanceData.Quests[faction] and instanceData.Quests[faction][targetQuest]

    if not questData or not questData.Title then
        return false
    end

    -- Безопасное извлечение имени квеста
    local questTitle = questData.Title
    local questName = questTitle

    if questTitle and strlen(questTitle) > 0 then
        local _, _, extractedName = strfind(questTitle, "^(%d+)%.%s*(.+)")
        if extractedName then
            questName = extractedName
        end
    end

    -- Безопасная очистка имени квеста
    local startPos = strfind(questName, " %(")
    if startPos then
        questName = strsub(questName, 1, startPos - 1)
    end

    -- Использовать gsub напрямую для WoW 1.12
    questName = gsub(questName, "[%p%c]", "")

    -- Проверка журнала квестов
    local totalQuestEntries = GetNumQuestLogEntries()
    for questIndex = 1, totalQuestEntries do
        local logQuestTitle = GetQuestLogTitle(questIndex)

        if logQuestTitle then
            local processedTitle = logQuestTitle
            local pos = strfind(processedTitle, " %(")
            if pos then
                processedTitle = strsub(processedTitle, 1, pos - 1)
            end
            processedTitle = gsub(processedTitle, "[%p%c]", "")

            if strlower(processedTitle) == strlower(questName) then
                return true
            end
        end
    end

    return false
end

-- ========================================================================
-- ОБРАБОТКА UI И ОТОБРАЖЕНИЯ
-- ========================================================================

-- Установка состояния чекбокса выполненного квеста
local function kQuestFinishedSetChecked()
    local questKey = "KQFinishedQuest_Inst"..AtlasKTW.Instances.."Quest"..AtlasKTW.Q.ShownQuest
    if AtlasKTW.isHorde then
        questKey = questKey.."_HORDE"
    end
    KQuestFinished:SetChecked(AtlasKTW.Q[questKey] == 1)
end

-- Обработка многостраничных квестов
local function kQuestExtendedPages()
    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
    local questId = AtlasKTW.Q.ShownQuest
    local instanceId = AtlasKTW.Instances

    local questData = KQuestInstanceData and
        KQuestInstanceData[instanceId] and
        KQuestInstanceData[instanceId].Quests and
        KQuestInstanceData[instanceId].Quests[faction] and
        KQuestInstanceData[instanceId].Quests[faction][questId]

    if questData and questData.Page and type(questData.Page) == "table" then
        local pageCount = questData.Page[1]

        if pageCount and pageCount > 1 then
            ShowUIPanel(KQNextPageButton_Right)
            AQ_NextPageCount = "Quest"
            AtlasKTW.Q.CurrentPage = 1
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage .. "/" .. pageCount)
            return
        end
    end
end

-- Получение информации о предметах квеста
local function kQuestGetItemInf(count, what)
    local questId = AtlasKTW.Q.ShownQuest
    local instanceId = AtlasKTW.Instances
    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"

    if not count or count < 1 then
        return nil
    end

    local questData = KQuestInstanceData and
                      KQuestInstanceData[instanceId] and
                      KQuestInstanceData[instanceId].Quests and
                      KQuestInstanceData[instanceId].Quests[faction] and
                      KQuestInstanceData[instanceId].Quests[faction][questId]

    if not questData or not questData.Rewards then
        return nil
    end

    local rewardItem = questData.Rewards[count]
    if not rewardItem then
        return nil
    end

    local itemId = rewardItem.ID
    local itemDescription = rewardItem.Description
    local itemColor = rewardItem.Color or Colors.white
    local itemName = rewardItem.Name

    local itemTEXTSAVED = itemColor .. itemName

    if itemId and GetItemInfo(itemId) then
        local gameItemName, _, itemQuality = GetItemInfo(itemId)
        local _, _, _, hex = GetItemQualityColor(itemQuality)
        local itemtext = hex .. gameItemName

        if what == "name" then
            return itemtext
        elseif what == "extra" then
            return itemDescription or ""
        end
    else
        local itemtext = itemTEXTSAVED
        if what == "name" then
            return itemtext
        elseif what == "extra" then
            local description = itemDescription or ""
            if itemId then
                description = description .. " " .. Colors.red .. (AQERRORNOTSHOWN or "Item not found")
            end
            return description
        end
    end

    return nil
end

-- ========================================================================
-- ОСНОВНЫЕ ФУНКЦИИ ОТОБРАЖЕНИЯ КВЕСТОВ
-- ========================================================================

-- Установка текста квеста
function KQButton_SetText()
    local instanceId = AtlasKTW.Instances
    local questId = AtlasKTW.Q.ShownQuest
    local isHorde = AtlasKTW.isHorde

    KQClearALL()
    ShowUIPanel(KQuestFinished)
    KQuestFinishedText:SetText(Colors.blue .. AQQuestFinished)

    local instanceData = KQuestInstanceData[instanceId]
    if not instanceData or not instanceData.Quests then
        return
    end

    local faction = isHorde and "Horde" or "Alliance"
    local questData = instanceData.Quests[faction] and instanceData.Quests[faction][questId]

    if questData then
        kQCompareQuestLogtoQuest(questId)

        KQuestName:SetText(kQQuestColor..questData.Title)
        KQuestLevel:SetText(Colors.blue..AQDiscription_LEVEL..Colors.white..questData.Level)
        KQuestAttainLevel:SetText(Colors.blue..AQDiscription_ATTAIN..Colors.white..questData.Attain)

        KQuestDetails:SetText(
            Colors.blue..AQDiscription_PREQUEST..Colors.white..(questData.Prequest or "").."\n \n"..
            Colors.blue..AQDiscription_FOLGEQUEST..Colors.white..(questData.Folgequest or "").."\n \n"..
            Colors.blue..AQDiscription_START..Colors.white..(questData.Location or "").."\n \n"..
            Colors.blue..AQDiscription_AIM..Colors.white..(questData.Aim or "").."\n \n"..
            Colors.blue..AQDiscription_NOTE..Colors.white..(questData.Note or "")
        )

        local rewards = questData.Rewards and questData.Rewards["Text"] or AQNoReward
        KQuestReward:SetText(rewards)

        -- Обработка предметов награды
        for itemIndex = 1, Constants.QUEST_LIST_MAX_VISIBLE do
            if questData.Rewards[itemIndex] then
                local itemId = KQuestUtils.getRewardItemData(questData, itemIndex, "ID") or ""

                if AtlasKTW.Q.AutoQuery then
                    local itemColor = KQuestUtils.getRewardItemData(questData, itemIndex, "Color") or ""
                    local itemName = KQuestUtils.getRewardItemData(questData, itemIndex, "Name") or ""

                    if not GetItemInfo(itemId) then
                        GameTooltip:SetHyperlink("item:"..itemId..":0:0:0")
                        if not AtlasKTW.Q.QuerySpam then
                            DEFAULT_CHAT_FRAME:AddMessage(AQSERVERASK.."["..itemColor..itemName..Colors.white.."]"..AQSERVERASKAuto)
                        end
                    end
                end

                local _, _, _, _, _, _, _, _, itemTexture = GetItemInfo(itemId)
                _G["KQuestItemframe"..itemIndex.."_Icon"]:SetTexture(itemTexture)
                _G["KQuestItemframe"..itemIndex.."_Name"]:SetText(kQuestGetItemInf(itemIndex, "name"))
                _G["KQuestItemframe"..itemIndex.."_Extra"]:SetText(kQuestGetItemInf(itemIndex, "extra"))
                _G["KQuestItemframe"..itemIndex]:Enable()
            else
                _G["KQuestItemframe"..itemIndex.."_Icon"]:SetTexture()
                _G["KQuestItemframe"..itemIndex.."_Name"]:SetText()
                _G["KQuestItemframe"..itemIndex.."_Extra"]:SetText()
                _G["KQuestItemframe"..itemIndex]:Disable()
            end
        end
    end

    kQuestFinishedSetChecked()
    kQuestExtendedPages()
end

-- Установка текста истории
function KQuestButtonStory_SetText()
    KQClearALL()

    local instanceData = KQuestInstanceData[AtlasKTW.Instances]
    local story = instanceData and instanceData.Story
    local caption = instanceData and instanceData.Caption

    if story then
        if type(story) == "table" then
            KQuestName:SetText(Colors.blue .. caption[1])
            KQuestStory:SetText(Colors.white .. story["Page1"])

            if story["Page2"] then
                ShowUIPanel(KQNextPageButton_Right)
                AtlasKTW.Q.CurrentPage = 1

                local maxPages = story["MaxPages"] or 0
                for i = 1, 20 do
                    if not story["Page" .. i] then
                        maxPages = i - 1
                        break
                    end
                end

                KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage .. "/" .. maxPages)
                AQ_NextPageCount = "Story"
            end
        elseif type(story) == "string" then
            KQuestName:SetText(Colors.blue .. caption)
            KQuestStory:SetText(Colors.white .. story)
        end
    else
        KQuestName:SetText(AQNotAvailable)
        KQuestStory:SetText(AQNotAvailable)
    end
end

-- ========================================================================
-- НАВИГАЦИЯ ПО СТРАНИЦАМ
-- ========================================================================

-- Следующая страница
function KQNextPageR_OnClick()
    local SideAfterThis = AtlasKTW.Q.CurrentPage + 2
    AtlasKTW.Q.CurrentPage = AtlasKTW.Q.CurrentPage + 1
    KQClearALL()

    if AQ_NextPageCount == "Story" then
        local story = KQuestInstanceData[AtlasKTW.Instances].Story
        local caption = KQuestInstanceData[AtlasKTW.Instances].Caption

        if type(story) == "table" then
            KQuestStory:SetText(Colors.white..story["Page"..AtlasKTW.Q.CurrentPage])
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..story["MaxPages"])

            local pageCaption = KQuestInstanceData[AtlasKTW.Instances].Caption[AtlasKTW.Q.CurrentPage]
            KQuestName:SetText(Colors.blue..(pageCaption or caption))

            if not story["Page"..SideAfterThis] then
                HideUIPanel(KQNextPageButton_Right)
            else
                ShowUIPanel(KQNextPageButton_Right)
            end
        end
    end

    if AQ_NextPageCount == "Quest" then
        local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
        local questData = KQuestInstanceData[AtlasKTW.Instances].Quests[faction][AtlasKTW.Q.ShownQuest]

        if questData and questData.Page then
            local pageContent = questData.Page[AtlasKTW.Q.CurrentPage]
            local pageCount = questData.Page[1] or 1

            if pageContent then
                KQuestStory:SetText(Colors.white..pageContent)
                KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..pageCount)

                if AtlasKTW.Q.CurrentPage >= pageCount then
                    HideUIPanel(KQNextPageButton_Right)
                else
                    ShowUIPanel(KQNextPageButton_Right)
                end
            end
        end
    end

    ShowUIPanel(KQNextPageButton_Left)
end

-- Предыдущая страница
function KQNextPageL_OnClick()
    AtlasKTW.Q.CurrentPage = AtlasKTW.Q.CurrentPage - 1

    if AQ_NextPageCount == "Story" then
        local story = KQuestInstanceData[AtlasKTW.Instances].Story
        local caption = KQuestInstanceData[AtlasKTW.Instances].Caption

        if type(story) == "table" then
            KQuestStory:SetText(Colors.white..story["Page"..AtlasKTW.Q.CurrentPage])
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..story["MaxPages"])

            local pageCaption = KQuestInstanceData[AtlasKTW.Instances].Caption[AtlasKTW.Q.CurrentPage]
            KQuestName:SetText(Colors.blue..(pageCaption or caption))

            if AtlasKTW.Q.CurrentPage == 1 then
                HideUIPanel(KQNextPageButton_Left)
            end
        end
    end

    if AQ_NextPageCount == "Quest" then
        local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
        local questData = KQuestInstanceData[AtlasKTW.Instances].Quests[faction][AtlasKTW.Q.ShownQuest]

        if AtlasKTW.Q.CurrentPage == 1 then
            KQButton_SetText()
        else
            if questData and questData.Page then
                local pageContent = questData.Page[AtlasKTW.Q.CurrentPage]
                local pageCount = questData.Page[1] or 1
                if pageContent then
                    KQuestStory:SetText(Colors.white..pageContent)
                    KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..pageCount)
                end
            end
        end
    end

    ShowUIPanel(KQNextPageButton_Right)
end

-- ========================================================================
-- ОБРАБОТКА СОБЫТИЙ И ЧЕКБОКСОВ
-- ========================================================================

-- Обработка чекбокса выполненного квеста
function KQFinishedQuest_OnClick()
    local questKey = "KQFinishedQuest_Inst"..AtlasKTW.Instances.."Quest"..AtlasKTW.Q.ShownQuest
    if AtlasKTW.isHorde then
        questKey = questKey.."_HORDE"
    end

    AtlasKTW.Q[questKey] = KQuestFinished:GetChecked() and 1 or nil
    KQuest_Options[UnitName("player")][questKey] = AtlasKTW.Q[questKey]

    KQuestSetTextandButtons()
    KQButton_SetText()
end

-- ========================================================================
-- ИНИЦИАЛИЗАЦИЯ И СОБЫТИЯ
-- ========================================================================

-- Инициализация модуля
local function kQuest_Initialize()
    if initialized or (not VariablesLoaded) then
        return
    end

    if type(AtlasTWOptions) == "table" then
        KQuest_LoadData()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Atlas-TW Quest:|r|cff00ffffVariables not loaded!|r")
    end

    if AtlasKTW.Q.CompareTooltip then
        KQuestRegisterTooltip()
    else
        KQuestUnRegisterTooltip()
    end

    initialized = 1
end

-- Обработчик событий
function KQuest_OnEvent()
    if event == "VARIABLES_LOADED" then
        VariablesLoaded = 1
    else
        kQuest_Initialize()
    end
end

-- ========================================================================
-- ЗАГРУЗКА И СОХРАНЕНИЕ ДАННЫХ
-- ========================================================================

-- Загрузка сохраненных переменных
function KQuest_LoadData()
    AtlasKTW.Q.ShownSide = AtlasTWOptions["QuestShownSide"]
    AtlasKTW.Q.WithAtlas = AtlasTWOptions["QuestWithAtlas"]
    AtlasKTW.Q.ColourCheck = AtlasTWOptions["QuestColourCheck"]

    KQuest_Options = KQuest_Options or {}
    KQuest_Options[playerName] = KQuest_Options[playerName] or {}

    for i = 1, Constants.MAX_INSTANCES do
        for b = 1, Constants.MAX_QUESTS_PER_INSTANCE do
            AtlasKTW.Q["KQFinishedQuest_Inst"..i.."Quest"..b] = KQuest_Options[playerName]["KQFinishedQuest_Inst"..i.."Quest"..b]
            AtlasKTW.Q["KQFinishedQuest_Inst"..i.."Quest"..b.."_HORDE"] = KQuest_Options[playerName]["KQFinishedQuest_Inst"..i.."Quest"..b.."_HORDE"]
        end
    end

    AtlasKTW.Q.CheckQuestlog = AtlasTWOptions["QuestCheckQuestlog"]
    AtlasKTW.Q.AutoQuery = AtlasTWOptions["QuestAutoQuery"]
    AtlasKTW.Q.QuerySpam = AtlasTWOptions["QuestQuerySpam"]
    AtlasKTW.Q.CompareTooltip = AtlasTWOptions["QuestCompareTooltip"]
end

-- Сохранение переменных
function KQuest_SaveData()
    AtlasTWOptions["QuestShownSide"] = AtlasKTW.Q.ShownSide
    AtlasTWOptions["QuestWithAtlas"] = AtlasKTW.Q.WithAtlas
    AtlasTWOptions["QuestColourCheck"] = AtlasKTW.Q.ColourCheck
    AtlasTWOptions["QuestCheckQuestlog"] = AtlasKTW.Q.CheckQuestlog
    AtlasTWOptions["QuestAutoQuery"] = AtlasKTW.Q.AutoQuery
    AtlasTWOptions["QuestQuerySpam"] = AtlasKTW.Q.QuerySpam
    AtlasTWOptions["QuestCompareTooltip"] = AtlasKTW.Q.CompareTooltip
end

-- ========================================================================
-- ОТЛАДКА И ТЕСТИРОВАНИЕ
-- ========================================================================

-- Тестовые сообщения для отладки
local function kQTestmessages()
    DEFAULT_CHAT_FRAME:AddMessage("K Quest: Test messages")
end

-- ========================================================================
-- ЭКСПОРТ УТИЛИТ ДЛЯ СОВМЕСТИМОСТИ
-- ========================================================================

-- Экспортируем утилиты в глобальное пространство для обратной совместимости
function kQGetQuestData(instanceId, questId, faction, field)
    return KQuestUtils.getQuestData(instanceId, questId, faction, field)
end

function kQQuestExists(instanceId, questId, faction)
    return KQuestUtils.questExists(instanceId, questId, faction)
end

--[[
=============================================================================
ЗАМЕТКИ ПО ПЕРЕРАБОТКЕ:

1. Интегрирован с QuestConfig.lua для централизованного управления
2. Разделен на логические модули для лучшей организации
3. Добавлены утилиты KQuestUtils для переиспользования кода
4. Улучшена производительность за счет кеширования
5. Повышена читаемость кода и упрощена поддержка
6. Сохранена полная обратная совместимость
7. Добавлены комментарии для лучшего понимания

Все функции остаются совместимыми с существующим кодом и WoW 1.12.
=============================================================================
]]