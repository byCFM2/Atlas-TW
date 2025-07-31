-- WarsongGulch.lua - Данные предметов из Ущелья Песни Войны
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Ущелья Песни Войны
AtlasTW.InstanceData.WarsongGulch = {
    Name = BZ["Warsong Gulch"],
    Location = BZ["Ashenvale"] .. " / " .. BZ["The Barrens"],
    Level = {1, 60},
    Acronym = "WSG",
    MaxPlayers = 10,
    Reputation = {
            { name = BF["Silverwing Sentinels"] },
            { name = BF["Warsong Outriders"] },
    },
    Entrances = {
        { letter = "A)", info = L["Silverwing Hold"] .. " (" .. BF["Alliance"] .. ")" },
        { letter = "B)", info = L["Warsong Lumber Mill"] .. " (" .. BF["Horde"] .. ")" }
    },
    Bosses = {
        {
            id = "WSGRepFriendly",
            name = BF["Friendly"],
            items = {
                {id = 21568}, --Rune of Duty
                {id = 21567}, --Rune of Duty
                {id = 21566}, --Rune of Perfection
                {id = 21565}, --Rune of Perfection
                {},
                {id = 19062, disc=L["Consumable"]}, --Warsong Gulch Field Ration
                {id = 19061, disc=L["Consumable"]}, --Warsong Gulch Iron Ration
                {id = 19060, disc=L["Consumable"]}, --Warsong Gulch Enriched Ration
                {},
                {id = 19068, disc=L["Consumable"]}, --"Warsong Gulch Silk Bandage
                {id = 19067, disc=L["Consumable"]}, --Warsong Gulch Mageweave Bandaged
                {id = 19066, disc=L["Consumable"]}, --Warsong Gulch Runecloth Bandage
                {},
                {id = 17349, disc=L["Consumable"]}, --Superior Healing Draught
                {id = 17352, disc=L["Consumable"]}, --Superior Mana Draught
            }
        },
        {
            id = "WSGRepHonored",
            name = BF["Honored"],
            items = {
                -- Alliance
                { name = BF["Alliance"], icon = "INV_BannerPVP_02" },
                {id = 20444}, -- Sentinel's Medallion
                {id = 20428}, -- Caretaker's Cape
                {id = 20431}, -- Lorekeeper's Ring
                {id = 20439}, -- Protector's Band
                {},
                {id = 19541}, -- Sentinel's Medallion
                {id = 19533}, -- Caretaker's Cape
                {id = 19525}, -- Lorekeeper's Ring *9
                {id = 19517}, -- Protector's Band
                {},
                {id = 19540}, -- Sentinel's Medallion
                {id = 19532}, -- Caretaker's Cape
                {id = 19524}, -- Lorekeeper's Ring
                {id = 19515}, -- Protector's Band *15
                -- Horde
                { name = BF["Horde"], icon = "INV_BannerPVP_01" },
                {id = 20442}, -- Scout's Medallion
                {id = 20427}, -- Battle Healer's Cloak
                {id = 20426}, -- Advisor's Ring
                {id = 20429}, -- Legionnaire's Band *20
                {},
                {id = 19537}, -- Scout's Medallion
                {id = 19529}, -- Battle Healer's Cloak
                {id = 19521}, -- Advisor's Ring
                {id = 19513}, -- Legionnaire's Band
                {},
                {id = 19536}, -- Scout's Medallion
                {id = 19528}, -- Battle Healer's Cloak
                {id = 19520}, -- Advisor's Ring
                {id = 19512}, -- Legionnaire's Band *30
                -- Alliance
                { name = BF["Alliance"], icon = "INV_BannerPVP_02" },
                {id = 19539}, -- Sentinel's Medallion
                {id = 19531}, -- Caretaker's Cape
                {id = 19523}, -- Lorekeeper's Ring
                {id = 19516}, -- Protector's Band
                {},
                {id = 19538}, -- Sentinel's Medallion
                {id = 19530}, -- Caretaker's Cape
                {id = 19522}, -- Lorekeeper's Ring
                {id = 19514}, -- Protector's Band *39
                {},
                { name = L["Shared"] },
                {id = 17348, disc=L["Consumable"]}, --Major Healing Draught
                {},
                {},
                {},
                -- Horde
                { name = BF["Horde"], icon = "INV_BannerPVP_01" },
                {id = 19535}, -- Scout's Medallion
                {id = 19527}, -- Battle Healer's Cloak
                {id = 19519}, -- Advisor's Ring
                {id = 19511}, -- Legionnaire's Band *50
                {},
                {id = 19534}, -- Scout's Medallion
                {id = 19526}, -- Battle Healer's Cloak
                {id = 19518}, -- Advisor's Ring
                {id = 19510}, -- Legionnaire's Band
                {},
                { name = L["Shared"] },
                {id = 17351, disc=L["Consumable"]}, --Major Mana Draught *58
            }
        },
        {
            id = "WSGRepRevered",
            name = BF["Revered"],
            items = {
                -- Alliance
                { name = BF["Alliance"], icon = "INV_BannerPVP_02" },
                {id = 20438}, --Outrunner's Bow
                {id = 20443}, --Sentinel's Blade
                {id = 20440}, --Protector's Sword
                {id = 20434}, --Lorekeeper's Staff
                {},
                {id = 19565}, --Outrunner's Bow
                {id = 19549}, --Sentinel's Blade
                {id = 19557}, --Protector's Sword
                {id = 19573}, --Lorekeeper's Staff *10
                {},
                {id = 19564}, --Outrunner's Bow
                {id = 19548}, --Sentinel's Blade
                {id = 19556}, --Protector's Sword
                {id = 19572}, --Lorekeeper's Staff *15
                -- Horde
                { name = BF["Horde"], icon = "INV_BannerPVP_01" },
                {id = 20437}, --Outrider's Bow
                {id = 20441}, --Scout's Blade
                {id = 20430}, --Legionnaire's Sword
                {id = 20425}, --Advisor's Gnarled Staff
                {},
                {id = 19561}, --Outrider's Bow
                {id = 19545}, --Scout's Blade
                {id = 19553}, --Legionnaire's Sword
                {id = 19569}, --Advisor's Gnarled Staff
                {},
                {id = 19560}, --Outrider's Bow
                {id = 19544}, --Scout's Blade
                {id = 19552}, --Legionnaire's Sword
                {id = 19568}, --Advisor's Gnarled Staff *30
                -- Alliance
                { name = BF["Alliance"], icon = "INV_BannerPVP_02" },
                {id = 19563}, --Outrunner's Bow
                {id = 19547}, --Sentinel's Blade
                {id = 19555}, --Protector's Sword
                {id = 19571}, --Lorekeeper's Staff
                {},
                {id = 19562}, --Outrunner's Bow *37
                {id = 19546}, --Sentinel's Blade
                {id = 19554}, --Protector's Sword
                {id = 19570}, --Lorekeeper's Staff
                {},
                {},
                {},
                {},
                {}, --*45
                -- Horde
                { name = BF["Horde"], icon = "INV_BannerPVP_01" },
                {id = 19559}, --Outrider's Bow
                {id = 19543}, --Scout's Blade
                {id = 19551}, --Legionnaire's Sword
                {id = 19567}, --Advisor's Gnarled Staff
                {},
                {id = 19558}, --Outrider's Bow
                {id = 19542}, --Scout's Blade
                {id = 19550}, --Legionnaire's Sword
                {id = 19566}, --Advisor's Gnarled Staff
            }
        },
        {
            id = "WSGRepExalted4049",
            name = L["Exalted"] .. " 40-49",
            level = "40-49",
            reputation = "Exalted",
            items = {
                -- Alliance
                {faction = "Alliance", header = true},
                {id = 19597, name = "Dryad's Wrist Bindings", icon = "INV_Bracer_13", quality = 4, slot = "#s8#", armor = "#a1#"},
                {id = 19590, name = "Forest Stalker's Bracers", icon = "INV_Bracer_12", quality = 4, slot = "#s8#", armor = "#a2#"},
                {id = 19584, name = "Windtalker's Wristguards", icon = "INV_Bracer_03", quality = 4, slot = "#s8#", armor = "#a3#"},
                {id = 19581, name = "Berserker Bracers", icon = "INV_Bracer_06", quality = 4, slot = "#s8#", armor = "#a4#"},
                {},
                -- Horde
                {faction = "Horde", header = true},
                {id = 19597, name = "Dryad's Wrist Bindings", icon = "INV_Bracer_13", quality = 4, slot = "#s8#", armor = "#a1#"},
                {id = 19590, name = "Forest Stalker's Bracers", icon = "INV_Bracer_12", quality = 4, slot = "#s8#", armor = "#a2#"},
                {id = 19584, name = "Windtalker's Wristguards", icon = "INV_Bracer_03", quality = 4, slot = "#s8#", armor = "#a3#"},
                {id = 19581, name = "Berserker Bracers", icon = "INV_Bracer_06", quality = 4, slot = "#s8#", armor = "#a4#"},
            }
        },
        {
            id = "WSGRepExalted5059",
            name = L["Exalted"] .. " 50-59",
            level = "50-59",
            reputation = "Exalted",
            items = {
                -- Alliance
                {faction = "Alliance", header = true},
                {id = 19596, name = "Dryad's Wrist Bindings", icon = "INV_Bracer_13", quality = 4, slot = "#s8#", armor = "#a1#"},
                {id = 19589, name = "Forest Stalker's Bracers", icon = "INV_Bracer_12", quality = 4, slot = "#s8#", armor = "#a2#"},
                {id = 19583, name = "Windtalker's Wristguards", icon = "INV_Bracer_03", quality = 4, slot = "#s8#", armor = "#a3#"},
                {id = 19580, name = "Berserker Bracers", icon = "INV_Bracer_06", quality = 4, slot = "#s8#", armor = "#a4#"},
                {},
                -- Horde
                {faction = "Horde", header = true},
                {id = 19596, name = "Dryad's Wrist Bindings", icon = "INV_Bracer_13", quality = 4, slot = "#s8#", armor = "#a1#"},
                {id = 19589, name = "Forest Stalker's Bracers", icon = "INV_Bracer_12", quality = 4, slot = "#s8#", armor = "#a2#"},
                {id = 19583, name = "Windtalker's Wristguards", icon = "INV_Bracer_03", quality = 4, slot = "#s8#", armor = "#a3#"},
                {id = 19580, name = "Berserker Bracers", icon = "INV_Bracer_06", quality = 4, slot = "#s8#", armor = "#a4#"},
            }
        },
        {
            id = "WSGRepExalted60",
            name = L["Exalted"] .. " 60",
            level = "60",
            reputation = "Exalted",
            items = {
                -- Alliance
                {faction = "Alliance", header = true},
                {id = 19595, name = "Dryad's Wrist Bindings", icon = "INV_Bracer_13", quality = 4, slot = "#s8#", armor = "#a1#"},
                {id = 19587, name = "Forest Stalker's Bracers", icon = "INV_Bracer_12", quality = 4, slot = "#s8#", armor = "#a2#"},
                {id = 19582, name = "Windtalker's Wristguards", icon = "INV_Bracer_03", quality = 4, slot = "#s8#", armor = "#a3#"},
                {id = 19578, name = "Berserker Bracers", icon = "INV_Bracer_06", quality = 4, slot = "#s8#", armor = "#a4#"},
                {id = 22752, name = "Sentinel's Silk Leggings", icon = "INV_Pants_Cloth_05", quality = 4, slot = "#s11#", armor = "#a1#"},
                {id = 22749, name = "Sentinel's Leather Pants", icon = "INV_Pants_Leather_12", quality = 4, slot = "#s11#", armor = "#a2#"},
                {id = 22750, name = "Sentinel's Lizardhide Pants", icon = "INV_Pants_06", quality = 4, slot = "#s11#", armor = "#a2#"},
                {id = 22748, name = "Sentinel's Chain Leggings", icon = "INV_Pants_03", quality = 4, slot = "#s11#", armor = "#a3#"},
                {id = 22753, name = "Sentinel's Lamellar Legguards", icon = "INV_Pants_Plate_15", quality = 4, slot = "#s11#", armor = "#a4#"},
                {id = 22672, name = "Sentinel's Plate Legguards", icon = "INV_Pants_Plate_20", quality = 4, slot = "#s11#", armor = "#a4#"},
                {},
                {id = 19506, name = "Silverwing Battle Tabard", icon = "INV_Shirt_GuildTabard_01", quality = 1, slot = "#s7#"},
                {},
                -- Horde
                {faction = "Horde", header = true},
                {id = 19595, name = "Dryad's Wrist Bindings", icon = "INV_Bracer_13", quality = 4, slot = "#s8#", armor = "#a1#"},
                {id = 19587, name = "Forest Stalker's Bracers", icon = "INV_Bracer_12", quality = 4, slot = "#s8#", armor = "#a2#"},
                {id = 19582, name = "Windtalker's Wristguards", icon = "INV_Bracer_03", quality = 4, slot = "#s8#", armor = "#a3#"},
                {id = 19578, name = "Berserker Bracers", icon = "INV_Bracer_06", quality = 4, slot = "#s8#", armor = "#a4#"},
                {id = 22747, name = "Outrider's Silk Leggings", icon = "INV_Pants_Cloth_05", quality = 4, slot = "#s11#", armor = "#a1#"},
                {id = 22740, name = "Outrider's Leather Pants", icon = "INV_Pants_Leather_12", quality = 4, slot = "#s11#", armor = "#a2#"},
                {id = 22741, name = "Outrider's Lizardhide Pants", icon = "INV_Pants_06", quality = 4, slot = "#s11#", armor = "#a2#"},
                {id = 22673, name = "Outrider's Chain Leggings", icon = "INV_Pants_03", quality = 4, slot = "#s11#", armor = "#a3#"},
                {id = 22676, name = "Outrider's Lamellar Legguards", icon = "INV_Pants_Plate_15", quality = 4, slot = "#s11#", armor = "#a4#"},
                {id = 22651, name = "Outrider's Plate Legguards", icon = "INV_Pants_Plate_20", quality = 4, slot = "#s11#", armor = "#a4#"},
                {},
                {id = 19505, name = "Warsong Battle Tabard", icon = "INV_Shirt_GuildTabard_01", quality = 1, slot = "#s7#"},
            }
        }
    }
}

-- Инициализация предметов для всех наград репутации
for _, rewardData in ipairs(AtlasTW.InstanceData.WarsongGulch.Bosses) do
    rewardData.items = rewardData.items or AtlasTW.CreateItemsFromLootTable(rewardData)
end