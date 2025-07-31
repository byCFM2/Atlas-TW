-- Refactored AtlasDropDown.lua

-- Namespace protection
--local _G = getfenv()
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local AtlasDropDown = {}

-- Constants
local COLORS = {
    GREEN = "|cff66cc33",
    WHITE = "|cffffffff",
    GRAY = "|cff999999",
    YELLOW = "|cffffff00",
    RED = "|cffff0000"
}

-- Sort types enum
local SortType = {
    CONTINENT = L["Continent"],
    PARTYSIZE = L["Party Size"],
    LEVEL = L["Level"],
    TYPE = L["Type"],
    ALL = L["All"]
}

-- Main dropdown layout order
AtlasDropDown.SortOrder = {
    [1] = SortType.CONTINENT,
    [2] = SortType.PARTYSIZE,
    [3] = SortType.LEVEL,
    [4] = SortType.TYPE,
    [5] = SortType.ALL
}

-- Dungeon data
local Dungeons = {}

-- Helper to determine map type from its key and data
local function getMapType(mapKey, mapData)
    local patterns = {
        { key = "TransportRoutes", type = "Transport Route", exact = true },
        { pattern = "Ent$", type = "Entrance" },
        { pattern = "^DL", type = "Dungeon Location" },
        { pattern = "^FP", type = "Flight Path" },
        { pattern = "^BG", type = "Battleground" },
    }

    for _, p in ipairs(patterns) do
        if (p.exact and mapKey == p.key) or (not p.exact and string.find(mapKey, p.pattern)) then
            return p.type
        end
    end

    -- Data convention in AtlasMaps: MinLevel "1" is used for World Bosses
    if mapData.MinLevel == "1" then
        return "World Boss"
    end

    if mapData.Continent and mapData.LevelRange and mapData.PlayerLimit and mapData.ZoneName then
        local size = tonumber(mapData.PlayerLimit)
        if size and size > 5 then
            return "Raid"
        else
            return "Dungeon"
        end
    end

    return nil
end

-- Populate Dungeons from AtlasMaps
if AtlasMaps then
    for mapKey, mapData in pairs(AtlasMaps) do
        local mapType = getMapType(mapKey, mapData)

        if mapType then
            Dungeons[mapKey] = {
                type = mapType,
                continent = mapData.Continent,
                level = mapData.LevelRange,
                size = tonumber(mapData.PlayerLimit)
            }
        else
            if AtlasTW and AtlasTW.DEBUGMODE then
                DEFAULT_CHAT_FRAME:AddMessage(string.format("|cffffff00[Atlas] Unknown type for map: %s|r", mapKey))
            end
        end
    end
end

-- Helper function to parse level range string like "10-20", "60+" or "60"
local function ParseLevelRange(rangeStr)
    if type(rangeStr) ~= "string" then return nil, nil end

    -- e.g. 60+
    local plusPos = string.find(rangeStr, "+")
    if plusPos then
        local min = tonumber(string.sub(rangeStr, 1, plusPos - 1))
        if min then
            return min, 60 -- Treat as 60 for calculation
        end
    end
    -- e.g. 10-20
    local sepPos = string.find(rangeStr, "-")
    if sepPos then
        local min = tonumber(string.sub(rangeStr, 1, sepPos - 1))
        local max = tonumber(string.sub(rangeStr, sepPos + 1))
        if min and max then
            return min, max
        end
    end

    -- e.g. 60
    local singleLevel = tonumber(rangeStr)
    if singleLevel then
        return singleLevel, singleLevel
    end

    return nil, nil
end

-- Helper function to check if a dungeon's average level is within a category's range
local function IsInRange(dungeonLevel, categoryMin, categoryMax)
    if not dungeonLevel then return false end
    local min, max = ParseLevelRange(dungeonLevel)
    if not min or not max then return false end
    local avgLevel = floor((min + max) / 2)
    return (avgLevel >= categoryMin and avgLevel <= categoryMax)
end

