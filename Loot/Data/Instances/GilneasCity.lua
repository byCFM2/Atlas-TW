---
--- GilneasCity.lua - Gilneas City instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Gilneas City
--- instance. It includes all boss encounters, rare drops,
--- and instance-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Rare and epic item drops
--- • Instance entrance and layout data
--- • Level-appropriate loot organization
--- • Quest reward items
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}


AtlasTW.InstanceData.GilneasCity = {
    Name = BZ["Gilneas City"],
    Location = BZ["Gilneas"],
    Level = { 43, 49 },
    Acronym = "GC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"] }
},
    Bosses = {
        {
            id = "GCMatthiasHoltz",
            prefix = "1)",
            name = BB["Matthias Holtz"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 61305 }, -- Darkwatch Pants
                { id = 61304 }, -- Gilneas Shackles
                { id = 61306 }, -- Worgen Hunter Grips
                {},
                { id = 61307, dropRate = 2 }, -- Worgen Hunter Musket
}
},
        {
            id = "GCPackmasterRagetooth",
            prefix = "2)",
            name = BB["Packmaster Ragetooth"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 61301 }, -- Shaderun Boots
                { id = 61300 }, -- Packmaster Gloves
                { id = 61302 }, -- Wolfheart Necklace
                {},
                { id = 61303, dropRate = 2 }, -- Orb of Aka'thar
}
},
        {
            prefix = "a)",
            name = L["Dawnstone Plans"],
            color = "|cff9d9d9d",
},
        {
            prefix = "b)",
            name = L["Manuscript of Hydromancy II"],
            color = "|cff9d9d9d",
},
        {
            id = "GCJudgeSutherland",
            prefix = "3)",
            name = BB["Judge Sutherland"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 61309 }, -- Mantle of Law
                { id = 61311 }, -- Sutherland's Cuffs
                { id = 61310 }, -- Sash of Conviction
                { id = 61308 }, -- Gavel of Gilnean Justice
                {},
                { id = 61312, dropRate = 2 }, -- The Black Pendant
}
},
        {
            id = "GCDustivanBlackcowl",
            prefix = "4)",
            name = BB["Dustivan Blackcowl"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 61331 }, -- Blackcowl Sash
                { id = 61332 }, -- Ring of Electrical Binding
                { id = 61330 }, -- Dagger of Sinister Secrets
                { id = 61333 }, -- Hookblade Cleaver
                {},
                { id = 61334, dropRate = 5 }, -- Cloak of the Dark Veil
                {},
                { id = 61626, dropRate = 100, container = { 61627, 61628, 61629, 61630 } }, -- Ebonmere Deed
                { id = 41357, dropRate = 100, container = { 70134 } }, -- Tarnished Citrine Choker
}
},
        {
            id = "GCMarshalMagnusGreystone",
            prefix = "5)",
            name = BB["Marshal Magnus Greystone"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 61313 }, -- Greymane Helmet
                { id = 61315 }, -- Band of Piercing Shadows
                { id = 61314 }, -- Marshal's Blocker
                { id = 61316 }, -- Chainlinked Cloak
                {},
                { id = 61317, dropRate = 5 }, -- Scriptures of Blood
                {},
                { id = 61368, dropRate = 5 }, -- Greymane Tabard
                {},
                { id = 113, dropRate = 5, container = { 151 } }, -- Plans: Truesilver Belt Buckle
}
},
        {
            id = "GCHorsemasterLevvin",
            prefix = "6)",
            name = BB["Horsemaster Levvin"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 61734 }, -- Horsemaster Belt
                { id = 61736 }, -- Horse Rustler Drape
                { id = 61735 }, -- Stablehand Broom
                { id = 61737 }, -- Stablemaster's Nightlight
                {},
                { id = 83157, dropRate = 0.18 }, -- Greymane Charger
}
},
        {
            id = "GCHarlowFamilyChest",
            prefix = "7)",
            name = L["Harlow Family Chest"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 61319 }, -- Regal Robes of the Regent
                { id = 61321 }, -- Wildfeather Bracers
                { id = 61320 }, -- Ashen Leggings
                { id = 61318 }, -- Fleshslasher
                {},
                { id = 61322, dropRate = 5 }, -- Resurging Necklace
}
},
        {
            id = "GCGennGreymane",
            prefix = "8)",
            name = BB["Genn Greymane"],
            defaults = { dropRate = 15 },
            loot = {
                { id = 61323 }, -- Swiftcaster's Chapeau
                { id = 61326 }, -- Robe of Light's Ambassador
                { id = 61327 }, -- Boots of Espionage
                { id = 61325 }, -- Regal Goldforged Breastplate
                { id = 61324 }, -- Greymane Shoulders
                { id = 61328 }, -- Wolfblood
                { id = 61329 }, -- Sack of Gruesome Eminence
                {},
                { id = 61406, dropRate = .5 }, -- Mark of the Worgen
                {},
                { id = 61738, dropRate = 6 }, -- Formula: Enchant Bracer - Vampirism
                { id = 69000, dropRate = 1.5 }, -- Gilnean Raven
                {},
                { id = 61352, dropRate = 100, container = { 61353, 61354, 61355 } }, -- Genn Greymane's Head
                { id = 61496, dropRate = 100, container = { 61497, 61498, 61499, 61369 } }, -- The Greymane Crown
}
},
        {
            id = "GCTrash",
            name = L["Trash Mobs"].."-"..BZ["Gilneas City"],
            defaults = { dropRate = .034 },
            loot = {
                { id = 61598 }, -- Wraps of the Pauper
                { id = 61336 }, -- Knife Juggler Gloves
                { id = 61597 }, -- Conspirator's Trickpockets
                { id = 61335 }, -- Dragonbane Pauldrons
                { id = 61339 }, -- Pauldrons of the Justicar
                {},
                { id = 61337 }, -- Libram of the Justicar
                {},
                { id = 61338 }, -- Staff of Ushered Ruination
                { id = 61596 }, -- Defender's Glaive
                {},
                { id = 41421, dropRate = 10, container = { 55505 } }, -- Darkpelt Blood
}
},
        { name = BIS["Greymane Armor"], items = "GreymaneArmor" },
},
}


for _, bossData in ipairs(AtlasTW.InstanceData.GilneasCity.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil 
end
