-- BGAlteracValleyNorth.lua - Данные предметов из Альтеракской долины (Север)
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Альтеракской долины (Север)
AtlasTW.InstanceData.BGAlteracValleyNorth = {
    Name = BZ["Alterac Valley"] .. " (" .. L["North"] .. ")",
    Location = BZ["Alterac Mountains"],
    Level = {51, 60},
    Acronym = "AV",
    MaxPlayers = 40,
    Reputation = {
            { name = BF["Stormpike Guard"], loot = "StormpikeFrostwolf" },
    },
    Entrances = {
        { letter = "A)", info = L["Entrance"] .. " (" .. BF["Alliance"] .. ")" },
        { letter = "B)", info = L["Dun Baldar"] }
    },
    Bosses = {
        {
            name = L["Vanndar Stormpike"],
            color = "|cff0070dd",
        },
        {
            name = L["Dun Baldar North Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["Dun Baldar South Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["Icewing Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["Stonehearth Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["Iceblood Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["Tower Point Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["East Frostwolf Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["West Frostwolf Marshal"],
            color = "|cff0070dd",
        },
        {
            name = L["Prospector Stonehewer"],
            color = "|cff0070dd",
        },
        {
            prefix = "1)",
            name = L["Irondeep Mine"],
        },
        {
            name = L["Morloch"] .. " (" .. L["Neutral"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Umi Thorson"] .. " (" .. BF["Alliance"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Keetar"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "2)",
            name = L["Arch Druid Renferal"],
        },
        {
            prefix = "3)",
            name = L["Dun Baldar North Bunker"],
            color = "|cfffe8a0e",
        },
        {
            name = L["Wing Commander Mulverick"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "4)",
            name = L["Murgot Deepforge"],
        },
        {
            name = L["Dirk Swindle"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Athramanis"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Lana Thunderbrew"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "5)",
            name = L["Stormpike Aid Station"],
            color = "|cffff0000",
        },
        {
            prefix = "6)",
            name = L["Stormpike Stable Master"],
        },
        {
            name = L["Stormpike Ram Rider Commander"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Svalbrad Farmountain"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Kurdrum Barleybeard"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "7)",
            name = L["Stormpike Quartermaster"],
        },
        {
            name = L["Jonivera Farmountain"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Brogus Thunderbrew"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "8)",
            name = L["Wing Commander Ichman"] .. " (" .. L["Rescued"] .. ")",
        },
        {
            name = L["Wing Commander Slidore"] .. " (" .. L["Rescued"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Wing Commander Vipore"] .. " (" .. L["Rescued"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "9)",
            name = L["Dun Baldar South Bunker"],
            color = "|cfffe8a0e",
        },
        {
            name = L["Corporal Noreg Stormpike"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Gaelden Hammersmith"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "10)",
            name = L["Stormpike Graveyard"],
            color = "|cffff0000",
        },
        {
            prefix = "11)",
            name = L["Icewing Cavern"],
        },
        {
            name = L["Stormpike Banner"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "12)",
            name = L["Stormpike Lumber Yard"],
        },
        {
            name = L["Wing Commander Jeztor"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "13)",
            name = L["Icewing Bunker"],
            color = "|cfffe8a0e",
        },
        {
            name = L["Wing Commander Guse"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "14)",
            name = L["Stonehearth Graveyard"],
            color = "|cffff0000",
        },
        {
            prefix = "15)",
            name = L["Stormpike Ram Rider Commander"],
        },
        {
            prefix = "16)",
            name = L["Stonehearth Outpost"],
            color = "|cfffe8a0e",
        },
        {
            name = L["Captain Balinda Stonehearth"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "17)",
            name = L["Snowfall Graveyard"],
            color = "|cffff0000",
        },
        {
            name = L["Ichman's Beacon"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Mulverick's Beacon"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            id = "AVKorrak",
            name = L["Korrak the Bloodrager"],
            items = {
                {id = 13080}, --Widow's Clutch
                {id = 12970}, --General's Ceremonial Plate
                {},
                {id = 12686}, --Einhorn's Skinner
                {id = 21135}, --Assassin's Throwing Axe
                {},
                {id = 17108}, --Mark of Deflection
            }
        },
        {
            prefix = "18)",
            name = L["Stonehearth Bunker"],
            color = "|cfffe8a0e",
        },
        {
            id = "AVLokholarIvus",
            prefix = "19)",
            name = L["Ivus the Forest Lord"] .. " (" .. L["Summon"] .. ")",
            items = {
                {id = 19105}, --Frost Runed Headdress
                {id = 19113}, --Yeti Hide Bracers
                {id = 19111}, --Winteraxe Epaulets
                {id = 19112}, --Frozen Steel Vambraces
                {},
                {id = 19109}, --Deep Rooted Ring
                {},
                {id = 19110}, --Cold Forged Blade
            }
        },
        {
            prefix = "20)",
            name = L["Western Crater"],
        },
        {
            name = L["Vipore's Beacon"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Jeztor's Beacon"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "21)",
            name = L["Eastern Crater"],
        },
        {
            name = L["Slidore's Beacon"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Guse's Beacon"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "22)",
            name = L["Steamsaw"] .. " (" .. BF["Horde"] .. ")",
        },

        {
            name = L["Red"] .. ": " .. L["Graveyards, Capturable Areas"],
            color = "|cffff0000",
        },
        {
            name = L["Orange"] .. ": " .. L["Bunkers, Towers, Destroyable Areas"],
            color = "|cfffe8a0e",
        },
        {
            name = L["White"] .. ": " .. L["Assault NPCs, Quest Areas"],
        },
    }
}

-- Инициализация предметов для всех наград репутации
for _, rewardData in ipairs(AtlasTW.InstanceData.BGAlteracValleyNorth.Bosses) do
    rewardData.items = rewardData.items or AtlasTW.CreateItemsFromLootTable(rewardData)
end