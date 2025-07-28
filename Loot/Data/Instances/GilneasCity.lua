-- GilneasCity.lua - Данные предметов из Gilneas City
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Gilneas City
AtlasTW.InstanceData.GilneasCity = {
    Name = BZ["Gilneas City"],
    Location = BZ["Gilneas"],
    Level = {43,49},
    Acronym = "GC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"] }
    },
    Bosses = {
        {
            id = "GCMatthiasHoltz",
            prefix = "1)",
            name = BB["Matthias Holtz"],
            defaults = { dropRate = 33 },
            loot = {
                {id=61305},
                {id=61304},
                {id=61306},
                {},
                {id=61307, dropRate=2},
            }
        },
        {
            id = "GCPackmasterRagetooth",
            prefix = "2)",
            name = BB["Packmaster Ragetooth"],
            defaults = { dropRate = 33 },
            loot = {
                {id=61301},
                {id=61300},
                {id=61302},
                {},
                {id=61303, dropRate=2},
            }
        },
        {
            prefix = "a)",
            name = L["Dawnstone Plans"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "b)",
            name = L["Manuscript of Hydromancy II"],
            color = "|cff9d9d9d",
        },
        {
            id = "GCJudgeSutherland",
            prefix = "3)",
            name = BB["Judge Sutherland"],
            defaults = { dropRate = 25 },
            loot = {
                {id=61309},
                {id=61311},
                {id=61310},
                {id=61308},
                {},
                {id=61312, dropRate=2},
            }
        },
        {
            id = "GCDustivanBlackcowl",
            prefix = "4)",
            name = BB["Dustivan Blackcowl"],
            defaults = { dropRate = 25 },
            loot = {
                {id=61331},
                {id=61332},
                {id=61330},
                {id=61333},
                {},
                {id=61334, dropRate=5},
                {},
                {id=61626, dropRate=100, container={61627, 61628, 61629, 61630}},
                {id=41357, dropRate=100, container={70134}},
            }
        },
        {
            id = "GCMarshalMagnusGreystone",
            prefix = "5)",
            name = BB["Marshal Magnus Greystone"],
            defaults = { dropRate = 25 },
            loot = {
                {id=61313},
                {id=61315},
                {id=61314},
                {id=61316},
                {},
                {id=61317, dropRate=5},
                {},
                {id=61368, dropRate=3},
            }
        },
        {
            id = "GCHorsemasterLevvin",
            prefix = "6)",
            name = BB["Horsemaster Levvin"],
            defaults = { dropRate = 25 },
            loot = {
                {id=61734},
                {id=61736},
                {id=61735},
                {id=61737},
                {},
                {id=83157, dropRate=0.18},
            }
        },
        {
            id = "GCHarlowFamilyChest",
            prefix = "7)",
            name = L["Harlow Family Chest"],
            defaults = { dropRate = 25 },
            loot = {
                {id=61319},
                {id=61321},
                {id=61320},
                {id=61318},
                {},
                {id=61322, dropRate=5},
            }
        },
        {
            id = "GCGennGreymane",
            prefix = "8)",
            name = BB["Genn Greymane"],
            defaults = { dropRate = 15 },
            loot = {
                {id=61323},
                {id=61326},
                {id=61327},
                {id=61325},
                {id=61324},
                {id=61328},
                {id=61329},
                {},
                {id=61406, dropRate=.5},
                {},
                {id=61738, dropRate=6},
                {id=69000, dropRate=1.5},
                {},
                {id=61352, dropRate=100, container={61353, 61354, 61355}},
                {id=61496, dropRate=100, container={61497, 61498, 61499, 61369}},
            }
        },
        {
            id = "GCTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .034 },
            loot = {
                {id=61598},
                {id=61336},
                {id=61597},
                {id=61335},
                {id=61339},
                {},
                {id=61337},
                {},
                {id=61338},
                {id=61596},
                {},
                {id=41421, dropRate=10, container={55505}},
            }
        },
        { name = BIS["Greymane Armor"], items = "GreymaneArmor" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.GilneasCity.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end