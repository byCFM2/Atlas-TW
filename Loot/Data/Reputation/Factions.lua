local _G = getfenv()
AtlasTW = _G.AtlasTW

--Instance required libraries
local L = AtlasTW.Local
local BF = AceLibrary("Babble-Faction-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")

AtlasLoot_Data = {
	StormpikeFrostwolf = {
		-- Alliance friendly
		{ name = L["Shared"]..", "..BF["Friendly"] }, --*1
		{id = 19318, disc=L["Consumable"]}, --Bottled Alterac Spring Water
		{id = 17349, disc=L["Consumable"]}, --Superior Healing Draught
		{},
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" },
		{id = 19032}, --Stormpike Battle Tabard *6
		-- Alliance honored
		{},
		{ name = L["Shared"]..", "..BF["Honored"] },
		{id = 19316}, --Ice Threaded Arrow
		{id = 17348, disc=L["Consumable"]}, --Major Healing Draught
		{},
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" },
		{id = 19301}, --Alterac Manna Biscuit
		{id = 19098}, --Stormpike Sage's Pendant
		{id = 19097}, --Stormpike Soldier's Pendant *15
		-- Horde
		{ name = L["Shared"]..", "..BF["Friendly"] }, --*1
		{id = 19307}, --Alterac Heavy Runecloth Bandage
		{id = 17352, disc=L["Consumable"]}, --Superior Mana Draught
		{},
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" },
		{id = 19031}, --Frostwolf Battle Tabard
		-- Horde honored
		{},
		{ name = L["Shared"]..", "..BF["Honored"] },
		{id = 19317}, --Ice Threaded Bullet
		{id = 17351, disc=L["Consumable"]}, --Major Mana Draught
		{},
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" },
		{id = 19096}, --Frostwolf Advisor's Pendant
		{id = 19095}, --Frostwolf Legionnaire's Pendant
		{id = 19085}, --Frostwolf Advisor's Cloak *15
		--Alliance honored
		{id = 19086}, --Stormpike Sage's Cloak *1
		{id = 19084}, --Stormpike Soldier's Cloak
		{id = 19094}, --Stormpike Cloth Girdle
		{id = 19093}, --Stormpike Leather Girdle
		{id = 19092}, --Stormpike Mail Girdle
		{id = 19091}, --Stormpike Plate Girdle
		-- Alliance revered
		{},
		{ name = L["Shared"]..", "..BF["Revered"] },
		{id = 19320}, --Gnoll Skin Bandolier
		{},
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" },
		{id = 19045}, --Stormpike Battle Standard
		{id = 19100}, --Electrified Dagger
		{id = 19104}, --Stormstrike Hammer
		{id = 19102}, --Crackling Staff *15
		-- Horde honored
		{id = 19083}, --Frostwolf Legionnaire's Cloak *1
		{id = 19090}, --Frostwolf Cloth Belt
		{id = 19089}, --Frostwolf Leather Belt
		{id = 19088}, --Frostwolf Mail Belt
		{id = 19087}, --Frostwolf Plate Belt
		{},
		{},
		-- Horde revered
		{ name = L["Shared"]..", "..BF["Revered"] },
		{id = 19319}, --Harpy Hide Quiver
		{},
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" },
		{id = 19046}, --Frostwolf Battle Standard
		{id = 19099}, --Glacial Blade
		{id = 19103}, --Frostbite
		{id = 19101}, --Whiteout Staff *15
		-- Alliance exalted *0
		{},
		{ name = L["Shared"]..", "..BF["Exalted"] },
		{id = 19312}, --Lei of the Lifegiver
		{id = 19315}, --Therazane's Touch
		{id = 19308}, --Tome of Arcane Domination
		{id = 19311}, --Tome of Fiery Arcana
		{id = 19309}, --Tome of Shadow Force *7
		{},
		{},
		{ name = BF["Stormpike Guard"], icon = "INV_BannerPVP_02" },
		{id = 19030}, --Stormpike Battle Charger
		{},
		{},
		{},
		{},
		{},
		-- Horde exalted
		{ name = L["Shared"]..", "..BF["Exalted"] },
		{id = 19310}, --Tome of the Ice Lord *2
		{id = 19325}, --Don Julio's Band
		{id = 21563}, --Don Rodrigo's Band
		{id = 19321}, --The Immovable Object
		{id = 19324}, --The Lobotomizer
		{id = 19323}, --The Unstoppable Force
		{},
		{ name = BF["Frostwolf Clan"], icon = "INV_BannerPVP_01" },
		{id = 19029}, --Horn of the Frostwolf Howler
	},
	WaterLords = {
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
	},
	CenarionCircle = {
		{},
		{ id = 22772, container={22758} },
		{ id = 22769, container={22761} },
		{ id = 20506, container={20481} },
		{ id = 20509, container={20476} },
		{ id = 22768, container={22764} },
		{ id = 22209, container={22197} },
		{ id = 22310, container={22251} },
		{ id = 20732 },
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 21187, "5", "#ccombat#", "3", "#clogistics#", "7", "#ctactical#" }, --TODO show icon and numbers in discription
		{ id = 21178, "5", "#ccombat#", "3", "#clogistics#", "7", "#ctactical#" },
		{ id = 21179, "5", "#ccombat#", "3", "#clogistics#", "7", "#ctactical#" },
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
    }
}