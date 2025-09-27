---
--- Uldaman.lua - Uldaman dungeon instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Uldaman
--- 5-player dungeon instance. It includes all boss encounters, rare drops,
--- and dungeon-specific items with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Mid-level dungeon item drops
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

AtlasTW.InstanceData.Uldaman = {
    Name = BZ["Uldaman"],
    Location = BZ["Badlands"],
    Level = { 30, 51 },
    Acronym = "Uld",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A", info = L["Entrance"] },
        { letter = "B", info = L["Back Door"] },
    },
    Keys = {
        { name = L["Staff of Prehistoria"], loot = "VanillaKeys", info = BB["Ironaya"] }
    },
    Bosses = {
        {
            id = "UldBaelog",
            prefix = "1)",
            name = BB["Baelog"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 9401 }, -- Nordic Longshank
                { id = 9400 }, -- Baelog's Shortbow
                {},
                { id = 9399, dropRate = 100, quantity = 175 }, -- Precision Arrow
            }
        },
        {
            id = "UldEric",
            name = BB["Eric \"The Swift\""],
            defaults = { dropRate = 50 },
            loot = {
                { id = 9394 }, -- Horned Viking Helmet
                { id = 9398 }, -- Worn Running Boots
                {},
                { id = 2459, disc = L["Consumable"], dropRate = 100 }, -- Swiftness Potion
            }
        },
        {
            id = "UldOlaf",
            name = BB["Olaf"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 9404 }, -- Olaf's All Purpose Shield
                { id = 9403 }, -- Battered Viking Shield
                {},
                { id = 1177, disc = L["Consumable"], dropRate = 100 }, -- Oil of Olaf
            }
        },
        {
            id = "UldBaelogsChest",
            name = L["Baelog's Chest"],
            loot = {
                { id = 7740, disc = L["Misc"], dropRate = 100, container = { 7733 } }, -- Gni'kiv Medallion
            }
        },
        {
            id = "UldConspicuousUrn",
            name = L["Conspicuous Urn"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldRemainsofaPaladin",
            prefix = "2)",
            name = L["Remains of a Paladin"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldRevelosh",
            prefix = "3)",
            name = BB["Revelosh"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 9389 }, -- Revelosh's Spaulders
                { id = 9388 }, -- Revelosh's Armguards
                { id = 9390 }, -- Revelosh's Gloves
                { id = 9387 }, -- Revelosh's Boots
                {},
                { id = 7741, disc = L["Misc"], dropRate = 100, container = { 7733 } }, -- The Shaft of Tsol
            }
        },
        {
            id = "UldIronaya",
            prefix = "4)",
            name = BB["Ironaya"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 9409 }, -- Ironaya's Bracers
                { id = 9407 }, -- Stoneweaver Leggings
                { id = 9408 }, -- Ironshod Bludgeon
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "UldObsidianSentinel",
            prefix = "5)",
            name = L["Obsidian Sentinel"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldAnnora",
            prefix = "6)",
            name = L["Annora"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldAncientStoneKeeper",
            prefix = "7)",
            name = BB["Ancient Stone Keeper"],
            defaults = { dropRate = 50 },
            loot = {
                { id = 9410 }, -- Cragfists
                { id = 9411 }, -- Rockshard Pauldrons
                {},
                { id = 80746, dropRate = 30 }, -- Rockshard Guard
            }
        },
        {
            id = "UldGalgannFirehammer",
            prefix = "8)",
            name = BB["Galgann Firehammer"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 11310 }, -- Flameseer Mantle
                { id = 9412 }, -- Galgann's Fireblaster
                { id = 11311 }, -- Emberscale Cape
                { id = 9419 }, -- Galgann's Firehammer
            }
        },
        {
            id = "UldTabletofWill",
            name = L["Tablet of Will"],
            loot = {
                { id = 5824, dropRate = 100, container = { 6723 } }, -- Tablet of Will
            }
        },
        {
            id = "UldShadowforgeCache",
            name = L["Shadowforge Cache"],
            loot = {
                { id = 7669, dropRate = 100, container = { 7888 } }, -- Shattered Necklace Ruby
            }
        },
        {
            id = "UldGrimlok",
            prefix = "9)",
            name = BB["Grimlok"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 9415 }, -- Grimlok's Tribal Vestments
                { id = 9416 }, -- Grimlok's Charge
                { id = 9414 }, -- Oilskin Leggings
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 1 }, -- Fashion Coin
            }
        },
        {
            id = "UldArchaedas",
            prefix = "10)",
            name = BB["Archaedas"]..": "..L["Lower"],
            defaults = { dropRate = 33 },
            loot = {
                { id = 11118 }, -- Archaedic Stone
                { id = 9413 }, -- The Rockpounder
                { id = 9418 }, -- Stoneslayer
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "UldTheDiscsofNorgannon",
            prefix = "11)",
            name = L["The Discs of Norgannon"]..": "..L["Lower"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldAncientTreasure",
            name = L["Ancient Treasure"]..": "..L["Lower"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldTrash",
            name = L["Trash Mobs"].."-"..BZ["Uldaman"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 9431 }, -- Papal Fez
                { id = 9429 }, -- Miner's Hat of the Deep
                { id = 80810 }, -- Lost Defender's Helmet
                { id = 9420 }, -- Adventurer's Pith Helmet
                { id = 9430 }, -- Spaulders of a Lost Age
                { id = 9397 }, -- Energy Cloak
                { id = 9406 }, -- Spirewind Fetter
                { id = 9428 }, -- Unearthed Bands
                { id = 9432 }, -- Skullplate Bracers
                { id = 9396 }, -- Legguards of the Vault
                { id = 9393 }, -- Beacon of Hope
                {},
                { id = 7666, dropRate = 100, container = { 7673 } }, -- Shattered Necklace
                {},
                { id = 9381 }, -- Earthen Rod
                { id = 9426 }, -- Monolithic Bow
                { id = 9422 }, -- Shadowforge Bushmaster
                { id = 9465 }, -- Digmaster 5000
                { id = 9384 }, -- Stonevault Shiv
                { id = 9386 }, -- Excavator's Brand
                { id = 9427 }, -- Stonevault Bonebreaker
                { id = 9392 }, -- Annealed Blade
                { id = 9424 }, -- Ginn-su Sword
                { id = 9383 }, -- Obsidian Cleaver
                { id = 9425 }, -- Pendulum of Doom
                { id = 9423 }, -- The Jackhammer
                { id = 9391 }, -- The Shoveler
            }
        },
    },
}

