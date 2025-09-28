---
--- ZulGurub.lua - Zul'Gurub raid instance loot data
---
--- This module contains comprehensive loot tables and boss data for the Zul'Gurub
--- 20-player raid instance. It includes all boss encounters, shared loot pools,
--- class-specific items, and rare drops with their respective drop rates.
---
--- Features:
--- • Complete boss encounter loot tables
--- • Shared loot pool definitions
--- • Class token and tier set items
--- • Rare mount and pet drops
--- • Reputation reward items
---
--- @since 1.0.1
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BC = AceLibrary("Babble-Class-2.2")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local zGSharedLoot = {
    { id = 22713, dropRate = 10 }, -- Zulian Scepter of Rites
    {},
    { id = 22721, dropRate = 10 }, -- Band of Servitude
    { id = 22722, dropRate = 10 }, -- Seal of the Gurubashi Berserker
    { id = 22720, dropRate = 10 }, -- Zulian Headdress
    { id = 22718, dropRate = 10 }, -- Blooddrenched Mask
    { id = 22711, dropRate = 10 }, -- Cloak of the Hakkari Worshipers
    { id = 22712, dropRate = 10 }, -- Might of the Tribe
    { id = 22715, dropRate = 10 }, -- Gloves of the Tormented
    { id = 22714, dropRate = 10 }, -- Sacrificial Gauntlets
    { id = 22716, dropRate = 10 }, -- Belt of Untapped Power
    {},
    { id = 19721, dropRate = 11, container = { 19826, 19832, 19845 } }, -- Primal Hakkari Shawl
    { id = 19724, dropRate = 11, container = { 19841, 19834, 19831 } }, -- Primal Hakkari Aegis
    { id = 19723, dropRate = 11, container = { 20033, 20034, 19822 } }, -- Primal Hakkari Kossack
    { id = 19722, dropRate = 11, container = { 19828, 19825, 19838 } }, -- Primal Hakkari Tabard
    { id = 19717, dropRate = 11, container = { 19830, 19836, 19824 } }, -- Primal Hakkari Armsplint
    { id = 19716, dropRate = 11, container = { 19827, 19846, 19833 } }, -- Primal Hakkari Bindings
    { id = 19718, dropRate = 11, container = { 19843, 19848, 19840 } }, -- Primal Hakkari Stanchion
    { id = 19719, dropRate = 11, container = { 19829, 19835, 19823 } }, -- Primal Hakkari Girdle
    { id = 19720, dropRate = 11, container = { 19842, 19849, 19839 } }, -- Primal Hakkari Sash
}

local zGEnchants = {
    { id = 19789, disc = L["Head"]..", "..L["Legs"] }, -- Prophetic Aura
    { id = 19787, disc = L["Head"]..", "..L["Legs"] }, -- Presence of Sight
    { id = 19788, disc = L["Head"]..", "..L["Legs"] }, -- Hoodoo Hex
    { id = 19784, disc = L["Head"]..", "..L["Legs"] }, -- Death's Embrace
    { id = 19790, disc = L["Head"]..", "..L["Legs"] }, -- Animist's Caress
    { id = 19785, disc = L["Head"]..", "..L["Legs"] }, -- Falcon's Call
    { id = 19786, disc = L["Head"]..", "..L["Legs"] }, -- Vodouisant's Vigilant Embrace
    { id = 19783, disc = L["Head"]..", "..L["Legs"] }, -- Syncretist's Sigil
    { id = 19782, disc = L["Head"]..", "..L["Legs"] }, -- Presence of Might
    { id = 22635, disc = L["Head"]..", "..L["Legs"] }, -- Savage Guard
    {},
    { id = 20077, disc = L["Shoulder"] }, -- Zandalar Signet of Might
    { id = 20076, disc = L["Shoulder"] }, -- Zandalar Signet of Mojo
    { id = 20078, disc = L["Shoulder"] }, -- Zandalar Signet of Serenity
    { id = 65033, disc = L["Shoulder"] }, -- Zandalar Signet of Tenacity
}

