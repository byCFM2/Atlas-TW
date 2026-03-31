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
local LIS = AtlasTW.Localization.ItemSets

--Instance required libraries

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

local pvpRewards = {
	PVPWeapons118 = {
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 14"},
		{ id = 18827 }, -- Grand Marshal's Handaxe
		{ id = 18830 }, -- Grand Marshal's Sunderer
		{ id = 18838 }, -- Grand Marshal's Dirk
		{ id = 23451 }, -- Grand Marshal's Mageblade
		{ id = 18843 }, -- Grand Marshal's Right Hand Blade
		{ id = 18847 }, -- Grand Marshal's Left Hand Blade
		{ id = 18865 }, -- Grand Marshal's Punisher
		{ id = 23454 }, -- Grand Marshal's Warhammer
		{ id = 23455 }, -- Grand Marshal's Demolisher
		{ id = 18867 }, -- Grand Marshal's Battle Hammer
		{ id = 12584 }, -- Grand Marshal's Longsword
		{ id = 23456 }, -- Grand Marshal's Swiftblade
		{ id = 18876 }, -- Grand Marshal's Claymore
		{ id = 18869 }, -- Grand Marshal's Glaive
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 14"},
		{ id = 18828 }, -- High Warlord's Cleaver
		{ id = 18831 }, -- High Warlord's Battle Axe
		{ id = 18840 }, -- High Warlord's Razor
		{ id = 23466 }, -- High Warlord's Spellblade
		{ id = 18844 }, -- High Warlord's Right Claw
		{ id = 18848 }, -- High Warlord's Left Claw
		{ id = 18866 }, -- High Warlord's Bludgeon
		{ id = 23464 }, -- High Warlord's Battle Mace
		{ id = 23465 }, -- High Warlord's Destroyer
		{ id = 18868 }, -- High Warlord's Pulverizer
		{ id = 16345 }, -- High Warlord's Blade
		{ id = 23467 }, -- High Warlord's Quickblade
		{ id = 18877 }, -- High Warlord's Greatsword
		{ id = 18871 }, -- High Warlord's Pig Sticker
		{ id = 18873 }, -- Grand Marshal's Stave
		{ id = 18833 }, -- Grand Marshal's Bullseye
		{ id = 18836 }, -- Grand Marshal's Repeater
		{ id = 18855 }, -- Grand Marshal's Hand Cannon
		{ id = 18825 }, -- Grand Marshal's Aegis
		{ id = 23452 }, -- Grand Marshal's Tome of Power
		{ id = 23453 }, -- Grand Marshal's Tome of Restoration
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 18874 }, -- High Warlord's War Staff
		{ id = 18835 }, -- High Warlord's Recurve
		{ id = 18837 }, -- High Warlord's Crossbow
		{ id = 18860 }, -- High Warlord's Street Sweeper
		{ id = 18826 }, -- High Warlord's Shield Wall
		{ id = 23468 }, -- High Warlord's Tome of Destruction
		{ id = 23469 }, -- High Warlord's Tome of Mending
		{ id = 98731 }, -- Gladiator's Tunic
	},
	PVPWeapons = {
		{ id = 33883 }, -- Strategist's Stave
		{ id = 33881 }, -- Strategist's Demolisher
		{ id = 33894 }, -- Strategist's Mageblade
		{ id = 33895 }, -- Strategist's Tome of Power
		{ id = 33902 }, -- Strategist's Destroyer
		{ id = 33904 }, -- Strategist's War Staff
		{ id = 33915 }, -- Strategist's Spellblade
		{ id = 33916 }, -- Strategist's Tome of Destruction
		{},
		{ id = 33879 }, -- Partisan's Claymore
		{ id = 33880 }, -- Partisan's Battle Hammer
		{ id = 33882 }, -- Partisan's Sunderer
		{ id = 33884 }, -- Partisan's Glaive
		{ id = 33885 }, -- Partisan's Aegis
		{ id = 33886 }, -- Partisan's Longsword
		{ id = 33887 }, -- Partisan's Punisher
		{ id = 33888 }, -- Partisan's Handaxe
		{ id = 33892 }, -- Partisan's Swiftblade
		{ id = 33893 }, -- Partisan's Dirk
		{ id = 33897 }, -- Partisan's Hand Cannon
		{ id = 33898 }, -- Partisan's Repeater
		{ id = 33899 }, -- Partisan's Bullseye
		{ id = 33900 }, -- Partisan's Greatsword
		{ id = 33901 }, -- Partisan's Pulverizer
		{ id = 33903 }, -- Partisan's Battle Axe
		{ id = 33905 }, -- Partisan's Pig Sticker
		{ id = 33906 }, -- Partisan's Shield Wall
		{ id = 33907 }, -- Partisan's Blade
		{ id = 33908 }, -- Partisan's Bludgeon
		{ id = 33909 }, -- Partisan's Cleaver
		{ id = 33910 }, -- Partisan's Left Claw
		{ id = 33911 }, -- Partisan's Right Claw
		{ id = 33913 }, -- Partisan's Quickblade
		{ id = 33914 }, -- Partisan's Razor
		{ id = 33918 }, -- Partisan's Street Sweeper
		{ id = 33919 }, -- Partisan's Crossbow
		{ id = 33920 }, -- Partisan's Recurve
		{},
		{ id = 33896 }, -- Physician's Tome of Restoration
		{ id = 33891 }, -- Physician's Warhammer
		{ id = 33912 }, -- Physician's Battle Mace
		{ id = 33917 }, -- Physician's Tome of Mending
	},
	PvP60Accessories = {
		{ name = LF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 1"}, --*1
		{ id = 15196 }, -- Private's Tabard
		{ id = 18839, disc=L["Consumable"] }, -- Combat Healing Potion
		{ id = 18841, disc=L["Consumable"] }, -- Combat Mana Potion
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
		{ name = LF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 1"}, --*1
		{ id = 15197 }, -- Scout's Tabard
		{ id = 18839, disc=L["Consumable"] }, -- Combat Healing Potion
		{ id = 18841, disc=L["Consumable"] }, -- Combat Mana Potion
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
	},
	PVPHunter118 = {
		{ name=LIS["Field Marshal's Pursuit"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16465, disc=L["Rank"].." 13" }, -- Field Marshal's Chain Helm
		{ id = 16468, disc=L["Rank"].." 13" }, -- Field Marshal's Chain Spaulders
		{ id = 16466, disc=L["Rank"].." 13" }, -- Field Marshal's Chain Breastplate
		{ id = 16463, disc=L["Rank"].." 12" }, -- Marshal's Chain Grips
		{ id = 16467, disc=L["Rank"].." 12" }, -- Marshal's Chain Legguards
		{ id = 16462, disc=L["Rank"].." 12" }, -- Marshal's Chain Boots
		{},
		{ name=LIS["Lieutenant Commander's Pursuance"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23306, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Chain Helm
		{ id = 23307, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Chain Shoulders
		{ id = 23292, disc=L["Rank"].." 8" }, -- Knight-Captain's Chain Hauberk
		{ id = 23279, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Chain Vices
		{ id = 23293, disc=L["Rank"].." 8" }, -- Knight-Captain's Chain Legguards
		{ id = 23278, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Chain Greaves
		{ name=LIS["Warlord's Pursuit"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16566, disc=L["Rank"].." 13" }, -- Warlord's Chain Helmet
		{ id = 16568, disc=L["Rank"].." 13" }, -- Warlord's Chain Shoulders
		{ id = 16565, disc=L["Rank"].." 13" }, -- Warlord's Chain Chestpiece
		{ id = 16571, disc=L["Rank"].." 12" }, -- General's Chain Gloves
		{ id = 16567, disc=L["Rank"].." 12" }, -- General's Chain Legguards
		{ id = 16569, disc=L["Rank"].." 12" }, -- General's Chain Boots
		{},
		{ name=LIS["Champion's Pursuance"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23251, disc=L["Rank"].." 10" }, -- Champion's Chain Helm
		{ id = 23252, disc=L["Rank"].." 10" }, -- Champion's Chain Shoulders
		{ id = 22874, disc=L["Rank"].." 8" }, -- Legionnaire's Chain Hauberk
		{ id = 22862, disc=L["Rank"].." 7" }, -- Blood Guard's Chain Vices
		{ id = 22875, disc=L["Rank"].." 8" }, -- Legionnaire's Chain Legguards
		{ id = 22843, disc=L["Rank"].." 7" }, -- Blood Guard's Chain Greaves
	},
	PVPHunter = {
		{ id = 33440 }, -- Combatant's Chain Helm
		{ id = 33441 }, -- Combatant's Chain Spaulders
		{ id = 33442 }, -- Combatant's Chain Breastplate
		{ id = 33443 }, -- Combatant's Chain Grips
		{ id = 33444 }, -- Combatant's Chain Legguards
		{ id = 33445 }, -- Combatant's Chain Boots
		{},
		{ id = 33716 }, -- Combatant's Chain Helm
		{ id = 33717 }, -- Combatant's Chain Spaulders
		{ id = 33718 }, -- Combatant's Chain Breastplate
		{ id = 33719 }, -- Combatant's Chain Grips
		{ id = 33720 }, -- Combatant's Chain Legguards
		{ id = 33721 }, -- Combatant's Chain Boots
		{},
		{},
		{ id = 33446 }, -- Partisan's Chain Helm
		{ id = 33447 }, -- Partisan's Chain Spaulders
		{ id = 33448 }, -- Partisan's Chain Breastplate
		{ id = 33449 }, -- Partisan's Chain Grips
		{ id = 33450 }, -- Partisan's Chain Legguards
		{ id = 33451 }, -- Partisan's Chain Boots
		{},
		{ id = 33722 }, -- Partisan's Chain Helm
		{ id = 33723 }, -- Partisan's Chain Spaulders
		{ id = 33724 }, -- Partisan's Chain Breastplate
		{ id = 33725 }, -- Partisan's Chain Grips
		{ id = 33726 }, -- Partisan's Chain Legguards
		{ id = 33727 }, -- Partisan's Chain Boots
	},
	PVPMage118 = {
		{ name=LIS["Field Marshal's Regalia"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16441, disc=L["Rank"].." 13" }, -- Field Marshal's Coronet
		{ id = 16444, disc=L["Rank"].." 13" }, -- Field Marshal's Silk Spaulders
		{ id = 16443, disc=L["Rank"].." 13" }, -- Field Marshal's Silk Vestments
		{ id = 16440, disc=L["Rank"].." 12" }, -- Marshal's Silk Gloves
		{ id = 16442, disc=L["Rank"].." 12" }, -- Marshal's Silk Leggings
		{ id = 16437, disc=L["Rank"].." 12" }, -- Marshal's Silk Footwraps
		{},
		{ name=LIS["Lieutenant Commander's Arcanum"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23318, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Silk Cowl
		{ id = 23319, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Silk Mantle
		{ id = 23305, disc=L["Rank"].." 8" }, -- Knight-Captain's Silk Tunic
		{ id = 23290, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Silk Handwraps
		{ id = 23304, disc=L["Rank"].." 8" }, -- Knight-Captain's Silk Legguards
		{ id = 23291, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Silk Walkers
		{ name=LIS["Warlord's Regalia"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16533, disc=L["Rank"].." 13" }, -- Warlord's Silk Cowl
		{ id = 16536, disc=L["Rank"].." 13" }, -- Warlord's Silk Amice
		{ id = 16535, disc=L["Rank"].." 13" }, -- Warlord's Silk Raiment
		{ id = 16540, disc=L["Rank"].." 12" }, -- General's Silk Handguards
		{ id = 16534, disc=L["Rank"].." 12" }, -- General's Silk Trousers
		{ id = 16539, disc=L["Rank"].." 12" }, -- General's Silk Boots
		{},
		{ name=LIS["Champion's Arcanum"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23263, disc=L["Rank"].." 10" }, -- Champion's Silk Cowl
		{ id = 23264, disc=L["Rank"].." 10" }, -- Champion's Silk Mantle
		{ id = 22886, disc=L["Rank"].." 8" }, -- Legionnaire's Silk Tunic
		{ id = 22870, disc=L["Rank"].." 7" }, -- Blood Guard's Silk Handwraps
		{ id = 22883, disc=L["Rank"].." 8" }, -- Legionnaire's Silk Legguards
		{ id = 22860, disc=L["Rank"].." 7" }, -- Blood Guard's Silk Walkers
	},
	PVPMage = {
		{ id = 33422 }, -- Tactician's Coronet
		{ id = 33423 }, -- Tactician's Silk Spaulders
		{ id = 33424 }, -- Tactician's Silk Vestments
		{ id = 33425 }, -- Tactician's Silk Gloves
		{ id = 33426 }, -- Tactician's Silk Leggings
		{ id = 33427 }, -- Tactician's Silk Footwraps
		{},
		{ id = 33698 }, -- Tactician's Coronet
		{ id = 33699 }, -- Tactician's Silk Spaulders
		{ id = 33700 }, -- Tactician's Silk Vestments
		{ id = 33701 }, -- Tactician's Silk Gloves
		{ id = 33702 }, -- Tactician's Silk Leggings
		{ id = 33703 }, -- Tactician's Silk Footwraps
		{},
		{},
		{ id = 33428 }, -- Strategist's Coronet
		{ id = 33429 }, -- Strategist's Silk Spaulders
		{ id = 33430 }, -- Strategist's Silk Vestments
		{ id = 33431 }, -- Strategist's Silk Gloves
		{ id = 33432 }, -- Strategist's Silk Leggings
		{ id = 33433 }, -- Strategist's Silk Footwraps
		{},
		{ id = 33704 }, -- Strategist's Coronet
		{ id = 33705 }, -- Strategist's Silk Spaulders
		{ id = 33706 }, -- Strategist's Silk Vestments
		{ id = 33707 }, -- Strategist's Silk Gloves
		{ id = 33708 }, -- Strategist's Silk Leggings
		{ id = 33709 }, -- Strategist's Silk Footwraps
	},
	PVPPriest118 = {
		{ name=LIS["Field Marshal's Raiment"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 17602, disc=L["Rank"].." 13" }, -- Field Marshal's Headdress
		{ id = 17604, disc=L["Rank"].." 13" }, -- Field Marshal's Satin Mantle
		{ id = 17605, disc=L["Rank"].." 13" }, -- Field Marshal's Satin Vestments
		{ id = 17608, disc=L["Rank"].." 12" }, -- Marshal's Satin Gloves
		{ id = 17603, disc=L["Rank"].." 12" }, -- Marshal's Satin Pants
		{ id = 17607, disc=L["Rank"].." 12" }, -- Marshal's Satin Sandals
		{},
		{ name=LIS["Lieutenant Commander's Investiture"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23316, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Satin Hood
		{ id = 23317, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Satin Mantle
		{ id = 23303, disc=L["Rank"].." 8" }, -- Knight-Captain's Satin Tunic
		{ id = 23288, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Satin Handwraps
		{ id = 23302, disc=L["Rank"].." 8" }, -- Knight-Captain's Satin Legguards
		{ id = 23289, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Satin Walkers
		{ name=LIS["Warlord's Raiment"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 17623, disc=L["Rank"].." 13" }, -- Warlord's Satin Cowl
		{ id = 17622, disc=L["Rank"].." 13" }, -- Warlord's Satin Mantle
		{ id = 17624, disc=L["Rank"].." 13" }, -- Warlord's Satin Robes
		{ id = 17620, disc=L["Rank"].." 12" }, -- General's Satin Gloves
		{ id = 17625, disc=L["Rank"].." 12" }, -- General's Satin Leggings
		{ id = 17618, disc=L["Rank"].." 12" }, -- General's Satin Boots
		{},
		{ name=LIS["Champion's Investiture"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23261, disc=L["Rank"].." 10" }, -- Champion's Satin Hood
		{ id = 23262, disc=L["Rank"].." 10" }, -- Champion's Satin Mantle
		{ id = 22885, disc=L["Rank"].." 8" }, -- Legionnaire's Satin Tunic
		{ id = 22869, disc=L["Rank"].." 7" }, -- Blood Guard's Satin Handwraps
		{ id = 22882, disc=L["Rank"].." 8" }, -- Legionnaire's Satin Legguards
		{ id = 22859, disc=L["Rank"].." 7" }, -- Blood Guard's Satin Walkers
	},
	PVPPriest = {
		{ id = 33620 }, -- Tactician's Headdress
		{ id = 33621 }, -- Tactician's Satin Mantle
		{ id = 33622 }, -- Tactician's Satin Vestments
		{ id = 33623 }, -- Tactician's Satin Gloves
		{ id = 33624 }, -- Tactician's Satin Pants
		{ id = 33625 }, -- Tactician's Satin Sandals
		{},
		{ id = 33806 }, -- Tactician's Headdress
		{ id = 33807 }, -- Tactician's Satin Mantle
		{ id = 33808 }, -- Tactician's Satin Vestments
		{ id = 33809 }, -- Tactician's Satin Gloves
		{ id = 33810 }, -- Tactician's Satin Pants
		{ id = 33811 }, -- Tactician's Satin Sandals
		{},
		{},
		{ id = 33626 }, -- Strategist's Headdress
		{ id = 33627 }, -- Strategist's Satin Mantle
		{ id = 33628 }, -- Strategist's Satin Vestments
		{ id = 33629 }, -- Strategist's Satin Gloves
		{ id = 33630 }, -- Strategist's Satin Pants
		{ id = 33631 }, -- Strategist's Satin Sandals
		{},
		{ id = 33812 }, -- Strategist's Headdress
		{ id = 33813 }, -- Strategist's Satin Mantle
		{ id = 33814 }, -- Strategist's Satin Vestments
		{ id = 33815 }, -- Strategist's Satin Gloves
		{ id = 33816 }, -- Strategist's Satin Pants
		{ id = 33817 }, -- Strategist's Satin Sandals
		{},
		{},
		{ id = 33638 }, -- Corpsman's Headdress
		{ id = 33639 }, -- Corpsman's Satin Mantle
		{ id = 33640 }, -- Corpsman's Satin Vestments
		{ id = 33641 }, -- Corpsman's Satin Gloves
		{ id = 33642 }, -- Corpsman's Satin Pants
		{ id = 33643 }, -- Corpsman's Satin Sandals
		{},
		{ id = 33824 }, -- Corpsman's Headdress
		{ id = 33825 }, -- Corpsman's Satin Mantle
		{ id = 33826 }, -- Corpsman's Satin Vestments
		{ id = 33827 }, -- Corpsman's Satin Gloves
		{ id = 33828 }, -- Corpsman's Satin Pants
		{ id = 33829 }, -- Corpsman's Satin Sandals
		{},
		{},
		{ id = 33645 }, -- Physician's Headdress
		{ id = 33831 }, -- Physician's Satin Mantle
		{ id = 33646 }, -- Physician's Satin Vestments
		{ id = 33833 }, -- Physician's Satin Gloves
		{ id = 33832 }, -- Physician's Satin Pants
		{ id = 33834 }, -- Physician's Satin Sandals
	},
	PVPWarlock118 = {
		{ name=LIS["Field Marshal's Threads"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 17578, disc=L["Rank"].." 13" }, -- Field Marshal's Coronal
		{ id = 17580, disc=L["Rank"].." 13" }, -- Field Marshal's Dreadweave Shoulders
		{ id = 17581, disc=L["Rank"].." 13" }, -- Field Marshal's Dreadweave Robe
		{ id = 17584, disc=L["Rank"].." 12" }, -- Marshal's Dreadweave Gloves
		{ id = 17579, disc=L["Rank"].." 12" }, -- Marshal's Dreadweave Leggings
		{ id = 17583, disc=L["Rank"].." 12" }, -- Marshal's Dreadweave Boots
		{},
		{ name=LIS["Lieutenant Commander's Dreadgear"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23310, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dreadweave Cowl
		{ id = 23311, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dreadweave Spaulders
		{ id = 23297, disc=L["Rank"].." 8" }, -- Knight-Captain's Dreadweave Tunic
		{ id = 23282, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dreadweave Handwraps
		{ id = 23296, disc=L["Rank"].." 8" }, -- Knight-Captain's Dreadweave Legguards
		{ id = 23283, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dreadweave Walkers
		{ name=LIS["Warlord's Threads"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 17591, disc=L["Rank"].." 13" }, -- Warlord's Dreadweave Hood
		{ id = 17590, disc=L["Rank"].." 13" }, -- Warlord's Dreadweave Mantle
		{ id = 17592, disc=L["Rank"].." 13" }, -- Warlord's Dreadweave Robe
		{ id = 17588, disc=L["Rank"].." 12" }, -- General's Dreadweave Gloves
		{ id = 17593, disc=L["Rank"].." 12" }, -- General's Dreadweave Pants
		{ id = 17586, disc=L["Rank"].." 12" }, -- General's Dreadweave Boots
		{},
		{ name=LIS["Champion's Dreadgear"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23255, disc=L["Rank"].." 10" }, -- Champion's Dreadweave Cowl
		{ id = 23256, disc=L["Rank"].." 10" }, -- Champion's Dreadweave Spaulders
		{ id = 22884, disc=L["Rank"].." 8" }, -- Legionnaire's Dreadweave Tunic
		{ id = 22865, disc=L["Rank"].." 7" }, -- Blood Guard's Dreadweave Handwraps
		{ id = 22881, disc=L["Rank"].." 8" }, -- Legionnaire's Dreadweave Legguards
		{ id = 22855, disc=L["Rank"].." 7" }, -- Blood Guard's Dreadweave Walkers
	},
	PVPWarlock = {
		{ id = 33458 }, -- Tactician's Coronal
		{ id = 33459 }, -- Tactician's Dreadweave Shoulders
		{ id = 33460 }, -- Tactician's Dreadweave Robe
		{ id = 33461 }, -- Tactician's Dreadweave Gloves
		{ id = 33462 }, -- Tactician's Dreadweave Leggings
		{ id = 33463 }, -- Tactician's Dreadweave Boots
		{},
		{ id = 33734 }, -- Tactician's Coronal
		{ id = 33735 }, -- Tactician's Dreadweave Shoulders
		{ id = 33736 }, -- Tactician's Dreadweave Robe
		{ id = 33737 }, -- Tactician's Dreadweave Gloves
		{ id = 33738 }, -- Tactician's Dreadweave Leggings
		{ id = 33739 }, -- Tactician's Dreadweave Boots
		{},
		{},
		{ id = 33464 }, -- Strategist's Coronal
		{ id = 33465 }, -- Strategist's Dreadweave Shoulders
		{ id = 33466 }, -- Strategist's Dreadweave Robe
		{ id = 33467 }, -- Strategist's Dreadweave Gloves
		{ id = 33468 }, -- Strategist's Dreadweave Leggings
		{ id = 33469 }, -- Strategist's Dreadweave Boots
		{},
		{ id = 33740 }, -- Strategist's Coronal
		{ id = 33741 }, -- Strategist's Dreadweave Shoulders
		{ id = 33742 }, -- Strategist's Dreadweave Robe
		{ id = 33743 }, -- Strategist's Dreadweave Gloves
		{ id = 33744 }, -- Strategist's Dreadweave Leggings
		{ id = 33745 }, -- Strategist's Dreadweave Boots
	},
	PVPRogue118 = {
		{ name=LIS["Field Marshal's Vestments"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16455, disc=L["Rank"].." 13" }, -- Field Marshal's Leather Mask
		{ id = 16457, disc=L["Rank"].." 13" }, -- Field Marshal's Leather Epaulets
		{ id = 16453, disc=L["Rank"].." 13" }, -- Field Marshal's Leather Chestpiece
		{ id = 16454, disc=L["Rank"].." 12" }, -- Marshal's Leather Handgrips
		{ id = 16456, disc=L["Rank"].." 12" }, -- Marshal's Leather Leggings
		{ id = 16446, disc=L["Rank"].." 12" }, -- Marshal's Leather Footguards
		{},
		{ name=LIS["Lieutenant Commander's Guard"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23312, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Leather Helm
		{ id = 23313, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Leather Shoulders
		{ id = 23298, disc=L["Rank"].." 8" }, -- Knight-Captain's Leather Chestpiece
		{ id = 23284, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Leather Grips
		{ id = 23299, disc=L["Rank"].." 8" }, -- Knight-Captain's Leather Legguards
		{ id = 23285, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Leather Walkers
		{ name=LIS["Warlord's Vestments"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16561, disc=L["Rank"].." 13" }, -- Warlord's Leather Helm
		{ id = 16562, disc=L["Rank"].." 13" }, -- Warlord's Leather Spaulders
		{ id = 16563, disc=L["Rank"].." 13" }, -- Warlord's Leather Breastplate
		{ id = 16560, disc=L["Rank"].." 12" }, -- General's Leather Mitts
		{ id = 16564, disc=L["Rank"].." 12" }, -- General's Leather Legguards
		{ id = 16558, disc=L["Rank"].." 12" }, -- General's Leather Treads
		{},
		{ name=LIS["Champion's Guard"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23257, disc=L["Rank"].." 10" }, -- Champion's Leather Helm
		{ id = 23258, disc=L["Rank"].." 10" }, -- Champion's Leather Shoulders
		{ id = 22879, disc=L["Rank"].." 8" }, -- Legionnaire's Leather Chestpiece
		{ id = 22864, disc=L["Rank"].." 7" }, -- Blood Guard's Leather Grips
		{ id = 22880, disc=L["Rank"].." 8" }, -- Legionnaire's Leather Legguards
		{ id = 22856, disc=L["Rank"].." 7" }, -- Blood Guard's Leather Walkers
	},
	PVPRogue = {
		{ id = 33656 }, -- Combatant's Leather Mask
		{ id = 33657 }, -- Combatant's Leather Epaulets
		{ id = 33658 }, -- Combatant's Leather Chestpiece
		{ id = 33659 }, -- Combatant's Leather Handgrips
		{ id = 33660 }, -- Combatant's Leather Leggings
		{ id = 33661 }, -- Combatant's Leather Footguards
		{},
		{ id = 33842 }, -- Combatant's Leather Mask
		{ id = 33843 }, -- Combatant's Leather Epaulets
		{ id = 33844 }, -- Combatant's Leather Chestpiece
		{ id = 33845 }, -- Combatant's Leather Handgrips
		{ id = 33846 }, -- Combatant's Leather Leggings
		{ id = 33847 }, -- Combatant's Leather Footguards
		{},
		{},
		{ id = 33662 }, -- Partisan's Leather Mask
		{ id = 33663 }, -- Partisan's Leather Epaulets
		{ id = 33664 }, -- Partisan's Leather Chestpiece
		{ id = 33665 }, -- Partisan's Leather Handgrips
		{ id = 33666 }, -- Partisan's Leather Leggings
		{ id = 33667 }, -- Partisan's Leather Footguards
		{},
		{ id = 33848 }, -- Partisan's Leather Mask
		{ id = 33849 }, -- Partisan's Leather Epaulets
		{ id = 33850 }, -- Partisan's Leather Chestpiece
		{ id = 33851 }, -- Partisan's Leather Handgrips
		{ id = 33852 }, -- Partisan's Leather Leggings
		{ id = 33853 }, -- Partisan's Leather Footguards
	},
	PVPDruid118 = {
		{ name=LIS["Field Marshal's Sanctuary"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16451, disc=L["Rank"].." 13" }, -- Field Marshal's Dragonhide Helmet
		{ id = 16449, disc=L["Rank"].." 13" }, -- Field Marshal's Dragonhide Spaulders
		{ id = 16452, disc=L["Rank"].." 13" }, -- Field Marshal's Dragonhide Breastplate
		{ id = 16448, disc=L["Rank"].." 12" }, -- Marshal's Dragonhide Gauntlets
		{ id = 16450, disc=L["Rank"].." 12" }, -- Marshal's Dragonhide Legguards
		{ id = 16459, disc=L["Rank"].." 12" }, -- Marshal's Dragonhide Boots
		{},
		{ name=LIS["Lieutenant Commander's Refuge"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23308, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dragonhide Headguard
		{ id = 23309, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dragonhide Shoulders
		{ id = 23294, disc=L["Rank"].." 8" }, -- Knight-Captain's Dragonhide Chestpiece
		{ id = 23280, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dragonhide Grips
		{ id = 23295, disc=L["Rank"].." 8" }, -- Knight-Captain's Dragonhide Leggings
		{ id = 23281, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dragonhide Treads
		{ name=LIS["Warlord's Sanctuary"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16550, disc=L["Rank"].." 13" }, -- Warlord's Dragonhide Helmet
		{ id = 16551, disc=L["Rank"].." 13" }, -- Warlord's Dragonhide Epaulets
		{ id = 16549, disc=L["Rank"].." 13" }, -- Warlord's Dragonhide Hauberk
		{ id = 16555, disc=L["Rank"].." 12" }, -- General's Dragonhide Gloves
		{ id = 16552, disc=L["Rank"].." 12" }, -- General's Dragonhide Leggings
		{ id = 16554, disc=L["Rank"].." 12" }, -- General's Dragonhide Boots
		{},
		{ name=LIS["Champion's Refuge"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23253, disc=L["Rank"].." 10" }, -- Champion's Dragonhide Headguard
		{ id = 23254, disc=L["Rank"].." 10" }, -- Champion's Dragonhide Shoulders
		{ id = 22877, disc=L["Rank"].." 8" }, -- Legionnaire's Dragonhide Chestpiece
		{ id = 22863, disc=L["Rank"].." 7" }, -- Blood Guard's Dragonhide Grips
		{ id = 22878, disc=L["Rank"].." 8" }, -- Legionnaire's Dragonhide Leggings
		{ id = 22852, disc=L["Rank"].." 7" }, -- Blood Guard's Dragonhide Treads
	},
	PVPDruid = {
		{ id = 33530 }, -- Combatant's Dragonhide Helmet
		{ id = 33531 }, -- Combatant's Dragonhide Epaulets
		{ id = 33532 }, -- Combatant's Dragonhide Hauberk
		{ id = 33533 }, -- Combatant's Dragonhide Gloves
		{ id = 33534 }, -- Combatant's Dragonhide Leggings
		{ id = 33535 }, -- Combatant's Dragonhide Boots
		{},
		{ id = 33752 }, -- Combatant's Dragonhide Helmet
		{ id = 33753 }, -- Combatant's Dragonhide Shoulders
		{ id = 33754 }, -- Combatant's Dragonhide Hauberk
		{ id = 33755 }, -- Combatant's Dragonhide Gauntlets
		{ id = 33756 }, -- Combatant's Dragonhide Leggings
		{ id = 33757 }, -- Combatant's Dragonhide Boots
		{},
		{},
		{ id = 33758 }, -- Partisan's Dragonhide Helmet
		{ id = 33759 }, -- Partisan's Dragonhide Epaulets
		{ id = 33760 }, -- Partisan's Dragonhide Hauberk
		{ id = 33761 }, -- Partisan's Dragonhide Gloves
		{ id = 33762 }, -- Partisan's Dragonhide Leggings
		{ id = 33763 }, -- Partisan's Dragonhide Boots
		{},
		{ id = 33536 }, -- Partisan's Dragonhide Helmet
		{ id = 33537 }, -- Partisan's Dragonhide Epaulets
		{ id = 33538 }, -- Partisan's Dragonhide Hauberk
		{ id = 33539 }, -- Partisan's Dragonhide Gloves
		{ id = 33540 }, -- Partisan's Dragonhide Leggings
		{ id = 33541 }, -- Partisan's Dragonhide Boots
		{},
		{},
		{ id = 33554 }, -- Strategist's Dragonhide Helmet
		{ id = 33777 }, -- Strategist's Dragonhide Epaulets
		{ id = 33778 }, -- Strategist's Dragonhide Hauberk
		{ id = 33779 }, -- Strategist's Dragonhide Gloves
		{ id = 33780 }, -- Strategist's Dragonhide Leggings
		{ id = 33781 }, -- Strategist's Dragonhide Boots
		{},
		{ id = 33548 }, -- Physician's Dragonhide Helmet
		{ id = 33549 }, -- Physician's Dragonhide Epaulets
		{ id = 33550 }, -- Physician's Dragonhide Hauberk
		{ id = 33551 }, -- Physician's Dragonhide Gloves
		{ id = 33552 }, -- Physician's Dragonhide Leggings
		{ id = 33553 }, -- Physician's Dragonhide Boots
		{},
		{},
		{ id = 33788 }, -- Corpsman's Dragonhide Helmet
		{ id = 33789 }, -- Corpsman's Dragonhide Epaulets
		{ id = 33790 }, -- Corpsman's Dragonhide Hauberk
		{ id = 33791 }, -- Corpsman's Dragonhide Gloves
		{ id = 33792 }, -- Corpsman's Dragonhide Leggings
		{ id = 33793 }, -- Corpsman's Dragonhide Boots
	},
	PVPShaman118 = {
		{ name=LIS["Warlord's Earthshaker"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16578, disc=L["Rank"].." 13" }, -- Warlord's Mail Helm
		{ id = 16580, disc=L["Rank"].." 13" }, -- Warlord's Mail Spaulders
		{ id = 16577, disc=L["Rank"].." 13" }, -- Warlord's Mail Armor
		{ id = 16574, disc=L["Rank"].." 12" }, -- General's Mail Gauntlets
		{ id = 16579, disc=L["Rank"].." 12" }, -- General's Mail Leggings
		{ id = 16573, disc=L["Rank"].." 12" }, -- General's Mail Boots
		{},
		{ name=LIS["Champion's Stormcaller"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23259, disc=L["Rank"].." 10" }, -- Champion's Mail Headguard
		{ id = 23260, disc=L["Rank"].." 10" }, -- Champion's Mail Pauldrons
		{ id = 22876, disc=L["Rank"].." 8" }, -- Legionnaire's Mail Hauberk
		{ id = 22867, disc=L["Rank"].." 7" }, -- Blood Guard's Mail Vices
		{ id = 22887, disc=L["Rank"].." 8" }, -- Legionnaire's Mail Legguards
		{ id = 22857, disc=L["Rank"].." 7" }, -- Blood Guard's Mail Greaves
	},
	PVPShaman = {
		{ id = 33476 }, -- Combatant's Mail Helm
		{ id = 33477 }, -- Combatant's Mail Shoulders
		{ id = 33478 }, -- Combatant's Mail Armor
		{ id = 33479 }, -- Combatant's Mail Gauntlets
		{ id = 33480 }, -- Combatant's Mail Leggings
		{ id = 33481 }, -- Combatant's Mail Boots
		{},
		{ id = 33482 }, -- Partisan's Mail Helm
		{ id = 33483 }, -- Partisan's Mail Shoulders
		{ id = 33484 }, -- Partisan's Mail Armor
		{ id = 33485 }, -- Partisan's Mail Gauntlets
		{ id = 33486 }, -- Partisan's Mail Leggings
		{ id = 33487 }, -- Partisan's Mail Boots
		{},
		{},
		{ id = 33500 }, -- Strategist's Mail Helm
		{ id = 33501 }, -- Strategist's Mail Shoulders
		{ id = 33502 }, -- Strategist's Mail Armor
		{ id = 33503 }, -- Strategist's Mail Gauntlets
		{ id = 33504 }, -- Strategist's Mail Leggings
		{ id = 33505 }, -- Strategist's Mail Boots
		{},
		{ id = 33518 }, -- Physician's Mail Helm
		{ id = 33519 }, -- Physician's Mail Spaulders
		{ id = 33520 }, -- Physician's Mail Armor
		{ id = 33521 }, -- Physician's Mail Gauntlets
		{ id = 33522 }, -- Physician's Mail Leggings
		{ id = 33523 }, -- Physician's Mail Boots
		{},
		{},
		{ id = 33512 }, -- Corpsman's Mail Helm
		{ id = 33513 }, -- Corpsman's Mail Spaulders
		{ id = 33514 }, -- Corpsman's Mail Armor
		{ id = 33515 }, -- Corpsman's Mail Gauntlets
		{ id = 33516 }, -- Corpsman's Mail Leggings
		{ id = 33517 }, -- Corpsman's Mail Boots
		{},
		{ id = 33494 }, -- Tactician's Mail Helm
		{ id = 33495 }, -- Tactician's Mail Spaulders
		{ id = 33496 }, -- Tactician's Mail Armor
		{ id = 33497 }, -- Tactician's Mail Gauntlets
		{ id = 33498 }, -- Tactician's Mail Leggings
		{ id = 33499 }, -- Tactician's Mail Boots
	},
	PVPWarrior118 = {
		{ name=LIS["Field Marshal's Battlegear"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16478, disc=L["Rank"].." 13" }, -- Field Marshal's Plate Helm
		{ id = 16480, disc=L["Rank"].." 13" }, -- Field Marshal's Plate Shoulderguards
		{ id = 16477, disc=L["Rank"].." 13" }, -- Field Marshal's Plate Armor
		{ id = 16484, disc=L["Rank"].." 12" }, -- Marshal's Plate Gauntlets
		{ id = 16479, disc=L["Rank"].." 12" }, -- Marshal's Plate Legguards
		{ id = 16483, disc=L["Rank"].." 12" }, -- Marshal's Plate Boots
		{},
		{ name=LIS["Lieutenant Commander's Battlearmor"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23314, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Plate Helm
		{ id = 23315, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Plate Shoulders
		{ id = 23300, disc=L["Rank"].." 8" }, -- Knight-Captain's Plate Hauberk
		{ id = 23286, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Plate Gauntlets
		{ id = 23301, disc=L["Rank"].." 8" }, -- Knight-Captain's Plate Leggings
		{ id = 23287, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Plate Greaves
		{ name=LIS["Warlord's Battlegear"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16542, disc=L["Rank"].." 13" }, -- Warlord's Plate Headpiece
		{ id = 16544, disc=L["Rank"].." 13" }, -- Warlord's Plate Shoulders
		{ id = 16541, disc=L["Rank"].." 13" }, -- Warlord's Plate Armor
		{ id = 16548, disc=L["Rank"].." 12" }, -- General's Plate Gauntlets
		{ id = 16543, disc=L["Rank"].." 12" }, -- General's Plate Leggings
		{ id = 16545, disc=L["Rank"].." 12" }, -- General's Plate Boots
		{},
		{ name=LIS["Champion's Battlearmor"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23244, disc=L["Rank"].." 10" }, -- Champion's Plate Helm
		{ id = 23243, disc=L["Rank"].." 10" }, -- Champion's Plate Shoulders
		{ id = 22872, disc=L["Rank"].." 8" }, -- Legionnaire's Plate Hauberk
		{ id = 22868, disc=L["Rank"].." 7" }, -- Blood Guard's Plate Gauntlets
		{ id = 22873, disc=L["Rank"].." 8" }, -- Legionnaire's Plate Leggings
		{ id = 22858, disc=L["Rank"].." 7" }, -- Blood Guard's Plate Greaves
	},
	PVPWarrior = {
		{ id = 33404 }, -- Combatant's Plate Helm
		{ id = 33405 }, -- Combatant's Plate Shoulderguards
		{ id = 33406 }, -- Combatant's Plate Armor
		{ id = 33407 }, -- Combatant's Plate Gauntlets
		{ id = 33408 }, -- Combatant's Plate Leggings
		{ id = 33409 }, -- Combatant's Plate Boots
		{},
		{ id = 33680 }, -- Combatant's Plate Helm
		{ id = 33681 }, -- Combatant's Plate Shoulderguards
		{ id = 33682 }, -- Combatant's Plate Armor
		{ id = 33683 }, -- Combatant's Plate Gauntlets
		{ id = 33684 }, -- Combatant's Plate Leggings
		{ id = 33685 }, -- Combatant's Plate Boots
		{},
		{},
		{ id = 33410 }, -- Partisan's Plate Helm
		{ id = 33411 }, -- Partisan's Plate Shoulderguards
		{ id = 33412 }, -- Partisan's Plate Armor
		{ id = 33413 }, -- Partisan's Plate Gauntlets
		{ id = 33414 }, -- Partisan's Plate Leggings
		{ id = 33415 }, -- Partisan's Plate Boots
		{},
		{ id = 33686 }, -- Partisan's Plate Helm
		{ id = 33687 }, -- Partisan's Plate Shoulderguards
		{ id = 33688 }, -- Partisan's Plate Armor
		{ id = 33689 }, -- Partisan's Plate Gauntlets
		{ id = 33690 }, -- Partisan's Plate Leggings
		{ id = 33691 }, -- Partisan's Plate Boots
	},
	PVPPaladin118 = {
		{ name=LIS["Field Marshal's Aegis"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16474, disc=L["Rank"].." 13" }, -- Field Marshal's Lamellar Faceguard
		{ id = 16476, disc=L["Rank"].." 13" }, -- Field Marshal's Lamellar Pauldrons
		{ id = 16473, disc=L["Rank"].." 13" }, -- Field Marshal's Lamellar Chestplate
		{ id = 16471, disc=L["Rank"].." 12" }, -- Marshal's Lamellar Gloves
		{ id = 16475, disc=L["Rank"].." 12" }, -- Marshal's Lamellar Legplates
		{ id = 16472, disc=L["Rank"].." 12" }, -- Marshal's Lamellar Boots
		{},
		{ name=LIS["Lieutenant Commander's Redoubt"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23276, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Lamellar Headguard
		{ id = 23277, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Lamellar Shoulders
		{ id = 23272, disc=L["Rank"].." 8" }, -- Knight-Captain's Lamellar Breastplate
		{ id = 23274, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Lamellar Gauntlets
		{ id = 23273, disc=L["Rank"].." 8" }, -- Knight-Captain's Lamellar Leggings
		{ id = 23275, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Lamellar Sabatons
	},
	PVPPaladin = {
		{ id = 33584 }, -- Combatant's Lamellar Faceguard
		{ id = 33585 }, -- Combatant's Lamellar Shoulders
		{ id = 33586 }, -- Combatant's Lamellar Chestplate
		{ id = 33587 }, -- Combatant's Lamellar Gauntlets
		{ id = 33588 }, -- Combatant's Lamellar Legplates
		{ id = 33589 }, -- Combatant's Lamellar Sabatons
		{},
		{ id = 33590 }, -- Partisan's Lamellar Faceguard
		{ id = 33591 }, -- Partisan's Lamellar Shoulders
		{ id = 33592 }, -- Partisan's Lamellar Chestplate
		{ id = 33593 }, -- Partisan's Lamellar Gauntlets
		{ id = 33594 }, -- Partisan's Lamellar Legplates
		{ id = 33595 }, -- Partisan's Lamellar Sabatons
		{},
		{},
		{ id = 33602 }, -- Corpsman's Lamellar Faceguard
		{ id = 33603 }, -- Corpsman's Lamellar Pauldrons
		{ id = 33604 }, -- Corpsman's Lamellar Chestplate
		{ id = 33605 }, -- Corpsman's Lamellar Gloves
		{ id = 33606 }, -- Corpsman's Lamellar Legplates
		{ id = 33607 }, -- Corpsman's Lamellar Sabatons
		{},
		{ id = 33608 }, -- Physician's Lamellar Faceguard
		{ id = 33609 }, -- Physician's Lamellar Pauldrons
		{ id = 33610 }, -- Physician's Lamellar Chestplate
		{ id = 33611 }, -- Physician's Lamellar Gloves
		{ id = 33612 }, -- Physician's Lamellar Legplates
		{ id = 33613 }, -- Physician's Lamellar Boots
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