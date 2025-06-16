-- Namespace protection
local _G = getfenv()
local AtlasDropDown = {}

-- Constants
local COLORS = {
    GREEN = "|cff66cc33",
    WHITE = "|cffffffff",
    GRAY = "|cff999999",
    YELLOW = "|cffffff00"
}

-- Configuration tables
local SORT_TYPES = {
    CONTINENT = 1,
    PARTYSIZE = 2,
    LEVEL = 3,
    TYPE = 4,
    ALL = 5
}

-- Main dropdown layout order
AtlasDropDown.SortOrder = {
    [SORT_TYPES.CONTINENT] = ATLAS_DDL_CONTINENT,
    [SORT_TYPES.PARTYSIZE] = ATLAS_DDL_PARTYSIZE,
    [SORT_TYPES.LEVEL] = ATLAS_DDL_LEVEL,
    [SORT_TYPES.TYPE] = ATLAS_DDL_TYPE,
    [SORT_TYPES.ALL] = ATLAS_DDL_ALL
}

-- Dungeon data organized by categories
local DUNGEON_DATA = {
    -- Eastern Kingdoms dungeons
    EASTERN_KINGDOMS = {
        "BlackrockDepths", "BlackrockSpireLower", "BlackrockSpireUpper",
        "BlackwingLair", "GilneasCity", "Gnomeregan", "HateforgeQuarry",
        "KarazhanCrypt", "TowerofKarazhan", "LowerKarazhan", "MoltenCore",
        "Naxxramas", "Scholomance", "ShadowfangKeep", "SMArmory",
        "SMCathedral", "SMGraveyard", "SMLibrary", "StormwroughtRuins",
        "StormwindVault", "Stratholme", "TheDeadmines", "TheStockade",
        "TheSunkenTemple", "Uldaman", "ZulGurub"
    },

    -- Kalimdor dungeons
    KALIMDOR = {
        "BlackfathomDeeps", "CavernsOfTimeBlackMorass", "DireMaulEast",
        "DireMaulNorth", "DireMaulWest", "EmeraldSanctum", "Maraudon",
        "OnyxiasLair", "RagefireChasm", "RazorfenDowns", "RazorfenKraul",
        "TheCrescentGrove", "TheRuinsofAhnQiraj", "TheTempleofAhnQiraj",
        "WailingCaverns", "ZulFarrak"
    },

    -- World bosses
    WORLD_BOSSES = {
        "Azuregos", "FourDragons", "LordKazzak", "Turtlhu", "Nerubian",
        "Reaver", "Ostarius", "Concavius", "CowKing", "Clackora", "RareMobs"
    },

    -- Special categories
    ENTRANCES = {
        "BlackfathomDeepsEnt", "BlackrockMountainEnt", "DireMaulEnt",
        "GnomereganEnt", "MaraudonEnt", "SMEnt", "TheDeadminesEnt",
        "TheSunkenTempleEnt", "UldamanEnt", "WailingCavernsEnt"
    },

    BATTLEGROUNDS = {
        "AlteracValleyNorth", "AlteracValleySouth", "ArathiBasin", "WarsongGulch"
    },

    DUNGEON_LOCATIONS = { "DLEast", "DLWest" },

    FLIGHT_PATHS = {
        "FPAllianceEast", "FPAllianceWest", "FPHordeEast", "FPHordeWest"
    },

    TRANSPORT_ROUTES = { "TransportRoutes" }
}

-- Level-based categorization
local LEVEL_CATEGORIES = {
    ["10-20"] = { "RagefireChasm", "TheDeadmines", "TheStockade", "WailingCaverns" },
    ["20-30"] = { "BlackfathomDeeps", "Gnomeregan", "RazorfenKraul", "ShadowfangKeep" },
    ["30-40"] = {
        "RazorfenDowns", "SMArmory", "SMCathedral", "SMGraveyard",
        "SMLibrary", "StormwroughtRuins", "TheCrescentGrove", "Uldaman"
    },
    ["40-50"] = { "GilneasCity", "Maraudon", "TheSunkenTemple", "ZulFarrak" },
    ["50-60"] = {
        "BlackrockDepths", "BlackrockSpireLower", "CavernsOfTimeBlackMorass",
        "DireMaulEast", "DireMaulNorth", "DireMaulWest", "HateforgeQuarry",
        "KarazhanCrypt", "Scholomance", "StormwindVault", "Stratholme"
    },
    ["60"] = {
        "BlackrockSpireUpper", "TheRuinsofAhnQiraj", "ZulGurub",
        "LowerKarazhan", "OnyxiasLair", "MoltenCore", "EmeraldSanctum",
        "BlackwingLair", "TheTempleofAhnQiraj", "Naxxramas", "TowerofKarazhan"
    }
}

