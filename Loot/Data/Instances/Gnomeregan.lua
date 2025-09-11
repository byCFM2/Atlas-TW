---
--- Gnomeregan.lua - Gnomeregan dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Gnomeregan
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Rare and uncommon item drops
--- • Dungeon entrance and layout data
--- • Level-appropriate loot organization
--- • Quest reward items
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

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
            name = L["Meeting Stone"],
            color = "|cff6666ff",
},
        {
            id = "GNElevator",
            prefix = "1)",
            name = L["Elevator"],
            color = "|cff9d9d9d",
},
        {
            id = "GNTranspolyporter",
            prefix = "2)",
            name = L["Transpolyporter"],
            color = "|cff9d9d9d",
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
                { id = 9280 }, -- Yellow Punch Card
}
},
        {
            id = "GNNamdoBizzfizzle",
            name = BB["Namdo Bizzfizzle"],
            loot = {
                { id = 14639, container = { 4381 } }, -- Schematic: Minor Recombobulator
}
},
        {
            id = "GNTechbot",
            prefix = "4)",
            name = BB["Techbot"],
            loot = {
                { id = 9444, dropRate = 69 }, -- Techbot CPU Shell
                {},
                { id = 9277, dropRate = 100 }, -- Techbot's Memory Core
                { id = 9309, dropRate = 100, container = { 9608, 9609 } }, -- Robo-mechanical Guts
}
},
        {
            id = "GNOutsideTrash",
            name = L["Trash Mobs"].."-"..BZ["Gnomeregan"],
            loot = {
                { id = 9279, dropRate = 15, container = { 9280 } }, -- White Punch Card
}
},
}
}

AtlasTW.InstanceData.Gnomeregan = {
    Name = BZ["Gnomeregan"],
    Location = BZ["Dun Morogh"],
    Level = { 19, 38 },
    Acronym = "Gnome",
    MaxPlayers = 5,
    DamageType = L["Nature"],
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
            defaults = { dropRate = 25 },
            loot = {
                { id = 9445 }, -- Grubbis Paws
                {},
                { id = 80737 }, -- Irradiated Ring
                { id = 80738 }, -- Basilisk Scale Boots
                { id = 80739 }, -- Rockbiter
                {},
                { id = 9308, disc = L["Quest Item"], dropRate = 15, container = { 9363 } }, -- Grime-Encrusted Object
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
                { id = 9282 }, -- Blue Punch Card
}
},
        {
            id = "GNViscousFallout",
            prefix = "4)",
            name = BB["Viscous Fallout"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 9454 }, -- Acidic Walkers
                { id = 9453 }, -- Toxic Revenger
                { id = 9452 }, -- Hydrocane
}
},
        {
            id = "GNElectrocutioner6000",
            prefix = "5)",
            name = BB["Electrocutioner 6000"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 9447 }, -- Electrocutioner Lagnut
                { id = 9446 }, -- Electrocutioner Leg
                { id = 9448 }, -- Spidertank Oilrag
                {},
                { id = 6893, disc = L["Key"] }, -- Workshop Key
}
},
        {
            id = "GNPunchographC",
            name = L["Matrix Punchograph 3005-C"],
            loot = {
                { id = 9281 }, -- Red Punch Card
}
},
        {
            id = "GNCrowdPummeler960",
            prefix = "6)",
            name = BB["Crowd Pummeler 9-60"],
            postfix = L["Upper"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 9449 }, -- Manual Crowd Pummeler
                { id = 9450 }, -- Gnomebot Operating Boots
                {},
                { id = 80740 }, -- Pummeler Gauntlet
                {},
                { id = 9327, dropRate = 1 }, -- Security DELTA Data Access Card
                { id = 9309, quantity = { 8, 10 }, dropRate = 5, container = { 9608, 9609 } }, -- Robo-mechanical Guts
                { id = 81275, dropRate = .8, container = { 81253, 81252, 81251, 81250 } }, -- Intact Pounder Mainframe
}
},
        {
            id = "GNPunchographD",
            name = L["Matrix Punchograph 3005-D"],
            loot = {
                { id = 9316 }, -- Prismatic Punch Card
}
},
        {
            id = "GNDIAmbassador",
            prefix = "7)",
            name = BB["Dark Iron Ambassador"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 9455 }, -- Emissary Cuffs
                { id = 9456 }, -- Glass Shooter
                { id = 9457 }, -- Royal Diplomatic Scepter
                {},
                { id = 9308, disc = L["Quest Item"], dropRate = 15, container = { 9363 } }, -- Grime-Encrusted Object
}
},
        {
            id = "GNMekgineerThermaplugg",
            prefix = "8)",
            name = BB["Mekgineer Thermaplugg"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 9492 }, -- Electromagnetic Gigaflux Reactivator
                { id = 9461, disc = L["Random stats"] }, -- Charged Gear
                { id = 9458 }, -- Thermaplugg's Central Core
                { id = 9459 }, -- Thermaplugg's Left Arm
                {},
                { id = 60098, dropRate = 50, disc = L["Quest Item"] }, -- Hypertech Battery Pack
                {},
                { id = 4415, dropRate = 2, container = { 4393 } }, -- Schematic: Craftsman's Monocle
                { id = 4413, dropRate = 2, container = { 4388 } }, -- Schematic: Discombobulator Ray
                { id = 4411, dropRate = 2, container = { 4376 } }, -- Schematic: Flame Deflector
                { id = 7742, dropRate = 2, container = { 4397 } }, -- Schematic: Gnomish Cloaking Device
                { id = 40084, dropRate = 4, container = { 41328 } }, -- Schematic: Precision Jewelers Kit
                { id = 51801, dropRate = 4, container = { 60098 } }, -- Schematic: Hypertech Battery Pack
                {},
                { id = 9327, dropRate = 1 }, -- Security DELTA Data Access Card
                { id = 9299, dropRate = 100, container = { 9623, 9624, 9625 } }, -- Thermaplugg's Safe Combination
                { id = 81318, dropRate = 100, container = { 81319, 81320 } }, -- Megaflux Capacitor
                { id = 9309, quantity = { 8, 10 }, dropRate = 5, container = { 9608, 9609 } }, -- Robo-mechanical Guts
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
}
},
        {
            id = "GNTrash",
            name = L["Trash Mobs"].." "..BZ["Gnomeregan"],
            defaults = { dropRate = .1 },
            loot = {
                { id = 9508 }, -- Mechbuilder's Overalls
                { id = 9491 }, -- Hotshot Pilot's Gloves
                { id = 9509 }, -- Petrolspill Leggings
                { id = 9510 }, -- Caverndeep Trudgers
                { id = 9487 }, -- Hi-tech Supergun
                { id = 9485 }, -- Vibroblade
                { id = 9488 }, -- Oscillating Power Hammer
                { id = 9486 }, -- Supercharger Battle Axe
                { id = 9490 }, -- Gizmotron Megachopper
                { id = 80798 }, -- Charged Servo Arm
                {},
                { id = 9308, disc = L["Quest Item"], dropRate = 15, container = { 9363 } }, -- Grime-Encrusted Object
}
},
},
}


for _, bossData in ipairs(AtlasTW.InstanceData.Gnomeregan.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil 
end


for _, bossData in ipairs(AtlasTW.InstanceData.GnomereganEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil 
end
