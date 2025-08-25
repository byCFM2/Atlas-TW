-- RazorfenDowns Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.RazorfenDowns = {
    Name = BZ["Razorfen Downs"],
    Location = BZ["The Barrens"],
    Level = {25,46},
    Acronym = "RFD",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) ".. L["Entrance"] }
    },

    Bosses = {
        {
            id = "RFDTutenkash",
            prefix = "1)",
            name = BB["Tuten'kash"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10776},
                {id=10775},
                {id=10777},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "RFDHenryStern",
            prefix = "2)",
            name = L["Henry Stern"],
            loot = {
                {id=3826, disc=L["Consumable"]},
                {id=10841, disc=L["Consumable"]},
            }
        },
        {
            id = "RFDBelnistrasz",
            name = L["Belnistrasz"],
            color = "|cff9d9d9d",
        },
        {
            id = "RFDSahrhee",
            name = L["Sah'rhee"],
            color = "|cff9d9d9d",
        },
        {
            id = "RFDLadyF",
            name = BB["Lady Falther'ess"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 50 },
            loot = {
                {id=23178},
                {id=23177},
            }
        },
        {
            id = "RFDPlaguemaw",
            prefix = "3)",
            name = BB["Plaguemaw the Rotting"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10766},
                {id=10760},
                {},
                {id=80744},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "RFDMordreshFireEye",
            prefix = "4)",
            name = BB["Mordresh Fire Eye"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10769},
                {id=10771},
                {id=10770},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "RFDGlutton",
            prefix = "5)",
            name = BB["Glutton"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10774},
                {id=10772},
                {},
                {id=80745},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "RFDRakameg",
            prefix = "6)",
            name = BB["Death Prophet Rakameg"],
            defaults = { dropRate = 25 },
            loot = {
                {id=58172}, --Thornspine
                {id=58173}, --Thorngorged Fleshgloves
                {id=58174}, --Totem of the Rotten Roots
                {id=58175}, --Blood-etched Fetish
                
            }
        },
        {
            id = "RFDRagglesnout",
            prefix = "7)",
            name = BB["Ragglesnout"],
            postfix = L["Rare"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10768},
                {id=10767},
                {id=10758},
            }
        },
        {
            id = "RFDAmnennar",
            prefix = "8)",
            name = BB["Amnennar the Coldbringer"],
            defaults = { dropRate = 20 },
            loot = {
                {id=10763},
                {id=10762},
                {id=10764},
                {id=10761},
                {id=10765},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "RFDTrash",
            name = L["Trash Mobs"].." "..BZ["Razorfen Downs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=10574},
                {id=10581, dropRate=.02},
                {id=10583},
                {id=10584, dropRate=.02},
                {id=10578},
                {id=10582, dropRate=.02},
                {id=10572},
                {id=10567, dropRate=.02},
                {id=10571},
                {id=10570},
                {id=10573},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.RazorfenDowns.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end