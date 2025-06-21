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

-- Entity type constants
local EntityTypes = {
    ZONE = 1,
    NPC = 2,
    ITEM = 3,
    OBJECT = 4,
    FACTION = 5
}

-- Other constants
local Constants = {
    INDENT = " "
}

-- Helper functions for creating entries
local function CreateEntry(color, text, entityType, id)
    if entityType and id then
        return { color .. text, entityType, id }
    else
        return { color .. text }
    end
end

local function CreateNPCEntry(number, name, id, isRare, additionalInfo)
    local text = number .. ") " .. BB[name]
    if isRare then
        text = text .. " (" .. L["Rare"] .. ")"
    end
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.GREY, text, EntityTypes.NPC, id)
end

local function CreateIndentedNPCEntry(name, id, additionalInfo)
    local text = Constants.INDENT .. BB[name]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.GREY, text, EntityTypes.NPC, id)
end

local function CreateEntranceEntry(letter, additionalInfo)
    local text = letter .. ") " .. L["Entrance"]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.BLUE, text)
end

local function CreateKeyEntry(keyName, itemId, additionalInfo)
    local text = L["Key"] .. ": " .. L[keyName]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(Colors.ORANGE, text, EntityTypes.ITEM, itemId)
end

local function CreateItemEntry(number, itemName, id)
    local text = number .. ") " .. L[itemName]
    return CreateEntry(Colors.GREY, text, EntityTypes.ITEM, id)
end

local function CreateObjectEntry(number, objectName, id)
    local text
    if number ~= Constants.INDENT then
        text = number.. ") ".. L[objectName]
    else
        text = L[objectName]
    end
    return CreateEntry(Colors.GREY, text, EntityTypes.OBJECT, id)
end

local function CreateIndentedObjectEntry(objectName, id)
    local text = Constants.INDENT .. L[objectName]
    return CreateEntry(Colors.GREY, text, EntityTypes.OBJECT, id)
end

local function CreateSpecialEntry(number, name, id, color, additionalInfo)
    local text = number .. "') " .. L[name]
    if additionalInfo then
        text = text .. " (" .. additionalInfo .. ")"
    end
    return CreateEntry(color or Colors.GREEN, text, id and EntityTypes.OBJECT or nil, id)
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

local function CreateReputationEntry(factionName, factionId)
    return CreateEntry(Colors.ORANGE, L["Reputation"] .. ": " .. BF[factionName], EntityTypes.FACTION, factionId)
end

local function CreateDamageEntry(damageType)
    return CreateEntry(Colors.ORANGE, L["Damage: "] .. L[damageType])
end

