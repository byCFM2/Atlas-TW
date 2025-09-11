---
--- AtlasConfig.lua - Atlas configuration constants and data mappings
--- 
--- This file contains the core configuration constants and data mappings for Atlas-TW.
--- It defines system constants, entrance-to-instance mappings, quest limits,
--- and provides the foundational configuration data for Atlas functionality.
--- 
--- Features:
--- - System constants and limits
--- - Entrance to instance mappings
--- - Instance to entrance mappings
--- - Quest system configuration
--- - Map path definitions
--- 
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

AtlasTW = {
    --constants
    --quest
    QMAXQUESTS = 23,
    QMAXQUESTITEMS = 6,
    --atlas
    NUM_LINES = 24,
    LOOT_NUM_LINES = 30,
    DEBUGMODE = false,
    MAPPATH = "Interface\\AddOns\\Atlas-TW\\Images\\Maps\\",
    Colors = {
        RED     = "|cffff0000",  -- Poor quality, errors
        WHITE   = "|cffFFFFFF",  -- Common quality, normal text
        BLUE    = "|cff0070dd",  -- Rare quality, info text
        DEFAULT = "|cffFFd200",  -- Default highlight color
        GREEN   = "|cff00FF00",  -- Uncommon quality, success
        GREY    = "|cff9d9d9d",  -- Disabled text, vendor trash
        ORANGE  = "|cffFFA500",  -- Legendary quality, warnings
        PURPLE  = "|cff9370DB",  -- Epic quality, special items
        YELLOW  = "|cffFFD700"   -- Quest items, important text
    },
    --entrance maps to instance maps
    EntToInstMatches = {
        ["BlackfathomDeepsEnt"] =		{"BlackfathomDeeps"},
        ["BlackrockMountainEnt"] =		{"BlackrockSpireLower","BlackrockSpireUpper","BlackwingLair","BlackrockDepths","MoltenCore"},
        ["GnomereganEnt"] =				{"Gnomeregan"},
        ["MaraudonEnt"] =				{"Maraudon"},
        ["TheDeadminesEnt"] =			{"TheDeadmines"},
        ["TheSunkenTempleEnt"] =		{"TheSunkenTemple"},
        ["UldamanEnt"] =				{"Uldaman"},
        ["WailingCavernsEnt"] =			{"WailingCaverns"},
        ["DireMaulEnt"] =				{"DireMaulEast","DireMaulNorth","DireMaulWest"},
        ["ScarletMonasteryEnt"] =		{"ScarletMonasteryArmory","ScarletMonasteryLibrary","ScarletMonasteryCathedral","ScarletMonasteryGraveyard"}
    },
    --instance maps to entrance maps
    InstToEntMatches = {
        ["BlackfathomDeeps"] =			{"BlackfathomDeepsEnt"},
        ["BlackrockSpireLower"] =		{"BlackrockMountainEnt"},
        ["BlackrockSpireUpper"] =		{"BlackrockMountainEnt"},
        ["BlackwingLair"] =				{"BlackrockMountainEnt"},
        ["BlackrockDepths"] =			{"BlackrockMountainEnt"},
        ["MoltenCore"] =				{"BlackrockMountainEnt"},
        ["Gnomeregan"] =				{"GnomereganEnt"},
        ["Maraudon"] =					{"MaraudonEnt"},
        ["TheDeadmines"] =				{"TheDeadminesEnt"},
        ["TheSunkenTemple"] =			{"TheSunkenTempleEnt"},
        ["Uldaman"] =					{"UldamanEnt"},
        ["WailingCaverns"] =			{"WailingCavernsEnt"},
        ["DireMaulEast"] =				{"DireMaulEnt"},
        ["DireMaulNorth"] =				{"DireMaulEnt"},
        ["DireMaulWest"] =				{"DireMaulEnt"},
        ["ScarletMonasteryArmory"] =					{"ScarletMonasteryEnt"},
        ["ScarletMonasteryLibrary"] =					{"ScarletMonasteryEnt"},
        ["ScarletMonasteryCathedral"] =				{"ScarletMonasteryEnt"},
        ["ScarletMonasteryGraveyard"] =			{"ScarletMonasteryEnt"}
    },
    --Default map to auto-select to when no SubZone data is available
    AssocDefaults = {
        ["Dire Maul"] =					"DireMaulNorth",
        ["Blackrock Spire"] =			"BlackrockSpireLower",
        ["Scarlet Monastery"] =			"ScarletMonasteryEnt"
    },
    --Links maps together that are part of the same instance
    SubZoneAssoc = {
        ["DireMaulNorth"] =				"Dire Maul",
        ["DireMaulEast"] =				"Dire Maul",
        ["DireMaulWest"] =				"Dire Maul",
        ["DireMaulEnt"] =				"Dire Maul",
        ["BlackrockSpireLower"] =		"Blackrock Spire",
        ["BlackrockSpireUpper"] =		"Blackrock Spire",
        ["BlackrockMountainEnt"] =		"Blackrock Spire",
        ["ScarletMonasteryGraveyard"] =			        "Scarlet Monastery",
        ["ScarletMonasteryLibrary"] =					"Scarlet Monastery",
        ["ScarletMonasteryArmory"] =					"Scarlet Monastery",
        ["ScarletMonasteryCathedral"] =				    "Scarlet Monastery",
        ["ScarletMonasteryEnt"] =						"Scarlet Monastery"
    },
    --Links SubZone values with specific instance maps
    SubZoneData = {
        ["Halls of Destruction"] =		"DireMaulNorth",
        ["Gordok's Seat"] =				"DireMaulNorth",
        ["Warpwood Quarter"] =			"DireMaulEast",
        ["The Hidden Reach"] =			"DireMaulEast",
        ["The Conservatory"] =			"DireMaulEast",
        ["The Shrine of Eldretharr"] =	"DireMaulEast",
        ["Capital Gardens"] =			"DireMaulWest",
        ["Court of the Highborne"] =	"DireMaulWest",
        ["Prison of Immol'thar"] =		"DireMaulWest",
        ["The Athenaeum"] =				"DireMaulWest",
        ["Mok'Doom"] =					"BlackrockSpireLower",
        ["Tazz'Alaor"] =				"BlackrockSpireLower",
        ["Skitterweb Tunnels"] =		"BlackrockSpireLower",
        ["The Storehouse"] =			"BlackrockSpireLower",
        ["Chamber of Battle"] =			"BlackrockSpireLower",
        ["Dragonspire Hall"] =			"BlackrockSpireUpper",
        ["Hall of Binding"] =			"BlackrockSpireUpper",
        ["The Rookery"] =				"BlackrockSpireUpper",
        ["Hall of Blackhand"] =			"BlackrockSpireUpper",
        ["Blackrock Stadium"] =			"BlackrockSpireUpper",
        ["The Furnace"] =				"BlackrockSpireUpper",
        ["Hordemar City"] =				"BlackrockSpireUpper",
        ["Spire Throne"] =				"BlackrockSpireUpper",
        ["Chamber of Atonement"] =		"ScarletMonasteryGraveyard",
        ["Forlorn Cloister"] =			"ScarletMonasteryGraveyard",
        ["Honor's Tomb"] =				"ScarletMonasteryGraveyard",
        ["Huntsman's Cloister"] =		"ScarletMonasteryLibrary",
        ["Gallery of Treasures"] =		"ScarletMonasteryLibrary",
        ["Athenaeum"] =					"ScarletMonasteryLibrary",
        ["Training Grounds"] =			"ScarletMonasteryArmory",
        ["Footman's Armory"] =			"ScarletMonasteryArmory",
        ["Crusader's Armory"] =			"ScarletMonasteryArmory",
        ["Hall of Champions"] =			"ScarletMonasteryArmory",
        ["Chapel Gardens"] =			"ScarletMonasteryCathedral",
        ["Crusader's Chapel"] =			"ScarletMonasteryCathedral",
        ["The Grand Vestibule"] =		"ScarletMonasteryEnt"
    },
    --Maps to auto-select to from outdoor zones.
    OutdoorZoneToAtlas = {
        ["Ashenvale"] =					"BlackfathomDeepsEnt",
        ["Badlands"] =					"UldamanEnt",
        ["Blackrock Mountain"] =		"BlackrockMountainEnt",
        ["Burning Steppes"] = 			"HateforgeQuarry", -- TurtleWOW
        ["Deadwind Pass"] = 			"KarazhanCrypt",    -- TurtleWOW
        ["Desolace"] =					"MaraudonEnt",
        ["Dun Morogh"] =				"GnomereganEnt",
        ["Feralas"] =					"DireMaulEnt",
        ["Searing Gorge"] =				"BlackrockMountainEnt",
        ["Swamp of Sorrows"] =			"TheSunkenTempleEnt",
        ["Tanaris"] =					"ZulFarrak",
        ["The Barrens"] =				"WailingCavernsEnt",
        ["Gilneas"] =					"GilneasCity", -- TurtleWOW
        ["Tirisfal Glades"]	=			"ScarletMonasteryEnt",
        ["Westfall"] =					"TheDeadminesEnt",
        ["Orgrimmar"] =					"RagefireChasm",
        ["Dustwallow Marsh"] =			"OnyxiasLair",
        ["Silithus"] =					"TheTempleofAhnQiraj",
        ["Western Plaguelands"] =		"Scholomance",
        ["Silverpine Forest"] =			"ShadowfangKeep",
        ["Eastern Plaguelands"] =		"Stratholme",
        ["Stormwind City"] =			"TheStockade",
        ["Stranglethorn Vale"] =		"ZulGurub",
        ["Balor"] =                     "StormwroughtRuins", -- TurtleWOW
        ["Wetlands"] =                  "DragonmawRetreat" -- TurtleWOW
    },


    --variables
    --atlas
    Name = "Atlas-TW",
    Version = nil,
    DropDowns = {},
    CurrentLine = 0,
    ScrollList = {},
    UI = {},

    --quest
    Q = {},
    Quest = {NextPageCount = 0},
    isHorde = false,
    CurrentMap = nil,
    QCurrentPage = 0,
    QCurrentQuest = 0,
    QCurrentButton = 0,
    QCurrentInstance = nil,
}

--- Prints text message to the default chat frame
--- @param text string - the message to display in chat
--- @usage print("Debug message")
--- @since 1.0.0
function print(text)
    DEFAULT_CHAT_FRAME:AddMessage(text)
end

AtlasTWCharDB = AtlasTWCharDB or { FirstTime = true }