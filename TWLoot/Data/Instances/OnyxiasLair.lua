---
--- OnyxiasLair.lua - Onyxia's Lair raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for Onyxia's Lair
--- 40-player raid instance. It includes the single boss encounter with
--- tier set items, rare drops, and the legendary Onyxia Scale Cloak.
---
--- Features:
--- • Complete Onyxia boss encounter
--- • Tier set head pieces
--- • Rare and epic weapon drops
--- • Legendary cloak materials
--- • Attunement quest items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.OnyxiasLair = {
    Name = BZ["Onyxia's Lair"],
    Location = BZ["Dustwallow Marsh"],
    Level = 60,
    Acronym = "Ony",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Fire"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = L["Onyxian Warders"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name = L["Whelp Eggs"],
            color = "|cff9d9d9d",
        },
        {
            id = "Onyxia",
            prefix = "3)",
            name = BB["Onyxia"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 16921, container = { 47206 } }, -- Halo of Transcendence
                { id = 16914, container = { 47086 } }, -- Netherwind Crown
                { id = 16929, container = { 47284 } }, -- Nemesis Skullcap
                { id = 16908 }, -- Bloodfang Hood
                { id = 16900, container = { 47346, 47354 } }, -- Stormrage Cover
                { id = 16939 }, -- Dragonstalker's Helm
                { id = 16947, container = { 47136, 47144 } }, -- Visor of Ten Storms
                { id = 16955, container = { 47016, 47024 } }, -- Judgement Helm
                { id = 16963, container = { 47248 } }, -- Helm of Wrath
                {},
                { id = 18205, dropRate = 25 }, -- Eskhandar's Collar
                { id = 17078, dropRate = 25 }, -- Sapphiron Drape
                { id = 17067, dropRate = 25 }, -- Ancient Cornerstone Grimoire
                {},
                { id = 18705, dropRate = 40, container = { 18714, 18713, 18715 } }, -- Mature Black Dragon Sinew
                { id = 18423, dropRate = 100, container = { 18403, 18404, 18406, 15138 } }, -- Head of Onyxia (Alliance)
                { id = 18422, dropRate = 100, container = { 18403, 18404, 18406, 15138 } }, -- Head of Onyxia (Horde)
                {},
                { id = 18813, dropRate = 25 }, -- Ring of Binding
                { id = 17064, dropRate = 8 }, -- Shard of the Scale
                { id = 17068, dropRate = 8 }, -- Deathbringer
                { id = 17075, dropRate = 8 }, -- Vis'kag the Bloodletter
                { id = 17966, disc = L["Bag"], dropRate = 100 }, -- Onyxia Hide Backpack
                { id = 15410, disc = L["Reagent"], dropRate = 100, container = { 17967, 15138, 15141 } }, -- Scale of Onyxia
                { id = 21108, disc = L["Quest Item"], dropRate = 100, container = { 21111 } }, -- Draconic for Dummies
                { id = 17962, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 3864, 55251, 55250, 7910, 7909, 1529, 12361 } }, -- Blue Sack of Gems
                { id = 17963, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12364 } }, -- Green Sack of Gems
                { id = 17964, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12800 } }, -- Gray Sack of Gems
                { id = 17965, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12363 } }, -- Yellow Sack of Gems
                { id = 17969, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12799 } }, -- Red Sack of Gems
                { id = 30017, dropRate = 1.5 }, --Onyxian Drake
            }
        },
        {
            id = "BroodcommanderAxelus",
            prefix = "4)",
            name = BB["Broodcommander Axelus"],
            postfix = L["Optional"],
            defaults = { dropRate = 20 },
            loot = {
                --TODO Broodcommander Axelus loot
            }
        }
    }
}

for _, bossData in ipairs(AtlasTW.InstanceData.OnyxiasLair.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end
