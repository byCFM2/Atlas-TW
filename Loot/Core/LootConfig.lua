--Instance required libraries
AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}
local L = AtlasTW.Local

-- Cache for localized strings (optimization)
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
-- Helper function to count maximum numeric index (sparse array support)
local function GetMaxNumericIndex(tbl)
    local maxIndex = 0
    for k, v in pairs(tbl) do
        if type(k) == "number" and k > maxIndex and v then
            maxIndex = k
        end
    end
    return maxIndex
end

-- Helper function for processing category data (optimization)
local function ProcessCategoryData(data, categoryName, specialHandler)
    if not data then return nil end

    local category = {}
    category[categoryName] = {}
    local categoryList = category[categoryName]

    if specialHandler then
        return specialHandler(data, category, categoryList)
    else
        -- Standard processing with sparse array support
        local maxIndex = GetMaxNumericIndex(data)
        for i = 1, maxIndex do
            local item = data[i]
            if item and item.name and item.lootpage then
                table.insert(categoryList, { { item.name, item.lootpage } })
            end
        end
    end

    return category
end

-- Special handler for World category (optimization)
local function ProcessWorldCategory(data, category, categoryList)
    local rareMobsEntry = nil
    local maxIndex = GetMaxNumericIndex(data)

    for i = 1, maxIndex do
        local boss = data[i]
        if boss and boss.name and boss.lootpage then
            if boss.name == LocalizedStrings.RareMobs then
                rareMobsEntry = { { boss.name, boss.lootpage } }
            else
                table.insert(categoryList, { { boss.name, boss.lootpage } })
            end
        end
    end

    if rareMobsEntry then
        table.insert(categoryList, rareMobsEntry)
    end

    return category
end

-- Special handler for Dungeons category (optimization)
local function ProcessDungeonsCategory(menuData)
    if not menuData then return nil end

    local category = {}
    category[LocalizedStrings.DungeonsRaids] = {}
    local categoryList = category[LocalizedStrings.DungeonsRaids]

    -- Combine processing of two arrays into one loop with sparse array support
    local totalCount = GetMaxNumericIndex(menuData)
    for i = 1, totalCount do
        local dung = menuData[i]
        if dung and dung.name and dung.lootpage then
            table.insert(categoryList, { { dung.name, dung.lootpage } }) --dung.name_orig or 
        end
    end
    return category
end

-- Optimized function for dynamic generation of AtlasLoot_HewdropDown
local function GenerateHewdropDown()

    local MenuData = AtlasTW.MenuData
    local hewdropDown = {}
    local category

    -- 1. Dungeons & Raids (optimized processing)
    category = ProcessDungeonsCategory(MenuData.Dungeons)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 2. World (optimized processing)
    category = ProcessCategoryData(MenuData.WorldBosses, LocalizedStrings.World, ProcessWorldCategory)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 3. PvP Rewards (optimized processing)
    category = ProcessCategoryData(MenuData.PVP, LocalizedStrings.PvPRewards)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 4. Collections (optimized processing)
    category = ProcessCategoryData(MenuData.Sets, LocalizedStrings.Collections)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 5. Factions (optimized processing)
    category = ProcessCategoryData(MenuData.Factions, LocalizedStrings.Factions)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 6. World Events (optimized processing)
    category = ProcessCategoryData(MenuData.WorldEvents, LocalizedStrings.WorldEvents)
    if category then
        table.insert(hewdropDown, category)
    end

    -- 7. Crafting (optimized processing)
    category = ProcessCategoryData(MenuData.Crafting, LocalizedStrings.Crafting)
    if category then
        table.insert(hewdropDown, category)
    end

    return hewdropDown
end


-- Generate data on load (with lazy initialization)
do
    if not AtlasLoot_HewdropDown then
        AtlasLoot_HewdropDown = GenerateHewdropDown()
    end
end