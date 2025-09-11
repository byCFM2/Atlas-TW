---
--- RazorfenDowns.lua - Razorfen Downs dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Razorfen Downs
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Mid-level dungeon item drops
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

AtlasTW.InstanceData.RazorfenDowns = {
    Name = BZ["Razorfen Downs"],
    Location = BZ["The Barrens"],
    Level = { 25, 46 },
    Acronym = "RFD",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] }
},

    Bosses = {
        {
            id = "RFDTutenkash",
            prefix = "1)",
            name = BB["Tuten'kash"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 10776 }, -- Silky Spider Cape
                { id = 10775 }, -- Carapace of Tuten'kash
                { id = 10777 }, -- Arachnid Gloves
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
}
},
        {
            id = "RFDHenryStern",
            prefix = "2)",
            name = L["Henry Stern"],
            loot = {
                { id = 3826, disc = L["Consumable"] }, -- Mighty Troll's Blood Potion
                { id = 10841, disc = L["Consumable"] }, -- Goldthorn Tea
}
},
        {
            id = "RFDBelnistrasz",
            name = L["Belnistrasz"],
            color = "|cff9d9d9d",
},
        {
            id = "RFDSahrhee",
            name = L["Sah'rhee"],
            color = "|cff9d9d9d",
},
        {
            id = "RFDLadyF",
            name = BB["Lady Falther'ess"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 23178 }, -- Mantle of Lady Falther'ess
                { id = 23177 }, -- Lady Falther'ess' Finger
}
},
        {
            id = "RFDPlaguemaw",
            prefix = "3)",
            name = BB["Plaguemaw the Rotting"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 10766 }, -- Plaguerot Sprig
                { id = 10760 }, -- Swine Fists
                {},
                { id = 80744 }, -- Plaguemaw's Staff of Rotting
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
}
},
        {
            id = "RFDMordreshFireEye",
            prefix = "4)",
            name = BB["Mordresh Fire Eye"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 10769 }, -- Glowing Eye of Mordresh
                { id = 10771 }, -- Deathmage Sash
                { id = 10770 }, -- Mordresh's Lifeless Skull
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
}
},
        {
            id = "RFDGlutton",
            prefix = "5)",
            name = BB["Glutton"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 10774 }, -- Fleshhide Shoulders
                { id = 10772 }, -- Glutton's Cleaver
                {},
                { id = 80745 }, -- Abomination Crossbow
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
}
},
        {
            id = "RFDRakameg",
            prefix = "6)",
            name = BB["Death Prophet Rakameg"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58172 }, -- Thornspine
                { id = 58173 }, -- Thorngorged Fleshgloves
                { id = 58174 }, -- Totem of the Rotten Roots
                { id = 58175 }, -- Blood-etched Fetish
                
}
},
        {
            id = "RFDRagglesnout",
            prefix = "7)",
            name = BB["Ragglesnout"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 10768 }, -- Boar Champion's Belt
                { id = 10767 }, -- Savage Boar's Guard
                { id = 10758 }, -- X'caliboar
}
},
        {
            id = "RFDAmnennar",
            prefix = "8)",
            name = BB["Amnennar the Coldbringer"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 10763 }, -- Icemetal Barbute
                { id = 10762 }, -- Robes of the Lich
                { id = 10764 }, -- Deathchill Armor
                { id = 10761 }, -- Coldrage Dagger
                { id = 10765 }, -- Bonefingers
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
}
},
        {
            id = "RFDTrash",
            name = L["Trash Mobs"].."-"..BZ["Razorfen Downs"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 10574 }, -- Corpseshroud
                { id = 10581, dropRate = .02 }, -- Death's Head Vestment
                { id = 10583 }, -- Quillward Harness
                { id = 10584, dropRate = .02 }, -- Stormgale Fists
                { id = 10578 }, -- Thoughtcast Boots
                { id = 10582, dropRate = .02 }, -- Briar Tredders
                { id = 10572 }, -- Freezing Shard
                { id = 10567, dropRate = .02 }, -- Quillshooter
                { id = 10571 }, -- Ebony Boneclub
                { id = 10570 }, -- Manslayer
                { id = 10573 }, -- Boneslasher
}
},
},
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.RazorfenDowns.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
