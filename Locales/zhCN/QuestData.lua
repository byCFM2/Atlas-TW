---
--- QuestData_enUS.lua - Atlas quest data definitions for English localization
---
--- This file contains all quest data definitions for Atlas-TW in English.
--- It includes quest 信息, rewards, locations, and requirements
--- for all instances and zones supported by Atlas-TW.
---
--- Features:
--- - Complete quest database for all instances
--- - Quest reward definitions
--- - Quest location and NPC 信息
--- - Quest inheritance system
--- - Localized quest data for English
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

if GetLocale() ~= "zhCN" then return end

---------------
--- COLOURS ---
---------------
local red = AtlasTW.Colors.RED
local white = AtlasTW.Colors.WHITE
local green = AtlasTW.Colors.GREEN2
local blue = AtlasTW.Colors.BLUE
local yellow = AtlasTW.Colors.YELLOW2

----------------------------------------------
------------- Quest Instance Data ------------
----------------------------------------------

local kQuestInstanceData = {}

---
--- Creates an inherited quest object using metatable inheritance
--- @param baseQuest table The base quest object to inherit from
--- @param overrides table The quest-specific overrides to apply
--- @return table The new quest object with inheritance
--- @usage local newQuest = createInheritedQuest(baseQuest, { Title = "New Title" })
---
local function createInheritedQuest(baseQuest, overrides)
    local metatable = { __index = baseQuest }
    setmetatable(overrides, metatable)
    return overrides
end

--------------- The Deadmines ---------------
kQuestInstanceData.TheDeadmines = {
    Story =
    "死亡矿井曾是人类王国中最伟大的黄金生产中心，但在第一次战争中部落洗劫暴风城后便被废弃了。如今迪菲亚兄弟会占据了这里，将黑暗的隧道变成了他们的私人圣所。据传这些盗贼征募了狡猾的地精，帮助他们在矿井深处建造某种可怕的东西——但究竟是什么仍不得而知。传言进入死亡矿井的道路要经过那个宁静而不起眼的村庄——月溪镇。",
    Caption = "死亡矿井",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheDeadmines.Alliance[1] = {
    Title = "红色丝质面罩",
    Level = 17,
    Attain = 14,
    Aim = "给哨兵岭哨塔的哨兵瑞尔带回10条红色丝质面罩。",
    Location = "哨兵瑞尔 (西部荒野 - 哨兵岭 "..yellow.."56, 47"..white..")",
    Note = "你可以从死亡矿井的矿工那里获得红色丝质面罩，或者在副本所在的城镇里。完成迪菲亚兄弟会任务线，直到你需要击杀艾德温·范克里夫，此任务即可解锁。",
    Prequest = "迪菲亚兄弟会",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 2074 }, --Solid Shortblade One-Hand, Sword
        { id = 2089 }, --Scrimshaw Dagger One-Hand, Dagger
        { id = 6094 }, --Piercing Axe Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[2] = {
    Title = "收集记忆",
    Level = 18,
    Attain = 14,
    Aim = "给暴风城的维尔德·蓟草带回4张矿业工会会员卡。",
    Location = "维尔德·蓟草 (暴风城 - 矮人区 "..yellow.."65, 21"..white..")",
    Note = "这些卡片掉落在副本外的亡灵怪物身上，就在附近区域 "..yellow.."[3]"..white.." 在入口地图上",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 2037 }, --Tunneler's Boots Feet, Mail
        { id = 2036 }, --Dusty Mining Gloves Hands, Leather
    }
}
kQuestInstanceData.TheDeadmines.Alliance[3] = {
    Title = "我的兄弟……",
    Level = 20,
    Attain = 15,
    Aim = "将工头希斯耐特的探险者协会徽章交给暴风城的维尔德·蓟草。",
    Location = "维尔德·蓟草 (暴风城 - 矮人区 "..yellow.."65,21"..white..")",
    Note = "工头希斯耐特在副本外的亡灵区域"..yellow.."[3]"..white.." 在入口地图上",
    Rewards = {
        Text = "奖励：",
        { id = 1893 }, --Miner's Revenge Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[4] = {
    Title = "地底突袭",
    Level = 20,
    Attain = 15,
    Aim = "从死亡矿井中带回小型高能发动机，将其带给暴风城矮人区中的沉默的舒尼。",
    Location = "肖尼沉默者 (暴风城 - 矮人区 "..yellow.."55,12"..white..")",
    Note = "前置任务可以从 诺恩 (丹莫罗 - 诺莫瑞根复兴城 "..   yellow.."24.5,30.4"..   white..") 处获得。\n斯尼德的伐木机掉落 小型高能发动机 "..yellow.."[3]"..white.."。",
    Prequest = "沉默的舒尼",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 7606 }, --Polar Gauntlets Hands, Mail
        { id = 7607 }, --Sable Wand Wand
    }
}
kQuestInstanceData.TheDeadmines.Alliance[5] = {
    Title = "迪菲亚兄弟会",
    Level = 22,
    Attain = 14,
    Aim = "格里安·斯托曼要求你去和湖畔镇的威利谈一谈。",
    Location = "格里安·斯托曼 (西部荒野 - 哨兵岭 "..yellow.."56,47"..white..")",
    Note = "你从这里开始这个任务线 格里安·斯托曼 (西部荒野 - 哨兵岭 "..   yellow.."56,47"..white..").\n埃德温·范克里夫是死亡矿井的最终老板。你可以在他的船顶找到他"..yellow.."[6]"..white..".",
    Prequest = "迪菲亚兄弟会",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6087 }, --Chausses of 西fall Legs, Mail
        { id = 2041 }, --Tunic of 西fall Chest, Leather
        { id = 2042 }, --Staff of 西fall Staff
    }
}
kQuestInstanceData.TheDeadmines.Alliance[6] = {
    Title = "正义试炼",
    Level = 22,
    Attain = 20,
    Aim = "去和铁炉堡的乔丹·斯迪威尔谈一谈。",
    Location = "乔丹·斯迪威尔 (丹莫罗 - 铁炉堡入口 "..yellow.."52,36"..white..")",
    Note = red.."圣骑士专用"..white..": 要查看注释，请点击 "..yellow.."[正义试炼 信息]"..white..".",
    Prequest = "勇气之书 -> 正义试炼",
    Folgequest = "正义试炼",
    Rewards = {
        Text = "奖励：",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = { 2, "只有圣骑士才能接到这个任务！\n\n1. 你可以从 "..yellow.."[死亡矿井]"..white.." 附近 "..yellow.."[3]"..white.." 的地精木刻师那里获得 白石橡木。\n\n2. 要获得 白洛尔的精制矿石，你必须与 白洛尔·石手 (洛克莫丹 - 塞尔萨玛 "..yellow.."35,44"..white..") 交谈。他会给你“白洛尔的矿石”任务。你可以在 "..yellow.."71,21"..white.." 的一棵树后找到 乔丹的矿石。\n\n3. 你可以在 "..yellow.."[影牙城堡]"..white.." 的 "..yellow.."[3]"..white.." 处获得 乔丹的铁锤。\n\n4. 要获得 科尔宝石，你必须去寻找 桑迪斯·织风 (黑海岸 - 奥伯丁 "..yellow.."37,40"..white..") 并完成“寻找科尔宝石”任务。为此，你必须在 "..yellow.."[黑暗深渊]"..white.." 前杀死黑暗深渊先知或女祭司。他们会掉落被污染的科尔宝石。桑迪斯·织风 会为你净化它。", },
}
kQuestInstanceData.TheDeadmines.Alliance[7] = {
    Title = "未寄出的信",
    Level = 22,
    Attain = 16,
    Aim = "将艾德温·范克里夫的信交给巴隆斯·阿历克斯顿。",
    Location = "未寄出的信 (掉落自 艾德温·范克里夫 "..yellow.."[6]"..white..")",
    Note = "巴隆斯·阿历克斯顿 在 暴风城，光明大教堂旁边 "..yellow.."49,30",
    Folgequest = "巴吉尔·特雷德",

}
kQuestInstanceData.TheDeadmines.Alliance[8] = {
    Title = "葛瑞森船长的复仇",
    Level = 22,
    Attain = 15,
    Aim = "结束曲奇的小命。",
    Location = "葛瑞森船长 (西部荒野 - 灯塔 "..yellow.."30,86"..white..")",
    Note = "此任务线开始于 西部荒野 西北部的岛屿；地上的红书 "..   yellow.."26.1,16.5"..white..")。\n",
    Prequest = "航海中食物的思考？",
    Rewards = {
        Text = "奖励：",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Alliance[9] = {
    Title = "收获傀儡之谜之一",
    Level = 19,
    Attain = 15,
    Aim = "为哨兵岭的克里斯托弗·赫温收集1个破碎的魔像符文。",
    Location = "马尔蒂莫·加特赛德 (西部荒野 - 北 from 金海岸矿洞 "..yellow.."31.3,37.6"..white..")",
    Note = "你从这里开始这个任务线 克里斯托弗·赫温 (西部荒野 - 哨兵岭旅店 "..yellow.."52.3,52.8"..white..")。\n任务线共有16步。最终奖励蓝色物品：1) 副手 智力/暗影抗性/伤害和治疗，2) 锁甲护肩 力量/耐力，3) 皮甲手套 力量/敏捷/耐力\n吉尔尼德位于 "..   yellow.."[4]"..white.."。",
    Prequest = "丰收傀儡之谜 VIII",
    Folgequest = "丰收傀儡之谜 X",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60684 }, --Tinkering Belt Waist, Leather
        { id = 60685 }, --Safety Wraps Wrist, Cloth
        { id = 60686 }, --Harvest Golem Arm Two-Hand, Mace
    }
}
kQuestInstanceData.TheDeadmines.Alliance[10] = {
    Title = "关上水龙头",
    Level = 20,
    Attain = 14,
    Aim = "潜入西部荒野的死亡矿井并获得维斯的热饮。",
    Location = "Renzik 'The Shiv' (暴风城 - 旧城区 "..yellow.."76, 60"..white..")",
    Note = "你从同一个NPC处开始这个任务线。杰里德·维斯 位于 "..yellow.."[1]",
    Prequest = "西部荒野的苦工们 -> 危险的快递",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 70239 }, --Operative Cloak Back
        { id = 70240 }, --Cuffs of Integrity Wrist, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[1] = {
    Title = "原型机图纸",
    Level = 18,
    Attain = 16,
    Aim = "前往死亡矿井，把原型拆解者X0-1设计图带给乌雷克斯·奥兹尔纳特",
    Location = "乌雷克斯·奥兹尔纳特 (杜隆塔尔 - 怒水港 "..yellow.."58.3,25.7"..white..")",
    Note = "斯尼德掉落 原型拆解者 X0-1 设计图 "..yellow.."[3]"..white.."。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 81316 }, --Foe Chopper Two-Hand, Axe
        { id = 81317 }, --Shining Electro-lantern Held In Off-hand
    }
}
kQuestInstanceData.TheDeadmines.Horde[2] = {
    Title = "葛瑞森船长的复仇",
    Level = 22,
    Attain = 15,
    Aim = "结束曲奇的小命。",
    Location = "葛瑞森船长 (西部荒野 - 灯塔 "..yellow.."30,86"..white..")",
    Note = "此任务线开始于 西部荒野 西北部的岛屿；地上的红书 "..   yellow.."26.1,16.5"..white..")。\n",
    Prequest = "航海中食物的思考？",
    Rewards = {
        Text = "奖励：",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[3] = {
    Title = "部落防御者之斧",
    Level = 18,
    Attain = 15,
    Aim = "在十字路口与部落守卫交谈",
    Location = "比尔吉特·克兰斯顿 <Portal Trainer> (雷霆崖"..yellow.."34.4,20.3"..white..")",
    Note = "你从这里开始这个任务线 纳加尔·死眼 (十字路口 "..yellow.."51.2,29.1"..white..")。\n此任务 "..   red..   "仅将你传送至西部荒野"..white.."。你可以完成此任务并在完成任务线后获得奖励，或者将其用作西部荒野传送点并重新接取任务。",
    Prequest = "部落防御者之斧",
    Folgequest = "部落防御者之斧",
    Rewards = {
        Text = "奖励：",
        { id = 40065 }, --Horde Defender's Axe Two-Hand, Axe
    }
}

--------------- Wailing Caverns ---------------
kQuestInstanceData.WailingCaverns = {
    Story = "不久前，一位名叫纳拉雷克斯的暗夜精灵德鲁伊在贫瘠之地的中心发现了一个地下洞穴网络。这些被称作'哀嚎洞穴'的天然洞穴中布满了蒸汽裂隙，喷发时会发出悠长而悲伤的哀号。纳拉雷克斯相信他可以利用洞穴中的地下泉水为贫瘠之地恢复生机和肥沃——但这需要汲取传说中翡翠梦境的能量。然而一旦与梦境连接，德鲁伊的愿景不知怎地变成了噩梦。很快哀嚎洞穴开始改变——水源变得污浊，洞内原本温驯的生物蜕变成了凶残致命的掠食者。据说纳拉雷克斯本人仍然留在迷宫的深处，被困在翡翠梦境的边缘之外。就连他曾经的弟子也被主人的梦魇所腐化——变成了邪恶的尖牙德鲁伊。",
    Caption = "哀嚎洞穴",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.WailingCaverns.Alliance[1] = {
    Title = "变异皮革",
    Level = 17,
    Attain = 13,
    Aim = "哀嚎洞穴的纳尔帕克想要20张变异皮革。",
    Location = "纳尔帕克 (贫瘠之地 - 哀嚎洞穴 "..yellow.."47,36"..white..")",
    Note = "副本内和入口前的所有变异怪物都会掉落皮革。\n纳尔帕克位于实际洞穴入口上方的一个隐蔽洞穴中。找到他最简单的方法似乎是跑上入口外后面的山丘，然后跳到洞穴入口上方的狭窄岩架上。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6480 }, --Slick Deviate Leggings Legs, Leather
        { id = 918 },  --Deviate Hide Pack Bag
    }
}
kQuestInstanceData.WailingCaverns.Alliance[2] = {
    Title = "港口的麻烦",
    Level = 18,
    Attain = 14,
    Aim = "棘齿城的起重机操作员比戈弗兹让你从疯狂的马格利什那儿取回一瓶99年波尔多陈酿，疯狂的马格利什就藏在哀嚎洞穴里。",
    Location = "起重机操作员比戈弗兹 (贫瘠之地 - 棘齿城 "..yellow.."63,37"..white..")",
    Note = "你在进入副本前杀死 疯狂的马格利什 即可获得瓶子。当你第一次进入洞穴时，立即向右转，在通道尽头找到他。他潜行在入口地图上的 ".. yellow.."[2]"..white.." 处的墙边。"
}
kQuestInstanceData.WailingCaverns.Alliance[3] = {
    Title = "智慧饮料",
    Level = 18,
    Attain = 13,
    Aim = "收集6份哀嚎香精，把它们交给棘齿城的麦伯克·米希瑞克斯。",
    Location = "麦伯克·米希瑞克斯 (贫瘠之地 - 棘齿城 "..yellow.."62,37"..white..")",
    Note = "前置任务也可以从 麦伯克·米希瑞克斯 处获得。\n副本内和副本前的所有原生质敌人都会掉落香精。",
    Prequest = "迅猛龙角",
}
kQuestInstanceData.WailingCaverns.Alliance[4] = {
    Title = "清除变异者",
    Level = 21,
    Attain = 15,
    Aim = "哀嚎洞穴的厄布鲁要求你杀掉7只变异破坏者、7只剧毒飞蛇、7只变异蹒跚者和7只变异尖牙风蛇。",
    Location = "厄布鲁 (贫瘠之地 - 哀嚎洞穴 "..yellow.."47,36"..white..")",
    Note = "厄布鲁 位于实际洞穴入口上方的一个隐蔽洞穴中。找到他最简单的方法似乎是跑上入口外后面的山丘，然后跳到洞穴入口上方的狭窄岩架上。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6476 }, --Pattern: Deviate Scale Belt Pattern
        { id = 8071 }, --Sizzle Stick Wand
        { id = 6481 }, --Dagmire Gauntlets Hands, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[5] = {
    Title = "发光的碎片",
    Level = 26,
    Attain = 15,
    Aim = "寻找更多有关这块噩梦碎片的信息。",
    Location = "The 发光的碎片 (掉落自 吞噬者穆坦努斯 "..yellow.."[9]"..white..")",
    Note = "只有当你杀死了四位尖牙德鲁伊首领并护送入口处的牛头人德鲁伊后，吞噬者穆坦努斯 才会出现。\n当你拿到碎片后，必须将其带到 棘齿城 的银行，然后再带回 哀嚎洞穴 上方的山顶交给 菲拉·古风。",
    Folgequest = "在噩梦中",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 10657 }, --Talbar Mantle Shoulder, Cloth
        { id = 10658 }, --Quagmire Galoshes Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[6] = {
    Title = "毒蛇花",
    Level = 18,
    Attain = 16,
    Aim = "为雷霆崖的药剂师扎玛收集10朵毒蛇花。",
    Location = "奥兰达利亚·夜歌 (奥伯丁 - 黑海岸 "..yellow.."37.7,40.7"..white..")",
    Note = "你可以在副本前的洞穴内和副本内获得 毒蛇花。拥有草药学技能的玩家可以在小地图上看到这些植物。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 51850 }, --Greenweave Sash Waist, Cloth
        { id = 51851 }, --Verdant Boots Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[7] = {
    Title = "陷入梦魇",
    Level = 19,
    Attain = 16,
    Aim = "奥兰达利亚·夜歌想让你进入北贫瘠之地的哀嚎洞穴，将纳拉雷克斯从梦魇中解救出来。在山洞里找到他的弟子学习如何解救他。当你解救纳拉雷克斯时，回到奥兰达利亚·夜歌身边。",
    Location = "奥兰达利亚·夜歌 (奥伯丁 - 黑海岸 "..yellow.."37.7,40.7"..white..")",
    Note = "只有当你杀死了四位尖牙德鲁伊首领并护送入口处的牛头人德鲁伊后，吞噬者穆坦努斯 才会出现。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 51848 }, --Ancient Elven Robes Chest, Cloth
        { id = 51849 }, --Thunderhorn Two-Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Alliance[8] = {
    Title = "杂草丛生",
    Level = 20,
    Attain = 16,
    Aim = "奥伯丁的桑迪斯·织风需要哀嚎洞穴中的\"异常的狂野生长\"掉落的样本。",
    Location = "桑迪斯·织风 (奥伯丁 - 黑海岸 "..yellow.."37.4,40.1"..white..")",
    Note = "元素生物 - 异常的狂野生长 会掉落样本。",
    Rewards = {
        Text = "奖励：1 或 2",
        { id = 3827, quantity = 3 }, --Mana Potion Potion
        { id = 1710, quantity = 3 }, --Greater Healing Potion Potion
    }
}
kQuestInstanceData.WailingCaverns.Horde[1] = kQuestInstanceData.WailingCaverns.Alliance[1]
kQuestInstanceData.WailingCaverns.Horde[2] = kQuestInstanceData.WailingCaverns.Alliance[2]
kQuestInstanceData.WailingCaverns.Horde[3] = {
    Title = "毒蛇花",
    Level = 18,
    Attain = 14,
    Aim = "为雷霆崖的药剂师扎玛收集10朵毒蛇花。",
    Location = "药剂师扎玛 (雷霆崖 - 灵魂高地 "..yellow.."22,20"..white..")",
    Note = "药剂师扎玛 位于 灵魂高地 下方的一个洞穴中。你可以从 药剂师赫布瑞姆 (贫瘠之地 - 十字路口 "..yellow.."51,30"..white..") 处获得前置任务。\n你可以在副本前的洞穴内和副本内获得 毒蛇花。拥有草药学技能的玩家可以在小地图上看到这些植物。",
    Prequest = "菌类孢子 -> 药剂师扎玛",
    Rewards = {
        Text = "奖励：",
        { id = 10919 }, --Apothecary Gloves Hands, Cloth
    }
}
kQuestInstanceData.WailingCaverns.Horde[4] = kQuestInstanceData.WailingCaverns.Alliance[3]
kQuestInstanceData.WailingCaverns.Horde[5] = kQuestInstanceData.WailingCaverns.Alliance[4]
kQuestInstanceData.WailingCaverns.Horde[6] = {
    Title = "尖牙德鲁伊",
    Level = 22,
    Attain = 11,
    Aim = "将考布莱恩宝石、安娜科德拉宝石、皮萨斯宝石和瑟芬迪斯宝石交给雷霆崖的纳拉·蛮鬃。",
    Location = "纳拉·蛮鬃 (雷霆崖 - 长者高地 "..yellow.."75,31"..white..")",
    Note = "任务线开始于 哈缪尔·符文图腾 (雷霆崖 - 长者高地 "..yellow.."78,28"..white..")\n这4位德鲁伊掉落宝石 "..yellow.."[2]"..white..", "..yellow.."[3]"..white..", "..yellow.."[5]"..   white..", "..yellow.."[7]"..white.."。",
    Prequest = "贫瘠之地的绿洲 -> 纳拉·蛮鬃",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6505 }, --Crescent Staff Staff
        { id = 6504 }, --Wingblade Main Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Horde[7] = kQuestInstanceData.WailingCaverns.Alliance[5]
kQuestInstanceData.WailingCaverns.Horde[8] = {
    Title = "奥术武器",
    Level = 18,
    Attain = 14,
    Aim = "从哀嚎洞穴中给卓克盖洛克带去5块月光木材、一块巨蛇水晶和一份变换精华。",
    Location = "卓克盖洛克 <Stonemaul Clan> (on a bank of 怒水河 in the 贫瘠之地 "..yellow.."62.4,10.8"..white..")",
    Note = red.."法师专用。"..white.." 任务线开始于 幽若达 <法师训练师> (奥格瑞玛)，任务为 '掌握奥术'。\n你可以从 "..yellow.."小怪"..white.." 身上获得 月光木材，从 瑟芬迪斯领主 <尖牙德鲁伊首领> "..yellow.."[7]"..white.." 处获得 巨蛇水晶，从 皮萨斯领主 <尖牙德鲁伊首领> "..yellow.."[5]"..white.." 处获得 变换精华。",
    Prequest = "掌握奥术",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 80860 }, --Staff of the Arcane Path Staff
        { id = 80861 }, --Spellweaving Dagger One-Hand, Dagger
    }
}
kQuestInstanceData.WailingCaverns.Horde[9] = {
    Title = "与科卡尔的梦对抗",
    Level = 23,
    Attain = 17,
    Aim = "在哀嚎洞穴中杀死赞达拉·风蹄，并将她的头带回贫瘠之地的纳尔帕克身边。",
    Location = "纳尔帕克 (贫瘠之地 - 哀嚎洞穴 "..yellow.."47,36"..white..")",
    Note = "你需要击杀 赞达拉·风蹄 "..yellow.."[6]"..white.." 并带回她的头颅。",
    Rewards = {
        Text = "奖励：",
        { id = 70224 }, --Kolkar Drape Back
    }
}

--------------- Ragefire Chasm ---------------
kQuestInstanceData.RagefireChasm = {
    Story = "怒焰裂谷是一个火山洞穴网络，位于兽人的新首都奥格瑞玛的地下。最近有传言称，一个效忠于恶魔暗影议会的邪教组织已在裂谷的火焰深处建立了据点。这个被称作灼热之刃的邪教组织威胁着杜隆塔尔的主权。许多人相信兽人大酋长萨尔知晓刀锋的存在，之所以没有摧毁它，是希望其成员能将他直接引向暗影议会。无论如何，从怒焰裂谷中散发出的黑暗力量可能会毁掉兽人们奋战至今所取得的一切。",
    Caption = "怒焰裂谷",
    Horde = {}
}
kQuestInstanceData.RagefireChasm.Horde[1] = {
    Title = "试探敌人",
    Level = 15,
    Attain = 9,
    Aim = "在奥格瑞玛找到怒焰裂谷，杀掉8个怒焰穴居人和8个怒焰萨满祭司，然后向雷霆崖的拉哈罗复命。",
    Location = "拉哈罗 (雷霆崖 - 长者高地 "..yellow.."70,29"..white..")",
    Note = "你可以在怒焰裂谷的入口处找到怒焰穴居人和怒焰萨满祭司。",
}
kQuestInstanceData.RagefireChasm.Horde[2] = {
    Title = "毁灭之力",
    Level = 16,
    Attain = 9,
    Aim = "将《暗影法术研究》和《扭曲虚空的魔法》这两本书交给幽暗城的瓦里玛萨斯。",
    Location = "瓦里玛萨斯 (幽暗城 - 皇家区 "..yellow.."56,92"..white..")",
    Note = "灼热之刃信徒和术士会掉落这些书",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 15449 }, --Ghastly Trousers Legs, Cloth
        { id = 15450 }, --Dredgemire Leggings Legs, Leather
        { id = 15451 }, --Gargoyle Leggings Legs, Mail
    }
}
kQuestInstanceData.RagefireChasm.Horde[3] = {
    Title = "寻找背包",
    Level = 16,
    Attain = 9,
    Aim = "在怒焰裂谷搜寻玛尔·恐怖图腾的尸体以及他留下的东西。",
    Location = "拉哈罗 (雷霆崖 - 长者高地 "..yellow.."70,29"..white..")",
    Note = "你可以在 "..yellow.."[1]"..white.." 找到 玛尔·恐怖图腾。拿到背包后，你必须把它带回 雷霆崖 给 拉哈罗",
    Folgequest = "归还背包",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 15452 }, --Featherbead Bracers Wrist, Cloth
        { id = 15453 }, --Savannah Bracers Wrist, Leather
    }
}
kQuestInstanceData.RagefireChasm.Horde[4] = {
    Title = "隐藏的敌人",
    Level = 16,
    Attain = 9,
    Aim = "将军官的徽章交给奥格瑞玛的萨尔。",
    Location = "萨尔 (奥格瑞玛 - 智慧谷 "..yellow.."31,37"..white..")",
    Note = "你可以在 "..yellow.."[4]"..white.." 找到 巴札兰，在 "..yellow.."[3]"..white.." 找到 祈求者耶戈什。任务线开始于 奥格瑞玛 的大酋长 萨尔。",
    Prequest = "隐藏的敌人",
    Folgequest = "隐藏的敌人",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 15443 }, --Kris of Orgrimmar One-Hand, Dagger
        { id = 15445 }, --Hammer of Orgrimmar Main Hand, Mace
        { id = 15424 }, --Axe of Orgrimmar Two-Hand, Axe
        { id = 15444 }, --Staff of Orgrimmar Staff
    }
}
kQuestInstanceData.RagefireChasm.Horde[5] = {
    Title = "饥饿者塔拉加曼",
    Level = 16,
    Attain = 9,
    Aim = "进入怒焰裂谷，杀死饥饿者塔拉加曼，然后把他的心脏交给奥格瑞玛的尼尔鲁·火刃。",
    Location = "尼尔鲁·火刃 (奥格瑞玛 - 暗影裂口 "..yellow.."49,50"..white..")",
    Note = "你可以在 "..yellow.."[2]"..white.." 找到 饥饿者塔拉加曼。",
}

--------------- Uldaman ---------------
kQuestInstanceData.Uldaman = {
    Story =
    "奥达曼是一座古老的泰坦地下城，自世界诞生以来就深埋于地底。矮人的挖掘工作最近打通了这座被遗忘的城市，释放出了泰坦最初失败的造物：石腭怪。传说泰坦用石头创造了石腭怪。当他们认为实验失败后，泰坦将石腭怪封印起来并再次尝试——最终创造了矮人种族。矮人诞生的秘密被记录在传说中的诺甘农圆盘上——巨大的泰坦神器，位于这座古城的最深处。最近，黑铁矮人对奥达曼发起了一系列入侵，希望为他们的火焰主人拉格纳罗斯夺取这些圆盘。然而，守护着这座地下城的是几位守护者——巨大的活石构造体，会碾碎任何不幸的入侵者。圆盘本身由一位巨大而有知觉的石头守护者阿扎达斯看守。甚至有传言称，矮人那些石肤祖先——土灵，仍然栖息在这座城市隐秘的深处。",
    Caption = "奥达曼",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Uldaman.Alliance[1] = {
    Title = "一线希望",
    Level = 35,
    Attain = 33,
    Aim = "找到勘察员雷杜尔，告诉他铁趾格雷兹还活着。",
    Location = "勘察员雷杜尔 (荒芜之地 " .. yellow .. "53,43" .. white .. ")",
    Note = "前置任务开始于 弄皱的地图 (荒芜之地 " .. yellow .. "53,33" .. white .. ")。\n你可以在进入副本前找到 铁趾格雷兹，位于入口地图上的 " .. yellow .. "[1]" .. white .. " 处",
    Prequest = "一线希望",
    Folgequest = "铁趾的护符",
}
kQuestInstanceData.Uldaman.Alliance[2] = {
    Title = "铁趾的护符",
    Level = 40,
    Attain = 35,
    Aim = "找到铁趾的护符，把它交给奥达曼的铁趾。",
    Location = "铁趾格雷兹 (奥达曼 " .. yellow .. "[1] 在 入口 地图" .. white .. ")",
    Note = "护符掉落自 马格雷甘·深影，位于入口地图上的 " .. yellow .. "[2]" .. white .. " 处。",
    Prequest = "一线希望",
    Folgequest = "铁趾的遗愿",
}
kQuestInstanceData.Uldaman.Alliance[3] = {
    Title = "意志石板",
    Level = 45,
    Attain = 35,
    Aim = "找到意志石板，把它们交给铁炉堡的顾问贝尔格拉姆。",
    Location = "顾问贝尔格拉姆 (铁炉堡 - 探索大厅 " .. yellow .. "77,10" .. white .. ")",
    Note = "石板位于 " .. yellow .. "[8]" .. white .. "。",
    Prequest = "铁趾的护符 -> 邪恶的使者",
    Rewards = {
        Text = "奖励：",
        { id = 6723 }, --Medal of Courage Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[4] = {
    Title = "能量石",
    Level = 36,
    Attain = 30,
    Aim = "给荒芜之地的里格弗兹带去8块德提亚姆能量石和8块安纳洛姆能量石。",
    Location = "里格弗兹 (荒芜之地 " .. yellow .. "42,52" .. white .. ")",
    Note = "这些能量石可以在副本前和副本内的任何暗炉敌人身上找到。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9522 },  --Energized Stone Circle Shield
        { id = 10358 }, --Duracin Bracers Wrist, Mail
        { id = 10359 }, --Everlast Boots Feet, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[5] = {
    Title = "阿戈莫德的命运",
    Level = 38,
    Attain = 30,
    Aim = "收集4个雕纹石罐，把它们交给洛克莫丹的勘察员基恩萨·铁环。",
    Location = "勘察员基恩萨·铁环 (洛克莫丹 - 铁环挖掘场 " .. yellow .. "65,65" .. white .. ")",
    Note = "前置任务开始于 勘察员塔伯斯·雷矛 (铁炉堡 - 探险者协会 " .. yellow .. "74,12" .. white .. ")。\n这些石罐散落在副本前的洞穴各处。",
    Prequest = "铁环挖掘场需要你！ -> 莫达洛克",
    Rewards = {
        Text = "奖励：",
        { id = 4980 }, --Prospector Gloves Hands, Leather
    }
}
kQuestInstanceData.Uldaman.Alliance[6] = {
    Title = "化解灾难",
    Level = 40,
    Attain = 30,
    Aim = "把雷乌纳石板带给迷失者塞尔杜林。",
    Location = "迷失者塞尔杜林 (荒芜之地 " .. yellow .. "51,76" .. white .. ")",
    Note = "石板位于洞穴北部，副本前一条隧道的东端。在入口地图上，它位于 " .. yellow .. "[3]" .. white .. "。",
    Folgequest = "远赴铁炉堡",
    Rewards = {
        Text = "奖励：",
        { id = 4746 }, --Doomsayer's Robe Chest, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[7] = {
    Title = "失踪的矮人",
    Level = 40,
    Attain = 35,
    Aim = "在奥达曼找到巴尔洛戈。",
    Location = "勘察员塔伯斯·雷矛 (铁炉堡 - 探险者协会 " .. yellow .. "75,12" .. white .. ")",
    Note = "巴尔洛戈 位于 " .. yellow .. "[1]" .. white .. "。",
    Folgequest = "密室",
}
kQuestInstanceData.Uldaman.Alliance[8] = {
    Title = "密室",
    Level = 40,
    Attain = 35,
    Aim = "阅读巴尔洛戈的日记，探索密室，然后向铁炉堡的勘察员塔伯斯·雷矛汇报。",
    Location = "巴尔洛戈 (奥达曼 " .. yellow .. "[1]" .. white .. ")",
    Note = "密室位于 " .. yellow .. "[4]" .. white .. "。要打开密室，你需要从 鲁维罗什 " .. yellow .. "[3]" .. white .. " 处获得 索尔之杖，并从 巴尔洛戈的箱子 " .. yellow .. "[1]" .. white .. " 中获得 尼基夫徽章。将这两件物品组合成 史前法杖。在 " .. yellow .. "[3] 和 [4]" .. white .. " 之间的地图室使用法杖召唤 艾隆纳亚。杀死她后，跑进她出来的房间以完成任务。",
    Prequest = "失踪的矮人",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9626 }, --Dwarven Charge Two-Hand, Axe
        { id = 9627 }, --Explorer's League Lodestar Held In Off-hand
    }
}
kQuestInstanceData.Uldaman.Alliance[9] = {
    Title = "破碎的项链",
    Level = 41,
    Attain = 37,
    Aim = "找到破碎的项链的来源，从而了解其潜在的价值。",
    Location = "破碎的项链 (random 掉落自 奥达曼)",
    Note = "将项链带给 塔瓦斯德·基瑟尔 (铁炉堡 - 秘法区 " .. yellow .. "36,3" .. white .. ")。",
    Folgequest = "昂贵的知识",
}
kQuestInstanceData.Uldaman.Alliance[10] = {
    Title = "回到奥达曼",
    Level = 42,
    Attain = 37,
    Aim = "去奥达曼寻找塔瓦斯的魔法项链，被杀的圣骑士是最后一个拿着它的人。",
    Location = "塔瓦斯德·基瑟尔 (铁炉堡 - 神秘法区 " .. yellow .. "36,3" .. white .. ")",
    Note = "这位圣骑士位于 " .. yellow .. "[2]" .. white .. "。",
    Prequest = "昂贵的知识",
    Folgequest = "寻找宝石",
}
kQuestInstanceData.Uldaman.Alliance[11] = {
    Title = "寻找宝石",
    Level = 43,
    Attain = 40,
    Aim = "在奥达曼寻找红宝石、蓝宝石和黄宝石的下落。找到它们之后，通过塔瓦斯德给你的占卜之瓶和他进行联系。",
    Location = "圣骑士的遗体 (奥达曼 " .. yellow .. "[2]" .. white .. ")",
    Note = "宝石分别位于：显眼的石罐 " .. yellow .. "[1]" .. white .. "，暗炉储藏箱 " .. yellow .. "[8]" .. white .. "，以及 格瑞姆洛克 " .. yellow .. "[9]" .. white .. " 身上。注意，打开暗炉储藏箱时，会生成一些怪物并攻击你。\n使用塔瓦斯的占卜之瓶提交任务并接取后续任务。",
    Prequest = "回到奥达曼",
    Folgequest = "修复项链",
}
kQuestInstanceData.Uldaman.Alliance[12] = {
    Title = "修复项链",
    Level = 44,
    Attain = 37,
    Aim = "从奥达曼最强大的石人身上获得能量源，然后将其交给铁炉堡的塔瓦斯德。",
    Location = "塔瓦什的占卜碗",
    Note = "破碎项链的能量源 掉落自 阿扎达斯 " .. yellow .. "[10]" .. white .. "。",
    Prequest = "寻找宝石",
    Rewards = {
        Text = "奖励：",
        { id = 7673 }, --Talvash's Enhancing Necklace Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[13] = {
    Title = "奥达曼的蘑菇",
    Level = 42,
    Attain = 36,
    Aim = "收集12颗紫色蘑菇，把它们交给塞尔萨玛的加克。",
    Location = "加克 (洛克莫丹 - 塞尔萨玛 " .. yellow .. "37,49" .. white .. ")",
    Note =    "这些蘑菇散落在副本各处。如果开启了寻找草药并且接取了任务，草药学玩家可以在小地图上看到它们。",
    Prequest = "荒芜之地的试剂",
    Rewards = {
        Text = "奖励：",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[14] = {
    Title = "失而复得",
    Level = 43,
    Attain = 33,
    Aim = "到奥达曼的北部大厅去找到克罗姆·粗臂的箱子，从里面拿出他的宝贵财产，然后回到铁炉堡把东西交给他。",
    Location = "克罗姆·粗臂 (铁炉堡 - 探险者协会 "..yellow.."74,9"..white..")",
    Note =
        "你可以在进入副本前找到宝藏。它位于洞穴北部，第一条隧道的东南端。在入口地图上，它位于 " .. yellow .. "[4]" .. white .. "。",
}
kQuestInstanceData.Uldaman.Alliance[15] = {
    Title = "白金圆盘",
    Level = 47,
    Attain = 40,
    Aim = "和石头守护者交谈，从他那里了解更多古代的知识。一旦你了解到了所有的内容之后就激活诺甘农圆盘。",
    Location = "诺甘农圆盘 (奥达曼 "..yellow.."[11]"..white..")",
    Note =
        "接取任务后，与圆盘左侧的岩石看守者交谈。然后再次使用白金圆盘以获取微型圆盘，你需要将其带给 资深探险家麦格拉斯 (铁炉堡 - 探险者协会 " ..
        yellow .. "69,18" .. white .. ")。后续任务由附近的另一个NPC开始。",
    Folgequest = "奥丹姆的线索",
    Rewards = {
        Text = "奖励：1 和 2 或 3",
        { id = 9587 },               --Thawpelt Sack Bag
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[16] = {
    Title = "奥达曼的能量源",
    Level = 40,
    Attain = 35,
    Aim = "找到一个黑曜石能量源，将其交给尘泥沼泽的塔贝萨。",
    Location = "塔贝萨 (尘泥沼泽 " .. yellow .. "46,57" .. white .. ")",
    Note = red .. "法师专用" .. white .. "：黑曜石能量源 掉落自 黑曜石哨兵，位于 " .. yellow .. "[5]" .. white .. "。",
    Prequest = "驱除魔鬼",
    Folgequest = "法力怒灵",
}
kQuestInstanceData.Uldaman.Alliance[17] = { --1.18
    Title = "偷一个核心",
    Level = 45,
    Attain = 45,
    Aim = "从奥达曼的古代宝藏中获得完好的动力核心。",
    Location = "托宝·光链 (贫瘠之地 " .. yellow .. "48.6,83" .. white .. " 戴着紫色护目镜的侏儒，在帐篷下，矮人旁边)",
    Note = "完好的动力核心 " .. yellow .. "[11]" .. white .. "，位于最后一个Boss身后的白金圆盘房间内，右侧柱子后面的箱子里。\n任务线开始于 南贫瘠之地 -> 巴尔莫丹 -> 通往巴尔丹城堡的道路北侧一点的帐篷下。第一个任务可在18级接取，最后一个在53级。",
    Prequest = "古老的收获",
    Folgequest = "激活",
    Rewards = {
        Text = "奖励：",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}
kQuestInstanceData.Uldaman.Horde[1] = kQuestInstanceData.Uldaman.Alliance[4]
kQuestInstanceData.Uldaman.Horde[2] = kQuestInstanceData.Uldaman.Alliance[6]
kQuestInstanceData.Uldaman.Horde[3] = {
    Title = "搜寻项链",
    Level = 41,
    Attain = 37,
    Aim = "在奥达曼挖掘场中寻找一条珍贵的项链，然后将其交给奥格瑞玛的德兰·杜佛斯。项链有可能已经损坏。",
    Location = "德兰·杜佛斯 (奥格瑞玛 - 拖拽 "..yellow.."59,36"..white..")",
    Note = "这条项链是副本内的随机掉落物品。",
    Folgequest = "搜寻项链，再来一次",
}
kQuestInstanceData.Uldaman.Horde[4] = kQuestInstanceData.Uldaman.Alliance[10]
kQuestInstanceData.Uldaman.Horde[5] = {
    Title = "翻译日记",
    Level = 42,
    Attain = 37,
    Aim = "在荒芜之地的卡加斯哨所里寻找一个可以帮你翻译圣骑士日记的人。",
    Location = "圣骑士的遗体 (奥达曼 "..yellow.."[2]"..white..")",
    Note = "翻译者 加卡尔·融苔 在 卡加斯 (荒芜之地 "..yellow.."2,46"..white..")。",
    Prequest = "搜寻项链，再来一次",
    Folgequest = "寻找宝贝",
}
kQuestInstanceData.Uldaman.Horde[6] = kQuestInstanceData.Uldaman.Alliance[11]
kQuestInstanceData.Uldaman.Horde[7] = {
    Title = "奥达曼的蘑菇",
    Level = 42,
    Attain = 36,
    Aim = "收集12颗紫色蘑菇，把它们交给塞尔萨玛的加克。",
    Location = "加卡尔·融苔 (荒芜之地 - 卡加斯 "..yellow.."2,69"..white..")",
    Note = "你也可以从 加卡尔·融苔 那里接取前置任务。\n这些蘑菇散落在副本各处。如果开启了寻找草药并且接取了任务，草药学玩家可以在小地图上看到它们。",
    Prequest = "荒芜之地的试剂",
    Folgequest = "荒芜之地的材料II",
    Rewards = {
        Text = "奖励：",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Horde[8] = {
    Title = "失而复得",
    Level = 43,
    Attain = 33,
    Aim = "到奥达曼的北部大厅去找到克罗姆·粗臂的箱子，从里面拿出他的宝贵财产，然后回到铁炉堡把东西交给他。",
    Location = "派翠克·加瑞特 (幽暗城 "..yellow.."72,48"..white..")",
    Note = "你可以在进入副本前找到宝藏。它位于南隧道的尽头。在入口地图上，它位于 "..       yellow.."[5]"..white.."。",
}
kQuestInstanceData.Uldaman.Horde[9] = {
    Title = "白金圆盘",
    Level = 47,
    Attain = 40,
    Aim = "和石头守护者交谈，从他那里了解更多古代的知识。一旦你了解到了所有的内容之后就激活诺甘农圆盘。",
    Location = "诺甘农圆盘 (奥达曼 "..yellow.."[11]"..white..")",
    Note = "接取任务后，与圆盘左侧的岩石看守者交谈。然后再次使用白金圆盘以获取微型圆盘，你需要将其带给 圣者图希克 (雷霆崖 ".. yellow.."34,46"..white..")。后续任务由附近的另一个NPC开始。",
    Folgequest = "奥丹姆的线索",
    Rewards = {
        Text = "奖励：1 或 2 或 3",
        { id = 9587 },               --Thawpelt Sack Bag
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
    }
}
kQuestInstanceData.Uldaman.Horde[10] = kQuestInstanceData.Uldaman.Alliance[16]
kQuestInstanceData.Uldaman.Horde[11] = {
    Title = "征用一个核心",
    Level = 45,
    Attain = 45,
    Aim = "从奥达曼的古代宝藏中获得完好的动力核心。",
    Location = "凯科斯·击王 (贫瘠之地 "..yellow.."45.7,83.6"..white.." 帐篷下的地精。",
    Note = "完好的动力核心 "..yellow.."[11]"..white.."，位于最后一个Boss身后的白金圆盘房间内，右侧柱子后面的箱子里。\n任务线开始于 南贫瘠之地 -> 巴尔莫丹 -> 通往千针石林的道路西侧，巴尔莫丹挖掘场对面。第一个任务可在18级接取，最后一个在53级。",
    Prequest = "有利可图的收获",
    Folgequest = "有利可图的激活",
    Rewards = {
        Text = "奖励：",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}

--------------- Blackrock Depths ---------------
kQuestInstanceData.BlackrockDepths = {
    Story = "这座火山迷宫曾是黑铁矮人的首都，现在成为了炎魔之王拉格纳罗斯的权力中心。拉格纳罗斯发现了用石头创造生命的秘密，并计划建造一支无法阻挡的魔像军队，帮助他征服整座黑石山。痴迷于击败奈法利安和他的龙类仆从，拉格纳罗斯将不择手段以取得最终胜利。",
    Caption = "黑石深渊",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockDepths.Alliance[1] = {
    Title = "黑铁的遗产",
    Level = 52,
    Attain = 48,
    Aim = "如果你想要得到进入这座城市主城区的钥匙，就去和弗兰克罗恩·铸铁谈一谈。",
    Location = "弗兰克罗恩·铸铁 (黑石山 "..yellow.."[3] 在 入口 地图"..white..")",
    Note = "弗兰克罗恩位于黑石山中部，在他的坟墓上方。你必须处于灵魂状态才能看到他！与他交谈两次以开始任务。\n弗诺斯·达克维尔位于 "..       yellow.."[9]"..white..". 神龛位于竞技场旁边 "..yellow.."[7]"..white..".",
    Prequest = "黑铁的遗产",
    Rewards = {
        Text = "奖励：",
        { id = 11000 }, --Shadowforge Key Key
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[2] = {
    Title = "雷布里·斯库比格特",
    Level = 53,
    Attain = 48,
    Aim = "把雷布里的头颅交给燃烧平原的尤卡·斯库比格特。",
    Location = "尤卡·斯库比格特 (燃烧平原 - 烈焰峰 "..yellow.."65,22"..white..")",
    Note = "前置任务来自 尤尔巴·斯库比格特 (塔纳利斯 - 热砂港 "..   yellow.."67,23"..white..").\n雷布里位于 "..yellow.."[15]"..white..".",
    Prequest = "尤卡·斯库比格特",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 11865 }, --Rancor Boots Feet, Cloth
        { id = 11963 }, --Penance Spaulders Shoulder, Leather
        { id = 12049 }, --Splintsteel Armor Chest, Mail
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[3] = {
    Title = "爱情药水",
    Level = 54,
    Attain = 50,
    Aim = "将4份格罗姆之血、10块巨型银矿和装满水的娜玛拉之瓶交给黑石深渊的娜玛拉小姐。",
    Location = "娜玛拉小姐 (黑石深渊 "..yellow.."[15]"..white..")",
    Note = "你可以从艾萨拉的巨人那里获得巨大的银矿脉。格罗姆之血最容易从草药师那里获得，或者在拍卖行购买。最后，小瓶可以在戈拉卡陨石坑（安戈洛环形山 ".. yellow.."31,50"..white.."）装满。完成任务后，你可以使用后门而不是杀死法拉克斯。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 11962 }, --Manacle Cuffs Wrist, Cloth
        { id = 11866 }, --Nagmara's Whipping Belt Waist, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[4] = {
    Title = "霍尔雷·黑须",
    Level = 55,
    Attain = 50,
    Aim = "把遗失的雷酒秘方带给卡拉诺斯的拉格纳·雷酒。",
    Location = "拉格纳·雷酒  (丹莫罗 - 卡拉诺斯 "..yellow.."46,52"..white..")",
    Note = "前置任务来自 恩诺哈尔·雷酒 (诅咒之地 - 守望堡 "..yellow.."61,18"..white..").\n如果你摧毁了麦酒 "..yellow.."[15]"..white..   "，卫兵就会出现，配方就掉落自其中一个卫兵。",
    Prequest = "拉格纳·雷酒",
    Rewards = {
        Text = "奖励：1 和 2 或 3",
        { id = 12003, quantity = 10 }, --Dark Dwarven Lager Potion
        { id = 11964 },                --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 },                --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[5] = {
    Title = "伊森迪奥斯！",
    Level = 56,
    Attain = 48,
    Aim = "在黑石深渊里找到伊森迪奥斯，然后把他干掉！",
    Location = "加琳达 (燃烧平原 - 摩根的岗哨 "..yellow.."85,69"..white..")",
    Note = "前置任务也来自 加琳达。你在 "..yellow.."[10]"..white.." 找到 伊森迪奥斯。",
    Prequest = "征服者派隆",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12113 }, --Sunborne Cape Back
        { id = 12114 }, --Nightfall Gloves Hands, Leather
        { id = 12112 }, --Crypt Demon Bracers Wrist, Mail
        { id = 12115 }, --Stalwart Clutch Waist, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[6] = {
    Title = "山脉之心",
    Level = 55,
    Attain = 50,
    Aim = "把山脉之心交给燃烧平原的麦克斯沃特·尤博格林。",
    Location = "麦克斯沃特·尤博格林 (燃烧平原 - 烈焰峰 "..yellow.."65,23"..white..")",
    Note = "你在 "..yellow.."[8]"..   white.." 的保险箱里找到心脏。你从守卫斯迪尔基斯那里获得保险箱钥匙。他在打开所有小保险箱后出现。",
}
kQuestInstanceData.BlackrockDepths.Alliance[7] = {
    Title = "好东西",
    Level = 56,
    Attain = 50,
    Aim = "到黑石深渊去找到20个黑铁挎包。当你完成任务之后，回到奥拉留斯那里复命。你认为黑石深渊里的黑铁矮人应该会有这些黑铁挎包。",
    Location = "奥拉留斯 (燃烧平原 - 摩根的岗哨 "..yellow.."84,68"..white..")",
    Note = "所有矮人都可能掉落背包。",
    Rewards = {
        Text = "奖励：",
        { id = 11883 }, --A Dingy Fanny Pack Container
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[8] = {
    Title = "温德索尔元帅",
    Level = 54,
    Attain = 48,
    Aim = "到西北部的黑石山脉去，在黑石深渊中找到温德索尔元帅的下落。$B$B狼狈不堪的约翰曾告诉你说温德索尔被关进了一个监狱。",
    Location = "麦克斯韦尔元帅 (燃烧平原 - 摩根的岗哨 "..yellow.."84,68"..white..")",
    Note = "这是奥妮克希亚钥匙任务线的一部分。它开始于 赫林迪斯·河角 (燃烧平原 - 摩根的岗哨 "..yellow.."85,68"..white..").\n温德索尔元帅位于 "..   yellow.."[4]"..white..". 完成此任务后你必须回到麦克斯韦尔那里。",
    Prequest = "黑龙的威胁 -> 真正的主人",
    Folgequest = "被遗弃的希望",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12018 }, --Conservator Helm Head, Mail
        { id = 12021 }, --Shieldplate Sabatons Feet, Plate
        { id = 12041 }, --Windshear Leggings Legs, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[9] = {
    Title = "弄皱的便笺",
    Level = 58,
    Attain = 50,
    Aim = "温德索尔元帅也许会对你手中的东西感兴趣。毕竟，希望还没有被完全扼杀。",
    Location = "弄皱的便笺 (随机 掉落自 黑石深渊)",
    Note = "这是奥妮克希亚钥匙任务线的一部分。温德索尔元帅位于 "..   yellow.."[4]"..white..". 采石场周围的黑铁怪物掉率似乎最高。",
    Prequest = "被遗弃的希望",
    Folgequest = "一丝希望",
}
kQuestInstanceData.BlackrockDepths.Alliance[10] = {
    Title = "一丝希望",
    Level = 58,
    Attain = 50,
    Aim = "找回温德索尔元帅遗失的情报。$B$B温德索尔元帅确信那些情报在安格弗将军和傀儡统帅阿格曼奇的手里。",
    Location = "温德索尔元帅 (黑石深渊 "..yellow.."[4]"..white..")",
    Note = "这是奥妮克希亚钥匙任务线的一部分。温德索尔元帅位于 "..yellow.."[4]"..white..   ".\n你在 "..yellow.."[14]"..white.." 找到 傀儡统帅阿格曼奇，在 "..yellow.."[13]"..white.." 找到 安格弗将军。",
    Prequest = "弄皱的便笺",
    Folgequest = "冲破牢笼！",
}
kQuestInstanceData.BlackrockDepths.Alliance[11] = {
    Title = "冲破牢笼！",
    Level = 58,
    Attain = 50,
    Aim = "帮助温德索尔元帅拿回他的装备并救出他的朋友。当你成功之后就回去向麦克斯韦尔元帅复命。",
    Location = "温德索尔元帅 (黑石深渊 "..yellow.."[4]"..white..")",
    Note = "这是奥妮克希亚钥匙任务线的一部分。温德索尔元帅位于 "..yellow.."[4]"..white..".\n如果你在开始事件之前清理秩序竞技场 ("..yellow.."[6]"..white..") 和通往入口的道路，任务会更容易。你在 燃烧平原 - 摩根的岗哨 ("..   yellow.."84,68"..white..") 找到 麦克斯韦尔元帅",
    Prequest = "一丝希望",
    Folgequest = "集合在暴风城",
    Rewards = {
        Text = "奖励：1 和 2 或 3",
        { id = 12065 }, --Ward of the Elements Trinket
        { id = 12061 }, --Blade of Reckoning One-Hand, Sword
        { id = 12062 }, --Skilled Fighting Blade One-Hand, Dagger
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[12] = {
    Title = "烈焰精华",
    Level = 58,
    Attain = 52,
    Aim = "向塞勒斯·萨雷芬图斯展示你从卡拉然·温布雷那里得到的黑龙皮。",
    Location = "塞勒斯·萨雷芬图斯 (燃烧平原 "..yellow.."94,31"..white..")",
    Note = "任务线开始于 卡拉然·温布雷 (灼热峡谷 "..   yellow.."39,38"..white..").\n贝尔加位于 "..yellow.."[11]"..white..".",
    Prequest = "无瑕之焰 -> 烈焰精华",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[13] = {
    Title = "卡兰·巨锤",
    Level = 59,
    Attain = 50,
    Aim = "去黑石深渊找到卡兰·巨锤。$B$B国王提到卡兰在那里负责看守囚犯——也许你应该在监狱附近寻找他。",
    Location = "国王麦格尼·铜须 (铁炉堡 "..yellow.."39,55"..white..")",
    Note = "前置任务开始于 皇家历史学家阿克瑟努斯 (铁炉堡 "..   yellow.."38,55"..white.."). 卡兰·巨锤位于 "..yellow.."[2]"..white..".",
    Prequest = "索瑞森废墟",
    Folgequest = "卡兰的故事",
}
kQuestInstanceData.BlackrockDepths.Alliance[14] = {
    Title = "王国的命运",
    Level = 59,
    Attain = 50,
    Aim = "回到黑石深渊，从达格兰·索瑞森大帝的魔掌中救出铁炉堡公主茉埃拉·铜须。",
    Location = "国王麦格尼·铜须 (铁炉堡 "..yellow.."39,55"..white..")",
    Note = "铁炉堡公主茉艾拉·铜须位于 "..yellow.."[21]"..white..". 在战斗中她可能会治疗达格兰。尽量打断她，但要快，因为她不能死，否则你无法完成任务！与她交谈后，你必须回到麦格尼·铜须那里。",
    Prequest = "糟糕的消息",
    Folgequest = "语出惊人的公主",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12548 }, --Magni's Will Ring
        { id = 12543 }, --Songstone of Ironforge Ring
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[15] = {
    Title = "熔火之心的传送门",
    Level = 60,
    Attain = 55,
    Aim = "进入黑石深渊，在通往熔火之心的传送门附近找到一块熔火碎片，然后回到黑石山脉的洛索斯·天痕那里",
    Location = "洛索斯·天痕 (黑石山 "..yellow.."[2] 在 入口 地图"..white..")",
    Note = "完成此任务后，你可以使用 洛索斯·天痕 旁边的石头进入 熔火之心。\n你在 "..   yellow.."[23]"..white.." 附近找到 熔火碎片，非常靠近 熔火之心 传送门。",
}
kQuestInstanceData.BlackrockDepths.Alliance[16] = {
    Title = "挑战",
    Level = 60,
    Attain = 58,
    Aim = "到黑石深渊的竞技场去，在你被裁决者格里斯通宣判之后将挑战之旗插在场地中央。杀死瑟尔伦和他的角斗士，然后将瓦塔拉克饰品第一部分交给东瘟疫之地的安泰恩·哈尔蒙。",
    Location = "法琳·树形者 (厄运之槌 西 "..yellow.."[1] 图书馆"..white..")",
    Note = "后续任务因职业而异。整个任务线始于铁炉堡银行后面国王房间里的德莉亚娜的任务“热心的建议。",
    Prequest = "旗帜上的附魔",
    Folgequest = "(职业任务)",
}
kQuestInstanceData.BlackrockDepths.Alliance[17] = {
    Title = "鬼魂之杯",
    Level = 55,
    Attain = 40,
    Aim = "把这些找到的宝石放入鬼魂之杯",
    Location = "格鲁雷尔 (黑石深渊 "..yellow.."[18]"..white..")",
    Note = red..   "只有技能 230 或更高的矿工才能接取此任务以学习熔炼黑铁。"..white.." 杯子的材料: 2 [红宝石], 20 [金锭], 10 [真银锭]. 之后，如果你有 [黑铁矿石]，你可以把它带到 "..   yellow.."[22]"..white.." 的黑铁熔炉进行熔炼。",
}
kQuestInstanceData.BlackrockDepths.Alliance[18] = {
    Title = "行动：帮助杰比",
    Level = 58,
    Attain = 50,
    Aim = "前往黑石深渊，在住处附近找到达内格·暗须，从他那里夺回\"极度猛烈鼻烟\"，然后回到塔纳利斯的热砂港，将物品交给杰比。",
    Location = "加贝 (塔纳利斯, 热砂港 "..yellow.."67,24"..white..")",
    Note = "任务线开始于 比克瑟·螺熔 (泰拉比姆 "..yellow.."52,34"..white.."). 掉落自 达内格·暗须. 奖励来自 行动：最终修复(项链) 任务和最终任务 - 黑铁亵渎者(枪)。",
    Prequest = "行动：螺帽1000型 -> 行动：修复螺帽1000型",
    Folgequest = "行动：帮助杰比2 -> 行动：回到螺熔身边 -> 行动：最终修复 -> 黑铁亵渎者的秘密 -> 黑铁亵渎者",
    Rewards = {
        Text = "奖励：1 或 2 和 3",
        { id = 60996 }, --Bixxle's Necklace of Control Neck
        { id = 60997 }, --Bixxle's Necklace of Mastery Neck
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[19] = {
    Title = "黑铁亵渎者",
    Level = 60,
    Attain = 55,
    Aim = "在泰拉比姆的比克瑟仓库，为比克瑟·螺熔收集一支黑铁步枪、一个熔岩冷凝器、一个复杂的奥金炮管和一个熔岩碎片。",
    Location = "比克瑟·螺熔 (泰拉比姆 岛，塔纳利斯以东)",
    Note = "此任务需要收集4件物品：1) 熔岩冷凝器 (黑石深渊，在熔岩冷凝器箱中)；2) 复杂的奥金炮管 (黑石塔，在复杂的奥金锭桶容器中)；\n3) 熔岩碎片 (熔火之心，来自熔核摧毁者)；4) 黑铁步枪 (由工程师制作)。为了完成建造，我还需要在熔火之心找到炽热之核(x3)，以及附魔瑟银锭(x10)。",
    Prequest = "行动：帮助杰比 -> 黑铁亵渎者的秘密",
    Rewards = {
        Text = "奖励：",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[20] = {
    Title = "参议员复仇",
    Level = 56,
    Attain = 45,
    Aim = "为燃烧平原黑石小径的奥瓦克·严岩杀死黑石深渊深处的25名暗炉议员。",
    Location = "奥瓦克·严岩 (赤脊山 - 燃烧平原 通道后 "..yellow.."76,68"..white..", 联盟营地以西)",
    Note = "此任务线开始于 奥瓦克·严岩 旁边的 拉德根·深焰，任务是 '获得奥瓦克的信任'",
    Prequest = "获得奥瓦克的信任 -> 聆听奥瓦克的故事 -> 斯特恩洛克藏品",
    Rewards = {
        Text = "奖励：",
        { id = 60668 }, --Badge of Shadowforge Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[21] = {
    Title = "奥术傀儡核心",
    Level = 55,
    Attain = 45,
    Aim = "从黑石深渊的傀儡统帅阿格曼奇处找到并收集奥术魔像核心，然后返回燃烧平原黑石小径的拉德根·深焰身边。",
    Location = " 拉德根·深焰 (赤脊山 - 燃烧平原 通道后 "..yellow.."76,68"..white..", 联盟营地以西)",
    Note = "此任务线开始于 奥瓦克·严岩 旁边的 拉德根·深焰，任务是 '获得奥瓦克的信任'",
    Prequest = "获得奥瓦克的信任 -> 聆听奥瓦克的故事 -> 斯特恩洛克藏品 -> 发现傀儡的秘密 -> 购买秘密信息",
    Rewards = {
        Text = "奖励：",
        { id = 60672 }, --Energized Golem Core Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[22] = {
    Title = "建造一个重击者",
    Level = 60,
    Attain = 30,
    Aim = "从血色修道院的军械库中获取瑟银微调舵机，从傀儡统帅阿格曼奇处获得黑石深渊的完美魔像核心，在斯坦索姆找到精金棒，然后回到奥格索普·奥布诺提斯身边。",
    Location = "奥格索普·奥布诺提斯 <侏儒技师大师> (荆棘谷; 藏宝海湾 "..yellow.."28.4,76.3"..white..").",
    Note = red..   "(仅限工程师)"..white.."此任务需要收集 3 件物品。\n1) 瑟银微调舵机 (血色修道院 掉落自 血色仆从)\n2) 完整的魔像核心 (黑石深渊 掉落自 傀儡统帅阿格曼奇)\n3) 精金棒 (斯坦索姆 掉落自 红衣铸锤师)\n诺莫瑞根 的 '群体打击者9-60' 掉落 '完整的重击者主机'，开始前置任务 '一个沉重的大脑'。",
    Prequest = "一个沉重的大脑"..red.."(仅限工程师)", --80398
    Rewards = {
        Text = "奖励：任选其一",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[23] = {
    Title = "冬幕节酒。",
    Level = 55,
    Attain = 45,
    Aim = "在黑石深渊的洞穴中找回冬幕节酒桶，交给冬幕节谷的波马恩·烈斧。",
    Location = "波马恩·烈斧 (冬幕谷)",
    Note = red..   "仅在冬幕节活动期间可用！"..white.."那些卑鄙的黑铁矮人偷了它，毫无疑问藏在 黑石深渊 深处 "..   yellow.."[15]"..white.." 的酒馆里。",
}
for i = 1, 3 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end
kQuestInstanceData.BlackrockDepths.Horde[4] = {
    Title = "遗失的雷酒秘方",
    Level = 55,
    Attain = 50,
    Aim = "把遗失的雷酒秘方交给卡加斯的薇薇安·拉格雷。",
    Location = "暗法师薇薇安·拉格雷 (荒芜之地 - 卡加斯 "..yellow.."2,47"..white..")",
    Note = "前置任务来自 幽暗城 - 炼金房 ("..yellow.."50,68"..white..") 的 药剂师金格。\n如果你摧毁了麦酒 "..yellow.."[15]"..white..   "，卫兵就会出现，配方就掉落自其中一个卫兵。",
    Prequest = "薇薇安·拉格雷",
    Rewards = {
        Text = "奖励：1 和 2 和 3 或 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 11964 },              --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 },              --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Horde[5] = {
    Title = "山脉之心",
    Level = 55,
    Attain = 50,
    Aim = "把山脉之心交给燃烧平原的麦克斯沃特·尤博格林。",
    Location = "麦克斯沃特·尤博格林 (燃烧平原 - 烈焰峰 "..yellow.."65,23"..white..")",
    Note = "你在 "..yellow.."[8]"..   white.." 的保险箱里找到心脏。你从守卫斯迪尔基斯那里获得保险箱钥匙。他在打开所有小保险箱后出现。",
}
kQuestInstanceData.BlackrockDepths.Horde[6] = {
    Title = "格杀勿论：黑铁矮人",
    Level = 52,
    Attain = 48,
    Aim = "到黑石深渊去消灭那些邪恶的侵略者！$B$B军官高图斯要你去杀死15个铁怒卫士、10个铁怒狱卒和5个铁怒步兵。完成任务之后回去向他复命。",
    Location = "告示牌 (荒芜之地 - 卡加斯 "..yellow.."3,47"..white..")",
    Note = "你在 黑石深渊 的第一部分找到矮人。\n你在 卡加斯 的塔顶 (荒芜之地, "..   yellow.."5,47"..white..") 找到 军官高图斯。",
    Folgequest = "格杀勿论：高阶黑铁军官",
}
kQuestInstanceData.BlackrockDepths.Horde[7] = {
    Title = "格杀勿论：高阶黑铁军官",
    Level = 54,
    Attain = 50,
    Aim = "到黑石深渊去消灭那些邪恶的侵略者！$B$B高图斯军阀要你杀死10个铁怒医师，、10个铁怒士兵和10个铁怒军官。完成任务之后回去向他复命。",
    Location = "告示牌 (荒芜之地 - 卡加斯 "..yellow.."3,47"..white..")",
    Note = "你在 贝尔加 "..yellow.."[11]"..white.." 附近找到矮人。你在 卡加斯 的塔顶 (荒芜之地, "..yellow.."5,47"..white..") 找到 军官高图斯。\n后续任务开始于 雷克斯洛特 (荒芜之地 - 卡加斯 "..yellow.."5,47"..white..")。你在 燃烧平原 ("..   yellow.."38,35"..white..") 找到 格拉克·洛克鲁布。你必须将他的生命值降至 50% 以下才能束缚他并开始护送任务。",
    Prequest = "格杀勿论：黑铁矮人",
    Folgequest = "格拉克·洛克鲁布 -> 押送囚徒 (Escort quest)",
}
kQuestInstanceData.BlackrockDepths.Horde[8] = {
    Title = "行动：杀死安格弗将军",
    Level = 58,
    Attain = 52,
    Aim = "到黑石深渊去杀掉安格弗将军！当任务完成之后向军官高图斯复命。",
    Location = "军官高图斯 (荒芜之地 - 卡加斯 "..yellow.."5,47"..white..")",
    Note = "你在 "..yellow.."[13]"..   white.." 找到 安格弗将军。他在 30% 以下会呼叫帮助！\n任务线开始于 雷克斯洛特 (荒芜之地 - 卡加斯, 塔上)，任务是 '格拉克·洛克鲁布'。",
    Prequest = "格拉克·洛克鲁布 -> 押送囚徒",
    Rewards = {
        Text = "奖励：",
        { id = 12059 }, --Conqueror's Medallion Neck
    }
}
kQuestInstanceData.BlackrockDepths.Horde[9] = {
    Title = "机器的崛起",
    Level = 58,
    Attain = 52,
    Aim = "到燃烧平原去为圣职者塞朵拉·穆瓦丹尼收集10块断裂的元素碎片。$b$b塞多拉曾经说过，那里的机械傀儡和元素生物是这种碎片的主要来源。",
    Location = "鲁特维尔·沃拉图斯 (荒芜之地 "..yellow.."25,44"..white..")",
    Note = "前置任务来自 圣职者塞朵拉·穆瓦丹尼 (荒芜之地 - 卡加斯 "..   yellow.."3,47"..white..").\n你在 "..yellow.."[14]"..white.." 找到 阿格曼奇。",
    Prequest = "机器的崛起",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12109 }, --Azure Moon Amice Back
        { id = 12110 }, --Raincaster Drape Back
        { id = 12108 }, --Basaltscale Armor Chest, Mail
        { id = 12111 }, --Lavaplate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Horde[10] = {
    Title = "烈焰精华",
    Level = 58,
    Attain = 52,
    Aim = "向塞勒斯·萨雷芬图斯展示你从卡拉然·温布雷那里得到的黑龙皮。",
    Location = "塞勒斯·萨雷芬图斯 (燃烧平原 "..yellow.."94,31"..white..")",
    Note = "任务线开始于 卡拉然·温布雷 (灼热峡谷 "..   yellow.."39,38"..white..").\n贝尔加位于 "..yellow.."[11]"..white..".",
    Prequest = "无瑕之焰 -> 烈焰精华",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Horde[11] = {
    Title = "不和谐的火焰",
    Level = 56,
    Attain = 48,
    Aim = "进入黑石深渊并找到伊森迪奥斯。杀掉它，然后把你找到的信息汇报给桑德哈特。",
    Location = "桑德哈特 (荒芜之地 - 卡加斯 "..yellow.."3,48"..white..")",
    Note = "前置任务也来自 桑德哈特。\n你在 "..yellow.."[10]"..white.." 找到 伊森迪奥斯。",
    Prequest = "不和谐的烈焰",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12113 }, --Sunborne Cape Back
        { id = 12114 }, --Nightfall Gloves Hands, Leather
        { id = 12112 }, --Crypt Demon Bracers Wrist, Mail
        { id = 12115 }, --Stalwart Clutch Waist, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Horde[12] = {
    Title = "最后的元素",
    Level = 54,
    Attain = 48,
    Aim = "前往黑石深渊，找回10份元素精华。你首先会想到搜寻傀儡和傀儡制造者。你还记得薇薇安·拉格雷夫也曾嘟囔过一些关于元素生物的事情。",
    Location = "暗法师薇薇安·拉格雷 (荒芜之地 - 卡加斯 "..yellow.."2,47"..white..")",
    Note = "前置任务来自 桑德哈特 (荒芜之地 - 卡加斯 "..   yellow.."3,48"..white..").\n每个元素生物都可能掉落精华",
    Prequest = "不和谐的烈焰",
    Rewards = {
        Text = "奖励：",
        { id = 12038 }, --Lagrave's Seal Ring
    }
}
kQuestInstanceData.BlackrockDepths.Horde[13] = {
    Title = "指挥官哥沙克",
    Level = 52,
    Attain = 48,
    Aim = "在黑石深渊里找到指挥官哥沙克。$B$B在那幅草图上画着的是一个铁栏后面的兽人，也许你应该到某个类似监狱的地方去找找看。",
    Location = "神射手贾拉玛弗 (荒芜之地 - 卡加斯 "..yellow.."5,47"..white..")",
    Note = "前置任务来自 桑德哈特 (荒芜之地 - 卡加斯 "..yellow.."3,48"..white..").\n你在 "..yellow.."[3]"..white.." 找到 指挥官哥沙克。打开监狱的钥匙 掉落自 审讯官格斯塔恩 "..   yellow.."[5]"..white..". 如果你与他交谈并开始下一个任务，敌人会出现。",
    Prequest = "不和谐的烈焰",
    Folgequest = "出了什么事？",
}
kQuestInstanceData.BlackrockDepths.Horde[14] = {
    Title = "拯救公主",
    Level = 59,
    Attain = 48,
    Aim = "杀掉达格兰·索瑞森大帝，然后将铁炉堡公主茉埃拉·铜须从他的邪恶诅咒中拯救出来。",
    Location = "萨尔 (奥格瑞玛 "..yellow.."31,37"..white..")",
    Note = "在与 卡兰·巨锤 和 萨尔 交谈后，你获得此任务。\n你在 "..yellow.."[21]"..white.." 找到 达格兰·索瑞森大帝。公主会治疗达格兰，但你不能杀死她以完成任务！尽量打断她的治疗法术。",
    Prequest = "指挥官哥沙克 -> 出了什么事？ (x2) -> The Eastern Kingdom",
    Folgequest = "拯救公主？",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12544 }, --Thrall's Resolve Ring
        { id = 12545 }, --Eye of Orgrimmar Ring
    }
}
for i = 15, 23 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end

--------------- Blackwing Lair ---------------
kQuestInstanceData.BlackwingLair = {
    Story = {
        ["Page1"] = "黑翼之巢位于黑石尖塔的最高处。它坐落在山峰的暗黑裂缝中，奈法利安正于此展开计划的最后阶段，意图彻底摧毁拉格纳罗斯，并率领他的军团在整个艾泽拉斯取得无可争议的统治。",
        ["Page2"] = "这座雄伟的堡垒雕刻于黑石山炽热的岩浆深处，由大师矮人建筑师弗兰克隆·弗格赖特设计。它原本是暗铁力量的象征，数个世纪以来被邪恶矮人所掌控。然而，奈法利安——这条龙之子、死亡之翼——另有图谋。他与他的龙裔爪牙夺取了上层尖塔，并在山体的火山深处向矮人的领地发动战争，这里正是火焰领主拉格纳罗斯的权力中心。拉格纳罗斯已发现利用石头制造生命的秘密，并计划召集一支不可阻挡的傀儡军团，以征服整座黑石山。",
        ["Page3"] = "奈法利安誓言要粉碎拉格纳罗斯。为此，他最近开始加强自己的军队，正如其父亲死亡之翼在数千年前的尝试。虽然死亡之翼失败了，但狡诈的奈法利安似乎正在取得成功。奈法利安的疯狂野心已激怒红龙飞行，它一直是黑翼飞行最强大的对手。尽管奈法利安的意图已为人所知，他实现目标的手段仍是谜团。据信，奈法利安正在利用各种龙族的血液进行实验，以孕育出不可阻挡的战士。\n\n奈法利安的圣殿——黑翼之巢——同样位于黑石尖塔的最高处。它坐落在山峰的暗黑裂缝中，奈法利安正于此展开计划的最后阶段，意图彻底摧毁拉格纳罗斯，并率领他的军团在整个艾泽拉斯取得无可争议的统治。",
        ["MaxPages"] = "3",
    },
    Caption = {
        "黑翼之巢",
        "黑翼之巢 (故事部分 1)",
        "黑翼之巢 (故事部分 2)",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackwingLair.Alliance[1] = {
    Title = "奈法里奥斯的腐蚀",
    Level = 60,
    Attain = 60,
    Aim = "干掉奈法利安并拿到红色节杖碎片。把红色节杖碎片带给塔纳利斯时光之穴门口的安纳克罗斯。你必须在一个半小时之内完成这个任务。",
    Location = "堕落的瓦拉斯塔兹 (黑翼之巢 "..yellow.."[2]"..white..")",
    Note = "只有一个人可以拾取碎片。安纳克罗斯 (塔纳利斯 - 时光之穴 "..yellow.."65,49"..white..")",
    Prequest = "巨龙军团的指控",
    Folgequest = "卡利姆多的威力 (必须完成绿色和蓝色任务链)",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 21530 }, --Onyx Embedded Leggings Legs, Mail
        { id = 21529 }, --Amulet of Shadow Shielding Neck
    }
}
kQuestInstanceData.BlackwingLair.Alliance[2] = {
    Title = "黑石之王",
    Level = 60,
    Attain = 60,
    Aim = "将奈法利安的头颅交给暴风城的伯瓦尔·弗塔根公爵。",
    Location = "奈法利安的头颅 (掉落自 奈法利安 "..yellow.."[9]"..white..")",
    Note = "伯瓦尔·弗塔根公爵位于 (暴风城 - 暴风城要塞 "..yellow.."78,20"..   white..")。后续任务将你派往 艾法希比元帅 (暴风城 - 英雄谷 "..yellow.."67,72"..white..") 领取奖励。",
    Folgequest = "黑石之王",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 19383 }, --Master Dragonslayer's Medallion Neck
        { id = 19366 }, --Master Dragonslayer's Orb Held In Off-hand
        { id = 19384 }, --Master Dragonslayer's Ring Ring
    }
}
kQuestInstanceData.BlackwingLair.Alliance[3] = {
    Title = "唯一的领袖",
    Level = 60,
    Attain = 60,
    Aim = "带着勒西雷尔的头颅回到希利苏斯，到塞纳里奥城堡的流沙之地找巴里斯托尔斯。",
    Location = "勒什雷尔的头颅 (掉落自 勒什雷尔 "..yellow.."[3]"..white..")",
    Note = "只有一个人可以拾取头颅。",
    Prequest = "明天的希望",
    Folgequest = "正义之路",
}
kQuestInstanceData.BlackwingLair.Alliance[4] = {
    Title = "唯一的方案",
    Level = 60,
    Attain = 60,
    Aim = "把8章《龙语傻瓜教程》的章节用魔法书封面合起来，然后把完整的《龙语傻瓜教程：第二卷》交给塔纳利斯的纳瑞安。",
    Location = "纳瑞安 (塔纳利斯 "..yellow.."65,18"..white..")",
    Note = "多人可以拾取该章节。龙语傻瓜教程 (拾取自桌子 "..green.."[2']"..white..")",
    Prequest = "螳螂捕蝉！",
    Folgequest = "好消息和坏消息 (必须完成“斯图沃尔，前好友”和“别问我的生意”任务 任务链)",
    Rewards = {
        Text = "奖励：",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.BlackwingLair.Alliance[5] = {
    Title = "卡拉赞的钥匙之九",
    Level = 60,
    Attain = 58,
    Aim = "找到“魔法锁和钥匙的论文”并将其带回给多万·布雷斯温德。据传它被保存在黑翼之巢中。",
    Location = "多万·布雷斯温德 (尘泥沼泽 - 西部避难所  "..yellow.."71,73"..white..")",
    Note = "前置任务 - 埃伯洛克领主 (黑石塔下层)。书籍 '魔法锁和钥匙的论文' 在最后一个首领房间 "..   yellow.."[卡拉赞]"..white.."，王座旁边。奖励来自下一个任务。",
    Prequest = "卡拉赞的钥匙之八 (卡拉赞)",
    Folgequest = "卡拉赞的钥匙之十",
    Rewards = {
        Text = "奖励：",
        { id = 61234 }, --Upper Karazhan Tower Key Key
    }
}
kQuestInstanceData.BlackwingLair.Alliance[6] = {
    Title = "女神的镰刀",
    Level = 60,
    Attain = 58,
    Aim = "杀死爪王嚎牙并向埃伯洛克领主报告。",
    Location = "大德鲁伊梦风 (海加尔山 - 诺达纳尔 "..yellow.."84.8,29.3"..white.." 大树顶层)",
    Note = "奈法利安 "..yellow.."[9]"..white.." 掉落 '沃根多尔的烧毁副本'。\n任务线开始于稀有掉落的传说物品 '艾露恩的镰刀'，掉落自首领 布莱克沃尔德勋爵二世，位于 "..   yellow.."[卡拉赞]"..white..".",
    Prequest = "女神的镰刀",
    Folgequest = "女神的镰刀"..yellow.."[卡拉赞]"..white.." ", -- 41087
}
kQuestInstanceData.BlackwingLair.Horde[1] = kQuestInstanceData.BlackwingLair.Alliance[1]
kQuestInstanceData.BlackwingLair.Horde[2] = {
    Title = "黑石之王",
    Level = 60,
    Attain = 60,
    Aim = "将奈法利安的头颅交给暴风城的伯瓦尔·弗塔根公爵。",
    Location = "奈法利安的头颅 (掉落自 奈法利安 "..yellow.."[9]"..white..")",
    Note = "后续任务将你派往 萨鲁法尔大王 (奥格瑞玛 - 力量谷 "..yellow..   "51,76"..white..") 领取奖励。",
    Folgequest = "黑石之王",
    Rewards = kQuestInstanceData.BlackwingLair.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.BlackwingLair.Horde[i] = kQuestInstanceData.BlackwingLair.Alliance[i]
end

--------------- Blackfathom Deeps ---------------
kQuestInstanceData.BlackfathomDeeps = {
    Story =
    "黑暗深渊位于灰谷的佐拉姆海岸，曾是一座献给暗夜精灵月神艾露恩的辉煌神庙。然而，大灾变摧毁了神庙，将其沉入迷雾之海的波涛之下。它一直静静沉睡——直到被古老的力量吸引，娜迦和萨特出现来探索其秘密。传说古老的野兽阿库麦尔已在神庙废墟中安家。阿库麦尔是上古之神最宠爱的宠物，自那以后一直在该地区捕食。被阿库麦���的存在所吸引，暮光之锤教派也前来沐浴在上古之神的邪恶之中。",
    Caption = "黑暗深渊",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackfathomDeeps.Alliance[1] = {
    Title = "深渊中的知识",
    Level = 23,
    Attain = 10,
    Aim = "把洛迦里斯手稿带给铁炉堡的葛利·硬骨。",
    Location = "葛利·硬骨 (铁炉堡 - 废弃的洞穴 "..yellow.."50,5"..white..")",
    Note = "你在水下的 "..yellow.."[2]"..white.." 处找到手稿。",
    Rewards = {
        Text = "奖励：",
        { id = 6743 }, --Sustaining Ring Ring
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[2] = {
    Title = "研究堕落",
    Level = 24,
    Attain = 18,
    Aim = "奥伯丁的戈色拉·夜语需要8块堕落者的脑干。",
    Location = "戈沙拉·夜语 (黑海岸 - 奥伯丁 "..yellow.."38,43"..white..")",
    Note = "你从 (暴风城 - 花园 "..   yellow.."21,55"..white..") 的 阿古斯·夜语 那里获得它。\n\n黑暗深渊 之前和里面的所有娜迦都会掉落脑干。",
    Prequest = "遥远的旅途",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 7003 }, --Beetle Clasps Wrist, Mail
        { id = 7004 }, --Prelacy Cape Back
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[3] = {
    Title = "寻找塞尔瑞德",
    Level = 24,
    Attain = 18,
    Aim = "到黑暗深渊去找到银月守卫塞尔瑞德。",
    Location = "哨兵山德拉斯 (达纳苏斯 - 工匠区 "..yellow.."55,24"..white..")",
    Note = "你在 "..yellow.."[4]"..white.." 找到 银月守卫塞尔瑞德。",
    Folgequest = "黑暗深渊中的恶魔",
}
kQuestInstanceData.BlackfathomDeeps.Alliance[4] = {
    Title = "黑暗深渊中的恶魔",
    Level = 27,
    Attain = 18,
    Aim = "把梦游者克尔里斯的头颅交给达纳苏斯的哨兵塞尔高姆。",
    Location = "银月守卫塞尔瑞德 (黑暗深渊 "..yellow.."[4]"..white..")",
    Note = "梦游者克尔里斯位于 "..yellow.."[8]"..white.."。你在 达纳苏斯 - 工匠区 ("..yellow.."55,24"..   white..") 找到 哨兵塞尔高姆。\n\n注意！如果你点燃克尔里斯领主旁边的火焰，敌人会出现并攻击你。",
    Prequest = "寻找塞尔瑞德",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 7001 }, --Gravestone Scepter Wand
        { id = 7002 }, --Arctic Buckler Shield
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[5] = {
    Title = "暮光之锤的末日",
    Level = 25,
    Attain = 20,
    Aim = "收集10个暮光坠饰，把它们交给达纳苏斯的银月守卫玛纳杜斯。",
    Location = "银月守卫玛纳杜斯 (达纳苏斯 - 工匠区 "..yellow.."55,23"..white..")",
    Note = "每个 暮光之锤 怪物都可能掉落坠饰。",
    Rewards = {
        Text = "奖励：",
        { id = 6998 }, --Nimbus Boots Feet, Cloth
        { id = 7000 }, --Heartwood Girdle Waist, Leather
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[6] = {
    Title = "索兰鲁克宝珠",
    Level = 25,
    Attain = 20,
    Aim = "找到3块索兰鲁克宝珠的碎片和1块索兰鲁克宝珠的大碎片，把它们交给贫瘠之地的杜安·卡汉。",
    Location = "杜安·卡汉 (贫瘠之地 "..yellow.."49,57"..white..")",
    Note = red..   "此任务仅限术士完成。"..white..": 你从 "..   yellow.."[黑暗深渊]"..   white.." 的 暮光之锤 侍僧那里获得 3 个 索兰鲁克碎片。你从 "..yellow.."[影牙城堡]"..white.." 的 影牙 黑暗灵魂那里获得 索兰鲁克宝珠的大碎片。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6898 },  --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[1] = {
    Title = "阿库麦尔水晶",
    Level = 22,
    Attain = 17,
    Aim = "收集20颗阿库麦尔蓝宝石，把它们交给灰谷的耶努·萨克雷。",
    Location = "耶努·萨克雷 (灰谷 - 佐拉姆加前哨站 "..yellow.."11,33"..white..")",
    Note = "前置任务 深渊中的麻烦 来自 苏纳曼 (石爪山脉 - 烈日石居 "..   yellow.."47,64"..white..")。水晶可以在副本前的隧道中找到。",
    Prequest = "深渊中的麻烦",
    Folgequest = "废墟之间",
}
kQuestInstanceData.BlackfathomDeeps.Horde[2] = {
    Title = "上古之神的仆从",
    Level = 26,
    Attain = 17,
    Aim = "把潮湿的便笺交给灰谷的耶努·萨克雷。",
    Location = "潮湿的便笺 (掉落 - 见备注)",
    Note = "你从 黑暗深渊海潮女祭司 那里获得 潮湿的便笺 (5% 掉率)。然后把它带给 耶努·萨克雷 (灰谷 - 佐拉姆加前哨站 "..   yellow.."11,33"..white..")。洛古斯·杰特位于 "..yellow.."[6]"..white.."。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 17694 }, --Band of the Fist Ring
        { id = 17695 }, --Chestnut Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[3] = {
    Title = "废墟之间",
    Level = 27,
    Attain = 21,
    Aim = "把深渊之核交给灰谷佐拉姆加前哨站里的耶努·萨克雷。",
    Location = "耶努·萨克雷 (灰谷 - 佐拉姆加前哨站 "..yellow.."11,33"..white..")",
    Note = "你在水下的 "..yellow.."[7]"..white.." 处找到 深渊之核。当你拿到核心时，阿奎尼斯男爵 会出现并攻击你。他掉落一个 任务物品，你必须把它带回给 耶努·萨克雷。",
}
kQuestInstanceData.BlackfathomDeeps.Horde[4] = {
    Title = "黑暗深渊中的恶魔",
    Level = 27,
    Attain = 18,
    Aim = "把梦游者克尔里斯的头颅交给达纳苏斯的哨兵塞尔高姆。",
    Location = "银月守卫塞尔瑞德 (黑暗深渊 "..yellow.."[4]"..white..")",
    Note = "梦游者克尔里斯位于 "..yellow.."[8]"..white.."。你在 雷霆崖 - 长者高地 ("..yellow.."70,33"..   white..") 找到 巴珊娜·符文图腾。\n\n注意！如果你点燃克尔里斯领主旁边的火焰，敌人会出现并攻击你。",
    Rewards = kQuestInstanceData.BlackfathomDeeps.Alliance[4].Rewards
}
kQuestInstanceData.BlackfathomDeeps.Horde[5] = {
    Title = "索兰鲁克宝珠",
    Level = 25,
    Attain = 20,
    Aim = "找到3块索兰鲁克宝珠的碎片和1块索兰鲁克宝珠的大碎片，把它们交给贫瘠之地的杜安·卡汉。",
    Location = "杜安·卡汉 (贫瘠之地 "..yellow.."49,57"..white..")",
    Note = red..   "此任务仅限术士完成。"..white..": 你从 "..   yellow.."[黑暗深渊]"..   white.." 的 暮光之锤 侍僧那里获得 3 个 索兰鲁克碎片。你从 "..yellow.."[影牙城堡]"..white.." 的 影牙 黑暗灵魂那里获得 索兰鲁克宝珠的大碎片。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6898 },  --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[6] = {
    Title = "阿奎尼斯男爵",
    Level = 30,
    Attain = 21,
    Aim = "把奇怪的水球交给灰谷佐拉姆加前哨站的耶努·萨克雷。",
    Location = "奇怪的水球 (黑暗深渊 "..yellow.."[7]"..white..")",
    Note = "使用 深渊之石 "..   yellow.."[7]"..white.." 进行任务 #3 会召唤 阿奎尼斯男爵。他掉落 奇怪的水球，开始此任务。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 16886 }, --Outlaw Sabre One-Hand, Sword
        { id = 16887 }, --Witch's Finger Held In Off-hand
    }
}

--------------- Lower Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireLower = {
    Story =
    "这座雕刻在黑石山炽热深处的宏伟堡垒由矮人大师石匠弗兰克罗恩·铸铁设计。作为黑铁矮人力量的象征，这座堡垒被邪恶的矮人占据了数个世纪。然而，奈法利安——巨龙死亡之翼狡猾的儿子——对这座伟大的要塞另有打算。他和他的龙类仆从控制了黑石塔上层，并对矮人在山脉火山深处的领地发动了战争。意识到矮人由强大的火焰元素拉格纳罗斯领导后——奈法利安发誓要粉碎他的敌人，并将整座黑石山据为己有。",
    Caption = "下层 黑石塔",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireLower.Alliance[1] = {
    Title = "最后的石板",
    Level = 58,
    Attain = 40,
    Aim = "将第五块和第六块摩沙鲁石板交给塔纳利斯的勘查员铁靴。",
    Location = "勘查员铁靴 (塔纳利斯 - 热砂港 "..yellow.."66,23"..white..")",
    Note = "你在 "..yellow.."[7]"..   white.." 和 "..yellow.."[9]"..white.." 附近找到石板。\n奖励属于 '面对叶基亚'。你在 勘查员铁靴 附近找到 叶基亚。",
    Prequest = "失落的摩沙鲁石板",
    Folgequest = "面对叶基亚",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 20218 }, --Faded Hakkari Cloak Back
        { id = 20219 }, --Tattered Hakkari Cape Back
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[2] = {
    Title = "基布雷尔的特殊宠物",
    Level = 59,
    Attain = 55,
    Aim = "到黑石塔去找到血斧座狼幼崽。使用笼子来捕捉这些凶猛的小野兽，然后把笼中的座狼幼崽交给基布雷尔。",
    Location = "基布雷尔 (燃烧平原 - 烈焰峰 "..yellow.."65,22"..white..")",
    Note = "你在 "..yellow.."[17]"..white.." 找到 座狼幼崽。",
    Rewards = {
        Text = "奖励：",
        { id = 12264 }, --Worg Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[3] = {
    Title = "蜘蛛卵",
    Level = 59,
    Attain = 55,
    Aim = "到黑石塔去为基布雷尔收集15枚尖塔蜘蛛卵。$B$B听说那些蜘蛛周围有许多这样的卵。",
    Location = "基布雷尔 (燃烧平原 - 烈焰峰 "..yellow.."65,22"..white..")",
    Note = "你在 "..yellow.."[13]"..white.." 附近找到蜘蛛卵。",
    Rewards = {
        Text = "奖励：",
        { id = 12529 }, --Smolderweb Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[4] = {
    Title = "蛛后的乳汁",
    Level = 60,
    Attain = 55,
    Aim = "你可以在黑石塔的中心地带找到烟网蛛后。与她战斗，让她在你体内注入毒汁。如果你有能力的话，就杀死她吧。当你中毒之后，回到狼狈不堪的约翰那儿，他会从你的身体里抽取这些“蛛后的乳汁”。",
    Location = "狼狈不堪的约翰 (燃烧平原 - 烈焰峰 "..yellow.."65,23"..white..")",
    Note = "烟网蛛后位于 "..yellow.."[13]"..white..   "。毒药效果也会诱捕附近的玩家。如果它被移除或驱散，任务失败。",
    Rewards = {
        Text = "奖励：",
        { id = 15873 }, --Ragged John's Neverending Cup Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[5] = {
    Title = "座狼之源",
    Level = 59,
    Attain = 55,
    Aim = "到黑石塔去摧毁那里的座狼源头。当你离开的时候，赫林迪斯喊出了一个名字：哈雷肯。这个词就是兽人语中“座狼”的意思。",
    Location = "赫林迪斯·河角 (燃烧平原 - 摩根的岗哨 "..yellow.."5,47"..white..")",
    Note = "你在 "..yellow.."[17]"..white.." 找到 哈雷肯。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 15824 }, --Astoria Robes Chest, Cloth
        { id = 15825 }, --Traphook Jerkin Chest, Leather
        { id = 15827 }, --Jadescale Breastplate Chest, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[6] = {
    Title = "乌洛克",
    Level = 60,
    Attain = 55,
    Aim = "阅读瓦罗什的卷轴。将瓦罗什的蟑螂交给他。",
    Location = "瓦罗什 (黑石塔 "..yellow.."[2]"..white..")",
    Note = "为了获得 瓦罗什的魔精，你必须召唤并杀死 乌洛克 "..yellow.."[15]"..white.."。为了召唤他，你需要一根长矛和 欧莫克大王 的头颅 "..yellow.."[5]"..white.."。长矛位于 "..yellow.."[3]"..white.."。在召唤期间，几波食人魔会在 乌洛克 攻击你之前出现。你可以在战斗中使用长矛来伤害食人魔。",
    Rewards = {
        Text = "奖励：",
        { id = 15867 }, --Prismcharm Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[7] = {
    Title = "比修的装置",
    Level = 59,
    Attain = 55,
    Aim = "找到比修的装置并把它们还给她。你记得她说过她把装置藏在城市的最底层。",
    Location = "比修 (黑石塔 "..yellow.."[3]"..white..")",
    Note = "你在前往 烟网蛛后 "..   yellow.."[13]"..white.." 的路上找到 比修的装置。\n麦克斯韦尔位于 (燃烧平原 - 摩根的岗哨 "..yellow.."84,58"..white..")。",
    Folgequest = "给麦克斯韦尔的消息",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[8] = {
    Title = "麦克斯韦尔的任务",
    Level = 60,
    Attain = 55,
    Aim = "到黑石塔去消灭指挥官沃恩、欧莫克大王和督军维姆萨拉克。完成任务之后回到麦克斯韦尔元帅处复命。",
    Location = "麦克斯韦尔元帅 (燃烧平原 - 摩根的岗哨 "..yellow.."84,58"..white..")",
    Note = "你在 "..   yellow.."[9]"..white.." 找到 指挥官沃恩，在 "..   yellow.."[5]"..white.." 找到 欧莫克大王，在 "..yellow.."[19]"..white.." 找到 维姆萨拉克。",
    Prequest = "给麦克斯韦尔的消息",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 13958 }, --Wyrmthalak's Shackles Wrist, Cloth
        { id = 13959 }, --Omokk's Girth Restrainer Waist, Plate
        { id = 13961 }, --Halycon's Muzzle Shoulder, Leather
        { id = 13962 }, --Vosh'gajin's Strand Waist, Leather
        { id = 13963 }, --Voone's Vice Grips Hands, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[9] = {
    Title = "晋升印章",
    Level = 60,
    Attain = 57,
    Aim = "找到三块命令宝石：燃棘宝钻、尖石宝钻和血斧宝钻。把它们和原始晋升印章一起交给维埃兰。$B$B可能携带者三块宝石的将军是：燃棘氏族的指挥官沃恩、尖石氏族的欧莫克大王，以及血斧氏族的督军维姆萨拉克。",
    Location = "维埃兰 (黑石塔 "..yellow.."[1]"..white..")",
    Note = "你从 "..yellow.."[5]"..white.." 的 欧莫克大王 那里获得 尖石宝钻，从 "..yellow.."[9]"..white.." 的 指挥官沃恩 那里获得 燃棘宝钻，从 "..yellow.."[19]"..   white.." 的 维姆萨拉克 那里获得 血斧宝钻。原始晋升印章 几乎可以从 黑石塔下层 的所有敌人身上掉落。如果你完成此任务线，你将获得 黑石塔上层 的钥匙。",
    Folgequest = "晋升印章",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[10] = {
    Title = "达基萨斯将军的命令",
    Level = 60,
    Attain = 55,
    Aim = "把达基萨斯将军的命令交给燃烧平原的麦克斯韦尔元帅。",
    Location = "达基萨斯将军的命令 (掉落自 维姆萨拉克 "..yellow.."[19]"..white..")",
    Note = "麦克斯韦尔元帅 位于 燃烧平原 - 摩根的岗哨 ("..yellow.."84,58"..white..")。",
    Folgequest = "达基萨斯将军之死 ("..yellow.."黑石塔上层"..white..")", -- 5102
}
kQuestInstanceData.BlackrockSpireLower.Alliance[11] = {
    Title = "瓦萨拉克护符的左半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆来召唤莫尔·灰蹄的灵魂并杀了他。带着瓦萨拉克护符的左半块和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你从 '寻找安泰恩' 任务中获得它。\n\n莫尔·灰蹄 在 "..   yellow.."[9]"..white.." 被召唤。",
    Prequest = "重要的材料",
    Folgequest = "奥卡兹岛在你前方……",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[12] = {
    Title = "瓦萨拉克护符的右半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆召唤莫尔·灰蹄的灵魂并杀了他。带着重新组合的瓦萨拉克护符和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你从 '寻找安泰恩' 任务中获得它。\n\n莫尔·灰蹄 在 "..   yellow.."[9]"..white.." 被召唤。",
    Prequest = "更多重要的材料",
    Folgequest = "最后的准备 ("..yellow.."黑石塔上层"..white..")", -- 8994
}
kQuestInstanceData.BlackrockSpireLower.Alliance[13] = {
    Title = "沃什加斯的蛇石",
    Level = 60,
    Attain = 50,
    Aim = "到黑石塔去杀死暗影猎手沃什加斯，将沃什加斯的蛇石交给基尔拉姆。",
    Location = "基尔拉姆 (冬泉谷 - 永望镇 "..yellow.."61,37"..white..")",
    Note = "锻造任务。暗影猎手沃许加斯位于 "..yellow.."[7]"..white.."。",
    Rewards = {
        Text = "奖励：",
        { id = 12821 }, --Plans: Dawn's Edge Pattern
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[14] = {
    Title = "火热的死亡",
    Level = 60,
    Attain = 60,
    Aim = "世界上一定有人知道关于这副手套的事情，祝你好运！",
    Location = "人类遗骸 (黑石塔下层 "..yellow.."[9]"..white..")",
    Note = "锻造任务。务必在 "..yellow.."[11]"..white.." 的 人类遗骸 附近拾取 未淬火的板甲护手。交给 玛雷弗斯·暗锤 (冬泉谷 - 永望镇 "..yellow.."61,39"..white..")。列出的奖励是后续任务的。",
    Folgequest = "炽热板甲护手",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 12699 }, --Plans: Fiery Plate Gauntlets Pattern
        { id = 12631 }, --Fiery Plate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[15] = {
    Title = "黑铁亵渎者",
    Level = 60,
    Attain = 55,
    Aim = "在泰拉比姆的比克瑟仓库，为比克瑟·螺熔收集一支黑铁步枪、一个熔岩冷凝器、一个复杂的奥金炮管和一个熔岩碎片。",
    Location = "比克瑟·螺熔 (泰拉比姆 "..yellow.."52,34"..white..")",
    Note = "此任务需要收集 4 件物品。\n1) 熔岩冷凝器 (黑石深渊，在 熔岩冷凝器箱 中) \n2) 复杂的奥金炮管 (黑石塔，在 复杂的奥金锭桶 容器中)\n3) 熔岩碎片 (熔火之心，来自 熔核摧毁者)。\n4) 黑铁步枪 (由工程师制作)。\n炽热之核(x3) 在 熔火之心 中找到，以及 附魔瑟银锭(x10)。",
    Prequest = "黑铁亵渎者的秘密",
    Rewards = {
        Text = "奖励：",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireLower.Horde[i] = kQuestInstanceData.BlackrockSpireLower.Alliance[i]
end
kQuestInstanceData.BlackrockSpireLower.Horde[5] = {
    Title = "座狼的首领",
    Level = 59,
    Attain = 55,
    Aim = "杀死血斧座狼的领袖，哈雷肯。",
    Location = "神射手贾拉玛弗 (荒芜之地 - 卡加斯 "..yellow.."5,47"..white..")",
    Note = "你在 "..yellow.."[17]"..white.." 找到 哈雷肯。",
    Rewards = kQuestInstanceData.BlackrockSpireLower.Alliance[5].Rewards
}
kQuestInstanceData.BlackrockSpireLower.Horde[6] = kQuestInstanceData.BlackrockSpireLower.Alliance[6]
kQuestInstanceData.BlackrockSpireLower.Horde[7] = {
    Title = "特工比修",
    Level = 59,
    Attain = 55,
    Aim = "到黑石塔去查明比修的下落。",
    Location = "雷克斯洛特 (荒芜之地 - 卡加斯 "..yellow.."5,47"..white..")",
    Note = "你在 "..yellow.."[8]"..white.." 找到 比修。",
    Folgequest = "比修的装置",
}
kQuestInstanceData.BlackrockSpireLower.Horde[8] = {
    Title = "比修的装置",
    Level = 59,
    Attain = 55,
    Aim = "找到比修的装置并把它们还给她。你记得她说过她把装置藏在城市的最底层。",
    Location = "比修 (黑石塔 "..yellow.."[3]"..white..")",
    Note = "你在前往 烟网蛛后 "..yellow.."[13]"..white.." 的路上找到 比修的装置。\n奖励属于 '比修的侦察报告'。",
    Prequest = "特工比修",
    Folgequest = "比修的侦察报告",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 15858 }, --Freewind Gloves Hands, Cloth
        { id = 15859 }, --Seapost Girdle Waist, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[9] = kQuestInstanceData.BlackrockSpireLower.Alliance[9]
kQuestInstanceData.BlackrockSpireLower.Horde[10] = {
    Title = "高图斯的命令",
    Level = 60,
    Attain = 55,
    Aim = "杀死欧莫克大王、指挥官沃恩和督军维姆萨拉克。找到重要的黑石文件，然后向卡加斯的军官高图斯汇报。",
    Location = "军官高图斯 (荒芜之地 - 卡加斯 "..yellow.."65,22"..white..")",
    Note = "奥妮克希亚前置任务。\n你在 "..yellow.."[5]"..white.." 找到 欧莫克大王，在 "..yellow.."[9]"..white.." 找到 指挥官沃恩，在 "..   yellow.."[19]"..white.." 找到 维姆萨拉克。黑石文件可能出现在这 3 个首领之一的旁边。",
    Folgequest = "伊崔格的智慧 -> 为了部落！ ("..yellow.."黑石塔上层"..white..")",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 13958 }, --Wyrmthalak's Shackles Wrist, Cloth
        { id = 13959 }, --Omokk's Girth Restrainer Waist, Plate
        { id = 13961 }, --Halycon's Muzzle Shoulder, Leather
        { id = 13962 }, --Vosh'gajin's Strand Waist, Leather
        { id = 13963 }, --Voone's Vice Grips Hands, Mail
    }
}
for i = 11, 15 do
    kQuestInstanceData.BlackrockSpireLower.Horde[i] = kQuestInstanceData.BlackrockSpireLower.Alliance[i]
end
kQuestInstanceData.BlackrockSpireLower.Horde[16] = {
    Title = "森林巨魔的败类",
    Level = 60,
    Attain = 48,
    Location = "监工奥克戈格 (燃烧平原 - 卡方要塞 "..yellow.."95.1,22.8"..white..")",
    Note = "在 黑石塔下层 杀死 指挥官沃恩 "..yellow.."[9]"..white.."，并将他的长牙带回给 燃烧平原 卡加斯 的 监工奥克戈格。",
    Prequest = "火腹任务",
    Rewards = {
        Text = "奖励：",
        { id = 60715 }, --Taskmaster Whip Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[17] = {
    Title = "掠夺者的突袭",
    Level = 58,
    Attain = 50,
    Aim = "杀死黑石塔的奴役者基兹卢尔，然后向卡方要塞的掠夺者法戈什报到。",
    Location = "掠夺者法戈什 (燃烧平原 - 卡方要塞 "..yellow.."93.6,23.2"..white..")",
    Note = "奴役者基兹卢尔 在你杀死 首领 哈雷肯 "..yellow.."[17]"..white.." 后出现。",
    Prequest = "掠夺者的复仇 -> 掠夺者的新坐骑",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60717 }, --Worg Rider Sash Waist, Leather
        { id = 60718 }, --Sootwalker Sandals Feet, Cloth
        { id = 60719 }, --Axe of Fargosh Main Hand, Axe
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[18] = {
    Title = "最后的裂缝",
    Level = 59,
    Attain = 50,
    Location = "卡方 (燃烧平原 - 卡方要塞 "..yellow.."95.1,22.8"..white..")",
    Note = "为 燃烧平原 卡加斯 的 卡方 杀死 黑石塔 深处的 军需官兹格雷斯 "..yellow.."[16]"..white.."。",
    Prequest = "保护新鲜血液 -> 向莫尔克报告 -> 消灭一切痕迹。。。 -> 不要冒险",
    Rewards = {
        Text = "奖励：",
        { id = 60739 }, --Tarnished Lancelot Ring Ring
    }
}

--------------- Upper Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireUpper = {
    Story =
    "这座雕刻在黑石山炽热深处的宏伟堡垒由矮人大师石匠弗兰克罗恩·铸铁设计。作为黑铁矮人力量的象征，这座堡垒被邪恶的矮人占据了数个世纪。然而，奈法利安——巨龙死亡之翼狡猾的儿子——对这座伟大的要塞另有打算。他和他的龙类仆从控制了黑石塔上层，并对矮人在山脉火山深处的领地发动了战争。意识到矮人由强大的火焰元素拉格纳罗斯领导后——奈法利安发誓要粉碎他的敌人，并将整座黑石山据为己有。",
    Caption = "上层 黑石塔",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[1] = {
    Title = "监护者",
    Level = 60,
    Attain = 57,
    Aim = "到冬泉谷去找到哈尔琳，把奥比的鳞片交给她。",
    Location = "奥比 (黑石塔 "..yellow.."[7]"..white..")",
    Note = "你在竞技场后的房间 "..yellow.."[7]"..white.." 找到 奥比。她站在一个突出的岩石上。\n哈尔琳 在 冬泉谷 ("..   yellow.."54,51"..white..")。使用洞穴尽头的传送门标志到达她那里。",
    Folgequest = "蓝龙之怒",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[2] = {
    Title = "芬克·恩霍尔，为您效劳！",
    Level = 60,
    Attain = 55,
    Aim = "与永望镇的玛雷弗斯·暗锤谈一谈。",
    Location = "芬克·恩霍尔 (黑石塔 "..yellow.."[8]"..white..")",
    Note = "芬克·恩霍尔 在剥皮 比斯巨兽 后出现。你在 (冬泉谷 - 永望镇 "..yellow.."61,38"..white..") 找到 玛雷弗斯。",
    Folgequest = "奥术护腿，猩红学者之帽，嗜血胸甲和光明使者肩甲",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[3] = {
    Title = "冷冻龙蛋",
    Level = 60,
    Attain = 57,
    Aim = "在孵化间对着某颗龙蛋使用龙蛋冷冻器初号机。",
    Location = "丁奇·斯迪波尔 (燃烧平原 - 烈焰峰 "..yellow.."65,24"..white..")",
    Note = "你在 "..yellow.."[2]"..white.." 的 烈焰之父 房间里找到蛋。",
    Prequest = "雏龙精华 -> 丁奇·斯迪波尔",
    Folgequest = "收集龙蛋 -> 尊敬的莱尼德·巴萨罗梅 -> 黎明先锋 ("..yellow.."通灵学院"..white..")",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[4] = {
    Title = "艾博希尔之眼",
    Level = 60,
    Attain = 56,
    Aim = "将艾博希尔之眼交给艾萨拉的海达克西斯公爵。",
    Location = "海达克西斯公爵 (艾萨拉 "..yellow.."79,73"..white..")",
    Note = "你可以在 "..yellow.."[1]"..white.." 找到 烈焰卫士艾博希尔。",
    Prequest = "被污染的水球，风暴和雷鸣",
    Folgequest = "熔火之心",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[5] = {
    Title = "达基萨斯将军之死",
    Level = 60,
    Attain = 55,
    Aim = "到黑石塔去杀掉达基萨斯将军，完成任务之后就回到麦克斯韦尔元帅那里复命。",
    Location = "麦克斯韦尔元帅 (燃烧平原 - 摩根的岗哨 "..yellow.."82,68"..white..")",
    Note = "你可以在以下地点找到达基萨斯将军："..yellow.."[9]"..white..".",
    Prequest = "达基萨斯将军的命令 ("..yellow.."下层黑石塔"..white..")",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[6] = {
    Title = "末日扣环",
    Level = 60,
    Attain = 57,
    Aim = "将末日扣环交给燃烧平原的玛亚拉·布莱特文。",
    Location = "玛亚拉·布莱特文 (燃烧平原 - 摩根的岗哨 "..yellow.."84,69"..white..")",
    Note = "你从 (暴风城 - 暴风城要塞 "..   yellow.."74,30"..white..") 的 雷明顿·瑞治维尔伯爵 那里获得前置任务。\n\n末日扣环 在 "..yellow.."[3]"..white.." 的一个箱子里。",
    Prequest = "玛亚拉·布莱特文",
    Folgequest = "瑞治维尔的箱子",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[7] = {
    Title = "龙火护符",
    Level = 60,
    Attain = 50,
    Aim = "你必须从达基萨斯将军身上取回黑龙勇士之血，你可以在黑石塔的晋升大厅后面的房间里找到他。",
    Location = "哈尔琳 (冬泉谷 "..yellow.."54,51"..white..")",
    Note = "联盟的 奥妮克希亚 任务链的最后一部分。你可以在以下地点找到达基萨斯将军："..yellow.."[9]"..white..".",
    Prequest = "巨龙之眼",
    Rewards = {
        Text = "奖励：",
        { id = 16309 }, --Drakefire Amulet Neck
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[8] = {
    Title = "黑手的命令",
    Level = 60,
    Attain = 55,
    Aim = "真是个愚蠢的兽人。看来你需要找到那枚烙印并获得达基萨斯徽记才可以使用命令宝珠。$B$B你从信中获知，达基萨斯将军守卫着烙印。也许你应该就此进行更深入的调查。",
    Location = "黑手的命令 (掉落自 裂盾军需官 "..yellow.."[7] 在 入口地图"..white..")",
    Note = "黑翼之巢开门任务。裂盾军需官在黑石塔下层/上层传送门前右转即可找到。德拉基萨斯将军在"..yellow.."[9]"..white.."。烙印在他身后。",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[9] = {
    Title = "最后的准备",
    Level = 60,
    Attain = 58,
    Aim = "从黑石塔的兽人那儿收集40副黑石护腕，把它们和一瓶超级能量合剂一起交给黑石山的伯德雷。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要超维度幽灵显形器才能看到布德利。你可以从“寻找安泰恩”任务中获得它。黑石护腕从名字中带有“黑手”的怪物身上掉落。超级能量合剂由炼金师制作。",
    Prequest = "瓦萨拉克护符的右半块 ("..yellow.."黑石塔上层"..white..")",
    Folgequest = "瓦塔拉克公爵",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[10] = {
    Title = "瓦塔拉克公爵",
    Level = 60,
    Attain = 58,
    Aim = "在比斯巨兽的房间里使用召唤火盆，召唤瓦塔拉克公爵。杀死他，对尸体使用瓦塔拉克的饰品。然后将瓦塔拉克的饰品还给瓦塔拉克公爵之魂。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你从 '寻找安泰恩' 任务中获得它。瓦萨拉克 在 "..   yellow.."[8]"..white.." 被召唤。列出的奖励是回到 布德利 处的。",
    Prequest = "最后的准备",
    Folgequest = "回到布德利那里",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 22057 }, --Brazier of Invocation Item
        { id = 22344 }, --Brazier of Invocation: User's Manual Item
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[11] = {
    Title = "恶魔熔炉",
    Level = 60,
    Attain = 55,
    Aim = "到黑石塔去找到古拉鲁克。杀死他，然后用血污长矛刺入他的尸体。当他的灵魂被吸干后，这支矛就会成为穿魂长矛。$B$B你还必须找到未铸造的符文覆饰胸甲。$B$B将穿魂长矛和未铸造的符文覆饰胸甲都交给冬泉谷的罗拉克斯。",
    Location = "罗拉克斯 (冬泉谷 "..yellow.."64,74"..white..")",
    Note = "锻造任务。古拉鲁克位于 "..yellow.."[5]"..white..".",
    Prequest = "罗拉克斯的故事",
    Rewards = {
        Text = "奖励：1 和 2 和 3",
        { id = 12696 },              --Plans: Demon Forged Breastplate Pattern
        { id = 9224, quantity = 5 }, --Elixir of Demonslaying Potion
        { id = 12849 },              --Demon Kissed Sack Container
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[12] = {
    Title = "护腕的上半部分之一",
    Level = 60,
    Attain = 55,
    Aim = "为了吉尔尼斯的帕纳布斯从黑石塔的黑色龙人身上收集一块龙族能量。",
    Location = "帕纳布斯 <流浪巫师> (吉尔尼斯 "..   yellow.."[22.9,74.4]"..white..", 吉尔尼斯城 最南端, 河流以西。在一座孤独的房子里)。",
    Note = "强烈建议从 正义的汉瓦 (逆风小径 卡拉赞 外面的小教堂 "..yellow.."[40.9,79.3]"..   white..") 那里接取前置任务 '桑萨尔的护腕'。\n上层束缚 任务链的最后一个任务的奖励将是用于任务 '桑萨尔的护腕' 的任务物品 '桑萨尔上部护腕'。",
    Prequest = "桑萨尔护腕",
    Folgequest = "护腕的上半部分之二 -> 护腕的上半部分之三"..yellow.."[厄运之槌 西]"..white.." -> 护腕的上半部分之四",
    Rewards = {
        Text = "奖励：",
        { id = 61696 }, --The Upper Binding of Xanthar 任务物品
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireUpper.Horde[i] = kQuestInstanceData.BlackrockSpireUpper.Alliance[i]
end
kQuestInstanceData.BlackrockSpireUpper.Horde[5] = {
    Title = "黑暗石板",
    Level = 60,
    Attain = 57,
    Aim = "将黑暗石板交给卡加斯的暗法师薇薇安·拉格雷。",
    Location = "暗法师薇薇安·拉格雷 (荒芜之地 - 卡加斯 "..yellow.."2,47"..white..")",
    Note = "你从 幽暗城 - 炼金房 ("..   yellow.."50,68"..white..") 的 药剂师金格 那里获得前置任务。\n\n黑暗石板 在 "..yellow.."[3]"..white.." 的一个箱子里。",
    Prequest = "薇薇安·拉格雷和黑暗石板",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[6] = {
    Title = "为部落而战！",
    Level = 60,
    Attain = 55,
    Aim = "去黑石塔杀死大酋长雷德·黑手，带着他的头颅返回奥格瑞玛。",
    Location = "萨尔 (奥格瑞玛 "..yellow.."31,38"..white..")",
    Note = "奥妮克希亚 门任务。你在 "..yellow.."[6]"..white.." 找到 大酋长雷德·黑手。",
    Prequest = "高图斯的命令 -> 伊崔格的智慧",
    Folgequest = "风吹来的消息",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[7] = {
    Title = "黑龙幻象",
    Level = 60,
    Attain = 55,
    Aim = "到黑石塔去收集20颗黑色龙人的眼球，完成任务之后回到巫女米兰达那里。",
    Location = "巫女米兰达 (西瘟疫之地 "..yellow.."50,77"..white..")",
    Note = "龙人会掉落眼球。",
    Prequest = "为部落而战！ -> 风吹来的消息 -> 幻术的欺诈",
    Folgequest = "埃博斯塔夫",
}
kQuestInstanceData.BlackrockSpireUpper.Horde[8] = {
    Title = "黑龙勇士之血",
    Level = 60,
    Attain = 55,
    Aim = "到黑石塔去杀掉达基萨斯将军，把它的血交给雷克萨。",
    Location = "雷克萨 (凄凉之地 - 葬影村 "..yellow.."25,71"..white..")",
    Note = "最后一部分 奥妮克希亚 前置任务. 你可以在以下地点找到达基萨斯将军："..yellow.."[9]"..white..".",
    Prequest = "埃博斯塔夫 -> 晋升……",
    Rewards = {
        Text = "奖励：",
        { id = 16309 }, --Drakefire Amulet Neck
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[9] = kQuestInstanceData.BlackrockSpireUpper.Alliance[8]
kQuestInstanceData.BlackrockSpireUpper.Horde[10] = kQuestInstanceData.BlackrockSpireUpper.Alliance[9]
kQuestInstanceData.BlackrockSpireUpper.Horde[11] = kQuestInstanceData.BlackrockSpireUpper.Alliance[10]
kQuestInstanceData.BlackrockSpireUpper.Horde[12] = kQuestInstanceData.BlackrockSpireUpper.Alliance[11]
kQuestInstanceData.BlackrockSpireUpper.Horde[13] = kQuestInstanceData.BlackrockSpireUpper.Alliance[12]

--------------- Dire Maul (东) ---------------
kQuestInstanceData.DireMaulEast = {
    Story =
    "一万两千年前由暗夜精灵巫师秘密组织建造，古老的艾萨拉城用来保护女王艾萨拉最珍贵的奥术秘密。尽管它在世界大灾变中遭到摧残，这座奇妙城市的大部分仍以厄运之槌的姿态傲然屹立。废墟的三个不同区域已被各种生物占领——尤其是幽灵上层精灵、邪恶萨特和野蛮的食人魔。只有最勇敢的冒险队伍才能进入这座破碎的城市，面对锁在其古老地窖中的远古邪恶。",
    Caption = "厄运之槌 (东)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulEast.Alliance[1] = {
    Title = "普希林和埃斯托尔迪",
    Level = 58,
    Attain = 54,
    Aim = "到厄运之槌去找到小鬼普希林。你可以使用任何手段从小鬼那里得到埃斯托尔迪的咒术之书。$B$B找到咒术之书后，回到拉瑞斯小亭的埃斯托尔迪那里。",
    Location = "埃斯托尔迪 (菲拉斯 - 拉里斯凉亭 "..yellow.."76,37"..white..")",
    Note = "普希林 在 厄运之槌 "..yellow.."东"..white.." 的 "..   yellow.."[1]"..white.."。他会在你与他交谈时逃跑，但在以下地点会停下来战斗："..yellow.."[2]"..white.."。他会掉落月牙钥匙，用于厄运之槌的北区和西区。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 18411 }, --Spry Boots Feet, Leather
        { id = 18410 }, --Sprinter's Sword Two-Hand, Sword
    }
}
kQuestInstanceData.DireMaulEast.Alliance[2] = {
    Title = "蕾瑟塔蒂丝的网",
    Level = 57,
    Attain = 54,
    Aim = "把蕾瑟塔蒂丝的网交给菲拉斯羽月要塞的拉托尼库斯·月矛。",
    Location = "拉托尼库斯·月矛 (菲拉斯 - 羽月要塞 "..yellow.."30,46"..white..")",
    Note = "蕾瑟塔蒂丝 在 厄运之槌 "..yellow.."东"..   white.." 的 "..yellow.."[3]"..white.."。前置任务来自 铁炉堡 的 信使落锤。他在整个城市巡逻。",
    Prequest = "羽月要塞",
    Rewards = {
        Text = "奖励：",
        { id = 18491 }, --Lorespinner Main Hand, Dagger
    }
}
kQuestInstanceData.DireMaulEast.Alliance[3] = {
    Title = "魔藤碎片",
    Level = 60,
    Attain = 56,
    Aim = "在厄运之槌中找到魔藤，然后从它上面采集一块碎片。只有干掉了奥兹恩之后，你才能进行采集工作。使用净化之匣安全地封印碎片，然后将其交给月光林地永夜港的拉比恩·萨图纳。",
    Location = "拉比恩·萨图纳 (月光林地 - 永夜港 "..yellow.."51,44"..white..")",
    Note = "你在 厄运之槌 "..yellow.."东"..   white.." 区的 "..   yellow.."[5]"..white.." 找到 荒野变形者奥利兹。遗物在希利苏斯 "..yellow.."62,54"..white.."。前置任务也来自拉比恩·萨图纳",
    Prequest = "净化之匣",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 18535 }, --Milli's Shield Shield
        { id = 18536 }, --Milli's Lexicon Held In Off-hand
    }
}
kQuestInstanceData.DireMaulEast.Alliance[4] = {
    Title = "瓦萨拉克护符的左半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆来召唤莫尔·灰蹄的灵魂并杀了他。带着瓦萨拉克护符的左半块和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你从 '寻找安泰恩' 任务中获得它。\n\n伊萨莉恩 在 "..   yellow.."[5]"..white.." 被召唤。",
    Prequest = "重要的材料",
    Folgequest = "奥卡兹岛在你前方……",
}
kQuestInstanceData.DireMaulEast.Alliance[5] = {
    Title = "瓦萨拉克护符的右半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆召唤莫尔·灰蹄的灵魂并杀了他。带着重新组合的瓦萨拉克护符和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你从 '寻找安泰恩' 任务中获得它。\n\n伊萨莉恩 在 "..   yellow.."[5]"..white.." 被召唤。",
    Prequest = "更多重要的材料",
    Folgequest = "最后的准备 ("..yellow.."黑石塔上层"..white..")",
}
kQuestInstanceData.DireMaulEast.Alliance[6] = {
    Title = "监牢之链",
    Level = 60,
    Attain = 60,
    Aim = "到菲拉斯的厄运之槌去，从扭木广场的荒野萨特身上找到15份萨特之血，然后把它们交给腐烂之痕的戴奥。",
    Location = "衰老的戴奥 (诅咒之地 - 腐烂之痕 "..yellow.."34,50"..white..")",
    Note = red..   "此任务仅限术士完成。"..white..": 这与 衰老的戴奥 给出的另一个任务都是为了 末日仪式 法术的术士专属任务。找到 荒野萨特 最简单的方法是通过 拉里斯凉亭 (菲拉斯 "..   yellow.."77,37"..white..") 的 '后门' 进入 厄运之槌 东。但是，你需要 月牙钥匙。",
}
kQuestInstanceData.DireMaulEast.Alliance[7] = {
    Title = "久违的法师",
    Level = 60,
    Attain = 60,
    Aim = "到厄运之槌的扭木广场去杀掉水元素海多斯博恩。把海多斯博恩精华交给图书馆的博学者莱德罗斯。",
    Location = "博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..white..")",
    Note = red.."法师专用"..white..": 海多斯博恩精华 掉落自 [3] 海多斯博恩。奖励：你可以使用 魔法晶水。",
    Folgequest = "一种特殊的传票",
    Rewards = {
        Text = "奖励：",
        { id = 83002 }, --Tome of Refreshment Ritual Pattern
    }
}
kQuestInstanceData.DireMaulEast.Alliance[8] = {
    Title = "狂野变形者",
    Level = 60,
    Attain = 55,
    Aim = "杀死奥兹恩，并为海加尔山诺达纳尔的大德鲁伊梦风带回他的头颅。",
    Location = "大德鲁伊梦风 (海加尔山 - 诺达纳尔 "..yellow.."84.8,29.3"..white.." 大树顶层)",
    Note = "你在 "..yellow.."[5]"..white.." 找到 荒野变形者奥利兹。",
    Rewards = {
        Text = "奖励：",
        { id = 61199 }, --Bright Dream Shard Reagent
        { id = 61703 }, --Talisman of the Dreamshaper Neck
    }
}
kQuestInstanceData.DireMaulEast.Alliance[9] = {
    Title = "缠绕扭木",
    Level = 61,
    Attain = 60,
    Aim = "将5片蓝叶带给博学者莱德罗斯。",
    Location = "博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..white..")",
    Note = red..   "仅德鲁伊"..white..": 蓝色叶子 掉落自 树人。\n前置任务开始于 [古树和树人] - (卡拉赞之塔 "..   yellow.."附近 [0]"..white..")", --2020112 
    Prequest = "魔法树木研究",
    Rewards = {
        Text = "奖励：",
        { id = 51070 }, --Glyph of the Arcane Treant Glyph
    }
}
kQuestInstanceData.DireMaulEast.Horde[1] = kQuestInstanceData.DireMaulEast.Alliance[1]
kQuestInstanceData.DireMaulEast.Horde[2] = {
    Title = "蕾瑟塔蒂丝的网",
    Level = 57,
    Attain = 54,
    Aim = "把蕾瑟塔蒂丝的网交给菲拉斯羽月要塞的拉托尼库斯·月矛。",
    Location = "塔罗·刺蹄 (菲拉斯 - 莫沙彻营地 "..yellow.."76,43"..white..")",
    Note = "蕾瑟塔蒂丝 在 厄运之槌 "..yellow.."东"..   white.." 的 "..yellow.."[3]"..white.."。前置任务来自 奥格瑞玛 的 公告员高拉克。他在整个城市巡逻。",
    Prequest = "莫沙彻营地",
    Rewards = kQuestInstanceData.DireMaulEast.Alliance[2].Rewards
}
for i = 3, 9 do
    kQuestInstanceData.DireMaulEast.Horde[i] = kQuestInstanceData.DireMaulEast.Alliance[i]
end

--------------- Dire Maul (North) ---------------
kQuestInstanceData.DireMaulNorth = {
    Story = kQuestInstanceData.DireMaulEast.Story,
    Caption = "厄运之槌 (北)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulNorth.Alliance[1] = {
    Title = "破碎的陷阱",
    Level = 60,
    Attain = 56,
    Aim = "修理陷阱。",
    Location = "破碎的陷阱 (厄运之槌 "..yellow.."北"..white..")",
    Note = "可重复任务。要修理陷阱，你必须使用一个 [瑟银零件] 和一个 [冰霜之油]。",
}
kQuestInstanceData.DireMaulNorth.Alliance[2] = {
    Title = "戈多克食人魔装",
    Level = 60,
    Attain = 56,
    Aim = "把4份符文布卷、8块硬甲皮、2卷符文线和一份食人魔鞣酸交给诺特·希姆加克。他现在被拴在厄运之槌的戈多克食人魔那边。",
    Location = "诺特·希姆加克 (厄运之槌 "..yellow.."北, [4]"..white..")",
    Note = "可重复任务。你在 "..yellow.."[4] (上方)"..white.." 附近获得 食人魔鞣酸。",
    Rewards = {
        Text = "奖励：",
        { id = 18258 }, --Gordok Ogre Suit Disguise
    }
}
kQuestInstanceData.DireMaulNorth.Alliance[3] = {
    Title = "逃出生天！",
    Level = 60,
    Attain = 57,
    Aim = "为 诺特·希姆加克 收集一把 戈多克镣铐钥匙。",
    Location = "诺特·希姆加克 (厄运之槌 "..yellow.."北, [4]"..white..")",
    Note = "可重复任务。每个卫兵都会掉落钥匙。",
}
kQuestInstanceData.DireMaulNorth.Alliance[4] = {
    Title = "戈多克食人魔的事务",
    Level = 60,
    Attain = 56,
    Aim = "找到戈多克力量护手，并将它交给厄运之槌的克罗卡斯。$B根据克罗卡斯所说的，“传说”自称是王子的精灵托塞德林从一名戈多克食人魔手中偷走了那件神器。",
    Location = "克罗卡斯 (厄运之槌 "..yellow.."北, [5]"..white..")",
    Note = "王子 在 厄运之槌 "..yellow.."西"..white.." 的 "..yellow.."[7]"..white.."。护手在他附近的一个箱子里。你只能在完成“戈多克贡品”之后，并且拥有“戈多克大王”增益效果时才能接受此任务。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 18369 }, --Gordok's Handwraps Hands, Cloth
        { id = 18368 }, --Gordok's Gloves Hands, Leather
        { id = 18367 }, --Gordok's Gauntlets Hands, Mail
        { id = 18366 }, --Gordok's Handguards Hands, Plate
    }
}
for i = 1, 4 do
    kQuestInstanceData.DireMaulNorth.Horde[i] = kQuestInstanceData.DireMaulNorth.Alliance[i]
end

--------------- Dire Maul (West) ---------------
kQuestInstanceData.DireMaulWest = {
    Story = kQuestInstanceData.DireMaulEast.Story,
    Caption = "厄运之槌 (西)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulWest.Alliance[1] = {
    Title = "精灵的传说",
    Level = 60,
    Attain = 54,
    Aim = "到厄运之槌去寻找卡里尔·温萨鲁斯。向莫沙彻营地的先知科鲁拉克报告你所找到的信息。",
    Location = "学者卢索恩·纹角 (菲拉斯 - 羽月要塞 "..yellow.."31,43"..white..")",
    Note = "你在 "..yellow.."图书馆 (西)"..white.." 找到 卡里尔·温萨鲁斯。",
}
kQuestInstanceData.DireMaulWest.Alliance[2] = {
    Title = "伊莫塔尔的疯狂",
    Level = 60,
    Attain = 56,
    Aim =
    "你必须干掉5座水晶塔周围的守卫，那5座水晶塔维持着关押伊莫塔尔的监狱。一旦水晶塔的能量被削弱，伊莫塔尔周围的能量力场就会消散。$B$B进入伊莫塔尔的监狱，干掉站在中间的那个恶魔。最后，在图书馆挑战托塞德林王子。$B$B当任务完成之后，到庭院中去找辛德拉古灵。",
    Location = "辛德拉古灵 (厄运之槌 "..yellow.."西, [1] (上方)"..white..")",
    Note = "水晶塔标记为 "..   blue.."[B]"..white.."。伊莫塔尔 在 "..yellow..   "[6]"..white.."，托塞德林王子 在 "..yellow.."[7]"..white.."。",
    Folgequest = "辛德拉的宝藏",
}
kQuestInstanceData.DireMaulWest.Alliance[3] = {
    Title = "辛德拉的宝藏",
    Level = 60,
    Attain = 56,
    Aim = "返回图书馆去找到辛德拉的宝藏。拿取你的奖励吧！",
    Location = "辛德拉古灵 (厄运之槌 "..yellow.."西, [1]"..white..")",
    Note = "你可以在 "..yellow.."[7]"..white.." 的楼梯下找到宝藏。",
    Prequest = "伊莫塔尔的疯狂",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 18424 }, --Sedge Boots Feet, Leather
        { id = 18421 }, --Backwood Helm Head, Mail
        { id = 18420 }, --Bonecrusher Two-Hand, Mace
    }
}
kQuestInstanceData.DireMaulWest.Alliance[4] = {
    Title = "克索诺斯恐惧战马",
    Level = 60,
    Attain = 60,
    Aim = "阅读莫苏尔的指南，并召唤出一匹克索诺斯恐惧战马，击败它，然后控制它的灵魂。",
    Location = "莫苏尔·召血者 (燃烧平原 "..yellow.."12,31"..white..")",
    Note = red..   "此任务仅限术士完成。"..white..": 术士史诗坐骑任务链的最后一步。首先你必须关闭所有标记为 "..   blue..   "[B]"..white.." 的水晶塔，然后在 "..yellow.."[6]"..white.." 杀死 伊莫塔尔。之后，你可以开始召唤仪式。务必准备好 20 个以上的 灵魂碎片，并指派一名术士专门负责维持 钟、蜡烛 和 车轮。出现的 末日守卫 可以被奴役。完成后，与 恐惧战马之魂 交谈以完成任务。",
    Prequest = "瓶中的小鬼 ("..yellow.."通灵学院"..white..")", -- 7629",
}
kQuestInstanceData.DireMaulWest.Alliance[5] = {
    Title = "翡翠梦境……",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "翡翠梦境 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."仅德鲁伊"..white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者亚沃。",
    Rewards = {
        Text = "奖励：",
        { id = 18470 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[6] = {
    Title = "最伟大的猎手",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "最伟大的猎手 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."仅限猎人"..   white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者麦库斯。",
    Rewards = {
        Text = "奖励：",
        { id = 18473 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[7] = {
    Title = "奥法师的食谱",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "奥法师的食谱 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."法师专用"..white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者基尔达斯。",
    Rewards = {
        Text = "奖励：",
        { id = 18468 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[8] = {
    Title = "圣光之力",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "圣光之力 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."圣骑士专用"..white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者麦库斯。",
    Rewards = {
        Text = "奖励：",
        { id = 18472 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[9] = {
    Title = "光明不会告诉你的事情",
    Level = 60,
    Attain = 56,
    Aim = "将这本典籍交给它的主人。",
    Location = "光明不会告诉你的事情 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."仅限牧师"..   white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者亚沃。",
    Rewards = {
        Text = "奖励：",
        { id = 18469 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[10] = {
    Title = "迦罗娜：潜行与诡计研究",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "迦罗娜：潜行与诡计研究 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."仅限潜行者"..   white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者基尔达斯。",
    Rewards = {
        Text = "奖励：",
        { id = 18465 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[11] = {
    Title = "你与冰霜震击",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "你与冰霜震击 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."仅限萨满祭司"..   white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者亚沃。",
    Rewards = {
        Text = "奖励：",
        { id = 18471 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[12] = {
    Title = "束缚之影",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "束缚之影 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."此任务仅限术士完成。"..   white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者麦库斯。",
    Rewards = {
        Text = "奖励：",
        { id = 18467 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[13] = {
    Title = "防御宝典",
    Level = 60,
    Attain = 54,
    Aim = "将这本典籍交给它的主人。",
    Location = "防御宝典 (随机掉落自所有 厄运之槌 区域的首领)",
    Note = red.."仅限战士"..white..": 你将书交给 "..yellow.."1' 图书馆"..white.." 的 博学者基尔达斯。",
    Rewards = {
        Text = "奖励：",
        { id = 18466 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[14] = {
    Title = "专注圣契",
    Level = 60,
    Attain = 58,
    Aim = "将一本专注圣契、1颗原始黑钻石、4块大魔光碎片和2块暗影之皮带给厄运之槌的博学者莱德罗斯，以获得专注秘药。",
    Location = "博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..white..")",
    Note = "这不是一个前置任务，但必须先完成“精灵的传说”才能开始此任务。这本圣典是厄运之槌的随机掉落物品，并且可以交易，因此可以在拍卖行找到。暗影之皮是灵魂绑定的，可以从一些首领、复活的构造体和复活的骷髅守卫身上掉落，在"..yellow.."通灵学院"..white.."。",
    Rewards = {
        Text = "奖励：",
        { id = 18330 }, --Arcanum of Focus Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[15] = {
    Title = "防护圣契",
    Level = 60,
    Attain = 58,
    Aim = "将防护圣契、1颗原始黑钻石、2大块魔光碎片和1条磨损的憎恶缝合线带给厄运之槌的博学者莱德罗斯，以获得防护秘药。",
    Location = "博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..white..")",
    Note = "这不是一个前置任务，但必须先完成精灵的传说才能开始此任务。这本圣典是厄运之槌的随机掉落物品，并且可以交易，因此可以在拍卖行找到。磨损的憎恶缝合线是灵魂绑定的，可以从吞咽者拉姆斯登、毒液喷射者、喷胆者和缝补憎恶身上掉落，在"..yellow.."斯坦索姆"..white.."。",
    Rewards = {
        Text = "奖励：",
        { id = 18331 }, --Arcanum of Protection Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[16] = {
    Title = "急速圣契",
    Level = 60,
    Attain = 58,
    Aim = "将急速圣契、1颗原始黑钻石、2块大魔光碎片和2块英雄之血交给厄运之槌的博学者莱德罗斯，即可获得急速秘药。",
    Location = "博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..white..")",
    Note = "这不是一个前置任务，但必须先完成精灵的传说才能开始此任务。这本圣典是厄运之槌的随机掉落物品，并且可以交易，因此可以在拍卖行找到。英雄之血是灵魂绑定的，可以在西瘟疫之地和东瘟疫之地的随机地点找到。",
    Rewards = {
        Text = "奖励：",
        { id = 18329 }, --Arcanum of Rapidity Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[17] = {
    Title = "弗洛尔的屠龙技术纲要",
    Level = 60,
    Attain = 60,
    Aim = "将《弗洛尔的屠龙技术纲要》还回图书馆。",
    Location = "弗洛尔的屠龙技术纲要 (随机掉落自 "..yellow.."厄运之槌"..white.." 首领)",
    Note = red..   "战士或圣骑士任务。"..white.." 交给 博学者莱德罗斯 (厄运之槌 - 西 或 北 "..   yellow.."[1] 图书馆"..white..")。完成此任务可以开始 奎尔塞拉 的任务。",
    Folgequest = "铸造奎尔塞拉",
}
kQuestInstanceData.DireMaulWest.Alliance[18] = {
    Title = "保守秘密",
    Level = 58,
    Attain = 45,
    Aim = "前往厄运之槌，杀死上层精灵正在吸取能量的大恶魔，从中获取纯净魔之精华。回到艾萨拉的守护者拉恩那那里。",
    Location = "守护者拉恩那 (艾萨拉 "..yellow.."44,45.4"..white..")",
    Note = "伊莫塔尔 "..yellow.."[6]"..white.." 掉落 纯净魔之精华。\n任务链开始于 艾萨拉 东北角海岸的 守护者艾瑟勒斯 "..   yellow.."89,8,33.8"..white.." 的任务 '守护者的责任'。",
    Prequest = "恢复魔网线",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60333 }, --Azshara Keeper's Staff Staff
        { id = 60334 }, --Ring of Eldara Ring
    }
}
kQuestInstanceData.DireMaulWest.Alliance[19] = {
    Title = "护腕的上半部分之三",
    Level = 60,
    Attain = 55,
    Aim = "为了吉尔尼斯的帕纳布斯从厄运之槌西的任意奥术元素身上收集一个奥术超载谐振器。",
    Location = "帕纳布斯 <流浪巫师> (吉尔尼斯 "..   yellow.."[22.9,74.4]"..white..", 吉尔尼斯城 最南端, 河流以西。在一座孤独的房子里)。",
    Note = "强烈建议从 正义的汉瓦 (逆风小径 卡拉赞 外面的小教堂 "..yellow.."[40.9,79.3]"..white..") 那里接取前置任务 '桑萨尔的护腕'。\n上层束缚 任务链的最后一个任务的奖励将是用于任务 '桑萨尔的护腕' 的任务物品 '桑萨尔上部护腕'。\n"..   yellow.."[6]"..white.." 周围圆圈里的大型元素生物 奥术洪流 掉落 奥术超载谐振器。",
    Prequest = "桑萨尔护腕 -> 护腕的上半部分之一"..yellow.."[黑石塔上层]"..white.." -> 上层束缚 II", --41015, 41011, 41012",
    Folgequest = "护腕的上半部分之四",
    Rewards = {
        Text = "奖励：",
        { id = 61696 }, --The Upper Binding of Xanthar 任务物品
    }
}
kQuestInstanceData.DireMaulWest.Alliance[20] = {
    Title = "卡拉赞的钥匙之八",
    Level = 60,
    Attain = 58,
    Aim = "在厄运之槌中杀死伊莫塔尔，从他的皮肤上取回奥术宝石，然后返回多万·布雷斯温德身边。",
    Location = "多万·布雷斯温德 (尘泥沼泽 -  "..yellow.."[71.1,73.2]"..white..")",
    Note = "前置任务 卡拉赞下层大厅。奥术宝石 掉落自 "..yellow.."[6].",
    Prequest = "卡拉赞的钥匙 I - VI -> 卡拉赞的钥匙之七"..yellow.."[斯坦索姆]"..white.." ", --40817",
    Folgequest = "卡拉赞的钥匙之九 (黑翼之巢) -> 卡拉赞的钥匙之十",
}
kQuestInstanceData.DireMaulWest.Alliance[21] = {
    Title = "寐入梦境之三",
    Level = 60,
    Attain = 58,
    Aim = "从艾萨拉的峭壁击碎者身上收集一片束缚碎片，从厄运之槌西的秘法洪流身上收集一个奥术过载棱镜，从沉没的神庙中的沉睡绿龙的身上收集一片沉睡者碎片。带着收集到的物品向悲伤沼泽的伊萨里奥斯报告。",
    Location = "拉拉修斯 (海加尔山 - 诺达纳尔 "..yellow.."[81.6,27.7]"..white.." a green dragonkin)",
    Note = ""..yellow.."[6]"..white.." 周围圆圈里的大型元素生物 奥术洪流 掉落 奥术过载棱镜。\n完成此任务链你将获得项链，并且可以进入 海加尔山 团队副本 翡翠圣殿。",
    Prequest = "寐入梦境之一 -> 寐入梦境之二",
    Folgequest = "进入梦境 IV - VI",
    Rewards = {
        Text = "奖励：",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.DireMaulWest.Horde[1] = {
    Title = "精灵的传说",
    Level = 60,
    Attain = 54,
    Aim = "到厄运之槌去寻找卡里尔·温萨鲁斯。向莫沙彻营地的先知科鲁拉克报告你所找到的信息。",
    Location = "先知科鲁拉克 (菲拉斯 - 莫沙彻营地 "..yellow.."74,43"..white..")",
    Note = "你在 "..yellow.."图书馆 (西)"..white.." 找到 卡里尔·温萨鲁斯。"
}
for i = 2, 21 do
    kQuestInstanceData.DireMaulWest.Horde[i] = kQuestInstanceData.DireMaulWest.Alliance[i]
end

--------------- Maraudon ---------------
kQuestInstanceData.Maraudon = {
    Story =
    "在凶猛的玛拉顿半人马保护下，玛拉顿是凄凉之地最神圣的地方之一。这座宏伟的神庙/洞穴是扎尔塔的安葬之地，他是半神塞纳留斯两个不朽儿子之一。传说扎尔塔和大地元素公主瑟莱德丝生下了不幸的半人马种族。据说在诞生之时，野蛮的半人马背叛并杀死了他们的父亲。有人相信瑟莱德丝在悲痛中将扎尔塔的灵魂困在蜿蜒的洞穴中——为某种邪恶目的利用其能量。地下隧道中居住着凶恶、早已死去的半人马可汗幽灵，以及瑟莱德丝自己狂暴的元素仆从。",
    Caption = "玛拉顿",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Maraudon.Alliance[1] = {
    Title = "暗影残片",
    Level = 42,
    Attain = 38,
    Aim = "从玛拉顿收集10块暗影残片，然后把它们交给奥格瑞玛的尤塞尔奈。",
    Location = "大法师特沃许 (尘泥沼泽 - 塞拉摩岛 "..yellow.."66,49"..white..")",
    Note = "你从副本外紫色区域的'暗影碎片巡游者'或'暗影碎片击碎者'身上获得暗影残片。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 17772 }, --Zealous Shadowshard Pendant Neck
        { id = 17773 }, --Prodigious Shadowshard Pendant Neck
    }
}
kQuestInstanceData.Maraudon.Alliance[2] = {
    Title = "维利塔恩的污染",
    Level = 47,
    Attain = 41,
    Aim = "在玛拉顿里用天蓝水瓶在橙色水晶池中装满水。$B$B在维利斯塔姆藤蔓上使用装满水的天蓝水瓶，使堕落的诺克赛恩幼体出现。$B$B治疗8株植物并杀死那些诺克赛恩幼体，然后向葬影村的瓦克·战痕复命。",
    Location = "塔琳德莉亚 (凄凉之地 - 尼耶尔前哨站 "..yellow.."68,8"..white..")",
    Note = "你可以在副本外橙色区域的任何水池中装满水瓶。植物在副本内的橙色和紫色区域。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 17768 }, --Woodseed Hoop Ring
        { id = 17778 }, --Sagebrush Girdle Waist, Leather
        { id = 17770 }, --Branchclaw Gauntlets Hands, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[3] = {
    Title = "扭曲的邪恶",
    Level = 47,
    Attain = 41,
    Aim = "为凄凉之地的维洛收集15个瑟莱德丝水晶雕像。",
    Location = "柳 (凄凉之地 "..yellow.."62,39"..white..")",
    Note = "玛拉顿 中的大多数怪物都会掉落雕像。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 17775 }, --Acumen Robes Chest, Cloth
        { id = 17776 }, --Sprightring Helm Head, Leather
        { id = 17777 }, --Relentless Chain Chest, Mail
        { id = 17779 }, --Hulkstone Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[4] = {
    Title = "贱民的指引",
    Level = 48,
    Attain = 39,
    Aim = "阅读贱民的指引，然后从玛拉顿得到联合坠饰，将其交给凄凉之地南部的半人马贱民。",
    Location = "半人马贱民 (凄凉之地 "..yellow.."45,86"..white..")",
    Note = "5个可汗（贱民的指引 的描述）",
    Rewards = {
        Text = "奖励：",
        { id = 17774 }, --Mark of the Chosen Trinket
    },
    page = { 2, "你会在凄凉之地的南部找到半人马弃儿。他在"..yellow.."44,85"..white.."和"..yellow.."50,87"..white.."之间游荡。\n首先，你必须杀死无名先知（"..yellow.."入口地图的A点"..white.."). 你会在进入副本之前找到他，就在你可以选择走紫色入口还是橙色入口之前。杀死他之后，你必须击败5个可汗。如果你选择中间的道路，你会找到第一个可汗（"..yellow.."入口地图的[1]点"..white.."）。第二个在玛拉顿的紫色区域，但在你进入副本之前（"..yellow.."入口地图的[2]点"..white.."）。第三个在玛拉顿的橙色区域，在你进入副本之前（"..yellow.."入口地图的[3]点"..white.."）。第四个在"..yellow.."[4]"..white.."附近，第五个在"..yellow.."[1]"..white.."附近。" },
}
kQuestInstanceData.Maraudon.Alliance[5] = {
    Title = "玛拉顿的传说",
    Level = 49,
    Attain = 41,
    Aim = "找回塞雷布拉斯节杖的两个部分：塞雷布拉斯魔棒和塞雷布拉斯钻石。$B$B然后设法和塞雷布拉斯对话。",
    Location = "凯雯德拉 (凄凉之地 - 玛拉顿 "..yellow.."[4] 在 入口地图"..white..")",
    Note = "你在橙色区域的入口处找到 凯雯德拉。\n你从 "..       yellow..       "[2]"..       white..       " 的 诺克赛恩 那里获得 塞雷布拉斯魔棒，从 "..       yellow..       "[5]"..white..       " 的 维利塔恩 那里获得 塞雷布拉斯钻石。塞雷布拉斯 在 "..yellow.."[7]"..white.."。你必须击败他才能与他交谈。",
    Folgequest = "塞雷布拉斯节杖",
}
kQuestInstanceData.Maraudon.Alliance[6] = {
    Title = "塞雷布拉斯节杖",
    Level = 49,
    Attain = 41,
    Aim = "帮助赎罪的塞雷布拉斯制作塞雷布拉斯节杖。$B$B当仪式完成之后再和他谈谈。",
    Location = "赎罪的塞雷布拉斯 (玛拉顿 "..yellow.."[7]"..white..")",
    Note = "塞雷布拉斯 制作节杖。在他完成后与他交谈。",
    Prequest = "玛拉顿的传说",
    Rewards = {
        Text = "奖励：",
        { id = 17191 }, --Scepter of Celebras Item
    }
}
kQuestInstanceData.Maraudon.Alliance[7] = {
    Title = "大地的污染",
    Level = 51,
    Attain = 45,
    Aim = "杀死瑟莱德丝公主，然后回到凄凉之地葬影村附近的瑟琳德拉那里复命。",
    Location = "守护者玛兰迪斯 (凄凉之地 - 尼耶尔前哨站 "..yellow.."63,10"..white..")",
    Note = "你在 "..yellow.."[11]"..white.." 找到 瑟莱德丝公主。",
    Folgequest = "生命之种",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 17705 }, --Thrash Blade One-Hand, Sword
        { id = 17743 }, --Resurgence Rod Staff
        { id = 17753 }, --Verdant Keeper's Aim Bow
    }
}
kQuestInstanceData.Maraudon.Alliance[8] = {
    Title = "生命之种",
    Level = 51,
    Attain = 45,
    Aim = "到月光林地去找到雷姆洛斯，将生命之种交给他。",
    Location = "扎尔塔之魂 (玛拉顿 "..yellow.."[11]"..white..")",
    Note = "扎尔塔之魂 在杀死 瑟莱德丝公主 "..   yellow.."[11]"..white.." 后出现。你在 (月光林地 - 雷姆洛斯神殿 "..yellow.."36,41"..white..") 找到 守护者雷姆洛斯。",
    Prequest = "大地的污染",
}
kQuestInstanceData.Maraudon.Alliance[9] = {
    Title = "奇美兰的挽具",
    Level = 48,
    Attain = 38,
    Aim = "从玛拉顿那里取回奇美兰的挽具，并将其带回菲拉斯奇美拉栖息谷的威罗斯·锐击处。",
    Location = "威罗斯·锐击 (菲拉斯 - 奇美拉栖息谷 "..yellow.."[82.0,62.3]"..white.." 菲拉斯 东南角)",
    Note = "紫色 玛拉顿 萨特首领 维利塔恩 "..yellow.."[5]"..white.." 掉落 奇美兰的挽具。",
    Prequest = "清理巢穴 -> 喂养幼崽",
    Rewards = {
        Text = "奖励：",
        { id = 61517 }, --Chimaera's Eye Trinket
    }
}
kQuestInstanceData.Maraudon.Alliance[10] = {
    Title = "为什么不两者兼得？",
    Level = 50,
    Attain = 40,
    Aim = "从玛拉顿的深处获得山崩之心，从燃烧平原的仇恨熔炉采石场获得腐蚀精华，然后带给鹰巢山的弗里格·雷炉。",
    Location = "弗里格·雷炉 (辛特兰 - 鹰巢山 "..yellow.."[10.0, 49.3]"..white..")。",
    Note = "兰斯利德 在 "..yellow.."[8]"..white.."。",
    Prequest = "证明一个观点 -> 我曾在书中读到过",
    Folgequest = "雷炉大师",
    Rewards = {
        Text = "奖励：",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
kQuestInstanceData.Maraudon.Alliance[11] = {
    Title = "准备",
    Level = 48,
    Attain = 34,
    Aim = "从玛拉顿的兰斯利德身上取得大理石块，并交给荒芜之地科萨恩废墟附近的齐格伦。",
    Location = "齐格伦 <Artisan Gemologist> (荒芜之地 - 科萨恩废墟 "..yellow.."[29, 27]"..white..").",
    Note = red.."仅限珠宝加工。"..   white.." 宝石学家专精任务链。\n兰斯利德 在 "..yellow.."[8]"..white.."。",
    Prequest = "掌握宝石学 -> 生命之源 -> 展示",
    Folgequest = "最终的切割",
}
kQuestInstanceData.Maraudon.Horde[1] = {
    Title = "暗影残片",
    Level = 42,
    Attain = 38,
    Aim = "从玛拉顿收集10块暗影残片，然后把它们交给奥格瑞玛的尤塞尔奈。",
    Location = "尤塞尔奈 (奥格瑞玛 - 精灵谷 "..yellow.."39,86"..white..")",
    Note = "你从副本外紫色区域的'暗影碎片巡游者'或'暗影碎片击碎者'身上获得暗影残片。",
    Rewards = kQuestInstanceData.Maraudon.Alliance[1].Rewards
}
kQuestInstanceData.Maraudon.Horde[2] = {
    Title = "维利塔恩的污染",
    Level = 47,
    Attain = 41,
    Aim = "在玛拉顿里用天蓝水瓶在橙色水晶池中装满水。$B$B在维利斯塔姆藤蔓上使用装满水的天蓝水瓶，使堕落的诺克赛恩幼体出现。$B$B治疗8株植物并杀死那些诺克赛恩幼体，然后向葬影村的瓦克·战痕复命。",
    Location = "瓦克·战痕 (凄凉之地 - 葬影村 "..yellow.."23,70"..white..")",
    Note = "你可以在副本外橙色区域的任何水池中装满水瓶。植物在副本内的橙色和紫色区域。",
    Rewards = kQuestInstanceData.Maraudon.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.Maraudon.Horde[i] = kQuestInstanceData.Maraudon.Alliance[i]
end
kQuestInstanceData.Maraudon.Horde[7] = {
    Title = "大地的污染",
    Level = 51,
    Attain = 45,
    Aim = "杀死瑟莱德丝公主，然后回到凄凉之地葬影村附近的瑟琳德拉那里复命。",
    Location = "瑟琳德拉 (凄凉之地 "..yellow.."27,77"..white..")",
    Note = "你在 "..yellow.."[11]"..white.." 找到 瑟莱德丝公主。",
    Folgequest = "生命之种",
    Rewards = kQuestInstanceData.Maraudon.Alliance[7].Rewards
}
kQuestInstanceData.Maraudon.Horde[8] = kQuestInstanceData.Maraudon.Alliance[8]
kQuestInstanceData.Maraudon.Horde[9] = {
    Title = "准备",
    Level = 48,
    Attain = 34,
    Aim = "从玛拉顿的兰斯利德身上取得大理石块，并交给荒芜之地科萨恩废墟附近的齐格伦。",
    Location = "齐格伦 <Artisan Gemologist> (荒芜之地 - 科萨恩废墟 "..yellow.."[29, 27]"..white..").",
    Note = red..   "仅限珠宝加工。"..   white.." 宝石学家专精任务链。\n兰斯利德 在 "..yellow.."[8]"..white.."。",
    Prequest = "掌握宝石学 -> 生命之源 -> 展示",
    Folgequest = "最终的切割",
}

--------------- Molten Core ---------------
kQuestInstanceData.MoltenCore = {
    Story = "熔火之心位于黑石深渊的最底部。它是黑石山的心脏，也是很久以前，索瑞森大帝在绝境中试图扭转矮人内战局势，将元素炎魔之王拉格纳罗斯召唤到这个世界的确切地点。尽管炎魔之王无法远离炽热的核心，但人们相信他的元素仆从指挥着黑铁矮人，他们正在用活石创造军队。拉格纳罗斯沉睡的燃烧之湖充当连接火元素位面的裂隙，允许恶意的元素穿过。拉格纳罗斯的代理人中最重要的是管理者埃克索图斯——因为这个狡猾的元素是唯一能够将炎魔之王从沉睡中唤醒的存在。",
    Caption = "熔火之心",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.MoltenCore.Alliance[1] = {
    Title = "熔火之心",
    Level = 60,
    Attain = 57,
    Aim = "杀死一个火焰之王、一个熔岩巨人、一个上古熔火恶犬和一个熔岩奔腾者，然后回到艾萨拉的海达克西斯公爵那里。",
    Location = "海达克西斯公爵 (艾萨拉 "..yellow.."79,73"..white..")",
    Note = "这些是 熔火之心 内的非首领怪物。",
    Prequest = "艾博希尔之眼 ("..yellow.."黑石塔上层"..white..")", -- 6821",
    Folgequest = "海达克西斯的使者",
}
kQuestInstanceData.MoltenCore.Alliance[2] = {
    Title = "敌人之手",
    Level = 60,
    Attain = 60,
    Aim = "将鲁西弗隆之手、萨弗隆之手、沙斯拉尔之手交给艾萨拉的海达克西斯公爵。",
    Location = "海达克西斯公爵 (艾萨拉 "..yellow.."79,73"..white..")",
    Note = "鲁西弗隆 在 "..yellow.."[2]"..white.."，萨弗隆 在 "..yellow.."[8]"..white.."，沙斯拉尔 在 "..yellow.."[6]"..   white.."。",

    Prequest = "海达克西斯的使者",
    Folgequest = "英雄的奖赏",
}
kQuestInstanceData.MoltenCore.Alliance[3] = {
    Title = "逐风者桑德兰",
    Level = 60,
    Attain = 60,
    Aim = "要想将逐风者桑德兰从他的监狱中解救出来，你就必须找到左右两个逐风者禁锢镣铐，10块源质锭，以及火焰之王的精华，把它们交给大领主德米提恩。",
    Location = "大领主德米提恩 (希利苏斯 "..yellow.."22,9"..white..")",
    Note = "雷霆之怒，逐风者的祝福之剑 任务链的一部分。在从 "..yellow.."[4]"..white.." 的 加尔 或 "..yellow.."[6]"..white.." 的 迦顿男爵 处获得左侧或右侧 逐风者禁锢镣铐 后开始。然后与 大领主德米提恩 交谈开始任务链。火焰之王的精华 从 "..yellow.."[10]"..white.." 的 拉格纳罗斯 处掉落。完成此任务后，桑德兰王子 会被召唤，你必须杀死他。他是一个 40 人团队首领。",
    Prequest = "复生之瓶",
    Folgequest = "觉醒吧，雷霆之怒",
}
kQuestInstanceData.MoltenCore.Alliance[4] = {
    Title = "瑟银兄弟会契约",
    Level = 60,
    Attain = 60,
    Aim = "如果你愿意接受萨弗隆的设计图，请将瑟银兄弟会契约交给罗克图斯·暗契。",
    Location = "罗克图斯·暗契 (黑石深渊 "..yellow.."[15]"..white..")",
    Note = "你需要一个 萨弗隆铁锭 才能从 罗克图斯 那里获得契约。它掉落自 熔火之心 "..yellow..   "[7]"..white.." 的 焚化者古雷曼格。",
    Rewards = {
        Text = "奖励：",
        { id = 18592 }, --Plans: Sulfuron Hammer Pattern
    }
}
kQuestInstanceData.MoltenCore.Alliance[5] = {
    Title = "远古石叶",
    Level = 60,
    Attain = 60,
    Aim = "找到远古石叶的主人。祝你好运，$N。这个世界是很大的。",
    Location = "远古石叶 (掉落自 "..yellow.."[9]"..white.." 的 火焰之王的宝箱)",
    Note = "交给 (费伍德森林 - 铁木森林 "..yellow.."49,24"..white..") 的 古树瓦特鲁斯。",
    Folgequest = "龙筋箭袋 ("..yellow.."埃索雷葛斯"..white..")", -- 7634",
}
kQuestInstanceData.MoltenCore.Alliance[6] = {
    Title = "唯一的方案",
    Level = 60,
    Attain = 60,
    Aim = "把8章《龙语傻瓜教程》的章节用魔法书封面合起来，然后把完整的《龙语傻瓜教程：第二卷》交给塔纳利斯的纳瑞安。",
    Location = "纳瑞安 (塔纳利斯 "..yellow.."65,18"..white..")",
    Note = "只有一个人可以拾取章节。龙语傻瓜教程 VIII (掉落自 拉格纳罗斯 "..yellow.."[10]"..white..")",
    Prequest = "螳螂捕蝉！",
    Folgequest = "好消息和坏消息 (必须完成 斯图沃尔，前任死党 和 永远别问我的生意 任务链)",
    Rewards = {
        Text = "奖励：",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.MoltenCore.Alliance[7] = {
    Title = "占卜眼镜？没问题！",
    Level = 60,
    Attain = 60,
    Aim = "找到纳瑞安的占卜眼镜。",
    Location = "纳瑞安 (塔纳利斯 "..yellow.."65,18"..white..")",
    Note = "掉落自 熔火之心 的首领。",
    Prequest = "斯图沃尔，前任死党",
    Folgequest = "好消息和坏消息 (必须完成 龙语傻瓜教程 和 永远别问我的生意 任务链)",
    Rewards = {
        Text = "奖励：",
        { id = 18253, quantity = 3 }, --Major Rejuvenation Potion Potion
    }
}
for i = 1, 7 do
    kQuestInstanceData.MoltenCore.Horde[i] = kQuestInstanceData.MoltenCore.Alliance[i]
end

--------------- Naxxramas ---------------
kQuestInstanceData.Naxxramas = {
    Story = "漂浮在瘟疫之地上空，被称为纳克萨玛斯的死灵要塞是巫妖王最强大军官之一——可怕的巫妖克尔苏加德——的所在地。当巫妖王的仆从准备进攻时，过去的恐怖和尚未释放的新恐怖正在死灵要塞内聚集。天灾很快将再次行军……",
    Caption = "纳克萨玛斯",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Naxxramas.Alliance[1] = {
    Title = "克尔苏加德的末日",
    Level = 60,
    Attain = 60,
    Aim = "将克尔苏加德的护符匣带往东瘟疫之地圣光之愿礼拜堂。",
    Location = "克尔苏加德 (纳克萨玛斯 "..yellow.."绿色 2"..white..")",
    Note = "英尼戈·蒙托尔神父 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,58"..white..")",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 23206 }, --Mark of the Champion Trinket
        { id = 23207 }, --Mark of the Champion Trinket
    }
}
kQuestInstanceData.Naxxramas.Alliance[2] = {
    Title = "我只会唱这一首歌……",
    Level = 60,
    Attain = 60,
    Aim = "将2个冰冻符文、2个水之精华、2块蓝宝石和30金币交给东瘟疫之地圣光之愿礼拜堂的工匠威尔海姆。",
    Location = "工匠威尔海姆 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,60"..white..")",
    Note = "冰冻符文 来自 纳克萨玛斯 中的 邪恶斧头。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 22700 }, --Glacial Leggings Legs, Cloth
        { id = 22699 }, --Icebane Leggings Legs, Plate
        { id = 22702 }, --Icy Scale Leggings Legs, Mail
        { id = 22701 }, --Polar Leggings Legs, Leather
    }
}
kQuestInstanceData.Naxxramas.Alliance[3] = {
    Title = "战争的回响",
    Level = 60,
    Attain = 60,
    Aim = "东瘟疫之地圣光之愿礼拜堂的指挥官埃里戈尔·黎明使者要你杀死5个畸形妖、5只岩肤石像鬼、8个死亡骑士队长和3只毒性捕猎者。",
    Location = "指挥官埃里戈尔·黎明使者 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."82,58"..white..")",
    Note = "此任务所需的怪物是 纳克萨玛斯 每个区域开始处的小怪。此任务是T3套装任务的前置任务。",
    Prequest = "恐怖之城，纳克萨玛斯",
}
kQuestInstanceData.Naxxramas.Alliance[4] = {
    Title = "拉玛兰迪的命运",
    Level = 60,
    Attain = 60,
    Aim = "进入纳克萨玛斯的宫殿，找到拉玛兰迪的下落。",
    Location = "柯菲斯，圣光勇士 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."82,58"..white..")",
    Note = "此任务的戒指会从 纳克萨玛斯 中的随机怪物身上掉落。所有有此任务的人都可以拾取。",
    Folgequest = "拉玛兰迪的寒冰之握",
}
kQuestInstanceData.Naxxramas.Alliance[5] = {
    Title = "拉玛兰迪的寒冰之握",
    Level = 60,
    Attain = 60,
    Aim = "东瘟疫之地圣光之愿礼拜堂的科尔法克斯要1个冰冻符文、1块蓝宝石和1块奥金锭。",
    Location = "柯菲斯，圣光勇士 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."82,58"..white..")",
    Note = "冰冻符文 来自 纳克萨玛斯 中的 邪恶斧头。",
    Prequest = "拉玛兰迪的命运",
    Rewards = {
        Text = "奖励：",
        { id = 22707 }, --Ramaladni's Icy Grasp Ring
    }
}
for i = 1, 5 do
    kQuestInstanceData.Naxxramas.Horde[i] = kQuestInstanceData.Naxxramas.Alliance[i]
end

--------------- Onyxias Lair ---------------
kQuestInstanceData.OnyxiasLair = {
    Story =    "奥妮克希亚是强大巨龙死亡之翼的女儿，也是黑石塔诡计多端的统治者奈法利安的妹妹。据说奥妮克希亚喜欢通过干涉凡人种族的政治事务来腐化他们。为此，人们相信她会化身为各种类人生物，利用她的魅力和力量影响不同种族之间的微妙事务。有人相信奥妮克希亚甚至采用了她父亲曾用过的化名——普瑞斯托王室的头衔。当不干涉凡人事务时，奥妮克希亚居住在龙沼下方的火焰洞穴中，那是位于尘泥沼泽中的阴郁沼泽。在那里，她受到她的亲族——黑龙军团残余成员的守卫。",
    Caption = "奥妮克希亚的巢穴",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.OnyxiasLair.Alliance[1] = {
    Title = "铸造奎尔塞拉",
    Level = 60,
    Attain = 60,
    Aim = "把黯淡的精灵剑交给博学者莱德罗斯。",
    Location = "博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..white..")",
    Note = "当 奥妮克希亚 的生命值在 10% 到 15% 时，将剑丢在她面前。她必须喷火并加热它。当 奥妮克希亚 死亡时，拾取剑，点击她的尸体并使用剑。然后你就可以交任务了。",
    Prequest = "弗洛尔的屠龙技术纲要 ("..yellow.."厄运之槌 西"..white..") -> 奎尔塞拉的铸造", -- 7507 -> 7508",
    Rewards = {
        Text = "奖励：",
        { id = 18348 }, --Quel'Serrar Main Hand, Sword
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[2] = {
    Title = "唯一的方案",
    Level = 60,
    Attain = 60,
    Aim = "把8章《龙语傻瓜教程》的章节用魔法书封面合起来，然后把完整的《龙语傻瓜教程：第二卷》交给塔纳利斯的纳瑞安。",
    Location = "纳瑞安 (塔纳利斯 "..yellow.."65, 18"..white..   ")".."龙语傻瓜教程 (掉落自 奥妮克希亚 "..yellow.."[3]"..white..")",
    Note = "只有一个人可以拾取章节。龙语傻瓜教程 VI (掉落自 奥妮克希亚 "..yellow.."[3]"..white..")",
    Prequest = "螳螂捕蝉！",
    Folgequest = "好消息和坏消息 (必须完成 斯图沃尔，前任死党 和 永远别问我的生意 任务链)",
    Rewards = {
        Text = "奖励：",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[3] = {
    Title = "联盟的胜利",
    Level = 60,
    Attain = 60,
    Aim = "将奥妮克希亚的头颅交给暴风城的伯瓦尔·弗塔根公爵。",
    Location = "奥妮克希亚的头颅 (掉落自 奥妮克希亚 "..yellow.."[3]"..white..")",
    Note = "伯瓦尔·弗塔根公爵 位于 (暴风城 - 暴风要塞 "..yellow.."78,20"..white..")。团队中只有一个人可以拾取此物品，任务只能完成一次。\n列出的奖励是后续任务的。",
    Folgequest = "英雄庆典",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 18406 }, --Onyxia Blood Talisman Trinket
        { id = 18403 }, --Dragonslayer's Signet Ring
        { id = 18404 }, --Onyxia Tooth Pendant Neck
    }
}
kQuestInstanceData.OnyxiasLair.Horde[1] = kQuestInstanceData.OnyxiasLair.Alliance[1]
kQuestInstanceData.OnyxiasLair.Horde[2] = kQuestInstanceData.OnyxiasLair.Alliance[2]
kQuestInstanceData.OnyxiasLair.Horde[3] = createInheritedQuest(
    kQuestInstanceData.OnyxiasLair.Alliance[3],
    {
        Title = "部落的胜利",
        Aim = "将奥妮克希亚的头颅交给奥格瑞玛的萨尔。",
        Note = "萨尔 位于 (奥格瑞玛 - 精灵谷 "..       yellow..       "31, 37"..       white..       ")。团队中只有一个人可以拾取此物品，任务只能完成一次。\n列出的奖励是后续任务的。",
        Folgequest = "万众敬仰",
    }
)

--------------- Razorfen Downs ---------------
kQuestInstanceData.RazorfenDowns = {
    Story =    "与剃刀沼泽用同样强大的藤蔓建造，剃刀高地是钢鬃种族的传统首都。这座蔓延的、荆棘丛生的迷宫容纳着一支真正的忠诚钢鬃军队以及他们的高级祭司——死亡之头部族。然而最近，一道阴影笼罩在这个简陋的巢穴上。亡灵天灾的代理人——由巫妖寒冰使者阿曼纳领导——已经控制了钢鬃种族，并将荆棘迷宫变成了亡灵力量的堡垒。现在钢鬃正进行着绝望的战斗，试图在阿曼纳将他的控制扩展到整个贫瘠之地之前夺回他们心爱的城市。",
    Caption = "剃刀高地",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenDowns.Alliance[1] = {
    Title = "邪恶之地",
    Level = 35,
    Attain = 28,
    Aim = "杀掉8个剃刀沼泽护卫者、8个剃刀沼泽织棘者和8个亡首教徒，然后向剃刀高地入口处的麦雷姆·月歌复命。",
    Location = "麦雷姆·月歌 (贫瘠之地 "..yellow.."49,94"..white..")",
    Note = "你可以在副本入口前的区域找到怪物和任务给予者。",
}
kQuestInstanceData.RazorfenDowns.Alliance[2] = {
    Title = "封印神像",
    Level = 37,
    Attain = 32,
    Aim = "保护奔尼斯特拉兹来到剃刀高地的野猪人神像处。$B$B当他在进行仪式封印神像时保护他。",
    Location = "奔尼斯特拉兹 (剃刀高地 "..yellow.."[2]"..white..")",
    Note = "前置任务只是你同意帮助他。当 奔尼斯特拉兹 尝试关闭神像时，会刷新几个怪物并攻击他。完成任务后，你可以在神像前的火盆处交任务。",
    Prequest = "剃刀高地的亡灵天灾",
    Rewards = {
        Text = "奖励：",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Alliance[3] = {
    Title = "与圣光同在",
    Level = 42,
    Attain = 39,
    Aim = "大主教本尼迪塔斯要你去杀死剃刀高地的寒冰之王亚门纳尔。",
    Location = "本尼迪塔斯大主教 (暴风城 - 光明大教堂 "..yellow.."39,27"..white..")",
    Note = "寒冰之王亚门纳尔 是 剃刀高地 的最后首领。你可以在 "..yellow.."[6]"..white.." 找到他。",
    Rewards = {
        Text = "奖励：",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[1] = kQuestInstanceData.RazorfenDowns.Alliance[1]
kQuestInstanceData.RazorfenDowns.Horde[2] = {
    Title = "邪恶的盟友",
    Level = 36,
    Attain = 28,
    Aim = "把玛克林大使的头颅交给幽暗城的瓦里玛萨斯。",
    Location = "瓦里玛萨斯 (幽暗城 - 皇家区 "..yellow.."56,92"..white..")",
    Note = "前置任务可以从 剃刀沼泽 的最后首领处获得。你在外面 (贫瘠之地 "..   yellow.."48,92"..white..") 找到 玛克林。",
    Prequest = "邪恶的盟友",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 17039 }, --Skullbreaker Main Hand, Mace
        { id = 17042 }, --Nail Spitter Gun
        { id = 17043 }, --Zealot's Robe Chest, Cloth
    }
}
kQuestInstanceData.RazorfenDowns.Horde[3] = {
    Title = "封印神像",
    Level = 37,
    Attain = 32,
    Aim = "保护奔尼斯特拉兹来到剃刀高地的野猪人神像处。$B$B当他在进行仪式封印神像时保护他。",
    Location = "奔尼斯特拉兹 (剃刀高地 "..yellow.."[2]"..white..")",
    Note = "前置任务只是你同意帮助他。当 奔尼斯特拉兹 尝试关闭神像时，会刷新几个怪物并攻击他。完成任务后，你可以在神像前的火盆处交任务。",
    Prequest = "剃刀高地的亡灵天灾",
    Rewards = {
        Text = "奖励：",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Horde[4] = {
    Title = "寒冰之王",
    Level = 42,
    Attain = 37,
    Aim = "安德鲁·布隆奈尔要你杀了寒冰之王亚门纳尔并将其头骨带回来。",
    Location = "安德鲁·布隆奈尔 (幽暗城 - 魔法区 "..yellow.."72,32"..white..")",
    Note = "寒冰之王亚门纳尔 是 剃刀高地 的最后首领。你可以在 "..yellow.."[6]"..white.." 找到他。",
    Rewards = {
        Text = "奖励：",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[5] = {
    Title = "超越的力量",
    Level = 44,
    Attain = 38,
    Aim = "前往剃刀高地，为吉尔尼斯寂静守卫教堂的黑暗主教莫德伦杀死那里的寒冰之王亚门纳尔，并带回他的魂器。",
    Location = "黑暗主教莫德伦 (吉尔尼斯 - 寂静守卫教堂 "..yellow.."57.7,39.6"..white..")",
    Note = "任务链从 黑暗主教莫德伦 的任务 '借助强大魔法' 开始。\n寒冰使者阿曼纳尔 "..   yellow.."[6]"..white.." 掉落 黑曜石护符匣。\n完成任务链的最后一个任务后你将获得奖励。",
    Prequest = "借助强大魔法 -> 拉文伍德权杖",
    Folgequest = "格雷迈恩之石"..yellow.."[吉尔尼斯城]"..white.."-> 黑暗主教的礼物", -- 40996, 40997",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}

--------------- Razorfen Kraul ---------------
kQuestInstanceData.RazorfenKraul = {
    Story =    "一万年前——在上古之战期间，强大的半神阿迦玛甘挺身而出对抗燃烧军团。尽管这头巨大的野猪倒在了战斗中,他的行动帮助拯救了艾泽拉斯免于毁灭。然而随着时间推移，在他鲜血洒落的地方，巨大的荆棘藤蔓从地下冒出。钢鬃——被认为是强大之神的凡人后代——来到这些区域占据并视之为圣地。这些荆棘殖民地的中心被称为剃刀。剃刀沼泽的大片区域被老巫婆查尔加·剃刀征服。在她的统治下，萨满钢鬃对敌对部落和部落村庄发动攻击。有人推测查尔加甚至一直在与天灾的代理人谈判——为了某种险恶目的将她毫无戒心的部落与亡灵的队伍结盟。",
    Caption = "剃刀沼泽",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenKraul.Alliance[1] = {
    Title = "蓝叶薯",
    Level = 26,
    Attain = 20,
    Aim = "找到一个开孔的箱子。$B找到一根地鼠指挥棒。$B找到并阅读《地鼠指挥手册》。$B$B在剃刀沼泽里用开孔的箱子召唤一只地鼠，然后用指挥棒驱使它去搜寻蓝叶薯。$B$B把地鼠指挥棒、开孔的箱子和6块蓝叶薯交给棘齿城的麦伯克·米希瑞克斯。",
    Location = "麦伯克·米希瑞克斯 (贫瘠之地 - 棘齿城 "..yellow.."62,37"..white..")",
    Note = "箱子、棒子和手册都可以在 麦伯克·米希瑞克斯 附近找到。",
    Rewards = {
        Text = "奖励：",
        { id = 6755 }, --A Small Container of Gems Container
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[2] = {
    Title = "临终遗言",
    Level = 30,
    Attain = 25,
    Aim = "将塔莎拉的坠饰带给达纳苏斯的塔莎拉·静水。",
    Location = "赫拉莎·枯溅 (剃刀沼泽 "..yellow.."[8]"..white..")",
    Note = "坠饰是随机掉落物品。你必须将坠饰带回给 达纳苏斯 - 工匠区 ("..   yellow.."69,67"..white..") 的 塔莎拉·静水。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6751 }, --Mourning Shawl Back
        { id = 6752 }, --Lancer Boots Feet, Leather
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[3] = {
    Title = "进口商威利克斯",
    Level = 30,
    Attain = 23,
    Aim = "护送进口商威利克斯逃出剃刀沼泽。",
    Location = "进口商威利克斯 (剃刀沼泽 "..yellow.."[8]"..white..")",
    Note = "进口商威利克斯 必须被护送到副本入口。完成后向他交任务。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[4] = {
    Title = "沼泽中的巫婆",
    Level = 34,
    Attain = 29,
    Aim = "把卡尔加·刺肋的徽章交给萨兰纳尔的法芬德尔·路卫。",
    Location = "法芬德尔·路卫 (菲拉斯 - 萨兰纳尔 "..yellow.."89,46"..white..")",
    Note = "卡尔加·刺肋 "..yellow.."[7]"..white.." 掉落此任务所需的徽章。",
    Prequest = "亨里格的日记",
    Rewards = {
        Text = "奖励：1 和 2 或 3",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[5] = {
    Title = "弗伦的铠甲",
    Level = 28,
    Attain = 20,
    Aim = "收集必需的材料，将它们交给暴风城的弗伦·长须。",
    Location = "弗伦·长须 (暴风城 - 矮人区 "..yellow.."57,16"..white..")",
    Note = red..   "仅限战士"..white..": 你从鲁古格那里获得燃素 "..yellow.."[1]"..white.."。\n后续任务因种族而异。人类是 燃烧之血，矮人和侏儒是 铁珊瑚，暗夜精灵是 晒焦的蛋壳。", -- 1705, 1710, 1708    Prequest = "铸盾师",
    Folgequest = "(见注释)",
}
kQuestInstanceData.RazorfenKraul.Horde[1] = kQuestInstanceData.RazorfenKraul.Alliance[1]
kQuestInstanceData.RazorfenKraul.Horde[2] = {
    Title = "进口商威利克斯",
    Level = 30,
    Attain = 23,
    Aim = "护送进口商威利克斯逃出剃刀沼泽。",
    Location = "进口商威利克斯 (剃刀沼泽 "..yellow.."[8]"..white..")",
    Note = "进口商威利克斯 必须被护送到副本入口。完成后向他交任务。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Horde[3] = {
    Title = "蝙蝠的粪便",
    Level = 33,
    Attain = 30,
    Aim = "帮幽暗城的大药剂师法拉尼尔带回一堆沼泽蝙蝠的粪便。",
    Location = "大药剂师法拉尼尔 (幽暗城 - 炼金房 "..yellow.."48,69 "..white..")",
    Note = "沼泽蝙蝠的粪便 掉落自副本内的任何蝙蝠。",
    Folgequest = "狂热之心 ("..yellow.."[血色修道院]"..white..")", -- 1113",
}
kQuestInstanceData.RazorfenKraul.Horde[4] = {
    Title = "奥尔德的报复",
    Level = 34,
    Attain = 29,
    Aim = "把卡尔加·刺肋的心脏交给雷霆崖的奥尔德·石塔。",
    Location = "奥尔德·石塔 (雷霆崖 "..yellow.."36,59"..white..")",
    Note = "你可以在 "..yellow.."[7]"..white.." 找到 卡尔加·刺肋。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Horde[5] = {
    Title = "野蛮护甲",
    Level = 30,
    Attain = 20,
    Aim = "为索恩格瑞姆收集15根烟雾铁锭、10份蓝铜粉、10块铁锭和1瓶燃素。",
    Location = "索恩格瑞姆·火眼 (贫瘠之地 "..yellow.."57,30"..white..")",
    Note = red.."仅限武士"..white..": 你从鲁古格那里获得燃素。 "..yellow.."[1]"..white..".\n\n完成此任务后，您可以从同一NPC处开始四个新任务。",
    Prequest = "和索恩格瑞姆交谈",
    Folgequest = "(见注释)",
}
kQuestInstanceData.RazorfenKraul.Horde[6] = {
    Title = "被污染的荆棘之心",
    Level = 30,
    Attain = 20,
    Aim = "摧毁剃刀沼泽深处的自然腐化的活化身，并将被污染的荆棘之心交给雷霆崖的凯姆·蛮鬃。",
    Location = "凯姆·蛮鬃 (雷霆崖 - The 长者高地 "..yellow.."77,29"..white..")",
    Note = "被污染的荆棘之心 掉落自 罗特索恩，位于 "..yellow.."[5]"..white..".",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 41854 }, --Wildbranch Leggings, Cloth
        { id = 41855 }, --Fenweave Gloves, Mail
    }
}

--------------- SM: library ---------------
kQuestInstanceData.ScarletMonasteryLibrary = {
    Story =
    "修道院曾是洛丹伦神职人员的骄傲堡垒——学习和启蒙的中心。随着第三次战争期间亡灵天灾的崛起，和平的修道院被转变为狂热的血色十字军的据点。十字军对所有非人类种族不容忍，无论其联盟或从属关系如何。他们相信任何和所有外来者都是亡灵瘟疫的潜在携带者——必须被消灭。报告显示进入修道院的冒险者被迫与血色指挥官莫格莱尼对抗——他指挥着一个狂热忠诚战士的大驻军。然而，修道院真正的主人是大检察官怀特迈恩——一位可怕的女祭司，拥有复活倒下的战士为她战斗的能力。",
    Caption = "血色修道院: 图书馆",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1] = {
    Title = "以圣光之名",
    Level = 40,
    Attain = 34,
    Aim = "杀死大检察官怀特迈恩，血色十字军指挥官莫格莱尼，十字军的勇士赫洛德和驯犬者洛克希并向南海镇的莱雷恩复命。",
    Location = "虔诚的莱雷恩 (希尔斯布莱德丘陵 - 南海镇 "..yellow.."51,58"..white..")",
    Note = "此任务链开始于 暴风城 - 光明大教堂 ("..yellow.."42,24"..white..") 的 克罗雷修士 的任务 '安东修士'。\n你可以在 "..yellow.."血色修道院: 大教堂 [2]"..   white.." 找到 大检察官怀特迈恩 和 血色十字军指挥官莫格莱尼，在 "..yellow..   "血色修道院: 军械库 [1]"..white.." 找到 赫洛德，在 "..yellow.."血色修道院: 图书馆 [1]"..white.." 找到 驯犬者洛克希。",
    Prequest = "安东修士 -> 血色之路",
    Rewards = {
        Text = "奖励：",
        { id = 6829 },  --Sword of Serenity One-Hand, Sword
        { id = 6830 },  --Bonebiter Two-Hand, Axe
        { id = 6831 },  --Black Menace One-Hand, Dagger
        { id = 11262 }, --Orb of Lorica Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[2] = {
    Title = "泰坦神话",
    Level = 38,
    Attain = 28,
    Aim = "从修道院拿回《泰坦神话》，把它交给铁炉堡的图书馆员麦伊·苍尘。",
    Location = "图书馆员麦伊·苍尘 (铁炉堡 - 探险者大厅 "..yellow.."74,12"..white..")",
    Note = "这本书在通往 秘法师杜安 ("..   yellow.."[2]"..white..") 的走廊之一的左侧地板上。",
    Rewards = {
        Text = "奖励：",
        { id = 7746 }, --Explorers' League Commendation Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[3] = {
    Title = "能量仪祭",
    Level = 40,
    Attain = 30,
    Aim = "将《能量仪祭》交给尘泥沼泽的塔贝萨。",
    Location = "塔贝萨 (尘泥沼泽 "..yellow.."43,57"..white..")",
    Note = red..   "仅限法师"..white..": 你可以在通往 秘法师杜安 ("..yellow.."[2]"..   white..") 的最后一条走廊里找到这本书。",
    Prequest = "解封咒语",
    Folgequest = "法师的魔杖",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[1] = {
    Title = "狂热之心",
    Level = 33,
    Attain = 30,
    Aim = "幽暗城的大药剂师法拉尼尔需要20颗狂热之心。",
    Location = "大药剂师法拉尼尔 (幽暗城 - 炼金房 "..yellow.."48,69"..white..")",
    Note = "血色修道院 中的所有怪物都会掉落 狂热之心。",
    Prequest = "蝙蝠的粪便 ("..yellow.."[剃刀沼泽]"..white..")", -- 1109",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[2] = {
    Title = "深入血色修道院",
    Level = 42,
    Attain = 33,
    Aim = "杀掉大检察官怀特迈恩、血色十字军指挥官莫格莱尼、血色十字军勇士赫洛德和驯犬者洛克希，然后向幽暗城的瓦里玛萨斯回报。",
    Location = "瓦里玛萨斯 (幽暗城 - 皇家区 "..yellow.."56,92"..white..")",
    Note = "你可以在 "..yellow.."血色修道院: 大教堂 [2]"..   white.." 找到 大检察官怀特迈恩 和 血色十字军指挥官莫格莱尼，在 "..yellow..
        "血色修道院: 军械库 [1]"..white.." 找到 赫洛德，在 "..yellow.."血色修道院: 图书馆 [1]"..white.." 找到 驯犬者洛克希。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6802 },  --Sword of Omen One-Hand, Sword
        { id = 6803 },  --Prophetic Cane Held In Off-hand
        { id = 10711 }, --Dragon's Blood Necklace Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[3] = {
    Title = "堕落者纲要",
    Level = 38,
    Attain = 28,
    Aim = "从血色修道院里找到《堕落者纲要》，把它交给雷霆崖的圣者图希克。",
    Location = "圣者图希克 (雷霆崖 "..yellow.."34,47"..white..")",
    Note = "你可以在 血色修道院 的 图书馆 区域找到这本书。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 7747 },  --Vile Protector Shield
        { id = 17508 }, --Forcestone Buckler Shield
        { id = 7749 },  --Omega Orb Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[4] = {
    Title = "知识的试炼",
    Level = 36,
    Attain = 25,
    Aim = "找到连接石爪山和灰谷的石爪小径里的布劳格·幽魂。",
    Location = "帕科瓦·芬塔拉斯 (幽暗城 - 炼金房 "..yellow.."57,65"..white..")",
    Note = "任务链开始于 多恩·平原行者 的任务 '信仰的试炼' (千针石林 "..   yellow.."53,41"..white..")。你可以在 血色修道院 的 图书馆 找到这本书。",
    Prequest = "信仰的试炼 -> 知识的试炼",
    Folgequest = "知识的试炼",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[5] = {
    Title = "能量仪祭",
    Level = 40,
    Attain = 30,
    Aim = "将《能量仪祭》交给尘泥沼泽的塔贝萨。",
    Location = "塔贝萨 (尘泥沼泽 "..yellow.."43,57"..white..")",
    Note = red..   "仅限法师"..   white..": 你可以在通往 秘法师杜安 ("..yellow.."[2]"..white..") 的最后一条走廊里找到这本书。",
    Prequest = "解封咒语",
    Folgequest = "法师的魔杖",
}

--------------- SM: Armory ---------------
kQuestInstanceData.ScarletMonasteryArmory = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "血色修道院: 武器库",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryArmory.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[2] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[2]
kQuestInstanceData.ScarletMonasteryArmory.Horde[3] = {
    Title = "往日之钢",
    Level = 39,
    Attain = 33,
    Aim = "杀死军械库军需官达格海姆并将日记还给幽暗城的巴兹尔·弗莱伊。",
    Location = "巴兹尔·弗莱伊 (幽暗城 "..yellow.."60, 29"..white..")",
    Note = "掉落自 军械库军需官达格海姆 [2].",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 7964 }, --Solid Sharpening Stone Enchant
        { id = 7965 }, --Solid Weightstone Enchant
    }
}

--------------- SM: Cathedral ---------------
kQuestInstanceData.ScarletMonasteryCathedral = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "血色修道院: 教堂",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[2] = {
    Title = "卡拉杜斯的宝珠",
    Level = 38,
    Attain = 30,
    Aim = "冒险进入血色修道院，找到卡拉杜斯的宝珠，取回它，然后交给悲伤卫士要塞的守望圣骑加纳苏斯。",
    Location = "守望圣骑加纳苏斯 (悲伤沼泽 - 悲伤卫士要塞 "..yellow.."2,51"..white..")",
    Note = "陈旧的木箱 包含此物品。你可以在 "..   yellow.."[2]"..white.." 左侧的第二个房间里找到 卡拉杜斯的宝珠。",
    Prequest = "过去的故事 -> 遗忘之书 -> 回复加纳苏斯",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60316 }, --Truthkeeper Mantle Shoulder, Plate
        { id = 60317 }, --Lightgraced Mallet Main Hand, Mace
        { id = 60318 }, --Sorrowguard Clutch Waist, Leather
    }
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[3] = {
    Title = "血色的堕落",
    Level = 44,
    Attain = 35,
    Aim = "为沙德摩尔旅店的修士埃利亚斯寻找法尔班克斯的真相",
    Location = "修士埃利亚斯 <血色十字军使者> (吉尔尼斯 - 格雷郡遗址 - 沙德摩尔旅店 "..   yellow.."[33.6,54.1]"..white..", 二楼。)",
    Note = "对抗亡灵的盟友 开始于同一个 NPC。",
    Prequest = "对抗亡灵的盟友",
    Rewards = {
        Text = "奖励：",
        { id = 61478 }, --Ring of Holy Sacrement Ring
    }
}
kQuestInstanceData.ScarletMonasteryCathedral.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryCathedral.Horde[2] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[2]

--------------- SM: Graveyard ---------------
kQuestInstanceData.ScarletMonasteryGraveyard = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "血色修道院: 墓地",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[2] = {
    Title = "沃瑞尔的复仇",
    Level = 33,
    Attain = 25,
    Aim = "把沃瑞尔·森加斯的结婚戒指还给塔伦米尔的莫尼卡·森古特斯。",
    Location = "沃瑞尔·森加斯 (血色修道院 - 墓地 "..yellow.."[1]"..white..")",
    Note = "你可以在血色修道院的墓地区域入口处找到沃瑞尔·森加斯。南希·韦沙斯，她会掉落完成此任务所需的戒指，可以在奥特兰克山脉的一所房子里找到（"..yellow.."31,32"..white.."）。",
    Rewards = {
        Text = "奖励：1 和 2 或 3",
        { id = 7751 }, --Vorrel's Boots Feet, Leather
        { id = 7750 }, --Mantle of Woe Shoulder, Cloth
        { id = 4643 }, --Grimsteel Cape Back
    }
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[3] = {
    Title = "染红玫瑰",
    Level = 29,
    Attain = 27,
    Aim = "攻击血色修道院外的血色军队，杀死5个血色斥候、5个血色医师、10个血色哨兵，然后与布瑞尔的亡灵卫兵伯吉斯交谈。",
    Location = "亡灵卫兵伯吉斯 (提瑞斯法林地 - 布瑞尔 "..yellow.."61,52"..white..")",
    Note = "你可以在外面完成此任务。\n任务链开始于 幽暗城 的 旅店老板诺曼 <旅店老板> 的任务 '血色之怒'。",
    Prequest = "血色之怒",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 51832 }, --Nathrezim Wedge Main Hand, Axe
        { id = 51833 }, --Femur Staff Staff
        { id = 51834 }, --Scarlet Pillar Two-Hand, Mace
    }
}

--------------- Scholomance ---------------
kQuestInstanceData.Scholomance = {
    Story =
    "通灵学院坐落在凯尔达隆废墟要塞下的一系列地穴中。凯尔达隆曾由高贵的巴罗夫家族拥有，在第二次战争后沦为废墟。当巫师克尔苏加德为他的诅咒教派招募追随者时，他经常承诺不朽以换取为他的巫妖王服务。巴罗夫家族屈服于克尔苏加德的魅力影响，将要塞及其地穴捐赠给了天灾。邪教徒随后杀死了巴罗夫一家，并将古老的地穴变成了被称为通灵学院的死灵法术学校。尽管克尔苏加德不再居住在地穴中，忠诚的邪教徒和导师仍然留在那里。强大的巫妖拉斯·霜语统治着这个地方并以天灾的名义守卫它——而凡人死灵法师，黑暗院长加丁，则担任学校阴险的校长。",
    Caption = "通灵学院",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Scholomance.Alliance[1] = {
    Title = "瘟疫之龙",
    Level = 58,
    Attain = 55,
    Aim = "杀掉20只瘟疫龙崽，然后向圣光之愿礼拜堂的贝蒂娜·比格辛克复命。",
    Location = "贝蒂娜·比格辛克 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,59"..white..")",
    Note = "瘟疫之龙 在 血骨傀儡 的 大房间 中。",
    Folgequest = "健康的龙鳞",
}
kQuestInstanceData.Scholomance.Alliance[2] = {
    Title = "健康的龙鳞",
    Level = 58,
    Attain = 55,
    Aim = "把健康的龙鳞交给东瘟疫之地圣光之愿礼拜堂中的贝蒂娜·比格辛克。",
    Location = "健康的龙鳞 (随机掉落自瘟疫之龙)",
    Note = "瘟疫之龙掉落健康的龙鳞（8%几率掉落）。你可以在东瘟疫之地 - 圣光之愿礼拜堂（"..yellow.."81,59"..white.."）找到贝蒂娜·比格辛克。",
    Prequest = "瘟疫之龙",
}
kQuestInstanceData.Scholomance.Alliance[3] = {
    Title = "瑟尔林·卡斯迪诺夫教授",
    Level = 60,
    Attain = 55,
    Aim = "在通灵学院中找到瑟尔林·卡斯迪诺夫教授。杀死他，并烧毁艾瓦·萨克霍夫和卢森·萨克霍夫的遗体。任务完成后就回到艾瓦·萨克霍夫那儿。",
    Location = "艾瓦·萨克霍夫 (西瘟疫之地 - 凯尔达隆 "..yellow.."70,73"..white..")",
    Note = "你可以在 "..yellow.."[9]"..white.." 找到 瑟尔林·卡斯迪诺夫教授，以及 艾瓦·萨克霍夫 和 卢森·萨克霍夫 的遗体。",
    Folgequest = "卡斯迪诺夫的恐惧袋",
}
kQuestInstanceData.Scholomance.Alliance[4] = {
    Title = "卡斯迪诺夫的恐惧袋",
    Level = 60,
    Attain = 55,
    Aim = "把卡斯迪诺夫的恐惧袋带给艾瓦·萨克霍夫。",
    Location = "卡斯迪诺夫的恐惧袋 (随机掉落自瑟尔林·卡斯迪诺夫教授)",
    Note = "你可以在 "..yellow.."[3]"..white.." 找到 詹迪斯·巴罗夫。",
    Prequest = "瑟尔林·卡斯迪诺夫教授",
    Folgequest = "传令官基尔图诺斯",
}
kQuestInstanceData.Scholomance.Alliance[5] = {
    Title = "传令官基尔图诺斯",
    Level = 60,
    Attain = 55,
    Aim = "带着无辜者之血回到通灵学院，将它放在门廊的火盆下面，基尔图诺斯会前来吞噬你的灵魂。$B$B勇敢地战斗吧，不要退缩！杀死基尔图诺斯，然后回到艾瓦·萨克霍夫那儿。",
    Location = "艾瓦·萨克霍夫 (西瘟疫之地 - 凯尔达隆 "..yellow.."70,73"..white..")",
    Note = "门廊在 "..yellow.."[2]"..white.."。",
    Prequest = "卡斯迪诺夫的恐惧袋",
    Folgequest = "莱斯·霜语",
    Rewards = {
        Text = "奖励：1 和 2 或 3",
        { id = 13544 }, --Spectral Essence Trinket
        { id = 15805 }, --Penelope's Rose Held In Off-hand
        { id = 15806 }, --Mirah's Song One-Hand, Sword
    }
}
kQuestInstanceData.Scholomance.Alliance[6] = {
    Title = "巫妖莱斯·霜语",
    Level = 60,
    Attain = 57,
    Aim = "在通灵学院里找到莱斯·霜语。当你找到他之后，使用禁锢灵魂的遗物破除其亡灵的外壳。如果你成功地破除了他的不死之身，就杀掉他并拿到莱斯·霜语的头颅。把那个头颅交给马杜克镇长。",
    Location = "马杜克镇长 (西瘟疫之地 - 凯尔达隆 "..yellow.."70,73"..white..")",
    Note = "你可以在 "..yellow.."[7]"..white.." 找到 莱斯·霜语。",
    Prequest = "莱斯·霜语 -> 禁锢灵魂的遗物",
    Rewards = {
        Text = "奖励：1 和 2 或 3 或 4",
        { id = 14002 }, --Darrowshire Strongguard Shield
        { id = 13982 }, --Warblade of Caer Darrow Two-Hand, Sword
        { id = 13986 }, --Crown of Caer Darrow Head, Cloth
        { id = 13984 }, --Darrowspike One-Hand, Dagger
    }
}
kQuestInstanceData.Scholomance.Alliance[7] = {
    Title = "巴罗夫家族的宝藏",
    Level = 60,
    Attain = 52,
    Aim = "到通灵学院中去取得巴罗夫家族的宝藏。这份宝藏包括四份地契：凯尔达隆地契、布瑞尔地契、塔伦米尔地契，还有南海镇地契。完成任务之后就回到阿莱克斯·巴罗夫那儿去。",
    Location = "维尔顿·巴罗夫 (西瘟疫之地 - 寒风营地 "..yellow.."43,83"..white..")",
    Note = "你可以在 "..yellow.."[12]"..white.." 找到 凯尔达隆地契，在 "..   yellow.."[7]"..white.." 找到 布瑞尔地契，在 "..   yellow.."[4]"..white.." 找到 塔伦米尔地契，在 "..yellow.."[1]"..white.." 找到 南海镇地契。",
    Folgequest = "最后的巴罗夫",
}
kQuestInstanceData.Scholomance.Alliance[8] = {
    Title = "黎明先锋",
    Level = 60,
    Attain = 57,
    Aim = "将黎明先锋放在通灵学院的观察室里。打败维克图斯，然后回到贝蒂娜·比格辛克那里去。",
    Location = "贝蒂娜·比格辛克 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,59"..white..")",
    Note = "雏龙精华 开始于 丁奇·斯迪波尔 (燃烧平原 - 烈焰峰 "..   yellow.."65,23"..white..")。观察室位于 "..yellow.."[6]"..white.."。",
    Prequest = "雏龙精华 -> 贝蒂娜·比格辛克",
    Rewards = {
        Text = "奖励：",
        { id = 15853 }, --Windreaper One-Hand, Axe
        { id = 15854 }, --Dancing Sliver Staff
    }
}
kQuestInstanceData.Scholomance.Alliance[9] = {
    Title = "瓶中的小鬼",
    Level = 60,
    Attain = 60,
    Aim = "把瓶中的小鬼带到通灵学院的炼金实验室中。在小鬼制造出羊皮纸之后，把瓶子还给戈瑟奇·邪眼。",
    Location = "戈瑟奇·邪眼 (燃烧平原 "..yellow.."12,31"..white..")",
    Note = red.."此任务仅限术士完成。"..white..": 你可以在 "..yellow.."[7]"..white.." 找到炼金实验室。",
    Prequest = "莫苏尔·召血者 -> 克索诺斯星尘",
    Folgequest = "克索诺斯恐惧战马 ("..yellow.."厄运之槌 西"..white..")", -- 7631",
}
kQuestInstanceData.Scholomance.Alliance[10] = {
    Title = "瓦萨拉克护符的左半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆来召唤莫尔·灰蹄的灵魂并杀了他。带着瓦萨拉克护符的左半块和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你可以从 '寻找安泰恩' 任务中获得它。\n\n考尔马克 在 "..   yellow.."[7]"..white.." 被召唤。",
    Prequest = "重要的材料",
    Folgequest = "奥卡兹岛在你前方……",
}
kQuestInstanceData.Scholomance.Alliance[11] = {
    Title = "瓦萨拉克护符的右半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆召唤莫尔·灰蹄的灵魂并杀了他。带着重新组合的瓦萨拉克护符和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你可以从 '寻找安泰恩' 任务中获得它。\n\n考尔马克 在 "..   yellow.."[7]"..white.." 被召唤。",
    Prequest = "更多重要的材料",
    Folgequest = "最后的准备 ("..yellow.."黑石塔上层"..white..")", -- 8994",
}
kQuestInstanceData.Scholomance.Alliance[12] = {
    Title = "帮法杉的忙。",
    Level = 58,
    Attain = 55,
    Aim = "冒险进入通灵学院，为棘齿城的斯坦哈德·法杉找回《召炎控制术》一书。",
    Location = "斯坦哈德·法杉 (贫瘠之地 - 棘齿城 "..yellow.."62.6,35.5"..white..")",
    Note = "任务链开始于 工匠威尔海姆 (东瘟疫之地 - 圣光之愿礼拜堂) 的任务 '一个新的符文边界'。\n!!! 完成任务链的最后一个任务后你将获得此奖励。",
    Prequest = "一个新的符文边界 -> 黑暗锻造的秘密 -> 黑暗锻造的秘密",
    Folgequest = "与恐惧魔王的会面",
    Rewards = {
        Text = "奖励：",
        { id = 81060 }, --Tempered Runeblade Two-Hand, Sword
    }
}
for i = 1, 12 do
    if i ~= 7 then
        kQuestInstanceData.Scholomance.Horde[i] = kQuestInstanceData.Scholomance.Alliance[i]
    end
end
kQuestInstanceData.Scholomance.Horde[7] = createInheritedQuest(
    kQuestInstanceData.Scholomance.Alliance[7],
    {
        Aim = "冒险进入通灵学院，为棘齿城的斯坦哈德·法杉找回《召炎控制术》一书。",
        Location = "阿莱克斯·巴罗夫 (提瑞斯法林地 - 亡灵壁垒 "..yellow.."80,73"..white..")",
    }
)

--------------- Shadowfang Keep ---------------
kQuestInstanceData.ShadowfangKeep = {
    Story =
    "在第三次战争期间，肯瑞托的巫师与天灾的亡灵军队作战。当达拉然的巫师在战斗中死去时，他们很快就会复活——将他们以前的力量加入不断壮大的天灾。由于缺乏进展感到沮丧（并违背同行的建议），大法师阿鲁高选择召唤超维度实体来增援达拉然日渐减少的队伍。阿鲁高的召唤将贪婪的狼人带入了艾泽拉斯世界。野蛮的狼人不仅屠杀了天灾，而且很快转向巫师们自己。狼人围攻了高贵的银莱恩男爵的要塞。位于派尔伍德小村庄之上，要塞很快陷入黑暗和废墟。被内疚逼疯，阿鲁高收养了狼人作为他的孩子，并撤退到新命名的'影牙城堡'。据说他仍然住在那里，受到他巨大的宠物芬鲁斯的保护——并被银莱恩男爵复仇的幽灵所困扰。",
    Caption = "影牙城堡",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ShadowfangKeep.Alliance[1] = {
    Title = "正义试炼",
    Level = 22,
    Attain = 20,
    Aim = "去和铁炉堡的乔丹·斯迪威尔谈一谈。",
    Location = "乔丹·斯迪威尔 (丹莫罗 - 铁炉堡入口 "..yellow.."52,36"..white..")",
    Note = red.."圣骑士专用"..white..": 要查看注释，请点击  "..yellow.."[正义试炼 信息]"..white..".",
    Prequest = "勇气之书 -> 正义试炼",
    Folgequest = "正义试炼",
    Rewards = {
        Text = "奖励：",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = kQuestInstanceData.TheDeadmines.Alliance[6].Page
}
kQuestInstanceData.ShadowfangKeep.Alliance[2] = {
    Title = "索兰鲁克宝珠",
    Level = 25,
    Attain = 20,
    Aim = "找到3块索兰鲁克宝珠的碎片和1块索兰鲁克宝珠的大碎片，把它们交给贫瘠之地的杜安·卡汉。",
    Location = "杜安·卡汉 (贫瘠之地 "..yellow.."49,57"..white..")",
    Note = red..   "此任务仅限术士完成。"..white..": 你从 "..   yellow.."[黑暗深渊]"..   white.." 的 黑暗深渊侍僧 那里获得 3块 索兰鲁克碎片。你从 "..yellow.."[影牙城堡]"..white.." 的 影牙黑暗之魂 那里获得 索兰鲁克宝珠的大碎片。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6898 },  --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[3] = {
    Title = "阿鲁高的愚行",
    Level = 27,
    Attain = 22,
    Location = "高阶巫师安多玛斯 (暴风城 - 法师区, 法师塔)",
    Note = "高阶巫师安多玛斯 派你去杀死 大法师阿鲁高 "..   yellow.."[12]"..white..". 完成后向他复命。",
    Rewards = {
        Text = "奖励：",
        { id = 51805 }, --Signet of Arugal Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[4] = {
    Title = "失踪的巫师",
    Level = 24,
    Attain = 22,
    Aim = "高阶巫师安多玛斯要求你在银松森林的影牙城堡找到巫师阿克鲁比的踪迹。",
    Location = "高阶巫师安多玛斯 (暴风城 - 法师区, 法师塔)",
    Note = "巫师阿克鲁比 在笼子里 "..yellow.."[1]"..white..".",
}
kQuestInstanceData.ShadowfangKeep.Alliance[5] = {
    Title = "沃根多尔之血",
    Level = 60,
    Attain = 60,
    Aim = "为范达尔·鹿盔收集狼人血液。他需要来自卡拉赞、吉尔尼斯城和影牙城堡的血液样本。",
    Location = "大德鲁伊范达尔·鹿盔 (达纳苏斯 - 塞纳里奥区 "..yellow.."35,9"..white..").",
    Note = "[影牙之血] 掉落自 狼人。"..white.."\n[女神的镰刀] 前置任务开始于 艾露恩的镰刀 掉落自 布莱克伍德公爵 II "..yellow.."(卡拉赞下层大厅 [5])。",
    Prequest = "女神的镰刀",
    Folgequest = "狼血",
}
kQuestInstanceData.ShadowfangKeep.Horde[1] = {
    Title = "影牙城堡里的亡灵哨兵",
    Level = 25,
    Attain = 18,
    Aim = "找到亡灵哨兵阿达曼特和亡灵哨兵文森特。",
    Location = "高级执行官哈德瑞克 (银松森林 - 瑟伯切尔 "..yellow.."43,40"..white..")",
    Note = "你可以在 "..yellow.."[1]"..   white.." 找到 亡灵哨兵阿达曼特。当你进入庭院时，亡灵哨兵文森特 位于右侧 "..yellow.."[2]"..white..".",
    Rewards = {
        Text = "奖励：",
        { id = 3324 }, --Ghostly Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[2] = {
    Title = "乌尔之书",
    Level = 26,
    Attain = 16,
    Aim = "把乌尔之书交给幽暗城炼金区里的看守者贝尔杜加。",
    Location = "看守者贝尔杜加 (幽暗城 - 炼金房 "..yellow.."53,54"..white..")",
    Note = "当你进入房间时，你可以在左侧的 "..yellow.."[8]"..white.." 找到这本书。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6335 }, --Grizzled Boots Feet, Leather
        { id = 4534 }, --Steel-clasped Bracers Wrist, Mail
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[3] = {
    Title = "除掉阿鲁高",
    Level = 27,
    Attain = 18,
    Aim = "杀死阿鲁高，把他的头带给瑟伯切尔的达拉尔·道恩维沃尔。",
    Location = "达拉尔·道恩维沃尔 (银松森林 - 瑟伯切尔 "..yellow.."44,39"..white..")",
    Note = "你可以在 "..yellow.."[12]"..white.." 找到 大法师阿鲁高。",
    Rewards = {
        Text = "奖励：",
        { id = 6414 }, --Seal of Sylvanas Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[4] = {
    Title = "索兰鲁克宝珠",
    Level = 25,
    Attain = 20,
    Aim = "找到3块索兰鲁克宝珠的碎片和1块索兰鲁克宝珠的大碎片，把它们交给贫瘠之地的杜安·卡汉。",
    Location = "杜安·卡汉 (贫瘠之地 "..yellow.."49,57"..white..")",
    Note = red..   "此任务仅限术士完成。"..white..": 你从 "..   yellow.."[黑暗深渊]"..   white.." 的 黑暗深渊侍僧 那里获得 3块 索兰鲁克碎片。你从 "..yellow.."[影牙城堡]"..white.." 的 影牙黑暗之魂 那里获得 索兰鲁克宝珠的大碎片。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[5] = {
    Title = "虎口拔牙",
    Level = 25,
    Attain = 15,
    Aim = "在影牙城堡中找到迈雷纳斯的财产，并将其交给幽暗城中的皮尔斯·沙克尔顿。",
    Location = "皮尔斯·沙克尔顿 (幽暗城 - 魔法区 "..yellow.."85.4,13.6"..white..")",
    Note = "你可以在 "..yellow.."[12]"..white.." 找到 迈雷纳斯的财产，它是位于左侧两个书架之间地板上的一个盒子。\n任务链开始于 纳格拉斯公爵 (提瑞斯法林地 - 格伦郡, 提瑞斯法林地 西部)。\n完成下一个任务后你将获得任务奖励。",
    Prequest = "达尔索斯遗产 -> 不同类型的锁 -> 魔法之道",
    Folgequest = "达尔索斯遗产",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60392 }, --Sword of Laneron Two-Hand, Sword
        { id = 60393 }, --Shield of Mathela Shield
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[6] = {
    Title = "主教末路",
    Level = 22,
    Attain = 16,
    Aim = "杀死艾隆迈恩主教并向格伦郡的布莱特科普夫神父报告。",
    Location = "布莱特科普夫神父 (格伦郡 "..yellow.."20.8, 68.7"..white..")",
    Note = "你需要击杀 艾隆迈恩主教 [13]。\n任务链开始于 亡灵哨兵博迪瑞格 (银松森林 - 瑟伯切尔 "..   yellow.."43, 42"..white..")",
    Prequest = "守护不死者 -> 帮助布莱特科普夫",
    Rewards = {
        Text = "奖励：",
        { id = 70225 }, --Necklace of Redemption Neck
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[7] = {
    Title = "狼、巫婆与镰刀",
    Level = 60,
    Attain = 60,
    Aim = "为玛加萨·恐怖图腾收集狼人血液。她需要来自卡拉赞、吉尔尼斯城和影牙城堡的血液样本。",
    Location = "玛加萨·恐怖图腾 (雷霆崖 - The 长者高地 "..yellow.."70,31"..white..").",
    Note = "[影牙之血] 掉落自 狼人."..white.."\n[女神的镰刀] 前置任务开始于艾露恩的镰刀 掉落自 布莱克伍德公爵 II "..yellow.."(下层卡拉赞大厅 [5]).",
    Prequest = "女神的镰刀",
    Folgequest = "狼血",
}

--------------- Stratholme ---------------
kQuestInstanceData.Stratholme = {
    Story =    "曾是洛丹伦北部的明珠，斯坦索姆是阿尔萨斯王子背叛他的导师乌瑟尔·光明使者，并屠杀数百名被认为感染了可怕的亡灵瘟疫的臣民的地方。阿尔萨斯的向下螺旋和最终向巫妖王投降紧随其后。这座破碎的城市现在由亡灵天灾占据——由强大的巫妖克尔苏加德领导。一支由大十字军达索汉领导的血色十字军部队也占据着被蹂躏城市的一部分。双方陷入持续的暴力战斗。那些足够勇敢（或愚蠢）进入斯坦索姆的冒险者不久就会被迫与两个派系对抗。据说这座城市由三座巨大的瞭望塔守卫，还有强大的死灵法师、女妖和憎恶。也有报告称一位邪恶的死亡骑士骑着邪恶的骏马——对所有冒险进入天灾领域的人施加无差别的愤怒。",
    Caption = "斯坦索姆",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Stratholme.Alliance[1] = {
    Title = "血肉不会撒谎",
    Level = 60,
    Attain = 55,
    Aim = "从斯坦索姆找回20个瘟疫肉块，并把它们交给贝蒂娜·比格辛克。你觉得斯坦索姆中所有生物的肉大概都带点瘟疫……",
    Location = "贝蒂娜·比格辛克 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,59"..white..")",
    Note = "斯坦索姆 中的大多数怪物都会掉落 瘟疫肉块。",
    Folgequest = "活跃的探子",
}
kQuestInstanceData.Stratholme.Alliance[2] = {
    Title = "活跃的探子",
    Level = 60,
    Attain = 55,
    Aim = "到斯坦索姆去探索那里的通灵塔。找到新的天灾军团档案，把它交给贝蒂娜·比格辛克。",
    Location = "贝蒂娜·比格辛克 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,59"..white..")",
    Note = "天灾军团档案 位于 3座通灵塔之一，你可以在 "..   yellow.."[15]"..white..", "..yellow.."[16]"..white.." 和 "..yellow.."[17]"..white.." 附近找到。",
    Prequest = "血肉不会撒谎",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 13209 }, --Seal of the Dawn Trinket
        { id = 19812 }, --Rune of the Dawn Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[3] = {
    Title = "神圣之屋",
    Level = 60,
    Attain = 55,
    Aim = "到北方的斯坦索姆去，寻找散落在城市中的补给箱，并收集5瓶斯坦索姆圣水。当你找到足够的圣水之后就回去向尊敬的莱尼德·巴萨罗梅复命。",
    Location = "尊敬的莱尼德·巴萨罗梅 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."80,58"..white..")",
    Note = "圣水可以在斯坦索姆各处的箱子里找到。但如果你打开箱子，可能会出现虫子并攻击你。",
    Rewards = {
        Text = "奖励：1 和 2 和 3 或 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 13216 },              --Crown of the Penitent Head, Cloth
        { id = 13217 },              --Band of the Penitent Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[4] = {
    Title = "哈尔里克·恩伯兰",
    Level = 60,
    Attain = 55,
    Aim = "找到哈尔里克·恩伯兰在斯坦索姆的烟草店，并从中找回一盒希亚比的烟草，把它交给烟鬼拉鲁恩。",
    Location = "烟鬼拉鲁恩 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."80,58"..white..")",
    Note = "你可以在 "..yellow.."[1]"..white.." 附近找到烟草店。当你打开盒子时，弗拉斯·希亚比 会出现。",
    Rewards = {
        Text = "奖励：",
        { id = 13171 }, --Smokey's Lighter Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[5] = {
    Title = "永不安息的灵魂",
    Level = 60,
    Attain = 55,
    Aim = "找到埃根。你只知道他在斯坦索姆附近。",
    Location = "埃根 (东瘟疫之地 "..yellow.."14,33"..white..")",
    Note = "你从 护理者奥林 (东瘟疫之地 - 圣光之愿礼拜堂 "..   yellow.."79,63"..white..") 那里获得前置任务。幽灵市民在整个 斯坦索姆 游荡。",
    Prequest = "永不安息的灵魂",
    Rewards = {
        Text = "奖励：",
        { id = 13315 }, --Testament of Hope Held In Off-hand
    }
}
kQuestInstanceData.Stratholme.Alliance[6] = {
    Title = "爱与家庭",
    Level = 60,
    Attain = 52,
    Aim = "到凯尔达隆岛去，寻找关于那副画的线索。凯尔达隆岛在瘟疫之地南部的湖中央。",
    Location = "画家瑞弗蕾 (西瘟疫之地 - 凯尔达隆 "..yellow.."65,75"..white..")",
    Note = "你从 提里奥·弗丁 (西瘟疫之地 "..   yellow.."7,43"..white..") 那里获得前置任务。你可以在 "..yellow.."[10]"..white.." 附近找到这幅画。",
    Prequest = "救赎 -> 爱与家庭",
    Folgequest = "寻找麦兰达",
}
kQuestInstanceData.Stratholme.Alliance[7] = {
    Title = "米奈希尔的礼物",
    Level = 60,
    Attain = 57,
    Aim = "到斯坦索姆城里去找到米奈希尔的礼物，把巫妖生前的遗物放在那块邪恶的土地上。",
    Location = "尊敬的莱尼德·巴萨罗梅 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."80,58"..white..")",
    Note = "你从 马杜克镇长 (西瘟疫之地 - 凯尔达隆 "..yellow.."70,73"..white..") 那里获得前置任务。你可以在 "..yellow..   "[19]"..white.." 附近找到标志。另见: 通灵学院 中的 "..yellow.."[巫妖, 莱斯·霜语]"..white.."。",
    Prequest = "人类拉斯·霜语 -> 亡灵莱斯·霜语",
    Folgequest = "米奈希尔的礼物",
}
kQuestInstanceData.Stratholme.Alliance[8] = {
    Title = "奥里克斯的清算",
    Level = 60,
    Attain = 55,
    Aim = "杀死男爵。",
    Location = "奥里克斯 (斯坦索姆 "..yellow.."[13]"..white..")",
    Note = "要开始任务，你必须给 奥里克斯 [信仰奖章]。你从堡垒第一个房间（分岔路口前）的箱子 (麦洛尔的保险箱 "..yellow.."[7]"..white..") 中获得奖章。给 奥里克斯 奖章后，他会支持你的队伍对抗 男爵 "..   yellow.."[19]"..white.."。杀死男爵后，你必须再次与 奥里克斯 交谈以获得奖励。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 17044 }, --Will of the Martyr Neck
        { id = 17045 }, --Blood of the Martyr Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[9] = {
    Title = "档案管理员",
    Level = 60,
    Attain = 55,
    Aim = "在斯坦索姆城中找到血色十字军的档案管理员加尔福特，杀掉他，然后烧毁血色十字军档案。",
    Location = "尼古拉斯·瑟伦霍夫公爵 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,59"..white..")",
    Note = "你可以在 "..yellow.."[10]"..white.." 找到档案和档案管理员。",
    Folgequest = "可怕的真相",
}
kQuestInstanceData.Stratholme.Alliance[10] = {
    Title = "可怕的真相",
    Level = 60,
    Attain = 55,
    Aim = "将巴纳扎尔的头颅交给东瘟疫之地的尼古拉斯·瑟伦霍夫公爵。",
    Location = "巴纳札尔 (斯坦索姆 "..yellow.."[11]"..white..")",
    Note = "你可以在 东瘟疫之地 - 圣光之愿礼拜堂 ("..yellow.."81,59"..white..") 找到 尼古拉斯·瑟伦霍夫公爵。",
    Prequest = "档案管理员",
    Folgequest = "超越",
}
kQuestInstanceData.Stratholme.Alliance[11] = {
    Title = "超越",
    Level = 60,
    Attain = 55,
    Aim = "到斯坦索姆去杀掉瑞文戴尔男爵，把他的头颅交给尼古拉斯·瑟伦霍夫公爵。",
    Location = "尼古拉斯·瑟伦霍夫公爵 (东瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."81,59"..white..")",
    Note = "你可以在 "..yellow.."[19]"..white.." 找到男爵。",
    Prequest = "可怕的真相",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 13243 }, --Argent Defender Shield
        { id = 13249 }, --Argent Crusader Staff
        { id = 13246 }, --Argent Avenger One-Hand, Sword
    }
}
kQuestInstanceData.Stratholme.Alliance[12] = {
    Title = "死人的请求",
    Level = 60,
    Attain = 58,
    Aim = "进入斯坦索姆，从瑞文戴尔男爵手中救出伊思达。",
    Location = "安泰恩·哈尔蒙 (东瘟疫之地 - 斯坦索姆)",
    Note = "安其奥就站在斯坦索姆传送门的外面。你需要超维度幽灵显形器才能看到他。它来自前置任务。任务线始于公平的补偿。联盟玩家可以在铁炉堡（"..yellow.."43,52"..white.."）找到德莉亚娜，部落玩家可以在奥格瑞玛（"..yellow.."38,37"..white.."）找到莫克瓦尔。\n这就是臭名昭著的“45分钟男爵跑”。",
    Prequest = "寻找安泰恩",
    Folgequest = "生命的证据",
}
kQuestInstanceData.Stratholme.Alliance[13] = {
    Title = "瓦萨拉克护符的左半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆来召唤莫尔·灰蹄的灵魂并杀了他。带着瓦萨拉克护符的左半块和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你可以从 '寻找安泰恩' 任务中获得它。\n\n加里恩 和 索托斯 在 "..   yellow.."[11]"..white.." 被召唤。",
    Prequest = "重要的材料",
    Folgequest = "奥卡兹岛在你前方……",
}
kQuestInstanceData.Stratholme.Alliance[14] = {
    Title = "瓦萨拉克护符的右半块",
    Level = 60,
    Attain = 58,
    Aim = "使用召唤火盆召唤莫尔·灰蹄的灵魂并杀了他。带着重新组合的瓦萨拉克护符和召唤火盆回到黑石山的布德利那里。",
    Location = "布德利 (黑石山 "..yellow.."[D] 在 入口地图"..white..")",
    Note = "需要 超维度幽灵显形器 才能看到 布德利。你可以从 '寻找安泰恩' 任务中获得它。\n\n加里恩 和 索托斯 在 "..   yellow.."[11]"..white.." 被召唤。",
    Prequest = "更多重要的材料",
    Folgequest = "最后的准备 ("..yellow.."黑石塔上层"..white..")", -- 8994",
}
kQuestInstanceData.Stratholme.Alliance[15] = {
    Title = "埃提耶什，守护者的传说之杖",
    Level = 60,
    Attain = 60,
    Aim = "塔纳利斯时光之穴的安纳克罗斯要你前往斯坦索姆，在神圣之地上使用埃提耶什，守护者的传说之杖。击败被驱赶出法杖的实体，然后回到安纳克罗斯那里去。",
    Location = "安纳克罗斯 (塔纳利斯 - 时光之穴 "..yellow.."65,49"..white..")",
    Note = "埃提耶什 在 "..yellow.."[2]"..white.." 被召唤。",
    Prequest = "埃提耶什之杖 -> 埃提耶什，被玷污的传说之杖",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 22589 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22630 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22631 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22632 }, --Atiesh, Greatstaff of the Guardian Staff
    }
}
kQuestInstanceData.Stratholme.Alliance[16] = {
    Title = "腐蚀",
    Level = 60,
    Attain = 50,
    Aim = "在斯坦索姆找到黑衣守卫铸剑师，然后杀死他。将黑色卫士徽记交给亡灵杀手瑟里尔。",
    Location = "亡灵杀手瑟里尔 (冬泉谷 - 永望镇 "..yellow.."61,37"..white..")",
    Note = red.."仅限锻造"..white..": 黑衣守卫铸剑师 在 "..yellow.."[15]"..white.." 附近被召唤。",
    Rewards = {
        Text = "奖励：",
        { id = 12825 }, --Plans: Blazing Rapier Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[17] = {
    Title = "甜美的平静",
    Level = 60,
    Attain = 50,
    Aim = "到斯坦索姆去杀死红衣铸锤师。将红衣铸锤师的围裙交给莉莉丝。",
    Location = "轻盈的莉莉丝 (冬泉谷 - 永望镇 "..yellow.."61,37"..white..")",
    Note = red.."仅限锻造"..white..": 红衣铸锤师 在 "..yellow.."[8]"..white.." 被召唤。",
    Rewards = {
        Text = "奖励：",
        { id = 12824 }, --Plans: Enchanted Battlehammer Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[18] = {
    Title = "建造一个重击者",
    Level = 60,
    Attain = 30,
    Aim = "从血色修道院的军械库中获取瑟银微调舵机，从傀儡统帅阿格曼奇处获得黑石深渊的完美魔像核心，在斯坦索姆找到精金棒，然后回到奥格索普·奥布诺提斯身边。",
    Location = "奥格索普·奥布诺提斯 <Master 侏儒技师> (荆棘谷; 藏宝海湾 "..yellow.."28.4,76.3"..white..").",
    Note = red..   "(仅限工程师)"..white.."此任务需要收集3个物品。 \n1) 瑟银微调舵机 (血色修道院 的 血色仆从 掉落)\n2) 完整的魔像核心 (黑石深渊 的 傀儡统帅阿格曼奇 掉落)\n3) 精金棒 (斯坦索姆 的 红衣铸锤师 "..   yellow.."[8]"..white.." 掉落)\n诺莫瑞根 的 '群体打击者9-60' 掉落 '完整的重击者主机'，这会开始前置任务 '一个沉重的大脑'。",
    Prequest = "一个沉重的大脑",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.Stratholme.Alliance[19] = {
    Title = "To Wake The Ashbringer",
    Level = 60,
    Attain = 60,
    Aim = "从斯坦索姆找回灰烬使者战袍（杀死大十字军战士达索汉）和亚历山德罗斯的披风。",
    Location = "提里奥·弗丁 (西瘟疫之地 - 圣光之愿礼拜堂 "..yellow.."67.3,24.2"..white..").",
    Note = "灰烬使者战袍 掉落自 大十字军战士达索汉 "..yellow.."[11]"..white..", 亚历山德罗斯的披风 掉落自 瑞文戴尔男爵"..yellow.."[19]"..white.."\n任务链开始于 纳克萨玛斯，在杀死 4骑士 后接取任务 '纯净光芒之球'",
    Prequest = "纯净光芒之球 -> 寻找其他帮助",
    Folgequest = "灰烬使者之魂",
    Rewards = {
        Text = "奖励：",
        { id = 82002 }, --Tabard of the Ashbringer Tabard
    }
}
kQuestInstanceData.Stratholme.Alliance[20] = {
    Title = "罗斯伦家族胸针",
    Level = 60,
    Attain = 55,
    Aim = "为卡拉赞的公爵罗斯伦找回罗斯伦家族胸针。",
    Location = "公爵罗斯伦 (卡拉赞 "..yellow.."[卡拉赞 - c]"..white..")",
    Note = "罗斯伦家族胸针 在首领 不可宽恕者 "..yellow.."[4]"..   white.." 旁边的箱子里。\n任务链开始于 史诗物品随机掉落 '潦草的烹饪笔记' "..yellow.."[卡拉赞]"..white..".",
    Prequest = "被撕碎的烹饪笔记"..yellow..   "[卡拉赞]"..white.." -> 失而复得 "..yellow.."[卡拉赞]"..white.."", -- 40998, 40999",
    Folgequest = "神秘配方 ("..yellow.."[卡拉赞]"..white..")",
}
kQuestInstanceData.Stratholme.Alliance[21] = {
    Title = "卡拉赞的钥匙之七",
    Level = 60,
    Attain = 58,
    Aim = "找到四个麦迪文的回响。它们可能出现在对法师来说具有重要意义的地方。然后带着钥匙回到多万·布雷斯温德身边。",
    Location = "多万·布雷斯温德 (尘泥沼泽 - 西部避难所 "..yellow.."[71.1,73.2]"..white..")",
    Note = "麦迪文的第二根羽毛 在 遥语长者 (春节) "..yellow.."[5]"..white.." 所在的地面上。\n麦迪文的第一根羽毛 "..yellow.."[幽暗城]"..white.." 在入口王座后面。\n麦迪文的第三根羽毛 "..yellow.."[奥特兰克山脉]"..white.." 在第一(西)悬崖的尽头 "..yellow.."[30.8,87.4]"..white.."。\n麦迪文的第四根羽毛 "..   yellow.."[海加尔山]"..white.." 在悬崖的尽头 "..yellow.."[31.8,70.5]"..white.."。",
    Prequest = "卡拉赞的钥匙之六",
    Folgequest = "卡拉赞的钥匙之八 ("..yellow.."厄运之槌 西"..white..")",
}
for i = 1, 17 do
    kQuestInstanceData.Stratholme.Horde[i] = kQuestInstanceData.Stratholme.Alliance[i]
end
kQuestInstanceData.Stratholme.Horde[18] = {
    Title = "吞咽者拉姆斯登",
    Level = 60,
    Attain = 56,
    Aim = "到斯坦索姆去，杀掉吞咽者拉姆斯登。把他的头颅交给纳萨诺斯。",
    Location = "纳萨诺斯·凋零者 (东瘟疫之地 "..yellow.."26,74"..white..")",
    Note = "你也可以从 纳萨诺斯·凋零者 那里获得前置任务。你可以在 "..yellow.."[18]"..white.." 找到 吞咽者拉姆斯登。",
    Prequest = "游侠之王的命令 -> 暗翼蝠",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 18022 }, --Royal Seal of Alexis Ring
        { id = 17001 }, --Elemental Circle Ring
    }
}
kQuestInstanceData.Stratholme.Horde[19] = {
    Title = "建造一个重击者",
    Level = 60,
    Attain = 30,
    Aim = "从血色修道院的军械库中获取瑟银微调舵机，从傀儡统帅阿格曼奇处获得黑石深渊的完美魔像核心，在斯坦索姆找到精金棒，然后回到奥格索普·奥布诺提斯身边。",
    Location = "奥格索普·奥布诺提斯 <大师 侏儒技师> (荆棘谷; 藏宝海湾 "..yellow.."28.4,76.3"..white..").",
    Note = red.."(仅限工程师)"..white.."此任务需要收集3个物品。 \n1) 瑟银微调舵机 (血色修道院 的 血色仆从 掉落)\n2) 完整的魔像核心 (黑石深渊 的 傀儡统帅阿格曼奇 掉落)\n3) 精金棒 (斯坦索姆 的 红衣铸锤师 "..yellow.."[8]"..white.." 掉落)\n诺莫瑞根 的 '群体打击者9-60' 掉落 '完整的重击者主机'，这会开始前置任务 '一个沉重的大脑'。",
    Prequest = "一个沉重的大脑",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.Stratholme.Horde[20] = kQuestInstanceData.Stratholme.Alliance[19]
kQuestInstanceData.Stratholme.Horde[21] = kQuestInstanceData.Stratholme.Alliance[21]

--------------- Ruins of Ahn'Qiraj ---------------
kQuestInstanceData.TheRuinsofAhnQiraj = {
    Story = "在流沙之战的最后几小时，暗夜精灵和四大龙族的联合力量将战斗推向其拉帝国的心脏——安其拉要塞城市。然而在城门处，卡利姆多的军队遇到了比他们以前遇到的任何异种虫战争无人机都更大规模的集中。最终，异种虫和他们的其拉主人并没有被打败，而只是被囚禁在魔法屏障内，战争使这座被诅咒的城市成为废墟。自那天以来已过去一千年，但其拉势力并没有闲着。一支新的可怕军队从蜂巢中诞生，安其拉废墟再次充满了成群的异种虫和其拉。这个威胁必须被消除，否则整个艾泽拉斯可能会在新其拉军队的可怕力量面前倒下。",
    Caption = "安其拉废墟",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[1] = {
    Title = "奥斯瑞安之死",
    Level = 60,
    Attain = 60,
    Aim = "将无疤者奥斯瑞安的头颅交给希利苏斯塞纳里奥要塞的指挥官玛尔利斯。",
    Location = "无疤者奥斯里安的头颅 (掉落自 无疤者奥斯里安 "..yellow.."[6]"..white..")",
    Note = "指挥官玛尔利斯 (希利苏斯 - 塞纳里奥要塞 "..yellow.."49,34"..white..")",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 21504 }, --Charm of the Shifting Sands Neck
        { id = 21507 }, --Amulet of the Shifting Sands Neck
        { id = 21505 }, --Choker of the Shifting Sands Neck
        { id = 21506 }, --Pendant of the Shifting Sands Neck
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[2] = {
    Title = "完美的毒药",
    Level = 60,
    Attain = 60,
    Aim = "塞纳里奥要塞的德尔克·雷木让你把温诺希斯的毒囊和库林纳克斯的毒囊交给他。",
    Location = "德尔克·雷木 (希利苏斯 - 塞纳里奥要塞 "..yellow.."52,39"..white..")",
    Note = "温诺希斯的毒囊 掉落自 High priest Venoxis in "..yellow.."祖尔格拉布"..white..". 库林纳克斯的毒囊 drops in the "..yellow.."安其拉废墟"..white.." at "..yellow.."[1]"..   white..".",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 22378 }, --Ravenholdt Slicer One-Hand, Sword
        { id = 22379 }, --Shivsprocket's Shiv Main Hand, Dagger
        { id = 22377 }, --The Thunderwood Poker One-Hand, Dagger
        { id = 22348 }, --Doomulus Prime Two-Hand, Mace
        { id = 22347 }, --Fahrad's Reloading Repeater Crossbow
        { id = 22380 }, --Simone's Cultivating Hammer Main Hand, Mace
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[3] = {
    Title = "遗失于沙漠之中",
    Level = 60,
    Attain = 60,
    Aim = "将一块完美黑曜石碎片带给大法师克希雷姆。",
    Location = "大法师克希雷姆 (艾萨拉 "..yellow.."28,47"..white..")",
    Note = red..   "法师专用"..white..": pre-quest from 博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..   white.."). 完美黑曜石碎片 掉落自 "..yellow.."[3]"..white..".",
    Prequest = "久违的法师 -> 一种特殊的传票",
    Rewards = {
        Text = "奖励：",
        { id = 83002 }, --Tome of Refreshment Ritual Pattern
    }
}
for i = 1, 3 do
    kQuestInstanceData.TheRuinsofAhnQiraj.Horde[i] = kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[i]
end

--------------- The Stockade ---------------
kQuestInstanceData.TheStockade = {
    Story =    "监狱是一个高度安全的监狱综合体，隐藏在暴风城运河区下方。由典狱官塞尔沃特主持，监狱是小偷、政治叛乱分子、杀人犯和这片土地上最危险罪犯的家园。最近，一场由囚犯领导的暴动导致监狱内一片混乱——守卫被赶出，罪犯自由漫游。典狱官塞尔沃特已设法逃离关押区，目前正在招募勇敢的寻求刺激者冒险进入监狱并杀死暴动的策划者——狡猾的重犯巴济尔·萨雷德。",
    Caption = "监狱",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheStockade.Alliance[1] = {
    Title = "伸张正义",
    Level = 25,
    Attain = 22,
    Aim = "把塔格尔的头颅带给湖畔镇的卫兵伯尔顿。",
    Location = "卫兵伯尔顿 (赤脊山 - 湖畔镇 "..yellow.."26,46"..white..")",
    Note = "你可以在 "..yellow.."[1]"..white.." 找到 塔格尔。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 3400 }, --Lucine Longsword Main Hand, Sword
        { id = 1317 }, --Hardened Root Staff Staff
    }
}
kQuestInstanceData.TheStockade.Alliance[2] = {
    Title = "罪与罚",
    Level = 26,
    Attain = 22,
    Aim = "夜色镇的米尔斯迪普议员要你杀死迪克斯特·瓦德，并把他的手带回来作为证明。",
    Location = "米尔斯迪普议员 (暮色森林 - 夜色镇 "..yellow.."72,47"..white..")",
    Note = "你可以在 "..yellow.."[5]"..white.." 找到 迪克斯特·瓦德。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 2033 }, --Ambassador's Boots Feet, Leather
        { id = 2906 }, --Darkshire Mail Leggings Legs, Mail
    }
}
kQuestInstanceData.TheStockade.Alliance[3] = {
    Title = "镇压暴动",
    Level = 26,
    Attain = 22,
    Aim = "暴风城的典狱官塞尔沃特要求你杀死监狱中的10名迪菲亚囚徒、8名迪菲亚罪犯和8名迪菲亚叛军。",
    Location = "典狱官塞尔沃特 (暴风城 - 监狱 "..yellow.."41,58"..white..")",
}
kQuestInstanceData.TheStockade.Alliance[4] = {
    Title = "鲜血的颜色",
    Level = 26,
    Attain = 22,
    Aim = "暴风城的尼科瓦·拉斯克要你取得10条红色毛纺面罩。",
    Location = "尼科瓦·拉斯克 (暴风城 - 旧城区 "..yellow.."73,46"..white..")",
    Note = "副本内的所有怪物都会掉落 红色毛纺面罩。",
}
kQuestInstanceData.TheStockade.Alliance[5] = {
    Title = "卡姆·深怒",
    Level = 27,
    Attain = 22,
    Aim = "丹莫德的莫特雷·加玛森要求你把卡姆·深怒的头颅交给他。",
    Location = "莫特雷·加玛森 (湿地 - 丹莫德 "..yellow.."49,18"..white..")",
    Note = "前置任务也可以从 莫特雷 处获得。你可以在 "..   yellow.."[2]"..white.." 找到 卡姆·深怒。",
    Prequest = "黑铁战争",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 3562 }, --Belt of Vindication Waist, Leather
        { id = 1264 }, --Headbasher Two-Hand, Mace
    }
}
kQuestInstanceData.TheStockade.Alliance[6] = {
    Title = "监狱暴动",
    Level = 29,
    Attain = 16,
    Aim = "杀死巴基尔·斯瑞德，把他的头带给监狱的典狱官塞尔沃特。",
    Location = "典狱官塞尔沃特 (暴风城 - 监狱 "..yellow.."41,58"..white..")",
    Note = "关于前置任务的更多详情请见 "..   yellow.."[死亡矿井, 迪菲亚兄弟会]"..white.."。\n你可以在 "..yellow.."[4]"..white.." 找到 巴基尔·斯瑞德。",
    Prequest = "迪菲亚兄弟会 -> 巴吉尔·特雷德",
    Folgequest = "好奇的访客",
}
kQuestInstanceData.TheStockade.Alliance[7] = {
    Title = "The Stockade's Search",
    Level = 24,
    Attain = 18,
    Aim = "深入监狱并找到关于马丁·柯林斯的信息。",
    Location = "马迪亚斯·肖尔大师 <军情七处领袖> (暴风城 - 旧城区, 盗贼区 "..yellow.."75.8,59.8"..white..")",
    Note = "你可以在副本入口对面房间的 密封的公文箱 "..yellow.."[1]"..white.." 中找到 马丁·柯林斯的信息。\n任务链开始于 高级指挥官莱西 (湿地 - 鹰守堡 "..yellow.."36.4,67.3"..white.." 帐篷下) 的任务 '揭开谜团'\n完成任务链的最后一个任务后你将获得奖励。",
    Prequest = "罗比的报告",
    Folgequest = "调查柯林斯",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 81416 }, --Valiant Medallion Neck
        { id = 81417 }, --Ambient Talisman Neck
        { id = 81418 }, --Magnificent Necklace Neck
    }
}

--------------- The Sunken Temple ---------------
kQuestInstanceData.TheSunkenTemple = {
    Story = "一千多年前，强大的古拉巴什帝国被一场大规模内战撕裂。一个有影响力的巨魔祭司团体，被称为阿塔莱，试图召回一位名叫灵魂剥夺者哈卡的古老血神。尽管祭司们被击败并最终流放，伟大的巨魔帝国自行崩溃。流放的祭司逃到遥远的北方，进入悲伤沼泽。在那里他们为哈卡建造了一座宏伟的神庙——在那里他们可以为他进入物质世界做准备。伟大的巨龙守护者伊瑟拉得知了阿塔莱的计划，并将神庙粉碎在沼泽之下。直到今天，神庙被淹没的废墟由绿龙守卫，他们阻止任何人进出。然而，人们相信一些狂热的阿塔莱可能在伊瑟拉的愤怒中幸存——并重新投身于哈卡的黑暗服务。",
    Caption = "沉没的神庙",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheSunkenTemple.Alliance[1] = {
    Title = "进入阿塔哈卡神庙",
    Level = 50,
    Attain = 41,
    Aim = "为暴风城的布罗哈恩·铁桶收集10块阿塔莱石板。",
    Location = "布罗哈恩·铁桶 (暴风城 - 矮人区 "..yellow.."64,20"..white..")",
    Note =    "前置任务线来自同一个NPC，并且有相当多的步骤。\n\n你可以在神庙各处找到石板，包括副本外和副本内。",
    Prequest = "调查神庙 -> 拉普索迪的故事",
    Rewards = {
        Text = "奖励：",
        { id = 1490 }, --Guardian Talisman Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[2] = {
    Title = "邪恶之雾",
    Level = 52,
    Attain = 47,
    Aim = "收集5份阿塔莱之雾的样本，然后向安戈洛环形山的穆尔金复命。",
    Location = "格雷甘·山酒 (菲拉斯 "..yellow.."45,25"..white..")",
    Note = "前置任务 '穆尔金和拉瑞安' 开始于 穆尔金 (安戈洛环形山 - 马绍尔营地 "..   yellow.."42,9"..white..")。你可以从神庙中的 深渊潜伏者, 黑暗蠕虫 或 软泥怪 身上获得阿塔莱之雾。",
    Prequest = "穆尔金和拉瑞安 -> 造访格雷甘",
}
kQuestInstanceData.TheSunkenTemple.Alliance[3] = {
    Title = "深入神庙",
    Level = 51,
    Attain = 46,
    Aim = "在悲伤沼泽沉没的神庙中找到哈卡祭坛。",
    Location = "玛尔冯·瑞文斯克 (塔纳利斯 "..yellow.."52,45"..white..")",
    Note = "祭坛位于 "..yellow.."[1]"..white..".\n联盟任务线开始于 安吉拉斯·月风 (菲拉斯 - 羽月要塞 "..yellow.."31.8,45.6"..white..") 的任务 '沉没的神庙'。\n部落任务线开始于 巫医尤克里 (菲拉斯 - 莫沙彻营地 "..   yellow.."74.4,43.4"..white..") 的任务 '沉没的神庙'。",
    Prequest = "石环",
    Folgequest = "雕像群的秘密",
}
kQuestInstanceData.TheSunkenTemple.Alliance[4] = {
    Title = "雕像群的秘密",
    Level = 51,
    Attain = 46,
    Aim = "到沉没的神庙去，揭开雕像群中隐藏的秘密。",
    Location = "哈卡祭坛 (沉没的神庙 "..yellow.."1"..white..")",
    Note = "你可以在 "..yellow.."[1]"..white.." 找到雕像群。查看地图以获取激活顺序。",
    Prequest = "深入神庙",
    Rewards = {
        Text = "奖励：",
        { id = 10773 }, --Hakkari Urn Container
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[5] = {
    Title = "神灵哈卡",
    Level = 53,
    Attain = 40,
    Aim = "将装满的哈卡之卵交给塔纳利斯的叶基亚。",
    Location = "叶基亚 (塔纳利斯 - 热砂港 "..yellow.."66,22"..white..")",
    Note = "任务线开始于同一个NPC的 '尖啸者的灵魂' (见 "..yellow.."[祖尔法拉克]"..white..")。\n你必须在 "..yellow.."[3]"..white.." 使用卵来开始事件。一旦开始，敌人就会出现并攻击你。其中一些会掉落哈卡之血。用这些血你可以熄灭圆圈周围的火炬。之后 哈卡的化身 会出现。杀死他并拾取 '哈卡精华'，用它来填满卵。",
    Prequest = "尖啸者的灵魂 -> 远古之卵",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 10749 }, --Avenguard Helm Head, Plate
        { id = 10750 }, --Lifeforce Dirk One-Hand, Dagger
        { id = 10751 }, --Gemburst Circlet Head, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[6] = {
    Title = "预言者迦玛兰",
    Level = 53,
    Attain = 38,
    Aim = "辛特兰的阿塔莱流放者要你给他带回迦玛兰的头。",
    Location = "The 阿塔莱流放者 (辛特兰 "..yellow.."33,75"..white..")",
    Note = "你可以在 "..yellow.."[4]"..white.." 找到 迦玛兰。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 11123 }, --Rainstrider Leggings Legs, Cloth
        { id = 11124 }, --Helm of Exile Head, Mail
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[7] = {
    Title = "伊兰尼库斯精华",
    Level = 55,
    Attain = 48,
    Aim = "把伊兰尼库斯精华放在精华之泉里，精华之泉就在沉没的神庙中，伊兰尼库斯的巢穴里。",
    Location = "伊兰尼库斯精华 (掉落自 伊兰尼库斯的阴影 "..yellow.."[6]"..white..")",
    Note = "你可以在 伊兰尼库斯的阴影 所在的 "..yellow.."[6]"..white.." 旁边找到精华之泉。\n"..   red..   "不要"..white.."  出售或扔掉奖励饰品 被禁锢的伊兰尼库斯精华。你在 伊萨里奥斯 (悲伤沼泽 - 伊萨里奥斯洞穴 "..   yellow.."[13.6,71.7]"..white.." 的下一个任务中需要它，与他交谈后你将获得一个开始任务的物品。",
    Folgequest = "伊兰尼库斯精华",
    Rewards = {
        Text = "奖励：",
        { id = 10455 }, --Chained Essence of Eranikus Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[8] = {
    Title = "巨魔的羽毛",
    Level = 52,
    Attain = 50,
    Aim = "到沉没的神庙去，从巨魔们身上获得6支巫毒羽毛。",
    Location = "伊普斯 (费伍德森林 "..yellow.."42,45"..white..")",
    Note = red..   "此任务仅限术士完成。"..   white..": 羽毛掉落自俯瞰中心有洞的大房间的壁架上的每个具名巨魔。",
    Prequest = "小鬼的要求 -> 奇怪的材料",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 20536 }, --Soul Harvester Staff
        { id = 20534 }, --Abyss Shard Trinket
        { id = 20530 }, --Robes of Servitude Chest, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[9] = {
    Title = "巫毒羽毛",
    Level = 52,
    Attain = 50,
    Aim = "将你从沉没的神庙的巨魔身上得到的巫毒羽毛交给部落英雄的灵魂。",
    Location = "部落英雄的灵魂 (悲伤沼泽 "..yellow.."34,66"..white..")",
    Note = red..   "仅限战士"..white..": 羽毛掉落自俯瞰中心有洞的大房间的壁架上的每个具名巨魔。\n部落任务线开始于 奥格瑞玛 的战士训练师 索瑞克 "..   yellow.."80.4,32.3"..white..".",
    Prequest = "困扰的灵魂 -> 影誓者之战",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 20521 }, --Fury Visor Head, Plate
        { id = 20130 }, --Diamond Flask Trinket
        { id = 20517 }, --Razorsteel Shoulders Shoulder, Plate
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[10] = {
    Title = "更好的材料",
    Level = 52,
    Attain = 50,
    Aim = "从沉没的神庙底部的守卫身上得到一些腐烂藤蔓，把它们交给托尔瓦·寻路者。",
    Location = "托尔瓦·寻路者 (安戈洛环形山 "..yellow.."72,76"..white..")",
    Note = red..   "仅限德鲁伊"..white..": 腐烂藤蔓 掉落自 阿塔拉利恩，通过按照地图上列出的顺序激活雕像，他在 "..   yellow.."[1]"..white.." 被召唤。",
    Prequest = "托尔瓦·寻路者 -> 毒性测试",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 22274 }, --Grizzled Pelt Chest, Leather
        { id = 22272 }, --Forest's Embrace Chest, Leather
        { id = 22458 }, --Moonshadow Stave Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[11] = {
    Title = "神庙中的绿龙",
    Level = 52,
    Attain = 50,
    Aim = "将摩弗拉斯的牙齿交给艾萨拉的奥汀克。他住在埃达拉斯废墟东北部悬崖的顶端。",
    Location = "奥汀克 (艾萨拉 "..yellow.."42,43"..white..")",
    Note = red.."仅限猎人"..white..": 摩弗拉斯 位于 "..yellow.."[5]"..white..".",
    Prequest = "猎人的护符 -> 碎浪多头怪",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 20083 }, --Hunting Spear Polearm
        { id = 19991 }, --Devilsaur Eye Trinket
        { id = 19992 }, --Devilsaur Tooth Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[12] = {
    Title = "毁灭摩弗拉斯",
    Level = 52,
    Attain = 50,
    Aim = "从摩弗拉斯身上取回奥术碎片，然后返回大法师克希雷姆那儿。",
    Location = "大法师克希雷姆 (艾萨拉 "..yellow.."29,40"..white..")",
    Note = red.."仅限法师"..white..": 摩弗拉斯 位于 "..yellow.."[5]"..white..".",
    Prequest = "魔法的尘埃 -> 纳迦的珊瑚",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 20035 }, --Glacial Spike One-Hand, Dagger
        { id = 20037 }, --Arcane Crystal Pendant Neck
        { id = 20036 }, --Fire Ruby Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[13] = {
    Title = "摩弗拉斯之血",
    Level = 52,
    Attain = 50,
    Aim = "前往沉没的阿塔哈卡神庙，杀死绿龙摩弗拉斯，将他的血液交给费伍德森林中的格雷塔·苔蹄。沉没的神庙的入口就在悲伤沼泽中。",
    Location = "奥汀克 (艾萨拉 "..yellow.."42,43"..white..")",
    Note = red..   "仅限牧师"..white..": 摩弗拉斯 位于 "..yellow.."[5]"..white.."。 格雷塔·苔蹄 位于 费伍德森林 - 翡翠圣地 ("..yellow.."51,82"..white..")。",
    Prequest = "塞纳里奥议会的求助 -> 亡灵的腐液",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 19990 }, --Blessed Prayer Beads Trinket
        { id = 20082 }, --Woestave Wand
        { id = 20006 }, --Circle of Hope Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[14] = {
    Title = "碧蓝钥匙",
    Level = 52,
    Attain = 50,
    Aim = "将碧蓝钥匙交给乔拉齐·拉文霍德公爵。",
    Location = "大法师克希雷姆 (艾萨拉 "..yellow.."29,40"..white..")",
    Note = red..   "仅限盗贼"..white..": 碧蓝钥匙 掉落自 摩弗拉斯，位于 "..yellow..   "[5]"..white.."。 乔拉齐·拉文霍德公爵 位于 奥特兰克山脉 - 拉文霍德 ("..yellow.."86,79"..white..")。",
    Prequest = "简单的要求 -> 密文碎片",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 19984 }, --Ebon Mask Head, Leather
        { id = 20255 }, --Whisperwalk Boots Feet, Leather
        { id = 19982 }, --Duskbat Drape Back
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[15] = {
    Title = "伊兰尼库斯，梦境之暴君",
    Level = 60,
    Attain = 60,
    Aim = "到达纳苏斯的城墙外去找到玛法里奥的亲信。",
    Location = "玛法里恩·怒风 (在 伊兰尼库斯的阴影 "..yellow.."[8]"..white.." 处生成)",
    Note = "森林小精灵 (泰达希尔 "..yellow.."37,47"..white..")",
    Prequest = "巨龙军团的指控",
    Folgequest = "泰兰德和雷姆洛斯",
}
kQuestInstanceData.TheSunkenTemple.Alliance[16] = {
    Title = "采取必要的手段之四",
    Level = 53,
    Attain = 47,
    Aim = "前往沉没的神庙，找到龙族哈扎斯，杀死他，并将哈扎斯之心归还给尼雷米乌斯·暗风。",
    Location = "尼雷米乌斯·暗风 (费伍德森林 "..yellow.."40,30"..white..")",
    Note = "掉落自 [7] 首领。下一个任务的奖励。",
    Prequest = "采取必要的手段之一 -> 采取必要的手段之二 -> 采取必要的手段之三",
    Folgequest = "采取必要的手段之五",
    Rewards = {
        Text = "奖励：",
        { id = 60536 }, --Darkwind Glaive One-Hand, Sword
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[17] = {
    Title = "铸造力量之石",
    Level = 52,
    Attain = 50,
    Aim = "前往沉没的神庙，从巨魔守护者们身上取得巫毒羽毛，然后把它们交给阿什拉姆·瓦罗菲斯特。",
    Location = "指挥官阿胥拉姆·瓦罗菲斯特 (西瘟疫之地 - 寒风营地 "..yellow.."43,85"..white..")",
    Note = red..   "仅限圣骑士"..   white..": 羽毛掉落自俯瞰中心有洞的大房间的壁架上的每个具名巨魔。",
    Prequest = "惰性天灾石",
    Rewards = {
        Text = "奖励：1 和 2 或 3 或 4",
        { id = 20620 }, --Holy Mightstone Enchant
        { id = 20504 }, --Lightforged Blade Two-Hand, Sword
        { id = 20512 }, --Sanctified Orb Trinket
        { id = 20505 }, --Chivalrous Signet Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[18] = {
    Title = "寐入梦境之三",
    Level = 60,
    Attain = 58,
    Aim = "从艾萨拉的峭壁击碎者身上收集一片束缚碎片，从厄运之槌西的秘法洪流身上收集一个奥术过载棱镜，从沉没的神庙中的沉睡绿龙的身上收集一片沉睡者碎片。带着收集到的物品向悲伤沼泽的伊萨里奥斯报告。",
    Location = "拉拉修斯 (海加尔山 - 诺达纳尔 "..yellow.."85,30"..white..")",
    Note = "德拉维沃尔 "..yellow.."[6]"..white.." 4条龙之一 掉落 沉睡者碎片，将在杀死 预言者迦玛兰 "..yellow.."[4]"..white.." 后出现。通往预言者的屏障将在清理 6个阳台 "..   blue..   "[C]"..   white.." 后消失。\n完成此任务线你将获得项链，并且能够进入 海加尔山 团队副本 翡翠圣殿。",
    Prequest = "寐入梦境之一 -> 寐入梦境之二",
    Folgequest = "寐入梦境之四",
    Rewards = {
        Text = "奖励：",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[19] = {
    Title = "裂隙行者法杖",
    Level = 54,
    Attain = 30,
    Aim = "将阿赫扎多尔的裂隙行者法杖和迦玛兰的魔精带回给艾萨拉的阿赫·扎多尔。",
    Location = "阿赫·扎多尔 (艾萨拉 "..yellow.."51,37"..white..")",
    Note = "任务线开始于 桑夫·科拉 (悲伤沼泽 "..yellow.."25, 30"..   white..")。 预言者迦玛兰 "..yellow.."[4]。"..white.."\n完成此任务线你将获得奖励 纯净德莱尼水晶宝石。",
    Prequest = "桑夫的护身符 -> 寻找阿赫·扎多尔 -> 裂隙疲惫：身",
    Folgequest = "荒芜之地的徒弟",
    Rewards = {
        Text = "奖励：",
        { id = 41385 }, --Pure Draenethyst Gemstone 任务物品
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[1] = {
    Title = "阿塔哈卡神庙",
    Level = 50,
    Attain = 38,
    Aim = "收集20个哈卡神像，把它们带给斯通纳德的费泽鲁尔。",
    Location = "Fel'Zerul (悲伤沼泽 - 斯通纳德 "..yellow.."47,54"..white..")",
    Note = "神庙中的所有敌人都会掉落神像。\n任务线开始于 费泽鲁尔 (悲伤沼泽 - 斯通纳德 "..   yellow.."47,54"..white..")",
    Prequest = "泪水之池 -> 向费泽鲁尔复命",
    Rewards = kQuestInstanceData.TheSunkenTemple.Alliance[1].Rewards
}
kQuestInstanceData.TheSunkenTemple.Horde[2] = {
    Title = "除草器的燃料",
    Level = 52,
    Attain = 47,
    Aim = "收集5份阿塔莱之雾的样本，然后将它们送到马绍尔营地的拉瑞安那里。",
    Location = "莉芙·雷兹菲克斯 (贫瘠之地 "..yellow.."62,38"..white..")",
    Note = "前置任务 '拉瑞安和穆尔金' 开始于 拉瑞安 (安戈洛环形山 "..   yellow.."45,8"..white..")。你可以从神庙中的 深渊潜伏者, 黑暗蠕虫 或 软泥怪 身上获得阿塔莱之雾。",
    Prequest = "拉瑞安和穆尔金 -> 玛尔冯的车间",
}
for i = 3, 16 do
    kQuestInstanceData.TheSunkenTemple.Horde[i] = kQuestInstanceData.TheSunkenTemple.Alliance[i]
end
kQuestInstanceData.TheSunkenTemple.Horde[17] = {
    Title = "巫毒羽毛",
    Level = 52,
    Attain = 50,
    Aim = "将巫毒羽毛交给捕风者巴士拉。",
    Location = "捕风者巴斯拉 (奥特兰克山脉 "..yellow.."80,67"..white..")",
    Note = red..   "仅限萨满"..   white..": 羽毛掉落自俯瞰中心有洞的大房间的壁架上的每个具名巨魔。",
    Prequest = "灵魂图腾",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 20369 }, --Azurite Fists Hands, Mail
        { id = 20503 }, --Enamored Water Spirit Trinket
        { id = 20556 }, --Wildstaff Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[18] = {
    Title = "莫尔奥格危机之七",
    Level = 54,
    Attain = 45,
    Aim = "冒险进入阿塔哈卡神庙的深处，拿到阿塔莱神杖，把它带给英桑姆尼完成咒语。",
    Location = "英桑姆尼 <伟大的隐士> (卡松岛, 吉利吉姆之岛 北部 "..yellow.."57.2,10.1"..white..")",
    Note = "阿塔莱神杖 来自 预言者迦玛兰 "..yellow.."[4]"..white.." 后面地板上的绿色小木箱。\n任务线开始于 大先知海资高格 (荆棘谷 - 吉利吉姆之岛(藏宝海湾 西部) - 莫尔奥格避难所, 东南洞穴内 "..   yellow.."78.1,81"..white.."。)\n完成任务链的最后一个任务后你将获得奖励。",
    Prequest = "莫尔奥格危机之六",
    Folgequest = "莫尔奥格危机之八",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60346 }, --The Ogre Mantle Shoulder, Leather
        { id = 60347 }, --Staff of the Ogre Seer Staff
        { id = 60348 }, --Favor of Cruk'Zogg Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[19] = {
    Title = "寐入梦境之三",
    Level = 60,
    Attain = 58,
    Aim = "从艾萨拉的峭壁击碎者身上收集一片束缚碎片，从厄运之槌西的秘法洪流身上收集一个奥术过载棱镜，从沉没的神庙中的沉睡绿龙的身上收集一片沉睡者碎片。带着收集到的物品向悲伤沼泽的伊萨里奥斯报告。",
    Location = "拉拉修斯 (海加尔山 - 诺达纳尔 "..yellow.."85,30"..white..")",
    Note = "德拉维沃尔 "..yellow.."[6]"..white.." 4条龙之一 掉落 沉睡者碎片，将在杀死 预言者迦玛兰 "..yellow.."[4]"..white.." 后出现。通往预言者的屏障将在清理 6个阳台 "..   blue..   "[C]"..   white.." 后消失。\n完成此任务线你将获得项链，并且能够进入 海加尔山 团队副本 翡翠圣殿。",
    Prequest = "寐入梦境之一 -> 寐入梦境之二",
    Folgequest = "寐入梦境之四",
    Rewards = {
        Text = "奖励：",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[20] = {
    Title = "裂隙行者法杖",
    Level = 54,
    Attain = 30,
    Aim = "将阿赫扎多尔的裂隙行者法杖和迦玛兰的魔精带回给艾萨拉的阿赫·扎多尔。",
    Location = "阿赫·扎多尔 (艾萨拉 "..yellow.."51,37"..white..")",
    Note = "任务线开始于 桑夫·科拉 (悲伤沼泽 "..yellow.."25, 30"..   white..")。 预言者迦玛兰 "..yellow.."[4]。"..white.."\n完成此任务线你将获得奖励 纯净德莱尼水晶宝石。",
    Prequest = "桑夫的护身符 -> 寻找阿赫·扎多尔 -> 裂隙疲惫：身",
    Folgequest = "荒芜之地的徒弟",
    Rewards = {
        Text = "奖励：",
        { id = 41385 }, --Pure Draenethyst Gemstone 任务物品
    }
}

--------------- Temple of Ahn'Qiraj ---------------
kQuestInstanceData.TheTempleofAhnQiraj = {
    Story =    "在安其拉的中心是一座古老的神庙建筑群。建于有记录历史之前的时代，它既是难以言喻的众神的纪念碑，也是其拉军队的大规模繁殖地。自从流沙之战在一千年前结束以来，其拉帝国的双子皇帝一直被困在他们的神庙里，勉强被青铜龙阿纳克洛斯和暗夜精灵建立的魔法屏障所遏制。现在流沙节杖已经重新组装，封印已被打破，进入安其拉内圣所的道路已经打开。在蜂巢爬行的疯狂之外，在安其拉神庙之下，成群的其拉准备入侵。必须不惜一切代价阻止他们，以免他们再次对卡利姆多释放贪婪的昆虫军队，第二次流沙之战爆发！",
    Caption = "神庙 安其拉",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1] = {
    Title = "克苏恩的遗产",
    Level = 60,
    Attain = 60,
    Aim = "将克苏恩之眼带给安其拉神庙的凯雷斯特拉兹。",
    Location = "克苏恩之眼 (掉落自 克苏恩 "..yellow.."[9]"..white..")",
    Note = "凯雷斯特拉兹 (安其拉神庙 "..yellow.."2'"..white..")\n列出的奖励是后续任务的。",
    Folgequest = "卡利姆多的救星",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 21712 }, --Amulet of the Fallen God Neck
        { id = 21710 }, --Cloak of the Fallen God Back
        { id = 21709 }, --Ring of the Fallen God Ring
    }
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2] = {
    Title = "其拉的秘密",
    Level = 60,
    Attain = 60,
    Aim = "把上古其拉神器交给隐藏在神殿入口处的龙类。",
    Location = "上古其拉神器 (安其拉神庙 随机掉落)",
    Note = "交给 安多葛斯 (安其拉神庙 "..yellow.."1'"..white..")。"
}
kQuestInstanceData.TheTempleofAhnQiraj.Horde[1] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1]
kQuestInstanceData.TheTempleofAhnQiraj.Horde[2] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2]

--------------- Zul'Farrak ---------------
kQuestInstanceData.ZulFarrak = {
    Story =    "这座被太阳炙烤的城市是沙怒巨魔的家园，以其特别的无情和黑暗神秘主义而闻名。巨魔传说讲述了一把名叫鞭笞者苏尔萨克的强大之剑，这是一种能够在即使是最强大的敌人中灌输恐惧和软弱的武器。很久以前，这把武器被分成两半。然而，有传言称这两半可能在祖尔法拉克的墙壁内某处被找到。报告还暗示一队逃离加基森的雇佣兵游荡进入这座城市并被困住。他们的命运仍然未知。但也许最令人不安的是关于一个古老生物在城市中心的神圣水池中沉睡的低语——一位强大的半神，将对任何愚蠢到唤醒他的冒险者造成难以言喻的破坏。",
    Caption = "祖尔法拉克",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ZulFarrak.Alliance[1] = {
    Title = "耐克鲁姆的徽章",
    Level = 47,
    Attain = 40,
    Aim = "将耐克鲁姆的徽章交给诅咒之地的萨迪斯·酷影。",
    Location = "萨迪斯·酷影 (诅咒之地 - 守望堡 "..yellow.."66,19"..white..")",
    Note = "任务线开始于 狮鹫兽管理员沙拉克·鹰斧 (辛特兰 - 鹰巢山 "..yellow.."9,44"..white..")。\n耐克鲁姆 在 "..yellow.."[4]"..white.." 与你在神庙事件中战斗的最后一群怪物一起生成。",
    Prequest = "枯木巨魔的牢笼 -> 萨迪斯·酷影",
    Folgequest = "占卜",
}
kQuestInstanceData.ZulFarrak.Alliance[2] = {
    Title = "巨魔调和剂",
    Level = 45,
    Attain = 40,
    Aim = "收集20瓶巨魔调和剂，把它们交给加基森的特伦顿·轻锤。",
    Location = "特伦顿·轻锤 (塔纳利斯 - 加基森 "..yellow.."51,28"..white..")",
    Note = "每个巨魔都会掉落调和剂。",
}
kQuestInstanceData.ZulFarrak.Alliance[3] = {
    Title = "圣甲虫的壳",
    Level = 45,
    Attain = 40,
    Aim = "给加基森的特兰雷克带去5个完整的圣甲虫壳。",
    Location = "特兰雷克 (塔纳利斯 - 加基森 "..yellow.."51,26"..white..")",
    Note = "前置任务开始于 克拉兹克 (荆棘谷 - 藏宝海湾 "..yellow.."25,77"..white..")。\n每个圣甲虫都会掉落壳。很多圣甲虫在 "..   yellow.."[2]"..white.."。",
    Prequest = "特兰雷克",
}
kQuestInstanceData.ZulFarrak.Alliance[4] = {
    Title = "深渊皇冠",
    Level = 46,
    Attain = 40,
    Aim = "将深渊皇冠交给尘泥沼泽的塔贝萨。",
    Location = "塔贝萨 (尘泥沼泽 "..yellow.."46,57"..white..")",
    Note = "水占师维蕾萨 在 "..yellow.."[6]"..white.." 掉落 深渊皇冠。",
    Prequest = "塔贝萨的任务",
    Rewards = {
        Text = "奖励：",
        { id = 9527 }, --Spellshifter Rod Staff
        { id = 9531 }, --Gemshale Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.ZulFarrak.Alliance[5] = {
    Title = "摩沙鲁的预言",
    Level = 47,
    Attain = 40,
    Aim = "将第一块和第二块摩沙鲁石板交给塔纳利斯的叶基亚。",
    Location = "叶基亚 (塔纳利斯 - 热砂港 "..yellow.."66,22"..white..")",
    Note = "你从同一个NPC获得前置任务。\n石板掉落自 殉教者塞卡 "..   yellow.."[2]"..white.." 和 水占师维蕾萨 "..yellow.."[6]"..white.."。",
    Prequest = "尖啸者的灵魂",
    Folgequest = "远古之卵",
}
kQuestInstanceData.ZulFarrak.Alliance[6] = {
    Title = "探水棒",
    Level = 47,
    Attain = 40,
    Aim = "把探水棒交给加基森的首席工程师沙克斯·比格维兹。",
    Location = "首席工程师沙克斯·比格维兹 (塔纳利斯 - 加基森 "..yellow.."52,28"..white..")",
    Note = "你从 布莱中士 那里获得探水棒。神庙事件后你可以在 "..yellow.."[4]"..white.." 找到他。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9533 }, --Masons Fraternity Ring Ring
        { id = 9534 }, --Engineer's Guild Headpiece Head, Leather
    }
}
kQuestInstanceData.ZulFarrak.Alliance[7] = {
    Title = "加兹瑞拉",
    Level = 50,
    Attain = 40,
    Aim = "把加兹瑞拉的鳞片交给闪光平原的维兹尔·铜栓。",
    Location = "维兹尔·铜栓 (千针石林 - 闪光平原 "..yellow.."78,77"..white..")",
    Note = "你从 科罗莫特·钢尺 (丹莫罗 - 诺莫瑞根 "..yellow.."23.6,28"..white..") 获得前置任务。获得 加兹瑞拉 任务不需要有前置任务。\n你在 "..yellow.."[6]"..white.." 使用 祖尔法拉克之槌 召唤 加兹瑞拉。\n神圣之槌 来自 守护者奇尔加 (辛特兰 - 祖尔祭坛 "..yellow.."49,70"..white..") 并且必须在 辛特兰 的祭坛 "..yellow..   "59,77"..white.." 完成后才能在 祖尔法拉克 使用。",
    Prequest = "防撞头盔",
    Rewards = {
        Text = "奖励：",
        { id = 11122 }, --Carrot on a Stick Trinket
    }
}
kQuestInstanceData.ZulFarrak.Alliance[8] = {
    Title = "沙地漂流",
    Level = 46,
    Attain = 40,
    Aim = "前往祖尔法拉克冒险并找到上古巨魔遗骸，然后将它们归还给塔纳利斯南月废墟的汉苏·戈沙。",
    Location = "汉苏·戈沙 (塔纳利斯 "..yellow.."42,73"..white..")",
    Note = "在 巫医祖穆拉赫 "..   yellow.."[3]"..white.." 的房间里，古老的埋葬容器（绿色小木箱）。",
    Rewards = {
        Text = "奖励：",
        { id = 60759 }, --Southmoon Pendant Neck
    }
}
kQuestInstanceData.ZulFarrak.Horde[1] = {
    Title = "蜘蛛之神",
    Level = 45,
    Attain = 40,
    Aim = "阅读塞卡石板，了解枯木巨魔的蜘蛛之神的名字，然后回到加德林大师那里。",
    Location = "加德林大师 (杜隆塔尔 - 森金村 "..yellow.."55,74"..white..")",
    Note = "任务线开始于一个 毒液瓶，它可以在 辛特兰 的巨魔村庄的桌子上找到。\n你在 "..   yellow.."[2]"..white.." 找到石板。",
    Prequest = "毒液瓶 -> 请教加德林大师",
    Folgequest = "召唤沙德拉",
}
for i = 2, 8 do
    kQuestInstanceData.ZulFarrak.Horde[i] = kQuestInstanceData.ZulFarrak.Alliance[i]
end
kQuestInstanceData.ZulFarrak.Horde[9] = {
    Title = "乌克兹·沙顶的尽头",
    Level = 48,
    Attain = 40,
    Aim = "为塔纳利斯沙月村的勇猛的塔扎戈杀死祖尔法拉克内的乌克兹·沙顶和卢兹鲁。",
    Location = "勇猛的塔扎戈 (塔纳利斯 - 沙怒村; 塔纳利斯 东北角, 热砂港 西北)",
    Note = "任务线开始于 先知马泽克 的任务 '沙怒的救赎 I'，位于 沙怒村(塔纳利斯) "..yellow.."59.1,17.1"..   white.."。",
    Prequest = "沙怒的困境",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60764 }, --The Dune Blade Main Hand, Sword
        { id = 60765 }, --Sandmoon Greaves Legs, Mail
    }
}

--------------- Zul'Gurub ---------------
kQuestInstanceData.ZulGurub = {
    Story = {
        ["Page1"] =        "一千多年前，强大的古拉巴什帝国因一场大规模内战而四分五裂。一个有影响力的巨魔祭司组织——阿塔拉伊（阿塔拉伊）召唤出了古老而恐怖的血神哈卡（哈卡（血灵者） ）的化身。尽管祭司们被击败并最终被流放，伟大的巨魔帝国仍然崩溃。被流放的祭司们逃往北方的悲伤沼泽，在那里他们建造了一座巨大的哈卡神庙，以准备他进入凡间。",
        ["Page2"] =        "随着时间推移，阿塔拉伊祭司们发现哈卡的实体只能在古拉巴什帝国的古都祖尔格拉布（祖尔法拉克）被召唤。遗憾的是，祭司们最近在召唤哈卡的任务中取得了成功——报告证实了这位可怕的血神已出现在古拉巴什废墟的中心。\n\n为了平息这位血神，土地上的巨魔们联手派遣了一支高阶祭司小队进入古城。每位祭司都是原始之神——蝙蝠、豹、虎、蜘蛛和蛇——的强大冠军，但尽管他们竭尽全力，仍被哈卡的力量所控制。如今，这些冠军及其原始之神的化身为血神提供了强大的力量。任何敢于踏入这座阴森废墟的冒险者，都必须击败高阶祭司，才能有希望面对这位强大的血神。",
        ["MaxPages"] = "2",
    },
    Caption = {
        "祖尔古鲁布",
        "祖尔古鲁布 (第2页)",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ZulGurub.Alliance[1] = {
    Title = "祭司的头颅",
    Level = 60,
    Attain = 58,
    Aim = "将神圣之索穿上5颗导魔师的头颅，然后把这一串头颅交给尤亚姆巴岛上的伊克萨尔。",
    Location = "伊克萨尔 (荆棘谷 - 尤亚姆巴岛 "..yellow.."15,15"..white..")",
    Note = "确保收集所有祭司的掉落",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 20213 }, --Belt of Shrunken Heads Waist, Plate
        { id = 20215 }, --Belt of Shriveled Heads Waist, Mail
        { id = 20216 }, --Belt of Preserved Heads Waist, Leather
        { id = 20217 }, --Belt of Tiny Heads Waist, Cloth
    }
}
kQuestInstanceData.ZulGurub.Alliance[2] = {
    Title = "哈卡之心",
    Level = 60,
    Attain = 58,
    Aim = "把哈卡之心交给尤亚姆巴岛上的莫托尔。",
    Location = "哈卡之心 (掉落自 哈卡 "..yellow.."[11]"..white..")",
    Note = "莫托尔 (荆棘谷 - 尤亚姆巴岛 "..yellow.."15,15"..white..")",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 19948 }, --Zandalarian Hero Badge Trinket
        { id = 19950 }, --Zandalarian Hero Charm Trinket
        { id = 19949 }, --Zandalarian Hero Medallion Trinket
    }
}
kQuestInstanceData.ZulGurub.Alliance[3] = {
    Title = "纳特的卷尺",
    Level = 60,
    Attain = 58,
    Aim = "将纳特的卷尺交给尘泥沼泽的纳特·帕格。",
    Location = "破损的渔具箱 (祖尔格拉布 - 哈卡之岛 东北水边)",
    Note = "纳特·帕格 位于 尘泥沼泽 ("..yellow.."59,60"..   white..")。完成任务后，你可以从 纳特·帕格 那里购买 臭泥鱼诱饵，用于在 祖尔格拉布 召唤 加兹兰卡。",
}
kQuestInstanceData.ZulGurub.Alliance[4] = {
    Title = "完美的毒药",
    Level = 60,
    Attain = 60,
    Aim = "塞纳里奥要塞的德尔克·雷木让你把温诺希斯的毒囊和库林纳克斯的毒囊交给他。",
    Location = "德尔克·雷木 (希利苏斯 - 塞纳里奥要塞 "..yellow.."52,39"..white..")",
    Note = "温诺希斯的毒囊 掉落自 "..yellow.."祖尔格拉布"..white.." 的 高阶祭司温诺希斯，位于 "..yellow.."[2]"..white.."。 库林纳克斯的毒囊 掉落自 "..yellow.."安其拉废墟"..white.." 的 "..yellow.."[1]"..white..   "。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 22378 }, --Ravenholdt Slicer One-Hand, Sword
        { id = 22379 }, --Shivsprocket's Shiv Main Hand, Dagger
        { id = 22377 }, --The Thunderwood Poker One-Hand, Dagger
        { id = 22348 }, --Doomulus Prime Two-Hand, Mace
        { id = 22347 }, --Fahrad's Reloading Repeater Crossbow
        { id = 22380 }, --Simone's Cultivating Hammer Main Hand, Mace
    }
}
for i = 1, 4 do
    kQuestInstanceData.ZulGurub.Horde[i] = kQuestInstanceData.ZulGurub.Alliance[i]
end

--------------- Gnomeregan ---------------
kQuestInstanceData.Gnomeregan = {
    Story = "位于丹莫罗，被称为诺莫瑞根的技术奇迹数代以来一直是侏儒的首都。最近，一个敌对的变异石腭怪种族侵扰了丹莫罗的几个地区——包括伟大的侏儒城市。在绝望地试图摧毁入侵的石腭怪时，大工匠梅卡托克下令紧急排放城市的放射性废物罐。几个侏儒在等待石腭怪死亡或逃跑时寻求庇护免受空气传播的污染物。不幸的是，尽管石腭怪因有毒攻击而被辐射——他们的围攻继续不减。那些没有被有毒渗漏杀死的侏儒被迫逃离，在附近的矮人城市铁炉堡寻求避难。在那里，大工匠梅卡托克开始招募勇敢的灵魂来帮助他的人民夺回他们心爱的城市。有传言称梅卡托克曾经信任的顾问，工程师瑟玛普拉格，通过允许入侵发生背叛了他的人民。现在，他的理智破碎，瑟玛普拉格留在诺莫瑞根——推进他的黑暗阴谋并充当城市的新技术霸主。",
    Caption = "诺莫瑞根",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Gnomeregan.Alliance[1] = {
    Title = "拯救尖端机器人！",
    Level = 26,
    Attain = 20,
    Aim = "将尖端机器人的存储器核心交给诺莫瑞根复兴城的工匠大师欧沃斯巴克。",
    Location = "工匠大师欧沃斯巴克 (丹莫罗 - 诺莫瑞根复兴城 "..yellow.."24.4,29.8"..white..")",
    Note = "前置任务来自 萨尔努修士 (暴风城 - 教堂广场 "..yellow.."40,30"..white..")。\n你在进入副本之前的后门附近找到 尖端机器人，位于 "..   yellow.."[4] 在 入口地图"..white.."。",
    Prequest = "工匠大师欧沃斯巴克",
}
kQuestInstanceData.Gnomeregan.Alliance[2] = {
    Title = "诺恩",
    Level = 27,
    Attain = 20,
    Aim = "用空铅瓶对着辐射入侵者或者辐射抢劫者，从它们身上收集放射尘。瓶子装满之后，把它交给卡拉诺斯的奥齐·电环。",
    Location = "奥齐·电环 (丹莫罗 - 卡拉诺斯 "..yellow.."45,49"..white..")",
    Note = "前置任务来自 诺恩 (丹莫罗 - 诺莫瑞根复兴城 "..yellow.."24.5,30.4"..white..")。\n要获得辐射尘，你必须对 "..   red.."活着"..white.." 的 辐射入侵者 或 辐射抢劫者 使用铅瓶。",
    Prequest = "灾难之后",
    Folgequest = "更多的辐射尘！",
}
kQuestInstanceData.Gnomeregan.Alliance[3] = {
    Title = "更多的辐射尘！",
    Level = 30,
    Attain = 20,
    Aim = "到诺莫瑞根去收集高强度辐射尘。要多加小心，这种辐射尘非常不稳定，很快就会分解。$B$B奥齐要求你把沉重的铅瓶也交给他。",
    Location = "奥齐·电环 (丹莫罗 - 卡拉诺斯 "..yellow.."45,49"..white..")",
    Note = "要获得辐射尘，你必须对 "..red.."活着"..white.." 的 辐射软泥怪 或 恐魔 使用铅瓶。",
    Prequest = "诺恩",
}
kQuestInstanceData.Gnomeregan.Alliance[4] = {
    Title = "陀螺式挖掘机",
    Level = 30,
    Attain = 20,
    Aim = "收集24副机械内胆，把它们交给暴风城的舒尼。",
    Location = "肖尼沉默者 (暴风城 - 矮人区 "..yellow.."55,12"..white..")",
    Note = "所有机器人都可能掉落 机械内胆。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9608 }, --Shoni's Disarming Tool Off Hand, Axe
        { id = 9609 }, --Shilly Mitts Hands, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[5] = {
    Title = "基础模组",
    Level = 30,
    Attain = 24,
    Aim = "收集12个基础模组，把它们交给诺莫瑞根复兴城的科劳莫特·钢尺。",
    Location = "科罗莫特·钢尺 (丹莫罗 - 诺莫瑞根复兴城 "..yellow.."23.6,28"..white..")",
    Note = "前置任务来自 玛希尔 (达纳苏斯 - 战士区 "..   yellow.."59,45"..white..   ")。 前置任务只是一个指引任务，不需要完成此任务。\n基础模组 来自散布在副本各处的机器。",
    Prequest = "帮助科劳莫特",
}
kQuestInstanceData.Gnomeregan.Alliance[6] = {
    Title = "抢救数据",
    Level = 30,
    Attain = 25,
    Aim = "将彩色穿孔卡片交给在丹莫罗的诺莫瑞根复兴城的大机械师卡斯派普。",
    Location = "大机械师卡斯派普 (丹莫罗 - 诺莫瑞根复兴城 "..yellow.."24.1,29.8"..white..")",
    Note = "前置任务来自 加克希姆·尘链 (石爪山脉 "..yellow.."59,67"..white..")。 前置任务只是一个指引任务，不需要完成此任务。\n白色穿孔卡片是随机掉落的。你在进入副本之前的后门入口旁边找到第一个终端，位于 "..yellow.."[3] 在 入口地图"..white.."。 3005-B 位于 "..yellow.."[3]"..white..   "， 3005-C 位于 "..yellow.."[5]"..white.." ， 3005-D 位于 "..yellow.."[6]"..white.."。",
    Prequest = "卡斯派普的任务",
    Rewards = {
        Text = "奖励：",
        { id = 9605 }, --Repairman's Cape Back
        { id = 9604 }, --Mechanic's Pipehammer Two-Hand, Mace
    }
}
kQuestInstanceData.Gnomeregan.Alliance[7] = {
    Title = "一团混乱",
    Level = 30,
    Attain = 24,
    Aim = "将克努比护送到出口，然后向藏宝海湾的斯库提汇报。",
    Location = "克努比 (诺莫瑞根 "..yellow.."[3]"..white..")",
    Note = "护送任务！你可以在 荆棘谷 - 藏宝海湾 ("..yellow.."27,77"..white..") 找到 斯库提。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[8] = {
    Title = "大叛徒",
    Level = 35,
    Attain = 25,
    Aim = "到诺莫瑞根去杀掉制造者瑟玛普拉格。完成任务之后向大工匠梅卡托克报告。",
    Location = "大工匠梅卡托克 (丹莫罗 - 诺莫瑞根复兴城 "..yellow.."24.2,29.7"..white..")",
    Note = "你在 "..yellow.."[8]"..white.." 找到 瑟玛普拉格。他是 诺莫瑞根 的最后一个首领。\n在战斗中，你必须通过按下侧面的按钮来禁用柱子。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Alliance[9] = {
    Title = "脏兮兮的戒指",
    Level = 34,
    Attain = 28,
    Aim = "想方法把脏兮兮的戒指弄干净。",
    Location = "脏兮兮的戒指 (random 掉落自 诺莫瑞根)",
    Note = "戒指可以在 "..   yellow.."[2]"..white.." 的清洁室里的 超级清洁器5200型 处清洗。",
    Folgequest = "戒指归来",
}
kQuestInstanceData.Gnomeregan.Alliance[10] = {
    Title = "戒指归来",
    Level = 34,
    Attain = 28,
    Aim = "你要么自己留着这枚戒指，要么就按照戒指内侧刻着的名字找到它的主人。",
    Location = "闪亮的金戒指 (obtained from 脏兮兮的戒指 quest)",
    Note = "交给 塔瓦斯德·基瑟尔 (铁炉堡 - 秘法区 "..   yellow.."36,3"..white..")。升级戒指的后续任务是可选的。",
    Prequest = "脏兮兮的戒指",
    Folgequest = "侏儒的手艺",
    Rewards = {
        Text = "奖励：",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Alliance[11] = {
    Title = "一个沉重的大脑",
    Level = 30,
    Attain = 30,
    Aim = "寻找一位能够弄清楚如何处理主机的人。",
    Location = "完整的重击者主机",
    Note = "开始任务的 完整的重击者主机 可以掉落自 群体打击者9-60 "..   yellow.."[6]"..white.." (低几率)。\n"..red.."仅限拥有 125+ 技能的工程师。",
    Folgequest = "建造一个重击者",
}
kQuestInstanceData.Gnomeregan.Alliance[12] = {
    Title = "高能调节器",
    Level = 33,
    Attain = 25,
    Aim = "找到诺莫瑞根内的结构图：高能调节器，并将其交给丹莫罗诺莫瑞根复兴城的威赞·小齿轮。",
    Location = "威赞·小齿轮 (丹莫罗 - 诺莫瑞根复兴城 "..yellow.."[25.2,31.6]"..white..")",
    Note = "结构图：高能调节器 在 "..   yellow.."[3]"..white.." 东南角下层南厅的桌子上 "..yellow.."[a]"..white.."。",
    Rewards = {
        Text = "奖励：",
        { id = 61393 }, --Low Energy Regulator Trinket
    }
}
kQuestInstanceData.Gnomeregan.Alliance[13] = {
    Title = "备份系统激活",
    Level = 33,
    Attain = 25,
    Aim = "为丹莫罗的技术大师维尔斯班纳激活诺莫瑞根深处的Alpha通道阀和备用的油泵杠杆。",
    Location = "技术大师维尔斯班纳 (丹莫罗 - 诺莫瑞根复兴城 "..yellow.."[26.8,31.1]"..white..")",
    Note = "阿尔法通道阀 在 "..yellow.."[6]"..white.."，使用电梯下去。中央机械装置的南侧。\n备用油泵通道杠杆 在 "..   yellow.."[b]"..white.." 的地板上。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61383 }, --Intricate Gnomish Blunderbuss Gun
        { id = 61384 }, --Ionized Metal Grips Hands, Mail
        { id = 61385 }, --Magnetic Band Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[1] = {
    Title = "出发！诺莫瑞根！",
    Level = 35,
    Attain = 20,
    Aim = "等斯库提调整好地精传送器。",
    Location = "斯库提 (荆棘谷 - 藏宝海湾 "..yellow.."27,77"..white..")",
    Note = "前置任务来自 索维克 (奥格瑞玛 - 荣誉谷 "..   yellow.."75,25"..white..")。\n当你完成此任务后，你可以使用 藏宝海湾 的传送器。",
    Prequest = "主工程师斯库提",
}
kQuestInstanceData.Gnomeregan.Horde[2] = {
    Title = "一团混乱",
    Level = 30,
    Attain = 24,
    Aim = "将克努比护送到出口，然后向藏宝海湾的斯库提汇报。",
    Location = "克努比 (诺莫瑞根 "..yellow.."[3]"..white..")",
    Note = "护送任务！你可以在 荆棘谷 - 藏宝海湾 ("..yellow.."27,77"..white..") 找到 斯库提。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Horde[3] = {
    Title = "设备之战",
    Level = 35,
    Attain = 25,
    Aim = "从诺莫瑞根拿到钻探设备蓝图和瑟玛普拉格的保险箱密码，把它们交给奥格瑞玛的诺格。",
    Location = "诺格 (奥格瑞玛 - Valley of Honor "..yellow.."75,25"..white..")",
    Note = "你在 "..yellow.."[8]"..white.." 找到 瑟玛普拉格。他是 诺莫瑞根 的最后一个首领。\n在战斗中，你必须通过按下侧面的按钮来禁用柱子。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Horde[4] = {
    Title = "脏兮兮的戒指",
    Level = 34,
    Attain = 28,
    Aim = "想方法把脏兮兮的戒指弄干净。",
    Location = "脏兮兮的戒指 (random 掉落自 诺莫瑞根)",
    Note = "戒指可以在 "..   yellow.."[2]"..white.." 的清洁室里的 超级清洁器5200型 处清洗。",
    Folgequest = "戒指归来",
}
kQuestInstanceData.Gnomeregan.Horde[5] = {
    Title = "戒指归来",
    Level = 34,
    Attain = 28,
    Aim = "你要么自己留着这枚戒指，要么就按照戒指内侧刻着的名字找到它的主人。",
    Location = "闪亮的金戒指 (obtained from 脏兮兮的戒指 quest)",
    Note = "交给 诺格 (奥格瑞玛 - 荣誉谷 "..   yellow.."75,25"..white..")。升级戒指的后续任务是可选的。",
    Prequest = "脏兮兮的戒指",
    Folgequest = "诺格的手艺",
    Rewards = {
        Text = "奖励：",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[6] = {
    Title = "一个沉重的大脑",
    Level = 30,
    Attain = 30,
    Aim = "寻找一位能够弄清楚如何处理主机的人。",
    Location = "完整的重击者主机",
    Note = "开始任务的 完整的重击者主机 可以掉落自 群体打击者9-60 "..   yellow.."[6]"..white.." (低几率)。\n"..red.."仅限拥有 125+ 技能的工程师。",
    Folgequest = "建造一个重击者",
}
kQuestInstanceData.Gnomeregan.Horde[7] = {
    Title = "后备电源",
    Level = 34,
    Attain = 29,
    Aim = "将诺莫瑞根的百万瓦电容器带给技术员格瑞姆兹鲁。",
    Location = "技术员格瑞姆兹鲁 (杜隆塔尔 - 怒水港 "..yellow.."57.4,25.7"..white..").",
    Note = "前置任务 '马尔科维奇教授' 开始于 技术员斯帕兹奥(杜隆塔尔 - 怒水港 "..yellow.."57.4,25.8"..white..")，等级 7。\n百万瓦电容器 掉落自 制造者瑟玛普拉格。你在 "
        ..yellow.."[8]"..white.." 找到 制造者瑟玛普拉格。他是 诺莫瑞根 的最后一个首领。\n在战斗中，你必须通过按下侧面的按钮来禁用柱子。",
    Prequest = "马尔科维奇教授",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 81319 }, --Razorblade Buckler Shield
        { id = 81320 }, --Crackling Zapper Wand
    }
}

--------------- Dragons of Nightmare ---------------
kQuestInstanceData.FourDragons = {
    Story = {
        ["Page1"] = "在伟大之树处出现了动荡。一股新威胁正威胁着位于灰谷、暮色森林、费拉斯和辛特兰的这些偏僻地区。四位来自梦境的绿龙军团伟大守护者降临，但这些曾经骄傲的守护者如今只追求毁灭与死亡。与同伴一起武装起来，前往这些隐藏的林地——只有你们能够保卫艾泽拉斯免受它们带来的腐化。",
        ["Page2"] = "伊瑟拉，伟大的梦境之龙领主，统领神秘的绿龙军团。她的领地是奇幻而神秘的翡翠梦境——据说她从那里指引着世界本身的进化之路。她是自然与想象的守护者，职责是守护遍布世界的所有伟大之树，只有德鲁伊能够借此进入梦境。近来，伊瑟拉最信任的副官们被翡翠梦境中的一股黑暗新力量扭曲。如今这些迷失的哨兵穿过伟大之树进入艾泽拉斯，企图在凡人王国中散布疯狂与恐怖。即便是最强大的冒险者，也应明智地与这些龙保持距离，否则将承受其误导之怒的后果。",
        ["Page3"] = "雷索恩在翡翠梦境的畸变中受到侵染，不仅使这条强大龙的鳞片颜色黯淡，还赋予他从敌人身上提取恶意阴影的能力。与其主人的阴影结合后，这些阴影为龙注入治愈能量。因此，雷索恩被视为伊瑟拉最强大的迷失副官之一并不令人惊讶。",
        ["Page4"] = "翡翠梦境中神秘的黑暗力量将曾经雄伟的埃米尔斯变成了腐烂、疾病缠身的怪物。少数幸存于与其交锋的冒险者报告称，腐烂的蘑菇从死去同伴的尸体中喷涌而出，场面骇人。埃米尔斯无疑是伊瑟拉最离经叛道的绿龙中最残忍、最令人毛骨悚然的存在。",
        ["Page5"] = "塔亚雷可能是伊瑟拉最受影响的叛逆副官。他与翡翠梦境中的黑暗力量交互，导致塔亚雷的理智以及实体形态崩溃。如今这条龙以幽灵形态存在，能够分裂为多个实体，每个实体都拥有毁灭性的魔法力量。塔亚雷是狡诈且毫不留情的敌人，意图将其存在的疯狂化为现实，侵扰艾泽拉斯的居民。",
        ["Page6"] = "伊森德雷曾是伊瑟拉最信任的副官之一，如今却背离阵营，在艾泽拉斯大地上播撒恐惧与混乱。她原本仁慈的治愈力量已被黑暗魔法取代，使她能够释放炽热的闪电波并召唤恶魔德鲁伊的援助。伊森德雷及其同族还拥有诱导沉睡的能力，将不幸的凡人敌人送入他们最恐怖的噩梦之境。",
        ["MaxPages"] = "6",
    },
    Caption = {
        "噩梦之龙",
        "伊瑟拉与绿龙军团",
        "雷索恩",
        "埃米尔斯",
        "塔亚雷",
        "伊森德雷",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.FourDragons.Alliance[1] = {
    Title = "梦魇的缠绕",
    Level = 60,
    Attain = 60,
    Aim = "寻找能解读梦魇包裹的物品中所隐藏的信息的人。$B$B或许拥有强大力量的德鲁伊可以帮助你。",
    Location = "梦魇包裹的物品 (掉落自 艾莫莉丝, 泰拉尔, 雷索 或 伊森德雷)",
    Note = "任务交给守护者雷姆洛斯（月光林地 - 雷姆洛斯神殿 "..yellow.."36,41"..white.."）。列出的奖励是后续任务的。",
    Folgequest = "唤醒传说",
    Rewards = {
        Text = "奖励：",
        { id = 20600 }, --Malfurion's Signet Ring Ring
    }
}
kQuestInstanceData.FourDragons.Horde[1] = kQuestInstanceData.FourDragons.Alliance[1]

--------------- Azuregos ---------------
kQuestInstanceData.Azuregos = {
    Story = "在大灾变之前，暗夜精灵城市艾达拉斯在现在被称为艾萨拉的土地上繁荣发展。据信许多古老而强大的上层精灵神器可能在曾经强大的据点废墟中被发现。无数代以来，蓝龙军团一直守护着强大的神器和魔法知识，确保它们不落入凡人手中。蓝龙艾索雷葛斯的存在似乎暗示，极其重要的物品，也许是传说中的永恒之瓶本身，可能在艾萨拉的荒野中被发现。无论艾索雷葛斯在寻找什么，有一件事是确定的：他将战斗至死以保卫艾萨拉的魔法宝藏。",
    Caption = "艾索雷葛斯",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Azuregos.Alliance[1] = {
    Title = "龙筋箭袋",
    Level = 60,
    Attain = 60,
    Aim = "费伍德森林的古树哈斯塔特要求你带回一块成年蓝龙的肌腱。",
    Location = "古树哈斯塔特 (费伍德森林 - 铁木森林 "..yellow.."48,24"..white..")",
    Note = red.."猎人限定"..white..": 击杀艾索雷葛斯以获得成年蓝龙的肌腱。他在艾萨拉南部半岛中部"..yellow.."[1]"..white.."附近游荡。",
    Prequest = "远古石叶 ("..yellow.."Molten Core"..white..")", -- 7632",
    Rewards = {
        Text = "奖励：",
        { id = 18714 }, --Ancient Sinew Wrapped Lamina Quiver
    }
}
kQuestInstanceData.Azuregos.Alliance[2] = {
    Title = "艾索雷葛斯的魔法账本",
    Level = 60,
    Attain = 60,
    Aim = "把魔法账本交给塔纳利斯的纳瑞安。",
    Location = "艾索雷葛斯之魂 (艾萨拉 "..yellow.."56,83"..white..")",
    Note = "你可以在塔纳利斯"..yellow.."65.17"..white.."找到纳瑞安。",
    Prequest = "巨龙军团的指控",
    Folgequest = "翻译龙语",
}
kQuestInstanceData.Azuregos.Horde[1] = kQuestInstanceData.Azuregos.Alliance[1]
kQuestInstanceData.Azuregos.Horde[2] = kQuestInstanceData.Azuregos.Alliance[2]

--------------- Lord Kazzak ---------------
kQuestInstanceData.LordKazzak = {
    Story = "在第三次战争结束时击败燃烧军团后，剩余的敌军在巨大的恶魔领主卡扎克的带领下撤退到诅咒之地。他们至今仍居住在那里一个叫做污染之痕的地区，等待着黑暗之门的重新开启。有传言称，一旦传送门重新开启，卡扎克将带着他的残余部队前往外域。外域曾经是兽人的故乡德拉诺，被兽人萨满耐奥祖创造的几个传送门同时激活而撕裂，现在作为一个破碎的世界存在，被暗夜精灵叛徒伊利丹指挥下的大批恶魔代理人占据。",
    Caption = "卡扎克",
    Alliance = {},
    Horde = {}
}

--------------- Alterac Valley ---------------
kQuestInstanceData.BGAlteracValleyNorth = {
    Story = "很久以前，在第一次战争之前，术士古尔丹将一个名为霜狼的兽人氏族流放到奥特拉克山脉深处的一个隐秘山谷。霜狼氏族就在这个山谷的南部地区勉强度日，直到萨尔的到来。\n在萨尔成功地统一了各个氏族之后，霜狼氏族，现在由兽人萨满德雷克塔尔领导，选择留在他们长期以来称之为家园的山谷。然而，最近，霜狼氏族相对平静的生活受到了矮人风暴之峰远征队的挑战。\n风暴之峰远征队在山谷中安营扎寨，寻找自然资源和古代遗迹。尽管他们的意图如此，矮人的存在却与南方的霜狼兽人引发了激烈的冲突，霜狼兽人发誓要将这些入侵者赶出他们的土地。",
    Caption = "奥特兰克山谷",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[1] = {
    Title = "国王的命令",
    Level = 60,
    Attain = 51,
    Aim = "到希尔斯布莱德丘陵地区的奥特兰克山谷去。到那里之后，和哈格丁中尉谈谈。$B$B为了铜须的荣耀！",
    Location = "洛泰姆中尉 (铁炉堡 - 公共区 "..yellow.."30,62"..white..")",
    Note = "哈格丁中尉在奥特兰克山脉 "..yellow.."39,81"..white.."。",
    Folgequest = "实验场",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[2] = {
    Title = "实验场",
    Level = 60,
    Attain = 51,
    Aim = "到主基地东南边的蛮爪洞穴中去找到霜狼军旗，然后把它交给战争大师拉格隆德。",
    Location = "哈格丁中尉 (奥特兰克山脉 "..yellow.."39,81"..white..")",
    Note = "雷矛军旗 在 奥特兰克山谷 - 北 地图的 冰翼洞穴 "..yellow.."[11]"..white.." 处。每当你获得新的声望等级时，与同一个NPC交谈以获得升级的徽章。\n\n前置任务不是获得此任务所必需的，但它确实提供约 9550 点经验值。",
    Prequest = "国王的命令",
    Folgequest = "崭露头角 -> 命令之眼",
    Rewards = {
        Text = "奖励：",
        { id = 17691 }, --Stormpike Insignia Rank 1 Trinket
        { id = 19484 }, --The Frostwolf Artichoke Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[3] = {
    Title = "奥特兰克的战斗",
    Level = 60,
    Attain = 51,
    Aim = "进入奥特兰克山谷，击败部落将军德雷克塔尔。然后回到勘查员塔雷·石镐那里。",
    Location = "勘察员塔雷·石镐 (奥特兰克山脉 "..yellow.."41,80"..white..   ") 和\n(奥特兰克山谷 - 北 "..yellow.."[B]"..white..")",
    Note = "德雷克塔尔 在 (奥特兰克山谷 - 南 "..yellow.."[B]"..white..")。实际上不需要杀死他来完成任务。只需要你的一方以任何方式赢得战场。\n交还此任务后，再次与NPC交谈以获得奖励。",
    Folgequest = "雷矛英雄",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 19107 }, --Bloodseeker Crossbow
        { id = 19106 }, --Ice Barbed Spear Polearm
        { id = 19108 }, --Wand of Biting Cold Wand
        { id = 20648 }, --Cold Forged Hammer Main Hand, Mace
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[4] = {
    Title = "军需官",
    Level = 60,
    Attain = 51,
    Aim = "与雷矛军需管谈一谈。",
    Location = "巡山人布比罗 (奥特兰克山谷 - 北 "..yellow.."附近 [3] 桥前"..white..")",
    Note = "雷矛军需官 在 (奥特兰克山谷 - 北 "..yellow.."[7]"..white..") 并提供更多任务。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[5] = {
    Title = "冷齿矿洞的补给",
    Level = 60,
    Attain = 51,
    Aim = "把10份冷齿矿洞补给品交给霜狼要塞的部落军需官。",
    Location = "雷矛军需官 (奥特兰克山谷 - 北 "..yellow.."[7]"..white..")",
    Note = "补给品可以在 (奥特兰克山谷 - 南 "..yellow.."[6]"..white..") 的 冷齿矿洞 中找到。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[6] = {
    Title = "深铁矿洞的补给",
    Level = 60,
    Attain = 51,
    Aim = "把10份深铁矿洞补给品交给丹巴达尔的联盟军需官。",
    Location = "雷矛军需官 (奥特兰克山谷 - 北 "..yellow.."[7]"..white..")",
    Note = "补给品可以在 (奥特兰克山谷 - 北 "..yellow.."[1]"..white..") 的 深铁矿洞 中找到。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[7] = {
    Title = "护甲碎片",
    Level = 60,
    Attain = 51,
    Aim = "给丹巴达尔的莫高特·深炉带去20块护甲碎片。",
    Location = "莫高特·深炉 (奥特兰克山谷 - 北 "..yellow.."[4]"..white..")",
    Note = "从敌方玩家的尸体上搜刮碎片。后续任务是相同的任务，但是可重复的。",
    Folgequest = "护甲碎片",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[8] = {
    Title = "占领矿洞",
    Level = 60,
    Attain = 51,
    Aim = "占领一座还没有被雷矛部族控制的矿洞，然后向丹巴达尔的雷矛军需官复命。",
    Location = "杜尔根·雷矛 (奥特兰克山脉 "..yellow.."37,77"..white..")",
    Note = "要完成任务，你必须在部落控制矿洞时杀死 (奥特兰克山谷 - 北 "..yellow.."[1]"..   white..") 深铁矿洞 中的 莫洛克 或 (奥特兰克山谷 - 南 "..   yellow.."[6]"..white..") 冷齿矿洞 中的 工头斯尼维尔。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[9] = {
    Title = "哨塔和碉堡",
    Level = 60,
    Attain = 51,
    Aim = "占领敌方的某座哨塔，然后向霜狼村的提卡·血牙复命。",
    Location = "杜尔根·雷矛 (奥特兰克山脉 "..yellow.."37,77"..white..")",
    Note = "据报道，实际上不需要摧毁哨塔或碉堡来完成任务，只需要攻击。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[10] = {
    Title = "奥特兰克山谷的墓地",
    Level = 60,
    Attain = 51,
    Aim = "占领一座墓地，然后向丹巴达尔的诺雷格·雷矛中尉复命。",
    Location = "杜尔根·雷矛 (奥特兰克山脉 "..yellow.."37,77"..white..")",
    Note = "据报道，你不需要做任何事情，只需在联盟攻击墓地时身处墓地附近即可。它不需要被占领，只需被攻击。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[11] = {
    Title = "补充坐骑",
    Level = 60,
    Attain = 51,
    Aim = "找到奥特兰克山谷中的霜狼。使用霜狼口套来驯服它们。被驯服的霜狼会跟随你回到兽栏管理员那里，然后与兽栏管理员谈话以获得你的奖励。",
    Location = "雷矛兽栏管理员 (奥特兰克山谷 - 北 "..yellow.."[6]"..white..")",
    Note = "你可以在基地外面找到一只山羊。驯服过程就像猎人驯服宠物一样。每个战场每个玩家或玩家组可以重复此任务最多25次。驯服25只山羊后，雷矛骑兵将抵达战场协助作战。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[12] = {
    Title = "山羊坐具",
    Level = 60,
    Attain = 51,
    Aim = "你必须攻击我们敌人的基地，杀死他们用作坐骑的霜狼，并取下它们的皮。把它们的皮带回来给我，这样就可以为骑兵制作挽具了。去吧！",
    Location = "雷矛山羊骑兵指挥官 (奥特兰克山谷 - 北 "..yellow.."[6]"..white..")",
    Note = "霜狼可以在奥特兰克山谷的南部地区找到。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[13] = {
    Title = "水晶簇",
    Level = 60,
    Attain = 51,
    Aim = "有时你可能会陷入长达数天或数周的战斗。在这些长时间的活动中，你可能会收集到大量的霜狼风暴水晶。\n\n议会接受此类供奉",
    Location = "大德鲁伊雷弗拉尔 (奥特兰克山谷 - 北 "..yellow.."[2]"..white..")",
    Note = "交还大约 200 个水晶后，大德鲁伊雷弗拉尔 将开始走向 (奥特兰克山谷 - 北 "..yellow.."[19]"..white..")。到达那里后，她将开始一个召唤仪式，需要 10 人协助。如果成功，森林之王伊弗斯 将被召唤来协助战斗。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[14] = {
    Title = "森林之王伊弗斯",
    Level = 60,
    Attain = 51,
    Aim =    "霜狼氏族受到元素能量的腐蚀保护。他们的萨满祭司干预的力量，如果不加以制止，必将毁灭我们所有人。\n\n霜狼士兵携带着一种名为风暴水晶的元素护符。我们可以利用这些护符召唤伊弗斯。出发去夺取这些水晶吧。",
    Location = "大德鲁伊雷弗拉尔 (奥特兰克山谷 - 北 "..yellow.."[2]"..white..")",
    Note = "交还大约 200 个水晶后，大德鲁伊雷弗拉尔 将开始走向 (奥特兰克山谷 - 北 "..yellow.."[19]"..white..")。到达那里后，她将开始一个召唤仪式，需要 10 人协助。如果成功，森林之王伊弗斯 将被召唤来协助战斗。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[15] = {
    Title = "天空的召唤—斯里多尔的空军",
    Level = 60,
    Attain = 51,
    Aim =
    "我的狮鹫已经准备好攻击前线，但在前线兵力减少之前无法发动攻击。\n\n负责守卫前线的霜狼战士胸前自豪地佩戴着服役勋章。从他们腐烂的尸体上扯下那些勋章带回来给我。\n\n一旦前线兵力足够稀薄，我就会呼叫空中支援！死神从天而降！",
    Location = "空军指挥官斯里多尔 (奥特兰克山谷 - 北 "..yellow.."[8]"..white..")",
    Note = "杀死部落NPC以获得 部落士兵的勋章。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[16] = {
    Title = "天空的召唤—维波里的空军",
    Level = 60,
    Attain = 51,
    Aim =
    "必须解决守卫防线的精锐霜狼部队，士兵！我把削减那群野蛮人的任务交给你。带回他们的中尉和军团士兵的勋章给我。当我觉得已经解决了足够多的乌合之众时，我会部署空袭。",
    Location = "空军指挥官维波里 (奥特兰克山谷 - 北 "..yellow.."[8]"..white..")",
    Note = "杀死部落NPC以获得 部落士官的勋章。",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[17] = {
    Title = "天空的召唤—艾克曼的空军",
    Level = 60,
    Attain = 51,
    Aim = "回到战场，直击霜狼指挥部的核心。干掉他们的指挥官和守卫者。尽可能多地把他们的勋章塞进你的背包带回来给我！我向你保证，当我的狮鹫看到战利品并闻到我们敌人的鲜血时，它们会再次飞翔！现在就去！",
    Location = "空军指挥官艾克曼 (奥特兰克山谷 - 北 "..yellow.."[8]"..white..")",
    Note = "杀死部落NPC以获得 霜狼指挥官的勋章。交还 50 个后，空军指挥官艾克曼 要么会派一只狮鹫攻击部落基地，要么会给你一个信标种植在 落雪墓地。如果信标被保护得足够久，一只狮鹫会来保卫它。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[1] = {
    Title = "保卫霜狼氏族",
    Level = 60,
    Attain = 51,
    Aim = "到希尔斯布莱德丘陵地区的奥特兰克山谷去。找到拉格隆德并和他谈谈，然后成为霜狼氏族的士兵。",
    Location = "霜狼大使 (奥格瑞玛 - 力量谷 "..yellow.."50,71"..white..")",
    Note = "战争大师拉格隆德 在 (奥特兰克山脉 "..yellow.."62,59"..white..")。",
    Folgequest = "实验场",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[2] = {
    Title = "实验场",
    Level = 60,
    Attain = 51,
    Aim = "到主基地东南边的蛮爪洞穴中去找到霜狼军旗，然后把它交给战争大师拉格隆德。",
    Location = "战争大师拉格隆德 (奥特兰克山脉 "..yellow.."62,59"..white..")",
    Note = "霜狼军旗 在 (奥特兰克山谷 - 南 "..yellow.."[9]"..white..") 的 蛮爪洞穴 中。每当你获得新的声望等级时，与同一个NPC交谈以获得升级的徽章。\n\n前置任务不是获得此任务所必需的，但它确实提供约 9550 点经验值。",
    Prequest = "保卫霜狼氏族",
    Folgequest = "崭露头角 -> 命令之眼",
    Rewards = {
        Text = "奖励：",
        { id = 17690 }, --Frostwolf Insignia Rank 1 Trinket
        { id = 19483 }, --Peeling the Onion Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[3] = {
    Title = "为奥特兰克而战",
    Level = 60,
    Attain = 51,
    Aim = "进入奥特兰克山谷，击败矮人将军范达尔·雷矛。然后回到沃加·死爪那里。",
    Location = "沃加·死爪 (奥特兰克山脉 "..yellow.."64,60"..white..")",
    Note = "范达尔·雷矛 在 (奥特兰克山谷 - 北 "..yellow.."[B]"..white..")。实际上不需要杀死他来完成任务。只需要你的一方以任何方式赢得战场。\n交还此任务后，再次与NPC交谈以获得奖励。",
    Folgequest = "霜狼英雄",
    Rewards = kQuestInstanceData.BGAlteracValleyNorth.Alliance[3].Rewards
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[4] = {
    Title = "霜狼军需官",
    Level = 60,
    Attain = 51,
    Aim = "与霜狼军需官谈一谈。",
    Location = "乔泰克 (奥特兰克山谷 - 南 "..yellow.."[8]"..white..")",
    Note = "霜狼军需官 在 "..yellow.."[10]"..white.." 并提供更多任务。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[5] = {
    Title = "冷齿矿洞的补给",
    Level = 60,
    Attain = 51,
    Aim = "把10份冷齿矿洞补给品交给霜狼要塞的部落军需官。",
    Location = "霜狼军需官 (奥特兰克山谷 - 南 "..yellow.."[10]"..white..")",
    Note = "补给品可以在 (奥特兰克山谷 - 南 "..yellow.."[6]"..white..") 的 冷齿矿洞 中找到。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[6] = {
    Title = "深铁矿洞的补给",
    Level = 60,
    Attain = 51,
    Aim = "把10份深铁矿洞补给品交给丹巴达尔的联盟军需官。",
    Location = "霜狼军需官 (奥特兰克山谷 - 南 "..yellow.."[10]"..white..")",
    Note = "补给品可以在 (奥特兰克山谷 - 北 "..yellow.."[1]"..white..") 的 深铁矿洞 中找到。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[7] = {
    Title = "敌人的物资",
    Level = 60,
    Attain = 51,
    Aim = "给霜狼村的铁匠雷格萨带去20块护甲碎片。",
    Location = "铁匠雷格萨 (奥特兰克山谷 - 南 "..yellow.."[8]"..white..")",
    Note = "从敌方玩家的尸体上搜刮碎片。后续任务是相同的任务，但是可重复的。",
    Folgequest = "取之于敌",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[8] = {
    Title = "占领矿洞",
    Level = 60,
    Attain = 51,
    Aim = "占领一座还没有被雷矛部族控制的矿洞，然后向丹巴达尔的雷矛军需官复命。",
    Location = "提卡·血牙 (奥特兰克山脉 "..yellow.."66,55"..white..")",
    Note = "要完成任务，你必须在联盟控制矿洞时杀死 (奥特兰克山谷 - 北 "..yellow.."[1]"..white..") 深铁矿洞 中的 莫洛克 或 (奥特兰克山谷 - 南 "..yellow.."[6]"..white..") 冷齿矿洞 中的 工头斯尼维尔。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[9] = {
    Title = "哨塔和碉堡",
    Level = 60,
    Attain = 51,
    Aim = "占领敌方的某座哨塔，然后向霜狼村的提卡·血牙复命。",
    Location = "提卡·血牙 (奥特兰克山脉 "..yellow.."66,55"..white..")",
    Note = "据报道，实际上不需要摧毁哨塔或碉堡来完成任务，只需要攻击。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[10] = {
    Title = "奥特兰克山谷的墓地",
    Level = 60,
    Attain = 51,
    Aim = "占领一座墓地，然后向霜狼村的亚斯拉复命。",
    Location = "提卡·血牙 (奥特兰克山脉 "..yellow.."66,55"..white..")",
    Note = "据报道，你不需要做任何事情，只需在部落攻击墓地时身处墓地附近即可。它不需要被占领，只需被攻击。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[11] = {
    Title = "补充坐骑",
    Level = 60,
    Attain = 51,
    Aim = "找到奥特兰克山谷中的霜狼。使用霜狼口套来驯服它们。被驯服的霜狼会跟随你回到兽栏管理员那里，然后与兽栏管理员谈话以获得你的奖励。",
    Location = "霜狼兽栏管理员 (奥特兰克山谷 - 南 "..yellow.."[9]"..white..")",
    Note = "你可以在基地外面找到一只 霜狼。驯服过程就像猎人驯服宠物一样。每个战场每个玩家或玩家组可以重复此任务最多25次。驯服25只山羊后，霜狼骑兵将抵达战场协助作战。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[12] = {
    Title = "羊皮坐具",
    Level = 60,
    Attain = 51,
    Aim = "你必须攻击该地区的土著山羊。正是雷矛骑兵用作坐骑的那些山羊！\n\n杀死它们并把它们的皮带回来给我。一旦我们收集了足够的皮，我们将为骑手制作挽具。霜狼狼骑兵将再次骑行！",
    Location = "霜狼骑兵指挥官 (奥特兰克山谷 - 南 "..yellow.."[9]"..white..")",
    Note = "山羊可以在奥特兰克山谷的北部地区找到。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[13] = {
    Title = "联盟之血",
    Level = 60,
    Attain = 51,
    Aim = "你可以选择提供更多从我们敌人身上获取的血液。我很乐意接受加仑大小的供品。",
    Location = "指挥官瑟鲁加 (奥特兰克山谷 - 南 "..yellow.."[8]"..white..")",
    Note = "交还大约 150 份血液后，指挥官瑟鲁加 将开始走向 (奥特兰克山谷 - 南 "..yellow.."[14]"..white..")。到达那里后，她将开始一个召唤仪式，需要 10 人协助。如果成功，冰雪之王洛克霍拉 将被召唤来杀死联盟玩家。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[14] = {
    Title = "冰雪之王洛克霍拉",
    Level = 60,
    Attain = 51,
    Aim = "你必须击倒我们的敌人并把他们的血带给我。一旦收集了足够的血，召唤仪式就可以开始了。\n\n当元素领主被释放到雷矛军队身上时，胜利将得到保证。",
    Location = "指挥官瑟鲁加 (奥特兰克山谷 - 南 "..yellow.."[8]"..white..")",
    Note = "交还大约 150 份血液后，指挥官瑟鲁加 将开始走向 (奥特兰克山谷 - 南 "..yellow.."[14]"..white..")。到达那里后，她将开始一个召唤仪式，需要 10 人协助。如果成功，冰雪之王洛克霍拉 将被召唤来杀死联盟玩家。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[15] = {
    Title = "天空的召唤—古斯的部队",
    Level = 60,
    Attain = 51,
    Aim = "我的骑手们准备对中央战场进行打击；但首先，我必须激起他们的胃口——让他们为攻击做好准备。\n\n我需要足够的雷矛士兵的肉来喂养一支舰队！几百磅！你肯定能搞定，对吧？快去！",
    Location = "空军指挥官古斯 (奥特兰克山谷 - 南 "..yellow.."[13]"..white..")",
    Note = "杀死部落NPC以获得 雷矛士兵的食物。据报道，需要 90 份肉才能让空军指挥官做她该做的事。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[16] = {
    Title = "天空的召唤—杰斯托的部队",
    Level = 60,
    Attain = 51,
    Aim = "我的战争骑手必须品尝他们目标的肉。这将确保对我们敌人的外科手术式打击！\n\n我的舰队是我们空中指挥部中第二强大的。因此，他们将打击我们对手中更强大的那些。为此，他们需要雷矛中尉的肉。",
    Location = "空军指挥官杰斯托 (奥特兰克山谷 - 南 "..yellow.."[13]"..white..")",
    Note = "杀死联盟NPC以获得 雷矛士官的食物。",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[17] = {
    Title = "天空的召唤—穆维里克的部队",
    Level = 60,
    Attain = 51,
    Aim = "首先，我的战争骑手需要攻击目标——高优先级目标。我需要用雷矛指挥官的肉喂养他们。不幸的是，那些小家伙深藏在敌后！你肯定有得忙了。",
    Location = "空军指挥官穆维里克 (奥特兰克山谷 - 南 "..yellow.."[13]"..white..")",
    Note = "杀死联盟NPC以获得 雷矛指挥官的食物。"
}

--------------- Arathi Basin ---------------
kQuestInstanceData.BGArathiBasin = {
    Story = "阿拉希盆地位于阿拉希高地，是一个快速而激动人心的战场。盆地本身富含资源，受到部落和联盟的觊觎。被遗忘者污染者和阿拉索联军已抵达阿拉希盆地，为这些自然资源发动战争，并代表各自阵营声称拥有它们。",
    Caption = "阿拉希盆地",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGArathiBasin.Alliance[1] = {
    Title = "阿拉希盆地之战！",
    Level = 55,
    Attain = 50,
    Aim = "进攻矿洞、伐木场、铁匠铺和农场，然后向避难谷地的奥斯莱特元帅复命。",
    Location = "奥斯莱特元帅 (阿拉希高地 - 避难谷地 "..yellow.."46,45"..white..")",
    Note = "需要攻击的地点在地图上标记为 2 到 5。",
}
kQuestInstanceData.BGArathiBasin.Alliance[2] = {
    Title = "控制四座基地",
    Level = 60,
    Attain = 60,
    Aim = "进入阿拉希盆地，同时占据并控制四座基地，当任务完成之后向避难谷地的奥斯莱特元帅报告。",
    Location = "奥斯莱特元帅 (阿拉希高地 - 避难谷地 "..yellow.."46,45"..white..")",
    Note = "你需要与 阿拉索联军 声望达到 友善 才能获得此任务。",
}
kQuestInstanceData.BGArathiBasin.Alliance[3] = {
    Title = "控制五座基地",
    Level = 60,
    Attain = 60,
    Aim = "同时控制阿拉希盆地中的五座基地，然后向避难谷地的奥斯莱特元帅复命。",
    Location = "奥斯莱特元帅 (阿拉希高地 - 避难谷地 "..yellow.."46,45"..white..")",
    Note = "你需要与 阿拉索联军 声望达到 崇拜 才能获得此任务。",
    Rewards = {
        Text = "奖励：",
        { id = 20132 }, --Arathor Battle Tabard Tabard
    }
}
kQuestInstanceData.BGArathiBasin.Horde[1] = {
    Title = "阿拉希盆地之战！",
    Level = 25,
    Attain = 25,
    Aim = "进攻矿洞、伐木场、铁匠铺和农场，然后向避难谷地的奥斯莱特元帅复命。",
    Location = "屠杀者杜维尔 (阿拉希高地 - 落锤镇 "..yellow.."74,35"..white..")",
    Note = "需要攻击的地点在地图上标记为 1 到 4。",
}
kQuestInstanceData.BGArathiBasin.Horde[2] = {
    Title = "夺取四座基地",
    Level = 60,
    Attain = 60,
    Aim = "同时占据阿拉希盆地中的四座基地，然后向落锤镇的屠杀者杜维尔复命。",
    Location = "屠杀者杜维尔 (阿拉希高地 - 落锤镇 "..yellow.."74,35"..white..")",
    Note = "你需要与 污染者 声望达到 友善 才能获得此任务。",
}
kQuestInstanceData.BGArathiBasin.Horde[3] = {
    Title = "夺取五座基地",
    Level = 60,
    Attain = 60,
    Aim = "同时占据阿拉希盆地中的五座基地，然后向落锤镇的屠杀者杜维尔复命。",
    Location = "屠杀者杜维尔 (阿拉希高地 - 落锤镇 "..yellow.."74,35"..white..")",
    Note = "你需要与 污染者 声望达到 崇拜 才能获得此任务。",
    Rewards = {
        Text = "奖励：",
        { id = 20131 }, --Battle Tabard of the Defilers Tabard
    }
}

--------------- Warsong Gulch ---------------
kQuestInstanceData.BGWarsongGulch = {
    Story = "战歌峡谷位于灰谷森林的南部地区，靠近格罗姆·地狱咆哮和他的兽人在第三次战争期间砍伐大片森林的地区。一些兽人留在了附近，继续砍伐森林以支持部落的扩张。他们自称为战歌氏族。\n暗夜精灵已经开始大规模反攻以夺回灰谷的森林，现在正集中精力将战歌氏族彻底赶出他们的土地。因此，银翼哨兵响应了号召，发誓在每一个兽人被击败并被赶出战歌峡谷之前绝不休息。 ",
    Caption = "战歌峡谷",
    Alliance = {},
    Horde = {}
}

--------------- The Crescent Grove ---------------
kQuestInstanceData.TheCrescentGrove = {
    Story = "位于灰谷南部俯瞰迷雾之湖的隐秘树林，曾是德鲁伊数年的静修之地，现在一个邪恶的存在已在该地区扎根。最初作为德鲁伊平静静修之地的隐秘树林，近来树林熊怪部落在逃离污林熊怪部落的疯狂时搬了进来，在这个过程中驱逐了几个原来的居民。然而，尽管他们试图逃离疯狂，他们最终还是屈服了。卡兰纳·明辉曾住在这里，后来他被树林熊怪从树林驱逐，家园被烧毁。由末日守卫大师拉克希斯领导的燃烧军团恶魔力量已在树林中建立据点，开始腐化林地。军团已经以邪刺之痕的形式留下了他们的印记，打破了平衡并扰乱了灵魂。",
    Caption = "新月林地",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheCrescentGrove.Alliance[1] = {
    Title = "猖獗的原林熊怪",
    Level = 33,
    Attain = 26,
    Aim = "冒险进入新月林地，从里面的熊怪那里为流放者戈卢尔收集8个原林徽记。",
    Location = "流放者戈卢尔 (灰谷 "..yellow.."56,59"..white..")",
    Note = "掉落自 熊怪。",
}
kQuestInstanceData.TheCrescentGrove.Alliance[2] = {
    Title = "不明智的长老",
    Level = 34,
    Attain = 26,
    Aim = "把“独眼”长老和喉长老的爪子从新月林地里拿出来，带给流放者戈卢尔。",
    Location = "流放者戈卢尔 (灰谷 "..yellow.."56,59"..white..")",
    Note = "掉落自 第一个首领附近的 熊怪。",
    Rewards = {
        Text = "奖励：",
        { id = 60179 }, --Grol's Band Ring
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[3] = {
    Title = "新月林地",
    Level = 37,
    Attain = 28,
    Aim = "摧毁新月林地内的腐败之源，并返回泰达希尔的德纳萨里安身边。",
    Location = "德纳萨里安 <德鲁伊训练师> (泰达希尔 - 达纳苏斯 "..yellow.."24,48"..white..")",
    Note = "你需要击杀 最后一个首领。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60180 }, --Sentinel Chain Chest, Mail
        { id = 60181 }, --Groveweave Cloak Back
        { id = 60182 }, --Epaulets of Forest Wisdom Shoulder, Cloth
        { id = 60183 }, --Bushstalker Mask Head, Leather
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[4] = {
    Title = "卡拉纳尔之锤",
    Level = 33,
    Attain = 25,
    Aim = "前往新月林地，找到卡拉纳尔·亮光被烧毁的家。然后取回卡拉纳尔的木槌并将其归还给阿斯特兰纳的他。",
    Location = "卡拉纳尔·亮光 (灰谷 "..yellow.."36,52"..white..")",
    Note = "在 卡拉纳尔的保险箱 中。",
}
kQuestInstanceData.TheCrescentGrove.Horde[1] = kQuestInstanceData.TheCrescentGrove.Alliance[1]
kQuestInstanceData.TheCrescentGrove.Horde[2] = kQuestInstanceData.TheCrescentGrove.Alliance[2]
kQuestInstanceData.TheCrescentGrove.Horde[3] = {
    Title = "根除邪恶",
    Level = 37,
    Attain = 26,
    Aim = "冒险进入新月林地，撃杀拉克西斯大师，根除里面的邪恶。",
    Location = "罗鲁克·森林行者 (灰谷 - 碎木岗哨 "..yellow.."73,59"..white..")",
    Note = "任务线也开始于 罗鲁克·森林行者。你需要击杀 最后一个首领。",
    Prequest = "林地之谜 -> 费兰的报告",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60213 }, --Outrider Chain Chest, Mail
        { id = 60214 }, --Strongwind Cloak Back
        { id = 60215 }, --Foreststrider Spaulders Shoulder, Leather
        { id = 60216 }, --Hat of Forest Medicine Head, Cloth
    }
}

--------------- Karazhan Crypt ---------------
kQuestInstanceData.KarazhanCrypt = {
    Story = "卡拉赞地穴是位于逆风小径的副本地下城。某种东西在凄凉的地下墓穴中扭曲死者使其复活，找到源头以便死者可以再次安息。",
    Caption = "卡拉赞墓穴",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.KarazhanCrypt.Alliance[1] = {
    Title = "卡拉赞之谜之七",
    Level = 60,
    Attain = 58,
    Aim = "深入卡拉赞墓穴，为逆风小径的大法师艾瑞登·暗塔杀死墓穴看守阿拉鲁斯。",
    Location = "大法师艾瑞登·暗塔 (逆风小径 "..yellow.."52,34"..white..")",
    Note = "卡拉赞墓穴钥匙 来自 (卡拉赞之谜 VI) 任务。你可以在 [5] 找到 阿拉鲁斯。",
    Prequest = "卡拉赞之谜 I >> 卡拉赞之谜 VI",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60463 }, --Arcane Charged Pendant Neck
        { id = 60464 }, --Orb of Kaladoon Trinket
        { id = 60465 }, --Arcane Strengthened Band Ring
    }
}
kQuestInstanceData.KarazhanCrypt.Alliance[2] = {
    Title = "厨师中没有荣誉",
    Level = 61,
    Attain = 60,
    Aim = "在卡拉赞墓穴杀死饥饿的死催戈，然后返回卡拉赞下层大厅的厨师那里。﻿",
    Location = "厨师 附近 ("..yellow.."[下层卡拉赞大厅- e]"..white..")",
    Note = "掉落自 [饥饿的死催戈]。\n任务线开始于 [科赞的食谱]，在 "..yellow.."[卡拉赞之塔]"..white.." 获得。",
    Prequest = "主厨的威严",
    Rewards = {
        Text = "奖励：",
        { id = 92045 }, --Recipe: Empowering Herbal Salad Pattern
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[1] = {
    Title = "卡拉赞深渊之七",
    Level = 60,
    Attain = 58,
    Aim = "进入卡拉赞墓穴，为斯通纳德的科尔根杀死墓穴看守阿拉鲁斯。",
    Location = "科尔根 (悲伤沼泽 "..yellow.."44,55"..white..")",
    Note = "卡拉赞墓穴钥匙 来自 (卡拉赞深渊 VI) 任务。你可以在 [5] 找到 阿拉鲁斯。",
    Prequest = "卡拉赞深渊 I >> 卡拉赞深渊 VI",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60459 }, --Charged Arcane Ring Ring
        { id = 60460 }, --Tusk of Gardon Neck
        { id = 60461 }, --Blackfire Orb Trinket
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[2] = kQuestInstanceData.KarazhanCrypt.Alliance[2]

--------------- Caverns Of Time: The Black Morass ---------------
kQuestInstanceData.CavernsOfTimeBlackMorass = {
    Story = "在塔纳利斯的时光之穴中，黑暗之门重演了它第一次开启的历史。时间的守护者青铜龙需要你的帮助来维持时间线的稳定并粉碎堕落者的阴谋。",
    Caption = "时光之穴：黑色沼泽",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[1] = {
    Title = "黑暗之门的首次开启",
    Level = 60,
    Attain = 60,
    Aim = "进入黑色沼泽的过去时空，消灭安特诺米，并将她的头颅带给吉娜。",
    Location = "克罗米 (塔纳利斯 - 时光之穴 "..yellow.."57,59"..white..")",
    Note = "任务线开始于 里扎雷克斯 <武器商人> (贫瘠之地 - 从十字路口到棘齿城巡逻 "..   yellow.."57,37"..white..")。掉落自 [4]。",
    Prequest = "闪闪发光的机会 > 血腥的善举 > 朋友的来信 >> 进入时光之穴的旅程",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 82950 }, --X-51 Arcane Ocular Implants Head, Cloth
        { id = 82951 }, --X-52 Stealth Ocular Implants Head, Leather
        { id = 82952 }, --X-53 Ranger Ocular Implants Head, Mail
        { id = 82953 }, --X-54 Guardian Ocular Implants Head, Plate
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[2] = {
    Title = "青铜的背叛",
    Level = 60,
    Attain = 58,
    Aim = "杀死克罗纳，并将他的头颅带给时光之穴的提瓦德瑞斯。",
    Location = "提瓦德瑞斯 (塔纳利斯 - 时光之穴 "..yellow.."59,60"..white..")",
    Note = "你需要击杀 第一个首领。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60497 }, --Pendant of Tyvadrius Neck
        { id = 60498 }, --Halberd of the Bronze Defender Polearm
        { id = 60499 }, --Ring of Tyvadrius Ring
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[3] = {
    Title = "腐化之沙",
    Level = 60,
    Attain = 58,
    Aim = "在时光之穴中为德罗诺姆收集腐化之沙。",
    Location = "卓诺姆 (塔纳利斯 - 时光之穴 "..yellow.."63,58"..white..")",
    Note = "掉落自 怪物 和 首领。",
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[4] = {
    Title = "成堆沙子",
    Level = 60,
    Attain = 58,
    Aim = "在时光之穴中为德罗诺姆收集10颗腐化之沙。",
    Location = "卓诺姆 (塔纳利斯 - 时光之穴 "..yellow.."63,58"..white..")",
    Note = "掉落自 怪物 和 首领。"
}
for i = 1, 4 do
    kQuestInstanceData.CavernsOfTimeBlackMorass.Horde[i] = kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[i]
end

--------------- Hateforge Quarry ---------------
kQuestInstanceData.HateforgeQuarry = {
    Story = "憎恨熔炉采石场是位于燃烧平原的副本地下城。隐藏在燃烧平原东南墙壁处，憎恨熔炉采石场是黑铁矮人寻找对抗敌人新武器的最新努力。看似无辜的采石场隐藏着一个险恶的洞穴，暗影熔炉矮人在那里策划针对所有反对他们的人的新阴谋。",
    Caption = "仇恨熔炉采石场",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.HateforgeQuarry.Alliance[1] = {
    Title = "竞争对手的存在",
    Level = 54,
    Attain = 47,
    Aim = "了解仇恨熔炉采石场正在挖出什么。",
    Location = "工头奥菲斯特 <瑟银兄弟会> (灼热峡谷 - 瑟银哨塔 "..yellow.."38.1,27.0"..white..")。",
    Note = "仇恨熔炉化学家 怪物掉落 仇恨熔炉烧瓶 用于任务。",
}
kQuestInstanceData.HateforgeQuarry.Alliance[2] = {
    Title = "矿工工会叛变II",
    Level = 50,
    Attain = 45,
    Aim = "在仇恨熔炉采石场杀死20名仇恨熔炉矿工，然后返回燃烧平原黑石小径的莫格瑞姆·火矛身边。",
    Location = "莫格瑞姆·火矛 (燃烧平原 - 黑石小径 "..yellow.."75.6,68.3"..white..").",
    Note = "任务线开始于 拉德根·深焰，任务 '获得奥瓦克的信任' (燃烧平原 - 黑石小径 "..yellow.."76.1,67.6"..white..")。",
    Prequest = "获得奥瓦克的信任 -> 聆听奥瓦克的故事 -> 斯特恩洛克藏品 -> 矿工工会叛变",
    Rewards = {
        Text = "奖励：",
        { id = 60673 }, --Cuffs of Justice Wrist, Plate
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[3] = {
    Title = "真正的高级工头",
    Level = 51,
    Attain = 45,
    Aim = "杀死巴古尔·黑锤，并为燃烧平原黑石小径的奥瓦克·严岩取回元老院命令。",
    Location = "奥瓦克·严岩 (燃烧平原 - 黑石小径 "..yellow.."75.9,68.2"..white..").",
    Note = "任务线开始于 拉德根·深焰，任务 '获得奥瓦克的信任' (燃烧平原 - 黑石小径 "..   yellow.."76.1,67.6"..white..")。\n杀死 巴古尔·黑锤 并从首领旁边的桌子上拿取 元老院命令。",
    Prequest = "获得奥瓦克的信任 -> 聆听奥瓦克的故事 -> 斯特恩洛克藏品",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60665 }, --Deepblaze Signet Ring
        { id = 60666 }, --Sternrock Trudgers Feet, Leather
        { id = 60667 }, --Firepike's Lucky Trousers Legs, Cloth
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[4] = {
    Title = "血光闪闪",
    Level = 50,
    Attain = 50,
    Aim = "找个人传授你关于这块滚烫的宝石的知识。",
    Location = "微光碎片 (仇恨熔炉采石场"..yellow.."[74, 73]"..white..").",
    Note = red..   "(仅限珠宝加工)"..   white.." 找到 '微光碎片' 并获得任务。\n完成任务线的最后一个任务后将获得奖励。",
    Folgequest = "雷炉大师",
    Rewards = {
        Text = "奖励：全部",
        { id = 61818 }, --Gorgeous Mountain Gemstone Enchant
        { id = 70209 }, --Plans: Gorgeous Mountain Gemstone Pattern
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[5] = {
    Title = "仇恨熔炉啤酒的传闻",
    Level = 54,
    Attain = 45,
    Aim = "深入仇恨熔炉采石场并找回黑铁药瓶和仇恨熔炉化学文件，然后返回燃烧平原摩根的岗哨的瓦拉格·暮须。",
    Location = "瓦拉格·暮须 (燃烧平原 - 摩根的岗哨 "..yellow.."85.1,67.6"..white..").",
    Note = "仇恨熔炉化学家 怪物掉落 黑铁药瓶 用于任务，仇恨熔炉化学文件 在 箱子"..yellow.."[a]"..white.."中。",
    Rewards = {
        Text = "奖励：",
        { id = 2686 },  --Thunder Ale Drinkable
        { id = 60699 }, --Varlag's Clutches Hands, Leather
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[6] = {
    Title = "攻击仇恨熔炉",
    Level = 57,
    Attain = 45,
    Aim = "冒险进入仇恨熔炉采石场并在内部深处清除暮光之锤的存在，完成后返回铁炉堡的麦格尼·铜须国王那里。",
    Location = "参议员岩带 (燃烧平原 - 摩根的岗哨 "..yellow.."85.2,67.9"..white..").",
    Note = "杀死 最后的首领 哈格什末日召唤者 "..   yellow.."[5]"..white.."。\n任务线开始于同一任务给予者的任务 '调查仇恨熔炉'。",
    Prequest = "调查仇恨熔炉 -> 仇恨熔炉的报告 -> 国王的回应",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60694 }, --Crown of Grobi Head, Mail
        { id = 60695 }, --Sigil of Heritage Ring
        { id = 60696 }, --Rubyheart Mallet One-Hand, Mace
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[7] = {
    Title = "为什么不两者兼得？",
    Level = 50,
    Attain = 40,
    Aim = "从玛拉顿的深处获得山崩之心，从燃烧平原的仇恨熔炉采石场获得腐蚀精华，然后带给鹰巢山的弗里格·雷炉。",
    Location = "弗里格·雷炉 (辛特兰 - 鹰巢山 "..yellow.."[10.0, 49.3]"..white..")。",
    Note = "腐蚀西斯 在 "..yellow.."[3]"..white.."。",
    Prequest = "证明一个观点 -> 我曾在书中读到过",
    Folgequest = "雷炉大师",
    Rewards = {
        Text = "奖励：",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
for i = 1, 4 do
    kQuestInstanceData.HateforgeQuarry.Horde[i] = kQuestInstanceData.HateforgeQuarry.Alliance[i]
end
kQuestInstanceData.HateforgeQuarry.Horde[5] = {
    Title = "猎杀工程师菲格尔斯",
    Level = 55,
    Attain = 48,
    Location = "卡塔拉女王 (燃烧平原 - 卡方要塞 "..yellow.."89.4,24.5"..white.." 燃烧平原东北角)。",
    Note = "在 仇恨熔炉采石场 杀死 工程师菲格尔斯 "..yellow.."[2]"..white.." 为 座狼 卡塔拉女王。",
    Prequest = "奇怪的无法应付",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60771 }, --Pyrehand Gloves Hands, Cloth
        { id = 60772 }, --Fur of Navakesh Back
        { id = 60773 }, --Blackrock Authority One-Hand, Mace
        { id = 60774 }, --Girdle of Galron Waist, Mail
    }
}
kQuestInstanceData.HateforgeQuarry.Horde[6] = {
    Title = "新与旧之四",
    Level = 57,
    Attain = 45,
    Aim = "冒险进入仇恨熔炉采石场，为卡方要塞的卡方清除暮光之锤存在。",
    Location = "卡方 (燃烧平原 - 卡方要塞 "..yellow.."90.1,22.5"..white.." 燃烧平原东北角)。",
    Note = "杀死 最后的首领 哈格什末日召唤者 "..yellow.."[5]"..white.."。\n任务线开始于 瓦尔盖克议员 (燃烧平原 - 卡方要塞 "..   yellow.."90.0,22.7"..white.." 燃烧平原东北角)，任务 '新与旧之一'。",
    Prequest = "新与旧之一 -> 新与旧之二 -> 新与旧之三",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60734 }, --Blade of the Warleader Main Hand, Sword
        { id = 60735 }, --Obsidian Gem Choker Neck
        { id = 60736 }, --Battlemaster Helm Head, Plate
    }
}

--------------- Stormwind Vault ---------------
kQuestInstanceData.StormwindVault = {
    Story = "暴风城地窖是位于暴风城的副本地下城。地窖的守护符文正在减弱，其中的恐怖再次威胁着艾泽拉斯，你必须冒险深入并一劳永逸地阻止这些恶魔。",
    Caption = "暴风城地牢",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwindVault.Alliance[1] = {
    Title = "恢复地牢枷锁",
    Level = 63,
    Attain = 55,
    Aim = "在暴风城地牢中，杀死符文构造体以获得2个魔符枷锁，并将它们归还给考丽·司提姆哈特。",
    Location = "考丽·司提姆哈特 (暴风城 "..yellow.."54,47"..white..")",
    Note = "你需要击杀 符文构造体 怪物。",
}
kQuestInstanceData.StormwindVault.Alliance[2] = {
    Title = "了结阿克提阿斯",
    Level = 63,
    Attain = 55,
    Aim = "深入暴风城地牢冒险，找到阿克提阿斯，并为了暴风城的利益而摧毁它。完成后，返回派平·恩斯沃斯身边。",
    Location = "派平·恩斯沃斯 (暴风城 "..yellow.."54,47"..white..")",
    Note = "你需要击杀 最后的首领。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 60624 }, --Goldplated Royal Crossbow Crossbow
        { id = 60625 }, --Golden Gauntlets of Stormwind Hands, Plate
        { id = 60626 }, --Regal Goldthreaded Sash Waist, Cloth
    }
}
kQuestInstanceData.StormwindVault.Alliance[3] = {
    Title = "敌众皆横卧",
    Level = 62,
    Attain = 60,
    Aim = "将阿克提阿斯之核带给阿尔多雷尔。",
    Location = "阿尔多雷尔 (冬泉谷 "..yellow.."56,45"..white..")",
    Note = "你需要击杀 最后的首领。\n任务线开始于 魔法紫水晶 掉落于 "..   yellow.."卡拉赞之塔 [2]"..white.." 首领。\n任务链的最后任务奖励。",
    Prequest = "瑞雪当被眠",
    Folgequest = "朝阳同我醒",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 55133 }, --Claw of the Mageweaver Off Hand, Fist Weapon
        { id = 55134 }, --Rod of Permafrost Wand
        { id = 55135 }, --Shard of Leyflow Trinket
    }
}
kQuestInstanceData.StormwindVault.Alliance[4] = {
    Title = "奥术精要与魔法现象IX",
    Level = 63,
    Attain = 58,
    Aim = "为暴风城的马森·马克纳迪尔找回《奥术精要与魔法现象IX》之书。",
    Location = "马森·马克纳迪尔 (暴风城 "..yellow.."42,64"..white..")",
    Note = "附近 "..yellow.."[3]"..white.." 老板.",
    Rewards = {
        Text = "奖励：",
        { id = 60622 }, --Ring of the Academy Ring
    }
}
for i = 1, 3 do
    kQuestInstanceData.StormwindVault.Horde[i] = kQuestInstanceData.StormwindVault.Alliance[i]
end

--------------- Ostarius ---------------
kQuestInstanceData.Ostarius = {
    Story = "",
    Caption = "奥兹塔里亚斯",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Ostarius.Alliance[1] = {
    Title = "门卫",
    Level = 60,
    Attain = 58,
    Aim = "打败奥兹塔里亚斯。返回探险家大厅，将发生在大门前的事件告知资深探险家麦格拉斯。",
    Location = "奥丹姆石座 (塔纳利斯 "..yellow.."37,81"..white..")",
    Note = "前置任务来自 资深探险家麦格拉斯 (铁炉堡 - 探险者大厅 "..yellow.."69.9,18.5"..white..")。你需要击杀 奥兹塔里亚斯.",
    Prequest = "非同寻常的伙伴关系 -> 原始主人 -> 奥丹姆之门",
}
kQuestInstanceData.Ostarius.Horde[1] = {
    Title = "大门守护者",
    Level = 60,
    Attain = 58,
    Aim = "打败奥兹塔里亚斯。返回雷霆崖，告知圣者图希克在大门前发生的事件。",
    Location = "奥丹姆石座 (塔纳利斯 "..yellow.."37,81"..white..")",
    Note = "前置任务来自 圣者图希克 (雷霆崖 "..yellow.."34,47"..white..")。你需要击杀 奥兹塔里亚斯.",
    Prequest = "孤狼 -> 过往的伤痕 -> 奥丹姆在等待",
}

--------------- Gilneas City ---------------
kQuestInstanceData.GilneasCity = {
    Story = "吉尔尼斯城是位于吉尔尼斯的副本地下城。位于这片曾经孤立的土地的中心，吉尔尼斯城曾是其人民的希望堡垒。在摆脱阿拉索领主的统治后建立，它作为韧性和繁荣的象征矗立着。然而，它现在只是昔日美丽的空壳，一个黑暗的存在在吉尔尼斯投下令人窒息的阴影，提醒着它曾经辉煌的过去。远处的嚎叫回荡在城市中，令人不安地提醒着它的新占领者。然而，有可能并非所有人都已离去，他们被诅咒的国王可能仍然活着。",
    Caption = "吉尔尼斯城",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.GilneasCity.Alliance[1] = {
    Title = "审判与幻影",
    Level = 46,
    Attain = 35,
    Aim = "为了住在吉尔尼斯的格莱摩尔农场的被激怒的幽灵杀死吉尔尼斯城内的萨瑟兰法官。",
    Location = "被激怒的幽灵 (吉尔尼斯 -格莱摩尔农场 "..yellow.."52.9,27.9"..white..")",
    Note = "你可以在山上的建筑物内找到被激怒的幽灵。进入吉尔尼斯大门后，沿着左侧（东侧）的山脉走，穿过一片有风车的田野，你会找到一条通往大海的小路，几乎在边缘处向北转，沿着那条小路走（几乎看不见）。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61620 }, --Glaymore Family Breastplate Chest, Mail
        { id = 61621 }, --Ceremonial Gilnean Pike Polearm
        { id = 61622 }, --Glaymore Shawl Back
    }
}
kQuestInstanceData.GilneasCity.Alliance[2] = {
    Title = "墙后",
    Level = 41,
    Attain = 36,
    Aim = "前往吉尔尼斯城，为暴风城的的瑟鲁姆·深炉取回黎明石图纸。",
    Location = "瑟鲁姆·深炉 <专家级铁匠> (暴风城 - 矮人区"..yellow.."63.3,37"..white.."，可能会在那附近走动)",
    Note = "黎明石图纸位于建筑物 "..yellow.."[a]"..white.." 的箱子上。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61348 }, --Inlaid Plate Boots Feet, Plate
        { id = 61349 }, --Dwarven Battle Bludgeon Main Hand, Mace
    }
}
kQuestInstanceData.GilneasCity.Alliance[3] = {
    Title = "拉文郡地契",
    Level = 45,
    Attain = 38,
    Aim = "在吉尔尼斯城找到拉文郡地契，并将它归还给卡利班·席瓦莱恩。",
    Location = "卡利班·席瓦莱恩男爵 (吉尔尼斯 - 拉文郡 (主建筑) "..yellow.."58.4,67.8"..white..")",
    Note = "拉文郡地契位于摄政夫人西莉亚·哈鲁恩和摄政王莫蒂默·哈鲁恩身后的桌子上，就在哈洛家族的箱子"..   yellow.."[7]"..white.."旁边。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61601 }, --Ebonmere Axe One-Hand, Axe
        { id = 61602 }, --Gilneas Brigade Helmet Head, Plate
        { id = 61603 }, --Robes of Ravenshire Chest, Cloth
        { id = 61604 }, --Greyshire Pauldrons Shoulder, Leather
    }
}
kQuestInstanceData.GilneasCity.Alliance[4] = {
    Title = "拉文克罗夫特的野心",
    Level = 45,
    Attain = 40,
    Aim = "从吉尔尼斯市的图书馆取回《乌尔之书：第二卷》并带给给伊森·拉文克罗夫特。",
    Location = "伊森·拉文克罗夫特 (吉尔尼斯 - 空网墓地 - 地穴(吉尔尼斯西南角，河流东侧)"..   yellow.."33,76"..white..")",
    Note = "乌尔之书位于建筑物 "..yellow.."[b]"..white.." 内，向右走，在桌子上（南侧）。",
}
kQuestInstanceData.GilneasCity.Alliance[5] = {
    Title = "抹除龙类的存在",
    Level = 47,
    Attain = 35,
    Aim = "为了结束龙类在吉尔尼斯的腐蚀，请为吉尔尼斯城拉文郡的大法师奥勒留斯消灭拉文郡摄政夫人西莉亚和摄政王莫蒂默。",
    Location = "大法师奥勒留斯 <肯瑞托> (吉尔尼斯 - 拉文郡 (主建筑) "..yellow.."57.7,68.5"..white..")",
    Note = "带上1个大块闪光碎片，前置任务需要用到。附魔师有这些，或者拍卖行也能买到。应该很便宜。",
    Prequest = "奥术之枢 -> 魔法的存在 -> 龙类的存在？",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61486 }, --Violet Sash Waist, Cloth
        { id = 61487 }, --Gauntlets of Insight Hands, Mail
    }
}
kQuestInstanceData.GilneasCity.Alliance[6] = {
    Title = "格雷迈恩的衰落与崛起",
    Level = 42,
    Attain = 35,
    Aim = "「救出」吉恩，并且为拉文郡的达瑞斯·拉文伍德勋爵找到格雷迈恩王冠。",
    Location = "达瑞斯·拉文伍德勋爵 (吉尔尼斯 - 拉文郡 (主建筑) "..yellow.."58.4,67.6"..white..")",
    Note = "任务线开始于卡利班·席瓦莱恩男爵 (吉尔尼斯 - 拉文郡 (主建筑) "..yellow.."58.4,67.8"..   white..") 处的任务 '披着羊皮的狼'。\n格雷迈恩王冠掉落自吉恩·格雷迈恩 "..yellow.."[8]"..white.."，位于塔顶的最后首领。",
    Prequest = "披着羊皮的狼 -> 一步一脚印 -> 传奇之路 -> 回到拉文郡 -> 黑暗中的微光 -> 卑劣的行径 -> 十字路口的交易 -> 突袭弗雷希尔要塞",
    Rewards = {
        Text = "奖励：1 或 2 或 3 和 4",
        { id = 61497 }, --Ravenwood Belt Waist, Mail
        { id = 61498 }, --Signet of Gilneas Ring
        { id = 61499 }, --Ravenshire Gloves Hands, Leather
        { id = 61369 }, --Ravenshire Tabard Tabard
    }
}
kQuestInstanceData.GilneasCity.Alliance[7] = {
    Title = "《水占术手稿II》",
    Level = 45,
    Attain = 38,
    Aim = "在尘泥沼泽的塞拉摩岛为大法师哈利斯特取回《水占术手稿II》。",
    Location = "大法师哈利斯特 (尘泥沼泽 - 塞拉摩，中央塔楼)",
    Note = red..   "(法师专用)"..white.." 法师塞拉摩传送任务。\n水占术手稿II位于建筑物 "..   yellow.."[b]"..white.." 内，向右走，在梳妆台上（南侧）。",
    Prequest = "玛诺洛克恶魔印记",
    Rewards = {
        Text = "奖励：",
        { id = 92001 }, --Tome of Teleportation: Theramore Spell
    }
}
kQuestInstanceData.GilneasCity.Alliance[8] = {
    Title = "打破谣言",
    Level = 44,
    Attain = 40,
    Aim = "把冒险者的项链交给铁炉堡的塔瓦斯德·基瑟尔。",
    Location = "塔瓦斯德·基瑟尔 (铁炉堡 - 秘法区 "..yellow.."36,3"..white..").",
    Note = red..   "(珠宝加工：仅限金匠)"..white.." 前置任务来自 梅瓦·托格维尤 (铁炉堡 - 探险者大厅 "..   yellow.."60,24"..white.."). \n达斯蒂万·黑风 "..yellow.."[4]"..white.." 掉落失去光泽的黄水晶项链",
    Prequest = "掌握金匠之术",
    Rewards = {
        Text = "奖励：",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Alliance[9] = {
    Title = "沃根多尔之血",
    Level = 60,
    Attain = 60,
    Aim = "为范达尔·鹿盔收集狼人血液。他需要来自卡拉赞、吉尔尼斯城和影牙城堡的血液样本。",
    Location = "大德鲁伊范达尔·鹿盔 (达纳苏斯 - 塞纳里奥区 "..yellow.."35,9"..white..").",
    Note = "[黑皮之血] 掉落自狼人。"..white.."\n[女神的镰刀] 前置任务开始于艾露恩的镰刀，掉落自布莱克伍德公爵二世 "..yellow.."(下层卡拉赞大厅 [5]).",
    Prequest = "女神的镰刀",
    Folgequest = "狼血",
}
kQuestInstanceData.GilneasCity.Alliance[10] = {
    Title = "吉尔尼斯的普利克巫妖",
    Level = 60,
    Attain = 60,
    Aim = "冒险前往吉尔尼斯城，寻找第二个普利克巫妖的下落。",
    Location = "大德鲁伊梦风 (海加尔山 - 诺达纳尔 "..yellow.."85, 30"..white..")", --61512    Note = "[西莉亚日记] placed 附近 "..yellow.."[7]"..white..".\n[女神的镰刀] 前置任务开始于艾露恩的镰刀 掉落自 布莱克伍德公爵 II "..yellow.."(下层卡拉赞大厅 [5]).",
    Prequest = "普利克巫妖纳尔穆恩",
    Folgequest = "普利克巫妖人狼",
}
kQuestInstanceData.GilneasCity.Horde[1] = kQuestInstanceData.GilneasCity.Alliance[1]
kQuestInstanceData.GilneasCity.Horde[2] = {
    Title = "埃博米尔事务",
    Level = 45,
    Attain = 35,
    Aim = "为吉尔尼斯的埃博米尔农场的约书亚·埃博米尔杀死吉尔尼斯城内的达斯蒂万·布莱克考尔，并夺回埃博米尔的地契。",
    Location = "乔舒·埃博米尔 (吉尔尼斯 - 埃博米尔农场 "..yellow.."[49.5,31.1]"..white..")。进入吉尔尼斯大门后，沿着左侧（东侧）的山脉走，在有风车的田野里你会找到乔舒·埃博米尔。",
    Note = "前置任务 '埃博米尔农场的蝙蝠' 和 '埃博米尔农场的狼人'。\n达斯蒂万·黑风 "..yellow.."[4]"..white.." 掉落埃博米尔的地契",
    Prequest = "埃博米尔农场的蝙蝠 -> 埃博米尔农场的狼人",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61627 }, --Ebonmere Reaver One-Hand, Axe
        { id = 61628 }, --Clutch of Joshua Waist, Cloth
        { id = 61629 }, --Farmer's Musket Gun
        { id = 61630 }, --Ebonmere Vambracers Wrist, Plate
    }
}
kQuestInstanceData.GilneasCity.Horde[3] = {
    Title = "皇家抢劫案",
    Level = 45,
    Attain = 40,
    Aim = "从吉尔尼斯市的图书馆偷走这幅画，然后返回吉尔尼斯黑荆棘营地的卢克·阿加曼德那里。",
    Location = "卢克·阿加曼德 (吉尔尼斯 - 黑荆棘营地 "..yellow.."[14.1,33.7]"..white.."，位于西北角海岸的营地。)",
    Note = "米娅·格雷迈恩的画像位于建筑物 "..yellow..   "[b]"..white.." 内，向左走，在墙上（西北角）。",
}
kQuestInstanceData.GilneasCity.Horde[4] = {
    Title = "邪恶让我这样做",
    Level = 46,
    Attain = 35,
    Aim = "在吉尔尼斯城找到“论血液的力量”，然后返回吉尔尼斯格雷郡遗址的奥万·黑眼身边。",
    Location = "奥万·黑眼 (吉尔尼斯 - 格雷希尔废墟 "..yellow.."[31.3,47.0]"..white..")",
    Note = red..   "任务线开始于亡灵哨兵阿琳娜 (吉尔尼斯 - 寂静守卫教堂 "..yellow.."[57.3,39.6]"..white.."，内部)，任务为 '死到天黑'。\n《论血液的力量》一书位于摄政夫人西莉亚·哈鲁恩和摄政王莫蒂默·哈鲁恩身后的桌子上，就在哈洛家族的箱子"..   yellow.."[7]"..white.."旁边。\n完成下一个任务后，你将获得奖励。",
    Prequest = "死到天黑 -> 我们所需要的只是血 -> 最后的活死人 -> 我们从活物中获取它",
    Folgequest = "以血还血",
    Rewards = {
        Text = "奖励：",
        { id = 61422 }, --Pure Bloodvial Pendant Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[5] = {
    Title = "吉恩·格雷迈恩必须死！",
    Level = 49,
    Attain = 40,
    Aim = "进入吉尔尼斯城并杀死吉恩·格雷迈恩，然后将他的头颅带到吉尔尼斯的黑荆棘营地的黑荆棘处。",
    Location = "黑荆棘 (吉尔尼斯 - 黑荆棘营地 "..yellow.."[14.1,33.7]"..white.."，位于西北角海岸的营地。)",
    Note = "需要完成2条任务线才能开始此任务：'向卢克·阿加曼德报告' 和 '向利维亚·斯特朗阿姆报告'，地点在黑荆棘。\n",
    Prequest = "'向卢克·阿加曼德报告' -> 干岩矿洞抢劫案 -> 向利维亚·斯特朗阿姆报告 -> 与渗透者会合 -> 与黑荆棘共度美好时光",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61353 }, --Blackthorn Gauntlets Hands, Leather
        { id = 61354 }, --Banshee's Tear Ring
        { id = 61355 }, --Dark Footpad Belt Waist, Mail
    }
}
kQuestInstanceData.GilneasCity.Horde[6] = {
    Title = "格雷迈恩之石",
    Level = 47,
    Attain = 38,
    Aim = "为吉尔尼斯寂静守卫教堂的黑暗主教莫德伦找到午夜碎片",
    Location = "黑暗主教莫德伦 (吉尔尼斯 - 寂静守卫教堂 "..yellow.."57.7,39.6"..white..")",
    Note = "任务线开始于黑暗主教莫德伦处的任务 '借助强大魔法'。\n午夜碎片位于最后首领吉恩·格雷迈恩 "..   yellow.."[8]"..white.." 的身后。\n完成下一个任务后，你将获得奖励。",
    Prequest = "借助强大魔法 -> 拉文伍德权杖 -> 超越的力量"..yellow.."[剃刀高地]"..white..".", -- 40993, 40994, 40995",
    Folgequest = "黑暗主教的礼物",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[7] = {
    Title = "外来知识",
    Level = 44,
    Attain = 34,
    Aim = "在吉尔尼斯城找到这本书籍，并将其带给荒芜之地卡加斯的加卡尔·融苔。",
    Location = "加卡尔·融苔 (荒芜之地 - 卡加斯 "..yellow.."2,46"..white..").",
    Note = red..   "(珠宝加工：仅限金匠)"..white.." 前置任务来自 古尔迈尔·法塔尔 (幽暗城 - 盗贼区 "..   yellow.."77,76"..white..")。\n'吉尔尼斯珠宝：概要' 包含物品。", --TODO: where?
    Prequest = "掌握金匠之术",
    Rewards = {
        Text = "奖励：",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Horde[8] = {
    Title = "狼、巫婆与镰刀",
    Level = 60,
    Attain = 60,
    Aim = "为玛加萨·恐怖图腾收集狼人血液。她需要来自卡拉赞、吉尔尼斯城和影牙城堡的血液样本。",
    Location = "玛加萨·恐怖图腾 (雷霆崖 - 长者高地 "..yellow.."70,31"..white..").",
    Note = "[黑皮之血] 掉落自狼人。"..white.."\n[女神的镰刀] 前置任务开始于艾露恩的镰刀，掉落自布莱克伍德公爵二世 "..yellow.."(下层卡拉赞大厅 [5]).",
    Prequest = "女神的镰刀",
    Folgequest = "狼血",
}
kQuestInstanceData.GilneasCity.Horde[9] = {
    Title = "吉尔尼斯的普利克巫妖",
    Level = 60,
    Attain = 60,
    Aim = "冒险前往吉尔尼斯城，寻找第二个普利克巫妖的下落。",
    Location = "大德鲁伊梦风 (海加尔山 - 诺达纳尔 "..yellow.."85, 30"..white..")", --61512
    Note = "西莉亚日记放置在附近"..yellow.."[7]"..white.."\n[女神的镰刀] 前置任务开始于艾露恩的镰刀 掉落自 布莱克伍德公爵 II "..yellow.."(下层卡拉赞大厅 [5])。",
    Prequest = "普利克巫妖纳尔穆恩",
    Folgequest = "普利克巫妖人狼",
}

--------------- Lower Karazhan Halls ---------------
kQuestInstanceData.LowerKarazhan = {
    Story = "卡拉赞下层大厅是位于逆风小径的团队副本。卡拉赞，曾经是提瑞斯法前守护者的高耸据点，现在栖息在强大的地脉上，嗡嗡作响着魔法能量。它被遗忘已久、布满灰尘的走廊已成为各种生物的避风港，尽管看起来并非所有居民都是自愿离开的。在下层大厅的深处，麦迪文忠诚的管家莫罗斯仍然是一位警惕的守护者。如果你设法给他留下深刻印象，他可能会授予你进入上层的权限。",
    Caption = "下层卡拉赞大厅",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.LowerKarazhan.Alliance[1] = {
    Title = "合适的住宿",
    Level = 60,
    Attain = 55,
    Aim = "为卡拉赞的议员凯尔森寻找一个舒适的枕头。",
    Location = "议员凯尔森 ("..yellow.."[卡拉赞 - c]"..white..")",
    Note = "你可以在 "..yellow.."(b)"..white.." 的箱子里找到舒适的枕头。",
    Folgequest = "一杯助眠饮品",
}
kQuestInstanceData.LowerKarazhan.Alliance[2] = {
    Title = "一杯助眠饮品",
    Level = 60,
    Attain = 55,
    Aim = "与可能知道如何为议员凯尔森购买葡萄酒的人交谈。",
    Location = "议员凯尔森 ("..yellow.."[卡拉赞 - c]"..white..")",
    Note = "将任务交给 "..yellow.."[卡拉赞 - e]"..white.." 附近的厨师。",
    Prequest = "合适的住宿",
    Folgequest = "幽灵酒",
}
kQuestInstanceData.LowerKarazhan.Alliance[3] = {
    Title = "幽灵酒",
    Level = 60,
    Attain = 55,
    Aim = "为卡拉赞的厨师收集3个死灵精华、5瓶波尔多酒和一个幽灵菇。",
    Location = "厨师 附近 ("..yellow.."[下层卡拉赞大厅- e]"..white..")",
    Note = "波尔多酒由酒商出售。所有物品都可以从拍卖行购买。",
    Prequest = "一杯助眠饮品",
    Folgequest = "凯尔森的酒",
}
kQuestInstanceData.LowerKarazhan.Alliance[4] = {
    Title = "凯尔森的酒",
    Level = 60,
    Attain = 55,
    Location = "厨师 附近 ("..yellow.."[下层卡拉赞大厅- e]"..white..")",
    Note = "将幽灵酒交给卡拉赞的议员凯尔森 "..yellow.."[卡拉赞 - c]"..white.."。",
    Prequest = "幽灵酒",
}
kQuestInstanceData.LowerKarazhan.Alliance[5] = {
    Title = "卡拉赞的钥匙之一",
    Level = 60,
    Attain = 58,
    Aim = "聆听埃伯洛克领主的故事。",
    Location = "埃伯洛克领主 ("..yellow.."[卡拉赞 - d]"..white..")",
    Folgequest = "卡拉赞的钥匙之二",
}
kQuestInstanceData.LowerKarazhan.Alliance[6] = {
    Title = "卡拉赞的钥匙之二",
    Level = 60,
    Attain = 58,
    Location = "埃伯洛克领主 ("..yellow.."[卡拉赞 - d]"..white..")",
    Note = "杀死莫罗斯 "..   yellow.."[6]"..white.." 并取回通往上层区域的钥匙。莫罗斯位于下层卡拉赞大厅。将钥匙带回给埃伯洛克领主。",
    Prequest = "卡拉赞的钥匙之一",
    Folgequest = "卡拉赞的钥匙之三",
}
kQuestInstanceData.LowerKarazhan.Alliance[7] = {
    Title = "卡拉赞的钥匙之三",
    Level = 60,
    Attain = 58,
    Aim = "寻找来自肯瑞托、可能了解范多尔的人。达拉然可能是开始您搜索的好地方。",
    Location = "厨师 附近 ("..yellow.."[下层卡拉赞大厅- e]"..white..")",
    Note = "将任务交给大法师安斯雷姆·鲁因维沃尔 <肯瑞托> (奥特兰克山脉 - 达拉然 "..yellow.."[18.9,78.5]"..white..")",
    Prequest = "卡拉赞的钥匙之二",
    Folgequest = "卡拉赞的钥匙之四",
}
kQuestInstanceData.LowerKarazhan.Alliance[8] = {
    Title = "被撕碎的烹饪笔记",
    Level = 60,
    Attain = 55,
    Aim = "找个可能了解这些破碎的烹饪笔记的人。",
    Location = "潦草的烹饪笔记",
    Note = "将任务交给公爵罗斯伦 "..   yellow.."[卡拉赞 - f]"..white.."，位于爪王嚎牙 "..yellow.."[4]"..white.." 旁边的阳台上。",
    Folgequest = "失而复得的手镯",
}
kQuestInstanceData.LowerKarazhan.Alliance[9] = {
    Title = "失而复得的手镯",
    Level = 60,
    Attain = 55,
    Aim = "为卡拉赞的公爵罗斯伦找回雕花金镯子",
    Location = "公爵罗斯伦 "..yellow.."[卡拉赞 - f]"..white..".",
    Note = "你可以在 "..yellow.."[卡拉赞 - a]"..white.." 的箱子里找到 '雕花金镯子'。",
    Prequest = "被撕碎的烹饪笔记",
    Folgequest = "罗斯伦家族胸针",
}
kQuestInstanceData.LowerKarazhan.Alliance[10] = {
    Title = "罗斯伦家族胸针",
    Level = 60,
    Attain = 55,
    Aim = "为卡拉赞的公爵罗斯伦找回罗斯伦家族胸针。",
    Location = "公爵罗斯伦 (卡拉赞 "..yellow.."[卡拉赞 - f]"..white..")",
    Note = "罗斯伦家族胸针位于 "..yellow.."[斯坦索姆]"..   white.." 首领不可宽恕者 "..yellow.."[4]"..white.." 旁边的箱子里。",
    Prequest = "失而复得的手镯",
    Folgequest = "神秘配方",
}
kQuestInstanceData.LowerKarazhan.Alliance[11] = {
    Title = "神秘配方",
    Level = 60,
    Attain = 55,
    Location = "公爵罗斯伦 (卡拉赞 "..yellow.."[卡拉赞 - f]"..white..")",
    Note = "与下层卡拉赞大厅的 '厨师' "..yellow.."[e 附近]"..white.." 交谈。",
    Prequest = "罗斯伦家族胸针",
    Folgequest = "卡拉赞门卫",
}
kQuestInstanceData.LowerKarazhan.Alliance[12] = {
    Title = "卡拉赞门卫",
    Level = 60,
    Attain = 55,
    Aim = "与卡拉赞的看门人蒙蒂格对话",
    Location = "厨师 附近 ("..yellow.."[下层卡拉赞大厅- e]"..white..")",
    Note = "看门人蒙蒂格"..blue.." "..white.."位于副本入口处的楼梯前。",
    Prequest = "神秘配方",
    Folgequest = "卡拉赞之怒",
}
kQuestInstanceData.LowerKarazhan.Alliance[13] = {
    Title = "卡拉赞之怒",
    Level = 60,
    Attain = 55,
    Aim = "收集10个死灵精华、10个生命精华和25枚金币给卡拉赞的看门人蒙蒂格。",
    Location = "看门人蒙蒂格"..blue.." "..white.."位于副本入口处的楼梯前。",
    Note = "所有物品都可以从拍卖行购买。生命精华每个10-15银，亡灵腐液每个1-3金。",
    Prequest = "卡拉赞门卫",
    Folgequest = "巧克力鱼",
}
kQuestInstanceData.LowerKarazhan.Alliance[14] = {
    Title = "巧克力鱼",
    Level = 60,
    Attain = 55,
    Location = "看门人蒙蒂格"..blue.." "..white.."位于副本入口处的楼梯前。",
    Note = "将卡拉赞之怒带给下层卡拉赞大厅 "..yellow.."[e]"..white.." 附近的厨师。",
    Prequest = "卡拉赞之怒",
    Rewards = {
        Text = "奖励：",
        { id = 61666 }, --Recipe: Le Fishe Au Chocolat Pattern
        { id = 84040 }, --Le Fishe Au Chocolat Pattern
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[15] = {
    Title = "女神的镰刀",
    Level = 60,
    Attain = 60,
    Aim = "杀死爪王嚎牙并向埃伯洛克领主报告。",
    Location = "艾露恩的镰刀 "..yellow.."[5]"..white..".",
    Note = red..   "法师，牧师，术士，仅德鲁伊"..white..":\n任务线开始于传说物品 '艾露恩的镰刀'，掉落自布莱克沃尔德勋爵二世 "..   yellow.."[5]"..white.." (低几率)。\n传说饰品任务线。",
    Folgequest = "女神的镰刀",
}
kQuestInstanceData.LowerKarazhan.Alliance[16] = {
    Title = "为教会奉献",
    Level = 60,
    Attain = 55,
    Aim = "在卡拉赞外的小教堂为圣职者涅修斯收集15个奥术精华、20个幻影之尘和10个强效不灭精华。",
    Location = "圣职者奈瑟斯 (逆风小径，卡拉赞旁边的教堂前 "..   yellow.."[40.3,77.2]"..white..").",
    Note = "15x 奥术精华 - 随机小怪掉落；\n20x 幻影之尘 - 附魔师或拍卖行；\n10x 强效不灭精华 - 附魔师或拍卖行；\n完成此任务后，你将能够获得头/腿附魔任务。每个附魔你需要：\n 1x 过载魔法能量 - 卡拉赞小怪/首领随机掉落的稀有物品；\n6x 奥术精华 - 随机小怪掉落。",
    Folgequest = "破碎祈祷，强效保护祈祷，广阔思维祈祷，强效奥术坚韧祈祷",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 92005 }, --Invocation of Shattering Enchant
        { id = 92006 }, --Invocation of Greater Protection Enchant
        { id = 92007 }, --Invocation of Expansive Mind Enchant
        { id = 92008 }, --Invocation of Greater Arcane Fortitude Enchant
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[17] = {
    Title = "滑稽的大蜡烛",
    Level = 61,
    Attain = 60,
    Aim = "从格里齐基尔那拿到滑稽的大蜡烛并交给卡拉赞上层的大吱吱。",
    Location = "看门人蒙蒂格"..blue.." "..white.."位于副本入口处的楼梯前。",
    Note = red.. "法师专用"..white..": 格里齐基尔 "..yellow.."[3]"..white.." 掉落 '滑稽的大蜡烛'。\n任务线开始于 "..yellow.."[卡拉赞之塔]"..white.." 的大吱吱。",
    Prequest = "吾非鼠辈",
    Rewards = {
        Text = "奖励：",
        { id = 92025 }, --Tome of Polymorph: Rodent Spell
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[18] = {
    Title = "沃根多尔之血",
    Level = 60,
    Attain = 60,
    Aim = "为范达尔·鹿盔收集狼人血液。他需要来自卡拉赞、吉尔尼斯城和影牙城堡的血液样本。",
    Location = "大德鲁伊范达尔·鹿盔 (达纳苏斯 - 塞纳里奥区 "..yellow.."35,9"..white..").",
    Note = "[影刺之血] 掉落自狼人。"..white.."\n[女神的镰刀] 前置任务开始于艾露恩的镰刀，掉落自布莱克伍德公爵二世 "..yellow.."(下层卡拉赞大厅 [5]).",
    Prequest = "女神的镰刀",
    Folgequest = "狼血",
}
for i = 1, 17 do
    if i ~= 7 then
        kQuestInstanceData.LowerKarazhan.Horde[i] = kQuestInstanceData.LowerKarazhan.Alliance[i]
    end
end
-- fix for horde quests
kQuestInstanceData.LowerKarazhan.Horde[7] = createInheritedQuest(
    kQuestInstanceData.LowerKarazhan.Alliance[7],
    {
        Aim = "为范达尔·鹿盔收集狼人血液。他需要来自卡拉赞、吉尔尼斯城和影牙城堡的血液样本。",
        Note = "将任务交给比索·埃斯沙德 (幽暗城 - 魔法区"..       yellow.."[84.1,17.5]"..white.."，法师训练师区域。)"
    }
)
kQuestInstanceData.LowerKarazhan.Horde[18] = createInheritedQuest(
    kQuestInstanceData.LowerKarazhan.Alliance[18],
    {
        Title = "狼、巫婆与镰刀",
        Aim = "为玛加萨·恐怖图腾收集狼人血液。她需要来自卡拉赞、吉尔尼斯城和影牙城堡的血液样本。",
        Location = "玛加萨·恐怖图腾 (雷霆崖 - 长者高地 "..yellow.."70,31"..white..")."
    }
)

--------------- Emerald Sanctum ---------------
kQuestInstanceData.EmeraldSanctum = {
    Story = "翡翠圣所是位于海加尔的团队副本。腐化之雾降临在翡翠梦境上，扭曲着即使是最高贵和最纯洁者的道德和意图。被腐化的觉醒者正准备发出过早的觉醒呼唤；如果不阻止，他的同类将崛起并在艾泽拉斯掀起狂乱的暴行。",
    Caption = "翡翠圣殿",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.EmeraldSanctum.Alliance[1] = {
    Title = "阴燃梦境精华",
    Level = 60,
    Attain = 55,
    Aim = "将阴燃梦境精华带给海加尔山诺达纳尔的大德鲁伊梦风。",
    Location = "阴燃梦境精华 [2]",
    Note = red..   "仅德鲁伊"..white..": 大德鲁伊梦风位于 (海加尔山 - 诺达纳尔 "..yellow.."85,30"..white..")。团队中只有一人可以拾取此物品，且该任务只能完成一次。\n\n列出的奖励为后续任务的奖励。",
    Folgequest = "净化梦境精华",
    Rewards = {
        Text = "奖励：",
        { id = 61445 }, --Purified Emerald Essence Pattern
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[2] = {
    Title = "索尔纽斯的首级",
    Level = 60,
    Attain = 58,
    Aim = "将索尔纽斯的头颅交给海加尔山诺达纳尔的拉拉修斯。",
    Location = "索尔纽斯的头颅 [2]",
    Note = "拉拉修斯位于 (海加尔山 - 诺达纳尔 "..   yellow.."85,30"..   white..")。团队中只有一人可以拾取此物品，且该任务只能完成一次。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61195 }, --Ring of Nordrassil Ring
        { id = 61194 }, --The Heart of Dreams Neck
        { id = 61193 }, --Verdant Eye Necklace Trinket
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[3] = {
    Title = "埃伦纽斯之爪",
    Level = 60,
    Attain = 55,
    Aim = "将埃伦纽斯之爪带给可能有用的人。",
    Location = "埃伦纽斯之爪 [1]",
    Note = "拉拉修斯位于 (海加尔山 - 诺达纳尔 "..   yellow.."85,30"..   white.."). 团队中只有一人可以拾取此物品，且该任务只能完成一次。",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 61650 }, --Jadestone Skewer Polearm
        { id = 61651 }, --Jadestone Mallet Main Hand, Mace
        { id = 61740 }, --Claw of Senthos Main Hand, Fist Weapon
    }
}
for i = 1, 3 do
    kQuestInstanceData.EmeraldSanctum.Horde[i] = kQuestInstanceData.EmeraldSanctum.Alliance[i]
end

--------------- Upper Karazhan ---------------
kQuestInstanceData.TowerofKarazhan = {
    Story = "卡拉赞之塔是位于逆风小径的团队副本。卡拉赞，曾经是提瑞斯法前守护者的高耸据点，现在栖息在强大的地脉上，嗡嗡作响着魔法能量。它被遗忘已久、布满灰尘的走廊已成为各种生物的避风港，尽管看起来并非所有居民都是自愿离开的。",
    Caption = "卡拉赞之塔",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TowerofKarazhan.Alliance[1] = {
    Title = "麦迪文的权杖",
    Level = 60,
    Attain = 60,
    Aim = "为了修复麦迪文的权杖，逆风小径摩根墓场的千里眼亚妮拉丝需要大量的奥术能量。",
    Location = "千里眼亚妮拉丝 (逆风小径 - 摩根墓场 "..yellow.."41.2,79.2"..white..")",
    Note = "黑曜石棒 "..yellow.."下层卡拉赞大厅 [e]."..white.." 宇宙残骸 掉落自 "..yellow.."[3]."..white.."\n赞萨的束缚 前置任务开始于正义的汉瓦 (逆风小径 - 摩根墓场 "..   yellow.."40.9, 79.3"..white..")，凯尔森的酒 前置任务开始于厨师 "..yellow.."(下层卡拉赞大厅 [e])",
    Prequest = "凯尔森的酒, 赞萨的束缚",
    Folgequest = "提瑞斯法的遗迹",
    Rewards = {
        Text = "奖励：",
        { id = 41413 }, --Scepter Rod of Medivh 任务物品
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[2] = {
    Title = "提瑞斯法的遗迹",
    Level = 60,
    Attain = 60,
    Aim = "一个麦迪文的幻象是重新激活麦迪文的权杖所必需的。把可以充当替代品的东西带到卡拉赞郊外摩根墓场的千里眼亚妮拉丝那里。",
    Location = "千里眼亚妮拉丝 (逆风小径 - 摩根墓场 "..yellow.."41.2,79.2"..white..")",
    Note = "掉落自 "..yellow.."麦迪文的回响 [4]."..white.."\n卡德加的日记 [?] 开启此任务链。\n任务链最后任务的奖励。\n萨恩克拉 (悲伤沼泽 "..yellow.."25, 30"..white..") 开启 桑夫的护身符 任务链。",
    Prequest = "桑拉嵌座 -> 修复遗物",
    Folgequest = "桑夫的护身符 -> 一个请求 -> 麦迪文的权杖的另一面 -> 开辟道路",
    Rewards = {
        Text = "奖励：",
        { id = 41415, desc = "打开传送门" }, --麦迪文权杖 任务物品
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[3] = {
    Title = "吾非鼠辈",
    Level = 61,
    Attain = 60,
    Aim = "和卡拉赞下层大厅的看门人蒙蒂格交谈。",
    Location = "大吱吱 (卡拉赞之塔 "..yellow.."0, 0"..white..")",
    Note = red.."仅法师"..white..": 看门人蒙蒂格在下层卡拉赞大厅副本入口处的楼梯前。",
    Folgequest = "滑稽的大蜡烛",
}
kQuestInstanceData.TowerofKarazhan.Alliance[4] = {
    Title = "主厨的威严",
    Level = 60,
    Attain = 60,
    Aim = "找到卡拉赞下层大厅的那个厨师。",
    Location = "厨师食谱 (卡拉赞之塔 "..yellow.."附近 [1]"..white..")",
    Note = "厨师 附近 ("..yellow.."[下层卡拉赞大厅 - e]"..white..".\n获得烹饪食谱的任务",
    Folgequest = "厨师中没有荣誉",
}
kQuestInstanceData.TowerofKarazhan.Alliance[5] = {
    Title = "夜深寒气冷",
    Level = 62,
    Attain = 60,
    Aim = "调查魔法紫水晶的奥秘。",
    Location = "魔法紫水晶 (卡拉赞之塔 "..yellow.."[2] "..white.."首领掉落)",
    Note = "任务线在暴风城地牢继续，任务为"..yellow.."[敌众皆横卧]"..white.."(保持不变)",
    Folgequest = "月亮拥入怀",
}
kQuestInstanceData.TowerofKarazhan.Alliance[6] = {
    Title = "魔法树木研究",
    Level = 61,
    Attain = 60,
    Aim = "前往厄运之槌找到博学者莱德罗斯。",
    Location = "古人与树人们 (卡拉赞之塔 "..yellow.."附近 [] "..white..")",
    Note = red..   "仅德鲁伊"..white..": 博学者莱德罗斯 (厄运之槌 - 西 或 北 "..yellow.."[1] 图书馆"..white..")\n任务线在厄运之槌东，任务为 [奥术古树雕文]。",
    Folgequest = "缠绕扭木",
}
kQuestInstanceData.TowerofKarazhan.Alliance[7] = {
    Title = "女神的镰刀",
    Level = 60,
    Attain = 60,
    Aim = "杀死爪王嚎牙并向埃伯洛克领主报告。",
    Location = "大德鲁伊梦风 (海加尔山 - 诺达纳尔 "..yellow.."85, 30"..white..")",
    Note = "《沃根多尔：鲜血维度的神话》 (入口附近) 包含任务物品。\n"..   white.."[女神的镰刀] 前置任务开始于艾露恩的镰刀，掉落自布莱克伍德公爵二世 "..yellow.."(下层卡拉赞大厅 [5]).",
    Prequest = "女神的镰刀",
    Folgequest = "女神的镰刀",
}
kQuestInstanceData.TowerofKarazhan.Alliance[8] = {
    Title = "普利克巫妖纳尔穆恩",
    Level = 60,
    Attain = 60,
    Aim = "杀死守护者纳尔穆恩。他在卡拉赞的上层。",
    Location = "大德鲁伊梦风 (海加尔山 - 诺达纳尔 "..yellow.."85, 30"..white..")",
    Note = "需要击杀 "..yellow..   "守护者纳尔穆恩 [1]。\n"..white.."[女神的镰刀] 前置任务开始于艾露恩的镰刀，掉落自布莱克伍德公爵二世 "..yellow.."(下层卡拉赞大厅 [5]).",
    Prequest = "女神的镰刀 -> 乌尔的智慧",
    Folgequest = "吉尔尼斯的普利克巫妖",
}
kQuestInstanceData.TowerofKarazhan.Alliance[9] = {
    Title = "女神的镰刀",
    Level = 60,
    Attain = 60,
    Aim = "杀死爪王嚎牙并向埃伯洛克领主报告。",
    Location = "大德鲁伊梦风 (海加尔山 - 诺达纳尔 "..yellow.."85, 30"..white..")",
    Note = "[恐惧魔王之魂] 掉落自 "..yellow.."孟菲斯托斯 [8]。\n"..   white.."[女神的镰刀] 前置任务开始于艾露恩的镰刀，掉落自布莱克伍德公爵二世 "..   yellow.."(下层卡拉赞大厅 [5])。\n"..white.."月布来自裁缝，永恒梦境碎片来自附魔。",
    Prequest = "女神的镰刀 -> 普利克巫妖人狼",
    Folgequest = "女神之力",
    Rewards = {
        Text = "奖励：",
        { id = 55505 }, --The Scythe of Elune Trinket
    }
}
for i = 1, 9 do
    kQuestInstanceData.TowerofKarazhan.Horde[i] = kQuestInstanceData.TowerofKarazhan.Alliance[i]
end

--------------- Dragonmaw Retreat ---------------
kQuestInstanceData.DragonmawRetreat = {
    Story =
    "龙喉据点是位于湿地的副本地下城。作为更古老但未知的矮人文明的碎片，这些洞穴曾被用作格瑞姆巴托采矿网络的一部分。自从第二次被遗弃以来，龙喉氏族已将这个被遗忘的网络雕刻成了一个行动基地。现在拥有恶魔之魂碎片，他们将不择手段地在他们被迷惑的红龙军队的帮助下夺回湿地和格瑞姆郊区。",
    Caption = "龙喉居所",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DragonmawRetreat.Alliance[1] = {
    Title = "联合基座",
    Level = 30,
    Attain = 25,
    Aim = "基座完好无损，且未遭受严重破坏。",
    Location = "联合基座 (龙喉居所 "..yellow.."35,93"..white..")",
    Note = "基座位于 "..       yellow.."[5]"..       white.." 附近\n'阿尔戈隆碎片' 掉落自 "..yellow.."[3]"..white.."\n'达斯罗纳格碎片' 包含在 '达斯罗纳格的箱子' 中 "
       ..yellow.."[a]",
    Rewards = {
        Text = "奖励：",
        { id = 41876, desc = "钥匙" }, --Lower Reserve Key
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[2] = {
    Title = "孤峰之败",
    Level = 28,
    Attain = 20,
    Aim = "为藓皮豺狼人复仇，在龙喉居所击杀他们的前任首领孤峰。之后返回湿地绿带草地附近冷酷之咬的营地。",
    Location = "孤峰 (湿地 - 绿带草地 "..yellow.."55,35"..white..")",
    Note = "'戈尔芬的头' 掉落自 '孤峰' "..yellow.."[1]",
    Rewards = {
        Text = "奖励：",
        { id = 41830 }, --Mosshide Ring
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[3] = {
    Title = "石傀儡回收",
    Level = 28,
    Attain = 22,
    Aim = "在龙喉居所处从摇摇欲坠的石傀儡身上拿到一个符石，并将其交给湿地大路边上的吉克斯勒。",
    Location = "吉克斯勒 (湿地 - 绿带草地 "..yellow.."50,38"..white..")",
    Note = "石傀儡符石 掉落自 摇摇欲坠的石傀儡 附近 "..yellow.."[6]",
    Rewards = {
        Text = "奖励：",
        { id = 41826 }, --Mosshide Cinch
        { id = 41827 }, --Fenwater Gloves
        { id = 41828 }, --Mosschain Bracers
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[4] = {
    Title = "龙喉之巢",
    Level = 34,
    Attain = 24,
    Aim = "湿地龙喉大门的尼迪赞兹希望解救他的兄弟希瑞斯塔萨，他正被龙喉兽人在龙喉居所俘虏。",
    Location = "尼迪赞兹 (湿地 - 龙喉大门 "..yellow.."74,48"..white..")",
    Note = "幼龙 和 希瑞斯塔萨 "..yellow.."[8]",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 41831 }, --Runebound Dagger
        { id = 41832 }, --Flameweave Sash
        { id = 41833 }, --Cuffs of Burning Rage
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[5] = {
    Title = "红龙女王的枷锁",
    Level = 30,
    Attain = 24,
    Aim = "在湿地中寻找一条愿意倾听你的话的红龙。",
    Location = "恶魔之魂碎片 (龙喉居所 - "..yellow.."[10]"..white..")",
    Note = "恶魔之魂碎片 掉落自 酋长塔尔加斯·龙颅 "..yellow.."[10]",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 58234 }, --Pendant of Ember Blood
        { id = 58235 }, --"Pendant of Ember Blessing
        { id = 58236 }, --Pendant of Ember Hatred
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[6] = {
    Title = "来自科尔拉格·末日之歌的信",
    Level = 35,
    Attain = 30,
    Aim = "把这封信带给冷酷海岸的某位掌权者。",
    Location = "科尔拉格·末日之歌的信件 (龙喉居所 - 酋长塔尔加斯·龙颅 "..yellow.."[10]"..white..")",
    Note = "在 '冷酷海岸' 交给 '镇长荷丹姆·硬手' "..   yellow.."51, 58"..white.."\n完成下一个任务后，你将获得奖励。 需要击杀 '科尔拉格·末日之歌' 格林海岸 - 扎姆·格斯要塞 "..yellow.."56, 11",
    Folgequest = "龙喉的毁灭",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 41713 }, -- Doomsong Cuffs
        { id = 41714 }, -- Sash of Zarm'geth
        { id = 41715 }, -- Legging's of Geth'kar
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[7] = {
    Title = "粉碎龙喉",
    Level = 29,
    Attain = 21,
    Aim = "消灭龙喉居所的龙喉老兵，并向米奈希尔港的斯托菲队长回报。",
    Location = "斯托菲队长 (湿地 - 米奈希尔港 "..yellow.."10, 58"..white..")",
    Note = "'龙喉老兵' 附近 "..yellow.."[4, 6 和 8]",
}
kQuestInstanceData.DragonmawRetreat.Alliance[8] = {
    Title = "黑心的毁灭",
    Level = 31,
    Attain = 23,
    Aim = "将黑心大王的首级带给米奈希尔港的斯托菲队长。",
    Location = "斯托菲队长 (湿地 - 米奈希尔港 - "..yellow.."10, 58"..white..")",
    Note = "'黑心的头颅' 掉落自 '黑心大王' "..yellow.."[7]",
    Prequest = "击败纳克罗什",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 41842 }, --Menethil Greaves
        { id = 41843 }, --Stoutheart Shawl
        { id = 41844 }, --Torwyll's Cuffs
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[9] = {
    Title = "红标谎言",
    Level = 28,
    Attain = 22,
    Aim = "将红标石板交给铁炉堡图书馆的一位历史学家。",
    Location = "红标石板 (龙喉居所 "..yellow.."34,93"..white..")",
    Note = "完成下一个任务后，你将获得奖励。\n平板电脑 附近 "..yellow.."[5]",
    Folgequest = "红标谎言",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 41838 }, --Gravelweave Pantaloons
        { id = 41839 }, --Defender of Dorgal
        { id = 41840 }, --Gemlaced Sash
    }
}
for i = 1, 5 do
    kQuestInstanceData.DragonmawRetreat.Horde[i] = kQuestInstanceData.DragonmawRetreat.Alliance[i]
end
kQuestInstanceData.DragonmawRetreat.Horde[6] = createInheritedQuest(
    kQuestInstanceData.DragonmawRetreat.Alliance[6],
    {
        Note = "交给 '指挥官阿格纳什' (冷酷海岸 - 破刃岗哨 - "..yellow.."60, 30"..white..")\n完成下一个任务后，你将获得奖励。\n需要击杀 '科尔拉格·末日之歌' (格林海岸 - 扎姆·格斯要塞 "..yellow.."56, 11"..white..")"
    }
)
kQuestInstanceData.DragonmawRetreat.Horde[7] = {
    Title = "穴织精萃",
    Level = 27,
    Attain = 21,
    Aim = "在龙喉居所击杀穴织女王，并将她的毒囊交给落锤镇的奥库尔。",
    Location = "奥库尔 (阿拉希高地 - 落锤镇 "..yellow.."74, 34"..white..")",
    Note = "'穴织女王的毒囊' 掉落自 '穴织女王' "..yellow.."[2]",
}
kQuestInstanceData.DragonmawRetreat.Horde[8] = {
    Title = "永不熄灭的烈焰",
    Level = 30,
    Attain = 24,
    Aim = "从龙喉居所取回永恒之火，并将其交给塔伦米尔的莎拉·布拉森。",
    Location = "莎拉·布拉森 (希尔斯布莱德丘陵 - 塔伦米尔 "..yellow.."64, 21"..white..")",
    Note = "'永恒之火' 位于…附近 "..yellow.."[4]",
    Rewards = {
        Text = "奖励：",
        { id = 41836 }, --Ancient Flame Pendant
    }
}

--------------- Stormwrought Ruins ---------------
kQuestInstanceData.StormwroughtRuins = {
    Story =
    "风铸废墟是位于巴罗尔的副本地下城，在风铸城堡的废墟内。作为坚不可摧的堡垒，曾经是巴罗尔公爵的家园和权力之座，风铸城堡荒废地耸立在巴罗尔被海浪冲刷的悬崖之上。在第一次战争期间被占领，所有居民都被残忍屠杀，那些不太幸运的人被俘虏用于令人发指的仪式。多年后，这座废弃的废墟现在再次被兽人风暴掠夺者氏族及其暗影议会的邪恶霸主占领。城堡不再纯净的大厅藏着恐怖和堕落的展示，徘徊的幽灵、庞大的恶魔和喃喃自语的邪教徒在这个可怕地方漆黑的大厅中潜行。",
    Caption = "风暴废墟",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwroughtRuins.Alliance[1] = {
    Title = "已故巴洛公爵",
    Level = 34,
    Attain = 28,
    Aim = "将巴洛之冠带给奥尔米尔·半角。",
    Location = "奥尔米尔·半角 (巴洛 "..yellow.."30, 51"..white..")",
    Note = "'巴洛之冠' 掉落自 '巴洛公爵四世' "..yellow.."[4]",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 58261 }, --Drinking Halfhorn
        { id = 58262 }, --Enchanted Glass Kopis
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[2] = {
    Title = "骷髅与骸骨",
    Level = 34,
    Attain = 28,
    Aim = "进入风暴城堡，为巴洛西部自家庄园的奥利弗特·格拉汉勋爵取回巴洛印戒。",
    Location = "奥利弗特·格拉汉勋爵 (巴洛 "..yellow.."36, 66"..white..")",
    Note = "'巴洛印戒' 掉落自 '巴洛公爵四世' "..yellow.."[4]",
    Rewards = {
        Text = "奖励：",
        { id = 58073 }, --Grahan Family Seal
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[3] = {
    Title = "死人没法抱怨",
    Level = 34,
    Attain = 28,
    Aim = "瑞琪·菲兹马斯克要你洗劫巴洛岛的风暴废墟，然后回到鸥翼号残骸那里交给她。",
    Location = "瑞琪·菲兹马斯克 (巴洛 "..yellow.."29, 11"..white..")",
    Note = "'巴洛人的宝藏' 掉落自 '半透明客人 和 约束贵族' 附近 "..yellow.."[4]",
    Rewards = {
        Text = "奖励：",
        { id = 58281 }, --Trusty Goblin Shiv
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[4] = {
    Title = "巴洛的意志",
    Level = 38,
    Attain = 32,
    Aim = "杀死控制着亚瑟灵魂的魅魔，并将其灵魂碎片带回风暴城堡的王座室交给他。",
    Location = "亚瑟·范德里斯 (风暴废墟 "..yellow.."附近 [4]"..white..")",
    Note = "'亚瑟的灵魂碎片' 掉落自 '德拉扎尔女士' "..yellow.."[10]",
}
kQuestInstanceData.StormwroughtRuins.Alliance[5] = {
    Title = "文物",
    Level = 35,
    Attain = 29,
    Aim = "在风暴城堡里为巴洛岛军情七处哨站的诺普西·斯皮斯潘找回《成功贸易概要》。",
    Location = "诺普西·斯皮斯潘 (巴洛 - 军情七处哨站 "..yellow.."70, 77"..white..")",
    Note = "'成功贸易概要' 掉落自 '图书管理员西奥多鲁斯' "..yellow.."[3]",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 58279 }, --Antiquated Slasher
        { id = 58280 }, --Chainmail of Many Pockets
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[6] = {
    Title = "刺客培训",
    Level = 35,
    Attain = 29,
    Aim = "削弱风暴废墟中的指挥链，然后回到巴洛岛军情七处哨站的尼普西·斯皮斯潘那里。",
    Location = "尼普西·斯皮斯潘 (巴洛 - 军情七处哨站 "..yellow.."70, 78"..white..")",
    Note = "'欧鲁诺克·裂心' "..   yellow.."[1]"..white.."\n'雷歌酋长' "..yellow.."[5]"..white.."\n'风暴掠夺者统领' 附近 "..yellow.."[5]",
    Prequest = "状况评估 -> 诺普西·斯皮斯潘 -> 令人痛心的消息 -> 去捅马蜂窝",
}
kQuestInstanceData.StormwroughtRuins.Alliance[7] = {
    Title = "黑暗之心",
    Level = 38,
    Attain = 21,
    Aim = "阻止风暴废墟中的暗影议会。",
    Location = "维罗纳·基里安 (巴洛 - 军情七处哨站 "..yellow.."70, 77"..white..")",
    Note = "'伊加尔弗 和 墨苟斯' "..yellow.."[11]",
    Prequest = "状况评估 -> 诺普西·斯皮斯潘 -> 令人痛心的消息 -> 去捅马蜂窝",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 58080 }, --Rufus' Trusty Tankard
        { id = 58081 }, --Kinrial's Scalpel
        { id = 58082 }, --Noppsy's Compendium
        { id = 58083 }, --Nippsy's Precision Rifle
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[8] = {
    Title = "晶莹剔透的印象",
    Level = 38,
    Attain = 34,
    Aim = "为在岩须的锻炉的格鲁克森·岩须找到一颗风暴水晶石。",
    Location = "格鲁克森·岩须 (冷酷海岸 - 冷酷谷 "..yellow.."56, 70"..white..")",
    Note = "'风暴水晶石' 位于…附近 "..yellow.."[9]",
    Rewards = {
        Text = "奖励：",
        { id = 41980 }, --Slatebeard Amulet
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[9] = {
    Title = "仅存之物",
    Level = 38,
    Attain = 32,
    Aim = "把这把木制玩具剑交给认识它主人的人。你可能会在北风领——这一切的起源地——碰碰运气。",
    Location = "蚀刻玩具剑 (无辜者的遗骸 - 血之圣殿 "..yellow.."[12]"..white..")",
    Note = "交给 '朱迪思·弗莱宁' (北风领 - 安伯郡 "..yellow.."50, 55"..white.."),"
}
for i = 1, 4 do
    kQuestInstanceData.StormwroughtRuins.Horde[i] = kQuestInstanceData.StormwroughtRuins.Alliance[i]
end
kQuestInstanceData.StormwroughtRuins.Horde[5] = {
    Title = "无辜者之死",
    Level = 34,
    Attain = 28,
    Aim = "消灭无辜者的遗骸，并返回碎风哨站，向欧金回报。",
    Location = "欧金 (巴洛 - 碎风哨站 "..yellow.."71, 46"..white..")",
    Note = "'无辜者的遗骸' "..yellow.."[12]",
}
kQuestInstanceData.StormwroughtRuins.Horde[6] = {
    Title = "麦塞拉克斯",
    Level = 33,
    Attain = 27,
    Aim = "消灭麦塞拉克斯，并将麦塞拉克斯的核心带回碎风哨站，交给乌达佩·日绿。",
    Location = "乌达佩·日绿 (巴洛 - 碎风哨站 "..yellow.."71, 48"..white..")",
    Note = "完成下一个任务后，你将获得奖励。\n'麦塞拉克斯之心' 掉落自 '麦塞拉克斯' "..yellow.."[8]",
    Prequest = "活的真菌",
    Folgequest = "主母会知道",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 58268 }, --Left
        { id = 58269 }, --Right
        { id = 58270 }, --Totem of An'she
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[7] = {
    Title = "尤索克的力量",
    Level = 38,
    Attain = 30,
    Aim = "杀死欧鲁诺克·裂心，并从风暴废墟中为冷酷海岸的碎刃岗哨的先知莫唐夺取尤索克的坠饰。",
    Location = "先知莫唐 (冷酷海岸 - 碎刃哨岗 "..yellow.."59, 29"..white..")",
    Note = "完成下一个任务后，你将获得奖励。\n'尤索克的坠饰' 掉落自 '欧鲁诺克·裂心' "..yellow.."[1]",
    Prequest = "迷惑魔法 -> 自然疗法 -> 黑暗精华",
    Folgequest = "尤索克的仪式",
    Rewards = {
        Text = "奖励：",
        { id = 41798 }, --The Pendant of Uth'okk
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[8] = {
    Title = "雨不会一直下",
    Level = 38,
    Attain = 32,
    Aim = "消灭暴食的达加尔、欧鲁诺克·裂心和伊加尔弗，然后回到碎风哨站，向基尔罗格·死眼报告。",
    Location = "基尔罗格·死眼 (巴洛 - 碎风哨站 "..yellow.."71, 47"..white..")",
    Note = "完成下一个任务后，你将获得奖励。\n'欧鲁诺克·裂心' "..   yellow.."[1]"..white.."\n'暴食的达加尔' "..yellow.."[2]"..white.."\n'伊加尔弗' "..yellow.."[11]",
    Prequest = "矿井深处 -> 纯粹的思绪 -> 蚁群",
    Folgequest = "风暴尽头",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 58272 }, --Kor'kron Crown
        { id = 58273 }, --Voodoo Jerkin
        { id = 58274 }, --Totemic Headdress
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[9] = {
    Title = "黑暗女王的神器",
    Level = 38,
    Attain = 32,
    Aim = "把血石吊坠交给幽暗城的希尔瓦娜斯·风行者女士。",
    Location = "破碎的血石吊坠 (风暴废墟 - 伊加尔弗 "..yellow.."[11]"..white..")",
    Note = "前置任务开始于'大法师沃迪恩·伍德格赖尔' (希尔斯布莱德丘陵 - 塔伦米尔 "..yellow.."62, 21"..white..")",
    Prequest = "入室偷窃",
    Rewards = {
        Text = "奖励：任选其一",
        { id = 58277 }, --Lady Winter's Touch",
        { id = 58278 }, --Ring of Judgement
    }
}
--------------- Windhorn Canyon ---------------
kQuestInstanceData.WindhornCanyon = {
    Story = "这座古老的峡谷一直是许多牛头人部落的家园，他们在过去的岁月里为争夺其流动的水源和庇护所而战，以抵御卡利姆多的危险。许多部落的文化和传统在风角峡谷中延续，这可以从雕刻在山腰的古老庇护所到牛头人觊觎的遗物中看出。最近，风角牛头人被征服它的恐怖图腾驱逐和赶走，并将其据为己有。",
    Caption = "风角峡谷",
    Alliance = {},
    Horde = {}
}
--------------- Timbermaw Hold ---------------
kQuestInstanceData.TimbermawHold = {
    Story = "与卡利姆多本身一样古老，这个位于海加尔山下的神秘迷宫般的隧道和洞穴网络自大灾变之前就一直是熊怪的家园。它的大厅在部落中是神圣的，是崇拜他们的祖先——双神乌索克和乌索尔的地方。然而现在，只有一阵阵腐臭的蒸汽从腐烂的洞穴中逸出，崇拜邪恶之神的低语在木喉要塞中回荡……",
    Caption = "木喉要塞",
    Alliance = {},
    Horde = {}
}

AtlasTW.Quest.DataBase = kQuestInstanceData --module finisher