-- World_Bosses.lua - Item data for world bosses
-- Modular data structure for Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- World bosses data
AtlasTW.InstanceData.Azuregos = {
    Name = BB["Azuregos"],
    Location = BZ["Azshara"],
    Level = { 1, 60 },
    Acronym = "AZ",
    MaxPlayers = 40,
    DamageType = L["Frost"],
    Bosses = {
        {
            id = "WBAzuregos",
            prefix = "1)",
            name = BB["Azuregos"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 19132 }, -- Crystal Adorned Crown
                { id = 18208 }, -- Drape of Benediction
                { id = 18541, dropRate = 12 }, -- Puissant Cape
                { id = 18547 }, -- Unmelting Ice Girdle
                { id = 18545 }, -- Leggings of Arcane Supremacy
                { id = 19131 }, -- Snowblind Shoes
                { id = 19130 }, -- Cold Snap
                { id = 17070 }, -- Fang of the Mystics
                { id = 18202 }, -- Eskhandar's Left Claw
                { id = 18542 }, -- Typhoon
                {},
                { id = 18704, disc = L["Quest Item"], dropRate = 100, container = { 18714 } }, -- Mature Blue Dragon Sinew
                {},
                { id = 83544, dropRate = 40, container = { 65006 } }, -- Pattern: Stormscale Leggings
}
},
        {
            id = "WBSpiritA",
            name = L["Spirit of Azuregos"],
            loot = {
                 { id = 20949, container = { 21526, 21527 } }, -- Magical Ledger
}
}
}
}

-- Item initialization for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Azuregos.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
