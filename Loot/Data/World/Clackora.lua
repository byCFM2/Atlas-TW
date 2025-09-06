-- World_Bosses.lua - Item data for world bosses
local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- World bosses data
AtlasTW.InstanceData.Clackora = {
    Name = BB["Cla'ckora"],
    Location = BZ["Azshara"],
    Level = { 1, 60 },
    Acronym = "Clackora",
    MaxPlayers = 40,
    DamageType = L["Frost"],
    Bosses = {
        {
            id = "WBClackora",
            prefix = "1)",
            name = BB["Cla'ckora"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 55501 }, -- Sphere of the Endless Gulch
                { id = 55494 }, -- The Abyssal Pincer
                { id = 55495 }, -- Zandalar Predator's Glaive
                { id = 55498 }, -- Clamshell of the Depths
                { id = 55504 }, -- Anchor of the Wavecutter
                {},
                { id = 55502 }, -- Iceplated Leggings
                { id = 55499 }, -- Primal Murloc Scale Belt
                { id = 55500 }, -- Barnacle Vambraces
                { id = 55496 }, -- Polychromatic Pearl Necklace
                { id = 55503 }, -- Loop of Unceasing Frost
                { id = 55497 }, -- Idol of Ebb and Flow
                {},
                { id = 92020, dropRate = 5 }, -- Spawn of Cla'ckora
}
}
}
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Clackora.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil 
end
