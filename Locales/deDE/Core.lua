---
--- Core.lua - German UI Localization
---
--- Core UI strings, bindings, and general interface text
---
--- @compatible World of Warcraft 1.12
---

if GetLocale() ~= "deDE" then return end

-- Zone name substitutions (for display purposes)
AtlasTWSortIgnore = { "the (.+)", "der (.+)", "die (.+)", "das (.+)" }

AtlasTWZoneSubstitutions = {
    ["Der Tempel von Atal'Hakkar"] = "Versunkener Tempel"
}

---
--- Key binding definitions for Atlas-TW addon
---
BINDING_HEADER_ATLASTW_TITLE = "Atlas-TW Tastenbelegung"
BINDING_NAME_ATLASTW_TOGGLE = "Atlas-TW umschalten"
BINDING_NAME_ATLASTW_OPTIONS = "Optionen umschalten"
BINDING_HEADER_ATLASTWLOOT_TITLE = "AtlasTW Beute Tastenbelegung"
BINDING_NAME_ATLASTWLOOT_QL1 = "Schnellansicht 1"
BINDING_NAME_ATLASTWLOOT_QL2 = "Schnellansicht 2"
BINDING_NAME_ATLASTWLOOT_QL3 = "Schnellansicht 3"
BINDING_NAME_ATLASTWLOOT_QL4 = "Schnellansicht 4"
BINDING_NAME_ATLASTWLOOT_QL5 = "Schnellansicht 5"
BINDING_NAME_ATLASTWLOOT_QL6 = "Schnellansicht 6"
BINDING_NAME_ATLASTWLOOT_WISHLIST = "Wunschliste"

AtlasTW = AtlasTW or {}

