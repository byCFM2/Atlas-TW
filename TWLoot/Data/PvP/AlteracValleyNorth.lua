---
--- AlteracValleyNorth.lua - Alterac Valley North faction PvP data
---
--- This module contains comprehensive PvP data for the northern faction
--- (Alliance) in Alterac Valley battleground. It includes faction-specific
--- NPCs, objectives, rewards, and strategic locations.
---
--- Features:
--- • Alliance faction objectives
--- • Northern base locations
--- • Faction-specific NPCs
--- • Strategic point data
--- • Battleground rewards
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Alterac Valley (North) data
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
            color = Colors.BLUE,
        },
        {
            name = L["Dun Baldar North Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["Dun Baldar South Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["Icewing Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["Stonehearth Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["Iceblood Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["Tower Point Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["East Frostwolf Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["West Frostwolf Marshal"],
            color = Colors.BLUE,
        },
        {
            name = L["Prospector Stonehewer"],
            color = Colors.BLUE,
        },
        {
            prefix = "1)",
            name = L["Irondeep Mine"],
        },
        {
            name = L["Morloch"] .. " (" .. L["Neutral"] .. ")",
            color = Colors.GRAY,
        },
        {
            name = L["Umi Thorson"] .. " (" .. BF["Alliance"] .. ")",
            color = Colors.GRAY,
        },
        {
            name = L["Keetar"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "2)",
            name = L["Arch Druid Renferal"],
        },
        {
            prefix = "3)",
            name = L["Dun Baldar North Bunker"],
            color = Colors.ORANGE,
        },
        {
            name = L["Wing Commander Mulverick"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "4)",
            name = L["Murgot Deepforge"],
        },
        {
            name = L["Dirk Swindle"],
            color = Colors.GRAY,
        },
        {
            name = L["Athramanis"],
            color = Colors.GRAY,
        },
        {
            name = L["Lana Thunderbrew"],
            color = Colors.GRAY,
        },
        {
            prefix = "5)",
            name = L["Stormpike Aid Station"],
            color = Colors.RED,
        },
        {
            prefix = "6)",
            name = L["Stormpike Stable Master"],
        },
        {
            name = L["Stormpike Ram Rider Commander"],
            color = Colors.GRAY,
        },
        {
            name = L["Svalbrad Farmountain"],
            color = Colors.GRAY,
        },
        {
            name = L["Kurdrum Barleybeard"],
            color = Colors.GRAY,
        },
        {
            prefix = "7)",
            name = L["Stormpike Quartermaster"],
        },
        {
            name = L["Jonivera Farmountain"],
            color = Colors.GRAY,
        },
        {
            name = L["Brogus Thunderbrew"],
            color = Colors.GRAY,
        },
        {
            prefix = "8)",
            name = L["Wing Commander Ichman"] .. " (" .. L["Rescued"] .. ")",
        },
        {
            name = L["Wing Commander Slidore"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GRAY,
        },
        {
            name = L["Wing Commander Vipore"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "9)",
            name = L["Dun Baldar South Bunker"],
            color = Colors.ORANGE,
        },
        {
            name = L["Corporal Noreg Stormpike"],
            color = Colors.GRAY,
        },
        {
            name = L["Gaelden Hammersmith"],
            color = Colors.GRAY,
        },
        {
            prefix = "10)",
            name = L["Stormpike Graveyard"],
            color = Colors.RED,
        },
        {
            prefix = "11)",
            name = L["Icewing Cavern"],
        },
        {
            name = L["Stormpike Banner"],
            color = Colors.GRAY,
        },
        {
            prefix = "12)",
            name = L["Stormpike Lumber Yard"],
        },
        {
            name = L["Wing Commander Jeztor"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "13)",
            name = L["Icewing Bunker"],
            color = Colors.ORANGE,
        },
        {
            name = L["Wing Commander Guse"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "14)",
            name = L["Stonehearth Graveyard"],
            color = Colors.RED,
        },
        {
            prefix = "15)",
            name = L["Stormpike Ram Rider Commander"],
        },
        {
            prefix = "16)",
            name = L["Stonehearth Outpost"],
            color = Colors.ORANGE,
        },
        {
            name = L["Captain Balinda Stonehearth"],
            color = Colors.GRAY,
        },
        {
            prefix = "17)",
            name = L["Snowfall Graveyard"],
            color = Colors.RED,
        },
        {
            name = L["Ichman's Beacon"],
            color = Colors.GRAY,
        },
        {
            name = L["Mulverick's Beacon"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
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
            color = Colors.ORANGE,
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
            color = Colors.GRAY,
        },
        {
            name = L["Jeztor's Beacon"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "21)",
            name = L["Eastern Crater"],
        },
        {
            name = L["Slidore's Beacon"],
            color = Colors.GRAY,
        },
        {
            name = L["Guse's Beacon"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "22)",
            name = L["Steamsaw"] .. " (" .. BF["Horde"] .. ")",
        },

        {
            name = L["Red"] .. ": " .. L["Graveyards, Capturable Areas"],
            color = Colors.RED,
        },
        {
            name = L["Orange"] .. ": " .. L["Bunkers, Towers, Destroyable Areas"],
            color = Colors.ORANGE,
        },
        {
            name = L["White"] .. ": " .. L["Assault NPCs, Quest Areas"],
        },
    }
}

-- Initialize items for all reputation rewards
for _, rewardData in ipairs(AtlasTW.InstanceData.BGAlteracValleyNorth.Bosses) do
    rewardData.items = rewardData.items or AtlasTW.CreateItemsFromLootTable(rewardData)
end