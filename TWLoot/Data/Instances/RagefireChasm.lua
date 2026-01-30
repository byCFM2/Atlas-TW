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
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LB = AtlasTW.Localization.Bosses
local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.RagefireChasm = {
    Name = LZ["Ragefire Chasm"],
    Location = LZ["Orgrimmar"],
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
            name = LB["Oggleflint"],
            loot = {
                { id = 80700, dropRate = 35 }, -- Tribal Trogg Club
                { id = 80701, dropRate = 35 }, -- Dusty Leather Pants
                { id = 80702, dropRate = 30 }, -- Stitched Cloth Vest
                {},
                { id = 17041, disc = L["Level One Lunatic Challenge"], dropRate = 125 }, -- The Blazing Pan
            }
        },
        {
            id = "RFCRahauro",
            name = LB["Maur Grimtotem"],
            color = Colors.GREY,
        },
        {
            id = "RFCTaragaman",
            prefix = "2)",
            name = LB["Taragaman the Hungerer"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 14149 }, -- Subterranean Cape
                { id = 14148 }, -- Crystalline Cuffs
                { id = 14145 }, -- Cursed Felblade
                {},
                { id = 14540, dropRate = 100 }, -- Taragaman the Hungerer's Heart
                {},
                { id = 5235, disc = L["Level One Lunatic Challenge"], dropRate = 100 }, -- Cultist's Firestick
            }
        },
        {
            id = "RFCJergosh",
            prefix = "3)",
            name = LB["Jergosh the Invoker"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 14150 }, -- Robe of Evocation
                { id = 14147 }, -- Cavedweller Bracers
                { id = 14151 }, -- Chanting Blade
                {},
                { id = 55004, disc = L["Level One Lunatic Challenge"], dropRate = 25 }, -- Shattered Burning Blade Medallion
                { id = 80111, disc = L["Level One Lunatic Challenge"], dropRate = 25 }, -- Ash-Covered Tunic
            }
        },
        {
            id = "RFCBazzalan",
            prefix = "4)",
            name = LB["Bazzalan"],
            defaults = { dropRate = 30 },
            loot = {
                { id = 80705 }, -- Satyr Poker
                { id = 80704 }, -- Lavadrenched Chainmail
                { id = 80703 }, -- Heated Leather Belt
                {},
                { id = 5212, dropRate = 25 }, -- Blazing Wand
                {},
                { id = 64, disc = L["Level One Lunatic Challenge"], dropRate = 100 }, -- Ash‑Covered Cape
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "RFCTrash",
            name = L["Trash Mobs"].."-"..LZ["Ragefire Chasm"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 14395, container = { 15449, 15450, 15451 } }, -- Spells of Shadow
                { id = 14396, container = { 15449, 15450, 15451 } }, -- Incantations from the Nether
                {},
                { id = 12862, disc = L["Level One Lunatic Challenge"] }, -- Burning Blade Grimoire
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.RagefireChasm.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end