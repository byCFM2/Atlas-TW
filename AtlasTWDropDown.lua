---
--- AtlasTWDropDown.lua - Atlas dropdown menu system and navigation
--- 
--- This file contains the dropdown menu system for Atlas-TW navigation.
--- It handles category selection, zone filtering, sorting options,
--- and provides the interface for browsing Atlas content by various criteria.
--- 
--- Features:
--- - Dropdown menu creation and management
--- - Category and zone filtering
--- - Sort order configuration
--- - Navigation system integration
--- - Content organization and display
---
--- @compatible World of Warcraft 1.12
---

-- Namespace protection
--local _G = getfenv()
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local AtlasTWDropDown = {}

-- Constants
local COLORS = AtlasTW.Colors

-- Sort types enum
local SortType = {
    CONTINENT = L["Continent"],
    PARTYSIZE = L["Party Size"],
    LEVEL = L["Level"],
    TYPE = L["Type"],
    ALL = L["All"]
}

-- Main dropdown layout order
AtlasTWDropDown.SortOrder = {
    [1] = SortType.CONTINENT,
    [2] = SortType.PARTYSIZE,
    [3] = SortType.LEVEL,
    [4] = SortType.TYPE,
    [5] = SortType.ALL
}

-- Dungeon data
local Dungeons = {}

-- Helper to determine map type from its key and data
--- Determines the map type based on map key and data
--- @param mapKey string The key identifier for the map
--- @param mapData table The map data containing level, players, location info
--- @return string|nil The determined map type or nil if unknown
--- @usage local mapType = getMapType("RFC", mapData)

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

    -- Data convention in AtlasTW.InstanceData: MinLevel "1" is used for World Bosses
    if type(mapData.Level) == "table" and mapData.Level[1] == 1 then
        return "World Boss"
    end

    -- Do not require Continent field; determine type by common fields
    if mapData.Level and mapData.MaxPlayers and mapData.Location then
        local size = mapData.MaxPlayers
        if size and size > 5 then
            return "Raid"
        else
            return "Dungeon"
        end
    end

    return nil
end

--- Gets the continent for a given map data
--- Determines if instance is in Kalimdor or defaults to Eastern Kingdoms
--- @param mapData table The map data to check
--- @return string The continent name (localized)
--- @usage local continent = getContinent(mapData)

local function getContinent(mapData)
    -- Check if this instance is in Kalimdor (DLWest)
    if AtlasTW.InstanceData.DLWest and AtlasTW.InstanceData.DLWest.Bosses then
        for _, entry in pairs(AtlasTW.InstanceData.DLWest.Bosses) do
            if entry.name and mapData.Name == entry.name then
                return BZ["Kalimdor"]
            end
        end
    end
    -- Default to Eastern Kingdoms for all other instances
    return BZ["Eastern Kingdoms"]
end

-- Populate Dungeons from AtlasTW.InstanceData (now as a function for lazy rebuild)
--- Builds the dungeons table from AtlasTW.InstanceData
--- Populates the global Dungeons table with processed instance data
--- @return nil
--- @usage BuildDungeons()

local function BuildDungeons()
    Dungeons = {}
    if AtlasTW and AtlasTW.InstanceData then
        for mapKey, mapData in pairs(AtlasTW.InstanceData) do
            local mapType = getMapType(mapKey, mapData)
            if mapType then
                Dungeons[mapKey] = {
                    type = mapType,
                    continent = getContinent(mapData),
                    level = mapData.Level,
                    size = mapData.MaxPlayers or 40,
                }
            end
        end
    end
end

-- Build once in case data is already available
BuildDungeons()

-- Helper function to parse level range string like "10-20", "60+" or "60"
--- Parses level range data into min and max values
--- @param rangelevel table|number|string The level range data
--- @return number|nil, number|nil The minimum and maximum levels
--- @usage local min, max = getLevel({10, 20})

local function getLevel(rangelevel)
    if type(rangelevel) == "table" then
        return rangelevel[1], rangelevel[2]
    elseif type(rangelevel) == "number" then
        return rangelevel, rangelevel
    else
        return nil, nil
    end
end

