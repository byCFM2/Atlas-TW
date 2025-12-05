---
--- ArathiBasin.lua - Arathi Basin battleground PvP data
---
--- This module contains comprehensive PvP data for the Arathi Basin
--- battleground. It includes resource control objectives, strategic nodes,
--- capture points, and battleground-specific rewards.
---
--- Features:
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

-- Arathi Basin data
AtlasTW.InstanceData.BGArathiBasin = {
    Name = LZ["Arathi Basin"],
    Location = LZ["Arathi Highlands"],
    Level = {20, 60},
    Acronym = "AB",
    MaxPlayers = 15,
    Reputation = {
            { name = LF["The League of Arathor"].." \\ "..LF["The Defilers"], loot = "ArathorDefilers" },
    },
    Entrances = {
        { letter = "A)", info = LMD["Trollbane Hall"] .. " (A)" },
        { letter = "B)", info = LMD["Defiler's Den"] .. " (H)" }
    },
    Bosses = {}
}