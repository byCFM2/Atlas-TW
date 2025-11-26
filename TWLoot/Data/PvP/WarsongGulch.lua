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

local LZ = AtlasTW.Localization.Zones
local LF = AtlasTW.Localization.Factions
local LMD = AtlasTW.Localization.MapData

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Warsong Gulch data
AtlasTW.InstanceData.BGWarsongGulch = {
    Name = LZ["Warsong Gulch"],
    Location = LZ["Ashenvale"] .. "/" .. LZ["The Barrens"],
    Level = {1, 60},
    Acronym = "WSG",
    MaxPlayers = 10,
    Reputation = {
            { name = LF["Silverwing Sentinels"].." \\ "..LF["Warsong Outriders"], loot = "SentinelsOutriders" },
    },
    Entrances = {
        { letter = "A)", info = LMD["Silverwing Hold"] .. " (A)" },
        { letter = "B)", info = LMD["Warsong Lumber Mill"] .. " (H)" }
    },
    Bosses = {}
}