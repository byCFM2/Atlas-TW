-- Karazhan_Crypt.lua - Данные предметов из Склепа Каражана
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Склепа Каражана
AtlasTW.InstanceData.KarazhanCrypt = {
    Name = BZ["Karazhan Crypt"],
    Location = BZ["Deadwind Pass"],
    Level = {58,60},
    Acronym = "KC",
    Attunement = false,
    MaxPlayers = 5,
    DamageType = L["Shadow"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
    },
    Keys = {
        { name = L["Karazhan Crypt Key"], loot = "VanillaKeys", info = L["Required for entry"] },
    },
    Bosses = {
        {
            id = "KCMarrowspike",
            prefix = "1)",
            name = BB["Marrowspike"],
            defaults = { dropRate = 18 },
            loot = {
                {id=83441},
                {id=83442},
                {id=83443},
                {},
                {id=83444},
                {id=83445},
                {id=83440, dropRate=10},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Fashion Coin"], dropRate=5},
            }
        },
        {
            id = "KCHivaxxis",
            prefix = "2)",
            name = BB["Hivaxxis"],
            defaults = { dropRate = 18 },
            loot = {
                {id=83447},
                {id=83448},
                {id=83449},
                {id=83450},
                {id=83451},
                {},
                {id=83446, dropRate=10},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Fashion Coin"], dropRate=5},
            }
        },
        {
            id = "KCCorpsemuncher",
            prefix = "3)",
            name = BB["Corpsemuncher"],
            defaults = { dropRate = 15 },
            loot = {
                {id=70057},
                {id=83459},
                {id=83460},
                {id=83462},
                {id=83463},
                {id=83458, dropRate=10},
                {},
                {id=83461},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Fashion Coin"], dropRate=5},
            }
        },
        {
            id = "KCGuardCaptainGort",
            prefix = "4)",
            name = BB["Guard Captain Gort"],
            defaults = { dropRate = 17 },
            loot = {
                {id=60792},
                {id=60793},
                {id=60794},
                {id=60795},
                {id=60790},
                {id=60791},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Fashion Coin"], dropRate=5},
            }
        },
        {
            id = "KCArchlichEnkhraz",
            prefix = "5)",
            name = BB["Archlich Enkhraz"],
            defaults = { dropRate = 18 },
            loot = {
                {id=83454},
                {id=83455},
                {id=83456},
                {id=83457},
                {},
                {id=83452, dropRate=10},
                {id=83453},
                {},
                {id=80010, dropRate=5},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Fashion Coin"], dropRate=5},
            }
        },
        {
            id = "KCCommanderAndreon",
            prefix = "6)",
            name = BB["Commander Andreon"],
            defaults = { dropRate = 17 },
            loot = {
                {id=50188},
                {id=50189},
                {id=50190},
                {id=50191},
                {id=50192},
                {id=50193},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Fashion Coin"], dropRate=5},
            }
        },
        {
            id = "KCAlarus",
            prefix = "7)",
            name = BB["Alarus"],
            defaults = { dropRate = 25 },
            loot = {
                {id=83465},
                {id=83466},
                {id=83467},
                {id=83468},
                {},
                {id=83469, dropRate=21},
                {id=83470, dropRate=21},
                {id=83471, dropRate=21},
                {id=83472, dropRate=21},
                {},
                {id=83464, dropRate=1},
                {},
                {id=83571, disc=L["Book"], dropRate=15},
                {},
                {id=70226, disc=L["Quest Item"],dropRate=1},
                {id=51217, disc=L["Fashion Coin"], dropRate=100},
            }
        },
        {
            id = "KCTreasure",
            prefix = "8)",
            name = L["Half-Buried Treasure Chest"],
            loot = {
                {id=5823, disc=L["Consumable"], dropRate=100},
                {id=11938, disc=L["Container"], dropRate=100},
                {id=13456, disc=L["Consumable"], dropRate=100},
                {id=60799, dropRate=14},
                {},
                {id=60802, dropRate=14},
                {id=60796, dropRate=14},
                {id=60797, dropRate=14},
                {id=60798, dropRate=14},
                {},
                {id=60800, dropRate=14},
                {id=60801, dropRate=14},
            }
        },
        {
            id = "KCTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .01 },
            loot = {
                {id=60803},
                {id=60804},
                {id=60805},
                {id=60806},
                {id=60807},
                {id=60809},
                {id=18742, dropRate=0.02},
                {id=18743, dropRate=0.0935},
                {id=17061, dropRate=0.02},
                {id=18741, dropRate=0.02},
                {id=18744, dropRate=0.04},
                {id=18745, dropRate=0.06},
                {id=18736, dropRate=0.02},
                {id=18698, dropRate=0.6},
                {id=18699, dropRate=0.02},
                {id=14536, dropRate=0.06},
                {id=18700, dropRate=0.02},
                {id=18702, dropRate=0.02},
                {id=18697, dropRate=0.26},
                {id=18701, dropRate=0.06},
                {},
                {id=60808},
                {},
                {id=41416, dropRate=100},
            },
        }
    }
}
-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.KarazhanCrypt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end