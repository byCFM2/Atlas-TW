-- ZulFarrak Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.ZulFarrak = {
    Name = BZ["Zul'Farrak"],
    Location = BZ["Tanaris"],
    Level = {30,54},
    Acronym = "ZF",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },
    Keys = {
        { name = L["Mallet of Zul'Farrak"], loot = "VanillaKeys", info = BB["Gahz'rilla"] }
    },

    Bosses = {
        {
            id = "ZFAntusul",
            prefix = "1)",
            name = BB["Antu'sul"],
            defaults = { dropRate = 25 },
            loot = {
                {id=9640},
                {id=9641},
                {id=9639},
                {},
                {id=9379, container={9372}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "ZFThekatheMartyr",
            prefix = "2)",
            name = L["Theka the Martyr"],
            loot = {
                {id=10660, dropRate=100, container={10749,10750,10751}},
            }
        },
        {
            id = "ZFWitchDoctorZumrah",
            prefix = "3)",
            name = BB["Witch Doctor Zum'rah"],
            defaults = { dropRate = 50 },
            loot = {
                {id=18083},
                {id=18082},
                {},
                {id=51803, dropRate=8},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "ZFZulFarrakDeadHero",
            name = L["Zul'Farrak Dead Hero"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFNekrumGutchewer",
            prefix = "4)",
            name = L["Nekrum Gutchewer"],
            loot = {
                {id=9471, dropRate=100, container={9651,9652}},
            }
        },
        {
            id = "ZFSezzziz",
            name = BB["Shadowpriest Sezz'ziz"],
            defaults = { dropRate = 25 },
            loot = {
                {id=9470},
                {id=9473},
                {id=9474},
                {id=9475},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "ZFDustwraith",
            name = L["Dustwraith"],
            postfix = L["Rare"],
            loot = {
                {id=12471, dropRate=19},
            }
        },
        {
            id = "ZFSergeantBly",
            prefix = "5)",
            name = L["Sergeant Bly"],
            loot = {
                {id=8548, dropRate=100, container={9533,9534}},
            }
        },
        {
            id = "ZFWeegliBastfuse",
            name = L["Weegli Blastfuse"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFMurtaGrimgut",
            name = L["Murta Grimgut"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFRaven",
            name = L["Raven"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFOroEyegouge",
            name = L["Oro Eyegouge"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFSandfury",
            name = L["Sandfury Executioner"],
            loot = {
                {id=80747, dropRate=20},
            }
        },
        {
            id = "ZFChiefUkorzSandscalp",
            prefix = "6)",
            name = BB["Chief Ukorz Sandscalp"],
            defaults = { dropRate = 20 },
            loot = {
                {id=9479},
                {id=9476},
                {},
                {id=9477},
                {id=9478},
                {id=11086, container={9372}},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "ZFRuuzlu",
            name = L["Ruuzlu"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFElderWildmane",
            name = L["Elder Wildmane"],
            postfix = L["Lunar Festival"],
            items = "LunarFestival",
        },
        {
            id = "ZFHydromancerVelratha",
            prefix = "7)",
            name = L["Hydromancer Velratha"],
            loot = {
                {id=9234, dropRate=100, container={9527, 9531}},
                {id=10661, dropRate=100, container={10749,10750,10751}},
            }
        },
        {
            id = "ZFGahzrilla",
            name = BB["Gahz'rilla"],
            postfix = L["Summon"],
            loot = {
                {id=9469, dropRate=50},
                {id=9467, dropRate=30},
                {id=80747, dropRate=20},
                {},
                {id=8707, dropRate=100, container={11122}},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "ZFZeljebTheAncient",
            prefix = "8)",
            name = BB["Zel'jeb the Ancient"],
            defaults = { dropRate = 25 },
            loot = {
                { id=58116 }, --Bloodstained Fangblade
                { id=58117 }, --Staff of the Bloodbound
                { id=58118 }, --Sash of Ritual Scars
                { id=58119 }, --Bracers of the Bloodbound

            }
        },
        {
            name = BZ["Farraki Arena"],
            prefix = "9)",
            color = "|cff9d9d9d",
        },
        {
            name = BB["Juthza the Cunning"],
            color = "|cff9d9d9d",
        },
        {
            name = BB["Kath'zen the Brutal"],
            color = "|cff9d9d9d",
        },
        {
            id = "ZFRazjalTheQuick",
            name = BB["Champion Razjal the Quick"],
            defaults = { dropRate = 25 },
            loot = {
                {id=58092}, --Champion's Sandhelm
                {id=58093}, --Libram of the Farraki Zealot
                {id=58094}, --Gilded Blade of Razjal
                {id=58095}, --Talisman of the Sandborn
            }
        },
        {
            id = "ZFZerillis",
            prefix = "10)",
            name = L["Zerillis"],
            postfix = L["Rare"]..L[", "]..L["Wanders"],
            loot = {
                {id=12470, dropRate=19},
            }
        },
        {
            id = "ZFTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = .02 },
            loot = {
                {id=9512},
                {id=9484},
                {id=862},
                {id=6440},
                {id=9483},
                {id=2040},
                {id=5616},
                {id=9511},
                {id=9481},
                {id=9480},
                {id=9482},
                {},
                {id=9243, dropRate=2},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.ZulFarrak.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end