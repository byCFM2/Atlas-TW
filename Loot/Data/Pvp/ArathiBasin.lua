-- ArathiBasin.lua - Данные предметов из Низины Арати
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Низины Арати
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