-- Helper function to check if a dungeon's average level is within a category's range
--- Checks if a dungeon's average level falls within specified range
--- @param dungeonLevel table|number The dungeon's level data
--- @param categoryMin number The minimum level for the category
--- @param categoryMax number The maximum level for the category
--- @return boolean True if dungeon level is in range
--- @usage local inRange = IsInRange(dungeonLevel, 30, 39)

local function IsInRange(dungeonLevel, categoryMin, categoryMax)
    if not dungeonLevel then return false end
    local min, max = getLevel(dungeonLevel)
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
        { name = L["Instances level 15-29"], filter = function(d) return IsInRange(d.level, 1, 29) and (d.type == "Dungeon" or d.type == "Raid") end },
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
--- Creates a colored category name using WoW color codes
--- @param name string The category name to color
--- @param color string|nil The color code (defaults to GREEN)
--- @return string The colored category name
--- @usage local coloredName = CreateColoredCategory("Dungeons", COLORS.GREEN)

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
--- Processes category list and populates layout with filtered dungeons
--- @param layout table The layout table to populate
--- @param order table The order table to populate
--- @param categoryList table List of category names to process
--- @param categoryFilters table Filter functions for each category
--- @param dungeons table The dungeons data to filter
--- @return nil
--- @usage ProcessCategoryList(layout, order, categories, filters, dungeons)

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
--- Generates complete layout structure for dropdown menus
--- Creates layouts and layout orders for all sort types
--- @return table, table The layouts table and layoutOrder table
--- @usage local layouts, order = GenerateLayouts()

local function GenerateLayouts()
    local layouts = {}
    local layoutOrder = {}

    for _, sortName in ipairs(AtlasTWDropDown.SortOrder) do
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

-- Ensure layouts are generated (lazy init)
--- Ensures layouts are properly initialized and generated
--- Rebuilds dungeons and layouts if needed (lazy initialization)
--- @return nil
--- @usage AtlasTWDropDown:EnsureLayouts()

function AtlasTWDropDown:EnsureLayouts()
    if (not Dungeons) or (next(Dungeons) == nil and AtlasTW and AtlasTW.InstanceData) then
        BuildDungeons()
    end
    if not self.Layouts or not self.LayoutOrder or (next(self.LayoutOrder) == nil) then
        self.Layouts, self.LayoutOrder = GenerateLayouts()
    end
end

AtlasTWDropDown.Layouts, AtlasTWDropDown.LayoutOrder = GenerateLayouts()

-- API Functions
function AtlasTWDropDown:GetLayoutOrder(sortType)
    self:EnsureLayouts()
    return self.LayoutOrder[sortType] or {}
end

function AtlasTWDropDown:GetLayout(sortType)
    self:EnsureLayouts()
    return self.Layouts[sortType] or {}
end

-- Export to global namespace for compatibility with other addon files
AtlasTW_DropDownLayouts_Order = AtlasTWDropDown.LayoutOrder
AtlasTW_DropDownLayouts = AtlasTWDropDown.Layouts
AtlasTW_DropDownSortOrder = AtlasTWDropDown.SortOrder

--- Gets the layout order for dropdown items based on sort type
--- @param sortType string - the type of sorting to apply
--- @return table - ordered list of layout items
--- @usage local order = AtlasTW_DropDownGetLayoutOrder("alphabetical")

function AtlasTW_DropDownGetLayoutOrder(sortType)
    return AtlasTWDropDown:GetLayoutOrder(sortType)
end

--- Gets the layout configuration for dropdown based on sort type
--- @param sortType string - the type of sorting to apply
--- @return table - layout configuration data
--- @usage local layout = AtlasTW_DropDownGetLayout("level")

function AtlasTW_DropDownGetLayout(sortType)
    return AtlasTWDropDown:GetLayout(sortType)
end

--- Manually rebuilds dropdown layouts and data structures
--- Clears existing layouts and rebuilds from scratch
--- @usage AtlasTW_DropDownRebuild() -- call after data changes

function AtlasTW_DropDownRebuild()
    AtlasTWDropDown.Layouts, AtlasTWDropDown.LayoutOrder = nil, nil
    BuildDungeons()
    AtlasTWDropDown:EnsureLayouts()
end