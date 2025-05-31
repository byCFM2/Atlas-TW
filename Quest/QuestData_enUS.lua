---------------
--- COLOURS ---
---------------
local red = KQuestConfig.Colors.red
local white = KQuestConfig.Colors.white
local green = KQuestConfig.Colors.green
local blue = KQuestConfig.Colors.blue
local yellow = KQuestConfig.Colors.yellow
local orange = KQuestConfig.Colors.orange
local purple = KQuestConfig.Colors.purple

----------------------------------------------
------------- Quest Instance Data ------------
----------------------------------------------

local kQuestInstanceData = _G.KQuestInstanceData or {}

--------------- INST1 - The Deadmines ---------------
kQuestInstanceData[1] = {
    Story = "Once the greatest gold production center in the human lands, the Dead Mines were abandoned when the Horde razed Stormwind city during the First War. Now the Defias Brotherhood has taken up residence and turned the dark tunnels into their private sanctum. It is rumored that the thieves have conscripted the clever goblins to help them build something terrible at the bottom of the mines - but what that may be is still uncertain. Rumor has it that the way into the Deadmines lies through the quiet, unassuming village of Moonbrook.",
    Caption = "The Deadmines",
    QAA = "10 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[1].Quests.Alliance[1] = {
    Title = "1. Red Silk Bandanas",
    Level = "17",
    Attain = "14",
    Aim = "Scout Riell at the Sentinel Hill Tower wants you to bring her 10 Red Silk Bandanas.",
    Location = "Scout Riell (Westfall - Sentinel Hill; "..yellow.."56, 47"..white..")",
    Note = "You can get the Red Silk Bandanas from miners in the Deadmines or the in the town where the instance is located. The quest becomes available after you complete the The Defias Brotherhood questline up to the part where you have to kill Edwin VanCleef.",
    Prequest = "The Defias Brotherhood",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Solid Shortblade",
            ID = "2074",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Scrimshaw Dagger",
            ID = "2089",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
        {
            Name = "Piercing Axe",
            ID = "6094",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
    }
}
kQuestInstanceData[1].Quests.Alliance[2] = {
    Title = "2. Collecting Memories",
    Level = "18",
    Attain = "14",
    Aim = "Retrieve 4 Miners' Union Cards and return them to Wilder Thistlenettle in Stormwind.",
    Location = "Wilder Thistlenettle (Stormwind - Dwarven District; "..yellow.."65, 21"..white..")",
    Note = "The cards drop off undead mobs outside the instance in the area near "..yellow.."[3]"..white.." on the Entrance map.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Tunneler's Boots",
            ID = "2037",
            Color = green,
            Description = AQITEM_FEET..AQITEM_MAIL,
        },
        {
            Name = "Dusty Mining Gloves",
            ID = "2036",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[1].Quests.Alliance[3] = {
    Title = "3. Oh Brother. . .",
    Level = "20",
    Attain = "15",
    Aim = "Bring Foreman Thistlenettle's Explorers' League Badge to Wilder Thistlenettle in Stormwind.",
    Location = "Wilder Thistlenettle (Stormwind - Dwarven District; "..yellow.."65,21"..white..")",
    Note = "Foreman Thistlenettle is found outside the instance in the undead area at "..yellow.."[3]"..white.." on the Entrance map.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Miner's Revenge",
            ID = "1893",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
    }
}
kQuestInstanceData[1].Quests.Alliance[4] = {
    Title = "4. Underground Assault",
    Level = "20",
    Attain = "15",
    Aim = "Retrieve the Gnoam Sprecklesprocket from the Deadmines and return it to Shoni the Shilent in Stormwind.",
    Location = "Shoni the Silent (Stormwind - Dwarven District; "..yellow.."55,12"..white..")",
    Note = "The prequest can be obtained from Gnoarn (Dun Morogh - Gnomeregan Reclamation Facility; "..yellow.."24.5,30.4"..white..").\nSneed's Shredder drops the Sprecklesprocket "..yellow.."[3]"..white..".",
    Prequest = "Speak with Shoni",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Polar Gauntlets",
            ID = "7606",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_MAIL,
        },
        {
            Name = "Sable Wand",
            ID = "7607",
            Color = green,
            Description = AQITEM_WAND,
        },
    }
}
kQuestInstanceData[1].Quests.Alliance[5] = {
    Title = "5. The Defias Brotherhood",
    Level = "22",
    Attain = "14",
    Aim = "Kill Edwin VanCleef and bring his head to Gryan Stoutmantle.",
    Location = "Gryan Stoutmantle (Westfall - Sentinel Hill; "..yellow.."56,47"..white..")",
    Note = "You start this Questline at Gryan Stoutmantle (Westfall - Sentinel Hill; "..yellow.."56,47"..white..").\nEdwin VanCleef is the last boss of The Deadmines. You can find him at the top of his ship "..yellow.."[6]"..white..".",
    Prequest = "The Defias Brotherhood",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Chausses of Westfall",
            ID = "6087",
            Color = blue,
            Description = AQITEM_LEGS..AQITEM_MAIL,
        },
        {
            Name = "Tunic of Westfall",
            ID = "2041",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_LEATHER,
        },
        {
            Name = "Staff of Westfall",
            ID = "2042",
            Color = blue,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[1].Quests.Alliance[6] = {
    Title = "6. The Test of Righteousness",
    Level = "22",
    Attain = "20",
    Aim = "Using Jordan's Weapon Notes, find some Whitestone Oak Lumber, Bailor's Refined Ore Shipment, Jordan's Smithing Hammer, and a Kor Gem, and return them to Jordan Stilwell in Ironforge.",
    Location = "Jordan Stilwell (Dun Morogh - Ironforge Entrance; "..yellow.."52,36"..white..")",
    Note = red.."Paladin only"..white..": To see the note click on "..yellow.."[The Test of Righteousness Information]"..white..".",
    Prequest = "The Tome of Valor -> The Test of Righteousness",
    Folgequest = "The Test of Righteousness",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Verigan's Fist",
            ID = "6953",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
    },
    Page = {2, "Only Paladins can get this quest!\n\n1. You get the  Whitestone Oak Lumber from Goblin Woodcarvers in "..yellow.."[Deadmines]"..white.." near "..yellow.."[3]"..white..".\n\n2. To get the Bailor's Refined Ore Shipment you must talk to Bailor Stonehand (Loch Modan - Thelsamar; "..yellow.."35,44"..white.."). He gives you the 'Bailor's Ore Shipment' quest. You find the Jordan's Ore Shipment behind a tree at "..yellow.."71,21"..white.."\n\n3. You get Jordan's Smithing Hammer in "..yellow.."[Shadowfang Keep]"..white.." at "..yellow.."[3]"..white..".\n\n4. To get a Kor Gem you have to go to Thundris Windweaver (Darkshore - Auberdine; "..yellow.."37,40"..white..") and do the 'Seeking the Kor Gem' quest. For this quest, you must kill Blackfathom oracles or priestesses before "..yellow.."[Blackfathom Deeps]"..white..". They drop a corrupted Kor Gem. Thundris Windweaver will clean it for you.", };
}
kQuestInstanceData[1].Quests.Alliance[7] = {
    Title = "7. The Unsent Letter",
    Level = "22",
    Attain = "16",
    Aim = "Deliver the Letter to the City Architect to Baros Alexston in Stormwind.",
    Location = "An Unsent Letter (drops from Edwin VanCleef; "..yellow.."[6]"..white..")",
    Note = "Baros Alexston is in Stormwind City, next to the Cathedral of Light at "..yellow.."49,30"..white..".",
    Prequest = "No",
    Folgequest = "Bazil Thredd",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[1].Quests.Alliance[8] = {
    Title = "8. Captain Grayson's Revenge",
    Level = "22",
    Attain = "15",
    Aim = "End Cookie, bring Grayson's Pendant",
    Location = "Captain Grayson (Westfall - Lighthouse; "..yellow.."30,86"..white..")",
    Note = "You start this Questline on the northwest island in Westfall; Red book on the ground "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "Food for Sailing Thoughts?",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Grayson's Hat",
            ID = "70070",
            Color = green,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[1].Quests.Alliance[9] = {
    Title = "9. The Harvest Golem Mystery",
    Level = "19",
    Attain = "15",
    Aim = "Venture into the Deadmines and slay Gilnid, once done, return to Maltimor Gartside at the Gartside Plot in Westfall.",
    Location = "Maltimor Gartside (Westfall - north from Gold Coast Quarry; "..yellow.."31.3,37.6"..white..")",
    Note = "You start this Questline at Christopher Hewen (Westfall - Sentinel Hill Inn; "..yellow.."52.3,52.8"..white..").\nQuestline has 16 quests. Final reward blue items:1) OffHand Int/Shadow res/damage and healing, 2) Mail Shoulders Str/Stam, 3) Leather Gloves Str/Agi/Stam\nGilnid is at "..yellow.."[4]"..white..".",
    Prequest = "The Harvest Golem Mystery VIII",
    Folgequest = "The Harvest Golem Mystery X",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Tinkering Belt",
            ID = "60684",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_LEATHER,
        },
        {
            Name = "Safety Wraps",
            ID = "60685",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_CLOTH,
        },
        {
            Name = "Harvest Golem Arm",
            ID = "60686",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[1].Quests.Alliance[10] = {
    Title = "10. Turning Off The Tap",
    Level = "20",
    Attain = "14",
    Aim = "Infiltrate the Deadmines in Westfall and acquire Voss' Sizzling Brew.",
    Location = "Renzik 'The Shiv' (Stormwind - Old Town; "..yellow.."76, 60"..white..")",
    Note = "You start this Questline at the same NPC. Drop from Jared Voss is at "..yellow.."[1]"..white..".",
    Prequest = "Drones In Westfall -> Venture Delivery",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Operative Cloak",
            ID = "70239",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Cuffs of Integrity",
            ID = "70240",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[1].Quests.Horde[1] = {
    Title = "1. Prototype Thievery",
    Level = "18",
    Attain = "16",
    Aim = "Bring the Prototype Shredder X0-1 Schematic to Wrix Ozzlenut.",
    Location = "Wrix Ozzlenut (Durotar - Sparkwater Port; "..yellow.."58.3,25.7"..white..")",
    Note = "Sneed drops the Prototype Shredder X0-1 Schematic "..yellow.."[3]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Foe Chopper",
            ID = "81316",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
        {
            Name = "Shining Electro-lantern",
            ID = "81317",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
    }
}
kQuestInstanceData[1].Quests.Horde[2] = {
    Title = "2. Captain Grayson's Revenge",
    Level = "22",
    Attain = "15",
    Aim = "End Cookie, bring Grayson's Pendant",
    Location = "Captain Grayson (Westfall - Lighthouse; "..yellow.."30,86"..white..")",
    Note = "You start this Quest line on the northwest island in Westfall; Red book on the ground "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "Food for Sailing Thoughts?",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Grayson's Hat",
            ID = "70070",
            Color = green,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[1].Quests.Horde[3] = {
    Title = "3. Horde Defender's Axe",
    Level = "18",
    Attain = "15",
    Aim = "Bring a Stolen Tombstone to Nargal Deatheye at the Crossroads",
    Location = "Birgitte Cranston <Portal Trainer> (Thunder Bluff"..yellow.."34.4,20.3"..white..")",
    Note = "You start this Questline at Nargal Deatheye (Crossroads "..yellow.."51.2,29.1"..white..").\nThis quest "..red.."JUST TELEPORTS you to WESTFALL"..white..". You can either finish this quest and get the reward after completing questline or use it as westfall teleport retaking the quest.",
    Prequest = "Horde Defender's Axe",
    Folgequest = "Horde Defender's Axe",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Horde Defender's Axe",
            ID = "40065",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
    }
}

--------------- INST2 - Wailing Caverns ---------------
kQuestInstanceData[2] = {
    Story = "Recently, a night elf druid named Naralex discovered a network of underground caverns within the heart of the Barrens. Dubbed the 'Wailing Caverns', these natural caves were filled with steam fissures which produced long, mournful wails as they vented. Naralex believed he could use the caverns' underground springs to restore lushness and fertility to the Barrens - but to do so would require siphoning the energies of the fabled Emerald Dream. Once connected to the Dream however, the druid's vision somehow became a nightmare. Soon the Wailing Caverns began to change - the waters turned foul and the once-docile creatures inside metamorphosed into vicious, deadly predators. It is said that Naralex himself still resides somewhere inside the heart of the labyrinth, trapped beyond the edges of the Emerald Dream. Even his former acolytes have been corrupted by their master's waking nightmare - transformed into the wicked Druids of the Fang.",
    Caption = "Wailing Caverns",
    QAA = "8 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[2].Quests.Alliance[1] = {
    Title = "1. Deviate Hides",
    Level = "17",
    Attain = "13",
    Aim = "Nalpak in the Wailing Caverns wants 20 Deviate Hides.",
    Location = "Nalpak (Barrens - Wailing Caverns; "..yellow.."47,36"..white..")",
    Note = "All deviate mobs inside of and right before the entrance to the instance can drop hides.\nNalpak can be found in a hidden cave above the actual cave entrance. Easiest way to him seems to be to run up the hill outside and behind the entrance and drop down the slight ledge above the cave entrance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Slick Deviate Leggings",
            ID = "6480",
            Color = green,
            Description = AQITEM_LEGS..AQITEM_LEATHER,
        },
        {
            Name = "Deviate Hide Pack",
            ID = "918",
            Color = white,
            Description = AQITEM_BAG,
        },
    }
}
kQuestInstanceData[2].Quests.Alliance[2] = {
    Title = "2. Trouble at the Docks",
    Level = "18",
    Attain = "14",
    Aim = "Crane Operator Bigglefuzz in Ratchet wants you to retrieve the bottle of 99-Year-Old Port from Mad Magglish who is hiding in the Wailing Caverns.",
    Location = "Crane Operator Bigglefuzz (Barrens - Ratchet; "..yellow.."63,37"..white..")",
    Note = "You get the bottle right before you go into the instance by killing Mad Magglish. When you first enter the cave make an immediate right to find him at the end of the passage. He is stealthed by the wall at "..yellow.."[2] on the Entrance Map"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[2].Quests.Alliance[3] = {
    Title = "3. Smart Drinks",
    Level = "18",
    Attain = "13",
    Aim = "Bring 6 portions of Wailing Essence to Mebok Mizzyrix in Ratchet.",
    Location = "Mebok Mizzyrix (Barrens - Ratchet; "..yellow.."62,37"..white..")",
    Note = "The prequest can be obtained from Mebok Mizzyrix too.\nAll Ectoplasm enemies in and before the instance drop the Essence.",
    Prequest = "Raptor Horns",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[2].Quests.Alliance[4] = {
    Title = "4. Deviate Eradication",
    Level = "21",
    Attain = "15",
    Aim = "Ebru in the Wailing Caverns wants you to kill 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers and 7 Deviate Dreadfangs.",
    Location = "Ebru (Barrens - Wailing Caverns; "..yellow.."47,36"..white..")",
    Note = "Ebru is in a hidden cave above the cave entrance. Easiest way to him seems to be to run up the hill outside and behind the entrance and drop down the slight ledge above the cave entrance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Pattern: Deviate Scale Belt",
            ID = "6476",
            Color = green,
            Description = AQITEM_PATTERN,
        },
        {
            Name = "Sizzle Stick",
            ID = "8071",
            Color = green,
            Description = AQITEM_WAND,
        },
        {
            Name = "Dagmire Gauntlets",
            ID = "6481",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[2].Quests.Alliance[5] = {
    Title = "5. The Glowing Shard",
    Level = "26",
    Attain = "15",
    Aim = "Travel to Ratchet to find someone that can tell you more about the glowing shard.",
    Location = "The Glowing Shard (drops from Mutanus the Devourer; "..yellow.."[9]"..white..")",
    Note = "Mutanus the Devourer will only appear if you kill the four leader druids of the fang and escort the tauren druid at the entrance.\nWhen you have the Shard, you must bring it to the Bank at Ratchet, and then back to the top of the hill over Wailing Caverns to Falla Sagewind.",
    Prequest = "No",
    Folgequest = "In Nightmares",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Talbar Mantle",
            ID = "10657",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
        {
            Name = "Quagmire Galoshes",
            ID = "10658",
            Color = green,
            Description = AQITEM_FEET..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[2].Quests.Alliance[6] = {
    Title = "6. Serpentbloom",
    Level = "18",
    Attain = "16",
    Aim = "Alanndarian Nightsong in Auberdine has tasked you with the collection on 10 Serpentblooms.",
    Location = "Alanndarian Nightsong (Auberdine - Darkshore; "..yellow.."37.7,40.7"..white..")",
    Note = "You get the Serpentbloom inside the cave in front of the instance and inside the instance. Players with Herbalism can see the plants on their minimap.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Greenweave Sash",
            ID = "51850",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_CLOTH,
        },
        {
            Name = "Verdant Boots",
            ID = "51851",
            Color = green,
            Description = AQITEM_FEET..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[2].Quests.Alliance[7] = {
    Title = "7. Trapped in the Nightmare",
    Level = "19",
    Attain = "16",
    Aim = "Alanndarian Nightsong wants you to venture into the Wailing Caverns in the Northern Barrens and free Naralex from the Nightmare. Find his Disciple in the caverns to learn how. Return to her when you free Naralex.\nSlain Mutanus the Devourer"..yellow.."[9]"..white..".",
    Location = "Alanndarian Nightsong (Auberdine - Darkshore; "..yellow.."37.7,40.7"..white..")",
    Note = "Mutanus the Devourer will only appear if you kill the four leader druids of the fang and escort the tauren druid at the entrance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Ancient Elven Robes",
            ID = "51848",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
        {
            Name = "Thunderhorn",
            ID = "51849",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[2].Quests.Alliance[8] = {
    Title = "8. Rampant Weeds",
    Level = "20",
    Attain = "17?",
    Aim = "Thundris Windweaver in Auberdine needs samples of the Unnatural Overgrowths in the Wailing Caverns.",
    Location = "Thundris Windweaver (Auberdine - Darkshore; "..yellow.."37.4,40.1"..white..")",
    Note = "Elementals - Unnatural Overgrowth drop Overgrowth Samples.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1 (x3)"..AQDiscription_OR..white.."2 (x3)",
        {
            Name = "Mana Potion",
            ID = "3827",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Greater Healing Potion",
            ID = "1710",
            Color = white,
            Description = AQITEM_POTION,
        },
    }
}
kQuestInstanceData[2].Quests.Horde[1] = kQuestInstanceData[2].Quests.Alliance[1]
kQuestInstanceData[2].Quests.Horde[2] = kQuestInstanceData[2].Quests.Alliance[2]
kQuestInstanceData[2].Quests.Horde[3] = {
    Title = "3. Serpentbloom",
    Level = "18",
    Attain = "14",
    Aim = "Apothecary Zamah in Thunder Bluff wants you to collect 10 Serpentbloom.",
    Location = "Apothecary Zamah (Thunder Bluff - Spirit Rise; "..yellow.."22,20"..white..")",
    Note = "Apothecary Zamah is in a cave under the Spirit Rise.  You get the prequest from Apothecary Helbrim (Barrens - Crossroads; "..yellow.."51,30"..white..").\nYou get the Serpentbloom inside the cave in front of the instance and inside the instance. Players with Herbalism can see the plants on their minimap.",
    Prequest = "Fungal Spores -> Apothecary Zamah",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Apothecary Gloves",
            ID = "10919",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[2].Quests.Horde[4] = {
    Title = "4. Smart Drinks",
    Level = "18",
    Attain = "13",
    Aim = "Bring 6 portions of Wailing Essence to Mebok Mizzyrix in Ratchet.",
    Location = "Mebok Mizzyrix (Barrens - Ratchet; "..yellow.."62,37"..white..")",
    Note = "The prequest can be obtained from Mebok Mizzyrix too.\nAll Ectoplasm enemies in and before the instance drop the Essence.",
    Prequest = "Raptor Horns",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[2].Quests.Horde[5] = {
    Title = "5. Deviate Eradication",
    Level = "21",
    Attain = "15",
    Aim = "Ebru in the Wailing Caverns wants you to kill 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers and 7 Deviate Dreadfangs.",
    Location = "Ebru (Barrens - Wailing Caverns; "..yellow.."47,36"..white..")",
    Note = "Ebru is in a hidden cave above the cave entrance. Easiest way to him seems to be to run up the hill outside and behind the entrance and drop down the slight ledge above the cave entrance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Pattern: Deviate Scale Belt",
            ID = "6476",
            Color = green,
            Description = AQITEM_PATTERN,
        },
        {
            Name = "Sizzle Stick",
            ID = "8071",
            Color = green,
            Description = AQITEM_WAND,
        },
        {
            Name = "Dagmire Gauntlets",
            ID = "6481",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[2].Quests.Horde[6] = {
    Title = "6. Leaders of the Fang",
    Level = "22",
    Attain = "11",
    Aim = "Bring the Gems of Cobrahn, Anacondra, Pythas and Serpentis to Nara Wildmane in Thunder Bluff.",
    Location = "Nara Wildmane (Thunder Bluff - Elder Rise; "..yellow.."75,31"..white..")",
    Note = "The Questline starts at Hamuul Runetotem (Thunderbluff - Elder Rise; "..yellow.."78,28"..white..")\nThe 4 druids drop the gems "..yellow.."[2]"..white..", "..yellow.."[3]"..white..", "..yellow.."[5]"..white..", "..yellow.."[7]"..white..".",
    Prequest = "The Barrens Oases -> Nara Wildmane",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Crescent Staff",
            ID = "6505",
            Color = blue,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Wingblade",
            ID = "6504",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[2].Quests.Horde[7] = {
    Title = "7. The Glowing Shard",
    Level = "26",
    Attain = "15",
    Aim = "Travel to Ratchet to find someone that can tell you more about the glowing shard.",
    Location = "The Glowing Shard (drops from Mutanus the Devourer; "..yellow.."[9]"..white..")",
    Note = "Mutanus the Devourer will only appear if you kill the four leader druids of the fang and escort the tauren druid at the entrance.\nWhen you have the Shard, you must bring it to the Bank at Ratchet, and then back to the top of the hill over Wailing Caverns to Falla Sagewind.",
    Prequest = "No",
    Folgequest = "In Nightmares",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Talbar Mantle",
            ID = "10657",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
        {
            Name = "Quagmire Galoshes",
            ID = "10658",
            Color = green,
            Description = AQITEM_FEET..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[2].Quests.Horde[8] = {
    Title = "8. Arcane Arms",
    Level = "18",
    Attain = "14",
    Aim = "Bring Chok'Garok 5 pieces of Moontouched Wood"..yellow.."trash"..white..", a Crystal of the Serpent, and an Everchanging Essence from Wailing Caverns.",
    Location = "Chok'Garok <Stonemaul Clan> (on a bank of Southfury River in the Barrens; "..yellow.."62.4,10.8"..white..")",
    Note = red.."Mage ONLY."..white.." The Questline starts at Ureda <Mage Trainer> (Orgrimar) with quest 'Mastering the Arcane'.\nMoontouched Wood you get from "..yellow.."trash"..white..", a Crystal of the Serpent from Lord Serpentis <Fanglord>"..yellow.."[7]"..white..", and an Everchanging Essence from Lord Pythas <Fanglord> "..yellow.."[5]"..white..".",
    Prequest = "Mastering the Arcane",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Staff of the Arcane Path",
            ID = "80860",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_STAFF,
        },
        {
            Name = "Spellweaving Dagger",
            ID = "80861",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
    }
}
kQuestInstanceData[2].Quests.Horde[9] = {
    Title = "9. Against the Kolkar Dream",
    Level = "23",
    Attain = "??",
    Aim = "Slay Zandara Windhoof within Wailing Caverns, and bring her back to Nalpak in the Barrens.",
    Location = "Nalpak (Barrens - Wailing Caverns; "..yellow.."47,36"..white..")",
    Note = "You need to kill Zandara Windhoof [6] and take her head.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Kolkar Drape",
            ID = "70224",
            Color = blue,
            Description = AQITEM_BACK,
        },
    }
}

--------------- INST3 - Ragefire Chasm ---------------
kQuestInstanceData[3] = {
    Story = "Ragefire Chasm consists of a network of volcanic caverns that lie below the orcs' new capital city of Orgrimmar. Recently, rumors have spread that a cult loyal to the demonic Shadow Council has taken up residence within the Chasm's fiery depths. This cult, known as the Burning Blade, threatens the very sovereignty of Durotar. Many believe that the orc Warchief, Thrall, is aware of the Blade's existence and has chosen not to destroy it in the hopes that its members might lead him straight to the Shadow Council. Either way, the dark powers emanating from Ragefire Chasm could undo all that the orcs have fought to attain.",
    Caption = "Ragefire Chasm",
    QAA = "No Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[3].Quests.Horde[1] = {
    Title = "1. Testing an Enemy's Strength",
    Level = "15",
    Attain = "9",
    Aim = "Search Orgrimmar for Ragefire Chasm, then kill 8 Ragefire Troggs and 8 Ragefire Shaman before returning to Rahauro in Thunder Bluff.",
    Location = "Rahauro (Thunder Bluff - Elder Rise; "..yellow.."70,29"..white..")",
    Note = "You find the troggs at the beginning.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[3].Quests.Horde[2] = {
    Title = "2. The Power to Destroy...",
    Level = "16",
    Attain = "9",
    Aim = "Bring the books Spells of Shadow and Incantations from the Nether to Varimathras in Undercity.",
    Location = "Varimathras (Undercity - Royal Quarter; "..yellow.."56,92"..white..")",
    Note = "Searing Blade Cultists and Warlocks drop the books",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Ghastly Trousers",
            ID = "15449",
            Color = green,
            Description = AQITEM_LEGS..AQITEM_CLOTH,
        },
        {
            Name = "Dredgemire Leggings",
            ID = "15450",
            Color = green,
            Description = AQITEM_LEGS..AQITEM_LEATHER,
        },
        {
            Name = "Gargoyle Leggings",
            ID = "15451",
            Color = green,
            Description = AQITEM_LEGS..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[3].Quests.Horde[3] = {
    Title = "3. Searching for the Lost Satchel",
    Level = "16",
    Attain = "9",
    Aim = "Search Ragefire Chasm for Maur Grimtotem's corpse and search it for any items of interest.",
    Location = "Rahauro (Thunder Bluff - Elder Rise; "..yellow.."70,29"..white..")",
    Note = "You find Maur Grimtotem at "..yellow.."[1]"..white..". After getting the satchel you must bring it back to Rahauro in Thunder Bluff",
    Prequest = "No",
    Folgequest = "Returning the Lost Satchel",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Featherbead Bracers",
            ID = "15452",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_CLOTH,
        },
        {
            Name = "Savannah Bracers",
            ID = "15453",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[3].Quests.Horde[4] = {
    Title = "4. Hidden Enemies",
    Level = "16",
    Attain = "9",
    Aim = "Kill Bazzalan and Jergosh the Invoker before returning to Thrall in Orgrimmar.",
    Location = "Thrall (Orgrimmar - Valley of Wisdom; "..yellow.."31,37"..white..")",
    Note = "You find Bazzalan at  "..yellow.."[4]"..white.." and Jergosh at "..yellow.."[3]"..white..". The questline starts at Warchief Thrall in Orgrimmar.",
    Prequest = "Hidden Enemies",
    Folgequest = "Hidden Enemies",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Kris of Orgrimmar",
            ID = "15443",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
        {
            Name = "Hammer of Orgrimmar",
            ID = "15445",
            Color = green,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
        {
            Name = "Axe of Orgrimmar",
            ID = "15424",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
        {
            Name = "Staff of Orgrimmar",
            ID = "15444",
            Color = green,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[3].Quests.Horde[5] = {
    Title = "5. Slaying the Beast",
    Level = "16",
    Attain = "9",
    Aim = "Enter Ragefire Chasm and slay Taragaman the Hungerer, then bring his heart back to Neeru Fireblade in Orgrimmar.",
    Location = "Neeru Fireblade (Orgrimmar - Cleft of Shadow; "..yellow.."49,50"..white..")",
    Note = "You find Taragaman at "..yellow.."[2]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST4 - Uldaman ---------------
kQuestInstanceData[4] = {
    Story = "Uldaman is an ancient Titan vault that has laid buried deep within the earth since the world's creation. Dwarven excavations have recently penetrated this forgotten city, releasing the Titans' first failed creations: the troggs. Legends say that the Titans created troggs from stone. When they deemed the experiment a failure, the Titans locked the troggs away and tried again - resulting in the creation of the dwarven race. The secrets of the dwarves' creation are recorded on the fabled Discs of Norgannon - massive Titan artifacts that lie at the very bottom of the ancient city. Recently, the Dark Iron dwarves have launched a series of incursions into Uldaman, hoping to claim the discs for their fiery master, Ragnaros. However, protecting the buried city are several guardians - giant constructs of living stone that crush any hapless intruders they find. The Discs themselves are guarded by a massive, sentient Stonekeeper called Archaedas. Some rumors even suggest that the dwarves' stone-skinned ancestors, the earthen, still dwell deep within the city's hidden recesses.",
    Caption = "Uldaman",
    QAA = "17 Quests",
    QAH = "11 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[4].Quests.Alliance[1] = {
    Title = "1. A Sign of Hope",
    Level = "35",
    Attain = "33",
    Aim = "Find Hammertoe Grez in Uldaman.",
    Location = "Prospector Ryedol (Badlands; "..yellow.."53,43"..white..")",
    Note = "The Prequest starts at the Crumpled Map (Badlands; "..yellow.."53,33"..white..").\nYou find Hammertoe Grez before you enter the instance, at "..yellow.."[1]"..white.." on the Entrance map.",
    Prequest = "A Sign of Hope",
    Folgequest = "Amulet of Secrets",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[2] = {
    Title = "2. Amulet of Secrets",
    Level = "40",
    Attain = "35",
    Aim = "Find Hammertoe's Amulet and return it to him in Uldaman.",
    Location = "Hammertoe Grez (Uldaman; "..yellow.."[1] on Entrance Map"..white..").",
    Note = "The Amulet drops from Magregan Deepshadow at "..yellow.."[2] on the Entrance Map"..white..".",
    Prequest = "A Sign of Hope",
    Folgequest = "Prospect of Faith",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[3] = {
    Title = "3. The Lost Tablets of Will",
    Level = "45",
    Attain = "35",
    Aim = "Find the Tablet of Will, and return them to Advisor Belgrum in Ironforge.",
    Location = "Advisor Belgrum (Ironforge - Hall of Explorers; "..yellow.."77,10"..white..")",
    Note = "The tablet is at "..yellow.."[8]"..white..".",
    Prequest = "Amulet of Secrets -> An Ambassador of Evil",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Medal of Courage",
            ID = "6723",
            Color = green,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[4] = {
    Title = "4. Power Stones",
    Level = "36",
    Attain = "30",
    Aim = "Bring 8 Dentrium Power Stones and 8 An'Alleum Power Stones to Rigglefuzz in the Badlands.",
    Location = "Rigglefuzz (Badlands; "..yellow.."42,52"..white..")",
    Note = "The stones can be found on any Shadowforge enemies before and in the instance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Energized Stone Circle",
            ID = "9522",
            Color = green,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Duracin Bracers",
            ID = "10358",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
        {
            Name = "Everlast Boots",
            ID = "10359",
            Color = green,
            Description = AQITEM_FEET..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[5] = {
    Title = "5. Agmond's Fate",
    Level = "38",
    Attain = "30",
    Aim = "Bring 4 Carved Stone Urns to Prospector Ironband in Loch Modan.",
    Location = "Prospector Ironband (Loch Modan - Ironband's Excavation Site; "..yellow.."65,65"..white..")",
    Note = "The Prequest starts at Prospector Stormpike (Ironforge - Hall of Explorers; "..yellow.."74,12"..white..").\nThe Urns are scattered throughout the caves before the instance.",
    Prequest = "Ironband Wants You! -> Murdaloc",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Prospector Gloves",
            ID = "4980",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[6] = {
    Title = "6. Solution to Doom",
    Level = "40",
    Attain = "30",
    Aim = "Bring the Tablet of Ryun'eh to Theldurin the Lost.",
    Location = "Theldurin the Lost (Badlands; "..yellow.."51,76"..white..")",
    Note = "The tablet is north of the caves, at the east end of a tunnel, before the instance. On the Entrance map, it's at "..yellow.."[3]"..white..".",
    Prequest = "No",
    Folgequest = "To Ironforge for Yagyin's Digest",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Doomsayer's Robe",
            ID = "4746",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[7] = {
    Title = "7. The Lost Dwarves",
    Level = "40",
    Attain = "35",
    Aim = "Find Baelog in Uldaman.",
    Location = "Prospector Stormpike (Ironforge - Hall of Explorers; "..yellow.."75,12"..white..")",
    Note = "Baelog is at "..yellow.."[1]"..white..".",
    Prequest = "No",
    Folgequest = "The Hidden Chamber",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[8] = {
    Title = "8. The Hidden Chamber",
    Level = "40",
    Attain = "35",
    Aim = "Read Baelog's Journal, explore the hidden chamber, then report to Prospector Stormpike.",
    Location = "Baelog (Uldaman; "..yellow.."[1]"..white..")",
    Note = "The Hidden Chamber is at "..yellow.."[4]"..white..". To open the Hidden Chamber you need The Shaft of Tsol from Revelosh "..yellow.."[3]"..white.." and the Gni'kiv Medallion from Baelog's Chest "..yellow.."[1]"..white..". Combine these two items to form Staff of Prehistoria. The Staff is used in the Map Room between "..yellow.."[3] and [4]"..white.." to summon Ironaya. After killing her, run inside the room she came from to get quest credit.",
    Prequest = "The Lost Dwarves",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Dwarven Charge",
            ID = "9626",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
        {
            Name = "Explorer's League Lodestar",
            ID = "9627",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[9] = {
    Title = "9. The Shattered Necklace",
    Level = "41",
    Attain = "37",
    Aim = "Search for the original creator of the shattered necklace to learn of its potential value.",
    Location = "Shattered Necklace (random drop from Uldaman)",
    Note = "Bring the necklace to Talvash del Kissel (Ironforge - The Mystic Ward; "..yellow.."36,3"..white..").",
    Prequest = "No",
    Folgequest = "Lore for a Price",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[10] = {
    Title = "10. Back to Uldaman",
    Level = "42",
    Attain = "37",
    Aim = "Search for clues as to the current disposition of Talvash's necklace within Uldaman. The slain paladin he mentioned was the person who has it last.",
    Location = "Talvash del Kissel (Ironforge - The Mystic Ward; "..yellow.."36,3"..white..")",
    Note = "The Paladin is at "..yellow.."[2]"..white..".",
    Prequest = "Lore for a Price",
    Folgequest = "Find the Gems",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[11] = {
    Title = "11. Find the Gems",
    Level = "43",
    Attain = "40",
    Aim = "Find the ruby, sapphire, and topaz that are scattered throughout Uldaman. Once acquired, contact Talvash del Kissel remotely by using the Phial of Scrying he previously gave you.",
    Location = "Remains of a Paladin (Uldaman; "..yellow.."[2]"..white..")",
    Note = "The gems are at "..yellow.."[1]"..white.." in a Conspicous Urn, "..yellow.."[8]"..white.." from the Shadowforge Cache, and "..yellow.."[9]"..white.." off Grimlok. Note that when openning the Shadowforge Cache, a few mobs will spawn an aggro you.\nUse Talvash's Scrying Bowl to turn the quest in and get the followup.",
    Prequest = "Back to Uldaman",
    Folgequest = "Restoring the Necklace",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[12] = {
    Title = "12. Restoring the Necklace",
    Level = "44",
    Attain = "37",
    Aim = "Obtain a power source from the most powerful construct you can find in Uldaman, and deliver it to Talvash del Kissel in Ironforge.",
    Location = "Talvash's Scrying Bowl",
    Note = "The Shattered Necklace Power Source drops Archaedas "..yellow.."[10]"..white..".",
    Prequest = "Find the Gems",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Talvash's Enhancing Necklace",
            ID = "7673",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[13] = {
    Title = "13. Uldaman Reagent Run",
    Level = "42",
    Attain = "36",
    Aim = "Bring 12 Magenta Fungus Caps to Ghak Healtouch in Thelsamar.",
    Location = "Ghak Healtouch (Loch Modan - Thelsamar; "..yellow.."37,49"..white..")",
    Note = "The caps are scattered throughout the instance. Herbalists can see them on their minimap if Track Herbs is on and they have the quest.",
    Prequest = "Badlands Reagent Run",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1(x5)",
        {
            Name = "Restorative Potion",
            ID = "9030",
            Color = white,
            Description = AQITEM_POTION,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[14] = {
    Title = "14. Reclaimed Treasures",
    Level = "43",
    Attain = "33",
    Aim = "Get Krom Stoutarm's treasured possession from his chest in the North Common Hall of Uldaman, and bring it to him in Ironforge.",
    Location = "Krom Stoutarm (Ironforge - Hall of Explorers; "..yellow.."74,9"..white..")",
    Note = "You find the treasure before you enter the instance. It is in the north of the caves, at the southeast end of the first tunnel. On the entrance map, it's at "..yellow.."[4]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[15] = {
    Title = "15. The Platinum Discs",
    Level = "47",
    Attain = "40",
    Aim = "Speak with stone watcher and learn what ancient lore it keeps. Once you have learned what lore it has to offer, activate the Discs of Norgannon. -> Take the miniature version of the Discs of Norgannon to the Explorers' League in Ironforge.",
    Location = "The Discs of Norgannon (Uldaman; "..yellow.."[11]"..white..")",
    Note = "After you receive the quest, speak to the stone watcher to the left of the discs.  Then use the platinum discs again to recieve miniature discs, which you'll have to take to High Explorer Magellas in Ironforge - Hall of Explorers ("..yellow.."69,18"..white.."). The followup starts another NPC who is nearby.",
    Prequest = "No",
    Folgequest = "Portents of Uldum",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2(x5)"..AQDiscription_OR..white.."3(x5)",
        {
            Name = "Thawpelt Sack",
            ID = "9587",
            Color = white,
            Description = AQITEM_BAG,
        },
        {
            Name = "Superior Healing Potion",
            ID = "3928",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Greater Mana Potion",
            ID = "6149",
            Color = white,
            Description = AQITEM_POTION,
        },
    }
}
kQuestInstanceData[4].Quests.Alliance[16] = {
    Title = "16. Power in Uldaman",
    Level = "40",
    Attain = "35",
    Aim = "Retrieve an Obsidian Power Source and bring it to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; "..yellow.."46,57"..white..")",
    Note = red.."Mage only"..white..": The Obsidian Power Source drops from the Obsidian Sentinel at "..yellow.."[5]"..white..".",
    Prequest = "The Exorcism",
    Folgequest = "Mana Surges",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Alliance[17] = {
    Title = "17. Stealing a Core",
    Level = "45",
    Attain = "45",
    Aim = "Acquire an Intact Power Core  from Uldaman's Ancient Treasure "..yellow.."[11]"..white..".",
    Location = "Torble Sparksprocket (The Barrens; "..yellow.."48.6,83"..white.." gnome with purple goggles under the tent, next to the dwarf)",
    Note = "Intact Power Core "..yellow.."[11]"..white..", in the room with platinum disc behind the last boss in the chest behind the right pillar.\nQuestline starts in Southern Barrens -> Bael Modan -> a little north from the path to Bael'dun Keep under the tent. First quest can be attain at lvl 18, last at lvl 53",
    Prequest = "An Ancient Acquisition",
    Folgequest = "The Activation",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Broken Core Pendant",
            ID = "60518",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[4].Quests.Horde[1] = {
    Title = "1. Power Stones",
    Level = "36",
    Attain = "30",
    Aim = "Bring 8 Dentrium Power Stones and 8 An'Alleum Power Stones to Rigglefuzz in the Badlands.",
    Location = "Rigglefuzz (Badlands; "..yellow.."42,52"..white..")",
    Note = "The stones can be found on any Shadowforge enemies before and in the instance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Energized Stone Circle",
            ID = "9522",
            Color = green,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Duracin Bracers",
            ID = "10358",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
        {
            Name = "Everlast Boots",
            ID = "10359",
            Color = green,
            Description = AQITEM_FEET..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[4].Quests.Horde[2] = {
    Title = "2. Solution to Doom",
    Level = "40",
    Attain = "30",
    Aim = "Bring the Tablet of Ryun'eh to Theldurin the Lost.",
    Location = "Theldurin the Lost (Badlands; "..yellow.."51,76"..white..")",
    Note = "The tablet is north of the caves, at the east end of a tunnel, before the instance. On the Entrance map, it's at "..yellow.."[3]"..white..".",
    Prequest = "No",
    Folgequest = "To Ironforge for Yagyin's Digest",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Doomsayer's Robe",
            ID = "4746",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[4].Quests.Horde[3] = {
    Title = "3. Necklace Recovery",
    Level = "41",
    Attain = "37",
    Aim = "Look for a valuable necklace within the Uldaman dig site and bring it back to Dran Droffers in Orgrimmar. The necklace may be damaged.",
    Location = "Dran Droffers (Orgrimmar - The Drag; "..yellow.."59,36"..white..")",
    Note = "The necklace is a random drop in the instance.",
    Prequest = "No",
    Folgequest = "Necklace Recovery, Take 2",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Horde[4] = {
    Title = "4. Necklace Recovery, Take 2",
    Level = "41",
    Attain = "37",
    Aim = "Find a clue as to the gems' whereabouts in the depths of Uldaman.",
    Location = "Dran Droffers (Orgrimmar - The Drag; "..yellow.."59,36"..white..")",
    Note = "The Paladin is at "..yellow.."[2]"..white..".",
    Prequest = "Necklace Recovery",
    Folgequest = "Translating the Journal",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Horde[5] = {
    Title = "5. Translating the Journal",
    Level = "42",
    Attain = "37",
    Aim = "Find someone who can translate the paladin's journal. The closest location that might have someone is Kargath, in the Badlands.",
    Location = "Remains of a Paladin (Uldaman; "..yellow.."[2]"..white..")",
    Note = "The translator Jarkal Mossmeld is in Kargath (Badlands; "..yellow.."2,46"..white..").",
    Prequest = "Necklace Recovery, Take 2",
    Folgequest = "Find the Gems and Power Source",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Horde[6] = {
    Title = "6. Find the Gems and Power Source",
    Level = "44",
    Attain = "37",
    Aim = "Recover all three gems and a power source for the necklace from Uldaman, and then bring them to Jarkal Mossmeld in Kargath. Jarkal believes a power source might be found on the strongest construct present in Uldaman.",
    Location = "Jarkal Mossmeld (Badlands - Kargath; "..yellow.."2,46"..white..")",
    Note = "The gems are at "..yellow.."[1]"..white.." in a Conspicous Urn, "..yellow.."[8]"..white.." from the Shadowforge Cache, and "..yellow.."[9]"..white.." off Grimlok. Note that when openning the Shadowforge Cache, a few mobs will spawn an aggro you. The Shattered Necklace Power Source drops from Archaedas "..yellow.."[10]"..white..".",
    Prequest = "Translating the Journal",
    Folgequest = "Deliver the Gems",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Jarkal's Enhancing Necklace",
            ID = "7888",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[4].Quests.Horde[7] = {
    Title = "7. Uldaman Reagent Run",
    Level = "42",
    Attain = "36",
    Aim = "Bring 12 Magenta Fungus Caps to Jarkal Mossmeld in Kargath.",
    Location = "Jarkal Mossmeld (Badlands - Kargath; "..yellow.."2,69"..white..")",
    Note = "You get the Prequest from Jarkal Mossmeld, too.\nThe caps are scattered throughout the instance. Herbalists can see them on their minimap if Track Herbs is on and they have the quest.",
    Prequest = "Badlands Reagent Run",
    Folgequest = "Badlands Reagent Run II",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1(x5)",
        {
            Name = "Restorative Potion",
            ID = "9030",
            Color = white,
            Description = AQITEM_POTION,
        },
    }
}
kQuestInstanceData[4].Quests.Horde[8] = {
    Title = "8. Reclaimed Treasures",
    Level = "43",
    Attain = "33",
    Aim = "Get Patrick Garrett's family treasure from their family chest in the South Common Hall of Uldaman, and bring it to him in the Undercity.",
    Location = "Patrick Garrett (Undercity; "..yellow.."72,48"..white..")",
    Note = "You find the treasure before you enter the instance. It is at the end of the south tunnel. On the entrance map, it's at "..yellow.."[5]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Horde[9] = {
    Title = "9. The Platinum Discs",
    Level = "47",
    Attain = "40",
    Aim = "Speak with stone watcher and learn what ancient lore it keeps. Once you have learned what lore it has to offer, activate the Discs of Norgannon. -> Take the miniature version of the Discs of Norgannon to the one of the sages in Thunder Bluff.",
    Location = "The Discs of Norgannon (Uldaman; "..yellow.."[11]"..white..")",
    Note = "After you receive the quest, speak to the stone watcher to the left of the discs.  Then use the platinum discs again to recieve miniature discs, which you'll have to take to Sage Truthseeker in Thunder Bluff ("..yellow.."34,46"..white.."). The followup starts another NPC who is nearby.",
    Prequest = "No",
    Folgequest = "Portents of Uldum",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2(x5)"..AQDiscription_OR..white.."3(x5)",
        {
            Name = "Thawpelt Sack",
            ID = "9587",
            Color = white,
            Description = AQITEM_BAG,
        },
        {
            Name = "Superior Healing Potion",
            ID = "3928",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Greater Mana Potion",
            ID = "6149",
            Color = white,
            Description = AQITEM_POTION,
        },
    }
}
kQuestInstanceData[4].Quests.Horde[10] = {
    Title = "10. Power in Uldaman",
    Level = "40",
    Attain = "35",
    Aim = "Retrieve an Obsidian Power Source and bring it to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; "..yellow.."46,57"..white..")",
    Note = red.."Mage only"..white..": The Obsidian Power Source drops from the Obsidian Sentinel at "..yellow.."[5]"..white..".",
    Prequest = "The Exorcism",
    Folgequest = "Mana Surges",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[4].Quests.Horde[11] = {
    Title = "11. Requisitioning a Core",
    Level = "45",
    Attain = "45",
    Aim = "Acquire an Intact Power Core from Uldaman's Ancient Treasure "..yellow.."[11]"..white..".",
    Location = "Kex Blowmaster (The Barrens; "..yellow.."45.7,83.6"..white.." goblin under the tent.",
    Note = "Intact Power Core "..yellow.."[11]"..white..", in the room with platinum disc behind the last boss in the chest behind the right pillar.\nQuestline starts in Southern Barrens -> Bael Modan -> west side of the road to The Thousand Needles, accros Bael Modan Excavation. first quest can be taken at lvl 18. last at lvl 53.",
    Prequest = "A Profitable Acquisition",
    Folgequest = "The Profitable Activation",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Broken Core Pendant",
            ID = "60518",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}

--------------- INST5 - Blackrock Depths ---------------
kQuestInstanceData[5] = {
    Story = "Once the capital city of the Dark Iron dwarves, this volcanic labyrinth now serves as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain. Obsessed with defeating Nefarian and his draconic minions, Ragnaros will go to any extreme to achieve final victory.",
    Caption = "Blackrock Depths",
    QAA = "23 Quests",
    QAH = "23 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[5].Quests.Alliance[1] = {
    Title = "1. Dark Iron Legacy",
    Level = "52",
    Attain = "48",
    Aim = "Slay Fineous Darkvire and recover the great hammer, Ironfel. Take Ironfel to the Shrine of Thaurissan and place it on the statue of Franclorn Forgewright.",
    Location = "Franclorn Forgewright (Blackrock Mountain; "..yellow.."[3] on Entrance map"..white..")",
    Note = "Franclorn is in the middle of the blackrock, above his grave. You have to be dead to see him! Talk 2 times with him to start the quest.\nFineous Darkvire is at "..yellow.."[9]"..white..". You find the Shrine next to the arena "..yellow.."[7]"..white..".",
    Prequest = "Dark Iron Legacy",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Shadowforge Key",
            ID = "11000",
            Color = white,
            Description = AQITEM_KEY,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[2] = {
    Title = "2. Ribbly Screwspigot",
    Level = "53",
    Attain = "48",
    Aim = "Bring Ribbly's Head to Yuka Screwspigot in the Burning Steppes.",
    Location = "Yuka Screwspigot (Burning Steppes - Flame Crest; "..yellow.."65,22"..white..")",
    Note = "You get the prequest from Yorba Screwspigot (Tanaris - Steamwheedle Port; "..yellow.."67,23"..white..").\nRibbly is at "..yellow.."[15]"..white..".",
    Prequest = "Yuka Screwspigot",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Rancor Boots",
            ID = "11865",
            Color = green,
            Description = AQITEM_FEET..AQITEM_CLOTH,
        },
        {
            Name = "Penance Spaulders",
            ID = "11963",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_LEATHER,
        },
        {
            Name = "Splintsteel Armor",
            ID = "12049",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[3] = {
    Title = "3. The Love Potion",
    Level = "54",
    Attain = "50",
    Aim = "Bring 4 Gromsblood, 10 Giant Silver Veins and Nagmara's Filled Vial to Mistress Nagmara in Blackrock Depths.",
    Location = "Mistress Nagmara (Blackrock Depths; "..yellow.."[15]"..white..")",
    Note = "You get the Giant Silver Veins from Giants in Azshara. Gromsblood can be most easily acquired from either an herbalist or at the Auction House. Lastly, the vial can be filled at the Go-Lakka crater (Un'Goro Crater; "..yellow.."31,50"..white..").\nAfter completing the quest, you can use the backdoor instead of killing Phalanx.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Manacle Cuffs",
            ID = "11962",
            Color = blue,
            Description = AQITEM_WRIST..AQITEM_CLOTH,
        },
        {
            Name = "Nagmara's Whipping Belt",
            ID = "11866",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[4] = {
    Title = "4. Hurley Blackbreath",
    Level = "55",
    Attain = "50",
    Aim = "Bring the Lost Thunderbrew Recipe to Ragnar Thunderbrew in Kharanos.",
    Location = "Ragnar Thunderbrew  (Dun Morogh - Kharanos; "..yellow.."46,52"..white..")",
    Note = "You get the prequest from Enohar Thunderbrew (Blasted Lands - Nethergarde Keep; "..yellow.."61,18"..white..").\nYou get the recipe from one of the guards who appear if you destroy the ale "..yellow.."[15]"..white..".",
    Prequest = "Ragnar Thunderbrew",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1(x10)"..AQDiscription_AND..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Dark Dwarven Lager",
            ID = "12003",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Swiftstrike Cudgel",
            ID = "11964",
            Color = green,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
        {
            Name = "Limb Cleaver",
            ID = "12000",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[5] = {
    Title = "5. Incendius!",
    Level = "56",
    Attain = "48",
    Aim = "Find Lord Incendius in Blackrock Depths and destroy him!",
    Location = "Jalinda Sprig (Burning Steppes - Morgan's Vigil; "..yellow.."85,69"..white..")",
    Note = "You get the prequest from Jalinda Sprig, too. You find Lord Incendius at "..yellow.."[10]"..white..".",
    Prequest = "Overmaster Pyron",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Sunborne Cape",
            ID = "12113",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Nightfall Gloves",
            ID = "12114",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_LEATHER,
        },
        {
            Name = "Crypt Demon Bracers",
            ID = "12112",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
        {
            Name = "Stalwart Clutch",
            ID = "12115",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[6] = {
    Title = "6. The Heart of the Mountain",
    Level = "55",
    Attain = "50",
    Aim = "Bring the Heart of the Mountain to Maxwort Uberglint in the Burning Steppes.",
    Location = "Maxwort Uberglint (Burning Steppes - Flame Crest; "..yellow.."65,23"..white..")",
    Note = "You find the Heart at "..yellow.."[8]"..white.." in a safe. You get the key for the safe from Warder Stillgiss. He appears after opening all small safes.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Alliance[7] = {
    Title = "7. The Good Stuff",
    Level = "56",
    Attain = "50",
    Aim = "Travel to Blackrock Depths and recover 20 Dark Iron Fanny Packs. Return to Oralius when you have completed this task. You assume that the Dark Iron dwarves inside Blackrock Depths carry these 'fanny pack' contraptions.",
    Location = "Oralius (Burning Steppes - Morgan's Vigil; "..yellow.."84,68"..white..")",
    Note = "All dwarves can drop the packs.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "A Dingy Fanny Pack",
            ID = "11883",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[8] = {
    Title = "8. Marshal Windsor",
    Level = "54",
    Attain = "48",
    Aim = "Travel to Blackrock Mountain in the northwest and enter Blackrock Depths. Find out what became of Marshal Windsor.\nYou recall Ragged John talking about Windsor being dragged off to a prison.",
    Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; "..yellow.."84,68"..white..")",
    Note = "This is part of the Onyxia attunement questline. It starts at Helendis Riverhorn (Burning Steppes - Morgan's Vigil; "..yellow.."85,68"..white..").\nMarshal Windsor is at "..yellow.."[4]"..white..". You have to come back to Maxwell after completing this quest.",
    Prequest = "Dragonkin Menace -> The True Masters",
    Folgequest = "Abandoned Hope",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Conservator Helm",
            ID = "12018",
            Color = green,
            Description = AQITEM_HEAD..AQITEM_MAIL,
        },
        {
            Name = "Shieldplate Sabatons",
            ID = "12021",
            Color = green,
            Description = AQITEM_FEET..AQITEM_PLATE,
        },
        {
            Name = "Windshear Leggings",
            ID = "12041",
            Color = green,
            Description = AQITEM_LEGS..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[9] = {
    Title = "9. A Crumpled Up Note",
    Level = "58",
    Attain = "50",
    Aim = "You may have just stumbled on to something that Marshal Windsor would be interested in seeing. There may be hope, after all.",
    Location = "A Crumpled Up Note (random drop from Blackrock Depths)",
    Note = "This is part of the Onyxia attunement questline. Marshal Windsor is at "..yellow.."[4]"..white..". Best chance for drops seems to be the Dark Iron mobs around the Quarry.",
    Prequest = "Abandoned Hope",
    Folgequest = "A Shred of Hope",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Alliance[10] = {
    Title = "10. A Shred of Hope",
    Level = "58",
    Attain = "50",
    Aim = "Return Marshal Windsor's Lost Information.\nMarshal Windsor believes that the information is being held by Golem Lord Argelmach and General Angerforge.",
    Location = "Marshal Windsor (Blackrock Depths; "..yellow.."[4]"..white..")",
    Note = "This is part of the Onyxia attunement questline. Marshal Windsor is at "..yellow.."[4]"..white..".\nYou find Golem Lord Argelmach at "..yellow.."[14]"..white..", General Angerforge at "..yellow.."[13]"..white..".",
    Prequest = "A Crumpled Up Note",
    Folgequest = "Jail Break!",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Alliance[11] = {
    Title = "11. Jail Break!",
    Level = "58",
    Attain = "50",
    Aim = "Help Marshal Windsor get his gear back and free his friends. Return to Marshal Maxwell if you succeed.",
    Location = "Marshal Windsor (Blackrock Depths; "..yellow.."[4]"..white..")",
    Note = "This is part of the Onyxia attunement questline. Marshal Windsor is at "..yellow.."[4]"..white..".\nThe quest is easier if you clean the Ring of Law ("..yellow.."[6]"..white..") and the path to the entrance before you start the event. You find Marshal Maxwell at Burning Steppes - Morgan's Vigil ("..yellow.."84,68"..white..")",
    Prequest = "A Shred of Hope",
    Folgequest = "Stormwind Rendezvous",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Ward of the Elements",
            ID = "12065",
            Color = green,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Blade of Reckoning",
            ID = "12061",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Skilled Fighting Blade",
            ID = "12062",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[12] = {
    Title = "12. A Taste of Flame",
    Level = "58",
    Attain = "52",
    Aim = "Travel to Blackrock Depths and slay Bael'Gar. "..yellow.."[11]"..white.." Return the Encased Fiery Essence to Cyrus Therepentous.",
    Location = "Cyrus Therepentous (Burning Steppes; "..yellow.."94,31"..white..")",
    Note = "The questline starts at Kalaran Windblade (Searing Gorge; "..yellow.."39,38"..white..").\nBael'Gar is at "..yellow.."[11]"..white..".",
    Prequest = "The Flawless Flame -> A Taste of Flame",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Shaleskin Cape",
            ID = "12066",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Wyrmhide Spaulders",
            ID = "12082",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_LEATHER,
        },
        {
            Name = "Valconian Sash",
            ID = "12083",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[13] = {
    Title = "13. Kharan Mighthammer",
    Level = "59",
    Attain = "50",
    Aim = "Travel to Blackrock Depths and find Kharan Mighthammer.\nThe King mentioned that Kharan was being held prisoner there - perhaps you should try looking for a prison.",
    Location = "King Magni Bronzebeard (Ironforge; "..yellow.."39,55"..white..")",
    Note = "The prequest starts at Royal Historian Archesonus (Ironforge; "..yellow.."38,55"..white.."). Kharan Mighthammer is at "..yellow.."[2]"..white..".",
    Prequest = "The Smoldering Ruins of Thaurissan",
    Folgequest = "Kharan's Tale",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Alliance[14] = {
    Title = "14. The Fate of the Kingdom",
    Level = "59",
    Attain = "50",
    Aim = "Return to Blackrock Depths and rescue Princess Moira Bronzebeard from the evil clutches of Emperor Dagran Thaurissan.",
    Location = "King Magni Bronzebeard (Ironforge; "..yellow.."39,55"..white..")",
    Note = "Princess Moira Bronzebeard is at "..yellow.."[21]"..white..". During the fight she might heal Dagran. Try to interrupt her as often as possible, but hurry as she must not die or you can't complete the quest! After talking to her you have to return to Magni Bronzebeard.",
    Prequest = "The Bearer of Bad News",
    Folgequest = "The Princess's Surprise",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Magni's Will",
            ID = "12548",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Songstone of Ironforge",
            ID = "12543",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[15] = {
    Title = "15. Attunement to the Core",
    Level = "60",
    Attain = "55",
    Aim = "Venture to the Molten Core entry portal in Blackrock Depths and recover a Core Fragment. Return to Lothos Riftwaker in Blackrock Mountain when you have recovered the Core Fragment.",
    Location = "Lothos Riftwaker (Blackrock Mountain; "..yellow.."[2] on Entrance Map"..white..")",
    Note = "After completing this quest, you can use the stone next to Lothos Riftwaker to enter the Molten Core.\nYou find the Core Fragment near "..yellow.."[23]"..white..", very close to the Molten Core portal.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Alliance[16] = {
    Title = "16. The Challenge",
    Level = "60",
    Attain = "58",
    Aim = "Travel to the Ring of the Law in Blackrock Depths and place the Banner of Provocation in its center as you are sentenced by High Justice Grimstone. Slay Theldren and his gladiators and return to Anthion Harmon in the Eastern Plaguelands with the first piece of Lord Valthalak's amulet.",
    Location = "Falrin Treeshaper (Dire Maul West; "..yellow.."[1] Library"..white..")",
    Note = "Followup quest is different for each class. Entire questline starts with quest 'An Earnest Proposition' from Deliana Ironforge Kings room behid The Bank",
    Prequest = "The Instigator's Enchantment",
    Folgequest = "(Class Quests)",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Alliance[17] = {
    Title = "17. The Spectral Chalice",
    Level = "55",
    Attain = "40",
    Aim = "The gems make no sound as they fall into depths of the chalice... ",
    Location = "Gloom'rel (Blackrock Depths; "..yellow.."[18]"..white..")",
    Note = red.."Only Miners with skill 230 or higher can get this quest to learn Smelt Dark Iron."..white.." Materials for the Chalice: 2 [Star Ruby], 20 [Gold Bar], 10 [Truesilver Bar]. Afterwards, if you have [Dark Iron Ore] you can take it to The Black Forge at "..yellow.."[22]"..white.." and Smelt it.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Alliance[18] = {
    Title = "18. Operation Help Jabbey",
    Level = "58",
    Attain = "50",
    Aim = "Venture into Blackrock Depths, and recover the 'Extremely Potent Snuff' from Darneg Darkbeard near the Domicile, for Jabbey at Steamwheedle Port in Tanaris.",
    Location = "Jabbey (Tanaris, Steamwheedle Port; "..yellow.."67,24"..white..")",
    Note = "Questline starts at Bixxle Screwfuse (Tel'Abim; "..yellow.."52,34"..white.."). Drop from Darneg Darkbeard. Rewards from Operation Final Repairs(Necks) quest and the final quest - The Dark Iron Desecrator(Gun).",
    Prequest = "Operation Screwfuse 1000 -> Operation FIX Screwfuse 1000",
    Folgequest = "Operation Help Jabbey 2 - > Operation Return to Screwfuse -> Operation Final Repairs - >Secrets of the Dark Iron Desecrator -> The Dark Iron Desecrator",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_AND..white.."3",
        {
            Name = "Bixxle's Necklace of Control",
            ID = "60996",
            Color = green,
            Description = AQITEM_NECK,
        },
        {
            Name = "Bixxle's Necklace of Mastery",
            ID = "60997",
            Color = green,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[19] = {
    Title = "19. The Dark Iron Desecrator",
    Level = "60",
    Attain = "55",
    Aim = "I need a Magma Condensor from within Blackrock Depths, you can find it near the Golem Laboratory"..yellow.."[25]"..white..".",
    Location = "Bixxle Screwfuse (Tel'Abim Island east from Tanaris)",
    Note = "This quest requires to collect 4 items.\n1) Magma Condensor (Blackrock Depths in Magma Condensor Crate) \n2) Intricate Arcanite Barrel (Blackrock Spire in Intricate Arcanite Barrels container)\n3) Molten Fragment (Molten Core from Molten Destroyer).\n4) Dark Iron Rifle (crafted by Engineers).\nTo finish the construction, I will also need Fiery Core(x3) found in Molten Core, and Enchanted Thorium Bars(x10).",
    Prequest = "Operation Help Jabbey -> Secrets of the Dark Iron Desecrator",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Dark Iron Desecrator",
            ID = "61068",
            Color = purple,
            Description = AQITEM_GUN,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[20] = {
    Title = "20. Senatorial Revenge",
    Level = "56",
    Attain = "45",
    Aim = "Slay 25 Shadowforge Senators deep within the Blackrock Depths for Orvak Sternrock at the Blackrock Pass in Burning Steppes.",
    Location = "Orvak Sternrock (after Redridge Mountains - Burning Steppes pass "..yellow.."76,68"..white..", west from alliance camp)",
    Note = "This questline starts at Radgan Deepblaze next to Orvak Sternrock with quest 'Gaining Orvak's Trust'",
    Prequest = "Gaining Orvak's Trust -> Hearing Orvak's Story -> The Sternrock Stash",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Badge of Shadowforge",
            ID = "60668",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[21] = {
    Title = "21. The Arcane Golem Core",
    Level = "55",
    Attain = "45",
    Aim = "Find, and collect an Arcane Golem Core from Golem Lord Argelmach"..yellow.."[14]"..white.."in Blackrock Depths and return to Radgan Deepblaze at Blackrock Pass in Burning Steppes.",
    Location = " Radgan Deepblaze (after Redridge Mountains - Burning Steppes pass "..yellow.."76,68"..white..", west from alliance camp)",
    Note = "This questline starts at Radgan Deepblaze next to Orvak Sternrock with quest 'Gaining Orvak's Trust'",
    Prequest = "Gaining Orvak's Trust -> Hearing Orvak's Story -> The Sternrock Stash -> Discovering Golem Secrets -> To Purchase Secret Information",
    Folgequest = "No",
    Rewards = {
        {
            Name = "Energized Golem Core",
            ID = "60672",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[22] = {
    Title = "22. To Build a Pounder",
    Level = "60",
    Attain = "30",
    Aim = "In addition to that, I also need a Perfect Golem Core for the Pounder. The Dark Iron golems in the Blackrock Depths make a good source. Golem Lord Argelmach "..yellow.."[14]"..white.." probably has one.",
    Location = "Oglethorpe Obnoticus <Master Gnome Engineer> (Stranglethorn Vale; Booty Bay "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Engineers only)"..white.."This quest requires to collect 3 items. \n1) Thorium Tuned Servo (Scarlet Monastery from Scarlet Myrmidon)\n2) Perfect Golem Core (Blackrock Depths from Golem Lord Argelmach)\n3) Adamantite Rod (Stratholme from Crimson Hammersmith)\n'Crowd Pummeler 9-60' in Gnomeregan drops 'Intact Pounder Mainframe' that starts the PreQuest 'A Pounding Brain'.",
    Prequest = "A Pounding Brain "..red.."(Engineers only)", --80398
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Reinforced Red Pounder",
            ID = "81253",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Green Pounder",
            ID = "81252",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Blue Pounder",
            ID = "81251",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Black Pounder",
            ID = "81250",
            Color = blue,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[5].Quests.Alliance[23] = {
    Title = "23. Winter Veil Brew",
    Level = "55",
    Attain = "45",
    Aim = "Recover the Winter Veil Keg in the caverns of Blackrock Depths for Bomarn Fireaxe at Winter Veil Vale",
    Location = "Bomarn Fireaxe at Winter Veil Vale",
    Note = red.."AVAILABLE ONLY while Winter Veil Holiday Event is active!"..white.."Those dastardly Dark Irons stole it, no doubt hidden away in their tavern "..yellow.."[15]"..white.." deep within the Blackrock Depths.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Horde[1] = kQuestInstanceData[5].Quests.Alliance[1]
kQuestInstanceData[5].Quests.Horde[2] = kQuestInstanceData[5].Quests.Alliance[2]
kQuestInstanceData[5].Quests.Horde[3] = kQuestInstanceData[5].Quests.Alliance[3]
kQuestInstanceData[5].Quests.Horde[4] = {
    Title = "4. Lost Thunderbrew Recipe",
    Level = "55",
    Attain = "50",
    Aim = "Bring the Lost Thunderbrew Recipe to Vivian Lagrave in Kargath.",
    Location = "Shadowmage Vivian Lagrave (Badlands - Kargath; "..yellow.."2,47"..white..")",
    Note = "You get the prequest from Apothecary Zinge in Undercity - The Apothecarium ("..yellow.."50,68"..white..").\nYou get the recipe from one of the guards who appear if you destroy the ale "..yellow.."[15]"..white..".",
    Prequest = "Vivian Lagrave",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1(x5)"..AQDiscription_AND..white.."2(x5)"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Superior Healing Potion",
            ID = "3928",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Greater Mana Potion",
            ID = "6149",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Swiftstrike Cudgel",
            ID = "11964",
            Color = green,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
        {
            Name = "Limb Cleaver",
            ID = "12000",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
    }
}
kQuestInstanceData[5].Quests.Horde[5] = {
    Title = "5. The Heart of the Mountain",
    Level = "55",
    Attain = "50",
    Aim = "Bring the Heart of the Mountain to Maxwort Uberglint in the Burning Steppes.",
    Location = "Maxwort Uberglint (Burning Steppes - Flame Crest; "..yellow.."65,23"..white..")",
    Note = "You find the Heart at "..yellow.."[8]"..white.." in a safe. You get the key for the safe from Warder Stillgiss. He appears after opening all small safes.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Horde[6] = {
    Title = "6. KILL ON SIGHT: Dark Iron Dwarves",
    Level = "52",
    Attain = "48",
    Aim = "Venture to Blackrock Depths and destroy the vile aggressors! Warlord Goretooth wants you to kill 15 Anvilrage Guardsmen, 10 Anvilrage Wardens and 5 Anvilrage Footmen. Return to him once your task is complete.",
    Location = "Sign Post (Badlands - Kargath; "..yellow.."3,47"..white..")",
    Note = "You find the dwarves in the first part of Blackrock Depths.\nYou find Warlord Goretooth in Kargath at the top of the tower (Badlands, "..yellow.."5,47"..white..").",
    Prequest = "No",
    Folgequest = "KILL ON SIGHT: High Ranking Dark Iron Officials",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Horde[7] = {
    Title = "7. KILL ON SIGHT: High Ranking Dark Iron Officials",
    Level = "54",
    Attain = "50",
    Aim = "Venture to Blackrock Depths and destroy the vile aggressors! Warlord Goretooth wants you to kill 10 Anvilrage Medics, 10 Anvilrage Soldiers and 10 Anvilrage Officers. Return to him once your task is complete.",
    Location = "Sign Post (Badlands - Kargath; "..yellow.."3,47"..white..")",
    Note = "You find the dwarves near Bael'Gar "..yellow.."[11]"..white..". You find Warlord Goretooth in Kargath at the top of the tower (Badlands, "..yellow.."5,47"..white..").\n The followup quest starts at Lexlort (Badlands - Kargath; "..yellow.."5,47"..white.."). You find Grark Lorkrub in the Burning Steppes ("..yellow.."38,35"..white.."). You have to reduce his life below 50% to bind him and start a Escort quest.",
    Prequest = "KILL ON SIGHT: Dark Iron Dwarves",
    Folgequest = "Grark Lorkrub -> Precarious Predicament (Escort quest)",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Horde[8] = {
    Title = "8. Operation: Death to Angerforge",
    Level = "58",
    Attain = "52",
    Aim = "Travel to Blackrock Depths and slay General Angerforge! Return to Warlord Goretooth when the task is complete.",
    Location = "Warlord Goretooth (Badlands - Kargath; "..yellow.."5,47"..white..")",
    Note = "You find General Angerforge at "..yellow.."[13]"..white..". He calls help below 30%!\nQuestline starts at Lexlort(Badlands - Kargath, on the tower) with quest 'Grark Lorkrub'.",
    Prequest = "Grark Lorkrub -> Precarious Predicament",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Conqueror's Medallion",
            ID = "12059",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[5].Quests.Horde[9] = {
    Title = "9. The Rise of the Machines",
    Level = "58",
    Attain = "52",
    Aim = "Find and slay Golem Lord Argelmach. Return his head to Lotwil. You will also need to collect 10 Intact Elemental Cores from the Ragereaver Golems and Warbringer Constructs protecting Argelmach. You know this because you are psychic.",
    Location = "Lotwil Veriatus (Badlands; "..yellow.."25,44"..white..")",
    Note = "You get the prequest from Hierophant Theodora Mulvadania (Badlands - Kargath; "..yellow.."3,47"..white..").\nYou find Argelmach at "..yellow.."[14]"..white..".",
    Prequest = "The Rise of the Machines",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Azure Moon Amice",
            ID = "12109",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Raincaster Drape",
            ID = "12110",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Basaltscale Armor",
            ID = "12108",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_MAIL,
        },
        {
            Name = "Lavaplate Gauntlets",
            ID = "12111",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[5].Quests.Horde[10] = {
    Title = "10. A Taste of Flame",
    Level = "58",
    Attain = "52",
    Aim = "Travel to Blackrock Depths and slay Bael'Gar. "..yellow.."[11]"..white.." Return the Encased Fiery Essence to Cyrus Therepentous.",
    Location = "Cyrus Therepentous (Burning Steppes; "..yellow.."94,31"..white..")",
    Note = "The questline starts at Kalaran Windblade (Searing Gorge; "..yellow.."39,38"..white..").\nBael'Gar is at "..yellow.."[11]"..white..".",
    Prequest = "The Flawless Flame -> A Taste of Flame",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Shaleskin Cape",
            ID = "12066",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Wyrmhide Spaulders",
            ID = "12082",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_LEATHER,
        },
        {
            Name = "Valconian Sash",
            ID = "12083",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[5].Quests.Horde[11] = {
    Title = "11. Disharmony of Fire",
    Level = "56",
    Attain = "48",
    Aim = "Enter Blackrock Depths and track down Lord Incendius. Slay him and return any source of information you may find to Thunderheart.",
    Location = "Thunderheart (Badlands - Kargath; "..yellow.."3,48"..white..")",
    Note = "You get the prequest from Thunderheart, too.\nYou find Lord Incendius at "..yellow.."[10]"..white..".",
    Prequest = "Disharmony of Flame",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Sunborne Cape",
            ID = "12113",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Nightfall Gloves",
            ID = "12114",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_LEATHER,
        },
        {
            Name = "Crypt Demon Bracers",
            ID = "12112",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
        {
            Name = "Stalwart Clutch",
            ID = "12115",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[5].Quests.Horde[12] = {
    Title = "12. The Last Element",
    Level = "54",
    Attain = "48",
    Aim = "Travel to Blackrock Depths and recover 10 Essence of the Elements. Your first inclination is to search the golems and golem makers. You remember Vivian Lagrave also muttering something about elementals.",
    Location = "Shadowmage Vivian Lagrave (Badlands - Kargath; "..yellow.."2,47"..white..")",
    Note = "You get the prequest from Thunderheart (Badlands - Kargath; "..yellow.."3,48"..white..").\n Every elemental can drop the Essence",
    Prequest = "Disharmony of Flame",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Lagrave's Seal",
            ID = "12038",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[5].Quests.Horde[13] = {
    Title = "13. Commander Gor'shak",
    Level = "52",
    Attain = "48",
    Aim = "Find Commander Gor'shak in Blackrock Depths.\nYou recall that the crudely drawn picture of the orc included bars drawn over the portrait. Perhaps you should search for a prison of some sort.",
    Location = "Galamav the Marksman (Badlands - Kargath; "..yellow.."5,47"..white..")",
    Note = "You get the prequest from Thunderheart (Badlands - Kargath; "..yellow.."3,48"..white..").\nYou find Commander Gor'shak at "..yellow.."[3]"..white..". The key to open the prison drops from High Interrogator Gerstahn "..yellow.."[5]"..white..". If you talk to him and start the next Quest enemys appears.",
    Prequest = "Disharmony of Flame",
    Folgequest = "What Is Going On?",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[5].Quests.Horde[14] = {
    Title = "14. The Royal Rescue",
    Level = "59",
    Attain = "48",
    Aim = "Slay Emperor Dagran Thaurissan and free Princess Moira Bronzebeard from his evil spell.",
    Location = "Thrall (Orgrimmar; "..yellow.."31,37"..white..")",
    Note = "After talking a with Kharan Mighthammer and Thrall you get this quest.\nYou find Emperor Dagran Thaurissan at "..yellow.."[21]"..white..". The Princess heals Dagran but you must not kill her to complete the quest! Try to interrupt her healing spells. (Rewards are for The Princess Saved?)",
    Prequest = "Commander Gor'shak -> What Is Going On? (x2) -> The Eastern Kingdom",
    Folgequest = "The Princess Saved?",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Thrall's Resolve",
            ID = "12544",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Eye of Orgrimmar",
            ID = "12545",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[5].Quests.Horde[15] = kQuestInstanceData[5].Quests.Alliance[15]
kQuestInstanceData[5].Quests.Horde[16] = kQuestInstanceData[5].Quests.Alliance[16]
kQuestInstanceData[5].Quests.Horde[17] = kQuestInstanceData[5].Quests.Alliance[17]
kQuestInstanceData[5].Quests.Horde[18] = kQuestInstanceData[5].Quests.Alliance[18]
kQuestInstanceData[5].Quests.Horde[19] = kQuestInstanceData[5].Quests.Alliance[19]
kQuestInstanceData[5].Quests.Horde[20] = kQuestInstanceData[5].Quests.Alliance[20]
kQuestInstanceData[5].Quests.Horde[21] = kQuestInstanceData[5].Quests.Alliance[21]
kQuestInstanceData[5].Quests.Horde[22] = kQuestInstanceData[5].Quests.Alliance[22]
kQuestInstanceData[5].Quests.Horde[23] = kQuestInstanceData[5].Quests.Alliance[23]

--------------- INST6 - Blackwing Lair ---------------
kQuestInstanceData[6] = {
    Story = {
	    ["Page1"] = "Blackwing Lair can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.",
	    ["Page2"] = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths, which serve as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain.",
	    ["Page3"] = "Nefarian has vowed to crush Ragnaros. To this end, he has recently begun efforts to bolster his forces, much as his father Deathwing had attempted to do in ages past. However, where Deathwing failed, it now seems the scheming Nefarian may be succeeding. Nefarian's mad bid for dominance has even attracted the ire of the Red Dragon Flight, which has always been the Black Flight's greatest foe. Though Nefarian's intentions are known, the methods he is using to achieve them remain a mystery. It is believed, however that Nefarian has been experimenting with the blood of all of the various Dragon Flights to produce unstoppable warriors.\n \nNefarian's sanctum, Blackwing Lair, can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.";
        ["MaxPages"] = "3",
	},
    Caption = {
        "Blackwing Lair",
        "Blackwing Lair (Story Part 1)",
        "Blackwing Lair (Story Part 2)",
    },
    QAA = "6 Quests",
    QAH = "6 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[6].Quests.Alliance[1] = {
    Title = "1. Nefarius's Corruption",
    Level = "60",
    Attain = "60",
    Aim = "Slay Nefarian and recover the Red Scepter Shard. Return the Red Scepter Shard to Anachronos at the Caverns of Time in Tanaris. You have 5 hours to complete this task.",
    Location = "Vaelastrasz the Corrupt (Blackwing Lair; "..yellow.."[2]"..white..")",
    Note = "Only one person can loot the Shard. Anachronos (Tanaris - Caverns of Time; "..yellow.."65,49"..white..")",
    Prequest = "The Charge of the Dragonflights",
    Folgequest = "The Might of Kalimdor (Must complete green & blue quest chains as well)",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Onyx Embedded Leggings",
            ID = "21530",
            Color = purple,
            Description = AQITEM_LEGS,
        },
        {
            Name = "Amulet of Shadow Shielding",
            ID = "21529",
            Color = purple,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[6].Quests.Alliance[2] = {
    Title = "2. The Lord of Blackrock",
    Level = "60",
    Attain = "60",
    Aim = "Return the Head of Nefarian to Highlord Bolvar Fordragon in Stormwind.",
    Location = "Head of Nefarian (drops from Nefarian; "..yellow.."[9]"..white..")",
    Note = "Highlord Bolvar Fordragon is at (Stormwind City - Stormwind Keep; "..yellow.."78,20"..white.."). The follow up sends you to Field Marshal Afrasiabi (Stormwind - Valley of Heroes; "..yellow.."67,72"..white..") for the reward.",
    Prequest = "No",
    Folgequest = "The Lord of Blackrock",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Master Dragonslayer's Medallion",
            ID = "19383",
            Color = purple,
            Description = AQITEM_NECK,
        },
        {
            Name = "Master Dragonslayer's Orb",
            ID = "19366",
            Color = purple,
            Description = AQITEM_OFFHAND,
        },
        {
            Name = "Master Dragonslayer's Ring",
            ID = "19384",
            Color = purple,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[6].Quests.Alliance[3] = {
    Title = "3. Only One May Rise",
    Level = "60",
    Attain = "60",
    Aim = "Return the Head of the Broodlord Lashlayer to Baristolth of the Shifting Sands at Cenarion Hold in Silithus.",
    Location = "Head of the Broodlord Lashlayer (drops from Broodlord Lashlayer; "..yellow.."[3]"..white..")",
    Note = "Only one person can pick up the head.",
    Prequest = "What Tomorrow Brings",
    Folgequest = "The Path of the Righteous",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[6].Quests.Alliance[4] = {
    Title = "4. The Only Prescription",
    Level = "60",
    Attain = "60",
    Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. ",
    Location = "Narain Soothfancy (Tanaris; "..yellow.."65,18"..white..")",
    Note = "Chapter can be looted by multiple people. Draconic for Dummies (looted from a table; "..green.."[2']"..white..")",
    Prequest = "Decoy!",
    Folgequest = "The Good News and The Bad News (Must complete Stewvul, Ex-B.F.F. and Never Ask Me About My Business quest chains)",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Gnomish Turban of Psychic Might",
            ID = "21517",
            Color = purple,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[6].Quests.Alliance[5] = {
    Title = "5. The Key to Karazhan IX",
    Level = "60",
    Attain = "58",
    Aim = "Find 'Treatise on Magical Locks and Keys' and bring it back to Vandol. It is rumored to be kept in Blackwing Lair.",
    Location = "Dolvan Bracewind (Dustwallow Marsh - Westhaven Hollow  "..yellow.."71,73"..white..")",
    Note = "Prequest - Lord Ebonlocke (Lower Karazhan Halls). Book 'Treatise on Magical Locks and Keys' is in the last boss room "..yellow.."[9]"..white..", next to the throne. Reward from the next quest.",
    Prequest = "The Key to Karazhan VIII (DMW)",
    Folgequest = "The Key to Karazhan X",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Upper Karazhan Tower Key",
            ID = "61234",
            Color = blue,
            Description = AQITEM_KEY,
        },
    }
}
kQuestInstanceData[6].Quests.Alliance[6] = {
    Title = "6. Scythe of the Goddess",
    Level = "60",
    Attain = "58",
    Aim = "Retrieve a copy of 'Vorgendor: Myths from the Blood Dimension' from Lord Victor Nefarius.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; "..yellow.."84.8,29.3"..white.." top floor of the big tree)",
    Note = "Nefarian "..yellow.."[9]"..white.." drops 'Burnt Copy of Vorgendor'.\nQuestline starts with rare drop legendary item 'The Scythe of Elune' from boss Lord Blackwald II in "..yellow.."[Karazhan]"..white..".",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Scythe of the Goddess "..yellow.."[Upper Karazhan]"..white.." ", -- 41087
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[6].Quests.Horde[1] = kQuestInstanceData[6].Quests.Alliance[1]
kQuestInstanceData[6].Quests.Horde[2] = {
    Title = "2. The Lord of Blackrock",
    Level = "60",
    Attain = "60",
    Aim = "Return the Head of Nefarian to Thrall in Orgrimmar.",
    Location = "Head of Nefarian (drops from Nefarian; "..yellow.."[9]"..white..")",
    Note = "The follow up sends you to High Overlord Saurfang (Orgrimmar - Valley of Strength; "..yellow.."51,76"..white..") for the reward.",
    Prequest = "No",
    Folgequest = "The Lord of Blackrock",
    Rewards = kQuestInstanceData[6].Quests.Alliance[2].Rewards
}
kQuestInstanceData[6].Quests.Horde[3] = kQuestInstanceData[6].Quests.Alliance[3]
kQuestInstanceData[6].Quests.Horde[4] = kQuestInstanceData[6].Quests.Alliance[4]
kQuestInstanceData[6].Quests.Horde[5] = kQuestInstanceData[6].Quests.Alliance[5]
kQuestInstanceData[6].Quests.Horde[6] = kQuestInstanceData[6].Quests.Alliance[6]

--------------- INST7 - Blackfathom Deeps ---------------
kQuestInstanceData[7] = {
    Story = "Situated along the Zoram Strand of Ashenvale, Blackfathom Deeps was once a glorious temple dedicated to the night elves' moon-goddess, Elune. However, the great Sundering shattered the temple - sinking it beneath the waves of the Veiled Sea. There it remained untouched - until, drawn by its ancient power - the naga and satyr emerged to plumb its secrets. Legends hold that the ancient beast, Aku'mai, has taken up residence within the temple's ruins. Aku'mai, a favored pet of the primordial Old Gods, has preyed upon the area ever since. Drawn to Aku'mai's presence, the cult known as the Twilight's Hammer has also come to bask in the Old Gods' evil presence.",
    Caption = "Blackfathom Deeps",
    QAA = "6 Quests",
    QAH = "6 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[7].Quests.Alliance[1] = {
    Title = "1. Knowledge in the Deeps",
    Level = "23",
    Attain = "10",
    Aim = "Bring the Lorgalis Manuscript to Gerrig Bonegrip in the Forlorn Cavern in Ironforge.",
    Location = "Gerrig Bonegrip (Ironforge - The Forlorn Cavern; "..yellow.."50,5"..white..")",
    Note = "You find the Manuscript at "..yellow.."[2]"..white.." in the water.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Sustaining Ring",
            ID = "6743",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[7].Quests.Alliance[2] = {
    Title = "2. Researching the Corruption",
    Level = "24",
    Attain = "18",
    Aim = "Gershala Nightwhisper in Auberdine wants 8 Corrupt Brain stems.",
    Location = "Gershala Nightwhisper (Darkshore - Auberdine; "..yellow.."38,43"..white..")",
    Note = "The prequest is optional. You get it from Argos Nightwhisper at (Stormwind - The Park; "..yellow.."21,55"..white.."). \n\nAll the Nagas before and in Blackfathom Deeps drop the brains.",
    Prequest = "The Corruption Abroad",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Beetle Clasps",
            ID = "7003",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
        {
            Name = "Prelacy Cape",
            ID = "7004",
            Color = green,
            Description = AQITEM_BACK,
        },
    }
}
kQuestInstanceData[7].Quests.Alliance[3] = {
    Title = "3. In Search of Thaelrid",
    Level = "24",
    Attain = "18",
    Aim = "Seek out Argent Guard Thaelrid in Blackfathom Deeps.",
    Location = "Dawnwatcher Shaedlass (Darnassus - Craftsmen's Terrace; "..yellow.."55,24"..white..")",
    Note = "You find Argent Guard Thaelrid at "..yellow.."[4]"..white..".",
    Prequest = "No",
    Folgequest = "Blackfathom Villainy",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[7].Quests.Alliance[4] = {
    Title = "4. Blackfathom Villainy",
    Level = "27",
    Attain = "18",
    Aim = "Bring the head of Twilight Lord Kelris to Dawnwatcher Selgorm in Darnassus.",
    Location = "Argent Guard Thaelrid (Blackfathom Deeps; "..yellow.."[4]"..white..")",
    Note = "Twilight Lord Kelris is at "..yellow.."[8]"..white..". You find Dawnwatcher Selgorm in Darnassus - Craftsmen's Terrace ("..yellow.."55,24"..white.."). \n\nATTENTION! If you turn on the flames beside Lord Kelris, enemies appear and attack you.",
    Prequest = "In Search of Thaelrid",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Gravestone Scepter",
            ID = "7001",
            Color = blue,
            Description = AQITEM_WAND,
        },
        {
            Name = "Arctic Buckler",
            ID = "7002",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
    }
}
kQuestInstanceData[7].Quests.Alliance[5] = {
    Title = "5. Twilight Falls",
    Level = "25",
    Attain = "20",
    Aim = "Bring 10 Twilight Pendants to Argent Guard Manados in Darnassus.",
    Location = "Argent Guard Manados (Darnassus - Craftsmen's Terrace; "..yellow.."55,23"..white..")",
    Note = "Every Twilight mob can drop the pendants.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Nimbus Boots",
            ID = "6998",
            Color = green,
            Description = AQITEM_FEET..AQITEM_CLOTH,
        },
        {
            Name = "Heartwood Girdle",
            ID = "7000",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[7].Quests.Alliance[6] = {
    Title = "6. The Orb of Soran'ruk",
    Level = "25",
    Attain = "20",
    Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens.",
    Location = "Doan Karhan (Barrens; "..yellow.."49,57"..white..")",
    Note = red.."Warlock only"..white..": You get the 3 Soran'ruk Fragments from Twilight Accolytes in "..yellow.."[Blackfathom Deeps]"..white..". You get the Large Soran'ruk Fragment in "..yellow.."[Shadowfang Keep]"..white.." from Shadowfang Darksouls.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Orb of Soran'ruk",
            ID = "6898",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
        {
            Name = "Staff of Soran'ruk",
            ID = "15109",
            Color = green,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[7].Quests.Horde[1] = {
    Title = "1. The Essence of Aku'Mai",
    Level = "22",
    Attain = "17",
    Aim = "Bring 20 Sapphires of Aku'Mai to Je'neu Sancrea in Ashenvale.",
    Location = "Je'neu Sancrea (Ashenvale - Zoram'gar Outpost; "..yellow.."11,33"..white..")",
    Note = "You get the prequest Trouble in the Deeps from Tsunaman (Stonetalon Mountains - Sun Rock Retreat; "..yellow.."47,64"..white.."). The crystals can be found in the tunnels before the instance.",
    Prequest = "Trouble in the Deeps",
    Folgequest = "Amongst the Ruins",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[7].Quests.Horde[2] = {
    Title = "2. Allegiance to the Old Gods",
    Level = "26",
    Attain = "17",
    Aim = "Bring the Damp Note to Je'neu Sancrea in Ashenvale -> Kill Lorgus Jett in Blackfathom Deeps and then return to Je'neu Sancrea in Ashenvale.",
    Location = "Damp Note (drop - see note)",
    Note = "You get the Damp Note from Blackfathom Tide Priestess (5% drop rate). Then take it to Je'neu Sancrea (Ashenvale - Zoram'gar Outpost; "..yellow.."11,33"..white.."). Lorgus Jett is at "..yellow.."[6]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Band of the Fist",
            ID = "17694",
            Color = green,
            Description = AQITEM_RING,
        },
        {
            Name = "Chestnut Mantle",
            ID = "17695",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[7].Quests.Horde[3] = {
    Title = "3. Amongst the Ruins",
    Level = "27",
    Attain = "21",
    Aim = "Bring the Fathom Core to Je'neu Sancrea at Zoram'gar Outpost, Ashenvale.",
    Location = "Je'neu Sancrea (Ashenvale - Zoram'gar Outpost; "..yellow.."11,33"..white..")",
    Note = "You find the Fathom Core at "..yellow.."[7]"..white.." in the water. When you get the core Baron Aquanis appears and attacks you. He drops a quest item which you have to take back to Je'neu Sancrea.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[7].Quests.Horde[4] = {
    Title = "4. Blackfathom Villainy",
    Level = "27",
    Attain = "18",
    Aim = "Bring the head of Twilight Lord Kelris to Bashana Runetotem in Thunder Bluff.",
    Location = "Argent guard Thaelrid (Blackfathom Deeps; "..yellow.."[4]"..white..")",
    Note = "Twilight Lord Kelris is at "..yellow.."[8]"..white..". You find Bashana Runetotem in Thunderbluff - The Elder Rise ("..yellow.."70,33"..white.."). \n\nATTENTION! If you turn on the flames beside Lord Kelris, enemies appear and attack you.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = kQuestInstanceData[7].Quests.Alliance[4].Rewards
}
kQuestInstanceData[7].Quests.Horde[5] = {
    Title = "5. The Orb of Soran'ruk",
    Level = "25",
    Attain = "20",
    Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens.",
    Location = "Doan Karhan (Barrens; "..yellow.."49,57"..white..")",
    Note = red.."Warlock only"..white..": You get the 3 Soran'ruk Fragments from Twilight Accolytes in "..yellow.."[Blackfathom Deeps]"..white..". You get the Large Soran'ruk Fragment in "..yellow.."[Shadowfang Keep]"..white.." from Shadowfang Darksouls.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Orb of Soran'ruk",
            ID = "6898",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
        {
            Name = "Staff of Soran'ruk",
            ID = "15109",
            Color = green,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[7].Quests.Horde[6] = {
    Title = "6. Baron Aquanis",
    Level = "30",
    Attain = "21",
    Aim = "Bring the Strange Water Globe to Je'neu Sancrea at Zoram'gar Outpost, Ashenvale.",
    Location = "Strange Water Globe (Blackfathom Deeps; "..yellow.."[7]"..white..")",
    Note = "Using Fathom Stone "..yellow.."[7]"..white.." for the quest #3 summons Baron Aquanis. He drops Strange Water Globe that starts the quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Outlaw Sabre",
            ID = "16886",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Witch's Finger",
            ID = "16887",
            Color = blue,
            Description = AQITEM_OFFHAND,
        },
    }
}

--------------- INST8 - Lower Blackrock Spire ---------------
kQuestInstanceData[8] = {
    Story = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself.",
    Caption = "Lower Blackrock Spire",
    QAA = "15 Quests",
    QAH = "18 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[8].Quests.Alliance[1] = {
    Title = "1. The Final Tablets",
    Level = "58",
    Attain = "40",
    Aim = "Bring the Fifth and Sixth Mosh'aru Tablets to Prospector Ironboot in Tanaris.",
    Location = "Prospector Ironboot (Tanaris - Steamwheedle Port; "..yellow.."66,23"..white..")",
    Note = "You find the tablets near "..yellow.."[7]"..white.." and "..yellow.."[9]"..white..".\nThe Rewards belong to 'Confront Yeh'kinya'. You find Yeh'kinya near Prospector Ironboot.",
    Prequest = "The Lost Tablets of Mosh'aru",
    Folgequest = "Confront Yeh'kinya",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Faded Hakkari Cloak",
            ID = "20218",
            Color = blue,
            Description = AQITEM_BACK,
        },
        {
            Name = "Tattered Hakkari Cape",
            ID = "20219",
            Color = blue,
            Description = AQITEM_BACK,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[2] = {
    Title = "2. Kibler's Exotic Pets",
    Level = "59",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and find Bloodaxe Worg Pups. Use the cage to carry the ferocious little beasts. Bring back a Caged Worg Pup to Kibler.",
    Location = "Kibler (Burning Steppes - Flame Crest; "..yellow.."65,22"..white..")",
    Note = "You find the Worg Cup at "..yellow.."[17]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Worg Carrier",
            ID = "12264",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[3] = {
    Title = "3. En-Ay-Es-Tee-Why",
    Level = "59",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and collect 15 Spire Spider Eggs for Kibler.",
    Location = "Kibler (Burning Steppes - Flame Crest; "..yellow.."65,22"..white..")",
    Note = "You find the spider eggs near "..yellow.."[13]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Smolderweb Carrier",
            ID = "12529",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[4] = {
    Title = "4. Mother's Milk",
    Level = "60",
    Attain = "55",
    Aim = "In the heart of Blackrock Spire you will find Mother Smolderweb. Engage her and get her to poison you. Chances are good that you will have to kill her as well. Return to Ragged John when you are poisoned so that he can 'milk' you.",
    Location = "Ragged John (Burning Steppes - Flame Crest; "..yellow.."65,23"..white..")",
    Note = "Mother Smolderweb is at "..yellow.."[13]"..white..". The poison effect snares nearby players as well. If it is removed or dispelled, you fail the quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Ragged John's Neverending Cup",
            ID = "15873",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[5] = {
    Title = "5. Put Her Down",
    Level = "59",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and destroy the source of the worg menace. As you left Helendis, he shouted a name: Halycon. It is what the orcs refer to in regards to the worg.",
    Location = "Helendis Riverhorn (Burning Steppes - Morgan's Vigil; "..yellow.."5,47"..white..")",
    Note = "You find Halycon at "..yellow.."[17]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Astoria Robes",
            ID = "15824",
            Color = green,
            Description = AQITEM_CHEST .. AQITEM_CLOTH,
        },
        {
            Name = "Traphook Jerkin",
            ID = "15825",
            Color = green,
            Description = AQITEM_CHEST .. AQITEM_LEATHER,
        },
        {
            Name = "Jadescale Breastplate",
            ID = "15827",
            Color = green,
            Description = AQITEM_CHEST .. AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[6] = {
    Title = "6. Urok Doomhowl",
    Level = "60",
    Attain = "55",
    Aim = "Read Warosh's Scroll. Bring Warosh's Mojo to Warosh.",
    Location = "Warosh (Blackrock Spire; "..yellow.."[2]"..white..")",
    Note = "To get Warosh's Mojo you have to evoke and kill Urok Doomhowl "..yellow.."[15]"..white..". For his Evocation you need a Spear and Highlord Omokk's Head "..yellow.."[5]"..white..". The Spear is at "..yellow.."[3]"..white..". During the Evocation a few waves of ogres appear before Urok Doomhowl attacks you. You can use the Spear during the fight to damage the ogres.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Prismcharm",
            ID = "15867",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[7] = {
    Title = "7. Bijou's Belongings",
    Level = "59",
    Attain = "55",
    Aim = "Find Bijou's Belongings and return them to her. Good luck!",
    Location = "Bijou (Blackrock Spire; "..yellow.."[3]"..white..")",
    Note = "You find Bijou's Belongings on the way to Mother Smolderweb at "..yellow.."[13]"..white..".\nMaxwell is at (Burning Steppes - Morgan's Vigil; "..yellow.."84,58"..white..").",
    Prequest = "No",
    Folgequest = "Message to Maxwell",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[8].Quests.Alliance[8] = {
    Title = "8. Maxwell's Mission",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and destroy War Master Voone, Highlord Omokk, and Overlord Wyrmthalak. Return to Marshal Maxwell when the job is done.",
    Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; "..yellow.."84,58"..white..")",
    Note = "You find War Master Voone at "..yellow.."[9]"..white..", Highlord Omokk at "..yellow.."[5]"..white.." and Overlord Wyrmthalak at "..yellow.."[19]"..white..".",
    Prequest = "Message to Maxwell",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4"..AQDiscription_OR..white.."5",
        {
            Name = "Wyrmthalak's Shackles",
            ID = "13958",
            Color = blue,
            Description = AQITEM_WRIST .. AQITEM_CLOTH,
        },
        {
            Name = "Omokk's Girth Restrainer",
            ID = "13959",
            Color = blue,
            Description = AQITEM_WAIST .. AQITEM_PLATE,
        },
        {
            Name = "Halycon's Muzzle",
            ID = "13961",
            Color = blue,
            Description = AQITEM_SHOULDER .. AQITEM_LEATHER,
        },
        {
            Name = "Vosh'gajin's Strand",
            ID = "13962",
            Color = blue,
            Description = AQITEM_WAIST .. AQITEM_LEATHER,
        },
        {
            Name = "Voone's Vice Grips",
            ID = "13963",
            Color = blue,
            Description = AQITEM_HANDS .. AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[9] = {
    Title = "9. Seal of Ascension",
    Level = "60",
    Attain = "57",
    Aim = "Find the three gemstones of command: The Gemstone of Smolderthorn, Gemstone of Spirestone, and Gemstone of Bloodaxe. Return them, along with the Unadorned Seal of Ascension, to Vaelan.",
    Location = "Vaelan (Blackrock Spire; "..yellow.."[1]"..white..")",
    Note = "You get the Gemstone of Spirestone from Highlord Omokk at "..yellow.."[5]"..white..", the Gemstone of Smolderthorn from War Master Voone at "..yellow.."[9]"..white.." and the Gemstone of Bloodaxe from Overlord Wyrmthalak at "..yellow.."[19]"..white..". The Unadorned Seal of Ascension can drop from near all enemys in Lower Blackrock Spire. You get the Key for Upper Blackrock Spire if you complete this questline.",
    Prequest = "No",
    Folgequest = "Seal of Ascension",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[8].Quests.Alliance[10] = {
    Title = "10. General Drakkisath's Command",
    Level = "60",
    Attain = "55",
    Aim = "Take General Drakkisath's Command to Marshal Maxwell in Burning Steppes.",
    Location = "General Drakkisath's Command (drops from Overlord Wyrmthalak; "..yellow.."[19]"..white..")",
    Note = "Marshal Maxwell is in the Burning Steppes - Morgan's Vigil; ("..yellow.."84,58"..white..").",
    Prequest = "No",
    Folgequest = "General Drakkisath's Demise ("..yellow.."Upper Blackrock Spire"..white..")", -- 5102
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[8].Quests.Alliance[11] = {
    Title = "11. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Mor Grayhoof and slay him. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nMor Grayhoof is summoned at "..yellow.."[9]"..white..".",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[8].Quests.Alliance[12] = {
    Title = "12. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Mor Grayhoof and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nMor Grayhoof is summoned at "..yellow.."[9]"..white..".",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[8].Quests.Alliance[13] = {
    Title = "13. Snakestone of the Shadow Huntress",
    Level = "60",
    Attain = "50",
    Aim = "Travel to Blackrock Spire and slay Shadow Hunter Vosh'gajin. Recover Vosh'gajin's Snakestone and return to Kilram.",
    Location = "Kilram (Winterspring - Everlook; "..yellow.."61,37"..white..")",
    Note = "Blacksmith quest. Shadow Hunter Vosh'gajin is at "..yellow.."[7]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Plans: Dawn's Edge",
            ID = "12821",
            Color = blue,
            Description = AQITEM_PATTERN,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[14] = {
    Title = "14. Hot Fiery Death",
    Level = "60",
    Attain = "60",
    Aim = "Someone in this world must know what to do with these gauntlets. Good luck!",
    Location = "Human Remains (Lower Blackrock Spire; "..yellow.."[9]"..white..")",
    Note = "Blacksmith quest. Be sure to pick up the Unfired Plate Gauntlets near the Human Remains at "..yellow.."[11]"..white..". Turns in to Malyfous Darkhammer (Winterspring - Everlook; "..yellow.."61,39"..white.."). Rewards listed are for the followup.",
    Prequest = "No",
    Folgequest = "Fiery Plate Gauntlets",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Plans: Fiery Plate Gauntlets",
            ID = "12699",
            Color = blue,
            Description = AQITEM_PATTERN,
        },
        {
            Name = "Fiery Plate Gauntlets",
            ID = "12631",
            Color = blue,
            Description = AQITEM_HANDS..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[8].Quests.Alliance[15] = {
    Title = "15. The Dark Iron Desecrator",
    Level = "60",
    Attain = "55",
    Aim = "I require a Intricate Arcanite Barrel which can handle extreme heat. This can be found deep within Lower Blackrock Spire, near the Quartermaster "..yellow.."[16]"..white.." there.",
    Location = "Bixxle Screwfuse (Tel'Abim; "..yellow.."52,34"..white..")",
    Note = "This quest requires to collect 4 items.\n1) Magma Condensor (Blackrock Depths in Magma Condensor Crate) \n2) Intricate Arcanite Barrel (Blackrock Spire in Intricate Arcanite Barrels container)\n3) Molten Fragment (Molten Core from Molten Destroyer).\n4) Dark Iron Rifle (crafted by Engineers).\nFiery Core(x3) found in Molten Core, and Enchanted Thorium Bars(x10).",
    Prequest = "Secrets of the Dark Iron Desecrator",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Dark Iron Desecrator",
            ID = "61068",
            Color = purple,
            Description = AQITEM_GUN,
        },
    }
}
kQuestInstanceData[8].Quests.Horde[1] = kQuestInstanceData[8].Quests.Alliance[1]
kQuestInstanceData[8].Quests.Horde[2] = kQuestInstanceData[8].Quests.Alliance[2]
kQuestInstanceData[8].Quests.Horde[3] = kQuestInstanceData[8].Quests.Alliance[3]
kQuestInstanceData[8].Quests.Horde[4] = kQuestInstanceData[8].Quests.Alliance[4]
kQuestInstanceData[8].Quests.Horde[5] = {
    Title = "5. The Pack Mistress",
    Level = "59",
    Attain = "55",
    Aim = "Slay Halycon, pack mistress of the Bloodaxe worg.",
    Location = "Galamav the Marksman (Badlands - Kargath; "..yellow.."5,47"..white..")",
    Note = "You find Halycon at "..yellow.."[17]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = kQuestInstanceData[8].Quests.Alliance[5].Rewards
}
kQuestInstanceData[8].Quests.Horde[6] = kQuestInstanceData[8].Quests.Alliance[6]
kQuestInstanceData[8].Quests.Horde[7] = {
    Title = "7. Operative Bijou",
    Level = "59",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and find out what happened to Bijou.",
    Location = "Lexlort (Badlands - Kargath; "..yellow.."5,47"..white..")",
    Note = "You find Bijou at "..yellow.."[8]"..white..".",
    Prequest = "No",
    Folgequest = "Bijou's Belongings",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[8].Quests.Horde[8] = {
    Title = "8. Bijou's Belongings",
    Level = "59",
    Attain = "55",
    Aim = "Find Bijou's Belongings and return them to her. You recall her mentioning that she stashed them on the bottom floor of the city.",
    Location = "Bijou (Blackrock Spire; "..yellow.."[3]"..white..")",
    Note = "You find Bijou's Belongings on the way to Mother Smolderweb at "..yellow.."[13]"..white..".\nThe Rewards belong to 'Bijou's Reconnaissance Report'.",
    Prequest = "Operative Bijou",
    Folgequest = "Bijou's Reconnaissance Report",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Freewind Gloves",
            ID = "15858",
            Color = green,
            Description = AQITEM_HANDS .. AQITEM_CLOTH,
        },
        {
            Name = "Seapost Girdle",
            ID = "15859",
            Color = green,
            Description = AQITEM_WAIST .. AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[8].Quests.Horde[9] = kQuestInstanceData[8].Quests.Alliance[9]
kQuestInstanceData[8].Quests.Horde[10] = {
    Title = "10. Warlord's Command",
    Level = "60",
    Attain = "55",
    Aim = "Slay Highlord Omokk, War Master Voone, and Overlord Wyrmthalak. Recover Important Blackrock Documents. Return to Warlord Goretooth in Kargath when the mission has been accomplished.",
    Location = "Warlord Goretooth (Badlands - Kargath; "..yellow.."65,22"..white..")",
    Note = "Onyxia Prequest.\nYou find Highlord Omokk at "..yellow.."[5]"..white..", War Master Voone at "..yellow.."[9]"..white.." and Overlord Wyrmthalak at "..yellow.."[19]"..white..". The Blackrock Documents could appear next to one of these 3 bosses.",
    Prequest = "No",
    Folgequest = "Eitrigg's Wisdom -> For the Horde! ("..yellow.."Upper Blackrock Spire"..white..")",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4"..AQDiscription_OR..white.."5",
        {
            Name = "Wyrmthalak's Shackles",
            ID = "13958",
            Color = blue,
            Description = AQITEM_WRIST .. AQITEM_CLOTH,
        },
        {
            Name = "Omokk's Girth Restrainer",
            ID = "13959",
            Color = blue,
            Description = AQITEM_WAIST .. AQITEM_PLATE,
        },
        {
            Name = "Halycon's Muzzle",
            ID = "13961",
            Color = blue,
            Description = AQITEM_SHOULDER .. AQITEM_LEATHER,
        },
        {
            Name = "Vosh'gajin's Strand",
            ID = "13962",
            Color = blue,
            Description = AQITEM_WAIST .. AQITEM_LEATHER,
        },
        {
            Name = "Voone's Vice Grips",
            ID = "13963",
            Color = blue,
            Description = AQITEM_HANDS .. AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[8].Quests.Horde[11] = kQuestInstanceData[8].Quests.Alliance[11]
kQuestInstanceData[8].Quests.Horde[12] = kQuestInstanceData[8].Quests.Alliance[12]
kQuestInstanceData[8].Quests.Horde[13] = kQuestInstanceData[8].Quests.Alliance[13]
kQuestInstanceData[8].Quests.Horde[14] = kQuestInstanceData[8].Quests.Alliance[14]
kQuestInstanceData[8].Quests.Horde[15] = kQuestInstanceData[8].Quests.Alliance[15]
kQuestInstanceData[8].Quests.Horde[16] = {
    Title = "16. Forest Troll Scum",
    Level = "60",
    Attain = "48",
    Aim = "Kill War Master Voone "..yellow.."[9]"..white.." in Lower Blackrock Spire and bring his tusks back to Taskmaster Ok'gog at Karfang Hold in Burning Steppes.",
    Location = "Taskmaster Ok'gog (Burning Steppes - Karfang Hold; "..yellow.."95.1,22.8"..white..")",
    Note = "",
    Prequest = "The Firegut Task",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Taskmaster Whip",
            ID = "60715",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[8].Quests.Horde[17] = {
    Title = "17. Raider's Raid",
    Level = "58",
    Attain = "50",
    Aim = "Slay Gizrul the Slavener "..yellow.."[17]"..white.." in Blackrock Spire, then report to Raider Fargosh in Karfang Hold.",
    Location = "Raider Fargosh (Burning Steppes - Karfang Hold; "..yellow.."93.6,23.2"..white..")",
    Note = "Gizrul the Slavener appears after you kill boss Halycon "..yellow.."[17]"..white..".",
    Prequest = "Raider's Revenge -> Raider's New Mount",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Worg Rider Sash",
            ID = "60717",
            Color = green,
            Description = AQITEM_WAIST .. AQITEM_LEATHER,
        },
        {
            Name = "Sootwalker Sandals",
            ID = "60718",
            Color = green,
            Description = AQITEM_FEET .. AQITEM_CLOTH,
        },
        {
            Name = "Axe of Fargosh",
            ID = "60719",
            Color = green,
            Description = AQITEM_MAINHAND .. AQITEM_AXE,
        },
    }
}
kQuestInstanceData[8].Quests.Horde[18] = {
    Title = "18. The Final Crack",
    Level = "59",
    Attain = "50",
    Aim = "Slay Quartermaster Zigris "..yellow.."[16]"..white.." deep in the Blackrock Spire for Karfang at Karfang Hold in Burning Steppes.",
    Location = "Karfang (Burning Steppes - Karfang Hold; "..yellow.."95.1,22.8"..white..")",
    Note = "",
    Prequest = "Protecting Fresh Blood -> Report to Molk -> Destroy All Traces... -> Take No Chances",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Tarnished Lancelot Ring",
            ID = "60739",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}

--------------- INST9 - Upper Blackrock Spire ---------------
kQuestInstanceData[9] = {
    Story = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself.",
    Caption = "Upper Blackrock Spire",
    QAA = "12 Quests",
    QAH = "13 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[9].Quests.Alliance[1] = {
    Title = "1. The Matron Protectorate",
    Level = "60",
    Attain = "57",
    Aim = "Travel to Winterspring and find Haleh. Give her Awbee's scale.",
    Location = "Awbee (Blackrock Spire; "..yellow.."[7]"..white..")",
    Note = "You find Awbee in the room after the Arena at "..yellow.."[7]"..white..". She stands on a jutty.\nHaleh is in Winterspring ("..yellow.."54,51"..white.."). Use the portal-sign in the end of the cave to get to her.",
    Prequest = "No",
    Folgequest = "Wrath of the Blue Flight",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Alliance[2] = {
    Title = "2. Finkle Einhorn, At Your Service!",
    Level = "60",
    Attain = "55",
    Aim = "Talk to Malyfous Darkhammer in Everlook.",
    Location = "Finkle Einhorn (Blackrock Spire; "..yellow.."[8]"..white..")",
    Note = "Finkle Einhorn spawns after skinning The Beast. You find Malyfous at (Winterspring - Everlook; "..yellow.."61,38"..white..").",
    Prequest = "No",
    Folgequest = "Leggings of Arcana, Cap of the Scarlet Savant, Breastplate of Bloodthirst and Shoulderguards of the Lightbringer",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Alliance[3] = {
    Title = "3. Egg Freezing",
    Level = "60",
    Attain = "57",
    Aim = "Use the Eggscilloscope Prototype on an egg in the Rookery.",
    Location = "Tinkee Steamboil (Burning Steppes - Flame Crest; "..yellow.."65,24"..white..")",
    Note = "You find the eggs in the room of Father Flame at "..yellow.."[2]"..white..".",
    Prequest = "Broodling Essence -> Tinkee Steamboil",
    Folgequest = "Egg Collection -> Leonid Barthalomew -> Dawn's Gambit ("..yellow.."Scholomance"..white..")",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Alliance[4] = {
    Title = "4. Eye of the Emberseer",
    Level = "60",
    Attain = "56",
    Aim = "Bring the Eye of the Emberseer to Duke Hydraxis in Azshara.",
    Location = "Duke Hydraxis (Azshara; "..yellow.."79,73"..white..")",
    Note = "You can find Pyroguard Emberseer at "..yellow.."[1]"..white..".",
    Prequest = "Poisoned Water, Stormers and Rumblers",
    Folgequest = "The Molten Core",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Alliance[5] = {
    Title = "5. General Drakkisath's Demise",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and destroy General Drakkisath. Return to Marshal Maxwell when the job is done.",
    Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; "..yellow.."82,68"..white..")",
    Note = "You find General Drakkisath at "..yellow.."[9]"..white..".",
    Prequest = "General Drakkisath's Command ("..yellow.."Lower Blackrock Spire"..white..")",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Mark of Tyranny",
            ID = "13966",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Eye of the Beast",
            ID = "13968",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Blackhand's Breadth",
            ID = "13965",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[9].Quests.Alliance[6] = {
    Title = "6. Doomrigger's Clasp",
    Level = "60",
    Attain = "57",
    Aim = "Bring Doomrigger's Clasp to Mayara Brightwing in the Burning Steppes.",
    Location = "Mayara Brightwing (Burning Steppes - Morgan's Vigil; "..yellow.."84,69"..white..")",
    Note = "You get the prequest from Count Remington Ridgewell (Stormwind - Stormwind Keep; "..yellow.."74,30"..white..").\n\nDoomrigger's Clasp is at "..yellow.."[3]"..white.." in a chest.",
    Prequest = "Mayara Brightwing",
    Folgequest = "Delivery to Ridgewell",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Swiftfoot Treads",
            ID = "15861",
            Color = green,
            Description = AQITEM_FEET .. AQITEM_LEATHER,
        },
        {
            Name = "Blinkstrike Armguards",
            ID = "15860",
            Color = green,
            Description = AQITEM_WRIST .. AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[9].Quests.Alliance[7] = {
    Title = "7. Drakefire Amulet",
    Level = "60",
    Attain = "50",
    Aim = "You must retrieve the Blood of the Black Dragon Champion from General Drakkisath. Drakkisath can be found in his throne room behind the Halls of Ascension in Blackrock Spire.",
    Location = "Haleh (Winterspring; "..yellow.."54,51"..white..")",
    Note = "Last part of the Onyxia quest chain for the Alliance. You find General Drakkisath at "..yellow.."[9]"..white..".",
    Prequest = "The Dragon's Eye",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Drakefire Amulet",
            ID = "16309",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[9].Quests.Alliance[8] = {
    Title = "8. Blackhand's Command",
    Level = "60",
    Attain = "55",
    Aim = "The letter indicates that General Drakkisath guards the brand. Perhaps you should investigate.",
    Location = "Blackhand's Command (drops from Scarshield Quartermaster; "..yellow.."[7] on Entrance Map"..white..")",
    Note = "Blackwing Lair attunement quest. Scarshield Quartermaster is found if you turn right before the LBRS/UBRS portal.\n\nGeneral Drakkisath is at "..yellow.."[9]"..white..". The brand is behind him.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Alliance[9] = {
    Title = "9. Final Preparations",
    Level = "60",
    Attain = "58",
    Aim = "Gather 40 Blackrock Bracers and acquire a Flask of Supreme Power. Return them to Bodley inside Blackrock Mountain.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Blackrock Bracers drop off mobs with Blackhand in the name. Flask of Supreme Power is made by an Alchemist.",
    Prequest = "The Right Piece of Lord Valthalak's Amulet ("..yellow.."Upper Blackrock Spire"..white..")",
    Folgequest = "Mea Culpa, Lord Valthalak",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Alliance[10] = {
    Title = "10. Mea Culpa, Lord Valthalak",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon Lord Valthalak. Dispatch him, and use Lord Valthalak's Amulet on the corpse. Then, return Lord Valthalak's Amulet to the Spirit of Lord Valthalak.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Lord Valthalak is summoned at "..yellow.."[8]"..white..". Rewards listed are for Return to Bodley.",
    Prequest = "Final Preparations",
    Folgequest = "Return to Bodley",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Brazier of Invocation",
            ID = "22057",
            Color = white,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Brazier of Invocation: User's Manual",
            ID = "22344",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[9].Quests.Alliance[11] = {
    Title = "11. The Demon Forge",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and find Goraluk Anvilcrack. Slay him and then use the Blood Stained Pike upon his corpse. After his soul has been siphoned, the pike will be Soul Stained. You must also find the Unforged Rune Covered Breastplate. Return both the Soul Stained Pike and the Unforged Rune Covered Breastplate to Lorax in Winterspring.",
    Location = "Lorax (Winterspring; "..yellow.."64,74"..white..")",
    Note = "Blacksmith quest. Goraluk Anvilcrack is at "..yellow.."[5]"..white..".",
    Prequest = "Lorax's Tale",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2 (x5)"..AQDiscription_OR..white.."3",
        {
            Name = "Plans: Demon Forged Breastplate",
            ID = "12696",
            Color = blue,
            Description = AQITEM_PATTERN,
        },
        {
            Name = "Elixir of Demonslaying",
            ID = "9224",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Demon Kissed Sack",
            ID = "12849",
            Color = green,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[9].Quests.Alliance[12] = {
    Title = "12. The Upper Binding I",
    Level = "60",
    Attain = "55",
    Aim = "Gather a Dragonkin Charge from the Black Dragonkin(Solakar Flamewreath) "..yellow.."[2]"..white.." within Blackrock Spire for Parnabus in Gilneas.",
    Location = "Parnabus <Wandering Wizard> (Gilneas; "..yellow.."[22.9,74.4]"..white..", very south of Gilneas City, west of river. inside of a lonely house).",
    Note = "Highly recommend to take prequest 'The Binding of Xanthar' from Hanvar the Righteous (Deadwind Pass in the small church outside of Karazhan "..yellow.."[40.9,79.3]"..white..").\nReward for the last quest of The Upper Binding quest chain will be quest item 'The Upper Binding of Xanthar' for quest 'The Binding of Xanthar'.",
    Prequest = "The Binding of Xanthar",
    Folgequest = "The Upper Binding II -> The Upper Binding III "..yellow.."[Dire Maul West]"..white.." -> The Upper Binding IV",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "The Upper Binding of Xanthar",
            ID = "61696",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[9].Quests.Horde[1] = kQuestInstanceData[9].Quests.Alliance[1]
kQuestInstanceData[9].Quests.Horde[2] = kQuestInstanceData[9].Quests.Alliance[2]
kQuestInstanceData[9].Quests.Horde[3] = kQuestInstanceData[9].Quests.Alliance[3]
kQuestInstanceData[9].Quests.Horde[4] = kQuestInstanceData[9].Quests.Alliance[4]
kQuestInstanceData[9].Quests.Horde[5] = {
    Title = "5. The Darkstone Tablet",
    Level = "60",
    Attain = "57",
    Aim = "Bring the Darkstone Tablet to Shadow Mage Vivian Lagrave in Kargath.",
    Location = "Shadowmage Vivian Lagrave (Badlands - Kargath; "..yellow.."2,47"..white..")",
    Note = "You get the prequest from Apothecary Zinge in Undercity - The Apothecarium ("..yellow.."50,68"..white..").\n\nThe Darkstone Tablet is at "..yellow.."[3]"..white.." in a chest.",
    Prequest = "Vivian Lagrave and the Darkstone Tablet",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Swiftfoot Treads",
            ID = "15861",
            Color = green,
            Description = AQITEM_FEET .. AQITEM_LEATHER,
        },
        {
            Name = "Blinkstrike Armguards",
            ID = "15860",
            Color = green,
            Description = AQITEM_WRIST .. AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[9].Quests.Horde[6] = {
    Title = "6. For The Horde!",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and slay Warchief Rend Blackhand. Take his head and return to Orgrimmar.",
    Location = "Thrall (Orgrimmar; "..yellow.."31,38"..white..")",
    Note = "Onyxia attunement quest. You find Warchief Rend Blackhand at "..yellow.."[6]"..white..".",
    Prequest = "Warlord's Command -> Eitrigg's Wisdom",
    Folgequest = "What the Wind Carries",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Mark of Tyranny",
            ID = "13966",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Eye of the Beast",
            ID = "13968",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Blackhand's Breadth",
            ID = "13965",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[9].Quests.Horde[7] = {
    Title = "7. Oculus Illusions",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and collect 20 Black Dragonspawn Eyes. Return to Myranda the Hag when the task is complete.",
    Location = "Myranda the Hag (Western Plaguelands; "..yellow.."50,77"..white..")",
    Note = "Dragonkin drop the eyes.",
    Prequest = "For The Horde! -> What the Wind Carries -> The Testament of Rexxar",
    Folgequest = "Emberstrife",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Horde[8] = {
    Title = "8. Blood of the Black Dragon Champion",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and slay General Drakkisath. Gather his blood and return it to Rexxar.",
    Location = "Rexxar (Desolace - Shadowprey Village; "..yellow.."25,71"..white..")",
    Note = "Last part of the Onyxia prequest. You find General Drakkisath at "..yellow.."[9]"..white..".",
    Prequest = "Emberstrife -> Ascension...",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Drakefire Amulet",
            ID = "16309",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[9].Quests.Horde[9] = {
    Title = "9. Blackhand's Command",
    Level = "60",
    Attain = "55",
    Aim = "The letter indicates that General Drakkisath guards the brand. Perhaps you should investigate.",
    Location = "Blackhand's Command (drops from Scarshield Quartermaster; "..yellow.."[7] on Entrance Map"..white..")",
    Note = "Blackwing Lair attunement quest. Scarshield Quartermaster is found if you turn right before the LBRS/UBRS portal.\n\nGeneral Drakkisath is at "..yellow.."[9]"..white..". The brand is behind him.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Horde[10] = {
    Title = "10. Final Preparations",
    Level = "60",
    Attain = "58",
    Aim = "Gather 40 Blackrock Bracers and acquire a Flask of Supreme Power. Return them to Bodley inside Blackrock Mountain.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Blackrock Bracers drop off mobs with Blackhand in the name. Flask of Supreme Power is made by an Alchemist.",
    Prequest = "The Right Piece of Lord Valthalak's Amulet ("..yellow.."Upper Blackrock Spire"..white..")",
    Folgequest = "Mea Culpa, Lord Valthalak",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[9].Quests.Horde[11] = {
    Title = "11. Mea Culpa, Lord Valthalak",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon Lord Valthalak. Dispatch him, and use Lord Valthalak's Amulet on the corpse. Then, return Lord Valthalak's Amulet to the Spirit of Lord Valthalak.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Lord Valthalak is summoned at "..yellow.."[8]"..white..". Rewards listed are for Return to Bodley.",
    Prequest = "Final Preparations",
    Folgequest = "Return to Bodley",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Brazier of Invocation",
            ID = "22057",
            Color = white,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Brazier of Invocation: User's Manual",
            ID = "22344",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[9].Quests.Horde[12] = {
    Title = "12. The Demon Forge",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and find Goraluk Anvilcrack. Slay him and then use the Blood Stained Pike upon his corpse. After his soul has been siphoned, the pike will be Soul Stained. You must also find the Unforged Rune Covered Breastplate. Return both the Soul Stained Pike and the Unforged Rune Covered Breastplate to Lorax in Winterspring.",
    Location = "Lorax (Winterspring; "..yellow.."64,74"..white..")",
    Note = "Blacksmith quest. Goraluk Anvilcrack is at "..yellow.."[5]"..white..".",
    Prequest = "Lorax's Tale",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2 (x5)"..AQDiscription_OR..white.."3",
        {
            Name = "Plans: Demon Forged Breastplate",
            ID = "12696",
            Color = blue,
            Description = AQITEM_PATTERN,
        },
        {
            Name = "Elixir of Demonslaying",
            ID = "9224",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Demon Kissed Sack",
            ID = "12849",
            Color = green,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[9].Quests.Horde[13] = {
    Title = "13. The Upper Binding I",
    Level = "60",
    Attain = "55",
    Aim = "Gather a Dragonkin Charge from the Black Dragonkin(Solakar Flamewreath) "..yellow.."[2]"..white.." within Blackrock Spire for Parnabus in Gilneas.",
    Location = "Parnabus <Wandering Wizard> (Gilneas; "..yellow.."[22.9,74.4]"..white..", very south of Gilneas City, west of river. inside of a lonely house).",
    Note = "Highly recommend to take prequest 'The Binding of Xanthar' from Hanvar the Righteous (Deadwind Pass in the small church outside of Karazhan "..yellow.."[40.9,79.3]"..white..").\nReward for the last quest of The Upper Binding quest chain will be quest item 'The Upper Binding of Xanthar' for quest 'The Binding of Xanthar'.",
    Prequest = "The Binding of Xanthar",
    Folgequest = "The Upper Binding II -> The Upper Binding III "..yellow.."[Dire Maul West]"..white.." -> The Upper Binding IV",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "The Upper Binding of Xanthar",
            ID = "61696",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}

--------------- INST10 - Dire Maul (East) ---------------
kQuestInstanceData[10] = {
    Story = "Built twelve thousand years ago by a covert sect of night elf sorcerers, the ancient city of Eldre'Thalas was used to protect Queen Azshara's most prized arcane secrets. Though it was ravaged by the Great Sundering of the world, much of the wondrous city still stands as the imposing Dire Maul. The ruins' three distinct districts have been overrun by all manner of creatures - especially the spectral highborne, foul satyr and brutish ogres. Only the most daring party of adventurers can enter this broken city and face the ancient evils locked within its ancient vaults.",
    Caption = "Dire Maul (East)",
    QAA = "9 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[10].Quests.Alliance[1] = {
    Title = "1. Pusillin and the Elder Azj'Tordin",
    Level = "58",
    Attain = "54",
    Aim = "Travel to Dire Maul and locate the Imp, Pusillin. Convince Pusillin to give you Azj'Tordin's Book of Incantations through any means necessary.\nReturn to Azj'Tordin at the Lariss Pavilion in Feralas should you recover the Book of Incantations.",
    Location = "Azj'Tordin (Feralas - Lariss Pavillion; "..yellow.."76,37"..white..")",
    Note = "Pusillin is in Dire Maul "..yellow.."East"..white.." at "..yellow.."[1]"..white..". He runs when you talk to him, but stops and fights at "..yellow.."[2]"..white..". He'll drop the Crescent Key which is used for Dire Maul North and West.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Spry Boots",
            ID = "18411",
            Color = green,
            Description = AQITEM_FEET .. AQITEM_LEATHER,
        },
        {
            Name = "Sprinter's Sword",
            ID = "18410",
            Color = green,
            Description = AQITEM_TWOHAND .. AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[10].Quests.Alliance[2] = {
    Title = "2. Lethtendris's Web",
    Level = "57",
    Attain = "54",
    Aim = "Bring Lethtendris' Web to Latronicus Moonspear at the Feathermoon Stronghold in Feralas.",
    Location = "Latronicus Moonspear (Feralas - Feathermoon Stronghold; "..yellow.."30,46"..white..")",
    Note = "Lethtendris is in Dire Maul "..yellow.."East"..white.." at "..yellow.."[3]"..white..". The prequest comes from Courier Hammerfall in Ironforge. He roams the entire city.",
    Prequest = "Feathermoon Stronghold",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Lorespinner",
            ID = "18491",
            Color = blue,
            Description = AQITEM_MAINHAND .. AQITEM_DAGGER,
        },
    }
}
kQuestInstanceData[10].Quests.Alliance[3] = {
    Title = "3. Shards of the Felvine",
    Level = "60",
    Attain = "56",
    Aim = "Find the Felvine in Dire Maul and acquire a shard from it. Chances are you'll only be able to procure one with the demise of Alzzin the Wildshaper. Use the Reliquary of Purity to securely seal the shard inside, and return it to Rabine Saturna in Nighthaven, Moonglade.",
    Location = "Rabine Saturna (Moonglade - Nighthaven; "..yellow.."51,44"..white..")",
    Note = "You find Alliz the Wildshaper in the "..yellow.."East"..white.." part of Dire Maul at "..yellow.."[5]"..white..". The relict is in Silithius at "..yellow.."62,54"..white..". The prequest comes from Rabine Saturna as well.",
    Prequest = "A Reliquary of Purity",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Milli's Shield",
            ID = "18535",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Milli's Lexicon",
            ID = "18536",
            Color = blue,
            Description = AQITEM_OFFHAND,
        },
    }
}
kQuestInstanceData[10].Quests.Alliance[4] = {
    Title = "4. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Isalien and slay her. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nIsalien is summoned at "..yellow.."[5]"..white..".",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[10].Quests.Alliance[5] = {
    Title = "5. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Isalien and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nIsalien is summoned at "..yellow.."[5]"..white..".",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations ("..yellow.."Upper Blackrock Spire"..white..")",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[10].Quests.Alliance[6] = {
    Title = "6. The Prison's Bindings",
    Level = "60",
    Attain = "60",
    Aim = "Travel to Dire Maul in Feralas and recover 15 Satyr Blood from the Wildspawn Satyr that inhabit the Warpwood Quarter. Return to Daio in the Tainted Scar when this is done.",
    Location = "Daio the Decrepit (Blasted Lands - The Tainted Scar; "..yellow.."34,50"..white..")",
    Note = red.."Warlock only"..white..": This along with another quest given by Daio the Decrepit are Warlock only quests for the Ritual of Doom spell. The easiest way to get to the Wildspawn Satyr is to enter Dire Maul East through the 'back door' at the Lariss Pavilion (Feralas; "..yellow.."77,37"..white.."). You'll need the Crescent Key, however.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[10].Quests.Alliance[7] = {
    Title = "7. Arcane Refreshment",
    Level = "60",
    Attain = "60",
    Aim = "Travel to the Warpwood Quarter of Dire Maul and slay the water elemental, Hydrospawn. Return to Lorekeeper Lydros in the Athenaeum with the Hydrospawn Essence.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white..")",
    Note = red.."Mage Only"..white..": Hydrospawn Essence drop from [3] Hydrospawn. Reward: you can use Conjured Crystal Water.",
    Prequest = "No",
    Folgequest = "A Special Kind of Summons",
}
kQuestInstanceData[10].Quests.Alliance[8] = {
    Title = "8. The Wildshaper",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Head of Alzzin the Wildshaper for Arch Druid Dreamwind at Nordanaar in Hyjal.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; "..yellow.."84.8,29.3"..white.." top floor of the big tree)",
    Note = "You find Alliz the Wildshaper at "..yellow.."[5]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Bright Dream Shard",
            ID = "61199",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Talisman of the Dreamshaper",
            ID = "61703",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[10].Quests.Alliance[9] = {
    Title = "9. Wrapping Warpwood",
    Level = "61",
    Attain = "60",
    Aim = "Bring 5 Blue Leaves to Lorekeeper Lydros.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white..")",
    Note = red.."Druid Only"..white..": Blue Leaves drop from Treants.\nPrequest start [of Ancients and Treants] - (Tower of Karazhan "..yellow.."near [0]"..white..")", --2020112",
    Prequest = "A Study of Magical Trees",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Glyph of the Arcane Treant",
            ID = "51070",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[10].Quests.Horde[1] = kQuestInstanceData[10].Quests.Alliance[1]
kQuestInstanceData[10].Quests.Horde[2] = {
    Title = "2. Lethtendris's Web",
    Level = "57",
    Attain = "54",
    Aim = "Bring Lethtendris's Web to Talo Thornhoof at Camp Mojache in Feralas.",
    Location = "Talo Thornhoof (Feralas - Camp Mojache; "..yellow.."76,43"..white..")",
    Note = "Lethtendris is in Dire Maul "..yellow.."East"..white.." at "..yellow.."[3]"..white..". The prequest comes from Warcaller Gorlach in Orgrimmar. He roams the entire city.",
    Prequest = "Camp Mojache",
    Folgequest = "No",
    Rewards = kQuestInstanceData[10].Quests.Alliance[2].Rewards
}
kQuestInstanceData[10].Quests.Horde[3] = kQuestInstanceData[10].Quests.Alliance[3]
kQuestInstanceData[10].Quests.Horde[4] = kQuestInstanceData[10].Quests.Alliance[4]
kQuestInstanceData[10].Quests.Horde[5] = kQuestInstanceData[10].Quests.Alliance[5]
kQuestInstanceData[10].Quests.Horde[6] = kQuestInstanceData[10].Quests.Alliance[6]
kQuestInstanceData[10].Quests.Horde[7] = kQuestInstanceData[10].Quests.Alliance[7]
kQuestInstanceData[10].Quests.Horde[8] = kQuestInstanceData[10].Quests.Alliance[8]
kQuestInstanceData[10].Quests.Horde[9] = kQuestInstanceData[10].Quests.Alliance[9]

--------------- INST11 - Dire Maul (North) ---------------
kQuestInstanceData[11] = {
    Story = kQuestInstanceData[10].Story,
    Caption = "Dire Maul (North)",
    QAA = "4 Quests",
    QAH = "4 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[11].Quests.Alliance[1] = {
    Title = "1. A Broken Trap",
    Level = "60",
    Attain = "56",
    Aim = "Repair the trap.",
    Location = "A Broken Trap (Dire Maul; "..yellow.."North"..white..")",
    Note = "Repeatable quest. To repair the trap you have to use a [Thorium Widget] and a [Frost Oil].",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[11].Quests.Alliance[2] = {
    Title = "2. The Gordok Ogre Suit",
    Level = "60",
    Attain = "56",
    Aim = "Bring 4 Bolts of Runecloth, 8 Rugged Leather, 2 Rune Threads, and Ogre Tannin to Knot Thimblejack. He is currently chained inside the Gordok wing of Dire Maul.",
    Location = "Knot Thimblejack (Dire Maul; "..yellow.."North, [4]"..white..")",
    Note = "Repeatable quest. You get the Ogre Tannin near "..yellow.."[4] (above)"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Gordok Ogre Suit",
            ID = "18258",
            Color = green,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[11].Quests.Alliance[3] = {
    Title = "3. Free Knot!",
    Level = "60",
    Attain = "57",
    Aim = "Collect a Gordok Shackle Key for Knot Thimblejack.",
    Location = "Knot Thimblejack (Dire Maul; "..yellow.."North, [4]"..white..")",
    Note = "Repeatable quest. Every warden can drop the key.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[11].Quests.Alliance[4] = {
    Title = "4. Unfinished Gordok Business",
    Level = "60",
    Attain = "56",
    Aim = "Find the Gauntlet of Gordok Might and return it to Captain Kromcrush in Dire Maul.\nAccording to Kromcrush, the 'old timey story' says that Tortheldrin - a 'creepy' elf who called himself a prince - stole it from one of the Gordok kings.",
    Location = "Captain Kromcrush (Dire Maul; "..yellow.."North, [5]"..white..")",
    Note = "Prince is in Dire Maul "..yellow.."West"..white.." at "..yellow.."[7]"..white..". The Gauntlet is near him in a chest. You can only get this quest after a Tribute run and have the 'King of the Gordok' buff.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Gordok's Handwraps",
            ID = "18369",
            Color = blue,
            Description = AQITEM_HANDS .. AQITEM_CLOTH,
        },
        {
            Name = "Gordok's Gloves",
            ID = "18368",
            Color = blue,
            Description = AQITEM_HANDS ..AQITEM_LEATHER,
        },
        {
            Name = "Gordok's Gauntlets",
            ID = "18367",
            Color = blue,
            Description = AQITEM_HANDS .. AQITEM_MAIL,
        },
        {
            Name = "Gordok's Handguards",
            ID = "18366",
            Color = blue,
            Description = AQITEM_HANDS .. AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[11].Quests.Horde[1] = kQuestInstanceData[11].Quests.Alliance[1]
kQuestInstanceData[11].Quests.Horde[2] = kQuestInstanceData[11].Quests.Alliance[2]
kQuestInstanceData[11].Quests.Horde[3] = kQuestInstanceData[11].Quests.Alliance[3]
kQuestInstanceData[11].Quests.Horde[4] = kQuestInstanceData[11].Quests.Alliance[4]

--------------- INST12 - Dire Maul (West) ---------------
kQuestInstanceData[12] = {
    Story = kQuestInstanceData[10].Story,
    Caption = "Dire Maul (West)",
    QAA = "21 Quests",
    QAH = "21 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[12].Quests.Alliance[1] = {
    Title = "1. Elven Legends",
    Level = "60",
    Attain = "54",
    Aim = "Search Dire Maul for Kariel Winthalus. Report back to Scholar Runethorn at Feathermoon with whatever information that you may find.",
    Location = "Scholar Runethorn (Feralas - Feathermoon Stronghold; "..yellow.."31,43"..white..")",
    Note = "You find Kariel Winthalus in the "..yellow.."Library (West)"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[12].Quests.Alliance[2] = {
    Title = "2. The Madness Within",
    Level = "60",
    Attain = "56",
    Aim = "You must destroy the guardians surrounding the 5 Pylons that power the Prison of Immol'thar. Once the Pylons have powered down, the force field surrounding Immol'thar will have dissipated.\nEnter the Prison of Immol'thar and eradicate the foul demon that stands at its heart. Finally, confront Prince Tortheldrin in Athenaeum.",
    Location = "Shen'dralar Ancient (Dire Maul; "..yellow.."West, [1] (above)"..white..")",
    Note = "The Pylons are marked as "..blue.."[B]"..white..". Immol'thar is at "..yellow.."[6]"..white..", Prince Tortheldrin at "..yellow.."[7]"..white..".",
    Prequest = "No",
    Folgequest = "The Treasure of the Shen'dralar",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[12].Quests.Alliance[3] = {
    Title = "3. The Treasure of the Shen'dralar",
    Level = "60",
    Attain = "56",
    Aim = "Return to the Athenaeum and find the Treasure of the Shen'dralar. Claim your reward!",
    Location = "Shen'dralar Ancient (Dire Maul; "..yellow.."West, [1]"..white..")",
    Note = "You can find the Treasure under the stairs "..yellow.."[7]"..white..".",
    Prequest = "The Madness Within",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Sedge Boots",
            ID = "18424",
            Color = blue,
            Description = AQITEM_FEET .. AQITEM_LEATHER,
        },
        {
            Name = "Backwood Helm",
            ID = "18421",
            Color = blue,
            Description = AQITEM_HEAD ..AQITEM_MAIL,
        },
        {
            Name = "Bonecrusher",
            ID = "18420",
            Color = blue,
            Description = AQITEM_TWOHAND .. AQITEM_MACE,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[4] = {
    Title = "4. Dreadsteed of Xoroth",
    Level = "60",
    Attain = "60",
    Aim = "Read Mor'zul's Instructions. Summon a Xorothian Dreadsteed, defeat it, then bind its spirit to you.",
    Location = "Mor'zul Bloodbringer (Burning Steppes; "..yellow.."12,31"..white..")",
    Note = red.."Warlock only"..white..": Final Quest in the Warlock Epic mount questline. First you must shut down all Pylons marked with "..blue.."[B]"..white.." and then kill Immol'thar at "..yellow.."[6]"..white..". After that, you can begin the Summoning Ritual. Be sure to have upwards of 20 Soul Shards ready and have one Warlock specifically assigned to keeping the Bell, Candle and Wheel up. The Doomguards that come can be enslaved. After completion, talk to the Dreadsteed ghost to complete the quest.",
    Prequest = "Imp Delivery ("..yellow.."Scholomance"..white..")", -- 7629",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[12].Quests.Alliance[5] = {
    Title = "5. The Emerald Dream...",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Emerald Dream (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Druid only"..white..": You turn the book in to Lorekeeper Javon at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18470",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[6] = {
    Title = "6. The Greatest Race of Hunters",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Greatest Race of Hunters (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Hunter only"..white..": You turn the book in to Lorekeeper Mykos at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18473",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[7] = {
    Title = "7. The Arcanist's Cookbook",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Arcanist's Cookbook (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Mage only"..white..": You turn the book in to Lorekeeper Kildrath at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18468",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[8] = {
    Title = "8. The Light and How To Swing It",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Light and How To Swing It (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Paladin only"..white..": You turn the book in to Lorekeeper Mykos at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18472",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[9] = {
    Title = "9. Holy Bologna: What the Light Won't Tell You",
    Level = "60",
    Attain = "56",
    Aim = "Return the book to its rightful owners.",
    Location = "Holy Bologna: What the Light Won't Tell You (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Priest only"..white..": You turn the book in to Lorekeeper Javon at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18469",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[10] = {
    Title = "10. Garona: A Study on Stealth and Treachery",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Garona: A Study on Stealth and Treachery (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Rogue only"..white..": You turn the book in to Lorekeeper Kildrath at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18465",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[11] = {
    Title = "11. Frost Shock and You",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Frost Shock and You (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Shaman only"..white..": You turn the book in to Lorekeeper Javon at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18471",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[12] = {
    Title = "12. Harnessing Shadows",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Harnessing Shadows (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Warlock only"..white..": You turn the book in to Lorekeeper Mykos at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18467",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[13] = {
    Title = "13. Codex of Defense",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Codex of Defense (randomly drops off bosses in all Dire Maul wings)",
    Note = red.."Warrior only"..white..": You turn the book in to Lorekeeper Kildrath at the "..yellow.."1' Library"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Royal Seal of Eldre'Thalas",
            ID = "18466",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[14] = {
    Title = "14. Libram of Focus",
    Level = "60",
    Attain = "58",
    Aim = "Bring a Libram of Focus, 1 Pristine Black Diamond, 4 Large Brilliant Shards, and 2 Skin of Shadow to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Focus.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white..")",
    Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Skin of Shadow is Soulbound and can drop off some bosses, Risen Constructs and Risen Bonewarder in "..yellow.."Scholomance"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Arcanum of Focus",
            ID = "18330",
            Color = green,
            Description = AQITEM_ENCHANT,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[15] = {
    Title = "15. Libram of Protection",
    Level = "60",
    Attain = "58",
    Aim = "Bring a Libram of Protection, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 1 Frayed Abomination Stitching to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Protection.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white..")",
    Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Frayed Abomination Stitching is Soulbound and can drop off Ramstein the Gorger, Venom Belchers, Bile Spewer and Patchwork Horror in "..yellow.."Stratholme"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Arcanum of Protection",
            ID = "18331",
            Color = green,
            Description = AQITEM_ENCHANT,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[16] = {
    Title = "16. Libram of Rapidity",
    Level = "60",
    Attain = "58",
    Aim = "Bring a Libram of Rapidity, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 2 Blood of Heroes to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Rapidity.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white..")",
    Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Blood of Heroes is Soulbound and can be found on the ground in random places in the Western and Eastern Plaguelands.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Arcanum of Rapidity",
            ID = "18329",
            Color = green,
            Description = AQITEM_ENCHANT,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[17] = {
    Title = "17. Foror's Compendium",
    Level = "60",
    Attain = "60",
    Aim = "Return Foror's Compendium of Dragon Slaying to the Athenaeum.",
    Location = "Foror's Compendium of Dragon Slaying (random boss drop in "..yellow.."Dire Maul"..white..")",
    Note = red.."Warrior or Paladin quest."..white.." It turns in to Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white.."). Turning this in allows you to start the quest for Quel'Serrar.",
    Prequest = "No",
    Folgequest = "The Forging of Quel'Serrar",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[12].Quests.Alliance[18] = {
    Title = "18. Keeping Secrets",
    Level = "58",
    Attain = "45",
    Aim = "Travel to Dire Maul, and slay the great evil being that the Highborne are leeching energy upon, gather from it Pure Ley Essence, and return to Keeper Laena in Azshara.",
    Location = "Keeper Laena (Azshara; "..yellow.."44,45.4"..white..")",
    Note = "Immol'thar "..yellow.."[6]"..white.." drops Pure Ley Essence.\nQuestline starts with quest 'The Keepers Charge' at Keeper Iselus "..yellow.."89,8,33.8"..white.." Azshara, north-east coast corner.",
    Prequest = "Restoring the Ley Lines",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Azshara Keeper's Staff",
            ID = "60333",
            Color = blue,
            Description = AQITEM_TWOHAND .. AQITEM_STAFF,
        },
        {
            Name = "Ring of Eldara",
            ID = "60334",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[19] = {
    Title = "19. The Upper Binding III",
    Level = "60",
    Attain = "55",
    Aim = "Gather a Supercharged Arcane Resonation from the arcane elementals of Dire Maul for Parnabus in Gilneas.",
    Location = "Parnabus <Wandering Wizard> (Gilneas; "..yellow.."[22.9,74.4]"..white..", very south of Gilneas City, west of river. inside of a lonely hose).",
    Note = "Highly recommend to take prequest 'The Binding of Xanthar' from Hanvar the Righteous (Deadwind Pass in the small church outside of Karazhan "..yellow.."[40.9,79.3]"..white..").\nReward for the last quest of The Upper Binding quest chain will be quest item 'The Upper Binding of Xanthar' for quest 'The Binding of Xanthar'.\nArcane Torrents big elementals in the circle around "..yellow.."[6]"..white.." drop Supercharged Arcane Resonation.",
    Prequest = "The Binding of Xanthar -> The Upper Binding I "..yellow.."[Upper Blackrock Spire]"..white.." -> The Upper Binding II", --41015, 41011, 41012",
    Folgequest = "The Upper Binding IV",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "The Upper Binding of Xanthar",
            ID = "61696",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[12].Quests.Alliance[20] = {
    Title = "20. The Key to Karazhan VIII",
    Level = "60",
    Attain = "58",
    Aim = "Slay Immol'thar "..yellow.."[6]"..white.." in Dire Maul West, retrieve Arcanized Gems from his skin, and return to Dolvan. ",
    Location = "Dolvan Bracewind (Dustwallow Marsh - ; "..yellow.."[71.1,73.2]"..white..")",
    Note = "Prequests Lower Karazhan Halls. Arcanized Gems drop from "..yellow.."[6].",
    Prequest = "The Key to Karazhan I - VI -> The Key to Karazhan VII "..yellow.."[Stratholme]"..white.." ", --40817",
    Folgequest = "The Key to Karazhan IX (BWL) -> The Key to Karazhan X",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[12].Quests.Alliance[21] = {
    Title = "21. Into the Dream III",
    Level = "60",
    Attain = "58",
    Aim = "Gather a Binding Fragment from Cliff Breakers in "..yellow.."[Azshara]"..white..", Overloaded Arcane Prism from Arcane Torrents in "..yellow.."[Dire Maul West]"..white..", Slumberer's Shard from Weaver in the "..yellow.."[Sunken Temple]"..white.." and an Arcanite Rod. Report to Itharius in the Swamp of Sorrows with the collected items.",
    Location = "Ralathius (Hyjal - Nordanaar; "..yellow.."[81.6,27.7]"..white.." a green dragonkin)",
    Note = "Arcane Torrents big elementals in the circle around "..yellow.."[6]"..white.." drop Overloaded Arcane Prism.\nFinishing this questline you get the necklace and you will be able to enter Hyjal raid instance Emerald Sanctum.",
    Prequest = "Into the Dream I -> Into the Dream II",
    Folgequest = "Into the Dream IV - VI",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Gemstone of Ysera",
            ID = "50545",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[12].Quests.Horde[1] = {
    Title = "1. Elven Legends",
    Level = "60",
    Attain = "54",
    Aim = "Search Dire Maul for Kariel Winthalus. Report back to Sage Korolusk at Camp Mojache with whatever information that you may find.",
    Location = "Sage Korolusk (Feralas - Camp Mojache; "..yellow.."74,43"..white..")",
    Note = "You find Kariel Winthalus in the "..yellow.."Library (West)"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[12].Quests.Horde[2] = kQuestInstanceData[12].Quests.Alliance[2]
kQuestInstanceData[12].Quests.Horde[3] = kQuestInstanceData[12].Quests.Alliance[3]
kQuestInstanceData[12].Quests.Horde[4] = kQuestInstanceData[12].Quests.Alliance[4]
kQuestInstanceData[12].Quests.Horde[5] = kQuestInstanceData[12].Quests.Alliance[5]
kQuestInstanceData[12].Quests.Horde[6] = kQuestInstanceData[12].Quests.Alliance[6]
kQuestInstanceData[12].Quests.Horde[7] = kQuestInstanceData[12].Quests.Alliance[7]
kQuestInstanceData[12].Quests.Horde[8] = kQuestInstanceData[12].Quests.Alliance[8]
kQuestInstanceData[12].Quests.Horde[9] = kQuestInstanceData[12].Quests.Alliance[9]
kQuestInstanceData[12].Quests.Horde[10] = kQuestInstanceData[12].Quests.Alliance[10]
kQuestInstanceData[12].Quests.Horde[11] = kQuestInstanceData[12].Quests.Alliance[11]
kQuestInstanceData[12].Quests.Horde[12] = kQuestInstanceData[12].Quests.Alliance[12]
kQuestInstanceData[12].Quests.Horde[13] = kQuestInstanceData[12].Quests.Alliance[13]
kQuestInstanceData[12].Quests.Horde[14] = kQuestInstanceData[12].Quests.Alliance[14]
kQuestInstanceData[12].Quests.Horde[15] = kQuestInstanceData[12].Quests.Alliance[15]
kQuestInstanceData[12].Quests.Horde[16] = kQuestInstanceData[12].Quests.Alliance[16]
kQuestInstanceData[12].Quests.Horde[17] = kQuestInstanceData[12].Quests.Alliance[17]
kQuestInstanceData[12].Quests.Horde[18] = kQuestInstanceData[12].Quests.Alliance[18]
kQuestInstanceData[12].Quests.Horde[19] = kQuestInstanceData[12].Quests.Alliance[19]
kQuestInstanceData[12].Quests.Horde[20] = kQuestInstanceData[12].Quests.Alliance[20]
kQuestInstanceData[12].Quests.Horde[21] = kQuestInstanceData[12].Quests.Alliance[21]

--------------- INST13 - Maraudon ---------------
kQuestInstanceData[13] = {
    Story = "Protected by the fierce Maraudine centaur, Maraudon is one of the most sacred sites within Desolace. The great temple/cavern is the burial place of Zaetar, one of two immortal sons born to the demigod, Cenarius. Legend holds that Zaetar and the earth elemental princess, Theradras, sired the misbegotten centaur race. It is said that upon their emergence, the barbaric centaur turned on their father and killed him. Some believe that Theradras, in her grief, trapped Zaetar's spirit within the winding cavern - used its energies for some malign purpose. The subterranean tunnels are populated by the vicious, long-dead ghosts of the Centaur Khans, as well as Theradras' own raging, elemental minions.",
    Caption = "Maraudon",
    QAA = "11 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[13].Quests.Alliance[1] = {
    Title = "1. Shadowshard Fragments",
    Level = "42",
    Attain = "38",
    Aim = "Collect 10 Shadowshard Fragments from Maraudon and return them to Archmage Tervosh in Theramore on the coast of Dustwallow Marsh.",
    Location = "Archmage Tervosh (Dustwallow Marsh - Theramore Isle; "..yellow.."66,49"..white..")",
    Note = "You get the Shadowshard Fragments from 'Shadowshard Rumbler' or 'Shadowshard Smasher' outside the instance on the Purple side.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Zealous Shadowshard Pendant",
            ID = "17772",
            Color = green,
            Description = AQITEM_NECK,
        },
        {
            Name = "Prodigious Shadowshard Pendant",
            ID = "17773",
            Color = green,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[13].Quests.Alliance[2] = {
    Title = "2. Vyletongue Corruption",
    Level = "47",
    Attain = "41",
    Aim = "Fill the Coated Cerulean Vial at the orange crystal pool in Maraudon.\nUse the Filled Cerulean Vial on the Vylestem Vines to force the corrupted Noxxious Scion to emerge.\nHeal 8 plants by killing these Noxxious Scion, then return to Talendria in Nijel's Point.",
    Location = "Talendria (Desolace - Nijel's Point; "..yellow.."68,8"..white..")",
    Note = "You can fill the Vial at any pool outside the instance on the Orange side. The plants are in the orange and purple areas inside the instance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Woodseed Hoop",
            ID = "17768",
            Color = green,
            Description = AQITEM_RING,
        },
        {
            Name = "Sagebrush Girdle",
            ID = "17778",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_LEATHER,
        },
        {
            Name = "Branchclaw Gauntlets",
            ID = "17770",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[13].Quests.Alliance[3] = {
    Title = "3. Twisted Evils",
    Level = "47",
    Attain = "41",
    Aim = "Collect 15 Theradric Crystal Carvings for Willow in Desolace.",
    Location = "Willow (Desolace; "..yellow.."62,39"..white..")",
    Note = "Most mobs in Maraudon drop the Carvings.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Acumen Robes",
            ID = "17775",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
        {
            Name = "Sprightring Helm",
            ID = "17776",
            Color = green,
            Description = AQITEM_HEAD..AQITEM_LEATHER,
        },
        {
            Name = "Relentless Chain",
            ID = "17777",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_MAIL,
        },
        {
            Name = "Hulkstone Pauldrons",
            ID = "17779",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[13].Quests.Alliance[4] = {
    Title = "4. The Pariah's Instructions",
    Level = "48",
    Attain = "39",
    Aim = "Read the Pariah's Instructions. Afterwards, obtain the Amulet of Union from Maraudon and return it to the Centaur Pariah in southern Desolace.",
    Location = "Centaur Pariah (Desolace; "..yellow.."45,86"..white..")",
    Note = "The 5 Kahns (Description for The Pariah's Instructions)",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Mark of the Chosen",
            ID = "17774",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    },
    page = {2, "You find the Centaur Pariah in the south of desolace. He walks between "..yellow.."44,85"..white.." and "..yellow.."50,87"..white..".\nFirst, you have to kill the The Nameless Prophet ("..yellow.."[A] on Entrance Map"..white.."). You find him before you enter the instance, before the point where you can choose whether you take the purple or the orange entrance. After killing him you must kill the 5 Kahns. You find the first if you choose the way in the middle ("..yellow.."[1] on Entrance Map"..white.."). The second is in the purple part of Maraudon but before you enter the instance ("..yellow.."[2] on Entrance Map"..white.."). The third is in the orange part before you enter the instance ("..yellow.."[3] on Entrance Map"..white.."). The fourth is near "..yellow.."[4]"..white.." and the fifth is near  "..yellow.."[1]"..white..".", },
}
kQuestInstanceData[13].Quests.Alliance[5] = {
    Title = "5. Legends of Maraudon",
    Level = "49",
    Attain = "41",
    Aim = "Recover the two parts of the Scepter of Celebras: the Celebrian Rod and the Celebrian Diamond.\nFind a way to speak with Celebras.",
    Location = "Cavindra (Desolace - Maraudon; "..yellow.."[4] on Entrance Map"..white..")",
    Note = "You find Cavindra at the beginning  of the orange part before you enter the instance.\nYou get the Celebrian Rod from Noxxion at "..yellow.."[2]"..white..", the Celebrian Diamond from Lord Vyletongue at  "..yellow.."[5]"..white..". Celebras is at "..yellow.."[7]"..white..". You have to defeat him to be able to talk to him.",
    Prequest = "No",
    Folgequest = "The Scepter of Celebras",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[13].Quests.Alliance[6] = {
    Title = "6. The Scepter of Celebras",
    Level = "49",
    Attain = "41",
    Aim = "Assist Celebras the Redeemed while he creates the Scepter of Celebras.\nSpeak with him when the ritual is complete.",
    Location = "Celebras the Redeemed (Maraudon; "..yellow.."[7]"..white..")",
    Note = "Celebras creates the Scepter. Speak with him after he is finished.",
    Prequest = "Legends of Maraudon",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Scepter of Celebras",
            ID = "17191",
            Color = blue,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[13].Quests.Alliance[7] = {
    Title = "7. Corruption of Earth and Seed",
    Level = "51",
    Attain = "45",
    Aim = "Slay Princess Theradras and return to Keeper Marandis at Nijel's Point in Desolace.",
    Location = "Keeper Marandis (Desolace - Nijel's Point; "..yellow.."63,10"..white..")",
    Note = "You find Princess Theradras at "..yellow.."[11]"..white..".",
    Prequest = "No",
    Folgequest = "Seed of Life",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Thrash Blade",
            ID = "17705",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Resurgence Rod",
            ID = "17743",
            Color = blue,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Verdant Keeper's Aim",
            ID = "17753",
            Color = blue,
            Description = AQITEM_BOW,
        },
    }
}
kQuestInstanceData[13].Quests.Alliance[8] = {
    Title = "8. Seed of Life",
    Level = "51",
    Attain = "45",
    Aim = "Seek out Remulos in Moonglade and give him the Seed of Life.",
    Location = "Zaetars Ghost (Maraudon; "..yellow.."[11]"..white..")",
    Note = "Zaetars Ghost appears after killing Princess Theradras "..yellow.."[11]"..white..". You find Keeper Remulos at (Moonglade - Shrine of Remulos; "..yellow.."36,41"..white..").",
    Prequest = "Corruption of Earth and Seed",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[13].Quests.Alliance[9] = {
    Title = "9. Harness of Chimaeran",
    Level = "48",
    Attain = "38",
    Aim = "Retrieve the Harness of Chimaeran from Maraudon and bring it back to Velos Sharpstrike at Chimaera Roost Vale in Feralas.",
    Location = "Velos Sharpstrike (Feralas - Chimaera Roost Vale; "..yellow.."[82.0,62.3]"..white.." southeastern corner of Feralas)",
    Note = "Purple Maraudon satir boss Lord Vyletongue "..yellow.."[5]"..white.." drops Harness of Chimaeran.",
    Prequest = "Cleansing the Roost -> Feeding the Younglings",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Chimaera's Eye",
            ID = "61517",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[13].Quests.Alliance[10] = {
    Title = "10. Why Not Both?",
    Level = "50",
    Attain = "40",
    Aim = "Obtain the Heart of Landslide from the depths of Maraudon, and the Essence of Corrosis from Hateforge Quarry for Frig Thunderforge at Aerie Peak",
    Location = "Frig Thunderforge (Hinterlands - Aerie Peak; "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Landslide is at "..yellow.."[8]"..white..".",
    Prequest = "Proving A Point -> I've Read It In A Book Once",
    Folgequest = "Thunderforge Mastery",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Thunderforge Lance",
            ID = "40080",
            Color = blue,
            Description = AQITEM_POLEARM,
        },
    }
}
kQuestInstanceData[13].Quests.Alliance[11] = {
    Title = "11. Preparation",
    Level = "48",
    Attain = "34",
    Aim = "Obtain a slab of Landslide's body from Maraudon and bring it to Thegren near the Ruins of Corthan in the Badlands.",
    Location = "Thegren <Artisan Gemologist> (Badlands - Ruins of Corthan; "..yellow.."[29, 27]"..white..").",
    Note = red.."Jewelcrafting only."..white.." Quest line for Gemologist specialization.\nLandslide is at "..yellow.."[8]"..white..".",
    Prequest = "Mastering Gemology -> The Lifeblood -> Demonstration",
    Folgequest = "The Final Cut",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[13].Quests.Horde[1] = {
    Title = "1. Shadowshard Fragments",
    Level = "42",
    Attain = "38",
    Aim = "Collect 10 Shadowshard Fragments from Maraudon and return them to Uthel'nay in Orgrimmar",
    Location = "Uthel'nay (Orgrimmar - Valley of Spirits; "..yellow.."39,86"..white..")",
    Note = "You get the Shadowshard Fragments from 'Shadowshard Rumbler' or 'Shadowshard Smasher' outside the instance on the Purple side.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = kQuestInstanceData[13].Quests.Alliance[1].Rewards
}
kQuestInstanceData[13].Quests.Horde[2] = {
    Title = "2. Vyletongue Corruption",
    Level = "47",
    Attain = "41",
    Aim = "Fill the Coated Cerulean Vial at the orange crystal pool in Maraudon.\nUse the Filled Cerulean Vial on the Vylestem Vines to force the corrupted Noxxious Scion to emerge.\nHeal 8 plants by killing these Noxxious Scion, then return to Vark Battlescar in Shadowprey Village.",
    Location = "Vark Battlescar (Desolace - Shadowprey Village; "..yellow.."23,70"..white..")",
    Note = "You can fill the Vial at any pool outside the instance on the Orange side. The plants are in the orange and purple areas inside the instance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = kQuestInstanceData[13].Quests.Alliance[2].Rewards
}
kQuestInstanceData[13].Quests.Horde[3] = kQuestInstanceData[13].Quests.Alliance[3]
kQuestInstanceData[13].Quests.Horde[4] = kQuestInstanceData[13].Quests.Alliance[4]
kQuestInstanceData[13].Quests.Horde[5] = kQuestInstanceData[13].Quests.Alliance[5]
kQuestInstanceData[13].Quests.Horde[6] = kQuestInstanceData[13].Quests.Alliance[6]
kQuestInstanceData[13].Quests.Horde[7] = {
    Title = "7. Corruption of Earth and Seed",
    Level = "51",
    Attain = "45",
    Aim = "Slay Princess Theradras and return to Selendra near Shadowprey Village in Desolace.",
    Location = "Selendra (Desolace; "..yellow.."27,77"..white..")",
    Note = "You find Princess Theradras at "..yellow.."[11]"..white..".",
    Prequest = "No",
    Folgequest = "Seed of Life",
    Rewards = kQuestInstanceData[13].Quests.Alliance[7].Rewards
}
kQuestInstanceData[13].Quests.Horde[8] = kQuestInstanceData[13].Quests.Alliance[8]
kQuestInstanceData[13].Quests.Horde[9] = {
    Title = "11. Preparation",
    Level = "48",
    Attain = "34",
    Aim = "Obtain a slab of Landslide's body from Maraudon and bring it to Thegren near the Ruins of Corthan in the Badlands.",
    Location = "Thegren <Artisan Gemologist> (Badlands - Ruins of Corthan; "..yellow.."[29, 27]"..white..").",
    Note = red.."Jewelcrafting only."..white.." Quest line for Gemologist specialization.\nLandslide is at "..yellow.."[8]"..white..".",
    Prequest = "Mastering Gemology -> The Lifeblood -> Demonstration",
    Folgequest = "The Final Cut",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST14 - Molten Core ---------------
kQuestInstanceData[14] = {
    Story = "The Molten Core lies at the very bottom of Blackrock Depths. It is the heart of Blackrock Mountain and the exact spot where, long ago in a desperate bid to turn the tide of the dwarven civil war, Emperor Thaurissan summoned the elemental Firelord, Ragnaros, into the world. Though the fire lord is incapable of straying far from the blazing Core, it is believed that his elemental minions command the Dark Iron dwarves, who are in the midst of creating armies out of living stone. The burning lake where Ragnaros lies sleeping acts as a rift connecting to the plane of fire, allowing the malicious elementals to pass through. Chief among Ragnaros' agents is Majordomo Executus - for this cunning elemental is the only one capable of calling the Firelord from his slumber.",
    Caption = "Molten Core",
    QAA = "7 Quests",
    QAH = "7 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[14].Quests.Alliance[1] = {
    Title = "1. The Molten Core",
    Level = "60",
    Attain = "57",
    Aim = "Kill 1 Fire Lord, 1 Molten Giant, 1 Ancient Core Hound and 1 Lava Surger, then return to Duke Hydraxis in Azshara.",
    Location = "Duke Hydraxis (Azshara; "..yellow.."79,73"..white..")",
    Note = "These are non-bosses inside Molten Core.",
    Prequest = "Eye of the Emberseer ("..yellow.."Upper Blackrock Spire"..white..")", -- 6821",
    Folgequest = "Agent of Hydraxis",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[14].Quests.Alliance[2] = {
    Title = "2. Hands of the Enemy",
    Level = "60",
    Attain = "60",
    Aim = "Bring the Hands of Lucifron, Sulfuron, Gehennas and Shazzrah to Duke Hydraxis in Azshara.",
    Location = "Duke Hydraxis (Azshara; "..yellow.."79,73"..white..")",
    Note = "Lucifron is at "..yellow.."[1]"..white..", Sulfuron is at "..yellow.."[8]"..white..", Gehennas is at "..yellow.."[3]"..white.." and Shazzrah is at "..yellow.."[5]"..white..".",
    Prequest = "Agent of Hydraxis",
    Folgequest = "A Hero's Reward",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[14].Quests.Alliance[3] = {
    Title = "3. Thunderaan the Windseeker",
    Level = "60",
    Attain = "60",
    Aim = "To free Thunderaan the Windseeker from his prison, you must present the right and left halves of the Bindings of the Windseeker, 10 bars of Elementium, and the Essence of the Firelord to Highlord Demitrian in Silithus.",
    Location = "Highlord Demitrian (Silithus; "..yellow.."22,9"..white..")",
    Note = "Part of the Thunderfury, Blessed Blade of the Windseeker questline. It starts after obtaining either the left or right Bindings of the Windseeker from Garr at "..yellow.."[4]"..white.." or Baron Geddon at "..yellow.."[6]"..white..". Then talk to Highlord Demitrian to start the questline. Essence of the Firelord drops from Ragnaros at "..yellow.."[10]"..white..". After turning this part in, Prince Thunderaan is summoned and you must kill him. He's a 40-man raid boss.",
    Prequest = "Examine the Vessel",
    Folgequest = "Rise, Thunderfury!",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[14].Quests.Alliance[4] = {
    Title = "4. A Binding Contract",
    Level = "60",
    Attain = "60",
    Aim = "Turn the Thorium Brotherhood Contract in to Lokhtos Darkbargainer if you would like to receive the plans for Sulfuron.",
    Location = "Lokhtos Darkbargainer (Blackrock Depths; "..yellow.."[15]"..white..")",
    Note = "You need a Sulfuron Ingot to get the contract from Lokhtos. They drop from Golemagg the Incinerator in Molten Core at "..yellow.."[7]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Plans: Sulfuron Hammer",
            ID = "18592",
            Color = purple,
            Description = AQITEM_PATTERN,
        },
    }
}
kQuestInstanceData[14].Quests.Alliance[5] = {
    Title = "5. The Ancient Leaf",
    Level = "60",
    Attain = "60",
    Aim = "Find the owner of the Ancient Petrified Leaf.",
    Location = "Ancient Petrified Leaf (drops from Cache of the Firelord; "..yellow.."[9]"..white..")",
    Note = "Turns in to Vartrus the Ancient at (Felwood - Irontree Woods; "..yellow.."49,24"..white..").",
    Prequest = "No",
    Folgequest = "Ancient Sinew Wrapped Lamina ("..yellow.."Azuregos"..white..")", -- 7634",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[14].Quests.Alliance[6] = {
    Title = "6. The Only Prescription",
    Level = "60",
    Attain = "60",
    Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. ",
    Location = "Narain Soothfancy (Tanaris; "..yellow.."65,18"..white..")",
    Note = "Only one person can loot the Chapter. Draconic for Dummies VIII (drops from Ragnaros; "..yellow.."[10]"..white..")",
    Prequest = "Decoy!",
    Folgequest = "The Good News and The Bad News (Must complete Stewvul, Ex-B.F.F. and Never Ask Me About My Business quest chains)",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Gnomish Turban of Psychic Might",
            ID = "21517",
            Color = purple,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[14].Quests.Alliance[7] = {
    Title = "7. Scrying Goggles? No Problem!",
    Level = "60",
    Attain = "60",
    Aim = "Find Narain's Scrying Goggles and return them to Narain Soothfancy in Tanaris.",
    Location = "Narain Soothfancy (Tanaris; "..yellow.."65,18"..white..")",
    Note = "Drops from boss in Molten Core.",
    Prequest = "Stewvul, Ex-B.F.F.",
    Folgequest = "The Good News and The Bad News (Must complete Draconic for Dummies and Never Ask Me About My Business quest chains)",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1(x3)",
        {
            Name = "Major Rejuvenation Potion",
            ID = "18253",
            Color = white,
            Description = AQITEM_POTION,
        },
    }
}
kQuestInstanceData[14].Quests.Horde[1] = kQuestInstanceData[14].Quests.Alliance[1]
kQuestInstanceData[14].Quests.Horde[2] = kQuestInstanceData[14].Quests.Alliance[2]
kQuestInstanceData[14].Quests.Horde[3] = kQuestInstanceData[14].Quests.Alliance[3]
kQuestInstanceData[14].Quests.Horde[4] = kQuestInstanceData[14].Quests.Alliance[4]
kQuestInstanceData[14].Quests.Horde[5] = kQuestInstanceData[14].Quests.Alliance[5]
kQuestInstanceData[14].Quests.Horde[6] = kQuestInstanceData[14].Quests.Alliance[6]
kQuestInstanceData[14].Quests.Horde[7] = kQuestInstanceData[14].Quests.Alliance[7]

--------------- INST15 - Naxxramas ---------------
kQuestInstanceData[15] = {
    Story = "Floating above the Plaguelands, the necropolis known as Naxxramas serves as the seat of one of the Lich King's most powerful officers, the dreaded lich Kel'Thuzad. Horrors of the past and new terrors yet to be unleashed are gathering inside the necropolis as the Lich King's servants prepare their assault. Soon the Scourge will march again...",
    Caption = "Naxxramas",
    QAA = "5 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[15].Quests.Alliance[1] = {
    Title = "1. The Fall of Kel'Thuzad",
    Level = "60",
    Attain = "60",
    Aim = "Take the Phylactery of Kel'Thuzad to Light's Hope Chapel in the Eastern Plaguelands.",
    Location = "Kel'Thuzad (Naxxramas; "..yellow.."green 2"..white..")",
    Note = "Father Inigo Montoy (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,58"..white..")",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Mark of the Champion",
            ID = "23206",
            Color = purple,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Mark of the Champion",
            ID = "23207",
            Color = purple,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[15].Quests.Alliance[2] = {
    Title = "2. The Only Song I Know...",
    Level = "60",
    Attain = "60",
    Aim = "Craftsman Wilhelm at Light's Hope Chapel in the Eastern Plaguelands wants you to bring him 2 Frozen Runes, 2 Essence of Water, 2 Blue Sapphires and 30 gold pieces.",
    Location = "Craftsman Wilhelm (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,60"..white..")",
    Note = "Frozen Runes come from Unholy Axes in Naxxramas.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Glacial Leggings",
            ID = "22700",
            Color = purple,
            Description = AQITEM_LEGS..AQITEM_CLOTH,
        },
        {
            Name = "Icebane Leggings",
            ID = "22699",
            Color = purple,
            Description = AQITEM_LEGS..AQITEM_PLATE,
        },
        {
            Name = "Icy Scale Leggings",
            ID = "22702",
            Color = purple,
            Description = AQITEM_LEGS..AQITEM_MAIL,
        },
        {
            Name = "Polar Leggings",
            ID = "22701",
            Color = purple,
            Description = AQITEM_LEGS..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[15].Quests.Alliance[3] = {
    Title = "3. Echoes of War",
    Level = "60",
    Attain = "60",
    Aim = "Commander Eligor Dawnbringer at Light's Hope Chapel in the Eastern Plaguelands wants you to slay 5 Living Monstrosities, 5 Stoneskin Gargoyles, 8 Deathknight Captains and 3 Venom Stalkers.",
    Location = "Commander Eligor Dawnbringer (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."82,58"..white..")",
    Note = "The mobs for this quest are trash mobs at the beginning of each wing of Naxxramas. This quest is a pre-requisite for the Tier 3 armor quests.",
    Prequest = "The Dread Citadel - Naxxramas",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[15].Quests.Alliance[4] = {
    Title = "4. The Fate of Ramaladni",
    Level = "60",
    Attain = "60",
    Aim = "Enter Naxxramas and uncover the Fate of Ramaladni.",
    Location = "Korfax, Champion of the Light (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."82,58"..white..")",
    Note = "A ring for this quest will drop off a random mob in Naxxramas. Everyone who has the quest can pick it up.",
    Prequest = "No",
    Folgequest = "Ramaladni's Icy Grasp",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[15].Quests.Alliance[5] = {
    Title = "5. Ramaladni's Icy Grasp",
    Level = "60",
    Attain = "60",
    Aim = "Korfax at Light's Hope Chapel in the Eastern Plaguelands wants you to bring him 1 Frozen Rune, 1 Blue Sapphire and 1 Arcanite Bar.",
    Location = "Korfax, Champion of the Light (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."82,58"..white..")",
    Note = "Frozen Runes come from Unholy Axes in Naxxramas.",
    Prequest = "The Fate of Ramaladni",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Ramaladni's Icy Grasp",
            ID = "22707",
            Color = purple,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[15].Quests.Horde[1] = kQuestInstanceData[15].Quests.Alliance[1]
kQuestInstanceData[15].Quests.Horde[2] = kQuestInstanceData[15].Quests.Alliance[2]
kQuestInstanceData[15].Quests.Horde[3] = kQuestInstanceData[15].Quests.Alliance[3]
kQuestInstanceData[15].Quests.Horde[4] = kQuestInstanceData[15].Quests.Alliance[4]
kQuestInstanceData[15].Quests.Horde[5] = kQuestInstanceData[15].Quests.Alliance[5]

--------------- INST16 - Onyxias Lair ---------------
kQuestInstanceData[16] = {
    Story = "Onyxia is the daughter of the mighty dragon Deathwing, and sister of the scheming Nefarion Lord of Blackrock Spire. It is said that Onyxia delights in corrupting the mortal races by meddling in their political affairs. To this end it is believed that she takes on various humanoid forms and uses her charm and power to influence delicate matters between the different races. Some believe that Onyxia has even assumed an alias once used by her father - the title of the royal House Prestor. When not meddling in mortal concerns, Onyxia resides in a fiery cave below the Dragonmurk, a dismal swamp located within Dustwallow Marsh. There she is guarded by her kin, the remaining members of the insidious Black Dragon Flight.",
    Caption = "Onyxias Lair",
    QAA = "3 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[16].Quests.Alliance[1] = {
    Title = "1. The Forging of Quel'Serrar",
    Level = "60",
    Attain = "60",
    Aim = "You must get Onyxia to breathe fire on the Unfired Ancient Blade. Once this is done, pick up the now Heated Ancient Blade. Be warned, a Heated Ancient Blade will not remain heated forever - time is of the essence.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white..")",
    Note = "Drop the Sword in front of Onyxia when she's at 10% to 15% health. She'll have to breathe on and heat it. When Onyxia dies, pick the sword back up, click her corpse and use the sword. Then you're ready to turn in the quest.",
    Prequest = "Foror's Compendium ("..yellow.."Dire Maul West"..white..") -> The Forging of Quel'Serrar", -- 7507 -> 7508",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Quel'Serrar",
            ID = "18348",
            Color = purple,
            Description = AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[16].Quests.Alliance[2] = {
    Title = "2. Victory for the Alliance",
    Level = "60",
    Attain = "60",
    Aim = "Take the Head of Onyxia to Highlord Bolvar Fordragon in Stormwind.",
    Location = "Head of Onyxia (drops from Onyxia; "..yellow.."[3]"..white..")",
    Note = "Highlord Bolvar Fordragon is at (Stormwind City - Stormwind Keep; "..yellow.."78,20"..white.."). Only one person in the raid can loot this item and the quest can only be done one time.\nRewards listed are for the followup.",
    Prequest = "No",
    Folgequest = "Celebrating Good Times",
    Rewards = {
        {
            Name = "Onyxia Blood Talisman",
            ID = "18406",
            Color = purple,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Dragonslayer's Signet",
            ID = "18403",
            Color = purple,
            Description = AQITEM_RING,
        },
        {
            Name = "Onyxia Tooth Pendant",
            ID = "18404",
            Color = purple,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[16].Quests.Alliance[3] = {
    Title = "3. The Only Prescription",
    Level = "60",
    Attain = "60",
    Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. ",
    Location = "Narain Soothfancy (Tanaris; "..yellow.."65,18"..white..")".."Draconic for Dummies (drops from Onyxia; "..yellow.."[3]"..white..")",
    Note = "Only one person can loot the Chapter. Draconic for Dummies VI (drops from Onyxia; "..yellow.."[3]"..white..")",
    Prequest = "Decoy!",
    Folgequest = "The Good News and The Bad News (Must complete Stewvul, Ex-B.F.F. and Never Ask Me About My Business quest chains)",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Gnomish Turban of Psychic Might",
            ID = "21517",
            Color = purple,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[16].Quests.Horde[1] = kQuestInstanceData[16].Quests.Alliance[1]
kQuestInstanceData[16].Quests.Horde[2] = {
    Title = "2. Victory for the Horde",
    Level = "60",
    Attain = "60",
    Aim = "Take the Head of Onyxia to Thrall in Orgrimmar.",
    Location = "Head of Onyxia (drops from Onyxia; "..yellow.."[3]"..white..")",
    Note = "Thrall is at (Orgrimmar - Valley of Wisdom; "..yellow.."31,37"..white.."). Only one person in the raid can loot this item and the quest can only be done one time.\nRewards listed are for the followup.",
    Prequest = "No",
    Folgequest = "For All To See",
    Rewards = kQuestInstanceData[16].Quests.Alliance[2].Rewards
}
kQuestInstanceData[16].Quests.Horde[3] = kQuestInstanceData[16].Quests.Alliance[3]

--------------- INST17 - Razorfen Downs ---------------
kQuestInstanceData[17] = {
    Story = "Crafted  from the same mighty vines as Razorfen Kraul, Razorfen Downs is the traditional capital city of the quillboar race. The sprawling, thorn-ridden labyrinth houses a veritable army of loyal quillboar as well as their high priests - the Death's Head tribe. Recently, however, a looming shadow has fallen over the crude den. Agents of the undead Scourge - led by the lich, Amnennar the Coldbringer - have taken control over the quillboar race and turned the maze of thorns into a bastion of undead might. Now the quillboar fight a desperate battle to reclaim their beloved city before Amnennar spreads his control across the Barrens.",
    Caption = "Razorfen Downs",
    QAA = "3 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[17].Quests.Alliance[1] = {
    Title = "1. A Host of Evil",
    Level = "35",
    Attain = "28",
    Aim = "Kill 8 Razorfen Battleguard, 8 Razorfen Thornweavers, and 8 Death's Head Cultists and return to Myriam Moonsinger near the entrance to Razorfen Downs.",
    Location = "Myriam Moonsinger (The Barrens; "..yellow.."49,94"..white..")",
    Note = "You can find the mobs and the quest giver in the area just before the instance entrance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[17].Quests.Alliance[2] = {
    Title = "2. Extinguishing the Idol",
    Level = "37",
    Attain = "32",
    Aim = "Escort Belnistrasz to the Quilboar's idol in Razorfen Downs. Protect Belnistrasz while he performs the ritual to shut down the idol.",
    Location = "Belnistrasz (Razorfen Downs; "..yellow.."[2]"..white..")",
    Note = "The prequest is just you agreeing to help him. Several mobs spawn and attack Belnistrasz as he attempts to shut down the idol. After completing the quest, you can turn the quest in at the brazier in front of the idol.",
    Prequest = "Scourge of the Downs",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Dragonclaw Ring",
            ID = "10710",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[17].Quests.Alliance[3] = {
    Title = "3. Bring the Light",
    Level = "42",
    Attain = "39",
    Aim = "Archbishop Bendictus wants you to slay Amnennar the Coldbringer in Razorfen Downs.",
    Location = "Archbishop Bendictus (Stormwind - Cathedral of Light; "..yellow.."39,27"..white..")",
    Note = "Amnennar the Coldbringer is the last boss in Razorfen Downs. You can find him at "..yellow.."[6]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Vanquisher's Sword",
            ID = "10823",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Amberglow Talisman",
            ID = "10824",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[17].Quests.Horde[1] = kQuestInstanceData[17].Quests.Alliance[1]
kQuestInstanceData[17].Quests.Horde[2] = {
    Title = "2. An Unholy Alliance",
    Level = "36",
    Attain = "28",
    Aim = "Bring Ambassador Malcin's Head to Varimathras in the Undercity.",
    Location = "Varimathras (Undercity - Royal Quarter; "..yellow.."56,92"..white..")",
    Note = "The preceding quest can be obtained from the last Boss in Razorfen Kraul. You find Malcin outside (The Barrens; "..yellow.."48,92"..white..").",
    Prequest = "An Unholy Alliance",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Skullbreaker",
            ID = "17039",
            Color = green,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
        {
            Name = "Nail Spitter",
            ID = "17042",
            Color = green,
            Description = AQITEM_GUN,
        },
        {
            Name = "Zealot's Robe",
            ID = "17043",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[17].Quests.Horde[3] = {
    Title = "3. Extinguishing the Idol",
    Level = "37",
    Attain = "32",
    Aim = "Escort Belnistrasz to the Quilboar's idol in Razorfen Downs. Protect Belnistrasz while he performs the ritual to shut down the idol.",
    Location = "Belnistrasz (Razorfen Downs; "..yellow.."[2]"..white..")",
    Note = "The prequest is just you agreeing to help him. Several mobs spawn and attack Belnistrasz as he attempts to shut down the idol. After completing the quest, you can turn the quest in at the brazier in front of the idol.",
    Prequest = "Scourge of the Downs",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Dragonclaw Ring",
            ID = "10710",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[17].Quests.Horde[4] = {
    Title = "4. Bring the End",
    Level = "42",
    Attain = "37",
    Aim = "Andrew Brownell wants you to kill Amnennar the Coldbringer and return his skull.",
    Location = "Andrew Brownell (Undercity - The Magic Quarter; "..yellow.."72,32"..white..")",
    Note = "Amnennar the Coldbringer is the last Boss at Razorfen Downs. You can find him at "..yellow.."[6]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Vanquisher's Sword",
            ID = "10823",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Amberglow Talisman",
            ID = "10824",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[17].Quests.Horde[5] = {
    Title = "5. The Powers Beyond",
    Level = "44",
    Attain = "38",
    Aim = "Venture into Razorfen Downs, slay Amnennar the Coldbringer "..yellow.."[6]"..white.." and retrieve his phylactery for Dark Bishop Mordren at Stillward Church in Gilneas.",
    Location = "Dark Bishop Mordren (Gilneas - Stillward Church "..yellow.."57.7,39.6"..white..")",
    Note = "Quest line starts with quest 'Through Greater Magic' at Dark Bishop Mordren.\nAmnennar the Coldbringer "..yellow.."[6]"..white.." drops Obsidian Phylactery.\nYou will get the reward finishing the last quest in the chain.",
    Prequest = "Through Greater Magic -> The Ravenwood Scepter",
    Folgequest = "The Greymane Stone "..yellow.."[Gilneas City]"..white.."-> Gift of the Dark Bishop", -- 40996, 40997",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Garalon's Might",
            ID = "61660",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_SWORD,
        },
        {
            Name = "Varimathras' Cunning",
            ID = "61661",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_STAFF,
        },
        {
            Name = "Stillward Amulet",
            ID = "61662",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}

--------------- INST18 - Razorfen Kraul ---------------
kQuestInstanceData[18] = {
    Story = "Ten thousand years ago - during the War of the Ancients, the mighty demigod, Agamaggan, came forth to battle the Burning Legion. Though the colossal boar fell in combat, his actions helped save Azeroth from ruin. Yet over time, in the areas where his blood fell, massive thorn-ridden vines sprouted from the earth. The quillboar - believed to be the mortal offspring of the mighty god, came to occupy these regions and hold them sacred. The heart of these thorn-colonies was known as the Razorfen. The great mass of Razorfen Kraul was conquered by the old crone, Charlga Razorflank. Under her rule, the shamanistic quillboar stage attacks on rival tribes as well as Horde villages. Some speculate that Charlga has even been negotiating with agents of the Scourge - aligning her unsuspecting tribe with the ranks of the Undead for some insidious purpose.",
    Caption = "Razorfen Kraul",
    QAA = "5 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[18].Quests.Alliance[1] = {
    Title = "1. Blueleaf Tubers",
    Level = "26",
    Attain = "20",
    Aim = "In Razorfen Kraul, use the Crate with Holes to summon a Snufflenose Gopher, and use the Command Stick on the gopher to make it search for Tubers. Bring 6 Blueleaf Tubers, the Snufflenose Command Stick and the Crate with Holes to Mebok Mizzyrix in Ratchet.",
    Location = "Mebok Mizzyrix (The Barrens - Ratchet; "..yellow.."62,37"..white..")",
    Note = "The Crate, the Stick and the Manual can all be found near Mebok Mizzyrix.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "A Small Container of Gems",
            ID = "6755",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[18].Quests.Alliance[2] = {
    Title = "2. Mortality Wanes",
    Level = "30",
    Attain = "25",
    Aim = "Find and return Treshala's Pendant to Treshala Fallowbrook in Darnassus.",
    Location = "Heraltha Fallowbrook (Razorfen Kraul; "..yellow.."[8]"..white..")",
    Note = "The pendant is a random drop. You musst bring back the pendant to Treshala Fallowbrook in Darnassus - Tradesmen Terrace ("..yellow.."69,67"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Mourning Shawl",
            ID = "6751",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Lancer Boots",
            ID = "6752",
            Color = green,
            Description = AQITEM_FEET..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[18].Quests.Alliance[3] = {
    Title = "3. Willix the Importer",
    Level = "30",
    Attain = "23",
    Aim = "Escort Willix the Importer out of Razorfen Kraul.",
    Location = "Willix the Importer (Razorfen Kraul; "..yellow.."[8]"..white..")",
    Note = "Willix the Importer must be escorted to the entrance of the instance. The quest is turned in to him when completed.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Monkey Ring",
            ID = "6748",
            Color = green,
            Description = AQITEM_RING,
        },
        {
            Name = "Snake Hoop",
            ID = "6750",
            Color = green,
            Description = AQITEM_RING,
        },
        {
            Name = "Tiger Band",
            ID = "6749",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[18].Quests.Alliance[4] = {
    Title = "4. The Crone of the Kraul",
    Level = "34",
    Attain = "29",
    Aim = "Bring Razorflank's Medallion to Falfindel Waywarder in Thalanaar.",
    Location = "Falfindel Waywarder (Feralas - Thalanaar; "..yellow.."89,46"..white..")",
    Note = "Charlga Razorflank "..yellow.."[7]"..white.." drops the Medallion required for this quest.",
    Prequest = "Lonebrow's Journal",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Berylline Pads",
            ID = "4197",
            Color = blue,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
        {
            Name = "Stonefist Girdle",
            ID = "6742",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_MAIL,
        },
        {
            Name = "Marbled Buckler",
            ID = "6725",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
    }
}
kQuestInstanceData[18].Quests.Alliance[5] = {
    Title = "5. Fire Hardened Mail",
    Level = "28",
    Attain = "20",
    Aim = "Gather the materials Furen Longbeard requires, and bring them to him in Stormwind.",
    Location = "Furen Longbeard (Stormwind - Dwarven District; "..yellow.."57,16"..white..")",
    Note = red.."Warrior only"..white..": You get the Vial of Phlogiston from Roogug at "..yellow.."[1]"..white..".\nThe followup quest is different for each race. Burning Blood for Humans, Iron Coral for Dwarves and Gnomes and Sunscorched Shells for Night Elves.", -- 1705, 1710, 1708",
    Prequest = "The Shieldsmith",
    Folgequest = "(See Note)",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[18].Quests.Horde[1] = kQuestInstanceData[18].Quests.Alliance[1]
kQuestInstanceData[18].Quests.Horde[2] = {
    Title = "2. Willix the Importer",
    Level = "30",
    Attain = "23",
    Aim = "Escort Willix the Importer out of Razorfen Kraul.",
    Location = "Willix the Importer (Razorfen Kraul; "..yellow.."[8]"..white..")",
    Note = "Willix the Importer must be escorted to the entrance of the instance. The quest is turned in to him when completed.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Monkey Ring",
            ID = "6748",
            Color = green,
            Description = AQITEM_RING,
        },
        {
            Name = "Snake Hoop",
            ID = "6750",
            Color = green,
            Description = AQITEM_RING,
        },
        {
            Name = "Tiger Band",
            ID = "6749",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[18].Quests.Horde[3] = {
    Title = "3. Going, Going, Guano!",
    Level = "33",
    Attain = "30",
    Aim = "Bring 1 pile of Kraul Guano to Master Apothecary Faranell in the Undercity.",
    Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..yellow.."48,69 "..white..")",
    Note = "Kraul Guano is dropped by any of the bats found within the instance.",
    Prequest = "No",
    Folgequest = "Hearts of Zeal ("..yellow.."[Scarlet Monastery]"..white..")", -- 1113",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[18].Quests.Horde[4] = {
    Title = "4. A Vengeful Fate",
    Level = "34",
    Attain = "29",
    Aim = "Bring Razorflank's Heart to Auld Stonespire in Thunder Bluff.",
    Location = "Auld Stonespire (Thunderbluff; "..yellow.."36,59"..white..")",
    Note = "You can find Charlga Razorflank at "..yellow.."[7]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Berylline Pads",
            ID = "4197",
            Color = blue,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
        {
            Name = "Stonefist Girdle",
            ID = "6742",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_MAIL,
        },
        {
            Name = "Marbled Buckler",
            ID = "6725",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
    }
}
kQuestInstanceData[18].Quests.Horde[5] = {
    Title = "5. Brutal Armor",
    Level = "30",
    Attain = "20",
    Aim = "Bring to Thun'grim Firegaze 15 Smoky Iron Ingots, 10 Powdered Azurite, 10 Iron Bars and a Vial of Phlogiston.",
    Location = "Thun'grim Firegaze (The Barrens; "..yellow.."57,30"..white..")",
    Note = red.."Warrior only"..white..": You get the Vial of Phlogiston from Roogug at "..yellow.."[1]"..white..".\n\nCompleting this quest allows you to start four new quests from the same NPC.",
    Prequest = "Speak with Thun'grim",
    Folgequest = "(See Note)",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST19 - SM: Library ---------------
kQuestInstanceData[19] = {
    Story = "The Monastery was once a proud bastion of Lordaeron's priesthood - a center for learning and enlightenment. With the rise of the undead Scourge during the Third War, the peaceful Monastery was converted into a stronghold of the fanatical Scarlet Crusade. The Crusaders are intolerant of all non-human races, regardless of alliance or affiliation. They believe that any and all outsiders are potential carriers of the undead plague - and must be destroyed. Reports indicate that adventurers who enter the monastery are forced to contend with Scarlet Commander Mograine - who commands a large garrison of fanatically devoted warriors. However, the monastery's true master is High Inquisitor Whitemane - a fearsome priestess who possesses the ability to resurrect fallen warriors to do battle in her name.",
    Caption = "SM: Library",
    QAA = "3 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[19].Quests.Alliance[1] = {
    Title = "1. In the Name of the Light",
    Level = "40",
    Attain = "34",
    Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore.",
    Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; "..yellow.."51,58"..white..")",
    Note = "This quest line starts at Brother Crowley with quest 'Brother Anton' in Stormwind - Cathedral of Light ("..yellow.."42,24"..white..").\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..yellow.."SM: Cathedral [2]"..white..", Herod at "..yellow.."SM: Armory [1]"..white.." and Houndmaster Loksey at "..yellow.."SM: Library [1]"..white..".",
    Prequest = "Brother Anton -> Down the Scarlet Path",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Sword of Serenity",
            ID = "6829",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Bonebiter",
            ID = "6830",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_AXE,
        },
        {
            Name = "Black Menace",
            ID = "6831",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
        {
            Name = "Orb of Lorica",
            ID = "11262",
            Color = blue,
            Description = AQITEM_OFFHAND,
        },
    }
}
kQuestInstanceData[19].Quests.Alliance[2] = {
    Title = "2. Mythology of the Titans",
    Level = "38",
    Attain = "28",
    Aim = "Retrieve Mythology of the Titans from the Monastery and bring it to Librarian Mae Paledust in Ironforge.",
    Location = "Librarian Mae Paledust (Ironforge - Hall of Explorers; "..yellow.."74,12"..white..")",
    Note = "The book is on the floor on the left side of one of the corridors leading to Arcanist Doan ("..yellow.."[2]"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Explorers' League Commendation",
            ID = "7746",
            Color = green,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[19].Quests.Alliance[3] = {
    Title = "3. Rituals of Power",
    Level = "40",
    Attain = "30",
    Aim = "Bring the book Rituals of Power to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; "..yellow.."43,57"..white..")",
    Note = red.."Mage only"..white..": You can find the book in the last corridor leading to Arcanist Doan ("..yellow.."[2]"..white..").",
    Prequest = "Get the Scoop",
    Folgequest = "Mage's Wand",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[19].Quests.Horde[1] = {
    Title = "1. Hearts of Zeal",
    Level = "33",
    Attain = "30",
    Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal.",
    Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..yellow.."48,69"..white..")",
    Note = "All mobs in the Scarlet Monastery drop Hearts of Zeal.",
    Prequest = "Going, Going, Guano! ("..yellow.."[Razorfen Kraul]"..white..")", -- 1109",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[19].Quests.Horde[2] = {
    Title = "2. Into The Scarlet Monastery",
    Level = "42",
    Attain = "33",
    Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Varimathras in the Undercity.",
    Location = "Varimathras (Undercity - Royal Quarter; "..yellow.."56,92"..white..")",
    Note = "You can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..yellow.."SM: Cathedral [2]"..white..", Herod at "..yellow.."SM: Armory [1]"..white.." and Houndmaster Loksey at "..yellow.."SM: Library [1]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Sword of Omen",
            ID = "6802",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Prophetic Cane",
            ID = "6803",
            Color = blue,
            Description = AQITEM_OFFHAND,
        },
        {
            Name = "Dragon's Blood Necklace",
            ID = "10711",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[19].Quests.Horde[3] = {
    Title = "3. Compendium of the Fallen",
    Level = "38",
    Attain = "28",
    Aim = "Retrieve the Compendium of the Fallen from the Monastery in Tirisfal Glades and return to Sage Truthseeker in Thunder Bluff.",
    Location = "Sage Truthseeker (Thunderbluff; "..yellow.."34,47"..white..")",
    Note = "You can find the book in the Library section of the Scarlet Monastery.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Vile Protector",
            ID = "7747",
            Color = green,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Forcestone Buckler",
            ID = "17508",
            Color = green,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Omega Orb",
            ID = "7749",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
    }
}
kQuestInstanceData[19].Quests.Horde[4] = {
    Title = "4. Test of Lore",
    Level = "36",
    Attain = "25",
    Aim = "Find The Beginnings of the Undead Threat, and return it to Parqual Fintallas in Undercity.",
    Location = "Parqual Fintallas (Undercity - The Apothecarium; "..yellow.."57,65"..white..")",
    Note = "Questline starts at Dorn Plainstalker with quest 'Test of Faith'  (Thousand Needles; "..yellow.."53,41"..white.."). You can find the book in the Library of Scarlet Monastary.",
    Prequest = "Test of Faith - > Test of Lore",
    Folgequest = "Test of Lore",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[19].Quests.Horde[5] = {
    Title = "5. Rituals of Power",
    Level = "40",
    Attain = "30",
    Aim = "Bring the book Rituals of Power to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; "..yellow.."43,57"..white..")",
    Note = red.."Mage only"..white..": You can find the book in the last corridor leading to Arcanist Doan ("..yellow.."[2]"..white..").",
    Prequest = "Get the Scoop",
    Folgequest = "Mage's Wand",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST20 - SM: Armory ---------------
kQuestInstanceData[20] = {
    Story = kQuestInstanceData[19].Story,
    Caption = "SM: Armory",
    QAA = "1 Quest",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[20].Quests.Alliance[1] = kQuestInstanceData[19].Quests.Alliance[1]
kQuestInstanceData[20].Quests.Horde[1] = kQuestInstanceData[19].Quests.Horde[1]
kQuestInstanceData[20].Quests.Horde[2] = kQuestInstanceData[19].Quests.Horde[2]
kQuestInstanceData[20].Quests.Horde[3] = {
    Title = "3. Reminiscent of Steel",
    Level = "39",
    Attain = "33",
    Aim = "Slay Armory Quartermaster Daghelm and return Basil's journal to him in Undercity.",
    Location = "Basil Frye (Undercity "..yellow.."60, 29"..white..")",
    Note = "Drop from Armory Quartermaster Daghelm [2].",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Solid Sharpening Stone",
            ID = "7964",
            Color = white,
            Description = AQITEM_ENCHANT,
        },
        {
            Name = "Solid Weightstone",
            ID = "7965",
            Color = white,
            Description = AQITEM_ENCHANT,
        },
    }
}

--------------- INST21 - SM: Cathedral ---------------
kQuestInstanceData[21] = {
    Story = kQuestInstanceData[19].Story,
    Caption = "SM: Cathedral",
    QAA = "3 Quest",
    QAH = "2 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[21].Quests.Alliance[1] = kQuestInstanceData[19].Quests.Alliance[1]
kQuestInstanceData[21].Quests.Alliance[2] = {
    Title = "The Orb of Kaladus",
    Level = "38",
    Attain = "30",
    Aim = "Venture within the Scarlet Monastery and find the Orb of Kaladus, retrieve it, and return to Watch Paladin Janathos at Sorrowguard Keep.",
    Location = "Watch Paladin Janathos (Swamp of Sorrows - Sorrowguard Keep; "..yellow.."2,51"..white..")",
    Note = "Aged Wooden Chest contain the item. You can find Orb of Kaladus inside the second chamber, left from "..yellow.."[2]"..white..".",
    Prequest = "Tales of the Past -> The Forgotten Tome -> Returning to Janathos",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Truthkeeper Mantle",
            ID = "60316",
            Color = blue,
            Description = AQITEM_SHOULDER..AQITEM_PLATE,
        },
        {
            Name = "Lightgraced Mallet",
            ID = "60317",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
        {
            Name = "Sorrowguard Clutch",
            ID = "60318",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[21].Quests.Alliance[3] = {
    Title = "3. Scarlet Corruption",
    Level = "44",
    Attain = "35",
    Aim = "Discover the truth about the fate of High Inquisitor Fairbanks "..yellow.."[1]"..white.." for Brother Elias at Shademore Tavern in Gilneas. Slain High Inquisitor Fairbanks",
    Location = "Brother Elias <Scarlet Crusade Emissary> (Gilneas - Ruins of Greyshire - Shademore Tavern "..yellow.."[33.6,54.1]"..white..", 2nd floor.)",
    Note = "Allies Against Undeath start at same NPC.",
    Prequest = "Allies Against Undeath",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Ring of Holy Sacrement",
            ID = "61478",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[21].Quests.Horde[1] = kQuestInstanceData[19].Quests.Horde[1]
kQuestInstanceData[21].Quests.Horde[2] = kQuestInstanceData[19].Quests.Horde[2]

--------------- INST22 - SM: Graveyard ---------------
kQuestInstanceData[22] = {
    Story = kQuestInstanceData[19].Story,
    Caption = "SM: Graveyard",
    QAA = "No Quest",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[22].Quests.Horde[1] = kQuestInstanceData[19].Quests.Horde[1]
kQuestInstanceData[22].Quests.Horde[2] = {
    Title = "2. Vorrel's Revenge",
    Level = "33",
    Attain = "25",
    Aim = "Return Vorrel Sengutz's wedding ring to Monika Sengutz in Tarren Mill.",
    Location = "Vorrel Sengutz (Scarlet Monastery - Graveyard; "..yellow.."[1]"..white..")",
    Note = "You can find Vorrel Sengutz at the beginning of the Graveyard section of the Scarlet Monastery. Nancy Vishas, who drops the ring needed for this quest, can be found in a house in the Alterac Mountains ("..yellow.."31,32"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Vorrel's Boots",
            ID = "7751",
            Color = green,
            Description = AQITEM_FEET..AQITEM_LEATHER,
        },
        {
            Name = "Mantle of Woe",
            ID = "7750",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
        {
            Name = "Grimsteel Cape",
            ID = "4643",
            Color = green,
            Description = AQITEM_BACK,
        },
    }
}
kQuestInstanceData[22].Quests.Horde[3] = {
    Title = "3. Paint the Roses Red",
    Level = "29",
    Attain = "27",
    Aim = "Eliminate the Scarlet forces outside the Scarlet Monastery, then return to Deathguard Burgess in Brill.\nScarlet Scout slain (5)\nScarlet Preserver slain (5)\nScarlet Sentry slain (10)",
    Location = "Deathguard Burgess (Tirisfal Glades - Brill; "..yellow.."61,52"..white..")",
    Note = "You can finish this quest outside.\nQuestline starts at Innkeeper Norman <Innkeeper> in Undercity with quest 'Scarlet with Rage'.",
    Prequest = "Scarlet with Rage",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Nathrezim Wedge",
            ID = "51832",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_AXE,
        },
        {
            Name = "Femur Staff",
            ID = "51833",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_STAFF,
        },
        {
            Name = "Scarlet Pillar",
            ID = "51834",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
    }
}

--------------- INST23 - Scholomance ---------------
kQuestInstanceData[23] = {
    Story = "The Scholomance is housed within a series of crypts that lie beneath the ruined keep of Caer Darrow. Once owned by the noble Barov family, Caer Darrow fell to ruin following the Second War. As the wizard Kel'thuzad enlisted followers for his Cult of the Damned he would often promise immortality in exchange for serving his Lich King. The Barov family fell to Kel'thuzad's charismatic influence and donated the keep and its crypts to the Scourge. The cultists then killed the Barovs and turned the ancient crypts into a school for necromancy known as the Scholomance. Though Kel'thuzad no longer resides in the crypts, devoted cultists and instructors still remain. The powerful lich, Ras Frostwhisper, rules over the site and guards it in the Scourge's name - while the mortal necromancer, Darkmaster Gandling, serves as the school's insidious headmaster.",
    Caption = "Scholomance",
    QAA = "12 Quests",
    QAH = "12 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[23].Quests.Alliance[1] = {
    Title = "1. Plagued Hatchlings",
    Level = "58",
    Attain = "55",
    Aim = "Kill 20 Plagued Hatchlings, then return to Betina Bigglezink at the Light's Hope Chapel.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,59"..white..")",
    Note = "The Plagued Hatchlings are on the way to Rattlegore in a large room.",
    Prequest = "No",
    Folgequest = "Healthy Dragon Scale",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[2] = {
    Title = "2. Healthy Dragon Scale",
    Level = "58",
    Attain = "55",
    Aim = "Bring the Healthy Dragon Scale to Betina Bigglezink at the Light's Hope Chapel in Eastern Plaguelands.",
    Location = "Healthy Dragon Scale (random drop in Scholomance)",
    Note = "Plagued Hatchlings drop the Healthy Dragon Scales (8% chance to drop). You can find Betina Bigglezink at Eastern Plaguelands - Light's Hope Chapel ("..yellow.."81,59"..white..").",
    Prequest = "Plagued Hatchlings",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[3] = {
    Title = "3. Doctor Theolen Krastinov, the Butcher",
    Level = "60",
    Attain = "55",
    Aim = "Find Doctor Theolen Krastinov inside the Scholomance. Destroy him, then burn the Remains of Eva Sarkhoff and the Remains of Lucien Sarkhoff. Return to Eva Sarkhoff when the task is complete.",
    Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; "..yellow.."70,73"..white..")",
    Note = "You find Doctor Theolen Krastinov, the remains of Eva Sarkhoff and the remains of Lucien Sarkhoff at "..yellow.."[9]"..white..".",
    Prequest = "No",
    Folgequest = "Krastinov's Bag of Horrors",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[4] = {
    Title = "4. Krastinov's Bag of Horrors",
    Level = "60",
    Attain = "55",
    Aim = "Locate Jandice Barov in the Scholomance and destroy her. From her corpse recover Krastinov's Bag of Horrors. Return the bag to Eva Sarkhoff.",
    Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; "..yellow.."70,73"..white..")",
    Note = "You can find Jandice Barov at "..yellow.."[3]"..white..".",
    Prequest = "Doctor Theolen Krastinov, the Butcher",
    Folgequest = "Kirtonos the Herald",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[5] = {
    Title = "5. Kirtonos the Herald",
    Level = "60",
    Attain = "55",
    Aim = "Return to the Scholomance with the Blood of Innocents. Find the porch and place the Blood of Innocents in the brazier. Kirtonos will come to feast upon your soul. Fight valiantly, do not give an inch! Destroy Kirtonos and return to Eva Sarkhoff.",
    Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; "..yellow.."70,73"..white..")",
    Note = "The porch is at "..yellow.."[2]"..white..".",
    Prequest = "Krastinov's Bag of Horrors",
    Folgequest = "The Human, Ras Frostwhisper",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Spectral Essence",
            ID = "13544",
            Color = green,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Penelope's Rose",
            ID = "15805",
            Color = blue,
            Description = AQITEM_OFFHAND,
        },
        {
            Name = "Mirah's Song",
            ID = "15806",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[23].Quests.Alliance[6] = {
    Title = "6. The Lich, Ras Frostwhisper",
    Level = "60",
    Attain = "57",
    Aim = "Find Ras Frostwhisper in the Scholomance. When you have found him, use the Soulbound Keepsake on his undead visage. Should you succeed in reverting him to a mortal, strike him down and recover the Human Head of Ras Frostwhisper. Take the head back to Magistrate Marduke.",
    Location = "Magistrate Marduke (Western Plaguelands - Caer Darrow; "..yellow.."70,73"..white..")",
    Note = "You can find Ras Frostwhisper at "..yellow.."[7]"..white..".",
    Prequest = "The Human, Ras Frostwhisper - > Soulbound Keepsake",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Darrowshire Strongguard",
            ID = "14002",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Warblade of Caer Darrow",
            ID = "13982",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_SWORD,
        },
        {
            Name = "Crown of Caer Darrow",
            ID = "13986",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
        {
            Name = "Darrowspike",
            ID = "13984",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
    }
}
kQuestInstanceData[23].Quests.Alliance[7] = {
    Title = "7. Barov Family Fortune",
    Level = "60",
    Attain = "52",
    Aim = "Venture to the Scholomance and recover the Barov family fortune. Four deeds make up this fortune: The Deed to Caer Darrow; The Deed to Brill; The Deed to Tarren Mill; and The Deed to Southshore. Return to Weldon Barov when you have completed this task.",
    Location = "Weldon Barov (Western Plaguelands - Chillwind Camp; "..yellow.."43,83"..white..")",
    Note = "You can find The Deed to Caer Darrow at "..yellow.."[12]"..white..", The Deed to Brill at "..yellow.."[7]"..white..", The Deed to Tarren Mill at "..yellow.."[4]"..white.." and The Deed to Southshore at "..yellow.."[1]"..white..".",
    Prequest = "No",
    Folgequest = "The Last Barov",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[8] = {
    Title = "8. Dawn's Gambit",
    Level = "60",
    Attain = "57",
    Aim = "Place Dawn's Gambit in the Viewing Room of the Scholomance. Defeat Vectus, then return to Betina Bigglezink.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,59"..white..")",
    Note = "Broodling Essence begins at Tinkee Steamboil (Burning Steppes - Flame Crest; "..yellow.."65,23"..white.."). The Viewing Room is at "..yellow.."[6]"..white..".",
    Prequest = "Broodling Essence - > Betina Bigglezink",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Windreaper",
            ID = "15853",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_AXE,
        },
        {
            Name = "Dancing Sliver",
            ID = "15854",
            Color = blue,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[23].Quests.Alliance[9] = {
    Title = "9. Imp Delivery",
    Level = "60",
    Attain = "60",
    Aim = "Bring the Imp in a Yesr to the alchemy lab in the Scholomance. After the parchment is created, return the jar to Gorzeeki Wildeyes.",
    Location = "Gorzeeki Wildeyes (Burning Steppes; "..yellow.."12,31"..white..")",
    Note = red.."Warlock only"..white..": You find the alchemy lab at "..yellow.."[7]"..white..".",
    Prequest = "Mor'zul Bloodbringer - > Xorothian Stardust",
    Folgequest = "Dreadsteed of Xoroth ("..yellow.."Dire Maul West"..white..")", -- 7631",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[10] = {
    Title = "10. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Kormok and slay him. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nKormok is summoned at "..yellow.."[7]"..white..".",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[11] = {
    Title = "11. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Kormok and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nKormok is summoned at "..yellow.."[7]"..white..".",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Alliance[12] = {
    Title = "12. A Favor for Farsan",
    Level = "58",
    Attain = "55",
    Aim = "Venture into Scholomance and recover the book 'Fire Beckoning and Command' for Strahad Farsan in Ratchet.",
    Location = "Strahad Farsan (The Barrens - Ratchet; "..yellow.."62.6,35.5"..white..")",
    Note = "Questline starts at Craftsman Wilhelm (Eastern Plaguelands - Light's Hope Chapel) with quest 'A New Rune-Frontier'.\n!!! You will get this reward after finishing the last quest in the questline.",
    Prequest = "A New Rune-Frontier -> The Secrets of Darkforging -> The Secrets of Darkforging",
    Folgequest = "A Meeting With The Dreadlord",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Tempered Runeblade",
            ID = "81060",
            Color = purple,
            Description = AQITEM_TWOHAND..AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[23].Quests.Horde[1] = kQuestInstanceData[23].Quests.Alliance[1]
kQuestInstanceData[23].Quests.Horde[2] = kQuestInstanceData[23].Quests.Alliance[2]
kQuestInstanceData[23].Quests.Horde[3] = kQuestInstanceData[23].Quests.Alliance[3]
kQuestInstanceData[23].Quests.Horde[4] = kQuestInstanceData[23].Quests.Alliance[4]
kQuestInstanceData[23].Quests.Horde[5] = kQuestInstanceData[23].Quests.Alliance[5]
kQuestInstanceData[23].Quests.Horde[6] = kQuestInstanceData[23].Quests.Alliance[6]
kQuestInstanceData[23].Quests.Horde[7] = {
    Title = "7. Barov Family Fortune",
    Level = "60",
    Attain = "52",
    Aim = "Venture to the Scholomance and recover the Barov family fortune. Four deeds make up this fortune: The Deed to Caer Darrow; The Deed to Brill; The Deed to Tarren Mill; and The Deed to Southshore. Return to Alexi Barov when you have completed this task.",
    Location = "Alexi Barov (Tirisfal Glades - The Bulwark; "..yellow.."80,73"..white..")",
    Note = "You can find The Deed to Caer Darrow at "..yellow.."[12]"..white..", The Deed to Brill at "..yellow.."[7]"..white..", The Deed to Tarren Mill at "..yellow.."[4]"..white.." and The Deed to Southshore at "..yellow.."[1]"..white..".",
    Prequest = "No",
    Folgequest = "The Last Barov",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[23].Quests.Horde[8] = kQuestInstanceData[23].Quests.Alliance[8]
kQuestInstanceData[23].Quests.Horde[9] = kQuestInstanceData[23].Quests.Alliance[9]
kQuestInstanceData[23].Quests.Horde[10] = kQuestInstanceData[23].Quests.Alliance[10]
kQuestInstanceData[23].Quests.Horde[11] = kQuestInstanceData[23].Quests.Alliance[11]
kQuestInstanceData[23].Quests.Horde[12] = kQuestInstanceData[23].Quests.Alliance[12]

--------------- INST24 - Shadowfang Keep ---------------
kQuestInstanceData[24] = {
    Story = "During the Third War, the wizards of the Kirin Tor battled against the undead armies of the Scourge. When the wizards of Dalaran died in battle, they would rise soon after - adding their former might to the growing Scourge. Frustrated by their lack of progress (and against the advice of his peers) the Archmage, Arugal elected to summon extra-dimensional entities to bolster Dalaran's diminishing ranks. Arugal's summoning brought the ravenous worgen into the world of Azeroth. The feral wolf-men slaughtered not only the Scourge, but quickly turned on the wizards themselves. The worgen laid siege to the keep of the noble, Baron Silverlaine. Situated above the tiny hamlet of Pyrewood, the keep quickly fell into shadow and ruin. Driven mad with guilt, Arugal adopted the worgen as his children and retreated to the newly dubbed 'Shadowfang Keep'. It's said he still resides there, protected by his massive pet, Fenrus - and haunted by the vengeful ghost of Baron Silverlaine.",
    Caption = "Shadowfang Keep",
    QAA = "5 Quests",
    QAH = "7 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[24].Quests.Alliance[1] = {
    Title = "1. The Test of Righteousness",
    Level = "22",
    Attain = "20",
    Aim = "Using Jordan's Weapon Notes, find some Whitestone Oak Lumber, Bailor's Refined Ore Shipment, Jordan's Smithing Hammer, and a Kor Gem, and return them to Jordan Stilwell in Ironforge.",
    Location = "Jordan Stilwell (Dun Morogh - Ironforge Entrance; "..yellow.."52,36"..white..")",
    Note = red.."Paladin only"..white..": To see the note click on  "..yellow.."[The Test of Righteousness Information]"..white..".",
    Prequest = "The Tome of Valor -> The Test of Righteousness",
    Folgequest = "The Test of Righteousness",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Verigan's Fist",
            ID = "6953",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
    },
    Page = kQuestInstanceData[1].Quests.Alliance[6].Page
}
kQuestInstanceData[24].Quests.Alliance[2] = {
    Title = "2. The Orb of Soran'ruk",
    Level = "25",
    Attain = "20",
    Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens.",
    Location = "Doan Karhan (Barrens; "..yellow.."49,57"..white..")",
    Note = red.."WARLOCK only"..white..": You get the 3 Soran'ruk Fragments from Twilight Accolytes in "..yellow.."[Blackfathom Deeps]"..white..". You get the Large Soran'ruk Fragment in "..yellow.."[Shadowfang Keep]"..white.." from Shadowfang Darksouls.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Orb of Soran'ruk",
            ID = "6898",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
        {
            Name = "Staff of Soran'ruk",
            ID = "15109",
            Color = green,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[24].Quests.Alliance[3] = {
    Title = "3. Arugal's Folly",
    Level = "27",
    Attain = "22",
    Aim = "High Sorcerer Andromath has tasked you with the death of Archmage Arugal "..yellow.."[12]"..white..". Return to him when you're done.",
    Location = "High Sorcerer Andromath (Stormwind - The Mage Quarter, Mage Tower)",
    Note = "",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Signet of Arugal",
            ID = "51805",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[24].Quests.Alliance[4] = {
    Title = "4. The Missing Sorcerer",
    Level = "24",
    Attain = "22",
    Aim = "High Sorcerer Andromath wants you to travel to Shadowfang Keep in Silverpine Forest and find out what happened to Sorcerer Ashcrombe.",
    Location = "High Sorcerer Andromath (Stormwind - The Mage Quarter, Mage Tower)",
    Note = "Sorcerer Ashcrombe is in the cage "..yellow.."[1]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[24].Quests.Alliance[5] = {
    Title = "5. Blood of Vorgendor",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Fandral Staghelm. He requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Arch Druid Fandral Staghelm (Darnassus - Cenarion Enclave "..yellow.."35,9"..white..").",
    Note = "[Shadowfang Blood] drop from Worgens."..white.."\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[24].Quests.Horde[1] = {
    Title = "1. Deathstalkers in Shadowfang",
    Level = "25",
    Attain = "18",
    Aim = "Find the Deathstalker Adamant and Deathstalker Vincent.",
    Location = "High Executor Hadrec (Silverpine Forest - The Sepulcher; "..yellow.."43,40"..white..")",
    Note = "You find Deathstalker Adamant at "..yellow.."[1]"..white..". Deathstalker Vincent is on the right side when you go into the courtyard at "..yellow.."[2]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Ghostly Mantle",
            ID = "3324",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[24].Quests.Horde[2] = {
    Title = "2. The Book of Ur",
    Level = "26",
    Attain = "16",
    Aim = "Bring the Book of Ur to Keeper Bel'dugur at the Apothecarium in the Undercity.",
    Location = "Keeper Bel'dugur (Undercity - The Apothecarium; "..yellow.."53,54"..white..")",
    Note = "You find the book at "..yellow.."[8]"..white.." on the left side when you enter the room.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Grizzled Boots",
            ID = "6335",
            Color = green,
            Description = AQITEM_FEET..AQITEM_LEATHER,
        },
        {
            Name = "Steel-clasped Bracers",
            ID = "4534",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[24].Quests.Horde[3] = {
    Title = "3. Arugal Must Die",
    Level = "27",
    Attain = "18",
    Aim = "Kill Arugal and bring his head to Dalar Dawnweaver at the Sepulcher.",
    Location = "Dalar Dawnweaver (Silverpine Forest - The Sepulcher; "..yellow.."44,39"..white..")",
    Note = "You find Archmage Arugal at "..yellow.."[12]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Seal of Sylvanas",
            ID = "6414",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[24].Quests.Horde[4] = {
    Title = "4. The Orb of Soran'ruk",
    Level = "25",
    Attain = "20",
    Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens.",
    Location = "Doan Karhan (Barrens; "..yellow.."49,57"..white..")",
    Note = red.."WARLOCK only"..white..": You get the 3 Soran'ruk Fragments from Twilight Accolytes in "..yellow.."[Blackfathom Deeps]"..white..". You get the Large Soran'ruk Fragment in "..yellow.."[Shadowfang Keep]"..white.." from Shadowfang Darksouls.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Orb of Soran'ruk",
            ID = "6898",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
    }
}
kQuestInstanceData[24].Quests.Horde[5] = {
    Title = "5. Into The Jaws",
    Level = "25",
    Attain = "15",
    Aim = "Find Melenas' Belongings in the Shadowfang Keep Library and return them to Pierce Shackleton in the Undercity.",
    Location = "Pierce Shackleton (Undercity - Magic Quarter "..yellow.."85.4,13.6"..white..")",
    Note = "You find Melenas' Belongings at "..yellow.."[12]"..white..", a box on the floor between two left book shelves .\nQuestline starts at Duke Nargelas (Tirisfal Glades - Glenshire, west of Tirisfal Glades).\nQuest reward you will get after finishing next quest.",
    Prequest = "Darlthos Heritage -> A Different Type of Lock -> Ways of Magic",
    Folgequest = "Darlthos Legacy",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Sword of Laneron",
            ID = "60392",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_SWORD,
        },
        {
            Name = "Shield of Mathela",
            ID = "60393",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
    }
}
kQuestInstanceData[24].Quests.Horde[6] = {
    Title = "6. Too Late to Prelate",
    Level = "22",
    Attain = "16",
    Aim = "Slay Prelate Ironmane and return to Father Brightcopf in Glenshire.",
    Location = "Father Brightcopf (Glenshire "..yellow.."20.8, 68.7"..white..")",
    Note = "You need to kill Prelate Ironmane [13].\nQuest chain start at Deathguard Podrig (Silverpine Forrest - The Sepulcher; "..yellow.."43, 42"..white..")",
    Prequest = "To Guard the Undead -> To Aid Brightcopf",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Necklace of Redemption",
            ID = "70225",
            Color = green,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[24].Quests.Horde[7] = {
    Title = "7. The Wolf, the Crone and the Scythe",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Magatha Grimtotem. She requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Magatha Grimtotem (Thunder Bluff - The Elder Rise "..yellow.."70,31"..white..").",
    Note = "[Shadowfang Blood] drop from Worgens."..white.."\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST25 - Stratholme ---------------
kQuestInstanceData[25] = {
    Story = "Once the jewel of northern Lordaeron, the city of Stratholme is where Prince Arthas turned against his mentor, Uther Lightbringer, and slaughtered hundreds of his own subjects who were believed to have contracted the dreaded plague of undeath. Arthas' downward spiral and ultimate surrender to the Lich King soon followed. The broken city is now inhabited by the undead Scourge - led by the powerful lich, Kel'thuzad. A contingent of Scarlet Crusaders, led by Grand Crusader Dathrohan, also holds a portion of the ravaged city. The two sides are locked in constant, violent combat. Those adventurers brave (or foolish) enough to enter Stratholme will be forced to contend with both factions before long. It is said that the city is guarded by three massive watchtowers, as well as powerful necromancers, banshees and abominations. There have also been reports of a malefic Death Knight riding atop an unholy steed - dispensing indiscriminate wrath on all those who venture within the realm of the Scourge.",
    Caption = "Stratholme",
    QAA = "21 Quests",
    QAH = "22 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[25].Quests.Alliance[1] = {
    Title = "1. The Flesh Does Not Lie",
    Level = "60",
    Attain = "55",
    Aim = "Recover 10 Plagued Flesh Samples from Stratholme and return them to Betina Bigglezink. You suspect that any creature in Stratholme would have said flesh sample.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,59"..white..")",
    Note = "Most mobs in Stratholme can drop the Plagued Flesh Samples, but the drop rate seems low.",
    Prequest = "No",
    Folgequest = "The Active Agent",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[2] = {
    Title = "2. The Active Agent",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Stratholme and search the ziggurats. Find and return new Scourge Data to Betina Bigglezink.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,59"..white..")",
    Note = "The Scourge Data is in one of the 3 Towers, you find near "..yellow.."[15]"..white..", "..yellow.."[16]"..white.." and "..yellow.."[17]"..white..".",
    Prequest = "The Flesh Does Not Lie",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Seal of the Dawn",
            ID = "13209",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Rune of the Dawn",
            ID = "19812",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[3] = {
    Title = "3. Houses of the Holy",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Stratholme, in the north. Search the supply crates that litter the city and recover 5 Stratholme Holy Water. Return to Leonid Barthalomew the Revered when you have collected enough of the blessed fluid.",
    Location = "Leonid Barthalomew the Revered (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."80,58"..white..")",
    Note = "You can find the Holy Water in chests everywhere in Stratholme. But if you open a chest bugs can appear and attack you.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1 (x5)"..AQDiscription_AND..white.."2 (x5)"..AQDiscription_AND..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Superior Healing Potion",
            ID = "3928",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Greater Mana Potion",
            ID = "6149",
            Color = white,
            Description = AQITEM_POTION,
        },
        {
            Name = "Crown of the Penitent",
            ID = "13216",
            Color = green,
            Description = AQITEM_HEAD .. AQITEM_CLOTH,
        },
        {
            Name = "Band of the Penitent",
            ID = "13217",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[4] = {
    Title = "4. The Great Fras Siabi",
    Level = "60",
    Attain = "55",
    Aim = "Find Fras Siabi's smoke shop in Stratholme and recover a box of Siabi's Premium Tobacco. Return to Smokey LaRue when the job is done.",
    Location = "Smokey LaRue (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."80,58"..white..")",
    Note = "You find the smoke shop near "..yellow.."[1]"..white..". Fras Siabi spawns when you open box.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Smokey's Lighter",
            ID = "13171",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[5] = {
    Title = "5. The Restless Souls",
    Level = "60",
    Attain = "55",
    Aim = "Use Egan's Blaster on the ghostly and spectral citizens of Stratholme. When the restless souls break free from their ghostly shells, use the blaster again - freedom will be theirs!\nFree 15 Restless Souls and return to Egan.",
    Location = "Egan (Eastern Plaguelands; "..yellow.."14,33"..white..")",
    Note = "You get the prequest from Caretaker Alen (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."79,63"..white.."). The spectral citizens walk through whole Stratholme.",
    Prequest = "The Restless Souls",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Testament of Hope",
            ID = "13315",
            Color = green,
            Description = AQITEM_OFFHAND,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[6] = {
    Title = "6. Of Love and Family",
    Level = "60",
    Attain = "52",
    Aim = "Travel to Stratholme, in the northern part of the Plaguelands. It is in the Scarlet Bastion that you will find the painting 'Of Love and Family,' hidden behind another painting depicting the twin moons of our world.\nReturn the painting to Tirion Fordring.",
    Location = "Artist Renfray (Western Plaguelands - Caer Darrow; "..yellow.."65,75"..white..")",
    Note = "You get the prequest from Tirion Fordring (Western Plaguelands; "..yellow.."7,43"..white.."). You can find the picture near "..yellow.."[10]"..white..".",
    Prequest = "Redemption - > Of Love and Family",
    Folgequest = "Find Myranda",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[7] = {
    Title = "7. Menethil's Gift",
    Level = "60",
    Attain = "57",
    Aim = "Travel to Stratholme and find Menethil's Gift. Place the Keepsake of Remembrance upon the unholy ground.",
    Location = "Leonid Barthalomew the Revered (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."80,58"..white..")",
    Note = "You get the prequest from Magistrate Marduke (Western Plaguelands - Caer Darrow; "..yellow.."70,73"..white.."). You find the sign near "..yellow.."[19]"..white..". See also: "..yellow.."[The Lich, Ras Frostwhisper]"..white.." in Scholomance.",
    Prequest = "The Human Ras Frostraunen - > The Dying, Ras Frostwhisper",
    Folgequest = "Menethil's Gift",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[8] = {
    Title = "8. Aurius' Reckoning",
    Level = "60",
    Attain = "55",
    Aim = "Kill the Baron.",
    Location = "Aurius (Stratholme; "..yellow.."[13]"..white..")",
    Note = "To start the quest you have to give Aurius [The Medallion of Faith]. You get the Medallion from a chest (Malor's Strongbox "..yellow.."[7]"..white..") in the first chamber of the bastion (before the ways split). After giving Aurius the Medallion he supports your group in the fight against the Baron "..yellow.."[19]"..white..". After killing the Baron you have to talk to Aurius again to get the Rewards.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Will of the Martyr",
            ID = "17044",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Blood of the Martyr",
            ID = "17045",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[9] = {
    Title = "9. The Archivist",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Stratholme and find Archivist Galford of the Scarlet Crusade. Destroy him and burn down the Scarlet Archive.",
    Location = "Duke Nicholas Zverenhoff (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,59"..white..")",
    Note = "You can find the Archive and the Achivist at "..yellow.."[10]"..white..".",
    Prequest = "No",
    Folgequest = "The Truth Comes Crashing Down",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[10] = {
    Title = "10. The Truth Comes Crashing Down",
    Level = "60",
    Attain = "55",
    Aim = "Take the Head of Balnazzar to Duke Nicholas Zverenhoff in the Eastern Plaguelands.",
    Location = "Balnazzar (Stratholme; "..yellow.."[11]"..white..")",
    Note = "You find Duke Nicholas Zverenhoff in the Eastern Plaguelands - Light's Hope Chapel ("..yellow.."81,59"..white..").",
    Prequest = "The Archivist",
    Folgequest = "Above and Beyond",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[11] = {
    Title = "11. Above and Beyond",
    Level = "60",
    Attain = "55",
    Aim = "Venture to Stratholme and destroy Baron Rivendare. Take his head and return to Duke Nicholas Zverenhoff.",
    Location = "Duke Nicholas Zverenhoff (Eastern Plaguelands - Light's Hope Chapel; "..yellow.."81,59"..white..")",
    Note = "You can find the Baron at "..yellow.."[19]"..white..".",
    Prequest = "The Truth Comes Crashing Down",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Argent Defender",
            ID = "13243",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Argent Crusader",
            ID = "13249",
            Color = blue,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Argent Avenger",
            ID = "13246",
            Color = blue,
            Description = AQITEM_ONEHAND .. AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[12] = {
    Title = "12. Dead Man's Plea",
    Level = "60",
    Attain = "58",
    Aim = "Go into Stratholme and rescue Ysida Harmon from Baron Rivendare.",
    Location = "Anthion Harmon (Eastern Plaguelands - Stratholme)",
    Note = "Anthion stands just outside the Stratholme portal. You need the Extra-Dimensional Ghost Revealer to see him. It comes from the pre-quest. The questline starts with Just Compensation. Deliana in Ironforge ("..yellow.."43,52"..white..") for Alliance, Mokvar in Orgrimmar ("..yellow.."38,37"..white..") for Horde.\nThis is the infamous '45 minute' Baron run.",
    Prequest = "In Search of Anthion",
    Folgequest = "Proof of Life",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[13] = {
    Title = "13. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nJarien and Sothos are summoned at "..yellow.."[11]"..white..".",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[14] = {
    Title = "14. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nJarien and Sothos are summoned at "..yellow.."[11]"..white..".",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[25].Quests.Alliance[15] = {
    Title = "15. Atiesh, Greatstaff of the Guardian",
    Level = "60",
    Attain = "60",
    Aim = "Anachronos at the Caverns of Time in Tanaris wants you to take Atiesh, Greatstaff of the Guardian to Stratholme and use it on Consecrated Earth. Defeat the entity that is exorcised from the staff and return to him.",
    Location = "Anachronos (Tanaris - Caverns of Time; "..yellow.."65,49"..white..")",
    Note = "Atiesh is summoned at "..yellow.."[2]"..white..".",
    Prequest = "Frame of Atiesh -> Atiesh, the Befouled Greatstaff",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Atiesh, Greatstaff of the Guardian",
            ID = "22589",
            Color = purple,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Atiesh, Greatstaff of the Guardian",
            ID = "22630",
            Color = purple,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Atiesh, Greatstaff of the Guardian",
            ID = "22631",
            Color = purple,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Atiesh, Greatstaff of the Guardian",
            ID = "22632",
            Color = purple,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[16] = {
    Title = "16. Corruption",
    Level = "60",
    Attain = "50",
    Aim = "Find the Black Guard Swordsmith in Stratholme and destroy him. Recover the Insignia of the Black Guard and return to Seril Scourgebane.",
    Location = "Seril Scourgebane (Winterspring - Everlook; "..yellow.."61,37"..white..")",
    Note = red.."Blacksmith only"..white..": The Black Guard Swordsmith is summoned near "..yellow.."[15]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Plans: Blazing Rapier",
            ID = "12825",
            Color = green,
            Description = AQITEM_PATTERN,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[17] = {
    Title = "17. Sweet Serenity",
    Level = "60",
    Attain = "50",
    Aim = "Travel to Stratholme and kill the Crimson Hammersmith. Recover the Crimson Hammersmith's Apron and return to Lilith.",
    Location = "Lilith the Lithe (Winterspring - Everlook; "..yellow.."61,37"..white..")",
    Note = red.."Blacksmith only"..white..": The Crimson Hammersmith is summoned at "..yellow.."[8]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Plans: Enchanted Battlehammer",
            ID = "12824",
            Color = green,
            Description = AQITEM_PATTERN,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[18] = {
    Title = "18. To Build a Pounder",
    Level = "60",
    Attain = "30",
    Aim = "The last component I need is a high quality adamantite rod used for the endoskeleton. I believe Stratholme's forges used to make such rods in the past.",
    Location = "Oglethorpe Obnoticus <Master Gnome Engineer> (Stranglethorn Vale; Booty Bay "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Engineers only)"..white.."This quest requires to collect 3 items. \n1) Thorium Tuned Servo (Scarlet Monastery from Scarlet Myrmidon)\n2) Perfect Golem Core (Blackrock Depths from Golem Lord Argelmach)\n3) Adamantite Rod (Stratholme from Crimson Hammersmith "..yellow.."[8]"..white..")\n'Crowd Pummeler 9-60' in Gnomeregan drops 'Intact Pounder Mainframe' that starts the PreQuest 'A Pounding Brain'.",
    Prequest = "A Pounding Brain",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Reinforced Red Pounder",
            ID = "81253",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Green Pounder",
            ID = "81252",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Blue Pounder",
            ID = "81251",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Black Pounder",
            ID = "81250",
            Color = blue,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[19] = {
    Title = "19. To Wake The Ashbringer",
    Level = "60",
    Attain = "60",
    Aim = "Recover Tabard of the Ashbringer(kill Grand Crusader Dathrohan) and Cape of Alexandros from Stratholme.",
    Location = "Tirion Fordring (Western Plaguelands - Light's Hope Chapel "..yellow.."67.3,24.2"..white..").",
    Note = "Tabard of the Ashbringer drops from Grand Crusader Dathrohan "..yellow.."[11]"..white..", Cape of Alexandros drops from Baron Rivendare"..yellow.."[19]"..white.."\nQuestline starts in Naxxramas after killing 4 Horsemans with quest 'Orb of Pure Light'",
    Prequest = "Orb of Pure Light -> Seek Help Elsewhere",
    Folgequest = "Spirit of the Ashbringer",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Tabard of the Ashbringer",
            ID = "82002",
            Color = purple,
            Description = AQITEM_TABARD,
        },
    }
}
kQuestInstanceData[25].Quests.Alliance[20] = {
    Title = "20. Rothlen Family Brooch",
    Level = "60",
    Attain = "55",
    Aim = "Recover the Rothlen Family Brooch from Stratholme for Duke Rothlen in Karazhan.",
    Location = "Duke Rothlen (Karazhan; "..yellow.."[Karazhan - c]"..white..")",
    Note = "Rothlen Family Brooch next to boss The Unforgiven "..yellow.."[4]"..white.." in the chest.\nQuest chain starts with epic item random drop 'Scribbled Cooking Notes' "..yellow.."[Karazhan]"..white..".",
    Prequest = "Scribbled Cooking Notes "..yellow.."[Karazhan]"..white.." -> Lost and Found "..yellow.."[Karazhan]"..white.."", -- 40998, 40999",
    Folgequest = "The Secret Recipe ("..yellow.."[Karazhan]"..white..")" -- 41001",
}
kQuestInstanceData[25].Quests.Alliance[21] = {
    Title = "21. The Key to Karazhan VII",
    Level = "60",
    Attain = "58",
    Aim = "Find four Echoes of Medivh. They might be found in places of great significance for the mage. Then return to Vandol with the key.",
    Location = "Dolvan Bracewind (Dustwallow Marsh - Westhaven Hollow; "..yellow.."[71.1,73.2]"..white..")",
    Note = "Second Feather of Medivh on the ground in the place where Elder Farwhisper (Lunar Festival) "..yellow.."[5]"..white.." is.\nFirst Feather of Medivh "..yellow.."[Undercity]"..white.." behind the entrance throne.\nThird Feather of Medivh "..yellow.."[Alterac Mountain]"..white.." on the end of first(western) cliff "..yellow.."[30.8,87.4]"..white..".\nFourth Feather of Medivh "..yellow.."[Hyjal]"..white.." on the end of the cliff "..yellow.."[31.8,70.5]"..white..".",
    Prequest = "The Key to Karazhan VI",
    Folgequest = "The Key to Karazhan VIII ("..yellow.."Dire Maul West"..white..")" -- 40827",
}
kQuestInstanceData[25].Quests.Horde[1] = kQuestInstanceData[25].Quests.Alliance[1]
kQuestInstanceData[25].Quests.Horde[2] = kQuestInstanceData[25].Quests.Alliance[2]
kQuestInstanceData[25].Quests.Horde[3] = kQuestInstanceData[25].Quests.Alliance[3]
kQuestInstanceData[25].Quests.Horde[4] = kQuestInstanceData[25].Quests.Alliance[4]
kQuestInstanceData[25].Quests.Horde[5] = kQuestInstanceData[25].Quests.Alliance[5]
kQuestInstanceData[25].Quests.Horde[6] = kQuestInstanceData[25].Quests.Alliance[6]
kQuestInstanceData[25].Quests.Horde[7] = kQuestInstanceData[25].Quests.Alliance[7]
kQuestInstanceData[25].Quests.Horde[8] = kQuestInstanceData[25].Quests.Alliance[8]
kQuestInstanceData[25].Quests.Horde[9] = kQuestInstanceData[25].Quests.Alliance[9]
kQuestInstanceData[25].Quests.Horde[10] = kQuestInstanceData[25].Quests.Alliance[10]
kQuestInstanceData[25].Quests.Horde[11] = kQuestInstanceData[25].Quests.Alliance[11]
kQuestInstanceData[25].Quests.Horde[12] = kQuestInstanceData[25].Quests.Alliance[12]
kQuestInstanceData[25].Quests.Horde[13] = kQuestInstanceData[25].Quests.Alliance[13]
kQuestInstanceData[25].Quests.Horde[14] = kQuestInstanceData[25].Quests.Alliance[14]
kQuestInstanceData[25].Quests.Horde[15] = kQuestInstanceData[25].Quests.Alliance[15]
kQuestInstanceData[25].Quests.Horde[16] = kQuestInstanceData[25].Quests.Alliance[16]
kQuestInstanceData[25].Quests.Horde[17] = kQuestInstanceData[25].Quests.Alliance[17]
kQuestInstanceData[25].Quests.Horde[18] = {
    Title = "18. Ramstein",
    Level = "60",
    Attain = "56",
    Aim = "Travel to Stratholme and slay Ramstein the Gorger. Take his head as a souvenir for Nathanos.",
    Location = "Nathanos Blightcaller (Eastern Plaguelands; "..yellow.."26,74"..white..")",
    Note = "You get the prequest from Nathanos Blightcaller, too. You can find Ramstein at "..yellow.."[18]"..white..".",
    Prequest = "The Ranger Lord's Behest -> Duskwing, Oh How I Hate Thee...",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Royal Seal of Alexis",
            ID = "18022",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Elemental Circle",
            ID = "17001",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[25].Quests.Horde[19] = {
    Title = "19. To Build a Pounder",
    Level = "60",
    Attain = "30",
    Aim = "The last component I need is a high quality adamantite rod used for the endoskeleton. I believe Stratholme's forges used to make such rods in the past.",
    Location = "Oglethorpe Obnoticus <Master Gnome Engineer> (Stranglethorn Vale; Booty Bay "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Engineers only)"..white.."This quest requires to collect 3 items. \n1) Thorium Tuned Servo (Scarlet Monastery from Scarlet Myrmidon)\n2) Perfect Golem Core (Blackrock Depths from Golem Lord Argelmach)\n3) Adamantite Rod (Stratholme from Crimson Hammersmith "..yellow.."[8]"..white..")\n'Crowd Pummeler 9-60' in Gnomeregan drops 'Intact Pounder Mainframe' that starts the PreQuest 'A Pounding Brain'.",
    Prequest = "A Pounding Brain",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Reinforced Red Pounder",
            ID = "81253",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Green Pounder",
            ID = "81252",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Blue Pounder",
            ID = "81251",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Reinforced Black Pounder",
            ID = "81250",
            Color = blue,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[25].Quests.Horde[20] = {
    Title = "20. To Wake The Ashbringer",
    Level = "60",
    Attain = "60",
    Aim = "Recover Tabard of the Ashbringer(kill Grand Crusader Dathrohan) and Cape of Alexandros from Stratholme.",
    Location = "Tirion Fordring (Western Plaguelands - Light's Hope Chapel "..yellow.."67.3,24.2"..white..").",
    Note = "Tabard of the Ashbringer drops from Grand Crusader Dathrohan "..yellow.."[11]"..white..", Cape of Alexandros drops from Baron Rivendare"..yellow.."[19]"..white.."\nQuestline starts in Naxxramas after killing 4 Horsemans with quest 'Orb of Pure Light'",
    Prequest = "Orb of Pure Light -> Seek Help Elsewhere",
    Folgequest = "Spirit of the Ashbringer",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Tabard of the Ashbringer",
            ID = "82002",
            Color = purple,
            Description = AQITEM_TABARD,
        },
    }
}
kQuestInstanceData[25].Quests.Horde[21] = {
    Title = "21. Rothlen Family Brooch",
    Level = "60",
    Attain = "55",
    Aim = "Recover the Rothlen Family Brooch from Stratholme for Duke Rothlen in Karazhan.",
    Location = "Duke Rothlen (Karazhan; "..yellow.."[Karazhan - c]"..white..")",
    Note = "Rothlen Family Brooch next to boss The Unforgiven "..yellow.."[4]"..white.." in the chest.\nQuest chain starts with epic item random drop 'Scribbled Cooking Notes' "..yellow.."[Karazhan]"..white..".",
    Prequest = "Scribbled Cooking Notes "..yellow.."[Karazhan]"..white.." -> Lost and Found "..yellow.."[Karazhan]"..white.."", -- 40998, 40999",
    Folgequest = "The Secret Recipe ("..yellow.."[Karazhan]"..white..")" -- 41001",
}
kQuestInstanceData[25].Quests.Horde[22] = {
    Title = "22. The Key to Karazhan VII",
    Level = "60",
    Attain = "58",
    Aim = "Find four Echoes of Medivh. They might be found in places of great significance for the mage. Then return to Vandol with the key.",
    Location = "Dolvan Bracewind (Dustwallow Marsh - Westhaven Hollow; "..yellow.."[71.1,73.2]"..white..")",
    Note = "Second Feather of Medivh on the ground in the place where Elder Farwhisper (Lunar Festival) "..yellow.."[5]"..white.." is.\nFirst Feather of Medivh "..yellow.."[Undercity]"..white.." behind the entrance throne.\nThird Feather of Medivh "..yellow.."[Alterac Mountain]"..white.." on the end of first(western) cliff "..yellow.."[30.8,87.4]"..white..".\nFourth Feather of Medivh "..yellow.."[Hyjal]"..white.." on the end of the cliff "..yellow.."[31.8,70.5]"..white..".",
    Prequest = "The Key to Karazhan VI",
    Folgequest = "The Key to Karazhan VIII ("..yellow.."Dire Maul West"..white..")" -- 40827",
}

--------------- INST26 - Ruins of Ahn'Qiraj ---------------
kQuestInstanceData[26] = {
    Story = "During the final hours of the War of the Shifting Sands, the combined forces of the night elves and the four dragonflights drove the battle to the very heart of the qiraji empire, to the fortress city of Ahn'Qiraj. Yet at the city gates, the armies of Kalimdor encountered a concentration of silithid war drones more massive than any they had encountered before. Ultimately the silithid and their qiraji masters were not defeated, but merely imprisoned inside a magical barrier, and the war left the cursed city in ruins. A thousand years have passed since that day, but the qiraji forces have not been idle. A new and terrible army has been spawned from the hives, and the ruins of Ahn'Qiraj are teeming once again with swarming masses of silithid and qiraji. This threat must be eliminated, or else all of Azeroth may fall before the terrifying might of the new qiraji army.",
    Caption = "Ruins of Ahn'Qiraj",
    QAA = "3 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[26].Quests.Alliance[1] = {
    Title = "1. The Fall of Ossirian",
    Level = "60",
    Attain = "60",
    Aim = "Deliver the Head of Ossirian the Unscarred to Commander Mar'alith at Cenarion Hold in Silithus.",
    Location = "Head of Ossirian the Unscarred (drops from Ossirian the Unscarred; "..yellow.."[6]"..white..")",
    Note = "Commander Mar'alith (Silithus - Cenarion Hold; "..yellow.."49,34"..white..")",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Charm of the Shifting Sands",
            ID = "21504",
            Color = purple,
            Description = AQITEM_NECK,
        },
        {
            Name = "Amulet of the Shifting Sands",
            ID = "21507",
            Color = purple,
            Description = AQITEM_NECK,
        },
        {
            Name = "Choker of the Shifting Sands",
            ID = "21505",
            Color = purple,
            Description = AQITEM_NECK,
        },
        {
            Name = "Pendant of the Shifting Sands",
            ID = "21506",
            Color = purple,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[26].Quests.Alliance[2] = {
    Title = "2. The Perfect Poison",
    Level = "60",
    Attain = "60",
    Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac.",
    Location = "Dirk Thunderwood (Silithus - Cenarion Hold; "..yellow.."52,39"..white..")",
    Note = "Venoxis's Venom Sac drops from High priest Venoxis in "..yellow.."Zul'Gurub"..white..". Kurinnaxx's Venom Sac drops in the "..yellow.."Ruins of Ahn'Qiraj"..white.." at "..yellow.."[1]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4"..AQDiscription_OR..white.."5"..AQDiscription_OR..white.."6",
        {
            Name = "Ravenholdt Slicer",
            ID = "22378",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Shivsprocket's Shiv",
            ID = "22379",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_DAGGER,
        },
        {
            Name = "The Thunderwood Poker",
            ID = "22377",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
        {
            Name = "Doomulus Prime",
            ID = "22348",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
        {
            Name = "Fahrad's Reloading Repeater",
            ID = "22347",
            Color = blue,
            Description = AQITEM_CROSSBOW,
        },
        {
            Name = "Simone's Cultivating Hammer",
            ID = "22380",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[26].Quests.Alliance[3] = {
    Title = "3. Lost to the Sands",
    Level = "60",
    Attain = "60",
    Aim = "Bring a Perfect Obsidian Shard to Archmage Xylem.",
    Location = "Archmage Xylem (Azshara; "..yellow.."28,47"..white..")",
    Note = red.."Mage only"..white..": pre-quest from Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white.."). Perfect Obsidian Shard drop from "..yellow.."[3]"..white..".",
    Prequest = "Arcane Refreshment -> A Special Kind of Summons",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Tome of Refreshment Ritual",
            ID = "83002",
            Color = white,
            Description = AQITEM_PATTERN,
        },
    }
}
kQuestInstanceData[26].Quests.Horde[1] = kQuestInstanceData[26].Quests.Alliance[1]
kQuestInstanceData[26].Quests.Horde[2] = kQuestInstanceData[26].Quests.Alliance[2]
kQuestInstanceData[26].Quests.Horde[3] = kQuestInstanceData[26].Quests.Alliance[3]

--------------- INST27 - The Stockade ---------------
kQuestInstanceData[27] = {
    Story = "The Stockades are a high-security prison complex, hidden beneath the canal district of Stormwind city. Presided over by Warden Thelwater, the Stockades are home to petty crooks, political insurgents, murderers and a score of the most dangerous criminals in the land. Recently, a prisoner-led revolt has resulted in a state of pandemonium within the Stockades - where the guards have been driven out and the convicts roam free. Warden Thelwater has managed to escape the holding area and is currently enlisting brave thrill-seekers to venture into the prison and kill the uprising's mastermind - the cunning felon, Bazil Thredd.",
    Caption = "The Stockade",
    QAA = "7 Quests",
    QAH = "No Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[27].Quests.Alliance[1] = {
    Title = "1. What Comes Around...",
    Level = "25",
    Attain = "22",
    Aim = "Bring the head of Targorr the Dread to Guard Berton in Lakeshire.",
    Location = "Guard Berton (Redridge Mountains - Lakeshire; "..yellow.."26,46"..white..")",
    Note = "You can find Targorr at "..yellow.."[1]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Lucine Longsword",
            ID = "3400",
            Color = green,
            Description = AQITEM_MAINHAND..AQITEM_SWORD,
        },
        {
            Name = "Hardened Root Staff",
            ID = "1317",
            Color = green,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[27].Quests.Alliance[2] = {
    Title = "2. Crime and Punishment",
    Level = "26",
    Attain = "22",
    Aim = "Councilman Millstipe of Darkshire wants you to bring him the hand of Dextren Ward.",
    Location = "Millstipe (Duskwood - Darkshire; "..yellow.."72,47"..white..")",
    Note = "You can find Dextren at "..yellow.."[5]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Ambassador's Boots",
            ID = "2033",
            Color = green,
            Description = AQITEM_FEET..AQITEM_LEATHER,
        },
        {
            Name = "Darkshire Mail Leggings",
            ID = "2906",
            Color = green,
            Description = AQITEM_LEGS..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[27].Quests.Alliance[3] = {
    Title = "3. Quell The Uprising",
    Level = "26",
    Attain = "22",
    Aim = "Warden Thelwater of Stormwind wants you to kill 10 Defias Prisoners, 8 Defias Convicts, and 8 Defias Insurgents in The Stockade.",
    Location = "Warden Thelwater (Stormwind - The Stockade; "..yellow.."41,58"..white..")",
    Note = "",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[27].Quests.Alliance[4] = {
    Title = "4. The Color of Blood",
    Level = "26",
    Attain = "22",
    Aim = "Nikova Raskol of Stormwind wants you to collect 10 Red Wool Bandanas.",
    Location = "Nikova Raskol (Stormwind - Old Town; "..yellow.."73,46"..white..")",
    Note = "All mobs found inside the instance drops Red Wool Bandanas.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[27].Quests.Alliance[5] = {
    Title = "5. The Fury Runs Deep",
    Level = "27",
    Attain = "22",
    Aim = "Motley Garmason wants Kam Deepfury's head brought to him at Dun Modr.",
    Location = "Motley Garmason (Wetlands - Dun Modr; "..yellow.."49,18"..white..")",
    Note = "The preceding quest can be obtained from Motley too. You can find Kam Deepfury at "..yellow.."[2]"..white..".",
    Prequest = "The Dark Iron War",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Belt of Vindication",
            ID = "3562",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_LEATHER,
        },
        {
            Name = "Headbasher",
            ID = "1264",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[27].Quests.Alliance[6] = {
    Title = "6. The Stockade Riots",
    Level = "29",
    Attain = "16",
    Aim = "Kill Bazil Thredd and bring his head back to Warden Thelwater at the Stockade.",
    Location = "Warden Thelwater (Stormwind - The Stockade; "..yellow.."41,58"..white..")",
    Note = "For more details about the preceding quest see "..yellow.."[Deadmines, The Defias Brotherhood]"..white..".\nYou can find Bazil Thredd at "..yellow.."[4]"..white..".",
    Prequest = "The Defias Brotherhood -> Bazil Thredd",
    Folgequest = "The Curious Visitor",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[27].Quests.Alliance[7] = {
    Title = "7. The Stockade's Search",
    Level = "24",
    Attain = "18",
    Aim = "Delve into the Stockades and find information on Martin Corinth.",
    Location = "Master Mathias Shaw <Leader of SI:7> (Stormwind - Old Town, Rogue district; "..yellow.."75.8,59.8"..white..")",
    Note = "You can find Martin Corinth's Information inside Sealed Documents Crate "..yellow.."[1]"..white.." in the room across the dungeon entrance.\nQuestline starts with quest 'Uncovering Mystery' at Lord Commander Ryke (Wetlands - Hawk's Vigil "..yellow.."36.4,67.3"..white.." under the tent)\nYou will get reward after you finish the last quest of the questline.",
    Prequest = "Robb's Report",
    Folgequest = "Investigating Corinth",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Valiant Medallion",
            ID = "81416",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Ambient Talisman",
            ID = "81417",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Magnificent Necklace",
            ID = "81418",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}

--------------- INST28 - The Sunken Temple ---------------
kQuestInstanceData[28] = {
    Story = "Over a thousand years ago, the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, attempted to bring back an ancient blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire buckled in upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows. There they erected a great temple to Hakkar - where they could prepare for his arrival into the physical world. The great dragon Aspect, Ysera, learned of the Atal'ai's plans and smashed the temple beneath the marshes. To this day, the temple's drowned ruins are guarded by the green dragons who prevent anyone from getting in or out. However, it is believed that some of the fanatical Atal'ai may have survived Ysera's wrath - and recommitted themselves to the dark service of Hakkar.",
    Caption = "The Sunken Temple",
    QAA = "19 Quests",
    QAH = "20 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[28].Quests.Alliance[1] = {
    Title = "1. Into The Temple of Atal'Hakkar",
    Level = "50",
    Attain = "41",
    Aim = "Gather 10 Atal'ai Tablets for Brohann Caskbelly in Stormwind.",
    Location = "Brohann Caskbelly (Stormwind - Dwarven District; "..yellow.."64,20"..white..")",
    Note = "The prequest line comes from the same NPC and has quite a few steps.\n\nYou can find the Tablets everywhere in the Temple, both outside and inside the instance.",
    Prequest = "In Search of The Temple -> Rhapsody's Tale",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Guardian Talisman",
            ID = "1490",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[2] = {
    Title = "2. Into the Depths",
    Level = "51",
    Attain = "46",
    Aim = "Find the Altar of Hakkar in the Sunken Temple in Swamp of Sorrows.",
    Location = "Marvon Rivetseeker (Tanaris; "..yellow.."52,45"..white..")",
    Note = "The Altar is at "..yellow.."[1]"..white..".\nAlliance questline starts at Angelas Moonbreeze (Feralas - Feathermoon Stronghold "..yellow.."31.8,45.6"..white..") with quest 'The Sunken Temple'.\nHorde questline starts at Witch Doctor Uzer'i (Feralas - Camp Mojache "..yellow.."74.4,43.4"..white..") with quest 'The Sunken Temple'.",
    Prequest = "The Stone Circle",
    Folgequest = "Secret of the Circle",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[28].Quests.Alliance[3] = {
    Title = "3. Secret of the Circle",
    Level = "51",
    Attain = "46",
    Aim = "Travel into the Sunken Temple and discover the secret hidden in the circle of statues.",
    Location = "Altar of Hakkar (Sunken Temple; "..yellow.."1"..white..")",
    Note = "You find the statues at "..yellow.."[1]"..white..". See map for order to activate them.",
    Prequest = "Into the Depths",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
        {
            Name = "Hakkari Urn",
            ID = "10773",
            Color = green,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[4] = {
    Title = "4. Haze of Evil",
    Level = "52",
    Attain = "47",
    Aim = "Collect 5 samples of Atal'ai Haze, then return to Muigin in Un'Goro Crater.",
    Location = "Gregan Brewspewer (Feralas; "..yellow.."45,25"..white..")",
    Note = "The Prequest 'Muigin and Larion' starts at Muigin (Un'Goro Crater - Marshal's Refuge; "..yellow.."42,9"..white.."). You get the Haze from Deep Lurkers, Murk Worms or Oozes in the Temple.",
    Prequest = "Muigin and Larion -> A Visit to Gregan",
    Folgequest = "No",
}
kQuestInstanceData[28].Quests.Alliance[5] = {
    Title = "5. The God Hakkar",
    Level = "53",
    Attain = "40",
    Aim = "Bring the Filled Egg of Hakkar to Yeh'kinya in Tanaris.",
    Location = "Yeh'kinya (Tanaris - Steamwheedle Port; "..yellow.."66,22"..white..")",
    Note = "The Questline starts with 'Screecher Spirits' at the same NPC (See "..yellow.."[Zul'Farrak]"..white..").\nYou have to use the Egg at "..yellow.."[3]"..white.." to start the Event. Once it starts enemies spawn and attack you. Some of them drop the blood of Hakkar. With this blood you can put out the torch around the circle. After this the Avatar of Hakkar spawns. You kill him and loot the 'Essence of Hakkar' which you use to fill the egg.",
    Prequest = "Screecher Spirits -> The Ancient Egg",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Avenguard Helm",
            ID = "10749",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_PLATE,
        },
        {
            Name = "Lifeforce Dirk",
            ID = "10750",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
        {
            Name = "Gemburst Circlet",
            ID = "10751",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[6] = {
    Title = "6. Jammal'an the Prophet",
    Level = "53",
    Attain = "38",
    Aim = "The Atal'ai Exile in The Hinterlands wants the Head of Jammal'an.",
    Location = "The Atal'ai Exile (The Hinterlands; "..yellow.."33,75"..white..")",
    Note = "You find Jammal'an at "..yellow.."[4]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Rainstrider Leggings",
            ID = "11123",
            Color = blue,
            Description = AQITEM_LEGS..AQITEM_CLOTH,
        },
        {
            Name = "Helm of Exile",
            ID = "11124",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[7] = {
    Title = "7. The Essence of Eranikus",
    Level = "55",
    Attain = "48",
    Aim = "Place the Essence of Eranikus in the Essence Font located in this lair in the Sunken Temple.",
    Location = "The Essence of Eranikus (drops from Shade of Eranikus; "..yellow.."[6]"..white..")",
    Note = "You find the Essence Font next to where Shade of Eranikus is at "..yellow.."[6]"..white..".\n"..red.."Don't"..white.."  sell or throw away reward trinket Chained Essence of Eranikus. You will need it for next quest at Itharius (Swamp and Sorrows - Itharius's Cave "..yellow.."[13.6,71.7]"..white..", after talking with him you will get an item that starts the quest.",
    Prequest = "No",
    Folgequest = "The Essence of Eranikus",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Chained Essence of Eranikus",
            ID = "10455",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[8] = {
    Title = "8. Trolls of a Feather",
    Level = "52",
    Attain = "50",
    Aim = "Bring a total of 6 Voodoo Feathers from the trolls in sunken temple.",
    Location = "Impsy (Felwood; "..yellow.."42,45"..white..")",
    Note = red.."Warlock only"..white..": Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center.",
    Prequest = "An Imp's Request -> The Wrong Stuff",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Soul Harvester",
            ID = "20536",
            Color = blue,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Abyss Shard",
            ID = "20534",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Robes of Servitude",
            ID = "20530",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[9] = {
    Title = "9. Voodoo Feathers",
    Level = "52",
    Attain = "50",
    Aim = "Bring the Voodoo Feathers from the trolls in the Sunken Temple to the Fallen Hero of the Horde.",
    Location = "Fallen Hero of the Horde (Swamp of Sorrows; "..yellow.."34,66"..white..")",
    Note = red.."Warrior only"..white..": Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center.\nHorde questline starts in Orgrimar at warrior trainer Sorek "..yellow.."80.4,32.3"..white..".",
    Prequest = "A Troubled Spirit -> War on the Shadowsworn",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Fury Visor",
            ID = "20521",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_PLATE,
        },
        {
            Name = "Diamond Flask",
            ID = "20130",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Razorsteel Shoulders",
            ID = "20517",
            Color = blue,
            Description = AQITEM_SHOULDER..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[10] = {
    Title = "10. A Better Ingredient",
    Level = "52",
    Attain = "50",
    Aim = "Retrieve a Putrid Vine from the guardian at the bottom of the Sunken Temple and return to Torwa Pathfinder.",
    Location = "Torwa Pathfinder (Un'Goro Crater; "..yellow.."72,76"..white..")",
    Note = red.."Druid only"..white..": The Putrid Vine drops from Atal'alarion who is summoned at "..yellow.."[1]"..white.." by activating the statues in the order listed on the map.",
    Prequest = "Torwa Pathfinder -> Toxic Test",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Grizzled Pelt",
            ID = "22274",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_LEATHER,
        },
        {
            Name = "Forest's Embrace",
            ID = "22272",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_LEATHER,
        },
        {
            Name = "Moonshadow Stave",
            ID = "22458",
            Color = blue,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[11] = {
    Title = "11. The Green Drake",
    Level = "52",
    Attain = "50",
    Aim = "Bring the Tooth of Morphaz to Ogtinc in Azshara. Ogtinc resides atop the cliffs northeast the Ruins of Eldarath.",
    Location = "Ogtinc (Azshara; "..yellow.."42,43"..white..")",
    Note = red.."Hunter only"..white..": Morphaz is at "..yellow.."[5]"..white..".",
    Prequest = "The Hunter's Charm -> Wavethrashing",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Hunting Spear",
            ID = "20083",
            Color = blue,
            Description = AQITEM_POLEARM,
        },
        {
            Name = "Devilsaur Eye",
            ID = "19991",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Devilsaur Tooth",
            ID = "19992",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[12] = {
    Title = "12. Destroy Morphaz",
    Level = "52",
    Attain = "50",
    Aim = "Retrieve the Arcane Shard from Morphaz and return to Archmage Xylem.",
    Location = "Archmage Xylem (Azshara; "..yellow.."29,40"..white..")",
    Note = red.."Mage only"..white..": Morphaz is at "..yellow.."[5]"..white..".",
    Prequest = "Magic Dust -> The Siren's Coral",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Glacial Spike",
            ID = "20035",
            Color = blue,
            Description = AQITEM_DAGGER,
        },
        {
            Name = "Arcane Crystal Pendant",
            ID = "20037",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Fire Ruby",
            ID = "20036",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[13] = {
    Title = "13. Blood of Morphaz",
    Level = "52",
    Attain = "50",
    Aim = "Kill Morphaz in the sunken temple of Atal'Hakkar, and return his blood to Greta Mosshoof in Felwood. The entrance to the sunken temple can be found in the Swamp of Sorrows.",
    Location = "Ogtinc (Azshara; "..yellow.."42,43"..white..")",
    Note = red.."Priest only"..white..": Morphaz is at "..yellow.."[5]"..white..". Greta Mosshoof is at Felwood - Emerald Sanctuary ("..yellow.."51,82"..white..").",
    Prequest = "Cenarion Aid -> The Ichor of Undeath",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Blessed Prayer Beads",
            ID = "19990",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Woestave",
            ID = "20082",
            Color = blue,
            Description = AQITEM_WAND,
        },
        {
            Name = "Circle of Hope",
            ID = "20006",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[14] = {
    Title = "14. The Azure Key",
    Level = "52",
    Attain = "50",
    Aim = "Return the Azure Key to Lord Jorach Ravenholdt.",
    Location = "Archmage Xylem (Azshara; "..yellow.."29,40"..white..")",
    Note = red.."Rogue only"..white..": The Azure Key drops from Morphaz at "..yellow.."[5]"..white..". Lord Jorach Ravenholdt is at Alterac Mountains - Ravenholdt ("..yellow.."86,79"..white..").",
    Prequest = "A Simple Request -> Encoded Fragments",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Ebon Mask",
            ID = "19984",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_LEATHER,
        },
        {
            Name = "Whisperwalk Boots",
            ID = "20255",
            Color = blue,
            Description = AQITEM_FEET..AQITEM_LEATHER,
        },
        {
            Name = "Duskbat Drape",
            ID = "19982",
            Color = blue,
            Description = AQITEM_BACK,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[15] = {
    Title = "15. Forging the Mightstone",
    Level = "52",
    Attain = "50",
    Aim = "Bring the voodoo feathers to Ashlam Valorfist.",
    Location = "Commander Ashlam Valorfist (Western Plaguelands - Chillwind Camp; "..yellow.."43,85"..white..")",
    Note = red.."Paladin only"..white..": Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center.",
    Prequest = "Inert Scourgestones",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Holy Mightstone",
            ID = "20620",
            Color = blue,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Lightforged Blade",
            ID = "20504",
            Color = blue,
            Description = AQITEM_SWORD,
        },
        {
            Name = "Sanctified Orb",
            ID = "20512",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Chivalrous Signet",
            ID = "20505",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[16] = {
    Title = "16. Eranikus, Tyrant of the Dream",
    Level = "60",
    Attain = "60",
    Aim = "Travel to the continent of Teldrassil and find Malfurion's agent somewhere outside the walls of Darnassus.",
    Location = "Malfurion Stormrage (Spawns at Shade of Eranikus; "..yellow.."[8]"..white..")",
    Note = "Forest Wisp (Teldrassil; "..yellow.."37,47"..white..")",
    Prequest = "The Charge of the Dragonflights",
    Folgequest = "Tyrande and Remulos",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[28].Quests.Alliance[17] = {
    Title = "17. By Any Means Necessary IV",
    Level = "53",
    Attain = "47",
    Aim = "Travel to the Sunken Temple, and find the Dragonkin Hazzas, slay him, and return the Heart of Hazzas to Niremius Darkwind.",
    Location = "Niremius Darkwind (Felwood; "..yellow.."40,30"..white..")",
    Note = "Drop from [7] boss. Reward from the next quest.",
    Prequest = "By Any Means Necessary I -> By Any Means Necessary II -> By Any Means Necessary III",
    Folgequest = "By Any Means Necessary V",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Darkwind Glaive",
            ID = "60536",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[18] = {
    Title = "18. Into the Dream III",
    Level = "60",
    Attain = "58",
    Aim = "Gather a Binding Fragment from Cliff Breakers in Azshara, Overloaded Arcane Prism from Arcane Torrents in the Western wing of Dire Maul, Slumberer's Shard from Weaver in the Sunken Temple and an Arcanite Rod. Report to Itharius in the Swamp of Sorrows with the collected items.",
    Location = "Ralathius (Hyjal - Nordanaar; "..yellow.."85,30"..white..")",
    Note = "Weaver "..yellow.."[6]"..white.." 1 of 4 dragons  drop Slumberer's Shard, will appear after killing Jammal'an the Prophet "..yellow.."[4]"..white..". Barrier to the Prophet will disappear after clearing 6 balcons "..blue.."[C]"..white.."\nFinishing this questline you get the necklace and you will be able to enter Hyjal raid instance Emerald Sanctum.",
    Prequest = "Into the Dream I -> Into the Dream II",
    Folgequest = "Into the Dream IV",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Gemstone of Ysera",
            ID = "50545",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[28].Quests.Alliance[19] = {
    Title = "19. The Riftwalker's Cane",
    Level = "54",
    Attain = "30",
    Aim = "Return with the Riftwalker's Cane to Akh Z'ador in Azshara.",
    Location = "Akh Z'ador (Azshara "..yellow.."51,37"..white..")",
    Note = "Quest line start from Sanv K'la (Swamp of Sorrows; "..yellow.."25, 30"..white.."). Jammal'an the Prophet "..yellow.."[4]."..white.."\nFinishing this questline you get a reward Pure Draenethyst Gemstone.",
    Prequest = "The Sanv Charm ->> Finding Akh Z'ador -> Rift Fatigue: Body",
    Folgequest = "Novice In A Barren Land",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Pure Draenethyst Gemstone",
            ID = "41385",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[28].Quests.Horde[1] = {
    Title = "1. The Temple of Atal'Hakkar",
    Level = "50",
    Attain = "38",
    Aim = "Collect 20 Fetishes of Hakkar and bring them to Fel'Zerul in Stonard.",
    Location = "Fel'Zerul (Swamp of Sorrows - Stonard; "..yellow.."47,54"..white..")",
    Note = "All Enemys in the Temple drop Fetishes.\nQuestline starts at Fel'Zerul (Swamp of Sorrows - Stonard; "..yellow.."47,54"..white..")",
    Prequest = "Pool of Tears -> Return to Fel'Zerul",
    Folgequest = "No",
    Rewards = kQuestInstanceData[28].Quests.Alliance[1].Rewards
}
kQuestInstanceData[28].Quests.Horde[2] = kQuestInstanceData[28].Quests.Alliance[2]
kQuestInstanceData[28].Quests.Horde[3] = kQuestInstanceData[28].Quests.Alliance[3]
kQuestInstanceData[28].Quests.Horde[4] = {
    Title = "4. Zapper Fuel",
    Level = "52",
    Attain = "47",
    Aim = "Deliver the Unloaded Zapper and 5 samples of Atal'ai Haze to Larion in Marshal's Refuge.",
    Location = "Liv Rizzlefix (Barrens; "..yellow.."62,38"..white..")",
    Note = "The Prequest 'Larion and Muigin' starts at Larion (Un'Goro Crater; "..yellow.."45,8"..white.."). You get the Haze from Deep Lurkers, Murk Worms or Oozes in the Temple.",
    Prequest = "Larion and Muigin -> Marvon's Workshop",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[28].Quests.Horde[5] = kQuestInstanceData[28].Quests.Alliance[5]
kQuestInstanceData[28].Quests.Horde[6] = kQuestInstanceData[28].Quests.Alliance[6]
kQuestInstanceData[28].Quests.Horde[7] = kQuestInstanceData[28].Quests.Alliance[7]
kQuestInstanceData[28].Quests.Horde[8] = kQuestInstanceData[28].Quests.Alliance[8]
kQuestInstanceData[28].Quests.Horde[9] = kQuestInstanceData[28].Quests.Alliance[9]
kQuestInstanceData[28].Quests.Horde[10] = kQuestInstanceData[28].Quests.Alliance[10]
kQuestInstanceData[28].Quests.Horde[11] = kQuestInstanceData[28].Quests.Alliance[11]
kQuestInstanceData[28].Quests.Horde[12] = kQuestInstanceData[28].Quests.Alliance[12]
kQuestInstanceData[28].Quests.Horde[13] = kQuestInstanceData[28].Quests.Alliance[13]
kQuestInstanceData[28].Quests.Horde[14] = kQuestInstanceData[28].Quests.Alliance[14]
kQuestInstanceData[28].Quests.Horde[15] = {
    Title = "15. Da Voodoo",
    Level = "52",
    Attain = "50",
    Aim = "Bring the voodoo feathers to Bath'rah the Windwatcher.",
    Location = "Bath'rah the Windwatcher (Alterac Mountains; "..yellow.."80,67"..white..")",
    Note = red.."Shaman only"..white..": Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center.",
    Prequest = "Spirit Totem",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Azurite Fists",
            ID = "20369",
            Color = blue,
            Description = AQITEM_HANDS..AQITEM_MAIL,
        },
        {
            Name = "Enamored Water Spirit",
            ID = "20503",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Wildstaff",
            ID = "20556",
            Color = blue,
            Description = AQITEM_STAFF,
        },
    }
}
kQuestInstanceData[28].Quests.Horde[16] = kQuestInstanceData[28].Quests.Alliance[16]
kQuestInstanceData[28].Quests.Horde[17] = kQuestInstanceData[28].Quests.Alliance[17]
kQuestInstanceData[28].Quests.Horde[18] = {
    Title = "18. The Maul'ogg Crisis VII",
    Level = "54",
    Attain = "45",
    Aim = "Venture into the depths of the Temple of Atal'Hakkar and gather the Atal'ai Rod, bring it to Insom'ni to finish the spell.",
    Location = "Insom'ni <The Great Hermit> (Kazon Island, north of Gillijim Isle "..yellow.."57.2,10.1"..white..")",
    Note = "Atal'ai Rod from the little green wooden chest on the floor behind Jammal'an the Prophet "..yellow.."[4]"..white..".\nQuestline starts at Haz'gorg the Great Seer (Stranglethorn Vale - Gillijim's Isle(west from Booty Bay) - Maul'Ogg Refuge, inside of the southeast cave "..yellow.."78.1,81"..white..".)\nYou will get the reward finishing last quest in the questline.",
    Prequest = "The Maul'ogg Crisis VI",
    Folgequest = "The Maul'ogg Crisis VIII",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "The Ogre Mantle",
            ID = "60346",
            Color = blue,
            Description = AQITEM_SHOULDER..AQITEM_LEATHER,
        },
        {
            Name = "Staff of the Ogre Seer",
            ID = "60347",
            Color = blue,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Favor of Cruk'Zogg",
            ID = "60348",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[28].Quests.Horde[19] = {
    Title = "19. Into the Dream III",
    Level = "60",
    Attain = "58",
    Aim = "Gather a Binding Fragment from Cliff Breakers in Azshara, Overloaded Arcane Prism from Arcane Torrents in the Western wing of Dire Maul, Slumberer's Shard from Weaver in the Sunken Temple and an Arcanite Rod. Report to Itharius in the Swamp of Sorrows with the collected items.",
    Location = "Ralathius (Hyjal - Nordanaar; "..yellow.."85,30"..white..")",
    Note = "Weaver "..yellow.."[6]"..white.." 1 of 4 dragons  drop Slumberer's Shard, will appear after killing Jammal'an the Prophet "..yellow.."[4]"..white..". Barrier to the Prophet will disappear after clearing 6 balcons "..blue.."[C]"..white.."\nFinishing this questline you get the necklace and you will be able to enter Hyjal raid instance Emerald Sanctum.",
    Prequest = "Into the Dream I -> Into the Dream II",
    Folgequest = "Into the Dream IV",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Gemstone of Ysera",
            ID = "50545",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[28].Quests.Horde[20] = {
    Title = "20. The Riftwalker's Cane",
    Level = "54",
    Attain = "30",
    Aim = "Return with the Riftwalker's Cane to Akh Z'ador in Azshara.",
    Location = "Akh Z'ador (Azshara "..yellow.."51,37"..white..")",
    Note = "Quest line start from Sanv K'la (Swamp of Sorrows; "..yellow.."25, 30"..white.."). Jammal'an the Prophet "..yellow.."[4]."..white.."\nFinishing this questline you get a reward Pure Draenethyst Gemstone.",
    Prequest = "The Sanv Charm ->> Finding Akh Z'ador -> Rift Fatigue: Body",
    Folgequest = "Novice In A Barren Land",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Pure Draenethyst Gemstone",
            ID = "41385",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}

--------------- INST29 - Temple of Ahn'Qiraj ---------------
kQuestInstanceData[29] = {
    Story = "At the heart of Ahn'Qiraj lies an ancient temple complex. Built in the time before recorded history, it is both a monument to unspeakable gods and a massive breeding ground for the qiraji army. Since the War of the Shifting Sands ended a thousand years ago, the Twin Emperors of the qiraji empire have been trapped inside their temple, barely contained behind the magical barrier erected by the bronze dragon Anachronos and the night elves. Now that the Scepter of the Shifting Sands has been reassembled and the seal has been broken, the way into the inner sanctum of Ahn'Qiraj is open. Beyond the crawling madness of the hives, beneath the Temple of Ahn'Qiraj, legions of qiraji prepare for invasion. They must be stopped at all costs before they can unleash their voracious insectoid armies on Kalimdor once again, and a second War of the Shifting Sands breaks loose!",
    Caption = "Temple of Ahn'Qiraj",
    QAA = "2 Quests",
    QAH = "2 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[29].Quests.Alliance[1] = {
    Title = "1. C'Thun's Legacy",
    Level = "60",
    Attain = "60",
    Aim = "Take the Eye of C'Thun to Caelastrasz in the Temple of Ahn'Qiraj.",
    Location = "Eye of C'Thun (drops from C'Thun; "..yellow.."[9]"..white..")",
    Note = "Caelestrasz (Temple of Ahn'Qiraj; "..yellow.."2'"..white..")\nRewards listed are for the followup.",
    Prequest = "No",
    Folgequest = "The Savior of Kalimdor",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Amulet of the Fallen God",
            ID = "21712",
            Color = purple,
            Description = AQITEM_NECK,
        },
        {
            Name = "Cloak of the Fallen God",
            ID = "21710",
            Color = purple,
            Description = AQITEM_BACK,
        },
        {
            Name = "Ring of the Fallen God",
            ID = "21709",
            Color = purple,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[29].Quests.Alliance[2] = {
    Title = "2. Secrets of the Qiraji",
    Level = "60",
    Attain = "60",
    Aim = "Take the Ancient Qiraji Artifact to the dragons hiding near the entrance of the temple.",
    Location = "Ancient Qiraji Artifact (random drop in Temple of Ahn'Qiraj)",
    Note = "Turns in to Andorgos (Temple of Ahn'Qiraj; "..yellow.."1'"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[29].Quests.Horde[1] = kQuestInstanceData[29].Quests.Alliance[1]
kQuestInstanceData[29].Quests.Horde[2] = kQuestInstanceData[29].Quests.Alliance[2]

--------------- INST30 - Zul'Farrak ---------------
kQuestInstanceData[30] = {
    Story = "This sun-blasted city is home to the Sandfury trolls, known for their particular ruthlessness and dark mysticism. Troll legends tell of a powerful sword called Sul'thraze the Lasher, a weapon capable of instilling fear and weakness in even the most formidable of foes. Long ago, the weapon was split in half. However, rumors have circulated that the two halves may be found somewhere within Zul'Farrak's walls. Reports have also suggested that a band of mercenaries fleeing Gadgetzan wandered into the city and became trapped. Their fate remains unknown. But perhaps most disturbing of all are the hushed whispers of an ancient creature sleeping within a sacred pool at the city's heart - a mighty demigod who will wreak untold destruction upon any adventurer foolish enough to awaken him.",
    Caption = "Zul'Farrak",
    QAA = "8 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[30].Quests.Alliance[1] = {
    Title = "1. Nekrum's Medallion",
    Level = "47",
    Attain = "40",
    Aim = "Bring Nekrum's Medallion to Thadius Grimshade in the Blasted Lands.",
    Location = "Thadius Grimshade (The Blasted Lands - Nethergarde Keep; "..yellow.."66,19"..white..")",
    Note = "The Questline starts at Gryphon Master Talonaxe (The Hinterlands - Wildhammer Stronghold; "..yellow.."9,44"..white..").\nNekrum spawns at "..yellow.."[4]"..white.." with the final crowd you fight for the Temple event.",
    Prequest = "Witherbark Cages -> Thadius Grimshade",
    Folgequest = "The Divination",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[30].Quests.Alliance[2] = {
    Title = "2. Troll Temper",
    Level = "45",
    Attain = "40",
    Aim = "Bring 20 Vials of Troll Temper to Trenton Lighthammer in Gadgetzan.",
    Location = "Trenton Lighthammer (Tanaris - Gadgetzan; "..yellow.."51,28"..white..")",
    Note = "Every Troll can drop the Tempers.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[30].Quests.Alliance[3] = {
    Title = "3. Scarab Shells",
    Level = "45",
    Attain = "40",
    Aim = "Bring 5 Uncracked Scarab Shells to Tran'rek in Gadgetzan.",
    Location = "Tran'rek (Tanaris - Gadgetzan; "..yellow.."51,26"..white..")",
    Note = "The prequest starts at Krazek (Stranglethorn Vale - Booty Bay; "..yellow.."25,77"..white..").\nEvery Scarab can drop the Shells. A lot of Scarabs are at "..yellow.."[2]"..white..".",
    Prequest = "Tran'rek",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[30].Quests.Alliance[4] = {
    Title = "4. Tiara of the Deep",
    Level = "46",
    Attain = "40",
    Aim = "Bring the Tiara of the Deep to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; "..yellow.."46,57"..white..")",
    Note = "Hydromancer Velratha drops the Tiara of the Deep at "..yellow.."[6]"..white..".",
    Prequest = "Tabetha's Task",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Spellshifter Rod",
            ID = "9527",
            Color = green,
            Description = AQITEM_STAFF,
        },
        {
            Name = "Gemshale Pauldrons",
            ID = "9531",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[30].Quests.Alliance[5] = {
    Title = "5. The Prophecy of Mosh'aru",
    Level = "47",
    Attain = "40",
    Aim = "Bring the First and Second Mosh'aru Tablets to Yeh'kinya in Tanaris.",
    Location = "Yeh'kinya (Tanaris - Steamwheedle Port; "..yellow.."66,22"..white..")",
    Note = "You get the prequest from the same NPC.\nThe Tablets drop from Theka the Martyr at "..yellow.."[2]"..white.." and Hydromancer Velratha at "..yellow.."[6]"..white..".",
    Prequest = "Screecher Spirits",
    Folgequest = "The Ancient Egg",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[30].Quests.Alliance[6] = {
    Title = "6. Divino-matic Rod",
    Level = "47",
    Attain = "40",
    Aim = "Bring the Divino-matic Rod to Chief Engineer Bilgewhizzle in Gadgetzan.",
    Location = "Chief Engineer Bilgewhizzle (Tanaris - Gadgetzan; "..yellow.."52,28"..white..")",
    Note = "You get the Rod from Sergeant Bly. You can find him at "..yellow.."[4]"..white.." after the Temple event.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Masons Fraternity Ring",
            ID = "9533",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Engineer's Guild Headpiece",
            ID = "9534",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[30].Quests.Alliance[7] = {
    Title = "7. Gahz'rilla",
    Level = "50",
    Attain = "40",
    Aim = "Bring Gahz'rilla's Electrified Scale to Wizzle Brassbolts in the Shimmering Flats.",
    Location = "Wizzle Brassbolts (Thousands Needles - Mirage Raceway; "..yellow.."78,77"..white..")",
    Note = "You get the prequest from Klockmort Spannerspan (Dun Morogh - Gnomeregan Reclamation Facility; "..yellow.."23.6,28"..white.."). It is not necessary to have the prequest to get the Gahz'rilla quest.\nYou summon Gahz'rilla at "..yellow.."[6]"..white.." with the Mallet of Zul'Farrak.\nThe Sacred Mallet comes from Qiaga the Keeper (The Hinterlands - The Altar of Zul; "..yellow.."49,70"..white..") and must be completed at the Altar in Jinta'Alor at "..yellow.."59,77"..white.." before it can be used in Zul'Farrak.",
    Prequest = "The Brassbolts Brothers",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Carrot on a Stick",
            ID = "11122",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[30].Quests.Alliance[8] = {
    Title = "8. Drifting Across the Sand",
    Level = "46",
    Attain = "40",
    Aim = "Venture into Zul'Farrak and find the Ancient Troll Remains, then return them to Hansu Go'sha at the Southmoon Ruins in Tanaris.",
    Location = "Hansu Go'sha (Tanaris; "..yellow.."42,73"..white..")",
    Note = "In the room with Witch Doctor Zum'Rah "..yellow.."[3]"..white.." Ancient Burial Container (little green wooden box).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Southmoon Pendant",
            ID = "60759",
            Color = green,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[30].Quests.Horde[1] = {
    Title = "1. The Spider God",
    Level = "45",
    Attain = "40",
    Aim = "Read from the Tablet of Theka to learn the name of the Witherbark spider god, then return to Master Gadrin.",
    Location = "Meister Gadrin (Durotar - Sen'jin Village; "..yellow.."55,74"..white..")",
    Note = "The Questline starts at a Venom Bottle, which is found on tables in Troll Villages in The Hinterlands.\nYou find the Tablet at "..yellow.."[2]"..white..".",
    Prequest = "Venom Bottles -> Consult Master Gadrin",
    Folgequest = "Summoning Shadra",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[30].Quests.Horde[2] = kQuestInstanceData[30].Quests.Alliance[2]
kQuestInstanceData[30].Quests.Horde[3] = kQuestInstanceData[30].Quests.Alliance[3]
kQuestInstanceData[30].Quests.Horde[4] = kQuestInstanceData[30].Quests.Alliance[4]
kQuestInstanceData[30].Quests.Horde[5] = kQuestInstanceData[30].Quests.Alliance[5]
kQuestInstanceData[30].Quests.Horde[6] = kQuestInstanceData[30].Quests.Alliance[6]
kQuestInstanceData[30].Quests.Horde[7] = kQuestInstanceData[30].Quests.Alliance[7]
kQuestInstanceData[30].Quests.Horde[8] = kQuestInstanceData[30].Quests.Alliance[8]
kQuestInstanceData[30].Quests.Horde[9] = {
    Title = "9. End Ukorz Sandscalp",
    Level = "48",
    Attain = "40",
    Aim = "Slay Ukorz Sandscalp and Ruuzlu "..yellow.."[7]"..white.." within Zul'Farrak for Champion Taza'go at Sandmoon Village in Tanaris.",
    Location = "Champion Taza'go (Tanaris - Sandmoon Village; northeast corner of Tanaris, northwest from Steamwheedle Port)",
    Note = "The Questline starts with quest 'Sandfury Redemption I' at Seer Maz'ek in Sandmoon Village(Tanaris) "..yellow.."59.1,17.1"..white..".",
    Prequest = "Plight of the Sandfury",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "The Dune Blade",
            ID = "60764",
            Color = green,
            Description = AQITEM_MAINHAND..AQITEM_SWORD,
        },
        {
            Name = "Sandmoon Greaves",
            ID = "60765",
            Color = green,
            Description = AQITEM_LEGS..AQITEM_MAIL,
        },
    }
}

--------------- INST31 - Zul'Gurub ---------------
kQuestInstanceData[31] = {
    Story = {
        ["Page1"] = "Over a thousand years ago the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, called forth the avatar of an ancient and terrible blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire collapsed upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows, where they erected a great temple to Hakkar in order to prepare for his arrival into the physical world.",
        ["Page2"] = "In time, the Atal'ai priests discovered that Hakkar's physical form could only be summoned within the ancient capital of the Gurubashi Empire, Zul'Gurub. Unfortunately, the priests have met with recent success in their quest to call forth Hakkar - reports confirm the presence of the dreaded Soulflayer in the heart of the Gurubashi ruins.\n\nIn order to quell the blood god, the trolls of the land banded together and sent a contingent of High Priests into the ancient city. Each priest was a powerful champion of the Primal Gods - Bat, Panther, Tiger, Spider, and Snake - but despite their best efforts, they fell under the sway of Hakkar. Now the champions and their Primal God aspects feed the awesome power of the Soulflayer. Any adventurers brave enough to venture into the foreboding ruins must overcome the High Priests if they are to have any hope of confronting the mighty blood god.",
        ["MaxPages"] = "2",
    },
    Caption = "Zul'Gurub",
    QAA = "4 Quests",
    QAH = "4 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[31].Quests.Alliance[1] = {
    Title = "1. A Collection of Heads",
    Level = "60",
    Attain = "58",
    Aim = "String 5 Channeler's Heads, then return the Collection of Troll Heads to Exzhal on Yojamba Isle.",
    Location = "Exzhal (Stranglethorn Vale - Yojamba Isle; "..yellow.."15,15"..white..")",
    Note = "Make sure you loot all the priests.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Belt of Shrunken Heads",
            ID = "20213",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_PLATE,
        },
        {
            Name = "Belt of Shriveled Heads",
            ID = "20215",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_MAIL,
        },
        {
            Name = "Belt of Preserved Heads",
            ID = "20216",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_LEATHER,
        },
        {
            Name = "Belt of Tiny Heads",
            ID = "20217",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[31].Quests.Alliance[2] = {
    Title = "2. The Heart of Hakkar",
    Level = "60",
    Attain = "58",
    Aim = "Bring the Heart of Hakkar to Molthor on Yojamba Isle.",
    Location = "Heart of Hakkar (drops from Hakkar; "..yellow.."[11]"..white..")",
    Note = "Molthor (Stranglethorn Vale - Yojamba Isle; "..yellow.."15,15"..white..")",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Zandalarian Hero Badge",
            ID = "19948",
            Color = purple,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Zandalarian Hero Charm",
            ID = "19950",
            Color = purple,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Zandalarian Hero Medallion",
            ID = "19949",
            Color = purple,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[31].Quests.Alliance[3] = {
    Title = "3. Nat's Measuring Tape",
    Level = "60",
    Attain = "58",
    Aim = "Return Nat's Measuring Tape to Nat Pagle in Dustwallow Marsh.",
    Location = "Battered Tackle Box (Zul'Gurub - Northeast by water from Hakkar's Island)",
    Note = "Nat Pagle is at Dustwallow Marsh ("..yellow.."59,60"..white.."). Turning the quest in allows you to buy Mudskunk Lures from Nat Pagle to summon Gahz'ranka in Zul'Gurub.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[31].Quests.Alliance[4] = {
    Title = "4. The Perfect Poison",
    Level = "60",
    Attain = "60",
    Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac.",
    Location = "Dirk Thunderwood (Silithus - Cenarion Hold; "..yellow.."52,39"..white..")",
    Note = "Venoxis's Venom Sac drops from High priest Venoxis in "..yellow.."Zul'Gurub"..white.." at "..yellow.."[2]"..white..". Kurinnaxx's Venom Sac drops in the "..yellow.."Ruins of Ahn'Qiraj"..white.." at "..yellow.."[1]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4"..AQDiscription_OR..white.."5"..AQDiscription_OR..white.."6",
        {
            Name = "Ravenholdt Slicer",
            ID = "22378",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
        {
            Name = "Shivsprocket's Shiv",
            ID = "22379",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_DAGGER,
        },
        {
            Name = "The Thunderwood Poker",
            ID = "22377",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_DAGGER,
        },
        {
            Name = "Doomulus Prime",
            ID = "22348",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
        {
            Name = "Fahrad's Reloading Repeater",
            ID = "22347",
            Color = blue,
            Description = AQITEM_CROSSBOW,
        },
        {
            Name = "Simone's Cultivating Hammer",
            ID = "22380",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[31].Quests.Horde[1] = kQuestInstanceData[31].Quests.Alliance[1]
kQuestInstanceData[31].Quests.Horde[2] = kQuestInstanceData[31].Quests.Alliance[2]
kQuestInstanceData[31].Quests.Horde[3] = kQuestInstanceData[31].Quests.Alliance[3]
kQuestInstanceData[31].Quests.Horde[4] = kQuestInstanceData[31].Quests.Alliance[4]

--------------- INST32 - Gnomeregan ---------------
kQuestInstanceData[32] = {
    Story = "Located in Dun Morogh, the technological wonder known as Gnomeregan has been the gnomes' capital city for generations. Recently, a hostile race of mutant troggs infested several regions of Dun Morogh - including the great gnome city. In a desperate attempt to destroy the invading troggs, High Tinker Mekkatorque ordered the emergency venting of the city's radioactive waste tanks. Several gnomes sought shelter from the airborne pollutants as they waited for the troggs to die or flee. Unfortunately, though the troggs became irradiated from the toxic assault - their siege continued, unabated. Those gnomes who were not killed by noxious seepage were forced to flee, seeking refuge in the nearby dwarven city of Ironforge. There, High Tinker Mekkatorque set out to enlist brave souls to help his people reclaim their beloved city. It is rumored that Mekkatorque's once-trusted advisor, Mekgineer Thermaplugg, betrayed his people by allowing the invasion to happen. Now, his sanity shattered, Thermaplug remains in Gnomeregan - furthering his dark schemes and acting as the city's new techno-overlord.",
    Caption = "Gnomeregan",
    QAA = "13 Quests",
    QAH = "7 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[32].Quests.Alliance[1] = {
    Title = "1. Save Techbot's Brain!",
    Level = "26",
    Attain = "20",
    Aim = "Bring Techbot's Memory Core to Tinkmaster Overspark at the Gnomeregan Reclamation Facility.",
    Location = "Tinkmaster Overspark (Dun Morogh - Gnomeregan Reclamation Facility; "..yellow.."24.4,29.8"..white..")",
    Note = "You get the prequest from Brother Sarno (Stormwind - Cathedral Square; "..yellow.."40,30"..white..").\nYou find Techbot before you enter the instance near the backdoor, at "..yellow.."[4] on Entrance Map"..white..".",
    Prequest = "Tinkmaster Overspark",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Alliance[2] = {
    Title = "2. Gnogaine",
    Level = "27",
    Attain = "20",
    Aim = "Use the Empty Leaden Collection Phial on Irradiated Invaders or Irradiated Pillagers to collect radioactive fallout. Once it is full, take it back to Ozzie Togglevolt in Kharanos.",
    Location = "Ozzie Togglevolt (Dun Morogh - Kharanos; "..yellow.."45,49"..white..")",
    Note = "You get the prequest from Gnoarn (Dun Morogh - Gnomeregan Reclamation Facility; "..yellow.."24.5,30.4"..white..").\nTo get fallout you musst use the Phial on "..red.."alive"..white.." Irradiated Invaders or Irradiated Pillagers.",
    Prequest = "The Day After",
    Folgequest = "The Only Cure is More Green Glow",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Alliance[3] = {
    Title = "3. The Only Cure is More Green Glow",
    Level = "30",
    Attain = "20",
    Aim = "Travel to Gnomeregan and bring back High Potency Radioactive Fallout. Be warned, the fallout is unstable and will collapse rather quickly.\nOzzie will also require your Heavy Leaden Collection Phial when the task is complete.",
    Location = "Ozzie Togglevolt (Dun Morogh - Kharanos; "..yellow.."45,49"..white..")",
    Note = "To get fallout you must use the Phial on "..red.."alive"..white.." Irradiated Slimes or Horrors.",
    Prequest = "Gnogaine",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Alliance[4] = {
    Title = "4. Gyrodrillmatic Excavationators",
    Level = "30",
    Attain = "20",
    Aim = "Bring twenty-four Robo-mechanical Guts to Shoni in Stormwind.",
    Location = "Shoni the Silent (Stormwind - Dwarven District; "..yellow.."55,12"..white..")",
    Note = "All Robots can drop the Robo-mechanical Guts.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Shoni's Disarming Tool",
            ID = "9608",
            Color = green,
            Description = AQITEM_OFFHAND..AQITEM_AXE,
        },
        {
            Name = "Shilly Mitts",
            ID = "9609",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[32].Quests.Alliance[5] = {
    Title = "5. Essential Artificials",
    Level = "30",
    Attain = "24",
    Aim = "Bring 12 Essential Artificials to Klockmort Spannerspan at the Gnomeregan Reclamation Facility",
    Location = "Klockmort Spannerspan (Dun Morogh - Gnomeregan Reclamation Facility; "..yellow.."23.6,28"..white..")",
    Note = "You get the prequest from Mathiel (Darnassus - Warrior's Terrace; "..yellow.."59,45"..white.."). The prequest is only a pointer quest and is not required to get this quest.\nThe Essential Artificials come from machines scattered around the instance.",
    Prequest = "Klockmort's Essentials",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Alliance[6] = {
    Title = "6. Data Rescue",
    Level = "30",
    Attain = "25",
    Aim = "Bring a Prismatic Punch Card to Master Mechanic Castpipe at the Gnomeregan Reclamation Facility.",
    Location = "Master Mechanic Castpipe (Dun Morogh - Gnomeregan Reclamation Facility; "..yellow.."24.1,29.8"..white..")",
    Note = "You get the prequest from Gaxim Rustfizzle (Stonetalon Mountains; "..yellow.."59,67"..white.."). The prequest is only a pointer quest and is not required to get this quest.\nThe white card is a random drop. You find the first terminal next to the back entrance before you enter the instance at "..yellow.."[3] on Entrance Map"..white..". The 3005-B is at "..yellow.."[3]"..white..", the 3005-C at "..yellow.."[5]"..white.." and the 3005-D is at "..yellow.."[6]"..white..".",
    Prequest = "Castpipe's Task",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Repairman's Cape",
            ID = "9605",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Mechanic's Pipehammer",
            ID = "9604",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[32].Quests.Alliance[7] = {
    Title = "7. A Fine Mess",
    Level = "30",
    Attain = "24",
    Aim = "Escort Kernobee to the Clockwerk Run exit and then report to Scooty in Booty Bay.",
    Location = "Kernobee (Gnomeregan; "..yellow.."[3]"..white..")",
    Note = "Escort quest! You find Scooty in Stranglethorn Vale - Booty Bay ("..yellow.."27,77"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Fire-welded Bracers",
            ID = "9535",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
        {
            Name = "Fairywing Mantle",
            ID = "9536",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[32].Quests.Alliance[8] = {
    Title = "8. The Grand Betrayal",
    Level = "35",
    Attain = "25",
    Aim = "Venture to Gnomeregan and kill Mekgineer Thermaplugg. Return to High Tinker Mekkatorque when the task is complete.",
    Location = "High Tinker Mekkatorque (Dun Morogh - Gnomeregan Reclamation Facility; "..yellow.."24.2,29.7"..white..")",
    Note = "You find Thermaplugg at "..yellow.."[8]"..white..". He is the last boss in Gnomeregan.\nDuring the fight you have to disable the columns through pushing the button on the side.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Civinad Robes",
            ID = "9623",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
        {
            Name = "Triprunner Dungarees",
            ID = "9624",
            Color = blue,
            Description = AQITEM_LEGS..AQITEM_LEATHER,
        },
        {
            Name = "Dual Reinforced Leggings",
            ID = "9625",
            Color = blue,
            Description = AQITEM_LEGS..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[32].Quests.Alliance[9] = {
    Title = "9. Grime-Encrusted Ring",
    Level = "34",
    Attain = "28",
    Aim = "Figure out a way to remove the grime from the Grime-Encrusted Ring.",
    Location = "Grime-Encrusted Ring (random drop from Gnomeregan)",
    Note = "The Ring can be cleaned off at the Sparklematic 5200 in the Clean Room at "..yellow.."[2]"..white..".",
    Prequest = "No",
    Folgequest = "Return of the Ring",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Alliance[10] = {
    Title = "10. Return of the Ring",
    Level = "34",
    Attain = "28",
    Aim = "You may either keep the ring, or you may find the person responsible for the imprint and engravings on the inside of the band.",
    Location = "Brilliant Gold Ring (obtained from Grime-Encrusted Ring quest)",
    Note = "Turns in to Talvash del Kissel (Ironforge - Mystic Ward; "..yellow.."36,3"..white.."). The followup to enhance the ring is optional.",
    Prequest = "Grime-Encrusted Ring",
    Folgequest = "Gnome Improvement",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Brilliant Gold Ring",
            ID = "9362",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[32].Quests.Alliance[11] = {
    Title = "11. A Pounding Brain",
    Level = "30",
    Attain = "30",
    Aim = "Find Someone who can figure out what to do with the Mainframe.",
    Location = "Intact Pounder Mainframe",
    Note = "Intact Pounder Mainframe that starts the quest can drop from Crowd Pummeler 9-60 "..yellow.."[6]"..white.." (low chance).\n"..red.."Available for ENGINEERS with 125+ skill.",
    Prequest = "No",
    Folgequest = "To Build a Pounder",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Alliance[12] = {
    Title = "12. High Energy Regulator",
    Level = "33",
    Attain = "25",
    Aim = "Find the Schematic: High Energy Regulator within Gnomeregan and bring it to Weezan Littlegear at the Gnomeregan Reclamation Facility in Dun Morogh.",
    Location = "Weezan Littlegear (Dun Morogh - Gnomeregan Reclamation Facility "..yellow.."[25.2,31.6]"..white..")",
    Note = "Schematic: High Energy Regulator is on the table at "..yellow.."[3]"..white.." southeastern corner lower south chamber "..yellow.."[a]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Low Energy Regulator",
            ID = "61393",
            Color = green,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[32].Quests.Alliance[13] = {
    Title = "13. Backup System Activation",
    Level = "33",
    Attain = "25",
    Aim = "Activate the Alpha Channel Valve "..yellow.."[6]"..white.." and the Reserve Pump Channel Lever "..yellow.."[b]"..white.." deep within Gnomeregan for Master Technician Wirespanner in Dun Morogh.",
    Location = "Master Technician Wirespanner (Dun Morogh - Gnomeregan Reclamation Facility "..yellow.."[26.8,31.1]"..white..")",
    Note = "Alpha Channel Valve is at "..yellow.."[6]"..white..", use elevetaor to go down. south side of the central mechanism.\nReserve Pump Channel Lever is at "..yellow.."[b]"..white.." on the floor.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Intricate Gnomish Blunderbuss",
            ID = "61383",
            Color = blue,
            Description = AQITEM_GUN,
        },
        {
            Name = "Ionized Metal Grips",
            ID = "61384",
            Color = blue,
            Description = AQITEM_HANDS..AQITEM_MAIL,
        },
        {
            Name = "Magnetic Band",
            ID = "61385",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[32].Quests.Horde[1] = {
    Title = "1. Gnomer-gooooone!",
    Level = "35",
    Attain = "20",
    Aim = "Wait for Scooty to calibrate the Goblin Transponder.",
    Location = "Scooty (Stranglethorn Vale - Booty Bay; "..yellow.."27,77"..white..")",
    Note = "You get the prequest from Sovik (Orgrimmar - Valley of Honor; "..yellow.."75,25"..white..").\nWhen you complete this quest you can use the transponder in Booty Bay.",
    Prequest = "Chief Engineer Scooty",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Horde[2] = {
    Title = "2. A Fine Mess",
    Level = "30",
    Attain = "24",
    Aim = "Escort Kernobee to the Clockwerk Run exit and then report to Scooty in Booty Bay.",
    Location = "Kernobee (Gnomeregan; "..yellow.."[3]"..white..")",
    Note = "Escort quest! You find Scooty in Stranglethorn Vale - Booty Bay ("..yellow.."27,77"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Fire-welded Bracers",
            ID = "9535",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_MAIL,
        },
        {
            Name = "Fairywing Mantle",
            ID = "9536",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[32].Quests.Horde[3] = {
    Title = "3. Rig Wars",
    Level = "35",
    Attain = "25",
    Aim = "Retrieve the Rig Blueprints and Thermaplugg's Safe Combination from Gnomeregan and bring them to Nogg in Orgrimmar.",
    Location = "Nogg (Orgrimmar - Valley of Honor; "..yellow.."75,25"..white..")",
    Note = "You find Thermaplugg at "..yellow.."[8]"..white..". He is the last boss in Gnomeregan.\nDuring the fight you have to disable the columns through pushing the button on the side.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Civinad Robes",
            ID = "9623",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
        {
            Name = "Triprunner Dungarees",
            ID = "9624",
            Color = blue,
            Description = AQITEM_LEGS..AQITEM_LEATHER,
        },
        {
            Name = "Dual Reinforced Leggings",
            ID = "9625",
            Color = blue,
            Description = AQITEM_LEGS..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[32].Quests.Horde[4] = {
    Title = "4. Grime-Encrusted Ring",
    Level = "34",
    Attain = "28",
    Aim = "Figure out a way to remove the grime from the Grime-Encrusted Ring.",
    Location = "Grime-Encrusted Ring (random drop from Gnomeregan)",
    Note = "The Ring can be cleaned off at the Sparklematic 5200 in the Clean Room at "..yellow.."[2]"..white..".",
    Prequest = "No",
    Folgequest = "Return of the Ring",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Horde[5] = {
    Title = "5. Return of the Ring",
    Level = "34",
    Attain = "28",
    Aim = "You may either keep the ring, or you may find the person responsible for the imprint and engravings on the inside of the band.",
    Location = "Brilliant Gold Ring (obtained from Grime-Encrusted Ring quest)",
    Note = "Turns in to Nogg (Orgrimmar - The Valley of Honor; "..yellow.."75,25"..white.."). The followup to enhance the ring is optional.",
    Prequest = "Grime-Encrusted Ring",
    Folgequest = "Nogg's Ring Redo",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Brilliant Gold Ring",
            ID = "9362",
            Color = green,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[32].Quests.Horde[6] = {
    Title = "6. A Pounding Brain",
    Level = "30",
    Attain = "30",
    Aim = "Find Someone who can figure out what to do with the Mainframe.",
    Location = "Intact Pounder Mainframe",
    Note = "Intact Pounder Mainframe that starts the quest can drop from Crowd Pummeler 9-60 "..yellow.."[6]"..white.." (low chance).\n"..red.."Available for ENGINEERS with 125+ skill.",
    Prequest = "No",
    Folgequest = "To Build a Pounder",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[32].Quests.Horde[7] = {
    Title = "7. Backup Capacitor",
    Level = "34",
    Attain = "29",
    Aim = "Bring the Megaflux Capacitor to Technician Grimzlow.",
    Location = "Technician Grimzlow (Durotar - Sparkwater Port "..yellow.."57.4,25.7"..white..").",
    Note = "Prequest 'A New Power Source' starts at Technician Spuzzle(Durotar - Sparkwater Port "..yellow.."57.4,25.8"..white..") at level 7 .\nMegaflux Capacitor drops from Mekgineer Thermaplugg. You find Mekgineer Thermaplugg at "..yellow.."[8]"..white..". He is the last boss in Gnomeregan.\nDuring the fight you have to disable the columns through pushing the button on the side.",
    Prequest = "A New Power Source",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Razorblade Buckler",
            ID = "81319",
            Color = blue,
            Description = AQITEM_SHIELD,
        },
        {
            Name = "Crackling Zapper",
            ID = "81320",
            Color = blue,
            Description = AQITEM_WAND,
        },
    }
}

--------------- INST33 - Dragons of Nightmare ---------------
kQuestInstanceData[33] = {
    Story = {
	    ["Page1"] = "There is a disturbance at the Great Trees. A new threat menaces these secluded areas found in Ashenvale, Duskwood, Feralas, and Hinterlands. Four great guardians of the green Dragonflight have arrived from the Dream, but these once-proud protectors now seek only destruction and death. Take arms with your fellows and march to these hidden groves -- only you can defend Azeroth from the corruption they bring.",
	    ["Page2"] = "Ysera, the great Dreaming dragon Aspect rules over the enigmatic Green dragonflight. Her domain is the fantastic, mystical realm of the Emerald Dream - and it is said that from there she guides the evolutionary path of the world itself. She is the protector of nature and imagination, and it is the charge of her flight to guard all of the Great Trees across the world, which only druids use to enter the Dream itself. In recent times, Ysera's most trusted lieutenants have been warped by a dark new power within the Emerald Dream. Now these wayward sentinels have passed through the Great Trees into Azeroth, intending to spread madness and terror throughout the mortal kingdoms. Even the mightiest of adventurers would be well advised to give the dragons a wide berth, or suffer the consequences of their misguided wrath.",
	    ["Page3"] = "Lethon's exposure to the aberration within the Emerald Dream not only darkened the hue of the mighty dragon's scales, but also empowered him with the ability to extract malevolent shades from his enemies. Once joined with their master, the shades imbue the dragon with healing energies. It should come as no surprise, then, that Lethon is considered to be among the most formidable of Ysera's wayward lieutenants",
	    ["Page4"] = "A  mysterious dark power within the Emerald Dream has transformed the once-majestic Emeriss into a rotting, diseased monstrosity. Reports from the few who have survived encounters with the dragon have told horrifying tales of putrid mushrooms erupting from the corpses of their dead companions. Emeriss is truly the most gruesome and appalling of Ysera's estranged green dragons.",
	    ["Page5"] = "Taerar was perhaps the most affected of Ysera's rogue lieutenants. His interaction with the dark force within the Emerald Dream shattered Taerar's sanity as well as his corporeal form. The dragon now exists as a specter with the ability to split into multiple entities, each of which possesses destructive magical powers. Taerar is a cunning and relentless foe who is intent on turning the madness of his existence into reality for the inhabitants of Azeroth.",
	    ["Page6"] = "Once one of Ysera's most trusted lieutenants, Ysondre has now gone rogue, sewing terror and chaos across the land of Azeroth. Her formerly beneficent healing powers have given way to dark magics, enabling her to cast smoldering lightning waves and summon the aid of fiendish druids. Ysondre and her kin also possess the ability to induce sleep, sending her unfortunate mortal foes to the realm of their most terrifying nightmares.",
	    ["MaxPages"] = "6",
    },
    Caption = {
        "Dragons of Nightmare",
        "Ysera and the Green Dragonflight",
        "Lethon",
        "Emeriss",
        "Taerar",
        "Ysondre",
    },
    QAA = "1 Quest",
    QAH = "1 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[33].Quests.Alliance[1] = {
    Title = "1. Shrouded in Nightmare",
    Level = "60",
    Attain = "60",
    Aim = "Find someone capable of deciphering the meaning behind the Nightmare Engulfed Object.\n\nPerhaps a druid of great power could assist you.",
    Location = "Nightmare Engulfed Object (drops from Emeriss, Taerar, Lethon or Ysondre)",
    Note = "Quest turns in to Keeper Remulos at (Moonglade - Shrine of Remulos; "..yellow.."36,41"..white.."). Reward listed is for the followup.",
    Prequest = "No",
    Folgequest = "Waking Legends",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Malfurion's Signet Ring",
            ID = "20600",
            Color = purple,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[33].Quests.Horde[1] = kQuestInstanceData[33].Quests.Alliance[1]

--------------- INST34 - Azuregos ---------------
kQuestInstanceData[34] = {
    Story = "Before the Great Sundering, the night elf city of Eldarath flourished in the land that is now known as Azshara. It is believed that many ancient and powerful Highborne artifacts may be found among the ruins of the once-mighty stronghold. For countless generations, the Blue Dragon Flight has safeguarded powerful artifacts and magical lore, ensuring that they do not fall into mortal hands. The presence of Azuregos, the Blue dragon, seems to suggest that items of extreme significance, perhaps the fabled Vials of Eternity themselves, may be found in the wilderness of Azshara. Whatever Azuregos seeks, one thing is certain: he will fight to the death to defend Azshara's magical treasures.",
    Caption = "Azuregos",
    QAA = "2 Quests",
    QAH = "2 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[34].Quests.Alliance[1] = {
    Title = "1. Ancient Sinew Wrapped Lamina",
    Level = "60",
    Attain = "60",
    Aim = "Hastat the Ancient has asked that you bring him a Mature Blue Dragon Sinew. Should you find this sinew, return it to Hastat in Felwood.",
    Location = "Hastat the Ancient (Felwood - Irontree Woods; "..yellow.."48,24"..white..")",
    Note = red.."Hunter only"..white..": Kill Azuregos to get the Mature Blue Dragon Sinew. He walks around the middle of the southern peninsula in Azshara near "..yellow.."[1]"..white..".",
    Prequest = "The Ancient Leaf ("..yellow.."Molten Core"..white..")", -- 7632",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Ancient Sinew Wrapped Lamina",
            ID = "18714",
            Color = purple,
            Description = AQITEM_QUIVER,
        },
    }
}
kQuestInstanceData[34].Quests.Alliance[2] = {
    Title = "2. Azuregos's Magical Ledger",
    Level = "60",
    Attain = "60",
    Aim = "Deliver Azuregos's Magical Ledger to Narain Soothfancy in Tanaris.",
    Location = "Spirit of Azuregos (Azshara; "..yellow.."56,83"..white..")",
    Note = "You can find Narain Soothfancy in Tanaris at "..yellow.."65.17"..white..".",
    Prequest = "The Charge of the Dragonflights",
    Folgequest = "Translating the Ledger",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[34].Quests.Horde[1] = kQuestInstanceData[34].Quests.Alliance[1]
kQuestInstanceData[34].Quests.Horde[2] = kQuestInstanceData[34].Quests.Alliance[2]

--------------- INST35 - Lord Kazzak ---------------
kQuestInstanceData[35] = {
    Story = "Following the defeat of the Burning Legion at the end of the Third War, the remaining enemy forces, led by the colossal demon Lord Kazzak, pulled back to the Blasted Lands. They continue to dwell there to this day in an area called the Tainted Scar, awaiting the reopening of the Dark Portal. It is rumored that once the Portal is reopened, Kazzak will travel with his remaining forces to Outland. Once the orc homeworld of Draenor, Outland was ripped apart by the simultaneous activation of several portals created by the orc shaman Ner'zhul, and now exists as a shattered world occupied by legions of demonic agents under command of the night elf betrayer, Illidan.",
    Caption = "Lord Kazzak",
    QAA = "No Quests",
    QAH = "No Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}

--------------- INST36 - Alterac Valley ---------------
kQuestInstanceData[36] = {
    Story = "Long ago, before the First War, the warlock Gul'dan exiled a clan of orcs called the Frostwolves to a hidden valley deep in the heart of the Alterac Mountains. It is here in the valley's southern reaches that the Frostwolves eked out a living until the coming of Thrall.\nAfter Thrall's triumphant uniting of the clans, the Frostwolves, now led by the Orc Shaman Drek'Thar, chose to remain in the valley they had for so long called their home. In recent times, however, the relative peace of the Frostwolves has been challenged by the arrival of the Dwarven Stormpike Expedition.\nThe Stormpikes have set up residence in the valley to search for natural resources and ancient relics. Despite their intentions, the Dwarven presence has sparked heated conflict with the Frostwolf Orcs to the south, who have vowed to drive the interlopers from their lands. ",
    Caption = "Alterac Valley",
    QAA = "17 Quests",
    QAH = "17 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[36].Quests.Alliance[1] = {
    Title = "1. The Sovereign Imperative",
    Level = "60",
    Attain = "51",
    Aim = "Travel to Alterac Valley in the Hillsbrad Foothills. Outside of the entrance tunnel, find and speak with Lieutenant Haggerdin.",
    Location = "Lieutenant Rotimer (Ironforge - The Commons; "..yellow.."30,62"..white..")",
    Note = "Lieutenant Haggerdin is at (Alterac Mountains; "..yellow.."39,81"..white..").",
    Prequest = "No",
    Folgequest = "Proving Grounds",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[2] = {
    Title = "2. Proving Grounds",
    Level = "60",
    Attain = "51",
    Aim = "Travel to the Icewing Caverns located southwest of Dun Baldar in Alterac Valley and recover the Stormpike Banner. Return the Stormpike Banner to Lieutenant Haggerdin in the Alterac Mountains.",
    Location = "Lieutenant Haggerdin (Alterac Mountains; "..yellow.."39,81"..white..")",
    Note = "The Stormpike Banner is in the Icewing Cavern at "..yellow.."[11]"..white.." on the Alterac Valley - North map. Talk to the same NPC each time you gain a new Reputation level for an upgraded Insignia.\n\nThe prequest is not necessary to obtain this quest, but it does yield about 9550 experience.",
    Prequest = "The Sovereign Imperative",
    Folgequest = "Rise and Be Recognized -> The Eye of Command",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Stormpike Insignia Rank 1",
            ID = "17691",
            Color = green,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "The Frostwolf Artichoke",
            ID = "19484",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[36].Quests.Alliance[3] = {
    Title = "3. The Battle of Alterac",
    Level = "60",
    Attain = "51",
    Aim = "Enter Alterac Valley, defeat the Horde general Drek'thar, and then return to Prospector Stonehewer in the Alterac Mountains.",
    Location = "Prospector Stonehewer (Alterac Mountains; "..yellow.."41,80"..white..") and\n(Alterac Valley - North; "..yellow.."[B]"..white..")",
    Note = "Drek'thar is at (Alterac Valley - South; "..yellow.."[B]"..white.."). He does not actually need to be killed to complete the quest. The battleground just has to be won by your side in any manner.\nAfter turning this quest in, talk to the NPC again for the reward.",
    Prequest = "No",
    Folgequest = "Hero of the Stormpike",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Bloodseeker",
            ID = "19107",
            Color = blue,
            Description = AQITEM_CROSSBOW,
        },
        {
            Name = "Ice Barbed Spear",
            ID = "19106",
            Color = blue,
            Description = AQITEM_POLEARM,
        },
        {
            Name = "Wand of Biting Cold",
            ID = "19108",
            Color = blue,
            Description = AQITEM_WAND,
        },
        {
            Name = "Cold Forged Hammer",
            ID = "20648",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[36].Quests.Alliance[4] = {
    Title = "4. The Quartermaster",
    Level = "60",
    Attain = "51",
    Aim = "Speak with the Stormpike Quartermaster.",
    Location = "Mountaineer Boombellow (Alterac Valley - North; "..yellow.."Near [3] Before Bridge"..white..")",
    Note = "The Stormpike Quartermaster is at (Alterac Valley - North; "..yellow.."[7]"..white..") and provides more quests.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[5] = {
    Title = "5. Coldtooth Supplies",
    Level = "60",
    Attain = "51",
    Aim = "Bring 10 Coldtooth Supplies to the Alliance Quartermaster in Dun Baldar.",
    Location = "Stormpike Quartermaster (Alterac Valley - North; "..yellow.."[7]"..white..")",
    Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - South; "..yellow.."[6]"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[6] = {
    Title = "6. Irondeep Supplies",
    Level = "60",
    Attain = "51",
    Aim = "Bring 10 Irondeep Supplies to the Alliance Quartermaster in Dun Baldar.",
    Location = "Stormpike Quartermaster (Alterac Valley - North; "..yellow.."[7]"..white..")",
    Note = "The supplies can be found in the Irondeep Mine at (Alterac Valley - North; "..yellow.."[1]"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[7] = {
    Title = "7. Armor Scraps",
    Level = "60",
    Attain = "51",
    Aim = "Bring 20 Armor Scraps to Murgot Deepforge in Dun Baldar.",
    Location = "Murgot Deepforge (Alterac Valley - North; "..yellow.."[4]"..white..")",
    Note = "Loot the corpse of enemy players for scraps. The followup is just the same, quest, but repeatable.",
    Prequest = "No",
    Folgequest = "More Armor Scraps",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[8] = {
    Title = "8. Capture a Mine",
    Level = "60",
    Attain = "51",
    Aim = "Capture a mine that the Stormpike does not control, then return to Sergeant Durgen Stormpike in the Alterac Mountains.",
    Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..yellow.."37,77"..white..")",
    Note = "To complete the quest, you must kill either Morloch in the Irondeep Mine at (Alterac Valley - North; "..yellow.."[1]"..white..") or Taskmaster Snivvle in the Coldtooth Mine at (Alterac Valley - South; "..yellow.."[6]"..white..") while the Horde control it.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[9] = {
    Title = "9. Towers and Bunkers",
    Level = "60",
    Attain = "51",
    Aim = "Destroy the banner at an enemy tower or bunker, then return to Sergeant Durgen Stormpike in the Alterac Mountains.",
    Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..yellow.."37,77"..white..")",
    Note = "Reportedly, the Tower or Bunker need not actually be destroyed to complete the quest, just assaulted.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[10] = {
    Title = "10. Alterac Valley Graveyards",
    Level = "60",
    Attain = "51",
    Aim = "Assault a graveyard, then return to Sergeant Durgen Stormpike in the Alterac Mountains.",
    Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..yellow.."37,77"..white..")",
    Note = "Reportedly you do not need to do anything but be near a graveyard when the Alliance assaults it. It does not need to be captured, just assaulted.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[11] = {
    Title = "11. Empty Stables",
    Level = "60",
    Attain = "51",
    Aim = "Locate an Alterac Ram in Alterac Valley. Use the Stormpike Training Collar when you are near the Alterac Ram to 'tame' the beast. Once tamed, the Alterac Ram will follow you back to the Stable Master. Speak with the Stable Master to earn credit for the capture.",
    Location = "Stormpike Stable Master (Alterac Valley - North; "..yellow.."[6]"..white..")",
    Note = "You can find a Ram outside the base. The taming process is just like that of a Hunter taming a pet. The quest is repeatable up to a total of 25 times per battleground by the same player or players. After 25 Rams have been tamed, the Stormpike Cavalry will arrive to assist in the battle.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[12] = {
    Title = "12. Ram Riding Harnesses",
    Level = "60",
    Attain = "51",
    Aim = "You must strike at our enemy's base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go!",
    Location = "Stormpike Ram Rider Commander (Alterac Valley - North; "..yellow.."[6]"..white..")",
    Note = "Frostwolves can be found in the southern area of Alterac Valley.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[13] = {
    Title = "13. Crystal Cluster",
    Level = "60",
    Attain = "51",
    Aim = "There are times which you may be entrenched in battle for days or weeks on end. During those longer periods of activity you may end up collecting large clusters of the Frostwolf's storm crystals.\n\nThe Circle accepts such offerings.",
    Location = "Arch Druid Renferal (Alterac Valley - North; "..yellow.."[2]"..white..")",
    Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; "..yellow.."[19]"..white.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[14] = {
    Title = "14. Ivus the Forest Lord",
    Level = "60",
    Attain = "51",
    Aim = "The Frostwolf Clan is protected by a taint of elemental energy. Their shaman meddle in powers that will surely destroy us all if left unchecked.\n\nThe Frostwolf soldiers carry elemental charms called storm crystals. We can use the charms to conjure Ivus. Venture forth and claim the crystals.",
    Location = "Arch Druid Renferal (Alterac Valley - North; "..yellow.."[2]"..white..")",
    Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; "..yellow.."[19]"..white.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[15] = {
    Title = "15. Call of Air - Slidore's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "My gryphons are poised to strike at the front lines but cannot make the attack until the lines are thinned out.\n\nThe Frostwolf warriors charged with holding the front lines wear medals of service proudly upon their chests. Rip those medals off their rotten corpses and bring them back here.\n\nOnce the front line is sufficiently thinned out, I will make the call to air! Death from above!",
    Location = "Wing Commander Slidore (Alterac Valley - North; "..yellow.."[8]"..white..")",
    Note = "Kill Horde NPCs for the Frostwolf Soldier's Medal.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[16] = {
    Title = "16. Call of Air - Vipore's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "The elite Frostwolf units that guard the lines must be dealt with, soldier! I'm tasking you with thinning out that herd of savages. Return to me with medals from their lieutenants and legionnaires. When I feel that enough of the riff-raff has been dealt with, I'll deploy the air strike.",
    Location = "Wing Commander Vipore (Alterac Valley - North; "..yellow.."[8]"..white..")",
    Note = "Kill Horde NPCs for the Frostwolf Lieutenant's Medal.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Alliance[17] = {
    Title = "17. Call of Air - Ichman's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "Return to the battlefield and strike at the heart of the Frostwolf's command. Take down their commanders and guardians. Return to me with as many of their medals as you can stuff in your pack! I promise you, when my gryphons see the bounty and smell the blood of our enemies, they will fly again! Go now!",
    Location = "Wing Commander Ichman (Alterac Valley - North; "..yellow.."[8]"..white..")",
    Note = "Kill Horde NPCs for the Frostwolf Commander's Medals. After turning in 50, Wing Commander Ichman will either send a gryphon to attack the Horde base or give you a beacon to plant in the Snowfall Graveyard. If the beacon is protected long enough a gryphon will come to defend it.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[1] = {
    Title = "1. In Defense of Frostwolf",
    Level = "60",
    Attain = "51",
    Aim = "Venture to Alterac Valley, located in the Alterac Mountains. Find and speak with Warmaster Laggrond - who stands outside the tunnel entrance - to begin your career as a soldier of Frostwolf. You will find Alterac Valley north of Tarren Mill at the base of the Alterac Mountains.",
    Location = "Frostwolf Ambassador Rokhstrom (Orgrimmar - Valley of Strength "..yellow.."50,71"..white..")",
    Note = "Warmaster Laggrond is at (Alterac Mountains "..yellow.."62,59"..white..").",
    Prequest = "No",
    Folgequest = "Proving Grounds",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[2] = {
    Title = "2. Proving Grounds",
    Level = "60",
    Attain = "51",
    Aim = "Travel to the Wildpaw cavern located southeast of the main base in Alterac Valley and find the Frostwolf Banner. Return the Frostwolf Banner to Warmaster Laggrond.",
    Location = "Warmaster Laggrond (Alterac Mountains; "..yellow.."62,59"..white..")",
    Note = "The Frostwolf Banner is in the Wildpaw Cavern at (Alterac Valley - South; "..yellow.."[9]"..white.."). Talk to the same NPC each time you gain a new Reputation level for an upgraded Insignia.\n\nThe prequest is not necessary to obtain this quest, but it does yield about 9550 experience.",
    Prequest = "In Defense of Frostwolf",
    Folgequest = "Rise and Be Recognized -> The Eye of Command",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Frostwolf Insignia Rank 1",
            ID = "17690",
            Color = green,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Peeling the Onion",
            ID = "19483",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[36].Quests.Horde[3] = {
    Title = "3. The Battle for Alterac",
    Level = "60",
    Attain = "51",
    Aim = "Enter Alterac Valley and defeat the dwarven general, Vanndar Stormpike. Then, return to Voggah Deathgrip in the Alterac Mountains.",
    Location = "Voggah Deathgrip (Alterac Mountains; "..yellow.."64,60"..white..")",
    Note = "Vanndar Stormpike is at (Alterac Valley - North; "..yellow.."[B]"..white.."). He does not actually need to be killed to complete the quest. The battleground just has to be won by your side in any manner.\nAfter turning this quest in, talk to the NPC again for the reward.",
    Prequest = "No",
    Folgequest = "Hero of the Frostwolf",
    Rewards = kQuestInstanceData[36].Quests.Alliance[3].Rewards
}
kQuestInstanceData[36].Quests.Horde[4] = {
    Title = "4. Speak with our Quartermaster",
    Level = "60",
    Attain = "51",
    Aim = "Speak with the Frostwolf Quartermaster.",
    Location = "Jotek (Alterac Valley - South; "..yellow.."[8]"..white..")",
    Note = "The Frostwolf Quartermaster is at "..yellow.."[10]"..white.." and provides more quests.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[5] = {
    Title = "5. Coldtooth Supplies",
    Level = "60",
    Attain = "51",
    Aim = "Bring 10 Coldtooth Supplies to the Horde Quatermaster in Frostwolf Keep.",
    Location = "Frostwolf Quartermaster (Alterac Valley - South; "..yellow.."[10]"..white..")",
    Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - South; "..yellow.."[6]"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[6] = {
    Title = "6. Irondeep Supplies",
    Level = "60",
    Attain = "51",
    Aim = "Bring 10 Irondeep Supplies to the Horde Quartermaster in Frostwolf Keep.",
    Location = "Frostwolf Quartermaster (Alterac Valley - South; "..yellow.."[10]"..white..")",
    Note = "The supplies can be found in the Irondeep Mine at (Alterac Valley - North; "..yellow.."[1]"..white..").",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[7] = {
    Title = "7. Enemy Booty",
    Level = "60",
    Attain = "51",
    Aim = "Bring 20 Armor Scraps to Smith Regzar in Frostwolf Village.",
    Location = "Smith Regzar (Alterac Valley - South; "..yellow.."[8]"..white..")",
    Note = "Loot the corpse of enemy players for scraps. The followup is just the same, quest, but repeatable.",
    Prequest = "No",
    Folgequest = "More Booty!",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[8] = {
    Title = "8. Capture a Mine",
    Level = "60",
    Attain = "51",
    Aim = "Capture a mine, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains.",
    Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..yellow.."66,55"..white..")",
    Note = "To complete the quest, you must kill either Morloch in the Irondeep Mine at (Alterac Valley - North; "..yellow.."[1]"..white..") or Taskmaster Snivvle in the Coldtooth Mine at (Alterac Valley - South; "..yellow.."[6]"..white..") while the Alliance control it.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[9] = {
    Title = "9. Towers and Bunkers",
    Level = "60",
    Attain = "51",
    Aim = "Capture an enemy tower, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains.",
    Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..yellow.."66,55"..white..")",
    Note = "Reportedly, the Tower or Bunker need not actually be destroyed to complete the quest, just assaulted.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[10] = {
    Title = "10. The Graveyards of Alterac",
    Level = "60",
    Attain = "51",
    Aim = "Assault a graveyard, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains.",
    Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..yellow.."66,55"..white..")",
    Note = "Reportedly you do not need to do anything but be near a graveyard when the Horde assaults it. It does not need to be captured, just assaulted.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[11] = {
    Title = "11. Empty Stables",
    Level = "60",
    Attain = "51",
    Aim = "Locate a Frostwolf in Alterac Valley. Use the Frostwolf Muzzle when you are near the Frostwolf to 'tame' the beast. Once tamed, the Frostwolf will follow you back to the Frostwolf Stable Master. Speak with the Frostwolf Stable Master to earn credit for the capture.",
    Location = "Frostwolf Stable Master (Alterac Valley - South; "..yellow.."[9]"..white..")",
    Note = "You can find a Frostwolf outside the base. The taming process is just like that of a Hunter taming a pet. The quest is repeatable up to a total of 25 times per battleground by the same player or players. After 25 Rams have been tamed, the Frostwolf Cavalry will arrive to assist in the battle.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[12] = {
    Title = "12. Ram Hide Harnesses",
    Level = "60",
    Attain = "51",
    Aim = "You must strike at the indigenous rams of the region. The very same rams that the Stormpike cavalry uses as mounts!\n\nSlay them and return to me with their hides. Once we have gathered enough hides, we will fashion harnesses for the riders. The Frostwolf Wolf Riders will ride once more!",
    Location = "Frostwolf Wolf Rider Commander (Alterac Valley - South; "..yellow.."[9]"..white..")",
    Note = "The Rams can be found in the northern area of Alterac Valley.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[13] = {
    Title = "13. A Gallon of Blood",
    Level = "60",
    Attain = "51",
    Aim = "You have the option of offering larger quantities of the blood taken from our enemies. I will be glad to accept gallon sized offerings.",
    Location = "Primalist Thurloga (Alterac Valley - South; "..yellow.."[8]"..white..")",
    Note = "After turning in 150 or so Blood, Primalist Thurloga will begin walking towards (Alterac Valley - South; "..yellow.."[14]"..white.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[14] = {
    Title = "14. Lokholar the Ice Lord",
    Level = "60",
    Attain = "51",
    Aim = "You must strike down our enemies and bring to me their blood. Once enough blood has been gathered, the ritual of summoning may begin.\n\nVictory will be assured when the elemental lord is loosed upon the Stormpike army.",
    Location = "Primalist Thurloga (Alterac Valley - South; "..yellow.."[8]"..white..")",
    Note = "After turning in 150 or so Blood, Primalist Thurloga will begin walking towards (Alterac Valley - South; "..yellow.."[14]"..white.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[15] = {
    Title = "15. Call of Air - Guse's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "My riders are set to make a strike on the central battlefield; but first, I must wet their appetites - preparing them for the assault.\n\nI need enough Stormpike Soldier Flesh to feed a fleet! Hundreds of pounds! Surely you can handle that, yes? Get going!",
    Location = "Wing Commander Guse (Alterac Valley - South; "..yellow.."[13]"..white..")",
    Note = "Kill Horde NPCs for the Stormpike Soldier's Flesh. Reportedly 90 flesh are needed to make the Wing Commander do whatever she does.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[16] = {
    Title = "16. Call of Air - Jeztor's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "My War Riders must taste in the flesh of their targets. This will ensure a surgical strike against our enemies!\n\nMy fleet is the second most powerful in our air command. Thusly, they will strike at the more powerful of our adversaries. For this, then, they need the flesh of the Stormpike Lieutenants.",
    Location = "Wing Commander Jeztor (Alterac Valley - South; "..yellow.."[13]"..white..")",
    Note = "Kill Alliance NPCs for the Stormpike Lieutenant's Flesh.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[36].Quests.Horde[17] = {
    Title = "17. Call of Air - Mulverick's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "First, my war riders need targets to gun for - high priority targets. I'm going to need to feed them the flesh of Stormpike Commanders. Unfortunately, those little buggers are entrenched deep behind enemy lines! You've definitely got your work cut out for you.",
    Location = "Wing Commander Mulverick (Alterac Valley - South; "..yellow.."[13]"..white..")",
    Note = "Kill Alliance NPCs for the Stormpike Commander's Flesh.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST37 - Arathi Basin ---------------
kQuestInstanceData[37] = {
    Story = "Arathi Basin, located in Arathi Highlands, is a fast and exciting Battleground. The Basin itself is rich with resources and coveted by both the Horde and the Alliance. The Forsaken Defilers and the League of Arathor have arrived at Arathi Basin to wage war over these natural resources and claim them on behalf of their respective sides.",
    Caption = "Arathi Basin",
    QAA = "3 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[37].Quests.Alliance[1] = {
    Title = "1. The Battle for Arathi Basin!",
    Level = "55",
    Attain = "50",
    Aim = "Assault the mine, the lumber mill, the blacksmith and the farm, then return to Field Marshal Oslight in Refuge Pointe.",
    Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..yellow.."46,45"..white..")",
    Note = "The locations to be assaulted are marked on the map as 2 through 5.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[37].Quests.Alliance[2] = {
    Title = "2. Control Four Bases",
    Level = "60",
    Attain = "60",
    Aim = "Enter Arathi Basin, capture and control four bases at the same time, and then return to Field Marshal Oslight at Refuge Pointe.",
    Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..yellow.."46,45"..white..")",
    Note = "You need to be Friendly with the League of Arathor to get this quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[37].Quests.Alliance[3] = {
    Title = "3. Control Five Bases",
    Level = "60",
    Attain = "60",
    Aim = "Control 5 bases in Arathi Basin at the same time, then return to Field Marshal Oslight at Refuge Pointe.",
    Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..yellow.."46,45"..white..")",
    Note = "You need to be Exalted with the League of Arathor to get this quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Arathor Battle Tabard",
            ID = "20132",
            Color = white,
            Description = AQITEM_TABARD,
        },
    }
}
kQuestInstanceData[37].Quests.Horde[1] = {
    Title = "1. The Battle for Arathi Basin!",
    Level = "25",
    Attain = "25",
    Aim = "Assault the Arathi Basin mine, lumber mill, blacksmith and stable, and then return to Deathmaster Dwire in Hammerfall.",
    Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..yellow.."74,35"..white..")",
    Note = "The locations to be assaulted are marked on the map as 1 through 4.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[37].Quests.Horde[2] = {
    Title = "2. Take Four Bases",
    Level = "60",
    Attain = "60",
    Aim = "Hold four bases at the same time in Arathi Basin, and then return to Deathmaster Dwire in Hammerfall.",
    Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..yellow.."74,35"..white..")",
    Note = "You need to be Friendly with The Defilers to get this quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[37].Quests.Horde[3] = {
    Title = "3. Take Five Bases",
    Level = "60",
    Attain = "60",
    Aim = "Hold five bases in Arathi Basin at the same time, then return to Deathmaster Dwire in Hammerfall.",
    Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..yellow.."74,35"..white..")",
    Note = "You need to be Exalted with The Defilers to get this quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Battle Tabard of the Defilers",
            ID = "20131",
            Color = white,
            Description = AQITEM_TABARD,
        },
    }
}

--------------- INST38 - Warsong Gulch ---------------
kQuestInstanceData[38] = {
    Story = "Nestled in the southern region of Ashenvale forest, Warsong Gulch is near the area where Grom Hellscream and his Orcs chopped away huge swaths of forest during the events of the Third War. Some orcs have remained in the vicinity, continuing their deforestation to fuel the Horde's expansion. They call themselves the Warsong Outriders.\nThe Night Elves, who have begun a massive push to retake the forests of Ashenvale, are now focusing their attention on ridding their land of the Outriders once and for all. And so, the Silverwing Sentinels have answered the call and sworn that they will not rest until every last Orc is defeated and cast out of Warsong Gulch. ",
    Caption = "Warsong Gulch",
    QAA = "No Quests",
    QAH = "No Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}

--------------- INST39 - The Crescent Grove ---------------
kQuestInstanceData[39] = {
    Story = "A hidden grove in southern Ashenvale overlooking Mystral Lake that was once a retreat for druids for several years, an evil presence has taken root in the region.\nOriginally a hidden grove that served as a calm retreat for druids, in recent times the Groveweald tribe has moved in while fleeing the madness of the Foulweald tribe, expelling several of the original inhabitants in the process. However, in spite of their attempts to escape the madness, they succumbed to it in time.\nKalanar Brightshine once lived here, before he was expelled from the Grove by the Groveweald furbolgs and his home was burned down.\nDemonic forces of the Burning Legion led by the doomguard Master Raxxieth have established themselves within the grove, beginning to corrupt the glade. Already, the Legion has left their mark in the form of the Vilethorn Scar, upsetting the balance and disturbing spirits.",
    Caption = "The Crescent Grove",
    QAA = "4 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[39].Quests.Alliance[1] = {
    Title = "1. The Rampant Groveweald",
    Level = "33",
    Attain = "26",
    Aim = "Venture into the Crescent Grove and collect 8 Groveweald Badges from the furbolgs inside for Grol the Exile.",
    Location = "Grol the Exile (Ashenvale "..yellow.."56,59"..white..")",
    Note = "Drop from furbolgs.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[39].Quests.Alliance[2] = {
    Title = "2. The Unwise Elders",
    Level = "34",
    Attain = "26",
    Aim = "Bring the paws of Elder 'One Eye' and Elder Blackmaw from within the Crescent Grove to Grol the Exile.",
    Location = "Grol the Exile (Ashenvale "..yellow.."56,59"..white..")",
    Note = "Drop from furbolgs near first boss.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Grol's Band",
            ID = "60179",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[39].Quests.Alliance[3] = {
    Title = "3. The Crescent Grove",
    Level = "37",
    Attain = "28",
    Aim = "Destroy the source of corruption inside Crescent Grove.",
    Location = "Denatharion <Druid Trainer> (Teldrassil - Darnassus "..yellow.."24,48"..white..")",
    Note = "You need to kill the last boss.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Chain of Denatharion",
            ID = "60180",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_MAIL,
        },
        {
            Name = "Cloak of Denatharion",
            ID = "60181",
            Color = blue,
            Description = AQITEM_BACK,
        },
        {
            Name = "Epaulets of Denatharion",
            ID = "60182",
            Color = blue,
            Description = AQITEM_SHOULDER..AQITEM_CLOTH,
        },
        {
            Name = "Mask of Denatharion",
            ID = "60183",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[39].Quests.Alliance[4] = {
    Title = "4. Kalanar's Mallet",
    Level = "33",
    Attain = "25",
    Aim = "Travel to the Crescent Grove and find the burned down home of Kalanar Brightshine. Then retrieve Kalanar's Mallet and return it to him in Astranaar.",
    Location = "Kalanar Brightshine (Ashenvale "..yellow.."36,52"..white..")",
    Note = "Contained in Kalanar's Strongbox.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[39].Quests.Horde[1] = kQuestInstanceData[39].Quests.Alliance[1]
kQuestInstanceData[39].Quests.Horde[2] = kQuestInstanceData[39].Quests.Alliance[2]
kQuestInstanceData[39].Quests.Horde[3] = {
    Title = "3. Rooting Out Evil",
    Level = "37",
    Attain = "26",
    Aim = "Venture into the Crescent Grove and root out the evil inside.",
    Location = "Loruk Foreststrider (Ashenvale - Splintertree Post "..yellow.."73,59"..white..")",
    Note = "The Questline starts at Loruk Foreststrider too. You need to kill the last boss.",
    Prequest = "Mysteries of the Grove -> Feran's Report",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Chain of Loruk",
            ID = "60213",
            Color = blue,
            Description = AQITEM_CHEST..AQITEM_MAIL,
        },
        {
            Name = "Cloak of Loruk",
            ID = "60214",
            Color = blue,
            Description = AQITEM_BACK,
        },
        {
            Name = "Shoulders of Loruk",
            ID = "60215",
            Color = blue,
            Description = AQITEM_SHOULDER..AQITEM_LEATHER,
        },
        {
            Name = "Hat of Loruk",
            ID = "60216",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
    }
}

--------------- INST41 - Karazhan Crypt ---------------
kQuestInstanceData[41] = {
    Story = "Karazhan Crypt is an instance dungeon located in the Deadwind Pass. Something is twisting the dead back to life in the forlorn catacombs, find the source so the dead may rest again.",
    Caption = "Karazhan Crypt",
    QAA = "2 Quest",
    QAH = "2 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[41].Quests.Alliance[1] = {
    Title = "1. The Mystery of Karazhan VII",
    Level = "60",
    Attain = "58",
    Aim = "Venture forth into the Karazhan Crypts, once inside slay Alarus, the watcher of the Crypts for Magus Ariden Dusktower in Deadwind Pass.",
    Location = "Magus Ariden Dusktower (Deadwind Pass "..yellow.."52,34"..white..")",
    Note = "Karazhan Crypt Key from (The Mystery of Karazhan VI) quest. You can find Alarus at [5].",
    Prequest = "The Mystery of Karazhan I >> The Mystery of Karazhan VI",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Arcane Charged Pendant",
            ID = "60463",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Orb of Kaladoon",
            ID = "60464",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
        {
            Name = "Arcane Strengthened Band",
            ID = "60465",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[41].Quests.Alliance[2] = {
    Title = "2. No Honor Among Chefs",
    Level = "61",
    Attain = "60",
    Aim = "Slay the Ravenous Strigoi in Karazhan Crypts and return to The Cook in Lower Karazhan Halls.",
    Location = "The Cook near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Drop from [Ravenous Strigoi].\nThe quest line starts [Recipes of Kezan] drop in "..yellow.."[Tower of Karazhan]"..white..".",
    Prequest = "A Chef's Majesty",
    Folgequest = "No",
    Rewards = {
        {
            Name = "Recipe: Empowering Herbal Salad",
            ID = "92045",
            Color = blue,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[41].Quests.Horde[1] = {
    Title = "1. The Depths of Karazhan VII",
    Level = "60",
    Attain = "58",
    Aim = "Venture forth into the Karazhan Crypts, once inside slay Alarus, the watcher of the Crypts for Kor'gan in Stonard.",
    Location = "Kor'gan (Swamp of Sorrows "..yellow.."44,55"..white..")",
    Note = "Karazhan Crypt Key from (The Depths of Karazhan VI) quest.You can find Alarus at [5].",
    Prequest = "The Depths of Karazhan I >> The Depths of Karazhan VI",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Charged Arcane Ring",
            ID = "60459",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Tusk of Gardon",
            ID = "60460",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Blackfire Orb",
            ID = "60461",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[41].Quests.Horde[2] = kQuestInstanceData[41].Quests.Alliance[2]

--------------- INST45 - Caverns Of Time: Black Morass ---------------
kQuestInstanceData[45] = {
    Story = "",
    Caption = "Caverns Of Time: Black Morass",
    QAA = "4 Quest",
    QAH = "4 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[45].Quests.Alliance[1] = {
    Title = "1. The First Opening of The Dark Portal",
    Level = "60",
    Attain = "60",
    Aim = "Enter the Timeways into Black Morass's past and slay Antnormi. Bring her head to Kheyna.",
    Location = "Chromie (Tanaris - Caverns of Time "..yellow.."57,59"..white..")",
    Note = "Quest line start from Lizzarik <Weapon Dealer> (The Barrens - patrol from Crossroads to Ratchet "..yellow.."57,37"..white.."). Drop from [4].",
    Prequest = "A Glittering Opportunity > A Bloody Good Deed > A Letter From a Friend >> A Journey Into The Caverns",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "X-51 Arcane Ocular Implants",
            ID = "82950",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_CLOTH,
        },
        {
            Name = "X-52 Stealth Ocular Implants",
            ID = "82951",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_LEATHER,
        },
        {
            Name = "X-53 Ranger Ocular Implants",
            ID = "82952",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_MAIL,
        },
        {
            Name = "X-54 Guardian Ocular Implants",
            ID = "82953",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[45].Quests.Alliance[2] = {
    Title = "2. The Bronze Betrayal",
    Level = "60",
    Attain = "58",
    Aim = "Slay Chronar, and bring his head to Tyvadrius in the Caverns of Time.",
    Location = "Tyvadrius (Tanaris - Caverns of Time "..yellow.."59,60"..white..")",
    Note = "You need to kill the first boss.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Pendant of Tyvadrius",
            ID = "60497",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Halberd of the Bronze Defender",
            ID = "60498",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_POLEARM,
        },
        {
            Name = "Ring of Tyvadrius",
            ID = "60499",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[45].Quests.Alliance[3] = {
    Title = "3. Corrupted Sand",
    Level = "60",
    Attain = "58",
    Aim = "Collect a Corrupted Sand for Dronormu in the Caverns of Time.",
    Location = "Dronormu (Tanaris - Caverns of Time "..yellow.."63,58"..white..")",
    Note = "Drop from mobs and bosses.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[45].Quests.Alliance[4] = {
    Title = "4. Sand in Bulk",
    Level = "60",
    Attain = "58",
    Aim = "Collect 10 Corrupted Sand for Dronormu in the Caverns of Time.",
    Location = "Dronormu (Tanaris - Caverns of Time "..yellow.."63,58"..white..")",
    Note = "Drop from mobs and bosses.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[45].Quests.Horde[1] = kQuestInstanceData[45].Quests.Alliance[1]
kQuestInstanceData[45].Quests.Horde[2] = kQuestInstanceData[45].Quests.Alliance[2]
kQuestInstanceData[45].Quests.Horde[3] = kQuestInstanceData[45].Quests.Alliance[3]
kQuestInstanceData[45].Quests.Horde[4] = kQuestInstanceData[45].Quests.Alliance[4]

--------------- INST46 - Hateforge Quarry ---------------
kQuestInstanceData[46] = {
    Story = "Hateforge Quarry is an instance dungeon located in the Burning Steppes. Hidden away at the southeastern walls of the Burning Steppes, the Hateforge Quarry is the Dark Iron dwarves' newest effort to find of a new weapon to use against their adversaries. The innocent-looking quarry hides an insidious cavern, where the Shadowforge dwarves plot new schemes against all those that oppose them.",
    Caption = "Hateforge Quarry",
    QAA = "5 Quest",
    QAH = "5 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[46].Quests.Alliance[1] = {
    Title = "1. Rival Presence",
    Level = "54",
    Attain = "47",
    Aim = "Find out what's being dug up in the Hateforge Quarry.",
    Location = "Overseer Oilfist <The Thorium Brotherhood> (Searing Gorge - Thorium Point; "..yellow.."38.1,27.0"..white..").",
    Note = "Hateforge Chemist mobs drop Hateforge Brew Filled Flask for quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[46].Quests.Alliance[2] = {
    Title = "2. Miners Union Mutiny II",
    Level = "50",
    Attain = "45",
    Aim = "Slay 20 Hateforge Miners at the Hateforge Quarry and return to Morgrim Firepike at Blackrock Pass in Burning Steppes.",
    Location = "Morgrim Firepike (Burning Steppes - Blackrock Pass; "..yellow.."75.6,68.3"..white..").",
    Note = "Questline starts at Radgan Deepblaze with quest 'Gaining Orvak's Trust' (Burning Steppes - Blackrock Pass; "..yellow.."76.1,67.6"..white..").",
    Prequest = "Gaining Orvak's Trust -> Hearing Orvak's Story -> The Sternrock Stash -> Miners Union Mutiny",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Cuffs of Justice",
            ID = "60673",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[46].Quests.Alliance[3] = {
    Title = "3. The True High Foreman",
    Level = "51",
    Attain = "45",
    Aim = "Slay Bargul Blackhammer "..yellow.."[1]"..white.." , and recover the Senate's Orders for Orvak Sternrock at the Blackrock Pass in Burning Steppes.",
    Location = "Orvak Sternrock (Burning Steppes - Blackrock Pass; "..yellow.."75.9,68.2"..white..").",
    Note = "Questline starts at Radgan Deepblaze with quest 'Gaining Orvak's Trust' (Burning Steppes - Blackrock Pass; "..yellow.."76.1,67.6"..white..").\nKill Bargul Blackhammer and take Senate's Orders on the table next to the boss.",
    Prequest = "Gaining Orvak's Trust -> Hearing Orvak's Story -> The Sternrock Stash",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Deepblaze Signet",
            ID = "60665",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Sternrock Trudgers",
            ID = "60666",
            Color = blue,
            Description = AQITEM_FEET..AQITEM_LEATHER,
        },
        {
            Name = "Firepike's Lucky Trousers",
            ID = "60667",
            Color = blue,
            Description = AQITEM_LEGS..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[46].Quests.Alliance[4] = {
    Title = "4. Rumors of Hateforge Brew",
    Level = "54",
    Attain = "45",
    Aim = "Delve into the Hateforge Quarry and recover a Dark Iron Vial, and the Hateforge Chemistry Documents, then return to Varlag Duskbeard at Morgan's Vigil in Burning Steppes.",
    Location = "Varlag Duskbeard (Burning Steppes - Morgan's Vigil; "..yellow.."85.1,67.6"..white..").",
    Note = "Hateforge Chemist mobs drop Dark Iron Vial for quest, Hateforge Chemistry Documents is in the box"..yellow.."[a]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_AND..white.."2",
        {
            Name = "Thunder Ale",
            ID = "2686",
            Color = white,
            Description = AQITEM_ITEM,
        },
        {
            Name = "Varlag's Clutches",
            ID = "60699",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[46].Quests.Alliance[5] = {
    Title = "5. Assaulting Hateforge",
    Level = "57",
    Attain = "45",
    Aim = "Venture into The Hateforge Quarry and remove the presence of the Twilight Hammer from deep within, when completed, return to King Magni Bronzebeard in Ironforge.",
    Location = "Senator Granitebelt (Burning Steppes - Morgan's Vigil; "..yellow.."85.2,67.9"..white..").",
    Note = "Kill the last boss Har'gesh Doomcaller "..yellow.."[5]"..white..".\nQuestline starts with quest 'Investigating Hateforge' at the same questgiver.",
    Prequest = "Investigating Hateforge -> The Hateforge Report -> The King's Response",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Crown of Grobi",
            ID = "60694",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_MAIL,
        },
        {
            Name = "Sigil of Heritage",
            ID = "60695",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Rubyheart Mallet",
            ID = "60696",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[46].Quests.Alliance[6] = {
    Title = "6. Why Not Both?",
    Level = "50",
    Attain = "40",
    Aim = "Obtain the Heart of Landslide from the depths of Maraudon, and the Essence of Corrosis from Hateforge Quarry for Frig Thunderforge at Aerie Peak",
    Location = "Frig Thunderforge (Hinterlands - Aerie Peak; "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Corrosis is at "..yellow.."[3]"..white..".",
    Prequest = "Proving A Point -> I've Read It In A Book Once",
    Folgequest = "Thunderforge Mastery",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Thunderforge Lance",
            ID = "40080",
            Color = blue,
            Description = AQITEM_POLEARM,
        },
    }
}
kQuestInstanceData[46].Quests.Horde[1] = kQuestInstanceData[46].Quests.Alliance[1]
kQuestInstanceData[46].Quests.Horde[2] = kQuestInstanceData[46].Quests.Alliance[2]
kQuestInstanceData[46].Quests.Horde[3] = kQuestInstanceData[46].Quests.Alliance[3]
kQuestInstanceData[46].Quests.Horde[4] = {
    Title = "4. Hunting Engineer Figgles",
    Level = "55",
    Attain = "48",
    Aim = "Kill Engineer Figgles "..yellow.."[2]"..white.." in Hateforge Quarry  for Worg Mistress Katalla.",
    Location = "Mistress Katalla (Burning Steppes - Karfang Hold; "..yellow.."89.4,24.5"..white.." northeast corner of Burning Steppes).",
    Note = "",
    Prequest = "Peculiar Won't Even Cut It",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Pyrehand Gloves",
            ID = "60771",
            Color = green,
            Description = AQITEM_HANDS..AQITEM_CLOTH,
        },
        {
            Name = "Fur of Navakesh",
            ID = "60772",
            Color = green,
            Description = AQITEM_BACK,
        },
        {
            Name = "Blackrock Authority",
            ID = "60773",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_MACE,
        },
        {
            Name = "Girdle of Galron",
            ID = "60774",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[46].Quests.Horde[5] = {
    Title = "5. Of New and Old IV",
    Level = "57",
    Attain = "45",
    Aim = "Venture into the Hateforge Quarry, and remove the Twilight Hammer presence within for Karfang in Karfang Hold.",
    Location = "Karfang (Burning Steppes - Karfang Hold; "..yellow.."90.1,22.5"..white.." northeast corner of Burning Steppes).",
    Note = "Kill the last boss Har'gesh Doomcaller "..yellow.."[5]"..white..".\nQuestline starts at Councilor Vargek (Burning Steppes - Karfang Hold; "..yellow.."90.0,22.7"..white.." northeast corner of Burning Steppes) with quest 'Of New and Old'.",
    Prequest = "Of New and Old -> Of New and Old II -> Of New and Old III",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Blade of the Warleader",
            ID = "60734",
            Color = blue,
            Description = AQITEM_MAINHAND..AQITEM_SWORD,
        },
        {
            Name = "Obsidian Gem Choker",
            ID = "60735",
            Color = blue,
            Description = AQITEM_NECK,
        },
        {
            Name = "Battlemaster Helm",
            ID = "60736",
            Color = blue,
            Description = AQITEM_HEAD..AQITEM_PLATE,
        },
    }
}

--------------- INST57 - Stormwind Vault ---------------
kQuestInstanceData[57] = {
    Story = "Stormwind Vault is an instance dungeon located in Stormwind. The Vault's runes of warding are weakening as the horrors within threaten Azeroth once again, you must venture down and stop these fiends once and for all.",
    Caption = "Stormwind Vault",
    QAA = "4 Quest",
    QAH = "3 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[57].Quests.Alliance[1] = {
    Title = "1. Recovering Vault Shackles",
    Level = "63",
    Attain = "55",
    Aim = "Within the Stormwind Vault, slay Runic Constructs for 2 Runic Shackles, return them to Koli Steamheart.",
    Location = "Koli Steamheart (Stormwind "..yellow.."54,47"..white..")",
    Note = "You need to kill the Runic Construct mobs.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[57].Quests.Alliance[2] = {
    Title = "2. Ending Arc'Tiras",
    Level = "63",
    Attain = "55",
    Aim = "Venture deep within The Stormwind Vault, find Arc'tiras, and slay him for the good of Stormwind. When done, return to Pepin Ainsworth.",
    Location = "Pepin Ainsworth (Stormwind "..yellow.."54,47"..white..")",
    Note = "You need to kill the last boss.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Goldplated Royal Crossbow",
            ID = "60624",
            Color = blue,
            Description = AQITEM_CROSSBOW,
        },
        {
            Name = "Golden Gauntlets of Stormwind",
            ID = "60625",
            Color = blue,
            Description = AQITEM_HANDS..AQITEM_PLATE,
        },
        {
            Name = "Regal Goldthreaded Sash",
            ID = "60626",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_CLOTH,
        },
    }
}
kQuestInstanceData[57].Quests.Alliance[3] = {
    Title = "3. The Enemy Lays",
    Level = "62",
    Attain = "60",
    Aim = "Bring the Core of Arc'Tiras back to Al'Dorel.",
    Location = "Al'Dorel (Winterspring "..yellow.."56,45"..white..")",
    Note = "You need to kill the last boss.\nQuest line start from Enchanted Amethyst drop in "..yellow.."Tower of Karazhan [2]"..white.." boss.\nReward from the last quest in chain.",
    Prequest = "Asleep Under Snow",
    Folgequest = "Awoke at Sun Rise",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Claw of the Mageweaver",
            ID = "55133",
            Color = blue,
            Description = AQITEM_OFFHAND..AQITEM_FIST,
        },
        {
            Name = "Rod of Permafrost",
            ID = "55134",
            Color = blue,
            Description = AQITEM_WAND,
        },
        {
            Name = "Shard of Leyflow",
            ID = "55135",
            Color = blue,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[57].Quests.Alliance[4] = {
    Title = "4. The Tome of Arcane Intricacies and Magical Phenomenon IX",
    Level = "63",
    Attain = "58",
    Aim = "Recover the Tome of Arcane Intricacies and Magical Phenomenon IX for Mazen Mac'Nadir in Stormwind.",
    Location = "Mazen Mac'Nadir (Stormwind "..yellow.."42,64"..white..")",
    Note = "Near "..yellow.."[3]"..white.." boss.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Ring of the Academy",
            ID = "60622",
            Color = blue,
            Description = AQITEM_RING,
        },
    }
}
kQuestInstanceData[57].Quests.Horde[1] = kQuestInstanceData[57].Quests.Alliance[1]
kQuestInstanceData[57].Quests.Horde[2] = kQuestInstanceData[57].Quests.Alliance[2]
kQuestInstanceData[57].Quests.Horde[3] = kQuestInstanceData[57].Quests.Alliance[3]

--------------- INST58 - Ostarius ---------------
kQuestInstanceData[58] = {
    Story = "",
    Caption = "Ostarius",
    QAA = "1 Quest",
    QAH = "1 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[58].Quests.Alliance[1] = {
    Title = "1. Gate Keeper",
    Level = "60",
    Attain = "58",
    Aim = "Defeat Ostarius. Return to the Hall of Explorers and inform High Explorer Magellas about the events that occurred at the gate.",
    Location = "Uldum Pedestal (Tanaris "..yellow.."37,81"..white..")",
    Note = "Prequest from High Explorer Magellas (Ironforge - Hall of Explorers "..yellow.."69.9,18.5"..white..").You need to kill Ostarius.",
    Prequest = "1.Unusual Partnership -> 2.Original Owner --> 7.Gates of Uldum",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[58].Quests.Horde[1] = {
    Title = "1. Guardian of the Gate",
    Level = "60",
    Attain = "58",
    Aim = "Defeat Ostarius. Return to the Thunder Bluff and inform Sage Truthseeker about the events that occurred at the gate.",
    Location = "Uldum Pedestal (Tanaris "..yellow.."37,81"..white..")",
    Note = "Prequest from Sage Truthseeker (Thunder Bluff "..yellow.."34,47"..white..").You need to kill Ostarius.",
    Prequest = "1.The Lone Wolf -> 2.Scarms of the Past --> 7.Uldum Awaits",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST61 - Gilneas City ---------------
kQuestInstanceData[61] = {
    Story = "Gilneas City is an instance dungeon located in Gilneas. Located at the heart of this once-isolated land, Gilneas City was once a bastion of hope for its people. Established after breaking free from the rule of the Arathorian lords, it stood as a symbol of resilience and prosperity. However, it is now a mere shell of its former beauty, with a dark presence casting a gripping shadow over Gilneas and serving as a reminder of its once glorious past. Distant howls echo through the city, haunting reminders of its new occupants. Yet, there is a possibility that not everyone is gone and that their accursed king may still live.",
    Caption = "Gilneas City",
    QAA = "10 Quest",
    QAH = "9 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[61].Quests.Alliance[1] = {
    Title = "1. The Judge and the Phantom",
    Level = "46",
    Attain = "35",
    Aim = "Slay Judge Sutherland "..yellow.."[3]"..white.." within Gilneas City for the Angered Phantom at the Glaymore Stead in Gilneas.",
    Location = "Angered Phantom (Gilneas -Glaymore Stead "..yellow.."52.9,27.9"..white..")",
    Note = "You can find Angered Phantom inside building on the mountain. Entering Gilneas gates follow the mountain on your left(east), passing a field with windmills you will find a path to the sea, almost at the edge turn north follow the path(barely noticable).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Glaymore Family Breastplate",
            ID = "61620",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_MAIL,
        },
        {
            Name = "Ceremonial Gilnean Pike",
            ID = "61621",
            Color = green,
            Description = AQITEM_TWOHAND..AQITEM_POLEARM,
        },
        {
            Name = "Glaymore Shawl",
            ID = "61622",
            Color = green,
            Description = AQITEM_BACK,
        },
    }
}
kQuestInstanceData[61].Quests.Alliance[2] = {
    Title = "2. Behind The Wall",
    Level = "41",
    Attain = "36",
    Aim = "Venture into Gilneas City and recover the Dawnstone Plans for Therum Deepforge in Stormwind.",
    Location = "Therum Deepforge <Expert Blacksmith> (Stormwind - Dwarven District"..yellow.."63.3,37"..white..", can be walking around there)",
    Note = "the Dawnstone Plans in the building "..yellow.."[a]"..white.." on the box.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Inlaid Plate Boots",
            ID = "61348",
            Color = green,
            Description = AQITEM_FEET..AQITEM_PLATE,
        },
        {
            Name = "Dwarven Battle Bludgeon",
            ID = "61349",
            Color = green,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
    }
}
kQuestInstanceData[61].Quests.Alliance[3] = {
    Title = "3. The Deed to Ravenshire",
    Level = "45",
    Attain = "38",
    Aim = "Find the Deed to Ravenshire in Gilneas City and bring it back to Caliban Silverlaine.",
    Location = "Baron Caliban Silverlaine (Gilneas - Ravenshire (main building) "..yellow.."58.4,67.8"..white..")",
    Note = "the Deed to Ravenshire on the table behind Regent-Lady Celia Harlow and Regent-Lord Mortimer Harlow, next to the Harlow Family Chest"..yellow.."[7]"..white..".",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Ebonmere Axe",
            ID = "61601",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_AXE,
        },
        {
            Name = "Gilneas Brigade Helmet",
            ID = "61602",
            Color = green,
            Description = AQITEM_HEAD..AQITEM_PLATE,
        },
        {
            Name = "Robes of Ravenshire",
            ID = "61603",
            Color = green,
            Description = AQITEM_CHEST..AQITEM_CLOTH,
        },
        {
            Name = "Greyshire Pauldrons",
            ID = "61604",
            Color = green,
            Description = AQITEM_SHOULDER..AQITEM_LEATHER,
        },
    }
}
kQuestInstanceData[61].Quests.Alliance[4] = {
    Title = "4. Ravencroft's Ambition",
    Level = "45",
    Attain = "40",
    Aim = "Recover the Book of Ur : Volume Two from the library in Gilneas City and return to Ethan Ravencroft.",
    Location = "Ethan Ravencroft (Gilneas - Hollow Web Cemetery - Crypt(southwest corner of Gilneas, east from the river)"..yellow.."33,76"..white..")",
    Note = "the Book of Ur in the building "..yellow.."[b]"..white..", go right, on the table (south side).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[61].Quests.Alliance[5] = {
    Title = "5. Undoing Draconic Presence",
    Level = "47",
    Attain = "35",
    Aim = "End the Draconic Influence over Gilneas by slaying Regent-Lady Celia Harlow and Regent-Lord Mortimer Harlow "..yellow.."[7]"..white.." for Magus Orelius at Ravenshire in Gilneas.",
    Location = "Magus Orelius <Kirin Tor> (Gilneas - Ravenshire (main building) "..yellow.."57.7,68.5"..white..")",
    Note = "Bring 1 Large Glowing Shard you will need 1 for prequest. enchanters have them or auction house can help. it should be cheap.",
    Prequest = "Font of Arcana -> Magical Presence -> Draconic Presence?",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2",
        {
            Name = "Violet Sash",
            ID = "61486",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_CLOTH,
        },
        {
            Name = "Gauntlets of Insight",
            ID = "61487",
            Color = blue,
            Description = AQITEM_HANDS..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[61].Quests.Alliance[6] = {
    Title = "6. The Fall and Rise of Greymane",
    Level = "42",
    Attain = "35",
    Aim = "recover the Greymane Crown for Lord Darius Ravenwood at Ravenshire in Gilneas.",
    Location = "Lord Darius Ravenwood (Gilneas - Ravenshire (main building) "..yellow.."58.4,67.6"..white..")",
    Note = "Quest line starts with quest 'Wolf Amongst Sheep' at Baron Caliban Silverlaine (Gilneas - Ravenshire (main building) "..yellow.."58.4,67.8"..white..")\nThe Greymane Crown drops from Genn Greymane "..yellow.."[8]"..white..", last boss on the top of the tower.",
    Prequest = "Wolf Amongst Sheep -> One Chain at a Time -> On Legend's Trail -> Back to Ravenshire -> Dim Light in the Darkness -> Vilest of Men -> A Crossroads Deal -> Assaulting Freyshear Keep ",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_AND..white.."4",
        {
            Name = "Ravenwood Belt",
            ID = "61497",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_MAIL,
        },
        {
            Name = "Signet of Gilneas",
            ID = "61498",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Ravenshire Gloves",
            ID = "61499",
            Color = blue,
            Description = AQITEM_HANDS..AQITEM_LEATHER,
        },
        {
            Name = "Ravenshire Tabard",
            ID = "61369",
            Color = white,
            Description = AQITEM_TABARD,
        },
    }
}
kQuestInstanceData[61].Quests.Alliance[7] = {
    Title = "7. Manuscript on Hydromancy II",
    Level = "45",
    Attain = "38",
    Aim = "Recover the Manuscript on Hydromancy II for Magus Hallister at Theramore Isle in Dustwallow Marsh.",
    Location = "Magus Hallister (Dustwallow Marsh - Theramore, central Tower)",
    Note = red.."(Mage ONLY)"..white.." Mage Theramore teleport quest.\nthe Manuscript on Hydromancy II in the building "..yellow.."[b]"..white..", go right, on the dresser (south side).",
    Prequest = "Mannoroc Demonic Sigil",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Tome of Teleportation: Theramore",
            ID = "92001",
            Color = green,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[61].Quests.Alliance[8] = {
    Title = "8. Left In Bad Faith",
    Level = "44",
    Attain = "40",
    Aim = "Return with the adventurer's necklace to Talvash del Kissel in Ironforge.",
    Location = "Talvash del Kissel (Ironforge - The Mystic Ward; "..yellow.."36,3"..white..").",
    Note = red.."(Jewelcrafter: Goldsmith ONLY)"..white.." Prequest from Mayva Togview (Ironforge - Hall of Explorers; "..yellow.."60,24"..white.."). \nDustivan Blackcowl "..yellow.."[4]"..white.." drops the Tarnished Citrine Choker",
    Prequest = "Mastering Goldsmithing",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Plans: Alluring Citrine Choker",
            ID = "70134",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[61].Quests.Alliance[9] = {
    Title = "9. Blood of Vorgendor",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Fandral Staghelm. He requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Arch Druid Fandral Staghelm (Darnassus - Cenarion Enclave "..yellow.."35,9"..white..").",
    Note = "[Darkpelt Blood] drop from Worgens."..white.."\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[61].Quests.Alliance[10] = {
    Title = "10. Gilnean Pricolich",
    Level = "60",
    Attain = "60",
    Aim = "Venture to Gilneas City and search for the whereabouts of the second Pricolich.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar "..yellow.."85, 30"..white..")", --61512",
    Note = "[Celia's Journal] placed near "..yellow.."[7]"..white..".\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Pricolich Gnarlmoon",
    Folgequest = "Pricolich Lycan",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[61].Quests.Horde[1] = kQuestInstanceData[61].Quests.Alliance[1]
kQuestInstanceData[61].Quests.Horde[2] = {
    Title = "2. Ebonmere Affairs",
    Level = "45",
    Attain = "35",
    Aim = "Slay Dustivan Blackcowl "..yellow.."[4]"..white.." and recover the Ebonmere Deed for Joshua Ebonmere at Ebonmere Farm in Gilneas",
    Location = "Joshua Ebonmere (Gilneas - Ebonmere Farm "..yellow.."[49.5,31.1]"..white.."). Entering Gilneas gates follow the mountain on your left(east), in the field with windmills you will find Joshua Ebonmere.",
    Note = "Prequest 'Ebonmere Bat Infestation' and 'Ebonmere Worgen Infestation'.\nDustivan Blackcowl "..yellow.."[4]"..white.." drops the Ebonmere Deed",
    Prequest = "Ebonmere Bat Infestation -> Ebonmere Worgen Infestation",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Ebonmere Reaver",
            ID = "61627",
            Color = green,
            Description = AQITEM_ONEHAND..AQITEM_AXE,
        },
        {
            Name = "Clutch of Joshua",
            ID = "61628",
            Color = green,
            Description = AQITEM_WAIST..AQITEM_CLOTH,
        },
        {
            Name = "Farmer's Musket",
            ID = "61629",
            Color = green,
            Description = AQITEM_GUN,
        },
        {
            Name = "Ebonmere Vambracers",
            ID = "61630",
            Color = green,
            Description = AQITEM_WRIST..AQITEM_PLATE,
        },
    }
}
kQuestInstanceData[61].Quests.Horde[3] = {
    Title = "3. A Royal Heist",
    Level = "45",
    Attain = "40",
    Aim = " Steal the painting from the library in Gilneas City and return to Luke Agamand at Blackthorn's Camp in Gilneas.",
    Location = "Luke Agamand (Gilneas - Blackthorn's Camp "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "The portrait of Mia Greymane in the building "..yellow.."[b]"..white..", go left, on the wall (northwest corner).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[61].Quests.Horde[4] = {
    Title = "4. The Evil Made Me Do It",
    Level = "46",
    Attain = "35",
    Aim = "Find 'On the Powers of Blood' in Gilneas City, then return to Orvan Darkeye at the Ruins of Greyshire in Gilneas.",
    Location = "Orvan Darkeye (Gilneas - ruins of Greyshire "..yellow.."[31.3,47.0]"..white..")",
    Note = red.."Questline starts at Deathstalker Alynna (Gilneas Stillward Church "..yellow.."[57.3,39.6]"..white..", inside) with quest 'Dead Until Dark'.\n'On the Powers of Blood' book on the table behind Regent-Lady Celia Harlow and Regent-Lord Mortimer Harlow, next to the Harlow Family Chest"..yellow.."[7]"..white..".\nYou will get the reward finishing the next quest.",
    Prequest = "Dead Until Dark -> All We Need is Blood -> Last of the Living Dead -> We Take It From The Living",
    Folgequest = "Blood for Blood",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Pure Bloodvial Pendant",
            ID = "61422",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[61].Quests.Horde[5] = {
    Title = "5. Genn Greymane Must Die!",
    Level = "49",
    Attain = "40",
    Aim = "Enter Gilneas City and slay Genn Greymane "..yellow.."[8]"..white..", then bring his head to Blackthorn at Blackthorn's Camp in Gilneas.",
    Location = "Blackthorn (Gilneas - Blackthorn's Camp "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "2 Questlines need to be finished to start this quest 'Report to Luke Agamand' and 'Report to Livia Strongarm' at Blackthorn.\n",
    Prequest = "'Report to Luke Agamand'-> Heist in Dryrock Mine ->> Report to Livia Strongarm -> Rendezvous with the Infiltrator ->> Quality Time with Blackthorn",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Blackthorn Gauntlets",
            ID = "61353",
            Color = blue,
            Description = AQITEM_HANDS..AQITEM_LEATHER,
        },
        {
            Name = "Banshee's Tear",
            ID = "61354",
            Color = blue,
            Description = AQITEM_RING,
        },
        {
            Name = "Dark Footpad Belt",
            ID = "61355",
            Color = blue,
            Description = AQITEM_WAIST..AQITEM_MAIL,
        },
    }
}
kQuestInstanceData[61].Quests.Horde[6] = {
    Title = "6. The Greymane Stone",
    Level = "47",
    Attain = "38",
    Aim = "Recover the Shard of Midnight for Dark Bishop Mordren in Stillward Church.",
    Location = "Dark Bishop Mordren (Gilneas - Stillward Church "..yellow.."57.7,39.6"..white..")",
    Note = "Questline starts with quest 'Through Greater Magic' at Dark Bishop Mordren.\nShard of Midnight is behind the last boss Genn Greymane "..yellow.."[8]"..white.."\nYou will get the reward finishing the next quest.",
    Prequest = "Through Greater Magic -> The Ravenwood Scepter -> The Powers Beyond "..yellow.."[Razorfen Downs]"..white..".", -- 40993, 40994, 40995",
    Folgequest = "Gift of the Dark Bishop",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Garalon's Might",
            ID = "61660",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_SWORD,
        },
        {
            Name = "Varimathras' Cunning",
            ID = "61661",
            Color = blue,
            Description = AQITEM_TWOHAND..AQITEM_STAFF,
        },
        {
            Name = "Stillward Amulet",
            ID = "61662",
            Color = blue,
            Description = AQITEM_NECK,
        },
    }
}
kQuestInstanceData[61].Quests.Horde[7] = {
    Title = "7. Foreign Knowledge",
    Level = "44",
    Attain = "34",
    Aim = "Search for a fitting book in Gilneas City and bring it to Jarkal Mossmeld in Kargath in the Badlands.",
    Location = "Jarkal Mossmeld (Badlands - Kargath "..yellow.."2,46"..white..").",
    Note = red.."(Jewelcrafter: Goldsmith only)"..white.." Prequest from Gulmire Fartower (Undercity - The Rogue Quarter "..yellow.."77,76"..white.."). \n'Gilnean Jewelry: A Compendium' (where?) contain item.",
    Prequest = "Mastering Goldsmithing",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Plans: Alluring Citrine Choker",
            ID = "70134",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[61].Quests.Horde[8] = {
    Title = "8. The Wolf, the Crone and the Scythe",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Magatha Grimtotem. She requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Magatha Grimtotem (Thunder Bluff - The Elder Rise "..yellow.."70,31"..white..").",
    Note = "[Darkpelt Blood] drop from Worgens."..white.."\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[61].Quests.Horde[9] = {
    Title = "9. Gilnean Pricolich",
    Level = "60",
    Attain = "60",
    Aim = "Venture to Gilneas City and search for the whereabouts of the second Pricolich.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar "..yellow.."85, 30"..white..")", --61512",
    Note = "[Celia's Journal] placed near "..yellow.."[7]"..white..".\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Pricolich Gnarlmoon",
    Folgequest = "Pricolich Lycan",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST62 - Lower Karazhan Halls ---------------
kQuestInstanceData[62] = {
    Story = "",
    Caption = "Lower Karazhan Halls",
    QAA = "18 Quest",
    QAH = "18 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[62].Quests.Alliance[1] = {
    Title = "1. Suitable Accomodations",
    Level = "60",
    Attain = "55",
    Aim = "Find a Comfortable Pillow for Councilman Kyleson in Karazhan.",
    Location = "Councilman Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "You can find Comfortable Pillow at "..yellow.."(b)"..white.." in the boxes.",
    Prequest = "No",
    Folgequest = "A Drink to Sleep",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[2] = {
    Title = "2. A Drink to Sleep",
    Level = "60",
    Attain = "55",
    Aim = "Speak with someone who may know how to acquire wine for Councilman Kyleson.",
    Location = "Councilman Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "Turn the quest in to The Cook near "..yellow.."[Karazhan - e]"..white..".",
    Prequest = "Suitable Accomodations",
    Folgequest = "Spectral Wine",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[3] = {
    Title = "3. Spectral Wine",
    Level = "60",
    Attain = "55",
    Aim = "Gather 3 Essence of Undeath, 5 Flask of Port, and a Ghost Mushroom for The Cook in Karazhan.",
    Location = "The Cook near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Flask of Port sold by alcohol vendors. All items can be bought from Auction House.",
    Prequest = "A Drink to Sleep",
    Folgequest = "Wine for Kyleson",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[4] = {
    Title = "4. Wine for Kyleson",
    Level = "60",
    Attain = "55",
    Aim = " Deliver the Spectral Wine to Councilman Kyleson "..yellow.."[Karazhan - c]"..white.." in Karazhan. ",
    Location = "The Cook near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "",
    Prequest = "Spectral Wine",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[5] = {
    Title = "5. The Key to Karazhan I",
    Level = "60",
    Attain = "58",
    Aim = "Listen to the story of Lord Ebonlocke.",
    Location = "Lord Ebonlocke ("..yellow.."[Karazhan - d]"..white..")",
    Note = "",
    Prequest = "No",
    Folgequest = "The Key to Karazhan II",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[6] = {
    Title = "6. The Key to Karazhan II",
    Level = "60",
    Attain = "58",
    Aim = "Kill Moroes "..yellow.."[6]"..white.." and retrieve the Key to the Upper Chambers. Moroes resides in Lower Karazhan Halls. Bring back the key to Lord Ebonlocke.",
    Location = "Lord Ebonlocke ("..yellow.."[Karazhan - d]"..white..")",
    Note = "",
    Prequest = "The Key to Karazhan I",
    Folgequest = "The Key to Karazhan III",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[7] = {
    Title = "7. The Key to Karazhan III",
    Level = "60",
    Attain = "58",
    Aim = "Find someone from the Kirin Tor who might know something about Vandol. Dalaran could be a good place to start your search.",
    Location = "The Cook near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Turn in the quest to Archmage Ansirem Runeweaver <Kirin Tor> (Alterac Mountains - Dalaran "..yellow.."[18.9,78.5]"..white..")",
    Prequest = "The Key to Karazhan II",
    Folgequest = "The Key to Karazhan IV",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[8] = {
    Title = "8. Scribbled Cooking Notes",
    Level = "60",
    Attain = "55",
    Aim = "Find someone that may be know something about the Scribbled Cooking Notes.",
    Location = "Scribbled Cooking Notes",
    Note = "Turn in the quest to Duke Rothlen "..yellow.."[Karazhan - f]"..white.." on the balkon next to Clawlord Howlfang "..yellow.."[4]"..white..".",
    Prequest = "No",
    Folgequest = "Lost and Found",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[9] = {
    Title = "9. Lost and Found",
    Level = "60",
    Attain = "55",
    Aim = "Recover the Engraved Golden Bracelet for Duke Rothlen in Karazhan.",
    Location = "Duke Rothlen "..yellow.."[Karazhan - f]"..white..".",
    Note = "You can find 'Engraved Golden Bracelet' in the chest at "..yellow.."[Karazhan - a]"..white..".",
    Prequest = "Scribbled Cooking Notes",
    Folgequest = "Rothlen Family Brooch",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[10] = {
    Title = "10. Rothlen Family Brooch",
    Level = "60",
    Attain = "55",
    Aim = "Find someone from the Kirin Tor who might know something about Vandol. Dalaran could be a good place to start your search.",
    Location = "Duke Rothlen (Karazhan; "..yellow.."[Karazhan - f]"..white..")",
    Note = "Rothlen Family Brooch next to "..yellow.."[Stratholme]"..white.." boss The Unforgiven "..yellow.."[4]"..white.." in the chest.",
    Prequest = "Lost and Found",
    Folgequest = "The Secret Recipe",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[11] = {
    Title = "11. The Secret Recipe",
    Level = "60",
    Attain = "55",
    Aim = "Speak with 'The Cook' "..yellow.."[near e]"..white.." in Lower Karazhan Halls.",
    Location = "Duke Rothlen (Karazhan; "..yellow.."[Karazhan - f]"..white..")",
    Note = "",
    Prequest = "Rothlen Family Brooch",
    Folgequest = "The Doorman of Karazhan",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[12] = {
    Title = "12. The Doorman of Karazhan",
    Level = "60",
    Attain = "55",
    Aim = "Speak with Doorman Montigue in Karazhan",
    Location = "The Cook near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Doorman Montigue"..blue.." "..white.."at the beginning of the dungeon in front of the stairs.",
    Prequest = "The Secret Recipe",
    Folgequest = "Charge of Karazhan",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[13] = {
    Title = "13. Charge of Karazhan",
    Level = "60",
    Attain = "55",
    Aim = "Bring 10 Essence of Undeath, 10 Living Essence, and 25 Gold to Doorman Montique in Karazhan.",
    Location = "Doorman Montigue"..blue.." "..white.."at the beginning of the dungeon in front of the stairs.",
    Note = "All can be bought from Auction House. livimg 10-15 silver each, undeath - 1-3 gold each.",
    Prequest = "The Doorman of Karazhan",
    Folgequest = "Le Fishe Au Chocolat",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[14] = {
    Title = "14. Le Fishe Au Chocolat",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Charge of Karazhan to The Cook near"..yellow.."[e]"..white.." in Lower Karazhan Halls.",
    Location = "Doorman Montigue"..blue.." "..white.."at the beginning of the dungeon in front of the stairs.",
    Note = "",
    Prequest = "Charge of Karazhan",
    Folgequest = "",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Recipe: Le Fishe Au Chocolat",
            ID = "61666",
            Color = purple,
            Description = AQITEM_PATTERN,
        },
        {
            Name = "Le Fishe Au Chocolat",
            ID = "84040",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[62].Quests.Alliance[15] = {
    Title = "15. Scythe of the Goddess",
    Level = "60",
    Attain = "60",
    Aim = "Slay Clawlord Howlfang "..yellow.."[4]"..white.." and report to Lord Ebonlocke "..yellow.."[Karazhan - d]"..white..".",
    Location = "The Scythe of Elune "..yellow.."[5]"..white..".",
    Note = red.."Mage, Priest, Warlock, Druid only"..white..":\nQuestline starts with legendary item 'The Scythe of Elune' that drops from Lord Blackwald II "..yellow.."[5]"..white.." (low chance).\nQuest line for legendary trinket.",
    Prequest = "No",
    Folgequest = "Scythe of the Goddess",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Alliance[16] = {
    Title = "16. Contribution to the Church",
    Level = "60",
    Attain = "55",
    Aim = "Gather 15 Arcane Essence, 20 Illusion Dust, and 10 Greater Eternal Essence for Heirophant Nerseus at the church outside Karazhan.",
    Location = "Heirophant Nerseus (Deadwind Pass, in front of the church next to Karazhan "..yellow.."[40.3,77.2]"..white..").",
    Note = "15x Arcane Essence - random trash loot;\n20x Illusion Dust - Enchanters or Auction House;\n10x Greater Eternal Essence - Enchanters or Auction House;\nAfter finishing this quest you will be able to get a quest for head/leg enchants. For each of them you will need:\n 1x Overcharged Ley Energy - random rare item loot from trash/boss in Karazhan;\n6x Arcane Essence - random trash loot.",
    Prequest = "No",
    Folgequest = "Invocation of Shattering, Invocation of Greater Protection, Invocation of Expansive Mind, Invocation of Greater Arcane Fortitude",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3"..AQDiscription_OR..white.."4",
        {
            Name = "Invocation of Shattering",
            ID = "92005",
            Color = blue,
            Description = AQITEM_ENCHANT,
        },
        {
            Name = "Invocation of Greater Protection",
            ID = "92006",
            Color = blue,
            Description = AQITEM_ENCHANT,
        },
        {
            Name = "Invocation of Expansive Mind",
            ID = "92007",
            Color = blue,
            Description = AQITEM_ENCHANT,
        },
        {
            Name = "Invocation of Greater Arcane Fortitude",
            ID = "92008",
            Color = blue,
            Description = AQITEM_ENCHANT,
        },
    }
}
kQuestInstanceData[62].Quests.Alliance[17] = {
    Title = "17. Comically Large Candle",
    Level = "61",
    Attain = "60",
    Aim = "Recover the Comically Large Candle from Grizikil and return to Big Whiskers in Upper Karazhan.",
    Location = "Doorman Montigue"..blue.." "..white.."at the beginning of the dungeon in front of the stairs.",
    Note = red.."Mage only"..white..": Grizikil "..yellow.."[3]"..white.." drops 'Comically Large Candle'.\nThe quest line starts from Big Whiskers in "..yellow.."[Tower of Karazhan]"..white..".",
    Prequest = "I Am No Rat",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Tome of Polymorph: Rodent",
            ID = "92025",
            Color = blue,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[62].Quests.Alliance[18] = {
    Title = "18. Blood of Vorgendor",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Fandral Staghelm. He requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Arch Druid Fandral Staghelm (Darnassus - Cenarion Enclave "..yellow.."35,9"..white..").",
    Note = "[Shadowbane Blood] drop from Worgens."..white.."\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Horde[1] = kQuestInstanceData[62].Quests.Alliance[1]
kQuestInstanceData[62].Quests.Horde[2] = kQuestInstanceData[62].Quests.Alliance[2]
kQuestInstanceData[62].Quests.Horde[3] = kQuestInstanceData[62].Quests.Alliance[3]
kQuestInstanceData[62].Quests.Horde[4] = kQuestInstanceData[62].Quests.Alliance[4]
kQuestInstanceData[62].Quests.Horde[5] = kQuestInstanceData[62].Quests.Alliance[5]
kQuestInstanceData[62].Quests.Horde[6] = kQuestInstanceData[62].Quests.Alliance[6]
kQuestInstanceData[62].Quests.Horde[7] = {
    Title = "7. The Key to Karazhan III",
    Level = "60",
    Attain = "58",
    Aim = "Find someone from Kirin Tor who might know something about Vandol. Undercity could be a good place to start your search.",
    Location = "The Cook near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Turn in the quest to Bethor Iceshard (Undercity - The Magic Quarter"..yellow.."[84.1,17.5]"..white..", mage trainer zone.)",
    Prequest = "The Key to Karazhan II",
    Folgequest = "The Key to Karazhan IV",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[62].Quests.Horde[8] = kQuestInstanceData[62].Quests.Alliance[8]
kQuestInstanceData[62].Quests.Horde[9] = kQuestInstanceData[62].Quests.Alliance[9]
kQuestInstanceData[62].Quests.Horde[10] = kQuestInstanceData[62].Quests.Alliance[10]
kQuestInstanceData[62].Quests.Horde[11] = kQuestInstanceData[62].Quests.Alliance[11]
kQuestInstanceData[62].Quests.Horde[12] = kQuestInstanceData[62].Quests.Alliance[12]
kQuestInstanceData[62].Quests.Horde[13] = kQuestInstanceData[62].Quests.Alliance[13]
kQuestInstanceData[62].Quests.Horde[14] = kQuestInstanceData[62].Quests.Alliance[14]
kQuestInstanceData[62].Quests.Horde[15] = kQuestInstanceData[62].Quests.Alliance[15]
kQuestInstanceData[62].Quests.Horde[16] = kQuestInstanceData[62].Quests.Alliance[16]
kQuestInstanceData[62].Quests.Horde[17] = kQuestInstanceData[62].Quests.Alliance[17]
kQuestInstanceData[62].Quests.Horde[18] = {
    Title = "18. The Wolf, the Crone and the Scythe",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Magatha Grimtotem. She requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Magatha Grimtotem (Thunder Bluff - The Elder Rise "..yellow.."70,31"..white..").",
    Note = "[Shadowbane Blood] drop from Worgens."..white.."\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST63 - Emerald Sanctum ---------------
kQuestInstanceData[63] = {
    Story = "Emerald Sanctum is an instance raid located in Hyjal. A fog of corruption has descended upon the Emerald Dream, twisting the morals and intentions of even the noblest and purest. The corrupted Wakener is preparing to send a premature call of awakening; if not stopped, his kin will arise and go on a frenzied rampage across Azeroth.",
    Caption = "Emerald Sanctum",
    QAA = "3 Quest",
    QAH = "3 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[63].Quests.Alliance[1] = {
    Title = "1. Smoldering Dream Essence",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Smoldering Dream Essence to Arch Druid Dreamwind at Nordanaar in Hyjal.",
    Location = "Smoldering Dream Essence [2]",
    Note = red.."Druid only"..white..": Arch Druid Dreamwind is at (Hyjal - Nordanaar; "..yellow.."85,30"..white.."). Only one person in the raid can loot this item and the quest can only be done one time.\n\nRewards listed are for the followup.",
    Prequest = "No",
    Folgequest = "Purified Dream Essence",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Purified Emerald Essence",
            ID = "61445",
            Color = purple,
            Description = AQITEM_PATTERN,
        },
    }
}
kQuestInstanceData[63].Quests.Alliance[2] = {
    Title = "2. Head of Solnius",
    Level = "60",
    Attain = "58",
    Aim = "Bring the Head of Solnius to Ralathius at Nordanaar in Hyjal.",
    Location = "Head of Solnius [2]",
    Note = "Ralathius is at (Hyjal - Nordanaar; "..yellow.."85,30"..white.."). Only one person in the raid can loot this item and the quest can only be done one time.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Ring of Nordrassil",
            ID = "61195",
            Color = purple,
            Description = AQITEM_RING,
        },
        {
            Name = "The Heart of Dreams",
            ID = "61194",
            Color = purple,
            Description = AQITEM_NECK,
        },
        {
            Name = "Verdant Eye Necklace",
            ID = "61193",
            Color = purple,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[63].Quests.Alliance[3] = {
    Title = "3. The Claw of Erennius",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Claw of Erennius to one that may find it useful.",
    Location = "Claw of Erennius [1]",
    Note = "Ralathius is at (Hyjal - Nordanaar; "..yellow.."85,30"..white.."). Only one person in the raid can loot this item and the quest can only be done one time.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Jadestone Skewer",
            ID = "61650",
            Color = purple,
            Description = AQITEM_TWOHAND..AQITEM_POLEARM,
        },
        {
            Name = "Jadestone Mallet",
            ID = "61651",
            Color = purple,
            Description = AQITEM_MAINHAND..AQITEM_MACE,
        },
        {
            Name = "Claw of Senthos",
            ID = "61740",
            Color = purple,
            Description = AQITEM_MAINHAND..AQITEM_FIST,
        },
    }
}
kQuestInstanceData[63].Quests.Horde[1] = kQuestInstanceData[63].Quests.Alliance[1]
kQuestInstanceData[63].Quests.Horde[2] = kQuestInstanceData[63].Quests.Alliance[2]
kQuestInstanceData[63].Quests.Horde[3] = kQuestInstanceData[63].Quests.Alliance[3]

--------------- INST64 - Tower of Karazhan ---------------
kQuestInstanceData[64] = {
    Story = "",
    Caption = "Tower of Karazhan",
    QAA = "9 Quest",
    QAH = "9 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
kQuestInstanceData[64].Quests.Alliance[1] = {
    Title = "1. The Scepter Rod of Medivh",
    Level = "60",
    Attain = "60",
    Aim = "To restore the Scepter Rod of Medivh, Anelace the Clairvoyant at Morgan's Plot  in Deadwind Pass needs a high amount of arcane energy.",
    Location = "Anelace the Clairvoyant (Deadwind Pass - Morgan's Plot; "..yellow.."41.2,79.2"..white..")",
    Note = "Obsidian Rod ?. Cosmic Residue drop from "..yellow.."[3]."..white.."\nThe Binding of Xanthar prequest start at the Hanvar the Righteous (Deadwind Pass - Morgan's Plot "..yellow.."40.9, 79.3"..white.."), Wine for Kyleson prequest start at the The Cook "..yellow.."(Lower Karazhan Halls [e])",
    Prequest = "Wine for Kyleson, The Binding of Xanthar",
    Folgequest = "Tirisfal's Vestige",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "Scepter Rod of Medivh",
            ID = "41413",
            Color = white,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[64].Quests.Alliance[2] = {
    Title = "2. Tirisfal's Vestige",
    Level = "60",
    Attain = "60",
    Aim = "A figment of Medivh is necessary to imbue the Scepter of Medivh with. Bring it to Anelace the Clairvoyant at Morgan's Plot outside Karazhan.",
    Location = "Anelace the Clairvoyant (Deadwind Pass - Morgan's Plot; "..yellow.."41.2,79.2"..white..")",
    Note = "Drop from "..yellow.."Echo of Medivh [4]."..white.."\nKhadgar's Journal [?] start this quest chain.\nReward from the last quest in quest chain.\nSanv K'la (Swamp of Sorrows; "..yellow.."25, 30"..white..") start The Sanv Charm quest chain.",
    Prequest = "Clutch of Thanlar -> Restoration",
    Folgequest = "The Sanv Charm -> A Favor Asked -> The Otherwordly Scepter of Medivh -> A Pathway Opened",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "The Scepter of Medivh",
            ID = "41415",
            Color = purple,
            Description = AQITEM_ITEM,
        },
    }
}
kQuestInstanceData[64].Quests.Alliance[3] = {
    Title = "3. I Am No Rat",
    Level = "61",
    Attain = "60",
    Aim = "Speak to Doorman Montigue in Lower Karazhan Halls.",
    Location = "Big Whiskers (Tower of Karazhan; "..yellow.."0, 0"..white..")",
    Note = red.."Mage only"..white..": Doorman Montigue at Lower Karazhan Halls at the beginning of the dungeon in front of the stairs.",
    Prequest = "No",
    Folgequest = "Comically Large Candle",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[64].Quests.Alliance[4] = {
    Title = "4. A Chef's Majesty",
    Level = "60",
    Attain = "60",
    Aim = "Find The Cook in Lower Karazhan Halls.",
    Location = "Recipes of Kezan (Tower of Karazhan "..yellow.."near [1]"..white..")",
    Note = "The Cook near ("..yellow.."[Lower Karazhan Halls - e]"..white..".\nA quest to obtain a cooking recipe.",
    Prequest = "No",
    Folgequest = "No Honor Among Chefs",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[64].Quests.Alliance[5] = {
    Title = "5. Cold is the Night",
    Level = "62",
    Attain = "60",
    Aim = "Investigate the mysteries of the Enchanted Amethyst.",
    Location = "Enchanted Amethyst (Tower of Karazhan drop "..yellow.."[2] "..white.."boss)",
    Note = "Quest line continues at Stormwind Vault as "..yellow.."[The Enemy Lays]"..white.." quest.",
    Prequest = "No",
    Folgequest = "Embraced by the Moon",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[64].Quests.Alliance[6] = {
    Title = "6. A Study of Magical Trees",
    Level = "61",
    Attain = "60",
    Aim = "Travel to Dire Maul and seek Lorekeeper Lydros.",
    Location = "of Ancient and Treants (Tower of Karazhan "..yellow.."near [] "..white..")",
    Note = red.."Druid only"..white..": Lorekeeper Lydros (Dire Maul - West or North; "..yellow.."[1] Library"..white..")\nQuest line for [Glyph of the Arcane Treant] at Dire Maul East.",
    Prequest = "No",
    Folgequest = "Wrapping Warpwood",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[64].Quests.Alliance[7] = {
    Title = "7. Scythe of the Goddess",
    Level = "60",
    Attain = "60",
    Aim = "Retrieve a copy of 'Vorgendor: Myths from the Blood Dimension' from Upper Karazhan.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; "..yellow.."85, 30"..white..")",
    Note = "Vorgendor: Myths from the Blood Dimension (where?) contains quest item.\n"..white.."[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Scythe of the Goddess",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[64].Quests.Alliance[8] = {
    Title = "8. Pricolich Gnarlmoon",
    Level = "60",
    Attain = "60",
    Aim = "Slay Keeper Gnarlmoon. He can be found in the Upper Chambers of Karazhan.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; "..yellow.."85, 30"..white..")",
    Note = "Need to kill "..yellow.."Keeper Gnarlmoon [1].\n"..white.."[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess --> Wisdom of Ur",
    Folgequest = "Gilnean Pricolich",
    Rewards = {
        Text = AQNoReward,
    }
}
kQuestInstanceData[64].Quests.Alliance[9] = {
    Title = "9. Scythe of the Goddess",
    Level = "60",
    Attain = "60",
    Aim = "Bring 6 Eternal Dreamstone Shards, 20 Mooncloth and Soul of a Dreadlord to Arch Druid Dreamwind.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; "..yellow.."85, 30"..white..")",
    Note = "[Soul of a Dreadlord] drop from "..yellow.."Mephistroth [8].\n"..white.."[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II "..yellow.."(Lower Karazhan Halls [5]).\n"..white.."Mooncloth from Tailoring, Eternal Dreamstone Shard from Enchanting.",
    Prequest = "Scythe of the Goddess -->> Pricolich Lycan",
    Folgequest = "The Power of the Goddess",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1",
        {
            Name = "The Scythe of Elune",
            ID = "55505",
            Color = orange,
            Description = AQITEM_TRINKET,
        },
    }
}
kQuestInstanceData[64].Quests.Horde[1] = kQuestInstanceData[64].Quests.Alliance[1]
kQuestInstanceData[64].Quests.Horde[2] = kQuestInstanceData[64].Quests.Alliance[2]
kQuestInstanceData[64].Quests.Horde[3] = kQuestInstanceData[64].Quests.Alliance[3]
kQuestInstanceData[64].Quests.Horde[4] = kQuestInstanceData[64].Quests.Alliance[4]
kQuestInstanceData[64].Quests.Horde[5] = kQuestInstanceData[64].Quests.Alliance[5]
kQuestInstanceData[64].Quests.Horde[6] = kQuestInstanceData[64].Quests.Alliance[6]
kQuestInstanceData[64].Quests.Horde[7] = kQuestInstanceData[64].Quests.Alliance[7]
kQuestInstanceData[64].Quests.Horde[8] = kQuestInstanceData[64].Quests.Alliance[8]
kQuestInstanceData[64].Quests.Horde[9] = kQuestInstanceData[64].Quests.Alliance[9]

-- Глобальные ссылки для использования базы данных
_G.KQuestInstanceData = kQuestInstanceData