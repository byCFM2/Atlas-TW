-- Blackwing_Lair.lua - Данные предметов из Логова Крыла Тьмы
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Логова Крыла Тьмы
AtlasTW.InstanceData.BlackwingLair = {
    Name = BZ["Blackwing Lair"],
    Location = BZ["Blackrock Spire"],
    Level = 60,
    Acronym = "BWL",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Fire"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] },
        { letter = "B) ".. L["Connection"] },
        { letter = "C) ".. L["Connection"] }
    },
    Bosses = {
        {
            id = "Razorgore",
            prefix = "1)",
            name = BB["Razorgore the Untamed"],
            defaults = { dropRate = 11 },
            loot = {
                {id=16926, container={47209}},
                {id=16918, container={47089}},
                {id=16934, container={47287}},
                {id=16911},
                {id=16904, container={47349,47357}},
                {id=16935},
                {id=16943, container={47139,47147}},
                {id=16951, container={47019,47027}},
                {id=16959, container={47251}},
                {},
                {},
                {},
                {},
                {id=19336, dropRate=20},
                {id=19337, dropRate=20},
                {id=19370, dropRate=20},
                {id=19369, dropRate=20},
                {},
                {id=19335, dropRate=10},
                {id=19334, dropRate=10},
            }
        },
        {
            id = "Vaelastrasz",
            prefix = "2)",
            name = BB["Vaelastrasz the Corrupt"],
            defaults = { dropRate = 11 },
            loot = {
                {id=16925, container={47211}},
                {id=16818, container={47091}},
                {id=16933, container={47289}},
                {id=16910},
                {id=16903, container={47351,47359}},
                {id=16936},
                {id=16944, container={47141,47149}},
                {id=16952, container={47021,47029}},
                {id=16960, container={47253}},
                {},
                {},
                {},
                {},
                {id=19339, dropRate=20},
                {id=19340, dropRate=20},
                {id=19372, dropRate=20},
                {id=19371, dropRate=20},
                {},
                {id=19348, dropRate=10},
                {id=19346, dropRate=10},
            }
        },
        {
            id = "Lashlayer",
            prefix = "3)",
            name = BB["Broodlord Lashlayer"],
            defaults = { dropRate = 11 },
            loot = {
                {id=16919, container={47213}},
                {id=16912, container={47093}},
                {id=16927, container={47291}},
                {id=16906},
                {id=16898, container={47353,47361}},
                {id=16941},
                {id=16949, container={47143,47151}},
                {id=16957, container={47023,47031}},
                {id=16965, container={47255}},
                {},
                {},
                {},
                {},
                {id=19341, dropRate=20},
                {id=19342, dropRate=20},
                {id=19373, dropRate=20},
                {id=19374, dropRate=20},
                {},
                {id=19350, dropRate=10},
                {id=19351, dropRate=10},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=20383, dropRate=100},
            }
        },
        {
            id = "Firemaw",
            prefix = "4)",
            name = BB["Firemaw"],
            defaults = { dropRate = 7 },
            loot = {
                {id=16920, container={47210}},
                {id=16913, container={47090}},
                {id=16928, container={47288}},
                {id=16907},
                {id=16899, container={47350,47358}},
                {id=16940},
                {id=16948, container={47140,47148}},
                {id=16956, container={47020,47028}},
                {id=16964, container={47252}},
                {},
                {},
                {},
                {},
                {id=19344, dropRate=13},
                {id=19343, dropRate=13},
                {id=19394},
                {id=19398, dropRate=13},
                {id=19399, dropRate=13},
                {id=19400, dropRate=13},
                {id=19396, dropRate=13},
                {id=19401, dropRate=13},
                {id=19402, dropRate=13},
                {},
                {id=19365, dropRate=13},
                {id=19353},
                {id=19355},
                {},
                {},
                {id=19397},
                {id=19395},
            }
        },
        { prefix = "5)", name = L["Master Elemental Shaper Krixix"], color = "|cff9d9d9d",},
        {
            id = "Ebonroc",
            prefix = "6)",
            name = BB["Ebonroc"],
            defaults = { dropRate = 7 },
            loot = {
                {id=16920, container={47210}},
                {id=16913, container={47090}},
                {id=16928, container={47288}},
                {id=16907},
                {id=16899, container={47350,47358}},
                {id=16940},
                {id=16948, container={47140,47148}},
                {id=16956, container={47020,47028}},
                {id=16964, container={47252}},
                {},
                {},
                {},
                {},
                {},
                {id=19345, dropRate=17},
                {id=19394},
                {id=19407, dropRate=17},
                {id=19396},
                {id=19405, dropRate=17},
                {},
                {id=19368, dropRate=17},
                {id=19353},
                {id=19355},
                {},
                {},
                {},
                {id=19403, dropRate=17},
                {id=19397},
                {id=19406, dropRate=17},
                {id=19395},
            }
        },
        {
            id = "Flamegor",
            prefix = "7)",
            name = BB["Flamegor"],
            defaults = { dropRate = 7 },
            loot = {
                {id=16920, container={47210}},
                {id=16913, container={47090}},
                {id=16928, container={47288}},
                {id=16907},
                {id=16899, container={47350,47358}},
                {id=16940},
                {id=16948, container={47140,47148}},
                {id=16956, container={47020,47028}},
                {id=16964, container={47252}},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=19394},
                {id=19430, dropRate=17},
                {id=19396},
                {id=19433, dropRate=17},
                {},
                {id=19367, dropRate=17},
                {id=19353},
                {id=19357, dropRate=17},
                {id=19355},
                {},
                {},
                {id=19432, dropRate=17},
                {id=19397},
                {id=19395},
                {id=19431, dropRate=17},
            }
        },
        {
            id = "Chromaggus",
            prefix = "8)",
            name = BB["Chromaggus"],
            defaults = { dropRate = 11 },
            loot = {
                {id=16924, container={47207}},
                {id=16917, container={47087}},
                {id=16932, container={47285}},
                {id=16832},
                {id=16902, container={47347,47355}},
                {id=16937},
                {id=16945, container={47137,47145}},
                {id=16953, container={47017,47025}},
                {id=16961, container={47249}},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=19389, dropRate=16},
                {id=19386, dropRate=16},
                {id=19390, dropRate=16},
                {id=19388, dropRate=20},
                {id=19393, dropRate=16},
                {id=19392, dropRate=16},
                {id=19385, dropRate=20},
                {id=19391, dropRate=16},
                {id=19387, dropRate=20},
                {},
                {},
                {id=19361, dropRate=10},
                {id=19349, dropRate=10},
                {id=19347, dropRate=10},
                {id=19352, dropRate=10},
            }
        },
        {
            id = "Nefarian",
            prefix = "9)",
            name = BB["Nefarian"],
            defaults = { dropRate = 11 },
            loot = {
                {id=16923, container={47208}},
                {id=16916, container={47088}},
                {id=16931, container={47286}},
                {id=16905},
                {id=16897, container={47348,47356}},
                {id=16942},
                {id=16950, container={47138,47146}},
                {id=16958, container={47018,47026}},
                {id=16966, container={47250}},
                {},
                {id=19003, dropRate=100, container={19383,19384,19366}},
                {id=19002, dropRate=100, container={19383,19384,19366}},
                {},
                {id=36551, dropRate=1},
                {id=19360, dropRate=10},
                {id=19363, dropRate=10},
                {id=19364, dropRate=10},
                {id=19356, dropRate=10},
                {},
                {id=19375, dropRate=20},
                {id=19377, dropRate=20},
                {id=19378, dropRate=20},
                {id=19380, dropRate=20},
                {id=19381, dropRate=20},
                {},
                {id=19376, dropRate=20},
                {id=19382, dropRate=20},
                {id=19379, dropRate=20},
                {},
                {id=61760, dropRate=100, container={55505}},
                {},
                {id=17962, disc=L["Container"], dropRate=20, container={13926,7971,3864,55251,55250,7910,7909,1529,12361}}, -- Blue Sack of Gems
                {id=17963, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12364}}, -- Green Sack of Gems
                {id=17964, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12800}}, -- Gray Sack of Gems
                {id=17965, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12363}}, -- Yellow Sack of Gems
                {id=17969, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12799,6332}}, -- Red Sack of Gems
            }
        },
        { prefix = "1)", name = L["Alchemy Lab"], color = "|cff00FF00"},
        { prefix = "2)", name = L["Draconic for Dummies"], color = "|cff00FF00"},
        {
            id = "BWLTrash",
            name = L["Trash Mobs"].."-"..BZ["Blackwing Lair"],
            defaults = { dropRate = 4 },
            loot = {
                {id=19436},
                {id=19439, dropRate=5},
                {id=19437},
                {id=19438, dropRate=5},
                {},
                {id=19434, dropRate=2},
                {},
                {id=19435, dropRate=2},
                {id=19362, dropRate=2},
                {id=19354, dropRate=5},
                {id=19358},
                {},
                {id=18562, disc=L["Trade Goods"], dropRate=8},
                {id=19183, quantity={1,2}, disc=L["Consumable"], dropRate=47},
                {id=70173, dropRate=2},
            }
        }
    }
}
-- Данные Blackrock Mountain Entrance
AtlasTW.InstanceData.BlackrockMountainEnt = {
    Name = BZ["Blackrock Mountain"] .. " (" .. L["Entrance"] .. ")",
    Location = BZ["Blackrock Mountain"],
    Entrances = {
        { letter = "A) " .. BZ["Searing Gorge"] },
        { letter = "B) " .. BZ["Burning Steppes"] },
        { letter = "C) " .. BZ["Blackrock Depths"] .. " (BRD)" },
        { letter = "D) " .. BZ["Lower Blackrock Spire"] .. " (LBRS)" }
    },
    Bosses = {
        {
            name = BZ["Molten Core"] .. " (MC) (" .. L["through "] .. "BRD)",
            color = "|cff6666ff"
        },
        {
            name = BZ["Upper Blackrock Spire"] .. " (UBRS)",
            color = "|cff6666ff"
        },
        {
            name = BZ["Blackwing Lair"] .. " (BWL) (" .. L["through "] .. "UBRS)",
            color = "|cff6666ff"
        },
        {
            name = L["Bodley"] .. " (" .. L["Ghost"] .. ")",
            color = "|cff6666ff"
        },
        {
            id = "BRDPyron",
            prefix = "1)",
            name = BB["Overmaster Pyron"],
            postfix = L["Wanders"],
            loot = {
                {id=14486, dropRate=18, container={14134}},
            }
        },
        {
            prefix = "2)",
            name = BB["Lothos Riftwaker"],
            postfix = "MC " .. L["Teleport"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "3)",
            name = BB["Franclorn Forgewright"],
            postfix = L["Ghost"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "4)",
            name = L["Meeting Stone"] .. " (BRD)",
            color = "|cff9d9d9d",
        },
        {
            prefix = "5)",
            name = L["Orb of Command"] .. " (BWL " .. L["Teleport"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "6)",
            name = L["Meeting Stone"] .. " (LBRS, UBRS)",
            color = "|cff9d9d9d",
        },
        {
            id = "BRMScarshieldQuartermaster",
            prefix = "7)",
            name = BB["Scarshield Quartermaster"],
            postfix = L["Rare"],
            loot = {
                {id=13254, dropRate=3},
                {id=13248, dropRate=3},
                {},
                {id=18987, dropRate=100},
            }
        },
        {
            id = "BRMBehemoth",
            prefix = "8)",
            name = BB["The Behemoth"],
            postfix = L["Rare"],
            loot = {
                {id=11603, dropRate=99},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
            }
        }
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.BlackwingLair.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockMountainEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end