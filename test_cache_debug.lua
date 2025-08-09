-- Тестовый скрипт для отладки кэширования предметов
-- Запустите этот скрипт в игре через /script или /run

-- Функция для тестирования кэширования
local function TestCacheDebug()
    print("=== НАЧАЛО ТЕСТА КЭШИРОВАНИЯ ===")
    
    -- Попробуем открыть любое окно с лутом
    -- Например, если у вас есть данные для Молтен Кор
    if AtlasTW and AtlasTW.InstanceData then
        print("AtlasTW.InstanceData найден")
        
        -- Ищем любую доступную зону с данными
        for zoneID, data in pairs(AtlasTW.InstanceData) do
            if data.Bosses and getn(data.Bosses) > 0 then
                print("Найдена зона: " .. zoneID .. " с " .. getn(data.Bosses) .. " боссами")
                
                -- Берем первого босса
                local firstBoss = data.Bosses[1]
                if firstBoss and firstBoss.items then
                    print("Тестируем кэширование для босса: " .. (firstBoss.name or "Неизвестный"))
                    print("Предметов у босса: " .. getn(firstBoss.items))
                    
                    -- Вызываем функцию показа лута
                    if AtlasTW.Loot and AtlasTW.Loot.ScrollBarLootUpdate then
                        -- Устанавливаем данные для отображения
                        AtlasLootItemsFrame.storedBoss = {
                            name = firstBoss.name or "Test Boss",
                            loot = firstBoss.items
                        }
                        
                        print("Вызываем ScrollBarLootUpdate...")
                        AtlasTW.Loot.ScrollBarLootUpdate()
                    else
                        print("ОШИБКА: AtlasTW.Loot.ScrollBarLootUpdate не найден")
                    end
                    
                    return -- Выходим после первого найденного босса
                end
            end
        end
        
        print("Не найдено подходящих данных для тестирования")
    else
        print("ОШИБКА: AtlasTW.InstanceData не найден")
    end
    
    print("=== КОНЕЦ ТЕСТА КЭШИРОВАНИЯ ===")
end

-- Запускаем тест
TestCacheDebug()

print("Тестовый скрипт выполнен. Проверьте сообщения выше для отладочной информации.")
print("Если окно не открылось, проблема в логике кэширования.")
print("Все отладочные сообщения должны показать где именно происходит сбой.")