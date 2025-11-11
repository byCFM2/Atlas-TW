---
--- ScarletMonastery.lua - Scarlet Monastery dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Scarlet Monastery
--- 5-player dungeon instance. It includes all four wings (Graveyard, Library, Armory, Cathedral)
--- with their respective boss encounters, rare drops, and dungeon-specific items.
---
--- Features:
--- • Complete four-wing boss encounters
--- • Rare and uncommon item drops
--- • Dungeon entrance and layout data
--- • Level-appropriate loot organization
--- • Quest reward items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")
local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.ScarletMonasteryLibrary = {
    Name = BZ["Scarlet Monastery (Library)"],
    Location = BZ["Tirisfal Glades"],
    Level = { 21, 39 },
    Acronym = "SM Lib",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Bosses = {
        {
            id = "SMHoundmasterLoksey",
            prefix = "1)",
            name = BB["Houndmaster Loksey"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 7710 }, -- Loksey's Training Stick
                { id = 7756 }, -- Dog Training Gloves
                { id = 3456 }, -- Dog Whistle
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "SMDoan",
            prefix = "2)",
            name = BB["Arcanist Doan"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 7714 }, -- Hypnotic Blade
                { id = 7713 }, -- Illusionary Rod
                { id = 7712 }, -- Mantle of Doan
                { id = 7711 }, -- Robe of Doan
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "SMDoansBox",
            prefix = "1)",
            name = L["Doan's Strongbox"],
            color = Colors.GREEN,
            loot = {
                { id = 7146, disc = L["Key"] }, -- The Scarlet Key
            }
        },
        {
            id = "SMBrotherWystan",
            prefix = "3)",
            name = BB["Brother Wystan"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55473 }, -- Pendant of Scarlet Rage
                { id = 55472 }, -- Swiftstrike Kilt
                { id = 55471 }, -- Wystan's Steel Fist
                { id = 55470 }, -- Libram of Radiance
            }
        },
        {
            id = "SMLTrash",
            name = L["Trash Mobs"].."-"..BZ["Scarlet Monastery"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 5819 }, -- Sunblaze Coif
                { id = 80790, dropRate = .1 }, -- Attuned Shoulders
                { id = 7755 }, -- Flintrock Shoulders
                { id = 7727 }, -- Watchman Pauldrons
                { id = 7728 }, -- Beguiler Robes
                { id = 80791, dropRate = .02 }, -- Robe of Divinity
                { id = 7759 }, -- Archon Chestpiece
                { id = 7760 }, -- Warchief Kilt
                { id = 7754 }, -- Harbinger Boots
                { id = 10332, dropRate = .1 }, -- Scarlet Boots
                { id = 1992 }, -- Swampchill Fetish
                { id = 2262 }, -- Mark of Kern
                { id = 7787 }, -- Resplendent Guardian
                { id = 7729 }, -- Chesterfall Musket
                { id = 7761 }, -- Steelclaw Reaver
                { id = 7752 }, -- Dreamslayer
                { id = 8226 }, -- The Butcher
                { id = 7786 }, -- Headsplitter
                { id = 5756 }, -- Sliverblade
                { id = 7736 }, -- Fight Club
                { id = 8225 }, -- Tainted Pierce
                { id = 7753 }, -- Bloodspiller
                { id = 7730 }, -- Cobalt Crusher
                { id = 7758 }, -- Ruthless Shiv
                { id = 7757 }, -- Windweaver Staff
                { id = 80794, dropRate = .02 }, -- Ironfist
                { id = 80799, dropRate = .02 }, -- Wand of Divine Justice
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "Scarlet" },
    }
}

