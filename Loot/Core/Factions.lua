local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")

local factionsData = {
	{ name = "Argent Dawn", lib = BF,           icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",         	   lootpage = "Argent1",		   extraText = BZ["Western Plaguelands"]..", "..BZ["Eastern Plaguelands"]  },
	{ name = "Brood of Nozdormu", lib = BF,     icon = "Interface\\Icons\\INV_Jewelry_Ring_40",             	   lootpage = "AQBroodRings",	   extraText = BZ["Tanaris"]   },
	{ name = "Darkmoon Faire", lib = BF,        icon = "Interface\\Icons\\INV_Misc_Ticket_Tarot_Maelstrom_01",   lootpage = "Darkmoon",          extraText = BZ["Mulgore"]..", "..BZ["Elwynn Forest"]    },
	{ name = "Hydraxian Waterlords", lib = BF,  icon = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",   lootpage = "WaterLords1",	   extraText = BZ["Azshara"]   },
	{ name = "Thorium Brotherhood", lib = BF,   icon = "Interface\\Icons\\INV_Ingot_Mithril",               	   lootpage = "Thorium1",	       extraText = BZ["Searing Gorge"]   },
	{ name = "Wintersaber Trainers", lib = BF,  icon = "Interface\\Icons\\Ability_Mount_PinkTiger",         	   lootpage = "Wintersaber1",      extraText = "A" },
	{ name = "Wildhammer Clan", lib = BF,       icon = "Interface\\Icons\\Ability_Hunter_EagleEye",        	   lootpage = "Wildhammer",        extraText = "A" },
	{ name = "The League of Arathor", lib = BF, icon = "Interface\\Icons\\INV_Jewelry_Amulet_07",           	   lootpage = "LeagueofArathor",   extraText = "A" },
	{ name = "Stormpike Guard", lib = BF,       icon = "Interface\\Icons\\INV_Jewelry_StormPikeTrinket_01",  	   lootpage = "Stormpike1",        extraText = "A" },
	{ name = "Dalaran", lib = BZ,               icon = "Interface\\Icons\\Spell_Holy_MagicalSentry",        	   lootpage = "Dalaran",           extraText = "A" },
	{ name = "Silvermoon Remnant", lib = BF,    icon = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf", lootpage = "Helf",         	   extraText = "A" },
	{ name = "Ironforge", lib = BF,             icon = "Interface\\Icons\\Ability_Racial_Avatar",            	   lootpage = "Ironforge",         extraText = "A" },
	{ name = "Darnassus", lib = BF,             icon = "Interface\\Icons\\Ability_Racial_ShadowMeld",        	   lootpage = "Darnassus",         extraText = "A" },
	{ name = "Stormwind", lib = BF,             icon = "Interface\\Icons\\INV_BannerPVP_02",                     lootpage = "Stormwind",         extraText = "A" },
	{ name = "Gnomeregan Exiles", lib = BF,     icon = "Interface\\Icons\\INV_Gizmo_02",                         lootpage = "GnomereganExiles",  extraText = "A" },
	{ name = "Bloodsail Buccaneers", lib = BF,  icon = "Interface\\Icons\\INV_Helmet_66",                        lootpage = "Bloodsail1",	   	   extraText = BZ["Stranglethorn Vale"]   },
	{ name = "Cenarion Circle", lib = BF,       icon = "Interface\\Icons\\Spell_Nature_HealingTouch",            lootpage = "Cenarion1",	       extraText = BZ["Silithus"]   },
	{ name = "Gelkis Clan Centaur", lib = BF,   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "GelkisClan1",	   extraText = BZ["Desolace"]   },
	{ name = "Magram Clan Centaur", lib = BF,   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",             lootpage = "MagramClan1",	   extraText = BZ["Desolace"]   },
	{ name = "Timbermaw Hold", lib = BF,        icon = "Interface\\Icons\\INV_Misc_Horn_01",                     lootpage = "Timbermaw",	       extraText = BZ["Felwood"]   },
	{ name = "Zandalar Tribe", lib = BF,        icon = "Interface\\Icons\\INV_Misc_Coin_08",                     lootpage = "Zandalar1",	       extraText = BZ["Stranglethorn Vale"]   },
	{ name = "Wardens of Time", lib = BF,       icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Bronze",          lootpage = "Warderns1",	       extraText = L["Caverns of Time"]   },
	{}, -- space for a gap
	{ name = "Frostwolf Clan", lib = BF,        icon = "Interface\\Icons\\INV_Jewelry_FrostwolfTrinket_01",      lootpage = "Frostwolf1",        extraText = "H" },
	{ name = "Darkspear Trolls", lib = BF,      icon = "Interface\\Icons\\Racial_Troll_Berserk",                 lootpage = "DarkspearTrolls",   extraText = "H" },
	{ name = "Revantusk Trolls", lib = BF,      icon = "Interface\\Icons\\INV_Misc_Head_Troll_01",               lootpage = "Revantusk",         extraText = "H" },
	{ name = "Durotar Labor Union", lib = BF,   icon = "Interface\\Icons\\INV_Misc_Coin_01",                     lootpage = "DurotarLaborUnion", extraText = "H" },
	{ name = "Undercity", lib = BF,             icon = "Interface\\Icons\\Spell_Shadow_RaiseDead",               lootpage = "Undercity",         extraText = "H" },
	{ name = "Orgrimmar", lib = BF,             icon = "Interface\\Icons\\INV_BannerPVP_01",                     lootpage = "Orgrimmar",         extraText = "H" },
	{ name = "Thunder Bluff", lib = BF,         icon = "Interface\\Icons\\INV_Misc_Foot_Centaur",                lootpage = "ThunderBluff",      extraText = "H" },
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
	AtlasLoot_PrepMenu(nil, L["Factions"], "Factions")
    AtlasLoot_ShowMenu(factionsData, { getExtraText = getExtraText, maxItems = table.getn(factionsData) })
end