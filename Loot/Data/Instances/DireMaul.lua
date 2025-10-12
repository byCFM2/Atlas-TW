---
--- DireMaul.lua - Dire Maul dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Dire Maul
--- 5-player dungeon instance. It includes all three wings (East, West, North)
--- with their respective boss encounters, rare drops, and tribute runs.
---
--- Features:
--- • Complete three-wing boss encounters
--- • Tribute run loot tables
--- • Rare and epic weapon drops
--- • Wing-specific item organization
--- • Key and quest item drops
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local ShareLoot = {
    { id = 18356, container = { 18465 }, dropRate = ".2-10" }, -- Garona: A Study on Stealth and Treachery
    { id = 18357, container = { 18466 }, dropRate = ".2-10" }, -- Codex of Defense
    { id = 18358, container = { 18468 }, dropRate = ".2-10" }, -- The Arcanist's Cookbook
    { id = 18359, container = { 18472 }, dropRate = ".2-10" }, -- The Light and How to Swing It
    { id = 18360, container = { 18467 }, dropRate = ".2-10" }, -- Harnessing Shadows
    { id = 18361, container = { 18473 }, dropRate = ".2-10" }, -- The Greatest Race of Hunters
    { id = 18362, container = { 18469 }, dropRate = ".2-10" }, -- Holy Bologna: What the Light Won't Tell You
    { id = 18363, container = { 18471 }, dropRate = ".2-10" }, -- Frost Shock and You
    { id = 18364, container = { 18470 }, dropRate = ".2-10" }, -- The Emerald Dream
    {},
    { id = 18401, container = { 18348 }, dropRate = ".2-10" }, -- Foror's Compendium of Dragon Slaying
}

