-- Wailing Caverns Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.WailingCavernsEnt = {
    Name = BZ["Wailing Caverns"] .. " (" .. L["Entrance"] .. ")",
    Acronym = "WC",
    Location = BZ["The Barrens"],
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = BZ["Wailing Caverns"] }
    },
    Bosses = {
        {
            id = "WCMadMagglish",
            prefix = "1)",
            name = BB["Mad Magglish"],
            postfix = L["Varies"],
            loot = {
                {id=5334, dropRate=100},
            }
        },
        {
            id = "WCTrigoretheLasher",
            prefix = "2)",
            name = BB["Trigore the Lasher"],
            loot = {
                {id=5425, dropRate=50},
                {},
                {id=5426, dropRate=50},
            }
        },
        {
            id = "WCBoahn",
            prefix = "3)",
            name = BB["Boahn"],
            loot = {
                {id=5422, dropRate=70},
                {},
                {id=5423, dropRate=30},
            }
        },
        {
            name = L["Above the Entrance:"],
            color = "|cffcc9933",
        },
        {
            name = BB["Ebru"],
            color = "|cff999999",
        },
        {
            name = L["Nalpak"],
            color = "|cff999999",
        },
        {
            id = "WCKalldanFelmoon",
            name = L["Kalldan Felmoon"],
            loot = {
                {id=6474, disc=L["Vendor"], container={6466}},
                {id=6475, disc=L["Vendor"], container={6467}},
                {id=6476, disc=L["Vendor"], container={6468}},
            }
        },
        {
            name = L["Waldor"],
            color = "|cff999999",
        },
    }
}

AtlasTW.InstanceData.WailingCaverns = {
    Name = BZ["Wailing Caverns"],
    Location = BZ["The Barrens"],
    Level = {10,24},
    Acronym = "WC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Bosses = {
        {
            id = "WCDisciple",
            prefix = "1)",
            name = L["Disciple of Naralex"],
            color = "|cff9d9d9d",
        },
        {
            id = "WCLordCobrahn",
            prefix = "2)",
            name = BB["Lord Cobrahn"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6460},
                {id=10410},
                {},
                {id=6465},
                {},
                {id=9738, dropRate=100, container={6504,6505}},
            }
        },
        {
            id = "WCLadyAnacondra",
            prefix = "3)",
            name = BB["Lady Anacondra"],
            defaults = { dropRate = 25 },
            loot = {
                {id=10412},
                {id=5404},
                {},
                {id=80709},
                {},
                {id=6446},
                {},
                {id=23800, dropRate=.2},
                {},
                {id=9739, dropRate=100, container={6504,6505}},
            }
        },
        {
            id = "WCKresh",
            prefix = "4)",
            name = BB["Kresh"],
            defaults = { dropRate = 33 },
            loot = {
                {id=13245},
                {id=6447},
                {},
                {id=80710},
                {},
                {id=6443, dropRate=80, container={6480,918}},
            }
        },
        {
            id = "WCDeviateFaerieDragon",
            prefix = "5)",
            name = BB["Deviate Faerie Dragon"],
            postfix = L["Rare"],
            defaults = { dropRate = 50 },
            loot = {
                {id=5243},
                {id=6632},
                {},
                {id=6443, dropRate=80, container={6480,918}},
            }
        },
        {
            id = "WCZandara",
            prefix = "6)",
            name = BB["Zandara Windhoof"],
            defaults = { dropRate = 25 },
            loot = {
                {id=55371, dropRate=50},
                {},
                {id=55369},
                {id=55370},
                {},
                {id=41410, dropRate=100, container={70224}},
            }
        },
        {
            id = "WCLordPythas",
            prefix = "7)",
            name = BB["Lord Pythas"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6473},
                {id=80711},
                {},
                {id=6472},
                {id=80798, dropRate=.5},
                {},
                {id=9740, dropRate=100, container={6504,6505}},
                {id=80864, dropRate=100, container={80860,80861}},
            }
        },
        {
            id = "WCSkum",
            prefix = "8)",
            name = BB["Skum"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6448},
                {},
                {id=6449},
                {id=80712},
                {},
                {id=6443, dropRate=80, container={6480,918}},
            }
        },
        {
            id = "WCVangros",
            prefix = "9)",
            name = BB["Vangros"],
            defaults = { dropRate = 25 },
            loot = {
                {id=55374, dropRate=50},
                {},
                {id=55372},
                {id=55373},
            }
        },
        {
            id = "WCLordSerpentis",
            prefix = "10)",
            name = BB["Lord Serpentis"],
            postfix = L["Upper"],
            defaults = { dropRate = 25 },
            loot = {
                {id=6469},
                {id=5970},
                {id=10411},
                {id=6459},
                {},
                {id=9741, dropRate=100, container={6504,6505}},
                {id=80863, container={80860,80861}},
            }
        },
        {
            id = "WCVerdan",
            prefix = "11)",
            name = BB["Verdan the Everliving"],
            postfix = L["Upper"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6629},
                {},
                {id=6630},
                {id=6631},
                {},
                {id=6443, dropRate=80, container={6480,918}},
            }
        },
        {
            id = "WCMutanus",
            prefix = "12)",
            name = BB["Mutanus the Devourer"],
            defaults = { dropRate = 25 },
            loot = {
                {id=6461},
                {id=6627},
                {id=6463},
                {id=81006},
                {},
                {id=10441, container={10657,10658}},
                {id=6443, dropRate=80, container={6480,918}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "WCNaralex",
            name = L["Naralex"],
            color = "|cff9d9d9d",
        },
        {
            id = "WCTrash",
            name = L["Trash Mobs"],
            loot = {
                {id=10413, dropRate=2},
                {},
                {id=55381, dropRate=25},
                {id=80807, dropRate = .02},
                {},
                {id=80862, dropRate=30, container={80860,80861}},
            }
        },
        { name = BIS["Embrace of the Viper"], items = "Wailing" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.WailingCavernsEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.WailingCaverns.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end