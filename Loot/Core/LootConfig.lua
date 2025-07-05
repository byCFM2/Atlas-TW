--Instance required libraries
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

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
    ["ZgSet"] = "AtlasLootZGSetMenu",
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
    ["WorldEpics"] = "AtlasLootWorldEpicsMenu",
    ["Survival"] = "AtlasLoot_SurvivalMenu",
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

-- Функция для динамической генерации AtlasLoot_HewdropDown на основе AtlasLoot_TableRegistry
local function GenerateHewdropDown()
    local hewdropDown = {}
    
    -- Проверяем, что AtlasLoot_TableRegistry существует
    if not AtlasLoot_TableRegistry then
        DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot: Warning - AtlasLoot_TableRegistry not found, using empty dropdown")
        return hewdropDown
    end
    
    -- Определяем основные категории и их подкатегории
    local mainCategories = {
        {
            name = L["Dungeons & Raids"],
            subcategories = {},
            type = "Submenu"
        },
        {
            name = L["World"],
            subcategories = { "World" },
            type = "Table"
        },
        {
            name = L["PvP Rewards"],
            subcategories = { "PvP", "AlteracValley", "ArathiBasin", "WarsongGulch", "BloodRing", "PvPSet" },
            type = "Table"
        },
        {
            name = L["Collections"],
            subcategories = { "Collections" },
            type = "Table"
        },
        {
            name = L["Factions"],
            subcategories = { "Factions" },
            type = "Table"
        },
        {
            name = L["World Events"],
            subcategories = { "WorldEvents" },
            type = "Table"
        },
        {
            name = L["Crafting"],
            subcategories = {
                "Crafting", "Alchemy", "Blacksmithing", "Enchanting", "Engineering",
                "Leatherworking", "Mining", "Tailoring", "Jewelcrafting", "Cooking", "Survival"
            },
            type = "Table"
        }
    }

    -- Динамическое добавление подземелий из AtlasMaps
    if AtlasMaps then
        for mapName, _ in pairs(AtlasMaps) do
            table.insert(mainCategories[1].subcategories, mapName)
        end
    end
    
    -- Генерируем структуру для каждой основной категории
    for _, mainCategory in ipairs(mainCategories) do
        local categoryTable = {}
        categoryTable[mainCategory.name] = {}
        
        -- Добавляем подкатегории
        for _, subcategoryKey in ipairs(mainCategory.subcategories) do
            local subcategoryData = AtlasLoot_TableRegistry[subcategoryKey]
            if subcategoryData and subcategoryData.Entry then
                -- Добавляем записи из подкатегории
                for _, entry in ipairs(subcategoryData.Entry) do
                    table.insert(categoryTable[mainCategory.name], { { entry.Title, entry.ID, mainCategory.type }, })
                end
            end
        end
        
        -- Добавляем категорию только если в ней есть записи
        if table.getn(categoryTable[mainCategory.name]) > 0 then
            table.insert(hewdropDown, categoryTable)
        end
    end
    
    return hewdropDown
end

-- Генерируем AtlasLoot_HewdropDown автоматически
AtlasLoot_HewdropDown = GenerateHewdropDown()

-- Функция для автоматической генерации AtlasLoot_HewdropDown_SubTables на основе AtlasLoot_TableRegistry
local function GenerateHewdropDownSubTables()
    local subTables = {}
    -- Проверяем, что AtlasLoot_TableRegistry существует
    if not AtlasLoot_TableRegistry then
        DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot: Warning - AtlasLoot_TableRegistry not found, using empty subtables")
        return subTables
    end
    -- Проходим по всем категориям в AtlasLoot_TableRegistry
    for categoryKey, categoryData in pairs(AtlasLoot_TableRegistry) do
        if categoryData.Entry then
            -- Создаем подтаблицу для каждой категории
            local categorySubTable = {}
            for _, entry in ipairs(categoryData.Entry) do
                -- Добавляем каждую запись как элемент подтаблицы
                table.insert(categorySubTable, { entry.Title, entry.ID })
            end
            -- Добавляем подтаблицу в основную структуру
            subTables[categoryKey] = categorySubTable
        end
    end
    return subTables
end

-- Генерируем AtlasLoot_HewdropDown_SubTables автоматически
AtlasLoot_HewdropDown_SubTables = GenerateHewdropDownSubTables()