-- Party size categorization
local PARTY_SIZE_CATEGORIES = {
    [5] = {
        "BlackrockDepths", "CavernsOfTimeBlackMorass", "DireMaulEast",
        "DireMaulNorth", "DireMaulWest", "GilneasCity", "Scholomance",
        "StormwindVault", "Stratholme", "KarazhanCrypt", "BlackrockSpireLower",
        "Gnomeregan", "HateforgeQuarry", "Maraudon", "TheDeadmines",
        "RagefireChasm", "RazorfenDowns", "RazorfenKraul", "ShadowfangKeep",
        "SMArmory", "SMCathedral", "SMGraveyard", "SMLibrary",
        "StormwroughtRuins", "TheCrescentGrove", "TheStockade",
        "TheSunkenTemple", "Uldaman", "WailingCaverns", "ZulFarrak"
    },
    [10] = {
        "BlackrockSpireLower", "BlackrockSpireUpper", "LowerKarazhan",
        "Scholomance", "Stratholme"
    },
    [20] = { "TheRuinsofAhnQiraj", "ZulGurub" },
    [40] = {
        "MoltenCore", "OnyxiasLair", "EmeraldSanctum", "BlackwingLair",
        "TheTempleofAhnQiraj", "Naxxramas", "TowerofKarazhan"
    }
}

-- Type-based categorization
local TYPE_CATEGORIES = {
    DUNGEONS = {
        "BlackfathomDeeps", "BlackrockDepths", "BlackrockSpireLower",
        "CavernsOfTimeBlackMorass", "DireMaulEast", "DireMaulNorth",
        "DireMaulWest", "GilneasCity", "Gnomeregan", "HateforgeQuarry",
        "KarazhanCrypt", "Maraudon", "RagefireChasm", "RazorfenDowns",
        "RazorfenKraul", "Scholomance", "ShadowfangKeep", "SMArmory",
        "SMCathedral", "SMGraveyard", "SMLibrary", "StormwroughtRuins",
        "StormwindVault", "Stratholme", "TheDeadmines", "TheCrescentGrove",
        "TheStockade", "TheSunkenTemple", "Uldaman", "WailingCaverns", "ZulFarrak"
    },
    RAIDS = {
        "BlackrockSpireUpper", "TheRuinsofAhnQiraj", "ZulGurub",
        "LowerKarazhan", "OnyxiasLair", "MoltenCore", "EmeraldSanctum",
        "BlackwingLair", "TheTempleofAhnQiraj", "Naxxramas", "TowerofKarazhan"
    }
}

-- Helper function to create colored category names
local function CreateColoredCategory(name, color)
    return (color or COLORS.GREEN) .. name
end

-- Helper function to create standard category layout
local function CreateStandardLayout(mainCategories, includeSpecial)
    local layout = {}

    -- Add main categories
    for i, category in ipairs(mainCategories) do
        layout[i] = category
    end

    -- Add special categories if requested
    if includeSpecial then
        local baseIndex = table.getn(mainCategories)
        layout[baseIndex + 1] = ATLAS_DDL_WORLD
        layout[baseIndex + 2] = CreateColoredCategory(ATLAS_DDL_TYPE_ENTRANCE)
        layout[baseIndex + 3] = CreateColoredCategory(ATLAS_DDL_BGS)
        layout[baseIndex + 4] = CreateColoredCategory(ATLAS_DDL_DUNGEON_LOCATIONS)
        layout[baseIndex + 5] = CreateColoredCategory(ATLAS_DDL_FLIGHT_PATHS)
        layout[baseIndex + 6] = CreateColoredCategory(ATLAS_DDL_TRANSPORT_ROUTES)
    end

    return layout
end

-- Main layout configuration
AtlasDropDown.LayoutOrder = {
    [ATLAS_DDL_CONTINENT] = CreateStandardLayout({
        ATLAS_DDL_CONTINENT_EASTERN,
        ATLAS_DDL_CONTINENT_KALIMDOR
    }, true),

    [ATLAS_DDL_PARTYSIZE] = CreateStandardLayout({
        ATLAS_DDL_PARTYSIZE_5,
        ATLAS_DDL_PARTYSIZE_10,
        ATLAS_DDL_PARTYSIZE_20,
        ATLAS_DDL_PARTYSIZE_40
    }, true),

    [ATLAS_DDL_LEVEL] = CreateStandardLayout({
        ATLAS_DDL_LEVEL_10TO20,
        ATLAS_DDL_LEVEL_20TO30,
        ATLAS_DDL_LEVEL_30TO40,
        ATLAS_DDL_LEVEL_40TO50,
        ATLAS_DDL_LEVEL_50TO60,
        ATLAS_DDL_LEVEL_60
    }, true),

    [ATLAS_DDL_TYPE] = CreateStandardLayout({
        ATLAS_DDL_TYPE_DUNGEONS,
        ATLAS_DDL_TYPE_RAIDS
    }, true),

    [ATLAS_DDL_ALL] = CreateStandardLayout({
        ATLAS_DDL_ALL_MENU1,
        ATLAS_DDL_ALL_MENU2
    }, true)
}

