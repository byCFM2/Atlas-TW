-- Namespace protection
local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local AtlasDropDown = {}

-- Constants
local COLORS = {
    GREEN = "|cff66cc33",
    WHITE = "|cffffffff",
    GRAY = "|cff999999",
    YELLOW = "|cffffff00"
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
local Dungeons = {
    -- Eastern Kingdoms
    BlackrockDepths = { continent = "Eastern Kingdoms", level = "50-60", size = 5, type = "Dungeon" },
    BlackrockSpireLower = { continent = "Eastern Kingdoms", level = "50-60", size = {5, 10}, type = "Dungeon" },
    BlackrockSpireUpper = { continent = "Eastern Kingdoms", level = "60", size = 10, type = "Raid" },
    BlackwingLair = { continent = "Eastern Kingdoms", level = "60", size = 40, type = "Raid" },
    GilneasCity = { continent = "Eastern Kingdoms", level = "40-50", size = 5, type = "Dungeon" },
    Gnomeregan = { continent = "Eastern Kingdoms", level = "20-30", size = 5, type = "Dungeon" },
    HateforgeQuarry = { continent = "Eastern Kingdoms", level = "50-60", size = 5, type = "Dungeon" },
    KarazhanCrypt = { continent = "Eastern Kingdoms", level = "50-60", size = 5, type = "Dungeon" },
    TowerofKarazhan = { continent = "Eastern Kingdoms", level = "60", size = 40, type = "Raid" },
    LowerKarazhan = { continent = "Eastern Kingdoms", level = "60", size = 10, type = "Raid" },
    MoltenCore = { continent = "Eastern Kingdoms", level = "60", size = 40, type = "Raid" },
    Naxxramas = { continent = "Eastern Kingdoms", level = "60", size = 40, type = "Raid" },
    Scholomance = { continent = "Eastern Kingdoms", level = "50-60", size = {5, 10}, type = "Dungeon" },
    ShadowfangKeep = { continent = "Eastern Kingdoms", level = "20-30", size = 5, type = "Dungeon" },
    SMArmory = { continent = "Eastern Kingdoms", level = "30-40", size = 5, type = "Dungeon" },
    SMCathedral = { continent = "Eastern Kingdoms", level = "30-40", size = 5, type = "Dungeon" },
    SMGraveyard = { continent = "Eastern Kingdoms", level = "30-40", size = 5, type = "Dungeon" },
    SMLibrary = { continent = "Eastern Kingdoms", level = "30-40", size = 5, type = "Dungeon" },
    StormwroughtRuins = { continent = "Eastern Kingdoms", level = "30-40", size = 5, type = "Dungeon" },
    StormwindVault = { continent = "Eastern Kingdoms", level = "50-60", size = 5, type = "Dungeon" },
    Stratholme = { continent = "Eastern Kingdoms", level = "50-60", size = {5, 10}, type = "Dungeon" },
    TheDeadmines = { continent = "Eastern Kingdoms", level = "10-20", size = 5, type = "Dungeon" },
    TheStockade = { continent = "Eastern Kingdoms", level = "10-20", size = 5, type = "Dungeon" },
    TheSunkenTemple = { continent = "Eastern Kingdoms", level = "40-50", size = 5, type = "Dungeon" },
    Uldaman = { continent = "Eastern Kingdoms", level = "30-40", size = 5, type = "Dungeon" },
    ZulGurub = { continent = "Eastern Kingdoms", level = "60", size = 20, type = "Raid" },

    -- Kalimdor
    BlackfathomDeeps = { continent = "Kalimdor", level = "20-30", size = 5, type = "Dungeon" },
    CavernsOfTimeBlackMorass = { continent = "Kalimdor", level = "50-60", size = 5, type = "Dungeon" },
    DireMaulEast = { continent = "Kalimdor", level = "50-60", size = 5, type = "Dungeon" },
    DireMaulNorth = { continent = "Kalimdor", level = "50-60", size = 5, type = "Dungeon" },
    DireMaulWest = { continent = "Kalimdor", level = "50-60", size = 5, type = "Dungeon" },
    EmeraldSanctum = { continent = "Kalimdor", level = "60", size = 40, type = "Raid" },
    Maraudon = { continent = "Kalimdor", level = "40-50", size = 5, type = "Dungeon" },
    OnyxiasLair = { continent = "Kalimdor", level = "60", size = 40, type = "Raid" },
    RagefireChasm = { continent = "Kalimdor", level = "10-20", size = 5, type = "Dungeon" },
    RazorfenDowns = { continent = "Kalimdor", level = "30-40", size = 5, type = "Dungeon" },
    RazorfenKraul = { continent = "Kalimdor", level = "20-30", size = 5, type = "Dungeon" },
    TheCrescentGrove = { continent = "Kalimdor", level = "30-40", size = 5, type = "Dungeon" },
    TheRuinsofAhnQiraj = { continent = "Kalimdor", level = "60", size = 20, type = "Raid" },
    TheTempleofAhnQiraj = { continent = "Kalimdor", level = "60", size = 40, type = "Raid" },
    WailingCaverns = { continent = "Kalimdor", level = "10-20", size = 5, type = "Dungeon" },
    ZulFarrak = { continent = "Kalimdor", level = "40-50", size = 5, type = "Dungeon" },

    -- World Bosses
    Azuregos = { type = "World Boss" },
    FourDragons = { type = "World Boss" },
    LordKazzak = { type = "World Boss" },
    Turtlhu = { type = "World Boss" },
    Nerubian = { type = "World Boss" },
    Reaver = { type = "World Boss" },
    Ostarius = { type = "World Boss" },
    Concavius = { type = "World Boss" },
    CowKing = { type = "World Boss" },
    Clackora = { type = "World Boss" },
    RareMobs = { type = "World Boss" },

    -- Special
    BlackfathomDeepsEnt = { type = "Entrance" },
    BlackrockMountainEnt = { type = "Entrance" },
    DireMaulEnt = { type = "Entrance" },
    GnomereganEnt = { type = "Entrance" },
    MaraudonEnt = { type = "Entrance" },
    SMEnt = { type = "Entrance" },
    TheDeadminesEnt = { type = "Entrance" },
    TheSunkenTempleEnt = { type = "Entrance" },
    UldamanEnt = { type = "Entrance" },
    WailingCavernsEnt = { type = "Entrance" },

    AlteracValleyNorth = { type = "Battleground" },
    AlteracValleySouth = { type = "Battleground" },
    ArathiBasin = { type = "Battleground" },
    WarsongGulch = { type = "Battleground" },

    DLEast = { type = "Dungeon Location" },
    DLWest = { type = "Dungeon Location" },

    FPAllianceEast = { type = "Flight Path" },
    FPAllianceWest = { type = "Flight Path" },
    FPHordeEast = { type = "Flight Path" },
    FPHordeWest = { type = "Flight Path" },

    TransportRoutes = { type = "Transport Route" }
}

-- Helper function to check if a table contains a value
local function tContains(tbl, val)
    for _, v in pairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

-- Category definitions
local Categories = {
    [SortType.CONTINENT] = {
        [L["Eastern Kingdoms Instances"]] = function(d) return d.continent == "Eastern Kingdoms" end,
        [L["Kalimdor Instances"]] = function(d) return d.continent == "Kalimdor" end,
    },
    [SortType.PARTYSIZE] = {
        [L["Instances for 5 Players"]] = function(d) return d.size == 5 or (type(d.size) == "table" and tContains(d.size, 5)) end,
        [L["Instances for 10 Players"]] = function(d) return d.size == 10 or (type(d.size) == "table" and tContains(d.size, 10)) end,
        [L["Instances for 20 Players"]] = function(d) return d.size == 20 end,
        [L["Instances for 40 Players"]] = function(d) return d.size == 40 end,
    },
    [SortType.LEVEL] = {
        [L["Instances level 10-20"]] = function(d) return d.level == "10-20" end,
        [L["Instances level 20-30"]] = function(d) return d.level == "20-30" end,
        [L["Instances level 30-40"]] = function(d) return d.level == "30-40" end,
        [L["Instances level 40-50"]] = function(d) return d.level == "40-50" end,
        [L["Instances level 50-60"]] = function(d) return d.level == "50-60" end,
        [L["Instances 60 level"]] = function(d) return d.level == "60" end,
    },
    [SortType.TYPE] = {
        [L["Dungeons"]] = function(d) return d.type == "Dungeon" end,
        [L["Raids"]] = function(d) return d.type == "Raid" end,
    },
    [SortType.ALL] = {
        [L["Showing all instances_1"]] = function(d) return d.type == "Dungeon" or d.type == "Raid" end,
        [L["Showing all instances_2"]] = function(d) return false end, -- Placeholder for split
    }
}

local CategoryOrder = {
    [SortType.CONTINENT] = {
        L["Eastern Kingdoms Instances"],
        L["Kalimdor Instances"],
    },
    [SortType.PARTYSIZE] = {
        L["Instances for 5 Players"],
        L["Instances for 10 Players"],
        L["Instances for 20 Players"],
        L["Instances for 40 Players"],
    },
    [SortType.LEVEL] = {
        L["Instances level 10-20"],
        L["Instances level 20-30"],
        L["Instances level 30-40"],
        L["Instances level 40-50"],
        L["Instances level 50-60"],
        L["Instances 60 level"],
    },
    [SortType.TYPE] = {
        L["Dungeons"],
        L["Raids"],
    },
    [SortType.ALL] = {
        L["Showing all instances_1"],
        L["Showing all instances_2"],
    }
}

-- Helper function to create colored category names
local function CreateColoredCategory(name, color)
    return (color or COLORS.GREEN) .. name
end

local SpecialCategories = {
    [L["World"]] = function(d) return d.type == "World Boss" end,
    [CreateColoredCategory(L["Entrances"])] = function(d) return d.type == "Entrance" end,
    [CreateColoredCategory(L["Battlegrounds"])] = function(d) return d.type == "Battleground" end,
    [CreateColoredCategory(L["Dungeon Locations"])] = function(d) return d.type == "Dungeon Location" end,
    [CreateColoredCategory(L["Flight Path Maps"])] = function(d) return d.type == "Flight Path" end,
    [CreateColoredCategory(L["Transport Routes"])] = function(d) return d.type == "Transport Route" end
}

local SpecialCategoryOrder = {
    L["World"],
    CreateColoredCategory(L["Entrances"]),
    CreateColoredCategory(L["Battlegrounds"]),
    CreateColoredCategory(L["Dungeon Locations"]),
    CreateColoredCategory(L["Flight Path Maps"]),
    CreateColoredCategory(L["Transport Routes"])
}

-- Generate Layouts
local function GenerateLayouts()
    local layouts = {}
    local layoutOrder = {}

    -- First, populate all categories for all sort types
    for _, sortName in ipairs(AtlasDropDown.SortOrder) do
        layouts[sortName] = {}
        layoutOrder[sortName] = {}
        local categories = Categories[sortName]
        local currentCategoryOrder = CategoryOrder[sortName]

        -- Regular categories in order
        if currentCategoryOrder then
            for _, catName in ipairs(currentCategoryOrder) do
                table.insert(layoutOrder[sortName], catName)
                layouts[sortName][catName] = {}
                local filterFunc = categories[catName]
                if filterFunc then
                    for dungeonName, data in pairs(Dungeons) do
                        if filterFunc(data) then
                            table.insert(layouts[sortName][catName], dungeonName)
                        end
                    end
                    table.sort(layouts[sortName][catName]) -- Sort dungeons alphabetically within each category
                end
            end
        end

        -- Special categories in order
        for _, catName in ipairs(SpecialCategoryOrder) do
            table.insert(layoutOrder[sortName], catName)
            layouts[sortName][catName] = {}
            local filterFunc = SpecialCategories[catName]
            if filterFunc then
                for dungeonName, data in pairs(Dungeons) do
                    if filterFunc(data) then
                        table.insert(layouts[sortName][catName], dungeonName)
                    end
                end
                table.sort(layouts[sortName][catName]) -- Sort dungeons alphabetically
            end
        end
    end

    -- Now, handle the special case for "All" category split
    local allDungeons = layouts[SortType.ALL][L["Showing all instances_1"]]
    local splitIndex = 40
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

    for sortType, layout in pairs(self.Layouts) do
        for category, dungeons in pairs(layout) do
            if type(dungeons) ~= "table" then
                table.insert(errors, string.format("Invalid dungeon list for %s -> %s", sortType, category))
            elseif table.getn(dungeons) == 0 and not (sortType == SortType.ALL and category == L["Showing all instances_2"]) then
                -- Allow empty second list for 'All' category
                table.insert(errors, string.format("Empty dungeon list for %s -> %s", sortType, category))
            end
        end
    end

    return errors
end

-- Export to global namespace for compatibility
Atlas_DropDownLayouts_Order = AtlasDropDown.LayoutOrder
Atlas_DropDownLayouts = AtlasDropDown.Layouts
AtlasTW_DropDownSortOrder = AtlasDropDown.SortOrder

-- Экспорт функций
function AtlasTW_DropDownValidateData()
    return AtlasDropDown:ValidateData()
end

function AtlasTW_DropDownGetLayoutOrder(sortType)
    return AtlasDropDown:GetLayoutOrder(sortType)
end

function AtlasTW_DropDownGetLayout(sortType)
    return AtlasDropDown:GetLayout(sortType)
end

-- Debug function
if AtlasTW and AtlasTW.DEBUGMODE then
    local errors = AtlasDropDown:ValidateData()
    if table.getn(errors) > 0 then
        DEFAULT_CHAT_FRAME:AddMessage("[Atlas] DropDown validation errors:")
        for _, error in ipairs(errors) do
            DEFAULT_CHAT_FRAME:AddMessage("  " .. error)
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("[Atlas] DropDown data validation passed")
    end
end