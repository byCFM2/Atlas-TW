---
--- AlteracValleySouth.lua - Alterac Valley South faction PvP data
---
--- This module contains comprehensive PvP data for the southern faction
--- (Horde) in Alterac Valley battleground. It includes faction-specific
--- NPCs, objectives, rewards, and strategic locations.
---
--- Features:
--- • Horde faction objectives
--- • Southern base locations
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

-- Alterac Valley (South) data
AtlasTW.InstanceData.BGAlteracValleySouth = {
    Name = LZ["Alterac Valley"] .. " (" .. L["South"] .. ")",
    Location = LZ["Hillsbrad Foothills"],
    Level = {51, 60},
    Acronym = "AV",
    MaxPlayers = 40,
    Reputation = {
            { name = LF["Frostwolf Clan"], loot = "StormpikeFrostwolf" },
    },
    Entrances = {
        { letter = "A)", info = L["Entrance"] .. " (" .. LF["Horde"] .. ")" },
        { letter = "B)", info = LMD["Frostwolf Keep"] }
    },
    Bosses = {
        {
            name = LMD["Drek'Thar"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Duros"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Draka"],
            color = Colors.BLUE,
        },
        {
            name = LMD["West Frostwolf Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = LMD["East Frostwolf Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Tower Point Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Iceblood Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Stonehearth Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Icewing Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Dun Baldar North Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = LMD["Dun Baldar South Warmaster"],
            color = Colors.BLUE,
        },
        {
            id = "AVLokholarIvus",
            prefix = "1)",
            name = LMD["Lokholar the Ice Lord"] .. " (" .. L["Summon"] .. ")",
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
            prefix = "2)",
            name = LMD["Iceblood Garrison"],
            color = Colors.ORANGE,
        },
        {
            name = LMD["Captain Galvangar"],
            color = Colors.GREY,
        },
        {
            prefix = "3)",
            name = LMD["Iceblood Tower"],
            color = Colors.ORANGE,
        },
        {
            prefix = "4)",
            name = LMD["Iceblood Graveyard"],
            color = Colors.RED,
        },
        {
            name = LMD["Wing Commander Ichman"] .. " (" .. LF["Alliance"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "5)",
            name = LMD["Tower Point"],
            color = Colors.ORANGE,
        },
        {
            name = LMD["Wing Commander Slidore"] .. " (" .. LF["Alliance"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "6)",
            name = LMD["Coldtooth Mine"],
        },
        {
            name = LMD["Taskmaster Snivvle"] .. " (" .. LF["Neutral"] .. ")",
            color = Colors.GREY,
        },
        {
            name = LMD["Masha Swiftcut"] .. " (" .. LF["Horde"] .. ")",
            color = Colors.GREY,
        },
        {
            name = LMD["Aggi Rumblestomp"] .. " (" .. LF["Alliance"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "7)",
            name = LMD["Frostwolf Graveyard"],
            color = Colors.RED,
        },
        {
            prefix = "8)",
            name = LMD["Wing Commander Vipore"] .. " (" .. LF["Alliance"] .. ")",
        },
        {
            name = LMD["Jotek"],
            color = Colors.GREY,
        },
        {
            name = LMD["Smith Regzar"],
            color = Colors.GREY,
        },
        {
            name = LMD["Primalist Thurloga"],
            color = Colors.GREY,
        },
        {
            name = LMD["Sergeant Yazra Bloodsnarl"],
            color = Colors.GREY,
        },
        {
            prefix = "9)",
            name = LMD["Frostwolf Stable Master"],
        },
        {
            name = LMD["Frostwolf Wolf Rider Commander"],
            color = Colors.GREY,
        },
        {
            prefix = "10)",
            name = LMD["Frostwolf Quartermaster"],
        },
        {
            prefix = "11)",
            name = LMD["West Frostwolf Tower"],
            color = Colors.ORANGE,
        },
        {
            prefix = "12)",
            name = LMD["East Frostwolf Tower"],
            color = Colors.ORANGE,
        },
        {
            prefix = "13)",
            name = LMD["Wing Commander Guse"] .. " (" .. L["Rescued"] .. ")",
        },
        {
            name = LMD["Wing Commander Jeztor"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GREY,
        },
        {
            name = LMD["Wing Commander Mulverick"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GREY,
        },
        {
            prefix = "14)",
            name = LMD["Frostwolf Relief Hut"],
            color = Colors.RED,
        },
        {
            prefix = "15)",
            name = LMD["Wildpaw Cavern"],
        },
        {
            name = LMD["Frostwolf Banner"],
            color = Colors.GREY,
        },
        {
            prefix = "16)",
            name = LMD["Steamsaw"] .. " (" .. LF["Alliance"] .. ")",
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
for _, rewardData in ipairs(AtlasTW.InstanceData.BGAlteracValleySouth.Bosses) do
    rewardData.items = rewardData.items or AtlasTW.CreateItemsFromLootTable(rewardData)
end