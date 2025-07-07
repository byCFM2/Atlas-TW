--Instance required libraries
local L = AceLibrary("AceLocale-2.2"):new("Atlas")

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

-- Функция для динамической генерации AtlasLoot_HewdropDown на основе AtlasTW.Loot данных
local function GenerateHewdropDown()
    local hewdropDown = {}

     -- 1. Dungeons & Raids (динамическая категория на основе AtlasTW.Loot.DungeonsMenu1Data и AtlasTW.Loot.DungeonsMenu2Data)
    if AtlasTW and AtlasTW.Loot and AtlasTW.Loot.DungeonsMenu1Data and AtlasTW.Loot.DungeonsMenu2Data then
        local dungeonsCategory = {}
        dungeonsCategory[L["Dungeons & Raids"]] = {}

        -- Добавляем элементы из первой страницы подземелий
        for _, dungeon in ipairs(AtlasTW.Loot.DungeonsMenu1Data) do
            if dungeon.name and dungeon.lootpage then
                table.insert(dungeonsCategory[L["Dungeons & Raids"]], { { dungeon.name, dungeon.lootpage, "Table" }, })
            end
        end

        -- Добавляем элементы из второй страницы подземелий
        for _, dungeon in ipairs(AtlasTW.Loot.DungeonsMenu2Data) do
            if dungeon.name and dungeon.lootpage then
                table.insert(dungeonsCategory[L["Dungeons & Raids"]], { { dungeon.name, dungeon.lootpage, "Table" }, })
            end
        end

        table.insert(hewdropDown, dungeonsCategory)
    end

     -- 2. World (динамическая категория на основе AtlasTW.Loot.WorldBossesData)
    if AtlasTW and AtlasTW.Loot and AtlasTW.Loot.WorldBossesData then
        local worldCategory = {}
        worldCategory[L["World"]] = {}
        local rareMobsEntry = nil

        for _, boss in ipairs(AtlasTW.Loot.WorldBossesData) do
            -- Пропускаем пустые записи (разделители)
            if boss.name and boss.lootpage then
                if boss.name == L["Rare Mobs"] then
                    -- Сохраняем Rare Mobs для добавления в конец
                    rareMobsEntry = { { boss.name, boss.lootpage, "Table" }, }
                else
                    table.insert(worldCategory[L["World"]], { { boss.name, boss.lootpage, "Table" }, })
                end
            end
        end

        -- Добавляем Rare Mobs в конец списка
        if rareMobsEntry then
            table.insert(worldCategory[L["World"]], rareMobsEntry)
        end

        table.insert(hewdropDown, worldCategory)
    end

    -- 3. PvP Rewards (динамическая категория на основе AtlasTW.Loot.PvpMenuData)
    if AtlasTW and AtlasTW.Loot and AtlasTW.Loot.PvpMenuData then
        local pvpCategory = {}
        pvpCategory[L["PvP Rewards"]] = {}

        for _, item in ipairs(AtlasTW.Loot.PvpMenuData) do
            if item.name and item.lootpage then
                table.insert(pvpCategory[L["PvP Rewards"]], { { item.name, item.lootpage, "Table" }, })
            end
        end

        table.insert(hewdropDown, pvpCategory)
    end

    -- 4. Collections (динамическая категория на основе AtlasTW.Loot.SetsMenuData)
    if AtlasTW and AtlasTW.Loot and AtlasTW.Loot.SetsMenuData then
        local collectionsCategory = {}
        collectionsCategory[L["Collections"]] = {}

        for _, item in ipairs(AtlasTW.Loot.SetsMenuData) do
            if item.name and item.lootpage then
                table.insert(collectionsCategory[L["Collections"]], { { item.name, item.lootpage, "Table" }, })
            end
        end

        table.insert(hewdropDown, collectionsCategory)
    end

    -- 5. Factions (динамическая категория на основе AtlasTW.Loot.FactionsData)
    if AtlasTW and AtlasTW.Loot and AtlasTW.Loot.FactionsData then
        local factionsCategory = {}
        factionsCategory[L["Factions"]] = {}

        for _, faction in ipairs(AtlasTW.Loot.FactionsData) do
            if faction.name and faction.lootpage then
                table.insert(factionsCategory[L["Factions"]], { { faction.name, faction.lootpage, "Table" }, })
            end
        end

        table.insert(hewdropDown, factionsCategory)
    end

    -- 6. World Events (динамическая категория на основе AtlasTW.Loot.WorldEventsData)
    if AtlasTW and AtlasTW.Loot and AtlasTW.Loot.WorldEventsData then
        local worldEventsCategory = {}
        worldEventsCategory[L["World Events"]] = {}

        for _, event in ipairs(AtlasTW.Loot.WorldEventsData) do
            if event.name and event.lootpage then
                table.insert(worldEventsCategory[L["World Events"]], { { event.name, event.lootpage, "Table" }, })
            end
        end

        table.insert(hewdropDown, worldEventsCategory)
    end

    -- 7. Crafting (динамическая категория на основе AtlasTW.Loot.CraftingMenuData)
    if AtlasTW and AtlasTW.Loot and AtlasTW.Loot.CraftingMenuData then
        local craftingCategory = {}
        craftingCategory[L["Crafting"]] = {}

        for _, craft in ipairs(AtlasTW.Loot.CraftingMenuData) do
            if craft.name and craft.lootpage then
                table.insert(craftingCategory[L["Crafting"]], { { craft.name, craft.lootpage, "Table" }, })
            end
        end

        table.insert(hewdropDown, craftingCategory)
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