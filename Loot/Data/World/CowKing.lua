---
--- CowKing.lua - Cow King special boss loot data
---
--- This module contains loot data for the Cow King, a special easter egg
--- boss encounter. It includes unique drops, humorous items, and
--- special rewards from this hidden encounter.
---
--- Features:
--- • Complete Cow King loot table
--- • Easter egg items
--- • Humorous equipment
--- • Special encounter rewards
--- • Hidden boss mechanics
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

-- World bosses data
AtlasTW.InstanceData.CowKing = {
    Name = BB["Moo"],
    Location = BZ["Moomoo Grove"],
    Level = { 1, 60 },
    Acronym = "CowKing",
    MaxPlayers = 20,
    DamageType = L["Physical"],
    Bosses = {
        {
            id = "WBCowKing",
            prefix = "1)",
            name = BB["Moo"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 60486, dropRate = 25 }, -- Fishbringer
                {},
                { id = 60487, }, -- Cloak of the Moo Lord
                { id = 60488 }, -- Drape of the Herd
                { id = 60489 }, -- Cap of the Cow Savant
                { id = 60490 }, -- Cowskin Chapeau
                {},
                { id = 4144, disc = L["Book"], dropRate = 100 }, -- Tome of Polymorph: Cow
                {},
                { id = 60485, disc = L["Misc"], dropRate = 100 }, -- Sealed Diablo II Lord of Destruction Collectors Edition
                { id = 60491, disc = L["Misc"], dropRate = 100 }, -- The Moo Stone
                {},
                { id = 51261, dropRate = 100 }, -- Little Cow
}
}
}
}

-- Item initialization for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.CowKing.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