AtlasTW.InstanceData.DireMaulEast = {
    Name = BZ["Dire Maul (East)"],
    Location = BZ["Feralas"],
    Level = { 50, 58 },
    Acronym = "DME",
    MaxPlayers = 5,
    DamageType = L["Nature"] .. ", " .. L["Arcane"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Back Entrance"] },
        { letter = "C) " .. L["Lariss Pavilion"] },
        { letter = "D) " .. L["Exit"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = BB["Pusillin"].." <"..L["Chase Begins"]..">",
            color = "|cff9d9d9d",
        },
        {
            id = "DMEPusillin",
            prefix = "2)",
            name = BB["Pusillin"],
            postfix = L["Chase Ends"],
            defaults = { dropRate = 100 },
            loot = {
                { id = 18267, container = { 18254 } }, -- Recipe: Runn Tum Tuber Surprise
                {},
                { id = 18249, disc = "Key" }, -- Crescent Key
                {},
                { id = 18261 }, -- Book of Incantations
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 1 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 1 }, -- Libram of Focus
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEZevrimThornhoof",
            prefix = "3)",
            name = BB["Zevrim Thornhoof"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 18319 }, -- Fervent Helm
                { id = 18313 }, -- Helm of Awareness
                { id = 18323 }, -- Satyr's Bow
                {},
                { id = 18308 }, -- Clever Hat
                { id = 18306 }, -- Gloves of Shadowy Mist
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 1 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 1 }, -- Libram of Focus
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEHydro",
            name = BB["Hydrospawn"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 18317 }, -- Tempest Talisman
                { id = 18322 }, -- Waterspout Boots
                { id = 18324 }, -- Waveslicer
                {},
                { id = 19268, dropRate = 2, container = { 19289 } }, -- Ace of Elementals
                {},
                { id = 18305 }, -- Breakwater Legguards
                { id = 18307 }, -- Riptide Shoes
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 1 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 1 }, -- Libram of Focus
                {},
                { id = 18299, dropRate = 100 }, -- Hydrospawn Essence
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                unpack(ShareLoot),
            }
        },
        {
            id = "DMELethtendris",
            name = BB["Lethtendris"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 18325 }, -- Felhide Cap
                { id = 18311 }, -- Quel'dorei Channeling Rod
                {},
                { id = 18301 }, -- Lethtendris's Wand
                { id = 18302 }, -- Band of Vigor
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 1 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 1 }, -- Libram of Focus
                {},
                { id = 18426, dropRate = 100 }, -- Lethtendris's Web
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEPimgib",
            name = BB["Pimgib"],
            loot = {
                { id = 18354, dropRate = 14 }, -- Pimgib's Collar
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 1 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 1 }, -- Libram of Focus
                {},
                unpack(ShareLoot),
            }
        },
        {
            prefix = "4)",
            name = L["Old Ironbark"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMEAlzzin",
            prefix = "5)",
            name = BB["Alzzin the Wildshaper"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 18328 }, -- Shadewood Cloak
                { id = 18312 }, -- Energized Chestplate
                { id = 18309 }, -- Gloves of Restoration
                { id = 18326 }, -- Razor Gauntlets
                { id = 18327 }, -- Whipvine Cord
                { id = 18318 }, -- Merciful Greaves
                { id = 18321 }, -- Energetic Rod
                { id = 18310 }, -- Fiendish Machete
                { id = 18314 }, -- Ring of Demonic Guile
                { id = 18315 }, -- Ring of Demonic Potency
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 1 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 1 }, -- Libram of Focus
                {},
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 83574, disc = L["Book"] }, -- Book of Wrath IX
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                        70234, 70235, 70236, 70238 } },
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEIsalien",
            name = BB["Isalien"],
            postfix = L["Summon"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 22304 }, -- Ironweave Gloves
                { id = 22472 }, -- Boots of Ferocity
                { id = 22401 }, -- Libram of Hope
                { id = 22345 }, -- Totem of Rebirth
                { id = 22315 }, -- Hammer of Revitalization
                { id = 22314 }, -- Huntsman's Harpoon
                {},
                { id = 21984, dropRate = 100, container = { 22057 } }, -- Left Piece of Lord Valthalak's Amulet
                { id = 22046, dropRate = 100, container = { 22057 } }, -- Right Piece of Lord Valthalak's Amulet
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "DMETrash",
            name = L["Trash Mobs"].."-"..BZ["Dire Maul (East)"],
            defaults = { dropRate = .5 },
            loot = {
                { id = 18289 }, -- Barbed Thorn Necklace
                { id = 18296, dropRate = .75 }, -- Marksman Bands
                { id = 18298, dropRate = .75 }, -- Unbridled Leggings
                { id = 18295, dropRate = .58 }, -- Phasing Boots
                {},
                { id = 18255, disc = L["Consumable"], dropRate = .3 }, -- Runn Tum Tuber
                { id = 18297 }, -- Thornling Seed
            }
        },
        {
            id = "DMEShard",
            name = L["Felvine Shard"],
            loot = {
                { id = 18501, disc = L["Quest Item"] }, -- Felvine Shard
            }
        },
        {
            id = "DMTome",
            prefix = "1')",
            name = L["A Dusty Tome"],
            postfix = L["Varies"],
            color = "|cff66cc33",
            loot = ShareLoot,
        },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
    }
}

