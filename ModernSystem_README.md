# Atlas-TW Modern Data System

Пример реализации современной модульной системы данных для аддона Atlas-TW (World of Warcraft 1.12).

## Обзор системы

Эта система представляет собой современный подход к организации данных о предметах в Atlas-TW, обеспечивая:

- **Модульность**: Данные разделены по логическим модулям
- **Расширяемость**: Легко добавлять новые типы данных
- **Читаемость**: Структурированный код с именованными полями
- **Совместимость**: Полная обратная совместимость со старой системой
- **Производительность**: Кэширование и оптимизация памяти

## Структура файлов

```
Loot/
├── Data/
│   ├── ItemDB.lua              # Базовая система предметов
│   ├── DataLoader.lua          # Главный загрузчик данных
│   ├── DataInit.xml            # XML инициализация
│   ├── Instances/
│   │   └── Molten_Core.lua     # Данные Огненных Недр
│   └── World/
│       └── World_Bosses.lua    # Данные мировых боссов
└── Core/
    ├── ModernDataAdapter.lua   # Адаптер для интеграции
    ├── UIIntegration.lua       # Интеграция с UI
    └── MigrationExample.lua    # Пример миграции
```

## Ключевые компоненты

### 1. ItemDB.lua - Базовая система предметов

**Основные возможности:**
- Константы качества, типов брони, слотов
- Прототип предмета с методами форматирования
- Функции создания предметов и разделителей
- Конвертация из старого формата

**Пример использования:**
```lua
local item = AtlasTW.ItemDB.CreateItem({
    id = 19019,
    name = "Thunderfury, Blessed Blade of the Windseeker",
    quality = AtlasTW.ItemDB.ITEM_QUALITY.LEGENDARY,
    slot = AtlasTW.ItemDB.EQUIPMENT_SLOT.MAIN_HAND,
    dropRate = "Very Low"
})
```

### 2. DataLoader.lua - Управление данными

**Функции:**
- Загрузка и инициализация модулей
- Совместимость со старой системой
- API для получения данных
- Поиск предметов

**Пример использования:**
```lua
-- Получить все предметы категории
local items = AtlasTW.DataLoader.GetAllItems("instances")

-- Поиск предметов
local results = AtlasTW.DataLoader.SearchItems("Thunderfury")
```

### 3. ModernDataAdapter.lua - Адаптер интеграции

**Возможности:**
- Конвертация между форматами данных
- Кэширование для производительности
- Расширенный поиск с фильтрами
- Статистика и аналитика

**Пример использования:**
```lua
-- Получить данные в старом формате
local legacyData = AtlasTW.ModernAdapter.GetLegacyData("instances", "Lucifron")

-- Поиск с фильтрами
local filtered = AtlasTW.ModernAdapter.SearchItems("sword", {
    quality = AtlasTW.ItemDB.ITEM_QUALITY.EPIC,
    class = "WARRIOR"
})
```

### 4. UIIntegration.lua - Интеграция с интерфейсом

**Функции:**
- Современное создание UI элементов
- Улучшенные тултипы
- Пагинация и навигация
- Обработка событий

**Замена строки 92 из AtlasLootMenu.lua:**
```lua
-- Старый код:
-- local button = _G["AtlasLootMenuItem_" .. i]

-- Новый код:
local button = AtlasTW.UIIntegration.CreateItemButton(i)
```

### 5. MigrationExample.lua - Пример миграции

**Особенности:**
- Постепенная миграция без поломки функциональности
- Fallback на старую систему
- Команды для управления миграцией
- Тестирование и отладка

## Преимущества новой системы

### 1. Читаемость кода

**Старый формат:**
```lua
AtlasLootWBItems = {
    ["Azuregos"] = {
        {18542, "INV_Weapon_Rifle_06", "=q4=Typhoon", "=ds=Ranged Weapon", "18.6%"},
        {18704, "INV_Misc_Cape_18", "=q4=Mature Blue Dragon Sinew", "=ds=Misc", "18.6%"}
    }
}
```

