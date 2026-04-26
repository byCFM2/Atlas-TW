---
--- MapMarkers.lua - Map markers module for Atlas-TW
---
--- Integrates ModernMapMarkers functionality into Atlas-TW.
--- Shows icons for dungeons, raids, world bosses, and transport on the World Map.
---
--- @compatible World of Warcraft 1.12
--- @originalauthor tilr & Heallios
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.MapMarkers = {}

local L = AtlasTW.Localization.UI
local LF = AtlasTW.Localization.Factions
local LZ = AtlasTW.Localization.Zones
local LB = AtlasTW.Localization.Bosses
local LMD = AtlasTW.Localization.MapData

local markers = {}
local pinPool = {}
local ZoneMapPoints = {} -- Index for faster lookup

-- Texture Constants
local TEXTURE_PATH = "Interface\\Addons\\Atlas-TW\\Images\\Markers\\"
local TEXTURE_DUNGEON = TEXTURE_PATH .. "dungeon"
local TEXTURE_RAID = TEXTURE_PATH .. "raid"
local TEXTURE_WORLDBOSS = TEXTURE_PATH .. "worldboss"
local TEXTURE_ZEPP = TEXTURE_PATH .. "zepp"
local TEXTURE_BOAT = TEXTURE_PATH .. "boat"
local TEXTURE_TRAM = TEXTURE_PATH .. "tram"

local TEXTURE_MAP = {
    dungeon = TEXTURE_DUNGEON,
    raid = TEXTURE_RAID,
    worldboss = TEXTURE_WORLDBOSS,
    zepp = TEXTURE_ZEPP,
    boat = TEXTURE_BOAT,
    tram = TEXTURE_TRAM
}

