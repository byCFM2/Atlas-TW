-----------------------------------------------------------------------------
-- Оптимизированная система определения инстансов для Atlas Quest
-- Совместимость: WoW 1.12 (Lua 5.0)
-- Исправлены проблемы с самовызовом функций
-----------------------------------------------------------------------------
-- Константы для оптимизации
local quest_const = KQuestConfig and KQuestConfig.Constants
local quest_variables = KQuestConfig and KQuestConfig.Variables

-- Статическая карта инстансов - создается один раз при загрузке
local KQuest_StaticInstanceMap = nil

-- Группировка карт по категориям для лучшей организации
local InstanceMaps = {
    -- Оригинальные подземелья (1-32)
    Original = {
        {pattern = "TheDeadmines", id = 1, hasEntrance = true},
        {pattern = "WailingCaverns", id = 2, hasEntrance = true},
        {pattern = "RagefireChasm", id = 3},
        {pattern = "Uldaman", id = 4, hasEntrance = true},
        {pattern = "BlackrockDepths", id = 5, entrancePattern = "BlackrockMountainEnt"},
        {pattern = "BlackwingLair", id = 6, entrancePattern = "BlackrockMountainEnt"},
        {pattern = "BlackfathomDeeps", id = 7, hasEntrance = true},
        {pattern = "BlackrockSpireLower", id = 8, entrancePattern = "BlackrockMountainEnt"},
        {pattern = "BlackrockSpireUpper", id = 9, entrancePattern = "BlackrockMountainEnt"},
        {pattern = "DireMaulEast", id = 10, entrancePattern = "DireMaulEnt"},
        {pattern = "DireMaulNorth", id = 11, entrancePattern = "DireMaulEnt"},
        {pattern = "DireMaulWest", id = 12, entrancePattern = "DireMaulEnt"},
        {pattern = "Maraudon", id = 13, hasEntrance = true},
        {pattern = "MoltenCore", id = 14, entrancePattern = "BlackrockMountainEnt"},
        {pattern = "Naxxramas", id = 15},
        {pattern = "OnyxiasLair", id = 16},
        {pattern = "RazorfenDowns", id = 17},
        {pattern = "RazorfenKraul", id = 18},
        {pattern = "SMLibrary", id = 19, entrancePattern = "SMEnt"},
        {pattern = "SMArmory", id = 20, entrancePattern = "SMEnt"},
        {pattern = "SMCathedral", id = 21, entrancePattern = "SMEnt"},
        {pattern = "SMGraveyard", id = 22, entrancePattern = "SMEnt"},
        {pattern = "Scholomance", id = 23},
        {pattern = "ShadowfangKeep", id = 24},
        {pattern = "Stratholme", id = 25},
        {pattern = "TheRuinsofAhnQiraj", id = 26},
        {pattern = "TheStockade", id = 27},
        {pattern = "TheSunkenTemple", id = 28, hasEntrance = true},
        {pattern = "TheTempleofAhnQiraj", id = 29},
        {pattern = "ZulFarrak", id = 30},
        {pattern = "ZulGurub", id = 31},
        {pattern = "Gnomeregan", id = 32, hasEntrance = true}
    },

    -- Внешние рейды (33-35)
    OutdoorRaids = {
        {pattern = "FourDragons", id = 33},
        {pattern = "Azuregos", id = 34},
        {pattern = "LordKazzak", id = 35}
    },

    -- Поля боя (36-38)
    Battlegrounds = {
        {pattern = "AlteracValleyNorth", id = 36},
        {pattern = "AlteracValleySouth", id = 36},
        {pattern = "ArathiBasin", id = 37},
        {pattern = "WarsongGulch", id = 38}
    },

    -- Контент Turtle-WOW (39-65)
    TurtleWOW = {
        {pattern = "TheCrescentGrove", id = 39},
        {pattern = "Concavius", id = 40},
        {pattern = "KarazhanCrypt", id = 41},
        {pattern = "Nerubian", id = 42},
        {pattern = "Reaver", id = 43},
        {pattern = "Turtlhu", id = 44},
        {pattern = "CavernsOfTimeBlackMorass", id = 45},
        {pattern = "HateforgeQuarry", id = 46},
        {pattern = "StormwroughtRuins", id = 47},
        {pattern = "StormwindVault", id = 57},
        {pattern = "Ostarius", id = 58},
        {pattern = "CowKing", id = 59},
        {pattern = "GilneasCity", id = 61},
        {pattern = "LowerKarazhan", id = 62},
        {pattern = "EmeraldSanctum", id = 63},
        {pattern = "TowerofKarazhan", id = 64},
        {pattern = "Clackora", id = 65}
    },

    -- Карты и маршруты (98)
    WorldMaps = {
        {pattern = "TransportRoutes", id = 98},
        {pattern = "DLEast", id = 98},
        {pattern = "DLWest", id = 98},
        {pattern = "FPAllianceEast", id = 98},
        {pattern = "FPAllianceWest", id = 98},
        {pattern = "FPHordeEast", id = 98},
        {pattern = "FPHordeWest", id = 98},
        {pattern = "RareMobs", id = 98}
    }
}

