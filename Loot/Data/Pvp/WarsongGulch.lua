-- WarsongGulch.lua - Данные предметов из Ущелья Песни Войны
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Ущелья Песни Войны
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