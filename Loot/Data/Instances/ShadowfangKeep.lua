-- ShadowfangKeep Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.ShadowfangKeep = {
    Name = BZ["Shadowfang Keep"],
    Location = BZ["Silverpine Forest"],
    Level = {14,30},
    Acronym = "SFK",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },

    Bosses = {
        {
            id = "SFKRethilgore",
            prefix = "1)",
            name = BB["Rethilgore"],
            defaults = { dropRate = 35 },
            loot = {
                {id=5254, dropRate=100},
                {},
                {id=80713},
                {id=80714},
            }
        },
        {
            name = L["Sorcerer Ashcrombe"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Deathstalker Adamant"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name = L["Deathstalker Vincent"],
            color = "|cff9d9d9d",
        },
        {
            id = "SFKFelSteed",
            prefix = "3)",
            name = L["Fel Steed"],
            loot = {
                {id=6341, dropRate=8},
                {},
                {id=932, dropRate=29},
            }
        },
        {
            id = "SFKJordansHammer",
            name = L["Jordan's Hammer"],
            loot = {
                {id=6895, dropRate=100, container={6953}},
            }
        },
        {
            id = "SFKRazorclawtheButcher",
            prefix = "4)",
            name = BB["Razorclaw the Butcher"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6226},
                {id=6633},
                {},
                {id=1292},
            }
        },
        {
            id = "SFKSilverlaine",
            prefix = "5)",
            name = BB["Baron Silverlaine"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6321},
                {id=6323},
                {},
                {id=80715, dropRate=35},
            }
        },
        {
            id = "SFKSpringvale",
            prefix = "6)",
            name = BB["Commander Springvale"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6320},
                {id=3191},
                {},
                {id=80717, dropRate=35},
            }
        },
        {
            id = "SFKSever",
            prefix = "7)",
            name = BB["Sever"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 50 },
            loot = {
                {id=23173},
                {id=23171},
            }
        },
        {
            id = "SFKOdotheBlindwatcher",
            prefix = "8)",
            name = BB["Odo the Blindwatcher"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6319},
                {},
                {id=6318},
            }
        },
        {
            id = "SFKDeathswornCaptain",
            prefix = "9)",
            name = BB["Deathsworn Captain"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6642},
                {id=6641},
            }
        },
        {
            id = "SFKFenrustheDevourer",
            prefix = "10)",
            name = BB["Fenrus the Devourer"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6340},
                {id=3230},
            }
        },
        {
            id = "SFKArugalsVoidwalker",
            name = BB["Arugal's Voidwalker"],
            loot = {
                {id=5943, dropRate=3},
            }
        },
        {
            id = "SFKBookofUr",
            name = L["The Book of Ur"],
            loot = {
                {id=6283, dropRate=100, container={6335,4534}},
            }
        },
        {
            id = "SFKWolfMasterNandos",
            prefix = "11)",
            name = BB["Wolf Master Nandos"],
            defaults = { dropRate = 50 },
            loot = {
                {id=3748},
                {id=6314},
                {},
                {id=80716, dropRate=35},
            }
        },
        {
            id = "SFKArchmageArugal",
            prefix = "12)",
            name = BB["Archmage Arugal"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6324},
                {id=6392},
                {},
                {id=6220},
                {},
                {id=5442, dropRate=100, container={6414}},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKPrelate",
            prefix = "13)",
            name = BB["Prelate Ironmane"],
            defaults = { dropRate = 25 },
            loot = {
                {id=55385},
                {id=55384},
                {id=55383},
                {id=55382},
            }
        },
        {
            id = "SFKTrash",
            name = L["Trash Mobs"].." "..BZ["Shadowfang Keep"],
            defaults = { dropRate = .07 },
            loot = {
                {id=2292},
                {id=1489},
                {id=1974},
                {id=2807},
                {id=1482},
                {id=1935},
                {id=1483},
                {id=1318},
                {id=3194},
                {id=2205},
                {id=1484},
                {},
                {id=41420, dropRate=10, container={55505}},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.ShadowfangKeep.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end