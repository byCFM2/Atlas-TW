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

local L = AtlasTW.Localization.UI
local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions
local LMD = AtlasTW.Localization.MapData

local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Alterac Valley (North) data
AtlasTW.InstanceData.BGAlteracValleyNorth = {
    Name = LZ["Alterac Valley"] .. " (" .. L["North"] .. ")",
    Location = LZ["Alterac Mountains"],
    Level = {51, 60},
    Acronym = "AV",
    MaxPlayers = 40,
    Reputation = {
            { name = LF["Stormpike Guard"], loot = "StormpikeFrostwolf" },
    },
    Entrances = {
        { letter = "A)", info = L["Entrance"] .. " (" .. LF["Alliance"] .. ")" },
        { letter = "B)", info = LMD["Dun Baldar"] }
    },
    Bosses = {
        {
            name = LMD["Vanndar Stormpike"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Dun Baldar North Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Dun Baldar South Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Icewing Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Stonehearth Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Iceblood Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Tower Point Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["East Frostwolf Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["West Frostwolf Marshal"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Prospector Stonehewer"],
            color = Colors.BLUE,
        },
        {
            prefix = "1)",
            name = LMD["Irondeep Mine"],
        },
        {
            name = LMD["Morloch"] .. " (" .. LF["Neutral"] .. ")",
            color = Colors.GREY,
        },
        {
            name = LMD["Umi Thorson"] .. " (" .. LF["Alliance"] .. ")",
            color = Colors.GREY,
        },
        {
            name = LMD["Keetar"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "2)",
            name = LMD["Arch Druid Renferal"],
        },
        {
            prefix = "3)",
            name = LMD["Dun Baldar North Bunker"],
            color = Colors.ORANGE,
        },
        {
            name = LMD["Wing Commander Mulverick"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "4)",
            name = LMD["Murgot Deepforge"],
        },
        {
            name = LMD["Dirk Swindle"],
            color = Colors.GREY,
        },
        {
            name = LMD["Athramanis"],
            color = Colors.GREY,
        },
        {
            name = LMD["Lana Thunderbrew"],
            color = Colors.GREY,
        },
        {
            prefix = "5)",
            name = LMD["Stormpike Aid Station"],
            color = Colors.RED,
        },
        {
            prefix = "6)",
            name = LMD["Stormpike Stable Master"],
        },
        {
            name = LMD["Stormpike Ram Rider Commander"],
            color = Colors.GREY,
        },
        {
            name = LMD["Svalbrad Farmountain"],
            color = Colors.GREY,
        },
        {
            name = LMD["Kurdrum Barleybeard"],
            color = Colors.GREY,
        },
        {
            prefix = "7)",
            name = LMD["Stormpike Quartermaster"],
        },
        {
            name = LMD["Jonivera Farmountain"],
            color = Colors.GREY,
        },
        {
            name = LMD["Brogus Thunderbrew"],
            color = Colors.GREY,
        },
        {
            prefix = "8)",
            name = LMD["Wing Commander Ichman"] .. " (" .. L["Rescued"] .. ")",
        },
        {
            name = LMD["Wing Commander Slidore"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GREY,
        },
        {
            name = LMD["Wing Commander Vipore"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "9)",
            name = LMD["Dun Baldar South Bunker"],
            color = Colors.ORANGE,
        },
        {
            name = LMD["Corporal Noreg Stormpike"],
            color = Colors.GREY,
        },
        {
            name = LMD["Gaelden Hammersmith"],
            color = Colors.GREY,
        },
        {
            prefix = "10)",
            name = LMD["Stormpike Graveyard"],
            color = Colors.RED,
        },
        {
            prefix = "11)",
            name = LMD["Icewing Cavern"],
        },
        {
            name = LMD["Stormpike Banner"],
            color = Colors.GREY,
        },
        {
            prefix = "12)",
            name = LMD["Stormpike Lumber Yard"],
        },
        {
            name = LMD["Wing Commander Jeztor"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "13)",
            name = LMD["Icewing Bunker"],
            color = Colors.ORANGE,
        },
        {
            name = LMD["Wing Commander Guse"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "14)",
            name = LMD["Stonehearth Graveyard"],
            color = Colors.RED,
        },
        {
            prefix = "15)",
            name = LMD["Stormpike Ram Rider Commander"],
        },
        {
            prefix = "16)",
            name = LMD["Stonehearth Outpost"],
            color = Colors.ORANGE,
        },
        {
            name = LMD["Captain Balinda Stonehearth"],
            color = Colors.GREY,
        },
        {
            prefix = "17)",
            name = LMD["Snowfall Graveyard"],
            color = Colors.RED,
        },
        {
            name = LMD["Ichman's Beacon"],
            color = Colors.GREY,
        },
        {
            name = LMD["Mulverick's Beacon"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            id = "AVKorrak",
            name = LMD["Korrak the Bloodrager"],
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
            name = LMD["Stonehearth Bunker"],
            color = Colors.ORANGE,
        },
        {
            id = "AVLokholarIvus",
            prefix = "19)",
            name = LMD["Ivus the Forest Lord"] .. " (" .. L["Summon"] .. ")",
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
            name = LMD["Western Crater"],
        },
        {
            name = LMD["Vipore's Beacon"],
            color = Colors.GREY,
        },
        {
            name = LMD["Jeztor's Beacon"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "21)",
            name = LMD["Eastern Crater"],
        },
        {
            name = LMD["Slidore's Beacon"],
            color = Colors.GREY,
        },
        {
            name = LMD["Guse's Beacon"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "22)",
            name = LMD["Steamsaw"] .. " (" .. LF["Horde"] .. ")",
        },

        {
            name = L["Red"] .. ": " .. LMD["Graveyards, Capturable Areas"],
            color = Colors.RED,
        },
        {
            name = L["Orange"] .. ": " .. LMD["Bunkers, Towers, Destroyable Areas"],
            color = Colors.ORANGE,
        },
        {
            name = L["White"] .. ": " .. LMD["Assault NPCs, Quest Areas"],
        },
    }
}

-- Initialize items for all reputation rewards
for _, rewardData in ipairs(AtlasTW.InstanceData.BGAlteracValleyNorth.Bosses) do
    rewardData.items = rewardData.items or AtlasTW.CreateItemsFromLootTable(rewardData)
end