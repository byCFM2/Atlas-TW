--Instance required libraries
local L = AtlasTW.Local

-- Кэш для локализованных строк (оптимизация)
local LocalizedStrings = {
    DungeonsRaids = L["Dungeons & Raids"],
    World = L["World"],
    PvPRewards = L["PvP Rewards"],
    Collections = L["Collections"],
    Factions = L["Factions"],
    WorldEvents = L["World Events"],
    Crafting = L["Crafting"],
    RareMobs = L["Rare Mobs"]
}

AtlasLoot_MenuHandlers = {
    ["DUNGEONSMENU1"] = "AtlasLoot_DungeonsMenu1",
    ["DUNGEONSMENU2"] = "AtlasLoot_DungeonsMenu2",
    ["PvP"] = "AtlasLootPvPMenu",
    ["ArathiBasin"] = "AtlasLootABRepMenu",
    ["AlteracValley"] = "AtlasLootAVRepMenu",
    ["WarsongGulch"] = "AtlasLootWSGRepMenu",
    ["BloodRing"] = "AtlasLootBRRepMenu",
    ["PvPSet"] = "AtlasLootPVPSetMenu",
    ["Collections"] = "AtlasLootSetMenu",
    ["Aq20Set"] = "AtlasLootAQ20SetMenu",
    ["Aq40Set"] = "AtlasLootAQ40SetMenu",
    ["K40Set"] = "AtlasLootUKSetMenu",
    ["Pre60Set"] = "AtlasLootPRE60SetMenu",
    ["ZGSet"] = "AtlasLootZGSetMenu",
    ["T3Set"] = "AtlasLootT3SetMenu",
    ["T2Set"] = "AtlasLootT2SetMenu",
    ["T1Set"] = "AtlasLootT1SetMenu",
    ["T0Set"] = "AtlasLootT0SetMenu",
    ["Factions"] = "AtlasLootRepMenu",
    ["WorldEvents"] = "AtlasLootWorldEventMenu",
    ["Alchemy"] = "AtlasLoot_AlchemyMenu",
    ["Crafting"] = "AtlasLoot_CraftingMenu",
    ["Blacksmithing"] = "AtlasLoot_SmithingMenu",
    ["Enchanting"] = "AtlasLoot_EnchantingMenu",
    ["Engineering"] = "AtlasLoot_EngineeringMenu",
    ["Leatherworking"] = "AtlasLoot_LeatherworkingMenu",
    ["Tailoring"] = "AtlasLoot_TailoringMenu",
    ["CraftSet"] = "AtlasLootCraftedSetMenu",
    ["Cooking"] = "AtlasLoot_CookingMenu",
    ["World"] = "AtlasLoot_WorldMenu",
    ["Jewelcrafting"] = "AtlasLoot_JewelcraftingMenu",
    ["WorldBlues"] = "AtlasLootWorldBluesMenu",
    ["CraftSet2"] = "AtlasLootCraftedSet2Menu",
    ["Mining"] = "AtlasLoot_MiningMenu",
    ["PriestSet"] = "AtlasLootPriestSetMenu",
    ["MageSet"] = "AtlasLootMageSetMenu",
    ["WarlockSet"] = "AtlasLootWarlockSetMenu",
    ["RogueSet"] = "AtlasLootRogueSetMenu",
    ["DruidSet"] = "AtlasLootDruidSetMenu",
    ["HunterSet"] = "AtlasLootHunterSetMenu",
    ["ShamanSet"] = "AtlasLootShamanSetMenu",
    ["PaladinSet"] = "AtlasLootPaladinSetMenu",
    ["WarriorSet"] = "AtlasLootWarriorSetMenu",
}

-- Вспомогательная функция для обработки данных категории (оптимизация)
local function ProcessCategoryData(data, categoryName, specialHandler)
    if not data then return nil end

    local category = {}
    category[categoryName] = {}
    local categoryList = category[categoryName]

    if specialHandler then
        return specialHandler(data, category, categoryList)
    else
        -- Стандартная обработка
        for i = 1, getn(data) do
            local item = data[i]
            if item.name and item.lootpage then
                categoryList[getn(categoryList) + 1] = { { item.name, item.lootpage } }
            end
        end
    end

    return category
end

-- Специальный обработчик для World категории (оптимизация)
local function ProcessWorldCategory(data, category, categoryList)
    local rareMobsEntry = nil

    for i = 1, getn(data) do
        local boss = data[i]
        if boss.name and boss.lootpage then
            if boss.name == LocalizedStrings.RareMobs then
                rareMobsEntry = { { boss.name, boss.lootpage } }
            else
                categoryList[getn(categoryList) + 1] = { { boss.name, boss.lootpage } }
            end
        end
    end

    if rareMobsEntry then
        categoryList[getn(categoryList) + 1] = rareMobsEntry
    end

    return category
