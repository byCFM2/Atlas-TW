-- Uldaman Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.Uldaman = {
    Name = BZ["Uldaman"],
    Location = BZ["Badlands"],
    Level = {30, 51},
    Acronym = "Uld",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A", info = L["Entrance"] },
        { letter = "B", info = L["Back Door"] },
    },
    Keys = {
        { name = L["Staff of Prehistoria"], loot = "VanillaKeys", info = BB["Ironaya"] }
    },
    Bosses = {
        {
            id = "UldBaelog",
            prefix = "1)",
            name = BB["Baelog"],
            defaults = { dropRate = 50 },
            loot = {
                {id=9401},
                {id=9400},
                {},
                {id=9399, dropRate=100, count={150, 200}},
            }
        },
        {
            id = "UldEric",
            name = BB["Eric \"The Swift\""],
            defaults = { dropRate = 50 },
            loot = {
                {id=9394},
                {id=9398},
                {},
                {id=2459, disc = L["Consumable"], dropRate=100},
            }
        },
        {
            id = "UldOlaf",
            name = BB["Olaf"],
            defaults = { dropRate = 50 },
            loot = {
                {id=9404},
                {id=9403},
                {},
                {id=1177, disc = L["Consumable"], dropRate=100},
            }
        },
        {
            id = "UldBaelogsChest",
            name = L["Baelog's Chest"],
            loot = {
                {id=7740, disc = L["Misc"], dropRate=100},
            }
        },
        {
            id = "UldConspicuousUrn",
            name = L["Conspicuous Urn"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldRemainsofaPaladin",
            prefix = "2)",
            name = L["Remains of a Paladin"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldRevelosh",
            prefix = "3)",
            name = BB["Revelosh"],
            defaults = { dropRate = 25 },
            loot = {
                {id=9389},
                {id=9388},
                {id=9390},
                {id=9387},
                {},
                {id=7741, dropRate=100, container={7733}},
            }
        },
        {
            id = "UldIronaya",
            prefix = "4)",
            name = BB["Ironaya"],
            defaults = { dropRate = 33 },
            loot = {
                {id=9409},
                {id=9407},
                {id=9408},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "UldObsidianSentinel",
            prefix = "5)",
            name = L["Obsidian Sentinel"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldAnnora",
            prefix = "6)",
            name = L["Annora"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldAncientStoneKeeper",
            prefix = "7)",
            name = BB["Ancient Stone Keeper"],
            defaults = { dropRate = 50 },
            loot = {
                {id=9410},
                {id=9411},
                {},
                {id=80746, dropRate=30},
            }
        },
        {
            id = "UldGalgannFirehammer",
            prefix = "8)",
            name = BB["Galgann Firehammer"],
            defaults = { dropRate = 25 },
            loot = {
                {id=11310},
                {id=9412},
                {id=11311},
                {id=9419},
            }
        },
        {
            id = "UldTabletofWill",
            name = L["Tablet of Will"],
            loot = {
                {id=5824, dropRate=100, container={6723}},
            }
        },
        {
            id = "UldShadowforgeCache",
            name = L["Shadowforge Cache"],
            loot = {
                {id=7669, dropRate=100, container={7888}},
            }
        },
        {
            id = "UldGrimlok",
            prefix = "9)",
            name = BB["Grimlok"],
            defaults = { dropRate = 33 },
            loot = {
                {id=9415},
                {id=9416},
                {id=9414},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "UldArchaedas",
            prefix = "10)",
            name = BB["Archaedas"]..": "..L["Lower"],
            defaults = { dropRate = 33 },
            loot = {
                {id=11118},
                {id=9413},
                {id=9418},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=5},
            }
        },
        {
            id = "UldTheDiscsofNorgannon",
            prefix = "11)",
            name = L["The Discs of Norgannon"]..": "..L["Lower"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldAncientTreasure",
            name = L["Ancient Treasure"]..": "..L["Lower"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldTrash",
            name = L["Trash Mobs"],
            defaults = { dropRate = 0.01 },
            loot = {
                {id=9431},
                {id=9429},
                {id=80810},
                {id=9420},
                {id=9430},
                {id=9397},
                {id=9406},
                {id=9428},
                {id=9432},
                {id=9396},
                {id=9393},
                {},
                {id=7666, dropRate=100, container={7673}},
                {},
                {id=9381},
                {id=9426},
                {id=9422},
                {id=9465},
                {id=9384},
                {id=9386},
                {id=9427},
                {id=9392},
                {id=9424},
                {id=9383},
                {id=9425},
                {id=9423},
                {id=9391},
            }
        },
    },
}

AtlasTW.InstanceData.UldamanEnt = {
    Name = BZ["Uldaman"]..": "..L["Entrance"],
    Location = BZ["Badlands"],
    Acronym = "Uld",
    Continent = 2,
    Entrances = {
        { letter = "A", info = L["Entrance"] },
        { letter = "B", info = BZ["Uldaman"] },
    },

    Bosses = {
        {
            id = "UldHammertoeGrez",
            prefix = "1)",
            name = L["Hammertoe Grez"],
            color = "|cff9d9d9d"
        },
        {
            id = "UldMagreganDeepshadow",
            prefix = "2)",
            name = L["Magregan Deepshadow"],
            postfix = L["Wanders"],
            loot = {
                {id=4635, dropRate=100, container={4987, 6723}},
            }
        },
        {
            id = "UldTabletofRyuneh",
            prefix = "3)",
            name = L["Tablet of Ryun'Eh"],
            loot = {
                {id=4631, dropRate=100, container={4746}},
            }
        },
        {
            id = "UldKromStoutarmChest",
            prefix = "4)",
            name = L["Krom Stoutarm's Chest"],
            loot = {
                {id=8027, dropRate=100},
            }
        },
        {
            id = "UldGarrettFamilyChest",
            prefix = "5)",
            name = L["Garrett Family Chest"],
            loot = {
                {id=8026, dropRate=100},
            }
        },
        {
            id = "UldShovelphlange",
            prefix = "1')",
            name = L["Digmaster Shovelphlange"],
            postfix = L["Rare"] .. ", " .. L["Varies"],
            color = "|cff66cc33",
            loot = {
                {id=9375, dropRate=10},
                {id=9378, dropRate=15},
                {},
                {id=9382, dropRate=65},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.UldamanEnt.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.Uldaman.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end