-- Marker Data
-- Format: { continent, zoneID, x, y, key, type, info }
-- type: "dungeon", "raid", "worldboss", "zepp", "boat", "tram"
local MapPoints = {
    -- Kalimdor Dungeons
    { 1, "Ashenvale",           0.123, 0.128, "BlackfathomDeeps",          "dungeon",   "24-32" },
    { 1, "Tanaris",             0.66,  0.49,  "CavernsOfTimeBlackMorass",  "dungeon",   "58-60" },
    { 1, "Ashenvale",           0.51,  0.78,  "TheCrescentGrove",          "dungeon",   "32-38" },
    { 1, "Feralas",             0.648, 0.303, "DireMaulEast",              "dungeon",   "55-58" },
    { 1, "Feralas",             0.624, 0.249, "DireMaulNorth",             "dungeon",   "57-60" },
    { 1, "Feralas",             0.604, 0.311, "DireMaulWest",              "dungeon",   "57-60" },
    { 1, "Desolace",            0.29,  0.629, "Maraudon",                  "dungeon",   "46-55" },
    { 1, "Orgrimmar",           0.53,  0.486, "RagefireChasm",             "dungeon",   "13-18" },
    { 1, "The Barrens",         0.488, 0.919, "RazorfenDowns",             "dungeon",   "37-46" },
    { 1, "The Barrens",         0.407, 0.873, "RazorfenKraul",             "dungeon",   "29-38" },
    { 1, "The Barrens",         0.462, 0.357, "WailingCaverns",            "dungeon",   "17-24" },
    { 1, "Tanaris",             0.389, 0.184, "ZulFarrak",                 "dungeon",   "44-54" },
    -- Kalimdor Raids
    { 1, "Hyjal",               0.207, 0.592, "EmeraldSanctum",            "raid",      "60" },
    { 1, "Dustwallow Marsh",    0.53,  0.76,  "OnyxiasLair",               "raid",      "60" },
    { 1, "Silithus",            0.30,  0.95,  "TheRuinsofAhnQiraj",        "raid",      "60" },
    { 1, "Silithus",            0.28,  0.95,  "TheTempleofAhnQiraj",       "raid",      "60" },
    -- Kalimdor World Bosses
    { 1, "Azshara",             0.535, 0.816, "Azuregos",                  "worldboss", "60" },
    { 1, "Desolace",            0.82,  0.80,  "Concavius",                 "worldboss", "60" },
    { 1, "Tanaris",             0.361, 0.762, "Ostarius",                  "worldboss", "60" },
    { 1, "Ashenvale",           0.937, 0.355, "FourDragons",               "worldboss", "60" .. " (" .. LB["Ysondre"] .. ")" }, -- Emerald Dragon - Ysondre
    { 1, "Feralas",             0.512, 0.108, "FourDragons",               "worldboss", "60" .. " (" .. LB["Taerar"] .. ")" },  -- Emerald Dragon - Taerar
    -- Kalimdor Transport
    { 1, "Durotar",             0.51,  0.145, "TransportRoutes",           "zepp",      LZ["Undercity"] },                      -- Zeppelins to UC
    { 1, "Durotar",             0.51,  0.115, "TransportRoutes",           "zepp",      LMD["Grom'Gol"] },                      -- Zeppelins to Grom'Gol
    { 1, "Durotar",             0.41,  0.195, "TransportRoutes",           "zepp",      LZ["Thunder Bluff"] },                  -- Zeppelins to TB
    { 1, "Durotar",             0.41,  0.165, "TransportRoutes",           "zepp",      LMD["Kargath"] },                       -- Zeppelins to Kargath
    { 1, "Thunder Bluff",       0.165, 0.230, "TransportRoutes",           "zepp",      LZ["Orgrimmar"] },                      -- Zeppelin to Orgrimmar
    { 1, "Durotar",             0.598, 0.236, "TransportRoutes",           "boat",      LMD["Revantusk Village"] },             -- Boat to Revantusk Village
    { 1, "The Barrens",         0.636, 0.389, "TransportRoutes",           "boat",      LZ["Booty Bay"] },                      -- Boat to Booty Bay
    { 1, "Darkshore",           0.324, 0.44,  "TransportRoutes",           "boat",      LF["Stormwind"] },                      -- Boat to Stormwind
    { 1, "Darkshore",           0.304, 0.41,  "TransportRoutes",           "boat",      LMD["Alah'Thalas"] },                   -- Boat to Alah'Thalas
    { 1, "Darkshore",           0.333, 0.399, "TransportRoutes",           "boat",      LMD["Rut'Theran Village"] },            -- Boat to Rut'Theran Village
    { 1, "Dustwallow Marsh",    0.718, 0.566, "TransportRoutes",           "boat",      LZ["Menethil Harbor"] },                -- Boat to Menethil Harbor
    { 1, "Teldrassil",           0.552, 0.949, "TransportRoutes",           "boat",      LZ["Auberdine"] },                      -- Boat to Auberdine
    -- Eastern Kingdoms Dungeons
    { 2, "Blackrock Mountain",  0.375, 0.83,  "BlackrockDepths",           "dungeon",   "52-60" },
    { 2, "Blackrock Mountain",  0.33,  0.3,   "BlackrockDepths",           "dungeon",   "52-60" },
    { 2, "Westfall",            0.423, 0.726, "TheDeadmines",              "dungeon",   "17-24" },
    { 2, "Gilneas",             0.30,  0.27,  "GilneasCity",               "dungeon",   "43-49" },
    { 2, "Dun Morogh",          0.23,  0.38,  "Gnomeregan",                "dungeon",   "29-38" },
    { 2, "Searing Gorge",       0.95,  0.53,  "HateforgeQuarry",           "dungeon",   "52-60" },
    { 2, "Deadwind Pass",       0.45,  0.75,  "KarazhanCrypt",             "dungeon",   "58-60" },
    { 2, "Blackrock Mountain",  0.3,   0.3,   "BlackrockSpireLower",       "dungeon",   "55-60" },
    { 2, "Blackrock Mountain",  0.364, 0.879, "BlackrockSpireLower",       "dungeon",   "55-60" },
    { 2, "Tirisfal Glades",     0.85,  0.29,  "ScarletMonasteryGraveyard", "dungeon",   "26-36" },
    { 2, "Tirisfal Glades",     0.87,  0.295, "ScarletMonasteryCathedral", "dungeon",   "35-45" },
    { 2, "Tirisfal Glades",     0.87,  0.33,  "ScarletMonasteryArmory",    "dungeon",   "32-42" },
    { 2, "Tirisfal Glades",     0.85,  0.34,  "ScarletMonasteryLibrary",   "dungeon",   "29-39" },
    { 2, "Western Plaguelands", 0.69,  0.74,  "Scholomance",               "dungeon",   "58-60" },
    { 2, "Silverpine Forest",   0.44,  0.67,  "ShadowfangKeep",            "dungeon",   "22-30" },
    { 2, "Stormwind City",      0.51,  0.675, "TheStockade",               "dungeon",   "24-31" },
    { 2, "Stormwind City",      0.63,  0.58,  "StormwindVault",            "dungeon",   "60" },
    { 2, "Elwynn Forest",       0.29,  0.61,  "StormwindVault",            "dungeon",   "60" },                                  -- Horde Entrance
    { 2, "Eastern Plaguelands", 0.31,  0.14,  "Stratholme",                "dungeon",   "58-60" },
    { 2, "Eastern Plaguelands", 0.47,  0.24,  "Stratholme",                "dungeon",   "58-60" .. " (" .. LMD["Back"] .. ")" }, -- Back Gate
    { 2, "Swamp of Sorrows",    0.701, 0.55,  "TheSunkenTemple",           "dungeon",   "50-60" },
    { 2, "Badlands",            0.429, 0.130, "Uldaman",                   "dungeon",   "41-51" },
    { 2, "Badlands",            0.657, 0.438, "Uldaman",                   "dungeon",   "41-51" .. " (" .. LMD["Back"] .. ")" }, -- Back Entrance
    { 2, "Blackrock Mountain",  0.32,  0.37,  "BlackrockSpireUpper",       "dungeon",   "55-60" },
    { 2, "Blackrock Mountain",  0.39,  0.87,  "BlackrockSpireUpper",       "dungeon",   "55-60" },
    -- Eastern Kingdoms Raids
    { 2, "Blackrock Mountain",  0.33,  0.83,  "BlackwingLair",             "raid",      "60" },
    { 2, "Blackrock Mountain",  0.27,  0.3,   "BlackwingLair",             "raid",      "60" },
    { 2, "Deadwind Pass",       0.46,  0.70,  "LowerKarazhan",             "raid",      "58-60" },
    { 2, "Blackrock Mountain",  0.336, 0.879, "MoltenCore",                "raid",      "60" },
    { 2, "Blackrock Mountain",  0.275, 0.37,  "MoltenCore",                "raid",      "60" },
    { 2, "Eastern Plaguelands", 0.40,  0.28,  "Naxxramas",                 "raid",      "60" },
    { 2, "Stranglethorn Vale",  0.53,  0.172, "ZulGurub",                  "raid",      "60" },
    -- Eastern Kingdoms World Bosses
    { 2, "Deadwind Pass",       0.471, 0.751, "Reaver",                    "worldboss", "60" },
    { 2, "Duskwood",            0.465, 0.357, "FourDragons",               "worldboss", "60" .. " (" .. LB["Lethon"] .. ")" },  -- Emerald Dragon - Lethon
    { 2, "The Hinterlands",     0.632, 0.217, "FourDragons",               "worldboss", "60" .. " (" .. LB["Emeriss"] .. ")" }, -- Emerald Dragon - Emeriss
    { 2, "Blasted Lands",       0.36,  0.753, "LordKazzak",                "worldboss", "60" },
    { 2, "Eastern Plaguelands", 0.082, 0.38,  "Nerubian",                  "worldboss", "60" },
    -- Eastern Kingdoms Transport
    { 2, "Stormwind City",      0.694, 0.294, "TransportRoutes",           "tram",      LZ["Ironforge"] },                                                         -- Tram to Ironforge
    { 2, "Ironforge",           0.762, 0.511, "TransportRoutes",           "tram",      LZ["Stormwind"] },                                                         -- Tram to Stormwind
    { 2, "The Hinterlands",     0.812, 0.794, "TransportRoutes",           "boat",      LMD["Sparkwater Port"] },                                                  -- Boat to Sparkwater Port
    { 2, "Wetlands",            0.068, 0.613, "TransportRoutes",           "boat",      LZ["Theramore Isle"] },                                                    -- Boat to Theramore Isle
    { 2, "Stormwind City",      0.218, 0.563, "TransportRoutes",           "boat",      LZ["Auberdine"] },                                                         -- Boat to Auberdine
    { 2, "Stranglethorn Vale",  0.257, 0.73,  "TransportRoutes",           "boat",      LZ["Ratchet"] },                                                           -- Boat to Ratchet
    { 2, "Tirisfal Glades",     0.61,  0.58,  "TransportRoutes",           "zepp",      LZ["Orgrimmar"] },                                                         -- Zeppelins to Orgrimmar
    { 2, "Tirisfal Glades",     0.63,  0.58,  "TransportRoutes",           "zepp",      LZ["Grom'Gol"] },                                                          -- Zeppelins to Grom'Gol
    { 2, "Stranglethorn Vale",  0.31,  0.265, "TransportRoutes",           "zepp",      LZ["Undercity"] },                                                         -- Zeppelins to UC
    { 2, "Stranglethorn Vale",  0.31,  0.29,  "TransportRoutes",           "zepp",      LZ["Orgrimmar"] },                                                         -- Zeppelins to Orgrimmar
    { 2, "Badlands",            0.075, 0.480, "TransportRoutes",           "zepp",      LZ["Orgrimmar"] },                                                         -- Zeppelin to Orgrimmar
    { 2, "Alah'Thalas",         0.531, 0.047, "TransportRoutes",           "boat",      LZ["Auberdine"] },                                                         -- Boat to Auberdine
    -- PVP Entrances
    { 1, "Ashenvale",           0.61,  0.83,  "BGWarsongGulch",            "dungeon",   "1-60" .. " (" .. L["Battlegrounds"] .. ")" .. " - " .. LF["Alliance"] },  -- Warsong Gulch (Alliance)
    { 1, "The Barrens",         0.47,  0.08,  "BGWarsongGulch",            "dungeon",   "1-60" .. " (" .. L["Battlegrounds"] .. ")" .. " - " .. LF["Horde"] },     -- Warsong Gulch (Horde)
    { 2, "Arathi Highlands",    0.45,  0.46,  "BGArathiBasin",             "dungeon",   "20-60" .. " (" .. L["Battlegrounds"] .. ")" .. " - " .. LF["Alliance"] }, -- Arathi Basin (Alliance)
    { 2, "Arathi Highlands",    0.73,  0.29,  "BGArathiBasin",             "dungeon",   "20-60" .. " (" .. L["Battlegrounds"] .. ")" .. " - " .. LF["Horde"] },    -- Arathi Basin (Horde)
    { 2, "Alterac Mountains",   0.39,  0.81,  "BGAlteracValleyNorth",      "dungeon",   "51-60" .. " (" .. L["Battlegrounds"] .. ")" .. " - " .. LF["Alliance"] }, -- Alterac Valley (Alliance)
    { 2, "Alterac Mountains",   0.638, 0.59,  "BGAlteracValleySouth",      "dungeon",   "51-60" .. " (" .. L["Battlegrounds"] .. ")" .. " - " .. LF["Horde"] },    -- Alterac Valley (Horde)
}

