


local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}


AtlasTW.InstanceData.StormwindVault = {
    Name = BZ["Stormwind Vault"],
    Location = BZ["Stormwind City"],
    Level = { 58, 60 },
    Acronym = "SV",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A", info = L["Entrance"] }
},
    Bosses = {
        {
            id = "AszoshGrimflame",
            prefix = "1)",
            name = BB["Aszosh Grimflame"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 60504 }, -- Dreadskin Gloves
                { id = 60419 }, -- Necrolyte's Visage
                { id = 60425 }, -- Shadowguard Robe
                { id = 60434 }, -- Greaves of the Elite Guard
                {},
                { id = 60431 }, -- Almanac of Savagery
                { id = 60418 }, -- Sealbreaker Staff
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 } -- Fashion Coin
}
},
        {
            id = "ThamGrarr",
            prefix = "2)",
            name = BB["Tham'Grarr"],
            defaults = { dropRate = 17 },
            loot = {
                { id = 60502, disc = L["Random stats"] }, -- Unstable Belt
                { id = 60415 }, -- Ring of Twin Regeneration
                { id = 60424 }, -- Grellskin Gloves
                { id = 60435 }, -- Sabatons of the Elite Guard
                {},
                { id = 60416 }, -- Skull of Grarr
                { id = 60417 }, -- Skull of Tham
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 } -- Fashion Coin
}
},
        {
            id = "BlackBride",
            prefix = "3)",
            name = BB["Black Bride"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 60408 }, -- Crown of Lost Memories
                { id = 60409 }, -- Banshee's Veil
                { id = 60411 }, -- Boots of Crying Rivers
                { id = 60436 }, -- Sightless Leather Hood
                {},
                { id = 60410 }, -- Willbreaker
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 } -- Fashion Coin
}
},
        { name = L["Tome of Arcane Intricacies and Magical Phenomenon IX"], color = "|cff9d9d9d" },
        {
            id = "Damian",
            prefix = "4)",
            name = BB["Damian"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 60421 }, -- Damien's Sorrow
                { id = 60423 }, -- Bracers of Lost Souls
                { id = 60433 }, -- Pauldrons of the Elite Guard
                { id = 60500 }, -- Cloak of Atonement
                {},
                { id = 60427 }, -- Skullrattler
                { id = 60422, dropRate = 1 }, -- The Ripper
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 41463, dropRate = 100 }, -- Pouch of Surgical Daggers
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 } -- Fashion Coin
}
},
        {
            id = "VolkanCruelblade",
            prefix = "5)",
            name = BB["Volkan Cruelblade"],
            postfix = L["Optional"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 60412 }, -- Blackteeth Necklace
                { id = 60414 }, -- Blademaster's Blindfold
                { id = 60432 }, -- Gauntlets of the Elite Guard
                { id = 60503 }, -- Leggings of Alacrity
                {},
                { id = 60413 }, -- The Cruel Blade
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 } -- Fashion Coin
}
},
        {
            id = "VaultArmoryEquipment",
            prefix = "6)",
            name = L["Arc'tiras / Vault Armory Equipment"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 40003 }, -- Vault's Defender
                { id = 60505 }, -- Ring of the Elder Warden
                { id = 60506 }, -- Vigilance
                { id = 60501 }, -- Whip of Encouragement
                {},
                { id = 60420 }, -- Amulet of Warding
                { id = 60426 }, -- Guard-Captain's Chestplate
                { id = 60429 }, -- Arcanite Shackles
                { id = 60430 }, -- Runewarder's Boots
                {},
                { id = 83570, dropRate = 15 }, -- Technique: Die by the Sword
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 51217, disc = L["Transmogrification"], dropRate = 80 }, -- Fashion Coin
                { id = 41700, dropRate = 100, container = { 41704 } }, -- Lunar Token
                { id = 41406, dropRate = 100, container = { 55133, 55134, 55135 } } -- Core of Arc'Tiras

}
},
        {
            id = "TrashMobs",
            name = L["Trash Mobs"].."-"..BZ["Stormwind Vault"],
            defaults = { dropRate = .02 },
            loot = {
                { id = 61592 }, -- Arcanic Bracers
                { id = 61590 }, -- Helmet of the Elite Guard
                { id = 61591 }, -- Leggings of the Elite Guard
                { id = 61593 }, -- Shadow Silk Cloak
                {},
                { id = 61563 }, -- Grimoire of Grells
                {},
                { id = 61594 }, -- Magus Blade
                { id = 61595 } -- Sharpened Iron Bar
}
}
}
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.StormwindVault.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
