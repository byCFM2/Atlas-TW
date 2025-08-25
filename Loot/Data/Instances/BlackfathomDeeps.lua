-- BlackfathomDeeps Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.BlackfathomDeepsEnt = {
    Name = BZ["Blackfathom Deeps"] .. " (" .. L["Entrance"] .. ")",
    Acronym = "BFD",
    Location = BZ["Ashenvale"],
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = BZ["Blackfathom Deeps"] }
    },
    Bosses = {}
}

AtlasTW.InstanceData.BlackfathomDeeps = {
    Name = BZ["Blackfathom Deeps"],
    Location = BZ["Ashenvale"],
    Level = {19,32},
    Acronym = "BFD",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Bosses = {
        {
            id = "BFDGhamoora",
            prefix = "1)",
            name = BB["Ghamoo-ra"],
            loot = {
                {id=6907, dropRate=50},
                {id=6908, dropRate=50},
                {},
                {id=80718, dropRate=35},
            }
        },
        {
            id = "BFDLorgalisManuscript",
            prefix = "a)",
            name = L["Lorgalis Manuscript"],
            color = "|cff00FF00",
        },
        {
            id = "BFDLadySarevess",
            prefix = "2)",
            name = BB["Lady Sarevess"],
            defaults = { dropRate = 33 },
            loot = {
                {id=888},
                {},
                {id=3078},
                {id=11121},
                {},
                {id=5952, dropRate=80, container={7003,7004}},
            }
        },
        {
            id = "BFDArgentGuardThaelrid",
            prefix = "b)",
            name = L["Argent Guard Thaelrid"],
            color = "|cff00FF00",
        },
        {
            id = "BFDGelihast",
            prefix = "3)",
            name = BB["Gelihast"],
            loot = {
                {id=6906, dropRate=50},
                {id=6905, dropRate=50},
                {},
                {id=80720, dropRate=35},
                {},
                {id=1470, dropRate=15},
            }
        },
        {
            id = "BFDShrineofGelihast",
            name = L["Shrine of Gelihast"],
            color = "|cff9d9d9d",
        },
        {
            id = "BFDLorgusJett",
            prefix = "c)",
            name = BB["Lorgus Jett"],
            postfix = L["Varies"],
            color = "|cff00FF00",
        },
        {
            id = "BFDVelthelaxxtheDefiler",
            prefix = "4)",
            name = BB["Velthelaxx the Defiler"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58120 }, --Cowl of Whispering Shadows
                { id = 58121 }, --Totem of the Corrupted Current
                { id = 58122 }, --Bracers of Sinister Rites
                { id = 58123 }, --Felhoof Sabatons
            }
        },
        {
            id = "BFDBaronAquanis",
            prefix = "5)",
            name = BB["Baron Aquanis"],
            loot = {
                {id=16782, dropRate=100, container={16886,16887}},
            }
        },
        {
            id = "BFDFathomStone",
            name = L["Fathom Stone"],
            loot = {
                {id=16762, dropRate=100},
            }
        },
        {
            id = "BFDTwilightLordKelris",
            prefix = "6)",
            name = BB["Twilight Lord Kelris"],
            loot = {
                {id=1155, dropRate=50},
                {id=6903, dropRate=35},
                {id=80719, dropRate=15},
                {},
                {id=5881, dropRate=100, container={7001,7002}},
            }
        },
        {
            id = "BFDOldSerrakis",
            prefix = "7)",
            name = BB["Old Serra'kis"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6901},
                {id=6902},
                {},
                {id=6904},
            }
        },
        {
            id = "BFDAkumai",
            prefix = "8)",
            name = BB["Aku'mai"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6911},
                {id=6910},
                {},
                {id=6909},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "BFDMorridune",
            name = L["Morridune"],
            color = "|cff9d9d9d",
        },
        {
            id = "BFDAltaroftheDeeps",
            name = L["Altar of the Deeps"],
            color = "|cff9d9d9d",
        },
        {
            id = "BFDTrash",
            name = L["Trash Mobs"].."-"..BZ["Blackfathom Deeps"],
            defaults = { dropRate = .1 },
            loot = {
                {id=1486},
                {id=3416},
                {id=1491},
                {id=3414},
                {id=1454},
                {id=1481},
                {id=2567},
                {id=3413},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.BlackfathomDeeps.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end