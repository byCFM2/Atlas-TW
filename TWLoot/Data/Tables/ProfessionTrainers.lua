---
--- ProfessionTrainers.lua - Profession trainer location data
---
--- This module contains trainer location data for all crafting professions
--- organized by skill level (Apprentice, Journeyman, Expert, Artisan).
---
--- @compatible World of Warcraft 1.12 / Turtle WoW
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

local L = AtlasTW.Localization.UI
local LB = AtlasTW.Localization.Bosses
local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions
local LM = AtlasTW.Localization.MapData
local LS = AtlasTW.Localization.Spells

local colors = AtlasTW.Colors

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

-- Faction constants: 1=Alliance, 2=Horde, 3=Neutral
local ALLIANCE = 1
local HORDE = 2
local NEUTRAL = 3

-- Trainer data organized by profession
local ProfessionTrainers = {
    -- ==========================================
    -- ALCHEMY
    -- ==========================================
    Alchemy = {
        -- Apprentice (1-75)
        {name=LB["Alchemist Mallory"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Cyndra Kindwhisper"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Ghak Healtouch"], loc=LZ["Loch Modan"]..LM["Thelsamar"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Miao'zan"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Whuut"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Carolai Anise"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Lilyssia Nightbreeze"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Ainethil"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Tally Berryfizz"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Yelmak"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Bena Winterhoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Doctor Herbert Halsey"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Clavicus Knavingham"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Ainethil"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Doctor Herbert Halsey"], loc=LZ["Undercity"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Kylanna Windwhisper"], loc=LZ["Feralas"]..LZ["Feathermoon Stronghold"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Rogvar"], loc=LZ["Swamp of Sorrows"]..LZ["Stonard"], faction=HORDE, level=L["Artisan"]},
    },

    -- ==========================================
    -- BLACKSMITHING
    -- ==========================================
    Blacksmithing = {
        -- Apprentice (1-75)
        {name=LB["Argus Highbeacon"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Tognus Flintfire"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Thrag Stonehoof"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Dwukk"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Elreth"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Therum Deepforge"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Bengus Deepforge"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Saru Steelfury"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Karn Stonehoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["James Van Brunt"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Bengus Deepforge"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Saru Steelfury"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Brikk Keencraft"], loc=LZ["Stranglethorn Vale"]..LZ["Booty Bay"], faction=NEUTRAL, level=L["Artisan"]},
        -- Specializations
        {name=LB["Myolor Sunderfury"], loc=LZ["Ironforge"]..L["Quest"], faction=ALLIANCE, level=LS["Armorsmith"]},
        {name=LB["Grumnus Steelshaper"], loc=LZ["Ironforge"]..L["Quest"], faction=ALLIANCE, level=LS["Armorsmith"]},
        {name=LB["Krathok Moltenfist"], loc=LZ["Orgrimmar"]..L["Quest"], faction=HORDE, level=LS["Armorsmith"]},
        {name=LB["Okothos Ironrager"], loc=LZ["Orgrimmar"]..L["Quest"], faction=HORDE, level=LS["Armorsmith"]},
        {name=LB["Ironus Coldsteel"], loc=LZ["Ironforge"]..L["Quest"], faction=ALLIANCE, level=LS["Weaponsmith"]},
        {name=LB["Borgosh Corebender"], loc=LZ["Orgrimmar"]..L["Quest"], faction=HORDE, level=LS["Weaponsmith"]},
    },

    -- ==========================================
    -- ENCHANTING
    -- ==========================================
    Enchanting = {
        -- Apprentice (1-75)
        {name=LB["Thonys Pillarstone"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Alanna Raveneye"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Gimble Thistlefuzz"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Malcomb Wynn"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Jhag"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Lucan Cordell"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Taladan"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Gimble Thistlefuzz"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Godan"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Mot Dansen"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Teg Dawnstrider"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Kitta Firewind"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Hgarth"], loc=LZ["Stonetalon Mountains"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Annora"], loc=LZ["Badlands"]..LZ["Uldaman"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- ENGINEERING
    -- ==========================================
    Engineering = {
        -- Apprentice (1-75)
        {name=LB["Darian Singh"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Bronk Guzzlegear"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Thund"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Mukdrak"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Lilliam Sparkspindle"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Springspindle Fizzlegear"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Roxxik"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Graham Van Talen"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Springspindle Fizzlegear"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Roxxik"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Buzzek Bracketswing"], loc=LZ["Tanaris"], faction=NEUTRAL, level=L["Artisan"]},
        -- Specializations
        {name=LB["Oglethorpe Obnoticus"], loc=LZ["Stranglethorn Vale"], faction=NEUTRAL, level=L["Gnomish Engineering"]},
        {name=LB["Tinkmaster Overspark"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Gnomish Engineering"]},
        {name=LB["Nixx Sprocketspring"], loc=LZ["Tanaris"], faction=NEUTRAL, level=L["Goblin Engineering"]},
        {name=LB["Vazario Linkgrease"], loc=LZ["The Barrens"], faction=NEUTRAL, level=L["Goblin Engineering"]},
    },

    -- ==========================================
    -- LEATHERWORKING
    -- ==========================================
    Leatherworking = {
        -- Apprentice (1-75)
        {name=LB["Adele Fielder"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Nadyia Maneweaver"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Chaw Stronghide"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Veren Tallstrider"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Shelene Rhobart"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Simon Tanner"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Fimble Finespindle"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Aayndia Floralwind"], loc=LZ["Ashenvale"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Karolek"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Brawn"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Una"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Telonis"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Una"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Drakk Stonehand"], loc=LZ["The Hinterlands"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Hahrana Ironhide"], loc=LZ["Feralas"], faction=HORDE, level=L["Artisan"]},
        -- Specializations
        {name=LB["Peter Galen"], loc=LZ["Azshara"], faction=ALLIANCE, level=LS["Dragonscale Leatherworking"]},
        {name=LB["Thorkaf Dragoneye"], loc=LZ["Badlands"], faction=HORDE, level=LS["Dragonscale Leatherworking"]},
        {name=LB["Caryssia Moonhunter"], loc=LZ["Feralas"], faction=ALLIANCE, level=LS["Tribal Leatherworking"]},
        {name=LB["Se'Jib"], loc=LZ["Stranglethorn Vale"], faction=HORDE, level=LS["Tribal Leatherworking"]},
        {name=LB["Sarah Tanner"], loc=LZ["Searing Gorge"], faction=ALLIANCE, level=LS["Elemental Leatherworking"]},
        {name=LB["Brumn Winterhoof"], loc=LZ["Arathi Highlands"], faction=HORDE, level=LS["Elemental Leatherworking"]},
    },

    -- ==========================================
    -- TAILORING
    -- ==========================================
    Tailoring = {
        -- Apprentice (1-75)
        {name=LB["Eldrin"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Georgio Bolero"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Me'lynn"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Snang"], loc=LZ["Durotar"].." (Razor Hill)", faction=HORDE, level=L["Apprentice"]},
        {name=LB["Kil'hala"], loc=LZ["Mulgore"].." (Bloodhoof Village)", faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Georgio Bolero"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Me'lynn"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Jormund Stonebrow"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Magar"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Tepa"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Josef Gregorian"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Georgio Bolero"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Josef Gregorian"], loc=LZ["Undercity"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Timothy Worthington"], loc=LZ["Dustwallow Marsh"].." "..LM["Theramore Isle"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Daryl Stack"], loc=LZ["Hillsbrad Foothills"].." "..LM["Tarren Mill"], faction=HORDE, level=L["Artisan"]},
    },

    -- ==========================================
    -- MINING / SMELTING
    -- ==========================================
    Mining = { --TODO CHECK
        -- Apprentice (1-75)
        {name=LB["Gelman Stonehand"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Dank Drizzlecut"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Kurdrum Barleybeard"], loc=LZ["Darkshore"]..LZ["Auberdine"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Krunn"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Brek Stonehoof"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Brom Killian"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Gelman Stonehand"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Geofram Bouldertoe"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Makaru"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Brek Stonehoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Brom Killian"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Geofram Bouldertoe"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Makaru"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Pikkle"], loc=LZ["Tanaris"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- COOKING
    -- ==========================================
    Cooking = {
        -- Apprentice (1-75)
        {name=LB["Tomas"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Alegorn"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Pyall Silentstride"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Zamja"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Eunice Burch"], loc=LZ["Undercity"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Stephen Ryback"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Daryl Riknussun"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Alegorn"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Zamja"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Pyall Silentstride"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Eunice Burch"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=L["Book"], loc=L["Ashenvale"], faction=ALLIANCE, level=L["Expert"]},
        {name=L["Book"], loc=L["Desolace"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Dirge Quikcleave"], loc=LZ["Tanaris"].." "..L["Quest"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- FIRST AID
    -- ==========================================
    FirstAid = {
        -- Apprentice (1-75)
        {name=LB["Michelle Belle"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Byancie"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Nissa Firestone"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Rawrk"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Pand Stonebinder"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Mary Edras"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Shaina Fuller"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Nissa Firestone"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Byancie"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Arnok"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Pand Stonebinder"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Mary Edras"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=L["Book"], loc=L["Arathi Highlands"], faction=ALLIANCE, level=L["Expert"]},
        {name=L["Book"], loc=L["Dustwallow Marsh"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Doctor Gustaf VanHowzen"], loc=LZ["Dustwallow Marsh"].." "..L["Quest"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Doctor Gregory Victor"], loc=LZ["Arathi Highlands"].." "..L["Quest"], faction=HORDE, level=L["Artisan"]},
    },

    -- ==========================================
    -- JEWELCRAFTING (TW custom)
    -- ==========================================
    Jewelcrafting = {
        -- Apprentice (1-75)
        {name=LB["Theresa Burnside"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Hama"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Aleinia"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Lugrah"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Narunn"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Jandia Moonsong"], loc=LZ["Undercity"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Theresa Burnside"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Hama"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Aleinia"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Lugrah"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Narunn"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Jandia Moonsong"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Hama"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Aleinia"], loc="Alah'Thalas", faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Lugrah"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Expert"]},
        {name=LB["Jandia Moonsong"], loc="Sparkwater Port", faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Mayva Togview"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Gulmire Fartower"], loc=LZ["Undercity"], faction=HORDE, level=L["Artisan"]},
        -- Specializations (TW)
        {name=LB["Talvash del Kissel"], loc=LZ["Ironforge"], faction=NEUTRAL, level=LS["Goldsmithing"]},
        {name=LB["Thegren"], loc=LZ["Badlands"], faction=NEUTRAL, level=LS["Gemology"]},
    },

    -- ==========================================
    -- HERBALISM
    -- ==========================================
    Herbalism = {
        -- Apprentice (1-75)
        {name=LB["Shylamiir"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Herbalist Pomeroy"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Reyna Stonebranch"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Jandi"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Kotelash"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Martha Alliestar"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Tannysa"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Reyna Stonebranch"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Malorne Bladeleaf"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Angrun"], loc=LZ["Stonetalon Mountains"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Kotelash"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Martha Alliestar"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Firodren Mooncaller"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Angrun"], loc=LZ["Stonetalon Mountains"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Malvor"], loc=LZ["Feralas"]..LM["Feathermoon Stronghold"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Ruw"], loc=LZ["Feralas"]..LM["Camp Mojache"], faction=HORDE, level=L["Artisan"]},
    },

    -- ==========================================
    -- SKINNING
    -- ==========================================
    Skinning = {
        -- Apprentice (1-75)
        {name=LB["Helene Peltskinner"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Radnaal Maneweaver"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Balthus Stoneflayer"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Yonn Deepcut"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Mooranta"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Rand Rhobart"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Maris Granger"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Balthus Stoneflayer"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Eladriel"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Killian Hagey"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Thuwd"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Mooranta"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Balthus Stoneflayer"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Thuwd"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Kulleg Stonehorn"], loc=LZ["Feralas"]..LM["Camp Mojache"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Jayn Tailwind"], loc=LZ["Feralas"]..LM["Feathermoon Stronghold"], faction=ALLIANCE, level=L["Artisan"]},
    },

    -- ==========================================
    -- SURVIVAL (TW custom)
    -- ==========================================
    Survival = {
        -- Apprentice+ (Neutral NPCs at Nesingwary's Expedition)
        {name=LB["S. J. Erlgadin"], loc=LZ["Stranglethorn Vale"], faction=NEUTRAL, level=L["Apprentice"]},
        {name=LB["Rufus Hardwick"], loc=LZ["Stranglethorn Vale"], faction=NEUTRAL, level=L["Apprentice"]},
    },

    -- ==========================================
    -- POISONS (Rogue only)
    -- ==========================================
    Poisons = {
        -- Quest givers to unlock poisons (level 20+)
        {name=LB["Mathias Shaw"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Shenthul"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Apprentice"]},
    },
}

-- Function to generate trainer loot pages for a profession
local function GenerateTrainerPage(professionKey, professionName, icon)
    local trainers = ProfessionTrainers[professionKey]
    if not trainers then return end

    local pageName = professionKey .. "Trainers"
    AtlasTWLoot_Data[pageName] = {}

    -- Group trainers by level, then by faction
    local levels = {L["Apprentice"], L["Journeyman"], L["Expert"], L["Artisan"], LS["Goldsmithing"], LS["Gemology"], LS["Goblin Engineering"], LS["Gnomish Engineering"], LS["Armorsmith"],
        LS["Weaponsmith"], LS["Tribal Leatherworking"], LS["Elemental Leatherworking"], LS["Dragonscale Leatherworking"]}
    local levelMap = {}
    for _, t in ipairs(trainers) do
        if not levelMap[t.level] then levelMap[t.level] = {} end
        table.insert(levelMap[t.level], t)
    end

    local isFirst = true
    for _, level in ipairs(levels) do
        local group = levelMap[level]
        if group and table.getn(group) > 0 then
            -- Add empty separator before header (except first)
            if not isFirst then
                table.insert(AtlasTWLoot_Data[pageName], {})
            end
            isFirst = false

            -- Level header
            table.insert(AtlasTWLoot_Data[pageName], {
                name = level,
                icon = icon or "INV_Misc_Book_09",
                quality = 5 -- Epic for header
            })

            -- Sort by faction (Alliance first, then Horde, then Neutral)
            local sortedGroup = {}
            for _, t in ipairs(group) do table.insert(sortedGroup, t) end
            table.sort(sortedGroup, function(a, b)
                return a.faction < b.faction
            end)

            for _, t in ipairs(sortedGroup) do
                local factionColor = colors.WHITE
                if t.faction == ALLIANCE then
                    factionColor = colors.BLUE
                elseif t.faction == HORDE then
                    factionColor = colors.RED
                else
                    factionColor = colors.YELLOW
                end

                table.insert(AtlasTWLoot_Data[pageName], {
                    name = factionColor .. (t.name or L["Unknown"]) .. "|r",
                    icon = icon or "INV_Misc_Book_09",
                    extra = t.loc or ""
                })
            end
        end
    end
end

-- Generate all trainer pages
local professionIcons = {
    Alchemy = "Trade_Alchemy",
    Blacksmithing = "Trade_BlackSmithing",
    Enchanting = "Trade_Engraving",
    Engineering = "Trade_Engineering",
    Leatherworking = "INV_Misc_ArmorKit_17",
    Tailoring = "Trade_Tailoring",
    Mining = "Trade_Mining",
    Cooking = "INV_Misc_Food_15",
    FirstAid = "Spell_Holy_SealOfSacrifice",
    Jewelcrafting = "INV_Jewelry_Necklace_11",
    Herbalism = "Trade_Herbalism",
    Skinning = "INV_Misc_Pelt_Wolf_01",
    Survival = "Trade_Survival",
    Poisons = "Trade_BrewPoison",
}

for profKey, icon in pairs(professionIcons) do
    GenerateTrainerPage(profKey, profKey, icon)
end