AtlasTW.InstanceData.DireMaulWest = {
    Name = BZ["Dire Maul (West)"],
    Location = BZ["Feralas"],
    Level = { 50, 60 },
    Acronym = "DMW",
    MaxPlayers = 5,
    DamageType = L["Nature"] .. ", " .. L["Arcane"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Pylons"] },
        { letter = "C) " .. BZ["Dire Maul (North)"] }
    },
    Keys = {
        { name = L["Crescent Key"], loot = "VanillaKeys" },
        { name = L["J'eevee's Jar"], loot = "VanillaKeys", info = BB["Lord Hel'nurath"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = L["Shen'dralar Ancient"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWTendrisWarpwood",
            prefix = "2)",
            name = BB["Tendris Warpwood"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 18393 }, -- Warpwood Binding
                { id = 18390 }, -- Tanglemoss Leggings
                {},
                { id = 18352 }, -- Petrified Bark Shield
                { id = 18353 }, -- Stoneflower Staff
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot),
            }
        },
        {
            name = L["Ancient Equine Spirit"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWIllyannaRavenoak",
            prefix = "3)",
            name = BB["Illyanna Ravenoak"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 18383 }, -- Force Imbued Gauntlets
                { id = 18386 }, -- Padre's Trousers
                {},
                { id = 18349 }, -- Gauntlets of Accuracy
                { id = 18347 }, -- Well Balanced Axe
                {},
                { id = 55580, disc = L["Book"] }, -- Codex of Searing Shot V
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 41457, dropRate = 100 }, -- Bow of Oaks
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot),
            }
        },
        {
            name = L["Ferra"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWMagisterKalendris",
            prefix = "4)",
            name = BB["Magister Kalendris"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 18374 }, -- Flamescarred Shoulders
                { id = 18397 }, -- Elder Magus Pendant
                { id = 18371 }, -- Mindtap Talisman
                {},
                { id = 18350 }, -- Amplifying Cloak
                { id = 18351 }, -- Magically Sealed Bracers
                {},
                { id = 22309, dropRate = 15, container = { 22249 } }, -- Pattern: Big Bag of Enchantment
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMWTsuzee",
            prefix = "5)",
            name = BB["Tsu'zee"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 18387 }, -- Brightspark Gloves
                {},
                { id = 18346 }, -- Threadbare Trousers
                { id = 18345 }, -- Murmuring Ring
            }
        },
        {
            id = "DMWImmolthar",
            prefix = "6)",
            name = BB["Immol'thar"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 18381 }, -- Evil Eye Pendant
                { id = 18384 }, -- Bile-etched Spaulders
                { id = 18389 }, -- Cloak of the Cosmos
                { id = 18385 }, -- Robe of Everlasting Night
                { id = 18394 }, -- Demon Howl Wristguards
                { id = 18377 }, -- Quickdraw Gloves
                { id = 18391 }, -- Eyestalk Cord
                { id = 18379 }, -- Odious Greaves
                { id = 18370 }, -- Vigilance Charm
                { id = 18372 }, -- Blade of the New Moon
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                { id = 61232, dropRate = 100, container = { 61234 } }, -- Arcanized Gems
                { id = 60332, dropRate = 100, container = { 60333, 60334 } }, -- Pure Ley Essence
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "DMWHelnurath",
            name = BB["Lord Hel'nurath"],
            postfix = L["Rare"] .. ", " .. L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 18757 }, -- Diabolic Mantle
                { id = 18754 }, -- Fel Hardened Bracers
                { id = 18755 }, -- Xorothian Firestick
                { id = 18756 }, -- Dreadguard's Protector
            }
        },
        {
            id = "DMWPrinceTortheldrin",
            prefix = "7)",
            name = BB["Prince Tortheldrin"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 18382 }, -- Fluctuating Cloak
                { id = 18373 }, -- Chestplate of Tranquility
                { id = 18375 }, -- Bracers of the Eclipse
                { id = 18378 }, -- Silvermoon Leggings
                { id = 18380 }, -- Eldritch Reinforced Legplates
                { id = 18395 }, -- Emerald Flame Ring
                { id = 18388 }, -- Stoneshatter
                { id = 18396 }, -- Mind Carver
                { id = 18376 }, -- Timeworn Mace
                { id = 18392 }, -- Distracting Dagger
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 3 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                { id = 61232, dropRate = 100, container = { 61234 } }, -- Arcanized Gems
                { id = 60332, dropRate = 100, container = { 60333, 60334 } }, -- Pure Ley Essence
                { id = 61461, dropRate = 100, container = { 61465 } }, -- Arcane Focus
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
            }
        },
        {
            name = L["The Prince's Chest"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWRevanchion",
            prefix = "8)",
            name = BB["Revanchion"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 23127 }, -- Cloak of Revanchion
                { id = 23129 }, -- Bracers of Mending
                { id = 23128 }, -- The Shadow's Grasp
            }
        },
        {
            id = "DMWTrash",
            name = L["Trash Mobs"].."-"..BZ["Dire Maul (West)"],
            defaults = { dropRate = 1.4 },
            loot = {
                { id = 18340, dropRate = 1.4 }, -- Eidolon Talisman
                { id = 18344, dropRate = 0.66 }, -- Stonebark Gauntlets
                { id = 18338, dropRate = 2 }, -- Wand of Arcane Potency
                { id = 61673, disc = L["Reagent"], dropRate = 3 }, -- Arcane Essence
            }
        },
        {
            prefix = "1')",
            name = L["Library"],
            color = "|cff66cc33",
        },
        {
            name = L["Falrin Treeshaper"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Lydros"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Javon"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Kildrath"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Mykos"],
            color = "|cff66cc33",
        },
        {
            id = "DMWShendralarProvisioner",
            name = L["Shen'dralar Provisioner"],
            color = "|cff66cc33",
            loot = {
                { id = 18487, disc = L["Vendor"], container = { 18486 } }, -- Pattern: Mooncloth Robe
            }
        },
        {
            name = L["Skeletal Remains of Kariel Winthalus"],
            color = "|cff66cc33",
        },
        {
            id = "DMTome",
            prefix = "2')",
            name = L["A Dusty Tome"],
            postfix = L["Varies"],
            loot = ShareLoot,
        },
    }
}

