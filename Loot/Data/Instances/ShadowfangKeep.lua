-- ShadowfangKeep Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

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
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKFelSteed",
            prefix = "2)",
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
            color = "|cff9d9d9d",
            loot = {
                {id=6895, dropRate=100},
            }
        },
        {
            id = "SFKRazorclawtheButcher",
            prefix = "3)",
            name = BB["Razorclaw the Butcher"],
            defaults = { dropRate = 33 },
            loot = {
                {id=1292},
                {id=6226},
                {id=6633},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKSilverlaine",
            prefix = "4)",
            name = BB["Baron Silverlaine"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6321},
                {id=6323},
                {},
                {id=80715, dropRate=35},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKSpringvale",
            prefix = "5)",
            name = BB["Commander Springvale"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6320},
                {id=3191},
                {},
                {id=80717, dropRate=35},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKSever",
            prefix = "6)",
            name = BB["Sever"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 50 },
            loot = {
                {id=23173},
                {id=23171},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKOdotheBlindwatcher",
            prefix = "7)",
            name = BB["Odo the Blindwatcher"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6318},
                {id=6319},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKDeathswornCaptain",
            prefix = "8)",
            name = BB["Deathsworn Captain"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6642},
                {id=6641},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKFenrustheDevourer",
            prefix = "9)",
            name = BB["Fenrus the Devourer"],
            defaults = { dropRate = 50 },
            loot = {
                {id=6340},
                {id=3230},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKArugalsVoidwalker",
            name = BB["Archmage Arugal's Voidwalker"],
            color = "|cff9d9d9d",
            loot = {
                {id=5943, dropRate=3},
            }
        },
        {
            id = "SFKBookofUr",
            name = L["The Book of Ur"],
            color = "|cff9d9d9d",
            loot = {
                {id=6283, dropRate=100},
            }
        },
        {
            id = "SFKWolfMasterNandos",
            prefix = "10)",
            name = BB["Wolf Master Nandos"],
            defaults = { dropRate = 50 },
            loot = {
                {id=3748},
                {id=6314},
                {},
                {id=80716, dropRate=35},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKArchmageArugal",
            prefix = "11)",
            name = BB["Archmage Arugal"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6324},
                {id=6392},
                {id=6220},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKPrelate",
            prefix = "12)",
            name = BB["Prelate Ironmane"],
            defaults = { dropRate = 25 },
            loot = {
                {id=55385},
                {id=55384},
                {id=55383},
                {id=55382},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SFKTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0.01 },
            loot = {
                {id=2292},
                {id=1489},
                {id=1974, dropRate=0.02},
                {id=2807},
                {id=1482},
                {id=1935},
                {id=1483, dropRate=0.02},
                {id=1318},
                {id=3194, dropRate=0.02},
                {id=2205},
                {id=1484},
                {},
                {id=41420, disc=L["Quest Item"], dropRate=10},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.ShadowfangKeep.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end