AtlasTW.InstanceData.ScarletMonasteryArmory = {
    Name = BZ["Scarlet Monastery (Armory)"],
    Location = BZ["Tirisfal Glades"],
    Level = { 25, 40 },
    Acronym = "SM Arm",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Keys = {
        { name = L["The Scarlet Key"], loot = "VanillaKeys" }
    },
    Bosses = {
        {
            id = "SMHerod",
            prefix = "1)",
            name = BB["Herod"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 7719 }, -- Raging Berserker's Helm
                { id = 7718 }, -- Herod's Shoulder
                { id = 10330 }, -- Scarlet Leggings
                { id = 7717 }, -- Ravager
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "SMQuartermasterDaghelm",
            name = BB["Armory Quartermaster Daghelm"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55477 }, -- Loop of Focused Magic
                { id = 55476 }, -- Treads of Renewal
                { id = 55475 }, -- Cuffs of Evocation
                { id = 55474 }, -- Balanced Razor Shivs
                {},
                { id = 41411, container = { 7964, 7965 }, dropRate = 100 }, -- Journal of Basil Frye
            }
        },
        {
            id = "SMATrash",
            name = L["Trash Mobs"].."-"..BZ["Scarlet Monastery (Armory)"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 5819 }, -- Sunblaze Coif
                { id = 7755 }, -- Flintrock Shoulders
                { id = 7727 }, -- Watchman Pauldrons
                { id = 7728 }, -- Beguiler Robes
                { id = 7759 }, -- Archon Chestpiece
                { id = 7754 }, -- Harbinger Boots
                { id = 10332, dropRate = 0.1 }, -- Scarlet Boots
                { id = 1992 }, -- Swampchill Fetish
                { id = 2262 }, -- Mark of Kern
                { id = 7787 }, -- Resplendent Guardian
                { id = 7729 }, -- Chesterfall Musket
                { id = 7761 }, -- Steelclaw Reaver
                { id = 7752 }, -- Dreamslayer
                { id = 8226 }, -- The Butcher
                { id = 7786 }, -- Headsplitter
                { id = 5756 }, -- Sliverblade
                { id = 7736 }, -- Fight Club
                { id = 8225 }, -- Tainted Pierce
                { id = 80792 }, -- Hushblade
                { id = 7753 }, -- Bloodspiller
                { id = 7730 }, -- Cobalt Crusher
                { id = 7757 }, -- Windweaver Staff
                {},
                { id = 10333, dropRate = 1.6 }, -- Scarlet Wristguards
                { id = 10329, dropRate = 1.6 }, -- Scarlet Belt
                {},
                { id = 23192, dropRate = 1.6 }, -- Tabard of the Scarlet Crusade
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "Scarlet" },
    }
}

AtlasTW.InstanceData.ScarletMonasteryCathedral = {
    Name = BZ["Scarlet Monastery (Cathedral)"],
    Location = BZ["Tirisfal Glades"],
    Level = { 25, 45 },
    Acronym = "SMCath",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Keys = {
        { name = L["The Scarlet Key"], loot = "VanillaKeys" }
    },
    Bosses = {
        {
            id = "SMFairbanks",
            prefix = "1)",
            name = BB["High Inquisitor Fairbanks"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 19507 }, -- Inquisitor's Shawl
                { id = 19508 }, -- Branded Leather Bracers
                { id = 19509 }, -- Dusty Mail Boots
            }
        },
        {
            id = "SMMograine",
            prefix = "2)",
            name = BB["Scarlet Commander Mograine"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 7724 }, -- Gauntlets of Divinity
                { id = 10330 }, -- Scarlet Leggings
                { id = 7726 }, -- Aegis of the Scarlet Commander
                { id = 7723 }, -- Mograine's Might
                {},
                { id = 51804, dropRate = 8 }, -- Libram of the Resolute
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "SMWhitemane",
            prefix = "3)",
            name = BB["High Inquisitor Whitemane"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 7720 }, -- Whitemane's Chapeau
                { id = 7722 }, -- Triune Amulet
                { id = 7721 }, -- Hand of Righteousness
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "SMCTrash",
            name = L["Trash Mobs"].."-"..BZ["Scarlet Monastery (Cathedral)"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 5819 }, -- Sunblaze Coif
                { id = 7755 }, -- Flintrock Shoulders
                { id = 7727 }, -- Watchman Pauldrons
                { id = 7728 }, -- Beguiler Robes
                { id = 7759 }, -- Archon Chestpiece
                { id = 7760 }, -- Warchief Kilt
                { id = 7754 }, -- Harbinger Boots
                { id = 10332, dropRate = .1 }, -- Scarlet Boots
                { id = 1992 }, -- Swampchill Fetish
                { id = 2262 }, -- Mark of Kern
                { id = 7787 }, -- Resplendent Guardian
                { id = 7729 }, -- Chesterfall Musket
                { id = 7761 }, -- Steelclaw Reaver
                { id = 7752 }, -- Dreamslayer
                { id = 8226 }, -- The Butcher
                { id = 7786 }, -- Headsplitter
                { id = 5756 }, -- Sliverblade
                { id = 7736 }, -- Fight Club
                { id = 8225 }, -- Tainted Pierce
                { id = 80792 }, -- Hushblade
                { id = 7753 }, -- Bloodspiller
                { id = 7730 }, -- Cobalt Crusher
                { id = 7758 }, -- Ruthless Shiv
                { id = 7757 }, -- Windweaver Staff
                {},
                { id = 10328, dropRate = .3 }, -- Scarlet Chestpiece
                { id = 10331, dropRate = 1.7 }, -- Scarlet Gauntlets
                { id = 10329, dropRate = 1.6 }, -- Scarlet Belt
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "Scarlet" },
    }
}