--Default map to auto-select to when no SubZone data is available
AtlasTW.AssocDefaults = {
    ["Düsterbruch"] =					"DireMaulNorth",
    ["Schwarzfelsspitze"] =			"BlackrockSpireLower",
    ["Das Scharlachrote Kloster"] =			"ScarletMonasteryEnt"
}
--Links maps together that are part of the same instance
AtlasTW.SubZoneAssoc = {
    ["DireMaulNorth"] =				"Düsterbruch",
    ["DireMaulEast"] =				"Düsterbruch",
    ["DireMaulWest"] =				"Düsterbruch",
    ["DireMaulEnt"] =				"Düsterbruch",
    ["BlackrockSpireLower"] =		"Schwarzfelsspitze",
    ["BlackrockSpireUpper"] =		"Schwarzfelsspitze",
    ["BlackrockMountainEnt"] =		"Schwarzfelsspitze",
    ["ScarletMonasteryGraveyard"] =	"Das Scharlachrote Kloster",
    ["ScarletMonasteryLibrary"] =	"Das Scharlachrote Kloster",
    ["ScarletMonasteryArmory"] =	"Das Scharlachrote Kloster",
    ["ScarletMonasteryCathedral"] =	"Das Scharlachrote Kloster",
    ["ScarletMonasteryEnt"] =		"Das Scharlachrote Kloster"
}
--Links SubZone values with specific instance maps
AtlasTW.SubZoneData = {
    ["Halls of Destruction"] =		"DireMaulNorth",
    ["Gordok's Seat"] =				"DireMaulNorth",
    ["Wucherborkenviertel"] =			"DireMaulEast",
    ["Die versteckte Landzunge"] =			"DireMaulEast",
    ["Das Konservatorium"] =			"DireMaulEast",
    ["The Shrine of Eldretharr"] =	"DireMaulEast",
    ["Capital Gardens"] =			"DireMaulWest",
    ["Court of the Highborne"] =	"DireMaulWest",
    ["Prison of Immol'thar"] =		"DireMaulWest",
    ["Das Athenaeum"] =				"DireMaulWest",
    ["Mok'Doom"] =					"BlackrockSpireLower",
    ["Tazz'Alaor"] =				"BlackrockSpireLower",
    ["Skitterweb Tunnels"] =		"BlackrockSpireLower",
    ["Das Lagerhaus"] =			"BlackrockSpireLower",
    ["Chamber of Battle"] =			"BlackrockSpireLower",
    ["Dragonspire Hall"] =			"BlackrockSpireUpper",
    ["Hall of Binding"] =			"BlackrockSpireUpper",
    ["Der Krähenhorst"] =				"BlackrockSpireUpper",
    ["Hall of Blackhand"] =			"BlackrockSpireUpper",
    ["Blackrock Stadium"] =			"BlackrockSpireUpper",
    ["Der Schmelzofen"] =				"BlackrockSpireUpper",
    ["Hordemar City"] =				"BlackrockSpireUpper",
    ["Spire Throne"] =				"BlackrockSpireUpper",
    ["Chamber of Atonement"] =		"ScarletMonasteryGraveyard",
    ["Forlorn Cloister"] =			"ScarletMonasteryGraveyard",
    ["Honor's Tomb"] =				"ScarletMonasteryGraveyard",
    ["Huntsman's Cloister"] =		"ScarletMonasteryLibrary",
    ["Gallery of Treasures"] =		"ScarletMonasteryLibrary",
    ["Athenaeum"] =					"ScarletMonasteryLibrary",
    ["Ausbildungsgelände"] =			"ScarletMonasteryArmory",
    ["Footman's Armory"] =			"ScarletMonasteryArmory",
    ["Crusader's Armory"] =			"ScarletMonasteryArmory",
    ["Hall of Champions"] =			"ScarletMonasteryArmory",
    ["Chapel Gardens"] =			"ScarletMonasteryCathedral",
    ["Crusader's Chapel"] =			"ScarletMonasteryCathedral",
    ["Das große Vestibül"] =		"ScarletMonasteryEnt"
}
--Maps to auto-select to from outdoor zones.
AtlasTW.OutdoorZoneToAtlas = {
    ["Eschental"] =					"BlackfathomDeepsEnt",
    ["Ödland"] =					"UldamanEnt",
    ["Der Schwarzfels"] =		"BlackrockMountainEnt",
    ["Brennende Steppe"] = 			"HateforgeQuarry", -- TurtleWOW
    ["Gebirgspass der Totenwinde"] = 			"KarazhanCrypt",    -- TurtleWOW
    ["Desolace"] =					"MaraudonEnt",
    ["Dun Morogh"] =				"GnomereganEnt",
    ["Feralas"] =					"DireMaulEnt",
    ["Sengende Schlucht"] =				"BlackrockMountainEnt",
    ["Sümpfe des Elends"] =			"TheSunkenTempleEnt",
    ["Tanaris"] =					"ZulFarrak",
    ["Brachland"] =				"WailingCavernsEnt",
    ["Gilneas"] =					"GilneasCity", -- TurtleWOW
    ["Tirisfal"]	=			"ScarletMonasteryEnt",
    ["Westfall"] =					"TheDeadminesEnt",
    ["Orgrimmar"] =					"RagefireChasm",
    ["Düstermarschen"] =			"OnyxiasLair",
    ["Silithus"] =					"TheTempleofAhnQiraj",
    ["Westliche Pestländer"] =		"Scholomance",
    ["Silberwald"] =			"ShadowfangKeep",
    ["Östliche Pestländer"] =		"Stratholme",
    ["Sturmwind"] =			        "TheStockade",
    ["Schlingendorntal"] =		    "ZulGurub",
    ["Balor"] =                     "StormwroughtRuins", -- TurtleWOW
    ["Sumpfland"] =                 "DragonmawRetreat" -- TurtleWOW
}

