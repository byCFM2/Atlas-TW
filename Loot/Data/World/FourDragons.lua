---
--- FourDragons.lua - Emerald Dragons world boss loot data
---
--- This module contains comprehensive loot data for the four Emerald Dragons
--- world bosses: Lethon, Emeriss, Taerar, and Ysondre. It includes shared
--- loot tables, unique drops, and dragon-specific equipment.
---
--- Features:
--- • Complete four dragon loot tables
--- • Shared and unique drops
--- • Emerald dragon equipment
--- • Nature-themed items
--- • Respawn timer information
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local ShareLoot = {
    {},
    -- Shared dragon items (11% chance)
    { id = 20579, dropRate = 11 }, -- Green Dragonskin Cloak
    { id = 20615, dropRate = 11 }, -- Dragonspur Wraps
    { id = 20616, dropRate = 11 }, -- Dragonbone Wristguards
    { id = 20618, dropRate = 11 }, -- Gloves of Delusional Power
    { id = 20617, dropRate = 11 }, -- Ancient Corroded Leggings
    { id = 20619, dropRate = 11 }, -- Acid Inscribed Greaves
    { id = 20582, dropRate = 11 }, -- Trance Stone
    { id = 20644, dropRate = 100, container = { 20600 } }, -- Nightmare Engulfed Object
    {},
    { id = 17962, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 3864, 55251, 55250, 7910, 7909, 1529, 12361 } }, -- Blue Sack of Gems
    { id = 17963, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12364 } }, -- Green Sack of Gems
    { id = 17964, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12800 } }, -- Gray Sack of Gems
    { id = 17965, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12363 } }, -- Yellow Sack of Gems
    { id = 17969, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12799, 6332 } }, -- Red Sack of Gems
    -- Rare items (shared for all dragons)
    {},
    { id = 20580, dropRate = 8.93 }, -- Hammer of Bestial Fury
    { id = 20581, dropRate = 9.70 }, -- Staff of Rampant Growth
    {},
    { id = 20381, disc = L["Reagent"], dropRate = 100 }, -- Dreamscale
}
-- Emerald dragons data
AtlasTW.InstanceData.FourDragons = {
    Name = L["Emerald Dragons"],
    Location = L["Various Locations"],
    Level = { 1, 60 },
    Acronym = "ED",
    MaxPlayers = 40,
    DamageType = L["Nature"]..", ".. L["Shadow"],
    Bosses = {
        {
            id = "WBLethon",
            prefix = "1)",
            name = BB["Lethon"],
            postfix = BZ["Duskwood"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 20628 }, -- Deviate Growth Cap
                { id = 20626 }, -- Black Bark Wristbands
                { id = 20630 }, -- Gauntlets of the Shining Light
                { id = 20625 }, -- Belt of the Dark Bog
                { id = 20627 }, -- Dark Heart Pants
                { id = 20629 }, -- Malignant Footguards
                { id = 65102 }, -- Hood of Delusional Power
                unpack(ShareLoot)
}
},
        {
            id = "WBEmeriss",
            prefix = "2)",
            name = BB["Emeriss"],
            postfix = BZ["The Hinterlands"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 20623 }, -- Circlet of Restless Dreams
                { id = 20622 }, -- Dragonheart Necklace
                { id = 20624 }, -- Ring of the Unliving
                { id = 20621 }, -- Boots of the Endless Moor
                { id = 20599 }, -- Polished Ironwood Crossbow
                { id = 65100 }, -- Dragonspur Boots
                { id = 65101 }, -- Dragonbone Waistguard
                unpack(ShareLoot)
}
},
        {
            id = "WBTaerar",
            prefix = "3)",
            name = BB["Taerar"],
            postfix = BZ["Feralas"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 20633 }, -- Unnatural Leather Spaulders
                { id = 20631 }, -- Mendicant's Slippers
                { id = 20634 }, -- Boots of Fright
                { id = 20632 }, -- Mindtear Band
                { id = 20577 }, -- Nightmare Blade
                { id = 65105 }, -- Scale of the Wakener
                {},
                unpack(ShareLoot)
}
},
        {
            id = "WBYsondre",
            prefix = "4)",
            name = BB["Ysondre"],
            postfix = BZ["Ashenvale"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 20637 }, -- Acid Inscribed Pauldrons
                { id = 20635 }, -- Jade Inlaid Vestments
                { id = 20638 }, -- Leggings of the Demented Mind
                { id = 20639 }, -- Strangely Glyphed Legplates
                { id = 20636 }, -- Hibernation Crystal
                { id = 20578 }, -- Emerald Dragonfang
                { id = 65103 }, -- Shell of the Great Sleeper
                unpack(ShareLoot)
}
},
        {
            id = "WBEDTrash",
            name = L["Trash Mobs"] .. " (" .. L["Emerald Dragons"] .. ")",
            loot = {
                { id = 21146, dropRate = 5 }, -- Fragment of the Nightmare's Corruption
                { id = 21147, dropRate = 5 }, -- Fragment of the Nightmare's Corruption
                { id = 21148, dropRate = 5 }, -- Fragment of the Nightmare's Corruption
                { id = 21149, dropRate = 100 }, -- Fragment of the Nightmare's Corruption
}
}
}
}

-- Item initialization for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.FourDragons.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
