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
local LS = AtlasTW.Localization.Spells

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local tHSharedLoot = {
    {},
    { id = 33333 }, -- Furbolg Medicine Wristwraps
    { id = 33334 }, -- Timbermaw Protectors
    { id = 33341 }, -- Pendant of Relentless Assault
    { id = 33342 }, -- Sash of the Pathfinder
    { id = 33343 }, -- Earth Warder's Visage
    { id = 33344 }, -- Moonblessed Bracers
    {},
    { id = 33345 }, -- Treads of the Pathfinder
    { id = 33346 }, -- Boots of the Untamed
}

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
    Bosses = {
        {
            id = "THKarrshtheSentinel",
            prefix = "1)",
            name = LB["Karrsh the Sentinel"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 33237 }, -- Timbermaw Defenders
                { id = 33238 }, -- Karrsh's Memento
                { id = 33239 }, -- Weaponmaster's Gauntlets
                { id = 33240 }, -- Furbolg Medicine Handwraps
                { id = 33241 }, -- Pendant of Relentless Assault
                { id = 33242 }, -- Claw of Reckless Abandon
                {},
                { id = 42170, dropRate = 100, container = { 42235 } }, -- Pendant of the Sentinel
                unpack(tHSharedLoot),
            }
        },
        {
            id = "THRotgrowl",
            prefix = "2)",
            name = LB["Rotgrowl"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 33243 }, -- Relentless Tracker's Wristguards
                { id = 33244 }, -- Kodiak's Collar
                { id = 33245 }, -- Tealeaf Waistwrap
                { id = 33246 }, -- Twig of Untamed Magics
                {},
                { id = 33247 }, -- Denrender, Hatchet of the Subterranean Hunter
                { id = 33248 }, -- Fetish of the Endless Bond
                {},
                { id = 135, dropRate = 2, container = { 42186 } }, -- Recipe: Honeycomb Delight
                unpack(tHSharedLoot),
            }
        },
        {
            id = "THKodiak",
            name = LB["Kodiak"],
        },
        {
            id = "THArchdruidKronn",
            prefix = "3)",
            name = LB["Archdruid Kronn"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 33264 }, -- Furbolg Medicine Footwraps
                { id = 33265 }, -- Drape of Bestial Ferocity
                { id = 33266 }, -- Archdruid's Protection
                { id = 33267 }, -- Mantle of the Den Watcher
                {},
                { id = 33268 }, -- Beacon of the Emerald Dream
                { id = 33269 }, -- Signet of Screaming Nightmares
                { id = 33270 }, -- Slumberweave Cloak
                {},
                { id = 33084, container = { 33096 } }, -- Pristine Chromatic Scales
                {},
                { id = 42187, dropRate = 1.2 }, -- Formula: Enchant Cloak - Agility 
                { id = 42284, container = { 42196 }, dropRate = 1.2 }, -- Formula: Timberheart Dreamcatcher 
                { id = 42285, container = { 42184 }, dropRate = 1.2 }, -- Recipe: Mixologist Stone
                unpack(tHSharedLoot),
            }
        },
        {
            id = "THXavianForm",
            name = LB["Xavian Form"],
        },
        {
            id = "THLoktanagtheVile",
            prefix = "4)",
            name = LB["Loktanag the Vile"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 33249 }, -- Asphyxiating Root
                { id = 33250 }, -- Spore-laden Girdle
                { id = 33251 }, -- Drape of Contagion
                { id = 33252 }, -- Hazardous Environment Stompers
                {},
                { id = 33253 }, -- Heart of Decay
                { id = 33254 }, -- Shield of Wailing Souls
                { id = 33255 }, -- Leggings of Pulsating Pustules
                { id = 33256 }, -- Corrosion
                {},
                { id = 33340, dropRate = 100, container = { 33679, 33385, 33391, 33397, 33403 }, disc = L["Boots"] }, -- Ritualistic Boots path of the
                {},
                { id = 42289, container = { 42194 }, dropRate = 1.2 }, -- Pattern: Deeproot Sash
                { id = 42290, container = { 42192 }, dropRate = 1.2 }, -- Pattern: Witherhide Gloves
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THOrmanostheCracked",
            prefix = "5)",
            name = LB["Ormanos the Cracked"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 33257 }, -- Stonebound Wristguards
                { id = 33258 }, -- Visor of the Mending Cracks
                { id = 33259 }, -- Ormanos' Hollow Finger
                { id = 33260 }, -- Sliver of Corrupted Draenethyst
                {},
                { id = 33091 }, -- Totem of Ancient Rites
                { id = 33261 }, -- Crown of Draenic Corruption
                { id = 33262 }, -- Wall of Earthen Attunement
                { id = 33263 }, -- Promised Salvation
                {},
                { id = 33338, dropRate = 100, container = { 33677, 33383, 33389, 33395, 33401 }, disc = L["Gloves"] }, -- Ritualistic Gloves grasp of the
                {},
                { id = 42189, dropRate = 1.2 }, -- Formula: Enchant 2H Weapon - Nature Damage
                { id = 42292, container = { 42191 }, dropRate = 1.2 }, -- Plans: Crystalized Topaz Gemstone
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THTriochtheDevourer",
            prefix = "6)",
            name = LB["Trioch the Devourer"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 33287 }, -- Hydrascale Seal
                { id = 33288 }, -- Cloak of the Unfortunate
                { id = 33289 }, -- Digested Slayer's Pauldrons
                { id = 33290 }, -- Igniter's Scorchcloth
                {},
                { id = 33088 }, -- Libram of the Exorciser
                { id = 33291 }, -- Pysan's New Greatsword
                { id = 33292 }, -- Elberetha's Scepter of Agitation
                { id = 33293 }, -- Trifang Shredders
                {},
                { id = 33339, dropRate = 100, container = { 33678, 33384, 33390, 33396, 33402 }, disc = L["Legs"] }, -- Ritualistic Leggings vigor of the
                {},
                { id = 42291, container = { 42193 }, dropRate = 1.2 }, -- Pattern: Timberclaw Bracers
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THSelenaxxFoulheart",
            prefix = "7)",
            name = LB["Selenaxx Foulheart"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 33279 }, --Pauldrons of Sinister Intent
                { id = 33280 }, --Treads of the Blighted Messenger
                { id = 33281 }, --Foulthorn Ring
                { id = 33282 }, --Fluctuating Rod
                {},
                { id = 33283 }, --Fang of the First Called
                { id = 33284 }, --Claw of the Befouler
                { id = 33285 }, --Recurve of the Last Stand
                { id = 33286 }, --Crystal Encrusted Girdle
                {},
                { id = 33336, dropRate = 100, container = { 33675, 33381, 33387, 33393, 33399 }, disc = L["Shoulders"] }, -- Ritualistic Mantle burden of the
                {},
                { id = 42188, dropRate = 1.2 }, -- Formula: Enchant Cloak - Greater Shadow Resistance 
                { id = 42190, dropRate = 1.2 }, -- Formula: Enchant 2H Weapon - Shadow Damage
                {},
                { id = 42224, dropRate = 100, container = { 33361, 33362, 33363, 33364 } }, -- Geode shards
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THChieftainPartath",
            prefix = "8)",
            name = LB["Chieftain Partath"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 33271 }, -- Pendant of the Bountiful
                { id = 33272 }, -- Earth Warder's Grasp
                { id = 33273 }, -- Sash of the Pathfinder
                { id = 33274 }, -- Moonblessed Spaulders
                {},
                { id = 33275 }, -- Signet of Howling Nightmares
                { id = 33276 }, -- Unity of the Timbermaw
                { id = 33277 }, -- Will of the Chieftain
                { id = 33278 }, -- Maw of Gluttony
                {},
                { id = 33335, dropRate = 100, container = { 33674, 33380, 33386, 33392, 33398 }, disc = L["Head"] }, -- Ritualistic Headdress guile of the
                {},
                { id = 42287, container = { 42195 }, dropRate = 1.2 }, -- Plans: Ceremonial Furbolg Pendant 
                { id = 42288, container = { 42183 }, dropRate = 1.2 }, -- Plans: Denwatcher
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
            }
        },
        {
            id = "THUrsol",
            prefix = "9)",
            name = LB["Ursol"],
            defaults = { dropRate = 18 },
            loot = {
                { id = 33294 }, -- Droplet of Nordrassil
                { id = 33295 }, -- Breastcage of Ironbark
                { id = 33296 }, -- Shard of Dreams
                { id = 33297 }, -- Dreamwind Threads
                { id = 33298 }, -- Cuffs of the Enlightened
                { id = 33300 }, -- Cenarius' Teachings
                { id = 33301 }, -- Spaulders of Unresolved Regrets
                { id = 33302 }, -- Forlorn Hope
                { id = 33303 }, -- Gloves of Sudden Betrayal
                { id = 33304 }, -- Ironweave Chaincloak
                {},
                { id = 33299 }, -- Maw of Spewing Malignity
                { id = 33305 }, -- Vor'ethil, the Broken Shadow
                {},
                { id = 58312, dropRate = 8 }, -- Glyph of the Tainted Wild God
                { id = 42306, dropRate = 2, disc = LS["Skinning"], container = { 33324, 33325, 33326 } }, -- Corrupted Hide of Ursol
                {},
                { id = 42177, dropRate = 100, container = { 33327, 33328, 33329 } }, -- Pendant of Dreams
                { id = 33337, container = { 33676, 33382, 33388, 33394, 33400 }, disc = L["Chest"], dropRate = 100 }, -- Ritualistic Tunic embrace of the
            }
        },
        {
            id = "THPerotharn",
            prefix = "10)",
            name = LB["Peroth'arn"],
            defaults = { dropRate = 18 },
            loot = {
                { id = 33306 }, -- Cloak of Unwavering Will
                { id = 33307 }, -- Choker of Endless Insomnia
                { id = 33308 }, -- Whispering Fragment of Aln
                { id = 33310 }, -- Mantle of the Usurper
                { id = 33311 }, -- Bindings of Relentless Wrathtail
                { id = 33313 }, -- Vestments of Purgatorial Flames
                { id = 33314 }, -- Eyes of the Sightless
                { id = 33315 }, -- Girdle of Withered Spirits
                { id = 33316 }, -- Kilt of Futile Sacrifices
                { id = 33317 }, -- Royal Highborne Guardbelt
                {},
                { id = 33309, dropRate = 10 }, -- Var'adel, Twig of the Dreamfountain
                { id = 33312, dropRate = 10 }, -- The Herald of Nightmares
                {},
                { id = 42295, dropRate = 50, container = { 33332 } }, -- Mass of Writhing Tentacles
                { id = 42307, dropRate = 50, container = { 33330, 33331 } }, -- Runed Elementium Key
            }
        },
        {
            id = "THTrash",
            name = L["Trash Mobs"].."-"..LZ["Timbermaw Hold"],
            defaults = { dropRate = 1 },
            loot = {
                { id = 58400, container = { 58304 } }, -- Schematic: Voltage-Neutralizing Nature Reflector
                {},
                { id = 42016 }, -- Timbermaw Sap
                {},
                { id = 42171, dropRate = 100, container = { 42234 } }, -- Withermaw Totem
                { id = 42181, dropRate = 40 }, -- Netherrich Demon Blood
                { id = 61198, dropRate = 7 }, -- Small Dream Shard
                { id = 61441, dropRate = 38, container = { 61199 } }, -- Ursa Battlehammer
                { id = 61442, dropRate = 76, container = { 61199 } }, -- Barskin Pendant
                { id = 61636, dropRate = 26 }, -- Barkskin Spirit Bead
                { id = 61707, dropRate = 50 }, -- Shadeflayer Tribal Bracelet
            }
        },
        { name = LIS["Surrender to Madness"], items = "SurrendertoMadness" },
        { name = LZ["Timbermaw Hold"].." "..L["Sets"], items = "TimbermawHoldSets" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.TimbermawHold.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end