-- Zul_Gurub.lua - Данные предметов из Зул'Гуруба
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2a")
AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Общий лут для боссов Зул'Гуруба
local zGSharedLoot = {
    {id=22713, dropRate=10},
    {},
    {id=22721, dropRate=10},
    {id=22722, dropRate=10},
    {id=22720, dropRate=10},
    {id=22718, dropRate=10},
    {id=22711, dropRate=10},
    {id=22712, dropRate=10},
    {id=22715, dropRate=10},
    {id=22714, dropRate=10},
    {id=22716, dropRate=10},
    {},
    {id=19721,dropRate=11,container={19826,19832,19845}},
    {id=19724,dropRate=11,container={19841,19834,19831}},
    {id=19723,dropRate=11,container={20033,20034,19822}},
    {id=19722,dropRate=11,container={19828,19825,19838}},
    {id=19717,dropRate=11,container={19830,19836,19824}},
    {id=19716,dropRate=11,container={19827,19846,19833}},
    {id=19718,dropRate=11,container={19843,19848,19840}},
    {id=19719,dropRate=11,container={19829,19835,19823}},
    {id=19720,dropRate=11,container={19842,19849,19839}},
}

local zGEnchants = {
	{id=19789, disc=L["Head"]..", "..L["Legs"]},
	{id=19787, disc=L["Head"]..", "..L["Legs"]},
	{id=19788, disc=L["Head"]..", "..L["Legs"]},
	{id=19784, disc=L["Head"]..", "..L["Legs"]},
	{id=19790, disc=L["Head"]..", "..L["Legs"]},
	{id=19785, disc=L["Head"]..", "..L["Legs"]},
	{id=19786, disc=L["Head"]..", "..L["Legs"]},
	{id=19783, disc=L["Head"]..", "..L["Legs"]},
	{id=19782, disc=L["Head"]..", "..L["Legs"]},
	{id=22635, disc=L["Head"]..", "..L["Legs"]},
	{},
	{id=20077, disc=L["Shoulder"]},
	{id=20076, disc=L["Shoulder"]},
	{id=20078, disc=L["Shoulder"]},
	{id=65033, disc=L["Shoulder"]},
}
local zGidol = {
	{id=22637, dropRate=100, container={19789, 19787, 19788, 19784, 19790, 19785, 19786, 19783, 19782}},
}
-- Данные Зул'Гуруба
AtlasTW.InstanceData.ZulGurub = {
    Name = BZ["Zul'Gurub"],
    Location = BZ["Stranglethorn Vale"],
    Level = {51,60},
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
		{ name = L["Gurubashi Mojo Madness"],loot = "VanillaKeys",info = L["Edge of Madness"] },
		{ name = L["Mudskunk Lure"],loot = "VanillaKeys",info = BB["Gahz'ranka"] },
	},
    Bosses = {
        {
            id = "HighPriestessJeklik",
            prefix = "1)",
            name = BB["High Priestess Jeklik"],
			postfix = L["Bat"],
            defaults = { dropRate = 14 },
            loot = {
                {id=19923},
                {id=19928},
                {id=20262},
                {id=20265},
                {id=19920},
                {id=19881,dropRate=100},
                {},
                {id=19915},
                {id=19918},
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
                {id=19904},
                {id=19907},
                {id=19906},
                {id=19905},
                {},
                {id=19881,dropRate=100},
                {},
                {id=19900},
                {id=19903},
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
                {id=20032},
                {id=19871},
                {id=19919},
                {id=19925},
                {id=19930},
                {id=19881,dropRate=100},
                {},
                {id=81003, dropRate=10},
                {id=19927},
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
                {id=19878},
                {id=19870},
                {id=19869},
                {id=19895},
                {id=19877},
                {},
                {id=19873},
                {id=19863},
                {id=19893},
                {},
                {id=20038},
                {id=19867},
                {id=19866},
                {id=19874},
                {},
				unpack(zGidol),
                {},
                {},
                {id=19872, dropRate=2},
                {},
                {id=19721,dropRate=11,container={19826,19832,19845}},
                {id=19724,dropRate=11,container={19841,19834,19831}},
                {id=19723,dropRate=11,container={20033,20034,19822}},
                {id=19722,dropRate=11,container={19828,19825,19838}},
                {id=19717,dropRate=11,container={19830,19836,19824}},
                {id=19716,dropRate=11,container={19827,19846,19833}},
                {id=19718,dropRate=11,container={19843,19848,19840}},
                {id=19719,dropRate=11,container={19829,19835,19823}},
                {id=19720,dropRate=11,container={19842,19849,19839}},
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
                {id=19961},
                {id=19962},
                {},
                {id=19939, disc=L["Quest Item"], dropRate=100, container={19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952}},
            }
        },
        {
            id = "Hazzarah",
            name = BB["Hazza'rah"],
			postfix = L["Random"],
            loot = {
                {id=19967, dropRate=45},
                {id=19968, dropRate=40},
                {},
                {id=19942, disc=L["Quest Item"], dropRate=100, container={19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952}},
            }
        },
        {
            id = "Renataki",
            name = BB["Renataki"],
			postfix = L["Random"],
            loot = {
                {id=19964, dropRate=40},
                {id=19963, dropRate=45},
                {},
                {id=19940, disc=L["Quest Item"], dropRate=100, container={19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952}},
            }
        },
        {
            id = "Wushoolay",
            name = BB["Wushoolay"],
			postfix = L["Random"],
            loot = {
                {id=19993, dropRate=45},
                {id=19965, dropRate=40},
                {},
                {id=19941, disc=L["Quest Item"], dropRate=100, container={19959, 19957, 19958, 19954, 19955, 19953, 19956, 19951, 19952}},
            }
        },
        {
            id = "Gahzranka",
            prefix = "7)",
            name = BB["Gahz'ranka"],
			postfix = L["Optional"],
            defaults = { dropRate = 25 },
            loot = {
                {id=19945},
                {},
                {id=19947},
                {},
                {id=19944},
                {id=19946},
                {},
                {id=22739, dropRate=15},
                {},
                {id=56084, dropRate=100, disc=L["Used to summon boss"]},
                {},
                {id=17962, disc=L["Container"], dropRate=20, container={13926,7971,3864,55251,55250,7910,7909,1529,12361}}, -- Blue Sack of Gems
                {id=17963, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12364}}, -- Green Sack of Gems
                {id=17964, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12800}}, -- Gray Sack of Gems
                {id=17965, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12363}}, -- Yellow Sack of Gems
                {id=17969, disc=L["Container"], dropRate=20, container={13926,7971,55250,7909,3864,55251,7910,1529,12799,6332}}, -- Red Sack of Gems
            }
        },
        {
            id = "HighPriestThekal",
            prefix = "8)",
            name = BB["High Priest Thekal"],
			postfix = L["Tiger"],
            defaults = { dropRate = 14 },
            loot = {
                {id=19897},
                {id=19899},
                {id=20260},
                {id=20266},
                {id=19898},
                {id=19881,dropRate=100},
                {id=19902, dropRate=2},
                {id=19901},
                {id=19896},
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
                {id=19913},
                {id=19912},
                {},
                {id=19914,disc=L["Bag"], dropRate=12},
                {id=19881,dropRate=100},
                {},
                {id=19922},
                {id=19909},
                {id=19910},
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
                {id=19885},
                {id=19886},
                {id=19875},
                {id=19888},
                {id=19929},
                {id=19894},
                {id=19889},
                {id=19887},
                {id=19892},
                {},
                {id=19891},
                {id=19890},
                {id=19884},
                {},
				unpack(zGidol),
                {id=19721,dropRate=11,container={19826,19832,19845}},
                {id=19724,dropRate=11,container={19841,19834,19831}},
                {id=19723,dropRate=11,container={20033,20034,19822}},
                {id=19722,dropRate=11,container={19828,19825,19838}},
                {id=19717,dropRate=11,container={19830,19836,19824}},
                {id=19716,dropRate=11,container={19827,19846,19833}},
                {id=19718,dropRate=11,container={19843,19848,19840}},
                {id=19719,dropRate=11,container={19829,19835,19823}},
                {id=19720,dropRate=11,container={19842,19849,19839}},
            }
        },
        {
            id = "Hakkar",
            prefix = "11)",
            name = BB["Hakkar"],
            defaults = { dropRate = 14 },
            loot = {
                {id=19876},
                {id=19856},
                {id=19857},
                {id=20257},
                {id=20264},
                {id=19855},
                {},
                {id=19861},
                {id=19853},
                {id=19862},
                {id=19864},
                {id=19865},
                {id=19852},
                {id=19859},
                {id=19854},
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                {id=19802, dropRate=100,container={19950, 19949, 19948}},
            }
        },
		{
			prefix = "1')",
			name = L["Muddy Churning Waters"],
			color = "|cff00ff00",
			loot = {
				{id=19975, disc = L["Used to summon boss"]},
			},
		},
		{
			prefix = "2')",
			name = L["Jinxed Hoodoo Pile"],
			color = "|cff00ff00",
			defaults = { dropRate = 11},
			loot = {
				{id=19727, disc = L["Unique"], dropRate = 26},
				{},
				{id=19813, disc = L["Doll"]},
				{id=19814, disc = L["Doll"]},
				{id=19815, disc = L["Doll"]},
				{id=19816, disc = L["Doll"]},
				{id=19817, disc = L["Doll"]},
				{id=19818, disc = L["Doll"]},
				{id=19819, disc = L["Doll"]},
				{id=19820, disc = L["Doll"]},
				{id=19821, disc = L["Doll"]},
			},
		},
        {
            id = "ZGTrash",
            name = L["Trash Mobs"].."-"..BZ["Zul'Gurub"],
            defaults = { dropRate = .03 },
            loot = {
                {id=20263},
                {id=20259},
                {id=20261},
                {},
                {id=19921},
                {id=19908},
                {id=20258},
                {},
                {id=19727, disc = L["Unique"]},
                {},
                {id=19726, disc = L["Trade Goods"], dropRate=1},
                {id=19774, disc = L["Trade Goods"], dropRate=0.05},
                {},
                {id=19767, disc = L["Trade Goods"], dropRate=10},
                {id=19768, disc = L["Trade Goods"], dropRate=20},
                {id=19820},
                {id=19818},
                {id=19819},
                {id=19814},
                {id=19821},
                {id=19816},
                {id=19817},
                {id=19815},
                {id=19813},
            }
        },
        { name = L["Zul'Gurub Sets"], items = "AtlasLootZGSetMenu" },
        { name = L["Zul'Gurub Enchants"], items = zGEnchants },
    }
}

 -- Инициализация предметов для всех боссов
 for _, bossData in ipairs(AtlasTW.InstanceData.ZulGurub.Bosses) do
     bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
     bossData.loot = nil -- Очищаем временные данные
 end