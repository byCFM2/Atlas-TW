---
--- RagefireChasm.lua - Ragefire Chasm dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Ragefire Chasm
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Low-level dungeon item drops
--- • Dungeon entrance and layout data
--- • Level-appropriate loot organization
--- • Quest reward items
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.RagefireChasm = {
    Name = BZ["Ragefire Chasm"],
    Location = BZ["Orgrimmar"],
    Level = { 8, 18 },
    Acronym = "RFC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },

    Bosses = {
        {
            id = "RFCOggleflint",
            prefix = "1)",
            name = BB["Oggleflint"],
            loot = {
                { id = 80700, dropRate = 35 }, -- Tribal Trogg Club
                { id = 80701, dropRate = 35 }, -- Dusty Leather Pants
                { id = 80702, dropRate = 30 }, -- Stitched Cloth Vest
                {},
                { id = 17041, disc = L["Level One Lunatic Challenge"], dropRate = 100 }, -- The Blazing Pan
            }
        },
        {
            id = "RFCTaragaman",
            prefix = "2)",
            name = BB["Taragaman the Hungerer"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 14149 }, -- Subterranean Cape
                { id = 14148 }, -- Crystalline Cuffs
                { id = 14145 }, -- Cursed Felblade
                {},
                { id = 64, disc = L["Level One Lunatic Challenge"], dropRate = 100 }, -- Fiery Cloak
            }
        },
        {
            id = "RFCJergosh",
            prefix = "3)",
            name = BB["Jergosh the Invoker"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 14150 }, -- Robe of Evocation
                { id = 14147 }, -- Cavedweller Bracers
                { id = 14151 }, -- Chanting Blade
                {},
                { id = 80111, disc = L["Level One Lunatic Challenge"], dropRate = 100 }, -- Ash-Covered Tunic
            }
        },
        {
            id = "RFCBazzalan",
            prefix = "4)",
            name = BB["Bazzalan"],
            defaults = { dropRate = 30 },
            loot = {
                { id = 80705 }, -- Satyr Poker
                { id = 80704 }, -- Lavadrenched Chainmail
                { id = 80703 }, -- Heated Leather Belt
                {},
                { id = 5235, disc = L["Level One Lunatic Challenge"], dropRate = 100 }, -- Cultist's Firestick
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "RFCTrash",
            name = L["Trash Mobs"].."-"..BZ["Ragefire Chasm"],
            loot = {
                { id = 12862, disc = L["Level One Lunatic Challenge"], dropRate = 25 }, -- Burning Blade Grimoire
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.RagefireChasm.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
