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
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local Colors = AtlasTW.Colors

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Alterac Valley (South) data
AtlasTW.InstanceData.BGAlteracValleySouth = {
    Name = BZ["Alterac Valley"] .. " (" .. L["South"] .. ")",
    Location = BZ["Hillsbrad Foothills"],
    Level = {51, 60},
    Acronym = "AV",
    MaxPlayers = 40,
    Reputation = {
            { name = BF["Frostwolf Clan"], loot = "StormpikeFrostwolf" },
    },
    Entrances = {
        { letter = "A)", info = L["Entrance"] .. " (" .. BF["Horde"] .. ")" },
        { letter = "B)", info = L["Frostwolf Keep"] }
    },
    Bosses = {
        {
            name = L["Drek'Thar"],
            color = Colors.BLUE,
        },
        {
            name = L["Duros"],
            color = Colors.BLUE,
        },
        {
            name = L["Drakan"],
            color = Colors.BLUE,
        },
        {
            name = L["West Frostwolf Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = L["East Frostwolf Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = L["Tower Point Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = L["Iceblood Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = L["Stonehearth Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = L["Icewing Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = L["Dun Baldar North Warmaster"],
            color = Colors.BLUE,
        },
        {
            name = L["Dun Baldar South Warmaster"],
            color = Colors.BLUE,
        },
        {
            id = "AVLokholarIvus",
            prefix = "1)",
            name = L["Lokholar the Ice Lord"] .. " (" .. L["Summon"] .. ")",
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
            name = L["Iceblood Garrison"],
            color = Colors.ORANGE,
        },
        {
            name = L["Captain Galvangar"],
            color = Colors.GRAY,
        },
        {
            prefix = "3)",
            name = L["Iceblood Tower"],
            color = Colors.ORANGE,
        },
        {
            prefix = "4)",
            name = L["Iceblood Graveyard"],
            color = Colors.RED,
        },
        {
            name = L["Wing Commander Ichman"] .. " (" .. BF["Alliance"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "5)",
            name = L["Tower Point"],
            color = Colors.ORANGE,
        },
        {
            name = L["Wing Commander Slidore"] .. " (" .. BF["Alliance"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "6)",
            name = L["Coldtooth Mine"],
        },
        {
            name = L["Taskmaster Snivvle"] .. " (" .. L["Neutral"] .. ")",
            color = Colors.GRAY,
        },
        {
            name = L["Masha Swiftcut"] .. " (" .. BF["Horde"] .. ")",
            color = Colors.GRAY,
        },
        {
            name = L["Aggi Rumblestomp"] .. " (" .. BF["Alliance"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "7)",
            name = L["Frostwolf Graveyard"],
            color = Colors.RED,
        },
        {
            prefix = "8)",
            name = L["Wing Commander Vipore"] .. " (" .. BF["Alliance"] .. ")",
        },
        {
            name = L["Jotek"],
            color = Colors.GRAY,
        },
        {
            name = L["Smith Regzar"],
            color = Colors.GRAY,
        },
        {
            name = L["Primalist Thurloga"],
            color = Colors.GRAY,
        },
        {
            name = L["Sergeant Yazra Bloodsnarl"],
            color = Colors.GRAY,
        },
        {
            prefix = "9)",
            name = L["Frostwolf Stable Master"],
        },
        {
            name = L["Frostwolf Wolf Rider Commander"],
            color = Colors.GRAY,
        },
        {
            prefix = "10)",
            name = L["Frostwolf Quartermaster"],
        },
        {
            prefix = "11)",
            name = L["West Frostwolf Tower"],
            color = Colors.ORANGE,
        },
        {
            prefix = "12)",
            name = L["East Frostwolf Tower"],
            color = Colors.ORANGE,
        },
        {
            prefix = "13)",
            name = L["Wing Commander Guse"] .. " (" .. L["Rescued"] .. ")",
        },
        {
            name = L["Wing Commander Jeztor"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GRAY,
        },
        {
            name = L["Wing Commander Mulverick"] .. " (" .. L["Rescued"] .. ")",
            color = Colors.GRAY,
        },
        {
            prefix = "14)",
            name = L["Frostwolf Relief Hut"],
            color = Colors.RED,
        },
        {
            prefix = "15)",
            name = L["Wildpaw Cavern"],
        },
        {
            name = L["Frostwolf Banner"],
            color = Colors.GRAY,
        },
        {
            prefix = "16)",
            name = L["Steamsaw"] .. " (" .. BF["Alliance"] .. ")",
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
for _, rewardData in ipairs(AtlasTW.InstanceData.BGAlteracValleySouth.Bosses) do
    rewardData.items = rewardData.items or AtlasTW.CreateItemsFromLootTable(rewardData)
end