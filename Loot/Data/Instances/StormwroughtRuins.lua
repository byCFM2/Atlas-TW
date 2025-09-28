---
--- StormwroughtRuins.lua - Stormwrought Ruins instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Stormwrought Ruins
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
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.StormwroughtRuins = {
    Name = BZ["Stormwrought Ruins"],
    Location = BZ["Balor"],
    Level = { 35, 42 },
    Acronym = "SR",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)"..L["Entrance"].." "..L["Front"] },
        { letter = "B)"..L["Entrance"].." "..L["Back"] },
    },
    Keys = {
        { name = L["Key to Stormwrought Castle"], loot = "VanillaKeys", info = "6+" },
    },
    Bosses = {
        {
            id = "SROronok",
            prefix = "1)",
            name = BB["Oronok Torn-Heart"],--34
            defaults = { dropRate = 25 },
            loot = {
                { id = 58135 }, -- Dagger of Whispered Madness
                { id = 58136 }, -- Shadeweave Drape
                { id = 58137 }, -- Netherbranch
                { id = 58177 }, -- Stormreaver Robe
                {},
                { id = 41797, dropRate = 100, container = { 41798 } }, -- The Pendant of Uth'okk
            }
        },
        {
            id = "SRDagar",
            prefix = "2)",
            name = BB["Dagar the Glutton"],--34
            defaults = { dropRate = 25 },
            loot = {
                { id = 58130 }, -- Maneater Cleaver
                { id = 58132 }, -- Gluttonous Buckle
                { id = 58133 }, -- Handmaiden's Bracelet
                { id = 58176 }, -- Stormreaver Hood
            }
        },
        {
            id = "SRLibrarian",
            prefix = "3)",
            name = BB["Librarian Theodorus"],--35
            defaults = { dropRate = 25 },
            loot = {
                { id = 58138 }, -- Librarian's Encyclopedia
                { id = 58139 }, -- Libram of Virtue
                { id = 58140 }, -- Broken Goldrimmed Monocle
                { id = 58141 }, -- Boots of Silence
                {},
                { id = 41940, dropRate = 100, disc = L["Quest Item"], container = { 58279, 58280 } }, -- Compendium of Successful Trade
            }
        },
        {
            id = "SRDukeBalor",
            prefix = "4)",
            name = BB["Duke Balor the IV"],--36
            defaults = { dropRate = 25 },
            loot = {
                { id = 58142 }, -- Robes of the Dukedom
                { id = 58143 }, -- Kelpie's Legacy
                { id = 58144 }, -- Vander Legguards
                { id = 58145 }, -- Light's Sermon
                {},
                { id = 41857, container = { 58073 }, dropRate = 100 }, -- Balor Sigil Ring
                { id = 41921, container = { 58261, 58262 }, dropRate = 100 }, -- Crown of Balor
            }
        },
        {
            id = "SRStormsong",
            prefix = "5)",
            name = BB["Chieftain Stormsong"],--36
            defaults = { dropRate = 25 },
            loot = {
                { id = 58146 }, -- Totem of Tides
                { id = 58147 }, -- Stormreaver Mantle
                { id = 58148 }, -- Treads of the Unknown
                { id = 58149 }, -- Band of Subservience
                {},
                { id = 75, dropRate = 6, container = { 58134 } }, -- Pattern: Stormreaver Gloves
            }
        },
        {
            id = "SRDeathlord",
            prefix = "6)",
            name = BB["Deathlord Tidebane"],--38
            defaults = { dropRate = 25 },
            loot = {
                { id = 58150 }, -- Deathedge Sabre
                { id = 58151 }, -- Salt-encrusted Compass
                { id = 58152 }, -- Cloak of Black Fortitude
                { id = 58153 }, -- Shattered Soul Ring
                {},
                { id = 24, dropRate = 6 }, -- Formula: Enchant Bracer - Agility
                { id = 70, dropRate = 6, container = { 131 } }, -- Plans: Steel Belt Buckle
                {},
                { id = 58276, dropRate = 1 }, -- Hull of Forlorn Souls
                {},
                { id = 950, dropRate = .2 }, -- Stormwrought Deathsteed
            }
        },
        {
            id = "SRSubjugatorShadecrest",
            prefix = "7)",
            name = BB["Subjugator Halthas Shadecrest"],--37
            defaults = { dropRate = 25 },
            loot = {
                { id = 58183 }, -- Rod of Subjugation
                { id = 58184 }, -- Obedient Shackles
                { id = 58185 }, -- Leechmist Vine
                { id = 58186 }, -- Crown of Oppression
                {},
                { id = 83, dropRate = 6, container = { 56113 } }, -- Recipe: Elixir of Rapid Growth
            }
        },
        {
            id = "SRMycellakos",
            prefix = "8)",
            name = BB["Mycellakos"],--36
            defaults = { dropRate = 25 },
            loot = {
                { id = 58179 }, -- Idol of Propagation
                { id = 58180 }, -- Core of Mycellakos
                { id = 58181 }, -- Fungal Threads
                { id = 58182 }, -- Rusted Anchor
                {},
                { id = 41926, dropRate = 100, container = { 58268, 58269, 58270 } }, -- Heart of Mycellakos
            }
        },
        {
            id = "SREldermaw",
            prefix = "9)",
            name = BB["Eldermaw the Primordial"],--37
            defaults = { dropRate = 25 },
            loot = {
                { id = 58187 }, -- Primordial Pauldrons
                { id = 58188 }, -- Jaw of the Ancient
                { id = 58189 }, -- Pants of Forgotten Ages
                { id = 58190 }, -- Razorskin Cape
            }
        },
        {
            id = "SRLadyDrazare",
            prefix = "10)",
            name = BB["Lady Drazare"],--38
            defaults = { dropRate = 25 },
            loot = {
                { id = 58191 }, -- Whip of Shared Secrets
                { id = 58192 }, -- Vest of Dark Desires
                { id = 58193 }, -- Demon Hair Bow
                { id = 58194 }, -- Nethershard Sickle
                {},
                { id = 41942, dropRate = 100, disc = L["Quest Item"] }, -- Arthur's Soul Fragment
            }
        },
        {
            prefix = "11)",
            name = BB["Ighal'for"],--38
            loot = {
                { id = 41939, dropRate = 100, container = { 58277, 58278 } }, -- Broken Bloodstone Pendant
            },
        },
        {
            id = "SRMergothid",
            name = BB["Mergothid"],--40
            defaults = { dropRate = 20 },
            loot = {
                { id = 58200 }, -- Eyes of the Beholder
                { id = 58201 }, -- Mantle of the Disciple
                { id = 58202 }, -- Twisted Demon Crystal
                { id = 58203 }, -- Chainmail of Writhing Miasma
                { id = 58204 }, -- Treads of Forgotten Empathy
                {},
                { id = 58199, dropRate = 1 }, -- Spine of Dentarg
            }
        },
        {
            prefix = "a)",
            name = L["Severs"],
            color = "|cff00FF00",
        },
        {
            id = "SRRemainsOfInnocent",
            prefix = "12)",
            name = BB["Remains of the Innocent"],--38
            defaults = { dropRate = 25 },
            loot = {
                { id = 58195 }, -- Tiny Bracelet
                { id = 58196 }, -- Bloodied Almanac
                { id = 58197 }, -- Northwind Guard Breaches
                { id = 58198 }, -- Dissolved Hookblade
                {},
                { id = 41938, dropRate = 100 }, -- Etched Toy Sword
            }
        },
        {
            id = "SRTrash",
            name = L["Trash Mobs"].."-"..BZ["Stormwrought Ruins"],
            defaults = { dropRate = .02 },
            loot = {
                { id = 70113, container = { 56040 } }, -- Plans: Gleaming Silver Necklace
                { id = 58178, dropRate = 1.35 }, -- Stormreaver Boots
                { id = 58131, dropRate = 1.35 }, -- Stormreaver Belt
                { id = 1992 }, -- Swampchill Fetish
                { id = 2262 }, -- Mark of Kern
                { id = 5756 }, -- Sliverblade
                { id = 5819 }, -- Sunblaze Coif
                { id = 7727 }, -- Watchman Pauldrons
                { id = 7728, dropRate = .04 }, -- Beguiler Robes
                { id = 7729 }, -- Chesterfall Musket
                { id = 7730 }, -- Cobalt Crusher
                { id = 7736 }, -- Fight Club
                { id = 7752 }, -- Dreamslayer
                { id = 7753 }, -- Bloodspiller
                { id = 7754, dropRate = .01 }, -- Harbinger Boots
                { id = 7755 }, -- Flintrock Shoulders
                { id = 7757 }, -- Windweaver Staff
                { id = 7759 }, -- Archon Chestpiece
                { id = 7760 }, -- Warchief Kilt
                { id = 7761 }, -- Steelclaw Reaver
                { id = 7786 }, -- Headsplitter
                { id = 7787 }, -- Resplendent Guardian
                { id = 8225 }, -- Tainted Pierce
                { id = 8226 }, -- The Butcher
                { id = 41941, dropRate = 70, disc = L["Quest Item"] }, -- Balorian Treasure
            }
        },
        { name = BIS["Stormreaver Attire"], items = "Stormreaver" },
    },
}

for _, bossData in ipairs(AtlasTW.InstanceData.StormwroughtRuins.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end