AtlasTW.InstanceData.ScarletMonasteryGraveyard = {
    Name = BZ["Scarlet Monastery (Graveyard)"],
    Location = BZ["Tirisfal Glades"],
    Level = { 25, 36 },
    Acronym = "SMGY",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] }
    },
    Bosses = {
        {
            id = "SMVishas",
            prefix = "1)",
            name = BB["Interrogator Vishas"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 7682 }, -- Torturing Poker
                { id = 7683 }, -- Bloody Brass Knuckles
                {},
                { id = 80741, dropRate = 35 }, -- Torturer's Girdle
                { id = 80742, dropRate = 35 }, -- Searing Cowl
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            name = L["Vorrel Sengutz"],
            color = Colors.GREY,
        },
        {
            id = "SMScorn",
            prefix = "2)",
            name = BB["Scorn"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 23169 }, -- Scorn's Icy Choker
                { id = 23170 }, -- The Frozen Clutch
                { id = 23168 }, -- Scorn's Focal Dagger
            }
        },
        {
            id = "SMBloodmageThalnos",
            prefix = "3)",
            name = BB["Bloodmage Thalnos"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 7685 }, -- Orb of the Forgotten Seer
                { id = 7684 }, -- Bloodmage Mantle
                {},
                { id = 80743, dropRate = 35 }, -- Darkcaster Gloves
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "SMIronspine",
            prefix = "1')",
            name = L["Ironspine"],
            postfix = L["Rare"],
            color = Colors.GREEN,
            defaults = { dropRate = 33 },
            loot = {
                { id = 7688 }, -- Ironspine's Ribcage
                { id = 7687 }, -- Ironspine's Fist
                { id = 7686 }, -- Ironspine's Eye
            }
        },
        {
            id = "SMAzshir",
            name = BB["Azshir the Sleepless"],
            postfix = L["Rare"],
            color = Colors.GREEN,
            defaults = { dropRate = 33 },
            loot = {
                { id = 7709 }, -- Blighted Leggings
                { id = 7708 }, -- Necrotic Wand
                { id = 7731 }, -- Ghostshard Talisman
            }
        },
        {
            id = "SMFallenChampion",
            name = BB["Fallen Champion"],
            postfix = L["Rare"],
            color = Colors.GREEN,
            defaults = { dropRate = 33 },
            loot = {
                { id = 7691 }, -- Embalmed Shroud
                { id = 7690 }, -- Ebon Vise
                { id = 7689 }, -- Morbid Dawn
            }
        },
        {
            id = "SMDukeDreadmoore",
            prefix = "4)",
            name = BB["Duke Dreadmoore"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 55388 }, -- Slain Sentry's Ring
                { id = 55386 }, -- Harbinger Girdle
                { id = 55387 }, -- Introduction to the Dark Arts
                { id = 55389 }, -- Ghoulskin Treads
            }
        },
        {
            id = "SMGTrash",
            name = L["Trash Mobs"].."-"..BZ["Scarlet Monastery (Graveyard)"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 5819 }, -- Sunblaze Coif
                { id = 7727 }, -- Watchman Pauldrons
                { id = 7728 }, -- Beguiler Robes
                { id = 80791, dropRate = .02 }, -- Robe of Divinity
                { id = 7754 }, -- Harbinger Boots
                { id = 10332, dropRate = .1 }, -- Scarlet Boots
                { id = 2262 }, -- Mark of Kern
                { id = 7787 }, -- Resplendent Guardian
                { id = 7729 }, -- Chesterfall Musket
                { id = 7761 }, -- Steelclaw Reaver
                { id = 7752 }, -- Dreamslayer
                { id = 8226 }, -- The Butcher
                { id = 7786 }, -- Headsplitter
                { id = 7753 }, -- Bloodspiller
                { id = 7730 }, -- Cobalt Crusher
                { id = 80794, dropRate = .02 }, -- Ironfist
            }
        },
        { name = BIS["Chain of the Scarlet Crusade"], items = "Scarlet" },
    }
}

AtlasTW.InstanceData.ScarletMonasteryEnt = {
    Name = BZ["Scarlet Monastery"] .. " (" .. L["Entrance"] .. ")",
    Location = BZ["Tirisfal Glades"],
    Acronym = "SM",
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Graveyard"] },
        { letter = "C) " .. L["Cathedral"] },
        { letter = "D) " .. L["Armory"] },
        { letter = "E) " .. L["Library"] }
    },
    Bosses = {}
}

for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryLibrary.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end

for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryArmory.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end

for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryCathedral.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end

for _, bossData in ipairs(AtlasTW.InstanceData.ScarletMonasteryGraveyard.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end