-- Helper function to get special categories
local function GetSpecialCategories()
    return {
        [CreateColoredCategory(ATLAS_DDL_TYPE_ENTRANCE)] = DUNGEON_DATA.ENTRANCES,
        [CreateColoredCategory(ATLAS_DDL_BGS)] = DUNGEON_DATA.BATTLEGROUNDS,
        [CreateColoredCategory(ATLAS_DDL_DUNGEON_LOCATIONS)] = DUNGEON_DATA.DUNGEON_LOCATIONS,
        [CreateColoredCategory(ATLAS_DDL_FLIGHT_PATHS)] = DUNGEON_DATA.FLIGHT_PATHS,
        [CreateColoredCategory(ATLAS_DDL_TRANSPORT_ROUTES)] = DUNGEON_DATA.TRANSPORT_ROUTES
    }
end

-- Main layout data structure
AtlasDropDown.Layouts = {
    [ATLAS_DDL_CONTINENT] = {
        [ATLAS_DDL_CONTINENT_EASTERN] = DUNGEON_DATA.EASTERN_KINGDOMS,
        [ATLAS_DDL_CONTINENT_KALIMDOR] = DUNGEON_DATA.KALIMDOR,
        [ATLAS_DDL_WORLD] = DUNGEON_DATA.WORLD_BOSSES
    },

    [ATLAS_DDL_PARTYSIZE] = {
        [ATLAS_DDL_PARTYSIZE_5] = PARTY_SIZE_CATEGORIES[5],
        [ATLAS_DDL_PARTYSIZE_10] = PARTY_SIZE_CATEGORIES[10],
        [ATLAS_DDL_PARTYSIZE_20] = PARTY_SIZE_CATEGORIES[20],
        [ATLAS_DDL_PARTYSIZE_40] = PARTY_SIZE_CATEGORIES[40],
        [ATLAS_DDL_WORLD] = DUNGEON_DATA.WORLD_BOSSES
    },

    [ATLAS_DDL_LEVEL] = {
        [ATLAS_DDL_LEVEL_10TO20] = LEVEL_CATEGORIES["10-20"],
        [ATLAS_DDL_LEVEL_20TO30] = LEVEL_CATEGORIES["20-30"],
        [ATLAS_DDL_LEVEL_30TO40] = LEVEL_CATEGORIES["30-40"],
        [ATLAS_DDL_LEVEL_40TO50] = LEVEL_CATEGORIES["40-50"],
        [ATLAS_DDL_LEVEL_50TO60] = LEVEL_CATEGORIES["50-60"],
        [ATLAS_DDL_LEVEL_60] = LEVEL_CATEGORIES["60"],
        [ATLAS_DDL_WORLD] = DUNGEON_DATA.WORLD_BOSSES
    },

    [ATLAS_DDL_TYPE] = {
        [ATLAS_DDL_TYPE_DUNGEONS] = TYPE_CATEGORIES.DUNGEONS,
        [ATLAS_DDL_TYPE_RAIDS] = TYPE_CATEGORIES.RAIDS,
        [ATLAS_DDL_WORLD] = DUNGEON_DATA.WORLD_BOSSES
    },

    [ATLAS_DDL_ALL] = {
        [ATLAS_DDL_ALL_MENU1] = {
            "RagefireChasm", "WailingCaverns", "TheDeadmines", "ShadowfangKeep",
            "BlackfathomDeeps", "TheStockade", "Gnomeregan", "RazorfenKraul",
            "TheCrescentGrove", "SMGraveyard", "SMLibrary", "SMArmory",
            "SMCathedral", "RazorfenDowns", "Uldaman", "GilneasCity",
            "ZulFarrak", "Maraudon", "HateforgeQuarry", "TheSunkenTemple",
            "BlackrockDepths", "DireMaulEast", "DireMaulWest", "DireMaulNorth",
            "CavernsOfTimeBlackMorass", "Scholomance", "StormwroughtRuins",
            "StormwindVault", "Stratholme"
        },
        [ATLAS_DDL_ALL_MENU2] = {
            "KarazhanCrypt", "LowerKarazhan", "BlackrockSpireLower",
            "BlackrockSpireUpper", "ZulGurub", "TheRuinsofAhnQiraj",
            "MoltenCore", "OnyxiasLair", "BlackwingLair", "TheTempleofAhnQiraj",
            "EmeraldSanctum", "Naxxramas", "TowerofKarazhan"
        },
        [ATLAS_DDL_WORLD] = DUNGEON_DATA.WORLD_BOSSES
    }
}

-- Add special categories to all layouts
for _, layout in pairs(AtlasDropDown.Layouts) do
    local specialCategories = GetSpecialCategories()
    for categoryName, dungeons in pairs(specialCategories) do
        layout[categoryName] = dungeons
    end
end

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
            elseif table.getn(dungeons) == 0 then
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