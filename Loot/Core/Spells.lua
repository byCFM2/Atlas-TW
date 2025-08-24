local L = AtlasTW.Local

AtlasTW.SpellDB = {
	enchants = {
		[44] = { name = "Enchant Bracer - Agility" }, --1.18
		[48] = { name = "Enchant Boots - Lesser Intellect" }, --1.18
		[7420] = { name = "Enchant Chest - Minor Health" },
 		[7421] = { item = 6218 },
		[7426] = {
			name = "Enchant Chest - Minor Absorption",
		},
		[7428] = {
			name = "Enchant Bracer - Minor Deflection",
		},
		[7443] = {
			name = "Enchant Chest - Minor Mana",
		},
		[7454] = {
			name = "Enchant Cloak - Minor Resistance",
		},
		[7457] = {
			name = "Enchant Bracer - Minor Stamina",
		},
		[7745] = {
			name = "Enchant 2H Weapon - Minor Impact",
		},
		[7748] = {
			name = "Enchant Chest - Lesser Health",
		},
		[7766] = {
			name = "Enchant Bracer - Minor Spirit",
		},
		[7771] = {
			name = "Enchant Cloak - Minor Protection",
		},
		[7776] = {
			name = "Enchant Chest - Lesser Mana",
		},
		[7779] = {
			name = "Enchant Bracer - Minor Agility",
		},
		[7782] = {
			name = "Enchant Bracer - Minor Strength",
		},
		[7786] = {
			name = "Enchant Weapon - Minor Beastslayer",
		},
		[7788] = {
			name = "Enchant Weapon - Minor Striking",
		},
		[7793] = {
			name = "Enchant 2H Weapon - Lesser Intellect",
		},
		[7795] = {
			item = 6339,
		},
		[7857] = {
			name = "Enchant Chest - Health",
		},
		[7859] = {
			name = "Enchant Bracer - Lesser Spirit",
		},
		[7861] = {
			name = "Enchant Cloak - Lesser Fire Resistance",
		},
		[7863] = {
			name = "Enchant Boots - Minor Stamina",
		},
		[7867] = {
			name = "Enchant Boots - Minor Agility",
		},
		[13378] = {
			name = "Enchant Shield - Minor Stamina",
		},
		[13380] = {
			name = "Enchant 2H Weapon - Lesser Spirit",
		},
		[13419] = {
			name = "Enchant Cloak - Minor Agility",
		},
		[13421] = {
			name = "Enchant Cloak - Lesser Protection",
		},
		[13464] = {
			name = "Enchant Shield - Lesser Protection",
		},
		[13485] = {
			name = "Enchant Shield - Lesser Spirit",
		},
		[13501] = {
			name = "Enchant Bracer - Lesser Stamina",
		},
		[13503] = {
			name = "Enchant Weapon - Lesser Striking",
		},
		[13522] = {
			name = "Enchant Cloak - Lesser Shadow Resistance",
		},
		[13529] = {
			name = "Enchant 2H Weapon - Lesser Impact",
		},
		[13536] = {
			name = "Enchant Bracer - Lesser Strength",
		},
		[13538] = {
			name = "Enchant Chest - Lesser Absorption",
		},
		[13607] = {
			name = "Enchant Chest - Mana",
		},
		[13612] = {
			name = "Enchant Gloves - Mining",
		},
		[13617] = {
			name = "Enchant Gloves - Herbalism",
		},
		[13620] = {
			name = "Enchant Gloves - Fishing",
		},
		[13622] = {
			name = "Enchant Bracer - Lesser Intellect",
		},
		[13626] = {
			name = "Enchant Chest - Minor Stats",
		},
		[13628] = {
			item = 11130,
		},
		[13631] = {
			name = "Enchant Shield - Lesser Stamina",
		},
		[13635] = {
			name = "Enchant Cloak - Defense",
		},
		[13637] = {
			name = "Enchant Boots - Lesser Agility",
		},
		[13640] = {
			name = "Enchant Chest - Greater Health",
		},
		[13642] = {
			name = "Enchant Bracer - Spirit",
		},
		[13644] = {
			name = "Enchant Boots - Lesser Stamina",
		},
		[13646] = {
			name = "Enchant Bracer - Lesser Deflection",
		},
		[13648] = {
			name = "Enchant Bracer - Stamina",
		},
		[13653] = {
			name = "Enchant Weapon - Lesser Beastslayer",
		},
		[13655] = {
			name = "Enchant Weapon - Lesser Elemental Slayer",
		},
		[13657] = {
			name = "Enchant Cloak - Fire Resistance",
		},
		[13659] = {
			name = "Enchant Shield - Spirit",
		},
		[13661] = {
			name = "Enchant Bracer - Strength",
		},
		[13663] = {
			name = "Enchant Chest - Greater Mana",
		},
		[13687] = {
			name = "Enchant Boots - Lesser Spirit",
		},
		[13689] = {
			name = "Enchant Shield - Lesser Block",
		},
		[13693] = {
			name = "Enchant Weapon - Striking",
		},
		[13695] = {
			name = "Enchant 2H Weapon - Impact",
		},
		[13698] = {
			name = "Enchant Gloves - Skinning",
		},
		[13700] = {
			name = "Enchant Chest - Lesser Stats",
		},
		[13702] = {
			item = 11145,
		},
		[13746] = {
			name = "Enchant Cloak - Greater Defense",
		},
		[13794] = {
			name = "Enchant Cloak - Resistance",
		},
		[13815] = {
			name = "Enchant Gloves - Agility",
		},
		[13817] = {
			name = "Enchant Shield - Stamina",
		},
		[13822] = {
			name = "Enchant Bracer - Intellect",
		},
		[13836] = {
			name = "Enchant Boots - Stamina",
		},
		[13841] = {
			name = "Enchant Gloves - Advanced Mining",
		},
		[13846] = {
			name = "Enchant Bracer - Greater Spirit",
		},
		[13858] = {
			name = "Enchant Chest - Superior Health",
		},
		[13868] = {
			name = "Enchant Gloves - Advanced Herbalism",
		},
		[13882] = {
			name = "Enchant Cloak - Lesser Agility",
		},
		[13887] = {
			name = "Enchant Gloves - Strength",
		},
		[13890] = {
			name = "Enchant Boots - Minor Speed",
		},
		[13898] = {
			name = "Enchant Weapon - Fiery Weapon",
		},
		[13905] = {
			name = "Enchant Shield - Greater Spirit",
		},
		[13915] = {
			name = "Enchant Weapon - Demonslaying",
		},
		[13917] = {
			name = "Enchant Chest - Superior Mana",
		},
		[13931] = {
			name = "Enchant Bracer - Deflection",
		},
		[13933] = {
			name = "Enchant Shield - Frost Resistance",
		},
		[13935] = {
			name = "Enchant Boots - Agility",
		},
		[13937] = {
			name = "Enchant 2H Weapon - Greater Impact",
		},
		[13939] = {
			name = "Enchant Bracer - Greater Strength",
		},
		[13941] = {
			name = "Enchant Chest - Stats",
		},
		[13943] = {
			name = "Enchant Weapon - Greater Striking",
		},
		[13945] = {
			name = "Enchant Bracer - Greater Stamina",
		},
		[13947] = {
			name = "Enchant Gloves - Riding Skill",
		},
		[13948] = {
			name = "Enchant Gloves - Minor Haste",
		},
		[14293] = {
			item = 11287,
		},
		[14807] = {
			item = 11288,
		},
		[14809] = {
			item = 11289,
		},
		[14810] = {
			item = 11290,
		},
		[15596] = {
			item = 11811,
		},
		[17180] = {
			item = 12655,
		},
		[17181] = {
			item = 12810,
		},
		[20008] = {
			name = "Enchant Bracer - Greater Intellect",
		},
		[20009] = {
			name = "Enchant Bracer - Superior Spirit",
		},
		[20010] = {
			name = "Enchant Bracer - Superior Strength",
		},
		[20011] = {
			name = "Enchant Bracer - Superior Stamina",
		},
		[20012] = {
			name = "Enchant Gloves - Greater Agility",
		},
		[20013] = {
			name = "Enchant Gloves - Greater Strength",
		},
		[20014] = {
			name = "Enchant Cloak - Greater Resistance",
		},
		[20015] = {
			name = "Enchant Cloak - Superior Defense",
		},
		[20016] = {
			name = "Enchant Shield - Superior Spirit",
		},
		[20017] = {
			name = "Enchant Shield - Greater Stamina",
		},
		[20020] = {
			name = "Enchant Boots - Greater Stamina",
		},
		[20023] = {
			name = "Enchant Boots - Greater Agility",
		},
		[20024] = {
			name = "Enchant Boots - Spirit",
		},
		[20025] = {
			name = "Enchant Chest - Greater Stats",
		},
		[20026] = {
			name = "Enchant Chest - Major Health",
		},
		[20028] = {
			name = "Enchant Chest - Major Mana",
		},
		[20029] = {
			name = "Enchant Weapon - Icy Chill",
		},
		[20030] = {
			name = "Enchant 2H Weapon - Superior Impact",
		},
		[20031] = {
			name = "Enchant Weapon - Superior Striking",
		},
		[20032] = {
			name = "Enchant Weapon - Lifestealing",
		},
		[20033] = {
			name = "Enchant Weapon - Unholy Weapon",
		},
		[20034] = {
			name = "Enchant Weapon - Crusader",
		},
		[20035] = {
			name = "Enchant 2H Weapon - Major Spirit",
		},
		[20036] = {
			name = "Enchant 2H Weapon - Major Intellect",
		},
		[20051] = {
			item = 16207,
		},
		[21931] = {
			name = "Enchant Weapon - Winter's Might",
		},
		[22749] = {
			name = "Enchant Weapon - Spell Power",
		},
		[22750] = {
			name = "Enchant Weapon - Healing Power",
		},
		[23799] = {
			name = "Enchant Weapon - Strength",
		},
		[23800] = {
			name = "Enchant Weapon - Agility",
		},
		[23801] = {
			name = "Enchant Bracer - Mana Regeneration",
		},
		[23802] = {
			name = "Enchant Bracer - Healing Power",
		},
		[23803] = {
			name = "Enchant Weapon - Mighty Spirit",
		},
		[23804] = {
			name = "Enchant Weapon - Mighty Intellect",
		},
		[25072] = {
			name = "Enchant Gloves - Threat",
		},
		[25073] = {
			name = "Enchant Gloves - Shadow Power",
		},
		[25074] = {
			name = "Enchant Gloves - Frost Power",
		},
		[25078] = {
			name = "Enchant Gloves - Fire Power",
		},
		[25079] = {
			name = "Enchant Gloves - Healing Power",
		},
		[25080] = {
			name = "Enchant Gloves - Superior Agility",
		},
		[25081] = {
			name = "Enchant Cloak - Greater Fire Resistance",
		},
		[25082] = {
			name = "Enchant Cloak - Greater Nature Resistance",
		},
		[25083] = {
			name = "Enchant Cloak - Stealth",
		},
		[25084] = {
			name = "Enchant Cloak - Subtlety",
		},
		[25086] = {
			name = "Enchant Cloak - Dodge",
		},
		[25124] = {
			item = 20744,
			extra = "|cffffffff5 "..L["Charges"],
		},
		[25125] = {
			item = 20745,
			extra = "|cffffffff5 "..L["Charges"],
		},
		[25126] = {
			item = 20746,
			extra = "|cffffffff5 "..L["Charges"],
		},
		[25127] = {
			item = 20747,
			extra = "|cffffffff5 "..L["Charges"],
		},
		[25128] = {
			item = 20750,
			extra = "|cffffffff5 "..L["Charges"],
		},
		[25129] = {
			item = 20749,
			extra = "|cffffffff5 "..L["Charges"],
		},
		[25130] = {
			item = 20748,
			extra = "|cffffffff5 "..L["Charges"],
		},
		[27837] = {
			name = "Enchant 2H Weapon - Agility",
		},
		[41758] = {
			item = 55248,
		},
		[45071] = {
			name = "Enchant 2H Weapon - Minor Intellect",
		},
		[46086] = {
			name = "Enchant Gloves - Major Strength",
		},
		[46601] = {
			name = "Enchant Gloves - Arcane Power",
		},
		[46602] = {
			name = "Enchant Gloves - Nature Power",
		},
		[46603] = {
			name = "Enchant Gloves - Holy Power",
		},
		[56543] = {
			name = "Enchant Boots - Major Intellect",
		},
		[57028] = {
			name = "Enchant Bracer - Spell Power",
		},
		[57030] = {
			name = "Enchant Bracer - Greater Agility",
		},
		[57117] = {
			name = "Enchant Cloak - Greater Arcane Resistance",
		},
		[57119] = {
			name = "Enchant Chest - Mighty Mana",
		},
		[57127] = {
			name = "Enchant Boots - Superior Stamina",
		},
		[57142] = {
			name = "Enchant Boots - Greater Spirit",
		},
		[57144] = {
			name = "Enchant Bracer - Greater Deflection",
		},
		[57146] = {
			name = "Enchant Bracer - Vampirism",
		},
		[57148] = {
			name = "Enchant Boots - Vampirism",
		},
		[57518] = {
			item = 61732,
		},
	},
	craftspells = {
		[37] = { --1.18
			item = 55043,
			reagents = {
				{15407, 6},
				{12810, 12},
				{7081, 20},
				{7082, 8},
				{5117, 15},
				{4480, 10},
				{14341, 4},
			},
		},
		[55] = { --1.18
			item = 65,
			reagents = {
				{7287, 5},
				{6371, 1},
				{2321, 2},
			},
		},
		[57] = { --1.18
			item = 131,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{3859, 8},
				{7071, 1},
				{7966, 1},
			},
		},
		[69] = { --1.18
			item = 66,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{3577, 8},
				{7071, 1},
				{3486, 2},
			},
		},
		[70] = { --1.18
			item = 58112,
			reagents = {
				{4234, 14},
				{7287, 4},
				{4236, 2},
				{5637, 2},
				{4402, 2},
				{55289, 2},
			},
		},
		[74] = { --1.18
			item = 67,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{12359, 4},
				{7071, 1},
				{8165, 14},
				{7966, 1},
			},
		},
		[83] = { --1.18
			item = 58134,
			reagents = {
				{4305, 8},
				{3824, 3},
				{7068, 3},
				{3864, 3},
				{4342, 1},
				{4291, 2},
			},
		},
		[85] = { --1.18
			item = 82,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{11371, 2},
				{7071, 1},
				{7078, 1},
				{12644, 2},
			},
		},
		[90] = { --1.18
			item = 151,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{6037, 8},
				{7071, 1},
				{7966, 2},
			},
		},
		[93] = { --1.18
			item = 156,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{3860, 12},
				{55249, 3},
				{6371, 3},
				{3466, 2},
				{55152, 2},
			},
		},
		[95] = { --1.18
			item = 87,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{12655, 2},
				{7071, 1},
				{61673, 2},
				{12644, 1},
			},
		},
		[102] = { --1.18
			item = 103,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{22203, 2},
				{7071, 1},
				{7076, 1},
				{7082, 1},
				{12644, 2},
			},
		},
		[104] = { --1.18
			item = 56112,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{3860, 1},
				{55249, 1},
				{55247, 1},
			},
		},
		[115] = { --1.18
			item = 56113,
			reagents = {
				{4625, 1},
				{7068, 1},
				{3372, 1},
			},
		},
		[818] = {
			name = "Basic Campfire",
			tools = {4471},
			icon = "Spell_Fire_Fire",
			text = "Builds a campfire that increases the spirits of those nearby by 4 and allows cooking.",
			reagents = {
				{4470},
			},
		},
		[2149] = {
			item = 2302,
			reagents = {
				{2318, 2},
				{2320},
			},
		},
		[2152] = {
			item = 2304,
			reagents = {
				{2318},
			},
		},
		[2153] = {
			item = 2303,
			reagents = {
				{2318, 4},
				{2320},
			},
		},
		[2158] = {
			item = 2307,
			reagents = {
				{2318, 7},
				{2320, 2},
			},
		},
		[2159] = {
			item = 2308,
			reagents = {
				{2318, 10},
				{2320, 2},
			},
		},
		[2160] = {
			item = 2300,
			reagents = {
				{2318, 8},
				{2320, 4},
			},
		},
		[2161] = {
			item = 2309,
			reagents = {
				{2318, 8},
				{2320, 5},
			},
		},
		[2162] = {
			item = 2310,
			reagents = {
				{2318, 5},
				{2320, 2},
			},
		},
		[2163] = {
			item = 2311,
			reagents = {
				{2318, 8},
				{2320, 2},
				{2324},
			},
		},
		[2164] = {
			item = 2312,
			reagents = {
				{4231},
				{2318, 4},
				{2320, 2},
			},
		},
		[2165] = {
			item = 2313,
			reagents = {
				{2319, 4},
				{2320},
			},
		},
		[2166] = {
			item = 2314,
			reagents = {
				{2319, 10},
				{4231, 2},
				{2321, 2},
			},
		},
		[2167] = {
			item = 2315,
			reagents = {
				{2319, 4},
				{2321, 2},
				{4340},
			},
		},
		[2168] = {
			item = 2316,
			reagents = {
				{2319, 8},
				{2321},
				{4340},
			},
		},
		[2169] = {
			item = 2317,
			reagents = {
				{2319, 6},
				{2321},
				{4340},
			},
		},
		[2329] = {
			item = 2454,
			reagents = {
				{2449},
				{765},
				{3371},
			},
		},
		[2330] = {
			item = 118,
			reagents = {
				{2447},
				{765},
				{3371},
			},
		},
		[2331] = {
			item = 2455,
			reagents = {
				{785},
				{765},
				{3371},
			},
		},
		[2332] = {
			item = 2456,
			reagents = {
				{785, 2},
				{2447},
				{3371},
			},
		},
		[2333] = {
			item = 3390,
			reagents = {
				{3355},
				{2452},
				{3372},
			},
		},
		[2334] = {
			item = 2458,
			reagents = {
				{2449, 2},
				{2447},
				{3371},
			},
		},
		[2335] = {
			item = 2459,
			reagents = {
				{2452},
				{2450},
				{3371},
			},
		},
		[2337] = {
			item = 858,
			reagents = {
				{118},
				{2450},
			},
		},
		[2385] = {
			item = 2568,
			reagents = {
				{2996},
				{2320},
			},
		},
		[2386] = {
			item = 2569,
			reagents = {
				{2996, 3},
				{2320},
				{2318},
			},
		},
		[2387] = {
			item = 2570,
			reagents = {
				{2996},
				{2320},
			},
		},
		[2389] = {
			item = 2572,
			reagents = {
				{2996, 3},
				{2320, 2},
				{2604, 2},
			},
		},
		[2392] = {
			item = 2575,
			reagents = {
				{2996, 2},
				{2320},
				{2604},
			},
		},
		[2393] = {
			item = 2576,
			reagents = {
				{2996},
				{2320},
				{2324},
			},
		},
		[2394] = {
			item = 2577,
			reagents = {
				{2996, 2},
				{2320},
				{6260},
			},
		},
		[2395] = {
			item = 2578,
			reagents = {
				{2996, 4},
				{2318},
				{2321},
			},
		},
		[2396] = {
			item = 2579,
			reagents = {
				{2996, 3},
				{2321},
				{2605},
			},
		},
		[2397] = {
			item = 2580,
			reagents = {
				{2996, 2},
				{2320, 3},
			},
		},
		[2399] = {
			item = 2582,
			reagents = {
				{2997, 2},
				{2321, 2},
				{2605},
			},
		},
		[2401] = {
			item = 2583,
			reagents = {
				{2997, 4},
				{2321, 2},
				{2318},
			},
		},
		[2402] = {
			item = 2584,
			reagents = {
				{2997},
				{2321},
			},
		},
		[2403] = {
			item = 2585,
			reagents = {
				{2997, 4},
				{2321, 3},
				{4340},
			},
		},
		[2406] = {
			item = 2587,
			reagents = {
				{2997, 2},
				{2321},
				{4340},
			},
		},
		[2538] = {
			requires = L["Cooking Fire"],
			item = 2679,
			reagents = {
				{2672},
			},
		},
		[2539] = {
			requires = L["Cooking Fire"],
			item = 2680,
			reagents = {
				{2672},
				{2678},
			},
		},
		[2540] = {
			requires = L["Cooking Fire"],
			item = 2681,
			reagents = {
				{769},
			},
		},
		[2541] = {
			requires = L["Cooking Fire"],
			item = 2684,
			reagents = {
				{2673},
			},
		},
		[2542] = {
			requires = L["Cooking Fire"],
			item = 724,
			reagents = {
				{723},
				{2678},
			},
		},
		[2543] = {
			requires = L["Cooking Fire"],
			item = 733,
			reagents = {
				{729},
				{730},
				{731},
			},
		},
		[2544] = {
			requires = L["Cooking Fire"],
			item = 2683,
			reagents = {
				{2674},
				{2678},
			},
		},
		[2545] = {
			requires = L["Cooking Fire"],
			item = 2682,
			reagents = {
				{2675},
				{2678},
			},
		},
		[2546] = {
			requires = L["Cooking Fire"],
			item = 2687,
			reagents = {
				{2677},
				{2678},
			},
		},
		[2547] = {
			requires = L["Cooking Fire"],
			item = 1082,
			reagents = {
				{1081},
				{1080},
			},
		},
		[2548] = {
			requires = L["Cooking Fire"],
			item = 2685,
			reagents = {
				{2677},
				{2692},
			},
		},
		[2549] = {
			requires = L["Cooking Fire"],
			item = 1017,
			quantity = 3,
			reagents = {
				{1015, 2},
				{2665},
			},
		},
		[2657] = {
			name = "Smelting: Smelt Copper",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of copper ore into a copper bar. Smelting copper requires a forge.",
			item = 2840,
			reagents = {
				{2770},
			},
		},
		[2658] = {
			name = "Smelting: Smelt Silver",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of silver ore into a silver bar. Smelting silver requires a forge.",
			item = 2842,
			reagents = {
				{2775},
			},
		},
		[2659] = {
			name = "Smelting: Smelt Bronze",
			requires = L["Forge"],
			text = "Allows the miner to smelt a tin bar and a copper bar together into two bronze bars. Smelting bronze requires a forge.",
			item = 2841,
			quantity = 2,
			reagents = {
				{2840},
				{3576},
			},
		},
		[2660] = {
			item = 2862,
			reagents = {
				{2835},
			},
		},
		[2661] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2851,
			reagents = {
				{2840, 6},
			},
		},
		[2662] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2852,
			reagents = {
				{2840, 4},
			},
		},
		[2663] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2853,
			reagents = {
				{2840, 2},
			},
		},
		[2664] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2854,
			reagents = {
				{2840, 10},
				{3470, 3},
			},
		},
		[2665] = {
			item = 2863,
			reagents = {
				{2836},
			},
		},
		[2666] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2857,
			reagents = {
				{2840, 10},
			},
		},
		[2667] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2864,
			reagents = {
				{2840, 12},
				{1210},
				{3470, 2},
			},
		},
		[2668] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2865,
			reagents = {
				{2841, 6},
			},
		},
		[2670] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2866,
			reagents = {
				{2841, 7},
			},
		},
		[2671] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2867,
			reagents = {
				{2841, 4},
			},
		},
		[2672] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2868,
			reagents = {
				{2841, 5},
				{3478, 2},
			},
		},
		[2673] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2869,
			reagents = {
				{2841, 10},
				{2842, 2},
				{3478, 2},
				{1705},
			},
		},
		[2674] = {
			item = 2871,
			reagents = {
				{2838},
			},
		},
		[2675] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2870,
			reagents = {
				{2841, 20},
				{1206, 2},
				{1705, 2},
				{5500, 2},
				{2842, 4},
			},
		},
		[2737] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2844,
			reagents = {
				{2840, 6},
				{2880},
				{2589, 2},
			},
		},
		[2738] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2845,
			reagents = {
				{2840, 6},
				{2880},
				{2589, 2},
			},
		},
		[2739] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2847,
			reagents = {
				{2840, 6},
				{2880},
				{2589, 2},
			},
		},
		[2740] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2848,
			reagents = {
				{2841, 6},
				{2880, 4},
				{2319},
			},
		},
		[2741] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2849,
			reagents = {
				{2841, 7},
				{2880, 4},
				{2319},
			},
		},
		[2742] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 2850,
			reagents = {
				{2841, 5},
				{2880, 4},
				{2319, 2},
			},
		},
		[2795] = {
			requires = L["Cooking Fire"],
			item = 2888,
			reagents = {
				{2886},
				{2894},
			},
		},
		[2835] = {
			item = 2892,
			reagents = {
				{5173},
				{3372},
			},
		},
		[2837] = {
			item = 2893,
			reagents = {
				{5173, 2},
				{3372},
			},
		},
		[2881] = {
			item = 2318,
			reagents = {
				{2934, 3},
			},
		},
		[2963] = {
			item = 2996,
			reagents = {
				{2589, 2},
			},
		},
		[2964] = {
			item = 2997,
			reagents = {
				{2592, 3},
			},
		},
		[3115] = {
			item = 3239,
			reagents = {
				{2835},
				{2589},
			},
		},
		[3116] = {
			item = 3240,
			reagents = {
				{2836},
				{2592},
			},
		},
		[3117] = {
			item = 3241,
			reagents = {
				{2838},
				{2592},
			},
		},
		[3170] = {
			item = 3382,
			reagents = {
				{2447},
				{2449, 2},
				{3371},
			},
		},
		[3171] = {
			item = 3383,
			reagents = {
				{785},
				{2450, 2},
				{3371},
			},
		},
		[3172] = {
			item = 3384,
			reagents = {
				{785, 3},
				{3355},
				{3371},
			},
		},
		[3173] = {
			item = 3385,
			reagents = {
				{785},
				{3820},
				{3371},
			},
		},
		[3174] = {
			item = 3386,
			reagents = {
				{1288},
				{2453},
				{3372},
			},
		},
		[3175] = {
			item = 3387,
			reagents = {
				{8839, 2},
				{8845},
				{8925},
			},
		},
		[3176] = {
			item = 3388,
			reagents = {
				{2453, 2},
				{2450, 2},
				{3372},
			},
		},
		[3177] = {
			item = 3389,
			reagents = {
				{3355},
				{3820},
				{3372},
			},
		},
		[3188] = {
			item = 3391,
			reagents = {
				{2449},
				{3356},
				{3372},
			},
		},
		[3230] = {
			item = 2457,
			reagents = {
				{2452},
				{765},
				{3371},
			},
		},
		[3275] = {
			item = 1251,
			reagents = {
				{2589},
			},
		},
		[3276] = {
			item = 2581,
			reagents = {
				{2589, 2},
			},
		},
		[3277] = {
			item = 3530,
			reagents = {
				{2592},
			},
		},
		[3278] = {
			item = 3531,
			reagents = {
				{2592, 2},
			},
		},
		[3292] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3487,
			reagents = {
				{2840, 14},
				{2880, 2},
				{818, 2},
				{2319, 2},
			},
		},
		[3293] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3488,
			reagents = {
				{2840, 12},
				{2880, 2},
				{774, 2},
				{3470, 2},
				{2318, 2},
			},
		},
		[3294] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3489,
			reagents = {
				{2840, 10},
				{2880, 2},
				{2842, 2},
				{3470, 2},
				{2318, 2},
			},
		},
		[3295] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3490,
			reagents = {
				{2841, 4},
				{3466},
				{2459},
				{1210, 2},
				{3478, 2},
				{2319, 2},
			},
		},
		[3296] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3491,
			reagents = {
				{2841, 8},
				{3466},
				{1206},
				{1210},
				{3478, 2},
				{2319, 2},
			},
		},
		[3297] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3492,
			reagents = {
				{3575, 6},
				{3466, 2},
				{3391},
				{1705, 2},
				{3478, 2},
				{2319, 2},
			},
		},
		[3304] = {
			name = "Smelting: Smelt Tin",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of tin ore into a tin bar. Smelting tin requires a forge.",
			item = 3576,
			reagents = {
				{2771},
			},
		},
		[3307] = {
			name = "Smelting: Smelt Iron",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of iron ore into an iron bar. Smelting iron requires a forge.",
			item = 3575,
			reagents = {
				{2772},
			},
		},
		[3308] = {
			name = "Smelting: Smelt Gold",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of gold ore into a gold bar. Smelting gold requires a forge.",
			item = 3577,
			reagents = {
				{2776},
			},
		},
		[3319] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3469,
			reagents = {
				{2840, 8},
			},
		},
		[3320] = {
			item = 3470,
			reagents = {
				{2835, 2},
			},
		},
		[3321] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3471,
			reagents = {
				{2840, 8},
				{774},
				{3470, 2},
			},
		},
		[3323] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3472,
			reagents = {
				{2840, 8},
				{3470, 2},
			},
		},
		[3324] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3473,
			reagents = {
				{2840, 8},
				{2321, 2},
				{3470, 3},
			},
		},
		[3325] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3474,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{2840, 8},
				{818},
				{774},
			},
		},
		[3326] = {
			item = 3478,
			reagents = {
				{2836, 2},
			},
		},
		[3328] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3480,
			reagents = {
				{2841, 5},
				{1210},
				{3478},
			},
		},
		[3330] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3481,
			reagents = {
				{2841, 8},
				{2842, 2},
				{3478, 2},
			},
		},
		[3331] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3482,
			reagents = {
				{2841, 6},
				{2842},
				{3478, 2},
			},
		},
		[3333] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3483,
			reagents = {
				{2841, 8},
				{2842},
				{3478, 2},
			},
		},
		[3334] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3484,
			reagents = {
				{3575, 4},
				{1705, 2},
				{3478, 2},
				{2605},
			},
		},
		[3336] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3485,
			reagents = {
				{3575, 4},
				{5498, 2},
				{3478, 2},
				{2605},
			},
		},
		[3337] = {
			item = 3486,
			reagents = {
				{2838, 3},
			},
		},
		[3370] = {
			requires = L["Cooking Fire"],
			item = 3662,
			reagents = {
				{2924},
				{2678},
			},
		},
		[3371] = {
			requires = L["Cooking Fire"],
			item = 3220,
			quantity = 2,
			reagents = {
				{3173},
				{3172},
				{3174},
			},
		},
		[3372] = {
			requires = L["Cooking Fire"],
			item = 3663,
			reagents = {
				{1468, 2},
				{2692},
			},
		},
		[3373] = {
			requires = L["Cooking Fire"],
			item = 3664,
			reagents = {
				{3667},
				{2692},
			},
		},
		[3376] = {
			requires = L["Cooking Fire"],
			item = 3665,
			reagents = {
				{3685},
				{2692},
			},
		},
		[3377] = {
			requires = L["Cooking Fire"],
			item = 3666,
			reagents = {
				{2251, 2},
				{2692},
			},
		},
		[3397] = {
			requires = L["Cooking Fire"],
			item = 3726,
			reagents = {
				{3730},
				{2692},
			},
		},
		[3398] = {
			requires = L["Cooking Fire"],
			item = 3727,
			reagents = {
				{3731},
				{2692},
			},
		},
		[3399] = {
			requires = L["Cooking Fire"],
			item = 3728,
			reagents = {
				{3731, 2},
				{3713},
			},
		},
		[3400] = {
			requires = L["Cooking Fire"],
			item = 3729,
			reagents = {
				{3712},
				{3713},
			},
		},
		[3420] = {
			item = 3775,
			reagents = {
				{2930},
				{3371},
			},
		},
		[3421] = {
			item = 3776,
			reagents = {
				{8923, 3},
				{8925},
			},
		},
		[3447] = {
			item = 929,
			reagents = {
				{2453},
				{2450},
				{3372},
			},
		},
		[3448] = {
			item = 3823,
			reagents = {
				{3818},
				{3355},
				{3372},
			},
		},
		[3449] = {
			item = 3824,
			reagents = {
				{3818, 4},
				{3369, 2},
				{3372},
			},
		},
		[3450] = {
			item = 3825,
			reagents = {
				{3355},
				{3821},
				{3372},
			},
		},
		[3451] = {
			item = 3826,
			reagents = {
				{3357},
				{2453},
				{3372},
			},
		},
		[3452] = {
			item = 3827,
			reagents = {
				{3820},
				{3356},
				{3372},
			},
		},
		[3453] = {
			item = 3828,
			reagents = {
				{3358},
				{3818},
				{3372},
			},
		},
		[3454] = {
			item = 3829,
			reagents = {
				{3358, 4},
				{3819, 2},
				{3372},
			},
		},
		[3491] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3848,
			reagents = {
				{2841, 6},
				{2880, 4},
				{3470, 2},
				{818},
				{2319},
			},
		},
		[3492] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3849,
			reagents = {
				{3575, 6},
				{3466, 2},
				{3486},
				{1705, 2},
				{4234, 3},
			},
		},
		[3493] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3850,
			reagents = {
				{3575, 8},
				{3466, 2},
				{3486, 2},
				{1529, 2},
				{4234, 3},
			},
		},
		[3494] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3851,
			reagents = {
				{3575, 8},
				{3466, 2},
				{3486},
				{2842, 4},
				{4234, 2},
			},
		},
		[3495] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3852,
			reagents = {
				{3575, 10},
				{3577, 4},
				{1705, 2},
				{3466, 2},
				{4234, 2},
				{3486, 2},
			},
		},
		[3496] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3853,
			reagents = {
				{3859, 8},
				{3466, 2},
				{3486, 2},
				{1705, 3},
				{4234, 3},
			},
		},
		[3497] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3854,
			reagents = {
				{3859, 8},
				{3466, 2},
				{3486, 2},
				{1529, 2},
				{3829},
				{4234, 4},
			},
		},
		[3498] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3855,
			reagents = {
				{3575, 14},
				{3466, 2},
				{3486, 2},
				{3577, 4},
				{4234, 2},
			},
		},
		[3500] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3856,
			reagents = {
				{3859, 10},
				{3466, 2},
				{3486, 3},
				{3864, 2},
				{3824},
				{4234, 3},
			},
		},
		[3501] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3835,
			reagents = {
				{3575, 6},
				{2605},
			},
		},
		[3502] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3836,
			reagents = {
				{3575, 12},
				{3864},
				{2605},
			},
		},
		[3503] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3837,
			reagents = {
				{3859, 8},
				{3577, 2},
				{3486, 2},
			},
		},
		[3504] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3840,
			reagents = {
				{3575, 7},
				{3486},
				{2605},
			},
		},
		[3505] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3841,
			reagents = {
				{3859, 6},
				{3577, 2},
				{3486},
			},
		},
		[3506] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3842,
			reagents = {
				{3575, 8},
				{3486},
				{2605},
			},
		},
		[3507] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3843,
			reagents = {
				{3575, 10},
				{3577, 2},
				{3486},
			},
		},
		[3508] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3844,
			reagents = {
				{3575, 20},
				{3486, 4},
				{1529, 2},
				{1206, 2},
				{4255},
			},
		},
		[3511] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3845,
			reagents = {
				{3859, 12},
				{3577, 2},
				{3486, 4},
				{1529, 2},
			},
		},
		[3513] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3846,
			reagents = {
				{3859, 8},
				{3864},
				{1705},
				{3486, 2},
			},
		},
		[3515] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 3847,
			reagents = {
				{3859, 10},
				{3577, 4},
				{3486, 4},
				{3864},
			},
		},
		[3569] = {
			name = "Smelting: Smelt Steel",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of iron ore and a lump of coal together into a steel bar. Smelting steel requires a forge.",
			item = 3859,
			reagents = {
				{3575},
				{3857},
			},
		},
		[3753] = {
			item = 4237,
			reagents = {
				{2318, 6},
				{2320},
			},
		},
		[3755] = {
			item = 4238,
			reagents = {
				{2996, 3},
				{2320, 3},
			},
		},
		[3756] = {
			item = 4239,
			reagents = {
				{2318, 3},
				{2320, 2},
			},
		},
		[3757] = {
			item = 4240,
			reagents = {
				{2997, 3},
				{2321},
			},
		},
		[3758] = {
			item = 4241,
			reagents = {
				{2997, 4},
				{2605},
				{2321},
			},
		},
		[3759] = {
			item = 4242,
			reagents = {
				{4231},
				{2318, 6},
				{2320, 2},
			},
		},
		[3760] = {
			item = 3719,
			reagents = {
				{4234, 5},
				{2321, 2},
			},
		},
		[3761] = {
			item = 4243,
			reagents = {
				{4231, 3},
				{2318, 6},
				{2320, 4},
			},
		},
		[3762] = {
			item = 4244,
			reagents = {
				{4243},
				{4231, 2},
				{2320, 2},
			},
		},
		[3763] = {
			item = 4246,
			reagents = {
				{2318, 6},
				{2320, 2},
			},
		},
		[3764] = {
			item = 4247,
			reagents = {
				{2319, 14},
				{2321, 4},
			},
		},
		[3765] = {
			item = 4248,
			reagents = {
				{2312},
				{4233},
				{2321},
				{4340},
			},
		},
		[3766] = {
			item = 4249,
			reagents = {
				{2312},
				{4233},
				{2321, 2},
				{4340},
			},
		},
		[3767] = {
			item = 4250,
			reagents = {
				{2319, 8},
				{3383},
				{2321, 2},
			},
		},
		[3768] = {
			item = 4251,
			reagents = {
				{4233},
				{2319, 4},
				{2321},
			},
		},
		[3769] = {
			item = 4252,
			reagents = {
				{2319, 12},
				{3390},
				{4340},
				{2321, 2},
			},
		},
		[3770] = {
			item = 4253,
			reagents = {
				{2319, 4},
				{4233, 2},
				{3389, 2},
				{3182, 2},
				{2321, 2},
			},
		},
		[3771] = {
			item = 4254,
			reagents = {
				{4234, 6},
				{5637, 2},
				{2321},
			},
		},
		[3772] = {
			item = 4255,
			reagents = {
				{4234, 9},
				{2605, 2},
				{2321, 4},
			},
		},
		[3773] = {
			item = 4256,
			reagents = {
				{4236, 2},
				{4234, 12},
				{3824},
				{2321},
			},
		},
		[3774] = {
			item = 4257,
			reagents = {
				{4236},
				{4234, 5},
				{2321},
				{2605},
				{7071},
			},
		},
		[3775] = {
			item = 4258,
			reagents = {
				{4236, 2},
				{4234, 4},
				{2321},
				{7071},
			},
		},
		[3776] = {
			item = 4259,
			reagents = {
				{4236, 2},
				{4234, 6},
				{2605},
				{2321},
			},
		},
		[3777] = {
			item = 4260,
			reagents = {
				{4234, 6},
				{4236, 2},
				{4291},
			},
		},
		[3778] = {
			item = 4262,
			reagents = {
				{4236, 4},
				{5500, 2},
				{1529, 2},
				{3864},
				{2321},
			},
		},
		[3779] = {
			item = 4264,
			reagents = {
				{4234, 6},
				{4236, 2},
				{4096, 2},
				{5633},
				{4291},
				{7071},
			},
		},
		[3780] = {
			item = 4265,
			reagents = {
				{4234, 5},
				{2321},
			},
		},
		[3813] = {
			item = 4245,
			reagents = {
				{4305, 3},
				{4234, 2},
				{2321, 3},
			},
		},
		[3816] = {
			item = 4231,
			reagents = {
				{783},
				{4289},
			},
		},
		[3817] = {
			item = 4233,
			reagents = {
				{4232},
				{4289},
			},
		},
		[3818] = {
			item = 4236,
			reagents = {
				{4235},
				{4289, 3},
			},
		},
		[3839] = {
			item = 4305,
			reagents = {
				{4306, 4},
			},
		},
		[3840] = {
			item = 4307,
			reagents = {
				{2996, 2},
				{2320},
			},
		},
		[3841] = {
			item = 4308,
			reagents = {
				{2996, 3},
				{2320, 2},
				{2605},
			},
		},
		[3842] = {
			item = 4309,
			reagents = {
				{2996, 4},
				{2321, 2},
			},
		},
		[3843] = {
			item = 4310,
			reagents = {
				{2997, 3},
				{2321},
			},
		},
		[3844] = {
			item = 4311,
			reagents = {
				{2997, 3},
				{2321, 2},
				{5498, 2},
			},
		},
		[3845] = {
			item = 4312,
			reagents = {
				{2996, 5},
				{2318, 2},
				{2321},
			},
		},
		[3847] = {
			item = 4313,
			reagents = {
				{2997, 3},
				{2318, 2},
				{2321},
				{2604},
			},
		},
		[3848] = {
			item = 4314,
			reagents = {
				{2997, 3},
				{2321, 2},
			},
		},
		[3849] = {
			item = 4315,
			reagents = {
				{2997, 6},
				{2319, 2},
				{2321, 2},
			},
		},
		[3850] = {
			item = 4316,
			reagents = {
				{2997, 5},
				{2321, 4},
			},
		},
		[3851] = {
			item = 4317,
			reagents = {
				{2997, 6},
				{5500},
				{2321, 3},
			},
		},
		[3852] = {
			item = 4318,
			reagents = {
				{2997, 4},
				{2321, 3},
				{3383},
			},
		},
		[3854] = {
			item = 4319,
			reagents = {
				{4305, 3},
				{4234, 2},
				{6260, 2},
				{2321, 2},
			},
		},
		[3855] = {
			item = 4320,
			reagents = {
				{4305, 2},
				{2319, 4},
				{3182, 4},
				{5500, 2},
			},
		},
		[3856] = {
			item = 4321,
			reagents = {
				{4305, 3},
				{3182},
				{2321, 2},
			},
		},
		[3857] = {
			item = 4322,
			reagents = {
				{4305, 3},
				{2321, 2},
				{4337, 2},
			},
		},
		[3858] = {
			item = 4323,
			reagents = {
				{4305, 4},
				{4291},
				{3824},
			},
		},
		[3859] = {
			item = 4324,
			reagents = {
				{4305, 5},
				{6260, 4},
			},
		},
		[3860] = {
			item = 4325,
			reagents = {
				{4305, 4},
				{4291},
				{4337, 2},
			},
		},
		[3861] = {
			item = 4326,
			reagents = {
				{4305, 4},
				{3827},
				{4291},
			},
		},
		[3862] = {
			item = 4327,
			reagents = {
				{4339, 3},
				{4291, 2},
				{3829},
				{4337, 2},
			},
		},
		[3863] = {
			item = 4328,
			reagents = {
				{4305, 4},
				{4337, 2},
				{7071},
			},
		},
		[3864] = {
			item = 4329,
			reagents = {
				{4339, 4},
				{4234, 4},
				{3864},
				{7071},
				{4291},
			},
		},
		[3865] = {
			item = 4339,
			reagents = {
				{4338, 5},
			},
		},
		[3866] = {
			item = 4330,
			reagents = {
				{2997, 3},
				{2604, 2},
				{2321},
			},
		},
		[3868] = {
			item = 4331,
			reagents = {
				{2997, 4},
				{5500},
				{2321, 4},
				{2324, 2},
			},
		},
		[3869] = {
			item = 4332,
			reagents = {
				{4305},
				{4341},
				{2321},
			},
		},
		[3870] = {
			item = 4333,
			reagents = {
				{4305, 2},
				{4340, 2},
				{2321},
			},
		},
		[3871] = {
			item = 4334,
			reagents = {
				{4305, 3},
				{2324, 2},
				{2321},
			},
		},
		[3872] = {
			item = 4335,
			reagents = {
				{4305, 4},
				{4342},
				{4291},
			},
		},
		[3873] = {
			item = 4336,
			reagents = {
				{4305, 5},
				{2325},
				{4291},
			},
		},
		[3914] = {
			item = 4343,
			reagents = {
				{2996, 2},
				{2320},
			},
		},
		[3915] = {
			item = 4344,
			reagents = {
				{2996},
				{2320},
			},
		},
		[3918] = {
			item = 4357,
			reagents = {
				{2835},
			},
		},
		[3919] = {
			item = 4358,
			quantity = 2,
			reagents = {
				{4357, 2},
				{2589},
			},
		},
		[3920] = {
			item = 8067,
			quantity = 200,
			reagents = {
				{4357},
				{2840},
			},
		},
		[3922] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4359,
			reagents = {
				{2840},
			},
		},
		[3923] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4360,
			quantity = 2,
			reagents = {
				{2840},
				{4359},
				{4357, 2},
				{2589},
			},
		},
		[3924] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4361,
			reagents = {
				{2840, 2},
				{2880},
			},
		},
		[3925] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4362,
			reagents = {
				{4361},
				{4359},
				{4399},
			},
		},
		[3926] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4363,
			reagents = {
				{4359, 2},
				{2840},
				{2589, 2},
			},
		},
		[3928] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4401,
			reagents = {
				{4363},
				{4359},
				{2840},
				{774, 2},
			},
		},
		[3929] = {
			item = 4364,
			reagents = {
				{2836},
			},
		},
		[3930] = {
			item = 8068,
			quantity = 200,
			reagents = {
				{4364},
				{2840},
			},
		},
		[3931] = {
			item = 4365,
			quantity = {1,3},
			reagents = {
				{4364, 3},
				{2589},
			},
		},
		[3932] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4366,
			reagents = {
				{4363},
				{4359, 2},
				{2841},
				{2592},
			},
		},
		[3933] = {
			item = 4367,
			reagents = {
				{4364, 2},
				{4363},
				{2318},
				{159},
			},
		},
		[3934] = {
			tools = {6219},
			item = 4368,
			reagents = {
				{2318, 6},
				{818, 2},
			},
		},
		[3936] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4369,
			reagents = {
				{4361, 2},
				{4359, 4},
				{4399},
				{2319, 2},
			},
		},
		[3937] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4370,
			quantity = {2,4},
			reagents = {
				{2840, 3},
				{4364, 4},
				{4404},
			},
		},
		[3938] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4371,
			reagents = {
				{2841, 2},
				{2880},
			},
		},
		[3939] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4372,
			reagents = {
				{4371, 2},
				{4359, 2},
				{4400},
				{1206, 3},
			},
		},
		[3940] = {
			item = 4373,
			reagents = {
				{2319, 4},
				{1210, 2},
			},
		},
		[3941] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4374,
			quantity = {1,3},
			reagents = {
				{4364, 4},
				{2841, 2},
				{4404},
				{2592},
			},
		},
		[3942] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4375,
			reagents = {
				{2841, 2},
				{2592},
			},
		},
		[3944] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4376,
			extra = "|cffffffff5 "..L["Charges"],
			reagents = {
				{4375},
				{4402},
			},
		},
		[3945] = {
			item = 4377,
			reagents = {
				{2838},
			},
		},
		[3946] = {
			item = 4378,
			quantity = {1,5},
			reagents = {
				{4377, 2},
				{2592},
			},
		},
		[3947] = {
			item = 8069,
			quantity = 200,
			reagents = {
				{4377},
				{2841},
			},
		},
		[3949] = {
			requires = L["Anvil"],
			item = 4379,
			reagents = {
				{4371, 2},
				{4375, 2},
				{4400},
				{2842, 3},
			},
		},
		[3950] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4380,
			quantity = {2,4},
			reagents = {
				{4377, 2},
				{2841, 3},
				{4404},
			},
		},
		[3952] = {
			item = 4381,
			extra = "|cffffffff10 "..L["Charges"],
			reagents = {
				{4371},
				{4375, 2},
				{2319, 2},
				{1206},
			},
		},
		[3953] = {
			item = 4382,
			reagents = {
				{2841, 2},
				{2319},
				{2592},
			},
		},
		[3954] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4383,
			reagents = {
				{4371, 3},
				{4375, 3},
				{4400},
				{1705, 2},
			},
		},
		[3955] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4384,
			reagents = {
				{4382},
				{4375},
				{4377, 2},
				{2592, 2},
			},
		},
		[3956] = {
			tools = {6219},
			item = 4385,
			reagents = {
				{2319, 4},
				{1206, 2},
				{4368},
			},
		},
		[3957] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4386,
			extra = "|cffffffff5 "..L["Charges"],
			reagents = {
				{4375},
				{3829},
			},
		},
		[3958] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4387,
			reagents = {
				{3575, 2},
			},
		},
		[3959] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4388,
			extra = "|cffffffff5 "..L["Charges"],
			reagents = {
				{4375, 3},
				{4306, 2},
				{1529},
				{4371},
			},
		},
		[3960] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4403,
			extra = "|cffffffff8 "..L["Charges"],
			reagents = {
				{4371, 4},
				{4387},
				{4377, 4},
				{2319, 4},
			},
		},
		[3961] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4389,
			reagents = {
				{3575},
				{10558},
			},
		},
		[3962] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 4390,
			quantity = {2,4},
			reagents = {
				{3575},
				{4377},
				{4306},
			},
		},
		[3963] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4391,
			reagents = {
				{4387, 2},
				{4382},
				{4389, 2},
				{4234, 4},
			},
		},
		[3965] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4392,
			reagents = {
				{4387},
				{4382},
				{4389},
				{4234, 4},
			},
		},
		[3966] = {
			tools = {6219, 10498},
			item = 4393,
			reagents = {
				{4234, 6},
				{3864, 2},
			},
		},
		[3967] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4394,
			quantity = 2,
			reagents = {
				{3575, 3},
				{4377, 3},
				{4404},
			},
		},
		[3968] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4395,
			reagents = {
				{4377, 3},
				{3575, 2},
				{4389},
			},
		},
		[3969] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4396,
			reagents = {
				{4382},
				{4387, 4},
				{4389, 4},
				{3864, 2},
				{7191},
			},
		},
		[3971] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 4397,
			reagents = {
				{4389, 4},
				{1529, 2},
				{1705, 2},
				{3864, 2},
				{7191},
			},
		},
		[3972] = {
			item = 4398,
			reagents = {
				{10505, 2},
				{4234, 2},
				{159},
			},
		},
		[3973] = {
			item = 4404,
			quantity = 5,
			reagents = {
				{2842},
			},
		},
		[3977] = {
			tools = {6219},
			item = 4405,
			reagents = {
				{4361},
				{774},
				{4359},
			},
		},
		[3978] = {
			tools = {6219},
			item = 4406,
			reagents = {
				{4371},
				{1206},
			},
		},
		[3979] = {
			tools = {6219, 10498},
			item = 4407,
			reagents = {
				{4371},
				{1529},
				{3864},
			},
		},
		[4094] = {
			requires = L["Cooking Fire"],
			item = 4457,
			reagents = {
				{3404},
				{2692},
			},
		},
		[4096] = {
			item = 4455,
			reagents = {
				{4461, 6},
				{4234, 4},
				{2321, 2},
			},
		},
		[4097] = {
			item = 4456,
			reagents = {
				{4461, 4},
				{4234, 4},
				{2321, 2},
			},
		},
		[4508] = {
			item = 4596,
			reagents = {
				{3164},
				{2447},
				{3371},
			},
		},
		[4942] = {
			item = 4623,
			reagents = {
				{3858},
				{3821},
				{3372},
			},
		},
		[5244] = {
			item = 5081,
			reagents = {
				{5082, 3},
				{2318, 4},
				{2320},
			},
		},
		[5763] = {
			item = 5237,
			reagents = {
				{2928},
				{2930},
				{3371},
			},
		},
		[6412] = {
			requires = L["Cooking Fire"],
			item = 5472,
			reagents = {
				{5465},
			},
		},
		[6413] = {
			requires = L["Cooking Fire"],
			item = 5473,
			reagents = {
				{5466},
			},
		},
		[6414] = {
			requires = L["Cooking Fire"],
			item = 5474,
			quantity = 2,
			reagents = {
				{5467},
				{2678},
			},
		},
		[6415] = {
			requires = L["Cooking Fire"],
			item = 5476,
			quantity = 2,
			reagents = {
				{5468},
				{2678},
			},
		},
		[6416] = {
			requires = L["Cooking Fire"],
			item = 5477,
			quantity = 2,
			reagents = {
				{5469},
				{4536},
			},
		},
		[6417] = {
			requires = L["Cooking Fire"],
			item = 5478,
			quantity = 2,
			reagents = {
				{5051},
			},
		},
		[6418] = {
			requires = L["Cooking Fire"],
			item = 5479,
			quantity = 2,
			reagents = {
				{5470},
				{2692},
			},
		},
		[6419] = {
			requires = L["Cooking Fire"],
			item = 5480,
			quantity = 2,
			reagents = {
				{5471},
				{2678, 4},
			},
		},
		[6458] = {
			item = 5507,
			reagents = {
				{4371, 2},
				{4375, 2},
				{4363},
				{1206},
			},
		},
		[6499] = {
			requires = L["Cooking Fire"],
			item = 5525,
			reagents = {
				{5503},
				{159},
			},
		},
		[6500] = {
			requires = L["Cooking Fire"],
			item = 5527,
			reagents = {
				{5504},
				{2692},
			},
		},
		[6501] = {
			requires = L["Cooking Fire"],
			item = 5526,
			reagents = {
				{5503},
				{1179},
				{2678},
			},
		},
		[6510] = {
			name = "Blinding Powder",
			text = "Create the reagent for the Blind ability.",
			item = 5530,
			quantity = 3,
			reagents = {
				{3818},
			},
		},
		[6517] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 5540,
			reagents = {
				{2841, 6},
				{3466},
				{5498, 2},
				{3478, 2},
			},
		},
		[6518] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 5541,
			reagents = {
				{2841, 10},
				{3466},
				{5500},
				{3478, 2},
				{2319, 2},
			},
		},
		[6521] = {
			item = 5542,
			reagents = {
				{2997, 3},
				{2321, 2},
				{5498},
			},
		},
		[6617] = {
			item = 5631,
			reagents = {
				{5635},
				{2450},
				{3371},
			},
		},
		[6618] = {
			item = 5633,
			reagents = {
				{5637},
				{3356},
				{3372},
			},
		},
		[6624] = {
			item = 5634,
			reagents = {
				{6370, 2},
				{3820},
				{3372},
			},
		},
		[6661] = {
			item = 5739,
			reagents = {
				{4234, 14},
				{2321, 2},
				{7071},
			},
		},
		[6686] = {
			item = 5762,
			reagents = {
				{2996, 4},
				{2321},
				{2604},
			},
		},
		[6688] = {
			item = 5763,
			reagents = {
				{2997, 4},
				{2604},
				{2321},
			},
		},
		[6690] = {
			item = 5766,
			reagents = {
				{4305, 2},
				{2321, 2},
				{3182, 2},
			},
		},
		[6692] = {
			item = 5770,
			reagents = {
				{4305, 4},
				{2321, 2},
				{3182, 2},
			},
		},
		[6693] = {
			item = 5764,
			reagents = {
				{4305, 4},
				{4234, 3},
				{2321, 3},
				{2605},
			},
		},
		[6695] = {
			item = 5765,
			reagents = {
				{4305, 5},
				{2325},
				{2321, 4},
			},
		},
		[6702] = {
			item = 5780,
			reagents = {
				{5784, 8},
				{2318, 6},
				{2321},
			},
		},
		[6703] = {
			item = 5781,
			reagents = {
				{5784, 12},
				{4231},
				{2318, 8},
				{2321},
			},
		},
		[6704] = {
			item = 5782,
			reagents = {
				{5785, 12},
				{4236},
				{4234, 10},
				{2321, 3},
			},
		},
		[6705] = {
			item = 5783,
			reagents = {
				{5785, 16},
				{4236},
				{4234, 14},
				{4291},
			},
		},
		[7126] = {
			item = 5957,
			reagents = {
				{2318, 3},
				{2320},
			},
		},
		[7133] = {
			item = 5958,
			reagents = {
				{2319, 8},
				{2997},
				{2321},
			},
		},
		[7135] = {
			item = 5961,
			reagents = {
				{2319, 12},
				{4340},
				{2321},
			},
		},
		[7147] = {
			item = 5962,
			reagents = {
				{4234, 12},
				{4305, 2},
				{2321, 2},
			},
		},
		[7149] = {
			item = 5963,
			reagents = {
				{4234, 10},
				{2321, 2},
				{1206},
			},
		},
		[7151] = {
			item = 5964,
			reagents = {
				{4234, 8},
				{4236},
				{2321, 2},
			},
		},
		[7153] = {
			item = 5965,
			reagents = {
				{4234, 14},
				{4305, 2},
				{4291, 2},
			},
		},
		[7156] = {
			item = 5966,
			reagents = {
				{4234, 4},
				{4236},
				{4291},
			},
		},
		[7179] = {
			item = 5996,
			reagents = {
				{3820},
				{6370, 2},
				{3371},
			},
		},
		[7181] = {
			item = 1710,
			reagents = {
				{3357},
				{3356},
				{3372},
			},
		},
		[7183] = {
			item = 5997,
			reagents = {
				{765, 2},
				{3371},
			},
		},
		[7213] = {
			requires = L["Cooking Fire"],
			item = 6038,
			reagents = {
				{4655},
				{2692},
			},
		},
		[7221] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6042,
			reagents = {
				{3575, 6},
				{3478, 4},
			},
		},
		[7222] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6043,
			reagents = {
				{3575, 4},
				{3478, 2},
				{1705},
			},
		},
		[7223] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6040,
			reagents = {
				{3859, 5},
				{3486, 2},
			},
		},
		[7224] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6041,
			reagents = {
				{3859, 8},
				{3486, 2},
				{4234, 4},
			},
		},
		[7255] = {
			item = 6051,
			reagents = {
				{2453},
				{2452},
				{3371},
			},
		},
		[7256] = {
			item = 6048,
			reagents = {
				{3369},
				{3356},
				{3372},
			},
		},
		[7257] = {
			item = 6049,
			reagents = {
				{4402},
				{6371},
				{3372},
			},
		},
		[7258] = {
			item = 6050,
			reagents = {
				{3819},
				{3821},
				{3372},
			},
		},
		[7259] = {
			item = 6052,
			reagents = {
				{3357},
				{3820},
				{3372},
			},
		},
		[7408] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6214,
			reagents = {
				{2840, 12},
				{2880, 2},
				{2318, 2},
			},
		},
		[7430] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6219,
			reagents = {
				{2840, 6},
			},
		},
		[7623] = {
			item = 6238,
			reagents = {
				{2996, 3},
				{2320},
			},
		},
		[7624] = {
			item = 6241,
			reagents = {
				{2996, 3},
				{2320},
				{2324},
			},
		},
		[7629] = {
			item = 6239,
			reagents = {
				{2996, 3},
				{2320},
				{2604},
			},
		},
		[7630] = {
			item = 6240,
			reagents = {
				{2996, 3},
				{2320},
				{6260},
			},
		},
		[7633] = {
			item = 6242,
			reagents = {
				{2996, 4},
				{2320, 2},
				{6260, 2},
			},
		},
		[7639] = {
			item = 6263,
			reagents = {
				{2997, 4},
				{2321, 2},
				{6260, 2},
			},
		},
		[7643] = {
			item = 6264,
			reagents = {
				{2997, 5},
				{2321, 3},
				{2604, 3},
			},
		},
		[7751] = {
			requires = L["Cooking Fire"],
			item = 6290,
			reagents = {
				{6291},
			},
		},
		[7752] = {
			requires = L["Cooking Fire"],
			item = 787,
			reagents = {
				{6303},
			},
		},
		[7753] = {
			requires = L["Cooking Fire"],
			item = 4592,
			reagents = {
				{6289},
			},
		},
		[7754] = {
			requires = L["Cooking Fire"],
			item = 6316,
			reagents = {
				{6317},
				{2678},
			},
		},
		[7755] = {
			requires = L["Cooking Fire"],
			item = 4593,
			reagents = {
				{6308},
			},
		},
		[7817] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6350,
			reagents = {
				{2841, 6},
				{3470, 6},
			},
		},
		[7818] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6338,
			reagents = {
				{2842},
				{3470, 2},
			},
		},
		[7827] = {
			requires = L["Cooking Fire"],
			item = 5095,
			reagents = {
				{6361},
			},
		},
		[7828] = {
			requires = L["Cooking Fire"],
			item = 4594,
			reagents = {
				{6362},
			},
		},
		[7836] = {
			item = 6370,
			reagents = {
				{6358, 2},
				{3371},
			},
		},
		[7837] = {
			item = 6371,
			reagents = {
				{6359, 2},
				{3371},
			},
		},
		[7841] = {
			item = 6372,
			reagents = {
				{2452},
				{6370},
				{3371},
			},
		},
		[7845] = {
			item = 6373,
			reagents = {
				{6371, 2},
				{3356},
				{3372},
			},
		},
		[7892] = {
			item = 6384,
			reagents = {
				{2997, 4},
				{6260, 2},
				{4340},
				{2321},
			},
		},
		[7893] = {
			item = 6385,
			reagents = {
				{2997, 4},
				{2605, 2},
				{4340},
				{2321},
			},
		},
		[7928] = {
			item = 6450,
			reagents = {
				{4306},
			},
		},
		[7929] = {
			item = 6451,
			reagents = {
				{4306, 2},
			},
		},
		[7934] = {
			item = 6452,
			quantity = 3,
			reagents = {
				{1475},
			},
		},
		[7935] = {
			item = 6453,
			quantity = 3,
			reagents = {
				{1288},
			},
		},
		[7953] = {
			item = 6466,
			reagents = {
				{6470, 8},
				{4231},
				{2321},
			},
		},
		[7954] = {
			item = 6467,
			reagents = {
				{6471, 2},
				{6470, 6},
				{2321, 2},
			},
		},
		[7955] = {
			item = 6468,
			reagents = {
				{6471, 10},
				{6470, 10},
				{2321, 2},
			},
		},
		[8238] = {
			requires = L["Cooking Fire"],
			item = 6657,
			reagents = {
				{6522},
				{2678},
			},
		},
		[8240] = {
			item = 6662,
			reagents = {
				{6522},
				{2449},
				{3371},
			},
		},
		[8243] = {
			item = 4852,
			reagents = {
				{4611},
				{4377},
				{4306},
			},
		},
		[8322] = {
			item = 6709,
			reagents = {
				{2318, 6},
				{4231},
				{2320, 4},
				{5498},
			},
		},
		[8334] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6712,
			reagents = {
				{2841},
				{4359, 2},
				{2880},
			},
		},
		[8339] = {
			item = 6714,
			quantity = {1,3},
			reagents = {
				{4364, 4},
				{2592},
			},
		},
		[8367] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 6731,
			reagents = {
				{2840, 16},
				{818, 2},
				{3470, 3},
			},
		},
		[8465] = {
			item = 6786,
			reagents = {
				{2996, 2},
				{2320},
				{6260},
				{2324},
			},
		},
		[8467] = {
			item = 6787,
			reagents = {
				{2997, 3},
				{2324, 4},
				{2321},
			},
		},
		[8483] = {
			item = 6795,
			reagents = {
				{4305, 3},
				{2324, 2},
				{4291},
			},
		},
		[8489] = {
			item = 6796,
			reagents = {
				{4305, 3},
				{2604, 2},
				{4291},
			},
		},
		[8604] = {
			requires = L["Cooking Fire"],
			item = 6888,
			reagents = {
				{6889},
				{2678},
			},
		},
		[8607] = {
			requires = L["Cooking Fire"],
			item = 6890,
			reagents = {
				{3173},
			},
		},
		[8681] = {
			item = 6947,
			reagents = {{2928},
						{3371},},
		},
		[8687] = {
			item = 6949,
			reagents = {
				{2928, 3},
				{3372},
			},
		},
		[8691] = {
			item = 6950,
			reagents = {
				{8924},
				{3372},
			},
		},
		[8694] = {
			item = 6951,
			reagents = {
				{2928, 4},
				{2930, 4},
				{3372},
			},
		},
		[8758] = {
			item = 7046,
			reagents = {
				{4305, 4},
				{6260, 2},
				{2321, 3},
			},
		},
		[8760] = {
			item = 7048,
			reagents = {
				{4305, 3},
				{3182},
				{2321, 2},
			},
		},
		[8762] = {
			item = 7050,
			reagents = {
				{4305, 3},
				{2321, 2},
			},
		},
		[8764] = {
			item = 7051,
			reagents = {
				{4305, 3},
				{7067},
				{2321, 2},
			},
		},
		[8766] = {
			item = 7052,
			reagents = {
				{4305, 4},
				{7070},
				{6260, 2},
				{2321, 2},
				{7071},
			},
		},
		[8768] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7071,
			quantity = 2,
			reagents = {
				{3575},
			},
		},
		[8770] = {
			item = 7054,
			reagents = {
				{4339, 2},
				{7067, 2},
				{7070, 2},
				{7068, 2},
				{7069, 2},
				{4291, 2},
			},
		},
		[8772] = {
			item = 7055,
			reagents = {
				{4305, 4},
				{7071},
				{2604, 2},
				{4291},
			},
		},
		[8774] = {
			item = 7057,
			reagents = {
				{4305, 5},
				{4291, 2},
			},
		},
		[8776] = {
			item = 7026,
			reagents = {
				{2996},
				{2320},
			},
		},
		[8778] = {
			item = 7027,
			reagents = {
				{4305, 3},
				{2319, 2},
				{6048},
				{2321, 2},
			},
		},
		[8780] = {
			item = 7047,
			reagents = {
				{4305, 3},
				{4234, 2},
				{6048, 2},
				{2321, 2},
			},
		},
		[8782] = {
			item = 7049,
			reagents = {
				{4305, 3},
				{4234, 2},
				{929, 4},
				{2321},
			},
		},
		[8784] = {
			item = 7065,
			reagents = {
				{4305, 5},
				{2605, 2},
				{4291},
			},
		},
		[8786] = {
			item = 7053,
			reagents = {
				{4305, 3},
				{6260, 2},
				{2321, 2},
			},
		},
		[8789] = {
			item = 7056,
			reagents = {
				{4305, 5},
				{2604, 2},
				{6371, 2},
				{4291},
			},
		},
		[8791] = {
			item = 7058,
			reagents = {
				{4305, 4},
				{2604, 2},
				{2321, 2},
			},
		},
		[8793] = {
			item = 7059,
			reagents = {
				{4305, 5},
				{6271, 2},
				{2604, 2},
				{4291, 2},
			},
		},
		[8795] = {
			item = 7060,
			reagents = {
				{4305, 6},
				{7072, 2},
				{6260, 2},
				{4291, 2},
			},
		},
		[8797] = {
			item = 7061,
			reagents = {
				{4305, 5},
				{7067, 4},
				{4234, 4},
				{7071},
				{4291, 2},
			},
		},
		[8799] = {
			item = 7062,
			reagents = {
				{4305, 4},
				{2604, 2},
				{4291, 2},
			},
		},
		[8802] = {
			item = 7063,
			reagents = {
				{4305, 8},
				{7068, 4},
				{3827, 2},
				{2604, 4},
				{4291},
			},
		},
		[8804] = {
			item = 7064,
			reagents = {
				{4305, 6},
				{7068, 2},
				{6371, 2},
				{4304, 2},
				{2604, 4},
				{4291, 2},
			},
		},
		[8880] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7166,
			reagents = {
				{2840, 6},
				{2880},
				{3470},
				{2318},
			},
		},
		[8895] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 7189,
			reagents = {
				{10026},
				{10559, 2},
				{4234, 4},
				{9061, 2},
				{10560},
			},
		},
		[9058] = {
			item = 7276,
			reagents = {
				{2318, 2},
				{2320},
			},
		},
		[9059] = {
			item = 7277,
			reagents = {
				{2318, 2},
				{2320, 3},
			},
		},
		[9060] = {
			item = 7278,
			reagents = {
				{2318, 4},
				{2320, 2},
			},
		},
		[9062] = {
			item = 7279,
			reagents = {
				{2318, 3},
				{2320, 4},
			},
		},
		[9064] = {
			item = 7280,
			reagents = {
				{2318, 5},
				{2320, 5},
			},
		},
		[9065] = {
			item = 7281,
			reagents = {
				{2318, 6},
				{2320, 4},
			},
		},
		[9068] = {
			item = 7282,
			reagents = {
				{2318, 10},
				{4231},
				{2321},
			},
		},
		[9070] = {
			item = 7283,
			reagents = {
				{7286, 12},
				{2319, 4},
				{2321},
			},
		},
		[9072] = {
			item = 7284,
			reagents = {
				{7287, 6},
				{2319, 4},
				{2321},
			},
		},
		[9074] = {
			item = 7285,
			reagents = {
				{2357},
				{2319, 6},
				{2321},
			},
		},
		[9145] = {
			item = 7348,
			reagents = {
				{2319, 8},
				{5116, 4},
				{2321, 2},
			},
		},
		[9146] = {
			item = 7349,
			reagents = {
				{2319, 8},
				{3356, 4},
				{2321, 2},
			},
		},
		[9147] = {
			item = 7352,
			reagents = {
				{2319, 6},
				{7067},
				{2321, 2},
			},
		},
		[9148] = {
			item = 7358,
			reagents = {
				{2319, 10},
				{5373, 2},
				{2321, 2},
			},
		},
		[9149] = {
			item = 7359,
			reagents = {
				{2319, 12},
				{7067, 2},
				{2997, 2},
				{2321, 2},
			},
		},
		[9193] = {
			item = 7371,
			reagents = {
				{4234, 8},
				{2321, 2},
			},
		},
		[9194] = {
			item = 7372,
			reagents = {
				{4234, 8},
				{2321, 2},
			},
		},
		[9195] = {
			item = 7373,
			reagents = {
				{4234, 10},
				{2325},
				{2321, 2},
			},
		},
		[9196] = {
			item = 7374,
			reagents = {
				{4234, 10},
				{3824},
				{2321, 2},
			},
		},
		[9197] = {
			item = 7375,
			reagents = {
				{7392, 4},
				{4234, 10},
				{2321, 2},
			},
		},
		[9198] = {
			item = 7377,
			reagents = {
				{4236, 2},
				{4234, 12},
				{3824},
				{2321},
			},
		},
		[9201] = {
			item = 7378,
			reagents = {
				{4234, 16},
				{2325},
				{4291, 2},
			},
		},
		[9202] = {
			item = 7386,
			reagents = {
				{7392, 6},
				{4234, 8},
				{4291, 2},
			},
		},
		[9206] = {
			item = 7387,
			reagents = {
				{4234, 10},
				{4305, 2},
				{2325, 2},
				{7071},
			},
		},
		[9207] = {
			item = 7390,
			reagents = {
				{4234, 8},
				{7428, 2},
				{3824},
				{4291, 2},
			},
		},
		[9208] = {
			item = 7391,
			reagents = {
				{4234, 10},
				{2359, 2},
				{4337, 2},
				{4291},
			},
		},
		[9269] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 7506,
			reagents = {
				{2841, 6},
				{4375},
				{814, 2},
				{818},
				{774},
			},
		},
		[9271] = {
			item = 6533,
			quantity = 3,
			reagents = {
				{2841, 2},
				{6530},
				{4364},
			},
		},
		[9273] = {
			item = 7148,
			reagents = {
				{3575, 6},
				{4375, 2},
				{814, 2},
				{4306, 2},
				{1210, 2},
				{7191},
			},
		},
		[9513] = {
			requires = L["Cooking Fire"],
			item = 7676,
			reagents = {
				{2452},
				{159},
			},
		},
		[9811] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7913,
			reagents = {
				{3575, 8},
				{5635, 4},
				{1210, 2},
				{3486, 2},
			},
		},
		[9813] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7914,
			reagents = {
				{3575, 20},
				{3486, 4},
			},
		},
		[9814] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7915,
			reagents = {
				{3575, 10},
				{5637, 2},
				{5635, 2},
			},
		},
		[9818] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7916,
			reagents = {
				{3575, 12},
				{5637, 4},
				{818, 4},
				{3486, 2},
			},
		},
		[9820] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7917,
			reagents = {
				{3575, 14},
				{3486, 3},
				{5637, 2},
			},
		},
		[9916] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7963,
			reagents = {
				{3859, 16},
				{3486, 3},
			},
		},
		[9918] = {
			item = 7964,
			reagents = {
				{7912},
			},
		},
		[9920] = {
			item = 7966,
			reagents = {
				{7912, 4},
			},
		},
		[9921] = {
			item = 7964,
			reagents = {
				{7912},
				{4306},
			},
		},
		[9926] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7918,
			reagents = {
				{3860, 8},
				{4234, 6},
			},
		},
		[9928] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7919,
			reagents = {
				{3860, 6},
				{4338, 4},
			},
		},
		[9931] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7920,
			reagents = {
				{3860, 12},
			},
		},
		[9933] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7921,
			reagents = {
				{3860, 10},
				{1705, 2},
			},
		},
		[9935] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7922,
			reagents = {
				{3859, 14},
				{7966},
			},
		},
		[9937] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7924,
			reagents = {
				{3860, 8},
				{3864, 2},
			},
		},
		[9939] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7967,
			reagents = {
				{3860, 4},
				{6037, 2},
				{7966, 4},
			},
		},
		[9942] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7925,
			reagents = {
				{3860, 8},
				{4234, 6},
				{4338, 4},
			},
		},
		[9945] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7926,
			reagents = {
				{3860, 12},
				{6037},
				{7966},
				{7909},
			},
		},
		[9950] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7927,
			reagents = {
				{3860, 10},
				{4338, 6},
				{6037},
				{7966},
			},
		},
		[9952] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7928,
			reagents = {
				{3860, 12},
				{6037},
				{4304, 6},
			},
		},
		[9954] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7938,
			reagents = {
				{3860, 10},
				{6037, 8},
				{7909, 3},
				{3864, 3},
				{5966},
				{7966, 2},
			},
		},
		[9957] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7929,
			reagents = {
				{3860, 12},
				{7067},
			},
		},
		[9959] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7930,
			reagents = {
				{3860, 16},
			},
		},
		[9961] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7931,
			reagents = {
				{3860, 10},
				{4338, 6},
			},
		},
		[9964] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7969,
			reagents = {
				{3860, 4},
				{7966, 3},
			},
		},
		[9966] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7932,
			reagents = {
				{3860, 14},
				{4304, 4},
				{3864, 4},
			},
		},
		[9968] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7933,
			reagents = {
				{3860, 14},
				{4304, 4},
			},
		},
		[9970] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7934,
			reagents = {
				{3860, 14},
				{7909},
			},
		},
		[9972] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7935,
			reagents = {
				{3860, 16},
				{6037, 6},
				{7077},
				{7966},
			},
		},
		[9974] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7939,
			reagents = {
				{3860, 12},
				{6037, 24},
				{7910, 4},
				{7971, 4},
				{7966, 2},
			},
		},
		[9979] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7936,
			reagents = {
				{3860, 14},
				{6037, 2},
				{4304, 4},
				{7966},
				{7909},
			},
		},
		[9980] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7937,
			reagents = {
				{3860, 16},
				{6037, 2},
				{7971},
				{7966},
			},
		},
		[9983] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7955,
			reagents = {
				{2840, 10},
				{2880, 2},
				{3470},
				{2318},
			},
		},
		[9985] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7956,
			reagents = {
				{2841, 8},
				{3466},
				{2319},
			},
		},
		[9986] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7957,
			reagents = {
				{2841, 12},
				{3466, 2},
				{2319, 2},
			},
		},
		[9987] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7958,
			reagents = {
				{2841, 14},
				{3466},
				{2319, 2},
			},
		},
		[9993] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7941,
			reagents = {
				{3860, 12},
				{3864, 2},
				{7966},
				{4234, 4},
			},
		},
		[9995] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7942,
			reagents = {
				{3860, 16},
				{7909, 2},
				{7966},
				{4304, 4},
			},
		},
		[9997] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7943,
			reagents = {
				{3860, 14},
				{6037, 4},
				{7966},
				{4304, 2},
			},
		},
		[10001] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7945,
			reagents = {
				{3860, 16},
				{7971},
				{1210, 4},
				{7966},
				{4304, 2},
			},
		},
		[10003] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7954,
			reagents = {
				{3860, 24},
				{7075, 4},
				{6037, 6},
				{3864, 5},
				{1529, 5},
				{7966, 4},
				{4304, 4},
			},
		},
		[10005] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7944,
			reagents = {
				{3860, 14},
				{7909},
				{1705, 2},
				{1206, 2},
				{7966},
				{4338, 2},
			},
		},
		[10007] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7961,
			reagents = {
				{3860, 28},
				{7081, 6},
				{6037, 8},
				{3823, 2},
				{7909, 6},
				{7966, 4},
				{4304, 2},
			},
		},
		[10009] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7946,
			reagents = {
				{3860, 18},
				{7075, 2},
				{7966},
				{4304, 4},
			},
		},
		[10011] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7959,
			reagents = {
				{3860, 28},
				{7972, 10},
				{6037, 10},
				{7966, 6},
				{4304, 6},
			},
		},
		[10013] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7947,
			reagents = {
				{3860, 12},
				{6037, 6},
				{7910, 2},
				{7966},
				{4304, 2},
			},
		},
		[10015] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 7960,
			reagents = {
				{3860, 30},
				{6037, 16},
				{7910, 6},
				{7081, 4},
				{7966, 8},
				{4304, 6},
			},
		},
		[10097] = {
			name = "Smelting: Smelt Mithril",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of mithril ore into a mithril bar. Smelting mithril requires a forge.",
			item = 3860,
			reagents = {
				{3858},
			},
		},
		[10098] = {
			name = "Smelting: Smelt Truesilver",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of truesilver ore into a truesilver bar. Smelting truesilver requires a forge.",
			item = 6037,
			reagents = {
				{7911},
			},
		},
		[10482] = {
			item = 8172,
			reagents = {
				{8169},
				{8150},
			},
		},
		[10487] = {
			item = 8173,
			reagents = {
				{4304, 5},
				{4291},
			},
		},
		[10490] = {
			item = 8174,
			reagents = {
				{4234, 12},
				{4236, 2},
				{4291, 2},
			},
		},
		[10499] = {
			item = 8175,
			reagents = {
				{4304, 7},
				{4291, 2},
			},
		},
		[10507] = {
			item = 8176,
			reagents = {
				{4304, 5},
				{4291, 2},
			},
		},
		[10509] = {
			item = 8187,
			reagents = {
				{4304, 6},
				{8167, 8},
				{8343},
			},
		},
		[10511] = {
			item = 8189,
			reagents = {
				{4304, 6},
				{8167, 12},
				{8343},
			},
		},
		[10516] = {
			item = 8192,
			reagents = {
				{4304, 8},
				{4338, 6},
				{4291, 3},
			},
		},
		[10518] = {
			item = 8198,
			reagents = {
				{4304, 8},
				{8167, 12},
				{8343},
			},
		},
		[10520] = {
			item = 8200,
			reagents = {
				{4304, 10},
				{8151, 4},
				{8343},
			},
		},
		[10525] = {
			item = 8203,
			reagents = {
				{4304, 12},
				{8151, 12},
				{4291, 4},
			},
		},
		[10529] = {
			item = 8210,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{4304, 10},
				{8153},
				{8172},
			},
		},
		[10531] = {
			item = 8201,
			reagents = {
				{4304, 8},
				{8151, 6},
				{8343},
			},
		},
		[10533] = {
			item = 8205,
			reagents = {
				{4304, 10},
				{8151, 4},
				{4291, 2},
			},
		},
		[10542] = {
			item = 8204,
			reagents = {
				{4304, 6},
				{8154, 8},
				{4291, 2},
			},
		},
		[10544] = {
			item = 8211,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{4304, 12},
				{8153, 2},
				{8172},
			},
		},
		[10546] = {
			item = 8214,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{4304, 10},
				{8153, 2},
				{8172},
			},
		},
		[10548] = {
			item = 8193,
			reagents = {
				{4304, 14},
				{4291, 4},
			},
		},
		[10550] = {
			item = 8195,
			reagents = {
				{4304, 12},
				{4291, 4},
			},
		},
		[10552] = {
			item = 8191,
			reagents = {
				{4304, 14},
				{8167, 24},
				{8343},
			},
		},
		[10554] = {
			item = 8209,
			reagents = {
				{4304, 12},
				{8154, 12},
				{4291, 6},
			},
		},
		[10556] = {
			item = 8185,
			reagents = {
				{4304, 14},
				{8167, 28},
				{8343},
			},
		},
		[10558] = {
			item = 8197,
			reagents = {
				{4304, 16},
				{8343, 2},
			},
		},
		[10560] = {
			item = 8202,
			reagents = {
				{4304, 10},
				{8152, 6},
				{8343, 2},
			},
		},
		[10562] = {
			item = 8216,
			reagents = {
				{4304, 14},
				{8152, 4},
				{8343, 2},
			},
		},
		[10564] = {
			item = 8207,
			reagents = {
				{4304, 12},
				{8154, 16},
				{8343, 2},
			},
		},
		[10566] = {
			item = 8213,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{4304, 14},
				{8153, 4},
				{8172, 2},
			},
		},
		[10568] = {
			item = 8206,
			reagents = {
				{4304, 14},
				{8154, 8},
				{8343, 2},
			},
		},
		[10570] = {
			item = 8208,
			reagents = {
				{4304, 10},
				{8154, 20},
				{8343, 2},
			},
		},
		[10572] = {
			item = 8212,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{4304, 16},
				{8153, 6},
				{8172, 2},
			},
		},
		[10574] = {
			item = 8215,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{4304, 16},
				{8153, 6},
				{8172, 2},
			},
		},
		[10619] = {
			item = 8347,
			reagents = {
				{4304, 24},
				{8165, 12},
				{8343, 4},
				{8172, 2},
			},
		},
		[10621] = {
			item = 8345,
			reagents = {
				{4304, 18},
				{8368, 2},
				{8146, 8},
				{8343, 4},
				{8172, 2},
			},
		},
		[10630] = {
			item = 8346,
			reagents = {
				{4304, 20},
				{7079, 8},
				{7075, 2},
				{8172},
				{8343, 4},
			},
		},
		[10632] = {
			item = 8348,
			reagents = {
				{4304, 40},
				{7077, 8},
				{7075, 4},
				{8172, 2},
				{8343, 4},
			},
		},
		[10647] = {
			item = 8349,
			reagents = {
				{4304, 40},
				{8168, 40},
				{7971, 2},
				{8172, 4},
				{8343, 4},
			},
		},
		[10650] = {
			item = 8367,
			reagents = {
				{4304, 40},
				{8165, 30},
				{8343, 4},
				{8172, 4},
			},
		},
		[10840] = {
			item = 8544,
			reagents = {
				{4338},
			},
		},
		[10841] = {
			item = 8545,
			reagents = {
				{4338, 2},
			},
		},
		[10844] = {
			item = 8546,
			reagents = {
				{8150, 4},
				{7078, 2},
				{18512},
			},
		},
		[11341] = {
			item = 8926,
			reagents = {
				{8924, 2},
				{8925},
			},
		},
		[11342] = {
			item = 8927,
			reagents = {
				{8924, 3},
				{8925},
			},
		},
		[11343] = {
			item = 8928,
			reagents = {
				{8924, 4},
				{8925},
			},
		},
		[11357] = {
			item = 8984,
			reagents = {
				{5173, 3},
				{8925},
			},
		},
		[11358] = {
			item = 8985,
			reagents = {
				{5173, 5},
				{8925},
			},
		},
		[11400] = {
			item = 9186,
			reagents = {
				{8924, 2},
				{8923, 2},
				{8925},
			},
		},
		[11448] = {
			item = 6149,
			reagents = {
				{3358},
				{3821},
				{3372},
			},
		},
		[11449] = {
			item = 8949,
			reagents = {
				{3820},
				{3821},
				{3372},
			},
		},
		[11450] = {
			item = 8951,
			reagents = {
				{3355},
				{3821},
				{3372},
			},
		},
		[11451] = {
			item = 8956,
			reagents = {
				{4625},
				{3821},
				{8925},
			},
		},
		[11452] = {
			item = 9030,
			reagents = {
				{7067},
				{3821},
				{8925},
			},
		},
		[11453] = {
			item = 9036,
			reagents = {
				{3358},
				{8831},
				{8925},
			},
		},
		[11454] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 9060,
			reagents = {
				{3860, 5},
				{3577},
				{6037},
			},
		},
		[11456] = {
			item = 9061,
			reagents = {
				{4625},
				{9260},
				{3372},
			},
		},
		[11457] = {
			item = 3928,
			reagents = {
				{8838},
				{3358},
				{8925},
			},
		},
		[11458] = {
			item = 9144,
			reagents = {
				{8153},
				{8831},
				{8925},
			},
		},
		[11459] = {
			item = 9149,
			reagents = {
				{3575, 4},
				{9262},
				{8831, 4},
				{4625, 4},
			},
		},
		[11460] = {
			item = 9154,
			reagents = {
				{8836},
				{8925},
			},
		},
		[11461] = {
			item = 9155,
			reagents = {
				{8839},
				{3821},
				{8925},
			},
		},
		[11464] = {
			item = 9172,
			reagents = {
				{8845},
				{8838},
				{8925},
			},
		},
		[11465] = {
			item = 9179,
			reagents = {
				{8839},
				{3358},
				{8925},
			},
		},
		[11466] = {
			item = 9088,
			reagents = {
				{8836},
				{8839},
				{8925},
			},
		},
		[11467] = {
			item = 9187,
			reagents = {
				{8838},
				{3821},
				{8925},
			},
		},
		[11468] = {
			item = 9197,
			reagents = {
				{8831, 3},
				{8925},
			},
		},
		[11472] = {
			item = 9206,
			reagents = {
				{8838},
				{8846},
				{8925},
			},
		},
		[11473] = {
			item = 9210,
			reagents = {
				{8845, 2},
				{4342},
				{8925},
			},
		},
		[11476] = {
			item = 9264,
			reagents = {
				{8845, 3},
				{8925},
			},
		},
		[11477] = {
			item = 9224,
			reagents = {
				{8846},
				{8845},
				{8925},
			},
		},
		[11478] = {
			item = 9233,
			reagents = {
				{8846, 2},
				{8925},
			},
		},
		[11479] = {
			name = "Transmute: Iron to Gold",
			tools = {9149},
			text = "Turns a bar of Iron into a bar of Gold.",
			item = 3577,
			reagents = {
				{3575},
			},
		},
		[11480] = {
			name = "Transmute: Mithril to Truesilver",
			tools = {9149},
			text = "Turns a bar of Mithril into a bar of Truesilver.",
			item = 6037,
			reagents = {
				{3860},
			},
		},
		[11643] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 9366,
			reagents = {
				{3859, 10},
				{3577, 4},
				{3486, 4},
				{3864},
			},
		},
		[12044] = {
			item = 10045,
			reagents = {
				{2996},
				{2320},
			},
		},
		[12045] = {
			item = 10046,
			reagents = {
				{2996, 2},
				{2318},
				{2320},
			},
		},
		[12046] = {
			item = 10047,
			reagents = {
				{2996, 4},
				{2321},
			},
		},
		[12047] = {
			item = 10048,
			reagents = {
				{2997, 5},
				{2604, 3},
				{2321},
			},
		},
		[12048] = {
			item = 9998,
			reagents = {
				{4339, 2},
				{4291, 3},
			},
		},
		[12049] = {
			item = 9999,
			reagents = {
				{4339, 2},
				{4291, 3},
			},
		},
		[12050] = {
			item = 10001,
			reagents = {
				{4339, 3},
				{8343},
			},
		},
		[12052] = {
			item = 10002,
			reagents = {
				{4339, 3},
				{10285, 2},
				{8343},
			},
		},
		[12053] = {
			item = 10003,
			reagents = {
				{4339, 2},
				{8343, 2},
			},
		},
		[12055] = {
			item = 10004,
			reagents = {
				{4339, 3},
				{10285, 2},
				{8343},
			},
		},
		[12056] = {
			item = 10007,
			reagents = {
				{4339, 3},
				{2604, 2},
				{8343},
			},
		},
		[12059] = {
			item = 10008,
			reagents = {
				{4339},
				{2324},
				{8343},
			},
		},
		[12060] = {
			item = 10009,
			reagents = {
				{4339, 3},
				{2604, 2},
				{8343},
			},
		},
		[12061] = {
			item = 10056,
			reagents = {
				{4339},
				{6261},
				{8343},
			},
		},
		[12064] = {
			item = 10052,
			reagents = {
				{4339, 2},
				{6261, 2},
				{8343},
			},
		},
		[12065] = {
			item = 10050,
			reagents = {
				{4339, 4},
				{4291, 2},
			},
		},
		[12066] = {
			item = 10018,
			reagents = {
				{4339, 3},
				{2604, 2},
				{8343, 2},
			},
		},
		[12067] = {
			item = 10019,
			reagents = {
				{4339, 4},
				{8153, 4},
				{10286, 2},
				{8343, 2},
			},
		},
		[12069] = {
			item = 10042,
			reagents = {
				{4339, 5},
				{7077, 2},
				{8343, 2},
			},
		},
		[12070] = {
			item = 10021,
			reagents = {
				{4339, 6},
				{8153, 6},
				{10286, 2},
				{8343, 2},
			},
		},
		[12071] = {
			item = 10023,
			reagents = {
				{4339, 5},
				{10285, 5},
				{8343, 2},
			},
		},
		[12072] = {
			item = 10024,
			reagents = {
				{4339, 3},
				{8343, 2},
			},
		},
		[12073] = {
			item = 10026,
			reagents = {
				{4339, 3},
				{8343, 2},
				{4304, 2},
			},
		},
		[12074] = {
			item = 10027,
			reagents = {
				{4339, 3},
				{8343, 2},
			},
		},
		[12075] = {
			item = 10054,
			reagents = {
				{4339, 2},
				{4342, 2},
				{8343, 2},
			},
		},
		[12076] = {
			item = 10028,
			reagents = {
				{4339, 5},
				{10285, 4},
				{8343, 2},
			},
		},
		[12077] = {
			item = 10053,
			reagents = {
				{4339, 3},
				{2325},
				{8343},
				{2324},
			},
		},
		[12078] = {
			item = 10029,
			reagents = {
				{4339, 4},
				{2604},
				{8343},
			},
		},
		[12079] = {
			item = 10051,
			reagents = {
				{4339, 4},
				{2604, 2},
				{8343, 2},
			},
		},
		[12080] = {
			item = 10055,
			reagents = {
				{4339, 3},
				{10290},
				{8343},
			},
		},
		[12081] = {
			item = 10030,
			reagents = {
				{4339, 3},
				{4589, 6},
				{8343, 2},
			},
		},
		[12082] = {
			item = 10031,
			reagents = {
				{4339, 6},
				{10285, 6},
				{8343, 3},
				{4304, 2},
			},
		},
		[12084] = {
			item = 10033,
			reagents = {
				{4339, 4},
				{2604, 2},
				{8343, 2},
			},
		},
		[12085] = {
			item = 10034,
			reagents = {
				{4339, 4},
				{2604, 2},
				{8343, 2},
			},
		},
		[12086] = {
			item = 10025,
			reagents = {
				{4339, 2},
				{10285, 8},
				{8343, 3},
			},
		},
		[12088] = {
			item = 10044,
			reagents = {
				{4339, 5},
				{7077},
				{8343, 3},
				{4304, 2},
			},
		},
		[12089] = {
			item = 10035,
			reagents = {
				{4339, 4},
				{8343, 3},
			},
		},
		[12091] = {
			item = 10040,
			reagents = {
				{4339, 5},
				{8343, 3},
				{2324},
			},
		},
		[12092] = {
			item = 10041,
			reagents = {
				{4339, 8},
				{8153, 4},
				{10286, 2},
				{8343, 3},
				{6037},
				{1529},
			},
		},
		[12093] = {
			item = 10036,
			reagents = {
				{4339, 5},
				{8343, 3},
			},
		},
		[12259] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 10423,
			reagents = {
				{2841, 12},
				{2842, 4},
				{3478, 2},
			},
		},
		[12260] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 10421,
			reagents = {
				{2840, 4},
			},
		},
		[12584] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10558,
			quantity = 3,
			reagents = {
				{3577},
			},
		},
		[12585] = {
			item = 10505,
			reagents = {
				{7912, 2},
			},
		},
		[12586] = {
			item = 10507,
			quantity = 2,
			reagents = {
				{10505},
				{4306},
			},
		},
		[12587] = {
			tools = {6219, 10498},
			item = 10499,
			reagents = {
				{4234, 6},
				{3864, 2},
			},
		},
		[12589] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 10559,
			reagents = {
				{3860, 3},
			},
		},
		[12590] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 10498,
			reagents = {
				{3859, 4},
			},
		},
		[12591] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10560,
			reagents = {
				{3860},
				{4338},
				{10505},
			},
		},
		[12594] = {
			tools = {6219, 10498},
			item = 10500,
			reagents = {
				{4385},
				{3864, 2},
				{7068, 2},
				{4234, 4},
			},
		},
		[12595] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10508,
			reagents = {
				{10559},
				{10560},
				{4400},
				{3860, 4},
				{7068, 2},
			},
		},
		[12596] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 10512,
			quantity = 200,
			reagents = {
				{3860},
				{10505},
			},
		},
		[12597] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10546,
			reagents = {
				{10559},
				{7909, 2},
				{4304, 2},
			},
		},
		[12599] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10561,
			reagents = {
				{3860, 3},
			},
		},
		[12603] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10514,
			quantity = 3,
			reagents = {
				{10561},
				{10560},
				{10505},
			},
		},
		[12607] = {
			tools = {6219, 10498},
			item = 10501,
			reagents = {
				{4304, 4},
				{7909, 2},
				{10592},
			},
		},
		[12609] = {
			item = 10592,
			reagents = {
				{3821},
				{3818},
				{3372},
			},
		},
		[12614] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10510,
			reagents = {
				{10559, 2},
				{10560},
				{4400},
				{3860, 6},
				{3864, 2},
			},
		},
		[12615] = {
			tools = {6219, 10498},
			item = 10502,
			reagents = {
				{4304, 4},
				{7910, 2},
			},
		},
		[12616] = {
			tools = {6219, 10498},
			item = 10518,
			reagents = {
				{4339, 4},
				{10285, 2},
				{10560},
				{10505, 4},
			},
		},
		[12617] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10506,
			reagents = {
				{3860, 8},
				{10561},
				{6037},
				{818, 4},
				{774, 4},
			},
		},
		[12618] = {
			tools = {6219, 10498},
			item = 10503,
			reagents = {
				{4304, 6},
				{7910, 2},
			},
		},
		[12619] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10562,
			quantity = 4,
			reagents = {
				{10561, 2},
				{10560},
				{10505, 2},
			},
		},
		[12620] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10548,
			reagents = {
				{10559},
				{7910},
				{6037, 2},
			},
		},
		[12621] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 10513,
			quantity = 200,
			reagents = {
				{3860, 2},
				{10505, 2},
			},
		},
		[12622] = {
			tools = {6219, 10498},
			item = 10504,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{4304, 8},
				{1529, 3},
				{7909, 3},
				{10286, 2},
				{8153, 2},
			},
		},
		[12624] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10576,
			reagents = {
				{3860, 14},
				{7077, 4},
				{6037, 4},
				{9060, 2},
				{9061, 2},
				{7910, 2},
			},
		},
		[12715] = {
			item = 10644,
			reagents = {
				{10648},
				{10647},
			},
		},
		[12716] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10577,
			extra = "|cffffffff6 "..L["Charges"],
			reagents = {
				{10559, 2},
				{3860, 4},
				{10505, 5},
				{10558},
				{7068},
			},
		},
		[12717] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10542,
			reagents = {
				{3860, 8},
				{3864},
				{7067, 4},
			},
		},
		[12718] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10543,
			reagents = {
				{3860, 8},
				{3864},
				{7068, 4},
			},
		},
		[12754] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10586,
			quantity = 2,
			reagents = {
				{10561},
				{9061},
				{10507, 6},
				{10560},
			},
		},
		[12755] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10587,
			reagents = {
				{10561, 2},
				{10505, 4},
				{6037, 6},
				{10560},
				{4407, 2},
			},
		},
		[12758] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10588,
			reagents = {
				{10543},
				{9061, 4},
				{3860, 4},
				{10560},
			},
		},
		[12759] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10645,
			reagents = {
				{10559, 2},
				{10560},
				{12808},
				{7972, 4},
				{9060},
			},
		},
		[12760] = {
			item = 10646,
			reagents = {
				{4338},
				{10505, 3},
				{10560},
			},
		},
		[12895] = {
			item = 10713,
			reagents = {
				{10648},
				{10647},
			},
		},
		[12897] = {
			tools = {6219, 10498},
			item = 10545,
			reagents = {
				{10500},
				{10559},
				{10558, 2},
				{8151, 2},
				{4234, 2},
			},
		},
		[12899] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10716,
			reagents = {
				{10559},
				{10560},
				{3860, 4},
				{8151, 4},
				{1529, 2},
			},
		},
		[12902] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10720,
			reagents = {
				{10559},
				{10285, 2},
				{4337, 4},
				{10505, 2},
				{3860, 4},
			},
		},
		[12903] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10721,
			reagents = {
				{7387},
				{3860, 4},
				{6037, 2},
				{10560},
				{7909, 2},
			},
		},
		[12905] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10724,
			reagents = {
				{10026},
				{10559, 2},
				{4234, 4},
				{10505, 8},
				{4389, 4},
			},
		},
		[12906] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10725,
			reagents = {
				{10561},
				{6037, 6},
				{3860, 6},
				{9060, 2},
				{10558},
				{1529, 2},
			},
		},
		[12907] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10726,
			reagents = {
				{3860, 10},
				{6037, 4},
				{10558},
				{7910, 2},
				{4338, 4},
			},
		},
		[12908] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 10727,
			reagents = {
				{10559, 2},
				{9061, 4},
				{3860, 6},
				{6037, 6},
				{10560},
			},
		},
		[13028] = {
			requires = L["Cooking Fire"],
			item = 10841,
			quantity = 4,
			reagents = {
				{3821},
				{159},
			},
		},
		[13220] = {
			item = 10918,
			reagents = {
				{2930},
				{5173},
				{3372},
			},
		},
		[13228] = {
			item = 10920,
			reagents = {
				{2930},
				{5173, 2},
				{3372},
			},
		},
		[13229] = {
			item = 10921,
			reagents = {
				{8923},
				{5173, 2},
				{8925},
			},
		},
		[13230] = {
			item = 10922,
			reagents = {
				{8923, 2},
				{5173, 2},
				{8925},
			},
		},
		[13240] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			text = "Reloads an empty Goblin mortar.",
			item = 10577,
			extra = "|cffffffff6 "..L["Charges"],
			reagents = {
				{10577},
				{3860},
				{10505, 3},
			},
		},
		[14379] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 11128,
			reagents = {
				{3577},
				{3478, 2},
			},
		},
		[14380] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 11144,
			reagents = {
				{6037},
				{3486},
			},
		},
		[14891] = {
			name = "Smelting: Smelt Dark Iron",
			requires = L["Black Forge"],
			text = "Allows the miner to smelt chunks of dark iron ore into a dark iron bar. Smelting dark iron can only be done at the Black Forge in Blackrock Depths.",
			item = 11371,
			reagents = {
				{11370, 8},
			},
		},
		[14930] = {
			item = 8217,
			reagents = {
				{4304, 12},
				{8172},
				{8949},
				{4291, 4},
			},
		},
		[14932] = {
			item = 8218,
			reagents = {
				{4304, 10},
				{8172},
				{8951},
				{4291, 6},
			},
		},
		[15002] = {
			item = 51268,
			reagents = {
			},
		},
		[15003] = {
			item = 51262,
			reagents = {
			},
		},
		[15004] = {
			item = 51264,
			reagents = {
			},
		},
		[15005] = {
			item = 51256,
			reagents = {
			},
		},
		[15006] = {
			item = 30818,
			reagents = {
			},
		},
		[15255] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 11590,
			reagents = {
				{3860},
				{4338},
				{10505},
			},
		},
		[15292] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 11608,
			reagents = {
				{11371, 18},
				{7077, 4},
			},
		},
		[15293] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 11606,
			reagents = {
				{11371, 10},
				{7077, 2},
			},
		},
		[15294] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 11607,
			reagents = {
				{11371, 26},
				{7077, 4},
			},
		},
		[15295] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 11605,
			reagents = {
				{11371, 6},
				{7077},
			},
		},
		[15296] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 11604,
			reagents = {
				{11371, 20},
				{7077, 8},
			},
		},
		[15628] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 11825,
			reagents = {
				{4394},
				{7077},
				{7191},
				{3860, 6},
			},
		},
		[15633] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 11826,
			reagents = {
				{7075},
				{4389, 3},
				{7191},
				{3860, 2},
				{6037},
			},
		},
		[15833] = {
			item = 12190,
			reagents = {
				{8831, 3},
				{8925},
			},
		},
		[15853] = {
			requires = L["Cooking Fire"],
			item = 12209,
			reagents = {
				{1015},
				{2678},
			},
		},
		[15855] = {
			requires = L["Cooking Fire"],
			item = 12210,
			reagents = {
				{12184},
				{2692},
			},
		},
		[15856] = {
			requires = L["Cooking Fire"],
			item = 13851,
			reagents = {
				{12203},
				{2692},
			},
		},
		[15861] = {
			requires = L["Cooking Fire"],
			item = 12212,
			quantity = 2,
			reagents = {
				{12202},
				{159},
				{4536, 2},
			},
		},
		[15863] = {
			requires = L["Cooking Fire"],
			item = 12213,
			reagents = {
				{12037},
				{2692},
			},
		},
		[15865] = {
			requires = L["Cooking Fire"],
			item = 12214,
			reagents = {
				{12037},
				{2596},
			},
		},
		[15906] = {
			requires = L["Cooking Fire"],
			item = 12217,
			reagents = {
				{12037},
				{4402},
				{2692},
			},
		},
		[15910] = {
			requires = L["Cooking Fire"],
			item = 12215,
			quantity = 2,
			reagents = {
				{12204, 2},
				{3713},
				{159},
			},
		},
		[15915] = {
			requires = L["Cooking Fire"],
			item = 12216,
			reagents = {
				{12206},
				{2692, 2},
			},
		},
		[15933] = {
			requires = L["Cooking Fire"],
			item = 12218,
			reagents = {
				{12207},
				{3713, 2},
			},
		},
		[15935] = {
			requires = L["Cooking Fire"],
			item = 12224,
			reagents = {
				{12223},
				{2678},
			},
		},
		[15972] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12259,
			reagents = {
				{3859, 10},
				{3466, 2},
				{1206},
				{7067},
				{4234},
			},
		},
		[15973] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12260,
			reagents = {
				{3859, 10},
				{3577, 4},
				{7068, 2},
				{4234, 2},
			},
		},
		[16153] = {
			name = "Smelting: Smelt Thorium",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of thorium ore into a thorium bar. Smelting thorium requires a forge.",
			item = 12359,
			reagents = {
				{10620},
			},
		},
		[16639] = {
			item = 12644,
			reagents = {
				{12365, 4},
			},
		},
		[16640] = {
			item = 12643,
			reagents = {
				{12365},
				{14047},
			},
		},
		[16641] = {
			item = 12404,
			reagents = {
				{12365},
			},
		},
		[16642] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12405,
			reagents = {
				{12359, 16},
				{12361},
				{11188, 4},
			},
		},
		[16643] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12406,
			reagents = {
				{12359, 12},
				{11186, 4},
			},
		},
		[16644] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12408,
			reagents = {
				{12359, 12},
				{11184, 4},
			},
		},
		[16645] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12416,
			reagents = {
				{12359, 10},
				{7077, 2},
			},
		},
		[16646] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12428,
			reagents = {
				{12359, 24},
				{8170, 6},
				{3864, 2},
			},
		},
		[16647] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12424,
			reagents = {
				{12359, 22},
				{8170, 6},
				{7909},
			},
		},
		[16648] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12415,
			reagents = {
				{12359, 18},
				{7077, 2},
				{7910},
			},
		},
		[16649] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12425,
			reagents = {
				{12359, 20},
				{7910},
			},
		},
		[16650] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12624,
			reagents = {
				{12359, 40},
				{12655, 2},
				{12803, 4},
				{8153, 4},
				{12364},
			},
		},
		[16651] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12645,
			reagents = {
				{12359, 4},
				{12644, 4},
				{7076, 2},
			},
		},
		[16652] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12409,
			reagents = {
				{12359, 20},
				{8170, 8},
				{11185, 4},
			},
		},
		[16653] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12410,
			reagents = {
				{12359, 24},
				{7910},
				{11188, 4},
			},
		},
		[16654] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12418,
			reagents = {
				{12359, 18},
				{7077, 4},
			},
		},
		[16655] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12631,
			reagents = {
				{12359, 20},
				{12655, 6},
				{7078, 2},
				{7910, 4},
			},
		},
		[16656] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12419,
			reagents = {
				{12359, 14},
				{7077, 4},
			},
		},
		[16657] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12426,
			reagents = {
				{12359, 34},
				{7910},
				{7909},
			},
		},
		[16658] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12427,
			reagents = {
				{12359, 34},
				{7910, 2},
			},
		},
		[16659] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12417,
			reagents = {
				{12359, 18},
				{7910, 4},
			},
		},
		[16660] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12625,
			reagents = {
				{12359, 20},
				{12360, 4},
				{12364, 2},
				{7080, 2},
			},
		},
		[16661] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12632,
			reagents = {
				{12359, 20},
				{12655, 4},
				{7080, 4},
				{12361, 4},
			},
		},
		[16662] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12414,
			reagents = {
				{12359, 26},
				{11186, 4},
			},
		},
		[16663] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12422,
			reagents = {
				{12359, 40},
				{7910, 2},
			},
		},
		[16664] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12610,
			reagents = {
				{12359, 20},
				{12360, 2},
				{3577, 6},
			},
		},
		[16665] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12611,
			reagents = {
				{12359, 20},
				{12360, 2},
				{2842, 10},
			},
		},
		[16667] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12628,
			reagents = {
				{12359, 40},
				{12662, 10},
				{12361, 4},
				{7910, 4},
			},
		},
		[16724] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12633,
			reagents = {
				{12359, 20},
				{12655, 4},
				{6037, 6},
				{3577, 6},
				{12800, 2},
			},
		},
		[16725] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12420,
			reagents = {
				{12359, 20},
				{7077, 4},
			},
		},
		[16726] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12612,
			reagents = {
				{12359, 30},
				{12360, 2},
				{6037, 2},
				{12364},
			},
		},
		[16728] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12636,
			reagents = {
				{12359, 40},
				{12655, 4},
				{8168, 60},
				{12799, 6},
				{12364, 2},
			},
		},
		[16729] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12640,
			reagents = {
				{12359, 80},
				{12360, 12},
				{8146, 40},
				{12361, 10},
				{12800, 4},
			},
		},
		[16730] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12429,
			reagents = {
				{12359, 44},
				{7910, 2},
			},
		},
		[16731] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12613,
			reagents = {
				{12359, 40},
				{12360, 2},
				{7910},
			},
		},
		[16732] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12614,
			reagents = {
				{12359, 40},
				{12360, 2},
				{7910},
			},
		},
		[16741] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12639,
			reagents = {
				{12360, 15},
				{12655, 20},
				{7076, 10},
				{12361, 4},
				{12799, 4},
			},
		},
		[16742] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12620,
			reagents = {
				{12360, 6},
				{12655, 16},
				{7076, 6},
				{12799, 2},
				{12800},
			},
		},
		[16744] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12619,
			reagents = {
				{12360, 10},
				{12655, 20},
				{7080, 6},
				{12361, 2},
				{12364},
			},
		},
		[16745] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12618,
			reagents = {
				{12360, 8},
				{12655, 24},
				{7076, 4},
				{7080, 4},
				{12364, 2},
				{12800, 2},
			},
		},
		[16746] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12641,
			reagents = {
				{12360, 30},
				{12655, 30},
				{12364, 6},
				{12800, 6},
			},
		},
		[16965] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12769,
			reagents = {
				{12359, 30},
				{12803, 6},
				{8153, 6},
				{12799, 6},
				{12644, 2},
				{8170, 8},
			},
		},
		[16969] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12773,
			reagents = {
				{12359, 20},
				{12799, 2},
				{12644, 2},
				{8170, 4},
			},
		},
		[16970] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12774,
			reagents = {
				{12359, 30},
				{12655, 4},
				{7910, 4},
				{12361, 4},
				{12644, 2},
				{8170, 4},
			},
		},
		[16971] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12775,
			reagents = {
				{12359, 40},
				{12644, 6},
				{8170, 6},
			},
		},
		[16973] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12776,
			reagents = {
				{12359, 20},
				{12655, 6},
				{12364, 2},
				{12804, 4},
				{8170, 4},
			},
		},
		[16978] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12777,
			reagents = {
				{12655, 10},
				{7078, 4},
				{7077, 4},
				{12800, 2},
				{12644, 2},
			},
		},
		[16983] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12781,
			reagents = {
				{12655, 6},
				{12360, 2},
				{12804, 4},
				{12799, 2},
				{12361, 2},
				{12364},
			},
		},
		[16984] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12792,
			reagents = {
				{12359, 30},
				{7077, 4},
				{7910, 4},
				{8170, 4},
			},
		},
		[16985] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12782,
			reagents = {
				{12359, 40},
				{12360, 2},
				{12662, 16},
				{12808, 8},
				{12361, 2},
				{12644, 2},
				{8170, 4},
			},
		},
		[16986] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12795,
			reagents = {
				{12655, 10},
				{12360, 10},
				{12662, 8},
				{7910, 10},
				{12644, 2},
				{8170, 8},
			},
		},
		[16987] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12802,
			reagents = {
				{12655, 20},
				{12804, 20},
				{12364, 2},
				{12800, 2},
				{12644, 2},
			},
		},
		[16988] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12796,
			reagents = {
				{12359, 50},
				{12360, 15},
				{12809, 4},
				{12810, 6},
				{7076, 10},
			},
		},
		[16990] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12790,
			reagents = {
				{12360, 15},
				{12800, 8},
				{12811},
				{12799, 4},
				{12810, 8},
				{12644, 2},
			},
		},
		[16991] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12798,
			reagents = {
				{12359, 40},
				{12360, 12},
				{12808, 10},
				{12364, 8},
				{12644, 2},
				{12810, 4},
			},
		},
		[16992] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12797,
			reagents = {
				{12360, 18},
				{12361, 8},
				{12800, 8},
				{7080, 4},
				{12644, 2},
				{12810, 4},
			},
		},
		[16993] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12794,
			reagents = {
				{12655, 20},
				{12364, 8},
				{12799, 8},
				{7076, 6},
				{12810, 4},
			},
		},
		[16994] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12784,
			reagents = {
				{12360, 20},
				{12810, 6},
				{12644, 2},
			},
		},
		[16995] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 12783,
			reagents = {
				{12360, 10},
				{12655, 10},
				{12810, 2},
				{7910, 6},
				{12800, 6},
				{12799, 6},
				{12644, 4},
			},
		},
		[17187] = {
			name = "Transmute: Arcanite",
			tools = {9149},
			text = "Turns a bar of Thorium and an Arcane Crystal into Arcanite.",
			item = 12360,
			reagents = {
				{12359},
				{12363},
			},
		},
		[17551] = {
			item = 13423,
			reagents = {
				{13422},
				{3372},
			},
		},
		[17552] = {
			item = 13442,
			reagents = {
				{8846, 3},
				{8925},
			},
		},
		[17553] = {
			item = 13443,
			reagents = {
				{8838, 2},
				{8839, 2},
				{8925},
			},
		},
		[17554] = {
			item = 13445,
			reagents = {
				{13423, 2},
				{8838},
				{8925},
			},
		},
		[17555] = {
			item = 13447,
			reagents = {
				{13463},
				{13466, 2},
				{8925},
			},
		},
		[17556] = {
			item = 13446,
			reagents = {
				{13464, 2},
				{13465},
				{8925},
			},
		},
		[17557] = {
			item = 13453,
			reagents = {
				{8846, 2},
				{13466, 2},
				{8925},
			},
		},
		[17559] = {
			name = "Transmute: Air to Fire",
			tools = {9149},
			text = "Transmutes Air into Fire.",
			item = 7078,
			reagents = {
				{7082},
			},
		},
		[17560] = {
			name = "Transmute: Fire to Earth",
			tools = {9149},
			text = "Transmutes Fire into Earth.",
			item = 7076,
			reagents = {
				{7078},
			},
		},
		[17561] = {
			name = "Transmute: Earth to Water",
			tools = {9149},
			text = "Transmutes Earth into Water.",
			item = 7080,
			reagents = {
				{7076},
			},
		},
		[17562] = {
			name = "Transmute: Water to Air",
			tools = {9149},
			text = "Transmutes Water into Air.",
			item = 7082,
			reagents = {
				{7080},
			},
		},
		[17563] = {
			name = "Transmute: Undeath to Water",
			tools = {9149},
			text = "Purifies Essence of Undeath turning it into Water.",
			item = 7080,
			reagents = {
				{12808},
			},
		},
		[17564] = {
			name = "Transmute: Water to Undeath",
			tools = {9149},
			text = "Taints Essence of Water turning it into Undeath.",
			item = 12808,
			reagents = {
				{7080},
			},
		},
		[17565] = {
			name = "Transmute: Life to Earth",
			tools = {9149},
			text = "Transmutes Living Essence into Earth.",
			item = 7076,
			reagents = {
				{12803},
			},
		},
		[17566] = {
			name = "Transmute: Earth to Life",
			tools = {9149},
			text = "Transmutes Earth to Living Essence.",
			item = 12803,
			reagents = {
				{7076},
			},
		},
		[17570] = {
			item = 13455,
			reagents = {
				{13423, 3},
				{10620},
				{8925},
			},
		},
		[17571] = {
			item = 13452,
			reagents = {
				{13465, 2},
				{13466, 2},
				{8925},
			},
		},
		[17572] = {
			item = 13462,
			reagents = {
				{13467, 2},
				{13466, 2},
				{8925},
			},
		},
		[17573] = {
			item = 13454,
			reagents = {
				{13463, 3},
				{13465},
				{8925},
			},
		},
		[17574] = {
			item = 13457,
			reagents = {
				{7068},
				{4625},
				{8925},
			},
		},
		[17575] = {
			item = 13456,
			reagents = {
				{7070},
				{13467},
				{8925},
			},
		},
		[17576] = {
			item = 13458,
			reagents = {
				{7067},
				{13463},
				{8925},
			},
		},
		[17577] = {
			item = 13461,
			reagents = {
				{11176},
				{13463},
				{8925},
			},
		},
		[17578] = {
			item = 13459,
			reagents = {
				{3824},
				{8836, 2},
				{8925},
			},
		},
		[17579] = {
			item = 13460,
			reagents = {
				{7069},
				{13464},
				{8925},
			},
		},
		[17580] = {
			item = 13444,
			reagents = {
				{13463, 2},
				{13467, 2},
				{8925},
			},
		},
		[17634] = {
			requires = L["Alchemy Lab"],
			tools = {9149},
			item = 13506,
			reagents = {
				{13423, 30},
				{13465, 10},
				{13468},
				{8925},
			},
		},
		[17635] = {
			requires = L["Alchemy Lab"],
			item = 13510,
			reagents = {
				{13464, 30}, --Golden Sansam 1.18
				{13423, 10},
				{13468},
				{8925},
			},
		},
		[17636] = {
			requires = L["Alchemy Lab"],
			item = 13511,
			reagents = {
				{8838, 30}, --Sungrass 1.18
				{13467, 10},
				{13468},
				{8925},
			},
		},
		[17637] = {
			requires = L["Alchemy Lab"],
			item = 13512,
			reagents = {
				{13463, 30},
				{13465, 10},
				{13468},
				{8925},
			},
		},
		[17638] = {
			requires = L["Alchemy Lab"],
			item = 13513,
			reagents = {
				{13467, 30},
				{13465, 10},
				{13468},
				{8925},
			},
		},
		[17640] = {
			item = 13503,
			reagents = {
				{7078, 8},
				{7076, 8},
				{7082, 8},
				{7080, 8},
				{12803, 8},
				{9262, 2},
				{13468, 4},
			},
		},
		[18238] = {
			requires = L["Cooking Fire"],
			item = 6887,
			reagents = {
				{4603},
			},
		},
		[18239] = {
			requires = L["Cooking Fire"],
			item = 13927,
			reagents = {
				{13754},
				{3713},
			},
		},
		[18240] = {
			requires = L["Cooking Fire"],
			item = 13928,
			reagents = {
				{13755},
				{3713},
			},
		},
		[18241] = {
			requires = L["Cooking Fire"],
			item = 13930,
			reagents = {
				{13758},
			},
		},
		[18242] = {
			requires = L["Cooking Fire"],
			item = 13929,
			reagents = {
				{13756},
				{2692, 2},
			},
		},
		[18243] = {
			requires = L["Cooking Fire"],
			item = 13931,
			reagents = {
				{13759},
				{159},
			},
		},
		[18244] = {
			requires = L["Cooking Fire"],
			item = 13932,
			reagents = {
				{13760},
			},
		},
		[18245] = {
			requires = L["Cooking Fire"],
			item = 13933,
			reagents = {
				{13888},
				{159},
			},
		},
		[18246] = {
			requires = L["Cooking Fire"],
			item = 13934,
			reagents = {
				{13893},
				{2692},
				{3713},
			},
		},
		[18247] = {
			requires = L["Cooking Fire"],
			item = 13935,
			reagents = {
				{13889},
				{3713},
			},
		},
		[18401] = {
			item = 14048,
			reagents = {
				{14047, 5},
			},
		},
		[18402] = {
			item = 13856,
			reagents = {
				{14048, 3},
				{14341},
			},
		},
		[18403] = {
			item = 13869,
			reagents = {
				{14048, 5},
				{7079, 2},
				{14341},
			},
		},
		[18404] = {
			item = 13868,
			reagents = {
				{14048, 5},
				{7079, 2},
				{14341},
			},
		},
		[18405] = {
			item = 14046,
			reagents = {
				{14048, 5},
				{8170, 2},
				{14341},
			},
		},
		[18406] = {
			item = 13858,
			reagents = {
				{14048, 5},
				{14227},
				{14341},
			},
		},
		[18407] = {
			item = 13857,
			reagents = {
				{14048, 5},
				{14227},
				{14341},
			},
		},
		[18408] = {
			item = 14042,
			reagents = {
				{14048, 5},
				{7077, 3},
				{14341},
			},
		},
		[18409] = {
			item = 13860,
			reagents = {
				{14048, 4},
				{14227},
				{14341},
			},
		},
		[18410] = {
			item = 14143,
			reagents = {
				{14048, 3},
				{9210, 2},
				{14227},
				{14341},
			},
		},
		[18411] = {
			item = 13870,
			reagents = {
				{14048, 3},
				{7080},
				{14341},
			},
		},
		[18412] = {
			item = 14043,
			reagents = {
				{14048, 4},
				{7077, 3},
				{14341},
			},
		},
		[18413] = {
			item = 14142,
			reagents = {
				{14048, 4},
				{9210, 2},
				{14227},
				{14341},
			},
		},
		[18414] = {
			item = 14100,
			reagents = {
				{14048, 5},
				{3577, 2},
				{14341},
			},
		},
		[18415] = {
			item = 14101,
			reagents = {
				{14048, 4},
				{3577, 2},
				{14341},
			},
		},
		[18416] = {
			item = 14141,
			reagents = {
				{14048, 6},
				{9210, 4},
				{14227},
				{14341},
			},
		},
		[18417] = {
			item = 13863,
			reagents = {
				{14048, 4},
				{8170, 4},
				{14341},
			},
		},
		[18418] = {
			item = 14044,
			reagents = {
				{14048, 5},
				{7078},
				{14341},
			},
		},
		[18419] = {
			item = 14107,
			reagents = {
				{14048, 5},
				{14256, 4},
				{14341},
			},
		},
		[18420] = {
			item = 14103,
			reagents = {
				{14048, 4},
				{3577, 2},
				{14341},
			},
		},
		[18421] = {
			item = 14132,
			reagents = {
				{14048, 6},
				{11176},
				{14341},
			},
		},
		[18422] = {
			item = 14134,
			reagents = {
				{14048, 6},
				{7078, 4},
				{7077, 4},
				{7068, 4},
				{14341},
			},
		},
		[18423] = {
			item = 13864,
			reagents = {
				{14048, 4},
				{14227, 2},
				{8170, 4},
				{14341},
			},
		},
		[18424] = {
			item = 13871,
			reagents = {
				{14048, 6},
				{7080},
				{14341},
			},
		},
		[18434] = {
			item = 14045,
			reagents = {
				{14048, 6},
				{7078},
				{14341},
			},
		},
		[18436] = {
			item = 14136,
			reagents = {
				{14048, 10},
				{14256, 12},
				{12808, 4},
				{7080, 4},
				{14341},
			},
		},
		[18437] = {
			item = 14108,
			reagents = {
				{14048, 6},
				{14256, 4},
				{8170, 4},
				{14341},
			},
		},
		[18438] = {
			item = 13865,
			reagents = {
				{14048, 6},
				{14227, 2},
				{14341},
			},
		},
		[18439] = {
			item = 14104,
			reagents = {
				{14048, 6},
				{2577, 4},
				{14227},
				{14341},
			},
		},
		[18440] = {
			item = 14137,
			reagents = {
				{14048, 6},
				{14342, 4},
				{14341},
			},
		},
		[18441] = {
			item = 14144,
			reagents = {
				{14048, 6},
				{9210, 4},
				{14341},
			},
		},
		[18442] = {
			item = 14111,
			reagents = {
				{14048, 5},
				{14256, 4},
				{14341},
			},
		},
		[18444] = {
			item = 13866,
			reagents = {
				{14048, 4},
				{14227, 2},
				{14341},
			},
		},
				[18445] = {
			item = 14155,
			reagents = {
				{14048, 4},
				{14342},
				{14341},
			},
		},
				[18446] = {
			item = 14128,
			reagents = {
				{14048, 8},
				{11176, 2},
				{14341},
			},
		},
		[18447] = {
			item = 14138,
			reagents = {
				{14048, 6},
				{14342, 4},
				{14341},
			},
		},
		[18448] = {
			item = 14139,
			reagents = {
				{14048, 5},
				{14342, 5},
				{14341},
			},
		},
				[18449] = {
			item = 13867,
			reagents = {
				{14048, 7},
				{14227, 2},
				{8170, 4},
				{14341},
			},
		},
				[18450] = {
			item = 14130,
			reagents = {
				{14048, 6},
				{11176, 4},
				{7910},
				{14341},
			},
		},
				[18451] = {
			item = 14106,
			reagents = {
				{14048, 8},
				{14256, 8},
				{12662, 4},
				{14341, 2},
			},
		},
		[18452] = {
			item = 14140,
			reagents = {
				{14048, 4},
				{14342, 6},
				{12800},
				{12810, 2},
				{14341, 2},
			},
		},
		[18453] = {
			item = 14112,
			reagents = {
				{14048, 7},
				{14256, 6},
				{12662, 4},
				{8170, 4},
				{14341, 2},
			},
		},
				[18454] = {
			item = 14146,
			reagents = {
				{14048, 10},
				{14342, 10},
				{9210, 10},
				{13926, 6},
				{12364, 6},
				{12810, 8},
				{14341, 2},
			},
		},
		[18455] = {
			item = 14156,
			reagents = {
				{14048, 8},
				{14342, 12},
				{14344, 2},
				{17012, 2},
				{14341, 2},
			},
		},
		[18456] = {
			item = 14154,
			reagents = {
				{14048, 12},
				{14342, 10},
				{12811, 4},
				{13926, 4},
				{9210, 10},
				{14341, 2},
			},
		},
		[18457] = {
			item = 14152,
			reagents = {
				{14048, 12},
				{7078, 10},
				{7082, 10},
				{7076, 10},
				{7080, 10},
				{14341, 2},
			},
		},
		[18458] = {
			item = 14153,
			reagents = {
				{14048, 12},
				{12662, 20},
				{14256, 40},
				{7078, 12},
				{12808, 12},
				{14341, 2},
			},
		},
		[18560] = {
			requires = L["Moonwell"],
			item = 14342,
			reagents = {
				{14256, 2},
			},
		},
		[18629] = {
			item = 14529,
			reagents = {
				{14047},
			},
		},
		[18630] = {
			item = 14530,
			reagents = {
				{14047, 2},
			},
		},
		[19047] = {
			item = 15407,
			reagents = {
				{8171},
				{15409},
			},
		},
		[19048] = {
			item = 15077,
			reagents = {
				{8170, 4},
				{15408, 4},
				{14341},
			},
		},
		[19049] = {
			item = 15083,
			reagents = {
				{8170, 8},
				{2325},
				{14341},
			},
		},
		[19050] = {
			item = 15045,
			reagents = {
				{8170, 20},
				{15412, 25},
				{14341, 2},
			},
		},
		[19051] = {
			item = 15076,
			reagents = {
				{8170, 6},
				{15408, 6},
				{14341},
			},
		},
		[19052] = {
			item = 15084,
			reagents = {
				{8170, 8},
				{2325},
				{14341},
			},
		},
		[19053] = {
			item = 15074,
			reagents = {
				{8170, 6},
				{15423, 6},
				{14341},
			},
		},
		[19054] = {
			item = 15047,
			reagents = {
				{8170, 40},
				{15414, 30},
				{14341},
			},
		},
		[19055] = {
			item = 15091,
			reagents = {
				{8170, 10},
				{14047, 6},
				{14341},
			},
		},
		[19058] = {
			item = 15564,
			reagents = {
				{8170, 5},
			},
		},
		[19059] = {
			item = 15054,
			reagents = {
				{8170, 6},
				{7078},
				{7075},
				{14341},
			},
		},
		[19060] = {
			item = 15046,
			reagents = {
				{8170, 20},
				{15412, 25},
				{14341, 2},
			},
		},
		[19061] = {
			item = 15061,
			reagents = {
				{8170, 12},
				{12803, 4},
				{14341},
			},
		},
		[19062] = {
			item = 15067,
			reagents = {
				{8170, 24},
				{15420, 80},
				{1529, 2},
				{14341},
			},
		},
		[19063] = {
			item = 15073,
			reagents = {
				{8170, 4},
				{15423, 8},
				{14341},
			},
		},
		[19064] = {
			item = 15078,
			reagents = {
				{8170, 6},
				{15408, 8},
				{14341},
			},
		},
		[19065] = {
			item = 15092,
			reagents = {
				{8170, 6},
				{7971},
				{14047, 6},
				{14341},
			},
		},
		[19066] = {
			item = 15071,
			reagents = {
				{8170, 4},
				{15422, 6},
				{14341},
			},
		},
		[19067] = {
			item = 15057,
			reagents = {
				{8170, 16},
				{7080, 2},
				{7082, 2},
				{14341},
			},
		},
		[19068] = {
			item = 15064,
			reagents = {
				{8170, 28},
				{15419, 12},
				{14341},
			},
		},
		[19070] = {
			item = 15082,
			reagents = {
				{8170, 6},
				{15408, 8},
				{14341},
			},
		},
		[19071] = {
			item = 15086,
			reagents = {
				{8170, 12},
				{2325},
				{14341},
			},
		},
		[19072] = {
			item = 15093,
			reagents = {
				{8170, 12},
				{14047, 10},
				{14341},
			},
		},
		[19073] = {
			item = 15072,
			reagents = {
				{8170, 8},
				{15423, 8},
				{14341},
			},
		},
		[19074] = {
			item = 15069,
			reagents = {
				{8170, 6},
				{15422, 8},
				{14341},
			},
		},
		[19075] = {
			item = 15079,
			reagents = {
				{8170, 8},
				{15408, 12},
				{14341},
			},
		},
		[19076] = {
			item = 15053,
			reagents = {
				{8170, 8},
				{7078},
				{7076},
				{14341},
			},
		},
		[19077] = {
			item = 15048,
			reagents = {
				{8170, 28},
				{15415, 30},
				{15407},
				{14341},
			},
		},
		[19078] = {
			item = 15060,
			reagents = {
				{8170, 16},
				{12803, 6},
				{15407},
				{14341},
			},
		},
		[19079] = {
			item = 15056,
			reagents = {
				{8170, 16},
				{7080, 3},
				{7082, 3},
				{15407},
				{14341},
			},
		},
		[19080] = {
			item = 15065,
			reagents = {
				{8170, 24},
				{15419, 14},
				{14341},
			},
		},
		[19081] = {
			item = 15075,
			reagents = {
				{8170, 10},
				{12803},
				{14341},
			},
		},
		[19082] = {
			item = 15094,
			reagents = {
				{8170, 14},
				{14047, 10},
				{14341},
			},
		},
		[19083] = {
			item = 15087,
			reagents = {
				{8170, 16},
				{15407, 10},
				{2325, 3},
				{14341},
			},
		},
		[19084] = {
			item = 15063,
			reagents = {
				{8170, 30},
				{15417, 8},
				{14341},
			},
		},
		[19085] = {
			item = 15050,
			reagents = {
				{8170, 40},
				{15415, 60},
				{15407},
				{14341, 2},
			},
		},
		[19086] = {
			item = 15066,
			reagents = {
				{8170, 40},
				{15420, 120},
				{1529},
				{15407},
				{14341},
			},
		},
		[19087] = {
			item = 15070,
			reagents = {
				{8170, 6},
				{15422, 10},
				{14341},
			},
		},
		[19088] = {
			item = 15080,
			reagents = {
				{8170, 8},
				{15408, 12},
				{15407},
				{14341},
			},
		},
		[19089] = {
			item = 15049,
			reagents = {
				{8170, 28},
				{15415, 30},
				{12810, 2},
				{15407},
				{14341},
			},
		},
		[19090] = {
			item = 15058,
			reagents = {
				{8170, 12},
				{7080, 3},
				{7082, 3},
				{12810, 2},
				{14341},
			},
		},
		[19091] = {
			item = 15095,
			reagents = {
				{8170, 18},
				{14047, 12},
				{12810, 2},
				{14341},
			},
		},
		[19092] = {
			item = 15088,
			reagents = {
				{8170, 14},
				{2325, 2},
				{14341, 2},
			},
		},
		[19093] = {
			item = 15138,
			reagents = {
				{15410},
				{14044},
				{14341},
			},
		},
		[19094] = {
			item = 15051,
			reagents = {
				{8170, 44},
				{15416, 45},
				{12810, 2},
				{15407},
				{14341},
			},
		},
		[19095] = {
			item = 15059,
			reagents = {
				{8170, 16},
				{12803, 8},
				{14342, 2},
				{15407},
				{14341, 2},
			},
		},
		[19097] = {
			item = 15062,
			reagents = {
				{8170, 30},
				{15417, 14},
				{15407},
				{14341},
			},
		},
		[19098] = {
			item = 15085,
			reagents = {
				{8170, 20},
				{15407, 2},
				{14256, 6},
				{2325, 4},
				{14341, 2},
			},
		},
		[19100] = {
			item = 15081,
			reagents = {
				{8170, 14},
				{15408, 14},
				{15407},
				{14341, 2},
			},
		},
		[19101] = {
			item = 15055,
			reagents = {
				{8170, 10},
				{7078},
				{7076},
				{14341, 2},
			},
		},
		[19102] = {
			item = 15090,
			reagents = {
				{8170, 22},
				{12810, 4},
				{14047, 16},
				{15407},
				{14341, 2},
			},
		},
		[19103] = {
			item = 15096,
			reagents = {
				{8170, 16},
				{12810, 4},
				{14047, 18},
				{15407},
				{14341, 2},
			},
		},
		[19104] = {
			item = 15068,
			reagents = {
				{8170, 12},
				{15422, 12},
				{15407},
				{14341, 2},
			},
		},
		[19107] = {
			item = 15052,
			reagents = {
				{8170, 40},
				{15416, 60},
				{12810, 4},
				{15407},
				{14341, 2},
			},
		},
		[19435] = {
			item = 15802,
			reagents = {
				{14048, 6},
				{14342, 4},
				{7971, 2},
				{14341},
			},
		},
		[19567] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 15846,
			reagents = {
				{10561},
				{12359, 6},
				{10558},
				{10560, 4},
			},
		},
		[19666] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 15869,
			quantity = 2,
			reagents = {
				{2842},
				{3470},
			},
		},
		[19667] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 15870,
			quantity = 2,
			reagents = {
				{3577},
				{3486},
			},
		},
		[19668] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 15871,
			quantity = 2,
			reagents = {
				{6037},
				{7966},
			},
		},
		[19669] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 15872,
			quantity = 2,
			reagents = {
				{12360},
				{12644},
			},
		},
		[19788] = {
			item = 15992,
			reagents = {
				{12365, 2},
			},
		},
		[19790] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 15993,
			quantity = 3,
			reagents = {
				{15994},
				{12359, 3},
				{15992, 3},
				{14047, 3},
			},
		},
		[19791] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 15994,
			reagents = {
				{12359, 3},
				{14047},
			},
		},
		[19792] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 15995,
			reagents = {
				{10559, 2},
				{10561, 2},
				{15994, 2},
				{12359, 4},
				{10546},
			},
		},
		[19793] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 15996,
			reagents = {
				{12803},
				{15994, 4},
				{10558},
				{8170},
			},
		},
		[19794] = {
			tools = {6219, 10498},
			item = 15999,
			reagents = {
				{10502},
				{7910, 4},
				{12810, 2},
				{14047, 8},
			},
		},
		[19795] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 16000,
			reagents = {
				{12359, 6},
			},
		},
		[19796] = {
			requires = L["Black Anvil"],
			tools = {5956, 6219},
			item = 16004,
			reagents = {
				{16000, 2},
				{11371, 6},
				{10546, 2},
				{12361, 2},
				{12799, 2},
				{8170, 4},
			},
		},
		[19799] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 16005,
			quantity = 3,
			reagents = {
				{15994, 2},
				{11371},
				{15992, 3},
				{14047, 3},
			},
		},
		[19800] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 15997,
			quantity = 200,
			reagents = {
				{12359, 2},
				{15992},
			},
		},
		[19814] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 16023,
			reagents = {
				{10561},
				{16000},
				{15994, 2},
				{6037},
				{8170, 2},
				{14047, 4},
			},
		},
		[19815] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 16006,
			reagents = {
				{12360},
				{14227},
			},
		},
		[19819] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 16009,
			reagents = {
				{16006, 2},
				{10558},
				{15994},
				{12799},
			},
		},
		[19825] = {
			tools = {6219, 10498},
			item = 16008,
			reagents = {
				{10500},
				{12364, 2},
				{12810, 4},
			},
		},
		[19830] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 16022,
			reagents = {
				{10576},
				{16006, 8},
				{12655, 10},
				{15994, 6},
				{10558, 4},
				{12810, 6},
			},
		},
		[19831] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 16040,
			quantity = 3,
			reagents = {
				{16006},
				{12359, 3},
				{14047},
			},
		},
		[19833] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 16007,
			reagents = {
				{12360, 10},
				{16000, 2},
				{7078, 2},
				{7076, 2},
				{12800, 2},
				{12810, 2},
			},
		},
		[20201] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 16206,
			reagents = {
				{12360, 3},
				{12644},
			},
		},
		[20626] = {
			requires = L["Cooking Fire"],
			item = 16766,
			quantity = 2,
			reagents = {
				{7974, 2},
				{2692},
				{1179},
			},
		},
		[20648] = {
			item = 2319,
			reagents = {
				{2318, 4},
			},
		},
		[20649] = {
			item = 4234,
			reagents = {
				{2319, 5},
			},
		},
		[20650] = {
			item = 4304,
			reagents = {
				{4234, 6},
			},
		},
				[20848] = {
			item = 16980,
			reagents = {
				{14342, 6},
				{17010, 4},
				{17011, 4},
				{12810, 6},
				{14341, 2},
			},
		},
				[20849] = {
			item = 16979,
			reagents = {
				{14342, 4},
				{17010, 6},
				{7078, 4},
				{12810, 2},
				{14341, 2},
			},
		},
		[20853] = {
			item = 16982,
			reagents = {
				{17012, 20},
				{17010, 6},
				{17011, 2},
				{14341, 2},
			},
		},
		[20854] = {
			item = 16983,
			reagents = {
				{17012, 15},
				{17010, 3},
				{17011, 6},
				{14341, 2},
			},
		},
		[20855] = {
			item = 16984,
			reagents = {
				{12810, 6},
				{15416, 30},
				{17010, 4},
				{17011, 3},
				{14341, 2},
			},
		},
		[20872] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 16989,
			reagents = {
				{11371, 6},
				{17010, 3},
				{17011, 3},
			},
		},
		[20873] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 16988,
			reagents = {
				{11371, 16},
				{17010, 4},
				{17011, 5},
			},
		},
		[20874] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 17014,
			reagents = {
				{11371, 4},
				{17010, 2},
				{17011, 2},
			},
		},
		[20876] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 17013,
			reagents = {
				{11371, 16},
				{17010, 4},
				{17011, 6},
			},
		},
		[20890] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 17015,
			reagents = {
				{11371, 16},
				{17010, 12},
				{11382, 2},
				{12810, 2},
			},
		},
		[20897] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 17016,
			reagents = {
				{11371, 18},
				{17011, 12},
				{11382, 2},
				{12644, 2},
			},
		},
		[20916] = {
			requires = L["Cooking Fire"],
			item = 8364,
			reagents = {
				{8365},
			},
		},
		[21143] = {
			requires = L["Cooking Fire"],
			item = 17197,
			reagents = {
				{6889},
				{17194},
			},
		},
		[21144] = {
			requires = L["Cooking Fire"],
			item = 17198,
			reagents = {
				{6889},
				{1179},
				{17196},
				{17194},
			},
		},
		[21161] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 17193,
			reagents = {
				{17203, 8},
				{11371, 20},
				{12360, 50},
				{7078, 25},
				{11382, 10},
				{17011, 10},
				{17010, 10},
			},
		},
		[21175] = {
			requires = L["Cooking Fire"],
			item = 17222,
			reagents = {
				{12205, 2},
			},
		},
		[21913] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 17704,
			reagents = {
				{3859, 10},
				{3829},
				{7070, 2},
				{7069, 2},
				{4234, 2},
			},
		},
		[21923] = {
			item = 17708,
			reagents = {
				{3819, 2},
				{3358},
				{3372},
			},
		},
		[21940] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 17716,
			reagents = {
				{3860, 8},
				{4389, 4},
				{17202, 4},
				{3829},
			},
		},
		[21943] = {
			item = 17721,
			reagents = {
				{4234, 8},
				{7067, 4},
				{4291},
			},
		},
		[21945] = {
			item = 17723,
			reagents = {
				{4305, 5},
				{2605, 4},
				{4291},
			},
		},
		[22331] = {
			item = 8170,
			reagents = {
				{4304, 6},
			},
		},
		[22480] = {
			requires = L["Cooking Fire"],
			item = 18045,
			reagents = {
				{12208},
				{3713},
			},
		},
		[22704] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18232,
			reagents = {
				{12359, 12},
				{8170, 4},
				{7191},
				{7067, 2},
				{7068},
			},
		},
		[22711] = {
			item = 18238,
			reagents = {
				{4304, 6},
				{7428, 8},
				{7971, 2},
				{4236, 2},
				{1210, 4},
				{8343},
			},
		},
		[22727] = {
			item = 18251,
			reagents = {
				{17012, 3},
				{14341, 2},
			},
		},
		[22732] = {
			item = 18253,
			reagents = {
				{10286},
				{13464, 4},
				{13463, 4},
				{18256},
			},
		},
		[22757] = {
			item = 18262,
			reagents = {
				{7067, 2},
				{12365, 3},
			},
		},
				[22759] = {
			item = 18263,
			reagents = {
				{14342, 6},
				{17010, 8},
				{7078, 2},
				{12810, 6},
				{14341, 4},
			},
		},
		[22761] = {
			requires = L["Cooking Fire"],
			item = 18254,
			reagents = {
				{18255},
				{3713},
			},
		},
		[22793] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18283,
			reagents = {
				{17011, 2},
				{7076, 2},
				{16006, 4},
				{11371, 6},
				{16000},
			},
		},
		[22795] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18282,
			reagents = {
				{17010, 4},
				{17011, 2},
				{12360, 6},
				{16006, 2},
				{16000, 2},
			},
		},
		[22797] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18168,
			reagents = {
				{12360, 6},
				{16006, 2},
				{7082, 8},
				{12803, 12},
				{7076, 8},
			},
		},
		[22808] = {
			item = 18294,
			reagents = {
				{7972},
				{8831, 2},
				{8925},
			},
		},
		[22813] = {
			item = 18258,
			reagents = {
				{14048, 2},
				{8170, 4},
				{18240},
				{14341},
			},
		},
		[22815] = {
			item = 18258,
			reagents = {
				{8170, 4},
				{14048, 2},
				{18240},
				{14341},
			},
		},
		[22866] = {
			item = 18405,
			reagents = {
				{14048, 16},
				{9210, 10},
				{14342, 10},
				{7080, 12},
				{7078, 12},
				{14344, 6},
				{14341, 6},
			},
		},
		[22867] = {
			item = 18407,
			reagents = {
				{14048, 12},
				{14256, 20},
				{12662, 6},
				{12808, 8},
				{14341, 2},
			},
		},
		[22868] = {
			item = 18408,
			reagents = {
				{14048, 12},
				{7078, 10},
				{7910, 2},
				{14341, 2},
			},
		},
		[22869] = {
			item = 18409,
			reagents = {
				{14048, 12},
				{14342, 6},
				{13926, 2},
				{14341, 2},
			},
		},
		[22870] = {
			item = 18413,
			reagents = {
				{14048, 12},
				{12809, 4},
				{12360},
				{14341, 2},
			},
		},
		[22902] = {
			item = 18486,
			reagents = {
				{14048, 6},
				{14342, 4},
				{13926, 2},
				{14341, 2},
			},
		},
		[22921] = {
			item = 18504,
			reagents = {
				{8170, 12},
				{12804, 12},
				{15407, 2},
				{14341, 4},
			},
		},
		[22922] = {
			item = 18506,
			reagents = {
				{8170, 12},
				{7082, 6},
				{11754, 4},
				{15407, 2},
				{14341, 4},
			},
		},
		[22923] = {
			item = 18508,
			reagents = {
				{8170, 12},
				{18512, 8},
				{15420, 60},
				{15407, 4},
				{14341, 4},
			},
		},
		[22926] = {
			item = 18509,
			reagents = {
				{8170, 30},
				{12607, 12},
				{15416, 30},
				{15414, 30},
				{15407, 5},
				{14341, 8},
			},
		},
		[22927] = {
			item = 18510,
			reagents = {
				{8170, 30},
				{12803, 12},
				{7080, 10},
				{18512, 8},
				{15407, 3},
				{14341, 8},
			},
		},
		[22928] = {
			item = 18511,
			reagents = {
				{8170, 30},
				{7082, 12},
				{12753, 4},
				{12809, 8},
				{15407, 4},
				{14341, 8},
			},
		},
		[22967] = {
			name = "Smelting: Smelt Elementium",
			requires = L["Forge"],
			text = "Allows the miner to smelt a chunk of elementium ore, ten arcanite bars, a fiery core and three elemental fluxes into an elementium bar. Smelting elementium requires a forge.",
			item = 17771,
			reagents = {
				{18562},
				{12360, 10},
				{17010},
				{18567, 3},
			},
		},
		[23066] = {
			item = 9318,
			quantity = 3,
			reagents = {
				{4377},
				{4234},
			},
		},
		[23067] = {
			item = 9312,
			quantity = 3,
			reagents = {
				{4377},
				{4234},
			},
		},
		[23068] = {
			item = 9313,
			quantity = 3,
			reagents = {
				{4377},
				{4234},
			},
		},
		[23069] = {
			item = 18588,
			reagents = {
				{10505},
				{4338, 2},
			},
		},
		[23070] = {
			item = 18641,
			quantity = 2,
			reagents = {
				{15992, 2},
				{14047, 3},
			},
		},
		[23071] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18631,
			reagents = {
				{6037, 2},
				{7067, 2},
				{7069},
			},
		},
		[23077] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18634,
			reagents = {
				{15994, 6},
				{18631, 2},
				{12361, 2},
				{7078, 4},
				{3829, 2},
				{13467, 4},
			},
		},
		[23078] = {
			item = 18587,
			reagents = {
				{15994, 2},
				{18631, 2},
				{7191, 2},
				{14227, 2},
				{7910, 2},
			},
		},
		[23079] = {
			item = 18637,
			extra = "|cffffffff10 "..L["Charges"],
			reagents = {
				{16000, 2},
				{18631},
				{14047, 2},
			},
		},
		[23080] = {
			item = 18594,
			reagents = {
				{15994, 2},
				{15992, 3},
				{8170, 2},
				{159},
			},
		},
		[23081] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18638,
			reagents = {
				{11371, 4},
				{18631, 3},
				{7080, 6},
				{7910, 4},
				{12800, 2},
			},
		},
		[23082] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18639,
			reagents = {
				{11371, 8},
				{18631, 4},
				{12803, 6},
				{12808, 4},
				{12800, 2},
				{12799, 2},
			},
		},
		[23096] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18645,
			reagents = {
				{12359, 4},
				{15994, 2},
				{8170, 4},
				{7910},
				{7191},
			},
		},
		[23129] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 18660,
			reagents = {
				{10561},
				{15994, 2},
				{10558},
				{10560},
				{3864},
			},
		},
		[23190] = {
			item = 18662,
			reagents = {
				{4234, 2},
				{2321},
			},
		},
		[23399] = {
			item = 18948,
			reagents = {
				{4234, 8},
				{4236, 2},
				{5498, 4},
				{4461},
				{5637, 4},
			},
		},
		[23486] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18984,
			reagents = {
				{3860, 10},
				{18631},
				{7077, 4},
				{7910, 2},
				{10586},
			},
		},
		[23489] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 18986,
			reagents = {
				{3860, 12},
				{18631, 2},
				{7075, 4},
				{7079, 2},
				{7909, 4},
				{9060},
			},
		},
		[23507] = {
			item = 19026,
			quantity = 4,
			reagents = {
				{15992, 2},
				{14047, 2},
				{8150},
			},
		},
		[23628] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19043,
			reagents = {
				{12359, 12},
				{7076, 3},
				{12803, 3},
			},
		},
		[23629] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19048,
			reagents = {
				{12360, 4},
				{7076, 6},
				{12803, 6},
			},
		},
		[23632] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19051,
			reagents = {
				{12359, 8},
				{6037, 6},
				{12811},
			},
		},
		[23633] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19057,
			reagents = {
				{12360, 2},
				{6037, 10},
				{12811},
			},
		},
		[23636] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 19148,
			reagents = {
				{17011, 4},
				{17010, 2},
				{11371, 4},
			},
		},
		[23637] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 19164,
			reagents = {
				{17011, 3},
				{17010, 5},
				{17012, 4},
				{11371, 4},
				{11382, 2},
			},
		},
		[23638] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 19166,
			reagents = {
				{17011, 3},
				{17010, 6},
				{12360, 12},
				{11382},
				{11371, 4},
			},
		},
		[23639] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 19167,
			reagents = {
				{17011, 5},
				{17010, 2},
				{12360, 16},
				{11371, 6},
			},
		},
		[23650] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 19170,
			reagents = {
				{17011, 4},
				{17010, 7},
				{12360, 12},
				{11371, 8},
				{12800, 4},
			},
		},
		[23652] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 19168,
			reagents = {
				{17011, 6},
				{17010, 6},
				{12360, 10},
				{11371, 6},
				{12809, 12},
			},
		},
		[23653] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 19169,
			reagents = {
				{17011, 8},
				{17010, 5},
				{12360, 10},
				{11371, 12},
				{12364, 4},
			},
		},
		[23662] = {
			item = 19047,
			reagents = {
				{14048, 8},
				{7076, 3},
				{12803, 3},
				{14227, 2},
			},
		},
		[23663] = {
			item = 19050,
			reagents = {
				{14342, 5},
				{7076, 5},
				{12803, 5},
				{14227, 2},
			},
		},
		[23664] = {
			item = 19056,
			reagents = {
				{14048, 6},
				{12810, 4},
				{13926, 2},
				{12809, 2},
				{14227, 2},
			},
		},
		[23665] = {
			item = 19059,
			reagents = {
				{14342, 5},
				{12809, 2},
				{14227, 2},
			},
		},
				[23666] = {
			item = 19156,
			reagents = {
				{14342, 10},
				{17010, 2},
				{17011, 3},
				{7078, 6},
				{14227, 4},
			},
		},
				[23667] = {
			item = 19165,
			reagents = {
				{14342, 8},
				{17010, 5},
				{17011, 3},
				{7078, 10},
				{14227, 4},
			},
		},
		[23703] = {
			item = 19044,
			reagents = {
				{8170, 30},
				{12804, 2},
				{12803, 4},
				{15407, 2},
				{14341, 2},
			},
		},
		[23704] = {
			item = 19049,
			reagents = {
				{12810, 8},
				{12804, 6},
				{12803, 6},
				{15407, 2},
				{14227, 2},
			},
		},
		[23705] = {
			item = 19052,
			reagents = {
				{8170, 30},
				{12809, 2},
				{7080, 4},
				{15407, 2},
				{14341, 2},
			},
		},
		[23706] = {
			item = 19058,
			reagents = {
				{12810, 8},
				{12803, 4},
				{12809, 4},
				{15407, 2},
				{14341, 2},
			},
		},
		[23707] = {
			item = 19149,
			reagents = {
				{17011, 5},
				{15407, 4},
				{14227, 4},
			},
		},
		[23708] = {
			item = 19157,
			reagents = {
				{17010, 5},
				{17011, 2},
				{17012, 4},
				{12607, 4},
				{15407, 4},
				{14227, 4},
			},
		},
		[23709] = {
			item = 19162,
			reagents = {
				{17010, 8},
				{17012, 12},
				{12810, 10},
				{15407, 4},
				{14227, 4},
			},
		},
		[23710] = {
			item = 19163,
			reagents = {
				{17010, 2},
				{17011, 7},
				{7076, 6},
				{15407, 4},
				{14227, 4},
			},
		},
		[23787] = {
			item = 19440,
			reagents = {
				{19441},
			},
		},
		[24091] = {
			item = 19682,
			reagents = {
				{14342, 3},
				{19726, 5},
				{12804, 4},
				{14048, 4},
				{14227, 2},
			},
		},
		[24092] = {
			item = 19683,
			reagents = {
				{14342, 4},
				{19726, 4},
				{12804, 4},
				{14048, 4},
				{14227, 2},
			},
		},
		[24093] = {
			item = 19684,
			reagents = {
				{14342, 3},
				{19726, 3},
				{12810, 4},
				{14048, 4},
				{14227, 4},
			},
		},
		[24121] = {
			item = 19685,
			reagents = {
				{19767, 14},
				{15407, 5},
				{12803, 4},
				{14341, 4},
			},
		},
		[24122] = {
			item = 19686,
			reagents = {
				{19767, 10},
				{15407, 4},
				{12803, 4},
				{14341, 3},
			},
		},
		[24123] = {
			item = 19687,
			reagents = {
				{19767, 8},
				{15407, 3},
				{12803, 4},
				{14341, 3},
			},
		},
		[24124] = {
			item = 19688,
			reagents = {
				{19768, 35},
				{19726, 2},
				{15407, 3},
				{14341, 3},
			},
		},
		[24125] = {
			item = 19689,
			reagents = {
				{19768, 25},
				{19726, 2},
				{15407, 3},
				{14341, 3},
			},
		},
		[24136] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19690,
			reagents = {
				{12359, 20},
				{19774, 10},
				{19726, 2},
				{7910, 2},
			},
		},
		[24137] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19691,
			reagents = {
				{12359, 16},
				{19774, 8},
				{19726, 2},
				{7910},
			},
		},
		[24138] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19691,
			reagents = {
				{12359, 12},
				{19774, 6},
				{19726, 2},
				{12810, 4},
			},
		},
		[24139] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19693,
			reagents = {
				{12359, 20},
				{19774, 14},
				{12799, 2},
			},
		},
		[24140] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19694,
			reagents = {
				{12359, 18},
				{19774, 12},
				{12799, 2},
			},
		},
		[24141] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 19695,
			reagents = {
				{12359, 16},
				{19774, 10},
				{12799},
			},
		},
		[24266] = {
			item = 19931,
			quantity = 3,
			reagents = {
				{12938},
				{19943},
				{12804, 6},
				{13468},
			},
		},
		[24356] = {
			tools = {10498, 6219},
			item = 19999,
			reagents = {
				{19726, 4},
				{19774, 5},
				{16006, 2},
				{12804, 8},
				{12810, 4},
			},
		},
		[24357] = {
			tools = {10498, 6219},
			item = 19998,
			reagents = {
				{19726, 5},
				{19774, 5},
				{16006},
				{12804, 8},
				{12810, 4},
			},
		},
		[24365] = {
			item = 20007,
			reagents = {
				{13463},
				{13466, 2},
				{8925},
			},
		},
		[24366] = {
			item = 20002,
			reagents = {
				{13463, 2},
				{13464},
				{8925},
			},
		},
		[24367] = {
			item = 20008,
			reagents = {
				{13467, 2},
				{13465, 2},
				{10286, 2},
				{8925},
			},
		},
		[24368] = {
			item = 20004,
			reagents = {
				{8846},
				{13466, 2},
				{8925},
			},
		},
		[24399] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 20039,
			extra = "|cff00ff00"..L["<Random enchantment>"],
			reagents = {
				{17011, 3},
				{17010, 3},
				{17012, 4},
				{11371, 6},
			},
		},
		[24418] = {
			requires = L["Cooking Fire"],
			item = 20074,
			reagents = {
				{3667, 2},
				{3713},
			},
		},
		[24654] = {
			item = 20295,
			reagents = {
				{8170, 28},
				{15415, 36},
				{15407, 2},
				{14341, 2},
			},
		},
		[24655] = {
			item = 20296,
			reagents = {
				{8170, 20},
				{15412, 30},
				{15407},
				{14341, 2},
			},
		},
		[24703] = {
			item = 20380,
			reagents = {
				{12810, 12},
				{20381, 6},
				{12803, 4},
				{15407, 4},
				{14227, 6},
			},
		},
		[24801] = {
			requires = L["Cooking Fire"],
			item = 20452,
			reagents = {
				{20424},
				{3713},
			},
		},
		[24846] = {
			item = 20481,
			reagents = {
				{20500},
				{20498, 20},
				{7078, 2},
			},
		},
		[24847] = {
			item = 20480,
			reagents = {
				{20500, 2},
				{20498, 30},
				{7078, 2},
				{15407},
			},
		},
		[24848] = {
			item = 20479,
			reagents = {
				{20500, 3},
				{20498, 40},
				{7078, 2},
				{15407, 2},
			},
		},
		[24849] = {
			item = 20476,
			reagents = {
				{20501},
				{20498, 20},
				{18512, 2},
			},
		},
		[24850] = {
			item = 20477,
			reagents = {
				{20501, 2},
				{20498, 30},
				{18512, 2},
				{15407},
			},
		},
		[24851] = {
			item = 20478,
			reagents = {
				{20501, 3},
				{20498, 40},
				{18512, 2},
				{15407, 2},
			},
		},
		[24901] = {
			item = 20538,
			reagents = {
				{14048, 6},
				{20520, 8},
				{14256, 6},
				{14227, 2},
			},
		},
		[24902] = {
			item = 20539,
			reagents = {
				{14048, 2},
				{20520, 6},
				{14256, 2},
				{12810, 2},
				{14227, 2},
			},
		},
		[24903] = {
			item = 20537,
			reagents = {
				{14048, 4},
				{20520, 6},
				{14256, 4},
				{12810, 2},
				{14227, 2},
			},
		},
		[24912] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 20549,
			reagents = {
				{12359, 12},
				{20520, 6},
				{6037, 6},
				{12810, 2},
			},
		},
		[24913] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 20551,
			reagents = {
				{12359, 16},
				{20520, 8},
				{6037, 8},
				{11754},
			},
		},
		[24914] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 20550,
			reagents = {
				{12359, 20},
				{20520, 10},
				{6037, 10},
			},
		},
		[24940] = {
			item = 20575,
			reagents = {
				{2319, 8},
				{7286, 8},
				{4231},
				{2321, 2},
			},
		},
		[25146] = {
			name = "Transmute: Elemental Fire",
			tools = {9149},
			text = "Transmutes a Heart of Fire into three Elemental Fires.",
			item = 7068,
			quantity = 3,
			reagents = {
				{7077},
			},
		},
		[25347] = {
			item = 20844,
			reagents = {
				{5173, 7},
				{8925},
			},
		},
		[25659] = {
			requires = L["Cooking Fire"],
			item = 21023,
			quantity = 5,
			reagents = {
				{2692},
				{9061},
				{8150},
				{21024},
			},
		},
		[25704] = {
			requires = L["Cooking Fire"],
			item = 21072,
			reagents = {
				{21071},
				{2678},
			},
		},
		[25954] = {
			requires = L["Cooking Fire"],
			item = 21217,
			reagents = {
				{21153},
				{2692},
			},
		},
		[26011] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 21277,
			reagents = {
				{15407},
				{15994, 4},
				{7079, 2},
				{18631, 2},
				{10558},
			},
		},
		[26085] = {
			item = 21340,
			reagents = {
				{14048, 6},
				{8170, 4},
				{7972, 2},
				{14341},
			},
		},
		[26086] = {
			item = 21341,
			reagents = {
				{14256, 12},
				{12810, 6},
				{20520, 2},
				{14227, 4},
			},
		},
		[26087] = {
			item = 21342,
			reagents = {
				{14256, 20},
				{17012, 16},
				{19726, 8},
				{7078, 4},
				{14227, 4},
			},
		},
		[26277] = {
			item = 21546,
			reagents = {
				{6371, 3},
				{4625, 3},
				{8925},
			},
		},
		[26279] = {
			item = 21278,
			reagents = {
				{12810, 6},
				{7080, 4},
				{7082, 4},
				{15407, 2},
				{14227, 2},
			},
		},
		[26403] = {
			item = 21154,
			reagents = {
				{14048, 4},
				{4625, 2},
				{2604, 2},
				{14341},
			},
		},
		[26407] = {
			item = 21542,
			reagents = {
				{14048, 4},
				{4625, 2},
				{2604, 2},
				{14341},
			},
		},
		[26416] = {
			item = 21558,
			quantity = 3,
			reagents = {
				{4364},
				{2319},
			},
		},
		[26417] = {
			item = 21559,
			quantity = 3,
			reagents = {
				{4364},
				{2319},
			},
		},
		[26418] = {
			item = 21557,
			quantity = 3,
			reagents = {
				{4364},
				{2319},
			},
		},
		[26420] = {
			item = 21589,
			quantity = 3,
			reagents = {
				{4377},
				{4234},
			},
		},
		[26421] = {
			item = 21590,
			quantity = 3,
			reagents = {
				{4377},
				{4234},
			},
		},
		[26422] = {
			item = 21592,
			quantity = 3,
			reagents = {
				{4377},
				{4234},
			},
		},
		[26423] = {
			item = 21571,
			quantity = 3,
			reagents = {
				{10505},
				{4304},
			},
		},
		[26424] = {
			item = 21574,
			quantity = 3,
			reagents = {
				{10505},
				{4304},
			},
		},
		[26425] = {
			item = 21576,
			quantity = 3,
			reagents = {
				{10505},
				{4304},
			},
		},
		[26426] = {
			item = 21714,
			quantity = 3,
			reagents = {
				{15992},
				{8170},
			},
		},
		[26427] = {
			item = 21716,
			quantity = 3,
			reagents = {
				{15992},
				{8170},
			},
		},
		[26428] = {
			item = 21718,
			quantity = 3,
			reagents = {
				{15992},
				{8170},
			},
		},
		[26442] = {
			item = 21569,
			reagents = {
				{9060},
				{9061},
				{10560},
				{10561},
			},
		},
		[26443] = {
			item = 21570,
			reagents = {
				{9060, 4},
				{9061, 4},
				{18631, 2},
				{10561},
			},
		},
		[27585] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22197,
			reagents = {
				{22202, 14},
				{12655, 4},
				{7076, 2},
			},
		},
		[27586] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22198,
			reagents = {
				{22203, 8},
				{22202, 24},
				{12655, 8},
				{7076, 4},
			},
		},
		[27587] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22196,
			reagents = {
				{22203, 18},
				{22202, 40},
				{12655, 12},
				{7076, 10},
				{12364, 4},
			},
		},
		[27588] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22195,
			reagents = {
				{22202, 14},
				{12810, 4},
			},
		},
		[27589] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22194,
			reagents = {
				{22203, 8},
				{22202, 24},
				{12810, 8},
				{13512},
			},
		},
		[27590] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22191,
			reagents = {
				{22203, 15},
				{22202, 36},
				{12810, 12},
				{12809, 10},
				{12800, 4},
			},
		},
		[27658] = {
			item = 22246,
			reagents = {
				{4339, 4},
				{11137, 4},
				{8343, 2},
			},
		},
		[27659] = {
			item = 22248,
			reagents = {
				{14048, 5},
				{16203, 2},
				{14341, 2},
			},
		},
		[27660] = {
			item = 22249,
			reagents = {
				{14048, 6},
				{14344, 4},
				{12810, 4},
				{14227, 4},
			},
		},
		[27724] = {
			item = 22251,
			reagents = {
				{14048, 5},
				{8831, 10},
				{11040, 8},
				{14341, 2},
			},
		},
		[27725] = {
			item = 22252,
			reagents = {
				{14048, 6},
				{14342, 2},
				{13468},
				{14227, 4},
			},
		},
		[27829] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22385,
			reagents = {
				{12360, 12},
				{12655, 20},
				{7076, 10},
				{13510, 2},
			},
		},
		[27830] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22384,
			reagents = {
				{12360, 15},
				{11371, 10},
				{12808, 20},
				{20520, 20},
				{15417, 10},
				{12753, 2},
			},
		},
		[27832] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22383,
			reagents = {
				{12360, 12},
				{20725, 2},
				{13512, 2},
				{12810, 4},
			},
		},
		[28205] = {
			item = 22654,
			reagents = {
				{22682, 5},
				{14048, 4},
				{7080, 4},
				{14227, 4},
			},
		},
		[28207] = {
			item = 22652,
			reagents = {
				{22682, 7},
				{14048, 8},
				{7080, 6},
				{14227, 8},
			},
		},
		[28208] = {
			item = 22658,
			reagents = {
				{22682, 5},
				{14048, 4},
				{7080, 2},
				{14227, 4},
			},
		},
		[28209] = {
			item = 22655,
			reagents = {
				{22682, 4},
				{14048, 2},
				{7080, 2},
				{14227, 4},
			},
		},
		[28210] = {
			item = 22660,
			reagents = {
				{19726},
				{14342, 2},
				{12803, 4},
				{14227, 4},
			},
		},
		[28219] = {
			item = 22661,
			reagents = {
				{22682, 7},
				{12810, 16},
				{7080, 2},
				{15407, 4},
				{14227, 4},
			},
		},
		[28220] = {
			item = 22662,
			reagents = {
				{22682, 5},
				{12810, 12},
				{7080, 2},
				{15407, 3},
				{14227, 4},
			},
		},
		[28221] = {
			item = 22663,
			reagents = {
				{22682, 4},
				{12810, 12},
				{7080, 2},
				{15407, 2},
				{14227, 4},
			},
		},
		[28222] = {
			item = 22664,
			reagents = {
				{22682, 7},
				{15408, 24},
				{7080, 2},
				{15407, 4},
				{14227, 4},
			},
		},
		[28223] = {
			item = 22666,
			reagents = {
				{22682, 5},
				{15408, 16},
				{7080, 2},
				{15407, 3},
				{14227, 4},
			},
		},
		[28224] = {
			item = 22665,
			reagents = {
				{22682, 4},
				{15408, 16},
				{7080, 2},
				{15407, 2},
				{14227, 4},
			},
		},
		[28242] = {
			requires = L["Icebellow Anvil"],
			tools = {5956},
			item = 22669,
			reagents = {
				{22682, 7},
				{12359, 16},
				{12360, 2},
				{7080, 4},
			},
		},
		[28243] = {
			requires = L["Icebellow Anvil"],
			tools = {5956},
			item = 22670,
			reagents = {
				{22682, 5},
				{12359, 12},
				{12360, 2},
				{7080, 2},
			},
		},
		[28244] = {
			requires = L["Icebellow Anvil"],
			tools = {5956},
			item = 22671,
			reagents = {
				{22682, 4},
				{12359, 12},
				{12360, 2},
				{7080, 2},
			},
		},
		[28461] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22762,
			reagents = {
				{12655, 12},
				{19726, 2},
				{12360, 2},
				{12803, 2},
			},
		},
		[28462] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22763,
			reagents = {
				{12655, 8},
				{19726},
				{12803, 2},
			},
		},
		[28463] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 22764,
			reagents = {
				{12655, 6},
				{12803, 2},
			},
		},
		[28472] = {
			item = 22759,
			reagents = {
				{12810, 12},
				{19726, 2},
				{12803, 2},
				{15407, 2},
			},
		},
		[28473] = {
			item = 22760,
			reagents = {
				{12810, 6},
				{18512, 2},
				{12803, 2},
				{15407, 2},
			},
		},
		[28474] = {
			item = 22761,
			reagents = {
				{12810, 4},
				{12803, 2},
				{15407},
			},
		},
		[28480] = {
			item = 22756,
			reagents = {
				{14048, 4},
				{19726, 2},
				{12803, 2},
				{14227, 2},
			},
		},
		[28481] = {
			item = 22757,
			reagents = {
				{14048, 4},
				{14342, 2},
				{12803, 2},
				{14227, 2},
			},
		},
		[28482] = {
			item = 22758,
			reagents = {
				{14048, 2},
				{12803, 4},
				{14227, 2},
			},
		},
		[29728] = {
			item = 55150,
			reagents = {
				{2589},
				{2835},
			},
		},
		[29730] = {
			tools = {55155},
			item = 55156,
			reagents = {
				{2840, 2},
			},
		},
		[29732] = {
			tools = {55155},
			item = 55157,
			reagents = {
				{2840, 4},
			},
		},
		[36901] = { --1.18
			item = 55046,
			reagents = {
				{13467, 3},
				{8925, 1},
			},
		},
		[36903] = { --1.18
			item = 55048,
			reagents = {
				{8831, 3},
				{8925, 1},
			},
		},
		[36905] = { --1.18
			item = 55060,
			requires = L["Anvil"],
			tools = {41328,41326},
			reagents = {
				{55252, 4},
				{12360, 2},
				{12655, 16},
				{20725, 4},
				{11291, 20},
				{12800, 6},
				{55248, 4},
			},
		},
		[36907] = { --1.18
			item = 55058,
			requires = L["Anvil"],
			tools = {5956},
			reagents = {
				{12360, 3},
				{12655, 12},
				{12799, 4},
				{13926, 4},
				{14341, 8},
				{7080, 6},
			},
		},
		[36909] = { --1.18
			item = 55050,
			reagents = {
				{12810, 10},
				{61673, 4},
				{16203, 4},
				{14341, 6},
			},
		},
		[36911] = { --1.18
			item = 55054,
			reagents = {
				{8165, 20},
				{15414, 5},
				{15415, 5},
				{15412, 5},
				{15416, 5},
				{8170, 30},
			},
		},
		[36913] = { --1.18
			item = 55052,
			reagents = {
				{14048, 12},
				{12361, 2},
				{55048, 5},
				{9210, 5},
			},
		},
		[36915] = { --1.18
			item = 55056,
			reagents = {
				{14342, 3},
				{14048, 8},
				{20725, 1},
				{16204, 40},
				{14341, 4},
				{9210, 10},
			},
		},
		[36929] = { --1.18
			item = 47410,
			reagents = {
				{13452, 1},
				{61224, 1},
				{8153, 6},
			},
		},
		[36932] = { --1.18
			item = 47412,
			reagents = {
				{9206, 1},
				{13454, 1},
				{8831, 6},
			},
		},
		[36935] = { --1.18
			item = 47414,
			reagents = {
				{12820, 1},
				{61423, 1},
				{8838, 6},
			},
		},
		[41001] = {
			tools = {55155},
			item = 55158,
			reagents = {
				{55156, 1},
				{55245, 1},
			},
		},
		[41003] = {
			tools = {55155},
			item = 81030,
			reagents = {
				{55156, 1},
				{774, 1},
				{55150, 1},
			},
		},
		[41005] = {
			tools = {55155},
			item = 55159,
			reagents = {
				{55156, 1},
				{2840, 1},
				{55150, 2},
			},
		},
		[41007] = {
			tools = {55155},
			item = 55160,
			reagents = {
				{55156, 1},
				{55245, 1},
				{55150, 4},
				{818, 1},
			},
		},
		[41009] = {
			tools = {55155},
			item = 81092,
			reagents = {
				{2840, 4},
				{55245, 1},
			},
		},
		[41011] = {
			tools = {55155},
			item = 55161,
			reagents = {
				{2840, 4},
				{55245, 2},
				{774, 1},
			},
		},
		[41013] = {
			tools = {55155},
			item = 55162,
			reagents = {
				{55156, 1},
				{5997, 1},
				{774, 1},
			},
		},
		[41015] = {
			tools = {55155},
			item = 55163,
			reagents = {
				{55156, 1},
				{55150, 1},
				{55245, 1},
				{818, 1},
			},
		},
		[41017] = {
			tools = {55155},
			item = 55165,
			reagents = {
				{2840, 10},
				{55150, 4},
				{5498, 2},
			},
		},
		[41019] = {
			tools = {55155},
			item = 55166,
			reagents = {
				{55156, 1},
				{55150, 1},
				{81094, 1},
			},
		},
		[41021] = {
			tools = {55155},
			item = 55167,
			reagents = {
				{55156, 1},
				{55245, 1},
				{1210, 1},
				{159, 5},
			},
		},
		[41023] = {
			tools = {55155},
			item = 81031,
			reagents = {
				{2840, 6},
				{774, 2},
				{55245, 1},
			},
		},
		[41025] = {
			tools = {55155},
			item = 55168,
			reagents = {
				{55156, 1},
				{774, 1},
				{2880, 1},
				{818, 1},
			},
		},
		[41027] = {
			tools = {55155},
			item = 55170,
			reagents = {
				{55156, 1},
				{81094, 2},
				{2880, 1},
				{55150, 1},
			},
		},
		[41029] = {
			tools = {55155},
			item = 55151,
			reagents = {
				{2592, 2},
				{2836, 2},
			},
		},
		[41031] = {
			tools = {55155},
			text = "May contain: Amber Topaz, Malachite, Tigerseye, Shadowgem",
			item = 81032,
			reagents = {
				{55150, 1},
				{2770, 1},
			},
		},
		[41033] = {
			tools = {55155},
			item = 55171,
			reagents = {
				{2840, 8},
				{81094, 1},
				{818, 1},
				{2880, 1},
				{1210, 1},
			},
		},
		[41035] = {
			tools = {55155},
			item = 55172,
			reagents = {
				{2840, 6},
				{81094, 3},
				{55245, 1},
				{55150, 4},
			},
		},
		[41037] = {
			tools = {55155},
			item = 55173,
			reagents = {
				{2840, 8},
				{5498, 1},
				{818, 1},
				{2880, 1},
				{55150, 2},
			},
		},
		[41039] = {
			tools = {55155},
			item = 55174,
			reagents = {
				{2841, 2},
			},
		},
		[41041] = {
			tools = {55155},
			item = 41308,
			reagents = {
				{55174, 1},
				{55246, 1},
				{2880, 2},
				{55151, 2},
			},
		},
		[41043] = {
			tools = {55155},
			item = 41309,
			reagents = {
				{2841, 2},
				{81094, 3},
				{55150, 4},
				{55245, 1},
			},
		},
		[41045] = {
			tools = {55155},
			item = 55175,
			reagents = {
				{2841, 8},
				{1210, 1},
				{81094, 1},
				{55151, 4},
				{55245, 2},
			},
		},
		[41047] = {
			tools = {55155},
			item = 55176,
			reagents = {
				{55174, 1},
				{2449, 3},
				{2836, 6},
				{2880, 4},
			},
		},
		[41049] = {
			tools = {55155},
			item = 41310,
			reagents = {
				{2841, 6},
				{2880, 2},
				{55245, 2},
			},
		},
		[41051] = {
			tools = {55155},
			item = 41311,
			reagents = {
				{55174, 1},
				{1210, 2},
				{55246, 1},
			},
		},
		[41053] = {
			tools = {55155},
			item = 41313,
			reagents = {
				{2841, 6},
				{55246, 1},
				{55151, 4},
			},
		},
		[41055] = {
			tools = {55155},
			item = 41312,
			reagents = {
				{2841, 6},
				{1210, 3},
				{785, 1},
				{55246, 1},
			},
		},
		[41057] = {
			tools = {55155},
			item = 41314,
			reagents = {
				{2841, 6},
				{1206, 1},
				{3466, 2},
				{55151, 2},
			},
		},
		[41059] = {
			tools = {55155},
			item = 41315,
			reagents = {
				{2841, 8},
				{1705, 3},
				{3466, 1},
				{55246, 1},
			},
		},
		[41061] = {
			tools = {55155},
			item = 41316,
			reagents = {
				{55174, 1},
				{1705, 2},
				{3385, 1},
			},
		},
		[41063] = {
			tools = {55155},
			item = 41318,
			reagents = {
				{2842, 3},  -- Silver Bar
				{10998, 1},  -- Lesser Astral Essence
				{1210, 1},  -- Shadowgem
			},
		},
		[41065] = {
			tools = {55155},
			text = "May contain: Crystal Quartz, Moss Agate, Lesser Moonstone.",
			item = 41320,
			reagents = {
				{2771, 2},
				{55151, 2},
			},
		},
		[41067] = {
			tools = {55155},
			item = 41319,
			reagents = {
				{2842, 2},
			},
		},
		[41069] = {
			tools = {55155, 41326},
			item = 41325,
			reagents = {
				{2842, 5},
				{3466, 1},
				{55246, 2},
				{55151, 2},
			},
		},
		[41071] = {
			tools = {55155, 41326},
			item = 41329,
			reagents = {
				{41319, 1},
				{3466, 2},
				{55246, 4},
				{55151, 8},
				{55249, 3},
				{1206, 3},
			},
		},
		[41073] = {
			requires = L["Anvil"],
			item = 41326,
			reagents = {
				{2841,2},
				{4371,2},
				{2319},
				{4404},
				{1705},
			},
		},
		[41077] = {
			requires = L["Anvil"],
			item = 41328,
			reagents = {
				{4389},
				{4387},
				{4382,3},
				{4375,3},
				{55155},
			},
		},
		[41075] = {
			requires = L["Anvil"],
			item = 41327,
			reagents = {
				{4389},
				{3864},
				{10559,2},
				{10561,4},
				{7191},
			},
		},
		[41081] = {
			tools = {55155},
			item = 41332,
			reagents = {
				{3575, 2},
			},
		},
		[41083] = {
			tools = {55155},
			item = 41331,
			reagents = {
				{3577, 2},
			},
		},
		[41085] = {
			tools = {41328, 41326},
			item = 41323,
			reagents = {
				{41322, 1},
				{7077, 1},
				{55250, 4},
				{55247, 2},
			},
		},
		[41087] = {
			tools = {41328, 41327},
			item = 41321,
			reagents = {
				{12359, 2},
			},
		},
		[41089] = {
			tools = {41328, 41326},
			item = 41324,
			reagents = {
				{3860, 10},
				{7971, 3},
				{7909, 1},
				{55247, 1},
			},
		},
		[41091] = {
			tools = {41328},
			item = 55154,
			reagents = {
				{14047, 3},
				{12365, 3},
			},
		},
		[41093] = {
			tools = {41328, 41327},
			item = 55256,
			reagents = {
				{41321, 1},
				{3466, 2},
				{55251, 3},
				{55153, 3},
			},
		},
		[41095] = {
			tools = {41328, 41327},
			item = 55269,
			reagents = {
				{12359, 8},
				{55251, 5},
				{55247, 1},
			},
		},
		[41097] = {
			tools = {41328, 41327},
			item = 55271,
			reagents = {
				{12359, 12},
				{6037, 6},
				{7910, 3},
				{7909, 3},
				{3466, 1},
			},
		},
		[41099] = {
			tools = {41328, 41327},
			item = 55268,
			reagents = {
				{6037, 4},
				{12361, 2},
				{55247, 2},
				{7069, 4},
			},
		},
		[41101] = {
			tools = {41328, 41327},
			item = 55273,
			reagents = {
				{12359, 14},
				{55154, 4},
				{3864, 3},
				{55246, 1},
			},
		},
		[41103] = {
			tools = {41328, 41327},
			item = 55267,
			reagents = {
				{12359, 12},
				{55154, 6},
				{12361, 1},
				{3829, 1},
			},
		},
		[41105] = {
			tools = {41328, 41327},
			item = 41330,
			reagents = {
				{12359, 6},
				{13454, 1},
				{12363, 1},
			},
		},
		[41201] = {
			tools = {55155},
			item = 55152,
			reagents = {
				{4306, 3},
				{2838, 3},
			},
		},
		[41203] = {
			tools = {55155},
			text = "May contain: Jade, Citrine, Emberstone, Aquamarine.",
			item = 41344,
			reagents = {
				{2772, 3},
				{55152, 3},
			},
		},
		[41205] = {
			tools = {55155},
			item = 55144,
			reagents = {
				{2841, 6},
				{3577, 1},
				{55249, 1},
				{2880, 1},
			},
		},
		[41207] = {
			tools = {55155, 41326},
			item = 55142,
			reagents = {
				{41332, 1},
				{55249, 2},
				{55151, 2},
				{55246, 1},
			},
		},
		[41209] = {
			tools = {55155, 41326},
			item = 55148,
			reagents = {
				{3575, 12},
				{1529, 2},
				{1705, 2},
				{3357, 2},
				{55247, 1},
			},
		},
		[41211] = {
			tools = {55155, 41326},
			item = 55143,
			reagents = {
				{41331, 1},
				{1529, 1},
				{55246, 2},
				{55152, 2},
			},
		},
		[41213] = {
			tools = {55155},
			item = 55145,
			reagents = {
				{3575, 8},
				{3577, 2},
				{55249, 2},
			},
		},
		[41215] = {
			tools = {55155},
			item = 55146,
			reagents = {
				{3577, 5},
				{4234, 2},
				{3466, 2},
				{3825, 1},
			},
		},
		[41217] = {
			tools = {55155, 41326},
			item = 55147,
			reagents = {
				{3575, 12},
				{3577, 4},
				{3864, 4},
				{1206, 2},
				{55247, 1},
				{11135, 1},
			},
		},
		[41219] = {
			tools = {55155},
			item = 41322,
			reagents = {
				{3860, 2},
			},
		},
		[41221] = {
			tools = {55155, 41326},
			item = 55141,
			reagents = {
				{41332, 1},
				{3577, 2},
				{3864, 4},
				{55246, 1},
			},
		},
		[41223] = {
			tools = {55155, 41326},
			item = 41340,
			reagents = {
				{3577, 8},
				{55246, 3},
				{55152, 3},
			},
		},
		[41225] = {
			tools = {55155, 41326},
			item = 41342,
			reagents = {
				{41332, 1},
				{3575, 2},
				{2838, 6},
				{3355, 1},
				{55152, 2},
			},
		},
		[41227] = {
			tools = {41328},
			item = 41343,
			reagents = {
				{3860, 8},
				{4234, 2},
				{55152, 2},
			},
		},
		[41229] = {
			tools = {41328},
			item = 55153,
			reagents = {
				{4338, 3},
				{7912, 3},
			},
		},
		[41231] = {
			tools = {55155},
			item = 55164,
			reagents = {
				{55156, 1},
				{3382, 1},
				{55245, 1},
			},
		},
		[41233] = {
			tools = {41328},
			item = 41341,
			reagents = {
				{7911, 2},
				{6037, 2},
			},
		},
		[41235] = {
			tools = {41328},
			item = 55196,
			reagents = {
				{3860, 8},
				{7909, 2},
				{55152, 2},
			},
		},
		[41237] = {
			tools = {41328},
			text = "May contain: Pure Moonstone, Star Ruby, Emberstone",
			item = 56020,
			reagents = {
				{3858, 3},
				{55153, 3},
			},
		},
		[41239] = {
			tools = {41328, 41326},
			item = 41346,
			reagents = {
				{41322, 1},
				{55251, 1},
				{7909, 1},
				{6149, 2},
				{55247, 1},
			},
		},
		[41241] = {
			tools = {41328, 41326},
			item = 41345,
			reagents = {
				{3860, 14},
				{3577, 4},
				{55251, 2},
				{7909, 2},
				{55153, 4},
			},
		},
		[41243] = {
			tools = {41328, 41326},
			item = 41349,
			reagents = {
				{55250, 5},
				{6371, 3},
				{7077, 1},
				{7068, 1},
			},
		},
		[41245] = {
			tools = {41328, 41326},
			item = 41347,
			reagents = {
				{41341, 1},
				{7067, 1},
				{7075, 1},
				{55153, 2},
			},
		},
		[41247] = {
			tools = {55155},
			item = 55169,
			reagents = {
				{55156},
				{5498},
				{55150, 2},
				{55245},
			},
		},
		[41249] = {
			tools = {55155},
			item = 81093,
			reagents = {
				{55156, 1},
				{2880, 1},
				{55245, 1},
			},
		},
		[41251] = {
			tools = {41328, 41327},
			item = 55258,
			reagents = {
				{41321, 1},
				{12361, 1},
				{55251, 1},
				{55247, 1},
			},
		},
		[41253] = {
			tools = {41328, 41327},
			item = 55265,
			reagents = {
				{41321, 1},
				{12655, 4},
				{12364, 2},
				{55154, 2},
				{55247, 1},
			},
		},
		[41255] = {
			tools = {41328, 41327},
			item = 55259,
			reagents = {
				{41341, 1},
				{12655, 5},
				{12361, 5},
				{7076, 1},
				{55154, 8},
				{55247, 3},
			},
		},
		[41257] = {
			tools = {41328, 41327},
			item = 55259,
			reagents = {
				{41341, 1},
				{12655, 5},
				{12361, 5},
				{7076, 1},
				{55150, 8},
				{55247, 3},
			},
		},
		[41259] = {
			tools = {41328, 41327},
			item = 55272,
			reagents = {
				{12359, 28},
				{3577, 4},
				{7082, 2},
				{61673, 2},
				{55154, 8},
			},
		},
		[41261] = {
			tools = {41328, 41326},
			item = 55266,
			reagents = {
				{12359, 20},
				{7910, 2},
				{55250, 2},
				{3466, 2},
				{55246, 4},
			},
		},
		[41263] = {
			tools = {55155, 41326},
			item = 56023,
			reagents = {
				{41322, 1},
				{7909, 3},
				{6372, 3},
				{55152, 3},
			},
		},
		[41265] = {
			tools = {41328, 41327},
			item = 55260,
			reagents = {
				{41321, 1},
				{7910, 2},
				{55246, 4},
				{55247, 1},
			},
		},
		[41267] = {
			tools = {41328, 41327},
			item = 56032,
			reagents = {
				{56033, 1},
				{7910, 12},
				{55250, 12},
				{7078, 8},
				{7077, 12},
				{55248, 8},
			},
		},
		[41269] = {
			tools = {41328, 41327},
			item = 56031,
			reagents = {
				{56033, 1},
				{55252, 1},
				{12364, 5},
				{7910, 5},
				{12361, 5},
				{55248, 5},
			},
		},
		[41271] = {
			tools = {41328, 41326},
			item = 56033,
			reagents = {
				{3577, 8},
				{12360, 2},
				{3466, 2},
			},
		},
		[41273] = {
			tools = {41328, 41326},
			item = 55199,
			reagents = {
				{12359, 8},
				{12799, 2},
				{55154, 2},
				{55247, 1},
			},
		},
		[41275] = {
			tools = {55155, 41326},
			item = 55202,
			reagents = {
				{3575, 6},
				{3577, 1},
				{55249, 2},
				{3864, 2},
			},
		},
		[41277] = {
			tools = {55155, 41326},
			item = 55197,
			reagents = {
				{3860, 6},
				{7910, 2},
				{55249, 2},
				{55153, 4},
			},
		},
		[41279] = {
			tools = {41328, 41327},
			item = 55200,
			reagents = {
				{12359, 5},
				{12655, 1},
				{55249, 4},
				{12808, 2},
				{55154, 2},
			},
		},
		[41281] = {
			tools = {41328, 41326},
			item = 55204,
			reagents = {
				{6037, 12},
				{7075, 4},
				{7067, 4},
				{7068, 4},
				{55153, 8},
			},
		},
		[41283] = {
			tools = {55155, 41326},
			item = 55195,
			reagents = {
				{3575, 6},
				{3864, 2},
				{55249, 2},
				{55152, 3},
			},
		},
		[41285] = {
			tools = {55155, 41326},
			item = 56034,
			reagents = {
				{55251, 2},
				{1705, 8},
				{55246, 2},
				{55152, 4},
			},
		},
		[41287] = {
			tools = {41328, 41327},
			item = 56035,
			reagents = {
				{12655, 3},
				{7082, 3},
				{7069, 5},
				{7081, 5},
			},
		},
		[41303] = {
			tools = {41328, 41327},
			item = 55264,
			reagents = {
				{41321, 1},
				{12364, 1},
				{55154, 3},
				{55247, 1},
			},
		},
		[41305] = {
			tools = {41328, 41326},
			item = 56036,
			reagents = {
				{3577, 8},
				{3860, 2},
				{4304, 2},
				{55246, 6},
			},
		},
		[41307] = {
			tools = {41328, 41326},
			item = 55243,
			reagents = {
				{3860, 18},
				{55249, 3},
				{55251, 3},
				{3864, 3},
				{55152, 6},
			},
		},
		[41309] = {
			tools = {41328, 41326},
			item = 55261,
			reagents = {
				{41321, 1},
				{7910, 5},
				{55154, 3},
				{55247, 1},
			},
		},
		[41311] = {
			tools = {41328, 41326},
			item = 55178,
			reagents = {
				{3860, 8},
				{55249, 1},
				{55251, 1},
				{55250, 1},
			},
		},
		[41313] = {
			tools = {41328, 41326},
			item = 55241,
			reagents = {
				{12359, 24},
				{12800, 2},
				{12799, 2},
				{7075, 2},
				{55154, 4},
			},
		},
		[41315] = {
			tools = {41328, 41326},
			item = 55198,
			reagents = {
				{3860, 12},
				{55251, 4},
				{55247, 1},
			},
		},
		[41317] = {
			tools = {41328, 41326},
			item = 55263,
			reagents = {
				{56033, 1},
				{12799, 3},
				{20520, 3},
				{55248, 2},
			},
		},
		[41321] = {
			tools = {55155},
			item = 56037,
			reagents = {
				{2840, 5},
				{55245, 2},
				{55150, 2},
			},
		},
		[41323] = {
			tools = {55155},
			item = 56038,
			reagents = {
				{2841, 8},
				{2836, 4},
				{55151, 2},
			},
		},
		[41325] = {
			tools = {55155},
			item = 56039,
			reagents = {
				{2841, 6},
				{2880, 1},
				{10940, 1},
			},
		},
		[41327] = {
			tools = {55155},
			item = 56040,
			reagents = {
				{2842, 4},
				{55249, 1},
				{55246, 2},
				{55245, 2},
			},
		},
		[41329] = {
			tools = {55155, 41326},
			item = 56041,
			reagents = {
				{41331, 1},
				{1206, 2},
				{3389, 1},
			},
		},
		[41331] = {
			tools = {55155, 41326},
			item = 56042,
			reagents = {
				{3575, 5},
				{1206, 1},
				{55249, 1},
				{1705, 1},
			},
		},
		[41333] = {
			tools = {55155, 41326},
			item = 56043,
			reagents = {
				{3577, 8},
				{3466, 1},
				{55152, 2},
			},
		},
		[41334] = {
			tools = {55155},
			item = 56044,
			reagents = {
				{2840, 6},
				{818, 1},
				{55246, 1},
			},
		},
		[41337] = {
			tools = {55155},
			item = 56045,
			reagents = {
				{2841, 5},
				{81094, 2},
				{55245, 1},
			},
		},
		[41339] = {
			tools = {55155},
			item = 56046,
			reagents = {
				{2841, 4},
				{2842, 2},
				{3384, 1},
				{55151, 3},
			},
		},
		[41348] = {
			tools = {41328, 41326},
			item = 55180,
			reagents = {
				{12359, 8},
				{55249, 4},
				{8956, 2},
				{55153, 2},
			},
		},
		[41350] = {
			tools = {41328, 41326},
			item = 55228,
			reagents = {
				{41321, 1},
				{55250, 1},
				{7910, 1},
				{7077, 1},
				{55247, 1},
			},
		},
		[41352] = {
			tools = {41328, 41326},
			item = 55242,
			reagents = {
				{3860, 24},
				{3864, 6},
				{55249, 6},
				{7075, 2},
				{55246, 4},
			},
		},
		[41356] = {
			tools = {55155},
			item = 55244,
			reagents = {
				{8170, 12},
				{10648, 20},
				{16203, 2},
				{12655, 2},
				{7076, 3},
			},
		},
		[41541] = {
			tools = {55155, 41326},
			item = 56048,
			reagents = {
				{41322, 1},
				{7909, 4},
				{55246, 2},
				{55152, 2},
			},
		},
		[41546] = {
			tools = {41328, 55155},
			item = 56049,
			reagents = {
				{3860, 12},
				{3864, 2},
			},
		},
		[41548] = {
			tools = {41326, 55155},
			item = 56050,
			reagents = {
				{3577, 10},
				{4234, 4},
				{55251, 2},
			},
		},
		[41550] = {
			tools = {41326, 55155},
			item = 56051,
			reagents = {
				{3860, 4},
				{7070, 4},
				{7909, 1},
				{55246, 1},
			},
		},
		[41552] = {
			tools = {41326, 55155},
			item = 56052,
			reagents = {
				{3860, 18},
				{55249, 3},
				{7070, 2},
				{55153, 6},
			},
		},
		[41554] = {
			tools = {41328, 41326},
			item = 56053,
			reagents = {
				{41331, 1},
				{3577, 2},
				{1529, 6},
				{3821, 6},
				{55247, 2},
			},
		},
		[41556] = {
			tools = {55155, 41326},
			item = 56054,
			reagents = {
				{3860, 10},
				{3466, 2},
				{55152, 4},
			},
		},
		[41558] = {
			tools = {41328, 41326},
			item = 56055,
			reagents = {
				{3860, 4},
				{10593, 1},
				{55246, 1},
			},
		},
		[41560] = {
			tools = {55155},
			item = 55316,
			reagents = {
				{55156, 1},
				{2880, 3},
				{55150, 2},
			},
		},
		[41562] = {
			tools = {55155},
			item = 55317,
			reagents = {
				{55156, 1},
				{2880, 1},
				{2447, 4},
			},
		},
		[41564] = {
			tools = {55155},
			item = 55318,
			reagents = {
				{55174, 1},
				{1210, 1},
				{81094, 1},
				{55150, 1},
			},
		},
		[41566] = {
			tools = {55155},
			item = 55319,
			reagents = {
				{55174, 1},
				{5498, 1},
				{2880, 1},
			},
		},
		[41568] = {
			tools = {55155, 41326},
			item = 55320,
			reagents = {
				{55174, 1},
				{1705, 3},
				{55245, 1},
			},
		},
		[41570] = {
			tools = {55155, 41326},
			item = 55321,
			reagents = {
				{55174, 1},
				{5635, 4},
				{55151, 2},
			},
		},
		[41572] = {
			tools = {55155, 41326},
			item = 55322,
			reagents = {
				{41332, 1},
				{7067, 1},
				{3466, 1},
				{55151, 2},
			},
		},
		[41574] = {
			tools = {55155, 41326},
			item = 55323,
			reagents = {
				{41332, 1},
				{55249, 4},
				{3864, 4},
				{3391, 1},
				{3466, 2},
			},
		},
		[41577] = {
			tools = {55155},
			item = 81030,
			reagents = {
				{55156, 1},
				{774, 1},
			},
		},
		[41579] = {
			tools = {55155, 41326},
			item = 55325,
			reagents = {
				{41322, 1},
				{7909, 2},
				{1210, 2},
				{55246, 1},
			},
		},
		[41581] = {
			tools = {55155},
			item = 55326,
			reagents = {
				{2841, 10},
				{1210, 2},
				{2453, 2},
			},
		},
		[41583] = {
			tools = {55155, 41326},
			item = 55327,
			reagents = {
				{2841, 12},
				{3575, 6},
				{7069, 2},
				{7068, 2},
				{3388, 2},
				{55151, 4},
			},
		},
		[41585] = {
			tools = {55155, 41326},
			item = 55328,
			reagents = {
				{3575, 18},
				{2838, 2},
				{3864, 2},
			},
		},
		[41587] = {
			tools = {55155},
			item = 55329,
			reagents = {
				{2840, 6},
				{2447, 2},
				{55245, 1},
			},
		},
		[41589] = {
			tools = {55155, 41326},
			item = 56047,
			reagents = {
				{3575, 4},
				{55249, 5},
				{3466, 2},
				{55152, 2},
			},
		},
		[41601] = {
			tools = {41328, 41326},
			item = 56002,
			reagents = {
				{3864, 1},
				{55152, 4},
				{55247, 1},
			},
		},
		[41603] = {
			tools = {41328, 41326},
			item = 56004,
			reagents = {
				{55250, 1},
				{55152, 4},
				{55247, 1},
			},
		},
		[41605] = {
			tools = {41328, 41326},
			item = 56006,
			reagents = {
				{7910, 1},
				{55152, 1},
				{11134, 1},
				{55247, 1},
			},
		},
		[41607] = {
			tools = {41328, 41326},
			item = 56003,
			reagents = {
				{7909, 1},
				{55152, 1},
				{55246, 2},
				{55247, 1},
			},
		},
		[41609] = {
			tools = {41328, 41326},
			item = 56015,
			reagents = {
				{12800, 1},
				{7910, 1},
				{16203, 1},
				{55154, 2},
				{55247, 1},
			},
		},
		[41611] = {
			tools = {41328, 41326},
			item = 56012,
			reagents = {
				{11754, 1},
				{55153, 5},
				{55247, 1},
			},
		},
		[41613] = {
			tools = {41328, 41326},
			item = 56013,
			reagents = {
				{18335, 1},
				{16202, 1},
				{55154, 2},
				{55248, 1},
			},
		},
		[41615] = {
			tools = {41328, 41326},
			item = 56016,
			reagents = {
				{12363, 1},
				{12364, 1},
				{14344, 1},
				{55154, 2},
				{55248, 1},
			},
		},
		[41617] = {
			tools = {41328, 41326},
			item = 56017,
			reagents = {
				{12800, 2},
				{55154, 1},
				{55247, 1},
			},
		},
		[41619] = {
			tools = {41328, 41326},
			item = 56014,
			reagents = {
				{55252, 1},
				{14344, 1},
				{8831, 4},
				{7075, 1},
				{55248, 1},
			},
		},
		[41621] = {
			tools = {41328, 41326},
			item = 56018,
			reagents = {
				{12364, 1},
				{7081, 3},
				{55152, 1},
				{55247, 1},
			},
		},
		[41623] = {
			tools = {41328, 41326},
			item = 56058,
			reagents = {
				{55251, 1},
				{55152, 5},
				{55247, 1},
			},
		},
		[41625] = {
			tools = {41328, 41326},
			item = 56010,
			reagents = {
				{12800, 2},
				{55152, 2},
				{55247, 1},
			},
		},
		[41627] = {
			tools = {55155, 41326},
			item = 56000,
			reagents = {
				{55249, 1},
				{55151, 1},
				{55247, 1},
			},
		},
		[41629] = {
			tools = {55155, 41326},
			item = 56001,
			reagents = {
				{1529, 1},
				{11135, 1},
				{55247, 1},
			},
		},
		[41631] = {
			tools = {41328, 41326},
			item = 56005,
			reagents = {
				{55251, 1},
				{11082, 1},
				{55247, 1},
				{55152, 1},
			},
		},
		[41633] = {
			tools = {41328, 41326},
			item = 56056,
			reagents = {
				{7910, 1},
				{7068, 2},
				{55247, 1},
			},
		},
		[41635] = {
			tools = {41328, 41326},
			item = 56008,
			reagents = {
				{12799, 2},
				{55153, 1},
				{55247, 1},
			},
		},
		[41637] = {
			tools = {41328, 41326},
			item = 56009,
			reagents = {
				{12364, 1},
				{55153, 2},
				{55247, 2},
			},
		},
		[41639] = {
			tools = {41328, 41326},
			item = 56007,
			reagents = {
				{12361, 1},
				{16203, 1},
				{55247, 1},
			},
		},
		[41641] = {
			tools = {41328, 41326},
			item = 56011,
			reagents = {
				{12363, 1},
				{61673, 1},
				{55247, 1},
			},
		},
		[41643] = {
			tools = {41328, 41326},
			item = 56057,
			reagents = {
				{12361, 1},
				{3819, 4},
				{7070, 1},
				{55247, 1},
			},
		},
		[41696] = {
			tools = {41326, 41328},
			item = 56059,
			reagents = {
				{56033, 1},
				{6037, 8},
				{12800, 10},
				{3466, 6},
				{55154, 6},
				{55247, 6},
			},
		},
		[41698] = {
			tools = {41326, 41328 },
			item = 56060,
			reagents = {
				{12360, 8},
				{55250, 12},
				{7078, 6},
				{7077, 6},
				{7068, 6},
				{55248, 2},
			},
		},
		[41700] = {
			tools = {41326, 41328 },
			item = 56061,
			reagents = {
				{12360, 4},
				{12655, 12},
				{7910, 8},
				{7078, 4},
				{7068, 12},
				{55247, 6},
			},
		},
		[41702] = {
			tools = {41326, 41328 },
			item = 56062,
			reagents = {
				{12360, 6},
				{3577, 28},
				{15416, 32},
				{17010, 4},
				{55154, 8},
				{7078, 6},
			},
		},
		[41704] = {
			tools = {41326, 41328 },
			item = 56063,
			reagents = {
				{12655, 20},
				{7082, 8},
				{7080, 8},
				{7076, 8},
				{7078, 8},
				{12803, 8},
			},
		},
		[41706] = {
			tools = {41326, 41328 },
			item = 56064,
			reagents = {
				{12360, 8},
				{6037, 8},
				{12800, 12},
				{61673, 4},
				{55154, 12},
				{55248, 4},
			},
		},
		[41708] = {
			tools = {41326, 41328 },
			item = 56065,
			reagents = {
				{41321, 1},
				{12799, 6},
				{7076, 6},
				{3356, 6},
				{55154, 8},
				{55247, 3},
			},
		},
		[41710] = {
			tools = {41326, 41328 },
			item = 56066,
			reagents = {
				{56033, 1},
				{12361, 5},
				{7080, 2},
				{55247, 1},
			},
		},
		[41712] = {
			tools = {41326, 41328 },
			item = 56067,
			reagents = {
				{11371, 4},
				{7077, 8},
				{11382, 2},
			},
		},
		[41714] = {
			tools = {41326, 41328 },
			item = 56068,
			reagents = {
				{12359, 8},
				{12799, 4},
				{7081, 6},
				{9187, 1},
				{55153, 4},
			},
		},
		[41716] = {
			tools = {41326, 41328 },
			item = 56069,
			reagents = {
				{3860, 20},
				{7971, 2},
				{55249, 4},
				{55251, 4},
				{3466, 8},
			},
		},
		[41718] = {
			tools = {41326, 41328 },
			item = 56070,
			reagents = {
				{3860, 8},
				{3466, 6},
				{3864, 4},
				{55152, 4},
				{55246, 4},
			},
		},
		[41720] = {
			tools = {41326, 41328 },
			item = 56071,
			reagents = {
				{3860, 12},
				{6037, 8},
				{7971, 4},
				{8839, 2},
				{55251, 4},
				{55153, 8},
			},
		},
		[41722] = {
			tools = {41326, 41328 },
			item = 56072,
			reagents = {
				{12655, 12},
				{12363, 4},
				{61673, 8},
				{16203, 2},
				{55248, 2},
			},
		},
		[41724] = {
			tools = {41326, 41328 },
			item = 56073,
			reagents = {
				{12359, 8},
				{7971, 2},
				{11175, 2},
				{7067, 4},
				{55153, 4},
			},
		},
		[41726] = {
			tools = {55155},
			item = 55330,
			reagents = {
				{3576, 8},
				{2450, 2},
				{55151, 2},
			},
		},
		[41728] = {
			tools = {55155, 41326},
			item = 55331,
			reagents = {
				{3575, 10},
				{1210, 2},
				{5500, 1},
				{5635, 8},
				{3466, 2},
			},
		},
		[41730] = {
			tools = {55155, 41326},
			item = 55332,
			reagents = {
				{3859, 6},
				{4306, 2},
				{3864, 2},
			},
		},
		[41732] = {
			tools = {55155},
			item = 55333,
			reagents = {
				{2840, 5},
				{81094, 2},
				{55150, 2},
			},
		},
		[41734] = {
			tools = {55155},
			item = 55334,
			reagents = {
				{2842, 4},
				{1206, 4},
				{55246, 2},
				{55151, 2},
				{3390, 1},
				{5635, 8},
			},
		},
		[41736] = {
			tools = {55155, 41326},
			item = 55335,
			reagents = {
				{3575, 6},
				{3864, 4},
				{55246, 2},
			},
		},
		[41738] = {
			tools = {55155, 41326},
			item = 55336,
			reagents = {
				{3860, 2},
				{3357, 2},
				{7909, 2},
			},
		},
		[41740] = {
			tools = {55155},
			item = 55337,
			reagents = {
				{2841, 10},
				{1206, 2},
				{55245, 1},
			},
		},
		[41742] = {
			tools = {55155, 41326},
			item = 55338,
			reagents = {
				{3575, 10},
				{1529, 2},
				{55245, 2},
				{1288, 6},
				{3466, 2},
			},
		},
		[41744] = {
			tools = {55155, 41326},
			item = 55339,
			reagents = {
				{3859, 7},
				{55250, 2},
				{55245, 2},
			},
		},
		[41746] = {
			tools = {55155},
			item = 55340,
			reagents = {
				{2840, 2},
				{774, 1},
				{818, 1},
				{81094, 1},
				{1210, 1},
			},
		},
		[41748] = {
			tools = {55155},
			item = 55341,
			reagents = {
				{2842, 2},
				{5498, 2},
				{55249, 4},
				{55246, 2},
				{55151, 2},
			},
		},
		[41750] = {
			tools = {55155},
			item = 55210,
			reagents = {
				{3859, 3},
				{1705, 2},
				{55152, 2},
			},
		},
		[41752] = {
			tools = {55155},
			item = 55211,
			reagents = {
				{3859, 4},
				{1529, 2},
				{55152, 2},
			},
		},
		[41754] = {
			tools = {55155},
			item = 55212,
			reagents = {
				{3860, 3},
				{55250, 2},
				{55153, 2},
			},
		},
		[41756] = {
			tools = {55155},
			item = 55213,
			reagents = {
				{3860, 3},
				{9262, 2},
				{55153, 2},
			},
		},
		[41760] = {
			tools = {55155, 41326},
			item = 56074,
			reagents = {
				{1206, 1},
				{55151, 2},
				{55246, 2},
			},
		},
		[41762] = {
			tools = {41327, 41328 },
			item = 56075,
			reagents = {
				{12799, 1},
				{13466, 1},
				{55247, 2},
			},
		},
		[41764] = {
			tools = {41327, 41328 },
			item = 56077,
			reagents = {
				{55252, 1},
				{61673, 3},
				{55248, 3},
			},
		},
		[41768] = {
			tools = {41327, 41328 },
			item = 56076,
			reagents = {
				{55252, 1},
				{12363, 1},
				{7076, 2},
				{55248, 1},
			},
		},
		[41770] = {
			tools = {41328},
			text = "May contain: Blue Sapphire, Huge Emerald, Large Opal, Azerothian Diamond, Arcane Crystal.",
			item = 56019,
			reagents = {
				{10620, 3},
				{55154, 3},
			},
		},
		[41774] = {
			tools = {41328, 41327},
			item = 56090,
			reagents = {
				{12359, 6},
				{6037, 3},
				{7910, 1},
				{7909, 1},
			},
		},
		[41776] = {
			tools = {55155, 41326},
			item = 56091,
			reagents = {
				{55174, 1},
				{1210, 2},
				{785, 1},
				{55246, 1},
			},
		},
		[41778] = {
			tools = {41328, 41327},
			item = 56092,
			reagents = {
				{12655, 2},
				{7082, 1},
				{7081, 3},
				{55154, 3},
			},
		},
		[41780] = {
			tools = {41328, 41327},
			item = 56093,
			reagents = {
				{41321, 1},
				{12655, 6},
				{7082, 3},
				{7081, 6},
				{55154, 4},
				{55247, 4},
			},
		},
		[41782] = {
			tools = {41328, 41327},
			item = 56094,
			reagents = {
				{56033, 1},
				{12360, 2},
				{12655, 6},
				{20520, 12},
				{7075, 20},
				{55248, 3},
			},
		},
		[41784] = {
			tools = {41328, 41326},
			item = 56095,
			reagents = {
				{41341, 1},
				{55251, 8},
				{7079, 8},
				{7070, 12},
				{3358, 12},
				{55247, 4},
			},
		},
		[41786] = {
			tools = {41328, 41326},
			item = 56089,
			reagents = {
				{3860, 16},
				{55152, 4},
				{3466, 1},
				{55246, 4},
			},
		},
		[41788] = {
			tools = {41328, 41326},
			item = 55359,
			reagents = {
				{56033, 1},
				{55252, 2},
				{12364, 8},
				{12799, 10},
				{55248, 4},
				{7078, 6},
			},
		},
		[41790] = {
			tools = {41328, 41326},
			item = 55360,
			reagents = {
				{56033, 1},
				{55252, 1},
				{12803, 16},
				{18335, 4},
				{12799, 6},
				{55248, 4},
			},
		},
		[41792] = {
			tools = {41328, 41326},
			item = 55361,
			reagents = {
				{12360, 6},
				{12359, 12},
				{55252, 1},
				{13926, 4},
				{12800, 8},
				{55248, 2},
			},
		},
		[41794] = {
			tools = {41328, 41326},
			item = 55362,
			reagents = {
				{12359, 16},
				{5116, 12},
				{12361, 6},
				{12799, 6},
				{55247, 2},
			},
		},
		[41796] = {
			tools = {41328, 41326},
			item = 55363,
			reagents = {
				{3577, 24},
				{55252, 1},
				{7080, 8},
				{7076, 8},
				{12800, 6},
				{55248, 4},
			},
		},
		[41798] = {
			tools = {41328, 41326},
			item = 55364,
			reagents = {
				{3577, 32},
				{7082, 8},
				{12800, 8},
				{8152, 8},
				{55247, 6},
			},
		},
		[41800] = {
			tools = {41328, 41326},
			item = 55365,
			reagents = {
				{12359, 28},
				{55252, 2},
				{12364, 12},
				{7077, 8},
				{61673, 8},
				{18567, 1},
				{55248, 6},
			},
		},
		[41802] = {
			tools = {41328, 41326},
			item = 55366,
			reagents = {
				{12359, 18},
				{12360, 2},
				{12799, 10},
				{61673, 6},
				{55154, 6},
				{55247, 2},
			},
		},
		[41804] = {
			tools = {41328, 41326},
			item = 55367,
			reagents = {
				{3577, 26},
				{55252, 1},
				{17011, 2},
				{12799, 8},
				{55248, 2},
			},
		},
		[41806] = {
			tools = {41328, 41326},
			item = 55368,
			reagents = {
				{3577, 32},
				{55252, 1},
				{12364, 6},
				{12800, 8},
				{3466, 6},
				{55248, 4},
			},
		},
		[41808] = {
			tools = {41328, 41326},
			item = 56096,
			reagents = {
				{12360, 6},
				{6037, 6},
				{12800, 8},
				{61673, 4},
				{55154, 6},
				{55248, 4},
			},
		},
		[41821] = {
			tools = {41328, 41326},
			item = 61818,
			reagents = {
				{11382, 1},
				{7077, 6},
				{55248, 1},
				{55154, 2},
			},
		},
		[45054] = {
			requires = L["Cooking Fire"],
			item = 30818,
			reagents = {
				{2674},
				{159},
			},
		},
		[45057] = {
			item = 51268,
			quantity = {1,3},
			reagents = {
				{4359, 4},
				{2589, 2},
				{4357, 2},
			},
		},
		[45063] = {
			item = 51264,
			reagents = {
				{2840, 12},
				{3470, 2},
				{818, 2},
			},
		},
		[45066] = {
			item = 51256,
			reagents = {
				{2996, 3},
				{2321, 2},
				{6260, 3},
			},
		},
		[45069] = {
			item = 51284,
			reagents = {
			},
		},
		[45451] = {
			name = "Smelting: Smelt Dreamsteel",
			requires = L["Forge"],
			text = "Allows the miner to smelt a bright dream shard into a dreamsteel bar. Smelting dreamsteel requires a forge.",
			item = 61216,
			reagents = {
				{61198},
				{3859},
				{20381},
			},
		},
		[45453] = {
			item = 61230,
			reagents = {
				{61198},
				{14341},
				{20381},
			},
		},
		[45455] = {
			item = 61229,
			reagents = {
				{61198},
				{8170},
				{20381},
			},
		},
		[45457] = {
			item = 61360,
			reagents = {
				{61230, 20},
				{14342, 6},
				{12810, 4},
				{14048, 40},
				{7082, 6},
				{12803, 6},
			},
		},
		[45459] = {
			item = 61361,
			reagents = {
				{61230, 14},
				{14342, 4},
				{14048, 24},
				{7082, 4},
				{7080, 4},
				{12803, 4},
			},
		},
		[45461] = {
			item = 61362,
			reagents = {
				{61230, 8},
				{14342, 2},
				{7080, 2},
				{7082, 2},
			},
		},
		[45463] = {
			item = 61363,
			reagents = {
				{61230, 8},
				{14342, 4},
				{14048, 12},
				{7082, 4},
				{12803, 4},
			},
		},
		[45465] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61364,
			reagents = {
				{61216, 20},
				{12810, 12},
				{12360, 8},
				{12799, 8},
				{12644, 8},
				{12800, 2},
			},
		},
		[45467] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61365,
			reagents = {
				{61216, 14},
				{12810, 8},
				{12655, 8},
				{12364, 8},
			},
		},
		[45469] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61366,
			reagents = {
				{61216, 8},
				{12810, 4},
				{12655, 4},
				{12644, 4},
			},
		},
		[45471] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61367,
			reagents = {
				{61216, 8},
				{12810, 8},
				{12655, 8},
				{12644, 2},
				{12800, 2},
			},
		},
		[45473] = {
			item = 61356,
			reagents = {
				{61229, 22},
				{12810, 20},
				{15407, 6},
				{12803, 6},
			},
		},
		[45475] = {
			item = 61357,
			reagents = {
				{61229, 8},
				{12810, 6},
				{15407},
				{12803, 2},
			},
		},
		[45477] = {
			item = 61358,
			reagents = {
				{61229, 12},
				{12810, 12},
				{15407, 4},
				{12803, 6},
				{7082, 6},
			},
		},
		[45479] = {
			item = 61359,
			reagents = {
				{61229, 8},
				{12810, 12},
				{15407, 2},
				{14341, 8},
				{7082, 8},
			},
		},
		[45481] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 61187,
			reagents = {
				{16006, 8},
				{12810, 10},
				{12655, 8},
				{15994, 6},
				{10548, 2},
				{12800},
			},
		},
		[45483] = {
			item = 61188,
			reagents = {
				{12810, 12},
				{15407, 4},
				{12803, 4},
				{7076, 8},
				{14341, 8},
			},
		},
		[45485] = {
			item = 61186,
			reagents = {
				{14048, 14},
				{9210, 10},
				{14344},
				{12810},
				{8846, 24},
			},
		},
		[45487] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 61185,
			reagents = {
				{12360, 16},
				{12811, 6},
				{12800, 6},
				{12810, 6},
				{13926, 6},
				{12644, 10},
			},
		},
		[45611] = {
			item = 65032,
			reagents = {
				{2931, 2},
				{3372},
			},
		},
		[45625] = {
			requires = L["Cooking Fire"],
			item = 84040,
			reagents = {
				{13889},
				{3713},
				{61173},
				{13464},
			},
		},
		[45627] = {
			requires = L["Cooking Fire"],
			item = 84041,
			reagents = {
				{12203},
				{12205},
				{159},
			},
		},
		[45989] = {
			item = 50237,
			reagents = {
				{10286, 3},
				{13464},
				{8838},
				{8925},
			},
		},
		[46064] = {
			requires = L["Cooking Fire"],
			item = 6182,
			reagents = {
				{6183},
			},
		},
		[46066] = {
			item = 65028,
			reagents = {
				{5785, 16},
				{4234, 8},
				{8343, 2},
				{6370, 3},
				{6372},
			},
		},
		[46068] = {
			item = 60001,
			quantity = 2,
			reagents = {
				{4306, 2},
				{9260},
			},
		},
		[46072] = {
			item = 51283,
			reagents = {
				{4470, 5},
				{2589, 10},
				{50231},
			},
		},
		[46073] = {
			item = 51282,
			reagents = {
				{4470, 20},
				{4359, 10},
				{17058, 2},
			},
		},
		[46074] = {
			item = 51705,
			reagents = {
				{4470, 10},
				{4359, 4},
			},
		},
		[46075] = {
			item = 2714,
			reagents = {
				{3575, 2},
				{814, 4},
				{2592, 5},
			},
		},
		[46077] = {
			item = 65030,
			reagents = {
				{1630, 5},
				{10561},
				{4359},
				{4375},
				{4404, 2},
				{10558, 2},
			},
		},
		[46085] = {
			requires = L["Cooking Fire"],
			item = 53015,
			reagents = {
				{3667},
				{12202},
				{12037, 2},
				{2692},
				{3713},
				{159},
			},
		},
		[46610] = {
			tools = {5956, 10498},
			item = 60099,
			reagents = {
				{9449},
				{60098, 5},
				{814, 2},
				{7191, 4},
				{3829},
				{4375, 6},
				{18631},
			},
		},
		[46620] = {
			item = 83405,
			reagents = {
				{4304, 7},
				{4291, 3},
			},
		},
		[46621] = {
			item = 83404,
			reagents = {
				{4304, 6},
				{4291, 2},
			},
		},
		[46622] = {
			item = 83403,
			reagents = {
				{4234, 10},
				{4291},
				{4236},
			},
		},
		[46623] = {
			item = 83402,
			reagents = {
				{4304, 10},
				{4234, 2},
				{4291, 4},
				{2605},
			},
		},
		[46624] = {
			item = 83401,
			reagents = {
				{4304, 12},
				{3575, 2},
				{4291, 4},
				{2605, 2},
			},
		},
		[46625] = {
			item = 83400,
			reagents = {
				{4304, 8},
				{4338, 4},
				{4291, 2},
				{2605},
			},
		},
		[46626] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 83410,
			reagents = {
				{3859, 14},
				{7966, 2},
			},
		},
		[46627] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 83411,
			reagents = {
				{3859, 16},
				{7966, 4},
			},
		},
		[46628] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 83412,
			reagents = {
				{3859, 18},
				{7966, 2},
				{3864},
			},
		},
		[46629] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 83413,
			reagents = {
				{3859, 20},
				{7966, 4},
				{3864},
				{1705},
			},
		},
		[46630] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 83414,
			reagents = {
				{3859, 20},
				{7966, 3},
				{3864},
				{6037},
			},
		},
		[46631] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 83415,
			reagents = {
				{3859, 10},
				{6037, 8},
				{3864, 4},
				{7966, 3},
				{7909, 2},
				{7922},
			},
		},
		[46652] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60293,
			reagents = {
				{12655, 25},
				{12808, 10},
				{20520, 8},
				{12810, 2},
				{12644, 6},
				{12364},
			},
		},
		[46653] = {
			item = 65000,
			reagents = {
				{8170, 35},
				{15414, 40},
				{12810, 4},
				{12803, 6},
				{14341, 2},
			},
		},
		[46654] = {
			item = 65001,
			reagents = {
				{8170, 30},
				{15414, 30},
				{12810, 3},
				{12803, 4},
				{14341, 1},
			},
		},
		[46655] = {
			item = 65002,
			reagents = {
				{8170, 30},
				{15414, 25},
				{12810, 2},
				{12803, 4},
				{14341, 2},
			},
		},
		[46656] = {
			item = 65003,
			reagents = {
				{14048, 12},
				{14256, 20},
				{12662, 20},
				{10285, 8},
				{7971, 4},
				{14341, 1},
				{20520, 10},
			},
		},
		[46657] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 65004,
			reagents = {
				{12360, 14},
				{3577, 6},
				{12938},
				{11752},
				{8846, 10},
				{11382, 2},
				{12644, 4},
				{4278, 10},
			},
		},
		[46659] = {
			item = 65006,
			reagents = {
				{8170, 30},
				{12810, 16},
				{20295},
				{15407, 4},
				{15415, 40},
				{7082, 12},
			},
		},
		[46661] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 65008,
			reagents = {
				{12360, 14},
				{20002, 10},
				{9197, 20},
				{12803, 10},
				{12364, 10},
				{12644, 4},
			},
		},
		[46663] = {
			item = 65010,
			reagents = {
				{2840, 8},
				{3470, 2},
			},
		},
		[46664] = {
			item = 65011,
			reagents = {
				{2840, 8},
				{3470, 4},
				{2880, 4},
			},
		},
		[46665] = {
			item = 65012,
			reagents = {
				{2841, 6},
				{1705, 2},
				{3466, 2},
				{3478, 4},
				{3391, 2},
			},
		},
		[46695] = {
			item = 65019,
			reagents = {
				{4304, 30},
				{8165, 25},
				{8343, 4},
				{8172, 3},
			},
		},
		[47015] = {
			item = 81061,
			reagents = {
				{8170, 6},
				{14047, 4},
				{14341},
			},
		},
		[47016] = {
			item = 81062,
			reagents = {
				{8170, 12},
				{12803},
				{14341},
			},
		},
		[47017] = {
			item = 81063,
			reagents = {
				{8170, 10},
				{7080},
				{12803},
				{14341},
			},
		},
		[47018] = {
			item = 81064,
			reagents = {
				{8170, 12},
				{8343, 2},
				{14341},
			},
		},
		[47019] = {
			item = 81066,
			reagents = {
				{8170, 24},
				{12803, 4},
				{15407},
				{14341},
			},
		},
		[47020] = {
			item = 81065,
			reagents = {
				{8170, 8},
				{14047, 4},
				{14341},
			},
		},
		[47021] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60288,
			reagents = {
				{12359, 20},
				{12655, 2},
				{20520, 2},
				{12810},
				{12361},
			},
		},
		[47022] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60289,
			reagents = {
				{12359, 24},
				{12655, 6},
				{20520, 4},
				{12810, 2},
				{12800},
			},
		},
		[47023] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60290,
			reagents = {
				{12359, 24},
				{12655, 4},
				{20520, 4},
				{12810, 2},
				{12644},
				{7910},
			},
		},
		[47024] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60291,
			reagents = {
				{12359, 16},
				{12655, 2},
				{20520, 2},
				{7080},
			},
		},
		[47025] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60292,
			reagents = {
				{12359, 14},
				{12655, 2},
				{20520, 3},
				{12810},
				{7076},
			},
		},
		[47026] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60287,
			reagents = {
				{12359, 12},
				{12655, 2},
				{20520, 2},
				{12810, 2},
			},
		},
		[47027] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 51312,
			reagents = {
				{1206},
				{4375, 2},
				{2841, 2},
				{10998},
			},
		},
		[47028] = {
			requires = L["Anvil"],
			tools = {5956, 6219},
			item = 51313,
			reagents = {
				{1206},
				{4375, 2},
				{2841, 2},
				{10998},
			},
		},
		[47029] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60573,
			reagents = {
				{12359, 16},
				{11371},
				{11754, 6},
				{7078},
			},
		},
		[47030] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60574,
			reagents = {
				{12359, 24},
				{11371},
				{11754, 12},
				{8170, 6},
				{20520, 2},
				{7078, 2},
			},
		},
		[47031] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60575,
			reagents = {
				{12359, 16},
				{11371},
				{11754, 6},
				{7078, 2},
				{8170, 2},
			},
		},
		[47032] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60576,
			reagents = {
				{12359, 12},
				{7078, 2},
				{11754, 5},
				{12810},
			},
		},
		[47033] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60577,
			reagents = {
				{12359, 40},
				{11371, 8},
				{11754, 18},
				{12810, 8},
				{7078, 8},
			},
		},
		[47034] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60578,
			reagents = {
				{12359, 12},
				{7077, 7},
				{11754, 5},
				{12810, 3},
				{7078, 2},
			},
		},
		[47035] = {
			item = 65021,
			reagents = {
				{8211},
				{12810, 16},
				{20002, 10},
				{12803, 20},
				{15407, 4},
				{14227, 4},
			},
		},
		[49551] = {
			requires = L["Cooking Fire"],
			item = 83309,
			reagents = {
				{8838},
				{22529},
				{51714, 2}, -- 3->2 1.18
				--{6370}, 1.18
			},
		},
		[52747] = { --1.18
			item = 58304,
			reagents = {
				{11371, 8},
				{18631, 4},
				{61673, 3},
				{12364, 4},
				{12800, 2},
			},
		},
		[52749] = { --1.18
			item = 58305,
			reagents = {
				{11371, 8},
				{18631, 4},
				{7910, 4},
				{12803, 6},
				{12363, 2},
				{7076, 4},
			},
		},
		[54001] = {
			item = 65015,
			reagents = {
				{8170, 24},
				{15415, 25},
				{15407},
				{14341},
			},
		},
		[54003] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 61648,
			reagents = {
				{12359, 16},
				{7076, 3},
				{7078, 3},
			},
		},
		[54005] = {
			requires = L["Black Anvil"],
			tools = {5956},
			item = 61649,
			reagents = {
				{12655, 12},
				{12360, 2},
				{7076, 6},
				{7078, 6},
			},
		},
		[54007] = {
			item = 65038,
			reagents = {
				{17010, 9},
				{17012, 12},
				{12810, 12},
				{12607, 6},
				{15407, 5},
				{14227, 4},
			},
		},
		[54009] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 65039,
			reagents = {
				{11371, 14},
				{17010, 6},
				{17011, 5},
			},
		},
		[54011] = {
			item = 65035,
			reagents = {
				{14342, 6},
				{17010, 5},
				{17011, 4},
				{7078, 10},
				{14227, 4},
			},
		},
		[54013] = {
			item = 65036,
			reagents = {
				{17012, 6},
				{17010, 5},
				{17011, 3},
				{12607, 6},
				{15407, 5},
				{14227, 4},
			},
		},
		[54015] = {
			item = 65037,
			reagents = {
				{17011, 6},
				{17010, 3},
				{14227, 4},
				{7076, 6},
				{12607, 6},
				{15407, 4},
			},
		},
		[57008] = {
			item = 65022,
			reagents = {
				{4304, 40},
				{7075, 12},
				{8172, 3},
				{8343, 4},
			},
		},
		[57010] = {
			item = 65023,
			reagents = {
				{4304, 20},
				{7081, 10},
				{8172},
				{8343, 4},
			},
		},
		[57012] = {
			item = 65024,
			reagents = {
				{8170, 20},
				{15419, 20},
				{15407, 6},
				{7076, 20},
				{12809, 10},
				{13455, 5},
				{8343, 2},
			},
		},
		[57014] = {
			item = 65025,
			reagents = {
				{8170, 20},
				{15417, 15},
				{15407, 5},
				{7078, 25},
				{11751, 2},
				{21546, 5},
				{8343, 2},
			},
		},
		[57016] = {
			item = 65026,
			reagents = {
				{8170, 15},
				{15422, 20},
				{15407, 5},
				{7080, 20},
				{12457, 10},
				{18294, 10},
				{8343, 2},
			},
		},
		[57018] = {
			item = 65027,
			reagents = {
				{8170, 10},
				{15423, 20},
				{15407, 6},
				{7082, 20},
				{12753, 6},
				{2459, 10},
				{8343, 2},
			},
		},
		[57020] = {
			item = 60909,
			reagents = {
				{14048, 10},
				{12810, 6},
				{7076, 6},
				{14344},
			},
		},
		[57022] = {
			item = 60910,
			reagents = {
				{8170, 20},
				{12810, 8},
				{7082, 2},
				{7076},
			},
		},
		[57024] = {
			item = 60907,
			reagents = {
				{14048, 10},
				{14344, 2},
				{7069, 16},
				{7082, 6},
			},
		},
		[57026] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 60908,
			reagents = {
				{12359, 40},
				{12810, 6},
				{7082, 6},
				{7076, 6},
				{3577, 2},
			},
		},
		[57047] = {
			requires = L["Cooking Fire"],
			item = 60976,
			reagents = {
				{60955},
				{3713},
				{10286},
			},
		},
		[57049] = {
			requires = L["Cooking Fire"],
			item = 60977,
			reagents = {
				{60955},
				{3713},
				{13467},
			},
		},
		[57051] = {
			requires = L["Cooking Fire"],
			item = 60978,
			reagents = {
				{60955},
				{3713},
				{13464, 2},
			},
		},
		[57111] = {
			item = 61181,
			reagents = {
				{8846},
				{13465, 2},
				{2459},
				{8925},
			},
		},
		[57113] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61182,
			reagents = {
				{7081},
				{12359, 8},
				{12644, 2},
				{61673},
			},
		},
		[57115] = {
			item = 61183,
			reagents = {
				{12810, 3},
				{61673, 3},
				{14341, 2},
			},
		},
		[57129] = {
			item = 61225,
			reagents = {
				{730},
				{13463},
				{8831},
				{8925},
			},
		},
		[57131] = {
			item = 61224,
			reagents = {
				{61198},
				{11176},
				{8925},
			},
		},
		[57163] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61779,
			reagents = {
				{2840, 8},
				{2880},
				{3470, 2},
			},
		},
		[57166] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61780,
			reagents = {
				{2841, 8},
				{2880},
				{3478, 2},
			},
		},
		[57169] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61781,
			reagents = {
				{3575, 8},
				{7071},
				{3486, 2},
			},
		},
		[57172] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61782,
			reagents = {
				{3860, 8},
				{7071},
				{7966, 2},
				{6037},
			},
		},
		[57175] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61783,
			reagents = {
				{12359, 8},
				{7071},
				{12644, 2},
				{6037},
			},
		},
		[57178] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61784,
			reagents = {
				{12360, 2},
				{7071},
				{12644, 2},
				{11754},
				{12361},
			},
		},
		[57181] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 61785,
			reagents = {
				{61216, 2},
				{12644, 2},
				{7076},
				{12803},
			},
		},
		[57187] = {
			requires = L["Black Anvil"], --TODO CHEck
			tools = {5956},
			item = 60007,
			reagents = {
				{12655, 12},
				{12360, 14},
				{11371, 10},
				{61673, 6},
				{3824, 8},
			},
		},
		[57189] = {
			requires = L["Black Anvil"], --TODO CHEck
			tools = {5956},
			item = 60008,
			reagents = {
				{12655, 12},
				{12360, 12},
				{11371, 12},
				{61673, 6},
				{22202, 6},
			},
		},
		[57191] = {
			requires = L["Black Anvil"], --TODO CHEck
			tools = {5956},
			item = 60009,
			reagents = {
				{12655, 10},
				{12360, 10},
				{11371, 8},
				{61673, 4},
				{12800, 4},
			},
		},
		[57193] = {
			requires = L["Black Anvil"], --TODO CHEck
			tools = {5956},
			item = 60010,
			reagents = {
				{12655, 12},
				{12360, 14},
				{11371, 14},
				{61673, 8},
				{22203, 2},
				{18335},
			},
		},
		[57196] = {
			requires = L["Black Anvil"], --TODO CHEck
			tools = {5956},
			item = 61810,
			reagents = {
				{12359, 10},
				{19933, 6},
				{8846, 6},
			},
		},
		[57555] = {
			name = "Transmute: Elemental Earth",
			tools = {9149},
			text = "Transmutes a Core of Earth into three Elemental Earth.",
			item = 7067,
			quantity = 3,
			reagents = {
				{7075},
			},
		},
		[57557] = {
			name = "Transmute: Elemental Water",
			tools = {9149},
			text = "Transmutes a Globe of Water into three Elemental Water.",
			item = 7070,
			quantity = 3,
			reagents = {
				{7079},
			},
		},
		[57601] = {
			item = 55518,
			reagents = {
				{61673, 5},
				{14342, 2},
				{14048, 6},
				{14227, 3},
			},
		},
		[57603] = {
			item = 55519,
			reagents = {
				{61673, 4},
				{14342, 2},
				{14048, 3},
				{14227, 4},
			},
		},
		[57605] = {
			item = 55520,
			reagents = {
				{61673, 7},
				{14342, 3},
				{14048, 8},
				{14227, 2},
			},
		},
		[57607] = {
			item = 55521,
			reagents = {
				{61673, 7},
				{14342, 3},
				{14048, 6},
				{14227, 2},
			},
		},
		[57609] = {
			item = 55522,
			reagents = {
				{61673, 5},
				{15407, 2},
				{12810, 8},
				{14227, 1},
			},
		},
		[57611] = {
			item = 55523,
			reagents = {
				{61673, 4},
				{15407, 2},
				{12810, 7},
				{14227, 2},
			},
		},
		[57613] = {
			item = 55524,
			reagents = {
				{61673, 8},
				{15407, 4},
				{12810, 12},
				{14227, 1},
			},
		},
		[57615] = {
			item = 55525,
			reagents = {
				{61673, 6},
				{15407, 3},
				{12810, 13},
				{14227, 2},
			},
		},
		[57617] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55526,
			reagents = {
				{12359, 6},
				{12655, 1},
				{12360, 1},
				{12607, 1},
			},
		},
		[57619] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55527,
			reagents = {
				{12359, 5},
				{12655, 1},
				{12360, 1},
				{12607, 3},
			},
		},
		[57621] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55528,
			reagents = {
				{12359, 6},
				{12655, 1},
				{12360, 2},
				{12607, 2},
			},
		},
		[57623] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55529,
			reagents = {
				{12359, 7},
				{12655, 1},
				{12360, 2},
				{12607, 2},
			},
		},
		[57625] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55530,
			reagents = {
				{12359, 6},
				{12360, 2},
				{12655, 7},
			},
		},
		[57627] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55531,
			reagents = {
				{12359, 7},
				{12360, 2},
				{12655, 9},
			},
		},
		[57629] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55532,
			reagents = {
				{12359, 5},
				{12360, 2},
				{12655, 10},
			},
		},
		[57631] = {
			requires = L["Anvil"],
			tools = {5956},
			item = 55533,
			reagents = {
				{12359, 7},
				{12360, 2},
				{12655, 12},
			},
		},
		[57633] = {
			item = 55534,
			reagents = {
				{61673, 4},
				{14342, 2},
				{14048, 6},
				{14227, 4},
				{13926, 1},
			},
		},
		[58044] = { --1.18
			item = 41674,
			requires = L["Cooking Fire"],
			reagents = {
				{41675, 1},
				{2677, 1},
				{2692, 1},
			},
		},
		[58046] = { --1.18
			item = 41673,
			requires = L["Cooking Fire"],
			reagents = {
				{4539, 1},
				{41677, 1},
				{1179, 1},
			},
		},
		[69420] = {
			item = 83288,
			reagents = {
				{4339, 2},
				{8343},
				{6260},
				{7070},
				{4234, 3},
			},
		},
		[69421] = {
			item = 83289,
			reagents = {
				{4339, 3},
				{8343, 2},
				{6260},
				{6373},
				{9036},
			},
		},
		[69422] = {
			item = 83290,
			reagents = {
				{4339, 3},
				{8343},
				{6260},
				{7070},
				{6149, 2},
			},
		},
		[69423] = {
			item = 83291,
			reagents = {
				{4339, 4},
				{8343},
				{6260},
				{7070},
				{3827, 2},
			},
		},
		[69424] = {
			item = 83286,
			reagents = {
				{4339, 3},
				{8343},
				{6260},
				{7070},
				{3827, 2},
			},
		},
		[69425] = {
			item = 83287,
			reagents = {
				{4339, 6},
				{8343},
				{6260, 2},
				{7070, 2},
				{1705, 2},
				{20746},
			},
		},
		[69426] = {
			item = 83283,
			reagents = {
				{4339, 3},
				{8343, 3},
				{2324},
				{4304, 2},
			},
		},
		[69427] = {
			item = 83284,
			reagents = {
				{4339, 3},
				{8343, 2},
				{2324},
				{6048},
			},
		},
		[69428] = {
			item = 83285,
			reagents = {
				{4339, 6},
				{8343, 2},
				{2842},
				{17028},
				{2324},
			},
		},
		[69429] = {
			item = 83280,
			reagents = {
				{4339, 4},
				{8343, 2},
				{2842},
				{2324},
			},
		},
		[69430] = {
			item = 83282,
			reagents = {
				{4339, 4},
				{8343},
				{2842},
				{2324},
			},
		},
		[69431] = {
			item = 83281,
			reagents = {
				{4339, 10},
				{8343, 4},
				{2842, 2},
				{2324},
				{17028},
				{5500},
			},
		},
		[69432] = {
			item = 83296,
			reagents = {
				{14048, 2},
				{8170, 2},
				{14341},
				{6371},
			},
		},
		[69433] = {
			item = 83295,
			reagents = {
				{14048, 2},
				{7077, 4},
				{14341},
			},
		},
		[69434] = {
			item = 83293,
			reagents = {
				{14048, 4},
				{7068},
				{14341, 3},
				{4625},
			},
		},
		[69435] = {
			item = 83297,
			reagents = {
				{14048, 4},
				{7077, 4},
				{14341, 2},
				{4625},
			},
		},
		[69436] = {
			item = 83292,
			reagents = {
				{14048, 5},
				{7068, 2},
				{14341},
			},
		},
		[69437] = {
			item = 83294,
			reagents = {
				{14048, 8},
				{7068, 3},
				{14341, 4},
				{7078, 2},
				{4625, 4},
				{6037, 2},
			},
		},
		[100000] = {
			name = "Mining: Copper Vein", --1+
			tools = {2901},
			item = 2770,
			quantity = {2,4},
		},
		[100001] = {
			name = "Mining: Incendicite Mineral Vein", --65+
			tools = {2901},
			item = 3340,
			quantity = {1,2},
		},
		[100002] = {
			name = "Mining: Tin Vein", --65+
			tools = {2901},
			item = 2771,
			quantity = {2,4},
		},
		[100003] = {
			name = "Mining: Silver Vein", --75+
			tools = {2901},
			item = 2775,
			quantity = {2,4},
		},
		[100004] = {
			name = "Mining: Ooze Covered Silver Vein", --75+
			tools = {2901},
			item = 2775,
			quantity = {2,4},
		},
		[100005] = {
			name = "Mining: Lesser Bloodstone Deposit", --75+
			tools = {2901},
			item = 4278,
			quantity = {1,3},
		},
		[100006] = {
			name = "Mining: Iron Deposit", --125+
			tools = {2901},
			item = 2772,
			quantity = {2,4},
		},
		[100007] = {
			name = "Mining: Ooze Covered Iron Deposit", --125+
			tools = {2901},
			item = 2772,
			quantity = {2,4},
		},
		[100008] = {
			name = "Mining: Indurium Mineral Vein", --125+
			tools = {2901},
			item = 5833,
		},
		[100009] = {
			name = "Mining: Gold Vein", --155+
			tools = {2901},
			item = 2776,
			quantity = {2,4},
		},
		[100010] = {
			name = "Mining: Ooze Covered Gold Vein", --155+
			tools = {2901},
			item = 2776,
			quantity = {2,4},
		},
		[100011] = {
			name = "Mining: Mithril Deposit", --175+
			tools = {2901},
			item = 3858,
			quantity = {2,4},
		},
		[100012] = {
			name = "Mining: Ooze Covered Mithril Deposit", --175+
			tools = {2901},
			item = 3858,
			quantity = {2,4},
		},
		[100013] = {
			name = "Mining: Truesilver Deposit", --230+
			tools = {2901},
			item = 7911,
			quantity = {2,4},
		},
		[100014] = {
			name = "Mining: Ooze Covered Truesilver Deposit", --230+
			tools = {2901},
			item = 7911,
			quantity = {2,4},
		},
		[100015] = {
			name = "Mining: Dark Iron Deposit", --230+
			tools = {2901},
			item = 11370,
			quantity = {2,4},
		},
		[100016] = {
			name = "Mining: Small Thorium Vein", --245+
			tools = {2901},
			item = 10620,
			quantity = {2,3},
		},
		[100017] = {
			name = "Mining: Ooze Covered Thorium Vein", --245+
			tools = {2901},
			item = 10620,
			quantity = {2,3},
		},
		[100018] = {
			name = "Mining: Rich Thorium Vein", --275+
			tools = {2901},
			item = 10620,
			quantity = {4,5},
		},
		[100019] = {
			name = "Mining: Ooze Covered Rich Thorium Vein", --275+
			tools = {2901},
			item = 10620,
			quantity = {4,5},
		},
		[100020] = {
			name = "Mining: Hakkari Thorium Vein", --275+
			tools = {2901},
			item = 10620,
			quantity = {4,5},
		},
		[100021] = {
			name = "Mining: Small Obsidian Chunk", --305+
			tools = {2901},
			item = 22202,
		},
		[100022] = {
			name = "Mining: Large Obsidian Chunk", --305+
			tools = {2901},
			item = 22203,
			quantity = {1,3},
		},
		[100023] = {
			name = "Mining: Gemstone Deposit", --310+
			tools = {2901},
			item = 55252,
		},
	},
}