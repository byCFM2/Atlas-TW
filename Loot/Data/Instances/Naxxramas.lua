---
--- Naxxramas.lua - Naxxramas raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Naxxramas
--- 40-player raid instance. It includes all wing encounters, tier set items,
--- legendary drops, and unique weapons with their respective drop rates.
---
--- Features:
--- • Complete wing-based boss encounters
--- • Tier 3 set items and tokens
--- • Legendary and epic weapon drops
--- • Unique trinkets and accessories
--- • Attunement and key requirements
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.Naxxramas = {
    Name = BZ["Naxxramas"],
    Location = BZ["Eastern Plaguelands"],
    Level = 60,
    Acronym = "Naxx",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["All"],
    Entrances = {
        { letter = "A"..") " .. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Argent Dawn"], loot = "ArgentDawn" }
    },
    Bosses = {
        {
            name = L["Archmage Tarsis Kir-Moldir"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Mr. Bigglesworth"] .. " (" .. L["Wanders"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Abomination Wing"],
        },
        {
            id = "Patchwerk",
            prefix = "1)",
            name = BB["Patchwerk"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 20, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22368, dropRate = 33, container = { 22515, 47220, 22499, 47100, 22507, 47298 } }, -- Desecrated Shoulderpads
                { id = 22361, dropRate = 33, container = { 22429, 47043, 47052, 22439, 22467, 47163, 47172, 22491, 47373, 47382 } }, -- Desecrated Spaulders
                { id = 22354, dropRate = 33, container = { 22419, 47262, 22479 } }, -- Desecrated Pauldrons
                {},
                { id = 22960 }, -- Cloak of Suturing
                { id = 22961 }, -- Band of Reanimation
                {},
                { id = 22820 }, -- Wand of Fates
                { id = 22818 }, -- The Plague Bearer
                { id = 22815 }, -- Severance
            }
        },
        {
            id = "Grobbulus",
            prefix = "2)",
            name = BB["Grobbulus"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 20, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22368, dropRate = 33, container = { 22515, 47220, 22499, 47100, 22507, 47298 } }, -- Desecrated Shoulderpads
                { id = 22361, dropRate = 33, container = { 22429, 47043, 47052, 22439, 22467, 47163, 47172, 22491, 47373, 47382 } }, -- Desecrated Spaulders
                { id = 22354, dropRate = 33, container = { 22419, 47262, 22479 } }, -- Desecrated Pauldrons
                {},
                { id = 22968 }, -- Glacial Mantle
                { id = 22967 }, -- Icy Scale Spaulders
                {},
                { id = 22810 }, -- Toxin Injector
                { id = 22803 }, -- Midnight Haze
                { id = 22988 }, -- The End of Dreams
            }
        },
        {
            id = "Gluth",
            prefix = "3)",
            name = BB["Gluth"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22983 }, -- Rime Covered Mantle
                { id = 22981 }, -- Gluth's Missing Collar
                { id = 22994 }, -- Digested Hand of Power
                {},
                { id = 23075 }, -- Death's Bargain
                { id = 22813 }, -- Claymore of Unholy Might
                {},
                {},
                {},
                {},
                {},
                {},
                { id = 22368, dropRate = 33, container = { 22515, 47220, 22499, 47100, 22507, 47298 } }, -- Desecrated Shoulderpads
                { id = 22369, dropRate = 8, container = { 22519, 47222, 22503, 47102, 22511 } }, -- Desecrated Bindings
                { id = 22370, dropRate = 8, container = { 22518, 47224, 22502, 47104, 22510 } }, -- Desecrated Belt
                { id = 22372, dropRate = 8, container = { 22516, 47226, 22500, 47106, 22508, 47304 } }, -- Desecrated Sandals
                { id = 22361, dropRate = 33, container = { 22429, 47043, 47052, 22439, 22467, 47163, 47172, 22491, 47373, 47382 } }, -- Desecrated Spaulders
                { id = 22362, dropRate = 8, container = { 22424, 47045, 47054, 22443, 22471, 47165, 47174, 22495, 47375, 47384 } }, -- Desecrated Wristguards
                { id = 22363, dropRate = 8, container = { 22431, 47047, 47056, 22442, 22470, 47167, 47176, 22494, 47377, 47386 } }, -- Desecrated Girdle
                { id = 22365, dropRate = 8, container = { 22430, 47049, 47058, 22440, 22468, 47169, 47178, 22492, 47379, 47388 } }, -- Desecrated Boots
                { id = 22354, dropRate = 33, container = { 22419, 47262, 22479 } }, -- Desecrated Pauldrons
                { id = 22355, dropRate = 8, container = { 22423, 47264, 22483 } }, -- Desecrated Bracers
                { id = 22356, dropRate = 8, container = { 22422, 47266, 22482 } }, -- Desecrated Waistguard
                { id = 22358, dropRate = 8, container = { 22420, 47268, 22480 } }, -- Desecrated Sabatons
            }
        },
        {
            id = "Thaddius",
            prefix = "4)",
            name = BB["Thaddius"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22367, dropRate = 33, container = { 22514, 47219, 22498, 47099, 22506, 47297 } }, -- Desecrated Circlet
                { id = 22360, dropRate = 33, container = { 22428, 47042, 47051, 22438, 22466, 47162, 47171, 22490, 47372, 47381 } }, -- Desecrated Headpiece
                { id = 22353, dropRate = 33, container = { 22418, 47261, 22478 } }, -- Desecrated Helmet
                {},
                { id = 23000 }, -- Plated Abomination Ribcage
                { id = 23070 }, -- Leggings of Polarity
                {},
                { id = 23001 }, -- Eye of Diminution
                {},
                { id = 22808 }, -- The Castigator
                { id = 22801 }, -- Spire of Twilight
            }
        },
        {
            name = L["Spider Wing"],
            color = "|cffFFA500",
        },
        {
            id = "AnubRekhan",
            prefix = "1)",
            name = BB["Anub'Rekhan"],
            color = "|cffFFA500",
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 20, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22369, dropRate = 33, container = { 22519, 47222, 22503, 47102, 22511 } }, -- Desecrated Bindings
                { id = 22362, dropRate = 33, container = { 22424, 47045, 47054, 22443, 22471, 47165, 47174, 22495, 47375, 47384 } }, -- Desecrated Wristguards
                { id = 22355, dropRate = 33, container = { 22423, 47264, 22483 } }, -- Desecrated Bracers
                {},
                { id = 22935 }, -- Touch of Frost
                { id = 22938 }, -- Cryptfiend Silk Cloak
                { id = 22936 }, -- Wristguards of Vengeance
                {},
                { id = 22939 }, -- Band of Unanswered Prayers
                {},
                { id = 22937 }, -- Gem of Nerubis
            }
        },
        {
            id = "GrandWidowFaerlina",
            prefix = "2)",
            name = BB["Grand Widow Faerlina"],
            color = "|cffFFA500",
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22369, dropRate = 33, container = { 22519, 47222, 22503, 47102, 22511 } }, -- Desecrated Bindings
                { id = 22362, dropRate = 33, container = { 22424, 47045, 47054, 22443, 22471, 47165, 47174, 22495, 47375, 47384 } }, -- Desecrated Wristguards
                { id = 22355, dropRate = 33, container = { 22423, 47264, 22483 } }, -- Desecrated Bracers
                {},
                { id = 22943 }, -- Malice Stone Pendant
                { id = 22941 }, -- Polar Shoulder Pads
                { id = 22940 }, -- Icebane Pauldrons
                {},
                { id = 22942 }, -- The Widow's Embrace
                { id = 22806 }, -- Widow's Remorse
            }
        },
        {
            id = "Maexxna",
            prefix = "3)",
            name = BB["Maexxna"],
            color = "|cffFFA500",
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22371, dropRate = 33, container = { 22517, 47223, 22501, 47103, 22509, 47301 } }, -- Desecrated Gloves
                { id = 22364, dropRate = 33, container = { 22426, 47046, 47055, 22441, 22469, 47166, 47175, 22493, 47376, 47385 } }, -- Desecrated Handguards
                { id = 22357, dropRate = 33, container = { 22421, 47265, 22481 } }, -- Desecrated Gauntlets
                {},
                { id = 22947 }, -- Pendant of Forgotten Names
                { id = 23220 }, -- Crystal Webbed Robe
                { id = 22954 }, -- Kiss of the Spider
                {},
                { id = 22807 }, -- Wraith Blade
                { id = 22804 }, -- Maexxna's Fang
            }
        },
        {
            name = L["Plague Wing"],
            color = "|cff9370DB",
        },
        {
            id = "NoththePlaguebringer",
            prefix = "1)",
            name = BB["Noth the Plaguebringer"],
            color = "|cff9370DB",
            defaults = { dropRate = 14 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22370, dropRate = 8, container = { 22518, 47224, 22502, 47104, 22510 } }, -- Desecrated Belt
                { id = 22363, dropRate = 8, container = { 22431, 47047, 47056, 22442, 22470, 47167, 47176, 22494, 47377, 47386 } }, -- Desecrated Girdle
                { id = 22356, dropRate = 8, container = { 22422, 47266, 22482 } }, -- Desecrated Waistguard
                {},
                { id = 23030 }, -- Cloak of the Scourge
                { id = 23031 }, -- Band of the Inevitable
                { id = 23028 }, -- Hailstone Band
                { id = 23029 }, -- Noth's Frigid Heart
                { id = 23006 }, -- Libram of Light
                { id = 23005 }, -- Totem of Flowing Water
                {},
                { id = 22816 }, -- Hatchet of Sundered Bone
            }
        },
        {
            id = "HeigantheUnclean",
            prefix = "2)",
            name = BB["Heigan the Unclean"],
            color = "|cff9370DB",
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22370, dropRate = 8, container = { 22518, 47224, 22502, 47104, 22510 } }, -- Desecrated Belt
                { id = 22363, dropRate = 8, container = { 22431, 47047, 47056, 22442, 22470, 47167, 47176, 22494, 47377, 47386 } }, -- Desecrated Girdle
                { id = 22356, dropRate = 8, container = { 22422, 47266, 22482 } }, -- Desecrated Waistguard
                {},
                { id = 23035 }, -- Preceptor's Hat
                { id = 23033 }, -- Icy Scale Coif
                { id = 23019 }, -- Icebane Helmet
                { id = 23036 }, -- Necklace of Necropsy
                { id = 23068 }, -- Legplates of Carnage
            }
        },
        {
            id = "Loatheb",
            prefix = "3)",
            name = BB["Loatheb"],
            color = "|cff9370DB",
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22366, dropRate = 33, container = { 22513, 47225, 22497, 47105, 22505, 47303 } }, -- Desecrated Leggings
                { id = 22359, dropRate = 33, container = { 22427, 47048, 47057, 22437, 22465, 47168, 47177, 22489, 47378, 47387 } }, -- Desecrated Legguards
                { id = 22352, dropRate = 33, container = { 22417, 47267, 22477 } }, -- Desecrated Legplates
                {},
                { id = 23038 }, -- Band of Unnatural Forces
                { id = 23037 }, -- Ring of Spiritual Fervor
                { id = 23042 }, -- Loatheb's Reflection
                {},
                { id = 23039 }, -- The Eye of Nerub
                { id = 22800 }, -- Brimstone Staff
            }
        },
        {
            name = L["Deathknight Wing"],
            color = "|cffff0000",
        },
        {
            id = "InstructorRazuvious",
            prefix = "1)",
            name = BB["Instructor Razuvious"],
            color = "|cffff0000",
            defaults = { dropRate = 17 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22372, dropRate = 33, container = { 22516, 47226, 22500, 47106, 22508, 47304 } }, -- Desecrated Sandals
                { id = 22365, dropRate = 33, container = { 22430, 47049, 47058, 22440, 22468, 47169, 47178, 22492, 47379, 47388 } }, -- Desecrated Boots
                { id = 22358, dropRate = 33, container = { 22420, 47268, 22480 } }, -- Desecrated Sabatons
                {},
                { id = 23017 }, -- Veil of Eclipse
                { id = 23219 }, -- Girdle of the Mentor
                { id = 23018 }, -- Signet of the Fallen Defender
                { id = 23004 }, -- Idol of Longevity
                {},
                { id = 23009 }, -- Wand of the Whispering Dead
                { id = 23014 }, -- Iblis, Blade of the Fallen Seraph
            }
        },
        {
            id = "GothiktheHarvester",
            prefix = "2)",
            name = BB["Gothik the Harvester"],
            color = "|cffff0000",
            defaults = { dropRate = 20 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22372, dropRate = 33, container = { 22516, 47226, 22500, 47106, 22508, 47304 } }, -- Desecrated Sandals
                { id = 22365, dropRate = 33, container = { 22430, 47049, 47058, 22440, 22468, 47169, 47178, 22492, 47379, 47388 } }, -- Desecrated Boots
                { id = 22358, dropRate = 33, container = { 22420, 47268, 22480 } }, -- Desecrated Sabatons
                {},
                { id = 23032 }, -- Glacial Headdress
                { id = 23020 }, -- Polar Helmet
                { id = 23023 }, -- Sadist's Collar
                { id = 23021 }, -- The Soul Harvester's Bindings
                { id = 23073 }, -- Boots of Displacement
            }
        },
        {
            id = "TheFourHorsemen",
            prefix = "3)",
            name = BB["The Four Horsemen"],
            color = "|cffff0000",
            defaults = { dropRate = 17 },
            loot = {
                { id = 22726, dropRate = 30, container = { 22631, 22589, 22630, 22632 } }, -- Splinter of Atiesh
                { id = 22727 }, -- Frame of Atiesh
                {},
                { id = 22351, dropRate = 33, container = { 22512, 47221, 22496, 47101, 22504, 47299 } }, -- Desecrated Robe
                { id = 22350, dropRate = 33, container = { 22425, 47044, 47053, 22436, 22464, 47164, 47173, 22488, 47374, 47383 } }, -- Desecrated Tunic
                { id = 22349, dropRate = 33, container = { 22416, 47263, 22476 } }, -- Desecrated Breastplate
                {},
                { id = 23071 }, -- Leggings of Apocalypse
                { id = 23025 }, -- Seal of the Damned
                { id = 23027 }, -- Warmth of Forgiveness
                {},
                { id = 22811 }, -- Soulstring
                { id = 22809 }, -- Maul of the Redeemed Crusader
                { id = 22691 }, -- Corrupted Ashbringer
            }
        },
        { name = BB["Thane Korth'azz"], color = "|cff9d9d9d" },
        { name = BB["Lady Blaumeux"], color = "|cff9d9d9d" },
        { name = BB["Highlord Mograine"], color = "|cff9d9d9d" },
        { name = BB["Sir Zeliek"], color = "|cff9d9d9d" },
        {
            id = "Omarion",
            prefix = "1')",
            name = BB["Master Craftsman Omarion"],
            color = "|cffff0000",
            loot = {
                { id = 22719, dropRate = 100 }, -- Omarion's Handbook
            }
        },
        {
            prefix = "2')",
            name = L["Icebellow Anvil"],
            color = "|cffff0000",
        },
        { name = L["Frostwyrm Lair"], color = "|cffFFD700" },
        {
            id = "Sapphiron",
            prefix = "1)",
            name = BB["Sapphiron"],
            color = "|cffFFD700",
            defaults = { dropRate = 10 },
            loot = {
                { id = 23050 }, -- Cloak of the Necropolis
                { id = 23045 }, -- Shroud of Dominion
                { id = 23040 }, -- Glyph of Deflection
                { id = 23047 }, -- Eye of the Dead
                { id = 23041 }, -- Slayer's Crest
                { id = 23046 }, -- The Restrained Essence of Sapphiron
                {},
                { id = 23049 }, -- Sapphiron's Left Eye
                { id = 23048 }, -- Sapphiron's Right Eye
                { id = 23043 }, -- The Face of Death
                { id = 23242 }, -- Claw of the Frost Wyrm
                {},
                {},
                {},
                {},
                { id = 23549, dropRate = 50 }, -- Fortitude of the Scourge
                { id = 23548, dropRate = 50 }, -- Might of the Scourge
                { id = 23545, dropRate = 50 }, -- Power of the Scourge
                { id = 23547, dropRate = 50 }, -- Resilience of the Scourge
            }
        },
        {
            id = "KelThuzard",
            prefix = "2)",
            name = BB["Kel'Thuzad"],
            color = "|cffFFD700",
            defaults = { dropRate = 9 },
            loot = {
                { id = 23057 }, -- Gem of Trapped Innocents
                { id = 23053 }, -- Stormrage's Talisman of Seething
                {},
                { id = 22812 }, -- Nerubian Slavemaker
                { id = 22821 }, -- Doomfinger
                { id = 22819 }, -- Shield of Condemnation
                { id = 22802 }, -- Kingsfall
                { id = 23056 }, -- Hammer of the Twisting Nether
                { id = 23054 }, -- Gressil, Dawn of Ruin
                { id = 23577 }, -- The Hungering Cold
                { id = 22798 }, -- Might of Menethil
                { id = 22799 }, -- Soulseeker
                {},
                {},
                { id = 22520, dropRate = 100, container = { 23207, 23206 } }, -- The Phylactery of Kel'Thuzad
                { id = 55581, dropRate = 33, container = { 23059, 47269, 23060 } }, -- Desecrated Ring
                { id = 55582, dropRate = 33, container = { 23061, 47227, 23062, 47107, 23063, 47305 } }, -- Desecrated Loop
                { id = 55583, dropRate = 33, container = { 23066, 47050, 47059, 23067, 23065, 47170, 47179, 23064, 47380, 47389 } }, -- Desecrated Signet
                {},
                { id = 81283, dropRate = 100 }, -- Mr. Bigglesworth
                {},
                { id = 22733, dropRate = 100, container = { 22631, 22589, 22630, 22632 } }, -- Staff Head of Atiesh
                { id = 36666, dropRate = 1 }, -- Plagued Riding Spider
            }
        },
        {
            id = "NAXTrash",
            name = L["Trash Mobs"].."-"..BZ["Naxxramas"],
            defaults = { dropRate = 1 },
            loot = {
                { id = 23664 }, -- Pauldrons of Elemental Fury
                { id = 23667 }, -- Spaulders of the Grand Crusader
                { id = 23069, dropRate = 7 }, -- Necro-Knight's Garb
                { id = 23226, dropRate = 2 }, -- Ghoul Skin Tunic
                { id = 23663 }, -- Girdle of Elemental Fury
                { id = 23666 }, -- Belt of the Grand Crusader
                { id = 23665, dropRate = 2 }, -- Leggings of Elemental Fury
                { id = 23668, dropRate = 2 }, -- Leggings of the Grand Crusader
                {},
                { id = 23237, dropRate = 3 }, -- Ring of the Eternal Flame
                {},
                { id = 23238 }, -- Stygian Buckler
                { id = 23044, dropRate = 2 }, -- Harbinger of Doom
                { id = 23221, dropRate = 3 }, -- Misplaced Servo Arm
                {},
                { id = 22376, disc = L["Quest Item"], dropRate = 35 }, -- Wartorn Cloth Scrap
                { id = 22373, disc = L["Quest Item"], dropRate = 26 }, -- Wartorn Leather Scrap
                { id = 22374, disc = L["Quest Item"], dropRate = 27 }, -- Wartorn Chain Scrap
            }
        },
        { name = L["Tier 3 Sets"], items = "AtlasLootT3SetMenu" },
    }
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.Naxxramas.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
