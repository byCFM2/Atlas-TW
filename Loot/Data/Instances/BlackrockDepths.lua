-- BlackrockDepths.lua - Данные предметов из Blackrock Depths
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Blackrock Depths
AtlasTW.InstanceData.BlackrockDepths = {
    Name = BZ["Blackrock Depths"],
    Location = BZ["Blackrock Mountain"],
    Level = {42,60},
    Acronym = "BRD",
    MaxPlayers = 10,
    Keys = {
        { name = L["Shadowforge Key"], loot = "VanillaKeys" },
        { name = L["Prison Cell Key"], loot = "VanillaKeys" },
        { name = L["Banner of Provocation"], loot = "VanillaKeys", info = L["Tier 0.5 Summon"] },
    },
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Bosses = {
        {
            id = "BRDLordRoccor",
            prefix = "1)",
            name = L["Lord Roccor"],
            defaults = { dropRate = 25 },
            loot = {
                {id=22234},
                {id=11632},
                {id=11631},
                {id=22397},
                {},
                {id=11630, dropRate=16},
                {},
                {id=11813, dropRate=15, container={11811}},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=11129, quantity={2,3},dropRate=80,container={12038}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            prefix = "2)",
            name = L["Kharan Mighthammer"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "3)",
            name = L["Commander Gor'shak"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "3)",
            name = L["Marshal Windsor"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDHighInterrogatorGerstahn",
            prefix = "5)",
            name = L["High Interrogator Gerstahn"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11626},
                {id=11624},
                {id=22240},
                {id=11625},
                {},
                {id=11140, disc=L["Key"], dropRate=100},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            prefix = "6)",
            name = L["Ring of Law"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDAnubshiah",
            name = L["Anub'shiah"],
            defaults = { dropRate = 33 },
            loot = {
                {id=11678, dropRate=15},
                {},
                {id=11677},
                {id=11675},
                {id=11731},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDEviscerator",
            name = L["Eviscerator"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11685},
                {id=11679},
                {id=11730},
                {id=11686},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDGorosh",
            name = L["Gorosh the Dervish"],
            loot = {
                {id=11726, dropRate=15},
                {id=22271, dropRate=30},
                {id=22257, dropRate=30},
                {id=22266, dropRate=25},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDGrizzle",
            name = L["Grizzle"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11722},
                {id=11703},
                {id=22270},
                {id=11702},
                {},
                {id=11610, dropRate=100,container={11608}},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDHedrum",
            name = L["Hedrum the Creeper"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11729},
                {id=11633},
                {id=11634},
                {id=11635},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDOkthor",
            name = L["Ok'thor the Breaker"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11665},
                {id=11662},
                {id=11728},
                {id=11824},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDTheldren",
            name = L["Theldren"],
            postfix = L["Summon"],
            loot = {
                {id=22305, dropRate=38},
                {id=22330, dropRate=19},
                {id=22318, dropRate=26},
                {id=22317, dropRate=17},
                {},
                {id=22047, dropRate=17,container={22057}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            name = L["Lefty"],
            postfix = BC["Rogue"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Malgen Longspear"],
            postfix = BC["Hunter"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Gnashjaw"],
            postfix = L["Pet"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Korv"],
            postfix = BC["Shaman"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Rezznik"],
            postfix = L["Engineer"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Rotfang"],
            postfix = BC["Rogue"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Snokh Blackspine"],
            postfix = BC["Mage"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Va'jashni"],
            postfix = BC["Priest"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Volida"],
            postfix = BC["Mage"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDHoundmaster",
            name = L["Houndmaster Grebmar"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11623},
                {id=11627},
                {id=11628},
                {id=11629},
                {},
                {id=41455, dropRate=100},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=61791, dropRate=.25,container={61784}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            name = L["Elder Morndeep"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            name = L["High Justice Grimstone"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDForgewright",
            prefix = "7)",
            name = L["Monument of Franclorn Forgewright"],
            loot = {
                {id=11000, disc=L["Key"]},
            }
        },
        {
            id = "BRDPyromancerLoregrain",
            name = L["Pyromancer Loregrain"],
            postfix = L["Rare"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11747},
                {id=11749},
                {id=11748},
                {id=11750},
                {},
                {id=11207, dropRate=16},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=61791, dropRate=.25,container={61784}},
            }
        },
        {
            id = "BRDTheVault",
            prefix = "8)",
            name = L["The Vault"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11197, disc=L["Key"], dropRate=100},
                {},
                {},
                {id=22256},
                {id=22205},
                {id=22255},
                {id=22254},
                {},
                {id=11945, dropRate=.5},
                {id=11946, dropRate=.4},
                {},
                {id=11752, disc = L["Quest Item"], dropRate=100, container={11644}},
                {id=11751, disc = L["Quest Item"], dropRate=100, container={11622}},
                {id=11753, disc = L["Quest Item"], dropRate=100, container={11643}},
            }
        },
        {
            id = "BRDWarderStilgiss",
            name = L["Warder Stilgiss"],
            postfix = L["Rare"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11782},
                {id=22241},
                {id=11783},
                {id=11784},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
            }
        },
        {
            id = "BRDVerek",
            name = L["Verek"],
            postfix = L["Rare"],
            defaults = { dropRate = 12.5 },
            loot = {
                {id=11755},
                {id=22242},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
            }
        },
        {
            name = BB["Watchman Doomgrip"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDFineousDarkvire",
            prefix = "9)",
            name = L["Fineous Darkvire"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11839},
                {id=22223},
                {id=11842},
                {id=11841},
                {},
                {id=11840, dropRate=5},
                {},
                {id=56098, disc=L["Quest Item"],dropRate=9,container={70175}},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=61791, dropRate=.25,container={61784}},
                {id=11468, quantity={3,5}, dropRate=80,container={11883}},
                {id=10999, dropRate=100,container={11000}},
                {id=41379, dropRate=100,container={70223}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDLordIncendius",
            prefix = "10)",
            name = L["Lord Incendius"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11766},
                {id=11764},
                {id=11765},
                {id=11767},
                {},
                {id=19268, dropRate=2, container={19289}},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=11129, quantity={1,3},dropRate=80,container={12038}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=11126, dropRate=100,container={12113,12112,12114,12115}},
                {id=21987, dropRate=100,container={22057}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDBaelGar",
            prefix = "11)",
            name = L["Bael'Gar"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11807},
                {id=11802},
                {id=11805},
                {id=11803},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            prefix = "12)",
            name = L["Shadowforge Lock"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDGeneralAngerforge",
            prefix = "13)",
            name = L["General Angerforge"],
            defaults = { dropRate = 20 },
            loot = {
                {id=11820},
                {id=11821},
                {id=11810},
                {id=11817},
                {id=11816},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=61791, dropRate=.25,container={61784}},
                {id=11468, quantity={3,10}, dropRate=80,container={11883}},
                {id=11464, dropRate=100,container={12061,12062,12065}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDGolemLordArgelmach",
            prefix = "14)",
            name = L["Golem Lord Argelmach"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11823},
                {id=11822},
                {id=11669},
                {id=11819},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=61791, dropRate=.25,container={61784}},
                {id=11468, quantity={5,8}, dropRate=80,container={11883}},
                {id=11465, dropRate=100,container={12061,12062,12065}},
                {id=11268, dropRate=100,container={12108,12109,12110,12111}},
                {id=60671, dropRate=100,container={60672}},
                {id=81281, dropRate=100,container={81250,81251,81252,81253}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            name = L["Field Repair Bot 74A"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Blacksmithing Plans"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDGuzzler",
            prefix = "15)",
            name = L["The Grim Guzzler"],
            color = "|cff9d9d9d"
        },
        {
            id = "BRDHurley",
            name = BB["Hurley Blackbreath"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11735},
                {id=18043},
                {id=22275},
                {id=18044},
                {},
                {id=61791, dropRate=.25,container={61784}},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {},
                {id=11468, dropRate=80,container={11883}},
                {id=11312, dropRate=100,container={12000,11964}},
                {id=41477, dropRate=100,container={41465}},
            },
        },
        {
            id = "BRDLokhtos",
            name = L["Lokhtos Darkbargainer"],
            postfix = L["Vendor"],
            loot = {
                {id=18592, disc=L["Quest"],container={17193}},
                {id=70178,container={56067}},
                {id=17051,container={17014}},
                {id=17060,container={17016}},
                {id=17052,container={17013}},
                {id=17059,container={17015}},
                {id=17049,container={16989}},
                {id=17053,container={16988}},
                {id=19209,container={19167}},
                {id=19211,container={19168}},
                {id=20040,container={20039}},
                {id=19207,container={19164}},
                {id=19210,container={19170}},
                {id=19212,container={19169}},
                {id=62004,container={65039}},
                {id=62005,container={65035}},
                {id=62007,container={65037}},
                {id=62003,container={65038}},
                {id=62006,container={65036}},
            },
        },
        {
            name = L["Mistress Nagmara"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDPhalanx",
            name = BB["Phalanx"],
            loot = {
                {id=22212, dropRate=33},
                {id=11745, dropRate=33},
                {},
                {id=11744, dropRate=33},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {},
                {id=61791, dropRate=.25,container={61784}},
            }
        },
        {
            id = "BRDPlugger",
            name = BB["Plugger Spazzring"],
            loot = {
                {id=12793, dropRate=18},
                {id=12791, dropRate=18},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=18653, dropRate=18, container={18587}},
                {},
                {id=13483, disc=L["Vendor"], container={7076}},
                {id=15759, disc=L["Vendor"], container={15050}},
                {},
                {id=11325, quantity={0,10}, disc=L["Vendor"]},
                {},
                {id=11602, dropRate=100, disc=L["Pickpocketed"]},
            },
        },
        {
            name = L["Private Rocknot"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDRibbly",
            name = BB["Ribbly Screwspigot"],
            defaults = { dropRate = 25 },
            loot = {
                {id=2662},
                {id=2663},
                {},
                {id=11612, container={11604}},
                {},
                {id=11742, disc=L["Bag"]},
                {},
                {id=11313, container={11865,11963,12049}},
            }
        },
        {
            id = "BRDFlamelash",
            prefix = "16)",
            name = L["Ambassador Flamelash"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11808, dropRate=2},
                {},
                {id=11812},
                {id=11814},
                {id=11832},
                {id=11809},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=11129, quantity={3,5},dropRate=80,container={12038}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDPanzor",
            prefix = "17)",
            name = L["Panzor the Invincible"],
            defaults = { dropRate = 25 },
            loot = {
                {id=22245},
                {id=11787},
                {id=11785},
                {id=11786},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=11129, quantity={3,5},dropRate=80,container={12038}},
            }
        },
        {
            name = L["Blacksmithing Plans"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Chest of The Seven"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDTomb",
            prefix = "18)",
            name = L["Summoner's Tomb"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11920},
                {id=11923},
                {id=11926},
                {id=11929},
                {},
                {id=11921},
                {id=11922},
                {id=11925},
                {id=11927},
            }
        },
        {
            id = "BRDLyceum",
            prefix = "19)",
            name = L["The Lyceum"],
            loot = {
                {id=11885, disc=L["Misc"], dropRate=94},
            }
        },
        {
            id = "BRDMagmus",
            prefix = "20)",
            name = L["Magmus"],
            defaults = { dropRate = 20 },
            loot = {
                {id=11746},
                {id=11935},
                {id=22395},
                {id=22400},
                {id=22208},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=61791, dropRate=.25,container={61784}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "BRDEmperorDagranThaurissan",
            prefix = "21)",
            name = L["Emperor Dagran Thaurissan"],
            defaults = { dropRate = 20 },
            loot = {
                {id=11684, dropRate=1},
                {},
                {id=11933},
                {id=11930},
                {id=22204},
                {id=11815},
                {id=11931},
                {},
                {id=11924},
                {id=22207},
                {id=11934},
                {id=11928},
                {id=11932},
                {},
                {id=12033, disc=L["Container"], dropRate=2, container={12364,1206,12800,5500,7971,
                    55249,12799,3864,1705,12361,55250,7909,55251,7910,1529}},
                {id=61463, dropRate=100,container={61465}},
                {id=11468, quantity={4,9}, dropRate=80,container={11883}},
                {id=56104, disc=BS["Gemology"], dropRate=30, container={56109}},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=70226, disc=L["Quest Item"],dropRate=3,container={70227,70228,70229,70230,70231,70232,70233,
                    70234,70235,70236,70238}},
                {id=61791, dropRate=.25,container={61784}},
                {id=51217, disc=L["Transmogrification"], dropRate=100},
            }
        },
        {
            id = "BRDPrincess",
            name = L["Princess Moira Bronzebeard"],
            defaults = { dropRate = 25 },
            loot = {
                {id=12557},
                {id=12554},
                {id=12556},
                {id=12553},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=11446, dropRate=25,container={12061,12062,12065}},
                {id=11468, dropRate=80,container={11883}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            prefix = "22)",
            name = L["The Black Forge"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "23)",
            name = BZ["Molten Core"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Core Fragment"],
            color = "|cff9d9d9d",
        },
        {
            id = "BRDPyron",
            prefix = "24)",
            name = L["Overmaster Pyron"],
            loot = {
                {id=14486, dropRate=18, container={14134}},
                {},
                {id=11446, dropRate=25,container={12061,12062,12065}},
            }
        },
        {
            id = "BRDBSPlans",
            prefix = "25)",
            name = L["Blacksmithing Plans"],
            loot = {
                {id=11614, dropRate=39, container={11606}},
                {id=11615, dropRate=18, container={11605}},
            }
        },
        {
            id = "BRDTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = "0.01-0.5" },
            loot = {
                {id=12549},
                {id=12552},
                {id=12551},
                {id=12542},
                {id=12546},
                {id=12550},
                {id=12547},
                {id=12555, dropRate=1},
                {id=12527},
                {id=12531},
                {id=12535},
                {id=12528},
                {id=12532},
                {},
                {},
                {id=15781, dropRate=4, container={15052}},
                {id=15770, dropRate=4, container={15051}},
                {id=11611, dropRate=9, container={11607}},
                {id=11614, container={11606}},
                {id=11615, container={11605}},
                {id=16048, dropRate=1.8, container={16004}},
                {id=16053, dropRate=0.7, container={16008}},
                {id=16049, dropRate=1, container={16005}},
                {id=18654, dropRate=2, container={18645}},
                {id=18661, dropRate=2, container={18660}},
                {},
                {id=18232},
                {},
                {id=11446,container={12061,12062,12065}},
            }
        },
        { name = BIS["The Gladiator"], items = "TheGladiator" },
        { name = BIS["Arms of Thaurissan"], items = "ArmsofThaurissan" },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.BlackrockDepths.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end