end

-- Специальный обработчик для Dungeons категории (оптимизация)
local function ProcessDungeonsCategory(menu1Data, menu2Data)
    if not menu1Data or not menu2Data then return nil end

    local category = {}
    category[LocalizedStrings.DungeonsRaids] = {}
    local categoryList = category[LocalizedStrings.DungeonsRaids]

    -- Объединяем обработку двух массивов в один цикл
    local totalCount = getn(menu1Data) + getn(menu2Data)
    for i = 1, totalCount do
        local dungeon
        if i <= getn(menu1Data) then
            dungeon = menu1Data[i]
        else
            dungeon = menu2Data[i - getn(menu1Data)]
        end

        if dungeon.name and dungeon.lootpage then
            categoryList[getn(categoryList) + 1] = { { dungeon.name_orig or dungeon.name, dungeon.lootpage } }

        end
    end

    return category
end

-- Оптимизированная функция для динамической генерации AtlasLoot_HewdropDown
local function GenerateHewdropDown()

    local lootData = AtlasTW.Loot
    local hewdropDown = {}
    local category

    -- 1. Dungeons & Raids (оптимизированная обработка)
    category = ProcessDungeonsCategory(lootData.DungeonsMenu1Data, lootData.DungeonsMenu2Data)
    if category then
        hewdropDown[getn(hewdropDown) + 1] = category
    end

    -- 2. World (оптимизированная обработка)
    category = ProcessCategoryData(lootData.WorldBossesData, LocalizedStrings.World, ProcessWorldCategory)
    if category then
        hewdropDown[getn(hewdropDown) + 1] = category
    end

    -- 3. PvP Rewards (оптимизированная обработка)
    category = ProcessCategoryData(lootData.PvpMenuData, LocalizedStrings.PvPRewards)
    if category then
        hewdropDown[getn(hewdropDown) + 1] = category
    end

    -- 4. Collections (оптимизированная обработка)
    category = ProcessCategoryData(lootData.SetsMenuData, LocalizedStrings.Collections)
    if category then
        hewdropDown[getn(hewdropDown) + 1] = category
    end

    -- 5. Factions (оптимизированная обработка)
    category = ProcessCategoryData(lootData.FactionsData, LocalizedStrings.Factions)
    if category then
        hewdropDown[getn(hewdropDown) + 1] = category
    end

    -- 6. World Events (оптимизированная обработка)
    category = ProcessCategoryData(lootData.WorldEventsData, LocalizedStrings.WorldEvents)
    if category then
        hewdropDown[getn(hewdropDown) + 1] = category
    end

    -- 7. Crafting (оптимизированная обработка)
    category = ProcessCategoryData(lootData.CraftingMenuData, LocalizedStrings.Crafting)
    if category then
        hewdropDown[getn(hewdropDown) + 1] = category
    end

    return hewdropDown
end

-- Оптимизированная функция для автоматической генерации AtlasLoot_HewdropDown_SubTables
local function GenerateHewdropDownSubTables()
    local subTables = {}

    -- Проверяем, что AtlasLoot_TableRegistry существует
    if not AtlasLoot_TableRegistry then
        DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot: Warning - AtlasLoot_TableRegistry not found, using empty subtables")
        return subTables
    end

    -- Оптимизированная обработка категорий
    for categoryKey, categoryData in pairs(AtlasLoot_TableRegistry) do
        if categoryData.Entry then
            local entryData = categoryData.Entry
            local entryCount = getn(entryData)

            -- Предварительное выделение памяти для таблицы (оптимизация)
            local categorySubTable = {}

            -- Используем числовой индекс вместо ipairs для лучшей производительности
            for i = 1, entryCount do
                local entry = entryData[i]
                if entry.Title and entry.ID then
                    categorySubTable[i] = { entry.Title, entry.ID }
                end
            end

            subTables[categoryKey] = categorySubTable
        end
    end

    return subTables
end

-- Генерируем данные при загрузке (с ленивой инициализацией)
do
    if not AtlasLoot_HewdropDown then
        AtlasLoot_HewdropDown = GenerateHewdropDown()
    end
    if not AtlasLoot_HewdropDown_SubTables then
        AtlasLoot_HewdropDown_SubTables = GenerateHewdropDownSubTables()
    end
end