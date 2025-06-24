local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")

local factionsData = {
	{ name = BF["Argent Dawn"],           icon = "Interface\\Icons\\INV_Jewelry_Talisman_08",          lootpage = "Argent1" },
	{ name = BF["Brood of Nozdormu"],     icon = "Interface\\Icons\\INV_Jewelry_Ring_40",              lootpage = "AQBroodRings" },
	{ name = BF["Darkmoon Faire"],        icon = "Interface\\Icons\\INV_Misc_Ticket_Tarot_Maelstrom_01", lootpage = "Darkmoon" },
	{ name = BF["Hydraxian Waterlords"],  icon = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2", lootpage = "WaterLords1" },
	{ name = BF["Thorium Brotherhood"],   icon = "Interface\\Icons\\INV_Ingot_Mithril",                lootpage = "Thorium1" },
	{ name = BF["Wintersaber Trainers"],  icon = "Interface\\Icons\\Ability_Mount_PinkTiger",          lootpage = "Wintersaber1",      side = "A" },
	{ name = BF["Wildhammer Clan"],       icon = "Interface\\Icons\\Ability_Hunter_EagleEye",          lootpage = "Wildhammer",        side = "A" },
	{ name = BF["The League of Arathor"], icon = "Interface\\Icons\\INV_Jewelry_Amulet_07",            lootpage = "LeagueofArathor",   side = "A" },
	{ name = BF["Stormpike Guard"],       icon = "Interface\\Icons\\INV_Jewelry_StormPikeTrinket_01",  lootpage = "Stormpike1",        side = "A" },
	{ name = BZ["Dalaran"],               icon = "Interface\\Icons\\Spell_Holy_MagicalSentry",         lootpage = "Dalaran",           side = "A" },
	{ name = BF["Silvermoon Remnant"],    icon = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf", lootpage = "Helf",             side = "A" },
	{ name = BF["Ironforge"],             icon = "Interface\\Icons\\Ability_Racial_Avatar",            lootpage = "Ironforge",         side = "A" },
	{ name = BF["Darnassus"],             icon = "Interface\\Icons\\Ability_Racial_ShadowMeld",        lootpage = "Darnassus",         side = "A" },
	{ name = BF["Stormwind"],             icon = "Interface\\Icons\\INV_BannerPVP_02",                 lootpage = "Stormwind",         side = "A" },
	{ name = BF["Gnomeregan Exiles"],     icon = "Interface\\Icons\\INV_Gizmo_02",                     lootpage = "GnomereganExiles",  side = "A" },
	{ name = BF["Bloodsail Buccaneers"],  icon = "Interface\\Icons\\INV_Helmet_66",                    lootpage = "Bloodsail1" },
	{ name = BF["Cenarion Circle"],       icon = "Interface\\Icons\\Spell_Nature_HealingTouch",        lootpage = "Cenarion1" },
	{ name = BF["Gelkis Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",         lootpage = "GelkisClan1" },
	{ name = BF["Magram Clan Centaur"],   icon = "Interface\\Icons\\INV_Misc_Head_Centaur_01",         lootpage = "MagramClan1" },
	{ name = BF["Timbermaw Hold"],        icon = "Interface\\Icons\\INV_Misc_Horn_01",                 lootpage = "Timbermaw" },
	{ name = BF["Zandalar Tribe"],        icon = "Interface\\Icons\\INV_Misc_Coin_08",                 lootpage = "Zandalar1" },
	{ name = BF["Wardens of Time"],       icon = "Interface\\Icons\\INV_Misc_Head_Dragon_Bronze",      lootpage = "Warderns1" },
	{},
	{ name = BF["Frostwolf Clan"],        icon = "Interface\\Icons\\INV_Jewelry_FrostwolfTrinket_01",  lootpage = "Frostwolf1",        side = "H" },
	{ name = BF["Darkspear Trolls"],      icon = "Interface\\Icons\\Racial_Troll_Berserk",             lootpage = "DarkspearTrolls",   side = "H" },
	{ name = BF["Revantusk Trolls"],      icon = "Interface\\Icons\\INV_Misc_Head_Troll_01",           lootpage = "Revantusk",         side = "H" },
	{ name = BF["Durotar Labor Union"],   icon = "Interface\\Icons\\INV_Misc_Coin_01",                 lootpage = "DurotarLaborUnion", side = "H" },
	{ name = BF["Undercity"],             icon = "Interface\\Icons\\Spell_Shadow_RaiseDead",           lootpage = "Undercity",         side = "H" },
	{ name = BF["Orgrimmar"],             icon = "Interface\\Icons\\INV_BannerPVP_01",                 lootpage = "Orgrimmar",         side = "H" },
	{ name = BF["Thunder Bluff"],         icon = "Interface\\Icons\\INV_Misc_Foot_Centaur",            lootpage = "ThunderBluff",      side = "H" },
}

function AtlasLootRepMenu()
	AtlasLoot_PrepMenu(nil, L["Factions"])
	AtlasTWCharDB.LastBoss = "REPMENU"
	AtlasTWCharDB.LastBossText = "Factions"

	local menuItem
	local extraText
	local data
	for i = 1, table.getn(factionsData) do
		data = factionsData[i]
		menuItem = _G["AtlasLootMenuItem_"..i]
		if data and data.name then
			if data.side == "A" then
				extraText = "|cff2773ff"..BF["Alliance"]
			elseif data.side == "H" then
				extraText = "|cffFF0000"..BF["Horde"]
			else
				extraText = ""
			end
			_G["AtlasLootMenuItem_"..i.."_Name"]:SetText(data.name)
			_G["AtlasLootMenuItem_"..i.."_Extra"]:SetText(extraText)
			_G["AtlasLootMenuItem_"..i.."_Icon"]:SetTexture(data.icon)
			menuItem.lootpage = data.lootpage
			menuItem:Show()
		else
			menuItem:Hide()
		end
	end
end