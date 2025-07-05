-- Atlas Maps Data - Refactored for better maintainability
-- Compatible with WoW 1.12 and Lua 5.0

-- Library dependencies
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

-- Color constants organized in a table
local Colors = {
    BLUE = "|cff6666ff",
    GREY = "|cff999999",
    GREEN = "|cff66cc33",
    RED = "|cffcc6666",
    ORANGE = "|cffcc9933",
    PURPLE = "|cff9900ff",
    WHITE = "|cffffffff"
}

-- Other constants
local Constants = {
    INDENT = " "
}

-- Helper functions for creating entries
local function CreateEntry(color, text)
    return { color .. text }
end

local function CreateNPCEntry(number, name, isRare, additionalInfo)
    local text = ""
    if number then
        text = number.. ") "
    end
    text = text..BB[name]
    if isRare then
        text = text .. " (" .. L["Rare"] .. ")"
    end
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.GREY, text)
end

local function CreateIndentedNPCEntry(name, additionalInfo)
    local text = Constants.INDENT .. BB[name]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.GREY, text)
end

local function CreateEntranceEntry(letter, additionalInfo)
    local text = letter .. ") " .. L["Entrance"]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.BLUE, text)
end

local function CreateKeyEntry(keyName, additionalInfo)
    local text = L["Key"] .. ": " .. L[keyName]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.ORANGE, text)
end

local function CreateItemEntry(number, itemName)
    local text = number .. ") " .. L[itemName]
    return CreateEntry(Colors.GREY, text)
end

local function CreateObjectEntry(number, objectName)
    local text
    if number ~= Constants.INDENT then
        text = number.. ") ".. L[objectName]
    else
        text = L[objectName]
    end
    return CreateEntry(Colors.GREY, text)
end

local function CreateIndentedObjectEntry(objectName)
    local text = Constants.INDENT .. L[objectName]
    return CreateEntry(Colors.GREY, text)
end

local function CreateSpecialEntry(number, name, color, additionalInfo)
    local text = number .. "') " .. L[name]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(color or Colors.GREEN, text)
end

local function CreateEmptyEntry()
    return { "" }
end

local function CreateTrashMobsEntry()
    return CreateEntry(Colors.GREY, Constants.INDENT .. L["Trash Mobs"])
end

local function CreateSetEntry(setName)
    return CreateEntry(Colors.GREY, Constants.INDENT .. L["Set: "] .. BIS[setName])
end

local function CreateAttunementEntry()
    return CreateEntry(Colors.ORANGE, L["Attunement Required"])
end

local function CreateReputationEntry(factionName)
    return CreateEntry(Colors.ORANGE, L["Reputation"] .. ": " .. BF[factionName])
end

local function CreateDamageEntry(damageType)
    return CreateEntry(Colors.ORANGE, L["Damage: "] .. L[damageType])
end

-- Template function for creating dungeon data
local function CreateDungeonTemplate(config)
    local dungeon = {
        ZoneName = config.zoneName,
        Acronym = config.acronym,
        Location = config.location,
        LevelRange = config.levelRange,
        MinLevel = config.minLevel,
        PlayerLimit = config.playerLimit,
        Continent = config.continent
    }

    -- Add special requirements
    if config.attunement then
        table.insert(dungeon, CreateAttunementEntry())
    end

    if config.reputation then
        table.insert(dungeon, CreateReputationEntry(config.reputation.name, config.reputation.id))
    end

    -- Add keys
    if config.keys then
        for _, key in ipairs(config.keys) do
            table.insert(dungeon, CreateKeyEntry(key.name, key.id, key.info))
        end
    end

    -- Add entrances
    if config.entrances then
        for _, entrance in ipairs(config.entrances) do
            table.insert(dungeon, CreateEntranceEntry(entrance.letter, entrance.info))
        end
    end

    -- Add entries
    if config.entries then
        for _, entry in ipairs(config.entries) do
            table.insert(dungeon, entry)
        end
    end

    -- Add damage type if specified
    if config.damageType then
        table.insert(dungeon, CreateDamageEntry(config.damageType))
    end

    return dungeon
end

