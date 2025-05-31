
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

local questconfig = KQuestConfig

-- Проверяем доступность конфигурации
if not (questconfig and questconfig.isLoaded) then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Atlas Quest Error:|r Quest config не найден! Убедитесь что QuestConfig.lua загружен первым.")
    return
end

-- Импортируем необходимые константы и утилиты
local colors = questconfig.Colors
local constants = questconfig.Constants
local variables = questconfig.Variables

-- ========================================================================
-- ЛОКАЛЬНЫЕ ПЕРЕМЕННЫЕ И КЕШИРОВАНИЕ
-- ========================================================================

local initialized -- Флаг инициализации переменных
local kQQuestColor
local kQuestInstChanged = ""
local playerName = UnitName("player")

-- Кеширование глобальных переменных для оптимизации
AtlasKTW = AtlasKTW or {}
AtlasKTW.Q = AtlasKTW.Q or {}
AtlasKTW.isHorde = AtlasKTW.isHorde or false
local current_instance = variables.CURRENT_INSTANCE or constants.DEFAULT_INSTANCE

-- ========================================================================
-- УТИЛИТЫ ДЛЯ РАБОТЫ С КВЕСТАМИ
-- ========================================================================

KQuestUtils = {
    -- Получение данных квеста с проверками
    getQuestData = function(instanceId, questId, faction, field)
        instanceId = instanceId or current_instance
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
                    element:SetText("")
                else
                    HideUIPanel(element)
                end
            end
        end

        -- Очистка фреймов предметов
        for i = 1, constants.QUEST_LIST_MAX_VISIBLE do
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
        local text = colors.blue .. title .. "\n\n"
        if level then
            text = text .. colors.blue .. AQDiscription_LEVEL .. colors.white .. level .. "\n"
        end
        if attain then
            text = text .. colors.blue .. AQDiscription_ATTAIN .. colors.white .. attain .. "\n\n"
        end
        if details then
            text = text .. details .. "\n\n"
        end
        if rewards then
            text = text .. colors.blue .. AQDiscription_REWARD .. colors.white .. rewards
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
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Function:|r KQClearALL вызван!")
end

-- Обработка кнопки закрытия панели
function KQuestCLOSE_OnClick()

    if not KQuestFrame then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Error:|r KQuestFrame не существует!")
        return
    end

    if KQuestFrame and KQuestFrame:IsVisible() then
        HideUIPanel(KQuestFrame)
        if KQuestInsideFrame then
            HideUIPanel(KQuestInsideFrame)
        end
    else
        ShowUIPanel(KQuestFrame)
    end
    variables.NEED_UPDATE = true
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

-- Функция получения данных квеста
local function kQGetQuestData(instanceId, questId, faction, field)
    return KQuestUtils.getQuestData(instanceId, questId, faction, field)
end

-- Функция проверки существования квеста
local function kQQuestExists(instanceId, questId, faction)
    return KQuestUtils.questExists(instanceId, questId, faction)
end

-- Сравнение квеста с журналом квестов игрока
local function kQCompareQuestLogtoQuest(questId)
    if not AtlasKTW or not AtlasKTW.Q or not AtlasKTW.Q.CheckQuestlog then
        return false
    end

    local targetQuest = questId or AtlasKTW.Q.ShownQuest
    if not targetQuest or not current_instance then
        return false
    end

    local instanceData = KQuestInstanceData and KQuestInstanceData[current_instance]
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
        local _, _, extractedName = strfind(questTitle, "^%d+%.%s*(.+)")
        if extractedName then
            questName = extractedName
        end
    end

    -- Безопасная очистка имени квеста
    local startPos = strfind(questName, " %(")
    if startPos then
        questName = strsub(questName, 1, startPos - 1)
    end

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
    local questKey = "KQFinishedQuest_Inst"..current_instance.."Quest"..AtlasKTW.Q.ShownQuest
    if AtlasKTW.isHorde then
        questKey = questKey.."_HORDE"
    end
    KQuestFinished:SetChecked(AtlasKTW.Q[questKey] == 1)
end

-- Обработка многостраничных квестов
local function kQuestExtendedPages()
    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
    local questId = AtlasKTW.Q.ShownQuest

    local questData = KQuestInstanceData and
        KQuestInstanceData[current_instance] and
        KQuestInstanceData[current_instance].Quests and
        KQuestInstanceData[current_instance].Quests[faction] and
        KQuestInstanceData[current_instance].Quests[faction][questId]

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
    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"

    if not count or count < 1 then
        return nil
    end

    local questData = KQuestInstanceData and
                      KQuestInstanceData[current_instance] and
                      KQuestInstanceData[current_instance].Quests and
                      KQuestInstanceData[current_instance].Quests[faction] and
                      KQuestInstanceData[current_instance].Quests[faction][questId]

    if not questData or not questData.Rewards then
        return nil
    end

    local rewardItem = questData.Rewards[count]
    if not rewardItem then
        return nil
    end

    local itemId = rewardItem.ID
    local itemDescription = rewardItem.Description
    local itemColor = rewardItem.Color or colors.white
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
                description = description .. " " .. colors.red .. (AQERRORNOTSHOWN or "Item not found")
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
    local questId = AtlasKTW.Q.ShownQuest
    local isHorde = AtlasKTW.isHorde

    KQClearALL()
    ShowUIPanel(KQuestFinished)
    KQuestFinishedText:SetText(colors.blue .. AQQuestFinished)

    local instanceData = KQuestInstanceData[current_instance]
    if not instanceData or not instanceData.Quests then
        return
    end

    local faction = isHorde and "Horde" or "Alliance"
    local questData = instanceData.Quests[faction] and instanceData.Quests[faction][questId]

    if questData then
        kQCompareQuestLogtoQuest(questId)

        KQuestName:SetText(kQQuestColor..questData.Title)
        KQuestLevel:SetText(colors.blue..AQDiscription_LEVEL..colors.white..questData.Level)
        KQuestAttainLevel:SetText(colors.blue..AQDiscription_ATTAIN..colors.white..questData.Attain)

        KQuestDetails:SetText(
            colors.blue..AQDiscription_PREQUEST..colors.white..(questData.Prequest or "").."\n \n"..
            colors.blue..AQDiscription_FOLGEQUEST..colors.white..(questData.Folgequest or "").."\n \n"..
            colors.blue..AQDiscription_START..colors.white..(questData.Location or "").."\n \n"..
            colors.blue..AQDiscription_AIM..colors.white..(questData.Aim or "").."\n \n"..
            colors.blue..AQDiscription_NOTE..colors.white..(questData.Note or "")
        )

        local rewards = questData.Rewards and questData.Rewards["Text"] or AQNoReward
        KQuestReward:SetText(rewards)

        -- Обработка предметов награды
        for itemIndex = 1, constants.QUEST_LIST_MAX_VISIBLE do
            if questData.Rewards[itemIndex] then
                local itemId = KQuestUtils.getRewardItemData(questData, itemIndex, "ID") or ""

                if AtlasKTW.Q.AutoQuery then
                    local itemColor = KQuestUtils.getRewardItemData(questData, itemIndex, "Color") or ""
                    local itemName = KQuestUtils.getRewardItemData(questData, itemIndex, "Name") or ""

                    if not GetItemInfo(itemId) then
                        GameTooltip:SetHyperlink("item:"..itemId..":0:0:0")
                        if not AtlasKTW.Q.QuerySpam then
                            DEFAULT_CHAT_FRAME:AddMessage(AQSERVERASK.."["..itemColor..itemName..colors.white.."]"..AQSERVERASKAuto)
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

    local instanceData = KQuestInstanceData[current_instance]
    local story = instanceData and instanceData.Story
    local caption = instanceData and instanceData.Caption

    if story then
        if type(story) == "table" then
            KQuestName:SetText(colors.blue .. caption[1])
            KQuestStory:SetText(colors.white .. story["Page1"])

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
            KQuestName:SetText(colors.blue .. caption)
            KQuestStory:SetText(colors.white .. story)
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
        local story = KQuestInstanceData[current_instance].Story
        local caption = KQuestInstanceData[current_instance].Caption

        if type(story) == "table" then
            KQuestStory:SetText(colors.white..story["Page"..AtlasKTW.Q.CurrentPage])
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..story["MaxPages"])

            local pageCaption = KQuestInstanceData[current_instance].Caption[AtlasKTW.Q.CurrentPage]
            KQuestName:SetText(colors.blue..(pageCaption or caption))

            if not story["Page"..SideAfterThis] then
                HideUIPanel(KQNextPageButton_Right)
            else
                ShowUIPanel(KQNextPageButton_Right)
            end
        end
    end

    if AQ_NextPageCount == "Quest" then
        local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
        local questData = KQuestInstanceData[current_instance].Quests[faction][AtlasKTW.Q.ShownQuest]

        if questData and questData.Page then
            local pageContent = questData.Page[AtlasKTW.Q.CurrentPage]
            local pageCount = questData.Page[1] or 1

            if pageContent then
                KQuestStory:SetText(colors.white..pageContent)
                KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..pageCount)

                if AtlasKTW.Q.CurrentPage >= pageCount then
                    HideUIPanel(KQNextPageButton_Right)
                else
                    ShowUIPanel(KQNextPageButton_Right)
                end
            end
        end
    end

    -- Handle boss text pages
    if AQ_NextPageCount == "Boss" then
        local bossData = _G["Inst"..current_instance.."General"]

        if bossData and bossData[AtlasKTW.Q.CurrentPage] then
            KQuestName:SetText(colors.blue..bossData[AtlasKTW.Q.CurrentPage][1])
            KQuestStory:SetText(colors.white..bossData[AtlasKTW.Q.CurrentPage][2].."\n \n"..bossData[AtlasKTW.Q.CurrentPage][3])

            -- Show Next button if more pages available
            if bossData[SideAfterThis] then
                ShowUIPanel(KQNextPageButton_Right)
            else
                HideUIPanel(KQNextPageButton_Right)
            end

            -- Update page counter
            local totalPages = bossData
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..totalPages)
        end
    end

    ShowUIPanel(KQNextPageButton_Left)
