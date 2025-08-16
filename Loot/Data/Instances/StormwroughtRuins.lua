-- StormwroughtRuins.lua - Данные предметов из Stormwrought Ruins
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Stormwrought Ruins
AtlasTW.InstanceData.StormwroughtRuins = {
    Name = BZ["Stormwrought Ruins"],
    Location = BZ["Balor"],
    Level = {35,42},
    Acronym = "SR",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"].." "..L["Front"] },
        { letter = "B)"..L["Entrance"].." "..L["Back"] },
    },
    Keys = {
        { name = L["Key to Stormwrought Castle"], loot = "VanillaKeys", info = "6+" },
    },
    Bosses = {
        {
            id = "SROronok",
            prefix = "1)",
            name = BB["Oronok Torn-Heart"], --34
            defaults = { dropRate = 25 },
            loot = {
                {id=58136}, --back
                {id=58177}, --Stormreaver Robe
            }
        },
        {
            id = "SRDagar",
            prefix = "2)",
            name = BB["Dagar The Glutton"], --34
            defaults = { dropRate = 25 },
            loot = {
                {id=58132}, --waist leather
                {id=58133}, --Handmaiden's Bracelet
            }
        },
        {
            id = "SRLibrarian",
            prefix = "3)",
            name = BB["Librarian Theodorus"], --35
            defaults = { dropRate = 25 },
            loot = {
                {id=58140}, --Broken Goldrimmed Monocle
                {id=58141}, --boots leather
                {id=41490, dropRate=100, container={58279, 58280}}, --Compendium of Successful Trade quest
            }
        },
        {
            id = "SRDukeBalor",
            prefix = "4)",
            name = BB["Duke Balor the IV"], --36
            defaults = { dropRate = 25 },
            loot = {
                {id=58144}, --Vander Legguards
                {id=58145}, --Light's Sermon Held
                {id=41921, container={58261, 58262}, dropRate=100}, --Crown of Balor Quest
            }
        },
        {
            id = "SRStormsong",
            prefix = "5)",
            name = BB["Chieftain Stormsong"], --36
            defaults = { dropRate = 25 },
            loot = {
                {id=58146}, --Totem of Tides
            }
        },
        {
            name = L["Key to Stormwrought Castle"],
            color = "|cff9d9d9d",
        },
        {
            id = "SRDeathlord",
            prefix = "6)",
            name = BB["Deathlord Tidebane"], --38
            defaults = { dropRate = 25 },
            loot = {
                {id=58150}, --Deathedge Sabre
                {id=58153}, --Shattered Soul Ring
                {},
                {id=950, dropRate=.01}, --Stormwrought Deathsteed 
            }
        },
        {
            id = "SRSubjugatorShadecrest",
            prefix = "7)",
            name = BB["Subjugator Halthas Shadecrest"], --37
            defaults = { dropRate = 25 },
            loot = {
                {id=58185}, --Leechmist Vine
            }
        },
        {
            id = "SRMycellakos",
            prefix = "8)",
            name = BB["Mycellakos"], --36
            defaults = { dropRate = 25 },
            loot = {
                {id=58180}, --Core of Mycellakos
                {id=58182}, --Rusted Anchor
            }
        },
        {
            id = "SREldermaw",
            prefix = "9)",
            name = BB["Eldermaw the Primordial"], --37
            defaults = { dropRate = 25 },
            loot = {
                {id=58189}, --Pants of Forgotten Ages
            }
        },
        {
            id = "SRLadyDrazare",
            prefix = "10)",
            name = BB["Lady Drazare"], --38
            defaults = { dropRate = 25 },
            loot = {
                {id=58192}, --Vest of Dark Desires
                {id=58194}, --Nethershard Sickle
            }
        },
        {
            prefix = "11)",
            name = BB["Ighal'for"], --38
            color = "|cff9d9d9d",
        },
        {
            id = "SRMergothid",
            name = BB["Mergothid"], --40
            defaults = { dropRate = 25 },
            loot = {
                {id=58202}, --Twisted Demon Crystal
                {id=58203}, --Chainmail of Writhing Miasma
            }
        },
        {
            id = "SRRemainsOfInnocent",
            prefix = "12)",
            name = BB["Remains of the Innocent"], --38
            defaults = { dropRate = 25 },
            loot = {
                {id=58195}, --Tiny Bracelet
                {id=58198}, --Dissolved Hookblade
            }
        },
        {
            id = "SRTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .1 },
            loot = {
                {id=70113}, --pattern
            }
        },
        { name = BIS["Stormreaver Attire"], items = "Stormreaver" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.StormwroughtRuins.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end