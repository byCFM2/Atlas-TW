---
--- ArathiBasin.lua - Arathi Basin battleground PvP data
---
--- This module contains comprehensive PvP data for the Arathi Basin
--- battleground. It includes resource control objectives, strategic nodes,
--- capture points, and battleground-specific rewards.
---
--- Features:
--- • Resource control mechanics
--- • Strategic node locations
--- • Capture point data
--- • Battleground objectives
--- • PvP rewards and marks
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Arathi Basin data
AtlasTW.InstanceData.BGArathiBasin = {
    Name = BZ["Arathi Basin"],
    Location = BZ["Arathi Highlands"],
    Level = {20, 60},
    Acronym = "AB",
    MaxPlayers = 15,
    Reputation = {
            { name = BF["The League of Arathor"].." \\ "..BF["The Defilers"], loot = "ArathorDefilers" },
    },
    Entrances = {
        { letter = "A)", info = L["Trollbane Hall"] .. " (A)" },
        { letter = "B)", info = L["Defiler's Den"] .. " (H)" }
    },
    Bosses = {}
}
