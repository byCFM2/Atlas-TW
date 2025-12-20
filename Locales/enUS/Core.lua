---
--- Core.lua - English UI Localization
---
--- Core UI strings, bindings, and general interface text
---
--- @compatible World of Warcraft 1.12
---

-- Zone name substitutions (for display purposes)
AtlasTWSortIgnore = { "the (.+)" }

AtlasTWZoneSubstitutions = {
    ["The Temple of Atal'Hakkar"] = "Sunken Temple"
}

---
--- Key binding definitions for Atlas-TW addon
---
BINDING_HEADER_ATLASTW_TITLE = "Atlas-TW Bindings"
BINDING_NAME_ATLASTW_TOGGLE = "Toggle Atlas-TW"
BINDING_NAME_ATLASTW_OPTIONS = "Toggle Options"
BINDING_HEADER_ATLASTWLOOT_TITLE = "AtlasTW Loot Bindings"
BINDING_NAME_ATLASTWLOOT_QL1 = "QuickLook 1"
BINDING_NAME_ATLASTWLOOT_QL2 = "QuickLook 2"
BINDING_NAME_ATLASTWLOOT_QL3 = "QuickLook 3"
BINDING_NAME_ATLASTWLOOT_QL4 = "QuickLook 4"
BINDING_NAME_ATLASTWLOOT_QL5 = "QuickLook 5"
BINDING_NAME_ATLASTWLOOT_QL6 = "QuickLook 6"
BINDING_NAME_ATLASTWLOOT_WISHLIST = "WishList"

