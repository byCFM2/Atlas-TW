---
--- KarazhanCrypt.lua - Karazhan Crypt instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Karazhan Crypt
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
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.KarazhanCrypt = {
    Name = BZ["Karazhan Crypt"],
    Location = BZ["Deadwind Pass"],
    Level = { 58, 60 },
    Acronym = "KC",
    MaxPlayers = 5,
    DamageType = L["Shadow"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Keys = {
        { name = L["Karazhan Crypt Key"], loot = "VanillaKeys" },
    },
    Bosses = {
        {
            id = "KCMarrowspike",
            prefix = "1)",
            name = BB["Marrowspike"],
            defaults = { dropRate = 18 },
            loot = {
                { id = 83441 }, -- Splintercage Breastplate
                { id = 83442 }, -- Miasma Walkers
                { id = 83443 }, -- The Crown of Shattering
                {},
                { id = 83444 }, -- Bonewall
                { id = 83445 }, -- Marrowclaw Knuckles
                { id = 83440, dropRate = 10 }, -- Boneshatter Maul
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "KCHivaxxis",
            prefix = "2)",
            name = BB["Hivaxxis"],
            defaults = { dropRate = 18 },
            loot = {
                { id = 83447 }, -- Clutch of Hivaxxis
                { id = 83448 }, -- Amice of the Webweaver
                { id = 83449 }, -- Darksoul Band
                { id = 83450 }, -- Soul of the Spider
                { id = 83451 }, -- Cowl of Mivax
                {},
                { id = 83446, dropRate = 10 }, -- Venom's Touch
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "KCCorpsemuncher",
            prefix = "3)",
            name = BB["Corpsemuncher"],
            defaults = { dropRate = 15 },
            loot = {
                { id = 70057 }, -- Crown of Eternal Sacrifice
                { id = 83459 }, -- Consumer Shackles
                { id = 83460 }, -- Deepearth Signet
                { id = 83462 }, -- Cadaverlink Vest
                { id = 83463 }, -- Rotworm Grips
                { id = 83458, dropRate = 10 }, -- Wormheart
                {},
                { id = 83461 }, -- Cryptkeeper's Pike
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "KCGuardCaptainGort",
            prefix = "4)",
            name = BB["Guard Captain Gort"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 60792 }, -- Pauldrons of Elusiveness
                { id = 60793 }, -- Signet of Expertise
                { id = 60794 }, -- Battle Bishop's Robe
                { id = 60795 }, -- Naturalist Wristbands
                { id = 60790 }, -- Memento of the Lost
                { id = 60791 }, -- Skullcrushing Gauntlets
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "KCArchlichEnkhraz",
            prefix = "5)",
            name = BB["Archlich Enkhraz"],
            defaults = { dropRate = 18 },
            loot = {
                { id = 83454 }, -- Deathrune Leggings
                { id = 83455 }, -- Frostchain Greaves
                { id = 83456 }, -- Shroud of the Archlich
                { id = 83457 }, -- Glacier Pendant
                {},
                { id = 83452, dropRate = 10 }, -- Windbreaker
                { id = 83453 }, -- Tome of Shivering Secrets
                {},
                { id = 80010, dropRate = 5 }, -- Midnight
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "KCCommanderAndreon",
            prefix = "6)",
            name = BB["Commander Andreon"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 50188 }, -- Deathforge Belt
                { id = 50189 }, -- Ring of Authority
                { id = 50190 }, -- Boots of the Holy Mentor
                { id = 50191 }, -- Frostchain Gauntlets
                { id = 50192 }, -- Band of Arcane Dampening
                { id = 50193 }, -- Gravewalker Pauldrons
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
            }
        },
        {
            id = "KCAlarus",
            prefix = "7)",
            name = BB["Alarus"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 83465 }, -- Shroud of Haunted Torment
                { id = 83466 }, -- Baneforged Leggings
                { id = 83467 }, -- Cryptwatcher's Call
                { id = 83468 }, -- Corpsekeeper's Charge
                {},
                { id = 83469, dropRate = 21 }, -- Cryptstone Circlet
                { id = 83470, dropRate = 21 }, -- Wraithscale Leggings
                { id = 83471, dropRate = 21 }, -- Staff of Alarus
                { id = 83472, dropRate = 21 }, -- Cover of the Necromancer
                {},
                { id = 83464, dropRate = 1 }, -- Mantle of Twisted Damnation
                {},
                { id = 83571, disc = L["Book"], dropRate = 15 }, -- Codex: Shadow Mend
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                        70234, 70235, 70236, 70238 } },
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], quantity = 2, dropRate = 100 }, -- Fashion Coin
            }
        },
        {
            id = "KCTreasure",
            prefix = "8)",
            name = L["Half-Buried Treasure Chest"],
            loot = {
                { id = 5823, disc = L["Consumable"], dropRate = 100 }, -- Poisonous Mushroom
                { id = 11938, disc = L["Container"], dropRate = 100 }, -- Sack of Gems
                { id = 13456, disc = L["Consumable"], dropRate = 100 }, -- Greater Frost Protection Potion
                { id = 60799, dropRate = 14 }, -- Gauntlets of the Lost Crusader
                {},
                { id = 60802, dropRate = 14 }, -- Shawl of the Forgotten
                { id = 60796, dropRate = 14 }, -- Blade of Rotting
                { id = 60797, dropRate = 14 }, -- Rotskin Leggings
                { id = 60798, dropRate = 14 }, -- Loop of the Lost
                {},
                { id = 60800, dropRate = 14 }, -- Femur Club
                { id = 60801, dropRate = 14 }, -- Tome of Dark Powers
            }
        },
        {
            id = "KCTrash",
            name = L["Trash Mobs"].."-"..BZ["Karazhan Crypt"],
            defaults = { dropRate = .01 },
            loot = {
                { id = 60803 }, -- Claw of Darkness
                { id = 60804 }, -- Shade of Reminisce
                { id = 60805 }, -- Clutch of the Damned
                { id = 60806 }, -- Coldheart Icicle
                { id = 60807 }, -- Grave Robber's Treads
                { id = 60809 }, -- Remains of the Lost
                { id = 18742, dropRate = 0.02 }, -- Stratholme Militia Shoulderguard
                { id = 18743, dropRate = 0.0935 }, -- Gracious Cape
                { id = 17061, dropRate = 0.02 }, -- Juno's Shadow
                { id = 18741, dropRate = 0.02 }, -- Morlune's Bracer
                { id = 18744, dropRate = 0.04 }, -- Plaguebat Fur Gloves
                { id = 18745, dropRate = 0.06 }, -- Sacred Cloth Leggings
                { id = 18736, dropRate = 0.02 }, -- Plaguehound Leggings
                { id = 18698, dropRate = 0.6 }, -- Tattered Leather Hood
                { id = 18699, dropRate = 0.02 }, -- Icy Tomb Spaulders
                { id = 14536, dropRate = 0.06 }, -- Bonebrace Hauberk
                { id = 18700, dropRate = 0.02 }, -- Malefic Bracers
                { id = 18702, dropRate = 0.02 }, -- Belt of the Ordained
                { id = 18697, dropRate = 0.26 }, -- Coldstone Slippers
                { id = 18701, dropRate = 0.06 }, -- Innervating Band
                {},
                { id = 60808 }, -- Bone Fracture
                {},
                { id = 41416, dropRate = 100, container = { 92045 } }, -- Crumpled Paper
            },
        }
    }
}
-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.KarazhanCrypt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
