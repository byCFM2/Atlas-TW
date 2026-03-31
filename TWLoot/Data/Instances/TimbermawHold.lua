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
local LB = AtlasTW.Localization.Bosses
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
        { letter = "A)"..L["Entrance"].." "..LZ["Azshara"] },
        { letter = "B)"..L["Entrance"].." "..LZ["Felwood"] },
    },
--[[     Keys = {
        { name = LMD["Key to Stormwrought Castle"], loot = "VanillaKeys", info = "6+" },
    }, ]]
    Bosses = {
        {
            id = "THKarrshtheSentinel",
            prefix = "1)",
            name = LB["Karrsh the Sentinel"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33237 }, -- Timbermaw Defenders
                { id = 33238 }, -- Karrsh's Memento TODO CHECK
                { id = 33239 }, -- Weaponmaster's Gauntlets
                { id = 33334 }, -- Timbermaw Protectors
                { id = 33341 }, -- Pendant of Relentless Assault
                {},
                { id = 33241 }, -- Bramblehide Breastplate
                { id = 33345 }, -- Treads of the Pathfinder
                {},
                { id = 42170 }, -- Pendant of the Sentinel
            }
        },
        {
            id = "THRotgrowl",
            prefix = "2)",
            name = LB["Rotgrowl"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33245 }, -- Tealeaf Waistwrap
                { id = 33246 }, -- Twig of Untamed Magics
                { id = 33333 }, -- Furbolg Medicine Wristwraps
                { id = 33343 }, -- Earth Warder's Visage
                { id = 33344 }, -- Moonblessed Bracers
                {},
                { id = 33247 }, -- Denrender, Hatchet of the Subterranean Hunter
                { id = 33248 }, -- Fetish of the Endless Bond
                --! recipe: honeycomb delight
            }
        },
        {
            id = "THKodiak",
            name = LB["Kodiak"],
        },
        {
            id = "THLoktanagtheVile",
            prefix = "3)",
            name = LB["Loktanag the Vile"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33251 }, -- Drape of Contagion
                {},
                { id = 33256 }, -- Corrosion
                {},
                { id = 33340, dropRate = 100, container = { 33679, 33385, 33391, 33397, 33403 }, disc = L["Boots"] }, -- Ritualistic Boots path of the
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THTriochtheDevourer",
            prefix = "4)",
            name = LB["Trioch the Devourer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33289 }, -- Digested Slayer's Pauldrons
                {},
                { id = 33088 }, -- Libram of the Exorciser
                { id = 33291 }, -- Pysan's New Greatsword
                { id = 33293 }, -- Trifang Shredders
                {},
                { id = 33339, dropRate = 100, container = { 33678, 33384, 33390, 33396, 33402 }, disc = L["Legs"] }, -- Ritualistic Leggings vigor of the
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THOrmanostheCracked",
            prefix = "5)",
            name = LB["Ormanos the Cracked"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33258 }, -- Visor of the Mending Cracks
                {},
                { id = 33261 }, -- Crown of Draenic Corruption
                {},
                { id = 33338, dropRate = 100, container = { 33677, 33383, 33389, 33395, 33401 }, disc = L["Gloves"] }, -- Ritualistic Gloves grasp of the
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THSelenaxxFoulheart",
            prefix = "6)",
            name = LB["Selenaxx Foulheart"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33283 }, --Fang of the First Called
                {},
                { id = 33336, dropRate = 100, container = { 33675, 33381, 33387, 33393, 33399 }, disc = L["Shoulders"] }, -- Ritualistic Mantle burden of the
                {},
                { id = 42224 }, -- Geode shards
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THChieftainPartath",
            prefix = "7)",
            name = LB["Chieftain Partath"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33273 }, -- Sash of the Pathfinder
                {},
                { id = 33276 }, -- Unity of the Timbermaw
                { id = 33277 }, -- Will of the Chieftain
                {},
                { id = 33335, dropRate = 100, container = { 33674, 33380, 33386, 33392, 33398 }, disc = L["Head"] }, -- Ritualistic Headdress guile of the
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THArchdruidKronn",
            prefix = "8)",
            name = LB["Archdruid Kronn"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33267 }, -- Mantle of the Den Watcher
                { id = 33333 }, -- Furbolg Medicine Wristwraps
                {},
                { id = 33345 }, -- Treads of the Pathfinder
                {},
                { id = 33084, container = { 33096 } }, -- Pristine Chromatic Scales
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THXavianForm",
            name = LB["Xavian Form"],
        },
        {
            id = "THPerotharn",
            prefix = "9)",
            name = LB["Peroth'arn"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 33306 }, -- Cloak of unwavering will
                { id = 33312 }, -- The Herald of Nightmares
            }
        },
        {
            id = "THTrash",
            name = L["Trash Mobs"].."-"..LZ["Timbermaw Hold"],
            defaults = { dropRate = .1 },
            loot = {
                { id = 42016 }, -- Timbermaw Sap
                { id = 58400, container = { 58304 } }, -- Schematic: Voltage-Neutralizing Nature Reflector
            }
        },
        -- { id = 33337, container = { 33676, 33382, 33388, 33394, 33400 }, disc = L["Chest"] = Ritualistic Tunic embrace of the
        { name = LIS["Surrender to Madness"], items = "SurrendertoMadness" },
        { name = LZ["Timbermaw Hold"].." "..L["Sets"], items = "TimbermawHoldSets" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.TimbermawHold.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end