AtlasTW.InstanceData.DireMaulNorth = {
    Name = BZ["Dire Maul (North)"],
    Location = BZ["Feralas"],
    Level = { 57, 60 },
    Acronym = "DMN",
    MaxPlayers = 5,
    DamageType = L["Physical"] .. ", " .. L["Nature"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Library"] },
        { letter = "C) " .. BZ["Dire Maul (West)"] }
    },
    Keys = {
        { name = L["Crescent Key"], loot = "VanillaKeys" },
        { name = L["Gordok Courtyard Key"], loot = "VanillaKeys" },
        { name = L["Gordok Inner Door Key"], loot = "VanillaKeys" }
    },
    Bosses = {
        {
            id = "DMNGuardMoldar",
            prefix = "1)",
            name = BB["Guard Mol'dar"],
            defaults = { dropRate = 8 },
            loot = {
                { id = 18494 }, -- Denwatcher's Shoulders
                { id = 18493 }, -- Bulky Iron Spaulders
                { id = 18496 }, -- Heliotrope Cloak
                { id = 18497 }, -- Sublime Wristguards
                { id = 18498 }, -- Hedgecutter
                {},
                { id = 18450 }, -- Robe of Combustion
                { id = 18458 }, -- Modest Armguards
                { id = 18459 }, -- Gallant's Wristguards
                { id = 18451 }, -- Hyena Hide Belt
                { id = 18462 }, -- Jagged Bone Fist
                { id = 18463 }, -- Ogre Pocket Knife
                { id = 18464 }, -- Gordok Nose Ring
                { id = 18460 }, -- Unsophisticated Hand Cannon
                {},
                { id = 18250, disc = L["Key"], dropRate = 13 }, -- Gordok Shackle Key
                { id = 18268, disc = L["Key"], dropRate = 100 }, -- Gordok Inner Door Key
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 21982, dropRate = 50, container = { 22149, 22150 } }, -- Ogre Warbeads
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "DMNStomperKreeg",
            prefix = "2)",
            name = BB["Stomper Kreeg"],
            loot = {
                { id = 18425, dropRate = 40 }, -- Kreeg's Mug
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 21982, dropRate = 50, quantity = { 2, 3 }, container = { 22149, 22150 } }, -- Ogre Warbeads
                {},
                { id = 18269, disc = L["Vendor"] }, -- Gordok Green Grog
                { id = 18284, disc = L["Vendor"] }, -- Kreeg's Stout Beatdown
                { id = 18287, disc = L["Vendor"] }, -- Evermurky
                { id = 18288, disc = L["Vendor"] }, -- Molasses Firewater
                { id = 9260, disc = L["Vendor"] }, -- Volatile Rum
            }
        },
        {
            id = "DMNGuardFengus",
            prefix = "3)",
            name = BB["Guard Fengus"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 18450 }, -- Robe of Combustion
                { id = 18458 }, -- Modest Armguards
                { id = 18459 }, -- Gallant's Wristguards
                { id = 18451 }, -- Hyena Hide Belt
                { id = 18462 }, -- Jagged Bone Fist
                { id = 18463 }, -- Ogre Pocket Knife
                { id = 18464 }, -- Gordok Nose Ring
                { id = 18460 }, -- Unsophisticated Hand Cannon
                {},
                { id = 18250, disc = L["Key"] }, -- Gordok Shackle Key
                { id = 18266, disc = L["Key"], dropRate = 1.2 }, -- Gordok Courtyard Key
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNThimblejack",
            prefix = "4)",
            name = L["Knot Thimblejack"],
            postfix = L["Cache"],
            loot = {
                { id = 18414, dropRate = 2, container = { 18405 } }, -- Pattern: Belt of the Archmage
                { id = 18517, dropRate = 2, container = { 18509 } }, -- Pattern: Chromatic Cloak
                { id = 18518, dropRate = 2, container = { 18510 } }, -- Pattern: Hide of the Wild
                { id = 18519, dropRate = 2, container = { 18511 } }, -- Pattern: Shifting Cloak
                {},
                { id = 18415, dropRate = 13, container = { 18407 } }, -- Pattern: Felcloth Gloves
                { id = 18416, dropRate = 13, container = { 18408 } }, -- Pattern: Inferno Gloves
                { id = 18417, dropRate = 13, container = { 18409 } }, -- Pattern: Mooncloth Gloves
                { id = 18418, dropRate = 13, container = { 18413 } }, -- Pattern: Cloak of Warding
                { id = 18514, dropRate = 13, container = { 18504 } }, -- Pattern: Girdle of Insight
                { id = 18515, dropRate = 13, container = { 18506 } }, -- Pattern: Mongoose Boots
                { id = 18516, dropRate = 13, container = { 18508 } }, -- Pattern: Swift Flight Bracers
                {},
                { id = 18240, disc = L["Misc"], dropRate = 35, container = { 18258 } }, -- Ogre Tannin
            }
        },
        {
            id = "DMNGuardSlipkik",
            name = BB["Guard Slip'kik"],
            defaults = { dropRate = 8 },
            loot = {
                { id = 18494 }, -- Denwatcher's Shoulders
                { id = 18493 }, -- Bulky Iron Spaulders
                { id = 18496 }, -- Heliotrope Cloak
                { id = 18497 }, -- Sublime Wristguards
                { id = 18498 }, -- Hedgecutter
                {},
                { id = 18450 }, -- Robe of Combustion
                { id = 18458 }, -- Modest Armguards
                { id = 18459 }, -- Gallant's Wristguards
                { id = 18451 }, -- Hyena Hide Belt
                { id = 18462 }, -- Jagged Bone Fist
                { id = 18463 }, -- Ogre Pocket Knife
                { id = 18464 }, -- Gordok Nose Ring
                { id = 18460 }, -- Unsophisticated Hand Cannon
                {},
                { id = 18250, disc = L["Key"], dropRate = 13 }, -- Gordok Shackle Key
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 21982, dropRate = 50, quantity = { 2, 3 }, container = { 22149, 22150 } }, -- Ogre Warbeads
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNCaptainKromcrush",
            prefix = "5)",
            name = BB["Captain Kromcrush"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 18503 }, -- Kromcrush's Chestplate
                { id = 18505 }, -- Mugger's Belt
                { id = 18507 }, -- Boots of the Full Moon
                { id = 18502 }, -- Monstrous Glaive
                {},
                { id = 18250, disc = L["Key"], dropRate = 13 }, -- Gordok Shackle Key
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNKingGordok",
            prefix = "6)",
            name = BB["King Gordok"],
            defaults = { dropRate = 13 },
            loot = {
                { id = 18526 }, -- Crown of the Ogre King
                { id = 18525 }, -- Bracers of Prosperity
                { id = 18527 }, -- Harmonious Gauntlets
                { id = 18524 }, -- Leggings of Destruction
                { id = 18521 }, -- Grimy Metal Boots
                { id = 18522 }, -- Band of the Ogre King
                { id = 18523 }, -- Brightly Glowing Stone
                { id = 18520 }, -- Barbarous Blade
                {},
                { id = 19258, dropRate = 7, container = { 19287 } }, -- Ace of Warlords
                { id = 18780, dropRate = 9, container = { 18769 } }, -- Top Half of Advanced Armorsmithing: Volume I
                { id = 12727, container = { 12618 }, dropRate = 0 }, -- Plans: Enchanted Thorium Breastplate
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                        70234, 70235, 70236, 70238 } },
                { id = 47413, dropRate = 10, container = { 47412 } }, -- Recipe: Concoction of the Arcane Giant
                { id = 47415, dropRate = 10, container = { 47414 } }, -- Recipe: Concoction of the Dreamwater
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 21982, dropRate = 50, quantity = { 2, 3 }, container = { 22149, 22150 } }, -- Ogre Warbeads
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNChoRush",
            name = BB["Cho'Rush the Observer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 18490 }, -- Insightful Hood
                { id = 18483 }, -- Mana Channeling Wand
                { id = 18485 }, -- Observer's Shield
                { id = 18484 }, -- Cho'Rush's Blade
                {},
                { id = 18332, disc = L["Quest Item"], container = { 18329 }, dropRate = 2 }, -- Libram of Rapidity
                { id = 18333, disc = L["Quest Item"], container = { 18330 }, dropRate = 2 }, -- Libram of Focus
                { id = 18334, disc = L["Quest Item"], container = { 18331 }, dropRate = 2 }, -- Libram of Protection
                { id = 21982, dropRate = 50, quantity = { 2, 3 }, container = { 22149, 22150 } }, -- Ogre Warbeads
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNTributeRun",
            name = L["Tribute Run"],
            defaults = { dropRate = 11 },
            loot = {
                { id = 18538, dropRate = 1 }, -- Treant's Bane
                {},
                { id = 18528, dropRate = 33 }, -- Cyclone Spaulders
                { id = 18495, dropRate = 25 }, -- Redoubt Cloak
                { id = 18532, dropRate = 23 }, -- Mindsurge Robe
                { id = 18530, dropRate = 23 }, -- Ogre Forged Hauberk
                { id = 18533, dropRate = 25 }, -- Gordok Bracers of Power
                { id = 18529, dropRate = 33 }, -- Elemental Plate Girdle
                { id = 18500, dropRate = 33 }, -- Tarnished Elven Ring
                { id = 18537, dropRate = 25 }, -- Counterattack Lodestone
                { id = 18499, dropRate = 23 }, -- Barrier Shield
                { id = 18531, dropRate = 23 }, -- Unyielding Maul
                { id = 18534, dropRate = 25 }, -- Rod of the Ogre Magi
                {},
                { id = 18479 }, -- Carrion Scorpid Helm
                { id = 18480 }, -- Scarab Plate Helm
                { id = 18478 }, -- Hyena Hide Jerkin
                { id = 18475 }, -- Oddly Magical Belt
                { id = 18477 }, -- Shaggy Leggings
                { id = 18476 }, -- Mud Stained Boots
                { id = 18482 }, -- Ogre Toothpick Shooter
                { id = 18481 }, -- Skullcracking Mace
                { id = 18655, container = { 18637 } }, -- Schematic: Major Recombobulator
            }
        },
        {
            id = "DMNTrash",
            name = L["Trash Mobs"].."-"..BZ["Dire Maul (North)"],
            loot = {
                { id = 18250, disc = L["Key"], dropRate = 4 }, -- Gordok Shackle Key
                { id = 18640, disc = L["Misc"], dropRate = 2 }, -- Happy Fun Rock
            }
        },
        {
            prefix = "1')",
            name = L["Library"],
            color = "|cff66cc33",
        },
        {
            name = L["Falrin Treeshaper"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Lydros"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Javon"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Kildrath"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Mykos"],
            color = "|cff66cc33",
        },
        {
            id = "DMWShendralarProvisioner",
            name = L["Shen'dralar Provisioner"],
            color = "|cff66cc33",
            loot = {
                { id = 18487, disc = L["Vendor"], container = { 18486 } }, -- Pattern: Mooncloth Robe
            }
        },
        {
            name = L["Skeletal Remains of Kariel Winthalus"],
            color = "|cff66cc33",
        },
        {
            id = "DMTome",
            prefix = "2')",
            name = L["A Dusty Tome"],
            postfix = L["Varies"],
            loot = ShareLoot,
        },
    }
}