-- Category definitions
local CategoryDefinitions = {
    [SortType.CONTINENT] = {
        { name = L["Eastern Kingdoms Instances"], filter = function(d) return d.continent == BZ["Eastern Kingdoms"] and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Kalimdor Instances"], filter = function(d) return d.continent == BZ["Kalimdor"] and (d.type == "Dungeon" or d.type == "Raid") end },
    },
    [SortType.PARTYSIZE] = {
        { name = L["Instances for 5 Players"], filter = function(d) return d.size == 5 and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Instances for 10 Players"], filter = function(d) return d.size == 10 and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Instances for 20 Players"], filter = function(d) return d.size == 20 and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Instances for 40 Players"], filter = function(d) return d.size == 40 and (d.type == "Dungeon" or d.type == "Raid") end },
    },
    [SortType.LEVEL] = {
        { name = L["Instances level 15-29"], filter = function(d) return IsInRange(d.level, 15, 29) and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Instances level 30-39"], filter = function(d) return IsInRange(d.level, 30, 39) and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Instances level 40-49"], filter = function(d) return IsInRange(d.level, 40, 49) and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Instances level 50-59"], filter = function(d) return IsInRange(d.level, 50, 59) and (d.type == "Dungeon" or d.type == "Raid") end },
        { name = L["Instances 60 level"], filter = function(d) return IsInRange(d.level, 60, 60) and (d.type == "Dungeon" or d.type == "Raid") end },
    },
    [SortType.TYPE] = {
        { name = L["Dungeons"], filter = function(d) return d.type == "Dungeon" end },
        { name = L["Raids"], filter = function(d) return d.type == "Raid" end },
    },
    [SortType.ALL] = {
        { name = L["Showing all instances_1"], filter = function(d) return d.type == "Dungeon" or d.type == "Raid" end },
        { name = L["Showing all instances_2"], filter = function() return false end }, -- Placeholder for split
    }
}

local Categories = {}
local CategoryOrder = {}

for sortType, definitions in pairs(CategoryDefinitions) do
    Categories[sortType] = {}
    CategoryOrder[sortType] = {}
    for _, def in ipairs(definitions) do
        Categories[sortType][def.name] = def.filter
        table.insert(CategoryOrder[sortType], def.name)
    end
end

-- Helper function to create colored category names
local function CreateColoredCategory(name, color)
    return (color or COLORS.GREEN) .. name
end

local SpecialCategoryDefinitions = {
    { name = L["World"], filter = function(d) return d.type == "World Boss" end },
    { name = L["Entrances"], filter = function(d) return d.type == "Entrance" end, colored = true },
    { name = L["Battlegrounds"], filter = function(d) return d.type == "Battleground" end, colored = true },
    { name = L["Dungeon Locations"], filter = function(d) return d.type == "Dungeon Location" end, colored = true },
    { name = L["Flight Path Maps"], filter = function(d) return d.type == "Flight Path" end, colored = true },
    { name = L["Transport Routes"], filter = function(d) return d.type == "Transport Route" end, colored = true }
}

local SpecialCategories = {}
local SpecialCategoryOrder = {}

for _, def in ipairs(SpecialCategoryDefinitions) do
    local categoryName = def.colored and CreateColoredCategory(def.name) or def.name
    SpecialCategories[categoryName] = def.filter
    table.insert(SpecialCategoryOrder, categoryName)
end

-- Helper function to process a list of categories and populate the layout
local function ProcessCategoryList(layout, order, categoryList, categoryFilters, dungeons)
    for _, catName in ipairs(categoryList) do
        table.insert(order, catName)
        layout[catName] = {}
        local filterFunc = categoryFilters[catName]
        if filterFunc then
            for dungeonName, data in pairs(dungeons) do
                if filterFunc(data) then
                    table.insert(layout[catName], dungeonName)
                end
            end
            table.sort(layout[catName])
        end
    end
end

-- Generate Layouts for the dropdown menu
local function GenerateLayouts()
    local layouts = {}
    local layoutOrder = {}

    for _, sortName in ipairs(AtlasDropDown.SortOrder) do
        layouts[sortName] = {}
        layoutOrder[sortName] = {}

        -- Add regular categories (Dungeons/Raids sorted by different criteria)
        if CategoryOrder[sortName] then
            ProcessCategoryList(layouts[sortName], layoutOrder[sortName], CategoryOrder[sortName], Categories[sortName], Dungeons)
        end

        -- Add special categories (Entrances, BGs, etc.) to all sort types
        ProcessCategoryList(layouts[sortName], layoutOrder[sortName], SpecialCategoryOrder, SpecialCategories, Dungeons)
    end

    -- Special handling for the "All" category to split it into two columns if it's too long
    local allDungeons = layouts[SortType.ALL][L["Showing all instances_1"]]
    if allDungeons then
        -- This split point can be adjusted if needed
        local splitIndex = 40
        if table.getn(allDungeons) > splitIndex then
            local firstList = {}
            local secondList = {}

            for i = 1, table.getn(allDungeons) do
                if i <= splitIndex then
                    table.insert(firstList, allDungeons[i])
                else
                    table.insert(secondList, allDungeons[i])
                end
            end

            layouts[SortType.ALL][L["Showing all instances_1"]] = firstList
            layouts[SortType.ALL][L["Showing all instances_2"]] = secondList
        end
    end

    return layouts, layoutOrder
end

AtlasDropDown.Layouts, AtlasDropDown.LayoutOrder = GenerateLayouts()

-- API Functions
function AtlasDropDown:GetLayoutOrder(sortType)
    return self.LayoutOrder[sortType] or {}
end

function AtlasDropDown:GetLayout(sortType)
    return self.Layouts[sortType] or {}
end

function AtlasDropDown:ValidateData()
    local errors = {}
    local warnings = {}

    for sortType, layout in pairs(self.Layouts) do
        for category, dungeons in pairs(layout) do
            if type(dungeons) ~= "table" then
                table.insert(errors, string.format("Invalid dungeon list for %s -> %s", sortType, category))
            -- A category being empty is not necessarily an error, but a warning might be useful for debugging
            elseif table.getn(dungeons) == 0 then
                -- Exclude the placeholder category from warnings
                if category ~= L["Showing all instances_2"] then
                    table.insert(warnings, string.format("Empty dungeon list for %s -> %s", sortType, category))
                end
            end
        end
    end

    return errors, warnings
end

-- Export to global namespace for compatibility with other addon files
Atlas_DropDownLayouts_Order = AtlasDropDown.LayoutOrder
Atlas_DropDownLayouts = AtlasDropDown.Layouts
AtlasTW_DropDownSortOrder = AtlasDropDown.SortOrder

-- Export functions
function AtlasTW_DropDownValidateData()
    return AtlasDropDown:ValidateData()
end

function AtlasTW_DropDownGetLayoutOrder(sortType)
    return AtlasDropDown:GetLayoutOrder(sortType)
end

function AtlasTW_DropDownGetLayout(sortType)
    return AtlasDropDown:GetLayout(sortType)
end

-- Debug function to print validation results on load
if AtlasTW and AtlasTW.DEBUGMODE then
    local errors, warnings = AtlasDropDown:ValidateData()
    if table.getn(errors) > 0 then
        DEFAULT_CHAT_FRAME:AddMessage(COLORS.RED .. "[Atlas] DropDown validation errors:|r")
        for _, error in ipairs(errors) do
            DEFAULT_CHAT_FRAME:AddMessage("  - " .. error)
        end
    end
    if table.getn(warnings) > 0 then
        DEFAULT_CHAT_FRAME:AddMessage(COLORS.YELLOW .. "[Atlas] DropDown validation warnings:|r")
        for _, warning in ipairs(warnings) do
            DEFAULT_CHAT_FRAME:AddMessage("  - " .. warning)
        end
    end
    if table.getn(errors) == 0 and table.getn(warnings) == 0 then
        DEFAULT_CHAT_FRAME:AddMessage(COLORS.GREEN .. "[Atlas] DropDown data validation passed.|r")
    end
end