local zGidol = {
    { id = 22637, dropRate = 100, container = { 19789, 19787, 19788, 19784, 19790, 19785, 19786, 19783, 19782 } }, -- Primal Hakkari Idol
}

AtlasTW.InstanceData.ZulGurub = {
    Name = BZ["Zul'Gurub"],
    Location = BZ["Stranglethorn Vale"],
    Level = { 51, 60 },
    Acronym = "ZG",
    MaxPlayers = 20,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Zandalar Tribe"], loot = "ZandalarTribe" }
    },
    Keys = {
        { name = L["Gurubashi Mojo Madness"], loot = "VanillaKeys", info = L["Edge of Madness"] },
        { name = L["Mudskunk Lure"], loot = "VanillaKeys", info = BB["Gahz'ranka"] },
    },
    Bosses = {
        {
            id = "HighPriestessJeklik",
            prefix = "1)",
            name = BB["High Priestess Jeklik"],
            postfix = L["Bat"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 19923 }, -- Jeklik's Opaline Talisman
                { id = 19928 }, -- Animist's Spaulders
                { id = 20262 }, -- Seafury Boots
                { id = 20265 }, -- Peacekeeper Boots
                { id = 19920 }, -- Primalist's Band
                { id = 19881, dropRate = 100 }, -- Channeler's Head
                {},
                { id = 19915 }, -- Zulian Defender
                { id = 19918 }, -- Jeklik's Crusher
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(zGSharedLoot),
            }
        },
        {
            id = "HighPriestVenoxis",
            prefix = "2)",
            name = BB["High Priest Venoxis"],
            postfix = L["Snake"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 19904 }, -- Runed Bloodstained Hauberk
                { id = 19907 }, -- Zulian Tigerhide Cloak
                { id = 19906 }, -- Blooddrenched Footpads
                { id = 19905 }, -- Zanzil's Band
                {},
                { id = 19881, dropRate = 100 }, -- Channeler's Head
                {},
                { id = 19900 }, -- Zulian Stone Axe
                { id = 19903 }, -- Fang of Venoxis
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(zGSharedLoot),
            }
        },
        {
            prefix = "3)",
            name = L["Zanza the Restless"],
            loot = zGEnchants,
        },
        {
            id = "HighPriestessMarli",
            prefix = "4)",
            name = BB["High Priestess Mar'li"],
            postfix = L["Spider"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 20032 }, -- Flowing Ritual Robes
                { id = 19871 }, -- Talisman of Protection
                { id = 19919 }, -- Bloodstained Greaves
                { id = 19925 }, -- Band of Jin
                { id = 19930 }, -- Mar'li's Eye
                { id = 19881, dropRate = 100 }, -- Channeler's Head
                {},
                { id = 81003, dropRate = 10 }, -- Ancient Hakkari Flayer
                { id = 19927 }, -- Mar'li's Touch
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(zGSharedLoot),
            }
        },
        {
            id = "BloodlordMandokir",
            prefix = "5)",
            name = BB["Bloodlord Mandokir"],
            postfix = L["Raptor"],
            defaults = { dropRate = 8 },
            loot = {
                { id = 19878 }, -- Bloodsoaked Pauldrons
                { id = 19870 }, -- Hakkari Loa Cloak
                { id = 19869 }, -- Blooddrenched Grips
                { id = 19895 }, -- Bloodtinged Kilt
                { id = 19877 }, -- Animist's Leggings
                {},
                { id = 19873 }, -- Overlord's Crimson Band
                { id = 19863 }, -- Primalist's Seal
                { id = 19893 }, -- Zanzil's Seal
                {},
                { id = 20038 }, -- Mandokir's Sting
                { id = 19867 }, -- Bloodlord's Defender
                { id = 19866 }, -- Warblade of the Hakkari
                { id = 19874 }, -- Halberd of Smiting
                {},
                unpack(zGidol),
                {},
                {},
                { id = 19872, dropRate = 2 }, -- Armored Razzashi Raptor
                {},
                { id = 19721, dropRate = 11, container = { 19826, 19832, 19845 } }, -- Primal Hakkari Shawl
                { id = 19724, dropRate = 11, container = { 19841, 19834, 19831 } }, -- Primal Hakkari Aegis
                { id = 19723, dropRate = 11, container = { 20033, 20034, 19822 } }, -- Primal Hakkari Kossack
                { id = 19722, dropRate = 11, container = { 19828, 19825, 19838 } }, -- Primal Hakkari Tabard
                { id = 19717, dropRate = 11, container = { 19830, 19836, 19824 } }, -- Primal Hakkari Armsplint
                { id = 19716, dropRate = 11, container = { 19827, 19846, 19833 } }, -- Primal Hakkari Bindings
                { id = 19718, dropRate = 11, container = { 19843, 19848, 19840 } }, -- Primal Hakkari Stanchion
                { id = 19719, dropRate = 11, container = { 19829, 19835, 19823 } }, -- Primal Hakkari Girdle
                { id = 19720, dropRate = 11, container = { 19842, 19849, 19839 } }, -- Primal Hakkari Sash
            }
        },
        {
            name = L["Ohgan"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "6)",
            name = L["Edge of Madness"],
            postfix = L["Optional"],
            color = "|cff9d9d9d",
        },
        {
            id = "Grilek",
            name = BB["Gri'lek"],
            postfix = L["Random"],
            defaults = { dropRate = 43 },
            loot = {
                { id = 19961 }, -- Gri'lek's Grinder
                { id = 19962 }, -- Gri'lek's Carver
                {},
                { id = 19939, disc = L["Quest Item"], dropRate = 100, container = { 19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952 } }, -- Gri'lek's Blood
            }
        },
        {
            id = "Hazzarah",
            name = BB["Hazza'rah"],
            postfix = L["Random"],
            loot = {
                { id = 19967, dropRate = 45 }, -- Thoughtblighter
                { id = 19968, dropRate = 40 }, -- Fiery Retributer
                {},
                { id = 19942, disc = L["Quest Item"], dropRate = 100, container = { 19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952 } }, -- Hazza'rah's Dream Thread
            }
        },
        {
            id = "Renataki",
            name = BB["Renataki"],
            postfix = L["Random"],
            loot = {
                { id = 19964, dropRate = 40 }, -- Renataki's Soul Conduit
                { id = 19963, dropRate = 45 }, -- Pitchfork of Madness
                {},
                { id = 19940, disc = L["Quest Item"], dropRate = 100, container = { 19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952 } }, -- Renataki's Tooth
            }
        },
        {
            id = "Wushoolay",
            name = BB["Wushoolay"],
            postfix = L["Random"],
            loot = {
                { id = 19993, dropRate = 45 }, -- Hoodoo Hunting Bow
                { id = 19965, dropRate = 40 }, -- Wushoolay's Poker
                {},
                { id = 19941, disc = L["Quest Item"], dropRate = 100, container = { 19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952 } }, -- Wushoolay's Mane
            }
        },
        {
            id = "Gahzranka",
            prefix = "7)",
            name = BB["Gahz'ranka"],
            postfix = L["Optional"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 19945 }, -- Foror's Eyepatch
                {},
                { id = 19947 }, -- Nat Pagle's Broken Reel
                {},
                { id = 19944 }, -- Nat Pagle's Fish Terminator
                { id = 19946 }, -- Tigule's Harpoon
                {},
                { id = 22739, dropRate = 15 }, -- Tome of Polymorph: Turtle
                {},
                { id = 56084, dropRate = 100, disc = L["Used to summon boss"] }, -- Middle Piece of an Ancient Idol
                {},
                { id = 17962, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 3864, 55251, 55250, 7910, 7909, 1529, 12361 } }, -- Blue Sack of Gems
                { id = 17963, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12364 } }, -- Green Sack of Gems
                { id = 17964, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12800 } }, -- Gray Sack of Gems
                { id = 17965, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12363 } }, -- Yellow Sack of Gems
                { id = 17969, disc = L["Container"], dropRate = 20, container = { 13926, 7971, 55250, 7909, 3864, 55251, 7910, 1529, 12799, 6332 } }, -- Red Sack of Gems
            }
        },
        {
            id = "HighPriestThekal",
            prefix = "8)",
            name = BB["High Priest Thekal"],
            postfix = L["Tiger"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 19897 }, -- Betrayer's Boots
                { id = 19899 }, -- Ritualistic Legguards
                { id = 20260 }, -- Seafury Leggings
                { id = 20266 }, -- Peacekeeper Leggings
                { id = 19898 }, -- Seal of Jin
                { id = 19881, dropRate = 100 }, -- Channeler's Head
                { id = 19902, dropRate = 2 }, -- Swift Zulian Tiger
                { id = 19901 }, -- Zulian Slicer
                { id = 19896 }, -- Thekal's Grasp
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(zGSharedLoot),
            }
        },
        {
            name = L["Zealot Zath"],
            postfix = BC["Rogue"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Zealot Lor'Khan"],
            postfix = BC["Shaman"],
            color = "|cff9d9d9d",
        },
        {
            id = "HighPriestessArlokk",
            prefix = "9)",
            name = BB["High Priestess Arlokk"],
            postfix = L["Panther"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 19913 }, -- Bloodsoaked Greaves
                { id = 19912 }, -- Overlord's Onyx Band
                {},
                { id = 19914, disc = L["Bag"], dropRate = 12 }, -- Panther Hide Sack
                { id = 19881, dropRate = 100 }, -- Channeler's Head
                {},
                { id = 19922 }, -- Arlokk's Hoodoo Stick
                { id = 19909 }, -- Will of Arlokk
                { id = 19910 }, -- Arlokk's Grasp
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(zGSharedLoot),
            }
        },
        {
            id = "JindotheHexxer",
            prefix = "10)",
            name = BB["Jin'do the Hexxer"],
            postfix = L["Optional"],
            defaults = { dropRate = 8 },
            loot = {
                { id = 19885 }, -- Jin'do's Evil Eye
                { id = 19886 }, -- The Hexxer's Cover
                { id = 19875 }, -- Bloodstained Coif
                { id = 19888 }, -- Overlord's Embrace
                { id = 19929 }, -- Bloodtinged Gloves
                { id = 19894 }, -- Bloodsoaked Gauntlets
                { id = 19889 }, -- Blooddrenched Leggings
                { id = 19887 }, -- Bloodstained Legplates
                { id = 19892 }, -- Animist's Boots
                {},
                { id = 19891 }, -- Jin'do's Bag of Whammies
                { id = 19890 }, -- Jin'do's Hexxer
                { id = 19884 }, -- Jin'do's Judgement
                {},
                unpack(zGidol),
                { id = 19721, dropRate = 11, container = { 19826, 19832, 19845 } }, -- Primal Hakkari Shawl
                { id = 19724, dropRate = 11, container = { 19841, 19834, 19831 } }, -- Primal Hakkari Aegis
                { id = 19723, dropRate = 11, container = { 20033, 20034, 19822 } }, -- Primal Hakkari Kossack
                { id = 19722, dropRate = 11, container = { 19828, 19825, 19838 } }, -- Primal Hakkari Tabard
                { id = 19717, dropRate = 11, container = { 19830, 19836, 19824 } }, -- Primal Hakkari Armsplint
                { id = 19716, dropRate = 11, container = { 19827, 19846, 19833 } }, -- Primal Hakkari Bindings
                { id = 19718, dropRate = 11, container = { 19843, 19848, 19840 } }, -- Primal Hakkari Stanchion
                { id = 19719, dropRate = 11, container = { 19829, 19835, 19823 } }, -- Primal Hakkari Girdle
                { id = 19720, dropRate = 11, container = { 19842, 19849, 19839 } }, -- Primal Hakkari Sash
            }
        },
        {
            id = "Hakkar",
            prefix = "11)",
            name = BB["Hakkar"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 19876 }, -- Soul Corrupter's Necklace
                { id = 19856 }, -- The Eye of Hakkar
                { id = 19857 }, -- Cloak of Consumption
                { id = 20257 }, -- Seafury Gauntlets
                { id = 20264 }, -- Peacekeeper Gauntlets
                { id = 19855 }, -- Bloodsoaked Legplates
                {},
                { id = 19861 }, -- Touch of Chaos
                { id = 19853 }, -- Gurubashi Dwarf Destroyer
                { id = 19862 }, -- Aegis of the Blood God
                { id = 19864 }, -- Bloodcaller
                { id = 19865 }, -- Warblade of the Hakkari
                { id = 19852 }, -- Ancient Hakkari Manslayer
                { id = 19859 }, -- Fang of the Faceless
                { id = 19854 }, -- Zin'rokh, Destroyer of Worlds
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                { id = 19802, dropRate = 100, container = { 19950, 19949, 19948 } }, -- Heart of Hakkar
            }
        },
        {
            prefix = "1')",
            name = L["Muddy Churning Waters"],
            color = "|cff00ff00",
            loot = {
                { id = 19975, disc = L["Used to summon boss"] }, -- Zulian Mudskunk
            },
        },
        {
            prefix = "2')",
            name = L["Jinxed Hoodoo Pile"],
            color = "|cff00ff00",
            defaults = { dropRate = 11 },
            loot = {
                { id = 19727, disc = L["Unique"], dropRate = 26 }, -- Blood Scythe
                {},
                { id = 19813, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19814, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19815, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19816, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19817, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19818, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19819, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19820, disc = L["Doll"] }, -- Punctured Voodoo Doll
                { id = 19821, disc = L["Doll"] }, -- Punctured Voodoo Doll
            },
        },
        {
            id = "ZGTrash",
            name = L["Trash Mobs"].."-"..BZ["Zul'Gurub"],
            defaults = { dropRate = .03 },
            loot = {
                { id = 20263 }, -- Gurubashi Helm
                { id = 20259 }, -- Shadow Panther Hide Gloves
                { id = 20261 }, -- Shadow Panther Hide Belt
                {},
                { id = 19921 }, -- Zulian Hacker
                { id = 19908 }, -- Sceptre of Smiting
                { id = 20258 }, -- Zulian Ceremonial Staff
                {},
                { id = 19727, disc = L["Unique"] }, -- Blood Scythe
                {},
                { id = 19726, disc = L["Trade Goods"], dropRate = 1 }, -- Bloodvine
                { id = 19774, disc = L["Trade Goods"], dropRate = 0.05 }, -- Souldarite
                {},
                { id = 19767, disc = L["Trade Goods"], dropRate = 10 }, -- Primal Bat Leather
                { id = 19768, disc = L["Trade Goods"], dropRate = 20 }, -- Primal Tiger Leather
                { id = 19820 }, -- Punctured Voodoo Doll
                { id = 19818 }, -- Punctured Voodoo Doll
                { id = 19819 }, -- Punctured Voodoo Doll
                { id = 19814 }, -- Punctured Voodoo Doll
                { id = 19821 }, -- Punctured Voodoo Doll
                { id = 19816 }, -- Punctured Voodoo Doll
                { id = 19817 }, -- Punctured Voodoo Doll
                { id = 19815 }, -- Punctured Voodoo Doll
                { id = 19813 }, -- Punctured Voodoo Doll
                {},
                { id = 37010, dropRate = 6 }, -- Razzashi Hatchling
            }
        },
        { name = L["Zul'Gurub Sets"], items = "AtlasLootZGSetMenu" },
        { name = L["Zul'Gurub Enchants"], items = zGEnchants },
    }
}

for _, bossData in ipairs(AtlasTW.InstanceData.ZulGurub.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil
end