-- Template function for creating dungeon data
local function CreateDungeonTemplate(config)
    local dungeon = {
        ZoneName = { config.zoneName, config.zoneId },
        Acronym = config.acronym,
        Location = { config.location, config.locationId },
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
        zoneId = 2437,
        acronym = "RFC",
        location = BZ["Orgrimmar"],
        locationId = 1637,
        levelRange = "13-18",
        minLevel = "8",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. L["Maur Grimtotem"], EntityTypes.NPC, 11834),
            CreateIndentedNPCEntry("Oggleflint", 11517),
            CreateNPCEntry("2", "Taragaman the Hungerer", 11520),
            CreateNPCEntry("3", "Jergosh the Invoker", 11518),
            CreateNPCEntry("4", "Bazzalan", 11519),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
        }
    }),

    WailingCaverns = CreateDungeonTemplate({
        zoneName = BZ["Wailing Caverns"],
        zoneId = 718,
        acronym = "WC",
        location = BZ["The Barrens"],
        locationId = 17,
        levelRange = "17-24",
        minLevel = "10",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Disciple of Naralex", 3678),
            CreateNPCEntry("2", "Lord Cobrahn", 3669),
            CreateNPCEntry("3", "Lady Anacondra", 3671),
            CreateNPCEntry("4", "Kresh", 3653),
            CreateNPCEntry("5", "Deviate Faerie Dragon", 5912, true),
            CreateNPCEntry("6", "Zandara Windhoof", 619681),
            CreateNPCEntry("7", "Lord Pythas", 3670),
            CreateNPCEntry("8", "Skum", 3674),
            CreateNPCEntry("9", "Vangros", 61965),
            CreateNPCEntry("10", "Lord Serpentis", 3673, false, L["Upper"]),
            CreateNPCEntry("11", "Verdan the Everliving", 5775, false, L["Upper"]),
            CreateNPCEntry("12", "Mutanus the Devourer", 3654),
            CreateIndentedNPCEntry("Naralex", 3679),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Embrace of the Viper")
        }
    }),

    BlackfathomDeeps = CreateDungeonTemplate({
        zoneName = BZ["Blackfathom Deeps"],
        zoneId = 719,
        acronym = "BFD",
        location = BZ["Ashenvale"],
        locationId = 331,
        levelRange = "24-32",
        minLevel = "19",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Ghamoo-ra", 4887),
            CreateItemEntry("2", "Lorgalis Manuscript", 5359),
            CreateNPCEntry("3", "Lady Sarevess", 4831),
            CreateEntry(Colors.GREY, "4) " .. L["Argent Guard Thaelrid"], EntityTypes.NPC, 4787),
            CreateNPCEntry("5", "Gelihast", 6243),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Shrine of Gelihast"]),
            CreateNPCEntry("6", "Lorgus Jett", 12902, false, L["Varies"]),
            CreateNPCEntry("7", "Baron Aquanis", 12876),
            CreateIndentedObjectEntry("Fathom Stone", 177964),
            CreateNPCEntry("8", "Twilight Lord Kelris", 4832),
            CreateNPCEntry("9", "Old Serra'kis", 4830),
            CreateNPCEntry("10", "Aku'mai", 4829),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Morridune"], EntityTypes.NPC, 6729),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Altar of the Deeps"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    RazorfenKraul = CreateDungeonTemplate({
        zoneName = BZ["Razorfen Kraul"],
        zoneId = 491,
        acronym = "RFK",
        location = BZ["The Barrens"],
        locationId = 17,
        levelRange = "29-38",
        minLevel = "19",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Roogug", 6168),
            CreateNPCEntry("2", "Aggem Thorncurse", 4424),
            CreateNPCEntry("3", "Death Speaker Jargba", 4428),
            CreateNPCEntry("4", "Overlord Ramtusk", 4420),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Razorfen Spearhide"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 4438),
            CreateNPCEntry("5", "Agathelos the Raging", 4422),
            CreateNPCEntry("6", "Blind Hunter", 4425, true),
            CreateNPCEntry("7", "Charlga Razorflank", 4421),
            CreateEntry(Colors.GREY, "8) " .. L["Willix the Importer"], EntityTypes.NPC, 4508),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Heralath Fallowbrook"], EntityTypes.NPC, 4510),
            CreateNPCEntry("9", "Earthcaller Halmgar", 4842, true),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    RazorfenDowns = CreateDungeonTemplate({
        zoneName = BZ["Razorfen Downs"],
        zoneId = 722,
        acronym = "RFD",
        location = BZ["The Barrens"],
        locationId = 17,
        levelRange = "37-46",
        minLevel = "25",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Tuten'kash", 7355),
            CreateEntry(Colors.GREY, "2) " .. L["Henry Stern"], EntityTypes.NPC, 8696),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Belnistrasz"], EntityTypes.NPC, 8516),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sah'rhee"], EntityTypes.NPC, 8767),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Lady Falther'ess"] .. " (" .. L["Scourge Invasion"] .. ")", EntityTypes.NPC, 14686),
            CreateNPCEntry("3", "Mordresh Fire Eye", 7357),
            CreateNPCEntry("4", "Glutton", 8567),
            CreateNPCEntry("5", "Ragglesnout", 7354, true, L["Varies"]),
            CreateNPCEntry("6", "Amnennar the Coldbringer", 7358),
            CreateNPCEntry("7", "Plaguemaw the Rotting", 7356),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    ZulFarrak = CreateDungeonTemplate({
        zoneName = BZ["Zul'Farrak"],
        zoneId = 978,
        acronym = "ZF",
        location = BZ["Tanaris"],
        locationId = 440,
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
            CreateNPCEntry("1", "Antu'sul", 8127),
            CreateEntry(Colors.GREY, "2) " .. L["Theka the Martyr"], EntityTypes.NPC, 7272),
            CreateNPCEntry("3", "Witch Doctor Zum'rah", 7271),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zul'Farrak Dead Hero"], EntityTypes.NPC, 7276),
            CreateEntry(Colors.GREY, "4) " .. L["Nekrum Gutchewer"], EntityTypes.NPC, 7796),
            CreateIndentedNPCEntry("Shadowpriest Sezz'ziz", 7275),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dustwraith"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 10081),
            CreateEntry(Colors.GREY, "5) " .. L["Sergeant Bly"], EntityTypes.NPC, 7604),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Weegli Blastfuse"], EntityTypes.NPC, 7607),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Murta Grimgut"], EntityTypes.NPC, 7608),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Raven"], EntityTypes.NPC, 7605),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Oro Eyegouge"], EntityTypes.NPC, 7606),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sandfury Executioner"], EntityTypes.NPC, 7274),
            CreateEntry(Colors.GREY, "6) " .. L["Hydromancer Velratha"], EntityTypes.NPC, 7795),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Gahz'rilla"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 7273),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Wildmane"] .. " (" .. L["Lunar Festival"] .. ")", EntityTypes.NPC, 15578),
            CreateNPCEntry("7", "Chief Ukorz Sandscalp", 7267),
            CreateIndentedNPCEntry("Ruuzlu", 7797),
            CreateEntry(Colors.GREY, "8) " .. L["Zerillis"] .. " (" .. L["Rare"] .. ", " .. L["Wanders"] .. ")", EntityTypes.NPC, 10082),
            CreateEntry(Colors.GREY, "9) " .. L["Sandarr Dunereaver"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 10080),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    Maraudon = CreateDungeonTemplate({
        zoneName = BZ["Maraudon"],
        zoneId = 2100,
        acronym = "Mara",
        location = BZ["Desolace"],
        locationId = 405,
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
            CreateEntry(Colors.GREY, "1) " .. L["Veng"], EntityTypes.NPC, 13738),
            CreateNPCEntry("2", "Noxxion", 13282),
            CreateNPCEntry("3", "Razorlash", 12258),
            CreateEntry(Colors.GREY, "4) " .. L["Maraudos"], EntityTypes.NPC, 13739),
            CreateNPCEntry("5", "Lord Vyletongue", 12236),
            CreateNPCEntry("6", "Meshlok the Harvester", 12237, true),
            CreateNPCEntry("7", "Celebras the Cursed", 12225),
            CreateNPCEntry("8", "Landslide", 12203),
            CreateNPCEntry("9", "Tinkerer Gizlock", 13601),
            CreateNPCEntry("10", "Rotgrip", 13596),
            CreateNPCEntry("11", "Princess Theradras", 12201),
            CreateEntry(Colors.GREY, "12) " .. L["Elder Splitrock"] .. " (" .. L["Lunar Festival"] .. ")", EntityTypes.NPC, 15556),
            CreateEntry(Colors.GREY, "13) " .. L["Trash Mobs"], EntityTypes.NPC, 15556)
        }
    }),

    DireMaulEast = CreateDungeonTemplate({
        zoneName = BZ["Dire Maul"] .. " (" .. L["East"] .. ")",
        zoneId = 2557,
        acronym = "DME",
        location = BZ["Feralas"],
        locationId = 357,
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
            CreateNPCEntry("1", "Pusillin", 14354, false, L["Chase Begins"]),
            CreateNPCEntry("2", "Pusillin", 14354, false, L["Chase Ends"]),
            CreateNPCEntry("3", "Zevrim Thornhoof", 11490),
            CreateIndentedNPCEntry("Hydrospawn", 13280),
            CreateIndentedNPCEntry("Lethtendris", 14327),
            CreateIndentedNPCEntry("Pimgib", 14349),
            CreateEntry(Colors.GREY, "4) " .. L["Old Ironbark"], EntityTypes.NPC, 11491),
            CreateNPCEntry("5", "Alzzin the Wildshaper", 11492),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Isalien"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 16097),
            CreateIndentedObjectEntry("Felvine Shard", 179559),
            CreateSpecialEntry("1", "A Dusty Tome", 179547, Colors.GREEN, L["Varies"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dire Maul Books"]),
            CreateSetEntry("Ironweave Battlesuit")
        }
    }),

    DireMaulNorth = CreateDungeonTemplate({
        zoneName = BZ["Dire Maul"] .. " (" .. L["North"] .. ")",
        zoneId = 2557,
        acronym = "DMN",
        location = BZ["Feralas"],
        locationId = 357,
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
            CreateNPCEntry("1", "Guard Mol'dar", 14326),
            CreateEntry(Colors.GREY, "2) " .. L["Stomper Kreeg"], EntityTypes.NPC, 14322),
            CreateNPCEntry("3", "Guard Fengus", 14321),
            CreateEntry(Colors.GREY, "4) " .. L["Knot Thimblejack"], EntityTypes.NPC, 14338),
            CreateIndentedNPCEntry("Guard Slip'kik", 14323),
            CreateNPCEntry("5", "Captain Kromcrush", 14325),
            CreateNPCEntry("6", "King Gordok", 11501),
            CreateIndentedNPCEntry("Cho'Rush the Observer", 14324),
            CreateIndentedObjectEntry("Tribute Run", 190005),
            CreateSpecialEntry("1", "Library", nil, Colors.GREEN),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Falrin Treeshaper"], EntityTypes.NPC, 16032),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Lydros"], EntityTypes.NPC, 14368),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Javon"], EntityTypes.NPC, 14381),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Kildrath"], EntityTypes.NPC, 14383),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Mykos"], EntityTypes.NPC, 14382),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Shen'dralar Provisioner"], EntityTypes.NPC, 14371),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Skeletal Remains of Kariel Winthalus"], EntityTypes.OBJECT, 179544),
            CreateEntry(Colors.GREEN, "2') " .. L["A Dusty Tome"] .. " (" .. L["Varies"] .. ")", EntityTypes.OBJECT, 179547),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dire Maul Books"])
        }
    }),

    DireMaulWest = CreateDungeonTemplate({
        zoneName = BZ["Dire Maul"] .. " (" .. L["West"] .. ")",
        zoneId = 2557,
        acronym = "DMW",
        location = BZ["Feralas"],
        locationId = 357,
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
            CreateEntry(Colors.GREY, "1) " .. L["Shen'dralar Ancient"], EntityTypes.NPC, 14358),
            CreateNPCEntry("2", "Tendris Warpwood", 11489),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ancient Equine Spirit"], EntityTypes.NPC, 14566),
            CreateNPCEntry("3", "Illyanna Ravenoak", 11488),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ferra"], EntityTypes.NPC, 14308),
            CreateNPCEntry("4", "Magister Kalendris", 11487),
            CreateNPCEntry("5", "Tsu'zee", 11467, true),
            CreateNPCEntry("6", "Immol'thar", 11496),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Lord Hel'nurath"] .. " (" .. L["Rare"] .. ", " .. L["Summon"] .. ")", EntityTypes.NPC, 14506),
            CreateNPCEntry("7", "Prince Tortheldrin", 11486),
            CreateIndentedObjectEntry("The Prince's Chest", 179545),
            CreateNPCEntry("8", "Revanchion", 11467, false, L["Scourge Invasion"]),
            CreateSpecialEntry("1", "Library", nil, Colors.GREEN),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Falrin Treeshaper"], EntityTypes.NPC, 16032),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Lydros"], EntityTypes.NPC, 14368),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Javon"], EntityTypes.NPC, 14381),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Kildrath"], EntityTypes.NPC, 14383),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Lorekeeper Mykos"], EntityTypes.NPC, 14382),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Shen'dralar Provisioner"], EntityTypes.NPC, 14371),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Skeletal Remains of Kariel Winthalus"], EntityTypes.OBJECT, 179544),
            CreateEntry(Colors.GREEN, "2') " .. L["A Dusty Tome"] .. " (" .. L["Varies"] .. ")", EntityTypes.OBJECT, 179547),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dire Maul Books"])
        }
    }),

    OnyxiasLair = CreateDungeonTemplate({
        zoneName = BZ["Onyxia's Lair"],
        zoneId = 2159,
        acronym = "Ony",
        location = BZ["Dustwallow Marsh"],
        locationId = 15,
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
            CreateEntry(Colors.GREY, "1) " .. L["Onyxian Warders"], EntityTypes.NPC, 12129),
            CreateEntry(Colors.GREY, "2) " .. L["Whelp Eggs"]),
            CreateNPCEntry("3", "Onyxia", 10184),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        },
        damageType = "Fire"
    }),

    TheTempleofAhnQiraj = CreateDungeonTemplate({
        zoneName = BZ["Temple of Ahn'Qiraj"],
        zoneId = 3428,
        acronym = "AQ40",
        location = BZ["Silithus"],
        locationId = 1377,
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
            CreateNPCEntry("1", "The Prophet Skeram", 15263, false, L["Outside"]),
            CreateEntry(Colors.GREY, "2) " .. L["Bug Trio"] .. " (" .. L["Optional"] .. ")"),
            CreateIndentedNPCEntry("Vem", 15544),
            CreateIndentedNPCEntry("Lord Kri", 15511),
            CreateIndentedNPCEntry("Princess Yauj", 15543),
            CreateNPCEntry("3", "Battleguard Sartura", 15516),
            CreateNPCEntry("4", "Fankriss the Unyielding", 15510),
            CreateNPCEntry("5", "Viscidus", 15299, false, L["Optional"]),
            CreateNPCEntry("6", "Princess Huhuran", 15509),
            CreateEntry(Colors.GREY, "7) " .. BB["The Twin Emperors"]),
            CreateIndentedNPCEntry("Emperor Vek'lor", 15276),
            CreateIndentedNPCEntry("Emperor Vek'nilash", 15275),
            CreateNPCEntry("8", "Ouro", 15517, false, L["Optional"]),
            CreateNPCEntry("9", "C'Thun", 15589),
            CreateSpecialEntry("1", "Andorgos", 15502),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Vethsera"], EntityTypes.NPC, 15504),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Kandrostrasz"], EntityTypes.NPC, 15503),
            CreateSpecialEntry("2", "Arygos", 15380),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Caelestrasz"], EntityTypes.NPC, 15379),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Merithra of the Dream"], EntityTypes.NPC, 15378),
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
        zoneId = 3429,
        acronym = "AQ20",
        location = BZ["Silithus"],
        locationId = 1377,
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
            CreateNPCEntry("1", "Kurinnaxx", 15348),
            CreateIndentedNPCEntry("Lieutenant General Andorov", 15471),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Four Kaldorei Elites"], EntityTypes.NPC, 15473),
            CreateNPCEntry("2", "General Rajaxx", 15341),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Qeez"], EntityTypes.NPC, 15391),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Tuubid"], EntityTypes.NPC, 15392),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Drenn"], EntityTypes.NPC, 15389),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Xurrem"], EntityTypes.NPC, 15390),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Major Yeggeth"], EntityTypes.NPC, 15386),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Major Pakkon"], EntityTypes.NPC, 15388),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Colonel Zerran"], EntityTypes.NPC, 15385),
            CreateNPCEntry("3", "Moam", 15340, false, L["Optional"]),
            CreateNPCEntry("4", "Buru the Gorger", 15370, false, L["Optional"]),
            CreateNPCEntry("5", "Ayamiss the Hunter", 15369, false, L["Optional"]),
            CreateNPCEntry("6", "Ossirian the Unscarred", 15339),
            CreateSpecialEntry("1", "Safe Room", nil, Colors.GREEN),
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
        zoneId = 1584,
        acronym = "BRD",
        location = BZ["Blackrock Mountain"],
        locationId = 25,
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
            CreateNPCEntry("1", "Lord Roccor", 9025),
            CreateEntry(Colors.GREY, "2) " .. L["Kharan Mighthammer"], EntityTypes.NPC, 9021),
            CreateEntry(Colors.GREY, "3) " .. L["Commander Gor'shak"], EntityTypes.NPC, 9020),
            CreateEntry(Colors.GREY, "4) " .. L["Marshal Windsor"], EntityTypes.NPC, 9023),
            CreateNPCEntry("5", "High Interrogator Gerstahn", 9018),
            CreateEntry(Colors.GREY, "6) " .. L["Ring of Law"]),
            CreateIndentedNPCEntry("Anub'shiah", 9031, L["Random"]),
            CreateIndentedNPCEntry("Eviscerator", 9029, L["Random"]),
            CreateIndentedNPCEntry("Gorosh the Dervish", 9027, L["Random"]),
            CreateIndentedNPCEntry("Grizzle", 9028, L["Random"]),
            CreateIndentedNPCEntry("Hedrum the Creeper", 9032, L["Random"]),
            CreateIndentedNPCEntry("Ok'thor the Breaker", 9030, L["Random"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Theldren"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 16059),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lefty"] .. " (|cfffff468" .. BC["Rogue"] .. Colors.GREY .. ")", EntityTypes.NPC, 16049),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Malgen Longspear"] .. " (|cffaad372" .. BC["Hunter"] .. Colors.GREY .. ")", EntityTypes.NPC, 16052),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Gnashjaw"] .. " (|cffaad372" .. L["Pet"] .. Colors.GREY .. ")", EntityTypes.NPC, 16095),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Korv"] .. " (|cff2773ff" .. BC["Shaman"] .. Colors.GREY .. ")", EntityTypes.NPC, 16050),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Rezznik"] .. " (|cffc69b6d" .. L["Engineer"] .. Colors.GREY .. ")", EntityTypes.NPC, 16050),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Rotfang"] .. " (|cfffff468" .. BC["Rogue"] .. Colors.GREY .. ")", EntityTypes.NPC, 16050),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Snokh Blackspine"] .. " (|cff68ccef" .. BC["Mage"] .. Colors.GREY .. ")", EntityTypes.NPC, 16050),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Va'jashni"] .. " (|cffffffff" .. BC["Priest"] .. Colors.GREY .. ")", EntityTypes.NPC, 16055),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Volida"] .. " (|cff68ccef" .. BC["Mage"] .. Colors.GREY .. ")", EntityTypes.NPC, 16055),
            CreateIndentedNPCEntry("Houndmaster Grebmar", 9319, L["Lower"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Morndeep"] .. " (" .. L["Lunar Festival"] .. ")", EntityTypes.NPC, 15549),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["High Justice Grimstone"], EntityTypes.NPC, 10096),
            CreateEntry(Colors.GREY, "7) " .. L["Monument of Franclorn Forgewright"], EntityTypes.OBJECT, 164689),
            CreateNPCEntry("8", "Pyromancer Loregrain", 9024, true),
            CreateEntry(Colors.GREY, "9) " .. L["The Vault"]),
            CreateNPCEntry("10", "Warder Stilgiss", 9041, true),
            CreateNPCEntry("11", "Verek", 9042, true),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Watchman Doomgrip"], EntityTypes.NPC, 9476),
            CreateNPCEntry("12", "Fineous Darkvire", 9056),
            CreateNPCEntry("13", "Lord Incendius", 9017),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Black Anvil"]),
            CreateNPCEntry("14", "Bael'Gar", 9016),
            CreateEntry(Colors.GREY, "15) " .. L["Shadowforge Lock"]),
            CreateNPCEntry("16", "General Angerforge", 9033),
            CreateNPCEntry("17", "Golem Lord Argelmach", 8983),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Field Repair Bot 74A"], EntityTypes.NPC, 14337),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"], EntityTypes.OBJECT, 173232),
            CreateEntry(Colors.GREY, "18) " .. L["The Grim Guzzler"]),
            CreateIndentedNPCEntry("Hurley Blackbreath", 9537),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lokhtos Darkbargainer"], EntityTypes.NPC, 12944),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mistress Nagmara"], EntityTypes.NPC, 9500),
            CreateIndentedNPCEntry("Phalanx", 9502),
            CreateIndentedNPCEntry("Plugger Spazzring", 9499),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Private Rocknot"], EntityTypes.NPC, 9503),
            CreateIndentedNPCEntry("Ribbly Screwspigot", 9543),
            CreateNPCEntry("19", "Ambassador Flamelash", 9156),
            CreateNPCEntry("20", "Panzor the Invincible", 8923, true),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"], EntityTypes.OBJECT, 173232),
            CreateEntry(Colors.GREY, "21) " .. L["Summoner's Tomb"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Chest of The Seven"], EntityTypes.OBJECT, 169243),
            CreateEntry(Colors.GREY, "22) " .. L["The Lyceum"]),
            CreateNPCEntry("23", "Magmus", 9938),
            CreateNPCEntry("24", "Emperor Dagran Thaurissan", 9019),
            CreateIndentedNPCEntry("Princess Moira Bronzebeard", 8929),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["High Priestess of Thaurissan"], EntityTypes.NPC, 10076),
            CreateEntry(Colors.GREY, "25) " .. L["The Black Forge"]),
            CreateEntry(Colors.GREY, "26) " .. BZ["Molten Core"], EntityTypes.ZONE, 2717),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Core Fragment"], EntityTypes.OBJECT, 179553),
            CreateNPCEntry("27","Overmaster Pyron", 9026),
            CreateEntry(Colors.GREY, "28) " .. L["Blacksmithing Plans"], EntityTypes.OBJECT, 173232),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("The Gladiator"),
            CreateSetEntry("Ironweave Battlesuit")
        }
    }),

    BlackrockSpireLower = CreateDungeonTemplate({
        zoneName = BZ["Lower Blackrock Spire"],
        zoneId = 1583,
        acronym = "LBRS",
        location = BZ["Blackrock Mountain"],
        locationId = 25,
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
            CreateEntry(Colors.GREY, "1) " .. L["Vaelan"] .. " (" .. L["Upper"] .. ")", EntityTypes.NPC, 10296),
            CreateEntry(Colors.GREY, "2) " .. L["Warosh"] .. " (" .. L["Wanders"] .. ")", EntityTypes.NPC, 10799),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Stonefort"] .. " (" .. L["Lunar Festival"] .. ")", EntityTypes.NPC, 15560),
            CreateEntry(Colors.GREY, "3) " .. L["Roughshod Pike"], EntityTypes.OBJECT, 175886),
            CreateEntry(Colors.GREY, "4) " .. L["Spirestone Butcher"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 9219),
            CreateNPCEntry("5", "Highlord Omokk", 9196),
            CreateEntry(Colors.GREY, "6) " .. L["Spirestone Battle Lord"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 9218),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Spirestone Lord Magus"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 9217),
            CreateNPCEntry("7", "Shadow Hunter Vosh'gajin", 9236),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Fifth Mosh'aru Tablet"], EntityTypes.OBJECT, 175949),
            CreateEntry(Colors.GREY, "8) " .. L["Bijou"], EntityTypes.NPC, 10257),
            CreateNPCEntry("9", "War Master Voone", 9237),
            CreateIndentedNPCEntry("Mor Grayhoof", 16080, L["Summon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sixth Mosh'aru Tablet"], EntityTypes.OBJECT, 175950),
            CreateEntry(Colors.GREY, "10) " .. L["Bijou's Belongings"], EntityTypes.OBJECT, 175334),
            CreateEntry(Colors.GREY, "11) " .. L["Human Remains"] .. " (" .. L["Lower"] .. ")", EntityTypes.OBJECT, 176090),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Unfired Plate Gauntlets"] .. " (" .. L["Lower"] .. ")", EntityTypes.OBJECT, 176089),
            CreateNPCEntry("12", "Bannok Grimaxe", 9596, true),
            CreateNPCEntry("13", "Mother Smolderweb", 10596),
            CreateNPCEntry("14", "Crystal Fang", 10376, true),
            CreateEntry(Colors.GREY, "15) " .. L["Urok's Tribute Pile"], EntityTypes.OBJECT, 175621),
            CreateIndentedNPCEntry("Urok Doomhowl", 10584, L["Summon"]),
            CreateNPCEntry("16", "Quartermaster Zigris", 9736),
            CreateNPCEntry("17", "Halycon", 10220),
            CreateIndentedNPCEntry("Gizrul the Slavener", 10268),
            CreateNPCEntry("18", "Ghok Bashguud", 9718, true),
            CreateNPCEntry("19", "Overlord Wyrmthalak", 9568),
            CreateSpecialEntry("1", "Burning Felguard", 10263, Colors.GREEN, L["Rare"] .. ", " .. L["Summon"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Ironweave Battlesuit"),
            CreateSetEntry("Spider's Kiss"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Set: "] .. L["Tier 0/0.5 Sets"])
        }
    }),

    BlackrockSpireUpper = CreateDungeonTemplate({
        zoneName = BZ["Upper Blackrock Spire"],
        zoneId = 1583,
        acronym = "UBRS",
        location = BZ["Blackrock Mountain"],
        locationId = 25,
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
            CreateNPCEntry("1", "Pyroguard Emberseer", 9816),
            CreateNPCEntry("2", "Solakar Flamewreath", 10264),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Father Flame"], EntityTypes.OBJECT, 175245),
            CreateEntry(Colors.GREY, "3) " .. L["Darkstone Tablet"], EntityTypes.OBJECT, 175385),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Doomrigger's Coffer"], EntityTypes.OBJECT, 175382),
            CreateNPCEntry("4", "Jed Runewatcher", 10509, true),
            CreateNPCEntry("5", "Goraluk Anvilcrack", 10899, true),
            CreateNPCEntry("6", "Warchief Rend Blackhand", 10429),
            CreateIndentedNPCEntry("Gyth", 10339),
            CreateEntry(Colors.GREY, "7) " .. L["Awbee"], EntityTypes.NPC, 10740),
            CreateNPCEntry("8", "The Beast", 10430),
            CreateIndentedNPCEntry("Lord Valthalak", 16042, L["Summon"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Finkle Einhorn"], EntityTypes.NPC, 10776),
            CreateNPCEntry("9", "General Drakkisath", 10363),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Drakkisath's Brand"], EntityTypes.OBJECT, 179880),
            CreateEntry(Colors.GREY, "10) " .. BZ["Blackwing Lair"] .. " (BWL)", EntityTypes.ZONE, 2677),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Ironweave Battlesuit"),
            CreateSetEntry("Dal'Rend's Arms"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 0/0.5 Sets"])
        }
    }),

    BlackwingLair = CreateDungeonTemplate({
        zoneName = BZ["Blackwing Lair"],
        zoneId = 2677,
        acronym = "BWL",
        location = BZ["Blackrock Spire"],
        locationId = 1583,
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
            CreateNPCEntry("1", "Razorgore the Untamed", 12435),
            CreateNPCEntry("2", "Vaelastrasz the Corrupt", 13020),
            CreateNPCEntry("3", "Broodlord Lashlayer", 12017),
            CreateNPCEntry("4", "Firemaw", 11983),
            CreateEntry(Colors.GREY, "5) " .. L["Master Elemental Shaper Krixix"], EntityTypes.NPC, 14401),
            CreateNPCEntry("6", "Ebonroc", 14601),
            CreateNPCEntry("7", "Flamegor", 11981),
            CreateNPCEntry("8", "Chromaggus", 14020),
            CreateNPCEntry("9", "Nefarian", 11583),
            CreateSpecialEntry("1", "Alchemy Lab", nil, Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Draconic for Dummies"], EntityTypes.OBJECT, 180666),
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
        zoneId = 133,
        acronym = "Gnome",
        location = BZ["Dun Morogh"],
        locationId = 1,
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
            CreateEntry(Colors.GREY, "1) " .. L["Blastmaster Emi Shortfuse"], EntityTypes.NPC, 7998),
            CreateIndentedNPCEntry("Grubbis", 7361),
            CreateIndentedNPCEntry("Chomper", 6215),
            CreateEntry(Colors.GREY, "2) " .. L["Clean Room"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tink Sprocketwhistle"], EntityTypes.NPC, 9676),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Sparklematic 5200"], EntityTypes.OBJECT, 142487),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mail Box"]),
            CreateEntry(Colors.GREY, "3) " .. L["Kernobee"], EntityTypes.NPC, 7850),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Alarm-a-bomb 2600"], EntityTypes.NPC, 7897),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Matrix Punchograph 3005-B"], EntityTypes.OBJECT, 142475),
            CreateNPCEntry("4", "Viscous Fallout", 7079),
            CreateNPCEntry("5", "Electrocutioner 6000", 6235),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Matrix Punchograph 3005-C"], EntityTypes.OBJECT, 142476),
            CreateNPCEntry("6", "Crowd Pummeler 9-60", 6229, false, L["Upper"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Matrix Punchograph 3005-D"], EntityTypes.OBJECT, 142696),
            CreateNPCEntry("7", "Dark Iron Ambassador", 6228, true),
            CreateNPCEntry("8", "Mekgineer Thermaplugg", 7800),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    MoltenCore = CreateDungeonTemplate({
        zoneName = BZ["Molten Core"],
        zoneId = 2717,
        acronym = "MC",
        location = BZ["Blackrock Depths"],
        locationId = 1584,
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
            CreateNPCEntry("1", "Lucifron", 12118),
            CreateNPCEntry("2", "Magmadar", 11982),
            CreateNPCEntry("3", "Gehennas", 12259),
            CreateNPCEntry("4", "Garr", 12057),
            CreateNPCEntry("5", "Shazzrah", 12264),
            CreateNPCEntry("6", "Baron Geddon", 12056),
            CreateNPCEntry("7", "Golemagg the Incinerator", 11988),
            CreateNPCEntry("8", "Sulfuron Harbinger", 12098),
            CreateNPCEntry("9", "Majordomo Executus", 12018),
            CreateNPCEntry("10", "Ragnaros", 11502),
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
        zoneId = 3456,
        acronym = "Naxx",
        location = BZ["Eastern Plaguelands"],
        locationId = 139,
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
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Archmage Tarsis Kir-Moldir"], EntityTypes.NPC, 16381),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Mr. Bigglesworth"] .. " (" .. L["Wanders"] .. ")", EntityTypes.NPC, 16998),
            CreateEntry(Colors.GREY, L["Abomination Wing"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "1) " .. BB["Patchwerk"], EntityTypes.NPC, 16028),
            CreateEntry(Colors.GREY, Constants.INDENT .. "2) " .. BB["Grobbulus"], EntityTypes.NPC, 15931),
            CreateEntry(Colors.GREY, Constants.INDENT .. "3) " .. BB["Gluth"], EntityTypes.NPC, 15932),
            CreateEntry(Colors.GREY, Constants.INDENT .. "4) " .. BB["Thaddius"], EntityTypes.NPC, 15928),
            CreateEntry(Colors.ORANGE, L["Spider Wing"]),
            CreateEntry(Colors.ORANGE, Constants.INDENT .. "1) " .. BB["Anub'Rekhan"], EntityTypes.NPC, 15956),
            CreateEntry(Colors.ORANGE, Constants.INDENT .. "2) " .. BB["Grand Widow Faerlina"], EntityTypes.NPC, 15953),
            CreateEntry(Colors.ORANGE, Constants.INDENT .. "3) " .. BB["Maexxna"], EntityTypes.NPC, 15952),
            CreateEntry(Colors.PURPLE, L["Plague Wing"]),
            CreateEntry(Colors.PURPLE, Constants.INDENT .. "1) " .. BB["Noth the Plaguebringer"], EntityTypes.NPC, 15954),
            CreateEntry(Colors.PURPLE, Constants.INDENT .. "2) " .. BB["Heigan the Unclean"], EntityTypes.NPC, 15936),
            CreateEntry(Colors.PURPLE, Constants.INDENT .. "3) " .. BB["Loatheb"], EntityTypes.NPC, 16011),
            CreateEntry(Colors.RED, L["Deathknight Wing"]),
            CreateEntry(Colors.RED, Constants.INDENT .. "1) " .. BB["Instructor Razuvious"], EntityTypes.NPC, 16061),
            CreateEntry(Colors.RED, Constants.INDENT .. "2) " .. BB["Gothik the Harvester"], EntityTypes.NPC, 16060),
            CreateEntry(Colors.RED, Constants.INDENT .. "3) " .. BB["The Four Horsemen"]),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Thane Korth'azz"], EntityTypes.NPC, 16064),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Lady Blaumeux"], EntityTypes.NPC, 16065),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Highlord Mograine"], EntityTypes.NPC, 16062),
            CreateEntry(Colors.RED, Constants.INDENT .. Constants.INDENT .. BB["Sir Zeliek"], EntityTypes.NPC, 16063),
            CreateEntry(Colors.RED, Constants.INDENT .. "1') " .. BB["Master Craftsman Omarion"], EntityTypes.NPC, 16365),
            CreateEntry(Colors.RED, Constants.INDENT .. "2') " .. L["Icebellow Anvil"], EntityTypes.OBJECT, 181168),
            CreateEntry(Colors.GREEN, L["Frostwyrm Lair"]),
            CreateEntry(Colors.GREEN, Constants.INDENT .. "1) " .. BB["Sapphiron"], EntityTypes.NPC, 15989),
            CreateEntry(Colors.GREEN, Constants.INDENT .. "2) " .. BB["Kel'Thuzad"], EntityTypes.NPC, 15990),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 3 Sets"]),
            CreateEmptyEntry(),
        },
        damageType = "Nature, Fire, Arcane, Shadow, Frost"
    }),

    SMLibrary = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Library"],
        zoneId = 796,
        acronym = "SM Lib",
        location = BZ["Tirisfal Glades"],
        locationId = 85,
        levelRange = "29-39",
        minLevel = "21",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Houndmaster Loksey", 3974),
            CreateNPCEntry("2", "Arcanist Doan", 6487),
            CreateSpecialEntry("1", "Doan's Strongbox", 103821, Colors.GREEN),
            CreateEntry(Colors.GREY, "3) " .. BB["Brother Wystan"], EntityTypes.NPC, -1),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    SMArmory = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Armory"],
        zoneId = 796,
        acronym = "SM Arm",
        location = BZ["Tirisfal Glades"],
        locationId = 85,
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
            CreateNPCEntry("1", "Herod", 3975),
            CreateEntry(Colors.GREY, "2) " .. BB["Armory Quartermaster Daghelm"], EntityTypes.NPC, -1),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    SMCathedral = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Cathedral"],
        zoneId = 796,
        acronym = "SM Cath",
        location = BZ["Tirisfal Glades"],
        locationId = 85,
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
            CreateNPCEntry("1", "High Inquisitor Fairbanks", 4542),
            CreateNPCEntry("2", "Scarlet Commander Mograine", 3976),
            CreateNPCEntry("3", "High Inquisitor Whitemane", 3977),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    SMGraveyard = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. ": " .. L["Graveyard"],
        zoneId = 796,
        acronym = "SM GY",
        location = BZ["Tirisfal Glades"],
        locationId = 85,
        levelRange = "26-36",
        minLevel = "25",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Interrogator Vishas", 3983),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Vorrel Sengutz"], EntityTypes.NPC, 3981),
            CreateEntry(Colors.GREY, "2) " .. BB["Scorn"] .. " (" .. L["Scourge Invasion"] .. ")", EntityTypes.NPC, 14693),
            CreateNPCEntry("3", "Bloodmage Thalnos", 4543),
            CreateSpecialEntry("1", "Ironspine", 6489, Colors.GREEN),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Azshir the Sleepless"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 6490),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Fallen Champion"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 6488),
            CreateEntry(Colors.GREY, "4) " .. BB["Duke Dreadmoore"], EntityTypes.NPC, -1),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Chain of the Scarlet Crusade")
        }
    }),

    Scholomance = CreateDungeonTemplate({
        zoneName = BZ["Scholomance"],
        zoneId = 2057,
        acronym = "Scholo",
        location = BZ["Western Plaguelands"],
        locationId = 28,
        levelRange = "58-60",
        minLevel = "45",
        playerLimit = "5",
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
            CreateEntry(Colors.GREY, "1) " .. L["Blood Steward of Kirtonos"], EntityTypes.NPC, 14861),
            CreateObjectEntry(Constants.INDENT, "The Deed to Southshore", 176486),
            CreateNPCEntry("2", "Kirtonos the Herald", 10506, false, L["Summon"]),
            CreateNPCEntry("3", "Jandice Barov", 10503),
            CreateObjectEntry(Constants.INDENT, "Journal of Jandice Barov", 180794),
            CreateObjectEntry("4", "The Deed to Tarren Mill", 176487),            
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Lord Blackwood"] .. " (" .. L["Scourge Invasion"] .. ")", EntityTypes.NPC, 14695),
            CreateNPCEntry("5", "Rattlegore", 11622, false, L["Lower"]),
            CreateIndentedNPCEntry("Death Knight Darkreaver", 14516, L["Summon"]),
            CreateNPCEntry("6", "Marduk Blackpool", 10433),
            CreateIndentedNPCEntry("Vectus", 10432),
            CreateNPCEntry("7", "Ras Frostwhisper", 10508),
            CreateObjectEntry(Constants.INDENT, "The Deed to Brill", 176484),
            CreateIndentedNPCEntry("Kormok", 16118, L["Summon"]),
            CreateNPCEntry("8", "Instructor Malicia", 10505),
            CreateNPCEntry("9", "Doctor Theolen Krastinov", 11261),
            CreateNPCEntry("10", "Lorekeeper Polkelt", 10901),
            CreateNPCEntry("11", "The Ravenian", 10507),
            CreateNPCEntry("12", "Lord Alexei Barov", 10504),
            CreateObjectEntry(Constants.INDENT, "The Deed to Caer Darrow", 176485),
            CreateNPCEntry("13", "Lady Illucia Barov", 10502),
            CreateNPCEntry("14", "Darkmaster Gandling", 1853),
            CreateSpecialEntry("1", "Torch Lever", nil, Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Old Treasure Chest"], EntityTypes.OBJECT, 176944),
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
        zoneId = 209,
        acronym = "SFK",
        location = BZ["Silverpine Forest"],
        locationId = 130,
        levelRange = "22-30",
        minLevel = "14",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Rethilgore", 3914),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sorcerer Ashcrombe"], EntityTypes.NPC, 3850),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Deathstalker Adamant"], EntityTypes.NPC, 3849),
            CreateEntry(Colors.GREY, "2) " .. L["Deathstalker Vincent"], EntityTypes.NPC, 4444),
            CreateEntry(Colors.GREY, "3) " .. L["Fel Steed"], EntityTypes.NPC, 3864),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jordan's Hammer"], EntityTypes.OBJECT, 91138),
            CreateNPCEntry("4", "Razorclaw the Butcher", 3886),
            CreateNPCEntry("5", "Baron Silverlaine", 3887),
            CreateNPCEntry("6", "Commander Springvale", 4278),
            CreateEntry(Colors.GREY, "7) " .. BB["Sever"] .. " (" .. L["Scourge Invasion"] .. ")", EntityTypes.NPC, 4279),
            CreateNPCEntry("8", "Odo the Blindwatcher", 4279),
            CreateNPCEntry("9", "Deathsworn Captain", 3872, true),
            CreateNPCEntry("10", "Fenrus the Devourer", 4274),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Arugal's Voidwalker"], EntityTypes.NPC, 4627),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Book of Ur"], EntityTypes.OBJECT, 36738),
            CreateNPCEntry("11", "Wolf Master Nandos", 3927),
            CreateNPCEntry("12", "Archmage Arugal", 4275),
            CreateNPCEntry("13", "Prelate Ironmane", 61969),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    Stratholme = CreateDungeonTemplate({
        zoneName = BZ["Stratholme"],
        zoneId = 2017,
        acronym = "Strat",
        location = BZ["Eastern Plaguelands"],
        locationId = 139,
        levelRange = "58-60",
        minLevel = "45",
        playerLimit = "5",
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
            CreateEntry(Colors.GREY, "1) " .. BB["Skul"] .. " (" .. L["Rare"] .. ", " .. L["Varies"] .. ")", EntityTypes.NPC, 10393),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Stratholme Courier"], EntityTypes.NPC, 11082),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Fras Siabi"], EntityTypes.NPC, 11058),
            CreateEntry(Colors.GREY, "2) " .. BB["Rethilgore"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 16387),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Balzaphon"] .. " (" .. L["Scourge Invasion"] .. ")", EntityTypes.NPC, 14684),
            CreateEntry(Colors.GREY, "3) " .. BB["Hearthsinger Forresten"] .. " (" .. L["Rare"] .. ", " .. L["Varies"] .. ")", EntityTypes.NPC, 10558),
            CreateNPCEntry("4", "The Unforgiven", 10516),
            CreateEntry(Colors.GREY, "5) " .. L["Elder Farwhisper"] .. " (" .. L["Lunar Festival"] .. ")", EntityTypes.NPC, 15607),
            CreateNPCEntry("6", "Timmy the Cruel", 10808),
            CreateNPCEntry("7", "Malor the Zealous", 11032),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Malor's Strongbox"], EntityTypes.OBJECT, 176112),
            CreateEntry(Colors.GREY, "8) " .. L["Crimson Hammersmith"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 11120),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"], EntityTypes.OBJECT, 173232),
            CreateNPCEntry("9", "Cannon Master Willey", 10997),
            CreateNPCEntry("10", "Archivist Galford", 10811),
            CreateEntry(Colors.GREY, "11) " .. L["Grand Crusader Dathrohan"], EntityTypes.NPC, 10812),
            CreateIndentedNPCEntry("Balnazzar", 10813),
            CreateEntry(Colors.GREY, Constants.INDENT .. BB["Sothos"] .. " & " .. BB["Jarien"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 16102),
            CreateEntry(Colors.GREY, "12) " .. BB["Magistrate Barthilas"] .. " (" .. L["Varies"] .. ")", EntityTypes.NPC, 10435),
            CreateEntry(Colors.GREY, "13) " .. L["Aurius"], EntityTypes.NPC, 10917),
            CreateEntry(Colors.GREY, "14) " .. BB["Stonespine"] .. " (" .. L["Rare"] .. ", " .. L["Wanders"] .. ")", EntityTypes.NPC, 10809),
            CreateNPCEntry("15", "Baroness Anastari", 10436),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Black Guard Swordsmith"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 11121),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Blacksmithing Plans"], EntityTypes.OBJECT, 173232),
            CreateNPCEntry("16", "Nerub'enkan", 10437),
            CreateNPCEntry("17", "Maleki the Pallid", 10438),
            CreateNPCEntry("18", "Ramstein the Gorger", 10439),
            CreateNPCEntry("19", "Baron Rivendare", 10440),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ysida Harmon"], EntityTypes.NPC, 16031),
            CreateSpecialEntry("1", "Crusaders' Square Postbox", 176349, Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Market Row Postbox"], EntityTypes.OBJECT, 176346),
            CreateEntry(Colors.GREEN, "3') " .. L["Festival Lane Postbox"], EntityTypes.OBJECT, 176350),
            CreateEntry(Colors.GREEN, "4') " .. L["Elders' Square Postbox"], EntityTypes.OBJECT, 176351),
            CreateEntry(Colors.GREEN, "5') " .. L["King's Square Postbox"], EntityTypes.OBJECT, 176352),
            CreateEntry(Colors.GREEN, "6') " .. L["Fras Siabi's Postbox"], EntityTypes.OBJECT, 176353),
            CreateEntry(Colors.GREEN, Constants.INDENT .. L["Third Postbox Opened"] .. ": " .. BB["Postmaster Malown"], EntityTypes.NPC, 11143),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("The Postmaster"),
            CreateSetEntry("Ironweave Battlesuit"),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tier 0/0.5 Sets"])
        }
    }),

    TheDeadmines = CreateDungeonTemplate({
        zoneName = BZ["The Deadmines"],
        zoneId = 1581,
        acronym = "VC",
        location = BZ["Westfall"],
        locationId = 40,
        levelRange = "17-24",
        minLevel = "10",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Exit"] }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BB["Jared Voss"], EntityTypes.NPC, -1),
            CreateNPCEntry("2", "Rhahk'Zor", 644),
            CreateNPCEntry("3", "Miner Johnson", 3586, true),
            CreateNPCEntry("4", "Sneed", 643),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sneed's Shredder"], EntityTypes.NPC, 642),
            CreateNPCEntry("5", "Gilnid", 1763),
            CreateEntry(Colors.GREY, "6) " .. BB["Masterpiece Harvester"], EntityTypes.NPC, -1),
            CreateNPCEntry("7", "Mr. Smite", 646),
            CreateNPCEntry("8", "Cookie", 645),
            CreateNPCEntry("9", "Captain Greenskin", 647),
            CreateNPCEntry("10", "Edwin VanCleef", 639),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateSetEntry("Defias Leather")
        }
    }),

    TheStockade = CreateDungeonTemplate({
        zoneName = BZ["The Stockade"],
        zoneId = 717,
        acronym = "Stocks",
        location = BZ["Stormwind City"],
        locationId = 1519,
        levelRange = "24-31",
        minLevel = "15",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BB["Targorr the Dread"] .. " (" .. L["Varies"] .. ")", EntityTypes.NPC, 1696),
            CreateNPCEntry("2", "Kam Deepfury", 1666),
            CreateNPCEntry("3", "Hamhock", 1717),
            CreateNPCEntry("4", "Bazil Thredd", 1716),
            CreateNPCEntry("5", "Dextren Ward", 1663),
            CreateNPCEntry("6", "Bruegal Ironknuckle", 1720, true),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    TheSunkenTemple = CreateDungeonTemplate({
        zoneName = L["Sunken Temple"],
        zoneId = 1417,
        acronym = "ST",
        location = BZ["Swamp of Sorrows"],
        locationId = 8,
        levelRange = "50-60",
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
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Gasher"], EntityTypes.NPC, 5713),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Loro"], EntityTypes.NPC, 5714),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Hukku"], EntityTypes.NPC, 5715),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Zolo"], EntityTypes.NPC, 5712),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Mijan"], EntityTypes.NPC, 5717),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BB["Zul'Lor"], EntityTypes.NPC, 5716),
            CreateEntry(Colors.GREY, "1) " .. L["Altar of Hakkar"], EntityTypes.OBJECT, 148836),
            CreateIndentedNPCEntry("Atal'alarion", 8580),
            CreateEntry(Colors.GREY, "2) " .. L["Spawn of Hakkar"] .. " (" .. L["Wanders"] .. ")", EntityTypes.NPC, 5708),
            CreateNPCEntry("3", "Avatar of Hakkar", 8443),
            CreateNPCEntry("4", "Jammal'an the Prophet", 5710),
            CreateIndentedNPCEntry("Ogom the Wretched", 5711),
            CreateEntry(Colors.GREY, "5) " .. L["Elder Starsong"] .. " (" .. L["Lunar Festival"] .. ")", EntityTypes.NPC, 15593),
            CreateNPCEntry("6", "Dreamscythe", 5721),
            CreateIndentedNPCEntry("Weaver", 5720),
            CreateNPCEntry("7", "Morphaz", 5719),
            CreateIndentedNPCEntry("Hazzas", 5722),
            CreateNPCEntry("8", "Shade of Eranikus", 5709),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Essence Font"], EntityTypes.OBJECT, 148512),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Malfurion Stormrage"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 15362),
            CreateEntry(Colors.GREEN, "1'-6') " .. L["Statue Activation Order"]),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    Uldaman = CreateDungeonTemplate({
        zoneName = BZ["Uldaman"],
        zoneId = 1337,
        acronym = "Ulda",
        location = BZ["Badlands"],
        locationId = 3,
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
            CreateNPCEntry("1", "Baelog", 6906),
            CreateIndentedNPCEntry("Eric \"The Swift\"", 6907),
            CreateIndentedNPCEntry("Olaf", 6908),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Baelog's Chest"], EntityTypes.OBJECT, 123329),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Conspicuous Urn"], EntityTypes.OBJECT, 125477),
            CreateEntry(Colors.GREY, "2) " .. L["Remains of a Paladin"], EntityTypes.NPC, 6912),
            CreateNPCEntry("3", "Revelosh", 6910),
            CreateNPCEntry("4", "Ironaya", 7228),
            CreateNPCEntry("5", "Obsidian Sentinel", 7023),
            CreateEntry(Colors.GREY, "6) " .. L["Annora"], EntityTypes.NPC, 11073),
            CreateNPCEntry("7", "Ancient Stone Keeper", 7206),
            CreateNPCEntry("8", "Galgann Firehammer", 7291),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tablet of Will"], EntityTypes.OBJECT, 142088),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Shadowforge Cache"], EntityTypes.OBJECT, 113757),
            CreateNPCEntry("9", "Grimlok", 4854),
            CreateNPCEntry("10", "Archaedas", 2748, false, L["Lower"]),
            CreateEntry(Colors.GREY, "11) " .. L["The Discs of Norgannon"] .. " (" .. L["Lower"] .. ")", EntityTypes.OBJECT, 131474),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ancient Treasure"] .. " (" .. L["Lower"] .. ")", EntityTypes.OBJECT, 141979),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    ZulGurub = CreateDungeonTemplate({
        zoneName = BZ["Zul'Gurub"],
        zoneId = 19,
        acronym = "ZG",
        location = BZ["Stranglethorn Vale"],
        locationId = 33,
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
            CreateEntry(Colors.GREY, "1) " .. BB["High Priestess Jeklik"] .. " (" .. L["Bat"] .. ")", EntityTypes.NPC, 14517),
            CreateEntry(Colors.GREY, "2) " .. BB["High Priest Venoxis"] .. " (" .. L["Snake"] .. ")", EntityTypes.NPC, 14507),
            CreateEntry(Colors.GREY, "3) " .. L["Zanza the Restless"], EntityTypes.NPC, 15042),
            CreateEntry(Colors.GREY, "4) " .. BB["High Priestess Mar'li"] .. " (" .. L["Spider"] .. ")", EntityTypes.NPC, 14510),
            CreateEntry(Colors.GREY, "5) " .. BB["Bloodlord Mandokir"] .. " (" .. L["Raptor"] .. ", " .. L["Optional"] .. ")", EntityTypes.NPC, 11382),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ohgan"], EntityTypes.NPC, 14988),
            CreateEntry(Colors.GREY, "6) " .. L["Edge of Madness"] .. " (" .. L["Optional"] .. ")"),
            CreateIndentedNPCEntry("Gri'lek", 15082, L["Random"]),
            CreateIndentedNPCEntry("Hazza'rah", 15083, L["Random"]),
            CreateIndentedNPCEntry("Renataki", 15084, L["Random"]),
            CreateIndentedNPCEntry("Wushoolay", 15085, L["Random"]),
            CreateEntry(Colors.GREY, "7) " .. BB["Gahz'ranka"] .. " (" .. L["Optional"] .. ", " .. L["Summon"] .. ")", EntityTypes.NPC, 15114),
            CreateEntry(Colors.GREY, "8) " .. BB["High Priest Thekal"] .. " (" .. L["Tiger"] .. ")", EntityTypes.NPC, 14509),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zealot Zath"] .. " (|cfffff468" .. BC["Rogue"] .. Colors.GREY .. ")", EntityTypes.NPC, 11348),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Zealot Lor'Khan"] .. " (|cff2773ff" .. BC["Shaman"] .. Colors.GREY .. ")", EntityTypes.NPC, 11347),
            CreateEntry(Colors.GREY, "9) " .. BB["High Priestess Arlokk"] .. " (" .. L["Panther"] .. ")", EntityTypes.NPC, 14515),
            CreateEntry(Colors.GREY, "10) " .. BB["Jin'do the Hexxer"] .. " (" .. L["Optional"] .. ")", EntityTypes.NPC, 11380),
            CreateNPCEntry("11", "Hakkar", 14834),
            CreateSpecialEntry("1", "Muddy Churning Waters", 180369, Colors.GREEN),
            CreateEntry(Colors.GREEN, "2') " .. L["Jinxed Hoodoo Pile"], EntityTypes.OBJECT, 180228),
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
        zoneId = 2557,
        acronym = "DM",
        location = BZ["Feralas"],
        locationId = 357,
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
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mushgog"] .. " (" .. L["Rare"] .. ", " .. L["Random"] .. ")", EntityTypes.NPC, 11447),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Skarr the Unbreakable"] .. " (" .. L["Rare"] .. ", " .. L["Random"] .. ")", EntityTypes.NPC, 11498),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["The Razza"] .. " (" .. L["Rare"] .. ", " .. L["Random"] .. ")", EntityTypes.NPC, 11497),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Elder Mistwalker"] .. " (" .. L["Lunar Festival"] .. ")", EntityTypes.NPC, 15587),
            CreateEntry(Colors.GREY, "3) " .. L["Griniblix the Spectator"], EntityTypes.NPC, 14395)
        }
    }),

    SMEnt = CreateDungeonTemplate({
        zoneName = BZ["Scarlet Monastery"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 796,
        acronym = "SM",
        location = BZ["Tirisfal Glades"],
        locationId = 85,
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
        zoneId = 719,
        acronym = "BFD",
        location = BZ["Ashenvale"],
        locationId = 331,
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Blackfathom Deeps"] }
        },
        entries = {}
    }),

    BlackrockMountainEnt = CreateDungeonTemplate({
        zoneName = BZ["Blackrock Mountain"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 25,
        acronym = "BRM",
        location = BZ["Blackrock Mountain"],
        locationId = { 51, 46 },
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A", info = BZ["Searing Gorge"] },
            { letter = "B", info = BZ["Burning Steppes"] },
            { letter = "C", info = BZ["Blackrock Depths"] .. " (BRD)" },
            { letter = "D", info = BZ["Lower Blackrock Spire"] .. " (LBRS)" }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. BZ["Molten Core"] .. " (MC) (" .. L["through "] .. "BRD)", EntityTypes.ZONE, 2717),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BZ["Upper Blackrock Spire"] .. " (UBRS)", EntityTypes.ZONE, 1583),
            CreateEntry(Colors.BLUE, Constants.INDENT .. BZ["Blackwing Lair"] .. " (BWL) (" .. L["through "] .. "UBRS)", EntityTypes.ZONE, 2677),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Bodley"] .. " (" .. L["Ghost"] .. ")", EntityTypes.NPC, 16033),
            CreateNPCEntry("1", "Overmaster Pyron", 9026, false, L["Wanders"]),
            CreateNPCEntry("2", "Lothos Riftwaker", 14387, false, "MC " .. L["Teleport"]),
            CreateNPCEntry("3", "Franclorn Forgewright", 8888, false, L["Ghost"]),
            CreateEntry(Colors.GREY, "4) " .. L["Meeting Stone"] .. " (BRD)"),
            CreateEntry(Colors.GREY, "5) " .. L["Orb of Command"] .. " (BWL " .. L["Teleport"] .. ")", EntityTypes.OBJECT, 179879),
            CreateEntry(Colors.GREY, "6) " .. L["Meeting Stone"] .. " (LBRS, UBRS)"),
            CreateNPCEntry("7", "Scarshield Quartermaster", 9046, true),
            CreateNPCEntry("8", "The Behemoth", 8924, true)
        }
    }),

    GnomereganEnt = CreateDungeonTemplate({
        zoneName = BZ["Gnomeregan"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 133,
        acronym = "Gnome",
        location = BZ["Dun Morogh"],
        locationId = 1,
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
            CreateIndentedNPCEntry("Sprok", 8320),
            CreateEntry(Colors.GREY, "3) " .. L["Matrix Punchograph 3005-A"], EntityTypes.OBJECT, 142345),
            CreateIndentedNPCEntry("Namdo Bizzfizzle", 2683),
            CreateNPCEntry("4", "Techbot", 6231),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    MaraudonEnt = CreateDungeonTemplate({
        zoneName = BZ["Maraudon"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 2100,
        acronym = "Mara",
        location = BZ["Desolace"],
        locationId = 405,
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Maraudon"] .. " (" .. L["Purple"] .. ")" },
            { letter = "C", info = BZ["Maraudon"] .. " (" .. L["Orange"] .. ")" },
            { letter = "D", info = BZ["Maraudon"] .. " (" .. L["Portal"] .. ")" }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["The Nameless Prophet"], EntityTypes.NPC, 13718),
            CreateNPCEntry("1", "Kolk", 13742),
            CreateNPCEntry("2", "Gelk", 13741),
            CreateNPCEntry("3", "Magra", 13740),
            CreateNPCEntry("4", "Cavindra", 13697),
            CreateNPCEntry("5", "Cursed Centaur", 11688, true, L["Varies"])
        }
    }),

    TheDeadminesEnt = CreateDungeonTemplate({
        zoneName = BZ["The Deadmines"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 1581,
        acronym = "DM",
        location = BZ["Westfall"],
        locationId = 40,
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["The Deadmines"] }
        },
        entries = {
            CreateNPCEntry("1", "Marisa du'Paige", 599, true, L["Varies"]),
            CreateNPCEntry("2", "Brainwashed Noble", 596, true),
            CreateNPCEntry("3", "Foreman Thistlenettle", 626)
        }
    }),

    TheSunkenTempleEnt = CreateDungeonTemplate({
        zoneName = L["Sunken Temple"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 1417,
        acronym = "ST",
        location = BZ["Swamp of Sorrows"],
        locationId = 8,
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Sunken Temple"] }
        },
        entries = {
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Meeting Stone"]),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Jade"] .. " (" .. L["Rare"] .. ")", EntityTypes.NPC, 1063),
            CreateNPCEntry("1", "Kazkaz the Unholy", 5401, true, L["Upper"]),
            CreateNPCEntry("2", "Zekkis", 5400, true, L["Lower"]),
            CreateNPCEntry("3", "Veyzhak the Cannibal", 5399, true)
        }
    }),

    UldamanEnt = CreateDungeonTemplate({
        zoneName = BZ["Uldaman"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 1337,
        acronym = "Ulda",
        location = BZ["Badlands"],
        locationId = 3,
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Uldaman"] }
        },
        entries = {
            CreateNPCEntry("1", "Hammertoe Grez", 2909),
            CreateNPCEntry("2", "Magregan Deepshadow", 2932, false, L["Wanders"]),
            CreateItemEntry("3", "Tablet of Ryun'Eh", 4631),
            CreateObjectEntry("4", "Krom Stoutarm's Chest", 124389),
            CreateObjectEntry("5", "Garrett Family Chest", 124388),
            CreateSpecialEntry("1", "Digmaster Shovelphlange", 7057, Colors.GREEN, L["Rare"] .. ", " .. L["Varies"])
        }
    }),

    WailingCavernsEnt = CreateDungeonTemplate({
        zoneName = BZ["Wailing Caverns"] .. " (" .. L["Entrance"] .. ")",
        zoneId = 718,
        acronym = "WC",
        location = BZ["The Barrens"],
        locationId = 17,
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = BZ["Wailing Caverns"] }
        },
        entries = {
            CreateNPCEntry("1", "Mad Magglish", 3655, false, L["Varies"]),
            CreateNPCEntry("2", "Trigore the Lasher", 3652, true),
            CreateNPCEntry("3", "Boahn", 3672, true),
            CreateEmptyEntry(),
            CreateEntry(Colors.ORANGE, L["Above the Entrance:"]),
            CreateEntry(Colors.GREY, "Ebru", EntityTypes.NPC, 5768),
            CreateEntry(Colors.GREY, "Nalpak", EntityTypes.NPC, 5767),
            CreateEntry(Colors.GREY, "Kalldan Felmoon", EntityTypes.NPC, 5783),
            CreateEntry(Colors.GREY, "Waldor", EntityTypes.NPC, 5784),
        }
    }),

    --************************************************
    -- World Bosses
    --************************************************

    Azuregos = CreateDungeonTemplate({
        zoneName = BB["Azuregos"],
        location = BZ["Azshara"],
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "40",
        entries = {
            CreateNPCEntry("1", "Azuregos", 6109),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Spirit of Azuregos"], EntityTypes.NPC, 15481),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        },
        damageType = "Frost"
    }),

    FourDragons = CreateDungeonTemplate({
        zoneName = L["Emerald Dragons"],
        location = L["Various"],
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "40",
        entries = {
            CreateEntry(Colors.GREY, "1) " .. BZ["Duskwood"], EntityTypes.ZONE, 10),
            CreateEntry(Colors.GREY, "2) " .. BZ["The Hinterlands"], EntityTypes.ZONE, 47),
            CreateEntry(Colors.GREY, "3) " .. BZ["Feralas"], EntityTypes.ZONE, 357),
            CreateEntry(Colors.GREY, "4) " .. BZ["Ashenvale"], EntityTypes.ZONE, 331),
            CreateEmptyEntry(),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Lethon"], EntityTypes.NPC, 14888),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Emeriss"], EntityTypes.NPC, 14889),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Taerar"], EntityTypes.NPC, 14890),
            CreateEntry(Colors.GREEN, Constants.INDENT .. BB["Ysondre"], EntityTypes.NPC, 14887),
            CreateEmptyEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Emerald Dragons Trash"]),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        },
        damageType = "Nature, Shadow"
    }),

    LordKazzak = CreateDungeonTemplate({
        zoneName = BB["Lord Kazzak"],
        location = BZ["Blasted Lands"],
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "40",
        entries = {
            CreateNPCEntry("1", "Lord Kazzak", 18728),
            CreateEntry(Colors.GREY, "2) " .. L["Nethergarde Keep"]),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        },
        damageType = "Shadow"
    }),

    --************************************************
    -- Turtle WoW Custom Content
    --************************************************

    TheCrescentGrove = CreateDungeonTemplate({
        zoneName = BZ["The Crescent Grove"],
        zoneId = 3333,
        acronym = "CG",
        location = BZ["Ashenvale"],
        locationId = 331,
        levelRange = "32-38",
        minLevel = "32",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Kalanar's Strongbox"], EntityTypes.OBJECT, 2010860),
            CreateNPCEntry("1", "Grovetender Engryss", 92107),
            CreateNPCEntry("2", "Keeper Ranathos", 92109),
            CreateNPCEntry("3", "High Priestess A'lathea", 92108),
            CreateNPCEntry("4", "Fenektis the Deceiver", 92109),
            CreateNPCEntry("5", "Master Raxxieth", 92110),
            CreateTrashMobsEntry()
        }
    }),

    KarazhanCrypt = CreateDungeonTemplate({
        zoneName = BZ["Karazhan Crypt"],
        zoneId = 3334,
        acronym = "KC",
        location = BZ["Deadwind Pass"],
        levelRange = "60",
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
            CreateNPCEntry("1", "Marrowspike", 91920),
            CreateNPCEntry("2", "Hivaxxis", 91929),
            CreateNPCEntry("3", "Corpsemuncher", 91917),
            CreateNPCEntry("4", "Guard Captain Gort", 92935),
            CreateNPCEntry("5", "Archlich Enkhraz", 91916),
            CreateNPCEntry("6", "Commander Andreon", 91919),
            CreateNPCEntry("7", "Alarus", 91928),
            CreateEntry(Colors.GREY, "8) " .. "Half-Buried Treasure Chest", EntityTypes.OBJECT, 379545),
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
            CreateNPCEntry("1", "Matthias Holtz", 61419),
            CreateNPCEntry("2", "Packmaster Ragetooth", 61420),
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Dawnstone Plans"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "b) " .. L["Manuscript of Hydromancy II"]),
            CreateNPCEntry("3", "Judge Sutherland", 61421),
            CreateNPCEntry("4", "Dustivan Blackcowl", 61422),
            CreateNPCEntry("5", "Marshal Magnus Greystone", 61423),
            CreateNPCEntry("6", "Horsemaster Levvin", 61605),
            CreateObjectEntry("7", "Harlow Family Chest", 2020027),
            CreateNPCEntry("8", "Genn Greymane", 61418),
            CreateTrashMobsEntry(),
            CreateSetEntry("Greymane Armor")
        }
    }),

    HateforgeQuarry = CreateDungeonTemplate({
        zoneName = BZ["Hateforge Quarry"],
        zoneId = 3335,
        acronym = "HQ",
        location = BZ["Burning Steppes"],
        locationId = 46,
        levelRange = "52-60",
        minLevel = "48",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "High Foreman Bargul Blackhammer", 60735),
            CreateNPCEntry("2", "Engineer Figgles", 60736),
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Hateforge Chemistry Documents"]),
            CreateNPCEntry("3", "Corrosis", 60829),
            CreateNPCEntry("4", "Hatereaver Annihilator", 60734),
            CreateNPCEntry("5", "Hargesh Doomcaller", 60737),
            CreateTrashMobsEntry(),
            CreateEmptyEntry(),
            CreateSetEntry("Incendosaur Skin Armor")
        }
    }),

    StormwindVault = CreateDungeonTemplate({
        zoneName = BZ["Stormwind Vault"],
        zoneId = 3336,
        acronym = "SV",
        location = BZ["Stormwind City"],
        locationId = 1519,
        levelRange = "60",
        minLevel = "58",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateNPCEntry("1", "Aszosh Grimflame", 80853),
            CreateNPCEntry("2", "Tham'Grarr", 80852),
            CreateNPCEntry("3", "Black Bride", 80850),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tome of Arcane Intricacies and Magical Phenomenon IX"]),
            CreateNPCEntry("4", "Damian", 80854),
            CreateNPCEntry("5", "Volkan Cruelblade", 80851),
            CreateEntry(Colors.GREY, "6) " .. L["Arc'tiras / Vault Armory Equipment"], EntityTypes.NPC, 93107),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    CavernsOfTimeBlackMorass = CreateDungeonTemplate({
        zoneName = BZ["Caverns of Time: Black Morass"],
        zoneId = 3335,
        acronym = "BM",
        location = BZ["Tanaris"],
        locationId = 440,
        levelRange = "60",
        minLevel = "58",
        playerLimit = "5",
        continent = BZ["Kalimdor"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] }
        },
        entries = {
            CreateNPCEntry("1", "Chronar", 65113),
            CreateNPCEntry("2", "Epidamu", 61575),
            CreateNPCEntry("3", "Drifting Avatar of Sand", 61316),
            CreateNPCEntry("4", "Time-Lord Epochronos", 65116),
            CreateNPCEntry("5", "Mossheart", 65124),
            CreateNPCEntry("6", "Antnormi", 65125),
            CreateNPCEntry("7", "Rotmaw", 65122),
            CreateTrashMobsEntry()
        }
    }),

    LowerKarazhan = CreateDungeonTemplate({
        zoneName = BZ["Lower Karazhan Halls"],
        acronym = "LKH",
        location = BZ["Deadwind Pass"],
        locationId = 41,
        levelRange = "58-60",
        minLevel = "58",
        playerLimit = "10",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] }
        },
        entries = {
            CreateNPCEntry("1", "Master Blacksmith Rolfen", 61319),
            CreateEntry(Colors.GREY, Constants.INDENT .. "a) " .. L["Engraved Golden Bracelet"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "b) " .. L["Comfortable Pillow"]),
            CreateNPCEntry("2", "Brood Queen Araxxna", 61221),
            CreateNPCEntry("3", "Grizikil", 61224),
            CreateEntry(Colors.GREY, Constants.INDENT .. "c) " .. L["Councilman Kyleson"]),
            CreateNPCEntry("4", "Clawlord Howlfang", 61223),
            CreateNPCEntry("5", "Lord Blackwald II", 61222),
            CreateEntry(Colors.GREY, Constants.INDENT .. "d) " .. L["Lord Ebonlocke"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "e) " .. L["Obsidian Rod"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. "f) " .. L["Duke Rothlen"]),
            CreateNPCEntry("6", "Moroes", 61226),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lower Karazhan Halls Enchants"])
        }
    }),

    EmeraldSanctum = CreateDungeonTemplate({
        zoneName = BZ["Emerald Sanctum"],
        zoneId = 3339,
        acronym = "ES",
        location = BZ["Hyjal"],
        locationId = 3339,
        levelRange = "60",
        minLevel = "58",
        playerLimit = "40",
        continent = BZ["Kalimdor"],
        entries = {
            CreateEmptyEntry(),
            CreateNPCEntry("1", "Erennius", 60747),
            CreateNPCEntry("2", "Solnius the Awakener", 60748),
            CreateObjectEntry("3", "Favor of Erennius (ES Hard Mode)", 2020042),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    TowerofKarazhan = CreateDungeonTemplate({
        zoneName = BZ["Tower of Karazhan"],
        zoneId = 0,
        acronym = "K40, KARA40",
        location = BZ["Deadwind Pass"],
        locationId = 41,
        levelRange = "60+",
        minLevel = "60",
        playerLimit = "40",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" },
            { letter = "B", info = L["Connection"] }
        },
        entries = {
            CreateNPCEntry("1", "Keeper Gnarlmoon", 61939),
            CreateNPCEntry("2", "Ley-Watcher Incantagos", 61946),
            CreateNPCEntry("3", "Anomalus", 61951),
            CreateNPCEntry("4", "Echo of Medivh", 61958),
            CreateEntry(Colors.GREY, "5) " .. BB["King"] .. " (Chess fight)", EntityTypes.NPC, 59812),
            CreateNPCEntry("6", "Sanv Tas'dal", 59981),
            CreateNPCEntry("7", "Rupturan the Broken", 59961),
            CreateNPCEntry("8", "Kruul", 59991),
            CreateNPCEntry("9", "Mephistroth", 93333),
            CreateEmptyEntry(),
            CreateTrashMobsEntry(),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Tower of Karazhan Sets"])
        }
    }),

    StormwroughtRuins = CreateDungeonTemplate({
        zoneName = BZ["Stormwrought Ruins"],
        zoneId = 0,
        acronym = "SR",
        location = BZ["Balor"],
        locationId = 0,
        levelRange = "35-42",
        minLevel = "28",
        playerLimit = "5",
        continent = BZ["Eastern Kingdoms"],
        entrances = {
            { letter = "A" }
        },
        entries = {
            CreateEntry(Colors.GREY, "1) ", EntityTypes.NPC, 0),
            CreateEmptyEntry(),
            CreateTrashMobsEntry()
        }
    }),

    -- World Bosses (continued)
    Turtlhu = CreateDungeonTemplate({
        zoneName = "Turtlhu, the Black Turtle of Doom",
        zoneId = 18728,
        location = BZ["Feralas"],
        locationId = 357,
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "--",
        damageType = "Shadow",
        entries = {
            CreateEntry(Colors.GREY, "1) Turtlhu, the Black Turtle of Doom", EntityTypes.NPC, 18728),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        }
    }),

    Nerubian = CreateDungeonTemplate({
        zoneName = BB["Nerubian Overseer"],
        zoneId = 18728,
        acronym = "Spooder",
        location = BZ["Eastern Plaguelands"],
        locationId = 28,
        levelRange = "--",
        minLevel = "--",
        playerLimit = "--",
        continent = BZ["Eastern Kingdoms"],
        damageType = L["Nature"] .. ", " .. L["Shadow"],
        entries = {
            CreateNPCEntry("1", "Nerubian Overseer", 18728),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry(),
            CreateEmptyEntry()
        }
    }),

    Reaver = CreateDungeonTemplate({
        zoneName = BB["Dark Reaver of Karazhan"],
        zoneId = 80936,
        acronym = "Reaver",
        location = BZ["Deadwind Pass"],
        locationId = 41,
        levelRange = "--",
        minLevel = "--",
        playerLimit = "--",
        continent = BZ["Eastern Kingdoms"],
        entries = {
            CreateNPCEntry("1", "Dark Reaver of Karazhan", 80936)
        }
    }),

    CowKing = CreateDungeonTemplate({
        zoneName = BB["Moo"],
        zoneId = 91799,
        acronym = "CowKing",
        location = BZ["Moomoo Grove"],
        locationId = -1,
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "20+",
        continent = BZ["Eastern Kingdoms"],
        entries = {
            CreateNPCEntry("1", "Moo", 91799)
        }
    }),

    Concavius = CreateDungeonTemplate({
        zoneName = "Concavius Voidwalker",
        zoneId = 92213,
        acronym = "Concavius",
        location = BZ["Desolace"],
        locationId = 405,
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "20+",
        continent = BZ["Kalimdor"],
        entries = {
            CreateNPCEntry("1", "Concavius", 92213)
        }
    }),

    Ostarius = CreateDungeonTemplate({
        zoneName = BB["Ostarius"],
        zoneId = 80935,
        acronym = "Ostarius",
        location = BZ["Tanaris"],
        locationId = 440,
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "40+",
        continent = BZ["Kalimdor"],
        entries = {
            CreateNPCEntry("1", "Ostarius", 80935)
        }
    }),

    Clackora = CreateDungeonTemplate({
        zoneName = BB["Cla'ckora"],
        zoneId = 59963,
        acronym = "Clackora",
        location = BZ["Azshara"],
        locationId = 16,
        levelRange = "60+",
        minLevel = "--",
        playerLimit = "40+",
        continent = BZ["Eastern Kingdoms"],
        entries = {
            CreateNPCEntry("1", "Cla'ckora", 59963)
        }
    }),

    RareMobs = CreateDungeonTemplate({
        zoneName = "Rare Mobs",
        zoneId = 0,
        location = "Various locations",
        locationId = 16,
        levelRange = "17-60+",
        entries = {
            CreateEntry(Colors.GREY, "1) Shade Mage" .. Colors.RED .. " 0.4k (17L) " .. Colors.WHITE .. BZ["Tirisfal Glades"] .. Colors.ORANGE .. " [15, 68]", EntityTypes.NPC, 61499),
            CreateEntry(Colors.GREY, "2) Graypaw Alpha" .. Colors.RED .. " 0.7k (18L) " .. Colors.WHITE .. BZ["Tirisfal Glades"] .. Colors.ORANGE .. " [27, 58]", EntityTypes.NPC, 91990),
            CreateEntry(Colors.GREY, "3) Earthcaller Rezengal" .. Colors.RED .. " 0.4k (18L) " .. Colors.WHITE .. BZ["Stonetalon Mountains"] .. Colors.ORANGE .. " [74, 79]", EntityTypes.NPC, 61504),
            CreateEntry(Colors.GREY, "4) Blazespark" .. Colors.RED .. " 0.8k (24L) " .. Colors.WHITE .. BZ["Stonetalon Mountains"] .. Colors.ORANGE .. " [21, 29]", EntityTypes.NPC, 61503),
            CreateEntry(Colors.GREY, "5) Witch Doctor Tan'zo" .. Colors.RED .. " 2k (35L) " .. Colors.WHITE .. BZ["Arathi Highlands"] .. Colors.ORANGE .. " [44, 13]", EntityTypes.NPC, 61502),
            CreateEntry(Colors.GREY, "6) Dawnhowl" .. Colors.RED .. " 2k (40L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [43, 23]", EntityTypes.NPC, 61554),
            CreateEntry(Colors.GREY, "7) Widow of the Woods" .. Colors.RED .. " 6k (40L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [30, 50]", EntityTypes.NPC, 61553),
            CreateEntry(Colors.GREY, "8) Maltimor's Prototype" .. Colors.RED .. " 6k (43L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [48, 57]", EntityTypes.NPC, 61551),
            CreateEntry(Colors.GREY, "9) Bonecruncher" .. Colors.RED .. " 2k (44L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [54, 56]", EntityTypes.NPC, 61555),
            CreateEntry(Colors.GREY, "10) Duskskitterer" .. Colors.RED .. " 2k (44L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [46, 78]", EntityTypes.NPC, 61552),
            CreateEntry(Colors.GREY, "11) Baron Perenolde" .. Colors.RED .. " 3k (45L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [67, 80]", EntityTypes.NPC, 61550),
            CreateEntry(Colors.GREY, "12) Kin'Tozo" .. Colors.RED .. " 20k (45L) " .. Colors.WHITE .. BZ["Stranglethorn Vale"] .. Colors.ORANGE .. " [27, 55]", EntityTypes.NPC, 80269),
            CreateEntry(Colors.GREY, "13) M-0L1Y" .. Colors.RED .. " 3k (47L) " .. Colors.WHITE .. BZ["Icepoint Rock"] .. Colors.ORANGE .. " [54, 40]", EntityTypes.NPC, 61498),
            CreateEntry(Colors.GREY, "14) Grug'thok the Seer" .. Colors.RED .. " 15k (47L) " .. Colors.WHITE .. BZ["Feralas"] .. Colors.ORANGE .. " [58, 71]", EntityTypes.NPC, 49005),
            CreateEntry(Colors.GREY, "15) Explorer Ashbeard" .. Colors.RED .. " 16k (49L) " .. Colors.WHITE .. BZ["Searing Gorge"] .. Colors.ORANGE .. " [71, 18]", EntityTypes.NPC, 49011),
            CreateEntry(Colors.GREY, "16) Jal'akar" .. Colors.RED .. " 18k (50L) " .. Colors.WHITE .. BZ["The Hinterlands"] .. Colors.ORANGE .. " [53, 34]", EntityTypes.NPC, 49010),
            CreateEntry(Colors.GREY, "17) Ripjaw" .. Colors.RED .. " 9k (51L) " .. Colors.WHITE .. BZ["Lapidis Isle"] .. Colors.ORANGE .. " [55, 21]", EntityTypes.NPC, 61515),
            CreateEntry(Colors.GREY, "18) Ruk'thok the Pyromancer" .. Colors.RED .. " 3k (51L) " .. Colors.WHITE .. BZ["Lapidis Isle"] .. Colors.ORANGE .. " [43, 29]", EntityTypes.NPC, 61517),
            CreateEntry(Colors.GREY, "19) Embereye" .. Colors.RED .. " 4k (51L) " .. Colors.WHITE .. BZ["Gillijim's Isle"] .. Colors.ORANGE .. " [67, 69]", EntityTypes.NPC, 61516),
            CreateEntry(Colors.GREY, "20) Xalvic Blackclaw" .. Colors.RED .. " 19k (53L) " .. Colors.WHITE .. BZ["Felwood"] .. Colors.ORANGE .. " [53, 29]", EntityTypes.NPC, 49003),
            CreateEntry(Colors.GREY, "21) Firstborn of Arugal" .. Colors.RED .. " 10k (55L) " .. Colors.WHITE .. BZ["Gilneas"] .. Colors.ORANGE .. " [40, 37]", EntityTypes.NPC, 61558),
            CreateEntry(Colors.GREY, "22) Margon the Mighty" .. Colors.RED .. " 25k (55L) " .. Colors.WHITE .. BZ["Lapidis Isle"] .. Colors.ORANGE .. " [30, 41]", EntityTypes.NPC, 91839),
            CreateEntry(Colors.GREY, "23) The Wandering Knight" .. Colors.RED .. " 22k (55L) " .. Colors.WHITE .. BZ["Western Plaguelands"] .. Colors.ORANGE .. " [64, 74]", EntityTypes.NPC, 49007),
            CreateEntry(Colors.GREY, "24) Letashaz" .. Colors.RED .. " 25k (55L) " .. Colors.WHITE .. BZ["Gillijim's Isle"] .. Colors.ORANGE .. " [29, 89]", EntityTypes.NPC, 92163),
            CreateEntry(Colors.GREY, "25) Aquitus" .. Colors.RED .. " 7k (56L) " .. Colors.WHITE .. BZ["Gillijim's Isle"] .. Colors.ORANGE .. " [27, 70]", EntityTypes.NPC, 61518),
            CreateEntry(Colors.GREY, "26) Stoneshell" .. Colors.RED .. " 4k (56L) " .. Colors.WHITE .. BZ["Tel'Abim"] .. Colors.ORANGE .. " [40, 47]", EntityTypes.NPC, 61501),
            CreateEntry(Colors.GREY, "27) Tarangos" .. Colors.RED .. " 23k (56L) " .. Colors.WHITE .. BZ["Azshara"] .. Colors.ORANGE .. " [42, 80]", EntityTypes.NPC, 49001),
            CreateEntry(Colors.GREY, "28) Zareth Terrorblade" .. Colors.RED .. " 23k (57L) " .. Colors.WHITE .. BZ["Blasted Lands"] .. Colors.ORANGE .. " [55, 59]", EntityTypes.NPC, 49009),
            CreateEntry(Colors.GREY, "29) Highvale Silverback" .. Colors.RED .. " 4k (58L) " .. Colors.WHITE .. BZ["Tel'Abim"] .. Colors.ORANGE .. " [57, 48]", EntityTypes.NPC, 61500),
            CreateEntry(Colors.GREY, "30) Mallon The Moontouched" .. Colors.RED .. " 27k (58L) " .. Colors.WHITE .. BZ["Winterspring"] .. Colors.ORANGE .. " [57, 61]", EntityTypes.NPC, 49004),
            CreateEntry(Colors.GREY, "31) Professor Lysander" .. Colors.RED .. " 9k (59L) " .. Colors.WHITE .. BZ["Western Plaguelands"] .. Colors.ORANGE .. " [12, 50]", EntityTypes.NPC, 61853),
            CreateEntry(Colors.GREY, "32) Blademaster Kargron" .. Colors.RED .. " 28k (59L) " .. Colors.WHITE .. BZ["Burning Steppes"] .. Colors.ORANGE .. " [45, 32]", EntityTypes.NPC, 49002),
            CreateEntry(Colors.GREY, "33) Azurebeak" .. Colors.RED .. " 20k (60L) " .. Colors.WHITE .. BZ["Hyjal"] .. Colors.ORANGE .. " [23, 37]", EntityTypes.NPC, 61488),
            CreateEntry(Colors.GREY, "34) Barkskin Fisher" .. Colors.RED .. " 5k (60L) " .. Colors.WHITE .. BZ["Hyjal"] .. Colors.ORANGE .. " [66, 53]", EntityTypes.NPC, 61487),
            CreateEntry(Colors.GREY, "35) Admiral Barean Westwind" .. Colors.RED .. " 141k (60L) " .. Colors.WHITE .. BZ["Eastern Plaguelands"] .. Colors.ORANGE .. " [66, 42]", EntityTypes.NPC, 60525),
            CreateEntry(Colors.GREY, "36) Shadeflayer Goliath" .. Colors.RED .. " 17k (61L) " .. Colors.WHITE .. BZ["Hyjal"] .. Colors.ORANGE .. " [10, 44]", EntityTypes.NPC, 61533),
            CreateEntry(Colors.GREY, "37) Crusader Larsarius" .. Colors.RED .. " 28k (61L) " .. Colors.WHITE .. BZ["Eastern Plaguelands"] .. Colors.ORANGE .. " [47, 60]", EntityTypes.NPC, 49008)
        }
    }),

    --************************************************
    -- PvP Battlegrounds
    --************************************************

    AlteracValleyNorth = CreateDungeonTemplate({
        zoneName = BZ["Alterac Valley"] .. " (" .. L["North"] .. ")",
        zoneId = 2597,
        acronym = "AV",
        location = BZ["Alterac Mountains"],
        locationId = 36,
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
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Vanndar Stormpike"], EntityTypes.NPC, 11948),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar North Marshal"], EntityTypes.NPC, 14762),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar South Marshal"], EntityTypes.NPC, 14763),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Icewing Marshal"], EntityTypes.NPC, 14764),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Stonehearth Marshal"], EntityTypes.NPC, 14765),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Iceblood Marshal"], EntityTypes.NPC, 14766),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Tower Point Marshal"], EntityTypes.NPC, 14767),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["East Frostwolf Marshal"], EntityTypes.NPC, 14768),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["West Frostwolf Marshal"], EntityTypes.NPC, 14769),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Prospector Stonehewer"], EntityTypes.NPC, 13816),
            CreateEntry(Colors.RED, "1) " .. L["Irondeep Mine"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Morloch"] .. " (" .. L["Neutral"] .. ")", EntityTypes.NPC, 11657),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Umi Thorson"] .. " (" .. BF["Alliance"] .. ")", EntityTypes.NPC, 13078),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Keetar"] .. " (" .. BF["Horde"] .. ")", EntityTypes.NPC, 13079),
            CreateEntry(Colors.GREY, "2) " .. L["Arch Druid Renferal"], EntityTypes.NPC, 13442),
            CreateEntry(Colors.ORANGE, "3) " .. L["Dun Baldar North Bunker"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Mulverick"] .. " (" .. BF["Horde"] .. ")", EntityTypes.NPC, 13181),
            CreateEntry(Colors.GREY, "4) " .. L["Murgot Deepforge"], EntityTypes.NPC, 13257),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Dirk Swindle"], EntityTypes.NPC, 14188),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Athramanis"], EntityTypes.NPC, 14187),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Lana Thunderbrew"], EntityTypes.NPC, 4257),
            CreateEntry(Colors.RED, "5) " .. L["Stormpike Aid Station"]),
            CreateEntry(Colors.GREY, "6) " .. L["Stormpike Stable Master"], EntityTypes.NPC, 13617),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Stormpike Ram Rider Commander"], EntityTypes.NPC, 13577),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Svalbrad Farmountain"], EntityTypes.NPC, 5135),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Kurdrum Barleybeard"], EntityTypes.NPC, 5139),
            CreateEntry(Colors.GREY, "7) " .. L["Stormpike Quartermaster"], EntityTypes.NPC, 12096),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jonivera Farmountain"], EntityTypes.NPC, 5134),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Brogus Thunderbrew"], EntityTypes.NPC, 4255),
            CreateEntry(Colors.GREY, "8) " .. L["Wing Commander Ichman"] .. " (" .. L["Rescued"] .. ")", EntityTypes.NPC, 13437),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Slidore"] .. " (" .. L["Rescued"] .. ")", EntityTypes.NPC, 13438),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Vipore"] .. " (" .. L["Rescued"] .. ")", EntityTypes.NPC, 13439),
            CreateEntry(Colors.ORANGE, "9) " .. L["Dun Baldar South Bunker"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Corporal Noreg Stormpike"], EntityTypes.NPC, 13447),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Gaelden Hammersmith"], EntityTypes.NPC, 13216),
            CreateEntry(Colors.RED, "10) " .. L["Stormpike Graveyard"]),
            CreateEntry(Colors.GREY, "11) " .. L["Icewing Cavern"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Stormpike Banner"], EntityTypes.OBJECT, 179024),
            CreateEntry(Colors.GREY, "12) " .. L["Stormpike Lumber Yard"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Jeztor"] .. " (" .. BF["Horde"] .. ")", EntityTypes.NPC, 13180),
            CreateEntry(Colors.ORANGE, "13) " .. L["Icewing Bunker"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Guse"] .. " (" .. BF["Horde"] .. ")", EntityTypes.NPC, 13179),
            CreateEntry(Colors.RED, "14) " .. L["Stonehearth Graveyard"]),
            CreateEntry(Colors.GREY, "15) " .. L["Stormpike Ram Rider Commander"], EntityTypes.NPC, 13577),
            CreateEntry(Colors.ORANGE, "16) " .. L["Stonehearth Outpost"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Balinda Stonehearth"], EntityTypes.NPC, 11949),
            CreateEntry(Colors.RED, "17) " .. L["Snowfall Graveyard"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Ichman's Beacon"], EntityTypes.ITEM, 17505),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Mulverick's Beacon"] .. " (" .. BF["Horde"] .. ")", EntityTypes.ITEM, 17323),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Korrak the Bloodrager"], EntityTypes.NPC, 12159),
            CreateEntry(Colors.ORANGE, "18) " .. L["Stonehearth Bunker"]),
            CreateEntry(Colors.GREY, "19) " .. L["Ivus the Forest Lord"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 13419),
            CreateEntry(Colors.GREY, "20) " .. L["Western Crater"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Vipore's Beacon"], EntityTypes.ITEM, 17506),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jeztor's Beacon"] .. " (" .. BF["Horde"] .. ")", EntityTypes.ITEM, 17325),
            CreateEntry(Colors.GREY, "21) " .. L["Eastern Crater"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Slidore's Beacon"], EntityTypes.ITEM, 17507),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Guse's Beacon"] .. " (" .. BF["Horde"] .. ")", EntityTypes.ITEM, 17324),
            CreateEntry(Colors.GREY, "22) " .. L["Steamsaw"] .. " (" .. BF["Horde"] .. ")", EntityTypes.OBJECT, 178664),
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

    AlteracValleySouth = CreateDungeonTemplate({
        zoneName = BZ["Alterac Valley"] .. " (" .. L["South"] .. ")",
        zoneId = 2597,
        acronym = "AV",
        location = BZ["Hillsbrad Foothills"],
        locationId = 36,
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
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Drek'Thar"], EntityTypes.NPC, 11946),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Duros"], EntityTypes.NPC, 12122),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Drakan"], EntityTypes.NPC, 12121),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["West Frostwolf Warmaster"], EntityTypes.NPC, 14777),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["East Frostwolf Warmaster"], EntityTypes.NPC, 14772),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Tower Point Warmaster"], EntityTypes.NPC, 14776),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Iceblood Warmaster"], EntityTypes.NPC, 14773),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Stonehearth Warmaster"], EntityTypes.NPC, 14775),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Icewing Warmaster"], EntityTypes.NPC, 14774),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar North Warmaster"], EntityTypes.NPC, 14770),
            CreateEntry(Colors.BLUE, Constants.INDENT .. L["Dun Baldar South Warmaster"], EntityTypes.NPC, 14771),
            CreateEntry(Colors.GREY, "1) " .. L["Lokholar the Ice Lord"] .. " (" .. L["Summon"] .. ")", EntityTypes.NPC, 13256),
            CreateEntry(Colors.ORANGE, "2) " .. L["Iceblood Garrison"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Captain Galvangar"], EntityTypes.NPC, 11947),
            CreateEntry(Colors.ORANGE, "3) " .. L["Iceblood Tower"]),
            CreateEntry(Colors.RED, "4) " .. L["Iceblood Graveyard"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Ichman"] .. " (" .. BF["Alliance"] .. ")", EntityTypes.NPC, 13437),
            CreateEntry(Colors.ORANGE, "5) " .. L["Tower Point"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Slidore"] .. " (" .. BF["Alliance"] .. ")", EntityTypes.NPC, 13438),
            CreateEntry(Colors.GREY, "6) " .. L["Coldtooth Mine"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Taskmaster Snivvle"] .. " (" .. L["Neutral"] .. ")", EntityTypes.NPC, 11677),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Masha Swiftcut"] .. " (" .. BF["Horde"] .. ")", EntityTypes.NPC, 13088),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Aggi Rumblestomp"] .. " (" .. BF["Alliance"] .. ")", EntityTypes.NPC, 13086),
            CreateEntry(Colors.RED, "7) " .. L["Frostwolf Graveyard"]),
            CreateEntry(Colors.GREY, "8) " .. L["Wing Commander Vipore"] .. " (" .. BF["Alliance"] .. ")", EntityTypes.NPC, 13439),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Jotek"], EntityTypes.NPC, 13798),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Smith Regzar"], EntityTypes.NPC, 13176),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Primalist Thurloga"], EntityTypes.NPC, 13236),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Sergeant Yazra Bloodsnarl"], EntityTypes.NPC, 13448),
            CreateEntry(Colors.GREY, "9) " .. L["Frostwolf Stable Master"], EntityTypes.NPC, 13616),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Frostwolf Wolf Rider Commander"], EntityTypes.NPC, 13441),
            CreateEntry(Colors.GREY, "10) " .. L["Frostwolf Quartermaster"], EntityTypes.NPC, 12097),
            CreateEntry(Colors.ORANGE, "11) " .. L["West Frostwolf Tower"]),
            CreateEntry(Colors.ORANGE, "12) " .. L["East Frostwolf Tower"]),
            CreateEntry(Colors.GREY, "13) " .. L["Wing Commander Guse"] .. " (" .. L["Rescued"] .. ")", EntityTypes.NPC, 13179),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Jeztor"] .. " (" .. L["Rescued"] .. ")", EntityTypes.NPC, 13180),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Wing Commander Mulverick"] .. " (" .. L["Rescued"] .. ")", EntityTypes.NPC, 13181),
            CreateEntry(Colors.RED, "14) " .. L["Frostwolf Relief Hut"]),
            CreateEntry(Colors.GREY, "15) " .. L["Wildpaw Cavern"]),
            CreateEntry(Colors.GREY, Constants.INDENT .. L["Frostwolf Banner"], EntityTypes.OBJECT, 179025),
            CreateEntry(Colors.GREY, "16) " .. L["Steamsaw"] .. " (" .. BF["Alliance"] .. ")", EntityTypes.OBJECT, 178665),
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

    ArathiBasin = CreateDungeonTemplate({
        zoneName = BZ["Arathi Basin"],
        zoneId = 3358,
        acronym = "AB",
        location = BZ["Arathi Highlands"],
        locationId = 45,
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

    WarsongGulch = CreateDungeonTemplate({
        zoneName = BZ["Warsong Gulch"],
        zoneId = 3277,
        acronym = "WSG",
        location = BZ["Ashenvale"] .. " / " .. BZ["The Barrens"],
        levelRange = "10-60",
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
        ZoneName = { BF["Alliance"] .. " (" .. BZ["Eastern Kingdoms"] .. ")" },
        Location = { BZ["Eastern Kingdoms"] },
        CreateEntry(Colors.GREY, "1) " .. "Alah'Thalas" .. ", " .. Colors.BLUE .. BZ["Thalassian Highlands"], EntityTypes.ZONE, 33),
        CreateEntry(Colors.GREY, "2) " .. L["Light's Hope Chapel"] .. ", " .. Colors.BLUE .. BZ["Eastern Plaguelands"], EntityTypes.ZONE, 139),
        CreateEntry(Colors.GREY, "3) " .. L["Chillwind Point"] .. ", " .. Colors.BLUE .. BZ["Western Plaguelands"], EntityTypes.ZONE, 28),
        CreateEntry(Colors.GREY, "4) " .. L["Aerie Peak"] .. ", " .. Colors.BLUE .. BZ["The Hinterlands"], EntityTypes.ZONE, 47),
        CreateEntry(Colors.GREY, "5) " .. "Ravenshire" .. ", " .. Colors.BLUE .. BZ["Gilneas"], EntityTypes.ZONE, 33),
        CreateEntry(Colors.GREY, "6) " .. L["Southshore"] .. ", " .. Colors.BLUE .. BZ["Hillsbrad Foothills"], EntityTypes.ZONE, 267),
        CreateEntry(Colors.GREY, "7) " .. L["Refuge Pointe"] .. ", " .. Colors.BLUE .. BZ["Arathi Highlands"], EntityTypes.ZONE, 45),
        CreateEntry(Colors.GREY, "8) " .. L["Menethil Harbor"] .. ", " .. Colors.BLUE .. BZ["Wetlands"], EntityTypes.ZONE, 11),
        CreateEntry(Colors.GREY, "9) " .. "Dun Agrath" .. ", " .. Colors.BLUE .. BZ["Wetlands"], EntityTypes.ZONE, 1),
        CreateEntry(Colors.GREY, "10) " .. BZ["Ironforge"] .. ", " .. Colors.BLUE .. BZ["Dun Morogh"], EntityTypes.ZONE, 1),
        CreateEntry(Colors.GREY, Constants.INDENT .. "Ironforge Airfields" .. ", " .. Colors.BLUE .. BZ["Dun Morogh"], EntityTypes.ZONE, 1),
        CreateEntry(Colors.GREY, "11) " .. L["Thelsamar"] .. ", " .. Colors.BLUE .. BZ["Loch Modan"], EntityTypes.ZONE, 38),
        CreateEntry(Colors.GREY, "12) " .. L["Thorium Point"] .. ", " .. Colors.BLUE .. BZ["Searing Gorge"], EntityTypes.ZONE, 51),
        CreateEntry(Colors.GREY, "13) " .. L["Morgan's Vigil"] .. ", " .. Colors.BLUE .. BZ["Burning Steppes"], EntityTypes.ZONE, 46),
        CreateEntry(Colors.GREY, "14) " .. BZ["Stormwind City"] .. ", " .. Colors.BLUE .. BZ["Elwynn Forest"], EntityTypes.ZONE, 12),
        CreateEntry(Colors.GREY, "15) " .. L["Lakeshire"] .. ", " .. Colors.BLUE .. BZ["Redridge Mountains"], EntityTypes.ZONE, 44),
        CreateEntry(Colors.GREY, "16) " .. L["Sentinel Hill"] .. ", " .. Colors.BLUE .. BZ["Westfall"], EntityTypes.ZONE, 40),
        CreateEntry(Colors.GREY, "17) " .. L["Darkshire"] .. ", " .. Colors.BLUE .. BZ["Duskwood"], EntityTypes.ZONE, 10),
        CreateEntry(Colors.GREY, "18) " .. L["Nethergarde Keep"] .. ", " .. Colors.BLUE .. BZ["Blasted Lands"], EntityTypes.ZONE, 4),
        CreateEntry(Colors.GREY, "19) " .. BZ["Booty Bay"] .. ", " .. Colors.BLUE .. BZ["Stranglethorn Vale"], EntityTypes.ZONE, 33),
        CreateEntry(Colors.GREY, "20) " .. "Caelan's Rest" .. ", " .. Colors.BLUE .. BZ["Lapidis Isle"], EntityTypes.ZONE, 33)
    },

    FPAllianceWest = {
        ZoneName = { BF["Alliance"] .. " (" .. BZ["Kalimdor"] .. ")" },
        Location = { BZ["Kalimdor"] },
        CreateEntry(Colors.GREY, "1) " .. L["Rut'Theran Village"] .. ", " .. Colors.BLUE .. BZ["Teldrassil"], EntityTypes.ZONE, 141),
        CreateEntry(Colors.GREY, "2) " .. Colors.GREEN .. L["Nighthaven"] .. Colors.GREY .. ", " .. Colors.BLUE .. BZ["Moonglade"] .. Colors.GREEN .. " (" .. L["Druid-only"] .. ")", EntityTypes.ZONE, 493),
        CreateEntry(Colors.GREY, Constants.INDENT .. L["South of the path along Lake Elune'ara"] .. ", " .. Colors.BLUE .. BZ["Moonglade"], EntityTypes.ZONE, 493),
        CreateEntry(Colors.GREY, "3) " .. L["Everlook"] .. ", " .. Colors.BLUE .. BZ["Winterspring"], EntityTypes.ZONE, 618),
        CreateEntry(Colors.GREY, "4) " .. L["Auberdine"] .. ", " .. Colors.BLUE .. BZ["Darkshore"], EntityTypes.ZONE, 148),
        CreateEntry(Colors.GREY, "5) " .. L["Talonbranch Glade"] .. ", " .. Colors.BLUE .. BZ["Felwood"], EntityTypes.ZONE, 361),
        CreateEntry(Colors.GREY, "6) " .. "Nordanaar" .. ", " .. Colors.BLUE .. BZ["Hyjal"], EntityTypes.ZONE, 440),
        CreateEntry(Colors.GREY, "7) " .. L["Stonetalon Peak"] .. ", " .. Colors.BLUE .. BZ["Stonetalon Mountains"], EntityTypes.ZONE, 406),
        CreateEntry(Colors.GREY, "8) " .. L["Astranaar"] .. ", " .. Colors.BLUE .. BZ["Ashenvale"], EntityTypes.ZONE, 331),
        CreateEntry(Colors.GREY, "9) " .. L["Talrendis Point"] .. ", " .. Colors.BLUE .. BZ["Azshara"], EntityTypes.ZONE, 16),
        CreateEntry(Colors.GREY, "10) " .. L["Nijel's Point"] .. ", " .. Colors.BLUE .. BZ["Desolace"], EntityTypes.ZONE, 405),
        CreateEntry(Colors.GREY, "11) " .. "Bael Hardul" .. ", " .. Colors.BLUE .. BZ["Stonetalon Mountains"], EntityTypes.ZONE, 440),
        CreateEntry(Colors.GREY, "12) " .. L["Ratchet"] .. ", " .. Colors.BLUE .. BZ["The Barrens"], EntityTypes.ZONE, 17),
        CreateEntry(Colors.GREY, "13) " .. L["Theramore Isle"] .. ", " .. Colors.BLUE .. BZ["Dustwallow Marsh"], EntityTypes.ZONE, 15),
        CreateEntry(Colors.GREY, "14) " .. L["Feathermoon Stronghold"] .. ", " .. Colors.BLUE .. BZ["Feralas"], EntityTypes.ZONE, 357),
        CreateEntry(Colors.GREY, "15) " .. L["Thalanaar"] .. ", " .. Colors.BLUE .. BZ["Feralas"], EntityTypes.ZONE, 357),
        CreateEntry(Colors.GREY, "16) " .. L["Marshal's Refuge"] .. ", " .. Colors.BLUE .. BZ["Un'Goro Crater"], EntityTypes.ZONE, 490),
        CreateEntry(Colors.GREY, "17) " .. L["Cenarion Hold"] .. ", " .. Colors.BLUE .. BZ["Silithus"], EntityTypes.ZONE, 1377),
        CreateEntry(Colors.GREY, "18) " .. L["Gadgetzan"] .. ", " .. Colors.BLUE .. BZ["Tanaris"], EntityTypes.ZONE, 440),
        CreateEntry(Colors.GREY, "19) " .. "Tel Co. Basecamp" .. ", " .. Colors.BLUE .. BZ["Tel'Abim"], EntityTypes.ZONE, 440)
    },

    FPHordeEast = {
        ZoneName = { BF["Horde"] .. " (" .. BZ["Eastern Kingdoms"] .. ")" },
        Location = { BZ["Eastern Kingdoms"] },
        CreateEntry(Colors.GREY, "1) " .. L["Light's Hope Chapel"] .. ", " .. Colors.RED .. BZ["Eastern Plaguelands"], EntityTypes.ZONE, 139),
        CreateEntry(Colors.GREY, "2) " .. BZ["Undercity"] .. ", " .. Colors.RED .. BZ["Tirisfal Glades"], EntityTypes.ZONE, 85),
        CreateEntry(Colors.GREY, "3) " .. L["The Sepulcher"] .. ", " .. Colors.RED .. BZ["Silverpine Forest"], EntityTypes.ZONE, 130),
        CreateEntry(Colors.GREY, "4) " .. L["Tarren Mill"] .. ", " .. Colors.RED .. BZ["Hillsbrad Foothills"], EntityTypes.ZONE, 267),
        CreateEntry(Colors.GREY, "5) " .. L["Revantusk Village"] .. ", " .. Colors.RED .. BZ["The Hinterlands"], EntityTypes.ZONE, 47),
        CreateEntry(Colors.GREY, "6) " .. L["Hammerfall"] .. ", " .. Colors.RED .. BZ["Arathi Highlands"], EntityTypes.ZONE, 45),
        CreateEntry(Colors.GREY, "7) " .. "Stillward Church" .. ", " .. Colors.RED .. BZ["Gilneas"], EntityTypes.ZONE, 33),
        CreateEntry(Colors.GREY, "8) " .. L["Thorium Point"] .. ", " .. Colors.RED .. BZ["Searing Gorge"], EntityTypes.ZONE, 51),
        CreateEntry(Colors.GREY, "9) " .. L["Kargath"] .. ", " .. Colors.RED .. BZ["Badlands"], EntityTypes.ZONE, 3),
        CreateEntry(Colors.GREY, "10) " .. L["Flame Crest"] .. ", " .. Colors.RED .. BZ["Burning Steppes"], EntityTypes.ZONE, 46),
        CreateEntry(Colors.GREY, "11) " .. L["Stonard"] .. ", " .. Colors.RED .. BZ["Swamp of Sorrows"], EntityTypes.ZONE, 8),
        CreateEntry(Colors.GREY, "12) " .. L["Grom'Gol Base Camp"] .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"], EntityTypes.ZONE, 33),
        CreateEntry(Colors.GREY, "13) " .. L["Booty Bay"] .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"], EntityTypes.ZONE, 33),
        CreateEntry(Colors.GREY, "14) " .. "Maul'ogg Refuge" .. ", " .. Colors.RED .. BZ["Gillijim's Isle"], EntityTypes.ZONE, 33)
    },

    FPHordeWest = {
        ZoneName = { BF["Horde"] .. " (" .. BZ["Kalimdor"] .. ")" },
        Location = { BZ["Kalimdor"] },
        CreateEntry(Colors.GREY, "1) " .. Colors.GREEN .. L["Nighthaven"] .. Colors.GREY .. ", " .. Colors.RED .. BZ["Moonglade"] .. Colors.GREEN .. " (" .. L["Druid-only"] .. ")", EntityTypes.ZONE, 493),
        CreateEntry(Colors.GREY, Constants.INDENT .. L["West of the path to Timbermaw Hold"] .. ", " .. Colors.RED .. BZ["Moonglade"], EntityTypes.ZONE, 493),
        CreateEntry(Colors.GREY, "2) " .. L["Everlook"] .. ", " .. Colors.RED .. BZ["Winterspring"], EntityTypes.ZONE, 618),
        CreateEntry(Colors.GREY, "3) " .. "Nordanaar" .. ", " .. Colors.RED .. BZ["Hyjal"], EntityTypes.ZONE, 440),
        CreateEntry(Colors.GREY, "4) " .. L["Bloodvenom Post"] .. ", " .. Colors.RED .. BZ["Felwood"], EntityTypes.ZONE, 361),
        CreateEntry(Colors.GREY, "5) " .. L["Zoram'gar Outpost"] .. ", " .. Colors.RED .. BZ["Ashenvale"], EntityTypes.ZONE, 331),
        CreateEntry(Colors.GREY, "6) " .. L["Valormok"] .. ", " .. Colors.RED .. BZ["Azshara"], EntityTypes.ZONE, 16),
        CreateEntry(Colors.GREY, "7) " .. L["Splintertree Post"] .. ", " .. Colors.RED .. BZ["Ashenvale"], EntityTypes.ZONE, 331),
        CreateEntry(Colors.GREY, "8) " .. BZ["Orgrimmar"] .. ", " .. Colors.RED .. BZ["Durotar"], EntityTypes.ZONE, 14),
        CreateEntry(Colors.GREY, "9) " .. L["Sun Rock Retreat"] .. ", " .. Colors.RED .. BZ["Stonetalon Mountains"], EntityTypes.ZONE, 406),
        CreateEntry(Colors.GREY, "10) " .. L["Crossroads"] .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 17),
        CreateEntry(Colors.GREY, "11) " .. L["Ratchet"] .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 17),
        CreateEntry(Colors.GREY, "12) " .. L["Shadowprey Village"] .. ", " .. Colors.RED .. BZ["Desolace"], EntityTypes.ZONE, 405),
        CreateEntry(Colors.GREY, "13) " .. BZ["Thunder Bluff"] .. ", " .. Colors.RED .. BZ["Mulgore"], EntityTypes.ZONE, 215),
        CreateEntry(Colors.GREY, "14) " .. L["Camp Taurajo"] .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 17),
        CreateEntry(Colors.GREY, "15) " .. L["Brackenwall Village"] .. ", " .. Colors.RED .. BZ["Dustwallow Marsh"], EntityTypes.ZONE, 15),
        CreateEntry(Colors.GREY, "16) " .. "Mudsprocket" .. ", " .. Colors.RED .. BZ["Dustwallow Marsh"], EntityTypes.ZONE, 440),
        CreateEntry(Colors.GREY, "17) " .. L["Camp Mojache"] .. ", " .. Colors.RED .. BZ["Feralas"], EntityTypes.ZONE, 357),
        CreateEntry(Colors.GREY, "18) " .. L["Freewind Post"] .. ", " .. Colors.RED .. BZ["Thousand Needles"], EntityTypes.ZONE, 400),
        CreateEntry(Colors.GREY, "19) " .. L["Marshal's Refuge"] .. ", " .. Colors.RED .. BZ["Un'Goro Crater"], EntityTypes.ZONE, 490),
        CreateEntry(Colors.GREY, "20) " .. L["Cenarion Hold"] .. ", " .. Colors.RED .. BZ["Silithus"], EntityTypes.ZONE, 1377),
        CreateEntry(Colors.GREY, "21) " .. L["Gadgetzan"] .. ", " .. Colors.RED .. BZ["Tanaris"], EntityTypes.ZONE, 440),
        CreateEntry(Colors.GREY, "22) " .. "Tel Co. Basecamp" .. ", " .. Colors.RED .. BZ["Tel'Abim"], EntityTypes.ZONE, 440)
    },

    TransportRoutes = {
        ZoneName = { "Transport Routes" },
        Location = { "Azeroth" },
        CreateEntry(Colors.GREY, "1) " .. "Rut'Theran Village" .. ", " .. Colors.BLUE .. BZ["Teldrassil"], EntityTypes.ZONE, 141),
        CreateEntry(Colors.GREY, "2) " .. BZ["Auberdine"] .. ", " .. Colors.BLUE .. BZ["Darkshore"], EntityTypes.ZONE, 618),
        CreateEntry(Colors.GREY, "7) " .. "Feathermoon Stronghold" .. ", " .. Colors.BLUE .. BZ["Feralas"], EntityTypes.ZONE, 331),
        CreateEntry(Colors.GREY, "8) " .. BZ["Theramore Isle"] .. ", " .. Colors.BLUE .. BZ["Dustwallow Marsh"], EntityTypes.ZONE, 14),
        CreateEntry(Colors.GREY, "9) " .. "Alah'Thalas" .. ", " .. Colors.BLUE .. BZ["Thalassian Highlands"], EntityTypes.ZONE, 406),
        CreateEntry(Colors.GREY, "12) " .. BZ["Menethil Harbor"] .. ", " .. Colors.BLUE .. BZ["Wetlands"], EntityTypes.ZONE, 405),
        CreateEntry(Colors.GREY, "13) " .. BZ["Ironforge"] .. ", " .. Colors.BLUE .. BZ["Dun Morogh"], EntityTypes.ZONE, 215),
        CreateEntry(Colors.GREY, "15) " .. BZ["Stormwind City"] .. ", " .. Colors.BLUE .. BZ["Elwynn Forest"], EntityTypes.ZONE, 15),
        CreateEmptyEntry(),
        CreateEntry(Colors.GREY, "3) " .. BZ["Orgrimmar"] .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 440),
        CreateEntry(Colors.GREY, "4) " .. "Sparkwater Port" .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 361),
        CreateEntry(Colors.GREY, "6) " .. BZ["Thunder Bluff"] .. ", " .. Colors.RED .. BZ["Mulgore"], EntityTypes.ZONE, 16),
        CreateEntry(Colors.GREY, "10) " .. BZ["Undercity"] .. ", " .. Colors.RED .. BZ["Tirisfal Glades"], EntityTypes.ZONE, 17),
        CreateEntry(Colors.GREY, "11) " .. "Revantusk Village" .. ", " .. Colors.RED .. BZ["The Hinterlands"], EntityTypes.ZONE, 17),
        CreateEntry(Colors.GREY, "14) " .. "Kargath" .. ", " .. Colors.RED .. BZ["Badlands"], EntityTypes.ZONE, 17),
        CreateEntry(Colors.GREY, "16) " .. "Grom'Gol Base Camp" .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"], EntityTypes.ZONE, 440),
        CreateEmptyEntry(),
        CreateEntry(Colors.GREY, "5) " .. BZ["Ratchet"] .. ", " .. Colors.ORANGE .. BZ["The Barrens"], EntityTypes.ZONE, 331),
        CreateEntry(Colors.GREY, "17) " .. BZ["Booty Bay"] .. ", " .. Colors.ORANGE .. BZ["Stranglethorn Vale"], EntityTypes.ZONE, 357)
    },

    --************************************************
    -- Dungeon Location Maps
    --************************************************

    DLEast = {
        ZoneName = { L["Dungeon Locations"] .. " (" .. BZ["Eastern Kingdoms"] .. ")" },
        Location = { BZ["Eastern Kingdoms"] },
        Continent = BZ["Eastern Kingdoms"],
        CreateEntry(Colors.BLUE, "A) " .. BZ["Alterac Valley"] .. ", " .. Colors.RED .. BZ["Alterac Mountains"] .. " / " .. BZ["Hillsbrad Foothills"], EntityTypes.ZONE, 2597),
        CreateEntry(Colors.BLUE, "B) " .. BZ["Arathi Basin"] .. ", " .. Colors.RED .. BZ["Arathi Highlands"], EntityTypes.ZONE, 3358),
        CreateEntry(Colors.BLUE, "C) " .. BZ["Blood Ring"] .. " Arena" .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"], EntityTypes.ZONE, 19),
        CreateEntry(Colors.GREY, "1) " .. BZ["Scarlet Monastery"] .. ", " .. Colors.RED .. BZ["Tirisfal Glades"], EntityTypes.ZONE, 796),
        CreateEntry(Colors.GREY, "2) " .. BZ["Stratholme"] .. ", " .. Colors.RED .. BZ["Eastern Plaguelands"], EntityTypes.ZONE, 2017),
        CreateEntry(Colors.GREY, "3) " .. BZ["Naxxramas"] .. ", " .. Colors.RED .. BZ["Eastern Plaguelands"], EntityTypes.ZONE, 3456),
        CreateEntry(Colors.GREY, "4) " .. BZ["Scholomance"] .. ", " .. Colors.RED .. BZ["Western Plaguelands"], EntityTypes.ZONE, 2057),
        CreateEntry(Colors.GREY, "5) " .. BZ["Shadowfang Keep"] .. ", " .. Colors.RED .. BZ["Silverpine Forest"], EntityTypes.ZONE, 209),
        CreateEntry(Colors.GREY, "6) " .. BZ["Gilneas City"] .. ", " .. Colors.RED .. BZ["Gilneas"], EntityTypes.ZONE, 133),
        CreateEntry(Colors.GREY, "7) " .. BZ["Gnomeregan"] .. ", " .. Colors.RED .. BZ["Dun Morogh"], EntityTypes.ZONE, 133),
        CreateEntry(Colors.GREY, "8) " .. BZ["Uldaman"] .. ", " .. Colors.RED .. BZ["Badlands"], EntityTypes.ZONE, 1337),
        CreateEntry(Colors.GREY, "9) " .. BZ["Blackwing Lair"] .. ", " .. Colors.RED .. BZ["Blackrock Spire"], EntityTypes.ZONE, 2677),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Blackrock Depths"] .. ", " .. Colors.RED .. BZ["Blackrock Mountain"], EntityTypes.ZONE, 1584),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Blackrock Spire"] .. ", " .. Colors.RED .. BZ["Blackrock Mountain"], EntityTypes.ZONE, 1583),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Molten Core"] .. ", " .. Colors.RED .. BZ["Blackrock Depths"], EntityTypes.ZONE, 2717),
        CreateEntry(Colors.GREY, "10) " .. BZ["Hateforge Quarry"] .. ", " .. Colors.RED .. BZ["Burning Steppes"], EntityTypes.ZONE, 717),
        CreateEntry(Colors.GREY, "11) " .. BZ["The Stockade"] .. ", " .. Colors.RED .. BZ["Stormwind City"], EntityTypes.ZONE, 717),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Stormwind Vault"] .. ", " .. Colors.RED .. BZ["Stormwind City"], EntityTypes.ZONE, 717),
        CreateEntry(Colors.GREY, "12) " .. BZ["The Deadmines"] .. ", " .. Colors.RED .. BZ["Westfall"], EntityTypes.ZONE, 1581),
        CreateEntry(Colors.GREY, "13) " .. BZ["Karazhan Crypt"] .. ", " .. Colors.RED .. BZ["Deadwind Pass"], EntityTypes.ZONE, 1581),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Lower Karazhan Halls"] .. ", " .. Colors.RED .. BZ["Deadwind Pass"], EntityTypes.ZONE, 1581),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Tower of Karazhan"] .. ", " .. Colors.RED .. BZ["Deadwind Pass"], EntityTypes.ZONE, 1581),
        CreateEntry(Colors.GREY, "14) " .. L["Sunken Temple"] .. ", " .. Colors.RED .. BZ["Swamp of Sorrows"], EntityTypes.ZONE, 1417),
        CreateEntry(Colors.GREY, "15) " .. BZ["Zul'Gurub"] .. ", " .. Colors.RED .. BZ["Stranglethorn Vale"], EntityTypes.ZONE, 19),
        CreateEntry(Colors.BLUE, L["Blue"] .. ": " .. Colors.ORANGE .. L["Battlegrounds"]),
        CreateEntry(Colors.GREY, L["White"] .. ": " .. Colors.ORANGE .. L["Instances"])
    },

    DLWest = {
        ZoneName = { L["Dungeon Locations"] .. " (" .. BZ["Kalimdor"] .. ")" },
        Location = { BZ["Kalimdor"] },
        Continent = BZ["Kalimdor"],
        CreateEntry(Colors.BLUE, "A) " .. BZ["Warsong Gulch"] .. ", " .. Colors.RED .. BZ["The Barrens"] .. " / " .. BZ["Ashenvale"], EntityTypes.ZONE, 3277),
        CreateEntry(Colors.BLUE, "B) " .. "Sunnyglade Valley" .. ", " .. Colors.RED .. L["Caverns of Time"], EntityTypes.ZONE, 3277),
        CreateEntry(Colors.GREY, "1) " .. BZ["Emerald Sanctum"] .. ", " .. Colors.RED .. BZ["Hyjal"], EntityTypes.ZONE, 719),
        CreateEntry(Colors.GREY, "2) " .. BZ["Blackfathom Deeps"] .. ", " .. Colors.RED .. BZ["Ashenvale"], EntityTypes.ZONE, 719),
        CreateEntry(Colors.GREY, "3) " .. BZ["The Crescent Grove"] .. ", " .. Colors.RED .. BZ["Ashenvale"], EntityTypes.ZONE, 719),
        CreateEntry(Colors.GREY, "4) " .. BZ["Ragefire Chasm"] .. ", " .. Colors.RED .. BZ["Orgrimmar"], EntityTypes.ZONE, 2437),
        CreateEntry(Colors.GREY, "5) " .. BZ["Wailing Caverns"] .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 718),
        CreateEntry(Colors.GREY, "6) " .. BZ["Maraudon"] .. ", " .. Colors.RED .. BZ["Desolace"], EntityTypes.ZONE, 2100),
        CreateEntry(Colors.GREY, "7) " .. BZ["Dire Maul"] .. ", " .. Colors.RED .. BZ["Feralas"], EntityTypes.ZONE, 2557),
        CreateEntry(Colors.GREY, "8) " .. BZ["Razorfen Kraul"] .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 491),
        CreateEntry(Colors.GREY, "9) " .. BZ["Razorfen Downs"] .. ", " .. Colors.RED .. BZ["The Barrens"], EntityTypes.ZONE, 722),
        CreateEntry(Colors.GREY, "10) " .. BZ["Onyxia's Lair"] .. ", " .. Colors.RED .. BZ["Dustwallow Marsh"], EntityTypes.ZONE, 2159),
        CreateEntry(Colors.GREY, "11) " .. BZ["Zul'Farrak"] .. ", " .. Colors.RED .. BZ["Tanaris"], EntityTypes.ZONE, 978),
        CreateEntry(Colors.GREY, "12) " .. BZ["Black Morass"] .. ", " .. Colors.RED .. L["Caverns of Time"], EntityTypes.ZONE, 978),
        CreateEntry(Colors.GREY, "13) " .. BZ["Ruins of Ahn'Qiraj"] .. ", " .. Colors.RED .. BZ["Silithus"], EntityTypes.ZONE, 3429),
        CreateEntry(Colors.GREY, Constants.INDENT .. BZ["Temple of Ahn'Qiraj"] .. ", " .. Colors.RED .. BZ["Silithus"], EntityTypes.ZONE, 3428),
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

-- Utility functions for working with AtlasMaps data
AtlasUtils = {
    -- Validate dungeon data
    ValidateDungeonData = function(dungeonName, dungeonData)
        local errors = {}

        if not dungeonData.ZoneName then
            table.insert(errors, "Missing ZoneName for " .. dungeonName)
        end

        if not dungeonData.Acronym then
            table.insert(errors, "Missing Acronym for " .. dungeonName)
        end

        if not dungeonData.LevelRange then
            table.insert(errors, "Missing LevelRange for " .. dungeonName)
        end

        if not dungeonData.MinLevel then
            table.insert(errors, "Missing MinLevel for " .. dungeonName)
        end

        if not dungeonData.PlayerLimit then
            table.insert(errors, "Missing PlayerLimit for " .. dungeonName)
        end

        if not dungeonData.Continent then
            table.insert(errors, "Missing Continent for " .. dungeonName)
        end

        return errors
    end,

    -- Validate all dungeon data
    ValidateAllData = function()
        local allErrors = {}
        for name, data in pairs(AtlasMaps) do
            local errors = AtlasUtils.ValidateDungeonData(name, data)
            if table.getn(errors) > 0 then
                allErrors[name] = errors
            end
        end
        return allErrors
    end
}