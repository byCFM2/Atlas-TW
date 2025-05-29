---
--- Created by Vitali.
--- DateTime: 29.05.2025 19:46
---
Проанализировав код, вижу несколько областей для улучшения структуры для WoW 1.12. Вот мои рекомендации:

## **5. Упрощение QuestMain.lua**

<snippet-file>QuestMain.lua</snippet-file>
```lua
-- Утилиты для работы с квестами
local KQuestUtils = {
    -- Получение данных квеста
    getQuestData = function(instanceId, questId, faction, field)
        instanceId = instanceId or AtlasKTW.Instances
        questId = questId or AtlasKTW.Q.ShownQuest
        faction = faction or (AtlasKTW.isHorde and "Horde" or "Alliance")
        field = field or "Title"

        local instanceData = KQuestInstanceData[instanceId]
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

    -- Очистка UI
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
        for i = 1, 6 do
            local frameName = "KQuestItemframe" .. i
            _G[frameName .. "_Icon"]:SetTexture()
            _G[frameName .. "_Name"]:SetText()
            _G[frameName .. "_Extra"]:SetText()
            _G[frameName]:Disable()
        end
    end
}

-- Замена глобальных функций на утилиты
function KQClearALL()
    KQuestUtils.clearAllFrames()
end

function kQGetQuestData(instanceId, questId, faction, field)
    return KQuestUtils.getQuestData(instanceId, questId, faction, field)
end

function kQQuestExists(instanceId, questId, faction)
    return KQuestUtils.questExists(instanceId, questId, faction)
end
```


## **6. Создание системы валидации**

<snippet-file>QuestValidator.lua</snippet-file>
```lua
-- Система валидации квестов
local KQuestValidator = {
    validateQuest = function(questData)
        local errors = {}

        if not questData.Title or questData.Title == "" then
            table.insert(errors, "Missing quest title")
        end

        if not questData.Aim or questData.Aim == "" then
            table.insert(errors, "Missing quest aim")
        end

        if not questData.Level or questData.Level == "" then
            table.insert(errors, "Missing quest level")
        end

        return table.getn(errors) == 0, errors
    end,

    validateInstance = function(instanceData)
        if not instanceData.Caption then
            return false, "Missing instance caption"
        end

        if not instanceData.Quests or
           (not instanceData.Quests.Alliance and not instanceData.Quests.Horde) then
            return false, "No quest data found"
        end

        return true, "OK"
    end
}
```


## **Основные улучшения:**

1. **Модульность**: Разделение кода на логические блоки
2. **Конфигурация**: Вынос констант и настроек в отдельные таблицы
3. **Фабрики**: Упрощение создания повторяющихся UI элементов
4. **Утилиты**: Общие функции для работы с данными
5. **Кеширование**: Оптимизация производительности
6. **Валидация**: Проверка корректности данных
7. **Совместимость**: Все изменения совместимы с Lua 5.0 в WoW 1.12

Эти изменения значительно упростят поддержку кода и добавление нового функционала.