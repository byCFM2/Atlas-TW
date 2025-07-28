-- Gnomeregan Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.GnomereganEnt = {
    Name = BZ["Gnomeregan"].." ("..L["Entrance"]..")" ,
    Location = BZ["Dun Morogh"],
    Acronym = "Gnome",
    Entrances = {
        { letter = "A", info = L["Entrance"] },
        { letter = "B", info = BZ["Gnomeregan"] .. " (" .. L["Front"] .. ")" },
        { letter = "C", info = BZ["Gnomeregan"] .. " (" .. L["Back"] .. ")" },
    },
    Bosses = {
        {
            id = "GNElevator",
            prefix = "1)",
            name = L["Elevator"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNTranspolyporter",
            prefix = "2)",
            name = L["Transpolyporter"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNSprok",
            name = L["Sprok"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNPunchographA",
            prefix = "3)",
            name = L["Matrix Punchograph 3005-A"],
            loot = {
                {id=9280, disc=L["Quest Item"]},
            }
        },
        {
            id = "GNNamdoBizzfizzle",
            name = BB["Namdo Bizzfizzle"],
            loot = {
                {id=14639, disc=L["Engineering"]},
            }
        },
        {
            id = "GNTechbot",
            prefix = "4)",
            name = BB["Techbot"],
            defaults = { dropRate = 69 },
            loot = {
                {id=9444},
                {},
                {id=9277, dropRate=100, disc=L["Quest Item"]},
            }
        },
        {
            id = "GNOutsideTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 15 },
            loot = {
                {id=9279, disc=L["Quest Item"]},
            }
        },
    }
}

AtlasTW.InstanceData.Gnomeregan = {
    Name = BZ["Gnomeregan"],
    Location = BZ["Dun Morogh"],
    Level = {29,38},
    Acronym = "Gnome",
    MaxPlayers = 5,
    DamageType = L["Radiation"],
    Entrances = {
        { letter = "A", info = L["Front"] },
        { letter = "B", info = L["Back"] }
    },
    Keys = {
        { name = L["Workshop Key"], loot = "VanillaKeys", info = L["Back"] }
    },

    Bosses = {
        {
            id = "GNBlastmasterEmi",
            prefix = "1)",
            name = L["Blastmaster Emi Shortfuse"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNGrubbis",
            name = BB["Grubbis"],
            defaults = { dropRate = 33 },
            loot = {
                {id=9445, dropRate=10},
                {},
                {id=80737, dropRate=30},
                {id=80738, dropRate=35},
                {id=80739, dropRate=35},
            }
        },
        {
            id = "GNChomper",
            name = L["Chomper"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNCleanRoom",
            prefix = "2)",
            name = L["Clean Room"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNTinkSprocketwhistle",
            name = L["Tink Sprocketwhistle"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNSparklematic",
            name = L["The Sparklematic 5200"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNMailBox",
            name = L["Mail Box"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNKernobee",
            prefix = "3)",
            name = L["Kernobee"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNAlarmabomb",
            name = L["Alarm-a-bomb 2600"],
            color = "|cff9d9d9d"
        },
        {
            id = "GNPunchographB",
            name = L["Matrix Punchograph 3005-B"],
            loot = {
                {id=9282, disc=L["Quest Item"]},
            }
        },
        {
            id = "GNViscousFallout",
            prefix = "4)",
            name = BB["Viscous Fallout"],
            defaults = { dropRate = 33 },
            loot = {
                {id=9454},
                {id=9453},
                {id=9452},
            }
        },
        {
            id = "GNElectrocutioner6000",
            prefix = "5)",
            name = BB["Electrocutioner 6000"],
            defaults = { dropRate = 33 },
            loot = {
                {id=9447},
                {id=9446},
                {id=9448},
                {},
                {id=6893, disc=L["Key"]},
            }
        },
        {
            id = "GNPunchographC",
            name = L["Matrix Punchograph 3005-C"],
            loot = {
                {id=9281, disc=L["Quest Item"]},
            }
        },
        {
            id = "GNCrowdPummeler960",
            prefix = "6)",
            name = BB["Crowd Pummeler 9-60"],
            postfix = L["Upper"],
            defaults = { dropRate = 33 },
            loot = {
                {id=9449},
                {id=9450},
                {},
                {id=80740},
                {},
                {id=81275, dropRate=0.8, disc=L["Quest Item"]},
            }
        },
        {
            id = "GNPunchographD",
            name = L["Matrix Punchograph 3005-D"],
            loot = {
                {id=9316, disc=L["Quest Item"]},
            }
        },
        {
            id = "GNDIAmbassador",
            prefix = "7)",
            name = BB["Dark Iron Ambassador"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=9455},
                {id=9456},
                {id=9457},
            }
        },
        {
            id = "GNMekgineerThermaplugg",
            prefix = "8)",
            name = BB["Mekgineer Thermaplugg"],
            defaults = { dropRate = 25 },
            loot = {
                {id=9492},
                {id=9461},
                {id=9458},
                {id=9459},
                {},
                {id=60098, dropRate=50, disc=L["Quest Item"]},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=4415, dropRate=2, disc=L["Engineering"]},
                {id=4393, disc=L["Crafted Item"]},
                {},
                {id=4413, dropRate=2, disc=L["Engineering"]},
                {id=4388, disc=L["Crafted Item"]},
                {},
                {id=4411, dropRate=2, disc=L["Engineering"]},
                {id=4376, disc=L["Crafted Item"]},
                {},
                {id=7742, dropRate=2, disc=L["Engineering"]},
                {id=4397, disc=L["Crafted Item"]},
                {},
                {id=51801, dropRate=4, disc=L["Engineering"]},
                {id=60098, disc=L["Crafted Item"]},
                {},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "GNTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0.04 },
            loot = {
                {id=9508},
                {id=9491},
                {id=9509},
                {id=9510},
                {id=9487},
                {id=9485},
                {id=9488},
                {id=9486},
                {id=9490},
                {id=80798},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Gnomeregan.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.GnomereganEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end