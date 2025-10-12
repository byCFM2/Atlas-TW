---
--- WarsongGulch.lua - Warsong Gulch battleground PvP data
---
--- This module contains comprehensive PvP data for the Warsong Gulch
--- battleground. It includes capture the flag objectives, faction bases,
--- strategic locations, and battleground-specific rewards.
---
--- Features:
--- • Capture the flag mechanics
--- • Faction base locations
--- • Strategic point data
--- • Battleground objectives
--- • PvP rewards and marks
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Warsong Gulch data
AtlasTW.InstanceData.BGWarsongGulch = {
    Name = BZ["Warsong Gulch"],
    Location = BZ["Ashenvale"] .. "/" .. BZ["The Barrens"],
    Level = {1, 60},
    Acronym = "WSG",
    MaxPlayers = 10,
    Reputation = {
            { name = BF["Silverwing Sentinels"].." \\ "..BF["Warsong Outriders"], loot = "SentinelsOutriders" },
    },
    Entrances = {
        { letter = "A)", info = L["Silverwing Hold"] .. " (A)" },
        { letter = "B)", info = L["Warsong Lumber Mill"] .. " (H)" }
    },
    Bosses = {}
}