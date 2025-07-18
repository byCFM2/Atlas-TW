-- Molten_Core.lua - Данные предметов из Огненных Недр
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Подключаем ItemDB для создания предметов
local ItemDB = AtlasTW.ItemDB

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
        { letter = "A"..") " .. L["Entrance"] }
    },
    Reputation = {
        { name = BF["Hydraxian Waterlords"], loot = "WaterLords1" }
    },
    Keys = {
        { name = L["Aqual Quintessence"], loot = "VanillaKeys", info = L["Boss"] },
        { name = L["Eternal Quintessence"], loot = "VanillaKeys", info = L["Boss"] }
    },
    Bosses = {
        {
            id = "Lucifron",
            prefix = "1)",
            name = BB["Lucifron"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16800, dropRate=20, container={47085}},{id=16829, dropRate=20, container={47337,47345}}, {id=16837, dropRate=20, container={47127,47135}},
                {id=16859, dropRate=20, container={47007,47015}}, {id=16863, dropRate=30, container={47244}}, {id=16805, dropRate=30, container={47280}},{},
                {id=18870}, {id=17109, dropRate=20}, {id=19145}, {id=19146}, {id=18872}, {id=18875}, {id=18861}, {id=18879}, {id=19147}, {id=17077},
                {id=18878}, {}, {id=16665, disc=L["Book"], dropRate=100},
            }
        },
        {
            id = "Magmadar",
            prefix = "2)",
            name = BB["Magmadar"],
            defaults = { dropRate = 5 },
            loot = {
                {id=16814, dropRate=20, container={47204}}, {id=16796, dropRate=20, container={47084}}, {id=16810, dropRate=20, container={47282}},
                {id=16835, dropRate=17, container={47336,47344}}, {id=16843, dropRate=17, container={47126,47134}}, {id=16855, dropRate=17, container={47006,47014}},
                {id=16867, dropRate=17, container={47246}}, {id=16822, dropRate=20}, {id=16847, dropRate=17}, {},{},{},{},{},{},
                {id=17065, dropRate=17}, {id=18829}, {id=18823}, {id=19143}, {id=19136}, {id=18861}, {id=19144}, {id=18824},
                {id=18821}, {id=18820}, {id=19142}, {id=17069, dropRate=20}, {id=18203, dropRate=20}, {id=17073, dropRate=20}, {id=18822},
            }
        },
        {
            id = "Gehennas",
            prefix = "3)",
            name = BB["Gehennas"],
            defaults = { dropRate = 5 },
            loot = {
                {id=16812, dropRate=25, container={47202}}, {id=16839, dropRate=25, container={47124,47132}}, {id=16860, dropRate=25, container={47004,47012}},
                {id=16826, dropRate=25}, {}, {id=16862, dropRate=25, container={47247}}, {id=16849, dropRate=25}, {},{},{},{},{},{},{},{},
                {id=18870}, {id=19145}, {id=19146}, {id=18872}, {id=18875}, {id=18861}, {id=18879}, {id=19147}, {id=17077}, {id=18878},
            }
        },
        {
            id = "Garr",
            prefix = "4)",
            name = BB["Garr"],
            defaults = { dropRate = 5 },
            loot = {
                {id=16813, dropRate=20, container={47198}}, {id=16795, dropRate=20, container={47078}}, {id=16808, dropRate=20, container={47276}},
                {id=16821, dropRate=20}, {id=16834, dropRate=17, container={47330,47338}}, {id=16846, dropRate=17}, {id=16842, dropRate=17, container={47120,47128}},
                {id=16854, dropRate=17, container={47000,47008}}, {id=16866, dropRate=17, container={47240}}, {},{},{},{id=17782}, {id=18564,disc=L["Right Half"]},
                {id=19019,disc=L["Quest Reward"],dropRate=0}, {id=18829}, {id=18823}, {id=19143}, {id=19136}, {id=18861}, {id=19144}, {id=18824},
                {id=18821}, {id=18820}, {id=19142}, {id=17066, dropRate=17}, {id=17071, dropRate=20}, {id=17105, dropRate=20}, {id=18832, dropRate=20}, {id=18822},
            }
        },
        {
            id = "Shazzrah",
            prefix = "5)",
            name = BB["Shazzrah"],
            defaults = { dropRate = 3 },
            loot = {
                {id=16811, dropRate=25, container={47205}}, {id=16803, dropRate=25, container={47283}}, {id=16824, dropRate=25}, {},
                {id=16831, dropRate=33, container={47334,47342}}, {id=16801, dropRate=33, container={47082}}, {id=16852, dropRate=33}, {},{},{},{},{},{},{},{},
                {id=18870}, {id=19145}, {id=19146}, {id=18872}, {id=18875}, {id=18861}, {id=18879}, {id=19147}, {id=17077}, {id=18878},
            }
        },
        {
            id = "BaronGeddon",
            prefix = "6)",
            name = BB["Baron Geddon"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16797, dropRate=33, container={47079}},{id=16807, dropRate=33, container={47277}},{id=16836, dropRate=30, container={47331,47339}},
                {id=16844, dropRate=30, container={47121,47358}},{id=16856, dropRate=60, container={47001,47009}},{},{},{},{},{},{},{},{},
                {id=18563, dropRate=6, disc=L["Quest Item"]..", "..L["Left Half"]},{id=19019,dropRate=0, disc=L["Quest Reward"]},
                {id=18829}, {id=18823, dropRate=1},{id=19143}, {id=19136}, {id=18861}, {id=19144}, {id=18824}, {id=18821}, {id=17110},
                {id=18820}, {id=19142}, {id=18822},
            }
        },
        {
            id = "Golemagg",
            prefix = "7)",
            name = BB["Golemagg the Incinerator"],
            defaults = { dropRate = 2 },
            loot = {
                {id=16815, dropRate=25, container={47200}}, {id=16798, dropRate=25, container={47080}}, {id=16809, dropRate=25, container={47277}},--TODO CHECK CONTAINER FOR 16809
                {id=16820, dropRate=25}, {id=16833, dropRate=20, container={47332,47340}}, {id=16845, dropRate=20},
                {id=16841, dropRate=20, container={47122,47130}},{id=16853, dropRate=20, container={47002,47010}},
                {id=16865, dropRate=20, container={47242}},{},{},{},{},{id=17203, dropRate=80, disc=L["Reagent"]}, {id=17182, dropRate=0},
                {id=18829}, {id=18823}, {id=19143}, {id=19136}, {id=18861}, {id=19144}, {id=18824},{id=18821}, {id=18820}, {id=19142},
                {id=17072, dropRate=25}, {id=17103, dropRate=25}, {id=18822}, {id=18842, dropRate=25},
            }
        },
        {
            id = "Sulfuron",
            prefix = "8)",
            name = BB["Sulfuron Harbinger"],
            defaults = { dropRate = 4 },
            loot = {
                {id=16816, dropRate=33, container={47199}}, {id=16823, dropRate=30}, {id=16848, dropRate=33},
                {id=16868, dropRate=30, container={47241}},{},{},{},{},{},{},{},{},{},{},{},{id=18870}, {id=19145},{id=19146}, {id=18872},
                {id=18875}, {id=18861}, {id=18879}, {id=19147}, {id=17077}, {id=18878}, {id=17074, dropRate=3},{id=17223, dropRate=0},
            }
        },
        {
            id = "Majordomo",
            prefix = "9)",
            name = BB["Majordomo Executus"],
            defaults = { dropRate = 20 },
            loot = {
                {id=19139}, {id=18810}, {id=18811}, {id=18808}, {id=18809}, {id=18812}, {id=18806}, {id=19140}, {id=18805}, {id=18803},{},{},{},{},{},
                {id=18703, dropRate=50},{id=18714, dropRate=0, disc=L["Quest Reward"]},
                {id=18713, dropRate=0, disc=L["Quest Reward"]},{id=18715, dropRate=0, disc=L["Quest Reward"]},{},
                {id=18646, dropRate=50},{id=18608, dropRate=0, disc=L["Quest Reward"]},
                {id=18609, dropRate=0, disc=L["Quest Reward"]},
            }
        },
        {
            id = "Ragnaros",
            prefix = "10)",
            name = BB["Ragnaros"],
            defaults = { dropRate = 20 },
            loot = {
                {id=16922, dropRate=13, container={47212}}, {id=16915, dropRate=13, container={47092}}, {id=16930, dropRate=13, container={47290}},
                {id=16909, dropRate=13}, {id=16901, dropRate=13, container={47352,47360}}, {id=16938, dropRate=13},
                {id=16946, dropRate=13, container={47142,47150}},{id=16954, dropRate=13, container={47022,47030}},
                {id=16962, dropRate=13, container={47254}},{},{id=17204, dropRate=6, disc=L["Reagent"]}, {id=17182,dropRate=0},
                {id=19017, dropRate=20},{id=19019, disc=L["Quest Reward"],dropRate=0}, {id=92080,dropRate=1},
                {id=18817},{id=18814}, {id=17102}, {id=17107},{id=19137},{id=17063}, {id=19138}, {id=18815, dropRate=8}, {id=17082, dropRate=8},
                {id=17106}, {id=18816}, {id=17104, dropRate=8},{id=17076, dropRate=8},{},{id=70171, dropRate=100},
            }
        },
        {
            id = "Trash",
            name = L["Trash Mobs"],
            defaults = {dropRate=.3},
            loot = {
                {id=16817, container={47203}},{id=16802, container={47083}},{id=16806, container={47281}},
                {id=16827},{id=16828, container={47335,47343}},{id=16851},{id=16838, container={47125,47133}},
                {id=16858, container={47005,47013}},{id=16864, container={47245}},{},{id=17011, disc=L["Reagent"], dropRate=15},
                {id=17010, disc=L["Reagent"], dropRate=35},{id=11382, disc=L["Reagent"]..", "..L["Molten Destroyer"], dropRate=7},
                {id=17012, disc=L["Reagent"], dropRate=100},{id=70101, dropRate=.56},{id=16819, container={47201}},{id=16799, container={47081}},
                {id=16804, container={47279}},{id=16825},{id=16830, container={47333,47341}},{id=16850},{id=16840, container={47123,47131}},
                {id=16857, container={47003,47011}},{id=16861, container={47243}},{id=81260, dropRate=.2},{id=81261, dropRate=.2},{id=81262, dropRate=.2},
                {id=81263, dropRate=.2},{id=81264, dropRate=.2},{id=81265, dropRate=.2},
            },
        },
        {   id = "Randombossloot",
            name = L["Random Boss Loot"],
            loot = {
                {id=18264, dropRate=1},{id=18262, disc=L["Trade Goods"]},{},{id=18292, dropRate=1},{id=18282},{},{id=18291, dropRate=1},{id=18168},{},
                {id=18290, dropRate=1},{id=18283, disc= L["Scope"]},{},{id=18259, dropRate=1},{},{id=18260, dropRate=1},{id=18252, dropRate=1},
                {id=18251, disc=L["Trade Goods"]},{},{id=18265, dropRate=1},{id=18263},{},{id=21371, dropRate=1},{id=21342},{},{id=18257, dropRate=1},
                {id=18253, disc=L["Potion"]},
            },
        },
        { name = L["Tier 1 Sets"], table = "T1Set" },
        { name = L["Tier 2 Sets"], table = "T2Set" },
    },
}

