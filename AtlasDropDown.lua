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
    [SORT_TYPES.CONTINENT] = L["Continent"],
    [SORT_TYPES.PARTYSIZE] = L["Party Size"],
    [SORT_TYPES.LEVEL] = L["Level"],
    [SORT_TYPES.TYPE] = L["Type"],
    [SORT_TYPES.ALL] = L["All"]
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
        layout[baseIndex + 1] = L["World"]
        layout[baseIndex + 2] = CreateColoredCategory(L["Entrances"])
        layout[baseIndex + 3] = CreateColoredCategory(L["Battlegrounds"])
        layout[baseIndex + 4] = CreateColoredCategory(L["Dungeon Locations"])
        layout[baseIndex + 5] = CreateColoredCategory(L["Flight Path Maps"])
        layout[baseIndex + 6] = CreateColoredCategory(L["Transport Routes"])
    end

    return layout
end

-- Main layout configuration
AtlasDropDown.LayoutOrder = {
    [L["Continent"]] = CreateStandardLayout({
        L["Eastern Kingdoms Instances"],
        L["Kalimdor Instances"]
    }, true),

    [L["Party Size"]] = CreateStandardLayout({
        L["Instances for 5 Players"],
        L["Instances for 10 Players"],
        L["Instances for 20 Players"],
        L["Instances for 40 Players"]
    }, true),

    [L["Level"]] = CreateStandardLayout({
        L["Instances level 10-20"],
        L["Instances level 20-30"],
        L["Instances level 30-40"],
        L["Instances level 40-50"],
        L["Instances level 50-60"],
        L["Instances 60 level"]
    }, true),

    [L["Type"]] = CreateStandardLayout({
        L["Dungeons"],
        L["Raids"]
    }, true),

    [L["All"]] = CreateStandardLayout({
        L["Showing all instances_1"],
        L["Showing all instances_2"]
    }, true)
}

-- Helper function to get special categories
local function GetSpecialCategories()
    return {
        [CreateColoredCategory(L["Entrances"])] = DUNGEON_DATA.ENTRANCES,
        [CreateColoredCategory(L["Battlegrounds"])] = DUNGEON_DATA.BATTLEGROUNDS,
        [CreateColoredCategory(L["Dungeon Locations"])] = DUNGEON_DATA.DUNGEON_LOCATIONS,
        [CreateColoredCategory(L["Flight Path Maps"])] = DUNGEON_DATA.FLIGHT_PATHS,
        [CreateColoredCategory(L["Transport Routes"])] = DUNGEON_DATA.TRANSPORT_ROUTES
    }
end

-- Main layout data structure
AtlasDropDown.Layouts = {
    [L["Continent"]] = {
        [L["Eastern Kingdoms Instances"]] = DUNGEON_DATA.EASTERN_KINGDOMS,
        [L["Kalimdor Instances"]] = DUNGEON_DATA.KALIMDOR,
        [L["World"]] = DUNGEON_DATA.WORLD_BOSSES
    },

    [L["Party Size"]] = {
        [L["Instances for 5 Players"]] = PARTY_SIZE_CATEGORIES[5],
        [L["Instances for 10 Players"]] = PARTY_SIZE_CATEGORIES[10],
        [L["Instances for 20 Players"]] = PARTY_SIZE_CATEGORIES[20],
        [L["Instances for 40 Players"]] = PARTY_SIZE_CATEGORIES[40],
        [L["World"]] = DUNGEON_DATA.WORLD_BOSSES
    },

    [L["Level"]] = {
        [L["Instances level 10-20"]] = LEVEL_CATEGORIES["10-20"],
        [L["Instances level 20-30"]] = LEVEL_CATEGORIES["20-30"],
        [L["Instances level 30-40"]] = LEVEL_CATEGORIES["30-40"],
        [L["Instances level 40-50"]] = LEVEL_CATEGORIES["40-50"],
        [L["Instances level 50-60"]] = LEVEL_CATEGORIES["50-60"],
        [L["Instances 60 level"]] = LEVEL_CATEGORIES["60"],
        [L["World"]] = DUNGEON_DATA.WORLD_BOSSES
    },

    [L["Type"]] = {
        [L["Dungeons"]] = TYPE_CATEGORIES.DUNGEONS,
        [L["Raids"]] = TYPE_CATEGORIES.RAIDS,
        [L["World"]] = DUNGEON_DATA.WORLD_BOSSES
    },

    [L["All"]] = {
        [L["Showing all instances_1"]] = {
            "RagefireChasm", "WailingCaverns", "TheDeadmines", "ShadowfangKeep",
            "BlackfathomDeeps", "TheStockade", "Gnomeregan", "RazorfenKraul",
            "TheCrescentGrove", "SMGraveyard", "SMLibrary", "SMArmory",
            "SMCathedral", "RazorfenDowns", "Uldaman", "GilneasCity",
            "ZulFarrak", "Maraudon", "HateforgeQuarry", "TheSunkenTemple",
            "BlackrockDepths", "DireMaulEast", "DireMaulWest", "DireMaulNorth",
            "CavernsOfTimeBlackMorass", "Scholomance", "StormwroughtRuins",
            "StormwindVault", "Stratholme"
        },
        [L["Showing all instances_2"]] = {
            "KarazhanCrypt", "LowerKarazhan", "BlackrockSpireLower",
            "BlackrockSpireUpper", "ZulGurub", "TheRuinsofAhnQiraj",
            "MoltenCore", "OnyxiasLair", "BlackwingLair", "TheTempleofAhnQiraj",
            "EmeraldSanctum", "Naxxramas", "TowerofKarazhan"
        },
        [L["World"]] = DUNGEON_DATA.WORLD_BOSSES
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