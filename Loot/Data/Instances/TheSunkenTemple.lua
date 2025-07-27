-- The Sunken Temple Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.TheSunkenTempleEnt = {
    Name = L["Sunken Temple"].." ("..L["Entrance"]..")",
    Location = BZ["Swamp of Sorrows"],
    Acronym = "ST",
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = L["Sunken Temple"] },
    },
    Bosses = {
        {
            name = L["Meeting Stone"],
            color = "|cff0070dd"
        },
        {
            name = L["Jade"].." ("..L["Rare"]..")",
            color = "|cff0070dd"
        },
        {
            prefix = "1)",
            name = BB["Kazkaz the Unholy"],
            postfix = L["Upper"],
        },
        {
            prefix = "2)",
            name = BB["Zekkis"],
            postfix = L["Lower"],
        },
        {
            prefix = "3)",
            name = BB["Veyzhak the Cannibal"],
        },
    }
}

AtlasTW.InstanceData.TheSunkenTemple = {
    Name = L["Sunken Temple"],
    Location = BZ["Swamp of Sorrows"],
    Level = {35, 54},
    Acronym = "ST",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A)", info = L["Entrance"] },
        { letter = "B)", info = L["Connection"] },
        { letter = "C)", info = L["Balcony Minibosses"].." ("..L["Upper"]..")"},
    },
    Keys = {
        { name = BB["Yeh'kinya's Scroll"], loot = "VanillaKeys", info = BB["Avatar of Hakkar"] },
    },
    Bosses = {
        {
            id = "STBalconyMinibosses",
            name = L["Mini Bosses"],
            postfix = BZ["The Temple of Atal'Hakkar"],
            color = "|cffff8000",
            defaults = { dropRate = 7 },
            loot = {
                {id=10783},
                {id=10784},
                {id=10787},
                {},
                {id=10788},
                {id=10785},
                {id=10786},
                {},
                {id=20606,dropRate=100,container={20369, 20503, 20556, 20536, 20534, 20530,
                    20521,20130,20517,20504,20505,20512,20620}},
                {id=20607,dropRate=100,container={20369, 20503, 20556, 20536, 20534, 20530,
                    20521,20130,20517,20504,20505,20512,20620}},
                {id=20608,dropRate=100,container={20369, 20503, 20556, 20536, 20534, 20530,
                    20521,20130,20517,20504,20505,20512,20620}},
            }
        },
        {
            name = BB["Gasher"],
            color = "|cff0070dd",
        },
        {
            name = BB["Loro"],
            color = "|cff0070dd",
        },
        {
            name = BB["Hukku"],
            color = "|cff0070dd",
        },
        {
            name = BB["Zolo"],
            color = "|cff0070dd",
        },
        {
            name = BB["Mijan"],
            color = "|cff0070dd",
        },
        {
            name = BB["Zul'Lor"],
            color = "|cff0070dd",
        },
        {
            prefix = "1)",
            name = L["Altar of Hakkar"],
            color = "|cff9d9d9d",
        },
        {
            id = "STAtalalarion",
            name = BB["Atal'alarion"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10800},
                {id=10798},
                {id=10799},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "STSpawnOfHakkar",
            prefix = "2)",
            name = L["Spawn of Hakkar"].." ("..L["Wanders"]..")",
            defaults = { dropRate = 47 },
            loot = {
                {id=10801},
                {},
                {id=10802, dropRate=26},
            }
        },
        {
            id = "STAvatarofHakkar",
            prefix = "3)",
            name = BB["Avatar of Hakkar"],
            defaults = { dropRate = 17 },
            loot = {
                {id=12462, dropRate=2},
                {},
                {id=10843},
                {id=10845},
                {id=10842},
                {id=10846},
                {id=10838},
                {id=10844},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "STJammalan",
            prefix = "4)",
            name = BB["Jammal'an the Prophet"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10806},
                {id=10808},
                {id=10807},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "STOgom",
            name = BB["Ogom the Wretched"],
            defaults = { dropRate = 33 },
            loot = {
                {id=10805},
                {id=10803},
                {id=10804},
            }
        },
        {
            prefix = "5)",
            name = L["Elder Starsong"].." ("..L["Lunar Festival"]..")",
          --  loot = "LunarFestival"
        },
        {
            id = "STDreamscythe",
            prefix = "6)",
            name = BB["Dreamscythe"],
            defaults = { dropRate = 5 },
            loot = {
                {id=12465},
                {id=12466},
                {id=12464},
                {id=10797},
                {id=12463},
                {id=12243},
                {id=10795},
                {id=10796},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "STWeaver",
            name = BB["Weaver"],
            defaults = { dropRate = 5 },
            loot = {
                {id=12465},
                {id=12466},
                {id=12464},
                {id=10797},
                {id=12463},
                {id=12243},
                {id=10795},
                {id=10796},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "STMorphaz",
            prefix = "7)",
            name = BB["Morphaz"],
            defaults = { dropRate = 5 },
            loot = {
                {id=12465},
                {id=12466},
                {id=12464},
                {id=10797},
                {id=12463},
                {id=12243},
                {id=10795},
                {id=10796},
            }
        },
        {
            id = "STHazzas",
            name = BB["Hazzas"],
            defaults = { dropRate = 5 },
            loot = {
                {id=12465},
                {id=12466},
                {id=12464},
                {id=10797},
                {id=12463},
                {id=12243},
                {id=10795},
                {id=10796},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "STEranikus",
            prefix = "8)",
            name = BB["Shade of Eranikus"],
            defaults = { dropRate = 17 },
            loot = {
                {id=10847, dropRate=0.5},
                {},
                {id=10833},
                {id=10829},
                {id=10836},
                {id=10835},
                {id=10837},
                {id=10828},
                {},
                {id=70226, dropRate=3, container={70227, 70228, 70229, 70230, 70231,
                    70232, 70233, 70234, 70235, 70236}},
                {id=61791, dropRate=.25, container={61784}},
                {},
                {id=10454, dropRate=100, container={10455}},
            }
        },
        {
            name = L["Essence Font"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Malfurion Stormrage"].." ("..L["Summon"]..")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Statue Activation Order"],
            color = "|cff00ff00",
            prefix = "1'-6')"
        },
        {
            id = "STTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0.02 },
            loot = {
                {id=10630},
                {id=10632},
                {id=10631},
                {id=10633},
                {id=10629},
                {id=10634},
                {id=10624},
                {id=10623},
                {id=10625},
                {id=10626},
                {id=10628},
                {id=10627},
                {},
                {id=10780},
                {},
                {id=16216, dropRate=1.48},
                {id=15733, dropRate=4, container={15046}},
            }
        }
    }
}


-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheSunkenTemple.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromloot(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.TheSunkenTempleEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromloot(bossData)
    bossData.loot = nil -- Очищаем временные данные
end