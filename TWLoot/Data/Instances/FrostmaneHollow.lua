---
--- Frostmane Hollow.lua - Frostmane Hollow instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Frostmane Hollow
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
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI
local LB = AtlasTW.Localization.Bosses
local LZ = AtlasTW.Localization.Zones
local LIS = AtlasTW.Localization.ItemSets
local LMD = AtlasTW.Localization.MapData

local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.FrostmaneHollow = {
    Name = LZ["Frostmane Hollow"],
    Location = LZ["Dun Morogh"],
    Level = { 13, 20 },
    Acronym = "FH",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"] },
    },
    Bosses = {
        {
            id = "FHTanshaTheSleek",
            prefix = "1)",
            name = LB["Tan'sha The Sleek"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 184 }, -- Oboka's Axe
                { id = 197 }, -- Vest of the Beastkeeper
            }
        },
        {
            id = "FHHandlerOboka",
            name = LB["Handler Oboka"],
        },
        {
            id = "FHBattlemasterUbukaz",
            prefix = "2)",
            name = LB["Battlemaster Ubukaz"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 150 }, -- Tribal War Gauntlets
            }
        },
        {
            id = "FHKanzaTheSeer",
            prefix = "3)",
            name = LB["Kan'za The Seer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 205 }, -- Frost Seer Dirk
            }
        },
        {
            id = "FHHailarTheFrigid",
            prefix = "4)",
            name = LB["Hailar The Frigid"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 116 }, -- Belt of Binding
                { id = 126 }, -- Band of Hailar
            }
        },
        {
            id = "FHTrash",
            name = L["Trash Mobs"].."-"..LZ["Frostmane Hollow"],
            defaults = { dropRate = .1 },
            loot = {
            }
        },
       -- { name = LIS["Stormreaver Attire"], items = "Stormreaver" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.FrostmaneHollow.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end