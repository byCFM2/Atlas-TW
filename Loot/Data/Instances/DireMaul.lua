-- DireMaul.lua - Данные предметов из Dire Maul
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local ShareLoot = {
    {id=18356, container={18465}, dropRate=".2-10"},
    {id=18357, container={18466}, dropRate=".2-10"},
    {id=18358, container={18468}, dropRate=".2-10"},
    {id=18359, container={18472}, dropRate=".2-10"},
    {id=18360, container={18467}, dropRate=".2-10"},
    {id=18361, container={18473}, dropRate=".2-10"},
    {id=18362, container={18469}, dropRate=".2-10"},
    {id=18363, container={18471}, dropRate=".2-10"},
    {id=18364, container={18470}, dropRate=".2-10"},
    {},
    {id=18401, container={18348}, dropRate=".2-10"},
}

-- Данные Dire Maul East
AtlasTW.InstanceData.DireMaulEast = {
    Name = BZ["Dire Maul"] .. " (" .. L["East"] .. ")",
    Location = BZ["Feralas"],
    Level = {50,58},
    Acronym = "DME",
    MaxPlayers = 5,
    DamageType = L["Nature"] .. ", " .. L["Arcane"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Back Entrance"] },
        { letter = "C) " .. L["Lariss Pavilion"] },
        { letter = "D) " .. L["Exit"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = BB["Pusillin"],
            postfix = L["Chase Begins"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMEPusillin",
            prefix = "2)",
            name = BB["Pusillin"],
            postfix = L["Chase Ends"],
            defaults = { dropRate = 100 },
            loot = {
                {id=18267, container={18254}},
                {},
                {id=18249, disc="Key"},
                {},
                {id=18261},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=1},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=1},
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEZevrimThornhoof",
            prefix = "3)",
            name = BB["Zevrim Thornhoof"],
            defaults = { dropRate = 20 },
            loot = {
                {id=18319},
                {id=18313},
                {id=18323},
                {},
                {id=18308},
                {id=18306},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=1},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=1},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEHydro",
            name = BB["Hydrospawn"],
            defaults = { dropRate = 20 },
            loot = {
                {id=18317},
                {id=18322},
                {id=18324},
                {},
                {id=19268, dropRate=2, container={19289}},
                {},
                {id=18305},
                {id=18307},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=1},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=1},
                {},
                {id=18299, dropRate=100},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMELethtendris",
            name = BB["Lethtendris"],
            defaults = { dropRate = 25 },
            loot = {
                {id=18325},
                {id=18311},
                {},
                {id=18301},
                {id=18302},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=1},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=1},
                {},
                {id=18426, dropRate=100},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEPimgib",
            name = BB["Pimgib"],
            loot = {
                {id=18354, dropRate = 14},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=1},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=1},
                {},
                unpack(ShareLoot),
            }
        },
        {
            prefix = "4)",
            name = L["Old Ironbark"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMEAlzzin",
            prefix = "5)",
            name = BB["Alzzin the Wildshaper"],
            defaults = { dropRate = 10 },
            loot = {
                {id=18328},
                {id=18312},
                {id=18309},
                {id=18326},
                {id=18327},
                {id=18318},
                {id=18321},
                {id=18310},
                {id=18314},
                {id=18315},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=1},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=1},
                {},
                {id=83574, disc=L["Book"]},
                {id=70226, disc=L["Quest Item"],dropRate=3,container={70227,70228,70229,70230,70231,70232,70233,
                    70234,70235,70236,70238}},
                {id=41700,dropRate=100,container={41704}},
                {id=51217, disc=L["Transmogrification"], dropRate=100},
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMEIsalien",
            name = BB["Isalien"],
            postfix = L["Summon"],
            defaults = { dropRate = 17 },
            loot = {
                {id=22304},
                {id=22472},
                {id=22401},
                {id=22345},
                {id=22315},
                {id=22314},
                {},
                {id=21984,dropRate=100,container={22057}},
                {id=22046,dropRate=100,container={22057}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "DMETrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .5 },
            loot = {
                {id=18289},
                {id=18296, dropRate=.75},
                {id=18298, dropRate=.75},
                {id=18295, dropRate=.58},
                {},
                {id=18255, disc=L["Consumable"], dropRate=.3},
                {id=18297},
            }
        },
        {
            id = "DMEShard",
            name = L["Felvine Shard"],
            loot = {
                {id=18501, disc=L["Quest Item"]},
            }
        },
        {
            id = "DMTome",
            prefix = "1')",
            name = L["A Dusty Tome"],
            postfix = L["Varies"],
            color = "|cff66cc33",
            loot = ShareLoot,
        },
        { name = BIS["Ironweave Battlesuit"], items = "Ironweave" },
    }
}

