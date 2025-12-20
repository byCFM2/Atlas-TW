---
--- Crafting.lua - Crafting profession data tables
---
--- This module contains comprehensive crafting data for all professions in
--- World of Warcraft. It includes recipes, materials, skill requirements,
--- and profession-specific items for all crafting disciplines.
---
--- Features:
--- • Complete profession recipe tables
--- • Skill level requirements
--- • Material and reagent lists
--- • Trainer and vendor information
--- • Specialty crafting items
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

local L = AtlasTW.Localization.UI
local LB = AtlasTW.Localization.Bosses
local LS = AtlasTW.Localization.Spells
local LZ = AtlasTW.Localization.Zones

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

local craftingTable = {
	PoisonsTable = {
		{ name = LS["Poisons"], icon = "Trade_BrewPoison" },
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
		{ id=45878, skill={1,285,310,335}}, --Dissolvent Poison 1.18
		{ id=45882, skill={1,325,350,375}}, --Dissolvent Poison II 1.18
		{},
		{ id=13220, skill={140,185,210,235}}, --Wound Poison
		{ name = LS["Poisons"], icon = "Trade_BrewPoison" },
		{ id=2835, skill={130,175,200,225}}, --Deadly Poison
		{ id=2837, skill={170,215,240,265}}, --Deadly Poison II
		{ id=11357, skill={210,255,280,305}}, --Deadly Poison III
		{ id=11358, skill={250,295,320,345}}, --Deadly Poison IV
		{ id=25347, skill={270,315,340,365}}, --Deadly Poison V
		{},
--[[ 		{ id=13228, skill={180,225,250,275}}, --Wound Poison II deleted 1.18
		{ id=13229, skill={220,265,290,315}}, --Wound Poison III deleted 1.18
		{ id=13230, skill={260,305,330,355}}, --Wound Poison IV deleted 1.18 ]]
		{ id=51924, skill={1,280,305,330}}, --Corrosive Poison 1.18
		{ id=52576, skill={1,300,325,350}}, --Corrosive Poison II 1.18
		{},
		{ id=5763, skill={120,150,175,200}}, --Mind-numbing Poison
		{ id=8694, skill={200,215,240,265}}, --Mind-numbing Poison II
		{ id=11400, skill={280,285,310,335}}, --Mind-numbing Poison III
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
		{ id = 115, skill={200,200,200,200} }, --Elixir of Rapid Growth 1.18
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
		{ id=11479, skill={225,240,260,280}, container = {3575} }, --Transmute: Iron to Gold
		{ name = L["Expert"], icon = "Trade_Alchemy" },
		{ id=11480, skill={225,240,260,280}, container = {3860} }, --Transmute: Mithril to Truesilver
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
		{ id=17187, skill={275,275,282,290}, container = {12359, 12363} }, --Transmute: Arcanite
		{ id=17559, skill={275,275,282,290}, container = {7082} }, --Transmute: Air to Fire
		{ id=17566, skill={275,275,282,290}, container = {7076} }, --Transmute: Earth to Life
		{ id=17561, skill={275,275,282,290}, container = {7076} }, --Transmute: Earth to Water
		{ id=17560, skill={275,275,282,290}, container = {7078} }, --Transmute: Fire to Earth
		{ id=17565, skill={275,275,282,290}, container = {12803} }, --Transmute: Life to Earth
		{ id=17563, skill={275,275,282,290}, container = {12808} }, --Transmute: Undeath to Water
		{ id=17562, skill={275,275,282,290}, container = {7080} }, --Transmute: Water to Air
		{ name = L["Artisan"], icon = "Trade_Alchemy" },
		{ id=17564, skill={275,275,282,290}, container = {7080} }, --Transmute: Water to Undeath
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
		{ id=25146, skill={300,301,305,310}, container = {7077} }, --Transmute: Elemental Fire
		{ id=57555, skill={300,315,322,330}, container = {7075} }, --Transmute: Elemental Earth
		{ id=57557, skill={300,315,322,330}, container = {7079} }, --Transmute: Elemental Water
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
		{ id=17632, skill={300,315,322,330} }, --Alchemist's Stone
		{ id = 36929, skill={300,300,300,300} }, --Concoction of the Emerald Mongoose 1.18
		{ id = 36932, skill={300,300,300,300} }, --Concoction of the Arcane Giant 1.18
		{ id = 36935, skill={300,300,300,300} }, --Concoction of the Dreamwater 1.18
		{ id = 36901, skill={300,300,300,300} }, --Elixir of Greater Frost Power 1.18
		{ id = 36903, skill={300,300,300,300} }, --Elixir of Greater Arcane Power 1.18
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
		{ id=11479, skill={225,240,260,280}, container = {3575} }, --Transmute: Iron to Gold
		{ id=11480, skill={225,240,260,280}, container = {3860} }, --Transmute: Mithril to Truesilver
		{ id=17559, skill={275,275,282,290}, container = {7082} }, --Transmute: Air to Fire
		{ id=17566, skill={275,275,282,290}, container = {7076} }, --Transmute: Earth to Life
		{ id=17561, skill={275,275,282,290}, container = {7076} }, --Transmute: Earth to Water
		{ id=17560, skill={275,275,282,290}, container = {7078} }, --Transmute: Fire to Earth
		{ id=17565, skill={275,275,282,290}, container = {12803} }, --Transmute: Life to Earth
		{ id=17563, skill={275,275,282,290}, container = {12808} }, --Transmute: Undeath to Water
		{ id=17562, skill={275,275,282,290}, container = {7080} }, --Transmute: Water to Air
		{ id=17564, skill={275,275,282,290}, container = {7080} }, --Transmute: Water to Undeath
		{ id=17187, skill={275,275,282,290}, container = {12359, 12363} }, --Transmute: Arcanite
		{ id=25146, skill={300,301,305,310}, container = {7077} }, --Transmute: Elemental Fire
		{ id=57555, skill={300,315,322,330}, container = {7075} }, --Transmute: Elemental Earth
		{ id=57557, skill={300,315,322,330}, container = {7079} }, --Transmute: Elemental Water
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
		{ id = 115, skill={200,200,200,200} }, --Elixir of Rapid Growth 1.18
		{ id = 11477, skill={250,265,285,305} }, --Elixir of Demonslaying
		{ id = 57111, skill={300,315,322,330} }, --Potion of Quickness
		{ id = 36929, skill={300,300,300,300} }, --Concoction of the Emerald Mongoose 1.18
		{ id = 36932, skill={300,300,300,300} }, --Concoction of the Arcane Giant 1.18
		{ id = 36935, skill={300,300,300,300} }, --Concoction of the Dreamwater 1.18
		{ id = 36901, skill={300,300,300,300} }, --Elixir of Greater Frost Power 1.18
		{ id = 36903, skill={300,300,300,300} }, --Elixir of Greater Arcane Power 1.18
	},

	AlchemyMisc = {
		{ name = L["Miscellaneous"], icon = "Trade_Alchemy" },
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
		{ name = L["Miscellaneous"], icon = "Trade_Alchemy" },
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
		{ id=17632, skill={300,315,322,330} }, --Alchemist's Stone
	},

	EnchantingApprentice = {
		{ name = L["Apprentice"], icon = "Trade_Engraving" },
		{ id=7421, skill={1,5,7,10} }, --Runed Copper Rod
		--{ id=7418, skill={1,70,90,110} }, --Enchant Bracer - Minor Health
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
		{ id=48, skill={170,170,170,170} }, --Enchant Boots - Lesser Intellect 1.18
		{ id=13644, skill={170,190,210,230} }, --Enchant Boots - Lesser Stamina
		{ id=13646, skill={170,190,210,230} }, --Enchant Bracer - Lesser Deflection
		{ id=13648, skill={170,190,210,230} }, --Enchant Bracer - Stamina
		{ id=13657, skill={175,195,215,235} }, --Enchant Cloak - Fire Resistance
		{ id=13653, skill={175,195,215,235} }, --Enchant Weapon - Lesser Beastslayer
		{ id=13655, skill={175,195,215,235} }, --Enchant Weapon - Lesser Elemental Slayer
		{ id=14810, skill={175,195,215,235} }, --Greater Mystic Wand
		{ name = L["Expert"], icon = "Trade_Engraving" },
		{ id=13661, skill={180,200,220,240} }, --Enchant Bracer - Strength
		{ id=13659, skill={180,200,220,240} }, --Enchant Shield - Spirit
		{ id=44, skill={185,185,185,185} }, -- Enchant Bracer - Agility 1.18
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
		{ name = L["Expert"], icon = "Trade_Engraving" },
		{ id=13746, skill={205,225,245,265} }, --Enchant Cloak - Greater Defense
		{ id=13794, skill={205,225,245,265} }, --Enchant Cloak - Resistance
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
		{ id=46603, skill={300,300,300,300} }, --Enchant Gloves - Holy Power
		{ id=46086, skill={300,300,300,300} }, --Enchant Gloves - Major Strength
		{ id=57518, skill={300,300,300,300} }, --Eternal Dreamstone Shard
		{ id=56543, skill={300,300,300,300} }, --Enchant Boots - Major Intellect --1.18
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
		{ id=44, skill={185,185,185,185} }, -- Enchant Bracer - Agility 1.18
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
		{ name = L["Bracer"], icon = "Trade_Engraving" },
		{ id=7428, skill={1,80,100,120} }, --Enchant Bracer - Minor Deflect
		--{ name = L["Bracer"], icon = "Trade_Engraving" },
		--{ id=7418, skill={1,70,90,110} }, --Enchant Bracer - Minor Health
	},

	EnchantingGlove = {
		{ name = L["Gloves"], icon = "Trade_Engraving" },
		{ id=46086, skill={300,300,300,300} }, --Enchant Gloves - Major Strength
		{ id=46603, skill={300,300,300,300} }, --Enchant Gloves - Holy Power
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
		{ name = L["Gloves"], icon = "Trade_Engraving" },
		{ id=13887, skill={225,245,265,285} }, --Enchant Gloves - Strength
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
		{ id=56543, skill={300,300,300,300} }, --Enchant Boots - Major Intellect 1.18
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
		{ id=48, skill={170,170,170,170} }, --Enchant Boots - Lesser Intellect 1.18
		{ id=13637, skill={160,180,200,220} }, --Enchant Boots - Lesser Agility
		{ name = L["Boots"], icon = "Trade_Engraving" },
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
		{},
		{ id=14293, skill={10,75,95,115} }, --Lesser Magic Wand
		{ id=14807, skill={70,110,130,150} }, --Greater Magic Wand
		{ id=14809, skill={155,175,195,215} }, --Lesser Mystic Wand
		{ id=14810, skill={175,195,215,235} }, --Greater Mystic Wand
		{},
		{ id=17181, skill={250,250,255,260} }, --Enchanted Leather
		{ id=17180, skill={250,250,255,260} }, --Enchanted Thorium
		{ id=41758, skill={275,275,280,300} }, --Enchanted Gemstone Oil
		{ name = L["Misc"], icon = "Trade_Engraving" },
		{ id=25130, skill={300,310,320,330} }, --Brilliant Mana Oil
		{ id=25129, skill={300,310,320,330} }, --Brilliant Wizard Oil
		{},
		{ id=25124, skill={45,55,65,75} }, --Minor Wizard Oil
		{ id=25125, skill={150,160,170,180} }, --Minor Mana Oil
		{ id=25126, skill={200,210,220,230} }, --Lesser Wizard Oil
		{ id=25127, skill={250,260,270,280} }, --Lesser Mana Oil
		{ id=25128, skill={275,285,295,305} }, --Wizard Oil
		{},
		{ id=15596, skill={265,285,305,325} }, --Smoking Heart of the Mountain
		{},
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
		{ name = L["Apprentice"], icon = "Trade_BlackSmithing" },
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
		{ id=8366, skill={70,110,130,150} }, --Ironforge Chain 1.18
		{ id=3326, skill={75,75,87,100} }, --Coarse Grinding Stone
		{ id=46664, skill={75,90,95,100} }, --Sharpened Claw
		{ name = L["Apprentice"], icon = "Trade_BlackSmithing" },
		{ id=45063, skill={75,100,120,140} }, --Blast Shield
	},

	SmithingJourneyman = {
		{ name = L["Journeyman"], icon = "Trade_BlackSmithing" },
		{ id=2667, skill={80,120,140,160} }, --Runed Copper Breastplate
		{ id=57166, skill={90,90,97,105} }, --Bronze Belt Buckle
		{ id=2664, skill={90,115,127,140} }, --Runed Copper Bracers
		{ id=7817, skill={95,125,140,155} }, --Rough Bronze Boots
		{ id=3292, skill={95,135,155,175} }, --Heavy Copper Broadsword
		{ id=46600, skill={100,1,1,1} }, --Lordaeron Breastplate 1.18
		{ id=7818, skill={100,105,107,110} }, --Silver Rod
		{ id=19666, skill={100,100,110,120} }, --Silver Skeleton Key
		{ id=8367, skill={100,140,160,180} }, --Ironforge Breastplate
		{ id=2671, skill={100,140,160,180} }, --Rough Bronze Bracers
		{ id=3491, skill={105,135,150,165} }, --Big Bronze Knife
		{ id=2670, skill={105,145,160,175} }, --Rough Bronze Cuirass
		{ id=2668, skill={105,145,160,175} }, --Rough Bronze Leggings
		{ id=2740, skill={110,140,155,170} }, --Bronze Mace
		{ name = L["Journeyman"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Journeyman"], icon = "Trade_BlackSmithing" },
		{ id=3331, skill={130,160,175,190} }, --Silvered Bronze Boots
		{ id=2673, skill={130,160,175,190} }, --Silvered Bronze Breastplate
		{ id=9987, skill={135,165,180,195} }, --Bronze Battle Axe
		{ id=3333, skill={135,165,180,195} }, --Silvered Bronze Gauntlets
		{ id=57169, skill={140,140,147,155} }, --Iron Belt Buckle
		{ id=8368, skill={140,170,185,200} }, --Ironforge Gauntlets 1.18
		{ id=6518, skill={140,170,185,200} }, --Iridescent Hammer
		{ id=3334, skill={145,175,190,205} }, --Green Iron Boots
		{ id=3297, skill={145,175,190,205} }, --Mighty Iron Hammer
		{ id=2675, skill={145,175,190,205} }, --Shining Silver Breastplate
		{ id=8768, skill={150,150,152,155} }, --Iron Buckle
		{ id=19667, skill={150,150,160,170} }, --Golden Skeleton Key
		{ id=14379, skill={150,155,157,160} }, --Golden Rod
		{ id=7221, skill={150,180,195,210} }, --Iron Shield Spike
		{ name = L["Journeyman"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Expert"], icon = "Trade_BlackSmithing" },
		{ id=3493, skill={175,200,212,225} }, --Jade Serpentblade
		{ id=69, skill={175,175,175,175} }, --Gold Belt Buckle 1.18
		{ id=46666, skill={180,190,195,200} }, --Frostbound Slasher 1.18
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
		{ name = L["Expert"], icon = "Trade_BlackSmithing" },
		{ id=15973, skill={190,215,227,240} }, --Searing Golden Blade
		{ id=3511, skill={195,220,232,245} }, --Golden Scale Cuirass
		{ id=57, skill={200,200,200,200} }, --Steel Belt Buckle 1.18
		{ id=9920, skill={200,200,205,210} }, --Solid Grinding Stone
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
		{ name = L["Expert"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Expert"], icon = "Trade_BlackSmithing" },
		{ id=9995, skill={220,245,257,270} }, --Blue Glittering Axe
		{ id=46626, skill={220,220,220,220} }, --Steel Plate Boots
		{ id=46627, skill={220,220,220,220} }, --Steel Plate Gauntlets
		{ id=9942, skill={220,240,250,260} }, --Mithril Scale Gloves
		{ id=90, skill={225,225,225,225} }, --Truesilver Belt Buckle 1.18
		{ id=9952, skill={225,245,255,265} }, --Ornate Mithril Shoulders
		{ id=9997, skill={225,250,262,275} }, --Wicked Mithril Blade
		{ id=46629, skill={225,225,225,225} }, --Steel Plate Armor
		{ id=46628, skill={225,225,225,225} }, --Steel Plate Legguards
		{ id=46651, skill={225,260,267,275} }, --Bloodstone Warblade 1.18
	},
	SmithingArtisan = {
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
		{ id=46631, skill={230,230,230,230} }, --Steel Plate Barbute
		{ id=46630, skill={230,230,230,230} }, --Steel Plate Pauldrons
		{ id=9959, skill={230,250,260,270} }, --Heavy Mithril Breastplate
		{ id=9961, skill={230,250,260,270} }, --Mithril Coif
		{ id=10001, skill={230,255,267,280} }, --Big Black Mace
		{ id=74, skill={235,235,235,235} }, -- Dragonscale Belt Buckle 1.18
		{ id=9968, skill={235,255,265,275} }, --Heavy Mithril Boots
		{ id=9966, skill={235,255,265,275} }, --Mithril Scale Shoulders
		{ id=9964, skill={235,255,265,275} }, --Mithril Spurs
		{ id=57175, skill={240,240,247,255} }, --Thorium Belt Buckle
		{ id=10005, skill={240,265,277,290} }, --Dazzling Mithril Rapier
		{ id=9970, skill={245,255,265,275} }, --Heavy Mithril Helm
		{ id=10009, skill={245,270,282,295} }, --Runed Mithril Hammer
		{ id=16639, skill={250,255,257,260} }, --Dense Grinding Stone
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
		{ id=16641, skill={250,255,257,260} }, --Dense Sharpening Stone
		{ id=16640, skill={250,255,257,260} }, --Dense Weightstone
		{ id=16642, skill={250,270,280,290} }, --Thorium Armor
		{ id=16643, skill={250,270,280,290} }, --Thorium Belt
		{ id=16644, skill={255,275,285,295} }, --Thorium Bracers
		{ id=10013, skill={255,280,292,305} }, --Ebon Shiv
		{ id=16645, skill={260,280,290,300} }, --Radiant Belt
		{ id=16960, skill={260,285,297,310} }, --Blacksmithing: Thorium Greatsword 1.18
		{ id=16647, skill={265,285,295,305} }, --Imperial Plate Belt
		{ id=16646, skill={265,285,295,305} }, --Imperial Plate Shoulders
		{ id=46660, skill={270,280,285,290} }, --Imperial Plate Gauntlets 1.18
		{ id=15293, skill={270,290,300,310} }, --Dark Iron Mail
		{ id=16649, skill={270,290,300,310} }, --Imperial Plate Bracers
		{ id=16648, skill={270,290,300,310} }, --Radiant Breastplate
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
		{ id=16967, skill={270,295,307,320} }, --Inlaid Thorium Hammer 1.18
		{ id=20201, skill={275,275,280,285} }, --Arcanite Rod
		{ id=19669, skill={275,275,280,285} }, --Arcanite Skeleton Key
		{ id=16651, skill={275,295,305,315} }, --Thorium Shield Spike
		{ id=16969, skill={275,300,312,325} }, --Ornate Thorium Handaxe
		{ id=47032, skill={275,300,312,325} }, --Hateforge Belt
		{ id=47034, skill={275,300,310,320} }, --Hateforge Boots
		{ id=57113, skill={275,300,310,320} }, --Thorium Spurs
		{ id=57178, skill={275,275,282,290} }, --Arcanite Belt Buckle
		{ id=85, skill={275,275,275,275} }, --Dark Iron Belt Buckle 1.18
		{ id=15295, skill={280,300,310,320} }, --Dark Iron Shoulders
		{ id=16652, skill={280,300,310,320} }, --Thorium Boots
		{ id=16653, skill={280,300,310,320} }, --Thorium Helm
		{ id=16971, skill={280,305,317,330} }, --Huge Thorium Battleaxe
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
		{ id=95, skill={285,285,285,285} }, --Enchanted Thorium Belt Buckle 1.18
		{ id=47033, skill={285,300,310,320} }, --Hateforge Grips
		{ id=16654, skill={285,305,315,325} }, --Radiant Gloves
		{ id=16980, skill={285,310,322,335} }, --Rune Edge 1.18
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
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
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
		{ id=24136, skill={300,320,330,340} }, --Bloodsoul Breastplate
		{ id=24138, skill={300,320,330,340} }, --Bloodsoul Gauntlets
		{ id=24137, skill={300,320,330,340} }, --Bloodsoul Shoulders
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
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
		{ id=21161, skill={300,325,337,350} }, --Sulfuron Hammer
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
		{ id=54009, skill={300,325,337,350} }, --Fiery Chain Breastplate
		{ id=57196, skill={300,300,300,300} }, --Bloody Belt Buckle
		{ id=57617, skill={300,315,322,330} }, --Otherworldly Coif
		{ id=57619, skill={300,315,322,330} }, --Otherworldly Spaulders
		{ id=57621, skill={300,315,322,330} }, --Otherworldly Breastplate
		{ id=57623, skill={300,315,322,330} }, --Otherworldly Leggings
		{ id=57625, skill={300,315,322,330} }, --Reflective Helmet
		{ id=57627, skill={300,315,322,330} }, --Reflective Pauldrons
		{ id=57629, skill={300,315,322,330} }, --Reflective Breastplate
		{ id=57631, skill={300,315,322,330} }, --Reflective Leggings
		{ id=57181, skill={300,300,305,310} }, --Dreamsteel Belt Buckle
		{ id=45471, skill={300,325,337,350} }, --Dreamsteel Boots
		{ id=45469, skill={300,325,337,350} }, --Dreamsteel Bracers
		{ id=45467, skill={300,325,337,350} }, --Dreamsteel Leggings
		{ name = L["Artisan"], icon = "Trade_BlackSmithing" },
		{ id=45465, skill={300,325,337,350} }, --Dreamsteel Mantle
		{ id=102, skill={300,300,300,300} }, --Obsidian Belt Buckle 1.18
	},

	Armorsmith = {
		{ name = LS["Armorsmith"], icon = "Trade_BlackSmithing" },
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
		{ name = LS["Armorsmith"], icon = "Trade_BlackSmithing" },
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
		{ id=57189, skill={300,310,315,320} }, --Towerforge Breastplate
		{ id=57187, skill={300,310,315,320} }, --Towerforge Crown
		{ id=57191, skill={300,310,315,320} }, --Towerforge Pauldrons
		{ name = LS["Armorsmith"], icon = "Trade_BlackSmithing" },
		{ id=46667, skill={300,315,322,330} }, --Pauldron of Deflection 1.18
		{ id=36907, skill={300,300,300,300} }, --Rune-Inscribed Plate Leggings 1.18
	},

	Weaponsmith = {
		{ name = LS["Weaponsmith"], icon = "Trade_BlackSmithing" },
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
		{ id=46657, skill={300,300,315,330} }, --Ornate Bloodstone Dagger
	},

	Axesmith = {
		{ name = L["Master Axesmith"], icon = "Trade_BlackSmithing" },
		{ id=16970, skill={275,300,312,325} }, --Dawn's Edge
		{ id=16991, skill={300,320,330,340} }, --Annihilator
		{ id=16994, skill={300,320,330,340} }, --Arcanite Reaper
		{ id=20897, skill={300,320,330,340} }, --Dark Iron Destroyer
		{ id=23653, skill={300,320,330,340} }, --Nightfall
	},

	Hammersmith = {
		{ name = L["Master Hammersmith"], icon = "Trade_BlackSmithing" },
		{ id=16973, skill={280,305,317,330} }, --Enchanted Battlehammer
		{ id=16983, skill={285,310,322,335} }, --Serenity
		{ id=16988, skill={300,320,330,340} }, --Hammer of the Titans
		{ id=16993, skill={300,320,330,340} }, --Masterwork Stormhammer
		{ id=23650, skill={300,320,330,340} }, --Ebon Hand
		{ id=27830, skill={300,320,330,340} }, --Persuader
		{ id=57193, skill={300,310,315,320} }, --Towerforge Demolisher
		{ id=45487, skill={300,315,330,345} }, --Dawnstone Hammer
	},

	Swordsmith = {
		{ name = L["Master Swordsmith"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Helm"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Helm"], icon = "Trade_BlackSmithing" },
		{ id=16742, skill={300,320,330,340} }, --Enchanted Thorium Helm
		{ id=16728, skill={300,320,330,340} }, --Helm of the Great Chief
		{ id=16724, skill={300,320,330,340} }, --Whitesoul Helm
		{ id=57617, skill={300,315,322,330} }, --Otherworldly Coif
		{ id=57625, skill={300,315,322,330} }, --Reflective Helmet
		{ id=23636, skill={300,320,330,340} }, --Dark Iron Helm
		{ id=16729, skill={300,320,330,340} }, --Lionheart Helm
		{ id=57187, skill={300,310,315,320} }, --Towerforge Crown
	},

	SmithingShoulders = {
		{ name = L["Shoulders"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Shoulders"], icon = "Trade_BlackSmithing" },
		{ id=24141, skill={300,320,330,340} }, --Darksoul Shoulders
		{ id=57026, skill={300,320,330,340} }, --Mantle of Centaur Authority
		{ id=47025, skill={300,320,330,340} }, --Rune-Etched Mantle
		{ id=54005, skill={300,325,337,350} }, --Pauldrons of the Timbermaw
		{ id=57619, skill={300,315,322,330} }, --Otherworldly Spaulders
		{ id=57627, skill={300,315,322,330} }, --Reflective Pauldrons
		{ id=46667, skill={300,315,322,330} }, --Pauldron of Deflection 1.18
		{ id=20873, skill={300,320,330,340} }, --Fiery Chain Shoulders
		{ id=57191, skill={300,310,315,320} }, --Towerforge Pauldrons
		{ id=45465, skill={300,325,337,350} }, --Dreamsteel Mantle
	},

	SmithingChest = {
		{ name = L["Chest"], icon = "Trade_BlackSmithing" },
		{ id=12260, skill={1,15,35,55} }, --Rough Copper Vest
		{ id=3321, skill={35,75,95,115} }, --Copper Chain Vest
		{ id=8366, skill={70,110,130,150} }, --Ironforge Chain 1.18
		{ id=2667, skill={80,120,140,160} }, --Runed Copper Breastplate
		{ id=46600, skill={100,1,1,1} }, --Lordaeron Breastplate 1.18
		{ id=8367, skill={100,140,160,180} }, --Ironforge Breastplate
		{ id=2670, skill={105,145,160,175} }, --Rough Bronze Cuirass
		{ id=2673, skill={130,160,175,190} }, --Silvered Bronze Breastplate
		{ id=2675, skill={145,175,190,205} }, --Shining Silver Breastplate
		{ id=9813, skill={160,185,197,210} }, --Barbaric Iron Breastplate
		{ id=3508, skill={180,205,217,230} }, --Green Iron Hauberk
		{ id=3511, skill={195,220,232,245} }, --Golden Scale Cuirass
		{ id=9916, skill={200,225,237,250} }, --Steel Breastplate
		{ id=9972, skill={210,260,270,280} }, --Ornate Mithril Breastplate
		{ name = L["Chest"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Chest"], icon = "Trade_BlackSmithing" },
		{ id=24914, skill={300,320,330,340} }, --Darkrune Breastplate
		{ id=24139, skill={300,320,330,340} }, --Darksoul Breastplate
		{ id=28461, skill={300,320,330,340} }, --Ironvine Breastplate
		{ id=47023, skill={300,320,330,340} }, --Rune-Etched Breastplate
		{ id=57621, skill={300,315,322,330} }, --Otherworldly Breastplate
		{ id=57629, skill={300,315,322,330} }, --Reflective Breastplate
		{ id=28242, skill={300,320,330,340} }, --Icebane Breastplate
		{ id=27590, skill={300,320,330,340} }, --Obsidian Mail Tunic
		{ id=27587, skill={300,320,330,340} }, --Thick Obsidian Breastplate
		{ id=54009, skill={300,325,337,350} }, --Fiery Chain Breastplate
		{ id=16746, skill={300,320,330,340} }, --Invulnerable Mail
		{ id=57189, skill={300,310,315,320} }, --Towerforge Breastplate
	},

	SmithingBracers = {
		{ name = L["Bracers"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Gloves"], icon = "Trade_BlackSmithing" },
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
		{ id=46660, skill={270,280,285,290} }, --Imperial Plate Gauntlets 1.18
		{ id=47033, skill={285,300,310,320} }, --Hateforge Grips
		{ id=16654, skill={285,305,315,325} }, --Radiant Gloves
		{ name = L["Gloves"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Belt"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Pants"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Pants"], icon = "Trade_BlackSmithing" },
		{ id=16732, skill={300,320,330,340} }, --Runic Plate Leggings
		{ id=16662, skill={300,320,330,340} }, --Thorium Leggings
		{ id=24140, skill={300,320,330,340} }, --Darksoul Leggings
		{ id=47022, skill={300,320,330,340} }, --Rune-Etched Legplates
		{ id=16744, skill={300,320,330,340} }, --Enchanted Thorium Leggings
		{ id=57623, skill={300,315,322,330} }, --Otherworldly Leggings
		{ id=57631, skill={300,315,322,330} }, --Reflective Leggings
		{ id=45467, skill={300,325,337,350} }, --Dreamsteel Leggings
		{ id=20876, skill={300,320,330,340} }, --Dark Iron Leggings
		{ id=27829, skill={300,320,330,340} }, --Titanic Leggings
		{ id=36907, skill={300,300,300,300} }, --Rune-Inscribed Plate Leggings 1.18
	},

	SmithingBoots = {
		{ name = L["Boots"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Boots"], icon = "Trade_BlackSmithing" },
		{ id=16665, skill={300,320,330,340} }, --Runic Plate Boots
		{ id=23629, skill={300,320,330,340} }, --Heavy Timbermaw Boots
		{ id=47021, skill={300,320,330,340} }, --Rune-Etched Greaves
		{ id=45471, skill={300,325,337,350} }, --Dreamsteel Boots
		{ id=24399, skill={300,320,330,340} }, --Dark Iron Boots
	},

	SmithingAxes = {
		{ name = L["Axes"], icon = "Trade_BlackSmithing" },
		{ id=2738, skill={20,60,80,100} }, --Copper Axe
		{ id=3294, skill={70,110,130,150} }, --Thick War Axe
		{ id=2741, skill={115,145,160,175} }, --Bronze Axe
		{ id=21913, skill={190,215,227,240} }, --Edge of Winter
		{ id=9993, skill={210,235,247,260} }, --Heavy Mithril Axe
		{ id=9995, skill={220,245,257,270} }, --Blue Glittering Axe
		{ id=16969, skill={275,300,312,325} }, --Ornate Thorium Handaxe
		{ id=16970, skill={275,300,312,325} }, --Dawn's Edge
		{ id=16980, skill={285,310,322,335} }, --Rune Edge 1.18
		{ id=16991, skill={300,320,330,340} }, --Annihilator
		{ id=20897, skill={300,320,330,340} }, --Dark Iron Destroyer
		{ id=3293, skill={35,75,95,115} }, --Copper Battle Axe
		{ id=9987, skill={135,165,180,195} }, --Bronze Battle Axe
		{ id=3498, skill={185,210,222,235} }, --Massive Iron Axe
		{ name = L["Axes"], icon = "Trade_BlackSmithing" },
		{ id=3500, skill={200,225,237,250} }, --Shadow Crescent Axe
		{ id=16965, skill={270,290,300,310} }, --Bleakwood Hew
		{ id=16971, skill={280,305,317,330} }, --Huge Thorium Battleaxe
		{ id=16994, skill={300,320,330,340} }, --Arcanite Reaper
		{ id=23653, skill={300,320,330,340} }, --Nightfall
	},

	SmithingSwords = {
		{ name = L["Swords"], icon = "Trade_BlackSmithing" },
		{ id=2739, skill={25,65,85,105} }, --Copper Shortsword
		{ id=2742, skill={120,150,165,180} }, --Bronze Shortsword
		{ id=3492, skill={160,185,197,210} }, --Hardened Iron Shortsword
		{ id=9997, skill={225,250,262,275} }, --Wicked Mithril Blade
		{ id=10005, skill={240,265,277,290} }, --Dazzling Mithril Rapier
		{ id=10007, skill={245,270,282,295} }, --Phantom Blade
		{ id=16992, skill={300,320,330,340} }, --Frostguard
		{ id=20890, skill={300,320,330,340} }, --Dark Iron Reaver
		{ id=46661, skill={300,320,330,340} }, --Dream's Herald
		{ id=27832, skill={300,320,330,340} }, --Sageblade
		{},
		{ id=3493, skill={175,200,212,225} }, --Jade Serpentblade
		{ id=16978, skill={280,305,317,330} }, --Blazing Rapier
		{ id=23652, skill={300,320,330,340} }, --Blackguard
		{ name = L["Swords"], icon = "Trade_BlackSmithing" },
		{ id=9983, skill={30,70,90,110} }, --Copper Claymore
		{ id=3292, skill={95,135,155,175} }, --Heavy Copper Broadsword
		{ id=9986, skill={130,160,175,190} }, --Bronze Greatsword
		{ id=3496, skill={180,205,217,230} }, --Moonsteel Broadsword
		{ id=3497, skill={200,225,237,250} }, --Frost Tiger Blade
		{ id=46651, skill={225,260,267,275} }, --Bloodstone Warblade 1.18
		{ id=16960, skill={260,285,297,310} }, --Thorium Greatsword 1.18
		{ id=10015, skill={260,285,297,310} }, --Truesilver Champion
		{ id=16985, skill={290,315,327,340} }, --Corruption
		{ id=16990, skill={300,320,330,340} }, --Arcanite Champion
		{ id=46652, skill={300,320,330,340} }, --Untempered Runeblade
	},

	SmithingMaces = {
		{ name = L["Maces"], icon = "Trade_BlackSmithing" },
		{ id=2737, skill={15,55,75,95} }, --Copper Mace
		{ id=2740, skill={110,140,155,170} }, --Bronze Mace
		{ id=3296, skill={130,160,175,190} }, --Heavy Bronze Mace
		{ id=3297, skill={145,175,190,205} }, --Mighty Iron Hammer
		{ id=10001, skill={230,255,267,280} }, --Big Black Mace
		{ id=10009, skill={245,270,282,295} }, --Runed Mithril Hammer
		{ id=10003, skill={235,260,272,285} }, --The Shatterer
		{ id=16983, skill={285,310,322,335} }, --Serenity
		{ id=16984, skill={290,315,327,340} }, --Volcanic Hammer
		{ id=16993, skill={300,320,330,340} }, --Masterwork Stormhammer
		{ id=27830, skill={300,320,330,340} }, --Persuader
		{},
		{ id=6518, skill={140,170,185,200} }, --Iridescent Hammer
		{ id=23650, skill={300,320,330,340} }, --Ebon Hand
		{ name = L["Maces"], icon = "Trade_BlackSmithing" },
		{ id=7408, skill={65,105,125,145} }, --Heavy Copper Maul
		{ id=9985, skill={125,155,170,185} }, --Bronze Warhammer
		{ id=3494, skill={155,180,192,205} }, --Solid Iron Maul
		{ id=3495, skill={170,195,207,220} }, --Golden Iron Destroyer
		{ id=15292, skill={265,285,295,305} }, --Dark Iron Pulverizer
		{ id=16967, skill={270,295,307,320} }, --Inlaid Thorium Hammer 1.18
		{ id=16973, skill={280,305,317,330} }, --Enchanted Battlehammer
		{ id=16988, skill={300,320,330,340} }, --Hammer of the Titans
		{ id=57193, skill={300,325,337,350} }, --Towerforge Demolisher
		{ id=45487, skill={300,325,337,350} }, --Dawnstone Hammer
		{ id=21161, skill={300,325,337,350} }, --Sulfuron Hammer
	},

	SmithingFist = {
		{ name = LS["Fist Weapons"], icon = "Trade_BlackSmithing" },
		{ id=46663, skill={30,60,62,65} }, --Copper Knuckles
		{ id=46664, skill={75,90,95,100} }, --Sharpened Claw
		{ id=46665, skill={120,140,145,150} }, --Bronze Bruiser
		{ id=46666, skill={180,190,195,200} }, --Frostbound Slasher 1.18
		{ id=16986, skill={300,320,330,340} }, --Blood Talon
	},

	SmithingDaggers = {
		{ name = LS["Daggers"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Belt Buckles"], icon = "Trade_BlackSmithing" },
		{ id=57163, skill={25,25,37,50} }, --Copper Belt Buckle
		{ id=57166, skill={90,90,97,105} }, --Bronze Belt Buckle
		{ id=57169, skill={140,140,147,155} }, --Iron Belt Buckle
		{ id=69, skill={175,175,175,175} }, --Gold Belt Buckle 1.18
		{ id=57172, skill={185,190,197,205} }, --Mithril Belt Buckle
		{ id=57, skill={200,200,200,200} }, --Steel Belt Buckle 1.18
		{ id=90, skill={225,225,225,225} }, --Truesilver Belt Buckle 1.18
		{ id=74, skill={235,235,235,235} }, -- Dragonscale Belt Buckle 1.18
		{ id=57175, skill={240,240,247,255} }, --Thorium Belt Buckle
		{ id=85, skill={275,275,275,275} }, --Dark Iron Belt Buckle 1.18
		{ id=57178, skill={275,275,282,290} }, --Arcanite Belt Buckle
		{ id=95, skill={285,285,285,285} }, --Enchanted Thorium Belt Buckle 1.18
		{ id=57196, skill={300,300,300,300} }, --Bloody Belt Buckle
		{ id=57181, skill={300,300,305,310} }, --Dreamsteel Belt Buckle
		{ name = L["Belt Buckles"], icon = "Trade_BlackSmithing" },
		{ id=102, skill={300,300,300,300} }, --Obsidian Belt Buckle 1.18
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
		{ name = L["Misc"], icon = "Trade_BlackSmithing" },
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
		{ name = L["Misc"], icon = "Trade_BlackSmithing" },
		{ id=3337, skill={125,125,137,150} }, --Heavy Grinding Stone
		{ id=9920, skill={200,200,205,210} }, --Solid Grinding Stone
		{ id=16639, skill={250,255,257,260} }, --Dense Grinding Stone
		{ id=7818, skill={100,105,107,110} }, --Silver Rod
		{ id=14379, skill={150,155,157,160} }, --Golden Rod
		{ id=14380, skill={200,205,207,210} }, --Truesilver Rod
		{ id=20201, skill={275,275,280,285} }, --Arcanite Rod
	},

	LeatherApprentice = {
		{ name = L["Apprentice"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Apprentice"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Journeyman"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Journeyman"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Journeyman"], icon = "INV_Misc_ArmorKit_17" },
		{ id=9145, skill={125,150,162,175} }, --Fletcher's Gloves
		{ id=3768, skill={130,155,167,180} }, --Hillman's Shoulders
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
		{ name = L["Journeyman"], icon = "INV_Misc_ArmorKit_17" },
		{ id=9194, skill={150,170,180,190} }, --Heavy Leather Ammo Pouch
		{ id=9193, skill={150,170,180,190} }, --Heavy Quiver
		{ id=3780, skill={150,170,180,190} }, --Heavy Armor Kit
	},

	LeatherExpert = {
		{ name = L["Expert"], icon = "INV_Misc_ArmorKit_17" },
		{ id=3772, skill={155,175,185,195} }, --Green Leather Armor
		{ id=23399, skill={155,175,185,195} }, --Barbaric Bracers
		{ id=3774, skill={160,180,190,200} }, --Green Leather Belt
		{ id=7147, skill={160,180,190,200} }, --Guardian Pants
		{ id=9195, skill={165,185,195,205} }, --Dusky Leather Leggings
		{ id=4097, skill={165,185,195,205} }, --Raptor Hide Belt
		{ id=4096, skill={165,185,195,205} }, --Raptor Hide Harness
        { id = 70, skill={170,170,170,170} }, --Dragonmaw Gloves 1.18
		{ id=7149, skill={170,190,200,210} }, --Barbaric Leggings
		{ id=3775, skill={170,190,200,210} }, --Guardian Belt
		{ id=6704, skill={170,190,200,210} }, --Thick Murloc Armor
		{ id=55, skill={175,175,175,175} }, --Dragonmaw Armor Kit 1.18
		{ id=7151, skill={175,195,205,215} }, --Barbaric Shoulders
		{ id=9196, skill={175,195,205,215} }, --Dusky Leather Armor
		{ name = L["Expert"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Expert"], icon = "INV_Misc_ArmorKit_17" },
		{ id=10482, skill={200,200,200,200} }, --Cured Thick Hide
		{ id=22711, skill={200,210,220,230} }, --Shadowskin Gloves
		{ id=10487, skill={200,220,230,240} }, --Thick Armor Kit
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
		{ name = L["Expert"], icon = "INV_Misc_ArmorKit_17" },
		{ id=46662, skill={205,225,230,235} }, --Shadowskin Boots 1.18
		{ id=46625, skill={210,225,230,235} }, --Grifter's Cover
		{ id=20650, skill={200,200,202,205} }, --Thick Leather
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
		{ name = L["Expert"], icon = "INV_Misc_ArmorKit_17" },
		{ id=10542, skill={225,245,255,265} }, --Tough Scorpid Gloves
		{ id=10546, skill={225,245,255,265} }, --Wild Leather Helmet
		{ id=10544, skill={225,245,255,265} }, --Wild Leather Vest
	},

	LeatherArtisan = {
		{ name = L["Artisan"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Artisan"], icon = "INV_Misc_ArmorKit_17" },
		{ id=10647, skill={250,270,280,290} }, --Feathered Breastplate
		{ id=10570, skill={250,270,280,290} }, --Tough Scorpid Helm
		{ id=10574, skill={250,270,280,290} }, --Wild Leather Cloak
		{ id=10572, skill={250,270,280,290} }, --Wild Leather Leggings
		{ id=19048, skill={255,275,285,295} }, --Heavy Scorpid Bracers
		{ id=19049, skill={260,280,290,300} }, --Wicked Leather Gauntlets
		{ id=19051, skill={265,285,295,305} }, --Heavy Scorpid Vest
		{ id=19052, skill={265,285,295,305} }, --Wicked Leather Bracers
		{ id=57008, skill={265,320,330,340} }, --Breastplate of the Earth
		{ id=19055, skill={270,290,300,310} }, --Runic Leather Gauntlets
		{ id=47015, skill={270,285,290,295} }, --Primalist's Gloves
		{ id=47017, skill={270,290,291,295} }, --Primalist's Headdress
		{ id=47020, skill={275,290,291,295} }, --Primalist's Boots
		{ id=22815, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ name = L["Artisan"], icon = "INV_Misc_ArmorKit_17" },
		{ id=19064, skill={275,295,305,315} }, --Heavy Scorpid Gauntlets
		{ id=19065, skill={275,295,305,315} }, --Runic Leather Bracers
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
		{ name = L["Artisan"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Artisan"], icon = "INV_Misc_ArmorKit_17" },
		{ id=22922, skill={300,320,330,340} }, --Mongoose Boots
		{ id=19093, skill={300,320,330,340} }, --Onyxia Scale Cloak
		{ id=24123, skill={300,320,330,340} }, --Primal Batskin Bracers
		{ id=24122, skill={300,320,330,340} }, --Primal Batskin Gloves
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
		{ name = L["Artisan"], icon = "INV_Misc_ArmorKit_17" },
		{ id=57609, skill={300,315,322,330} }, --Ethereal Helmet
		{ id=57611, skill={300,315,322,330} }, --Ethereal Shoulder Pads
		{ id=57613, skill={300,315,322,330} }, --Ethereal Tunic
		{ id=57615, skill={300,315,322,330} }, --Ethereal Leggings
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
		{ name = L["Artisan"], icon = "INV_Misc_ArmorKit_17" },
		{ id=45477, skill={300,320,330,340} }, --Dreamhide Leggings
		{ id=45479, skill={300,320,330,340} }, --Dreamhide Belt
		{ id=45483, skill={300,320,330,340} }, --Inscribed Runic Bracers
		{ id=45455, skill={300,320,330,340} }, --Dreamhide
	},

	Dragonscale = {
		{ name = LS["Dragonscale Leatherworking"], icon = "INV_Misc_ArmorKit_17" },
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
		{ id=46655, skill={295,300,315,330} }, --Red Dragonscale Boots
		{ id=46653, skill={295,315,322,330} }, --Red Dragonscale Leggings
		{ id=46654, skill={300,315,322,330} }, --Red Dragonscale Shoulders
		{ id=19107, skill={300,320,330,340} }, --Black Dragonscale Leggings
		{ name = LS["Dragonscale Leatherworking"], icon = "INV_Misc_ArmorKit_17" },
		{ id=24654, skill={300,320,330,340} }, --Blue Dragonscale Leggings
		{ id=19094, skill={300,320,330,340} }, --Black Dragonscale Shoulders
		{ id=19054, skill={300,320,330,340} }, --Red Dragonscale Breastplate
		{ id=20855, skill={300,320,330,340} }, --Black Dragonscale Boots
		{ id=22926, skill={300,320,330,340} }, --Chromatic Cloak
		{ id=23708, skill={300,320,330,340} }, --Chromatic Gauntlets
		{ id=24703, skill={300,320,330,340} }, --Dreamscale Breastplate
		{ id=46659, skill={300,315,322,330} }, --Stormscale Leggings
		{ id=54013, skill={300,315,330,345} }, --Chromatic Leggings
		{ id=36911, skill={300,300,300,300} }, --Prismatic Scale Barbute 1.18
	},

	Elemental = {
		{ name = LS["Elemental Leatherworking"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = LS["Elemental Leatherworking"], icon = "INV_Misc_ArmorKit_17" },
		{ id=20854, skill={300,320,330,340} }, --Molten Helm
		{ id=22928, skill={300,320,330,340} }, --Shifting Cloak
		{ id=57016, skill={300,320,330,340} }, --Depthstalker Helm
		{ id=57012, skill={300,320,330,340} }, --Earthguard Tunic
		{ id=57014, skill={300,320,330,340} }, --Flamewrath Leggings
		{ id=57018, skill={300,320,330,340} }, --Windwalker Boots
		{ id=54015, skill={300,315,330,345} }, --Molten Leggings
		{ id=37, skill={300,300,300,300} }, --Harness of the High Thane 1.18
		{ id=36909, skill={300,300,300,300} }, --Essence Infused Leather Gloves 1.18
	},

	Tribal = {
		{ name = LS["Tribal Leatherworking"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = LS["Tribal Leatherworking"], icon = "INV_Misc_ArmorKit_17" },
		{ id=19104, skill={300,320,330,340} }, --Frostsaber Tunic
		{ id=19097, skill={300,320,330,340} }, --Devilsaur Leggings
		{ id=23709, skill={300,320,330,340} }, --Corehound Belt
		{ id=22927, skill={300,320,330,340} }, --Hide of the Wild
		{ id=47035, skill={300,300,320,340} }, --Verdant Dreamer's Breastplate
		{ id=54007, skill={300,315,330,345} }, --Corehound Gloves
	},

	LeatherHelm = {
		{ name = L["Helm"], icon = "INV_Misc_ArmorKit_17" },
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
		{ id=57609, skill={300,315,322,330} }, --Ethereal Helmet
		{ name = L["Helm"], icon = "INV_Misc_ArmorKit_17" },
		{ id=20854, skill={300,320,330,340} }, --Molten Helm
		{ id=57016, skill={300,320,330,340} }, --Depthstalker Helm
		{ id=36911, skill={300,300,300,300} }, --Prismatic Scale Barbute 1.18
	},

	LeatherShoulders = {
		{ name = L["Shoulders"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Shoulders"], icon = "INV_Misc_ArmorKit_17" },
		{ id=19101, skill={300,320,330,340} }, --Volcanic Shoulders
		{ id=24125, skill={300,320,330,340} }, --Blood Tiger Shoulders
		{ id=23706, skill={300,320,330,340} }, --Golden Mantle of the Dawn
		{ id=46654, skill={300,315,322,330} }, --Red Dragonscale Shoulders
		{ id=19094, skill={300,320,330,340} }, --Black Dragonscale Shoulders
		{ id=57611, skill={300,315,322,330} }, --Ethereal Shoulder Pads
		{ id=45473, skill={300,320,330,340} }, --Dreamhide Mantle
	},

	LeatherCloak = {
		{ name = L["Cloak"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Cloak"], icon = "INV_Misc_ArmorKit_17" },
		{ id=22928, skill={300,320,330,340} }, --Shifting Cloak
		{ id=22927, skill={300,320,330,340} }, --Hide of the Wild
	},

	LeatherChest = {
		{ name = L["Chest"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Chest"], icon = "INV_Misc_ArmorKit_17" },
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
		{ id=57008, skill={265,320,330,340} }, --Breastplate of the Earth
		{ name = L["Chest"], icon = "INV_Misc_ArmorKit_17" },
		{ id=22815, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ id=19068, skill={275,295,305,315} }, --Warbear Harness
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
		{ name = L["Chest"], icon = "INV_Misc_ArmorKit_17" },
		{ id=57022, skill={300,320,330,340} }, --Centaur Battle Harness
		{ id=24848, skill={300,320,330,340} }, --Spitfire Breastplate
		{ id=19054, skill={300,320,330,340} }, --Red Dragonscale Breastplate
		{ id=19095, skill={300,320,330,340} }, --Living Breastplate
		{ id=57613, skill={300,315,322,330} }, --Ethereal Tunic
		{ id=19104, skill={300,320,330,340} }, --Frostsaber Tunic
		{ id=57012, skill={300,320,330,340} }, --Earthguard Tunic
		{ id=28222, skill={300,320,330,340} }, --Icy Scale Breastplate
		{ id=28219, skill={300,320,330,340} }, --Polar Tunic
		{ id=24703, skill={300,320,330,340} }, --Dreamscale Breastplate
		{ id=47035, skill={300,300,320,340} }, --Verdant Dreamer's Breastplate
		{ id=37, skill={300,300,300,300} }, --Harness of the High Thane 1.18
	},

	LeatherBracers = {
		{ name = L["Bracers"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Bracers"], icon = "INV_Misc_ArmorKit_17" },
		{ id=24849, skill={300,320,330,340} }, --Sandstalker Bracers
		{ id=24846, skill={300,320,330,340} }, --Spitfire Bracers
		{ id=22923, skill={300,320,330,340} }, --Swift Flight Bracers
		{ id=28224, skill={300,320,330,340} }, --Icy Scale Bracers
		{ id=28221, skill={300,320,330,340} }, --Polar Bracers
		{ id=45475, skill={300,320,330,340} }, --Dreamhide Bracers
		{ id=45483, skill={300,320,330,340} }, --Inscribed Runic Bracers
	},

	LeatherGloves = {
		{ name = L["Gloves"], icon = "INV_Misc_ArmorKit_17" },
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
        { id = 70, skill={170,170,170,170} }, --Dragonmaw Gloves 1.18
		{ name = L["Gloves"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Gloves"], icon = "INV_Misc_ArmorKit_17" },
		{ id=19084, skill={290,310,320,330} }, --Devilsaur Gauntlets
		{ id=19087, skill={295,315,325,335} }, --Frostsaber Gloves
		{ id=24122, skill={300,320,330,340} }, --Primal Batskin Gloves
		{ id=24850, skill={300,320,330,340} }, --Sandstalker Gauntlets
		{ id=24847, skill={300,320,330,340} }, --Spitfire Gauntlets
		{ id=23704, skill={300,320,330,340} }, --Timbermaw Brawlers
		{ id=26279, skill={300,320,330,340} }, --Stormshroud Gloves
		{ id=23708, skill={300,320,330,340} }, --Chromatic Gauntlets
		{ id=28223, skill={300,320,330,340} }, --Icy Scale Gauntlets
		{ id=28220, skill={300,320,330,340} }, --Polar Gloves
		{ id=54007, skill={300,315,330,345} }, --Corehound Gloves
		{ id=36909, skill={300,300,300,300} }, --Essence Infused Leather Gloves 1.18
	},

	LeatherBelt = {
		{ name = L["Belt"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Belt"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Pants"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Pants"], icon = "INV_Misc_ArmorKit_17" },
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
		{ id=46653, skill={295,315,322,330} }, --Red Dragonscale Leggings
		{ id=19091, skill={300,320,330,340} }, --Runic Leather Pants
		{ name = L["Pants"], icon = "INV_Misc_ArmorKit_17" },
		{ id=24654, skill={300,320,330,340} }, --Blue Dragonscale Leggings
		{ id=19107, skill={300,320,330,340} }, --Black Dragonscale Leggings
		{ id=19097, skill={300,320,330,340} }, --Devilsaur Leggings
		{ id=57615, skill={300,315,322,330} }, --Ethereal Leggings
		{ id=57014, skill={300,320,330,340} }, --Flamewrath Leggings
		{ id=54015, skill={300,315,330,345} }, --Molten Leggings
		{ id=46659, skill={300,315,322,330} }, --Stormscale Leggings
		{ id=54013, skill={300,315,330,345} }, --Chromatic Leggings
		{ id=45477, skill={300,320,330,340} }, --Dreamhide Leggings
	},

	LeatherBoots = {
		{ name = L["Boots"], icon = "INV_Misc_ArmorKit_17" },
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
		{ name = L["Boots"], icon = "INV_Misc_ArmorKit_17" },
		{ id=19066, skill={275,295,305,315} }, --Frostsaber Boots
		{ id=23705, skill={290,310,320,330} }, --Dawn Treaders
		{ id=54001, skill={290,315,325,335} }, --Blue Dragonscale Boots
		{ id=46655, skill={295,300,315,330} }, --Red Dragonscale Boots
		{ id=20853, skill={295,315,325,335} }, --Corehound Boots
		{ id=28473, skill={300,320,330,340} }, --Bramblewood Boots
		{ id=22922, skill={300,320,330,340} }, --Mongoose Boots
		{ id=20855, skill={300,320,330,340} }, --Black Dragonscale Boots
		{ id=57018, skill={300,320,330,340} }, --Windwalker Boots
	},

	LeatherBags = {
		{ name = L["Bags"], icon = "INV_Misc_ArmorKit_17" },
		{ id=5244, skill={40,70,85,100} }, --Kodo Hide Bag
		{ id=9060, skill={30,60,75,90} }, --Light Leather Quiver
		{ id=9193, skill={150,170,180,190} }, --Heavy Quiver
		{ id=14930, skill={225,245,255,265} }, --Quickdraw Quiver
		{ id=9062, skill={30,60,75,90} }, --Small Leather Ammo Pouch
		{ id=9194, skill={150,170,180,190} }, --Heavy Leather Ammo Pouch
		{ id=14932, skill={225,245,255,265} }, --Thick Leather Ammo Pouch
	},

	LeatherMisc = {
		{ name = L["Misc"], icon = "INV_Misc_ArmorKit_17" },
		{ id=2881, skill={1,20,30,40} }, --Light Leather
		{ id=20648, skill={100,100,105,110} }, --Medium Leather
		{ id=20649, skill={150,150,155,160} }, --Heavy Leather
		{ id=20650, skill={200,200,202,205} }, --Thick Leather
		{ id=22331, skill={250,250,250,250} }, --Rugged Leather
		{},
		{ id=3816, skill={35,55,65,75} }, --Cured Light Hide
		{ id=3817, skill={100,115,122,130} }, --Cured Medium Hide
		{ id=3818, skill={150,160,165,170} }, --Cured Heavy Hide
		{ id=10482, skill={200,200,200,200} }, --Cured Thick Hide
		{ id=19047, skill={250,250,255,260} }, --Cured Rugged Hide
		{ id=45455, skill={300,320,330,340} }, --Dreamhide
		{},
		{ id=23190, skill={150,150,155,160} }, --Heavy Leather Ball
		{ name = L["Misc"], icon = "INV_Misc_ArmorKit_17" },
		{ id=2152, skill={1,30,45,60} }, --Light Armor Kit
		{ id=2165, skill={100,115,122,130} }, --Medium Armor Kit
		{ id=3780, skill={150,170,180,190} }, --Heavy Armor Kit
		{ id=55, skill={175,175,175,175} }, --Dragonmaw Armor Kit 1.18
		{ id=10487, skill={200,220,230,240} }, --Thick Armor Kit
		{ id=19058, skill={250,255,265,275} }, --Rugged Armor Kit
		{ id=22727, skill={300,320,330,340} }, --Core Armor Kit
		{ id=57115, skill={300,320,330,340} }, --Enchanted Armor Kit
	},

	TailoringApprentice = {
		{ name = L["Apprentice"], icon = "Trade_Tailoring" },
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
		{ name = L["Apprentice"], icon = "Trade_Tailoring" },
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
		{ name = L["Apprentice"], icon = "Trade_Tailoring" },
		{ id=12046, skill={75,100,117,135} }, --Simple Kilt
		{ id=2402, skill={75,100,117,135} }, --Woolen Cape
		{ id=45066, skill={75,150,167,185} }, --Gloves of Manathirst
	},
	TailoringJourneyman = {
		{ name = L["Journeyman"], icon = "Trade_Tailoring" },
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
		{ name = L["Journeyman"], icon = "Trade_Tailoring" },
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
		{ name = L["Journeyman"], icon = "Trade_Tailoring" },
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
		{ name = L["Expert"], icon = "Trade_Tailoring" },
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
		{ name = L["Expert"], icon = "Trade_Tailoring" },
		{ id=8772, skill={175,195,210,225} }, --Crimson Silk Belt
		{ id=8789, skill={180,200,215,230} }, --Crimson Silk Cloak
		{ id=8774, skill={180,200,215,230} }, --Green Silken Shoulders
		{ id=3863, skill={180,200,215,230} }, --Spider Belt
		{ id=83, skill={185,185,185,185} }, --Stormreaver Gloves 1.18
		{ id=3872, skill={185,195,200,205} }, --Rich Purple Silk Shirt
		{ id=8791, skill={185,205,215,225} }, --Crimson Silk Vest
		{ id=6695, skill={185,205,220,235} }, --Black Silk Pack
		{ id=3861, skill={185,205,220,235} }, --Long Silken Cloak
		{ id=21945, skill={190,200,205,210} }, --Green Holiday Shirt
		{ id=8795, skill={190,210,225,240} }, --Azure Shoulders
		{ id=8793, skill={190,210,225,240} }, --Crimson Silk Shoulders
		{ id=8770, skill={190,210,225,240} }, --Robe of Power
		{ id=8799, skill={195,215,225,235} }, --Crimson Silk Pantaloons
		{ name = L["Expert"], icon = "Trade_Tailoring" },
		{ id=8797, skill={195,215,230,245} }, --Earthen Silk Belt
		{ id=3873, skill={200,210,215,220} }, --Black Swashbuckler's Shirt
		{ id=3864, skill={200,220,235,250} }, --Star Belt
		{ id=3862, skill={200,220,235,250} }, --Icy Cloak
		{ id=46643, skill={200,200,200,200} }, --Augerer's Gloves
		{ id=46644, skill={200,200,200,200} }, --Augerer's Boots
		{ id=46639, skill={205,205,205,205} }, --Augerer's Hat
		{ id=46641, skill={205,205,205,205} }, --Augerer's Trousers
		{ id=46642, skill={205,205,205,205} }, --Augerer's Mantle
		{ id=12049, skill={205,220,235,250} }, --Black Mageweave Leggings
		{ id=12048, skill={205,220,235,250} }, --Black Mageweave Vest
		{ id=8802, skill={205,220,235,250} }, --Crimson Silk Robe
		{ id=46640, skill={210,210,210,210} }, --Augerer's Robe
		{ id=12050, skill={210,225,240,255} }, --Black Mageweave Robe
		{ name = L["Expert"], icon = "Trade_Tailoring" },
		{ id=8804, skill={210,225,240,255} }, --Crimson Silk Gloves
		{ id=12052, skill={210,225,240,255} }, --Shadoweave Pants
		{ id=12061, skill={215,220,225,230} }, --Orange Mageweave Shirt
		{ id=12059, skill={215,220,225,230} }, --White Bandit Mask
		{ id=12053, skill={215,230,245,260} }, --Black Mageweave Gloves
		{ id=12060, skill={215,230,245,260} }, --Red Mageweave Pants
		{ id=12056, skill={215,230,245,260} }, --Red Mageweave Vest
		{ id=12055, skill={215,230,245,260} }, --Shadoweave Robe
		{ id=12064, skill={220,225,230,235} }, --Orange Martial Shirt
		{ id=12062, skill={220,235,250,265} }, --Stormcloth Pants
		{ id=12063, skill={220,235,250,265} }, --Stormcloth Gloves
		{ id=12065, skill={225,240,255,270} }, --Mageweave Bag
		{ id=12069, skill={225,240,255,270} }, --Cindercloth Robe
		{ id=27658, skill={225,240,255,270} }, --Enchanted Mageweave Pouch
		{ name = L["Expert"], icon = "Trade_Tailoring" },
		{ id=12066, skill={225,240,255,270} }, --Red Mageweave Gloves
		{ id=12071, skill={225,240,255,270} }, --Shadoweave Gloves
		{ id=12067, skill={225,240,255,270} }, --Dreamweave Gloves
		{ id=12070, skill={225,240,255,270} }, --Dreamweave Vest
		{ id=46636, skill={225,235,240,245} }, --Diviner's Boots
		{ id=46637, skill={225,235,240,245} }, --Diviner's Mitts
		{ id=12068, skill={225,240,255,270} }, --Stormcloth Vest
	},
	TailoringArtisan = {
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
		{ id=46638, skill={230,240,245,250} }, --Diviner's Epaulets
		{ id=46633, skill={230,230,230,230} }, --Diviner's Pantaloons
		{ id=46635, skill={230,230,230,230} }, --Diviner's Cowl
		{ id=12075, skill={230,235,240,245} }, --Lavender Mageweave Shirt
		{ id=12073, skill={230,245,260,275} }, --Black Mageweave Boots
		{ id=12072, skill={230,245,260,275} }, --Black Mageweave Headband
		{ id=12074, skill={230,245,260,275} }, --Black Mageweave Shoulders
		{ id=46634, skill={235,235,235,235} }, --Diviner's Robes
		{ id=12080, skill={235,240,245,250} }, --Pink Mageweave Shirt
		{ id=12077, skill={235,240,245,250} }, --Simple Black Dress
		{ id=12079, skill={235,250,265,280} }, --Red Mageweave Bag
		{ id=12078, skill={235,250,265,280} }, --Red Mageweave Shoulders
		{ id=12076, skill={235,250,265,280} }, --Shadoweave Shoulders
		{ id=12083, skill={240,255,270,285} }, --Stormcloth Headband
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
		{ id=12087, skill={245,260,275,290} }, --Stormcloth Shoulders
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
		{ id=12090, skill={250,265,280,295} }, --Stormcloth Boots
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
		{ id=12092, skill={250,265,280,295} }, --Dreamweave Circlet
		{ id=18560, skill={250,290,305,320} }, --Mooncloth
		{ id=18404, skill={255,270,285,300} }, --Frostweave Robe
		{ id=18403, skill={255,270,285,300} }, --Frostweave Tunic
		{ id=18402, skill={255,270,285,300} }, --Runecloth Belt
		{ id=46649, skill={260,260,260,260} }, --Pillager's Shoes
		{ id=46648, skill={260,260,260,260} }, --Pillager's Grips
		{ id=18405, skill={260,275,290,305} }, --Runecloth Bag
		{ id=18408, skill={260,275,290,305} }, --Cindercloth Vest
		{ id=18406, skill={260,275,290,305} }, --Runecloth Robe
		{ id=18407, skill={260,275,290,305} }, --Runecloth Tunic
		{ id=26085, skill={260,275,290,305} }, --Soul Pouch
		{ id=46646, skill={265,265,265,265} }, --Pillager's Amice
		{ id=46650, skill={265,265,265,265} }, --Pillager's Pantaloons
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
		{ id=46645, skill={265,265,265,265} }, --Pillager's Hood
		{ id=18411, skill={265,280,295,310} }, --Frostweave Gloves
		{ id=18410, skill={265,280,295,310} }, --Ghostweave Belt
		{ id=18409, skill={265,280,295,310} }, --Runecloth Cloak
		{ id=46647, skill={270,270,270,270} }, --Pillager's Robe
		{ id=18415, skill={270,285,300,315} }, --Brightcloth Gloves
		{ id=18414, skill={270,285,300,315} }, --Brightcloth Robe
		{ id=18412, skill={270,285,300,315} }, --Cindercloth Gloves
		{ id=18413, skill={270,285,300,315} }, --Ghostweave Gloves
		{ id=22813, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ id=18420, skill={275,290,305,320} }, --Brightcloth Cloak
		{ id=27724, skill={275,290,305,320} }, --Cenarion Herb Bag
		{ id=18418, skill={275,290,305,320} }, --Cindercloth Cloak
		{ id=27659, skill={275,290,305,320} }, --Enchanted Runecloth Bag
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
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
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
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
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
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
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
		{ id=22902, skill={300,315,330,345} }, --Mooncloth Robe
		{ id=18448, skill={300,315,330,345} }, --Mooncloth Shoulders
		{ id=18447, skill={300,315,330,345} }, --Mooncloth Vest
		{ id=24902, skill={300,315,330,345} }, --Runed Stygian Belt
		{ id=24903, skill={300,315,330,345} }, --Runed Stygian Boots
		{ id=24901, skill={300,315,330,345} }, --Runed Stygian Leggings
		{ id=28481, skill={300,315,330,345} }, --Sylvan Crown
		{ id=28482, skill={300,315,330,345} }, --Sylvan Shoulders
		{ id=28480, skill={300,315,330,345} }, --Sylvan Vest
		{ id=57601, skill={300,315,322,330} }, --Cosmic Headdress
		{ id=57603, skill={300,315,322,330} }, --Cosmic Mantle
		{ id=57605, skill={300,315,322,330} }, --Cosmic Vest
		{ id=57607, skill={300,315,322,330} }, --Cosmic Leggings
		{ id=57633, skill={300,315,322,330} }, --Ley-Kissed Drape
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
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
		{ name = L["Artisan"], icon = "Trade_Tailoring" },
		{ id=18456, skill={300,315,330,345} }, --Truefaith Vestments
		{ id=46656, skill={300,300,315,330} }, --Robe of Sacrifice
		{ id=54011, skill={300,315,330,345} }, --Flarecore Boots
		{ id=45485, skill={300,315,330,345} }, --Gloves of Unwinding Mystery
		{ id=45457, skill={300,315,330,345} }, --Dreamthread Mantle
		{ id=45459, skill={300,315,330,345} }, --Dreamthread Kilt
		{ id=45461, skill={300,315,330,345} }, --Dreamthread Bracers
		{ id=45463, skill={300,315,330,345} }, --Dreamthread Gloves
		{ id=45453, skill={300,310,315,320} }, --Dreamthread
		{ id=36913, skill={300,300,300,300} }, --Astronomer Raiments 1.18
		{ id=36915, skill={300,300,300,300} }, --Spellwoven Nobility Drape 1.18

	},
	TailoringHelm = {
		{ name = L["Helm"], icon = "Trade_Tailoring" },
		{ id=8760, skill={145,155,160,165} }, --Azure Silk Hood
		{ id=3857, skill={165,185,200,215} }, --Enchanter's Cowl
		{ id=3858, skill={170,190,205,220} }, --Shadow Hood
		{ id=46639, skill={205,205,205,205} }, --Augerer's Hat
		{ id=12059, skill={215,220,225,230} }, --White Bandit Mask
		{ id=46635, skill={230,230,230,230} }, --Diviner's Cowl
		{ id=12072, skill={230,245,260,275} }, --Black Mageweave Headband
		{ id=12081, skill={240,255,270,285} }, --Admiral's Hat
		{ id=12083, skill={240,255,270,285} }, --Stormcloth Headband 1.18
		{ id=12086, skill={245,260,275,290} }, --Shadoweave Mask
		{ id=12092, skill={250,265,280,295} }, --Dreamweave Circlet
		{ id=46645, skill={265,265,265,265} }, --Pillager's Hood
		{ id=18442, skill={290,305,320,335} }, --Felcloth Hood
		{ id=18452, skill={300,315,330,345} }, --Mooncloth Circlet
		{ name = L["Helm"], icon = "Trade_Tailoring" },
		{ id=28481, skill={300,315,330,345} }, --Sylvan Crown
		{ id=57601, skill={300,315,322,330} }, --Cosmic Headdress
	},

	TailoringShoulders = {
		{ name = L["Shoulders"], icon = "Trade_Tailoring" },
		{ id=3848, skill={110,135,152,170} }, --Double-stitched Woolen Shoulders
		{ id=3849, skill={120,145,162,180} }, --Reinforced Woolen Shoulders
		{ id=8774, skill={180,200,215,230} }, --Green Silken Shoulders
		{ id=8795, skill={190,210,225,240} }, --Azure Shoulders
		{ id=8793, skill={190,210,225,240} }, --Crimson Silk Shoulders
		{ id=46642, skill={205,205,205,205} }, --Augerer's Mantle
		{ id=46638, skill={230,240,245,250} }, --Diviner's Epaulets
		{ id=12078, skill={235,250,265,280} }, --Red Mageweave Shoulders
		{ id=12076, skill={235,250,265,280} }, --Shadoweave Shoulders
		{ id=12087, skill={245,260,275,290} }, --Stormcloth Shoulders 1.18
		{ id=46646, skill={265,265,265,265} }, --Pillager's Amice
		{ id=18453, skill={300,315,330,345} }, --Felcloth Shoulders
		{ id=18449, skill={300,315,330,345} }, --Runecloth Shoulders
		{ id=23665, skill={300,315,330,345} }, --Argent Shoulders
		{ name = L["Shoulders"], icon = "Trade_Tailoring" },
		{ id=23663, skill={300,315,330,345} }, --Mantle of the Timbermaw
		{ id=18448, skill={300,315,330,345} }, --Mooncloth Shoulders
		{ id=28482, skill={300,315,330,345} }, --Sylvan Shoulders
		{ id=57603, skill={300,315,322,330} }, --Cosmic Mantle
		{ id=20848, skill={300,315,330,345} }, --Flarecore Mantle
		{ id=45457, skill={300,315,330,345} }, --Dreamthread Mantle
	},

	TailoringCloak = {
		{ name = L["Cloak"], icon = "Trade_Tailoring" },
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
		{ id=57633, skill={300,315,322,330} }, --Ley-Kissed Drape
		{ name = L["Cloak"], icon = "Trade_Tailoring" },
		{ id=22870, skill={300,315,330,345} }, --Cloak of Warding
		{ id=28208, skill={300,315,330,345} }, --Glacial Cloak
	},

	TailoringChest = {
		{ name = L["Chest"], icon = "Trade_Tailoring" },
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
		{ name = L["Chest"], icon = "Trade_Tailoring" },
		{ id=8770, skill={190,210,225,240} }, --Robe of Power
		{ id=12048, skill={205,220,235,250} }, --Black Mageweave Vest
		{ id=8802, skill={205,220,235,250} }, --Crimson Silk Robe
		{ id=46640, skill={210,210,210,210} }, --Augerer's Robe
		{ id=12050, skill={210,225,240,255} }, --Black Mageweave Robe
		{ id=12055, skill={215,230,245,260} }, --Shadoweave Robe
		{ id=12069, skill={225,240,255,270} }, --Cindercloth Robe
		{ id=12068, skill={225,240,255,270} }, --Stormcloth Vest 1.18
		{ id=12070, skill={225,240,255,270} }, --Dreamweave Vest
		{ id=46634, skill={235,235,235,235} }, --Diviner's Robes
		{ id=12077, skill={235,240,245,250} }, --Simple Black Dress
		{ id=12091, skill={250,255,260,265} }, --White Wedding Dress
		{ id=26403, skill={250,265,280,295} }, --Festival Dress
		{ id=26407, skill={250,265,280,295} }, --Festive Red Pant Suit
		{ name = L["Chest"], icon = "Trade_Tailoring" },
		{ id=18404, skill={255,270,285,300} }, --Frostweave Robe
		{ id=18403, skill={255,270,285,300} }, --Frostweave Tunic
		{ id=18408, skill={260,275,290,305} }, --Cindercloth Vest
		{ id=18406, skill={260,275,290,305} }, --Runecloth Robe
		{ id=18407, skill={260,275,290,305} }, --Runecloth Tunic
		{ id=46647, skill={270,270,270,270} }, --Pillager's Robe
		{ id=18414, skill={270,285,300,315} }, --Brightcloth Robe
		{ id=22813, skill={275,285,290,295} }, --Gordok Ogre Suit
		{ id=18436, skill={285,300,315,330} }, --Robe of Winter Night
		{ id=18451, skill={300,315,330,345} }, --Felcloth Robe
		{ id=18446, skill={300,315,330,345} }, --Wizardweave Robe
		{ id=24091, skill={300,315,330,345} }, --Bloodvine Vest
		{ id=22902, skill={300,315,330,345} }, --Mooncloth Robe
		{ id=18447, skill={300,315,330,345} }, --Mooncloth Vest
		{ name = L["Chest"], icon = "Trade_Tailoring" },
		{ id=28480, skill={300,315,330,345} }, --Sylvan Vest
		{ id=57605, skill={300,315,322,330} }, --Cosmic Vest
		{ id=23666, skill={300,315,330,345} }, --Flarecore Robe
		{ id=28207, skill={300,315,330,345} }, --Glacial Vest
		{ id=18457, skill={300,315,330,345} }, --Robe of the Archmage
		{ id=18458, skill={300,315,330,345} }, --Robe of the Void
		{ id=18456, skill={300,315,330,345} }, --Truefaith Vestments
		{ id=46656, skill={300,300,315,330} }, --Robe of Sacrifice
		{ id=36913, skill={300,300,300,300} }, --Astronomer Raiments 1.18
	},

	TailoringBracers = {
		{ name = L["Bracers"], icon = "Trade_Tailoring" },
		{ id=3841, skill={60,85,102,120} }, --Green Linen Bracers
		{ id=22759, skill={300,315,330,345} }, --Flarecore Wraps
		{ id=28209, skill={300,315,330,345} }, --Glacial Wrists
		{ id=45461, skill={300,315,330,345} }, --Dreamthread Bracers
	},

	TailoringGloves = {
		{ name = L["Gloves"], icon = "Trade_Tailoring" },
		{ id=3840, skill={35,60,77,95} }, --Heavy Linen Gloves
		{ id=45066, skill={75,150,167,185} }, --Gloves of Manathirst
		{ id=3843, skill={85,110,127,145} }, --Heavy Woolen Gloves
		{ id=3868, skill={125,150,167,185} }, --Phoenix Gloves
		{ id=3852, skill={130,150,165,180} }, --Gloves of Meditation
		{ id=3854, skill={145,165,180,195} }, --Azure Silk Gloves
		{ id=8780, skill={145,165,180,195} }, --Hands of Darkness
		{ id=8782, skill={150,170,185,200} }, --Truefaith Gloves
		{ id=83, skill={185,185,185,185} }, --Stormreaver Gloves 1.18
		{ id=46643, skill={200,200,200,200} }, --Augerer's Gloves
		{ id=8804, skill={210,225,240,255} }, --Crimson Silk Gloves
		{ id=12053, skill={215,230,245,260} }, --Black Mageweave Gloves
		{ id=12063, skill={220,235,250,265} }, --Stormcloth Gloves 1.18
		{ id=12066, skill={225,240,255,270} }, --Red Mageweave Gloves
		{ name = L["Gloves"], icon = "Trade_Tailoring" },
		{ id=12071, skill={225,240,255,270} }, --Shadoweave Gloves
		{ id=12067, skill={225,240,255,270} }, --Dreamweave Gloves
		{ id=46637, skill={225,235,240,245} }, --Diviner's Mitts
		{ id=46648, skill={260,260,260,260} }, --Pillager's Grips
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
		{ name = L["Gloves"], icon = "Trade_Tailoring" },
		{ id=28205, skill={300,315,330,345} }, --Glacial Gloves
		{ id=18454, skill={300,315,330,345} }, --Gloves of Spell Mastery
		{ id=45485, skill={300,315,330,345} }, --Gloves of Unwinding Mystery
		{ id=45463, skill={300,315,330,345} }, --Dreamthread Gloves
	},

	TailoringBelt = {
		{ name = L["Belt"], icon = "Trade_Tailoring" },
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
		{ name = L["Pants"], icon = "Trade_Tailoring" },
		{ id=12044, skill={1,35,47,60} }, --Simple Linen Pants
		{ id=3914, skill={30,55,72,90} }, --Brown Linen Pants
		{ id=3842, skill={70,95,112,130} }, --Handstitched Linen Britches
		{ id=12046, skill={75,100,117,135} }, --Simple Kilt
		{ id=3850, skill={110,135,152,170} }, --Heavy Woolen Pants
		{ id=12047, skill={120,145,162,180} }, --Colorful Kilt
		{ id=3851, skill={125,150,167,185} }, --Phoenix Pants
		{ id=8758, skill={140,160,175,190} }, --Azure Silk Pants
		{ id=8799, skill={195,215,225,235} }, --Crimson Silk Pantaloons
		{ id=46641, skill={205,205,205,205} }, --Augerer's Trousers
		{ id=12049, skill={205,220,235,250} }, --Black Mageweave Leggings
		{ id=12052, skill={210,225,240,255} }, --Shadoweave Pants
		{ id=12060, skill={215,230,245,260} }, --Red Mageweave Pants
		{ id=12062, skill={220,235,250,265} }, --Stormcloth Pants 1.18
		{ name = L["Pants"], icon = "Trade_Tailoring" },
		{ id=46633, skill={230,230,230,230} }, --Diviner's Pantaloons
		{ id=12089, skill={245,250,255,260} }, --Tuxedo Pants
		{ id=46650, skill={265,265,265,265} }, --Pillager's Pantaloons
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
		{ id=57607, skill={300,315,322,330} }, --Cosmic Leggings
		{ name = L["Pants"], icon = "Trade_Tailoring" },
		{ id=23667, skill={300,315,330,345} }, --Flarecore Leggings
		{ id=45459, skill={300,315,330,345} }, --Dreamthread Kilt
	},

	TailoringBoots = {
		{ name = L["Boots"], icon = "Trade_Tailoring" },
		{ id=12045, skill={20,50,67,85} }, --Simple Linen Boots
		{ id=2386, skill={65,90,107,125} }, --Linen Boots
		{ id=3845, skill={80,105,122,140} }, --Soft-soled Linen Boots
		{ id=3847, skill={95,120,137,155} }, --Red Woolen Boots
		{ id=2401, skill={95,120,137,155} }, --Woolen Boots
		{ id=3855, skill={125,150,167,185} }, --Spidersilk Boots
		{ id=3856, skill={140,160,175,190} }, --Spider Silk Slippers
		{ id=8778, skill={140,160,175,190} }, --Boots of Darkness
		{ id=3860, skill={175,195,210,225} }, --Boots of the Enchanter
		{ id=46644, skill={200,200,200,200} }, --Augerer's Boots
		{ id=46636, skill={225,235,240,245} }, --Diviner's Boots
		{ id=12073, skill={230,245,260,275} }, --Black Mageweave Boots
		{ id=12082, skill={240,255,270,285} }, --Shadoweave Boots
		{ id=12088, skill={245,260,275,290} }, --Cindercloth Boots
		{ name = L["Boots"], icon = "Trade_Tailoring" },
		{ id=12090, skill={250,265,280,295} }, --Stormcloth Boots 1.18
		{ id=46649, skill={260,260,260,260} }, --Pillager's Shoes
		{ id=18423, skill={280,295,310,325} }, --Runecloth Boots
		{ id=18437, skill={285,300,315,330} }, --Felcloth Boots
		{ id=19435, skill={290,295,310,325} }, --Mooncloth Boots
		{ id=23664, skill={290,305,320,335} }, --Argent Boots
		{ id=24093, skill={300,315,330,345} }, --Bloodvine Boots
		{ id=24903, skill={300,315,330,345} }, --Runed Stygian Boots
		{ id=54011, skill={300,315,330,345} }, --Flarecore Boots
	},

	TailoringBags = {
		{ name = L["Bags"], icon = "Trade_Tailoring" },
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
		{ name = L["Bags"], icon = "Trade_Tailoring" },
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
		{ name = L["Shirt"], icon = "Trade_Tailoring" },
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
		{ name = L["Shirt"], icon = "Trade_Tailoring" },
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
		{ name = L["Misc"], icon = "Trade_Tailoring" },
		{ id=2963, skill={1,25,37,50} }, --Bolt of Linen Cloth
		{ id=2964, skill={75,90,97,105} }, --Bolt of Woolen Cloth
		{ id=3839, skill={125,135,140,145} }, --Bolt of Silk Cloth
		{ id=3865, skill={175,180,182,185} }, --Bolt of Mageweave
		{ id=18401, skill={250,255,257,260} }, --Bolt of Runecloth
		{ id=18560, skill={250,290,305,320} }, --Mooncloth
		{ id=45453, skill={300,310,315,320} }, --Dreamthread
	},

	EngineeringApprentice = {
		{ name = L["Apprentice"], icon = "Trade_Engineering" },
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
		{ name = L["Apprentice"], icon = "Trade_Engineering" },
		{ id=3928, skill={75,105,120,135} }, --Mechanical Squirrel
	},

	EngineeringJourneyman = {
		{ name = L["Journeyman"], icon = "Trade_Engineering" },
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
		{ id=47027, skill={120,145,157,170} }, --Portable Wormhole Generator: Stormwind
		{ id=47028, skill={120,145,157,170} }, --Portable Wormhole Generator: Orgrimmar
		{ name = L["Journeyman"], icon = "Trade_Engineering" },
		{ id=3940, skill={120,145,157,170} }, --Shadow Goggles
		{ id=3947, skill={125,125,135,145} }, --Crafted Solid Shot
		{ id=3945, skill={125,125,135,145} }, --Heavy Blasting Powder
		{ id=41073, skill={125,140,147,155} }, --Jewelry Lens
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
		{ name = L["Journeyman"], icon = "Trade_Engineering" },
		{ id=3952, skill={140,165,177,190} }, --Minor Recombobulator
		{ id=3953, skill={145,145,170,195} }, --Bronze Framework
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
		{ name = L["Expert"], icon = "Trade_Engineering" },
		{ id=3957, skill={155,175,185,195} }, --Ice Deflector
		{ id=3958, skill={160,160,170,180} }, --Iron Strut
		{ id=3959, skill={160,180,190,200} }, --Discombobulator Ray
		{ id=9273, skill={165,165,180,200} }, --Goblin Jumper Cables
		{ id=3960, skill={165,185,195,205} }, --Portable Bronze Mortar
		{ id=3961, skill={170,170,190,210} }, --Gyrochronatom
		{ id=12585, skill={175,175,185,195} }, --Solid Blasting Powder
		{ id=12586, skill={175,175,185,195} }, --Solid Dynamite
		{ id=41077, skill={175,185,190,195} }, --Precision Jewelers Kit
		{ id=26420, skill={175,175,187,200} }, --Large Blue Rocket
		{ id=26421, skill={175,175,187,200} }, --Large Green Rocket
		{ id=26422, skill={175,175,187,200} }, --Large Red Rocket
		{ id=3963, skill={175,175,195,215} }, --Compact Harvest Reaper Kit
		{ id=12590, skill={175,175,195,215} }, --Gyromatic Micro-Adjustor
		{ name = L["Expert"], icon = "Trade_Engineering" },
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
		{ name = L["Expert"], icon = "Trade_Engineering" },
		{ id=3971, skill={200,220,230,240} }, --Gnomish Cloaking Device
		{ id=3969, skill={200,220,230,240} }, --Mechanical Dragonling
		{ id=12594, skill={205,225,235,245} }, --Fire Goggles
		{ id=12595, skill={205,225,235,245} }, --Mithril Blunderbuss
		{ id=12596, skill={210,210,230,250} }, --Hi-Impact Mithril Slugs
		{ id=12597, skill={210,230,240,250} }, --Deadly Scope
		{ id=12599, skill={215,215,235,255} }, --Mithril Casing
		{ id=12603, skill={215,215,235,255} }, --Mithril Frag Bomb
		{ id=12607, skill={220,240,250,260} }, --Catseye Ultra Goggles
		{ id=12614, skill={220,240,250,260} }, --Mithril Heavy-bore Rifle
		{ id=26423, skill={225,225,237,250} }, --Blue Rocket Cluster
		{ id=26424, skill={225,225,237,250} }, --Green Rocket Cluster
		{ id=26425, skill={225,225,237,250} }, --Red Rocket Cluster
		{ id=41075, skill={225,240,247,255} }, --Jewelry Scope
		{ name = L["Expert"], icon = "Trade_Engineering" },
		{ id=12722, skill={225,240,250,260} }, --Goblin Radio --1.18
		{ id=26442, skill={225,245,255,265} }, --Firework Launcher
		{ id=12616, skill={225,245,255,265} }, --Parachute Cloak
		{ id=12615, skill={225,245,255,265} }, --Spellpower Goggles Xtreme
	},

	EngineeringArtisan = {
		{ name = L["Artisan"], icon = "Trade_Engineering" },
		{ id=12617, skill={230,250,260,270} }, --Deepdive Helmet
		{ id=12618, skill={230,250,260,270} }, --Rose Colored Goggles
		{ id=12619, skill={235,235,255,275} }, --Hi-Explosive Bomb
		{ id=12620, skill={240,260,270,280} }, --Sniper Scope
		{ id=12621, skill={245,245,265,285} }, --Mithril Gyro-Shot
		{ id=12622, skill={245,265,275,285} }, --Green Lens
		{ id=19788, skill={250,250,255,260} }, --Dense Blasting Powder
		{ id=23070, skill={250,250,260,270} }, --Dense Dynamite
		{ id=23507, skill={250,250,260,270} }, --Snake Burst Firework
		{ id=46610, skill={250,260,270,280} }, --Battery-Powered Crowd Pummeler
		{ id=19567, skill={250,270,280,290} }, --Salt Shaker
		{ id=12624, skill={250,270,280,290} }, --Mithril Mechanical Dragonling
		{ id=26011, skill={250,320,330,340} }, --Tranquil Mechanical Yeti
		{ id=46608, skill={250,250,260,270} }, --Hypertech Battery Pack 1.18
		{ name = L["Artisan"], icon = "Trade_Engineering" },
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
		{ name = L["Artisan"], icon = "Trade_Engineering" },
		{ id=19795, skill={275,295,305,315} }, --Thorium Tube
		{ id=19796, skill={275,295,305,315} }, --Dark Iron Rifle
		{ id=19799, skill={285,305,315,325} }, --Dark Iron Bomb
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
		{ name = L["Artisan"], icon = "Trade_Engineering" },
		{ id=19833, skill={300,320,330,340} }, --Flawless Arcanite Rifle
		{ id=23082, skill={300,320,330,340} }, --Ultra-Flash Shadow Reflector
		{ id=22795, skill={300,320,330,340} }, --Core Marksman Rifle
		{ id=22797, skill={300,320,330,340} }, --Force Reactive Disk
		{ id=45481, skill={300,320,330,340} }, --Intricate Gyroscope Goggles
		{ id=52747, skill={300,300,300,300} }, --Voltage-Neutralizing Nature Reflector 1.18
		{ id=52749, skill={300,300,300,300} }, --Giga-Charged Arcane Reflector 1.18
	},

	Gnomish = {
		{ name = L["Gnomish Engineering"], icon = "Trade_Engineering" },
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
		{ name = L["Goblin Engineering"], icon = "Trade_Engineering" },
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
		{ name = L["Equipment"], icon = "Trade_Engineering" },
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
		{ name = L["Equipment"], icon = "Trade_Engineering" },
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
		{ name = L["Trinkets"], icon = "Trade_Engineering" },
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
		{ name = L["Trinkets"], icon = "Trade_Engineering" },
		{ id=12759, skill={240,260,270,280} }, --Gnomish Death Ray
		{ id=23489, skill={260,285,295,305} }, --Ultrasafe Transporter - Gadgetzan
		{ id=13240, skill={205,205,205,205} }, --The Mortar: Reloaded
		{ id=12716, skill={205,225,235,245} }, --Goblin Mortar
		{ id=12755, skill={230,230,250,270} }, --Goblin Bomb Dispenser
		{ id=12908, skill={240,260,270,280} }, --Goblin Dragon Gun
		{ id=23486, skill={260,285,295,305} }, --Dimensional Ripper - Everlook
		{ id=23078, skill={265,285,295,305} }, --Goblin Jumper Cables XL
		{ id=52747, skill={300,300,300,300} }, --Voltage-Neutralizing Nature Reflector 1.18
		{ id=52749, skill={300,300,300,300} }, --Giga-Charged Arcane Reflector 1.18
	},

	EngineeringExplosives = {
		{ name = L["Explosives"], icon = "Trade_Engineering" },
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
		{ name = L["Explosives"], icon = "Trade_Engineering" },
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
		{ name = L["Weapons"], icon = "Trade_Engineering" },
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
		{ name = L["Parts"], icon = "Trade_Engineering" },
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
		{ name = L["Parts"], icon = "Trade_Engineering" },
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
		{ name = L["Misc"], icon = "Trade_Engineering" },
		{ id=7430, skill={50,70,80,90} }, --Arclight Spanner
		{ id=41073, skill={125,140,147,155} }, --Jewelry Lens
		{ id=41077, skill={175,185,190,195} }, --Precision Jewelers Kit
		{ id=12590, skill={175,175,195,215} }, --Gyromatic Micro-Adjustor
		{ id=41075, skill={225,240,247,255} }, --Jewelry Scope
		{ id=3977, skill={60,90,105,120} }, --Crude Scope
		{ id=3978, skill={110,135,147,160} }, --Standard Scope
		{ id=12597, skill={210,230,240,250} }, --Deadly Scope
		{ id=12620, skill={240,260,270,280} }, --Sniper Scope
		{ id=22793, skill={300,320,330,340} }, --Biznicks 247x128 Accurascope
		{ id=3920, skill={1,30,45,60} }, --Crafted Light Shot
		{ id=3930, skill={75,85,90,95} }, --Crafted Heavy Shot
		{ id=3947, skill={125,125,135,145} }, --Crafted Solid Shot
		{ id=12621, skill={245,245,265,285} }, --Mithril Gyro-Shot
		{ name = L["Misc"], icon = "Trade_Engineering" },
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
		{ id=8334, skill={100,115,122,130} }, --Practice Lock
		{ id=3963, skill={175,175,195,215} }, --Compact Harvest Reaper Kit
		{ id=47027, skill={120,145,157,170} }, --Portable Wormhole Generator: Stormwind
		{ id=47028, skill={120,145,157,170} }, --Portable Wormhole Generator: Orgrimmar
		{ name = L["Misc"], icon = "Trade_Engineering" },
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
		{ id=26443, skill={275,295,305,315} }, --Firework Cluster Launcher
		{ id=12715, skill={205,205,205,205} }, --Goblin Rocket Fuel Recipe
		{ id=12895, skill={205,205,205,205} }, --Inlaid Mithril Cylinder Plans
		{ name = L["Misc"], icon = "Trade_Engineering" },
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
		{ name = L["Misc"], icon = "Trade_Engineering" },
		{ id=26427, skill={275,275,280,285} }, --Large Green Rocket Cluster
		{ id=26428, skill={275,275,280,285} }, --Large Red Rocket Cluster
		{ id=3928, skill={75,105,120,135} }, --Mechanical Squirrel
		{ id=26011, skill={250,320,330,340} }, --Tranquil Mechanical Yeti
		{ id=19793, skill={265,285,295,305} }, --Lifelike Mechanical Toad
		{ id=15633, skill={205,205,205,205} }, --Lil' Smoky
		{ id=15628, skill={205,205,205,205} }, --Pet Bombling
		{ id=12722, skill={225,240,250,260} }, --Goblin Radio 1.18
		{ id=46608, skill={250,250,260,270} }, --Hypertech Battery Pack 1.18
	},

	MiningTable = {
		{ name = LS["Mining"], icon = "Trade_Mining" },
		{ id=100000, skill={1,25,50,100}, container = {{2835,{1,2}},{5075,{1,3}},774,818,1210,2798} }, --Copper Vein, Rough Stone, Blood Shard, Rethban Ore, Malachite, Tigerseye, Shadowgem
		{ id=100001, skill={65,90,115,165} }, --Incendicite Mineral Vein
		{ id=100002, skill={65,90,115,165}, container = {{2836,{1,2}},{5075,{1,3}},1206,1210,1529,1705,2798} }, --Tin Vein, Coarse Stone, Blood Shard, Moss Agate, Shadowgem, Jade, Lesser Moonstone, Rethban Ore
		{ id=100003, skill={75,100,125,175}, container = {1206,1210,1705} }, --Silver Vein, Moss Agate, Shadowgem, Lesser Moonstone
		{ id=100004, skill={75,100,125,175}, container = {1206,1210,1705} }, --Ooze Covered Silver Vein, Moss Agate, Shadowgem, Lesser Moonstone
		{ id=100005, skill={75,100,125,175} }, --Lesser Bloodstone Deposit
		{ id=100006, skill={125,150,175,225}, container = {{2838,{1,3}},1529,1705,3864,7909} }, --Iron Deposit, Heavy Stone, Jade, Lesser Moonstone, Citrine, Aquamarine
		{ id=100007, skill={125,150,175,225}, container = {{2838,{1,3}},1529,1705,3864,7909} }, --Ooze Covered Iron Deposit, Heavy Stone, Jade, Lesser Moonstone, Citrine, Aquamarine
		{ id=100008, skill={150,175,200,250} }, --Indurium Mineral Vein
		{ id=100009, skill={155,175,205,255}, container = {11513,1529,3864,1705} }, --Gold Vein, Tainted Vitriol, Jade, Citrine, Lesser Moonstone
		{ id=100010, skill={155,175,205,255}, container = {11513,1529,3864,1705} }, --Ooze Covered Gold Vein, Tainted Vitriol, Jade, Citrine, Lesser Moonstone
		{},
		{},
		{},
		{ name = LS["Mining"], icon = "Trade_Mining" },
		{ id=100011, skill={175,200,225,275}, container = {{7912,{1,4}},11513,9262,3864,7909,7910} }, --Mithril Deposit, Solid Stone, Tainted Vitriol, Black Vitriol, Citrine, Aquamarine, Star Ruby
		{ id=100012, skill={175,200,225,275}, container = {{7912,{1,4}},11513,9262,3864,7909,7910} }, --Ooze Covered Mithril Deposit, Solid Stone, Tainted Vitriol, Black Vitriol, Citrine, Aquamarine, Star Ruby
		{ id=100013, skill={230,255,280,330}, container = {11513,7909,3864,7910} }, --Truesilver Deposit, Tainted Vitriol, Citrine, Aquamarine, Star Ruby
		{ id=100014, skill={230,255,280,330}, container = {11513,7909,3864,7910} }, --Ooze Covered Truesilver Deposit, Tainted Vitriol, Citrine, Aquamarine, Star Ruby
		{ id=100015, skill={230,255,280,330}, container = {9262,11382,11754,12363} }, --Dark Iron Deposit, Black Vitriol, Blood of the Mountain, Black Diamond, Arcane Crystal
		{ id=100016, skill={245,270,295,345}, container = {{12365,{1,3}},11513,9262,7910,12361,12364,12799,12800,12363} }, --Small Thorium Vein, Dense Stone, Tainted Vitriol, Black VItrliol, Star Ruby, Blue Sapphire, Huge Emerald, Large Opal, Azerothian Diamond, Arcane Crystal
		{ id=100017, skill={245,270,295,345}, container = {{12365,{1,3}},11513,9262,7910,12361,12364,12799,12800,12363} }, --Ooze Covered Thorium Vein, Dense Stone, Tainted Vitriol, Black VItrliol, Star Ruby, Blue Sapphire, Huge Emerald, Large Opal, Azerothian Diamond, Arcane Crystal
		{ id=100018, skill={275,300,325,365}, container = {{12365,{1,3}},7910,12361,12364,12799,12800,12363} }, --Rich Thorium Vein, Dense Stone, Tainted Vitriol, Black VItrliol, Star Ruby, Blue Sapphire, Huge Emerald, Large Opal, Azerothian Diamond, Arcane Crystal
		{ id=100019, skill={275,300,325,365}, container = {{12365,{1,3}},7910,12361,12364,12799,12800,12363} }, --Ooze Covered Rich Thorium Vein, Dense Stone, Tainted Vitriol, Black VItrliol, Star Ruby, Blue Sapphire, Huge Emerald, Large Opal, Azerothian Diamond, Arcane Crystal
		{ id=100020, skill={275,300,325,350}, container = {{12365,{1,3}},19774,7910,12361,12364,12799,12800,12363} }, --Hakkari Thorium Vein, Dense Stone, Souldarite, Tainted Vitriol, Black VItrliol, Star Ruby, Blue Sapphire, Huge Emerald, Large Opal, Azerothian Diamond, Arcane Crystal
		{ id=100021, skill={305,330,355,370}, container = {22203,7076,12363,12364,12800} }, --Small Obsidian Chunk, Large Obsidian Shard, Essence of Earth, Arcane Crystal, Huge Emerald, Azerothian Diamond
		{ id=100022, skill={305,330,355,370}, container = {{22202,{2,3}},7076,12363,12364,12800} }, --Large Obsidian Chunk, Small Obsidian Shard, Large Obsidian Shard, Essence of Earth, Arcane Crystal, Huge Emerald, Azerothian Diamond
		{ id=100023, skill={310,335,360,375}, container = {55250,1529,3864,7910,55251,12361,7909,12364,12799,12800,12363} }, --Gemstone Deposit, Imperial Topaz, Emberstone, Jade, Citrine, Star Ruby, Pure Moonstone, Blue Sapphire, Aquamarine, Huge Emerald, Large Opal, Azerothian Diamond, Arcane Crystal
	},

	Smelting = {
		{ name = LS["Smelting"], icon = "Spell_Fire_FlameBlades" },
		{ id=2657, skill={1,25,47,70}, container = {2770} }, --Smelt Copper
		{ id=3304, skill={50,50,62,75}, container = {2771} }, --Smelt Tin
		{ id=2659, skill={65,65,90,115}, container = {2840, 3576} }, --Smelt Bronze
		{ id=2658, skill={75,100,112,125}, container = {2775} }, --Smelt Silver
		{ id=3307, skill={125,130,135,140}, container = {2772} }, --Smelt Iron
		{ id=3308, skill={155,170,177,185}, container = {2776} }, --Smelt Gold
		{ id=3569, skill={165,165,165,165}, container = {3575, 3857} }, --Smelt Steel
		{ id=10097, skill={175,175,175,175}, container = {3858} }, --Smelt Mithril
		{ id=14891, skill={230,230,230,230}, container = {{11370, 8}} }, --Smelt Dark Iron
		{ id=10098, skill={230,230,230,230}, container = {7911} }, --Smelt Truesilver
		{ id=16153, skill={250,250,250,250}, container = {10620} }, --Smelt Thorium
		{ id=22967, skill={300,310,315,320}, container = {18562, {12360, 10}, 17010, {18567, 3}} }, --Smelt Elementium
		{ id=45451, skill={300,310,315,320}, container = {61198, 3859, 20381} }, --Smelt Dreamsteel
	},

	SkinningTable = {
		{ name = L["Apprentice"], icon = "INV_Misc_Pelt_Wolf_01" },
		{ id=2934, disc=L["Level: "].."1-16", quantity = {1,2}, container = {2318} }, --Ruined Leather Scraps
		{ id=2318, disc=L["Level: "].."1-28", quantity = {1,3} }, --Light Leather
		{ id=783, disc=L["Level: "].."1-28", quantity = {1,3} }, --Light Hide
		{ id=2319, disc=L["Level: "].."15-36", quantity = {1,3} }, --Medium Leather
		{ id=4232, disc=L["Level: "].."15-36", quantity = {1,3} }, --Medium Hide
		{},
		{ name = L["Journeyman"], icon = "INV_Misc_Pelt_Wolf_01" },
		{ id=4234, disc=L["Level: "].."25-46", quantity = {1,3} }, --Heavy Leather
		{ id=4235, disc=L["Level: "].."25-46", quantity = {1,3} }, --Heavy Hide
		{},
		{ name = L["Expert"], icon = "INV_Misc_Pelt_Wolf_01" },
		{ id=4304, disc=L["Level: "].."35-57", quantity = {1,3} }, --Thick Leather
		{ id=8169, disc=L["Level: "].."37-61", quantity = {1,3} }, --Thick Hide
		{},
		{ name = L["Artisan"], icon = "INV_Misc_Pelt_Wolf_01" },
		{ id=8170, disc=L["Level: "].."45-62", quantity = {1,6} }, --Rugged Leather
		{ id=8171, disc=L["Level: "].."47-63", quantity = {1,3} }, --Rugged Hide
		{ name = L["Scales"], icon = "INV_Misc_MonsterScales_02" },
		{ id=8154, disc=L["Level: "].."50-55", quantity = {1,2}, dropRate = 40 }, --Scorpid Scale
		{ id=15408, disc=L["Level: "].."52-60", quantity = {1,2}, dropRate = 30 }, --Heavy Scorpid Scale
		{ id=7392, disc=L["Level: "].."34-36 "..LZ["Swamp of Sorrows"], quantity = {1,2}, dropRate = 20 }, --Green Whelp Scale
		{ id=7287, disc=L["Level: "].."23-38", quantity = {1,2}, dropRate = 15 }, --Red Whelp Scale
		{ id=7286, disc=L["Level: "].."17-18 "..LZ["Redridge Mountains"], quantity = {1,2}, dropRate = 30 }, --Black Whelp Scale
		{ id=15412, disc=L["Level: "].."41-63", quantity = {1,2}, dropRate = 20 }, --Green Dragonscale
		{ id=15416, disc=L["Level: "].."50-63", quantity = {1,2}, dropRate = 20 }, --Black Dragonscale
		{ id=15415, disc=L["Level: "].."37-60", quantity = {1,2}, dropRate = 20 }, --Blue Dragonscale
		{ id=15414, disc=L["Level: "].."57-63", quantity = {1,2}, dropRate = 20 }, --Red Dragonscale
		{ id=8165, disc=L["Level: "].."41-63", quantity = {1,2}, dropRate = 10 }, --Worn Dragonscale
		{ id=20381, disc=L["Level: "].."62-63".." "..LZ["Emerald Sanctum"], quantity = {1,2}, dropRate = 55 }, --Dreamscale
		{},
		{ name = L["Special"], icon = "INV_Misc_Pelt_Wolf_01" },
		{ id=15417, disc=L["Level: "].."54-60 "..LZ["Un'goro Crater"], dropRate = 100 }, --Devilsaur Leather
		{ id=15419, disc=L["Level: "].."51-61 "..LZ["Winterspring"].."...", quantity = {1,2}, dropRate = 15 }, --Warbear Leather
		{ id=15423, disc=L["Level: "].."49-59 "..LZ["Winterspring"]..", "..LZ["Azshara"], quantity = {1,2}, dropRate = 29 }, --Chimera Leather
		{ id=17012, disc=L["Level: "].."62-63 "..LZ["Molten Core"], quantity = {1,4}, dropRate = 100 }, --Core Leather
		{ id=20498, disc=L["Level: "].."57-63 "..LZ["Silithus"], quantity = {1,3}, dropRate = 33 }, --Silithid Chitin
		{ id=20500, disc=L["Level: "].."57-62 "..LZ["Silithus"], dropRate = 7 }, --Light Silithid Carapace
		{ id=7428, disc=L["Level: "].."37-43 "..LZ["Stranglethorn Vale"].."...", quantity = {1,2}, dropRate = 15 }, --Shadowcat Hide
		{ id=15410, disc=L["Level: "].."63 "..LB["Onyxia"], quantity = {2,4}, dropRate = 100 }, --Scale of Onyxia
		{ id=12731, disc=L["Level: "].."63 "..LB["The Beast"], dropRate = 2 }, --Pristine Hide of the Beast
	},

	HerbalismTable = {
		{ name = L["Apprentice"], icon = "Trade_Herbalism" },
		{ id=2447, quantity = {1,4}, skill={1,25,50,100} }, --Peacebloom
		{ id=765, quantity = {1,3}, skill={1,25,50,100}, container = {5056} }, --Silverleaf, Root Sample
		{ id=2449, quantity = {1,3}, skill={15,40,65,115}, container = {5056} }, --Earthroot, Root Sample
		{ id=785, quantity = {1,3}, skill={50,75,100,150}, container = {{2452,{1,3}}, 5056} }, --Mageroyal, Swiftthistle, Root Sample
		{ id=2450, quantity = {1,3}, skill={70,95,120,170}, container = {{2452,{1,3}}, 5056} }, --Briarthorn, Swiftthistle, Root Sample
		{},
		{},
		{ name = L["Expert"], icon = "Trade_Herbalism" },
		{ id=3818, quantity = {1,3}, skill={160,190,210,260}, type="item" }, --Fadeleaf
		{ id=3821, quantity = {1,3}, skill={170,195,220,270} }, --Goldthorn
		{ id=3358, quantity = {1,3}, skill={185,210,235,285} }, --Khadgar's Whisker
		{ id=3819, quantity = {1,3}, skill={195,225,245,295} }, --Wintersbite
		{ id=4625, quantity = {1,3}, skill={205,235,255,305} }, --Firebloom
		{ id=8831, quantity = {1,3}, skill={210,240,260,310}, container = {{8153,{1,3}},{19726,{1,3}}} }, --Purple Lotus, Wildvine, Bloodvine
		{ name = L["Journeyman"], icon = "Trade_Herbalism" },
		{ id=3820, quantity = {1,3}, skill={85,115,135,185} }, --Stranglekelp
		{ id=2453, quantity = {1,3}, skill={100,130,150,200} }, --Bruiseweed
		{ id=3355, quantity = {1,3}, skill={115,145,165,215} }, --Wild Steelbloom
		{ id=3369, quantity = {1,3}, skill={120,150,170,220} }, --Grave Moss
		{ id=3356, quantity = {1,3}, skill={125,155,175,225} }, --Kingsblood
		{ id=3357, quantity = {1,3}, skill={150,175,200,250} }, --Liferoot
		{},
		{ name = L["Artisan"], icon = "Trade_Herbalism" },
		{ id=8838, quantity = {1,3}, skill={230,255,280,330}, container = {{11514,{1,3}},{19726,{1,3}}} }, --Sungrass, Fel Creep, Bloodvine
		{ id=8839, quantity = {1,3}, skill={235,260,285,335} }, --Blindweed
		{ id=8845, quantity = {1,3}, skill={245,270,295,345} }, --Ghost Mushroom
		{ id=8846, quantity = {1,3}, skill={250,275,300,350}, container = {{11514,{1,3}}} }, --Gromsblood, Fel Creep
		{ id=13464, quantity = {1,3}, skill={260,280,310,360}, container = {{11514,{1,3}},{19726,{1,3}}}, type="item" }, --Golden Sansam, Fel Creep, Bloodvine
		{ id=13463, quantity = {1,3}, skill={270,295,320,370}, container = {{11514,{1,3}},{19726,{1,3}},13468} }, --Dreamfoil, Fel Creep, Bloodvine, Black Lotus
		--Expert
		{ id=8836, quantity = {1,3}, skill={220,250,270,320}, container = {{11514,{1,3}},13466} }, --Arthas' Tears, Fel Creep, Plaguebloom
		{},
		{ name = L["Artisan"], icon = "Trade_Herbalism" },
		{ id=13465, quantity = {1,3}, skill={280,305,330,380}, container = {{11514,{1,3}},{19726,{1,3}},13468} }, --Mountain Silversage, Fel Creep, Bloodvine, Black Lotus
		{ id=13466, quantity = {1,3}, skill={285,310,335,385}, container = {{11514,{1,3}},13468} }, --Plaguebloom, Fel Creep, Black Lotus
		{ id=13467, quantity = {1,3}, skill={290,315,340,390}, container = {13468} }, --Icecap, Black Lotus
		{ id=13468, skill={300,345,375,400} }, --Black Lotus
	},

	CookingApprentice = {
		{ name = L["Apprentice"], icon = "INV_Misc_Food_15" },
		{ id=818, skill=0 }, --Basic Campfire skill=0 set coz same id for item
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
		{ name = L["Apprentice"], icon = "INV_Misc_Food_15" },
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
		{ name = L["Journeyman"], icon = "INV_Misc_Food_15" },
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
		{ name = L["Journeyman"], icon = "INV_Misc_Food_15" },
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
		{ name = L["Expert"], icon = "INV_Misc_Food_15" },
		{ id=58044, skill={175,175,175,175} }, --Ambersap Glazed Boar Ribs
		{ id=58046, skill={175,175,175,175} }, --Crawford Apple Tarte
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
		{ name = L["Expert"], icon = "INV_Misc_Food_15" },
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
		{ name = L["Artisan"], icon = "INV_Misc_Food_15" },
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
		{ id=57047, skill={300,300,307,315} }, --Danonzo's Tel'Abim Surprise
		{ id=57049, skill={300,300,307,315} }, --Danonzo's Tel'Abim Delight
		{ id=57051, skill={300,300,307,315} }, --Danonzo's Tel'Abim Medley
		{ id=46085, skill={300,325,345,365} }, --Gurubashi Gumbo
		{ name = L["Artisan"], icon = "INV_Misc_Food_15" },
		{ id=45625, skill={300,300,310,320} }, --Le Fishe Au Chocolat
		{ id=49551, skill={300,325,345,365} }, --Empowering Herbal Salad
	},

	FirstAidTable = {
		{ name = LS["First Aid"], icon = "Spell_Holy_SealOfSacrifice" },
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

	SurvivalTable = {
		{ name = L["Survival"], icon = "Trade_Survival" },
		{ id=46064, skill={1,30,45,60} }, --Dim Torch
		{ id=47101, skill={10,30,45,60} }, --Survivalist's Skinning Knife
		{ id=47103, skill={10,40,55,70} }, --Driftwood Fishing Pole
		{ id=46072, skill={50,100,125,150} }, --Traveler's Tent
		{ id=46074, skill={75,100,112,125} }, --Simple Woodern Planter
		{ id=46073, skill={75,125,150,175} }, --Fishing Boat
		{},
		{ id=46075, skill={90,90,90,90} }, --Iron Lantern
		{ id=46068, skill={100,150,175,200} }, --Cleaning Cloth
		{ id=46066, skill={120,150,162,175} }, --Murloc's Flippers
		{ id=46077, skill={120,120,135,150} }, --Repaired Electro-Lantern
		{},
		{},
		{},
		{ name = L["Gardening"], icon = "Trade_Survival" },
		{ id=51706, quantity = {4,10}, container = {{51710,{3,6}},{51713,{3,6}}} }, --Country Pumpkin Seeds, Plump Country Pumpkin
		{},
		{ id=51707, quantity = {4,10}, container = {{51711,{3,6}},{51714,{3,6}}} }, --Mountain Berry Bush Seeds, Sweet Mountain Berry
		{},
		{ id=51708, quantity = {4,10}, container = {{51712,{3,6}},{51718,{3,6}}} }, --Striped Melon Seeds, Juicy Watermelon, Sweet Watermelon
		{},
		{ id=51716, quantity = 20, disc = L["Vendor"], container = {{51717,{2,5}},{51720,{2,5}}} }, --Magic Mushroom Spores, Hardened Mushroom, Power Mushroom
	},

	JewelcraftingApprentice = {
		{ name = L["Apprentice"], icon = "INV_Jewelry_Necklace_01" },
		{ id=29728, skill={1,21,25,30} }, --Rough Gritted Paper
		{ id=29730, skill={1,21,30,40} }, --Rough Copper Ring
		{ id=29732, skill={1,21,33,45} }, --Copper Bangle
		{ id=41001, skill={15,35,45,55} }, --Bright Copper Ring
		{ id=41003, skill={20,40,47,55} }, --Malachite Ring
		{ id=41249, skill={25,25,45,65} }, --Bulky Copper Ring
		{ id=41005, skill={25,45,52,60} }, --Sturdy Copper Ring
		{ id=41031, skill={35,45,50,55}, container = { 774, 818, 1210, 81094 } }, --Rough Gemstone Cluster
		{ id=41007, skill={35,55,62,70} }, --Inlaid Copper Ring
		{ id=41009, skill={45,60,67,75} }, --Copper Staff
		{ id=41011, skill={50,70,75,80} }, --Encrusted Copper Bangle
		{ id=41013, skill={50,70,77,85} }, --Lesser Fortification Ring
		{ id=41015, skill={50,70,77,85} }, --Tigercrest Ring
		{ id=41231, skill={50,70,80,90} }, --Minor Trollblood Ring
		{ name = L["Apprentice"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Journeyman"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41335, skill={80,100,110,120} }, --Shining Copper Cuffs 1.18
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
		{ name = L["Journeyman"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Journeyman"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41067, skill={125,135,145,155} }, --Rough Silver Ring
		{ id=41065, skill={125,140,142,145}, container = { 1206, 1705, 55249 } }, --Coarse Gemstone Cluster
		{ id=41057, skill={125,145,155,165} }, --Agatestone Crown
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
		{ name = L["Journeyman"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41583, skill={140,160,170,180} }, --Farraki Ceremony Totem
		{ id=41728, skill={140,160,170,180} }, --Blackrock Ironclamps
		{ id=41570, skill={145,165,175,185} }, --Harpy Talon Ring
		{ id=41742, skill={145,165,175,185} }, --Venomspire Diadem
		{ id=41201, skill={150,150,155,160} }, --Heavy Gritted Paper
		{ id=41203, skill={150,150,152,155}, container = { 1529, 3864, 7909, 55250 } }, --Heavy Gemstone Cluster
		{ id=41627, skill={150,155,157,160} }, --Pristine Crystal Gemstone
		{ id=41607, skill={150,155,157,160} }, --Shimmering Aqua Gemstone
		{ id=41081, skill={150,165,170,175} }, --Rough Iron Ring
		{ id=41083, skill={150,165,170,175} }, --Rough Gold Ring
	},

	JewelcraftingExpert = {
		{ name = L["Expert"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Expert"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41219, skill={175,175,177,180} }, --Rough Mithril Ring
		{ id=41629, skill={175,180,182,185} }, --Gleaming Jade Gemstone
		{ id=41623, skill={175,180,182,185} }, --Pure Shining Moonstone
		{ id=41752, skill={175,190,197,205} }, --Obsidian Brooch
		{ id=41213, skill={175,195,202,210} }, --Goldenshade Quartz Crown
		{ id=41215, skill={175,195,202,210} }, --The Golden Goblet
		{ id=41217, skill={175,195,202,210} }, --Powerful Citrine Pendant
		{ id=41591, skill={180,200,210,220} }, -- Spectre Shade Ring 1.18
		{ id=93, skill={185,185,185,185} }, -- Refined Dwarven Necklace 1.18
		{ id=104, skill={185,185,185,185} }, -- Ancient Dwarven Gemstone 1.18
		{ id=41556, skill={180,200,210,220} }, --Delicate Mithril Amulet
		{ id=41221, skill={185,200,210,220} }, --Ironsun Citrine Ring
		{ id=41750, skill={185,200,207,215} }, --Facetted Moonstone Brooch
		{ id=41589, skill={185,205,215,225} }, --Crystal Earring
		{ id=41263, skill={190,190,210,230} }, --Ocean's Gaze
		{ name = L["Expert"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41223, skill={190,205,215,225} }, --Shimmering Gold Necklace
		{ id=41225, skill={190,205,215,225} }, --Ironbloom Ring
		{ id=41541, skill={190,210,220,230} }, --Dazzling Aquamarine Loop
		{ id=41579, skill={190,210,220,230} }, --Marine's Demise
		{ id=41285, skill={195,195,217,240} }, --Shimmering Moonstone Tablet
		{ id=41229, skill={200,200,205,210} }, --Solid Gritted Paper
		{ id=41233, skill={200,200,205,210} }, --Rough Truesilver Ring
		{ id=41237, skill={200,200,205,210}, container = { 7910, 55250, 55251 } }, --Solid Gemstone Cluster
		{ id=41603, skill={200,205,207,210} }, --Radiant Ember Gemstone
		{ id=41631, skill={200,205,205,205} }, --Illuminated Gemstone
		{ id=41738, skill={200,215,225,235} }, --Marine Root
		{ id=41227, skill={200,220,230,240} }, --Ornate Mithril Scepter
		{ id=41546, skill={200,220,230,240} }, --Alluring Citrine Choker
		{ id=41548, skill={200,220,230,240} }, --Elaborate Golden Bracelets
		{ name = L["Expert"], icon = "INV_Jewelry_Necklace_01" },
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
		{ id=41354, skill={210,280,290,300} }, --Skyfire Jewel 1.18
		{ id=41352, skill={210,235,245,255} }, --Opaline Illuminator
		{ id=41307, skill={1,235,245,255} }, --Gemkeeper's Folio
		{ id=41235, skill={215,215,225,235} }, --Aquamarine Pendant
		{ name = L["Expert"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41241, skill={215,235,245,255} }, --Royal Gemstone Staff
		{ id=41277, skill={220,220,240,260} }, --Starforge Amulet
		{ id=41243, skill={220,240,250,260} }, --Emberstone Idol
		{ id=41245, skill={220,240,250,260} }, --Runed Truesilver Ring
		{ id=41633, skill={225,225,227,230} }, --Burning Star Gemstone
		{ id=41085, skill={225,240,247,255} }, --Emberstone Studded Ring
		{ id=41281, skill={230,230,252,275} }, --Runebound Amulet
		{ id=41716, skill={230,260,270,280} }, --Crown of Elegance
		{ id=41784, skill={230,260,275,290} }, --Mana Binding Signet
		{ id=41305, skill={1,260,270,280} }, --Golden Scepter of Authority
		{ id=41635, skill={235,235,237,240} }, --Brilliant Opal Gemstone
		{ id=41770, skill={235,240,240,240}, container = { 12361, 12364, 12799, 12800, 12363 } }, --Dense Gemstone Cluster
		{ id=41087, skill={235,245,250,255} }, --Rough Thorium Ring
		{ id=41720, skill={240,260,275,290} }, --Regal Twilight Staff
		{ name = L["Expert"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41724, skill={245,245,265,285} }, --Ornament of Restraint
		{ id=41089, skill={245,265,275,285} }, --Mithril Blackstone Necklace
		{ id=41261, skill={250,250,270,290} }, --Sunburst Tiara
		{ id=41091, skill={250,260,265,270} }, --Dense Gritted Paper
		{ id=41714, skill={250,280,290,300} }, --Opal Guided Bangles
		{ id=41637, skill={1,250,252,255} }, --Elegant Emerald Gemstone
		{ id=41639, skill={1,250,252,255} }, --Shining Sapphire Gemstone
	},

	JewelcraftingArtisan = {
		{ name = L["Artisan"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Artisan"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Artisan"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41253, skill={300,320,330,340} }, --Emerald Monarch's Glow
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
		{ name = L["Artisan"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41317, skill={300,320,330,340} }, --Twilight Opal Cascade
		{ id=36905, skill={300,300,300,300} }, --Grandstaff of the Shen'dralar Elder 1.18
	},

	JewelcraftingGemology = {
		{ name = LS["Gemology"], icon = "INV_Misc_Gem_Variety_01" },
		{ id=104, skill={185,185,185,185} }, -- Ancient Dwarven Gemstone 1.18
		{ id=41605, skill={200,205,207,210} }, --Glowing Ruby Gemstone
		{ id=41601, skill={200,205,207,210} }, --Sharpened Citrine Gemstone
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
		{ name = LS["Goldsmithing"], icon = "INV_Jewelry_Ring_03" },
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
		{ name = LS["Goldsmithing"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41800, skill={300,330,340,350} }, --Rudeus' Focusing Cane
	},

	JewelcraftingGemstones = {
		{ name = L["Gemstones"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Gemstones"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Rings"], icon = "INV_Jewelry_Necklace_01" },
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
		{ id=41247, skill={65,85,92,100} }, --Small Pearl Ring
		{ id=41027, skill={70,90,95,100} }, --Topaz Studded Ring
		{ id=41560, skill={75,95,105,115} }, --Ebon Ring
		{ name = L["Rings"], icon = "INV_Jewelry_Necklace_01" },
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
		{ id=41591, skill={180,200,210,220} }, -- Spectre Shade Ring 1.18
		{ name = L["Rings"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41221, skill={185,200,210,220} }, --Ironsun Citrine Ring
		{ id=41589, skill={185,205,215,225} }, --Crystal Earring
		{ id=41263, skill={190,190,210,230} }, --Ocean's Gaze
		{ id=41225, skill={190,205,215,225} }, --Ironbloom Ring
		{ id=41541, skill={190,210,220,230} }, --Dazzling Aquamarine Loop
		{ id=41579, skill={190,210,220,230} }, --Marine's Demise
		{ id=41744, skill={200,220,230,240} }, --Bloodfire Circlet
		{ id=41554, skill={210,235,245,255} }, --Golden Jade Ring
		{ id=41354, skill={210,280,290,300} }, --Skyfire Jewel 1.18
		{ id=41085, skill={225,240,247,255} }, --Emberstone Studded Ring
		{ id=41784, skill={230,260,275,290} }, --Mana Binding Signet
		{ id=41093, skill={255,270,277,285} }, --Radiant Thorium Twilight
		{ id=41265, skill={260,260,275,290} }, --Starry Thorium Band
		{ id=41350, skill={260,280,290,300} }, --Cinderfall Band
		{ name = L["Rings"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Rings"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41269, skill={300,330,350,370} }, --Encrusted Gemstone Ring
	},

	JewelcraftingAmulets = {
		{ name = L["Amulets"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Amulets"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41556, skill={180,200,210,220} }, --Delicate Mithril Amulet
		{ id=93, skill={185,185,185,185} }, -- Refined Dwarven Necklace 1.18
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
		{ name = L["Amulets"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41722, skill={300,300,307,315} }, --Pendant of Instability
		{ id=41704, skill={300,320,330,340} }, --Talisman of Hinderance
	},

	JewelcraftingHelm = {
		{ name = L["Helm"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Bracers"], icon = "INV_Jewelry_Necklace_01" },
		{ id=29732, skill={1,21,33,45} }, --Copper Bangle
		{ id=41011, skill={50,70,75,80} }, --Encrusted Copper Bangle
		{ id=41335, skill={80,100,110,120} }, --Shining Copper Cuffs 1.18
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
		{ name = L["Bracers"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41348, skill={255,275,285,295} }, --Crystalfire Armlets
		{ id=41311, skill={1,270,280,290} }, --Stellar Gemguards
		{ id=41101, skill={280,285,297,310} }, --Crystalweft Bracers
		{ id=41804, skill={300,320,330,340} }, --Bindings of Luminance
		{ id=41778, skill={1,310,320,330} }, --Stormcloud Shackles
		{ id=41700, skill={300,320,330,340} }, --Embergem Cuffs
		{ id=41808, skill={300,325,332,340} }, --Mastercrafted Diamond Bangles
	},

	JewelcraftingOffHands = {
		{ name = L["Off Hand"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Off Hand"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41794, skill={285,320,330,340} }, --Orb of Clairvoyance
		{ id=41792, skill={300,330,340,350} }, --Empowered Domination Rod
	},

	JewelcraftingStaves = {
		{ name = L["Staves"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Staves"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41259, skill={300,320,330,340} }, --Arcanum Baton
		{ id=41802, skill={300,325,335,345} }, --Spire of Channeled Power
		{ id=41800, skill={300,330,340,350} }, --Rudeus' Focusing Cane
		{ id=36905, skill={300,300,300,300} }, --Grandstaff of the Shen'dralar Elder 1.18
	},

	JewelcraftingTrinkets = {
		{ name = L["Trinkets"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Misc"], icon = "INV_Jewelry_Necklace_01" },
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
		{ name = L["Misc"], icon = "INV_Jewelry_Necklace_01" },
		{ id=41031, skill={35,45,50,55}, container = { 774, 818, 1210, 81094 } }, --Rough Gemstone Cluster
		{ id=41065, skill={125,140,142,145}, container = { 1206, 1705, 55249 } }, --Coarse Gemstone Cluster
		{ id=41203, skill={150,150,152,155}, container = { 1529, 3864, 7909, 55250 } }, --Heavy Gemstone Cluster
		{ id=41237, skill={200,200,205,210}, container = { 7910, 55250, 55251 } }, --Solid Gemstone Cluster
		{ id=41770, skill={235,240,240,240}, container = { 12361, 12364, 12799, 12800, 12363 } }, --Dense Gemstone Cluster
	},
}

for k, v in pairs(craftingTable) do
	AtlasTWLoot_Data[k] = v
end