end

-- Предыдущая страница
function KQNextPageL_OnClick()
    AtlasKTW.Q.CurrentPage = AtlasKTW.Q.CurrentPage - 1

    if AQ_NextPageCount == "Story" then
        local story = KQuestInstanceData[current_instance].Story
        local caption = KQuestInstanceData[current_instance].Caption

        if type(story) == "table" then
            KQuestStory:SetText(colors.white..story["Page"..AtlasKTW.Q.CurrentPage])
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..story["MaxPages"])

            local pageCaption = KQuestInstanceData[current_instance].Caption[AtlasKTW.Q.CurrentPage]
            KQuestName:SetText(colors.blue..(pageCaption or caption))

            if AtlasKTW.Q.CurrentPage == 1 then
                HideUIPanel(KQNextPageButton_Left)
            end
        end
    end

    if AQ_NextPageCount == "Quest" then
        local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
        local questData = KQuestInstanceData[current_instance].Quests[faction][AtlasKTW.Q.ShownQuest]

        if AtlasKTW.Q.CurrentPage == 1 then
            KQButton_SetText()
        else
            if questData and questData.Page then
                local pageContent = questData.Page[AtlasKTW.Q.CurrentPage]
                local pageCount = questData.Page[1] or 1
                if pageContent then
                    KQuestStory:SetText(colors.white..pageContent)
                    KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..pageCount)
                end
            end
        end
    end

    -- Handle boss text pages
    if AQ_NextPageCount == "Boss" then
        bossData = _G["Inst"..current_instance.."General"]
        if bossData and bossData[AtlasKTW.Q.CurrentPage] then
            KQuestName:SetText(colors.blue..bossData[AtlasKTW.Q.CurrentPage][1])
            KQuestStory:SetText(colors.white..bossData[AtlasKTW.Q.CurrentPage][2] .. "\n \n" .. bossData[AtlasKTW.Q.CurrentPage][3])

            -- Hide back button if we're on the first page
            if AtlasKTW.Q.CurrentPage == 1 then
                HideUIPanel(KQNextPageButton_Left)
            end

            -- Update page counter
            local totalPages = bossData
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..totalPages)
        end
    end

    ShowUIPanel(KQNextPageButton_Right)
