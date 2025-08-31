-- Molten_Core.lua - Данные предметов из Огненных Недр
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}
local mCShareloot = {
    {},
    {id=18264, dropRate=1,container={18262}},
    {id=18292, dropRate=1,container={18282}},
    {id=18291, dropRate=1,container={18168}},
    {id=18290, dropRate=1,container={18283}},
    {id=18252, dropRate=1,container={18251}},
    {id=18265, dropRate=1,container={18263}},
    {id=21371, dropRate=1,container={21342}},
    {id=18257, dropRate=1,container={18253}},
    {id=18259, dropRate=1},
    {id=18260, dropRate=1},
}
-- Данные Огненных Недр
AtlasTW.InstanceData.MoltenCore = {
    Name = BZ["Molten Core"],
    Location = BZ["Blackrock Depths"],
    Level = 60,
    Acronym = "MC",
    Attunement = true,
    MaxPlayers = 40,
    DamageType = L["Fire"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Hydraxian Waterlords"], loot = "HydroxianWaterLords" },
    },
    Keys = {
        { name = L["Aqual Quintessence"], loot = "VanillaKeys", info = L["Boss"] },
        { name = L["Eternal Quintessence"], loot = "VanillaKeys", info = L["Boss"] }
    },
    Bosses = {
        {
            id = "Incindis",
            prefix = "1)",
            name = BB["Incindis"], --52145
            defaults = { dropRate = 5 },
            loot = {
                { id = 16812, dropRate = 25, container = { 47202 } }, --Gloves of Prophecy
                { id = 16839, dropRate = 25, container = { 47124, 47132 } }, --Earthfury Gauntlets
                { id = 16860, dropRate = 25, container = { 47004, 47012 } }, --Lawbringer Gauntlets
                { id = 16826, dropRate = 25 }, --Nightslayer Gloves
                { id = 16862, dropRate = 25, container = { 47247 } }, --Sabatons of Might
                { id = 16849, dropRate = 25 }, --Giantstalker's Boots
                {},
                { id = 58205, dropRate = 20 }, --Primal Flameslinger
                { id = 58206, dropRate = 20 }, --Idol of the Forgotten Wilds
                { id = 58207, dropRate = 20 }, --Fist of the Flamewaker
                { id = 58208, dropRate = 20 }, --Shroud of Flowing Magma
                { id = 58209, dropRate = 20 }, --Sizzling Pyrestone Aureole
                {},
                { id = 17077 }, --Crimson Shocker
                { id = 18861 }, --Flamewaker Legplates
                { id = 18870 }, --Helm of the Lifegiver
                { id = 18872 }, --Manastorm Leggings
                { id = 18875 }, --Salamander Scale Pants
                { id = 18878 }, --Sorcerous Dagger
                { id = 18879 }, --Heavy Dark Iron Ring
                { id = 19145 }, --Robe of Volatile Power
                { id = 19146 }, --Wristguards of Stability
                { id = 19147 }, --Ring of Spell Power
                { id = 41988, dropRate = 100 }, --Molten Scale
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
                {},
                unpack(mCShareloot),
            }
        },
        {
            id = "Lucifron",
            prefix = "2)",
            name = BB["Lucifron"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16800, dropRate=20, container={47085}},
                {id=16829, dropRate=20, container={47337,47345}},
                {id=16837, dropRate=20, container={47127,47135}},
                {id=16859, dropRate=20, container={47007,47015}},
                {id=16863, dropRate=30, container={47244}},
                {id=16805, dropRate=30, container={47280}},
                {},
                {id=16665, disc=L["Book"], dropRate=100},
                {id=18870},
                {id=17109, dropRate=20},
                {id=19145},
                {id=19146},
                {id=18872},
                {id=18875},
                {id=18861},
                {id=18879},
                {id=19147},
                {id=17077},
                {id=18878},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Magmadar",
            prefix = "3)",
            name = BB["Magmadar"],
            defaults = { dropRate = 5 },
            loot = {
                {id=16814, dropRate=20, container={47204}},
                {id=16796, dropRate=20, container={47084}},
                {id=16810, dropRate=20, container={47282}},
                {id=16835, dropRate=17, container={47336,47344}},
                {id=16843, dropRate=17, container={47126,47134}},
                {id=16855, dropRate=17, container={47006,47014}},
                {id=16867, dropRate=17, container={47246}},
                {id=16822, dropRate=20},
                {id=16847, dropRate=17},
                {},
                {id=19142},
                {id=17069, dropRate=20},
                {id=18203, dropRate=20},
                {id=17073, dropRate=20},
                {id=18822},
                {id=17065, dropRate=17},
                {id=18829},
                {id=18823},
                {id=19143},
                {id=19136},
                {id=18861},
                {id=19144},
                {id=18824},
                {id=18821},
                {id=18820},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Garr",
            prefix = "4)",
            name = BB["Garr"],
            defaults = { dropRate = 5 },
            loot = {
                {id=16813, dropRate=20, container={47198}},
                {id=16795, dropRate=20, container={47078}},
                {id=16808, dropRate=20, container={47276}},
                {id=16821, dropRate=20},
                {id=16834, dropRate=17, container={47330,47338}},
                {id=16846, dropRate=17},
                {id=16842, dropRate=17, container={47120,47128}},
                {id=16854, dropRate=17, container={47000,47008}},
                {id=16866, dropRate=17, container={47240}},
                {},
                {id=17782},
                {id=18564,disc=L["Quest Item"]..", "..L["Right Half"],container={19019}},
                {id=18829},
                {id=18823},
                {id=19143},
                {id=19136},
                {id=18861},
                {id=19144, dropRate=11},
                {id=18824},
                {id=18821},
                {id=18820},
                {id=19142},
                {id=17066, dropRate=17},
                {id=17071, dropRate=20},
                {id=17105, dropRate=20},
                {id=18832, dropRate=20},
                {id=18822},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Shazzrah",
            prefix = "5)",
            name = BB["Shazzrah"],
            defaults = { dropRate = 3 },
            loot = {
                {id=16811, dropRate=25, container={47205}},
                {id=16803, dropRate=25, container={47283}},
                {id=16824, dropRate=25},
                {},
                {id=16831, dropRate=33, container={47334,47342}},
                {id=16801, dropRate=33, container={47082}},
                {id=16852, dropRate=33},
                {},
                {id=18870},
                {id=19145},
                {id=19146},
                {id=18872},
                {id=18875},
                {id=18861},
                {id=18879},
                {id=19147},
                {},
                {id=17077},
                {id=18878},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "BaronGeddon",
            prefix = "6)",
            name = BB["Baron Geddon"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16797, dropRate=33, container={47079}},
                {id=16807, dropRate=33, container={47277}},
                {id=16836, dropRate=30, container={47331,47339}},
                {id=16844, dropRate=30, container={47121,47358}},
                {id=16856, dropRate=60, container={47001,47009}},
                {},
                {id=18563, dropRate=6, disc=L["Quest Item"]..", "..L["Left Half"],container={19019}},
                {id=18829},
                {id=18823, dropRate=1},
                {id=19143},
                {id=19136},
                {id=18861},
                {id=19144},
                {id=18824},
                {},
                {id=18821},
                {id=17110},
                {id=18820},
                {},
                {id=19142},
                {id=18822},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Golemagg",
            prefix = "7)",
            name = BB["Golemagg the Incinerator"],
            defaults = { dropRate = 2 },
            loot = {
                {id=16815, dropRate=25, container={47200}},
                {id=16798, dropRate=25, container={47080}},
                {id=16809, dropRate=25, container={47278}},
                {id=16820, dropRate=25},
                {id=16833, dropRate=20, container={47332,47340}},
                {id=16845, dropRate=20},
                {id=16841, dropRate=20, container={47122,47130}},
                {id=16853, dropRate=20, container={47002,47010}},
                {id=16865, dropRate=20, container={47242}},
                {},
                {id=17203, dropRate=80, disc=L["Reagent"],container={17182}},
                {id=18829},
                {id=18823},
                {id=19143},
                {id=19136},
                {id=18861},
                {id=19144},
                {id=18824},
                {id=18821},
                {id=18820},
                {},
                {id=19142},
                {id=17072, dropRate=25},
                {id=17103, dropRate=25},
                {id=18822},
                {id=18842, dropRate=25},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Sulfuron",
            prefix = "8)",
            name = BB["Sulfuron Harbinger"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16816, dropRate=33, container={47199}},
                {id=16823, dropRate=30},
                {id=16848, dropRate=33},
                {id=16868, dropRate=30, container={47241}},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {id=18870},
                {id=19145},
                {id=19146},
                {id=18872},
                {id=18875},
                {id=18861},
                {},
                {id=18879},
                {id=19147},
                {},
                {id=17077},
                {id=18878},
                {id=17074, dropRate=3,container={17223}},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Majordomo",
            prefix = "9)",
            name = BB["Majordomo Executus"],
            defaults = { dropRate = 20 },
            loot = {
                {id=19139},
                {id=18810},
                {id=18811},
                {id=18808},
                {id=18809},
                {id=18812},
                {id=18806},
                {},
                {id=19140},
                {},
                {id=18805},
                {id=18803},
                {},
                {},
                {},
                {id=18703, dropRate=50, container={18714,18713,18715}},
                {},
                {id=18646, dropRate=50, container={18608,18609}},
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Basalthar",
            prefix = "10)",
            name = BB["Basalthar"], --65020
            loot = {
                { id = 58210, dropRate = 17 }, --Grasps of Sundering Power
                { id = 58212, dropRate = 17 }, --Treads of Scalding Rage
                { id = 58215, dropRate = 17 }, --Ash-Forged Greaves
                { id = 58237, dropRate = 17 }, --Emberwoven Binding Garments
                { id = 58238, dropRate = 17 }, --Runed Wardstone
                { id = 58242, dropRate = 17 }, --Sulfuron Aegis
                {},
                { id = 18820, dropRate = 11 }, --Talisman of Ephemeral Power
                { id = 18821, dropRate = 11 }, --Quick Strike Ring
                { id = 18822, dropRate = 11 }, --Obsidian Edged Blade
                { id = 18823, dropRate = 11 }, --Aged Core Leather Gloves
                { id = 18824, dropRate = 11 }, --Magma Tempered Boots
                { id = 18829, dropRate = 11 }, --Deep Earth Spaulders
                { id = 18861, dropRate = 11 }, --Flamewaker Legplates
                { id = 19136, dropRate = 11 }, --Onslaught Girdle
                { id = 19142, dropRate = 11 }, --Fire Runed Grimoire
                { id = 19143, dropRate = 11 }, --Flameguard Gauntlets
                { id = 19144, dropRate = 11 }, --Sabatons of the Flamewalker
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "Smoldaris",
            name = BB["Smoldaris"], --65021
            defaults = { dropRate = 25 },
            loot = {
                { id = 58211 }, --Molten Emberstone
                { id = 58213 }, --Smoldaris Fractured Eye
                { id = 58239 }, --Overheated Skyrazors
                { id = 58241 }, --Totem of Eruption
                {},
                { id = 58246, dropRate = 100 }, --Tablet of Molten Blast VI
                {},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
                {},
                unpack(mCShareloot),
            }
        },
        {
            id = "SorcererThaneThaurissan",
            prefix = "11)",
            name = BB["Sorcerer-Thane Thaurissan"], --57642
            loot = {
                { id = 58210, dropRate = 17 }, --Grasps of Sundering Power
                { id = 58212, dropRate = 17 }, --Treads of Scalding Rage
                { id = 58215, dropRate = 17 }, --Ash-Forged Greaves
                { id = 58237, dropRate = 17 }, --Emberwoven Binding Garments
                { id = 58238, dropRate = 17 }, --Runed Wardstone
                { id = 58242, dropRate = 17 }, --Sulfuron Aegis
                {},
                { id = 18820, dropRate = 11 }, --Talisman of Ephemeral Power
                { id = 18821, dropRate = 11 }, --Quick Strike Ring
                { id = 18822, dropRate = 11 }, --Obsidian Edged Blade
                { id = 18823, dropRate = 11 }, --Aged Core Leather Gloves
                { id = 18824, dropRate = 11 }, --Magma Tempered Boots
                { id = 18829, dropRate = 11 }, --Deep Earth Spaulders
                { id = 18861, dropRate = 11 }, --Flamewaker Legplates
                { id = 19136, dropRate = 11 }, --Onslaught Girdle
                { id = 19142, dropRate = 11 }, --Fire Runed Grimoire
                { id = 19143, dropRate = 11 }, --Flameguard Gauntlets
                { id = 19144, dropRate = 11 }, --Sabatons of the Flamewalker
                {},
                { id = 58214, dropRate = 25 }, --Modrag'zan, Heart of the Mountain
                { id = 58240, dropRate = 25 }, --Libram of Final Judgement
                { id = 58243, dropRate = 25 }, --Leggings of the Deep Delve
                { id = 58244, dropRate = 25 }, --Sigil of Ancient Accord
                {},
                { id = 41989, dropRate = 100 }, --Signet of Thaurissan
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
                {},
                unpack(mCShareloot),
            }
        },
        {
            id = "Ragnaros",
            prefix = "12)",
            name = BB["Ragnaros"],
            defaults = { dropRate = 20 },
            loot = {
                {id=16922, dropRate=13, container={47212}},
                {id=16915, dropRate=13, container={47092}},
                {id=16930, dropRate=13, container={47290}},
                {id=16909, dropRate=13},
                {id=16901, dropRate=13, container={47352,47360}},
                {id=16938, dropRate=13},
                {id=16946, dropRate=13, container={47142,47150}},
                {id=16954, dropRate=13, container={47022,47030}},
                {id=16962, dropRate=13, container={47254}},
                {},
                {id=18817},
                {id=18814},
                {id=17102},
                {id=17107},
                {id=19137},
                {id=17063},
                {id=18815, dropRate=8},
                {id=17082, dropRate=8},
                {id=17106},
                {id=18816},
                {id=17104, dropRate=8},
                {id=17076, dropRate=8},
                {},
                {id=19138, container={58088}},
                {},
                {id=17204, dropRate=6, disc=L["Reagent"],container={17182}},
                {id=19017, dropRate=20,container={19019}},
                {},
                {id=70171, dropRate=100, container={56060}},
                {},
                {id=92080,dropRate=1},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            }
        },
        {
            id = "MCTrash",
            name = L["Trash Mobs"].."-"..BZ["Molten Core"],
            defaults = {dropRate=.3},
            loot = {
                {id=16817, container={47203}},
                {id=16802, container={47083}},
                {id=16806, container={47281}},
                {id=16827},
                {id=16828, container={47335,47343}},
                {id=16851},
                {id=16838, container={47125,47133}},
                {id=16858, container={47005,47013}},
                {id=16864, container={47245}},
                {},
                {id=17011, disc=L["Reagent"], dropRate=15},
                {id=17010, disc=L["Reagent"], dropRate=35},
                {id=11382, disc=L["Reagent"]..", "..L["Molten Destroyer"], dropRate=7},
                {id=17012, disc=L["Reagent"], dropRate=100},
                {id=70101, dropRate=.56, container={56032}},
                {id=16819, container={47201}},
                {id=16799, container={47081}},
                {id=16804, container={47279}},
                {id=16825},
                {id=16830, container={47333,47341}},
                {id=16850},
                {id=16840, container={47123,47131}},
                {id=16857, container={47003,47011}},
                {id=16861, container={47243}},
                {id=81260, dropRate=.2},
                {id=81261, dropRate=.2},
                {id=81262, dropRate=.2},
                {id=81263, dropRate=.2},
                {id=81264, dropRate=.2},
                {id=81265, dropRate=.2},
                { id = 20951, dropRate = 1, container = { 18253 } }, --Narain's Scrying Goggles
            },
        },
        { name = L["Tier 1 Sets"], items = "AtlasLootT1SetMenu" },
        { name = L["Tier 2 Sets"], items = "AtlasLootT2SetMenu" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end