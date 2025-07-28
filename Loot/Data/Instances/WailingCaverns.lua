-- Wailing Caverns Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

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
                {id=51217, disc=L["Transmogrification"], dropRate=1},
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
                {id=6446},
                {},
                {id=80709},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
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
                {id=51217, disc=L["Transmogrification"], dropRate=1},
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
                {id=51217, disc=L["Transmogrification"], dropRate=1},
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
                {id=41410, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "WCLordPythas",
            prefix = "7)",
            name = BB["Lord Pythas"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6472},
                {id=6473},
                {},
                {id=80711},
                {},
                {id=80864, disc=L["Quest Item"], dropRate=100},
            }
        },
        {
            id = "WCSkum",
            prefix = "8)",
            name = BB["Skum"],
            defaults = { dropRate = 33 },
            loot = {
                {id=6449},
                {id=6448},
                {},
                {id=80712},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
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
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
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
                {id=9741, disc=L["Quest Item"], dropRate=100},
                {id=80863, disc=L["Quest Item"], dropRate=100},
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
                {id=51217, disc=L["Transmogrification"], dropRate=1},
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
            defaults = { dropRate = .02 },
            loot = {
                {id=10413, dropRate=2},
                {},
                {id=55381, dropRate=25},
                {id=80807},
                {},
                {id=80862, disc=L["Quest Item"], dropRate=30},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.WailingCaverns.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end