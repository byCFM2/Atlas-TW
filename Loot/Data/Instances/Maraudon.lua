-- Maraudon Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.Maraudon = {
    Name = BZ["Maraudon"],
    Location = BZ["Desolace"],
    LevelRange = {35,55},
    MinLevel = 30,
    Acronym = "Mara",
    PlayerLimit = 5,
    DamageType = "Nature",
    Continent = BZ["Kalimdor"],
    Entrances = {
        { letter = "A", info = L["Orange"] },
        { letter = "B", info = L["Purple"] },
        { letter = "C", info = L["Portal"] }
    },
    Keys = {
        { name = "Scepter of Celebras", info = L["Portal"] }
    },

    Bosses = {
        {
            id = "MARANamelessProphet",
            prefix = "1)",
            name = L["The Nameless Prophet"],
            defaults = { dropRate = 100 },
            loot = {
                {id=17757},
            }
        },
        {
            id = "MARAKhanKolk",
            prefix = "2)",
            name = BB["Kolk"],
            defaults = { dropRate = 100 },
            loot = {
                {id=17761},
            }
        },
        {
            id = "MARAKhanGelk",
            prefix = "3)",
            name = BB["Gelk"],
            defaults = { dropRate = 100 },
            loot = {
                {id=17762},
            }
        },
        {
            id = "MARAKhanMagra",
            prefix = "4)",
            name = BB["Magra"],
            defaults = { dropRate = 100 },
            loot = {
                {id=17763},
            }
        },
        {
            id = "MARAKhanVeng",
            prefix = "5)",
            name = L["Veng"],
            defaults = { dropRate = 100 },
            loot = {
                {id=17765},
            }
        },
        {
            id = "MARAKhanMaraudos",
            prefix = "6)",
            name = L["Maraudos"],
            defaults = { dropRate = 100 },
            loot = {
                {id=17764},
            }
        },
        {
            id = "MARANoxxion",
            prefix = "7)",
            name = BB["Noxxion"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17746},
                {id=17744},
                {id=17745},
            }
        },
        {
            id = "MARALordVyletongue",
            prefix = "8)",
            name = BB["Lord Vyletongue"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17755},
                {id=17754},
                {id=17752},
                {},
                {id=51217, disc=L["Fashion Coin"], dropRate=1},
            }
        },
        {
            id = "MARAMeshloktheHarvester",
            prefix = "9)",
            name = BB["Meshlok the Harvester"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17767},
                {id=17741},
                {id=17742},
            }
        },
        {
            id = "MARACelebrastheCursed",
            prefix = "10)",
            name = BB["Celebras the Cursed"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17740},
                {id=17739},
                {id=17738},
                {},
                {id=51217, disc=L["Fashion Coin"], dropRate=1},
            }
        },
        {
            id = "MARALandslide",
            prefix = "11)",
            name = BB["Landslide"],
            defaults = { dropRate = 25 },
            loot = {
                {id=17734},
                {id=17736},
                {id=17737},
                {id=17943},
                {},
                {id=41002, dropRate=100},
                {id=41356, dropRate=100},
            }
        },
        {
            id = "MARATinkererGizlock",
            prefix = "12)",
            name = BB["Tinkerer Gizlock"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17718},
                {id=17717},
                {id=17719},
                {},
                {id=51809, dropRate=8},
            }
        },
        {
            id = "MARARotgrip",
            prefix = "13)",
            name = BB["Rotgrip"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17732},
                {id=17728},
                {id=17730},
            }
        },
        {
             id = "MARARazorlash",
              prefix = "14)",
              name = BB["Razorlash"],
              defaults = { dropRate = 25 },
              loot = {
                  {id=17749},
                  {id=17748},
                  {id=17750},
                  {id=17751},
                  {},
                  {id=51802, dropRate=8},
              }
          },
         {
            id = "MARAPrincessTheradras",
            prefix = "15)",
            name = BB["Princess Theradras"],
            defaults = { dropRate = 14 },
            loot = {
                {id=17780, dropRate=1},
                {},
                {id=17715},
                {id=17707},
                {id=17714},
                {id=17711},
                {id=17713},
                {id=17710},
                {id=17766},
                {},
                {id=51217, disc=L["Fashion Coin"], dropRate=5},
            }
        },
        {
            id = "MARATrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0.01 },
            loot = {
                {id=80756},
                {id=80753},
                {id=80752},
                {id=80755},
                {id=80749},
                {id=80754},
                {id=62008},
                {id=80750},
                {id=80751},
                {id=80748},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Maraudon.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end