end

-- ========================================================================
-- ОБРАБОТКА СОБЫТИЙ И ЧЕКБОКСОВ
-- ========================================================================

-- Обработка чекбокса выполненного квеста
function KQFinishedQuest_OnClick()
    local questKey = "KQFinishedQuest_Inst"..current_instance.."Quest"..AtlasKTW.Q.ShownQuest
    if AtlasKTW.isHorde then
        questKey = questKey.."_HORDE"
    end

    AtlasKTW.Q[questKey] = KQuestFinished:GetChecked() and 1 or nil
    KQuest_Options[UnitName("player")][questKey] = AtlasKTW.Q[questKey]

    KQuestSetTextandButtons()
    KQButton_SetText()
end

-- ========================================================================
-- ФУНКЦИИ ОБНОВЛЕНИЯ UI
-- ========================================================================

function KQuestSetTextandButtons()
    local isHorde = AtlasKTW.isHorde
	local faction = isHorde and "Horde" or "Alliance"
	local questName
	local playerLevel = UnitLevel("player")
	-- Hide inner frame if instance changed
	if kQuestInstChanged ~= current_instance then
		HideUIPanel(KQuestInsideFrame)
	end
	-- Enable/disable general button based on instance info availability
	KQGeneralButton[_G["Inst"..current_instance.."General"] and "Enable" or "Disable"](KQGeneralButton)
	-- Update current instance
	kQuestInstChanged = current_instance
	-- Set quest count text
	local questCountKey = isHorde and "QAH" or "QAA"
	local questCount = KQuestInstanceData and KQuestInstanceData[current_instance] and KQuestInstanceData[current_instance][questCountKey]
	KQuestCount:SetText(questCount or "")
	-- Process quests
	for b = 1, constants.MAX_QUESTS_PER_INSTANCE do
		-- Define keys for current faction
	    -- Check for quest existence
        if kQQuestExists(current_instance, b, faction) then
             -- Define keys for current faction (for both formats)
            local finishedKey = "KQFinishedQuest_Inst"..current_instance.."Quest"..b..(isHorde and "_HORDE" or "")
            -- Get quest data
            questName = kQGetQuestData(current_instance, b, faction, "Title")
            local followQuest = kQGetQuestData(current_instance, b, faction, "Folgequest")
            local preQuest = kQGetQuestData(current_instance, b, faction, "Prequest")
            local questLevel = tonumber(kQGetQuestData(current_instance, b, faction, "Level"))
            -- Set quest line arrows
            local arrowTexture
            if preQuest ~= "No" then
                arrowTexture = "Interface\\Glues\\Login\\UI-BackArrow"
            elseif followQuest ~= "No" then
                arrowTexture = "Interface\\GossipFrame\\PetitionGossipIcon"
            end
            -- Check for completed quests
            if AtlasKTW.Q[finishedKey] == 1 then
                arrowTexture = "Interface\\GossipFrame\\BinderGossipIcon"
            end
            -- Apply arrow texture
            local arrow = _G["KQuestlineArrow_"..b]
            if arrowTexture then
                arrow:SetTexture(arrowTexture)
                arrow:Show()
            else
                arrow:Hide()
            end
			-- Determine quest color based on level
            if questLevel then
                local levelDiff = questLevel - playerLevel
                -- Determine color based on level difference
                if levelDiff >= -2 and levelDiff <= 2 then
                    kQQuestColor = colors.yellow
                elseif levelDiff > 2 and levelDiff <= 4 then
                    kQQuestColor = colors.orange
                elseif levelDiff > 4 and questLevel ~= 100 then
                    kQQuestColor = colors.red
                elseif levelDiff < -7 then
                    kQQuestColor = colors.grey
                elseif levelDiff >= -7 and levelDiff < -2 then
                    kQQuestColor = colors.green
                end
                -- Apply color settings
                if not AtlasKTW.Q.ColourCheck then
                    kQQuestColor = colors.yellow
                end
                if questLevel == 100 or kQCompareQuestLogtoQuest(b) then
                    kQQuestColor = colors.blue
                end
                if AtlasKTW.Q[finishedKey] == 1 then
                    kQQuestColor = colors.white
                end
            end
			-- Activate button and set text
			_G["KQuestbutton"..b]:Enable()
			_G["KQuestButtonText"..b]:SetText(kQQuestColor..questName)
	    else
			-- Deactivate button if quest doesn't exist
			_G["KQuestbutton"..b]:Disable()
			_G["KQuestButtonText"..b]:SetText()
            -- Hide arrow
            _G["KQuestlineArrow_"..b]:Hide()
		end
	end
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
-----------------------------------------------------------------------------
-- Call OnLoad set Variables and hides the panel
-----------------------------------------------------------------------------
function KQuest_OnLoad()
	variables.CURRENT_MAP_TEXTURE = AtlasMap:GetTexture()
	variables.NEED_UPDATE = true
