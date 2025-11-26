---
--- LordKazzak.lua - Lord Kazzak world boss loot data
---
--- This module contains comprehensive loot data for Lord Kazzak, the demon
--- world boss located in the Blasted Lands. It includes rare drops,
--- epic equipment, and unique demonic items.
---
--- Features:
--- • Complete Lord Kazzak loot table
--- • Rare and epic drops
--- • Demonic-themed equipment
--- • Unique world boss rewards
--- • Respawn timer information
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LB = AtlasTW.Localization.Bosses
local LS = AtlasTW.Localization.Spells

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- World boss Lord Kazzak data
AtlasTW.InstanceData.LordKazzak = {
    Name = LB["Lord Kazzak"],
    Location = LZ["Blasted Lands"],
    Level = { 1, 60 },
    Acronym = "LK",
    MaxPlayers = 40,
    DamageType = L["Shadow"],
    Bosses = {
        {
            id = "WBLordKazzak",
            prefix = "1)",
            name = LB["Lord Kazzak"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 18546 }, -- Infernal Headcage
                { id = 17112 }, -- Empyrean Demolisher
                { id = 18204 }, -- Eskhandar's Pelt
                { id = 18543 }, -- Ring of Entropy
                { id = 19133 }, -- Fel Infused Leggings
                {},
                { id = 17111 }, -- Blazefury Medallion
                { id = 19135 }, -- Blacklight Bracer
                { id = 18544 }, -- Doomhide Gauntlets
                { id = 19134 }, -- Flayed Doomguard Belt
                { id = 17113 }, -- Amberseal Keeper
                {},
                { id = 17682, disc = L["Book"], dropRate = 6 }, -- Book: Gift of the Wild
                { id = 17683, disc = L["Book"], dropRate = 4 }, -- Book: Gift of the Wild II
                { id = 18600, disc = L["Book"], dropRate = 4 }, -- Tome of Arcane Brilliance
                { id = 17962, disc = L["Container"], dropRate = 8, container = { 13926, 7971, 3864, 55251, 55250, 7910, 7909, 1529, 12361 } }, -- Blue Sack of Gems
                { id = 17963, disc = L["Container"], dropRate = 12, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12364 } }, -- Green Sack of Gems
                { id = 17964, disc = L["Container"], dropRate = 16, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12800 } }, -- Gray Sack of Gems
                { id = 17969, disc = L["Container"], dropRate = 13, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12799 } }, -- Red Sack of Gems
                {},
                { id = 18665, dropRate = 100, container = { 18608, 18609 } }, -- The Eye of Shadow
                {},
                { id = 70164, LS["Gemology"], dropRate = 2, container = { 56017 } }, -- Plans: Tempered Azerothian Gemstone
                { id = 70169, LS["Gemology"], dropRate = 2, container = { 56010 } }, -- Plans: Beautiful Diamond Gemstone
                { id = 14479, dropRate = 4, container = { 14101 } }, -- Pattern: Brightcloth Gloves
                { id = 83545, dropRate = 40, container = { 65003 } }, -- Pattern: Robe of Sacrifice
}
}
}
}

-- Item initialization for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.LordKazzak.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end