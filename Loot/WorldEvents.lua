local _G = getfenv()
AtlasTW = _G.AtlasTW

--Instance required libraries
local L = AtlasTW.Local
local BB = AceLibrary("Babble-Boss-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasLoot_Data = AtlasLoot_Data or {}

local WorldEvents = {
	----------------------------------
	---- Abyssal Bosses ----
	----------------------------------

	AbyssalTemplars = {
		{ name = L["Crimson Templar"] },
		{ id = 20657, dropRate=5 }, -- Crystal Tipped Stiletto
		{ id = 20655, dropRate=13, disc=L["Random stats"] }, -- Abyssal Cloth Handwraps
		{ id = 20656, dropRate=13, disc=L["Random stats"] }, -- Abyssal Mail Sabatons
		{ id = 20513, dropRate=100 }, -- Abyssal Crest
		{},
		{ name = L["Azure Templar"] },
		{ id = 20654, dropRate=5 }, -- Amethyst War Staff
		{ id = 20653, dropRate=12, disc=L["Random stats"] }, -- Abyssal Plate Gauntlets
		{ id = 20652, dropRate=12, disc=L["Random stats"] }, -- Abyssal Cloth Slippers
		{ id = 20513, dropRate=100 }, -- Abyssal Crest
		{},
		{ name = L["Hoary Templar"] },
		{ id = 20660, dropRate=5 }, -- Stonecutting Glaive
		{ id = 20659, dropRate=13, disc=L["Random stats"] }, -- Abyssal Mail Handguards
		{ id = 20658, dropRate=13, disc=L["Random stats"] }, -- Abyssal Leather Boots
		{ id = 20513, dropRate=100 }, -- Abyssal Crest
		{},
		{ name = L["Earthen Templar"] },
		{ id = 20663, dropRate=6 }, -- Deep Strike Bow
		{ id = 20661, dropRate=13, disc=L["Random stats"] }, -- Abyssal Leather Gloves
		{ id = 20662, dropRate=12, disc=L["Random stats"] }, -- Abyssal Plate Greaves
		{ id = 20513, dropRate=100 }, -- Abyssal Crest
	},
	AbyssalDukes = {
		{ name = L["The Duke of Cynders"] },
		{ id = 20665, dropRate=30, disc=L["Random stats"] }, -- Abyssal Leather Leggings
		{ id = 20666, dropRate=30 }, -- Hardened Steel Warhammer
		{ id = 20514, dropRate=100 }, -- Abyssal Signet
		{ id = 20664, dropRate=40, disc=L["Random stats"] }, -- Abyssal Cloth Sash
		{ id = 21989, dropRate=100, container={{22192,3},{22193,3}} }, -- Cinder of Cynders
		{},
		{ name = L["The Duke of Fathoms"] },
		{ id = 20668, dropRate=30, disc=L["Random stats"] }, -- Abyssal Mail Legguards
		{ id = 20669, dropRate=30 }, -- Darkstone Claymore
		{ id = 20514, dropRate=100 }, -- Abyssal Signet
		{ id = 20667, dropRate=40, disc=L["Random stats"] }, -- Abyssal Leather Belt
		{},
		{ name = L["The Duke of Zephyrs"] },
		{ id = 20674, dropRate=40, disc=L["Random stats"] }, -- Abyssal Cloth Pants
		{ id = 20675, dropRate=30 }, -- Soulrender
		{ id = 20514, dropRate=100 }, -- Abyssal Signet
		{ id = 20673, dropRate=30, disc=L["Random stats"] }, -- Abyssal Plate Girdle
		{},
		{ name = L["The Duke of Shards"] },
		{ id = 20671, dropRate=30, disc=L["Random stats"] }, -- Abyssal Plate Legplates
		{ id = 20672, dropRate=30 }, -- Sparkling Crystal Wand
		{ id = 20514, dropRate=100 }, -- Abyssal Signet
		{ id = 20670, dropRate=40, disc=L["Random stats"] }, -- Abyssal Mail Clutch
	},
	AbyssalLords = {
		{ name = L["Prince Skaldrenox"], info = L["Fire"] },
		{ id = 20682, dropRate = 50 }, -- Elemental Focus Band
		{ id = 83562, dropRate = 50 }, -- Skaldrenox's Rage
		{ id = 20681, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Leather Bracers
		{ id = 20680, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Mail Pauldrons
		{ id = 20515, dropRate = 100 }, -- Abyssal Scepter
		{ id = 83554, dropRate = 40 }, -- Abyssal Flame
		{},
		{ name = L["Lord Skwol"], info = L["Water"] },
		{ id = 20685, dropRate = 50 }, -- Wavefront Necklace
		{ id = 83563, dropRate = 50 }, -- Pearl of the Tides
		{ id = 20684, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Mail Armguards
		{ id = 20683, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Plate Epaulets
		{ id = 20515, dropRate = 100 }, -- Abyssal Scepter
		{ id = 83557, dropRate = 40 }, -- Abyssal Wave
		{},
		{ name = L["High Marshal Whirlaxis"], info = L["Air"] },
		{ id = 20691, dropRate = 50 }, -- Windshear Cape
		{ id = 83564, dropRate = 50 }, -- Tempest's Rage
		{ id = 20690, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Cloth Wristbands
		{ id = 20689, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Leather Shoulders
		{ id = 20515, dropRate = 100 }, -- Abyssal Scepter
		{ id = 83556, dropRate = 40 }, -- Abyssal Wind
		{},
		{ name = L["Baron Kazum"], info = L["Earth"] },
		{ id = 20688, dropRate = 50 }, -- Earthen Guard
		{ id = 83565, dropRate = 50 }, -- Blackstone Crown
		{ id = 20686, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Cloth Amice
		{ id = 20687, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Plate Vambraces
		{ id = 20515, dropRate = 100 }, -- Abyssal Scepter
		{ id = 83555, dropRate = 40 }, -- Abyssal Slate
	},
	ElementalInvasion = {
		{ name = L["Baron Charr"], info = BZ["Un'goro Crater"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83550, dropRate = 100 }, -- Primordial Flame
		{ id = 18671, dropRate = 21 }, -- Baron Charr's Sceptre
		{ id = 80850, dropRate = 15 }, -- Circlet of the Living Volcano
		{ id = 19268, dropRate = 10.14 }, -- Ace of Elementals
		{ id = 18672, dropRate = 50 }, -- Elemental Ember
		{ id = 80849, dropRate = 15 }, -- Living Ember Pendant
		{ name = L["Princess Tempestria"], info = BZ["Winterspring"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83552, dropRate = 100 }, -- Unmelting Ice
		{ id = 18678, dropRate = 30 }, -- Tempestria's Frozen Necklace
		{ id = 80843, dropRate = 15 }, -- Tideturner Boots
		{ id = 19268, dropRate = 5.24 }, -- Ace of Elementals
		{ id = 80844, dropRate = 15 }, -- Tempestria's Frozen Heart
		{ id = 18679, dropRate = 50 }, -- Frigid Ring
		{ id = 21548, dropRate = 20 }, -- Pattern: Stormshroud Gloves
		{ name = L["Avalanchion"], info = BZ["Azshara"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83551, dropRate = 100 }, -- Evershifting Stone
		{ id = 18673, dropRate = 30 }, -- Avalanchion's Stony Hide
		{ id = 80851, dropRate = 15 }, -- Earthclad Bracers
		{ id = 19268, dropRate = 5.89 }, -- Ace of Elementals
		{ id = 18674, dropRate = 50 }, -- Hardened Stone Band
		{ id = 80852, dropRate = 15 }, -- Earthshard Necklace
		{ name = L["The Windreaver"], info = BZ["Silithus"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83553, dropRate = 100 }, -- Unyielding Gust
		{ id = 18676, dropRate = 25 }, -- Sash of the Windreaver
		{ id = 80853, dropRate = 15 }, -- Thunderstruck Talisman
		{ id = 19268, dropRate = 5.89 }, -- Ace of Elementals
		{ id = 18677, dropRate = 58 }, -- Zephyr Cloak
		{ id = 80854, dropRate = 15 }, -- Wind Kissed Crystal
		{ id = 21548, dropRate = 31 }, -- Pattern: Stormshroud Gloves
	},
	GurubashiArena = {
		{ id = 18709, dropRate = 5.0 }, -- Arena Wristguards
		{ id = 18710, dropRate = 6.4 }, -- Arena Bracers
		{ id = 18711, dropRate = 6.0 }, -- Arena Bands
		{ id = 18712, dropRate = 6.8 }, -- Arena Vambraces
		{},
		{ id = 18706, dropRate = 100 }, -- Arena Master
		{ id = 19024 }, -- Arena Grand Master
	},
	FishingExtravaganza = {
		{ name = L["First Prize"], container = L["Master Angler"] },
		{ id = 19970 }, -- Arcanite Fishing Pole
		{ id = 19979 }, -- Hook of the Master Angler
		{},
		{ name = L["Rare Fish"] },
		{ id = 19805 }, -- Keefer's Angelfish
		{ id = 19803 }, -- Brownell's Blue Striped Racer
		{ id = 19806 }, -- Dezian Queenfish
		{ id = 19808 }, -- Rockhide Strongfish
		{},
		{ name = L["Rare Fish Rewards"] },
		{ id = 19972 }, -- Lucky Fishing Hat
		{ id = 19969 }, -- Nat Pagle's Extreme Anglin' Boots
		{ id = 19971 }, -- High Test Eternium Fishing Line
	},
	ChildrensWeek = {
		{ id = 23007 }, -- Piglet's Collar
		{ id = 23015 }, -- Rat Cage
		{ id = 23002 }, -- Turtle Box
		{ id = 23022 }, -- Curmudgeon's Payoff
	},
	Valentineday = {
		{ id = 22206, dropRate = .43 }, -- Bouquet of Red Roses
		{},
		{ name = L["Gift of Adoration"], icon="INV_ValentinesBoxOfChocolates02" },
		{ id = 22279 }, -- Lovely Black Dress
		{ id = 22235 }, -- Truesilver Shafted Arrow
		{ id = 22200 }, -- Silver Shafted Arrow
		{ id = 22261 }, -- Love Fool
		{ id = 22218 }, -- Handful of Rose Petals
		{ id = 21813 }, -- Bag of Candies
		{},
		{ name = L["Box of Chocolates"], icon="INV_Box_02" },
		{ id = 22237 }, -- Dark Desire
		{ id = 22238 }, -- Very Berry Cream
		{ id = 22236 }, -- Buttermilk Delight
		{ id = 22239 }, -- Sweet Surprise
		{ id = 22276 }, -- Lovely Red Dress
		{ id = 22278 }, -- Lovely Blue Dress
		{ id = 22280 }, -- Lovely Purple Dress
		{ id = 22277 }, -- Red Dinner Suit
		{ id = 22281 }, -- Blue Dinner Suit
		{ id = 22282 }, -- Purple Dinner Suit
	},
	Halloween = {
		{ id = 20400 }, -- Pumpkin Bag
		{},
		{ id = 18633 }, -- Styleen's Sour Suckerpop
		{ id = 18632 }, -- Moonbrook Riot Taffy
		{ id = 18635 }, -- Bellara's Nutterbar
		{ id = 20516 }, -- Bobbing Apple
		{ id = 20557 }, -- Hallow's End Pumpkin Treat
		{},
		{ id = 20389 }, -- Candy Corn
		{ id = 20388 }, -- Lollipop
		{ id = 20390 }, -- Candy Bar
		{},
		{ name = L["Treat Bag"], icon="INV_Misc_Bag_11" },
		{ id = 20410 }, -- Hallowed Wand - Bat
		{ id = 20409 }, -- Hallowed Wand - Ghost
		{ id = 20399 }, -- Hallowed Wand - Leper Gnome
		{ id = 20398 }, -- Hallowed Wand - Ninja
		{ id = 20397 }, -- Hallowed Wand - Pirate
		{ id = 20413 }, -- Hallowed Wand - Random
		{ id = 20411 }, -- Hallowed Wand - Skeleton
		{ id = 20414 }, -- Hallowed Wand - Wisp
		{},
		{ name = L["Treat Bag"], icon="INV_Misc_Bag_11" },
		{ id = 20561 }, -- Flimsy Male Dwarf Mask
		{ id = 20391 }, -- Flimsy Male Gnome Mask
		{ id = 20566 }, -- Flimsy Male Human Mask
		{ id = 20564 }, -- Flimsy Male Nightelf Mask
		{ id = 20570 }, -- Flimsy Male Orc Mask
		{ id = 20572 }, -- Flimsy Male Tauren Mask
		{ id = 20568 }, -- Flimsy Male Troll Mask
		{ id = 20573 }, -- Flimsy Male Undead Mask
		{},
		{ name = L["Treat Bag"], icon="INV_Misc_Bag_11" },
		{ id = 20562 }, -- Flimsy Female Dwarf Mask
		{ id = 20392 }, -- Flimsy Female Gnome Mask
		{ id = 20565 }, -- Flimsy Female Human Mask
		{ id = 20563 }, -- Flimsy Female Nightelf Mask
		{ id = 20569 }, -- Flimsy Female Orc Mask
		{ id = 20571 }, -- Flimsy Female Tauren Mask
		{ id = 20567 }, -- Flimsy Female Troll Mask
		{ id = 20574 }, -- Flimsy Female Undead Mask
	},
	Winterviel = {
		{ id = 21525 }, -- Green Winter Hat
		{ id = 21524 }, -- Red Winter Hat
		{},
		{ id = 17712 }, -- Winter Veil Disguise Kit
		{ id = 17202 }, -- Snowball
		{ id = 21212 }, -- Fresh Holly
		{ id = 21519 }, -- Mistletoe
		{},
		{ name = L["Gaily Wrapped Present"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 21301 }, -- Green Helper Box
		{ id = 21308 }, -- Jingling Bell
		{ id = 21305 }, -- Red Helper Box
		{ id = 21309 }, -- Snowman Kit
		{ name = L["Festive Gift"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 21328 }, -- Wand of Holiday Cheer
		{ name = L["Smokywood Pastures Special Gift"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 17706 }, -- Plans: Edge of Winter
		{ id = 17725 }, -- Formula: Enchant Weapon - Winter's Might
		{ id = 17720 }, -- Schematic: Snowmaster 9000
		{ id = 17722 }, -- Pattern: Gloves of the Greatfather
		{ id = 17709 }, -- Recipe: Elixir of Frost Power
		{ id = 17724 }, -- Pattern: Green Holiday Shirt
		{},
		{ id = 21325 }, -- Mechanical Greench
		{ id = 21213 }, -- Preserved Holly
		{},
		{ name = L["Gently Shaken Gift"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 21235 }, -- Winter Veil Roast
		{ id = 21241 }, -- Winter Veil Eggnog
		{},
		{ name = L["Smokywood Pastures"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 17201 }, -- Recipe: Egg Nog
		{ id = 17200 }, -- Recipe: Gingerbread Cookie
		{ id = 17344 }, -- Candy Cane
		{ id = 17406 }, -- Holiday Cheesewheel
		{ id = 17407 }, -- Graccu's Homemade Meat Pie
		{ id = 17408 }, -- Spicy Beefstick
		{ id = 17404 }, -- Blended Bean Brew
		{ id = 17405 }, -- Green Garden Tea
		{ id = 17196 }, -- Holiday Spirits
		{ id = 17403 }, -- Steamwheedle Fizzy Spirits
		{ id = 17402 }, -- Greatfather's Winter Ale
		{ id = 17194 }, -- Holiday Spices
		{},
		{ id = 17303 }, -- Blue Ribboned Wrapping Paper
		{ id = 17304 }, -- Green Ribboned Wrapping Paper
		{ id = 17307 }, -- Purple Ribboned Wrapping Paper
		{},
		{ id = 51249 }, -- Snowball
	},
	Noblegarden = {
		{ name = L["Brightly Colored Egg"], icon="INV_Egg_03" },
		{ id = 19028 }, -- Elegant Dress
		{ id = 6833 }, -- White Tuxedo Shirt
		{ id = 6835 }, -- Black Tuxedo Pants
		{},
		{ id = 7807 }, -- Candy Bar
		{ id = 7808 }, -- Chocolate Square
		{ id = 7806 }, -- Lollipop
	},
	HarvestFestival = {
		{ id = 19697 }, -- Bounty of the Harvest
		{ id = 20009 }, -- For the Light!
		{ id = 20010 }, -- The Horde's Hellscream
		{},
		{ id = 19995 }, -- Harvest Boar
		{ id = 19996 }, -- Harvest Fish
		{ id = 19994 }, -- Harvest Fruit
		{ id = 19997 }, -- Harvest Nectar
		{ id = 19696 }, -- Harvest Bread
	},
	ScourgeInvasion = {
		{ id = 23123 }, -- Blessed Wizard Oil
		{ id = 23122 }, -- Consecrated Sharpening Stone
		{ id = 22999 }, -- Tabard of the Argent Dawn
		{ id = 22484 }, -- Necrotic Rune
		{},
		{ name = BIS["Regalia of Undead Cleansing"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23085 }, -- Robe of Undead Cleansing
		{ id = 23091 }, -- Bracers of Undead Cleansing
		{ id = 23084 }, -- Gloves of Undead Cleansing
		{},
		{ name = BIS["Undead Slayer's Armor"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23089 }, -- Tunic of Undead Slaying
		{ id = 23093 }, -- Wristwraps of Undead Slaying
		{ id = 23081 }, -- Handwraps of Undead Slaying
		{},
		{ id = 23194 }, -- Lesser Mark of the Dawn
		{ id = 23195 }, -- Mark of the Dawn
		{ id = 23196 }, -- Greater Mark of the Dawn
		{},
		{},
		{ name = BIS["Garb of the Undead Slayer"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23088 }, -- Chestguard of Undead Slaying
		{ id = 23092 }, -- Wristguards of Undead Slaying
		{ id = 23082 }, -- Handguards of Undead Slaying
		{},
		{ name = BIS["Battlegear of Undead Slaying"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23087 }, -- Breastplate of Undead Slaying
		{ id = 23090 }, -- Bracers of Undead Slaying
		{ id = 23078 }, -- Gauntlets of Undead Slaying
		{},
		{ name = BB["Balzaphon"], info = BZ["Stratholme"] },
		{ id = 23126, dropRate = 27.38 }, -- Waistband of Balzaphon
		{ id = 23125, dropRate = 19.89 }, -- Chains of the Lich
		{ id = 23124, dropRate = 24.74 }, -- Staff of Balzaphon
		{},
		{ name = BB["Lord Blackwood"], info = BZ["Scholomance"] },
		{ id = 23132, dropRate = 12.83 }, -- Lord Blackwood's Blade
		{ id = 23156, dropRate = 45.21 }, -- Blackwood's Thigh
		{ id = 23139, dropRate = 38.75 }, -- Lord Blackwood's Buckler
		{},
		{ name = BB["Revanchion"], info = BZ["Dire Maul (West)"] },
		{ id = 23127, dropRate = 38.49 }, -- Cloak of Revanchion
		{ id = 23129, dropRate = 39.61 }, -- Bracers of Mending
		{ id = 23128, dropRate = 21.81 }, -- The Shadow's Grasp
		{},
		{ name = BB["Scorn"], info = BZ["Scarlet Monastery (Cathedral)"] },
		{ id = 23169, dropRate = 27.49 }, -- Scorn's Icy Choker
		{ id = 23170, dropRate = 56.15 }, -- The Frozen Clutch
		{ id = 23168, dropRate = 16.36 }, -- Scorn's Focal Dagger
		{},
		{ name = BB["Sever"], info = BZ["Shadowfang Keep"] },
		{ id = 23173, dropRate = 76.87 }, -- Abomination Skin Leggings
		{ id = 23171, dropRate = 22.94 }, -- The Axe of Severing
		{},
		{ name = BB["Lady Falther'ess"], info = BZ["Razorfen Downs"] },
		{ id = 23178, dropRate = 61.24 }, -- Mantle of Lady Falther'ess
		{ id = 23177, dropRate = 38.17 }, -- Lady Falther'ess' Finger
	},
	LunarFestival = {
		{ id = 21100 }, -- Coin of Ancestry
		{},
		{ id = 21157 }, -- Festive Green Dress
		{ id = 21538 }, -- Festive Pink Dress
		{ id = 21539 }, -- Festive Purple Dress
		{ id = 21541 }, -- Festive Black Pant Suit
		{ id = 21544 }, -- Festive Blue Pant Suit
		{ id = 21543 }, -- Festive Teal Pant Suit
		{},
		{ name = L["Lucky Red Envelope"], icon="INV_Misc_LuckyMoneyEnvelope" },
		{ id = 21744 }, -- Lucky Rocket Cluster
		{ id = 21745 }, -- Elder's Moonstone
		{},
		{ id = 21540 }, -- Elune's Lantern
		{ id = 21536 }, -- Elune Stone
		{ name = L["Lunar Festival Fireworks Pack"], icon="INV_Box_02" },
		{ id = 21558 }, -- Small Blue Rocket
		{ id = 21559 }, -- Small Green Rocket
		{ id = 21557 }, -- Small Red Rocket
		{ id = 21561 }, -- Small White Rocket
		{ id = 21562 }, -- Small Yellow Rocket
		{ id = 21589 }, -- Large Blue Rocket
		{ id = 21590 }, -- Large Green Rocket
		{ id = 21592 }, -- Large Red Rocket
		{ id = 21593 }, -- Large White Rocket
		{ id = 21595 }, -- Large Yellow Rocket
		{},
		{ id = 21537 }, -- Festival Dumplings
		{ id = 21713 }, -- Elune's Candle
		{},
		{ id = 21738 }, -- Schematic: Firework Launcher
		{},
		{ id = 21722 }, -- Pattern: Festival Dress
		{ id = 21154 }, -- Festival Dress
		{},
		{ name = L["Small Rocket Recipes"], icon="INV_Scroll_03" },
		{ id = 21724 }, -- Schematic: Small Blue Rocket
		{ id = 21725 }, -- Schematic: Small Green Rocket
		{ id = 21726 }, -- Schematic: Small Red Rocket
		{},
		{ name = L["Large Rocket Recipes"], icon="INV_Scroll_04" },
		{ id = 21727 }, -- Schematic: Large Blue Rocket
		{ id = 21728 }, -- Schematic: Large Green Rocket
		{ id = 21729 }, -- Schematic: Large Red Rocket
		{},
		{ id = 21737 }, -- Schematic: Cluster Launcher
		{},
		{ id = 21723 }, -- Pattern: Festive Red Pant Suit
		{ id = 21542 }, -- Festival Suit
		{},
		{ name = L["Cluster Rocket Recipes"], icon="INV_Scroll_05" },
		{ id = 21730 }, -- Schematic: Blue Rocket Cluster
		{ id = 21731 }, -- Schematic: Green Rocket Cluster
		{ id = 21732 }, -- Schematic: Red Rocket Cluster
		{},
		{ name = L["Large Cluster Rocket Recipes"], icon="INV_Scroll_06" },
		{ id = 21733 }, -- Schematic: Large Blue Rocket Cluster
		{ id = 21734 }, -- Schematic: Large Green Rocket Cluster
		{ id = 21735 }, -- Schematic: Large Red Rocket Cluster
	},
	MidsummerFestival = {
		{ id = 23379 }, -- Cinder Bracers
		{},
		{ id = 23323 }, -- Crown of the Fire Festival
		{ id = 23324 }, -- Mantle of the Fire Festival
		{},
		{ id = 23083 }, -- Captured Flame
		{ id = 23247 }, -- Burning Blossom
		{ id = 23246 }, -- Fiery Festival Brew
		{ id = 23435 }, -- Elderberry Pie
		{ id = 23327 }, -- Fire-toasted Bun
		{ id = 23326 }, -- Midsummer Sausage
		{ id = 23211 }, -- Toasted Smorc
	}
}

for k, v in pairs(WorldEvents) do
	AtlasLoot_Data[k] = v
end