end

--******************************************
-- Events: OnUpdate
--******************************************
-----------------------------------------------------------------------------
-- hide panel if instance is 99 (nothing)
-----------------------------------------------------------------------------
function KQ_OnUpdate()
	local previousInstance = current_instance
	KQuest_Instances()
	-- Cache UI panels for better performance
	local questFrame = KQuestFrame
	local insideFrame = KQuestInsideFrame
	-- Check if we need to hide/update the quest panels
	if current_instance == 99 then
		-- Hide both panels if no quests available
		HideUIPanel(questFrame)
		HideUIPanel(insideFrame)
	elseif current_instance ~= previousInstance or variables.NEED_UPDATE then
		-- Update quest text and buttons if instance changed or update forced
		KQuestSetTextandButtons()
		variables.NEED_UPDATE = false
	end
end

-- Events: HookScript (function)
local function hookScript(frame, scriptType, handler)
    -- Store original script handler
    local originalScript = frame:GetScript(scriptType)
    -- Set new script that chains both handlers
    frame:SetScript(scriptType, function()
        -- Call original handler if it exists
        if originalScript then
            originalScript()
        end
        -- Call our new handler
        handler()
    end)
end

--******************************************
-- Events: Atlas_OnShow (Hook Atlas function)
--******************************************
-----------------------------------------------------------------------------
-- Shows the panel with atlas
-- function hooked now! thx dan for his help
-----------------------------------------------------------------------------
local original_Atlas_OnShow = Atlas_OnShow
function Atlas_OnShow()
    -- Handle quest frame visibility based on settings
    local function handleQuestFrameVisibility()
        if AtlasKTW.Q.WithAtlas then
            ShowUIPanel(KQuestFrame)
        else
            HideUIPanel(KQuestFrame)
        end
        HideUIPanel(KQuestInsideFrame)
    end
    -- Position quest frame if shown on right side
    local function positionQuestFrame()
        if AtlasKTW.Q.ShownSide == "Right" then
            KQuestFrame:ClearAllPoints()
            KQuestFrame:SetPoint("TOP", "AtlasFrame", 567, -36)
        end
    end
    -- Setup pfUI tooltip integration if enabled
    local function setupPfUITooltip()
        if not (AtlasKTW.Q.CompareTooltip and IsAddOnLoaded("pfUI") and not KAtlasTooltip.backdrop) then
            return
        end
        -- Create pfUI tooltip backdrop
        pfUI.api.CreateBackdrop(KAtlasTooltip)
        pfUI.api.CreateBackdropShadow(KAtlasTooltip)
        -- Setup equipment comparison if available
        if pfUI.eqcompare then
            hookScript(KAtlasTooltip, "OnShow", pfUI.eqcompare.GameTooltipShow)
            hookScript(KAtlasTooltip, "OnHide", function()
                ShoppingTooltip1:Hide()
                ShoppingTooltip2:Hide()
            end)
        end
    end

    -- Execute all setup functions
    handleQuestFrameVisibility()
    positionQuestFrame()
    setupPfUITooltip()

    -- Call original show handler
    original_Atlas_OnShow()