-----------------------------------------------------------------------------
-- Статические вспомогательные функции (не используют самовызов)
-----------------------------------------------------------------------------

-- Валидация текстуры
local function ValidateTexture(texture)
    if not texture or texture == "" then
        return false
    end

    -- Проверяем, что это текстура Atlas
    if not string.find(texture, "Atlas%-TW") then
        return false
    end

    return true
end

-- Функция создания карты инстансов - выполняется один раз
local function BuildInstanceMap()
    local instanceMap = {}
    local basePath = quest_const.MAP_PATH

    -- Обрабатываем каждую категорию инстансов
    for categoryName, maps in pairs(InstanceMaps) do
        for _, mapData in ipairs(maps) do
            local pattern = mapData.pattern
            local id = mapData.id

            -- Основная карта инстанса
            instanceMap[basePath .. pattern] = id

            -- Карта входа
            if mapData.entrancePattern then
                instanceMap[basePath .. mapData.entrancePattern] = id
            elseif mapData.hasEntrance then
                -- Стандартный суффикс входа
                instanceMap[basePath .. pattern .. quest_const.ENTRANCE_SUFFIX] = id
            end
        end
    end

    return instanceMap
end

-- Инициализируем статическую карту сразу при загрузке файла
KQuest_StaticInstanceMap = BuildInstanceMap()

-----------------------------------------------------------------------------
-- Основная функция определения инстанса
-----------------------------------------------------------------------------
function KQuest_Instances()
    -- Получаем текущую текстуру Atlas
    local currentTexture = AtlasMap and AtlasMap:GetTexture()
    -- Валидация входных данных
    if not ValidateTexture(currentTexture) then
        quest_variables.CURRENT_MAP_TEXTURE = nil
        quest_variables.CURRENT_INSTANCE = quest_const.DEFAULT_INSTANCE
        return quest_variables.CURRENT_INSTANCE
    end

    -- Сохраняем текстуру для других модулей
    quest_variables.CURRENT_MAP_TEXTURE = currentTexture

    -- Ищем ID инстанса в предварительно построенной карте и устанавливаем результат 
    quest_variables.CURRENT_INSTANCE = KQuest_StaticInstanceMap[currentTexture] or quest_const.DEFAULT_INSTANCE

    return quest_variables.CURRENT_INSTANCE
end

-----------------------------------------------------------------------------
-- Дополнительные утилиты (объявлены после основной функции)
-----------------------------------------------------------------------------

-- Получение категории инстанса
function KQuest_GetInstanceCategory(instanceId)
    if not instanceId then
        instanceId = quest_variables.CURRENT_INSTANCE
    end

    -- Проверяем каждую категорию
    for categoryName, maps in pairs(InstanceMaps) do
        for _, mapData in ipairs(maps) do
            if mapData.id == instanceId then
                return categoryName
            end
        end
    end

    return "Unknown"
