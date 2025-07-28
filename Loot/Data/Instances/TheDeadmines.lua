-- TheDeadmines Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TheDeadmines = {
    Name = BZ["The Deadmines"],
    Location = BZ["Westfall"],
    Level = {10,24},
    Acronym = "VC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] },
        { letter = "B) "..L["Exit"] }
    },

    Bosses = {
        {
            id = "DMJaredVoss",
            prefix = "1)",
            name = BB["Jared Voss"],
            defaults = { dropRate = 50 },
            loot = {
                {id=55377, dropRate=50},
                {},
                {id=55376, dropRate=25},
                {id=55375, dropRate=25},
                {},
                {id=41429, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "DMRhahkZor",
            prefix = "2)",
            name = BB["Rhahk'Zor"],
            defaults = { dropRate = 50 },
            loot = {
                {id=872, dropRate=5},
                {id=5187, dropRate=95},
                {},
                {id=80706, dropRate=50},
                {},
                {id=9496, disc=L["Transmogrification"]},
            }
        },
        {
            id = "DMMinerJohnson",
            prefix = "3)",
            name = BB["Miner Johnson"],
            postfix = L["Rare"],
            loot = {
                {id=5443, dropRate=35},
                {id=5444, dropRate=65},
            }
        },
        {
            id = "DMSneed",
            prefix = "4)",
            name = BB["Sneed"],
            defaults = { dropRate = 50 },
            loot = {
                {id=5194, dropRate=35},
                {id=5195, dropRate=65},
                {},
                {id=80707, dropRate=60},
                {},
                {id=50256, disc=L["Transmogrification"]},
            }
        },
        {
            id = "DMSneedsShredder",
            name = L["Sneed's Shredder"],
            loot = {
                {id=1937, dropRate=10},
                {id=2169, dropRate=90},
            }
        },
        {
            id = "DMGilnid",
            prefix = "5)",
            name = BB["Gilnid"],
            defaults = { dropRate = 50 },
            loot = {
                {id=1156, dropRate=45},
                {id=5199, dropRate=55},
            }
        },
        {
            id = "DMHarvester",
            prefix = "6)",
            name = BB["Masterpiece Harvester"],
            defaults = { dropRate = 33 },
            loot = {
                {id=55380, dropRate=50},
                {},
                {id=55379, dropRate=25},
                {id=55378, dropRate=25},
            }
        },
        {
            id = "DMMrSmite",
            prefix = "7)",
            name = BB["Mr. Smite"],
            defaults = { dropRate = 25 },
            loot = {
                {id=7230, dropRate=20},
                {id=5192, dropRate=30},
                {id=5196, dropRate=30},
                {id=81007, dropRate=20},
            }
        },
        {
            id = "DMCookie",
            prefix = "8)",
            name = BB["Cookie"],
            defaults = { dropRate = 50 },
            loot = {
                {id=5198, dropRate=35},
                {id=5197, dropRate=65},
                {id=80708, dropRate=60},
                {},
                {id=9338, disc=L["Transmogrification"]},
                {},
                {id=8490, disc=L["Pet"], dropRate=15},
            }
        },
        {
            id = "DMCaptainGreenskin",
            prefix = "9)",
            name = BB["Captain Greenskin"],
            defaults = { dropRate = 33 },
            loot = {
                {id=5201, dropRate=40},
                {id=10403, dropRate=30},
                {id=5200, dropRate=30},
            }
        },
        {
            id = "DMVanCleef",
            prefix = "10)",
            name = BB["Edwin VanCleef"],
            defaults = { dropRate = 25 },
            loot = {
                {id=5193, dropRate=30},
                {id=5202, dropRate=30},
                {id=10399, dropRate=20},
                {id=5191, dropRate=20},
                {id=81005, dropRate=8},
                {},
                {id=29980, disc=L["Transmogrification"]},
                {},
                {id=2874, disc=L["Quest Item"], dropRate=100},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "DMTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .02 },
            loot = {
                {id=8492, disc=L["Pet"], dropRate=4},
                {},
                {id=80802, dropRate=3},
                {id=80803, dropRate=3},
                {id=1943, dropRate=4},
                {},
                {id=10401, dropRate=4},
                {id=10400, dropRate=1.75},
                {id=10402, dropRate=1.2},
            }
        },
        { name = BIS["Defias Leather"], items = "DEADMINES" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheDeadmines.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end