end

--******************************************
-- Events: OnEnter/OnLeave SHOW ITEM
--******************************************
-----------------------------------------------------------------------------
-- Hide Tooltip
-----------------------------------------------------------------------------
function KQuestItem_OnLeave()
    -- Hide all tooltips when mouse leaves item
    local tooltips = {GameTooltip, KAtlasTooltip}
    local shoppingTooltips = {ShoppingTooltip1, ShoppingTooltip2}
    -- Hide main tooltips if visible
    for _, tooltip in ipairs(tooltips) do
        if tooltip:IsVisible() then
            tooltip:Hide()
            -- Also hide shopping tooltips
            for _, shoppingTip in ipairs(shoppingTooltips) do
                if shoppingTip:IsVisible() then
                    shoppingTip:Hide()
                end
            end
        end
    end
end

-----------------------------------------------------------------------------
-- Show Tooltip and automatically query server if option is enabled
-----------------------------------------------------------------------------
function KQuestItem_OnEnter()
    -- Get the frame that triggered this event
    local frame = this
    if not frame or not frame:GetName() then
        return
    end

    -- Extract item index from frame name (e.g., "KQuestItemframe1" -> 1)
    local frameName = frame:GetName()

    -- For names like "KQuestItemframe1", "KQuestItemframe2" etc.
    local itemIndex = tonumber(strsub(frameName, -1))

    if not itemIndex then
        return
    end

    -- Get current quest data
    local questId = AtlasKTW.Q.ShownQuest
    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"

    -- Get quest data from new database structure
    local questData = KQuestInstanceData and
                      KQuestInstanceData[current_instance] and
                      KQuestInstanceData[current_instance].Quests and
                      KQuestInstanceData[current_instance].Quests[faction] and
                      KQuestInstanceData[current_instance].Quests[faction][questId]

    if not questData or not questData.Rewards then
        return
    end

    -- Get the specific reward item by index
    local rewardItem = questData.Rewards[itemIndex]
    if not rewardItem then
        return
    end

    -- Extract item data
    local itemId = rewardItem.ID
    local itemName = rewardItem.Name
    local itemColor = rewardItem.Color or colors.white
    local itemDescription = rewardItem.Description

    -- Set up tooltip
    KAtlasTooltip:SetOwner(frame, "ANCHOR_RIGHT")
    KAtlasTooltip:ClearLines()

    -- Try to get item info from game cache first
    if itemId and GetItemInfo(itemId) then
        -- Use game's tooltip if item is in cache
        KAtlasTooltip:SetHyperlink("item:" .. itemId)
    else
        -- Fallback to manual tooltip creation
        -- Set item name with color
        local displayName = itemColor .. (itemName or "Unknown Item")
        KAtlasTooltip:AddLine(displayName, 1, 1, 1)

        -- Add description if available
        if itemDescription and itemDescription ~= "" then
            KAtlasTooltip:AddLine(itemDescription, 0.8, 0.8, 0.8, 1)
        end

        -- Add error message if we have ID but can't load item
        if itemId then
            KAtlasTooltip:AddLine(colors.red .. (AQERRORNOTSHOWN or "Item not found in cache"), 1, 0, 0)
            KAtlasTooltip:AddLine(AQERRORASKSERVER)
        end
    end

    -- Show the tooltip
    KAtlasTooltip:Show()

