---
--- Reaver.lua - Dark Reaver of Karazhan world boss loot data
---
--- This module contains comprehensive loot data for the Dark Reaver of Karazhan,
--- a special world boss encounter. It includes unique drops, dark-themed
--- equipment, and boss-specific rewards from this elite encounter.
---
--- Features:
--- • Complete Dark Reaver loot table
--- • Dark-themed equipment
--- • Rare and epic drops
--- • Unique world boss rewards
--- • Karazhan-related items
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

-- World boss Dark Reaver of Karazhan data
AtlasTW.InstanceData.Reaver = {
    Name = BB["Dark Reaver of Karazhan"],
    Location = BZ["Deadwind Pass"],
    Level = { 1, 60 },
    Acronym = "Reaver",
    MaxPlayers = 40,
    DamageType = L["Shadow"],
    Bosses = {
        {
            id = "WBReaver",
            prefix = "1)",
            name = BB["Dark Reaver of Karazhan"],
            defaults = { dropRate = 4 },
            loot = {
                { id = 51778 }, -- Lost Crusader's Artifact
                { id = 51779 }, -- Greataxe of the Decrepit Crypt
                { id = 51780 }, -- Ghoulslayer Shotgun
                { id = 51796 }, -- Shield of Consuming Darkness
                { id = 51797 }, -- Claw of the Wildshifter
                { id = 51799 }, -- Libram of Veracity
                { id = 51800 }, -- Totem of Earthstorm
                { id = 51798 }, -- Idol of the Wildshifter
                { id = 51782 }, -- Mindpiercer Band
                {},
                {},
                { id = 51777 }, -- Necromancer's Visage
                { id = 51789 }, -- Circlet of Forlorn Spirits
                { id = 51781 }, -- Necrotic Wake Mantle
                { id = 51784 }, -- Belt of Archaic Power
                { id = 51788 }, -- Visage of the Forgotten
                { id = 51787 }, -- Spaulders of Insight
                { id = 51783 }, -- Shadowskin Bracers
                { id = 51776 }, -- Plagued Mind Leggings
                {},
                { id = 51786 }, -- Cryptbone Hauberk
                { id = 51785 }, -- Stoneslate Belt
                {},
                { id = 51769 }, -- Crown of the Dark Reaver
                { id = 51770 }, -- Shoulderguards of the Dark Reaver
                { id = 51771 }, -- Chestplate of the Dark Reaver
                { id = 51772 }, -- Grasp of the Dark Reaver
                { id = 51773 }, -- Girdle of the Dark Reaver
                { id = 51775 }, -- Legguards of the Dark Reaver
                { id = 51774 }, -- Sabatons of the Dark Reaver
}
}
}
}

-- Item initialization for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Reaver.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
