-- Maraudon Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.MaraudonEnt = {
    Name = BZ["Maraudon"].." ("..L["Entrance"]..")",
    Location = BZ["Desolace"],
    Acronym = "Mara",
    Entrances = {
        { letter = "A", info = L["Entrance"] },
        { letter = "B", info = BZ["Maraudon"] .. " (" .. L["Purple"] .. ")" },
        { letter = "C", info = BZ["Maraudon"] .. " (" .. L["Orange"] .. ")" },
        { letter = "D", info = BZ["Maraudon"] .. " (" .. L["Portal"] .. ")" },
    },
    Bosses = {
        {
            id = "MARANamelessProphet",
            name = L["The Nameless Prophet"],
            loot = {
                {id=17757, disc=L["Quest Item"], dropRate = 100,container={17774}},
            }
        },
        {
            id = "MARAKhanKolk",
            prefix = "1)",
            name = BB["Kolk"],
            loot = {
                {id=17761, disc=L["Quest Item"], dropRate = 100,container={17774}},
            }
        },
        {
            id = "MARAKhanGelk",
            prefix = "2)",
            name = BB["Gelk"],
            loot = {
                {id=17762, disc=L["Quest Item"], dropRate = 100,container={17774}},
            }
        },
        {
            id = "MARAKhanMagra",
            prefix = "3)",
            name = BB["Magra"],
            loot = {
                {id=17763, disc=L["Quest Item"], dropRate=100,container={17774}},
            }
        },
        { prefix = "4)", name = BB["Cavindra"], color = "|cff9d9d9d"},
        { prefix = "5)", name = BB["Cursed Centaur"], postfix = L["Rare"]..", "..L["Varies"], color = "|cff9d9d9d"},
    }
}

AtlasTW.InstanceData.Maraudon = {
    Name = BZ["Maraudon"],
    Location = BZ["Desolace"],
    Level = {35,55},
    Acronym = "Mara",
    MaxPlayers = 5,
    DamageType = L["Nature"],
    Entrances = {
        { letter = "A", info = L["Orange"] },
        { letter = "B", info = L["Purple"] },
        { letter = "C", info = L["Portal"] }
    },
    Keys = {
        { name = L["Scepter of Celebras"], loot = "VanillaKeys", info = L["Portal"] }
    },

    Bosses = {
        {
            id = "MARAKhanVeng",
            prefix = "1)",
            name = L["Veng"],
            loot = {
                {id=17765, disc=L["Quest Item"], dropRate = 100,container={17774}},
            }
        },
        {
            id = "MARANoxxion",
            prefix = "2)",
            name = BB["Noxxion"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17746},
                {id=17744},
                {},
                {id=17745},
                {id=17702, dropRate=100,container={17191}},
            }
        },
        {
            id = "MARARazorlash",
            prefix = "3)",
            name = BB["Razorlash"],
            defaults = { dropRate = 25 },
            loot = {
                {id=17749},
                {id=17748},
                {id=17750},
                {id=17751},
                {},
                {id=60780, dropRate=3,container={65022}},
                {},
                {id=51802, dropRate=8},
            }
        },
        {
            id = "MARAKhanMaraudos",
            prefix = "4)",
            name = L["Maraudos"],
            loot = {
                {id=17764, disc=L["Quest Item"], dropRate = 100},
            }
        },
        {
            id = "MARALordVyletongue",
            prefix = "5)",
            name = BB["Lord Vyletongue"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17755},
                {id=17754},
                {},
                {id=17752},
                {},
                {id=17684, dropRate=80,container={17775,17776,17777,17779}},
                {id=61748, dropRate=100,container={61517}},
                {id=17703, dropRate=100,container={17191}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "MARAMeshloktheHarvester",
            prefix = "6)",
            name = BB["Meshlok the Harvester"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17767},
                {id=17741},
                {id=17742},
                {},
                {id=60780, dropRate=10,container={65022}},
            }
        },
        {
            id = "MARACelebrastheCursed",
            prefix = "7)",
            name = BB["Celebras the Cursed"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17740},
                {id=17739},
                {id=17738},
                {},
                {id=60780, dropRate=3,container={65022}},
                {},
                {id=17684, dropRate=80},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "MARALandslide",
            prefix = "8)",
            name = BB["Landslide"],
            defaults = { dropRate = 25 },
            loot = {
                {id=17734},
                {id=17736},
                {id=17737},
                {id=17943},
                {},
                {id=17684, dropRate=80,container={17775,17776,17777,17779}},
                {id=41002, dropRate=100,container={40080}},
                {id=41356, disc=BS["Gemology"], dropRate=100},
            }
        },
        {
            id = "MARATinkererGizlock",
            prefix = "9)",
            name = BB["Tinkerer Gizlock"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17718},
                {id=17717},
                {id=17719},
                {},
                {id=40083, dropRate=8, container={41327}},
                {id=51809, dropRate=8, container={60098}},
                {},
                {id=17684, dropRate=80,container={17775,17776,17777,17779}},
            }
        },
        {
            id = "MARARotgrip",
            prefix = "10)",
            name = BB["Rotgrip"],
            defaults = { dropRate = 33 },
            loot = {
                {id=17732},
                {id=17728},
                {id=17730},
                {},
                {id=17684, dropRate=80,container={17775,17776,17777,17779}},
            }
        },
         {
            id = "MARAPrincessTheradras",
            prefix = "11)",
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
                {},
                {id=17710},--weap
                {id=17766},
                {},
                {id=17684, dropRate=80,container={17775,17776,17777,17779}},
                {id=61458, dropRate=100},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "MARAElderSplitrock",
            prefix = "12)",
            name = L["Elder Splitrock"],
            postfix = L["Lunar Festival"],
           -- loot = "LunarFestival", TODO
        },
        {
            id = "MARATrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=80756},
                {id=80753},
                {id=80752},
                {id=80755},
                {id=80749},
                {id=80754},
                {},
                {id=62008},
                {},
                {id=80750},
                {id=80751},
                {id=80748},
                {},
                {id=60780, dropRate=.5,container={65022}},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Maraudon.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.MaraudonEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end