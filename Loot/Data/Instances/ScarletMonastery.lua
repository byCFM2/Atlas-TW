-- ScarletMonastery.lua - Данные предметов из Scarlet Monastery
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Scarlet Monastery Library
AtlasTW.InstanceData.ScarletMonasteryLibrary = {
    Name = BZ["Scarlet Monastery (Library)"],
    Location = BZ["Tirisfal Glades"],
    Level = {21,39},
    Acronym = "SM Lib",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Bosses = {
        {
            id = "SMHoundmasterLoksey",
            prefix = "1)",
            name = BB["Houndmaster Loksey"],
            defaults = { dropRate = 33 },
            loot = {
                {id=7710},
                {id=7756},
                {id=3456},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SMDoan",
            prefix = "2)",
            name = BB["Arcanist Doan"],
            defaults = { dropRate = 25 },
            loot = {
                {id=7714},
                {id=7713},
                {id=7712},
                {id=7711},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SMDoansBox",
            prefix = "1)",
            name = L["Doan's Strongbox"],
            color = "|cff66cc33",
            loot = {
                {id=7146, disc=L["Key"]},
            }
        },
        {
            id = "SMBrotherWystan",
            prefix = "3)",
            name = BB["Brother Wystan"],
            defaults = { dropRate = 25 },
            loot = {
                {id=55473},
                {id=55472},
                {id=55471},
                {id=55470},
            }
        },
        {
            id = "SMLTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=5819},
                {id=80790, dropRate=0.1},
                {id=7755},
                {id=7727},
                {id=7728},
                {id=80791, dropRate=0.02},
                {id=7759},
                {id=7760},
                {id=7754},
                {id=10332, dropRate=0.1},
                {id=1992},
                {id=2262},
                {id=7787},
                {id=7729},
                {id=7761},
                {id=7752},
                {id=8226},
                {id=7786},
                {id=5756},
                {id=7736},
                {id=8225},
                {id=7753},
                {id=7730},
                {id=7758},
                {id=7757},
                {id=80794, dropRate=0.02},
                {id=80799, dropRate=0.02},
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "SCARLET" },
    }
}

-- Данные Scarlet Monastery Armory
AtlasTW.InstanceData.ScarletMonasteryArmory = {
    Name = BZ["Scarlet Monastery (Armory)"],
    Location = BZ["Tirisfal Glades"],
    Level = {25,40},
    Acronym = "SM Arm",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Keys = {
        { name = L["The Scarlet Key"], loot = "VanillaKeys" }
    },
    Bosses = {
        {
            id = "SMHerod",
            prefix = "1)",
            name = BB["Herod"],
            defaults = { dropRate = 25 },
            loot = {
                {id=7719},
                {id=7718},
                {id=10330},
                {id=7717},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SMQuartermasterDaghelm",
            name = BB["Armory Quartermaster Daghelm"],
            defaults = { dropRate = 25 },
            loot = {
                {id=55477},
                {id=55476},
                {id=55475},
                {id=55474},
                {},
                {id=41411, container={7964, 7965}, dropRate=100},
            }
        },
        {
            id = "SMATrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=5819},
                {id=7755},
                {id=7727},
                {id=7728},
                {id=7759},
                {id=7754},
                {id=10332, dropRate=0.1},
                {id=1992},
                {id=2262},
                {id=7787},
                {id=7729},
                {id=7761},
                {id=7752},
                {id=8226},
                {id=7786},
                {id=5756},
                {id=7736},
                {id=8225},
                {id=80792},
                {id=7753},
                {id=7730},
                {id=7757},
                {},
                {id=10333, dropRate=1.6},
                {id=10329, dropRate=1.6},
                {},
                {id=23192, dropRate=1.6},
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "SCARLET" },
    }
}

-- Данные Scarlet Monastery Cathedral
AtlasTW.InstanceData.ScarletMonasteryCathedral = {
    Name = BZ["Scarlet Monastery (Cathedral)"],
    Location = BZ["Tirisfal Glades"],
    Level = {25,45},
    Acronym = "SM Cath",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Keys = {
        { name = L["The Scarlet Key"], loot = "VanillaKeys" }
    },
    Bosses = {
        {
            id = "SMFairbanks",
            prefix = "1)",
            name = BB["High Inquisitor Fairbanks"],
            defaults = { dropRate = 33 },
            loot = {
                {id=19507},
                {id=19508},
                {id=19509},
            }
        },
        {
            id = "SMMograine",
            prefix = "2)",
            name = BB["Scarlet Commander Mograine"],
            defaults = { dropRate = 25 },
            loot = {
                {id=7724},
                {id=10330},
                {id=7726},
                {id=7723},
                {},
                {id=51804, dropRate=8},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SMWhitemane",
            prefix = "3)",
            name = BB["High Inquisitor Whitemane"],
            defaults = { dropRate = 33 },
            loot = {
                {id=7720},
                {id=7722},
                {id=7721},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SMCTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=5819},
                {id=7755},
                {id=7727},
                {id=7728},
                {id=7759},
                {id=7760},
                {id=7754},
                {id=10332, dropRate=.1},
                {id=1992},
                {id=2262},
                {id=7787},
                {id=7729},
                {id=7761},
                {id=7752},
                {id=8226},
                {id=7786},
                {id=5756},
                {id=7736},
                {id=8225},
                {id=80792},
                {id=7753},
                {id=7730},
                {id=7758},
                {id=7757},
                {},
                {id=10328, dropRate=.3},
                {id=10331, dropRate=1.7},
                {id=10329, dropRate=1.6},
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "SCARLET" },
    }
}

-- Данные Scarlet Monastery Graveyard
AtlasTW.InstanceData.ScarletMonasteryGraveyard = {
    Name = BZ["Scarlet Monastery (Graveyard)"],
    Location = BZ["Tirisfal Glades"],
    Level = {25,36},
    Acronym = "SM GY",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Bosses = {
        {
            id = "SMVishas",
            prefix = "1)",
            name = BB["Interrogator Vishas"],
            defaults = { dropRate = 50 },
            loot = {
                {id=7682},
                {id=7683},
                {},
                {id=80741, dropRate=35},
                {id=80742, dropRate=35},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            name = L["Vorrel Sengutz"],
            color = "|cff9d9d9d",
        },
        {
            id = "SMScorn",
            prefix = "2)",
            name = BB["Scorn"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 33 },
            loot = {
                {id=23169},
                {id=23170},
                {id=23168},
            }
        },
        {
            id = "SMBloodmageThalnos",
            prefix = "3)",
            name = BB["Bloodmage Thalnos"],
            defaults = { dropRate = 50 },
            loot = {
                {id=7685},
                {id=7684},
                {},
                {id=80743, dropRate=35},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "SMIronspine",
            prefix = "1')",
            name = L["Ironspine"],
            postfix = L["Rare"],
            color = "|cff66cc33",
            defaults = { dropRate = 33 },
            loot = {
                {id=7688},
                {id=7687},
                {id=7686},
            }
        },
        {
            id = "SMAzshir",
            name = BB["Azshir the Sleepless"],
            postfix = L["Rare"],
            color = "|cff66cc33",
            defaults = { dropRate = 33 },
            loot = {
                {id=7709},
                {id=7708},
                {id=7731},
            }
        },
        {
            id = "SMFallenChampion",
            name = BB["Fallen Champion"],
            postfix = L["Rare"],
            color = "|cff66cc33",
            defaults = { dropRate = 33 },
            loot = {
                {id=7691},
                {id=7690},
                {id=7689},
            }
        },
        {
            id = "SMDukeDreadmoore",
            prefix = "4)",
            name = BB["Duke Dreadmoore"],
            defaults = { dropRate = 25 },
            loot = {
                {id=55388},
                {id=55386},
                {id=55387},
                {id=55389},
            }
        },
        {
            id = "SMGTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=5819},
                {id=7727},
                {id=7728},
                {id=80791, dropRate=.02},
                {id=7754},
                {id=10332, dropRate=.1},
                {id=2262},
                {id=7787},
                {id=7729},
                {id=7761},
                {id=7752},
                {id=8226},
                {id=7786},
                {id=7753},
                {id=7730},
                {id=80794, dropRate=.02},
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "SCARLET" },
    }
}

-- Данные Scarlet Monastery Entrance
AtlasTW.InstanceData.ScarletMonasteryEnt = {
    Name = BZ["Scarlet Monastery"] .. " (" .. L["Entrance"] .. ")",
    Location = BZ["Tirisfal Glades"],
    Acronym = "SM",
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Graveyard"] },
        { letter = "C) " .. L["Cathedral"] },
        { letter = "D) " .. L["Armory"] },
        { letter = "E) " .. L["Library"] }
    },
    Bosses = {}
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryLibrary.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryArmory.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryCathedral.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryGraveyard.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end