**Новый формат:**
```lua
local Azuregos = {
    name = "Azuregos",
    level = 62,
    zone = "Azshara",
    items = {
        AtlasTW.ItemDB.CreateItem({
            id = 18542,
            name = "Typhoon",
            quality = AtlasTW.ItemDB.ITEM_QUALITY.EPIC,
            slot = AtlasTW.ItemDB.EQUIPMENT_SLOT.RANGED,
            dropRate = "18.6%",
            description = "Ranged Weapon"
        })
    }
}
```

### 2. Расширяемость

- Легко добавлять новые поля к предметам
- Модульная структура позволяет добавлять новые типы данных
- Методы предметов можно расширять без изменения существующего кода

### 3. Производительность

- Кэширование часто используемых данных
- Ленивая загрузка модулей
- Оптимизация поиска и фильтрации

### 4. Совместимость

- Полная обратная совместимость
- Постепенная миграция
- Fallback на старую систему

## Установка и использование

### 1. Добавление в TOC файл

```
# Новая модульная система (опционально)
Loot\Data\DataInit.xml
Loot\Core\ModernDataAdapter.lua
Loot\Core\UIIntegration.lua
Loot\Core\MigrationExample.lua
```

### 2. Инициализация

Система автоматически инициализируется при загрузке. Для ручной инициализации:

```lua
-- Проверка доступности
if AtlasTW.DataLoader then
    local status = AtlasTW.DataLoader.GetModuleStatus()
    print("Модули загружены:", status)
end
```

### 3. Команды для тестирования

```
/atlastw info          # Информация о системе
/atlastw search <item> # Поиск предметов
/atlastw stats         # Статистика
/atlastw refresh       # Обновить кэш

/atlastw-migration toggle  # Переключить современную систему
/atlastw-migration test    # Запустить тест миграции
/atlastw-migration stats   # Статистика миграции
```

## Миграция существующего кода

### Этап 1: Добавление новых файлов

1. Добавить все файлы новой системы
2. Включить `DataInit.xml` в TOC
3. Протестировать совместимость

### Этап 2: Постепенная замена

1. Заменить критические функции через `MigrationExample.lua`
2. Использовать адаптер для конвертации данных
3. Тестировать каждый этап

### Этап 3: Полная миграция

1. Конвертировать все данные в новый формат
2. Обновить UI код
3. Удалить старые файлы данных

## Примеры интеграции

### Замена функции отображения предметов

**Было:**
```lua
function ShowLoot(source)
    local data = AtlasLoot_Data[source]
    for i = 1, getn(data) do
        local button = _G["AtlasLootMenuItem_" .. i]
        -- настройка кнопки
    end
end
```

**Стало:**
```lua
function ShowLoot(category, source)
    if AtlasTW.Migration then
        AtlasTW.Migration.ShowLoot(category, source)
    else
        -- fallback на старую логику
    end
end
```

### Добавление нового предмета

**Старый способ:**
```lua
AtlasLootWBItems["NewBoss"] = {
    {12345, "INV_Sword_01", "=q4=New Sword", "=ds=One-Hand Sword", "10%"}
}
```

**Новый способ:**
```lua
-- В файле данных босса
local NewBoss = {
    name = "New Boss",
    items = {
        AtlasTW.ItemDB.CreateItem({
            id = 12345,
            name = "New Sword",
            quality = AtlasTW.ItemDB.ITEM_QUALITY.EPIC,
            slot = AtlasTW.ItemDB.EQUIPMENT_SLOT.ONE_HAND,
            dropRate = "10%"
        })
    }
}
```

## Заключение

Новая модульная система предоставляет современный, расширяемый и производительный способ управления данными в Atlas-TW, сохраняя при этом полную совместимость с существующим кодом. Система позволяет постепенно мигрировать без риска поломки функциональности и предоставляет множество новых возможностей для разработчиков и пользователей.

Основные преимущества:
- ✅ Современная архитектура
- ✅ Полная обратная совместимость
- ✅ Улучшенная производительность
- ✅ Расширенные возможности поиска
- ✅ Модульная структура
- ✅ Простота добавления новых данных
- ✅ Улучшенная отладка и тестирование

Эта система готова к использованию в production среде и может быть внедрена постепенно без нарушения работы существующего аддона.