-- Main AtlasMaps table
AtlasMaps = {

    --************************************************
    -- Kalimdor Instances
    --************************************************
    RagefireChasm = CreateDungeonTemplate({
        zoneName = BZ["Ragefire Chasm"],
        acronym = "RFC",
        location = BZ["Orgrimmar"],
        levelRange = "13-18",
        minLevel = "8",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Maur Grimtotem"]),
            CreateIndentedNPCEntry("Oggleflint"),
            CreateNPCEntry("2", "Taragaman the Hungerer"),
            CreateNPCEntry("3", "Jergosh the Invoker"),
            CreateNPCEntry("4", "Bazzalan"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
        }
    }),

    WailingCaverns = CreateDungeonTemplate({
        zoneName = BZ["Wailing Caverns"],
        acronym = "WC",
        location = BZ["The Barrens"],
        levelRange = "17-24",
        minLevel = "10",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Disciple of Naralex"),
            CreateNPCEntry("2", "Lord Cobrahn"),
            CreateNPCEntry("3", "Lady Anacondra"),
            CreateNPCEntry("4", "Kresh"),
            CreateNPCEntry("5", "Deviate Faerie Dragon", true),
            CreateNPCEntry("6", "Zandara Windhoof"),
            CreateNPCEntry("7", "Lord Pythas"),
            CreateNPCEntry("8", "Skum"),
            CreateNPCEntry("9", "Vangros"),
            CreateNPCEntry("10", "Lord Serpentis", false, L["Upper"]),
            CreateNPCEntry("11", "Verdan the Everliving", false, L["Upper"]),
            CreateNPCEntry("12", "Mutanus the Devourer"),
            CreateIndentedNPCEntry("Naralex"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Embrace of the Viper")
        }
    }),

    BlackfathomDeeps = CreateDungeonTemplate({
        zoneName = BZ["Blackfathom Deeps"],
        acronym = "BFD",
        location = BZ["Ashenvale"],
        levelRange = "24-32",
        minLevel = "19",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Ghamoo-ra"),
            CreateItemEntry("2", "Lorgalis Manuscript"),
            CreateNPCEntry("3", "Lady Sarevess"),
            CreateEntry(Colors.GREY, "4) " .. L["Argent Guard Thaelrid"]),
            CreateNPCEntry("5", "Gelihast"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Shrine of Gelihast"]),
            CreateNPCEntry("6", "Lorgus Jett", false, L["Varies"]),
            CreateNPCEntry("7", "Baron Aquanis"),
            CreateIndentedObjectEntry("Fathom Stone"),
            CreateNPCEntry("8", "Twilight Lord Kelris"),
            CreateNPCEntry("9", "Old Serra'kis"),
            CreateNPCEntry("10", "Aku'mai"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Morridune"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Altar of the Deeps"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    RazorfenKraul = CreateDungeonTemplate({
        zoneName = BZ["Razorfen Kraul"],
        acronym = "RFK",
        location = BZ["The Barrens"],
        levelRange = "29-38",
        minLevel = "19",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Roogug"),
            CreateNPCEntry("2", "Aggem Thorncurse"),
            CreateNPCEntry("3", "Death Speaker Jargba"),
            CreateNPCEntry("4", "Overlord Ramtusk"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Razorfen Spearhide"] .. " (" .. L["Rare"] .. ")"),
            CreateNPCEntry("5", "Agathelos the Raging"),
            CreateNPCEntry("6", "Blind Hunter", true),
            CreateNPCEntry("7", "Charlga Razorflank"),
            CreateEntry(Colors.GREY, "8) " .. L["Willix the Importer"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Heralath Fallowbrook"]),
            CreateNPCEntry("9", "Earthcaller Halmgar", true),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    RazorfenDowns = CreateDungeonTemplate({
        zoneName = BZ["Razorfen Downs"],
        acronym = "RFD",
        location = BZ["The Barrens"],
        levelRange = "37-46",
        minLevel = "25",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Tuten'kash"),
            CreateEntry(Colors.GREY, "2) " .. L["Henry Stern"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Belnistrasz"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sah'rhee"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Lady Falther'ess"] .. " (" .. L["Scourge Invasion"] .. ")"),
            CreateNPCEntry("3", "Mordresh Fire Eye"),
            CreateNPCEntry("4", "Glutton"),
            CreateNPCEntry("5", "Ragglesnout", true, L["Varies"]),
            CreateNPCEntry("6", "Amnennar the Coldbringer"),
            CreateNPCEntry("7", "Plaguemaw the Rotting"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    ZulFarrak = CreateDungeonTemplate({
        zoneName = BZ["Zul'Farrak"],
        acronym = "ZF",
        location = BZ["Tanaris"],
        levelRange = "44-54",
        minLevel = "30",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        keys = {
            { name = "Mallet of Zul'Farrak", id = 9240, info = BB["Gahz'rilla"] }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Antu'sul"),
            CreateEntry(Colors.GREY, "2) " .. L["Theka the Martyr"]),
            CreateNPCEntry("3", "Witch Doctor Zum'rah"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zul'Farrak Dead Hero"]),
            CreateEntry(Colors.GREY, "4) " .. L["Nekrum Gutchewer"]),
            CreateIndentedNPCEntry("Shadowpriest Sezz'ziz"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dustwraith"] .. " (" .. L["Rare"] .. ")"),
            CreateEntry(Colors.GREY, "5) " .. L["Sergeant Bly"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Weegli Blastfuse"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Murta Grimgut"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Raven"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Oro Eyegouge"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sandfury Executioner"]),
            CreateEntry(Colors.GREY, "6) " .. L["Hydromancer Velratha"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Gahz'rilla"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Wildmane"] .. " (" .. L["Lunar Festival"] .. ")"),
            CreateNPCEntry("7", "Chief Ukorz Sandscalp"),
            CreateIndentedNPCEntry("Ruuzlu"),
            CreateEntry(Colors.GREY, "8) " .. L["Zerillis"] .. " (" .. L["Rare"] .. ", " .. L["Wanders"] .. ")"),
            CreateEntry(Colors.GREY, "9) " .. L["Sandarr Dunereaver"] .. " (" .. L["Rare"] .. ")"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    Maraudon = CreateDungeonTemplate({
        zoneName = BZ["Maraudon"],
        acronym = "Mara",
        location = BZ["Desolace"],
        levelRange = "46-55",
        minLevel = "35",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        keys = {
            { name = "Scepter of Celebras", id = 17191, info = L["Portal"] }
        },
        entrances = {
            { letter = "A", info = L["Orange"] },
            { letter = "B", info = L["Purple"] },
            { letter = "C", info = L["Portal"] }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Veng"]),
            CreateNPCEntry("2", "Noxxion"),
            CreateNPCEntry("3", "Razorlash"),
            CreateEntry(Colors.GREY, "4) " .. L["Maraudos"]),
            CreateNPCEntry("5", "Lord Vyletongue"),
            CreateNPCEntry("6", "Meshlok the Harvester", true),
            CreateNPCEntry("7", "Celebras the Cursed"),
            CreateNPCEntry("8", "Landslide"),
            CreateNPCEntry("9", "Tinkerer Gizlock"),
            CreateNPCEntry("10", "Rotgrip"),
            CreateNPCEntry("11", "Princess Theradras"),
            CreateEntry(Colors.GREY, "12) " .. L["Elder Splitrock"] .. " (" .. L["Lunar Festival"] .. ")"),
            CreateTrashMobsEntry()
        }
    }),

    DireMaulEast = CreateDungeonTemplate({
        zoneName = BZ["Dire Maul"] .. " (" .. L["East"] .. ")",
        acronym = "DME",
        location = BZ["Feralas"],
        levelRange = "55-58",
        minLevel = "50",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        keys = {
            { name = "Brazier of Invocation", id = 22057, info = L["Tier 0.5 Summon"] }
        },
        entrances = {
            { letter = "A" },
            { letter = "B" },
            { letter = "C" },
            { letter = "D", info = L["Exit"] }
        },
        entries = {
            CreateNPCEntry("1", "Pusillin", false, L["Chase Begins"]),
            CreateNPCEntry("2", "Pusillin", false, L["Chase Ends"]),
            CreateNPCEntry("3", "Zevrim Thornhoof"),
            CreateIndentedNPCEntry("Hydrospawn"),
            CreateIndentedNPCEntry("Lethtendris"),
            CreateIndentedNPCEntry("Pimgib"),
            CreateEntry(Colors.GREY, "4) " .. L["Old Ironbark"]),
            CreateNPCEntry("5", "Alzzin the Wildshaper"),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Isalien"] .. " (" .. L["Summon"] .. ")"),
            CreateIndentedObjectEntry("Felvine Shard"),
            CreateSpecialEntry("1", "A Dusty Tome", Colors.GREEN, L["Varies"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dire Maul Books"]),
            CreateSetEntry("Ironweave Battlesuit")
        }
    }),

    DireMaulNorth = CreateDungeonTemplate({
        zoneName = BZ["Dire Maul"] .. " (" .. L["North"] .. ")",
        acronym = "DMN",
        location = BZ["Feralas"],
        levelRange = "57-60",
        minLevel = "50",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        keys = {
            { name = "Crescent Key", id = 18249 },
            { name = "Gordok Courtyard Key", id = 18266 },
            { name = "Gordok Inner Door Key", id = 18268 }
        },
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Library"] },
            { letter = "C", info = BZ["Dire Maul"] .. " (" .. L["West"] .. ")" }
        },
        entries = {
            CreateNPCEntry("1", "Guard Mol'dar"),
            CreateEntry(Colors.GREY, "2) " .. L["Stomper Kreeg"]),
            CreateNPCEntry("3", "Guard Fengus"),
            CreateEntry(Colors.GREY, "4) " .. L["Knot Thimblejack"]),
            CreateIndentedNPCEntry("Guard Slip'kik"),
            CreateNPCEntry("5", "Captain Kromcrush"),
            CreateNPCEntry("6", "King Gordok"),
            CreateIndentedNPCEntry("Cho'Rush the Observer"),
            CreateIndentedObjectEntry("Tribute Run"),
            CreateSpecialEntry("1", "Library", nil, Colors.GREEN),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Falrin Treeshaper"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Lydros"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Javon"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Kildrath"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Mykos"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Shen'dralar Provisioner"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Skeletal Remains of Kariel Winthalus"]),
            CreateEntry(Colors.GREEN, "2') " .. L["A Dusty Tome"] .. " (" .. L["Varies"] .. ")"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dire Maul Books"])
        }
    }),

    DireMaulWest = CreateDungeonTemplate({
        zoneName = BZ["Dire Maul"] .. " (" .. L["West"] .. ")",
        acronym = "DMW",
        location = BZ["Feralas"],
        levelRange = "57-60",
        minLevel = "50",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        keys = {
            { name = "Crescent Key", id = 18249 },
            { name = "J'eevee's Jar", id = 18663, info = BB["Lord Hel'nurath"] }
        },
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Pylons"] },
            { letter = "C", info = BZ["Dire Maul"] .. " (" .. L["North"] .. ")" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Shen'dralar Ancient"]),
            CreateNPCEntry("2", "Tendris Warpwood"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ancient Equine Spirit"]),
            CreateNPCEntry("3", "Illyanna Ravenoak"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ferra"]),
            CreateNPCEntry("4", "Magister Kalendris"),
            CreateNPCEntry("5", "Tsu'zee", true),
            CreateNPCEntry("6", "Immol'thar"),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Lord Hel'nurath"] .. " (" .. L["Rare"] .. ", " .. L["Summon"] .. ")"),
            CreateNPCEntry("7", "Prince Tortheldrin"),
            CreateIndentedObjectEntry("The Prince's Chest"),
            CreateNPCEntry("8", "Revanchion", false, L["Scourge Invasion"]),
            CreateSpecialEntry("1", "Library", nil, Colors.GREEN),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Falrin Treeshaper"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Lydros"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Javon"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Kildrath"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Mykos"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Shen'dralar Provisioner"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Skeletal Remains of Kariel Winthalus"]),
            CreateEntry(Colors.GREEN, "2') " .. L["A Dusty Tome"] .. " (" .. L["Varies"] .. ")"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dire Maul Books"])
        }
    }),

    OnyxiasLair = CreateDungeonTemplate({
        zoneName = BZ["Onyxia's Lair"],
        acronym = "Ony",
        location = BZ["Dustwallow Marsh"],
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "40",
        continent = BZ["Kalimdor"],
        attunement = true,
        keys = {
            { name = "Drakefire Amulet", id = 16309 }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Onyxian Warders"]),
            CreateEntry(Colors.GREY, "2) " .. L["Whelp Eggs"]),
            CreateNPCEntry("3", "Onyxia"),
        },
        damageType = "Fire"
    }),

    TheTempleofAhnQiraj = CreateDungeonTemplate({
        zoneName = BZ["Temple of Ahn'Qiraj"],
        acronym = "AQ40",
        location = BZ["Silithus"],
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "40",
        continent = BZ["Kalimdor"],
        reputation = {
            name = BF["Brood of Nozdormu"],
            id = 910
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "The Prophet Skeram", false, L["Outside"]),
            CreateEntry(Colors.GREY, "2) " .. L["Bug Trio"] .. " (" .. L["Optional"] .. ")"),
            CreateIndentedNPCEntry("Vem"),
            CreateIndentedNPCEntry("Lord Kri"),
            CreateIndentedNPCEntry("Princess Yauj"),
            CreateNPCEntry("3", "Battleguard Sartura"),
            CreateNPCEntry("4", "Fankriss the Unyielding"),
            CreateNPCEntry("5", "Viscidus", false, L["Optional"]),
            CreateNPCEntry("6", "Princess Huhuran"),
            CreateEntry(Colors.GREY, "7) " .. BB["The Twin Emperors"]),
            CreateIndentedNPCEntry("Emperor Vek'lor"),
            CreateIndentedNPCEntry("Emperor Vek'nilash"),
            CreateNPCEntry("8", "Ouro", false, L["Optional"]),
            CreateNPCEntry("9", "C'Thun"),
            CreateSpecialEntry("1", "Andorgos"),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Vethsera"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Kandrostrasz"]),
            CreateSpecialEntry("2", "Arygos"),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Caelestrasz"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Merithra of the Dream"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["AQ Enchants"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Temple of Ahn'Qiraj Sets"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["AQ Opening Quest Chain"]),
            CreateEmptyEntry()
        },
        damageType = "Nature"
    }),

    TheRuinsofAhnQiraj = CreateDungeonTemplate({
        zoneName = BZ["Ruins of Ahn'Qiraj"],
        acronym = "AQ20",
        location = BZ["Silithus"],
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "20",
        continent = BZ["Kalimdor"],
        reputation = {
            name = "Cenarion Circle",
            id = 609
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Kurinnaxx"),
            CreateIndentedNPCEntry("Lieutenant General Andorov"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Four Kaldorei Elites"]),
            CreateNPCEntry("2", "General Rajaxx"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Qeez"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Tuubid"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Drenn"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Xurrem"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Major Yeggeth"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Major Pakkon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Colonel Zerran"]),
            CreateNPCEntry("3", "Moam", false, L["Optional"]),
            CreateNPCEntry("4", "Buru the Gorger", false, L["Optional"]),
            CreateNPCEntry("5", "Ayamiss the Hunter", false, L["Optional"]),
            CreateNPCEntry("6", "Ossirian the Unscarred"),
            CreateSpecialEntry("1", "Safe Room", Colors.GREEN),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Class Books"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["AQ Enchants"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ruins of Ahn'Qiraj Sets"]),
            CreateEmptyEntry()
        },
        damageType = "Nature"
    }),

    --************************************************
    -- Eastern Kingdoms Instances
    --************************************************
    BlackrockDepths = CreateDungeonTemplate({
        zoneName = BZ["Blackrock Depths"],
        acronym = "BRD",
        location = BZ["Blackrock Mountain"],
        levelRange = "52-60",
        minLevel = "42",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "Shadowforge Key", id = 11000 },
            { name = "Prison Cell Key", id = 11140 },
            { name = "Banner of Provocation", id = 21986, info = L["Tier 0.5 Summon"] }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Lord Roccor"),
            CreateEntry(Colors.GREY, "2) " .. L["Kharan Mighthammer"]),
            CreateEntry(Colors.GREY, "3) " .. L["Commander Gor'shak"]),
            CreateEntry(Colors.GREY, "4) " .. L["Marshal Windsor"]),
            CreateNPCEntry("5", "High Interrogator Gerstahn"),
            CreateEntry(Colors.GREY, "6) " .. L["Ring of Law"]),
            CreateIndentedNPCEntry("Anub'shiah", L["Random"]),
            CreateIndentedNPCEntry("Eviscerator", L["Random"]),
            CreateIndentedNPCEntry("Gorosh the Dervish", L["Random"]),
            CreateIndentedNPCEntry("Grizzle", L["Random"]),
            CreateIndentedNPCEntry("Hedrum the Creeper", L["Random"]),
            CreateIndentedNPCEntry("Ok'thor the Breaker", L["Random"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Theldren"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lefty"] .. " (|cfffff468" .. BC["Rogue"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Malgen Longspear"] .. " (|cffaad372" .. BC["Hunter"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Gnashjaw"] .. " (|cffaad372" .. L["Pet"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Korv"] .. " (|cff2773ff" .. BC["Shaman"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Rezznik"] .. " (|cffc69b6d" .. L["Engineer"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Rotfang"] .. " (|cfffff468" .. BC["Rogue"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Snokh Blackspine"] .. " (|cff68ccef" .. BC["Mage"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Va'jashni"] .. " (|cffffffff" .. BC["Priest"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Volida"] .. " (|cff68ccef" .. BC["Mage"] .. Colors.GREY .. ")"),
            CreateIndentedNPCEntry("Houndmaster Grebmar", L["Lower"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Morndeep"] .. " (" .. L["Lunar Festival"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["High Justice Grimstone"]),
            CreateEntry(Colors.GREY, "7) " .. L["Monument of Franclorn Forgewright"]),
            CreateNPCEntry(nil, "Pyromancer Loregrain", true),
            CreateEntry(Colors.GREY, "8) " .. L["The Vault"]),
            CreateNPCEntry(nil, "Warder Stilgiss", true),
            CreateNPCEntry(nil, "Verek", true),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Watchman Doomgrip"]),
            CreateNPCEntry("9", "Fineous Darkvire"),
            CreateNPCEntry("10", "Lord Incendius"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Black Anvil"]),
            CreateNPCEntry("11", "Bael'Gar"),
            CreateEntry(Colors.GREY, "12) " .. L["Shadowforge Lock"]),
            CreateNPCEntry("13", "General Angerforge"),
            CreateNPCEntry("14", "Golem Lord Argelmach"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Field Repair Bot 74A"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"]),
            CreateEntry(Colors.GREY, "15) " .. L["The Grim Guzzler"]),
            CreateIndentedNPCEntry("Hurley Blackbreath"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lokhtos Darkbargainer"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mistress Nagmara"]),
            CreateIndentedNPCEntry("Phalanx"),
            CreateIndentedNPCEntry("Plugger Spazzring"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Private Rocknot"]),
            CreateIndentedNPCEntry("Ribbly Screwspigot"),
            CreateNPCEntry("16", "Ambassador Flamelash"),
            CreateNPCEntry("17", "Panzor the Invincible", true),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"]),
            CreateEntry(Colors.GREY, "18) " .. L["Summoner's Tomb"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Chest of The Seven"]),
            CreateEntry(Colors.GREY, "19) " .. L["The Lyceum"]),
            CreateNPCEntry("20", "Magmus"),
            CreateNPCEntry("21", "Emperor Dagran Thaurissan"),
            CreateIndentedNPCEntry("Princess Moira Bronzebeard"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["High Priestess of Thaurissan"]),
            CreateEntry(Colors.GREY, "22) " .. L["The Black Forge"]),
            CreateEntry(Colors.GREY, "23) " .. BZ["Molten Core"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Core Fragment"]),
            CreateNPCEntry("24","Overmaster Pyron"),
            CreateEntry(Colors.GREY, "25) " .. L["Blacksmithing Plans"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("The Gladiator"),
            CreateSetEntry("Ironweave Battlesuit")
        }
    }),

    BlackrockSpireLower = CreateDungeonTemplate({
        zoneName = BZ["Lower Blackrock Spire"],
        acronym = "LBRS",
        location = BZ["Blackrock Mountain"],
        levelRange = "55-60",
        minLevel = "55",
        playerLimit = "10",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "Brazier of Invocation", id = 22057, info = L["Tier 0.5 Summon"] }
        },
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Upper Blackrock Spire"] .. " (UBRS)" },
            { letter = "C-F", info = L["Connections"] }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Vaelan"] .. " (" .. L["Upper"] .. ")"),
            CreateEntry(Colors.GREY, "2) " .. L["Warosh"] .. " (" .. L["Wanders"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Stonefort"] .. " (" .. L["Lunar Festival"] .. ")"),
            CreateEntry(Colors.GREY, "3) " .. L["Roughshod Pike"]),
            CreateEntry(Colors.GREY, "4) " .. L["Spirestone Butcher"] .. " (" .. L["Rare"] .. ")"),
            CreateNPCEntry("5", "Highlord Omokk"),
            CreateEntry(Colors.GREY, "6) " .. L["Spirestone Battle Lord"] .. " (" .. L["Rare"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Spirestone Lord Magus"] .. " (" .. L["Rare"] .. ")"),
            CreateNPCEntry("7", "Shadow Hunter Vosh'gajin"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Fifth Mosh'aru Tablet"]),
            CreateEntry(Colors.GREY, "8) " .. L["Bijou"]),
            CreateNPCEntry("9", "War Master Voone"),
            CreateIndentedNPCEntry("Mor Grayhoof", L["Summon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sixth Mosh'aru Tablet"]),
            CreateEntry(Colors.GREY, "10) " .. L["Bijou's Belongings"]),
            CreateEntry(Colors.GREY, "11) " .. L["Human Remains"] .. " (" .. L["Lower"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Unfired Plate Gauntlets"] .. " (" .. L["Lower"] .. ")"),
            CreateNPCEntry("12", "Bannok Grimaxe", true),
            CreateNPCEntry("13", "Mother Smolderweb"),
            CreateNPCEntry("14", "Crystal Fang", true),
            CreateEntry(Colors.GREY, "15) " .. L["Urok's Tribute Pile"]),
            CreateIndentedNPCEntry("Urok Doomhowl", L["Summon"]),
            CreateNPCEntry("16", "Quartermaster Zigris"),
            CreateNPCEntry("17", "Halycon"),
            CreateIndentedNPCEntry("Gizrul the Slavener"),
            CreateNPCEntry("18", "Ghok Bashguud", true),
            CreateNPCEntry("19", "Overlord Wyrmthalak"),
            CreateSpecialEntry("1", "Burning Felguard", Colors.GREEN, L["Rare"] .. ", " .. L["Summon"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Ironweave Battlesuit"),
            CreateSetEntry("Spider's Kiss"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Set: "] .. L["Tier 0/0.5 Sets"])
        }
    }),

    BlackrockSpireUpper = CreateDungeonTemplate({
        zoneName = BZ["Upper Blackrock Spire"],
        acronym = "UBRS",
        location = BZ["Blackrock Mountain"],
        levelRange = "56-60",
        minLevel = "55",
        playerLimit = "10",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "Seal of Ascension", id = 12344 },
            { name = "Brazier of Invocation", id = 22057, info = L["Tier 0.5 Summon"] }
        },
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Lower Blackrock Spire"] .. " (LBRS)" },
            { letter = "C-E", info = L["Connections"] }
        },
        entries = {
            CreateNPCEntry("1", "Pyroguard Emberseer"),
            CreateNPCEntry("Solakar Flamewreath"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Father Flame"]),
            CreateEntry(Colors.GREY, "3) " .. L["Darkstone Tablet"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Doomrigger's Coffer"]),
            CreateNPCEntry("4", "Jed Runewatcher", true),
            CreateNPCEntry("5", "Goraluk Anvilcrack", true),
            CreateNPCEntry("6", "Warchief Rend Blackhand"),
            CreateIndentedNPCEntry("Gyth"),
            CreateEntry(Colors.GREY, "7) " .. L["Awbee"]),
            CreateNPCEntry("8", "The Beast"),
            CreateIndentedNPCEntry("Lord Valthalak", L["Summon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Finkle Einhorn"]),
            CreateNPCEntry("9", "General Drakkisath"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Drakkisath's Brand"]),
            CreateEntry(Colors.GREY, "10) " .. BZ["Blackwing Lair"] .. " (BWL)"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Ironweave Battlesuit"),
            CreateSetEntry("Dal'Rend's Arms"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 0/0.5 Sets"])
        }
    }),

    BlackwingLair = CreateDungeonTemplate({
        zoneName = BZ["Blackwing Lair"],
        acronym = "BWL",
        location = BZ["Blackrock Spire"],
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        attunement = true,
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] },
            { letter = "C", info = L["Connection"] }
        },
        entries = {
            CreateNPCEntry("1", "Razorgore the Untamed"),
            CreateNPCEntry("2", "Vaelastrasz the Corrupt"),
            CreateNPCEntry("3", "Broodlord Lashlayer"),
            CreateNPCEntry("4", "Firemaw"),
            CreateEntry(Colors.GREY, "5) " .. L["Master Elemental Shaper Krixix"]),
            CreateNPCEntry("6", "Ebonroc"),
            CreateNPCEntry("7", "Flamegor"),
            CreateNPCEntry("8", "Chromaggus"),
            CreateNPCEntry("9", "Nefarian"),
            CreateSpecialEntry("1", "Alchemy Lab", Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Draconic for Dummies"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 2 Sets"]),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        },
        damageType = "Fire"
    }),

    Gnomeregan = CreateDungeonTemplate({
        zoneName = BZ["Gnomeregan"],
        acronym = "Gnome",
        location = BZ["Dun Morogh"],
        levelRange = "29-38",
        minLevel = "19",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "Workshop Key", id = 6893, info = L["Back"] }
        },
        entrances = {
            { letter = "A", info = L["Front"] },
            { letter = "B", info = L["Back"] }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Blastmaster Emi Shortfuse"]),
            CreateIndentedNPCEntry("Grubbis"),
            CreateIndentedNPCEntry("Chomper"),
            CreateEntry(Colors.GREY, "2) " .. L["Clean Room"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tink Sprocketwhistle"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Sparklematic 5200"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mail Box"]),
            CreateEntry(Colors.GREY, "3) " .. L["Kernobee"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Alarm-a-bomb 2600"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Matrix Punchograph 3005-B"]),
            CreateNPCEntry("4", "Viscous Fallout"),
            CreateNPCEntry("5", "Electrocutioner 6000"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Matrix Punchograph 3005-C"]),
            CreateNPCEntry("6", "Crowd Pummeler 9-60", false, L["Upper"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Matrix Punchograph 3005-D"]),
            CreateNPCEntry("7", "Dark Iron Ambassador", true),
            CreateNPCEntry("8", "Mekgineer Thermaplugg"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    MoltenCore = CreateDungeonTemplate({
        zoneName = BZ["Molten Core"],
        acronym = "MC",
        location = BZ["Blackrock Depths"],
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        attunement = true,
        reputation = {
            name = "Hydraxian Waterlords",
            id = 749
        },
        keys = {
            { name = "Aqual Quintessence", id = 17333, info = L["Boss"] },
            { name = "Eternal Quintessence", id = 22754, info = L["Boss"] }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Lucifron"),
            CreateNPCEntry("2", "Magmadar"),
            CreateNPCEntry("3", "Gehennas"),
            CreateNPCEntry("4", "Garr"),
            CreateNPCEntry("5", "Shazzrah"),
            CreateNPCEntry("6", "Baron Geddon"),
            CreateNPCEntry("7", "Golemagg the Incinerator"),
            CreateNPCEntry("8", "Sulfuron Harbinger"),
            CreateNPCEntry("9", "Majordomo Executus"),
            CreateNPCEntry("10", "Ragnaros"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Random Boss Loot"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 1 Sets"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 2 Sets"]),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        },
        damageType = "Fire"
    }),

    Naxxramas = CreateDungeonTemplate({
        zoneName = BZ["Naxxramas"],
        acronym = "Naxx",
        location = BZ["Eastern Plaguelands"],
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        attunement = true,
        reputation = {
            name = "Argent Dawn",
            id = 529
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Archmage Tarsis Kir-Moldir"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Mr. Bigglesworth"] .. " (" .. L["Wanders"] .. ")"),
            CreateEntry(Colors.GREY, L["Abomination Wing"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "1) " .. BB["Patchwerk"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "2) " .. BB["Grobbulus"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "3) " .. BB["Gluth"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "4) " .. BB["Thaddius"]),
            CreateEntry(Colors.ORANGE, L["Spider Wing"]),
            CreateEntry(Colors.ORANGE, Constants.INDENT .. "1) " .. BB["Anub'Rekhan"]),
            CreateEntry(Colors.ORANGE, Constants.INDENT .. "2) " .. BB["Grand Widow Faerlina"]),
            CreateEntry(Colors.ORANGE, Constants.INDENT .. "3) " .. BB["Maexxna"]),
            CreateEntry(Colors.PURPLE, L["Plague Wing"]),
            CreateEntry(Colors.PURPLE, Constants.INDENT .. "1) " .. BB["Noth the Plaguebringer"]),
            CreateEntry(Colors.PURPLE, Constants.INDENT .. "2) " .. BB["Heigan the Unclean"]),
            CreateEntry(Colors.PURPLE, Constants.INDENT .. "3) " .. BB["Loatheb"]),
            CreateEntry(Colors.RED, L["Deathknight Wing"]),
            CreateEntry(Colors.RED, Constants.INDENT .. "1) " .. BB["Instructor Razuvious"]),
            CreateEntry(Colors.RED, Constants.INDENT .. "2) " .. BB["Gothik the Harvester"]),
            CreateEntry(Colors.RED, Constants.INDENT .. "3) " .. BB["The Four Horsemen"]),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Thane Korth'azz"]),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Lady Blaumeux"]),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Highlord Mograine"]),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Sir Zeliek"]),
            CreateEntry(Colors.RED, Constants.INDENT .. "1') " .. BB["Master Craftsman Omarion"]),
            CreateEntry(Colors.RED, Constants.INDENT .. "2') " .. L["Icebellow Anvil"]),
            CreateEntry(Colors.GREEN, L["Frostwyrm Lair"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. "1) " .. BB["Sapphiron"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. "2) " .. BB["Kel'Thuzad"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 3 Sets"]),
            CreateEmptyEntry(),
        },
        damageType = "Nature, Fire, Arcane, Shadow, Frost"
    }),

    SMLibrary = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Library"],
        acronym = "SM Lib",
        location = BZ["Tirisfal Glades"],
        levelRange = "29-39",
        minLevel = "21",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Houndmaster Loksey"),
            CreateNPCEntry("2", "Arcanist Doan"),
            CreateSpecialEntry("1", "Doan's Strongbox", Colors.GREEN),
            CreateEntry(Colors.GREY, "3) " .. BB["Brother Wystan"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    SMArmory = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Armory"],
        acronym = "SM Arm",
        location = BZ["Tirisfal Glades"],
        levelRange = "33-40",
        minLevel = "25",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "The Scarlet Key", id = 7146 }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Herod"),
            CreateEntry(Colors.GREY, "2) " .. BB["Armory Quartermaster Daghelm"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    SMCathedral = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Cathedral"],
        acronym = "SM Cath",
        location = BZ["Tirisfal Glades"],
        levelRange = "35-45",
        minLevel = "25",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "The Scarlet Key", id = 7146 }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "High Inquisitor Fairbanks"),
            CreateNPCEntry("2", "Scarlet Commander Mograine"),
            CreateNPCEntry("3", "High Inquisitor Whitemane"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    SMGraveyard = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Graveyard"],
        acronym = "SM GY",
        location = BZ["Tirisfal Glades"],
        levelRange = "26-36",
        minLevel = "25",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Interrogator Vishas"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Vorrel Sengutz"]),
            CreateEntry(Colors.GREY, "2) " .. BB["Scorn"] .. " (" .. L["Scourge Invasion"] .. ")"),
            CreateNPCEntry("3", "Bloodmage Thalnos"),
            CreateSpecialEntry("1", "Ironspine", Colors.GREEN),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Azshir the Sleepless"] .. " (" .. L["Rare"] .. ")"),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Fallen Champion"] .. " (" .. L["Rare"] .. ")"),
            CreateEntry(Colors.GREY, "4) " .. BB["Duke Dreadmoore"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    Scholomance = CreateDungeonTemplate({
        zoneName = BZ["Scholomance"],
        acronym = "Scholo",
        location = BZ["Western Plaguelands"],
        levelRange = "58-60",
        minLevel = "45",
        playerLimit = "10",
        continent = BZ["Eastern Kingdoms"],
        reputation = {
            name = "Argent Dawn",
            id = 529
        },
        keys = {
            { name = "Skeleton Key", id = 13704 },
            { name = "Viewing Room Key", id = 13873, info = L["Viewing Room"] },
            { name = "Blood of Innocents", id = 13523, info = BB["Kirtonos the Herald"] },
            { name = "Brazier of Invocation", id = 22057, info = L["Tier 0.5 Summon"] },
            { name = "Divination Scryer", id = 18746, info = BB["Death Knight Darkreaver"] },
        },
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] },
            { letter = "C", info = L["Connection"] }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Blood Steward of Kirtonos"]),
            CreateObjectEntry(Constants.INDENT, "The Deed to Southshore"),
            CreateNPCEntry("2", "Kirtonos the Herald", false, L["Summon"]),
            CreateNPCEntry("3", "Jandice Barov"),
            CreateObjectEntry(Constants.INDENT, "Journal of Jandice Barov"),
            CreateObjectEntry("4", "The Deed to Tarren Mill"),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Lord Blackwood"] .. " (" .. L["Scourge Invasion"] .. ")"),
            CreateNPCEntry("5", "Rattlegore", false, L["Lower"]),
            CreateIndentedNPCEntry("Death Knight Darkreaver", L["Summon"]),
            CreateNPCEntry("6", "Marduk Blackpool"),
            CreateIndentedNPCEntry("Vectus"),
            CreateNPCEntry("7", "Ras Frostwhisper"),
            CreateObjectEntry(Constants.INDENT, "The Deed to Brill"),
            CreateIndentedNPCEntry("Kormok", L["Summon"]),
            CreateNPCEntry("8", "Instructor Malicia"),
            CreateNPCEntry("9", "Doctor Theolen Krastinov"),
            CreateNPCEntry("10", "Lorekeeper Polkelt"),
            CreateNPCEntry("11", "The Ravenian"),
            CreateNPCEntry("12", "Lord Alexei Barov"),
            CreateObjectEntry(Constants.INDENT, "The Deed to Caer Darrow"),
            CreateNPCEntry("13", "Lady Illucia Barov"),
            CreateNPCEntry("14", "Darkmaster Gandling"),
            CreateSpecialEntry("1", "Torch Lever", Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Old Treasure Chest"]),
            CreateEntry(Colors.GREEN, "3') " .. L["Alchemy Lab"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Necropile Raiment"),
            CreateSetEntry("Cadaverous Garb"),
            CreateSetEntry("Bloodmail Regalia"),
            CreateSetEntry("Deathbone Guardian"),
            CreateSetEntry("Ironweave Battlesuit"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 0/0.5 Sets"])
        }
    }),

    ShadowfangKeep = CreateDungeonTemplate({
        zoneName = BZ["Shadowfang Keep"],
        acronym = "SFK",
        location = BZ["Silverpine Forest"],
        levelRange = "22-30",
        minLevel = "14",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Rethilgore"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sorcerer Ashcrombe"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Deathstalker Adamant"]),
            CreateEntry(Colors.GREY, "2) " .. L["Deathstalker Vincent"]),
            CreateEntry(Colors.GREY, "3) " .. L["Fel Steed"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jordan's Hammer"]),
            CreateNPCEntry("4", "Razorclaw the Butcher"),
            CreateNPCEntry("5", "Baron Silverlaine"),
            CreateNPCEntry("6", "Commander Springvale"),
            CreateEntry(Colors.GREY, "7) " .. BB["Sever"] .. " (" .. L["Scourge Invasion"] .. ")"),
            CreateNPCEntry("8", "Odo the Blindwatcher"),
            CreateNPCEntry("9", "Deathsworn Captain", true),
            CreateNPCEntry("10", "Fenrus the Devourer"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Arugal's Voidwalker"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Book of Ur"]),
            CreateNPCEntry("11", "Wolf Master Nandos"),
            CreateNPCEntry("12", "Archmage Arugal"),
            CreateNPCEntry("13", "Prelate Ironmane"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    Stratholme = CreateDungeonTemplate({
        zoneName = BZ["Stratholme"],
        acronym = "Strath",
        location = BZ["Eastern Plaguelands"],
        levelRange = "58-60",
        minLevel = "45",
        playerLimit = "10",
        continent = BZ["Eastern Kingdoms"],
        reputation = {
            name = "Argent Dawn",
            id = 529
        },
        keys = {
            { name = "The Scarlet Key", id = 7146, info = L["Living Side"] },
            { name = "Key to the City", id = 12382, info = L["Undead Side"] },
            { name = "Various Postbox Keys", id = nil, info = BB["Postmaster Malown"] },
            { name = "Brazier of Invocation", id = 22057, info = L["Tier 0.5 Summon"] }
        },
        entrances = {
            { letter = "A", info = L["Front"] },
            { letter = "B", info = L["Side"] }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BB["Skul"] .. " (" .. L["Rare"] .. ", " .. L["Varies"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Stratholme Courier"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Fras Siabi"]),
            CreateEntry(Colors.GREY, "2) " .. BB["Rethilgore"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Balzaphon"] .. " (" .. L["Scourge Invasion"] .. ")"),
            CreateEntry(Colors.GREY, "3) " .. BB["Hearthsinger Forresten"] .. " (" .. L["Rare"] .. ", " .. L["Varies"] .. ")"),
            CreateNPCEntry("4", "The Unforgiven"),
            CreateEntry(Colors.GREY, "5) " .. L["Elder Farwhisper"] .. " (" .. L["Lunar Festival"] .. ")"),
            CreateNPCEntry("6", "Timmy the Cruel"),
            CreateNPCEntry("7", "Malor the Zealous"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Malor's Strongbox"]),
            CreateEntry(Colors.GREY, "8) " .. L["Crimson Hammersmith"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"]),
            CreateNPCEntry("9", "Cannon Master Willey"),
            CreateNPCEntry("10", "Archivist Galford"),
            CreateEntry(Colors.GREY, "11) " .. L["Grand Crusader Dathrohan"]),
            CreateIndentedNPCEntry("Balnazzar"),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Sothos"] .. " & " .. BB["Jarien"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, "12) " .. BB["Magistrate Barthilas"] .. " (" .. L["Varies"] .. ")"),
            CreateEntry(Colors.GREY, "13) " .. L["Aurius"]),
            CreateEntry(Colors.GREY, "14) " .. BB["Stonespine"] .. " (" .. L["Rare"] .. ", " .. L["Wanders"] .. ")"),
            CreateNPCEntry("15", "Baroness Anastari"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Black Guard Swordsmith"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"]),
            CreateNPCEntry("16", "Nerub'enkan"),
            CreateNPCEntry("17", "Maleki the Pallid"),
            CreateNPCEntry("18", "Ramstein the Gorger"),
            CreateNPCEntry("19", "Baron Rivendare"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ysida Harmon"]),
            CreateSpecialEntry("1", "Crusaders' Square Postbox", Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Market Row Postbox"]),
            CreateEntry(Colors.GREEN, "3') " .. L["Festival Lane Postbox"]),
            CreateEntry(Colors.GREEN, "4') " .. L["Elders' Square Postbox"]),
            CreateEntry(Colors.GREEN, "5') " .. L["King's Square Postbox"]),
            CreateEntry(Colors.GREEN, "6') " .. L["Fras Siabi's Postbox"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Third Postbox Opened"] .. ": " .. BB["Postmaster Malown"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("The Postmaster"),
            CreateSetEntry("Ironweave Battlesuit"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 0/0.5 Sets"])
        }
    }),

    TheDeadmines = CreateDungeonTemplate({
        zoneName = BZ["The Deadmines"],
        acronym = "VC",
        location = BZ["Westfall"],
        levelRange = "17-24",
        minLevel = "10",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Exit"] }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BB["Jared Voss"]),
            CreateNPCEntry("2", "Rhahk'Zor"),
            CreateNPCEntry("3", "Miner Johnson", true),
            CreateNPCEntry("4", "Sneed"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sneed's Shredder"]),
            CreateNPCEntry("5", "Gilnid"),
            CreateEntry(Colors.GREY, "6) " .. BB["Masterpiece Harvester"]),
            CreateNPCEntry("7", "Mr. Smite"),
            CreateNPCEntry("8", "Cookie"),
            CreateNPCEntry("9", "Captain Greenskin"),
            CreateNPCEntry("10", "Edwin VanCleef"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Defias Leather")
        }
    }),

    TheStockade = CreateDungeonTemplate({
        zoneName = BZ["The Stockade"],
        acronym = "Stocks",
        location = BZ["Stormwind City"],
        levelRange = "24-31",
        minLevel = "15",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BB["Targorr the Dread"] .. " (" .. L["Varies"] .. ")"),
            CreateNPCEntry("2", "Kam Deepfury"),
            CreateNPCEntry("3", "Hamhock"),
            CreateNPCEntry("4", "Bazil Thredd"),
            CreateNPCEntry("5", "Dextren Ward"),
            CreateNPCEntry("6", "Bruegal Ironknuckle", true),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    TheSunkenTemple = CreateDungeonTemplate({
        zoneName = L["Sunken Temple"],
        acronym = "ST",
        location = BZ["Swamp of Sorrows"],
        levelRange = "45-54",
        minLevel = "35",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "Yeh'kinya's Scroll", id = 10818, info = BB["Avatar of Hakkar"] }
        },
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] },
            { letter = "C", info = L["Balcony Minibosses"] .. " (" .. L["Upper"] .. ")" }
        },
        entries = {
            CreateEntry(Colors.ORANGE, L["Mini Bosses"] .. ": " .. BZ["The Temple of Atal'Hakkar"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Gasher"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Loro"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Hukku"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Zolo"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Mijan"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Zul'Lor"]),
            CreateEntry(Colors.GREY, "1) " .. L["Altar of Hakkar"]),
            CreateIndentedNPCEntry("Atal'alarion"),
            CreateEntry(Colors.GREY, "2) " .. L["Spawn of Hakkar"] .. " (" .. L["Wanders"] .. ")"),
            CreateNPCEntry("3", "Avatar of Hakkar"),
            CreateNPCEntry("4", "Jammal'an the Prophet"),
            CreateIndentedNPCEntry("Ogom the Wretched"),
            CreateEntry(Colors.GREY, "5) " .. L["Elder Starsong"] .. " (" .. L["Lunar Festival"] .. ")"),
            CreateNPCEntry("6", "Dreamscythe"),
            CreateIndentedNPCEntry("Weaver"),
            CreateNPCEntry("7", "Morphaz"),
            CreateIndentedNPCEntry("Hazzas"),
            CreateNPCEntry("8", "Shade of Eranikus"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Essence Font"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Malfurion Stormrage"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREEN, "1'-6') " .. L["Statue Activation Order"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    Uldaman = CreateDungeonTemplate({
        zoneName = BZ["Uldaman"],
        acronym = "Ulda",
        location = BZ["Badlands"],
        levelRange = "41-51",
        minLevel = "30",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "Staff of Prehistoria", id = 7733, info = BB["Ironaya"] }
        },
        entrances = {
            { letter = "A", info = L["Front"] },
            { letter = "B", info = L["Back"] }
        },
        entries = {
            CreateNPCEntry("1", "Baelog"),
            CreateIndentedNPCEntry("Eric \"The Swift\""),
            CreateIndentedNPCEntry("Olaf"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Baelog's Chest"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Conspicuous Urn"]),
            CreateEntry(Colors.GREY, "2) " .. L["Remains of a Paladin"]),
            CreateNPCEntry("3", "Revelosh"),
            CreateNPCEntry("4", "Ironaya"),
            CreateNPCEntry("5", "Obsidian Sentinel"),
            CreateEntry(Colors.GREY, "6) " .. L["Annora"]),
            CreateNPCEntry("7", "Ancient Stone Keeper"),
            CreateNPCEntry("8", "Galgann Firehammer"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tablet of Will"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Shadowforge Cache"]),
            CreateNPCEntry("9", "Grimlok"),
            CreateNPCEntry("10", "Archaedas", false, L["Lower"]),
            CreateEntry(Colors.GREY, "11) " .. L["The Discs of Norgannon"] .. " (" .. L["Lower"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ancient Treasure"] .. " (" .. L["Lower"] .. ")"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    ZulGurub = CreateDungeonTemplate({
        zoneName = BZ["Zul'Gurub"],
        acronym = "ZG",
        location = BZ["Stranglethorn Vale"],
        levelRange = "60+",
        minLevel = "51",
        playerLimit = "20",
        continent = BZ["Eastern Kingdoms"],
        reputation = {
            name = "Zandalar Tribe",
            id = 270
        },
        keys = {
            { name = "Gurubashi Mojo Madness", id = 19931, info = L["Edge of Madness"] },
            { name = "Mudskunk Lure", id = 19974, info = BB["Gahz'ranka"] }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BB["High Priestess Jeklik"] .. " (" .. L["Bat"] .. ")"),
            CreateEntry(Colors.GREY, "2) " .. BB["High Priest Venoxis"] .. " (" .. L["Snake"] .. ")"),
            CreateEntry(Colors.GREY, "3) " .. L["Zanza the Restless"]),
            CreateEntry(Colors.GREY, "4) " .. BB["High Priestess Mar'li"] .. " (" .. L["Spider"] .. ")"),
            CreateEntry(Colors.GREY, "5) " .. BB["Bloodlord Mandokir"] .. " (" .. L["Raptor"] .. ", " .. L["Optional"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ohgan"]),
            CreateEntry(Colors.GREY, "6) " .. L["Edge of Madness"] .. " (" .. L["Optional"] .. ")"),
            CreateIndentedNPCEntry("Gri'lek", L["Random"]),
            CreateIndentedNPCEntry("Hazza'rah", L["Random"]),
            CreateIndentedNPCEntry("Renataki", L["Random"]),
            CreateIndentedNPCEntry("Wushoolay", L["Random"]),
            CreateEntry(Colors.GREY, "7) " .. BB["Gahz'ranka"] .. " (" .. L["Optional"] .. ", " .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, "8) " .. BB["High Priest Thekal"] .. " (" .. L["Tiger"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zealot Zath"] .. " (|cfffff468" .. BC["Rogue"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zealot Lor'Khan"] .. " (|cff2773ff" .. BC["Shaman"] .. Colors.GREY .. ")"),
            CreateEntry(Colors.GREY, "9) " .. BB["High Priestess Arlokk"] .. " (" .. L["Panther"] .. ")"),
            CreateEntry(Colors.GREY, "10) " .. BB["Jin'do the Hexxer"] .. " (" .. L["Optional"] .. ")"),
            CreateNPCEntry("11", "Hakkar"),
            CreateSpecialEntry("1", "Muddy Churning Waters", Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Jinxed Hoodoo Pile"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Random Boss Loot"]),
            CreateSetEntry("Primal Blessing"),
            CreateSetEntry("The Twin Blades of Hakkari"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zul'Gurub Ring Sets"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zul'Gurub Sets"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["ZG Enchants"]),
            CreateEmptyEntry()
        },
        damageType = "Nature"
    }),

    --************************************************
    -- Instance Entrances
    --************************************************
    DireMaulEnt = CreateDungeonTemplate({
        zoneName = BZ["Dire Maul"] .. " (" .. L["Entrance"] .. ")",
        acronym = "DM",
        location = BZ["Feralas"],
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Dire Maul"] .. " (" .. L["East"] .. ")" },
            { letter = "C", info = BZ["Dire Maul"] .. " (" .. L["North"] .. ")" },
            { letter = "D", info = BZ["Dire Maul"] .. " (" .. L["West"] .. ")" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Dire Pool"]),
            CreateEntry(Colors.GREY, "2) " .. L["Dire Maul Arena"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mushgog"] .. " (" .. L["Rare"] .. ", " .. L["Random"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Skarr the Unbreakable"] .. " (" .. L["Rare"] .. ", " .. L["Random"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Razza"] .. " (" .. L["Rare"] .. ", " .. L["Random"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Mistwalker"] .. " (" .. L["Lunar Festival"] .. ")"),
            CreateEntry(Colors.GREY, "3) " .. L["Griniblix the Spectator"])
        }
    }),

    SMEnt = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. " (" .. L["Entrance"] .. ")",
        acronym = "SM",
        location = BZ["Tirisfal Glades"],
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Graveyard"] },
            { letter = "C", info = L["Cathedral"] },
            { letter = "D", info = L["Armory"] },
            { letter = "E", info = L["Library"] }
        }
    }),

    BlackfathomDeepsEnt = CreateDungeonTemplate({
        zoneName = BZ["Blackfathom Deeps"] .. " (" .. L["Entrance"] .. ")",
        acronym = "BFD",
        location = BZ["Ashenvale"],
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Blackfathom Deeps"] }
        },
        entries = {}
    }),

    BlackrockMountainEnt = CreateDungeonTemplate({
        zoneName = BZ["Blackrock Mountain"] .. " (" .. L["Entrance"] .. ")",
        acronym = "BRM",
        location = BZ["Blackrock Mountain"],
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A", info = BZ["Searing Gorge"] },
            { letter = "B", info = BZ["Burning Steppes"] },
            { letter = "C", info = BZ["Blackrock Depths"] .. " (BRD)" },
            { letter = "D", info = BZ["Lower Blackrock Spire"] .. " (LBRS)" }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. BZ["Molten Core"] .. " (MC) (" .. L["through "] .. "BRD)"),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BZ["Upper Blackrock Spire"] .. " (UBRS)"),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BZ["Blackwing Lair"] .. " (BWL) (" .. L["through "] .. "UBRS)"),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Bodley"] .. " (" .. L["Ghost"] .. ")"),
            CreateNPCEntry("1", "Overmaster Pyron", false, L["Wanders"]),
            CreateNPCEntry("2", "Lothos Riftwaker", false, "MC " .. L["Teleport"]),
            CreateNPCEntry("3", "Franclorn Forgewright", false, L["Ghost"]),
            CreateEntry(Colors.GREY, "4) " .. L["Meeting Stone"] .. " (BRD)"),
            CreateEntry(Colors.GREY, "5) " .. L["Orb of Command"] .. " (BWL " .. L["Teleport"] .. ")"),
            CreateEntry(Colors.GREY, "6) " .. L["Meeting Stone"] .. " (LBRS, UBRS)"),
            CreateNPCEntry("7", "Scarshield Quartermaster", true),
            CreateNPCEntry("8", "The Behemoth", true)
        }
    }),

    GnomereganEnt = CreateDungeonTemplate({
        zoneName = BZ["Gnomeregan"] .. " (" .. L["Entrance"] .. ")",
        acronym = "Gnome",
        location = BZ["Dun Morogh"],
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Gnomeregan"] .. " (" .. L["Front"] .. ")" },
            { letter = "C", info = BZ["Gnomeregan"] .. " (" .. L["Back"] .. ")" }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Meeting Stone"]),
            CreateEntry(Colors.GREY, "1) " .. L["Elevator"]),
            CreateEntry(Colors.GREY, "2) " .. L["Transpolyporter"]),
            CreateIndentedNPCEntry("Sprok"),
            CreateEntry(Colors.GREY, "3) " .. L["Matrix Punchograph 3005-A"]),
            CreateIndentedNPCEntry("Namdo Bizzfizzle"),
            CreateNPCEntry("4", "Techbot"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    MaraudonEnt = CreateDungeonTemplate({
        zoneName = BZ["Maraudon"] .. " (" .. L["Entrance"] .. ")",
        acronym = "Mara",
        location = BZ["Desolace"],
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Maraudon"] .. " (" .. L["Purple"] .. ")" },
            { letter = "C", info = BZ["Maraudon"] .. " (" .. L["Orange"] .. ")" },
            { letter = "D", info = BZ["Maraudon"] .. " (" .. L["Portal"] .. ")" }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["The Nameless Prophet"]),
            CreateNPCEntry("1", "Kolk"),
            CreateNPCEntry("2", "Gelk"),
            CreateNPCEntry("3", "Magra"),
            CreateNPCEntry("4", "Cavindra"),
            CreateNPCEntry("5", "Cursed Centaur", true, L["Varies"]),
        }
    }),

    TheDeadminesEnt = CreateDungeonTemplate({
        zoneName = BZ["The Deadmines"] .. " (" .. L["Entrance"] .. ")",
        acronym = "DM",
        location = BZ["Westfall"],
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["The Deadmines"] }
        },
        entries = {
            CreateNPCEntry("1", "Marisa du'Paige", true, L["Varies"]),
            CreateNPCEntry("2", "Brainwashed Noble", true),
            CreateNPCEntry("3", "Foreman Thistlenettle")
        }
    }),

    TheSunkenTempleEnt = CreateDungeonTemplate({
        zoneName = L["Sunken Temple"] .. " (" .. L["Entrance"] .. ")",
        acronym = "ST",
        location = BZ["Swamp of Sorrows"],
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Sunken Temple"] }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Meeting Stone"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Jade"] .. " (" .. L["Rare"] .. ")"),
            CreateNPCEntry("1", "Kazkaz the Unholy", true, L["Upper"]),
            CreateNPCEntry("2", "Zekkis", true, L["Lower"]),
            CreateNPCEntry("3", "Veyzhak the Cannibal", true)
        }
    }),

    UldamanEnt = CreateDungeonTemplate({
        zoneName = BZ["Uldaman"] .. " (" .. L["Entrance"] .. ")",
        acronym = "Ulda",
        location = BZ["Badlands"],
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Uldaman"] }
        },
        entries = {
            CreateNPCEntry("1", "Hammertoe Grez"),
            CreateNPCEntry("2", "Magregan Deepshadow", false, L["Wanders"]),
            CreateItemEntry("3", "Tablet of Ryun'Eh"),
            CreateObjectEntry("4", "Krom Stoutarm's Chest"),
            CreateObjectEntry("5", "Garrett Family Chest"),
            CreateSpecialEntry("1", "Digmaster Shovelphlange", Colors.GREEN, L["Rare"] .. ", " .. L["Varies"])
        }
    }),

    WailingCavernsEnt = CreateDungeonTemplate({
        zoneName = BZ["Wailing Caverns"] .. " (" .. L["Entrance"] .. ")",
        acronym = "WC",
        location = BZ["The Barrens"],
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Wailing Caverns"] }
        },
        entries = {
            CreateNPCEntry("1", "Mad Magglish", false, L["Varies"]),
            CreateNPCEntry("2", "Trigore the Lasher", true),
            CreateNPCEntry("3", "Boahn", true),
            CreateEmptyEntry(),
            CreateEntry(Colors.ORANGE, L["Above the Entrance:"]),
            CreateEntry(Colors.GREY, "Ebru"),
            CreateEntry(Colors.GREY, "Nalpak"),
            CreateEntry(Colors.GREY, "Kalldan Felmoon"),
            CreateEntry(Colors.GREY, "Waldor"),
        }
    }),

    --************************************************
    -- World Bosses
    --************************************************

    Azuregos = CreateDungeonTemplate({
        zoneName = BB["Azuregos"],
        location = BZ["Azshara"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        entries = {
            CreateNPCEntry("1", "Azuregos"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Spirit of Azuregos"]),
        },
        damageType = "Frost"
    }),

    FourDragons = CreateDungeonTemplate({
        zoneName = L["Emerald Dragons"],
        location = L["Various"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BZ["Duskwood"]),
            CreateEntry(Colors.GREY, "2) " .. BZ["The Hinterlands"]),
            CreateEntry(Colors.GREY, "3) " .. BZ["Feralas"]),
            CreateEntry(Colors.GREY, "4) " .. BZ["Ashenvale"]),
            CreateEmptyEntry(),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Lethon"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Emeriss"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Taerar"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Ysondre"]),
            CreateEmptyEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Emerald Dragons Trash"]),
        },
        damageType = "Nature, Shadow"
    }),

    LordKazzak = CreateDungeonTemplate({
        zoneName = BB["Lord Kazzak"],
        location = BZ["Blasted Lands"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        entries = {
            CreateNPCEntry("1", "Lord Kazzak"),
            CreateEntry(Colors.GREY, "2) " .. L["Nethergarde Keep"]),
        },
        damageType = "Shadow"
    }),

    --************************************************
    -- Turtle WoW Custom Content
    --************************************************

    TheCrescentGrove = CreateDungeonTemplate({
        zoneName = BZ["The Crescent Grove"],
        acronym = "CG",
        location = BZ["Ashenvale"],
        levelRange = "32-38",
        minLevel = "32",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Kalanar's Strongbox"]),
            CreateNPCEntry("1", "Grovetender Engryss"),
            CreateNPCEntry("2", "Keeper Ranathos"),
            CreateNPCEntry("3", "High Priestess A'lathea"),
            CreateNPCEntry("4", "Fenektis the Deceiver"),
            CreateNPCEntry("5", "Master Raxxieth"),
            CreateTrashMobsEntry()
        }
    }),

    KarazhanCrypt = CreateDungeonTemplate({
        zoneName = BZ["Karazhan Crypt"],
        acronym = "KC",
        location = BZ["Deadwind Pass"],
        minLevel = "58",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        keys = {
            { name = "Karazhan Crypt Key", id = 51356 }
        },
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Marrowspike"),
            CreateNPCEntry("2", "Hivaxxis"),
            CreateNPCEntry("3", "Corpsemuncher"),
            CreateNPCEntry("4", "Guard Captain Gort"),
            CreateNPCEntry("5", "Archlich Enkhraz"),
            CreateNPCEntry("6", "Commander Andreon"),
            CreateNPCEntry("7", "Alarus"),
            CreateEntry(Colors.GREY, "8) " .. "Half-Buried Treasure Chest"),
            CreateTrashMobsEntry()
        }
    }),

    GilneasCity = CreateDungeonTemplate({
        zoneName = BZ["Gilneas City"],
        acronym = "GC",
        location = BZ["Gilneas"],
        levelRange = "43-49",
        minLevel = "43",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Matthias Holtz"),
            CreateNPCEntry("2", "Packmaster Ragetooth"),
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Dawnstone Plans"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "b) " .. L["Manuscript of Hydromancy II"]),
            CreateNPCEntry("3", "Judge Sutherland"),
            CreateNPCEntry("4", "Dustivan Blackcowl"),
            CreateNPCEntry("5", "Marshal Magnus Greystone"),
            CreateNPCEntry("6", "Horsemaster Levvin"),
            CreateObjectEntry("7", "Harlow Family Chest"),
            CreateNPCEntry("8", "Genn Greymane"),
            CreateTrashMobsEntry(),
            CreateSetEntry("Greymane Armor")
        }
    }),

    HateforgeQuarry = CreateDungeonTemplate({
        zoneName = BZ["Hateforge Quarry"],
        acronym = "HQ",
        location = BZ["Burning Steppes"],
        levelRange = "52-60",
        minLevel = "48",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "High Foreman Bargul Blackhammer"),
            CreateNPCEntry("2", "Engineer Figgles"),
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Hateforge Chemistry Documents"]),
            CreateNPCEntry("3", "Corrosis"),
            CreateNPCEntry("4", "Hatereaver Annihilator"),
            CreateNPCEntry("5", "Hargesh Doomcaller"),
            CreateTrashMobsEntry(),
            CreateEmptyEntry(),
            CreateSetEntry("Incendosaur Skin Armor")
        }
    }),

    StormwindVault = CreateDungeonTemplate({
        zoneName = BZ["Stormwind Vault"],
        acronym = "SV",
        location = BZ["Stormwind City"],
        levelRange = "58-60",
        minLevel = "58",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Aszosh Grimflame"),
            CreateNPCEntry("2", "Tham'Grarr"),
            CreateNPCEntry("3", "Black Bride"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tome of Arcane Intricacies and Magical Phenomenon IX"]),
            CreateNPCEntry("4", "Damian"),
            CreateNPCEntry("5", "Volkan Cruelblade"),
            CreateEntry(Colors.GREY, "6) " .. L["Arc'tiras / Vault Armory Equipment"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    CavernsOfTimeBlackMorass = CreateDungeonTemplate({
        zoneName = BZ["Caverns of Time: Black Morass"],
        acronym = "BM",
        location = BZ["Tanaris"],
        levelRange = "58-60",
        minLevel = "58",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] }
        },
        entries = {
            CreateNPCEntry("1", "Chronar"),
            CreateNPCEntry("2", "Epidamu"),
            CreateNPCEntry("3", "Drifting Avatar of Sand"),
            CreateNPCEntry("4", "Time-Lord Epochronos"),
            CreateNPCEntry("5", "Mossheart"),
            CreateNPCEntry("6", "Antnormi"),
            CreateNPCEntry("7", "Rotmaw"),
            CreateTrashMobsEntry()
        }
    }),

    LowerKarazhan = CreateDungeonTemplate({
        zoneName = BZ["Lower Karazhan Halls"],
        acronym = "LKH",
        location = BZ["Deadwind Pass"],
        levelRange = "58-60",
        minLevel = "58",
        playerLimit = "10",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] }
        },
        entries = {
            CreateNPCEntry("1", "Master Blacksmith Rolfen"),
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Engraved Golden Bracelet"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "b) " .. L["Comfortable Pillow"]),
            CreateNPCEntry("2", "Brood Queen Araxxna"),
            CreateNPCEntry("3", "Grizikil"),
            CreateEntry(Colors.GREY, Constants.INDENT .. "c) " .. L["Councilman Kyleson"]),
            CreateNPCEntry("4", "Clawlord Howlfang"),
            CreateNPCEntry("5", "Lord Blackwald II"),
            CreateEntry(Colors.GREY, Constants.INDENT .. "d) " .. L["Lord Ebonlocke"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "e) " .. L["Obsidian Rod"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "f) " .. L["Duke Rothlen"]),
            CreateNPCEntry("6", "Moroes"),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lower Karazhan Halls Enchants"])
        }
    }),

    EmeraldSanctum = CreateDungeonTemplate({
        zoneName = BZ["Emerald Sanctum"],
        acronym = "ES",
        location = BZ["Hyjal"],
        levelRange = "60+",
        minLevel = "58",
        playerLimit = "40",
        continent = BZ["Kalimdor"],
        entries = {
            CreateEmptyEntry(),
            CreateNPCEntry("1", "Erennius"),
            CreateNPCEntry("2", "Solnius the Awakener"),
            CreateObjectEntry("3", "Favor of Erennius (ES Hard Mode)"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    TowerofKarazhan = CreateDungeonTemplate({
        zoneName = BZ["Tower of Karazhan"],
        acronym = "K40, KARA40",
        location = BZ["Deadwind Pass"],
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] }
        },
        entries = {
            CreateNPCEntry("1", "Keeper Gnarlmoon"),
            CreateNPCEntry("2", "Ley-Watcher Incantagos"),
            CreateNPCEntry("3", "Anomalus"),
            CreateNPCEntry("4", "Echo of Medivh"),
            CreateEntry(Colors.GREY, "5) " .. BB["King"] .. " (Chess fight)"),
            CreateNPCEntry("6", "Sanv Tas'dal"),
            CreateNPCEntry("7", "Rupturan the Broken"),
            CreateNPCEntry("8", "Kruul"),
            CreateNPCEntry("9", "Mephistroth"),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tower of Karazhan Sets"])
        }
    }),

    StormwroughtRuins = CreateDungeonTemplate({
        zoneName = BZ["Stormwrought Ruins"],
        acronym = "SR",
        location = BZ["Balor"],
        levelRange = "35-42",
        minLevel = "28",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) "),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    -- World Bosses (continued)
    Turtlhu = CreateDungeonTemplate({
        zoneName = "Turtlhu, the Black Turtle of Doom",
        location = BZ["Feralas"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        damageType = "Shadow",
        entries = {
            CreateEntry(Colors.GREY, "1) Turtlhu, the Black Turtle of Doom"),
        }
    }),

    Nerubian = CreateDungeonTemplate({
        zoneName = BB["Nerubian Overseer"],
        acronym = "Spooder",
        location = BZ["Eastern Plaguelands"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        damageType = L["Nature"] .. ", " .. L["Shadow"],
        entries = {
            CreateNPCEntry("1", "Nerubian Overseer"),
        }
    }),

    Reaver = CreateDungeonTemplate({
        zoneName = BB["Dark Reaver of Karazhan"],
        acronym = "Reaver",
        location = BZ["Deadwind Pass"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        entries = {
            CreateNPCEntry("1", "Dark Reaver of Karazhan")
        }
    }),

    CowKing = CreateDungeonTemplate({
        zoneName = BB["Moo"],
        acronym = "CowKing",
        location = BZ["Moomoo Grove"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "20+",
        continent = BZ["Eastern Kingdoms"],
        entries = {
            CreateNPCEntry("1", "Moo")
        }
    }),

    Concavius = CreateDungeonTemplate({
        zoneName = "Concavius Voidwalker",
        acronym = "Concavius",
        location = BZ["Desolace"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        continent = BZ["Kalimdor"],
        entries = {
            CreateNPCEntry("1", "Concavius")
        }
    }),

    Ostarius = CreateDungeonTemplate({
        zoneName = BB["Ostarius"],
        acronym = "Ostarius",
        location = BZ["Tanaris"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        continent = BZ["Kalimdor"],
        entries = {
            CreateNPCEntry("1", "Ostarius")
        }
    }),

    Clackora = CreateDungeonTemplate({
        zoneName = BB["Cla'ckora"],
        acronym = "Clackora",
        location = BZ["Azshara"],
        levelRange = "60+",
        minLevel = "1",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        entries = {
            CreateNPCEntry("1", "Cla'ckora")
        }
    }),

    RareMobs = CreateDungeonTemplate({
        zoneName = L["Rare Mobs"],
        location = L["Various locations"],
        levelRange = "17-60",
        minLevel = "1",
        entries = {
            CreateEntry(Colors.GREY, "1) "..L["Shade Mage"] .. Colors.RED .. " 0.4k (17L) " .. Colors.WHITE .. BZ["Tirisfal Glades"] .. Colors.ORANGE .. " [15, 68]"),
            CreateEntry(Colors.GREY, "2) "..L["Graypaw Alpha"] .. Colors.RED .. " 0.7k (18L) " .. Colors.WHITE .. BZ["Tirisfal Glades"] .. Colors.ORANGE .. " [27, 58]"),
            CreateEntry(Colors.GREY, "3) "..L["Earthcaller Rezengal"] .. Colors.RED .. " 0.4k (18L) " .. Colors.WHITE .. BZ["Stonetalon Mountains"] .. Colors.ORANGE .. " [74, 79]"),
            CreateEntry(Colors.GREY, "4) "..L["Blazespark"] .. Colors.RED .. " 0.8k (24L) " .. Colors.WHITE .. BZ["Stonetalon Mountains"] .. Colors.ORANGE .. " [21, 29]"),
            CreateEntry(Colors.GREY, "5) "..L["Witch Doctor Tan'zo"] .. Colors.RED .. " 2k (35L) " .. Colors.WHITE .. BZ["Arathi Highlands"] .. Colors.ORANGE .. " [44, 13]"),
            CreateEntry(Colors.GREY, "6) "..L["Dawnhowl"] .. Colors.RED .. " 2k (40L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [43, 23]"),
            CreateEntry(Colors.GREY, "7) "..L["Widow of the Woods"] .. Colors.RED .. " 6k (40L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [30, 50]"),
            CreateEntry(Colors.GREY, "8) "..L["Maltimor's Prototype"] .. Colors.RED .. " 6k (43L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [48, 57]"),
            CreateEntry(Colors.GREY, "9) "..L["Bonecruncher"] .. Colors.RED .. " 2k (44L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [54, 56]"),
            CreateEntry(Colors.GREY, "10) "..L["Duskskitterer"] .. Colors.RED .. " 2k (44L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [46, 78]"),
            CreateEntry(Colors.GREY, "11) "..L["Baron Perenolde"] .. Colors.RED .. " 3k (45L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [67, 80]"),
            CreateEntry(Colors.GREY, "12) "..L["Kin'Tozo"] .. Colors.RED .. " 20k (45L) " .. Colors.WHITE .. BZ["Stranglethorn Vale"] .. Colors.ORANGE .. " [27, 55]"),
            CreateEntry(Colors.GREY, "13) "..L["M-0L1Y"] .. Colors.RED .. " 3k (47L) " .. Colors.WHITE .. BZ["Icepoint Rock"] .. Colors.ORANGE .. " [54, 40]"),
            CreateEntry(Colors.GREY, "14) "..L["Grug'thok the Seer"] .. Colors.RED .. " 15k (47L) " .. Colors.WHITE .. BZ["Feralas"] .. Colors.ORANGE .. " [58, 71]"),
            CreateEntry(Colors.GREY, "15) "..L["Explorer Ashbeard"] .. Colors.RED .. " 16k (49L) " .. Colors.WHITE .. BZ["Searing Gorge"] .. Colors.ORANGE .. " [71, 18]"),
            CreateEntry(Colors.GREY, "16) "..L["Jal'akar"] .. Colors.RED .. " 18k (50L) " .. Colors.WHITE .. BZ["The Hinterlands"] .. Colors.ORANGE .. " [53, 34]"),
            CreateEntry(Colors.GREY, "17) "..L["Ripjaw"] .. Colors.RED .. " 9k (51L) " .. Colors.WHITE .. BZ["Lapidis Isle"] .. Colors.ORANGE .. " [55, 21]"),
            CreateEntry(Colors.GREY, "18) "..L["Ruk'thok the Pyromancer"] .. Colors.RED .. " 3k (51L) " .. Colors.WHITE .. BZ["Lapidis Isle"] .. Colors.ORANGE .. " [43, 29]"),
            CreateEntry(Colors.GREY, "19) "..L["Embereye"] .. Colors.RED .. " 4k (51L) " .. Colors.WHITE .. BZ["Gillijim's Isle"] .. Colors.ORANGE .. " [67, 69]"),
            CreateEntry(Colors.GREY, "20) "..L["Xalvic Blackclaw"] .. Colors.RED .. " 19k (53L) " .. Colors.WHITE .. BZ["Felwood"] .. Colors.ORANGE .. " [53, 29]"),
            CreateEntry(Colors.GREY, "21) "..L["Firstborn of Arugal"] .. Colors.RED .. " 10k (55L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [40, 37]"),
            CreateEntry(Colors.GREY, "22) "..L["Margon the Mighty"] .. Colors.RED .. " 25k (55L) " .. Colors.WHITE .. BZ["Lapidis Isle"] .. Colors.ORANGE .. " [30, 41]"),
            CreateEntry(Colors.GREY, "23) "..L["The Wandering Knight"] .. Colors.RED .. " 22k (55L) " .. Colors.WHITE .. BZ["Western Plaguelands"] .. Colors.ORANGE .. " [64, 74]"),
            CreateEntry(Colors.GREY, "24) "..L["Letashaz"] .. Colors.RED .. " 25k (55L) " .. Colors.WHITE .. BZ["Gillijim's Isle"] .. Colors.ORANGE .. " [29, 89]"),
            CreateEntry(Colors.GREY, "25) "..L["Aquitus"] .. Colors.RED .. " 7k (56L) " .. Colors.WHITE .. BZ["Gillijim's Isle"] .. Colors.ORANGE .. " [27, 70]"),
            CreateEntry(Colors.GREY, "26) "..L["Stoneshell"] .. Colors.RED .. " 4k (56L) " .. Colors.WHITE .. BZ["Tel'Abim"] .. Colors.ORANGE .. " [40, 47]"),
            CreateEntry(Colors.GREY, "27) "..L["Tarangos"] .. Colors.RED .. " 23k (56L) " .. Colors.WHITE .. BZ["Azshara"] .. Colors.ORANGE .. " [42, 80]"),
            CreateEntry(Colors.GREY, "28) "..L["Zareth Terrorblade"] .. Colors.RED .. " 23k (57L) " .. Colors.WHITE .. BZ["Blasted Lands"] .. Colors.ORANGE .. " [55, 59]"),
            CreateEntry(Colors.GREY, "29) "..L["Highvale Silverback"] .. Colors.RED .. " 4k (58L) " .. Colors.WHITE .. BZ["Tel'Abim"] .. Colors.ORANGE .. " [57, 48]"),
            CreateEntry(Colors.GREY, "30) "..L["Mallon The Moontouched"] .. Colors.RED .. " 27k (58L) " .. Colors.WHITE .. BZ["Winterspring"] .. Colors.ORANGE .. " [57, 61]"),
            CreateEntry(Colors.GREY, "31) "..L["Professor Lysander"] .. Colors.RED .. " 9k (59L) " .. Colors.WHITE .. BZ["Western Plaguelands"] .. Colors.ORANGE .. " [12, 50]"),
            CreateEntry(Colors.GREY, "32) "..L["Blademaster Kargron"] .. Colors.RED .. " 28k (59L) " .. Colors.WHITE .. BZ["Burning Steppes"] .. Colors.ORANGE .. " [45, 32]"),
            CreateEntry(Colors.GREY, "33) "..L["Azurebeak"] .. Colors.RED .. " 20k (60L) " .. Colors.WHITE .. BZ["Hyjal"] .. Colors.ORANGE .. " [23, 37]"),
            CreateEntry(Colors.GREY, "34) "..L["Barkskin Fisher"] .. Colors.RED .. " 5k (60L) " .. Colors.WHITE .. BZ["Hyjal"] .. Colors.ORANGE .. " [66, 53]"),
            CreateEntry(Colors.GREY, "35) "..L["Admiral Barean Westwind"] .. Colors.RED .. " 141k (60L) " .. Colors.WHITE .. BZ["Eastern Plaguelands"] .. Colors.ORANGE .. " [66, 42]"),
            CreateEntry(Colors.GREY, "36) "..L["Shadeflayer Goliath"] .. Colors.RED .. " 17k (61L) " .. Colors.WHITE .. BZ["Hyjal"] .. Colors.ORANGE .. " [10, 44]"),
            CreateEntry(Colors.GREY, "37) "..L["Crusader Larsarius"] .. Colors.RED .. " 28k (61L) " .. Colors.WHITE .. BZ["Eastern Plaguelands"] .. Colors.ORANGE .. " [47, 60]"),
        }
    }),

    --************************************************
    -- PvP Battlegrounds
    --************************************************

    BGAlteracValleyNorth = CreateDungeonTemplate({
        zoneName = BZ["Alterac Valley"] .. " (" .. L["North"] .. ")",
        acronym = "AV",
        location = BZ["Alterac Mountains"],
        levelRange = "51-60",
        minLevel = "51",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        reputation = {
            name = "Stormpike Guard",
            id = 730
        },
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Dun Baldar"] }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Vanndar Stormpike"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar North Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar South Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Icewing Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Stonehearth Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Iceblood Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Tower Point Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["East Frostwolf Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["West Frostwolf Marshal"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Prospector Stonehewer"]),
            CreateEntry(Colors.RED, "1) " .. L["Irondeep Mine"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Morloch"] .. " (" .. L["Neutral"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Umi Thorson"] .. " (" .. BF["Alliance"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Keetar"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.GREY, "2) " .. L["Arch Druid Renferal"]),
            CreateEntry(Colors.ORANGE, "3) " .. L["Dun Baldar North Bunker"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Mulverick"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.GREY, "4) " .. L["Murgot Deepforge"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dirk Swindle"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Athramanis"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lana Thunderbrew"]),
            CreateEntry(Colors.RED, "5) " .. L["Stormpike Aid Station"]),
            CreateEntry(Colors.GREY, "6) " .. L["Stormpike Stable Master"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Stormpike Ram Rider Commander"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Svalbrad Farmountain"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Kurdrum Barleybeard"]),
            CreateEntry(Colors.GREY, "7) " .. L["Stormpike Quartermaster"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jonivera Farmountain"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Brogus Thunderbrew"]),
            CreateEntry(Colors.GREY, "8) " .. L["Wing Commander Ichman"] .. " (" .. L["Rescued"] ..  ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Slidore"] .. " (" .. L["Rescued"] ..  ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Vipore"] .. " (" .. L["Rescued"] ..  ")"),
            CreateEntry(Colors.ORANGE, "9) " .. L["Dun Baldar South Bunker"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Corporal Noreg Stormpike"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Gaelden Hammersmith"]),
            CreateEntry(Colors.RED, "10) " .. L["Stormpike Graveyard"]),
            CreateEntry(Colors.GREY, "11) " .. L["Icewing Cavern"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Stormpike Banner"]),
            CreateEntry(Colors.GREY, "12) " .. L["Stormpike Lumber Yard"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Jeztor"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.ORANGE, "13) " .. L["Icewing Bunker"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Guse"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.RED, "14) " .. L["Stonehearth Graveyard"]),
            CreateEntry(Colors.GREY, "15) " .. L["Stormpike Ram Rider Commander"]),
            CreateEntry(Colors.ORANGE, "16) " .. L["Stonehearth Outpost"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Balinda Stonehearth"]),
            CreateEntry(Colors.RED, "17) " .. L["Snowfall Graveyard"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ichman's Beacon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mulverick's Beacon"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Korrak the Bloodrager"]),
            CreateEntry(Colors.ORANGE, "18) " .. L["Stonehearth Bunker"]),
            CreateEntry(Colors.GREY, "19) " .. L["Ivus the Forest Lord"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.GREY, "20) " .. L["Western Crater"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Vipore's Beacon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jeztor's Beacon"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.GREY, "21) " .. L["Eastern Crater"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Slidore's Beacon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Guse's Beacon"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.GREY, "22) " .. L["Steamsaw"] .. " (" .. BF["Horde"] .. ")"),
            CreateEmptyEntry(),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Friendly Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Honored Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Revered Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Exalted Reputation Rewards"]),
            CreateEmptyEntry(),
            CreateEntry(Colors.RED, L["Red"] .. ": " .. Colors.RED .. L["Graveyards, Capturable Areas"]),
            CreateEntry(Colors.ORANGE, L["Orange"] .. ": " .. Colors.ORANGE .. L["Bunkers, Towers, Destroyable Areas"]),
            CreateEntry(Colors.GREY, L["White"] .. ": " .. Colors.GREY .. L["Assault NPCs, Quest Areas"])
        }
    }),

    BGAlteracValleySouth = CreateDungeonTemplate({
        zoneName = BZ["Alterac Valley"] .. " (" .. L["South"] .. ")",
        acronym = "AV",
        location = BZ["Hillsbrad Foothills"],
        levelRange = "51-60",
        minLevel = "51",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        reputation = {
            name = "Frostwolf Clan",
            id = 729
        },
        entrances = {
            { letter = "A", info = L["Entrance"] .. " (" .. BF["Horde"] .. ")" },
            { letter = "B", info = L["Frostwolf Keep"] }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Drek'Thar"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Duros"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Drakan"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["West Frostwolf Warmaster"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["East Frostwolf Warmaster"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Tower Point Warmaster"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Iceblood Warmaster"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Stonehearth Warmaster"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Icewing Warmaster"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar North Warmaster"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar South Warmaster"]),
            CreateEntry(Colors.GREY, "1) " .. L["Lokholar the Ice Lord"] .. " (" .. L["Summon"] .. ")"),
            CreateEntry(Colors.ORANGE, "2) " .. L["Iceblood Garrison"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Galvangar"]),
            CreateEntry(Colors.ORANGE, "3) " .. L["Iceblood Tower"]),
            CreateEntry(Colors.RED, "4) " .. L["Iceblood Graveyard"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Ichman"] .. " (" .. BF["Alliance"] .. ")"),
            CreateEntry(Colors.ORANGE, "5) " .. L["Tower Point"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Slidore"] .. " (" .. BF["Alliance"] .. ")"),
            CreateEntry(Colors.GREY, "6) " .. L["Coldtooth Mine"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Taskmaster Snivvle"] .. " (" .. L["Neutral"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Masha Swiftcut"] .. " (" .. BF["Horde"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Aggi Rumblestomp"] .. " (" .. BF["Alliance"] .. ")"),
            CreateEntry(Colors.RED, "7) " .. L["Frostwolf Graveyard"]),
            CreateEntry(Colors.GREY, "8) " .. L["Wing Commander Vipore"] .. " (" .. BF["Alliance"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jotek"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Smith Regzar"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Primalist Thurloga"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sergeant Yazra Bloodsnarl"]),
            CreateEntry(Colors.GREY, "9) " .. L["Frostwolf Stable Master"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Frostwolf Wolf Rider Commander"]),
            CreateEntry(Colors.GREY, "10) " .. L["Frostwolf Quartermaster"]),
            CreateEntry(Colors.ORANGE, "11) " .. L["West Frostwolf Tower"]),
            CreateEntry(Colors.ORANGE, "12) " .. L["East Frostwolf Tower"]),
            CreateEntry(Colors.GREY, "13) " .. L["Wing Commander Guse"] .. " (" .. L["Rescued"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Jeztor"] .. " (" .. L["Rescued"] .. ")"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Mulverick"] .. " (" .. L["Rescued"] .. ")"),
            CreateEntry(Colors.RED, "14) " .. L["Frostwolf Relief Hut"]),
            CreateEntry(Colors.GREY, "15) " .. L["Wildpaw Cavern"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Frostwolf Banner"]),
            CreateEntry(Colors.GREY, "16) " .. L["Steamsaw"] .. " (" .. BF["Alliance"] .. ")"),
            CreateEmptyEntry(),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Friendly Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Honored Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Revered Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Exalted Reputation Rewards"]),
            CreateEmptyEntry(),
            CreateEntry(Colors.RED, L["Red"] .. ": " .. Colors.RED .. L["Graveyards, Capturable Areas"]),
            CreateEntry(Colors.ORANGE, L["Orange"] .. ": " .. Colors.ORANGE .. L["Bunkers, Towers, Destroyable Areas"]),
            CreateEntry(Colors.GREY, L["White"] .. ": " .. Colors.GREY .. L["Assault NPCs, Quest Areas"])
        }
    }),

    BGArathiBasin = CreateDungeonTemplate({
        zoneName = BZ["Arathi Basin"],
        acronym = "AB",
        location = BZ["Arathi Highlands"],
        levelRange = "20-60",
        minLevel = "20",
        playerLimit = "15",
        continent = BZ["Eastern Kingdoms"],
        reputation = {
            name = "The Defilers (Horde) / The League of Arathor (Alliance)",
            id = 510
        },
        entrances = {
            { letter = "A", info = L["Trollbane Hall"] .. " (" .. BF["Alliance"] .. ")" },
            { letter = "B", info = L["Defiler's Den"] .. " (" .. BF["Horde"] .. ")" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Stables"]),
            CreateEntry(Colors.GREY, "2) " .. L["Gold Mine"]),
            CreateEntry(Colors.GREY, "3) " .. L["Blacksmith"]),
            CreateEntry(Colors.GREY, "4) " .. L["Lumber Mill"]),
            CreateEntry(Colors.GREY, "5) " .. L["Farm"]),
            CreateEmptyEntry(),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Friendly Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Honored Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Revered Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Exalted Reputation Rewards"])
        }
    }),

    BGWarsongGulch = CreateDungeonTemplate({
        zoneName = BZ["Warsong Gulch"],
        acronym = "WSG",
        location = BZ["Ashenvale"] .. " / " .. BZ["The Barrens"],
        minLevel = "10",
        playerLimit = "10",
        continent = BZ["Kalimdor"],
        reputation = {
            name = "Warsong Outriders (Horde) / Silverwing Sentinels (Alliance)",
            id = 889
        },
        entrances = {
            { letter = "A", info = L["Silverwing Hold"] .. " (" .. BF["Alliance"] .. ")" },
            { letter = "B", info = L["Warsong Lumber Mill"] .. " (" .. BF["Horde"] .. ")" }
        },
        entries = {
            CreateEmptyEntry(),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Friendly Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Honored Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Revered Reputation Rewards"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Exalted Reputation Rewards"])
        }
    }),

    --************************************************
    -- Flight Path Maps
    --************************************************
    FPAllianceEast = {
        ZoneName = BF["Alliance"] .. " (" .. BZ["Eastern Kingdoms"] .. ")",
        Location = BZ["Eastern Kingdoms"],
        CreateEntry(Colors.GREY, "1) " .. L["Alah'Thalas"] .. ", " .. Colors.BLUE .. BZ["Thalassian Highlands"]),
        CreateEntry(Colors.GREY, "2) " .. L["Light's Hope Chapel"] .. ", " .. Colors.BLUE .. BZ["Eastern Plaguelands"]),
        CreateEntry(Colors.GREY, "3) " .. L["Chillwind Point"] .. ", " .. Colors.BLUE .. BZ["Western Plaguelands"]),
        CreateEntry(Colors.GREY, "4) " .. L["Aerie Peak"] .. ", " .. Colors.BLUE .. BZ["The Hinterlands"]),
        CreateEntry(Colors.GREY, "5) " .. L["Ravenshire"] .. ", " .. Colors.BLUE .. BZ["Gilneas"]),
        CreateEntry(Colors.GREY, "6) " .. L["Southshore"] .. ", " .. Colors.BLUE .. BZ["Hillsbrad Foothills"]),
        CreateEntry(Colors.GREY, "7) " .. L["Refuge Pointe"] .. ", " .. Colors.BLUE .. BZ["Arathi Highlands"]),
        CreateEntry(Colors.GREY, "8) " .. L["Menethil Harbor"] .. ", " .. Colors.BLUE .. BZ["Wetlands"]),
        CreateEntry(Colors.GREY, "9) " .. L["Dun Agrath"] .. ", " .. Colors.BLUE .. BZ["Wetlands"]),
        CreateEntry(Colors.GREY, "10) " .. BZ["Ironforge"] .. ", " .. Colors.BLUE .. BZ["Dun Morogh"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. L["Ironforge Airfields"] .. ", " .. Colors.BLUE .. BZ["Dun Morogh"]),
        CreateEntry(Colors.GREY, "11) " .. L["Thelsamar"] .. ", " .. Colors.BLUE .. BZ["Loch Modan"]),
        CreateEntry(Colors.GREY, "12) " .. L["Thorium Point"] .. ", " .. Colors.BLUE .. BZ["Searing Gorge"]),
        CreateEntry(Colors.GREY, "13) " .. L["Morgan's Vigil"] .. ", " .. Colors.BLUE .. BZ["Burning Steppes"]),
        CreateEntry(Colors.GREY, "14) " .. BZ["Stormwind City"] .. ", " .. Colors.BLUE .. BZ["Elwynn Forest"]),
        CreateEntry(Colors.GREY, "15) " .. L["Lakeshire"] .. ", " .. Colors.BLUE .. BZ["Redridge Mountains"]),
        CreateEntry(Colors.GREY, "16) " .. L["Sentinel Hill"] .. ", " .. Colors.BLUE .. BZ["Westfall"]),
        CreateEntry(Colors.GREY, "17) " .. L["Darkshire"] .. ", " .. Colors.BLUE .. BZ["Duskwood"]),
        CreateEntry(Colors.GREY, "18) " .. L["Nethergarde Keep"] .. ", " .. Colors.BLUE .. BZ["Blasted Lands"]),
        CreateEntry(Colors.GREY, "19) " .. BZ["Booty Bay"] .. ", " .. Colors.BLUE .. BZ["Stranglethorn Vale"]),
        CreateEntry(Colors.GREY, "20) " .. L["Caelan's Rest"] .. ", " .. Colors.BLUE .. BZ["Lapidis Isle"])
    },

    FPAllianceWest = {
        ZoneName = BF["Alliance"] .. " (" .. BZ["Kalimdor"] .. ")",
        Location = BZ["Kalimdor"],
        CreateEntry(Colors.GREY, "1) " .. L["Rut'Theran Village"] .. ", " .. Colors.BLUE .. BZ["Teldrassil"]),
        CreateEntry(Colors.GREY, "2) " .. Colors.GREEN .. L["Nighthaven"] .. Colors.GREY .. ", " .. Colors.BLUE .. BZ["Moonglade"] .. Colors.GREEN .. " (" .. L["Druid-only"] .. ")"),
        CreateEntry(Colors.GREY, Constants.INDENT .. L["South of the path along Lake Elune'ara"] .. ", " .. Colors.BLUE .. BZ["Moonglade"]),
        CreateEntry(Colors.GREY, "3) " .. L["Everlook"] .. ", " .. Colors.BLUE .. BZ["Winterspring"]),
        CreateEntry(Colors.GREY, "4) " .. L["Auberdine"] .. ", " .. Colors.BLUE .. BZ["Darkshore"]),
        CreateEntry(Colors.GREY, "5) " .. L["Talonbranch Glade"] .. ", " .. Colors.BLUE .. BZ["Felwood"]),
        CreateEntry(Colors.GREY, "6) " .. L["Nordanaar"] .. ", " .. Colors.BLUE .. BZ["Hyjal"]),
        CreateEntry(Colors.GREY, "7) " .. L["Stonetalon Peak"] .. ", " .. Colors.BLUE .. BZ["Stonetalon Mountains"]),
        CreateEntry(Colors.GREY, "8) " .. L["Astranaar"] .. ", " .. Colors.BLUE .. BZ["Ashenvale"]),
        CreateEntry(Colors.GREY, "9) " .. L["Talrendis Point"] .. ", " .. Colors.BLUE .. BZ["Azshara"]),
        CreateEntry(Colors.GREY, "10) " .. L["Nijel's Point"] .. ", " .. Colors.BLUE .. BZ["Desolace"]),
        CreateEntry(Colors.GREY, "11) " .. L["Bael Hardul"] .. ", " .. Colors.BLUE .. BZ["Stonetalon Mountains"]),
        CreateEntry(Colors.GREY, "12) " .. L["Ratchet"] .. ", " .. Colors.BLUE .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "13) " .. L["Theramore Isle"] .. ", " .. Colors.BLUE .. BZ["Dustwallow Marsh"]),
        CreateEntry(Colors.GREY, "14) " .. L["Feathermoon Stronghold"] .. ", " .. Colors.BLUE .. BZ["Feralas"]),
        CreateEntry(Colors.GREY, "15) " .. L["Thalanaar"] .. ", " .. Colors.BLUE .. BZ["Feralas"]),
        CreateEntry(Colors.GREY, "16) " .. L["Marshal's Refuge"] .. ", " .. Colors.BLUE .. BZ["Un'Goro Crater"]),
        CreateEntry(Colors.GREY, "17) " .. L["Cenarion Hold"] .. ", " .. Colors.BLUE .. BZ["Silithus"]),
        CreateEntry(Colors.GREY, "18) " .. L["Gadgetzan"] .. ", " .. Colors.BLUE .. BZ["Tanaris"]),
        CreateEntry(Colors.GREY, "19) " .. L["Tel Co. Basecamp"] .. ", " .. Colors.BLUE .. BZ["Tel'Abim"])
    },

    FPHordeEast = {
        ZoneName = BF["Horde"] .. " (" .. BZ["Eastern Kingdoms"] .. ")",
        Location = BZ["Eastern Kingdoms"],
        CreateEntry(Colors.GREY, "1) " .. L["Light's Hope Chapel"] .. ", " .. Colors.RED .. BZ["Eastern Plaguelands"]),
        CreateEntry(Colors.GREY, "2) " .. BZ["Undercity"] .. ", " .. Colors.RED .. BZ["Tirisfal Glades"]),
        CreateEntry(Colors.GREY, "3) " .. L["The Sepulcher"] .. ", " .. Colors.RED .. BZ["Silverpine Forest"]),
        CreateEntry(Colors.GREY, "4) " .. L["Tarren Mill"] .. ", " .. Colors.RED .. BZ["Hillsbrad Foothills"]),
        CreateEntry(Colors.GREY, "5) " .. L["Revantusk Village"] .. ", " .. Colors.RED .. BZ["The Hinterlands"]),
        CreateEntry(Colors.GREY, "6) " .. L["Hammerfall"] .. ", " .. Colors.RED .. BZ["Arathi Highlands"]),
        CreateEntry(Colors.GREY, "7) " .. L["Stillward Church"] .. ", " .. Colors.RED .. BZ["Gilneas"]),
        CreateEntry(Colors.GREY, "8) " .. L["Thorium Point"] .. ", " .. Colors.RED .. BZ["Searing Gorge"]),
        CreateEntry(Colors.GREY, "9) " .. L["Kargath"] .. ", " .. Colors.RED .. BZ["Badlands"]),
        CreateEntry(Colors.GREY, "10) " .. L["Flame Crest"] .. ", " .. Colors.RED .. BZ["Burning Steppes"]),
        CreateEntry(Colors.GREY, "11) " .. L["Stonard"] .. ", " .. Colors.RED .. BZ["Swamp of Sorrows"]),
        CreateEntry(Colors.GREY, "12) " .. L[BZ["Grom'gol Base Camp"]] .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"]),
        CreateEntry(Colors.GREY, "13) " .. L["Booty Bay"] .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"]),
        CreateEntry(Colors.GREY, "14) " .. L["Maul'ogg Refuge"] .. ", " .. Colors.RED .. BZ["Gillijim's Isle"])
    },

    FPHordeWest = {
        ZoneName = BF["Horde"] .. " (" .. BZ["Kalimdor"] .. ")",
        Location = BZ["Kalimdor"],
        CreateEntry(Colors.GREY, "1) " .. Colors.GREEN .. L["Nighthaven"] .. Colors.GREY .. ", " .. Colors.RED .. BZ["Moonglade"] .. Colors.GREEN .. " (" .. L["Druid-only"] .. ")"),
        CreateEntry(Colors.GREY, Constants.INDENT .. L["West of the path to Timbermaw Hold"] .. ", " .. Colors.RED .. BZ["Moonglade"]),
        CreateEntry(Colors.GREY, "2) " .. L["Everlook"] .. ", " .. Colors.RED .. BZ["Winterspring"]),
        CreateEntry(Colors.GREY, "3) " .. L["Nordanaar"] .. ", " .. Colors.RED .. BZ["Hyjal"]),
        CreateEntry(Colors.GREY, "4) " .. L["Bloodvenom Post"] .. ", " .. Colors.RED .. BZ["Felwood"]),
        CreateEntry(Colors.GREY, "5) " .. L["Zoram'gar Outpost"] .. ", " .. Colors.RED .. BZ["Ashenvale"]),
        CreateEntry(Colors.GREY, "6) " .. L["Valormok"] .. ", " .. Colors.RED .. BZ["Azshara"]),
        CreateEntry(Colors.GREY, "7) " .. L["Splintertree Post"] .. ", " .. Colors.RED .. BZ["Ashenvale"]),
        CreateEntry(Colors.GREY, "8) " .. BZ["Orgrimmar"] .. ", " .. Colors.RED .. BZ["Durotar"]),
        CreateEntry(Colors.GREY, "9) " .. L["Sun Rock Retreat"] .. ", " .. Colors.RED .. BZ["Stonetalon Mountains"]),
        CreateEntry(Colors.GREY, "10) " .. L["Crossroads"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "11) " .. L["Ratchet"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "12) " .. L["Shadowprey Village"] .. ", " .. Colors.RED .. BZ["Desolace"]),
        CreateEntry(Colors.GREY, "13) " .. BZ["Thunder Bluff"] .. ", " .. Colors.RED .. BZ["Mulgore"]),
        CreateEntry(Colors.GREY, "14) " .. L["Camp Taurajo"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "15) " .. L["Brackenwall Village"] .. ", " .. Colors.RED .. BZ["Dustwallow Marsh"]),
        CreateEntry(Colors.GREY, "16) " .. L["Mudsprocket"] .. ", " .. Colors.RED .. BZ["Dustwallow Marsh"]),
        CreateEntry(Colors.GREY, "17) " .. L["Camp Mojache"] .. ", " .. Colors.RED .. BZ["Feralas"]),
        CreateEntry(Colors.GREY, "18) " .. L["Freewind Post"] .. ", " .. Colors.RED .. BZ["Thousand Needles"]),
        CreateEntry(Colors.GREY, "19) " .. L["Marshal's Refuge"] .. ", " .. Colors.RED .. BZ["Un'Goro Crater"]),
        CreateEntry(Colors.GREY, "20) " .. L["Cenarion Hold"] .. ", " .. Colors.RED .. BZ["Silithus"]),
        CreateEntry(Colors.GREY, "21) " .. L["Gadgetzan"] .. ", " .. Colors.RED .. BZ["Tanaris"]),
        CreateEntry(Colors.GREY, "22) " .. L["Tel Co. Basecamp"] .. ", " .. Colors.RED .. BZ["Tel'Abim"])
    },

    TransportRoutes = {
        ZoneName = L["Transport Routes"],
        Location = L["Azeroth"],
        CreateEntry(Colors.GREY, "1) " .. L["Rut'Theran Village"] .. ", " .. Colors.BLUE .. BZ["Teldrassil"]),
        CreateEntry(Colors.GREY, "2) " .. BZ["Auberdine"] .. ", " .. Colors.BLUE .. BZ["Darkshore"]),
        CreateEntry(Colors.GREY, "7) " .. L["Feathermoon Stronghold"] .. ", " .. Colors.BLUE .. BZ["Feralas"]),
        CreateEntry(Colors.GREY, "8) " .. BZ["Theramore Isle"] .. ", " .. Colors.BLUE .. BZ["Dustwallow Marsh"]),
        CreateEntry(Colors.GREY, "9) " .. L["Alah'Thalas"] .. ", " .. Colors.BLUE .. BZ["Thalassian Highlands"]),
        CreateEntry(Colors.GREY, "12) " .. BZ["Menethil Harbor"] .. ", " .. Colors.BLUE .. BZ["Wetlands"]),
        CreateEntry(Colors.GREY, "13) " .. BZ["Ironforge"] .. ", " .. Colors.BLUE .. BZ["Dun Morogh"]),
        CreateEntry(Colors.GREY, "15) " .. BZ["Stormwind City"] .. ", " .. Colors.BLUE .. BZ["Elwynn Forest"]),
        CreateEmptyEntry(),
        CreateEntry(Colors.GREY, "3) " .. BZ["Orgrimmar"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "4) " .. L["Sparkwater Port"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "6) " .. BZ["Thunder Bluff"] .. ", " .. Colors.RED .. BZ["Mulgore"]),
        CreateEntry(Colors.GREY, "10) " .. BZ["Undercity"] .. ", " .. Colors.RED .. BZ["Tirisfal Glades"]),
        CreateEntry(Colors.GREY, "11) " .. L["Revantusk Village"] .. ", " .. Colors.RED .. BZ["The Hinterlands"]),
        CreateEntry(Colors.GREY, "14) " .. L["Kargath"] .. ", " .. Colors.RED .. BZ["Badlands"]),
        CreateEntry(Colors.GREY, "16) " .. BZ["Grom'gol Base Camp"] .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"]),
        CreateEmptyEntry(),
        CreateEntry(Colors.GREY, "5) " .. BZ["Ratchet"] .. ", " .. Colors.ORANGE .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "17) " .. BZ["Booty Bay"] .. ", " .. Colors.ORANGE .. BZ["Stranglethorn Vale"])
    },

    --************************************************
    -- Dungeon Location Maps
    --************************************************

    DLEast = {
        ZoneName = L["Dungeon Locations"] .. " (" .. BZ["Eastern Kingdoms"] .. ")",
        Location = BZ["Eastern Kingdoms"],
        Continent = BZ["Eastern Kingdoms"],
        CreateEntry("A) " .. BZ["Alterac Valley"] .. ", " .. BZ["Alterac Mountains"] .. " / " .. BZ["Hillsbrad Foothills"]),
        CreateEntry("B) " .. BZ["Arathi Basin"] .. ", " .. BZ["Arathi Highlands"]),
        CreateEntry("C) " .. BZ["Blood Ring"] .. " Arena" .. ", " .. BZ["Stranglethorn Vale"]),
        CreateEntry(Colors.GREY, "1) " .. BZ["Scarlet Monastery"] .. ", " .. Colors.RED .. BZ["Tirisfal Glades"]),
        CreateEntry(Colors.GREY, "2) " .. BZ["Stratholme"] .. ", " .. Colors.RED .. BZ["Eastern Plaguelands"]),
        CreateEntry(Colors.GREY, "3) " .. BZ["Naxxramas"] .. ", " .. Colors.RED .. BZ["Eastern Plaguelands"]),
        CreateEntry(Colors.GREY, "4) " .. BZ["Scholomance"] .. ", " .. Colors.RED .. BZ["Western Plaguelands"]),
        CreateEntry(Colors.GREY, "5) " .. BZ["Shadowfang Keep"] .. ", " .. Colors.RED .. BZ["Silverpine Forest"]),
        CreateEntry(Colors.GREY, "6) " .. BZ["Gilneas City"] .. ", " .. Colors.RED .. BZ["Gilneas"]),
        CreateEntry(Colors.GREY, "7) " .. BZ["Gnomeregan"] .. ", " .. Colors.RED .. BZ["Dun Morogh"]),
        CreateEntry(Colors.GREY, "8) " .. BZ["Uldaman"] .. ", " .. Colors.RED .. BZ["Badlands"]),
        CreateEntry(Colors.GREY, "9) " .. BZ["Blackwing Lair"] .. ", " .. Colors.RED .. BZ["Blackrock Spire"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Blackrock Depths"] .. ", " .. Colors.RED .. BZ["Blackrock Mountain"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Blackrock Spire"] .. ", " .. Colors.RED .. BZ["Blackrock Mountain"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Molten Core"] .. ", " .. Colors.RED .. BZ["Blackrock Depths"]),
        CreateEntry(Colors.GREY, "10) " .. BZ["Hateforge Quarry"] .. ", " .. Colors.RED .. BZ["Burning Steppes"]),
        CreateEntry(Colors.GREY, "11) " .. BZ["The Stockade"] .. ", " .. Colors.RED .. BZ["Stormwind City"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Stormwind Vault"] .. ", " .. Colors.RED .. BZ["Stormwind City"]),
        CreateEntry(Colors.GREY, "12) " .. BZ["The Deadmines"] .. ", " .. Colors.RED .. BZ["Westfall"]),
        CreateEntry(Colors.GREY, "13) " .. BZ["Karazhan Crypt"] .. ", " .. Colors.RED .. BZ["Deadwind Pass"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Lower Karazhan Halls"] .. ", " .. Colors.RED .. BZ["Deadwind Pass"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Tower of Karazhan"] .. ", " .. Colors.RED .. BZ["Deadwind Pass"]),
        CreateEntry(Colors.GREY, "14) " .. L["Sunken Temple"] .. ", " .. Colors.RED .. BZ["Swamp of Sorrows"]),
        CreateEntry(Colors.GREY, "15) " .. BZ["Zul'Gurub"] .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"]),
        CreateEntry(L["Blue"] .. ": " .. L["Battlegrounds"]),
        CreateEntry(L["White"] .. ": " .. L["Instances"])
    },

    DLWest = {
        ZoneName = L["Dungeon Locations"] .. " (" .. BZ["Kalimdor"] .. ")",
        Location = BZ["Kalimdor"],
        Continent = BZ["Kalimdor"],
        CreateEntry("A) " .. BZ["Warsong Gulch"] .. ", " .. BZ["The Barrens"] .. " / " .. BZ["Ashenvale"]),
        CreateEntry("B) " .. "Sunnyglade Valley" .. ", " .. L["Caverns of Time"]),
        CreateEntry(Colors.GREY, "1) " .. BZ["Emerald Sanctum"] .. ", " .. Colors.RED .. BZ["Hyjal"]),
        CreateEntry(Colors.GREY, "2) " .. BZ["Blackfathom Deeps"] .. ", " .. Colors.RED .. BZ["Ashenvale"]),
        CreateEntry(Colors.GREY, "3) " .. BZ["The Crescent Grove"] .. ", " .. Colors.RED .. BZ["Ashenvale"]),
        CreateEntry(Colors.GREY, "4) " .. BZ["Ragefire Chasm"] .. ", " .. Colors.RED .. BZ["Orgrimmar"]),
        CreateEntry(Colors.GREY, "5) " .. BZ["Wailing Caverns"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "6) " .. BZ["Maraudon"] .. ", " .. Colors.RED .. BZ["Desolace"]),
        CreateEntry(Colors.GREY, "7) " .. BZ["Dire Maul"] .. ", " .. Colors.RED .. BZ["Feralas"]),
        CreateEntry(Colors.GREY, "8) " .. BZ["Razorfen Kraul"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "9) " .. BZ["Razorfen Downs"] .. ", " .. Colors.RED .. BZ["The Barrens"]),
        CreateEntry(Colors.GREY, "10) " .. BZ["Onyxia's Lair"] .. ", " .. Colors.RED .. BZ["Dustwallow Marsh"]),
        CreateEntry(Colors.GREY, "11) " .. BZ["Zul'Farrak"] .. ", " .. Colors.RED .. BZ["Tanaris"]),
        CreateEntry(Colors.GREY, "12) " .. BZ["Black Morass"] .. ", " .. Colors.RED .. L["Caverns of Time"]),
        CreateEntry(Colors.GREY, "13) " .. BZ["Ruins of Ahn'Qiraj"] .. ", " .. Colors.RED .. BZ["Silithus"]),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Temple of Ahn'Qiraj"] .. ", " .. Colors.RED .. BZ["Silithus"]),
        CreateEmptyEntry(),
        CreateEmptyEntry(),
        CreateEmptyEntry(),
        CreateEmptyEntry(),
        CreateEmptyEntry(),
        CreateEmptyEntry(),
        CreateEntry(Colors.BLUE, L["Blue"] .. ": " .. Colors.ORANGE .. L["Battlegrounds"]),
        CreateEntry(Colors.GREY, L["White"] .. ": " .. Colors.ORANGE .. L["Instances"])
    }
}