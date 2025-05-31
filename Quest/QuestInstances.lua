-----------------------------------------------------------------------------
-- This function determines which instance is currently shown in Atlas
-- and returns the corresponding instance ID in AtlasKTW.Instances
-----------------------------------------------------------------------------
function KQuest_Instances()
    -- Get the current Atlas map texture
    AtlasKTW.Map = AtlasMap:GetTexture()
    -- Map texture to instance ID lookup table
    local instanceMap = {
        -- Original Instances (1-32)
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheDeadmines"] = 1,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheDeadminesEnt"] = 1,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\WailingCaverns"] = 2,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\WailingCavernsEnt"] = 2,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\RagefireChasm"] = 3,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Uldaman"] = 4,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\UldamanEnt"] = 4,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\BlackrockDepths"] = 5,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\BlackrockMountainEnt"] = 5,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\BlackwingLair"] = 6,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\BlackfathomDeeps"] = 7,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\BlackfathomDeepsEnt"] = 7,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\BlackrockSpireLower"] = 8,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\BlackrockSpireUpper"] = 9,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\DireMaulEast"] = 10,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\DireMaulEnt"] = 10,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\DireMaulNorth"] = 11,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\DireMaulWest"] = 12,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Maraudon"] = 13,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\MaraudonEnt"] = 13,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\MoltenCore"] = 14,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Naxxramas"] = 15,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\OnyxiasLair"] = 16,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\RazorfenDowns"] = 17,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\RazorfenKraul"] = 18,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\SMLibrary"] = 19,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\SMArmory"] = 20,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\SMCathedral"] = 21,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\SMGraveyard"] = 22,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\SMEnt"] = 22,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Scholomance"] = 23,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\ShadowfangKeep"] = 24,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Stratholme"] = 25,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheRuinsofAhnQiraj"] = 26,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheStockade"] = 27,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheSunkenTemple"] = 28,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheSunkenTempleEnt"] = 28,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheTempleofAhnQiraj"] = 29,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\ZulFarrak"] = 30,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\ZulGurub"] = 31,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Gnomeregan"] = 32,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\GnomereganEnt"] = 32,
        -- Outdoor Raids (33-35)
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\FourDragons"] = 33,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Azuregos"] = 34,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\LordKazzak"] = 35,
        -- Battlegrounds (36-38)
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\AlteracValleyNorth"] = 36,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\AlteracValleySouth"] = 36,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\ArathiBasin"] = 37,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\WarsongGulch"] = 38,
        -- Turtle-WOW Instances (39-65)
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TheCrescentGrove"] = 39,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Concavius"] = 40,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\KarazhanCrypt"] = 41,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Nerubian"] = 42,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Reaver"] = 43,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Turtlhu"] = 44,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\CavernsOfTimeBlackMorass"] = 45,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\HateforgeQuarry"] = 46,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\StormwindVault"] = 57,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Ostarius"] = 58,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\CowKing"] = 59,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\GilneasCity"] = 61,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\LowerKarazhan"] = 62,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\EmeraldSanctum"] = 63,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TowerofKarazhan"] = 64,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\Clackora"] = 65,
        -- Maps and Routes (98)
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\TransportRoutes"] = 98,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\DLEast"] = 98,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\DLWest"] = 98,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\FPAllianceEast"] = 98,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\FPAllianceWest"] = 98,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\FPHordeEast"] = 98,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\FPHordeWest"] = 98,
        ["Interface\\AddOns\\Atlas-TW\\Images\\Maps\\RareMobs"] = 98,
    }
    -- Look up the instance ID from the map texture
    AtlasKTW.Instances = instanceMap[AtlasKTW.Map] or 99
end

--[[
--- Instance Numbers ---
---------------------------
1 = Deadmines (VC)
2 = Wailing Caverns (WC)
3 = Ragefire Chasm (RFC)
4 = Uldaman (ULD)
5 = Blackrock Depths (BRD)
6 = Blackwing Lair (BWL)
7 = Blackfathom Deeps (BFD)
8 = Lower Blackrock Spire (LBRS)
9 = Upper Blackrock Spire (UBRS)
10 = Dire Maul East (DM)
11 = Dire Maul North (DM)
12 = Dire Maul West (DM)
13 = Maraudon (Mara)
14 = Molten Core (MC)
15 = Naxxramas (Naxx)
16 = Onyxia's Lair (Ony)
17 = Razorfen Downs (RFD)
18 = Razorfen Kraul (RFK)
19 = SM: Library (SM Lib)
20 = SM: Armory (SM Arm)
21 = SM: Cathedral (SM Cath)
22 = SM: Graveyard (SM GY)
23 = Scholomance (Scholo)
24 = Shadowfang Keep (SFK)
25 = Stratholme (Strat)
26 = The Ruins of Ahn'Qiraj (AQ20)
27 = The Stockade (Stocks)
28 = Sunken Temple (ST)
29 = The Temple of Ahn'Qiraj (AQ40)
30 = Zul'Farrak (ZF)
31 = Zul'Gurub (ZG)
32 = Gnomeregan (Gnomer)
33 = Four Dragons
34 = Azuregos
35 = Lord Kazzak
36 = Alterac Valley (AV)
37 = Arathi Basin (AB)
38 = Warsong Gulch (WSG)
39 = The Crescent Grove (TCG)
40 = Concavius (Concavius)
45 = Caverns Of Time: Black Morass
61 = Gilneas City
62 = LowerKarazhan
63 = Emerald Sanctum
64 = TowerofKarazhan
65 = Clackora
98 = Transport Routes
98 = Dungeon Locations East
98 = Dungeon Locations West
98 = Flight Path: Alliance East
98 = Flight Path: Alliance West
98 = Flight Path: Horde East
98 = Flight Path: Horde West
98 = Rare Mobs
99 = default "rest"
]]