end

-----------------------------------------------------------------------------
-- Ask Server right-click
-- + shift click to send link
-- + ctrl click for dressroom
-----------------------------------------------------------------------------
function KQuestItem_OnClick(mouseButton)
    -- Get the frame that triggered this event
    local frame = this
    if not frame or not frame:GetName() then
        return
    end

    -- Extract item index from frame name (e.g., "KQuestItemframe1" -> 1)
    local frameName = frame:GetName()

    -- For names like "KQuestItemframe1", "KQuestItemframe2" etc.
    local itemIndex = tonumber(strsub(frameName, -1))

    if not itemIndex then
        return
    end

    -- Get current quest data
    local questId = AtlasKTW.Q.ShownQuest
    local instanceId = current_instance
    local faction = AtlasKTW.isHorde and "Horde" or "Alliance"

    -- Get quest data from new database structure
    local questData = KQuestInstanceData and
                      KQuestInstanceData[instanceId] and
                      KQuestInstanceData[instanceId].Quests and
                      KQuestInstanceData[instanceId].Quests[faction] and
                      KQuestInstanceData[instanceId].Quests[faction][questId]

    if not questData or not questData.Rewards then
        return
    end

    -- Get the specific reward item by index
    local rewardItem = questData.Rewards[itemIndex]
    if not rewardItem then
        return
    end

    -- Extract item data
    local itemId = rewardItem.ID
    local itemName = rewardItem.Name
    local itemColor = rewardItem.Color or colors.white

    -- Handle right click - show tooltip
    if mouseButton == "RightButton" then
        KAtlasTooltip:SetOwner(frame, "ANCHOR_RIGHT", -(frame:GetWidth() / 2), 24)
        KAtlasTooltip:SetHyperlink(string.format("item:%d:0:0:0", itemId))
        KAtlasTooltip:Show()
        if not AtlasKTW.Q.QuerySpam then
            DEFAULT_CHAT_FRAME:AddMessage(string.format("%s[%s%s%s]%s",
                AQSERVERASK, itemColor, itemName, colors.white, AQSERVERASKInformation))
        end
        return
    end
    -- Handle shift click - insert item link
    if IsShiftKeyDown() then
        itemName, _, itemQuality = GetItemInfo(itemId)
        if itemName then
            local _, _, _, hex = GetItemQualityColor(itemQuality)
            local itemLink = string.format("%s|Hitem:%d:0:0:0|h[%s]|h|r",
                hex, itemId, itemName)
            ChatFrameEditBox:Insert(itemLink)
        else
            DEFAULT_CHAT_FRAME:AddMessage(colors.red.."Item unsafe! Right click to get the item ID")
            ChatFrameEditBox:Insert(string.format("[%s]", rewardItem.Name))
        end
        return
    end
    -- Handle control click - dress up item
    if IsControlKeyDown() and GetItemInfo(itemId) then
        DressUpItemLink(itemId)
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

    for i = 1, constants.MAX_INSTANCES do
        for b = 1, constants.MAX_QUESTS_PER_INSTANCE do
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

-- Initialize frames on addon load
CreateKQuestOptionFrame()
KQuest_OnLoad()
DEFAULT_CHAT_FRAME:AddMessage("Atlas-TW v."..ATLAS_VERSION.." loaded")

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