-- Данные Dire Maul West
AtlasTW.InstanceData.DireMaulWest = {
    Name = BZ["Dire Maul"] .. " (" .. L["West"] .. ")",
    Location = BZ["Feralas"],
    Level = {50,60},
    Acronym = "DMW",
    MaxPlayers = 5,
    DamageType = L["Nature"] .. ", " .. L["Arcane"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Pylons"] },
        { letter = "C) " .. BZ["Dire Maul"] .. " (" .. L["North"] .. ")" }
    },
    Keys = {
        { name = L["Crescent Key"], loot = "VanillaKeys" },
        { name = L["J'eevee's Jar"], loot = "VanillaKeys", info = BB["Lord Hel'nurath"] }
    },
    Bosses = {
        {
            prefix = "1)",
            name = L["Shen'dralar Ancient"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWTendrisWarpwood",
            prefix = "2)",
            name = BB["Tendris Warpwood"],
            defaults = { dropRate = 25 },
            loot = {
                {id=18393},
                {id=18390},
                {},
                {id=18352},
                {id=18353},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot),
            }
        },
        {
            name = L["Ancient Equine Spirit"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWIllyannaRavenoak",
            prefix = "3)",
            name = BB["Illyanna Ravenoak"],
            defaults = { dropRate = 25 },
            loot = {
                {id=18383},
                {id=18386},
                {},
                {id=18349},
                {id=18347},
                {},
                {id=55580, disc=L["Book"]},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=41457,dropRate=100},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot),
            }
        },
        {
            name = L["Ferra"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWMagisterKalendris",
            prefix = "4)",
            name = BB["Magister Kalendris"],
            defaults = { dropRate = 20 },
            loot = {
                {id=18374},
                {id=18397},
                {id=18371},
                {},
                {id=18350},
                {id=18351},
                {},
                {id=22309, dropRate=15, container={22249}},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot),
            }
        },
        {
            id = "DMWTsuzee",
            prefix = "5)",
            name = BB["Tsu'zee"],
            defaults = { dropRate = 33 },
            loot = {
                {id=18387},
                {},
                {id=18346},
                {id=18345},
            }
        },
        {
            id = "DMWImmolthar",
            prefix = "6)",
            name = BB["Immol'thar"],
            defaults = { dropRate = 10 },
            loot = {
                {id=18381},
                {id=18384},
                {id=18389},
                {id=18385},
                {id=18394},
                {id=18377},
                {id=18391},
                {id=18379},
                {id=18370},
                {id=18372},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=41700,dropRate=100,container={41704}},
                {id=61232,dropRate=100,container={61234}},
                {id=60332,dropRate=100,container={60333,60334}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "DMWHelnurath",
            name = BB["Lord Hel'nurath"],
            postfix = L["Rare"] .. ", " .. L["Summon"],
            defaults = { dropRate = 25 },
            loot = {
                {id=18757},
                {id=18754},
                {id=18755},
                {id=18756},
            }
        },
        {
            id = "DMWPrinceTortheldrin",
            prefix = "7)",
            name = BB["Prince Tortheldrin"],
            defaults = { dropRate = 10 },
            loot = {
                {id=18382},
                {id=18373},
                {id=18375},
                {id=18378},
                {id=18380},
                {id=18395},
                {id=18388},
                {id=18396},
                {id=18376},
                {id=18392},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=3},
                {id=41700,dropRate=100,container={41704}},
                {id=61232,dropRate=100,container={61234}},
                {id=60332,dropRate=100,container={60333,60334}},
                {id=61461,dropRate=100,container={61465}},
                {id=51217, disc=L["Transmogrification"], dropRate=100},
            }
        },
        {
            name = L["The Prince's Chest"],
            color = "|cff9d9d9d",
        },
        {
            id = "DMWRevanchion",
            prefix = "8)",
            name = BB["Revanchion"],
            postfix = L["Scourge Invasion"],
            defaults = { dropRate = 33 },
            loot = {
                {id=23127},
                {id=23129},
                {id=23128},
            }
        },
        {
            id = "DMWTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 1.4 },
            loot = {
                {id=18340, dropRate=1.4},
                {id=18344, dropRate=0.66},
                {id=18338, dropRate=2},
                {id=61673,disc=L["Reagent"], dropRate=3},
            }
        },
        {
            prefix = "1')",
            name = L["Library"],
            color = "|cff66cc33",
        },
        {
            name = L["Falrin Treeshaper"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Lydros"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Javon"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Kildrath"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Mykos"],
            color = "|cff66cc33",
        },
        {
            id = "DMWShendralarProvisioner",
            name = L["Shen'dralar Provisioner"],
            color = "|cff66cc33",
            loot = {
                {id=18487, disc=L["Vendor"], container={18486}},
            }
        },
        {
            name = L["Skeletal Remains of Kariel Winthalus"],
            color = "|cff66cc33",
        },
        {
            id = "DMTome",
            prefix = "2')",
            name = L["A Dusty Tome"],
            postfix = L["Varies"],
            loot = ShareLoot,
        },
    }
}

