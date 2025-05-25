---------------
--- COLOURS ---
---------------
local grey = "|cff999999"
local red = "|cffff0000"
local white = "|cffFFFFFF"
local green = "|cff1eff00"
local blue = "|cff0070dd"
local yellow = "|cffFFd200"
local orange = "|cffFF8000"
local purple = "|cffa335ee"

----------------------------------------------
---------------- DUNGEONS --------------------
----------------------------------------------
-- Основная таблица для данных подземелий
local KQuestInstanceData = {}

--------------- INST1 - The Deadmines ---------------
KQuestInstanceData[1] = {
    Story = "Once the greatest gold production center in the human lands, the Dead Mines were abandoned when the Horde razed Stormwind city during the First War. Now the Defias Brotherhood has taken up residence and turned the dark tunnels into their private sanctum. It is rumored that the thieves have conscripted the clever goblins to help them build something terrible at the bottom of the mines - but what that may be is still uncertain. Rumor has it that the way into the Deadmines lies through the quiet, unassuming village of Moonbrook.",
    Caption = "The Deadmines",
    QAA = "10 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[1].Quests.Alliance[1] = {
    Title = "1. Red Silk Bandanas",
    Level = "17",
    Attain = "14",
    Aim = "Scout Riell at the Sentinel Hill Tower wants you to bring her 10 Red Silk Bandanas.",
    Location = "Scout Riell (Westfall - Sentinel Hill; 56, 47)",
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
KQuestInstanceData[1].Quests.Alliance[2] = {
    Title = "2. Collecting Memories",
    Level = "18",
    Attain = "14",
    Aim = "Retrieve 4 Miners' Union Cards and return them to Wilder Thistlenettle in Stormwind.",
    Location = "Wilder Thistlenettle (Stormwind - Dwarven District; 65, 21)",
    Note = "The cards drop off undead mobs outside the instance in the area near [3] on the Entrance map.",
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
KQuestInstanceData[1].Quests.Alliance[3] = {
    Title = "3. Oh Brother. . .",
    Level = "20",
    Attain = "15",
    Aim = "Bring Foreman Thistlenettle's Explorers' League Badge to Wilder Thistlenettle in Stormwind.",
    Location = "Wilder Thistlenettle (Stormwind - Dwarven District; 65,21)",
    Note = "Foreman Thistlenettle is found outside the instance in the undead area at [3] on the Entrance map.",
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
KQuestInstanceData[1].Quests.Alliance[4] = {
    Title = "4. Underground Assault",
    Level = "20",
    Attain = "15",
    Aim = "Retrieve the Gnoam Sprecklesprocket from the Deadmines and return it to Shoni the Shilent in Stormwind.",
    Location = "Shoni the Silent (Stormwind - Dwarven District; 55,12)",
    Note = "The prequest can be obtained from Gnoarn (Dun Morogh - Gnomeregan Reclamation Facility; 24.5,30.4).\\nSneed's Shredder drops the Sprecklesprocket [3].",
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
KQuestInstanceData[1].Quests.Alliance[5] = {
    Title = "5. The Defias Brotherhood",
    Level = "22",
    Attain = "14",
    Aim = "Kill Edwin VanCleef and bring his head to Gryan Stoutmantle.",
    Location = "Gryan Stoutmantle (Westfall - Sentinel Hill; 56,47)",
    Note = "You start this Questline at Gryan Stoutmantle (Westfall - Sentinel Hill; 56,47).\\nEdwin VanCleef is the last boss of The Deadmines. You can find him at the top of his ship [6].",
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
KQuestInstanceData[1].Quests.Alliance[6] = {
    Title = "6. The Test of Righteousness",
    Level = "22",
    Attain = "20",
    Aim = "Using Jordan's Weapon Notes, find some Whitestone Oak Lumber, Bailor's Refined Ore Shipment, Jordan's Smithing Hammer, and a Kor Gem, and return them to Jordan Stilwell in Ironforge.",
    Location = "Jordan Stilwell (Dun Morogh - Ironforge Entrance; 52,36)",
    Note = "Paladin only: To see the note click on [The Test of Righteousness Information].",
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
    }
}
KQuestInstanceData[1].Quests.Alliance[7] = {
    Title = "7. The Unsent Letter",
    Level = "22",
    Attain = "16",
    Aim = "Deliver the Letter to the City Architect to Baros Alexston in Stormwind.",
    Location = "An Unsent Letter (drops from Edwin VanCleef; [6])",
    Note = "Baros Alexston is in Stormwind City, next to the Cathedral of Light at 49,30.",
    Prequest = "No",
    Folgequest = "Bazil Thredd",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[1].Quests.Alliance[8] = {
    Title = "8. Captain Grayson's Revenge",
    Level = "22",
    Attain = "15",
    Aim = "End Cookie, bring Grayson's Pendant",
    Location = "Captain Grayson (Westfall - Lighthouse; 30,86)",
    Note = "You start this Questline on the northwest island in Westfall; Red book on the ground 26.1,16.5).\\n",
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
KQuestInstanceData[1].Quests.Alliance[9] = {
    Title = "9. The Harvest Golem Mystery",
    Level = "19",
    Attain = "15",
    Aim = "Venture into the Deadmines and slay Gilnid, once done, return to Maltimor Gartside at the Gartside Plot in Westfall.",
    Location = "Maltimor Gartside (Westfall - north from Gold Coast Quarry; 31.3,37.6)",
    Note = "You start this Questline at Christopher Hewen (Westfall - Sentinel Hill Inn; 52.3,52.8).\\nQuestline has 16 quests. Final reward blue items:1) OffHand Int/Shadow res/damage and healing, 2) Mail Shoulders Str/Stam, 3) Leather Gloves Str/Agi/Stam\\nGilnid is at [4].",
    Prequest = "The Harvest Golem Mystery VIII",
    Folgequest = "The Harvest Golem Mystery X",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Tinkering Belt ",
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
KQuestInstanceData[1].Quests.Alliance[10] = {
    Title = "10. Turning Off The Tap",
    Level = "20",
    Attain = "14",
    Aim = "Infiltrate the Deadmines in Westfall and acquire Voss' Sizzling Brew.",
    Location = "Renzik 'The Shiv' (Stormwind - Old Town; 76, 60)",
    Note = "You start this Questline at the same NPC. Drop from Jared Voss is at [1].",
    Prequest = "Drones In Westfall -> Venture Delivery",
    Folgequest = "No",
    Rewards = {
        {
            Name = "Operative Cloak ",
        },
        {
            Name = "Cuffs of Integrity",
        },
    }
}
KQuestInstanceData[1].Quests.Horde[1] = {
    Title = "1. Prototype Thievery",
    Level = KQuestInstanceData[1].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[1].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[1].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[1].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[1].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[1].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[1].Quests.Alliance[1].Folgequest,
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
KQuestInstanceData[1].Quests.Horde[2] = {
    Title = "2. Captain Grayson's Revenge",
    Level = KQuestInstanceData[1].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[1].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[1].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[1].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[1].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[1].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[1].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[1].Quests.Horde[3] = {
    Title = "3. Horde Defender's Axe",
    Level = KQuestInstanceData[1].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[1].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[1].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[1].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[1].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[1].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[1].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[2] = {
    Story = "Recently, a night elf druid named Naralex discovered a network of underground caverns within the heart of the Barrens. Dubbed the 'Wailing Caverns', these natural caves were filled with steam fissures which produced long, mournful wails as they vented. Naralex believed he could use the caverns' underground springs to restore lushness and fertility to the Barrens - but to do so would require siphoning the energies of the fabled Emerald Dream. Once connected to the Dream however, the druid's vision somehow became a nightmare. Soon the Wailing Caverns began to change - the waters turned foul and the once-docile creatures inside metamorphosed into vicious, deadly predators. It is said that Naralex himself still resides somewhere inside the heart of the labyrinth, trapped beyond the edges of the Emerald Dream. Even his former acolytes have been corrupted by their master's waking nightmare - transformed into the wicked Druids of the Fang.",
    Caption = "Wailing Caverns",
    QAA = "8 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[2].Quests.Alliance[1] = {
    Title = "1. Deviate Hides",
    Level = "17",
    Attain = "13",
    Aim = "Nalpak in the Wailing Caverns wants 20 Deviate Hides.",
    Location = "Nalpak (Barrens - Wailing Caverns; 47,36)",
    Note = "All deviate mobs inside of and right before the entrance to the instance can drop hides.\\nNalpak can be found in a hidden cave above the actual cave entrance. Easiest way to him seems to be to run up the hill outside and behind the entrance and drop down the slight ledge above the cave entrance.",
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
KQuestInstanceData[2].Quests.Alliance[2] = {
    Title = "2. Trouble at the Docks",
    Level = "18",
    Attain = "14",
    Aim = "Crane Operator Bigglefuzz in Ratchet wants you to retrieve the bottle of 99-Year-Old Port from Mad Magglish who is hiding in the Wailing Caverns.",
    Location = "Crane Operator Bigglefuzz (Barrens - Ratchet; 63,37)",
    Note = "You get the bottle right before you go into the instance by killing Mad Magglish. When you first enter the cave make an immediate right to find him at the end of the passage. He is stealthed by the wall at [2] on the Entrance Map.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[2].Quests.Alliance[3] = {
    Title = "3. Smart Drinks",
    Level = "18",
    Attain = "13",
    Aim = "Bring 6 portions of Wailing Essence to Mebok Mizzyrix in Ratchet.",
    Location = "Mebok Mizzyrix (Barrens - Ratchet; 62,37)",
    Note = "The prequest can be obtained from Mebok Mizzyrix too.\\nAll Ectoplasm enemies in and before the instance drop the Essence.",
    Prequest = "Raptor Horns",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[2].Quests.Alliance[4] = {
    Title = "4. Deviate Eradication",
    Level = "21",
    Attain = "15",
    Aim = "Ebru in the Wailing Caverns wants you to kill 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers and 7 Deviate Dreadfangs.",
    Location = "Ebru (Barrens - Wailing Caverns; 47,36)",
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
KQuestInstanceData[2].Quests.Alliance[5] = {
    Title = "5. The Glowing Shard",
    Level = "26",
    Attain = "15",
    Aim = "Travel to Ratchet to find someone that can tell you more about the glowing shard.",
    Location = "The Glowing Shard (drops from Mutanus the Devourer; [9])",
    Note = "Mutanus the Devourer will only appear if you kill the four leader druids of the fang and escort the tauren druid at the entrance.\\nWhen you have the Shard, you must bring it to the Bank at Ratchet, and then back to the top of the hill over Wailing Caverns to Falla Sagewind.",
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
KQuestInstanceData[2].Quests.Alliance[6] = {
    Title = "6. Serpentbloom",
    Level = "18",
    Attain = "16",
    Aim = "Alanndarian Nightsong in Auberdine has tasked you with the collection on 10 Serpentblooms.",
    Location = "Alanndarian Nightsong (Auberdine - Darkshore; 37.7,40.7)",
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
KQuestInstanceData[2].Quests.Alliance[7] = {
    Title = "7. Trapped in the Nightmare",
    Level = "19",
    Attain = "16",
    Aim = "Alanndarian Nightsong wants you to venture into the Wailing Caverns in the Northern Barrens and free Naralex from the Nightmare. Find his Disciple in the caverns to learn how. Return to her when you free Naralex.\\nSlain Mutanus the Devourer[9].",
    Location = "Alanndarian Nightsong (Auberdine - Darkshore; 37.7,40.7)",
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
KQuestInstanceData[2].Quests.Alliance[8] = {
    Title = "8. Rampant Weeds",
    Level = "20",
    Attain = "17?",
    Aim = "Thundris Windweaver in Auberdine needs samples of the Unnatural Overgrowths in the Wailing Caverns.",
    Location = "Thundris Windweaver (Auberdine - Darkshore; 37.4,40.1)",
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
KQuestInstanceData[2].Quests.Horde[1] = KQuestInstanceData[2].Quests.Alliance[1]
KQuestInstanceData[2].Quests.Horde[2] = KQuestInstanceData[2].Quests.Alliance[2]
KQuestInstanceData[2].Quests.Horde[3] = {
    Title = "3. Serpentbloom",
    Level = KQuestInstanceData[2].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[2].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[2].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[2].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[2].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[2].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[2].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[2].Quests.Horde[4] = {
    Title = "4. Smart Drinks",
    Level = KQuestInstanceData[2].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[2].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[2].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[2].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[2].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[2].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[2].Quests.Alliance[4].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[2].Quests.Horde[5] = {
    Title = "5. Deviate Eradication",
    Level = KQuestInstanceData[2].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[2].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[2].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[2].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[2].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[2].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[2].Quests.Alliance[5].Folgequest,
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
KQuestInstanceData[2].Quests.Horde[6] = {
    Title = "6. Leaders of the Fang",
    Level = KQuestInstanceData[2].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[2].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[2].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[2].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[2].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[2].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[2].Quests.Alliance[6].Folgequest,
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
KQuestInstanceData[2].Quests.Horde[7] = {
    Title = "7. The Glowing Shard",
    Level = KQuestInstanceData[2].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[2].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[2].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[2].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[2].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[2].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[2].Quests.Alliance[7].Folgequest,
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
KQuestInstanceData[2].Quests.Horde[8] = {
    Title = "8. Arcane Arms",
    Level = KQuestInstanceData[2].Quests.Alliance[8].Level,
    Attain = KQuestInstanceData[2].Quests.Alliance[8].Attain,
    Aim = KQuestInstanceData[2].Quests.Alliance[8].Aim,
    Location = KQuestInstanceData[2].Quests.Alliance[8].Location,
    Note = KQuestInstanceData[2].Quests.Alliance[8].Note,
    Prequest = KQuestInstanceData[2].Quests.Alliance[8].Prequest,
    Folgequest = KQuestInstanceData[2].Quests.Alliance[8].Folgequest,
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
KQuestInstanceData[2].Quests.Horde[9] = {
    Title = "9. Against the Kolkar Dream",
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
KQuestInstanceData[3] = {
    Story = "Ragefire Chasm consists of a network of volcanic caverns that lie below the orcs' new capital city of Orgrimmar. Recently, rumors have spread that a cult loyal to the demonic Shadow Council has taken up residence within the Chasm's fiery depths. This cult, known as the Burning Blade, threatens the very sovereignty of Durotar. Many believe that the orc Warchief, Thrall, is aware of the Blade's existence and has chosen not to destroy it in the hopes that its members might lead him straight to the Shadow Council. Either way, the dark powers emanating from Ragefire Chasm could undo all that the orcs have fought to attain.",
    Caption = "Ragefire Chasm",
    QAA = "No Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[3].Quests.Horde[1] = {
    Title = "1. Testing an Enemy's Strength",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[3].Quests.Horde[2] = {
    Title = "2. The Power to Destroy...",
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
KQuestInstanceData[3].Quests.Horde[3] = {
    Title = "3. Searching for the Lost Satchel",
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
KQuestInstanceData[3].Quests.Horde[4] = {
    Title = "4. Hidden Enemies",
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
KQuestInstanceData[3].Quests.Horde[5] = {
    Title = "5. Slaying the Beast",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST4 - Uldaman ---------------
KQuestInstanceData[4] = {
    Story = "Uldaman is an ancient Titan vault that has laid buried deep within the earth since the world's creation. Dwarven excavations have recently penetrated this forgotten city, releasing the Titans' first failed creations: the troggs. Legends say that the Titans created troggs from stone. When they deemed the experiment a failure, the Titans locked the troggs away and tried again - resulting in the creation of the dwarven race. The secrets of the dwarves' creation are recorded on the fabled Discs of Norgannon - massive Titan artifacts that lie at the very bottom of the ancient city. Recently, the Dark Iron dwarves have launched a series of incursions into Uldaman, hoping to claim the discs for their fiery master, Ragnaros. However, protecting the buried city are several guardians - giant constructs of living stone that crush any hapless intruders they find. The Discs themselves are guarded by a massive, sentient Stonekeeper called Archaedas. Some rumors even suggest that the dwarves' stone-skinned ancestors, the earthen, still dwell deep within the city's hidden recesses.",
    Caption = "Uldaman",
    QAA = "17 Quests",
    QAH = "11 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[4].Quests.Alliance[1] = {
    Title = "1. A Sign of Hope",
    Level = "35",
    Attain = "33",
    Aim = "Find Hammertoe Grez in Uldaman.",
    Location = "Prospector Ryedol (Badlands; 53,43)",
    Note = "The Prequest starts at the Crumpled Map (Badlands; 53,33).\\nYou find Hammertoe Grez before you enter the instance, at [1] on the Entrance map.",
    Prequest = "A Sign of Hope",
    Folgequest = "Amulet of Secrets",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[2] = {
    Title = "2. Amulet of Secrets",
    Level = "40",
    Attain = "35",
    Aim = "Find Hammertoe's Amulet and return it to him in Uldaman.",
    Location = "Hammertoe Grez (Uldaman; [1] on Entrance Map).",
    Note = "The Amulet drops from Magregan Deepshadow at [2] on the Entrance Map.",
    Prequest = "A Sign of Hope",
    Folgequest = "Prospect of Faith",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[3] = {
    Title = "3. The Lost Tablets of Will",
    Level = "45",
    Attain = "35",
    Aim = "Find the Tablet of Will, and return them to Advisor Belgrum in Ironforge.",
    Location = "Advisor Belgrum (Ironforge - Hall of Explorers; 77,10)",
    Note = "The tablet is at [8].",
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
KQuestInstanceData[4].Quests.Alliance[4] = {
    Title = "4. Power Stones",
    Level = "36",
    Attain = "30",
    Aim = "Bring 8 Dentrium Power Stones and 8 An'Alleum Power Stones to Rigglefuzz in the Badlands.",
    Location = "Rigglefuzz (Badlands; 42,52)",
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
KQuestInstanceData[4].Quests.Alliance[5] = {
    Title = "5. Agmond's Fate",
    Level = "38",
    Attain = "30",
    Aim = "Bring 4 Carved Stone Urns to Prospector Ironband in Loch Modan.",
    Location = "Prospector Ironband (Loch Modan - Ironband's Excavation Site; 65,65)",
    Note = "The Prequest starts at Prospector Stormpike (Ironforge - Hall of Explorers; 74,12).\\nThe Urns are scattered throughout the caves before the instance.",
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
KQuestInstanceData[4].Quests.Alliance[6] = {
    Title = "6. Solution to Doom",
    Level = "40",
    Attain = "30",
    Aim = "Bring the Tablet of Ryun'eh to Theldurin the Lost.",
    Location = "Theldurin the Lost (Badlands; 51,76)",
    Note = "The tablet is north of the caves, at the east end of a tunnel, before the instance. On the Entrance map, it's at [3].",
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
KQuestInstanceData[4].Quests.Alliance[7] = {
    Title = "7. The Lost Dwarves",
    Level = "40",
    Attain = "35",
    Aim = "Find Baelog in Uldaman.",
    Location = "Prospector Stormpike (Ironforge - Hall of Explorers; 75,12)",
    Note = "Baelog is at [1].",
    Prequest = "No",
    Folgequest = "The Hidden Chamber",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[8] = {
    Title = "8. The Hidden Chamber",
    Level = "40",
    Attain = "35",
    Aim = "Read Baelog's Journal, explore the hidden chamber, then report to Prospector Stormpike.",
    Location = "Baelog (Uldaman; [1])",
    Note = "The Hidden Chamber is at [4]. To open the Hidden Chamber you need The Shaft of Tsol from Revelosh [3] and the Gni'kiv Medallion from Baelog's Chest [1]. Combine these two items to form Staff of Prehistoria. The Staff is used in the Map Room between [3] and [4] to summon Ironaya. After killing her, run inside the room she came from to get quest credit.",
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
KQuestInstanceData[4].Quests.Alliance[9] = {
    Title = "9. The Shattered Necklace",
    Level = "41",
    Attain = "37",
    Aim = "Search for the original creator of the shattered necklace to learn of its potential value.",
    Location = "Shattered Necklace (random drop from Uldaman)",
    Note = "Bring the necklace to Talvash del Kissel (Ironforge - The Mystic Ward; 36,3).",
    Prequest = "No",
    Folgequest = "Lore for a Price",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[10] = {
    Title = "10. Back to Uldaman",
    Level = "42",
    Attain = "37",
    Aim = "Search for clues as to the current disposition of Talvash's necklace within Uldaman. The slain paladin he mentioned was the person who has it last.",
    Location = "Talvash del Kissel (Ironforge - The Mystic Ward; 36,3)",
    Note = "The Paladin is at [2].",
    Prequest = "Lore for a Price",
    Folgequest = "Find the Gems",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[11] = {
    Title = "11. Find the Gems",
    Level = "43",
    Attain = "40",
    Aim = "Find the ruby, sapphire, and topaz that are scattered throughout Uldaman. Once acquired, contact Talvash del Kissel remotely by using the Phial of Scrying he previously gave you.",
    Location = "Remains of a Paladin (Uldaman; [2])",
    Note = "The gems are at [1] in a Conspicous Urn, [8] from the Shadowforge Cache, and [9] off Grimlok. Note that when openning the Shadowforge Cache, a few mobs will spawn an aggro you.\\nUse Talvash's Scrying Bowl to turn the quest in and get the followup.",
    Prequest = "Back to Uldaman",
    Folgequest = "Restoring the Necklace",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[12] = {
    Title = "12. Restoring the Necklace",
    Level = "44",
    Attain = "37",
    Aim = "Obtain a power source from the most powerful construct you can find in Uldaman, and deliver it to Talvash del Kissel in Ironforge.",
    Location = "Talvash's Scrying Bowl",
    Note = "The Shattered Necklace Power Source drops Archaedas [10].",
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
KQuestInstanceData[4].Quests.Alliance[13] = {
    Title = "13. Uldaman Reagent Run",
    Level = "42",
    Attain = "36",
    Aim = "Bring 12 Magenta Fungus Caps to Ghak Healtouch in Thelsamar.",
    Location = "Ghak Healtouch (Loch Modan - Thelsamar; 37,49)",
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
KQuestInstanceData[4].Quests.Alliance[14] = {
    Title = "14. Reclaimed Treasures",
    Level = "43",
    Attain = "33",
    Aim = "Get Krom Stoutarm's treasured possession from his chest in the North Common Hall of Uldaman, and bring it to him in Ironforge.",
    Location = "Krom Stoutarm (Ironforge - Hall of Explorers; 74,9)",
    Note = "You find the treasure before you enter the instance. It is in the north of the caves, at the southeast end of the first tunnel. On the entrance map, it's at [4].",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[15] = {
    Title = "15. The Platinum Discs",
    Level = "47",
    Attain = "40",
    Aim = "Speak with stone watcher and learn what ancient lore it keeps. Once you have learned what lore it has to offer, activate the Discs of Norgannon. -> Take the miniature version of the Discs of Norgannon to the Explorers' League in Ironforge.",
    Location = "The Discs of Norgannon (Uldaman; [11])",
    Note = "After you receive the quest, speak to the stone watcher to the left of the discs.  Then use the platinum discs again to recieve miniature discs, which you'll have to take to High Explorer Magellas in Ironforge - Hall of Explorers (69,18). The followup starts another NPC who is nearby.",
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
KQuestInstanceData[4].Quests.Alliance[16] = {
    Title = "16. Power in Uldaman",
    Level = "40",
    Attain = "35",
    Aim = "Retrieve an Obsidian Power Source and bring it to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; 46,57)",
    Note = "Mage only: The Obsidian Power Source drops from the Obsidian Sentinel at [5].",
    Prequest = "The Exorcism",
    Folgequest = "Mana Surges",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Alliance[17] = {
    Title = "17. Stealing a Core",
    Level = "45",
    Attain = "45",
    Aim = "Acquire an Intact Power Core  from Uldaman's Ancient Treasure [11].",
    Location = "Torble Sparksprocket (The Barrens; 48.6,83 gnome with purple goggles under the tent, next to the dwarf)",
    Note = "Intact Power Core [11], in the room with platinum disc behind the last boss in the chest behind the right pillar.\\nQuestline starts in Southern Barrens -> Bael Modan -> a little north from the path to Bael'dun Keep under the tent. First quest can be attain at lvl 18, last at lvl 53",
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
KQuestInstanceData[4].Quests.Horde[1] = {
    Title = "1. Power Stones",
    Level = KQuestInstanceData[4].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[1].Folgequest,
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
KQuestInstanceData[4].Quests.Horde[2] = {
    Title = "2. Solution to Doom",
    Level = KQuestInstanceData[4].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[4].Quests.Horde[3] = {
    Title = "3. Necklace Recovery",
    Level = KQuestInstanceData[4].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[3].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Horde[4] = {
    Title = "4. Necklace Recovery, Take 2",
    Level = KQuestInstanceData[4].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[4].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Horde[5] = {
    Title = "5. Translating the Journal",
    Level = KQuestInstanceData[4].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[5].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Horde[6] = {
    Title = "6. Find the Gems and Power Source",
    Level = KQuestInstanceData[4].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[6].Folgequest,
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
KQuestInstanceData[4].Quests.Horde[7] = {
    Title = "7. Uldaman Reagent Run",
    Level = KQuestInstanceData[4].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[7].Folgequest,
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
KQuestInstanceData[4].Quests.Horde[8] = {
    Title = "8. Reclaimed Treasures",
    Level = KQuestInstanceData[4].Quests.Alliance[8].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[8].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[8].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[8].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[8].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[8].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[8].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Horde[9] = {
    Title = "9. The Platinum Discs",
    Level = KQuestInstanceData[4].Quests.Alliance[9].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[9].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[9].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[9].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[9].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[9].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[9].Folgequest,
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
KQuestInstanceData[4].Quests.Horde[10] = {
    Title = "10. Power in Uldaman",
    Level = KQuestInstanceData[4].Quests.Alliance[10].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[10].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[10].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[10].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[10].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[10].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[10].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[4].Quests.Horde[11] = {
    Title = "11. Requisitioning a Core",
    Level = KQuestInstanceData[4].Quests.Alliance[11].Level,
    Attain = KQuestInstanceData[4].Quests.Alliance[11].Attain,
    Aim = KQuestInstanceData[4].Quests.Alliance[11].Aim,
    Location = KQuestInstanceData[4].Quests.Alliance[11].Location,
    Note = KQuestInstanceData[4].Quests.Alliance[11].Note,
    Prequest = KQuestInstanceData[4].Quests.Alliance[11].Prequest,
    Folgequest = KQuestInstanceData[4].Quests.Alliance[11].Folgequest,
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
KQuestInstanceData[5] = {
    Story = "Once the capital city of the Dark Iron dwarves, this volcanic labyrinth now serves as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain. Obsessed with defeating Nefarian and his draconic minions, Ragnaros will go to any extreme to achieve final victory.",
    Caption = "Blackrock Depths",
    QAA = "23 Quests",
    QAH = "23 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[5].Quests.Alliance[1] = {
    Title = "1. Dark Iron Legacy",
    Level = "52",
    Attain = "48",
    Aim = "Slay Fineous Darkvire and recover the great hammer, Ironfel. Take Ironfel to the Shrine of Thaurissan and place it on the statue of Franclorn Forgewright.",
    Location = "Franclorn Forgewright (Blackrock Mountain; [3] on Entrance map)",
    Note = "Franclorn is in the middle of the blackrock, above his grave. You have to be dead to see him! Talk 2 times with him to start the quest.\\nFineous Darkvire is at [9]. You find the Shrine next to the arena [7].",
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
KQuestInstanceData[5].Quests.Alliance[2] = {
    Title = "2. Ribbly Screwspigot",
    Level = "53",
    Attain = "48",
    Aim = "Bring Ribbly's Head to Yuka Screwspigot in the Burning Steppes.",
    Location = "Yuka Screwspigot (Burning Steppes - Flame Crest; 65,22)",
    Note = "You get the prequest from Yorba Screwspigot (Tanaris - Steamwheedle Port; 67,23).\\nRibbly is at [15].",
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
KQuestInstanceData[5].Quests.Alliance[3] = {
    Title = "3. The Love Potion",
    Level = "54",
    Attain = "50",
    Aim = "Bring 4 Gromsblood, 10 Giant Silver Veins and Nagmara's Filled Vial to Mistress Nagmara in Blackrock Depths.",
    Location = "Mistress Nagmara (Blackrock Depths; [15])",
    Note = "You get the Giant Silver Veins from Giants in Azshara. Gromsblood can be most easily acquired from either an herbalist or at the Auction House. Lastly, the vial can be filled at the Go-Lakka crater (Un'Goro Crater; 31,50).\\nAfter completing the quest, you can use the backdoor instead of killing Phalanx.",
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
KQuestInstanceData[5].Quests.Alliance[4] = {
    Title = "4. Hurley Blackbreath",
    Level = "55",
    Attain = "50",
    Aim = "Bring the Lost Thunderbrew Recipe to Ragnar Thunderbrew in Kharanos.",
    Location = "Ragnar Thunderbrew  (Dun Morogh - Kharanos; 46,52)",
    Note = "You get the prequest from Enohar Thunderbrew (Blasted Lands - Nethergarde Keep; 61,18).\\nYou get the recipe from one of the guards who appear if you destroy the ale [15].",
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
KQuestInstanceData[5].Quests.Alliance[5] = {
    Title = "5. Incendius!",
    Level = "56",
    Attain = "48",
    Aim = "Find Lord Incendius in Blackrock Depths and destroy him!",
    Location = "Jalinda Sprig (Burning Steppes - Morgan's Vigil; 85,69)",
    Note = "You get the prequest from Jalinda Sprig, too. You find Lord Incendius at [10].",
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
KQuestInstanceData[5].Quests.Alliance[6] = {
    Title = "6. The Heart of the Mountain",
    Level = "55",
    Attain = "50",
    Aim = "Bring the Heart of the Mountain to Maxwort Uberglint in the Burning Steppes.",
    Location = "Maxwort Uberglint (Burning Steppes - Flame Crest; 65,23)",
    Note = "You find the Heart at [8] in a safe. You get the key for the safe from Warder Stillgiss. He appears after opening all small safes.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Alliance[7] = {
    Title = "7. The Good Stuff",
    Level = "56",
    Attain = "50",
    Aim = "Travel to Blackrock Depths and recover 20 Dark Iron Fanny Packs. Return to Oralius when you have completed this task. You assume that the Dark Iron dwarves inside Blackrock Depths carry these 'fanny pack' contraptions.",
    Location = "Oralius (Burning Steppes - Morgan's Vigil; 84,68)",
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
KQuestInstanceData[5].Quests.Alliance[8] = {
    Title = "8. Marshal Windsor",
    Level = "54",
    Attain = "48",
    Aim = "Travel to Blackrock Mountain in the northwest and enter Blackrock Depths. Find out what became of Marshal Windsor.\\nYou recall Ragged John talking about Windsor being dragged off to a prison.",
    Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; 84,68)",
    Note = "This is part of the Onyxia attunement questline. It starts at Helendis Riverhorn (Burning Steppes - Morgan's Vigil; 85,68).\\nMarshal Windsor is at [4]. You have to come back to Maxwell after completing this quest.",
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
KQuestInstanceData[5].Quests.Alliance[9] = {
    Title = "9. A Crumpled Up Note",
    Level = "58",
    Attain = "50",
    Aim = "You may have just stumbled on to something that Marshal Windsor would be interested in seeing. There may be hope, after all.",
    Location = "A Crumpled Up Note (random drop from Blackrock Depths)",
    Note = "This is part of the Onyxia attunement questline. Marshal Windsor is at [4]. Best chance for drops seems to be the Dark Iron mobs around the Quarry.",
    Prequest = "Abandoned Hope",
    Folgequest = "A Shred of Hope",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Alliance[10] = {
    Title = "10. A Shred of Hope",
    Level = "58",
    Attain = "50",
    Aim = "Return Marshal Windsor's Lost Information.\\nMarshal Windsor believes that the information is being held by Golem Lord Argelmach and General Angerforge.",
    Location = "Marshal Windsor (Blackrock Depths; [4])",
    Note = "This is part of the Onyxia attunement questline. Marshal Windsor is at [4].\\nYou find Golem Lord Argelmach at [14], General Angerforge at [13].",
    Prequest = "A Crumpled Up Note",
    Folgequest = "Jail Break!",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Alliance[11] = {
    Title = "11. Jail Break!",
    Level = "58",
    Attain = "50",
    Aim = "Help Marshal Windsor get his gear back and free his friends. Return to Marshal Maxwell if you succeed.",
    Location = "Marshal Windsor (Blackrock Depths; [4])",
    Note = "This is part of the Onyxia attunement questline. Marshal Windsor is at [4].\\nThe quest is easier if you clean the Ring of Law ([6]) and the path to the entrance before you start the event. You find Marshal Maxwell at Burning Steppes - Morgan's Vigil (84,68)",
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
KQuestInstanceData[5].Quests.Alliance[12] = {
    Title = "12. A Taste of Flame",
    Level = "58",
    Attain = "52",
    Aim = "Travel to Blackrock Depths and slay Bael'Gar. [11] Return the Encased Fiery Essence to Cyrus Therepentous.",
    Location = "Cyrus Therepentous (Burning Steppes; 94,31)",
    Note = "The questline starts at Kalaran Windblade (Searing Gorge; 39,38).\\nBael'Gar is at [11].",
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
KQuestInstanceData[5].Quests.Alliance[13] = {
    Title = "13. Kharan Mighthammer",
    Level = "59",
    Attain = "50",
    Aim = "Travel to Blackrock Depths and find Kharan Mighthammer.\\nThe King mentioned that Kharan was being held prisoner there - perhaps you should try looking for a prison.",
    Location = "King Magni Bronzebeard (Ironforge; 39,55)",
    Note = "The prequest starts at Royal Historian Archesonus (Ironforge; 38,55). Kharan Mighthammer is at [2].",
    Prequest = "The Smoldering Ruins of Thaurissan",
    Folgequest = "Kharan's Tale",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Alliance[14] = {
    Title = "14. The Fate of the Kingdom",
    Level = "59",
    Attain = "50",
    Aim = "Return to Blackrock Depths and rescue Princess Moira Bronzebeard from the evil clutches of Emperor Dagran Thaurissan.",
    Location = "King Magni Bronzebeard (Ironforge; 39,55)",
    Note = "Princess Moira Bronzebeard is at [21]. During the fight she might heal Dagran. Try to interrupt her as often as possible, but hurry as she must not die or you can't complete the quest! After talking to her you have to return to Magni Bronzebeard.",
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
KQuestInstanceData[5].Quests.Alliance[15] = {
    Title = "15. Attunement to the Core",
    Level = "60",
    Attain = "55",
    Aim = "Venture to the Molten Core entry portal in Blackrock Depths and recover a Core Fragment. Return to Lothos Riftwaker in Blackrock Mountain when you have recovered the Core Fragment.",
    Location = "Lothos Riftwaker (Blackrock Mountain; [2] on Entrance Map)",
    Note = "After completing this quest, you can use the stone next to Lothos Riftwaker to enter the Molten Core.\\nYou find the Core Fragment near [23], very close to the Molten Core portal.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Alliance[16] = {
    Title = "16. The Challenge",
    Level = "60",
    Attain = "58",
    Aim = "Travel to the Ring of the Law in Blackrock Depths and place the Banner of Provocation in its center as you are sentenced by High Justice Grimstone. Slay Theldren and his gladiators and return to Anthion Harmon in the Eastern Plaguelands with the first piece of Lord Valthalak's amulet.",
    Location = "Falrin Treeshaper (Dire Maul West; [1] Library)",
    Note = "Followup quest is different for each class. Entire questline starts with quest 'An Earnest Proposition' from Deliana Ironforge Kings room behid The Bank",
    Prequest = "The Instigator's Enchantment",
    Folgequest = "(Class Quests)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Alliance[17] = {
    Title = "17. The Spectral Chalice",
    Level = "55",
    Attain = "40",
    Aim = "The gems make no sound as they fall into depths of the chalice... ",
    Location = "Gloom'rel (Blackrock Depths; [18])",
    Note = "Only Miners with skill 230 or higher can get this quest to learn Smelt Dark Iron. Materials for the Chalice: 2 [Star Ruby], 20 [Gold Bar], 10 [Truesilver Bar]. Afterwards, if you have [Dark Iron Ore] you can take it to The Black Forge at [22] and Smelt it.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Alliance[18] = {
    Title = "18. Operation Help Jabbey",
    Level = "58",
    Attain = "50",
    Aim = "Venture into Blackrock Depths, and recover the 'Extremely Potent Snuff' from Darneg Darkbeard near the Domicile, for Jabbey at Steamwheedle Port in Tanaris.",
    Location = "Jabbey (Tanaris, Steamwheedle Port; 67,24)",
    Note = "Questline starts at Bixxle Screwfuse (Tel'Abim; 52,34). Drop from Darneg Darkbeard. Rewards from Operation Final Repairs(Necks) quest and the final quest - The Dark Iron Desecrator(Gun).",
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
KQuestInstanceData[5].Quests.Alliance[19] = {
    Title = "19. The Dark Iron Desecrator",
    Level = "60",
    Attain = "55",
    Aim = "I need a Magma Condensor from within Blackrock Depths, you can find it near the Golem Laboratory[25].",
    Location = "Bixxle Screwfuse (Tel'Abim Island east from Tanaris)",
    Note = "This quest requires to collect 4 items.\\n1) Magma Condensor (Blackrock Depths in Magma Condensor Crate) \\n2) Intricate Arcanite Barrel (Blackrock Spire in Intricate Arcanite Barrels container)\\n3) Molten Fragment (Molten Core from Molten Destroyer).\\n4) Dark Iron Rifle (crafted by Engineers).\\nTo finish the construction, I will also need Fiery Core(x3) found in Molten Core, and Enchanted Thorium Bars(x10).",
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
KQuestInstanceData[5].Quests.Alliance[20] = {
    Title = "20. Senatorial Revenge",
    Level = "56",
    Attain = "45",
    Aim = "Slay 25 Shadowforge Senators deep within the Blackrock Depths for Orvak Sternrock at the Blackrock Pass in Burning Steppes.",
    Location = "Orvak Sternrock (after Redridge Mountains - Burning Steppes pass 76,68, west from alliance camp)",
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
KQuestInstanceData[5].Quests.Alliance[21] = {
    Title = "21. The Arcane Golem Core",
    Level = "55",
    Attain = "45",
    Aim = "Find, and collect an Arcane Golem Core from Golem Lord Argelmach[14]in Blackrock Depths and return to Radgan Deepblaze at Blackrock Pass in Burning Steppes.",
    Location = " Radgan Deepblaze (after Redridge Mountains - Burning Steppes pass 76,68, west from alliance camp)",
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
KQuestInstanceData[5].Quests.Alliance[22] = {
    Title = "22. To Build a Pounder",
    Level = "60",
    Attain = "30",
    Aim = "In addition to that, I also need a Perfect Golem Core for the Pounder. The Dark Iron golems in the Blackrock Depths make a good source. Golem Lord Argelmach [14] probably has one.",
    Location = "Oglethorpe Obnoticus <Master Gnome Engineer> (Stranglethorn Vale; Booty Bay 28.4,76.3).",
    Note = "(Engineers only)This quest requires to collect 3 items. \\n1) Thorium Tuned Servo (Scarlet Monastery from Scarlet Myrmidon)\\n2) Perfect Golem Core (Blackrock Depths from Golem Lord Argelmach)\\n3) Adamantite Rod (Stratholme from Crimson Hammersmith)\\n'Crowd Pummeler 9-60' in Gnomeregan drops 'Intact Pounder Mainframe' that starts the PreQuest 'A Pounding Brain'.",
    Prequest = "A Pounding Brain (Engineers only)",
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
KQuestInstanceData[5].Quests.Alliance[23] = {
    Title = "23. Winter Veil Brew",
    Level = "55",
    Attain = "45",
    Aim = "Recover the Winter Veil Keg in the caverns of Blackrock Depths for Bomarn Fireaxe at Winter Veil Vale",
    Location = "Bomarn Fireaxe at Winter Veil Vale",
    Note = "AVAILABLE ONLY while Winter Veil Holiday Event is active!Those dastardly Dark Irons stole it, no doubt hidden away in their tavern [15] deep within the Blackrock Depths.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Horde[1] = KQuestInstanceData[5].Quests.Alliance[1]
KQuestInstanceData[5].Quests.Horde[2] = KQuestInstanceData[5].Quests.Alliance[2]
KQuestInstanceData[5].Quests.Horde[3] = KQuestInstanceData[5].Quests.Alliance[3]
KQuestInstanceData[5].Quests.Horde[4] = {
    Title = "4. Lost Thunderbrew Recipe",
    Level = KQuestInstanceData[5].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[4].Folgequest,
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
KQuestInstanceData[5].Quests.Horde[5] = {
    Title = "5. The Heart of the Mountain",
    Level = KQuestInstanceData[5].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[5].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Horde[6] = {
    Title = "6. KILL ON SIGHT: Dark Iron Dwarves",
    Level = KQuestInstanceData[5].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[6].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Horde[7] = {
    Title = "7. KILL ON SIGHT: High Ranking Dark Iron Officials",
    Level = KQuestInstanceData[5].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[7].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Horde[8] = {
    Title = "8. Operation: Death to Angerforge",
    Level = KQuestInstanceData[5].Quests.Alliance[8].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[8].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[8].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[8].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[8].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[8].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[8].Folgequest,
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
KQuestInstanceData[5].Quests.Horde[9] = {
    Title = "9. The Rise of the Machines",
    Level = KQuestInstanceData[5].Quests.Alliance[9].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[9].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[9].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[9].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[9].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[9].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[9].Folgequest,
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
KQuestInstanceData[5].Quests.Horde[10] = {
    Title = "10. A Taste of Flame",
    Level = KQuestInstanceData[5].Quests.Alliance[10].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[10].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[10].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[10].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[10].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[10].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[10].Folgequest,
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
KQuestInstanceData[5].Quests.Horde[11] = {
    Title = "11. Disharmony of Fire",
    Level = KQuestInstanceData[5].Quests.Alliance[11].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[11].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[11].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[11].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[11].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[11].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[11].Folgequest,
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
KQuestInstanceData[5].Quests.Horde[12] = {
    Title = "12. The Last Element",
    Level = KQuestInstanceData[5].Quests.Alliance[12].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[12].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[12].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[12].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[12].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[12].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[12].Folgequest,
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
KQuestInstanceData[5].Quests.Horde[13] = {
    Title = "13. Commander Gor'shak",
    Level = KQuestInstanceData[5].Quests.Alliance[13].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[13].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[13].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[13].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[13].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[13].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[13].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[5].Quests.Horde[14] = {
    Title = "14. The Royal Rescue",
    Level = KQuestInstanceData[5].Quests.Alliance[14].Level,
    Attain = KQuestInstanceData[5].Quests.Alliance[14].Attain,
    Aim = KQuestInstanceData[5].Quests.Alliance[14].Aim,
    Location = KQuestInstanceData[5].Quests.Alliance[14].Location,
    Note = KQuestInstanceData[5].Quests.Alliance[14].Note,
    Prequest = KQuestInstanceData[5].Quests.Alliance[14].Prequest,
    Folgequest = KQuestInstanceData[5].Quests.Alliance[14].Folgequest,
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
KQuestInstanceData[5].Quests.Horde[15] = KQuestInstanceData[5].Quests.Alliance[15]
KQuestInstanceData[5].Quests.Horde[16] = KQuestInstanceData[5].Quests.Alliance[16]
KQuestInstanceData[5].Quests.Horde[17] = KQuestInstanceData[5].Quests.Alliance[17]
KQuestInstanceData[5].Quests.Horde[18] = KQuestInstanceData[5].Quests.Alliance[18]
KQuestInstanceData[5].Quests.Horde[19] = KQuestInstanceData[5].Quests.Alliance[19]
KQuestInstanceData[5].Quests.Horde[20] = KQuestInstanceData[5].Quests.Alliance[20]
KQuestInstanceData[5].Quests.Horde[21] = KQuestInstanceData[5].Quests.Alliance[21]
KQuestInstanceData[5].Quests.Horde[22] = KQuestInstanceData[5].Quests.Alliance[22]
KQuestInstanceData[5].Quests.Horde[23] = KQuestInstanceData[5].Quests.Alliance[23]

--------------- INST6 - Blackwing Lair ---------------
KQuestInstanceData[6] = {
    Story = "",
    Caption = "Blackwing Lair",
    QAA = "6 Quests",
    QAH = "6 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[6].Quests.Alliance[1] = {
    Title = "1. Nefarius's Corruption",
    Level = "60",
    Attain = "60",
    Aim = "Slay Nefarian and recover the Red Scepter Shard. Return the Red Scepter Shard to Anachronos at the Caverns of Time in Tanaris. You have 5 hours to complete this task.",
    Location = "Vaelastrasz the Corrupt (Blackwing Lair; [2])",
    Note = "Only one person can loot the Shard. Anachronos (Tanaris - Caverns of Time; 65,49)",
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
KQuestInstanceData[6].Quests.Alliance[2] = {
    Title = "2. The Lord of Blackrock",
    Level = "60",
    Attain = "60",
    Aim = "Return the Head of Nefarian to Highlord Bolvar Fordragon in Stormwind.",
    Location = "Head of Nefarian (drops from Nefarian; [9])",
    Note = "Highlord Bolvar Fordragon is at (Stormwind City - Stormwind Keep; 78,20). The follow up sends you to Field Marshal Afrasiabi (Stormwind - Valley of Heroes; 67,72) for the reward.",
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
KQuestInstanceData[6].Quests.Alliance[3] = {
    Title = "3. Only One May Rise",
    Level = "60",
    Attain = "60",
    Aim = "Return the Head of the Broodlord Lashlayer to Baristolth of the Shifting Sands at Cenarion Hold in Silithus.",
    Location = "Head of the Broodlord Lashlayer (drops from Broodlord Lashlayer; [3])",
    Note = "Only one person can pick up the head.",
    Prequest = "What Tomorrow Brings",
    Folgequest = "The Path of the Righteous",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[6].Quests.Alliance[4] = {
    Title = "4. The Only Prescription",
    Level = "60",
    Attain = "60",
    Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. ",
    Location = "Narain Soothfancy (Tanaris; 65,18)",
    Note = "Chapter can be looted by multiple people. Draconic for Dummies (looted from a table; [2'])",
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
KQuestInstanceData[6].Quests.Alliance[5] = {
    Title = "5. The Key to Karazhan IX",
    Level = "60",
    Attain = "58",
    Aim = "Find 'Treatise on Magical Locks and Keys' and bring it back to Vandol. It is rumored to be kept in Blackwing Lair.",
    Location = "Dolvan Bracewind (Dustwallow Marsh - Westhaven Hollow  71,73)",
    Note = "Prequest - Lord Ebonlocke (Lower Karazhan Halls). Book 'Treatise on Magical Locks and Keys' is in the last boss room [9], next to the throne. Reward from the next quest.",
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
KQuestInstanceData[6].Quests.Alliance[6] = {
    Title = "6. Scythe of the Goddess",
    Level = "60",
    Attain = "58",
    Aim = "Retrieve a copy of 'Vorgendor: Myths from the Blood Dimension' from Lord Victor Nefarius.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; 84.8,29.3 top floor of the big tree)",
    Note = "Nefarian [9] drops 'Burnt Copy of Vorgendor'.\\nQuestline starts with rare drop legendary item 'The Scythe of Elune' from boss Lord Blackwald II in [Karazhan].",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Scythe of the Goddess [Upper Karazhan] ",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[6].Quests.Horde[1] = KQuestInstanceData[6].Quests.Alliance[1]
KQuestInstanceData[6].Quests.Horde[2] = {
    Title = KQuestInstanceData[6].Quests.Alliance[2].Title,
    Level = KQuestInstanceData[6].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[6].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[6].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[6].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[6].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[6].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[6].Quests.Alliance[2].Folgequest,
    Rewards = KQuestInstanceData[6].Quests.Alliance[2].Rewards
}
KQuestInstanceData[6].Quests.Horde[3] = KQuestInstanceData[6].Quests.Alliance[3]
KQuestInstanceData[6].Quests.Horde[4] = KQuestInstanceData[6].Quests.Alliance[4]
KQuestInstanceData[6].Quests.Horde[5] = KQuestInstanceData[6].Quests.Alliance[5]
KQuestInstanceData[6].Quests.Horde[6] = KQuestInstanceData[6].Quests.Alliance[6]

--------------- INST7 - Blackfathom Deeps ---------------
KQuestInstanceData[7] = {
    Story = "Situated along the Zoram Strand of Ashenvale, Blackfathom Deeps was once a glorious temple dedicated to the night elves' moon-goddess, Elune. However, the great Sundering shattered the temple - sinking it beneath the waves of the Veiled Sea. There it remained untouched - until, drawn by its ancient power - the naga and satyr emerged to plumb its secrets. Legends hold that the ancient beast, Aku'mai, has taken up residence within the temple's ruins. Aku'mai, a favored pet of the primordial Old Gods, has preyed upon the area ever since. Drawn to Aku'mai's presence, the cult known as the Twilight's Hammer has also come to bask in the Old Gods' evil presence.",
    Caption = "Blackfathom Deeps",
    QAA = "6 Quests",
    QAH = "6 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[7].Quests.Alliance[1] = {
    Title = "1. Knowledge in the Deeps",
    Level = "23",
    Attain = "10",
    Aim = "Bring the Lorgalis Manuscript to Gerrig Bonegrip in the Forlorn Cavern in Ironforge.",
    Location = "Gerrig Bonegrip (Ironforge - The Forlorn Cavern; 50,5)",
    Note = "You find the Manuscript at [2] in the water.",
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
KQuestInstanceData[7].Quests.Alliance[2] = {
    Title = "2. Researching the Corruption",
    Level = "24",
    Attain = "18",
    Aim = "Gershala Nightwhisper in Auberdine wants 8 Corrupt Brain stems.",
    Location = "Gershala Nightwhisper (Darkshore - Auberdine; 38,43)",
    Note = "The prequest is optional. You get it from Argos Nightwhisper at (Stormwind - The Park; 21,55). \\n\\nAll the Nagas before and in Blackfathom Deeps drop the brains.",
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
KQuestInstanceData[7].Quests.Alliance[3] = {
    Title = "3. In Search of Thaelrid",
    Level = "24",
    Attain = "18",
    Aim = "Seek out Argent Guard Thaelrid in Blackfathom Deeps.",
    Location = "Dawnwatcher Shaedlass (Darnassus - Craftsmen's Terrace; 55,24)",
    Note = "You find Argent Guard Thaelrid at [4].",
    Prequest = "No",
    Folgequest = "Blackfathom Villainy",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[7].Quests.Alliance[4] = {
    Title = "4. Blackfathom Villainy",
    Level = "27",
    Attain = "18",
    Aim = "Bring the head of Twilight Lord Kelris to Dawnwatcher Selgorm in Darnassus.",
    Location = "Argent Guard Thaelrid (Blackfathom Deeps; [4])",
    Note = "Twilight Lord Kelris is at [8]. You find Dawnwatcher Selgorm in Darnassus - Craftsmen's Terrace (55,24). \\n\\nATTENTION! If you turn on the flames beside Lord Kelris, enemies appear and attack you.",
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
KQuestInstanceData[7].Quests.Alliance[5] = {
    Title = "5. Twilight Falls",
    Level = "25",
    Attain = "20",
    Aim = "Bring 10 Twilight Pendants to Argent Guard Manados in Darnassus.",
    Location = "Argent Guard Manados (Darnassus - Craftsmen's Terrace; 55,23)",
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
KQuestInstanceData[7].Quests.Alliance[6] = {
    Title = "6. The Orb of Soran'ruk",
    Level = "25",
    Attain = "20",
    Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens.",
    Location = "Doan Karhan (Barrens; 49,57)",
    Note = "Warlock only: You get the 3 Soran'ruk Fragments from Twilight Accolytes in [Blackfathom Deeps]. You get the Large Soran'ruk Fragment in [Shadowfang Keep] from Shadowfang Darksouls.",
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
KQuestInstanceData[7].Quests.Horde[1] = {
    Title = "1. The Essence of Aku'Mai",
    Level = KQuestInstanceData[7].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[7].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[7].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[7].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[7].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[7].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[7].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[7].Quests.Horde[2] = {
    Title = "2. Allegiance to the Old Gods",
    Level = KQuestInstanceData[7].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[7].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[7].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[7].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[7].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[7].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[7].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[7].Quests.Horde[3] = {
    Title = "3. Amongst the Ruins",
    Level = KQuestInstanceData[7].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[7].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[7].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[7].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[7].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[7].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[7].Quests.Alliance[3].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[7].Quests.Horde[4] = {
    Title = KQuestInstanceData[7].Quests.Alliance[4].Title,
    Level = KQuestInstanceData[7].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[7].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[7].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[7].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[7].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[7].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[7].Quests.Alliance[4].Folgequest,
    Rewards = KQuestInstanceData[7].Quests.Alliance[4].Rewards
}
KQuestInstanceData[7].Quests.Horde[5] = {
    Title = "5. The Orb of Soran'ruk",
    Level = KQuestInstanceData[7].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[7].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[7].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[7].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[7].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[7].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[7].Quests.Alliance[5].Folgequest,
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
KQuestInstanceData[7].Quests.Horde[6] = {
    Title = "6. Baron Aquanis",
    Level = KQuestInstanceData[7].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[7].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[7].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[7].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[7].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[7].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[7].Quests.Alliance[6].Folgequest,
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
KQuestInstanceData[8] = {
    Story = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself.",
    Caption = "Lower Blackrock Spire",
    QAA = "15 Quests",
    QAH = "18 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[8].Quests.Alliance[1] = {
    Title = "1. The Final Tablets",
    Level = "58",
    Attain = "40",
    Aim = "Bring the Fifth and Sixth Mosh'aru Tablets to Prospector Ironboot in Tanaris.",
    Location = "Prospector Ironboot (Tanaris - Steamwheedle Port; 66,23)",
    Note = "You find the tablets near [7] and [9].\\nThe Rewards belong to 'Confront Yeh'kinya'. You find Yeh'kinya near Prospector Ironboot.",
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
KQuestInstanceData[8].Quests.Alliance[2] = {
    Title = "2. Kibler's Exotic Pets",
    Level = "59",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and find Bloodaxe Worg Pups. Use the cage to carry the ferocious little beasts. Bring back a Caged Worg Pup to Kibler.",
    Location = "Kibler (Burning Steppes - Flame Crest; 65,22)",
    Note = "You find the Worg Cup at [17].",
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
KQuestInstanceData[8].Quests.Alliance[3] = {
    Title = "3. En-Ay-Es-Tee-Why",
    Level = "59",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and collect 15 Spire Spider Eggs for Kibler.",
    Location = "Kibler (Burning Steppes - Flame Crest; 65,22)",
    Note = "You find the spider eggs near [13].",
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
KQuestInstanceData[8].Quests.Alliance[4] = {
    Title = "4. Mother's Milk",
    Level = "60",
    Attain = "55",
    Aim = "In the heart of Blackrock Spire you will find Mother Smolderweb. Engage her and get her to poison you. Chances are good that you will have to kill her as well. Return to Ragged John when you are poisoned so that he can 'milk' you.",
    Location = "Ragged John (Burning Steppes - Flame Crest; 65,23)",
    Note = "Mother Smolderweb is at [13]. The poison effect snares nearby players as well. If it is removed or dispelled, you fail the quest.",
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
KQuestInstanceData[8].Quests.Alliance[5] = {
    Title = "5. Put Her Down",
    Level = "59",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and destroy the source of the worg menace. As you left Helendis, he shouted a name: Halycon. It is what the orcs refer to in regards to the worg.",
    Location = "Helendis Riverhorn (Burning Steppes - Morgan's Vigil; 5,47)",
    Note = "You find Halycon at [17].",
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
KQuestInstanceData[8].Quests.Alliance[6] = {
    Title = "6. Urok Doomhowl",
    Level = "60",
    Attain = "55",
    Aim = "Read Warosh's Scroll. Bring Warosh's Mojo to Warosh.",
    Location = "Warosh (Blackrock Spire; [2])",
    Note = "To get Warosh's Mojo you have to evoke and kill Urok Doomhowl [15]. For his Evocation you need a Spear and Highlord Omokk's Head [5]. The Spear is at [3]. During the Evocation a few waves of ogres appear before Urok Doomhowl attacks you. You can use the Spear during the fight to damage the ogres.",
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
KQuestInstanceData[8].Quests.Alliance[7] = {
    Title = "7. Bijou's Belongings",
    Level = "59",
    Attain = "55",
    Aim = "Find Bijou's Belongings and return them to her. Good luck!",
    Location = "Bijou (Blackrock Spire; [3])",
    Note = "You find Bijou's Belongings on the way to Mother Smolderweb at [13].\\nMaxwell is at (Burning Steppes - Morgan's Vigil; 84,58).",
    Prequest = "No",
    Folgequest = "Message to Maxwell",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[8].Quests.Alliance[8] = {
    Title = "8. Maxwell's Mission",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and destroy War Master Voone, Highlord Omokk, and Overlord Wyrmthalak. Return to Marshal Maxwell when the job is done.",
    Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; 84,58)",
    Note = "You find War Master Voone at [9], Highlord Omokk at [5] and Overlord Wyrmthalak at [19].",
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
KQuestInstanceData[8].Quests.Alliance[9] = {
    Title = "9. Seal of Ascension",
    Level = "60",
    Attain = "57",
    Aim = "Find the three gemstones of command: The Gemstone of Smolderthorn, Gemstone of Spirestone, and Gemstone of Bloodaxe. Return them, along with the Unadorned Seal of Ascension, to Vaelan.",
    Location = "Vaelan (Blackrock Spire; [1])",
    Note = "You get the Gemstone of Spirestone from Highlord Omokk at [5], the Gemstone of Smolderthorn from War Master Voone at [9] and the Gemstone of Bloodaxe from Overlord Wyrmthalak at [19]. The Unadorned Seal of Ascension can drop from near all enemys in Lower Blackrock Spire. You get the Key for Upper Blackrock Spire if you complete this questline.",
    Prequest = "No",
    Folgequest = "Seal of Ascension",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[8].Quests.Alliance[10] = {
    Title = "10. General Drakkisath's Command",
    Level = "60",
    Attain = "55",
    Aim = "Take General Drakkisath's Command to Marshal Maxwell in Burning Steppes.",
    Location = "General Drakkisath's Command (drops from Overlord Wyrmthalak; [19])",
    Note = "Marshal Maxwell is in the Burning Steppes - Morgan's Vigil; (84,58).",
    Prequest = "No",
    Folgequest = "General Drakkisath's Demise (Upper Blackrock Spire)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[8].Quests.Alliance[11] = {
    Title = "11. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Mor Grayhoof and slay him. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nMor Grayhoof is summoned at [9].",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[8].Quests.Alliance[12] = {
    Title = "12. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Mor Grayhoof and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nMor Grayhoof is summoned at [9].",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations (Upper Blackrock Spire)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[8].Quests.Alliance[13] = {
    Title = "13. Snakestone of the Shadow Huntress",
    Level = "60",
    Attain = "50",
    Aim = "Travel to Blackrock Spire and slay Shadow Hunter Vosh'gajin. Recover Vosh'gajin's Snakestone and return to Kilram.",
    Location = "Kilram (Winterspring - Everlook; 61,37)",
    Note = "Blacksmith quest. Shadow Hunter Vosh'gajin is at [7].",
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
KQuestInstanceData[8].Quests.Alliance[14] = {
    Title = "14. Hot Fiery Death",
    Level = "60",
    Attain = "60",
    Aim = "Someone in this world must know what to do with these gauntlets. Good luck!",
    Location = "Human Remains (Lower Blackrock Spire; [9])",
    Note = "Blacksmith quest. Be sure to pick up the Unfired Plate Gauntlets near the Human Remains at [11]. Turns in to Malyfous Darkhammer (Winterspring - Everlook; 61,39). Rewards listed are for the followup.",
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
KQuestInstanceData[8].Quests.Alliance[15] = {
    Title = "15. The Dark Iron Desecrator",
    Level = "60",
    Attain = "55",
    Aim = "I require a Intricate Arcanite Barrel which can handle extreme heat. This can be found deep within Lower Blackrock Spire, near the Quartermaster [16] there.",
    Location = "Bixxle Screwfuse (Tel'Abim; 52,34)",
    Note = "This quest requires to collect 4 items.\\n1) Magma Condensor (Blackrock Depths in Magma Condensor Crate) \\n2) Intricate Arcanite Barrel (Blackrock Spire in Intricate Arcanite Barrels container)\\n3) Molten Fragment (Molten Core from Molten Destroyer).\\n4) Dark Iron Rifle (crafted by Engineers).\\nFiery Core(x3) found in Molten Core, and Enchanted Thorium Bars(x10).",
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
KQuestInstanceData[8].Quests.Horde[1] = KQuestInstanceData[8].Quests.Alliance[1]
KQuestInstanceData[8].Quests.Horde[2] = KQuestInstanceData[8].Quests.Alliance[2]
KQuestInstanceData[8].Quests.Horde[3] = KQuestInstanceData[8].Quests.Alliance[3]
KQuestInstanceData[8].Quests.Horde[4] = KQuestInstanceData[8].Quests.Alliance[4]
KQuestInstanceData[8].Quests.Horde[5] = {
    Title = "5. The Pack Mistress",
    Level = KQuestInstanceData[8].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[8].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[8].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[8].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[8].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[8].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[8].Quests.Alliance[5].Folgequest,
    Rewards = KQuestInstanceData[8].Quests.Alliance[5].Rewards
}
KQuestInstanceData[8].Quests.Horde[6] = KQuestInstanceData[8].Quests.Alliance[6]
KQuestInstanceData[8].Quests.Horde[7] = {
    Title = "7. Operative Bijou",
    Level = KQuestInstanceData[8].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[8].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[8].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[8].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[8].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[8].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[8].Quests.Alliance[7].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[8].Quests.Horde[8] = {
    Title = "8. Bijou's Belongings",
    Level = KQuestInstanceData[8].Quests.Alliance[8].Level,
    Attain = KQuestInstanceData[8].Quests.Alliance[8].Attain,
    Aim = KQuestInstanceData[8].Quests.Alliance[8].Aim,
    Location = KQuestInstanceData[8].Quests.Alliance[8].Location,
    Note = KQuestInstanceData[8].Quests.Alliance[8].Note,
    Prequest = KQuestInstanceData[8].Quests.Alliance[8].Prequest,
    Folgequest = KQuestInstanceData[8].Quests.Alliance[8].Folgequest,
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
KQuestInstanceData[8].Quests.Horde[9] = KQuestInstanceData[8].Quests.Alliance[9]
KQuestInstanceData[8].Quests.Horde[10] = {
    Title = "10. Warlord's Command",
    Level = KQuestInstanceData[8].Quests.Alliance[10].Level,
    Attain = KQuestInstanceData[8].Quests.Alliance[10].Attain,
    Aim = KQuestInstanceData[8].Quests.Alliance[10].Aim,
    Location = KQuestInstanceData[8].Quests.Alliance[10].Location,
    Note = KQuestInstanceData[8].Quests.Alliance[10].Note,
    Prequest = KQuestInstanceData[8].Quests.Alliance[10].Prequest,
    Folgequest = KQuestInstanceData[8].Quests.Alliance[10].Folgequest,
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
KQuestInstanceData[8].Quests.Horde[11] = KQuestInstanceData[8].Quests.Alliance[11]
KQuestInstanceData[8].Quests.Horde[12] = KQuestInstanceData[8].Quests.Alliance[12]
KQuestInstanceData[8].Quests.Horde[13] = KQuestInstanceData[8].Quests.Alliance[13]
KQuestInstanceData[8].Quests.Horde[14] = KQuestInstanceData[8].Quests.Alliance[14]
KQuestInstanceData[8].Quests.Horde[15] = KQuestInstanceData[8].Quests.Alliance[15]
KQuestInstanceData[8].Quests.Horde[16] = {
    Title = "16. Forest Troll Scum",
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
KQuestInstanceData[8].Quests.Horde[17] = {
    Title = "17. Raider's Raid",
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
KQuestInstanceData[8].Quests.Horde[18] = {
    Title = "18. The Final Crack",
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
KQuestInstanceData[9] = {
    Story = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself.",
    Caption = "Upper Blackrock Spire",
    QAA = "12 Quests",
    QAH = "13 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[9].Quests.Alliance[1] = {
    Title = "1. The Matron Protectorate",
    Level = "60",
    Attain = "57",
    Aim = "Travel to Winterspring and find Haleh. Give her Awbee's scale.",
    Location = "Awbee (Blackrock Spire; [7])",
    Note = "You find Awbee in the room after the Arena at [7]. She stands on a jutty.\\nHaleh is in Winterspring (54,51). Use the portal-sign in the end of the cave to get to her.",
    Prequest = "No",
    Folgequest = "Wrath of the Blue Flight",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Alliance[2] = {
    Title = "2. Finkle Einhorn, At Your Service!",
    Level = "60",
    Attain = "55",
    Aim = "Talk to Malyfous Darkhammer in Everlook.",
    Location = "Finkle Einhorn (Blackrock Spire; [8])",
    Note = "Finkle Einhorn spawns after skinning The Beast. You find Malyfous at (Winterspring - Everlook; 61,38).",
    Prequest = "No",
    Folgequest = "Leggings of Arcana, Cap of the Scarlet Savant, Breastplate of Bloodthirst and Shoulderguards of the Lightbringer",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Alliance[3] = {
    Title = "3. Egg Freezing",
    Level = "60",
    Attain = "57",
    Aim = "Use the Eggscilloscope Prototype on an egg in the Rookery.",
    Location = "Tinkee Steamboil (Burning Steppes - Flame Crest; 65,24)",
    Note = "You find the eggs in the room of Father Flame at [2].",
    Prequest = "Broodling Essence -> Tinkee Steamboil",
    Folgequest = "Egg Collection -> Leonid Barthalomew -> Dawn's Gambit (Scholomance)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Alliance[4] = {
    Title = "4. Eye of the Emberseer",
    Level = "60",
    Attain = "56",
    Aim = "Bring the Eye of the Emberseer to Duke Hydraxis in Azshara.",
    Location = "Duke Hydraxis (Azshara; 79,73)",
    Note = "You can find Pyroguard Emberseer at [1].",
    Prequest = "Poisoned Water, Stormers and Rumblers",
    Folgequest = "The Molten Core",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Alliance[5] = {
    Title = "5. General Drakkisath's Demise",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and destroy General Drakkisath. Return to Marshal Maxwell when the job is done.",
    Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; 82,68)",
    Note = "You find General Drakkisath at [9].",
    Prequest = "General Drakkisath's Command (Lower Blackrock Spire)",
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
KQuestInstanceData[9].Quests.Alliance[6] = {
    Title = "6. Doomrigger's Clasp",
    Level = "60",
    Attain = "57",
    Aim = "Bring Doomrigger's Clasp to Mayara Brightwing in the Burning Steppes.",
    Location = "Mayara Brightwing (Burning Steppes - Morgan's Vigil; 84,69)",
    Note = "You get the prequest from Count Remington Ridgewell (Stormwind - Stormwind Keep; 74,30).\\n\\nDoomrigger's Clasp is at [3] in a chest.",
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
KQuestInstanceData[9].Quests.Alliance[7] = {
    Title = "7. Drakefire Amulet",
    Level = "60",
    Attain = "50",
    Aim = "You must retrieve the Blood of the Black Dragon Champion from General Drakkisath. Drakkisath can be found in his throne room behind the Halls of Ascension in Blackrock Spire.",
    Location = "Haleh (Winterspring; 54,51)",
    Note = "Last part of the Onyxia quest chain for the Alliance. You find General Drakkisath at [9].",
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
KQuestInstanceData[9].Quests.Alliance[8] = {
    Title = "8. Blackhand's Command",
    Level = "60",
    Attain = "55",
    Aim = "The letter indicates that General Drakkisath guards the brand. Perhaps you should investigate.",
    Location = "Blackhand's Command (drops from Scarshield Quartermaster; [7] on Entrance Map)",
    Note = "Blackwing Lair attunement quest. Scarshield Quartermaster is found if you turn right before the LBRS/UBRS portal.\\n\\nGeneral Drakkisath is at [9]. The brand is behind him.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Alliance[9] = {
    Title = "9. Final Preparations",
    Level = "60",
    Attain = "58",
    Aim = "Gather 40 Blackrock Bracers and acquire a Flask of Supreme Power. Return them to Bodley inside Blackrock Mountain.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Blackrock Bracers drop off mobs with Blackhand in the name. Flask of Supreme Power is made by an Alchemist.",
    Prequest = "The Right Piece of Lord Valthalak's Amulet (Upper Blackrock Spire)",
    Folgequest = "Mea Culpa, Lord Valthalak",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Alliance[10] = {
    Title = "10. Mea Culpa, Lord Valthalak",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon Lord Valthalak. Dispatch him, and use Lord Valthalak's Amulet on the corpse. Then, return Lord Valthalak's Amulet to the Spirit of Lord Valthalak.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Lord Valthalak is summoned at [8]. Rewards listed are for Return to Bodley.",
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
KQuestInstanceData[9].Quests.Alliance[11] = {
    Title = "11. The Demon Forge",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Blackrock Spire and find Goraluk Anvilcrack. Slay him and then use the Blood Stained Pike upon his corpse. After his soul has been siphoned, the pike will be Soul Stained. You must also find the Unforged Rune Covered Breastplate. Return both the Soul Stained Pike and the Unforged Rune Covered Breastplate to Lorax in Winterspring.",
    Location = "Lorax (Winterspring; 64,74)",
    Note = "Blacksmith quest. Goraluk Anvilcrack is at [5].",
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
KQuestInstanceData[9].Quests.Alliance[12] = {
    Title = "12. The Upper Binding I",
    Level = "60",
    Attain = "55",
    Aim = "Gather a Dragonkin Charge from the Black Dragonkin(Solakar Flamewreath) [2] within Blackrock Spire for Parnabus in Gilneas.",
    Location = "Parnabus <Wandering Wizard> (Gilneas; [22.9,74.4], very south of Gilneas City, west of river. inside of a lonely house).",
    Note = "Highly recommend to take prequest 'The Binding of Xanthar' from Hanvar the Righteous (Deadwind Pass in the small church outside of Karazhan [40.9,79.3]).\\nReward for the last quest of The Upper Binding quest chain will be quest item 'The Upper Binding of Xanthar' for quest 'The Binding of Xanthar'.",
    Prequest = "The Binding of Xanthar",
    Folgequest = "The Upper Binding II -> The Upper Binding III [Dire Maul West] -> The Upper Binding IV",
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
KQuestInstanceData[9].Quests.Horde[1] = KQuestInstanceData[9].Quests.Alliance[1]
KQuestInstanceData[9].Quests.Horde[2] = KQuestInstanceData[9].Quests.Alliance[2]
KQuestInstanceData[9].Quests.Horde[3] = KQuestInstanceData[9].Quests.Alliance[3]
KQuestInstanceData[9].Quests.Horde[4] = KQuestInstanceData[9].Quests.Alliance[4]
KQuestInstanceData[9].Quests.Horde[5] = {
    Title = "5. The Darkstone Tablet",
    Level = KQuestInstanceData[9].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[5].Folgequest,
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
KQuestInstanceData[9].Quests.Horde[6] = {
    Title = "6. For The Horde!",
    Level = KQuestInstanceData[9].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[6].Folgequest,
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
KQuestInstanceData[9].Quests.Horde[7] = {
    Title = "7. Oculus Illusions",
    Level = KQuestInstanceData[9].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[7].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Horde[8] = {
    Title = "8. Blood of the Black Dragon Champion",
    Level = KQuestInstanceData[9].Quests.Alliance[8].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[8].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[8].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[8].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[8].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[8].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[8].Folgequest,
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
KQuestInstanceData[9].Quests.Horde[9] = {
    Title = "9. Blackhand's Command",
    Level = KQuestInstanceData[9].Quests.Alliance[9].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[9].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[9].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[9].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[9].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[9].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[9].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Horde[10] = {
    Title = "10. Final Preparations",
    Level = KQuestInstanceData[9].Quests.Alliance[10].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[10].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[10].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[10].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[10].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[10].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[10].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[9].Quests.Horde[11] = {
    Title = "11. Mea Culpa, Lord Valthalak",
    Level = KQuestInstanceData[9].Quests.Alliance[11].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[11].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[11].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[11].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[11].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[11].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[11].Folgequest,
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
KQuestInstanceData[9].Quests.Horde[12] = {
    Title = "12. The Demon Forge",
    Level = KQuestInstanceData[9].Quests.Alliance[12].Level,
    Attain = KQuestInstanceData[9].Quests.Alliance[12].Attain,
    Aim = KQuestInstanceData[9].Quests.Alliance[12].Aim,
    Location = KQuestInstanceData[9].Quests.Alliance[12].Location,
    Note = KQuestInstanceData[9].Quests.Alliance[12].Note,
    Prequest = KQuestInstanceData[9].Quests.Alliance[12].Prequest,
    Folgequest = KQuestInstanceData[9].Quests.Alliance[12].Folgequest,
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
KQuestInstanceData[9].Quests.Horde[13] = {
    Title = "13. The Upper Binding I",
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
KQuestInstanceData[10] = {
    Story = "Built twelve thousand years ago by a covert sect of night elf sorcerers, the ancient city of Eldre'Thalas was used to protect Queen Azshara's most prized arcane secrets. Though it was ravaged by the Great Sundering of the world, much of the wondrous city still stands as the imposing Dire Maul. The ruins' three distinct districts have been overrun by all manner of creatures - especially the spectral highborne, foul satyr and brutish ogres. Only the most daring party of adventurers can enter this broken city and face the ancient evils locked within its ancient vaults.",
    Caption = "Dire Maul (East)",
    QAA = "9 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[10].Quests.Alliance[1] = {
    Title = "1. Pusillin and the Elder Azj'Tordin",
    Level = "58",
    Attain = "54",
    Aim = "Travel to Dire Maul and locate the Imp, Pusillin. Convince Pusillin to give you Azj'Tordin's Book of Incantations through any means necessary.\\nReturn to Azj'Tordin at the Lariss Pavilion in Feralas should you recover the Book of Incantations.",
    Location = "Azj'Tordin (Feralas - Lariss Pavillion; 76,37)",
    Note = "Pusillin is in Dire Maul East at [1]. He runs when you talk to him, but stops and fights at [2]. He'll drop the Crescent Key which is used for Dire Maul North and West.",
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
KQuestInstanceData[10].Quests.Alliance[2] = {
    Title = "2. Lethtendris's Web",
    Level = "57",
    Attain = "54",
    Aim = "Bring Lethtendris' Web to Latronicus Moonspear at the Feathermoon Stronghold in Feralas.",
    Location = "Latronicus Moonspear (Feralas - Feathermoon Stronghold; 30,46)",
    Note = "Lethtendris is in Dire Maul East at [3]. The prequest comes from Courier Hammerfall in Ironforge. He roams the entire city.",
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
KQuestInstanceData[10].Quests.Alliance[3] = {
    Title = "3. Shards of the Felvine",
    Level = "60",
    Attain = "56",
    Aim = "Find the Felvine in Dire Maul and acquire a shard from it. Chances are you'll only be able to procure one with the demise of Alzzin the Wildshaper. Use the Reliquary of Purity to securely seal the shard inside, and return it to Rabine Saturna in Nighthaven, Moonglade.",
    Location = "Rabine Saturna (Moonglade - Nighthaven; 51,44)",
    Note = "You find Alliz the Wildshaper in the East part of Dire Maul at [5]. The relict is in Silithius at 62,54. The prequest comes from Rabine Saturna as well.",
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
KQuestInstanceData[10].Quests.Alliance[4] = {
    Title = "4. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Isalien and slay her. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nIsalien is summoned at [5].",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[10].Quests.Alliance[5] = {
    Title = "5. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Isalien and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nIsalien is summoned at [5].",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations (Upper Blackrock Spire)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[10].Quests.Alliance[6] = {
    Title = "6. The Prison's Bindings",
    Level = "60",
    Attain = "60",
    Aim = "Travel to Dire Maul in Feralas and recover 15 Satyr Blood from the Wildspawn Satyr that inhabit the Warpwood Quarter. Return to Daio in the Tainted Scar when this is done.",
    Location = "Daio the Decrepit (Blasted Lands - The Tainted Scar; 34,50)",
    Note = "Warlock only: This along with another quest given by Daio the Decrepit are Warlock only quests for the Ritual of Doom spell. The easiest way to get to the Wildspawn Satyr is to enter Dire Maul East through the 'back door' at the Lariss Pavilion (Feralas; 77,37). You'll need the Crescent Key, however.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[10].Quests.Alliance[7] = {
    Title = "7. Arcane Refreshment",
    Level = "60",
    Attain = "60",
    Aim = "Travel to the Warpwood Quarter of Dire Maul and slay the water elemental, Hydrospawn. Return to Lorekeeper Lydros in the Athenaeum with the Hydrospawn Essence.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; [1] Library)",
    Note = "Mage Only: Hydrospawn Essence drop from [3] Hydrospawn. Reward: you can use Conjured Crystal Water.",
    Prequest = "No",
    Folgequest = "A Special Kind of Summons",
}
KQuestInstanceData[10].Quests.Alliance[8] = {
    Title = "8. The Wildshaper",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Head of Alzzin the Wildshaper for Arch Druid Dreamwind at Nordanaar in Hyjal.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; 84.8,29.3 top floor of the big tree)",
    Note = "You find Alliz the Wildshaper at [5].",
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
KQuestInstanceData[10].Quests.Alliance[9] = {
    Title = "9. Wrapping Warpwood",
    Level = "61",
    Attain = "60",
    Aim = "Bring 5 Blue Leaves to Lorekeeper Lydros.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; [1] Library)",
    Note = "Druid Only: Blue Leaves drop from Treants.\\nPrequest start [of Ancients and Treants] - (Tower of Karazhan near [0])",
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
KQuestInstanceData[10].Quests.Horde[1] = KQuestInstanceData[10].Quests.Alliance[1]
KQuestInstanceData[10].Quests.Horde[2] = {
    Title = KQuestInstanceData[10].Quests.Alliance[2].Title,
    Level = KQuestInstanceData[10].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[10].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[10].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[10].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[10].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[10].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[10].Quests.Alliance[2].Folgequest,
    Rewards = KQuestInstanceData[10].Quests.Alliance[2].Rewards
}
KQuestInstanceData[10].Quests.Horde[3] = KQuestInstanceData[10].Quests.Alliance[3]
KQuestInstanceData[10].Quests.Horde[4] = KQuestInstanceData[10].Quests.Alliance[4]
KQuestInstanceData[10].Quests.Horde[5] = KQuestInstanceData[10].Quests.Alliance[5]
KQuestInstanceData[10].Quests.Horde[6] = KQuestInstanceData[10].Quests.Alliance[6]
KQuestInstanceData[10].Quests.Horde[7] = KQuestInstanceData[10].Quests.Alliance[7]
KQuestInstanceData[10].Quests.Horde[8] = KQuestInstanceData[10].Quests.Alliance[8]
KQuestInstanceData[10].Quests.Horde[9] = KQuestInstanceData[10].Quests.Alliance[9]

--------------- INST11 - Dire Maul (North) ---------------
KQuestInstanceData[11] = {
    Story = "",
    Caption = "Dire Maul (North)",
    QAA = "4 Quests",
    QAH = "4 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[11].Quests.Alliance[1] = {
    Title = "1. A Broken Trap",
    Level = "60",
    Attain = "56",
    Aim = "Repair the trap.",
    Location = "A Broken Trap (Dire Maul; North)",
    Note = "Repeatable quest. To repair the trap you have to use a [Thorium Widget] and a [Frost Oil].",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[11].Quests.Alliance[2] = {
    Title = "2. The Gordok Ogre Suit",
    Level = "60",
    Attain = "56",
    Aim = "Bring 4 Bolts of Runecloth, 8 Rugged Leather, 2 Rune Threads, and Ogre Tannin to Knot Thimblejack. He is currently chained inside the Gordok wing of Dire Maul.",
    Location = "Knot Thimblejack (Dire Maul; North, [4])",
    Note = "Repeatable quest. You get the Ogre Tannin near [4] (above).",
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
KQuestInstanceData[11].Quests.Alliance[3] = {
    Title = "3. Free Knot!",
    Level = "60",
    Attain = "57",
    Aim = "Collect a Gordok Shackle Key for Knot Thimblejack.",
    Location = "Knot Thimblejack (Dire Maul; North, [4])",
    Note = "Repeatable quest. Every warden can drop the key.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[11].Quests.Alliance[4] = {
    Title = "4. Unfinished Gordok Business",
    Level = "60",
    Attain = "56",
    Aim = "Find the Gauntlet of Gordok Might and return it to Captain Kromcrush in Dire Maul.\\nAccording to Kromcrush, the 'old timey story' says that Tortheldrin - a 'creepy' elf who called himself a prince - stole it from one of the Gordok kings.",
    Location = "Captain Kromcrush (Dire Maul; North, [5])",
    Note = "Prince is in Dire Maul West at [7]. The Gauntlet is near him in a chest. You can only get this quest after a Tribute run and have the 'King of the Gordok' buff.",
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
KQuestInstanceData[11].Quests.Horde[1] = KQuestInstanceData[11].Quests.Alliance[1]
KQuestInstanceData[11].Quests.Horde[2] = KQuestInstanceData[11].Quests.Alliance[2]
KQuestInstanceData[11].Quests.Horde[3] = KQuestInstanceData[11].Quests.Alliance[3]
KQuestInstanceData[11].Quests.Horde[4] = KQuestInstanceData[11].Quests.Alliance[4]

--------------- INST12 - Dire Maul (West) ---------------
KQuestInstanceData[12] = {
    Story = "",
    Caption = "Dire Maul (West)",
    QAA = "21 Quests",
    QAH = "21 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[12].Quests.Alliance[1] = {
    Title = "1. Elven Legends",
    Level = "60",
    Attain = "54",
    Aim = "Search Dire Maul for Kariel Winthalus. Report back to Scholar Runethorn at Feathermoon with whatever information that you may find.",
    Location = "Scholar Runethorn (Feralas - Feathermoon Stronghold; 31,43)",
    Note = "You find Kariel Winthalus in the Library (West).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[12].Quests.Alliance[2] = {
    Title = "2. The Madness Within",
    Level = "60",
    Attain = "56",
    Aim = "You must destroy the guardians surrounding the 5 Pylons that power the Prison of Immol'thar. Once the Pylons have powered down, the force field surrounding Immol'thar will have dissipated.\\nEnter the Prison of Immol'thar and eradicate the foul demon that stands at its heart. Finally, confront Prince Tortheldrin in Athenaeum.",
    Location = "Shen'dralar Ancient (Dire Maul; West, [1] (above))",
    Note = "The Pylons are marked as [B]. Immol'thar is at [6], Prince Tortheldrin at [7].",
    Prequest = "No",
    Folgequest = "The Treasure of the Shen'dralar",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[12].Quests.Alliance[3] = {
    Title = "3. The Treasure of the Shen'dralar",
    Level = "60",
    Attain = "56",
    Aim = "Return to the Athenaeum and find the Treasure of the Shen'dralar. Claim your reward!",
    Location = "Shen'dralar Ancient (Dire Maul; West, [1])",
    Note = "You can find the Treasure under the stairs [7].",
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
KQuestInstanceData[12].Quests.Alliance[4] = {
    Title = "4. Dreadsteed of Xoroth",
    Level = "60",
    Attain = "60",
    Aim = "Read Mor'zul's Instructions. Summon a Xorothian Dreadsteed, defeat it, then bind its spirit to you.",
    Location = "Mor'zul Bloodbringer (Burning Steppes; 12,31)",
    Note = "Warlock only: Final Quest in the Warlock Epic mount questline. First you must shut down all Pylons marked with [B] and then kill Immol'thar at [6]. After that, you can begin the Summoning Ritual. Be sure to have upwards of 20 Soul Shards ready and have one Warlock specifically assigned to keeping the Bell, Candle and Wheel up. The Doomguards that come can be enslaved. After completion, talk to the Dreadsteed ghost to complete the quest.",
    Prequest = "Imp Delivery (Scholomance)",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[12].Quests.Alliance[5] = {
    Title = "5. The Emerald Dream...",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Emerald Dream (randomly drops off bosses in all Dire Maul wings)",
    Note = "Druid only: You turn the book in to Lorekeeper Javon at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[6] = {
    Title = "6. The Greatest Race of Hunters",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Greatest Race of Hunters (randomly drops off bosses in all Dire Maul wings)",
    Note = "Hunter only: You turn the book in to Lorekeeper Mykos at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[7] = {
    Title = "7. The Arcanist's Cookbook",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Arcanist's Cookbook (randomly drops off bosses in all Dire Maul wings)",
    Note = "Mage only: You turn the book in to Lorekeeper Kildrath at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[8] = {
    Title = "8. The Light and How To Swing It",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "The Light and How To Swing It (randomly drops off bosses in all Dire Maul wings)",
    Note = "Paladin only: You turn the book in to Lorekeeper Mykos at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[9] = {
    Title = "9. Holy Bologna: What the Light Won't Tell You",
    Level = "60",
    Attain = "56",
    Aim = "Return the book to its rightful owners.",
    Location = "Holy Bologna: What the Light Won't Tell You (randomly drops off bosses in all Dire Maul wings)",
    Note = "Priest only: You turn the book in to Lorekeeper Javon at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[10] = {
    Title = "10. Garona: A Study on Stealth and Treachery",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Garona: A Study on Stealth and Treachery (randomly drops off bosses in all Dire Maul wings)",
    Note = "Rogue only: You turn the book in to Lorekeeper Kildrath at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[11] = {
    Title = "11. Frost Shock and You",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Frost Shock and You (randomly drops off bosses in all Dire Maul wings)",
    Note = "Shaman only: You turn the book in to Lorekeeper Javon at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[12] = {
    Title = "12. Harnessing Shadows",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Harnessing Shadows (randomly drops off bosses in all Dire Maul wings)",
    Note = "Warlock only: You turn the book in to Lorekeeper Mykos at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[13] = {
    Title = "13. Codex of Defense",
    Level = "60",
    Attain = "54",
    Aim = "Return the book to its rightful owners.",
    Location = "Codex of Defense (randomly drops off bosses in all Dire Maul wings)",
    Note = "Warrior only: You turn the book in to Lorekeeper Kildrath at the 1' Library.",
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
KQuestInstanceData[12].Quests.Alliance[14] = {
    Title = "14. Libram of Focus",
    Level = "60",
    Attain = "58",
    Aim = "Bring a Libram of Focus, 1 Pristine Black Diamond, 4 Large Brilliant Shards, and 2 Skin of Shadow to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Focus.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; [1] Library)",
    Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Skin of Shadow is Soulbound and can drop off some bosses, Risen Constructs and Risen Bonewarder in Scholomance.",
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
KQuestInstanceData[12].Quests.Alliance[15] = {
    Title = "15. Libram of Protection",
    Level = "60",
    Attain = "58",
    Aim = "Bring a Libram of Protection, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 1 Frayed Abomination Stitching to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Protection.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; [1] Library)",
    Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Frayed Abomination Stitching is Soulbound and can drop off Ramstein the Gorger, Venom Belchers, Bile Spewer and Patchwork Horror in Stratholme.",
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
KQuestInstanceData[12].Quests.Alliance[16] = {
    Title = "16. Libram of Rapidity",
    Level = "60",
    Attain = "58",
    Aim = "Bring a Libram of Rapidity, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 2 Blood of Heroes to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Rapidity.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; [1] Library)",
    Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Blood of Heroes is Soulbound and can be found on the ground in random places in the Western and Eastern Plaguelands.",
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
KQuestInstanceData[12].Quests.Alliance[17] = {
    Title = "17. Foror's Compendium",
    Level = "60",
    Attain = "60",
    Aim = "Return Foror's Compendium of Dragon Slaying to the Athenaeum.",
    Location = "Foror's Compendium of Dragon Slaying (random boss drop in Dire Maul)",
    Note = "Warrior or Paladin quest. It turns in to Lorekeeper Lydros (Dire Maul - West or North; [1] Library). Turning this in allows you to start the quest for Quel'Serrar.",
    Prequest = "No",
    Folgequest = "The Forging of Quel'Serrar",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[12].Quests.Alliance[18] = {
    Title = "18. Keeping Secrets",
    Level = "58",
    Attain = "45",
    Aim = "Travel to Dire Maul, and slay the great evil being that the Highborne are leeching energy upon, gather from it Pure Ley Essence, and return to Keeper Laena in Azshara.",
    Location = "Keeper Laena (Azshara; 44,45.4)",
    Note = "Immol'thar [6] drops Pure Ley Essence.\\nQuestline starts with quest 'The Keepers Charge' at Keeper Iselus 89,8,33.8 Azshara, north-east coast corner.",
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
KQuestInstanceData[12].Quests.Alliance[19] = {
    Title = "19. The Upper Binding III",
    Level = "60",
    Attain = "55",
    Aim = "Gather a Supercharged Arcane Resonation from the arcane elementals of Dire Maul for Parnabus in Gilneas.",
    Location = "Parnabus <Wandering Wizard> (Gilneas; [22.9,74.4], very south of Gilneas City, west of river. inside of a lonely hose).",
    Note = "Highly recommend to take prequest 'The Binding of Xanthar' from Hanvar the Righteous (Deadwind Pass in the small church outside of Karazhan [40.9,79.3]).\\nReward for the last quest of The Upper Binding quest chain will be quest item 'The Upper Binding of Xanthar' for quest 'The Binding of Xanthar'.\\nArcane Torrents big elementals in the circle around [6] drop Supercharged Arcane Resonation.",
    Prequest = "The Binding of Xanthar -> The Upper Binding I [Upper Blackrock Spire] -> The Upper Binding II",
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
KQuestInstanceData[12].Quests.Alliance[20] = {
    Title = "20. The Key to Karazhan VIII",
    Level = "60",
    Attain = "58",
    Aim = "Slay Immol'thar [6] in Dire Maul West, retrieve Arcanized Gems from his skin, and return to Dolvan. ",
    Location = "Dolvan Bracewind (Dustwallow Marsh - ; [71.1,73.2])",
    Note = "Prequests Lower Karazhan Halls. Arcanized Gems drop from [6].",
    Prequest = "The Key to Karazhan I - VI -> The Key to Karazhan VII [Stratholme] ",
    Folgequest = "The Key to Karazhan IX (BWL) -> The Key to Karazhan X",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[12].Quests.Alliance[21] = {
    Title = "21. Into the Dream III",
    Level = "60",
    Attain = "58",
    Aim = "Gather a Binding Fragment from Cliff Breakers in [Azshara], Overloaded Arcane Prism from Arcane Torrents in [Dire Maul West], Slumberer's Shard from Weaver in the [Sunken Temple] and an Arcanite Rod. Report to Itharius in the Swamp of Sorrows with the collected items.",
    Location = "Ralathius (Hyjal - Nordanaar; [81.6,27.7] a green dragonkin)",
    Note = "Arcane Torrents big elementals in the circle around [6] drop Overloaded Arcane Prism.\\nFinishing this questline you get the necklace and you will be able to enter Hyjal raid instance Emerald Sanctum.",
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
KQuestInstanceData[12].Quests.Horde[1] = {
    Title = KQuestInstanceData[12].Quests.Alliance[1].Title,
    Level = KQuestInstanceData[12].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[12].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[12].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[12].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[12].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[12].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[12].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[12].Quests.Horde[2] = KQuestInstanceData[12].Quests.Alliance[2]
KQuestInstanceData[12].Quests.Horde[3] = KQuestInstanceData[12].Quests.Alliance[3]
KQuestInstanceData[12].Quests.Horde[4] = KQuestInstanceData[12].Quests.Alliance[4]
KQuestInstanceData[12].Quests.Horde[5] = KQuestInstanceData[12].Quests.Alliance[5]
KQuestInstanceData[12].Quests.Horde[6] = KQuestInstanceData[12].Quests.Alliance[6]
KQuestInstanceData[12].Quests.Horde[7] = KQuestInstanceData[12].Quests.Alliance[7]
KQuestInstanceData[12].Quests.Horde[8] = KQuestInstanceData[12].Quests.Alliance[8]
KQuestInstanceData[12].Quests.Horde[9] = KQuestInstanceData[12].Quests.Alliance[9]
KQuestInstanceData[12].Quests.Horde[10] = KQuestInstanceData[12].Quests.Alliance[10]
KQuestInstanceData[12].Quests.Horde[11] = KQuestInstanceData[12].Quests.Alliance[11]
KQuestInstanceData[12].Quests.Horde[12] = KQuestInstanceData[12].Quests.Alliance[12]
KQuestInstanceData[12].Quests.Horde[13] = KQuestInstanceData[12].Quests.Alliance[13]
KQuestInstanceData[12].Quests.Horde[14] = KQuestInstanceData[12].Quests.Alliance[14]
KQuestInstanceData[12].Quests.Horde[15] = KQuestInstanceData[12].Quests.Alliance[15]
KQuestInstanceData[12].Quests.Horde[16] = KQuestInstanceData[12].Quests.Alliance[16]
KQuestInstanceData[12].Quests.Horde[17] = KQuestInstanceData[12].Quests.Alliance[17]
KQuestInstanceData[12].Quests.Horde[18] = KQuestInstanceData[12].Quests.Alliance[18]
KQuestInstanceData[12].Quests.Horde[19] = KQuestInstanceData[12].Quests.Alliance[19]
KQuestInstanceData[12].Quests.Horde[20] = KQuestInstanceData[12].Quests.Alliance[20]
KQuestInstanceData[12].Quests.Horde[21] = KQuestInstanceData[12].Quests.Alliance[21]

--------------- INST13 - Maraudon ---------------
KQuestInstanceData[13] = {
    Story = "Protected by the fierce Maraudine centaur, Maraudon is one of the most sacred sites within Desolace. The great temple/cavern is the burial place of Zaetar, one of two immortal sons born to the demigod, Cenarius. Legend holds that Zaetar and the earth elemental princess, Theradras, sired the misbegotten centaur race. It is said that upon their emergence, the barbaric centaur turned on their father and killed him. Some believe that Theradras, in her grief, trapped Zaetar's spirit within the winding cavern - used its energies for some malign purpose. The subterranean tunnels are populated by the vicious, long-dead ghosts of the Centaur Khans, as well as Theradras' own raging, elemental minions.",
    Caption = "Maraudon",
    QAA = "11 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[13].Quests.Alliance[1] = {
    Title = "1. Shadowshard Fragments",
    Level = "42",
    Attain = "38",
    Aim = "Collect 10 Shadowshard Fragments from Maraudon and return them to Archmage Tervosh in Theramore on the coast of Dustwallow Marsh.",
    Location = "Archmage Tervosh (Dustwallow Marsh - Theramore Isle; 66,49)",
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
KQuestInstanceData[13].Quests.Alliance[2] = {
    Title = "2. Vyletongue Corruption",
    Level = "47",
    Attain = "41",
    Aim = "Fill the Coated Cerulean Vial at the orange crystal pool in Maraudon.\\nUse the Filled Cerulean Vial on the Vylestem Vines to force the corrupted Noxxious Scion to emerge.\\nHeal 8 plants by killing these Noxxious Scion, then return to Talendria in Nijel's Point.",
    Location = "Talendria (Desolace - Nijel's Point; 68,8)",
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
KQuestInstanceData[13].Quests.Alliance[3] = {
    Title = "3. Twisted Evils",
    Level = "47",
    Attain = "41",
    Aim = "Collect 15 Theradric Crystal Carvings for Willow in Desolace.",
    Location = "Willow (Desolace; 62,39)",
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
KQuestInstanceData[13].Quests.Alliance[4] = {
    Title = "4. The Pariah's Instructions",
    Level = "48",
    Attain = "39",
    Aim = "Read the Pariah's Instructions. Afterwards, obtain the Amulet of Union from Maraudon and return it to the Centaur Pariah in southern Desolace.",
    Location = "Centaur Pariah (Desolace; 45,86)",
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
    }
}
KQuestInstanceData[13].Quests.Alliance[5] = {
    Title = "5. Legends of Maraudon",
    Level = "49",
    Attain = "41",
    Aim = "Recover the two parts of the Scepter of Celebras: the Celebrian Rod and the Celebrian Diamond.\\nFind a way to speak with Celebras.",
    Location = "Cavindra (Desolace - Maraudon; [4] on Entrance Map)",
    Note = "You find Cavindra at the beginning  of the orange part before you enter the instance.\\nYou get the Celebrian Rod from Noxxion at [2], the Celebrian Diamond from Lord Vyletongue at  [5]. Celebras is at [7]. You have to defeat him to be able to talk to him.",
    Prequest = "No",
    Folgequest = "The Scepter of Celebras",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[13].Quests.Alliance[6] = {
    Title = "6. The Scepter of Celebras",
    Level = "49",
    Attain = "41",
    Aim = "Assist Celebras the Redeemed while he creates the Scepter of Celebras.\\nSpeak with him when the ritual is complete.",
    Location = "Celebras the Redeemed (Maraudon; [7])",
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
KQuestInstanceData[13].Quests.Alliance[7] = {
    Title = "7. Corruption of Earth and Seed",
    Level = "51",
    Attain = "45",
    Aim = "Slay Princess Theradras and return to Keeper Marandis at Nijel's Point in Desolace.",
    Location = "Keeper Marandis (Desolace - Nijel's Point; 63,10)",
    Note = "You find Princess Theradras at [11].",
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
KQuestInstanceData[13].Quests.Alliance[8] = {
    Title = "8. Seed of Life",
    Level = "51",
    Attain = "45",
    Aim = "Seek out Remulos in Moonglade and give him the Seed of Life.",
    Location = "Zaetars Ghost (Maraudon; [11])",
    Note = "Zaetars Ghost appears after killing Princess Theradras [11]. You find Keeper Remulos at (Moonglade - Shrine of Remulos; 36,41).",
    Prequest = "Corruption of Earth and Seed",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[13].Quests.Alliance[9] = {
    Title = "9. Harness of Chimaeran",
    Level = "48",
    Attain = "38",
    Aim = "Retrieve the Harness of Chimaeran from Maraudon and bring it back to Velos Sharpstrike at Chimaera Roost Vale in Feralas.",
    Location = "Velos Sharpstrike (Feralas - Chimaera Roost Vale; [82.0,62.3] southeastern corner of Feralas)",
    Note = "Purple Maraudon satir boss Lord Vyletongue [5] drops Harness of Chimaeran.",
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
KQuestInstanceData[13].Quests.Alliance[10] = {
    Title = "10. Why Not Both?",
    Level = "50",
    Attain = "40",
    Aim = "Obtain the Heart of Landslide from the depths of Maraudon, and the Essence of Corrosis from Hateforge Quarry for Frig Thunderforge at Aerie Peak",
    Location = "Frig Thunderforge (Hinterlands - Aerie Peak; [10.0, 49.3]).",
    Note = "Landslide is at [8].",
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
KQuestInstanceData[13].Quests.Alliance[11] = {
    Title = "11. Preparation",
    Level = "48",
    Attain = "34",
    Aim = "Obtain a slab of Landslide's body from Maraudon and bring it to Thegren near the Ruins of Corthan in the Badlands.",
    Location = "Thegren <Artisan Gemologist> (Badlands - Ruins of Corthan; [29, 27]).",
    Note = "Jewelcrafting only. Quest line for Gemologist specialization.\\nLandslide is at [8].",
    Prequest = "Mastering Gemology -> The Lifeblood -> Demonstration",
    Folgequest = "The Final Cut",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[13].Quests.Horde[1] = {
    Title = KQuestInstanceData[13].Quests.Alliance[1].Title,
    Level = KQuestInstanceData[13].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[13].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[13].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[13].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[13].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[13].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[13].Quests.Alliance[1].Folgequest,
    Rewards = KQuestInstanceData[13].Quests.Alliance[1].Rewards
}
KQuestInstanceData[13].Quests.Horde[2] = {
    Title = KQuestInstanceData[13].Quests.Alliance[2].Title,
    Level = KQuestInstanceData[13].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[13].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[13].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[13].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[13].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[13].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[13].Quests.Alliance[2].Folgequest,
    Rewards = KQuestInstanceData[13].Quests.Alliance[2].Rewards
}
KQuestInstanceData[13].Quests.Horde[3] = KQuestInstanceData[13].Quests.Alliance[3]
KQuestInstanceData[13].Quests.Horde[4] = KQuestInstanceData[13].Quests.Alliance[4]
KQuestInstanceData[13].Quests.Horde[5] = KQuestInstanceData[13].Quests.Alliance[5]
KQuestInstanceData[13].Quests.Horde[6] = KQuestInstanceData[13].Quests.Alliance[6]
KQuestInstanceData[13].Quests.Horde[7] = {
    Title = KQuestInstanceData[13].Quests.Alliance[7].Title,
    Level = KQuestInstanceData[13].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[13].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[13].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[13].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[13].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[13].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[13].Quests.Alliance[7].Folgequest,
    Rewards = KQuestInstanceData[13].Quests.Alliance[7].Rewards
}
KQuestInstanceData[13].Quests.Horde[8] = KQuestInstanceData[13].Quests.Alliance[8]
KQuestInstanceData[13].Quests.Horde[9] = {
    Title = "11. Preparation",
    Level = KQuestInstanceData[13].Quests.Alliance[9].Level,
    Attain = "34",
    Aim = "Obtain a slab of Landslide's body from Maraudon and bring it to Thegren near the Ruins of Corthan in the Badlands.",
    Location = "Thegren <Artisan Gemologist> (Badlands - Ruins of Corthan; [29, 27]).",
    Note = "Jewelcrafting only. Quest line for Gemologist specialization.\\nLandslide is at [8].",
    Prequest = "Mastering Gemology -> The Lifeblood -> Demonstration",
    Folgequest = "The Final Cut",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST14 - Molten Core ---------------
KQuestInstanceData[14] = {
    Story = "The Molten Core lies at the very bottom of Blackrock Depths. It is the heart of Blackrock Mountain and the exact spot where, long ago in a desperate bid to turn the tide of the dwarven civil war, Emperor Thaurissan summoned the elemental Firelord, Ragnaros, into the world. Though the fire lord is incapable of straying far from the blazing Core, it is believed that his elemental minions command the Dark Iron dwarves, who are in the midst of creating armies out of living stone. The burning lake where Ragnaros lies sleeping acts as a rift connecting to the plane of fire, allowing the malicious elementals to pass through. Chief among Ragnaros' agents is Majordomo Executus - for this cunning elemental is the only one capable of calling the Firelord from his slumber.",
    Caption = "Molten Core",
    QAA = "7 Quests",
    QAH = "7 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[14].Quests.Alliance[1] = {
    Title = "1. The Molten Core",
    Level = "60",
    Attain = "57",
    Aim = "Kill 1 Fire Lord, 1 Molten Giant, 1 Ancient Core Hound and 1 Lava Surger, then return to Duke Hydraxis in Azshara.",
    Location = "Duke Hydraxis (Azshara; 79,73)",
    Note = "These are non-bosses inside Molten Core.",
    Prequest = "Eye of the Emberseer (Upper Blackrock Spire)",
    Folgequest = "Agent of Hydraxis",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[14].Quests.Alliance[2] = {
    Title = "2. Hands of the Enemy",
    Level = "60",
    Attain = "60",
    Aim = "Bring the Hands of Lucifron, Sulfuron, Gehennas and Shazzrah to Duke Hydraxis in Azshara.",
    Location = "Duke Hydraxis (Azshara; 79,73)",
    Note = "Lucifron is at [1], Sulfuron is at [8], Gehennas is at [3] and Shazzrah is at [5].",
    Prequest = "Agent of Hydraxis",
    Folgequest = "A Hero's Reward",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[14].Quests.Alliance[3] = {
    Title = "3. Thunderaan the Windseeker",
    Level = "60",
    Attain = "60",
    Aim = "To free Thunderaan the Windseeker from his prison, you must present the right and left halves of the Bindings of the Windseeker, 10 bars of Elementium, and the Essence of the Firelord to Highlord Demitrian in Silithus.",
    Location = "Highlord Demitrian (Silithus; 22,9)",
    Note = "Part of the Thunderfury, Blessed Blade of the Windseeker questline. It starts after obtaining either the left or right Bindings of the Windseeker from Garr at [4] or Baron Geddon at [6]. Then talk to Highlord Demitrian to start the questline. Essence of the Firelord drops from Ragnaros at [10]. After turning this part in, Prince Thunderaan is summoned and you must kill him. He's a 40-man raid boss.",
    Prequest = "Examine the Vessel",
    Folgequest = "Rise, Thunderfury!",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[14].Quests.Alliance[4] = {
    Title = "4. A Binding Contract",
    Level = "60",
    Attain = "60",
    Aim = "Turn the Thorium Brotherhood Contract in to Lokhtos Darkbargainer if you would like to receive the plans for Sulfuron.",
    Location = "Lokhtos Darkbargainer (Blackrock Depths; [15])",
    Note = "You need a Sulfuron Ingot to get the contract from Lokhtos. They drop from Golemagg the Incinerator in Molten Core at [7].",
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
KQuestInstanceData[14].Quests.Alliance[5] = {
    Title = "5. The Ancient Leaf",
    Level = "60",
    Attain = "60",
    Aim = "Find the owner of the Ancient Petrified Leaf.",
    Location = "Ancient Petrified Leaf (drops from Cache of the Firelord; [9])",
    Note = "Turns in to Vartrus the Ancient at (Felwood - Irontree Woods; 49,24).",
    Prequest = "No",
    Folgequest = "Ancient Sinew Wrapped Lamina (Azuregos)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[14].Quests.Alliance[6] = {
    Title = "6. The Only Prescription",
    Level = "60",
    Attain = "60",
    Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. ",
    Location = "Narain Soothfancy (Tanaris; 65,18)",
    Note = "Only one person can loot the Chapter. Draconic for Dummies VIII (drops from Ragnaros; [10])",
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
KQuestInstanceData[14].Quests.Alliance[7] = {
    Title = "7. Scrying Goggles? No Problem!",
    Level = "60",
    Attain = "60",
    Aim = "Find Narain's Scrying Goggles and return them to Narain Soothfancy in Tanaris.",
    Location = "Narain Soothfancy (Tanaris; 65,18)",
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
KQuestInstanceData[14].Quests.Horde[1] = KQuestInstanceData[14].Quests.Alliance[1]
KQuestInstanceData[14].Quests.Horde[2] = KQuestInstanceData[14].Quests.Alliance[2]
KQuestInstanceData[14].Quests.Horde[3] = KQuestInstanceData[14].Quests.Alliance[3]
KQuestInstanceData[14].Quests.Horde[4] = KQuestInstanceData[14].Quests.Alliance[4]
KQuestInstanceData[14].Quests.Horde[5] = KQuestInstanceData[14].Quests.Alliance[5]
KQuestInstanceData[14].Quests.Horde[6] = KQuestInstanceData[14].Quests.Alliance[6]
KQuestInstanceData[14].Quests.Horde[7] = KQuestInstanceData[14].Quests.Alliance[7]

--------------- INST15 - Naxxramas ---------------
KQuestInstanceData[15] = {
    Story = "Floating above the Plaguelands, the necropolis known as Naxxramas serves as the seat of one of the Lich King's most powerful officers, the dreaded lich Kel'Thuzad. Horrors of the past and new terrors yet to be unleashed are gathering inside the necropolis as the Lich King's servants prepare their assault. Soon the Scourge will march again...",
    Caption = "Naxxramas",
    QAA = "5 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[15].Quests.Alliance[1] = {
    Title = "1. The Fall of Kel'Thuzad",
    Level = "60",
    Attain = "60",
    Aim = "Take the Phylactery of Kel'Thuzad to Light's Hope Chapel in the Eastern Plaguelands.",
    Location = "Kel'Thuzad (Naxxramas; green 2)",
    Note = "Father Inigo Montoy (Eastern Plaguelands - Light's Hope Chapel; 81,58)",
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
KQuestInstanceData[15].Quests.Alliance[2] = {
    Title = "2. The Only Song I Know...",
    Level = "60",
    Attain = "60",
    Aim = "Craftsman Wilhelm at Light's Hope Chapel in the Eastern Plaguelands wants you to bring him 2 Frozen Runes, 2 Essence of Water, 2 Blue Sapphires and 30 gold pieces.",
    Location = "Craftsman Wilhelm (Eastern Plaguelands - Light's Hope Chapel; 81,60)",
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
KQuestInstanceData[15].Quests.Alliance[3] = {
    Title = "3. Echoes of War",
    Level = "60",
    Attain = "60",
    Aim = "Commander Eligor Dawnbringer at Light's Hope Chapel in the Eastern Plaguelands wants you to slay 5 Living Monstrosities, 5 Stoneskin Gargoyles, 8 Deathknight Captains and 3 Venom Stalkers.",
    Location = "Commander Eligor Dawnbringer (Eastern Plaguelands - Light's Hope Chapel; 82,58)",
    Note = "The mobs for this quest are trash mobs at the beginning of each wing of Naxxramas. This quest is a pre-requisite for the Tier 3 armor quests.",
    Prequest = "The Dread Citadel - Naxxramas",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[15].Quests.Alliance[4] = {
    Title = "4. The Fate of Ramaladni",
    Level = "60",
    Attain = "60",
    Aim = "Enter Naxxramas and uncover the Fate of Ramaladni.",
    Location = "Korfax, Champion of the Light (Eastern Plaguelands - Light's Hope Chapel; 82,58)",
    Note = "A ring for this quest will drop off a random mob in Naxxramas. Everyone who has the quest can pick it up.",
    Prequest = "No",
    Folgequest = "Ramaladni's Icy Grasp",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[15].Quests.Alliance[5] = {
    Title = "5. Ramaladni's Icy Grasp",
    Level = "60",
    Attain = "60",
    Aim = "Korfax at Light's Hope Chapel in the Eastern Plaguelands wants you to bring him 1 Frozen Rune, 1 Blue Sapphire and 1 Arcanite Bar.",
    Location = "Korfax, Champion of the Light (Eastern Plaguelands - Light's Hope Chapel; 82,58)",
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
KQuestInstanceData[15].Quests.Horde[1] = KQuestInstanceData[15].Quests.Alliance[1]
KQuestInstanceData[15].Quests.Horde[2] = KQuestInstanceData[15].Quests.Alliance[2]
KQuestInstanceData[15].Quests.Horde[3] = KQuestInstanceData[15].Quests.Alliance[3]
KQuestInstanceData[15].Quests.Horde[4] = KQuestInstanceData[15].Quests.Alliance[4]
KQuestInstanceData[15].Quests.Horde[5] = KQuestInstanceData[15].Quests.Alliance[5]

--------------- INST16 - Onyxias Lair ---------------
KQuestInstanceData[16] = {
    Story = "Onyxia is the daughter of the mighty dragon Deathwing, and sister of the scheming Nefarion Lord of Blackrock Spire. It is said that Onyxia delights in corrupting the mortal races by meddling in their political affairs. To this end it is believed that she takes on various humanoid forms and uses her charm and power to influence delicate matters between the different races. Some believe that Onyxia has even assumed an alias once used by her father - the title of the royal House Prestor. When not meddling in mortal concerns, Onyxia resides in a fiery cave below the Dragonmurk, a dismal swamp located within Dustwallow Marsh. There she is guarded by her kin, the remaining members of the insidious Black Dragon Flight.",
    Caption = "Onyxias Lair",
    QAA = "3 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[16].Quests.Alliance[1] = {
    Title = "1. The Forging of Quel'Serrar",
    Level = "60",
    Attain = "60",
    Aim = "You must get Onyxia to breathe fire on the Unfired Ancient Blade. Once this is done, pick up the now Heated Ancient Blade. Be warned, a Heated Ancient Blade will not remain heated forever - time is of the essence.",
    Location = "Lorekeeper Lydros (Dire Maul - West or North; [1] Library)",
    Note = "Drop the Sword in front of Onyxia when she's at 10% to 15% health. She'll have to breathe on and heat it. When Onyxia dies, pick the sword back up, click her corpse and use the sword. Then you're ready to turn in the quest.",
    Prequest = "Foror's Compendium (Dire Maul West) -> The Forging of Quel'Serrar",
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
KQuestInstanceData[16].Quests.Alliance[2] = {
    Title = "2. Victory for the Alliance",
    Level = "60",
    Attain = "60",
    Aim = "Take the Head of Onyxia to Highlord Bolvar Fordragon in Stormwind.",
    Location = "Head of Onyxia (drops from Onyxia; [3])",
    Note = "Highlord Bolvar Fordragon is at (Stormwind City - Stormwind Keep; 78,20). Only one person in the raid can loot this item and the quest can only be done one time.\\nRewards listed are for the followup.",
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
KQuestInstanceData[16].Quests.Alliance[3] = {
    Title = "3. The Only Prescription",
    Level = "60",
    Attain = "60",
    Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. ",
    Location = "Narain Soothfancy (Tanaris; 65,18)Draconic for Dummies (drops from Onyxia; [3])",
    Note = "Only one person can loot the Chapter. Draconic for Dummies VI (drops from Onyxia; [3])",
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
KQuestInstanceData[16].Quests.Horde[1] = KQuestInstanceData[16].Quests.Alliance[1]
KQuestInstanceData[16].Quests.Horde[2] = {
    Title = "2. Victory for the Horde",
    Level = KQuestInstanceData[16].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[16].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[16].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[16].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[16].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[16].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[16].Quests.Alliance[2].Folgequest,
    Rewards = KQuestInstanceData[16].Quests.Alliance[2].Rewards
}
KQuestInstanceData[16].Quests.Horde[3] = KQuestInstanceData[16].Quests.Alliance[3]

--------------- INST17 - Razorfen Downs ---------------
KQuestInstanceData[17] = {
    Story = "Crafted  from the same mighty vines as Razorfen Kraul, Razorfen Downs is the traditional capital city of the quillboar race. The sprawling, thorn-ridden labyrinth houses a veritable army of loyal quillboar as well as their high priests - the Death's Head tribe. Recently, however, a looming shadow has fallen over the crude den. Agents of the undead Scourge - led by the lich, Amnennar the Coldbringer - have taken control over the quillboar race and turned the maze of thorns into a bastion of undead might. Now the quillboar fight a desperate battle to reclaim their beloved city before Amnennar spreads his control across the Barrens.",
    Caption = "Razorfen Downs",
    QAA = "3 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[17].Quests.Alliance[1] = {
    Title = "1. A Host of Evil",
    Level = "35",
    Attain = "28",
    Aim = "Kill 8 Razorfen Battleguard, 8 Razorfen Thornweavers, and 8 Death's Head Cultists and return to Myriam Moonsinger near the entrance to Razorfen Downs.",
    Location = "Myriam Moonsinger (The Barrens; 49,94)",
    Note = "You can find the mobs and the quest giver in the area just before the instance entrance.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[17].Quests.Alliance[2] = {
    Title = "2. Extinguishing the Idol",
    Level = "37",
    Attain = "32",
    Aim = "Escort Belnistrasz to the Quilboar's idol in Razorfen Downs. Protect Belnistrasz while he performs the ritual to shut down the idol.",
    Location = "Belnistrasz (Razorfen Downs; [2])",
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
KQuestInstanceData[17].Quests.Alliance[3] = {
    Title = "3. Bring the Light",
    Level = "42",
    Attain = "39",
    Aim = "Archbishop Bendictus wants you to slay Amnennar the Coldbringer in Razorfen Downs.",
    Location = "Archbishop Bendictus (Stormwind - Cathedral of Light; 39,27)",
    Note = "Amnennar the Coldbringer is the last boss in Razorfen Downs. You can find him at [6].",
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
KQuestInstanceData[17].Quests.Horde[1] = KQuestInstanceData[17].Quests.Alliance[1]
KQuestInstanceData[17].Quests.Horde[2] = {
    Title = "2. An Unholy Alliance",
    Level = KQuestInstanceData[17].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[17].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[17].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[17].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[17].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[17].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[17].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[17].Quests.Horde[3] = {
    Title = "3. Extinguishing the Idol",
    Level = KQuestInstanceData[17].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[17].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[17].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[17].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[17].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[17].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[17].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[17].Quests.Horde[4] = {
    Title = "4. Bring the End",
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
KQuestInstanceData[17].Quests.Horde[5] = {
    Title = "5. The Powers Beyond",
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
KQuestInstanceData[18] = {
    Story = "Ten thousand years ago - during the War of the Ancients, the mighty demigod, Agamaggan, came forth to battle the Burning Legion. Though the colossal boar fell in combat, his actions helped save Azeroth from ruin. Yet over time, in the areas where his blood fell, massive thorn-ridden vines sprouted from the earth. The quillboar - believed to be the mortal offspring of the mighty god, came to occupy these regions and hold them sacred. The heart of these thorn-colonies was known as the Razorfen. The great mass of Razorfen Kraul was conquered by the old crone, Charlga Razorflank. Under her rule, the shamanistic quillboar stage attacks on rival tribes as well as Horde villages. Some speculate that Charlga has even been negotiating with agents of the Scourge - aligning her unsuspecting tribe with the ranks of the Undead for some insidious purpose.",
    Caption = "Razorfen Kraul",
    QAA = "5 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[18].Quests.Alliance[1] = {
    Title = "1. Blueleaf Tubers",
    Level = "26",
    Attain = "20",
    Aim = "In Razorfen Kraul, use the Crate with Holes to summon a Snufflenose Gopher, and use the Command Stick on the gopher to make it search for Tubers. Bring 6 Blueleaf Tubers, the Snufflenose Command Stick and the Crate with Holes to Mebok Mizzyrix in Ratchet.",
    Location = "Mebok Mizzyrix (The Barrens - Ratchet; 62,37)",
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
KQuestInstanceData[18].Quests.Alliance[2] = {
    Title = "2. Mortality Wanes",
    Level = "30",
    Attain = "25",
    Aim = "Find and return Treshala's Pendant to Treshala Fallowbrook in Darnassus.",
    Location = "Heraltha Fallowbrook (Razorfen Kraul; [8])",
    Note = "The pendant is a random drop. You musst bring back the pendant to Treshala Fallowbrook in Darnassus - Tradesmen Terrace (69,67).",
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
KQuestInstanceData[18].Quests.Alliance[3] = {
    Title = "3. Willix the Importer",
    Level = "30",
    Attain = "23",
    Aim = "Escort Willix the Importer out of Razorfen Kraul.",
    Location = "Willix the Importer (Razorfen Kraul; [8])",
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
KQuestInstanceData[18].Quests.Alliance[4] = {
    Title = "4. The Crone of the Kraul",
    Level = "34",
    Attain = "29",
    Aim = "Bring Razorflank's Medallion to Falfindel Waywarder in Thalanaar.",
    Location = "Falfindel Waywarder (Feralas - Thalanaar; 89,46)",
    Note = "Charlga Razorflank [7] drops the Medallion required for this quest.",
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
KQuestInstanceData[18].Quests.Alliance[5] = {
    Title = "5. Fire Hardened Mail",
    Level = "28",
    Attain = "20",
    Aim = "Gather the materials Furen Longbeard requires, and bring them to him in Stormwind.",
    Location = "Furen Longbeard (Stormwind - Dwarven District; 57,16)",
    Note = "Warrior only: You get the Vial of Phlogiston from Roogug at [1].\\nThe followup quest is different for each race. Burning Blood for Humans, Iron Coral for Dwarves and Gnomes and Sunscorched Shells for Night Elves.",
    Prequest = "The Shieldsmith",
    Folgequest = "(See Note)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[18].Quests.Horde[1] = KQuestInstanceData[18].Quests.Alliance[1]
KQuestInstanceData[18].Quests.Horde[2] = {
    Title = "2. Willix the Importer",
    Level = KQuestInstanceData[18].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[18].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[18].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[18].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[18].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[18].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[18].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[18].Quests.Horde[3] = {
    Title = "3. Going, Going, Guano!",
    Level = KQuestInstanceData[18].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[18].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[18].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[18].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[18].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[18].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[18].Quests.Alliance[3].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[18].Quests.Horde[4] = {
    Title = "4. A Vengeful Fate",
    Level = KQuestInstanceData[18].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[18].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[18].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[18].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[18].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[18].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[18].Quests.Alliance[4].Folgequest,
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
KQuestInstanceData[18].Quests.Horde[5] = {
    Title = "5. Brutal Armor",
    Level = KQuestInstanceData[18].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[18].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[18].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[18].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[18].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[18].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[18].Quests.Alliance[5].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST19 - SM: Library ---------------
KQuestInstanceData[19] = {
    Story = "The Monastery was once a proud bastion of Lordaeron's priesthood - a center for learning and enlightenment. With the rise of the undead Scourge during the Third War, the peaceful Monastery was converted into a stronghold of the fanatical Scarlet Crusade. The Crusaders are intolerant of all non-human races, regardless of alliance or affiliation. They believe that any and all outsiders are potential carriers of the undead plague - and must be destroyed. Reports indicate that adventurers who enter the monastery are forced to contend with Scarlet Commander Mograine - who commands a large garrison of fanatically devoted warriors. However, the monastery's true master is High Inquisitor Whitemane - a fearsome priestess who possesses the ability to resurrect fallen warriors to do battle in her name.",
    Caption = "SM: Library",
    QAA = "3 Quests",
    QAH = "5 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[19].Quests.Alliance[1] = {
    Title = "1. In the Name of the Light",
    Level = "40",
    Attain = "34",
    Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore.",
    Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; 51,58)",
    Note = "This quest line starts at Brother Crowley with quest 'Brother Anton' in Stormwind - Cathedral of Light (42,24).\\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at SM: Cathedral [2], Herod at SM: Armory [1] and Houndmaster Loksey at SM: Library [1].",
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
KQuestInstanceData[19].Quests.Alliance[2] = {
    Title = "2. Mythology of the Titans",
    Level = "38",
    Attain = "28",
    Aim = "Retrieve Mythology of the Titans from the Monastery and bring it to Librarian Mae Paledust in Ironforge.",
    Location = "Librarian Mae Paledust (Ironforge - Hall of Explorers; 74,12)",
    Note = "The book is on the floor on the left side of one of the corridors leading to Arcanist Doan ([2]).",
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
KQuestInstanceData[19].Quests.Alliance[3] = {
    Title = "3. Rituals of Power",
    Level = "40",
    Attain = "30",
    Aim = "Bring the book Rituals of Power to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; 43,57)",
    Note = "Mage only: You can find the book in the last corridor leading to Arcanist Doan ([2]).",
    Prequest = "Get the Scoop",
    Folgequest = "Mage's Wand",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[19].Quests.Horde[1] = {
    Title = "1. Hearts of Zeal",
    Level = KQuestInstanceData[19].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[19].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[19].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[19].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[19].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[19].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[19].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[19].Quests.Horde[2] = {
    Title = "2. Into The Scarlet Monastery",
    Level = KQuestInstanceData[19].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[19].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[19].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[19].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[19].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[19].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[19].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[19].Quests.Horde[3] = {
    Title = "3. Compendium of the Fallen",
    Level = KQuestInstanceData[19].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[19].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[19].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[19].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[19].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[19].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[19].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[19].Quests.Horde[4] = {
    Title = "4. Test of Lore",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[19].Quests.Horde[5] = {
    Title = "5. Rituals of Power",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST20 - SM: Armory ---------------
KQuestInstanceData[20] = {
    Story = "",
    Caption = "SM: Armory",
    QAA = "1 Quest",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[20].Quests.Horde[1] = {
    Title = "1. In the Name of the Light",
    Level = "40",
    Attain = "34",
    Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore.",
    Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; 51,58)",
    Note = "This quest line starts at Brother Crowley with quest 'Brother Anton' in Stormwind - Cathedral of Light (42,24).\\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at SM: Cathedral [2], Herod at SM: Armory [1] and Houndmaster Loksey at SM: Library [1].",
    Prequest = "Brother Anton -> Down the Scarlet Path",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[20].Quests.Horde[2] = {
    Title = "2. Mythology of the Titans",
    Level = "38",
    Attain = "28",
    Aim = "Retrieve Mythology of the Titans from the Monastery and bring it to Librarian Mae Paledust in Ironforge.",
    Location = "Librarian Mae Paledust (Ironforge - Hall of Explorers; 74,12)",
    Note = "The book is on the floor on the left side of one of the corridors leading to Arcanist Doan ([2]).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Explorers' League Commendation",
            ID = "6802",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
    }
}
KQuestInstanceData[20].Quests.Horde[3] = {
    Title = "3. Reminiscent of Steel",
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
KQuestInstanceData[21] = {
    Story = "",
    Caption = "SM: Cathedral",
    QAA = "3 Quest",
    QAH = "2 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[21].Quests.Alliance[2] = {
    Title = "The Orb of Kaladus",
    Level = "38",
    Attain = "30",
    Aim = "Venture within the Scarlet Monastery and find the Orb of Kaladus, retrieve it, and return to Watch Paladin Janathos at Sorrowguard Keep.",
    Location = "Watch Paladin Janathos (Swamp of Sorrows - Sorrowguard Keep; 2,51)",
    Note = "Aged Wooden Chest contain the item. You can find Orb of Kaladus inside the second chamber, left from [2].",
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
KQuestInstanceData[21].Quests.Alliance[3] = {
    Title = "3. Scarlet Corruption",
    Level = "44",
    Attain = "35",
    Aim = "Discover the truth about the fate of High Inquisitor Fairbanks [1] for Brother Elias at Shademore Tavern in Gilneas. Slain High Inquisitor Fairbanks",
    Location = "Brother Elias <Scarlet Crusade Emissary> (Gilneas - Ruins of Greyshire - Shademore Tavern [33.6,54.1], 2nd floor.)",
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
KQuestInstanceData[21].Quests.Horde[1] = {
    Title = "1. In the Name of the Light",
    Level = "40",
    Attain = "34",
    Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore.",
    Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; 51,58)",
    Note = "This quest line starts at Brother Crowley with quest 'Brother Anton' in Stormwind - Cathedral of Light (42,24).\\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at SM: Cathedral [2], Herod at SM: Armory [1] and Houndmaster Loksey at SM: Library [1].",
    Prequest = "Brother Anton -> Down the Scarlet Path",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[21].Quests.Horde[2] = {
    Title = "2. Mythology of the Titans",
    Level = KQuestInstanceData[21].Quests.Alliance[2].Level,
    Attain = "28",
    Aim = "Retrieve Mythology of the Titans from the Monastery and bring it to Librarian Mae Paledust in Ironforge.",
    Location = "Librarian Mae Paledust (Ironforge - Hall of Explorers; 74,12)",
    Note = "The book is on the floor on the left side of one of the corridors leading to Arcanist Doan ([2]).",
    Prequest = "No",
    Folgequest = KQuestInstanceData[21].Quests.Alliance[2].Folgequest,
    Rewards = {
        Text = AQDiscription_REWARD..white.."1"..AQDiscription_OR..white.."2"..AQDiscription_OR..white.."3",
        {
            Name = "Explorers' League Commendation",
            ID = "6802",
            Color = blue,
            Description = AQITEM_ONEHAND..AQITEM_SWORD,
        },
    }
}

--------------- INST22 - SM: Graveyard ---------------
KQuestInstanceData[22] = {
    Story = "",
    Caption = "SM: Graveyard",
    QAA = "No Quest",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[22].Quests.Horde[1] = {
    Title = "1. In the Name of the Light",
    Level = "40",
    Attain = "34",
    Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore.",
    Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; 51,58)",
    Note = "This quest line starts at Brother Crowley with quest 'Brother Anton' in Stormwind - Cathedral of Light (42,24).\\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at SM: Cathedral [2], Herod at SM: Armory [1] and Houndmaster Loksey at SM: Library [1].",
    Prequest = "Brother Anton -> Down the Scarlet Path",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[22].Quests.Horde[2] = {
    Title = "2. Vorrel's Revenge",
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
KQuestInstanceData[22].Quests.Horde[3] = {
    Title = "3. Paint the Roses Red",
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
KQuestInstanceData[23] = {
    Story = "The Scholomance is housed within a series of crypts that lie beneath the ruined keep of Caer Darrow. Once owned by the noble Barov family, Caer Darrow fell to ruin following the Second War. As the wizard Kel'thuzad enlisted followers for his Cult of the Damned he would often promise immortality in exchange for serving his Lich King. The Barov family fell to Kel'thuzad's charismatic influence and donated the keep and its crypts to the Scourge. The cultists then killed the Barovs and turned the ancient crypts into a school for necromancy known as the Scholomance. Though Kel'thuzad no longer resides in the crypts, devoted cultists and instructors still remain. The powerful lich, Ras Frostwhisper, rules over the site and guards it in the Scourge's name - while the mortal necromancer, Darkmaster Gandling, serves as the school's insidious headmaster.",
    Caption = "Scholomance",
    QAA = "12 Quests",
    QAH = "12 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[23].Quests.Alliance[1] = {
    Title = "1. Plagued Hatchlings",
    Level = "58",
    Attain = "55",
    Aim = "Kill 20 Plagued Hatchlings, then return to Betina Bigglezink at the Light's Hope Chapel.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; 81,59)",
    Note = "The Plagued Hatchlings are on the way to Rattlegore in a large room.",
    Prequest = "No",
    Folgequest = "Healthy Dragon Scale",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[2] = {
    Title = "2. Healthy Dragon Scale",
    Level = "58",
    Attain = "55",
    Aim = "Bring the Healthy Dragon Scale to Betina Bigglezink at the Light's Hope Chapel in Eastern Plaguelands.",
    Location = "Healthy Dragon Scale (random drop in Scholomance)",
    Note = "Plagued Hatchlings drop the Healthy Dragon Scales (8% chance to drop). You can find Betina Bigglezink at Eastern Plaguelands - Light's Hope Chapel (81,59).",
    Prequest = "Plagued Hatchlings",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[3] = {
    Title = "3. Doctor Theolen Krastinov, the Butcher",
    Level = "60",
    Attain = "55",
    Aim = "Find Doctor Theolen Krastinov inside the Scholomance. Destroy him, then burn the Remains of Eva Sarkhoff and the Remains of Lucien Sarkhoff. Return to Eva Sarkhoff when the task is complete.",
    Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; 70,73)",
    Note = "You find Doctor Theolen Krastinov, the remains of Eva Sarkhoff and the remains of Lucien Sarkhoff at [9].",
    Prequest = "No",
    Folgequest = "Krastinov's Bag of Horrors",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[4] = {
    Title = "4. Krastinov's Bag of Horrors",
    Level = "60",
    Attain = "55",
    Aim = "Locate Jandice Barov in the Scholomance and destroy her. From her corpse recover Krastinov's Bag of Horrors. Return the bag to Eva Sarkhoff.",
    Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; 70,73)",
    Note = "You can find Jandice Barov at [3].",
    Prequest = "Doctor Theolen Krastinov, the Butcher",
    Folgequest = "Kirtonos the Herald",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[5] = {
    Title = "5. Kirtonos the Herald",
    Level = "60",
    Attain = "55",
    Aim = "Return to the Scholomance with the Blood of Innocents. Find the porch and place the Blood of Innocents in the brazier. Kirtonos will come to feast upon your soul. Fight valiantly, do not give an inch! Destroy Kirtonos and return to Eva Sarkhoff.",
    Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; 70,73)",
    Note = "The porch is at [2].",
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
KQuestInstanceData[23].Quests.Alliance[6] = {
    Title = "6. The Lich, Ras Frostwhisper",
    Level = "60",
    Attain = "57",
    Aim = "Find Ras Frostwhisper in the Scholomance. When you have found him, use the Soulbound Keepsake on his undead visage. Should you succeed in reverting him to a mortal, strike him down and recover the Human Head of Ras Frostwhisper. Take the head back to Magistrate Marduke.",
    Location = "Magistrate Marduke (Western Plaguelands - Caer Darrow; 70,73)",
    Note = "You can find Ras Frostwhisper at [7].",
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
KQuestInstanceData[23].Quests.Alliance[7] = {
    Title = "7. Barov Family Fortune",
    Level = "60",
    Attain = "52",
    Aim = "Venture to the Scholomance and recover the Barov family fortune. Four deeds make up this fortune: The Deed to Caer Darrow; The Deed to Brill; The Deed to Tarren Mill; and The Deed to Southshore. Return to Weldon Barov when you have completed this task.",
    Location = "Weldon Barov (Western Plaguelands - Chillwind Camp; 43,83)",
    Note = "You can find The Deed to Caer Darrow at [12], The Deed to Brill at [7], The Deed to Tarren Mill at [4] and The Deed to Southshore at [1].",
    Prequest = "No",
    Folgequest = "The Last Barov",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[8] = {
    Title = "8. Dawn's Gambit",
    Level = "60",
    Attain = "57",
    Aim = "Place Dawn's Gambit in the Viewing Room of the Scholomance. Defeat Vectus, then return to Betina Bigglezink.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; 81,59)",
    Note = "Broodling Essence begins at Tinkee Steamboil (Burning Steppes - Flame Crest; 65,23). The Viewing Room is at [6].",
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
KQuestInstanceData[23].Quests.Alliance[9] = {
    Title = "9. Imp Delivery",
    Level = "60",
    Attain = "60",
    Aim = "Bring the Imp in a Yesr to the alchemy lab in the Scholomance. After the parchment is created, return the jar to Gorzeeki Wildeyes.",
    Location = "Gorzeeki Wildeyes (Burning Steppes; 12,31)",
    Note = "Warlock only: You find the alchemy lab at [7].",
    Prequest = "Mor'zul Bloodbringer - > Xorothian Stardust",
    Folgequest = "Dreadsteed of Xoroth (Dire Maul West)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[10] = {
    Title = "10. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Kormok and slay him. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nKormok is summoned at [7].",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[11] = {
    Title = "11. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth the spirit of Kormok and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nKormok is summoned at [7].",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations (Upper Blackrock Spire)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Alliance[12] = {
    Title = "12. A Favor for Farsan",
    Level = "58",
    Attain = "55",
    Aim = "Venture into Scholomance and recover the book 'Fire Beckoning and Command' for Strahad Farsan in Ratchet.",
    Location = "Strahad Farsan (The Barrens - Ratchet; 62.6,35.5)",
    Note = "Questline starts at Craftsman Wilhelm (Eastern Plaguelands - Light's Hope Chapel) with quest 'A New Rune-Frontier'.\\n!!! You will get this reward after finishing the last quest in the questline.",
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
KQuestInstanceData[23].Quests.Horde[1] = KQuestInstanceData[23].Quests.Alliance[1]
KQuestInstanceData[23].Quests.Horde[2] = KQuestInstanceData[23].Quests.Alliance[2]
KQuestInstanceData[23].Quests.Horde[3] = KQuestInstanceData[23].Quests.Alliance[3]
KQuestInstanceData[23].Quests.Horde[4] = KQuestInstanceData[23].Quests.Alliance[4]
KQuestInstanceData[23].Quests.Horde[5] = KQuestInstanceData[23].Quests.Alliance[5]
KQuestInstanceData[23].Quests.Horde[6] = KQuestInstanceData[23].Quests.Alliance[6]
KQuestInstanceData[23].Quests.Horde[7] = {
    Title = KQuestInstanceData[23].Quests.Alliance[7].Title,
    Level = KQuestInstanceData[23].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[23].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[23].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[23].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[23].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[23].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[23].Quests.Alliance[7].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[23].Quests.Horde[8] = KQuestInstanceData[23].Quests.Alliance[8]
KQuestInstanceData[23].Quests.Horde[9] = KQuestInstanceData[23].Quests.Alliance[9]
KQuestInstanceData[23].Quests.Horde[10] = KQuestInstanceData[23].Quests.Alliance[10]
KQuestInstanceData[23].Quests.Horde[11] = KQuestInstanceData[23].Quests.Alliance[11]
KQuestInstanceData[23].Quests.Horde[12] = KQuestInstanceData[23].Quests.Alliance[12]

--------------- INST24 - Shadowfang Keep ---------------
KQuestInstanceData[24] = {
    Story = "During the Third War, the wizards of the Kirin Tor battled against the undead armies of the Scourge. When the wizards of Dalaran died in battle, they would rise soon after - adding their former might to the growing Scourge. Frustrated by their lack of progress (and against the advice of his peers) the Archmage, Arugal elected to summon extra-dimensional entities to bolster Dalaran's diminishing ranks. Arugal's summoning brought the ravenous worgen into the world of Azeroth. The feral wolf-men slaughtered not only the Scourge, but quickly turned on the wizards themselves. The worgen laid siege to the keep of the noble, Baron Silverlaine. Situated above the tiny hamlet of Pyrewood, the keep quickly fell into shadow and ruin. Driven mad with guilt, Arugal adopted the worgen as his children and retreated to the newly dubbed 'Shadowfang Keep'. It's said he still resides there, protected by his massive pet, Fenrus - and haunted by the vengeful ghost of Baron Silverlaine.",
    Caption = "Shadowfang Keep",
    QAA = "5 Quests",
    QAH = "7 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[24].Quests.Alliance[1] = {
    Title = "1. The Test of Righteousness",
    Level = "22",
    Attain = "20",
    Aim = "Using Jordan's Weapon Notes, find some Whitestone Oak Lumber, Bailor's Refined Ore Shipment, Jordan's Smithing Hammer, and a Kor Gem, and return them to Jordan Stilwell in Ironforge.",
    Location = "Jordan Stilwell (Dun Morogh - Ironforge Entrance; 52,36)",
    Note = "Paladin only: To see the note click on  [The Test of Righteousness Information].",
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
    }
}
KQuestInstanceData[24].Quests.Alliance[2] = {
    Title = "2. The Orb of Soran'ruk",
    Level = "25",
    Attain = "20",
    Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens.",
    Location = "Doan Karhan (Barrens; 49,57)",
    Note = "WARLOCK only: You get the 3 Soran'ruk Fragments from Twilight Accolytes in [Blackfathom Deeps]. You get the Large Soran'ruk Fragment in [Shadowfang Keep] from Shadowfang Darksouls.",
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
KQuestInstanceData[24].Quests.Alliance[3] = {
    Title = "3. Arugal's Folly",
    Level = "27",
    Attain = "22",
    Aim = "High Sorcerer Andromath has tasked you with the death of Archmage Arugal [12]. Return to him when you're done.",
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
KQuestInstanceData[24].Quests.Alliance[4] = {
    Title = "4. The Missing Sorcerer",
    Level = "24",
    Attain = "22",
    Aim = "High Sorcerer Andromath wants you to travel to Shadowfang Keep in Silverpine Forest and find out what happened to Sorcerer Ashcrombe.",
    Location = "High Sorcerer Andromath (Stormwind - The Mage Quarter, Mage Tower)",
    Note = "Sorcerer Ashcrombe is in the cage [1].",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[24].Quests.Alliance[5] = {
    Title = "5. Blood of Vorgendor",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Fandral Staghelm. He requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Arch Druid Fandral Staghelm (Darnassus - Cenarion Enclave 35,9).",
    Note = "[Shadowfang Blood] drop from Worgens.\\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II (Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[24].Quests.Horde[1] = {
    Title = "1. Deathstalkers in Shadowfang",
    Level = KQuestInstanceData[24].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[24].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[24].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[24].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[24].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[24].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[24].Quests.Alliance[1].Folgequest,
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
KQuestInstanceData[24].Quests.Horde[2] = {
    Title = "2. The Book of Ur",
    Level = KQuestInstanceData[24].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[24].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[24].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[24].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[24].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[24].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[24].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[24].Quests.Horde[3] = {
    Title = "3. Arugal Must Die",
    Level = KQuestInstanceData[24].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[24].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[24].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[24].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[24].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[24].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[24].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[24].Quests.Horde[4] = {
    Title = "4. The Orb of Soran'ruk",
    Level = KQuestInstanceData[24].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[24].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[24].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[24].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[24].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[24].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[24].Quests.Alliance[4].Folgequest,
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
KQuestInstanceData[24].Quests.Horde[5] = {
    Title = "5. Into The Jaws",
    Level = KQuestInstanceData[24].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[24].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[24].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[24].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[24].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[24].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[24].Quests.Alliance[5].Folgequest,
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
KQuestInstanceData[24].Quests.Horde[6] = {
    Title = "6. Too Late to Prelate",
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
KQuestInstanceData[24].Quests.Horde[7] = {
    Title = "7. The Wolf, the Crone and the Scythe",
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST25 - Stratholme ---------------
KQuestInstanceData[25] = {
    Story = "Once the jewel of northern Lordaeron, the city of Stratholme is where Prince Arthas turned against his mentor, Uther Lightbringer, and slaughtered hundreds of his own subjects who were believed to have contracted the dreaded plague of undeath. Arthas' downward spiral and ultimate surrender to the Lich King soon followed. The broken city is now inhabited by the undead Scourge - led by the powerful lich, Kel'thuzad. A contingent of Scarlet Crusaders, led by Grand Crusader Dathrohan, also holds a portion of the ravaged city. The two sides are locked in constant, violent combat. Those adventurers brave (or foolish) enough to enter Stratholme will be forced to contend with both factions before long. It is said that the city is guarded by three massive watchtowers, as well as powerful necromancers, banshees and abominations. There have also been reports of a malefic Death Knight riding atop an unholy steed - dispensing indiscriminate wrath on all those who venture within the realm of the Scourge.",
    Caption = "Stratholme",
    QAA = "21 Quests",
    QAH = "22 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[25].Quests.Alliance[1] = {
    Title = "1. The Flesh Does Not Lie",
    Level = "60",
    Attain = "55",
    Aim = "Recover 10 Plagued Flesh Samples from Stratholme and return them to Betina Bigglezink. You suspect that any creature in Stratholme would have said flesh sample.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; 81,59)",
    Note = "Most mobs in Stratholme can drop the Plagued Flesh Samples, but the drop rate seems low.",
    Prequest = "No",
    Folgequest = "The Active Agent",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[2] = {
    Title = "2. The Active Agent",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Stratholme and search the ziggurats. Find and return new Scourge Data to Betina Bigglezink.",
    Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; 81,59)",
    Note = "The Scourge Data is in one of the 3 Towers, you find near [15], [16] and [17].",
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
KQuestInstanceData[25].Quests.Alliance[3] = {
    Title = "3. Houses of the Holy",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Stratholme, in the north. Search the supply crates that litter the city and recover 5 Stratholme Holy Water. Return to Leonid Barthalomew the Revered when you have collected enough of the blessed fluid.",
    Location = "Leonid Barthalomew the Revered (Eastern Plaguelands - Light's Hope Chapel; 80,58)",
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
KQuestInstanceData[25].Quests.Alliance[4] = {
    Title = "4. The Great Fras Siabi",
    Level = "60",
    Attain = "55",
    Aim = "Find Fras Siabi's smoke shop in Stratholme and recover a box of Siabi's Premium Tobacco. Return to Smokey LaRue when the job is done.",
    Location = "Smokey LaRue (Eastern Plaguelands - Light's Hope Chapel; 80,58)",
    Note = "You find the smoke shop near [1]. Fras Siabi spawns when you open box.",
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
KQuestInstanceData[25].Quests.Alliance[5] = {
    Title = "5. The Restless Souls",
    Level = "60",
    Attain = "55",
    Aim = "Use Egan's Blaster on the ghostly and spectral citizens of Stratholme. When the restless souls break free from their ghostly shells, use the blaster again - freedom will be theirs!\\nFree 15 Restless Souls and return to Egan.",
    Location = "Egan (Eastern Plaguelands; 14,33)",
    Note = "You get the prequest from Caretaker Alen (Eastern Plaguelands - Light's Hope Chapel; 79,63). The spectral citizens walk through whole Stratholme.",
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
KQuestInstanceData[25].Quests.Alliance[6] = {
    Title = "6. Of Love and Family",
    Level = "60",
    Attain = "52",
    Aim = "Travel to Stratholme, in the northern part of the Plaguelands. It is in the Scarlet Bastion that you will find the painting 'Of Love and Family,' hidden behind another painting depicting the twin moons of our world.\\nReturn the painting to Tirion Fordring.",
    Location = "Artist Renfray (Western Plaguelands - Caer Darrow; 65,75)",
    Note = "You get the prequest from Tirion Fordring (Western Plaguelands; 7,43). You can find the picture near [10].",
    Prequest = "Redemption - > Of Love and Family",
    Folgequest = "Find Myranda",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[7] = {
    Title = "7. Menethil's Gift",
    Level = "60",
    Attain = "57",
    Aim = "Travel to Stratholme and find Menethil's Gift. Place the Keepsake of Remembrance upon the unholy ground.",
    Location = "Leonid Barthalomew the Revered (Eastern Plaguelands - Light's Hope Chapel; 80,58)",
    Note = "You get the prequest from Magistrate Marduke (Western Plaguelands - Caer Darrow; 70,73). You find the sign near [19]. See also: [The Lich, Ras Frostwhisper] in Scholomance.",
    Prequest = "The Human Ras Frostraunen - > The Dying, Ras Frostwhisper",
    Folgequest = "Menethil's Gift",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[8] = {
    Title = "8. Aurius' Reckoning",
    Level = "60",
    Attain = "55",
    Aim = "Kill the Baron.",
    Location = "Aurius (Stratholme; [13])",
    Note = "To start the quest you have to give Aurius [The Medallion of Faith]. You get the Medallion from a chest (Malor's Strongbox [7]) in the first chamber of the bastion (before the ways split). After giving Aurius the Medallion he supports your group in the fight against the Baron [19]. After killing the Baron you have to talk to Aurius again to get the Rewards.",
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
KQuestInstanceData[25].Quests.Alliance[9] = {
    Title = "9. The Archivist",
    Level = "60",
    Attain = "55",
    Aim = "Travel to Stratholme and find Archivist Galford of the Scarlet Crusade. Destroy him and burn down the Scarlet Archive.",
    Location = "Duke Nicholas Zverenhoff (Eastern Plaguelands - Light's Hope Chapel; 81,59)",
    Note = "You can find the Archive and the Achivist at [10].",
    Prequest = "No",
    Folgequest = "The Truth Comes Crashing Down",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[10] = {
    Title = "10. The Truth Comes Crashing Down",
    Level = "60",
    Attain = "55",
    Aim = "Take the Head of Balnazzar to Duke Nicholas Zverenhoff in the Eastern Plaguelands.",
    Location = "Balnazzar (Stratholme; [11])",
    Note = "You find Duke Nicholas Zverenhoff in the Eastern Plaguelands - Light's Hope Chapel (81,59).",
    Prequest = "The Archivist",
    Folgequest = "Above and Beyond",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[11] = {
    Title = "11. Above and Beyond",
    Level = "60",
    Attain = "55",
    Aim = "Venture to Stratholme and destroy Baron Rivendare. Take his head and return to Duke Nicholas Zverenhoff.",
    Location = "Duke Nicholas Zverenhoff (Eastern Plaguelands - Light's Hope Chapel; 81,59)",
    Note = "You can find the Baron at [19].",
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
KQuestInstanceData[25].Quests.Alliance[12] = {
    Title = "12. Dead Man's Plea",
    Level = "60",
    Attain = "58",
    Aim = "Go into Stratholme and rescue Ysida Harmon from Baron Rivendare.",
    Location = "Anthion Harmon (Eastern Plaguelands - Stratholme)",
    Note = "Anthion stands just outside the Stratholme portal. You need the Extra-Dimensional Ghost Revealer to see him. It comes from the pre-quest. The questline starts with Just Compensation. Deliana in Ironforge (43,52) for Alliance, Mokvar in Orgrimmar (38,37) for Horde.\\nThis is the infamous '45 minute' Baron run.",
    Prequest = "In Search of Anthion",
    Folgequest = "Proof of Life",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[13] = {
    Title = "13. The Left Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nJarien and Sothos are summoned at [11].",
    Prequest = "Components of Importance",
    Folgequest = "I See Alcaz Island In Your Future...",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[14] = {
    Title = "14. The Right Piece of Lord Valthalak's Amulet",
    Level = "60",
    Attain = "58",
    Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning.",
    Location = "Bodley (Blackrock Mountain; [D] on Entrance Map)",
    Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\\n\\nJarien and Sothos are summoned at [11].",
    Prequest = "More Components of Importance",
    Folgequest = "Final Preparations (Upper Blackrock Spire)",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[25].Quests.Alliance[15] = {
    Title = "15. Atiesh, Greatstaff of the Guardian",
    Level = "60",
    Attain = "60",
    Aim = "Anachronos at the Caverns of Time in Tanaris wants you to take Atiesh, Greatstaff of the Guardian to Stratholme and use it on Consecrated Earth. Defeat the entity that is exorcised from the staff and return to him.",
    Location = "Anachronos (Tanaris - Caverns of Time; 65,49)",
    Note = "Atiesh is summoned at [2].",
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
KQuestInstanceData[25].Quests.Alliance[16] = {
    Title = "16. Corruption",
    Level = "60",
    Attain = "50",
    Aim = "Find the Black Guard Swordsmith in Stratholme and destroy him. Recover the Insignia of the Black Guard and return to Seril Scourgebane.",
    Location = "Seril Scourgebane (Winterspring - Everlook; 61,37)",
    Note = "Blacksmith only: The Black Guard Swordsmith is summoned near [15].",
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
KQuestInstanceData[25].Quests.Alliance[17] = {
    Title = "17. Sweet Serenity",
    Level = "60",
    Attain = "50",
    Aim = "Travel to Stratholme and kill the Crimson Hammersmith. Recover the Crimson Hammersmith's Apron and return to Lilith.",
    Location = "Lilith the Lithe (Winterspring - Everlook; 61,37)",
    Note = "Blacksmith only: The Crimson Hammersmith is summoned at [8].",
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
KQuestInstanceData[25].Quests.Alliance[18] = {
    Title = "18. To Build a Pounder",
    Level = "60",
    Attain = "30",
    Aim = "The last component I need is a high quality adamantite rod used for the endoskeleton. I believe Stratholme's forges used to make such rods in the past.",
    Location = "Oglethorpe Obnoticus <Master Gnome Engineer> (Stranglethorn Vale; Booty Bay 28.4,76.3).",
    Note = "(Engineers only)This quest requires to collect 3 items. \\n1) Thorium Tuned Servo (Scarlet Monastery from Scarlet Myrmidon)\\n2) Perfect Golem Core (Blackrock Depths from Golem Lord Argelmach)\\n3) Adamantite Rod (Stratholme from Crimson Hammersmith [8])\\n'Crowd Pummeler 9-60' in Gnomeregan drops 'Intact Pounder Mainframe' that starts the PreQuest 'A Pounding Brain'.",
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
KQuestInstanceData[25].Quests.Alliance[19] = {
    Title = "19. To Wake The Ashbringer",
    Level = "60",
    Attain = "60",
    Aim = "Recover Tabard of the Ashbringer(kill Grand Crusader Dathrohan) and Cape of Alexandros from Stratholme.",
    Location = "Tirion Fordring (Western Plaguelands - Light's Hope Chapel 67.3,24.2).",
    Note = "Tabard of the Ashbringer drops from Grand Crusader Dathrohan [11], Cape of Alexandros drops from Baron Rivendare[19]\\nQuestline starts in Naxxramas after killing 4 Horsemans with quest 'Orb of Pure Light'",
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
KQuestInstanceData[25].Quests.Alliance[20] = {
    Title = "20. Rothlen Family Brooch",
    Level = "60",
    Attain = "55",
    Aim = "Recover the Rothlen Family Brooch from Stratholme for Duke Rothlen in Karazhan.",
    Location = "Duke Rothlen (Karazhan; [Karazhan - c])",
    Note = "Rothlen Family Brooch next to boss The Unforgiven [4] in the chest.\\nQuest chain starts with epic item random drop 'Scribbled Cooking Notes' [Karazhan].",
    Prequest = "Scribbled Cooking Notes [Karazhan] -> Lost and Found [Karazhan]",
    Folgequest = "The Secret Recipe ([Karazhan])",
}
KQuestInstanceData[25].Quests.Alliance[21] = {
    Title = "21. The Key to Karazhan VII",
    Level = "60",
    Attain = "58",
    Aim = "Find four Echoes of Medivh. They might be found in places of great significance for the mage. Then return to Vandol with the key.",
    Location = "Dolvan Bracewind (Dustwallow Marsh - Westhaven Hollow; [71.1,73.2])",
    Note = "Second Feather of Medivh on the ground in the place where Elder Farwhisper (Lunar Festival) [5] is.\\nFirst Feather of Medivh [Undercity] behind the entrance throne.\\nThird Feather of Medivh [Alterac Mountain] on the end of first(western) cliff [30.8,87.4].\\nFourth Feather of Medivh [Hyjal] on the end of the cliff [31.8,70.5].",
    Prequest = "The Key to Karazhan VI",
    Folgequest = "The Key to Karazhan VIII (Dire Maul West)",
}
KQuestInstanceData[25].Quests.Horde[1] = KQuestInstanceData[25].Quests.Alliance[1]
KQuestInstanceData[25].Quests.Horde[2] = KQuestInstanceData[25].Quests.Alliance[2]
KQuestInstanceData[25].Quests.Horde[3] = KQuestInstanceData[25].Quests.Alliance[3]
KQuestInstanceData[25].Quests.Horde[4] = KQuestInstanceData[25].Quests.Alliance[4]
KQuestInstanceData[25].Quests.Horde[5] = KQuestInstanceData[25].Quests.Alliance[5]
KQuestInstanceData[25].Quests.Horde[6] = KQuestInstanceData[25].Quests.Alliance[6]
KQuestInstanceData[25].Quests.Horde[7] = KQuestInstanceData[25].Quests.Alliance[7]
KQuestInstanceData[25].Quests.Horde[8] = KQuestInstanceData[25].Quests.Alliance[8]
KQuestInstanceData[25].Quests.Horde[9] = KQuestInstanceData[25].Quests.Alliance[9]
KQuestInstanceData[25].Quests.Horde[10] = KQuestInstanceData[25].Quests.Alliance[10]
KQuestInstanceData[25].Quests.Horde[11] = KQuestInstanceData[25].Quests.Alliance[11]
KQuestInstanceData[25].Quests.Horde[12] = KQuestInstanceData[25].Quests.Alliance[12]
KQuestInstanceData[25].Quests.Horde[13] = KQuestInstanceData[25].Quests.Alliance[13]
KQuestInstanceData[25].Quests.Horde[14] = KQuestInstanceData[25].Quests.Alliance[14]
KQuestInstanceData[25].Quests.Horde[15] = KQuestInstanceData[25].Quests.Alliance[15]
KQuestInstanceData[25].Quests.Horde[16] = KQuestInstanceData[25].Quests.Alliance[16]
KQuestInstanceData[25].Quests.Horde[17] = KQuestInstanceData[25].Quests.Alliance[17]
KQuestInstanceData[25].Quests.Horde[18] = {
    Title = "18. Ramstein",
    Level = KQuestInstanceData[25].Quests.Alliance[18].Level,
    Attain = KQuestInstanceData[25].Quests.Alliance[18].Attain,
    Aim = KQuestInstanceData[25].Quests.Alliance[18].Aim,
    Location = KQuestInstanceData[25].Quests.Alliance[18].Location,
    Note = KQuestInstanceData[25].Quests.Alliance[18].Note,
    Prequest = KQuestInstanceData[25].Quests.Alliance[18].Prequest,
    Folgequest = KQuestInstanceData[25].Quests.Alliance[18].Folgequest,
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
KQuestInstanceData[25].Quests.Horde[19] = {
    Title = "19. To Build a Pounder",
    Level = KQuestInstanceData[25].Quests.Alliance[19].Level,
    Attain = KQuestInstanceData[25].Quests.Alliance[19].Attain,
    Aim = KQuestInstanceData[25].Quests.Alliance[19].Aim,
    Location = KQuestInstanceData[25].Quests.Alliance[19].Location,
    Note = KQuestInstanceData[25].Quests.Alliance[19].Note,
    Prequest = KQuestInstanceData[25].Quests.Alliance[19].Prequest,
    Folgequest = KQuestInstanceData[25].Quests.Alliance[19].Folgequest,
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
KQuestInstanceData[25].Quests.Horde[20] = {
    Title = "20. To Wake The Ashbringer",
    Level = KQuestInstanceData[25].Quests.Alliance[20].Level,
    Attain = KQuestInstanceData[25].Quests.Alliance[20].Attain,
    Aim = KQuestInstanceData[25].Quests.Alliance[20].Aim,
    Location = KQuestInstanceData[25].Quests.Alliance[20].Location,
    Note = KQuestInstanceData[25].Quests.Alliance[20].Note,
    Prequest = KQuestInstanceData[25].Quests.Alliance[20].Prequest,
    Folgequest = KQuestInstanceData[25].Quests.Alliance[20].Folgequest,
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
KQuestInstanceData[25].Quests.Horde[21] = {
    Title = "21. Rothlen Family Brooch",
    Level = KQuestInstanceData[25].Quests.Alliance[21].Level,
    Attain = KQuestInstanceData[25].Quests.Alliance[21].Attain,
    Aim = KQuestInstanceData[25].Quests.Alliance[21].Aim,
    Location = KQuestInstanceData[25].Quests.Alliance[21].Location,
    Note = KQuestInstanceData[25].Quests.Alliance[21].Note,
    Prequest = KQuestInstanceData[25].Quests.Alliance[21].Prequest,
    Folgequest = KQuestInstanceData[25].Quests.Alliance[21].Folgequest,
}
KQuestInstanceData[25].Quests.Horde[22] = {
    Title = "22. The Key to Karazhan VII",
}

--------------- INST26 - Ruins of Ahn'Qiraj ---------------
KQuestInstanceData[26] = {
    Story = "During the final hours of the War of the Shifting Sands, the combined forces of the night elves and the four dragonflights drove the battle to the very heart of the qiraji empire, to the fortress city of Ahn'Qiraj. Yet at the city gates, the armies of Kalimdor encountered a concentration of silithid war drones more massive than any they had encountered before. Ultimately the silithid and their qiraji masters were not defeated, but merely imprisoned inside a magical barrier, and the war left the cursed city in ruins. A thousand years have passed since that day, but the qiraji forces have not been idle. A new and terrible army has been spawned from the hives, and the ruins of Ahn'Qiraj are teeming once again with swarming masses of silithid and qiraji. This threat must be eliminated, or else all of Azeroth may fall before the terrifying might of the new qiraji army.",
    Caption = "Ruins of Ahn'Qiraj",
    QAA = "3 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[26].Quests.Alliance[1] = {
    Title = "1. The Fall of Ossirian",
    Level = "60",
    Attain = "60",
    Aim = "Deliver the Head of Ossirian the Unscarred to Commander Mar'alith at Cenarion Hold in Silithus.",
    Location = "Head of Ossirian the Unscarred (drops from Ossirian the Unscarred; [6])",
    Note = "Commander Mar'alith (Silithus - Cenarion Hold; 49,34)",
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
KQuestInstanceData[26].Quests.Alliance[2] = {
    Title = "2. The Perfect Poison",
    Level = "60",
    Attain = "60",
    Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac.",
    Location = "Dirk Thunderwood (Silithus - Cenarion Hold; 52,39)",
    Note = "Venoxis's Venom Sac drops from High priest Venoxis in Zul'Gurub. Kurinnaxx's Venom Sac drops in the Ruins of Ahn'Qiraj at [1].",
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
KQuestInstanceData[26].Quests.Alliance[3] = {
    Title = "3. Lost to the Sands",
    Level = "60",
    Attain = "60",
    Aim = "Bring a Perfect Obsidian Shard to Archmage Xylem.",
    Location = "Archmage Xylem (Azshara; 28,47)",
    Note = "Mage only: pre-quest from Lorekeeper Lydros (Dire Maul - West or North; [1] Library). Perfect Obsidian Shard drop from [3].",
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
KQuestInstanceData[26].Quests.Horde[1] = KQuestInstanceData[26].Quests.Alliance[1]
KQuestInstanceData[26].Quests.Horde[2] = KQuestInstanceData[26].Quests.Alliance[2]
KQuestInstanceData[26].Quests.Horde[3] = KQuestInstanceData[26].Quests.Alliance[3]

--------------- INST27 - The Stockade ---------------
KQuestInstanceData[27] = {
    Story = "The Stockades are a high-security prison complex, hidden beneath the canal district of Stormwind city. Presided over by Warden Thelwater, the Stockades are home to petty crooks, political insurgents, murderers and a score of the most dangerous criminals in the land. Recently, a prisoner-led revolt has resulted in a state of pandemonium within the Stockades - where the guards have been driven out and the convicts roam free. Warden Thelwater has managed to escape the holding area and is currently enlisting brave thrill-seekers to venture into the prison and kill the uprising's mastermind - the cunning felon, Bazil Thredd.",
    Caption = "The Stockade",
    QAA = "7 Quests",
    QAH = "No Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[27].Quests.Alliance[1] = {
    Title = "1. What Comes Around...",
    Level = "25",
    Attain = "22",
    Aim = "Bring the head of Targorr the Dread to Guard Berton in Lakeshire.",
    Location = "Guard Berton (Redridge Mountains - Lakeshire; 26,46)",
    Note = "You can find Targorr at [1].",
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
KQuestInstanceData[27].Quests.Alliance[2] = {
    Title = "2. Crime and Punishment",
    Level = "26",
    Attain = "22",
    Aim = "Councilman Millstipe of Darkshire wants you to bring him the hand of Dextren Ward.",
    Location = "Millstipe (Duskwood - Darkshire; 72,47)",
    Note = "You can find Dextren at [5].",
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
KQuestInstanceData[27].Quests.Alliance[3] = {
    Title = "3. Quell The Uprising",
    Level = "26",
    Attain = "22",
    Aim = "Warden Thelwater of Stormwind wants you to kill 10 Defias Prisoners, 8 Defias Convicts, and 8 Defias Insurgents in The Stockade.",
    Location = "Warden Thelwater (Stormwind - The Stockade; 41,58)",
    Note = "",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[27].Quests.Alliance[4] = {
    Title = "4. The Color of Blood",
    Level = "26",
    Attain = "22",
    Aim = "Nikova Raskol of Stormwind wants you to collect 10 Red Wool Bandanas.",
    Location = "Nikova Raskol (Stormwind - Old Town; 73,46)",
    Note = "All mobs found inside the instance drops Red Wool Bandanas.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[27].Quests.Alliance[5] = {
    Title = "5. The Fury Runs Deep",
    Level = "27",
    Attain = "22",
    Aim = "Motley Garmason wants Kam Deepfury's head brought to him at Dun Modr.",
    Location = "Motley Garmason (Wetlands - Dun Modr; 49,18)",
    Note = "The preceding quest can be obtained from Motley too. You can find Kam Deepfury at [2].",
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
KQuestInstanceData[27].Quests.Alliance[6] = {
    Title = "6. The Stockade Riots",
    Level = "29",
    Attain = "16",
    Aim = "Kill Bazil Thredd and bring his head back to Warden Thelwater at the Stockade.",
    Location = "Warden Thelwater (Stormwind - The Stockade; 41,58)",
    Note = "For more details about the preceding quest see [Deadmines, The Defias Brotherhood].\\nYou can find Bazil Thredd at [4].",
    Prequest = "The Defias Brotherhood -> Bazil Thredd",
    Folgequest = "The Curious Visitor",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[27].Quests.Alliance[7] = {
    Title = "7. The Stockade's Search",
    Level = "24",
    Attain = "18",
    Aim = "Delve into the Stockades and find information on Martin Corinth.",
    Location = "Master Mathias Shaw <Leader of SI:7> (Stormwind - Old Town, Rogue district; 75.8,59.8)",
    Note = "You can find Martin Corinth's Information inside Sealed Documents Crate [1] in the room across the dungeon entrance.\\nQuestline starts with quest 'Uncovering Mystery' at Lord Commander Ryke (Wetlands - Hawk's Vigil 36.4,67.3 under the tent)\\nYou will get reward after you finish the last quest of the questline.",
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
KQuestInstanceData[28] = {
    Story = "Over a thousand years ago, the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, attempted to bring back an ancient blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire buckled in upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows. There they erected a great temple to Hakkar - where they could prepare for his arrival into the physical world. The great dragon Aspect, Ysera, learned of the Atal'ai's plans and smashed the temple beneath the marshes. To this day, the temple's drowned ruins are guarded by the green dragons who prevent anyone from getting in or out. However, it is believed that some of the fanatical Atal'ai may have survived Ysera's wrath - and recommitted themselves to the dark service of Hakkar.",
    Caption = "The Sunken Temple",
    QAA = "19 Quests",
    QAH = "20 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[28].Quests.Alliance[1] = {
    Title = "1. Into The Temple of Atal'Hakkar",
    Level = "50",
    Attain = "41",
    Aim = "Gather 10 Atal'ai Tablets for Brohann Caskbelly in Stormwind.",
    Location = "Brohann Caskbelly (Stormwind - Dwarven District; 64,20)",
    Note = "The prequest line comes from the same NPC and has quite a few steps.\\n\\nYou can find the Tablets everywhere in the Temple, both outside and inside the instance.",
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
KQuestInstanceData[28].Quests.Alliance[2] = {
    Title = "2. Into the Depths",
    Level = "51",
    Attain = "46",
    Aim = "Find the Altar of Hakkar in the Sunken Temple in Swamp of Sorrows.",
    Location = "Marvon Rivetseeker (Tanaris; 52,45)",
    Note = "The Altar is at [1].\\nAlliance questline starts at Angelas Moonbreeze (Feralas - Feathermoon Stronghold 31.8,45.6) with quest 'The Sunken Temple'.\\nHorde questline starts at Witch Doctor Uzer'i (Feralas - Camp Mojache 74.4,43.4) with quest 'The Sunken Temple'.",
    Prequest = "The Stone Circle",
    Folgequest = "Secret of the Circle",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[28].Quests.Alliance[3] = {
    Title = "3. Secret of the Circle",
    Level = "51",
    Attain = "46",
    Aim = "Travel into the Sunken Temple and discover the secret hidden in the circle of statues.",
    Location = "Altar of Hakkar (Sunken Temple; 1)",
    Note = "You find the statues at [1]. See map for order to activate them.",
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
KQuestInstanceData[28].Quests.Alliance[4] = {
    Title = "4. Haze of Evil",
    Level = "52",
    Attain = "47",
    Aim = "Collect 5 samples of Atal'ai Haze, then return to Muigin in Un'Goro Crater.",
    Location = "Gregan Brewspewer (Feralas; 45,25)",
    Note = "The Prequest 'Muigin and Larion' starts at Muigin (Un'Goro Crater - Marshal's Refuge; 42,9). You get the Haze from Deep Lurkers, Murk Worms or Oozes in the Temple.",
    Prequest = "Muigin and Larion -> A Visit to Gregan",
    Folgequest = "No",
}
KQuestInstanceData[28].Quests.Alliance[5] = {
    Title = "5. The God Hakkar",
    Level = "53",
    Attain = "40",
    Aim = "Bring the Filled Egg of Hakkar to Yeh'kinya in Tanaris.",
    Location = "Yeh'kinya (Tanaris - Steamwheedle Port; 66,22)",
    Note = "The Questline starts with 'Screecher Spirits' at the same NPC (See [Zul'Farrak]).\\nYou have to use the Egg at [3] to start the Event. Once it starts enemies spawn and attack you. Some of them drop the blood of Hakkar. With this blood you can put out the torch around the circle. After this the Avatar of Hakkar spawns. You kill him and loot the 'Essence of Hakkar' which you use to fill the egg.",
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
KQuestInstanceData[28].Quests.Alliance[6] = {
    Title = "6. Jammal'an the Prophet",
    Level = "53",
    Attain = "38",
    Aim = "The Atal'ai Exile in The Hinterlands wants the Head of Jammal'an.",
    Location = "The Atal'ai Exile (The Hinterlands; 33,75)",
    Note = "You find Jammal'an at [4].",
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
KQuestInstanceData[28].Quests.Alliance[7] = {
    Title = "7. The Essence of Eranikus",
    Level = "55",
    Attain = "48",
    Aim = "Place the Essence of Eranikus in the Essence Font located in this lair in the Sunken Temple.",
    Location = "The Essence of Eranikus (drops from Shade of Eranikus; [6])",
    Note = "You find the Essence Font next to where Shade of Eranikus is at [6].\\nDon't  sell or throw away reward trinket Chained Essence of Eranikus. You will need it for next quest at Itharius (Swamp and Sorrows - Itharius's Cave [13.6,71.7], after talking with him you will get an item that starts the quest.",
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
KQuestInstanceData[28].Quests.Alliance[8] = {
    Title = "8. Trolls of a Feather",
    Level = "52",
    Attain = "50",
    Aim = "Bring a total of 6 Voodoo Feathers from the trolls in sunken temple.",
    Location = "Impsy (Felwood; 42,45)",
    Note = "Warlock only: Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center.",
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
KQuestInstanceData[28].Quests.Alliance[9] = {
    Title = "9. Voodoo Feathers",
    Level = "52",
    Attain = "50",
    Aim = "Bring the Voodoo Feathers from the trolls in the Sunken Temple to the Fallen Hero of the Horde.",
    Location = "Fallen Hero of the Horde (Swamp of Sorrows; 34,66)",
    Note = "Warrior only: Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center.\\nHorde questline starts in Orgrimar at warrior trainer Sorek 80.4,32.3.",
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
KQuestInstanceData[28].Quests.Alliance[10] = {
    Title = "10. A Better Ingredient",
    Level = "52",
    Attain = "50",
    Aim = "Retrieve a Putrid Vine from the guardian at the bottom of the Sunken Temple and return to Torwa Pathfinder.",
    Location = "Torwa Pathfinder (Un'Goro Crater; 72,76)",
    Note = "Druid only: The Putrid Vine drops from Atal'alarion who is summoned at [1] by activating the statues in the order listed on the map.",
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
KQuestInstanceData[28].Quests.Alliance[11] = {
    Title = "11. The Green Drake",
    Level = "52",
    Attain = "50",
    Aim = "Bring the Tooth of Morphaz to Ogtinc in Azshara. Ogtinc resides atop the cliffs northeast the Ruins of Eldarath.",
    Location = "Ogtinc (Azshara; 42,43)",
    Note = "Hunter only: Morphaz is at [5].",
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
KQuestInstanceData[28].Quests.Alliance[12] = {
    Title = "12. Destroy Morphaz",
    Level = "52",
    Attain = "50",
    Aim = "Retrieve the Arcane Shard from Morphaz and return to Archmage Xylem.",
    Location = "Archmage Xylem (Azshara; 29,40)",
    Note = "Mage only: Morphaz is at [5].",
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
KQuestInstanceData[28].Quests.Alliance[13] = {
    Title = "13. Blood of Morphaz",
    Level = "52",
    Attain = "50",
    Aim = "Kill Morphaz in the sunken temple of Atal'Hakkar, and return his blood to Greta Mosshoof in Felwood. The entrance to the sunken temple can be found in the Swamp of Sorrows.",
    Location = "Ogtinc (Azshara; 42,43)",
    Note = "Priest only: Morphaz is at [5]. Greta Mosshoof is at Felwood - Emerald Sanctuary (51,82).",
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
KQuestInstanceData[28].Quests.Alliance[14] = {
    Title = "14. The Azure Key",
    Level = "52",
    Attain = "50",
    Aim = "Return the Azure Key to Lord Jorach Ravenholdt.",
    Location = "Archmage Xylem (Azshara; 29,40)",
    Note = "Rogue only: The Azure Key drops from Morphaz at [5]. Lord Jorach Ravenholdt is at Alterac Mountains - Ravenholdt (86,79).",
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
KQuestInstanceData[28].Quests.Alliance[15] = {
    Title = "15. Forging the Mightstone",
    Level = "52",
    Attain = "50",
    Aim = "Bring the voodoo feathers to Ashlam Valorfist.",
    Location = "Commander Ashlam Valorfist (Western Plaguelands - Chillwind Camp; 43,85)",
    Note = "Paladin only: Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center.",
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
KQuestInstanceData[28].Quests.Alliance[16] = {
    Title = "16. Eranikus, Tyrant of the Dream",
    Level = "60",
    Attain = "60",
    Aim = "Travel to the continent of Teldrassil and find Malfurion's agent somewhere outside the walls of Darnassus.",
    Location = "Malfurion Stormrage (Spawns at Shade of Eranikus; [8])",
    Note = "Forest Wisp (Teldrassil; 37,47)",
    Prequest = "The Charge of the Dragonflights",
    Folgequest = "Tyrande and Remulos",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[28].Quests.Alliance[17] = {
    Title = "17. By Any Means Necessary IV",
    Level = "53",
    Attain = "47",
    Aim = "Travel to the Sunken Temple, and find the Dragonkin Hazzas, slay him, and return the Heart of Hazzas to Niremius Darkwind.",
    Location = "Niremius Darkwind (Felwood; 40,30)",
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
KQuestInstanceData[28].Quests.Alliance[18] = {
    Title = "18. Into the Dream III",
    Level = "60",
    Attain = "58",
    Aim = "Gather a Binding Fragment from Cliff Breakers in Azshara, Overloaded Arcane Prism from Arcane Torrents in the Western wing of Dire Maul, Slumberer's Shard from Weaver in the Sunken Temple and an Arcanite Rod. Report to Itharius in the Swamp of Sorrows with the collected items.",
    Location = "Ralathius (Hyjal - Nordanaar; 85,30)",
    Note = "Weaver [6] 1 of 4 dragons  drop Slumberer's Shard, will appear after killing Jammal'an the Prophet [4]. Barrier to the Prophet will disappear after clearing 6 balcons [C]\\nFinishing this questline you get the necklace and you will be able to enter Hyjal raid instance Emerald Sanctum.",
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
KQuestInstanceData[28].Quests.Alliance[19] = {
    Title = "19. The Riftwalker's Cane",
    Level = "54",
    Attain = "30",
    Aim = "Return with the Riftwalker's Cane to Akh Z'ador in Azshara.",
    Location = "Akh Z'ador (Azshara 51,37)",
    Note = "Quest line start from Sanv K'la (Swamp of Sorrows; 25, 30). Jammal'an the Prophet [4].\\nFinishing this questline you get a reward Pure Draenethyst Gemstone.",
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
KQuestInstanceData[28].Quests.Horde[1] = {
    Title = "1. The Temple of Atal'Hakkar",
    Level = KQuestInstanceData[28].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[28].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[28].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[28].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[28].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[28].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[28].Quests.Alliance[1].Folgequest,
    Rewards = KQuestInstanceData[28].Quests.Alliance[1].Rewards
}
KQuestInstanceData[28].Quests.Horde[2] = KQuestInstanceData[28].Quests.Alliance[2]
KQuestInstanceData[28].Quests.Horde[3] = KQuestInstanceData[28].Quests.Alliance[3]
KQuestInstanceData[28].Quests.Horde[4] = {
    Title = "4. Zapper Fuel",
    Level = KQuestInstanceData[28].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[28].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[28].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[28].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[28].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[28].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[28].Quests.Alliance[4].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[28].Quests.Horde[5] = KQuestInstanceData[28].Quests.Alliance[5]
KQuestInstanceData[28].Quests.Horde[6] = KQuestInstanceData[28].Quests.Alliance[6]
KQuestInstanceData[28].Quests.Horde[7] = KQuestInstanceData[28].Quests.Alliance[7]
KQuestInstanceData[28].Quests.Horde[8] = KQuestInstanceData[28].Quests.Alliance[8]
KQuestInstanceData[28].Quests.Horde[9] = KQuestInstanceData[28].Quests.Alliance[9]
KQuestInstanceData[28].Quests.Horde[10] = KQuestInstanceData[28].Quests.Alliance[10]
KQuestInstanceData[28].Quests.Horde[11] = KQuestInstanceData[28].Quests.Alliance[11]
KQuestInstanceData[28].Quests.Horde[12] = KQuestInstanceData[28].Quests.Alliance[12]
KQuestInstanceData[28].Quests.Horde[13] = KQuestInstanceData[28].Quests.Alliance[13]
KQuestInstanceData[28].Quests.Horde[14] = KQuestInstanceData[28].Quests.Alliance[14]
KQuestInstanceData[28].Quests.Horde[15] = {
    Title = "15. Da Voodoo",
    Level = KQuestInstanceData[28].Quests.Alliance[15].Level,
    Attain = KQuestInstanceData[28].Quests.Alliance[15].Attain,
    Aim = KQuestInstanceData[28].Quests.Alliance[15].Aim,
    Location = KQuestInstanceData[28].Quests.Alliance[15].Location,
    Note = KQuestInstanceData[28].Quests.Alliance[15].Note,
    Prequest = KQuestInstanceData[28].Quests.Alliance[15].Prequest,
    Folgequest = KQuestInstanceData[28].Quests.Alliance[15].Folgequest,
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
KQuestInstanceData[28].Quests.Horde[16] = KQuestInstanceData[28].Quests.Alliance[16]
KQuestInstanceData[28].Quests.Horde[17] = KQuestInstanceData[28].Quests.Alliance[17]
KQuestInstanceData[28].Quests.Horde[18] = {
    Title = "18. The Maul'ogg Crisis VII",
    Level = KQuestInstanceData[28].Quests.Alliance[18].Level,
    Attain = KQuestInstanceData[28].Quests.Alliance[18].Attain,
    Aim = KQuestInstanceData[28].Quests.Alliance[18].Aim,
    Location = KQuestInstanceData[28].Quests.Alliance[18].Location,
    Note = KQuestInstanceData[28].Quests.Alliance[18].Note,
    Prequest = KQuestInstanceData[28].Quests.Alliance[18].Prequest,
    Folgequest = KQuestInstanceData[28].Quests.Alliance[18].Folgequest,
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
KQuestInstanceData[28].Quests.Horde[19] = {
    Title = "19. Into the Dream III",
    Level = KQuestInstanceData[28].Quests.Alliance[19].Level,
    Attain = KQuestInstanceData[28].Quests.Alliance[19].Attain,
    Aim = KQuestInstanceData[28].Quests.Alliance[19].Aim,
    Location = KQuestInstanceData[28].Quests.Alliance[19].Location,
    Note = KQuestInstanceData[28].Quests.Alliance[19].Note,
    Prequest = KQuestInstanceData[28].Quests.Alliance[19].Prequest,
    Folgequest = KQuestInstanceData[28].Quests.Alliance[19].Folgequest,
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
KQuestInstanceData[28].Quests.Horde[20] = {
    Title = "20. The Riftwalker's Cane",
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
KQuestInstanceData[29] = {
    Story = "At the heart of Ahn'Qiraj lies an ancient temple complex. Built in the time before recorded history, it is both a monument to unspeakable gods and a massive breeding ground for the qiraji army. Since the War of the Shifting Sands ended a thousand years ago, the Twin Emperors of the qiraji empire have been trapped inside their temple, barely contained behind the magical barrier erected by the bronze dragon Anachronos and the night elves. Now that the Scepter of the Shifting Sands has been reassembled and the seal has been broken, the way into the inner sanctum of Ahn'Qiraj is open. Beyond the crawling madness of the hives, beneath the Temple of Ahn'Qiraj, legions of qiraji prepare for invasion. They must be stopped at all costs before they can unleash their voracious insectoid armies on Kalimdor once again, and a second War of the Shifting Sands breaks loose!",
    Caption = "Temple of Ahn'Qiraj",
    QAA = "2 Quests",
    QAH = "2 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[29].Quests.Alliance[1] = {
    Title = "1. C'Thun's Legacy",
    Level = "60",
    Attain = "60",
    Aim = "Take the Eye of C'Thun to Caelastrasz in the Temple of Ahn'Qiraj.",
    Location = "Eye of C'Thun (drops from C'Thun; [9])",
    Note = "Caelestrasz (Temple of Ahn'Qiraj; 2')\\nRewards listed are for the followup.",
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
KQuestInstanceData[29].Quests.Alliance[2] = {
    Title = "2. Secrets of the Qiraji",
    Level = "60",
    Attain = "60",
    Aim = "Take the Ancient Qiraji Artifact to the dragons hiding near the entrance of the temple.",
    Location = "Ancient Qiraji Artifact (random drop in Temple of Ahn'Qiraj)",
    Note = "Turns in to Andorgos (Temple of Ahn'Qiraj; 1').",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[29].Quests.Horde[1] = KQuestInstanceData[29].Quests.Alliance[1]
KQuestInstanceData[29].Quests.Horde[2] = KQuestInstanceData[29].Quests.Alliance[2]

--------------- INST30 - Zul'Farrak ---------------
KQuestInstanceData[30] = {
    Story = "This sun-blasted city is home to the Sandfury trolls, known for their particular ruthlessness and dark mysticism. Troll legends tell of a powerful sword called Sul'thraze the Lasher, a weapon capable of instilling fear and weakness in even the most formidable of foes. Long ago, the weapon was split in half. However, rumors have circulated that the two halves may be found somewhere within Zul'Farrak's walls. Reports have also suggested that a band of mercenaries fleeing Gadgetzan wandered into the city and became trapped. Their fate remains unknown. But perhaps most disturbing of all are the hushed whispers of an ancient creature sleeping within a sacred pool at the city's heart - a mighty demigod who will wreak untold destruction upon any adventurer foolish enough to awaken him.",
    Caption = "Zul'Farrak",
    QAA = "8 Quests",
    QAH = "9 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[30].Quests.Alliance[1] = {
    Title = "1. Nekrum's Medallion",
    Level = "47",
    Attain = "40",
    Aim = "Bring Nekrum's Medallion to Thadius Grimshade in the Blasted Lands.",
    Location = "Thadius Grimshade (The Blasted Lands - Nethergarde Keep; 66,19)",
    Note = "The Questline starts at Gryphon Master Talonaxe (The Hinterlands - Wildhammer Stronghold; 9,44).\\nNekrum spawns at [4] with the final crowd you fight for the Temple event.",
    Prequest = "Witherbark Cages -> Thadius Grimshade",
    Folgequest = "The Divination",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[30].Quests.Alliance[2] = {
    Title = "2. Troll Temper",
    Level = "45",
    Attain = "40",
    Aim = "Bring 20 Vials of Troll Temper to Trenton Lighthammer in Gadgetzan.",
    Location = "Trenton Lighthammer (Tanaris - Gadgetzan; 51,28)",
    Note = "Every Troll can drop the Tempers.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[30].Quests.Alliance[3] = {
    Title = "3. Scarab Shells",
    Level = "45",
    Attain = "40",
    Aim = "Bring 5 Uncracked Scarab Shells to Tran'rek in Gadgetzan.",
    Location = "Tran'rek (Tanaris - Gadgetzan; 51,26)",
    Note = "The prequest starts at Krazek (Stranglethorn Vale - Booty Bay; 25,77).\\nEvery Scarab can drop the Shells. A lot of Scarabs are at [2].",
    Prequest = "Tran'rek",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[30].Quests.Alliance[4] = {
    Title = "4. Tiara of the Deep",
    Level = "46",
    Attain = "40",
    Aim = "Bring the Tiara of the Deep to Tabetha in Dustwallow Marsh.",
    Location = "Tabetha (Dustwallow Marsh; 46,57)",
    Note = "Hydromancer Velratha drops the Tiara of the Deep at [6].",
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
KQuestInstanceData[30].Quests.Alliance[5] = {
    Title = "5. The Prophecy of Mosh'aru",
    Level = "47",
    Attain = "40",
    Aim = "Bring the First and Second Mosh'aru Tablets to Yeh'kinya in Tanaris.",
    Location = "Yeh'kinya (Tanaris - Steamwheedle Port; 66,22)",
    Note = "You get the prequest from the same NPC.\\nThe Tablets drop from Theka the Martyr at [2] and Hydromancer Velratha at [6].",
    Prequest = "Screecher Spirits",
    Folgequest = "The Ancient Egg",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[30].Quests.Alliance[6] = {
    Title = "6. Divino-matic Rod",
    Level = "47",
    Attain = "40",
    Aim = "Bring the Divino-matic Rod to Chief Engineer Bilgewhizzle in Gadgetzan.",
    Location = "Chief Engineer Bilgewhizzle (Tanaris - Gadgetzan; 52,28)",
    Note = "You get the Rod from Sergeant Bly. You can find him at [4] after the Temple event.",
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
KQuestInstanceData[30].Quests.Alliance[7] = {
    Title = "7. Gahz'rilla",
    Level = "50",
    Attain = "40",
    Aim = "Bring Gahz'rilla's Electrified Scale to Wizzle Brassbolts in the Shimmering Flats.",
    Location = "Wizzle Brassbolts (Thousands Needles - Mirage Raceway; 78,77)",
    Note = "You get the prequest from Klockmort Spannerspan (Dun Morogh - Gnomeregan Reclamation Facility; 23.6,28). It is not necessary to have the prequest to get the Gahz'rilla quest.\\nYou summon Gahz'rilla at [6] with the Mallet of Zul'Farrak.\\nThe Sacred Mallet comes from Qiaga the Keeper (The Hinterlands - The Altar of Zul; 49,70) and must be completed at the Altar in Jinta'Alor at 59,77 before it can be used in Zul'Farrak.",
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
KQuestInstanceData[30].Quests.Alliance[8] = {
    Title = "8. Drifting Across the Sand",
    Level = "46",
    Attain = "40",
    Aim = "Venture into Zul'Farrak and find the Ancient Troll Remains, then return them to Hansu Go'sha at the Southmoon Ruins in Tanaris.",
    Location = "Hansu Go'sha (Tanaris; 42,73)",
    Note = "In the room with Witch Doctor Zum'Rah [3] Ancient Burial Container (little green wooden box).",
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
KQuestInstanceData[30].Quests.Horde[1] = {
    Title = "1. The Spider God",
    Level = KQuestInstanceData[30].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[30].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[30].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[30].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[30].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[30].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[30].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[30].Quests.Horde[2] = KQuestInstanceData[30].Quests.Alliance[2]
KQuestInstanceData[30].Quests.Horde[3] = KQuestInstanceData[30].Quests.Alliance[3]
KQuestInstanceData[30].Quests.Horde[4] = KQuestInstanceData[30].Quests.Alliance[4]
KQuestInstanceData[30].Quests.Horde[5] = KQuestInstanceData[30].Quests.Alliance[5]
KQuestInstanceData[30].Quests.Horde[6] = KQuestInstanceData[30].Quests.Alliance[6]
KQuestInstanceData[30].Quests.Horde[7] = KQuestInstanceData[30].Quests.Alliance[7]
KQuestInstanceData[30].Quests.Horde[8] = KQuestInstanceData[30].Quests.Alliance[8]
KQuestInstanceData[30].Quests.Horde[9] = {
    Title = "9. End Ukorz Sandscalp",
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
KQuestInstanceData[31] = {
    Story = "",
    Caption = "Zul'Gurub",
    QAA = "4 Quests",
    QAH = "4 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[31].Quests.Alliance[1] = {
    Title = "1. A Collection of Heads",
    Level = "60",
    Attain = "58",
    Aim = "String 5 Channeler's Heads, then return the Collection of Troll Heads to Exzhal on Yojamba Isle.",
    Location = "Exzhal (Stranglethorn Vale - Yojamba Isle; 15,15)",
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
KQuestInstanceData[31].Quests.Alliance[2] = {
    Title = "2. The Heart of Hakkar",
    Level = "60",
    Attain = "58",
    Aim = "Bring the Heart of Hakkar to Molthor on Yojamba Isle.",
    Location = "Heart of Hakkar (drops from Hakkar; [11])",
    Note = "Molthor (Stranglethorn Vale - Yojamba Isle; 15,15)",
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
KQuestInstanceData[31].Quests.Alliance[3] = {
    Title = "3. Nat's Measuring Tape",
    Level = "60",
    Attain = "58",
    Aim = "Return Nat's Measuring Tape to Nat Pagle in Dustwallow Marsh.",
    Location = "Battered Tackle Box (Zul'Gurub - Northeast by water from Hakkar's Island)",
    Note = "Nat Pagle is at Dustwallow Marsh (59,60). Turning the quest in allows you to buy Mudskunk Lures from Nat Pagle to summon Gahz'ranka in Zul'Gurub.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[31].Quests.Alliance[4] = {
    Title = "4. The Perfect Poison",
    Level = "60",
    Attain = "60",
    Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac.",
    Location = "Dirk Thunderwood (Silithus - Cenarion Hold; 52,39)",
    Note = "Venoxis's Venom Sac drops from High priest Venoxis in Zul'Gurub at [2]. Kurinnaxx's Venom Sac drops in the Ruins of Ahn'Qiraj at [1].",
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
KQuestInstanceData[31].Quests.Horde[1] = KQuestInstanceData[31].Quests.Alliance[1]
KQuestInstanceData[31].Quests.Horde[2] = KQuestInstanceData[31].Quests.Alliance[2]
KQuestInstanceData[31].Quests.Horde[3] = KQuestInstanceData[31].Quests.Alliance[3]
KQuestInstanceData[31].Quests.Horde[4] = KQuestInstanceData[31].Quests.Alliance[4]

--------------- INST32 - Gnomeregan ---------------
KQuestInstanceData[32] = {
    Story = "Located in Dun Morogh, the technological wonder known as Gnomeregan has been the gnomes' capital city for generations. Recently, a hostile race of mutant troggs infested several regions of Dun Morogh - including the great gnome city. In a desperate attempt to destroy the invading troggs, High Tinker Mekkatorque ordered the emergency venting of the city's radioactive waste tanks. Several gnomes sought shelter from the airborne pollutants as they waited for the troggs to die or flee. Unfortunately, though the troggs became irradiated from the toxic assault - their siege continued, unabated. Those gnomes who were not killed by noxious seepage were forced to flee, seeking refuge in the nearby dwarven city of Ironforge. There, High Tinker Mekkatorque set out to enlist brave souls to help his people reclaim their beloved city. It is rumored that Mekkatorque's once-trusted advisor, Mekgineer Thermaplugg, betrayed his people by allowing the invasion to happen. Now, his sanity shattered, Thermaplug remains in Gnomeregan - furthering his dark schemes and acting as the city's new techno-overlord.",
    Caption = "Gnomeregan",
    QAA = "13 Quests",
    QAH = "7 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[32].Quests.Alliance[1] = {
    Title = "1. Save Techbot's Brain!",
    Level = "26",
    Attain = "20",
    Aim = "Bring Techbot's Memory Core to Tinkmaster Overspark at the Gnomeregan Reclamation Facility.",
    Location = "Tinkmaster Overspark (Dun Morogh - Gnomeregan Reclamation Facility; 24.4,29.8)",
    Note = "You get the prequest from Brother Sarno (Stormwind - Cathedral Square; 40,30).\\nYou find Techbot before you enter the instance near the backdoor, at [4] on Entrance Map.",
    Prequest = "Tinkmaster Overspark",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Alliance[2] = {
    Title = "2. Gnogaine",
    Level = "27",
    Attain = "20",
    Aim = "Use the Empty Leaden Collection Phial on Irradiated Invaders or Irradiated Pillagers to collect radioactive fallout. Once it is full, take it back to Ozzie Togglevolt in Kharanos.",
    Location = "Ozzie Togglevolt (Dun Morogh - Kharanos; 45,49)",
    Note = "You get the prequest from Gnoarn (Dun Morogh - Gnomeregan Reclamation Facility; 24.5,30.4).\\nTo get fallout you musst use the Phial on alive Irradiated Invaders or Irradiated Pillagers.",
    Prequest = "The Day After",
    Folgequest = "The Only Cure is More Green Glow",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Alliance[3] = {
    Title = "3. The Only Cure is More Green Glow",
    Level = "30",
    Attain = "20",
    Aim = "Travel to Gnomeregan and bring back High Potency Radioactive Fallout. Be warned, the fallout is unstable and will collapse rather quickly.\\nOzzie will also require your Heavy Leaden Collection Phial when the task is complete.",
    Location = "Ozzie Togglevolt (Dun Morogh - Kharanos; 45,49)",
    Note = "To get fallout you must use the Phial on alive Irradiated Slimes or Horrors.",
    Prequest = "Gnogaine",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Alliance[4] = {
    Title = "4. Gyrodrillmatic Excavationators",
    Level = "30",
    Attain = "20",
    Aim = "Bring twenty-four Robo-mechanical Guts to Shoni in Stormwind.",
    Location = "Shoni the Silent (Stormwind - Dwarven District; 55,12)",
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
KQuestInstanceData[32].Quests.Alliance[5] = {
    Title = "5. Essential Artificials",
    Level = "30",
    Attain = "24",
    Aim = "Bring 12 Essential Artificials to Klockmort Spannerspan at the Gnomeregan Reclamation Facility",
    Location = "Klockmort Spannerspan (Dun Morogh - Gnomeregan Reclamation Facility; 23.6,28)",
    Note = "You get the prequest from Mathiel (Darnassus - Warrior's Terrace; 59,45). The prequest is only a pointer quest and is not required to get this quest.\\nThe Essential Artificials come from machines scattered around the instance.",
    Prequest = "Klockmort's Essentials",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Alliance[6] = {
    Title = "6. Data Rescue",
    Level = "30",
    Attain = "25",
    Aim = "Bring a Prismatic Punch Card to Master Mechanic Castpipe at the Gnomeregan Reclamation Facility.",
    Location = "Master Mechanic Castpipe (Dun Morogh - Gnomeregan Reclamation Facility; 24.1,29.8)",
    Note = "You get the prequest from Gaxim Rustfizzle (Stonetalon Mountains; 59,67). The prequest is only a pointer quest and is not required to get this quest.\\nThe white card is a random drop. You find the first terminal next to the back entrance before you enter the instance at [3] on Entrance Map. The 3005-B is at [3], the 3005-C at [5] and the 3005-D is at [6].",
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
KQuestInstanceData[32].Quests.Alliance[7] = {
    Title = "7. A Fine Mess",
    Level = "30",
    Attain = "24",
    Aim = "Escort Kernobee to the Clockwerk Run exit and then report to Scooty in Booty Bay.",
    Location = "Kernobee (Gnomeregan; [3])",
    Note = "Escort quest! You find Scooty in Stranglethorn Vale - Booty Bay (27,77).",
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
KQuestInstanceData[32].Quests.Alliance[8] = {
    Title = "8. The Grand Betrayal",
    Level = "35",
    Attain = "25",
    Aim = "Venture to Gnomeregan and kill Mekgineer Thermaplugg. Return to High Tinker Mekkatorque when the task is complete.",
    Location = "High Tinker Mekkatorque (Dun Morogh - Gnomeregan Reclamation Facility; 24.2,29.7)",
    Note = "You find Thermaplugg at [8]. He is the last boss in Gnomeregan.\\nDuring the fight you have to disable the columns through pushing the button on the side.",
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
KQuestInstanceData[32].Quests.Alliance[9] = {
    Title = "9. Grime-Encrusted Ring",
    Level = "34",
    Attain = "28",
    Aim = "Figure out a way to remove the grime from the Grime-Encrusted Ring.",
    Location = "Grime-Encrusted Ring (random drop from Gnomeregan)",
    Note = "The Ring can be cleaned off at the Sparklematic 5200 in the Clean Room at [2].",
    Prequest = "No",
    Folgequest = "Return of the Ring",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Alliance[10] = {
    Title = "10. Return of the Ring",
    Level = "34",
    Attain = "28",
    Aim = "You may either keep the ring, or you may find the person responsible for the imprint and engravings on the inside of the band.",
    Location = "Brilliant Gold Ring (obtained from Grime-Encrusted Ring quest)",
    Note = "Turns in to Talvash del Kissel (Ironforge - Mystic Ward; 36,3). The followup to enhance the ring is optional.",
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
KQuestInstanceData[32].Quests.Alliance[11] = {
    Title = "11. A Pounding Brain",
    Level = "30",
    Attain = "30",
    Aim = "Find Someone who can figure out what to do with the Mainframe.",
    Location = "Intact Pounder Mainframe",
    Note = "Intact Pounder Mainframe that starts the quest can drop from Crowd Pummeler 9-60[6](low chance).\\nAvailable for ENGINEERS with 125+ skill.",
    Prequest = "No",
    Folgequest = "To Build a Pounder",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Alliance[12] = {
    Title = "12. High Energy Regulator",
    Level = "33",
    Attain = "25",
    Aim = "Find the Schematic: High Energy Regulator within Gnomeregan and bring it to Weezan Littlegear at the Gnomeregan Reclamation Facility in Dun Morogh.",
    Location = "Weezan Littlegear (Dun Morogh - Gnomeregan Reclamation Facility [25.2,31.6])",
    Note = "Schematic: High Energy Regulator is on the table at [3] southeastern corner lower south chamber [a].",
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
KQuestInstanceData[32].Quests.Alliance[13] = {
    Title = "13. Backup System Activation",
    Level = "33",
    Attain = "25",
    Aim = "Activate the Alpha Channel Valve [6] and the Reserve Pump Channel Lever [b] deep within Gnomeregan for Master Technician Wirespanner in Dun Morogh.",
    Location = "Master Technician Wirespanner (Dun Morogh - Gnomeregan Reclamation Facility [26.8,31.1])",
    Note = "Alpha Channel Valve is at [6], use elevetaor to go down. south side of the central mechanism.\\nReserve Pump Channel Lever is at [b] on the floor.",
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
KQuestInstanceData[32].Quests.Horde[1] = {
    Title = "1. Gnomer-gooooone!",
    Level = KQuestInstanceData[32].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[32].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[32].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[32].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[32].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[32].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[32].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Horde[2] = {
    Title = "2. A Fine Mess",
    Level = KQuestInstanceData[32].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[32].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[32].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[32].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[32].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[32].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[32].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[32].Quests.Horde[3] = {
    Title = "3. Rig Wars",
    Level = KQuestInstanceData[32].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[32].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[32].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[32].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[32].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[32].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[32].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[32].Quests.Horde[4] = {
    Title = "4. Grime-Encrusted Ring",
    Level = KQuestInstanceData[32].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[32].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[32].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[32].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[32].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[32].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[32].Quests.Alliance[4].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Horde[5] = {
    Title = "5. Return of the Ring",
    Level = KQuestInstanceData[32].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[32].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[32].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[32].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[32].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[32].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[32].Quests.Alliance[5].Folgequest,
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
KQuestInstanceData[32].Quests.Horde[6] = {
    Title = "6. A Pounding Brain",
    Level = KQuestInstanceData[32].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[32].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[32].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[32].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[32].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[32].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[32].Quests.Alliance[6].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[32].Quests.Horde[7] = {
    Title = "7. Backup Capacitor",
    Level = KQuestInstanceData[32].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[32].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[32].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[32].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[32].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[32].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[32].Quests.Alliance[7].Folgequest,
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
KQuestInstanceData[33] = {
    Story = "",
    Caption = "Dragons of Nightmare",
    QAA = "1 Quest",
    QAH = "1 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[33].Quests.Alliance[1] = {
    Title = "1. Shrouded in Nightmare",
    Level = "60",
    Attain = "60",
    Aim = "Find someone capable of deciphering the meaning behind the Nightmare Engulfed Object.\\n\\nPerhaps a druid of great power could assist you.",
    Location = "Nightmare Engulfed Object (drops from Emeriss, Taerar, Lethon or Ysondre)",
    Note = "Quest turns in to Keeper Remulos at (Moonglade - Shrine of Remulos; 36,41). Reward listed is for the followup.",
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
KQuestInstanceData[33].Quests.Horde[1] = KQuestInstanceData[33].Quests.Alliance[1]

--------------- INST34 - Azuregos ---------------
KQuestInstanceData[34] = {
    Story = "Before the Great Sundering, the night elf city of Eldarath flourished in the land that is now known as Azshara. It is believed that many ancient and powerful Highborne artifacts may be found among the ruins of the once-mighty stronghold. For countless generations, the Blue Dragon Flight has safeguarded powerful artifacts and magical lore, ensuring that they do not fall into mortal hands. The presence of Azuregos, the Blue dragon, seems to suggest that items of extreme significance, perhaps the fabled Vials of Eternity themselves, may be found in the wilderness of Azshara. Whatever Azuregos seeks, one thing is certain: he will fight to the death to defend Azshara's magical treasures.",
    Caption = "Azuregos",
    QAA = "2 Quests",
    QAH = "2 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[34].Quests.Alliance[1] = {
    Title = "1. Ancient Sinew Wrapped Lamina",
    Level = "60",
    Attain = "60",
    Aim = "Hastat the Ancient has asked that you bring him a Mature Blue Dragon Sinew. Should you find this sinew, return it to Hastat in Felwood.",
    Location = "Hastat the Ancient (Felwood - Irontree Woods; 48,24)",
    Note = "Hunter only: Kill Azuregos to get the Mature Blue Dragon Sinew. He walks around the middle of the southern peninsula in Azshara near [1].",
    Prequest = "The Ancient Leaf (Molten Core)",
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
KQuestInstanceData[34].Quests.Alliance[2] = {
    Title = "2. Azuregos's Magical Ledger",
    Level = "60",
    Attain = "60",
    Aim = "Deliver Azuregos's Magical Ledger to Narain Soothfancy in Tanaris.",
    Location = "Spirit of Azuregos (Azshara; 56,83)",
    Note = "You can find Narain Soothfancy in Tanaris at 65.17.",
    Prequest = "The Charge of the Dragonflights",
    Folgequest = "Translating the Ledger",
}
KQuestInstanceData[34].Quests.Horde[1] = KQuestInstanceData[34].Quests.Alliance[1]
KQuestInstanceData[34].Quests.Horde[2] = KQuestInstanceData[34].Quests.Alliance[2]

--------------- INST35 - Lord Kazzak ---------------
KQuestInstanceData[35] = {
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
KQuestInstanceData[36] = {
    Story = "Long ago, before the First War, the warlock Gul'dan exiled a clan of orcs called the Frostwolves to a hidden valley deep in the heart of the Alterac Mountains. It is here in the valley's southern reaches that the Frostwolves eked out a living until the coming of Thrall.\\nAfter Thrall's triumphant uniting of the clans, the Frostwolves, now led by the Orc Shaman Drek'Thar, chose to remain in the valley they had for so long called their home. In recent times, however, the relative peace of the Frostwolves has been challenged by the arrival of the Dwarven Stormpike Expedition.\\nThe Stormpikes have set up residence in the valley to search for natural resources and ancient relics. Despite their intentions, the Dwarven presence has sparked heated conflict with the Frostwolf Orcs to the south, who have vowed to drive the interlopers from their lands. ",
    Caption = "Alterac Valley",
    QAA = "17 Quests",
    QAH = "17 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[36].Quests.Alliance[1] = {
    Title = "1. The Sovereign Imperative",
    Level = "60",
    Attain = "51",
    Aim = "Travel to Alterac Valley in the Hillsbrad Foothills. Outside of the entrance tunnel, find and speak with Lieutenant Haggerdin.",
    Location = "Lieutenant Rotimer (Ironforge - The Commons; 30,62)",
    Note = "Lieutenant Haggerdin is at (Alterac Mountains; 39,81).",
    Prequest = "No",
    Folgequest = "Proving Grounds",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[2] = {
    Title = "2. Proving Grounds",
    Level = "60",
    Attain = "51",
    Aim = "Travel to the Icewing Caverns located southwest of Dun Baldar in Alterac Valley and recover the Stormpike Banner. Return the Stormpike Banner to Lieutenant Haggerdin in the Alterac Mountains.",
    Location = "Lieutenant Haggerdin (Alterac Mountains; 39,81)",
    Note = "The Stormpike Banner is in the Icewing Cavern at [11] on the Alterac Valley - North map. Talk to the same NPC each time you gain a new Reputation level for an upgraded Insignia.\\n\\nThe prequest is not necessary to obtain this quest, but it does yield about 9550 experience.",
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
KQuestInstanceData[36].Quests.Alliance[3] = {
    Title = "3. The Battle of Alterac",
    Level = "60",
    Attain = "51",
    Aim = "Enter Alterac Valley, defeat the Horde general Drek'thar, and then return to Prospector Stonehewer in the Alterac Mountains.",
    Location = "Prospector Stonehewer (Alterac Mountains; 41,80) and\\n(Alterac Valley - North; [B])",
    Note = "Drek'thar is at (Alterac Valley - South; [B]). He does not actually need to be killed to complete the quest. The battleground just has to be won by your side in any manner.\\nAfter turning this quest in, talk to the NPC again for the reward.",
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
KQuestInstanceData[36].Quests.Alliance[4] = {
    Title = "4. The Quartermaster",
    Level = "60",
    Attain = "51",
    Aim = "Speak with the Stormpike Quartermaster.",
    Location = "Mountaineer Boombellow (Alterac Valley - North; Near [3] Before Bridge)",
    Note = "The Stormpike Quartermaster is at (Alterac Valley - North; [7]) and provides more quests.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[5] = {
    Title = "5. Coldtooth Supplies",
    Level = "60",
    Attain = "51",
    Aim = "Bring 10 Coldtooth Supplies to the Alliance Quartermaster in Dun Baldar.",
    Location = "Stormpike Quartermaster (Alterac Valley - North; [7])",
    Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - South; [6]).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[6] = {
    Title = "6. Irondeep Supplies",
    Level = "60",
    Attain = "51",
    Aim = "Bring 10 Irondeep Supplies to the Alliance Quartermaster in Dun Baldar.",
    Location = "Stormpike Quartermaster (Alterac Valley - North; [7])",
    Note = "The supplies can be found in the Irondeep Mine at (Alterac Valley - North; [1]).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[7] = {
    Title = "7. Armor Scraps",
    Level = "60",
    Attain = "51",
    Aim = "Bring 20 Armor Scraps to Murgot Deepforge in Dun Baldar.",
    Location = "Murgot Deepforge (Alterac Valley - North; [4])",
    Note = "Loot the corpse of enemy players for scraps. The followup is just the same, quest, but repeatable.",
    Prequest = "No",
    Folgequest = "More Armor Scraps",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[8] = {
    Title = "8. Capture a Mine",
    Level = "60",
    Attain = "51",
    Aim = "Capture a mine that the Stormpike does not control, then return to Sergeant Durgen Stormpike in the Alterac Mountains.",
    Location = "Sergeant Durgen Stormpike (Alterac Mountains; 37,77)",
    Note = "To complete the quest, you must kill either Morloch in the Irondeep Mine at (Alterac Valley - North; [1]) or Taskmaster Snivvle in the Coldtooth Mine at (Alterac Valley - South; [6]) while the Horde control it.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[9] = {
    Title = "9. Towers and Bunkers",
    Level = "60",
    Attain = "51",
    Aim = "Destroy the banner at an enemy tower or bunker, then return to Sergeant Durgen Stormpike in the Alterac Mountains.",
    Location = "Sergeant Durgen Stormpike (Alterac Mountains; 37,77)",
    Note = "Reportedly, the Tower or Bunker need not actually be destroyed to complete the quest, just assaulted.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[10] = {
    Title = "10. Alterac Valley Graveyards",
    Level = "60",
    Attain = "51",
    Aim = "Assault a graveyard, then return to Sergeant Durgen Stormpike in the Alterac Mountains.",
    Location = "Sergeant Durgen Stormpike (Alterac Mountains; 37,77)",
    Note = "Reportedly you do not need to do anything but be near a graveyard when the Alliance assaults it. It does not need to be captured, just assaulted.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[11] = {
    Title = "11. Empty Stables",
    Level = "60",
    Attain = "51",
    Aim = "Locate an Alterac Ram in Alterac Valley. Use the Stormpike Training Collar when you are near the Alterac Ram to 'tame' the beast. Once tamed, the Alterac Ram will follow you back to the Stable Master. Speak with the Stable Master to earn credit for the capture.",
    Location = "Stormpike Stable Master (Alterac Valley - North; [6])",
    Note = "You can find a Ram outside the base. The taming process is just like that of a Hunter taming a pet. The quest is repeatable up to a total of 25 times per battleground by the same player or players. After 25 Rams have been tamed, the Stormpike Cavalry will arrive to assist in the battle.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[12] = {
    Title = "12. Ram Riding Harnesses",
    Level = "60",
    Attain = "51",
    Aim = "You must strike at our enemy's base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go!",
    Location = "Stormpike Ram Rider Commander (Alterac Valley - North; [6])",
    Note = "Frostwolves can be found in the southern area of Alterac Valley.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[13] = {
    Title = "13. Crystal Cluster",
    Level = "60",
    Attain = "51",
    Aim = "There are times which you may be entrenched in battle for days or weeks on end. During those longer periods of activity you may end up collecting large clusters of the Frostwolf's storm crystals.\\n\\nThe Circle accepts such offerings.",
    Location = "Arch Druid Renferal (Alterac Valley - North; [2])",
    Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; [19]). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[14] = {
    Title = "14. Ivus the Forest Lord",
    Level = "60",
    Attain = "51",
    Aim = "The Frostwolf Clan is protected by a taint of elemental energy. Their shaman meddle in powers that will surely destroy us all if left unchecked.\\n\\nThe Frostwolf soldiers carry elemental charms called storm crystals. We can use the charms to conjure Ivus. Venture forth and claim the crystals.",
    Location = "Arch Druid Renferal (Alterac Valley - North; [2])",
    Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; [19]). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[15] = {
    Title = "15. Call of Air - Slidore's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "My gryphons are poised to strike at the front lines but cannot make the attack until the lines are thinned out.\\n\\nThe Frostwolf warriors charged with holding the front lines wear medals of service proudly upon their chests. Rip those medals off their rotten corpses and bring them back here.\\n\\nOnce the front line is sufficiently thinned out, I will make the call to air! Death from above!",
    Location = "Wing Commander Slidore (Alterac Valley - North; [8])",
    Note = "Kill Horde NPCs for the Frostwolf Soldier's Medal.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[16] = {
    Title = "16. Call of Air - Vipore's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "The elite Frostwolf units that guard the lines must be dealt with, soldier! I'm tasking you with thinning out that herd of savages. Return to me with medals from their lieutenants and legionnaires. When I feel that enough of the riff-raff has been dealt with, I'll deploy the air strike.",
    Location = "Wing Commander Vipore (Alterac Valley - North; [8])",
    Note = "Kill Horde NPCs for the Frostwolf Lieutenant's Medal.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Alliance[17] = {
    Title = "17. Call of Air - Ichman's Fleet",
    Level = "60",
    Attain = "51",
    Aim = "Return to the battlefield and strike at the heart of the Frostwolf's command. Take down their commanders and guardians. Return to me with as many of their medals as you can stuff in your pack! I promise you, when my gryphons see the bounty and smell the blood of our enemies, they will fly again! Go now!",
    Location = "Wing Commander Ichman (Alterac Valley - North; [8])",
    Note = "Kill Horde NPCs for the Frostwolf Commander's Medals. After turning in 50, Wing Commander Ichman will either send a gryphon to attack the Horde base or give you a beacon to plant in the Snowfall Graveyard. If the beacon is protected long enough a gryphon will come to defend it.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[1] = {
    Title = "1. In Defense of Frostwolf",
    Level = KQuestInstanceData[36].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[2] = {
    Title = KQuestInstanceData[36].Quests.Alliance[2].Title,
    Level = KQuestInstanceData[36].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[36].Quests.Horde[3] = {
    Title = "3. The Battle for Alterac",
    Level = KQuestInstanceData[36].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[3].Folgequest,
    Rewards = KQuestInstanceData[36].Quests.Alliance[3].Rewards
}
KQuestInstanceData[36].Quests.Horde[4] = {
    Title = "4. Speak with our Quartermaster",
    Level = KQuestInstanceData[36].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[4].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[5] = {
    Title = KQuestInstanceData[36].Quests.Alliance[5].Title,
    Level = KQuestInstanceData[36].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[5].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[6] = {
    Title = KQuestInstanceData[36].Quests.Alliance[6].Title,
    Level = KQuestInstanceData[36].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[6].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[7] = {
    Title = "7. Enemy Booty",
    Level = KQuestInstanceData[36].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[7].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[8] = {
    Title = KQuestInstanceData[36].Quests.Alliance[8].Title,
    Level = KQuestInstanceData[36].Quests.Alliance[8].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[8].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[8].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[8].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[8].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[8].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[8].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[9] = {
    Title = KQuestInstanceData[36].Quests.Alliance[9].Title,
    Level = KQuestInstanceData[36].Quests.Alliance[9].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[9].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[9].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[9].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[9].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[9].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[9].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[10] = {
    Title = "10. The Graveyards of Alterac",
    Level = KQuestInstanceData[36].Quests.Alliance[10].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[10].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[10].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[10].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[10].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[10].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[10].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[11] = {
    Title = KQuestInstanceData[36].Quests.Alliance[11].Title,
    Level = KQuestInstanceData[36].Quests.Alliance[11].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[11].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[11].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[11].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[11].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[11].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[11].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[12] = {
    Title = "12. Ram Hide Harnesses",
    Level = KQuestInstanceData[36].Quests.Alliance[12].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[12].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[12].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[12].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[12].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[12].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[12].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[13] = {
    Title = "13. A Gallon of Blood",
    Level = KQuestInstanceData[36].Quests.Alliance[13].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[13].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[13].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[13].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[13].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[13].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[13].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[14] = {
    Title = "14. Lokholar the Ice Lord",
    Level = KQuestInstanceData[36].Quests.Alliance[14].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[14].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[14].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[14].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[14].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[14].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[14].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[15] = {
    Title = "15. Call of Air - Guse's Fleet",
    Level = KQuestInstanceData[36].Quests.Alliance[15].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[15].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[15].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[15].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[15].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[15].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[15].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[16] = {
    Title = "16. Call of Air - Jeztor's Fleet",
    Level = KQuestInstanceData[36].Quests.Alliance[16].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[16].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[16].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[16].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[16].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[16].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[16].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[36].Quests.Horde[17] = {
    Title = "17. Call of Air - Mulverick's Fleet",
    Level = KQuestInstanceData[36].Quests.Alliance[17].Level,
    Attain = KQuestInstanceData[36].Quests.Alliance[17].Attain,
    Aim = KQuestInstanceData[36].Quests.Alliance[17].Aim,
    Location = KQuestInstanceData[36].Quests.Alliance[17].Location,
    Note = KQuestInstanceData[36].Quests.Alliance[17].Note,
    Prequest = KQuestInstanceData[36].Quests.Alliance[17].Prequest,
    Folgequest = KQuestInstanceData[36].Quests.Alliance[17].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST37 - Arathi Basin ---------------
KQuestInstanceData[37] = {
    Story = "Arathi Basin, located in Arathi Highlands, is a fast and exciting Battleground. The Basin itself is rich with resources and coveted by both the Horde and the Alliance. The Forsaken Defilers and the League of Arathor have arrived at Arathi Basin to wage war over these natural resources and claim them on behalf of their respective sides.",
    Caption = "Arathi Basin",
    QAA = "3 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[37].Quests.Alliance[1] = {
    Title = "1. The Battle for Arathi Basin!",
    Level = "55",
    Attain = "50",
    Aim = "Assault the mine, the lumber mill, the blacksmith and the farm, then return to Field Marshal Oslight in Refuge Pointe.",
    Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; 46,45)",
    Note = "The locations to be assaulted are marked on the map as 2 through 5.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[37].Quests.Alliance[2] = {
    Title = "2. Control Four Bases",
    Level = "60",
    Attain = "60",
    Aim = "Enter Arathi Basin, capture and control four bases at the same time, and then return to Field Marshal Oslight at Refuge Pointe.",
    Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; 46,45)",
    Note = "You need to be Friendly with the League of Arathor to get this quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[37].Quests.Alliance[3] = {
    Title = "3. Control Five Bases",
    Level = "60",
    Attain = "60",
    Aim = "Control 5 bases in Arathi Basin at the same time, then return to Field Marshal Oslight at Refuge Pointe.",
    Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; 46,45)",
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
KQuestInstanceData[37].Quests.Horde[1] = {
    Title = KQuestInstanceData[37].Quests.Alliance[1].Title,
    Level = KQuestInstanceData[37].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[37].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[37].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[37].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[37].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[37].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[37].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[37].Quests.Horde[2] = {
    Title = "2. Take Four Bases",
    Level = KQuestInstanceData[37].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[37].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[37].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[37].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[37].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[37].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[37].Quests.Alliance[2].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[37].Quests.Horde[3] = {
    Title = "3. Take Five Bases",
    Level = KQuestInstanceData[37].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[37].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[37].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[37].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[37].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[37].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[37].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[38] = {
    Story = "Nestled in the southern region of Ashenvale forest, Warsong Gulch is near the area where Grom Hellscream and his Orcs chopped away huge swaths of forest during the events of the Third War. Some orcs have remained in the vicinity, continuing their deforestation to fuel the Horde's expansion. They call themselves the Warsong Outriders.\\nThe Night Elves, who have begun a massive push to retake the forests of Ashenvale, are now focusing their attention on ridding their land of the Outriders once and for all. And so, the Silverwing Sentinels have answered the call and sworn that they will not rest until every last Orc is defeated and cast out of Warsong Gulch. ",
    Caption = "Warsong Gulch",
    QAA = "No Quests",
    QAH = "No Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}

--------------- INST39 - The Crescent Grove ---------------
KQuestInstanceData[39] = {
    Story = "A hidden grove in southern Ashenvale overlooking Mystral Lake that was once a retreat for druids for several years, an evil presence has taken root in the region.\\nOriginally a hidden grove that served as a calm retreat for druids, in recent times the Groveweald tribe has moved in while fleeing the madness of the Foulweald tribe, expelling several of the original inhabitants in the process. However, in spite of their attempts to escape the madness, they succumbed to it in time.\\nKalanar Brightshine once lived here, before he was expelled from the Grove by the Groveweald furbolgs and his home was burned down.\\nDemonic forces of the Burning Legion led by the doomguard Master Raxxieth have established themselves within the grove, beginning to corrupt the glade. Already, the Legion has left their mark in the form of the Vilethorn Scar, upsetting the balance and disturbing spirits.",
    Caption = "The Crescent Grove",
    QAA = "4 Quests",
    QAH = "3 Quests",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[39].Quests.Alliance[1] = {
    Title = "1. The Rampant Groveweald",
    Level = "33",
    Attain = "26",
    Aim = "Venture into the Crescent Grove and collect 8 Groveweald Badges from the furbolgs inside for Grol the Exile.",
    Location = "Grol the Exile (Ashenvale 56,59)",
    Note = "Drop from furbolgs.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[39].Quests.Alliance[2] = {
    Title = "2. The Unwise Elders",
    Level = "34",
    Attain = "26",
    Aim = "Bring the paws of Elder 'One Eye' and Elder Blackmaw from within the Crescent Grove to Grol the Exile.",
    Location = "Grol the Exile (Ashenvale 56,59)",
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
KQuestInstanceData[39].Quests.Alliance[3] = {
    Title = "3. The Crescent Grove",
    Level = "37",
    Attain = "28",
    Aim = "Destroy the source of corruption inside Crescent Grove.",
    Location = "Denatharion <Druid Trainer> (Teldrassil - Darnassus 24,48)",
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
KQuestInstanceData[39].Quests.Alliance[4] = {
    Title = "4. Kalanar's Mallet",
    Level = "33",
    Attain = "25",
    Aim = "Travel to the Crescent Grove and find the burned down home of Kalanar Brightshine. Then retrieve Kalanar's Mallet and return it to him in Astranaar.",
    Location = "Kalanar Brightshine (Ashenvale 36,52)",
    Note = "Contained in Kalanar's Strongbox.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[39].Quests.Horde[1] = {
    Title = KQuestInstanceData[39].Quests.Alliance[1].Title,
    Level = KQuestInstanceData[39].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[39].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[39].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[39].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[39].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[39].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[39].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[39].Quests.Horde[2] = {
    Title = KQuestInstanceData[39].Quests.Alliance[2].Title,
    Level = KQuestInstanceData[39].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[39].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[39].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[39].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[39].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[39].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[39].Quests.Alliance[2].Folgequest,
    Rewards = KQuestInstanceData[39].Quests.Alliance[2].Rewards
}
KQuestInstanceData[39].Quests.Horde[3] = {
    Title = "3. Rooting Out Evil",
    Level = KQuestInstanceData[39].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[39].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[39].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[39].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[39].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[39].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[39].Quests.Alliance[3].Folgequest,
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
KQuestInstanceData[41] = {
    Story = "Karazhan Crypt is an instance dungeon located in the Deadwind Pass. Something is twisting the dead back to life in the forlorn catacombs, find the source so the dead may rest again.",
    Caption = "Karazhan Crypt",
    QAA = "2 Quest",
    QAH = "2 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[41].Quests.Alliance[1] = {
    Title = "1. The Mystery of Karazhan VII",
    Level = "60",
    Attain = "58",
    Aim = "Venture forth into the Karazhan Crypts, once inside slay Alarus, the watcher of the Crypts for Magus Ariden Dusktower in Deadwind Pass.",
    Location = "Magus Ariden Dusktower (Deadwind Pass 52,34)",
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
KQuestInstanceData[41].Quests.Alliance[2] = {
    Title = "2. No Honor Among Chefs",
    Level = "61",
    Attain = "60",
    Aim = "Slay the Ravenous Strigoi in Karazhan Crypts and return to The Cook in Lower Karazhan Halls.",
    Location = "The Cook near ([Lower Karazhan Halls- e])",
    Note = "Drop from [Ravenous Strigoi].\\nThe quest line starts [Recipes of Kezan] drop in [Tower of Karazhan].",
    Prequest = "A Chef's Majesty",
    Folgequest = "No",
    Rewards = {
        {
            Name = "Recipe: Empowering Herbal Salad",
        },
    }
}
KQuestInstanceData[41].Quests.Horde[1] = {
    Title = "1. The Depths of Karazhan VII",
    Level = KQuestInstanceData[41].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[41].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[41].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[41].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[41].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[41].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[41].Quests.Alliance[1].Folgequest,
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
KQuestInstanceData[41].Quests.Horde[2] = KQuestInstanceData[41].Quests.Alliance[2]

--------------- INST45 - Caverns Of Time: Black Morass ---------------
KQuestInstanceData[45] = {
    Story = "",
    Caption = "Caverns Of Time: Black Morass",
    QAA = "4 Quest",
    QAH = "4 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[45].Quests.Alliance[1] = {
    Title = "1. The First Opening of The Dark Portal",
    Level = "60",
    Attain = "60",
    Aim = "Enter the Timeways into Black Morass's past and slay Antnormi. Bring her head to Kheyna.",
    Location = "Chromie (Tanaris - Caverns of Time 57,59)",
    Note = "Quest line start from Lizzarik <Weapon Dealer> (The Barrens - patrol from Crossroads to Ratchet 57,37). Drop from [4].",
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
KQuestInstanceData[45].Quests.Alliance[2] = {
    Title = "2. The Bronze Betrayal",
    Level = "60",
    Attain = "58",
    Aim = "Slay Chronar, and bring his head to Tyvadrius in the Caverns of Time.",
    Location = "Tyvadrius (Tanaris - Caverns of Time 59,60)",
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
KQuestInstanceData[45].Quests.Alliance[3] = {
    Title = "3. Corrupted Sand",
    Level = "60",
    Attain = "58",
    Aim = "Collect a Corrupted Sand for Dronormu in the Caverns of Time.",
    Location = "Dronormu (Tanaris - Caverns of Time 63,58)",
    Note = "Drop from mobs and bosses.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[45].Quests.Alliance[4] = {
    Title = "4. Sand in Bulk",
    Level = "60",
    Attain = "58",
    Aim = "Collect 10 Corrupted Sand for Dronormu in the Caverns of Time.",
    Location = "Dronormu (Tanaris - Caverns of Time 63,58)",
    Note = "Drop from mobs and bosses.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[45].Quests.Horde[1] = KQuestInstanceData[45].Quests.Alliance[1]
KQuestInstanceData[45].Quests.Horde[2] = KQuestInstanceData[45].Quests.Alliance[2]
KQuestInstanceData[45].Quests.Horde[3] = KQuestInstanceData[45].Quests.Alliance[3]
KQuestInstanceData[45].Quests.Horde[4] = KQuestInstanceData[45].Quests.Alliance[4]

--------------- INST46 - Hateforge Quarry ---------------
KQuestInstanceData[46] = {
    Story = "Hateforge Quarry is an instance dungeon located in the Burning Steppes. Hidden away at the southeastern walls of the Burning Steppes, the Hateforge Quarry is the Dark Iron dwarves' newest effort to find of a new weapon to use against their adversaries. The innocent-looking quarry hides an insidious cavern, where the Shadowforge dwarves plot new schemes against all those that oppose them.",
    Caption = "Hateforge Quarry",
    QAA = "5 Quest",
    QAH = "5 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[46].Quests.Alliance[1] = {
    Title = "1. Rival Presence",
    Level = "54",
    Attain = "47",
    Aim = "Find out what's being dug up in the Hateforge Quarry.",
    Location = "Overseer Oilfist <The Thorium Brotherhood> (Searing Gorge - Thorium Point; 38.1,27.0).",
    Note = "Hateforge Chemist mobs drop Hateforge Brew Filled Flask for quest.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[46].Quests.Alliance[2] = {
    Title = "2. Miners Union Mutiny II",
    Level = "50",
    Attain = "45",
    Aim = "Slay 20 Hateforge Miners at the Hateforge Quarry and return to Morgrim Firepike at Blackrock Pass in Burning Steppes.",
    Location = "Morgrim Firepike (Burning Steppes - Blackrock Pass; 75.6,68.3).",
    Note = "Questline starts at Radgan Deepblaze with quest 'Gaining Orvak's Trust' (Burning Steppes - Blackrock Pass; 76.1,67.6).",
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
KQuestInstanceData[46].Quests.Alliance[3] = {
    Title = "3. The True High Foreman",
    Level = "51",
    Attain = "45",
    Aim = "Slay Bargul Blackhammer [1] , and recover the Senate's Orders for Orvak Sternrock at the Blackrock Pass in Burning Steppes.",
    Location = "Orvak Sternrock (Burning Steppes - Blackrock Pass; 75.9,68.2).",
    Note = "Questline starts at Radgan Deepblaze with quest 'Gaining Orvak's Trust' (Burning Steppes - Blackrock Pass; 76.1,67.6).\\nKill Bargul Blackhammer and take Senate's Orders on the table next to the boss.",
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
KQuestInstanceData[46].Quests.Alliance[4] = {
    Title = "4. Rumors of Hateforge Brew",
    Level = "54",
    Attain = "45",
    Aim = "Delve into the Hateforge Quarry and recover a Dark Iron Vial, and the Hateforge Chemistry Documents, then return to Varlag Duskbeard at Morgan's Vigil in Burning Steppes.",
    Location = "Varlag Duskbeard (Burning Steppes - Morgan's Vigil; 85.1,67.6).",
    Note = "Hateforge Chemist mobs drop Dark Iron Vial for quest, Hateforge Chemistry Documents is in the box[a].",
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
KQuestInstanceData[46].Quests.Alliance[5] = {
    Title = "5. Assaulting Hateforge",
    Level = "57",
    Attain = "45",
    Aim = "Venture into The Hateforge Quarry and remove the presence of the Twilight Hammer from deep within, when completed, return to King Magni Bronzebeard in Ironforge.",
    Location = "Senator Granitebelt (Burning Steppes - Morgan's Vigil; 85.2,67.9).",
    Note = "Kill the last boss Har'gesh Doomcaller [5].\\nQuestline starts with quest 'Investigating Hateforge' at the same questgiver.",
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
KQuestInstanceData[46].Quests.Alliance[6] = {
    Title = "6. Why Not Both?",
    Level = "50",
    Attain = "40",
    Aim = "Obtain the Heart of Landslide from the depths of Maraudon, and the Essence of Corrosis from Hateforge Quarry for Frig Thunderforge at Aerie Peak",
    Location = "Frig Thunderforge (Hinterlands - Aerie Peak; [10.0, 49.3]).",
    Note = "Corrosis is at [3].",
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
KQuestInstanceData[46].Quests.Horde[1] = KQuestInstanceData[46].Quests.Alliance[1]
KQuestInstanceData[46].Quests.Horde[2] = KQuestInstanceData[46].Quests.Alliance[2]
KQuestInstanceData[46].Quests.Horde[3] = KQuestInstanceData[46].Quests.Alliance[3]
KQuestInstanceData[46].Quests.Horde[4] = {
    Title = "4. Hunting Engineer Figgles",
    Level = KQuestInstanceData[46].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[46].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[46].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[46].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[46].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[46].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[46].Quests.Alliance[4].Folgequest,
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
KQuestInstanceData[46].Quests.Horde[5] = {
    Title = "5. Of New and Old IV",
    Level = KQuestInstanceData[46].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[46].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[46].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[46].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[46].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[46].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[46].Quests.Alliance[5].Folgequest,
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
KQuestInstanceData[57] = {
    Story = "Stormwind Vault is an instance dungeon located in Stormwind. The Vault's runes of warding are weakening as the horrors within threaten Azeroth once again, you must venture down and stop these fiends once and for all.",
    Caption = "Stormwind Vault",
    QAA = "4 Quest",
    QAH = "3 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[57].Quests.Alliance[1] = {
    Title = "1. Recovering Vault Shackles",
    Level = "63",
    Attain = "55",
    Aim = "Within the Stormwind Vault, slay Runic Constructs for 2 Runic Shackles, return them to Koli Steamheart.",
    Location = "Koli Steamheart (Stormwind 54,47)",
    Note = "You need to kill the Runic Construct mobs.",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[57].Quests.Alliance[2] = {
    Title = "2. Ending Arc'Tiras",
    Level = "63",
    Attain = "55",
    Aim = "Venture deep within The Stormwind Vault, find Arc'tiras, and slay him for the good of Stormwind. When done, return to Pepin Ainsworth.",
    Location = "Pepin Ainsworth (Stormwind 54,47)",
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
KQuestInstanceData[57].Quests.Alliance[3] = {
    Title = "3. The Enemy Lays",
    Level = "62",
    Attain = "60",
    Aim = "Bring the Core of Arc'Tiras back to Al'Dorel.",
    Location = "Al'Dorel (Winterspring 56,45)",
    Note = "You need to kill the last boss.\\nQuest line start from Enchanted Amethyst drop in Tower of Karazhan [2] boss.\\nReward from the last quest in chain.",
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
KQuestInstanceData[57].Quests.Alliance[4] = {
    Title = "4. The Tome of Arcane Intricacies and Magical Phenomenon IX",
    Level = "63",
    Attain = "58",
    Aim = "Recover the Tome of Arcane Intricacies and Magical Phenomenon IX for Mazen Mac'Nadir in Stormwind.",
    Location = "Mazen Mac'Nadir (Stormwind 42,64)",
    Note = "Near [3] boss.",
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
KQuestInstanceData[57].Quests.Horde[1] = KQuestInstanceData[57].Quests.Alliance[1]
KQuestInstanceData[57].Quests.Horde[2] = KQuestInstanceData[57].Quests.Alliance[2]
KQuestInstanceData[57].Quests.Horde[3] = KQuestInstanceData[57].Quests.Alliance[3]

--------------- INST58 - Ostarius ---------------
KQuestInstanceData[58] = {
    Story = "",
    Caption = "Ostarius",
    QAA = "1 Quest",
    QAH = "1 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[58].Quests.Alliance[1] = {
    Title = "1. Gate Keeper",
    Level = "60",
    Attain = "58",
    Aim = "Defeat Ostarius. Return to the Hall of Explorers and inform High Explorer Magellas about the events that occurred at the gate.",
    Location = "Uldum Pedestal (Tanaris 37,81)",
    Note = "Prequest from High Explorer Magellas (Ironforge - Hall of Explorers 69.9,18.5).You need to kill Ostarius.",
    Prequest = "1.Unusual Partnership -> 2.Original Owner --> 7.Gates of Uldum",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[58].Quests.Horde[1] = {
    Title = "1. Guardian of the Gate",
    Level = KQuestInstanceData[58].Quests.Alliance[1].Level,
    Attain = KQuestInstanceData[58].Quests.Alliance[1].Attain,
    Aim = KQuestInstanceData[58].Quests.Alliance[1].Aim,
    Location = KQuestInstanceData[58].Quests.Alliance[1].Location,
    Note = KQuestInstanceData[58].Quests.Alliance[1].Note,
    Prequest = KQuestInstanceData[58].Quests.Alliance[1].Prequest,
    Folgequest = KQuestInstanceData[58].Quests.Alliance[1].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST61 - Gilneas City ---------------
KQuestInstanceData[61] = {
    Story = "Gilneas City is an instance dungeon located in Gilneas. Located at the heart of this once-isolated land, Gilneas City was once a bastion of hope for its people. Established after breaking free from the rule of the Arathorian lords, it stood as a symbol of resilience and prosperity. However, it is now a mere shell of its former beauty, with a dark presence casting a gripping shadow over Gilneas and serving as a reminder of its once glorious past. Distant howls echo through the city, haunting reminders of its new occupants. Yet, there is a possibility that not everyone is gone and that their accursed king may still live.",
    Caption = "Gilneas City",
    QAA = "10 Quest",
    QAH = "9 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[61].Quests.Alliance[1] = {
    Title = "1. The Judge and the Phantom",
    Level = "46",
    Attain = "35",
    Aim = "Slay Judge Sutherland [3] within Gilneas City for the Angered Phantom at the Glaymore Stead in Gilneas.",
    Location = "Angered Phantom (Gilneas -Glaymore Stead 52.9,27.9)",
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
KQuestInstanceData[61].Quests.Alliance[2] = {
    Title = "2. Behind The Wall",
    Level = "41",
    Attain = "36",
    Aim = "Venture into Gilneas City and recover the Dawnstone Plans for Therum Deepforge in Stormwind.",
    Location = "Therum Deepforge <Expert Blacksmith> (Stormwind - Dwarven District63.3,37, can be walking around there)",
    Note = "the Dawnstone Plans in the building [a] on the box.",
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
KQuestInstanceData[61].Quests.Alliance[3] = {
    Title = "3. The Deed to Ravenshire",
    Level = "45",
    Attain = "38",
    Aim = "Find the Deed to Ravenshire in Gilneas City and bring it back to Caliban Silverlaine.",
    Location = "Baron Caliban Silverlaine (Gilneas - Ravenshire (main building) 58.4,67.8)",
    Note = "the Deed to Ravenshire on the table behind Regent-Lady Celia Harlow and Regent-Lord Mortimer Harlow, next to the Harlow Family Chest[7].",
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
KQuestInstanceData[61].Quests.Alliance[4] = {
    Title = "4. Ravencroft's Ambition",
    Level = "45",
    Attain = "40",
    Aim = "Recover the Book of Ur : Volume Two from the library in Gilneas City and return to Ethan Ravencroft.",
    Location = "Ethan Ravencroft (Gilneas - Hollow Web Cemetery - Crypt(southwest corner of Gilneas, east from the river)33,76)",
    Note = "the Book of Ur in the building [b], go right, on the table (south side).",
    Prequest = "No",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[61].Quests.Alliance[5] = {
    Title = "5. Undoing Draconic Presence",
    Level = "47",
    Attain = "35",
    Aim = "End the Draconic Influence over Gilneas by slaying Regent-Lady Celia Harlow and Regent-Lord Mortimer Harlow [7] for Magus Orelius at Ravenshire in Gilneas.",
    Location = "Magus Orelius <Kirin Tor> (Gilneas - Ravenshire (main building) 57.7,68.5)",
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
KQuestInstanceData[61].Quests.Alliance[6] = {
    Title = "6. The Fall and Rise of Greymane",
    Level = "42",
    Attain = "35",
    Aim = "recover the Greymane Crown for Lord Darius Ravenwood at Ravenshire in Gilneas.",
    Location = "Lord Darius Ravenwood (Gilneas - Ravenshire (main building) 58.4,67.6)",
    Note = "Quest line starts with quest 'Wolf Amongst Sheep' at Baron Caliban Silverlaine (Gilneas - Ravenshire (main building) 58.4,67.8)\\nThe Greymane Crown drops from Genn Greymane [8], last boss on the top of the tower.",
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
KQuestInstanceData[61].Quests.Alliance[7] = {
    Title = "7. Manuscript on Hydromancy II",
    Level = "45",
    Attain = "38",
    Aim = "Recover the Manuscript on Hydromancy II for Magus Hallister at Theramore Isle in Dustwallow Marsh.",
    Location = "Magus Hallister (Dustwallow Marsh - Theramore, central Tower)",
    Note = "(Mage ONLY) Mage Theramore teleport quest.\\nthe Manuscript on Hydromancy II in the building [b], go right, on the dresser (south side).",
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
KQuestInstanceData[61].Quests.Alliance[8] = {
    Title = "8. Left In Bad Faith",
    Level = "44",
    Attain = "40",
    Aim = "Return with the adventurer's necklace to Talvash del Kissel in Ironforge.",
    Location = "Talvash del Kissel (Ironforge - The Mystic Ward; 36,3).",
    Note = "(Jewelcrafter: Goldsmith ONLY) Prequest from Mayva Togview (Ironforge - Hall of Explorers; 60,24). \\nDustivan Blackcowl [4] drops the Tarnished Citrine Choker",
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
KQuestInstanceData[61].Quests.Alliance[9] = {
    Title = "9. Blood of Vorgendor",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Fandral Staghelm. He requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Arch Druid Fandral Staghelm (Darnassus - Cenarion Enclave 35,9).",
    Note = "[Darkpelt Blood] drop from Worgens.\\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II (Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[61].Quests.Alliance[10] = {
    Title = "10. Gilnean Pricolich",
    Level = "60",
    Attain = "60",
    Aim = "Venture to Gilneas City and search for the whereabouts of the second Pricolich.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar 85, 30)",
    Note = "[Celia's Journal] placed near [7].\\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II (Lower Karazhan Halls [5]).",
    Prequest = "Pricolich Gnarlmoon",
    Folgequest = "Pricolich Lycan",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[61].Quests.Horde[1] = KQuestInstanceData[61].Quests.Alliance[1]
KQuestInstanceData[61].Quests.Horde[2] = {
    Title = "2. Ebonmere Affairs",
    Level = KQuestInstanceData[61].Quests.Alliance[2].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[2].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[2].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[2].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[2].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[2].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[2].Folgequest,
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
KQuestInstanceData[61].Quests.Horde[3] = {
    Title = "3. A Royal Heist",
    Level = KQuestInstanceData[61].Quests.Alliance[3].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[3].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[3].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[3].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[3].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[3].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[3].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[61].Quests.Horde[4] = {
    Title = "4. The Evil Made Me Do It",
    Level = KQuestInstanceData[61].Quests.Alliance[4].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[4].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[4].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[4].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[4].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[4].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[4].Folgequest,
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
KQuestInstanceData[61].Quests.Horde[5] = {
    Title = "5. Genn Greymane Must Die!",
    Level = KQuestInstanceData[61].Quests.Alliance[5].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[5].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[5].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[5].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[5].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[5].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[5].Folgequest,
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
KQuestInstanceData[61].Quests.Horde[6] = {
    Title = "6. The Greymane Stone",
    Level = KQuestInstanceData[61].Quests.Alliance[6].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[6].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[6].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[6].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[6].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[6].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[6].Folgequest,
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
KQuestInstanceData[61].Quests.Horde[7] = {
    Title = "7. Foreign Knowledge",
    Level = KQuestInstanceData[61].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[7].Folgequest,
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
KQuestInstanceData[61].Quests.Horde[8] = {
    Title = "8. The Wolf, the Crone and the Scythe",
    Level = KQuestInstanceData[61].Quests.Alliance[8].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[8].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[8].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[8].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[8].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[8].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[8].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[61].Quests.Horde[9] = {
    Title = "9. Gilnean Pricolich",
    Level = KQuestInstanceData[61].Quests.Alliance[9].Level,
    Attain = KQuestInstanceData[61].Quests.Alliance[9].Attain,
    Aim = KQuestInstanceData[61].Quests.Alliance[9].Aim,
    Location = KQuestInstanceData[61].Quests.Alliance[9].Location,
    Note = KQuestInstanceData[61].Quests.Alliance[9].Note,
    Prequest = KQuestInstanceData[61].Quests.Alliance[9].Prequest,
    Folgequest = KQuestInstanceData[61].Quests.Alliance[9].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST62 - Lower Karazhan Halls ---------------
KQuestInstanceData[62] = {
    Story = "",
    Caption = "Lower Karazhan Halls",
    QAA = "18 Quest",
    QAH = "18 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[62].Quests.Alliance[1] = {
    Title = "1. Suitable Accomodations",
    Level = "60",
    Attain = "55",
    Aim = "Find a Comfortable Pillow for Councilman Kyleson in Karazhan.",
    Location = "Councilman Kyleson ([Karazhan - c])",
    Note = "You can find Comfortable Pillow at (b) in the boxes.",
    Prequest = "No",
    Folgequest = "A Drink to Sleep",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[2] = {
    Title = "2. A Drink to Sleep",
    Level = "60",
    Attain = "55",
    Aim = "Speak with someone who may know how to acquire wine for Councilman Kyleson.",
    Location = "Councilman Kyleson ([Karazhan - c])",
    Note = "Turn the quest in to The Cook near [Karazhan - e].",
    Prequest = "Suitable Accomodations",
    Folgequest = "Spectral Wine",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[3] = {
    Title = "3. Spectral Wine",
    Level = "60",
    Attain = "55",
    Aim = "Gather 3 Essence of Undeath, 5 Flask of Port, and a Ghost Mushroom for The Cook in Karazhan.",
    Location = "The Cook near ([Lower Karazhan Halls- e])",
    Note = "Flask of Port sold by alcohol vendors. All items can be bought from Auction House.",
    Prequest = "A Drink to Sleep",
    Folgequest = "Wine for Kyleson",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[4] = {
    Title = "4. Wine for Kyleson",
    Level = "60",
    Attain = "55",
    Aim = " Deliver the Spectral Wine to Councilman Kyleson [Karazhan - c] in Karazhan. ",
    Location = "The Cook near ([Lower Karazhan Halls- e])",
    Note = "",
    Prequest = "Spectral Wine",
    Folgequest = "No",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[5] = {
    Title = "5. The Key to Karazhan I",
    Level = "60",
    Attain = "58",
    Aim = "Listen to the story of Lord Ebonlocke.",
    Location = "Lord Ebonlocke ([Karazhan - d])",
    Note = "",
    Prequest = "No",
    Folgequest = "The Key to Karazhan II",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[6] = {
    Title = "6. The Key to Karazhan II",
    Level = "60",
    Attain = "58",
    Aim = "Kill Moroes [6] and retrieve the Key to the Upper Chambers. Moroes resides in Lower Karazhan Halls. Bring back the key to Lord Ebonlocke.",
    Location = "Lord Ebonlocke ([Karazhan - d])",
    Note = "",
    Prequest = "The Key to Karazhan I",
    Folgequest = "The Key to Karazhan III",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[7] = {
    Title = "7. The Key to Karazhan III",
    Level = "60",
    Attain = "58",
    Aim = "Find someone from the Kirin Tor who might know something about Vandol. Dalaran could be a good place to start your search.",
    Location = "The Cook near ([Lower Karazhan Halls- e])",
    Note = "Turn in the quest to Archmage Ansirem Runeweaver <Kirin Tor> (Alterac Mountains - Dalaran [18.9,78.5])",
    Prequest = "The Key to Karazhan II",
    Folgequest = "The Key to Karazhan IV",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[8] = {
    Title = "8. Scribbled Cooking Notes",
    Level = "60",
    Attain = "55",
    Aim = "Find someone that may be know something about the Scribbled Cooking Notes.",
    Location = "Scribbled Cooking Notes",
    Note = "Turn in the quest to Duke Rothlen [Karazhan - f] on the balkon next to Clawlord Howlfang [4].",
    Prequest = "No",
    Folgequest = "Lost and Found",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[9] = {
    Title = "9. Lost and Found",
    Level = "60",
    Attain = "55",
    Aim = "Recover the Engraved Golden Bracelet for Duke Rothlen in Karazhan.",
    Location = "Duke Rothlen [Karazhan - f].",
    Note = "You can find 'Engraved Golden Bracelet' in the chest at [Karazhan - a].",
    Prequest = "Scribbled Cooking Notes",
    Folgequest = "Rothlen Family Brooch",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[10] = {
    Title = "10. Rothlen Family Brooch",
    Level = "60",
    Attain = "55",
    Aim = "Find someone from the Kirin Tor who might know something about Vandol. Dalaran could be a good place to start your search.",
    Location = "Duke Rothlen (Karazhan; [Karazhan - f])",
    Note = "Rothlen Family Brooch next to [Stratholme] boss The Unforgiven [4] in the chest.",
    Prequest = "Lost and Found",
    Folgequest = "The Secret Recipe",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[11] = {
    Title = "11. The Secret Recipe",
    Level = "60",
    Attain = "55",
    Aim = "Speak with 'The Cook' [near e] in Lower Karazhan Halls.",
    Location = "Duke Rothlen (Karazhan; [Karazhan - f])",
    Note = "",
    Prequest = "Rothlen Family Brooch",
    Folgequest = "The Doorman of Karazhan",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[12] = {
    Title = "12. The Doorman of Karazhan",
    Level = "60",
    Attain = "55",
    Aim = "Speak with Doorman Montigue in Karazhan",
    Location = "The Cook near ([Lower Karazhan Halls- e])",
    Note = "Doorman Montigue at the beginning of the dungeon in front of the stairs.",
    Prequest = "The Secret Recipe",
    Folgequest = "Charge of Karazhan",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[13] = {
    Title = "13. Charge of Karazhan",
    Level = "60",
    Attain = "55",
    Aim = "Bring 10 Essence of Undeath, 10 Living Essence, and 25 Gold to Doorman Montique in Karazhan.",
    Location = "Doorman Montigue at the beginning of the dungeon in front of the stairs.",
    Note = "All can be bought from Auction House. livimg 10-15 silver each, undeath - 1-3 gold each.",
    Prequest = "The Doorman of Karazhan",
    Folgequest = "Le Fishe Au Chocolat",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[14] = {
    Title = "14. Le Fishe Au Chocolat",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Charge of Karazhan to The Cook near[e] in Lower Karazhan Halls.",
    Location = "Doorman Montigue at the beginning of the dungeon in front of the stairs.",
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
KQuestInstanceData[62].Quests.Alliance[15] = {
    Title = "15. Scythe of the Goddess",
    Level = "60",
    Attain = "60",
    Aim = "Slay Clawlord Howlfang [4] and report to Lord Ebonlocke [Karazhan - d].",
    Location = "The Scythe of Elune [5].",
    Note = "Mage, Priest, Warlock, Druid only:\\nQuestline starts with legendary item 'The Scythe of Elune' that drops from Lord Blackwald II [5] (low chance).\\nQuest line for legendary trinket.",
    Prequest = "No",
    Folgequest = "Scythe of the Goddess",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Alliance[16] = {
    Title = "16. Contribution to the Church",
    Level = "60",
    Attain = "55",
    Aim = "Gather 15 Arcane Essence, 20 Illusion Dust, and 10 Greater Eternal Essence for Heirophant Nerseus at the church outside Karazhan.",
    Location = "Heirophant Nerseus (Deadwind Pass, in front of the church next to Karazhan [40.3,77.2]).",
    Note = "15x Arcane Essence - random trash loot;\\n20x Illusion Dust - Enchanters or Auction House;\\n10x Greater Eternal Essence - Enchanters or Auction House;\\nAfter finishing this quest you will be able to get a quest for head/leg enchants. For each of them you will need:\\n 1x Overcharged Ley Energy - random rare item loot from trash/boss in Karazhan;\\n6x Arcane Essence - random trash loot.",
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
KQuestInstanceData[62].Quests.Alliance[17] = {
    Title = "17. Comically Large Candle",
    Level = "61",
    Attain = "60",
    Aim = "Recover the Comically Large Candle from Grizikil and return to Big Whiskers in Upper Karazhan.",
    Location = "Doorman Montigue at the beginning of the dungeon in front of the stairs.",
    Note = "Mage only: Grizikil [3] drops 'Comically Large Candle'.\\nThe quest line starts from Big Whiskers in [Tower of Karazhan].",
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
KQuestInstanceData[62].Quests.Alliance[18] = {
    Title = "18. Blood of Vorgendor",
    Level = "60",
    Attain = "60",
    Aim = "Gather worgen blood for Fandral Staghelm. He requires blood samples from Karazhan, Gilneas City and Shadowfang Keep.",
    Location = "Arch Druid Fandral Staghelm (Darnassus - Cenarion Enclave 35,9).",
    Note = "[Shadowbane Blood] drop from Worgens.\\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II (Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Wolfblood",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Horde[1] = KQuestInstanceData[62].Quests.Alliance[1]
KQuestInstanceData[62].Quests.Horde[2] = KQuestInstanceData[62].Quests.Alliance[2]
KQuestInstanceData[62].Quests.Horde[3] = KQuestInstanceData[62].Quests.Alliance[3]
KQuestInstanceData[62].Quests.Horde[4] = KQuestInstanceData[62].Quests.Alliance[4]
KQuestInstanceData[62].Quests.Horde[5] = KQuestInstanceData[62].Quests.Alliance[5]
KQuestInstanceData[62].Quests.Horde[6] = KQuestInstanceData[62].Quests.Alliance[6]
KQuestInstanceData[62].Quests.Horde[7] = {
    Title = KQuestInstanceData[62].Quests.Alliance[7].Title,
    Level = KQuestInstanceData[62].Quests.Alliance[7].Level,
    Attain = KQuestInstanceData[62].Quests.Alliance[7].Attain,
    Aim = KQuestInstanceData[62].Quests.Alliance[7].Aim,
    Location = KQuestInstanceData[62].Quests.Alliance[7].Location,
    Note = KQuestInstanceData[62].Quests.Alliance[7].Note,
    Prequest = KQuestInstanceData[62].Quests.Alliance[7].Prequest,
    Folgequest = KQuestInstanceData[62].Quests.Alliance[7].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[62].Quests.Horde[8] = KQuestInstanceData[62].Quests.Alliance[8]
KQuestInstanceData[62].Quests.Horde[9] = KQuestInstanceData[62].Quests.Alliance[9]
KQuestInstanceData[62].Quests.Horde[10] = KQuestInstanceData[62].Quests.Alliance[10]
KQuestInstanceData[62].Quests.Horde[11] = KQuestInstanceData[62].Quests.Alliance[11]
KQuestInstanceData[62].Quests.Horde[12] = KQuestInstanceData[62].Quests.Alliance[12]
KQuestInstanceData[62].Quests.Horde[13] = KQuestInstanceData[62].Quests.Alliance[13]
KQuestInstanceData[62].Quests.Horde[14] = KQuestInstanceData[62].Quests.Alliance[14]
KQuestInstanceData[62].Quests.Horde[15] = KQuestInstanceData[62].Quests.Alliance[15]
KQuestInstanceData[62].Quests.Horde[16] = KQuestInstanceData[62].Quests.Alliance[16]
KQuestInstanceData[62].Quests.Horde[17] = KQuestInstanceData[62].Quests.Alliance[17]
KQuestInstanceData[62].Quests.Horde[18] = {
    Title = "18. The Wolf, the Crone and the Scythe",
    Level = KQuestInstanceData[62].Quests.Alliance[18].Level,
    Attain = KQuestInstanceData[62].Quests.Alliance[18].Attain,
    Aim = KQuestInstanceData[62].Quests.Alliance[18].Aim,
    Location = KQuestInstanceData[62].Quests.Alliance[18].Location,
    Note = KQuestInstanceData[62].Quests.Alliance[18].Note,
    Prequest = KQuestInstanceData[62].Quests.Alliance[18].Prequest,
    Folgequest = KQuestInstanceData[62].Quests.Alliance[18].Folgequest,
    Rewards = {
        Text = AQNoReward,
    }
}

--------------- INST63 - Emerald Sanctum ---------------
KQuestInstanceData[63] = {
    Story = "Emerald Sanctum is an instance raid located in Hyjal. A fog of corruption has descended upon the Emerald Dream, twisting the morals and intentions of even the noblest and purest. The corrupted Wakener is preparing to send a premature call of awakening; if not stopped, his kin will arise and go on a frenzied rampage across Azeroth.",
    Caption = "Emerald Sanctum",
    QAA = "3 Quest",
    QAH = "3 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[63].Quests.Alliance[1] = {
    Title = "1. Smoldering Dream Essence",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Smoldering Dream Essence to Arch Druid Dreamwind at Nordanaar in Hyjal.",
    Location = "Smoldering Dream Essence [2]",
    Note = "Druid only: Arch Druid Dreamwind is at (Hyjal - Nordanaar; 85,30). Only one person in the raid can loot this item and the quest can only be done one time.\\n\\nRewards listed are for the followup.",
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
KQuestInstanceData[63].Quests.Alliance[2] = {
    Title = "2. Head of Solnius",
    Level = "60",
    Attain = "58",
    Aim = "Bring the Head of Solnius to Ralathius at Nordanaar in Hyjal.",
    Location = "Head of Solnius [2]",
    Note = "Ralathius is at (Hyjal - Nordanaar; 85,30). Only one person in the raid can loot this item and the quest can only be done one time.",
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
KQuestInstanceData[63].Quests.Alliance[3] = {
    Title = "3. The Claw of Erennius",
    Level = "60",
    Attain = "55",
    Aim = "Bring the Claw of Erennius to one that may find it useful.",
    Location = "Claw of Erennius [1]",
    Note = "Ralathius is at (Hyjal - Nordanaar; 85,30). Only one person in the raid can loot this item and the quest can only be done one time.",
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
KQuestInstanceData[63].Quests.Horde[1] = KQuestInstanceData[63].Quests.Alliance[1]
KQuestInstanceData[63].Quests.Horde[2] = KQuestInstanceData[63].Quests.Alliance[2]
KQuestInstanceData[63].Quests.Horde[3] = KQuestInstanceData[63].Quests.Alliance[3]

--------------- INST64 - Tower of Karazhan ---------------
KQuestInstanceData[64] = {
    Story = "",
    Caption = "Tower of Karazhan",
    QAA = "9 Quest",
    QAH = "9 Quest",
    Quests = {
        Alliance = {},
        Horde = {}
    }
}
KQuestInstanceData[64].Quests.Alliance[1] = {
    Title = "1. The Scepter Rod of Medivh",
    Level = "60",
    Attain = "60",
    Aim = "To restore the Scepter Rod of Medivh, Anelace the Clairvoyant at Morgan's Plot  in Deadwind Pass needs a high amount of arcane energy.",
    Location = "Anelace the Clairvoyant (Deadwind Pass - Morgan's Plot; 41.2,79.2)",
    Note = "Obsidian Rod ?. Cosmic Residue drop from [3].\\nThe Binding of Xanthar prequest start at the Hanvar the Righteous (Deadwind Pass - Morgan's Plot 40.9, 79.3), Wine for Kyleson prequest start at the The Cook (Lower Karazhan Halls [e])",
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
KQuestInstanceData[64].Quests.Alliance[2] = {
    Title = "2. Tirisfal's Vestige",
    Level = "60",
    Attain = "60",
    Aim = "A figment of Medivh is necessary to imbue the Scepter of Medivh with. Bring it to Anelace the Clairvoyant at Morgan's Plot outside Karazhan.",
    Location = "Anelace the Clairvoyant (Deadwind Pass - Morgan's Plot; 41.2,79.2)",
    Note = "Drop from Echo of Medivh [4].\\nKhadgar's Journal [?] start this quest chain.\\nReward from the last quest in quest chain.\\nSanv K'la (Swamp of Sorrows; 25, 30) start The Sanv Charm quest chain.",
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
KQuestInstanceData[64].Quests.Alliance[3] = {
    Title = "3. I Am No Rat",
    Level = "61",
    Attain = "60",
    Aim = "Speak to Doorman Montigue in Lower Karazhan Halls.",
    Location = "Big Whiskers (Tower of Karazhan; 0, 0)",
    Note = "Mage only: Doorman Montigue at Lower Karazhan Halls at the beginning of the dungeon in front of the stairs.",
    Prequest = "No",
    Folgequest = "Comically Large Candle",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[64].Quests.Alliance[4] = {
    Title = "4. A Chef's Majesty",
    Level = "60",
    Attain = "60",
    Aim = "Find The Cook in Lower Karazhan Halls.",
    Location = "Recipes of Kezan (Tower of Karazhan near [1])",
    Note = "The Cook near ([Lower Karazhan Halls - e].\\nA quest to obtain a cooking recipe.",
    Prequest = "No",
    Folgequest = "No Honor Among Chefs",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[64].Quests.Alliance[5] = {
    Title = "5. Cold is the Night",
    Level = "62",
    Attain = "60",
    Aim = "Investigate the mysteries of the Enchanted Amethyst.",
    Location = "Enchanted Amethyst (Tower of Karazhan drop [2] boss)",
    Note = "Quest line continues at Stormwind Vault as [The Enemy Lays] quest.",
    Prequest = "No",
    Folgequest = "Embraced by the Moon",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[64].Quests.Alliance[6] = {
    Title = "6. A Study of Magical Trees",
    Level = "61",
    Attain = "60",
    Aim = "Travel to Dire Maul and seek Lorekeeper Lydros.",
    Location = "of Ancient and Treants (Tower of Karazhan near [] )",
    Note = "Druid only: Lorekeeper Lydros (Dire Maul - West or North; [1] Library)\\nQuest line for [Glyph of the Arcane Treant] at Dire Maul East.",
    Prequest = "No",
    Folgequest = "Wrapping Warpwood",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[64].Quests.Alliance[7] = {
    Title = "7. Scythe of the Goddess",
    Level = "60",
    Attain = "60",
    Aim = "Retrieve a copy of 'Vorgendor: Myths from the Blood Dimension' from Upper Karazhan.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; 85, 30)",
    Note = "Vorgendor: Myths from the Blood Dimension (where?) contains quest item.\\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II (Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess",
    Folgequest = "Scythe of the Goddess",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[64].Quests.Alliance[8] = {
    Title = "8. Pricolich Gnarlmoon",
    Level = "60",
    Attain = "60",
    Aim = "Slay Keeper Gnarlmoon. He can be found in the Upper Chambers of Karazhan.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; 85, 30)",
    Note = "Need to kill Keeper Gnarlmoon [1].\\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II (Lower Karazhan Halls [5]).",
    Prequest = "Scythe of the Goddess --> Wisdom of Ur",
    Folgequest = "Gilnean Pricolich",
    Rewards = {
        Text = AQNoReward,
    }
}
KQuestInstanceData[64].Quests.Alliance[9] = {
    Title = "9. Scythe of the Goddess",
    Level = "60",
    Attain = "60",
    Aim = "Bring 6 Eternal Dreamstone Shards, 20 Mooncloth and Soul of a Dreadlord to Arch Druid Dreamwind.",
    Location = "Arch Druid Dreamwind (Hyjal - Nordanaar; 85, 30)",
    Note = "[Soul of a Dreadlord] drop from Mephistroth [8].\\n[Scythe of the Goddess] prequest start at The Scythe of Elune drop from Lord Blackwood II (Lower Karazhan Halls [5]).\\nMooncloth from Tailoring, Eternal Dreamstone Shard from Enchanting.",
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
KQuestInstanceData[64].Quests.Horde[1] = KQuestInstanceData[64].Quests.Alliance[1]
KQuestInstanceData[64].Quests.Horde[2] = KQuestInstanceData[64].Quests.Alliance[2]
KQuestInstanceData[64].Quests.Horde[3] = KQuestInstanceData[64].Quests.Alliance[3]
KQuestInstanceData[64].Quests.Horde[4] = KQuestInstanceData[64].Quests.Alliance[4]
KQuestInstanceData[64].Quests.Horde[5] = KQuestInstanceData[64].Quests.Alliance[5]
KQuestInstanceData[64].Quests.Horde[6] = KQuestInstanceData[64].Quests.Alliance[6]
KQuestInstanceData[64].Quests.Horde[7] = KQuestInstanceData[64].Quests.Alliance[7]
KQuestInstanceData[64].Quests.Horde[8] = KQuestInstanceData[64].Quests.Alliance[8]
KQuestInstanceData[64].Quests.Horde[9] = KQuestInstanceData[64].Quests.Alliance[9]