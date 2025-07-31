-- BGAlteracValleySouth.lua - Данные предметов из Альтеракской долины (Юг)
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

-- Данные Альтеракской долины (Юг)
AtlasTW.InstanceData.BGAlteracValleySouth = {
    Name = BZ["Alterac Valley"] .. " (" .. L["South"] .. ")",
    Location = BZ["Hillsbrad Foothills"],
    Level = {51, 60},
    Acronym = "AV",
    MaxPlayers = 40,
    Reputation = {
            { name = BF["Stormpike Guard"].." \\ "..BF["Frostwolf Clan"], loot = "StormpikeFrostwolf" },
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
            defaults = { dropRate = 20 },
            loot = {
                {id = 19105}, --Frost Runed Headdress
                {id = 19113}, --Yeti Hide Bracers
                {id = 19111}, --Winteraxe Epaulets
                {id = 19112}, --Frozen Steel Vambraces
                {},
                {id = 19109, dropRate=13}, --Deep Rooted Ring
                {},
                {id = 19110}, --Cold Forged Blade
                {},
                {id = 17306, disc=L["Quest Item"], dropRate=100}, --Stormpike Soldier's Blood
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
        },
        {
            name = L["Frostwolf Wolf Rider Commander"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "10)",
            name = L["Frostwolf Quartermaster"],
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
        },
        {
            name = L["Frostwolf Banner"],
            color = "|cff9d9d9d",
        },
        {
            prefix = "16)",
            name = L["Steamsaw"] .. " (" .. BF["Alliance"] .. ")",
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
        },
    }
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.BGAlteracValleySouth.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end