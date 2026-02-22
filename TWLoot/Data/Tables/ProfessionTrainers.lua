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
        {name=LB["Ghak Healtouch"], loc=LZ["Loch Modan"].." "..LM["Thelsamar"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Miao'zan"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Tammix Razzfire"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Yox Rackgadget"], loc=LZ["Blackstone Island"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Carolai Anise"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Lilyssia Nightbreeze"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Telina Shadehand"], loc=LZ["Alah'Thalas"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Tally Berryfizz"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Alchemist Narett"], loc=LZ["Dustwallow Marsh"].." "..LZ["Theramore Isle"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Kylanna"], loc=LZ["Ashenvale"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Yelmak"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Bena Winterhoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Clavicus Knavingham"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Serge Hinott"], loc=LZ["Tarren Mill"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Jaxin Chong"], loc=LZ["Booty Bay"], faction=NEUTRAL, level=L["Journeyman"]},
        {name=LB["The Witch of Northwind"], loc=LZ["Northwind"], faction=NEUTRAL, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Ainethil"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Doctor Herbert Halsey"], loc=LZ["Undercity"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Kylanna Windwhisper"], loc=LZ["Feralas"].." "..LZ["Feathermoon Stronghold"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Rogvar"], loc=LZ["Swamp of Sorrows"].." "..LZ["Stonard"], faction=HORDE, level=L["Artisan"]},
    },

    -- ==========================================
    -- BLACKSMITHING
    -- ==========================================
    Blacksmithing = {
        -- Apprentice (1-75)
        {name=LB["Smith Argus"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Tognus Flintfire"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Delfrum Flintbeard"], loc=LZ["Darkshore"].." "..LZ["Auberdine"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Guillaume Sorouy"], loc=LZ["Silverpine Forest"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Thrag Stonehoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Dwukk"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Therum Deepforge"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Smith Martin"], loc=LZ["Northwind"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Clarise Gnarltree"], loc=LZ["Duskwood"].." "..LM["Darkshire"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Karn Stonehoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["James Van Brunt"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Traugh"], loc=LZ["The Barrens"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Bengus Deepforge"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Todd Bolder"], loc=LZ["Gilneas"]..", "..LM["Ravenshire"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Saru Steelfury"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Expert"]},
        {name=LB["Galvan the Ancient"], loc=LZ["Stranglethorn Vale"], faction=NEUTRAL, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Brikk Keencraft"], loc=LZ["Stranglethorn Vale"].." "..LZ["Booty Bay"], faction=NEUTRAL, level=L["Artisan"]},
        -- Specializations
        {name=LB["Grumnus Steelshaper"], loc=LZ["Ironforge"]..", "..L["Quest"], faction=ALLIANCE, level=LS["Armorsmith"]},
        {name=LB["Myolor Sunderfury"], loc=LZ["Ironforge"]..", "..L["Quest"], faction=ALLIANCE, level=LS["Weaponsmith"]},
        {name=LB["Ironus Coldsteel"], loc=LZ["Ironforge"]..", "..L["Quest"], faction=ALLIANCE, level=LS["Weaponsmith"]},
        {name=LB["Okothos Ironrager"], loc=LZ["Orgrimmar"]..", "..L["Quest"], faction=HORDE, level=LS["Armorsmith"]},
        {name=LB["Krathok Moltenfist"], loc=LZ["Orgrimmar"]..", "..L["Quest"], faction=HORDE, level=LS["Weaponsmith"]},
        {name=LB["Borgosh Corebender"], loc=LZ["Orgrimmar"]..", "..L["Quest"], faction=HORDE, level=LS["Weaponsmith"]},
        {name=LB["Seril Scourgebane"], loc=LZ["Winterspring"].." "..LZ["Everlook"]..", "..L["Quest"], faction=NEUTRAL, level=L["Master Swordsmith"]},
        {name=LB["Lilith the Lithe"], loc=LZ["Winterspring"].." "..LZ["Everlook"]..", "..L["Quest"], faction=NEUTRAL, level=L["Master Hammersmith"]},
        {name=LB["Kilram"], loc=LZ["Winterspring"].." "..LZ["Everlook"]..", "..L["Quest"], faction=NEUTRAL, level=L["Master Axesmith"]},
    },

    -- ==========================================
    -- ENCHANTING
    -- ==========================================
    Enchanting = {
        -- Apprentice (1-75)
        {name=LB["Alanna Raveneye"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Vance Undergloom"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Lucan Cordell"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Taladan"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Gimble Thistlefuzz"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Magister Sylvus Silkspinner"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Enchantress Magilou"], loc=LZ["Northwind"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Godan"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Lavinia Crowe"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Teg Dawnstrider"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Xylinnia Starshine"], loc=LZ["Feralas"].." "..LZ["Feathermoon Stronghold"], faction=ALLIANCE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Kitta Firewind"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Hgarth"], loc=LZ["Stonetalon Mountains"].." "..LM["Sun Rock Retreat"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Annora"], loc=LZ["Badlands"].." "..LZ["Uldaman"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- ENGINEERING
    -- ==========================================
    Engineering = {
        -- Apprentice (1-75)
        {name=LB["Bronk Guzzlegear"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Jenna Lemkenilli"], loc=LZ["Darkshore"].." "..LZ["Auberdine"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Deek Fizzlebizz"], loc=LZ["Loch Modan"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Jemma Quikswitch"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Mukdrak"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Twizwick Sprocketgrind"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Tinkerer Ozzlo"], loc=LZ["Blackstone Island"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Geherion Whitesnake"], loc=LZ["Alah'Thar"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Finbus Geargrind"], loc=LZ["Duskwood"].." "..LM["Darkshire"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Lilliam Sparkspindle"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Franklin Lloyd"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Springspindle Fizzlegear"], loc=LM["Gnomeregan Reclamation Facility"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Roxxik"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Buzzek Bracketswing"], loc=LZ["Tanaris"], faction=NEUTRAL, level=L["Artisan"]},
        -- Specializations
        {name=LB["Tinkerwiz"], loc=LZ["The Barrens"].." "..LZ["Ratchet"], faction=NEUTRAL, level=L["Gnomish Engineering"]},
        {name=LB["Springspindle Fizzlegear"], loc=LZ["Gnomeregan Reclamation Facility"], faction=ALLIANCE, level=L["Gnomish Engineering"]},
        {name=LB["Oglethorpe Obnoticus"], loc=LZ["Stranglethorn Vale"], faction=NEUTRAL, level=L["Gnomish Engineering"]},
        {name=LB["Nixx Sprocketspring"], loc=LZ["Tanaris"], faction=NEUTRAL, level=L["Goblin Engineering"]},
        {name=LB["Vazario Linkgrease"], loc=LZ["The Barrens"].." "..LZ["Ratchet"], faction=NEUTRAL, level=L["Goblin Engineering"]},
    },

    -- ==========================================
    -- LEATHERWORKING
    -- ==========================================
    Leatherworking = {
        -- Apprentice (1-75)
        {name=LB["Adele Fielder"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Nadyia Maneweaver"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Chaw Stronghide"], loc=LZ["Mulgore"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Shelene Rhobart"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        {name=LM["Waldor"], loc=LZ["Wailing Caverns"], faction=NEUTRAL, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Simon Tanner"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Fimble Finespindle"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Aayndia Floralwind"], loc=LZ["Ashenvale"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Shandlar Thethis"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Karolek"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Arthur Moore"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Narv Hidecrafter"], loc=LZ["Desolace"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Brawn"], loc=LZ["Stranglethorn Vale"].." "..LZ["Grom'Gol Base Camp"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Krulmoo Fullmoon"], loc=LZ["The Barrens"].." "..LM["Camp Taurajo"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Telonis"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Una"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Drakk Stonehand"], loc=LZ["The Hinterlands"].." "..LM["Aerie Peak"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Hahrana Ironhide"], loc=LZ["Feralas"].." "..LM["Camp Mojache"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Raz'Dag"], loc=LZ["Arathi Highlands"], faction=HORDE, level=L["Artisan"]},
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
        {name=LB["Eldrin"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Grondal Moonbreeze"], loc=LZ["Darkshore"].." "..LZ["Auberdine"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Bowen Brisboise"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Apprentice"]},
        {name=LB["Kil'hala"], loc=LZ["Durotar"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (75-150)
        {name=LB["Me'lynn"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Jormund Stonebrow"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Velessa Brightstar"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Magar"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Tepa"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Mahani"], loc=LZ["The Barrens"].." "..LM["Camp Mojache"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Grarnik Goodstitch"], loc=LZ["Stranglethorn Vale"].." "..LM["Booty Bay"], faction=NEUTRAL, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Georgio Bolero"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Josef Gregorian"], loc=LZ["Undercity"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Timothy Worthington"], loc=LZ["Dustwallow Marsh"].." "..LM["Theramore Isle"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Daryl Stack"], loc=LZ["Hillsbrad Foothills"].." "..LM["Tarren Mill"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Meilosh"], loc=LZ["Felwood"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- MINING / SMELTING
    -- ==========================================
    Mining = {
        {name=LB["Brindel Morningsun"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Apprentice"]},
        -- Artisan (1-300)
        {name=LB["Brock Stoneseeker"], loc=LZ["Loch Modan"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Kurdram Stonehammer"], loc=LZ["Darkshore"].." "..LZ["Auberdine"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Dank Drizzlecut"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Yarr Hammerstone"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Gelman Stonehand"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Geofram Bouldertoe"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Matt Johnson"], loc=LZ["Duskwood"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Brom Killian"], loc=LZ["Undercity"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Johan Focht"], loc=LZ["Silverpine Forest"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Brek Stonehoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Krunn"], loc=LZ["Durotar"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Makaru"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Pikkle"], loc=LZ["Tanaris"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- COOKING
    -- ==========================================
    Cooking = {
        -- Apprentice (1-75)
        {name=LB["Verrus Trueshine"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Apprentice"]},
        -- Journeyman (1-150)
        {name=LB["Cook Ghilm"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Crystal Boughman"], loc=LZ["Redridge Mountains"].." "..LM["Lakeshire"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Daryl Riknussun"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Gremlock Pilsnor"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Tomas"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Zarrin"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Stephen Ryback"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Alegorn"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Craig Nollward"], loc=LZ["Dustwallow Marsh"].." "..LM["Theramore Isle"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Linus Huxley"], loc=LZ["Northwind"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Chef Jenkel"], loc=LZ["Lapidis Isle"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Cook Torka"], loc=LZ["Durotar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Eunice Burch"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Aska Mistrunner"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Duhng"], loc=LZ["The Barrens"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Zamja"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Mudduk"], loc=LZ["Stranglethorn Vale"].." "..LM["Grom'gol Base Camp"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Pyall Silentstride"], loc=LZ["Mulgore"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Nina Millson"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Shazzlan"], loc=LZ["Blackstone Island"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Slagg"], loc=LZ["Arathi Highlands"].." "..LM["Hammerfall"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Derak Nightfall"], loc=LZ["Hillsbrad Foothills"].." "..LM["Tarren Mill"]..", "..L["Vendor"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Kelsey Yance"], loc=LZ["Stranglethorn Vale"].." "..LM["Booty Bay"]..", "..L["Vendor"], faction=NEUTRAL, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Shandrina"], loc=LZ["Ashenvale"]..", "..L["Book"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Wulan"], loc=LZ["Desolace"]..", "..L["Book"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Dirge Quikcleave"], loc=LZ["Tanaris"]..", "..L["Quest"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- FIRST AID
    -- ==========================================
    FirstAid = {
        -- Apprentice 1-75
        {name=LB["Aelira Dawnhand"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Apprentice"]},
        -- Journeyman (1-150)
        {name=LB["Byancie"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Thamner Pol"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Michelle Belle"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Fremal Doohickey"], loc=LZ["Wetlands"].." "..LM["Menethil Harbor"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Shaina Fuller"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Nissa Firestone"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Dannelor"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Rawrk"], loc=LZ["Durotar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Nurse Neela"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Vira Younghoof"], loc=LZ["Mulgore"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Arnok"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Pand Stonebinder"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Mary Edras"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Leyna Dayton"], loc=LZ["Silverpine Forest"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Deneb Walker"], loc=L["Arathi Highlands"]..", "..L["Book"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Balai Lok'Wein"], loc=L["Dustwallow Marsh"]..", "..L["Book"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Doctor Gustaf VanHowzen"], loc=LZ["Dustwallow Marsh"]..", "..L["Quest"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Doctor Gregory Victor"], loc=LZ["Arathi Highlands"]..", "..L["Quest"], faction=HORDE, level=L["Artisan"]},
    },

    -- ==========================================
    -- JEWELCRAFTING (TW custom)
    -- ==========================================
    Jewelcrafting = {
        -- Journeyman (1-150)
        {name=LB["Kalvan Fencer"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Kalnag"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Tacknazz Copperfire"], loc=LZ["Durotar"].." "..LM["Sparkwater Port"], faction=HORDE, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Mayva Togview"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Expert"]},
        {name=LB["Gulmire Fartower"], loc=LZ["Undercity"], faction=HORDE, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Fanzy Sparkspring"], loc=LZ["Tanaris"], faction=NEUTRAL, level=L["Artisan"]},
        -- Specializations (TW)
        {name=LB["Mayva Togview"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Goldsmithing"]},
        {name=LB["Talvash del Kissel"], loc=LZ["Ironforge"], faction=ALLIANCE, level=LS["Goldsmithing"]},
        {name=LB["Gulmire Fartower"], loc=LZ["Undercity"], faction=HORDE, level=L["Goldsmithing"]},
        {name=LB["Jarkal Mossmeld"], loc=LZ["Badlands"], faction=HORDE, level=L["Goldsmithing"]},
        {name=LB["The Artificer"], loc=LZ["Desolace"], faction=NEUTRAL, level=LS["Goldsmithing"]},
        {name=LB["Mayva Togview"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Gemology"]},
        {name=LB["Gulmire Fartower"], loc=LZ["Undercity"], faction=HORDE, level=L["Gemology"]},
        {name=LB["Thegren"], loc=LZ["Badlands"], faction=NEUTRAL, level=LS["Gemology"]},
    },

    -- ==========================================
    -- HERBALISM
    -- ==========================================
    Herbalism = {
        -- Apprentice (1-75)
        {name=LB["Delarion Featherwing"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Sasha Linelight"], loc=LZ["Blackstone Island"], faction=HORDE, level=L["Apprentice"]},
        -- Artisan (150-300)
        {name=LB["Reyna Stonebranch"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Firodren Mooncaller"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Telurinon Moonshadow"], loc=LZ["Wetlands"].." "..LM["Menethil Harbor"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Shylamiir"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Herbalist Pomeroy"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Tannysa"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Alma Jainrose"], loc=LZ["Redridge Mountains"].." "..LM["Lakeshire"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Kali Healtouch"], loc=LZ["Loch Modan"].." "..LM["Thelsamar"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Malorne Bladeleaf"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Cylania Rootstalker"], loc=LZ["Ashenvale"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Brant Jasperbloom"], loc=LZ["Dustwallow Marsh"].." "..LM["Theramore Isle"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Pinky Tosslehouse"], loc=LZ["Northwind"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Jandi"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Martha Alliestar"], loc=LZ["Undercity"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Komin Winterhoof"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Ruw"], loc=LZ["Feralas"].." "..LM["Camp Mojache"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Faruza"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Mishiki"], loc=LZ["Durotar"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Angrun"], loc=LZ["Stonetalon Mountains"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Aranae Venomblood"], loc=LZ["Hillsbrad Foothills"].." "..LM["Tarren Mill"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Flora Silverwind"], loc=LZ["Stranglethorn Vale"].." "..LM["Booty Bay"], faction=NEUTRAL, level=L["Artisan"]},
        {name=LB["Malvor"], loc=LZ["Moonglade"].." "..LM["Nighthaven"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- SKINNING
    -- ==========================================
    Skinning = {
        -- Artisan (1-300)
        {name=LB["Balthus Stoneflayer"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Maris Granger"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Wilma Ranthal"], loc=LZ["Redridge Mountains"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Eladriel"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Helene Peltskinner"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Radnaal Maneweaver"], loc=LZ["Teldrassil"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Jayla"], loc=LZ["Ashenvale"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Daemar Swiftstrike"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Artisan"]},
        {name=LB["Thuwd"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Mooranta"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Killian Hagey"], loc=LZ["Undercity"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Kulleg Stonehorn"], loc=LZ["Feralas"]..LM["Camp Mojache"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Malux"], loc=LZ["Desolace"]..LM["Shadowprey Village"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Rand Rhobart"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Dranh"], loc=LZ["The Barrens"]..LM["Camp Taurajo"], faction=HORDE, level=L["Artisan"]},
        {name=LB["Yonn Deepcut"], loc=LZ["Durotar"], faction=HORDE, level=L["Artisan"]},
    },

    -- ==========================================
    -- Fishing
    -- ==========================================
    Fishing = {
        -- Apprentice (1-75)
        {name=LB["Talvas Whitesnake"], loc=LM["Alah'Thalas"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Sindor Packfuse"], loc=LZ["Blackstone Island"], faction=HORDE, level=L["Apprentice"]},
        -- Journeyman (1-150)
        {name=LB["Arnold Leland"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Astaia"], loc=LZ["Darnassus"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Grimnur Stonebrand"], loc=LZ["Ironforge"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Harold Riggs"], loc=LZ["Wetlands"].." "..LM["Menethil Harbor"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Matthew Hooper"], loc=LZ["Redridge Mountains"].." "..LM["Lakeshire"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Lee Brown"], loc=LZ["Elwynn Forest"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Nannosh Tralhtar"], loc=LZ["Darkshore"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Paxton Ganter"], loc=LZ["Dun Morogh"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Warg Deepwater"], loc=LZ["Loch Modan"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Donald Rabonne"], loc=LZ["Hillsbrad Foothills"].." "..LM["Southshore"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Androl Oakhand"], loc=LZ["Teldrassil"].." "..LM["Rut'theran Village"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Brannock"], loc=LZ["Feralas"].." "..LM["Feathermoon Stronghold"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Tanner Fralsh"], loc=LZ["Gilneas"].." "..LM["Ravenshire"], faction=ALLIANCE, level=L["Journeyman"]},
        {name=LB["Grubgar"], loc=LZ["Durotar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Armand Cromwell"], loc=LZ["Undercity"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Uthan Stillwater"], loc=LZ["Mulgore"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Kah Mistrunner"], loc=LZ["Thunder Bluff"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Lumak"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Katoom the Angler"], loc=LZ["The Hinterlands"].." "..LM["Revantusk Village"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Clyde Kellen"], loc=LZ["Tirisfal Glades"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Killian Sanatha"], loc=LZ["Silverpine Forest"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Lau'Tiki"], loc=LZ["Durotar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Kil'Hiwana"], loc=LZ["Ashenvale"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Lui'Mala"], loc=LZ["Desolace"].." "..LM["Shadowprey Village"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Lumak"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Fisherman Shix"], loc=LZ["Durotar"], faction=HORDE, level=L["Journeyman"]},
        {name=LB["Myizz Luckycatch"], loc=LZ["Booty Bay"], faction=NEUTRAL, level=L["Journeyman"]},
        {name=LB["Rodfather"], loc=LZ["Hyjal"].." "..LM["Nordanaar"], faction=NEUTRAL, level=L["Journeyman"]},
        {name=LB["Fishface Joe"], loc=LZ["Stranglethorn Vale"], faction=NEUTRAL, level=L["Journeyman"]},
        -- Expert (150-225)
        {name=LB["Old Man Heming"], loc=LZ["Stranglethorn Vale"].." "..LM["Booty Bay"]..", "..L["Book"], faction=NEUTRAL, level=L["Expert"]},
        -- Artisan (225-300)
        {name=LB["Nat Pagle"], loc=LZ["Dustwallow Marsh"]..", "..L["Quest"], faction=NEUTRAL, level=L["Artisan"]},
    },

    -- ==========================================
    -- SURVIVAL (TW custom)
    -- ==========================================
    Survival = {
        -- Apprentice+ (Neutral NPCs at Nesingwary's Expedition)
        {name=LB["Rufus Hardwick"], loc=LZ["Stranglethorn Vale"], faction=NEUTRAL, level=L["Apprentice"]},
    },

    -- ==========================================
    -- POISONS (Rogue only)
    -- ==========================================
    Poisons = {
        -- Quest givers to unlock poisons (level 20+)
        {name=LB["Master Mathias Shaw"], loc=LZ["Stormwind City"], faction=ALLIANCE, level=L["Apprentice"]},
        {name=LB["Shenthul"], loc=LZ["Orgrimmar"], faction=HORDE, level=L["Apprentice"]},
    },
}

-- Function to generate trainer loot pages for a profession
local function GenerateTrainerPage(professionKey, icon)
    local trainers = ProfessionTrainers[professionKey]
    if not trainers then return end

    local pageName = professionKey .. "Trainers"
    AtlasTWLoot_Data[pageName] = {}

    -- Group trainers by level, then by faction
    local levels = {L["Apprentice"], L["Journeyman"], L["Expert"], L["Artisan"], LS["Goldsmithing"], LS["Gemology"], LS["Goblin Engineering"], LS["Gnomish Engineering"], LS["Armorsmith"],
        LS["Weaponsmith"], LS["Master Swordsmith"], LS["Master Hammersmith"], LS["Master Axesmith"], LS["Tribal Leatherworking"], LS["Elemental Leatherworking"], LS["Dragonscale Leatherworking"]}
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
                local nextIdx = table.getn(AtlasTWLoot_Data[pageName]) + 1
                if nextIdx == 16 or nextIdx == 46 then
                    -- Skip separator
                elseif nextIdx == 14 or nextIdx == 29 or nextIdx == 44 then
                    table.insert(AtlasTWLoot_Data[pageName], {})
                    table.insert(AtlasTWLoot_Data[pageName], {})
                else
                    table.insert(AtlasTWLoot_Data[pageName], {})
                end
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
    Fishing = "Trade_Fishing",
}

for profKey, icon in pairs(professionIcons) do
    GenerateTrainerPage(profKey, icon)
end
