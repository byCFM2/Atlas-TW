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
            color = "|cff0070dd",
        },
        {
            name = L["Duros"],
            color = "|cff0070dd",
        },
        {
            name = L["Drakan"],
            color = "|cff0070dd",
        },
        {
            name = L["West Frostwolf Warmaster"],
            color = "|cff0070dd",
        },
        {
            name = L["East Frostwolf Warmaster"],
            color = "|cff0070dd",
        },
        {
            name = L["Tower Point Warmaster"],
            color = "|cff0070dd",
        },
        {
            name = L["Iceblood Warmaster"],
            color = "|cff0070dd",
        },
        {
            name = L["Stonehearth Warmaster"],
            color = "|cff0070dd",
        },
        {
            name = L["Icewing Warmaster"],
            color = "|cff0070dd",
        },
        {
            name = L["Dun Baldar North Warmaster"],
            color = "|cff0070dd",
        },
        {
            name = L["Dun Baldar South Warmaster"],
            color = "|cff0070dd",
        },
        {
            id = "AVLokholarIvus",
            prefix = "1)",
            name = L["Lokholar the Ice Lord"] .. " (" .. L["Summon"] .. ")",
            color = "|cff9d9d9d",
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
            color = "|cfffe8a0e",
        },
        {
            name = L["Captain Galvangar"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "3)",
            name = L["Iceblood Tower"],
            color = "|cfffe8a0e",
        },
        {
            prefix = "4)",
            name = L["Iceblood Graveyard"],
            color = "|cffff0000",
        },
        {
            name = L["Wing Commander Ichman"] .. " (" .. BF["Alliance"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "5)",
            name = L["Tower Point"],
            color = "|cfffe8a0e",
        },
        {
            name = L["Wing Commander Slidore"] .. " (" .. BF["Alliance"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "6)",
            name = L["Coldtooth Mine"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Taskmaster Snivvle"] .. " (" .. L["Neutral"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Masha Swiftcut"] .. " (" .. BF["Horde"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Aggi Rumblestomp"] .. " (" .. BF["Alliance"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "7)",
            name = L["Frostwolf Graveyard"],
            color = "|cffff0000",
        },
        {
            prefix = "8)",
            name = L["Wing Commander Vipore"] .. " (" .. BF["Alliance"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Jotek"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Smith Regzar"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Primalist Thurloga"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Sergeant Yazra Bloodsnarl"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "9)",
            name = L["Frostwolf Stable Master"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Frostwolf Wolf Rider Commander"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "10)",
            name = L["Frostwolf Quartermaster"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "11)",
            name = L["West Frostwolf Tower"],
            color = "|cfffe8a0e",
        },
        {
            prefix = "12)",
            name = L["East Frostwolf Tower"],
            color = "|cfffe8a0e",
        },
        {
            prefix = "13)",
            name = L["Wing Commander Guse"] .. " (" .. L["Rescued"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Wing Commander Jeztor"] .. " (" .. L["Rescued"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            name = L["Wing Commander Mulverick"] .. " (" .. L["Rescued"] .. ")",
            color = "|cff9d9d9d",
        },
        {
            prefix = "14)",
            name = L["Frostwolf Relief Hut"],
            color = "|cffff0000",
        },
        {
            prefix = "15)",
            name = L["Wildpaw Cavern"],
            color = "|cff9d9d9d",
        },
        {
            name = L["Frostwolf Banner"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "16)",
            name = L["Steamsaw"] .. " (" .. BF["Alliance"] .. ")",
            color = "|cff9d9d9d",
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
            color = "|cff9d9d9d",
        },
    }
}

-- Initialize items for all reputation rewards
for _, rewardData in ipairs(AtlasTW.InstanceData.BGAlteracValleySouth.Bosses) do
    rewardData.items = rewardData.items or AtlasTW.CreateItemsFromLootTable(rewardData)
end