-- Данные Dire Maul North
AtlasTW.InstanceData.DireMaulNorth = {
    Name = BZ["Dire Maul"] .. " (" .. L["North"] .. ")",
    Location = BZ["Feralas"],
    Level = {57,60},
    Acronym = "DMN",
    MaxPlayers = 5,
    DamageType = L["Physical"] .. ", " .. L["Nature"],
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. L["Library"] },
        { letter = "C) " .. BZ["Dire Maul"] .. " (" .. L["West"] .. ")" }
    },
    Keys = {
        { name = L["Crescent Key"], loot = "VanillaKeys" },
        { name = L["Gordok Courtyard Key"], loot = "VanillaKeys" },
        { name = L["Gordok Inner Door Key"], loot = "VanillaKeys" }
    },
    Bosses = {
        {
            id = "DMNGuardMoldar",
            prefix = "1)",
            name = BB["Guard Mol'dar"],
            defaults = { dropRate = 8 },
            loot = {
                {id=18494},
                {id=18493},
                {id=18496},
                {id=18497},
                {id=18498},
                {},
                {id=18450},
                {id=18458},
                {id=18459},
                {id=18451},
                {id=18462},
                {id=18463},
                {id=18464},
                {id=18460},
                {},
                {id=18250, disc=L["Key"], dropRate=13},
                {id=18268, disc=L["Key"], dropRate=100},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=21982,dropRate=50,container={22149,22150}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "DMNStomperKreeg",
            prefix = "2)",
            name = BB["Stomper Kreeg"],
            loot = {
                {id=18425, dropRate=40},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=21982,dropRate=50,count={2,3},container={22149,22150}},
                {},
                {id=18269, disc=L["Vendor"]},
                {id=18284, disc=L["Vendor"]},
                {id=18287, disc=L["Vendor"]},
                {id=18288, disc=L["Vendor"]},
                {id=9260, disc=L["Vendor"]},
            }
        },
        {
            id = "DMNGuardFengus",
            prefix = "3)",
            name = BB["Guard Fengus"],
            defaults = { dropRate = 13 },
            loot = {
                {id=18450},
                {id=18458},
                {id=18459},
                {id=18451},
                {id=18462},
                {id=18463},
                {id=18464},
                {id=18460},
                {},
                {id=18250, disc=L["Key"]},
                {id=18266, disc=L["Key"], dropRate=1.2},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNThimblejack",
            prefix = "4)",
            name = L["Knot Thimblejack"],
            postfix = L["Cache"],
            loot = {
                {id=18414, dropRate=2, container={18405}},
                {id=18517, dropRate=2, container={18509}},
                {id=18518, dropRate=2, container={18510}},
                {id=18519, dropRate=2, container={18511}},
                {},
                {id=18415, dropRate=13, container={18407}},
                {id=18416, dropRate=13, container={18408}},
                {id=18417, dropRate=13, container={18409}},
                {id=18418, dropRate=13, container={18413}},
                {id=18514, dropRate=13, container={18504}},
                {id=18515, dropRate=13, container={18506}},
                {id=18516, dropRate=13, container={18508}},
                {},
                {id=18240, dropRate=35, container={18258}},
            }
        },
        {
            id = "DMNGuardSlipkik",
            name = BB["Guard Slip'kik"],
            defaults = { dropRate = 8 },
            loot = {
                {id=18494},
                {id=18493},
                {id=18496},
                {id=18497},
                {id=18498},
                {},
                {id=18450},
                {id=18458},
                {id=18459},
                {id=18451},
                {id=18462},
                {id=18463},
                {id=18464},
                {id=18460},
                {},
                {id=18250, disc=L["Key"], dropRate=13},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=21982,dropRate=50,count={2,3},container={22149,22150}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNCaptainKromcrush",
            prefix = "5)",
            name = BB["Captain Kromcrush"],
            defaults = { dropRate = 25 },
            loot = {
                {id=18503},
                {id=18505},
                {id=18507},
                {id=18502},
                {},
                {id=18250, disc=L["Key"], dropRate=13},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNKingGordok",
            prefix = "6)",
            name = BB["King Gordok"],
            defaults = { dropRate = 13 },
            loot = {
                {id=18526},
                {id=18525},
                {id=18527},
                {id=18524},
                {id=18521},
                {id=18522},
                {id=18523},
                {id=18520},
                {},
                {id=19258, dropRate=7,container={19287}},
                {id=18780, dropRate=9, container={18769}},
                {id=12727,container={12618},dropRate=0},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=70226, disc=L["Quest Item"],dropRate=3,container={70227,70228,70229,70230,70231,70232,70233,
                    70234,70235,70236,70238}},
                {id=41700,dropRate=100,container={41704}},
                {id=21982,dropRate=50,count={2,3},container={22149,22150}},
                {id=51217, disc=L["Transmogrification"], dropRate=100},
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNChoRush",
            name = BB["Cho'Rush the Observer"],
            defaults = { dropRate = 25 },
            loot = {
                {id=18490},
                {id=18483},
                {id=18485},
                {id=18484},
                {},
                {id=18332, disc=L["Quest Item"], container={18329}, dropRate=2},
                {id=18333, disc=L["Quest Item"], container={18330}, dropRate=2},
                {id=18334, disc=L["Quest Item"], container={18331}, dropRate=2},
                {id=21982,dropRate=50,count={2,3},container={22149,22150}},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
                {},
                unpack(ShareLoot)
            }
        },
        {
            id = "DMNTributeRun",
            name = L["Tribute Run"],
            defaults = { dropRate = 11 },
            loot = {
                {id=18538, dropRate=1},
                {},
                {id=18528, dropRate=33},
                {id=18495, dropRate=25},
                {id=18532, dropRate=23},
                {id=18530, dropRate=23},
                {id=18533, dropRate=25},
                {id=18529, dropRate=33},
                {id=18500, dropRate=33},
                {id=18537, dropRate=25},
                {id=18499, dropRate=23},
                {id=18531, dropRate=23},
                {id=18534, dropRate=25},
                {},
                {id=18479},
                {id=18480},
                {id=18478},
                {id=18475},
                {id=18477},
                {id=18476},
                {id=18482},
                {id=18481},
                {id=18655, container={18637}},
            }
        },
        {
            id = "DMNTrash",
            name = L["Trash Mobs"],
            loot = {
                {id=18250,disc=L["Key"], dropRate=4},
                {id=18640, dropRate=2},
            }
        },
        {
            prefix = "1')",
            name = L["Library"],
            color = "|cff66cc33",
        },
        {
            name = L["Falrin Treeshaper"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Lydros"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Javon"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Kildrath"],
            color = "|cff66cc33",
        },
        {
            name = L["Lorekeeper Mykos"],
            color = "|cff66cc33",
        },
        {
            id = "DMWShendralarProvisioner",
            name = L["Shen'dralar Provisioner"],
            color = "|cff66cc33",
            loot = {
                {id=18487, disc=L["Vendor"], container={18486}},
            }
        },
        {
            name = L["Skeletal Remains of Kariel Winthalus"],
            color = "|cff66cc33",
        },
        {
            id = "DMTome",
            prefix = "2')",
            name = L["A Dusty Tome"],
            postfix = L["Varies"],
            loot = ShareLoot,
        },
    }
}

-- Данные Dire Maul Entrance
AtlasTW.InstanceData.DireMaulEnt = {
    Name = BZ["Dire Maul"] .. " (" .. L["Entrance"] .. ")",
    Location = BZ["Feralas"],
    Acronym = "DM",
    Entrances = {
        { letter = "A) " .. L["Main Entrance"] },
        { letter = "B) " .. BZ["Dire Maul"] .. " (" .. L["East"] .. ")" },
        { letter = "C) " .. BZ["Dire Maul"] .. " (" .. L["North"] .. ")" },
        { letter = "D) " .. BZ["Dire Maul"] .. " (" .. L["West"] .. ")" }
    },
    Bosses = {
        {
            prefix = "1)",
            name = L["Dire Pool"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name = L["Dire Maul Arena"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Mushgog"],
            postfix = L["Rare"] .. ", " .. L["Random"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Skarr the Unbreakable"],
            postfix = L["Rare"] .. ", " .. L["Random"],
            color = "|cff9d9d9d",
        },
        {
            name = L["The Razza"],
            postfix = L["Rare"] .. ", " .. L["Random"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Elder Mistwalker"],
            postfix = L["Lunar Festival"],
            color = "|cff9d9d9d",
            Items = "LunarFestival",
        },
        {
            prefix = "3)",
            name = L["Griniblix the Spectator"],
            color = "|cff9d9d9d",
        },
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulEast.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulWest.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulNorth.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

for _, bossData in ipairs(AtlasTW.InstanceData.DireMaulEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end