local function OpenAtlasPage(key)
    if not key or not AtlasTW.InstanceData[key] then
        PrintA("Key not found: " .. tostring(key))
        return
    end

    -- Find the key in DropDowns
    for typeIndex, zoneList in pairs(AtlasTW.DropDowns) do
        for zoneIndex, zoneKey in pairs(zoneList) do
            if zoneKey == key then
                AtlasTWOptions.AtlasType = typeIndex
                AtlasTWOptions.AtlasZone = zoneIndex

                -- Prevent OnShow from restoring last opened state
                AtlasTW.SkipRestore = true

                AtlasTWFrame:Show()
                AtlasTW.UpdateDropdownLabels()
                AtlasTW.Refresh()

                -- Close World Map if open
                if WorldMapFrame:IsShown() then
                    HideUIPanel(WorldMapFrame)
                end
                return
            end
        end
    end
    PrintA("Key not found in DropDowns: " .. tostring(key))
end

local function ResetPinState(pin)
    if not pin then
        return
    end
    pin:SetScript("OnUpdate", nil)
    local baseSize = pin.baseSize
    if baseSize then
        pin:SetWidth(baseSize)
        pin:SetHeight(baseSize)
    end
    local parent = pin:GetParent()
    if parent then
        pin:SetFrameLevel(parent:GetFrameLevel() + 3)
    end