---
--- Register Core UI translations
---
AtlasTW.Localization:RegisterNamespace("UI", "enUS", {
    --************************************************
    -- Common UI Strings
    --************************************************
    ["Options"] = true,
    ["Search"] = true,
    ["Clear"] = true,
    ["Done"] = true,
    ["Yes"] = true,
    ["No"] = true,
    ["All"] = true,
    ["Type"] = true,
    ["Level"] = true,
    ["Player Limit"] = true,
    ["Damage"] = true,
    ["Location"] = true,
    ["Continent"] = true,
    ["Instance"] = true,
    ["Quest"] = true,
    ["Quests"] = true,
    ["Loot"] = true,
    ["Previous"] = true,
    ["Next"] = true,

    --************************************************
    -- Colors
    --************************************************
    ["Purple"] = true,
    ["Red"] = true,
    ["Orange"] = true,
    ["White"] = true,

    --************************************************
    -- Mob Types
    --************************************************
    ["Boss"] = true,
    ["Rare"] = true,
    ["Mini Bosses"] = true,
    ["Trash Mobs"] = true,
    ["Bat"] = true,
    ["Snake"] = true,
    ["Raptor"] = true,
    ["Spider"] = true,
    ["Tiger"] = true,
    ["Panther"] = true,
    ["Pet"] = true,
    ["Rare Mobs"] = true,

    --************************************************
    -- Damage Types
    --************************************************
    ["Fire"] = true,
    ["Nature"] = true,
    ["Frost"] = true,
    ["Shadow"] = true,
    ["Arcane"] = true,
    ["Physical"] = true,

    --************************************************
    -- Directions
    --************************************************
    ["East"] = true,
    ["North"] = true,
    ["South"] = true,
    ["West"] = true,
    ["Lower"] = true,
    ["Upper"] = true,
    ["Front"] = true,
    ["Back"] = true,
    ["Side"] = true,
    ["Outside"] = true,

    --************************************************
    -- Instance Types
    --************************************************
    ["Dungeons"] = true,
    ["Raids"] = true,
    ["RAID"] = true,
    ["Battlegrounds"] = true,
    ["Entrances"] = true,
    ["Transport Routes"] = true,

    --************************************************
    -- Level Ranges
    --************************************************
    ["Instances level 15-29"] = true,
    ["Instances level 30-39"] = true,
    ["Instances level 40-49"] = true,
    ["Instances level 50-59"] = true,
    ["Instances 60 level"] = true,

    --************************************************
    -- Party Size
    --************************************************
    ["Party Size"] = true,
    ["Instances for 5 Players"] = true,
    ["Instances for 10 Players"] = true,
    ["Instances for 20 Players"] = true,
    ["Instances for 40 Players"] = true,

    --************************************************
    -- Continents
    --************************************************
    ["Kalimdor Instances"] = true,
    ["Eastern Kingdoms Instances"] = true,

    --************************************************
    -- Settings
    --************************************************
    ["Select Category"] = true,
    ["Select Map"] = true,
    ["Select Loot Table"] = true,
    ["Show the Quest Panel with AtlasTW"] = true,
    ["Show Quest Panel on the Left"] = true,
    ["Show Quest Panel on the Right"] = true,
    ["Color Quests by Level"] = true,
    ["Color Quests from the Questlog"] = true,
    ["Auto-Query Unknown Items"] = true,
    ["Suppress Server Query Spam"] = true,
    ["Show Loot Panel with AtlasTW"] = true,
    ["Sort Instance by:"] = true,
    ["Show Button on Minimap"] = true,
    ["Auto-Select Instance Map"] = true,
    ["Transparency"] = true,
    ["Right-Click for World Map"] = true,
    ["Show Acronyms"] = true,
    ["Clamp window to screen"] = true,
    ["Show Cursor Coordinates on Map"] = true,
    ["Scale"] = true,
    ["Welcome to Atlas-TW Edition. Please take a moment to set your preferences."] = true,

    --************************************************
    -- Quest Related
    --************************************************
    ["Quest finished:"] = true,
    ["No Quests"] = true,
    ["No Rewards"] = true,
    ["Quest Item"] = true,
    ["Quest Reward"] = true,
    ["This Item Begins a Quest"] = true,
    ["Attain: "] = true,
    ["Level: "] = true,
    ["Requires"] = true,
    ["Tools: "] = true,
    ["Reagents: "] = true,
    ["Starts at: \n"] = true,
    ["Objective: \n"] = true,
    ["Note: \n"] = true,
    ["Prequest: "] = true,
    ["Quest follows: "] = true,
    ["Story"] = true,
    ["Need quest"] = true,

    --************************************************
    -- Search & Results
    --************************************************
    ["Search Unavailable"] = true,
    ["Not Available"] = true,
    ["Search Result: %s"] = true,
    ["Search Result"] = true,
    ["Last Result"] = true,
    ["Search options"] = true,
    ["Partial matching"] = true,
    ["If checked, AtlasTWLoot searches item names for a partial match."] = true,
    ["No match found for"] = true,

    --************************************************
    -- Items & Loot
    --************************************************
    ["This item is not safe!"] = true,
    ["Item not found in cache"] = true,
    ["The content patch isn't out yet"] = true,
    ["Old version of SuperWoW detected..."] = true,
    ["Slot Bag"] = true,
    ["Various Locations"] = true,
    ["Vendor"] = true,
    ["Pickpocketed"] = true,
    ["Random stats"] = true,
    ["<Random enchantment>"] = true,
    ["Shared"] = true,
    ["Unique"] = true,
    ["Charges"] = true,

    --************************************************
    -- AtlasTW Loot
    --************************************************
    ["Loot Panel"] = true,
    ["WishList"] = true,
    ["ALT+Click to clear"] = true,
    ["QuickLook"] = true,
    ["Add to QuickLooks"] = true,
    ["Assign this loot table to QuickLook"] = true,
    ["ALT+Click on item to add or remove it from WishList"] = true,
    [" added to the WishList."] = true,
    [" already in the WishList!"] = true,
    [" deleted from the WishList."] = true,
    [" not found in the WishList."] = true,

    --************************************************
    -- Settings & Configuration
    --************************************************
    ["Button Position"] = true,
    ["Button Radius"] = true,
    ["Reset Position"] = true,
    ["has been reset!"] = true,
    ["Reset Settings"] = true,
    ["Default settings applied!"] = true,
    ["Safe Chat Links |cff1eff00(recommended)|r"] = true,
    ["Enable all Chat Links"] = true,
    ["Default Tooltips"] = true,
    ["Lootlink Tooltips"] = true,
    ["ItemSync Tooltips"] = true,
    ["Use EquipCompare"] = true,
    ["Make Loot Table Opaque"] = true,
    ["Show IDs at all times"] = true,
    ["Suppress Text Spam"] = true,
    ["Show Source on Tooltips"] = true,

    --************************************************
    -- Version & Updates
    --************************************************
    ["Update available"] = true,
    ["Version: %s"] = true,
    ["Version check sent to %s"] = true,
    ["NewVersionAvailableFmt"] = "|cffff0000New version available!|r |cff00ff00Download here:|r %s",
    [" |cffA52A2Aloaded."] = true,
    ["NoticeText"] = "If you find anything missing, please report it at:|r",
    ["NoticeLink"] = "https://github.com/byCFM2/Atlas-TW/issues/|r",
    ["Link"] = "https://github.com/byCFM2/Atlas-TW/|r",

    --************************************************
    -- Categories & Menus
    --************************************************
    ["Collections"] = true,
    ["Factions"] = true,
    ["World Events"] = true,
    ["Crafting"] = true,
    ["Sets"] = true,
    ["Misc"] = true,
    ["Dungeons & Raids"] = true,
    ["Weapon Skills"] = true,
    ["Trainers"] = true,

    --************************************************
    -- Minimap Tooltip
    --************************************************
    ["Left-click to open Atlas-TW.\nMiddle-click for Atlas-TW options.\nRight-click and drag to move this button."] = true,

    --************************************************
    -- Instance Locations
    --************************************************
    ["Instances"] = true,

    --************************************************
    -- Common Terms
    --************************************************
    ["Entrance"] = true,
    ["Exit"] = true,
    ["Portal"] = true,
    ["Teleport"] = true,
    ["Key"] = true,
    ["Ghost"] = true,
    ["Meeting Stone"] = true,
    ["Summon"] = true,
    ["Random"] = true,
    ["Optional"] = true,
    ["Reputation"] = true,
    ["Rescued"] = true,
    ["Unknown"] = true,
    ["Varies"] = true,
    ["Wanders"] = true,
    ["Connection"] = true,
    ["Connections"] = true,
    ["Elevator"] = true,
    ["Attunement Required"] = true,
    ["Chase Begins"] = true,
    ["Chase Ends"] = true,
    ["Open Portal"] = true,
    ["Moonwell"] = true,
    ["through "] = true,
    ["Severs"] = true,

    --************************************************
    -- Crafting & Item Info
    --************************************************
    ["To cast "] = true,
    [" the following items are needed:"] = true,
    [" you need this: "] = true,
    ["To craft "] = true,
    [" the following reagents are needed:"] = true,
    ["Setup"] = true,
    ["Drop Rate:"] = true,
    ["ItemID:"] = true,
    ["SpellID:"] = true,
    ["Gemology Plans"] = true,
    ["Goldsmithing Plans"] = true,
    ["Skill:"] = true,

    --************************************************
    -- Class Sets Categories
    --************************************************
    ["Priest Sets"] = true,
    ["Mage Sets"] = true,
    ["Warlock Sets"] = true,
    ["Rogue Sets"] = true,
    ["Druid Sets"] = true,
    ["Hunter Sets"] = true,
    ["Shaman Sets"] = true,
    ["Paladin Sets"] = true,
    ["Warrior Sets"] = true,

    --************************************************
    -- Item Types & Categories
    --************************************************
    ["Mount"] = true,
    ["a mount"] = true,
    ["Glyph"] = true,
    ["Enchant"] = true,
    ["Trade Goods"] = true,
    ["Book"] = true,
    ["Cloak"] = true,
    ["Weapon"] = true,
    ["Weapons"] = true,
    ["Classes"] = true,
    ["Right Half"] = true,
    ["Left Half"] = true,
    ["Prizes"] = true,
    ["Decks"] = true,
    ["Container"] = true,
    ["Consumable"] = true,
    ["World"] = true,
    ["Used to summon boss"] = true,
    ["Doll"] = true,
    ["Earth"] = true,
    ["Air"] = true,
    ["Master Angler"] = true,
    ["First Prize"] = true,
    ["Rare Fish Rewards"] = true,
    ["Rare Fish"] = true,
    ["a companion"] = true,
    ["Cache"] = true,
    ["Zul'Gurub Rings"] = true,
    ["Pre 60 Sets"] = true,
    ["Crafted Sets"] = true,
    ["Crafted Epic Weapons"] = true,
    ["Tier 0.5"] = true,
    ["Tier 0.5 Summonable"] = true,
    ["PvP Rewards"] = true,
    ["PvP Armor Sets"] = true,
    ["PvP Weapons"] = true,
    ["PvP Accessories"] = true,
    ["Collector's Edition"] = true,
    ["Epic Set"] = true,
    ["Rare Set"] = true,
    ["Legendary Items"] = true,
    ["Artifact Items"] = true,
    ["Fire Resistance Gear"] = true,
    ["Arcane Resistance Gear"] = true,
    ["Nature Resistance Gear"] = true,
    ["Rare Pets"] = true,
    ["Rare Mounts"] = true,
    ["Old Mounts"] = true,
    ["PvP Mounts"] = true,
    ["Tabards"] = true,
    ["World Epics"] = true,
    ["World Enchants"] = true,
    ["World Blues"] = true,
    ["Keys"] = true,
    ["Level One Lunatic Challenge"] = true,
    --************************************************
    -- Events & Holidays
    --************************************************
    ["Children's Week"] = true,
    ["Elemental Invasion"] = true,
    ["Feast of Winter Veil"] = true,
    ["Harvest Festival"] = true,
    ["Love is in the Air"] = true,
    ["Midsummer Fire Festival"] = true,
    ["Noblegarden"] = true,
    ["Scourge Invasion"] = true,
    ["Hallow's End"] = true,
    ["Lunar Festival"] = true,

    --************************************************
    -- Professions & Ranks
    --************************************************
    ["Apprentice"] = true,
    ["Journeyman"] = true,
    ["Expert"] = true,
    ["Artisan"] = true,
    ["Master Axesmith"] = true,
    ["Master Hammersmith"] = true,
    ["Master Swordsmith"] = true,
    ["Gnomish Engineering"] = true,
    ["Goblin Engineering"] = true,
    ["Rank"] = true,
    ["Engineer"] = true,

    --************************************************
    -- Equipment Slots & Types
    --************************************************
    ["Head"] = true,
    ["Neck"] = true,
    ["Shoulder"] = true,
    ["Chest"] = true,
    ["Shirt"] = true,
    ["Tabard"] = true,
    ["Wrist"] = true,
    ["Hands"] = true,
    ["Waist"] = true,
    ["Legs"] = true,
    ["Feet"] = true,
    ["Ring"] = true,
    ["Finger"] = true,
    ["BackEquip"] = "Back",
    ["Trinket"] = true,
    ["Held In Off-hand"] = true,
    ["Relic"] = true,
    ["Relics"] = true,
    ["One-Hand"] = true,
    ["Two-Hand"] = true,
    ["Main Hand"] = true,
    ["Off Hand"] = true,
    ["Ranged"] = true,
    ["Axe"] = true,
    ["Bow"] = true,
    ["Crossbow"] = true,
    ["Dagger"] = true,
    ["Gun"] = true,
    ["Mace"] = true,
    ["Polearm"] = true,
    ["Shield"] = true,
    ["Staff"] = true,
    ["Sword"] = true,
    ["Thrown"] = true,
    ["Wand"] = true,
    ["Fist Weapon"] = true,
    ["Idol"] = true,
    ["Totem"] = true,
    ["Libram"] = true,
    ["Arrow"] = true,
    ["Bullet"] = true,
    ["Quiver"] = true,
    ["Ammo Pouch"] = true,
    ["Bag"] = true,
    ["Potion"] = true,
    ["Reagent"] = true,
    ["Darkmoon Faire Card"] = true,
    ["Fishing Pole"] = true,
    ["Gemstones"] = true,
    ["Token of Blood Rewards"] = true,
    ["Cooking Fire"] = true,
    ["Anvil"] = true,
    ["Black Anvil"] = true,
    ["Forge"] = true,
    ["Black Forge"] = true,
    ["Smokywood Pastures Special Gift"] = true,
    ["Smokywood Pastures"] = true,
    ["Projectile"] = true,
    ["One-Handed Swords"] = true,
    ["One-Handed Axes"] = true,
    ["One-Handed Maces"] = true,
    ["Two-Handed Swords"] = true,
    ["Two-Handed Axes"] = true,
    ["Two-Handed Maces"] = true,
    ["Daggers"] = true,
    ["Fist Weapons"] = true,
    ["Polearms"] = true,
    ["Staves"] = true,
    ["Bows"] = true,
    ["Crossbows"] = true,
    ["Guns"] = true,
    ["Shields"] = true,
    ["Wands"] = true,
    ["Rings"] = true,
    ["Gloves"] = true,
    ["Boots"] = true,
    ["2H Weapon"] = true,
    ["Flasks"] = true,
    ["Protection Potions"] = true,
    ["Healing and Mana Potions"] = true,
    ["Transmutes"] = true,
    ["Transmogrification"] = true,
    ["Defensive Potions and Elixirs"] = true,
    ["Offensive Potions and Elixirs"] = true,
    ["Miscellaneous"] = true,
    ["Helm"] = true,
    ["Shoulders"] = true,
    ["Bracers"] = true,
    ["Belt"] = true,
    ["Pants"] = true,
    ["Bags"] = true,
    ["Axes"] = true,
    ["Swords"] = true,
    ["Maces"] = true,
    ["Fist"] = true,
    ["Belt Buckles"] = true,
    ["Equipment"] = true,
    ["Trinkets"] = true,
    ["Explosives"] = true,
    ["Parts"] = true,
    ["Amulets"] = true,
    ["Scales"] = true,
    ["Special"] = true,

    --************************************************
    -- Set Categories
    --************************************************
    ["Tier 0/0.5 Sets"] = true,
    ["Zul'Gurub Sets"] = true,
    ["Zul'Gurub Enchants"] = true,
    ["Ruins of Ahn'Qiraj Sets"] = true,
    ["Temple of Ahn'Qiraj Sets"] = true,
    ["Tier 1 Sets"] = true,
    ["Tier 2 Sets"] = true,
    ["Tier 3 Sets"] = true,
})
