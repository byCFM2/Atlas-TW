local _G = getfenv()
AtlasTW = _G.AtlasTW

--Instance required libraries
local L = AtlasTW.Local
local BF = AceLibrary("Babble-Faction-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

AtlasLoot_Data = {
	VanillaKeys = {
		{ name = L["Key"] },
		{ id = 16309},
		{ id = 12344},
		{ id = 17191},
		{ id = 7146},
		{ id = 12382},
		{ id = 6893},
		{ id = 11000},
		{ id = 11140},
		{ id = 18249},
		{ id = 13704},
		{ id = 11197},
		{ id = 18266},
		{ id = 18268},
		{ id = 13873},
		{ name = L["Misc"] }, --16
		{ id = 19931, disc = L["Used to summon boss"] },
		{ id = 9240, disc = L["Used to summon boss"] },
		{ id = 18250, disc = L["Key"] },
		{ id = 17333, disc = L["Used to summon boss"] },
		{ id = 22754, disc = L["Used to summon boss"] },
		{ id = 13523, disc = L["Used to summon boss"] },
		{ id = 18746, disc = L["Used to summon boss"] },
		{ id = 18663, disc = L["Used to summon boss"] },
		{ id = 19974, disc = L["Used to summon boss"] },
		{ id = 7733, disc = L["Used to summon boss"] },
		{ id = 10818, disc = L["Used to summon boss"] },
		{ name = L["Tier 0.5"] },
		{ id = 22057, disc = L["Used to summon boss"] },
		{ id = 21986, disc = L["Used to summon boss"] },-- 30
		{ id = 61234},--key 31
		{ id = 51356},--key 32
	}, --TODO need other table for this
	WintersaberTrainers = {
		{ name = BF["Exalted"] },
		{ id = 13086 },
	},
	ThoriumBrotherhood = {
		{ name = BF["Friendly"] }, --*1
		{ id = 17051, container={17014} },
		{ id = 17018, container={16979} },
		{ id = 17023, container={16983} },
		{ id = 17022, container={16982} },
		{ id = 20761 },
		{ id = 19444 },
        {},
		{ name = BF["Revered"] },
		{ id = 18592, container={17193} },
		{ id = 17052, container={17013} },
		{ id = 17053, container={16988} },
		{ id = 19220, container={19165} },
		{ id = 19333, container={19163} },
		{ id = 19332, container={19162} }, --*15
		{ name = BF["Honored"] }, --*1
		{ id = 17059, container={17015} },
		{ id = 17060, container={17016} },
		{ id = 17049, container={16989} },
		{ id = 17017, container={16980} },
		{ id = 19219, container={19156} },
		{ id = 19330, container={19149} },
		{ id = 17025, container={16984} },
		{ id = 19206, container={19148} },
		{ id = 19448 },
        {},
		{ name = BF["Exalted"] },
		{ id = 20040, container={20039} },
		{ id = 62004, container={65039} },
		{ id = 19210, container={19170} }, --*15
        --revered
		{ id = 19331, container={19157} }, --*1
		{ id = 19207, container={19164} },
		{ id = 19208, container={19166} },
		{ id = 19209, container={19167} },
		{ id = 70178, container={56067} },
		{ id = 19449 },
        {},
        {},
        {},
        {},
        {},
        {},
        {},
        {},
        {}, --*15
        --exalted
		{ id = 19211, container={19168} }, --*1
		{ id = 19212, container={19169} },
		{ id = 62005, container={65035} },
		{ id = 62006, container={65036} },
		{ id = 62007, container={65037} },
		{ id = 62003, container={65038} },
	},
	DarkmoonFire = {
		{ name = L["Decks"] },
		{ id = 19228, container={19288} },
		{ id = 19267, container={19289} },
		{ id = 19257, container={19287} },
		{ id = 19277, container={19290} },
		{ name = L["Prizes"] },
		{ id = 19491 }, --TODO current
		{ id = 19426 },
		{ id = 19296 },
		{ id = 19297 },
		{ id = 19298 },
		{ id = 19291, disc=L["Bag"] },
		{ id = 19293 },
		{ id = 19292 },
		{ id = 19295 },
	},
    GelkisClanCentaur = {
		{ name = BF["Neutral"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 5748 },
		{},
		{ name = BF["Friendly"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 6773 },
		{ id = 6774 },
		{},
		{ name = BF["Honored"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 60899 },
		{ id = 60900 },
		{ id = 60901 },
		{ id = 60854 },
		{ id = 60860 },
		{ id = 60859 },
		{},
		{ name = BF["Revered"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 60902 },
		{ id = 60903 },
		{ id = 60904 },
		{},
		{ name = BF["Exalted"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 60905 },
		{ id = 60964, container={60908} },
		{ id = 60965, container={60907} },
		{ id = 60966 },
	},
	MagramClanCentaur = {
		{ name = BF["Neutral"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 5748 },
		{},
		{ name = BF["Friendly"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 6789 },
		{ id = 6788 },
		{},
		{ name = BF["Honored"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 60879 },
		{ id = 60880 },
		{ id = 60881 },
		{ id = 60853 },
		{ id = 60854 },
		{ id = 60855 },
		{},
		{ name = BF["Revered"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 60884 },
		{ id = 60883 },
		{ id = 60882 },
		{},
		{ name = BF["Exalted"], icon="INV_Misc_Head_Centaur_01" },
		{ id = 60885 },
		{ id = 60968, container={60910} },
		{ id = 60967, container={60909} },
		{ id = 60969 },
	},
	BloodsailBuccaneers = {
		{ name = BF["Neutral"], icon="INV_Helmet_66" },
		{ id = 22742 },
		{ id = 22743 },
		{ id = 22745 },
		{ id = 22744 },
		{},
		{ name = BF["Friendly"], icon="INV_Helmet_66" },
		{ id = 12185 },
		{},
		{ name = BF["Revered"], icon="INV_Helmet_66" },
		{ id = 83494 },
		{},
		{},
		{},
		{},
		{ name = BF["Exalted"], icon="INV_Helmet_66" },
		{ id = 83493 },
		{ id = 83490 },
		{ id = 83492 },
		{ id = 83491 },
	},
	TimbermawHold = {
		{ name = BF["Friendly"], icon="INV_Misc_Horn_01" },
		{ id = 20254, container={15065} },
		{ id = 15742, container={15064} },
		{ id = 22392 },
		{ id = 13484 },
		{ id = 91796 },
		{},
		{ name = BF["Honored"], icon="INV_Misc_Horn_01" },
		{ id = 19202, container={19043} },
		{ id = 62001, container={61648} },
		{ id = 19326, container={19044} },
		{ id = 19215, container={19047} },
		{ id = 16768 },
		{ id = 16769 },
		{ id = 19445 },
		{ name = BF["Revered"], icon="INV_Misc_Horn_01" },
		{ id = 19218, container={19050} },
		{ id = 19327, container={19049} },
		{ id = 19204, container={19048} },
		{ id = 62002, container={61649} },
		{},
		{},
		{ name = BF["Exalted"], icon="INV_Misc_Horn_01" },
		{ id = 21326 },
	},
	HydroxianWaterLords = {
		{ name = BF["Honored"], icon = "Spell_Frost_SummonWaterElemental_2"},
		{ id = 18399, disc = L["Quest Reward"] },
		{ id = 18398, disc = L["Quest Reward"] },
		{ id = 17333, disc = L["Misc"] },
		{ id = 91797 },
		{},
		{ name = BF["Revered"], icon = "Spell_Frost_SummonWaterElemental_2"},
		{ id = 22754, disc = L["Misc"] },
		{},
		{ name = BF["Exalted"], icon = "Spell_Frost_SummonWaterElemental_2"},
		{ id = 81254, disc = L["Pet"]  },
	},
	WardensofTime = {
		{ name = BF["Friendly"], icon = "INV_Misc_Head_Dragon_Bronze"},
		{ id=61000 },
		{},
		{ name = BF["Honored"], icon = "INV_Misc_Head_Dragon_Bronze"},
		{ id=61005 },
		{ id=84604 },
		{ id=61003 },
		{ id=61004 },
		{},
		{ name = BF["Revered"], icon = "INV_Misc_Head_Dragon_Bronze"},
		{ id=84601 },
		{ id=61002 },
		{ id=61013 },
		{ id=61001 },
		{ id=84602 },
		{ id=84603 },
		{ id=50070 },
		{},
		{ name = BF["Exalted"], icon = "INV_Misc_Head_Dragon_Bronze"},
		{ id=61007 },
		{ id=61012 },
		{ id=61010 },
		{ id=61011 },
		{ id=84600 },
		{ id=61009 },
		{ id=61006 },
		{},
		{ id=51043, disc = L["Bag"] },
		{ id=51252, disc = L["Mount"] },
		{ id=80300 },
	},
	CenarionCircle = {
        { name = BF["Friendly"] }, --*1
		{ id = 22772, container={22758} },
		{ id = 22769, container={22761} },
		{ id = 20506, container={20481} },
		{ id = 20509, container={20476} },
		{ id = 22768, container={22764} },
		{ id = 22209, container={22197} },
		{ id = 22310, container={22251} },
		{ id = 20732 },
		{ id = 21187, "5", "#ccombat#", "3", "#clogistics#", "7", "#ctactical#" }, --TODO show icon and numbers in discription
		{ id = 21178, "5", "#ccombat#", "3", "#clogistics#", "7", "#ctactical#" },
		{ id = 21179, "5", "#ccombat#", "3", "#clogistics#", "7", "#ctactical#" },
		{},
        { name = BF["Revered"] },
		{ id = 22683, container={22660} }, --*15
        { name = BF["Honored"] }, --*1
		{ id = 22773, container={22757} },
		{ id = 22770, container={22760} },
		{ id = 20507, container={20480} },
		{ id = 20510, container={20477} },
		{ id = 22767, container={22763} },
		{ id = 22214, container={22195} },
		{ id = 20733 },
		{},
		{ id = 21183 },
		{ id = 21182 },
		{ id = 21181 },
		{},
        { name = BF["Exalted"] },
		{ id = 20382, container={20380} }, --*15
		{ id = 22774, container={22756} }, --*1
		{ id = 22771, container={22759} },
		{ id = 20508, container={20479} },
		{ id = 20511, container={20478} },
		{ id = 22766, container={22762} },
		{ id = 22219, container={22198} },
		{ id = 22312, container={22252} },
		{},
		{ id = 21186 },
		{ id = 21184 },
		{ id = 21189 },
		{ id = 21185 }, --*12
		{},
		{},
		{},
		{ id = 22221, container={22191} }, --*1
		{ id = 83548, container={65008} },
		{ id = 83546, container={65021} },
		{ id = 80301 },
		{},
		{ id = 21190 },
		{ id = 21180 },
		{ id = 21188 }, --*8
	},
	ArgentDawn = {
		{ name = BF["Neutral"], icon = "INV_Jewelry_Talisman_08"},
		{ id = 22689 },
		{ id = 22690 },
		{ id = 22681 },
		{ id = 22680 },
		{ id = 22688 },
		{ id = 22679, disc = L["Bag"] },
		{},
		{ id = 22523, disc = L["Needed to purchase rewards"] },
		{ id = 22524, disc = L["Needed to purchase rewards"] },
		{},
		{ id = 22657 },
		{ id = 22659 },
		{ id = 22667 },
		{ id = 22668 },
		{ id = 22678 },
		{ id = 22656 },
		{},
		{ name = BF["Friendly"], icon = "INV_Jewelry_Talisman_08"},
		{ id = 13724, disc = L["Food"] },
		{},
		{},
		{ name = BF["Honored"], icon = "INV_Jewelry_Talisman_08"},
		{ id = 13482, container={7078} },
		{ id = 19216, container={19056} },
		{ id = 19328, container={19052} },
		{ id = 19203, container={19051} },
		{ id = 19442, container={19440} },
		{ id = 19446 },
		{ id = 70216, container={55362} },
		{},
		{ name = BF["Revered"], icon = "INV_Jewelry_Talisman_08"},
		{ id = 18171 },
		{ id = 18169 },
		{ id = 18170 },
		{ id = 18172 },
		{ id = 18173 },
		{},
		{ id = 19217, container={19059} },
		{ id = 19329, container={19058} },
		{ id = 19205, container={19057} },
		{ id = 19447 },
		{},
		{ id = 13810, disc = L["Food"] },
		{ id = 13813, disc = L["Drink"] },
		{},
		{ name = BF["Exalted"], icon = "INV_Jewelry_Talisman_08"},
		{ id = 18182 },
	},
	BroodOfNozdormu = {
		{ name = L["Path of the Conqueror"], icon = "INV_Jewelry_Ring_40" },
		{ id = 21201, disc = BF["Neutral"] },
		{ id = 21202, disc = BF["Friendly"] },
		{ id = 21203, disc = BF["Honored"] },
		{ id = 21204, disc = BF["Revered"] },
		{ id = 21205, disc = BF["Exalted"] },
		{},
		{ name = L["Path of the Invoker"], icon = "INV_Jewelry_Ring_40" },
		{ id = 21206, disc = BF["Neutral"] },
		{ id = 21207, disc = BF["Friendly"] },
		{ id = 21208, disc = BF["Honored"] },
		{ id = 21209, disc = BF["Revered"] },
		{ id = 21210, disc = BF["Exalted"] },
		{},
		{},
		{ name = L["Path of the Protector"], icon = "INV_Jewelry_Ring_40" },
		{ id = 21196, disc = BF["Neutral"] },
		{ id = 21197, disc = BF["Friendly"] },
		{ id = 21198, disc = BF["Honored"] },
		{ id = 21199, disc = BF["Revered"] },
		{ id = 21200, disc = BF["Exalted"] },
	},
	ZandalarTribe = {
		{ name = BF["Friendly"], icon = "INV_Misc_Coin_08"},
		{ id=19766 },
		{ id=19771 },
		{ id=20001 },
		{ id=19778 },
		{ id=19781 },
		{ id=20012 },
		{ id=20757 },
		{},
		{ name = BF["Honored"], icon = "INV_Misc_Coin_08"},
		{ id=19765 },
		{ id=20000 },
		{ id=19770 },
		{ id=19773 },
		{ id=19777 },
		{ id=19780 },
		{ id=20014 },
		{ id=20756 },
		{ id=20031, disc = L["Food"], "", "1", "#zandalar#" },
		{},
		{ name = BF["Revered"], icon = "INV_Misc_Coin_08"},
		{ id=20080, disc = L["Potion"], "", "3", "#zandalar#" },
		{ id=20079, disc = L["Potion"], "", "3", "#zandalar#" },
		{ id=20081, disc = L["Potion"], "", "3", "#zandalar#" },
		{ id=19764 },
		{ id=19769 },
		{ id=19772 },
		{ id=19776 },
		{ id=19779 },
		{ id=20011 },
		{},
		{ name = BF["Exalted"], icon = "INV_Misc_Coin_08"},
		{ id=20077, disc = L["Enchant"]..","..L["Shoulder"], "", "", "", "", "", "15", "#zandalar#" },
		{ id=20076, disc = L["Enchant"]..","..L["Shoulder"], "", "", "", "", "", "15", "#zandalar#" },
		{ id=20078, disc = L["Enchant"]..","..L["Shoulder"], "", "", "", "", "", "15", "#zandalar#" },
		{ id=65033, disc = L["Enchant"]..","..L["Shoulder"], "", "", "", "", "", "15", "#zandalar#" },
		{ id=20013 },
	},
    ArathorDefilers = {
        -- Alliance 20-29
        { name = BF["The League of Arathor"]..", "..BF["Friendly"], icon = "INV_BannerPVP_02" }, --*1
        {id = 21119}, --Talisman of Arathor
        {id = 20226, disc=L["Consumable"]}, --Highlander's Field Ration
        {id = 20244, disc=L["Consumable"]}, --Highlander's Silk Bandage
        {},
        -- Alliance 30-39
        {id = 21118}, --Talisman of Arathor
        {id = 20227, disc=L["Consumable"]}, --Highlander's Iron Ration
        {id = 20237, disc=L["Consumable"]}, --Highlander's Mageweave Bandage
        {id = 17349, disc=L["Consumable"]}, --Superior Healing Draught
        {id = 17352, disc=L["Consumable"]}, --Superior Mana Draught *10
        {},
        -- Alliance 40-49
        {id = 20225, disc=L["Consumable"]}, --Highlander's Enriched Ration
        {id = 20243, disc=L["Consumable"]}, --Highlander's Runecloth Bandage
        {id = 21117}, --Talisman of Arathor
        -- Alliance 50-59
        {id = 20071}, --Talisman of Arathor *15
        -- Horde 20-29
        { name = BF["The Defilers"]..", "..BF["Friendly"], icon = "INV_BannerPVP_01" }, --*1
        {id = 21120}, --Defiler's Talisman
        {id = 20223, disc=L["Consumable"]}, --Defiler's Field Ration
        {id = 20235, disc=L["Consumable"]}, --Defiler's Silk Bandage
        {},
        -- Horde 30-39
        {id = 21116}, --Defiler's Talisman
        {id = 20224, disc=L["Consumable"]}, --Defiler's Iron Ration
        {id = 20232, disc=L["Consumable"]}, --Defiler's Mageweave Bandage
        {id = 17349, disc=L["Consumable"]}, --Superior Healing Draught
        {id = 17352, disc=L["Consumable"]}, --Superior Mana Draught
        {},
        -- Horde 40-49
        {id = 20222, disc=L["Consumable"]}, --Defiler's Enriched Ration
        {id = 20234, disc=L["Consumable"]}, --Defiler's Runecloth Bandage
        {id = 21115}, --Defiler's Talisman
        -- Horde 50-59
        {id = 20072}, --Defiler's Talisman *15
        {},
        -- Alliance 20-29
        { name = BF["Honored"], icon = "INV_BannerPVP_02" },
        {id = 20099}, --Highlander's Cloth Girdle
        {id = 20117}, --Highlander's Leather Girdle
        {id = 20105}, --Highlander's Lizardhide Girdle
        {id = 20090}, --Highlander's Chain Girdle
        {id = 20108}, --Highlander's Lamellar Girdle
        {id = 20126}, --Highlander's Plate Girdle
        {},
        -- Alliance 30-39
        {id = 20098}, --Highlander's Cloth Girdle
        {id = 20116}, --Highlander's Leather Girdle *10
        {id = 20104}, --Highlander's Lizardhide Girdle
        {},
        -- Alliance 40-49
        {id = 20097}, --Highlander's Cloth Girdle
        {id = 20115}, --Highlander's Leather Girdle *15
        {},
        -- Horde 20-29
        { name = BF["Honored"], icon = "INV_BannerPVP_01" },
        {id = 20164}, --Defiler's Cloth Girdle
        {id = 20191}, --Defiler's Leather Girdle
        {id = 20172}, --Defiler's Lizardhide Girdle
        {id = 20152}, --Defiler's Chain Girdle
        {id = 20197}, --Defiler's Mail Girdle
        {id = 20207}, --Defiler's Plate Girdle
        {},
        -- Horde 30-39
        {id = 20166}, --Defiler's Cloth Girdle
        {id = 20192}, --Defiler's Leather Girdle *11
        {id = 20173}, --Defiler's Lizardhide Girdle
        {},
        -- Horde 40-49
        {id = 20165}, --Defiler's Cloth Girdle
        {id = 20193}, --Defiler's Leather Girdle *15
        -- Alliance 40-49
        {id = 20103}, --Highlander's Lizardhide Girdle *1
        {id = 20088}, --Highlander's Chain Girdle
        {id = 20106}, --Highlander's Lamellar Girdle
        {id = 20124}, --Highlander's Plate Girdle
        {id = 20089}, --Highlander's Chain Girdle
        {id = 20107}, --Highlander's Lamellar Girdle
        {id = 20125}, --Highlander's Plate Girdle
        {},
        -- Alliance 50-59
        {id = 20047}, --Highlander's Cloth Girdle
        {id = 20045}, --Highlander's Leather Girdle
        {id = 20046}, --Highlander's Lizardhide Girdle
        {id = 20043}, --Highlander's Chain Girdle
        {id = 20042}, --Highlander's Lamellar Girdle
        {id = 20041}, --Highlander's Plate Girdle *14
        {},
        -- Horde 40-49
        {id = 20174}, --Defiler's Lizardhide Girdle *1
        {id = 20151}, --Defiler's Chain Girdle
        {id = 20196}, --Defiler's Mail Girdle
        {id = 20205}, --Defiler's Plate Girdle
        {id = 20153}, --Defiler's Chain Girdle
        {id = 20198}, --Defiler's Mail Girdle
        {id = 20206}, --Defiler's Plate Girdle
        {},
        -- Horde 50-59
        {id = 20163}, --Defiler's Cloth Girdle
        {id = 20190}, --Defiler's Leather Girdle
        {id = 20171}, --Defiler's Lizardhide Girdle
        {id = 20150}, --Defiler's Chain Girdle
        {id = 20195}, --Defiler's Mail Girdle
        {id = 20204}, --Defiler's Plate Girdle *14
        {},
        -- Alliance 20-29
        { name = BF["Revered"], icon = "INV_BannerPVP_02" },
        {id = 20096}, --Highlander's Cloth Boots
        {id = 20114}, --Highlander's Leather Boots
        {id = 20102}, --Highlander's Lizardhide Boots
        {id = 20093}, --Highlander's Chain Greaves
        {id = 20111}, --Highlander's Lamellar Greaves
        {id = 20129}, --Highlander's Plate Greaves
        {},
        -- Alliance 30-39
        {id = 20095}, --Highlander's Cloth Boots
        {id = 20113}, --Highlander's Leather Boots
        {id = 20101}, --Highlander's Lizardhide Boots *11
        {},
        -- Alliance 40-49
        {id = 20094}, --Highlander's Cloth Boots
        {id = 20112}, --Highlander's Leather Boots
        {id = 20100}, --Highlander's Lizardhide Boots *15
        -- Horde 20-29
        { name = BF["Revered"], icon = "INV_BannerPVP_01" },
        {id = 20162}, --Defiler's Cloth Boots
        {id = 20188}, --Defiler's Leather Boots
        {id = 20169}, --Defiler's Lizardhide Boots
        {id = 20157}, --Defiler's Chain Greaves
        {id = 20201}, --Defiler's Mail Greaves
        {id = 20210}, --Defiler's Plate Greaves
        {},
        -- Horde 30-39
        {id = 20161}, --Defiler's Cloth Boots
        {id = 20187}, --Defiler's Leather Boots
        {id = 20168}, --Defiler's Lizardhide Boots *11
        {},
        -- Horde 40-49
        {id = 20160}, --Defiler's Cloth Boots
        {id = 20189}, --Defiler's Leather Boots
        {id = 20170}, --Defiler's Lizardhide Boots *15
        -- Alliance 40-49
        {id = 20091}, --Highlander's Chain Greaves
        {id = 20109}, --Highlander's Lamellar Greaves
        {id = 20127}, --Highlander's Plate Greaves
        {id = 20092}, --Highlander's Chain Greaves
        {id = 20110}, --Highlander's Lamellar Greaves
        {id = 20128}, --Highlander's Plate Greaves
        {},
        -- Alliance 50-59
        {id = 20054}, --Highlander's Cloth Boots
        {id = 20052}, --Highlander's Leather Boots
        {id = 20053}, --Highlander's Lizardhide Boots
        {id = 20050}, --Highlander's Chain Greaves
        {id = 20049}, --Highlander's Lamellar Greaves
        {id = 20048}, --Highlander's Plate Greaves *13
        {},
        { name = BF["Exalted"], icon = "INV_BannerPVP_02" },
        -- Horde 40-49
        {id = 20155}, --Defiler's Chain Greaves *1
        {id = 20202}, --Defiler's Mail Greaves
        {id = 20211}, --Defiler's Plate Greaves
        {id = 20156}, --Defiler's Chain Greaves
        {id = 20200}, --Defiler's Mail Greaves
        {id = 20209}, --Defiler's Plate Greaves
        {},
        -- Horde 50-59
        {id = 20159}, --Defiler's Cloth Boots
        {id = 20186}, --Defiler's Leather Boots
        {id = 20167}, --Defiler's Lizardhide Boots
        {id = 20154}, --Defiler's Chain Greaves
        {id = 20199}, --Defiler's Mail Greaves
        {id = 20208}, --Defiler's Plate Greaves *13
        {},
        { name = BF["Exalted"], icon = "INV_BannerPVP_01" },
        -- Alliance
        {id = 20061}, --Highlander's Epaulets
        {id = 20060}, --Highlander's Lizardhide Shoulders
        {id = 20059}, --Highlander's Leather Shoulders
        {id = 20055}, --Highlander's Chain Pauldrons
        {id = 20058}, --Highlander's Lamellar Spaulders
        {id = 20057}, --Highlander's Plate Spaulders
        {id = 20073}, --Cloak of the Honor Guard
        {},
        {id = 20070}, --Sageclaw
        {id = 20069}, --Ironbark Staff
        {},
        {id = 20132}, --Arathor Battle Tabard *12
        {},
        {},
        {},
        -- Horde
        {id = 20176}, --Defiler's Epaulets --*1
        {id = 20175}, --Defiler's Lizardhide Shoulders
        {id = 20194}, --Defiler's Leather Shoulders
        {id = 20158}, --Defiler's Chain Pauldrons
        {id = 20203}, --Defiler's Mail Pauldrons
        {id = 20212}, --Defiler's Plate Spaulders
        {id = 20068}, --Deathguard's Cloak
        {},
        {id = 20214}, --Mindfang
        {id = 20220}, --Ironbark Staff
        {},
        {id = 20131}, --Battle Tabard of the Defilers *13
    },
    SentinelsOutriders = {
        { name = BF["Friendly"] }, --*1
        {id = 21568}, --Rune of Duty
        {id = 21567}, --Rune of Duty
        {},
        {id = 19062, disc=L["Consumable"]}, --Warsong Gulch Field Ration
        {id = 19061, disc=L["Consumable"]}, --Warsong Gulch Iron Ration
        {id = 19060, disc=L["Consumable"]}, --Warsong Gulch Enriched Ration
        {},
        {id = 17349, disc=L["Consumable"]}, --Superior Healing Draught
        {},
        { name = L["Honored"] },
        {id = 17348, disc=L["Consumable"]}, --Major Healing Draught *12
        {},
        -- Alliance Honored
        { name = BF["Silverwing Sentinels"], icon = "INV_BannerPVP_02" },
        {id = 20444}, -- Sentinel's Medallion *15
        { name = BF["Friendly"] }, --*1
        {id = 21566}, --Rune of Perfection
        {id = 21565}, --Rune of Perfection
        {},
        {id = 19068, disc=L["Consumable"]}, --"Warsong Gulch Silk Bandage
        {id = 19067, disc=L["Consumable"]}, --Warsong Gulch Mageweave Bandaged
        {id = 19066, disc=L["Consumable"]}, --Warsong Gulch Runecloth Bandage
        {},
        {id = 17352, disc=L["Consumable"]}, --Superior Mana Draught *9
        {},
        { name = L["Honored"] },
        {id = 17351, disc=L["Consumable"]}, --Major Mana Draught
        {},
        -- Horde Honored
        { name = BF["Warsong Outriders"], icon = "INV_BannerPVP_01" },
        {id = 20442}, -- Scout's Medallion *15
        -- Alliance Honored
        {id = 20428}, -- Caretaker's Cape *1
        {id = 20431}, -- Lorekeeper's Ring
        {id = 20439}, -- Protector's Band
        {},
        {id = 19541}, -- Sentinel's Medallion
        {id = 19533}, -- Caretaker's Cape
        {id = 19525}, -- Lorekeeper's Ring
        {id = 19517}, -- Protector's Band
        {},
        {id = 19540}, -- Sentinel's Medallion
        {id = 19532}, -- Caretaker's Cape
        {id = 19524}, -- Lorekeeper's Ring
        {id = 19515}, -- Protector's Band
        {},
        {id = 19539}, -- Sentinel's Medallion *15
        -- Horde Honored
        {id = 20427}, -- Battle Healer's Cloak *1
        {id = 20426}, -- Advisor's Ring
        {id = 20429}, -- Legionnaire's Band
        {},
        {id = 19537}, -- Scout's Medallion
        {id = 19529}, -- Battle Healer's Cloak
        {id = 19521}, -- Advisor's Ring
        {id = 19513}, -- Legionnaire's Band
        {},
        {id = 19536}, -- Scout's Medallion
        {id = 19528}, -- Battle Healer's Cloak
        {id = 19520}, -- Advisor's Ring
        {id = 19512}, -- Legionnaire's Band
        {},
        {id = 19535}, -- Scout's Medallion *15
        -- Alliance Honored
        {id = 19531}, -- Caretaker's Cape *1
        {id = 19523}, -- Lorekeeper's Ring
        {id = 19516}, -- Protector's Band
        {},
        {id = 19538}, -- Sentinel's Medallion
        {id = 19530}, -- Caretaker's Cape
        {id = 19522}, -- Lorekeeper's Ring
        {id = 19514}, -- Protector's Band *8
        {},
        -- Alliance Revered
        { name = BF["Revered"], icon = "INV_BannerPVP_02" },
        {id = 20438}, --Outrunner's Bow
        {id = 20443}, --Sentinel's Blade
        {id = 20440}, --Protector's Sword
        {id = 20434}, --Lorekeeper's Staff *14
        {},
        -- Horde Honored
        {id = 19527}, -- Battle Healer's Cloak *1
        {id = 19519}, -- Advisor's Ring
        {id = 19511}, -- Legionnaire's Band
        {},
        {id = 19534}, -- Scout's Medallion
        {id = 19526}, -- Battle Healer's Cloak
        {id = 19518}, -- Advisor's Ring
        {id = 19510}, -- Legionnaire's Band *8
        {},
        -- Horde Revered
        { name = BF["Revered"], icon = "INV_BannerPVP_01" },
        {id = 20437}, --Outrider's Bow
        {id = 20441}, --Scout's Blade
        {id = 20430}, --Legionnaire's Sword
        {id = 20425}, --Advisor's Gnarled Staff *14
        {},
        -- Alliance Revered
        {id = 19565}, --Outrunner's Bow *1
        {id = 19549}, --Sentinel's Blade
        {id = 19557}, --Protector's Sword
        {id = 19573}, --Lorekeeper's Staff
        {},
        {id = 19564}, --Outrunner's Bow
        {id = 19548}, --Sentinel's Blade
        {id = 19556}, --Protector's Sword
        {id = 19572}, --Lorekeeper's Staff
        -- Alliance Revered
        {},
        {id = 19563}, --Outrunner's Bow
        {id = 19547}, --Sentinel's Blade
        {id = 19555}, --Protector's Sword
        {id = 19571}, --Lorekeeper's Staff *14
        {},
        -- Horde Revered
        {id = 19561}, --Outrider's Bow *1
        {id = 19545}, --Scout's Blade
        {id = 19553}, --Legionnaire's Sword
        {id = 19569}, --Advisor's Gnarled Staff
        {},
        {id = 19560}, --Outrider's Bow
        {id = 19544}, --Scout's Blade
        {id = 19552}, --Legionnaire's Sword
        {id = 19568}, --Advisor's Gnarled Staff
        -- Horde Revered
        {},
        {id = 19559}, --Outrider's Bow
        {id = 19543}, --Scout's Blade
        {id = 19551}, --Legionnaire's Sword
        {id = 19567}, --Advisor's Gnarled Staff *14
        {},
        -- Alliance Revered
        {id = 19562}, --Outrunner's Bow *1
        {id = 19546}, --Sentinel's Blade
        {id = 19554}, --Protector's Sword
        {id = 19570}, --Lorekeeper's Staff *4
        {},
        -- Alliance Exalted
        { name = BF["Exalted"], icon = "INV_BannerPVP_02" },
        {id = 22752}, --Sentinel's Silk Leggings
        {id = 22749}, --Sentinel's Leather Pants
        {id = 22750}, --Sentinel's Lizardhide Pants
        {id = 22748}, --Sentinel's Chain Leggings
        {id = 22753}, --Sentinel's Lamellar Legguards
        {id = 22672}, --Sentinel's Plate Legguards
        {id = 19506}, --Silverwing Battle Tabard *13
        {},
        { name = L["Shared"] }, --Exalted
        -- Horde Revered
        {id = 19558}, --Outrider's Bow *1
        {id = 19542}, --Scout's Blade
        {id = 19550}, --Legionnaire's Sword
        {id = 19566}, --Advisor's Gnarled Staff
        {},
        -- Horde Exalted
        { name = BF["Exalted"], icon = "INV_BannerPVP_01" },
        {id = 22747}, --Outrider's Silk Leggings
        {id = 22740}, --Outrider's Leather Pants
        {id = 22741}, --Outrider's Lizardhide Pants
        {id = 22673}, --Outrider's Chain Leggings
        {id = 22676}, --Outrider's Lamellar Legguards
        {id = 22651}, --Outrider's Plate Legguards
        {id = 19505}, --Warsong Battle Tabard *13
        {},
        { name = L["Shared"] }, --Exalted
        {id = 19597}, --Dryad's Wrist Bindings *1
        {id = 19590}, --Forest Stalker's Bracers
        {id = 19584}, --Windtalker's Wristguards
        {id = 19581}, --Berserker Bracers
        {},
        {id = 19596}, --Dryad's Wrist Bindings
        {id = 19589}, --Forest Stalker's Bracers
        {id = 19583}, --Windtalker's Wristguards
        {id = 19580}, --Berserker Bracers *9
        {},
        {},
        {},
        {},
        {},
        {},
        {id = 19595}, --Dryad's Wrist Bindings *1
        {id = 19587}, --Forest Stalker's Bracers
        {id = 19582}, --Windtalker's Wristguards
        {id = 19578}, --Berserker Bracers *4
    },
    StormpikeFrostwolf = {
		-- Alliance Neutral
		{ name = BF["Stormpike Guard"]..", "..BF["Neutral"], icon = "INV_BannerPVP_02" }, --*1
		{ id = 17691 }, --Stormpike Insignia Rank 1
		-- Alliance friendly
		{},
		{ name = L["Shared"]..", "..BF["Friendly"] },
		{id = 19318, disc=L["Consumable"]}, --Bottled Alterac Spring Water
		{id = 17349, disc=L["Consumable"]}, --Superior Healing Draught
		{},
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" },
		{id = 19032}, --Stormpike Battle Tabard
		{ id = 17900 }, --Stormpike Insignia Rank 2 *10
		-- Alliance honored
		{},
		{ name = L["Shared"]..", "..BF["Honored"] },
		{id = 19316}, --Ice Threaded Arrow
		{id = 17348, disc=L["Consumable"]}, --Major Healing Draught
		{id = 19301}, --Alterac Manna Biscuit --*15
		-- Horde Neutral
		{ name = BF["Frostwolf Clan"]..", "..BF["Neutral"], icon = "INV_BannerPVP_01" }, --*1
		{ id = 17690 }, --Frostwolf Insignia Rank 1
		-- Horde friendly
		{},
		{ name = L["Shared"]..", "..BF["Friendly"] },
		{id = 19307}, --Alterac Heavy Runecloth Bandage
		{id = 17352, disc=L["Consumable"]}, --Superior Mana Draught
		{},
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" },
		{id = 19031}, --Frostwolf Battle Tabard
		{ id = 17905 }, --Frostwolf Insignia Rank 2
		-- Horde honored
		{},
		{ name = L["Shared"]..", "..BF["Honored"] },
		{id = 19317}, --Ice Threaded Bullet
		{id = 17351, disc=L["Consumable"]}, --Major Mana Draught
		{}, --*15
		--Alliance honored
		{}, --*1
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" },
		{id = 19098}, --Stormpike Sage's Pendant
		{id = 19097}, --Stormpike Soldier's Pendant
		{id = 19086}, --Stormpike Sage's Cloak
		{id = 19084}, --Stormpike Soldier's Cloak
		{id = 19094}, --Stormpike Cloth Girdle
		{id = 19093}, --Stormpike Leather Girdle
		{id = 19092}, --Stormpike Mail Girdle
		{id = 19091}, --Stormpike Plate Girdle
		{ id = 17901 }, --Stormpike Insignia Rank 3
		-- Alliance revered
		{},
		{ name = L["Shared"]..", "..BF["Revered"] },
		{id = 19320}, --Gnoll Skin Bandolier
		{}, --*15
        {}, --*1
		-- Horde honored
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" },
		{id = 19096}, --Frostwolf Advisor's Pendant
		{id = 19095}, --Frostwolf Legionnaire's Pendant
		{id = 19085}, --Frostwolf Advisor's Cloak
		{id = 19083}, --Frostwolf Legionnaire's Cloak
		{id = 19090}, --Frostwolf Cloth Belt
		{id = 19089}, --Frostwolf Leather Belt
		{id = 19088}, --Frostwolf Mail Belt
		{id = 19087}, --Frostwolf Plate Belt
		{ id = 17906 }, --Frostwolf Insignia Rank 3
		-- Horde revered
		{},
		{ name = L["Shared"]..", "..BF["Revered"] },
		{id = 19319}, --Harpy Hide Quiver
		{}, -- *15
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" }, -- *1
		{id = 19045}, --Stormpike Battle Standard
		{id = 19100}, --Electrified Dagger
		{id = 19104}, --Stormstrike Hammer
		{id = 19102}, --Crackling Staff
		{ id = 17902 }, --Stormpike Insignia Rank 4
		-- Alliance exalted
		{},
		{ name = L["Shared"]..", "..BF["Exalted"] },
		{id = 19312}, --Lei of the Lifegiver
		{id = 19315}, --Therazane's Touch
		{id = 19308}, --Tome of Arcane Domination
		{id = 19311}, --Tome of Fiery Arcana
		{id = 19309}, --Tome of Shadow Force
		{},
		{}, --*15
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" }, -- *1
		{id = 19046}, --Frostwolf Battle Standard
		{id = 19099}, --Glacial Blade
		{id = 19103}, --Frostbite
		{id = 19101}, --Whiteout Staff
		{ id = 17907 }, --Frostwolf Insignia Rank 4
		-- Horde exalted
		{},
		{ name = L["Shared"]..", "..BF["Exalted"] },
		{id = 19310}, --Tome of the Ice Lord
		{id = 19325}, --Don Julio's Band
		{id = 21563}, --Don Rodrigo's Band
		{id = 19321}, --The Immovable Object
		{id = 19324}, --The Lobotomizer
		{id = 19323}, --The Unstoppable Force
		{}, -- *15
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" }, --*1
		{id = 19030}, --Stormpike Battle Charger
		{ id = 17903 }, --Stormpike Insignia Rank 5
		{ id = 17904 }, --Stormpike Insignia Rank 6 *4
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
        -- Horde exalted
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" },--*1
		{ id = 19029 }, --Horn of the Frostwolf Howler
		{ id = 17908 }, --Frostwolf Insignia Rank 5
		{ id = 17909 }, --Frostwolf Insignia Rank 6
	},
	Ironforge = {
		{ name = BF["Honored"], icon = "Ability_Racial_Avatar" },
		{ id = 81214 },
		{ id = 81211 },
		{ id = 81212 },
		{ id = 81215 },
		{ id = 81213 },
		{},
		{ name = BF["Exalted"], icon = "Ability_Racial_Avatar" },
		{ id = 80303 },
		{ id = 81233 },
	},
	Darnassus = {
		{ name = BF["Honored"], icon = "Ability_Racial_ShadowMeld" },
		{ id = 60746 },
		{ id = 60747 },
		{ id = 60748 },
		{ id = 60749 },
		{ id = 60750 },
		{ id = 60751 },
		{},
		{ name = BF["Revered"], icon = "Ability_Racial_ShadowMeld" },
		{ id = 60752 },
		{},
		{ name = BF["Exalted"], icon = "Ability_Racial_ShadowMeld" },
		{ id = 80305 },
	},
	Stormwind = {
		{ name = BF["Exalted"], icon = "INV_BannerPVP_02" },
		{ id = 81225 },
		{ id = 80320 },
	},
	GnomereganExiles = {
		{ name = BF["Exalted"], icon = "INV_Gizmo_02" },
		{ id = 81192 },
		{ id = 81193 },
		{ id = 81194 },
		{ id = 81195 },
		{},
		{ id = 80306 },
	},
	DarkspearTrolls = {
		{ name = BF["Honored"], icon = "Racial_Troll_Berserk" },
		{ id = 83064 },
		{},
		{ name = BF["Revered"], icon = "Racial_Troll_Berserk" },
		{ id = 80806 },
		{ id = 80785 },
		{ id = 80797 },
		{},
		{ name = BF["Exalted"], icon = "Racial_Troll_Berserk" },
		{ id = 81183 },
		{ id = 80304 },
		{ id = 81182 },
	},
	DurotarLaborUnion = {
		{ name = BF["Friendly"], icon = "INV_Misc_Coin_01" },
		{ id = 50068 },
		{},
		{ name = BF["Revered"], icon = "INV_Misc_Coin_01" },
		{ id = 81196, container = {10585} },
		{},
		{ name = BF["Exalted"], icon = "INV_Misc_Coin_01" },
		{ id = 81190 },
		{ id = 81191 },
		{ id = 81089 },
	},
	Undercity = {
		{ name = BF["Exalted"], icon = "Spell_Shadow_RaiseDead" },
		{ id = 81244 },
		{ id = 81245 },
		{ id = 81246 },
		{ id = 81247 },
		{},
		{ id = 80309 },
	},
	Orgrimmar = {
		{ name = BF["Honored"], icon = "INV_BannerPVP_01" },
		{ id = 81216 },
		{ id = 81217 },
		{},
		{ name = BF["Exalted"], icon = "INV_BannerPVP_01" },
		{ id = 81241 },
		{ id = 80307 },
	},
	ThunderBluff = {
		{ name = BF["Revered"], icon = "INV_Misc_Foot_Centaur" },
		{ id = 81199 },
		{ id = 81218 },
		{ id = 81219 },
		{ id = 81220 },
		{ id = 81221 },
		{ id = 81222 },
		{},
		{ name = BF["Exalted"], icon = "INV_Misc_Foot_Centaur" },
		{ id = 81167 },
		{ id = 81223 },
		{ id = 81198 },
		{ id = 81237 },
		{ id = 80308 },
	},
	Dalaran = {
		{ name = BF["Revered"], icon = "Spell_Holy_MagicalSentry" },
		{ id = 60728 },
		{ id = 60730 },
		{ id = 60727 },
		{ id = 60726 },
		{ id = 60729 },
		{},
		{ name = BF["Exalted"], icon = "Spell_Holy_MagicalSentry" },
		{ id = 60724 },
		{ id = 60725 },
	},
	WildhammerClan = {
		{ name = BF["Exalted"], icon = "Ability_Hunter_EagleEye" },
		{ id = 81185 },
		{ id = 81186 },
		{ id = 81243 },
		{ id = 80312 },
	},
	SilvermoonRemnant = {
		{ name = BS["Cloth"] }, --*1l
		{ id = 80512 },
		{ id = 80513 },
		{ id = 80514 },
		{ id = 80515 },
		{ id = 80516 },
        {},
		{ name = BS["Leather"] },
		{ id = 80517 },
		{ id = 80518 },
		{ id = 80519 },
		{ id = 80520 },
		{ id = 80521 },
        {},
		{ name = L["Cloak"] }, --*15l
		{ name = BS["Mail"] }, --*1r
		{ id = 80522 },
		{ id = 80523 },
		{ id = 80524 },
		{ id = 80525 },
		{ id = 80526 },
        {},
		{ name = BS["Plate"] },
		{ id = 80507 },
		{ id = 80508 },
		{ id = 80509 },
		{ id = 80510 },
		{ id = 80511 },
        {},
		{ name = L["Pet"] }, --*15r
        --cloak
		{ id = 80505 }, --*1l
		{ id = 80506 },
		{ id = 80527 },
        {},
		{ name = L["Tabards"] },
		{ id = 80317 },
        {},
		{ name = L["Weapons"] },
		{ id = 80502 },
		{ id = 80504 },
		{ id = 80501 },
		{ id = 80500 },
		{ id = 80503 },
        {},
		{ id = 80538 }, --*15l
        --pets
		{ id = 80003 }, --*1r
		{ id = 80007 },
		{ id = 80000 },
		{ id = 80001 },
        {},
        {},
        {},
		{ name = L["Weapons"] },
		{ id = 80529 },
		{ id = 80539 },
		{ id = 80541 },
		{ id = 80544 },
        {},
		{ id = 80532 },
		{ id = 80540 }, --*15r
		{ id = 80546 }, --*1l
        {},
		{ id = 80531 },
		{ id = 80533 },
		{ id = 80547 },
		{ id = 80534 },
		{ id = 80537 },
		{ id = 80530 },
        {},
		{ id = 80528 },
		{ id = 80536 },
        {},
		{ id = 80535 },
		{ id = 80543 },
        {}, --*15l
		{ id = 80542 }, --*1r
		{ id = 80545 },
	},
	RevantuskTrolls = {
		{ name =  BS["Cloth"] }, --*1L
		{ id = 80612 },
		{ id = 80613 },
		{ id = 80614 },
		{ id = 80615 },
		{ id = 80616 },
        {},
		{ name = BS["Leather"] },
		{ id = 80617 },
		{ id = 80618 },
		{ id = 80619 },
		{ id = 80620 },
		{ id = 80621 },
        {},
		{ name = L["Cloak"] }, --*15L
		{ name = BS["Mail"] }, --*1R
		{ id = 80622 },
		{ id = 80623 },
		{ id = 80624 },
		{ id = 80625 },
		{ id = 80626 },
        {},
		{ name = BS["Plate"] },
		{ id = 80607 },
		{ id = 80608 },
		{ id = 80609 },
		{ id = 80610 },
		{ id = 80611 },
        {},
		{ name = L["Pet"] }, --15R
        --cloak
		{ id = 80605 }, --*1L
		{ id = 80606 },
		{ id = 80627 },
        {},
		{ name = L["Tabards"] },
		{ id = 81098 },
        {},
		{ name = L["Weapons"] },
		{ id = 80602 },
		{ id = 80601 },
		{ id = 80600 },
		{ id = 80603 },
		{ id = 80604 },
        {},
		{ id = 80632 }, --*15L
        --pet
		{ id = 80878 }, --*1R
        {},
		{ name = L["Mounts"] },
		{ id = 81226 },
		{ id = 80433 },
		{ id = 80438 },
        {},
        --weapons
		{ name = L["Weapons"] },
		{ id = 80629 },
		{ id = 80639 },
		{ id = 80641 },
		{ id = 80644 },
        {},
        {},
		{ id = 80646 }, --*15R
        --weapons
		{ id = 80640 }, --*1L
		{ id = 80642 },
		{ id = 80645 },
        {},
		{ id = 80630 },
		{ id = 80631 },
		{ id = 80633 },
		{ id = 80634 },
		{ id = 80637 },
        {},
		{ id = 80636 },
		{ id = 80628 },
        {},
		{ id = 80635 },
		{ id = 80643 }, --*15L
        { id = 80638 }, --*1R
	},
}