---
--- Events.lua - World event and seasonal data tables
---
--- This module contains comprehensive data for all world events and seasonal
--- activities in World of Warcraft. It includes holiday events, special bosses,
--- unique rewards, and time-limited content.
---
--- Features:
--- • Complete seasonal event data
--- • Holiday boss encounters
--- • Event-specific loot tables
--- • Time-limited rewards
--- • Achievement and quest items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

local L = AtlasTW.Localization.UI
local LM = AtlasTW.Localization.MapData
local LS = AtlasTW.Localization.Spells
local LB = AtlasTW.Localization.Bosses
local LZ = AtlasTW.Localization.Zones
local LIS = AtlasTW.Localization.ItemSets

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

local WorldEvents = {
	----------------------------------
	---- Abyssal Bosses ----
	----------------------------------

	AbyssalCouncil = {
		{ name = LM["Crimson Templar"] },
		{ id = 20657, dropRate=5 }, -- Crystal Tipped Stiletto
		{ id = 20655, dropRate=13, disc=L["Random stats"] }, -- Abyssal Cloth Handwraps
		{ id = 20656, dropRate=13, disc=L["Random stats"] }, -- Abyssal Mail Sabatons
		{ id = 20513, dropRate=100, disc = L["Quest Item"], container = { 20603 } }, -- Abyssal Crest
		{},
		{ name = LM["Azure Templar"] },
		{ id = 20654, dropRate=5 }, -- Amethyst War Staff
		{ id = 20653, dropRate=12, disc=L["Random stats"] }, -- Abyssal Plate Gauntlets
		{ id = 20652, dropRate=12, disc=L["Random stats"] }, -- Abyssal Cloth Slippers
		{ id = 20513, dropRate=100, disc = L["Quest Item"], container = { 20603 } }, -- Abyssal Crest
		{},
		{ name = LM["The Duke of Cynders"] },
		{ id = 20665, dropRate=30, disc=L["Random stats"] }, -- Abyssal Leather Leggings
		{ id = 20666, dropRate=30 }, -- Hardened Steel Warhammer
		{ name = LM["Hoary Templar"] },
		{ id = 20660, dropRate=5 }, -- Stonecutting Glaive
		{ id = 20659, dropRate=13, disc=L["Random stats"] }, -- Abyssal Mail Handguards
		{ id = 20658, dropRate=13, disc=L["Random stats"] }, -- Abyssal Leather Boots
		{ id = 20513, dropRate=100, disc = L["Quest Item"], container = { 20603 } }, -- Abyssal Crest
		{},
		{ name = LM["Earthen Templar"] },
		{ id = 20663, dropRate=6 }, -- Deep Strike Bow
		{ id = 20661, dropRate=13, disc=L["Random stats"] }, -- Abyssal Leather Gloves
		{ id = 20662, dropRate=12, disc=L["Random stats"] }, -- Abyssal Plate Greaves
		{ id = 20513, dropRate=100, disc = L["Quest Item"], container = { 20603 } }, -- Abyssal Crest
		{},
		{ name = LM["The Duke of Zephyrs"] },
		{ id = 20674, dropRate=40, disc=L["Random stats"] }, -- Abyssal Cloth Pants
		{ id = 20675, dropRate=30 }, -- Soulrender
		{ id = 20514, dropRate=100, disc = L["Quest Item"], container = { 20601, 20451 } }, -- Abyssal Signet
		{ id = 20664, dropRate=40, disc=L["Random stats"] }, -- Abyssal Cloth Sash
		{ id = 21989, dropRate=100, container={{22192,3},{22193,3}} }, -- Cinder of Cynders
		{},
		{ name = LM["The Duke of Fathoms"] },
		{ id = 20668, dropRate=30, disc=L["Random stats"] }, -- Abyssal Mail Legguards
		{ id = 20669, dropRate=30 }, -- Darkstone Claymore
		{ id = 20514, dropRate=100, disc = L["Quest Item"], container = { 20601, 20451 } }, -- Abyssal Signet
		{ id = 20667, dropRate=40, disc=L["Random stats"] }, -- Abyssal Leather Belt
		{},
		{ name = LM["Prince Skaldrenox"], info = L["Fire"] },
		{ id = 20682, dropRate = 50 }, -- Elemental Focus Band
		{ id = 83562, dropRate = 50 }, -- Skaldrenox's Rage
		{ id = 20681, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Leather Bracers
		{ id = 20680, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Mail Pauldrons
		{ id = 20514, dropRate=100, disc = L["Quest Item"], container = { 20601, 20451 } }, -- Abyssal Signet
		{ id = 20673, dropRate=30, disc=L["Random stats"] }, -- Abyssal Plate Girdle
		{},
		{},
		{ name = LM["The Duke of Shards"] },
		{ id = 20671, dropRate=30, disc=L["Random stats"] }, -- Abyssal Plate Legplates
		{ id = 20672, dropRate=30 }, -- Sparkling Crystal Wand
		{ id = 20514, dropRate=100, disc = L["Quest Item"], container = { 20601, 20451 } }, -- Abyssal Signet
		{ id = 20670, dropRate=40, disc=L["Random stats"] }, -- Abyssal Mail Clutch
		{},
		{ name = LM["High Marshal Whirlaxis"], info = L["Air"] },
		{ id = 20691, dropRate = 50 }, -- Windshear Cape
		{ id = 83564, dropRate = 50 }, -- Tempest's Rage
		{ id = 20690, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Cloth Wristbands
		{ id = 20689, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Leather Shoulders
		{ id = 20515, dropRate = 100, disc = L["Quest Item"], container = { 20602, 22725 } }, -- Abyssal Scepter
		{ id = 83554, dropRate = 40, disc = L["Reagent"], container = { 83558, 65025 } }, -- Abyssal Flame
		{},
		{ name = LM["Lord Skwol"], info = LS["Water"] },
		{ id = 20685, dropRate = 50 }, -- Wavefront Necklace
		{ id = 83563, dropRate = 50 }, -- Pearl of the Tides
		{ id = 20684, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Mail Armguards
		{ id = 20683, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Plate Epaulets
		{ id = 20515, dropRate = 100, disc = L["Quest Item"], container = { 20602, 22725 } }, -- Abyssal Scepter
		{ id = 83557, dropRate = 40, disc = L["Reagent"], container = { 83561, 65026 } }, -- Abyssal Wave
		{},
		{},
		{},
		{},
		{},
		{ id = 20515, dropRate = 100, disc = L["Quest Item"], container = { 20602, 22725 } }, -- Abyssal Scepter
		{ id = 83556, dropRate = 40, disc = L["Reagent"], container = { 83560, 65027 } }, -- Abyssal Wind
		{},
		{ name = LM["Baron Kazum"], info = L["Earth"] },
		{ id = 20688, dropRate = 50 }, -- Earthen Guard
		{ id = 83565, dropRate = 50 }, -- Blackstone Crown
		{ id = 20686, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Cloth Amice
		{ id = 20687, dropRate = 50, disc = L["Random stats"] }, -- Abyssal Plate Vambraces
		{ id = 20515, dropRate = 100, disc = L["Quest Item"], container = { 20602, 22725 } }, -- Abyssal Scepter
		{ id = 83555, dropRate = 40, disc = L["Reagent"], container = { 83559, 65024 } }, -- Abyssal Slate
	},
	ElementalInvasion = {
		{ name = LB["Baron Charr"], info = LZ["Un'Goro Crater"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83550, dropRate = 100 }, -- Primordial Flame
		{ id = 18671, dropRate = 21 }, -- Baron Charr's Sceptre
		{ id = 80850, dropRate = 15 }, -- Circlet of the Living Volcano
		{ id = 19268, dropRate = 10, disc = L["Reagent"], container={19267, 19289} }, -- Ace of Elementals
		{ id = 18672, dropRate = 50 }, -- Elemental Ember
		{ id = 80849, dropRate = 15 }, -- Living Ember Pendant
		{ name = LB["Princess Tempestria"], info = LZ["Winterspring"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83552, dropRate = 100 }, -- Unmelting Ice
		{ id = 18678, dropRate = 30 }, -- Tempestria's Frozen Necklace
		{ id = 80843, dropRate = 15 }, -- Tideturner Boots
		{ id = 19268, dropRate = 6, disc = L["Reagent"], container={19267, 19289} }, -- Ace of Elementals
		{ id = 80844, dropRate = 15 }, -- Tempestria's Frozen Heart
		{ id = 18679, dropRate = 50 }, -- Frigid Ring
		{ id = 21548, dropRate = 31, container = { 21278 } }, -- Pattern: Stormshroud Gloves
		{ name = LB["Avalanchion"], info = LZ["Azshara"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83551, dropRate = 100 }, -- Evershifting Stone
		{ id = 18673, dropRate = 30 }, -- Avalanchion's Stony Hide
		{ id = 80851, dropRate = 15 }, -- Earthclad Bracers
		{ id = 19268, dropRate = 6, disc = L["Reagent"], container={19267, 19289} }, -- Ace of Elementals
		{ id = 18674, dropRate = 50 }, -- Hardened Stone Band
		{ id = 80852, dropRate = 15 }, -- Earthshard Necklace
		{ name = LB["The Windreaver"], info = LZ["Silithus"], icon="Spell_Fire_Elemental_Totem" },
		{ id = 83553, dropRate = 100 }, -- Unyielding Gust
		{ id = 18676, dropRate = 25 }, -- Sash of the Windreaver
		{ id = 80853, dropRate = 15 }, -- Thunderstruck Talisman
		{ id = 19268, dropRate = 6, disc = L["Reagent"], container={19267, 19289} }, -- Ace of Elementals
		{ id = 18677, dropRate = 58 }, -- Zephyr Cloak
		{ id = 80854, dropRate = 15 }, -- Wind Kissed Crystal
		{ id = 21548, dropRate = 31, container = { 21278 } }, -- Pattern: Stormshroud Gloves
	},
	GurubashiArena = {
		{ id = 18709, dropRate = 5 }, -- Arena Wristguards
		{ id = 18710, dropRate = 7 }, -- Arena Bracers
		{ id = 18711, dropRate = 6 }, -- Arena Bands
		{ id = 18712, dropRate = 7 }, -- Arena Vambraces
		{},
		{ id = 18706, dropRate = 100 }, -- Arena Master
		{ id = 19024 }, -- Arena Grand Master
	},
	FishingExtravaganza = {
		{ name = L["First Prize"], info = L["Master Angler"] },
		{ id = 19970 }, -- Arcanite Fishing Pole
		{ id = 19979 }, -- Hook of the Master Angler
		{},
		{ name = L["Rare Fish"] },
		{ id = 19805, disc = L["Misc"] }, -- Keefer's Angelfish
		{ id = 19803, disc = L["Misc"] }, -- Brownell's Blue Striped Racer
		{ id = 19806, disc = L["Misc"] }, -- Dezian Queenfish
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
		{ id = 23022, disc = L["Container"] }, -- Curmudgeon's Payoff
	},
	Valentineday = {
		{ id = 22206, dropRate = .43 }, -- Bouquet of Red Roses
		{},
		{ name = LM["Gift of Adoration"], icon="INV_ValentinesBoxOfChocolates02" },
		{ id = 22279 }, -- Lovely Black Dress
		{ id = 22235 }, -- Truesilver Shafted Arrow
		{ id = 22200, disc = L["Misc"] }, -- Silver Shafted Arrow
		{ id = 22261, disc = L["Misc"] }, -- Love Fool
		{ id = 22218, disc = L["Misc"] }, -- Handful of Rose Petals
		{ id = 21813, disc = L["Misc"] }, -- Bag of Candies
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = LM["Box of Chocolates"], icon="INV_ValentinesBoxOfChocolates02" },
		{ id = 22237, disc = L["Consumable"] }, -- Dark Desire
		{ id = 22238, disc = L["Consumable"] }, -- Very Berry Cream
		{ id = 22236, disc = L["Consumable"] }, -- Buttermilk Delight
		{ id = 22239, disc = L["Consumable"] }, -- Sweet Surprise
		{},
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
		{ id = 18633, disc = L["Consumable"] }, -- Styleen's Sour Suckerpop
		{ id = 18632, disc = L["Consumable"] }, -- Moonbrook Riot Taffy
		{ id = 18635, disc = L["Consumable"] }, -- Bellara's Nutterbar
		{ id = 20516, disc = L["Consumable"] }, -- Bobbing Apple
		{ id = 20557, disc = L["Misc"] }, -- Hallow's End Pumpkin Treat
		{},
		{ id = 20389, disc = L["Consumable"] }, -- Candy Corn
		{ id = 20388, disc = L["Consumable"] }, -- Lollipop
		{ id = 20390, disc = L["Consumable"] }, -- Candy Bar
		{},
		{ name = LM["Treat Bag"], icon="INV_Misc_Bag_11" },
		{ id = 20561 }, -- Flimsy Male Dwarf Mask
		{ id = 20391 }, -- Flimsy Male Gnome Mask
		{ name = LM["Treat Bag"], icon="INV_Misc_Bag_11" },
		{ id = 20410, disc = L["Misc"] }, -- Hallowed Wand - Bat
		{ id = 20409, disc = L["Misc"] }, -- Hallowed Wand - Ghost
		{ id = 20399, disc = L["Misc"] }, -- Hallowed Wand - Leper Gnome
		{ id = 20398, disc = L["Misc"] }, -- Hallowed Wand - Ninja
		{ id = 20397, disc = L["Misc"] }, -- Hallowed Wand - Pirate
		{ id = 20413, disc = L["Misc"] }, -- Hallowed Wand - Random
		{ id = 20411, disc = L["Misc"] }, -- Hallowed Wand - Skeleton
		{ id = 20414, disc = L["Misc"] }, -- Hallowed Wand - Wisp
		{},
		{ name = LM["Treat Bag"], icon="INV_Misc_Bag_11" },
		{ id = 20562 }, -- Flimsy Female Dwarf Mask
		{ id = 20392 }, -- Flimsy Female Gnome Mask
		{ id = 20565 }, -- Flimsy Female Human Mask
		{ id = 20563 }, -- Flimsy Female Nightelf Mask
		{ id = 20566 }, -- Flimsy Male Human Mask
		{ id = 20564 }, -- Flimsy Male Nightelf Mask
		{ id = 20570 }, -- Flimsy Male Orc Mask
		{ id = 20572 }, -- Flimsy Male Tauren Mask
		{ id = 20568 }, -- Flimsy Male Troll Mask
		{ id = 20573 }, -- Flimsy Male Undead Mask
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ id = 20569 }, -- Flimsy Female Orc Mask
		{ id = 20571 }, -- Flimsy Female Tauren Mask
		{ id = 20567 }, -- Flimsy Female Troll Mask
		{ id = 20574 }, -- Flimsy Female Undead Mask
	},
	Winterviel = {
		{ id = 21524 }, -- Red Winter Hat
		{ id = 21525 }, -- Green Winter Hat
		{},
		{ id = 17712, disc = L["Quest Reward"] }, -- Winter Veil Disguise Kit
		{ id = 17202, disc = L["Misc"] }, -- Snowball
		{ id = 21212, disc = L["Misc"] }, -- Fresh Holly
		{ id = 21519, disc = L["Misc"] }, -- Mistletoe
		{},
		{ name = LM["Gaily Wrapped Present"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 21301 }, -- Green Helper Box
		{ id = 21305 }, -- Red Helper Box
		{ id = 21308 }, -- Jingling Bell
		{ id = 21309 }, -- Tiny Snowman
		{},
		{ name = L["Smokywood Pastures"], icon="INV_Holiday_Christmas_Present_01" },
		{ name = L["Smokywood Pastures Special Gift"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 17725 }, -- Formula: Enchant Weapon - Winter's Might
		{ id = 17706, container = { 17704 } }, -- Plans: Edge of Winter
		{ id = 17720, container = { 17716 } }, -- Schematic: Snowmaster 9000
		{ id = 17722, container = { 17721 } }, -- Pattern: Gloves of the Greatfather
		{ id = 17709, container = { 17708 } }, -- Recipe: Elixir of Frost Power
		{ id = 17724, container = { 17723 } }, -- Pattern: Green Holiday Shirt
		{},
		{ id = 21325 }, -- Mechanical Greench
		{ id = 21213, disc = L["Quest Reward"] }, -- Preserved Holly
		{},
		{ name = LM["Gently Shaken Gift"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 21235, disc = L["Consumable"] }, -- Winter Veil Roast
		{ id = 21241, disc = L["Consumable"] }, -- Winter Veil Eggnog
		{},
		{ id = 17200, disc = L["Vendor"], container = { 17197 } }, -- Recipe: Gingerbread Cookie
		{ id = 17201, disc = L["Vendor"], container = { 17198 } }, -- Recipe: Egg Nog
		{ id = 17344, disc = L["Vendor"]..", "..L["Consumable"] }, -- Candy Cane
		{ id = 17406, disc = L["Vendor"]..", "..L["Consumable"] }, -- Holiday Cheesewheel
		{ id = 17407, disc = L["Vendor"]..", "..L["Consumable"] }, -- Graccu's Homemade Meat Pie
		{ id = 17408, disc = L["Vendor"]..", "..L["Consumable"] }, -- Spicy Beefstick
		{ id = 17404, disc = L["Vendor"]..", "..L["Consumable"] }, -- Blended Bean Brew
		{ id = 17405, disc = L["Vendor"]..", "..L["Consumable"] }, -- Green Garden Tea
		{ id = 17196, disc = L["Vendor"]..", "..L["Consumable"] }, -- Holiday Spirits
		{ id = 17403, disc = L["Vendor"]..", "..L["Consumable"] }, -- Steamwheedle Fizzy Spirits
		{ id = 17402, disc = L["Vendor"]..", "..L["Consumable"] }, -- Greatfather's Winter Ale
		{ id = 17194, disc = L["Vendor"]..", "..L["Reagent"] }, -- Holiday Spices
		{ id = 17303, disc = L["Vendor"]..", "..L["Misc"] }, -- Blue Ribboned Wrapping Paper
		{ id = 17304, disc = L["Vendor"]..", "..L["Misc"] }, -- Green Ribboned Wrapping Paper
		{ id = 17307, disc = L["Vendor"]..", "..L["Misc"] }, -- Purple Ribboned Wrapping Paper
		{ name = LM["Snowball"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 93080, disc = L["Quest Reward"] }, -- Sack of Winter Veil Presents
		{},
		{ name = LM["Festive Gift"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 21328, disc = L["Misc"] }, -- Wand of Holiday Cheer
		{},
		{ id = 51250, disc = L["Quest Reward"] }, -- Miniature Winter Veil Tree
		{ id = 51251, disc = L["Quest Reward"] }, -- Hedwig
		{ id = 51060, disc = L["Quest Reward"], container = { 21301, 21305, 21309, 21525, 50059, 50060, 21524, 50061, 51061, 51062 } }, -- Winter Veil Gift Box
		{},
		{ name = L["Smokywood Pastures"], icon="INV_Holiday_Christmas_Present_01" },
		{ id = 21215, disc = L["Consumable"] }, -- Graccu's Mince Meat Fruitcake
	},
	Noblegarden = {
		{ name = LM["Brightly Colored Egg"], icon="INV_Egg_03" },
		{ id = 19028 }, -- Elegant Dress
		{ id = 6833 }, -- White Tuxedo Shirt
		{ id = 6835 }, -- Black Tuxedo Pants
		{},
		{ id = 7807, disc=L["Consumable"] }, -- Candy Bar
		{ id = 7808, disc=L["Consumable"] }, -- Chocolate Square
		{ id = 7806, disc=L["Consumable"] }, -- Lollipop
	},
	HarvestFestival = {
		--{ id = 19697 }, -- Bounty of the Harvest
		{ id = 20009, disc=L["Misc"] }, -- For the Light!
		{ id = 20010, disc=L["Misc"] }, -- The Horde's Hellscream
		{},
		{ id = 19995, disc=L["Consumable"] }, -- Harvest Boar
		{ id = 19996, disc=L["Consumable"] }, -- Harvest Fish
		{ id = 19994, disc=L["Consumable"] }, -- Harvest Fruit
		{ id = 19997, disc=L["Consumable"] }, -- Harvest Nectar
		{ id = 19696, disc=L["Consumable"] }, -- Harvest Bread
	},
	ScourgeInvasionF = {
		{ id = 23123, container = {12844}, disc = L["Need quest"] }, -- Blessed Wizard Oil
		{ id = 23122, container = {12844}, disc = L["Need quest"] }, -- Consecrated Sharpening Stone

		{ id = 22999 }, -- Tabard of the Argent Dawn
		{ id = 22484, disc = L["Quest Item"] }, -- Necrotic Rune

		{},
		{ name = LIS["Regalia of Undead Cleansing"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23085 }, -- Robe of Undead Cleansing
		{ id = 23091 }, -- Bracers of Undead Cleansing
		{ id = 23084 }, -- Gloves of Undead Cleansing
		{},
		{ name = LIS["Undead Slayer's Armor"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23089 }, -- Tunic of Undead Slaying
		{ id = 23093 }, -- Wristwraps of Undead Slaying
		{ id = 23081 }, -- Handwraps of Undead Slaying
		{},
		{ id = 23194, disc = L["Consumable"] }, -- Lesser Mark of the Dawn
		{ id = 23195, disc = L["Consumable"] }, -- Mark of the Dawn
		{ id = 23196, disc = L["Consumable"] }, -- Greater Mark of the Dawn
		{},
		{},
		{ name = LIS["Garb of the Undead Slayer"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23088 }, -- Chestguard of Undead Slaying
		{ id = 23092 }, -- Wristguards of Undead Slaying
		{ id = 23082 }, -- Handguards of Undead Slaying
		{},
		{ name = LIS["Battlegear of Undead Slaying"], icon="INV_Jewelry_Talisman_13" },
		{ id = 23087 }, -- Breastplate of Undead Slaying
		{ id = 23090 }, -- Bracers of Undead Slaying
		{ id = 23078 }, -- Gauntlets of Undead Slaying
		{},
		{ name = LB["Balzaphon"], info = LZ["Stratholme"] },
		{ id = 23126, dropRate = 27.38 }, -- Waistband of Balzaphon
		{ id = 23125, dropRate = 19.89 }, -- Chains of the Lich
		{ id = 23124, dropRate = 24.74 }, -- Staff of Balzaphon
		{},
		{ name = LB["Lord Blackwood"], info = LZ["Scholomance"] },
		{ id = 23132, dropRate = 12.83 }, -- Lord Blackwood's Blade
		{ id = 23156, dropRate = 45.21 }, -- Blackwood's Thigh
		{ id = 23139, dropRate = 38.75 }, -- Lord Blackwood's Buckler
		{},
		{ name = LB["Revanchion"], info = LZ["Dire Maul (West)"] },
		{ id = 23127, dropRate = 38.49 }, -- Cloak of Revanchion
		{ id = 23129, dropRate = 39.61 }, -- Bracers of Mending
		{ id = 23128, dropRate = 21.81 }, -- The Shadow's Grasp
		{},
		{ name = LB["Scorn"], info = LZ["Scarlet Monastery (Cathedral)"] },
		{ id = 23169, dropRate = 27.49 }, -- Scorn's Icy Choker
		{ id = 23170, dropRate = 56.15 }, -- The Frozen Clutch
		{ id = 23168, dropRate = 16.36 }, -- Scorn's Focal Dagger
		{},
		{ name = LB["Sever"], info = LZ["Shadowfang Keep"] },
		{ id = 23173, dropRate = 76.87 }, -- Abomination Skin Leggings
		{ id = 23171, dropRate = 22.94 }, -- The Axe of Severing
		{},
		{ name = LB["Lady Falther'ess"], info = LZ["Razorfen Downs"] },
		{ id = 23178, dropRate = 61.24 }, -- Mantle of Lady Falther'ess
		{ id = 23177, dropRate = 38.17 }, -- Lady Falther'ess' Finger
	},
	LunarFestival = {
		{ id = 21100, disc = L["Quest Item"] }, -- Coin of Ancestry
		{},
		{ id = 21537, disc = L["Consumable"], container = { 21640, { 21100, 1 } } }, -- Festival Dumplings
		{ id = 21737, container = { 21570, 21640, { 21100, 5 } } }, -- Schematic: Cluster Launcher
		{ id = 21741, disc = L["Container"], container = { 21730, 21731, 21732, 21640, { 21100, 5 } } }, -- Cluster Rocket Recipes
		{ id = 21713, disc = L["Misc"], container = { 21640, { 21100, 5 } } }, -- Elune's Candle
		{ id = 21157, container = { 21640, 21538, 21539, { 21100, 5 } } }, -- Lunar Dresses
		{ id = 21541, container = { 21640, 21544, 21543, { 21100, 5 } } }, -- Lunar Pant Suits
		{ id = 21722, container = { 21640, 21723, { 21100, 5 } } }, -- Recipes
		{ id = 21738, container = { 21640, { 21100, 5 } } }, -- Launcher
		{ id = 21743, disc = L["Container"], container = { 21733, 21734, 21735, 21640, { 21100, 5 } } }, -- Large Cluster Rockets
		{ id = 21742, disc = L["Container"], container = { 21727, 21728, 21729, 21640, { 21100, 5 } } }, -- Large Rockets
		{ id = 21740, disc = L["Container"], container = { 21724, 21725, 21726, 21640, { 21100, 5 } } }, -- Small Rockets
		{},
		{ id = 21640, disc = L["Container"], container = { 21592, 21593, 21595, 21590, 21589, 21562, 21561, 21557, 21559, 21558 } }, -- Lunar Festival Fireworks Pack
		{ id = 21746, disc = L["Container"], container = { 21744, 21745 } }, -- Lucky Red Envelope
		{},
		{ id = 41701, disc = L["Container"], container = { 41707, 21540, 93088, 93090, 93091, 41702, 41703, 50067, 17963,
			17964, 17965, 17969, 69132, 69131, 69130, 69129, 69128, 69127, {21589,{1,2}}, {21590,{1,2}}, {21592,{1,2}},
			{21593,{1,2}}, {21595,{1,2}}, {21557,{2,3}}, {21558,{2,3}}, {21559,{2,3}}, {21561,{2,3}}, {21562,{2,3}} } }, -- Elune's Gift
		{},
		{ id = 41704, disc = L["Container"], container = { 21540, 93088, 93090, 93091, 41702, 41703, 50067, 69132, 69131,
			69130, 69129, 69128, 69127, {21589,{1,2}}, {21590,{1,2}}, {21592,{1,2}}, {21593,{1,2}}, {21595,{1,2}} } }, -- Lunar Festival Gift Box
		{},
		{ id = 21536 }, -- Elune Stone
	},
	MidsummerFestival = {
		{ id = 23379 }, -- Cinder Bracers
		{},
		{ id = 23323 }, -- Crown of the Fire Festival
		{ id = 23324 }, -- Mantle of the Fire Festival
		{},
		{ id = 23083 }, -- Spirit of Summer
		{ id = 23247, disc = L["Misc"] }, -- Burning Blossom
		{ id = 23246, disc = L["Misc"] }, -- Fiery Festival Brew
		{ id = 23435, disc = L["Consumable"] }, -- Elderberry Pie
		{ id = 23327, disc = L["Consumable"] }, -- Fire-toasted Bun
		{ id = 23326, disc = L["Consumable"] }, -- Midsummer Sausage
		{ id = 23211, disc = L["Consumable"] }, -- Toasted Smorc
	}
}

for k, v in pairs(WorldEvents) do
	AtlasTWLoot_Data[k] = v
end