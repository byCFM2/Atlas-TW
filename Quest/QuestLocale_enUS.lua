---------------
--- COLOURS ---
---------------
local grey = KQuestConfig.Colors.grey
local red = KQuestConfig.Colors.red
local white = KQuestConfig.Colors.white
local green = KQuestConfig.Colors.green
local blue = KQuestConfig.Colors.blue
local yellow = KQuestConfig.Colors.yellow

---------------
--- OPTIONS ---
---------------
AQHelpText = "type /aq or atlasquest "..white.."[command]"..yellow.."\ncommands: help; option/config; show/hide; left/right; colour; autoshow"..red.."(only Atlas)"
AQOptionsCaptionTEXT = "AtlasQuest Options"
AQ_OK = "Done"
AQ_Quests = "Quests"
AQNotAvailable = "Not Available"
AQQuestFinished = "- Quest finished"
-- Autoshow
KQAutoshowOptionLocal = "Show AtlasQuest panel with Atlas.";
AQAtlasAutoON = "The AtlasQuest panel will be automatically displayed when atlas is opened."..green.."(default)"
AQAtlasAutoOFF = "The AtlasQuest panel "..red.."will not"..white.." be displayed when you open atlas."
-- Right/Left
KQLEFTOptionLocal = "Show the AtlasQuest panel "..red.."left."
KQRIGHTOptionLocal = "Show the AtlasQuest panel "..red.."right."
-- Colour Check
KQColourOptionLocal = "Recolour the quests depending on their levels."
AQCCON = "AtlasQuest will now recolour quests depending on their levels."
AQCCOFF = "AtlasQuest will not recolour quests."
-- QuestLog Colour Check
KQCheckQuestlogLocal = "Colours all quest, you have in your Questlog "..blue.."blue."
-- AutoQuery Quest Rewards
KQAutoQueryLocal = "Automatically query the server for items you haven't seen."
-- Suppress Server Query text
KQQuerySpamLocal = "Suppress Server Query spam."
-- Use Comparison Tooltips
KQCompareTooltipLocal = "Compare rewards to currently equipped items (need /rl)."

AQAbilities = blue .. "Abilities:" .. white
AQSERVERASKInformation = " Please click right until you see the Item frame."
AQSERVERASKAuto = " Try moving the cursor over the item in a second."
AQSERVERASK = "AtlasQuest is querying the server for: "
AQERRORNOTSHOWN = "This item is not safe!"
AQERRORASKSERVER = "You can right-click to attempt to query the server. You may be disconnected."
AQOptionB = "Options"
AQStoryB = "Story"
AQNoReward = ""..blue.." No Rewards"
AQDiscription_OR = ""..grey.." or "..white..""
AQDiscription_AND = ""..grey.." and "..white..""
AQDiscription_REWARD = ""..blue.." Reward: "
AQDiscription_ATTAIN = "Attain: "
AQDiscription_LEVEL = "Level: "
AQDiscription_START = "Starts at: \n"
AQDiscription_AIM = "Objective: \n"
AQDiscription_NOTE = "Note: \n"
AQDiscription_PREQUEST= "Prequest: "
AQDiscription_FOLGEQUEST = "Quest follows: "

------------------
--- ITEM TYPES ---
------------------
AQITEM_DAGGER = " Dagger"
AQITEM_POLEARM = "Polearm"
AQITEM_SWORD = " Sword"
AQITEM_AXE = " Axe"
AQITEM_FIST = " Fist Weapon"
AQITEM_WAND = "Wand"
AQITEM_STAFF = "Staff"
AQITEM_MACE = " Mace"
AQITEM_SHIELD = "Shield"
AQITEM_GUN = "Gun"
AQITEM_BOW = "Bow"
AQITEM_CROSSBOW = "Crossbow"
AQITEM_THROWN = "Thrown"
AQITEM_HELDOFFHAND = "Held In Off-hand"

AQITEM_WAIST = "Waist,"
AQITEM_SHOULDER = "Shoulder,"
AQITEM_CHEST = "Chest,"
AQITEM_LEGS = "Legs,"
AQITEM_HANDS = "Hands,"
AQITEM_FEET = "Feet,"
AQITEM_WRIST = "Wrist,"
AQITEM_HEAD = "Head,"
AQITEM_BACK = "Back"
AQITEM_TABARD = "Tabard"

AQITEM_CLOTH = " Cloth"
AQITEM_LEATHER = " Leather"
AQITEM_MAIL = " Mail"
AQITEM_PLATE = " Plate"

AQITEM_OFFHAND = "Off Hand,"
AQITEM_MAINHAND = "Main Hand,"
AQITEM_ONEHAND = "One-Hand,"
AQITEM_TWOHAND = "Two-Hand,"

AQITEM_ITEM = "Item"
AQITEM_TRINKET = "Trinket"
AQITEM_RELIC = "Relic"
AQITEM_POTION = "Potion"
AQITEM_NECK = "Neck"
AQITEM_PATTERN = "Pattern"
AQITEM_BAG = "Bag"
AQITEM_RING = "Ring"
AQITEM_KEY = "Key"
AQITEM_QUIVER = "Quiver"
AQITEM_AMMOPOUCH = "Ammo Pouch"
AQITEM_ENCHANT = "Enchant"