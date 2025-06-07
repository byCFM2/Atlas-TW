AtlasTW = {
    --constants
    NUM_LINES = 24,

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
        ["SMEnt"] =						{"SMArmory","SMLibrary","SMCathedral","SMGraveyard"}
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
        ["SMArmory"] =					{"SMEnt"},
        ["SMLibrary"] =					{"SMEnt"},
        ["SMCathedral"] =				{"SMEnt"},
        ["SMGraveyard"] =				{"SMEnt"}
    },
    --Default map to auto-select to when no SubZone data is available
    AssocDefaults = {
        ["Dire Maul"] =					"DireMaulNorth",
        ["Blackrock Spire"] =			"BlackrockSpireLower",
        ["Scarlet Monastery"] =			"SMEnt"
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
        ["SMGraveyard"] =				"Scarlet Monastery",
        ["SMLibrary"] =					"Scarlet Monastery",
        ["SMArmory"] =					"Scarlet Monastery",
        ["SMCathedral"] =				"Scarlet Monastery",
        ["SMEnt"] =						"Scarlet Monastery"
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
        ["Chamber of Atonement"] =		"SMGraveyard",
        ["Forlorn Cloister"] =			"SMGraveyard",
        ["Honor's Tomb"] =				"SMGraveyard",
        ["Huntsman's Cloister"] =		"SMLibrary",
        ["Gallery of Treasures"] =		"SMLibrary",
        ["Athenaeum"] =					"SMLibrary",
        ["Training Grounds"] =			"SMArmory",
        ["Footman's Armory"] =			"SMArmory",
        ["Crusader's Armory"] =			"SMArmory",
        ["Hall of Champions"] =			"SMArmory",
        ["Chapel Gardens"] =			"SMCathedral",
        ["Crusader's Chapel"] =			"SMCathedral",
        ["The Grand Vestibule"] =		"SMEnt"
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
        ["Tirisfal Glades"]	=			"SMEnt",
        ["Westfall"] =					"TheDeadminesEnt",
        ["Orgrimmar"] =					"RagefireChasm",
        ["Dustwallow Marsh"] =			"OnyxiasLair",
        ["Silithus"] =					"TheTempleofAhnQiraj",
        ["Western Plaguelands"] =		"Scholomance",
        ["Silverpine Forest"] =			"ShadowfangKeep",
        ["Eastern Plaguelands"] =		"Stratholme",
        ["Stormwind City"] =			"TheStockade",
        ["Stranglethorn Vale"] =		"ZulGurub"
    },

    --variables
    Name = "Atlas-TW",
    Version = nil,
    DropDowns = {},
}

AtlasTWOptions = {
    AtlasAlpha = 1,
    AtlasAcronyms = true,
    AtlasClamped = true,
    DebugMode = false,
}