end

local function ClearMarkers()
    for _, pin in pairs(markers) do
        ResetPinState(pin)
        pin:Hide()
        tinsert(pinPool, pin)
    end
    markers = {}
end

local function CreateMapPin(parent, x, y, size, texture, key, tooltipInfo)
    local pin = tremove(pinPool)
    if not pin then
        pin = CreateFrame("Button", nil, parent)
        pin.texture = pin:CreateTexture(nil, "OVERLAY")
        pin.texture:SetAllPoints()
    end

    pin:SetParent(parent)
    pin.baseSize = size
    pin:SetWidth(size)
    pin:SetHeight(size)
    pin:ClearAllPoints()
    pin:SetPoint("CENTER", parent, "TOPLEFT", x, -y)
    pin.texture:SetTexture(texture)
    pin:SetFrameLevel(parent:GetFrameLevel() + 3)
    pin:Show()

    pin:SetScript("OnEnter", function()
        -- Hover effect
        pin:SetWidth(size * 1.3)
        pin:SetHeight(size * 1.3)
        pin:SetFrameLevel(pin:GetParent():GetFrameLevel() + 5)
        WorldMapTooltip:SetOwner(pin, "ANCHOR_RIGHT")

        local title = key
        if AtlasTW.InstanceData[key] then
            title = AtlasTW.InstanceData[key].Name
        end

        -- Special handling for transport to show generic name
        if key == "TransportRoutes" then
            title = L["Transport Routes"]
        end

        WorldMapTooltip:SetText(title, 1, 1, 1)

        if tooltipInfo then
            if key == "TransportRoutes" then
                WorldMapTooltip:AddLine(tooltipInfo, 1, 1, 0)
            else
                WorldMapTooltip:AddLine(L["Level"] .. ": " .. tooltipInfo, 1, 1, 0)
            end
        end
        WorldMapTooltip:Show()
    end)

    pin:SetScript("OnLeave", function()
        ResetPinState(pin)
        WorldMapTooltip:Hide()
    end)

    pin:SetScript("OnClick", function()
        ResetPinState(pin)
        WorldMapTooltip:Hide()
        OpenAtlasPage(key)
    end)

    return pin
