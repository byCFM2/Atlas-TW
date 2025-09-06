-- TheStockade Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TheStockade = {
    Name = BZ["The Stockade"],
    Location = BZ["Stormwind City"],
    Level = { 15, 31 },
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
                { id = 80721 }, -- Heavy Prison Cuffs
                { id = 80722 }, -- Dreadskull Pauldrons
                {},
                { id = 3630, dropRate = 100, container = { 3400, 1317 } }, -- Head of Targorr
}
},
        {
            id = "SWStKamDeepfury",
            prefix = "2)",
            name = BB["Kam Deepfury"],
            loot = {
                { id = 2280, dropRate = 1 }, -- Kam's Walking Stick
                {},
                { id = 80723, dropRate = 90 }, -- Nail on a Plank
                {},
                { id = 3640, dropRate = 100, container = { 3562, 1264 } }, -- Head of Deepfury
}
},
        {
            id = "SWStHamhock",
            prefix = "3)",
            name = BB["Hamhock"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 80724 }, -- Cell Heater
                { id = 80725 }, -- Hamhock's Nose Ring
}
},
        {
            id = "SWStBazil",
            prefix = "4)",
            name = BB["Bazil Thredd"],
            loot = {
                { id = 80729, dropRate = 35 }, -- Standard Issue Tunic
                { id = 80730, dropRate = 35 }, -- Convict Moccasins
                { id = 80731, dropRate = 30 }, -- Runed Hookblade
                {},
                { id = 80796, dropRate = .05 }, -- Tattered Cloak of the Insurgency
                {},
                { id = 2909, dropRate = 80 }, -- Red Wool Bandana
                { id = 2926, dropRate = 100, container = { 2933 } }, -- Head of Bazil Thredd
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
}
},
        {
            id = "SWStDextren",
            prefix = "5)",
            name = BB["Dextren Ward"],
            loot = {
                { id = 80726, dropRate = 35 }, -- Gravedigger Boots
                { id = 80727, dropRate = 35 }, -- Broken Bottle
                { id = 80728, dropRate = 30 }, -- Stormwind Guard Spear
                {},
                { id = 80796, dropRate = .05 }, -- Tattered Cloak of the Insurgency
                {},
                { id = 2909, dropRate = 40 }, -- Red Wool Bandana
                { id = 3628, dropRate = 100, container = { 2033, 2906 } }, -- Hand of Dextren Ward
}
},
        {
            id = "SWStBruegalIronknuckle",
            prefix = "6)",
            name = BB["Bruegal Ironknuckle"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 3228 }, -- Jimmied Handcuffs
                { id = 2941 }, -- Prison Shank
                { id = 2942 }, -- Iron Knuckles
                {},
                { id = 2909, dropRate = 80 }, -- Red Wool Bandana
}
},
        {
            id = "SWStTrash",
            name = L["Trash Mobs"].."-"..BZ["The Stockade"],
            loot = {
                { id = 80796, dropRate = .05 }, -- Tattered Cloak of the Insurgency
                { id = 1076, dropRate = .6 }, -- Defias Renegade Ring
                {},
                { id = 2909, dropRate = 80 }, -- Red Wool Bandana
}
},
},
}


for _, bossData in ipairs(AtlasTW.InstanceData.TheStockade.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil 
end
