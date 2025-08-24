local _G = getfenv()
AtlasTW = _G.AtlasTW

--Instance required libraries
local L = AtlasTW.Local
local BIS = AceLibrary("Babble-ItemSet-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BC = AceLibrary("Babble-Class-2.2")

AtlasLoot_Data = AtlasLoot_Data or {}

local Sets = {}

Sets = { --TODO source for variable set items, boss etc
	VanillaKeys = {
		{ name = L["Key"] },
		{ id = 16309}, -- Drakefire Amulet
		{ id = 12344}, -- Seal of Ascension
		{ id = 17191}, -- Scepter of Celebras
		{ id = 7146}, -- The Scarlet Key
		{ id = 12382}, -- Key to the City
		{ id = 6893}, -- Workshop Key
		{ id = 11000}, -- Shadowforge Key
		{ id = 11140}, -- Prison Cell Key
		{ id = 18249}, -- Crescent Key
		{ id = 13704}, -- Skeleton Key
		{ id = 11197}, -- Dark Keeper Key
		{ id = 18266}, -- Gordok Inner Door Key
		{ id = 18268}, -- Gordok Courtyard Key
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
		{ id = 51356},
		{ id = 41876},--Lower Reserve Key
		{ id = 41913},--Key to Stormwrought Castle
	},
	Stormreaver = { --1.18
		{ name = BIS["Stormreaver Attire"] },
		{ id = 58131 }, -- Stormreaver Belt
		{ id = 75, container={ 58134 } }, --Pattern: Stormreaver Gloves
		{ id = 58147 }, -- Stormreaver Mantle
		{ id = 58176 }, -- Stormreaver Hood
		{ id = 58177 }, -- Stormreaver Robe
		{ id = 58178 }, -- Stormreaver Boots
	},
	ArmsofThaurissan = { --1.18
		{ name = BIS["Arms of Thaurissan"] },
		{ id = 11684 }, -- Ironfoe
		{ id = 58214 }, -- Modrag'zan, Heart of the Mountain
	},
	DragonmawBattlegarb = { --1.18
		{ name = BIS["Dragonmaw Battlegarb"] },
		{ id = 41724 }, -- Dragonmaw Shoulders
		{ id = 58099 }, -- Dragonmaw Helmet
		{ id = 58111 }, -- Dragonmaw Hauberk
        { id = 74, container={ 58112 } }, --Pattern: Dragonmaw Gloves
		{ id = 58113 }, -- Dragonmaw Bracers
		{ id = 58114 }, -- Dragonmaw Leggings
		{ id = 58115 }, -- Dragonmaw Greaves
	},
	Deadmines = {
		{ name = BIS["Defias Leather"] },
		{ id = 81007 }, -- Blackened Defias Mask
		{ id = 10399 }, -- Blackened Defias Armor
		{ id = 10401 }, -- Blackened Defias Gloves
		{ id = 10403 }, -- Blackened Defias Belt
		{ id = 10400 }, -- Blackened Defias Leggings
		{ id = 10402 }, -- Blackened Defias Boots
	},
	Wailing = {
		{ name = BIS["Embrace of the Viper"] },
		{ id = 81006 }, -- Cowl of the Fang
		{ id = 6473 }, -- Armor of the Fang
		{ id = 10413 }, -- Gloves of the Fang
		{ id = 10412 }, -- Belt of the Fang
		{ id = 10410 }, -- Leggings of the Fang
		{ id = 10411 }, -- Footpads of the Fang
	},
	Scarlet = {
		{ name = BIS["Chain of the Scarlet Crusade"] },
		{ id = 10328 }, -- Scarlet Chestpiece
		{ id = 10333 }, -- Scarlet Wristguards
		{ id = 10331 }, -- Scarlet Gauntlets
		{ id = 10329 }, -- Scarlet Belt
		{ id = 10330 }, -- Scarlet Leggings
		{ id = 10332 }, -- Scarlet Boots
	},
	GreymaneArmor = {
		{ name = BIS["Greymane Armor"] },
		{ id = 61313 }, -- Greymane Helmet
		{ id = 61324 }, -- Greymane Shoulders
		{ id = 61376 }, -- Greymane Gauntlets
		{ id = 61378 }, -- Greymane Legplates
		{ id = 61377 }, -- Greymane Sabatons
		{ id = 61379 }, -- Greymane Vambraces
	},
	IncendosaurSkinArmor = {
		{ name = BIS["Incendosaur Skin Armor"] },
		{ id = 60572 }, -- Incendosaur Skin Pauldrons
		{ id = 60568 }, -- Incendosaur Skin Boots
		{ id = 60582 }, -- Incendosaur Skin Gloves
	},
	TheGladiator = {
		{ name = BIS["The Gladiator"] },
		{ id = 11729 }, -- Savage Gladiator Helm
		{ id = 11726 }, -- Savage Gladiator Chain
		{ id = 11730 }, -- Savage Gladiator Grips
		{ id = 11728 }, -- Savage Gladiator Leggings
		{ id = 11731 }, -- Savage Gladiator Greaves
	},
	Ironweave = {
		{ name = BIS["Ironweave Battlesuit"] },
		{ id = 22302 }, -- Ironweave Cowl
		{ id = 22305 }, -- Ironweave Mantle
		{ id = 22301 }, -- Ironweave Robe
		{ id = 22313 }, -- Ironweave Bracers
		{ id = 22304 }, -- Ironweave Gloves
		{ id = 22306 }, -- Ironweave Belt
		{ id = 22303 }, -- Ironweave Pants
		{ id = 22311 }, -- Ironweave Boots
	},
	Scholo = {
		{ name = BIS["Necropile Raiment"] },
		{ id = 14633 }, -- Necropile Mantle
		{ id = 14626 }, -- Necropile Robe
		{ id = 14629 }, -- Necropile Cuffs
		{ id = 14632 }, -- Necropile Leggings
		{ id = 14631 }, -- Necropile Boots
		{},
		{ name = BIS["Cadaverous Garb"] },
		{ id = 14637 }, -- Cadaverous Armor
		{ id = 14640 }, -- Cadaverous Gloves
		{ id = 14636 }, -- Cadaverous Belt
		{ id = 14638 }, -- Cadaverous Leggings
		{ id = 14641 }, -- Cadaverous Walkers
		{},
		{},
		{ name = BIS["Bloodmail Regalia"] },
		{ id = 14611 }, -- Bloodmail Hauberk
		{ id = 14615 }, -- Bloodmail Gauntlets
		{ id = 14614 }, -- Bloodmail Belt
		{ id = 14612 }, -- Bloodmail Legguards
		{ id = 14616 }, -- Bloodmail Boots
		{},
		{ name = BIS["Deathbone Guardian"] },
		{ id = 14624 }, -- Deathbone Chestplate
		{ id = 14622 }, -- Deathbone Gauntlets
		{ id = 14620 }, -- Deathbone Girdle
		{ id = 14623 }, -- Deathbone Legguards
		{ id = 14621 }, -- Deathbone Sabatons
	},
	Strat = {
		{ name = BIS["The Postmaster"] },
		{ id = 13390 }, -- The Postmaster's Band
		{ id = 13388 }, -- The Postmaster's Tunic
		{ id = 13389 }, -- The Postmaster's Trousers
		{ id = 13391 }, -- The Postmaster's Treads
		{ id = 13392 }, -- The Postmaster's Seal
	},
	ScourgeInvasion = {
		{ name = BIS["Regalia of Undead Cleansing"], icon = "INV_Jewelry_Talisman_13" },
		{ id = 23085 }, -- Robe of Undead Cleansing
		{ id = 23091 }, -- Bracers of Undead Cleansing
		{ id = 23084 }, -- Gloves of Undead Cleansing
		{},
		{ name = BIS["Undead Slayer's Armor"], icon = "INV_Jewelry_Talisman_13" },
		{ id = 23089 }, -- Tunic of Undead Slaying
		{ id = 23093 }, -- Wristwraps of Undead Slaying
		{ id = 23081 }, -- Handwraps of Undead Slaying
		{},
		{ name = BIS["Garb of the Undead Slayer"], icon = "INV_Jewelry_Talisman_13" },
		{ id = 23088 }, -- Chestguard of Undead Slaying
		{ id = 23092 }, -- Wristguards of Undead Slaying
		{ id = 23082 }, -- Handguards of Undead Slaying
		{},
		{ name = BIS["Battlegear of Undead Slaying"], icon = "INV_Jewelry_Talisman_13" },
		{ id = 23087 }, -- Breastplate of Undead Slaying
		{ id = 23090 }, -- Bracers of Undead Slaying
		{ id = 23078 }, -- Gauntlets of Undead Slaying
	},
	ShardOfGods = {
		{ name = BIS["Shard of the Gods"] },
		{ id = 17082 }, -- Shard of the Flame
		{ id = 17064 }, -- Shard of the Scale
	},
	ZGRings = {
		{ name = BIS["Major Mojo Infusion"] },
		{ id = 19898 }, -- Seal of Jin
		{ id = 19925 }, -- Band of Jin
		{},
		{ name = BIS["Overlord's Resolution"] },
		{ id = 19873 }, -- Overlord's Crimson Band
		{ id = 19912 }, -- Overlord's Onyx Band
		{},
		{ name = BIS["Prayer of the Primal"] },
		{ id = 19863 }, -- Primalist's Seal
		{ id = 19920 }, -- Primalist's Band
		{},
		{ name = BIS["Zanzil's Concentration"] },
		{ id = 19905 }, -- Zanzil's Band
		{ id = 19893 }, -- Zanzil's Seal
	},
	SpiritofEskhandar = {
		{ name = BIS["Spirit of Eskhandar"] },
		{ id = 18204 }, -- Eskhandar's Pelt
		{ id = 18205 }, -- Eskhandar's Collar
		{ id = 18203 }, -- Eskhandar's Right Claw
		{ id = 18202 }, -- Eskhandar's Left Claw
	},
	HakkariBlades = {
		{ name = BIS["The Twin Blades of Hakkari"] },
		{ id = 19865 }, -- Warblade of the Hakkari (Main Hand)
		{ id = 19866 }, -- Warblade of the Hakkari (Off Hand)
	},
	PrimalBlessing = {
		{ name = BIS["Primal Blessing"] },
		{ id = 19896 }, -- Thekal's Grasp
		{ id = 19910 }, -- Arlokk's Grasp
	},
	DalRend = {
		{ name = BIS["Dal'Rend's Arms"] },
		{ id = 12940 }, -- Dal'Rend's Sacred Charge
		{ id = 12939 }, -- Dal'Rend's Tribal Guardian
	},
	SpiderKiss = {
		{ name = BIS["Spider's Kiss"] },
		{ id = 13218 }, -- Fang of the Crystal Spider
		{ id = 13183 }, -- Venomspitter
	},
	--Tier 3.5
	T35Priest = {
		{ name = BIS["Vestments of Pestilence"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 47228 }, -- Crown of Pestilence
		{ id = 47229 }, -- Shoulderpads of Pestilence
		{ id = 47230 }, -- Robes of Pestilence
		{ id = 47231 }, -- Leggings of Pestilence
		{ id = 47232 }, -- Boots of Pestilence
		{ id = 47233 }, -- Amulet of Pestilence
		{},
		{ name = BIS["Regalia of Pestilence"], icon = "Spell_Shadow_Shadowform" },
		{ id = 47234 }, -- Coronet of Pestilence
		{ id = 47235 }, -- Shoulderpads of Pestilence
		{ id = 47236 }, -- Raiments of Pestilence
		{ id = 47237 }, -- Pants of Pestilence
		{ id = 47238 }, -- Sandals of Pestilence
		{ id = 47239 }, -- Pendant of Pestilence
	},
	T35Mage = {
		{ name = BIS["Regalia of the Guardian"], icon = "Spell_Frost_IceStorm" },
		{ id = 47108 }, -- Crown of the Guardian
		{ id = 47109 }, -- Mantle of the Guardian
		{ id = 47110 }, -- Robes of the Guardian
		{ id = 47111 }, -- Leggings of the Guardian
		{ id = 47112 }, -- Boots of the Guardian
		{ id = 47113 }, -- Pendant of the Guardian
		{},
		{ name = BIS["Vestments of the Guardian"], icon = "Spell_Arcane_Blast" },
		{ id = 47114 }, -- Circlet of the Guardian
		{ id = 47115 }, -- Epaulets of the Guardian
		{ id = 47116 }, -- Vestments of the Guardian
		{ id = 47117 }, -- Trousers of the Guardian
		{ id = 47118 }, -- Slippers of the Guardian
		{ id = 47119 }, -- Amulet of the Guardian
	},
	T35Warlock = {
		{ name = BIS["Nathrezim Attire"], icon = "Spell_Shadow_Requiem" },
		{ id = 47306 }, -- Nathrezim Crown
		{ id = 47307 }, -- Nathrezim Mantle
		{ id = 47308 }, -- Nathrezim Raiments
		{ id = 47309 }, -- Nathrezim Leggings
		{ id = 47310 }, -- Nathrezim Boots
		{ id = 47311 }, -- Nathrezim Amulet
		{},
		{ name = BIS["Nathrezim Raiment"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 47312 }, -- Nathrezim Skullcap
		{ id = 47313 }, -- Nathrezim Spaulders
		{ id = 47314 }, -- Nathrezim Robes
		{ id = 47315 }, -- Nathrezim Pants
		{ id = 47316 }, -- Nathrezim Slippers
		{ id = 47317 }, -- Nathrezim Pendant
	},
	T35Rogue = {
		{ name = BIS["Trickster's Armor"], icon = "Ability_BackStab" },
		{ id = 47324 }, -- Trickster Helmet
		{ id = 47325 }, -- Trickster Pauldrons
		{ id = 47326 }, -- Trickster Breastplate
		{ id = 47327 }, -- Trickster Leggings
		{ id = 47328 }, -- Trickster Sabatons
		{ id = 47329 }, -- Trickster Choker
	},
	T35Druid = {
		{ name = BIS["Raiments of the Talon"], icon = "Ability_Druid_TreeofLife" }, --restoration
		{ id = 47390 }, -- Helm of the Talon
		{ id = 47391 }, -- Spaulders of the Talon
		{ id = 47392 }, -- Vestments of the Talon
		{ id = 47393 }, -- Leggings of the Talon
		{ id = 47394 }, -- Boots of the Talon
		{ id = 47395 }, -- Amulet of the Talon
		{},
		{ name = BIS["Regalia of the Talon"], icon = "Spell_Nature_ForceOfNature" }, --balance
		{ id = 47396 }, -- Circlet of the Talon
		{ id = 47397 }, -- Mantle of the Talon
		{ id = 47398 }, -- Vest of the Talon
		{ id = 47399 }, -- Trousers of the Talon
		{ id = 47400 }, -- Slippers of the Talon
		{ id = 47401 }, -- Pendant of the Talon
		{ name = BIS["Harness of the Talon"], icon = "Ability_Druid_CatForm" }, --cat
		{ id = 47402 }, -- Helmet of the Talon
		{ id = 47403 }, -- Shoulderpads of the Talon
		{ id = 47404 }, -- Raiments of the Talon
		{ id = 47405 }, -- Pants of the Talon
		{ id = 47406 }, -- Treads of the Talon
		{ id = 47407 }, -- Choker of the Talon
	},
	T35Hunter = {
		{ name = BIS["Ravenstalker's Armor"], icon = "Ability_Hunter_RunningShot" },
		{ id = 47318 }, -- Ravenstalker Headpiece
		{ id = 47319 }, -- Ravenstalker Spaulders
		{ id = 47320 }, -- Ravenstalker Tunic
		{ id = 47321 }, -- Ravenstalker Legguards
		{ id = 47322 }, -- Ravenstalker Boots
		{ id = 47323 }, -- Ravenstalker Choker
	},
	T35Shaman = {
		{ name = BIS["Stormhowl Battlegear"], icon = "Ability_Shaman_StormStrike" }, --enhancement
		{ id = 47180 }, -- Stormhowl Crown
		{ id = 47181 }, -- Stormhowl Pauldrons
		{ id = 47182 }, -- Stormhowl Breastplate
		{ id = 47183 }, -- Stormhowl Leggings
		{ id = 47184 }, -- Stormhowl Sabatons
		{ id = 47185 }, -- Choker of the Stormhowl
		{},
		{ name = BIS["Stormhowl Garb"], icon = "Spell_Nature_Earthquake" }, --elemental
		{ id = 47186 }, -- Stormhowl Helmet
		{ id = 47187 }, -- Stormhowl Epaulets
		{ id = 47188 }, -- Stormhowl Raiments
		{ id = 47189 }, -- Stormhowl Legplates
		{ id = 47190 }, -- Stormhowl Greaves
		{ id = 47191 }, -- Pendant of the Stormhowl
		{ name = BIS["The Stormhowl"], icon = "Spell_Shaman_SpiritLink" }, --restoration
		{ id = 47192 }, -- Stormhowl Headpiece
		{ id = 47193 }, -- Stormhowl Spaulders
		{ id = 47194 }, -- Stormhowl Tunic
		{ id = 47195 }, -- Stormhowl Legguards
		{ id = 47196 }, -- Stormhowl Boots
		{ id = 47197 }, -- Amulet of the Stormhowl
	},
	T35Paladin = {
		{ name = BIS["Lionheart Armor"], icon = "Spell_Holy_Power" }, --holy
		{ id = 47060 }, -- Lionheart Headpiece
		{ id = 47061 }, -- Lionheart Spaulders
		{ id = 47062 }, -- Lionheart Breastplate
		{ id = 47063 }, -- Lionheart Legplates
		{ id = 47064 }, -- Lionheart Boots
		{ id = 47065 }, -- Lionheart Amulet
		{},
		{ name = BIS["Lionheart Battleplate"], icon = "Ability_Defend" }, --protection
		{ id = 47066 }, -- Lionheart Helmet
		{ id = 47067 }, -- Lionheart Shoulderguards
		{ id = 47068 }, -- Lionheart Chestguard
		{ id = 47069 }, -- Lionheart Legguards
		{ id = 47070 }, -- Lionheart Greaves
		{ id = 47071 }, -- Lionheart Pendant
		{ name = BIS["Lionheart Battlegear"], icon = "Ability_Racial_Avatar" }, --retribution
		{ id = 47072 }, -- Lionheart Crown
		{ id = 47073 }, -- Lionheart Pauldrons
		{ id = 47074 }, -- Lionheart Chestplate
		{ id = 47075 }, -- Lionheart Leggings
		{ id = 47076 }, -- Lionheart Sabatons
		{ id = 47077 }, -- Lionheart Choker
	},
	T35Warrior = {
		{ name = BIS["Battlegear of the Brotherhood"], icon = "INV_Shield_05" },
		{ id = 47270 }, -- Helmet of the Brotherhood
		{ id = 47271 }, -- Shoulderguards of the Brotherhood
		{ id = 47272 }, -- Chestguard of the Brotherhood
		{ id = 47273 }, -- Legguards of the Brotherhood
		{ id = 47274 }, -- Greaves of the Brotherhood
		{ id = 47275 }, -- Choker of the Brotherhood
	},
	T3Mage = {
		{ name = BIS["Frostfire Regalia"], icon = "Spell_Frost_IceStorm" },
		{ id = 22498 }, -- Frostfire Circlet
		{ id = 22499 }, -- Frostfire Shoulderpads
		{ id = 22496 }, -- Frostfire Robe
		{ id = 22503 }, -- Frostfire Bindings
		{ id = 22501 }, -- Frostfire Gloves
		{ id = 22502 }, -- Frostfire Belt
		{ id = 22497 }, -- Frostfire Leggings
		{ id = 22500 }, -- Frostfire Sandals
		{ id = 23062 }, -- Frostfire Ring
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Frostfire Vestments"], icon = "Spell_Arcane_Blast" },
		{ id = 47099 }, -- Frostfire Crown
		{ id = 47100 }, -- Frostfire Epaulets
		{ id = 47101 }, -- Frostfire Vestments
		{ id = 47102 }, -- Frostfire Bracers
		{ id = 47103 }, -- Frostfire Handwraps
		{ id = 47104 }, -- Frostfire Cord
		{ id = 47105 }, -- Frostfire Trousers
		{ id = 47106 }, -- Frostfire Slippers
		{ id = 47107 }, -- Frostfire Signet
	},
	T3Warlock = {
		{ name = BIS["Plagueheart Raiment"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 22506 }, -- Plagueheart Circlet
		{ id = 22507 }, -- Plagueheart Shoulderpads
		{ id = 22504 }, -- Plagueheart Robe
		{ id = 22511 }, -- Plagueheart Bracers
		{ id = 22509 }, -- Plagueheart Gloves
		{ id = 22510 }, -- Plagueheart Belt
		{ id = 22505 }, -- Plagueheart Leggings
		{ id = 22508 }, -- Plagueheart Sandals
		{ id = 23063 }, -- Plagueheart Ring
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Plagueheart Attire"], icon = "Spell_Shadow_Requiem" },
		{ id = 47297 }, -- Plagueheart Crown
		{ id = 47298 }, -- Plagueheart Mantle
		{ id = 47299 }, -- Plagueheart Raiments
		{ id = 47300 }, -- Plagueheart Bindings
		{ id = 47301 }, -- Plagueheart Handwraps
		{ id = 47302 }, -- Plagueheart Sash
		{ id = 47303 }, -- Plagueheart Leggings
		{ id = 47304 }, -- Plagueheart Boots
		{ id = 47305 }, -- Plagueheart Signet
	},
	T3Priest = {
		{ name = BIS["Vestments of Faith"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 22514 }, -- Circlet of Faith
		{ id = 22515 }, -- Shoulderpads of Faith
		{ id = 22512 }, -- Robe of Faith
		{ id = 22519 }, -- Bindings of Faith
		{ id = 22517 }, -- Gloves of Faith
		{ id = 22518 }, -- Belt of Faith
		{ id = 22513 }, -- Leggings of Faith
		{ id = 22516 }, -- Sandals of Faith
		{ id = 23061 }, -- Ring of Faith
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Regalia of Faith"], icon = "Spell_Shadow_Shadowform" },
		{ id = 47219 }, -- Coronet of Faith
		{ id = 47220 }, -- Shoulderpads of Faith
		{ id = 47221 }, -- Raiments of Faith
		{ id = 47222 }, -- Bracers of Faith
		{ id = 47223 }, -- Handguards of Faith
		{ id = 47224 }, -- Sash of Faith
		{ id = 47225 }, -- Pants of Faith
		{ id = 47226 }, -- Sandals of Faith
		{ id = 47227 }, -- Ring of Faith
	},
	T3Rogue = {
		{ name = BIS["Bonescythe Armor"], icon = "Ability_BackStab" },
		{ id = 22478 }, -- Bonescythe Helmet
		{ id = 22479 }, -- Bonescythe Pauldrons
		{ id = 22476 }, -- Bonescythe Breastplate
		{ id = 22483 }, -- Bonescythe Bracers
		{ id = 22481 }, -- Bonescythe Gauntlets
		{ id = 22482 }, -- Bonescythe Waistguard
		{ id = 22477 }, -- Bonescythe Legplates
		{ id = 22480 }, -- Bonescythe Sabatons
		{ id = 23060 }, -- Bonescythe Ring
	},
	T3Druid = {
		{ name = BIS["Dreamwalker Raiment"], icon = "Ability_Druid_TreeofLife" },
		{ id = 22490 }, -- Dreamwalker Headpiece
		{ id = 22491 }, -- Dreamwalker Spaulders
		{ id = 22488 }, -- Dreamwalker Tunic
		{ id = 22495 }, -- Dreamwalker Bracers
		{ id = 22493 }, -- Dreamwalker Handguards
		{ id = 22494 }, -- Dreamwalker Belt
		{ id = 22489 }, -- Dreamwalker Legguards
		{ id = 22492 }, -- Dreamwalker Boots
		{ id = 23064 }, -- Ring of the Dreamwalker *10
		{},
		{ name = BIS["Dreamwalker Regalia"], icon = "Spell_Nature_ForceOfNature" },
		{ id = 47372 }, -- Dreamwalker Circlet
		{ id = 47373 }, -- Dreamwalker Mantle
		{ id = 47374 }, -- Dreamwalker Vest *15
		{ name = BIS["Dreamwalker Harness"], icon = "Ability_Racial_BearForm" }, --bear
		{ id = 47381 }, -- Dreamwalker Helmet
		{ id = 47382 }, -- Dreamwalker Shoulderpads
		{ id = 47383 }, -- Dreamwalker Raiments
		{ id = 47384 }, -- Dreamwalker Wristguards
		{ id = 47385 }, -- Dreamwalker Handwraps
		{ id = 47386 }, -- Dreamwalker Girdle
		{ id = 47387 }, -- Dreamwalker Pants
		{ id = 47388 }, -- Dreamwalker Treads
		{ id = 47389 }, -- Band of the Dreamwalker *10
		{},
		{},
		{},
		{},
		{},
		{ id = 47375 }, -- Dreamwalker Wristbands *1
		{ id = 47376 }, -- Dreamwalker Handwraps
		{ id = 47377 }, -- Dreamwalker Sash
		{ id = 47378 }, -- Dreamwalker Trousers
		{ id = 47379 }, -- Dreamwalker Slippers
		{ id = 47380 }, -- Signet of the Dreamwalker
	},
	T3Hunter = {
		{ name = BIS["Cryptstalker Armor"], icon = "Ability_Hunter_RunningShot" },
		{ id = 22438 }, -- Cryptstalker Headpiece
		{ id = 22439 }, -- Cryptstalker Spaulders
		{ id = 22436 }, -- Cryptstalker Tunic
		{ id = 22443 }, -- Cryptstalker Wristguards
		{ id = 22441 }, -- Cryptstalker Handguards
		{ id = 22442 }, -- Cryptstalker Girdle
		{ id = 22437 }, -- Cryptstalker Legguards
		{ id = 22440 }, -- Cryptstalker Boots
		{ id = 23067 }, -- Ring of the Cryptstalker
	},
	T3Shaman = {
		{ name = BIS["The Earthshatterer"], icon = "Spell_Shaman_SpiritLink" },
		{ id = 22466 }, -- Earthshatter Headpiece
		{ id = 22467 }, -- Earthshatter Spaulders
		{ id = 22464 }, -- Earthshatter Tunic
		{ id = 22471 }, -- Earthshatter Wristguards
		{ id = 22469 }, -- Earthshatter Handguards
		{ id = 22470 }, -- Earthshatter Girdle
		{ id = 22465 }, -- Earthshatter Legguards
		{ id = 22468 }, -- Earthshatter Boots
		{ id = 23065 }, -- Ring of the Earthshatterer
		{},
		{ name = BIS["Earthshatterer's Battlegear"], icon = "Ability_Shaman_StormStrike" },
		{ id = 47162 }, -- Earthshatter Crown
		{ id = 47163 }, -- Earthshatter Pauldrons
		{ id = 47164 }, -- Earthshatter Breastplate *15
		{ name = BIS["Earthshatterer's Garb"], icon = "Spell_Nature_Earthquake" },
		{ id = 47171 }, -- Earthshatter Helmet
		{ id = 47172 }, -- Earthshatter Epaulets
		{ id = 47173 }, -- Earthshatter Raiments
		{ id = 47174 }, -- Earthshatter Bindings
		{ id = 47175 }, -- Earthshatter Gauntlets
		{ id = 47176 }, -- Earthshatter Sash
		{ id = 47177 }, -- Earthshatter Legplates
		{ id = 47178 }, -- Earthshatter Greaves
		{ id = 47179 }, -- Loop of the Earthshatterer
		{},
		{},
		{},
		{},
		{},
		{ id = 47165 }, -- Earthshatter Bracelets *1
		{ id = 47166 }, -- Earthshatter Fists
		{ id = 47167 }, -- Earthshatter Girdle
		{ id = 47168 }, -- Earthshatter Leggings
		{ id = 47169 }, -- Earthshatter Sabatons
		{ id = 47170 }, -- Signet of the Earthshatterer
	},
	T3Paladin = {
		{ name = BIS["Redemption Armor"], icon = "Spell_Holy_Power" },
		{ id = 22428 }, -- Redemption Helm
		{ id = 22429 }, -- Redemption Spaulders
		{ id = 22425 }, -- Redemption Tunic
		{ id = 22424 }, -- Redemption Bracers
		{ id = 22426 }, -- Redemption Gloves
		{ id = 22431 }, -- Redemption Belt
		{ id = 22427 }, -- Redemption Pants
		{ id = 22430 }, -- Redemption Boots
		{ id = 23066 }, -- Ring of Redemption
		{},
		{ name = BIS["Redemption Battleplate"], icon = "Ability_Defend" },
		{ id = 47042 }, -- Redemption Helmet
		{ id = 47043 }, -- Redemption Shoulderguards
		{ id = 47044 }, -- Redemption Chestguard
		{ name = BIS["Redemption Battlegear"], icon = "Ability_Racial_Avatar" },
		{ id = 47051 }, -- Redemption Crown
		{ id = 47052 }, -- Redemption Pauldrons
		{ id = 47053 }, -- Redemption Chestplate
		{ id = 47054 }, -- Redemption Bindings
		{ id = 47055 }, -- Redemption Gauntlets
		{ id = 47056 }, -- Redemption Girdle
		{ id = 47057 }, -- Redemption Leggings
		{ id = 47058 }, -- Redemption Sabatons
		{ id = 47059 }, -- Band of Redemption
		{},
		{},
		{},
		{},
		{},
		{ id = 47045 }, -- Redemption Wristguards
		{ id = 47046 }, -- Redemption Handguards
		{ id = 47047 }, -- Redemption Waistguard
		{ id = 47048 }, -- Redemption Legguards
		{ id = 47049 }, -- Redemption Greaves
		{ id = 47050 }, -- Signet of Redemption
	},
	T3Warrior = {
		{ name = BIS["Dreadnaught's Battlegear"], icon = "INV_Shield_05" }, --tank
		{ id = 22418 }, -- Dreadnaught Helmet
		{ id = 22419 }, -- Dreadnaught Pauldrons
		{ id = 22416 }, -- Dreadnaught Breastplate
		{ id = 22423 }, -- Dreadnaught Bracers
		{ id = 22421 }, -- Dreadnaught Gauntlets
		{ id = 22422 }, -- Dreadnaught Waistguard
		{ id = 22417 }, -- Dreadnaught Legplates
		{ id = 22420 }, -- Dreadnaught Sabatons
		{ id = 23059 }, -- Ring of the Dreadnaught
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Armor of the Dreadnaught's"], icon = "Ability_Gouge" }, --dps
		{ id = 47261 }, -- Dreadnaught Crown
		{ id = 47262 }, -- Dreadnaught Pauldrons
		{ id = 47263 }, -- Dreadnaught Chestplate
		{ id = 47264 }, -- Dreadnaught Bindings
		{ id = 47265 }, -- Dreadnaught Gloves
		{ id = 47266 }, -- Dreadnaught Girdle
		{ id = 47267 }, -- Dreadnaught Leggings
		{ id = 47268 }, -- Dreadnaught Sabatons
		{ id = 47269 }, -- Ring of the Dreadnaught
	},
	T2Mage = {
		{ name = BIS["Netherwind Regalia"], icon = "Spell_Frost_IceStorm" },
		{ id = 16914 }, -- Netherwind Crown
		{ id = 16917 }, -- Netherwind Mantle
		{ id = 16916 }, -- Netherwind Robes
		{ id = 16918 }, -- Netherwind Bindings
		{ id = 16913 }, -- Netherwind Gloves
		{ id = 16818 }, -- Netherwind Belt
		{ id = 16915 }, -- Netherwind Pants
		{ id = 16912 }, -- Netherwind Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Netherwind Vestments"], icon = "Spell_Arcane_Blast" },
		{ id = 47086 }, -- Netherwind Circlet
		{ id = 47087 }, -- Netherwind Epaulets
		{ id = 47088 }, -- Netherwind Vestments
		{ id = 47089 }, -- Netherwind Wristbands
		{ id = 47090 }, -- Netherwind Handwraps
		{ id = 47091 }, -- Netherwind Cord
		{ id = 47092 }, -- Netherwind Trousers
		{ id = 47093 }, -- Netherwind Slippers
	},
	T2Priest = {
		{ name = BIS["Vestments of Transcendence"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 16921 }, -- Halo of Transcendence
		{ id = 16924 }, -- Pauldrons of Transcendence
		{ id = 16923 }, -- Robes of Transcendence
		{ id = 16926 }, -- Bindings of Transcendence
		{ id = 16920 }, -- Handguards of Transcendence
		{ id = 16925 }, -- Belt of Transcendence
		{ id = 16922 }, -- Leggings of Transcendence
		{ id = 16919 }, -- Boots of Transcendence
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Regalia of Transcendence"], icon = "Spell_Shadow_Shadowform" },
		{ id = 47206 }, -- Coronet of Transcendence
		{ id = 47207 }, -- Shoulderpads of Transcendence
		{ id = 47208 }, -- Raiments of Transcendence
		{ id = 47209 }, -- Bracers of Transcendence
		{ id = 47210 }, -- Handguards of Transcendence
		{ id = 47211 }, -- Sash of Transcendence
		{ id = 47212 }, -- Pants of Transcendence
		{ id = 47213 }, -- Sandals of Transcendence
	},
	T2Warlock = {
		{ name = BIS["Nemesis Raiment"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 16929 }, -- Nemesis Skullcap
		{ id = 16932 }, -- Nemesis Spaulders
		{ id = 16931 }, -- Nemesis Robes
		{ id = 16934 }, -- Nemesis Bracers
		{ id = 16928 }, -- Nemesis Gloves
		{ id = 16933 }, -- Nemesis Belt
		{ id = 16930 }, -- Nemesis Leggings
		{ id = 16927 }, -- Nemesis Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Nemesis Attire"], icon = "Spell_Shadow_Requiem" },
		{ id = 47284 }, -- Nemesis Crown
		{ id = 47285 }, -- Nemesis Mantle
		{ id = 47286 }, -- Nemesis Raiments
		{ id = 47287 }, -- Nemesis Bindings
		{ id = 47288 }, -- Nemesis Handwraps
		{ id = 47289 }, -- Nemesis Sash
		{ id = 47290 }, -- Nemesis Leggings
		{ id = 47291 }, -- Nemesis Slippers
	},
	T2Rogue = {
		{ name = BIS["Bloodfang Armor"], icon = "Ability_BackStab" },
		{ id = 16908 }, -- Bloodfang Hood
		{ id = 16832 }, -- Bloodfang Spaulders
		{ id = 16905 }, -- Bloodfang Chestpiece
		{ id = 16911 }, -- Bloodfang Bracers
		{ id = 16907 }, -- Bloodfang Gloves
		{ id = 16910 }, -- Bloodfang Belt
		{ id = 16909 }, -- Bloodfang Pants
		{ id = 16906 }, -- Bloodfang Boots
	},
	T2Druid = {
		{ name = BIS["Stormrage Raiment"], icon = "Ability_Druid_TreeofLife" },
		{ id = 16900 }, -- Stormrage Cover
		{ id = 16902 }, -- Stormrage Pauldrons
		{ id = 16897 }, -- Stormrage Chestguard
		{ id = 16904 }, -- Stormrage Bracers
		{ id = 16899 }, -- Stormrage Handguards
		{ id = 16903 }, -- Stormrage Belt
		{ id = 16901 }, -- Stormrage Legguards
		{ id = 16898 }, -- Stormrage Boots
		{},
		{ name = BIS["Stormrage Regalia"], icon = "Spell_Nature_ForceOfNature" },
		{ id = 47346 }, -- Stormrage Circlet
		{ id = 47347 }, -- Stormrage Mantle
		{ id = 47348 }, -- Stormrage Vest
		{ id = 47349 }, -- Stormrage Wristbands
		{ name = BIS["Stormrage Harness"], icon = "Ability_Racial_BearForm" },
		{ id = 47354 }, -- Stormrage Helmet
		{ id = 47355 }, -- Stormrage Shoulderpads
		{ id = 47356 }, -- Stormrage Raiments
		{ id = 47357 }, -- Stormrage Wristguards
		{ id = 47358 }, -- Stormrage Handguards
		{ id = 47359 }, -- Stormrage Girdle
		{ id = 47360 }, -- Stormrage Pants
		{ id = 47361 }, -- Stormrage Treads
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 47350 }, -- Stormrage Handwraps
		{ id = 47351 }, -- Stormrage Sash
		{ id = 47352 }, -- Stormrage Trousers
		{ id = 47353 }, -- Stormrage Slippers
	},
	T2Shaman = {
		{ name = BIS["Garb of the Ten Storms"], icon = "Spell_Nature_Earthquake" },
		{ id = 16947 }, -- Helmet of Ten Storms
		{ id = 16945 }, -- Epaulets of Ten Storms
		{ id = 16950 }, -- Breastplate of Ten Storms
		{ id = 16943 }, -- Bracers of Ten Storms
		{ id = 16948 }, -- Gauntlets of Ten Storms
		{ id = 16944 }, -- Belt of Ten Storms
		{ id = 16946 }, -- Legplates of Ten Storms
		{ id = 16949 }, -- Greaves of Ten Storms
		{},
		{ name = BIS["Battlegear of the Ten Storms"], icon = "Ability_Shaman_StormStrike" },
		{ id = 47136 }, -- Crown of Ten Storms
		{ id = 47137 }, -- Pauldrons of Ten Storms
		{ id = 47138 }, -- Breastplate of Ten Storms
		{ id = 47139 }, -- Bracelets of Ten Storms
		{ name = BIS["The Ten Storms"], icon = "Spell_Shaman_SpiritLink" },
		{ id = 47144 }, -- Helmet of Ten Storms
		{ id = 47145 }, -- Spaulders of Ten Storms
		{ id = 47146 }, -- Chestpiece of Ten Storms
		{ id = 47147 }, -- Bracers of Ten Storms
		{ id = 47148 }, -- Gloves of Ten Storms
		{ id = 47149 }, -- Belt of Ten Storms
		{ id = 47150 }, -- Pants of Ten Storms
		{ id = 47151 }, -- Boots of Ten Storms
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 47140 }, -- Fists of Ten Storms
		{ id = 47141 }, -- Girdle of Ten Storms
		{ id = 47142 }, -- Leggings of Ten Storms
		{ id = 47143 }, -- Sabatons of Ten Storms
	},
	T2Hunter = {
		{ name = BIS["Dragonstalker Armor"], icon = "Ability_Hunter_RunningShot" },
		{ id = 16939 }, -- Dragonstalker's Helm
		{ id = 16937 }, -- Dragonstalker's Spaulders
		{ id = 16942 }, -- Dragonstalker's Breastplate
		{ id = 16935 }, -- Dragonstalker's Bracers
		{ id = 16940 }, -- Dragonstalker's Gauntlets
		{ id = 16936 }, -- Dragonstalker's Belt
		{ id = 16938 }, -- Dragonstalker's Legguards
		{ id = 16941 }, -- Dragonstalker's Greaves
	},
	T2Warrior = {
		{ name = BIS["Battlegear of Wrath"], icon = "INV_Shield_05" },
		{ id = 16963 }, -- Helm of Wrath
		{ id = 16961 }, -- Pauldrons of Wrath
		{ id = 16966 }, -- Breastplate of Wrath
		{ id = 16959 }, -- Bracelets of Wrath
		{ id = 16964 }, -- Gauntlets of Wrath
		{ id = 16960 }, -- Waistband of Wrath
		{ id = 16962 }, -- Legplates of Wrath
		{ id = 16965 }, -- Sabatons of Wrath
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Armor of Wrath"], icon = "Ability_Gouge" },
		{ id = 47248 }, -- Crown of Wrath
		{ id = 47249 }, -- Pauldrons of Wrath
		{ id = 47250 }, -- Chestplate of Wrath
		{ id = 47251 }, -- Bindings of Wrath
		{ id = 47252 }, -- Gloves of Wrath
		{ id = 47253 }, -- Girdle of Wrath
		{ id = 47254 }, -- Leggings of Wrath
		{ id = 47255 }, -- Sabatons of Wrath
	},
	T2Paladin = {
		{ name = BIS["Judgement Armor"], icon = "Spell_Holy_Power" },
		{ id = 16955 }, -- Judgement Crown
		{ id = 16953 }, -- Judgement Spaulders
		{ id = 16958 }, -- Judgement Breastplate
		{ id = 16951 }, -- Judgement Bindings
		{ id = 16956 }, -- Judgement Gauntlets
		{ id = 16952 }, -- Judgement Belt
		{ id = 16954 }, -- Judgement Legplates
		{ id = 16957 }, -- Judgement Sabatons
		{},
		{ name = BIS["Judgement Battleplate"], icon = "Ability_Defend" },
		{ id = 47016 }, -- Judgement Helmet
		{ id = 47017 }, -- Judgement Shoulderguards
		{ id = 47018 }, -- Judgement Chestguard
		{ id = 47019 }, -- Judgement Wristguards
		{ name = BIS["Judgement Battlegear"], icon = "Ability_Racial_Avatar" },
		{ id = 47024 }, -- Judgement Crown
		{ id = 47025 }, -- Judgement Pauldrons
		{ id = 47026 }, -- Judgement Chestplate
		{ id = 47027 }, -- Judgement Bindings
		{ id = 47028 }, -- Judgement Gauntlets
		{ id = 47029 }, -- Judgement Girdle
		{ id = 47030 }, -- Judgement Leggings
		{ id = 47031 }, -- Judgement Sabatons
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 47020 }, -- Judgement Handguards
		{ id = 47021 }, -- Judgement Waistguard
		{ id = 47022 }, -- Judgement Legguards
		{ id = 47023 }, -- Judgement Greaves
	},
	T1Mage = {
		{ name = BIS["Arcanist Regalia"], icon = "Spell_Frost_IceStorm" },
		{ id = 16795 }, -- Arcanist Crown
		{ id = 16797 }, -- Arcanist Mantle
		{ id = 16798 }, -- Arcanist Robes
		{ id = 16799 }, -- Arcanist Bindings
		{ id = 16801 }, -- Arcanist Gloves
		{ id = 16802 }, -- Arcanist Belt
		{ id = 16796 }, -- Arcanist Leggings
		{ id = 16800 }, -- Arcanist Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Arcanist Vestments"], icon = "Spell_Arcane_Blast" },
		{ id = 47078 }, -- Arcanist Circlet
		{ id = 47079 }, -- Arcanist Epaulets
		{ id = 47080 }, -- Arcanist Vestments
		{ id = 47081 }, -- Arcanist Wristbands
		{ id = 47082 }, -- Arcanist Handwraps
		{ id = 47083 }, -- Arcanist Cord
		{ id = 47084 }, -- Arcanist Trousers
		{ id = 47085 }, -- Arcanist Slippers
	},
	T1Priest = {
		{ name = BIS["Vestments of Prophecy"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 16813 }, -- Circlet of Prophecy
		{ id = 16816 }, -- Mantle of Prophecy
		{ id = 16815 }, -- Robes of Prophecy
		{ id = 16819 }, -- Vambraces of Prophecy
		{ id = 16812 }, -- Gloves of Prophecy
		{ id = 16817 }, -- Girdle of Prophecy
		{ id = 16814 }, -- Pants of Prophecy
		{ id = 16811 }, -- Boots of Prophecy
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Regalia of Prophecy"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 47198 }, -- Coronet of Prophecy
		{ id = 47199 }, -- Shoulderpads of Prophecy
		{ id = 47200 }, -- Raiments of Prophecy
		{ id = 47201 }, -- Bracers of Prophecy
		{ id = 47202 }, -- Handguards of Prophecy
		{ id = 47203 }, -- Sash of Prophecy
		{ id = 47204 }, -- Pants of Prophecy
		{ id = 47205 }, -- Sandals of Prophecy
	},
	T1Warlock = {
		{ name = BIS["Felheart Raiment"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 16808 }, -- Felheart Horns
		{ id = 16807 }, -- Felheart Shoulder Pads
		{ id = 16809 }, -- Felheart Robes
		{ id = 16804 }, -- Felheart Bracers
		{ id = 16805 }, -- Felheart Gloves
		{ id = 16806 }, -- Felheart Belt
		{ id = 16810 }, -- Felheart Pants
		{ id = 16803 }, -- Felheart Slippers
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Felheart Attire"], icon = "Spell_Shadow_Requiem" },
		{ id = 47276 }, -- Felheart Crown
		{ id = 47277 }, -- Felheart Mantle
		{ id = 47278 }, -- Felheart Raiments
		{ id = 47279 }, -- Felheart Bindings
		{ id = 47280 }, -- Felheart Handwraps
		{ id = 47281 }, -- Felheart Sash
		{ id = 47282 }, -- Felheart Leggings
		{ id = 47283 }, -- Felheart Boots
	},
	T1Rogue = {
		{ name = BIS["Nightslayer Armor"], icon = "Ability_BackStab" },
		{ id = 16821 }, -- Nightslayer Cover
		{ id = 16823 }, -- Nightslayer Shoulder Pads
		{ id = 16820 }, -- Nightslayer Chestpiece
		{ id = 16825 }, -- Nightslayer Bracelets
		{ id = 16826 }, -- Nightslayer Gloves
		{ id = 16827 }, -- Nightslayer Belt
		{ id = 16822 }, -- Nightslayer Pants
		{ id = 16824 }, -- Nightslayer Boots
	},
	T1Druid = {
		{ name = BIS["Cenarion Raiment"], icon = "Ability_Druid_TreeofLife" }, --restoration
		{ id = 16834 }, -- Cenarion Helm
		{ id = 16836 }, -- Cenarion Spaulders
		{ id = 16833 }, -- Cenarion Vestments
		{ id = 16830 }, -- Cenarion Bracers
		{ id = 16831 }, -- Cenarion Gloves
		{ id = 16828 }, -- Cenarion Belt
		{ id = 16835 }, -- Cenarion Leggings
		{ id = 16829 }, -- Cenarion Boots
		{},
		{ name = BIS["Cenarion Regalia"], icon = "Spell_Nature_ForceOfNature" }, --balance
		{ id = 47330 }, -- Cenarion Circlet
		{ id = 47331 }, -- Cenarion Mantle
		{ id = 47332 }, -- Cenarion Vest
		{ id = 47333 }, -- Cenarion Wristbands
		{ name = BIS["Cenarion Harness"], icon = "Ability_Druid_CatForm" }, --cat
		{ id = 47338 }, -- Cenarion Helmet
		{ id = 47339 }, -- Cenarion Shoulderpads
		{ id = 47340 }, -- Cenarion Raiments
		{ id = 47341 }, -- Cenarion Wristguards
		{ id = 47342 }, -- Cenarion Handguards
		{ id = 47343 }, -- Cenarion Girdle
		{ id = 47344 }, -- Cenarion Pants
		{ id = 47345 }, -- Cenarion Treads
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 47334 }, -- Cenarion Handwraps
		{ id = 47335 }, -- Cenarion Sash
		{ id = 47336 }, -- Cenarion Trousers
		{ id = 47337 }, -- Cenarion Slippers
	},
	T1Shaman = {
		{ name = BIS["The Earthfury"], icon = "Spell_Shaman_SpiritLink" },
		{ id = 16842 }, -- Earthfury Helmet
		{ id = 16844 }, -- Earthfury Epaulets
		{ id = 16841 }, -- Earthfury Vestments
		{ id = 16840 }, -- Earthfury Bracers
		{ id = 16839 }, -- Earthfury Gloves
		{ id = 16838 }, -- Earthfury Belt
		{ id = 16843 }, -- Earthfury Legguards
		{ id = 16837 }, -- Earthfury Boots
		{},
		{ name = BIS["Earthfury Battlegear"], icon = "Ability_Shaman_StormStrike" },
		{ id = 47120 }, -- Earthfury Crown
		{ id = 47121 }, -- Earthfury Pauldrons
		{ id = 47122 }, -- Earthfury Breastplate
		{ id = 47123 }, -- Earthfury Bracelets
		{ name = BIS["Earthfury Garb"], icon = "Spell_Nature_Earthquake" },
		{ id = 47128 }, -- Earthfury Visor
		{ id = 47129 }, -- Earthfury Epaulets
		{ id = 47130 }, -- Earthfury Raiments
		{ id = 47131 }, -- Earthfury Bindings
		{ id = 47132 }, -- Earthfury Gauntlets
		{ id = 47133 }, -- Earthfury Sash
		{ id = 47134 }, -- Earthfury Legplates
		{ id = 47135 }, -- Earthfury Greaves
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 47124 }, -- Earthfury Fists
		{ id = 47125 }, -- Earthfury Girdle
		{ id = 47126 }, -- Earthfury Leggings
		{ id = 47127 }, -- Earthfury Sabatons
	},
	T1Hunter = {
		{ name = BIS["Giantstalker Armor"], icon = "Ability_Hunter_RunningShot" },
		{ id = 16846 }, -- Giantstalker's Helmet
		{ id = 16848 }, -- Giantstalker's Epaulets
		{ id = 16845 }, -- Giantstalker's Breastplate
		{ id = 16850 }, -- Giantstalker's Bracers
		{ id = 16852 }, -- Giantstalker's Gloves
		{ id = 16851 }, -- Giantstalker's Belt
		{ id = 16847 }, -- Giantstalker's Leggings
		{ id = 16849 }, -- Giantstalker's Boots
	},
	T1Warrior = {
		{ name = BIS["Battlegear of Might"], icon = "INV_Shield_05" },
		{ id = 16866 }, -- Helm of Might
		{ id = 16868 }, -- Pauldrons of Might
		{ id = 16865 }, -- Breastplate of Might
		{ id = 16861 }, -- Bracers of Might
		{ id = 16863 }, -- Gauntlets of Might
		{ id = 16864 }, -- Belt of Might
		{ id = 16867 }, -- Legplates of Might
		{ id = 16862 }, -- Sabatons of Might
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Armor of Might"], icon = "Ability_Gouge" },
		{ id = 47240 }, -- Crown of Might
		{ id = 47241 }, -- Pauldrons of Might
		{ id = 47242 }, -- Chestplate of Might
		{ id = 47243 }, -- Bracers of Might
		{ id = 47244 }, -- Gauntlets of Might
		{ id = 47245 }, -- Girdle of Might
		{ id = 47246 }, -- Leggings of Might
		{ id = 47247 }, -- Sabatons of Might
	},
	T1Paladin = {
		{ name = BIS["Lawbringer Armor"], icon = "Spell_Holy_Power" },
		{ id = 16854 }, -- Lawbringer Helm
		{ id = 16856 }, -- Lawbringer Spaulders
		{ id = 16853 }, -- Lawbringer Chestguard
		{ id = 16857 }, -- Lawbringer Bracers
		{ id = 16860 }, -- Lawbringer Gauntlets
		{ id = 16858 }, -- Lawbringer Belt
		{ id = 16855 }, -- Lawbringer Legplates
		{ id = 16859 }, -- Lawbringer Boots
		{},
		{ name = BIS["Lawbringer Battleplate"], icon = "Ability_Defend" },
		{ id = 47000 }, -- Lawbringer Helmet
		{ id = 47001 }, -- Lawbringer Shoulderguards
		{ id = 47002 }, -- Lawbringer Chestguard
		{ id = 47003 }, -- Lawbringer Wristguards
		{ name = BIS["Lawbringer Battlegear"], icon = "Ability_Racial_Avatar" },
		{ id = 47008 }, -- Lawbringer Crown
		{ id = 47009 }, -- Lawbringer Pauldrons
		{ id = 47010 }, -- Lawbringer Chestplate
		{ id = 47011 }, -- Lawbringer Bindings
		{ id = 47012 }, -- Lawbringer Gauntlets
		{ id = 47013 }, -- Lawbringer Girdle
		{ id = 47014 }, -- Lawbringer Leggings
		{ id = 47015 }, -- Lawbringer Sabatons
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 47004 }, -- Lawbringer Handguards
		{ id = 47005 }, -- Lawbringer Waistguard
		{ id = 47006 }, -- Lawbringer Legguards
		{ id = 47007 }, -- Lawbringer Greaves
	},
	T0Mage = {
		{ name = BIS["Magister's Regalia"], icon = "Spell_Frost_IceStorm" },
		{ id = 16686 }, -- Magister's Crown
		{ id = 16689 }, -- Magister's Mantle
		{ id = 16688 }, -- Magister's Robes
		{ id = 16683 }, -- Magister's Bindings
		{ id = 16684 }, -- Magister's Gloves
		{ id = 16685 }, -- Magister's Belt
		{ id = 16687 }, -- Magister's Leggings
		{ id = 16682 }, -- Magister's Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Sorcerer's Regalia"], icon = "Spell_Frost_IceStorm" },
		{ id = 22065 }, -- Sorcerer's Crown
		{ id = 22068 }, -- Sorcerer's Mantle
		{ id = 22069 }, -- Sorcerer's Robes
		{ id = 22063 }, -- Sorcerer's Bindings
		{ id = 22066 }, -- Sorcerer's Gloves
		{ id = 22062 }, -- Sorcerer's Belt
		{ id = 22067 }, -- Sorcerer's Leggings
		{ id = 22064 }, -- Sorcerer's Boots
	},
	T0Priest = {
		{ name = BIS["Vestments of the Devout"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 16693 }, -- Devout Crown
		{ id = 16695 }, -- Devout Mantle
		{ id = 16690 }, -- Devout Robe
		{ id = 16697 }, -- Devout Bracers
		{ id = 16692 }, -- Devout Gloves
		{ id = 16696 }, -- Devout Belt
		{ id = 16694 }, -- Devout Skirt
		{ id = 16691 }, -- Devout Sandals
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Vestments of the Virtuous"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 22080 }, -- Virtuous Crown
		{ id = 22082 }, -- Virtuous Mantle
		{ id = 22083 }, -- Virtuous Robe
		{ id = 22079 }, -- Virtuous Bracers
		{ id = 22081 }, -- Virtuous Gloves
		{ id = 22078 }, -- Virtuous Belt
		{ id = 22085 }, -- Virtuous Skirt
		{ id = 22084 }, -- Virtuous Sandals
	},
	T0Warlock = {
		{ name = BIS["Dreadmist Raiment"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 16698 }, -- Dreadmist Mask
		{ id = 16701 }, -- Dreadmist Mantle
		{ id = 16700 }, -- Dreadmist Robe
		{ id = 16703 }, -- Dreadmist Bracers
		{ id = 16705 }, -- Dreadmist Wraps
		{ id = 16702 }, -- Dreadmist Belt
		{ id = 16699 }, -- Dreadmist Leggings
		{ id = 16704 }, -- Dreadmist Sandals
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Deathmist Raiment"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 22074 }, -- Deathmist Mask
		{ id = 22073 }, -- Deathmist Mantle
		{ id = 22075 }, -- Deathmist Robe
		{ id = 22071 }, -- Deathmist Bracers
		{ id = 22077 }, -- Deathmist Wraps
		{ id = 22070 }, -- Deathmist Belt
		{ id = 22072 }, -- Deathmist Leggings
		{ id = 22076 }, -- Deathmist Sandals
	},
	T0Rogue = {
		{ name = BIS["Shadowcraft Armor"], icon = "Ability_BackStab" },
		{ id = 16707 }, -- Shadowcraft Cap
		{ id = 16708 }, -- Shadowcraft Spaulders
		{ id = 16721 }, -- Shadowcraft Tunic
		{ id = 16710 }, -- Shadowcraft Bracers
		{ id = 16712 }, -- Shadowcraft Gloves
		{ id = 16713 }, -- Shadowcraft Belt
		{ id = 16709 }, -- Shadowcraft Pants
		{ id = 16711 }, -- Shadowcraft Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Darkmantle Armor"], icon = "Ability_BackStab" },
		{ id = 22005 }, -- Darkmantle Cap
		{ id = 22008 }, -- Darkmantle Spaulders
		{ id = 22009 }, -- Darkmantle Tunic
		{ id = 22004 }, -- Darkmantle Bracers
		{ id = 22006 }, -- Darkmantle Gloves
		{ id = 22002 }, -- Darkmantle Belt
		{ id = 22007 }, -- Darkmantle Pants
		{ id = 22003 }, -- Darkmantle Boots
	},
	T0Druid = {
		{ name = BIS["Wildheart Raiment"], icon = "Spell_Nature_Regeneration" },
		{ id = 16720 }, -- Wildheart Cowl
		{ id = 16718 }, -- Wildheart Spaulders
		{ id = 16706 }, -- Wildheart Vest
		{ id = 16714 }, -- Wildheart Bracers
		{ id = 16717 }, -- Wildheart Gloves
		{ id = 16716 }, -- Wildheart Belt
		{ id = 16719 }, -- Wildheart Kilt
		{ id = 16715 }, -- Wildheart Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Feralheart Raiment"], icon = "Spell_Nature_Regeneration" },
		{ id = 22109 }, -- Feralheart Cowl
		{ id = 22112 }, -- Feralheart Spaulders
		{ id = 22113 }, -- Feralheart Vest
		{ id = 22108 }, -- Feralheart Bracers
		{ id = 22110 }, -- Feralheart Gloves
		{ id = 22106 }, -- Feralheart Belt
		{ id = 22111 }, -- Feralheart Kilt
		{ id = 22107 }, -- Feralheart Boots
	},
	T0Hunter = {
		{ name = BIS["Beaststalker Armor"], icon = "Ability_Hunter_RunningShot" },
		{ id = 16677 }, -- Beaststalker's Cap
		{ id = 16679 }, -- Beaststalker's Mantle
		{ id = 16674 }, -- Beaststalker's Tunic
		{ id = 16681 }, -- Beaststalker's Bindings
		{ id = 16676 }, -- Beaststalker's Gloves
		{ id = 16680 }, -- Beaststalker's Belt
		{ id = 16678 }, -- Beaststalker's Pants
		{ id = 16675 }, -- Beaststalker's Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Beastmaster Armor"], icon = "Ability_Hunter_RunningShot" },
		{ id = 22013 }, -- Beastmaster's Cap
		{ id = 22016 }, -- Beastmaster's Mantle
		{ id = 22060 }, -- Beastmaster's Tunic
		{ id = 22011 }, -- Beastmaster's Bindings
		{ id = 22015 }, -- Beastmaster's Gloves
		{ id = 22010 }, -- Beastmaster's Belt
		{ id = 22017 }, -- Beastmaster's Pants
		{ id = 22061 }, -- Beastmaster's Boots
	},
	T0Shaman = {
		{ name = BIS["The Elements"], icon = "Spell_FireResistanceTotem_01" },
		{ id = 16667 }, -- Coif of Elements
		{ id = 16669 }, -- Pauldrons of Elements
		{ id = 16666 }, -- Vest of Elements
		{ id = 16671 }, -- Bindings of Elements
		{ id = 16672 }, -- Gauntlets of Elements
		{ id = 16673 }, -- Cord of Elements
		{ id = 16668 }, -- Kilt of Elements
		{ id = 16670 }, -- Boots of Elements
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["The Five Thunders"], icon = "Spell_FireResistanceTotem_01" },
		{ id = 22097 }, -- Coif of The Five Thunders
		{ id = 22101 }, -- Pauldrons of The Five Thunders
		{ id = 22102 }, -- Vest of The Five Thunders
		{ id = 22095 }, -- Bindings of The Five Thunders
		{ id = 22099 }, -- Gauntlets of The Five Thunders
		{ id = 22098 }, -- Cord of The Five Thunders
		{ id = 22100 }, -- Kilt of The Five Thunders
		{ id = 22096 }, -- Boots of the The Five Thunders
	},
	T0Warrior = {
		{ name = BIS["Battlegear of Valor"], icon = "INV_Shield_05" },
		{ id = 16731 }, -- Helm of Valor
		{ id = 16733 }, -- Spaulders of Valor
		{ id = 16730 }, -- Breastplate of Valor
		{ id = 16735 }, -- Bracers of Valor
		{ id = 16737 }, -- Gauntlets of Valor
		{ id = 16736 }, -- Belt of Valor
		{ id = 16732 }, -- Legplates of Valor
		{ id = 16734 }, -- Boots of Valor
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Battlegear of Heroism"], icon = "INV_Shield_05" },
		{ id = 21999 }, -- Helm of Heroism
		{ id = 22001 }, -- Spaulders of Heroism
		{ id = 21997 }, -- Breastplate of Heroism
		{ id = 21996 }, -- Bracers of Heroism
		{ id = 21998 }, -- Gauntlets of Heroism
		{ id = 21994 }, -- Belt of Heroism
		{ id = 22000 }, -- Legplates of Heroism
		{ id = 21995 }, -- Boots of Heroism
	},
	T0Paladin = {
		{ name = BIS["Lightforge Armor"], icon = "Spell_Holy_SealOfMight" },
		{ id = 16727 }, -- Lightforge Helm
		{ id = 16729 }, -- Lightforge Spaulders
		{ id = 16726 }, -- Lightforge Breastplate
		{ id = 16722 }, -- Lightforge Bracers
		{ id = 16724 }, -- Lightforge Gauntlets
		{ id = 16723 }, -- Lightforge Belt
		{ id = 16728 }, -- Lightforge Legplates
		{ id = 16725 }, -- Lightforge Boots
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BIS["Soulforge Armor"], icon = "Spell_Holy_SealOfMight" },
		{ id = 22091 }, -- Soulforge Helm
		{ id = 22093 }, -- Soulforge Spaulders
		{ id = 22089 }, -- Soulforge Breastplate
		{ id = 22088 }, -- Soulforge Bracers
		{ id = 22090 }, -- Soulforge Gauntlets
		{ id = 22086 }, -- Soulforge Belt
		{ id = 22092 }, -- Soulforge Legplates
		{ id = 22087 }, -- Soulforge Boots
	},
	ZGMage = {
		{ name = BIS["Illusionist's Attire"], icon = "Spell_Arcane_Blast" },
		{ id = 19959 }, -- Hazza'rah's Charm of Magic
		{ id = 19601 }, -- Jewel of Kajaro
		{ id = 20034 }, -- Zandalar Illusionist's Robe
		{ id = 19845 }, -- Zandalar Illusionist's Mantle
		{ id = 19846 }, -- Zandalar Illusionist's Wraps
	},
	ZGWarlock = {
		{ name = BIS["Demoniac's Threads"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 19957 }, -- Hazza'rah's Charm of Destruction
		{ id = 19605 }, -- Kezan's Unstoppable Taint
		{ id = 20033 }, -- Zandalar Demoniac's Robe
		{ id = 19849 }, -- Zandalar Demoniac's Mantle
		{ id = 19848 }, -- Zandalar Demoniac's Wraps
	},
	ZGPriest = {
		{ name = BIS["Confessor's Raiment"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 19958 }, -- Hazza'rah's Charm of Healing
		{ id = 19594 }, -- The All-Seeing Eye of Zuldazar
		{ id = 19841 }, -- Zandalar Confessor's Mantle
		{ id = 19842 }, -- Zandalar Confessor's Bindings
		{ id = 19843 }, -- Zandalar Confessor's Wraps
	},
	ZGRogue = {
		{ name = BIS["Madcap's Outfit"], icon = "Ability_BackStab" },
		{ id = 19954 }, -- Renataki's Charm of Trickery
		{ id = 19617 }, -- Zandalarian Shadow Mastery Talisman
		{ id = 19834 }, -- Zandalar Madcap's Tunic
		{ id = 19835 }, -- Zandalar Madcap's Mantle
		{ id = 19836 }, -- Zandalar Madcap's Bracers
	},
	ZGDruid = {
		{ name = BIS["Haruspex's Garb"], icon = "Spell_Nature_Regeneration" },
		{ id = 19955 }, -- Wushoolay's Charm of Nature
		{ id = 19613 }, -- Pristine Enchanted South Seas Kelp
		{ id = 19838 }, -- Zandalar Haruspex's Tunic
		{ id = 19839 }, -- Zandalar Haruspex's Belt
		{ id = 19840 }, -- Zandalar Haruspex's Bracers
	},
	ZGHunter = {
		{ name = BIS["Predator's Armor"], icon = "Ability_Hunter_RunningShot" },
		{ id = 19953 }, -- Renataki's Charm of Beasts
		{ id = 19621 }, -- Maelstrom's Wrath
		{ id = 19831 }, -- Zandalar Predator's Mantle
		{ id = 19832 }, -- Zandalar Predator's Belt
		{ id = 19833 }, -- Zandalar Predator's Bracers
	},
	ZGShaman = {
		{ name = BIS["Augur's Regalia"], icon = "Spell_FireResistanceTotem_01" },
		{ id = 19956 }, -- Wushoolay's Charm of Spirits
		{ id = 19609 }, -- Unmarred Vision of Voodress
		{ id = 19828 }, -- Zandalar Augur's Hauberk
		{ id = 19829 }, -- Zandalar Augur's Belt
		{ id = 19830 }, -- Zandalar Augur's Bracers
	},
	ZGWarrior = {
		{ name = BIS["Vindicator's Battlegear"], icon = "INV_Shield_05" },
		{ id = 19951 }, -- Gri'lek's Charm of Might
		{ id = 19577 }, -- Rage of Mugamba
		{ id = 19822 }, -- Zandalar Vindicator's Breastplate
		{ id = 19823 }, -- Zandalar Vindicator's Belt
		{ id = 19824 }, -- Zandalar Vindicator's Armguards
	},
	ZGPaladin = {
		{ name = BIS["Freethinker's Armor"], icon = "Spell_Holy_SealOfMight" },
		{ id = 19952 }, -- Gri'lek's Charm of Valor
		{ id = 19588 }, -- Hero's Brand
		{ id = 19825 }, -- Zandalar Freethinker's Breastplate
		{ id = 19826 }, -- Zandalar Freethinker's Belt
		{ id = 19827 }, -- Zandalar Freethinker's Armguards
	},
	AQ20Mage = {
		{ name = BIS["Trappings of Vaulted Secrets"], icon = "Spell_Frost_IceStorm" },
		{ id = 21413 }, -- Blade of Vaulted Secrets
		{ id = 21415 }, -- Drape of Vaulted Secrets
		{ id = 21414 }, -- Band of Vaulted Secrets
	},
	AQ20Warlock = {
		{ name = BIS["Implements of Unspoken Names"], icon = "Spell_Shadow_CurseOfTounges" },
		{ id = 21416 }, -- Kris of Unspoken Names
		{ id = 21418 }, -- Shroud of Unspoken Names
		{ id = 21417 }, -- Ring of Unspoken Names
	},
	AQ20Priest = {
		{ name = BIS["Finery of Infinite Wisdom"], icon = "Spell_Shadow_Shadowform" },
		{ id = 21410 }, -- Gavel of Infinite Wisdom
		{ id = 21412 }, -- Shroud of Infinite Wisdom
		{ id = 21411 }, -- Ring of Infinite Wisdom
	},
	AQ20Rogue = {
		{ name = BIS["Emblems of Veiled Shadows"], icon = "Ability_BackStab" },
		{ id = 21404 }, -- Dagger of Veiled Shadows
		{ id = 21406 }, -- Cloak of Veiled Shadows
		{ id = 21405 }, -- Band of Veiled Shadows
	},
	AQ20Druid = {
		{ name = BIS["Symbols of Unending Life"], icon = "Ability_Druid_Berserk" },
		{ id = 21407 }, -- Mace of Unending Life
		{ id = 21409 }, -- Cloak of Unending Life
		{ id = 21408 }, -- Band of Unending Life
	},
	AQ20Hunter = {
		{ name = BIS["Trappings of the Unseen Path"], icon = "Ability_Hunter_RunningShot" },
		{ id = 21401 }, -- Scythe of the Unseen Path
		{ id = 21403 }, -- Cloak of the Unseen Path
		{ id = 21402 }, -- Signet of the Unseen Path
	},
	AQ20Paladin = {
		{ name = BIS["Battlegear of Eternal Justice"], icon = "Ability_Racial_Avatar" },
		{ id = 21395 }, -- Blade of Eternal Justice
		{ id = 21397 }, -- Cape of Eternal Justice
		{ id = 21396 }, -- Ring of Eternal Justice
	},
	AQ20Shaman = {
		{ name = BIS["Gift of the Gathering Storm"], icon = "Spell_Nature_Earthquake" },
		{ id = 21398 }, -- Hammer of the Gathering Storm
		{ id = 21400 }, -- Cloak of the Gathering Storm
		{ id = 21399 }, -- Ring of the Gathering Storm
	},
	AQ20Warrior = {
		{ name = BIS["Battlegear of Unyielding Strength"], icon = "INV_Shield_05" },
		{ id = 21392 }, -- Sickle of Unyielding Strength
		{ id = 21394 }, -- Drape of Unyielding Strength
		{ id = 21393 }, -- Signet of Unyielding Strength
	},
	AQ40Mage = {
		{ name = BIS["Enigma Regalia"], icon = "Spell_Frost_IceStorm" }, --Mage
		{ id = 21347 }, -- Enigma Circlet
		{ id = 21345 }, -- Enigma Shoulderpads
		{ id = 21343 }, -- Enigma Robes
		{ id = 21346 }, -- Enigma Leggings
		{ id = 21344 }, -- Enigma Boots
		{},
		{ name = BIS["Enigma Vestments"], icon = "Spell_Arcane_Blast" }, --Mage
		{ id = 47094 }, -- Enigma Crown
		{ id = 47095 }, -- Enigma Epaulets
		{ id = 47096 }, -- Enigma Vestments
		{ id = 47097 }, -- Enigma Trousers
		{ id = 47098 }, -- Enigma Slippers
	},
	AQ40Priest = {
		{ name = BIS["Regalia of the Oracle"], icon = "Spell_Holy_PowerWordShield" },
		{ id = 21348 }, -- Tiara of the Oracle
		{ id = 21350 }, -- Mantle of the Oracle
		{ id = 21351 }, -- Vestments of the Oracle
		{ id = 21352 }, -- Trousers of the Oracle
		{ id = 21349 }, -- Footwraps of the Oracle
		{},
		{ name = BIS["Vestments of the Oracle"], icon = "Spell_Holy_HolyNova" },
		{ id = 47214 }, -- Coronet of the Oracle
		{ id = 47215 }, -- Spaulders of the Oracle
		{ id = 47216 }, -- Vestments of the Oracle
		{ id = 47217 }, -- Trousers of the Oracle
		{ id = 47218 }, -- Treads of the Oracle
		--1.18 deleted
		--[[ { id = 70732 }, -- Coronet of the Oracle
		{ id = 70733 }, -- Shoulderpads of the Oracle
		{ id = 70734 }, -- Raiments of the Oracle
		{ id = 70735 }, -- Pants of the Oracle
		{ id = 70736 }, -- Sandals of the Oracle ]]
	},
	AQ40Warlock = {
		{ name = BIS["Doomcaller's Raiment"], icon = "Spell_Shadow_CurseOfTounges" }, --Warlock
		{ id = 21337 }, -- Doomcaller's Circlet
		{ id = 21335 }, -- Doomcaller's Mantle
		{ id = 21334 }, -- Doomcaller's Robes
		{ id = 21336 }, -- Doomcaller's Trousers
		{ id = 21338 }, -- Doomcaller's Footwraps
		{},
		{ name = BIS["Doomcaller's Attire"], icon = "Spell_Shadow_Requiem" }, --afflic
		{ id = 47292 }, -- Doomcaller's Crown
		{ id = 47293 }, -- Doomcaller's Spaulders
		{ id = 47294 }, -- Doomcaller's Raiments
		{ id = 47295 }, -- Doomcaller's Leggings
		{ id = 47296 }, -- Doomcaller's Slippers
	},
	AQ40Rogue = {
		{ name = BIS["Deathdealer's Embrace"], icon = "Ability_BackStab" }, --Rogue
		{ id = 21364 }, -- Deathdealer's Vest
		{ id = 21360 }, -- Deathdealer's Helm
		{ id = 21362 }, -- Deathdealer's Leggings
		{ id = 21361 }, -- Deathdealer's Spaulders
		{ id = 21359 }, -- Deathdealer's Boots
	},
	AQ40Druid = {
		{ name = BIS["Genesis Regalia"], icon = "Spell_Nature_ForceOfNature" }, --balance
		{ id = 21353 }, -- Genesis Helm
		{ id = 21354 }, -- Genesis Shoulderpads
		{ id = 21357 }, -- Genesis Vest
		{ id = 21356 }, -- Genesis Trousers
		{ id = 21355 }, -- Genesis Slippers
		{},
		{ name = BIS["Genesis Raiment"], icon = "Ability_Druid_TreeofLife" }, --restoration
		{ id = 47362 }, -- Genesis Helm
		{ id = 47363 }, -- Genesis Spaulders
		{ id = 47364 }, -- Genesis Vestments
		{ id = 47365 }, -- Genesis Leggings
		{ id = 47366 }, -- Genesis Boots
		{},
		{},
		{ name = BIS["Genesis Harness"], icon = "Ability_Druid_CatForm" }, --cat
		{ id = 47367 }, -- Genesis Helmet
		{ id = 47368 }, -- Genesis Shoulderpads
		{ id = 47369 }, -- Genesis Raiments
		{ id = 47370 }, -- Genesis Pants
		{ id = 47371 }, -- Genesis Treads
	},
	AQ40Shaman = {
		{ name = BIS["Stormcaller's Garb"], icon = "Spell_Nature_Earthquake" }, --elemental
		{ id = 21374 }, -- Stormcaller's Hauberk
		{ id = 21372 }, -- Stormcaller's Diadem
		{ id = 21375 }, -- Stormcaller's Legplates
		{ id = 21376 }, -- Stormcaller's Epaulets
		{ id = 21373 }, -- Stormcaller's Greaves
		{},
		{ name = BIS["Stormcaller's Battlegear"], icon = "Spell_Nature_SpiritArmor" }, --tank
		{ id = 47152 }, -- Stormcaller's Crown
		{ id = 47153 }, -- Stormcaller's Pauldrons
		{ id = 47154 }, -- Stormcaller's Breastplate
		{ id = 47155 }, -- Stormcaller's Leggings
		{ id = 47156 }, -- Stormcaller's Sabatons
		{},
		{},
		{ name = BIS["The Stormcaller"], icon = "Spell_Shaman_SpiritLink" }, --restoration
		{ id = 47157 }, -- Stormcaller's Helmet
		{ id = 47158 }, -- Stormcaller's Spaulders
		{ id = 47159 }, -- Stormcaller's Chestpiece
		{ id = 47160 }, -- Stormcaller's Pants
		{ id = 47161 }, -- Stormcaller's Boots
	},
	AQ40Hunter = {
		{ name = BIS["Striker's Garb"], icon = "Ability_Hunter_RunningShot" }, --Hunter
		{ id = 21370 }, -- Striker's Hauberk
		{ id = 21366 }, -- Striker's Diadem
		{ id = 21368 }, -- Striker's Leggings
		{ id = 21367 }, -- Striker's Pauldrons
		{ id = 21365 }, -- Striker's Footguards
	},
	AQ40Warrior = {
		{ name = BIS["Conqueror's Battlegear"], icon = "INV_Shield_05" }, --Warrior
		{ id = 21331 }, -- Conqueror's Breastplate
		{ id = 21329 }, -- Conqueror's Crown
		{ id = 21332 }, -- Conqueror's Legguards
		{ id = 21330 }, -- Conqueror's Spaulders
		{ id = 21333 }, -- Conqueror's Greaves
		--1.18 deleted
		--[[
		{ id = 47256 }, -- Conqueror's Crown
		{ id = 47257 }, -- Conqueror's Pauldrons
		{ id = 47258 }, -- Conqueror's Chestplate
		{ id = 47259 }, -- Conqueror's Leggings
		{ id = 47260 }, -- Conqueror's Sabatons
		]]
	},
	AQ40Paladin = {
		{ name = BIS["Avenger's Battlegear"], icon = "Ability_Racial_Avatar" },
		{ id = 21389 }, -- Avenger's Chestplate
		{ id = 21387 }, -- Avenger's Crown
		{ id = 21390 }, -- Avenger's Leggings
		{ id = 21391 }, -- Avenger's Pauldrons
		{ id = 21388 }, -- Avenger's Sabatons
		{},
		{ name = BIS["Avenger's Battleplate"], icon = "Ability_Defend" },
		{ id = 47032 }, -- Avenger's Helmet
		{ id = 47033 }, -- Avenger's Shoulderguards
		{ id = 47034 }, -- Avenger's Chestguard
		{ id = 47035 }, -- Avenger's Legguards
		{ id = 47036 }, -- Avenger's Greaves
		{},
		{},
		{ name = BIS["Avenger's Armor"], icon = "Spell_Holy_Power" },
		{ id = 47037 }, -- Avenger's Helm
		{ id = 47038 }, -- Avenger's Spaulders
		{ id = 47039 }, -- Avenger's Breastplate
		{ id = 47040 }, -- Avenger's Legplates
		{ id = 47041 }, -- Avenger's Boots
	},
	Artifacts = {
		{ id = 18582 }, -- The Twin Blades of Azzinoth
		{ id = 18583 }, -- Warglaive of Azzinoth (Right)
		{ id = 18584 }, -- Warglaive of Azzinoth (Left)
	},
	Legendaries = {
		{ id = 19019 }, -- Thunderfury, Blessed Blade of the Windseeker
		{ id = 22736 }, -- Andonisus, Reaper of Souls
		{ id = 17182 }, -- Sulfuras, Hand of Ragnaros
		{ id = 21176 }, -- Black Qiraji Resonating Crystal
		{},
		{ id = 17204 }, -- Eye of Sulfuras
		{ id = 18564 }, -- Bindings of the Windseeker
		{ id = 18563 }, -- Bindings of the Windseeker
		{ id = 17782 }, -- Talisman of Binding Shard
		{},
		{ id = 61184, container={55505} }, -- The Scythe of Elune, The Scythe of Elune
		{},
		{ id = 61733, container = {61732} }, --Formula: Eternal Dreamstone Shard, Eternal Dreamstone Shard 
		{},
		{ id = 22631 }, -- Atiesh, Greatstaff of the Guardian
		{ id = 22589 }, -- Atiesh, Greatstaff of the Guardian
		{ id = 22630 }, -- Atiesh, Greatstaff of the Guardian
		{ id = 22632 }, -- Atiesh, Greatstaff of the Guardian
		{},
		{ id = 22726 }, -- Splinter of Atiesh
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 13262 }, -- Ashbringer
	},
	RareMounts = {
		{ id = 21176 }, -- Black Qiraji Resonating Crystal
		{},
		{ id = 13335 }, -- Deathcharger's Reins
		{ id = 19872 }, -- Armored Razzashi Raptor
		{ id = 19902 }, -- Swift Zulian Tiger
		{ id = 13086 }, -- Reins of the Winterspring Frostsaber
		{},
		{ id = 21218 }, -- Blue Qiraji Resonating Crystal
		{ id = 21323 }, -- Green Qiraji Resonating Crystal
		{ id = 21324 }, -- Yellow Qiraji Resonating Crystal
		{ id = 21321 }, -- Red Qiraji Resonating Crystal
		{},
		{ id = 23720 }, -- Swift Riding Turtle
	},
	OldMounts = {
		{ name = BF["Alliance"], icon = "INV_BannerPVP_02" },
		{},
		{ id = 12302 }, -- Ancient Frostsaber
		{ id = 12303 }, -- Black Zulian Panter
		{ id = 13327 }, -- Icy Blue Mechanostrider Mod A
		{ id = 13326 }, -- White Mechanostrider Mod A
		{ id = 13328 }, -- Ancient Black Ram
		{ id = 13329 }, -- Frost Ram
		{ id = 12354 }, -- Palomino Stallion
		{ id = 12353 }, -- White Stallion
		{},
		{ id = 18768 }, -- Armored Dawnsaber
		{ id = 12327 }, -- Golden Leopard
		{ id = 12325 }, -- Spotted Leopard
		{ id = 12326 }, -- Tawny Leopard
		{ name = BF["Horde"], icon = "INV_BannerPVP_01" },
		{},
		{ id = 12351 }, -- Ancient Arctic Wolf
		{ id = 15292 }, -- Ancient Green Kodo
		{ id = 15293 }, -- Ancient Teal Kodo
	},
	PvPMountsSets = {
		{ name = BF["Alliance"], icon = "INV_BannerPVP_02" },
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
		{ name = BF["Horde"], icon = "INV_BannerPVP_01" },
		{ id = 19029 }, -- Horn of the Frostwolf Howler
		{},
		{ id = 18245 }, -- Horn of the Black War Wolf
		{ id = 18247 }, -- Black War Kodo
		{ id = 18246 }, -- Whistle of the Black War Raptor
		{ id = 18248 }, -- Red Skeletal Warhorse
	},
	Tabards = {
		{ id = 15196 }, -- Private's Tabard
		{ id = 15198 }, -- Knight's Colors
		{ id = 19506 }, -- Silverwing Battle Tabard
		{ id = 20132 }, -- Arathor Battle Tabard
		{ id = 19032 }, -- Stormpike Battle Tabard
		{},
		{ id = 5976 }, -- Guild Tabard
		{ id = 19160 }, -- Contest Winner's Tabard
		{ id = 80187 }, -- Contest Winner's Tabard
		{ id = 61369 }, -- Ravenshire Tabard
		{ id = 22999 }, -- Tabard of the Agent Dawn
		{ id = 23192 }, -- Tabard of the Scarlet Crusade
		{ id = 23705 }, -- Tabard of Flame
		{ id = 61368 }, -- Greymane Tabard
		{ id = 23709 }, -- Tabard of Frost *15
		{ id = 15197 }, -- Scout's Tabard
		{ id = 15199 }, -- Stone Guard's Herald
		{ id = 19505 }, -- Warsong Battle Tabard
		{ id = 20131 }, -- Battle Tabard of the Defilers
		{ id = 19031 }, -- Frostwolf Battle Tabard
	},
	WorldBluesHead = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 2721 }, -- Holy Shroud
		{ id = 13102 }, -- Cassandra's Grace
		{},
		{},
		{},
		{},
		{ name = BS["Mail"], icon = "INV_Chest_Chain_05" },
		{ id = 13127 }, -- Frostreaver Crown
		{ id = 13128 }, -- High Bergg Helm
		{},
		{},
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 3020 }, -- Enduring Cap
		{ id = 9375 }, -- Expert Goldminer's Helmet
		{ id = 13112 }, -- Winged Helm
		{ id = 13113 }, -- Feathermoon Headdress
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13073 }, -- Mugthol's Helm
	},
	WorldBluesNeck = {
		{ id = 13087 }, -- River Pride Choker
		{ id = 13084 }, -- Kaleidoscope Chain
		{ id = 13088 }, -- Gazlowe's Charm
		{ id = 1714 }, -- Necklace of Calisea
		{ id = 13085 }, -- Horizon Choker
		{ id = 13091 }, -- Medallion of Grand Marshal Morris
		{ id = 13002 }, -- Lady Alizabeth's Pendant
		{ id = 20695 }, -- Abyssal War Beads
	},
	WorldBluesShoulder = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 12998 }, -- Magician's Mantle
		{ id = 13103 }, -- Pads of the Venom Spider
		{ id = 13013 }, -- Elder Wizard's Mantle
		{},
		{},
		{},
		{ name = BS["Mail"], icon = "INV_Chest_Chain_05" },
		{ id = 13131 }, -- Sparkleshell Mantle
		{ id = 13132 }, -- Skeletal Shoulders
		{ id = 13133 }, -- Drakesfire Epaulets
		{},
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 2278 }, -- Forest Tracker Epaulets
		{ id = 13115 }, -- Sheepshear Mantle
		{ id = 13116 }, -- Spaulders of the Unseen
		{},
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13066 }, -- Wyrmslayer Spaulders
	},
	WorldBluesBack = {
		{ id = 12979 }, -- Firebane Cloak
		{ id = 2059 }, -- Sentry Cloak
		{ id = 13005 }, -- Amy's Blanket
		{ id = 13108 }, -- Tigerstrike Mantle
		{ id = 5257 }, -- Dark Hooded Cape
		{ id = 13121 }, -- Wing of the Whelpling
		{ id = 13109 }, -- Blackflame Cape
		{ id = 13122 }, -- Dark Phantom Cape
		{ id = 13007 }, -- Mageflame Cloak
		{ id = 20697 }, -- Crystalline Threaded Cape
	},
	WorldBluesChest = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 2800 }, -- Black Velvet Robes
		{ id = 1716 }, -- Robe of the Magi
		{ id = 9434 }, -- Elemental Raiment
		{ id = 17050 }, -- Chan's Imperial Robes
		{},
		{},
		{ name = BS["Mail"], icon = "INV_Chest_Chain_05" },
		{ id = 1717 }, -- Double Link Tunic
		{ id = 1715 }, -- Polished Jazeraint Armor
		{ id = 13123 }, -- Dreamwalker Armor
		{},
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 12988 }, -- Starsight Tunic
		{ id = 13110 }, -- Wolffear Harness
		{ id = 13009 }, -- Cow King's Hide
		{},
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13067 }, -- Hydralick Armor
	},
	WorldBluesWrist = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 13106 }, -- Glowing Magical Bracelets
		{ id = 9433 }, -- Forgotten Wraps
		{ id = 13107 }, -- Magiskull Cuffs
		{},
		{},
		{},
		{ name = BS["Mail"], icon = "INV_Chest_Chain_05" },
		{ id = 13012 }, -- Yorgen Bracers
		{ id = 13199 }, -- Crushridge Bindings
		{ id = 13135 }, -- Lordly Armguards
		{},
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 12999 }, -- Drakewing Bands
		{ id = 13119 }, -- Enchanted Kodo Bracers
		{ id = 13120 }, -- Deepfury Bracers
		{},
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13076 }, -- Giantslayer Bracers
	},
	WorldBluesHands = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 12977 }, -- Magefist Gloves
		{ id = 9395 }, -- Gloves of Old
		{},
		{},
		{},
		{},
		{ name = BS["Mail"], icon = "INV_Chest_Chain_05" },
		{ id = 12994 }, -- Thorbia's Gauntlets
		{ id = 9435 }, -- Reticulated Bone Gauntlets
		{ id = 13126 }, -- Battlecaller Gauntlets
		{},
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 720 }, -- Brawler Gloves
		{ id = 2564 }, -- Elven Spirit Claws
		{},
		{},
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13071 }, -- Plated Fist of Hakoo
		{ id = 13072 }, -- Stonegrip Gauntlets
	},
	WorldBluesWaist = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 2911 }, -- Keller's Girdle
		{ id = 13105 }, -- Sutarn's Ring
		{ id = 13144 }, -- Serenity Belt
		{},
		{},
		{},
		{ name = BS["Mail"], icon = "Waist" },
		{ id = 12978 }, -- Stormbringer Belt
		{ id = 9405 }, -- Girdle of Golem Strength
		{ id = 13134 }, -- Belt of the Gladiator
		{},
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 13011 }, -- Silver-lined Belt
		{ id = 13117 }, -- Ogron's Sash
		{ id = 13118 }, -- Serpentine Sash
		{},
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13145 }, -- Enormous Ogre Belt
		{ id = 13077 }, -- Girdle of Uther
	},
	WorldBluesLegs = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 12987 }, -- Darkweave Breeches
		{ id = 2277 }, -- Necromancer Leggings
		{ id = 13008 }, -- Dalewind Trousers
		{},
		{},
		{},
		{ name = BS["Mail"], icon = "INV_Chest_Chain_05" },
		{ id = 13010 }, -- Dreamsinger Legguards
		{ id = 13129 }, -- Firemane Leggings
		{ id = 13130 }, -- Windrunner Legguards
		{},
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 13114 }, -- Troll's Bane Leggings
		{ id = 1718 }, -- Basilisk Hide Pants
		{ id = 9402 }, -- Earthborn Kilt
		{},
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13074 }, -- Golem Shard Leggings
		{ id = 13075 }, -- Direwing Legguards
	},
	WorldBluesFeet = {
		{ name = BS["Cloth"], icon = "INV_Chest_Cloth_21" },
		{ id = 13099 }, -- Moccasins of the White Hare
		{ id = 13100 }, -- Furen's Boots
		{ id = 13101 }, -- Wolfrunner Shoes
		{},
		{},
		{},
		{ name = BS["Mail"], icon = "INV_Chest_Chain_05" },
		{ id = 12982 }, -- Silver-linked Footguards
		{ id = 13124 }, -- Ravasaur Scale Boots
		{ id = 1678 }, -- Black Ogre Kickers
		{ id = 13125 }, -- Elven Chain Boots
		{},
		{},
		{},
		{ name = BS["Leather"], icon = "INV_Chest_Leather_09" },
		{ id = 1121 }, -- Feet of the Lynx
		{ id = 2276 }, -- Swampwalker Boots
		{ id = 13111 }, -- Sandals of the Insurgent
		{},
		{},
		{},
		{ name = BS["Plate"], icon = "INV_Chest_Plate02" },
		{ id = 13068 }, -- Obsidian Greaves
		{ id = 13070 }, -- Sapphiron's Scale Boots
	},
	WorldBluesRing = {
		{ id = 6332 }, -- Black Pearl Ring
		{ id = 12985 }, -- Ring of Defense
		{ id = 12996 }, -- Band of Purification
		{ id = 13097 }, -- Thunderbrow Ring
		{ id = 13094 }, -- The Queen's Jewel
		{ id = 2951 }, -- Ring of the Underwood
		{ id = 13093 }, -- Blush Ember Ring
		{ id = 13095 }, -- Assault Band
		{ id = 5266 }, -- Eye of Adaegus
		{ id = 13096 }, -- Band of the Hierophant
		{ id = 13001 }, -- Maiden's Circle
		{ id = 20721 }, -- Band of the Cultist
	},
	WorldBluesTrinket = {
		{ id = 2802 }, -- Blazing Emblem
		{ id = 1713 }, -- Ankh of Life
		{ id = 7734 }, -- Six Demon Bag
		{ id = 11302 }, -- Uther's Strength
		{ id = 1973 }, -- Orb of Deception
	},
	WorldBluesWand = {
		{ id = 12984 }, -- Skycaller
		{ id = 13062 }, -- Thunderwood
		{ id = 13063 }, -- Starfaller
		{ id = 13064 }, -- Jaina's Firestarter
		{ id = 13065 }, -- Wand of Allistarj
		{ id = 13004 }, -- Torch of Austen
	},
	WorldBluesHeldInOffhand = {
		{ id = 5183 }, -- Pulsating Hydra Heart
		{ id = 2879 }, -- Antipodean Rod
		{ id = 13031 }, -- Orb of Mistmantle
		{ id = 2565 }, -- Rod of Molten Fire
		{ id = 13029 }, -- Umbral Crystal
		{ id = 13030 }, -- Basilisk Bone
		{ id = 4696 }, -- Lapidis Tankard of Tidesippe
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = BC["Druid"], icon = "Spell_Nature_Regeneration" },
		{ id = 23197 }, -- Idol of the Moon
		{},
		{},
		{ name = BC["Paladin"], icon = "Spell_Holy_SealOfMight" },
		{ id = 23203 }, -- Libram of Fervor
		{},
		{},
		{ name = BC["Shaman"], icon = "Spell_FireResistanceTotem_01" },
		{ id = 23199 }, -- Totem of the Storm
	},
	WorldBlues1HAxes = {
		{ id = 12990 }, -- Razor's Edge
		{ id = 2878 }, -- Bearded Boneaxe
		{ id = 934 }, -- Stalvan's Reaper
		{ id = 9378 }, -- Shovelphlange's Mining Axe
		{ id = 1602 }, -- Sickle Axe
		{ id = 2815 }, -- Curve-bladed Ripper
		{ id = 13014 }, -- Axe of Rin'ji
		{ id = 13015 }, -- Serathil
	},
	WorldBlues1HMaces = {
		{ id = 2256 }, -- Skeletal Club
		{ id = 2194 }, -- Diamond Hammer
		{ id = 13024 }, -- Beazel's Basher
		{ id = 13048 }, -- Looming Gavel
		{ id = 13025 }, -- Deadwood Sledge
		{ id = 936 }, -- Midnight Mace
		{ id = 13026 }, -- Heaven's Light
		{ id = 9359 }, -- Wirt's Third Leg
		{ id = 4090 }, -- Mug O' Hurt
		{ id = 17055 }, -- Changuk Smasher
		{ id = 13027 }, -- Bonesnapper
		{ id = 1721 }, -- Viking Warhammer
		{ id = 13028 }, -- Bludstone Hammer
		{ id = 13006 }, -- Mass of McGowan
	},
	WorldBlues1HSwords = {
		{ id = 12976 }, -- Ironpatch Blade
		{ id = 935 }, -- Night Watch Shortsword
		{ id = 2011 }, -- Twisted Sabre
		{ id = 1493 }, -- Heavy Marauder Scimitar
		{ id = 13032 }, -- Sword of Corruption
		{ id = 12974 }, -- The Black Knight
		{ id = 13033 }, -- Zealot Blade
		{ id = 8223 }, -- Blade of the Basilisk
		{ id = 9718 }, -- Reforged Blade of Heroes
		{ id = 1265 }, -- Scorpion Sting
		{ id = 13034 }, -- Speedsteel Rapier
		{ id = 754 }, -- Shortsword of Vengeance
		{ id = 13035 }, -- Serpent Slicer
		{ id = 17054 }, -- Joonho's Mercy
		{},
		{ id = 8190 }, -- Hanzo Sword
		{ id = 13036 }, -- Assassination Blade
		{ id = 6622 }, -- Sword of Zeal
	},
	WorldBlues2HAxes = {
		{ id = 12975 }, -- Prospector Axe
		{ id = 13016 }, -- Killmaim
		{ id = 2299 }, -- Burning War Axe
		{ id = 13017 }, -- Hellslayer Battle Axe
		{ id = 13018 }, -- Executioner's Cleaver
		{ id = 13003 }, -- Lord Alexander's Battle Axe
	},
	WorldBlues2HMaces = {
		{ id = 12983 }, -- Rakzur Club
		{ id = 3203 }, -- Dense Triangle Mace
		{ id = 13045 }, -- Viscous Hammer
		{ id = 6327 }, -- The Pacifier
		{ id = 1722 }, -- Thornstone Sledgehammer
		{ id = 13046 }, -- Blanchard's Stout
		{ id = 13047 }, -- Twig of the World Tree
		{ id = 20696 }, -- Crystal Spiked Maul
	},
	WorldBlues2HSwords = {
		{ id = 12992 }, -- Searing Blade
		{ id = 13041 }, -- Guardian Blade
		{ id = 13049 }, -- Deanship Claymore
		{ id = 2877 }, -- Combatant Claymore
		{ id = 9385 }, -- Archaic Defender
		{ id = 13042 }, -- Sword of the Magistrate
		{ id = 13051 }, -- Witchfury
		{ id = 13043 }, -- Blade of the Titans
		{ id = 13052 }, -- Warmonger
		{ id = 13044 }, -- Demonslayer
		{ id = 16039 }, -- Ta'Kierthan Songblade
		{ id = 13053 }, -- Doombringer
	},
	WorldBluesDaggers = {
		{ id = 2236 }, -- Blackfang
		{ id = 4446 }, -- Blackvenom Blade
		{ id = 4454 }, -- Talon of Vultros
		{ id = 2912 }, -- Claw of the Shadowmancer
		{ id = 6331 }, -- Howling Blade
		{ id = 8006 }, -- The Ziggler
		{ id = 4091 }, -- Widowmaker
		{ id = 6660 }, -- Julie's Dagger
		{ id = 24222 }, -- The Shadowfoot Stabber
		{ id = 5267 }, -- Scarlet Kris
		{ id = 20720 }, -- Dark Whisper Blade
	},
	WorldBluesFistWeapons = {
		{ id = 11603 }, -- Vilerend Slicer
	},
	WorldBluesPolearms = {
		{ id = 12989 }, -- Gargoyle's Bite
		{ id = 13057 }, -- Bloodpike
		{ id = 1726 }, -- Poison-tipped Bone Spear
		{ id = 13054 }, -- Grim Reaper
		{ id = 13058 }, -- Khoo's Point
		{ id = 13055 }, -- Bonechewer
		{ id = 13059 }, -- Stoneraven
		{ id = 13056 }, -- Frenzied Striker
		{ id = 13060 }, -- The Needler
	},
	WorldBluesStaves = {
		{ id = 890 }, -- Twisted Chanter's Staff
		{ id = 791 }, -- Gnarled Ash Staff
		{ id = 937 }, -- Black Duskwood Staff
		{ id = 1720 }, -- Tanglewood Staff
		{ id = 1607 }, -- Soulkeeper
		{ id = 13000 }, -- Staff of Hale Magefire
	},
	WorldBluesBows = {
		{ id = 3021 }, -- Ranger Bow
		{ id = 13019 }, -- Harpyclaw Short Bow
		{ id = 13020 }, -- Skystriker Bow
		{ id = 13021 }, -- Needle Threader
		{ id = 13022 }, -- Gryphonwing Long Bow
		{ id = 13023 }, -- Eaglehorn Long Bow
	},
	WorldBluesCrossbows = {
		{ id = 13037 }, -- Crystalpine Stinger
		{ id = 13038 }, -- Swiftwind
		{ id = 13039 }, -- Skull Splitting Crossbow
		{ id = 13040 }, -- Heartseeking Crossbow
	},
	WorldBluesGuns = {
		{ id = 13136 }, -- Lil Timmy's Peashooter
		{ id = 2098 }, -- Double-barreled Shotgun
		{ id = 13137 }, -- Ironweaver
		{ id = 13138 }, -- The Silencer
		{ id = 13139 }, -- Guttbuster
		{ id = 13146 }, -- Shell Launcher Shotgun
		{ id = 20722 }, -- Crystal Slugthrower
	},
	WorldBluesShields = {
		{ id = 12997 }, -- Redbeard Crest
		{ id = 13079 }, -- Shield of Thorsen
		{ id = 13081 }, -- Skullance Shield
		{ id = 13082 }, -- Mountainside Buckler
		{ id = 1203 }, -- Aegis of Stormwind
		{ id = 13083 }, -- Garrett Family Crest
	},
	WorldEpics = {
		{ name=L["Level"].." 30-39"},
		{ id = 1981 }, -- Icemail Jerkin
		{ id = 867 }, -- Gloves of Holy Might
		{ id = 1980 }, -- Underworld Band
		{},
		{ id = 868 }, -- Ardent Custodian
		{ id = 869 }, -- Dazzling Longsword
		{ id = 870 }, -- Fiery War Axe
		{ id = 1982 }, -- Nightblade
		{ id = 2825 }, -- Bow of Searing Arrows
		{ id = 1204 }, -- The Green Tower
		{ id = 873 }, -- Staff of Jordan
		{},
		{ name=L["Level"].." 40-49"},
		{ id = 14550 }, -- Bladebane Armguards *15
		{ name=L["Level"].." 50-60"},
		{ id = 60784 }, -- Breastplate of Beast Mastery
		{ id = 2245 }, -- Helm of Narv
		{ id = 1443 }, -- Jeweled Amulet of Cainwyn
		{ id = 14558 }, -- Lady Maye's Pendant
		{ id = 14552 }, -- Stockade Pauldrons
		{ id = 3475 }, -- Cloak of Flames
		{ id = 14553 }, -- Sash of Mercy
		{ id = 14554 }, -- Cloudkeeper Legplates
		{ id = 2246 }, -- Myrmidon's Signet
		{ id = 833 }, -- Lifestone
		{ id = 18665 }, -- The Eye of Shadow
		{ id = 14557 }, -- The Lion Horn of Stormwind
		{},
		{ id = 2243 }, -- Hand of Edward the Odd *15
		--40
		{ id = 3075 }, -- Eye of Flame
		{ id = 1315 }, -- Lei of Lilies
		{ id = 940 }, -- Robes of Insight
		{ id = 14551 }, -- Edgemaster's Handguards
		{ id = 17007 }, -- Stonerender Gauntlets
		{ id = 14549 }, -- Boots of Avoidance
		{ id = 942 }, -- Freezing Band
		{ id = 1447 }, -- Ring of Saviors
		{},
		{ id = 810 }, -- Hammer of the Northern Wind
		{ id = 809 }, -- Bloodrazor
		{ id = 871 }, -- Flurry Axe
		{ id = 2164 }, -- Gut Ripper
		{ id = 2163 }, -- Shadowblade
		{ id = 2291 }, -- Kang the Decapitator *15
		--50
		{ id = 20698 }, -- Elemental Attuned Blade
		{ id = 1728 }, -- Teebu's Blazing Longsword
		{ id = 811 }, -- Axe of the Deep Woods
		{ id = 14555 }, -- Alcor's Sunrazor
		{ id = 2244 }, -- Krol Blade
		{ id = 1263 }, -- Brain Hacker
		{ id = 2801 }, -- Blade of Hanna
		{ id = 647 }, -- Destiny
		{ id = 2099 }, -- Dwarven Hand Cannon
		{ id = 1168 }, -- Skullflame Shield
		{ id = 944 }, -- Elemental Mage Staff *11
		{},
		{},
		{},
		{},
		--40
		{ id = 2915 }, -- Taran Icebreaker *1
		{ id = 812 }, -- Glowing Brightwood Staff
		{ id = 943 }, -- Warden Staff
		{ id = 2824 }, -- Hurricane
		{ id = 2100 }, -- Precisely Calibrated Boomstick
		{ id = 1169 }, -- Blackskull Shield
		{ id = 1979 }, -- Wall of the Dead
	},
	RarePets = {
		{ id = 13584, disc=L["Collector's Edition"] }, -- Diablo Stone
		{ id = 13583, disc=L["Collector's Edition"] }, -- Panda Collar
		{ id = 13582, disc=L["Collector's Edition"] }, -- Zergling Leash
		{ id = 23713, disc="TCG" }, -- Hippogryph Hatchling
		{ id = 23712, disc="TCG" }, -- White Tiger Cub
		{ id = 23007, disc=L["Children's Week"] }, -- Piglet's Collar
		{ id = 23015, disc=L["Children's Week"] }, -- Rat Cage
		{ id = 23002, disc=L["Children's Week"] }, -- Turtle Box
		{},
		{ id = 19450 }, -- A Jubling's Tiny Home
		{ id = 8491 }, -- Cat Carrier (Black Tabby)
		{ id = 8489 }, -- Cat Carrier (White Kitten)
		{ id = 11110 }, -- Chicken Egg
		{ id = 10822 }, -- Dark Whelpling
		{ id = 20769 }, -- Disgusting Oozeling *15
		{ id = 21301, disc=L["Feast of Winter Veil"] }, -- Green Helper Box
		{ id = 21308, disc=L["Feast of Winter Veil"] }, -- Jingling Bell
		{ id = 21305, disc=L["Feast of Winter Veil"] }, -- Red Helper Box
		{ id = 21309, disc=L["Feast of Winter Veil"] }, -- Snowman Kit
		{ id = 22235, disc=L["Love is in the Air"] }, -- Truesilver Shafted Arrow
		{ id = 23083, disc=L["Midsummer Fire Festival"] }, -- Captured Flame
		{ id = 20371, disc="BlizzCon 2005" }, -- Blue Murloc Egg
		{ id = 22114, disc="BlizzCon 2006" }, -- Pink Murloc Egg
		{},
		{ id = 15996 }, -- Lifelike Mechanical Toad
		{ id = 11826 }, -- Lil' Smoky
		{ id = 10398 }, -- Mechanical Chicken
		{ id = 8494 }, -- Parrot Cage (Hyacinth Macaw)
		{ id = 11825 }, -- Pet Bombling
		{ id = 12529 }, -- Smolderweb Carrier *15
		{ id = 11474 }, -- Sprite Darter Egg
		{ id = 8499 }, -- Tiny Crimson Whelpling
		{ id = 8498 }, -- Tiny Emerald Whelpling
		{ id = 21277 }, -- Tranquil Mechanical Yeti
		{ id = 12264 }, -- Worg Carrier
	},
	CraftedWeapons = {
		{ name = BS["Blacksmithing"], icon = "Trade_BlackSmithing" },
		{ id = 22384 }, -- Persuader
		{ id = 22383 }, -- Sageblade
		{ id = 19166 }, -- Black Amnesty
		{ id = 19170 }, -- Ebon Hand
		{ id = 19168 }, -- Blackguard
		{ id = 19169 }, -- Nightfall
		{ id = 17193 }, -- Sulfuron Hammer
		{ id = 19167 }, -- Blackfury
		{ id = 22198 }, -- Jagged Obsidian Shield
		{ id = 60010 }, -- Towerforge Demolisher
		{ id = 61185 }, -- Dawnstone Hammer
		{ id = 17015 }, -- Dark Iron Reaver
		{ id = 17016 }, -- Dark Iron Destroyer
		{ id = 65004 }, -- Ornate Bloodstone Dagger
		{ name = BS["Engineering"], icon = "Trade_Engineering" },
		{ id = 18282 }, -- Core Marksman Rifle
		{ id = 18168 }, -- Force Reactive Disk
		{},
		{ name = BS["Jewelcrafting"], icon = "INV_Jewelry_Necklace_01" },
		{ id = 55361 }, -- Empowered Domination Rod
		{ id = 55365 }, -- Rudeus' Focusing Cane
		{ id = 55060 }, -- Grandstaff of the Shen'dralar Elder 1.18
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 65008 }, -- Dream's Herald
	},
	SteelPlate = {
		{ name = BIS["Steel Plate Armor"] },
		{ id = 83415 }, -- Steel Plate Barbute
		{ id = 83414 }, -- Steel Plate Pauldrons
		{ id = 83413 }, -- Steel Plate Armor
		{ id = 83411 }, -- Steel Plate Gauntlets
		{ id = 83412 }, -- Steel Plate Legguards
		{ id = 83410 }, -- Steel Plate Boots
	},
	ImperialPlate = {
		{ name = BIS["Imperial Plate"] },
		{ id = 12427 }, -- Imperial Plate Helm
		{ id = 12428 }, -- Imperial Plate Shoulders
		{ id = 12422 }, -- Imperial Plate Chest
		{ id = 12425 }, -- Imperial Plate Bracers
		{ id = 12424 }, -- Imperial Plate Belt
		{ id = 12429 }, -- Imperial Plate Leggings
		{ id = 12426 }, -- Imperial Plate Boots
	},
	RuneEtchedArmor = {
		{ name = BIS["Rune-Etched Armor"] },
		{ id = 60287 }, -- Rune-Etched Grips
		{ id = 60288 }, -- Rune-Etched Greaves
		{ id = 60289 }, -- Rune-Etched Legplates
		{ id = 60290 }, -- Rune-Etched Breastplate
		{ id = 60291 }, -- Rune-Etched Crown
		{ id = 60292 }, -- Rune-Etched Mantle
	},
	TheDarksoul = {
		{ name = BIS["The Darksoul"] },
		{ id = 19695 }, -- Darksoul Shoulders
		{ id = 19693 }, -- Darksoul Breastplate
		{ id = 19694 }, -- Darksoul Leggings
	},
	DreamsteelArmor = {
		{ name = BIS["Dreamsteel Armor"] },
		{ id = 61364 }, -- Dreamsteel Mantle
		{ id = 61365 }, -- Dreamsteel Leggings
		{ id = 61366 }, -- Dreamsteel Bracers
		{ id = 61367 }, -- Dreamsteel Boots
	},
	BloodsoulEmbrace = {
		{ name = BIS["Bloodsoul Embrace"] },
		{ id = 19691 }, -- Bloodsoul Shoulders
		{ id = 19690 }, -- Bloodsoul Breastplate
		{ id = 19692 }, -- Bloodsoul Gauntlets
	},
	HateforgeArmor = {
		{ name = BIS["Hateforge Armor"] },
		{ id = 60573 }, -- Hateforge Helmet
		{ id = 60574 }, -- Hateforge Cuirass
		{ id = 60575 }, -- Hateforge Leggings
		{ id = 60576 }, -- Hateforge Belt
		{ id = 60577 }, -- Hateforge Grips
		{ id = 60578 }, -- Hateforge Boots
	},
	TowerforgeBattlegear = {
		{ name = BIS["Towerforge Battlegear"] },
		{ id = 60007 }, -- Towerforge Crown
		{ id = 60008 }, -- Towerforge Breastplate
		{ id = 60009 }, -- Towerforge Pauldrons
		{ id = 60010 }, -- Towerforge Demolisher
	},
	AugerersAttire = {
		{ name = BIS["Augerer's Attire"] },
		{ id = 83288 }, -- Augerer's Boots
		{ id = 83289 }, -- Augerer's Gloves
		{ id = 83290 }, -- Augerer's Mantle
		{ id = 83291 }, -- Augerer's Trousers
		{ id = 83286 }, -- Augerer's Hat
		{ id = 83287 }, -- Augerer's Robe
	},
	ShadoweaveSet = {
		{ name = BIS["Shadoweave"] },
		{ id = 10002 }, -- Shadoweave Pants
		{ id = 10004 }, -- Shadoweave Robe
		{ id = 10023 }, -- Shadoweave Gloves
		{ id = 10028 }, -- Shadoweave Shoulders
		{ id = 10031 }, -- Shadoweave Boots
		{ id = 10025 }, -- Shadoweave Mask
	},
	DivinersGarments = {
		{ name = BIS["Diviner's Garments"] },
		{ id = 83283 }, -- Diviner's Boots
		{ id = 83284 }, -- Diviner's Mitts
		{ id = 83285 }, -- Diviner's Epaulets
		{ id = 83280 }, -- Diviner's Pantaloons
		{ id = 83282 }, -- Diviner's Cowl
		{ id = 83281 }, -- Diviner's Robes
	},
	PillagersGarb = {
		{ name = BIS["Pillager's Garb"] },
		{ id = 83296 }, -- Pillager's Shoes
		{ id = 83295 }, -- Pillager's Grips
		{ id = 83297 }, -- Pillager's Pantaloons
		{ id = 83293 }, -- Pillager's Amice
		{ id = 83292 }, -- Pillager's Hood
		{ id = 83294 }, -- Pillager's Robe
	},
	MoonclothRegalia = {
		{ name = BIS["Mooncloth Regalia"] },
		{ id = 14140 }, -- Mooncloth Circlet
		{ id = 14139 }, -- Mooncloth Shoulders
		{ id = 14138 }, -- Mooncloth Vest
		{ id = 18486 }, -- Mooncloth Robe
		{ id = 18409 }, -- Mooncloth Gloves
		{ id = 14137 }, -- Mooncloth Leggings
		{ id = 15802 }, -- Mooncloth Boots
	},
	BloodvineG = {
		{ name = BIS["Bloodvine Garb"] },
		{ id = 19682 }, -- Bloodvine Vest
		{ id = 19683 }, -- Bloodvine Leggings
		{ id = 19684 }, -- Bloodvine Boots
	},
	FlarecoreRegalia = {
		{ name = BIS["Flarecore Regalia"] },
		{ id = 16979 }, -- Flarecore Gloves
		{ id = 19165 }, -- Flarecore Leggings
		{ id = 16980 }, -- Flarecore Mantle
		{ id = 19156 }, -- Flarecore Robe
		{ id = 18263 }, -- Flarecore Wraps
		{ id = 65035 }, -- Flarecore Boots
	},
	DreamthreadRegalia = {
		{ name = BIS["Dreamthread Regalia"] },
		{ id = 61360 }, -- Dreamthread Mantle
		{ id = 61361 }, -- Dreamthread Kilt
		{ id = 61362 }, -- Dreamthread Bracers
		{ id = 61363 }, -- Dreamthread Gloves
	},
	GriftersArmor = {
		{ name = BIS["Grifter's Armor"] },
		{ id = 83405 }, -- Grifter's Boots
		{ id = 83404 }, -- Grifter's Gauntlets
		{ id = 83403 }, -- Grifter's Belt
		{ id = 83402 }, -- Grifter's Leggings
		{ id = 83401 }, -- Grifter's Tunic
		{ id = 83400 }, -- Grifter's Cover
	},
	PrimalistsTrappings = {
		{ name = BIS["Primalist's Trappings"] },
		{ id = 81065 }, -- Primalist's Boots
		{ id = 81061 }, -- Primalist's Gloves
		{ id = 81063 }, -- Primalist's Headdress
		{ id = 81064 }, -- Primalist's Pants
		{ id = 81062 }, -- Primalist's Shoulders
		{ id = 81066 }, -- Primalist's Vest
	},
	VolcanicArmor = {
		{ name = BIS["Volcanic Armor"] },
		{ id = 15055 }, -- Volcanic Shoulders
		{ id = 15053 }, -- Volcanic Breastplate
		{ id = 15054 }, -- Volcanic Leggings
	},
	IronfeatherArmor = {
		{ name = BIS["Ironfeather Armor"] },
		{ id = 15067 }, -- Ironfeather Shoulders
		{ id = 15066 }, -- Ironfeather Breastplate
	},
	StormshroudArmor = {
		{ name = BIS["Stormshroud Armor"] },
		{ id = 15058 }, -- Stormshroud Shoulders
		{ id = 15056 }, -- Stormshroud Armor
		{ id = 21278 }, -- Stormshroud Gloves
		{ id = 15057 }, -- Stormshroud Pants
	},
	DevilsaurArmor = {
		{ name = BIS["Devilsaur Armor"] },
		{ id = 15063 }, -- Devilsaur Gauntlets
		{ id = 15062 }, -- Devilsaur Leggings
	},
	BloodTigerH = {
		{ name = BIS["Blood Tiger Harness"] },
		{ id = 19689 }, -- Blood Tiger Shoulders
		{ id = 19688 }, -- Blood Tiger Breastplate
	},
	PrimalBatskin = {
		{ name = BIS["Primal Batskin"] },
		{ id = 19685 }, -- Primal Batskin Jerkin
		{ id = 19687 }, -- Primal Batskin Bracers
		{ id = 19686 }, -- Primal Batskin Gloves
	},
	DreamhideBattlegarb = {
		{ name = BIS["Dreamhide Battlegarb"] },
		{ id = 61356 }, -- Dreamhide Mantle
		{ id = 61357 }, -- Dreamhide Bracers
		{ id = 61358 }, -- Dreamhide Leggings
		{ id = 61359 }, -- Dreamhide Belt
	},
	ConvergenceoftheElements = {
		{ name = BIS["Convergence of the Elements"] },
		{ id = 65024 }, -- Earthguard Tunic
		{ id = 65025 }, -- Flamewrath Leggings
		{ id = 65026 }, -- Depthstalker Helm
		{ id = 65027 }, -- Windwalker Boots
	},
	RedDragonM = {
		{ name = BIS["Red Dragon Mail"] },
		{ id = 65001 }, -- Red Dragonscale Shoulders
		{ id = 15047 }, -- Red Dragonscale Breastplate
		{ id = 65000 }, -- Red Dragonscale Leggings
		{ id = 65002 }, -- Red Dragonscale Boots
	},
	GreenDragonM = {
		{ name = BIS["Green Dragon Mail"] },
		{ id = 15045 }, -- Green Dragonscale Breastplate
		{ id = 20296 }, -- Green Dragonscale Gauntlets
		{ id = 15046 }, -- Green Dragonscale Leggings
	},
	BlueDragonM = {
		{ name = BIS["Blue Dragon Mail"] },
		{ id = 15049 }, -- Blue Dragonscale Shoulders
		{ id = 15048 }, -- Blue Dragonscale Breastplate
		{ id = 20295 }, -- Blue Dragonscale Leggings
		{ id = 65015 }, -- Blue Dragonscale Boots
	},
	BlackDragonM = {
		{ name = BIS["Black Dragon Mail"] },
		{ id = 15051 }, -- Black Dragonscale Shoulders
		{ id = 15050 }, -- Black Dragonscale Breastplate
		{ id = 15052 }, -- Black Dragonscale Leggings
		{ id = 16984 }, -- Black Dragonscale Boots
	},
}

for k, v in pairs(Sets) do
	AtlasLoot_Data[k] = v
end