end

local function GetLocalizedZoneName(enName)
    return LZ[enName] or LMD[enName] or LF[enName] or enName
end

--- Finds marker data by English zone name or key
--- @param searchKey string The Atlas zone key or English zone name to search for
--- @return table|nil The marker data {continent, zoneName, x, y, key, type, info} or nil
function AtlasTW.MapMarkers.FindMarkerByZoneID(searchKey)
    for _, data in pairs(MapPoints) do
        local _, enName, _, _, key, _, _ = unpack(data)
        if key == searchKey or enName == searchKey then
            return data
        end
    end
    return nil
end

--- Resolves a locale-dependent zone ID from an English zone name
--- @param continent number The continent ID
--- @param enName string The English zone name
--- @return number The resolved zone ID for the current locale (index in GetMapZones)
function AtlasTW.MapMarkers.ResolveZoneID(continent, enName)
    local localizedName = GetLocalizedZoneName(enName)
    local zones = { GetMapZones(continent) }
    for i, name in ipairs(zones) do
        if name == localizedName or name == enName then
            return i
        end
    end
    return 0 -- Fallback to continent view
end

local function BuildZoneIndex()
    for _, data in ipairs(MapPoints) do
        local continent, enName = data[1], data[2]
        local localizedName = GetLocalizedZoneName(enName)

        if not ZoneMapPoints[continent] then ZoneMapPoints[continent] = {} end
        if not ZoneMapPoints[continent][localizedName] then ZoneMapPoints[continent][localizedName] = {} end
        table.insert(ZoneMapPoints[continent][localizedName], data)
    end
end

function AtlasTW.MapMarkers.UpdateMarkers()
    if not AtlasTWOptions.ShowMapMarkers then
        ClearMarkers()
        return
    end

    if not WorldMapFrame:IsShown() then
        ClearMarkers()
        return
    end

    -- Lazy initialization of the index
    if not next(ZoneMapPoints) then
        BuildZoneIndex()
    end

    local currentContinent = GetCurrentMapContinent()
    local currentZone = GetCurrentMapZone()
    local zones = { GetMapZones(currentContinent) }
    local currentZoneName = zones[currentZone]

    -- Hide existing markers
    ClearMarkers()

    -- Only process markers for the current zone if any exist
    if ZoneMapPoints[currentContinent] and ZoneMapPoints[currentContinent][currentZoneName] then
        local worldMap = WorldMapDetailFrame
        local mapWidth, mapHeight = worldMap:GetWidth(), worldMap:GetHeight()

        for _, data in ipairs(ZoneMapPoints[currentContinent][currentZoneName]) do
            local _, _, x, y, key, kind, info = unpack(data)

            local size = 30
            local texture = TEXTURE_MAP[kind] or TEXTURE_DUNGEON

            if kind == "zepp" or kind == "boat" then
                size = 26
            elseif kind == "tram" then
                size = 24
            end

            local px, py = x * mapWidth, y * mapHeight
            local pin = CreateMapPin(worldMap, px, py, size, texture, key, info)

            tinsert(markers, pin)
        end
    end
end

-- Initialize
local frame = CreateFrame("Frame")
frame:RegisterEvent("WORLD_MAP_UPDATE")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function()
    if event == "PLAYER_ENTERING_WORLD" then
        if AtlasTWOptions.ShowMapMarkers == nil then
            AtlasTWOptions.ShowMapMarkers = true
        end
        -- Pre-build index on login
        if not next(ZoneMapPoints) then
            BuildZoneIndex()
        end
    end
    AtlasTW.MapMarkers.UpdateMarkers()
end)

-- Secure hook for WorldMapFrame.Hide if possible, or override
local oldWorldMapFrameHide = WorldMapFrame.Hide
WorldMapFrame.Hide = function(self)
    ClearMarkers()
    if oldWorldMapFrameHide then
        oldWorldMapFrameHide(self)
    end
end
