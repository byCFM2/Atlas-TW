local L = AtlasTW.Local
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BS = AceLibrary("Babble-Spell-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

local craftingTable = {
	Poisons = {
		{ name = BS["Poisons"], icon = "Trade_BrewPoison" },
		{ id=8681, skill={1,125,150,175}}, --Instant Poison
		{ id=8687, skill={120,165,190,215}}, --Instant Poison II
		{ id=8691, skill={160,205,230,255}}, --Instant Poison III
		{ id=11341, skill={200,245,270,295}}, --Instant Poison IV
		{ id=11342, skill={240,285,310,335}}, --Instant Poison V
		{ id=11343, skill={280,325,350,375}}, --Instant Poison VI
		{},
		{ id=3420, skill={1,125,150,175}}, --Crippling Poison
		{ id=3421, skill={230,275,300,325}}, --Crippling Poison II
		{},
		{ id=5763, skill={120,150,175,200}}, --Mind-numbing Poison
		{ id=8694, skill={200,215,240,265}}, --Mind-numbing Poison II
		{ id=11400, skill={280,285,310,335}}, --Mind-numbing Poison III
		{},
		{ name = BS["Poisons"], icon = "Trade_BrewPoison" },
		{ id=2835, skill={130,175,200,225}}, --Deadly Poison
		{ id=2837, skill={170,215,240,265}}, --Deadly Poison II
		{ id=11357, skill={210,255,280,305}}, --Deadly Poison III
		{ id=11358, skill={250,295,320,345}}, --Deadly Poison IV
		{ id=25347, skill={270,315,340,365}}, --Deadly Poison V
		{},
		{ id=13220, skill={140,185,210,235}}, --Wound Poison
		{ id=13228, skill={180,225,250,275}}, --Wound Poison II
		{ id=13229, skill={220,265,290,315}}, --Wound Poison III
		{ id=13230, skill={260,305,330,355}}, --Wound Poison IV
		{},
		{ id=45611, skill={290,290,300,310}}, --Agitating Poison I
		{ name = L["Reagent"], icon = "Trade_BrewPoison" },
		{ id=6510, quantity = 3, skill={1,170,195,220}}, --Blinding Powder
	},

	AlchemyApprentice = {
		{ name = L["Apprentice"], icon = "Trade_Alchemy" },
		{ id=2329, skill={1,55,75,95} }, --Elixir of Lion's Strength
		{ id=7183, skill={1,55,75,95} }, --Elixir of Minor Defense
		{ id=2330, skill={1,55,75,95} }, --Minor Healing Potion
		{ id=3170, skill={15,60,80,100} }, --Weak Troll's Blood Potion
		{ id=2331, skill={25,65,85,105} }, --Minor Mana Potion
		{ id=2332, skill={40,70,90,110} }, --Minor Rejuvenation Potion
		{ id=4508, skill={50,80,100,120} }, --Discolored Healing Potion
		{ id=3230, skill={50,80,100,120} }, --Elixir of Minor Agility
		{ id=2334, skill={50,80,100,120} }, --Elixir of Minor Fortitude
		{ id=2337, skill={55,85,105,125} }, --Lesser Healing Potion
		{ id=6617, skill={60,90,110,130} }, --Rage Potion
		{ id=2335, skill={60,90,110,130} }, --Swiftness Potion
		{ id=15003, skill={75,110,125,140} }, --Volatile Concoction
	},
	AlchemyJourneyman = {
		{ name = L["Journeyman"], icon = "Trade_Alchemy" },
		{ id=7836, skill={80,80,90,100} }, --Blackmouth Oil
		{ id=8240, skill={90,120,140,160} }, --Elixir of Giant Growth
		{ id=7179, skill={90,120,140,160} }, --Elixir of Water Breathing
		{ id=3171, skill={90,120,140,160} }, --Elixir of Wisdom
		{ id=7255, skill={100,130,150,170} }, --Holy Protection Potion
		{ id=7841, skill={100,130,150,170} }, --Swim Speed Potion
		{ id=3447, skill={110,135,155,175} }, --Healing Potion
		{ id=3172, skill={110,135,155,175} }, --Minor Magic Resistance Potion
		{ id=3173, skill={120,145,165,185} }, --Lesser Mana Potion
		{ id=3174, skill={120,145,165,185} }, --Elixir of Poison Resistance
		{ id=3176, skill={125,150,170,190} }, --Strong Troll's Blood Potion
		{ id=7837, skill={130,150,160,170} }, --Fire Oil
		{ id=3177, skill={130,155,175,195} }, --Elixir of Defense
		{ id=7256, skill={135,160,180,200} }, --Shadow Protection Potion
		{ name = L["Journeyman"], icon = "Trade_Alchemy" },
		{ id=7845, skill={140,165,185,205} }, --Elixir of Firepower
		{ id=2333, skill={140,165,185,205} }, --Elixir of Lesser Agility
		{ id=3188, skill={150,175,195,215} }, --Elixir of Ogre's Strength
		{ id=6624, skill={150,175,195,215} }, --Free Action Potion
	},
	AlchemyExpert = {
		{ name = L["Expert"], icon = "Trade_Alchemy" },
		{ id=7181, skill={155,175,195,215} }, --Greater Healing Potion
		{ id=3452, skill={160,180,200,220} }, --Mana Potion
		{ id=3448, skill={165,185,205,225} }, --Lesser Invisibility Potion
		{ id=3449, skill={165,190,210,230} }, --Shadow Oil
		{ id=7257, skill={165,210,230,250} }, --Fire Protection Potion
		{ id=3450, skill={175,195,215,235} }, --Elixir of Fortitude
		{ id=6618, skill={175,195,215,235} }, --Great Rage Potion
		{ id=3451, skill={180,200,220,240} }, --Mighty Troll's Blood Potion
		{ id=11449, skill={185,205,225,245} }, --Elixir of Agility
		{ id=7258, skill={190,205,225,245} }, --Frost Protection Potion
		{ id=21923, skill={190,210,230,250} }, --Elixir of Frost Power
		{ id=7259, skill={190,210,230,250} }, --Nature Protection Potion
		{ id=3453, skill={195,215,235,255} }, --Elixir of Detect Lesser Invisibility
		{ id=11450, skill={195,215,235,255} }, --Elixir of Greater Defense
		{ name = L["Expert"], icon = "Trade_Alchemy" },
		{ id=12609, skill={200,220,240,260} }, --Catseye Elixir
		{ id=3454, skill={200,220,240,260} }, --Frost Oil
		{ id=11459, skill={200,240,260,280} }, --Philosopher's Stone
		{ id=11448, skill={205,220,240,260} }, --Greater Mana Potion
		{ id=11451, skill={205,220,240,260} }, --Oil of Immolation
		{ id=11456, skill={210,225,245,265} }, --Goblin Rocket Fuel
		{ id=11453, skill={210,225,245,265} }, --Magic Resistance Potion
		{ id=11452, skill={210,225,245,265} }, --Restorative Potion
		{ id=22808, skill={215,230,250,270} }, --Elixir of Greater Water Breathing
		{ id=4942, skill={215,230,250,270} }, --Lesser Stoneshield Potion
		{ id=11457, skill={215,230,250,270} }, --Superior Healing Potion
		{ id=11458, skill={225,240,260,280} }, --Wildvine Potion
		{ id=11479, skill={225,240,260,280} }, --Transmute: Iron to Gold
		{ id=11480, skill={225,240,260,280} }, --Transmute: Mithril to Truesilver
	},
	AlchemyArtisan = {
		{ name = L["Artisan"], icon = "Trade_Alchemy" },
		{ id=15833, skill={230,245,265,285} }, --Dreamless Sleep Potion
		{ id=11460, skill={230,245,265,285} }, --Elixir of Detect Undead
		{ id=11461, skill={235,250,270,290} }, --Arcane Elixir
		{ id=11465, skill={235,250,270,290} }, --Elixir of Greater Intellect
		{ id=11464, skill={235,250,270,290} }, --Invisibility Potion
		{ id=11468, skill={240,255,275,295} }, --Elixir of Dream Vision
		{ id=11467, skill={240,255,275,295} }, --Elixir of Greater Agility
		{ id=11466, skill={240,255,275,295} }, --Gift of Arthas
		{ id=11473, skill={245,260,280,300} }, --Ghost Dye
		{ id=11472, skill={245,260,280,300} }, --Elixir of Giants
		{ id=17551, skill={250,250,255,260} }, --Stonescale Oil
		{ id=11477, skill={250,265,285,305} }, --Elixir of Demonslaying
		{ id=11478, skill={250,265,285,305} }, --Elixir of Detect Demon
		{ id=26277, skill={250,265,285,305} }, --Elixir of Greater Firepower
		{ name = L["Artisan"], icon = "Trade_Alchemy" },
		{ id=11476, skill={250,265,285,305} }, --Elixir of Shadow Power
		{ id=3175, skill={250,275,295,315} }, --Limited Invulnerability Potion
		{ id=17552, skill={255,270,290,310} }, --Mighty Rage Potion
		{ id=17553, skill={260,275,295,315} }, --Superior Mana Potion
		{ id=17554, skill={265,280,300,320} }, --Elixir of Superior Defense
		{ id=17555, skill={265,280,300,320} }, --Elixir of the Sages
		{ id=17187, skill={275,275,282,290} }, --Transmute: Arcanite
		{ id=17559, skill={275,275,282,290} }, --Transmute: Air to Fire
		{ id=17566, skill={275,275,282,290} }, --Transmute: Earth to Life
		{ id=17561, skill={275,275,282,290} }, --Transmute: Earth to Water
		{ id=17560, skill={275,275,282,290} }, --Transmute: Fire to Earth
		{ id=17565, skill={275,275,282,290} }, --Transmute: Life to Earth
		{ id=17563, skill={275,275,282,290} }, --Transmute: Undeath to Water
		{ id=17562, skill={275,275,282,290} }, --Transmute: Water to Air
		{ name = L["Artisan"], icon = "Trade_Alchemy" },
		{ id=17564, skill={275,275,282,290} }, --Transmute: Water to Undeath
		{ id=17557, skill={275,290,310,330} }, --Elixir of Brute Force
		{ id=24366, skill={275,290,310,330} }, --Greater Dreamless Sleep Potion
		{ id=24365, skill={275,290,310,330} }, --Mageblood Potion
		{ id=17556, skill={275,290,310,330} }, --Major Healing Potion
		{ id=17571, skill={280,295,315,335} }, --Elixir of the Mongoose
		{ id=17570, skill={280,295,315,335} }, --Greater Stoneshield Potion
		{ id=17573, skill={285,300,320,340} }, --Greater Arcane Elixir
		{ id=24367, skill={285,300,320,340} }, --Living Action Potion
		{ id=17572, skill={285,300,320,340} }, --Purification Potion
		{ id=17577, skill={290,305,325,345} }, --Greater Arcane Protection Potion
		{ id=17574, skill={290,305,325,345} }, --Greater Fire Protection Potion
		{ id=17575, skill={290,305,325,345} }, --Greater Frost Protection Potion
		{ id=17576, skill={290,305,325,345} }, --Greater Nature Protection Potion
		{ name = L["Artisan"], icon = "Trade_Alchemy" },
		{ id=17578, skill={290,305,325,345} }, --Greater Shadow Protection Potion
		{ id=17579, skill={290,305,325,345} }, --Greater Holy Protection Potion
		{ id=24368, skill={290,305,325,345} }, --Major Troll's Blood Potion
		{ id=17580, skill={295,310,330,350} }, --Major Mana Potion
		{ id=25146, skill={300,301,305,310} }, --Transmute: Elemental Fire
		{ id=57555, skill={300,315,322,330} }, --Transmute: Elemental Earth
		{ id=57557, skill={300,315,322,330} }, --Transmute: Elemental Water
		{ id=22732, skill={300,310,320,330} }, --Major Rejuvenation Potion
		{ id=17638, skill={300,315,322,330} }, --Flask of Chromatic Resistance
		{ id=17636, skill={300,315,322,330} }, --Flask of Distilled Wisdom
		{ id=17634, skill={300,315,322,330} }, --Flask of Petrification
		{ id=17637, skill={300,315,322,330} }, --Flask of Supreme Power
		{ id=17635, skill={300,315,322,330} }, --Flask of the Titans
		{ id=24266, skill={300,315,322,330} }, --Gurubashi Mojo Madness
		{ name = L["Artisan"], icon = "Trade_Alchemy" },
		{ id=57131, skill={300,315,322,330} }, --Dreamshard Elixir
		{ id=57129, skill={300,315,322,330} }, --Lucidity Potion
		{ id=45989, skill={300,315,322,330} }, --Elixir of Greater Nature Power
		{ id=57111, skill={300,315,322,330} }, --Potion of Quickness
		{ id=17640, skill={300,315,322,330} }, --Alchemist's Stone
	},

	AlchemyFlasks = {
		{ name = L["Flasks"], icon = "Trade_Alchemy" },
		{ id=17638, skill={300,315,322,330} }, --Flask of Chromatic Resistance
		{ id=17634, skill={300,315,322,330} }, --Flask of Petrification
		{ id=17636, skill={300,315,322,330} }, --Flask of Distilled Wisdom
		{ id=17637, skill={300,315,322,330} }, --Flask of Supreme Power
		{ id=17635, skill={300,315,322,330} }, --Flask of the Titans
	},

	AlchemyProtectionPots = {
		{ name = L["Protection Potions"], icon = "Trade_Alchemy" },
		{ id=7255, skill={100,130,150,170} }, --Holy Protection Potion
		{ id=7256, skill={135,160,180,200} }, --Shadow Protection Potion
		{ id=7257, skill={165,210,230,250} }, --Fire Protection Potion
		{ id=7258, skill={190,205,225,245} }, --Frost Protection Potion
		{ id=7259, skill={190,210,230,250} }, --Nature Protection Potion
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{ name = L["Protection Potions"], icon = "Trade_Alchemy" },
		{ id=17577, skill={290,305,325,345} }, --Greater Arcane Protection Potion
		{ id=17574, skill={290,305,325,345} }, --Greater Fire Protection Potion
		{ id=17575, skill={290,305,325,345} }, --Greater Frost Protection Potion
		{ id=17576, skill={290,305,325,345} }, --Greater Nature Protection Potion
		{ id=17578, skill={290,305,325,345} }, --Greater Shadow Protection Potion
		{ id=17579, skill={290,305,325,345} }, --Greater Holy Protection Potion
	},

	AlchemyHealingAndMana = {
		{ name = L["Healing and Mana Potions"], icon = "Trade_Alchemy" },
		{ id=2330, skill={1,55,75,95} }, --Minor Healing Potion
		{ id=4508, skill={50,80,100,120} }, --Discolored Healing Potion
		{ id=2337, skill={55,85,105,125} }, --Lesser Healing Potion
		{ id=3447, skill={110,135,155,175} }, --Healing Potion
		{ id=7181, skill={155,175,195,215} }, --Greater Healing Potion
		{ id=11457, skill={215,230,250,270} }, --Superior Healing Potion
		{ id=17556, skill={275,290,310,330} }, --Major Healing Potion
		{},
		{ id=2331, skill={25,65,85,105} }, --Minor Mana Potion
		{ id=3173, skill={120,145,165,185} }, --Lesser Mana Potion
		{ id=3452, skill={160,180,200,220} }, --Mana Potion
		{ id=11448, skill={205,220,240,260} }, --Greater Mana Potion
		{ id=17553, skill={260,275,295,315} }, --Superior Mana Potion
		{ id=17580, skill={295,310,330,350} }, --Major Mana Potion
		{ name = L["Healing and Mana Potions"], icon = "Trade_Alchemy" },
		{ id=2332, skill={40,70,90,110} }, --Minor Rejuvenation Potion
		{ id=11458, skill={225,240,260,280} }, --Wildvine Potion
		{ id=15833, skill={230,245,265,285} }, --Dreamless Sleep Potion
		{ id=24366, skill={275,290,310,330} }, --Greater Dreamless Sleep Potion
		{ id=22732, skill={300,310,320,330} }, --Major Rejuvenation Potion
		{},
		{ id=24365, skill={275,290,310,330} }, --Mageblood Potion
	},

	AlchemyTransmutes = {
		{ name = L["Transmutes"], icon = "Trade_Alchemy" },
		{ id=11479, skill={225,240,260,280} }, --Transmute: Iron to Gold
		{ id=11480, skill={225,240,260,280} }, --Transmute: Mithril to Truesilver
		{ id=17559, skill={275,275,282,290} }, --Transmute: Air to Fire
		{ id=17566, skill={275,275,282,290} }, --Transmute: Earth to Life
		{ id=17561, skill={275,275,282,290} }, --Transmute: Earth to Water
		{ id=17560, skill={275,275,282,290} }, --Transmute: Fire to Earth
		{ id=17565, skill={275,275,282,290} }, --Transmute: Life to Earth
		{ id=17563, skill={275,275,282,290} }, --Transmute: Undeath to Water
		{ id=17562, skill={275,275,282,290} }, --Transmute: Water to Air
		{ id=17564, skill={275,275,282,290} }, --Transmute: Water to Undeath
		{ id=17187, skill={275,275,282,290} }, --Transmute: Arcanite
		{ id=25146, skill={300,301,305,310} }, --Transmute: Elemental Fire
		{ id=57555, skill={300,315,322,330} }, --Transmute: Elemental Earth
		{ id=57557, skill={300,315,322,330} }, --Transmute: Elemental Water
	},

	AlchemyDefensive = {
		{ name = L["Defensive Potions and Elixirs"], icon = "Trade_Alchemy" },
		{ id=7183, skill={1,55,75,95} }, --Elixir of Minor Defense
		{ id=3177, skill={130,155,175,195} }, --Elixir of Defense
		{ id=11450, skill={195,215,235,255} }, --Elixir of Greater Defense
		{ id=17554, skill={265,280,300,320} }, --Elixir of Superior Defense
		{},
		{ id=3170, skill={15,60,80,100} }, --Weak Troll's Blood Potion
		{ id=3176, skill={125,150,170,190} }, --Strong Troll's Blood Potion
		{ id=3451, skill={180,200,220,240} }, --Mighty Troll's Blood Potion
		{ id=24368, skill={290,305,325,345} }, --Major Troll's Blood Potion
		{},
		{ id=2334, skill={50,80,100,120} }, --Elixir of Minor Fortitude
		{ id=3450, skill={175,195,215,235} }, --Elixir of Fortitude
		{},
		{ id=11466, skill={240,255,275,295} }, --Gift of Arthas
		{ name = L["Defensive Potions and Elixirs"], icon = "Trade_Alchemy" },
		{ id=3172, skill={110,135,155,175} }, --Minor Magic Resistance Potion
		{ id=11453, skill={210,225,245,265} }, --Magic Resistance Potion
		{ id=4942, skill={215,230,250,270} }, --Lesser Stoneshield Potion
		{ id=17570, skill={280,295,315,335} }, --Greater Stoneshield Potion
		{},
		{ id=6624, skill={150,175,195,215} }, --Free Action Potion
		{ id=57129, skill={300,315,322,330} }, --Lucidity Potion
		{ id=11452, skill={210,225,245,265} }, --Restorative Potion
		{},
		{ id=3174, skill={120,145,165,185} }, --Elixir of Poison Resistance
		{ id=17572, skill={285,300,320,340} }, --Purification Potion
		{},
		{ id=3175, skill={250,275,295,315} }, --Limited Invulnerability Potion
		{ id=24367, skill={285,300,320,340} }, --Living Action Potion
	},

	AlchemyOffensive = {
		{ name = L["Offensive Potions and Elixirs"], icon = "Trade_Alchemy" },
		{ id=2329, skill={1,55,75,95} }, --Elixir of Lion's Strength
		{ id=3188, skill={150,175,195,215} }, --Elixir of Ogre's Strength
		{ id=8240, skill={90,120,140,160} }, --Elixir of Giant Growth
		{ id=11472, skill={245,260,280,300} }, --Elixir of Giants
		{ id=17557, skill={275,290,310,330} }, --Elixir of Brute Force
		{},
		{ id=3230, skill={50,80,100,120} }, --Elixir of Minor Agility
		{ id=2333, skill={140,165,185,205} }, --Elixir of Lesser Agility
		{ id=11449, skill={185,205,225,245} }, --Elixir of Agility
		{ id=11467, skill={240,255,275,295} }, --Elixir of Greater Agility
		{ id=17571, skill={280,295,315,335} }, --Elixir of the Mongoose
		{},
		{ id=3171, skill={90,120,140,160} }, --Elixir of Wisdom
		{ id=11465, skill={235,250,270,290} }, --Elixir of Greater Intellect
		{ name = L["Offensive Potions and Elixirs"], icon = "Trade_Alchemy" },
		{ id=6617, skill={60,90,110,130} }, --Rage Potion
		{ id=6618, skill={175,195,215,235} }, --Great Rage Potion
		{ id=17552, skill={255,270,290,310} }, --Mighty Rage Potion
		{ id=7845, skill={140,165,185,205} }, --Elixir of Firepower
		{ id=21923, skill={190,210,230,250} }, --Elixir of Frost Power
		{ id=11461, skill={235,250,270,290} }, --Arcane Elixir
		{ id=26277, skill={250,265,285,305} }, --Elixir of Greater Firepower
		{ id=11476, skill={250,265,285,305} }, --Elixir of Shadow Power
		{ id=17573, skill={285,300,320,340} }, --Greater Arcane Elixir
		{ id=45989, skill={300,315,322,330} }, --Elixir of Greater Nature Power
		{ id=57131, skill={300,315,322,330} }, --Dreamshard Elixir
		{},
		{},
		{},
		{ id=17555, skill={265,280,300,320} }, --Elixir of the Sages
		{ id=15003, skill={75,110,125,140} }, --Volatile Concoction
		{ id=11477, skill={250,265,285,305} }, --Elixir of Demonslaying
		{ id=57111, skill={300,315,322,330} }, --Potion of Quickness
	},

	AlchemyOther = {
		{ name = L["Other"], icon = "Trade_Alchemy" },
		{ id=7836, skill={80,80,90,100} }, --Blackmouth Oil
		{ id=7837, skill={130,150,160,170} }, --Fire Oil
		{ id=17551, skill={250,250,255,260} }, --Stonescale Oil
		{},
		{ id=7179, skill={90,120,140,160} }, --Elixir of Water Breathing
		{ id=22808, skill={215,230,250,270} }, --Elixir of Greater Water Breathing
		{},
		{ id=2335, skill={60,90,110,130} }, --Swiftness Potion
		{ id=7841, skill={100,130,150,170} }, --Swim Speed Potion
		{},
		{ id=11459, skill={200,240,260,280} }, --Philosopher's Stone
		{ id=11456, skill={210,225,245,265} }, --Goblin Rocket Fuel
		{ id=11473, skill={245,260,280,300} }, --Ghost Dye
		{ id=24266, skill={300,315,322,330} }, --Gurubashi Mojo Madness
		{ name = L["Other"], icon = "Trade_Alchemy" },
		{ id=3453, skill={195,215,235,255} }, --Elixir of Detect Lesser Invisibility
		{ id=12609, skill={200,220,240,260} }, --Catseye Elixir
		{},
		{ id=3449, skill={165,190,210,230} }, --Shadow Oil
		{ id=3454, skill={200,220,240,260} }, --Frost Oil
		{ id=11451, skill={205,220,240,260} }, --Oil of Immolation
		{},
		{ id=3448, skill={165,185,205,225} }, --Lesser Invisibility Potion
		{ id=11464, skill={235,250,270,290} }, --Invisibility Potion
		{},
		{ id=11460, skill={230,245,265,285} }, --Elixir of Detect Undead
		{ id=11468, skill={240,255,275,295} }, --Elixir of Dream Vision
		{ id=11478, skill={250,265,285,305} }, --Elixir of Detect Demon
		{},
		{ id=17640, skill={300,315,322,330} }, --Alchemist's Stone
	},

	EnchantingApprentice = {
		{ name = L["Apprentice"], icon = "Trade_Engraving" },
		{ id=7421, skill={1,5,7,10} }, --Runed Copper Rod
		{ id=7418, skill={1,70,90,110} }, --Enchant Bracer - Minor Health
		{ id=7428, skill={1,80,100,120} }, --Enchant Bracer - Minor Deflect
		{ id=14293, skill={10,75,95,115} }, --Lesser Magic Wand
		{ id=7420, skill={15,70,90,110} }, --Enchant Chest - Minor Health
		{ id=7443, skill={20,80,100,120} }, --Enchant Chest - Minor Mana
		{ id=7426, skill={40,90,110,130} }, --Enchant Chest - Minor Absorption
		{ id=25124, skill={45,55,65,75} }, --Minor Wizard Oil
		{ id=7454, skill={45,95,115,135} }, --Enchant Cloak - Minor Resistance
		{ id=7457, skill={50,100,120,140} }, --Enchant Bracer - Minor Stamina
		{ id=7766, skill={60,105,125,145} }, --Enchant Bracer - Minor Spirit
		{ id=7748, skill={60,105,125,145} }, --Enchant Chest - Lesser Health
		{ id=7771, skill={70,110,130,150} }, --Enchant Cloak - Minor Protection
		{ id=14807, skill={70,110,130,150} }, --Greater Magic Wand
		{ id=45071, skill={75,115,135,155} }, --Enchant 2H Weapon - Minor Intellect
	},

	EnchantingJourneyman = {
		{ name = L["Journeyman"], icon = "Trade_Engraving" },
		{ id=7779, skill={80,115,135,155} }, --Enchant Bracer - Minor Agility
		{ id=7782, skill={80,115,135,155} }, --Enchant Bracer - Minor Strength
		{ id=7776, skill={80,115,135,155} }, --Enchant Chest - Lesser Mana
		{ id=7786, skill={90,120,140,160} }, --Enchant Weapon - Minor Beastslayer
		{ id=7788, skill={90,120,140,160} }, --Enchant Weapon - Minor Striking
		{ id=7793, skill={100,130,150,170} }, --Enchant 2H Weapon - Lesser Intellect
		{ id=7745, skill={100,130,150,170} }, --Enchant 2H Weapon - Minor Impact
		{ id=7795, skill={100,130,150,170} }, --Runed Silver Rod
		{ id=13378, skill={105,130,150,170} }, --Enchant Shield - Minor Stamina
		{ id=13380, skill={110,135,155,175} }, --Enchant 2H Weapon - Lesser Spirit
		{ id=13419, skill={110,135,155,175} }, --Enchant Cloak - Minor Agility
		{ id=13421, skill={115,140,160,180} }, --Enchant Cloak - Lesser Protection
		{ id=13464, skill={115,140,160,180} }, --Enchant Shield - Lesser Protection
		{ id=7859, skill={120,145,165,185} }, --Enchant Bracer - Lesser Spirit
		{ name = L["Journeyman"], icon = "Trade_Engraving" },
		{ id=7857, skill={120,145,165,185} }, --Enchant Chest - Health
		{ id=7867, skill={125,150,170,190} }, --Enchant Boots - Minor Agility
		{ id=7863, skill={125,150,170,190} }, --Enchant Boots - Minor Stamina
		{ id=7861, skill={125,150,170,190} }, --Enchant Cloak - Lesser Fire Resistance
		{ id=13501, skill={130,155,175,195} }, --Enchant Bracer - Lesser Stamina
		{ id=13485, skill={130,155,175,195} }, --Enchant Shield - Lesser Spirit
		{ id=13522, skill={135,160,180,200} }, --Enchant Cloak - Lesser Shadow Resistance
		{ id=13536, skill={140,165,185,205} }, --Enchant Bracer - Lesser Strength
		{ id=13538, skill={140,165,185,205} }, --Enchant Chest - Lesser Absorption
		{ id=13503, skill={140,165,185,205} }, --Enchant Weapon - Lesser Striking
		{ id=13529, skill={145,170,190,210} }, --Enchant 2H Weapon - Lesser Impact
		{ id=13607, skill={145,170,190,210} }, --Enchant Chest - Mana
		{ id=13620, skill={145,170,190,210} }, --Enchant Gloves - Fishing
		{ id=13617, skill={145,170,190,210} }, --Enchant Gloves - Herbalism
		{ name = L["Journeyman"], icon = "Trade_Engraving" },
		{ id=13612, skill={145,170,190,210} }, --Enchant Gloves - Mining
		{ id=25125, skill={150,160,170,180} }, --Minor Mana Oil
		{ id=13622, skill={150,175,195,215} }, --Enchant Bracer - Lesser Intellect
		{ id=13626, skill={150,175,195,215} }, --Enchant Chest - Minor Stats
		{ id=13628, skill={150,175,195,215} }, --Runed Golden Rod
	},

	EnchantingExpert = {
		{ name = L["Expert"], icon = "Trade_Engraving" },
		{ id=13635, skill={155,175,195,215} }, --Enchant Cloak - Defense
		{ id=13631, skill={155,175,195,215} }, --Enchant Shield - Lesser Stamina
		{ id=14809, skill={155,175,195,215} }, --Lesser Mystic Wand
		{ id=13637, skill={160,180,200,220} }, --Enchant Boots - Lesser Agility
		{ id=13640, skill={160,180,200,220} }, --Enchant Chest - Greater Health
		{ id=13642, skill={165,185,205,225} }, --Enchant Bracer - Spirit
		{ id=13644, skill={170,190,210,230} }, --Enchant Boots - Lesser Stamina
		{ id=13646, skill={170,190,210,230} }, --Enchant Bracer - Lesser Deflection
		{ id=13648, skill={170,190,210,230} }, --Enchant Bracer - Stamina
		{ id=13657, skill={175,195,215,235} }, --Enchant Cloak - Fire Resistance
		{ id=13653, skill={175,195,215,235} }, --Enchant Weapon - Lesser Beastslayer
		{ id=13655, skill={175,195,215,235} }, --Enchant Weapon - Lesser Elemental Slayer
		{ id=14810, skill={175,195,215,235} }, --Greater Mystic Wand
		{ id=13661, skill={180,200,220,240} }, --Enchant Bracer - Strength
		{ name = L["Expert"], icon = "Trade_Engraving" },
		{ id=13659, skill={180,200,220,240} }, --Enchant Shield - Spirit
		{ id=13663, skill={185,205,225,245} }, --Enchant Chest - Greater Mana
		{ id=57146, skill={185,205,225,245} }, --Enchant Bracer - Vampirism
		{ id=13687, skill={190,210,230,250} }, --Enchant Boots - Lesser Spirit
		{ id=21931, skill={190,210,230,250} }, --Enchant Weapon - Winter's Might
		{ id=13689, skill={195,215,235,255} }, --Enchant Shield - Lesser Block
		{ id=13693, skill={195,215,235,255} }, --Enchant Weapon - Striking
		{ id=25126, skill={200,210,220,230} }, --Lesser Wizard Oil
		{ id=13702, skill={200,220,240,260} }, --Runed Truesilver Rod
		{ id=13695, skill={200,220,240,260} }, --Enchant 2H Weapon - Impact
		{ id=13700, skill={200,220,240,260} }, --Enchant Chest - Lesser Stats
		{ id=13698, skill={200,220,240,260} }, --Enchant Gloves - Skinning
		{ id=13746, skill={205,225,245,265} }, --Enchant Cloak - Greater Defense
		{ id=13794, skill={205,225,245,265} }, --Enchant Cloak - Resistance
		{ name = L["Expert"], icon = "Trade_Engraving" },
		{ id=13822, skill={210,230,250,270} }, --Enchant Bracer - Intellect
		{ id=13815, skill={210,230,250,270} }, --Enchant Gloves - Agility
		{ id=13817, skill={210,230,250,270} }, --Enchant Shield - Stamina
		{ id=13836, skill={215,235,255,275} }, --Enchant Boots - Stamina
		{ id=13841, skill={215,235,255,275} }, --Enchant Gloves - Advanced Mining
		{ id=13846, skill={220,240,260,280} }, --Enchant Bracer - Greater Spirit
		{ id=13858, skill={220,240,260,280} }, --Enchant Chest - Superior Health
		{ id=13890, skill={225,245,265,285} }, --Enchant Boots - Minor Speed
		{ id=13882, skill={225,245,265,285} }, --Enchant Cloak - Lesser Agility
		{ id=13868, skill={225,245,265,285} }, --Enchant Gloves - Advanced Herbalism
		{ id=13887, skill={225,245,265,285} }, --Enchant Gloves - Strength
	},

	EnchantingArtisan = {
		{ name = L["Artisan"], icon = "Trade_Engraving" },
		{ id=13917, skill={230,250,270,290} }, --Enchant Chest - Superior Mana
		{ id=13905, skill={230,250,270,290} }, --Enchant Shield - Greater Spirit
		{ id=13915, skill={230,250,270,290} }, --Enchant Weapon - Demonslaying
		{ id=13935, skill={235,255,275,295} }, --Enchant Boots - Agility
		{ id=13931, skill={235,255,275,295} }, --Enchant Bracer - Deflection
		{ id=13933, skill={235,255,275,295} }, --Enchant Shield - Frost Resistance
		{ id=13937, skill={240,260,280,300} }, --Enchant 2H Weapon - Greater Impact
		{ id=13939, skill={240,260,280,300} }, --Enchant Bracer - Greater Strength
		{ id=13945, skill={245,265,285,305} }, --Enchant Bracer - Greater Stamina
		{ id=13941, skill={245,265,285,305} }, --Enchant Chest - Stats
		{ id=13943, skill={245,265,285,305} }, --Enchant Weapon - Greater Striking
		{ id=17181, skill={250,250,255,260} }, --Enchanted Leather
		{ id=17180, skill={250,250,255,260} }, --Enchanted Thorium
		{ id=25127, skill={250,260,270,280} }, --Lesser Mana Oil
		{ name = L["Artisan"], icon = "Trade_Engraving" },
		{ id=13948, skill={250,270,290,310} }, --Enchant Gloves - Minor Haste
		{ id=13947, skill={250,270,290,310} }, --Enchant Gloves - Riding Skill
		{ id=20008, skill={255,275,295,315} }, --Enchant Bracer - Greater Intellect
		{ id=20020, skill={260,280,300,320} }, --Enchant Boots - Greater Stamina
		{ id=20014, skill={265,285,305,325} }, --Enchant Cloak - Greater Resistance
		{ id=20017, skill={265,285,305,325} }, --Enchant Shield - Greater Stamina
		{ id=13898, skill={265,285,305,325} }, --Enchant Weapon - Fiery Weapon
		{ id=15596, skill={265,285,305,325} }, --Smoking Heart of the Mountain
		{ id=20009, skill={270,290,310,330} }, --Enchant Bracer - Superior Spirit
		{ id=20012, skill={270,290,310,330} }, --Enchant Gloves - Greater Agility
		{ id=25128, skill={275,285,295,305} }, --Wizard Oil
		{ id=20024, skill={275,295,315,335} }, --Enchant Boots - Spirit
		{ id=20026, skill={275,295,315,335} }, --Enchant Chest - Major Health
		{ id=41758, skill={275,275,280,300} }, --Enchanted Gemstone Oil
		{ name = L["Artisan"], icon = "Trade_Engraving" },
		{ id=20016, skill={280,300,320,340} }, --Enchant Shield - Superior Spirit
		{ id=20015, skill={285,305,325,345} }, --Enchant Cloak - Superior Defense
		{ id=20029, skill={285,305,325,345} }, --Enchant Weapon - Icy Chill
		{ id=27837, skill={290,310,330,350} }, --Enchant 2H Weapon - Agility
		{ id=23801, skill={290,310,330,350} }, --Enchant Bracer - Mana Regeneration
		{ id=20028, skill={290,310,330,350} }, --Enchant Chest - Major Mana
		{ id=23800, skill={290,310,330,350} }, --Enchant Weapon - Agility
		{ id=23799, skill={290,310,330,350} }, --Enchant Weapon - Strength
		{ id=20051, skill={290,310,330,350} }, --Runed Arcanite Rod
		{ id=20030, skill={295,315,335,355} }, --Enchant 2H Weapon - Superior Impact
		{ id=20023, skill={295,315,335,355} }, --Enchant Boots - Greater Agility
		{ id=20010, skill={295,315,335,355} }, --Enchant Bracer - Superior Strength
		{ id=20013, skill={295,315,335,355} }, --Enchant Gloves - Greater Strength
		{ id=20033, skill={295,315,335,355} }, --Enchant Weapon - Unholy Weapon
		{ name = L["Artisan"], icon = "Trade_Engraving" },
		{ id=25130, skill={300,310,320,330} }, --Brilliant Mana Oil
		{ id=25129, skill={300,310,320,330} }, --Brilliant Wizard Oil
		{ id=20036, skill={300,320,340,360} }, --Enchant 2H Weapon - Major Intellect
		{ id=20035, skill={300,320,340,360} }, --Enchant 2H Weapon - Major Spirit
		{ id=23802, skill={300,320,340,360} }, --Enchant Bracer - Healing Power
		{ id=20011, skill={300,320,340,360} }, --Enchant Bracer - Superior Stamina
		{ id=20025, skill={300,320,340,360} }, --Enchant Chest - Greater Stats
		{ id=25086, skill={300,320,340,360} }, --Enchant Cloak - Dodge
		{ id=25081, skill={300,320,340,360} }, --Enchant Cloak - Greater Fire Resistance
		{ id=25082, skill={300,320,340,360} }, --Enchant Cloak - Greater Nature Resistance
		{ id=25083, skill={300,320,340,360} }, --Enchant Cloak - Stealth
		{ id=25084, skill={300,320,340,360} }, --Enchant Cloak - Subtlety
		{ id=25078, skill={300,320,340,360} }, --Enchant Gloves - Fire Power
		{ id=25074, skill={300,320,340,360} }, --Enchant Gloves - Frost Power
		{ name = L["Artisan"], icon = "Trade_Engraving" },
		{ id=25079, skill={300,320,340,360} }, --Enchant Gloves - Healing Power
		{ id=25073, skill={300,320,340,360} }, --Enchant Gloves - Shadow Power
		{ id=25080, skill={300,320,340,360} }, --Enchant Gloves - Superior Agility
		{ id=25072, skill={300,320,340,360} }, --Enchant Gloves - Threat
		{ id=20034, skill={300,320,340,360} }, --Enchant Weapon - Crusader
		{ id=22750, skill={300,320,340,360} }, --Enchant Weapon - Healing Power
		{ id=20032, skill={300,320,340,360} }, --Enchant Weapon - Lifestealing
		{ id=23804, skill={300,320,340,360} }, --Enchant Weapon - Mighty Intellect
		{ id=23803, skill={300,320,340,360} }, --Enchant Weapon - Mighty Spirit
		{ id=22749, skill={300,320,340,360} }, --Enchant Weapon - Spell Power
		{ id=20031, skill={300,320,340,360} }, --Enchant Weapon - Superior Striking
		{ id=57030, skill={300,300,300,300} }, --Enchant Bracer - Greater Agility
		{ id=57028, skill={300,300,300,300} }, --Enchant Bracer - Spell Power
		{ id=57142, skill={300,300,300,300} }, --Enchant Boots - Greater Spirit
		{ name = L["Artisan"], icon = "Trade_Engraving" },
		{ id=57127, skill={300,300,300,300} }, --Enchant Boots - Superior Stamina
		{ id=57148, skill={300,300,300,300} }, --Enchant Boots - Vampirism
		{ id=57144, skill={300,300,300,300} }, --Enchant Bracer - Greater Deflection
		{ id=57119, skill={300,300,300,300} }, --Enchant Chest - Mighty Mana
		{ id=57117, skill={300,300,300,300} }, --Enchant Cloak - Greater Arcane Resistance
		{ id=46601, skill={300,300,300,300} }, --Enchant Gloves - Arcane Power
		{ id=46602, skill={300,300,300,300} }, --Enchant Gloves - Nature Power
		{ id=46086, skill={300,300,300,300} }, --Enchant Gloves - Major Strength
		{ id=57518, skill={300,300,300,300} }, --Eternal Dreamstone Shard
	},

	EnchantingCloak = {
		{ name = L["Cloak"], icon = "Trade_Engraving" },
		{ id=57117, skill={300,300,300,300} }, --Enchant Cloak - Greater Arcane Resistance
		{ id=25084, skill={300,320,340,360} }, --Enchant Cloak - Subtlety
		{ id=25083, skill={300,320,340,360} }, --Enchant Cloak - Stealth
		{ id=25082, skill={300,320,340,360} }, --Enchant Cloak - Greater Nature Resistance
		{ id=25081, skill={300,320,340,360} }, --Enchant Cloak - Greater Fire Resistance
		{ id=25086, skill={300,320,340,360} }, --Enchant Cloak - Dodge
		{ id=20015, skill={285,305,325,345} }, --Enchant Cloak - Superior Defense
		{ id=20014, skill={265,285,305,325} }, --Enchant Cloak - Greater Resistance
		{ id=13882, skill={225,245,265,285} }, --Enchant Cloak - Lesser Agility
		{ id=13794, skill={205,225,245,265} }, --Enchant Cloak - Resistance
		{ id=13746, skill={205,225,245,265} }, --Enchant Cloak - Greater Defense
		{ id=13657, skill={175,195,215,235} }, --Enchant Cloak - Fire Resistance
		{ id=13635, skill={155,175,195,215} }, --Enchant Cloak - Defense
		{ id=13522, skill={135,160,180,200} }, --Enchant Cloak - Lesser Shadow Resistance
		{ name = L["Cloak"], icon = "Trade_Engraving" },
		{ id=7861, skill={125,150,170,190} }, --Enchant Cloak - Lesser Fire Resistance
		{ id=13421, skill={115,140,160,180} }, --Enchant Cloak - Lesser Protection
		{ id=13419, skill={110,135,155,175} }, --Enchant Cloak - Minor Agility
		{ id=7771, skill={70,110,130,150} }, --Enchant Cloak - Minor Protection
		{ id=7454, skill={45,95,115,135} }, --Enchant Cloak - Minor Resistance
	},

	EnchantingChest = {
		{ name = L["Chest"], icon = "Trade_Engraving" },
		{ id=57119, skill={300,300,300,300} }, --Enchant Chest - Mighty Mana
		{ id=20025, skill={300,320,340,360} }, --Enchant Chest - Greater Stats
		{ id=20028, skill={290,310,330,350} }, --Enchant Chest - Major Mana
		{ id=20026, skill={275,295,315,335} }, --Enchant Chest - Major Health
		{ id=13941, skill={245,265,285,305} }, --Enchant Chest - Stats
		{ id=13917, skill={230,250,270,290} }, --Enchant Chest - Superior Mana
		{ id=13858, skill={220,240,260,280} }, --Enchant Chest - Superior Health
		{ id=13700, skill={200,220,240,260} }, --Enchant Chest - Lesser Stats
		{ id=13663, skill={185,205,225,245} }, --Enchant Chest - Greater Mana
		{ id=13640, skill={160,180,200,220} }, --Enchant Chest - Greater Health
		{ id=13626, skill={150,175,195,215} }, --Enchant Chest - Minor Stats
		{ id=13607, skill={145,170,190,210} }, --Enchant Chest - Mana
		{ id=13538, skill={140,165,185,205} }, --Enchant Chest - Lesser Absorption
		{ id=7857, skill={120,145,165,185} }, --Enchant Chest - Health
		{ name = L["Chest"], icon = "Trade_Engraving" },
		{ id=7776, skill={80,115,135,155} }, --Enchant Chest - Lesser Mana
		{ id=7748, skill={60,105,125,145} }, --Enchant Chest - Lesser Health
		{ id=7426, skill={40,90,110,130} }, --Enchant Chest - Minor Absorption
		{ id=7443, skill={20,80,100,120} }, --Enchant Chest - Minor Mana
		{ id=7420, skill={15,70,90,110} }, --Enchant Chest - Minor Health
	},

	EnchantingBracer = {
		{ name = L["Bracer"], icon = "Trade_Engraving" },
		{ id=57144, skill={300,300,300,300} }, --Enchant Bracer - Greater Deflection
		{ id=57028, skill={300,300,300,300} }, --Enchant Bracer - Spell Power
		{ id=57030, skill={300,300,300,300} }, --Enchant Bracer - Greater Agility
		{ id=20011, skill={300,320,340,360} }, --Enchant Bracer - Superior Stamina
		{ id=23802, skill={300,320,340,360} }, --Enchant Bracer - Healing Power
		{ id=20010, skill={295,315,335,355} }, --Enchant Bracer - Superior Strength
		{ id=23801, skill={290,310,330,350} }, --Enchant Bracer - Mana Regeneration
		{ id=20009, skill={270,290,310,330} }, --Enchant Bracer - Superior Spirit
		{ id=20008, skill={255,275,295,315} }, --Enchant Bracer - Greater Intellect
		{ id=13945, skill={245,265,285,305} }, --Enchant Bracer - Greater Stamina
		{ id=13939, skill={240,260,280,300} }, --Enchant Bracer - Greater Strength
		{ id=13931, skill={235,255,275,295} }, --Enchant Bracer - Deflection
		{ id=13846, skill={220,240,260,280} }, --Enchant Bracer - Greater Spirit
		{ id=13822, skill={210,230,250,270} }, --Enchant Bracer - Intellect
		{ name = L["Bracer"], icon = "Trade_Engraving" },
		{ id=57146, skill={185,205,225,245} }, --Enchant Bracer - Vampirism
		{ id=13661, skill={180,200,220,240} }, --Enchant Bracer - Strength
		{ id=13648, skill={170,190,210,230} }, --Enchant Bracer - Stamina
		{ id=13646, skill={170,190,210,230} }, --Enchant Bracer - Lesser Deflection
		{ id=13642, skill={165,185,205,225} }, --Enchant Bracer - Spirit
		{ id=13622, skill={150,175,195,215} }, --Enchant Bracer - Lesser Intellect
		{ id=13536, skill={140,165,185,205} }, --Enchant Bracer - Lesser Strength
		{ id=13501, skill={130,155,175,195} }, --Enchant Bracer - Lesser Stamina
		{ id=7859, skill={120,145,165,185} }, --Enchant Bracer - Lesser Spirit
		{ id=7782, skill={80,115,135,155} }, --Enchant Bracer - Minor Strength
		{ id=7779, skill={80,115,135,155} }, --Enchant Bracer - Minor Agility
		{ id=7766, skill={60,105,125,145} }, --Enchant Bracer - Minor Spirit
		{ id=7457, skill={50,100,120,140} }, --Enchant Bracer - Minor Stamina
		{ id=7428, skill={1,80,100,120} }, --Enchant Bracer - Minor Deflect
		{ name = L["Bracer"], icon = "Trade_Engraving" },
		{ id=7418, skill={1,70,90,110} }, --Enchant Bracer - Minor Health
	},

	EnchantingGlove = {
		{ name = L["Gloves"], icon = "Trade_Engraving" },
		{ id=46086, skill={300,300,300,300} }, --Enchant Gloves - Major Strength
		{ id=46602, skill={300,300,300,300} }, --Enchant Gloves - Nature Power
		{ id=46601, skill={300,300,300,300} }, --Enchant Gloves - Arcane Power
		{ id=25072, skill={300,320,340,360} }, --Enchant Gloves - Threat
		{ id=25080, skill={300,320,340,360} }, --Enchant Gloves - Superior Agility
		{ id=25073, skill={300,320,340,360} }, --Enchant Gloves - Shadow Power
		{ id=25079, skill={300,320,340,360} }, --Enchant Gloves - Healing Power
		{ id=25074, skill={300,320,340,360} }, --Enchant Gloves - Frost Power
		{ id=25078, skill={300,320,340,360} }, --Enchant Gloves - Fire Power
		{ id=20013, skill={295,315,335,355} }, --Enchant Gloves - Greater Strength
		{ id=20012, skill={270,290,310,330} }, --Enchant Gloves - Greater Agility
		{ id=13947, skill={250,270,290,310} }, --Enchant Gloves - Riding Skill
		{ id=13948, skill={250,270,290,310} }, --Enchant Gloves - Minor Haste
		{ id=13887, skill={225,245,265,285} }, --Enchant Gloves - Strength
		{ name = L["Gloves"], icon = "Trade_Engraving" },
		{ id=13868, skill={225,245,265,285} }, --Enchant Gloves - Advanced Herbalism
		{ id=13841, skill={215,235,255,275} }, --Enchant Gloves - Advanced Mining
		{ id=13815, skill={210,230,250,270} }, --Enchant Gloves - Agility
		{ id=13698, skill={200,220,240,260} }, --Enchant Gloves - Skinning
		{ id=13612, skill={145,170,190,210} }, --Enchant Gloves - Mining
		{ id=13617, skill={145,170,190,210} }, --Enchant Gloves - Herbalism
		{ id=13620, skill={145,170,190,210} }, --Enchant Gloves - Fishing
	},

	EnchantingBoots = {
		{ name = L["Boots"], icon = "Trade_Engraving" },
		{ id=57148, skill={300,300,300,300} }, --Enchant Boots - Vampirism
		{ id=57127, skill={300,300,300,300} }, --Enchant Boots - Superior Stamina
		{ id=57142, skill={300,300,300,300} }, --Enchant Boots - Greater Spirit
		{ id=20023, skill={295,315,335,355} }, --Enchant Boots - Greater Agility
		{ id=20024, skill={275,295,315,335} }, --Enchant Boots - Spirit
		{ id=20020, skill={260,280,300,320} }, --Enchant Boots - Greater Stamina
		{ id=13935, skill={235,255,275,295} }, --Enchant Boots - Agility
		{ id=13890, skill={225,245,265,285} }, --Enchant Boots - Minor Speed
		{ id=13836, skill={215,235,255,275} }, --Enchant Boots - Stamina
		{ id=13687, skill={190,210,230,250} }, --Enchant Boots - Lesser Spirit
		{ id=13644, skill={170,190,210,230} }, --Enchant Boots - Lesser Stamina
		{ id=13637, skill={160,180,200,220} }, --Enchant Boots - Lesser Agility
		{ id=7863, skill={125,150,170,190} }, --Enchant Boots - Minor Stamina
		{ id=7867, skill={125,150,170,190} }, --Enchant Boots - Minor Agility
	},

	Enchanting2HWeapon = {
		{ name = L["2H Weapon"], icon = "Trade_Engraving" },
		{ id=20035, skill={300,320,340,360} }, --Enchant 2H Weapon - Major Spirit
		{ id=20036, skill={300,320,340,360} }, --Enchant 2H Weapon - Major Intellect
		{ id=20030, skill={295,315,335,355} }, --Enchant 2H Weapon - Superior Impact
		{ id=27837, skill={290,310,330,350} }, --Enchant 2H Weapon - Agility
		{ id=13937, skill={240,260,280,300} }, --Enchant 2H Weapon - Greater Impact
		{ id=13695, skill={200,220,240,260} }, --Enchant 2H Weapon - Impact
		{ id=13529, skill={145,170,190,210} }, --Enchant 2H Weapon - Lesser Impact
		{ id=13380, skill={110,135,155,175} }, --Enchant 2H Weapon - Lesser Spirit
		{ id=7745, skill={100,130,150,170} }, --Enchant 2H Weapon - Minor Impact
		{ id=7793, skill={100,130,150,170} }, --Enchant 2H Weapon - Lesser Intellect
		{ id=45071, skill={75,115,135,155} }, --Enchant 2H Weapon - Minor Intellect
	},

	EnchantingWeapon = {
		{ name = L["Weapon"], icon = "Trade_Engraving" },
		{ id=20031, skill={300,320,340,360} }, --Enchant Weapon - Superior Striking
		{ id=22749, skill={300,320,340,360} }, --Enchant Weapon - Spell Power
		{ id=23803, skill={300,320,340,360} }, --Enchant Weapon - Mighty Spirit
		{ id=23804, skill={300,320,340,360} }, --Enchant Weapon - Mighty Intellect
		{ id=20032, skill={300,320,340,360} }, --Enchant Weapon - Lifestealing
		{ id=22750, skill={300,320,340,360} }, --Enchant Weapon - Healing Power
		{ id=20034, skill={300,320,340,360} }, --Enchant Weapon - Crusader
		{ id=20033, skill={295,315,335,355} }, --Enchant Weapon - Unholy Weapon
		{ id=23799, skill={290,310,330,350} }, --Enchant Weapon - Strength
		{ id=23800, skill={290,310,330,350} }, --Enchant Weapon - Agility
		{ id=20029, skill={285,305,325,345} }, --Enchant Weapon - Icy Chill
		{ id=13898, skill={265,285,305,325} }, --Enchant Weapon - Fiery Weapon
		{ id=13943, skill={245,265,285,305} }, --Enchant Weapon - Greater Striking
		{ id=13915, skill={230,250,270,290} }, --Enchant Weapon - Demonslaying
		{ name = L["Weapon"], icon = "Trade_Engraving" },
		{ id=13693, skill={195,215,235,255} }, --Enchant Weapon - Striking
		{ id=21931, skill={190,210,230,250} }, --Enchant Weapon - Winter's Might
		{ id=13655, skill={175,195,215,235} }, --Enchant Weapon - Lesser Elemental Slayer
		{ id=13653, skill={175,195,215,235} }, --Enchant Weapon - Lesser Beastslayer
		{ id=13503, skill={140,165,185,205} }, --Enchant Weapon - Lesser Striking
		{ id=7788, skill={90,120,140,160} }, --Enchant Weapon - Minor Striking
		{ id=7786, skill={90,120,140,160} }, --Enchant Weapon - Minor Beastslayer
	},

	EnchantingShield = {
		{ name = L["Shield"], icon = "Trade_Engraving" },
		{ id=20016, skill={280,300,320,340} }, --Enchant Shield - Superior Spirit
		{ id=20017, skill={265,285,305,325} }, --Enchant Shield - Greater Stamina
		{ id=13933, skill={235,255,275,295} }, --Enchant Shield - Frost Resistance
		{ id=13905, skill={230,250,270,290} }, --Enchant Shield - Greater Spirit
		{ id=13817, skill={210,230,250,270} }, --Enchant Shield - Stamina
		{ id=13689, skill={195,215,235,255} }, --Enchant Shield - Lesser Block
		{ id=13659, skill={180,200,220,240} }, --Enchant Shield - Spirit
		{ id=13631, skill={155,175,195,215} }, --Enchant Shield - Lesser Stamina
		{ id=13485, skill={130,155,175,195} }, --Enchant Shield - Lesser Spirit
		{ id=13464, skill={115,140,160,180} }, --Enchant Shield - Lesser Protection
		{ id=13378, skill={105,130,150,170} }, --Enchant Shield - Minor Stamina
	},

	EnchantingMisc = {
		{ name = L["Misc"], icon = "Trade_Engraving" },
		{ id=7421, skill={1,5,7,10} }, --Runed Copper Rod
		{ id=7795, skill={100,130,150,170} }, --Runed Silver Rod
		{ id=13628, skill={150,175,195,215} }, --Runed Golden Rod
		{ id=13702, skill={200,220,240,260} }, --Runed Truesilver Rod
		{ id=20051, skill={290,310,330,350} }, --Runed Arcanite Rod
		{ id=14293, skill={10,75,95,115} }, --Lesser Magic Wand
		{ id=14807, skill={70,110,130,150} }, --Greater Magic Wand
		{ id=14809, skill={155,175,195,215} }, --Lesser Mystic Wand
		{ id=14810, skill={175,195,215,235} }, --Greater Mystic Wand
		{ id=25124, skill={45,55,65,75} }, --Minor Wizard Oil
		{ id=25125, skill={150,160,170,180} }, --Minor Mana Oil
		{ id=25126, skill={200,210,220,230} }, --Lesser Wizard Oil
		{ id=25127, skill={250,260,270,280} }, --Lesser Mana Oil
		{ id=25128, skill={275,285,295,305} }, --Wizard Oil
		{ name = L["Misc"], icon = "Trade_Engraving" },
		{ id=25130, skill={300,310,320,330} }, --Brilliant Mana Oil
		{ id=25129, skill={300,310,320,330} }, --Brilliant Wizard Oil
		{ id=17181, skill={250,250,255,260} }, --Enchanted Leather
		{ id=17180, skill={250,250,255,260} }, --Enchanted Thorium
		{ id=41758, skill={275,275,280,300} }, --Enchanted Gemstone Oil
		{ id=15596, skill={265,285,305,325} }, --Smoking Heart of the Mountain
		{ id=57518, skill={300,300,300,300} }, --Eternal Dreamstone Shard
	},

	SmithingApprentice = {
		{ name = L["Apprentice"], icon = "Trade_BlackSmithing" },
		{ id=12260, skill={1,15,35,55} }, --Rough Copper Vest
		{ id=2660, skill={1,15,35,55} }, --Rough Sharpening Stone
		{ id=3115, skill={1,15,35,55} }, --Rough Weightstone
		{ id=2663, skill={1,20,40,60} }, --Copper Bracers
		{ id=2662, skill={1,50,70,90} }, --Copper Chain Pants
		{ id=2737, skill={15,55,75,95} }, --Copper Mace
		{ id=2738, skill={20,60,80,100} }, --Copper Axe
		{ id=3319, skill={20,60,80,100} }, --Copper Chain Boots
		{ id=3320, skill={25,45,65,85} }, --Rough Grinding Stone
		{ id=2739, skill={25,65,85,105} }, --Copper Shortsword
		{ id=57163, skill={25,25,37,50} }, --Copper Belt Buckle
		{ id=46663, skill={30,60,62,65} }, --Copper Knuckles
		{ id=9983, skill={30,70,90,110} }, --Copper Claymore
		{ id=8880, skill={30,70,90,110} }, --Copper Dagger
		{ id=2661, skill={35,75,95,115} }, --Copper Chain Belt
		{ id=3293, skill={35,75,95,115} }, --Copper Battle Axe
		{ id=3321, skill={35,75,95,115} }, --Copper Chain Vest
		{ id=3323, skill={40,80,100,120} }, --Runed Copper Gauntlets
		{ id=3324, skill={45,85,105,125} }, --Runed Copper Pants
		{ id=3325, skill={60,100,120,140} }, --Gemmed Copper Gauntlets
		{ id=2665, skill={65,65,72,80} }, --Coarse Sharpening Stone
		{ id=3116, skill={65,65,72,80} }, --Coarse Weightstone
		{ id=7408, skill={65,105,125,145} }, --Heavy Copper Maul
		{ id=2666, skill={70,110,130,150} }, --Runed Copper Belt
		{ id=3294, skill={70,110,130,150} }, --Thick War Axe
		{ id=3326, skill={75,75,87,100} }, --Coarse Grinding Stone
		{ id=46664, skill={75,90,95,100} }, --Sharpened Claw
		{ id=45063, skill={75,100,120,140} }, --Blast Shield
	},

	SmithingJourneyman = {
		{ name = L["SmithingJourneyman1"], icon = "Trade_BlackSmithing" },
		{ id=2667, skill={80,120,140,160} }, --Runed Copper Breastplate
		{ id=57166, skill={90,90,97,105} }, --Bronze Belt Buckle
		{ id=2664, skill={90,115,127,140} }, --Runed Copper Bracers
		{ id=7817, skill={95,125,140,155} }, --Rough Bronze Boots
		{ id=3292, skill={95,135,155,175} }, --Heavy Copper Broadsword
		{ id=7818, skill={100,105,107,110} }, --Silver Rod
		{ id=19666, skill={100,100,110,120} }, --Silver Skeleton Key
		{ id=8367, skill={100,140,160,180} }, --Ironforge Breastplate
		{ id=2671, skill={100,140,160,180} }, --Rough Bronze Bracers
		{ id=3491, skill={105,135,150,165} }, --Big Bronze Knife
		{ id=2670, skill={105,145,160,175} }, --Rough Bronze Cuirass
		{ id=2668, skill={105,145,160,175} }, --Rough Bronze Leggings
		{ id=2740, skill={110,140,155,170} }, --Bronze Mace
		{ id=3328, skill={110,140,155,170} }, --Rough Bronze Shoulders
		{ id=6517, skill={110,140,155,170} }, --Pearl-handled Dagger
		{ id=2741, skill={115,145,160,175} }, --Bronze Axe
		{ id=46665, skill={120,140,145,150} }, --Bronze Bruiser
		{ id=2742, skill={120,150,165,180} }, --Bronze Shortsword
		{ id=2672, skill={120,150,165,180} }, --Patterned Bronze Bracers
		{ id=2674, skill={125,125,132,140} }, --Heavy Sharpening Stone
		{ id=3117, skill={125,125,132,140} }, --Heavy Weightstone
		{ id=3337, skill={125,125,137,150} }, --Heavy Grinding Stone
		{ id=9985, skill={125,155,170,185} }, --Bronze Warhammer
		{ id=3295, skill={125,155,170,185} }, --Deadly Bronze Poniard
		{ id=3330, skill={125,155,170,185} }, --Silvered Bronze Shoulders
		{ id=9986, skill={130,160,175,190} }, --Bronze Greatsword
		{ id=3296, skill={130,160,175,190} }, --Heavy Bronze Mace
		{ id=3331, skill={130,160,175,190} }, --Silvered Bronze Boots
		{ id=2673, skill={130,160,175,190} }, --Silvered Bronze Breastplate
		{ id=9987, skill={135,165,180,195} }, --Bronze Battle Axe
	},

	SmithingJourneyman2 = {
		{ name = L["SmithingJourneyman2"], icon = "Trade_BlackSmithing" },
		{ id=3333, skill={135,165,180,195} }, --Silvered Bronze Gauntlets
		{ id=57169, skill={140,140,147,155} }, --Iron Belt Buckle
		{ id=6518, skill={140,170,185,200} }, --Iridescent Hammer
		{ id=3334, skill={145,175,190,205} }, --Green Iron Boots
		{ id=3297, skill={145,175,190,205} }, --Mighty Iron Hammer
		{ id=2675, skill={145,175,190,205} }, --Shining Silver Breastplate
		{ id=8768, skill={150,150,152,155} }, --Iron Buckle
		{ id=19667, skill={150,150,160,170} }, --Golden Skeleton Key
		{ id=14379, skill={150,155,157,160} }, --Golden Rod
		{ id=7221, skill={150,180,195,210} }, --Iron Shield Spike
		{ id=3336, skill={150,180,195,210} }, --Green Iron Gauntlets
	},

	SmithingExpert = {
		{ name = L["Expert"], icon = "Trade_BlackSmithing" },
		{ id=3506, skill={155,180,192,205} }, --Green Iron Leggings
		{ id=12259, skill={155,180,192,205} }, --Silvered Bronze Leggings
		{ id=3494, skill={155,180,192,205} }, --Solid Iron Maul
		{ id=9813, skill={160,185,197,210} }, --Barbaric Iron Breastplate
		{ id=9811, skill={160,185,197,210} }, --Barbaric Iron Shoulders
		{ id=3504, skill={160,185,197,210} }, --Green Iron Shoulders
		{ id=3492, skill={160,185,197,210} }, --Hardened Iron Shortsword
		{ id=3501, skill={165,190,202,215} }, --Green Iron Bracers
		{ id=7222, skill={165,190,202,215} }, --Iron Counterweight
		{ id=3495, skill={170,195,207,220} }, --Golden Iron Destroyer
		{ id=3507, skill={170,195,207,220} }, --Golden Scale Leggings
		{ id=3502, skill={170,195,207,220} }, --Green Iron Helm
		{ id=9814, skill={175,200,212,225} }, --Barbaric Iron Helm
		{ id=3505, skill={175,200,212,225} }, --Golden Scale Shoulders
		{ id=3493, skill={175,200,212,225} }, --Jade Serpentblade
		{ id=9818, skill={180,205,217,230} }, --Barbaric Iron Boots
		{ id=15972, skill={180,205,217,230} }, --Glinting Steel Dagger
		{ id=3496, skill={180,205,217,230} }, --Moonsteel Broadsword
		{ id=3508, skill={180,205,217,230} }, --Green Iron Hauberk
		{ id=7223, skill={185,210,222,235} }, --Golden Scale Bracers
		{ id=9820, skill={185,210,222,235} }, --Barbaric Iron Gloves
		{ id=3498, skill={185,210,222,235} }, --Massive Iron Axe
		{ id=3513, skill={185,210,222,235} }, --Polished Steel Boots
		{ id=57172, skill={185,190,197,205} }, --Mithril Belt Buckle
		{ id=7224, skill={190,215,227,240} }, --Steel Weapon Chain
		{ id=21913, skill={190,215,227,240} }, --Edge of Winter
		{ id=3503, skill={190,215,227,240} }, --Golden Scale Coif
		{ id=15973, skill={190,215,227,240} }, --Searing Golden Blade
		{ id=3511, skill={195,220,232,245} }, --Golden Scale Cuirass
		{ id=9920, skill={200,200,205,210} }, --Solid Grinding Stone
		{ name = L["Expert"], icon = "Trade_BlackSmithing" },
		{ id=9918, skill={200,200,205,210} }, --Solid Sharpening Stone
		{ id=9921, skill={200,200,205,210} }, --Solid Weightstone
		{ id=19668, skill={200,200,210,220} }, --Truesilver Skeleton Key
		{ id=14380, skill={200,205,207,210} }, --Truesilver Rod
		{ id=3497, skill={200,225,237,250} }, --Frost Tiger Blade
		{ id=3515, skill={200,225,237,250} }, --Golden Scale Boots
		{ id=3500, skill={200,225,237,250} }, --Shadow Crescent Axe
		{ id=9916, skill={200,225,237,250} }, --Steel Breastplate
		{ id=11454, skill={200,225,237,250} }, --Inlaid Mithril Cylinder
		{ id=11643, skill={205,225,235,245} }, --Golden Scale Gauntlets
		{ id=9928, skill={205,225,235,245} }, --Heavy Mithril Gauntlet
		{ id=9926, skill={205,225,235,245} }, --Heavy Mithril Shoulder
		{ id=9933, skill={210,230,240,250} }, --Heavy Mithril Pants
		{ id=9931, skill={210,230,240,250} }, --Mithril Scale Pants
		{ id=9993, skill={210,235,247,260} }, --Heavy Mithril Axe
		{ id=9957, skill={210,250,260,270} }, --Orcish War Leggings
		{ id=9972, skill={210,260,270,280} }, --Ornate Mithril Breastplate
		{ id=9979, skill={210,265,275,285} }, --Ornate Mithril Boots
		{ id=9980, skill={210,265,275,285} }, --Ornate Mithril Helm
		{ id=9935, skill={215,235,245,255} }, --Steel Plate Helm
		{ id=9937, skill={215,235,245,255} }, --Mithril Scale Bracers
		{ id=9939, skill={215,235,245,255} }, --Mithril Shield Spike
		{ id=9950, skill={220,240,250,260} }, --Ornate Mithril Gloves
		{ id=9945, skill={220,240,250,260} }, --Ornate Mithril Pants
		{ id=9995, skill={220,245,257,270} }, --Blue Glittering Axe
		{ id=46626, skill={220,220,220,220} }, --Steel Plate Boots
		{ id=46627, skill={220,220,220,220} }, --Steel Plate Gauntlets
		{ id=9942, skill={220,240,250,260} }, --Mithril Scale Gloves
		{ id=9952, skill={225,245,255,265} }, --Ornate Mithril Shoulders
		{ id=9997, skill={225,250,262,275} }, --Wicked Mithril Blade
		{ id=46629, skill={225,225,225,225} }, --Steel Plate Armor
		{ id=46628, skill={225,225,225,225} }, --Steel Plate Legguards
	},

	SmithingExpert2 = {
	},

	SmithingExpert3 = {
		{ name = L["SmithingExpert3"], icon = "Trade_BlackSmithing" },
	},

	SmithingArtisan = {
		{ name = L["SmithingArtisan1"], icon = "Trade_BlackSmithing" },
		{ id=46631, skill={230,230,230,230} }, --Steel Plate Barbute
		{ id=46630, skill={230,230,230,230} }, --Steel Plate Pauldrons
		{ id=9959, skill={230,250,260,270} }, --Heavy Mithril Breastplate
		{ id=9961, skill={230,250,260,270} }, --Mithril Coif
		{ id=10001, skill={230,255,267,280} }, --Big Black Mace
		{ id=9968, skill={235,255,265,275} }, --Heavy Mithril Boots
		{ id=9966, skill={235,255,265,275} }, --Mithril Scale Shoulders
		{ id=9964, skill={235,255,265,275} }, --Mithril Spurs
		{ id=57175, skill={240,240,247,255} }, --Thorium Belt Buckle
		{ id=10005, skill={240,265,277,290} }, --Dazzling Mithril Rapier
		{ id=9970, skill={245,255,265,275} }, --Heavy Mithril Helm
		{ id=10009, skill={245,270,282,295} }, --Runed Mithril Hammer
		{ id=16639, skill={250,255,257,260} }, --Dense Grinding Stone
		{ id=16641, skill={250,255,257,260} }, --Dense Sharpening Stone
		{ id=16640, skill={250,255,257,260} }, --Dense Weightstone
		{ id=16642, skill={250,270,280,290} }, --Thorium Armor
		{ id=16643, skill={250,270,280,290} }, --Thorium Belt
		{ id=16644, skill={255,275,285,295} }, --Thorium Bracers
		{ id=10013, skill={255,280,292,305} }, --Ebon Shiv
		{ id=16645, skill={260,280,290,300} }, --Radiant Belt
		{ id=16647, skill={265,285,295,305} }, --Imperial Plate Belt
		{ id=16646, skill={265,285,295,305} }, --Imperial Plate Shoulders
		{ id=15293, skill={270,290,300,310} }, --Dark Iron Mail
		{ id=16649, skill={270,290,300,310} }, --Imperial Plate Bracers
		{ id=16648, skill={270,290,300,310} }, --Radiant Breastplate
		{ id=20201, skill={275,275,280,285} }, --Arcanite Rod
		{ id=19669, skill={275,275,280,285} }, --Arcanite Skeleton Key
		{ id=16651, skill={275,295,305,315} }, --Thorium Shield Spike
		{ id=16969, skill={275,300,312,325} }, --Ornate Thorium Handaxe
	},

	SmithingArtisan2 = {
		{ name = L["SmithingArtisan2"], icon = "Trade_BlackSmithing" },
		{ id=47032, skill={275,300,312,325} }, --Hateforge Belt
		{ id=47034, skill={275,300,310,320} }, --Hateforge Boots
		{ id=57113, skill={275,300,310,320} }, --Thorium Spurs
		{ id=57178, skill={275,275,282,290} }, --Arcanite Belt Buckle
		{ id=15295, skill={280,300,310,320} }, --Dark Iron Shoulders
		{ id=16652, skill={280,300,310,320} }, --Thorium Boots
		{ id=16653, skill={280,300,310,320} }, --Thorium Helm
		{ id=16971, skill={280,305,317,330} }, --Huge Thorium Battleaxe
		{ id=47033, skill={285,300,310,320} }, --Hateforge Grips
		{ id=16654, skill={285,305,315,325} }, --Radiant Gloves
		{ id=47029, skill={290,300,310,320} }, --Hateforge Helmet
		{ id=47030, skill={290,300,310,320} }, --Hateforge Cuirass
		{ id=47031, skill={290,300,310,320} }, --Hateforge Leggings
		{ id=16656, skill={290,310,320,330} }, --Radiant Boots
		{ id=16660, skill={290,310,320,330} }, --Dawnbringer Shoulders
		{ id=23632, skill={290,310,320,330} }, --Girdle of the Dawn
		{ id=23628, skill={290,310,320,330} }, --Heavy Timbermaw Belt
		{ id=16984, skill={290,315,327,340} }, --Volcanic Hammer
		{ id=16657, skill={295,315,325,335} }, --Imperial Plate Boots
		{ id=16658, skill={295,315,325,335} }, --Imperial Plate Helm
		{ id=16659, skill={295,315,325,335} }, --Radiant Circlet
		{ id=22757, skill={300,300,310,320} }, --Elemental Sharpening Stone
		{ id=16663, skill={300,320,330,340} }, --Imperial Plate Chest
		{ id=16730, skill={300,320,330,340} }, --Imperial Plate Leggings
		{ id=16725, skill={300,320,330,340} }, --Radiant Leggings
		{ id=16731, skill={300,320,330,340} }, --Runic Breastplate
		{ id=16665, skill={300,320,330,340} }, --Runic Plate Boots
		{ id=16726, skill={300,320,330,340} }, --Runic Plate Helm
		{ id=16732, skill={300,320,330,340} }, --Runic Plate Leggings
		{ id=16664, skill={300,320,330,340} }, --Runic Plate Shoulders
		{ id=16662, skill={300,320,330,340} }, --Thorium Leggings
	},

	SmithingArtisan3 = {
		{ name = L["SmithingArtisan3"], icon = "Trade_BlackSmithing" },
		{ id=24136, skill={300,320,330,340} }, --Bloodsoul Breastplate
		{ id=24138, skill={300,320,330,340} }, --Bloodsoul Gauntlets
		{ id=24137, skill={300,320,330,340} }, --Bloodsoul Shoulders
		{ id=24914, skill={300,320,330,340} }, --Darkrune Breastplate
		{ id=24912, skill={300,320,330,340} }, --Darkrune Gauntlets
		{ id=24913, skill={300,320,330,340} }, --Darkrune Helm
		{ id=24139, skill={300,320,330,340} }, --Darksoul Breastplate
		{ id=24140, skill={300,320,330,340} }, --Darksoul Leggings
		{ id=24141, skill={300,320,330,340} }, --Darksoul Shoulders
		{ id=23633, skill={300,320,330,340} }, --Gloves of the Dawn
		{ id=27585, skill={300,320,330,340} }, --Heavy Obsidian Belt
		{ id=23629, skill={300,320,330,340} }, --Heavy Timbermaw Boots
		{ id=28463, skill={300,320,330,340} }, --Ironvine Belt
		{ id=28461, skill={300,320,330,340} }, --Ironvine Breastplate
		{ id=28462, skill={300,320,330,340} }, --Ironvine Gloves
		{ id=27588, skill={300,320,330,340} }, --Light Obsidian Belt
		{ id=57026, skill={300,320,330,340} }, --Mantle of Centaur Authority
		{ id=47021, skill={300,320,330,340} }, --Rune-Etched Greaves
		{ id=47022, skill={300,320,330,340} }, --Rune-Etched Legplates
		{ id=47023, skill={300,320,330,340} }, --Rune-Etched Breastplate
		{ id=47024, skill={300,320,330,340} }, --Rune-Etched Crown
		{ id=47025, skill={300,320,330,340} }, --Rune-Etched Mantle
		{ id=47026, skill={300,320,330,340} }, --Rune-Etched Grips
		{ id=27589, skill={300,320,330,340} }, --Black Grasp of the Destroyer
		{ id=28244, skill={300,320,330,340} }, --Icebane Bracers
		{ id=28242, skill={300,320,330,340} }, --Icebane Breastplate
		{ id=28243, skill={300,320,330,340} }, --Icebane Gauntlets
		{ id=27586, skill={300,320,330,340} }, --Jagged Obsidian Shield
		{ id=27590, skill={300,320,330,340} }, --Obsidian Mail Tunic
		{ id=27587, skill={300,320,330,340} }, --Thick Obsidian Breastplate
	},

	SmithingArtisan4 = {
		{ name = L["SmithingArtisan4"], icon = "Trade_BlackSmithing" },
		{ id=21161, skill={300,325,337,350} }, --Sulfuron Hammer
		{ id=54009, skill={300,325,337,350} }, --Fiery Chain Breastplate
		{ id=57196, skill={300,300,300,300} }, --Bloody Belt Buckle
		{ id=55526, skill={300,320,330,340} }, --Otherworldly Coif
		{ id=55527, skill={300,320,330,340} }, --Otherworldly Spaulders
		{ id=55528, skill={300,320,330,340} }, --Otherworldly Breastplate
		{ id=55529, skill={300,320,330,340} }, --Otherworldly Leggings
		{ id=55530, skill={300,320,330,340} }, --Reflective Helmet
		{ id=55531, skill={300,320,330,340} }, --Reflective Pauldrons
		{ id=55532, skill={300,320,330,340} }, --Reflective Breastplate
		{ id=55533, skill={300,320,330,340} }, --Reflective Leggings
		{ id=57181, skill={300,300,305,310} }, --Dreamsteel Belt Buckle
		{ id=45471, skill={300,325,337,350} }, --Dreamsteel Boots
		{ id=45469, skill={300,325,337,350} }, --Dreamsteel Bracers
		{ id=45467, skill={300,325,337,350} }, --Dreamsteel Leggings
		{ id=45465, skill={300,325,337,350} }, --Dreamsteel Mantle
	},

	Armorsmith = {
		{ name = L["Armorsmith1"], icon = "Trade_BlackSmithing" },
		{ id=9954, skill={225,245,255,265} }, --Truesilver Gauntlets
		{ id=9974, skill={245,265,275,285} }, --Truesilver Breastplate
		{ id=16650, skill={270,290,300,310} }, --Wildthorn Mail
		{ id=16667, skill={285,305,315,325} }, --Demon Forged Breastplate
		{ id=15296, skill={285,305,315,325} }, --Dark Iron Plate
		{ id=16655, skill={290,310,320,330} }, --Fiery Plate Gauntlets
		{ id=54003, skill={290,310,320,330} }, --Fury of the Timbermaw
		{ id=16661, skill={295,315,325,335} }, --Storm Gauntlets
		{ id=20874, skill={295,315,325,335} }, --Dark Iron Bracers
		{ id=20872, skill={295,315,325,335} }, --Fiery Chain Girdle
		{ id=16745, skill={300,320,330,340} }, --Enchanted Thorium Breastplate
		{ id=16742, skill={300,320,330,340} }, --Enchanted Thorium Helm
		{ id=16744, skill={300,320,330,340} }, --Enchanted Thorium Leggings
		{ id=16728, skill={300,320,330,340} }, --Helm of the Great Chief
		{ id=16724, skill={300,320,330,340} }, --Whitesoul Helm
		{ id=54005, skill={300,325,337,350} }, --Pauldrons of the Timbermaw
		{ id=24399, skill={300,320,330,340} }, --Dark Iron Boots
		{ id=23637, skill={300,320,330,340} }, --Dark Iron Gauntlets
		{ id=23636, skill={300,320,330,340} }, --Dark Iron Helm
		{ id=20876, skill={300,320,330,340} }, --Dark Iron Leggings
		{ id=20873, skill={300,320,330,340} }, --Fiery Chain Shoulders
		{ id=16746, skill={300,320,330,340} }, --Invulnerable Mail
		{ id=16729, skill={300,320,330,340} }, --Lionheart Helm
		{ id=16741, skill={300,320,330,340} }, --Stronghold Gauntlets
		{ id=27829, skill={300,320,330,340} }, --Titanic Leggings
		{ id=57189, skill={300,325,337,350} }, --Towerforge Breastplate
		{ id=57187, skill={300,325,337,350} }, --Towerforge Crown
		{ id=57191, skill={300,325,337,350} }, --Towerforge Pauldrons
	},

	Weaponsmith = {
		{ name = L["Weaponsmith1"], icon = "Trade_BlackSmithing" },
		{ id=10003, skill={235,260,272,285} }, --The Shatterer
		{ id=10007, skill={245,270,282,295} }, --Phantom Blade
		{ id=10011, skill={250,275,287,300} }, --Blight
		{ id=10015, skill={260,285,297,310} }, --Truesilver Champion
		{ id=15292, skill={265,285,295,305} }, --Dark Iron Pulverizer
		{ id=16965, skill={270,290,300,310} }, --Bleakwood Hew
		{ id=15294, skill={275,295,305,315} }, --Dark Iron Sunderer
		{ id=16986, skill={300,320,330,340} }, --Blood Talon
		{ id=16987, skill={300,320,330,340} }, --Darkspear
		{ id=16995, skill={300,320,330,340} }, --Heartseeker
		{ id=23638, skill={300,320,330,340} }, --Black Amnesty
		{ id=23639, skill={300,320,330,340} }, --Blackfury
		{ id=46657, skill={300,320,330,340} }, --Ornate Bloodstone Dagger
	},

	Axesmith = {
		{ name = L["Axesmith1"], icon = "Trade_BlackSmithing" },
		{ id=16970, skill={275,300,312,325} }, --Dawn's Edge
		{ id=16991, skill={300,320,330,340} }, --Annihilator
		{ id=16994, skill={300,320,330,340} }, --Arcanite Reaper
		{ id=20897, skill={300,320,330,340} }, --Dark Iron Destroyer
		{ id=23653, skill={300,320,330,340} }, --Nightfall
	},

	Hammersmith = {
		{ name = L["Hammersmith1"], icon = "Trade_BlackSmithing" },
		{ id=16973, skill={280,305,317,330} }, --Enchanted Battlehammer
		{ id=16983, skill={285,310,322,335} }, --Serenity
		{ id=16988, skill={300,320,330,340} }, --Hammer of the Titans
		{ id=16993, skill={300,320,330,340} }, --Masterwork Stormhammer
		{ id=23650, skill={300,320,330,340} }, --Ebon Hand
		{ id=27830, skill={300,320,330,340} }, --Persuader
		{ id=57193, skill={300,325,337,350} }, --Towerforge Demolisher
		{ id=45487, skill={300,325,337,350} }, --Dawnstone Hammer
	},

	Swordsmith = {
		{ name = L["Swordsmith1"], icon = "Trade_BlackSmithing" },
		{ id=16978, skill={280,305,317,330} }, --Blazing Rapier
		{ id=16985, skill={290,315,327,340} }, --Corruption
		{ id=16990, skill={300,320,330,340} }, --Arcanite Champion
		{ id=46652, skill={300,320,330,340} }, --Untempered Runeblade
		{ id=16992, skill={300,320,330,340} }, --Frostguard
		{ id=20890, skill={300,320,330,340} }, --Dark Iron Reaver
		{ id=23652, skill={300,320,330,340} }, --Blackguard
		{ id=27832, skill={300,320,330,340} }, --Sageblade
		{ id=46661, skill={300,320,330,340} }, --Dream's Herald
	},

	SmithingHelm = {
		{ name = L["SmithingHelm1"], icon = "Trade_BlackSmithing" },
		{ id=3502, skill={170,195,207,220} }, --Green Iron Helm
		{ id=9814, skill={175,200,212,225} }, --Barbaric Iron Helm
		{ id=3503, skill={190,215,227,240} }, --Golden Scale Coif
		{ id=9980, skill={210,265,275,285} }, --Ornate Mithril Helm
		{ id=9935, skill={215,235,245,255} }, --Steel Plate Helm
		{ id=46631, skill={230,230,230,230} }, --Steel Plate Barbute
		{ id=9961, skill={230,250,260,270} }, --Mithril Coif
		{ id=9970, skill={245,255,265,275} }, --Heavy Mithril Helm
		{ id=16653, skill={280,300,310,320} }, --Thorium Helm
		{ id=47029, skill={290,300,310,320} }, --Hateforge Helmet
		{ id=16658, skill={295,315,325,335} }, --Imperial Plate Helm
		{ id=16726, skill={300,320,330,340} }, --Runic Plate Helm
		{ id=24913, skill={300,320,330,340} }, --Darkrune Helm
		{ id=47024, skill={300,320,330,340} }, --Rune-Etched Crown
		{ id=16742, skill={300,320,330,340} }, --Enchanted Thorium Helm
		{ id=16728, skill={300,320,330,340} }, --Helm of the Great Chief
		{ id=16724, skill={300,320,330,340} }, --Whitesoul Helm
		{ id=55526, skill={300,320,330,340} }, --Otherworldly Coif
		{ id=55530, skill={300,320,330,340} }, --Reflective Helmet
		{ id=23636, skill={300,320,330,340} }, --Dark Iron Helm
		{ id=16729, skill={300,320,330,340} }, --Lionheart Helm
		{ id=57187, skill={300,325,337,350} }, --Towerforge Crown
	},

	SmithingShoulders = {
		{ name = L["SmithingShoulders1"], icon = "Trade_BlackSmithing" },
		{ id=3328, skill={110,140,155,170} }, --Rough Bronze Shoulders
		{ id=3330, skill={125,155,170,185} }, --Silvered Bronze Shoulders
		{ id=9811, skill={160,185,197,210} }, --Barbaric Iron Shoulders
		{ id=3504, skill={160,185,197,210} }, --Green Iron Shoulders
		{ id=3505, skill={175,200,212,225} }, --Golden Scale Shoulders
		{ id=9926, skill={205,225,235,245} }, --Heavy Mithril Shoulder
		{ id=9952, skill={225,245,255,265} }, --Ornate Mithril Shoulders
		{ id=46630, skill={230,230,230,230} }, --Steel Plate Pauldrons
		{ id=9966, skill={235,255,265,275} }, --Mithril Scale Shoulders
		{ id=16646, skill={265,285,295,305} }, --Imperial Plate Shoulders
		{ id=15295, skill={280,300,310,320} }, --Dark Iron Shoulders
		{ id=16660, skill={290,310,320,330} }, --Dawnbringer Shoulders
		{ id=16664, skill={300,320,330,340} }, --Runic Plate Shoulders
		{ id=24137, skill={300,320,330,340} }, --Bloodsoul Shoulders
		{ id=24141, skill={300,320,330,340} }, --Darksoul Shoulders
		{ id=57026, skill={300,320,330,340} }, --Mantle of Centaur Authority
		{ id=47025, skill={300,320,330,340} }, --Rune-Etched Mantle
		{ id=54005, skill={300,325,337,350} }, --Pauldrons of the Timbermaw
		{ id=55527, skill={300,320,330,340} }, --Otherworldly Spaulders
		{ id=55531, skill={300,320,330,340} }, --Reflective Pauldrons
		{ id=20873, skill={300,320,330,340} }, --Fiery Chain Shoulders
		{ id=57191, skill={300,325,337,350} }, --Towerforge Pauldrons
		{ id=45465, skill={300,325,337,350} }, --Dreamsteel Mantle
	},

	SmithingChest = {
		{ name = L["SmithingChest1"], icon = "Trade_BlackSmithing" },
		{ id=12260, skill={1,15,35,55} }, --Rough Copper Vest
		{ id=3321, skill={35,75,95,115} }, --Copper Chain Vest
		{ id=2667, skill={80,120,140,160} }, --Runed Copper Breastplate
		{ id=8367, skill={100,140,160,180} }, --Ironforge Breastplate
		{ id=2670, skill={105,145,160,175} }, --Rough Bronze Cuirass
		{ id=2673, skill={130,160,175,190} }, --Silvered Bronze Breastplate
		{ id=2675, skill={145,175,190,205} }, --Shining Silver Breastplate
		{ id=9813, skill={160,185,197,210} }, --Barbaric Iron Breastplate
		{ id=3508, skill={180,205,217,230} }, --Green Iron Hauberk
		{ id=3511, skill={195,220,232,245} }, --Golden Scale Cuirass
		{ id=9916, skill={200,225,237,250} }, --Steel Breastplate
		{ id=9972, skill={210,260,270,280} }, --Ornate Mithril Breastplate
		{ id=46629, skill={225,225,225,225} }, --Steel Plate Armor
		{ id=9959, skill={230,250,260,270} }, --Heavy Mithril Breastplate
		{ id=9974, skill={245,265,275,285} }, --Truesilver Breastplate
		{ id=16642, skill={250,270,280,290} }, --Thorium Armor
		{ id=15293, skill={270,290,300,310} }, --Dark Iron Mail
		{ id=16648, skill={270,290,300,310} }, --Radiant Breastplate
		{ id=16650, skill={270,290,300,310} }, --Wildthorn Mail
		{ id=16667, skill={285,305,315,325} }, --Demon Forged Breastplate
		{ id=15296, skill={285,305,315,325} }, --Dark Iron Plate
		{ id=47030, skill={290,300,310,320} }, --Hateforge Cuirass
		{ id=16663, skill={300,320,330,340} }, --Imperial Plate Chest
		{ id=16731, skill={300,320,330,340} }, --Runic Breastplate
		{ id=16745, skill={300,320,330,340} }, --Enchanted Thorium Breastplate
		{ id=24136, skill={300,320,330,340} }, --Bloodsoul Breastplate
		{ id=24914, skill={300,320,330,340} }, --Darkrune Breastplate
		{ id=24139, skill={300,320,330,340} }, --Darksoul Breastplate
		{ id=28461, skill={300,320,330,340} }, --Ironvine Breastplate
		{ id=47023, skill={300,320,330,340} }, --Rune-Etched Breastplate
	},

	SmithingChest2 = {
		{ name = L["SmithingChest2"], icon = "Trade_BlackSmithing" },
		{ id=55528, skill={300,320,330,340} }, --Otherworldly Breastplate
		{ id=55532, skill={300,320,330,340} }, --Reflective Breastplate
		{ id=28242, skill={300,320,330,340} }, --Icebane Breastplate
		{ id=27590, skill={300,320,330,340} }, --Obsidian Mail Tunic
		{ id=27587, skill={300,320,330,340} }, --Thick Obsidian Breastplate
		{ id=54009, skill={300,325,337,350} }, --Fiery Chain Breastplate
		{ id=16746, skill={300,320,330,340} }, --Invulnerable Mail
		{ id=57189, skill={300,325,337,350} }, --Towerforge Breastplate
	},

	SmithingBracers = {
		{ name = L["SmithingBracers1"], icon = "Trade_BlackSmithing" },
		{ id=2663, skill={1,20,40,60} }, --Copper Bracers
		{ id=2664, skill={90,115,127,140} }, --Runed Copper Bracers
		{ id=2671, skill={100,140,160,180} }, --Rough Bronze Bracers
		{ id=2672, skill={120,150,165,180} }, --Patterned Bronze Bracers
		{ id=3501, skill={165,190,202,215} }, --Green Iron Bracers
		{ id=7223, skill={185,210,222,235} }, --Golden Scale Bracers
		{ id=9937, skill={215,235,245,255} }, --Mithril Scale Bracers
		{ id=16644, skill={255,275,285,295} }, --Thorium Bracers
		{ id=16649, skill={270,290,300,310} }, --Imperial Plate Bracers
		{ id=20874, skill={295,315,325,335} }, --Dark Iron Bracers
		{ id=28244, skill={300,320,330,340} }, --Icebane Bracers
		{ id=45469, skill={300,325,337,350} }, --Dreamsteel Bracers
	},

	SmithingGloves = {
		{ name = L["SmithingGloves1"], icon = "Trade_BlackSmithing" },
		{ id=3323, skill={40,80,100,120} }, --Runed Copper Gauntlets
		{ id=3325, skill={60,100,120,140} }, --Gemmed Copper Gauntlets
		{ id=3333, skill={135,165,180,195} }, --Silvered Bronze Gauntlets
		{ id=3336, skill={150,180,195,210} }, --Green Iron Gauntlets
		{ id=9820, skill={185,210,222,235} }, --Barbaric Iron Gloves
		{ id=11643, skill={205,225,235,245} }, --Golden Scale Gauntlets
		{ id=9928, skill={205,225,235,245} }, --Heavy Mithril Gauntlet
		{ id=9950, skill={220,240,250,260} }, --Ornate Mithril Gloves
		{ id=46627, skill={220,220,220,220} }, --Steel Plate Gauntlets
		{ id=9942, skill={220,240,250,260} }, --Mithril Scale Gloves
		{ id=9954, skill={225,245,255,265} }, --Truesilver Gauntlets
		{ id=47033, skill={285,300,310,320} }, --Hateforge Grips
		{ id=16654, skill={285,305,315,325} }, --Radiant Gloves
		{ id=16655, skill={290,310,320,330} }, --Fiery Plate Gauntlets
		{ id=16661, skill={295,315,325,335} }, --Storm Gauntlets
		{ id=24138, skill={300,320,330,340} }, --Bloodsoul Gauntlets
		{ id=24912, skill={300,320,330,340} }, --Darkrune Gauntlets
		{ id=23633, skill={300,320,330,340} }, --Gloves of the Dawn
		{ id=28462, skill={300,320,330,340} }, --Ironvine Gloves
		{ id=47026, skill={300,320,330,340} }, --Rune-Etched Grips
		{ id=27589, skill={300,320,330,340} }, --Black Grasp of the Destroyer
		{ id=28243, skill={300,320,330,340} }, --Icebane Gauntlets
		{ id=23637, skill={300,320,330,340} }, --Dark Iron Gauntlets
		{ id=16741, skill={300,320,330,340} }, --Stronghold Gauntlets
	},

	SmithingBelt = {
		{ name = L["SmithingBelt1"], icon = "Trade_BlackSmithing" },
		{ id=2661, skill={35,75,95,115} }, --Copper Chain Belt
		{ id=2666, skill={70,110,130,150} }, --Runed Copper Belt
		{ id=16643, skill={250,270,280,290} }, --Thorium Belt
		{ id=16645, skill={260,280,290,300} }, --Radiant Belt
		{ id=16647, skill={265,285,295,305} }, --Imperial Plate Belt
		{ id=47032, skill={275,300,312,325} }, --Hateforge Belt
		{ id=23632, skill={290,310,320,330} }, --Girdle of the Dawn
		{ id=23628, skill={290,310,320,330} }, --Heavy Timbermaw Belt
		{ id=27585, skill={300,320,330,340} }, --Heavy Obsidian Belt
		{ id=28463, skill={300,320,330,340} }, --Ironvine Belt
		{ id=27588, skill={300,320,330,340} }, --Light Obsidian Belt
		{ id=54003, skill={290,310,320,330} }, --Fury of the Timbermaw
		{ id=20872, skill={295,315,325,335} }, --Fiery Chain Girdle
	},

	SmithingPants = {
		{ name = L["SmithingPants1"], icon = "Trade_BlackSmithing" },
		{ id=2662, skill={1,50,70,90} }, --Copper Chain Pants
		{ id=3324, skill={45,85,105,125} }, --Runed Copper Pants
		{ id=2668, skill={105,145,160,175} }, --Rough Bronze Leggings
		{ id=3506, skill={155,180,192,205} }, --Green Iron Leggings
		{ id=12259, skill={155,180,192,205} }, --Silvered Bronze Leggings
		{ id=3507, skill={170,195,207,220} }, --Golden Scale Leggings
		{ id=9933, skill={210,230,240,250} }, --Heavy Mithril Pants
		{ id=9931, skill={210,230,240,250} }, --Mithril Scale Pants
		{ id=9957, skill={210,250,260,270} }, --Orcish War Leggings
		{ id=9945, skill={220,240,250,260} }, --Ornate Mithril Pants
		{ id=46628, skill={225,225,225,225} }, --Steel Plate Legguards
		{ id=47031, skill={290,300,310,320} }, --Hateforge Leggings
		{ id=16730, skill={300,320,330,340} }, --Imperial Plate Leggings
		{ id=16725, skill={300,320,330,340} }, --Radiant Leggings
		{ id=16732, skill={300,320,330,340} }, --Runic Plate Leggings
		{ id=16662, skill={300,320,330,340} }, --Thorium Leggings
		{ id=24140, skill={300,320,330,340} }, --Darksoul Leggings
		{ id=47022, skill={300,320,330,340} }, --Rune-Etched Legplates
		{ id=16744, skill={300,320,330,340} }, --Enchanted Thorium Leggings
		{ id=55529, skill={300,320,330,340} }, --Otherworldly Leggings
		{ id=55533, skill={300,320,330,340} }, --Reflective Leggings
		{ id=45467, skill={300,325,337,350} }, --Dreamsteel Leggings
		{ id=20876, skill={300,320,330,340} }, --Dark Iron Leggings
		{ id=27829, skill={300,320,330,340} }, --Titanic Leggings
	},

	SmithingBoots = {
		{ name = L["SmithingBoots1"], icon = "Trade_BlackSmithing" },
		{ id=3319, skill={20,60,80,100} }, --Copper Chain Boots
		{ id=7817, skill={95,125,140,155} }, --Rough Bronze Boots
		{ id=3331, skill={130,160,175,190} }, --Silvered Bronze Boots
		{ id=3334, skill={145,175,190,205} }, --Green Iron Boots
		{ id=9818, skill={180,205,217,230} }, --Barbaric Iron Boots
		{ id=3513, skill={185,210,222,235} }, --Polished Steel Boots
		{ id=3515, skill={200,225,237,250} }, --Golden Scale Boots
		{ id=9979, skill={210,265,275,285} }, --Ornate Mithril Boots
		{ id=46626, skill={220,220,220,220} }, --Steel Plate Boots
		{ id=9968, skill={235,255,265,275} }, --Heavy Mithril Boots
		{ id=47034, skill={275,300,310,320} }, --Hateforge Boots
		{ id=16652, skill={280,300,310,320} }, --Thorium Boots
		{ id=16656, skill={290,310,320,330} }, --Radiant Boots
		{ id=16657, skill={295,315,325,335} }, --Imperial Plate Boots
		{ id=16665, skill={300,320,330,340} }, --Runic Plate Boots
		{ id=23629, skill={300,320,330,340} }, --Heavy Timbermaw Boots
		{ id=47021, skill={300,320,330,340} }, --Rune-Etched Greaves
		{ id=45471, skill={300,325,337,350} }, --Dreamsteel Boots
		{ id=24399, skill={300,320,330,340} }, --Dark Iron Boots
	},

	SmithingAxes = {
		{ name = L["SmithingAxes1"], icon = "Trade_BlackSmithing" },
		{ id=2738, skill={20,60,80,100} }, --Copper Axe
		{ id=3294, skill={70,110,130,150} }, --Thick War Axe
		{ id=2741, skill={115,145,160,175} }, --Bronze Axe
		{ id=21913, skill={190,215,227,240} }, --Edge of Winter
		{ id=9993, skill={210,235,247,260} }, --Heavy Mithril Axe
		{ id=9995, skill={220,245,257,270} }, --Blue Glittering Axe
		{ id=16969, skill={275,300,312,325} }, --Ornate Thorium Handaxe
		{ id=16970, skill={275,300,312,325} }, --Dawn's Edge
		{ id=16991, skill={300,320,330,340} }, --Annihilator
		{ id=20897, skill={300,320,330,340} }, --Dark Iron Destroyer
		{ id=3293, skill={35,75,95,115} }, --Copper Battle Axe
		{ id=9987, skill={135,165,180,195} }, --Bronze Battle Axe
		{ id=3498, skill={185,210,222,235} }, --Massive Iron Axe
		{ id=3500, skill={200,225,237,250} }, --Shadow Crescent Axe
		{ id=16971, skill={280,305,317,330} }, --Huge Thorium Battleaxe
		{ id=16965, skill={270,290,300,310} }, --Bleakwood Hew
		{ id=16994, skill={300,320,330,340} }, --Arcanite Reaper
		{ id=23653, skill={300,320,330,340} }, --Nightfall
	},

	SmithingSwords = {
		{ name = L["SmithingSwords1"], icon = "Trade_BlackSmithing" },
		{ id=2739, skill={25,65,85,105} }, --Copper Shortsword
		{ id=2742, skill={120,150,165,180} }, --Bronze Shortsword
		{ id=3492, skill={160,185,197,210} }, --Hardened Iron Shortsword
		{ id=3493, skill={175,200,212,225} }, --Jade Serpentblade
		{ id=9997, skill={225,250,262,275} }, --Wicked Mithril Blade
		{ id=10005, skill={240,265,277,290} }, --Dazzling Mithril Rapier
		{ id=10007, skill={245,270,282,295} }, --Phantom Blade
		{ id=16978, skill={280,305,317,330} }, --Blazing Rapier
		{ id=16992, skill={300,320,330,340} }, --Frostguard
		{ id=20890, skill={300,320,330,340} }, --Dark Iron Reaver
		{ id=23652, skill={300,320,330,340} }, --Blackguard
		{ id=27832, skill={300,320,330,340} }, --Sageblade
		{ id=46661, skill={300,320,330,340} }, --Dream's Herald
		{ id=9983, skill={30,70,90,110} }, --Copper Claymore
		{ id=3292, skill={95,135,155,175} }, --Heavy Copper Broadsword
		{ id=9986, skill={130,160,175,190} }, --Bronze Greatsword
		{ id=3496, skill={180,205,217,230} }, --Moonsteel Broadsword
		{ id=3497, skill={200,225,237,250} }, --Frost Tiger Blade
		{ id=10015, skill={260,285,297,310} }, --Truesilver Champion
		{ id=16985, skill={290,315,327,340} }, --Corruption
		{ id=16990, skill={300,320,330,340} }, --Arcanite Champion
		{ id=46652, skill={300,320,330,340} }, --Untempered Runeblade
	},

	SmithingMaces = {
		{ name = L["SmithingMaces1"], icon = "Trade_BlackSmithing" },
		{ id=2737, skill={15,55,75,95} }, --Copper Mace
		{ id=2740, skill={110,140,155,170} }, --Bronze Mace
		{ id=3296, skill={130,160,175,190} }, --Heavy Bronze Mace
		{ id=6518, skill={140,170,185,200} }, --Iridescent Hammer
		{ id=3297, skill={145,175,190,205} }, --Mighty Iron Hammer
		{ id=10001, skill={230,255,267,280} }, --Big Black Mace
		{ id=10009, skill={245,270,282,295} }, --Runed Mithril Hammer
		{ id=16984, skill={290,315,327,340} }, --Volcanic Hammer
		{ id=10003, skill={235,260,272,285} }, --The Shatterer
		{ id=16983, skill={285,310,322,335} }, --Serenity
		{ id=16993, skill={300,320,330,340} }, --Masterwork Stormhammer
		{ id=23650, skill={300,320,330,340} }, --Ebon Hand
		{ id=27830, skill={300,320,330,340} }, --Persuader
		{ id=7408, skill={65,105,125,145} }, --Heavy Copper Maul
		{ id=9985, skill={125,155,170,185} }, --Bronze Warhammer
		{ id=3494, skill={155,180,192,205} }, --Solid Iron Maul
		{ id=3495, skill={170,195,207,220} }, --Golden Iron Destroyer
		{ id=15292, skill={265,285,295,305} }, --Dark Iron Pulverizer
		{ id=16973, skill={280,305,317,330} }, --Enchanted Battlehammer
		{ id=16988, skill={300,320,330,340} }, --Hammer of the Titans
		{ id=57193, skill={300,325,337,350} }, --Towerforge Demolisher
		{ id=45487, skill={300,325,337,350} }, --Dawnstone Hammer
		{ id=21161, skill={300,325,337,350} }, --Sulfuron Hammer
	},

	SmithingFist = {
		{ name = L["SmithingFist1"], icon = "Trade_BlackSmithing" },
		{ id=46663, skill={30,60,62,65} }, --Copper Knuckles
		{ id=46664, skill={75,90,95,100} }, --Sharpened Claw
		{ id=46665, skill={120,140,145,150} }, --Bronze Bruiser
		{ id=16986, skill={300,320,330,340} }, --Blood Talon
	},

	SmithingDaggers = {
		{ name = L["SmithingDaggers1"], icon = "Trade_BlackSmithing" },
		{ id=8880, skill={30,70,90,110} }, --Copper Dagger
		{ id=3491, skill={105,135,150,165} }, --Big Bronze Knife
		{ id=6517, skill={110,140,155,170} }, --Pearl-handled Dagger
		{ id=3295, skill={125,155,170,185} }, --Deadly Bronze Poniard
		{ id=15972, skill={180,205,217,230} }, --Glinting Steel Dagger
		{ id=15973, skill={190,215,227,240} }, --Searing Golden Blade
		{ id=10013, skill={255,280,292,305} }, --Ebon Shiv
		{ id=16995, skill={300,320,330,340} }, --Heartseeker
		{ id=23638, skill={300,320,330,340} }, --Black Amnesty
		{ id=46657, skill={300,320,330,340} }, --Ornate Bloodstone Dagger
	},

	SmithingBuckles = {
		{ name = L["SmithingBuckles1"], icon = "Trade_BlackSmithing" },
		{ id=57163, skill={25,25,37,50} }, --Copper Belt Buckle
		{ id=57166, skill={90,90,97,105} }, --Bronze Belt Buckle
		{ id=57169, skill={140,140,147,155} }, --Iron Belt Buckle
		{ id=57172, skill={185,190,197,205} }, --Mithril Belt Buckle
		{ id=57175, skill={240,240,247,255} }, --Thorium Belt Buckle
		{ id=57178, skill={275,275,282,290} }, --Arcanite Belt Buckle
		{ id=57196, skill={300,300,300,300} }, --Bloody Belt Buckle
		{ id=57181, skill={300,300,305,310} }, --Dreamsteel Belt Buckle
	},

	SmithingMisc = {
		{ name = L["Misc"], icon = "Trade_BlackSmithing" },
		{ id=2660, skill={1,15,35,55} }, --Rough Sharpening Stone
		{ id=2665, skill={65,65,72,80} }, --Coarse Sharpening Stone
		{ id=2674, skill={125,125,132,140} }, --Heavy Sharpening Stone
		{ id=9918, skill={200,200,205,210} }, --Solid Sharpening Stone
		{ id=16641, skill={250,255,257,260} }, --Dense Sharpening Stone
		{ id=3115, skill={1,15,35,55} }, --Rough Weightstone
		{ id=3116, skill={65,65,72,80} }, --Coarse Weightstone
		{ id=3117, skill={125,125,132,140} }, --Heavy Weightstone
		{ id=9921, skill={200,200,205,210} }, --Solid Weightstone
		{ id=16640, skill={250,255,257,260} }, --Dense Weightstone
		{ id=22757, skill={300,300,310,320} }, --Elemental Sharpening Stone
		{ id=9964, skill={235,255,265,275} }, --Mithril Spurs
		{ id=57113, skill={275,300,310,320} }, --Thorium Spurs
		{ id=7221, skill={150,180,195,210} }, --Iron Shield Spike
		{ id=9939, skill={215,235,245,255} }, --Mithril Shield Spike
		{ id=16651, skill={275,295,305,315} }, --Thorium Shield Spike
		{ id=45063, skill={75,100,120,140} }, --Blast Shield
		{ id=27586, skill={300,320,330,340} }, --Jagged Obsidian Shield
		{ id=7222, skill={165,190,202,215} }, --Iron Counterweight
		{ id=7224, skill={190,215,227,240} }, --Steel Weapon Chain
		{ id=8768, skill={150,150,152,155} }, --Iron Buckle
		{ id=11454, skill={200,225,237,250} }, --Inlaid Mithril Cylinder
		{ id=19666, skill={100,100,110,120} }, --Silver Skeleton Key
		{ id=19667, skill={150,150,160,170} }, --Golden Skeleton Key
		{ id=19668, skill={200,200,210,220} }, --Truesilver Skeleton Key
		{ id=19669, skill={275,275,280,285} }, --Arcanite Skeleton Key
		{ id=3320, skill={25,45,65,85} }, --Rough Grinding Stone
		{ id=3326, skill={75,75,87,100} }, --Coarse Grinding Stone
		{ id=3337, skill={125,125,137,150} }, --Heavy Grinding Stone
		{ id=9920, skill={200,200,205,210} }, --Solid Grinding Stone
		{ id=16639, skill={250,255,257,260} }, --Dense Grinding Stone
		{ id=7818, skill={100,105,107,110} }, --Silver Rod
		{ id=14379, skill={150,155,157,160} }, --Golden Rod
		{ id=14380, skill={200,205,207,210} }, --Truesilver Rod
		{ id=20201, skill={275,275,280,285} }, --Arcanite Rod
	},

	LeatherApprentice = {
		{ name = L["LeatherApprentice1"], icon = "Trade_Generic" },
		{ id=2881, skill={1,20,30,40} }, --Light Leather
		{ id=2152, skill={1,30,45,60} }, --Light Armor Kit
		{ id=2149, skill={1,40,55,70} }, --Handstitched Leather Boots
		{ id=9059, skill={1,40,55,70} }, --Handstitched Leather Bracers
		{ id=9058, skill={1,40,55,70} }, --Handstitched Leather Cloak
		{ id=7126, skill={1,40,55,70} }, --Handstitched Leather Vest
		{ id=2153, skill={15,45,60,75} }, --Handstitched Leather Pants
		{ id=3753, skill={25,55,70,85} }, --Handstitched Leather Belt
		{ id=9060, skill={30,60,75,90} }, --Light Leather Quiver
		{ id=9062, skill={30,60,75,90} }, --Small Leather Ammo Pouch
		{ id=3816, skill={35,55,65,75} }, --Cured Light Hide
		{ id=9064, skill={35,65,80,95} }, --Rugged Leather Pants
		{ id=5244, skill={40,70,85,100} }, --Kodo Hide Bag
		{ id=2160, skill={40,70,85,100} }, --Embossed Leather Vest
		{ id=3756, skill={55,85,100,115} }, --Embossed Leather Gloves
		{ id=2161, skill={55,85,100,115} }, --Embossed Leather Boots
		{ id=2162, skill={60,90,105,120} }, --Embossed Leather Cloak
		{ id=2163, skill={60,90,105,120} }, --White Leather Jerkin
		{ id=9065, skill={70,100,115,130} }, --Light Leather Bracers
		{ id=3759, skill={75,105,120,135} }, --Embossed Leather Pants
		{ id=2164, skill={75,105,120,135} }, --Fine Leather Gloves
		{ id=45069, skill={75,105,120,135} }, --Lynxstep Boots
	},

	LeatherJourneyman = {
		{ name = L["LeatherJourneyman1"], icon = "Trade_Generic" },
		{ id=3763, skill={80,110,125,140} }, --Fine Leather Belt
		{ id=2159, skill={85,105,120,135} }, --Fine Leather Cloak
		{ id=3761, skill={85,115,130,145} }, --Fine Leather Tunic
		{ id=8322, skill={90,115,130,145} }, --Moonglow Vest
		{ id=2158, skill={90,120,135,150} }, --Fine Leather Boots
		{ id=7953, skill={90,120,135,150} }, --Deviate Scale Cloak
		{ id=6702, skill={90,120,135,150} }, --Murloc Scale Belt
		{ id=9068, skill={95,125,140,155} }, --Light Leather Pants
		{ id=6703, skill={95,125,140,155} }, --Murloc Scale Breastplate
		{ id=20648, skill={100,100,105,110} }, --Medium Leather
		{ id=3817, skill={100,115,122,130} }, --Cured Medium Hide
		{ id=2165, skill={100,115,122,130} }, --Medium Armor Kit
		{ id=2167, skill={100,125,137,150} }, --Dark Leather Boots
		{ id=9070, skill={100,125,137,150} }, --Black Whelp Cloak
		{ id=24940, skill={100,125,137,150} }, --Black Whelp Tunic
		{ id=2169, skill={100,125,137,150} }, --Dark Leather Tunic
		{ id=3762, skill={100,125,137,150} }, --Hillman's Leather Vest
		{ id=7954, skill={105,130,142,155} }, --Deviate Scale Gloves
		{ id=7133, skill={105,130,142,155} }, --Fine Leather Pants
		{ id=2168, skill={110,135,147,160} }, --Dark Leather Cloak
		{ id=7135, skill={115,140,152,165} }, --Dark Leather Pants
		{ id=7955, skill={115,140,152,165} }, --Deviate Scale Belt
		{ id=2166, skill={120,145,157,170} }, --Toughened Leather Armor
		{ id=3767, skill={120,145,157,170} }, --Hillman's Belt
		{ id=9074, skill={120,145,157,170} }, --Nimble Leather Gloves
		{ id=9072, skill={120,145,157,170} }, --Red Whelp Gloves
		{ id=3765, skill={120,155,167,180} }, --Dark Leather Gloves
		{ id=3766, skill={125,150,162,175} }, --Dark Leather Belt
		{ id=9145, skill={125,150,162,175} }, --Fletcher's Gloves
		{ id=3768, skill={130,155,167,180} }, --Hillman's Shoulders
	},

	LeatherJourneyman2 = {
		{ name = L["LeatherJourneyman2"], icon = "Trade_Generic" },
		{ id=9147, skill={135,160,172,185} }, --Earthen Leather Shoulders
		{ id=9146, skill={135,160,172,185} }, --Herbalist's Gloves
		{ id=3770, skill={135,160,172,185} }, --Toughened Leather Gloves
		{ id=3769, skill={140,165,177,190} }, --Dark Leather Shoulders
		{ id=9148, skill={140,165,177,190} }, --Pilferer's Gloves
		{ id=9149, skill={145,170,182,195} }, --Heavy Earthen Gloves
		{ id=3764, skill={145,170,182,195} }, --Hillman's Leather Gloves
		{ id=20649, skill={150,150,155,160} }, --Heavy Leather
		{ id=23190, skill={150,150,155,160} }, --Heavy Leather Ball
		{ id=3818, skill={150,160,165,170} }, --Cured Heavy Hide
		{ id=3760, skill={150,170,180,190} }, --Hillman's Cloak
		{ id=3771, skill={150,170,180,190} }, --Barbaric Gloves
		{ id=9194, skill={150,170,180,190} }, --Heavy Leather Ammo Pouch
		{ id=9193, skill={150,170,180,190} }, --Heavy Quiver
		{ id=3780, skill={150,170,180,190} }, --Heavy Armor Kit
	},

	LeatherExpert = {
		{ name = L["LeatherExpert1"], icon = "Trade_Generic" },
		{ id=3772, skill={155,175,185,195} }, --Green Leather Armor
		{ id=23399, skill={155,175,185,195} }, --Barbaric Bracers
		{ id=3774, skill={160,180,190,200} }, --Green Leather Belt
		{ id=7147, skill={160,180,190,200} }, --Guardian Pants
		{ id=9195, skill={165,185,195,205} }, --Dusky Leather Leggings
		{ id=4097, skill={165,185,195,205} }, --Raptor Hide Belt
		{ id=4096, skill={165,185,195,205} }, --Raptor Hide Harness
		{ id=7149, skill={170,190,200,210} }, --Barbaric Leggings
		{ id=3775, skill={170,190,200,210} }, --Guardian Belt
		{ id=6704, skill={170,190,200,210} }, --Thick Murloc Armor
		{ id=7151, skill={175,195,205,215} }, --Barbaric Shoulders
		{ id=9196, skill={175,195,205,215} }, --Dusky Leather Armor
		{ id=9197, skill={175,195,205,215} }, --Green Whelp Armor
		{ id=3773, skill={175,195,205,215} }, --Guardian Armor
		{ id=9198, skill={180,200,210,220} }, --Frost Leather Cloak
		{ id=3776, skill={180,200,210,220} }, --Green Leather Bracers
		{ id=9201, skill={185,205,215,225} }, --Dusky Bracers
		{ id=7153, skill={185,205,215,225} }, --Guardian Cloak
		{ id=3778, skill={185,205,215,225} }, --Gem-studded Leather Belt
		{ id=6661, skill={190,210,220,230} }, --Barbaric Harness
		{ id=7156, skill={190,210,220,230} }, --Guardian Gloves
		{ id=21943, skill={190,210,220,230} }, --Gloves of the Greatfather
		{ id=9202, skill={190,210,220,230} }, --Green Whelp Bracers
		{ id=6705, skill={190,210,220,230} }, --Murloc Scale Bracers
		{ id=9206, skill={195,215,225,235} }, --Dusky Belt
		{ id=3777, skill={195,215,225,235} }, --Guardian Leather Bracers
		{ id=10482, skill={200,200,200,200} }, --Cured Thick Hide
		{ id=20650, skill={200,200,202,205} }, --Thick Leather
		{ id=22711, skill={200,210,220,230} }, --Shadowskin Gloves
		{ id=10487, skill={200,220,230,240} }, --Thick Armor Kit
	},

	LeatherExpert2 = {
		{ name = L["LeatherExpert2"], icon = "Trade_Generic" },
		{ id=46620, skill={200,215,220,225} }, --Grifter's Boots
		{ id=46621, skill={200,215,220,225} }, --Grifter's Gauntlets
		{ id=46622, skill={200,215,220,225} }, --Grifter's Belt
		{ id=3779, skill={200,220,230,240} }, --Barbaric Belt
		{ id=10490, skill={200,220,230,240} }, --Comfortable Leather Hat
		{ id=9207, skill={200,220,230,240} }, --Dusky Boots
		{ id=9208, skill={200,220,230,240} }, --Swift Boots
		{ id=46623, skill={205,225,230,235} }, --Grifter's Leggings
		{ id=10507, skill={205,225,235,245} }, --Nightscape Headband
		{ id=10499, skill={205,225,235,245} }, --Nightscape Tunic
		{ id=10509, skill={205,225,235,245} }, --Turtle Scale Gloves
		{ id=46625, skill={210,225,230,235} }, --Grifter's Cover
		{ id=46624, skill={210,235,240,245} }, --Grifter's Tunic
		{ id=10516, skill={210,230,240,250} }, --Nightscape Shoulders
		{ id=10518, skill={210,230,240,250} }, --Turtle Scale Bracers
		{ id=10511, skill={210,230,240,250} }, --Turtle Scale Breastplate
		{ id=10520, skill={215,235,245,255} }, --Big Voodoo Robe
		{ id=10531, skill={220,240,250,260} }, --Big Voodoo Mask
		{ id=10533, skill={220,240,250,260} }, --Tough Scorpid Bracers
		{ id=10525, skill={220,240,250,260} }, --Tough Scorpid Breastplate
		{ id=10529, skill={220,240,250,260} }, --Wild Leather Shoulders
		{ id=14930, skill={225,245,255,265} }, --Quickdraw Quiver
		{ id=14932, skill={225,245,255,265} }, --Thick Leather Ammo Pouch
		{ id=10542, skill={225,245,255,265} }, --Tough Scorpid Gloves
		{ id=10546, skill={225,245,255,265} }, --Wild Leather Helmet
		{ id=10544, skill={225,245,255,265} }, --Wild Leather Vest
	},

	LeatherArtisan = {
		{ name = L["LeatherArtisan1"], icon = "Trade_Generic" },
		{ id=10548, skill={230,250,260,270} }, --Nightscape Pants
		{ id=10550, skill={230,250,260,270} }, --Nightscape Cloak
		{ id=10552, skill={230,250,260,270} }, --Turtle Scale Helm
		{ id=10558, skill={235,255,265,275} }, --Nightscape Boots
		{ id=10554, skill={235,255,265,275} }, --Tough Scorpid Boots
		{ id=10556, skill={235,255,265,275} }, --Turtle Scale Leggings
		{ id=10562, skill={240,260,270,280} }, --Big Voodoo Cloak
		{ id=10560, skill={240,260,270,280} }, --Big Voodoo Pants
		{ id=10564, skill={240,260,270,280} }, --Tough Scorpid Shoulders
		{ id=10568, skill={245,265,275,285} }, --Tough Scorpid Leggings
		{ id=10566, skill={245,265,275,285} }, --Wild Leather Boots
		{ id=22331, skill={250,250,250,250} }, --Rugged Leather
		{ id=19047, skill={250,250,255,260} }, --Cured Rugged Hide
		{ id=19058, skill={250,255,265,275} }, --Rugged Armor Kit
		{ id=10647, skill={250,270,280,290} }, --Feathered Breastplate
		{ id=10570, skill={250,270,280,290} }, --Tough Scorpid Helm
		{ id=10574, skill={250,270,280,290} }, --Wild Leather Cloak
		{ id=10572, skill={250,270,280,290} }, --Wild Leather Leggings
		{ id=19048, skill={255,275,285,295} }, --Heavy Scorpid Bracers
		{ id=19049, skill={260,280,290,300} }, --Wicked Leather Gauntlets
		{ id=19051, skill={265,285,295,305} }, --Heavy Scorpid Vest
		{ id=19052, skill={265,285,295,305} }, --Wicked Leather Bracers
		{ id=57008, skill={265,1,1,1} }, --Breastplate of the Earth
		{ id=19055, skill={270,290,300,310} }, --Runic Leather Gauntlets
		{ id=47015, skill={270,285,290,295} }, --Primalist's Gloves
		{ id=47017, skill={270,290,291,295} }, --Primalist's Headdress
		{ id=47020, skill={275,290,291,295} }, --Primalist's Boots
		{ id=22815, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ id=19064, skill={275,295,305,315} }, --Heavy Scorpid Gauntlets
		{ id=19065, skill={275,295,305,315} }, --Runic Leather Bracers
	},

	LeatherArtisan2 = {
		{ name = L["LeatherArtisan2"], icon = "Trade_Generic" },
		{ id=47018, skill={280,290,291,295} }, --Primalist's Pants
		{ id=47016, skill={280,285,290,295} }, --Primalist's Shoulders
		{ id=19070, skill={280,300,310,320} }, --Heavy Scorpid Belt
		{ id=19072, skill={280,300,310,320} }, --Runic Leather Belt
		{ id=19071, skill={280,300,310,320} }, --Wicked Leather Headband
		{ id=47019, skill={285,290,291,295} }, --Primalist's Vest
		{ id=19075, skill={285,305,315,325} }, --Heavy Scorpid Leggings
		{ id=19082, skill={290,310,320,330} }, --Runic Leather Headband
		{ id=19083, skill={290,310,320,330} }, --Wicked Leather Pants
		{ id=23705, skill={290,310,320,330} }, --Dawn Treaders
		{ id=23703, skill={290,310,320,330} }, --Might of the Timbermaw
		{ id=19088, skill={295,315,325,335} }, --Heavy Scorpid Helm
		{ id=19100, skill={300,320,330,340} }, --Heavy Scorpid Shoulders
		{ id=19102, skill={300,320,330,340} }, --Runic Leather Armor
		{ id=19091, skill={300,320,330,340} }, --Runic Leather Pants
		{ id=19103, skill={300,320,330,340} }, --Runic Leather Shoulders
		{ id=19098, skill={300,320,330,340} }, --Wicked Leather Armor
		{ id=19092, skill={300,320,330,340} }, --Wicked Leather Belt
		{ id=24124, skill={300,320,330,340} }, --Blood Tiger Breastplate
		{ id=24125, skill={300,320,330,340} }, --Blood Tiger Shoulders
		{ id=28474, skill={300,320,330,340} }, --Bramblewood Belt
		{ id=28473, skill={300,320,330,340} }, --Bramblewood Boots
		{ id=28472, skill={300,320,330,340} }, --Bramblewood Helm
		{ id=22727, skill={300,320,330,340} }, --Core Armor Kit
		{ id=22921, skill={300,320,330,340} }, --Girdle of Insight
		{ id=23706, skill={300,320,330,340} }, --Golden Mantle of the Dawn
		{ id=22922, skill={300,320,330,340} }, --Mongoose Boots
		{ id=19093, skill={300,320,330,340} }, --Onyxia Scale Cloak
		{ id=24123, skill={300,320,330,340} }, --Primal Batskin Bracers
		{ id=24122, skill={300,320,330,340} }, --Primal Batskin Gloves
	},

	LeatherArtisan3 = {
		{ name = L["LeatherArtisan3"], icon = "Trade_Generic" },
		{ id=24121, skill={300,320,330,340} }, --Primal Batskin Jerkin
		{ id=24849, skill={300,320,330,340} }, --Sandstalker Bracers
		{ id=24851, skill={300,320,330,340} }, --Sandstalker Breastplate
		{ id=57022, skill={300,320,330,340} }, --Centaur Battle Harness
		{ id=24850, skill={300,320,330,340} }, --Sandstalker Gauntlets
		{ id=24846, skill={300,320,330,340} }, --Spitfire Bracers
		{ id=24848, skill={300,320,330,340} }, --Spitfire Breastplate
		{ id=24847, skill={300,320,330,340} }, --Spitfire Gauntlets
		{ id=22923, skill={300,320,330,340} }, --Swift Flight Bracers
		{ id=23704, skill={300,320,330,340} }, --Timbermaw Brawlers
		{ id=55522, skill={300,300,300,300} }, --Ethereal Helmet
		{ id=55523, skill={300,300,300,300} }, --Ethereal Shoulder Pads
		{ id=55524, skill={300,300,300,300} }, --Ethereal Tunic
		{ id=55525, skill={300,300,300,300} }, --Ethereal Leggings
		{ id=57115, skill={300,320,330,340} }, --Enchanted Armor Kit
		{ id=28224, skill={300,320,330,340} }, --Icy Scale Bracers
		{ id=28222, skill={300,320,330,340} }, --Icy Scale Breastplate
		{ id=28223, skill={300,320,330,340} }, --Icy Scale Gauntlets
		{ id=23707, skill={300,320,330,340} }, --Lava Belt
		{ id=28221, skill={300,320,330,340} }, --Polar Bracers
		{ id=28220, skill={300,320,330,340} }, --Polar Gloves
		{ id=28219, skill={300,320,330,340} }, --Polar Tunic
		{ id=45473, skill={300,320,330,340} }, --Dreamhide Mantle
		{ id=45475, skill={300,320,330,340} }, --Dreamhide Bracers
		{ id=45477, skill={300,320,330,340} }, --Dreamhide Leggings
		{ id=45479, skill={300,320,330,340} }, --Dreamhide Belt
		{ id=45483, skill={300,320,330,340} }, --Inscribed Runic Bracers
		{ id=45455, skill={300,320,330,340} }, --Dreamhide
	},

	Dragonscale = {
		{ name = L["Dragonscale1"], icon = "Trade_Generic" },
		{ id=10619, skill={225,245,255,265} }, --Dragonscale Gauntlets
		{ id=46695, skill={245,245,245,245} }, --Dragonscale Leggings
		{ id=10650, skill={255,275,285,295} }, --Dragonscale Breastplate
		{ id=19050, skill={260,280,290,300} }, --Green Dragonscale Breastplate
		{ id=19060, skill={270,290,300,310} }, --Green Dragonscale Leggings
		{ id=24655, skill={280,300,310,320} }, --Green Dragonscale Gauntlets
		{ id=19077, skill={285,305,315,325} }, --Blue Dragonscale Breastplate
		{ id=19085, skill={290,310,320,330} }, --Black Dragonscale Breastplate
		{ id=54001, skill={290,315,325,335} }, --Blue Dragonscale Boots
		{ id=19089, skill={295,315,325,335} }, --Blue Dragonscale Shoulders
		{ id=46655, skill={295,300,300,300} }, --Red Dragonscale Boots
		{ id=46653, skill={295,300,300,300} }, --Red Dragonscale Leggings
		{ id=46654, skill={300,300,300,300} }, --Red Dragonscale Shoulders
		{ id=19107, skill={300,320,330,340} }, --Black Dragonscale Leggings
		{ id=24654, skill={300,320,330,340} }, --Blue Dragonscale Leggings
		{ id=19094, skill={300,320,330,340} }, --Black Dragonscale Shoulders
		{ id=19054, skill={300,320,330,340} }, --Red Dragonscale Breastplate
		{ id=20855, skill={300,320,330,340} }, --Black Dragonscale Boots
		{ id=22926, skill={300,320,330,340} }, --Chromatic Cloak
		{ id=23708, skill={300,320,330,340} }, --Chromatic Gauntlets
		{ id=24703, skill={300,320,330,340} }, --Dreamscale Breastplate
		{ id=46659, skill={300,300,300,300} }, --Stormscale Leggings
		{ id=54013, skill={300,300,300,300} }, --Chromatic Leggings
	},

	Elemental = {
		{ name = L["Elemental1"], icon = "Trade_Generic" },
		{ id=10630, skill={230,250,260,270} }, --Gauntlets of the Sea
		{ id=10632, skill={250,270,280,290} }, --Helm of Fire
		{ id=57010, skill={255,255,255,255} }, --Boots of the Wind
		{ id=19059, skill={270,290,300,310} }, --Volcanic Leggings
		{ id=19061, skill={270,290,300,310} }, --Living Shoulders
		{ id=19067, skill={275,295,305,315} }, --Stormshroud Pants
		{ id=19076, skill={285,305,315,325} }, --Volcanic Breastplate
		{ id=19078, skill={285,305,315,325} }, --Living Leggings
		{ id=19079, skill={285,305,315,325} }, --Stormshroud Armor
		{ id=19090, skill={295,315,325,335} }, --Stormshroud Shoulders
		{ id=19101, skill={300,320,330,340} }, --Volcanic Shoulders
		{ id=19095, skill={300,320,330,340} }, --Living Breastplate
		{ id=26279, skill={300,320,330,340} }, --Stormshroud Gloves
		{ id=23710, skill={300,320,330,340} }, --Molten Belt
		{ id=20854, skill={300,320,330,340} }, --Molten Helm
		{ id=22928, skill={300,320,330,340} }, --Shifting Cloak
		{ id=57016, skill={300,300,300,300} }, --Depthstalker Helm
		{ id=57012, skill={300,300,300,300} }, --Earthguard Tunic
		{ id=57014, skill={300,300,300,300} }, --Flamewrath Leggings
		{ id=57018, skill={300,300,300,300} }, --Windwalker Boots
		{ id=54015, skill={300,300,300,300} }, --Molten Leggings
	},

	Tribal = {
		{ name = L["Tribal1"], icon = "Trade_Generic" },
		{ id=10621, skill={225,245,255,265} }, --Wolfshead Helm
		{ id=19053, skill={265,270,280,290} }, --Chimeric Gloves
		{ id=19062, skill={270,290,300,310} }, --Ironfeather Shoulders
		{ id=19063, skill={275,295,305,315} }, --Chimeric Boots
		{ id=19066, skill={275,295,305,315} }, --Frostsaber Boots
		{ id=19068, skill={275,295,305,315} }, --Warbear Harness
		{ id=19073, skill={280,300,310,320} }, --Chimeric Leggings
		{ id=19074, skill={285,305,315,325} }, --Frostsaber Leggings
		{ id=19080, skill={285,305,315,325} }, --Warbear Woolies
		{ id=19081, skill={290,310,320,330} }, --Chimeric Vest
		{ id=19084, skill={290,310,320,330} }, --Devilsaur Gauntlets
		{ id=19086, skill={290,310,320,330} }, --Ironfeather Breastplate
		{ id=19087, skill={295,315,325,335} }, --Frostsaber Gloves
		{ id=20853, skill={295,315,325,335} }, --Corehound Boots
		{ id=19104, skill={300,320,330,340} }, --Frostsaber Tunic
		{ id=19097, skill={300,320,330,340} }, --Devilsaur Leggings
		{ id=23709, skill={300,320,330,340} }, --Corehound Belt
		{ id=22927, skill={300,320,330,340} }, --Hide of the Wild
		{ id=47035, skill={300,300,300,300} }, --Verdant Dreamer's Breastplate
		{ id=54007, skill={300,300,300,300} }, --Corehound Gloves
	},

	LeatherHelm = {
		{ name = L["LeatherHelm1"], icon = "Trade_Generic" },
		{ id=10490, skill={200,220,230,240} }, --Comfortable Leather Hat
		{ id=46625, skill={210,225,230,235} }, --Grifter's Cover
		{ id=10531, skill={220,240,250,260} }, --Big Voodoo Mask
		{ id=10546, skill={225,245,255,265} }, --Wild Leather Helmet
		{ id=10621, skill={225,245,255,265} }, --Wolfshead Helm
		{ id=10552, skill={230,250,260,270} }, --Turtle Scale Helm
		{ id=10570, skill={250,270,280,290} }, --Tough Scorpid Helm
		{ id=10632, skill={250,270,280,290} }, --Helm of Fire
		{ id=47017, skill={270,290,291,295} }, --Primalist's Headdress
		{ id=19071, skill={280,300,310,320} }, --Wicked Leather Headband
		{ id=19082, skill={290,310,320,330} }, --Runic Leather Headband
		{ id=19088, skill={295,315,325,335} }, --Heavy Scorpid Helm
		{ id=28472, skill={300,320,330,340} }, --Bramblewood Helm
		{ id=55522, skill={300,300,300,300} }, --Ethereal Helmet
		{ id=20854, skill={300,320,330,340} }, --Molten Helm
		{ id=57016, skill={300,300,300,300} }, --Depthstalker Helm
	},

	LeatherShoulders = {
		{ name = L["LeatherShoulders1"], icon = "Trade_Generic" },
		{ id=3768, skill={130,155,167,180} }, --Hillman's Shoulders
		{ id=9147, skill={135,160,172,185} }, --Earthen Leather Shoulders
		{ id=3769, skill={140,165,177,190} }, --Dark Leather Shoulders
		{ id=7151, skill={175,195,205,215} }, --Barbaric Shoulders
		{ id=10516, skill={210,230,240,250} }, --Nightscape Shoulders
		{ id=10529, skill={220,240,250,260} }, --Wild Leather Shoulders
		{ id=10564, skill={240,260,270,280} }, --Tough Scorpid Shoulders
		{ id=19061, skill={270,290,300,310} }, --Living Shoulders
		{ id=19062, skill={270,290,300,310} }, --Ironfeather Shoulders
		{ id=47016, skill={280,285,290,295} }, --Primalist's Shoulders
		{ id=19089, skill={295,315,325,335} }, --Blue Dragonscale Shoulders
		{ id=19090, skill={295,315,325,335} }, --Stormshroud Shoulders
		{ id=19100, skill={300,320,330,340} }, --Heavy Scorpid Shoulders
		{ id=19103, skill={300,320,330,340} }, --Runic Leather Shoulders
		{ id=19101, skill={300,320,330,340} }, --Volcanic Shoulders
		{ id=24125, skill={300,320,330,340} }, --Blood Tiger Shoulders
		{ id=23706, skill={300,320,330,340} }, --Golden Mantle of the Dawn
		{ id=46654, skill={300,300,300,300} }, --Red Dragonscale Shoulders
		{ id=19094, skill={300,320,330,340} }, --Black Dragonscale Shoulders
		{ id=55523, skill={300,300,300,300} }, --Ethereal Shoulder Pads
		{ id=45473, skill={300,320,330,340} }, --Dreamhide Mantle
	},

	LeatherCloak = {
		{ name = L["LeatherCloak1"], icon = "Trade_Generic" },
		{ id=9058, skill={1,40,55,70} }, --Handstitched Leather Cloak
		{ id=2162, skill={60,90,105,120} }, --Embossed Leather Cloak
		{ id=2159, skill={85,105,120,135} }, --Fine Leather Cloak
		{ id=7953, skill={90,120,135,150} }, --Deviate Scale Cloak
		{ id=9070, skill={100,125,137,150} }, --Black Whelp Cloak
		{ id=2168, skill={110,135,147,160} }, --Dark Leather Cloak
		{ id=3760, skill={150,170,180,190} }, --Hillman's Cloak
		{ id=9198, skill={180,200,210,220} }, --Frost Leather Cloak
		{ id=7153, skill={185,205,215,225} }, --Guardian Cloak
		{ id=10550, skill={230,250,260,270} }, --Nightscape Cloak
		{ id=10562, skill={240,260,270,280} }, --Big Voodoo Cloak
		{ id=10574, skill={250,270,280,290} }, --Wild Leather Cloak
		{ id=19093, skill={300,320,330,340} }, --Onyxia Scale Cloak
		{ id=22926, skill={300,320,330,340} }, --Chromatic Cloak
		{ id=22928, skill={300,320,330,340} }, --Shifting Cloak
		{ id=22927, skill={300,320,330,340} }, --Hide of the Wild
	},

	LeatherChest = {
		{ name = L["LeatherChest1"], icon = "Trade_Generic" },
		{ id=7126, skill={1,40,55,70} }, --Handstitched Leather Vest
		{ id=2160, skill={40,70,85,100} }, --Embossed Leather Vest
		{ id=2163, skill={60,90,105,120} }, --White Leather Jerkin
		{ id=3761, skill={85,115,130,145} }, --Fine Leather Tunic
		{ id=8322, skill={90,115,130,145} }, --Moonglow Vest
		{ id=6703, skill={95,125,140,155} }, --Murloc Scale Breastplate
		{ id=24940, skill={100,125,137,150} }, --Black Whelp Tunic
		{ id=2169, skill={100,125,137,150} }, --Dark Leather Tunic
		{ id=3762, skill={100,125,137,150} }, --Hillman's Leather Vest
		{ id=2166, skill={120,145,157,170} }, --Toughened Leather Armor
		{ id=3772, skill={155,175,185,195} }, --Green Leather Armor
		{ id=4096, skill={165,185,195,205} }, --Raptor Hide Harness
		{ id=6704, skill={170,190,200,210} }, --Thick Murloc Armor
		{ id=9196, skill={175,195,205,215} }, --Dusky Leather Armor
		{ id=9197, skill={175,195,205,215} }, --Green Whelp Armor
		{ id=3773, skill={175,195,205,215} }, --Guardian Armor
		{ id=6661, skill={190,210,220,230} }, --Barbaric Harness
		{ id=10499, skill={205,225,235,245} }, --Nightscape Tunic
		{ id=46624, skill={210,235,240,245} }, --Grifter's Tunic
		{ id=10511, skill={210,230,240,250} }, --Turtle Scale Breastplate
		{ id=10520, skill={215,235,245,255} }, --Big Voodoo Robe
		{ id=10525, skill={220,240,250,260} }, --Tough Scorpid Breastplate
		{ id=10544, skill={225,245,255,265} }, --Wild Leather Vest
		{ id=10647, skill={250,270,280,290} }, --Feathered Breastplate
		{ id=10650, skill={255,275,285,295} }, --Dragonscale Breastplate
		{ id=19050, skill={260,280,290,300} }, --Green Dragonscale Breastplate
		{ id=19051, skill={265,285,295,305} }, --Heavy Scorpid Vest
		{ id=57008, skill={265,1,1,1} }, --Breastplate of the Earth
		{ id=22815, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ id=19068, skill={275,295,305,315} }, --Warbear Harness
	},

	LeatherChest2 = {
		{ name = L["LeatherChest2"], icon = "Trade_Generic" },
		{ id=47019, skill={285,290,291,295} }, --Primalist's Vest
		{ id=19076, skill={285,305,315,325} }, --Volcanic Breastplate
		{ id=19077, skill={285,305,315,325} }, --Blue Dragonscale Breastplate
		{ id=19079, skill={285,305,315,325} }, --Stormshroud Armor
		{ id=19081, skill={290,310,320,330} }, --Chimeric Vest
		{ id=19086, skill={290,310,320,330} }, --Ironfeather Breastplate
		{ id=19085, skill={290,310,320,330} }, --Black Dragonscale Breastplate
		{ id=19102, skill={300,320,330,340} }, --Runic Leather Armor
		{ id=19098, skill={300,320,330,340} }, --Wicked Leather Armor
		{ id=24124, skill={300,320,330,340} }, --Blood Tiger Breastplate
		{ id=24121, skill={300,320,330,340} }, --Primal Batskin Jerkin
		{ id=24851, skill={300,320,330,340} }, --Sandstalker Breastplate
		{ id=57022, skill={300,320,330,340} }, --Centaur Battle Harness
		{ id=24848, skill={300,320,330,340} }, --Spitfire Breastplate
		{ id=19054, skill={300,320,330,340} }, --Red Dragonscale Breastplate
		{ id=19095, skill={300,320,330,340} }, --Living Breastplate
		{ id=55524, skill={300,300,300,300} }, --Ethereal Tunic
		{ id=19104, skill={300,320,330,340} }, --Frostsaber Tunic
		{ id=57012, skill={300,300,300,300} }, --Earthguard Tunic
		{ id=28222, skill={300,320,330,340} }, --Icy Scale Breastplate
		{ id=28219, skill={300,320,330,340} }, --Polar Tunic
		{ id=24703, skill={300,320,330,340} }, --Dreamscale Breastplate
		{ id=47035, skill={300,300,300,300} }, --Verdant Dreamer's Breastplate
	},

	LeatherBracers = {
		{ name = L["LeatherBracers1"], icon = "Trade_Generic" },
		{ id=9059, skill={1,40,55,70} }, --Handstitched Leather Bracers
		{ id=9065, skill={70,100,115,130} }, --Light Leather Bracers
		{ id=23399, skill={155,175,185,195} }, --Barbaric Bracers
		{ id=3776, skill={180,200,210,220} }, --Green Leather Bracers
		{ id=9201, skill={185,205,215,225} }, --Dusky Bracers
		{ id=9202, skill={190,210,220,230} }, --Green Whelp Bracers
		{ id=6705, skill={190,210,220,230} }, --Murloc Scale Bracers
		{ id=3777, skill={195,215,225,235} }, --Guardian Leather Bracers
		{ id=10518, skill={210,230,240,250} }, --Turtle Scale Bracers
		{ id=10533, skill={220,240,250,260} }, --Tough Scorpid Bracers
		{ id=19048, skill={255,275,285,295} }, --Heavy Scorpid Bracers
		{ id=19052, skill={265,285,295,305} }, --Wicked Leather Bracers
		{ id=19065, skill={275,295,305,315} }, --Runic Leather Bracers
		{ id=24123, skill={300,320,330,340} }, --Primal Batskin Bracers
		{ id=24849, skill={300,320,330,340} }, --Sandstalker Bracers
		{ id=24846, skill={300,320,330,340} }, --Spitfire Bracers
		{ id=22923, skill={300,320,330,340} }, --Swift Flight Bracers
		{ id=28224, skill={300,320,330,340} }, --Icy Scale Bracers
		{ id=28221, skill={300,320,330,340} }, --Polar Bracers
		{ id=45475, skill={300,320,330,340} }, --Dreamhide Bracers
		{ id=45483, skill={300,320,330,340} }, --Inscribed Runic Bracers
	},

	LeatherGloves = {
		{ name = L["LeatherGloves1"], icon = "Trade_Generic" },
		{ id=3756, skill={55,85,100,115} }, --Embossed Leather Gloves
		{ id=2164, skill={75,105,120,135} }, --Fine Leather Gloves
		{ id=7954, skill={105,130,142,155} }, --Deviate Scale Gloves
		{ id=9074, skill={120,145,157,170} }, --Nimble Leather Gloves
		{ id=9072, skill={120,145,157,170} }, --Red Whelp Gloves
		{ id=3765, skill={120,155,167,180} }, --Dark Leather Gloves
		{ id=9145, skill={125,150,162,175} }, --Fletcher's Gloves
		{ id=9146, skill={135,160,172,185} }, --Herbalist's Gloves
		{ id=3770, skill={135,160,172,185} }, --Toughened Leather Gloves
		{ id=9148, skill={140,165,177,190} }, --Pilferer's Gloves
		{ id=9149, skill={145,170,182,195} }, --Heavy Earthen Gloves
		{ id=3764, skill={145,170,182,195} }, --Hillman's Leather Gloves
		{ id=3771, skill={150,170,180,190} }, --Barbaric Gloves
		{ id=7156, skill={190,210,220,230} }, --Guardian Gloves
		{ id=21943, skill={190,210,220,230} }, --Gloves of the Greatfather
		{ id=22711, skill={200,210,220,230} }, --Shadowskin Gloves
		{ id=46621, skill={200,215,220,225} }, --Grifter's Gauntlets
		{ id=10509, skill={205,225,235,245} }, --Turtle Scale Gloves
		{ id=10542, skill={225,245,255,265} }, --Tough Scorpid Gloves
		{ id=10619, skill={225,245,255,265} }, --Dragonscale Gauntlets
		{ id=10630, skill={230,250,260,270} }, --Gauntlets of the Sea
		{ id=19049, skill={260,280,290,300} }, --Wicked Leather Gauntlets
		{ id=19053, skill={265,270,280,290} }, --Chimeric Gloves
		{ id=19055, skill={270,290,300,310} }, --Runic Leather Gauntlets
		{ id=47015, skill={270,285,290,295} }, --Primalist's Gloves
		{ id=19064, skill={275,295,305,315} }, --Heavy Scorpid Gauntlets
		{ id=24655, skill={280,300,310,320} }, --Green Dragonscale Gauntlets
		{ id=19084, skill={290,310,320,330} }, --Devilsaur Gauntlets
		{ id=19087, skill={295,315,325,335} }, --Frostsaber Gloves
		{ id=24122, skill={300,320,330,340} }, --Primal Batskin Gloves
	},

	LeatherGloves2 = {
		{ name = L["LeatherGloves2"], icon = "Trade_Generic" },
		{ id=24850, skill={300,320,330,340} }, --Sandstalker Gauntlets
		{ id=24847, skill={300,320,330,340} }, --Spitfire Gauntlets
		{ id=23704, skill={300,320,330,340} }, --Timbermaw Brawlers
		{ id=26279, skill={300,320,330,340} }, --Stormshroud Gloves
		{ id=23708, skill={300,320,330,340} }, --Chromatic Gauntlets
		{ id=28223, skill={300,320,330,340} }, --Icy Scale Gauntlets
		{ id=28220, skill={300,320,330,340} }, --Polar Gloves
		{ id=54007, skill={300,300,300,300} }, --Corehound Gloves
	},

	LeatherBelt = {
		{ name = L["LeatherBelt1"], icon = "Trade_Generic" },
		{ id=3753, skill={25,55,70,85} }, --Handstitched Leather Belt
		{ id=3763, skill={80,110,125,140} }, --Fine Leather Belt
		{ id=6702, skill={90,120,135,150} }, --Murloc Scale Belt
		{ id=7955, skill={115,140,152,165} }, --Deviate Scale Belt
		{ id=3767, skill={120,145,157,170} }, --Hillman's Belt
		{ id=3766, skill={125,150,162,175} }, --Dark Leather Belt
		{ id=3774, skill={160,180,190,200} }, --Green Leather Belt
		{ id=4097, skill={165,185,195,205} }, --Raptor Hide Belt
		{ id=3775, skill={170,190,200,210} }, --Guardian Belt
		{ id=3778, skill={185,205,215,225} }, --Gem-studded Leather Belt
		{ id=9206, skill={195,215,225,235} }, --Dusky Belt
		{ id=46622, skill={200,215,220,225} }, --Grifter's Belt
		{ id=3779, skill={200,220,230,240} }, --Barbaric Belt
		{ id=19070, skill={280,300,310,320} }, --Heavy Scorpid Belt
		{ id=19072, skill={280,300,310,320} }, --Runic Leather Belt
		{ id=23703, skill={290,310,320,330} }, --Might of the Timbermaw
		{ id=19092, skill={300,320,330,340} }, --Wicked Leather Belt
		{ id=28474, skill={300,320,330,340} }, --Bramblewood Belt
		{ id=22921, skill={300,320,330,340} }, --Girdle of Insight
		{ id=23707, skill={300,320,330,340} }, --Lava Belt
		{ id=45479, skill={300,320,330,340} }, --Dreamhide Belt
		{ id=23710, skill={300,320,330,340} }, --Molten Belt
		{ id=23709, skill={300,320,330,340} }, --Corehound Belt
	},

	LeatherPants = {
		{ name = L["LeatherPants1"], icon = "Trade_Generic" },
		{ id=2153, skill={15,45,60,75} }, --Handstitched Leather Pants
		{ id=9064, skill={35,65,80,95} }, --Rugged Leather Pants
		{ id=3759, skill={75,105,120,135} }, --Embossed Leather Pants
		{ id=9068, skill={95,125,140,155} }, --Light Leather Pants
		{ id=7133, skill={105,130,142,155} }, --Fine Leather Pants
		{ id=7135, skill={115,140,152,165} }, --Dark Leather Pants
		{ id=7147, skill={160,180,190,200} }, --Guardian Pants
		{ id=9195, skill={165,185,195,205} }, --Dusky Leather Leggings
		{ id=7149, skill={170,190,200,210} }, --Barbaric Leggings
		{ id=46623, skill={205,225,230,235} }, --Grifter's Leggings
		{ id=10548, skill={230,250,260,270} }, --Nightscape Pants
		{ id=10556, skill={235,255,265,275} }, --Turtle Scale Leggings
		{ id=10560, skill={240,260,270,280} }, --Big Voodoo Pants
		{ id=10568, skill={245,265,275,285} }, --Tough Scorpid Leggings
		{ id=46695, skill={245,245,245,245} }, --Dragonscale Leggings
		{ id=10572, skill={250,270,280,290} }, --Wild Leather Leggings
		{ id=19059, skill={270,290,300,310} }, --Volcanic Leggings
		{ id=19060, skill={270,290,300,310} }, --Green Dragonscale Leggings
		{ id=19067, skill={275,295,305,315} }, --Stormshroud Pants
		{ id=47018, skill={280,290,291,295} }, --Primalist's Pants
		{ id=19073, skill={280,300,310,320} }, --Chimeric Leggings
		{ id=19075, skill={285,305,315,325} }, --Heavy Scorpid Leggings
		{ id=19074, skill={285,305,315,325} }, --Frostsaber Leggings
		{ id=19078, skill={285,305,315,325} }, --Living Leggings
		{ id=19080, skill={285,305,315,325} }, --Warbear Woolies
		{ id=19083, skill={290,310,320,330} }, --Wicked Leather Pants
		{ id=46653, skill={295,300,300,300} }, --Red Dragonscale Leggings
		{ id=19091, skill={300,320,330,340} }, --Runic Leather Pants
		{ id=24654, skill={300,320,330,340} }, --Blue Dragonscale Leggings
		{ id=19107, skill={300,320,330,340} }, --Black Dragonscale Leggings
	},

	LeatherPants2 = {
		{ name = L["LeatherPants2"], icon = "Trade_Generic" },
		{ id=19097, skill={300,320,330,340} }, --Devilsaur Leggings
		{ id=55525, skill={300,300,300,300} }, --Ethereal Leggings
		{ id=57014, skill={300,300,300,300} }, --Flamewrath Leggings
		{ id=54015, skill={300,300,300,300} }, --Molten Leggings
		{ id=46659, skill={300,300,300,300} }, --Stormscale Leggings
		{ id=54013, skill={300,300,300,300} }, --Chromatic Leggings
		{ id=45477, skill={300,320,330,340} }, --Dreamhide Leggings
	},

	LeatherBoots = {
		{ name = L["LeatherBoots1"], icon = "Trade_Generic" },
		{ id=2149, skill={1,40,55,70} }, --Handstitched Leather Boots
		{ id=2161, skill={55,85,100,115} }, --Embossed Leather Boots
		{ id=45069, skill={75,1,1,1} }, --Lynxstep Boots
		{ id=2158, skill={90,120,135,150} }, --Fine Leather Boots
		{ id=2167, skill={100,125,137,150} }, --Dark Leather Boots
		{ id=46620, skill={200,215,220,225} }, --Grifter's Boots
		{ id=9207, skill={200,220,230,240} }, --Dusky Boots
		{ id=9208, skill={200,220,230,240} }, --Swift Boots
		{ id=10558, skill={235,255,265,275} }, --Nightscape Boots
		{ id=10554, skill={235,255,265,275} }, --Tough Scorpid Boots
		{ id=10566, skill={245,265,275,285} }, --Wild Leather Boots
		{ id=57010, skill={255,255,255,255} }, --Boots of the Wind
		{ id=47020, skill={275,290,291,295} }, --Primalist's Boots
		{ id=19063, skill={275,295,305,315} }, --Chimeric Boots
		{ id=19066, skill={275,295,305,315} }, --Frostsaber Boots
		{ id=23705, skill={290,310,320,330} }, --Dawn Treaders
		{ id=54001, skill={290,315,325,335} }, --Blue Dragonscale Boots
		{ id=46655, skill={295,300,300,300} }, --Red Dragonscale Boots
		{ id=20853, skill={295,315,325,335} }, --Corehound Boots
		{ id=28473, skill={300,320,330,340} }, --Bramblewood Boots
		{ id=22922, skill={300,320,330,340} }, --Mongoose Boots
		{ id=20855, skill={300,320,330,340} }, --Black Dragonscale Boots
		{ id=57018, skill={300,300,300,300} }, --Windwalker Boots
	},

	LeatherBags = {
		{ name = L["LeatherBags1"], icon = "Trade_Generic" },
		{ id=5244, skill={40,70,85,100} }, --Kodo Hide Bag
		{ id=9060, skill={30,60,75,90} }, --Light Leather Quiver
		{ id=9193, skill={150,170,180,190} }, --Heavy Quiver
		{ id=14930, skill={225,245,255,265} }, --Quickdraw Quiver
		{ id=9062, skill={30,60,75,90} }, --Small Leather Ammo Pouch
		{ id=9194, skill={150,170,180,190} }, --Heavy Leather Ammo Pouch
		{ id=14932, skill={225,245,255,265} }, --Thick Leather Ammo Pouch
	},

	LeatherMisc = {
		{ name = L["LeatherMisc1"], icon = "Trade_Generic" },
		{ id=2881, skill={1,20,30,40} }, --Light Leather
		{ id=20648, skill={100,100,105,110} }, --Medium Leather
		{ id=20649, skill={150,150,155,160} }, --Heavy Leather
		{ id=20650, skill={200,200,202,205} }, --Thick Leather
		{ id=22331, skill={250,250,250,250} }, --Rugged Leather
		{ id=3816, skill={35,55,65,75} }, --Cured Light Hide
		{ id=3817, skill={100,115,122,130} }, --Cured Medium Hide
		{ id=3818, skill={150,160,165,170} }, --Cured Heavy Hide
		{ id=10482, skill={200,200,200,200} }, --Cured Thick Hide
		{ id=19047, skill={250,250,255,260} }, --Cured Rugged Hide
		{ id=45455, skill={300,320,330,340} }, --Dreamhide
		{ id=23190, skill={150,150,155,160} }, --Heavy Leather Ball
		{ id=2152, skill={1,30,45,60} }, --Light Armor Kit
		{ id=2165, skill={100,115,122,130} }, --Medium Armor Kit
		{ id=3780, skill={150,170,180,190} }, --Heavy Armor Kit
		{ id=10487, skill={200,220,230,240} }, --Thick Armor Kit
		{ id=19058, skill={250,255,265,275} }, --Rugged Armor Kit
		{ id=22727, skill={300,320,330,340} }, --Core Armor Kit
		{ id=57115, skill={300,320,330,340} }, --Enchanted Armor Kit
	},

	TailoringApprentice = {
		{ id=2963, skill={1,25,37,50} }, --Bolt of Linen Cloth
		{ id=3915, skill={1,35,47,60} }, --Brown Linen Shirt
		{ id=2387, skill={1,35,47,60} }, --Linen Cloak
		{ id=12044, skill={1,35,47,60} }, --Simple Linen Pants
		{ id=2393, skill={1,35,47,60} }, --White Linen Shirt
		{ id=2385, skill={10,45,57,70} }, --Brown Linen Vest
		{ id=8776, skill={15,50,67,85} }, --Linen Belt
		{ id=12045, skill={20,50,67,85} }, --Simple Linen Boots
		{ id=3914, skill={30,55,72,90} }, --Brown Linen Pants
		{ id=7623, skill={30,55,72,90} }, --Brown Linen Robe
		{ id=7624, skill={30,55,72,90} }, --White Linen Robe
		{ id=3840, skill={35,60,77,95} }, --Heavy Linen Gloves
		{ id=2394, skill={40,65,82,100} }, --Blue Linen Shirt
		{ id=2392, skill={40,65,82,100} }, --Red Linen Shirt
		{ id=8465, skill={40,65,82,100} }, --Simple Dress
		{ id=2389, skill={40,65,82,100} }, --Red Linen Robe
		{ id=3755, skill={45,70,87,105} }, --Linen Bag
		{ id=7630, skill={55,80,97,115} }, --Blue Linen Vest
		{ id=7629, skill={55,80,97,115} }, --Red Linen Vest
		{ id=3841, skill={60,85,102,120} }, --Green Linen Bracers
		{ id=2397, skill={60,85,102,120} }, --Reinforced Linen Cape
		{ id=2386, skill={65,90,107,125} }, --Linen Boots
		{ id=2396, skill={70,95,112,130} }, --Green Linen Shirt
		{ id=6686, skill={70,95,112,130} }, --Red Linen Bag
		{ id=2395, skill={70,95,112,130} }, --Barbaric Linen Vest
		{ id=7633, skill={70,95,112,130} }, --Blue Linen Robe
		{ id=3842, skill={70,95,112,130} }, --Handstitched Linen Britches
		{ id=2964, skill={75,90,97,105} }, --Bolt of Woolen Cloth
		{ id=12046, skill={75,100,117,135} }, --Simple Kilt
		{ id=2402, skill={75,100,117,135} }, --Woolen Cape

		{ id=45066, skill={75,150,167,185} }, --Gloves of Manathirst
	},
	TailoringJourneyman = {
		{ id=3757, skill={80,105,122,140} }, --Woolen Bag
		{ id=3845, skill={80,105,122,140} }, --Soft-soled Linen Boots
		{ id=2399, skill={85,110,127,145} }, --Green Woolen Vest
		{ id=3843, skill={85,110,127,145} }, --Heavy Woolen Gloves
		{ id=6521, skill={90,115,132,150} }, --Pearl-clasped Cloak
		{ id=3758, skill={95,120,137,155} }, --Green Woolen Bag
		{ id=3847, skill={95,120,137,155} }, --Red Woolen Boots
		{ id=2401, skill={95,120,137,155} }, --Woolen Boots
		{ id=2406, skill={100,110,120,130} }, --Gray Woolen Shirt
		{ id=7639, skill={100,125,142,160} }, --Blue Overalls
		{ id=3844, skill={100,125,142,160} }, --Heavy Woolen Cloak
		{ id=2403, skill={105,130,147,165} }, --Gray Woolen Robe
		{ id=3848, skill={110,135,152,170} }, --Double-stitched Woolen Shoulders
		{ id=3866, skill={110,135,152,170} }, --Stylish Red Shirt
		{ id=8467, skill={110,135,152,170} }, --White Woolen Dress
		{ id=3850, skill={110,135,152,170} }, --Heavy Woolen Pants
		{ id=6688, skill={115,140,157,175} }, --Red Woolen Bag
		{ id=7643, skill={115,140,157,175} }, --Greater Adept's Robe
		{ id=3849, skill={120,145,162,180} }, --Reinforced Woolen Shoulders
		{ id=7892, skill={120,145,162,180} }, --Stylish Blue Shirt
		{ id=7893, skill={120,145,162,180} }, --Stylish Green Shirt
		{ id=12047, skill={120,145,162,180} }, --Colorful Kilt
		{ id=3839, skill={125,135,140,145} }, --Bolt of Silk Cloth
		{ id=3868, skill={125,150,167,185} }, --Phoenix Gloves
		{ id=3851, skill={125,150,167,185} }, --Phoenix Pants
		{ id=3855, skill={125,150,167,185} }, --Spidersilk Boots
		{ id=3852, skill={130,150,165,180} }, --Gloves of Meditation
		{ id=3869, skill={135,145,150,155} }, --Bright Yellow Shirt
		{ id=6690, skill={135,155,170,185} }, --Lesser Wizard's Robe
		{ id=8758, skill={140,160,175,190} }, --Azure Silk Pants

		{ id=3856, skill={140,160,175,190} }, --Spider Silk Slippers
		{ id=8778, skill={140,160,175,190} }, --Boots of Darkness
		{ id=8760, skill={145,155,160,165} }, --Azure Silk Hood
		{ id=3854, skill={145,165,180,195} }, --Azure Silk Gloves
		{ id=8780, skill={145,165,180,195} }, --Hands of Darkness
		{ id=3813, skill={150,170,185,200} }, --Small Silk Pack
		{ id=3859, skill={150,170,185,200} }, --Azure Silk Vest
		{ id=6692, skill={150,170,185,200} }, --Robes of Arcana
		{ id=8782, skill={150,170,185,200} }, --Truefaith Gloves
	},
	TailoringExpert = {
		{ id=3870, skill={155,165,170,175} }, --Dark Silk Shirt
		{ id=8762, skill={160,170,175,180} }, --Silk Headband
		{ id=8483, skill={160,170,175,180} }, --White Swashbuckler's Shirt
		{ id=3857, skill={165,185,200,215} }, --Enchanter's Cowl
		{ id=8784, skill={165,185,200,215} }, --Green Silk Armor
		{ id=3871, skill={170,180,185,190} }, --Formal White Shirt
		{ id=8764, skill={170,190,205,220} }, --Earthen Vest
		{ id=3858, skill={170,190,205,220} }, --Shadow Hood
		{ id=3865, skill={175,180,182,185} }, --Bolt of Mageweave
		{ id=8489, skill={175,185,190,195} }, --Red Swashbuckler's Shirt
		{ id=6693, skill={175,195,210,225} }, --Green Silk Pack
		{ id=8766, skill={175,195,210,225} }, --Azure Silk Belt
		{ id=8786, skill={175,195,210,225} }, --Azure Silk Cloak
		{ id=3860, skill={175,195,210,225} }, --Boots of the Enchanter
		{ id=8772, skill={175,195,210,225} }, --Crimson Silk Belt
		{ id=8789, skill={180,200,215,230} }, --Crimson Silk Cloak
		{ id=8774, skill={180,200,215,230} }, --Green Silken Shoulders
		{ id=3863, skill={180,200,215,230} }, --Spider Belt
		{ id=3872, skill={185,195,200,205} }, --Rich Purple Silk Shirt
		{ id=8791, skill={185,205,215,225} }, --Crimson Silk Vest
		{ id=6695, skill={185,205,220,235} }, --Black Silk Pack
		{ id=3861, skill={185,205,220,235} }, --Long Silken Cloak
		{ id=21945, skill={190,200,205,210} }, --Green Holiday Shirt
		{ id=8795, skill={190,210,225,240} }, --Azure Shoulders
		{ id=8793, skill={190,210,225,240} }, --Crimson Silk Shoulders
		{ id=8770, skill={190,210,225,240} }, --Robe of Power
		{ id=8799, skill={195,215,225,235} }, --Crimson Silk Pantaloons
		{ id=8797, skill={195,215,230,245} }, --Earthen Silk Belt
		{ id=3873, skill={200,210,215,220} }, --Black Swashbuckler's Shirt
		{ id=3864, skill={200,220,235,250} }, --Star Belt

		{ id=3862, skill={200,220,235,250} }, --Icy Cloak
		{ id=69420, skill={200,200,200,200} }, --Augerer's Boots
		{ id=69421, skill={200,200,200,200} }, --Augerer's Gloves
		{ id=69422, skill={205,205,205,205} }, --Augerer's Mantle
		{ id=69423, skill={205,205,205,205} }, --Augerer's Trousers
		{ id=69424, skill={205,205,205,205} }, --Augerer's Hat
		{ id=12049, skill={205,220,235,250} }, --Black Mageweave Leggings
		{ id=12048, skill={205,220,235,250} }, --Black Mageweave Vest
		{ id=8802, skill={205,220,235,250} }, --Crimson Silk Robe
		{ id=69425, skill={210,210,210,210} }, --Augerer's Robe
		{ id=12050, skill={210,225,240,255} }, --Black Mageweave Robe
		{ id=8804, skill={210,225,240,255} }, --Crimson Silk Gloves
		{ id=12052, skill={210,225,240,255} }, --Shadoweave Pants
		{ id=12061, skill={215,220,225,230} }, --Orange Mageweave Shirt
		{ id=12059, skill={215,220,225,230} }, --White Bandit Mask
		{ id=12053, skill={215,230,245,260} }, --Black Mageweave Gloves
		{ id=12060, skill={215,230,245,260} }, --Red Mageweave Pants
		{ id=12056, skill={215,230,245,260} }, --Red Mageweave Vest
		{ id=12055, skill={215,230,245,260} }, --Shadoweave Robe
		{ id=12064, skill={220,225,230,235} }, --Orange Martial Shirt
		{ id=12065, skill={225,240,255,270} }, --Mageweave Bag
		{ id=12069, skill={225,240,255,270} }, --Cindercloth Robe
		{ id=27658, skill={225,240,255,270} }, --Enchanted Mageweave Pouch
		{ id=12066, skill={225,240,255,270} }, --Red Mageweave Gloves
		{ id=12071, skill={225,240,255,270} }, --Shadoweave Gloves
		{ id=12067, skill={225,240,255,270} }, --Dreamweave Gloves
		{ id=12070, skill={225,240,255,270} }, --Dreamweave Vest
		{ id=69426, skill={225,225,225,225} }, --Diviner's Boots
		{ id=69427, skill={225,225,225,225} }, --Diviner's Mitts
		{ id=69428, skill={230,230,230,230} }, --Diviner's Epaulets
	},
	TailoringArtisan = {
		{ id=69429, skill={230,230,230,230} }, --Diviner's Pantaloons
		{ id=69430, skill={230,230,230,230} }, --Diviner's Cowl
		{ id=12075, skill={230,235,240,245} }, --Lavender Mageweave Shirt
		{ id=12073, skill={230,245,260,275} }, --Black Mageweave Boots
		{ id=12072, skill={230,245,260,275} }, --Black Mageweave Headband
		{ id=12074, skill={230,245,260,275} }, --Black Mageweave Shoulders
		{ id=69431, skill={235,235,235,235} }, --Diviner's Robes
		{ id=12080, skill={235,240,245,250} }, --Pink Mageweave Shirt
		{ id=12077, skill={235,240,245,250} }, --Simple Black Dress
		{ id=12079, skill={235,250,265,280} }, --Red Mageweave Bag
		{ id=12078, skill={235,250,265,280} }, --Red Mageweave Shoulders
		{ id=12076, skill={235,250,265,280} }, --Shadoweave Shoulders
		{ id=12085, skill={240,245,250,255} }, --Tuxedo Shirt
		{ id=12081, skill={240,255,270,285} }, --Admiral's Hat
		{ id=12084, skill={240,255,270,285} }, --Red Mageweave Headband
		{ id=12082, skill={240,255,270,285} }, --Shadoweave Boots
		{ id=12089, skill={245,250,255,260} }, --Tuxedo Pants
		{ id=12088, skill={245,260,275,290} }, --Cindercloth Boots
		{ id=12086, skill={245,260,275,290} }, --Shadoweave Mask
		{ id=18401, skill={250,255,257,260} }, --Bolt of Runecloth
		{ id=12091, skill={250,255,260,265} }, --White Wedding Dress
		{ id=26403, skill={250,265,280,295} }, --Festival Dress
		{ id=26407, skill={250,265,280,295} }, --Festive Red Pant Suit
		{ id=12093, skill={250,265,280,295} }, --Tuxedo Jacket
		{ id=12092, skill={250,265,280,295} }, --Dreamweave Circlet
		{ id=18560, skill={250,290,305,320} }, --Mooncloth
		{ id=18404, skill={255,270,285,300} }, --Frostweave Robe
		{ id=18403, skill={255,270,285,300} }, --Frostweave Tunic
		{ id=18402, skill={255,270,285,300} }, --Runecloth Belt

		{ id=69432, skill={260,260,260,260} }, --Pillager's Shoes
		{ id=69433, skill={260,260,260,260} }, --Pillager's Grips
		{ id=18405, skill={260,275,290,305} }, --Runecloth Bag
		{ id=18408, skill={260,275,290,305} }, --Cindercloth Vest
		{ id=18406, skill={260,275,290,305} }, --Runecloth Robe
		{ id=18407, skill={260,275,290,305} }, --Runecloth Tunic
		{ id=26085, skill={260,275,290,305} }, --Soul Pouch
		{ id=69434, skill={265,265,265,265} }, --Pillager's Amice
		{ id=69435, skill={265,265,265,265} }, --Pillager's Pantaloons
		{ id=69436, skill={265,265,265,265} }, --Pillager's Hood
		{ id=18411, skill={265,280,295,310} }, --Frostweave Gloves
		{ id=18410, skill={265,280,295,310} }, --Ghostweave Belt
		{ id=18409, skill={265,280,295,310} }, --Runecloth Cloak
		{ id=69437, skill={270,270,270,270} }, --Pillager's Robe
		{ id=18415, skill={270,285,300,315} }, --Brightcloth Gloves
		{ id=18414, skill={270,285,300,315} }, --Brightcloth Robe
		{ id=18412, skill={270,285,300,315} }, --Cindercloth Gloves
		{ id=18413, skill={270,285,300,315} }, --Ghostweave Gloves
		{ id=22813, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ id=18420, skill={275,290,305,320} }, --Brightcloth Cloak
		{ id=27724, skill={275,290,305,320} }, --Cenarion Herb Bag
		{ id=18418, skill={275,290,305,320} }, --Cindercloth Cloak
		{ id=27659, skill={275,290,305,320} }, --Enchanted Runecloth Bag
		{ id=18419, skill={275,290,305,320} }, --Felcloth Pants
		{ id=18416, skill={275,290,305,320} }, --Ghostweave Vest
		{ id=18417, skill={275,290,305,320} }, --Runecloth Gloves
		{ id=18421, skill={275,290,305,320} }, --Wizardweave Leggings
		{ id=18422, skill={275,290,305,320} }, --Cloak of Fire
		{ id=18434, skill={280,295,310,325} }, --Cindercloth Pants
		{ id=18424, skill={280,295,310,325} }, --Frostweave Pants

		{ id=18423, skill={280,295,310,325} }, --Runecloth Boots
		{ id=26086, skill={280,300,315,330} }, --Felcloth Bag
		{ id=18437, skill={285,300,315,330} }, --Felcloth Boots
		{ id=18438, skill={285,300,315,330} }, --Runecloth Pants
		{ id=18436, skill={285,300,315,330} }, --Robe of Winter Night
		{ id=19435, skill={290,295,310,325} }, --Mooncloth Boots
		{ id=18439, skill={290,305,320,335} }, --Brightcloth Pants
		{ id=18442, skill={290,305,320,335} }, --Felcloth Hood
		{ id=18441, skill={290,305,320,335} }, --Ghostweave Pants
		{ id=23664, skill={290,305,320,335} }, --Argent Boots
		{ id=18440, skill={290,305,320,335} }, --Mooncloth Leggings
		{ id=23662, skill={290,305,320,335} }, --Wisdom of the Timbermaw
		{ id=18444, skill={295,310,325,340} }, --Runecloth Headband
		{ id=27660, skill={300,315,330,345} }, --Big Bag of Enchantment
		{ id=18451, skill={300,315,330,345} }, --Felcloth Robe
		{ id=18453, skill={300,315,330,345} }, --Felcloth Shoulders
		{ id=18445, skill={300,315,330,345} }, --Mooncloth Bag
		{ id=18449, skill={300,315,330,345} }, --Runecloth Shoulders
		{ id=27725, skill={300,315,330,345} }, --Satchel of Cenarius
		{ id=18446, skill={300,315,330,345} }, --Wizardweave Robe
		{ id=18450, skill={300,315,330,345} }, --Wizardweave Turban
		{ id=23665, skill={300,315,330,345} }, --Argent Shoulders
		{ id=24093, skill={300,315,330,345} }, --Bloodvine Boots
		{ id=24092, skill={300,315,330,345} }, --Bloodvine Leggings
		{ id=24091, skill={300,315,330,345} }, --Bloodvine Vest
		{ id=18455, skill={300,315,330,345} }, --Bottomless Bag
		{ id=22870, skill={300,315,330,345} }, --Cloak of Warding
		{ id=22867, skill={300,315,330,345} }, --Felcloth Gloves
		{ id=28210, skill={300,315,330,345} }, --Gaea's Embrace
		{ id=22868, skill={300,315,330,345} }, --Inferno Gloves

		{ id=57024, skill={300,315,330,345} }, --Windbinder Gloves
		{ id=57020, skill={300,315,330,345} }, --Dustguider Sash
		{ id=23663, skill={300,315,330,345} }, --Mantle of the Timbermaw
		{ id=18452, skill={300,315,330,345} }, --Mooncloth Circlet
		{ id=22869, skill={300,315,330,345} }, --Mooncloth Gloves
		{ id=22902, skill={300,315,330,345} }, --Mooncloth Robe
		{ id=18448, skill={300,315,330,345} }, --Mooncloth Shoulders
		{ id=18447, skill={300,315,330,345} }, --Mooncloth Vest
		{ id=24902, skill={300,315,330,345} }, --Runed Stygian Belt
		{ id=24903, skill={300,315,330,345} }, --Runed Stygian Boots
		{ id=24901, skill={300,315,330,345} }, --Runed Stygian Leggings
		{ id=28481, skill={300,315,330,345} }, --Sylvan Crown
		{ id=28482, skill={300,315,330,345} }, --Sylvan Shoulders
		{ id=28480, skill={300,315,330,345} }, --Sylvan Vest
		{ id=55518, skill={300,300,300,300} }, --Cosmic Headdress
		{ id=55519, skill={300,300,300,300} }, --Cosmic Mantle
		{ id=55520, skill={300,300,300,300} }, --Cosmic Vest
		{ id=55521, skill={300,300,300,300} }, --Cosmic Leggings
		{ id=55534, skill={300,300,300,300} }, --Ley-Kissed Drape
		{ id=22866, skill={300,315,330,345} }, --Belt of the Archmage
		{ id=26087, skill={300,315,330,345} }, --Core Felcloth Bag
		{ id=20849, skill={300,315,330,345} }, --Flarecore Gloves
		{ id=23667, skill={300,315,330,345} }, --Flarecore Leggings
		{ id=20848, skill={300,315,330,345} }, --Flarecore Mantle
		{ id=23666, skill={300,315,330,345} }, --Flarecore Robe
		{ id=22759, skill={300,315,330,345} }, --Flarecore Wraps
		{ id=28208, skill={300,315,330,345} }, --Glacial Cloak
		{ id=28205, skill={300,315,330,345} }, --Glacial Gloves
		{ id=28207, skill={300,315,330,345} }, --Glacial Vest
		{ id=28209, skill={300,315,330,345} }, --Glacial Wrists
		{ id=18454, skill={300,315,330,345} }, --Gloves of Spell Mastery

		{ id=18457, skill={300,315,330,345} }, --Robe of the Archmage
		{ id=18458, skill={300,315,330,345} }, --Robe of the Void
		{ id=18456, skill={300,315,330,345} }, --Truefaith Vestments
		{ id=46656, skill={300,300,300,300} }, --Robe of Sacrifice
		{ id=54011, skill={300,300,300,300} }, --Flarecore Boots
		{ id=45485, skill={300,300,300,300} }, --Gloves of Unwinding Mystery
		{ id=45457, skill={300,300,300,300} }, --Dreamthread Mantle
		{ id=45459, skill={300,300,300,300} }, --Dreamthread Kilt
		{ id=45461, skill={300,300,300,300} }, --Dreamthread Bracers
		{ id=45463, skill={300,300,300,300} }, --Dreamthread Gloves
		{ id=45453, skill={300,300,300,300} }, --Dreamthread

	},
	TailoringHelm = {
		{ id=8760, skill={145,155,160,165} }, --Azure Silk Hood
		{ id=3857, skill={165,185,200,215} }, --Enchanter's Cowl
		{ id=3858, skill={170,190,205,220} }, --Shadow Hood
		{ id=12059, skill={215,220,225,230} }, --White Bandit Mask
		{ id=69430, skill={230,230,230,230} }, --Diviner's Cowl
		{ id=12072, skill={230,245,260,275} }, --Black Mageweave Headband
		{ id=12081, skill={240,255,270,285} }, --Admiral's Hat
		{ id=12086, skill={245,260,275,290} }, --Shadoweave Mask
		{ id=12092, skill={250,265,280,295} }, --Dreamweave Circlet
		{ id=69436, skill={265,265,265,265} }, --Pillager's Hood
		{ id=18442, skill={290,305,320,335} }, --Felcloth Hood
		{ id=18452, skill={300,315,330,345} }, --Mooncloth Circlet
		{ id=28481, skill={300,315,330,345} }, --Sylvan Crown
		{ id=55518, skill={300,300,300,300} }, --Cosmic Headdress
	},

	TailoringShoulders = {
		{ id=3848, skill={110,135,152,170} }, --Double-stitched Woolen Shoulders
		{ id=3849, skill={120,145,162,180} }, --Reinforced Woolen Shoulders
		{ id=8774, skill={180,200,215,230} }, --Green Silken Shoulders
		{ id=8795, skill={190,210,225,240} }, --Azure Shoulders
		{ id=8793, skill={190,210,225,240} }, --Crimson Silk Shoulders
		{ id=69422, skill={205,205,205,205} }, --Augerer's Mantle
		{ id=69428, skill={230,230,230,230} }, --Diviner's Epaulets
		{ id=12078, skill={235,250,265,280} }, --Red Mageweave Shoulders
		{ id=12076, skill={235,250,265,280} }, --Shadoweave Shoulders
		{ id=69434, skill={265,265,265,265} }, --Pillager's Amice
		{ id=18453, skill={300,315,330,345} }, --Felcloth Shoulders
		{ id=18449, skill={300,315,330,345} }, --Runecloth Shoulders
		{ id=23665, skill={300,315,330,345} }, --Argent Shoulders
		{ id=23663, skill={300,315,330,345} }, --Mantle of the Timbermaw
		{ id=18448, skill={300,315,330,345} }, --Mooncloth Shoulders
		{ id=28482, skill={300,315,330,345} }, --Sylvan Shoulders
		{ id=55519, skill={300,300,300,300} }, --Cosmic Mantle
		{ id=20848, skill={300,315,330,345} }, --Flarecore Mantle
		{ id=45457, skill={300,300,300,300} }, --Dreamthread Mantle
	},

	TailoringCloak = {
		{ id=2387, skill={1,35,47,60} }, --Linen Cloak
		{ id=2397, skill={60,85,102,120} }, --Reinforced Linen Cape
		{ id=2402, skill={75,100,117,135} }, --Woolen Cape
		{ id=6521, skill={90,115,132,150} }, --Pearl-clasped Cloak
		{ id=3844, skill={100,125,142,160} }, --Heavy Woolen Cloak
		{ id=8786, skill={175,195,210,225} }, --Azure Silk Cloak
		{ id=8789, skill={180,200,215,230} }, --Crimson Silk Cloak
		{ id=3861, skill={185,205,220,235} }, --Long Silken Cloak
		{ id=3862, skill={200,220,235,250} }, --Icy Cloak
		{ id=18409, skill={265,280,295,310} }, --Runecloth Cloak
		{ id=18420, skill={275,290,305,320} }, --Brightcloth Cloak
		{ id=18418, skill={275,290,305,320} }, --Cindercloth Cloak
		{ id=18422, skill={275,290,305,320} }, --Cloak of Fire
		{ id=22870, skill={300,315,330,345} }, --Cloak of Warding
		{ id=55534, skill={300,300,300,300} }, --Ley-Kissed Drape
		{ id=28208, skill={300,315,330,345} }, --Glacial Cloak
	},

	TailoringChest = {
		{ id=7623, skill={30,55,72,90} }, --Brown Linen Robe
		{ id=7624, skill={30,55,72,90} }, --White Linen Robe
		{ id=2389, skill={40,65,82,100} }, --Red Linen Robe
		{ id=7630, skill={55,80,97,115} }, --Blue Linen Vest
		{ id=7629, skill={55,80,97,115} }, --Red Linen Vest
		{ id=2395, skill={70,95,112,130} }, --Barbaric Linen Vest
		{ id=7633, skill={70,95,112,130} }, --Blue Linen Robe
		{ id=2399, skill={85,110,127,145} }, --Green Woolen Vest
		{ id=2403, skill={105,130,147,165} }, --Gray Woolen Robe
		{ id=7643, skill={115,140,157,175} }, --Greater Adept's Robe
		{ id=6690, skill={135,155,170,185} }, --Lesser Wizard's Robe
		{ id=3859, skill={150,170,185,200} }, --Azure Silk Vest
		{ id=6692, skill={150,170,185,200} }, --Robes of Arcana
		{ id=8784, skill={165,185,200,215} }, --Green Silk Armor
		{ id=8770, skill={190,210,225,240} }, --Robe of Power
		{ id=12048, skill={205,220,235,250} }, --Black Mageweave Vest
		{ id=8802, skill={205,220,235,250} }, --Crimson Silk Robe
		{ id=69425, skill={210,210,210,210} }, --Augerer's Robe
		{ id=12050, skill={210,225,240,255} }, --Black Mageweave Robe
		{ id=12055, skill={215,230,245,260} }, --Shadoweave Robe
		{ id=12069, skill={225,240,255,270} }, --Cindercloth Robe
		{ id=12070, skill={225,240,255,270} }, --Dreamweave Vest
		{ id=69431, skill={235,235,235,235} }, --Diviner's Robes
		{ id=12077, skill={235,240,245,250} }, --Simple Black Dress
		{ id=12091, skill={250,255,260,265} }, --White Wedding Dress
		{ id=26403, skill={250,265,280,295} }, --Festival Dress
		{ id=26407, skill={250,265,280,295} }, --Festive Red Pant Suit
		{ id=18404, skill={255,270,285,300} }, --Frostweave Robe
		{ id=18403, skill={255,270,285,300} }, --Frostweave Tunic
		{ id=18408, skill={260,275,290,305} }, --Cindercloth Vest

		{ id=18406, skill={260,275,290,305} }, --Runecloth Robe
		{ id=18407, skill={260,275,290,305} }, --Runecloth Tunic
		{ id=69437, skill={270,270,270,270} }, --Pillager's Robe
		{ id=18414, skill={270,285,300,315} }, --Brightcloth Robe
		{ id=22813, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ id=18436, skill={285,300,315,330} }, --Robe of Winter Night
		{ id=18451, skill={300,315,330,345} }, --Felcloth Robe
		{ id=18446, skill={300,315,330,345} }, --Wizardweave Robe
		{ id=24091, skill={300,315,330,345} }, --Bloodvine Vest
		{ id=22902, skill={300,315,330,345} }, --Mooncloth Robe
		{ id=18447, skill={300,315,330,345} }, --Mooncloth Vest
		{ id=28480, skill={300,315,330,345} }, --Sylvan Vest
		{ id=55520, skill={300,300,300,300} }, --Cosmic Vest
		{ id=23666, skill={300,315,330,345} }, --Flarecore Robe
		{ id=28207, skill={300,315,330,345} }, --Glacial Vest
		{ id=18457, skill={300,315,330,345} }, --Robe of the Archmage
		{ id=18458, skill={300,315,330,345} }, --Robe of the Void
		{ id=18456, skill={300,315,330,345} }, --Truefaith Vestments
		{ id=46656, skill={300,300,300,300} }, --Robe of Sacrifice
	},

	TailoringBracers = {
		{ id=3841, skill={60,85,102,120} }, --Green Linen Bracers
		{ id=22759, skill={300,315,330,345} }, --Flarecore Wraps
		{ id=28209, skill={300,315,330,345} }, --Glacial Wrists
		{ id=45461, skill={300,300,300,300} }, --Dreamthread Bracers
	},

	TailoringGloves = {
		{ id=3840, skill={35,60,77,95} }, --Heavy Linen Gloves
		{ id=45066, skill={75,150,167,185} }, --Gloves of Manathirst
		{ id=3843, skill={85,110,127,145} }, --Heavy Woolen Gloves
		{ id=3868, skill={125,150,167,185} }, --Phoenix Gloves
		{ id=3852, skill={130,150,165,180} }, --Gloves of Meditation
		{ id=3854, skill={145,165,180,195} }, --Azure Silk Gloves
		{ id=8780, skill={145,165,180,195} }, --Hands of Darkness
		{ id=8782, skill={150,170,185,200} }, --Truefaith Gloves
		{ id=69421, skill={200,200,200,200} }, --Augerer's Gloves
		{ id=8804, skill={210,225,240,255} }, --Crimson Silk Gloves
		{ id=12053, skill={215,230,245,260} }, --Black Mageweave Gloves
		{ id=12066, skill={225,240,255,270} }, --Red Mageweave Gloves
		{ id=12071, skill={225,240,255,270} }, --Shadoweave Gloves
		{ id=12067, skill={225,240,255,270} }, --Dreamweave Gloves
		{ id=69427, skill={225,225,225,225} }, --Diviner's Mitts
		{ id=69433, skill={260,260,260,260} }, --Pillager's Grips
		{ id=18411, skill={265,280,295,310} }, --Frostweave Gloves
		{ id=18415, skill={270,285,300,315} }, --Brightcloth Gloves
		{ id=18412, skill={270,285,300,315} }, --Cindercloth Gloves
		{ id=18413, skill={270,285,300,315} }, --Ghostweave Gloves
		{ id=18417, skill={275,290,305,320} }, --Runecloth Gloves
		{ id=22867, skill={300,315,330,345} }, --Felcloth Gloves
		{ id=22868, skill={300,315,330,345} }, --Inferno Gloves
		{ id=57024, skill={300,315,330,345} }, --Windbinder Gloves
		{ id=22869, skill={300,315,330,345} }, --Mooncloth Gloves
		{ id=20849, skill={300,315,330,345} }, --Flarecore Gloves
		{ id=28205, skill={300,315,330,345} }, --Glacial Gloves
		{ id=18454, skill={300,315,330,345} }, --Gloves of Spell Mastery
		{ id=45485, skill={300,300,300,300} }, --Gloves of Unwinding Mystery
		{ id=45463, skill={300,300,300,300} }, --Dreamthread Gloves
	},

	TailoringBelt = {
		{ id=8776, skill={15,50,67,85} }, --Linen Belt
		{ id=8766, skill={175,195,210,225} }, --Azure Silk Belt
		{ id=8772, skill={175,195,210,225} }, --Crimson Silk Belt
		{ id=3863, skill={180,200,215,230} }, --Spider Belt
		{ id=8797, skill={195,215,230,245} }, --Earthen Silk Belt
		{ id=3864, skill={200,220,235,250} }, --Star Belt
		{ id=18402, skill={255,270,285,300} }, --Runecloth Belt
		{ id=18410, skill={265,280,295,310} }, --Ghostweave Belt
		{ id=23662, skill={290,305,320,335} }, --Wisdom of the Timbermaw
		{ id=57020, skill={300,315,330,345} }, --Dustguider Sash
		{ id=24902, skill={300,315,330,345} }, --Runed Stygian Belt
		{ id=22866, skill={300,315,330,345} }, --Belt of the Archmage
	},

	TailoringPants = {
		{ id=12044, skill={1,35,47,60} }, --Simple Linen Pants
		{ id=3914, skill={30,55,72,90} }, --Brown Linen Pants
		{ id=3842, skill={70,95,112,130} }, --Handstitched Linen Britches
		{ id=12046, skill={75,100,117,135} }, --Simple Kilt
		{ id=3850, skill={110,135,152,170} }, --Heavy Woolen Pants
		{ id=12047, skill={120,145,162,180} }, --Colorful Kilt
		{ id=3851, skill={125,150,167,185} }, --Phoenix Pants
		{ id=8758, skill={140,160,175,190} }, --Azure Silk Pants
		{ id=8799, skill={195,215,225,235} }, --Crimson Silk Pantaloons
		{ id=69423, skill={205,205,205,205} }, --Augerer's Trousers
		{ id=12049, skill={205,220,235,250} }, --Black Mageweave Leggings
		{ id=12052, skill={210,225,240,255} }, --Shadoweave Pants
		{ id=12060, skill={215,230,245,260} }, --Red Mageweave Pants
		{ id=69429, skill={230,230,230,230} }, --Diviner's Pantaloons
		{ id=12089, skill={245,250,255,260} }, --Tuxedo Pants
		{ id=69435, skill={265,265,265,265} }, --Pillager's Pantaloons
		{ id=18419, skill={275,290,305,320} }, --Felcloth Pants
		{ id=18421, skill={275,290,305,320} }, --Wizardweave Leggings
		{ id=18434, skill={280,295,310,325} }, --Cindercloth Pants
		{ id=18424, skill={280,295,310,325} }, --Frostweave Pants
		{ id=18438, skill={285,300,315,330} }, --Runecloth Pants
		{ id=18439, skill={290,305,320,335} }, --Brightcloth Pants
		{ id=18441, skill={290,305,320,335} }, --Ghostweave Pants
		{ id=18440, skill={290,305,320,335} }, --Mooncloth Leggings
		{ id=24092, skill={300,315,330,345} }, --Bloodvine Leggings
		{ id=24901, skill={300,315,330,345} }, --Runed Stygian Leggings
		{ id=55521, skill={300,300,300,300} }, --Cosmic Leggings
		{ id=23667, skill={300,315,330,345} }, --Flarecore Leggings
		{ id=45459, skill={300,300,300,300} }, --Dreamthread Kilt
	},

	TailoringBoots = {
		{ id=12045, skill={20,50,67,85} }, --Simple Linen Boots
		{ id=2386, skill={65,90,107,125} }, --Linen Boots
		{ id=3845, skill={80,105,122,140} }, --Soft-soled Linen Boots
		{ id=3847, skill={95,120,137,155} }, --Red Woolen Boots
		{ id=2401, skill={95,120,137,155} }, --Woolen Boots
		{ id=3855, skill={125,150,167,185} }, --Spidersilk Boots
		{ id=3856, skill={140,160,175,190} }, --Spider Silk Slippers
		{ id=8778, skill={140,160,175,190} }, --Boots of Darkness
		{ id=3860, skill={175,195,210,225} }, --Boots of the Enchanter
		{ id=69420, skill={200,200,200,200} }, --Augerer's Boots
		{ id=69426, skill={225,225,225,225} }, --Diviner's Boots
		{ id=12073, skill={230,245,260,275} }, --Black Mageweave Boots
		{ id=12082, skill={240,255,270,285} }, --Shadoweave Boots
		{ id=12088, skill={245,260,275,290} }, --Cindercloth Boots
		{ id=69432, skill={260,260,260,260} }, --Pillager's Shoes
		{ id=18423, skill={280,295,310,325} }, --Runecloth Boots
		{ id=18437, skill={285,300,315,330} }, --Felcloth Boots
		{ id=19435, skill={290,295,310,325} }, --Mooncloth Boots
		{ id=23664, skill={290,305,320,335} }, --Argent Boots
		{ id=24093, skill={300,315,330,345} }, --Bloodvine Boots
		{ id=24903, skill={300,315,330,345} }, --Runed Stygian Boots
		{ id=54011, skill={300,300,300,300} }, --Flarecore Boots
	},

	TailoringBags = {
		{ id=3755, skill={45,70,87,105} }, --Linen Bag
		{ id=6686, skill={70,95,112,130} }, --Red Linen Bag
		{ id=3757, skill={80,105,122,140} }, --Woolen Bag
		{ id=3758, skill={95,120,137,155} }, --Green Woolen Bag
		{ id=6688, skill={115,140,157,175} }, --Red Woolen Bag
		{ id=3813, skill={150,170,185,200} }, --Small Silk Pack
		{ id=6693, skill={175,195,210,225} }, --Green Silk Pack
		{ id=6695, skill={185,205,220,235} }, --Black Silk Pack
		{ id=12065, skill={225,240,255,270} }, --Mageweave Bag
		{ id=12079, skill={235,250,265,280} }, --Red Mageweave Bag
		{ id=18405, skill={260,275,290,305} }, --Runecloth Bag
		{ id=18445, skill={300,315,330,345} }, --Mooncloth Bag
		{ id=18455, skill={300,315,330,345} }, --Bottomless Bag
		{},
		{},
		{ id=27658, skill={225,240,255,270} }, --Enchanted Mageweave Pouch
		{ id=27659, skill={275,290,305,320} }, --Enchanted Runecloth Bag
		{ id=27660, skill={300,315,330,345} }, --Big Bag of Enchantment
		{},
		{ id=27724, skill={275,290,305,320} }, --Cenarion Herb Bag
		{ id=27725, skill={300,315,330,345} }, --Satchel of Cenarius
		{},
		{ id=26085, skill={260,275,290,305} }, --Soul Pouch
		{ id=26086, skill={280,300,315,330} }, --Felcloth Bag
		{ id=26087, skill={300,315,330,345} }, --Core Felcloth Bag
	},

	TailoringShirt = {
		{ id=3915, skill={1,35,47,60} }, --Brown Linen Shirt
		{ id=2393, skill={1,35,47,60} }, --White Linen Shirt
		{ id=2394, skill={40,65,82,100} }, --Blue Linen Shirt
		{ id=2392, skill={40,65,82,100} }, --Red Linen Shirt
		{ id=2396, skill={70,95,112,130} }, --Green Linen Shirt
		{ id=2406, skill={100,110,120,130} }, --Gray Woolen Shirt
		{ id=3866, skill={110,135,152,170} }, --Stylish Red Shirt
		{ id=7892, skill={120,145,162,180} }, --Stylish Blue Shirt
		{ id=7893, skill={120,145,162,180} }, --Stylish Green Shirt
		{ id=3869, skill={135,145,150,155} }, --Bright Yellow Shirt
		{ id=3870, skill={155,165,170,175} }, --Dark Silk Shirt
		{ id=8483, skill={160,170,175,180} }, --White Swashbuckler's Shirt
		{ id=3871, skill={170,180,185,190} }, --Formal White Shirt
		{ id=8489, skill={175,185,190,195} }, --Red Swashbuckler's Shirt
		{ id=3872, skill={185,195,200,205} }, --Rich Purple Silk Shirt
		{ id=21945, skill={190,200,205,210} }, --Green Holiday Shirt
		{ id=3873, skill={200,210,215,220} }, --Black Swashbuckler's Shirt
		{ id=12061, skill={215,220,225,230} }, --Orange Mageweave Shirt
		{ id=12064, skill={220,225,230,235} }, --Orange Martial Shirt
		{ id=12075, skill={230,235,240,245} }, --Lavender Mageweave Shirt
		{ id=12080, skill={235,240,245,250} }, --Pink Mageweave Shirt
		{ id=12085, skill={240,245,250,255} }, --Tuxedo Shirt
	},

	TailoringMisc = {
		{ id=2963, skill={1,25,37,50} }, --Bolt of Linen Cloth
		{ id=2964, skill={75,90,97,105} }, --Bolt of Woolen Cloth
		{ id=3839, skill={125,135,140,145} }, --Bolt of Silk Cloth
		{ id=3865, skill={175,180,182,185} }, --Bolt of Mageweave
		{ id=18401, skill={250,255,257,260} }, --Bolt of Runecloth
		{ id=18560, skill={250,290,305,320} }, --Mooncloth
		{ id=45453, skill={300,300,300,300} }, --Dreamthread
	},

	EngineeringApprentice = {
		{ name = L["EngineeringApprentice1"], icon = "Trade_Generic" },
		{ id=3918, skill={1,20,30,40} }, --Rough Blasting Powder
		{ id=3920, skill={1,30,45,60} }, --Crafted Light Shot
		{ id=3919, skill={1,30,45,60} }, --Rough Dynamite
		{ id=3922, skill={30,45,52,60} }, --Handful of Copper Bolts
		{ id=3923, skill={30,60,75,90} }, --Rough Copper Bomb
		{ id=7430, skill={50,70,80,90} }, --Arclight Spanner
		{ id=3924, skill={50,80,95,110} }, --Copper Tube
		{ id=3925, skill={50,80,95,110} }, --Rough Boomstick
		{ id=3977, skill={60,90,105,120} }, --Crude Scope
		{ id=3926, skill={65,95,110,125} }, --Copper Modulator
		{ id=3929, skill={75,85,90,95} }, --Coarse Blasting Powder
		{ id=3930, skill={75,85,90,95} }, --Crafted Heavy Shot
		{ id=3931, skill={75,90,97,105} }, --Coarse Dynamite
		{ id=45057, skill={75,90,97,105} }, --Unstable Mining Dynamite
		{ id=3928, skill={75,105,120,135} }, --Mechanical Squirrel
	},

	EngineeringJourneyman = {
		{ name = L["EngineeringJourneyman1"], icon = "Trade_Generic" },
		{ id=3932, skill={85,115,130,145} }, --Target Dummy
		{ id=3973, skill={90,110,125,140} }, --Silver Contact
		{ id=8339, skill={100,115,122,130} }, --EZ-Thro Dynamite
		{ id=8334, skill={100,115,122,130} }, --Practice Lock
		{ id=3933, skill={100,130,145,160} }, --Small Seaforium Charge
		{ id=3934, skill={100,130,145,160} }, --Flying Tiger Goggles
		{ id=3938, skill={105,105,130,155} }, --Bronze Tube
		{ id=3937, skill={105,105,130,155} }, --Large Copper Bomb
		{ id=3936, skill={105,130,142,155} }, --Deadly Blunderbuss
		{ id=3978, skill={110,135,147,160} }, --Standard Scope
		{ id=3941, skill={120,120,145,170} }, --Small Bronze Bomb
		{ id=3939, skill={120,145,157,170} }, --Lovingly Crafted Boomstick
		{ id=3940, skill={120,145,157,170} }, --Shadow Goggles
		{ id=47027, skill={120,145,157,170} }, --Portable Wormhole Generator: Stormwind
		{ id=47028, skill={120,145,157,170} }, --Portable Wormhole Generator: Orgrimmar
		{ id=3947, skill={125,125,135,145} }, --Crafted Solid Shot
		{ id=3945, skill={125,125,135,145} }, --Heavy Blasting Powder
		{ id=15007, skill={125,1,1,1} }, --Jewelry Lens
		{ id=3946, skill={125,125,135,145} }, --Heavy Dynamite
		{ id=26416, skill={125,125,137,150} }, --Small Blue Rocket
		{ id=26417, skill={125,125,137,150} }, --Small Green Rocket
		{ id=26418, skill={125,125,137,150} }, --Small Red Rocket
		{ id=3944, skill={125,125,150,175} }, --Flame Deflector
		{ id=3942, skill={125,125,150,175} }, --Whirring Bronze Gizmo
		{ id=9269, skill={125,150,162,175} }, --Gnomish Universal Remote
		{ id=3949, skill={130,155,167,180} }, --Silver-plated Shotgun
		{ id=6458, skill={135,160,172,185} }, --Ornate Spyglass
		{ id=3950, skill={140,140,165,190} }, --Big Bronze Bomb
		{ id=3952, skill={140,165,177,190} }, --Minor Recombobulator
		{ id=3953, skill={145,145,170,195} }, --Bronze Framework
	},

	EngineeringJourneyman2 = {
		{ name = L["EngineeringJourneyman2"], icon = "Trade_Generic" },
		{ id=3954, skill={145,170,182,195} }, --Moonsight Rifle
		{ id=9271, skill={150,150,160,170} }, --Aquadynamic Fish Attractor
		{ id=23067, skill={150,150,162,175} }, --Blue Firework
		{ id=23068, skill={150,150,162,175} }, --Green Firework
		{ id=23066, skill={150,150,162,175} }, --Red Firework
		{ id=12584, skill={150,150,170,190} }, --Gold Power Core
		{ id=3955, skill={150,175,187,200} }, --Explosive Sheep
		{ id=3956, skill={150,175,187,200} }, --Green Tinted Goggles
	},

	EngineeringExpert = {
		{ name = L["EngineeringExpert1"], icon = "Trade_Generic" },
		{ id=3957, skill={155,175,185,195} }, --Ice Deflector
		{ id=3958, skill={160,160,170,180} }, --Iron Strut
		{ id=3959, skill={160,180,190,200} }, --Discombobulator Ray
		{ id=9273, skill={165,165,180,200} }, --Goblin Jumper Cables
		{ id=3960, skill={165,185,195,205} }, --Portable Bronze Mortar
		{ id=3961, skill={170,170,190,210} }, --Gyrochronatom
		{ id=12585, skill={175,175,185,195} }, --Solid Blasting Powder
		{ id=12586, skill={175,175,185,195} }, --Solid Dynamite
		{ id=15008, skill={175,1,1,1} }, --Precision Jewelers Kit
		{ id=26420, skill={175,175,187,200} }, --Large Blue Rocket
		{ id=26421, skill={175,175,187,200} }, --Large Green Rocket
		{ id=26422, skill={175,175,187,200} }, --Large Red Rocket
		{ id=3963, skill={175,175,195,215} }, --Compact Harvest Reaper Kit
		{ id=12590, skill={175,175,195,215} }, --Gyromatic Micro-Adjustor
		{ id=3962, skill={175,175,195,215} }, --Iron Grenade
		{ id=12587, skill={175,195,205,215} }, --Bright-Eye Goggles
		{ id=3979, skill={180,200,210,220} }, --Accurate Scope
		{ id=3965, skill={185,185,205,225} }, --Advanced Target Dummy
		{ id=8243, skill={185,185,205,225} }, --Flash Bomb
		{ id=3966, skill={185,205,215,225} }, --Craftsman's Monocle
		{ id=3967, skill={190,190,210,230} }, --Big Iron Bomb
		{ id=21940, skill={190,190,210,230} }, --Snowmaster 9000
		{ id=12589, skill={195,195,215,235} }, --Mithril Tube
		{ id=3968, skill={195,215,225,235} }, --Goblin Land Mine
		{ id=23069, skill={200,200,210,220} }, --EZ-Thro Dynamite II
		{ id=3972, skill={200,200,220,240} }, --Large Seaforium Charge
		{ id=15255, skill={200,200,220,240} }, --Mechanical Repair Kit
		{ id=12591, skill={200,200,220,240} }, --Unstable Trigger
		{ id=3971, skill={200,220,230,240} }, --Gnomish Cloaking Device
		{ id=3969, skill={200,220,230,240} }, --Mechanical Dragonling
	},

	EngineeringExpert2 = {
		{ name = L["EngineeringExpert2"], icon = "Trade_Generic" },
		{ id=12594, skill={205,225,235,245} }, --Fire Goggles
		{ id=12595, skill={205,225,235,245} }, --Mithril Blunderbuss
		{ id=12596, skill={210,210,230,250} }, --Hi-Impact Mithril Slugs
		{ id=12597, skill={210,230,240,250} }, --Deadly Scope
		{ id=12599, skill={215,215,235,255} }, --Mithril Casing
		{ id=12603, skill={215,215,235,255} }, --Mithril Frag Bomb
		{ id=12607, skill={220,240,250,260} }, --Catseye Ultra Goggles
		{ id=12614, skill={220,240,250,260} }, --Mithril Heavy-bore Rifle
		{ id=15009, skill={225,1,1,1} }, --Jewelry Scope
		{ id=26423, skill={225,225,237,250} }, --Blue Rocket Cluster
		{ id=26424, skill={225,225,237,250} }, --Green Rocket Cluster
		{ id=26425, skill={225,225,237,250} }, --Red Rocket Cluster
		{ id=26442, skill={225,245,255,265} }, --Firework Launcher
		{ id=12616, skill={225,245,255,265} }, --Parachute Cloak
		{ id=12615, skill={225,245,255,265} }, --Spellpower Goggles Xtreme
	},

	EngineeringArtisan = {
		{ name = L["EngineeringArtisan1"], icon = "Trade_Generic" },
		{ id=12617, skill={230,250,260,270} }, --Deepdive Helmet
		{ id=12618, skill={230,250,260,270} }, --Rose Colored Goggles
		{ id=12619, skill={235,235,255,275} }, --Hi-Explosive Bomb
		{ id=12620, skill={240,260,270,280} }, --Sniper Scope
		{ id=12621, skill={245,245,265,285} }, --Mithril Gyro-Shot
		{ id=12622, skill={245,265,275,285} }, --Green Lens
		{ id=19788, skill={250,250,255,260} }, --Dense Blasting Powder
		{ id=23070, skill={250,250,260,270} }, --Dense Dynamite
		{ id=23507, skill={250,250,260,270} }, --Snake Burst Firework
		{ id=46610, skill={250,1,1,1} }, --Battery-Powered Crowd Pummeler
		{ id=19567, skill={250,270,280,290} }, --Salt Shaker
		{ id=12624, skill={250,270,280,290} }, --Mithril Mechanical Dragonling
		{ id=26011, skill={250,320,330,340} }, --Tranquil Mechanical Yeti
		{ id=23071, skill={260,270,275,280} }, --Truesilver Transformer
		{ id=19790, skill={260,280,290,300} }, --Thorium Grenade
		{ id=19791, skill={260,280,290,300} }, --Thorium Widget
		{ id=19792, skill={260,280,290,300} }, --Thorium Rifle
		{ id=23077, skill={260,280,290,300} }, --Gyrofreeze Ice Reflector
		{ id=19793, skill={265,285,295,305} }, --Lifelike Mechanical Toad
		{ id=19794, skill={270,290,300,310} }, --Spellpower Goggles Xtreme Plus
		{ id=26426, skill={275,275,280,285} }, --Large Blue Rocket Cluster
		{ id=26427, skill={275,275,280,285} }, --Large Green Rocket Cluster
		{ id=26428, skill={275,275,280,285} }, --Large Red Rocket Cluster
		{ id=23080, skill={275,275,285,295} }, --Powerful Seaforium Charge
		{ id=23079, skill={275,285,290,295} }, --Major Recombobulator
		{ id=26443, skill={275,295,305,315} }, --Firework Cluster Launcher
		{ id=19814, skill={275,295,305,315} }, --Masterwork Target Dummy
		{ id=19795, skill={275,295,305,315} }, --Thorium Tube
		{ id=19796, skill={275,295,305,315} }, --Dark Iron Rifle
		{ id=19799, skill={285,305,315,325} }, --Dark Iron Bomb
	},

	EngineeringArtisan2 = {
		{ name = L["EngineeringArtisan2"], icon = "Trade_Generic" },
		{ id=19815, skill={285,305,315,325} }, --Delicate Arcanite Converter
		{ id=19800, skill={285,305,315,325} }, --Thorium Shells
		{ id=19825, skill={290,310,320,330} }, --Master Engineer's Goggles
		{ id=19819, skill={290,310,320,330} }, --Voice Amplification Modulator
		{ id=23081, skill={290,310,320,330} }, --Hyper-Radiant Flame Reflector
		{ id=19831, skill={300,320,330,340} }, --Arcane Bomb
		{ id=22704, skill={300,320,330,340} }, --Field Repair Bot 74A
		{ id=19830, skill={300,320,330,340} }, --Arcanite Dragonling
		{ id=22793, skill={300,320,330,340} }, --Biznicks 247x128 Accurascope
		{ id=24356, skill={300,320,330,340} }, --Bloodvine Goggles
		{ id=24357, skill={300,320,330,340} }, --Bloodvine Lens
		{ id=19833, skill={300,320,330,340} }, --Flawless Arcanite Rifle
		{ id=23082, skill={300,320,330,340} }, --Ultra-Flash Shadow Reflector
		{ id=22795, skill={300,320,330,340} }, --Core Marksman Rifle
		{ id=22797, skill={300,320,330,340} }, --Force Reactive Disk
		{ id=45481, skill={300,320,330,340} }, --Intricate Gyroscope Goggles
	},

	Gnomish = {
		{ name = L["Gnomish1"], icon = "Trade_Generic" },
		{ id=12895, skill={205,205,205,205} }, --Inlaid Mithril Cylinder Plans
		{ id=15633, skill={205,205,205,205} }, --Lil' Smoky
		{ id=12899, skill={205,225,235,245} }, --Gnomish Shrink Ray
		{ id=12902, skill={210,230,240,250} }, --Gnomish Net-o-Matic Projector
		{ id=12897, skill={210,230,240,250} }, --Gnomish Goggles
		{ id=12903, skill={215,235,245,255} }, --Gnomish Harm Prevention Belt
		{ id=12905, skill={225,245,255,265} }, --Gnomish Rocket Boots
		{ id=12906, skill={230,250,260,270} }, --Gnomish Battle Chicken
		{ id=12907, skill={235,255,265,275} }, --Gnomish Mind Control Cap
		{ id=12759, skill={240,260,270,280} }, --Gnomish Death Ray
		{ id=23129, skill={260,260,265,270} }, --World Enlarger
		{ id=23489, skill={260,285,295,305} }, --Ultrasafe Transporter: Gadgetzan
		{ id=23096, skill={265,275,280,285} }, --Alarm-O-Bot
	},

	Goblin = {
		{ name = L["Goblin1"], icon = "Trade_Generic" },
		{ id=12715, skill={205,205,205,205} }, --Goblin Rocket Fuel Recipe
		{ id=15628, skill={205,205,205,205} }, --Pet Bombling
		{ id=13240, skill={205,205,205,205} }, --The Mortar: Reloaded
		{ id=12760, skill={205,205,225,245} }, --Goblin Sapper Charge
		{ id=12716, skill={205,225,235,245} }, --Goblin Mortar
		{ id=12718, skill={205,225,235,245} }, --Goblin Construction Helmet
		{ id=12717, skill={205,225,235,245} }, --Goblin Mining Helmet
		{ id=8895, skill={225,245,255,265} }, --Goblin Rocket Boots
		{ id=12755, skill={230,230,250,270} }, --Goblin Bomb Dispenser
		{ id=12754, skill={235,235,255,275} }, --The Big One
		{ id=12908, skill={240,260,270,280} }, --Goblin Dragon Gun
		{ id=12758, skill={245,265,275,285} }, --Goblin Rocket Helmet
		{ id=23486, skill={260,285,295,305} }, --Dimensional Ripper: Everlook
		{ id=23078, skill={265,285,295,305} }, --Goblin Jumper Cables XL
	},

	EngineeringEquipment = {
		{ name = L["EngineeringEquipment1"], icon = "Trade_Generic" },
		{ id=3934, skill={100,130,145,160} }, --Flying Tiger Goggles
		{ id=3940, skill={120,145,157,170} }, --Shadow Goggles
		{ id=3956, skill={150,175,187,200} }, --Green Tinted Goggles
		{ id=12587, skill={175,195,205,215} }, --Bright-Eye Goggles
		{ id=3966, skill={185,205,215,225} }, --Craftsman's Monocle
		{ id=12594, skill={205,225,235,245} }, --Fire Goggles
		{ id=12607, skill={220,240,250,260} }, --Catseye Ultra Goggles
		{ id=12615, skill={225,245,255,265} }, --Spellpower Goggles Xtreme
		{ id=12617, skill={230,250,260,270} }, --Deepdive Helmet
		{ id=12618, skill={230,250,260,270} }, --Rose Colored Goggles
		{ id=12622, skill={245,265,275,285} }, --Green Lens
		{ id=19794, skill={270,290,300,310} }, --Spellpower Goggles Xtreme Plus
		{ id=19825, skill={290,310,320,330} }, --Master Engineer's Goggles
		{ id=24356, skill={300,320,330,340} }, --Bloodvine Goggles
		{ id=24357, skill={300,320,330,340} }, --Bloodvine Lens
		{ id=45481, skill={300,320,330,340} }, --Intricate Gyroscope Goggles
		{ id=22797, skill={300,320,330,340} }, --Force Reactive Disk
		{ id=12897, skill={210,230,240,250} }, --Gnomish Goggles
		{ id=12907, skill={235,255,265,275} }, --Gnomish Mind Control Cap
		{ id=12718, skill={205,225,235,245} }, --Goblin Construction Helmet
		{ id=12717, skill={205,225,235,245} }, --Goblin Mining Helmet
		{ id=12758, skill={245,265,275,285} }, --Goblin Rocket Helmet
		{ id=12905, skill={225,245,255,265} }, --Gnomish Rocket Boots
		{ id=8895, skill={225,245,255,265} }, --Goblin Rocket Boots
		{ id=12616, skill={225,245,255,265} }, --Parachute Cloak
		{ id=19819, skill={290,310,320,330} }, --Voice Amplification Modulator
		{ id=12903, skill={215,235,245,255} }, --Gnomish Harm Prevention Belt
	},

	EngineeringTrinkets = {
		{ name = L["EngineeringTrinkets1"], icon = "Trade_Generic" },
		{ id=9269, skill={125,150,162,175} }, --Gnomish Universal Remote
		{ id=3952, skill={140,165,177,190} }, --Minor Recombobulator
		{ id=9273, skill={165,165,180,200} }, --Goblin Jumper Cables
		{ id=3971, skill={200,220,230,240} }, --Gnomish Cloaking Device
		{ id=3969, skill={200,220,230,240} }, --Mechanical Dragonling
		{ id=12624, skill={250,270,280,290} }, --Mithril Mechanical Dragonling
		{ id=23077, skill={260,280,290,300} }, --Gyrofreeze Ice Reflector
		{ id=23079, skill={275,285,290,295} }, --Major Recombobulator
		{ id=23081, skill={290,310,320,330} }, --Hyper-Radiant Flame Reflector
		{ id=19830, skill={300,320,330,340} }, --Arcanite Dragonling
		{ id=23082, skill={300,320,330,340} }, --Ultra-Flash Shadow Reflector
		{ id=12899, skill={205,225,235,245} }, --Gnomish Shrink Ray
		{ id=12902, skill={210,230,240,250} }, --Gnomish Net-o-Matic Projector
		{ id=12906, skill={230,250,260,270} }, --Gnomish Battle Chicken
		{ id=12759, skill={240,260,270,280} }, --Gnomish Death Ray
		{ id=23489, skill={260,285,295,305} }, --Ultrasafe Transporter - Gadgetzan
		{ id=13240, skill={205,205,205,205} }, --The Mortar: Reloaded
		{ id=12716, skill={205,225,235,245} }, --Goblin Mortar
		{ id=12755, skill={230,230,250,270} }, --Goblin Bomb Dispenser
		{ id=12908, skill={240,260,270,280} }, --Goblin Dragon Gun
		{ id=23486, skill={260,285,295,305} }, --Dimensional Ripper - Everlook
		{ id=23078, skill={265,285,295,305} }, --Goblin Jumper Cables XL
	},

	EngineeringExplosives = {
		{ name = L["EngineeringExplosives1"], icon = "Trade_Generic" },
		{ id=3919, skill={1,30,45,60} }, --Rough Dynamite
		{ id=3923, skill={30,60,75,90} }, --Rough Copper Bomb
		{ id=3931, skill={75,90,97,105} }, --Coarse Dynamite
		{ id=45057, skill={75,90,97,105} }, --Unstable Mining Dynamite
		{ id=8339, skill={100,115,122,130} }, --EZ-Thro Dynamite
		{ id=3937, skill={105,105,130,155} }, --Large Copper Bomb
		{ id=3941, skill={120,120,145,170} }, --Small Bronze Bomb
		{ id=3946, skill={125,125,135,145} }, --Heavy Dynamite
		{ id=3950, skill={140,140,165,190} }, --Big Bronze Bomb
		{ id=3955, skill={150,175,187,200} }, --Explosive Sheep
		{ id=12586, skill={175,175,185,195} }, --Solid Dynamite
		{ id=3962, skill={175,175,195,215} }, --Iron Grenade
		{ id=8243, skill={185,185,205,225} }, --Flash Bomb
		{ id=3967, skill={190,190,210,230} }, --Big Iron Bomb
		{ id=3968, skill={195,215,225,235} }, --Goblin Land Mine
		{ id=23069, skill={200,200,210,220} }, --EZ-Thro Dynamite II
		{ id=12603, skill={215,215,235,255} }, --Mithril Frag Bomb
		{ id=12619, skill={235,235,255,275} }, --Hi-Explosive Bomb
		{ id=23070, skill={250,250,260,270} }, --Dense Dynamite
		{ id=19790, skill={260,280,290,300} }, --Thorium Grenade
		{ id=12760, skill={205,205,225,245} }, --Goblin Sapper Charge
		{ id=12754, skill={235,235,255,275} }, --The Big One
		{ id=19799, skill={285,305,315,325} }, --Dark Iron Bomb
		{ id=19831, skill={300,320,330,340} }, --Arcane Bomb
	},

	EngineeringWeapons = {
		{ name = L["EngineeringWeapons1"], icon = "Trade_Generic" },
		{ id=3925, skill={50,80,95,110} }, --Rough Boomstick
		{ id=3936, skill={105,130,142,155} }, --Deadly Blunderbuss
		{ id=3939, skill={120,145,157,170} }, --Lovingly Crafted Boomstick
		{ id=3949, skill={130,155,167,180} }, --Silver-plated Shotgun
		{ id=3954, skill={145,170,182,195} }, --Moonsight Rifle
		{ id=12595, skill={205,225,235,245} }, --Mithril Blunderbuss
		{ id=12614, skill={220,240,250,260} }, --Mithril Heavy-bore Rifle
		{ id=19792, skill={260,280,290,300} }, --Thorium Rifle
		{ id=19796, skill={275,295,305,315} }, --Dark Iron Rifle
		{ id=19833, skill={300,320,330,340} }, --Flawless Arcanite Rifle
		{ id=22795, skill={300,320,330,340} }, --Core Marksman Rifle
		{ id=46610, skill={250,270,280,290} }, --Battery-Powered Crowd Pummeler
	},

	EngineeringParts = {
		{ name = L["EngineeringParts1"], icon = "Trade_Generic" },
		{ id=3918, skill={1,20,30,40} }, --Rough Blasting Powder
		{ id=3929, skill={75,85,90,95} }, --Coarse Blasting Powder
		{ id=3945, skill={125,125,135,145} }, --Heavy Blasting Powder
		{ id=12585, skill={175,175,185,195} }, --Solid Blasting Powder
		{ id=19788, skill={250,250,255,260} }, --Dense Blasting Powder
		{ id=3922, skill={30,45,52,60} }, --Handful of Copper Bolts
		{ id=3924, skill={50,80,95,110} }, --Copper Tube
		{ id=3926, skill={65,95,110,125} }, --Copper Modulator
		{ id=3973, skill={90,110,125,140} }, --Silver Contact
		{ id=3938, skill={105,105,130,155} }, --Bronze Tube
		{ id=3942, skill={125,125,150,175} }, --Whirring Bronze Gizmo
		{ id=3953, skill={145,145,170,195} }, --Bronze Framework
		{ id=12584, skill={150,150,170,190} }, --Gold Power Core
		{ id=3958, skill={160,160,170,180} }, --Iron Strut
		{ id=3961, skill={170,170,190,210} }, --Gyrochronatom
		{ id=12589, skill={195,195,215,235} }, --Mithril Tube
		{ id=12591, skill={200,200,220,240} }, --Unstable Trigger
		{ id=12599, skill={215,215,235,255} }, --Mithril Casing
		{ id=23071, skill={260,270,275,280} }, --Truesilver Transformer
		{ id=19791, skill={260,280,290,300} }, --Thorium Widget
		{ id=19795, skill={275,295,305,315} }, --Thorium Tube
		{ id=19815, skill={285,305,315,325} }, --Delicate Arcanite Converter
	},

	EngineeringMisc = {
		{ name = L["EngineeringMisc1"], icon = "Trade_Generic" },
		{ id=7430, skill={50,70,80,90} }, --Arclight Spanner
		{ id=15007, skill={125,1,1,1} }, --Jewelry Lens
		{ id=15008, skill={175,1,1,1} }, --Precision Jewelers Kit
		{ id=12590, skill={175,175,195,215} }, --Gyromatic Micro-Adjustor
		{ id=15009, skill={225,1,1,1} }, --Jewelry Scope
		{ id=3977, skill={60,90,105,120} }, --Crude Scope
		{ id=3978, skill={110,135,147,160} }, --Standard Scope
		{ id=12597, skill={210,230,240,250} }, --Deadly Scope
		{ id=12620, skill={240,260,270,280} }, --Sniper Scope
		{ id=22793, skill={300,320,330,340} }, --Biznicks 247x128 Accurascope
		{ id=3920, skill={1,30,45,60} }, --Crafted Light Shot
		{ id=3930, skill={75,85,90,95} }, --Crafted Heavy Shot
		{ id=3947, skill={125,125,135,145} }, --Crafted Solid Shot
		{ id=12621, skill={245,245,265,285} }, --Mithril Gyro-Shot
		{ id=12596, skill={210,210,230,250} }, --Hi-Impact Mithril Slugs
		{ id=19800, skill={285,305,315,325} }, --Thorium Shells
		{ id=6458, skill={135,160,172,185} }, --Ornate Spyglass
		{ id=9271, skill={150,150,160,170} }, --Aquadynamic Fish Attractor
		{ id=3932, skill={85,115,130,145} }, --Target Dummy
		{ id=3965, skill={185,185,205,225} }, --Advanced Target Dummy
		{ id=19814, skill={275,295,305,315} }, --Masterwork Target Dummy
		{ id=3933, skill={100,130,145,160} }, --Small Seaforium Charge
		{ id=3972, skill={200,200,220,240} }, --Large Seaforium Charge
		{ id=23080, skill={275,275,285,295} }, --Powerful Seaforium Charge
	},

	EngineeringMisc2 = {
		{ name = L["EngineeringMisc2"], icon = "Trade_Generic" },
		{ id=8334, skill={100,115,122,130} }, --Practice Lock
		{ id=3963, skill={175,175,195,215} }, --Compact Harvest Reaper Kit
		{ id=47027, skill={120,145,157,170} }, --Portable Wormhole Generator: Stormwind
		{ id=47028, skill={120,145,157,170} }, --Portable Wormhole Generator: Orgrimmar
		{ id=23096, skill={265,275,280,285} }, --Alarm-O-Bot
		{ id=19567, skill={250,270,280,290} }, --Salt Shaker
		{ id=22704, skill={300,320,330,340} }, --Field Repair Bot 74A
		{ id=3944, skill={125,125,150,175} }, --Flame Deflector
		{ id=3957, skill={155,175,185,195} }, --Ice Deflector
		{ id=3959, skill={160,180,190,200} }, --Discombobulator Ray
		{ id=3960, skill={165,185,195,205} }, --Portable Bronze Mortar
		{ id=15255, skill={200,200,220,240} }, --Mechanical Repair Kit
		{ id=23129, skill={260,260,265,270} }, --World Enlarger
		{ id=21940, skill={190,190,210,230} }, --Snowmaster 9000
		{ id=26442, skill={225,245,255,265} }, --Firework Launcher
		{ id=12715, skill={205,205,205,205} }, --Goblin Rocket Fuel Recipe
		{ id=12895, skill={205,205,205,205} }, --Inlaid Mithril Cylinder Plans
	},

	EngineeringMisc3 = {
		{ name = L["EngineeringMisc3"], icon = "Trade_Generic" },
		{ id=26416, skill={125,125,137,150} }, --Small Blue Rocket
		{ id=26417, skill={125,125,137,150} }, --Small Green Rocket
		{ id=26418, skill={125,125,137,150} }, --Small Red Rocket
		{ id=23067, skill={150,150,162,175} }, --Blue Firework
		{ id=23068, skill={150,150,162,175} }, --Green Firework
		{ id=23066, skill={150,150,162,175} }, --Red Firework
		{ id=26420, skill={175,175,187,200} }, --Large Blue Rocket
		{ id=26421, skill={175,175,187,200} }, --Large Green Rocket
		{ id=26422, skill={175,175,187,200} }, --Large Red Rocket
		{ id=26423, skill={225,225,237,250} }, --Blue Rocket Cluster
		{ id=26424, skill={225,225,237,250} }, --Green Rocket Cluster
		{ id=26425, skill={225,225,237,250} }, --Red Rocket Cluster
		{ id=23507, skill={250,250,260,270} }, --Snake Burst Firework
		{ id=26426, skill={275,275,280,285} }, --Large Blue Rocket Cluster
		{ id=26427, skill={275,275,280,285} }, --Large Green Rocket Cluster
		{ id=26428, skill={275,275,280,285} }, --Large Red Rocket Cluster
		{ id=3928, skill={75,105,120,135} }, --Mechanical Squirrel
		{ id=26011, skill={250,320,330,340} }, --Tranquil Mechanical Yeti
		{ id=19793, skill={265,285,295,305} }, --Lifelike Mechanical Toad
		{ id=15633, skill={205,205,205,205} }, --Lil' Smoky
		{ id=15628, skill={205,205,205,205} }, --Pet Bombling
	},

	Mining = {
		{ name = L["Mining1"], icon = "Trade_Generic" },
		{ id=100000, skill={1,25,50,100} }, --Copper Vein
		{ id=100030, skill={1,25,50,100} }, --Rough Stone
		{ id=100001, skill={65,90,115,165} }, --Incendicite Mineral Vein
		{ id=100002, skill={65,90,115,165} }, --Tin Vein
		{ id=100031, skill={65,90,115,165} }, --Coarse Stone
		{ id=100003, skill={75,100,125,175} }, --Silver Vein
		{ id=100004, skill={75,100,125,175} }, --Ooze Covered Silver Vein
		{ id=100005, skill={75,100,125,175} }, --Lesser Bloodstone Deposit
		{ id=100006, skill={125,150,175,225} }, --Iron Deposit
		{ id=100032, skill={125,150,175,225} }, --Heavy Stone
		{ id=100007, skill={150,175,200,250} }, --Indurium Mineral Vein
		{ id=100008, skill={155,175,205,255} }, --Gold Vein
		{ id=100009, skill={155,175,205,255} }, --Ooze Covered Gold Vein
		{ id=100010, skill={175,200,225,275} }, --Mithril Deposit
		{ id=100033, skill={175,200,225,275} }, --Solid Stone
		{ id=100011, skill={175,200,225,275} }, --Ooze Covered Mithril Deposit
		{ id=100034, skill={175,200,225,275} }, --Solid Stone
	},

	Mining2 = {
		{ name = L["Mining2"], icon = "Trade_Generic" },
		{ id=100014, skill={230,255,280,330} }, --Dark Iron Deposit
		{ id=100012, skill={230,255,280,330} }, --Truesilver Deposit
		{ id=100013, skill={230,255,280,330} }, --Ooze Covered Truesilver Deposit
		{ id=100015, skill={245,270,295,345} }, --Small Thorium Vein
		{ id=100035, skill={245,270,295,345} }, --Dense Stone
		{ id=100016, skill={245,270,295,345} }, --Ooze Covered Thorium Vein
		{ id=100036, skill={245,270,295,345} }, --Dense Stone
		{ id=100017, skill={275,300,325,365} }, --Rich Thorium Vein
		{ id=100037, skill={245,270,295,345} }, --Dense Stone
		{ id=100018, skill={275,300,325,365} }, --Ooze Covered Rich Thorium Vein
		{ id=100038, skill={245,270,295,345} }, --Dense Stone
		{ id=100019, skill={275,300,325,350} }, --Hakkari Thorium Vein
		{ id=100039, skill={245,270,295,345} }, --Dense Stone
		{ id=100020, skill={275,300,325,350} }, --Souldarite
		{ id=100021, skill={305,330,355,370} }, --Small Obsidian Chunk
		{ id=100022, skill={305,330,355,370} }, --Small Obsidian Chunk
		{ id=100023, skill={305,330,355,370} }, --Large Obsidian Chunk
		{ id=100024, skill={305,330,355,370} }, --Large Obsidian Chunk
		{ id=100025, skill={310,335,360,375} }, --Gemstone Deposit
	},

	Smelting = {
		{ name = L["Smelting1"], icon = "Trade_Generic" },
		{ id=2657, skill={1,25,45,70} }, --Smelt Copper
		{ id=3304, skill={65,65,70,75} }, --Smelt Tin
		{ id=2659, skill={65,65,90,115} }, --Smelt Bronze
		{ id=2658, skill={75,100,112,125} }, --Smelt Silver
		{ id=3307, skill={125,125,130,140} }, --Smelt Iron
		{ id=3308, skill={155,170,177,185} }, --Smelt Gold
		{ id=3569, skill={165,165,165,165} }, --Smelt Steel
		{ id=10097, skill={175,175,175,175} }, --Smelt Mithril
		{ id=14891, skill={230,230,230,230} }, --Smelt Dark Iron
		{ id=10098, skill={230,230,230,230} }, --Smelt Truesilver
		{ id=16153, skill={250,250,250,250} }, --Smelt Thorium
		{ id=22967, skill={300,350,362,375} }, --Smelt Elementium
		{ id=45451, skill={300,350,362,375} }, --Smelt Dreamsteel
	},

	CookingApprentice = {
		{ name = L["CookingApprentice1"], icon = "Trade_Generic" },
		{ id=818, skill={1,1,1,1} }, --Basic Campfire
		{ id=7751, skill={1,45,65,85} }, --Brilliant Smallfish
		{ id=2538, skill={1,45,65,85} }, --Charred Wolf Meat
		{ id=15935, skill={1,45,65,85} }, --Crispy Bat Wing
		{ id=21143, skill={1,45,65,85} }, --Gingerbread Cookie
		{ id=8604, skill={1,45,65,85} }, --Herb Baked Egg
		{ id=2540, skill={1,45,65,85} }, --Roasted Boar Meat
		{ id=7752, skill={1,45,65,85} }, --Slitherskin Mackerel
		{ id=6412, skill={10,50,70,90} }, --Kaldorei Spider Kabob
		{ id=2539, skill={10,50,70,90} }, --Spiced Wolf Meat
		{ id=6413, skill={20,60,80,100} }, --Scorpid Surprise
		{ id=2795, skill={25,60,80,100} }, --Beer Basted Boar Ribs
		{ id=21144, skill={35,75,95,115} }, --Egg Nog
		{ id=45054, skill={35,75,95,115} }, --Maritime Gumbo
		{ id=6414, skill={35,75,95,115} }, --Roasted Kodo Meat
		{ id=8607, skill={40,80,100,120} }, --Smoked Bear Meat
		{ id=6499, skill={50,90,110,130} }, --Boiled Clams
		{ id=2541, skill={50,90,110,130} }, --Coyote Steak
		{ id=6415, skill={50,90,110,130} }, --Fillet of Frenzy
		{ id=2542, skill={50,90,110,130} }, --Goretusk Liver Pie
		{ id=7754, skill={50,90,110,130} }, --Loch Frenzy Delight
		{ id=7753, skill={50,90,110,130} }, --Longjaw Mud Snapper
		{ id=7827, skill={50,90,110,130} }, --Rainbow Fin Albacore
		{ id=6416, skill={50,90,110,130} }, --Strider Stew
		{ id=3371, skill={60,100,120,140} }, --Blood Sausage
		{ id=9513, skill={60,100,120,140} }, --Thistle Tea
		{ id=2544, skill={75,115,135,155} }, --Crab Cake
		{ id=2543, skill={75,115,135,155} }, --Westfall Stew
	},

	CookingJourneyman = {
		{ name = L["CookingJourneyman1"], icon = "Trade_Generic" },
		{ id=3370, skill={80,120,140,160} }, --Crocolisk Steak
		{ id=2546, skill={80,120,140,160} }, --Dry Pork Ribs
		{ id=25704, skill={80,120,140,160} }, --Smoked Sagefish
		{ id=2545, skill={85,125,145,165} }, --Cooked Crab Claw
		{ id=8238, skill={85,125,145,165} }, --Savory Deviate Delight
		{ id=6501, skill={90,130,150,170} }, --Clam Chowder
		{ id=6417, skill={90,130,150,170} }, --Dig Rat Stew
		{ id=3372, skill={90,130,150,170} }, --Murloc Fin Soup
		{ id=2547, skill={100,135,155,175} }, --Redridge Goulash
		{ id=7755, skill={100,140,160,180} }, --Bristle Whisker Catfish
		{ id=6418, skill={100,140,160,180} }, --Crispy Lizard Tail
		{ id=2549, skill={100,140,160,180} }, --Seasoned Wolf Kabob
		{ id=2548, skill={110,130,150,170} }, --Succulent Pork Ribs
		{ id=3397, skill={110,150,170,190} }, --Big Bear Steak
		{ id=3377, skill={110,150,170,190} }, --Gooey Spider Cake
		{ id=6419, skill={110,150,170,190} }, --Lean Venison
		{ id=3373, skill={120,160,180,200} }, --Crocolisk Gumbo
		{ id=6500, skill={125,165,185,205} }, --Goblin Deviled Clams
		{ id=15853, skill={125,165,185,205} }, --Lean Wolf Steak
		{ id=3398, skill={125,175,195,215} }, --Hot Lion Chops
		{ id=3376, skill={130,170,190,210} }, --Curiously Tasty Omelet
		{ id=24418, skill={150,160,180,200} }, --Heavy Crocolisk Stew
		{ id=3399, skill={150,190,210,230} }, --Tasty Lion Steak
	},

	CookingExpert = {
		{ name = L["CookingExpert1"], icon = "Trade_Generic" },
		{ id=13028, skill={175,175,190,205} }, --Goldthorn Tea
		{ id=7828, skill={175,190,210,230} }, --Rockscale Cod
		{ id=4094, skill={175,215,235,255} }, --Barbecued Buzzard Wing
		{ id=15863, skill={175,215,235,255} }, --Carrion Surprise
		{ id=7213, skill={175,215,235,255} }, --Giant Clam Scorcho
		{ id=15856, skill={175,215,235,255} }, --Hot Wolf Ribs
		{ id=15861, skill={175,215,235,255} }, --Jungle Stew
		{ id=20916, skill={175,215,235,255} }, --Mithril Headed Trout
		{ id=15865, skill={175,215,235,255} }, --Mystery Stew
		{ id=15855, skill={175,215,235,255} }, --Roast Raptor
		{ id=25954, skill={175,215,235,255} }, --Sagefish Delight
		{ id=3400, skill={175,215,235,255} }, --Soothing Turtle Bisque
		{ id=45627, skill={200,240,260,280} }, --Gilneas Hot Stew
		{ id=15906, skill={200,240,260,280} }, --Dragonbreath Chili
		{ id=15910, skill={200,240,260,280} }, --Heavy Kodo Stew
		{ id=21175, skill={200,240,260,280} }, --Spider Sausage
		{ id=18239, skill={225,265,285,305} }, --Cooked Glossy Mightfish
		{ id=18241, skill={225,265,285,305} }, --Filet of Redgill
		{ id=15933, skill={225,265,285,305} }, --Monster Omelet
		{ id=15915, skill={225,265,285,305} }, --Spiced Chili Crab
		{ id=18238, skill={225,265,285,305} }, --Spotted Yellowtail
		{ id=22480, skill={225,265,285,305} }, --Tender Wolf Steak
		{ id=20626, skill={225,265,285,305} }, --Undermine Clam Chowder
	},

	CookingArtisan = {
		{ name = L["CookingArtisan1"], icon = "Trade_Generic" },
		{ id=18240, skill={240,280,300,320} }, --Grilled Squid
		{ id=18242, skill={240,280,300,320} }, --Hot Smoked Bass
		{ id=18243, skill={250,290,310,330} }, --Nightfin Soup
		{ id=18244, skill={250,290,310,330} }, --Poached Sunscale Salmon
		{ id=18247, skill={275,315,335,355} }, --Baked Salmon
		{ id=18245, skill={275,315,335,355} }, --Lobster Stew
		{ id=18246, skill={275,315,335,355} }, --Mightfish Steak
		{ id=22761, skill={275,315,335,355} }, --Runn Tum Tuber Surprise
		{ id=24801, skill={285,325,345,365} }, --Smoked Desert Dumplings
		{ id=25659, skill={300,325,345,365} }, --Dirge's Kickin' Chimaerok Chops
		{ id=57031, skill={300,300,300,300} }, --Danonzo's Tel'Abim Surprise
		{ id=57032, skill={300,300,300,300} }, --Danonzo's Tel'Abim Medley
		{ id=57033, skill={300,300,300,300} }, --Danonzo's Tel'Abim Delight
		{ id=46085, skill={300,300,300,300} }, --Gurubashi Gumbo
		{ id=45625, skill={300,300,300,300} }, --Le Fishe Au Chocolat
		{ id=49551, skill={300,325,345,365} }, --Empowering Herbal Salad
	},

	FirstAid = {
		{ name = L["FirstAid1"], icon = "Trade_Generic" },
		{ id=3275, skill={1,30,45,60} }, --Linen Bandage
		{ id=3276, skill={40,50,75,100} }, --Heavy Linen Bandage
		{ id=7934, skill={80,80,115,150} }, --Anti-Venom
		{ id=3277, skill={80,80,115,150} }, --Wool Bandage
		{ id=3278, skill={115,115,150,185} }, --Heavy Wool Bandage
		{ id=7935, skill={130,130,165,200} }, --Strong Anti-Venom
		{ id=7928, skill={150,150,180,210} }, --Silk Bandage
		{ id=7929, skill={180,180,210,240} }, --Heavy Silk Bandage
		{ id=10840, skill={210,210,240,270} }, --Mageweave Bandage
		{ id=10841, skill={240,240,270,300} }, --Heavy Mageweave Bandage
		{ id=10844, skill={250,260,280,310} }, --Powerful Smelling Salts
		{ id=18629, skill={260,260,290,320} }, --Runecloth Bandage
		{ id=18630, skill={290,290,320,350} }, --Heavy Runecloth Bandage
		{ id=23787, skill={300,300,330,360} }, --Powerful Anti-Venom
	},

	Survival = {
		{ name = L["Survival1"], icon = "Trade_Generic" },
		{ id=46064, skill={1,30,45,60} }, --Dim Torch
		{ id=46075, skill={30,30,45,60} }, --Iron Lantern
		{ id=46068, skill={50,1,1,1} }, --Cleaning Cloth
		{ id=46072, skill={50,100,1,1} }, --Traveler's Tent
		{ id=46074, skill={75,100,112,125} }, --Simple Woodern Planter
		{ id=46073, skill={75,125,150,1} }, --Fishing Boat
		{ id=46066, skill={75,150,1,1} }, --Murloc's Flippers
		{ id=46077, skill={90,120,135,150} }, --Repaired Electro-Lantern
	},

	JewelcraftingApprentice = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=29728, skill={1,21,25,30} }, --Rough Gritted Paper
		{ id=29730, skill={1,21,30,40} }, --Rough Copper Ring
		{ id=29732, skill={1,21,33,45} }, --Copper Bangle
		{ id=41001, skill={15,35,45,55} }, --Bright Copper Ring
		{ id=41003, skill={20,40,47,55} }, --Malachite Ring
		{ id=41249, skill={25,25,45,65} }, --Bulky Copper Ring
		{ id=41005, skill={25,45,52,60} }, --Sturdy Copper Ring
		{ id=41031, skill={35,45,50,55} }, --Rough Gemstone Cluster
		{ id=41007, skill={35,55,62,70} }, --Inlaid Copper Ring
		{ id=41009, skill={45,60,67,75} }, --Copper Staff
		{ id=41011, skill={50,70,75,80} }, --Encrusted Copper Bangle
		{ id=41013, skill={50,70,77,85} }, --Lesser Fortification Ring
		{ id=41015, skill={50,70,77,85} }, --Tigercrest Ring
		{ id=41231, skill={50,70,80,90} }, --Minor Trollblood Ring
		{ id=41017, skill={55,75,82,90} }, --Small Pearlstone Staff
		{ id=41019, skill={60,80,87,95} }, --Amber Ring
		{ id=41021, skill={60,80,87,95} }, --Azure Ring
		{ id=41023, skill={65,85,92,100} }, --Bright Copper Necklace
		{ id=41025, skill={65,85,92,100} }, --Softglow Ring
		{ id=41247, skill={65,85,92,100} }, --Small Pearl Ring
		{ id=41027, skill={70,90,95,100} }, --Topaz Studded Ring
		{ id=41029, skill={70,90,95,100} }, --Coarse Gritted Paper
		{ id=41560, skill={75,95,105,115} }, --Ebon Ring
	},

	JewelcraftingJourneyman = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41033, skill={80,100,110,120} }, --Lavish Gemmed Necklace
		{ id=41321, skill={80,100,110,120} }, --Gleaming Chain
		{ id=41035, skill={80,105,115,125} }, --Amberstone Pendant
		{ id=41587, skill={80,160,170,180} }, --Gloomweed Bindings
		{ id=41334, skill={80,100,110,120} }, --Shining Copper Cuffs
		{ id=41037, skill={85,105,115,125} }, --Deepmist Choker
		{ id=41562, skill={85,105,115,125} }, --The King's Conviction
		{ id=41732, skill={85,105,115,125} }, --Shadowmoon Orb
		{ id=41746, skill={85,105,115,125} }, --Shadowforged Eye
		{ id=41039, skill={90,100,107,115} }, --Rough Bronze Ring
		{ id=41041, skill={90,105,112,120} }, --Shimmering Bronze Ring
		{ id=41043, skill={95,110,120,130} }, --Amber Orb
		{ id=41045, skill={100,120,130,140} }, --Encrusted Bronze Staff
		{ id=41047, skill={100,120,130,140} }, --Earthrock Loop
		{ id=41564, skill={100,120,130,140} }, --Shadowfall Jewel
		{ id=41581, skill={100,120,130,140} }, --Serpent's Coil Staff
		{ id=41323, skill={100,125,135,145} }, --Talisman of Stone
		{ id=41049, skill={105,120,132,145} }, --Bronze Cuffed Bangles
		{ id=41051, skill={105,125,135,145} }, --Shadowgem Band
		{ id=41726, skill={105,125,135,145} }, --Hydrathorn Bracers
		{ id=41740, skill={105,135,145,155} }, --Mistwood Tiara
		{ id=41053, skill={110,130,140,150} }, --Bronze Scepter
		{ id=41325, skill={110,130,140,150} }, --Medallion of Flame
		{ id=41566, skill={115,120,130,140} }, --Ocean's Wrath
		{ id=41337, skill={115,135,142,150} }, --Dawnbright Cuffs
		{ id=41734, skill={120,140,150,160} }, --Fangclaw Relic
		{ id=41055, skill={120,145,155,165} }, --Pendant of Midnight
		{ id=41067, skill={125,135,145,155} }, --Rough Silver Ring
		{ id=41065, skill={125,140,142,145} }, --Coarse Gemstone Cluster
		{ id=41057, skill={125,145,155,165} }, --Agatestone Crown
	},

	JewelcraftingJourneyman2 = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41061, skill={125,145,155,165} }, --Binding Signet
		{ id=41063, skill={125,145,155,165} }, --Enchanted Bracelets
		{ id=41776, skill={125,145,155,165} }, --Ring of Midnight
		{ id=41059, skill={125,150,160,170} }, --Moonlight Staff
		{ id=41568, skill={130,150,160,170} }, --Dazzling Moonstone Band
		{ id=41760, skill={135,135,137,140} }, --Graceful Agate Gemstone
		{ id=41069, skill={135,150,160,170} }, --Silver Medallion
		{ id=41071, skill={135,155,165,175} }, --Ring of Purified Silver
		{ id=41327, skill={135,155,165,175} }, --Gleaming Silver Necklace
		{ id=41339, skill={135,155,165,175} }, --Circlet of Dampening
		{ id=41748, skill={135,155,165,175} }, --Totem of Self Preservation
		{ id=41583, skill={140,160,170,180} }, --Farraki Ceremony Totem
		{ id=41728, skill={140,160,170,180} }, --Blackrock Ironclamps
		{ id=41570, skill={145,165,175,185} }, --Harpy Talon Ring
		{ id=41742, skill={145,165,175,185} }, --Venomspire Diadem
		{ id=41201, skill={150,150,155,160} }, --Heavy Gritted Paper
		{ id=41203, skill={150,150,152,155} }, --Heavy Gemstone Cluster
		{ id=41627, skill={150,155,157,160} }, --Pristine Crystal Gemstone
		{ id=41607, skill={150,155,157,160} }, --Shimmering Aqua Gemstone
		{ id=41081, skill={150,165,170,175} }, --Rough Iron Ring
		{ id=41083, skill={150,165,170,175} }, --Rough Gold Ring
	},

	JewelcraftingExpert = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41205, skill={155,155,160,165} }, --Goldfire Crystal Bracelet
		{ id=41207, skill={155,175,185,195} }, --Quartz Halo
		{ id=41275, skill={160,160,180,200} }, --Gemmed Citrine Pendant
		{ id=41572, skill={160,180,190,200} }, --Centaur Hoof Circlet
		{ id=41331, skill={160,180,190,200} }, --Gem Encrusted Choker
		{ id=41736, skill={160,180,190,200} }, --Netherbane Rod
		{ id=41329, skill={160,185,195,205} }, --Ring of The Turtle
		{ id=41283, skill={1,175,192,210} }, --Astral Amulet
		{ id=41209, skill={165,185,195,205} }, --Staff of Blossomed Jade
		{ id=41333, skill={170,180,190,200} }, --Goldcrest Amulet
		{ id=41730, skill={170,185,195,205} }, --Monastery Emberbrace
		{ id=41211, skill={170,190,197,205} }, --Jade Harmony Circlet
		{ id=41585, skill={170,190,200,210} }, --Sphinx's Wisdom Staff
		{ id=41574, skill={170,200,210,220} }, --Ogre Bone Band
		{ id=41219, skill={175,175,177,180} }, --Rough Mithril Ring
		{ id=41629, skill={175,180,182,185} }, --Gleaming Jade Gemstone
		{ id=41623, skill={175,180,182,185} }, --Pure Shining Moonstone
		{ id=41752, skill={175,190,197,205} }, --Obsidian Brooch
		{ id=41213, skill={175,195,202,210} }, --Goldenshade Quartz Crown
		{ id=41215, skill={175,195,202,210} }, --The Golden Goblet
		{ id=41217, skill={175,195,202,210} }, --Powerful Citrine Pendant
		{ id=41556, skill={180,200,210,220} }, --Delicate Mithril Amulet
		{ id=41221, skill={185,200,210,220} }, --Ironsun Citrine Ring
		{ id=41750, skill={185,200,207,215} }, --Facetted Moonstone Brooch
		{ id=41589, skill={185,205,215,225} }, --Crystal Earring
		{ id=41263, skill={190,190,210,230} }, --Ocean's Gaze
		{ id=41223, skill={190,205,215,225} }, --Shimmering Gold Necklace
		{ id=41225, skill={190,205,215,225} }, --Ironbloom Ring
		{ id=41541, skill={190,210,220,230} }, --Dazzling Aquamarine Loop
		{ id=41579, skill={190,210,220,230} }, --Marine's Demise
	},

	JewelcraftingExpert2 = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41285, skill={195,195,217,240} }, --Shimmering Moonstone Tablet
		{ id=41229, skill={200,200,205,210} }, --Solid Gritted Paper
		{ id=41233, skill={200,200,205,210} }, --Rough Truesilver Ring
		{ id=41237, skill={200,200,205,210} }, --Solid Gemstone Cluster
		{ id=41601, skill={200,205,207,210} }, --Sharpened Citrine Gemstone
		{ id=41603, skill={200,205,207,210} }, --Radiant Ember Gemstone
		{ id=41605, skill={200,205,207,210} }, --Glowing Ruby Gemstone
		{ id=41631, skill={200,205,205,205} }, --Illuminated Gemstone
		{ id=41738, skill={200,215,225,235} }, --Marine Root
		{ id=41227, skill={200,220,230,240} }, --Ornate Mithril Scepter
		{ id=41546, skill={200,220,230,240} }, --Alluring Citrine Choker
		{ id=41548, skill={200,220,230,240} }, --Elaborate Golden Bracelets
		{ id=41550, skill={200,220,230,240} }, --Heart of the Sea
		{ id=41744, skill={200,220,230,240} }, --Bloodfire Circlet
		{ id=41754, skill={200,220,230,240} }, --Smoldering Brooch
		{ id=41552, skill={200,225,235,245} }, --Staff of Gallitrea
		{ id=41558, skill={200,225,235,245} }, --Draenethyst Baton
		{ id=41718, skill={200,225,237,250} }, --Ornate Mithril Bracelets
		{ id=41756, skill={205,220,227,235} }, --Vitriol Brooch
		{ id=41239, skill={210,230,240,250} }, --Greater Binding Signet
		{ id=41786, skill={210,230,240,250} }, --Ornate Mithril Crown
		{ id=41554, skill={210,235,245,255} }, --Golden Jade Ring
		{ id=41352, skill={210,235,245,255} }, --Opaline Illuminator
		{ id=41307, skill={1,235,245,255} }, --Gemkeeper's Folio
		{ id=41235, skill={215,215,225,235} }, --Aquamarine Pendant
		{ id=41241, skill={215,235,245,255} }, --Royal Gemstone Staff
		{ id=41277, skill={220,220,240,260} }, --Starforge Amulet
		{ id=41243, skill={220,240,250,260} }, --Emberstone Idol
		{ id=41245, skill={220,240,250,260} }, --Runed Truesilver Ring
		{ id=41633, skill={225,225,227,230} }, --Burning Star Gemstone
	},

	JewelcraftingExpert3 = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41085, skill={225,240,247,255} }, --Emberstone Studded Ring
		{ id=41281, skill={230,230,252,275} }, --Runebound Amulet
		{ id=41716, skill={230,260,270,280} }, --Crown of Elegance
		{ id=41784, skill={230,260,275,290} }, --Mana Binding Signet
		{ id=41305, skill={1,260,270,280} }, --Golden Scepter of Authority
		{ id=41635, skill={235,235,237,240} }, --Brilliant Opal Gemstone
		{ id=41770, skill={235,240,240,240} }, --Dense Gemstone Cluster
		{ id=41087, skill={235,245,250,255} }, --Rough Thorium Ring
		{ id=41720, skill={240,260,275,290} }, --Regal Twilight Staff
		{ id=41724, skill={245,245,265,285} }, --Ornament of Restraint
		{ id=41089, skill={245,265,275,285} }, --Mithril Blackstone Necklace
		{ id=41261, skill={250,250,270,290} }, --Sunburst Tiara
		{ id=41091, skill={250,260,265,270} }, --Dense Gritted Paper
		{ id=41714, skill={250,280,290,300} }, --Opal Guided Bangles
		{ id=41637, skill={1,250,252,255} }, --Elegant Emerald Gemstone
		{ id=41639, skill={1,250,252,255} }, --Shining Sapphire Gemstone
	},

	JewelcraftingArtisan = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41093, skill={255,270,277,285} }, --Radiant Thorium Twilight
		{ id=41348, skill={255,275,285,295} }, --Crystalfire Armlets
		{ id=41265, skill={260,260,275,290} }, --Starry Thorium Band
		{ id=41611, skill={260,265,267,270} }, --Gloomy Diamond Gemstone
		{ id=41095, skill={260,280,287,295} }, --Glyph Codex
		{ id=41350, skill={260,280,290,300} }, --Cinderfall Band
		{ id=41251, skill={265,265,285,305} }, --Blue Starfire
		{ id=41273, skill={265,265,285,305} }, --Prism Amulet
		{ id=41774, skill={265,275,285,295} }, --Spellweaver Pendant
		{ id=41097, skill={265,285,292,300} }, --Spellweaver Rod
		{ id=41099, skill={265,285,292,300} }, --Quicksilver Whirl
		{ id=41762, skill={270,270,272,275} }, --Dreary Opal Gemstone
		{ id=41311, skill={270,270,280,290} }, --Stellar Gemguards
		{ id=41315, skill={275,275,285,295} }, --Moonlit Charm
		{ id=41641, skill={275,275,277,280} }, --Unstable Arcane Gemstone
		{ id=41356, skill={275,275,297,320} }, --Gemstone Compendium
		{ id=41279, skill={280,280,300,320} }, --Voidheart Charm
		{ id=41101, skill={280,285,297,310} }, --Crystalweft Bracers
		{ id=41103, skill={280,285,297,310} }, --Ethereal Frostspark Crown
		{ id=41105, skill={280,300,305,310} }, --Pendant of Arcane Radiance
		{ id=41794, skill={285,320,330,340} }, --Orb of Clairvoyance
		{ id=41313, skill={290,290,300,310} }, --Garnet Guardian Staff
		{ id=41643, skill={290,290,292,295} }, --Glittering Sapphire Gemstone
		{ id=41309, skill={300,300,310,320} }, --Stellar Ruby Ring
		{ id=41287, skill={290,310,325,340} }, --Stormcloud Sigil
		{ id=41708, skill={290,320,330,340} }, --Opalstone Circle
		{ id=41712, skill={290,320,330,340} }, --Dark Iron Signet Ring
		{ id=41271, skill={295,295,305,315} }, --Pure Gold Ring
		{ id=41253, skill={300,320,330,340} }, --Emerald Monarch's Glow
	},

	JewelcraftingArtisan2 = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41259, skill={300,320,330,340} }, --Arcanum Baton
		{ id=41722, skill={300,300,307,315} }, --Pendant of Instability
		{ id=41700, skill={300,320,330,340} }, --Embergem Cuffs
		{ id=41706, skill={300,320,330,340} }, --Mastercrafted Diamond Crown
		{ id=41764, skill={300,320,330,340} }, --Resurged Topaz Gemstone
		{ id=41768, skill={300,320,330,340} }, --Resilient Arcane Gemstone
		{ id=41798, skill={300,320,325,330} }, --Guardbreaker Charm
		{ id=41804, skill={300,320,330,340} }, --Bindings of Luminance
		{ id=41806, skill={300,320,330,340} }, --Crown of the Illustrious Queen
		{ id=41802, skill={300,325,335,345} }, --Spire of Channeled Power
		{ id=41808, skill={300,325,332,340} }, --Mastercrafted Diamond Bangles
		{ id=41778, skill={300,310,320,330} }, --Stormcloud Shackles
		{ id=41303, skill={300,315,322,330} }, --Massive Jewel Circlet
		{ id=41317, skill={300,320,330,340} }, --Twilight Opal Cascade
	},

	JewelcraftingGemology = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41621, skill={250,255,257,260} }, --Enchanted Emerald Gemstone
		{ id=41625, skill={270,275,277,280} }, --Beautiful Diamond Gemstone
		{ id=41609, skill={275,280,282,285} }, --Azerothian Ruby Gemstone
		{ id=41617, skill={275,280,282,285} }, --Tempered Azerothian Gemstone
		{ id=41613, skill={285,290,292,295} }, --Flawless Black Gemstone
		{ id=41615, skill={295,300,302,305} }, --Arcane Emerald Gemstone
		{ id=41619, skill={300,310,315,320} }, --Stunning Imperial Gemstone
		{ id=41821, skill={300,330,345,360} }, --Gorgeous Mountain Gemstone
	},

	JewelcraftingGoldsmithing = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41782, skill={285,310,320,330} }, --Golden Runed Ring
		{ id=41780, skill={290,310,320,330} }, --Stormcloud Signet
		{ id=41710, skill={290,320,330,340} }, --Deep Sapphire Circlet
		{ id=41790, skill={290,320,330,340} }, --Ring of Unleashed Potential
		{ id=41255, skill={300,320,330,340} }, --Sapphire Luminescence
		{ id=41696, skill={300,320,330,340} }, --Shimmering Diamond Band
		{ id=41698, skill={300,320,330,340} }, --Crown of Molten Ascension
		{ id=41702, skill={300,320,330,340} }, --Blackwing Signet of Command
		{ id=41704, skill={300,320,330,340} }, --Talisman of Hinderance
		{ id=41788, skill={300,320,330,340} }, --Blazefury Circlet
		{ id=41267, skill={300,330,350,370} }, --Ruby Ring of Ruin
		{ id=41269, skill={300,330,350,370} }, --Encrusted Gemstone Ring
		{ id=41792, skill={300,330,340,350} }, --Empowered Domination Rod
		{ id=41796, skill={300,330,340,350} }, --Grail of Forgotten Memories
		{ id=41800, skill={300,330,340,350} }, --Rudeus' Focusing Cane
	},

	JewelcraftingGemstones = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41760, skill={135,135,137,140} }, --Graceful Agate Gemstone
		{ id=41627, skill={150,155,157,160} }, --Pristine Crystal Gemstone
		{ id=41607, skill={150,155,157,160} }, --Shimmering Aqua Gemstone
		{ id=41629, skill={175,180,182,185} }, --Gleaming Jade Gemstone
		{ id=41601, skill={200,205,207,210} }, --Sharpened Citrine Gemstone
		{ id=41603, skill={200,205,207,210} }, --Radiant Ember Gemstone
		{ id=41605, skill={200,205,207,210} }, --Glowing Ruby Gemstone
		{ id=41631, skill={200,205,205,205} }, --Illuminated Gemstone
		{ id=41633, skill={225,225,227,230} }, --Burning Star Gemstone
		{ id=41635, skill={235,235,237,240} }, --Brilliant Opal Gemstone
		{ id=41637, skill={1,250,252,255} }, --Elegant Emerald Gemstone
		{ id=41639, skill={1,250,252,255} }, --Shining Sapphire Gemstone
		{ id=41611, skill={260,265,267,270} }, --Gloomy Diamond Gemstone
		{ id=41762, skill={270,270,272,275} }, --Dreary Opal Gemstone
		{ id=41625, skill={270,275,277,280} }, --Beautiful Diamond Gemstone
		{ id=41641, skill={1,275,277,280} }, --Unstable Arcane Gemstone
		{ id=41643, skill={1,290,292,295} }, --Glittering Sapphire Gemstone
		{ id=41764, skill={300,320,330,340} }, --Resurged Topaz Gemstone
		{ id=41768, skill={300,320,330,340} }, --Resilient Arcane Gemstone
		{ id=41621, skill={250,255,257,260} }, --Enchanted Emerald Gemstone
		{ id=41609, skill={275,280,282,285} }, --Azerothian Ruby Gemstone
		{ id=41617, skill={275,280,282,285} }, --Tempered Azerothian Gemstone
		{ id=41613, skill={285,290,292,295} }, --Flawless Black Gemstone
		{ id=41615, skill={295,300,302,305} }, --Arcane Emerald Gemstone
		{ id=41619, skill={300,310,315,320} }, --Stunning Imperial Gemstone
		{ id=41821, skill={300,330,345,360} }, --Gorgeous Mountain Gemstone
	},

	JewelcraftingRings = {
		{ name = L["Rings"], icon = "Trade_Jewelcrafting" },
		{ id=41001, skill={15,35,45,55} }, --Bright Copper Ring
		{ id=41003, skill={20,40,47,55} }, --Malachite Ring
		{ id=41249, skill={25,25,45,65} }, --Bulky Copper Ring
		{ id=41005, skill={25,45,52,60} }, --Sturdy Copper Ring
		{ id=41007, skill={35,55,62,70} }, --Inlaid Copper Ring
		{ id=41013, skill={50,70,77,85} }, --Lesser Fortification Ring
		{ id=41015, skill={50,70,77,85} }, --Tigercrest Ring
		{ id=41231, skill={50,70,80,90} }, --Minor Trollblood Ring
		{ id=41019, skill={60,80,87,95} }, --Amber Ring
		{ id=41021, skill={60,80,87,95} }, --Azure Ring
		{ id=41025, skill={65,85,92,100} }, --Softglow Ring
		{ id=41027, skill={70,90,95,100} }, --Topaz Studded Ring
		{ id=41560, skill={75,95,105,115} }, --Ebon Ring
		{ id=41562, skill={85,105,115,125} }, --The King's Conviction
		{ id=41041, skill={90,105,112,120} }, --Shimmering Bronze Ring
		{ id=41047, skill={100,120,130,140} }, --Earthrock Loop
		{ id=41564, skill={100,120,130,140} }, --Shadowfall Jewel
		{ id=41566, skill={115,120,130,140} }, --Ocean's Wrath
		{ id=41776, skill={125,145,155,165} }, --Ring of Midnight
		{ id=41568, skill={130,150,160,170} }, --Dazzling Moonstone Band
		{ id=41071, skill={135,155,165,175} }, --Ring of Purified Silver
		{ id=41570, skill={145,165,175,185} }, --Harpy Talon Ring
		{ id=41207, skill={155,175,185,195} }, --Quartz Halo
		{ id=41572, skill={160,180,190,200} }, --Centaur Hoof Circlet
		{ id=41211, skill={170,190,197,205} }, --Jade Harmony Circlet
		{ id=41574, skill={170,200,210,220} }, --Ogre Bone Band
		{ id=41221, skill={185,200,210,220} }, --Ironsun Citrine Ring
		{ id=41589, skill={185,205,215,225} }, --Crystal Earring
		{ id=41263, skill={190,190,210,230} }, --Ocean's Gaze
		{ id=41225, skill={190,205,215,225} }, --Ironbloom Ring
	},

	JewelcraftingRings2 = {
		{ name = L["Rings"], icon = "Trade_Jewelcrafting" },
		{ id=41541, skill={190,210,220,230} }, --Dazzling Aquamarine Loop
		{ id=41579, skill={190,210,220,230} }, --Marine's Demise
		{ id=41744, skill={200,220,230,240} }, --Bloodfire Circlet
		{ id=41554, skill={210,235,245,255} }, --Golden Jade Ring
		{ id=41085, skill={225,240,247,255} }, --Emberstone Studded Ring
		{ id=41784, skill={230,260,275,290} }, --Mana Binding Signet
		{ id=41093, skill={255,270,277,285} }, --Radiant Thorium Twilight
		{ id=41265, skill={260,260,275,290} }, --Starry Thorium Band
		{ id=41350, skill={260,280,290,300} }, --Cinderfall Band
		{ id=41251, skill={265,265,285,305} }, --Blue Starfire
		{ id=41708, skill={290,320,330,340} }, --Opalstone Circle
		{ id=41253, skill={300,320,330,340} }, --Emerald Monarch's Glow
		{ id=41303, skill={1,315,322,330} }, --Massive Jewel Circlet
		{ id=41317, skill={1,320,330,340} }, --Twilight Opal Cascade
		{ id=41782, skill={285,310,320,330} }, --Golden Runed Ring
		{ id=41780, skill={290,310,320,330} }, --Stormcloud Signet
		{ id=41710, skill={290,320,330,340} }, --Deep Sapphire Circlet
		{ id=41790, skill={290,320,330,340} }, --Ring of Unleashed Potential
		{ id=41255, skill={300,320,330,340} }, --Sapphire Luminescence
		{ id=41696, skill={300,320,330,340} }, --Shimmering Diamond Band
		{ id=41702, skill={300,320,330,340} }, --Blackwing Signet of Command
		{ id=41788, skill={300,320,330,340} }, --Blazefury Circlet
		{ id=41267, skill={300,330,350,370} }, --Ruby Ring of Ruin
		{ id=41269, skill={300,330,350,370} }, --Encrusted Gemstone Ring
	},

	JewelcraftingAmulets = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41023, skill={65,85,92,100} }, --Bright Copper Necklace
		{ id=41033, skill={80,100,110,120} }, --Lavish Gemmed Necklace
		{ id=41321, skill={80,100,110,120} }, --Gleaming Chain
		{ id=41035, skill={80,105,115,125} }, --Amberstone Pendant
		{ id=41037, skill={85,105,115,125} }, --Deepmist Choker
		{ id=41323, skill={100,125,135,145} }, --Talisman of Stone
		{ id=41325, skill={110,130,140,150} }, --Medallion of Flame
		{ id=41055, skill={120,145,155,165} }, --Pendant of Midnight
		{ id=41327, skill={135,155,165,175} }, --Gleaming Silver Necklace
		{ id=41275, skill={160,160,180,200} }, --Gemmed Citrine Pendant
		{ id=41331, skill={160,180,190,200} }, --Gem Encrusted Choker
		{ id=41283, skill={1,175,192,210} }, --Astral Amulet
		{ id=41333, skill={170,180,190,200} }, --Goldcrest Amulet
		{ id=41217, skill={175,195,202,210} }, --Powerful Citrine Pendant
		{ id=41556, skill={180,200,210,220} }, --Delicate Mithril Amulet
		{ id=41223, skill={190,205,215,225} }, --Shimmering Gold Necklace
		{ id=41546, skill={200,220,230,240} }, --Alluring Citrine Choker
		{ id=41235, skill={215,215,225,235} }, --Aquamarine Pendant
		{ id=41277, skill={220,220,240,260} }, --Starforge Amulet
		{ id=41281, skill={230,230,252,275} }, --Runebound Amulet
		{ id=41089, skill={245,265,275,285} }, --Mithril Blackstone Necklace
		{ id=41273, skill={265,265,285,305} }, --Prism Amulet
		{ id=41774, skill={265,275,285,295} }, --Spellweaver Pendant
		{ id=41315, skill={1,275,285,295} }, --Moonlit Charm
		{ id=41279, skill={280,280,300,320} }, --Voidheart Charm
		{ id=41105, skill={280,300,305,310} }, --Pendant of Arcane Radiance
		{ id=41287, skill={290,310,325,340} }, --Stormcloud Sigil
		{ id=41722, skill={300,300,307,315} }, --Pendant of Instability
		{ id=41704, skill={300,320,330,340} }, --Talisman of Hinderance
	},

	JewelcraftingHelm = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41740, skill={105,135,145,155} }, --Mistwood Tiara
		{ id=41057, skill={125,145,155,165} }, --Agatestone Crown
		{ id=41339, skill={135,155,165,175} }, --Circlet of Dampening
		{ id=41742, skill={145,165,175,185} }, --Venomspire Diadem
		{ id=41213, skill={175,195,202,210} }, --Goldenshade Quartz Crown
		{ id=41744, skill={200,220,230,240} }, --Bloodfire Circlet
		{ id=41786, skill={210,230,240,250} }, --Ornate Mithril Crown
		{ id=41716, skill={230,260,270,280} }, --Crown of Elegance
		{ id=41261, skill={250,250,270,290} }, --Sunburst Tiara
		{ id=41103, skill={280,285,297,310} }, --Ethereal Frostspark Crown
		{ id=41806, skill={300,320,330,340} }, --Crown of the Illustrious Queen
		{ id=41706, skill={300,320,330,340} }, --Mastercrafted Diamond Crown
		{ id=41698, skill={300,320,330,340} }, --Crown of Molten Ascension
	},

	JewelcraftingBracers = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=29732, skill={1,21,33,45} }, --Copper Bangle
		{ id=41011, skill={50,70,75,80} }, --Encrusted Copper Bangle
		{ id=41587, skill={80,160,170,180} }, --Gloomweed Bindings
		{ id=41049, skill={105,120,132,145} }, --Bronze Cuffed Bangles
		{ id=41726, skill={105,125,135,145} }, --Hydrathorn Bracers
		{ id=41337, skill={115,135,142,150} }, --Dawnbright Cuffs
		{ id=41063, skill={125,145,155,165} }, --Enchanted Bracelets
		{ id=41728, skill={140,160,170,180} }, --Blackrock Ironclamps
		{ id=41205, skill={155,155,160,165} }, --Goldfire Crystal Bracelet
		{ id=41730, skill={170,185,195,205} }, --Monastery Emberbrace
		{ id=41548, skill={200,220,230,240} }, --Elaborate Golden Bracelets
		{ id=41718, skill={200,225,237,250} }, --Ornate Mithril Bracelets
		{ id=41714, skill={250,280,290,300} }, --Opal Guided Bangles
		{ id=41348, skill={255,275,285,295} }, --Crystalfire Armlets
		{ id=41311, skill={1,270,280,290} }, --Stellar Gemguards
		{ id=41101, skill={280,285,297,310} }, --Crystalweft Bracers
		{ id=41804, skill={300,320,330,340} }, --Bindings of Luminance
		{ id=41778, skill={1,310,320,330} }, --Stormcloud Shackles
		{ id=41700, skill={300,320,330,340} }, --Embergem Cuffs
		{ id=41808, skill={300,325,332,340} }, --Mastercrafted Diamond Bangles
	},

	JewelcraftingOffHands = {
		{ name = L["Jewelcrafting"], icon = "Trade_Jewelcrafting" },
		{ id=41732, skill={85,105,115,125} }, --Shadowmoon Orb
		{ id=41043, skill={95,110,120,130} }, --Amber Orb
		{ id=41053, skill={110,130,140,150} }, --Bronze Scepter
		{ id=41734, skill={120,140,150,160} }, --Fangclaw Relic
		{ id=41736, skill={160,180,190,200} }, --Netherbane Rod
		{ id=41738, skill={200,215,225,235} }, --Marine Root
		{ id=41227, skill={200,220,230,240} }, --Ornate Mithril Scepter
		{ id=41550, skill={200,220,230,240} }, --Heart of the Sea
		{ id=41558, skill={200,225,235,245} }, --Draenethyst Baton
		{ id=41307, skill={1,235,245,255} }, --Gemkeeper's Folio
		{ id=41243, skill={220,240,250,260} }, --Emberstone Idol
		{ id=41305, skill={1,260,270,280} }, --Golden Scepter of Authority
		{ id=41095, skill={260,280,287,295} }, --Glyph Codex
		{ id=41356, skill={275,275,297,320} }, --Gemstone Compendium
		{ id=41794, skill={285,320,330,340} }, --Orb of Clairvoyance
		{ id=41792, skill={300,330,340,350} }, --Empowered Domination Rod
	},

	JewelcraftingStaves = {
		{ name = L["Staves"], icon = "Trade_Jewelcrafting" },
		{ id=41009, skill={45,60,67,75} }, --Copper Staff
		{ id=41017, skill={55,75,82,90} }, --Small Pearlstone Staff
		{ id=41045, skill={100,120,130,140} }, --Encrusted Bronze Staff
		{ id=41581, skill={100,120,130,140} }, --Serpent's Coil Staff
		{ id=41059, skill={125,150,160,170} }, --Moonlight Staff
		{ id=41583, skill={140,160,170,180} }, --Farraki Ceremony Totem
		{ id=41209, skill={165,185,195,205} }, --Staff of Blossomed Jade
		{ id=41585, skill={170,190,200,210} }, --Sphinx's Wisdom Staff
		{ id=41552, skill={200,225,235,245} }, --Staff of Gallitrea
		{ id=41352, skill={210,235,245,255} }, --Opaline Illuminator
		{ id=41241, skill={215,235,245,255} }, --Royal Gemstone Staff
		{ id=41720, skill={240,260,275,290} }, --Regal Twilight Staff
		{ id=41097, skill={265,285,292,300} }, --Spellweaver Rod
		{ id=41313, skill={1,290,300,310} }, --Garnet Guardian Staff
		{ id=41259, skill={300,320,330,340} }, --Arcanum Baton
		{ id=41802, skill={300,325,335,345} }, --Spire of Channeled Power
		{ id=41800, skill={300,330,340,350} }, --Rudeus' Focusing Cane
	},

	JewelcraftingTrinkets = {
		{ name = L["Trinkets"], icon = "Trade_Jewelcrafting" },
		{ id=41746, skill={85,105,115,125} }, --Shadowforged Eye
		{ id=41069, skill={135,150,160,170} }, --Silver Medallion
		{ id=41748, skill={135,155,165,175} }, --Totem of Self Preservation
		{ id=41752, skill={175,190,197,205} }, --Obsidian Brooch
		{ id=41215, skill={175,195,202,210} }, --The Golden Goblet
		{ id=41285, skill={195,195,217,240} }, --Shimmering Moonstone Tablet
		{ id=41754, skill={200,220,230,240} }, --Smoldering Brooch
		{ id=41756, skill={205,220,227,235} }, --Vitriol Brooch
		{ id=41243, skill={220,240,250,260} }, --Emberstone Idol
		{ id=41724, skill={245,245,265,285} }, --Ornament of Restraint
		{ id=41099, skill={265,285,292,300} }, --Quicksilver Whirl
		{ id=41287, skill={290,310,325,340} }, --Stormcloud Sigil
		{ id=41798, skill={300,320,325,330} }, --Guardbreaker Charm
		{ id=41796, skill={300,330,340,350} }, --Grail of Forgotten Memories
	},

	JewelcraftingMisc = {
		{ name = L["Miscellaneous"], icon = "Trade_Jewelcrafting" },
		{ id=29730, skill={1,21,30,40} }, --Rough Copper Ring
		{ id=41039, skill={90,100,107,115} }, --Rough Bronze Ring
		{ id=41067, skill={125,135,145,155} }, --Rough Silver Ring
		{ id=41081, skill={150,165,170,175} }, --Rough Iron Ring
		{ id=41083, skill={150,165,170,175} }, --Rough Gold Ring
		{ id=41219, skill={175,175,177,180} }, --Rough Mithril Ring
		{ id=41233, skill={200,200,205,210} }, --Rough Truesilver Ring
		{ id=41087, skill={235,245,250,255} }, --Rough Thorium Ring
		{ id=41271, skill={1,325,335,345} }, --Pure Gold Ring
		{ id=29728, skill={1,21,25,30} }, --Rough Gritted Paper
		{ id=41029, skill={70,90,95,100} }, --Coarse Gritted Paper
		{ id=41201, skill={150,150,155,160} }, --Heavy Gritted Paper
		{ id=41229, skill={200,200,205,210} }, --Solid Gritted Paper
		{ id=41091, skill={250,260,265,270} }, --Dense Gritted Paper
		{ id=41031, skill={35,45,50,55} }, --Rough Gemstone Cluster
		{ id=41065, skill={125,140,142,145} }, --Coarse Gemstone Cluster
		{ id=41203, skill={150,150,152,155} }, --Heavy Gemstone Cluster
		{ id=41237, skill={200,200,205,210} }, --Solid Gemstone Cluster
		{ id=41770, skill={235,240,240,240} }, --Dense Gemstone Cluster
	},
--[[ 	AlchemyApprentice1 = {
		{ "s2329", "inv_potion_56", "=q1=Elixir of Lion's Strength", "=ds=#sr# =so1=1 =so2=55 =so3=75 =so4=95" },
		{ "s7183", "inv_potion_63", "=q1=Elixir of Minor Defense", "=ds=#sr# =so1=1 =so2=55 =so3=75 =so4=95" },
		{ "s2330", "inv_potion_49", "=q1=Minor Healing Potion", "=ds=#sr# =so1=1 =so2=55 =so3=75 =so4=95" },
		{ "s3170", "inv_potion_77", "=q1=Weak Troll's Blood Potion", "=ds=#sr# =so1=15 =so2=60 =so3=80 =so4=100" },
		{ "s2331", "inv_potion_70", "=q1=Minor Mana Potion", "=ds=#sr# =so1=25 =so2=65 =so3=85 =so4=105" },
		{ "s2332", "inv_potion_02", "=q1=Minor Rejuvenation Potion", "=ds=#sr# =so1=40 =so2=70 =so3=90 =so4=110" },
		{ "s4508", "inv_potion_35", "=q1=Discolored Healing Potion", "=ds=#sr# =so1=50 =so2=80 =so3=100 =so4=120" },
		{ "s3230", "inv_potion_91", "=q1=Elixir of Minor Agility", "=ds=#sr# =so1=50 =so2=80 =so3=100 =so4=120" },
		{ "s2334", "inv_potion_42", "=q1=Elixir of Minor Fortitude", "=ds=#sr# =so1=50 =so2=80 =so3=100 =so4=120" },
		{ "s2337", "inv_potion_50", "=q1=Lesser Healing Potion", "=ds=#sr# =so1=55 =so2=85 =so3=105 =so4=125" },
		{ "s6617", "inv_potion_24", "=q1=Rage Potion", "=ds=#sr# =so1=60 =so2=90 =so3=110 =so4=130" },
		{ "s2335", "inv_potion_95", "=q1=Swiftness Potion", "=ds=#sr# =so1=60 =so2=90 =so3=110 =so4=130" },
		{ "s15003", "INV_Drink_17", "=q1=Volatile Concoction", "=ds=#sr# =so1=75 =so2=110 =so3=125 =so4=140" },
	},

	AlchemyJourneyman1 = {
		{ "s7836", "inv_drink_12", "=q1=Blackmouth Oil", "=ds=#sr# =so1=80 =so2=80 =so3=90 =so4=100" },
		{ "s8240", "inv_potion_10", "=q1=Elixir of Giant Growth", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "s7179", "inv_potion_17", "=q1=Elixir of Water Breathing", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "s3171", "inv_potion_06", "=q1=Elixir of Wisdom", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "s7255", "inv_potion_09", "=q1=Holy Protection Potion", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "s7841", "inv_potion_13", "=q1=Swim Speed Potion", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "s3447", "inv_potion_51", "=q1=Healing Potion", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "s3172", "inv_potion_08", "=q1=Minor Magic Resistance Potion", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "s3173", "inv_potion_71", "=q1=Lesser Mana Potion", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "s3174", "inv_potion_12", "=q1=Elixir of Poison Resistance", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "s3176", "inv_potion_78", "=q1=Strong Troll's Blood Potion", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
		{ "s7837", "inv_potion_38", "=q1=Fire Oil", "=ds=#sr# =so1=130 =so2=150 =so3=160 =so4=170" },
		{ "s3177", "inv_potion_64", "=q1=Elixir of Defense", "=ds=#sr# =so1=130 =so2=155 =so3=175 =so4=195" },
		{ "s7256", "inv_potion_44", "=q1=Shadow Protection Potion", "=ds=#sr# =so1=135 =so2=160 =so3=180 =so4=200" },
		{ "s7845", "inv_potion_33", "=q1=Elixir of Firepower", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "s2333", "inv_potion_92", "=q1=Elixir of Lesser Agility", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "s3188", "inv_potion_57", "=q1=Elixir of Ogre's Strength", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "s6624", "inv_potion_04", "=q1=Free Action Potion", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
	},

	AlchemyExpert1 = {
		{ "s7181", "inv_potion_52", "=q1=Greater Healing Potion", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "s3452", "inv_potion_72", "=q1=Mana Potion", "=ds=#sr# =so1=160 =so2=180 =so3=200 =so4=220" },
		{ "s3448", "inv_potion_18", "=q1=Lesser Invisibility Potion", "=ds=#sr# =so1=165 =so2=185 =so3=205 =so4=225" },
		{ "s3449", "inv_potion_23", "=q1=Shadow Oil", "=ds=#sr# =so1=165 =so2=190 =so3=210 =so4=230" },
		{ "s7257", "inv_potion_16", "=q1=Fire Protection Potion", "=ds=#sr# =so1=165 =so2=210 =so3=230 =so4=250" },
		{ "s3450", "inv_potion_43", "=q1=Elixir of Fortitude", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "s6618", "inv_potion_21", "=q1=Great Rage Potion", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "s3451", "inv_potion_79", "=q1=Mighty Troll's Blood Potion", "=ds=#sr# =so1=180 =so2=200 =so3=220 =so4=240" },
		{ "s11449", "inv_potion_93", "=q1=Elixir of Agility", "=ds=#sr# =so1=185 =so2=205 =so3=225 =so4=245" },
		{ "s7258", "inv_potion_13", "=q1=Frost Protection Potion", "=ds=#sr# =so1=190 =so2=205 =so3=225 =so4=245" },
		{ "s21923", "inv_potion_03", "=q1=Elixir of Frost Power", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "s7259", "inv_potion_06", "=q1=Nature Protection Potion", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "s3453", "inv_potion_01", "=q1=Elixir of Detect Lesser Invisibility", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "s11450", "inv_potion_65", "=q1=Elixir of Greater Defense", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "s12609", "inv_potion_36", "=q1=Catseye Elixir", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "s3454", "inv_potion_20", "=q1=Frost Oil", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "s11459", "inv_misc_orb_01", "=q1=Philosopher's Stone", "=ds=#sr# =so1=200 =so2=240 =so3=260 =so4=280" },
		{ "s11448", "inv_potion_73", "=q1=Greater Mana Potion", "=ds=#sr# =so1=205 =so2=220 =so3=240 =so4=260" },
		{ "s11451", "inv_potion_11", "=q1=Oil of Immolation", "=ds=#sr# =so1=205 =so2=220 =so3=240 =so4=260" },
		{ "s11456", "inv_cask_02", "=q1=Goblin Rocket Fuel", "=ds=#sr# =so1=210 =so2=225 =so3=245 =so4=265" },
		{ "s11453", "inv_potion_16", "=q1=Magic Resistance Potion", "=ds=#sr# =so1=210 =so2=225 =so3=245 =so4=265" },
		{ "s11452", "inv_potion_01", "=q1=Restorative Potion", "=ds=#sr# =so1=210 =so2=225 =so3=245 =so4=265" },
		{ "s22808", "inv_potion_05", "=q1=Elixir of Greater Water Breathing", "=ds=#sr# =so1=215 =so2=230 =so3=250 =so4=270"},
		{ "s4942", "inv_potion_67", "=q1=Lesser Stoneshield Potion", "=ds=#sr# =so1=215 =so2=230 =so3=250 =so4=270" },
		{ "s11457", "inv_potion_53", "=q1=Superior Healing Potion", "=ds=#sr# =so1=215 =so2=230 =so3=250 =so4=270" },
		{ "s11458", "inv_potion_34", "=q1=Wildvine Potion", "=ds=#sr# =so1=225 =so2=240 =so3=260 =so4=280" },
		{ "s11479", "inv_ingot_03", "=q2=Transmute: Iron to Gold", "=ds=#sr# =so1=225 =so2=240 =so3=260 =so4=280" },
		{ "s11480", "inv_ingot_08", "=q2=Transmute: Mithril to Truesilver", "=ds=#sr# =so1=225 =so2=240 =so3=260 =so4=280" },
	},

	AlchemyArtisan1 = {
		{ "s15833", "inv_potion_83", "=q1=Dreamless Sleep Potion", "=ds=#sr# =so1=230 =so2=245 =so3=265 =so4=285" },
		{ "s11460", "inv_potion_53", "=q1=Elixir of Detect Undead", "=ds=#sr# =so1=230 =so2=245 =so3=265 =so4=285" },
		{ "s11461", "inv_potion_30", "=q1=Arcane Elixir", "=ds=#sr# =so1=235 =so2=250 =so3=270 =so4=290" },
		{ "s11465", "inv_potion_10", "=q1=Elixir of Greater Intellect", "=ds=#sr# =so1=235 =so2=250 =so3=270 =so4=290" },
		{ "s11464", "inv_potion_25", "=q1=Invisibility Potion", "=ds=#sr# =so1=235 =so2=250 =so3=270 =so4=290" },
		{ "s11468", "inv_potion_14", "=q1=Elixir of Dream Vision", "=ds=#sr# =so1=240 =so2=255 =so3=275 =so4=295" },
		{ "s11467", "inv_potion_94", "=q1=Elixir of Greater Agility", "=ds=#sr# =so1=240 =so2=255 =so3=275 =so4=295" },
		{ "s11466", "inv_potion_28", "=q1=Gift of Arthas", "=ds=#sr# =so1=240 =so2=255 =so3=275 =so4=295" },
		{ "s11473", "inv_poison_mindnumbing", "=q1=Ghost Dye", "=ds=#sr# =so1=245 =so2=260 =so3=280 =so4=300" },
		{ "s11472", "inv_potion_61", "=q1=Elixir of Giants", "=ds=#sr# =so1=245 =so2=260 =so3=280 =so4=300" },
		{ "s17551", "inv_potion_68", "=q1=Stonescale Oil", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "s11477", "inv_potion_27", "=q1=Elixir of Demonslaying", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "s11478", "inv_potion_53", "=q1=Elixir of Detect Demon", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "s26277", "inv_potion_60", "=q1=Elixir of Greater Firepower", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "s11476", "inv_potion_46", "=q1=Elixir of Shadow Power", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "s3175", "inv_potion_62", "=q1=Limited Invulnerability Potion", "=ds=#sr# =so1=250 =so2=275 =so3=295 =so4=315" },
		{ "s17552", "inv_potion_41", "=q1=Mighty Rage Potion", "=ds=#sr# =so1=255 =so2=270 =so3=290 =so4=310" },
		{ "s17553", "inv_potion_74", "=q1=Superior Mana Potion", "=ds=#sr# =so1=260 =so2=275 =so3=295 =so4=315" },
		{ "s17554", "inv_potion_66", "=q1=Elixir of Superior Defense", "=ds=#sr# =so1=265 =so2=280 =so3=300 =so4=320" },
		{ "s17555", "inv_potion_29", "=q1=Elixir of the Sages", "=ds=#sr# =so1=265 =so2=280 =so3=300 =so4=320" },
		{ "s17187", "inv_misc_stonetablet_05", "=q2=Transmute: Arcanite", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17559", "spell_fire_volcano", "=q2=Transmute: Air to Fire", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17566", "spell_nature_abolishmagic", "=q2=Transmute: Earth to Life", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17561", "spell_nature_acid_01", "=q2=Transmute: Earth to Water", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17560", "spell_nature_strengthofearthtotem02", "=q2=Transmute: Fire to Earth", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17565", "spell_nature_strengthofearthtotem02", "=q2=Transmute: Life to Earth", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17563", "spell_nature_acid_01", "=q2=Transmute: Undeath to Water", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17562", "spell_nature_earthbind", "=q2=Transmute: Water to Air", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17564", "spell_shadow_shadetruesight", "=q2=Transmute: Water to Undeath", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17557", "inv_potion_40", "=q1=Elixir of Brute Force", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
	},

	AlchemyArtisan2 = {
		{ "s24366", "inv_potion_83", "=q1=Greater Dreamless Sleep Potion", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
		{ "s24365", "inv_potion_45", "=q1=Mageblood Potion", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
		{ "s17556", "inv_potion_54", "=q1=Major Healing Potion", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
		{ "s17571", "inv_potion_32", "=q1=Elixir of the Mongoose", "=ds=#sr# =so1=280 =so2=295 =so3=315 =so4=335" },
		{ "s17570", "inv_potion_69", "=q1=Greater Stoneshield Potion", "=ds=#sr# =so1=280 =so2=295 =so3=315 =so4=335" },
		{ "s17573", "inv_potion_25", "=q1=Greater Arcane Elixir", "=ds=#sr# =so1=285 =so2=300 =so3=320 =so4=340" },
		{ "s24367", "inv_potion_07", "=q1=Living Action Potion", "=ds=#sr# =so1=285 =so2=300 =so3=320 =so4=340" },
		{ "s17572", "inv_potion_31", "=q1=Purification Potion", "=ds=#sr# =so1=285 =so2=300 =so3=320 =so4=340" },
		{ "s17577", "inv_potion_83", "=q1=Greater Arcane Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17574", "inv_potion_24", "=q1=Greater Fire Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17575", "inv_potion_20", "=q1=Greater Frost Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17576", "inv_potion_22", "=q1=Greater Nature Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17578", "inv_potion_23", "=q1=Greater Shadow Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17579", "inv_potion_09", "=q1=Greater Holy Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s24368", "inv_potion_80", "=q1=Major Troll's Blood Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17580", "inv_potion_76", "=q1=Major Mana Potion", "=ds=#sr# =so1=295 =so2=310 =so3=330 =so4=350" },
		{ "s25146", "spell_fire_fire", "=q1=Transmute: Elemental Fire", "=ds=#sr# =so1=300 =so2=301 =so3=305 =so4=310" },
		{ "s57555", "INV_Ore_Iron_01", "=q1=Transmute: Elemental Earth", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s57557", "INV_Potion_03", "=q1=Transmute: Elemental Water", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s22732", "inv_potion_47", "=q1=Major Rejuvenation Potion", "=ds=#sr# =so1=300 =so2=310 =so3=320 =so4=330" },
		{ "s17638", "inv_potion_48", "=q1=Flask of Chromatic Resistance", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17636", "inv_potion_97", "=q1=Flask of Distilled Wisdom", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17634", "inv_potion_26", "=q1=Flask of Petrification", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17637", "inv_potion_41", "=q1=Flask of Supreme Power", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17635", "inv_potion_62", "=q1=Flask of the Titans", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s24266", "inv_poison_mindnumbing", "=q3=Gurubashi Mojo Madness", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s57131", "INV_Potion_12", "=q1=Dreamshard Elixir", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s57129", "inv_potion_36", "=q1=Lucidity Potion", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s45989", "inv_potion_22", "=q1=Elixir of Greater Nature Power", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s57111", "inv_potion_08", "=q1=Potion of Quickness", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17640", "INV_Misc_Orb_02", "=q4=Alchemist's Stone", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
	},

	AlchemyFlasks1 = {
		{ "s17638", "inv_potion_48", "=q1=Flask of Chromatic Resistance", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17634", "inv_potion_26", "=q1=Flask of Petrification", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17636", "inv_potion_97", "=q1=Flask of Distilled Wisdom", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17637", "inv_potion_41", "=q1=Flask of Supreme Power", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17635", "inv_potion_62", "=q1=Flask of the Titans", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },

	},

	AlchemyProtectionPots1 = {
		{ "s7255", "inv_potion_09", "=q1=Holy Protection Potion", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "s7256", "inv_potion_44", "=q1=Shadow Protection Potion", "=ds=#sr# =so1=135 =so2=160 =so3=180 =so4=200" },
		{ "s7257", "inv_potion_16", "=q1=Fire Protection Potion", "=ds=#sr# =so1=165 =so2=210 =so3=230 =so4=250" },
		{ "s7258", "inv_potion_13", "=q1=Frost Protection Potion", "=ds=#sr# =so1=190 =so2=205 =so3=225 =so4=245" },
		{ "s7259", "inv_potion_06", "=q1=Nature Protection Potion", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "", "", "", ""},
		{ "s17577", "inv_potion_83", "=q1=Greater Arcane Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17574", "inv_potion_24", "=q1=Greater Fire Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17575", "inv_potion_20", "=q1=Greater Frost Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17576", "inv_potion_22", "=q1=Greater Nature Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17578", "inv_potion_23", "=q1=Greater Shadow Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "s17579", "inv_potion_09", "=q1=Greater Holy Protection Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
	},

	AlchemyHealingAndMana1 = {
		{ "s2330", "inv_potion_49", "=q1=Minor Healing Potion", "=ds=#sr# =so1=1 =so2=55 =so3=75 =so4=95" },
		{ "s4508", "inv_potion_35", "=q1=Discolored Healing Potion", "=ds=#sr# =so1=50 =so2=80 =so3=100 =so4=120" },
		{ "s2337", "inv_potion_50", "=q1=Lesser Healing Potion", "=ds=#sr# =so1=55 =so2=85 =so3=105 =so4=125" },
		{ "s3447", "inv_potion_51", "=q1=Healing Potion", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "s7181", "inv_potion_52", "=q1=Greater Healing Potion", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "s11457", "inv_potion_53", "=q1=Superior Healing Potion", "=ds=#sr# =so1=215 =so2=230 =so3=250 =so4=270" },
		{ "s17556", "inv_potion_54", "=q1=Major Healing Potion", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
		{ "", "", "", ""},
		{ "s2331", "inv_potion_70", "=q1=Minor Mana Potion", "=ds=#sr# =so1=25 =so2=65 =so3=85 =so4=105" },
		{ "s3173", "inv_potion_71", "=q1=Lesser Mana Potion", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "s3452", "inv_potion_72", "=q1=Mana Potion", "=ds=#sr# =so1=160 =so2=180 =so3=200 =so4=220" },
		{ "s11448", "inv_potion_73", "=q1=Greater Mana Potion", "=ds=#sr# =so1=205 =so2=220 =so3=240 =so4=260" },
		{ "s17553", "inv_potion_74", "=q1=Superior Mana Potion", "=ds=#sr# =so1=260 =so2=275 =so3=295 =so4=315" },
		{ "s17580", "inv_potion_76", "=q1=Major Mana Potion", "=ds=#sr# =so1=295 =so2=310 =so3=330 =so4=350" },
		{ "", "", "", ""},
		{ "s2332", "inv_potion_02", "=q1=Minor Rejuvenation Potion", "=ds=#sr# =so1=40 =so2=70 =so3=90 =so4=110" },
		{ "s11458", "inv_potion_34", "=q1=Wildvine Potion", "=ds=#sr# =so1=225 =so2=240 =so3=260 =so4=280" },
		{ "s15833", "inv_potion_83", "=q1=Dreamless Sleep Potion", "=ds=#sr# =so1=230 =so2=245 =so3=265 =so4=285" },
		{ "s24366", "inv_potion_83", "=q1=Greater Dreamless Sleep Potion", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
		{ "s22732", "inv_potion_47", "=q1=Major Rejuvenation Potion", "=ds=#sr# =so1=300 =so2=310 =so3=320 =so4=330" },
		{ "", "", "", ""},
		{ "s24365", "inv_potion_45", "=q1=Mageblood Potion", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
	},

	AlchemyTransmutes1 = {
		{ "s11479", "inv_ingot_03", "=q2=Transmute: Iron to Gold", "=ds=#sr# =so1=225 =so2=240 =so3=260 =so4=280" },
		{ "s11480", "inv_ingot_08", "=q2=Transmute: Mithril to Truesilver", "=ds=#sr# =so1=225 =so2=240 =so3=260 =so4=280" },
		{ "s17559", "spell_fire_volcano", "=q2=Transmute: Air to Fire", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17566", "spell_nature_abolishmagic", "=q2=Transmute: Earth to Life", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17561", "spell_nature_acid_01", "=q2=Transmute: Earth to Water", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17560", "spell_nature_strengthofearthtotem02", "=q2=Transmute: Fire to Earth", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17565", "spell_nature_strengthofearthtotem02", "=q2=Transmute: Life to Earth", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17563", "spell_nature_acid_01", "=q2=Transmute: Undeath to Water", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17562", "spell_nature_earthbind", "=q2=Transmute: Water to Air", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17564", "spell_shadow_shadetruesight", "=q2=Transmute: Water to Undeath", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s17187", "inv_misc_stonetablet_05", "=q2=Transmute: Arcanite", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s25146", "spell_fire_fire", "=q1=Transmute: Elemental Fire", "=ds=#sr# =so1=300 =so2=301 =so3=305 =so4=310" },
		{ "s57555", "INV_Ore_Iron_01", "=q1=Transmute: Elemental Earth", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s57557", "INV_Potion_03", "=q1=Transmute: Elemental Water", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
	},

	AlchemyDefensive1 = {
		{ "s7183", "inv_potion_63", "=q1=Elixir of Minor Defense", "=ds=#sr# =so1=1 =so2=55 =so3=75 =so4=95" },
		{ "s3177", "inv_potion_64", "=q1=Elixir of Defense", "=ds=#sr# =so1=130 =so2=155 =so3=175 =so4=195" },
		{ "s11450", "inv_potion_65", "=q1=Elixir of Greater Defense", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "s17554", "inv_potion_66", "=q1=Elixir of Superior Defense", "=ds=#sr# =so1=265 =so2=280 =so3=300 =so4=320" },
		{ "", "", "", ""},
		{ "s3170", "inv_potion_77", "=q1=Weak Troll's Blood Potion", "=ds=#sr# =so1=15 =so2=60 =so3=80 =so4=100" },
		{ "s3176", "inv_potion_78", "=q1=Strong Troll's Blood Potion", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
		{ "s3451", "inv_potion_79", "=q1=Mighty Troll's Blood Potion", "=ds=#sr# =so1=180 =so2=200 =so3=220 =so4=240" },
		{ "s24368", "inv_potion_80", "=q1=Major Troll's Blood Potion", "=ds=#sr# =so1=290 =so2=305 =so3=325 =so4=345" },
		{ "", "", "", ""},
		{ "s2334", "inv_potion_42", "=q1=Elixir of Minor Fortitude", "=ds=#sr# =so1=50 =so2=80 =so3=100 =so4=120" },
		{ "s3450", "inv_potion_43", "=q1=Elixir of Fortitude", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "", "", "", ""},
		{ "s3172", "inv_potion_08", "=q1=Minor Magic Resistance Potion", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "s11453", "inv_potion_16", "=q1=Magic Resistance Potion", "=ds=#sr# =so1=210 =so2=225 =so3=245 =so4=265" },
		{ "s4942", "inv_potion_67", "=q1=Lesser Stoneshield Potion", "=ds=#sr# =so1=215 =so2=230 =so3=250 =so4=270" },
		{ "s17570", "inv_potion_69", "=q1=Greater Stoneshield Potion", "=ds=#sr# =so1=280 =so2=295 =so3=315 =so4=335" },
		{ "", "", "", ""},
		{ "s6624", "inv_potion_04", "=q1=Free Action Potion", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "s57129", "inv_potion_36", "=q1=Lucidity Potion", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s11452", "inv_potion_01", "=q1=Restorative Potion", "=ds=#sr# =so1=210 =so2=225 =so3=245 =so4=265" },
		{ "", "", "", ""},
		{ "s3174", "inv_potion_12", "=q1=Elixir of Poison Resistance", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "s17572", "inv_potion_31", "=q1=Purification Potion", "=ds=#sr# =so1=285 =so2=300 =so3=320 =so4=340" },
		{ "", "", "", ""},
		{ "s3175", "inv_potion_62", "=q1=Limited Invulnerability Potion", "=ds=#sr# =so1=250 =so2=275 =so3=295 =so4=315" },
		{ "s24367", "inv_potion_07", "=q1=Living Action Potion", "=ds=#sr# =so1=285 =so2=300 =so3=320 =so4=340" },
		{ "", "", "", ""},
		{ "s11466", "inv_potion_28", "=q1=Gift of Arthas", "=ds=#sr# =so1=240 =so2=255 =so3=275 =so4=295" },
	},

	AlchemyOffensive1 = {
		{ "s2329", "inv_potion_56", "=q1=Elixir of Lion's Strength", "=ds=#sr# =so1=1 =so2=55 =so3=75 =so4=95" },
		{ "s3188", "inv_potion_57", "=q1=Elixir of Ogre's Strength", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "s8240", "inv_potion_10", "=q1=Elixir of Giant Growth", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "s11472", "inv_potion_61", "=q1=Elixir of Giants", "=ds=#sr# =so1=245 =so2=260 =so3=280 =so4=300" },
		{ "s17557", "inv_potion_40", "=q1=Elixir of Brute Force", "=ds=#sr# =so1=275 =so2=290 =so3=310 =so4=330" },
		{ "", "", "", ""},
		{ "s3230", "inv_potion_91", "=q1=Elixir of Minor Agility", "=ds=#sr# =so1=50 =so2=80 =so3=100 =so4=120" },
		{ "s2333", "inv_potion_92", "=q1=Elixir of Lesser Agility", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "s11449", "inv_potion_93", "=q1=Elixir of Agility", "=ds=#sr# =so1=185 =so2=205 =so3=225 =so4=245" },
		{ "s11467", "inv_potion_94", "=q1=Elixir of Greater Agility", "=ds=#sr# =so1=240 =so2=255 =so3=275 =so4=295" },
		{ "s17571", "inv_potion_32", "=q1=Elixir of the Mongoose", "=ds=#sr# =so1=280 =so2=295 =so3=315 =so4=335" },
		{ "", "", "", ""},
		{ "s6617", "inv_potion_24", "=q1=Rage Potion", "=ds=#sr# =so1=60 =so2=90 =so3=110 =so4=130" },
		{ "s6618", "inv_potion_21", "=q1=Great Rage Potion", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "s17552", "inv_potion_41", "=q1=Mighty Rage Potion", "=ds=#sr# =so1=255 =so2=270 =so3=290 =so4=310" },
		{ "s7845", "inv_potion_33", "=q1=Elixir of Firepower", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "s21923", "inv_potion_03", "=q1=Elixir of Frost Power", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "s11461", "inv_potion_30", "=q1=Arcane Elixir", "=ds=#sr# =so1=235 =so2=250 =so3=270 =so4=290" },
		{ "s26277", "inv_potion_60", "=q1=Elixir of Greater Firepower", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "s11476", "inv_potion_46", "=q1=Elixir of Shadow Power", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "s17573", "inv_potion_25", "=q1=Greater Arcane Elixir", "=ds=#sr# =so1=285 =so2=300 =so3=320 =so4=340" },
		{ "s45989", "inv_potion_22", "=q1=Elixir of Greater Nature Power", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s57131", "INV_Potion_12", "=q1=Dreamshard Elixir", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "", "", "", ""},
		{ "s3171", "inv_potion_06", "=q1=Elixir of Wisdom", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "s11465", "inv_potion_10", "=q1=Elixir of Greater Intellect", "=ds=#sr# =so1=235 =so2=250 =so3=270 =so4=290" },
		{ "s17555", "inv_potion_29", "=q1=Elixir of the Sages", "=ds=#sr# =so1=265 =so2=280 =so3=300 =so4=320" },
		{ "s15003", "INV_Drink_17", "=q1=Volatile Concoction", "=ds=#sr# =so1=75 =so2=110 =so3=125 =so4=140" },
		{ "s11477", "inv_potion_27", "=q1=Elixir of Demonslaying", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "s57111", "inv_potion_08", "=q1=Potion of Quickness", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
	},

	AlchemyOther1 = {
		{ "s7836", "inv_drink_12", "=q1=Blackmouth Oil", "=ds=#sr# =so1=80 =so2=80 =so3=90 =so4=100" },
		{ "s7837", "inv_potion_38", "=q1=Fire Oil", "=ds=#sr# =so1=130 =so2=150 =so3=160 =so4=170" },
		{ "s17551", "inv_potion_68", "=q1=Stonescale Oil", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "", "", "", ""},
		{ "s7179", "inv_potion_17", "=q1=Elixir of Water Breathing", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "s22808", "inv_potion_05", "=q1=Elixir of Greater Water Breathing", "=ds=#sr# =so1=215 =so2=230 =so3=250 =so4=270"},
		{ "", "", "", ""},
		{ "s2335", "inv_potion_95", "=q1=Swiftness Potion", "=ds=#sr# =so1=60 =so2=90 =so3=110 =so4=130" },
		{ "s7841", "inv_potion_13", "=q1=Swim Speed Potion", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "", "", "", ""},
		{ "s3448", "inv_potion_18", "=q1=Lesser Invisibility Potion", "=ds=#sr# =so1=165 =so2=185 =so3=205 =so4=225" },
		{ "s11464", "inv_potion_25", "=q1=Invisibility Potion", "=ds=#sr# =so1=235 =so2=250 =so3=270 =so4=290" },
		{ "", "", "", ""},
		{ "s3453", "inv_potion_01", "=q1=Elixir of Detect Lesser Invisibility", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "s12609", "inv_potion_36", "=q1=Catseye Elixir", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "", "", "", ""},
		{ "s3449", "inv_potion_23", "=q1=Shadow Oil", "=ds=#sr# =so1=165 =so2=190 =so3=210 =so4=230" },
		{ "s3454", "inv_potion_20", "=q1=Frost Oil", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "s11451", "inv_potion_11", "=q1=Oil of Immolation", "=ds=#sr# =so1=205 =so2=220 =so3=240 =so4=260" },
		{ "", "", "", ""},
		{ "s11460", "inv_potion_53", "=q1=Elixir of Detect Undead", "=ds=#sr# =so1=230 =so2=245 =so3=265 =so4=285" },
		{ "s11468", "inv_potion_14", "=q1=Elixir of Dream Vision", "=ds=#sr# =so1=240 =so2=255 =so3=275 =so4=295" },
		{ "s11478", "inv_potion_53", "=q1=Elixir of Detect Demon", "=ds=#sr# =so1=250 =so2=265 =so3=285 =so4=305" },
		{ "", "", "", ""},
		{ "s11459", "inv_misc_orb_01", "=q1=Philosopher's Stone", "=ds=#sr# =so1=200 =so2=240 =so3=260 =so4=280" },
		{ "s11456", "inv_cask_02", "=q1=Goblin Rocket Fuel", "=ds=#sr# =so1=210 =so2=225 =so3=245 =so4=265" },
		{ "s11473", "inv_poison_mindnumbing", "=q1=Ghost Dye", "=ds=#sr# =so1=245 =so2=260 =so3=280 =so4=300" },
		{ "s24266", "inv_poison_mindnumbing", "=q3=Gurubashi Mojo Madness", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
		{ "s17640", "INV_Misc_Orb_02", "=q4=Alchemist's Stone", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },
	},

	EnchantingApprentice1 = {
		{ "e7421", "inv_staff_goldfeathered_01", "=q1=Runed Copper Rod", "=ds=#sr# =so1=1 =so2=5 =so3=7 =so4=10" },
		{ "e7418", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Health", "=ds=#sr# =so1=1 =so2=70 =so3=90 =so4=110" },
		{ "e7428", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Deflect", "=ds=#sr# =so1=1 =so2=80 =so3=100 =so4=120" },
		{ "e14293", "INV_Staff_02", "=q2=Lesser Magic Wand", "=ds=#sr# =so1=10 =so2=75 =so3=95 =so4=115" },
		{ "e7420", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Health", "=ds=#sr# =so1=15 =so2=70 =so3=90 =so4=110" },
		{ "e7443", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Mana", "=ds=#sr# =so1=20 =so2=80 =so3=100 =so4=120" },
		{ "e7426", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Absorption", "=ds=#sr# =so1=40 =so2=90 =so3=110 =so4=130" },
		{ "e25124", "INV_Poison_MindNumbing", "=q1=Minor Wizard Oil", "=ds=#sr# =so1=45 =so2=55 =so3=65 =so4=75" },
		{ "e7454", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Resistance", "=ds=#sr# =so1=45 =so2=95 =so3=115 =so4=135" },
		{ "e7457", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Stamina", "=ds=#sr# =so1=50 =so2=100 =so3=120 =so4=140" },
		{ "e7766", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Spirit", "=ds=#sr# =so1=60 =so2=105 =so3=125 =so4=145" },
		{ "e7748", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Health", "=ds=#sr# =so1=60 =so2=105 =so3=125 =so4=145" },
		{ "e7771", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Protection", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "e14807", "INV_Staff_07", "=q2=Greater Magic Wand", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "e45071", "Spell_Holy_GreaterHeal", "=q2=Enchant 2H Weapon - Minor Intellect", "=ds=#sr# =so1=75 =so2=115 =so3=135 =so4=155" },
	},

	EnchantingJourneyman1 = {
		{ "e7779", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Agility", "=ds=#sr# =so1=80 =so2=115 =so3=135 =so4=155" },
		{ "e7782", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Strength", "=ds=#sr# =so1=80 =so2=115 =so3=135 =so4=155" },
		{ "e7776", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Mana", "=ds=#sr# =so1=80 =so2=115 =so3=135 =so4=155" },
		{ "e7786", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Beastslayer", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "e7788", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Striking", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "e7793", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Intellect", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "e7745", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Minor Impact", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "e7795", "INV_Staff_01", "=q1=Runed Silver Rod", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "e13378", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Minor Stamina", "=ds=#sr# =so1=105 =so2=130 =so3=150 =so4=170" },
		{ "e13380", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Spirit", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "e13419", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Agility", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "e13421", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Protection", "=ds=#sr# =so1=115 =so2=140 =so3=160 =so4=180" },
		{ "e13464", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Protection", "=ds=#sr# =so1=115 =so2=140 =so3=160 =so4=180" },
		{ "e7859", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Spirit", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "e7857", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Health", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "e7867", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Agility", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
		{ "e7863", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Stamina", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
		{ "e7861", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Fire Resistance", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
		{ "e13501", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Stamina", "=ds=#sr# =so1=130 =so2=155 =so3=175 =so4=195" },
		{ "e13485", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Spirit", "=ds=#sr# =so1=130 =so2=155 =so3=175 =so4=195" },
		{ "e13522", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Shadow Resistance", "=ds=#sr# =so1=135 =so2=160 =so3=180 =so4=200" },
		{ "e13536", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Strength", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "e13538", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Absorption", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "e13503", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Striking", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "e13529", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Impact", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13607", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Mana", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13620", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fishing", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13617", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Herbalism", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13612", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Mining", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e25125", "INV_Potion_98", "=q1=Minor Mana Oil", "=ds=#sr# =so1=150 =so2=160 =so3=170 =so4=180" },
	},

	EnchantingJourneyman2 = {
		{ "e13622", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Intellect", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "e13626", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Stats", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "e13628", "INV_Staff_10", "=q1=Runed Golden Rod", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
	},

	EnchantingExpert1 = {
		{ "e13635", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Defense", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "e13631", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Stamina", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "e14809", "INV_Staff_02", "=q2=Lesser Mystic Wand", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "e13637", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Agility", "=ds=#sr# =so1=160 =so2=180 =so3=200 =so4=220" },
		{ "e13640", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Health", "=ds=#sr# =so1=160 =so2=180 =so3=200 =so4=220" },
		{ "e13642", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Spirit", "=ds=#sr# =so1=165 =so2=185 =so3=205 =so4=225" },
		{ "e13644", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Stamina", "=ds=#sr# =so1=170 =so2=190 =so3=210 =so4=230" },
		{ "e13646", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Deflection", "=ds=#sr# =so1=170 =so2=190 =so3=210 =so4=230" },
		{ "e13648", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Stamina", "=ds=#sr# =so1=170 =so2=190 =so3=210 =so4=230" },
		{ "e13657", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Fire Resistance", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "e13653", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Beastslayer", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "e13655", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Elemental Slayer", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "e14810", "INV_Wand_07", "=q2=Greater Mystic Wand", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "e13661", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Strength", "=ds=#sr# =so1=180 =so2=200 =so3=220 =so4=240" },
		{ "e13659", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Spirit", "=ds=#sr# =so1=180 =so2=200 =so3=220 =so4=240" },
		{ "e13663", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Mana", "=ds=#sr# =so1=185 =so2=205 =so3=225 =so4=245" },
		{ "e57146", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Vampirism", "=ds=#sr# =so1=185 =so2=205 =so3=225 =so4=245" },
		{ "e13687", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Spirit", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "e21931", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Winter's Might", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "e13689", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Block", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "e13693", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Striking", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "e25126", "INV_Potion_103", "=q1=Lesser Wizard Oil", "=ds=#sr# =so1=200 =so2=210 =so3=220 =so4=230" },
		{ "e13702", "INV_Staff_11", "=q1=Runed Truesilver Rod", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e13695", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Impact", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e13700", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Stats", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e13698", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Skinning", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e13746", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Defense", "=ds=#sr# =so1=205 =so2=225 =so3=245 =so4=265" },
		{ "e13794", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Resistance", "=ds=#sr# =so1=205 =so2=225 =so3=245 =so4=265" },
		{ "e13822", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Intellect", "=ds=#sr# =so1=210 =so2=230 =so3=250 =so4=270" },
		{ "e13815", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Agility", "=ds=#sr# =so1=210 =so2=230 =so3=250 =so4=270" },
	},

	EnchantingExpert2 = {
		{ "e13817", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Stamina", "=ds=#sr# =so1=210 =so2=230 =so3=250 =so4=270" },
		{ "e13836", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Stamina", "=ds=#sr# =so1=215 =so2=235 =so3=255 =so4=275" },
		{ "e13841", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Mining", "=ds=#sr# =so1=215 =so2=235 =so3=255 =so4=275" },
		{ "e13846", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Spirit", "=ds=#sr# =so1=220 =so2=240 =so3=260 =so4=280" },
		{ "e13858", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Health", "=ds=#sr# =so1=220 =so2=240 =so3=260 =so4=280" },
		{ "e13890", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Speed", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
		{ "e13882", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Agility", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
		{ "e13868", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Herbalism", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
		{ "e13887", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Strength", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
	},

	EnchantingArtisan1 = {
		{ "e13917", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Mana", "=ds=#sr# =so1=230 =so2=250 =so3=270 =so4=290" },
		{ "e13905", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Spirit", "=ds=#sr# =so1=230 =so2=250 =so3=270 =so4=290" },
		{ "e13915", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Demonslaying", "=ds=#sr# =so1=230 =so2=250 =so3=270 =so4=290" },
		{ "e13935", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Agility", "=ds=#sr# =so1=235 =so2=255 =so3=275 =so4=295" },
		{ "e13931", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Deflection", "=ds=#sr# =so1=235 =so2=255 =so3=275 =so4=295" },
		{ "e13933", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Frost Resistance", "=ds=#sr# =so1=235 =so2=255 =so3=275 =so4=295" },
		{ "e13937", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Greater Impact", "=ds=#sr# =so1=240 =so2=260 =so3=280 =so4=300" },
		{ "e13939", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Strength", "=ds=#sr# =so1=240 =so2=260 =so3=280 =so4=300" },
		{ "e13945", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Stamina", "=ds=#sr# =so1=245 =so2=265 =so3=285 =so4=305" },
		{ "e13941", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Stats", "=ds=#sr# =so1=245 =so2=265 =so3=285 =so4=305" },
		{ "e13943", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Greater Striking", "=ds=#sr# =so1=245 =so2=265 =so3=285 =so4=305" },
		{ "e17181", "INV_Misc_Rune_05", "=q1=Enchanted Leather", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "e17180", "INV_Ingot_Eternium", "=q1=Enchanted Thorium", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "e25127", "INV_Potion_99", "=q1=Lesser Mana Oil", "=ds=#sr# =so1=250 =so2=260 =so3=270 =so4=280" },
		{ "e13948", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Minor Haste", "=ds=#sr# =so1=250 =so2=270 =so3=290 =so4=310" },
		{ "e13947", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Riding Skill", "=ds=#sr# =so1=250 =so2=270 =so3=290 =so4=310" },
		{ "e20008", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Intellect", "=ds=#sr# =so1=255 =so2=275 =so3=295 =so4=315" },
		{ "e20020", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Stamina", "=ds=#sr# =so1=260 =so2=280 =so3=300 =so4=320" },
		{ "e20014", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Resistance", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ "e20017", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Stamina", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ "e13898", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Fiery Weapon", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ "e15596", "INV_Misc_Gem_Bloodstone_01", "=q3=Smoking Heart of the Mountain", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ "e20009", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Superior Spirit", "=ds=#sr# =so1=270 =so2=290 =so3=310 =so4=330" },
		{ "e20012", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Agility", "=ds=#sr# =so1=270 =so2=290 =so3=310 =so4=330" },
		{ "e25128", "INV_Potion_104", "=q1=Wizard Oil", "=ds=#sr# =so1=275 =so2=285 =so3=295 =so4=305" },
		{ "e20024", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Spirit", "=ds=#sr# =so1=275 =so2=295 =so3=315 =so4=335" },
		{ "e20026", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Health", "=ds=#sr# =so1=275 =so2=295 =so3=315 =so4=335" },
		{ "e41758", "INV_Potion_14", "=q1=Enchanted Gemstone Oil", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=300" },
		{ "e20016", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Superior Spirit", "=ds=#sr# =so1=280 =so2=300 =so3=320 =so4=340" },
		{ "e20015", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Defense", "=ds=#sr# =so1=285 =so2=305 =so3=325 =so4=345" },
	},

	EnchantingArtisan2 = {
		{ "e20029", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Icy Chill", "=ds=#sr# =so1=285 =so2=305 =so3=325 =so4=345" },
		{ "e27837", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Agility", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e23801", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Mana Regeneration", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e20028", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Mana", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e23800", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Agility", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e23799", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Strength", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e20051", "INV_Wand_09", "=q1=Runed Arcanite Rod", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e20030", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Superior Impact", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e20023", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Agility", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e20010", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Superior Strength", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e20013", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Strength", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e20033", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Unholy Weapon", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e25130", "INV_Potion_100", "=q1=Brilliant Mana Oil", "=ds=#sr# =so1=300 =so2=310 =so3=320 =so4=330" },
		{ "e25129", "INV_Potion_105", "=q1=Brilliant Wizard Oil", "=ds=#sr# =so1=300 =so2=310 =so3=320 =so4=330" },
		{ "e20036", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Intellect", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20035", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Spirit", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e23802", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Healing Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20011", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Superior Stamina", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20025", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Stats", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25086", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Dodge", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25081", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Fire Resistance", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25082", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Nature Resistance", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25083", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Stealth", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25084", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Subtlety", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25078", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fire Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25074", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Frost Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25079", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Healing Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25073", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Shadow Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25080", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Superior Agility", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25072", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Threat", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
	},

	EnchantingArtisan3 = {
		{ "e20034", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Crusader", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e22750", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Healing Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20032", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lifestealing", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e23804", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Intellect", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e23803", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Spirit", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e22749", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Spell Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20031", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Superior Striking", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e57030", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Agility", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57028", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Spell Power", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57142", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Spirit", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57127", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Superior Stamina", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57148", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Vampirism", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57144", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Deflection", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57119", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Mighty Mana", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57117", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Arcane Resistance", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e46601", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Arcane Power", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e46602", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Nature Power", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e46086", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Strength", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57518", "inv_misc_gem_pearl_04", "=q5=Eternal Dreamstone Shard", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	EnchantingCloak1 = {
		{ "e57117", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Arcane Resistance", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e25084", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Subtlety", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25083", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Stealth", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25082", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Nature Resistance", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25081", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Fire Resistance", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25086", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Dodge", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20015", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Defense", "=ds=#sr# =so1=285 =so2=305 =so3=325 =so4=345" },
		{ "e20014", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Resistance", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ "e13882", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Agility", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
		{ "e13794", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Resistance", "=ds=#sr# =so1=205 =so2=225 =so3=245 =so4=265" },
		{ "e13746", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Defense", "=ds=#sr# =so1=205 =so2=225 =so3=245 =so4=265" },
		{ "e13657", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Fire Resistance", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "e13635", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Defense", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "e13522", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Shadow Resistance", "=ds=#sr# =so1=135 =so2=160 =so3=180 =so4=200" },
		{ "e7861", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Fire Resistance", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
		{ "e13421", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Protection", "=ds=#sr# =so1=115 =so2=140 =so3=160 =so4=180" },
		{ "e13419", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Agility", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "e7771", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Protection", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "e7454", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Resistance", "=ds=#sr# =so1=45 =so2=95 =so3=115 =so4=135" },
	},

	EnchantingChest1 = {
		{ "e57119", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Mighty Mana", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e20025", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Stats", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20028", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Mana", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e20026", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Health", "=ds=#sr# =so1=275 =so2=295 =so3=315 =so4=335" },
		{ "e13941", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Stats", "=ds=#sr# =so1=245 =so2=265 =so3=285 =so4=305" },
		{ "e13917", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Mana", "=ds=#sr# =so1=230 =so2=250 =so3=270 =so4=290" },
		{ "e13858", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Health", "=ds=#sr# =so1=220 =so2=240 =so3=260 =so4=280" },
		{ "e13700", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Stats", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e13663", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Mana", "=ds=#sr# =so1=185 =so2=205 =so3=225 =so4=245" },
		{ "e13640", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Health", "=ds=#sr# =so1=160 =so2=180 =so3=200 =so4=220" },
		{ "e13626", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Stats", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "e13607", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Mana", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13538", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Absorption", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "e7857", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Health", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "e7776", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Mana", "=ds=#sr# =so1=80 =so2=115 =so3=135 =so4=155" },
		{ "e7748", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Health", "=ds=#sr# =so1=60 =so2=105 =so3=125 =so4=145" },
		{ "e7426", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Absorption", "=ds=#sr# =so1=40 =so2=90 =so3=110 =so4=130" },
		{ "e7443", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Mana", "=ds=#sr# =so1=20 =so2=80 =so3=100 =so4=120" },
		{ "e7420", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Health", "=ds=#sr# =so1=15 =so2=70 =so3=90 =so4=110" },
	},

	EnchantingBracer1 = {
		{ "e57144", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Deflection", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57028", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Spell Power", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57030", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Agility", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e20011", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Superior Stamina", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e23802", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Healing Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20010", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Superior Strength", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e23801", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Mana Regeneration", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e20009", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Superior Spirit", "=ds=#sr# =so1=270 =so2=290 =so3=310 =so4=330" },
		{ "e20008", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Intellect", "=ds=#sr# =so1=255 =so2=275 =so3=295 =so4=315" },
		{ "e13945", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Stamina", "=ds=#sr# =so1=245 =so2=265 =so3=285 =so4=305" },
		{ "e13939", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Strength", "=ds=#sr# =so1=240 =so2=260 =so3=280 =so4=300" },
		{ "e13931", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Deflection", "=ds=#sr# =so1=235 =so2=255 =so3=275 =so4=295" },
		{ "e13846", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Greater Spirit", "=ds=#sr# =so1=220 =so2=240 =so3=260 =so4=280" },
		{ "e13822", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Intellect", "=ds=#sr# =so1=210 =so2=230 =so3=250 =so4=270" },
		{ "e57146", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Vampirism", "=ds=#sr# =so1=185 =so2=205 =so3=225 =so4=245" },
		{ "e13661", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Strength", "=ds=#sr# =so1=180 =so2=200 =so3=220 =so4=240" },
		{ "e13648", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Stamina", "=ds=#sr# =so1=170 =so2=190 =so3=210 =so4=230" },
		{ "e13646", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Deflection", "=ds=#sr# =so1=170 =so2=190 =so3=210 =so4=230" },
		{ "e13642", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Spirit", "=ds=#sr# =so1=165 =so2=185 =so3=205 =so4=225" },
		{ "e13622", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Intellect", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "e13536", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Strength", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "e13501", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Stamina", "=ds=#sr# =so1=130 =so2=155 =so3=175 =so4=195" },
		{ "e7859", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Lesser Spirit", "=ds=#sr# =so1=120 =so2=145 =so3=165 =so4=185" },
		{ "e7782", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Strength", "=ds=#sr# =so1=80 =so2=115 =so3=135 =so4=155" },
		{ "e7779", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Agility", "=ds=#sr# =so1=80 =so2=115 =so3=135 =so4=155" },
		{ "e7766", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Spirit", "=ds=#sr# =so1=60 =so2=105 =so3=125 =so4=145" },
		{ "e7457", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Stamina", "=ds=#sr# =so1=50 =so2=100 =so3=120 =so4=140" },
		{ "e7428", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Deflect", "=ds=#sr# =so1=1 =so2=80 =so3=100 =so4=120" },
		{ "e7418", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracer - Minor Health", "=ds=#sr# =so1=1 =so2=70 =so3=90 =so4=110" },
	},

	EnchantingGlove1 = {
		{ "e46086", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Strength", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e46602", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Nature Power", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e46601", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Arcane Power", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e25072", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Threat", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25080", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Superior Agility", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25073", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Shadow Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25079", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Healing Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25074", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Frost Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e25078", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fire Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20013", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Strength", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e20012", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Agility", "=ds=#sr# =so1=270 =so2=290 =so3=310 =so4=330" },
		{ "e13947", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Riding Skill", "=ds=#sr# =so1=250 =so2=270 =so3=290 =so4=310" },
		{ "e13948", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Minor Haste", "=ds=#sr# =so1=250 =so2=270 =so3=290 =so4=310" },
		{ "e13887", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Strength", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
		{ "e13868", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Herbalism", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
		{ "e13841", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Mining", "=ds=#sr# =so1=215 =so2=235 =so3=255 =so4=275" },
		{ "e13815", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Agility", "=ds=#sr# =so1=210 =so2=230 =so3=250 =so4=270" },
		{ "e13698", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Skinning", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e13612", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Mining", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13617", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Herbalism", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13620", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fishing", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
	},

	EnchantingBoots1 = {
		{ "e57148", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Vampirism", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57127", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Superior Stamina", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e57142", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Spirit", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "e20023", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Agility", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e20024", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Spirit", "=ds=#sr# =so1=275 =so2=295 =so3=315 =so4=335" },
		{ "e20020", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Stamina", "=ds=#sr# =so1=260 =so2=280 =so3=300 =so4=320" },
		{ "e13935", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Agility", "=ds=#sr# =so1=235 =so2=255 =so3=275 =so4=295" },
		{ "e13890", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Speed", "=ds=#sr# =so1=225 =so2=245 =so3=265 =so4=285" },
		{ "e13836", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Stamina", "=ds=#sr# =so1=215 =so2=235 =so3=255 =so4=275" },
		{ "e13687", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Spirit", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "e13644", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Stamina", "=ds=#sr# =so1=170 =so2=190 =so3=210 =so4=230" },
		{ "e13637", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Agility", "=ds=#sr# =so1=160 =so2=180 =so3=200 =so4=220" },
		{ "e7863", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Stamina", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
		{ "e7867", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Agility", "=ds=#sr# =so1=125 =so2=150 =so3=170 =so4=190" },
	},

	Enchanting2HWeapon1 = {
		{ "e20035", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Spirit", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20036", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Intellect", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20030", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Superior Impact", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e27837", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Agility", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e13937", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Greater Impact", "=ds=#sr# =so1=240 =so2=260 =so3=280 =so4=300" },
		{ "e13695", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Impact", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e13529", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Impact", "=ds=#sr# =so1=145 =so2=170 =so3=190 =so4=210" },
		{ "e13380", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Spirit", "=ds=#sr# =so1=110 =so2=135 =so3=155 =so4=175" },
		{ "e7745", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Minor Impact", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "e7793", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Intellect", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "e45071", "Spell_Holy_GreaterHeal", "=q2=Enchant 2H Weapon - Minor Intellect", "=ds=#sr# =so1=75 =so2=115 =so3=135 =so4=155" },
	},

	EnchantingWeapon1 = {
		{ "e20031", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Superior Striking", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e22749", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Spell Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e23803", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Spirit", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e23804", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Intellect", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20032", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lifestealing", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e22750", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Healing Power", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20034", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Crusader", "=ds=#sr# =so1=300 =so2=320 =so3=340 =so4=360" },
		{ "e20033", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Unholy Weapon", "=ds=#sr# =so1=295 =so2=315 =so3=335 =so4=355" },
		{ "e23799", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Strength", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e23800", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Agility", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ "e20029", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Icy Chill", "=ds=#sr# =so1=285 =so2=305 =so3=325 =so4=345" },
		{ "e13898", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Fiery Weapon", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ "e13943", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Greater Striking", "=ds=#sr# =so1=245 =so2=265 =so3=285 =so4=305" },
		{ "e13915", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Demonslaying", "=ds=#sr# =so1=230 =so2=250 =so3=270 =so4=290" },
		{ "e13693", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Striking", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "e21931", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Winter's Might", "=ds=#sr# =so1=190 =so2=210 =so3=230 =so4=250" },
		{ "e13655", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Elemental Slayer", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "e13653", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Beastslayer", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ "e13503", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Striking", "=ds=#sr# =so1=140 =so2=165 =so3=185 =so4=205" },
		{ "e7788", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Striking", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
		{ "e7786", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Beastslayer", "=ds=#sr# =so1=90 =so2=120 =so3=140 =so4=160" },
	},

	EnchantingShield1 = {
		{ "e20016", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Superior Spirit", "=ds=#sr# =so1=280 =so2=300 =so3=320 =so4=340" },
		{ "e20017", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Stamina", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ "e13933", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Frost Resistance", "=ds=#sr# =so1=235 =so2=255 =so3=275 =so4=295" },
		{ "e13905", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Spirit", "=ds=#sr# =so1=230 =so2=250 =so3=270 =so4=290" },
		{ "e13817", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Stamina", "=ds=#sr# =so1=210 =so2=230 =so3=250 =so4=270" },
		{ "e13689", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Block", "=ds=#sr# =so1=195 =so2=215 =so3=235 =so4=255" },
		{ "e13659", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Spirit", "=ds=#sr# =so1=180 =so2=200 =so3=220 =so4=240" },
		{ "e13631", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Stamina", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "e13485", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Spirit", "=ds=#sr# =so1=130 =so2=155 =so3=175 =so4=195" },
		{ "e13464", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Protection", "=ds=#sr# =so1=115 =so2=140 =so3=160 =so4=180" },
		{ "e13378", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Minor Stamina", "=ds=#sr# =so1=105 =so2=130 =so3=150 =so4=170" },
	},

	EnchantingMisc1 = {
		{ "e7421", "inv_staff_goldfeathered_01", "=q1=Runed Copper Rod", "=ds=#sr# =so1=1 =so2=5 =so3=7 =so4=10" },
		{ "e7795", "INV_Staff_01", "=q1=Runed Silver Rod", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=170" },
		{ "e13628", "INV_Staff_10", "=q1=Runed Golden Rod", "=ds=#sr# =so1=150 =so2=175 =so3=195 =so4=215" },
		{ "e13702", "INV_Staff_11", "=q1=Runed Truesilver Rod", "=ds=#sr# =so1=200 =so2=220 =so3=240 =so4=260" },
		{ "e20051", "INV_Wand_09", "=q1=Runed Arcanite Rod", "=ds=#sr# =so1=290 =so2=310 =so3=330 =so4=350" },
		{ 0, "", "", "" },
		{ "e14293", "INV_Staff_02", "=q2=Lesser Magic Wand", "=ds=#sr# =so1=10 =so2=75 =so3=95 =so4=115" },
		{ "e14807", "INV_Staff_07", "=q2=Greater Magic Wand", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "e14809", "INV_Staff_02", "=q2=Lesser Mystic Wand", "=ds=#sr# =so1=155 =so2=175 =so3=195 =so4=215" },
		{ "e14810", "INV_Wand_07", "=q2=Greater Mystic Wand", "=ds=#sr# =so1=175 =so2=195 =so3=215 =so4=235" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ "e25124", "INV_Poison_MindNumbing", "=q1=Minor Wizard Oil", "=ds=#sr# =so1=45 =so2=55 =so3=65 =so4=75" },
		{ "e25125", "INV_Potion_98", "=q1=Minor Mana Oil", "=ds=#sr# =so1=150 =so2=160 =so3=170 =so4=180" },
		{ "e25126", "INV_Potion_103", "=q1=Lesser Wizard Oil", "=ds=#sr# =so1=200 =so2=210 =so3=220 =so4=230" },
		{ "e25127", "INV_Potion_99", "=q1=Lesser Mana Oil", "=ds=#sr# =so1=250 =so2=260 =so3=270 =so4=280" },
		{ "e25128", "INV_Potion_104", "=q1=Wizard Oil", "=ds=#sr# =so1=275 =so2=285 =so3=295 =so4=305" },
		{ "e25130", "INV_Potion_100", "=q1=Brilliant Mana Oil", "=ds=#sr# =so1=300 =so2=310 =so3=320 =so4=330" },
		{ "e25129", "INV_Potion_105", "=q1=Brilliant Wizard Oil", "=ds=#sr# =so1=300 =so2=310 =so3=320 =so4=330" },
		{ 0, "", "", "" },
		{ "e17181", "INV_Misc_Rune_05", "=q1=Enchanted Leather", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "e17180", "INV_Ingot_Eternium", "=q1=Enchanted Thorium", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "e41758", "INV_Potion_14", "=q1=Enchanted Gemstone Oil", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=300" },
		{ 0, "", "", "" },
		{ "e15596", "INV_Misc_Gem_Bloodstone_01", "=q3=Smoking Heart of the Mountain", "=ds=#sr# =so1=265 =so2=285 =so3=305 =so4=325" },
		{ 0, "", "", "" },
		{ "e57518", "inv_misc_gem_pearl_04", "=q5=Eternal Dreamstone Shard", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	SmithingApprentice1 = {
		{ "s12260", "inv_chest_chain", "=q1=Rough Copper Vest", "=ds=#sr# =so1=1 =so2=15 =so3=35 =so4=55" },
		{ "s2660", "inv_stone_sharpeningstone_01", "=q1=Rough Sharpening Stone", "=ds=#sr# =so1=1 =so2=15 =so3=35 =so4=55" },
		{ "s3115", "inv_stone_weightstone_01", "=q1=Rough Weightstone", "=ds=#sr# =so1=1 =so2=15 =so3=35 =so4=55" },
		{ "s2663", "inv_bracer_03", "=q1=Copper Bracers", "=ds=#sr# =so1=1 =so2=20 =so3=40 =so4=60" },
		{ "s2662", "inv_pants_03", "=q1=Copper Chain Pants", "=ds=#sr# =so1=1 =so2=50 =so3=70 =so4=90" },
		{ "s2737", "inv_mace_01", "=q1=Copper Mace", "=ds=#sr# =so1=15 =so2=55 =so3=75 =so4=95" },
		{ "s2738", "inv_axe_23", "=q1=Copper Axe", "=ds=#sr# =so1=20 =so2=60 =so3=80 =so4=100" },
		{ "s3319", "inv_boots_01", "=q1=Copper Chain Boots", "=ds=#sr# =so1=20 =so2=60 =so3=80 =so4=100" },
		{ "s3320", "inv_stone_grindingstone_01", "=q1=Rough Grinding Stone", "=ds=#sr# =so1=25 =so2=45 =so3=65 =so4=85" },
		{ "s2739", "inv_sword_26", "=q1=Copper Shortsword", "=ds=#sr# =so1=25 =so2=65 =so3=85 =so4=105" },
		{ "s57163", "INV_Misc_Buckle_01", "=q2=Copper Belt Buckle", "=ds=#sr# =so1=25 =so2=25 =so3=37 =so4=50" },

		{ "s46663", "inv_gauntlets_11", "=q1=Copper Knuckles", "=ds=#sr# =so1=30 =so2=60 =so3=62 =so4=65" },
		{ "s9983", "inv_sword_21", "=q1=Copper Claymore", "=ds=#sr# =so1=30 =so2=70 =so3=90 =so4=110" },
		{ "s8880", "inv_weapon_shortblade_14", "=q1=Copper Dagger", "=ds=#sr# =so1=30 =so2=70 =so3=90 =so4=110" },
		{ "s2661", "inv_belt_02", "=q1=Copper Chain Belt", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s3293", "inv_throwingaxe_02", "=q2=Copper Battle Axe", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s3321", "inv_chest_chain", "=q2=Copper Chain Vest", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s3323", "inv_gauntlets_04", "=q2=Runed Copper Gauntlets", "=ds=#sr# =so1=40 =so2=80 =so3=100 =so4=120" },
		{ "s3324", "inv_pants_03", "=q2=Runed Copper Pants", "=ds=#sr# =so1=45 =so2=85 =so3=105 =so4=125" },
		{ "s3325", "inv_gauntlets_05", "=q2=Gemmed Copper Gauntlets", "=ds=#sr# =so1=60 =so2=100 =so3=120 =so4=140" },
		{ "s2665", "inv_stone_sharpeningstone_02", "=q1=Coarse Sharpening Stone", "=ds=#sr# =so1=65 =so2=65 =so3=72 =so4=80" },
		{ "s3116", "inv_stone_weightstone_02", "=q1=Coarse Weightstone", "=ds=#sr# =so1=65 =so2=65 =so3=72 =so4=80" },
		{ "s7408", "inv_hammer_18", "=q1=Heavy Copper Maul", "=ds=#sr# =so1=65 =so2=105 =so3=125 =so4=145" },
		{ "s2666", "inv_belt_03", "=q2=Runed Copper Belt", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "s3294", "inv_throwingaxe_01", "=q2=Thick War Axe", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "s3326", "inv_stone_grindingstone_02", "=q1=Coarse Grinding Stone", "=ds=#sr# =so1=75 =so2=75 =so3=87 =so4=100" },
		{ "s46664", "inv_misc_monsterclaw_01", "=q2=Sharpened Claw", "=ds=#sr# =so1=75 =so2=90 =so3=95 =so4=100" },
		{ "s45063", "INV_Shield_09", "=q2=Blast Shield", "=ds=#sr# =so1=75 =so2=100 =so3=120 =so4=140" },
	},

	SmithingJourneyman1 = {
		{ "s2667", "inv_chest_plate03", "=q2=Runed Copper Breastplate", "=ds=#sr# =so1=80 =so2=120 =so3=140 =so4=160" },
		{ "s57166", "INV_Misc_Buckle_02", "=q2=Bronze Belt Buckle", "=ds=#sr# =so1=90 =so2=90 =so3=97 =so4=105" },
		{ "s2664", "inv_bracer_03", "=q2=Runed Copper Bracers", "=ds=#sr# =so1=90 =so2=115 =so3=127 =so4=140" },
		{ "s7817", "inv_boots_01", "=q2=Rough Bronze Boots", "=ds=#sr# =so1=95 =so2=125 =so3=140 =so4=155" },
		{ "s3292", "inv_sword_14", "=q2=Heavy Copper Broadsword", "=ds=#sr# =so1=95 =so2=135 =so3=155 =so4=175" },
		{ "s7818", "inv_staff_01", "=q1=Silver Rod", "=ds=#sr# =so1=100 =so2=105 =so3=107 =so4=110" },
		{ "s19666", "inv_misc_key_03", "=q2=Silver Skeleton Key", "=ds=#sr# =so1=100 =so2=100 =so3=110 =so4=120" },
		{ "s8367", "inv_chest_plate05", "=q2=Ironforge Breastplate", "=ds=#sr# =so1=100 =so2=140 =so3=160 =so4=180" },
		{ "s2671", "inv_bracer_05", "=q2=Rough Bronze Bracers", "=ds=#sr# =so1=100 =so2=140 =so3=160 =so4=180" },
		{ "s3491", "inv_weapon_shortblade_04", "=q2=Big Bronze Knife", "=ds=#sr# =so1=105 =so2=135 =so3=150 =so4=165" },
		{ "s2670", "inv_chest_chain_08", "=q2=Rough Bronze Cuirass", "=ds=#sr# =so1=105 =so2=145 =so3=160 =so4=175" },
		{ "s2668", "inv_pants_03", "=q2=Rough Bronze Leggings", "=ds=#sr# =so1=105 =so2=145 =so3=160 =so4=175" },
		{ "s2740", "inv_mace_08", "=q1=Bronze Mace", "=ds=#sr# =so1=110 =so2=140 =so3=155 =so4=170" },
		{ "s3328", "inv_shoulder_05", "=q2=Rough Bronze Shoulders", "=ds=#sr# =so1=110 =so2=140 =so3=155 =so4=170" },
		{ "s6517", "inv_weapon_shortblade_05", "=q2=Pearl-handled Dagger", "=ds=#sr# =so1=110 =so2=140 =so3=155 =so4=170" },
		{ "s2741", "inv_axe_17", "=q1=Bronze Axe", "=ds=#sr# =so1=115 =so2=145 =so3=160 =so4=175" },
		{ "s46665", "inv_gauntlets_11", "=q2=Bronze Bruiser", "=ds=#sr# =so1=120 =so2=140 =so3=145 =so4=150" },
		{ "s2742", "inv_sword_04", "=q1=Bronze Shortsword", "=ds=#sr# =so1=120 =so2=150 =so3=165 =so4=180" },
		{ "s2672", "inv_bracer_07", "=q2=Patterned Bronze Bracers", "=ds=#sr# =so1=120 =so2=150 =so3=165 =so4=180" },
		{ "s2674", "inv_stone_sharpeningstone_03", "=q1=Heavy Sharpening Stone", "=ds=#sr# =so1=125 =so2=125 =so3=132 =so4=140" },
		{ "s3117", "inv_stone_weightstone_03", "=q1=Heavy Weightstone", "=ds=#sr# =so1=125 =so2=125 =so3=132 =so4=140" },
		{ "s3337", "inv_stone_grindingstone_03", "=q1=Heavy Grinding Stone", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s9985", "inv_hammer_18", "=q1=Bronze Warhammer", "=ds=#sr# =so1=125 =so2=155 =so3=170 =so4=185" },
		{ "s3295", "inv_weapon_shortblade_05", "=q2=Deadly Bronze Poniard", "=ds=#sr# =so1=125 =so2=155 =so3=170 =so4=185" },
		{ "s3330", "inv_shoulder_09", "=q2=Silvered Bronze Shoulders", "=ds=#sr# =so1=125 =so2=155 =so3=170 =so4=185" },
		{ "s9986", "inv_sword_20", "=q1=Bronze Greatsword", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s3296", "inv_mace_08", "=q2=Heavy Bronze Mace", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s3331", "inv_boots_01", "=q2=Silvered Bronze Boots", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s2673", "inv_chest_chain_09", "=q2=Silvered Bronze Breastplate", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s9987", "inv_axe_21", "=q1=Bronze Battle Axe", "=ds=#sr# =so1=135 =so2=165 =so3=180 =so4=195" },
	},

	SmithingJourneyman2 = {
		{ "s3333", "inv_gauntlets_05", "=q2=Silvered Bronze Gauntlets", "=ds=#sr# =so1=135 =so2=165 =so3=180 =so4=195" },
		{ "s57169", "INV_Misc_Buckle_03", "=q2=Iron Belt Buckle", "=ds=#sr# =so1=140 =so2=140 =so3=147 =so4=155" },
		{ "s6518", "inv_hammer_05", "=q2=Iridescent Hammer", "=ds=#sr# =so1=140 =so2=170 =so3=185 =so4=200" },
		{ "s3334", "inv_boots_01", "=q2=Green Iron Boots", "=ds=#sr# =so1=145 =so2=175 =so3=190 =so4=205" },
		{ "s3297", "inv_hammer_04", "=q2=Mighty Iron Hammer", "=ds=#sr# =so1=145 =so2=175 =so3=190 =so4=205" },
		{ "s2675", "inv_chest_plate15", "=q3=Shining Silver Breastplate", "=ds=#sr# =so1=145 =so2=175 =so3=190 =so4=205" },
		{ "s8768", "inv_misc_armorkit_12", "=q1=Iron Buckle", "=ds=#sr# =so1=150 =so2=150 =so3=152 =so4=155" },
		{ "s19667", "inv_misc_key_13", "=q2=Golden Skeleton Key", "=ds=#sr# =so1=150 =so2=150 =so3=160 =so4=170" },
		{ "s14379", "inv_staff_10", "=q1=Golden Rod", "=ds=#sr# =so1=150 =so2=155 =so3=157 =so4=160" },
		{ "s7221", "inv_misc_armorkit_01", "=q1=Iron Shield Spike", "=ds=#sr# =so1=150 =so2=180 =so3=195 =so4=210" },
		{ "s3336", "inv_gauntlets_05", "=q2=Green Iron Gauntlets", "=ds=#sr# =so1=150 =so2=180 =so3=195 =so4=210" },
	},

	SmithingExpert1 = {
		{ "s3506", "inv_pants_05", "=q2=Green Iron Leggings", "=ds=#sr# =so1=155 =so2=180 =so3=192 =so4=205" },
		{ "s12259", "inv_pants_04", "=q2=Silvered Bronze Leggings", "=ds=#sr# =so1=155 =so2=180 =so3=192 =so4=205" },
		{ "s3494", "inv_hammer_07", "=q2=Solid Iron Maul", "=ds=#sr# =so1=155 =so2=180 =so3=192 =so4=205" },
		{ "s9813", "inv_chest_chain_14", "=q2=Barbaric Iron Breastplate", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s9811", "inv_shoulder_23", "=q2=Barbaric Iron Shoulders", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s3504", "inv_shoulder_09", "=q2=Green Iron Shoulders", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s3492", "inv_sword_20", "=q2=Hardened Iron Shortsword", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s3501", "inv_bracer_06", "=q2=Green Iron Bracers", "=ds=#sr# =so1=165 =so2=190 =so3=202 =so4=215" },
		{ "s7222", "inv_misc_orb_01", "=q1=Iron Counterweight", "=ds=#sr# =so1=165 =so2=190 =so3=202 =so4=215" },
		{ "s3495", "inv_hammer_04", "=q2=Golden Iron Destroyer", "=ds=#sr# =so1=170 =so2=195 =so3=207 =so4=220" },
		{ "s3507", "inv_pants_04", "=q2=Golden Scale Leggings", "=ds=#sr# =so1=170 =so2=195 =so3=207 =so4=220" },
		{ "s3502", "inv_helmet_03", "=q2=Green Iron Helm", "=ds=#sr# =so1=170 =so2=195 =so3=207 =so4=220" },
		{ "s9814", "inv_helmet_25", "=q2=Barbaric Iron Helm", "=ds=#sr# =so1=175 =so2=200 =so3=212 =so4=225" },
		{ "s3505", "inv_shoulder_09", "=q3=Golden Scale Shoulders", "=ds=#sr# =so1=175 =so2=200 =so3=212 =so4=225" },
		{ "s3493", "inv_sword_36", "=q2=Jade Serpentblade", "=ds=#sr# =so1=175 =so2=200 =so3=212 =so4=225" },
		{ "s9818", "inv_boots_plate_01", "=q2=Barbaric Iron Boots", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s15972", "inv_weapon_shortblade_05", "=q2=Glinting Steel Dagger", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s3496", "inv_sword_25", "=q2=Moonsteel Broadsword", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s3508", "inv_chest_chain", "=q3=Green Iron Hauberk", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s7223", "inv_bracer_10", "=q2=Golden Scale Bracers", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s9820", "inv_gauntlets_31", "=q2=Barbaric Iron Gloves", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s3498", "inv_throwingaxe_05", "=q2=Massive Iron Axe", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s3513", "inv_boots_01", "=q2=Polished Steel Boots", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s57172", "INV_Misc_Buckle_04", "=q2=Mithril Belt Buckle", "=ds=#sr# =so1=185 =so2=190 =so3=197 =so4=205" },
		{ "s7224", "spell_frost_chainsofice", "=q1=Steel Weapon Chain", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s21913", "inv_axe_06", "=q2=Edge of Winter", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s3503", "inv_helmet_36", "=q2=Golden Scale Coif", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s15973", "inv_weapon_shortblade_05", "=q2=Searing Golden Blade", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s3511", "inv_chest_chain_06", "=q2=Golden Scale Cuirass", "=ds=#sr# =so1=195 =so2=220 =so3=232 =so4=245" },
		{ "s9920", "inv_stone_grindingstone_04", "=q1=Solid Grinding Stone", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
	},

	SmithingExpert2 = {
		{ "s9918", "inv_stone_sharpeningstone_04", "=q1=Solid Sharpening Stone", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s9921", "inv_stone_weightstone_04", "=q1=Solid Weightstone", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s19668", "inv_misc_key_11", "=q2=Truesilver Skeleton Key", "=ds=#sr# =so1=200 =so2=200 =so3=210 =so4=220" },
		{ "s14380", "inv_staff_11", "=q1=Truesilver Rod", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s3497", "inv_sword_05", "=q2=Frost Tiger Blade", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s3515", "inv_boots_01", "=q3=Golden Scale Boots", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s3500", "inv_axe_17", "=q2=Shadow Crescent Axe", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s9916", "inv_chest_plate05", "=q2=Steel Breastplate", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s11454", "inv_musket_01", "=q1=Inlaid Mithril Cylinder", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s11643", "inv_gauntlets_29", "=q2=Golden Scale Gauntlets", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s9928", "inv_gauntlets_27", "=q2=Heavy Mithril Gauntlet", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s9926", "inv_shoulder_22", "=q2=Heavy Mithril Shoulder", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s9933", "inv_pants_03", "=q2=Heavy Mithril Pants", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s9931", "inv_pants_03", "=q2=Mithril Scale Pants", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s9993", "inv_axe_14", "=q2=Heavy Mithril Axe", "=ds=#sr# =so1=210 =so2=235 =so3=247 =so4=260" },
		{ "s9957", "inv_pants_03", "=q2=Orcish War Leggings", "=ds=#sr# =so1=210 =so2=250 =so3=260 =so4=270" },
		{ "s9972", "inv_chest_plate10", "=q2=Ornate Mithril Breastplate", "=ds=#sr# =so1=210 =so2=260 =so3=270 =so4=280" },
		{ "s9979", "inv_boots_01", "=q2=Ornate Mithril Boots", "=ds=#sr# =so1=210 =so2=265 =so3=275 =so4=285" },
		{ "s9980", "inv_helmet_10", "=q2=Ornate Mithril Helm", "=ds=#sr# =so1=210 =so2=265 =so3=275 =so4=285" },
		{ "s9935", "inv_helmet_03", "=q2=Steel Plate Helm", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s9937", "inv_bracer_07", "=q2=Mithril Scale Bracers", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s9939", "inv_misc_armorkit_02", "=q2=Mithril Shield Spike", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s9950", "inv_gauntlets_31", "=q2=Ornate Mithril Gloves", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s9945", "inv_pants_04", "=q2=Ornate Mithril Pants", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s9995", "inv_axe_03", "=q2=Blue Glittering Axe", "=ds=#sr# =so1=220 =so2=245 =so3=257 =so4=270" },
		{ "s46626", "inv_boots_plate_01", "=q2=Steel Plate Boots", "=ds=#sr# =so1=220 =so2=220 =so3=220 =so4=220" },
		{ "s46627", "inv_gauntlets_31", "=q2=Steel Plate Gauntlets", "=ds=#sr# =so1=220 =so2=220 =so3=220 =so4=220" },
		{ "s9942", "inv_gauntlets_31", "=q2=Mithril Scale Gloves", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s9952", "inv_shoulder_09", "=q2=Ornate Mithril Shoulders", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s9997", "inv_sword_10", "=q2=Wicked Mithril Blade", "=ds=#sr# =so1=225 =so2=250 =so3=262 =so4=275" },
	},

	SmithingExpert3 = {
		{ "s46629", "inv_chest_chain_10", "=q2=Steel Plate Armor", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
		{ "s46628", "inv_pants_04", "=q2=Steel Plate Legguards", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
	},

	SmithingArtisan1 = {
		{ "s46631", "inv_helmet_25", "=q3=Steel Plate Barbute", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s46630", "inv_shoulder_16", "=q2=Steel Plate Pauldrons", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s9959", "inv_chest_plate10", "=q2=Heavy Mithril Breastplate", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s9961", "inv_helmet_35", "=q2=Mithril Coif", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10001", "inv_mace_15", "=q2=Big Black Mace", "=ds=#sr# =so1=230 =so2=255 =so3=267 =so4=280" },
		{ "s9968", "inv_boots_plate_01", "=q2=Heavy Mithril Boots", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s9966", "inv_shoulder_12", "=q3=Mithril Scale Shoulders", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s9964", "ability_rogue_sprint", "=q2=Mithril Spurs", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s57175", "INV_Misc_Buckle_05", "=q2=Thorium Belt Buckle", "=ds=#sr# =so1=240 =so2=240 =so3=247 =so4=255" },
		{ "s10005", "inv_sword_30", "=q2=Dazzling Mithril Rapier", "=ds=#sr# =so1=240 =so2=265 =so3=277 =so4=290" },
		{ "s9970", "inv_helmet_10", "=q2=Heavy Mithril Helm", "=ds=#sr# =so1=245 =so2=255 =so3=265 =so4=275" },
		{ "s10009", "inv_hammer_17", "=q3=Runed Mithril Hammer", "=ds=#sr# =so1=245 =so2=270 =so3=282 =so4=295" },
		{ "s16639", "inv_stone_grindingstone_05", "=q1=Dense Grinding Stone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "s16641", "inv_stone_sharpeningstone_05", "=q1=Dense Sharpening Stone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "s16640", "inv_stone_weightstone_05", "=q1=Dense Weightstone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "s16642", "inv_chest_plate08", "=q2=Thorium Armor", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s16643", "inv_belt_30", "=q2=Thorium Belt", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s16644", "inv_bracer_13", "=q2=Thorium Bracers", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s10013", "inv_weapon_shortblade_14", "=q2=Ebon Shiv", "=ds=#sr# =so1=255 =so2=280 =so3=292 =so4=305" },
		{ "s16645", "inv_belt_11", "=q2=Radiant Belt", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s16647", "inv_belt_01", "=q2=Imperial Plate Belt", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s16646", "inv_shoulder_02", "=q2=Imperial Plate Shoulders", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s15293", "inv_chest_chain_16", "=q2=Dark Iron Mail", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s16649", "inv_bracer_19", "=q2=Imperial Plate Bracers", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s16648", "inv_chest_plate16", "=q2=Radiant Breastplate", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s20201", "inv_staff_19", "=q1=Arcanite Rod", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "s19669", "inv_misc_key_08", "=q2=Arcanite Skeleton Key", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "s16651", "inv_misc_armorkit_20", "=q2=Thorium Shield Spike", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s16969", "inv_axe_12", "=q2=Ornate Thorium Handaxe", "=ds=#sr# =so1=275 =so2=300 =so3=312 =so4=325" },
	},

	SmithingArtisan2 = {
		{ "s47032", "inv_belt_04", "=q3=Hateforge Belt", "=ds=#sr# =so1=275 =so2=300 =so3=312 =so4=325" },
		{ "s47034", "inv_boots_01", "=q3=Hateforge Boots", "=ds=#sr# =so1=275 =so2=300 =so3=310 =so4=320" },
		{ "s57113", "inv_boots_plate_05", "=q2=Thorium Spurs",  "=ds=#sr# =so1=275 =so2=300 =so3=310 =so4=320" },
		{ "s57178", "INV_Misc_Buckle_06", "=q2=Arcanite Belt Buckle", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s15295", "inv_shoulder_09", "=q2=Dark Iron Shoulders", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s16652", "inv_boots_plate_08", "=q2=Thorium Boots", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s16653", "inv_helmet_23", "=q2=Thorium Helm", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s16971", "inv_weapon_halberd_11", "=q2=Huge Thorium Battleaxe", "=ds=#sr# =so1=280 =so2=305 =so3=317 =so4=330" },
		{ "s47033", "inv_gauntlets_04", "=q4=Hateforge Grips", "=ds=#sr# =so1=285 =so2=300 =so3=310 =so4=320" },
		{ "s16654", "inv_gauntlets_26", "=q2=Radiant Gloves", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s47029", "inv_helmet_10", "=q3=Hateforge Helmet", "=ds=#sr# =so1=290 =so2=300 =so3=310 =so4=320" },
		{ "s47030", "inv_chest_chain_09", "=q3=Hateforge Cuirass", "=ds=#sr# =so1=290 =so2=300 =so3=310 =so4=320" },
		{ "s47031", "inv_pants_03", "=q3=Hateforge Leggings", "=ds=#sr# =so1=290 =so2=300 =so3=310 =so4=320" },
		{ "s16656", "inv_boots_plate_03", "=q2=Radiant Boots", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s16660", "inv_shoulder_20", "=q3=Dawnbringer Shoulders", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s23632", "inv_belt_11", "=q3=Girdle of the Dawn", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s23628", "inv_belt_16", "=q3=Heavy Timbermaw Belt", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s16984", "inv_hammer_06", "=q2=Volcanic Hammer", "=ds=#sr# =so1=290 =so2=315 =so3=327 =so4=340" },
		{ "s16657", "inv_boots_plate_01", "=q2=Imperial Plate Boots", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s16658", "inv_helmet_22", "=q2=Imperial Plate Helm", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s16659", "inv_crown_01", "=q2=Radiant Circlet", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s22757", "inv_stone_02", "=q2=Elemental Sharpening Stone", "=ds=#sr# =so1=300 =so2=300 =so3=310 =so4=320" },
		{ "s16663", "inv_chest_plate10", "=q2=Imperial Plate Chest", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16730", "inv_pants_04", "=q2=Imperial Plate Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16725", "inv_pants_03", "=q2=Radiant Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16731", "inv_chest_plate11", "=q2=Runic Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16665", "inv_boots_plate_01", "=q2=Runic Plate Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16726", "inv_helmet_03", "=q2=Runic Plate Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16732", "inv_pants_04", "=q2=Runic Plate Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16664", "inv_shoulder_23", "=q2=Runic Plate Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16662", "inv_pants_04", "=q2=Thorium Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingArtisan3 = {
		{ "s24136", "inv_chest_chain_14", "=q3=Bloodsoul Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24138", "inv_gauntlets_31", "=q3=Bloodsoul Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24137", "inv_shoulder_15", "=q3=Bloodsoul Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24914", "inv_chest_plate06", "=q3=Darkrune Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24912", "inv_gauntlets_27", "=q3=Darkrune Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24913", "inv_helmet_10", "=q3=Darkrune Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24139", "inv_chest_plate08", "=q3=Darksoul Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24140", "inv_pants_plate_21", "=q3=Darksoul Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24141", "inv_shoulder_01", "=q3=Darksoul Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23633", "inv_gauntlets_29", "=q3=Gloves of the Dawn", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27585", "inv_belt_16", "=q3=Heavy Obsidian Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23629", "inv_boots_chain_10", "=q3=Heavy Timbermaw Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28463", "inv_belt_21", "=q3=Ironvine Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28461", "inv_chest_plate07", "=q3=Ironvine Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28462", "inv_gauntlets_29", "=q3=Ironvine Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27588", "inv_belt_16", "=q3=Light Obsidian Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57026", "inv_shoulder_13", "=q3=Mantle of Centaur Authority", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47021", "inv_boots_plate_05", "=q3=Rune-Etched Greaves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47022", "inv_pants_04", "=q3=Rune-Etched Legplates", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47023", "inv_chest_plate08", "=q3=Rune-Etched Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47024", "inv_helmet_06", "=q3=Rune-Etched Crown", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47025", "INV_Shoulder_11", "=q3=Rune-Etched Mantle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47026", "INV_Gauntlets_09", "=q3=Rune-Etched Grips", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27589", "inv_gauntlets_31", "=q4=Black Grasp of the Destroyer", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28244", "inv_bracer_07", "=q4=Icebane Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28242", "inv_chest_chain_11", "=q4=Icebane Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28243", "inv_gauntlets_28", "=q4=Icebane Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27586", "inv_shield_22", "=q4=Jagged Obsidian Shield", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27590", "inv_chest_chain_17", "=q4=Obsidian Mail Tunic", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27587", "inv_chest_chain_17", "=q4=Thick Obsidian Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingArtisan4 = {
		{ "s21161", "inv_hammer_unique_sulfuras", "=q4=Sulfuron Hammer", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s54009", "inv_chest_plate16", "=q4=Fiery Chain Breastplate", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s57196", "INV_Misc_Buckle_08", "=q3=Bloody Belt Buckle", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55526", "INV_Helmet_20", "=q3=Otherworldly Coif", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55527", "INV_Shoulder_14", "=q3=Otherworldly Spaulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55528", "INV_Chest_Chain_11", "=q3=Otherworldly Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55529", "INV_Pants_Mail_15", "=q3=Otherworldly Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55530", "INV_Helmet_20", "=q3=Reflective Helmet", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55531", "INV_Shoulder_16", "=q3=Reflective Pauldrons", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55532", "INV_Chest_Chain_11", "=q3=Reflective Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55533", "Inv_Pants_Mail_15", "=q3=Reflective Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57181", "INV_Misc_Buckle_07", "=q3=Dreamsteel Belt Buckle", "=ds=#sr# =so1=300 =so2=300 =so3=305 =so4=310" },
		{ "s45471", "INV_Boots_01", "=q4=Dreamsteel Boots", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s45469", "INV_Bracer_03", "=q4=Dreamsteel Bracers", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s45467", "INV_Pants_03", "=q4=Dreamsteel Leggings", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s45465", "inv_shoulder_13", "=q4=Dreamsteel Mantle", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	Armorsmith1 = {
		{ "s9954", "inv_gauntlets_29", "=q3=Truesilver Gauntlets", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s9974", "inv_chest_plate04", "=q3=Truesilver Breastplate", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s16650", "inv_chest_chain_12", "=q3=Wildthorn Mail", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s16667", "inv_chest_plate06", "=q3=Demon Forged Breastplate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s15296", "inv_chest_plate08", "=q3=Dark Iron Plate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s16655", "inv_gauntlets_03", "=q3=Fiery Plate Gauntlets", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s54003", "inv_belt_21", "=q3=Fury of the Timbermaw", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s16661", "inv_gauntlets_30", "=q3=Storm Gauntlets", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s20874", "inv_bracer_07", "=q4=Dark Iron Bracers", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s20872", "inv_belt_13", "=q4=Fiery Chain Girdle", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s16745", "inv_chest_plate10", "=q3=Enchanted Thorium Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16742", "inv_helmet_02", "=q3=Enchanted Thorium Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16744", "inv_pants_04", "=q3=Enchanted Thorium Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16728", "inv_helmet_24", "=q3=Helm of the Great Chief", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16724", "inv_helmet_13", "=q3=Whitesoul Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s54005", "inv_shoulder_02", "=q3=Pauldrons of the Timbermaw", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s24399", "inv_boots_chain_08", "=q4=Dark Iron Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23637", "inv_gauntlets_22", "=q4=Dark Iron Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23636", "inv_helmet_22", "=q4=Dark Iron Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20876", "inv_pants_04", "=q4=Dark Iron Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20873", "inv_shoulder_23", "=q4=Fiery Chain Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16746", "inv_chest_chain_07", "=q4=Invulnerable Mail", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16729", "inv_helmet_36", "=q4=Lionheart Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16741", "inv_gauntlets_30", "=q4=Stronghold Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27829", "inv_pants_04", "=q4=Titanic Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57189", "inv_chest_chain_09", "=q4=Towerforge Breastplate", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s57187", "inv_helmet_37", "=q4=Towerforge Crown", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s57191", "inv_shoulder_26", "=q4=Towerforge Pauldrons", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	Weaponsmith1 = {
		{ "s10003", "inv_hammer_18", "=q3=The Shatterer", "=ds=#sr# =so1=235 =so2=260 =so3=272 =so4=285" },
		{ "s10007", "inv_sword_40", "=q3=Phantom Blade", "=ds=#sr# =so1=245 =so2=270 =so3=282 =so4=295" },
		{ "s10011", "inv_spear_07", "=q3=Blight", "=ds=#sr# =so1=250 =so2=275 =so3=287 =so4=300" },
		{ "s10015", "inv_sword_19", "=q3=Truesilver Champion", "=ds=#sr# =so1=260 =so2=285 =so3=297 =so4=310" },
		{ "s15292", "inv_hammer_09", "=q3=Dark Iron Pulverizer", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s16965", "inv_axe_24", "=q3=Bleakwood Hew", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s15294", "inv_weapon_halberd_02", "=q3=Dark Iron Sunderer", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s16986", "inv_weapon_shortblade_27", "=q3=Blood Talon", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16987", "inv_spear_08", "=q3=Darkspear", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16995", "inv_sword_17", "=q3=Heartseeker", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23638", "inv_weapon_shortblade_12", "=q4=Black Amnesty", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23639", "inv_spear_08", "=q4=Blackfury", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46657", "inv-sword_53", "=q4=Ornate Bloodstone Dagger", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	Axesmith1 = {
		{ "s16970", "inv_axe_05", "=q3=Dawn's Edge", "=ds=#sr# =so1=275 =so2=300 =so3=312 =so4=325" },
		{ "s16991", "inv_axe_12", "=q3=Annihilator", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16994", "inv_axe_09", "=q3=Arcanite Reaper", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20897", "inv_axe_12", "=q4=Dark Iron Destroyer", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23653", "inv_axe_12", "=q4=Nightfall", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	Hammersmith1 = {
		{ "s16973", "inv_hammer_05", "=q3=Enchanted Battlehammer", "=ds=#sr# =so1=280 =so2=305 =so3=317 =so4=330" },
		{ "s16983", "inv_mace_02", "=q3=Serenity", "=ds=#sr# =so1=285 =so2=310 =so3=322 =so4=335" },
		{ "s16988", "inv_hammer_09", "=q3=Hammer of the Titans", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16993", "inv_hammer_04", "=q3=Masterwork Stormhammer", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23650", "inv_hammer_19", "=q4=Ebon Hand", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27830", "inv_hammer_08", "=q4=Persuader", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57193", "INV_Hammer_19", "=q4=Towerforge Demolisher", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s45487", "inv_mace_14", "=q4=Dawnstone Hammer", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	Swordsmith1 = {
		{ "s16978", "inv_sword_30", "=q3=Blazing Rapier", "=ds=#sr# =so1=280 =so2=305 =so3=317 =so4=330" },
		{ "s16985", "inv_sword_07", "=q3=Corruption", "=ds=#sr# =so1=290 =so2=315 =so3=327 =so4=340" },
		{ "s16990", "inv_sword_39", "=q3=Arcanite Champion", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46652", "INV_Sword_17", "=q3=Untempered Runeblade", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16992", "inv_sword_11", "=q3=Frostguard", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20890", "inv_sword_48", "=q4=Dark Iron Reaver", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23652", "inv_sword_39", "=q4=Blackguard", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27832", "inv_sword_51", "=q4=Sageblade", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46661", "inv_sword_31", "=q4=Dream's Herald", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingHelm1 = {
		{ "s3502", "inv_helmet_03", "=q2=Green Iron Helm", "=ds=#sr# =so1=170 =so2=195 =so3=207 =so4=220" },
		{ "s9814", "inv_helmet_25", "=q2=Barbaric Iron Helm", "=ds=#sr# =so1=175 =so2=200 =so3=212 =so4=225" },
		{ "s3503", "inv_helmet_36", "=q2=Golden Scale Coif", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s9980", "inv_helmet_10", "=q2=Ornate Mithril Helm", "=ds=#sr# =so1=210 =so2=265 =so3=275 =so4=285" },
		{ "s9935", "inv_helmet_03", "=q2=Steel Plate Helm", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s46631", "inv_helmet_25", "=q3=Steel Plate Barbute", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s9961", "inv_helmet_35", "=q2=Mithril Coif", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s9970", "inv_helmet_10", "=q2=Heavy Mithril Helm", "=ds=#sr# =so1=245 =so2=255 =so3=265 =so4=275" },
		{ "s16653", "inv_helmet_23", "=q2=Thorium Helm", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s47029", "inv_helmet_10", "=q3=Hateforge Helmet", "=ds=#sr# =so1=290 =so2=300 =so3=310 =so4=320" },
		{ "s16658", "inv_helmet_22", "=q2=Imperial Plate Helm", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s16726", "inv_helmet_03", "=q2=Runic Plate Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24913", "inv_helmet_10", "=q3=Darkrune Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47024", "inv_helmet_06", "=q3=Rune-Etched Crown", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16742", "inv_helmet_02", "=q3=Enchanted Thorium Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16728", "inv_helmet_24", "=q3=Helm of the Great Chief", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16724", "inv_helmet_13", "=q3=Whitesoul Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55526", "INV_Helmet_20", "=q3=Otherworldly Coif", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55530", "INV_Helmet_20", "=q3=Reflective Helmet", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23636", "inv_helmet_22", "=q4=Dark Iron Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16729", "inv_helmet_36", "=q4=Lionheart Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57187", "inv_helmet_37", "=q4=Towerforge Crown", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	SmithingShoulders1 = {
		{ "s3328", "inv_shoulder_05", "=q2=Rough Bronze Shoulders", "=ds=#sr# =so1=110 =so2=140 =so3=155 =so4=170" },
		{ "s3330", "inv_shoulder_09", "=q2=Silvered Bronze Shoulders", "=ds=#sr# =so1=125 =so2=155 =so3=170 =so4=185" },
		{ "s9811", "inv_shoulder_23", "=q2=Barbaric Iron Shoulders", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s3504", "inv_shoulder_09", "=q2=Green Iron Shoulders", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s3505", "inv_shoulder_09", "=q3=Golden Scale Shoulders", "=ds=#sr# =so1=175 =so2=200 =so3=212 =so4=225" },
		{ "s9926", "inv_shoulder_22", "=q2=Heavy Mithril Shoulder", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s9952", "inv_shoulder_09", "=q2=Ornate Mithril Shoulders", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s46630", "inv_shoulder_16", "=q2=Steel Plate Pauldrons", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s9966", "inv_shoulder_12", "=q3=Mithril Scale Shoulders", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s16646", "inv_shoulder_02", "=q2=Imperial Plate Shoulders", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s15295", "inv_shoulder_09", "=q2=Dark Iron Shoulders", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s16660", "inv_shoulder_20", "=q3=Dawnbringer Shoulders", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s16664", "inv_shoulder_23", "=q2=Runic Plate Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24137", "inv_shoulder_15", "=q3=Bloodsoul Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24141", "inv_shoulder_01", "=q3=Darksoul Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57026", "inv_shoulder_13", "=q3=Mantle of Centaur Authority", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47025", "INV_Shoulder_11", "=q3=Rune-Etched Mantle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s54005", "inv_shoulder_02", "=q3=Pauldrons of the Timbermaw", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s55527", "INV_Shoulder_14", "=q3=Otherworldly Spaulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55531", "INV_Shoulder_16", "=q3=Reflective Pauldrons", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20873", "inv_shoulder_23", "=q4=Fiery Chain Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57191", "inv_shoulder_26", "=q4=Towerforge Pauldrons", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s45465", "inv_shoulder_13", "=q4=Dreamsteel Mantle", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	SmithingChest1 = {
		{ "s12260", "inv_chest_chain", "=q1=Rough Copper Vest", "=ds=#sr# =so1=1 =so2=15 =so3=35 =so4=55" },
		{ "s3321", "inv_chest_chain", "=q2=Copper Chain Vest", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s2667", "inv_chest_plate03", "=q2=Runed Copper Breastplate", "=ds=#sr# =so1=80 =so2=120 =so3=140 =so4=160" },
		{ "s8367", "inv_chest_plate05", "=q2=Ironforge Breastplate", "=ds=#sr# =so1=100 =so2=140 =so3=160 =so4=180" },
		{ "s2670", "inv_chest_chain_08", "=q2=Rough Bronze Cuirass", "=ds=#sr# =so1=105 =so2=145 =so3=160 =so4=175" },
		{ "s2673", "inv_chest_chain_09", "=q2=Silvered Bronze Breastplate", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s2675", "inv_chest_plate15", "=q3=Shining Silver Breastplate", "=ds=#sr# =so1=145 =so2=175 =so3=190 =so4=205" },
		{ "s9813", "inv_chest_chain_14", "=q2=Barbaric Iron Breastplate", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s3508", "inv_chest_chain", "=q3=Green Iron Hauberk", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s3511", "inv_chest_chain_06", "=q2=Golden Scale Cuirass", "=ds=#sr# =so1=195 =so2=220 =so3=232 =so4=245" },
		{ "s9916", "inv_chest_plate05", "=q2=Steel Breastplate", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s9972", "inv_chest_plate10", "=q2=Ornate Mithril Breastplate", "=ds=#sr# =so1=210 =so2=260 =so3=270 =so4=280" },
		{ "s46629", "inv_chest_chain_10", "=q2=Steel Plate Armor", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
		{ "s9959", "inv_chest_plate10", "=q2=Heavy Mithril Breastplate", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s9974", "inv_chest_plate04", "=q3=Truesilver Breastplate", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s16642", "inv_chest_plate08", "=q2=Thorium Armor", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s15293", "inv_chest_chain_16", "=q2=Dark Iron Mail", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s16648", "inv_chest_plate16", "=q2=Radiant Breastplate", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s16650", "inv_chest_chain_12", "=q3=Wildthorn Mail", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s16667", "inv_chest_plate06", "=q3=Demon Forged Breastplate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s15296", "inv_chest_plate08", "=q3=Dark Iron Plate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s47030", "inv_chest_chain_09", "=q3=Hateforge Cuirass", "=ds=#sr# =so1=290 =so2=300 =so3=310 =so4=320" },
		{ "s16663", "inv_chest_plate10", "=q2=Imperial Plate Chest", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16731", "inv_chest_plate11", "=q2=Runic Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16745", "inv_chest_plate10", "=q3=Enchanted Thorium Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24136", "inv_chest_chain_14", "=q3=Bloodsoul Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24914", "inv_chest_plate06", "=q3=Darkrune Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24139", "inv_chest_plate08", "=q3=Darksoul Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28461", "inv_chest_plate07", "=q3=Ironvine Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47023", "inv_chest_plate08", "=q3=Rune-Etched Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingChest2 = {
		{ "s55528", "INV_Chest_Chain_11", "=q3=Otherworldly Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55532", "INV_Chest_Chain_11", "=q3=Reflective Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28242", "inv_chest_chain_11", "=q4=Icebane Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27590", "inv_chest_chain_17", "=q4=Obsidian Mail Tunic", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27587", "inv_chest_chain_17", "=q4=Thick Obsidian Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s54009", "inv_chest_plate16", "=q4=Fiery Chain Breastplate", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s16746", "inv_chest_chain_07", "=q4=Invulnerable Mail", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57189", "inv_chest_chain_09", "=q4=Towerforge Breastplate", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	SmithingBracers1 = {
		{ "s2663", "inv_bracer_03", "=q1=Copper Bracers", "=ds=#sr# =so1=1 =so2=20 =so3=40 =so4=60" },
		{ "s2664", "inv_bracer_03", "=q2=Runed Copper Bracers", "=ds=#sr# =so1=90 =so2=115 =so3=127 =so4=140" },
		{ "s2671", "inv_bracer_05", "=q2=Rough Bronze Bracers", "=ds=#sr# =so1=100 =so2=140 =so3=160 =so4=180" },
		{ "s2672", "inv_bracer_07", "=q2=Patterned Bronze Bracers", "=ds=#sr# =so1=120 =so2=150 =so3=165 =so4=180" },
		{ "s3501", "inv_bracer_06", "=q2=Green Iron Bracers", "=ds=#sr# =so1=165 =so2=190 =so3=202 =so4=215" },
		{ "s7223", "inv_bracer_10", "=q2=Golden Scale Bracers", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s9937", "inv_bracer_07", "=q2=Mithril Scale Bracers", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s16644", "inv_bracer_13", "=q2=Thorium Bracers", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s16649", "inv_bracer_19", "=q2=Imperial Plate Bracers", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s20874", "inv_bracer_07", "=q4=Dark Iron Bracers", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s28244", "inv_bracer_07", "=q4=Icebane Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45469", "INV_Bracer_03", "=q4=Dreamsteel Bracers", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	SmithingGloves1 = {
		{ "s3323", "inv_gauntlets_04", "=q2=Runed Copper Gauntlets", "=ds=#sr# =so1=40 =so2=80 =so3=100 =so4=120" },
		{ "s3325", "inv_gauntlets_05", "=q2=Gemmed Copper Gauntlets", "=ds=#sr# =so1=60 =so2=100 =so3=120 =so4=140" },
		{ "s3333", "inv_gauntlets_05", "=q2=Silvered Bronze Gauntlets", "=ds=#sr# =so1=135 =so2=165 =so3=180 =so4=195" },
		{ "s3336", "inv_gauntlets_05", "=q2=Green Iron Gauntlets", "=ds=#sr# =so1=150 =so2=180 =so3=195 =so4=210" },
		{ "s9820", "inv_gauntlets_31", "=q2=Barbaric Iron Gloves", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s11643", "inv_gauntlets_29", "=q2=Golden Scale Gauntlets", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s9928", "inv_gauntlets_27", "=q2=Heavy Mithril Gauntlet", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s9950", "inv_gauntlets_31", "=q2=Ornate Mithril Gloves", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s46627", "inv_gauntlets_31", "=q2=Steel Plate Gauntlets", "=ds=#sr# =so1=220 =so2=220 =so3=220 =so4=220" },
		{ "s9942", "inv_gauntlets_31", "=q2=Mithril Scale Gloves", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s9954", "inv_gauntlets_29", "=q3=Truesilver Gauntlets", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s47033", "inv_gauntlets_04", "=q4=Hateforge Grips", "=ds=#sr# =so1=285 =so2=300 =so3=310 =so4=320" },
		{ "s16654", "inv_gauntlets_26", "=q2=Radiant Gloves", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s16655", "inv_gauntlets_03", "=q3=Fiery Plate Gauntlets", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s16661", "inv_gauntlets_30", "=q3=Storm Gauntlets", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s24138", "inv_gauntlets_31", "=q3=Bloodsoul Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24912", "inv_gauntlets_27", "=q3=Darkrune Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23633", "inv_gauntlets_29", "=q3=Gloves of the Dawn", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28462", "inv_gauntlets_29", "=q3=Ironvine Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47026", "INV_Gauntlets_09", "=q3=Rune-Etched Grips", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27589", "inv_gauntlets_31", "=q4=Black Grasp of the Destroyer", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28243", "inv_gauntlets_28", "=q4=Icebane Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23637", "inv_gauntlets_22", "=q4=Dark Iron Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16741", "inv_gauntlets_30", "=q4=Stronghold Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingBelt1 = {
		{ "s2661", "inv_belt_02", "=q1=Copper Chain Belt", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s2666", "inv_belt_03", "=q2=Runed Copper Belt", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "s16643", "inv_belt_30", "=q2=Thorium Belt", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s16645", "inv_belt_11", "=q2=Radiant Belt", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s16647", "inv_belt_01", "=q2=Imperial Plate Belt", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s47032", "inv_belt_04", "=q3=Hateforge Belt", "=ds=#sr# =so1=275 =so2=300 =so3=312 =so4=325" },
		{ "s23632", "inv_belt_11", "=q3=Girdle of the Dawn", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s23628", "inv_belt_16", "=q3=Heavy Timbermaw Belt", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s27585", "inv_belt_16", "=q3=Heavy Obsidian Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28463", "inv_belt_21", "=q3=Ironvine Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27588", "inv_belt_16", "=q3=Light Obsidian Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s54003", "inv_belt_21", "=q3=Fury of the Timbermaw", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s20872", "inv_belt_13", "=q4=Fiery Chain Girdle", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
	},

	SmithingPants1 = {
		{ "s2662", "inv_pants_03", "=q1=Copper Chain Pants", "=ds=#sr# =so1=1 =so2=50 =so3=70 =so4=90" },
		{ "s3324", "inv_pants_03", "=q2=Runed Copper Pants", "=ds=#sr# =so1=45 =so2=85 =so3=105 =so4=125" },
		{ "s2668", "inv_pants_03", "=q2=Rough Bronze Leggings", "=ds=#sr# =so1=105 =so2=145 =so3=160 =so4=175" },
		{ "s3506", "inv_pants_05", "=q2=Green Iron Leggings", "=ds=#sr# =so1=155 =so2=180 =so3=192 =so4=205" },
		{ "s12259", "inv_pants_04", "=q2=Silvered Bronze Leggings", "=ds=#sr# =so1=155 =so2=180 =so3=192 =so4=205" },
		{ "s3507", "inv_pants_04", "=q2=Golden Scale Leggings", "=ds=#sr# =so1=170 =so2=195 =so3=207 =so4=220" },
		{ "s9933", "inv_pants_03", "=q2=Heavy Mithril Pants", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s9931", "inv_pants_03", "=q2=Mithril Scale Pants", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s9957", "inv_pants_03", "=q2=Orcish War Leggings", "=ds=#sr# =so1=210 =so2=250 =so3=260 =so4=270" },
		{ "s9945", "inv_pants_04", "=q2=Ornate Mithril Pants", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s46628", "inv_pants_04", "=q2=Steel Plate Legguards", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
		{ "s47031", "inv_pants_03", "=q3=Hateforge Leggings", "=ds=#sr# =so1=290 =so2=300 =so3=310 =so4=320" },
		{ "s16730", "inv_pants_04", "=q2=Imperial Plate Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16725", "inv_pants_03", "=q2=Radiant Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16732", "inv_pants_04", "=q2=Runic Plate Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16662", "inv_pants_04", "=q2=Thorium Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24140", "inv_pants_plate_21", "=q3=Darksoul Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47022", "inv_pants_04", "=q3=Rune-Etched Legplates", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s16744", "inv_pants_04", "=q3=Enchanted Thorium Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55529", "INV_Pants_Mail_15", "=q3=Otherworldly Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55533", "Inv_Pants_Mail_15", "=q3=Reflective Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45467", "INV_Pants_03", "=q4=Dreamsteel Leggings", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s20876", "inv_pants_04", "=q4=Dark Iron Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27829", "inv_pants_04", "=q4=Titanic Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingBoots1 = {
		{ "s3319", "inv_boots_01", "=q1=Copper Chain Boots", "=ds=#sr# =so1=20 =so2=60 =so3=80 =so4=100" },
		{ "s7817", "inv_boots_01", "=q2=Rough Bronze Boots", "=ds=#sr# =so1=95 =so2=125 =so3=140 =so4=155" },
		{ "s3331", "inv_boots_01", "=q2=Silvered Bronze Boots", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s3334", "inv_boots_01", "=q2=Green Iron Boots", "=ds=#sr# =so1=145 =so2=175 =so3=190 =so4=205" },
		{ "s9818", "inv_boots_plate_01", "=q2=Barbaric Iron Boots", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s3513", "inv_boots_01", "=q2=Polished Steel Boots", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s3515", "inv_boots_01", "=q3=Golden Scale Boots", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s9979", "inv_boots_01", "=q2=Ornate Mithril Boots", "=ds=#sr# =so1=210 =so2=265 =so3=275 =so4=285" },
		{ "s46626", "inv_boots_plate_01", "=q2=Steel Plate Boots", "=ds=#sr# =so1=220 =so2=220 =so3=220 =so4=220" },
		{ "s9968", "inv_boots_plate_01", "=q2=Heavy Mithril Boots", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s47034", "inv_boots_01", "=q3=Hateforge Boots", "=ds=#sr# =so1=275 =so2=300 =so3=310 =so4=320" },
		{ "s16652", "inv_boots_plate_08", "=q2=Thorium Boots", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s16656", "inv_boots_plate_03", "=q2=Radiant Boots", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s16657", "inv_boots_plate_01", "=q2=Imperial Plate Boots", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s16665", "inv_boots_plate_01", "=q2=Runic Plate Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23629", "inv_boots_chain_10", "=q3=Heavy Timbermaw Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47021", "inv_boots_plate_05", "=q3=Rune-Etched Greaves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45471", "INV_Boots_01", "=q4=Dreamsteel Boots", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s24399", "inv_boots_chain_08", "=q4=Dark Iron Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingAxes1 = {
		{ "s2738", "inv_axe_23", "=q1=Copper Axe", "=ds=#sr# =so1=20 =so2=60 =so3=80 =so4=100" },
		{ "s3294", "inv_throwingaxe_01", "=q2=Thick War Axe", "=ds=#sr# =so1=70 =so2=110 =so3=130 =so4=150" },
		{ "s2741", "inv_axe_17", "=q1=Bronze Axe", "=ds=#sr# =so1=115 =so2=145 =so3=160 =so4=175" },
		{ "s21913", "inv_axe_06", "=q2=Edge of Winter", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s9993", "inv_axe_14", "=q2=Heavy Mithril Axe", "=ds=#sr# =so1=210 =so2=235 =so3=247 =so4=260" },
		{ "s9995", "inv_axe_03", "=q2=Blue Glittering Axe", "=ds=#sr# =so1=220 =so2=245 =so3=257 =so4=270" },
		{ "s16969", "inv_axe_12", "=q2=Ornate Thorium Handaxe", "=ds=#sr# =so1=275 =so2=300 =so3=312 =so4=325" },
		{ "s16970", "inv_axe_05", "=q3=Dawn's Edge", "=ds=#sr# =so1=275 =so2=300 =so3=312 =so4=325" },
		{ "s16991", "inv_axe_12", "=q3=Annihilator", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20897", "inv_axe_12", "=q4=Dark Iron Destroyer", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "", "", ""},
		{ "", "", ""},
		{ "", "", ""},
		{ "", "", ""},
		{ "", "", ""},
		{ "s3293", "inv_throwingaxe_02", "=q2=Copper Battle Axe", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s9987", "inv_axe_21", "=q1=Bronze Battle Axe", "=ds=#sr# =so1=135 =so2=165 =so3=180 =so4=195" },
		{ "s3498", "inv_throwingaxe_05", "=q2=Massive Iron Axe", "=ds=#sr# =so1=185 =so2=210 =so3=222 =so4=235" },
		{ "s3500", "inv_axe_17", "=q2=Shadow Crescent Axe", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s16971", "inv_weapon_halberd_11", "=q2=Huge Thorium Battleaxe", "=ds=#sr# =so1=280 =so2=305 =so3=317 =so4=330" },
		{ "s16965", "inv_axe_24", "=q3=Bleakwood Hew", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s16994", "inv_axe_09", "=q3=Arcanite Reaper", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23653", "inv_axe_12", "=q4=Nightfall", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingSwords1 = {
		{ "s2739", "inv_sword_26", "=q1=Copper Shortsword", "=ds=#sr# =so1=25 =so2=65 =so3=85 =so4=105" },
		{ "s2742", "inv_sword_04", "=q1=Bronze Shortsword", "=ds=#sr# =so1=120 =so2=150 =so3=165 =so4=180" },
		{ "s3492", "inv_sword_20", "=q2=Hardened Iron Shortsword", "=ds=#sr# =so1=160 =so2=185 =so3=197 =so4=210" },
		{ "s3493", "inv_sword_36", "=q2=Jade Serpentblade", "=ds=#sr# =so1=175 =so2=200 =so3=212 =so4=225" },
		{ "s9997", "inv_sword_10", "=q2=Wicked Mithril Blade", "=ds=#sr# =so1=225 =so2=250 =so3=262 =so4=275" },
		{ "s10005", "inv_sword_30", "=q2=Dazzling Mithril Rapier", "=ds=#sr# =so1=240 =so2=265 =so3=277 =so4=290" },
		{ "s10007", "inv_sword_40", "=q3=Phantom Blade", "=ds=#sr# =so1=245 =so2=270 =so3=282 =so4=295" },
		{ "s16978", "inv_sword_30", "=q3=Blazing Rapier", "=ds=#sr# =so1=280 =so2=305 =so3=317 =so4=330" },
		{ "s16992", "inv_sword_11", "=q3=Frostguard", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20890", "inv_sword_48", "=q4=Dark Iron Reaver", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23652", "inv_sword_39", "=q4=Blackguard", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27832", "inv_sword_51", "=q4=Sageblade", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46661", "inv_sword_31", "=q4=Dream's Herald", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "", "", ""},
		{ "", "", ""},
		{ "s9983", "inv_sword_21", "=q1=Copper Claymore", "=ds=#sr# =so1=30 =so2=70 =so3=90 =so4=110" },
		{ "s3292", "inv_sword_14", "=q2=Heavy Copper Broadsword", "=ds=#sr# =so1=95 =so2=135 =so3=155 =so4=175" },
		{ "s9986", "inv_sword_20", "=q1=Bronze Greatsword", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s3496", "inv_sword_25", "=q2=Moonsteel Broadsword", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s3497", "inv_sword_05", "=q2=Frost Tiger Blade", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s10015", "inv_sword_19", "=q3=Truesilver Champion", "=ds=#sr# =so1=260 =so2=285 =so3=297 =so4=310" },
		{ "s16985", "inv_sword_07", "=q3=Corruption", "=ds=#sr# =so1=290 =so2=315 =so3=327 =so4=340" },
		{ "s16990", "inv_sword_39", "=q3=Arcanite Champion", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46652", "INV_Sword_17", "=q3=Untempered Runeblade", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingMaces1 = {
		{ "s2737", "inv_mace_01", "=q1=Copper Mace", "=ds=#sr# =so1=15 =so2=55 =so3=75 =so4=95" },
		{ "s2740", "inv_mace_08", "=q1=Bronze Mace", "=ds=#sr# =so1=110 =so2=140 =so3=155 =so4=170" },
		{ "s3296", "inv_mace_08", "=q2=Heavy Bronze Mace", "=ds=#sr# =so1=130 =so2=160 =so3=175 =so4=190" },
		{ "s6518", "inv_hammer_05", "=q2=Iridescent Hammer", "=ds=#sr# =so1=140 =so2=170 =so3=185 =so4=200" },
		{ "s3297", "inv_hammer_04", "=q2=Mighty Iron Hammer", "=ds=#sr# =so1=145 =so2=175 =so3=190 =so4=205" },
		{ "s10001", "inv_mace_15", "=q2=Big Black Mace", "=ds=#sr# =so1=230 =so2=255 =so3=267 =so4=280" },
		{ "s10009", "inv_hammer_17", "=q3=Runed Mithril Hammer", "=ds=#sr# =so1=245 =so2=270 =so3=282 =so4=295" },
		{ "s16984", "inv_hammer_06", "=q2=Volcanic Hammer", "=ds=#sr# =so1=290 =so2=315 =so3=327 =so4=340" },
		{ "s10003", "inv_hammer_18", "=q3=The Shatterer", "=ds=#sr# =so1=235 =so2=260 =so3=272 =so4=285" },
		{ "s16983", "inv_mace_02", "=q3=Serenity", "=ds=#sr# =so1=285 =so2=310 =so3=322 =so4=335" },
		{ "s16993", "inv_hammer_04", "=q3=Masterwork Stormhammer", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23650", "inv_hammer_19", "=q4=Ebon Hand", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s27830", "inv_hammer_08", "=q4=Persuader", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "", "", ""},
		{ "", "", ""},
		{ "s7408", "inv_hammer_18", "=q1=Heavy Copper Maul", "=ds=#sr# =so1=65 =so2=105 =so3=125 =so4=145" },
		{ "s9985", "inv_hammer_18", "=q1=Bronze Warhammer", "=ds=#sr# =so1=125 =so2=155 =so3=170 =so4=185" },
		{ "s3494", "inv_hammer_07", "=q2=Solid Iron Maul", "=ds=#sr# =so1=155 =so2=180 =so3=192 =so4=205" },
		{ "s3495", "inv_hammer_04", "=q2=Golden Iron Destroyer", "=ds=#sr# =so1=170 =so2=195 =so3=207 =so4=220" },
		{ "s15292", "inv_hammer_09", "=q3=Dark Iron Pulverizer", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s16973", "inv_hammer_05", "=q3=Enchanted Battlehammer", "=ds=#sr# =so1=280 =so2=305 =so3=317 =so4=330" },
		{ "s16988", "inv_hammer_09", "=q3=Hammer of the Titans", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57193", "INV_Hammer_19", "=q4=Towerforge Demolisher", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s45487", "inv_mace_14", "=q4=Dawnstone Hammer", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
		{ "s21161", "inv_hammer_unique_sulfuras", "=q4=Sulfuron Hammer", "=ds=#sr# =so1=300 =so2=325 =so3=337 =so4=350" },
	},

	SmithingFist1 = {
		{ "s46663", "inv_gauntlets_11", "=q1=Copper Knuckles", "=ds=#sr# =so1=30 =so2=60 =so3=62 =so4=65" },
		{ "s46664", "inv_misc_monsterclaw_01", "=q2=Sharpened Claw", "=ds=#sr# =so1=75 =so2=90 =so3=95 =so4=100" },
		{ "s46665", "inv_gauntlets_11", "=q2=Bronze Bruiser", "=ds=#sr# =so1=120 =so2=140 =so3=145 =so4=150" },
		{ "s16986", "inv_weapon_shortblade_27", "=q3=Blood Talon", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingDaggers1 = {
		{ "s8880", "inv_weapon_shortblade_14", "=q1=Copper Dagger", "=ds=#sr# =so1=30 =so2=70 =so3=90 =so4=110" },
		{ "s3491", "inv_weapon_shortblade_04", "=q2=Big Bronze Knife", "=ds=#sr# =so1=105 =so2=135 =so3=150 =so4=165" },
		{ "s6517", "inv_weapon_shortblade_05", "=q2=Pearl-handled Dagger", "=ds=#sr# =so1=110 =so2=140 =so3=155 =so4=170" },
		{ "s3295", "inv_weapon_shortblade_05", "=q2=Deadly Bronze Poniard", "=ds=#sr# =so1=125 =so2=155 =so3=170 =so4=185" },
		{ "s15972", "inv_weapon_shortblade_05", "=q2=Glinting Steel Dagger", "=ds=#sr# =so1=180 =so2=205 =so3=217 =so4=230" },
		{ "s15973", "inv_weapon_shortblade_05", "=q2=Searing Golden Blade", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s10013", "inv_weapon_shortblade_14", "=q2=Ebon Shiv", "=ds=#sr# =so1=255 =so2=280 =so3=292 =so4=305" },
		{ "s16995", "inv_sword_17", "=q3=Heartseeker", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23638", "inv_weapon_shortblade_12", "=q4=Black Amnesty", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46657", "inv-sword_53", "=q4=Ornate Bloodstone Dagger", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	SmithingBuckles1 = {
		{ "s57163", "INV_Misc_Buckle_01", "=q2=Copper Belt Buckle", "=ds=#sr# =so1=25 =so2=25 =so3=37 =so4=50" },
		{ "s57166", "INV_Misc_Buckle_02", "=q2=Bronze Belt Buckle", "=ds=#sr# =so1=90 =so2=90 =so3=97 =so4=105" },
		{ "s57169", "INV_Misc_Buckle_03", "=q2=Iron Belt Buckle", "=ds=#sr# =so1=140 =so2=140 =so3=147 =so4=155" },
		{ "s57172", "INV_Misc_Buckle_04", "=q2=Mithril Belt Buckle", "=ds=#sr# =so1=185 =so2=190 =so3=197 =so4=205" },
		{ "s57175", "INV_Misc_Buckle_05", "=q2=Thorium Belt Buckle", "=ds=#sr# =so1=240 =so2=240 =so3=247 =so4=255" },
		{ "s57178", "INV_Misc_Buckle_06", "=q2=Arcanite Belt Buckle", "=ds=#sr# =so1=275 =so2=275 =so3=282 =so4=290" },
		{ "s57196", "INV_Misc_Buckle_08", "=q3=Bloody Belt Buckle", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57181", "INV_Misc_Buckle_07", "=q3=Dreamsteel Belt Buckle", "=ds=#sr# =so1=300 =so2=300 =so3=305 =so4=310" },
	},

	SmithingMisc1 = {
		{ "s2660", "inv_stone_sharpeningstone_01", "=q1=Rough Sharpening Stone", "=ds=#sr# =so1=1 =so2=15 =so3=35 =so4=55" },
		{ "s2665", "inv_stone_sharpeningstone_02", "=q1=Coarse Sharpening Stone", "=ds=#sr# =so1=65 =so2=65 =so3=72 =so4=80" },
		{ "s2674", "inv_stone_sharpeningstone_03", "=q1=Heavy Sharpening Stone", "=ds=#sr# =so1=125 =so2=125 =so3=132 =so4=140" },
		{ "s9918", "inv_stone_sharpeningstone_04", "=q1=Solid Sharpening Stone", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s16641", "inv_stone_sharpeningstone_05", "=q1=Dense Sharpening Stone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "", "", ""},
		{ "s3115", "inv_stone_weightstone_01", "=q1=Rough Weightstone", "=ds=#sr# =so1=1 =so2=15 =so3=35 =so4=55" },
		{ "s3116", "inv_stone_weightstone_02", "=q1=Coarse Weightstone", "=ds=#sr# =so1=65 =so2=65 =so3=72 =so4=80" },
		{ "s3117", "inv_stone_weightstone_03", "=q1=Heavy Weightstone", "=ds=#sr# =so1=125 =so2=125 =so3=132 =so4=140" },
		{ "s9921", "inv_stone_weightstone_04", "=q1=Solid Weightstone", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s16640", "inv_stone_weightstone_05", "=q1=Dense Weightstone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "", "", ""},
		{ "s22757", "inv_stone_02", "=q2=Elemental Sharpening Stone", "=ds=#sr# =so1=300 =so2=300 =so3=310 =so4=320" },
		{ "", "", ""},
		{ "", "", ""},
		{ "s9964", "ability_rogue_sprint", "=q2=Mithril Spurs", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s57113", "inv_boots_plate_05", "=q2=Thorium Spurs",  "=ds=#sr# =so1=275 =so2=300 =so3=310 =so4=320" },
		{ "", "", ""},
		{ "s7221", "inv_misc_armorkit_01", "=q1=Iron Shield Spike", "=ds=#sr# =so1=150 =so2=180 =so3=195 =so4=210" },
		{ "s9939", "inv_misc_armorkit_02", "=q2=Mithril Shield Spike", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s16651", "inv_misc_armorkit_20", "=q2=Thorium Shield Spike", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "", "", ""},
		{ "s45063", "INV_Shield_09", "=q2=Blast Shield", "=ds=#sr# =so1=75 =so2=100 =so3=120 =so4=140" },
		{ "s27586", "inv_shield_22", "=q4=Jagged Obsidian Shield", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "", "", ""},
		{ "s7222", "inv_misc_orb_01", "=q1=Iron Counterweight", "=ds=#sr# =so1=165 =so2=190 =so3=202 =so4=215" },
		{ "s7224", "spell_frost_chainsofice", "=q1=Steel Weapon Chain", "=ds=#sr# =so1=190 =so2=215 =so3=227 =so4=240" },
		{ "s8768", "inv_misc_armorkit_12", "=q1=Iron Buckle", "=ds=#sr# =so1=150 =so2=150 =so3=152 =so4=155" },
		{ "s11454", "inv_musket_01", "=q1=Inlaid Mithril Cylinder", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
	},

	SmithingMisc2 = {
		{ "s19666", "inv_misc_key_03", "=q2=Silver Skeleton Key", "=ds=#sr# =so1=100 =so2=100 =so3=110 =so4=120" },
		{ "s19667", "inv_misc_key_13", "=q2=Golden Skeleton Key", "=ds=#sr# =so1=150 =so2=150 =so3=160 =so4=170" },
		{ "s19668", "inv_misc_key_11", "=q2=Truesilver Skeleton Key", "=ds=#sr# =so1=200 =so2=200 =so3=210 =so4=220" },
		{ "s19669", "inv_misc_key_08", "=q2=Arcanite Skeleton Key", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "", "", ""},
		{ "s3320", "inv_stone_grindingstone_01", "=q1=Rough Grinding Stone", "=ds=#sr# =so1=25 =so2=45 =so3=65 =so4=85" },
		{ "s3326", "inv_stone_grindingstone_02", "=q1=Coarse Grinding Stone", "=ds=#sr# =so1=75 =so2=75 =so3=87 =so4=100" },
		{ "s3337", "inv_stone_grindingstone_03", "=q1=Heavy Grinding Stone", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s9920", "inv_stone_grindingstone_04", "=q1=Solid Grinding Stone", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s16639", "inv_stone_grindingstone_05", "=q1=Dense Grinding Stone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "", "", ""},
		{ "", "", ""},
		{ "", "", ""},
		{ "", "", ""},
		{ "", "", ""},
		{ "s7818", "inv_staff_01", "=q1=Silver Rod", "=ds=#sr# =so1=100 =so2=105 =so3=107 =so4=110" },
		{ "s14379", "inv_staff_10", "=q1=Golden Rod", "=ds=#sr# =so1=150 =so2=155 =so3=157 =so4=160" },
		{ "s14380", "inv_staff_11", "=q1=Truesilver Rod", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s20201", "inv_staff_19", "=q1=Arcanite Rod", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
	},

	LeatherApprentice1 = {
		{ "s2881", "inv_misc_leatherscrap_03", "=q1=Light Leather", "=ds=#sr# =so1=1 =so2=20 =so3=30 =so4=40" },
		{ "s2152", "inv_misc_armorkit_17", "=q1=Light Armor Kit", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ "s2149", "inv_boots_04", "=q1=Handstitched Leather Boots", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s9059", "inv_bracer_08", "=q1=Handstitched Leather Bracers", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s9058", "inv_helmet_48", "=q1=Handstitched Leather Cloak", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s7126", "inv_chest_wolf", "=q1=Handstitched Leather Vest", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s2153", "inv_pants_wolf", "=q1=Handstitched Leather Pants", "=ds=#sr# =so1=15 =so2=45 =so3=60 =so4=75" },
		{ "s3753", "inv_belt_04", "=q1=Handstitched Leather Belt", "=ds=#sr# =so1=25 =so2=55 =so3=70 =so4=85" },
		{ "s9060", "inv_misc_quiver_01", "=q1=Light Leather Quiver", "=ds=#sr# =so1=30 =so2=60 =so3=75 =so4=90" },
		{ "s9062", "inv_misc_ammo_bullet_01", "=q1=Small Leather Ammo Pouch", "=ds=#sr# =so1=30 =so2=60 =so3=75 =so4=90" },
		{ "s3816", "inv_misc_pelt_wolf_01", "=q1=Cured Light Hide", "=ds=#sr# =so1=35 =so2=55 =so3=65 =so4=75" },
		{ "s9064", "inv_pants_02", "=q2=Rugged Leather Pants", "=ds=#sr# =so1=35 =so2=65 =so3=80 =so4=95" },
		{ "s5244", "inv_misc_bag_10", "=q1=Kodo Hide Bag", "=ds=#sr# =so1=40 =so2=70 =so3=85 =so4=100" },
		{ "s2160", "inv_chest_leather_09", "=q2=Embossed Leather Vest", "=ds=#sr# =so1=40 =so2=70 =so3=85 =so4=100" },
		{ "s3756", "inv_gauntlets_05", "=q1=Embossed Leather Gloves", "=ds=#sr# =so1=55 =so2=85 =so3=100 =so4=115" },
		{ "s2161", "inv_boots_05", "=q2=Embossed Leather Boots", "=ds=#sr# =so1=55 =so2=85 =so3=100 =so4=115" },
		{ "s2162", "inv_helmet_48", "=q1=Embossed Leather Cloak", "=ds=#sr# =so1=60 =so2=90 =so3=105 =so4=120" },
		{ "s2163", "inv_chest_wolf", "=q1=White Leather Jerkin", "=ds=#sr# =so1=60 =so2=90 =so3=105 =so4=120" },
		{ "s9065", "inv_bracer_04", "=q1=Light Leather Bracers", "=ds=#sr# =so1=70 =so2=100 =so3=115 =so4=130" },
		{ "s3759", "inv_pants_02", "=q2=Embossed Leather Pants", "=ds=#sr# =so1=75 =so2=105 =so3=120 =so4=135" },
		{ "s2164", "inv_gauntlets_05", "=q2=Fine Leather Gloves", "=ds=#sr# =so1=75 =so2=105 =so3=120 =so4=135" },
		{ "s45069", "INV_Boots_06", "=q2=Lynxstep Boots", "=ds=#sr# =so1=75 =so2=105 =so3=120 =so4=135" },
	},

	LeatherJourneyman1 = {
		{ "s3763", "inv_belt_04", "=q2=Fine Leather Belt", "=ds=#sr# =so1=80 =so2=110 =so3=125 =so4=140" },
		{ "s2159", "inv_misc_cape_10", "=q2=Fine Leather Cloak", "=ds=#sr# =so1=85 =so2=105 =so3=120 =so4=135" },
		{ "s3761", "inv_chest_leather_09", "=q2=Fine Leather Tunic", "=ds=#sr# =so1=85 =so2=115 =so3=130 =so4=145" },
		{ "s8322", "inv_chest_leather_09", "=q2=Moonglow Vest", "=ds=#sr# =so1=90 =so2=115 =so3=130 =so4=145" },
		{ "s2158", "inv_boots_06", "=q2=Fine Leather Boots", "=ds=#sr# =so1=90 =so2=120 =so3=135 =so4=150" },
		{ "s7953", "inv_misc_monsterscales_03", "=q2=Deviate Scale Cloak", "=ds=#sr# =so1=90 =so2=120 =so3=135 =so4=150" },
		{ "s6702", "inv_belt_02", "=q2=Murloc Scale Belt", "=ds=#sr# =so1=90 =so2=120 =so3=135 =so4=150" },
		{ "s9068", "inv_pants_02", "=q2=Light Leather Pants", "=ds=#sr# =so1=95 =so2=125 =so3=140 =so4=155" },
		{ "s6703", "inv_chest_chain_12", "=q2=Murloc Scale Breastplate", "=ds=#sr# =so1=95 =so2=125 =so3=140 =so4=155" },
		{ "s20648", "inv_misc_leatherscrap_05", "=q1=Medium Leather", "=ds=#sr# =so1=100 =so2=100 =so3=105 =so4=110" },
		{ "s3817", "inv_misc_pelt_bear_02", "=q1=Cured Medium Hide", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s2165", "inv_misc_armorkit_15", "=q1=Medium Armor Kit", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s2167", "inv_boots_05", "=q2=Dark Leather Boots", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s9070", "inv_misc_monsterscales_03", "=q2=Black Whelp Cloak", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s24940", "inv_chest_cloth_45", "=q2=Black Whelp Tunic", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s2169", "inv_chest_leather_03", "=q2=Dark Leather Tunic", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s3762", "inv_chest_leather_10", "=q2=Hillman's Leather Vest", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s7954", "inv_gauntlets_05", "=q2=Deviate Scale Gloves", "=ds=#sr# =so1=105 =so2=130 =so3=142 =so4=155" },
		{ "s7133", "inv_pants_02", "=q2=Fine Leather Pants", "=ds=#sr# =so1=105 =so2=130 =so3=142 =so4=155" },
		{ "s2168", "inv_misc_cape_10", "=q2=Dark Leather Cloak", "=ds=#sr# =so1=110 =so2=135 =so3=147 =so4=160" },
		{ "s7135", "inv_pants_09", "=q2=Dark Leather Pants", "=ds=#sr# =so1=115 =so2=140 =so3=152 =so4=165" },
		{ "s7955", "inv_belt_09", "=q3=Deviate Scale Belt", "=ds=#sr# =so1=115 =so2=140 =so3=152 =so4=165" },
		{ "s2166", "inv_chest_leather_10", "=q2=Toughened Leather Armor", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3767", "inv_belt_06", "=q2=Hillman's Belt", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s9074", "inv_gauntlets_05", "=q2=Nimble Leather Gloves", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s9072", "inv_gauntlets_05", "=q2=Red Whelp Gloves", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3765", "inv_gauntlets_05", "=q2=Dark Leather Gloves", "=ds=#sr# =so1=120 =so2=155 =so3=167 =so4=180" },
		{ "s3766", "inv_belt_03", "=q2=Dark Leather Belt", "=ds=#sr# =so1=125 =so2=150 =so3=162 =so4=175" },
		{ "s9145", "inv_gauntlets_05", "=q2=Fletcher's Gloves", "=ds=#sr# =so1=125 =so2=150 =so3=162 =so4=175" },
		{ "s3768", "inv_shoulder_08", "=q2=Hillman's Shoulders", "=ds=#sr# =so1=130 =so2=155 =so3=167 =so4=180" },
	},

	LeatherJourneyman2 = {
		{ "s9147", "inv_shoulder_06", "=q2=Earthen Leather Shoulders", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s9146", "inv_gauntlets_18", "=q2=Herbalist's Gloves", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s3770", "inv_gauntlets_24", "=q3=Toughened Leather Gloves", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s3769", "inv_shoulder_12", "=q2=Dark Leather Shoulders", "=ds=#sr# =so1=140 =so2=165 =so3=177 =so4=190" },
		{ "s9148", "inv_gauntlets_05", "=q2=Pilferer's Gloves", "=ds=#sr# =so1=140 =so2=165 =so3=177 =so4=190" },
		{ "s9149", "inv_gauntlets_23", "=q2=Heavy Earthen Gloves", "=ds=#sr# =so1=145 =so2=170 =so3=182 =so4=195" },
		{ "s3764", "inv_gauntlets_05", "=q2=Hillman's Leather Gloves", "=ds=#sr# =so1=145 =so2=170 =so3=182 =so4=195" },
		{ "s20649", "inv_misc_leatherscrap_07", "=q1=Heavy Leather", "=ds=#sr# =so1=150 =so2=150 =so3=155 =so4=160" },
		{ "s23190", "inv_misc_throwingball_01", "=q1=Heavy Leather Ball", "=ds=#sr# =so1=150 =so2=150 =so3=155 =so4=160" },
		{ "s3818", "inv_misc_pelt_wolf_02", "=q1=Cured Heavy Hide", "=ds=#sr# =so1=150 =so2=160 =so3=165 =so4=170" },
		{ "s3760", "inv_misc_cape_07", "=q1=Hillman's Cloak", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s3771", "inv_gauntlets_05", "=q2=Barbaric Gloves", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s9194", "inv_misc_bag_09", "=q2=Heavy Leather Ammo Pouch", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s9193", "inv_misc_quiver_02", "=q2=Heavy Quiver", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s3780", "inv_misc_armorkit_16", "=q1=Heavy Armor Kit", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
	},

	LeatherExpert1 = {
		{ "s3772", "inv_chest_leather_08", "=q2=Green Leather Armor", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s23399", "inv_bracer_15", "=q3=Barbaric Bracers", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s3774", "inv_belt_17", "=q2=Green Leather Belt", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s7147", "inv_pants_02", "=q2=Guardian Pants", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s9195", "inv_pants_07", "=q2=Dusky Leather Leggings", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s4097", "inv_belt_02", "=q2=Raptor Hide Belt", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s4096", "inv_chest_leather_04", "=q2=Raptor Hide Harness", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s7149", "inv_pants_12", "=q2=Barbaric Leggings", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s3775", "inv_belt_03", "=q3=Guardian Belt", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s6704", "inv_chest_chain_12", "=q2=Thick Murloc Armor", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s7151", "inv_shoulder_08", "=q2=Barbaric Shoulders", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s9196", "inv_chest_leather_03", "=q2=Dusky Leather Armor", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s9197", "inv_chest_chain_09", "=q2=Green Whelp Armor", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s3773", "inv_chest_leather_08", "=q2=Guardian Armor", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s9198", "inv_misc_cape_04", "=q2=Frost Leather Cloak", "=ds=#sr# =so1=180 =so2=200 =so3=210 =so4=220" },
		{ "s3776", "inv_bracer_12", "=q2=Green Leather Bracers", "=ds=#sr# =so1=180 =so2=200 =so3=210 =so4=220" },
		{ "s9201", "inv_bracer_07", "=q2=Dusky Bracers", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s7153", "inv_misc_cape_03", "=q2=Guardian Cloak", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s3778", "inv_belt_01", "=q3=Gem-studded Leather Belt", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s6661", "inv_chest_leather_04", "=q2=Barbaric Harness", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s7156", "inv_gauntlets_05", "=q2=Guardian Gloves", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s21943", "inv_gauntlets_21", "=q2=Gloves of the Greatfather", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s9202", "inv_bracer_06", "=q2=Green Whelp Bracers", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s6705", "inv_bracer_05", "=q2=Murloc Scale Bracers", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s9206", "inv_belt_06", "=q2=Dusky Belt", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s3777", "inv_bracer_10", "=q2=Guardian Leather Bracers", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s10482", "inv_misc_pelt_bear_01", "=q1=Cured Thick Hide", "=ds=#sr# =so1=200 =so2=200 =so3=200 =so4=200" },
		{ "s20650", "inv_misc_leatherscrap_08", "=q1=Thick Leather", "=ds=#sr# =so1=200 =so2=200 =so3=202 =so4=205" },
		{ "s22711", "inv_gauntlets_32", "=q3=Shadowskin Gloves", "=ds=#sr# =so1=200 =so2=210 =so3=220 =so4=230" },
		{ "s10487", "inv_misc_armorkit_07", "=q1=Thick Armor Kit", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
	},

	LeatherExpert2 = {
		{ "s46620", "inv_boots_05", "=q2=Grifter's Boots", "=ds=#sr# =so1=200 =so2=215 =so3=220 =so4=225" },
		{ "s46621", "inv_gauntlets_15", "=q2=Grifter's Gauntlets", "=ds=#sr# =so1=200 =so2=215 =so3=220 =so4=225" },
		{ "s46622", "inv_belt_04", "=q2=Grifter's Belt", "=ds=#sr# =so1=200 =so2=215 =so3=220 =so4=225" },
		{ "s3779", "inv_belt_09", "=q3=Barbaric Belt", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s10490", "inv_helmet_15", "=q3=Comfortable Leather Hat", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s9207", "inv_boots_07", "=q3=Dusky Boots", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s9208", "inv_boots_08", "=q2=Swift Boots", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s46623", "inv_pants_12", "=q2=Grifter's Leggings", "=ds=#sr# =so1=205 =so2=225 =so3=230 =so4=235" },
		{ "s10507", "inv_belt_24", "=q2=Nightscape Headband", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s10499", "inv_chest_leather_03", "=q2=Nightscape Tunic", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s10509", "inv_gauntlets_05", "=q2=Turtle Scale Gloves", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s46625", "inv_helmet_33", "=q2=Grifter's Cover", "=ds=#sr# =so1=210 =so2=225 =so3=230 =so4=235" },
		{ "s46624", "inv_chest_leather_08", "=q2=Grifter's Tunic", "=ds=#sr# =so1=210 =so2=235 =so3=240 =so4=245" },
		{ "s10516", "inv_shoulder_07", "=q2=Nightscape Shoulders", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s10518", "inv_bracer_06", "=q2=Turtle Scale Bracers", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s10511", "inv_chest_chain_12", "=q2=Turtle Scale Breastplate", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s10520", "inv_chest_cloth_25", "=q2=Big Voodoo Robe", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s10531", "inv_banner_01", "=q2=Big Voodoo Mask", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s10533", "inv_bracer_09", "=q2=Tough Scorpid Bracers", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s10525", "inv_chest_leather_02", "=q2=Tough Scorpid Breastplate", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s10529", "inv_shoulder_18", "=q2=Wild Leather Shoulders", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s14930", "inv_misc_quiver_07", "=q2=Quickdraw Quiver", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s14932", "inv_misc_bag_09_black", "=q2=Thick Leather Ammo Pouch", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10542", "inv_gauntlets_24", "=q2=Tough Scorpid Gloves", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10546", "inv_helmet_10", "=q2=Wild Leather Helmet", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10544", "inv_chest_cloth_06", "=q2=Wild Leather Vest", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
	},

	LeatherArtisan1 = {
		{ "s10548", "inv_pants_11", "=q2=Nightscape Pants", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10550", "inv_misc_cape_03", "=q2=Nightscape Cloak", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10552", "inv_helmet_40", "=q2=Turtle Scale Helm", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10558", "inv_boots_05", "=q2=Nightscape Boots", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s10554", "inv_boots_05", "=q2=Tough Scorpid Boots", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s10556", "inv_pants_02", "=q2=Turtle Scale Leggings", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s10562", "inv_misc_cape_02", "=q2=Big Voodoo Cloak", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s10560", "inv_pants_02", "=q2=Big Voodoo Pants", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s10564", "inv_shoulder_04", "=q2=Tough Scorpid Shoulders", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s10568", "inv_pants_12", "=q2=Tough Scorpid Leggings", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s10566", "inv_boots_07", "=q2=Wild Leather Boots", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s22331", "inv_misc_leatherscrap_02", "=q1=Rugged Leather", "=ds=#sr# =so1=250 =so2=250 =so3=250 =so4=250" },
		{ "s19047", "inv_misc_pelt_bear_03", "=q1=Cured Rugged Hide", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "s19058", "inv_misc_armorkit_09", "=q1=Rugged Armor Kit", "=ds=#sr# =so1=250 =so2=255 =so3=265 =so4=275" },
		{ "s10647", "inv_chest_leather_06", "=q3=Feathered Breastplate", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s10570", "inv_helmet_20", "=q2=Tough Scorpid Helm", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s10574", "inv_misc_cape_03", "=q2=Wild Leather Cloak", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s10572", "inv_pants_14", "=q2=Wild Leather Leggings", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s19048", "inv_bracer_09", "=q2=Heavy Scorpid Bracers", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s19049", "inv_gauntlets_31", "=q2=Wicked Leather Gauntlets", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19051", "inv_chest_chain_15", "=q2=Heavy Scorpid Vest", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s19052", "inv_bracer_07", "=q2=Wicked Leather Bracers", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s57008", "inv_chest_leather_07", "=q3=Breastplate of the Earth", "=ds=#sr# =so1=265 =so2=? =so3=? =so4=?" },
		{ "s19055", "inv_gauntlets_31", "=q2=Runic Leather Gauntlets", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s47015", "inv_gauntlets_09", "=q2=Primalist's Gloves ", "=ds=#sr# =so1=270 =so2=285 =so3=290 =so4=295" },
		{ "s47017", "inv_helmet_04", "=q2=Primalist's Headdress", "=ds=#sr# =so1=270 =so2=290 =so3=291 =so4=295" },
		{ "s47020", "inv_boots_plate_05", "=q2=Primalist's Boots", "=ds=#sr# =so1=275 =so2=290 =so3=291 =so4=295" },
		{ "s22815", "inv_chest_chain_14", "=q2=Gordok Ogre Suit", "=ds=#sr# =so1=275 =so2=285 =so3=290 =so4=295" },
		{ "s19064", "inv_gauntlets_24", "=q2=Heavy Scorpid Gauntlets", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19065", "inv_bracer_11", "=q2=Runic Leather Bracers", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
	},

	LeatherArtisan2 = {
		{ "s47018", "inv_pants_04", "=q2=Primalist's Pants", "=ds=#sr# =so1=280 =so2=290 =so3=291 =so4=295" },
		{ "s47016", "inv_shoulder_09", "=q2=Primalist's Shoulders", "=ds=#sr# =so1=280 =so2=285 =so3=290 =so4=295" },
		{ "s19070", "inv_belt_03", "=q2=Heavy Scorpid Belt", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19072", "inv_belt_03", "=q2=Runic Leather Belt", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19071", "inv_misc_bandage_13", "=q2=Wicked Leather Headband", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s47019", "inv_chest_plate08", "=q3=Primalist's Vest", "=ds=#sr# =so1=285 =so2=290 =so3=291 =so4=295" },
		{ "s19075", "inv_pants_12", "=q2=Heavy Scorpid Leggings", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19082", "inv_misc_bandage_11", "=q2=Runic Leather Headband", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19083", "inv_pants_12", "=q2=Wicked Leather Pants", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s23705", "inv_boots_cloth_08", "=q3=Dawn Treaders", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s23703", "inv_belt_09", "=q3=Might of the Timbermaw", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19088", "inv_helmet_20", "=q2=Heavy Scorpid Helm", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s19100", "inv_shoulder_07", "=q2=Heavy Scorpid Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19102", "inv_chest_leather_07", "=q2=Runic Leather Armor", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19091", "inv_pants_02", "=q2=Runic Leather Pants", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19103", "inv_shoulder_15", "=q2=Runic Leather Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19098", "inv_chest_plate06", "=q2=Wicked Leather Armor", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19092", "inv_belt_03", "=q2=Wicked Leather Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24124", "inv_chest_leather_07", "=q3=Blood Tiger Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24125", "inv_shoulder_23", "=q3=Blood Tiger Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28474", "inv_belt_17", "=q3=Bramblewood Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28473", "inv_boots_cloth_04", "=q3=Bramblewood Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28472", "inv_helmet_58", "=q3=Bramblewood Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22727", "inv_misc_armorkit_05", "=q3=Core Armor Kit", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22921", "inv_belt_26", "=q3=Girdle of Insight", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23706", "inv_shoulder_26", "=q3=Golden Mantle of the Dawn", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22922", "inv_boots_08", "=q3=Mongoose Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19093", "inv_misc_cape_05", "=q3=Onyxia Scale Cloak", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24123", "inv_bracer_07", "=q3=Primal Batskin Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24122", "inv_gauntlets_31", "=q3=Primal Batskin Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherArtisan3 = {
		{ "s24121", "inv_chest_leather_03", "=q3=Primal Batskin Jerkin", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24849", "inv_bracer_12", "=q3=Sandstalker Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24851", "inv_chest_plate07", "=q3=Sandstalker Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57022", "inv_chest_leather_04", "=q3=Centaur Battle Harness", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24850", "inv_gauntlets_11", "=q3=Sandstalker Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24846", "inv_bracer_05", "=q3=Spitfire Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24848", "inv_chest_leather_02", "=q3=Spitfire Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24847", "inv_gauntlets_11", "=q3=Spitfire Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22923", "inv_bracer_05", "=q3=Swift Flight Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23704", "inv_gauntlets_26", "=q3=Timbermaw Brawlers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55522", "INV_Helmet_04", "=q3=Ethereal Helmet", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55523", "INV_Shoulder_07", "=q3=Ethereal Shoulder Pads", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55524", "INV_Chest_Cloth_08", "=q3=Ethereal Tunic", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55525", "INV_Pants_Leather_21", "=q3=Ethereal Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57115", "inv_misc_armorkit_18", "=q3=Enchanted Armor Kit", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28224", "inv_bracer_07", "=q4=Icy Scale Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28222", "inv_chest_plate09", "=q4=Icy Scale Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28223", "inv_gauntlets_28", "=q4=Icy Scale Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23707", "inv_belt_32", "=q4=Lava Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28221", "inv_bracer_07", "=q4=Polar Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28220", "inv_gauntlets_06", "=q4=Polar Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28219", "inv_chest_cloth_08", "=q4=Polar Tunic", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45473", "inv_shoulder_18", "=q4=Dreamhide Mantle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45475", "inv_bracer_12", "=q4=Dreamhide Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45477", "inv_pants_07", "=q4=Dreamhide Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45479", "inv_belt_25", "=q4=Dreamhide Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45483", "INV_Bracer_07", "=q4=Inscribed Runic Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45455", "INV_Misc_MonsterScales_04", "=q2=Dreamhide", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	Dragonscale1 = {
		{ "s10619", "inv_gauntlets_10", "=q3=Dragonscale Gauntlets", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s46695", "inv_pants_02", "=q3=Dragonscale Leggings", "=ds=#sr# =so1=245 =so2=245 =so3=245 =so4=245" },
		{ "s10650", "inv_chest_chain_07", "=q3=Dragonscale Breastplate", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s19050", "inv_chest_chain_06", "=q3=Green Dragonscale Breastplate", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19060", "inv_pants_05", "=q3=Green Dragonscale Leggings", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s24655", "inv_gauntlets_12", "=q3=Green Dragonscale Gauntlets", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19077", "inv_chest_chain_04", "=q3=Blue Dragonscale Breastplate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19085", "inv_chest_plate06", "=q3=Black Dragonscale Breastplate", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s54001", "INV_Boots_Chain_06", "=q3=Blue Dragonscale Boots", "=ds=#sr# =so1=290 =so2=315 =so3=325 =so4=335" },
		{ "s19089", "inv_shoulder_18", "=q3=Blue Dragonscale Shoulders", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s46655", "inv_boots_chain_13", "=q3=Red Dragonscale Boots", "=ds=#sr# =so1=295 =so2=300 =so3=300 =so4=300" },
		{ "s46653", "inv_pants_mail_09", "=q3=Red Dragonscale Leggings", "=ds=#sr# =so1=295 =so2=300 =so3=300 =so4=300" },
		{ "s46654", "inv_shoulder_23", "=q3=Red Dragonscale Shoulders", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s19107", "inv_pants_03", "=q3=Black Dragonscale Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24654", "inv_pants_mail_15", "=q3=Blue Dragonscale Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19094", "inv_shoulder_01", "=q3=Black Dragonscale Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19054", "inv_chest_chain_06", "=q3=Red Dragonscale Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20855", "inv_boots_plate_09", "=q4=Black Dragonscale Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22926", "inv_misc_cape_02", "=q4=Chromatic Cloak", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23708", "inv_gauntlets_22", "=q4=Chromatic Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24703", "inv_chest_plate08", "=q4=Dreamscale Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46659", "inv_pants_mail_15", "=q4=Stormscale Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s54013", "Inv_pants_mail_11", "=q4=Chromatic Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	Elemental1 = {
		{ "s10630", "inv_gauntlets_30", "=q3=Gauntlets of the Sea", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10632", "inv_helmet_08", "=q3=Helm of Fire", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s57010", "inv_boots_05", "=q3=Boots of the Wind", "=ds=#sr# =so1=255 =so2=255 =so3=255 =so4=255" },
		{ "s19059", "inv_pants_06", "=q2=Volcanic Leggings", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s19061", "inv_shoulder_18", "=q3=Living Shoulders", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s19067", "inv_pants_09", "=q3=Stormshroud Pants", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19076", "inv_chest_leather_07", "=q2=Volcanic Breastplate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19078", "inv_pants_05", "=q3=Living Leggings", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19079", "inv_chest_leather_08", "=q3=Stormshroud Armor", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19090", "inv_shoulder_05", "=q3=Stormshroud Shoulders", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s19101", "inv_shoulder_13", "=q2=Volcanic Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19095", "inv_chest_plate07", "=q3=Living Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s26279", "inv_gauntlets_05", "=q3=Stormshroud Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23710", "inv_belt_13", "=q4=Molten Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20854", "inv_helmet_08", "=q4=Molten Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22928", "inv_misc_cape_20", "=q4=Shifting Cloak", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57016", "inv_helmet_13", "=q4=Depthstalker Helm", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57012", "inv_chest_leather_08", "=q4=Earthguard Tunic", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57014", "inv_pants_06", "=q4=Flamewrath Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57018", "inv_boots_05", "=q4=Windwalker Boots", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s54015", "Inv_pants_leather_19", "=q4=Molten Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	Tribal1 = {
		{ "s10621", "inv_helmet_04", "=q3=Wolfshead Helm", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s19053", "inv_gauntlets_23", "=q2=Chimeric Gloves", "=ds=#sr# =so1=265 =so2=270 =so3=280 =so4=290" },
		{ "s19062", "inv_shoulder_06", "=q3=Ironfeather Shoulders", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s19063", "inv_boots_07", "=q2=Chimeric Boots", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19066", "inv_boots_05", "=q2=Frostsaber Boots", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19068", "inv_chest_leather_04", "=q3=Warbear Harness", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19073", "inv_pants_02", "=q2=Chimeric Leggings", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19074", "inv_pants_01", "=q2=Frostsaber Leggings", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19080", "inv_pants_wolf", "=q3=Warbear Woolies", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19081", "inv_chest_leather_07", "=q2=Chimeric Vest", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19084", "inv_gauntlets_26", "=q3=Devilsaur Gauntlets", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19086", "inv_chest_leather_06", "=q3=Ironfeather Breastplate", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19087", "inv_gauntlets_16", "=q2=Frostsaber Gloves", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s20853", "inv_boots_07", "=q4=Corehound Boots", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s19104", "inv_chest_chain_10", "=q2=Frostsaber Tunic", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19097", "inv_pants_wolf", "=q3=Devilsaur Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23709", "inv_belt_24", "=q4=Corehound Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22927", "inv_misc_cape_01", "=q4=Hide of the Wild", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47035", "inv_chest_leather_08", "=q4=Verdant Dreamer's Breastplate", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s54007", "inv_gauntlets_26", "=q4=Corehound Gloves", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	LeatherHelm1 = {
		{ "s10490", "inv_helmet_15", "=q3=Comfortable Leather Hat", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s46625", "inv_helmet_33", "=q2=Grifter's Cover", "=ds=#sr# =so1=210 =so2=225 =so3=230 =so4=235" },
		{ "s10531", "inv_banner_01", "=q2=Big Voodoo Mask", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s10546", "inv_helmet_10", "=q2=Wild Leather Helmet", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10621", "inv_helmet_04", "=q3=Wolfshead Helm", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10552", "inv_helmet_40", "=q2=Turtle Scale Helm", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10570", "inv_helmet_20", "=q2=Tough Scorpid Helm", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s10632", "inv_helmet_08", "=q3=Helm of Fire", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s47017", "inv_helmet_04", "=q2=Primalist's Headdress", "=ds=#sr# =so1=270 =so2=290 =so3=291 =so4=295" },
		{ "s19071", "inv_misc_bandage_13", "=q2=Wicked Leather Headband", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19082", "inv_misc_bandage_11", "=q2=Runic Leather Headband", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19088", "inv_helmet_20", "=q2=Heavy Scorpid Helm", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s28472", "inv_helmet_58", "=q3=Bramblewood Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55522", "INV_Helmet_04", "=q3=Ethereal Helmet", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s20854", "inv_helmet_08", "=q4=Molten Helm", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57016", "inv_helmet_13", "=q4=Depthstalker Helm", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	LeatherShoulders1 = {
		{ "s3768", "inv_shoulder_08", "=q2=Hillman's Shoulders", "=ds=#sr# =so1=130 =so2=155 =so3=167 =so4=180" },
		{ "s9147", "inv_shoulder_06", "=q2=Earthen Leather Shoulders", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s3769", "inv_shoulder_12", "=q2=Dark Leather Shoulders", "=ds=#sr# =so1=140 =so2=165 =so3=177 =so4=190" },
		{ "s7151", "inv_shoulder_08", "=q2=Barbaric Shoulders", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s10516", "inv_shoulder_07", "=q2=Nightscape Shoulders", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s10529", "inv_shoulder_18", "=q2=Wild Leather Shoulders", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s10564", "inv_shoulder_04", "=q2=Tough Scorpid Shoulders", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s19061", "inv_shoulder_18", "=q3=Living Shoulders", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s19062", "inv_shoulder_06", "=q3=Ironfeather Shoulders", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s47016", "inv_shoulder_09", "=q2=Primalist's Shoulders", "=ds=#sr# =so1=280 =so2=285 =so3=290 =so4=295" },
		{ "s19089", "inv_shoulder_18", "=q3=Blue Dragonscale Shoulders", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s19090", "inv_shoulder_05", "=q3=Stormshroud Shoulders", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s19100", "inv_shoulder_07", "=q2=Heavy Scorpid Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19103", "inv_shoulder_15", "=q2=Runic Leather Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19101", "inv_shoulder_13", "=q2=Volcanic Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24125", "inv_shoulder_23", "=q3=Blood Tiger Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23706", "inv_shoulder_26", "=q3=Golden Mantle of the Dawn", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s46654", "inv_shoulder_23", "=q3=Red Dragonscale Shoulders", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s19094", "inv_shoulder_01", "=q3=Black Dragonscale Shoulders", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55523", "INV_Shoulder_07", "=q3=Ethereal Shoulder Pads", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45473", "inv_shoulder_18", "=q4=Dreamhide Mantle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherCloak1 = {
		{ "s9058", "inv_helmet_48", "=q1=Handstitched Leather Cloak", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s2162", "inv_helmet_48", "=q1=Embossed Leather Cloak", "=ds=#sr# =so1=60 =so2=90 =so3=105 =so4=120" },
		{ "s2159", "inv_misc_cape_10", "=q2=Fine Leather Cloak", "=ds=#sr# =so1=85 =so2=105 =so3=120 =so4=135" },
		{ "s7953", "inv_misc_monsterscales_03", "=q2=Deviate Scale Cloak", "=ds=#sr# =so1=90 =so2=120 =so3=135 =so4=150" },
		{ "s9070", "inv_misc_monsterscales_03", "=q2=Black Whelp Cloak", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s2168", "inv_misc_cape_10", "=q2=Dark Leather Cloak", "=ds=#sr# =so1=110 =so2=135 =so3=147 =so4=160" },
		{ "s3760", "inv_misc_cape_07", "=q1=Hillman's Cloak", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s9198", "inv_misc_cape_04", "=q2=Frost Leather Cloak", "=ds=#sr# =so1=180 =so2=200 =so3=210 =so4=220" },
		{ "s7153", "inv_misc_cape_03", "=q2=Guardian Cloak", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s10550", "inv_misc_cape_03", "=q2=Nightscape Cloak", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10562", "inv_misc_cape_02", "=q2=Big Voodoo Cloak", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s10574", "inv_misc_cape_03", "=q2=Wild Leather Cloak", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s19093", "inv_misc_cape_05", "=q3=Onyxia Scale Cloak", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22926", "inv_misc_cape_02", "=q4=Chromatic Cloak", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22928", "inv_misc_cape_20", "=q4=Shifting Cloak", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22927", "inv_misc_cape_01", "=q4=Hide of the Wild", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherChest1 = {
		{ "s7126", "inv_chest_wolf", "=q1=Handstitched Leather Vest", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s2160", "inv_chest_leather_09", "=q2=Embossed Leather Vest", "=ds=#sr# =so1=40 =so2=70 =so3=85 =so4=100" },
		{ "s2163", "inv_chest_wolf", "=q1=White Leather Jerkin", "=ds=#sr# =so1=60 =so2=90 =so3=105 =so4=120" },
		{ "s3761", "inv_chest_leather_09", "=q2=Fine Leather Tunic", "=ds=#sr# =so1=85 =so2=115 =so3=130 =so4=145" },
		{ "s8322", "inv_chest_leather_09", "=q2=Moonglow Vest", "=ds=#sr# =so1=90 =so2=115 =so3=130 =so4=145" },
		{ "s6703", "inv_chest_chain_12", "=q2=Murloc Scale Breastplate", "=ds=#sr# =so1=95 =so2=125 =so3=140 =so4=155" },
		{ "s24940", "inv_chest_cloth_45", "=q2=Black Whelp Tunic", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s2169", "inv_chest_leather_03", "=q2=Dark Leather Tunic", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s3762", "inv_chest_leather_10", "=q2=Hillman's Leather Vest", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s2166", "inv_chest_leather_10", "=q2=Toughened Leather Armor", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3772", "inv_chest_leather_08", "=q2=Green Leather Armor", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s4096", "inv_chest_leather_04", "=q2=Raptor Hide Harness", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s6704", "inv_chest_chain_12", "=q2=Thick Murloc Armor", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s9196", "inv_chest_leather_03", "=q2=Dusky Leather Armor", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s9197", "inv_chest_chain_09", "=q2=Green Whelp Armor", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s3773", "inv_chest_leather_08", "=q2=Guardian Armor", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s6661", "inv_chest_leather_04", "=q2=Barbaric Harness", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s10499", "inv_chest_leather_03", "=q2=Nightscape Tunic", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s46624", "inv_chest_leather_08", "=q2=Grifter's Tunic", "=ds=#sr# =so1=210 =so2=235 =so3=240 =so4=245" },
		{ "s10511", "inv_chest_chain_12", "=q2=Turtle Scale Breastplate", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s10520", "inv_chest_cloth_25", "=q2=Big Voodoo Robe", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s10525", "inv_chest_leather_02", "=q2=Tough Scorpid Breastplate", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s10544", "inv_chest_cloth_06", "=q2=Wild Leather Vest", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10647", "inv_chest_leather_06", "=q3=Feathered Breastplate", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s10650", "inv_chest_chain_07", "=q3=Dragonscale Breastplate", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s19050", "inv_chest_chain_06", "=q3=Green Dragonscale Breastplate", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19051", "inv_chest_chain_15", "=q2=Heavy Scorpid Vest", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s57008", "inv_chest_leather_07", "=q3=Breastplate of the Earth", "=ds=#sr# =so1=265 =so2=? =so3=? =so4=?" },
		{ "s22815", "inv_chest_chain_14", "=q2=Gordok Ogre Suit", "=ds=#sr# =so1=275 =so2=285 =so3=290 =so4=295" },
		{ "s19068", "inv_chest_leather_04", "=q3=Warbear Harness", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
	},

	LeatherChest2 = {
		{ "s47019", "inv_chest_plate08", "=q3=Primalist's Vest", "=ds=#sr# =so1=285 =so2=290 =so3=291 =so4=295" },
		{ "s19076", "inv_chest_leather_07", "=q2=Volcanic Breastplate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19077", "inv_chest_chain_04", "=q3=Blue Dragonscale Breastplate", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19079", "inv_chest_leather_08", "=q3=Stormshroud Armor", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19081", "inv_chest_leather_07", "=q2=Chimeric Vest", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19086", "inv_chest_leather_06", "=q3=Ironfeather Breastplate", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19085", "inv_chest_plate06", "=q3=Black Dragonscale Breastplate", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19102", "inv_chest_leather_07", "=q2=Runic Leather Armor", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19098", "inv_chest_plate06", "=q2=Wicked Leather Armor", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24124", "inv_chest_leather_07", "=q3=Blood Tiger Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24121", "inv_chest_leather_03", "=q3=Primal Batskin Jerkin", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24851", "inv_chest_plate07", "=q3=Sandstalker Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57022", "inv_chest_leather_04", "=q3=Centaur Battle Harness", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24848", "inv_chest_leather_02", "=q3=Spitfire Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19054", "inv_chest_chain_06", "=q3=Red Dragonscale Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19095", "inv_chest_plate07", "=q3=Living Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55524", "INV_Chest_Cloth_08", "=q3=Ethereal Tunic", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s19104", "inv_chest_chain_10", "=q2=Frostsaber Tunic", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57012", "inv_chest_leather_08", "=q4=Earthguard Tunic", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s28222", "inv_chest_plate09", "=q4=Icy Scale Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28219", "inv_chest_cloth_08", "=q4=Polar Tunic", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24703", "inv_chest_plate08", "=q4=Dreamscale Breastplate", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s47035", "inv_chest_leather_08", "=q4=Verdant Dreamer's Breastplate", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	LeatherBracers1 = {
		{ "s9059", "inv_bracer_08", "=q1=Handstitched Leather Bracers", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s9065", "inv_bracer_04", "=q1=Light Leather Bracers", "=ds=#sr# =so1=70 =so2=100 =so3=115 =so4=130" },
		{ "s23399", "inv_bracer_15", "=q3=Barbaric Bracers", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s3776", "inv_bracer_12", "=q2=Green Leather Bracers", "=ds=#sr# =so1=180 =so2=200 =so3=210 =so4=220" },
		{ "s9201", "inv_bracer_07", "=q2=Dusky Bracers", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s9202", "inv_bracer_06", "=q2=Green Whelp Bracers", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s6705", "inv_bracer_05", "=q2=Murloc Scale Bracers", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s3777", "inv_bracer_10", "=q2=Guardian Leather Bracers", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s10518", "inv_bracer_06", "=q2=Turtle Scale Bracers", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s10533", "inv_bracer_09", "=q2=Tough Scorpid Bracers", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s19048", "inv_bracer_09", "=q2=Heavy Scorpid Bracers", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s19052", "inv_bracer_07", "=q2=Wicked Leather Bracers", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s19065", "inv_bracer_11", "=q2=Runic Leather Bracers", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s24123", "inv_bracer_07", "=q3=Primal Batskin Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24849", "inv_bracer_12", "=q3=Sandstalker Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24846", "inv_bracer_05", "=q3=Spitfire Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22923", "inv_bracer_05", "=q3=Swift Flight Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28224", "inv_bracer_07", "=q4=Icy Scale Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28221", "inv_bracer_07", "=q4=Polar Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45475", "inv_bracer_12", "=q4=Dreamhide Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45483", "INV_Bracer_07", "=q4=Inscribed Runic Bracers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherGloves1 = {
		{ "s3756", "inv_gauntlets_05", "=q1=Embossed Leather Gloves", "=ds=#sr# =so1=55 =so2=85 =so3=100 =so4=115" },
		{ "s2164", "inv_gauntlets_05", "=q2=Fine Leather Gloves", "=ds=#sr# =so1=75 =so2=105 =so3=120 =so4=135" },
		{ "s7954", "inv_gauntlets_05", "=q2=Deviate Scale Gloves", "=ds=#sr# =so1=105 =so2=130 =so3=142 =so4=155" },
		{ "s9074", "inv_gauntlets_05", "=q2=Nimble Leather Gloves", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s9072", "inv_gauntlets_05", "=q2=Red Whelp Gloves", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3765", "inv_gauntlets_05", "=q2=Dark Leather Gloves", "=ds=#sr# =so1=120 =so2=155 =so3=167 =so4=180" },
		{ "s9145", "inv_gauntlets_05", "=q2=Fletcher's Gloves", "=ds=#sr# =so1=125 =so2=150 =so3=162 =so4=175" },
		{ "s9146", "inv_gauntlets_18", "=q2=Herbalist's Gloves", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s3770", "inv_gauntlets_24", "=q3=Toughened Leather Gloves", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s9148", "inv_gauntlets_05", "=q2=Pilferer's Gloves", "=ds=#sr# =so1=140 =so2=165 =so3=177 =so4=190" },
		{ "s9149", "inv_gauntlets_23", "=q2=Heavy Earthen Gloves", "=ds=#sr# =so1=145 =so2=170 =so3=182 =so4=195" },
		{ "s3764", "inv_gauntlets_05", "=q2=Hillman's Leather Gloves", "=ds=#sr# =so1=145 =so2=170 =so3=182 =so4=195" },
		{ "s3771", "inv_gauntlets_05", "=q2=Barbaric Gloves", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s7156", "inv_gauntlets_05", "=q2=Guardian Gloves", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s21943", "inv_gauntlets_21", "=q2=Gloves of the Greatfather", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s22711", "inv_gauntlets_32", "=q3=Shadowskin Gloves", "=ds=#sr# =so1=200 =so2=210 =so3=220 =so4=230" },
		{ "s46621", "inv_gauntlets_15", "=q2=Grifter's Gauntlets", "=ds=#sr# =so1=200 =so2=215 =so3=220 =so4=225" },
		{ "s10509", "inv_gauntlets_05", "=q2=Turtle Scale Gloves", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s10542", "inv_gauntlets_24", "=q2=Tough Scorpid Gloves", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10619", "inv_gauntlets_10", "=q3=Dragonscale Gauntlets", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s10630", "inv_gauntlets_30", "=q3=Gauntlets of the Sea", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s19049", "inv_gauntlets_31", "=q2=Wicked Leather Gauntlets", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19053", "inv_gauntlets_23", "=q2=Chimeric Gloves", "=ds=#sr# =so1=265 =so2=270 =so3=280 =so4=290" },
		{ "s19055", "inv_gauntlets_31", "=q2=Runic Leather Gauntlets", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s47015", "inv_gauntlets_09", "=q2=Primalist's Gloves ", "=ds=#sr# =so1=270 =so2=285 =so3=290 =so4=295" },
		{ "s19064", "inv_gauntlets_24", "=q2=Heavy Scorpid Gauntlets", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s24655", "inv_gauntlets_12", "=q3=Green Dragonscale Gauntlets", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19084", "inv_gauntlets_26", "=q3=Devilsaur Gauntlets", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19087", "inv_gauntlets_16", "=q2=Frostsaber Gloves", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s24122", "inv_gauntlets_31", "=q3=Primal Batskin Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherGloves2 = {
		{ "s24850", "inv_gauntlets_11", "=q3=Sandstalker Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24847", "inv_gauntlets_11", "=q3=Spitfire Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23704", "inv_gauntlets_26", "=q3=Timbermaw Brawlers", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s26279", "inv_gauntlets_05", "=q3=Stormshroud Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23708", "inv_gauntlets_22", "=q4=Chromatic Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28223", "inv_gauntlets_28", "=q4=Icy Scale Gauntlets", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28220", "inv_gauntlets_06", "=q4=Polar Gloves", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s54007", "inv_gauntlets_26", "=q4=Corehound Gloves", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	LeatherBelt1 = {
		{ "s3753", "inv_belt_04", "=q1=Handstitched Leather Belt", "=ds=#sr# =so1=25 =so2=55 =so3=70 =so4=85" },
		{ "s3763", "inv_belt_04", "=q2=Fine Leather Belt", "=ds=#sr# =so1=80 =so2=110 =so3=125 =so4=140" },
		{ "s6702", "inv_belt_02", "=q2=Murloc Scale Belt", "=ds=#sr# =so1=90 =so2=120 =so3=135 =so4=150" },
		{ "s7955", "inv_belt_09", "=q3=Deviate Scale Belt", "=ds=#sr# =so1=115 =so2=140 =so3=152 =so4=165" },
		{ "s3767", "inv_belt_06", "=q2=Hillman's Belt", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3766", "inv_belt_03", "=q2=Dark Leather Belt", "=ds=#sr# =so1=125 =so2=150 =so3=162 =so4=175" },
		{ "s3774", "inv_belt_17", "=q2=Green Leather Belt", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s4097", "inv_belt_02", "=q2=Raptor Hide Belt", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s3775", "inv_belt_03", "=q3=Guardian Belt", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s3778", "inv_belt_01", "=q3=Gem-studded Leather Belt", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s9206", "inv_belt_06", "=q2=Dusky Belt", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s46622", "inv_belt_04", "=q2=Grifter's Belt", "=ds=#sr# =so1=200 =so2=215 =so3=220 =so4=225" },
		{ "s3779", "inv_belt_09", "=q3=Barbaric Belt", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s19070", "inv_belt_03", "=q2=Heavy Scorpid Belt", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19072", "inv_belt_03", "=q2=Runic Leather Belt", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s23703", "inv_belt_09", "=q3=Might of the Timbermaw", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19092", "inv_belt_03", "=q2=Wicked Leather Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s28474", "inv_belt_17", "=q3=Bramblewood Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22921", "inv_belt_26", "=q3=Girdle of Insight", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23707", "inv_belt_32", "=q4=Lava Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45479", "inv_belt_25", "=q4=Dreamhide Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23710", "inv_belt_13", "=q4=Molten Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23709", "inv_belt_24", "=q4=Corehound Belt", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherPants1 = {
		{ "s2153", "inv_pants_wolf", "=q1=Handstitched Leather Pants", "=ds=#sr# =so1=15 =so2=45 =so3=60 =so4=75" },
		{ "s9064", "inv_pants_02", "=q2=Rugged Leather Pants", "=ds=#sr# =so1=35 =so2=65 =so3=80 =so4=95" },
		{ "s3759", "inv_pants_02", "=q2=Embossed Leather Pants", "=ds=#sr# =so1=75 =so2=105 =so3=120 =so4=135" },
		{ "s9068", "inv_pants_02", "=q2=Light Leather Pants", "=ds=#sr# =so1=95 =so2=125 =so3=140 =so4=155" },
		{ "s7133", "inv_pants_02", "=q2=Fine Leather Pants", "=ds=#sr# =so1=105 =so2=130 =so3=142 =so4=155" },
		{ "s7135", "inv_pants_09", "=q2=Dark Leather Pants", "=ds=#sr# =so1=115 =so2=140 =so3=152 =so4=165" },
		{ "s7147", "inv_pants_02", "=q2=Guardian Pants", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s9195", "inv_pants_07", "=q2=Dusky Leather Leggings", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s7149", "inv_pants_12", "=q2=Barbaric Leggings", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s46623", "inv_pants_12", "=q2=Grifter's Leggings", "=ds=#sr# =so1=205 =so2=225 =so3=230 =so4=235" },
		{ "s10548", "inv_pants_11", "=q2=Nightscape Pants", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s10556", "inv_pants_02", "=q2=Turtle Scale Leggings", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s10560", "inv_pants_02", "=q2=Big Voodoo Pants", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s10568", "inv_pants_12", "=q2=Tough Scorpid Leggings", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s46695", "inv_pants_02", "=q3=Dragonscale Leggings", "=ds=#sr# =so1=245 =so2=245 =so3=245 =so4=245" },
		{ "s10572", "inv_pants_14", "=q2=Wild Leather Leggings", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s19059", "inv_pants_06", "=q2=Volcanic Leggings", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s19060", "inv_pants_05", "=q3=Green Dragonscale Leggings", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s19067", "inv_pants_09", "=q3=Stormshroud Pants", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s47018", "inv_pants_04", "=q2=Primalist's Pants", "=ds=#sr# =so1=280 =so2=290 =so3=291 =so4=295" },
		{ "s19073", "inv_pants_02", "=q2=Chimeric Leggings", "=ds=#sr# =so1=280 =so2=300 =so3=310 =so4=320" },
		{ "s19075", "inv_pants_12", "=q2=Heavy Scorpid Leggings", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19074", "inv_pants_01", "=q2=Frostsaber Leggings", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19078", "inv_pants_05", "=q3=Living Leggings", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19080", "inv_pants_wolf", "=q3=Warbear Woolies", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19083", "inv_pants_12", "=q2=Wicked Leather Pants", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s46653", "inv_pants_mail_09", "=q3=Red Dragonscale Leggings", "=ds=#sr# =so1=295 =so2=300 =so3=300 =so4=300" },
		{ "s19091", "inv_pants_02", "=q2=Runic Leather Pants", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24654", "inv_pants_mail_15", "=q3=Blue Dragonscale Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19107", "inv_pants_03", "=q3=Black Dragonscale Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherPants2 = {
		{ "s19097", "inv_pants_wolf", "=q3=Devilsaur Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s55525", "INV_Pants_Leather_21", "=q3=Ethereal Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57014", "inv_pants_06", "=q4=Flamewrath Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s54015", "Inv_pants_leather_19", "=q4=Molten Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s46659", "inv_pants_mail_15", "=q4=Stormscale Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s54013", "Inv_pants_mail_11", "=q4=Chromatic Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45477", "inv_pants_07", "=q4=Dreamhide Leggings", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	LeatherBoots1 = {
		{ "s2149", "inv_boots_04", "=q1=Handstitched Leather Boots", "=ds=#sr# =so1=1 =so2=40 =so3=55 =so4=70" },
		{ "s2161", "inv_boots_05", "=q2=Embossed Leather Boots", "=ds=#sr# =so1=55 =so2=85 =so3=100 =so4=115" },
		{ "s45069", "INV_Boots_06", "=q2=Lynxstep Boots", "=ds=#sr# =so1=75 =so2=? =so3=? =so4=?" },
		{ "s2158", "inv_boots_06", "=q2=Fine Leather Boots", "=ds=#sr# =so1=90 =so2=120 =so3=135 =so4=150" },
		{ "s2167", "inv_boots_05", "=q2=Dark Leather Boots", "=ds=#sr# =so1=100 =so2=125 =so3=137 =so4=150" },
		{ "s46620", "inv_boots_05", "=q2=Grifter's Boots", "=ds=#sr# =so1=200 =so2=215 =so3=220 =so4=225" },
		{ "s9207", "inv_boots_07", "=q3=Dusky Boots", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s9208", "inv_boots_08", "=q2=Swift Boots", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s10558", "inv_boots_05", "=q2=Nightscape Boots", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s10554", "inv_boots_05", "=q2=Tough Scorpid Boots", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s10566", "inv_boots_07", "=q2=Wild Leather Boots", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s57010", "inv_boots_05", "=q3=Boots of the Wind", "=ds=#sr# =so1=255 =so2=255 =so3=255 =so4=255" },
		{ "s47020", "inv_boots_plate_05", "=q2=Primalist's Boots", "=ds=#sr# =so1=275 =so2=290 =so3=291 =so4=295" },
		{ "s19063", "inv_boots_07", "=q2=Chimeric Boots", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19066", "inv_boots_05", "=q2=Frostsaber Boots", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s23705", "inv_boots_cloth_08", "=q3=Dawn Treaders", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s54001", "INV_Boots_Chain_06", "=q3=Blue Dragonscale Boots", "=ds=#sr# =so1=290 =so2=315 =so3=325 =so4=335" },
		{ "s46655", "inv_boots_chain_13", "=q3=Red Dragonscale Boots", "=ds=#sr# =so1=295 =so2=300 =so3=300 =so4=300" },
		{ "s20853", "inv_boots_07", "=q4=Corehound Boots", "=ds=#sr# =so1=295 =so2=315 =so3=325 =so4=335" },
		{ "s28473", "inv_boots_cloth_04", "=q3=Bramblewood Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22922", "inv_boots_08", "=q3=Mongoose Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s20855", "inv_boots_plate_09", "=q4=Black Dragonscale Boots", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57018", "inv_boots_05", "=q4=Windwalker Boots", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	LeatherBags1 = {
		{ "s5244", "inv_misc_bag_10", "=q1=Kodo Hide Bag", "=ds=#sr# =so1=40 =so2=70 =so3=85 =so4=100" },
		{ "", "", ""},
		{ "s9060", "inv_misc_quiver_01", "=q1=Light Leather Quiver", "=ds=#sr# =so1=30 =so2=60 =so3=75 =so4=90" },
		{ "s9193", "inv_misc_quiver_02", "=q2=Heavy Quiver", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s14930", "inv_misc_quiver_07", "=q2=Quickdraw Quiver", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "", "", ""},
		{ "s9062", "inv_misc_ammo_bullet_01", "=q1=Small Leather Ammo Pouch", "=ds=#sr# =so1=30 =so2=60 =so3=75 =so4=90" },
		{ "s9194", "inv_misc_bag_09", "=q2=Heavy Leather Ammo Pouch", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s14932", "inv_misc_bag_09_black", "=q2=Thick Leather Ammo Pouch", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
	},

	LeatherMisc1 = {
		{ "s2881", "inv_misc_leatherscrap_03", "=q1=Light Leather", "=ds=#sr# =so1=1 =so2=20 =so3=30 =so4=40" },
		{ "s20648", "inv_misc_leatherscrap_05", "=q1=Medium Leather", "=ds=#sr# =so1=100 =so2=100 =so3=105 =so4=110" },
		{ "s20649", "inv_misc_leatherscrap_07", "=q1=Heavy Leather", "=ds=#sr# =so1=150 =so2=150 =so3=155 =so4=160" },
		{ "s20650", "inv_misc_leatherscrap_08", "=q1=Thick Leather", "=ds=#sr# =so1=200 =so2=200 =so3=202 =so4=205" },
		{ "s22331", "inv_misc_leatherscrap_02", "=q1=Rugged Leather", "=ds=#sr# =so1=250 =so2=250 =so3=250 =so4=250" },
		{ "", "", ""},
		{ "s3816", "inv_misc_pelt_wolf_01", "=q1=Cured Light Hide", "=ds=#sr# =so1=35 =so2=55 =so3=65 =so4=75" },
		{ "s3817", "inv_misc_pelt_bear_02", "=q1=Cured Medium Hide", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s3818", "inv_misc_pelt_wolf_02", "=q1=Cured Heavy Hide", "=ds=#sr# =so1=150 =so2=160 =so3=165 =so4=170" },
		{ "s10482", "inv_misc_pelt_bear_01", "=q1=Cured Thick Hide", "=ds=#sr# =so1=200 =so2=200 =so3=200 =so4=200" },
		{ "s19047", "inv_misc_pelt_bear_03", "=q1=Cured Rugged Hide", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "s45455", "INV_Misc_MonsterScales_04", "=q2=Dreamhide", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "", "", ""},
		{ "s23190", "inv_misc_throwingball_01", "=q1=Heavy Leather Ball", "=ds=#sr# =so1=150 =so2=150 =so3=155 =so4=160" },
		{ "", "", ""},
		{ "s2152", "inv_misc_armorkit_17", "=q1=Light Armor Kit", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ "s2165", "inv_misc_armorkit_15", "=q1=Medium Armor Kit", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s3780", "inv_misc_armorkit_16", "=q1=Heavy Armor Kit", "=ds=#sr# =so1=150 =so2=170 =so3=180 =so4=190" },
		{ "s10487", "inv_misc_armorkit_07", "=q1=Thick Armor Kit", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s19058", "inv_misc_armorkit_09", "=q1=Rugged Armor Kit", "=ds=#sr# =so1=250 =so2=255 =so3=265 =so4=275" },
		{ "s22727", "inv_misc_armorkit_05", "=q3=Core Armor Kit", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s57115", "inv_misc_armorkit_18", "=q3=Enchanted Armor Kit", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	TailoringApprentice1 = {
		{ "s2963", "inv_fabric_linen_02", "=q1=Bolt of Linen Cloth", "=ds=#sr# =so1=1 =so2=25 =so3=37 =so4=50" },
		{ "s3915", "inv_shirt_02", "=q1=Brown Linen Shirt", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s2387", "inv_misc_cape_14", "=q1=Linen Cloak", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s12044", "inv_pants_11", "=q1=Simple Linen Pants", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s2393", "inv_shirt_white_01", "=q1=White Linen Shirt", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s2385", "inv_shirt_05", "=q1=Brown Linen Vest", "=ds=#sr# =so1=10 =so2=45 =so3=57 =so4=70" },
		{ "s8776", "inv_belt_05", "=q1=Linen Belt", "=ds=#sr# =so1=15 =so2=50 =so3=67 =so4=85" },
		{ "s12045", "inv_boots_05", "=q1=Simple Linen Boots", "=ds=#sr# =so1=20 =so2=50 =so3=67 =so4=85" },
		{ "s3914", "inv_pants_06", "=q1=Brown Linen Pants", "=ds=#sr# =so1=30 =so2=55 =so3=72 =so4=90" },
		{ "s7623", "inv_chest_cloth_21", "=q2=Brown Linen Robe", "=ds=#sr# =so1=30 =so2=55 =so3=72 =so4=90" },
		{ "s7624", "inv_chest_cloth_04", "=q2=White Linen Robe", "=ds=#sr# =so1=30 =so2=55 =so3=72 =so4=90" },
		{ "s3840", "inv_gauntlets_05", "=q1=Heavy Linen Gloves", "=ds=#sr# =so1=35 =so2=60 =so3=77 =so4=95" },
		{ "s2394", "inv_shirt_blue_01", "=q1=Blue Linen Shirt", "=ds=#sr# =so1=40 =so2=65 =so3=82 =so4=100" },
		{ "s2392", "inv_shirt_red_01", "=q1=Red Linen Shirt", "=ds=#sr# =so1=40 =so2=65 =so3=82 =so4=100" },
		{ "s8465", "inv_shirt_12", "=q1=Simple Dress", "=ds=#sr# =so1=40 =so2=65 =so3=82 =so4=100" },
		{ "s2389", "inv_chest_cloth_18", "=q2=Red Linen Robe", "=ds=#sr# =so1=40 =so2=65 =so3=82 =so4=100" },
		{ "s3755", "inv_misc_bag_01", "=q1=Linen Bag", "=ds=#sr# =so1=45 =so2=70 =so3=87 =so4=105" },
		{ "s7630", "inv_chest_cloth_37", "=q2=Blue Linen Vest", "=ds=#sr# =so1=55 =so2=80 =so3=97 =so4=115" },
		{ "s7629", "inv_chest_cloth_40", "=q2=Red Linen Vest", "=ds=#sr# =so1=55 =so2=80 =so3=97 =so4=115" },
		{ "s3841", "inv_bracer_12", "=q1=Green Linen Bracers", "=ds=#sr# =so1=60 =so2=85 =so3=102 =so4=120" },
		{ "s2397", "inv_misc_cape_07", "=q1=Reinforced Linen Cape", "=ds=#sr# =so1=60 =so2=85 =so3=102 =so4=120" },
		{ "s2386", "inv_boots_09", "=q1=Linen Boots", "=ds=#sr# =so1=65 =so2=90 =so3=107 =so4=125" },
		{ "s2396", "inv_shirt_green_01", "=q1=Green Linen Shirt", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s6686", "inv_misc_bag_02", "=q1=Red Linen Bag", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s2395", "inv_chest_fur", "=q2=Barbaric Linen Vest", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s7633", "inv_chest_cloth_23", "=q2=Blue Linen Robe", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s3842", "inv_pants_07", "=q2=Handstitched Linen Britches", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s2964", "inv_fabric_wool_03", "=q1=Bolt of Woolen Cloth", "=ds=#sr# =so1=75 =so2=90 =so3=97 =so4=105" },
		{ "s12046", "inv_pants_11", "=q1=Simple Kilt", "=ds=#sr# =so1=75 =so2=100 =so3=117 =so4=135" },
		{ "s2402", "inv_misc_cape_10", "=q2=Woolen Cape", "=ds=#sr# =so1=75 =so2=100 =so3=117 =so4=135" },
	},

	TailoringApprentice2 = {
		{ "s45066", "INV_Gauntlets_19", "=q2=Gloves of Manathirst", "=ds=#sr# =so1=75 =so2=150 =so3=167 =so4=185" },
	},

	TailoringJourneyman1 = {
		{ "s3757", "inv_misc_bag_10", "=q1=Woolen Bag", "=ds=#sr# =so1=80 =so2=105 =so3=122 =so4=140" },
		{ "s3845", "inv_boots_09", "=q2=Soft-soled Linen Boots", "=ds=#sr# =so1=80 =so2=105 =so3=122 =so4=140" },
		{ "s2399", "inv_chest_cloth_39", "=q2=Green Woolen Vest", "=ds=#sr# =so1=85 =so2=110 =so3=127 =so4=145" },
		{ "s3843", "inv_gauntlets_05", "=q2=Heavy Woolen Gloves", "=ds=#sr# =so1=85 =so2=110 =so3=127 =so4=145" },
		{ "s6521", "inv_misc_cape_11", "=q2=Pearl-clasped Cloak", "=ds=#sr# =so1=90 =so2=115 =so3=132 =so4=150" },
		{ "s3758", "inv_misc_bag_10_green", "=q1=Green Woolen Bag", "=ds=#sr# =so1=95 =so2=120 =so3=137 =so4=155" },
		{ "s3847", "inv_boots_09", "=q2=Red Woolen Boots", "=ds=#sr# =so1=95 =so2=120 =so3=137 =so4=155" },
		{ "s2401", "inv_boots_09", "=q2=Woolen Boots", "=ds=#sr# =so1=95 =so2=120 =so3=137 =so4=155" },
		{ "s2406", "inv_shirt_grey_01", "=q1=Gray Woolen Shirt", "=ds=#sr# =so1=100 =so2=110 =so3=120 =so4=130" },
		{ "s7639", "inv_shirt_13", "=q2=Blue Overalls", "=ds=#sr# =so1=100 =so2=125 =so3=142 =so4=160" },
		{ "s3844", "inv_misc_cape_14", "=q2=Heavy Woolen Cloak", "=ds=#sr# =so1=100 =so2=125 =so3=142 =so4=160" },
		{ "s2403", "inv_chest_cloth_13", "=q2=Gray Woolen Robe", "=ds=#sr# =so1=105 =so2=130 =so3=147 =so4=165" },
		{ "s3848", "inv_shoulder_06", "=q1=Double-stitched Woolen Shoulders", "=ds=#sr# =so1=110 =so2=135 =so3=152 =so4=170" },
		{ "s3866", "inv_shirt_red_01", "=q1=Stylish Red Shirt", "=ds=#sr# =so1=110 =so2=135 =so3=152 =so4=170" },
		{ "s8467", "inv_shirt_12", "=q1=White Woolen Dress", "=ds=#sr# =so1=110 =so2=135 =so3=152 =so4=170" },
		{ "s3850", "inv_pants_01", "=q2=Heavy Woolen Pants", "=ds=#sr# =so1=110 =so2=135 =so3=152 =so4=170" },
		{ "s6688", "inv_misc_bag_10_red", "=q1=Red Woolen Bag", "=ds=#sr# =so1=115 =so2=140 =so3=157 =so4=175" },
		{ "s7643", "inv_chest_cloth_24", "=q2=Greater Adept's Robe", "=ds=#sr# =so1=115 =so2=140 =so3=157 =so4=175" },
		{ "s3849", "inv_shoulder_09", "=q2=Reinforced Woolen Shoulders", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s7892", "inv_shirt_blue_01", "=q1=Stylish Blue Shirt", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s7893", "inv_shirt_green_01", "=q1=Stylish Green Shirt", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s12047", "inv_pants_02", "=q2=Colorful Kilt", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s3839", "inv_fabric_silk_03", "=q1=Bolt of Silk Cloth", "=ds=#sr# =so1=125 =so2=135 =so3=140 =so4=145" },
		{ "s3868", "inv_gauntlets_19", "=q2=Phoenix Gloves", "=ds=#sr# =so1=125 =so2=150 =so3=167 =so4=185" },
		{ "s3851", "inv_pants_06", "=q2=Phoenix Pants", "=ds=#sr# =so1=125 =so2=150 =so3=167 =so4=185" },
		{ "s3855", "inv_boots_05", "=q3=Spidersilk Boots", "=ds=#sr# =so1=125 =so2=150 =so3=167 =so4=185" },
		{ "s3852", "inv_gauntlets_05", "=q2=Gloves of Meditation", "=ds=#sr# =so1=130 =so2=150 =so3=165 =so4=180" },
		{ "s3869", "inv_shirt_yellow_01", "=q1=Bright Yellow Shirt", "=ds=#sr# =so1=135 =so2=145 =so3=150 =so4=155" },
		{ "s6690", "inv_chest_cloth_17", "=q2=Lesser Wizard's Robe", "=ds=#sr# =so1=135 =so2=155 =so3=170 =so4=185" },
		{ "s8758", "inv_pants_08", "=q2=Azure Silk Pants", "=ds=#sr# =so1=140 =so2=160 =so3=175 =so4=190" },
	},

	TailoringJourneyman2 = {
		{ "s3856", "inv_boots_03", "=q2=Spider Silk Slippers", "=ds=#sr# =so1=140 =so2=160 =so3=175 =so4=190" },
		{ "s8778", "INV_Boots_05", "=q2=Boots of Darkness", "=ds=#sr# =so1=140 =so2=160 =so3=175 =so4=190" },
		{ "s8760", "inv_helmet_29", "=q2=Azure Silk Hood", "=ds=#sr# =so1=145 =so2=155 =so3=160 =so4=165" },
		{ "s3854", "inv_gauntlets_17", "=q2=Azure Silk Gloves", "=ds=#sr# =so1=145 =so2=165 =so3=180 =so4=195" },
		{ "s8780", "inv_gauntlets_22", "=q2=Hands of Darkness", "=ds=#sr# =so1=145 =so2=165 =so3=180 =so4=195" },
		{ "s3813", "inv_misc_bag_07", "=q1=Small Silk Pack", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
		{ "s3859", "inv_chest_cloth_37", "=q2=Azure Silk Vest", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
		{ "s6692", "inv_chest_cloth_29", "=q2=Robes of Arcana", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
		{ "s8782", "inv_gauntlets_16", "=q2=Truefaith Gloves", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
	},

	TailoringExpert1 = {
		{ "s3870", "inv_shirt_black_01", "=q1=Dark Silk Shirt", "=ds=#sr# =so1=155 =so2=165 =so3=170 =so4=175" },
		{ "s8762", "inv_misc_bandana_01", "=q2=Silk Headband", "=ds=#sr# =so1=160 =so2=170 =so3=175 =so4=180" },
		{ "s8483", "inv_shirt_white_01", "=q1=White Swashbuckler's Shirt", "=ds=#sr# =so1=160 =so2=170 =so3=175 =so4=180" },
		{ "s3857", "inv_helmet_31", "=q2=Enchanter's Cowl", "=ds=#sr# =so1=165 =so2=185 =so3=200 =so4=215" },
		{ "s8784", "inv_chest_cloth_06", "=q2=Green Silk Armor", "=ds=#sr# =so1=165 =so2=185 =so3=200 =so4=215" },
		{ "s3871", "inv_shirt_08", "=q1=Formal White Shirt", "=ds=#sr# =so1=170 =so2=180 =so3=185 =so4=190" },
		{ "s8764", "inv_shirt_04", "=q2=Earthen Vest", "=ds=#sr# =so1=170 =so2=190 =so3=205 =so4=220" },
		{ "s3858", "inv_helmet_27", "=q2=Shadow Hood", "=ds=#sr# =so1=170 =so2=190 =so3=205 =so4=220" },
		{ "s3865", "inv_fabric_mageweave_03", "=q1=Bolt of Mageweave", "=ds=#sr# =so1=175 =so2=180 =so3=182 =so4=185" },
		{ "s8489", "inv_shirt_red_01", "=q1=Red Swashbuckler's Shirt", "=ds=#sr# =so1=175 =so2=185 =so3=190 =so4=195" },
		{ "s6693", "inv_misc_bag_07_green", "=q1=Green Silk Pack", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s8766", "inv_belt_22", "=q2=Azure Silk Belt", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s8786", "inv_chest_cloth_14", "=q2=Azure Silk Cloak", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s3860", "inv_boots_05", "=q2=Boots of the Enchanter", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s8772", "inv_belt_04", "=q2=Crimson Silk Belt", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s8789", "inv_chest_cloth_16", "=q2=Crimson Silk Cloak", "=ds=#sr# =so1=180 =so2=200 =so3=215 =so4=230" },
		{ "s8774", "inv_shoulder_18", "=q2=Green Silken Shoulders", "=ds=#sr# =so1=180 =so2=200 =so3=215 =so4=230" },
		{ "s3863", "inv_belt_25", "=q2=Spider Belt", "=ds=#sr# =so1=180 =so2=200 =so3=215 =so4=230" },
		{ "s3872", "inv_shirt_16", "=q1=Rich Purple Silk Shirt", "=ds=#sr# =so1=185 =so2=195 =so3=200 =so4=205" },
		{ "s8791", "inv_shirt_04", "=q2=Crimson Silk Vest", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s6695", "inv_misc_bag_07_black", "=q1=Black Silk Pack", "=ds=#sr# =so1=185 =so2=205 =so3=220 =so4=235" },
		{ "s3861", "inv_misc_cape_02", "=q2=Long Silken Cloak", "=ds=#sr# =so1=185 =so2=205 =so3=220 =so4=235" },
		{ "s21945", "inv_shirt_green_01", "=q1=Green Holiday Shirt", "=ds=#sr# =so1=190 =so2=200 =so3=205 =so4=210" },
		{ "s8795", "inv_shoulder_27", "=q2=Azure Shoulders", "=ds=#sr# =so1=190 =so2=210 =so3=225 =so4=240" },
		{ "s8793", "inv_shoulder_23", "=q2=Crimson Silk Shoulders", "=ds=#sr# =so1=190 =so2=210 =so3=225 =so4=240" },
		{ "s8770", "inv_chest_cloth_02", "=q3=Robe of Power", "=ds=#sr# =so1=190 =so2=210 =so3=225 =so4=240" },
		{ "s8799", "inv_pants_06", "=q2=Crimson Silk Pantaloons", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s8797", "inv_belt_24", "=q2=Earthen Silk Belt", "=ds=#sr# =so1=195 =so2=215 =so3=230 =so4=245" },
		{ "s3873", "inv_shirt_black_01", "=q1=Black Swashbuckler's Shirt", "=ds=#sr# =so1=200 =so2=210 =so3=215 =so4=220" },
		{ "s3864", "inv_belt_06", "=q2=Star Belt", "=ds=#sr# =so1=200 =so2=220 =so3=235 =so4=250" },
	},

	TailoringExpert2 = {
		{ "s3862", "inv_misc_cape_04", "=q3=Icy Cloak", "=ds=#sr# =so1=200 =so2=220 =so3=235 =so4=250" },
		{ "s69420", "INV_Boots_05", "=q2=Augerer's Boots", "=ds=#sr# =so1=200 =so2=200 =so3=200 =so4=200" },
		{ "s69421", "INV_Gauntlets_06", "=q2=Augerer's Gloves", "=ds=#sr# =so1=200 =so2=200 =so3=200 =so4=200" },
		{ "s69422", "INV_Shoulder_02", "=q2=Augerer's Mantle", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s69423", "INV_Pants_08", "=q2=Augerer's Trousers", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s69424", "INV_Helmet_11", "=q2=Augerer's Hat", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s12049", "inv_pants_09", "=q2=Black Mageweave Leggings", "=ds=#sr# =so1=205 =so2=220 =so3=235 =so4=250" },
		{ "s12048", "inv_chest_leather_03", "=q2=Black Mageweave Vest", "=ds=#sr# =so1=205 =so2=220 =so3=235 =so4=250" },
		{ "s8802", "inv_chest_cloth_25", "=q2=Crimson Silk Robe", "=ds=#sr# =so1=205 =so2=220 =so3=235 =so4=250" },
		{ "s69425", "inv_chest_cloth_22", "=q3=Augerer's Robe", "=ds=#sr# =so1=210 =so2=210 =so3=210 =so4=210" },
		{ "s12050", "inv_chest_cloth_13", "=q2=Black Mageweave Robe", "=ds=#sr# =so1=210 =so2=225 =so3=240 =so4=255" },
		{ "s8804", "inv_gauntlets_05", "=q2=Crimson Silk Gloves", "=ds=#sr# =so1=210 =so2=225 =so3=240 =so4=255" },
		{ "s12052", "inv_pants_11", "=q2=Shadoweave Pants", "=ds=#sr# =so1=210 =so2=225 =so3=240 =so4=255" },
		{ "s12061", "inv_shirt_orange_01", "=q1=Orange Mageweave Shirt", "=ds=#sr# =so1=215 =so2=220 =so3=225 =so4=230" },
		{ "s12059", "inv_misc_cape_11", "=q2=White Bandit Mask", "=ds=#sr# =so1=215 =so2=220 =so3=225 =so4=230" },
		{ "s12053", "inv_gauntlets_05", "=q2=Black Mageweave Gloves", "=ds=#sr# =so1=215 =so2=230 =so3=245 =so4=260" },
		{ "s12060", "inv_pants_06", "=q2=Red Mageweave Pants", "=ds=#sr# =so1=215 =so2=230 =so3=245 =so4=260" },
		{ "s12056", "inv_shirt_09", "=q2=Red Mageweave Vest", "=ds=#sr# =so1=215 =so2=230 =so3=245 =so4=260" },
		{ "s12055", "inv_chest_cloth_38", "=q2=Shadoweave Robe", "=ds=#sr# =so1=215 =so2=230 =so3=245 =so4=260" },
		{ "s12064", "inv_shirt_orange_01", "=q1=Orange Martial Shirt", "=ds=#sr# =so1=220 =so2=225 =so3=230 =so4=235" },
		{ "s12065", "inv_misc_bag_10_black", "=q1=Mageweave Bag", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12069", "inv_chest_cloth_25", "=q2=Cindercloth Robe", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s27658", "inv_misc_bag_enchantedmageweave", "=q2=Enchanted Mageweave Pouch", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12066", "inv_gauntlets_19", "=q2=Red Mageweave Gloves", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12071", "inv_gauntlets_09", "=q2=Shadoweave Gloves", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12067", "inv_gauntlets_18", "=q3=Dreamweave Gloves", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12070", "inv_chest_cloth_42", "=q3=Dreamweave Vest", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s69426", "inv_boots_09", "=q2=Diviner's Boots", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
		{ "s69427", "inv_gauntlets_23", "=q2=Diviner's Mitts", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
		{ "s69428", "inv_shoulder_02", "=q2=Diviner's Epaulets", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
	},

	TailoringArtisan1 = {
		{ "s69429", "inv_pants_07", "=q2=Diviner's Pantaloons", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s69430", "inv_helmet_33", "=q2=Diviner's Cowl", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s12075", "inv_shirt_purple_01", "=q1=Lavender Mageweave Shirt", "=ds=#sr# =so1=230 =so2=235 =so3=240 =so4=245" },
		{ "s12073", "inv_boots_05", "=q2=Black Mageweave Boots", "=ds=#sr# =so1=230 =so2=245 =so3=260 =so4=275" },
		{ "s12072", "inv_misc_bandana_01", "=q2=Black Mageweave Headband", "=ds=#sr# =so1=230 =so2=245 =so3=260 =so4=275" },
		{ "s12074", "inv_shoulder_25", "=q2=Black Mageweave Shoulders", "=ds=#sr# =so1=230 =so2=245 =so3=260 =so4=275" },
		{ "s69431", "inv_chest_cloth_22", "=q3=Diviner's Robes", "=ds=#sr# =so1=235 =so2=235 =so3=235 =so4=235" },
		{ "s12080", "inv_shirt_red_01", "=q1=Pink Mageweave Shirt", "=ds=#sr# =so1=235 =so2=240 =so3=245 =so4=250" },
		{ "s12077", "inv_chest_cloth_21", "=q1=Simple Black Dress", "=ds=#sr# =so1=235 =so2=240 =so3=245 =so4=250" },
		{ "s12079", "inv_misc_bag_10_red", "=q1=Red Mageweave Bag", "=ds=#sr# =so1=235 =so2=250 =so3=265 =so4=280" },
		{ "s12078", "inv_shoulder_23", "=q2=Red Mageweave Shoulders", "=ds=#sr# =so1=235 =so2=250 =so3=265 =so4=280" },
		{ "s12076", "inv_shoulder_25", "=q2=Shadoweave Shoulders", "=ds=#sr# =so1=235 =so2=250 =so3=265 =so4=280" },
		{ "s12085", "inv_shirt_08", "=q1=Tuxedo Shirt", "=ds=#sr# =so1=240 =so2=245 =so3=250 =so4=255" },
		{ "s12081", "inv_helmet_29", "=q2=Admiral's Hat", "=ds=#sr# =so1=240 =so2=255 =so3=270 =so4=285" },
		{ "s12084", "inv_misc_bandana_03", "=q2=Red Mageweave Headband", "=ds=#sr# =so1=240 =so2=255 =so3=270 =so4=285" },
		{ "s12082", "inv_boots_05", "=q2=Shadoweave Boots", "=ds=#sr# =so1=240 =so2=255 =so3=270 =so4=285" },
		{ "s12089", "inv_pants_01", "=q1=Tuxedo Pants", "=ds=#sr# =so1=245 =so2=250 =so3=255 =so4=260" },
		{ "s12088", "inv_boots_05", "=q2=Cindercloth Boots", "=ds=#sr# =so1=245 =so2=260 =so3=275 =so4=290" },
		{ "s12086", "inv_helmet_27", "=q2=Shadoweave Mask", "=ds=#sr# =so1=245 =so2=260 =so3=275 =so4=290" },
		{ "s18401", "inv_fabric_purplefire_02", "=q1=Bolt of Runecloth", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "s12091", "inv_chest_cloth_04", "=q1=White Wedding Dress", "=ds=#sr# =so1=250 =so2=255 =so3=260 =so4=265" },
		{ "s26403", "inv_chest_cloth_56", "=q1=Festival Dress", "=ds=#sr# =so1=250 =so2=265 =so3=280 =so4=295" },
		{ "s26407", "inv_chest_cloth_55", "=q1=Festive Red Pant Suit", "=ds=#sr# =so1=250 =so2=265 =so3=280 =so4=295" },
		{ "s12093", "inv_shirt_black_01", "=q1=Tuxedo Jacket", "=ds=#sr# =so1=250 =so2=265 =so3=280 =so4=295" },
		{ "s12092", "inv_crown_01", "=q3=Dreamweave Circlet", "=ds=#sr# =so1=250 =so2=265 =so3=280 =so4=295" },
		{ "s18560", "inv_fabric_moonrag_01", "=q1=Mooncloth", "=ds=#sr# =so1=250 =so2=290 =so3=305 =so4=320" },
		{ "s18404", "inv_chest_cloth_03", "=q2=Frostweave Robe", "=ds=#sr# =so1=255 =so2=270 =so3=285 =so4=300" },
		{ "s18403", "inv_chest_cloth_08", "=q2=Frostweave Tunic", "=ds=#sr# =so1=255 =so2=270 =so3=285 =so4=300" },
		{ "s18402", "inv_belt_15", "=q2=Runecloth Belt", "=ds=#sr# =so1=255 =so2=270 =so3=285 =so4=300" },
	},

	TailoringArtisan2 = {
		{ "s69432", "inv_boots_09", "=q2=Pillager's Shoes", "=ds=#sr# =so1=260 =so2=260 =so3=260 =so4=260" },
		{ "s69433", "inv_gauntlets_15", "=q2=Pillager's Grips", "=ds=#sr# =so1=260 =so2=260 =so3=260 =so4=260" },
		{ "s18405", "inv_misc_bag_19", "=q1=Runecloth Bag", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s18408", "inv_chest_cloth_07", "=q2=Cindercloth Vest", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s18406", "inv_chest_cloth_04", "=q2=Runecloth Robe", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s18407", "inv_chest_cloth_04", "=q2=Runecloth Tunic", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s26085", "inv_misc_bag_soulbag", "=q2=Soul Pouch", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s69434", "inv_shoulder_02", "=q2=Pillager's Amice", "=ds=#sr# =so1=265 =so2=265 =so3=265 =so4=265" },
		{ "s69435", "inv_pants_06", "=q2=Pillager's Pantaloons", "=ds=#sr# =so1=265 =so2=265 =so3=265 =so4=265" },
		{ "s69436", "inv_helmet_28", "=q2=Pillager's Hood", "=ds=#sr# =so1=265 =so2=265 =so3=265 =so4=265" },
		{ "s18411", "inv_gauntlets_05", "=q2=Frostweave Gloves", "=ds=#sr# =so1=265 =so2=280 =so3=295 =so4=310" },
		{ "s18410", "inv_belt_16", "=q2=Ghostweave Belt", "=ds=#sr# =so1=265 =so2=280 =so3=295 =so4=310" },
		{ "s18409", "inv_misc_cape_10", "=q2=Runecloth Cloak", "=ds=#sr# =so1=265 =so2=280 =so3=295 =so4=310" },
		{ "s69437", "inv_chest_cloth_22", "=q3=Pillager's Robe", "=ds=#sr# =so1=270 =so2=270 =so3=270 =so4=270" },
		{ "s18415", "inv_gauntlets_21", "=q2=Brightcloth Gloves", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s18414", "inv_chest_cloth_26", "=q2=Brightcloth Robe", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s18412", "inv_gauntlets_05", "=q2=Cindercloth Gloves", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s18413", "inv_gauntlets_05", "=q2=Ghostweave Gloves", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s22813", "inv_chest_chain_14", "=q2=Gordok Ogre Suit", "=ds=#sr# =so1=275 =so2=285 =so3=290 =so4=295" },
		{ "s18420", "inv_misc_cape_11", "=q2=Brightcloth Cloak", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s27724", "inv_misc_bag_cenarionherbbag", "=q2=Cenarion Herb Bag", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18418", "inv_misc_cape_18", "=q2=Cindercloth Cloak", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s27659", "inv_misc_bag_enchantedrunecloth", "=q2=Enchanted Runecloth Bag", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18419", "inv_pants_06", "=q2=Felcloth Pants", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18416", "inv_shirt_08", "=q2=Ghostweave Vest", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18417", "inv_gauntlets_25", "=q2=Runecloth Gloves", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18421", "inv_pants_09", "=q2=Wizardweave Leggings", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18422", "inv_misc_cape_18", "=q3=Cloak of Fire", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18434", "inv_pants_06", "=q2=Cindercloth Pants", "=ds=#sr# =so1=280 =so2=295 =so3=310 =so4=325" },
		{ "s18424", "inv_pants_08", "=q2=Frostweave Pants", "=ds=#sr# =so1=280 =so2=295 =so3=310 =so4=325" },
	},

	TailoringArtisan3 = {
		{ "s18423", "inv_boots_05", "=q2=Runecloth Boots", "=ds=#sr# =so1=280 =so2=295 =so3=310 =so4=325" },
		{ "s26086", "inv_misc_bag_felclothbag", "=q3=Felcloth Bag", "=ds=#sr# =so1=280 =so2=300 =so3=315 =so4=330" },
		{ "s18437", "inv_boots_05", "=q2=Felcloth Boots", "=ds=#sr# =so1=285 =so2=300 =so3=315 =so4=330" },
		{ "s18438", "inv_pants_09", "=q2=Runecloth Pants", "=ds=#sr# =so1=285 =so2=300 =so3=315 =so4=330" },
		{ "s18436", "inv_chest_cloth_49", "=q3=Robe of Winter Night", "=ds=#sr# =so1=285 =so2=300 =so3=315 =so4=330" },
		{ "s19435", "inv_boots_05", "=q3=Mooncloth Boots", "=ds=#sr# =so1=290 =so2=295 =so3=310 =so4=325" },
		{ "s18439", "inv_pants_09", "=q2=Brightcloth Pants", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s18442", "inv_helmet_34", "=q2=Felcloth Hood", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s18441", "inv_pants_01", "=q2=Ghostweave Pants", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s23664", "inv_boots_cloth_03", "=q3=Argent Boots", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s18440", "inv_pants_13", "=q3=Mooncloth Leggings", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s23662", "inv_belt_09", "=q3=Wisdom of the Timbermaw", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s18444", "inv_misc_bandana_03", "=q2=Runecloth Headband", "=ds=#sr# =so1=295 =so2=310 =so3=325 =so4=340" },
		{ "s27660", "inv_misc_bag_bigbagofenchantments", "=q2=Big Bag of Enchantment", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18451", "inv_chest_cloth_09", "=q2=Felcloth Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18453", "inv_shoulder_23", "=q2=Felcloth Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18445", "inv_misc_bag_14", "=q2=Mooncloth Bag", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18449", "inv_shoulder_21", "=q2=Runecloth Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s27725", "inv_misc_bag_satchelofcenarius", "=q2=Satchel of Cenarius", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18446", "inv_chest_cloth_46", "=q2=Wizardweave Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18450", "inv_helmet_63", "=q2=Wizardweave Turban", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s23665", "inv_shoulder_13", "=q3=Argent Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24093", "inv_boots_cloth_02", "=q3=Bloodvine Boots", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24092", "inv_pants_cloth_14", "=q3=Bloodvine Leggings", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24091", "inv_chest_cloth_07", "=q3=Bloodvine Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18455", "inv_misc_bag_13", "=q3=Bottomless Bag", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22870", "inv_misc_cape_06", "=q3=Cloak of Warding", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22867", "inv_gauntlets_19", "=q3=Felcloth Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28210", "inv_misc_cape_17", "=q3=Gaea's Embrace", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22868", "inv_gauntlets_19", "=q3=Inferno Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
	},

	TailoringArtisan4 = {
		{ "s57024", "inv_gauntlets_12", "=q3=Windbinder Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s57020", "inv_belt_01", "=q3=Dustguider Sash", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s23663", "inv_shoulder_19", "=q3=Mantle of the Timbermaw", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18452", "inv_misc_bandana_01", "=q3=Mooncloth Circlet", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22869", "inv_gauntlets_17", "=q3=Mooncloth Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22902", "inv_chest_cloth_04", "=q3=Mooncloth Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18448", "inv_shoulder_02", "=q3=Mooncloth Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18447", "inv_chest_cloth_08", "=q3=Mooncloth Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24902", "inv_belt_14", "=q3=Runed Stygian Belt", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24903", "inv_boots_05", "=q3=Runed Stygian Boots", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24901", "inv_pants_cloth_05", "=q3=Runed Stygian Leggings", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28481", "inv_crown_01", "=q3=Sylvan Crown", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28482", "inv_shoulder_18", "=q3=Sylvan Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28480", "inv_chest_plate07", "=q3=Sylvan Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s55518", "inv_helmet_53", "=q3=Cosmic Headdress", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55519", "INV_Shoulder_14", "=q3=Cosmic Mantle", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55520", "INV_Chest_Cloth_08", "=q3=Cosmic Vest", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55521", "INV_Pants_06", "=q3=Cosmic Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s55534", "INV_Misc_Cape_06", "=q3=Ley-Kissed Drape", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s22866", "inv_belt_31", "=q4=Belt of the Archmage", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s26087", "inv_misc_bag_corefelclothbag", "=q4=Core Felcloth Bag", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s20849", "inv_gauntlets_26", "=q4=Flarecore Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s23667", "inv_pants_06", "=q4=Flarecore Leggings", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s20848", "inv_shoulder_23", "=q4=Flarecore Mantle", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s23666", "inv_chest_cloth_18", "=q4=Flarecore Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22759", "inv_bracer_09", "=q4=Flarecore Wraps", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28208", "inv_misc_cape_16", "=q4=Glacial Cloak", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28205", "inv_gauntlets_06", "=q4=Glacial Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28207", "inv_chest_cloth_08", "=q4=Glacial Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28209", "inv_bracer_07", "=q4=Glacial Wrists", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18454", "inv_gauntlets_06", "=q4=Gloves of Spell Mastery", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
	},

	TailoringArtisan5 = {
		{ "s18457", "inv_chest_cloth_38", "=q4=Robe of the Archmage", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18458", "inv_chest_cloth_51", "=q4=Robe of the Void", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18456", "inv_chest_cloth_31", "=q4=Truefaith Vestments", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s46656", "inv_chest_cloth_09", "=q4=Robe of Sacrifice", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s54011", "inv_boots_05", "=q4=Flarecore Boots", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45485", "inv_gauntlets_25", "=q4=Gloves of Unwinding Mystery", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45457", "INV_Shoulder_05", "=q4=Dreamthread Mantle", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45459", "inv_pants_14", "=q4=Dreamthread Kilt", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45461", "inv_bracer_06", "=q4=Dreamthread Bracers", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45463", "inv_gauntlets_23", "=q4=Dreamthread Gloves", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45453", "INV_Misc_Herb_18", "=q2=Dreamthread", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300"},
	},

	TailoringHelm1 = {
		{ "s8760", "inv_helmet_29", "=q2=Azure Silk Hood", "=ds=#sr# =so1=145 =so2=155 =so3=160 =so4=165" },
		{ "s3857", "inv_helmet_31", "=q2=Enchanter's Cowl", "=ds=#sr# =so1=165 =so2=185 =so3=200 =so4=215" },
		{ "s3858", "inv_helmet_27", "=q2=Shadow Hood", "=ds=#sr# =so1=170 =so2=190 =so3=205 =so4=220" },
		{ "s12059", "inv_misc_cape_11", "=q2=White Bandit Mask", "=ds=#sr# =so1=215 =so2=220 =so3=225 =so4=230" },
		{ "s69430", "inv_helmet_33", "=q2=Diviner's Cowl", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s12072", "inv_misc_bandana_01", "=q2=Black Mageweave Headband", "=ds=#sr# =so1=230 =so2=245 =so3=260 =so4=275" },
		{ "s12081", "inv_helmet_29", "=q2=Admiral's Hat", "=ds=#sr# =so1=240 =so2=255 =so3=270 =so4=285" },
		{ "s12086", "inv_helmet_27", "=q2=Shadoweave Mask", "=ds=#sr# =so1=245 =so2=260 =so3=275 =so4=290" },
		{ "s12092", "inv_crown_01", "=q3=Dreamweave Circlet", "=ds=#sr# =so1=250 =so2=265 =so3=280 =so4=295" },
		{ "s69436", "inv_helmet_28", "=q2=Pillager's Hood", "=ds=#sr# =so1=265 =so2=265 =so3=265 =so4=265" },
		{ "s18442", "inv_helmet_34", "=q2=Felcloth Hood", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s18452", "inv_misc_bandana_01", "=q3=Mooncloth Circlet", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28481", "inv_crown_01", "=q3=Sylvan Crown", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s55518", "inv_helmet_53", "=q3=Cosmic Headdress", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	TailoringShoulders1 = {
		{ "s3848", "inv_shoulder_06", "=q1=Double-stitched Woolen Shoulders", "=ds=#sr# =so1=110 =so2=135 =so3=152 =so4=170" },
		{ "s3849", "inv_shoulder_09", "=q2=Reinforced Woolen Shoulders", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s8774", "inv_shoulder_18", "=q2=Green Silken Shoulders", "=ds=#sr# =so1=180 =so2=200 =so3=215 =so4=230" },
		{ "s8795", "inv_shoulder_27", "=q2=Azure Shoulders", "=ds=#sr# =so1=190 =so2=210 =so3=225 =so4=240" },
		{ "s8793", "inv_shoulder_23", "=q2=Crimson Silk Shoulders", "=ds=#sr# =so1=190 =so2=210 =so3=225 =so4=240" },
		{ "s69422", "INV_Shoulder_02", "=q2=Augerer's Mantle", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s69428", "inv_shoulder_02", "=q2=Diviner's Epaulets", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s12078", "inv_shoulder_23", "=q2=Red Mageweave Shoulders", "=ds=#sr# =so1=235 =so2=250 =so3=265 =so4=280" },
		{ "s12076", "inv_shoulder_25", "=q2=Shadoweave Shoulders", "=ds=#sr# =so1=235 =so2=250 =so3=265 =so4=280" },
		{ "s69434", "inv_shoulder_02", "=q2=Pillager's Amice", "=ds=#sr# =so1=265 =so2=265 =so3=265 =so4=265" },
		{ "s18453", "inv_shoulder_23", "=q2=Felcloth Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18449", "inv_shoulder_21", "=q2=Runecloth Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s23665", "inv_shoulder_13", "=q3=Argent Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s23663", "inv_shoulder_19", "=q3=Mantle of the Timbermaw", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18448", "inv_shoulder_02", "=q3=Mooncloth Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28482", "inv_shoulder_18", "=q3=Sylvan Shoulders", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s55519", "INV_Shoulder_14", "=q3=Cosmic Mantle", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s20848", "inv_shoulder_23", "=q4=Flarecore Mantle", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s45457", "INV_Shoulder_05", "=q4=Dreamthread Mantle", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	TailoringCloak1 = {
		{ "s2387", "inv_misc_cape_14", "=q1=Linen Cloak", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s2397", "inv_misc_cape_07", "=q1=Reinforced Linen Cape", "=ds=#sr# =so1=60 =so2=85 =so3=102 =so4=120" },
		{ "s2402", "inv_misc_cape_10", "=q2=Woolen Cape", "=ds=#sr# =so1=75 =so2=100 =so3=117 =so4=135" },
		{ "s6521", "inv_misc_cape_11", "=q2=Pearl-clasped Cloak", "=ds=#sr# =so1=90 =so2=115 =so3=132 =so4=150" },
		{ "s3844", "inv_misc_cape_14", "=q2=Heavy Woolen Cloak", "=ds=#sr# =so1=100 =so2=125 =so3=142 =so4=160" },
		{ "s8786", "inv_chest_cloth_14", "=q2=Azure Silk Cloak", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s8789", "inv_chest_cloth_16", "=q2=Crimson Silk Cloak", "=ds=#sr# =so1=180 =so2=200 =so3=215 =so4=230" },
		{ "s3861", "inv_misc_cape_02", "=q2=Long Silken Cloak", "=ds=#sr# =so1=185 =so2=205 =so3=220 =so4=235" },
		{ "s3862", "inv_misc_cape_04", "=q3=Icy Cloak", "=ds=#sr# =so1=200 =so2=220 =so3=235 =so4=250" },
		{ "s18409", "inv_misc_cape_10", "=q2=Runecloth Cloak", "=ds=#sr# =so1=265 =so2=280 =so3=295 =so4=310" },
		{ "s18420", "inv_misc_cape_11", "=q2=Brightcloth Cloak", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18418", "inv_misc_cape_18", "=q2=Cindercloth Cloak", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18422", "inv_misc_cape_18", "=q3=Cloak of Fire", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s22870", "inv_misc_cape_06", "=q3=Cloak of Warding", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s55534", "INV_Misc_Cape_06", "=q3=Ley-Kissed Drape", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s28208", "inv_misc_cape_16", "=q4=Glacial Cloak", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
	},

	TailoringChest1 = {
		{ "s7623", "inv_chest_cloth_21", "=q2=Brown Linen Robe", "=ds=#sr# =so1=30 =so2=55 =so3=72 =so4=90" },
		{ "s7624", "inv_chest_cloth_04", "=q2=White Linen Robe", "=ds=#sr# =so1=30 =so2=55 =so3=72 =so4=90" },
		{ "s2389", "inv_chest_cloth_18", "=q2=Red Linen Robe", "=ds=#sr# =so1=40 =so2=65 =so3=82 =so4=100" },
		{ "s7630", "inv_chest_cloth_37", "=q2=Blue Linen Vest", "=ds=#sr# =so1=55 =so2=80 =so3=97 =so4=115" },
		{ "s7629", "inv_chest_cloth_40", "=q2=Red Linen Vest", "=ds=#sr# =so1=55 =so2=80 =so3=97 =so4=115" },
		{ "s2395", "inv_chest_fur", "=q2=Barbaric Linen Vest", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s7633", "inv_chest_cloth_23", "=q2=Blue Linen Robe", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s2399", "inv_chest_cloth_39", "=q2=Green Woolen Vest", "=ds=#sr# =so1=85 =so2=110 =so3=127 =so4=145" },
		{ "s2403", "inv_chest_cloth_13", "=q2=Gray Woolen Robe", "=ds=#sr# =so1=105 =so2=130 =so3=147 =so4=165" },
		{ "s7643", "inv_chest_cloth_24", "=q2=Greater Adept's Robe", "=ds=#sr# =so1=115 =so2=140 =so3=157 =so4=175" },
		{ "s6690", "inv_chest_cloth_17", "=q2=Lesser Wizard's Robe", "=ds=#sr# =so1=135 =so2=155 =so3=170 =so4=185" },
		{ "s3859", "inv_chest_cloth_37", "=q2=Azure Silk Vest", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
		{ "s6692", "inv_chest_cloth_29", "=q2=Robes of Arcana", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
		{ "s8784", "inv_chest_cloth_06", "=q2=Green Silk Armor", "=ds=#sr# =so1=165 =so2=185 =so3=200 =so4=215" },
		{ "s8770", "inv_chest_cloth_02", "=q3=Robe of Power", "=ds=#sr# =so1=190 =so2=210 =so3=225 =so4=240" },
		{ "s12048", "inv_chest_leather_03", "=q2=Black Mageweave Vest", "=ds=#sr# =so1=205 =so2=220 =so3=235 =so4=250" },
		{ "s8802", "inv_chest_cloth_25", "=q2=Crimson Silk Robe", "=ds=#sr# =so1=205 =so2=220 =so3=235 =so4=250" },
		{ "s69425", "inv_chest_cloth_22", "=q3=Augerer's Robe", "=ds=#sr# =so1=210 =so2=210 =so3=210 =so4=210" },
		{ "s12050", "inv_chest_cloth_13", "=q2=Black Mageweave Robe", "=ds=#sr# =so1=210 =so2=225 =so3=240 =so4=255" },
		{ "s12055", "inv_chest_cloth_38", "=q2=Shadoweave Robe", "=ds=#sr# =so1=215 =so2=230 =so3=245 =so4=260" },
		{ "s12069", "inv_chest_cloth_25", "=q2=Cindercloth Robe", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12070", "inv_chest_cloth_42", "=q3=Dreamweave Vest", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s69431", "inv_chest_cloth_22", "=q3=Diviner's Robes", "=ds=#sr# =so1=235 =so2=235 =so3=235 =so4=235" },
		{ "s12077", "inv_chest_cloth_21", "=q1=Simple Black Dress", "=ds=#sr# =so1=235 =so2=240 =so3=245 =so4=250" },
		{ "s12091", "inv_chest_cloth_04", "=q1=White Wedding Dress", "=ds=#sr# =so1=250 =so2=255 =so3=260 =so4=265" },
		{ "s26403", "inv_chest_cloth_56", "=q1=Festival Dress", "=ds=#sr# =so1=250 =so2=265 =so3=280 =so4=295" },
		{ "s26407", "inv_chest_cloth_55", "=q1=Festive Red Pant Suit", "=ds=#sr# =so1=250 =so2=265 =so3=280 =so4=295" },
		{ "s18404", "inv_chest_cloth_03", "=q2=Frostweave Robe", "=ds=#sr# =so1=255 =so2=270 =so3=285 =so4=300" },
		{ "s18403", "inv_chest_cloth_08", "=q2=Frostweave Tunic", "=ds=#sr# =so1=255 =so2=270 =so3=285 =so4=300" },
		{ "s18408", "inv_chest_cloth_07", "=q2=Cindercloth Vest", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
	},

	TailoringChest2 = {
		{ "s18406", "inv_chest_cloth_04", "=q2=Runecloth Robe", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s18407", "inv_chest_cloth_04", "=q2=Runecloth Tunic", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s69437", "inv_chest_cloth_22", "=q3=Pillager's Robe", "=ds=#sr# =so1=270 =so2=270 =so3=270 =so4=270" },
		{ "s18414", "inv_chest_cloth_26", "=q2=Brightcloth Robe", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s22813", "inv_chest_chain_14", "=q2=Gordok Ogre Suit", "=ds=#sr# =so1=275 =so2=285 =so3=290 =so4=295" },
		{ "s18436", "inv_chest_cloth_49", "=q3=Robe of Winter Night", "=ds=#sr# =so1=285 =so2=300 =so3=315 =so4=330" },
		{ "s18451", "inv_chest_cloth_09", "=q2=Felcloth Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18446", "inv_chest_cloth_46", "=q2=Wizardweave Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24091", "inv_chest_cloth_07", "=q3=Bloodvine Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22902", "inv_chest_cloth_04", "=q3=Mooncloth Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18447", "inv_chest_cloth_08", "=q3=Mooncloth Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28480", "inv_chest_plate07", "=q3=Sylvan Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s55520", "INV_Chest_Cloth_08", "=q3=Cosmic Vest", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s23666", "inv_chest_cloth_18", "=q4=Flarecore Robe", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28207", "inv_chest_cloth_08", "=q4=Glacial Vest", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18457", "inv_chest_cloth_38", "=q4=Robe of the Archmage", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18458", "inv_chest_cloth_51", "=q4=Robe of the Void", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18456", "inv_chest_cloth_31", "=q4=Truefaith Vestments", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s46656", "inv_chest_cloth_09", "=q4=Robe of Sacrifice", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	TailoringBracers1 = {
		{ "s3841", "inv_bracer_12", "=q1=Green Linen Bracers", "=ds=#sr# =so1=60 =so2=85 =so3=102 =so4=120" },
		{ "s22759", "inv_bracer_09", "=q4=Flarecore Wraps", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28209", "inv_bracer_07", "=q4=Glacial Wrists", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s45461", "inv_bracer_06", "=q4=Dreamthread Bracers", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	TailoringGloves1 = {
		{ "s3840", "inv_gauntlets_05", "=q1=Heavy Linen Gloves", "=ds=#sr# =so1=35 =so2=60 =so3=77 =so4=95" },
		{ "s45066", "inv_gauntlets_19", "=q2=Gloves of Manathirst", "=ds=#sr# =so1=75 =so2=150 =so3=167 =so4=185" },
		{ "s3843", "inv_gauntlets_05", "=q2=Heavy Woolen Gloves", "=ds=#sr# =so1=85 =so2=110 =so3=127 =so4=145" },
		{ "s3868", "inv_gauntlets_19", "=q2=Phoenix Gloves", "=ds=#sr# =so1=125 =so2=150 =so3=167 =so4=185" },
		{ "s3852", "inv_gauntlets_05", "=q2=Gloves of Meditation", "=ds=#sr# =so1=130 =so2=150 =so3=165 =so4=180" },
		{ "s3854", "inv_gauntlets_17", "=q2=Azure Silk Gloves", "=ds=#sr# =so1=145 =so2=165 =so3=180 =so4=195" },
		{ "s8780", "inv_gauntlets_22", "=q2=Hands of Darkness", "=ds=#sr# =so1=145 =so2=165 =so3=180 =so4=195" },
		{ "s8782", "inv_gauntlets_16", "=q2=Truefaith Gloves", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
		{ "s69421", "INV_Gauntlets_06", "=q2=Augerer's Gloves", "=ds=#sr# =so1=200 =so2=200 =so3=200 =so4=200" },
		{ "s8804", "inv_gauntlets_05", "=q2=Crimson Silk Gloves", "=ds=#sr# =so1=210 =so2=225 =so3=240 =so4=255" },
		{ "s12053", "inv_gauntlets_05", "=q2=Black Mageweave Gloves", "=ds=#sr# =so1=215 =so2=230 =so3=245 =so4=260" },
		{ "s12066", "inv_gauntlets_19", "=q2=Red Mageweave Gloves", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12071", "inv_gauntlets_09", "=q2=Shadoweave Gloves", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12067", "inv_gauntlets_18", "=q3=Dreamweave Gloves", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s69427", "inv_gauntlets_23", "=q2=Diviner's Mitts", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
		{ "s69433", "inv_gauntlets_15", "=q2=Pillager's Grips", "=ds=#sr# =so1=260 =so2=260 =so3=260 =so4=260" },
		{ "s18411", "inv_gauntlets_05", "=q2=Frostweave Gloves", "=ds=#sr# =so1=265 =so2=280 =so3=295 =so4=310" },
		{ "s18415", "inv_gauntlets_21", "=q2=Brightcloth Gloves", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s18412", "inv_gauntlets_05", "=q2=Cindercloth Gloves", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s18413", "inv_gauntlets_05", "=q2=Ghostweave Gloves", "=ds=#sr# =so1=270 =so2=285 =so3=300 =so4=315" },
		{ "s18417", "inv_gauntlets_25", "=q2=Runecloth Gloves", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s22867", "inv_gauntlets_19", "=q3=Felcloth Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22868", "inv_gauntlets_19", "=q3=Inferno Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s57024", "inv_gauntlets_12", "=q3=Windbinder Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22869", "inv_gauntlets_17", "=q3=Mooncloth Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s20849", "inv_gauntlets_26", "=q4=Flarecore Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s28205", "inv_gauntlets_06", "=q4=Glacial Gloves", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18454", "inv_gauntlets_06", "=q4=Gloves of Spell Mastery", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s45485", "inv_gauntlets_25", "=q4=Gloves of Unwinding Mystery", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45463", "inv_gauntlets_23", "=q4=Dreamthread Gloves", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	TailoringBelt1 = {
		{ "s8776", "inv_belt_05", "=q1=Linen Belt", "=ds=#sr# =so1=15 =so2=50 =so3=67 =so4=85" },
		{ "s8766", "inv_belt_22", "=q2=Azure Silk Belt", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s8772", "inv_belt_04", "=q2=Crimson Silk Belt", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s3863", "inv_belt_25", "=q2=Spider Belt", "=ds=#sr# =so1=180 =so2=200 =so3=215 =so4=230" },
		{ "s8797", "inv_belt_24", "=q2=Earthen Silk Belt", "=ds=#sr# =so1=195 =so2=215 =so3=230 =so4=245" },
		{ "s3864", "inv_belt_06", "=q2=Star Belt", "=ds=#sr# =so1=200 =so2=220 =so3=235 =so4=250" },
		{ "s18402", "inv_belt_15", "=q2=Runecloth Belt", "=ds=#sr# =so1=255 =so2=270 =so3=285 =so4=300" },
		{ "s18410", "inv_belt_16", "=q2=Ghostweave Belt", "=ds=#sr# =so1=265 =so2=280 =so3=295 =so4=310" },
		{ "s23662", "inv_belt_09", "=q3=Wisdom of the Timbermaw", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s57020", "inv_belt_01", "=q3=Dustguider Sash", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24902", "inv_belt_14", "=q3=Runed Stygian Belt", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s22866", "inv_belt_31", "=q4=Belt of the Archmage", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
	},

	TailoringPants1 = {
		{ "s12044", "inv_pants_11", "=q1=Simple Linen Pants", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s3914", "inv_pants_06", "=q1=Brown Linen Pants", "=ds=#sr# =so1=30 =so2=55 =so3=72 =so4=90" },
		{ "s3842", "inv_pants_07", "=q2=Handstitched Linen Britches", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s12046", "inv_pants_11", "=q1=Simple Kilt", "=ds=#sr# =so1=75 =so2=100 =so3=117 =so4=135" },
		{ "s3850", "inv_pants_01", "=q2=Heavy Woolen Pants", "=ds=#sr# =so1=110 =so2=135 =so3=152 =so4=170" },
		{ "s12047", "inv_pants_02", "=q2=Colorful Kilt", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s3851", "inv_pants_06", "=q2=Phoenix Pants", "=ds=#sr# =so1=125 =so2=150 =so3=167 =so4=185" },
		{ "s8758", "inv_pants_08", "=q2=Azure Silk Pants", "=ds=#sr# =so1=140 =so2=160 =so3=175 =so4=190" },
		{ "s8799", "inv_pants_06", "=q2=Crimson Silk Pantaloons", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s69423", "INV_Pants_08", "=q2=Augerer's Trousers", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s12049", "inv_pants_09", "=q2=Black Mageweave Leggings", "=ds=#sr# =so1=205 =so2=220 =so3=235 =so4=250" },
		{ "s12052", "inv_pants_11", "=q2=Shadoweave Pants", "=ds=#sr# =so1=210 =so2=225 =so3=240 =so4=255" },
		{ "s12060", "inv_pants_06", "=q2=Red Mageweave Pants", "=ds=#sr# =so1=215 =so2=230 =so3=245 =so4=260" },
		{ "s69429", "inv_pants_07", "=q2=Diviner's Pantaloons", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s12089", "inv_pants_01", "=q1=Tuxedo Pants", "=ds=#sr# =so1=245 =so2=250 =so3=255 =so4=260" },
		{ "s69435", "inv_pants_06", "=q2=Pillager's Pantaloons", "=ds=#sr# =so1=265 =so2=265 =so3=265 =so4=265" },
		{ "s18419", "inv_pants_06", "=q2=Felcloth Pants", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18421", "inv_pants_09", "=q2=Wizardweave Leggings", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s18434", "inv_pants_06", "=q2=Cindercloth Pants", "=ds=#sr# =so1=280 =so2=295 =so3=310 =so4=325" },
		{ "s18424", "inv_pants_08", "=q2=Frostweave Pants", "=ds=#sr# =so1=280 =so2=295 =so3=310 =so4=325" },
		{ "s18438", "inv_pants_09", "=q2=Runecloth Pants", "=ds=#sr# =so1=285 =so2=300 =so3=315 =so4=330" },
		{ "s18439", "inv_pants_09", "=q2=Brightcloth Pants", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s18441", "inv_pants_01", "=q2=Ghostweave Pants", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s18440", "inv_pants_13", "=q3=Mooncloth Leggings", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s24092", "inv_pants_cloth_14", "=q3=Bloodvine Leggings", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24901", "inv_pants_cloth_05", "=q3=Runed Stygian Leggings", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s55521", "INV_Pants_06", "=q3=Cosmic Leggings", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s23667", "inv_pants_06", "=q4=Flarecore Leggings", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s45459", "inv_pants_14", "=q4=Dreamthread Kilt", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	TailoringBoots1 = {
		{ "s12045", "inv_boots_05", "=q1=Simple Linen Boots", "=ds=#sr# =so1=20 =so2=50 =so3=67 =so4=85" },
		{ "s2386", "inv_boots_09", "=q1=Linen Boots", "=ds=#sr# =so1=65 =so2=90 =so3=107 =so4=125" },
		{ "s3845", "inv_boots_09", "=q2=Soft-soled Linen Boots", "=ds=#sr# =so1=80 =so2=105 =so3=122 =so4=140" },
		{ "s3847", "inv_boots_09", "=q2=Red Woolen Boots", "=ds=#sr# =so1=95 =so2=120 =so3=137 =so4=155" },
		{ "s2401", "inv_boots_09", "=q2=Woolen Boots", "=ds=#sr# =so1=95 =so2=120 =so3=137 =so4=155" },
		{ "s3855", "inv_boots_05", "=q3=Spidersilk Boots", "=ds=#sr# =so1=125 =so2=150 =so3=167 =so4=185" },
		{ "s3856", "inv_boots_03", "=q2=Spider Silk Slippers", "=ds=#sr# =so1=140 =so2=160 =so3=175 =so4=190" },
		{ "s8778", "INV_Boots_05", "=q2=Boots of Darkness", "=ds=#sr# =so1=140 =so2=160 =so3=175 =so4=190" },
		{ "s3860", "inv_boots_05", "=q2=Boots of the Enchanter", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s69420", "INV_Boots_05", "=q2=Augerer's Boots", "=ds=#sr# =so1=200 =so2=200 =so3=200 =so4=200" },
		{ "s69426", "inv_boots_09", "=q2=Diviner's Boots", "=ds=#sr# =so1=225 =so2=225 =so3=225 =so4=225" },
		{ "s12073", "inv_boots_05", "=q2=Black Mageweave Boots", "=ds=#sr# =so1=230 =so2=245 =so3=260 =so4=275" },
		{ "s12082", "inv_boots_05", "=q2=Shadoweave Boots", "=ds=#sr# =so1=240 =so2=255 =so3=270 =so4=285" },
		{ "s12088", "inv_boots_05", "=q2=Cindercloth Boots", "=ds=#sr# =so1=245 =so2=260 =so3=275 =so4=290" },
		{ "s69432", "inv_boots_09", "=q2=Pillager's Shoes", "=ds=#sr# =so1=260 =so2=260 =so3=260 =so4=260" },
		{ "s18423", "inv_boots_05", "=q2=Runecloth Boots", "=ds=#sr# =so1=280 =so2=295 =so3=310 =so4=325" },
		{ "s18437", "inv_boots_05", "=q2=Felcloth Boots", "=ds=#sr# =so1=285 =so2=300 =so3=315 =so4=330" },
		{ "s19435", "inv_boots_05", "=q3=Mooncloth Boots", "=ds=#sr# =so1=290 =so2=295 =so3=310 =so4=325" },
		{ "s23664", "inv_boots_cloth_03", "=q3=Argent Boots", "=ds=#sr# =so1=290 =so2=305 =so3=320 =so4=335" },
		{ "s24093", "inv_boots_cloth_02", "=q3=Bloodvine Boots", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s24903", "inv_boots_05", "=q3=Runed Stygian Boots", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s54011", "inv_boots_05", "=q4=Flarecore Boots", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
	},

	TailoringBags1 = {
		{ "s3755", "inv_misc_bag_01", "=q1=Linen Bag", "=ds=#sr# =so1=45 =so2=70 =so3=87 =so4=105" },
		{ "s6686", "inv_misc_bag_02", "=q1=Red Linen Bag", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s3757", "inv_misc_bag_10", "=q1=Woolen Bag", "=ds=#sr# =so1=80 =so2=105 =so3=122 =so4=140" },
		{ "s3758", "inv_misc_bag_10_green", "=q1=Green Woolen Bag", "=ds=#sr# =so1=95 =so2=120 =so3=137 =so4=155" },
		{ "s6688", "inv_misc_bag_10_red", "=q1=Red Woolen Bag", "=ds=#sr# =so1=115 =so2=140 =so3=157 =so4=175" },
		{ "s3813", "inv_misc_bag_07", "=q1=Small Silk Pack", "=ds=#sr# =so1=150 =so2=170 =so3=185 =so4=200" },
		{ "s6693", "inv_misc_bag_07_green", "=q1=Green Silk Pack", "=ds=#sr# =so1=175 =so2=195 =so3=210 =so4=225" },
		{ "s6695", "inv_misc_bag_07_black", "=q1=Black Silk Pack", "=ds=#sr# =so1=185 =so2=205 =so3=220 =so4=235" },
		{ "s12065", "inv_misc_bag_10_black", "=q1=Mageweave Bag", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s12079", "inv_misc_bag_10_red", "=q1=Red Mageweave Bag", "=ds=#sr# =so1=235 =so2=250 =so3=265 =so4=280" },
		{ "s18405", "inv_misc_bag_19", "=q1=Runecloth Bag", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s18445", "inv_misc_bag_14", "=q2=Mooncloth Bag", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "s18455", "inv_misc_bag_13", "=q3=Bottomless Bag", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "", "", "", ""},
		{ "", "", "", ""},
		{ "s27658", "inv_misc_bag_enchantedmageweave", "=q2=Enchanted Mageweave Pouch", "=ds=#sr# =so1=225 =so2=240 =so3=255 =so4=270" },
		{ "s27659", "inv_misc_bag_enchantedrunecloth", "=q2=Enchanted Runecloth Bag", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s27660", "inv_misc_bag_bigbagofenchantments", "=q2=Big Bag of Enchantment", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "", "", "", ""},
		{ "s27724", "inv_misc_bag_cenarionherbbag", "=q2=Cenarion Herb Bag", "=ds=#sr# =so1=275 =so2=290 =so3=305 =so4=320" },
		{ "s27725", "inv_misc_bag_satchelofcenarius", "=q2=Satchel of Cenarius", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
		{ "", "", "", ""},
		{ "s26085", "inv_misc_bag_soulbag", "=q2=Soul Pouch", "=ds=#sr# =so1=260 =so2=275 =so3=290 =so4=305" },
		{ "s26086", "inv_misc_bag_felclothbag", "=q3=Felcloth Bag", "=ds=#sr# =so1=280 =so2=300 =so3=315 =so4=330" },
		{ "s26087", "inv_misc_bag_corefelclothbag", "=q4=Core Felcloth Bag", "=ds=#sr# =so1=300 =so2=315 =so3=330 =so4=345" },
	},

	TailoringShirt1 = {
		{ "s3915", "inv_shirt_02", "=q1=Brown Linen Shirt", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s2393", "inv_shirt_white_01", "=q1=White Linen Shirt", "=ds=#sr# =so1=1 =so2=35 =so3=47 =so4=60" },
		{ "s2394", "inv_shirt_blue_01", "=q1=Blue Linen Shirt", "=ds=#sr# =so1=40 =so2=65 =so3=82 =so4=100" },
		{ "s2392", "inv_shirt_red_01", "=q1=Red Linen Shirt", "=ds=#sr# =so1=40 =so2=65 =so3=82 =so4=100" },
		{ "s2396", "inv_shirt_green_01", "=q1=Green Linen Shirt", "=ds=#sr# =so1=70 =so2=95 =so3=112 =so4=130" },
		{ "s2406", "inv_shirt_grey_01", "=q1=Gray Woolen Shirt", "=ds=#sr# =so1=100 =so2=110 =so3=120 =so4=130" },
		{ "s3866", "inv_shirt_red_01", "=q1=Stylish Red Shirt", "=ds=#sr# =so1=110 =so2=135 =so3=152 =so4=170" },
		{ "s7892", "inv_shirt_blue_01", "=q1=Stylish Blue Shirt", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s7893", "inv_shirt_green_01", "=q1=Stylish Green Shirt", "=ds=#sr# =so1=120 =so2=145 =so3=162 =so4=180" },
		{ "s3869", "inv_shirt_yellow_01", "=q1=Bright Yellow Shirt", "=ds=#sr# =so1=135 =so2=145 =so3=150 =so4=155" },
		{ "s3870", "inv_shirt_black_01", "=q1=Dark Silk Shirt", "=ds=#sr# =so1=155 =so2=165 =so3=170 =so4=175" },
		{ "s8483", "inv_shirt_white_01", "=q1=White Swashbuckler's Shirt", "=ds=#sr# =so1=160 =so2=170 =so3=175 =so4=180" },
		{ "s3871", "inv_shirt_08", "=q1=Formal White Shirt", "=ds=#sr# =so1=170 =so2=180 =so3=185 =so4=190" },
		{ "s8489", "inv_shirt_red_01", "=q1=Red Swashbuckler's Shirt", "=ds=#sr# =so1=175 =so2=185 =so3=190 =so4=195" },
		{ "s3872", "inv_shirt_16", "=q1=Rich Purple Silk Shirt", "=ds=#sr# =so1=185 =so2=195 =so3=200 =so4=205" },
		{ "s21945", "inv_shirt_green_01", "=q1=Green Holiday Shirt", "=ds=#sr# =so1=190 =so2=200 =so3=205 =so4=210" },
		{ "s3873", "inv_shirt_black_01", "=q1=Black Swashbuckler's Shirt", "=ds=#sr# =so1=200 =so2=210 =so3=215 =so4=220" },
		{ "s12061", "inv_shirt_orange_01", "=q1=Orange Mageweave Shirt", "=ds=#sr# =so1=215 =so2=220 =so3=225 =so4=230" },
		{ "s12064", "inv_shirt_orange_01", "=q1=Orange Martial Shirt", "=ds=#sr# =so1=220 =so2=225 =so3=230 =so4=235" },
		{ "s12075", "inv_shirt_purple_01", "=q1=Lavender Mageweave Shirt", "=ds=#sr# =so1=230 =so2=235 =so3=240 =so4=245" },
		{ "s12080", "inv_shirt_red_01", "=q1=Pink Mageweave Shirt", "=ds=#sr# =so1=235 =so2=240 =so3=245 =so4=250" },
		{ "s12085", "inv_shirt_08", "=q1=Tuxedo Shirt", "=ds=#sr# =so1=240 =so2=245 =so3=250 =so4=255" },
	},

	TailoringMisc1 = {
		{ "s2963", "inv_fabric_linen_02", "=q1=Bolt of Linen Cloth", "=ds=#sr# =so1=1 =so2=25 =so3=37 =so4=50" },
		{ "s2964", "inv_fabric_wool_03", "=q1=Bolt of Woolen Cloth", "=ds=#sr# =so1=75 =so2=90 =so3=97 =so4=105" },
		{ "s3839", "inv_fabric_silk_03", "=q1=Bolt of Silk Cloth", "=ds=#sr# =so1=125 =so2=135 =so3=140 =so4=145" },
		{ "s3865", "inv_fabric_mageweave_03", "=q1=Bolt of Mageweave", "=ds=#sr# =so1=175 =so2=180 =so3=182 =so4=185" },
		{ "s18401", "inv_fabric_purplefire_02", "=q1=Bolt of Runecloth", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "s18560", "inv_fabric_moonrag_01", "=q1=Mooncloth", "=ds=#sr# =so1=250 =so2=290 =so3=305 =so4=320" },
		{ "s45453", "INV_Misc_Herb_18", "=q2=Dreamthread", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300"},
	},

	EngineeringApprentice1 = {
		{ "s3918", "inv_misc_dust_01", "=q1=Rough Blasting Powder", "=ds=#sr# =so1=1 =so2=20 =so3=30 =so4=40" },
		{ "s3920", "inv_ammo_bullet_02", "=q1=Crafted Light Shot", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ "s3919", "inv_misc_bomb_06", "=q1=Rough Dynamite", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ "s3922", "inv_misc_gear_06", "=q1=Handful of Copper Bolts", "=ds=#sr# =so1=30 =so2=45 =so3=52 =so4=60" },
		{ "s3923", "inv_misc_bomb_09", "=q1=Rough Copper Bomb", "=ds=#sr# =so1=30 =so2=60 =so3=75 =so4=90" },
		{ "s7430", "inv_misc_wrench_01", "=q1=Arclight Spanner", "=ds=#sr# =so1=50 =so2=70 =so3=80 =so4=90" },
		{ "s3924", "inv_gizmo_pipe_02", "=q1=Copper Tube", "=ds=#sr# =so1=50 =so2=80 =so3=95 =so4=110" },
		{ "s3925", "inv_weapon_rifle_03", "=q2=Rough Boomstick", "=ds=#sr# =so1=50 =so2=80 =so3=95 =so4=110" },
		{ "s3977", "inv_misc_spyglass_02", "=q1=Crude Scope", "=ds=#sr# =so1=60 =so2=90 =so3=105 =so4=120" },
		{ "s3926", "inv_gizmo_03", "=q1=Copper Modulator", "=ds=#sr# =so1=65 =so2=95 =so3=110 =so4=125" },
		{ "s3929", "inv_misc_dust_02", "=q1=Coarse Blasting Powder", "=ds=#sr# =so1=75 =so2=85 =so3=90 =so4=95" },
		{ "s3930", "inv_ammo_bullet_02", "=q1=Crafted Heavy Shot", "=ds=#sr# =so1=75 =so2=85 =so3=90 =so4=95" },
		{ "s3931", "inv_misc_bomb_06", "=q1=Coarse Dynamite", "=ds=#sr# =so1=75 =so2=90 =so3=97 =so4=105" },
		{ "s45057", "inv_misc_bomb_06", "=q1=Unstable Mining Dynamite", "=ds=#sr# =so1=75 =so2=90 =so3=97 =so4=105" },
		{ "s3928", "inv_crate_01", "=q1=Mechanical Squirrel", "=ds=#sr# =so1=75 =so2=105 =so3=120 =so4=135" },
	},

	EngineeringJourneyman1 = {
		{ "s3932", "inv_crate_06", "=q1=Target Dummy", "=ds=#sr# =so1=85 =so2=115 =so3=130 =so4=145" },
		{ "s3973", "inv_ingot_04", "=q1=Silver Contact", "=ds=#sr# =so1=90 =so2=110 =so3=125 =so4=140" },
		{ "s8339", "inv_misc_bomb_06", "=q1=EZ-Thro Dynamite", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s8334", "inv_box_01", "=q1=Practice Lock", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s3933", "inv_misc_urn_01", "=q1=Small Seaforium Charge", "=ds=#sr# =so1=100 =so2=130 =so3=145 =so4=160" },
		{ "s3934", "inv_helmet_47", "=q2=Flying Tiger Goggles", "=ds=#sr# =so1=100 =so2=130 =so3=145 =so4=160" },
		{ "s3938", "inv_gizmo_pipe_01", "=q1=Bronze Tube", "=ds=#sr# =so1=105 =so2=105 =so3=130 =so4=155" },
		{ "s3937", "inv_misc_bomb_01", "=q1=Large Copper Bomb", "=ds=#sr# =so1=105 =so2=105 =so3=130 =so4=155" },
		{ "s3936", "inv_weapon_rifle_07", "=q2=Deadly Blunderbuss", "=ds=#sr# =so1=105 =so2=130 =so3=142 =so4=155" },
		{ "s3978", "inv_misc_spyglass_02", "=q1=Standard Scope", "=ds=#sr# =so1=110 =so2=135 =so3=147 =so4=160" },
		{ "s3941", "inv_misc_bomb_09", "=q1=Small Bronze Bomb", "=ds=#sr# =so1=120 =so2=120 =so3=145 =so4=170" },
		{ "s3939", "inv_weapon_rifle_07", "=q2=Lovingly Crafted Boomstick", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3940", "inv_helmet_47", "=q2=Shadow Goggles", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s47027", "inv_gizmo_06", "=q1=Portable Wormhole Generator: Stormwind", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s47028", "inv_gizmo_06", "=q1=Portable Wormhole Generator: Orgrimmar", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3947", "inv_ammo_bullet_02", "=q1=Crafted Solid Shot", "=ds=#sr# =so1=125 =so2=125 =so3=135 =so4=145" },
		{ "s3945", "inv_misc_dust_06", "=q1=Heavy Blasting Powder", "=ds=#sr# =so1=125 =so2=125 =so3=135 =so4=145" },
		{ "s15007", "inv_misc_spyglass_03", "=q1=Jewelry Lens", "=ds=#sr# =so1=125 =so2=? =so3=? =so4=?" },
		{ "s3946", "inv_misc_bomb_06", "=q1=Heavy Dynamite", "=ds=#sr# =so1=125 =so2=125 =so3=135 =so4=145" },
		{ "s26416", "inv_misc_missilesmall_blue", "=q1=Small Blue Rocket", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s26417", "inv_misc_missilesmall_green", "=q1=Small Green Rocket", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s26418", "inv_misc_missilesmall_red", "=q1=Small Red Rocket", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s3944", "inv_gizmo_01", "=q1=Flame Deflector", "=ds=#sr# =so1=125 =so2=125 =so3=150 =so4=175" },
		{ "s3942", "inv_gizmo_02", "=q1=Whirring Bronze Gizmo", "=ds=#sr# =so1=125 =so2=125 =so3=150 =so4=175" },
		{ "s9269", "inv_misc_pocketwatch_01", "=q2=Gnomish Universal Remote", "=ds=#sr# =so1=125 =so2=150 =so3=162 =so4=175" },
		{ "s3949", "inv_weapon_rifle_07", "=q2=Silver-plated Shotgun", "=ds=#sr# =so1=130 =so2=155 =so3=167 =so4=180" },
		{ "s6458", "inv_misc_spyglass_01", "=q1=Ornate Spyglass", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s3950", "inv_misc_bomb_05", "=q1=Big Bronze Bomb", "=ds=#sr# =so1=140 =so2=140 =so3=165 =so4=190" },
		{ "s3952", "inv_gizmo_07", "=q2=Minor Recombobulator", "=ds=#sr# =so1=140 =so2=165 =so3=177 =so4=190" },
		{ "s3953", "inv_gizmo_bronzeframework_01", "=q1=Bronze Framework", "=ds=#sr# =so1=145 =so2=145 =so3=170 =so4=195" },
	},

	EngineeringJourneyman2 = {
		{ "s3954", "inv_weapon_rifle_06", "=q2=Moonsight Rifle", "=ds=#sr# =so1=145 =so2=170 =so3=182 =so4=195" },
		{ "s9271", "inv_misc_food_26", "=q1=Aquadynamic Fish Attractor", "=ds=#sr# =so1=150 =so2=150 =so3=160 =so4=170" },
		{ "s23067", "spell_ice_magicdamage", "=q1=Blue Firework", "=ds=#sr# =so1=150 =so2=150 =so3=162 =so4=175" },
		{ "s23068", "spell_nature_abolishmagic", "=q1=Green Firework", "=ds=#sr# =so1=150 =so2=150 =so3=162 =so4=175" },
		{ "s23066", "spell_fire_fireball02", "=q1=Red Firework", "=ds=#sr# =so1=150 =so2=150 =so3=162 =so4=175" },
		{ "s12584", "inv_battery_02", "=q1=Gold Power Core", "=ds=#sr# =so1=150 =so2=150 =so3=170 =so4=190" },
		{ "s3955", "spell_nature_polymorph", "=q1=Explosive Sheep", "=ds=#sr# =so1=150 =so2=175 =so3=187 =so4=200" },
		{ "s3956", "inv_helmet_47", "=q2=Green Tinted Goggles", "=ds=#sr# =so1=150 =so2=175 =so3=187 =so4=200" },
	},

	EngineeringExpert1 = {
		{ "s3957", "inv_gizmo_01", "=q1=Ice Deflector", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s3958", "inv_spear_05", "=q1=Iron Strut", "=ds=#sr# =so1=160 =so2=160 =so3=170 =so4=180" },
		{ "s3959", "inv_misc_spyglass_02", "=q1=Discombobulator Ray", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s9273", "inv_misc_enggizmos_10", "=q1=Goblin Jumper Cables", "=ds=#sr# =so1=165 =so2=165 =so3=180 =so4=200" },
		{ "s3960", "inv_musket_01", "=q1=Portable Bronze Mortar", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s3961", "inv_misc_pocketwatch_02", "=q1=Gyrochronatom", "=ds=#sr# =so1=170 =so2=170 =so3=190 =so4=210" },
		{ "s12585", "inv_misc_powder_black", "=q1=Solid Blasting Powder", "=ds=#sr# =so1=175 =so2=175 =so3=185 =so4=195" },
		{ "s12586", "inv_misc_bomb_06", "=q1=Solid Dynamite", "=ds=#sr# =so1=175 =so2=175 =so3=185 =so4=195" },
		{ "s15008", "inv_box_01", "=q1=Precision Jewelers Kit", "=ds=#sr# =so1=175 =so2=? =so3=? =so4=?" },
		{ "s26420", "inv_misc_missilelarge_blue", "=q1=Large Blue Rocket", "=ds=#sr# =so1=175 =so2=175 =so3=187 =so4=200" },
		{ "s26421", "inv_misc_missilelarge_green", "=q1=Large Green Rocket", "=ds=#sr# =so1=175 =so2=175 =so3=187 =so4=200" },
		{ "s26422", "inv_misc_missilelarge_red", "=q1=Large Red Rocket", "=ds=#sr# =so1=175 =so2=175 =so3=187 =so4=200" },
		{ "s3963", "inv_helmet_08", "=q1=Compact Harvest Reaper Kit", "=ds=#sr# =so1=175 =so2=175 =so3=195 =so4=215" },
		{ "s12590", "inv_misc_screwdriver_02", "=q1=Gyromatic Micro-Adjustor", "=ds=#sr# =so1=175 =so2=175 =so3=195 =so4=215" },
		{ "s3962", "inv_misc_bomb_08", "=q1=Iron Grenade", "=ds=#sr# =so1=175 =so2=175 =so3=195 =so4=215" },
		{ "s12587", "inv_helmet_47", "=q2=Bright-Eye Goggles", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s3979", "inv_misc_spyglass_02", "=q1=Accurate Scope", "=ds=#sr# =so1=180 =so2=200 =so3=210 =so4=220" },
		{ "s3965", "inv_crate_05", "=q1=Advanced Target Dummy", "=ds=#sr# =so1=185 =so2=185 =so3=205 =so4=225" },
		{ "s8243", "inv_misc_ammo_bullet_01", "=q1=Flash Bomb", "=ds=#sr# =so1=185 =so2=185 =so3=205 =so4=225" },
		{ "s3966", "inv_helmet_44", "=q3=Craftsman's Monocle", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s3967", "inv_misc_bomb_01", "=q1=Big Iron Bomb", "=ds=#sr# =so1=190 =so2=190 =so3=210 =so4=230" },
		{ "s21940", "spell_frost_windwalkon", "=q1=Snowmaster 9000", "=ds=#sr# =so1=190 =so2=190 =so3=210 =so4=230" },
		{ "s12589", "inv_musket_01", "=q1=Mithril Tube", "=ds=#sr# =so1=195 =so2=195 =so3=215 =so4=235" },
		{ "s3968", "inv_shield_08", "=q1=Goblin Land Mine", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s23069", "inv_misc_bomb_03", "=q1=EZ-Thro Dynamite II", "=ds=#sr# =so1=200 =so2=200 =so3=210 =so4=220" },
		{ "s3972", "inv_misc_urn_01", "=q1=Large Seaforium Charge", "=ds=#sr# =so1=200 =so2=200 =so3=220 =so4=240" },
		{ "s15255", "inv_gizmo_03", "=q1=Mechanical Repair Kit", "=ds=#sr# =so1=200 =so2=200 =so3=220 =so4=240" },
		{ "s12591", "inv_battery_01", "=q1=Unstable Trigger", "=ds=#sr# =so1=200 =so2=200 =so3=220 =so4=240" },
		{ "s3971", "inv_gizmo_01", "=q1=Gnomish Cloaking Device", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s3969", "inv_misc_head_dragon_01", "=q1=Mechanical Dragonling", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
	},

	EngineeringExpert2 = {
		{ "s12594", "inv_helmet_47", "=q2=Fire Goggles", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12595", "inv_weapon_rifle_07", "=q2=Mithril Blunderbuss", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12596", "inv_ammo_bullet_01", "=q2=Hi-Impact Mithril Slugs", "=ds=#sr# =so1=210 =so2=210 =so3=230 =so4=250" },
		{ "s12597", "inv_misc_spyglass_02", "=q1=Deadly Scope", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s12599", "inv_gizmo_mithrilcasing_01", "=q1=Mithril Casing", "=ds=#sr# =so1=215 =so2=215 =so3=235 =so4=255" },
		{ "s12603", "inv_misc_bomb_02", "=q1=Mithril Frag Bomb", "=ds=#sr# =so1=215 =so2=215 =so3=235 =so4=255" },
		{ "s12607", "inv_helmet_47", "=q2=Catseye Ultra Goggles", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s12614", "inv_weapon_rifle_07", "=q2=Mithril Heavy-bore Rifle", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s15009", "inv_misc_spyglass_02", "=q1=Jewelry Scope", "=ds=#sr# =so1=225 =so2=? =so3=? =so4=?" },
		{ "s26423", "inv_misc_missilesmallcluster_blue", "=q1=Blue Rocket Cluster", "=ds=#sr# =so1=225 =so2=225 =so3=237 =so4=250" },
		{ "s26424", "inv_misc_missilesmallcluster_green", "=q1=Green Rocket Cluster", "=ds=#sr# =so1=225 =so2=225 =so3=237 =so4=250" },
		{ "s26425", "inv_misc_missilesmallcluster_red", "=q1=Red Rocket Cluster", "=ds=#sr# =so1=225 =so2=225 =so3=237 =so4=250" },
		{ "s26442", "inv_musket_04", "=q1=Firework Launcher", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s12616", "inv_misc_cape_11", "=q2=Parachute Cloak", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s12615", "inv_helmet_47", "=q2=Spellpower Goggles Xtreme", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
	},

	EngineeringArtisan1 = {
		{ "s12617", "inv_helmet_49", "=q2=Deepdive Helmet", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s12618", "inv_helmet_47", "=q2=Rose Colored Goggles", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s12619", "inv_misc_bomb_07", "=q1=Hi-Explosive Bomb", "=ds=#sr# =so1=235 =so2=235 =so3=255 =so4=275" },
		{ "s12620", "inv_misc_spyglass_02", "=q1=Sniper Scope", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s12621", "inv_ammo_bullet_01", "=q2=Mithril Gyro-Shot", "=ds=#sr# =so1=245 =so2=245 =so3=265 =so4=285" },
		{ "s12622", "inv_helmet_44", "=q3=Green Lens", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s19788", "inv_misc_ammo_gunpowder_01", "=q1=Dense Blasting Powder", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ "s23070", "inv_misc_bomb_06", "=q1=Dense Dynamite", "=ds=#sr# =so1=250 =so2=250 =so3=260 =so4=270" },
		{ "s23507", "spell_holy_holybolt", "=q1=Snake Burst Firework", "=ds=#sr# =so1=250 =so2=250 =so3=260 =so4=270" },
		{ "s46610", "inv_mace_14", "=q4=Battery-Powered Crowd Pummeler", "=ds=#sr# =so1=250 =so2=? =so3=? =so4=?" },
		{ "s19567", "inv_egg_05", "=q1=Salt Shaker", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s12624", "inv_misc_head_dragon_01", "=q1=Mithril Mechanical Dragonling", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s26011", "ability_hunter_pet_gorilla", "=q1=Tranquil Mechanical Yeti", "=ds=#sr# =so1=250 =so2=320 =so3=330 =so4=340" },
		{ "s23071", "inv_staff_18", "=q1=Truesilver Transformer", "=ds=#sr# =so1=260 =so2=270 =so3=275 =so4=280" },
		{ "s19790", "inv_misc_bomb_08", "=q1=Thorium Grenade", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19791", "inv_gizmo_04", "=q1=Thorium Widget", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19792", "inv_weapon_rifle_07", "=q2=Thorium Rifle", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s23077", "inv_misc_enggizmos_02", "=q3=Gyrofreeze Ice Reflector", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19793", "inv_misc_monsterhead_03", "=q1=Lifelike Mechanical Toad", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s19794", "inv_helmet_47", "=q3=Spellpower Goggles Xtreme Plus", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s26426", "inv_misc_missilelargecluster_blue", "=q1=Large Blue Rocket Cluster", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "s26427", "inv_misc_missilelargecluster_green", "=q1=Large Green Rocket Cluster", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "s26428", "inv_misc_missilelargecluster_red", "=q1=Large Red Rocket Cluster", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "s23080", "spell_shadow_detectinvisibility", "=q1=Powerful Seaforium Charge", "=ds=#sr# =so1=275 =so2=275 =so3=285 =so4=295" },
		{ "s23079", "inv_misc_enggizmos_09", "=q2=Major Recombobulator", "=ds=#sr# =so1=275 =so2=285 =so3=290 =so4=295" },
		{ "s26443", "inv_misc_enggizmos_03", "=q1=Firework Cluster Launcher", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19814", "inv_crate_02", "=q1=Masterwork Target Dummy", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19795", "inv_gizmo_pipe_04", "=q1=Thorium Tube", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19796", "inv_weapon_rifle_08", "=q3=Dark Iron Rifle", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19799", "inv_misc_bomb_05", "=q1=Dark Iron Bomb", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
	},

	EngineeringArtisan2 = {
		{ "s19815", "inv_gizmo_07", "=q1=Delicate Arcanite Converter", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19800", "inv_ammo_bullet_03", "=q2=Thorium Shells", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19825", "inv_helmet_47", "=q2=Master Engineer's Goggles", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19819", "inv_jewelry_amulet_07", "=q2=Voice Amplification Modulator", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s23081", "inv_misc_enggizmos_04", "=q3=Hyper-Radiant Flame Reflector", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19831", "spell_shadow_mindbomb", "=q1=Arcane Bomb", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22704", "inv_egg_05", "=q1=Field Repair Bot 74A", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19830", "inv_misc_head_dragon_01", "=q3=Arcanite Dragonling", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22793", "inv_misc_spyglass_02", "=q3=Biznicks 247x128 Accurascope", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24356", "inv_helmet_47", "=q3=Bloodvine Goggles", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24357", "inv_helmet_44", "=q3=Bloodvine Lens", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s19833", "inv_weapon_rifle_03", "=q3=Flawless Arcanite Rifle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23082", "inv_misc_enggizmos_16", "=q3=Ultra-Flash Shadow Reflector", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22795", "inv_weapon_rifle_05", "=q4=Core Marksman Rifle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22797", "spell_arcane_portaldarnassus", "=q4=Force Reactive Disk", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45481", "inv_helmet_44", "=q4=Intricate Gyroscope Goggles", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	Gnomish1 = {
		{ "s12895", "inv_scroll_05", "=q1=Inlaid Mithril Cylinder Plans", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s15633", "inv_misc_idol_02", "=q1=Lil' Smoky", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s12899", "inv_gizmo_09", "=q1=Gnomish Shrink Ray", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12902", "inv_misc_net_01", "=q1=Gnomish Net-o-Matic Projector", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s12897", "inv_helmet_47", "=q2=Gnomish Goggles", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s12903", "inv_belt_06", "=q2=Gnomish Harm Prevention Belt", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s12905", "inv_boots_02", "=q2=Gnomish Rocket Boots", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s12906", "spell_magic_polymorphchicken", "=q1=Gnomish Battle Chicken", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s12907", "inv_helmet_49", "=q2=Gnomish Mind Control Cap", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ "s12759", "inv_gizmo_08", "=q1=Gnomish Death Ray", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s23129", "inv_misc_enggizmos_08", "=q2=World Enlarger", "=ds=#sr# =so1=260 =so2=260 =so3=265 =so4=270" },
		{ "s23489", "inv_misc_enggizmos_12", "=q2=Ultrasafe Transporter: Gadgetzan", "=ds=#sr# =so1=260 =so2=285 =so3=295 =so4=305" },
		{ "s23096", "inv_misc_enggizmos_13", "=q1=Alarm-O-Bot", "=ds=#sr# =so1=265 =so2=275 =so3=280 =so4=285" },
	},

	Goblin1 = {
		{ "s12715", "inv_scroll_03", "=q1=Goblin Rocket Fuel Recipe", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s15628", "inv_misc_bomb_04", "=q1=Pet Bombling", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s13240", "inv_musket_01", "=q1=The Mortar: Reloaded", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s12760", "spell_fire_selfdestruct", "=q1=Goblin Sapper Charge", "=ds=#sr# =so1=205 =so2=205 =so3=225 =so4=245" },
		{ "s12716", "inv_musket_01", "=q1=Goblin Mortar", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12718", "inv_helmet_60", "=q2=Goblin Construction Helmet", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12717", "inv_helmet_25", "=q2=Goblin Mining Helmet", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s8895", "inv_gizmo_rocketboot_01", "=q2=Goblin Rocket Boots", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s12755", "inv_gizmo_06", "=q1=Goblin Bomb Dispenser", "=ds=#sr# =so1=230 =so2=230 =so3=250 =so4=270" },
		{ "s12754", "inv_misc_bomb_04", "=q1=The Big One", "=ds=#sr# =so1=235 =so2=235 =so3=255 =so4=275" },
		{ "s12908", "spell_fire_flamebolt", "=q1=Goblin Dragon Gun", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s12758", "inv_helmet_49", "=q2=Goblin Rocket Helmet", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s23486", "inv_misc_enggizmos_07", "=q2=Dimensional Ripper: Everlook", "=ds=#sr# =so1=260 =so2=285 =so3=295 =so4=305" },
		{ "s23078", "inv_misc_enggizmos_11", "=q1=Goblin Jumper Cables XL", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
	},

	EngineeringEquipment1 = {
		{ "s3934", "inv_helmet_47", "=q2=Flying Tiger Goggles", "=ds=#sr# =so1=100 =so2=130 =so3=145 =so4=160" },
		{ "s3940", "inv_helmet_47", "=q2=Shadow Goggles", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3956", "inv_helmet_47", "=q2=Green Tinted Goggles", "=ds=#sr# =so1=150 =so2=175 =so3=187 =so4=200" },
		{ "s12587", "inv_helmet_47", "=q2=Bright-Eye Goggles", "=ds=#sr# =so1=175 =so2=195 =so3=205 =so4=215" },
		{ "s3966", "inv_helmet_44", "=q3=Craftsman's Monocle", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s12594", "inv_helmet_47", "=q2=Fire Goggles", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12607", "inv_helmet_47", "=q2=Catseye Ultra Goggles", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s12615", "inv_helmet_47", "=q2=Spellpower Goggles Xtreme", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s12617", "inv_helmet_49", "=q2=Deepdive Helmet", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s12618", "inv_helmet_47", "=q2=Rose Colored Goggles", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s12622", "inv_helmet_44", "=q3=Green Lens", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s19794", "inv_helmet_47", "=q3=Spellpower Goggles Xtreme Plus", "=ds=#sr# =so1=270 =so2=290 =so3=300 =so4=310" },
		{ "s19825", "inv_helmet_47", "=q2=Master Engineer's Goggles", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s24356", "inv_helmet_47", "=q3=Bloodvine Goggles", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s24357", "inv_helmet_44", "=q3=Bloodvine Lens", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s45481", "inv_helmet_44", "=q4=Intricate Gyroscope Goggles", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22797", "spell_arcane_portaldarnassus", "=q4=Force Reactive Disk", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s12897", "inv_helmet_47", "=q2=Gnomish Goggles", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s12907", "inv_helmet_49", "=q2=Gnomish Mind Control Cap", "=ds=#sr# =so1=235 =so2=255 =so3=265 =so4=275" },
		{ 0, "", "", "" },
		{ "s12718", "inv_helmet_60", "=q2=Goblin Construction Helmet", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12717", "inv_helmet_25", "=q2=Goblin Mining Helmet", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12758", "inv_helmet_49", "=q2=Goblin Rocket Helmet", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ 0, "", "", "" },
		{ "s12905", "inv_boots_02", "=q2=Gnomish Rocket Boots", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s8895", "inv_gizmo_rocketboot_01", "=q2=Goblin Rocket Boots", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ 0, "", "", "" },
		{ "s12616", "inv_misc_cape_11", "=q2=Parachute Cloak", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ "s19819", "inv_jewelry_amulet_07", "=q2=Voice Amplification Modulator", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s12903", "inv_belt_06", "=q2=Gnomish Harm Prevention Belt", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
	},

	EngineeringTrinkets1 = {
		{ "s9269", "inv_misc_pocketwatch_01", "=q2=Gnomish Universal Remote", "=ds=#sr# =so1=125 =so2=150 =so3=162 =so4=175" },
		{ "s3952", "inv_gizmo_07", "=q2=Minor Recombobulator", "=ds=#sr# =so1=140 =so2=165 =so3=177 =so4=190" },
		{ "s9273", "inv_misc_enggizmos_10", "=q1=Goblin Jumper Cables", "=ds=#sr# =so1=165 =so2=165 =so3=180 =so4=200" },
		{ "s3971", "inv_gizmo_01", "=q1=Gnomish Cloaking Device", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s3969", "inv_misc_head_dragon_01", "=q1=Mechanical Dragonling", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s12624", "inv_misc_head_dragon_01", "=q1=Mithril Mechanical Dragonling", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s23077", "inv_misc_enggizmos_02", "=q3=Gyrofreeze Ice Reflector", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s23079", "inv_misc_enggizmos_09", "=q2=Major Recombobulator", "=ds=#sr# =so1=275 =so2=285 =so3=290 =so4=295" },
		{ "s23081", "inv_misc_enggizmos_04", "=q3=Hyper-Radiant Flame Reflector", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s19830", "inv_misc_head_dragon_01", "=q3=Arcanite Dragonling", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s23082", "inv_misc_enggizmos_16", "=q3=Ultra-Flash Shadow Reflector", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s12899", "inv_gizmo_09", "=q1=Gnomish Shrink Ray", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12902", "inv_misc_net_01", "=q1=Gnomish Net-o-Matic Projector", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s12906", "spell_magic_polymorphchicken", "=q1=Gnomish Battle Chicken", "=ds=#sr# =so1=230 =so2=250 =so3=260 =so4=270" },
		{ "s12759", "inv_gizmo_08", "=q1=Gnomish Death Ray", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s23489", "inv_misc_enggizmos_12", "=q2=Ultrasafe Transporter - Gadgetzan", "=ds=#sr# =so1=260 =so2=285 =so3=295 =so4=305" },
		{ "s13240", "inv_musket_01", "=q1=The Mortar: Reloaded", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s12716", "inv_musket_01", "=q1=Goblin Mortar", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12755", "inv_gizmo_06", "=q1=Goblin Bomb Dispenser", "=ds=#sr# =so1=230 =so2=230 =so3=250 =so4=270" },
		{ "s12908", "spell_fire_flamebolt", "=q1=Goblin Dragon Gun", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s23486", "inv_misc_enggizmos_07", "=q2=Dimensional Ripper - Everlook", "=ds=#sr# =so1=260 =so2=285 =so3=295 =so4=305" },
		{ "s23078", "inv_misc_enggizmos_11", "=q1=Goblin Jumper Cables XL", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
	},

	EngineeringExplosives1 = {
		{ "s3919", "inv_misc_bomb_06", "=q1=Rough Dynamite", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ "s3923", "inv_misc_bomb_09", "=q1=Rough Copper Bomb", "=ds=#sr# =so1=30 =so2=60 =so3=75 =so4=90" },
		{ "s3931", "inv_misc_bomb_06", "=q1=Coarse Dynamite", "=ds=#sr# =so1=75 =so2=90 =so3=97 =so4=105" },
		{ "s45057", "inv_misc_bomb_06", "=q1=Unstable Mining Dynamite", "=ds=#sr# =so1=75 =so2=90 =so3=97 =so4=105" },
		{ "s8339", "inv_misc_bomb_06", "=q1=EZ-Thro Dynamite", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s3937", "inv_misc_bomb_01", "=q1=Large Copper Bomb", "=ds=#sr# =so1=105 =so2=105 =so3=130 =so4=155" },
		{ "s3941", "inv_misc_bomb_09", "=q1=Small Bronze Bomb", "=ds=#sr# =so1=120 =so2=120 =so3=145 =so4=170" },
		{ "s3946", "inv_misc_bomb_06", "=q1=Heavy Dynamite", "=ds=#sr# =so1=125 =so2=125 =so3=135 =so4=145" },
		{ "s3950", "inv_misc_bomb_05", "=q1=Big Bronze Bomb", "=ds=#sr# =so1=140 =so2=140 =so3=165 =so4=190" },
		{ "s3955", "spell_nature_polymorph", "=q1=Explosive Sheep", "=ds=#sr# =so1=150 =so2=175 =so3=187 =so4=200" },
		{ "s12586", "inv_misc_bomb_06", "=q1=Solid Dynamite", "=ds=#sr# =so1=175 =so2=175 =so3=185 =so4=195" },
		{ "s3962", "inv_misc_bomb_08", "=q1=Iron Grenade", "=ds=#sr# =so1=175 =so2=175 =so3=195 =so4=215" },
		{ "s8243", "inv_misc_ammo_bullet_01", "=q1=Flash Bomb", "=ds=#sr# =so1=185 =so2=185 =so3=205 =so4=225" },
		{ "s3967", "inv_misc_bomb_01", "=q1=Big Iron Bomb", "=ds=#sr# =so1=190 =so2=190 =so3=210 =so4=230" },
		{ "s3968", "inv_shield_08", "=q1=Goblin Land Mine", "=ds=#sr# =so1=195 =so2=215 =so3=225 =so4=235" },
		{ "s23069", "inv_misc_bomb_03", "=q1=EZ-Thro Dynamite II", "=ds=#sr# =so1=200 =so2=200 =so3=210 =so4=220" },
		{ "s12603", "inv_misc_bomb_02", "=q1=Mithril Frag Bomb", "=ds=#sr# =so1=215 =so2=215 =so3=235 =so4=255" },
		{ "s12619", "inv_misc_bomb_07", "=q1=Hi-Explosive Bomb", "=ds=#sr# =so1=235 =so2=235 =so3=255 =so4=275" },
		{ "s23070", "inv_misc_bomb_06", "=q1=Dense Dynamite", "=ds=#sr# =so1=250 =so2=250 =so3=260 =so4=270" },
		{ "s19790", "inv_misc_bomb_08", "=q1=Thorium Grenade", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s12760", "spell_fire_selfdestruct", "=q1=Goblin Sapper Charge", "=ds=#sr# =so1=205 =so2=205 =so3=225 =so4=245" },
		{ "s12754", "inv_misc_bomb_04", "=q1=The Big One", "=ds=#sr# =so1=235 =so2=235 =so3=255 =so4=275" },
		{ "s19799", "inv_misc_bomb_05", "=q1=Dark Iron Bomb", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ "s19831", "spell_shadow_mindbomb", "=q1=Arcane Bomb", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	EngineeringWeapons1 = {
		{ "s3925", "inv_weapon_rifle_03", "=q2=Rough Boomstick", "=ds=#sr# =so1=50 =so2=80 =so3=95 =so4=110" },
		{ "s3936", "inv_weapon_rifle_07", "=q2=Deadly Blunderbuss", "=ds=#sr# =so1=105 =so2=130 =so3=142 =so4=155" },
		{ "s3939", "inv_weapon_rifle_07", "=q2=Lovingly Crafted Boomstick", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s3949", "inv_weapon_rifle_07", "=q2=Silver-plated Shotgun", "=ds=#sr# =so1=130 =so2=155 =so3=167 =so4=180" },
		{ "s3954", "inv_weapon_rifle_06", "=q2=Moonsight Rifle", "=ds=#sr# =so1=145 =so2=170 =so3=182 =so4=195" },
		{ "s12595", "inv_weapon_rifle_07", "=q2=Mithril Blunderbuss", "=ds=#sr# =so1=205 =so2=225 =so3=235 =so4=245" },
		{ "s12614", "inv_weapon_rifle_07", "=q2=Mithril Heavy-bore Rifle", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s19792", "inv_weapon_rifle_07", "=q2=Thorium Rifle", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19796", "inv_weapon_rifle_08", "=q3=Dark Iron Rifle", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19833", "inv_weapon_rifle_03", "=q3=Flawless Arcanite Rifle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s22795", "inv_weapon_rifle_05", "=q4=Core Marksman Rifle", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ 0, "", "", "" },
		{ "s46610", "inv_mace_14", "=q4=Battery-Powered Crowd Pummeler", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
	},

	EngineeringParts1 = {
		{ "s3918", "inv_misc_dust_01", "=q1=Rough Blasting Powder", "=ds=#sr# =so1=1 =so2=20 =so3=30 =so4=40" },
		{ "s3929", "inv_misc_dust_02", "=q1=Coarse Blasting Powder", "=ds=#sr# =so1=75 =so2=85 =so3=90 =so4=95" },
		{ "s3945", "inv_misc_dust_06", "=q1=Heavy Blasting Powder", "=ds=#sr# =so1=125 =so2=125 =so3=135 =so4=145" },
		{ "s12585", "inv_misc_powder_black", "=q1=Solid Blasting Powder", "=ds=#sr# =so1=175 =so2=175 =so3=185 =so4=195" },
		{ "s19788", "inv_misc_ammo_gunpowder_01", "=q1=Dense Blasting Powder", "=ds=#sr# =so1=250 =so2=250 =so3=255 =so4=260" },
		{ 0, "", "", "" },
		{ "s3922", "inv_misc_gear_06", "=q1=Handful of Copper Bolts", "=ds=#sr# =so1=30 =so2=45 =so3=52 =so4=60" },
		{ "s3924", "inv_gizmo_pipe_02", "=q1=Copper Tube", "=ds=#sr# =so1=50 =so2=80 =so3=95 =so4=110" },
		{ "s3926", "inv_gizmo_03", "=q1=Copper Modulator", "=ds=#sr# =so1=65 =so2=95 =so3=110 =so4=125" },
		{ "s3973", "inv_ingot_04", "=q1=Silver Contact", "=ds=#sr# =so1=90 =so2=110 =so3=125 =so4=140" },
		{ "s3938", "inv_gizmo_pipe_01", "=q1=Bronze Tube", "=ds=#sr# =so1=105 =so2=105 =so3=130 =so4=155" },
		{ "s3942", "inv_gizmo_02", "=q1=Whirring Bronze Gizmo", "=ds=#sr# =so1=125 =so2=125 =so3=150 =so4=175" },
		{ "s3953", "inv_gizmo_bronzeframework_01", "=q1=Bronze Framework", "=ds=#sr# =so1=145 =so2=145 =so3=170 =so4=195" },
		{ "s12584", "inv_battery_02", "=q1=Gold Power Core", "=ds=#sr# =so1=150 =so2=150 =so3=170 =so4=190" },
		{ "s3958", "inv_spear_05", "=q1=Iron Strut", "=ds=#sr# =so1=160 =so2=160 =so3=170 =so4=180" },
		{ "s3961", "inv_misc_pocketwatch_02", "=q1=Gyrochronatom", "=ds=#sr# =so1=170 =so2=170 =so3=190 =so4=210" },
		{ "s12589", "inv_musket_01", "=q1=Mithril Tube", "=ds=#sr# =so1=195 =so2=195 =so3=215 =so4=235" },
		{ "s12591", "inv_battery_01", "=q1=Unstable Trigger", "=ds=#sr# =so1=200 =so2=200 =so3=220 =so4=240" },
		{ "s12599", "inv_gizmo_mithrilcasing_01", "=q1=Mithril Casing", "=ds=#sr# =so1=215 =so2=215 =so3=235 =so4=255" },
		{ "s23071", "inv_staff_18", "=q1=Truesilver Transformer", "=ds=#sr# =so1=260 =so2=270 =so3=275 =so4=280" },
		{ "s19791", "inv_gizmo_04", "=q1=Thorium Widget", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s19795", "inv_gizmo_pipe_04", "=q1=Thorium Tube", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ "s19815", "inv_gizmo_07", "=q1=Delicate Arcanite Converter", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
	},

	EngineeringMisc1 = {
		{ "s7430", "inv_misc_wrench_01", "=q1=Arclight Spanner", "=ds=#sr# =so1=50 =so2=70 =so3=80 =so4=90" },
		{ "s15007", "inv_misc_spyglass_03", "=q1=Jewelry Lens", "=ds=#sr# =so1=125 =so2=? =so3=? =so4=?" },
		{ "s15008", "inv_box_01", "=q1=Precision Jewelers Kit", "=ds=#sr# =so1=175 =so2=? =so3=? =so4=?" },
		{ "s12590", "inv_misc_screwdriver_02", "=q1=Gyromatic Micro-Adjustor", "=ds=#sr# =so1=175 =so2=175 =so3=195 =so4=215" },
		{ "s15009", "inv_misc_spyglass_02", "=q1=Jewelry Scope", "=ds=#sr# =so1=225 =so2=? =so3=? =so4=?" },
		{ 0, "", "", "" },
		{ "s3977", "inv_misc_spyglass_02", "=q1=Crude Scope", "=ds=#sr# =so1=60 =so2=90 =so3=105 =so4=120" },
		{ "s3978", "inv_misc_spyglass_02", "=q1=Standard Scope", "=ds=#sr# =so1=110 =so2=135 =so3=147 =so4=160" },
		{ "s12597", "inv_misc_spyglass_02", "=q1=Deadly Scope", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s12620", "inv_misc_spyglass_02", "=q1=Sniper Scope", "=ds=#sr# =so1=240 =so2=260 =so3=270 =so4=280" },
		{ "s22793", "inv_misc_spyglass_02", "=q3=Biznicks 247x128 Accurascope", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ 0, "", "", "" },
		{ "s3920", "inv_ammo_bullet_02", "=q1=Crafted Light Shot", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ "s3930", "inv_ammo_bullet_02", "=q1=Crafted Heavy Shot", "=ds=#sr# =so1=75 =so2=85 =so3=90 =so4=95" },
		{ "s3947", "inv_ammo_bullet_02", "=q1=Crafted Solid Shot", "=ds=#sr# =so1=125 =so2=125 =so3=135 =so4=145" },
		{ "s12621", "inv_ammo_bullet_01", "=q2=Mithril Gyro-Shot", "=ds=#sr# =so1=245 =so2=245 =so3=265 =so4=285" },
		{ "s12596", "inv_ammo_bullet_01", "=q2=Hi-Impact Mithril Slugs", "=ds=#sr# =so1=210 =so2=210 =so3=230 =so4=250" },
		{ "s19800", "inv_ammo_bullet_03", "=q2=Thorium Shells", "=ds=#sr# =so1=285 =so2=305 =so3=315 =so4=325" },
		{ 0, "", "", "" },
		{ "s6458", "inv_misc_spyglass_01", "=q1=Ornate Spyglass", "=ds=#sr# =so1=135 =so2=160 =so3=172 =so4=185" },
		{ "s9271", "inv_misc_food_26", "=q1=Aquadynamic Fish Attractor", "=ds=#sr# =so1=150 =so2=150 =so3=160 =so4=170" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ "s3932", "inv_crate_06", "=q1=Target Dummy", "=ds=#sr# =so1=85 =so2=115 =so3=130 =so4=145" },
		{ "s3965", "inv_crate_05", "=q1=Advanced Target Dummy", "=ds=#sr# =so1=185 =so2=185 =so3=205 =so4=225" },
		{ "s19814", "inv_crate_02", "=q1=Masterwork Target Dummy", "=ds=#sr# =so1=275 =so2=295 =so3=305 =so4=315" },
		{ 0, "", "", "" },
		{ "s3933", "inv_misc_urn_01", "=q1=Small Seaforium Charge", "=ds=#sr# =so1=100 =so2=130 =so3=145 =so4=160" },
		{ "s3972", "inv_misc_urn_01", "=q1=Large Seaforium Charge", "=ds=#sr# =so1=200 =so2=200 =so3=220 =so4=240" },
		{ "s23080", "spell_shadow_detectinvisibility", "=q1=Powerful Seaforium Charge", "=ds=#sr# =so1=275 =so2=275 =so3=285 =so4=295" },
	},

	EngineeringMisc2 = {
		{ "s8334", "inv_box_01", "=q1=Practice Lock", "=ds=#sr# =so1=100 =so2=115 =so3=122 =so4=130" },
		{ "s3963", "inv_helmet_08", "=q1=Compact Harvest Reaper Kit", "=ds=#sr# =so1=175 =so2=175 =so3=195 =so4=215" },
		{ 0, "", "", "" },
		{ "s47027", "inv_gizmo_06", "=q1=Portable Wormhole Generator: Stormwind", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ "s47028", "inv_gizmo_06", "=q1=Portable Wormhole Generator: Orgrimmar", "=ds=#sr# =so1=120 =so2=145 =so3=157 =so4=170" },
		{ 0, "", "", "" },
		{ "s23096", "inv_misc_enggizmos_13", "=q1=Alarm-O-Bot", "=ds=#sr# =so1=265 =so2=275 =so3=280 =so4=285" },
		{ "s19567", "inv_egg_05", "=q1=Salt Shaker", "=ds=#sr# =so1=250 =so2=270 =so3=280 =so4=290" },
		{ "s22704", "inv_egg_05", "=q1=Field Repair Bot 74A", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ 0, "", "", "" },
		{ "s3944", "inv_gizmo_01", "=q1=Flame Deflector", "=ds=#sr# =so1=125 =so2=125 =so3=150 =so4=175" },
		{ "s3957", "inv_gizmo_01", "=q1=Ice Deflector", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s3959", "inv_misc_spyglass_02", "=q1=Discombobulator Ray", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s3960", "inv_musket_01", "=q1=Portable Bronze Mortar", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s15255", "inv_gizmo_03", "=q1=Mechanical Repair Kit", "=ds=#sr# =so1=200 =so2=200 =so3=220 =so4=240" },
		{ "s23129", "inv_misc_enggizmos_08", "=q2=World Enlarger", "=ds=#sr# =so1=260 =so2=260 =so3=265 =so4=270" },
		{ "s21940", "spell_frost_windwalkon", "=q1=Snowmaster 9000", "=ds=#sr# =so1=190 =so2=190 =so3=210 =so4=230" },
		{ "s26442", "inv_musket_04", "=q1=Firework Launcher", "=ds=#sr# =so1=225 =so2=245 =so3=255 =so4=265" },
		{ 0, "", "", "" },
		{ "s12715", "inv_scroll_03", "=q1=Goblin Rocket Fuel Recipe", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s12895", "inv_scroll_05", "=q1=Inlaid Mithril Cylinder Plans", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
	},

	EngineeringMisc3 = {
		{ "s26416", "inv_misc_missilesmall_blue", "=q1=Small Blue Rocket", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s26417", "inv_misc_missilesmall_green", "=q1=Small Green Rocket", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s26418", "inv_misc_missilesmall_red", "=q1=Small Red Rocket", "=ds=#sr# =so1=125 =so2=125 =so3=137 =so4=150" },
		{ "s23067", "spell_ice_magicdamage", "=q1=Blue Firework", "=ds=#sr# =so1=150 =so2=150 =so3=162 =so4=175" },
		{ "s23068", "spell_nature_abolishmagic", "=q1=Green Firework", "=ds=#sr# =so1=150 =so2=150 =so3=162 =so4=175" },
		{ "s23066", "spell_fire_fireball02", "=q1=Red Firework", "=ds=#sr# =so1=150 =so2=150 =so3=162 =so4=175" },
		{ "s26420", "inv_misc_missilelarge_blue", "=q1=Large Blue Rocket", "=ds=#sr# =so1=175 =so2=175 =so3=187 =so4=200" },
		{ "s26421", "inv_misc_missilelarge_green", "=q1=Large Green Rocket", "=ds=#sr# =so1=175 =so2=175 =so3=187 =so4=200" },
		{ "s26422", "inv_misc_missilelarge_red", "=q1=Large Red Rocket", "=ds=#sr# =so1=175 =so2=175 =so3=187 =so4=200" },
		{ "s26423", "inv_misc_missilesmallcluster_blue", "=q1=Blue Rocket Cluster", "=ds=#sr# =so1=225 =so2=225 =so3=237 =so4=250" },
		{ "s26424", "inv_misc_missilesmallcluster_green", "=q1=Green Rocket Cluster", "=ds=#sr# =so1=225 =so2=225 =so3=237 =so4=250" },
		{ "s26425", "inv_misc_missilesmallcluster_red", "=q1=Red Rocket Cluster", "=ds=#sr# =so1=225 =so2=225 =so3=237 =so4=250" },
		{ "s23507", "spell_holy_holybolt", "=q1=Snake Burst Firework", "=ds=#sr# =so1=250 =so2=250 =so3=260 =so4=270" },
		{ "s26426", "inv_misc_missilelargecluster_blue", "=q1=Large Blue Rocket Cluster", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "s26427", "inv_misc_missilelargecluster_green", "=q1=Large Green Rocket Cluster", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ "s26428", "inv_misc_missilelargecluster_red", "=q1=Large Red Rocket Cluster", "=ds=#sr# =so1=275 =so2=275 =so3=280 =so4=285" },
		{ 0, "", "", "" },
		{ "s3928", "inv_crate_01", "=q1=Mechanical Squirrel", "=ds=#sr# =so1=75 =so2=105 =so3=120 =so4=135" },
		{ "s26011", "ability_hunter_pet_gorilla", "=q1=Tranquil Mechanical Yeti", "=ds=#sr# =so1=250 =so2=320 =so3=330 =so4=340" },
		{ "s19793", "inv_misc_monsterhead_03", "=q1=Lifelike Mechanical Toad", "=ds=#sr# =so1=265 =so2=285 =so3=295 =so4=305" },
		{ "s15633", "inv_misc_idol_02", "=q1=Lil' Smoky", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
		{ "s15628", "inv_misc_bomb_04", "=q1=Pet Bombling", "=ds=#sr# =so1=205 =so2=205 =so3=205 =so4=205" },
	},

	Mining1 = {
		{ 0, "Trade_Mining", "=q6=#sk1#", "" },
		{ 0, "", "", "" },
		{ "s100000", "inv_ore_copper_01", "=ds=Copper Vein", "=ds=#sr# =so1=1 =so2=25 =so3=50 =so4=100" },
		{ "s100030", "inv_stone_06", "=ds=Rough Stone", "=ds=#sr# =so1=1 =so2=25 =so3=50 =so4=100" },
		{ "s100001", "inv_ore_thorium_01", "=ds=Incendicite Mineral Vein", "=ds=#sr# =so1=65 =so2=90 =so3=115 =so4=165" },
		{ "s100002", "inv_ore_tin_01", "=ds=Tin Vein", "=ds=#sr# =so1=65 =so2=90 =so3=115 =so4=165" },
		{ "s100031", "inv_stone_09", "=ds=Coarse Stone", "=ds=#sr# =so1=65 =so2=90 =so3=115 =so4=165" },
		{ "s100003", "inv_stone_16", "=ds=Silver Vein", "=ds=#sr# =so1=75 =so2=100 =so3=125 =so4=175" },
		{ "s100004", "inv_stone_16", "=ds=Ooze Covered Silver Vein", "=ds=#sr# =so1=75 =so2=100 =so3=125 =so4=175" },
		{ "s100005", "inv_ore_thorium_01", "=ds=Lesser Bloodstone Deposit", "=ds=#sr# =so1=75 =so2=100 =so3=125 =so4=175" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "Trade_Mining", "=q6=#sk2#", "" },
		{ 0, "", "", "" },
		{ "s100006", "inv_ore_iron_01", "=ds=Iron Deposit", "=ds=#sr# =so1=125 =so2=150 =so3=175 =so4=225" },
		{ "s100032", "inv_stone_12", "=ds=Heavy Stone", "=ds=#sr# =so1=125 =so2=150 =so3=175 =so4=225" },
		{ "s100007", "inv_ore_mithril_01", "=ds=Indurium Mineral Vein", "=ds=#sr# =so1=150 =so2=175 =so3=200 =so4=250" },
		{ 0, "", "", "" },
		{ 0, "Trade_Mining", "=q6=#sk3#", "" },
		{ 0, "", "", "" },
		{ "s100008", "inv_ore_copper_01", "=ds=Gold Vein", "=ds=#sr# =so1=155 =so2=175 =so3=205 =so4=255" },
		{ "s100009", "inv_ore_copper_01", "=ds=Ooze Covered Gold Vein", "=ds=#sr# =so1=155 =so2=175 =so3=205 =so4=255" },
		{ "s100010", "inv_ore_mithril_02", "=ds=Mithril Deposit", "=ds=#sr# =so1=175 =so2=200 =so3=225 =so4=275" },
		{ "s100033", "inv_stone_10", "=ds=Solid Stone", "=ds=#sr# =so1=175 =so2=200 =so3=225 =so4=275" },
		{ "s100011", "inv_ore_mithril_02", "=ds=Ooze Covered Mithril Deposit", "=ds=#sr# =so1=175 =so2=200 =so3=225 =so4=275" },
		{ "s100034", "inv_stone_10", "=ds=Solid Stone", "=ds=#sr# =so1=175 =so2=200 =so3=225 =so4=275" },
	},

	Mining2 = {
		{ 0, "Trade_Mining", "=q6=#sk4#", "" },
		{ 0, "", "", "" },
		{ "s100014", "inv_ore_mithril_01", "=ds=Dark Iron Deposit", "=ds=#sr# =so1=230 =so2=255 =so3=280 =so4=330" },
		{ "s100012", "inv_ore_truesilver_01", "=ds=Truesilver Deposit", "=ds=#sr# =so1=230 =so2=255 =so3=280 =so4=330" },
		{ "s100013", "inv_ore_truesilver_01", "=ds=Ooze Covered Truesilver Deposit", "=ds=#sr# =so1=230 =so2=255 =so3=280 =so4=330" },
		{ "s100015", "inv_ore_thorium_02", "=ds=Small Thorium Vein", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ "s100035", "inv_misc_stonetablet_07", "=ds=Dense Stone", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ "s100016", "inv_ore_thorium_02", "=ds=Ooze Covered Thorium Vein", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ "s100036", "inv_misc_stonetablet_07", "=ds=Dense Stone", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ "s100017", "inv_ore_thorium_02", "=ds=Rich Thorium Vein", "=ds=#sr# =so1=275 =so2=300 =so3=325 =so4=365" },
		{ "s100037", "inv_misc_stonetablet_07", "=ds=Dense Stone", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ "s100018", "inv_ore_thorium_02", "=ds=Ooze Covered Rich Thorium Vein", "=ds=#sr# =so1=275 =so2=300 =so3=325 =so4=365" },
		{ "s100038", "inv_misc_stonetablet_07", "=ds=Dense Stone", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ "s100019", "inv_ore_thorium_02", "=ds=Hakkari Thorium Vein", "=ds=#sr# =so1=275 =so2=300 =so3=325 =so4=350" },
		{ "s100039", "inv_misc_stonetablet_07", "=ds=Dense Stone", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ "s100020", "inv_misc_gem_01", "=ds=Souldarite", "=ds=#sr# =so1=275 =so2=300 =so3=325 =so4=350" },
		{ "s100021", "inv_misc_stonetablet_01", "=ds=Small Obsidian Chunk", "=ds=#sr# =so1=305 =so2=330 =so3=355 =so4=370" },
		{ "s100022", "inv_stone_15", "=ds=Small Obsidian Chunk", "=ds=#sr# =so1=305 =so2=330 =so3=355 =so4=370" },
		{ "s100023", "inv_misc_stonetablet_01", "=ds=Large Obsidian Chunk", "=ds=#sr# =so1=305 =so2=330 =so3=355 =so4=370" },
		{ "s100024", "inv_stone_15", "=ds=Large Obsidian Chunk", "=ds=#sr# =so1=305 =so2=330 =so3=355 =so4=370" },
		{ "s100025", "inv_misc_gem_01", "=ds=Gemstone Deposit", "=ds=#sr# =so1=310 =so2=335 =so3=360 =so4=375" },
	},

	Smelting1 = {
		{ 0, "Spell_Fire_FlameBlades", "=q6=#sk1#", "" },
		{ "s2657", "inv_ingot_02", "=q1=Smelt Copper", "=ds=#sr# =so1=1 =so2=25 =so3=45 =so4=70" },
		{ "s3304", "inv_ingot_05", "=q1=Smelt Tin", "=ds=#sr# =so1=65 =so2=65 =so3=70 =so4=75" },
		{ "s2659", "inv_ingot_bronze", "=q1=Smelt Bronze", "=ds=#sr# =so1=65 =so2=65 =so3=90 =so4=115" },
		{ "s2658", "inv_ingot_01", "=q2=Smelt Silver", "=ds=#sr# =so1=75 =so2=100 =so3=112 =so4=125" },
		{ 0, "", "", "" },
		{ 0, "Spell_Fire_FlameBlades", "=q6=#sk2#", "" },
		{ "s3307", "inv_ingot_iron", "=q1=Smelt Iron", "=ds=#sr# =so1=125 =so2=125 =so3=130 =so4=140" },
		{ 0, "", "", "" },
		{ 0, "Spell_Fire_FlameBlades", "=q6=#sk3#", "" },
		{ "s3308", "inv_ingot_03", "=q2=Smelt Gold", "=ds=#sr# =so1=155 =so2=170 =so3=177 =so4=185" },
		{ "s3569", "inv_ingot_steel", "=q1=Smelt Steel", "=ds=#sr# =so1=165 =so2=165 =so3=165 =so4=165" },
		{ "s10097", "inv_ingot_06", "=q1=Smelt Mithril", "=ds=#sr# =so1=175 =so2=175 =so3=175 =so4=175" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "Spell_Fire_FlameBlades", "=q6=#sk4#", "" },
		{ "s14891", "inv_ingot_mithril", "=q1=Smelt Dark Iron", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s10098", "inv_ingot_08", "=q2=Smelt Truesilver", "=ds=#sr# =so1=230 =so2=230 =so3=230 =so4=230" },
		{ "s16153", "inv_ingot_07", "=q1=Smelt Thorium", "=ds=#sr# =so1=250 =so2=250 =so3=250 =so4=250" },
		{ "s22967", "inv_ingot_thorium", "=q5=Smelt Elementium", "=ds=#sr# =so1=300 =so2=350 =so3=362 =so4=375" },
		{ "s45451", "INV_Ingot_DreamSteel", "=q5=Smelt Dreamsteel", "=ds=#sr# =so1=300 =so2=350 =so3=362 =so4=375" },
	},

	Herbalism1 = {
		{ 0, "Trade_Herbalism", "=q6=#sk1#", "" },
		{ 2447, "inv_misc_flower_02", "=q1=Peacebloom", "=ds=#sr# =so1=1 =so2=25 =so3=50 =so4=100" },
		{ 765, "inv_misc_herb_10", "=q1=Silverleaf", "=ds=#sr# =so1=1 =so2=25 =so3=50 =so4=100" },
		{ 2449, "inv_misc_herb_07", "=q1=Earthroot", "=ds=#sr# =so1=15 =so2=40 =so3=65 =so4=115" },
		{ 785, "inv_jewelry_talisman_03", "=q1=Mageroyal", "=ds=#sr# =so1=50 =so2=75 =so3=100 =so4=150" },
		{ 2450, "inv_misc_root_01", "=q1=Briarthorn", "=ds=#sr# =so1=70 =so2=95 =so3=120 =so4=170" },
		{ 2452, "inv_misc_herb_04", "=q1=Swiftthistle", "=ds=#sr# =so1=-- =so2=-- =so3=-- =so4=--" },
		{ 0, "", "", "" },
		{ 0, "Trade_Herbalism", "=q6=#sk2#", "" },
		{ 3820, "inv_misc_herb_11", "=q1=Stranglekelp", "=ds=#sr# =so1=85 =so2=115 =so3=135 =so4=185" },
		{ 2453, "inv_misc_herb_01", "=q1=Bruiseweed", "=ds=#sr# =so1=100 =so2=130 =so3=150 =so4=200" },
		{ 3355, "inv_misc_flower_01", "=q1=Wild Steelbloom", "=ds=#sr# =so1=115 =so2=145 =so3=165 =so4=215" },
		{ 3369, "inv_misc_dust_02", "=q1=Grave Moss", "=ds=#sr# =so1=120 =so2=150 =so3=170 =so4=220" },
		{ 3356, "inv_misc_herb_03", "=q1=Kingsblood", "=ds=#sr# =so1=125 =so2=155 =so3=175 =so4=225" },
		{ 3357, "inv_misc_root_02", "=q1=Liferoot", "=ds=#sr# =so1=150 =so2=175 =so3=200 =so4=250" },
		{ 0, "Trade_Herbalism", "=q6=#sk3#", "" },
		{ 3818, "inv_misc_herb_12", "=q1=Fadeleaf", "=ds=#sr# =so1=160 =so2=190 =so3=210 =so4=260" },
		{ 3821, "inv_misc_herb_15", "=q1=Goldthorn", "=ds=#sr# =so1=170 =so2=195 =so3=220 =so4=270" },
		{ 3358, "inv_misc_herb_08", "=q1=Khadgar's Whisker", "=ds=#sr# =so1=185 =so2=210 =so3=235 =so4=285" },
		{ 3819, "inv_misc_flower_03", "=q1=Wintersbite", "=ds=#sr# =so1=195 =so2=225 =so3=245 =so4=295" },
		{ 4625, "inv_misc_herb_19", "=q1=Firebloom", "=ds=#sr# =so1=205 =so2=235 =so3=255 =so4=305" },
		{ 8831, "inv_misc_herb_17", "=q1=Purple Lotus", "=ds=#sr# =so1=210 =so2=240 =so3=260 =so4=310" },
		{ 8153, "inv_misc_herb_03", "=q1=Wildvine", "=ds=#sr# =so1=-- =so2=-- =so3=-- =so4=--" },
		{ 8836, "inv_misc_herb_13", "=q1=Arthas' Tears", "=ds=#sr# =so1=220 =so2=250 =so3=270 =so4=320" },
		{ 0, "", "", "" },
		{ 0, "Trade_Herbalism", "=q6=#sk4#", "" },
		{ 8838, "inv_misc_herb_18", "=q1=Sungrass", "=ds=#sr# =so1=230 =so2=255 =so3=280 =so4=330" },
		{ 8839, "inv_misc_herb_14", "=q1=Blindweed", "=ds=#sr# =so1=235 =so2=260 =so3=285 =so4=335" },
		{ 8845, "inv_mushroom_08", "=q1=Ghost Mushroom", "=ds=#sr# =so1=245 =so2=270 =so3=295 =so4=345" },
		{ 8846, "inv_misc_herb_16", "=q1=Gromsblood", "=ds=#sr# =so1=250 =so2=275 =so3=300 =so4=350" },
	},

	Herbalism2 = {
		{ 13464, "inv_misc_herb_sansamroot", "=q1=Golden Sansam", "=ds=#sr# =so1=260 =so2=280 =so3=310 =so4=360" },
		{ 13463, "inv_misc_herb_dreamfoil", "=q1=Dreamfoil", "=ds=#sr# =so1=270 =so2=295 =so3=320 =so4=370" },
		{ 13465, "inv_misc_herb_mountainsilversage", "=q1=Mountain Silversage", "=ds=#sr# =so1=280 =so2=305 =so3=330 =so4=380" },
		{ 13466, "inv_misc_herb_plaguebloom", "=q1=Plaguebloom", "=ds=#sr# =so1=285 =so2=310 =so3=335 =so4=385" },
		{ 13467, "inv_misc_herb_icecap", "=q1=Icecap", "=ds=#sr# =so1=290 =so2=315 =so3=340 =so4=390" },
		{ 13468, "inv_misc_herb_blacklotus", "=q2=Black Lotus", "=ds=#sr# =so1=300 =so2=345 =so3=375 =so4=400" },
		{ 19726, "inv_misc_herb_09", "=q2=Bloodvine", "=ds=#sr# =so1=-- =so2=-- =so3=-- =so4=--" },
	},

	CookingApprentice1 = {
		{ "s818", "spell_fire_fire", "=ds=Basic Campfire", "" },
		{ 0, "", "", "" },
		{ "s7751", "inv_misc_fish_07", "=q1=Brilliant Smallfish", "=ds=#sr# =so1=1 =so2=45 =so3=65 =so4=85" },
		{ "s2538", "inv_misc_food_18", "=q1=Charred Wolf Meat", "=ds=#sr# =so1=1 =so2=45 =so3=65 =so4=85" },
		{ "s15935", "inv_misc_food_46", "=q1=Crispy Bat Wing", "=ds=#sr# =so1=1 =so2=45 =so3=65 =so4=85" },
		{ "s21143", "inv_misc_food_62", "=q1=Gingerbread Cookie", "=ds=#sr# =so1=1 =so2=45 =so3=65 =so4=85" },
		{ "s8604", "inv_egg_03", "=q1=Herb Baked Egg", "=ds=#sr# =so1=1 =so2=45 =so3=65 =so4=85" },
		{ "s2540", "inv_misc_food_18", "=q1=Roasted Boar Meat", "=ds=#sr# =so1=1 =so2=45 =so3=65 =so4=85" },
		{ "s7752", "inv_misc_fish_24", "=q1=Slitherskin Mackerel", "=ds=#sr# =so1=1 =so2=45 =so3=65 =so4=85" },
		{ "s6412", "inv_misc_food_68", "=q1=Kaldorei Spider Kabob", "=ds=#sr# =so1=10 =so2=50 =so3=70 =so4=90" },
		{ "s2539", "inv_misc_food_65", "=q1=Spiced Wolf Meat", "=ds=#sr# =so1=10 =so2=50 =so3=70 =so4=90" },
		{ "s6413", "inv_misc_food_10", "=q1=Scorpid Surprise", "=ds=#sr# =so1=20 =so2=60 =so3=80 =so4=100" },
		{ "s2795", "inv_misc_food_48", "=q1=Beer Basted Boar Ribs", "=ds=#sr# =so1=25 =so2=60 =so3=80 =so4=100" },
		{ "s21144", "inv_drink_04", "=q1=Egg Nog", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s45054", "inv_drink_04", "=q1=Maritime Gumbo", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s6414", "inv_misc_food_60", "=q1=Roasted Kodo Meat", "=ds=#sr# =so1=35 =so2=75 =so3=95 =so4=115" },
		{ "s8607", "inv_misc_food_13", "=q1=Smoked Bear Meat", "=ds=#sr# =so1=40 =so2=80 =so3=100 =so4=120" },
		{ "s6499", "inv_misc_shell_02", "=q1=Boiled Clams", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s2541", "inv_misc_food_65", "=q1=Coyote Steak", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s6415", "inv_misc_fish_05", "=q1=Fillet of Frenzy", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s2542", "inv_misc_food_10", "=q1=Goretusk Liver Pie", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s7754", "inv_potion_01", "=q1=Loch Frenzy Delight", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s7753", "inv_misc_fish_32", "=q1=Longjaw Mud Snapper", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s7827", "inv_misc_fish_27", "=q1=Rainbow Fin Albacore", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s6416", "inv_misc_bowl_01", "=q1=Strider Stew", "=ds=#sr# =so1=50 =so2=90 =so3=110 =so4=130" },
		{ "s3371", "inv_misc_food_49", "=q1=Blood Sausage", "=ds=#sr# =so1=60 =so2=100 =so3=120 =so4=140" },
		{ "s9513", "inv_drink_milk_05", "=q1=Thistle Tea", "=ds=#sr# =so1=60 =so2=100 =so3=120 =so4=140" },
		{ "s2544", "inv_misc_food_08", "=q1=Crab Cake", "=ds=#sr# =so1=75 =so2=115 =so3=135 =so4=155" },
		{ "s2543", "inv_misc_bowl_01", "=q1=Westfall Stew", "=ds=#sr# =so1=75 =so2=115 =so3=135 =so4=155" },
	},

	CookingJourneyman1 = {
		{ "s3370", "inv_misc_food_47", "=q1=Crocolisk Steak", "=ds=#sr# =so1=80 =so2=120 =so3=140 =so4=160" },
		{ "s2546", "inv_misc_food_48", "=q1=Dry Pork Ribs", "=ds=#sr# =so1=80 =so2=120 =so3=140 =so4=160" },
		{ "s25704", "inv_misc_fish_20", "=q1=Smoked Sagefish", "=ds=#sr# =so1=80 =so2=120 =so3=140 =so4=160" },
		{ "s2545", "inv_misc_birdbeck_02", "=q1=Cooked Crab Claw", "=ds=#sr# =so1=85 =so2=125 =so3=145 =so4=165" },
		{ "s8238", "inv_misc_monsterhead_04", "=q1=Savory Deviate Delight", "=ds=#sr# =so1=85 =so2=125 =so3=145 =so4=165" },
		{ "s6501", "inv_potion_01", "=q1=Clam Chowder", "=ds=#sr# =so1=90 =so2=130 =so3=150 =so4=170" },
		{ "s6417", "inv_misc_bowl_01", "=q1=Dig Rat Stew", "=ds=#sr# =so1=90 =so2=130 =so3=150 =so4=170" },
		{ "s3372", "inv_misc_bowl_01", "=q1=Murloc Fin Soup", "=ds=#sr# =so1=90 =so2=130 =so3=150 =so4=170" },
		{ "s2547", "inv_misc_bowl_01", "=q1=Redridge Goulash", "=ds=#sr# =so1=100 =so2=135 =so3=155 =so4=175" },
		{ "s7755", "inv_misc_fish_30", "=q1=Bristle Whisker Catfish", "=ds=#sr# =so1=100 =so2=140 =so3=160 =so4=180" },
		{ "s6418", "inv_misc_food_17", "=q1=Crispy Lizard Tail", "=ds=#sr# =so1=100 =so2=140 =so3=160 =so4=180" },
		{ "s2549", "inv_misc_food_16", "=q1=Seasoned Wolf Kabob", "=ds=#sr# =so1=100 =so2=140 =so3=160 =so4=180" },
		{ "s2548", "inv_misc_food_16", "=q1=Succulent Pork Ribs", "=ds=#sr# =so1=110 =so2=130 =so3=150 =so4=170" },
		{ "s3397", "inv_misc_food_47", "=q1=Big Bear Steak", "=ds=#sr# =so1=110 =so2=150 =so3=170 =so4=190" },
		{ "s3377", "inv_misc_food_10", "=q1=Gooey Spider Cake", "=ds=#sr# =so1=110 =so2=150 =so3=170 =so4=190" },
		{ "s6419", "inv_misc_food_72", "=q1=Lean Venison", "=ds=#sr# =so1=110 =so2=150 =so3=170 =so4=190" },
		{ "s3373", "inv_misc_bowl_01", "=q1=Crocolisk Gumbo", "=ds=#sr# =so1=120 =so2=160 =so3=180 =so4=200" },
		{ "s6500", "inv_misc_shell_01", "=q1=Goblin Deviled Clams", "=ds=#sr# =so1=125 =so2=165 =so3=185 =so4=205" },
		{ "s15853", "inv_misc_food_47", "=q1=Lean Wolf Steak", "=ds=#sr# =so1=125 =so2=165 =so3=185 =so4=205" },
		{ "s3398", "inv_misc_food_18", "=q1=Hot Lion Chops", "=ds=#sr# =so1=125 =so2=175 =so3=195 =so4=215" },
		{ "s3376", "inv_egg_04", "=q1=Curiously Tasty Omelet", "=ds=#sr# =so1=130 =so2=170 =so3=190 =so4=210" },
		{ "s24418", "inv_misc_food_64", "=q1=Heavy Crocolisk Stew", "=ds=#sr# =so1=150 =so2=160 =so3=180 =so4=200" },
		{ "s3399", "inv_misc_food_14", "=q1=Tasty Lion Steak", "=ds=#sr# =so1=150 =so2=190 =so3=210 =so4=230" },
	},

	CookingExpert1 = {
		{ "s13028", "inv_drink_15", "=q1=Goldthorn Tea", "=ds=#sr# =so1=175 =so2=175 =so3=190 =so4=205" },
		{ "s7828", "inv_misc_fish_04", "=q1=Rockscale Cod", "=ds=#sr# =so1=175 =so2=190 =so3=210 =so4=230" },
		{ "s4094", "inv_misc_food_18", "=q1=Barbecued Buzzard Wing", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s15863", "inv_misc_food_49", "=q1=Carrion Surprise", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s7213", "inv_ammo_firetar", "=q1=Giant Clam Scorcho", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s15856", "inv_misc_food_48", "=q1=Hot Wolf Ribs", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s15861", "inv_drink_17", "=q1=Jungle Stew", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s20916", "inv_misc_fish_02", "=q1=Mithril Headed Trout", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s15865", "inv_drink_19", "=q1=Mystery Stew", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s15855", "inv_misc_food_50", "=q1=Roast Raptor", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s25954", "inv_misc_fish_21", "=q1=Sagefish Delight", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s3400", "inv_misc_bowl_01", "=q1=Soothing Turtle Bisque", "=ds=#sr# =so1=175 =so2=215 =so3=235 =so4=255" },
		{ "s45627", "inv_drink_19", "=q1=Gilneas Hot Stew", "=ds=#sr# =so1=200 =so2=240 =so3=260 =so4=280" },
		{ "s15906", "inv_drink_17", "=q1=Dragonbreath Chili", "=ds=#sr# =so1=200 =so2=240 =so3=260 =so4=280" },
		{ "s15910", "inv_drink_19", "=q1=Heavy Kodo Stew", "=ds=#sr# =so1=200 =so2=240 =so3=260 =so4=280" },
		{ "s21175", "inv_misc_food_66", "=q1=Spider Sausage", "=ds=#sr# =so1=200 =so2=240 =so3=260 =so4=280" },
		{ "s18239", "inv_misc_monsterhead_03", "=q1=Cooked Glossy Mightfish", "=ds=#sr# =so1=225 =so2=265 =so3=285 =so4=305" },
		{ "s18241", "inv_misc_fish_06", "=q1=Filet of Redgill", "=ds=#sr# =so1=225 =so2=265 =so3=285 =so4=305" },
		{ "s15933", "inv_misc_food_06", "=q1=Monster Omelet", "=ds=#sr# =so1=225 =so2=265 =so3=285 =so4=305" },
		{ "s15915", "inv_misc_food_48", "=q1=Spiced Chili Crab", "=ds=#sr# =so1=225 =so2=265 =so3=285 =so4=305" },
		{ "s18238", "inv_misc_fish_01", "=q1=Spotted Yellowtail", "=ds=#sr# =so1=225 =so2=265 =so3=285 =so4=305" },
		{ "s22480", "inv_misc_food_47", "=q1=Tender Wolf Steak", "=ds=#sr# =so1=225 =so2=265 =so3=285 =so4=305" },
		{ "s20626", "inv_drink_17", "=q1=Undermine Clam Chowder", "=ds=#sr# =so1=225 =so2=265 =so3=285 =so4=305" },
	},

	CookingArtisan1 = {
		{ "s18240", "inv_misc_fish_13", "=q1=Grilled Squid", "=ds=#sr# =so1=240 =so2=280 =so3=300 =so4=320" },
		{ "s18242", "inv_misc_fish_03", "=q1=Hot Smoked Bass", "=ds=#sr# =so1=240 =so2=280 =so3=300 =so4=320" },
		{ "s18243", "inv_drink_17", "=q1=Nightfin Soup", "=ds=#sr# =so1=250 =so2=290 =so3=310 =so4=330" },
		{ "s18244", "inv_misc_fish_19", "=q1=Poached Sunscale Salmon", "=ds=#sr# =so1=250 =so2=290 =so3=310 =so4=330" },
		{ "s18247", "inv_misc_fish_20", "=q1=Baked Salmon", "=ds=#sr# =so1=275 =so2=315 =so3=335 =so4=355" },
		{ "s18245", "inv_drink_17", "=q1=Lobster Stew", "=ds=#sr# =so1=275 =so2=315 =so3=335 =so4=355" },
		{ "s18246", "inv_misc_food_47", "=q1=Mightfish Steak", "=ds=#sr# =so1=275 =so2=315 =so3=335 =so4=355" },
		{ "s22761", "inv_misc_food_63", "=q1=Runn Tum Tuber Surprise", "=ds=#sr# =so1=275 =so2=315 =so3=335 =so4=355" },
		{ "s24801", "inv_misc_food_64", "=q1=Smoked Desert Dumplings", "=ds=#sr# =so1=285 =so2=325 =so3=345 =so4=365" },
		{ "s25659", "inv_misc_food_65", "=q1=Dirge's Kickin' Chimaerok Chops", "=ds=#sr# =so1=300 =so2=325 =so3=345 =so4=365" },
		{ "s57031", "inv_misc_food_09", "=q1=Danonzo's Tel'Abim Surprise", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57032", "inv_misc_food_08", "=q1=Danonzo's Tel'Abim Medley", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s57033", "inv_drink_17", "=q1=Danonzo's Tel'Abim Delight", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s46085", "inv_misc_food_64", "=q1=Gurubashi Gumbo", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s45625", "INV_Misc_Fishe_Au_Chocolate", "=q1=Le Fishe Au Chocolat", "=ds=#sr# =so1=300 =so2=300 =so3=300 =so4=300" },
		{ "s49551", "INV_Misc_Food_Salad", "=q1=Empowering Herbal Salad", "=ds=#sr# =so1=300 =so2=325 =so3=345 =so4=365" },
	},

	FirstAid1 = {
		{ 0, "Spell_Holy_SealOfSacrifice", "=q6=#sk1#", "" },
		{ "s3275", "inv_misc_bandage_15", "=q1=Linen Bandage", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ "s3276", "inv_misc_bandage_18", "=q1=Heavy Linen Bandage", "=ds=#sr# =so1=40 =so2=50 =so3=75 =so4=100" },
		{ 0, "", "", "" },
		{ 0, "Spell_Holy_SealOfSacrifice", "=q6=#sk2#", "" },
		{ "s7934", "inv_misc_slime_01", "=q1=Anti-Venom", "=ds=#sr# =so1=80 =so2=80 =so3=115 =so4=150" },
		{ "s3277", "inv_misc_bandage_14", "=q1=Wool Bandage", "=ds=#sr# =so1=80 =so2=80 =so3=115 =so4=150" },
		{ "s3278", "inv_misc_bandage_17", "=q1=Heavy Wool Bandage", "=ds=#sr# =so1=115 =so2=115 =so3=150 =so4=185" },
		{ "s7935", "inv_misc_slime_01", "=q1=Strong Anti-Venom", "=ds=#sr# =so1=130 =so2=130 =so3=165 =so4=200" },
		{ "s7928", "inv_misc_bandage_01", "=q1=Silk Bandage", "=ds=#sr# =so1=150 =so2=150 =so3=180 =so4=210" },
		{ 0, "", "", "" },
		{ 0, "Spell_Holy_SealOfSacrifice", "=q6=#sk3#", "" },
		{ "s7929", "inv_misc_bandage_02", "=q1=Heavy Silk Bandage", "=ds=#sr# =so1=180 =so2=180 =so3=210 =so4=240" },
		{ "s10840", "inv_misc_bandage_19", "=q1=Mageweave Bandage", "=ds=#sr# =so1=210 =so2=210 =so3=240 =so4=270" },
		{ 0, "", "", "" },
		{ 0, "Spell_Holy_SealOfSacrifice", "=q6=#sk4#", "" },
		{ "s10841", "inv_misc_bandage_20", "=q1=Heavy Mageweave Bandage", "=ds=#sr# =so1=240 =so2=240 =so3=270 =so4=300" },
		{ "s10844", "inv_misc_ammo_gunpowder_02", "=q1=Powerful Smelling Salts", "=ds=#sr# =so1=250 =so2=260 =so3=280 =so4=310" },
		{ "s18629", "inv_misc_bandage_11", "=q1=Runecloth Bandage", "=ds=#sr# =so1=260 =so2=260 =so3=290 =so4=320" },
		{ "s18630", "inv_misc_bandage_12", "=q1=Heavy Runecloth Bandage", "=ds=#sr# =so1=290 =so2=290 =so3=320 =so4=350" },
		{ "s23787", "inv_drink_14", "=q1=Powerful Anti-Venom", "=ds=#sr# =so1=300 =so2=300 =so3=330 =so4=360" },
	},

	Survival1 = {
		{ 0, "Trade_Survival", "=q6=#p18#", "" },
		{ 0, "", "", "" },
		{ "s46064", "inv_torch_lit", "=q1=Dim Torch", "=ds=#sr# =so1=1 =so2=30 =so3=45 =so4=60" },
		{ 0, "", "", "" },
		{ "s46075", "inv_misc_lantern_01", "=q2=Iron Lantern", "=ds=#sr# =so1=30 =so2=30 =so3=45 =so4=60" },
		{ 0, "", "", "" },
		{ "s46068", "inv_misc_bandage_07", "=q1=Cleaning Cloth", "=ds=#sr# =so1=50,  =so2=? =so3=? =so4=?" },
		{ "s46072", "Trade_Survival", "=q2=Traveler's Tent", "=ds=#sr# =so1=50 =so2=100 =so3=? =so4=?" },
		{ 0, "", "", "" },
		{ "s46074", "trade_herbalism", "=q2=Simple Woodern Planter", "=ds=#sr# =so1=75 =so2=100 =so3=112 =so4=125" },
		{ "s46073", "inv_tradeskillitem_02", "=q2=Fishing Boat", "=ds=#sr# =so1=75 =so2=125 =so3=150 =so4=?" },
		{ "s46066", "inv_boots_fabric_01", "=q2=Murloc's Flippers", "=ds=#sr# =so1=75 =so2=150 =so3=? =so4=?" },
		{ 0, "", "", "" },
		{ "s46077", "inv_misc_lantern_01", "=q3=Repaired Electro-Lantern", "=ds=#sr# =so1=90 =so2=120 =so3=135 =so4=150" },
	},

	Survival2 = {
		{ 0, "", "", "" },
		{ 0, "trade_herbalism", "=q6=#p19#", "" },
		{ 0, "", "", "" },
		{ 51706, "inv_misc_bag_03", "=q1=Country Pumpkin Seeds", "", "" },
		{ 51713, "inv_misc_food_25", "=q1=Plump Country Pumpkin", "3-8", "" },
		{ 51710, "inv_misc_food_25", "=q1=Plump Country Pumpkin", "3-8", "" },
		{ 0, "", "", "" },
		{ 51707, "inv_misc_bag_04", "=q1=Mountain Berry Bush Seeds", "3-8", "" },
		{ 51711, "inv_misc_food_40", "=q1=Sweet Mountain Berry", "3-8", "" },
		{ 51714, "inv_misc_food_40", "=q1=Sweet Mountain Berry", "3-8", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 0, "", "", "" },
		{ 51708, "inv_misc_bag_06", "=q1=Striped Melon Seeds", "", "" },
		{ 51718, "inv_misc_food_22", "=q1=Juicy Striped Melon", "3-8", "" },
		{ 51712, "inv_misc_food_22", "=q1=Juicy Striped Melon", "3-8", "" },
		{ 0, "", "", "" },
		{ 51716, "inv_misc_bag_04", "=q1=Magic Mushroom Spores", "", "" },
		{ 51720, "inv_mushroom_11", "=q1=Power Mushroom", "2-6", "" },
		{ 51717, "inv_mushroom_11", "=q1=Hardened Mushroom", "2-6", "" },
	},

	JewelcraftingApprentice1 = {
		{ "s29728", "INV_Misc_Bandage_08", "=q1=Rough Gritted Paper", "=ds=#sr# =so1=1 =so2=21 =so3=25 =so4=30" },
		{ "s29730", "BTNCopperring01", "=q1=Rough Copper Ring", "=ds=#sr# =so1=1 =so2=21 =so3=30 =so4=40" },
		{ "s29732", "INV_Bracer_03", "=q1=Copper Bangle", "=ds=#sr# =so1=1 =so2=21 =so3=33 =so4=45" },
		{ "s41001", "INV_Jewelry_Ring_12", "=q2=Bright Copper Ring", "=ds=#sr# =so1=15 =so2=35 =so3=45 =so4=55" },
		{ "s41003", "INV_Jewelry_Ring_18", "=q2=Malachite Ring", "=ds=#sr# =so1=20 =so2=40 =so3=47 =so4=55" },
		{ "s41249", "INV_Jewelry_Ring_07", "=q2=Bulky Copper Ring", "=ds=#sr# =so1=25 =so2=25 =so3=45 =so4=65" },
		{ "s41005", "INV_Jewelry_Ring_13", "=q2=Sturdy Copper Ring", "=ds=#sr# =so1=25 =so2=45 =so3=52 =so4=60" },
		{ "s41031", "INV_Ore_Tin_01", "=q1=Rough Gemstone Cluster", "=ds=#sr# =so1=35 =so2=45 =so3=50 =so4=55" },
		{ "s41007", "INV_Jewelry_Ring_06", "=q2=Inlaid Copper Ring", "=ds=#sr# =so1=35 =so2=55 =so3=62 =so4=70" },
		{ "s41009", "INV_Staff_07", "=q1=Copper Staff", "=ds=#sr# =so1=45 =so2=60 =so3=67 =so4=75" },
		{ "s41011", "INV_Bracer_09", "=q2=Encrusted Copper Bangle", "=ds=#sr# =so1=50 =so2=70 =so3=75 =so4=80" },
		{ "s41013", "INV_Jewelry_Ring_19", "=q2=Lesser Fortification Ring", "=ds=#sr# =so1=50 =so2=70 =so3=77 =so4=85" },
		{ "s41015", "INV_Jewelry_Ring_02", "=q2=Tigercrest Ring", "=ds=#sr# =so1=50 =so2=70 =so3=77 =so4=85" },
		{ "s41231", "INV_Jewelry_Ring_27", "=q2=Minor Trollblood Ring", "=ds=#sr# =so1=50 =so2=70 =so3=80 =so4=90" },
		{ "s41017", "INV_Staff_10", "=q2=Small Pearlstone Staff", "=ds=#sr# =so1=55 =so2=75 =so3=82 =so4=90" },
		{ "s41019", "INV_Jewelry_Ring_03", "=q2=Amber Ring", "=ds=#sr# =so1=60 =so2=80 =so3=87 =so4=95" },
		{ "s41021", "INV_Jewelry_Ring_07", "=q2=Azure Ring", "=ds=#sr# =so1=60 =so2=80 =so3=87 =so4=95" },
		{ "s41023", "INV_Jewelry_Necklace_01", "=q2=Bright Copper Necklace", "=ds=#sr# =so1=65 =so2=85 =so3=92 =so4=100" },
		{ "s41025", "INV_Jewelry_Ring_04", "=q2=Softglow Ring", "=ds=#sr# =so1=65 =so2=85 =so3=92 =so4=100" },
		{ "s41247", "INV_Jewelry_Ring_05", "=q2=Small Pearl Ring", "=ds=#sr# =so1=65 =so2=85 =so3=92 =so4=100" },
		{ "s41027", "INV_Jewelry_Ring_33", "=q2=Topaz Studded Ring", "=ds=#sr# =so1=70 =so2=90 =so3=95 =so4=100" },
		{ "s41029", "INV_Misc_Bandage_10", "=q1=Coarse Gritted Paper", "=ds=#sr# =so1=70 =so2=90 =so3=95 =so4=100" },
		{ "s41560", "INV_Jewelry_Ring_03", "=q2=Ebon Ring", "=ds=#sr# =so1=75 =so2=95 =so3=105 =so4=115" },
	},

	JewelcraftingJourneyman1 = {
		{ "s41033", "INV_Jewelry_Necklace_08", "=q2=Lavish Gemmed Necklace", "=ds=#sr# =so1=80 =so2=100 =so3=110 =so4=120" },
		{ "s41321", "INV_Belt_32", "=q2=Gleaming Chain", "=ds=#sr# =so1=80 =so2=100 =so3=110 =so4=120" },
		{ "s41035", "INV_Jewelry_Necklace_02", "=q2=Amberstone Pendant", "=ds=#sr# =so1=80 =so2=105 =so3=115 =so4=125" },
		{ "s41587", "INV_Bracer_12", "=q2=Gloomweed Bindings", "=ds=#sr# =so1=80 =so2=160 =so3=170 =so4=180" },
		{ "s41334", "INV_Bracer_15", "=q2=Shining Copper Cuffs", "=ds=#sr# =so1=80 =so2=100 =so3=110 =so4=120" },
		{ "s41037", "INV_Jewelry_Necklace_16", "=q2=Deepmist Choker", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41562", "INV_Jewelry_Ring_05", "=q2=The King's Conviction", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41732", "INV_Misc_Orb_04", "=q2=Shadowmoon Orb", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41746", "INV_Misc_ShadowEgg", "=q2=Shadowforged Eye", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41039", "INV_Jewelry_Ring_26", "=q1=Rough Bronze Ring", "=ds=#sr# =so1=90 =so2=100 =so3=107 =so4=115" },
		{ "s41041", "INV_Jewelry_Ring_22", "=q2=Shimmering Bronze Ring", "=ds=#sr# =so1=90 =so2=105 =so3=112 =so4=120" },
		{ "s41043", "INV_Misc_Orb_01", "=q2=Amber Orb", "=ds=#sr# =so1=95 =so2=110 =so3=120 =so4=130" },
		{ "s41045", "INV_Staff_08", "=q2=Encrusted Bronze Staff", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41047", "INV_Jewelry_Ring_01", "=q2=Earthrock Loop", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41564", "INV_Jewelry_Ring_16", "=q2=Shadowfall Jewel", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41581", "INV_Staff_13", "=q2=Serpent's Coil Staff", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41323", "INV_Jewelry_Necklace_22", "=q2=Talisman of Stone", "=ds=#sr# =so1=100 =so2=125 =so3=135 =so4=145" },
		{ "s41049", "INV_Bracer_01", "=q1=Bronze Cuffed Bangles", "=ds=#sr# =so1=105 =so2=120 =so3=132 =so4=145" },
		{ "s41051", "INV_Belt_29", "=q2=Shadowgem Band", "=ds=#sr# =so1=105 =so2=125 =so3=135 =so4=145" },
		{ "s41726", "INV_Bracer_19", "=q2=Hydrathorn Bracers", "=ds=#sr# =so1=105 =so2=125 =so3=135 =so4=145" },
		{ "s41740", "INV_Crown_01", "=q2=Mistwood Tiara", "=ds=#sr# =so1=105 =so2=135 =so3=145 =so4=155" },
		{ "s41053", "INV_Mace_08", "=q2=Bronze Scepter", "=ds=#sr# =so1=110 =so2=130 =so3=140 =so4=150" },
		{ "s41325", "INV_Jewelry_Necklace_15", "=q2=Medallion of Flame", "=ds=#sr# =so1=110 =so2=130 =so3=140 =so4=150" },
		{ "s41566", "INV_Jewelry_Ring_22", "=q2=Ocean's Wrath", "=ds=#sr# =so1=115 =so2=120 =so3=130 =so4=140" },
		{ "s41337", "INV_Bracer_19", "=q2=Dawnbright Cuffs", "=ds=#sr# =so1=115 =so2=135 =so3=142 =so4=150" },
		{ "s41734", "INV_Misc_Gem_Pearl_02", "=q3=Fangclaw Relic", "=ds=#sr# =so1=120 =so2=140 =so3=150 =so4=160" },
		{ "s41055", "BTNBlackPendant", "=q2=Pendant of Midnight", "=ds=#sr# =so1=120 =so2=145 =so3=155 =so4=165" },
		{ "s41067", "INV_Jewelry_Ring_01", "=q1=Rough Silver Ring", "=ds=#sr# =so1=125 =so2=135 =so3=145 =so4=155" },
		{ "s41065", "INV_Stone_08", "=q1=Coarse Gemstone Cluster", "=ds=#sr# =so1=125 =so2=140 =so3=142 =so4=145" },
		{ "s41057", "INV_Crown_01", "=q2=Agatestone Crown", "=ds=#sr# =so1=125 =so2=145 =so3=155 =so4=165" },
	},

	JewelcraftingJourneyman2 = {
		{ "s41061", "INV_Belt_31", "=q2=Binding Signet", "=ds=#sr# =so1=125 =so2=145 =so3=155 =so4=165" },
		{ "s41063", "INV_Bracer_14", "=q2=Enchanted Bracelets", "=ds=#sr# =so1=125 =so2=145 =so3=155 =so4=165" },
		{ "s41776", "INV_Jewelry_Ring_24", "=q2=Ring of Midnight", "=ds=#sr# =so1=125 =so2=145 =so3=155 =so4=165" },
		{ "s41059", "INV_Staff_15", "=q2=Moonlight Staff", "=ds=#sr# =so1=125 =so2=150 =so3=160 =so4=170" },
		{ "s41568", "INV_Jewelry_Ring_10", "=q2=Dazzling Moonstone Band", "=ds=#sr# =so1=130 =so2=150 =so3=160 =so4=170" },
		{ "s41760", "INV_Misc_Gem_Emerald_02", "=q2=Graceful Agate Gemstone", "=ds=#sr# =so1=135 =so2=135 =so3=137 =so4=140" },
		{ "s41069", "INV_Jewelry_Talisman_06", "=q2=Silver Medallion", "=ds=#sr# =so1=135 =so2=150 =so3=160 =so4=170" },
		{ "s41071", "BTNLancelot_Ring", "=q3=Ring of Purified Silver", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41327", "INV_Jewelry_Necklace_07", "=q2=Gleaming Silver Necklace", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41339", "INV_Crown_02", "=q2=Circlet of Dampening", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41748", "INV_QirajIdol_Life", "=q3=Totem of Self Preservation", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41583", "INV_Staff_18", "=q3=Farraki Ceremony Totem", "=ds=#sr# =so1=140 =so2=160 =so3=170 =so4=180" },
		{ "s41728", "INV_Bracer_09", "=q3=Blackrock Ironclamps", "=ds=#sr# =so1=140 =so2=160 =so3=170 =so4=180" },
		{ "s41570", "INV_Jewelry_Ring_26", "=q2=Harpy Talon Ring", "=ds=#sr# =so1=145 =so2=165 =so3=175 =so4=185" },
		{ "s41742", "INV_Crown_01", "=q3=Venomspire Diadem", "=ds=#sr# =so1=145 =so2=165 =so3=175 =so4=185" },
		{ "s41201", "INV_Misc_Bandage_18", "=q1=Heavy Gritted Paper", "=ds=#sr# =so1=150 =so2=150 =so3=155 =so4=160" },
		{ "s41203", "INV_Stone_13", "=q1=Heavy Gemstone Cluster", "=ds=#sr# =so1=150 =so2=150 =so3=152 =so4=155" },
		{ "s41627", "INV_Misc_Gem_Diamond_02", "=q2=Pristine Crystal Gemstone", "=ds=#sr# =so1=150 =so2=155 =so3=157 =so4=160" },
		{ "s41607", "INV_Misc_Gem_Crystal_02", "=q2=Shimmering Aqua Gemstone", "=ds=#sr# =so1=150 =so2=155 =so3=157 =so4=160" },
		{ "s41081", "INV_Jewelry_Ring_27", "=q1=Rough Iron Ring", "=ds=#sr# =so1=150 =so2=165 =so3=170 =so4=175" },
		{ "s41083", "INV_Jewelry_Ring_03", "=q1=Rough Gold Ring", "=ds=#sr# =so1=150 =so2=165 =so3=170 =so4=175" },
	},

	JewelcraftingExpert1 = {
		{ "s41205", "INV_Bracer_10", "=q2=Goldfire Crystal Bracelet", "=ds=#sr# =so1=155 =so2=155 =so3=160 =so4=165" },
		{ "s41207", "INV_Jewelry_Ring_31", "=q2=Quartz Halo", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s41275", "INV_Jewelry_Necklace_06", "=q3=Gemmed Citrine Pendant", "=ds=#sr# =so1=160 =so2=160 =so3=180 =so4=200" },
		{ "s41572", "INV_Jewelry_Ring_47", "=q2=Centaur Hoof Circlet", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s41331", "INV_Jewelry_Amulet_05", "=q2=Gem Encrusted Choker", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s41736", "INV_Wand_05", "=q2=Netherbane Rod", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s41329", "BTNTurtlePendant", "=q2=Ring of The Turtle", "=ds=#sr# =so1=160 =so2=185 =so3=195 =so4=205" },
		{ "s41283", "BTNEnchantedNecklace", "=q2=Astral Amulet", "=ds=#sr# =so1=??? =so2=175 =so3=192 =so4=210" },
		{ "s41209", "INV_Wand_04", "=q2=Staff of Blossomed Jade", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s41333", "INV_Jewelry_Amulet_03", "=q2=Goldcrest Amulet", "=ds=#sr# =so1=170 =so2=180 =so3=190 =so4=200" },
		{ "s41730", "INV_Bracer_09", "=q2=Monastery Emberbrace", "=ds=#sr# =so1=170 =so2=185 =so3=195 =so4=205" },
		{ "s41211", "INV_Jewelry_Ring_12", "=q2=Jade Harmony Circlet", "=ds=#sr# =so1=170 =so2=190 =so3=197 =so4=205" },
		{ "s41585", "INV_Staff_12", "=q2=Sphinx's Wisdom Staff", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s41574", "INV_Jewelry_Ring_32", "=q3=Ogre Bone Band", "=ds=#sr# =so1=170 =so2=200 =so3=210 =so4=220" },
		{ "s41219", "INV_Jewelry_Ring_12", "=q1=Rough Mithril Ring", "=ds=#sr# =so1=175 =so2=175 =so3=177 =so4=180" },
		{ "s41629", "INV_Misc_Gem_Stone_01", "=q2=Gleaming Jade Gemstone", "=ds=#sr# =so1=175 =so2=180 =so3=182 =so4=185" },
		{ "s41623", "INV_Misc_Gem_Crystal_03", "=q2=Pure Shining Moonstone", "=ds=#sr# =so1=175 =so2=180 =so3=182 =so4=185" },
		{ "s41752", "INV_Misc_Gem_Pearl_01", "=q2=Obsidian Brooch", "=ds=#sr# =so1=175 =so2=190 =so3=197 =so4=205" },
		{ "s41213", "INV_Helmet_19", "=q2=Goldenshade Quartz Crown", "=ds=#sr# =so1=175 =so2=195 =so3=202 =so4=210" },
		{ "s41215", "BTNHL_Holy_Grail", "=q2=The Golden Goblet", "=ds=#sr# =so1=175 =so2=195 =so3=202 =so4=210" },
		{ "s41217", "INV_Jewelry_Necklace_06", "=q3=Powerful Citrine Pendant", "=ds=#sr# =so1=175 =so2=195 =so3=202 =so4=210" },
		{ "s41556", "INV_Jewelry_Talisman_10", "=q2=Delicate Mithril Amulet", "=ds=#sr# =so1=180 =so2=200 =so3=210 =so4=220" },
		{ "s41221", "INV_Jewelry_Ring_22", "=q2=Ironsun Citrine Ring", "=ds=#sr# =so1=185 =so2=200 =so3=210 =so4=220" },
		{ "s41750", "INV_Misc_Gem_Pearl_06", "=q2=Facetted Moonstone Brooch", "=ds=#sr# =so1=185 =so2=200 =so3=207 =so4=215" },
		{ "s41589", "INV_Jewelry_Ring_07", "=q2=Crystal Earring", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s41263", "INV_Jewelry_Ring_29", "=q2=Ocean's Gaze", "=ds=#sr# =so1=190 =so2=190 =so3=210 =so4=230" },
		{ "s41223", "INV_Belt_19", "=q2=Shimmering Gold Necklace", "=ds=#sr# =so1=190 =so2=205 =so3=215 =so4=225" },
		{ "s41225", "INV_Jewelry_Ring_20", "=q2=Ironbloom Ring", "=ds=#sr# =so1=190 =so2=205 =so3=215 =so4=225" },
		{ "s41541", "INV_Jewelry_Ring_28", "=q2=Dazzling Aquamarine Loop", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s41579", "INV_Jewelry_Ring_12", "=q2=Marine's Demise", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
	},

	JewelcraftingExpert2 = {
		{ "s41285", "INV_Ingot_08", "=q2=Shimmering Moonstone Tablet", "=ds=#sr# =so1=195 =so2=195 =so3=217 =so4=240" },
		{ "s41229", "INV_Misc_Bandage_17", "=q1=Solid Gritted Paper", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s41233", "INV_Jewelry_Ring_07", "=q1=Rough Truesilver Ring", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s41237", "INV_Stone_07", "=q1=Solid Gemstone Cluster", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s41601", "INV_Misc_Gem_Opal_02", "=q2=Sharpened Citrine Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s41603", "INV_Misc_Gem_Ruby_01", "=q2=Radiant Ember Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s41605", "INV_Misc_Gem_Ruby_02", "=q2=Glowing Ruby Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s41631", "INV_Misc_Gem_Crystal_03", "=q2=Illuminated Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=205 =so4=205" },
		{ "s41738", "INV_Misc_Orb_01", "=q2=Marine Root", "=ds=#sr# =so1=200 =so2=215 =so3=225 =so4=235" },
		{ "s41227", "INV_Staff_07", "=q2=Ornate Mithril Scepter", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41546", "INV_Belt_27", "=q2=Alluring Citrine Choker", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41548", "INV_Bracer_19", "=q2=Elaborate Golden Bracelets", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41550", "INV_Wand_05", "=q2=Heart of the Sea", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41744", "INV_Jewelry_Ring_03", "=q2=Bloodfire Circlet", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41754", "INV_Misc_Gem_Pearl_04", "=q2=Smoldering Brooch", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41552", "INV_Staff_11", "=q2=Staff of Gallitrea", "=ds=#sr# =so1=200 =so2=225 =so3=235 =so4=245" },
		{ "s41558", "INV_Misc_Gem_Sapphire_02", "=q2=Draenethyst Baton", "=ds=#sr# =so1=200 =so2=225 =so3=235 =so4=245" },
		{ "s41718", "INV_Bracer_14", "=q3=Ornate Mithril Bracelets", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s41756", "INV_Misc_Gem_Sapphire_03", "=q2=Vitriol Brooch", "=ds=#sr# =so1=205 =so2=220 =so3=227 =so4=235" },
		{ "s41239", "INV_Belt_31", "=q2=Greater Binding Signet", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s41786", "INV_Helmet_06", "=q2=Ornate Mithril Crown", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s41554", "INV_Jewelry_Ring_Emerald", "=q3=Golden Jade Ring", "=ds=#sr# =so1=210 =so2=235 =so3=245 =so4=255" },
		{ "s41352", "INV_Staff_13", "=q3=Opaline Illuminator", "=ds=#sr# =so1=210 =so2=235 =so3=245 =so4=255" },
		{ "s41307", "INV_Wand_11", "=q3=Gemkeeper's Folio", "=ds=#sr# =so1=??? =so2=235 =so3=245 =so4=255" },
		{ "s41235", "INV_Jewelry_Necklace_03", "=q2=Aquamarine Pendant", "=ds=#sr# =so1=215 =so2=215 =so3=225 =so4=235" },
		{ "s41241", "INV_Staff_32", "=q2=Royal Gemstone Staff", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s41277", "INV_Jewelry_Necklace_07", "=q2=Starforge Amulet", "=ds=#sr# =so1=220 =so2=220 =so3=240 =so4=260" },
		{ "s41243", "INV_Misc_Orb_05", "=q2=Emberstone Idol", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s41245", "BTNIrongRingUPG2", "=q2=Runed Truesilver Ring", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s41633", "INV_Misc_Gem_Ruby_02", "=q2=Burning Star Gemstone", "=ds=#sr# =so1=225 =so2=225 =so3=227 =so4=230" },
	},

	JewelcraftingExpert3 = {
		{ "s41085", "INV_Jewelry_Ring_25", "=q2=Emberstone Studded Ring", "=ds=#sr# =so1=225 =so2=240 =so3=247 =so4=255" },
		{ "s41281", "INV_Jewelry_Talisman_05", "=q3=Runebound Amulet", "=ds=#sr# =so1=230 =so2=230 =so3=252 =so4=275" },
		{ "s41716", "INV_Jewelry_Ring_03", "=q3=Crown of Elegance", "=ds=#sr# =so1=230 =so2=260 =so3=270 =so4=280" },
		{ "s41784", "INV_Jewelry_Ring_Jade", "=q4=Mana Binding Signet", "=ds=#sr# =so1=230 =so2=260 =so3=275 =so4=290" },
		{ "s41305", "INV_Wand_09", "=q2=Golden Scepter of Authority", "=ds=#sr# =so1=??? =so2=260 =so3=270 =so4=280" },
		{ "s41635", "INV_Misc_Gem_Opal_01", "=q2=Brilliant Opal Gemstone", "=ds=#sr# =so1=235 =so2=235 =so3=237 =so4=240" },
		{ "s41770", "INV_Stone_14", "=q1=Dense Gemstone Cluster", "=ds=#sr# =so1=235 =so2=240 =so3=240 =so4=240" },
		{ "s41087", "BTNring02", "=q1=Rough Thorium Ring", "=ds=#sr# =so1=235 =so2=245 =so3=250 =so4=255" },
		{ "s41720", "INV_Staff_32", "=q3=Regal Twilight Staff", "=ds=#sr# =so1=240 =so2=260 =so3=275 =so4=290" },
		{ "s41724", "Spell_Shadow_GrimWard", "=q3=Ornament of Restraint", "=ds=#sr# =so1=245 =so2=245 =so3=265 =so4=285" },
		{ "s41089", "BTNEmptyAmulet", "=q2=Mithril Blackstone Necklace", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s41261", "INV_Jewelry_Amulet_05", "=q2=Sunburst Tiara", "=ds=#sr# =so1=250 =so2=250 =so3=270 =so4=290" },
		{ "s41091", "INV_Misc_LeatherScrap_08", "=q1=Dense Gritted Paper", "=ds=#sr# =so1=250 =so2=260 =so3=265 =so4=270" },
		{ "s41714", "INV_Bracer_19", "=q3=Opal Guided Bangles", "=ds=#sr# =so1=250 =so2=280 =so3=290 =so4=300" },
		{ "s41637", "INV_Misc_Gem_Emerald_01", "=q2=Elegant Emerald Gemstone", "=ds=#sr# =so1=??? =so2=250 =so3=252 =so4=255" },
		{ "s41639", "INV_Misc_Gem_Sapphire_02", "=q2=Shining Sapphire Gemstone", "=ds=#sr# =so1=??? =so2=250 =so3=252 =so4=255" },
	},

	JewelcraftingArtisan1 = {
		{ "s41093", "INV_Jewelry_Ring_10", "=q2=Radiant Thorium Twilight", "=ds=#sr# =so1=255 =so2=270 =so3=277 =so4=285" },
		{ "s41348", "INV_Bracer_10", "=q2=Crystalfire Armlets", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s41265", "INV_Jewelry_Ring_31", "=q2=Starry Thorium Band", "=ds=#sr# =so1=260 =so2=260 =so3=275 =so4=290" },
		{ "s41611", "INV_Misc_Gem_01", "=q2=Gloomy Diamond Gemstone", "=ds=#sr# =so1=260 =so2=265 =so3=267 =so4=270" },
		{ "s41095", "INV_Ore_Arcanite_02", "=q2=Glyph Codex", "=ds=#sr# =so1=260 =so2=280 =so3=287 =so4=295" },
		{ "s41350", "INV_Jewelry_Ring_19", "=q2=Cinderfall Band", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s41251", "INV_Jewelry_Ring_29", "=q2=Blue Starfire", "=ds=#sr# =so1=265 =so2=265 =so3=285 =so4=305" },
		{ "s41273", "INV_Jewelry_Necklace_16", "=q2=Prism Amulet", "=ds=#sr# =so1=265 =so2=265 =so3=285 =so4=305" },
		{ "s41774", "INV_Jewelry_Necklace_07", "=q2=Spellweaver Pendant", "=ds=#sr# =so1=265 =so2=275 =so3=285 =so4=295" },
		{ "s41097", "INV_Staff_13", "=q2=Spellweaver Rod", "=ds=#sr# =so1=265 =so2=285 =so3=292 =so4=300" },
		{ "s41099", "INV_Misc_Orb_01", "=q2=Quicksilver Whirl", "=ds=#sr# =so1=265 =so2=285 =so3=292 =so4=300" },
		{ "s41762", "INV_Misc_Gem_03", "=q2=Dreary Opal Gemstone", "=ds=#sr# =so1=270 =so2=270 =so3=272 =so4=275" },
		{ "s41311", "INV_Bracer_03", "=q2=Stellar Gemguards", "=ds=#sr# =so1=270 =so2=270 =so3=280 =so4=290" },  --CHECK
		{ "s41315", "INV_Jewelry_Necklace_11", "=q2=Moonlit Charm", "=ds=#sr# =so1=275 =so2=275 =so3=285 =so4=295" },  --CHECK
		{ "s41641", "INV_Misc_Gem_Topaz_01", "=q2=Unstable Arcane Gemstone", "=ds=#sr# =so1=275 =so2=275 =so3=277 =so4=280" },  --CHECK
		{ "s41356", "INV_Misc_Book_09", "=q3=Gemstone Compendium", "=ds=#sr# =so1=275 =so2=275 =so3=297 =so4=320" },
		{ "s41279", "INV_Jewelry_Necklace_Banshee", "=q2=Voidheart Charm", "=ds=#sr# =so1=280 =so2=280 =so3=300 =so4=320" },
		{ "s41101", "INV_Bracer_13", "=q2=Crystalweft Bracers", "=ds=#sr# =so1=280 =so2=285 =so3=297 =so4=310" },
		{ "s41103", "INV_Helmet_53", "=q2=Ethereal Frostspark Crown", "=ds=#sr# =so1=280 =so2=285 =so3=297 =so4=310" },
		{ "s41105", "INV_Jewelry_Amulet_04", "=q2=Pendant of Arcane Radiance", "=ds=#sr# =so1=280 =so2=300 =so3=305 =so4=310" },
		{ "s41794", "INV_Misc_Gem_Pearl_04", "=q3=Orb of Clairvoyance", "=ds=#sr# =so1=285 =so2=320 =so3=330 =so4=340" },
		{ "s41313", "INV_Wand_07", "=q2=Garnet Guardian Staff", "=ds=#sr# =so1=290 =so2=290 =so3=300 =so4=310" },  --CHECK
		{ "s41643", "INV_Misc_Gem_Sapphire_02", "=q2=Glittering Sapphire Gemstone", "=ds=#sr# =so1=290 =so2=290 =so3=292 =so4=295" },  --CHECK
		{ "s41309", "BTNEyeRing", "=q2=Stellar Ruby Ring", "=ds=#sr# =so1=300 =so2=300 =so3=310 =so4=320" },  --CHECK
		{ "s41287", "INV_Jewelry_Talisman_05", "=q2=Stormcloud Sigil", "=ds=#sr# =so1=290 =so2=310 =so3=325 =so4=340" },
		{ "s41708", "INV_Jewelry_Ring_21", "=q3=Opalstone Circle", "=ds=#sr# =so1=290 =so2=320 =so3=330 =so4=340" },
		{ "s41712", "BTNHarbingerRing", "=q3=Dark Iron Signet Ring", "=ds=#sr# =so1=290 =so2=320 =so3=330 =so4=340" },
		{ "s41271", "INV_Jewelry_Ring_Gold", "=q1=Pure Gold Ring", "=ds=#sr# =so1=295 =so2=295 =so3=305 =so4=315" },  --CHECK
		{ "s41253", "INV_Jewelry_Ring_37", "=q2=Emerald Monarch's Glow", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	JewelcraftingArtisan2 = {
		{ "s41259", "INV_Staff_28", "=q2=Arcanum Baton", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41722", "INV_Jewelry_Necklace_06", "=q4=Pendant of Instability", "=ds=#sr# =so1=300 =so2=300 =so3=307 =so4=315" },
		{ "s41700", "INV_Bracer_13", "=q4=Embergem Cuffs", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41706", "INV_Crown_02", "=q4=Mastercrafted Diamond Crown", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41764", "INV_Misc_Gem_Topaz_02", "=q3=Resurged Topaz Gemstone", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41768", "INV_Misc_Gem_Topaz_03", "=q3=Resilient Arcane Gemstone", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41798", "INV_Misc_Gem_03", "=q3=Guardbreaker Charm", "=ds=#sr# =so1=300 =so2=320 =so3=325 =so4=330" },
		{ "s41804", "INV_Bracer_13", "=q3=Bindings of Luminance", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41806", "INV_Crown_01", "=q3=Crown of the Illustrious Queen", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41802", "INV_Staff_20", "=q3=Spire of Channeled Power", "=ds=#sr# =so1=300 =so2=325 =so3=335 =so4=345" },
		{ "s41808", "INV_Bracer_03", "=q4=Mastercrafted Diamond Bangles", "=ds=#sr# =so1=300 =so2=325 =so3=332 =so4=340" },
		{ "s41778", "INV_Bracer_01", "=q2=Stormcloud Shackles", "=ds=#sr# =so1=300 =so2=310 =so3=320 =so4=330" },  --CHECK
		{ "s41303", "INV_Jewelry_Ring_08", "=q2=Massive Jewel Circlet", "=ds=#sr# =so1=300 =so2=315 =so3=322 =so4=330" },  --CHECK
		{ "s41317", "INV_Jewelry_Ring_24", "=q3=Twilight Opal Cascade", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },  --CHECK
	},

	JewelcraftingArtisan3 = {
	},

	JewelcraftingGemology1 = {
		{ "s41621", "INV_Stone_03", "=q2=Enchanted Emerald Gemstone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "s41625", "INV_Misc_Gem_Diamond_01", "=q2=Beautiful Diamond Gemstone", "=ds=#sr# =so1=270 =so2=275 =so3=277 =so4=280" },
		{ "s41609", "INV_Misc_Gem_Bloodstone_01", "=q3=Azerothian Ruby Gemstone", "=ds=#sr# =so1=275 =so2=280 =so3=282 =so4=285" },
		{ "s41617", "INV_Stone_01", "=q2=Tempered Azerothian Gemstone", "=ds=#sr# =so1=275 =so2=280 =so3=282 =so4=285" },
		{ "s41613", "INV_Misc_Gem_02", "=q3=Flawless Black Gemstone", "=ds=#sr# =so1=285 =so2=290 =so3=292 =so4=295" },
		{ "s41615", "INV_Misc_Gem_Sapphire_01", "=q3=Arcane Emerald Gemstone", "=ds=#sr# =so1=295 =so2=300 =so3=302 =so4=305" },
		{ "s41619", "INV_Misc_Gem_Topaz_02", "=q3=Stunning Imperial Gemstone", "=ds=#sr# =so1=300 =so2=310 =so3=315 =so4=320" },
		{ "s41821", "INV_Misc_Gem_Topaz_02", "=q3=Gorgeous Mountain Gemstone", "=ds=#sr# =so1=300 =so2=330 =so3=345 =so4=360" },
	},

	JewelcraftingGoldsmithing1 = {
		{ "s41782", "INV_Jewelry_Ring_Truesight", "=q4=Golden Runed Ring", "=ds=#sr# =so1=285 =so2=310 =so3=320 =so4=330" },
		{ "s41780", "INV_Jewelry_Ring_Saphire", "=q3=Stormcloud Signet", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s41710", "INV_Jewelry_Ring_DragonPaw", "=q3=Deep Sapphire Circlet", "=ds=#sr# =so1=290 =so2=320 =so3=330 =so4=340" },
		{ "s41790", "INV_Jewelry_Ring_DragonPaw", "=q4=Ring of Unleashed Potential", "=ds=#sr# =so1=290 =so2=320 =so3=330 =so4=340" },
		{ "s41255", "INV_Jewelry_Ring_35", "=q3=Sapphire Luminescence", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41696", "INV_Jewelry_Ring_42", "=q4=Shimmering Diamond Band", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41698", "INV_Misc_Gem_Ruby_03", "=q4=Crown of Molten Ascension", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41702", "INV_Belt_29", "=q4=Blackwing Signet of Command", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41704", "INV_Jewelry_Amulet_01", "=q4=Talisman of Hinderance", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41788", "INV_Jewelry_Ring_Gold", "=q4=Blazefury Circlet", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41267", "BTNGoldMysticRing", "=q4=Ruby Ring of Ruin", "=ds=#sr# =so1=300 =so2=330 =so3=350 =so4=370" },
		{ "s41269", "BTNRingOfInfiniteGems", "=q4=Encrusted Gemstone Ring", "=ds=#sr# =so1=300 =so2=330 =so3=350 =so4=370" },
		{ "s41792", "INV_Staff_11", "=q4=Empowered Domination Rod", "=ds=#sr# =so1=300 =so2=330 =so3=340 =so4=350" },
		{ "s41796", "INV_Jewelry_Trinket_VampiricGrail", "=q4=Grail of Forgotten Memories", "=ds=#sr# =so1=300 =so2=330 =so3=340 =so4=350" },
		{ "s41800", "inv_staff_14", "=q4=Rudeus' Focusing Cane", "=ds=#sr# =so1=300 =so2=330 =so3=340 =so4=350" },
	},

	JewelcraftingGemstones1 = {
		{ "s41760", "INV_Misc_Gem_Emerald_02", "=q2=Graceful Agate Gemstone", "=ds=#sr# =so1=135 =so2=135 =so3=137 =so4=140" },
		{ "s41627", "INV_Misc_Gem_Diamond_02", "=q2=Pristine Crystal Gemstone", "=ds=#sr# =so1=150 =so2=155 =so3=157 =so4=160" },
		{ "s41607", "INV_Misc_Gem_Crystal_02", "=q2=Shimmering Aqua Gemstone", "=ds=#sr# =so1=150 =so2=155 =so3=157 =so4=160" },
		{ "s41629", "INV_Misc_Gem_Stone_01", "=q2=Gleaming Jade Gemstone", "=ds=#sr# =so1=175 =so2=180 =so3=182 =so4=185" },
		{ "s41601", "INV_Misc_Gem_Opal_02", "=q2=Sharpened Citrine Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s41603", "INV_Misc_Gem_Ruby_01", "=q2=Radiant Ember Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s41605", "INV_Misc_Gem_Ruby_02", "=q2=Glowing Ruby Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=207 =so4=210" },
		{ "s41631", "INV_Misc_Gem_Crystal_03", "=q2=Illuminated Gemstone", "=ds=#sr# =so1=200 =so2=205 =so3=205 =so4=205" },
		{ "s41633", "INV_Misc_Gem_Ruby_02", "=q2=Burning Star Gemstone", "=ds=#sr# =so1=225 =so2=225 =so3=227 =so4=230" },
		{ "s41635", "INV_Misc_Gem_Opal_01", "=q2=Brilliant Opal Gemstone", "=ds=#sr# =so1=235 =so2=235 =so3=237 =so4=240" },
		{ "s41637", "INV_Misc_Gem_Emerald_01", "=q2=Elegant Emerald Gemstone", "=ds=#sr# =so1=??? =so2=250 =so3=252 =so4=255" },
		{ "s41639", "INV_Misc_Gem_Sapphire_02", "=q2=Shining Sapphire Gemstone", "=ds=#sr# =so1=??? =so2=250 =so3=252 =so4=255" },
		{ "s41611", "INV_Misc_Gem_01", "=q2=Gloomy Diamond Gemstone", "=ds=#sr# =so1=260 =so2=265 =so3=267 =so4=270" },
		{ "s41762", "INV_Misc_Gem_03", "=q2=Dreary Opal Gemstone", "=ds=#sr# =so1=270 =so2=270 =so3=272 =so4=275" },
		{ "s41625", "INV_Misc_Gem_Diamond_01", "=q2=Beautiful Diamond Gemstone", "=ds=#sr# =so1=270 =so2=275 =so3=277 =so4=280" },
		{ "s41641", "INV_Misc_Gem_Topaz_01", "=q2=Unstable Arcane Gemstone", "=ds=#sr# =so1=??? =so2=275 =so3=277 =so4=280" },
		{ "s41643", "INV_Misc_Gem_Sapphire_02", "=q2=Glittering Sapphire Gemstone", "=ds=#sr# =so1=??? =so2=290 =so3=292 =so4=295" },
		{ "s41764", "INV_Misc_Gem_Topaz_02", "=q3=Resurged Topaz Gemstone", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41768", "INV_Misc_Gem_Topaz_03", "=q3=Resilient Arcane Gemstone", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41621", "INV_Stone_03", "=q2=Enchanted Emerald Gemstone", "=ds=#sr# =so1=250 =so2=255 =so3=257 =so4=260" },
		{ "s41609", "INV_Misc_Gem_Bloodstone_01", "=q3=Azerothian Ruby Gemstone", "=ds=#sr# =so1=275 =so2=280 =so3=282 =so4=285" },
		{ "s41617", "INV_Stone_01", "=q2=Tempered Azerothian Gemstone", "=ds=#sr# =so1=275 =so2=280 =so3=282 =so4=285" },
		{ "s41613", "INV_Misc_Gem_02", "=q3=Flawless Black Gemstone", "=ds=#sr# =so1=285 =so2=290 =so3=292 =so4=295" },
		{ "s41615", "INV_Misc_Gem_Sapphire_01", "=q3=Arcane Emerald Gemstone", "=ds=#sr# =so1=295 =so2=300 =so3=302 =so4=305" },
		{ "s41619", "INV_Misc_Gem_Topaz_02", "=q3=Stunning Imperial Gemstone", "=ds=#sr# =so1=300 =so2=310 =so3=315 =so4=320" },
		{ "s41821", "INV_Misc_Gem_Topaz_02", "=q3=Gorgeous Mountain Gemstone", "=ds=#sr# =so1=300 =so2=330 =so3=345 =so4=360" },
	},

	JewelcraftingRings1 = {
		{ "s41001", "INV_Jewelry_Ring_12", "=q2=Bright Copper Ring", "=ds=#sr# =so1=15 =so2=35 =so3=45 =so4=55" },
		{ "s41003", "INV_Jewelry_Ring_18", "=q2=Malachite Ring", "=ds=#sr# =so1=20 =so2=40 =so3=47 =so4=55" },
		{ "s41249", "INV_Jewelry_Ring_07", "=q2=Bulky Copper Ring", "=ds=#sr# =so1=25 =so2=25 =so3=45 =so4=65" },
		{ "s41005", "INV_Jewelry_Ring_13", "=q2=Sturdy Copper Ring", "=ds=#sr# =so1=25 =so2=45 =so3=52 =so4=60" },
		{ "s41007", "INV_Jewelry_Ring_06", "=q2=Inlaid Copper Ring", "=ds=#sr# =so1=35 =so2=55 =so3=62 =so4=70" },
		{ "s41013", "INV_Jewelry_Ring_19", "=q2=Lesser Fortification Ring", "=ds=#sr# =so1=50 =so2=70 =so3=77 =so4=85" },
		{ "s41015", "INV_Jewelry_Ring_02", "=q2=Tigercrest Ring", "=ds=#sr# =so1=50 =so2=70 =so3=77 =so4=85" },
		{ "s41231", "INV_Jewelry_Ring_27", "=q2=Minor Trollblood Ring", "=ds=#sr# =so1=50 =so2=70 =so3=80 =so4=90" },
		{ "s41019", "INV_Jewelry_Ring_03", "=q2=Amber Ring", "=ds=#sr# =so1=60 =so2=80 =so3=87 =so4=95" },
		{ "s41021", "INV_Jewelry_Ring_07", "=q2=Azure Ring", "=ds=#sr# =so1=60 =so2=80 =so3=87 =so4=95" },
		{ "s41025", "INV_Jewelry_Ring_04", "=q2=Softglow Ring", "=ds=#sr# =so1=65 =so2=85 =so3=92 =so4=100" },
		{ "s41027", "INV_Jewelry_Ring_33", "=q2=Topaz Studded Ring", "=ds=#sr# =so1=70 =so2=90 =so3=95 =so4=100" },
		{ "s41560", "INV_Jewelry_Ring_03", "=q2=Ebon Ring", "=ds=#sr# =so1=75 =so2=95 =so3=105 =so4=115" },
		{ "s41562", "INV_Jewelry_Ring_05", "=q2=The King's Conviction", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41041", "INV_Jewelry_Ring_22", "=q2=Shimmering Bronze Ring", "=ds=#sr# =so1=90 =so2=105 =so3=112 =so4=120" },
		{ "s41047", "INV_Jewelry_Ring_01", "=q2=Earthrock Loop", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41564", "INV_Jewelry_Ring_16", "=q2=Shadowfall Jewel", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41566", "INV_Jewelry_Ring_22", "=q2=Ocean's Wrath", "=ds=#sr# =so1=115 =so2=120 =so3=130 =so4=140" },
		{ "s41776", "INV_Jewelry_Ring_24", "=q2=Ring of Midnight", "=ds=#sr# =so1=125 =so2=145 =so3=155 =so4=165" },
		{ "s41568", "INV_Jewelry_Ring_10", "=q2=Dazzling Moonstone Band", "=ds=#sr# =so1=130 =so2=150 =so3=160 =so4=170" },
		{ "s41071", "BTNLancelot_Ring", "=q3=Ring of Purified Silver", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41570", "INV_Jewelry_Ring_26", "=q2=Harpy Talon Ring", "=ds=#sr# =so1=145 =so2=165 =so3=175 =so4=185" },
		{ "s41207", "INV_Jewelry_Ring_31", "=q2=Quartz Halo", "=ds=#sr# =so1=155 =so2=175 =so3=185 =so4=195" },
		{ "s41572", "INV_Jewelry_Ring_47", "=q2=Centaur Hoof Circlet", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s41211", "INV_Jewelry_Ring_12", "=q2=Jade Harmony Circlet", "=ds=#sr# =so1=170 =so2=190 =so3=197 =so4=205" },
		{ "s41574", "INV_Jewelry_Ring_32", "=q3=Ogre Bone Band", "=ds=#sr# =so1=170 =so2=200 =so3=210 =so4=220" },
		{ "s41221", "INV_Jewelry_Ring_22", "=q2=Ironsun Citrine Ring", "=ds=#sr# =so1=185 =so2=200 =so3=210 =so4=220" },
		{ "s41589", "INV_Jewelry_Ring_07", "=q2=Crystal Earring", "=ds=#sr# =so1=185 =so2=205 =so3=215 =so4=225" },
		{ "s41263", "INV_Jewelry_Ring_29", "=q2=Ocean's Gaze", "=ds=#sr# =so1=190 =so2=190 =so3=210 =so4=230" },
		{ "s41225", "INV_Jewelry_Ring_20", "=q2=Ironbloom Ring", "=ds=#sr# =so1=190 =so2=205 =so3=215 =so4=225" },
	},

	JewelcraftingRings2 = {
		{ "s41541", "INV_Jewelry_Ring_28", "=q2=Dazzling Aquamarine Loop", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s41579", "INV_Jewelry_Ring_12", "=q2=Marine's Demise", "=ds=#sr# =so1=190 =so2=210 =so3=220 =so4=230" },
		{ "s41744", "INV_Jewelry_Ring_03", "=q2=Bloodfire Circlet", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41554", "INV_Jewelry_Ring_Emerald", "=q3=Golden Jade Ring", "=ds=#sr# =so1=210 =so2=235 =so3=245 =so4=255" },
		{ "s41085", "INV_Jewelry_Ring_25", "=q2=Emberstone Studded Ring", "=ds=#sr# =so1=225 =so2=240 =so3=247 =so4=255" },
		{ "s41784", "INV_Jewelry_Ring_Jade", "=q4=Mana Binding Signet", "=ds=#sr# =so1=230 =so2=260 =so3=275 =so4=290" },
		{ "s41093", "INV_Jewelry_Ring_10", "=q2=Radiant Thorium Twilight", "=ds=#sr# =so1=255 =so2=270 =so3=277 =so4=285" },
		{ "s41265", "INV_Jewelry_Ring_31", "=q2=Starry Thorium Band", "=ds=#sr# =so1=260 =so2=260 =so3=275 =so4=290" },
		{ "s41350", "INV_Jewelry_Ring_19", "=q2=Cinderfall Band", "=ds=#sr# =so1=260 =so2=280 =so3=290 =so4=300" },
		{ "s41251", "INV_Jewelry_Ring_29", "=q2=Blue Starfire", "=ds=#sr# =so1=265 =so2=265 =so3=285 =so4=305" },
		{ "s41708", "INV_Jewelry_Ring_21", "=q3=Opalstone Circle", "=ds=#sr# =so1=290 =so2=320 =so3=330 =so4=340" },
		{ "s41253", "INV_Jewelry_Ring_37", "=q2=Emerald Monarch's Glow", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41303", "INV_Jewelry_Ring_08", "=q2=Massive Jewel Circlet", "=ds=#sr# =so1=??? =so2=315 =so3=322 =so4=330" },
		{ "s41317", "INV_Jewelry_Ring_24", "=q3=Twilight Opal Cascade", "=ds=#sr# =so1=??? =so2=320 =so3=330 =so4=340" },
		{ 0, "", "", "" },
		{ "s41782", "INV_Jewelry_Ring_Truesight", "=q4=Golden Runed Ring", "=ds=#sr# =so1=285 =so2=310 =so3=320 =so4=330" },
		{ "s41780", "INV_Jewelry_Ring_Saphire", "=q3=Stormcloud Signet", "=ds=#sr# =so1=290 =so2=310 =so3=320 =so4=330" },
		{ "s41710", "INV_Jewelry_Ring_DragonPaw", "=q3=Deep Sapphire Circlet", "=ds=#sr# =so1=290 =so2=320 =so3=330 =so4=340" },
		{ "s41790", "INV_Jewelry_Ring_DragonPaw", "=q4=Ring of Unleashed Potential", "=ds=#sr# =so1=290 =so2=320 =so3=330 =so4=340" },
		{ "s41255", "INV_Jewelry_Ring_35", "=q3=Sapphire Luminescence", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41696", "INV_Jewelry_Ring_42", "=q4=Shimmering Diamond Band", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41702", "INV_Belt_29", "=q4=Blackwing Signet of Command", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41788", "INV_Jewelry_Ring_Gold", "=q4=Blazefury Circlet", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41267", "BTNGoldMysticRing", "=q4=Ruby Ring of Ruin", "=ds=#sr# =so1=300 =so2=330 =so3=350 =so4=370" },
		{ "s41269", "BTNRingOfInfiniteGems", "=q4=Encrusted Gemstone Ring", "=ds=#sr# =so1=300 =so2=330 =so3=350 =so4=370" },
	},

	JewelcraftingAmulets1 = {
		{ "s41023", "INV_Jewelry_Necklace_01", "=q2=Bright Copper Necklace", "=ds=#sr# =so1=65 =so2=85 =so3=92 =so4=100" },
		{ "s41033", "INV_Jewelry_Necklace_08", "=q2=Lavish Gemmed Necklace", "=ds=#sr# =so1=80 =so2=100 =so3=110 =so4=120" },
		{ "s41321", "INV_Belt_32", "=q2=Gleaming Chain", "=ds=#sr# =so1=80 =so2=100 =so3=110 =so4=120" },
		{ "s41035", "INV_Jewelry_Necklace_02", "=q2=Amberstone Pendant", "=ds=#sr# =so1=80 =so2=105 =so3=115 =so4=125" },
		{ "s41037", "INV_Jewelry_Necklace_16", "=q2=Deepmist Choker", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41323", "INV_Jewelry_Necklace_22", "=q2=Talisman of Stone", "=ds=#sr# =so1=100 =so2=125 =so3=135 =so4=145" },
		{ "s41325", "INV_Jewelry_Necklace_15", "=q2=Medallion of Flame", "=ds=#sr# =so1=110 =so2=130 =so3=140 =so4=150" },
		{ "s41055", "BTNBlackPendant", "=q2=Pendant of Midnight", "=ds=#sr# =so1=120 =so2=145 =so3=155 =so4=165" },
		{ "s41327", "INV_Jewelry_Necklace_07", "=q2=Gleaming Silver Necklace", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41275", "INV_Jewelry_Necklace_06", "=q3=Gemmed Citrine Pendant", "=ds=#sr# =so1=160 =so2=160 =so3=180 =so4=200" },
		{ "s41331", "INV_Jewelry_Amulet_05", "=q2=Gem Encrusted Choker", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s41283", "BTNEnchantedNecklace", "=q2=Astral Amulet", "=ds=#sr# =so1=??? =so2=175 =so3=192 =so4=210" },
		{ "s41333", "INV_Jewelry_Amulet_03", "=q2=Goldcrest Amulet", "=ds=#sr# =so1=170 =so2=180 =so3=190 =so4=200" },
		{ "s41217", "INV_Jewelry_Necklace_06", "=q3=Powerful Citrine Pendant", "=ds=#sr# =so1=175 =so2=195 =so3=202 =so4=210" },
		{ "s41556", "INV_Jewelry_Talisman_10", "=q2=Delicate Mithril Amulet", "=ds=#sr# =so1=180 =so2=200 =so3=210 =so4=220" },
		{ "s41223", "INV_Belt_19", "=q2=Shimmering Gold Necklace", "=ds=#sr# =so1=190 =so2=205 =so3=215 =so4=225" },
		{ "s41546", "INV_Belt_27", "=q2=Alluring Citrine Choker", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41235", "INV_Jewelry_Necklace_03", "=q2=Aquamarine Pendant", "=ds=#sr# =so1=215 =so2=215 =so3=225 =so4=235" },
		{ "s41277", "INV_Jewelry_Necklace_07", "=q2=Starforge Amulet", "=ds=#sr# =so1=220 =so2=220 =so3=240 =so4=260" },
		{ "s41281", "INV_Jewelry_Talisman_05", "=q3=Runebound Amulet", "=ds=#sr# =so1=230 =so2=230 =so3=252 =so4=275" },
		{ "s41089", "BTNEmptyAmulet", "=q2=Mithril Blackstone Necklace", "=ds=#sr# =so1=245 =so2=265 =so3=275 =so4=285" },
		{ "s41273", "INV_Jewelry_Necklace_16", "=q2=Prism Amulet", "=ds=#sr# =so1=265 =so2=265 =so3=285 =so4=305" },
		{ "s41774", "INV_Jewelry_Necklace_07", "=q2=Spellweaver Pendant", "=ds=#sr# =so1=265 =so2=275 =so3=285 =so4=295" },
		{ "s41315", "INV_Jewelry_Necklace_11", "=q2=Moonlit Charm", "=ds=#sr# =so1=??? =so2=275 =so3=285 =so4=295" },
		{ "s41279", "INV_Jewelry_Necklace_Banshee", "=q2=Voidheart Charm", "=ds=#sr# =so1=280 =so2=280 =so3=300 =so4=320" },
		{ "s41105", "INV_Jewelry_Amulet_04", "=q2=Pendant of Arcane Radiance", "=ds=#sr# =so1=280 =so2=300 =so3=305 =so4=310" },
		{ "s41287", "INV_Jewelry_Talisman_05", "=q2=Stormcloud Sigil", "=ds=#sr# =so1=290 =so2=310 =so3=325 =so4=340" },
		{ "s41722", "INV_Jewelry_Necklace_06", "=q4=Pendant of Instability", "=ds=#sr# =so1=300 =so2=300 =so3=307 =so4=315" },
		{ "s41704", "INV_Jewelry_Amulet_01", "=q4=Talisman of Hinderance", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	JewelcraftingHelm1 = {
		{ "s41740", "INV_Crown_01", "=q2=Mistwood Tiara", "=ds=#sr# =so1=105 =so2=135 =so3=145 =so4=155" },
		{ "s41057", "INV_Crown_01", "=q2=Agatestone Crown", "=ds=#sr# =so1=125 =so2=145 =so3=155 =so4=165" },
		{ "s41339", "INV_Crown_02", "=q2=Circlet of Dampening", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41742", "INV_Crown_01", "=q3=Venomspire Diadem", "=ds=#sr# =so1=145 =so2=165 =so3=175 =so4=185" },
		{ "s41213", "INV_Helmet_19", "=q2=Goldenshade Quartz Crown", "=ds=#sr# =so1=175 =so2=195 =so3=202 =so4=210" },
		{ "s41744", "INV_Jewelry_Ring_03", "=q2=Bloodfire Circlet", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41786", "INV_Helmet_06", "=q2=Ornate Mithril Crown", "=ds=#sr# =so1=210 =so2=230 =so3=240 =so4=250" },
		{ "s41716", "INV_Jewelry_Ring_03", "=q3=Crown of Elegance", "=ds=#sr# =so1=230 =so2=260 =so3=270 =so4=280" },
		{ "s41261", "INV_Jewelry_Amulet_05", "=q2=Sunburst Tiara", "=ds=#sr# =so1=250 =so2=250 =so3=270 =so4=290" },
		{ "s41103", "INV_Helmet_53", "=q2=Ethereal Frostspark Crown", "=ds=#sr# =so1=280 =so2=285 =so3=297 =so4=310" },
		{ "s41806", "INV_Crown_01", "=q3=Crown of the Illustrious Queen", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ 0, "", "", "" },
		{ "s41706", "INV_Crown_02", "=q4=Mastercrafted Diamond Crown", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41698", "INV_Misc_Gem_Ruby_03", "=q4=Crown of Molten Ascension", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
	},

	JewelcraftingBracers1 = {
		{ "s29732", "INV_Bracer_03", "=q1=Copper Bangle", "=ds=#sr# =so1=1 =so2=21 =so3=33 =so4=45" },
		{ "s41011", "INV_Bracer_09", "=q2=Encrusted Copper Bangle", "=ds=#sr# =so1=50 =so2=70 =so3=75 =so4=80" },
		{ "s41587", "INV_Bracer_12", "=q2=Gloomweed Bindings", "=ds=#sr# =so1=80 =so2=160 =so3=170 =so4=180" },
		{ "s41049", "INV_Bracer_01", "=q1=Bronze Cuffed Bangles", "=ds=#sr# =so1=105 =so2=120 =so3=132 =so4=145" },
		{ "s41726", "INV_Bracer_19", "=q2=Hydrathorn Bracers", "=ds=#sr# =so1=105 =so2=125 =so3=135 =so4=145" },
		{ "s41337", "INV_Bracer_19", "=q2=Dawnbright Cuffs", "=ds=#sr# =so1=115 =so2=135 =so3=142 =so4=150" },
		{ "s41063", "INV_Bracer_14", "=q2=Enchanted Bracelets", "=ds=#sr# =so1=125 =so2=145 =so3=155 =so4=165" },
		{ "s41728", "INV_Bracer_09", "=q3=Blackrock Ironclamps", "=ds=#sr# =so1=140 =so2=160 =so3=170 =so4=180" },
		{ "s41205", "INV_Bracer_10", "=q2=Goldfire Crystal Bracelet", "=ds=#sr# =so1=155 =so2=155 =so3=160 =so4=165" },
		{ "s41730", "INV_Bracer_09", "=q2=Monastery Emberbrace", "=ds=#sr# =so1=170 =so2=185 =so3=195 =so4=205" },
		{ "s41548", "INV_Bracer_19", "=q2=Elaborate Golden Bracelets", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41718", "INV_Bracer_14", "=q3=Ornate Mithril Bracelets", "=ds=#sr# =so1=200 =so2=225 =so3=237 =so4=250" },
		{ "s41714", "INV_Bracer_19", "=q3=Opal Guided Bangles", "=ds=#sr# =so1=250 =so2=280 =so3=290 =so4=300" },
		{ "s41348", "INV_Bracer_10", "=q2=Crystalfire Armlets", "=ds=#sr# =so1=255 =so2=275 =so3=285 =so4=295" },
		{ "s41311", "INV_Bracer_03", "=q2=Stellar Gemguards", "=ds=#sr# =so1=??? =so2=270 =so3=280 =so4=290" },
		{ "s41101", "INV_Bracer_13", "=q2=Crystalweft Bracers", "=ds=#sr# =so1=280 =so2=285 =so3=297 =so4=310" },
		{ "s41804", "INV_Bracer_13", "=q3=Bindings of Luminance", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41778", "INV_Bracer_01", "=q2=Stormcloud Shackles", "=ds=#sr# =so1=??? =so2=310 =so3=320 =so4=330" },
		{ 0, "", "", "" },
		{ "s41700", "INV_Bracer_13", "=q4=Embergem Cuffs", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41808", "INV_Bracer_03", "=q4=Mastercrafted Diamond Bangles", "=ds=#sr# =so1=300 =so2=325 =so3=332 =so4=340" },
	},

	JewelcraftingOffHands1 = {
		{ "s41732", "INV_Misc_Orb_04", "=q2=Shadowmoon Orb", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41043", "INV_Misc_Orb_01", "=q2=Amber Orb", "=ds=#sr# =so1=95 =so2=110 =so3=120 =so4=130" },
		{ "s41053", "INV_Mace_08", "=q2=Bronze Scepter", "=ds=#sr# =so1=110 =so2=130 =so3=140 =so4=150" },
		{ "s41734", "INV_Misc_Gem_Pearl_02", "=q3=Fangclaw Relic", "=ds=#sr# =so1=120 =so2=140 =so3=150 =so4=160" },
		{ "s41736", "INV_Wand_05", "=q2=Netherbane Rod", "=ds=#sr# =so1=160 =so2=180 =so3=190 =so4=200" },
		{ "s41738", "INV_Misc_Orb_01", "=q2=Marine Root", "=ds=#sr# =so1=200 =so2=215 =so3=225 =so4=235" },
		{ "s41227", "INV_Staff_07", "=q2=Ornate Mithril Scepter", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41550", "INV_Wand_05", "=q2=Heart of the Sea", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41558", "INV_Misc_Gem_Sapphire_02", "=q2=Draenethyst Baton", "=ds=#sr# =so1=200 =so2=225 =so3=235 =so4=245" },
		{ "s41307", "INV_Wand_11", "=q3=Gemkeeper's Folio", "=ds=#sr# =so1=??? =so2=235 =so3=245 =so4=255" },
		{ "s41243", "INV_Misc_Orb_05", "=q2=Emberstone Idol", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s41305", "INV_Wand_09", "=q2=Golden Scepter of Authority", "=ds=#sr# =so1=??? =so2=260 =so3=270 =so4=280" },
		{ "s41095", "INV_Ore_Arcanite_02", "=q2=Glyph Codex", "=ds=#sr# =so1=260 =so2=280 =so3=287 =so4=295" },
		{ "s41356", "INV_Misc_Book_09", "=q3=Gemstone Compendium", "=ds=#sr# =so1=275 =so2=275 =so3=297 =so4=320" },
		{ "s41794", "INV_Misc_Gem_Pearl_04", "=q3=Orb of Clairvoyance", "=ds=#sr# =so1=285 =so2=320 =so3=330 =so4=340" },
		{ 0, "", "", "" },
		{ "s41792", "INV_Staff_11", "=q4=Empowered Domination Rod", "=ds=#sr# =so1=300 =so2=330 =so3=340 =so4=350" },
	},

	JewelcraftingStaves1 = {
		{ "s41009", "INV_Staff_07", "=q1=Copper Staff", "=ds=#sr# =so1=45 =so2=60 =so3=67 =so4=75" },
		{ "s41017", "INV_Staff_10", "=q2=Small Pearlstone Staff", "=ds=#sr# =so1=55 =so2=75 =so3=82 =so4=90" },
		{ "s41045", "INV_Staff_08", "=q2=Encrusted Bronze Staff", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41581", "INV_Staff_13", "=q2=Serpent's Coil Staff", "=ds=#sr# =so1=100 =so2=120 =so3=130 =so4=140" },
		{ "s41059", "INV_Staff_15", "=q2=Moonlight Staff", "=ds=#sr# =so1=125 =so2=150 =so3=160 =so4=170" },
		{ "s41583", "INV_Staff_18", "=q3=Farraki Ceremony Totem", "=ds=#sr# =so1=140 =so2=160 =so3=170 =so4=180" },
		{ "s41209", "INV_Wand_04", "=q2=Staff of Blossomed Jade", "=ds=#sr# =so1=165 =so2=185 =so3=195 =so4=205" },
		{ "s41585", "INV_Staff_12", "=q2=Sphinx's Wisdom Staff", "=ds=#sr# =so1=170 =so2=190 =so3=200 =so4=210" },
		{ "s41552", "INV_Staff_11", "=q2=Staff of Gallitrea", "=ds=#sr# =so1=200 =so2=225 =so3=235 =so4=245" },
		{ "s41352", "INV_Staff_13", "=q3=Opaline Illuminator", "=ds=#sr# =so1=210 =so2=235 =so3=245 =so4=255" },
		{ "s41241", "INV_Staff_32", "=q2=Royal Gemstone Staff", "=ds=#sr# =so1=215 =so2=235 =so3=245 =so4=255" },
		{ "s41720", "INV_Staff_32", "=q3=Regal Twilight Staff", "=ds=#sr# =so1=240 =so2=260 =so3=275 =so4=290" },
		{ "s41097", "INV_Staff_13", "=q2=Spellweaver Rod", "=ds=#sr# =so1=265 =so2=285 =so3=292 =so4=300" },
		{ "s41313", "INV_Wand_07", "=q2=Garnet Guardian Staff", "=ds=#sr# =so1=??? =so2=290 =so3=300 =so4=310" },
		{ "s41259", "INV_Staff_28", "=q2=Arcanum Baton", "=ds=#sr# =so1=300 =so2=320 =so3=330 =so4=340" },
		{ "s41802", "INV_Staff_20", "=q3=Spire of Channeled Power", "=ds=#sr# =so1=300 =so2=325 =so3=335 =so4=345" },
		{ 0, "", "", "" },
		{ "s41800", "inv_staff_14", "=q4=Rudeus' Focusing Cane", "=ds=#sr# =so1=300 =so2=330 =so3=340 =so4=350" },
	},

	JewelcraftingTrinkets1 = {
		{ "s41746", "INV_Misc_ShadowEgg", "=q2=Shadowforged Eye", "=ds=#sr# =so1=85 =so2=105 =so3=115 =so4=125" },
		{ "s41069", "INV_Jewelry_Talisman_06", "=q2=Silver Medallion", "=ds=#sr# =so1=135 =so2=150 =so3=160 =so4=170" },
		{ "s41748", "INV_QirajIdol_Life", "=q3=Totem of Self Preservation", "=ds=#sr# =so1=135 =so2=155 =so3=165 =so4=175" },
		{ "s41752", "INV_Misc_Gem_Pearl_01", "=q2=Obsidian Brooch", "=ds=#sr# =so1=175 =so2=190 =so3=197 =so4=205" },
		{ "s41215", "BTNHL_Holy_Grail", "=q2=The Golden Goblet", "=ds=#sr# =so1=175 =so2=195 =so3=202 =so4=210" },
		{ "s41285", "INV_Ingot_08", "=q2=Shimmering Moonstone Tablet", "=ds=#sr# =so1=195 =so2=195 =so3=217 =so4=240" },
		{ "s41754", "INV_Misc_Gem_Pearl_04", "=q2=Smoldering Brooch", "=ds=#sr# =so1=200 =so2=220 =so3=230 =so4=240" },
		{ "s41756", "INV_Misc_Gem_Sapphire_03", "=q2=Vitriol Brooch", "=ds=#sr# =so1=205 =so2=220 =so3=227 =so4=235" },
		{ "s41243", "INV_Misc_Orb_05", "=q2=Emberstone Idol", "=ds=#sr# =so1=220 =so2=240 =so3=250 =so4=260" },
		{ "s41724", "Spell_Shadow_GrimWard", "=q3=Ornament of Restraint", "=ds=#sr# =so1=245 =so2=245 =so3=265 =so4=285" },
		{ "s41099", "INV_Misc_Orb_01", "=q2=Quicksilver Whirl", "=ds=#sr# =so1=265 =so2=285 =so3=292 =so4=300" },
		{ "s41287", "INV_Jewelry_Talisman_05", "=q2=Stormcloud Sigil", "=ds=#sr# =so1=290 =so2=310 =so3=325 =so4=340" },
		{ "s41798", "INV_Misc_Gem_03", "=q3=Guardbreaker Charm", "=ds=#sr# =so1=300 =so2=320 =so3=325 =so4=330" },
		{ 0, "", "", "" },
		{ "s41796", "INV_Jewelry_Trinket_VampiricGrail", "=q4=Grail of Forgotten Memories", "=ds=#sr# =so1=300 =so2=330 =so3=340 =so4=350" },
	},

	JewelcraftingMisc1 = {
		{ "s29730", "BTNCopperring01", "=q1=Rough Copper Ring", "=ds=#sr# =so1=1 =so2=21 =so3=30 =so4=40" },
		{ "s41039", "INV_Jewelry_Ring_26", "=q1=Rough Bronze Ring", "=ds=#sr# =so1=90 =so2=100 =so3=107 =so4=115" },
		{ "s41067", "INV_Jewelry_Ring_01", "=q1=Rough Silver Ring", "=ds=#sr# =so1=125 =so2=135 =so3=145 =so4=155" },
		{ "s41081", "INV_Jewelry_Ring_27", "=q1=Rough Iron Ring", "=ds=#sr# =so1=150 =so2=165 =so3=170 =so4=175" },
		{ "s41083", "INV_Jewelry_Ring_03", "=q1=Rough Gold Ring", "=ds=#sr# =so1=150 =so2=165 =so3=170 =so4=175" },
		{ "s41219", "INV_Jewelry_Ring_12", "=q1=Rough Mithril Ring", "=ds=#sr# =so1=175 =so2=175 =so3=177 =so4=180" },
		{ "s41233", "INV_Jewelry_Ring_07", "=q1=Rough Truesilver Ring", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s41087", "BTNring02", "=q1=Rough Thorium Ring", "=ds=#sr# =so1=235 =so2=245 =so3=250 =so4=255" },
		{ "s41271", "INV_Jewelry_Ring_Gold", "=q1=Pure Gold Ring", "=ds=#sr# =so1=??? =so2=325 =so3=335 =so4=345" },
		{ 0, "", "", "" },
		{ "s29728", "INV_Misc_Bandage_08", "=q1=Rough Gritted Paper", "=ds=#sr# =so1=1 =so2=21 =so3=25 =so4=30" },
		{ "s41029", "INV_Misc_Bandage_10", "=q1=Coarse Gritted Paper", "=ds=#sr# =so1=70 =so2=90 =so3=95 =so4=100" },
		{ "s41201", "INV_Misc_Bandage_18", "=q1=Heavy Gritted Paper", "=ds=#sr# =so1=150 =so2=150 =so3=155 =so4=160" },
		{ "s41229", "INV_Misc_Bandage_17", "=q1=Solid Gritted Paper", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s41091", "INV_Misc_LeatherScrap_08", "=q1=Dense Gritted Paper", "=ds=#sr# =so1=250 =so2=260 =so3=265 =so4=270" },
		{ "s41031", "INV_Ore_Tin_01", "=q1=Rough Gemstone Cluster", "=ds=#sr# =so1=35 =so2=45 =so3=50 =so4=55" },
		{ "s41065", "INV_Stone_08", "=q1=Coarse Gemstone Cluster", "=ds=#sr# =so1=125 =so2=140 =so3=142 =so4=145" },
		{ "s41203", "INV_Stone_13", "=q1=Heavy Gemstone Cluster", "=ds=#sr# =so1=150 =so2=150 =so3=152 =so4=155" },
		{ "s41237", "INV_Stone_07", "=q1=Solid Gemstone Cluster", "=ds=#sr# =so1=200 =so2=200 =so3=205 =so4=210" },
		{ "s41770", "INV_Stone_14", "=q1=Dense Gemstone Cluster", "=ds=#sr# =so1=235 =so2=240 =so3=240 =so4=240" },
	}, ]]
}

for k, v in pairs(craftingTable) do
	AtlasLoot_Data[k] = v
end