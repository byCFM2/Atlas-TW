-- Lower_Karazhan_Halls.lua - Данные предметов из Нижних Залов Каражана
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local lKarazhanShare = {
    {id=61739, dropRate=1.3},
    {id=61219, dropRate=0.9},
    {id=61180, dropRate=1.2},
    {id=70001, dropRate=0.9},
    {},
    {id=8547, dropRate=1.2,container={8546}},
    {},
    {id=61178, dropRate=1.2,container={61182}},
    {id=61189, dropRate=0.9,container={61185}},
    {id=61177, dropRate=1.2,container={61181}},
    {id=13517, dropRate=0.9,container={13503}},
    {id=61190, dropRate=0.9,container={61186}},
    {id=70102, dropRate=0.9,container={56031}},
    {id=61192, dropRate=1.3,container={61188}},
    {id=61191, dropRate=0.9,container={61187}},
}

-- Данные Нижних Залов Каражана
AtlasTW.InstanceData.LowerKarazhan = {
    Name = BZ["Lower Karazhan Halls"],
    Location = BZ["Deadwind Pass"],
    Level = {58,60},
    Acronym = "LKH",
    MaxPlayers = 10,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] },
        { letter = "B) " .. L["Connection"] }
    },
    Bosses = {
        {
            id = "LKHRolfen",
            prefix = "1)",
            name = BB["Master Blacksmith Rolfen"],
            defaults = { dropRate = 1.44 },
            loot = {
                {id=61805,container={60010}},
                {id=61806,container={60009}},
                {id=61807,container={60008}},
                {id=61808,container={60007}},
            }
        },
        {
            prefix = "a)",
            name = L["Engraved Golden Bracelet"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "b)",
            name = L["Comfortable Pillow"],
            color = "|cff9d9d9d",
        },
        {
            id = "LKHBroodQueenAraxxna",
            prefix = "2)",
            name = BB["Brood Queen Araxxna"],
            defaults = { dropRate = 14 },
            loot = {
                {id=61297, dropRate=20},
                {id=61260, dropRate=20},
                {id=61268, dropRate=20},
                {id=61243, dropRate=20},
                {id=61270, dropRate=20},
                {},
                {id=61269},
                {id=61245},
                {id=61283},
                {id=61272},
                {id=61244},
                {id=61278},
                {id=61816},
                {},
                {},
                unpack(lKarazhanShare),
            }
        },
        {
            id = "LKHGrizikil",
            prefix = "3)",
            name = BB["Grizikil"],
            defaults = { dropRate = 14 },
            loot = {
                {id=61291, dropRate=20},
                {id=61253, dropRate=20},
                {id=61276, dropRate=20},
                {id=61292, dropRate=20},
                {id=61251, dropRate=20},
                {},
                {id=61252},
                {id=61261},
                {id=61267},
                {id=61288},
                {id=61289},
                {id=61298},
                {id=61450},
                {},
                {id=41392, dropRate=100},
                unpack(lKarazhanShare),
            }
        },
        {
            prefix = "c)",
            name = L["Councilman Kyleson"],
            color = "|cff9d9d9d",
        },
        {
            id = "LKHClawlordHowlfang",
            prefix = "4)",
            name = BB["Clawlord Howlfang"],
            defaults = { dropRate = 14 },
            loot = {
                {id=61281, dropRate=20},
                {id=61273, dropRate=20},
                {id=61249, dropRate=20},
                {id=61293, dropRate=20},
                {id=61248, dropRate=20},
                {},
                {id=61250},
                {id=61285},
                {id=61271},
                {id=61274},
                {id=61290},
                {id=61263},
                {id=61451},
                {},
                {},
                unpack(lKarazhanShare),
            }
        },
        {
            id = "LKHLordBlackwaldII",
            prefix = "5)",
            name = BB["Lord Blackwald II"],
            defaults = { dropRate = 14 },
            loot = {
                {id=61266, dropRate=20},
                {id=61246, dropRate=20},
                {id=61262, dropRate=20},
                {id=61247, dropRate=20},
                {id=61443, dropRate=20},
                {},
                {id=61184, dropRate=0.85, disc=L["Legendary"]},
                {},
                {id=61282},
                {id=61449},
                {id=61279},
                {id=61287},
                {id=61294},
                {id=61255},
                {id=61286},
                unpack(lKarazhanShare),
            }
        },
        {
            prefix = "d)",
            name = L["Lord Ebonlocke"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "e)",
            name = L["Obsidian Rod"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "f)",
            name = L["Duke Rothlen"],
            color = "|cff9d9d9d",
        },
        {
            id = "LKHMoroes",
            prefix = "6)",
            name = BB["Moroes"],
            defaults = { dropRate = 10 },
            loot = {
                {id=61284, dropRate=10},
                {id=61256, dropRate=10},
                {id=61265, dropRate=10},
                {id=61257, dropRate=10},
                {id=61275, dropRate=10},
                {},
                {id=61674, dropRate=70, disc=L["Reagent"]},
                {},
                {id=61277, dropRate=10},
                {id=61264, dropRate=10},
                {id=61299, dropRate=10},
                {id=61454, dropRate=10},
                {id=61453, dropRate=10},
                {},
                {id=61231, dropRate=100},
                unpack(lKarazhanShare),
            }
        },
        {
            id = "LKHTrash",
            name = L["Trash Mobs"].."-"..BZ["Lower Karazhan Halls"],
            defaults = { dropRate = .15 },
            loot = {
                {id=51326, dropRate=.3, container={61666}},
                {},
                {id=61254},
                {id=61288},
                {id=61280},
                {id=61290},
                {},
                {id=61295},
                {id=61452},
                {},
                {id=92002, dropRate=.32, disc=L["Book"]..", "..BF["Alliance"]},
                {id=92004, dropRate=.32, disc=L["Book"]..", "..BF["Horde"]},
                {},
                {id=37006},
                {},
                {id=8547, dropRate=.03,container={8546}},
                {id=61177, dropRate=.03,container={61181}},
                {id=61178, dropRate=.03,container={61182}},
                {id=61180, dropRate=.03},
            }
        },
        {
            id = "LKHEnchants",
            name = L["Lower Karazhan Halls Enchants"],
            defaults = { dropRate = 0 },
            loot = {
                {id=92005, disc=L["Head"]..", "..L["Legs"]..L["Enchant"]},
                {id=92006, disc=L["Head"]..", "..L["Legs"]..L["Enchant"]},
                {id=92007, disc=L["Head"]..", "..L["Legs"]..L["Enchant"]},
                {id=92008, disc=L["Head"]..", "..L["Legs"]..L["Enchant"]},
            }
        }
    }
}
-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.LowerKarazhan.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end