---
--- RareMobs.lua - Rare elite mob loot data
---
--- This module contains comprehensive loot data for rare elite mobs
--- scattered throughout the world. It includes unique drops, rare equipment,
--- and special items from named rare spawns across all zones.
---
--- Features:
--- • Complete rare mob loot tables
--- • Zone-specific rare spawns
--- • Unique and rare drops
--- • Named elite rewards
--- • Spawn location information
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LMD = AtlasTW.Localization.MapData

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Rare mobs data
AtlasTW.InstanceData.RareMobs = {
    Name = L["Rare Mobs"],
    Location = L["Various Locations"],
    Level = { 1, 60 },
    Bosses = {
        {
            id = "ShadeMage",
            name = LMD["Shade Mage"],
            postfix = "0.4k (17L) " .. LZ["Tirisfal Glades"] .. " [15, 68]",
            defaults = { dropRate = 50 },
            loot = {
                { id = 61500 }, -- Shadestaff
                { id = 61501 }, -- Silent Sneakers
}
},
        {
            id = "GraypawAlpha",
            name = LMD["Graypaw Alpha"],
            postfix = "0.7k (18L) " .. LZ["Tirisfal Glades"] .. " [27, 58]",
            defaults = { dropRate = 50 },
            loot = {
                { id = 60492 }, -- Graypaw Leggings
                { id = 60493 }, -- Graypaw Boots
}
},
        {
            id = "EarthcallerRezengal",
            name = LMD["Earthcaller Rezengal"],
            postfix = "0.4k (18L) " .. LZ["Stonetalon Mountains"] .. " [74, 79]",
            defaults = { dropRate = 50 },
            loot = {
                { id = 61502 }, -- Earthcaller Staff
                { id = 61503 }, -- Rezengal's Robe
}
},
        {
            id = "Blazespark",
            name = LMD["Blazespark"],
            postfix = "0.8k (24L) " .. LZ["Stonetalon Mountains"] .. " [21, 29]",
            defaults = { dropRate = 50 },
            loot = {
                { id = 61504 }, -- Wildfire Girdle
                { id = 61505 }, -- Leggings of Fiery Temper
}
},
        {
            id = "FriarMontero",
            name = LMD["Friar Montero"],
            postfix = "3.5k (35L) " .. LZ["Northwind"] .. " [61, 26]",
            defaults = { dropRate = 50 },
            loot = {
                { id = 58010 }, -- Psalm of Righteous Fire
                { id = 58011 }, -- Friar's Signet
}
},
        {
            id = "WitchDoctorTanzo",
            name = LMD["Witch Doctor Tan'zo"],
            postfix = "2k (35L) " .. LZ["Arathi Highlands"] .. " [44, 13]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61507 }, -- Pendant of Wilderness
                { id = 61506 }, -- Shard of Wild Hexes
                { id = 61508, dropRate = 20 }, -- Thorned Branch
}
},
        {
            id = "Emastrasz",
            name = LMD["Emastrasz"],
            postfix = "2k (38L) " .. LZ["Grim Reaches"] .. " [57, 78]",
            defaults = { dropRate = 50 },
            loot = {
                { id = 58159 }, -- Hood of Lifebinding
                { id = 58160 }, -- Firebound Skull
}
},
        {
            id = "Dawnhowl",
            name = LMD["Dawnhowl"],
            postfix = "2k (40L) " .. LZ["Gilneas"] .. " [43, 23]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 61580 }, -- Wolf's Skull
                { id = 61581 }, -- Wolffur Armor
                { id = 61582 }, -- Sharp Teeth Necklace
}
},
        {
            id = "WidowoftheWoods",
            name = LMD["Widow of the Woods"],
            postfix = "6k (40L) " .. LZ["Gilneas"] .. " [30, 50]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61575 }, -- Forgotten Veil
                { id = 61576 }, -- Lover's Ring
                {},
                { id = 61589, dropRate = 20 }, -- Widow's Kiss
}
},
        {
            id = "Gnaws",
            name = LMD["Gnaws"],
            postfix = "6.4k (41L) " .. LZ["Balor"] .. " [56, 11]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 23100, dropRate = 25 }, -- Idol of Fluidity
                { id = 58058 }, -- Harpoon of Ahab
                { id = 58059 }, -- Razertooth Fetish
                { id = 58061 }, -- Sharkskin Sash
}
},
        {
            id = "MaltimorsPrototype",
            name = LMD["Maltimor's Prototype"],
            postfix = "6k (43L) " .. LZ["Gilneas"] .. " [48, 57]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61573 }, -- Scrapmetal Helm
                { id = 61574 }, -- Polished Gear
                {},
                { id = 61572, dropRate = 20 }, -- Gartside Family Wrench
}
},
        {
            id = "Bonecruncher",
            name = LMD["Bonecruncher"],
            postfix = "2k (44L) " .. LZ["Gilneas"] .. " [54, 56]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61583 }, -- Light Ogre Belt
                { id = 61584 }, -- Ogre Fighter's Bracers
                { id = 61585, dropRate = 20 }, -- Brawling Trophy
}
},
        {
            id = "Duskskitterer",
            name = LMD["Duskskitterer"],
            postfix = "2k (44L) " .. LZ["Gilneas"] .. " [46, 78]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 61610 }, -- Old Farmer's Pitchfork
                { id = 61611 }, -- Emerald Pendant
                { id = 61612 }, -- Holy Sword
}
},
        {
            id = "BaronPerenolde",
            name = LMD["Baron Perenolde"],
            postfix = "3k (45L) " .. LZ["Gilneas"] .. " [67, 80]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 61577 }, -- Lieutenant's Sword
                { id = 61578 }, -- Old Knight's Leggings
}
},
        {
            id = "KinTozo",
            name = LMD["Kin'Tozo"],
            postfix = "20k (45L) " .. LZ["Stranglethorn Vale"] .. " [27, 55]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 60438 }, -- Vambraces of Kin'Tozo
                { id = 60439 }, -- Chieftain's Mantle
                { id = 60440 }, -- Bloodscalp Longbow
                { id = 60441 }, -- The Mojo Ring
                {},
                { id = 60442, dropRate = 2 }, -- Hak'thalz of Legacy
}
},
        {
            id = "M0L1Y",
            name = LMD["M-0L1Y"],
            postfix = "3k (47L) " .. LZ["Icepoint Rock"] .. " [54, 40]",
            defaults = { dropRate = 30 },
            loot = {
                { id = 41297 }, -- Corrosive Sabatons
                { id = 41295 }, -- Lost Excavation Pickaxe
                { id = 41296 }, -- Damp Pauldrons
                { id = 41298, dropRate = 10 }, -- Overloaded Heating Coil
}
},
        {
            id = "Grugthok",
            name = LMD["Grug'thok the Seer"],
            postfix = "15k (47L) " .. LZ["Feralas"] .. " [58, 71]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 81380 }, -- Gordunni War Harness
                { id = 81381 }, -- Isildien Ley-Stave
                { id = 81382 }, -- Gordunni War Beads
                { id = 81383 }, -- The Ogre Truncheon
                { id = 81384, dropRate = 0.5 }, -- Grug'thok's Sash
}
},
        {
            id = "Ashbeard",
            name = LMD["Explorer Ashbeard"],
            postfix = "16k (49L) " .. LZ["Searing Gorge"] .. " [71, 18]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 83275, dropRate = 0.5 }, -- Ashbeard's Lucky Telescope
                { id = 83276 }, -- Lens of the Gorge Explorer
                { id = 83277 }, -- Dark Iron Adventurer Shawl
                { id = 83278 }, -- Ash Explorer Pauldrons
                { id = 83279 }, -- Everflame Torch
}
},
        {
            id = "Jalakar",
            name = LMD["Jal'akar"],
            postfix = "18k (50L) " .. LZ["The Hinterlands"] .. " [53, 34]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 51023 }, -- Vilebranch Grips
                { id = 51024 }, -- Cursed Idol
                { id = 51025 }, -- Vilebranch Seer's Dress
                { id = 83273 }, -- The Dire Clasp
                { id = 83274, dropRate = 0.5 }, -- Charmed Voodoo Collar
}
},
        {
            id = "Ripjaw",
            name = LMD["Ripjaw"],
            postfix = "9k (51L) " .. LZ["Lapidis Isle"] .. " [55, 21]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61535 }, -- Outlaw's Pirate Hat
                { id = 61536 }, -- Mystical Girdle
                {},
                { id = 61537, dropRate = 20 }, -- Ripjaw's Tooth
}
},
        {
            id = "Rukthok",
            name = LMD["Ruk'thok the Pyromancer"],
            postfix = "3k (51L) " .. LZ["Lapidis Isle"] .. " [43, 29]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 61613 }, -- Burnt Explorer's Tunic
                { id = 61614 }, -- Ruk'thok Slippers
                { id = 61615 }, -- Burning Torch
}
},
        {
            id = "Embereye",
            name = LMD["Embereye"],
            postfix = "4k (51L) " .. LZ["Gillijim's Isle"] .. " [67, 69]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 61538 }, -- Moonsteel Zweihander
                { id = 61539 }, -- Scaleshard Shoulders
                { id = 61540 }, -- Emberscale Shield
}
},
        {
            id = "Xalvic",
            name = LMD["Xalvic Blackclaw"],
            postfix = "19k (53L) " .. LZ["Felwood"] .. " [53, 29]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 81370 }, -- Footpads of the Corruptor
                { id = 81371 }, -- Gnarltwist Vest
                { id = 81372 }, -- The Black Claw
                { id = 81373 }, -- Shawl of the Satyr
                { id = 81374, dropRate = .5 }, -- Trickster's Necklace
}
},
        {
            id = "FirstbornofArugal",
            name = LMD["Firstborn of Arugal"],
            postfix = "10k (55L) " .. LZ["Gilneas"] .. " [40, 37]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61586 }, -- Explorer's Shoulders
                { id = 61587 }, -- Old Hunter's Boots
                {},
                { id = 61588, dropRate = 20 }, -- Arugal Family Sigil
}
},
        {
            id = "MargontheMighty",
            name = LMD["Margon the Mighty"],
            postfix = "25k (55L) " .. LZ["Lapidis Isle"] .. " [30, 41]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 61531 }, -- Glowing Black Pearl
                { id = 61532 }, -- Grand Slammer
                { id = 61534 }, -- Fisher's Harpoon
                {},
                { id = 61533, dropRate = 2 }, -- Ring of the Forgotten Hero
}
},
        {
            id = "WanderingKnight",
            name = LMD["The Wandering Knight"],
            postfix = "22k (55L) " .. LZ["Western Plaguelands"] .. " [64, 74]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 83257 }, -- Caer Darrow Reserve Rifle
                { id = 83258 }, -- Coif of the Lost Soul
                { id = 83259 }, -- Old Knighthood Blade
                { id = 83260 }, -- Footman's Breastplate
}
},
        {
            id = "Letashaz",
            name = LMD["Letashaz"],
            postfix = "25k (55L) " .. LZ["Gillijim's Isle"] .. " [29, 89]",
            defaults = { dropRate = 33 },
            loot = {
                { id = 61542 }, -- Dwarven Pickaxe
                { id = 61543 }, -- Miner's Vest
                { id = 61544 }, -- Shawl of the Magician
                {},
                { id = 61541, dropRate = 2 }, -- Letashaz's Right Claw
}
},
        {
            id = "Aquitus",
            name = LMD["Aquitus"],
            postfix = "7k (56L) " .. LZ["Gillijim's Isle"] .. " [27, 70]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61529 }, -- Pirate's Scimitar
                { id = 61530 }, -- Ring of the Deep Sea
                {},
                { id = 61528, dropRate = 20 }, -- Aquis' Bindings
}
},
        {
            id = "Stoneshell",
            name = LMD["Stoneshell"],
            postfix = "4k (56L) " .. LZ["Tel'Abim"] .. " [40, 47]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61509 }, -- Stoneshell Shield
                { id = 61510 }, -- Stonehewn Pauldrons
                { id = 61511, dropRate = 20 }, -- Scale of the Makrura
}
},
        {
            id = "Tarangos",
            name = LMD["Tarangos"],
            postfix = "23k (56L) " .. LZ["Azshara"] .. " [42, 80]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 81360 }, -- Claw of Taranassz
                { id = 81361 }, -- Dampener's Pauldrons
                { id = 81362 }, -- Azure-Scale Sabatons
                { id = 81364 }, -- Scale of Malygos
}
},
        {
            id = "Zareth",
            name = LMD["Zareth Terrorblade"],
            postfix = "23k (57L) " .. LZ["Blasted Lands"] .. " [55, 59]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 83265 }, -- Demon Hunter's Blindfold
                { id = 83266 }, -- Sandals of the Demon Stalker
                { id = 83267 }, -- Bracers of the Demonic Hunt
                { id = 83268 }, -- Demon Watcher's Ring
                { id = 83269, dropRate = .5 }, -- Terrorblade Glaive
}
},
        {
            id = "HighvaleSilverback",
            name = LMD["Highvale Silverback"],
            postfix = "4k (58L) " .. LZ["Tel'Abim"] .. " [57, 48]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61518 }, -- Apefist Pummelers
                { id = 61519 }, -- Tel Co. Chestguard
                { id = 61520, dropRate = 20 }, -- The Golden Banana
}
},
        {
            id = "Mallon",
            name = LMD["Mallon The Moontouched"],
            postfix = "27k (58L) " .. LZ["Winterspring"] .. " [57, 61]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 81375 }, -- Staff of the Lost Druid
                { id = 81376 }, -- Moontouched Girdle
                { id = 81377 }, -- Enfused Moon Crown
                { id = 81378 }, -- Eveningstar Gloves
                { id = 81379, dropRate = .5 }, -- Shard of the Moon
}
},
        {
            id = "ProfessorLysander",
            name = LMD["Professor Lysander"],
            postfix = "9k (59L) " .. LZ["Western Plaguelands"] .. " [12, 50]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 41060 }, -- Refined Plague Strain
                { id = 41061 }, -- Frozen Rune of Naxxramas
                { id = 41062 }, -- Peering Eyeball
                { id = 41063 }, -- Doctor's Labcoat
}
},
        {
            id = "Kargron",
            name = LMD["Blademaster Kargron"],
            postfix = "28k (59L) " .. LZ["Burning Steppes"] .. " [45, 32]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 81365 }, -- Kargron's Leggings
                { id = 81367 }, -- Band of the Old Horde
                { id = 81368 }, -- Blackshackle Bracers
                { id = 81369, dropRate = .5 }, -- Blade of the Blademaster
}
},
        {
            id = "Azurebeak",
            name = LMD["Azurebeak"],
            postfix = "20k (60L) " .. LZ["Hyjal"] .. " [23, 37]",
            defaults = { dropRate = 40 },
            loot = {
                { id = 61550 }, -- Sanctified Helm
                { id = 61551 }, -- Mathrengyl's Lost Staff
                {},
                { id = 61549, dropRate = 20 }, -- Swiftfeather Quiver
}
},
        {
            id = "BarkskinFisher",
            name = LMD["Barkskin Fisher"],
            postfix = "5k (60L) " .. LZ["Hyjal"] .. " [66, 53]",
            loot = {
                { id = 84507, dropRate = 100 }, -- Barkskin Fisher
}
},
        {
            id = "AdmiralBareanWestwind",
            name = LMD["Admiral Barean Westwind"],
            postfix = "141k (60L) " .. LZ["Eastern Plaguelands"] .. " [66, 42]",
            defaults = { dropRate = 17 },
            loot = {
                { id = 60383 }, -- Fleetmaster's Cane
                { id = 60384 }, -- Fleet Scimitar
                { id = 60385 }, -- Westwind's Bicorne
                { id = 60386 }, -- Sash of the Northrend Expedition
                { id = 60387 }, -- Sivaxis Tundra Shard
                { id = 60388 }, -- Mariner's Cuffs
                { id = 60389, dropRate = 15 }, -- The Frigid Star Ring
                { id = 60390, dropRate = 15 }, -- Jacket of the Scarlet Admiral
}
},
        {
            id = "ShadeflayerGoliath",
            name = LMD["Shadeflayer Goliath"],
            postfix = "17k (61L) " .. LZ["Hyjal"] .. " [10, 44]",
            defaults = { dropRate = 30 },
            loot = {
                { id = 61546 }, -- Leggings of the Fallen Knight
                { id = 61548 }, -- Witch Doctor's Mask
                {},
                { id = 61545, dropRate = 20 }, -- Shadeflayer's Sigil
                { id = 61547, dropRate = 20 }, -- Totem of Bad Mojo
}
},
        {
            id = "CrusaderLarsarius",
            name = LMD["Crusader Larsarius"],
            postfix = "28k (61L) " .. LZ["Eastern Plaguelands"] .. " [47, 60]",
            defaults = { dropRate = 25 },
            loot = {
                { id = 60437, dropRate = .2 }, -- Righteous Crusader's Helmet
                { id = 83263 }, -- Cuffs of the Justicar
                { id = 83264 }, -- Ring of Sacrifice
                { id = 83261 }, -- Tome of the First Scripture
                { id = 83262 }, -- Scarlet Wanderer's Hammer
}
}
}
}

-- Item initialization for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.RareMobs.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end