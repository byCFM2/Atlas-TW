-- Scholomance.lua - Данные предметов из Некроситета
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Общий лут для Scholomance (наборы брони)
local scholoShareLoot = {
    {id=18681, dropRate=4},
    {id=14633, dropRate=4},
    {id=14626, dropRate=4},
    {id=14637, dropRate=4},
    {id=14611, dropRate=4},
    {id=14624, dropRate=4},
    {id=14629, dropRate=4},
    {id=14640, dropRate=4},
    {id=14615, dropRate=4},
    {id=14622, dropRate=4},
    {id=14636, dropRate=4},
    {id=14614, dropRate=4},
    {id=14620, dropRate=4},
    {id=14632, dropRate=4},
    {id=14638, dropRate=4},
    {id=18682, dropRate=4},
    {id=14612, dropRate=4},
    {id=14623, dropRate=4},
    {id=14631, dropRate=4},
    {id=14641, dropRate=4},
    {id=14616, dropRate=4},
    {id=14621, dropRate=4},
    {id=18684, dropRate=4},
    {id=23201, dropRate=4},
    {id=23200, dropRate=4},
    {id=18680, dropRate=4},
    {id=18683, dropRate=4},
}

-- Данные Некроситета
AtlasTW.InstanceData.Scholomance = {
    Name = BZ["Scholomance"],
    Location = BZ["Western Plaguelands"],
    Level = {45,60},
    Acronym = "Scholo",
    MaxPlayers = 5,
    DamageType = L["Shadow"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Argent Dawn"], loot = "ArgentDawn" }
    },
    Keys = {
        { name = L["Skeleton Key"], loot = "VanillaKeys", info = L["Key"] }
    },
    Bosses = {
        {
            id = "BloodStewardofKirtonos",
            prefix = "1)",
            name = L["Blood Steward of Kirtonos"],
            loot = {
                {id=13523, disc=L["Used to summon boss"], dropRate=100},
            }
        },
        { name = L["The Deed to Southshore"], color = "|cff9d9d9d"},
        {
            id = "KirtonostheHerald",
            prefix = "2)",
            name = BB["Kirtonos the Herald"],
            postfix = L["Summon"],
            defaults = { dropRate = 11 },
            loot = {
                {id=16734, disc=L["Warrior"]..", T0",container={21995}},
                {},
                {id=13960},
                {id=13967},
                {id=13955},
                {id=13969},
                {id=13957},
                {id=13956},
                {id=13958},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "JandiceBarov",
            prefix = "3)",
            name = BB["Jandice Barov"],
            defaults = { dropRate = 14 },
            loot = {
                {id=16701, disc=L["Warlock"]..", T0",container={22073}},
                {},
                {id=14548},
                {id=18689},
                {id=14545},
                {id=18690},
                {id=14541},
                {id=22394},
                {},
                {},
                {id=13523, disc=L["Used to summon boss"], dropRate=100},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        { name = L["Journal of Jandice Barov"], color = "|cff9d9d9d"},
        { prefix = "4)", name = L["The Deed to Tarren Mill"], color = "|cff9d9d9d"},
        {
            id = "LordBlackwood",
            name = BB["Lord Blackwood"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 33 },
            loot = {
                {id=23156},
                {},
                {id=23132},
                {id=23139},
            }
        },
        {
            id = "Rattlegore",
            prefix = "5)",
            name = BB["Rattlegore"],
            postfix = L["Lower"],
            defaults = { dropRate = 14 },
            loot = {
                {id=16711, disc=L["Rogue"]..", T0",container={22003}},
                {},
                {id=14539},
                {id=14538},
                {id=18686},
                {id=14537},
                {id=14528},
                {id=14531},
                {},
                {id=18782, dropRate=40},
                {id=12726, container={12619}, dropRate=0},
                {},
                {id=13873, disc=L["Key"], dropRate=100},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "DeathKnight",
            name = BB["Death Knight Darkreaver"],
            postfix = L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                {id=18760},
                {},
                {id=18761},
                {id=18758},
                {id=18759},
            }
        },
        {
            id = "MardukBlackpool",
            prefix = "6)",
            name = BB["Marduk Blackpool"],
            defaults = { dropRate = 7 },
            loot = {
                {id=18692},
                {},
                {id=14576},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "Vectus",
            name = BB["Vectus"],
            defaults = { dropRate = 4 },
            loot = {
                {id=18691},
                {id=14577},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "RasFrostwhisper",
            prefix = "7)",
            name = BB["Ras Frostwhisper"],
            defaults = { dropRate = 8 },
            loot = {
                {id=16689, disc=L["Mage"]..", T0",container={22068}},
                {},
                {id=14503},
                {id=14340},
                {id=18693},
                {id=14525},
                {id=14502},
                {id=14522},
                {id=18694},
                {id=18695},
                {id=18696},
                {id=13952},
                {id=14487},
                {id=13314,dropRate=2},
                {},
                {id=13521,dropRate=3,container={13512}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        { name = L["The Deed to Brill"], color = "|cff9d9d9d"},
        {
            id = "Kormok",
            name = BB["Kormok"],
            postfix = L["Summon"],
            defaults = { dropRate = 20 },
            loot = {
                {name=L["Tier 0.5 Summonable"],icon="INV_Misc_Bag_09"},
                {id=22303},
                {id=22326},
                {id=22331},
                {id=22332},
                {},
                {id=22333},
            }
        },
        {
            id = "InstructorMalicia",
            prefix = "8)",
            name = BB["Instructor Malicia"],
            loot = {
                {id=16710, disc=L["Rogue"]..", T0", container={22004}, dropRate = 4},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "DoctorTheolenKrastinov",
            prefix = "9)",
            name = BB["Doctor Theolen Krastinov"],
            loot = {
                {id=16684, disc=L["Mage"]..", T0", container={22066}, dropRate=14},
                {id=14617, disc=L["Shirt"], dropRate=2},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "LorekeeperPolkelt",
            prefix = "10)",
            name = BB["Lorekeeper Polkelt"],
            loot = {
                {id=16705, disc=L["Warlock"]..", T0", container={22077}, dropRate=17},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "TheRavenian",
            prefix = "11)",
            name = BB["The Ravenian"],
            loot = {
                {id=16716, disc=L["Druid"]..", T0", container={22106}, dropRate=17},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "LordAlexeiBarov",
            prefix = "12)",
            name = BB["Lord Alexei Barov"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16722, disc=L["Paladin"]..", T0", container={22088}, dropRate=5},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(scholoShareLoot),
            }
        },
        { name = L["The Deed to Caer Darrow"], color = "|cff9d9d9d"},
        {
            id = "LadyIlluciaBarov",
            prefix = "13)",
            name = BB["Lady Illucia Barov"],
            defaults = { dropRate = 4 },
            loot = {
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                {},
                unpack(scholoShareLoot),
            }
        },
        {
            id = "DarkmasterGandling",
            prefix = "14)",
            name = BB["Darkmaster Gandling"],
            defaults = { dropRate = 11 },
            loot = {
                {id=16693, disc=L["Priest"]..", T0", container={22080}},
                {id=16686, disc=L["Mage"]..", T0", container={22065}},
                {id=16698, disc=L["Warlock"]..", T0", container={22074}},
                {id=16707, disc=L["Rogue"]..", T0", container={22005}},
                {id=16720, disc=L["Druid"]..", T0", container={22109}},
                {id=16677, disc=L["Hunter"]..", T0", container={22013}},
                {id=16667, disc=L["Shaman"]..", T0", container={22097}},
                {id=16727, disc=L["Paladin"]..", T0", container={22091}},
                {id=16731, disc=L["Warrior"]..", T0", container={21999}},
                {},
                {id=13944, dropRate=14},
                {id=13951, dropRate=14},
                {id=13950, dropRate=14},
                {id=13398, dropRate=14},
                {id=22433, dropRate=14},
                {id=13938, dropRate=14},
                {id=13953, dropRate=14},
                {id=13964, dropRate=14},
                {},
                {id=13937, dropRate=1},
                {},
                {id=19276, disc=L["Darkmoon Faire Card"], dropRate=3,container={19290}},
                {},
                {id=13501, dropRate=10, container={13444}},
                {id=47413, dropRate=10, container={47412}}, --Recipe: Concoction of the Arcane Giant
                {id=47415, dropRate=10, container={47414}}, --Recipe: Concoction of the Dreamwater
                {id=14514, dropRate=7, container={14513}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=100},
            }
        },
        { prefix = "1')",name = L["Torch Lever"], color = "|cff00FF00"},
        { prefix = "2')",name = L["Old Treasure Chest"], color = "|cff00FF00"},
        { prefix = "3')",name = L["Alchemy Lab"], color = "|cff00FF00"},
        {
            id = "SCHOLOTrash",
            name = L["Trash Mobs"],
            loot = {
                {id=16685, disc=L["Mage"]..", T0", container={22062}, dropRate=1.5},
                {id=16702, disc=L["Warlock"]..", T0", container={22070}, dropRate=1.5},
                {id=16710, disc=L["Rogue"]..", T0", container={22004}, dropRate=2},
                {id=16714, disc=L["Druid"]..", T0", container={22108}, dropRate=1.75},
                {id=16716, disc=L["Druid"]..", T0", container={22106}, dropRate=2},
                {id=16671, disc=L["Shaman"]..", T0", container={22095}, dropRate=1.5},
                {id=16722, disc=L["Paladin"]..", T0", container={22088}, dropRate=3},
                {},
                {id=12843},
                {id=12841},
                {id=12840},
                {},
                {id=20520, disc=L["Reagent"], dropRate=25},
                {id=12753, disc=L["Reagent"], dropRate=18},
                {},
                {id=18698, dropRate=.04},
                {id=18699, dropRate=.03},
                {id=14536, dropRate=.04},
                {id=18700, dropRate=.25},
                {id=18702, dropRate=.02},
                {id=18697, dropRate=.2},
                {id=18701, dropRate=.4},
                {},
                {id=16254, dropRate=1},
                {id=16255, dropRate=2},
                {id=15773, dropRate=7, container={15085}},
                {id=15776, dropRate=4, container={15090}},
                {},
                {id=13920, dropRate=6},
            }
        },
        { name = BZ["Scholomance"].." "..L["Sets"], items = "Scholo" },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
        { name = L["Tier 0/0.5 Sets"], items = "AtlasLootT0SetMenu" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Scholomance.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end