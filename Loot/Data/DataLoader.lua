-- DataLoader.lua - Главный загрузчик модульных данных
-- Управляет загрузкой и инициализацией всех модулей данных

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.DataLoader = {}

-- Статус загрузки модулей
local moduleStatus = {
    ItemDB = false,
    Instances = {},
    World = {},
    PvP = {},
    Reputation = {},
    Sets = {},
    Crafting = {}
}

-- Список модулей для загрузки
local moduleList = {
    -- Основные модули
    {"Data\\ItemDB.lua", "ItemDB"},

    -- Подземелья
    {"Data\\Instances\\Molten_Core.lua", "Instances.MoltenCore"},
    -- Добавить другие подземелья по мере создания

    -- Мировые боссы
    {"Data\\World\\World_Bosses.lua", "World.WorldBosses"},

    -- PvP данные
    -- {"Data\\PvP\\Battlegrounds.lua", "PvP.Battlegrounds"},

    -- Репутация
    -- {"Data\\Reputation\\Factions.lua", "Reputation.Factions"},

    -- Комплекты
    -- {"Data\\Sets\\Tier_Sets.lua", "Sets.TierSets"},

    -- Крафт
    -- {"Data\\Crafting\\Professions.lua", "Crafting.Professions"}
}

-- Функция загрузки модуля
local function LoadModule(filePath, moduleName)
    local success, errorMsg = pcall(function()
        -- В WoW 1.12 нет require, поэтому используем loadfile
        local chunk, err = loadfile(filePath)
        if chunk then
            chunk()
            DEFAULT_CHAT_FRAME:AddMessage("DataLoader: Модуль " .. moduleName .. " загружен")
            return true
        else
            DEFAULT_CHAT_FRAME:AddMessage("DataLoader: Ошибка загрузки " .. moduleName .. ": " .. (err or "неизвестная ошибка"))
            return false
        end
    end)

    if not success then
        DEFAULT_CHAT_FRAME:AddMessage("DataLoader: Критическая ошибка при загрузке " .. moduleName .. ": " .. (errorMsg or "неизвестная ошибка"))
        return false
    end

    return success
end

-- Функция установки статуса модуля
local function SetModuleStatus(modulePath, status)
    local parts = {}
    local current = moduleStatus

    -- Разбиваем путь на части
    local start = 1
    local dotPos = strfind(modulePath, "%.")
    while dotPos do
        tinsert(parts, strsub(modulePath, start, dotPos - 1))
        start = dotPos + 1
        dotPos = strfind(modulePath, "%.", start)
    end
    tinsert(parts, strsub(modulePath, start))

    -- Устанавливаем статус
    for i = 1, getn(parts) - 1 do
        if not current[parts[i]] then
            current[parts[i]] = {}
        end
        current = current[parts[i]]
    end

    current[parts[getn(parts)]] = status
end

-- Функция инициализации всех модулей
function AtlasTW.DataLoader.Initialize()
    DEFAULT_CHAT_FRAME:AddMessage("DataLoader: Начинаем загрузку модулей данных...")

    local loadedCount = 0
    local totalCount = getn(moduleList)

    for i = 1, totalCount do
        local filePath = moduleList[i][1]
        local moduleName = moduleList[i][2]

        local success = LoadModule(filePath, moduleName)
        SetModuleStatus(moduleName, success)

        if success then
            loadedCount = loadedCount + 1
        end
    end

    DEFAULT_CHAT_FRAME:AddMessage("DataLoader: Загружено " .. loadedCount .. " из " .. totalCount .. " модулей")

    -- Инициализируем совместимость со старым форматом
    AtlasTW.DataLoader.InitializeLegacyCompatibility()

    return loadedCount == totalCount
end

-- Функция получения статуса загрузки
function AtlasTW.DataLoader.GetModuleStatus()
    return moduleStatus
end

-- Функция проверки, загружен ли модуль
function AtlasTW.DataLoader.IsModuleLoaded(moduleName)
    local parts = {}
    local current = moduleStatus

    -- Разбиваем путь на части
    local start = 1
    local dotPos = strfind(moduleName, "%.")
    while dotPos do
        tinsert(parts, strsub(moduleName, start, dotPos - 1))
        start = dotPos + 1
        dotPos = strfind(moduleName, "%.", start)
    end
    tinsert(parts, strsub(moduleName, start))

    -- Проверяем статус
    for i = 1, getn(parts) do
        if not current[parts[i]] then
            return false
        end
        current = current[parts[i]]
    end

    return current == true
end

