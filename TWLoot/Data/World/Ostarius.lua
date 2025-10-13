---
--- Ostarius.lua - Ostarius world boss loot data
---
--- This module contains comprehensive loot data for Ostarius, a special
--- world boss encounter. It includes unique drops, rare equipment,
--- and boss-specific rewards from this elite encounter.
---
--- Features:
--- • Complete Ostarius loot table
--- • Rare and epic drops
--- • Boss-specific equipment
--- • Unique world boss rewards
--- • Encounter mechanics data
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- World bosses data
AtlasTW.InstanceData.Ostarius = {
    Name = BB["Ostarius"],
    Location = BZ["Tanaris"],
    Level = { 1, 60 },
    Acronym = "Ostarius",
    MaxPlayers = 40,
    DamageType = L["Arcane"],
    Bosses = {
        {
            id = "WBOstarius",
            prefix = "1)",
            name = BB["Ostarius"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 83530 }, -- Turban of Veiled Mists
                { id = 83531 }, -- Clutch of Mending Winds
                { id = 83486 }, -- Sandstalker's Shroud
                { id = 83488 }, -- Uldum Construct Stompers
                { id = 83485 }, -- Fists of the Makers
                { id = 83487 }, -- Blade of the Fallen Star
                {},
                { id = 83483 }, -- Crown of Divine Justice
                { id = 83532 }, -- Bracers of the Crescent Moon
                { id = 83484 }, -- Desert Wind Talisman
                { id = 83482 }, -- Distress Signal Pulser
                { id = 83481 }, -- Failsafe Activation Key
                { id = 83480 }, -- Tome of Infalliable Truth
                {},
                { id = 83235, dropRate = 100 }, -- Ancient Locking Mechanism
                { id = 17962, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 3864, 55251, 55250, 7910, 7909, 1529, 12361 } }, -- Blue Sack of Gems
                { id = 17963, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12364 } }, -- Green Sack of Gems
                { id = 17965, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12363 } }, -- Yellow Sack of Gems
                { id = 17969, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12799 } }, -- Red Sack of Gems
}
}
}
}

-- Item initialization for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Ostarius.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
