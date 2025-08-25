-- TheDeadmines Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
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
            loot = {
                {id=55377, dropRate=50},
                {},
                {id=55376, dropRate=25},
                {id=55375, dropRate=25},
                {},
                {id=41429, dropRate=100, container={70239, 70240}},
            }
        },
        {
            id = "DMRhahkZor",
            prefix = "2)",
            name = BB["Rhahk'Zor"],
            loot = {
                {id=872, dropRate=5},
                {id=5187, dropRate=95},
                {},
                {id=80706, dropRate=50},
                {},
                {id=9496, disc=L["Level One Luntic Challenge"], dropRate=100},
            }
        },
        {
            id = "DMMinerJohnson",
            prefix = "3)",
            name = BB["Miner Johnson"],
            postfix = L["Rare"],
            loot = {
                {id=5444, dropRate=65},
                {},
                {id=5443, dropRate=35},
            }
        },
        {
            id = "DMSneed",
            prefix = "4)",
            name = BB["Sneed"],
            loot = {
                {id=5194, dropRate=35},
                {id=5195, dropRate=65},
                {},
                {id=80707, dropRate=60},
                {},
                {id=81315, dropRate=100, container={81316, 81317}},
                {},
                {id=50256, disc=L["Level One Luntic Challenge"], dropRate=100},
            }
        },
        {
            id = "DMSneedsShredder",
            name = L["Sneed's Shredder"],
            loot = {
                {id=1937, dropRate=10},
                {id=2169, dropRate=90},
                {},
                {id=7365, dropRate=100, container={7606, 7607}},
            }
        },
        {
            id = "DMGilnid",
            prefix = "5)",
            name = BB["Gilnid"],
            loot = {
                {id=1156, dropRate=45},
                {id=5199, dropRate=55},
            }
        },
        {
            id = "DMHarvester",
            prefix = "6)",
            name = BB["Masterpiece Harvester"],
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
            loot = {
                {id=5198, dropRate=35},
                {id=5197, dropRate=65},
                {id=80708, dropRate=60},
                {},
                {id=8490, dropRate=15},
                {},
                {id=60526, dropRate=100, container={70070}},
                {},
                {id=9338, disc=L["Level One Luntic Challenge"], dropRate=100},
            }
        },
        {
            id = "DMCaptainGreenskin",
            prefix = "9)",
            name = BB["Captain Greenskin"],
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
            loot = {
                {id=5193, dropRate=30},
                {id=5202, dropRate=30},
                {id=10399, dropRate=20},
                {id=5191, dropRate=20},
                {id=81005, dropRate=8},
                {},
                {id=2874, dropRate=100, container={2933}},
                {id=3637, dropRate=100, container={6087,2041,2042}},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
                {},
                {id=29980, disc=L["Level One Luntic Challenge"], dropRate=100},
            }
        },
        {
            id = "DMTrash",
            name = L["Trash Mobs"].." "..BZ["The Deadmines"],
            loot = {
                {id=8492, dropRate=4},
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
        { name = BIS["Defias Leather"], items = "Deadmines" },
    },
}

AtlasTW.InstanceData.TheDeadminesEnt = {
    Name = BZ["The Deadmines"] .. " (" .. L["Entrance"] .. ")",
    Location = BZ["Westfall"],
    Acronym = "DM",
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = BZ["The Deadmines"] }
    },
    Bosses = {
        {
            id = "DMMarisaduPaige",
            prefix = "1)",
            name = BB["Marisa du'Paige"],
            postfix = L["Rare"]..", "..L["Varies"],
            loot = {
                {id=3019, dropRate=25},
                {id=4660, dropRate=75},
            }
        },
        {
            id = "DMBrainwashedNoble",
            prefix = "2)",
            name = BB["Brainwashed Noble"],
            postfix = L["Rare"],
            loot = {
                {id=5967, dropRate=64},
                {id=3902, dropRate=26},
            }
        },
        {
            id = "DMForemanThistlenettle",
            prefix = "3)",
            name = BB["Foreman Thistlenettle"],
            loot = {
                {id=1875, dropRate=100, container={1893}},
            }
        },
    }
}
-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheDeadmines.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end
-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheDeadminesEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end