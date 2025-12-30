---
--- Factions.lua - Faction reputation rewards system
---
--- This module handles faction-related loot tables and reputation rewards for Atlas-TW.
--- It provides access to items available from various factions including neutral factions,
--- Alliance-specific factions, and Horde-specific factions with their reputation requirements.
---
--- Features:
--- • Comprehensive faction reward catalogs
--- • Reputation requirement tracking
--- • Faction-specific item organization
--- • Cross-faction availability indicators
--- • Integration with Babble localization
---
--- @compatible World of Warcraft 1.12
---

AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}

local L = AtlasTW.Localization.UI
local LF = AtlasTW.Localization.Factions
local LZ = AtlasTW.Localization.Zones

local Colors = AtlasTW.Colors

AtlasTW.MenuData.Factions = {
	{ name = LF["Darkmoon Faire"],        icon = "Interface\\Icons\\INV_Misc_Ticket_Tarot_Maelstrom_01",   lootpage = "DarkmoonFire",          Extra = LZ["Mulgore"]..", "..LZ["Elwynn Forest"]    },
	{ name = LF["Argent Dawn"],           icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",         	   lootpage = "ArgentDawn",		   Extra = LZ["Western Plaguelands"]..", "..LZ["Eastern Plaguelands"]  },
	{ name = LF["Brood of Nozdormu"],     icon = "Interface\\Icons\\INV_Jewelry_Ring_40",             	   lootpage = "BroodOfNozdormu",	   Extra = LZ["Tanaris"]   },
	{ name = LF["Hydraxian Waterlords"],  icon = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",   lootpage = "HydroxianWaterLords",	   Extra = LZ["Azshara"]   },
	{ name = LF["Thorium Brotherhood"],   icon = "Interface\\Icons\\INV_Ingot_Mithril",               	   lootpage = "ThoriumBrotherhood",	       Extra = LZ["Searing Gorge"]   },
	{ name = LF["Wintersaber Trainers"],  icon = "Interface\\Icons\\Ability_Mount_PinkTiger",         	   lootpage = "WintersaberTrainers",      Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LF["Wildhammer Clan"],       icon = "Interface\\Icons\\Ability_Hunter_EagleEye",        	   lootpage = "WildhammerClan",        Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LF["The League of Arathor"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07",           	   lootpage = "ArathorDefilers",   Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LF["Stormpike Guard"],       icon = "Interface\\Icons\\INV_Jewelry_StormPikeTrinket_01",  	   lootpage = "StormpikeFrostwolf",        Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LZ["Dalaran"],               icon = "Interface\\Icons\\Spell_Holy_MagicalSentry",        	   lootpage = "Dalaran",           Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LF["Silvermoon Remnant"],    icon = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf", lootpage = "SilvermoonRemnant",         	   Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LZ["Ironforge"],             icon = "Interface\\Icons\\Ability_Racial_Avatar",            	   lootpage = "Ironforge",         Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LZ["Darnassus"],             icon = "Interface\\Icons\\Ability_Racial_ShadowMeld",        	   lootpage = "Darnassus",         Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LF["Stormwind"],             icon = "Interface\\Icons\\INV_BannerPVP_02",                     lootpage = "Stormwind",         Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LF["Gnomeregan Exiles"],     icon = "Interface\\Icons\\INV_Gizmo_02",                         lootpage = "GnomereganExiles",  Extra = Colors.BLUE2..LF["Alliance"] },
	{ name = LF["Bloodsail Buccaneers"],  icon = "Interface\\Icons\\INV_Helmet_66",                        lootpage = "BloodsailBuccaneers",	   	   Extra = LZ["Stranglethorn Vale"]   },
	{ name = LF["Cenarion Circle"],       icon = "Interface\\Icons\\Spell_Nature_HealingTouch",            lootpage = "CenarionCircle",	       Extra = LZ["Silithus"]   },
	{ name = LF["Gelkis Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "GelkisClanCentaur",	   Extra = LZ["Desolace"]   },
	{ name = LF["Magram Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "MagramClanCentaur",	   Extra = LZ["Desolace"]   },
	{ name = LZ["Timbermaw Hold"],        icon = "Interface\\Icons\\INV_Misc_Horn_01",                     lootpage = "TimbermawHoldRep",	       Extra = LZ["Felwood"]   },
	{ name = LF["Zandalar Tribe"],        icon = "Interface\\Icons\\INV_Misc_Coin_08",                     lootpage = "ZandalarTribe",	       Extra = LZ["Stranglethorn Vale"]   },
	{ name = LF["Wardens of Time"],       icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Bronze",          lootpage = "WardensofTime",	       Extra = LZ["The Black Morass"]   },
	{ name = LF["Shen'dralar"],            icon = "Interface\\Icons\\INV_Misc_Book_10",          		   lootpage = "Shendralar",	       Extra = LZ["Dire Maul"]   },
	{ name = LF["Frostwolf Clan"],        icon = "Interface\\Icons\\INV_Jewelry_FrostwolfTrinket_01",      lootpage = "StormpikeFrostwolf",        Extra = Colors.RED..LF["Horde"] },
	{ name = LF["Darkspear Trolls"],      icon = "Interface\\Icons\\Racial_Troll_Berserk",                 lootpage = "DarkspearTrolls",   Extra = Colors.RED..LF["Horde"] },
	{ name = LF["Revantusk Trolls"],      icon = "Interface\\Icons\\INV_Misc_Head_Troll_01",               lootpage = "RevantuskTrolls",         Extra = Colors.RED..LF["Horde"] },
	{ name = LF["Durotar Labor Union"],   icon = "Interface\\Icons\\INV_Misc_Coin_01",                     lootpage = "DurotarLaborUnion", Extra = Colors.RED..LF["Horde"] },
	{ name = LZ["Undercity"],             icon = "Interface\\Icons\\Spell_Shadow_RaiseDead",               lootpage = "Undercity",         Extra = Colors.RED..LF["Horde"] },
	{ name = LZ["Orgrimmar"],             icon = "Interface\\Icons\\INV_BannerPVP_01",                     lootpage = "Orgrimmar",         Extra = Colors.RED..LF["Horde"] },
	{ name = LZ["Thunder Bluff"],         icon = "Interface\\Icons\\INV_Misc_Foot_Centaur",                lootpage = "ThunderBluff",      Extra = Colors.RED..LF["Horde"] },
}

---
--- Displays the faction reputation rewards menu
--- Shows all available factions with their reputation rewards, organized by neutral,
--- Alliance-specific, and Horde-specific factions with location information
--- @return nil
--- @usage AtlasTWLootRepMenu()
---
function AtlasTWLootRepMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Factions"], AtlasTW.MenuData.Factions)
end