-- Вспомогательная функция для создания предметов из таблицы loot
local function CreateItemsFromLootTable(bossData)
    if not bossData.loot then return {} end
    local items = {}
    local defaults = bossData.defaults or {}
    for _, itemData in ipairs(bossData.loot) do
        -- Применяем значения по умолчанию
        for key, value in pairs(defaults) do
            if itemData[key] == nil then
                itemData[key] = value
            end
        end
        table.insert(items, ItemDB.CreateItem(itemData))
    end
    return items
end

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
    bossData.Items = CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

-- Функция получения всех предметов из подземелья
function AtlasTW.InstanceData.MoltenCore.GetAllItems()
    local allItems = {}
    for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
        if bossData.Items then
            for i = 1, getn(bossData.Items) do
                local item = bossData.Items[i]
                tinsert(allItems, item)
            end
        end
    end
    for i = 1, getn(AtlasTW.InstanceData.MoltenCore.Trash) do
        local item = AtlasTW.InstanceData.MoltenCore.Trash[i]
        --[[ 
        item.source = L["Trash Mobs"]
        item.zone = BZ["Molten Core"] ]]
        tinsert(allItems, item)
    end
    return allItems
end

-- Функция получения предметов для конкретного босса
function AtlasTW.InstanceData.MoltenCore.GetBossItems(bossName)
    for _, bossData in ipairs(AtlasTW.InstanceData.MoltenCore.Bosses) do
        if bossData.name == BB[bossName] then
            return bossData.Items
        end
    end
    return {}
end

-- Функция получения предметов для определенного класса
function AtlasTW.InstanceData.MoltenCore.GetItemsForClass(className)
    local classItems = {}
    local allItems = AtlasTW.InstanceData.MoltenCore.GetAllItems()
    for i = 1, getn(allItems) do
        if allItems[i]:IsValidForClass(className) then
            tinsert(classItems, allItems[i])
        end
    end
    return classItems
end