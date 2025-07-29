-- TheStockade Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TheStockade = {
    Name = BZ["The Stockade"],
    Location = BZ["Stormwind City"],
    Level = {15,31},
    Acronym = "Stocks",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },

    Bosses = {
        {
            id = "SWStTargorr",
            prefix = "1)",
            name = BB["Targorr the Dread"],
            postfix = L["Varies"],
            defaults = { dropRate = 50 },
            loot = {
                {id=80721},
                {id=80722},
                {},
                {id=3630, dropRate=100, container={3400,1317}},
            }
        },
        {
            id = "SWStKamDeepfury",
            prefix = "2)",
            name = BB["Kam Deepfury"],
            loot = {
                {id=2280, dropRate=1},
                {},
                {id=80723, dropRate=90},
                {},
                {id=3640, dropRate=100, container={3562,1264}},
            }
        },
        {
            id = "SWStHamhock",
            prefix = "3)",
            name = BB["Hamhock"],
            defaults = { dropRate = 50 },
            loot = {
                {id=80724},
                {id=80725},
            }
        },
        {
            id = "SWStBazil",
            prefix = "4)",
            name = BB["Bazil Thredd"],
            loot = {
                {id=80729, dropRate=35},
                {id=80730, dropRate=35},
                {id=80731, dropRate=30},
                {},
                {id=80796, dropRate=.05},
                {},
                {id=2909, dropRate=80},
                {id=2926, dropRate=100, container={2933}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SWStDextren",
            prefix = "5)",
            name = BB["Dextren Ward"],
            loot = {
                {id=80726, dropRate=35},
                {id=80727, dropRate=35},
                {id=80728, dropRate=30},
                {},
                {id=80796, dropRate=.05},
                {},
                {id=2909, dropRate=40},
                {id=3628, dropRate=100, container={2033,2906}},
            }
        },
        {
            id = "SWStBruegalIronknuckle",
            prefix = "6)",
            name = BB["Bruegal Ironknuckle"],
            defaults = { dropRate = 33 },
            loot = {
                {id=3228},
                {id=2941},
                {id=2942},
                {},
                {id=2909, dropRate=80},
            }
        },
        {
            id = "SWStTrash",
            name = L["Trash Mobs"],
            loot = {
                {id=80796, dropRate=.05},
                {id=1076, dropRate=.6},
                {},
                {id=2909, dropRate=80},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheStockade.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end