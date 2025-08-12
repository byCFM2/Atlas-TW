local L = AtlasTW.Local
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")

AtlasTW.Loot.FactionsData = {
	{ name = BF["Argent Dawn"],           icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",         	   lootpage = "ArgentDawn",		   extraText = BZ["Western Plaguelands"]..", "..BZ["Eastern Plaguelands"]  },
	{ name = BF["Brood of Nozdormu"],     icon = "Interface\\Icons\\INV_Jewelry_Ring_40",             	   lootpage = "BroodOfNozdormu",	   extraText = BZ["Tanaris"]   },
	{ name = BF["Darkmoon Faire"],        icon = "Interface\\Icons\\INV_Misc_Ticket_Tarot_Maelstrom_01",   lootpage = "DarkmoonFire",          extraText = BZ["Mulgore"]..", "..BZ["Elwynn Forest"]    },
	{ name = BF["Hydraxian Waterlords"],  icon = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",   lootpage = "HydroxianWaterLords",	   extraText = BZ["Azshara"]   },
	{ name = BF["Thorium Brotherhood"],   icon = "Interface\\Icons\\INV_Ingot_Mithril",               	   lootpage = "ThoriumBrotherhood",	       extraText = BZ["Searing Gorge"]   },
	{ name = BF["Wintersaber Trainers"],  icon = "Interface\\Icons\\Ability_Mount_PinkTiger",         	   lootpage = "WintersaberTrainers",      extraText = "A" },
	{ name = BF["Wildhammer Clan"],       icon = "Interface\\Icons\\Ability_Hunter_EagleEye",        	   lootpage = "WildhammerClan",        extraText = "A" },
	{ name = BF["The League of Arathor"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07",           	   lootpage = "ArathorDefilers",   extraText = "A" },
	{ name = BF["Stormpike Guard"],       icon = "Interface\\Icons\\INV_Jewelry_StormPikeTrinket_01",  	   lootpage = "StormpikeFrostwolf",        extraText = "A" },
	{ name = BZ["Dalaran"],               icon = "Interface\\Icons\\Spell_Holy_MagicalSentry",        	   lootpage = "Dalaran",           extraText = "A" },
	{ name = BF["Silvermoon Remnant"],    icon = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf", lootpage = "SilvermoonRemnant",         	   extraText = "A" },
	{ name = BF["Ironforge"],             icon = "Interface\\Icons\\Ability_Racial_Avatar",            	   lootpage = "Ironforge",         extraText = "A" },
	{ name = BF["Darnassus"],             icon = "Interface\\Icons\\Ability_Racial_ShadowMeld",        	   lootpage = "Darnassus",         extraText = "A" },
	{ name = BF["Stormwind"],             icon = "Interface\\Icons\\INV_BannerPVP_02",                     lootpage = "Stormwind",         extraText = "A" },
	{ name = BF["Gnomeregan Exiles"],     icon = "Interface\\Icons\\INV_Gizmo_02",                         lootpage = "GnomereganExiles",  extraText = "A" },
	{ name = BF["Bloodsail Buccaneers"],  icon = "Interface\\Icons\\INV_Helmet_66",                        lootpage = "BloodsailBuccaneers",	   	   extraText = BZ["Stranglethorn Vale"]   },
	{ name = BF["Cenarion Circle"],       icon = "Interface\\Icons\\Spell_Nature_HealingTouch",            lootpage = "CenarionCircle",	       extraText = BZ["Silithus"]   },
	{ name = BF["Gelkis Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "GelkisClanCentaur",	   extraText = BZ["Desolace"]   },
	{ name = BF["Magram Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "MagramClanCentaur",	   extraText = BZ["Desolace"]   },
	{ name = BF["Timbermaw Hold"],        icon = "Interface\\Icons\\INV_Misc_Horn_01",                     lootpage = "TimbermawHold",	       extraText = BZ["Felwood"]   },
	{ name = BF["Zandalar Tribe"],        icon = "Interface\\Icons\\INV_Misc_Coin_08",                     lootpage = "ZandalarTribe",	       extraText = BZ["Stranglethorn Vale"]   },
	{ name = BF["Wardens of Time"],       icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Bronze",          lootpage = "WardensofTime",	       extraText = L["Caverns of Time"]   },
	{}, -- space for a gap
	{ name = BF["Frostwolf Clan"],        icon = "Interface\\Icons\\INV_Jewelry_FrostwolfTrinket_01",      lootpage = "StormpikeFrostwolf",        extraText = "H" },
	{ name = BF["Darkspear Trolls"],      icon = "Interface\\Icons\\Racial_Troll_Berserk",                 lootpage = "DarkspearTrolls",   extraText = "H" },
	{ name = BF["Revantusk Trolls"],      icon = "Interface\\Icons\\INV_Misc_Head_Troll_01",               lootpage = "RevantuskTrolls",         extraText = "H" },
	{ name = BF["Durotar Labor Union"],   icon = "Interface\\Icons\\INV_Misc_Coin_01",                     lootpage = "DurotarLaborUnion", extraText = "H" },
	{ name = BF["Undercity"],             icon = "Interface\\Icons\\Spell_Shadow_RaiseDead",               lootpage = "Undercity",         extraText = "H" },
	{ name = BF["Orgrimmar"],             icon = "Interface\\Icons\\INV_BannerPVP_01",                     lootpage = "Orgrimmar",         extraText = "H" },
	{ name = BF["Thunder Bluff"],         icon = "Interface\\Icons\\INV_Misc_Foot_Centaur",                lootpage = "ThunderBluff",      extraText = "H" },
}

local function getExtraText(itemData)
    if itemData.extraText == "A" then
        return "|cff2773ff"..BF["Alliance"]
    elseif itemData.extraText == "H" then
        return "|cffFF0000"..BF["Horde"]
    else
        return itemData.extraText or ""
    end
end

function AtlasLootRepMenu()
	AtlasLoot_PrepMenu(nil, L["Factions"], "AtlasLootRepMenu")
    AtlasLoot_ShowMenu(AtlasTW.Loot.FactionsData, { getExtraText = getExtraText, maxItems = table.getn(AtlasTW.Loot.FactionsData) })
end