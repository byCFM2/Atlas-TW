local L = AtlasTW.Local
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")

AtlasTW.Loot.FactionsData = {
	{ name = BF["Argent Dawn"],           icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",         	   lootpage = "ArgentDawn",		   Extra = BZ["Western Plaguelands"]..", "..BZ["Eastern Plaguelands"]  },
	{ name = BF["Brood of Nozdormu"],     icon = "Interface\\Icons\\INV_Jewelry_Ring_40",             	   lootpage = "BroodOfNozdormu",	   Extra = BZ["Tanaris"]   },
	{ name = BF["Darkmoon Faire"],        icon = "Interface\\Icons\\INV_Misc_Ticket_Tarot_Maelstrom_01",   lootpage = "DarkmoonFire",          Extra = BZ["Mulgore"]..", "..BZ["Elwynn Forest"]    },
	{ name = BF["Hydraxian Waterlords"],  icon = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",   lootpage = "HydroxianWaterLords",	   Extra = BZ["Azshara"]   },
	{ name = BF["Thorium Brotherhood"],   icon = "Interface\\Icons\\INV_Ingot_Mithril",               	   lootpage = "ThoriumBrotherhood",	       Extra = BZ["Searing Gorge"]   },
	{ name = BF["Wintersaber Trainers"],  icon = "Interface\\Icons\\Ability_Mount_PinkTiger",         	   lootpage = "WintersaberTrainers",      Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Wildhammer Clan"],       icon = "Interface\\Icons\\Ability_Hunter_EagleEye",        	   lootpage = "WildhammerClan",        Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["The League of Arathor"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07",           	   lootpage = "ArathorDefilers",   Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Stormpike Guard"],       icon = "Interface\\Icons\\INV_Jewelry_StormPikeTrinket_01",  	   lootpage = "StormpikeFrostwolf",        Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BZ["Dalaran"],               icon = "Interface\\Icons\\Spell_Holy_MagicalSentry",        	   lootpage = "Dalaran",           Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Silvermoon Remnant"],    icon = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf", lootpage = "SilvermoonRemnant",         	   Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Ironforge"],             icon = "Interface\\Icons\\Ability_Racial_Avatar",            	   lootpage = "Ironforge",         Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Darnassus"],             icon = "Interface\\Icons\\Ability_Racial_ShadowMeld",        	   lootpage = "Darnassus",         Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Stormwind"],             icon = "Interface\\Icons\\INV_BannerPVP_02",                     lootpage = "Stormwind",         Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Gnomeregan Exiles"],     icon = "Interface\\Icons\\INV_Gizmo_02",                         lootpage = "GnomereganExiles",  Extra = "|cff2773ff"..BF["Alliance"] },
	{ name = BF["Bloodsail Buccaneers"],  icon = "Interface\\Icons\\INV_Helmet_66",                        lootpage = "BloodsailBuccaneers",	   	   Extra = BZ["Stranglethorn Vale"]   },
	{ name = BF["Cenarion Circle"],       icon = "Interface\\Icons\\Spell_Nature_HealingTouch",            lootpage = "CenarionCircle",	       Extra = BZ["Silithus"]   },
	{ name = BF["Gelkis Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "GelkisClanCentaur",	   Extra = BZ["Desolace"]   },
	{ name = BF["Magram Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "MagramClanCentaur",	   Extra = BZ["Desolace"]   },
	{ name = BF["Timbermaw Hold"],        icon = "Interface\\Icons\\INV_Misc_Horn_01",                     lootpage = "TimbermawHold",	       Extra = BZ["Felwood"]   },
	{ name = BF["Zandalar Tribe"],        icon = "Interface\\Icons\\INV_Misc_Coin_08",                     lootpage = "ZandalarTribe",	       Extra = BZ["Stranglethorn Vale"]   },
	{ name = BF["Wardens of Time"],       icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Bronze",          lootpage = "WardensofTime",	       Extra = L["Caverns of Time"]   },
	{ name = BF["Shen'dralar"],            icon = "Interface\\Icons\\INV_Misc_Book_10",          		   lootpage = "Shendralar",	       Extra = BZ["Dire Maul"]   },
	{ name = BF["Frostwolf Clan"],        icon = "Interface\\Icons\\INV_Jewelry_FrostwolfTrinket_01",      lootpage = "StormpikeFrostwolf",        Extra = "|cffFF0000"..BF["Horde"] },
	{ name = BF["Darkspear Trolls"],      icon = "Interface\\Icons\\Racial_Troll_Berserk",                 lootpage = "DarkspearTrolls",   Extra = "|cffFF0000"..BF["Horde"] },
	{ name = BF["Revantusk Trolls"],      icon = "Interface\\Icons\\INV_Misc_Head_Troll_01",               lootpage = "RevantuskTrolls",         Extra = "|cffFF0000"..BF["Horde"] },
	{ name = BF["Durotar Labor Union"],   icon = "Interface\\Icons\\INV_Misc_Coin_01",                     lootpage = "DurotarLaborUnion", Extra = "|cffFF0000"..BF["Horde"] },
	{ name = BF["Undercity"],             icon = "Interface\\Icons\\Spell_Shadow_RaiseDead",               lootpage = "Undercity",         Extra = "|cffFF0000"..BF["Horde"] },
	{ name = BF["Orgrimmar"],             icon = "Interface\\Icons\\INV_BannerPVP_01",                     lootpage = "Orgrimmar",         Extra = "|cffFF0000"..BF["Horde"] },
	{ name = BF["Thunder Bluff"],         icon = "Interface\\Icons\\INV_Misc_Foot_Centaur",                lootpage = "ThunderBluff",      Extra = "|cffFF0000"..BF["Horde"] },
}

function AtlasLootRepMenu()
    AtlasLootItemsFrame.StoredElement = { menuName = L["Factions"] }
    AtlasLootItemsFrame.StoredMenu = AtlasTW.Loot.FactionsData
    AtlasTW.Loot.ScrollBarLootUpdate()
end