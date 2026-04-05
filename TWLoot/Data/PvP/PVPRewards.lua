---
--- PVPRewards.lua - Player vs Player reward data tables
---
--- This module contains comprehensive PvP reward data for all battlegrounds
--- and honor systems in World of Warcraft. It includes honor rewards,
--- PvP sets, battleground marks, and ranking system items.
---
--- Features:
--- • Complete PvP reward tables
--- • Honor system items
--- • Battleground mark rewards
--- • Ranking system equipment
--- • PvP set collections
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

local L = AtlasTW.Localization.UI
local LF = AtlasTW.Localization.Factions

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

local pvpRewards = {
	PVPWeapons = {
		{ id = 33883, disc = LF["Alliance"]..", "..L["Honor: "].." 18000" }, -- Strategist's Stave
		{ id = 33881, disc = LF["Alliance"]..", "..L["Honor: "].." 18000" }, -- Strategist's Demolisher
		{ id = 33894, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Strategist's Mageblade
		{ id = 33895, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Strategist's Tome of Power
		{ id = 33904, disc = LF["Horde"]..", "..L["Honor: "].." 18000" }, -- Strategist's War Staff
		{ id = 33902, disc = LF["Horde"]..", "..L["Honor: "].." 18000" }, -- Strategist's Destroyer
		{ id = 33915, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Strategist's Spellblade
		{ id = 33916, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Strategist's Tome of Destruction
		{},
		{ id = 33891, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Physician's Warhammer
		{ id = 33896, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Physician's Tome of Restoration
		{ id = 33912, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Physician's Battle Mace
		{ id = 33917, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Physician's Tome of Mending
		{},
		{ id = 33879, disc = LF["Alliance"]..", "..L["Honor: "].." 18000" }, -- Partisan's Claymore
		{ id = 33880, disc = LF["Alliance"]..", "..L["Honor: "].." 18000" }, -- Partisan's Battle Hammer
		{ id = 33882, disc = LF["Alliance"]..", "..L["Honor: "].." 18000" }, -- Partisan's Sunderer
		{ id = 33884, disc = LF["Alliance"]..", "..L["Honor: "].." 18000" }, -- Partisan's Glaive
		{ id = 33885, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Aegis
		{ id = 33886, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Longsword
		{ id = 33887, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Punisher
		{ id = 33888, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Handaxe
		{ id = 33889, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Left Hand Blade
		{ id = 33890, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Right Hand Blade
		{ id = 33892, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Swiftblade
		{ id = 33893, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Dirk
		{ id = 33897, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Hand Cannon
		{ id = 33898, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Repeater
		{ id = 33899, disc = LF["Alliance"]..", "..L["Honor: "].." 14000" }, -- Partisan's Bullseye
		{ id = 33900, disc = LF["Horde"]..", "..L["Honor: "].." 18000" }, -- Partisan's Greatsword
		{ id = 33901, disc = LF["Horde"]..", "..L["Honor: "].." 18000" }, -- Partisan's Pulverizer
		{ id = 33903, disc = LF["Horde"]..", "..L["Honor: "].." 18000" }, -- Partisan's Battle Axe
		{ id = 33905, disc = LF["Horde"]..", "..L["Honor: "].." 18000" }, -- Partisan's Pig Sticker
		{ id = 33906, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Shield Wall
		{ id = 33907, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Blade
		{ id = 33908, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Bludgeon
		{ id = 33909, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Cleaver
		{ id = 33910, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Left Claw
		{ id = 33911, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Right Claw
		{ id = 33913, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Quickblade
		{ id = 33914, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Razor
		{ id = 33918, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Street Sweeper
		{ id = 33919, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Crossbow
		{ id = 33920, disc = LF["Horde"]..", "..L["Honor: "].." 14000" }, -- Partisan's Recurve
		{},
		{ id = 18873, disc = L["Alliance"]..", "..L["Honor: "].." 48000", container = { 33883 } }, -- Executioner's Stave
		{ id = 23455, disc = L["Alliance"]..", "..L["Honor: "].." 48000", container = { 33881 } }, -- Executioner's Demolisher
		{ id = 23451, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33894 } }, -- Executioner's Mageblade
		{ id = 23452, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33895 } }, -- Executioner's Tome of Power
		{ id = 18874, disc = L["Horde"]..", "..L["Honor: "].." 48000", container = { 33904 } }, -- Executioner's War Staff
		{ id = 23465, disc = L["Horde"]..", "..L["Honor: "].." 48000", container = { 33902 } }, -- Executioner's Destroyer
		{ id = 23466, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33915 } }, -- Executioner's Spellblade
		{ id = 23468, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33916 } }, -- Executioner's Tome of Destruction
		{},
		{ id = 23454, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33891 } }, -- Field Medic's Warhammer
		{ id = 23453, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33896 } }, -- Field Medic's Tome of Restoration
		{ id = 23464, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33912 } }, -- Field Medic's Battle Mace
		{ id = 23469, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33917 } }, -- Field Medic's Tome of Mending
		{},
		{ id = 18876, disc = L["Alliance"]..", "..L["Honor: "].." 48000", container = { 33879 } }, -- Veteran's Claymore
		{ id = 18867, disc = L["Alliance"]..", "..L["Honor: "].." 48000", container = { 33880 } }, -- Veteran's Battle Hammer
		{ id = 18830, disc = L["Alliance"]..", "..L["Honor: "].." 48000", container = { 33882 } }, -- Veteran's Sunderer
		{ id = 18869, disc = L["Alliance"]..", "..L["Honor: "].." 48000", container = { 33884 } }, -- Veteran's Glaive
		{ id = 18825, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33885 } }, -- Veteran's Aegis
		{ id = 12584, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33886 } }, -- Veteran's Longsword
		{ id = 18865, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33887 } }, -- Veteran's Punisher
		{ id = 18827, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33888 } }, -- Veteran's Handaxe
		{ id = 18847, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33889 } }, -- Veteran's Left Hand Blade
		{ id = 18843, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33890 } }, -- Veteran's Right Hand Blade
		{ id = 23456, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33892 } }, -- Veteran's Swiftblade
		{ id = 18838, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33893 } }, -- Veteran's Dirk
		{ id = 18855, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33897 } }, -- Veteran's Hand Cannon
		{ id = 18836, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33898 } }, -- Veteran's Repeater
		{ id = 18833, disc = L["Alliance"]..", "..L["Honor: "].." 32000", container = { 33899 } }, -- Veteran's Bullseye
		{ id = 18877, disc = L["Horde"]..", "..L["Honor: "].." 48000", container = { 33900 } }, -- Veteran's Greatsword
		{ id = 18868, disc = L["Horde"]..", "..L["Honor: "].." 48000", container = { 33901 } }, -- Veteran's Pulverizer
		{ id = 18831, disc = L["Horde"]..", "..L["Honor: "].." 48000", container = { 33903 } }, -- Veteran's Battle Axe
		{ id = 18871, disc = L["Horde"]..", "..L["Honor: "].." 48000", container = { 33905 } }, -- Veteran's Pig Sticker
		{ id = 18826, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33906 } }, -- Veteran's Shield Wall
		{ id = 16345, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33907 } }, -- Veteran's Blade
		{ id = 18866, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33908 } }, -- Veteran's Bludgeon
		{ id = 18828, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33909 } }, -- Veteran's Cleaver
		{ id = 18848, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33910 } }, -- Veteran's Left Claw
		{ id = 18844, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33911 } }, -- Veteran's Right Claw
		{ id = 23467, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33913 } }, -- Veteran's Quickblade
		{ id = 18840, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33914 } }, -- Veteran's Razor
		{ id = 18860, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33918 } }, -- Veteran's Street Sweeper
		{ id = 18837, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33919 } }, -- Veteran's Crossbow
		{ id = 18835, disc = L["Horde"]..", "..L["Honor: "].." 32000", container = { 33920 } }, -- Veteran's Recurve
	},
	PvP60Accessories = {
		{ id = 18839, disc=L["Consumable"] }, -- Combat Healing Potion+
		{},
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 1"}, --*1
		{ id = 15196 }, -- Private's Tabard+
		{},
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 2"},
		{ id = 18862 }, -- Insignia of the Alliance
		{ id = 18859 }, -- Insignia of the Alliance
		{ id = 18858 }, -- Insignia of the Alliance
		{ id = 18857 }, -- Insignia of the Alliance
		{ id = 18863 }, -- Insignia of the Alliance
		{ id = 18856 }, -- Insignia of the Alliance
		{ id = 18864 }, -- Insignia of the Alliance
		{ id = 18854 }, -- Insignia of the Alliance
		{},
		{ id = 18841, disc=L["Consumable"] }, -- Combat Mana Potion --*1+
		{},
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 1"},
		{ id = 15197 }, -- Scout's Tabard+
		{},
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 2"},
		{ id = 18851 }, -- Insignia of the Horde
		{ id = 18850 }, -- Insignia of the Horde
		{ id = 18852 }, -- Insignia of the Horde
		{ id = 18849 }, -- Insignia of the Horde
		{ id = 18853 }, -- Insignia of the Horde
		{ id = 18846 }, -- Insignia of the Horde
		{ id = 18845 }, -- Insignia of the Horde
		{ id = 18834 }, -- Insignia of the Horde
		{},
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 3"}, --*1
		{ id = 18440 }, -- Sergeant's Cape 3
		{ id = 18441 }, -- Sergeant's Cape 3
		{ id = 16342 }, -- Sergeant's Cape 3
		{},
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 4"},
		{ id = 18442 }, -- Master Sergeant's Insignia 4
		{ id = 18444 }, -- Master Sergeant's Insignia 4
		{ id = 18443 }, -- Master Sergeant's Insignia 4
		{},
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 5"},
		{ id = 18457 }, -- Sergeant Major's Silk Cuffs 5
		{ id = 18456 }, -- Sergeant Major's Silk Cuffs 5
		{},
		{ id = 18455 }, -- Sergeant Major's Dragonhide Armsplints 5 *15
		--Horde
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 3"}, --*1
		{ id = 18427 }, -- Sergeant's Cloak 3
		{ id = 16341 }, -- Sergeant's Cloak 3
		{ id = 18461 }, -- Sergeant's Cloak 3
		{},
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 4"},
		{ id = 15200 }, -- Senior Sergeant's Insignia 4
		{ id = 18428 }, -- Senior Sergeant's Insignia 4
		{ id = 16335 }, -- Senior Sergeant's Insignia 4
		{},
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 5"},
		{ id = 18437 }, -- First Sergeant's Silk Cuffs 5
		{ id = 16486 }, -- First Sergeant's Silk Cuffs 5
		{},
		{ id = 18436 }, -- First Sergeant's Dragonhide Armguards 5 *15
		{ id = 18454 }, -- Sergeant Major's Dragonhide Armsplints 5 *1 alliance
		{},
		{ id = 18453 }, -- Sergeant Major's Leather Armsplints 5
		{ id = 18452 }, -- Sergeant Major's Leather Armsplints 5
		{},
		{ id = 18449 }, -- Sergeant Major's Chain Armguards 5
		{ id = 18448 }, -- Sergeant Major's Chain Armguards 5
		{},
		{ id = 18447 }, -- Sergeant Major's Plate Wristguards 5
		{ id = 18445 }, -- Sergeant Major's Plate Wristguards 5
		{},
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 6"},
		{ id = 15198 }, -- Knight's Colors 6
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 9"},
		{ id = 18606, disc=L["Misc"] }, -- Alliance Battle Standard 9
		{ id = 18434 }, -- First Sergeant's Dragonhide Armguards 5 *1 horde
		{},
		{ id = 18435 }, -- First Sergeant's Leather Armguards 5
		{ id = 16497 }, -- First Sergeant's Leather Armguards 5
		{},
		{ id = 18432 }, -- First Sergeant's Mail Wristguards 5
		{ id = 16532 }, -- First Sergeant's Mail Wristguards 5
		{},
		{ id = 18430 }, -- First Sergeant's Plate Bracers 5
		{ id = 18429 }, -- First Sergeant's Plate Bracers 5
		{},
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 6"},
		{ id = 15199 }, -- Stone Guard's Herald 6
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 9"},
		{ id = 18607, disc=L["Misc"] }, -- Horde Battle Standard 9
		{},
		{ id = 98731 }, -- Gladiator's Tunic
	},
	PVPHunter = {
		{ id = 33440, disc = L["Honor: "].." 5000" }, -- Combatant's Chain Helm
		{ id = 33441, disc = L["Honor: "].." 4000" }, -- Combatant's Chain Spaulders
		{ id = 33442, disc = L["Honor: "].." 5000" }, -- Combatant's Chain Breastplate
		{ id = 33443, disc = L["Honor: "].." 3000" }, -- Combatant's Chain Grips
		{ id = 33444, disc = L["Honor: "].." 4000" }, -- Combatant's Chain Legguards
		{ id = 33445, disc = L["Honor: "].." 3000" }, -- Combatant's Chain Boots
		{},
		{ id = 33716, disc = L["Honor: "].." 5000" }, -- Combatant's Chain Helm
		{ id = 33717, disc = L["Honor: "].." 4000" }, -- Combatant's Chain Spaulders
		{ id = 33718, disc = L["Honor: "].." 5000" }, -- Combatant's Chain Breastplate
		{ id = 33719, disc = L["Honor: "].." 3000" }, -- Combatant's Chain Grips
		{ id = 33720, disc = L["Honor: "].." 4000" }, -- Combatant's Chain Legguards
		{ id = 33721, disc = L["Honor: "].." 3000" }, -- Combatant's Chain Boots
		{},
		{},
		{ id = 33446, disc = L["Honor: "].." 19000", container = { 33440 } }, -- Partisan's Chain Helm
		{ id = 33447, disc = L["Honor: "].." 19000", container = { 33441 } }, -- Partisan's Chain Spaulders
		{ id = 33448, disc = L["Honor: "].." 22000", container = { 33442 } }, -- Partisan's Chain Breastplate
		{ id = 33449, disc = L["Honor: "].." 20000", container = { 33443 } }, -- Partisan's Chain Grips
		{ id = 33450, disc = L["Honor: "].." 22000", container = { 33444 } }, -- Partisan's Chain Legguards
		{ id = 33451, disc = L["Honor: "].." 18000", container = { 33445 } }, -- Partisan's Chain Boots
		{},
		{ id = 33722, disc = L["Honor: "].." 19000", container = { 33716 } }, -- Partisan's Chain Helm
		{ id = 33723, disc = L["Honor: "].." 19000", container = { 33717 } }, -- Partisan's Chain Spaulders
		{ id = 33724, disc = L["Honor: "].." 22000", container = { 33718 } }, -- Partisan's Chain Breastplate
		{ id = 33725, disc = L["Honor: "].." 20000", container = { 33719 } }, -- Partisan's Chain Grips
		{ id = 33726, disc = L["Honor: "].." 22000", container = { 33720 } }, -- Partisan's Chain Legguards
		{ id = 33727, disc = L["Honor: "].." 18000", container = { 33721 } }, -- Partisan's Chain Boots
		{},
		{},
		{ id = 33452, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33446 } }, -- Veteran's Chain Helm
		{ id = 33453, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33447 } }, -- Veteran's Chain Spaulders
		{ id = 33454, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33448 } }, -- Veteran's Chain Breastplate
		{ id = 33455, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33449 } }, -- Veteran's Chain Grips
		{ id = 33456, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33450 } }, -- Veteran's Chain Legguards
		{ id = 33457, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33451 } }, -- Veteran's Chain Boots
		{},
		{ id = 33728, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33722 } }, -- Veteran's Chain Helm
		{ id = 33729, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33723 } }, -- Veteran's Chain Spaulders
		{ id = 33730, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33724 } }, -- Veteran's Chain Breastplate
		{ id = 33731, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33725 } }, -- Veteran's Chain Grips
		{ id = 33732, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33726 } }, -- Veteran's Chain Legguards
		{ id = 33733, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33727 } }, -- Veteran's Chain Boots
	},
	PVPMage = {
		{ id = 33422, disc = L["Honor: "].." 5000" }, -- Tactician's Coronet
		{ id = 33423, disc = L["Honor: "].." 4000" }, -- Tactician's Silk Spaulders
		{ id = 33424, disc = L["Honor: "].." 5000" }, -- Tactician's Silk Vestments
		{ id = 33425, disc = L["Honor: "].." 3000" }, -- Tactician's Silk Gloves
		{ id = 33426, disc = L["Honor: "].." 4000" }, -- Tactician's Silk Leggings
		{ id = 33427, disc = L["Honor: "].." 3000" }, -- Tactician's Silk Footwraps
		{},
		{ id = 33698, disc = L["Honor: "].." 5000" }, -- Tactician's Coronet
		{ id = 33699, disc = L["Honor: "].." 4000" }, -- Tactician's Silk Spaulders
		{ id = 33700, disc = L["Honor: "].." 5000" }, -- Tactician's Silk Vestments
		{ id = 33701, disc = L["Honor: "].." 3000" }, -- Tactician's Silk Gloves
		{ id = 33702, disc = L["Honor: "].." 4000" }, -- Tactician's Silk Leggings
		{ id = 33703, disc = L["Honor: "].." 3000" }, -- Tactician's Silk Footwraps
		{},
		{},
		{ id = 33428, disc = L["Honor: "].." 19000", container = { 33422 } }, -- Strategist's Coronet
		{ id = 33429, disc = L["Honor: "].." 19000", container = { 33423 } }, -- Strategist's Silk Spaulders
		{ id = 33430, disc = L["Honor: "].." 22000", container = { 33424 } }, -- Strategist's Silk Vestments
		{ id = 33431, disc = L["Honor: "].." 20000", container = { 33425 } }, -- Strategist's Silk Gloves
		{ id = 33432, disc = L["Honor: "].." 22000", container = { 33426 } }, -- Strategist's Silk Leggings
		{ id = 33433, disc = L["Honor: "].." 18000", container = { 33427 } }, -- Strategist's Silk Footwraps
		{},
		{ id = 33704, disc = L["Honor: "].." 19000", container = { 33698 } }, -- Strategist's Coronet
		{ id = 33705, disc = L["Honor: "].." 19000", container = { 33699 } }, -- Strategist's Silk Spaulders
		{ id = 33706, disc = L["Honor: "].." 22000", container = { 33700 } }, -- Strategist's Silk Vestments
		{ id = 33707, disc = L["Honor: "].." 20000", container = { 33701 } }, -- Strategist's Silk Gloves
		{ id = 33708, disc = L["Honor: "].." 22000", container = { 33702 } }, -- Strategist's Silk Leggings
		{ id = 33709, disc = L["Honor: "].." 18000", container = { 33703 } }, -- Strategist's Silk Footwraps
		{},
		{},
		{ id = 33434, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33428 } }, -- Executor's Coronet
		{ id = 33435, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33429 } }, -- Executor's Silk Spaulders
		{ id = 33436, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33430 } }, -- Executor's Silk Vestments
		{ id = 33437, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33431 } }, -- Executor's Silk Gloves
		{ id = 33438, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33432 } }, -- Executor's Silk Leggings
		{ id = 33439, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33433 } }, -- Executor's Silk Footwraps
		{},
		{ id = 33710, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33704 } }, -- Executor's Coronet
		{ id = 33711, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33705 } }, -- Executor's Silk Spaulders
		{ id = 33712, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33706 } }, -- Executor's Silk Vestments
		{ id = 33713, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33707 } }, -- Executor's Silk Gloves
		{ id = 33714, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33708 } }, -- Executor's Silk Leggings
		{ id = 33715, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33709 } }, -- Executor's Silk Footwraps
	},
	PVPPriest = {
		{ id = 33620, disc = L["Honor: "].." 5000" }, -- Tactician's Headdress
		{ id = 33621, disc = L["Honor: "].." 4000" }, -- Tactician's Satin Mantle
		{ id = 33622, disc = L["Honor: "].." 5000" }, -- Tactician's Satin Vestments
		{ id = 33623, disc = L["Honor: "].." 3000" }, -- Tactician's Satin Gloves
		{ id = 33624, disc = L["Honor: "].." 4000" }, -- Tactician's Satin Pants
		{ id = 33625, disc = L["Honor: "].." 3000" }, -- Tactician's Satin Sandals
		{},
		{ id = 33806, disc = L["Honor: "].." 5000" }, -- Tactician's Headdress
		{ id = 33807, disc = L["Honor: "].." 4000" }, -- Tactician's Satin Mantle
		{ id = 33808, disc = L["Honor: "].." 5000" }, -- Tactician's Satin Vestments
		{ id = 33809, disc = L["Honor: "].." 3000" }, -- Tactician's Satin Gloves
		{ id = 33810, disc = L["Honor: "].." 4000" }, -- Tactician's Satin Pants
		{ id = 33811, disc = L["Honor: "].." 3000" }, -- Tactician's Satin Sandals
		{},
		{},
		{ id = 33626, disc = L["Honor: "].." 19000", container = { 33620 } }, -- Strategist's Headdress
		{ id = 33627, disc = L["Honor: "].." 19000", container = { 33621 } }, -- Strategist's Satin Mantle
		{ id = 33628, disc = L["Honor: "].." 22000", container = { 33622 } }, -- Strategist's Satin Vestments
		{ id = 33629, disc = L["Honor: "].." 20000", container = { 33623 } }, -- Strategist's Satin Gloves
		{ id = 33630, disc = L["Honor: "].." 22000", container = { 33624 } }, -- Strategist's Satin Pants
		{ id = 33631, disc = L["Honor: "].." 18000", container = { 33625 } }, -- Strategist's Satin Sandals
		{},
		{ id = 33812, disc = L["Honor: "].." 19000", container = { 33806 } }, -- Strategist's Headdress
		{ id = 33813, disc = L["Honor: "].." 19000", container = { 33807 } }, -- Strategist's Satin Mantle
		{ id = 33814, disc = L["Honor: "].." 22000", container = { 33808 } }, -- Strategist's Satin Vestments
		{ id = 33815, disc = L["Honor: "].." 20000", container = { 33809 } }, -- Strategist's Satin Gloves
		{ id = 33816, disc = L["Honor: "].." 22000", container = { 33810 } }, -- Strategist's Satin Pants
		{ id = 33817, disc = L["Honor: "].." 18000", container = { 33811 } }, -- Strategist's Satin Sandals
		{},
		{},
		{ id = 33632, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33626 } }, -- Executor's Headdress
		{ id = 33633, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33627 } }, -- Executor's Satin Mantle
		{ id = 33634, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33628 } }, -- Executor's Satin Vestments
		{ id = 33635, disc = L["Honor: "].." 67000, ".. L["Conquest Points: "].." 3000", container = { 33629 } }, -- Executor's Satin Gloves
		{ id = 33636, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33630 } }, -- Executor's Satin Pants
		{ id = 33637, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3000", container = { 33631 } }, -- Executor's Satin Sandals
		{},
		{ id = 33818, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33812 } }, -- Executor's Headdress
		{ id = 33819, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33813 } }, -- Executor's Satin Mantle
		{ id = 33820, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33814 } }, -- Executor's Satin Vestments
		{ id = 33821, disc = L["Honor: "].." 67000, ".. L["Conquest Points: "].." 3000", container = { 33815 } }, -- Executor's Satin Gloves
		{ id = 33822, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33816 } }, -- Executor's Satin Pants
		{ id = 33823, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3000", container = { 33817 } }, -- Executor's Satin Sandals
		{},
		{},
		{ id = 33638, disc = L["Honor: "].." 5000" }, -- Corpsman's Headdress
		{ id = 33639, disc = L["Honor: "].." 4000" }, -- Corpsman's Satin Mantle
		{ id = 33640, disc = L["Honor: "].." 5000" }, -- Corpsman's Satin Vestments
		{ id = 33641, disc = L["Honor: "].." 3000" }, -- Corpsman's Satin Gloves
		{ id = 33642, disc = L["Honor: "].." 4000" }, -- Corpsman's Satin Pants
		{ id = 33643, disc = L["Honor: "].." 3000" }, -- Corpsman's Satin Sandals
		{},
		{ id = 33824, disc = L["Honor: "].." 5000" }, -- Corpsman's Headdress
		{ id = 33825, disc = L["Honor: "].." 4000" }, -- Corpsman's Satin Mantle
		{ id = 33826, disc = L["Honor: "].." 5000" }, -- Corpsman's Satin Vestments
		{ id = 33827, disc = L["Honor: "].." 3000" }, -- Corpsman's Satin Gloves
		{ id = 33828, disc = L["Honor: "].." 4000" }, -- Corpsman's Satin Pants
		{ id = 33829, disc = L["Honor: "].." 3000" }, -- Corpsman's Satin Sandals
		{},
		{},
		{ id = 33644, disc = L["Honor: "].." 19000", container = { 33638 } }, -- Physician's Headdress
		{ id = 33645, disc = L["Honor: "].." 19000", container = { 33639 } }, -- Physician's Satin Mantle
		{ id = 33646, disc = L["Honor: "].." 22000", container = { 33640 } }, -- Physician's Satin Vestments
		{ id = 33647, disc = L["Honor: "].." 20000", container = { 33641 } }, -- Physician's Satin Gloves
		{ id = 33648, disc = L["Honor: "].." 22000", container = { 33642 } }, -- Physician's Satin Pants
		{ id = 33649, disc = L["Honor: "].." 18000", container = { 33643 } }, -- Physician's Satin Sandals
		{},
		{ id = 33830, disc = L["Honor: "].." 19000", container = { 33824 } }, -- Physician's Headdress
		{ id = 33831, disc = L["Honor: "].." 19000", container = { 33825 } }, -- Physician's Satin Mantle
		{ id = 33832, disc = L["Honor: "].." 22000", container = { 33826 } }, -- Physician's Satin Vestments
		{ id = 33833, disc = L["Honor: "].." 20000", container = { 33827 } }, -- Physician's Satin Gloves
		{ id = 33834, disc = L["Honor: "].." 22000", container = { 33828 } }, -- Physician's Satin Pants
		{ id = 33835, disc = L["Honor: "].." 18000", container = { 33829 } }, -- Physician's Satin Sandals
		{},
		{},
		{ id = 33650, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33644 } }, -- Field Medic's Headdress
		{ id = 33651, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33645 } }, -- Field Medic's Satin Mantle
		{ id = 33652, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33646 } }, -- Field Medic's Satin Vestments
		{ id = 33653, disc = L["Honor: "].." 67000, ".. L["Conquest Points: "].." 3000", container = { 33647 } }, -- Field Medic's Satin Gloves
		{ id = 33654, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33648 } }, -- Field Medic's Satin Pants
		{ id = 33655, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3000", container = { 33649 } }, -- Field Medic's Satin Sandals
		{},
		{ id = 33836, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33830 } }, -- Field Medic's Headdress
		{ id = 33837, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33831 } }, -- Field Medic's Satin Mantle
		{ id = 33838, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33832 } }, -- Field Medic's Satin Vestments
		{ id = 33839, disc = L["Honor: "].." 67000, ".. L["Conquest Points: "].." 3000", container = { 33833 } }, -- Field Medic's Satin Gloves
		{ id = 33840, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33834 } }, -- Field Medic's Satin Pants
		{ id = 33841, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3000", container = { 33835 } }, -- Field Medic's Satin Sandals
	},
	PVPWarlock = {
		{ id = 33458, disc = L["Honor: "].." 5000" }, -- Tactician's Coronal
		{ id = 33459, disc = L["Honor: "].." 4000" }, -- Tactician's Dreadweave Shoulders
		{ id = 33460, disc = L["Honor: "].." 5000" }, -- Tactician's Dreadweave Robe
		{ id = 33461, disc = L["Honor: "].." 3000" }, -- Tactician's Dreadweave Gloves
		{ id = 33462, disc = L["Honor: "].." 4000" }, -- Tactician's Dreadweave Leggings
		{ id = 33463, disc = L["Honor: "].." 3000" }, -- Tactician's Dreadweave Boots
		{},
		{ id = 33734, disc = L["Honor: "].." 5000" }, -- Tactician's Coronal
		{ id = 33735, disc = L["Honor: "].." 4000" }, -- Tactician's Dreadweave Shoulders
		{ id = 33736, disc = L["Honor: "].." 5000" }, -- Tactician's Dreadweave Robe
		{ id = 33737, disc = L["Honor: "].." 3000" }, -- Tactician's Dreadweave Gloves
		{ id = 33738, disc = L["Honor: "].." 4000" }, -- Tactician's Dreadweave Leggings
		{ id = 33739, disc = L["Honor: "].." 3000" }, -- Tactician's Dreadweave Boots
		{},
		{},
		{ id = 33464, disc = L["Honor: "].." 19000", container = { 33458 } }, -- Strategist's Coronal
		{ id = 33465, disc = L["Honor: "].." 19000", container = { 33459 } }, -- Strategist's Dreadweave Shoulders
		{ id = 33466, disc = L["Honor: "].." 22000", container = { 33460 } }, -- Strategist's Dreadweave Robe
		{ id = 33467, disc = L["Honor: "].." 20000", container = { 33461 } }, -- Strategist's Dreadweave Gloves
		{ id = 33468, disc = L["Honor: "].." 22000", container = { 33462 } }, -- Strategist's Dreadweave Leggings
		{ id = 33469, disc = L["Honor: "].." 18000", container = { 33463 } }, -- Strategist's Dreadweave Boots
		{},
		{ id = 33740, disc = L["Honor: "].." 19000", container = { 33734 } }, -- Strategist's Coronal
		{ id = 33741, disc = L["Honor: "].." 19000", container = { 33735 } }, -- Strategist's Dreadweave Shoulders
		{ id = 33742, disc = L["Honor: "].." 22000", container = { 33736 } }, -- Strategist's Dreadweave Robe
		{ id = 33743, disc = L["Honor: "].." 20000", container = { 33737 } }, -- Strategist's Dreadweave Gloves
		{ id = 33744, disc = L["Honor: "].." 22000", container = { 33738 } }, -- Strategist's Dreadweave Leggings
		{ id = 33745, disc = L["Honor: "].." 18000", container = { 33739 } }, -- Strategist's Dreadweave Boots
		{},
		{},
		{ id = 33470, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33464 } }, -- Executor's Coronal
		{ id = 33471, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33465 } }, -- Executor's Dreadweave Shoulders
		{ id = 33472, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33466 } }, -- Executor's Dreadweave Robe
		{ id = 33473, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33467 } }, -- Executor's Dreadweave Gloves
		{ id = 33474, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33468 } }, -- Executor's Dreadweave Leggings
		{ id = 33475, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33469 } }, -- Executor's Dreadweave Boots
		{},
		{ id = 33746, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33740 } }, -- Executor's Coronal
		{ id = 33747, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33741 } }, -- Executor's Dreadweave Shoulders
		{ id = 33748, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33742 } }, -- Executor's Dreadweave Robe
		{ id = 33749, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33743 } }, -- Executor's Dreadweave Gloves
		{ id = 33750, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33744 } }, -- Executor's Dreadweave Leggings
		{ id = 33751, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33745 } }, -- Executor's Dreadweave Boots
	},
	PVPRogue = {
		{ id = 33656, disc = L["Honor: "].." 5000" }, -- Combatant's Leather Mask
		{ id = 33657, disc = L["Honor: "].." 4000" }, -- Combatant's Leather Epaulets
		{ id = 33658, disc = L["Honor: "].." 5000" }, -- Combatant's Leather Chestpiece
		{ id = 33659, disc = L["Honor: "].." 3000" }, -- Combatant's Leather Handgrips
		{ id = 33660, disc = L["Honor: "].." 4000" }, -- Combatant's Leather Leggings
		{ id = 33661, disc = L["Honor: "].." 3000" }, -- Combatant's Leather Footguards
		{},
		{ id = 33842, disc = L["Honor: "].." 5000" }, -- Combatant's Leather Mask
		{ id = 33843, disc = L["Honor: "].." 4000" }, -- Combatant's Leather Epaulets
		{ id = 33844, disc = L["Honor: "].." 5000" }, -- Combatant's Leather Chestpiece
		{ id = 33845, disc = L["Honor: "].." 3000" }, -- Combatant's Leather Handgrips
		{ id = 33846, disc = L["Honor: "].." 4000" }, -- Combatant's Leather Leggings
		{ id = 33847, disc = L["Honor: "].." 3000" }, -- Combatant's Leather Footguards
		{},
		{},
		{ id = 33662, disc = L["Honor: "].." 19000", container = { 33656 } }, -- Partisan's Leather Mask
		{ id = 33663, disc = L["Honor: "].." 19000", container = { 33657 } }, -- Partisan's Leather Epaulets
		{ id = 33664, disc = L["Honor: "].." 22000", container = { 33658 } }, -- Partisan's Leather Chestpiece
		{ id = 33665, disc = L["Honor: "].." 20000", container = { 33659 } }, -- Partisan's Leather Handgrips
		{ id = 33666, disc = L["Honor: "].." 22000", container = { 33660 } }, -- Partisan's Leather Leggings
		{ id = 33667, disc = L["Honor: "].." 18000", container = { 33661 } }, -- Partisan's Leather Footguards
		{},
		{ id = 33848, disc = L["Honor: "].." 19000", container = { 33842 } }, -- Partisan's Leather Mask
		{ id = 33849, disc = L["Honor: "].." 19000", container = { 33843 } }, -- Partisan's Leather Epaulets
		{ id = 33850, disc = L["Honor: "].." 22000", container = { 33844 } }, -- Partisan's Leather Chestpiece
		{ id = 33851, disc = L["Honor: "].." 20000", container = { 33845 } }, -- Partisan's Leather Handgrips
		{ id = 33852, disc = L["Honor: "].." 22000", container = { 33846 } }, -- Partisan's Leather Leggings
		{ id = 33853, disc = L["Honor: "].." 18000", container = { 33847 } }, -- Partisan's Leather Footguards
		{},
		{},
		{ id = 33668, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33662 } }, -- Veteran's Leather Mask
		{ id = 33669, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33663 } }, -- Veteran's Leather Epaulets
		{ id = 33670, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33664 } }, -- Veteran's Leather Chestpiece
		{ id = 33671, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33665 } }, -- Veteran's Leather Handgrips
		{ id = 33672, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33666 } }, -- Veteran's Leather Leggings
		{ id = 33673, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33667 } }, -- Veteran's Leather Footguards
		{},
		{ id = 33854, disc = L["Honor: "].." 32000, ".. L["Conquest Points: "].." 1500", container = { 33848 } }, -- Veteran's Leather Mask
		{ id = 33855, disc = L["Honor: "].." 32000, ".. L["Conquest Points: "].." 1500", container = { 33849 } }, -- Veteran's Leather Epaulets
		{ id = 33856, disc = L["Honor: "].." 32000, ".. L["Conquest Points: "].." 1500", container = { 33850 } }, -- Veteran's Leather Chestpiece
		{ id = 33857, disc = L["Honor: "].." 32000, ".. L["Conquest Points: "].." 1500", container = { 33851 } }, -- Veteran's Leather Handgrips
		{ id = 33858, disc = L["Honor: "].." 32000, ".. L["Conquest Points: "].." 1500", container = { 33852 } }, -- Veteran's Leather Leggings
		{ id = 33859, disc = L["Honor: "].." 32000, ".. L["Conquest Points: "].." 1500", container = { 33853 } }, -- Veteran's Leather Footguards
	},
	PVPDruid = {
		{ id = 33530, disc = L["Honor: "].." 5000" }, -- Combatant's Dragonhide Helmet
		{ id = 33531, disc = L["Honor: "].." 4000" }, -- Combatant's Dragonhide Epaulets
		{ id = 33532, disc = L["Honor: "].." 5000" }, -- Combatant's Dragonhide Hauberk
		{ id = 33533, disc = L["Honor: "].." 3000" }, -- Combatant's Dragonhide Gloves
		{ id = 33534, disc = L["Honor: "].." 4000" }, -- Combatant's Dragonhide Leggings
		{ id = 33535, disc = L["Honor: "].." 3000" }, -- Combatant's Dragonhide Boots
		{},
		{ id = 33752, disc = L["Honor: "].." 5000" }, -- Combatant's Dragonhide Helmet
		{ id = 33753, disc = L["Honor: "].." 4000" }, -- Combatant's Dragonhide Shoulders
		{ id = 33754, disc = L["Honor: "].." 5000" }, -- Combatant's Dragonhide Hauberk
		{ id = 33755, disc = L["Honor: "].." 3000" }, -- Combatant's Dragonhide Gloves
		{ id = 33756, disc = L["Honor: "].." 4000" }, -- Combatant's Dragonhide Leggings
		{ id = 33757, disc = L["Honor: "].." 3000" }, -- Combatant's Dragonhide Boots
		{},
		{},
		{ id = 33536, disc = L["Honor: "].." 19000", container = { 33530 } }, -- Partisan's Dragonhide Helmet
		{ id = 33537, disc = L["Honor: "].." 19000", container = { 33531 } }, -- Partisan's Dragonhide Epaulets
		{ id = 33538, disc = L["Honor: "].." 22000", container = { 33532 } }, -- Partisan's Dragonhide Hauberk
		{ id = 33539, disc = L["Honor: "].." 20000", container = { 33533 } }, -- Partisan's Dragonhide Gloves
		{ id = 33540, disc = L["Honor: "].." 22000", container = { 33534 } }, -- Partisan's Dragonhide Leggings
		{ id = 33541, disc = L["Honor: "].." 18000", container = { 33535 } }, -- Partisan's Dragonhide Boots
		{},
		{ id = 33758, disc = L["Honor: "].." 19000", container = { 33752 } }, -- Partisan's Dragonhide Helmet
		{ id = 33759, disc = L["Honor: "].." 19000", container = { 33753 } }, -- Partisan's Dragonhide Epaulets
		{ id = 33760, disc = L["Honor: "].." 22000", container = { 33754 } }, -- Partisan's Dragonhide Hauberk
		{ id = 33761, disc = L["Honor: "].." 20000", container = { 33755 } }, -- Partisan's Dragonhide Gloves
		{ id = 33762, disc = L["Honor: "].." 22000", container = { 33756 } }, -- Partisan's Dragonhide Leggings
		{ id = 33763, disc = L["Honor: "].." 18000", container = { 33757 } }, -- Partisan's Dragonhide Boots
		{},
		{},
		{ id = 33542, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33536 } }, -- Veteran's Dragonhide Helmet
		{ id = 33543, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33537 } }, -- Veteran's Dragonhide Epaulets
		{ id = 33544, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33538 } }, -- Veteran's Dragonhide Hauberk
		{ id = 33545, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33539 } }, -- Veteran's Dragonhide Gloves
		{ id = 33546, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33540 } }, -- Veteran's Dragonhide Leggings
		{ id = 33547, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33541 } }, -- Veteran's Dragonhide Boots
		{},
		{ id = 33764, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33758 } }, -- Veteran's Dragonhide Helmet
		{ id = 33765, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33759 } }, -- Veteran's Dragonhide Epaulets
		{ id = 33766, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33760 } }, -- Veteran's Dragonhide Hauberk
		{ id = 33767, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33761 } }, -- Veteran's Dragonhide Gloves
		{ id = 33768, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33762 } }, -- Veteran's Dragonhide Leggings
		{ id = 33769, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33763 } }, -- Veteran's Dragonhide Boots
		{},
		{},
		{ id = 33548, disc = L["Honor: "].." 5000" }, -- Tactician's Dragonhide Helmet
		{ id = 33549, disc = L["Honor: "].." 4000" }, -- Tactician's Dragonhide Epaulets
		{ id = 33550, disc = L["Honor: "].." 5000" }, -- Tactician's Dragonhide Hauberk
		{ id = 33551, disc = L["Honor: "].." 3000" }, -- Tactician's Dragonhide Gloves
		{ id = 33552, disc = L["Honor: "].." 4000" }, -- Tactician's Dragonhide Leggings
		{ id = 33553, disc = L["Honor: "].." 3000" }, -- Tactician's Dragonhide Boots
		{},
		{ id = 33770, disc = L["Honor: "].." 5000" }, -- Tactician's Dragonhide Helmet
		{ id = 33771, disc = L["Honor: "].." 4000" }, -- Tactician's Dragonhide Epaulets
		{ id = 33772, disc = L["Honor: "].." 5000" }, -- Tactician's Dragonhide Hauberk
		{ id = 33773, disc = L["Honor: "].." 3000" }, -- Tactician's Dragonhide Gloves
		{ id = 33774, disc = L["Honor: "].." 4000" }, -- Tactician's Dragonhide Leggings
		{ id = 33775, disc = L["Honor: "].." 3000" }, -- Tactician's Dragonhide Boots
		{},
		{},
		{ id = 33554, disc = L["Honor: "].." 19000", container = { 33548 } }, -- Strategist's Dragonhide Helmet
		{ id = 33555, disc = L["Honor: "].." 19000", container = { 33549 } }, -- Strategist's Dragonhide Epaulets
		{ id = 33556, disc = L["Honor: "].." 22000", container = { 33550 } }, -- Strategist's Dragonhide Hauberk
		{ id = 33557, disc = L["Honor: "].." 20000", container = { 33551 } }, -- Strategist's Dragonhide Gloves
		{ id = 33558, disc = L["Honor: "].." 22000", container = { 33552 } }, -- Strategist's Dragonhide Leggings
		{ id = 33559, disc = L["Honor: "].." 18000", container = { 33553 } }, -- Strategist's Dragonhide Boots
		{},
		{ id = 33776, disc = L["Honor: "].." 19000", container = { 33770 } }, -- Strategist's Dragonhide Helmet
		{ id = 33777, disc = L["Honor: "].." 19000", container = { 33771 } }, -- Strategist's Dragonhide Epaulets
		{ id = 33778, disc = L["Honor: "].." 22000", container = { 33772 } }, -- Strategist's Dragonhide Hauberk
		{ id = 33779, disc = L["Honor: "].." 20000", container = { 33773 } }, -- Strategist's Dragonhide Gloves
		{ id = 33780, disc = L["Honor: "].." 22000", container = { 33774 } }, -- Strategist's Dragonhide Leggings
		{ id = 33781, disc = L["Honor: "].." 18000", container = { 33775 } }, -- Strategist's Dragonhide Boots
		{},
		{},
		{ id = 33560, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33554 } }, -- Executor's Dragonhide Helmet
		{ id = 33561, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33555 } }, -- Executor's Dragonhide Epaulets
		{ id = 33562, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33556 } }, -- Executor's Dragonhide Hauberk
		{ id = 33563, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33557 } }, -- Executor's Dragonhide Gloves
		{ id = 33564, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33558 } }, -- Executor's Dragonhide Leggings
		{ id = 33565, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33559 } }, -- Executor's Dragonhide Boots
		{},
		{ id = 33782, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33776 } }, -- Executor's Dragonhide Helmet
		{ id = 33783, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33777 } }, -- Executor's Dragonhide Epaulets
		{ id = 33784, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33778 } }, -- Executor's Dragonhide Hauberk
		{ id = 33785, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33779 } }, -- Executor's Dragonhide Gloves
		{ id = 33786, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33780 } }, -- Executor's Dragonhide Leggings
		{ id = 33787, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33781 } }, -- Executor's Dragonhide Boots
		{},
		{},
		{ id = 33566, disc = L["Honor: "].." 5000" }, -- Corpsman's Dragonhide Helmet
		{ id = 33567, disc = L["Honor: "].." 4000" }, -- Corpsman's Dragonhide Epaulets
		{ id = 33568, disc = L["Honor: "].." 5000" }, -- Corpsman's Dragonhide Hauberk
		{ id = 33569, disc = L["Honor: "].." 3000" }, -- Corpsman's Dragonhide Gloves
		{ id = 33570, disc = L["Honor: "].." 4000" }, -- Corpsman's Dragonhide Leggings
		{ id = 33571, disc = L["Honor: "].." 3000" }, -- Corpsman's Dragonhide Boots
		{},
		{ id = 33788, disc = L["Honor: "].." 5000" }, -- Corpsman's Dragonhide Helmet
		{ id = 33789, disc = L["Honor: "].." 4000" }, -- Corpsman's Dragonhide Epaulets
		{ id = 33790, disc = L["Honor: "].." 5000" }, -- Corpsman's Dragonhide Hauberk
		{ id = 33791, disc = L["Honor: "].." 3000" }, -- Corpsman's Dragonhide Gloves
		{ id = 33792, disc = L["Honor: "].." 4000" }, -- Corpsman's Dragonhide Leggings
		{ id = 33793, disc = L["Honor: "].." 3000" }, -- Corpsman's Dragonhide Boots
		{},
		{},
		{ id = 33572, disc = L["Honor: "].." 19000", container = { 33566 } }, -- Physician's Dragonhide Helmet
		{ id = 33573, disc = L["Honor: "].." 19000", container = { 33567 } }, -- Physician's Dragonhide Epaulets
		{ id = 33574, disc = L["Honor: "].." 22000", container = { 33568 } }, -- Physician's Dragonhide Hauberk
		{ id = 33575, disc = L["Honor: "].." 20000", container = { 33569 } }, -- Physician's Dragonhide Gloves
		{ id = 33576, disc = L["Honor: "].." 22000", container = { 33570 } }, -- Physician's Dragonhide Leggings
		{ id = 33577, disc = L["Honor: "].." 18000", container = { 33571 } }, -- Physician's Dragonhide Boots
		{},
		{ id = 33794, disc = L["Honor: "].." 19000", container = { 33788 } }, -- Physician's Dragonhide Helmet
		{ id = 33795, disc = L["Honor: "].." 19000", container = { 33789 } }, -- Physician's Dragonhide Epaulets
		{ id = 33796, disc = L["Honor: "].." 22000", container = { 33790 } }, -- Physician's Dragonhide Hauberk
		{ id = 33797, disc = L["Honor: "].." 20000", container = { 33791 } }, -- Physician's Dragonhide Gloves
		{ id = 33798, disc = L["Honor: "].." 22000", container = { 33792 } }, -- Physician's Dragonhide Leggings
		{ id = 33799, disc = L["Honor: "].." 18000", container = { 33793 } }, -- Physician's Dragonhide Boots
		{},
		{},
		{ id = 33578, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33572 } }, -- Field Medic's Dragonhide Helmet
		{ id = 33579, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33573 } }, -- Field Medic's Dragonhide Epaulets
		{ id = 33580, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33574 } }, -- Field Medic's Dragonhide Hauberk
		{ id = 33581, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33575 } }, -- Field Medic's Dragonhide Gloves
		{ id = 33582, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33576 } }, -- Field Medic's Dragonhide Leggings
		{ id = 33583, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33577 } }, -- Field Medic's Dragonhide Boots
		{},
		{ id = 33800, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33794 } }, -- Field Medic's Dragonhide Helmet
		{ id = 33801, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33795 } }, -- Field Medic's Dragonhide Epaulets
		{ id = 33802, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33796 } }, -- Field Medic's Dragonhide Hauberk
		{ id = 33803, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33797 } }, -- Field Medic's Dragonhide Gloves
		{ id = 33804, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33798 } }, -- Field Medic's Dragonhide Leggings
		{ id = 33805, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33799 } }, -- Field Medic's Dragonhide Boots
	},
	PVPShaman = {
		{ id = 33476, disc = L["Honor: "].." 5000" }, -- Combatant's Mail Helm
		{ id = 33477, disc = L["Honor: "].." 4000" }, -- Combatant's Mail Shoulders
		{ id = 33478, disc = L["Honor: "].." 5000" }, -- Combatant's Mail Armor
		{ id = 33479, disc = L["Honor: "].." 3000" }, -- Combatant's Mail Gauntlets
		{ id = 33480, disc = L["Honor: "].." 4000" }, -- Combatant's Mail Leggings
		{ id = 33481, disc = L["Honor: "].." 3000" }, -- Combatant's Mail Boots
		{},
		{ id = 33482, disc = L["Honor: "].." 19000", container = { 33476 } }, -- Partisan's Mail Helm
		{ id = 33483, disc = L["Honor: "].." 19000", container = { 33477 } }, -- Partisan's Mail Shoulders
		{ id = 33484, disc = L["Honor: "].." 22000", container = { 33478 } }, -- Partisan's Mail Armor
		{ id = 33485, disc = L["Honor: "].." 20000", container = { 33479 } }, -- Partisan's Mail Gauntlets
		{ id = 33486, disc = L["Honor: "].." 22000", container = { 33480 } }, -- Partisan's Mail Leggings
		{ id = 33487, disc = L["Honor: "].." 18000", container = { 33481 } }, -- Partisan's Mail Boots
		{},
		{},
		{ id = 33488, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33482 } }, -- Veteran's Mail Helm
		{ id = 33489, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33483 } }, -- Veteran's Mail Shoulders
		{ id = 33490, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33484 } }, -- Veteran's Mail Armor
		{ id = 33491, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33485 } }, -- Veteran's Mail Gauntlets
		{ id = 33492, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33486 } }, -- Veteran's Mail Leggings
		{ id = 33493, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33487 } }, -- Veteran's Mail Sabatons
		{},
		{ id = 33494, disc = L["Honor: "].." 5000" }, -- Tactician's Mail Helm
		{ id = 33495, disc = L["Honor: "].." 4000" }, -- Tactician's Mail Spaulders
		{ id = 33496, disc = L["Honor: "].." 5000" }, -- Tactician's Mail Armor
		{ id = 33497, disc = L["Honor: "].." 3000" }, -- Tactician's Mail Gauntlets
		{ id = 33498, disc = L["Honor: "].." 4000" }, -- Tactician's Mail Leggings
		{ id = 33499, disc = L["Honor: "].." 3000" }, -- Tactician's Mail Boots
		{},
		{},
		{ id = 33500, disc = L["Honor: "].." 19000", container = { 33494 } }, -- Strategist's Mail Helm
		{ id = 33501, disc = L["Honor: "].." 19000", container = { 33495 } }, -- Strategist's Mail Shoulders
		{ id = 33502, disc = L["Honor: "].." 22000", container = { 33496 } }, -- Strategist's Mail Armor
		{ id = 33503, disc = L["Honor: "].." 20000", container = { 33497 } }, -- Strategist's Mail Gauntlets
		{ id = 33504, disc = L["Honor: "].." 22000", container = { 33498 } }, -- Strategist's Mail Leggings
		{ id = 33505, disc = L["Honor: "].." 18000", container = { 33499 } }, -- Strategist's Mail Boots
		{},
		{ id = 33506, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33500 } }, -- Executor's Mail Helm
		{ id = 33507, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33501 } }, -- Executor's Mail Shoulders
		{ id = 33508, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33502 } }, -- Executor's Mail Armor
		{ id = 33509, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33503 } }, -- Executor's Mail Gauntlets
		{ id = 33510, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33504 } }, -- Executor's Mail Leggings
		{ id = 33511, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33505 } }, -- Executor's Mail Sabatons
		{},
		{},
		{ id = 33512, disc = L["Honor: "].." 5000" }, -- Corpsman's Mail Helm
		{ id = 33513, disc = L["Honor: "].." 4000" }, -- Corpsman's Mail Spaulders
		{ id = 33514, disc = L["Honor: "].." 5000" }, -- Corpsman's Mail Armor
		{ id = 33515, disc = L["Honor: "].." 3000" }, -- Corpsman's Mail Gauntlets
		{ id = 33516, disc = L["Honor: "].." 4000" }, -- Corpsman's Mail Leggings
		{ id = 33517, disc = L["Honor: "].." 3000" }, -- Corpsman's Mail Boots
		{},
		{ id = 33518, disc = L["Honor: "].." 19000", container = { 33512 } }, -- Physician's Mail Helm
		{ id = 33519, disc = L["Honor: "].." 19000", container = { 33513 } }, -- Physician's Mail Spaulders
		{ id = 33520, disc = L["Honor: "].." 22000", container = { 33514 } }, -- Physician's Mail Armor
		{ id = 33521, disc = L["Honor: "].." 20000", container = { 33515 } }, -- Physician's Mail Gauntlets
		{ id = 33522, disc = L["Honor: "].." 22000", container = { 33516 } }, -- Physician's Mail Leggings
		{ id = 33523, disc = L["Honor: "].." 18000", container = { 33517 } }, -- Physician's Mail Boots
		{},
		{},
		{ id = 33524, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33518 } }, -- Field Medic's Mail Helmet
		{ id = 33525, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33519 } }, -- Field Medic's Mail Shoulders
		{ id = 33526, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33520 } }, -- Field Medic's Mail Armor
		{ id = 33527, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33521 } }, -- Field Medic's Mail Gauntlets
		{ id = 33528, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33522 } }, -- Field Medic's Mail Leggings
		{ id = 33529, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33523 } }, -- Field Medic's Mail Boots
	},
	PVPWarrior = {
		{ id = 33404, disc = L["Honor: "].." 5000" }, -- Combatant's Plate Helm
		{ id = 33405, disc = L["Honor: "].." 4000" }, -- Combatant's Plate Shoulderguards
		{ id = 33406, disc = L["Honor: "].." 5000" }, -- Combatant's Plate Armor
		{ id = 33407, disc = L["Honor: "].." 3000" }, -- Combatant's Plate Gauntlets
		{ id = 33408, disc = L["Honor: "].." 4000" }, -- Combatant's Plate Leggings
		{ id = 33409, disc = L["Honor: "].." 3000" }, -- Combatant's Plate Boots
		{},
		{ id = 33680, disc = L["Honor: "].." 5000" }, -- Combatant's Plate Helm
		{ id = 33681, disc = L["Honor: "].." 4000" }, -- Combatant's Plate Shoulderguards
		{ id = 33682, disc = L["Honor: "].." 5000" }, -- Combatant's Plate Armor
		{ id = 33683, disc = L["Honor: "].." 3000" }, -- Combatant's Plate Gauntlets
		{ id = 33684, disc = L["Honor: "].." 4000" }, -- Combatant's Plate Leggings
		{ id = 33685, disc = L["Honor: "].." 3000" }, -- Combatant's Plate Boots
		{},
		{},
		{ id = 33410, disc = L["Honor: "].." 19000", container = { 33404 } }, -- Partisan's Plate Helm
		{ id = 33411, disc = L["Honor: "].." 19000", container = { 33405 } }, -- Partisan's Plate Shoulderguards
		{ id = 33412, disc = L["Honor: "].." 22000", container = { 33406 } }, -- Partisan's Plate Armor
		{ id = 33413, disc = L["Honor: "].." 20000", container = { 33407 } }, -- Partisan's Plate Gauntlets
		{ id = 33414, disc = L["Honor: "].." 22000", container = { 33408 } }, -- Partisan's Plate Leggings
		{ id = 33415, disc = L["Honor: "].." 18000", container = { 33409 } }, -- Partisan's Plate Boots
		{},
		{ id = 33686, disc = L["Honor: "].." 19000", container = { 33680 } }, -- Partisan's Plate Helm
		{ id = 33687, disc = L["Honor: "].." 19000", container = { 33681 } }, -- Partisan's Plate Shoulderguards
		{ id = 33688, disc = L["Honor: "].." 22000", container = { 33682 } }, -- Partisan's Plate Armor
		{ id = 33689, disc = L["Honor: "].." 20000", container = { 33683 } }, -- Partisan's Plate Gauntlets
		{ id = 33690, disc = L["Honor: "].." 22000", container = { 33684 } }, -- Partisan's Plate Leggings
		{ id = 33691, disc = L["Honor: "].." 18000", container = { 33685 } }, -- Partisan's Plate Boots
		{},
		{},
		{ id = 33416, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33410 } }, -- Veteran's Plate Helm
		{ id = 33417, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33411 } }, -- Veteran's Plate Shoulderguards
		{ id = 33418, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33412 } }, -- Veteran's Plate Armor
		{ id = 33419, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33413 } }, -- Veteran's Plate Gauntlets
		{ id = 33420, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33414 } }, -- Veteran's Plate Leggings
		{ id = 33421, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33415 } }, -- Veteran's Plate Boots
		{},
		{ id = 33692, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33686 } }, -- Veteran's Plate Helm
		{ id = 33693, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33687 } }, -- Veteran's Plate Shoulderguards
		{ id = 33694, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33688 } }, -- Veteran's Plate Armor
		{ id = 33695, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33689 } }, -- Veteran's Plate Gauntlets
		{ id = 33696, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33690 } }, -- Veteran's Plate Leggings
		{ id = 33697, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33691 } }, -- Veteran's Plate Boots
	},
	PVPPaladin = {
		{ id = 33584, disc = L["Honor: "].." 5000" }, -- Combatant's Lamellar Faceguard
		{ id = 33585, disc = L["Honor: "].." 4000" }, -- Combatant's Lamellar Shoulders
		{ id = 33586, disc = L["Honor: "].." 5000" }, -- Combatant's Lamellar Chestplate
		{ id = 33587, disc = L["Honor: "].." 3000" }, -- Combatant's Lamellar Gauntlets
		{ id = 33588, disc = L["Honor: "].." 4000" }, -- Combatant's Lamellar Legplates
		{ id = 33589, disc = L["Honor: "].." 3000" }, -- Combatant's Lamellar Sabatons
		{},
		{ id = 33590, disc = L["Honor: "].." 19000", container = { 33584 } }, -- Partisan's Lamellar Faceguard
		{ id = 33591, disc = L["Honor: "].." 19000", container = { 33585 } }, -- Partisan's Lamellar Shoulders
		{ id = 33592, disc = L["Honor: "].." 22000", container = { 33586 } }, -- Partisan's Lamellar Chestplate
		{ id = 33593, disc = L["Honor: "].." 20000", container = { 33587 } }, -- Partisan's Lamellar Gauntlets
		{ id = 33594, disc = L["Honor: "].." 22000", container = { 33588 } }, -- Partisan's Lamellar Legplates
		{ id = 33595, disc = L["Honor: "].." 18000", container = { 33589 } }, -- Partisan's Lamellar Sabatons
		{},
		{},
		{ id = 33596, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33590 } }, -- Veteran's Lamellar Faceguard
		{ id = 33597, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33591 } }, -- Veteran's Lamellar Shoulders
		{ id = 33598, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33592 } }, -- Veteran's Lamellar Chestplate
		{ id = 33599, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33593 } }, -- Veteran's Lamellar Gauntlets
		{ id = 33600, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33594 } }, -- Veteran's Lamellar Legplates
		{ id = 33601, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33595 } }, -- Veteran's Lamellar Sabatons
		{},
		{ id = 33602, disc = L["Honor: "].." 5000" }, -- Corpsman's Lamellar Faceguard
		{ id = 33603, disc = L["Honor: "].." 4000" }, -- Corpsman's Lamellar Pauldrons
		{ id = 33604, disc = L["Honor: "].." 5000" }, -- Corpsman's Lamellar Chestplate
		{ id = 33605, disc = L["Honor: "].." 3000" }, -- Corpsman's Lamellar Gloves
		{ id = 33606, disc = L["Honor: "].." 4000" }, -- Corpsman's Lamellar Legplates
		{ id = 33607, disc = L["Honor: "].." 3000" }, -- Corpsman's Lamellar Sabatons
		{},
		{},
		{ id = 33608, disc = L["Honor: "].." 19000", container = { 33602 } }, -- Physician's Lamellar Faceguard
		{ id = 33609, disc = L["Honor: "].." 19000", container = { 33603 } }, -- Physician's Lamellar Pauldrons
		{ id = 33610, disc = L["Honor: "].." 22000", container = { 33604 } }, -- Physician's Lamellar Chestplate
		{ id = 33611, disc = L["Honor: "].." 20000", container = { 33605 } }, -- Physician's Lamellar Gloves
		{ id = 33612, disc = L["Honor: "].." 22000", container = { 33606 } }, -- Physician's Lamellar Legplates
		{ id = 33613, disc = L["Honor: "].." 18000", container = { 33607 } }, -- Physician's Lamellar Boots
		{},
		{ id = 33614, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33608 } }, -- Field Medic's Lamellar Faceguard
		{ id = 33615, disc = L["Honor: "].." 65000, ".. L["Conquest Points: "].." 3500", container = { 33609 } }, -- Field Medic's Lamellar Shoulders
		{ id = 33616, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33610 } }, -- Field Medic's Lamellar Chestplate
		{ id = 33617, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33611 } }, -- Field Medic's Lamellar Gloves
		{ id = 33618, disc = L["Honor: "].." 69000, ".. L["Conquest Points: "].." 4000", container = { 33612 } }, -- Field Medic's Lamellar Legplates
		{ id = 33619, disc = L["Honor: "].." 54000, ".. L["Conquest Points: "].." 3000", container = { 33613 } }, -- Field Medic's Lamellar Sabatons
	},
	PvPMountsPvP = {
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 11"},
		{ id = 19030 }, -- Stormpike Battle Charger
		{},
		{ id = 18244 }, -- Black War Ram
		{ id = 18243 }, -- Black Battlestrider
		{ id = 18241 }, -- Black War Steed Bridle
		{ id = 18242 }, -- Reins of the Black War Tiger
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 11"},
		{ id = 19029 }, -- Horn of the Frostwolf Howler
		{},
		{ id = 18245 }, -- Horn of the Black War Wolf
		{ id = 18247 }, -- Black War Kodo
		{ id = 18246 }, -- Whistle of the Black War Raptor
		{ id = 18248 }, -- Red Skeletal Warhorse
	}
}

for k, v in pairs(pvpRewards) do
	AtlasTWLoot_Data[k] = v
end