AtlasTW.InstanceData.DireMaulEnt = {
    Name = BZ["Dire Maul"] .. " (" .. L["Entrance"] .. ")",
    Location = BZ["Feralas"],
    Acronym = "DM",
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. BZ["Dire Maul"] .. " (" .. L["East"] .. ")" },
        { letter = "C) " .. BZ["Dire Maul"] .. " (" .. L["North"] .. ")" },
        { letter = "D) " .. BZ["Dire Maul"] .. " (" .. L["West"] .. ")" }
    },
    Bosses = {
        {
            prefix = "1)",
            name = L["Dire Pool"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name = L["Dire Maul Arena"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Mushgog"],
            postfix = L["Rare"] .. ", " .. L["Random"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Skarr the Unbreakable"],
            postfix = L["Rare"] .. ", " .. L["Random"],
            color = "|cff9d9d9d",
        },
        {
            name = L["The Razza"],
            postfix = L["Rare"] .. ", " .. L["Random"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Elder Mistwalker"],
            postfix = L["Lunar Festival"],
            color = "|cff9d9d9d",
            Items = "LunarFestival",
        },
        {
            prefix = "3)",
            name = L["Griniblix the Spectator"],
            color = "|cff9d9d9d",
        },
    }
}

for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulEast.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end

for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulWest.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end

for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulNorth.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end

for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end
