---
--- TimbermawHold.lua - Timbermaw Hold instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Timbermaw Hold
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
local LZ = AtlasTW.Localization.Zones
local LIS = AtlasTW.Localization.ItemSets
local LMD = AtlasTW.Localization.MapData

local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TimbermawHold = {
    Name = LZ["Timbermaw Hold"],
    Location = LZ["Azshara"],
    Level = 60,
    Acronym = "TH",
    MaxPlayers = 20,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"].." "..LMD["Front"] },
    },
    Keys = {
       -- { name = LMD["Key to Stormwrought Castle"], loot = "VanillaKeys", info = "6+" },
    },
    Bosses = {--[[ 
        {
            id = "WHC",
            prefix = "1)",
            name = BB[""],
            defaults = { dropRate = 25 },
            loot = {
                { id = 58135 }, -- Dagger of Whispered Madness
                { id = 58136 }, -- Shadeweave Drape
                { id = 58137 }, -- Netherbranch
                { id = 58177 }, -- Stormreaver Robe
                {},
                { id = 41797, dropRate = 100, container = { 41798 } }, -- The Pendant of Uth'okk
            }
        },
        {
            prefix = "a)",
            name = L["Severs"],
            color = Colors.GREEN,
        },
        {
            id = "WHCTrash",
            name = L["Trash Mobs"].."-"..LZ["Windhorn Canyon"],
            defaults = { dropRate = .1 },
            loot = {
                { id = 70113, container = { 56040 } }, -- Plans: Gleaming Silver Necklace
                { id = 58178, dropRate = 1.35 }, -- Stormreaver Boots
                { id = 58131, dropRate = 1.35 }, -- Stormreaver Belt
                { id = 1992 }, -- Swampchill Fetish
                { id = 2262 }, -- Mark of Kern
                { id = 5756 }, -- Sliverblade
                { id = 5819 }, -- Sunblaze Coif
                { id = 7727 }, -- Watchman Pauldrons
                { id = 7728, dropRate = .04 }, -- Beguiler Robes
                { id = 7729 }, -- Chesterfall Musket
                { id = 7730 }, -- Cobalt Crusher
                { id = 7736 }, -- Fight Club
                { id = 7752 }, -- Dreamslayer
                { id = 7753 }, -- Bloodspiller
                { id = 7754, dropRate = .01 }, -- Harbinger Boots
                { id = 7755 }, -- Flintrock Shoulders
                { id = 7757 }, -- Windweaver Staff
                { id = 7759 }, -- Archon Chestpiece
                { id = 7760 }, -- Warchief Kilt
                { id = 7761 }, -- Steelclaw Reaver
                { id = 7786 }, -- Headsplitter
                { id = 7787 }, -- Resplendent Guardian
                { id = 8225 }, -- Tainted Pierce
                { id = 8226 }, -- The Butcher
                { id = 41941, dropRate = 70, disc = L["Quest Item"] }, -- Balorian Treasure
            }
        },
        { name = LIS["Stormreaver Attire"], items = "Stormreaver" },]]
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.TimbermawHold.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end