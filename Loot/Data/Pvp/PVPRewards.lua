local _G = getfenv()
AtlasTW = _G.AtlasTW

--Instance required libraries
local L = AtlasTW.Local
local BF = AceLibrary("Babble-Faction-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasLoot_Data = AtlasLoot_Data or {}

local pvpRewards = {
	PVPWeapons = {
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 14"},
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
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 14"},
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
	},
	PvP60Accessories = {
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 1"}, --*1
		{ id = 15196 }, -- Private's Tabard
		{ id = 18839, disc=L["Consumable"] }, -- Combat Healing Potion
		{ id = 18841, disc=L["Consumable"] }, -- Combat Mana Potion
		{},
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 2"},
		{ id = 18862 }, -- Insignia of the Alliance
		{ id = 18859 }, -- Insignia of the Alliance
		{ id = 18858 }, -- Insignia of the Alliance
		{ id = 18857 }, -- Insignia of the Alliance
		{ id = 18863 }, -- Insignia of the Alliance
		{ id = 18856 }, -- Insignia of the Alliance
		{ id = 18864 }, -- Insignia of the Alliance
		{ id = 18854 }, -- Insignia of the Alliance
		{},
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 1"}, --*1
		{ id = 15197 }, -- Scout's Tabard
		{ id = 18839, disc=L["Consumable"] }, -- Combat Healing Potion
		{ id = 18841, disc=L["Consumable"] }, -- Combat Mana Potion
		{},
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 2"},
		{ id = 18851 }, -- Insignia of the Horde
		{ id = 18850 }, -- Insignia of the Horde
		{ id = 18852 }, -- Insignia of the Horde
		{ id = 18849 }, -- Insignia of the Horde
		{ id = 18853 }, -- Insignia of the Horde
		{ id = 18846 }, -- Insignia of the Horde
		{ id = 18845 }, -- Insignia of the Horde
		{ id = 18834 }, -- Insignia of the Horde
		{},
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 3"}, --*1
		{ id = 18440 }, -- Sergeant's Cape 3
		{ id = 18441 }, -- Sergeant's Cape 3
		{ id = 16342 }, -- Sergeant's Cape 3
		{},
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 4"},
		{ id = 18442 }, -- Master Sergeant's Insignia 4
		{ id = 18444 }, -- Master Sergeant's Insignia 4
		{ id = 18443 }, -- Master Sergeant's Insignia 4
		{},
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 5"},
		{ id = 18457 }, -- Sergeant Major's Silk Cuffs 5
		{ id = 18456 }, -- Sergeant Major's Silk Cuffs 5
		{},
		{ id = 18455 }, -- Sergeant Major's Dragonhide Armsplints 5 *15
		--Horde
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 3"}, --*1
		{ id = 18427 }, -- Sergeant's Cloak 3
		{ id = 16341 }, -- Sergeant's Cloak 3
		{ id = 18461 }, -- Sergeant's Cloak 3
		{},
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 4"},
		{ id = 15200 }, -- Senior Sergeant's Insignia 4
		{ id = 18428 }, -- Senior Sergeant's Insignia 4
		{ id = 16335 }, -- Senior Sergeant's Insignia 4
		{},
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 5"},
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
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 6"},
		{ id = 15198 }, -- Knight's Colors 6
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 9"},
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
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 6"},
		{ id = 15199 }, -- Stone Guard's Herald 6
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 9"},
		{ id = 18607, disc=L["Misc"] }, -- Horde Battle Standard 9
	},
	PVPHunter = {
		{ name=BIS["Field Marshal's Pursuit"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16465, disc=L["Rank"].." 13" }, -- Field Marshal's Chain Helm
		{ id = 16468, disc=L["Rank"].." 13" }, -- Field Marshal's Chain Spaulders
		{ id = 16466, disc=L["Rank"].." 13" }, -- Field Marshal's Chain Breastplate
		{ id = 16463, disc=L["Rank"].." 12" }, -- Marshal's Chain Grips
		{ id = 16467, disc=L["Rank"].." 12" }, -- Marshal's Chain Legguards
		{ id = 16462, disc=L["Rank"].." 12" }, -- Marshal's Chain Boots
		{},
		{ name=BIS["Lieutenant Commander's Pursuance"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23306, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Chain Helm
		{ id = 23307, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Chain Shoulders
		{ id = 23292, disc=L["Rank"].." 8" }, -- Knight-Captain's Chain Hauberk
		{ id = 23279, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Chain Vices
		{ id = 23293, disc=L["Rank"].." 8" }, -- Knight-Captain's Chain Legguards
		{ id = 23278, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Chain Greaves
		{ name=BIS["Warlord's Pursuit"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16566, disc=L["Rank"].." 13" }, -- Warlord's Chain Helmet
		{ id = 16568, disc=L["Rank"].." 13" }, -- Warlord's Chain Shoulders
		{ id = 16565, disc=L["Rank"].." 13" }, -- Warlord's Chain Chestpiece
		{ id = 16571, disc=L["Rank"].." 12" }, -- General's Chain Gloves
		{ id = 16567, disc=L["Rank"].." 12" }, -- General's Chain Legguards
		{ id = 16569, disc=L["Rank"].." 12" }, -- General's Chain Boots
		{},
		{ name=BIS["Champion's Pursuance"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23251, disc=L["Rank"].." 10" }, -- Champion's Chain Helm
		{ id = 23252, disc=L["Rank"].." 10" }, -- Champion's Chain Shoulders
		{ id = 22874, disc=L["Rank"].." 8" }, -- Legionnaire's Chain Hauberk
		{ id = 22862, disc=L["Rank"].." 7" }, -- Blood Guard's Chain Vices
		{ id = 22875, disc=L["Rank"].." 8" }, -- Legionnaire's Chain Legguards
		{ id = 22843, disc=L["Rank"].." 7" }, -- Blood Guard's Chain Greaves
	},
	PVPMage = {
		{ name=BIS["Field Marshal's Regalia"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16441, disc=L["Rank"].." 13" }, -- Field Marshal's Coronet
		{ id = 16444, disc=L["Rank"].." 13" }, -- Field Marshal's Silk Spaulders
		{ id = 16443, disc=L["Rank"].." 13" }, -- Field Marshal's Silk Vestments
		{ id = 16440, disc=L["Rank"].." 12" }, -- Marshal's Silk Gloves
		{ id = 16442, disc=L["Rank"].." 12" }, -- Marshal's Silk Leggings
		{ id = 16437, disc=L["Rank"].." 12" }, -- Marshal's Silk Footwraps
		{},
		{ name=BIS["Lieutenant Commander's Arcanum"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23318, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Silk Cowl
		{ id = 23319, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Silk Mantle
		{ id = 23305, disc=L["Rank"].." 8" }, -- Knight-Captain's Silk Tunic
		{ id = 23290, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Silk Handwraps
		{ id = 23304, disc=L["Rank"].." 8" }, -- Knight-Captain's Silk Legguards
		{ id = 23291, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Silk Walkers
		{ name=BIS["Warlord's Regalia"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16533, disc=L["Rank"].." 13" }, -- Warlord's Silk Cowl
		{ id = 16536, disc=L["Rank"].." 13" }, -- Warlord's Silk Amice
		{ id = 16535, disc=L["Rank"].." 13" }, -- Warlord's Silk Raiment
		{ id = 16540, disc=L["Rank"].." 12" }, -- General's Silk Handguards
		{ id = 16534, disc=L["Rank"].." 12" }, -- General's Silk Trousers
		{ id = 16539, disc=L["Rank"].." 12" }, -- General's Silk Boots
		{},
		{ name=BIS["Champion's Arcanum"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23263, disc=L["Rank"].." 10" }, -- Champion's Silk Cowl
		{ id = 23264, disc=L["Rank"].." 10" }, -- Champion's Silk Mantle
		{ id = 22886, disc=L["Rank"].." 8" }, -- Legionnaire's Silk Tunic
		{ id = 22870, disc=L["Rank"].." 7" }, -- Blood Guard's Silk Handwraps
		{ id = 22883, disc=L["Rank"].." 8" }, -- Legionnaire's Silk Legguards
		{ id = 22860, disc=L["Rank"].." 7" }, -- Blood Guard's Silk Walkers
	},
	PVPPriest = {
		{ name=BIS["Field Marshal's Raiment"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 17602, disc=L["Rank"].." 13" }, -- Field Marshal's Headdress
		{ id = 17604, disc=L["Rank"].." 13" }, -- Field Marshal's Satin Mantle
		{ id = 17605, disc=L["Rank"].." 13" }, -- Field Marshal's Satin Vestments
		{ id = 17608, disc=L["Rank"].." 12" }, -- Marshal's Satin Gloves
		{ id = 17603, disc=L["Rank"].." 12" }, -- Marshal's Satin Pants
		{ id = 17607, disc=L["Rank"].." 12" }, -- Marshal's Satin Sandals
		{},
		{ name=BIS["Lieutenant Commander's Investiture"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23316, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Satin Hood
		{ id = 23317, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Satin Mantle
		{ id = 23303, disc=L["Rank"].." 8" }, -- Knight-Captain's Satin Tunic
		{ id = 23288, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Satin Handwraps
		{ id = 23302, disc=L["Rank"].." 8" }, -- Knight-Captain's Satin Legguards
		{ id = 23289, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Satin Walkers
		{ name=BIS["Warlord's Raiment"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 17623, disc=L["Rank"].." 13" }, -- Warlord's Satin Cowl
		{ id = 17622, disc=L["Rank"].." 13" }, -- Warlord's Satin Mantle
		{ id = 17624, disc=L["Rank"].." 13" }, -- Warlord's Satin Robes
		{ id = 17620, disc=L["Rank"].." 12" }, -- General's Satin Gloves
		{ id = 17625, disc=L["Rank"].." 12" }, -- General's Satin Leggings
		{ id = 17618, disc=L["Rank"].." 12" }, -- General's Satin Boots
		{},
		{ name=BIS["Champion's Investiture"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23261, disc=L["Rank"].." 10" }, -- Champion's Satin Hood
		{ id = 23262, disc=L["Rank"].." 10" }, -- Champion's Satin Mantle
		{ id = 22885, disc=L["Rank"].." 8" }, -- Legionnaire's Satin Tunic
		{ id = 22869, disc=L["Rank"].." 7" }, -- Blood Guard's Satin Handwraps
		{ id = 22882, disc=L["Rank"].." 8" }, -- Legionnaire's Satin Legguards
		{ id = 22859, disc=L["Rank"].." 7" }, -- Blood Guard's Satin Walkers
	},
	PVPWarlock = {
		{ name=BIS["Field Marshal's Threads"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 17578, disc=L["Rank"].." 13" }, -- Field Marshal's Coronal
		{ id = 17580, disc=L["Rank"].." 13" }, -- Field Marshal's Dreadweave Shoulders
		{ id = 17581, disc=L["Rank"].." 13" }, -- Field Marshal's Dreadweave Robe
		{ id = 17584, disc=L["Rank"].." 12" }, -- Marshal's Dreadweave Gloves
		{ id = 17579, disc=L["Rank"].." 12" }, -- Marshal's Dreadweave Leggings
		{ id = 17583, disc=L["Rank"].." 12" }, -- Marshal's Dreadweave Boots
		{},
		{ name=BIS["Lieutenant Commander's Dreadgear"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23310, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dreadweave Cowl
		{ id = 23311, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dreadweave Spaulders
		{ id = 23297, disc=L["Rank"].." 8" }, -- Knight-Captain's Dreadweave Tunic
		{ id = 23282, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dreadweave Handwraps
		{ id = 23296, disc=L["Rank"].." 8" }, -- Knight-Captain's Dreadweave Legguards
		{ id = 23283, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dreadweave Walkers
		{ name=BIS["Warlord's Threads"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 17591, disc=L["Rank"].." 13" }, -- Warlord's Dreadweave Hood
		{ id = 17590, disc=L["Rank"].." 13" }, -- Warlord's Dreadweave Mantle
		{ id = 17592, disc=L["Rank"].." 13" }, -- Warlord's Dreadweave Robe
		{ id = 17588, disc=L["Rank"].." 12" }, -- General's Dreadweave Gloves
		{ id = 17593, disc=L["Rank"].." 12" }, -- General's Dreadweave Pants
		{ id = 17586, disc=L["Rank"].." 12" }, -- General's Dreadweave Boots
		{},
		{ name=BIS["Champion's Dreadgear"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23255, disc=L["Rank"].." 10" }, -- Champion's Dreadweave Cowl
		{ id = 23256, disc=L["Rank"].." 10" }, -- Champion's Dreadweave Spaulders
		{ id = 22884, disc=L["Rank"].." 8" }, -- Legionnaire's Dreadweave Tunic
		{ id = 22865, disc=L["Rank"].." 7" }, -- Blood Guard's Dreadweave Handwraps
		{ id = 22881, disc=L["Rank"].." 8" }, -- Legionnaire's Dreadweave Legguards
		{ id = 22855, disc=L["Rank"].." 7" }, -- Blood Guard's Dreadweave Walkers
	},
	PVPRogue = {
		{ name=BIS["Field Marshal's Vestments"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16455, disc=L["Rank"].." 13" }, -- Field Marshal's Leather Mask
		{ id = 16457, disc=L["Rank"].." 13" }, -- Field Marshal's Leather Epaulets
		{ id = 16453, disc=L["Rank"].." 13" }, -- Field Marshal's Leather Chestpiece
		{ id = 16454, disc=L["Rank"].." 12" }, -- Marshal's Leather Handgrips
		{ id = 16456, disc=L["Rank"].." 12" }, -- Marshal's Leather Leggings
		{ id = 16446, disc=L["Rank"].." 12" }, -- Marshal's Leather Footguards
		{},
		{ name=BIS["Lieutenant Commander's Guard"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23312, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Leather Helm
		{ id = 23313, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Leather Shoulders
		{ id = 23298, disc=L["Rank"].." 8" }, -- Knight-Captain's Leather Chestpiece
		{ id = 23284, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Leather Grips
		{ id = 23299, disc=L["Rank"].." 8" }, -- Knight-Captain's Leather Legguards
		{ id = 23285, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Leather Walkers
		{ name=BIS["Warlord's Vestments"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16561, disc=L["Rank"].." 13" }, -- Warlord's Leather Helm
		{ id = 16562, disc=L["Rank"].." 13" }, -- Warlord's Leather Spaulders
		{ id = 16563, disc=L["Rank"].." 13" }, -- Warlord's Leather Breastplate
		{ id = 16560, disc=L["Rank"].." 12" }, -- General's Leather Mitts
		{ id = 16564, disc=L["Rank"].." 12" }, -- General's Leather Legguards
		{ id = 16558, disc=L["Rank"].." 12" }, -- General's Leather Treads
		{},
		{ name=BIS["Champion's Guard"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23257, disc=L["Rank"].." 10" }, -- Champion's Leather Helm
		{ id = 23258, disc=L["Rank"].." 10" }, -- Champion's Leather Shoulders
		{ id = 22879, disc=L["Rank"].." 8" }, -- Legionnaire's Leather Chestpiece
		{ id = 22864, disc=L["Rank"].." 7" }, -- Blood Guard's Leather Grips
		{ id = 22880, disc=L["Rank"].." 8" }, -- Legionnaire's Leather Legguards
		{ id = 22856, disc=L["Rank"].." 7" }, -- Blood Guard's Leather Walkers
	},
	PVPDruid = {
		{ name=BIS["Field Marshal's Sanctuary"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16451, disc=L["Rank"].." 13" }, -- Field Marshal's Dragonhide Helmet
		{ id = 16449, disc=L["Rank"].." 13" }, -- Field Marshal's Dragonhide Spaulders
		{ id = 16452, disc=L["Rank"].." 13" }, -- Field Marshal's Dragonhide Breastplate
		{ id = 16448, disc=L["Rank"].." 12" }, -- Marshal's Dragonhide Gauntlets
		{ id = 16450, disc=L["Rank"].." 12" }, -- Marshal's Dragonhide Legguards
		{ id = 16459, disc=L["Rank"].." 12" }, -- Marshal's Dragonhide Boots
		{},
		{ name=BIS["Lieutenant Commander's Refuge"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23308, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dragonhide Headguard
		{ id = 23309, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Dragonhide Shoulders
		{ id = 23294, disc=L["Rank"].." 8" }, -- Knight-Captain's Dragonhide Chestpiece
		{ id = 23280, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dragonhide Grips
		{ id = 23295, disc=L["Rank"].." 8" }, -- Knight-Captain's Dragonhide Leggings
		{ id = 23281, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Dragonhide Treads
		{ name=BIS["Warlord's Sanctuary"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16550, disc=L["Rank"].." 13" }, -- Warlord's Dragonhide Helmet
		{ id = 16551, disc=L["Rank"].." 13" }, -- Warlord's Dragonhide Epaulets
		{ id = 16549, disc=L["Rank"].." 13" }, -- Warlord's Dragonhide Hauberk
		{ id = 16555, disc=L["Rank"].." 12" }, -- General's Dragonhide Gloves
		{ id = 16552, disc=L["Rank"].." 12" }, -- General's Dragonhide Leggings
		{ id = 16554, disc=L["Rank"].." 12" }, -- General's Dragonhide Boots
		{},
		{ name=BIS["Champion's Refuge"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23253, disc=L["Rank"].." 10" }, -- Champion's Dragonhide Headguard
		{ id = 23254, disc=L["Rank"].." 10" }, -- Champion's Dragonhide Shoulders
		{ id = 22877, disc=L["Rank"].." 8" }, -- Legionnaire's Dragonhide Chestpiece
		{ id = 22863, disc=L["Rank"].." 7" }, -- Blood Guard's Dragonhide Grips
		{ id = 22878, disc=L["Rank"].." 8" }, -- Legionnaire's Dragonhide Leggings
		{ id = 22852, disc=L["Rank"].." 7" }, -- Blood Guard's Dragonhide Treads
	},
	PVPShaman = {
		{ name=BIS["Warlord's Earthshaker"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16578, disc=L["Rank"].." 13" }, -- Warlord's Mail Helm
		{ id = 16580, disc=L["Rank"].." 13" }, -- Warlord's Mail Spaulders
		{ id = 16577, disc=L["Rank"].." 13" }, -- Warlord's Mail Armor
		{ id = 16574, disc=L["Rank"].." 12" }, -- General's Mail Gauntlets
		{ id = 16579, disc=L["Rank"].." 12" }, -- General's Mail Leggings
		{ id = 16573, disc=L["Rank"].." 12" }, -- General's Mail Boots
		{},
		{ name=BIS["Champion's Stormcaller"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23259, disc=L["Rank"].." 10" }, -- Champion's Mail Headguard
		{ id = 23260, disc=L["Rank"].." 10" }, -- Champion's Mail Pauldrons
		{ id = 22876, disc=L["Rank"].." 8" }, -- Legionnaire's Mail Hauberk
		{ id = 22867, disc=L["Rank"].." 7" }, -- Blood Guard's Mail Vices
		{ id = 22887, disc=L["Rank"].." 8" }, -- Legionnaire's Mail Legguards
		{ id = 22857, disc=L["Rank"].." 7" }, -- Blood Guard's Mail Greaves
	},
	PVPWarrior = {
		{ name=BIS["Field Marshal's Battlegear"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16478, disc=L["Rank"].." 13" }, -- Field Marshal's Plate Helm
		{ id = 16480, disc=L["Rank"].." 13" }, -- Field Marshal's Plate Shoulderguards
		{ id = 16477, disc=L["Rank"].." 13" }, -- Field Marshal's Plate Armor
		{ id = 16484, disc=L["Rank"].." 12" }, -- Marshal's Plate Gauntlets
		{ id = 16479, disc=L["Rank"].." 12" }, -- Marshal's Plate Legguards
		{ id = 16483, disc=L["Rank"].." 12" }, -- Marshal's Plate Boots
		{},
		{ name=BIS["Lieutenant Commander's Battlearmor"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23314, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Plate Helm
		{ id = 23315, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Plate Shoulders
		{ id = 23300, disc=L["Rank"].." 8" }, -- Knight-Captain's Plate Hauberk
		{ id = 23286, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Plate Gauntlets
		{ id = 23301, disc=L["Rank"].." 8" }, -- Knight-Captain's Plate Leggings
		{ id = 23287, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Plate Greaves
		{ name=BIS["Warlord's Battlegear"], icon="INV_BannerPVP_01", extra=L["Epic Set"] },
		{ id = 16542, disc=L["Rank"].." 13" }, -- Warlord's Plate Headpiece
		{ id = 16544, disc=L["Rank"].." 13" }, -- Warlord's Plate Shoulders
		{ id = 16541, disc=L["Rank"].." 13" }, -- Warlord's Plate Armor
		{ id = 16548, disc=L["Rank"].." 12" }, -- General's Plate Gauntlets
		{ id = 16543, disc=L["Rank"].." 12" }, -- General's Plate Leggings
		{ id = 16545, disc=L["Rank"].." 12" }, -- General's Plate Boots
		{},
		{ name=BIS["Champion's Battlearmor"], icon="INV_BannerPVP_01", extra=L["Rare Set"] },
		{ id = 23244, disc=L["Rank"].." 10" }, -- Champion's Plate Helm
		{ id = 23243, disc=L["Rank"].." 10" }, -- Champion's Plate Shoulders
		{ id = 22872, disc=L["Rank"].." 8" }, -- Legionnaire's Plate Hauberk
		{ id = 22868, disc=L["Rank"].." 7" }, -- Blood Guard's Plate Gauntlets
		{ id = 22873, disc=L["Rank"].." 8" }, -- Legionnaire's Plate Leggings
		{ id = 22858, disc=L["Rank"].." 7" }, -- Blood Guard's Plate Greaves
	},
	PVPPaladin = {
		{ name=BIS["Field Marshal's Aegis"], icon="INV_BannerPVP_02", extra=L["Epic Set"] },
		{ id = 16474, disc=L["Rank"].." 13" }, -- Field Marshal's Lamellar Faceguard
		{ id = 16476, disc=L["Rank"].." 13" }, -- Field Marshal's Lamellar Pauldrons
		{ id = 16473, disc=L["Rank"].." 13" }, -- Field Marshal's Lamellar Chestplate
		{ id = 16471, disc=L["Rank"].." 12" }, -- Marshal's Lamellar Gloves
		{ id = 16475, disc=L["Rank"].." 12" }, -- Marshal's Lamellar Legplates
		{ id = 16472, disc=L["Rank"].." 12" }, -- Marshal's Lamellar Boots
		{},
		{ name=BIS["Lieutenant Commander's Redoubt"], icon="INV_BannerPVP_02", extra=L["Rare Set"] },
		{ id = 23276, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Lamellar Headguard
		{ id = 23277, disc=L["Rank"].." 10" }, -- Lieutenant Commander's Lamellar Shoulders
		{ id = 23272, disc=L["Rank"].." 8" }, -- Knight-Captain's Lamellar Breastplate
		{ id = 23274, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Lamellar Gauntlets
		{ id = 23273, disc=L["Rank"].." 8" }, -- Knight-Captain's Lamellar Leggings
		{ id = 23275, disc=L["Rank"].." 7" }, -- Knight-Lieutenant's Lamellar Sabatons
	},
	PvPMountsPvP = {
		{ name = BF["Alliance"], icon="INV_BannerPVP_02", extra=L["Rank"].." 11"},
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
		{ name = BF["Horde"], icon="INV_BannerPVP_01", extra=L["Rank"].." 11"},
		{ id = 19029 }, -- Horn of the Frostwolf Howler
		{},
		{ id = 18245 }, -- Horn of the Black War Wolf
		{ id = 18247 }, -- Black War Kodo
		{ id = 18246 }, -- Whistle of the Black War Raptor
		{ id = 18248 }, -- Red Skeletal Warhorse
	}
}

for k, v in pairs(pvpRewards) do
	AtlasLoot_Data[k] = v
end