-- Функция совместимости со старым форматом
function AtlasTW.DataLoader.InitializeLegacyCompatibility()
    if not AtlasTW.DataLoader.IsModuleLoaded("ItemDB") then
        DEFAULT_CHAT_FRAME:AddMessage("DataLoader: ItemDB не загружен, пропускаем инициализацию совместимости")
        return
    end

    -- Создаем пустые таблицы для совместимости
    if not AtlasLoot_Data then
        AtlasLoot_Data = {}
    end

    -- Создаем адаптеры для старых категорий
    AtlasLoot_Data["AtlasLootItems"] = AtlasLoot_Data["AtlasLootItems"] or {}
    AtlasLoot_Data["AtlasLootWBItems"] = AtlasLoot_Data["AtlasLootWBItems"] or {}
    AtlasLoot_Data["AtlasLootSetItems"] = AtlasLoot_Data["AtlasLootSetItems"] or {}
    AtlasLoot_Data["AtlasLootCrafting"] = AtlasLoot_Data["AtlasLootCrafting"] or {}
    AtlasLoot_Data["AtlasLootBGItems"] = AtlasLoot_Data["AtlasLootBGItems"] or {}
    AtlasLoot_Data["AtlasLootRepItems"] = AtlasLoot_Data["AtlasLootRepItems"] or {}

    -- Конвертируем данные Molten Core в старый формат для совместимости
    if AtlasTW.InstanceData and AtlasTW.InstanceData.MoltenCore then
        AtlasTW.DataLoader.ConvertMoltenCoreToLegacy()
    end

    -- Конвертируем данные мировых боссов
    if AtlasTW.WorldData and AtlasTW.WorldData.WorldBosses then
        AtlasTW.DataLoader.ConvertWorldBossesToLegacy()
    end

    DEFAULT_CHAT_FRAME:AddMessage("DataLoader: Совместимость со старым форматом инициализирована")
end

-- Функция конвертации Molten Core в старый формат
function AtlasTW.DataLoader.ConvertMoltenCoreToLegacy()
    local mc = AtlasTW.InstanceData.MoltenCore

    for bossName, bossData in pairs(mc.bosses) do
        if bossData.items then
            local legacyItems = {}

            for i = 1, getn(bossData.items) do
                local item = bossData.items[i]
                local legacyItem

                if item.isSeparator then
                    legacyItem = {0, item.icon, "=q" .. item.quality .. "=" .. item.name, ""}
                else
                    local name = "=q" .. item.quality .. "=" .. item.name
                    local desc = item:GetDescription()
                    local dropRate = item:GetDropRateText()

                    legacyItem = {item.id, item.icon, name, "=ds=" .. desc, dropRate}
                end

                tinsert(legacyItems, legacyItem)
            end

            AtlasLoot_Data["AtlasLootItems"]["MC" .. bossName] = legacyItems
        end
    end
end

-- Функция конвертации мировых боссов в старый формат
function AtlasTW.DataLoader.ConvertWorldBossesToLegacy()
    local wb = AtlasTW.WorldData.WorldBosses

    for bossName, bossData in pairs(wb) do
        if type(bossData) == "table" and bossData.items then
            local legacyItems = {}

            for i = 1, getn(bossData.items) do
                local item = bossData.items[i]
                local legacyItem

                if item.isSeparator then
                    legacyItem = {0, item.icon, "=q" .. item.quality .. "=" .. item.name, ""}
                else
                    local name = "=q" .. item.quality .. "=" .. item.name
                    local desc = item:GetDescription()
                    local dropRate = item:GetDropRateText()

                    legacyItem = {item.id, item.icon, name, "=ds=" .. desc, dropRate}
                end

                tinsert(legacyItems, legacyItem)
            end

            AtlasLoot_Data["AtlasLootWBItems"]["WB" .. bossName] = legacyItems
        end
    end
end

-- Функция получения всех предметов (новый API)
function AtlasTW.DataLoader.GetAllItems(category, subcategory)
    local items = {}

    if category == "instances" and AtlasTW.InstanceData then
        if subcategory and AtlasTW.InstanceData[subcategory] then
            if AtlasTW.InstanceData[subcategory].GetAllItems then
                items = AtlasTW.InstanceData[subcategory].GetAllItems()
            end
        else
            -- Получаем предметы из всех подземелий
            for instanceName, instanceData in pairs(AtlasTW.InstanceData) do
                if type(instanceData) == "table" and instanceData.GetAllItems then
                    local instanceItems = instanceData.GetAllItems()
                    for i = 1, getn(instanceItems) do
                        tinsert(items, instanceItems[i])
                    end
                end
            end
        end
    elseif category == "world" and AtlasTW.WorldData then
        if subcategory and AtlasTW.WorldData[subcategory] then
            if AtlasTW.WorldData[subcategory].GetAllItems then
                items = AtlasTW.WorldData[subcategory].GetAllItems()
            end
        else
            -- Получаем предметы из всех мировых источников
            for sourceName, sourceData in pairs(AtlasTW.WorldData) do
                if type(sourceData) == "table" and sourceData.GetAllItems then
                    local sourceItems = sourceData.GetAllItems()
                    for i = 1, getn(sourceItems) do
                        tinsert(items, sourceItems[i])
                    end
                end
            end
        end
    end

    return items
end

-- Функция поиска предметов
function AtlasTW.DataLoader.SearchItems(searchTerm, category)
    local allItems

    if category then
        allItems = AtlasTW.DataLoader.GetAllItems(category)
    else
        -- Поиск во всех категориях
        allItems = {}
        local categories = {"instances", "world"}

        for i = 1, getn(categories) do
            local categoryItems = AtlasTW.DataLoader.GetAllItems(categories[i])
            for j = 1, getn(categoryItems) do
                tinsert(allItems, categoryItems[j])
            end
        end
    end

    local foundItems = {}
    searchTerm = strlower(searchTerm)

    for i = 1, getn(allItems) do
        local item = allItems[i]
        if item.name and strfind(strlower(item.name), searchTerm) then
            tinsert(foundItems, item)
        end
    end

    return foundItems
end

DEFAULT_CHAT_FRAME:AddMessage("DataLoader: Модуль загружен")