---
--- Register Core UI translations
---
AtlasTW.Localization:RegisterNamespace("UI", "deDE", {
    --************************************************
    -- Common UI Strings
    --************************************************
    ["Options"] = "Optionen",
    ["Search"] = "Suchen",
    ["Clear"] = "Leeren",
    ["Done"] = "Fertig",
    ["Yes"] = "Ja",
    ["No"] = "Nein",
    ["All"] = "Alle",
    ["Type"] = "Typ",
    ["Level"] = "Stufe",
    ["Player Limit"] = "Spielerlimit",
    ["Damage"] = "Schaden",
    ["Location"] = "Ort",
    ["Continent"] = "Kontinent",
    ["Instance"] = "Instanz",
    ["Quest"] = "Quest",
    ["Quests"] = "Quests",
    ["Loot"] = "Beute",
    ["Previous"] = "Zurück",
    ["Next"] = "Weiter",

    --************************************************
    -- Colors
    --************************************************
    ["Purple"] = "Violett",
    ["Red"] = "Rot",
    ["Orange"] = "Orange",
    ["White"] = "Weiß",

    --************************************************
    -- Mob Types
    --************************************************
    ["Boss"] = "Boss",
    ["Rare"] = "Selten",
    ["Mini Bosses"] = "Mini-Bosse",
    ["Trash Mobs"] = "Trash-Gegner",
    ["Bat"] = "Fledermaus",
    ["Snake"] = "Natter",
    ["Raptor"] = "Raptor",
    ["Spider"] = "Spinne",
    ["Tiger"] = "Tiger",
    ["Panther"] = "Panther",
    ["Pet"] = "Begleiter",
    ["Rare Mobs"] = "Seltene Gegner",

    --************************************************
    -- Damage Types
    --************************************************
    ["Fire"] = "Feuer",
    ["Nature"] = "Natur",
    ["Frost"] = "Frost",
    ["Shadow"] = "Schatten",
    ["Arcane"] = "Arkan",
    ["Physical"] = "Physisch",

    --************************************************
    -- Directions
    --************************************************
    ["East"] = "Ost",
    ["North"] = "Nord",
    ["South"] = "Süd",
    ["West"] = "West",
    ["Lower"] = "Unterer",
    ["Upper"] = "Oberer",
    ["Front"] = "Vorne",
    ["Back"] = "Zurück",
    ["Side"] = "Seite",
    ["Outside"] = "Außen",

    --************************************************
    -- Instance Types
    --************************************************
    ["Dungeons"] = "Dungeons",
    ["Raids"] = "Schlachtzüge",
    ["RAID"] = "Schlachtzug",
    ["Battlegrounds"] = "Schlachtfelder",
    ["Entrances"] = "Eingänge",
    ["Transport Routes"] = "Transportwege",

    --************************************************
    -- Level Ranges
    --************************************************
    ["Instances level 15-29"] = "Instanzen Stufe 15–29",
    ["Instances level 30-39"] = "Instanzen Stufe 30–39",
    ["Instances level 40-49"] = "Instanzen Stufe 40–49",
    ["Instances level 50-59"] = "Instanzen Stufe 50–59",
    ["Instances 60 level"] = "Instanzen Stufe 60",

    --************************************************
    -- Party Size
    --************************************************
    ["Party Size"] = "Gruppengröße",
    ["Instances for 5 Players"] = "Instanzen für 5 Spieler",
    ["Instances for 10 Players"] = "Instanzen für 10 Spieler",
    ["Instances for 20 Players"] = "Instanzen für 20 Spieler",
    ["Instances for 40 Players"] = "Instanzen für 40 Spieler",

    --************************************************
    -- Continents
    --************************************************
    ["Kalimdor Instances"] = "Instanzen in Kalimdor",
    ["Eastern Kingdoms Instances"] = "Instanzen in den Östlichen Königreichen",

    --************************************************
    -- Settings
    --************************************************
    ["Select Category"] = "Kategorie auswählen",
    ["Select Map"] = "Karte auswählen",
    ["Select Loot Table"] = "Beutetabelle",
    ["Show the Quest Panel with AtlasTW"] = "Questfenster mit AtlasTW anzeigen",
    ["Show Quest Panel on the Left"] = "Questfenster links anzeigen",
    ["Show Quest Panel on the Right"] = "Questfenster rechts anzeigen",
    ["Color Quests by Level"] = "Quests nach Stufe einfärben",
    ["Color Quests from the Questlog"] = "Quests aus dem Questlog einfärben",
    ["Auto-Query Unknown Items"] = "Unbekannte Gegenstände automatisch abfragen",
    ["Suppress Server Query Spam"] = "Serveranfrage-Spam unterdrücken",
    ["Show Loot Panel with AtlasTW"] = "Beutefenster mit AtlasTW anzeigen",
    ["Sort Instance by:"] = "Instanzen sortieren nach:",
    ["Show Button on Minimap"] = "Schaltfläche auf der Minikarte anzeigen",
    ["Auto-Select Instance Map"] = "Instanzkarte automatisch auswählen",
    ["Transparency"] = "Transparenz",
    ["Right-Click for World Map"] = "Rechtsklick für Weltkarte",
    ["Show Acronyms"] = "Akronyme anzeigen",
    ["Clamp window to screen"] = "Fenster an Bildschirm begrenzen",
    ["Show Cursor Coordinates on Map"] = "Mauskoordinaten auf der Karte anzeigen",
    ["Scale"] = "Skalierung",

    --************************************************
    -- Quest Related
    --************************************************
    ["Quest finished:"] = "Quest abgeschlossen:",
    ["No Quests"] = "Keine Quests",
    ["No Rewards"] = "Keine Belohnungen",
    ["Quest Item"] = "Questgegenstand",
    ["Quest Reward"] = "Questbelohnung",
    ["This Item Begins a Quest"] = "Dieser Gegenstand startet eine Quest",
    ["Attain: "] = "Erhalten: ",
    ["Level: "] = "Stufe: ",
    ["Requires"] = "Erfordert",
    ["Tools: "] = "Werkzeuge: ",
    ["Reagents: "] = "Reagenzien: ",
    ["Starts at: \n"] = "Beginnt bei: \n",
    ["Objective: \n"] = "Ziel: \n",
    ["Note: \n"] = "Hinweis: \n",
    ["Prequest: "] = "Vorquest: ",
    ["Quest follows: "] = "Folgequest: ",
    ["Story"] = "Geschichte",
    ["Need quest"] = "Quest erforderlich",

    --************************************************
    -- Search & Results
    --************************************************
    ["Search Unavailable"] = "Suche nicht verfügbar",
    ["Not Available"] = "Nicht verfügbar",
    ["Search Result: %s"] = "Suchergebnis: %s",
    ["Search Result"] = "Suchergebnis",
    ["Last Result"] = "Letz. Ergebnis",
    ["Search options"] = "Suchoptionen",
    ["Partial matching"] = "Teilweise Übereinstimmung",
    ["If checked, AtlasTWLoot searches item names for a partial match."] =
    "Wenn aktiviert, durchsucht AtlasTWLoot Gegenstandsnamen nach teilweiser Übereinstimmung.",
    ["No match found for"] = "Keine Übereinstimmung gefunden für",

    --************************************************
    -- Items & Loot
    --************************************************
    ["This item is not safe!"] = "Dieser Gegenstand ist nicht sicher!",
    ["Item not found in cache"] = "Gegenstand nicht im Cache gefunden",
    ["The content patch isn't out yet"] = "Der Content-Patch ist noch nicht draußen",
    ["Old version of SuperWoW detected..."] = "Alte Version von SuperWoW erkannt...",
    ["Slot Bag"] = "Platz Behälter",
    ["Various Locations"] = "Verschiedene Orte",
    ["Vendor"] = "Händler",
    ["Pickpocketed"] = "Gestohlen",
    ["Random stats"] = "Zufällige Werte",
    ["<Random enchantment>"] = "<Zufällige Verzauberung>",
    ["Shared"] = "Geteilt",
    ["Unique"] = "Einzigartig",
    ["Charges"] = "Aufladungen",

    --************************************************
    -- AtlasTW Loot
    --************************************************
    ["Loot Panel"] = "Beutefenster",
    ["WishList"] = "Wunschliste",
    ["ALT+Click to clear"] = "ALT+Klick zum Löschen",
    ["QuickLook"] = "Ansicht",
    ["Add to QuickLooks"] = "Zu Schnellansichten hinzufügen",
    ["Assign this loot table to QuickLook"] = "Diese Beutetabelle Schnellansicht zuweisen",
    ["ALT+Click on item to add or remove it from WishList"] =
    "ALT+Klick auf Gegenstand, um ihn zur Wunschliste hinzuzufügen oder zu entfernen",
    [" added to the WishList."] = "zur Wunschliste hinzugefügt.",
    [" already in the WishList!"] = "bereits in der Wunschliste!",
    [" deleted from the WishList."] = "aus der Wunschliste gelöscht.",
    [" not found in the WishList."] = "nicht in der Wunschliste gefunden.",

    --************************************************
    -- Settings & Configuration
    --************************************************
    ["Button Position"] = "Schaltflächenposition",
    ["Button Radius"] = "Schaltflächenradius",
    ["Reset Position"] = "Pos. zurücksetzen",
    ["has been reset!"] = "wurde zurückgesetzt!",
    ["Reset Settings"] = "Einst. zurücksetzen",
    ["Default settings applied!"] = "Standardeinstellungen übernommen!",
    ["Safe Chat Links |cff1eff00(recommended)|r"] = "Sichere Chatlinks |cff1eff00(empfohlen)|r",
    ["Enable all Chat Links"] = "Alle Chatlinks aktivieren",
    ["Default Tooltips"] = "Standard-Tooltips",
    ["Lootlink Tooltips"] = "Lootlink-Tooltips",
    ["ItemSync Tooltips"] = "ItemSync-Tooltips",
    ["Use EquipCompare"] = "EquipCompare verwenden",
    ["Make Loot Table Opaque"] = "Beutetabelle undurchsichtig machen",
    ["Show IDs at all times"] = "IDs immer anzeigen",
    ["Suppress Text Spam"] = "Textspam unterdrücken",
    ["Show Source on Tooltips"] = "Quelle in Tooltips anzeigen",
    ["Welcome to Atlas-TW Edition. Please take a moment to set your preferences."] =
    "Willkommen bei Atlas-TW Edition. Bitte nehmen Sie sich einen Moment, um Ihre Einstellungen zu vergeben.",

    --************************************************
    -- Version & Updates
    --************************************************
    ["Update available"] = "Aktualisierung verfügbar",
    ["Version: %s"] = "Version: %s",
    ["Version check sent to %s"] = "Versionsprüfung an %s gesendet",
    ["NewVersionAvailableFmt"] = "|cffff0000Neue Version verfügbar!|r |cff00ff00Hier herunterladen:|r %s",
    [" |cffA52A2Aloaded."] = " |cffA52A2Ageladen.",
    ["NoticeText"] = "Wenn Sie etwas vermissen, melden Sie es bitte unter:|r",

    --************************************************
    -- Categories & Menus
    --************************************************
    ["Collections"] = "Sammlungen",
    ["Factions"] = "Fraktionen",
    ["World Events"] = "Weltereignisse",
    ["Crafting"] = "Herstellung",
    ["Misc"] = "Verschiedenes",
    ["Dungeons & Raids"] = "DG & Schlachtzüge",
    ["Weapon Skills"] = "Waffenfähigkeiten",
    ["Trainers"] = "Lehrer",
    ["Sets"] = "Mengen",

    --************************************************
    -- Minimap Tooltip
    --************************************************
    ["Left-click to open Atlas-TW.\nMiddle-click for Atlas-TW options.\nRight-click and drag to move this button."] =
    "Linksklick, um Atlas-TW zu öffnen.\nMittelklick für Atlas-TW-Optionen.\nRechtsklick und ziehen, um diesen Button zu verschieben.",

    --************************************************
    -- Instance Locations
    --************************************************
    ["Instances"] = "Instanzen",

    --************************************************
    -- Common Terms
    --************************************************
    ["Entrance"] = "Eingang",
    ["Exit"] = "Ausgang",
    ["Portal"] = "Portal",
    ["Teleport"] = "Teleport",
    ["Key"] = "Schlüssel",
    ["Ghost"] = "Geistererscheinung",
    ["Meeting Stone"] = "Versammlungsstein",
    ["Summon"] = "Beschwören",
    ["Random"] = "Zufällig",
    ["Optional"] = "Optional",
    ["Reputation"] = "Ruf",
    ["Rescued"] = "Gerettet",
    ["Unknown"] = "Unbekannt",
    ["Varies"] = "Variiert",
    ["Wanders"] = "Wandert",
    ["Connection"] = "Verbindung",
    ["Connections"] = "Verbindungen",
    ["Elevator"] = "Aufzug",
    ["Attunement Required"] = "Einstimmung erforderlich",
    ["Chase Begins"] = "Verfolgung beginnt",
    ["Chase Ends"] = "Verfolgung endet",
    ["Open Portal"] = "Portal öffnen",
    ["Moonwell"] = "Mondbrunnen",
    ["through "] = "durch ",
    ["Severs"] = "Durchtrennt",

    --************************************************
    -- Crafting & Item Info
    --************************************************
    ["To cast "] = "Zum Wirken ",
    [" the following items are needed:"] = "werden die folgenden Gegenstände benötigt:",
    [" you need this: "] = "du brauchst Folgendes: ",
    ["To craft "] = "Zum Herstellen ",
    [" the following reagents are needed:"] = "werden die folgenden Reagenzien benötigt:",
    ["Setup"] = "Reinlegen",
    ["Drop Rate:"] = "Drop-Rate:",
    ["ItemID:"] = "Gegenstands-ID:",
    ["SpellID:"] = "Zauber-ID:",
    ["Gemology Plans"] = "Edelsteinkunde Pläne",
    ["Goldsmithing Plans"] = "Goldschmiedekunst Pläne",
    ["Skill:"] = "Fähigkeit:",

    --************************************************
    -- Class Sets Categories
    --************************************************
    ["Priest Sets"] = "Priester-Sets",
    ["Mage Sets"] = "Magier-Sets",
    ["Warlock Sets"] = "Hexenmeister-Sets",
    ["Rogue Sets"] = "Schurken-Sets",
    ["Druid Sets"] = "Druiden-Sets",
    ["Hunter Sets"] = "Jäger-Sets",
    ["Shaman Sets"] = "Schamanen-Sets",
    ["Paladin Sets"] = "Paladin-Sets",
    ["Warrior Sets"] = "Krieger-Sets",

    --************************************************
    -- Item Types & Categories
    --************************************************
    ["Mount"] = "Reittier",
    ["a mount"] = "ein neues Reittier",
    ["Glyph"] = "Glyphe",
    ["Enchant"] = "Verzauberung",
    ["Trade Goods"] = "Handwerkswaren",
    ["Book"] = "Buch",
    ["Cloak"] = "Umhang",
    ["Weapon"] = "Waffe",
    ["Weapons"] = "Waffen",
    ["Classes"] = "Klassen",
    ["Right Half"] = "Rechte Hälfte",
    ["Left Half"] = "Linke Hälfte",
    ["Prizes"] = "Preise",
    ["Decks"] = "Decks",
    ["Container"] = "Behälter",
    ["Consumable"] = "Verbrauchsgut",
    ["World"] = "Welt",
    ["Used to summon boss"] = "Wird verwendet, um Boss zu beschwören",
    ["Doll"] = "Puppe",
    ["Earth"] = "Erde",
    ["Air"] = "Luft",
    ["Master Angler"] = "Anglermeister",
    ["First Prize"] = "Erster Preis",
    ["Rare Fish Rewards"] = "Belohnungen seltener Fische",
    ["Rare Fish"] = "Seltene Fische",
    ["a companion"] = "einen neuen Begleiter",
    ["Cache"] = "Cache",
    ["Zul'Gurub Rings"] = "Zul'Gurub-Ringe",
    ["Pre 60 Sets"] = "Vor-60-Sets",
    ["Crafted Sets"] = "Hergestellte Sets",
    ["Crafted Epic Weapons"] = "Hergestellte epische Waffen",
    ["Tier 0.5"] = "T 0.5",
    ["Tier 0.5 Summonable"] = "T 0.5 beschwörbar",
    ["PvP Rewards"] = "PvP",
    ["PvP Armor Sets"] = "PvP-Rüstungssets",
    ["PvP Weapons"] = "PvP-Waffen",
    ["PvP Accessories"] = "PvP-Zubehör",
    ["Collector's Edition"] = "Sammleredition",
    ["Epic Set"] = "Episches Set",
    ["Rare Set"] = "Seltenes Set",
    ["Legendary Items"] = "Legendäre Gegenstände",
    ["Artifact Items"] = "Artefaktgegenstände",
    ["Fire Resistance Gear"] = "Ausrüstung mit Feuerwiderstand",
    ["Arcane Resistance Gear"] = "Ausrüstung mit Arkanwiderstand",
    ["Nature Resistance Gear"] = "Ausrüstung mit Naturwiderstand",
    ["Rare Pets"] = "Seltene Haustiere",
    ["Rare Mounts"] = "Seltene Reittiere",
    ["Old Mounts"] = "Alte Reittiere",
    ["PvP Mounts"] = "PvP-Reittiere",
    ["Tabards"] = "Gildenwappenröcke",
    ["World Epics"] = "Welt-Epics",
    ["World Enchants"] = "Weltverzauberungen",
    ["World Blues"] = "Welt-Blues",
    ["Keys"] = "Schlüssel",
    ["Level One Lunatic Challenge"] = "Herausforderung des Wahnsinnigen, Stufe 1", --************************************************
    -- Events & Holidays
    --************************************************
    ["Children's Week"] = "Kinderwoche",
    ["Elemental Invasion"] = "Elementarinvasion",
    ["Feast of Winter Veil"] = "Winterhauchfest",
    ["Harvest Festival"] = "Erntefest",
    ["Love is in the Air"] = "Liebe liegt in der Luft",
    ["Midsummer Fire Festival"] = "Sonnenwendfest",
    ["Noblegarden"] = "Nobelgarten",
    ["Scourge Invasion"] = "Geißelinvasion",
    ["Hallow's End"] = "Schlotternächte",
    ["Lunar Festival"] = "Mondfest",

    --************************************************
    -- Professions & Ranks
    --************************************************
    ["Apprentice"] = "Lehrling",
    ["Journeyman"] = "Geselle",
    ["Expert"] = "Experte",
    ["Artisan"] = "Fachmann",
    ["Master Axesmith"] = "Axtschmiedemeister",
    ["Master Hammersmith"] = "Hammerschmiedemeister",
    ["Master Swordsmith"] = "Schwertschmiedemeister",
    ["Gnomish Engineering"] = "Gnomen-Ingenieurskunst",
    ["Goblin Engineering"] = "Goblin-Ingenieurskunst",
    ["Rank"] = "Rang",
    ["Engineer"] = "Ingenieur",

    --************************************************
    -- Equipment Slots & Types
    --************************************************
    ["Head"] = "Kopf",
    ["Neck"] = "Hals",
    ["Shoulder"] = "Schulter",
    ["Chest"] = "Brust",
    ["Shirt"] = "Hemd",
    ["Tabard"] = "Wappenrock",
    ["Wrist"] = "Handgelenke",
    ["Hands"] = "Hände",
    ["Waist"] = "Taille",
    ["Legs"] = "Beine",
    ["Feet"] = "Füße",
    ["Ring"] = "Ring",
    ["Finger"] = "Finger",
    ["BackEquip"] = "Rücken",
    ["Trinket"] = "Schmuck",
    ["Held In Off-hand"] = "In der Schildhand geführt",
    ["Relic"] = "Relikt",
    ["Relics"] = "Relikte",
    ["One-Hand"] = "Einhändig",
    ["Two-Hand"] = "Zweihändig",
    ["Main Hand"] = "Waffenhand",
    ["Off Hand"] = "Schildhand",
    ["Ranged"] = "Fernkampf",
    ["Axe"] = "Axt",
    ["Bow"] = "Bogen",
    ["Crossbow"] = "Armbrust",
    ["Dagger"] = "Dolch",
    ["Gun"] = "Schusswaffe",
    ["Mace"] = "Streitkolben",
    ["Polearm"] = "Stangenwaffe",
    ["Shield"] = "Schild",
    ["Staff"] = "Stab",
    ["Sword"] = "Schwert",
    ["Thrown"] = "Wurfwaffe",
    ["Wand"] = "Zauberstab",
    ["Fist Weapon"] = "Faustwaffe",
    ["Idol"] = "Götze",
    ["Totem"] = "Totem",
    ["Libram"] = "Buchband",
    ["Arrow"] = "Pfeil",
    ["Bullet"] = "Kugel",
    ["Quiver"] = "Köcher",
    ["Ammo Pouch"] = "Munitionsbeutel",
    ["Bag"] = "Behälter",
    ["Potion"] = "Trank",
    ["Reagent"] = "Reagenz",
    ["Darkmoon Faire Card"] = "Karte des Dunkelmond-Jahrmarkts",
    ["Fishing Pole"] = "Angelrute",
    ["Gemstones"] = "Edelsteine",
    ["Token of Blood Rewards"] = "Belohnungen der Blutmarke",
    ["Cooking Fire"] = "Kochfeuer",
    ["Anvil"] = "Amboss",
    ["Black Anvil"] = "Schwarzer Amboss",
    ["Forge"] = "Schmiede",
    ["Black Forge"] = "Schwarze Schmiede",
    ["Smokywood Pastures Special Gift"] = "Kokelwälder Spezialgeschenk",
    ["Smokywood Pastures"] = "Kokelwälder",
    ["Projectile"] = "Geschoss",
    ["Polearms"] = "Stangenwaffen",
    ["One-Handed Swords"] = "Einhandschwert",
    ["One-Handed Axes"] = "Einhandaxt",
    ["One-Handed Maces"] = "Einhandstreitkolben",
    ["Two-Handed Swords"] = "Zweihandschwert",
    ["Two-Handed Axes"] = "Zweihandaxt",
    ["Two-Handed Maces"] = "Zweihandstreitkolben",
    ["Daggers"] = "Dolche",
    ["Fist Weapons"] = "Faustwaffen",
    ["Staves"] = "Stäbe",
    ["Bows"] = "Bogen",
    ["Crossbows"] = "Armbrüste",
    ["Guns"] = "Schusswaffen",
    ["Shields"] = "Schilde",
    ["Wands"] = "Zauberstäbe",
    ["Rings"] = "Ringe",
    ["Gloves"] = "Handschuhe",
    ["Boots"] = "Stiefel",
    ["2H Weapon"] = "Zweihandwaffe",
    ["Flasks"] = "Fläschchen",
    ["Protection Potions"] = "Schutztränke",
    ["Healing and Mana Potions"] = "Heil- und Manatränke",
    ["Transmutes"] = "Umwandlungen",
    ["Transmogrification"] = "Transmogrifikation",
    ["Defensive Potions and Elixirs"] = "Defensive Tränke und Elixiere",
    ["Offensive Potions and Elixirs"] = "Offensive Tränke und Elixiere",
    ["Miscellaneous"] = "Verschiedenes",
    ["Helm"] = "Helm",
    ["Shoulders"] = "Schultern",
    ["Bracers"] = "Handgelenke",
    ["Belt"] = "Gürtel",
    ["Pants"] = "Hose",
    ["Bags"] = "Taschen",
    ["Axes"] = "Äxte",
    ["Swords"] = "Schwerter",
    ["Maces"] = "Streitkolben",
    ["Fist"] = "Faust",
    ["Belt Buckles"] = "Gürtelschnallen",
    ["Equipment"] = "Ausrüstung",
    ["Trinkets"] = "Schmuckstücke",
    ["Explosives"] = "Sprengstoffe",
    ["Parts"] = "Bauteile",
    ["Amulets"] = "Amulette",
    ["Scales"] = "Schuppen",
    ["Special"] = "Spezial",

    --************************************************
    -- Set Categories
    --************************************************
    ["Tier 0/0.5 Sets"] = "T 0/0.5-Sets",
    ["Zul'Gurub Sets"] = "Zul'Gurub-Sets",
    ["Zul'Gurub Enchants"] = "Zul'Gurub-Zauber",
    ["Ruins of Ahn'Qiraj Sets"] = "Ruinen von Ahn'Qiraj-Sets",
    ["Temple of Ahn'Qiraj Sets"] = "Tempel von Ahn'Qiraj-Sets",
    ["Tier 1 Sets"] = "T 1-Sets",
    ["Tier 2 Sets"] = "T 2-Sets",
    ["Tier 3 Sets"] = "T 3-Sets",
})