AtlasTW.InstanceData.UldamanEnt = {
    Name = BZ["Uldaman"]..": "..L["Entrance"],
    Location = BZ["Badlands"],
    Acronym = "Uld",
    Continent = 2,
    Entrances = {
        { letter = "A", info = L["Entrance"] },
        { letter = "B", info = BZ["Uldaman"] },
    },

    Bosses = {
        {
            id = "UldHammertoeGrez",
            prefix = "1)",
            name = L["Hammertoe Grez"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldMagreganDeepshadow",
            prefix = "2)",
            name = L["Magregan Deepshadow"],
            postfix = L["Wanders"],
            loot = {
                { id = 4635, dropRate = 100, container = { 4987, 6723 } }, -- Hammertoe's Amulet
            }
        },
        {
            id = "UldTabletofRyuneh",
            prefix = "3)",
            name = L["Tablet of Ryun'Eh"],
            loot = {
                { id = 4631, dropRate = 100, container = { 4746 } }, -- Tablet of Ryun'eh
            }
        },
        {
            id = "UldKromStoutarmChest",
            prefix = "4)",
            name = L["Krom Stoutarm's Chest"],
            loot = {
                { id = 8027, dropRate = 100 }, -- Krom Stoutarm's Treasure
            }
        },
        {
            id = "UldGarrettFamilyChest",
            prefix = "5)",
            name = L["Garrett Family Chest"],
            loot = {
                { id = 8026, dropRate = 100 }, -- Garrett Family Treasure
            }
        },
        {
            id = "UldShovelphlange",
            prefix = "1')",
            name = L["Digmaster Shovelphlange"],
            postfix = L["Rare"] .. ", " .. L["Varies"],
            color = "|cff66cc33",
            loot = {
                { id = 9375, dropRate = 10 }, -- Expert Goldminer's Helmet
                { id = 9378, dropRate = 15 }, -- Shovelphlange's Mining Axe
                {},
                { id = 9382, dropRate = 65 }, -- Tromping Miner's Boots
            }
        },
    },
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.UldamanEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Uldaman.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