end

-- Проверка валидности инстанса
function KQuest_IsValidInstance(instanceId)
    if not instanceId then
        return false
    end

    -- Проверяем существование в любой категории
    for _, maps in pairs(InstanceMaps) do
        for _, mapData in ipairs(maps) do
            if mapData.id == instanceId then
                return true
            end
        end
    end

    return false
end

-- Получение всех инстансов определенной категории
function KQuest_GetInstancesByCategory(categoryName)
    local result = {}

    if InstanceMaps[categoryName] then
        for _, mapData in ipairs(InstanceMaps[categoryName]) do
            table.insert(result, {
                id = mapData.id,
                pattern = mapData.pattern,
                category = categoryName
            })
        end
    end

    return result
end

--[[
=============================================================================
СПРАВОЧНАЯ ИНФОРМАЦИЯ ПО ID ИНСТАНСОВ
=============================================================================

--- Оригинальные инстансы (1-32) ---
1  = Deadmines (VC)              19 = SM: Library (SM Lib)
2  = Wailing Caverns (WC)        20 = SM: Armory (SM Arm)
3  = Ragefire Chasm (RFC)        21 = SM: Cathedral (SM Cath)
4  = Uldaman (ULD)               22 = SM: Graveyard (SM GY)
5  = Blackrock Depths (BRD)      23 = Scholomance (Scholo)
6  = Blackwing Lair (BWL)        24 = Shadowfang Keep (SFK)
7  = Blackfathom Deeps (BFD)     25 = Stratholme (Strat)
8  = Lower Blackrock Spire       26 = Ruins of Ahn'Qiraj (AQ20)
9  = Upper Blackrock Spire       27 = The Stockade (Stocks)
10 = Dire Maul East (DM)         28 = Sunken Temple (ST)
11 = Dire Maul North (DM)        29 = Temple of Ahn'Qiraj (AQ40)
12 = Dire Maul West (DM)         30 = Zul'Farrak (ZF)
13 = Maraudon (Mara)             31 = Zul'Gurub (ZG)
14 = Molten Core (MC)            32 = Gnomeregan (Gnomer)
15 = Naxxramas (Naxx)
16 = Onyxia's Lair (Ony)         --- Внешние рейды (33-35) ---
17 = Razorfen Downs (RFD)        33 = Four Dragons
18 = Razorfen Kraul (RFK)        34 = Azuregos
                                 35 = Lord Kazzak

--- Поля боя (36-38) ---           --- Turtle-WOW контент (39-65) ---
36 = Alterac Valley (AV)         39 = The Crescent Grove (TCG)
37 = Arathi Basin (AB)           40 = Concavius
38 = Warsong Gulch (WSG)         41 = Karazhan Crypt
                                 42 = Nerubian
--- Карты и маршруты (98) ---    43 = Reaver
98 = Transport Routes            44 = Turtlhu
98 = Dungeon Locations           45 = Black Morass
98 = Flight Paths                46 = Hateforge Quarry
98 = Rare Mobs                   47 = Stormwrought Ruins
                                 57 = Stormwind Vault
                                 58 = Ostarius
                                 59 = Cow King
--- По умолчанию (99) ---        61 = Gilneas City
99 = Неизвестная карта           62 = Lower Karazhan
                                 63 = Emerald Sanctum
                                 64 = Tower of Karazhan
                                 65 = Clackora

=============================================================================
ОСНОВНЫЕ ИСПРАВЛЕНИЯ В ЭТОЙ ВЕРСИИ:
=============================================================================

1. **Убраны самовызовы**: Все функции объявлены в правильном порядке
2. **Статическая инициализация**: Карта создается один раз при загрузке
3. **Простая структура**: Основная функция не вызывает другие функции рекурсивно
4. **Кеширование**: Эффективное кеширование без побочных эффектов
5. **Совместимость с Lua 5.0**: Код протестирован на совместимость с WoW 1.12
6. **Чистая архитектура**: Все утилиты объявлены после основной функции

=============================================================================
]]