


local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

local lKarazhanShare = {
    { id = 61739, dropRate = 1.3 }, -- Formula: Enchant Boots - Vampirism
    { id = 61219, dropRate = 0.9 }, -- Formula: Enchant Boots - Superior Stamina
    { id = 61180, dropRate = 1.2 }, -- Formula: Enchant Cloak - Greater Arcane Resistance
    { id = 70001, dropRate = 0.9 }, -- Formula: Enchant Gloves - Arcane Power
    {},
    { id = 8547, dropRate = 1.2, container = { 8546 } }, -- Formula: Powerful Smelling Salts
    {},
    { id = 61178, dropRate = 1.2, container = { 61182 } }, -- Plans: Thorium Spurs
    { id = 61189, dropRate = 0.9, container = { 61185 } }, -- Plans: Dawnstone Hammer
    { id = 61177, dropRate = 1.2, container = { 61181 } }, -- Recipe: Potion of Quickness
    { id = 13517, dropRate = 0.9, container = { 13503 } }, -- Recipe: Alchemist's Stone
    { id = 61190, dropRate = 0.9, container = { 61186 } }, -- Pattern: Gloves of Unwinding Mystery
    { id = 70102, dropRate = 0.9, container = { 56031 } }, -- Plans: Encrusted Gemstone Ring
    { id = 61192, dropRate = 1.3, container = { 61188 } }, -- Pattern: Inscribed Runic Bracers
    { id = 61191, dropRate = 0.9, container = { 61187 } }, -- Schematic: Intricate Gyroscope Goggles
}


AtlasTW.InstanceData.LowerKarazhan = {
    Name = BZ["Lower Karazhan Halls"],
    Location = BZ["Deadwind Pass"],
    Level = { 58, 60 },
    Acronym = "LKH",
    MaxPlayers = 10,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] },
        { letter = "B) " .. L["Connection"] }
},
    Bosses = {
        {
            id = "LKHRolfen",
            prefix = "1)",
            name = BB["Master Blacksmith Rolfen"],
            defaults = { dropRate = 1.44 },
            loot = {
                { id = 61805, container = { 60010 } }, -- Plans: Towerforge Demolisher
                { id = 61806, container = { 60009 } }, -- Plans: Towerforge Pauldrons
                { id = 61807, container = { 60008 } }, -- Plans: Towerforge Breastplate
                { id = 61808, container = { 60007 } }, -- Plans: Towerforge Crown
}
},
        {
            prefix = "a)",
            name = L["Engraved Golden Bracelet"],
            color = "|cff9d9d9d",
},
        {
            prefix = "b)",
            name = L["Comfortable Pillow"],
            color = "|cff9d9d9d",
},
        {
            id = "LKHBroodQueenAraxxna",
            prefix = "2)",
            name = BB["Brood Queen Araxxna"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 61297, dropRate = 20 }, -- Marshtreader Slippers
                { id = 61260, dropRate = 20 }, -- Flamescorched Hood
                { id = 61268, dropRate = 20 }, -- Sigil of the Brood
                { id = 61243, dropRate = 20 }, -- Vial of Potent Venoms
                { id = 61270, dropRate = 20 }, -- Pendant of Shadra's Chosen
                {},
                { id = 61269 }, -- Clutchweave Robe
                { id = 61245 }, -- Bracers of Brambled Vines
                { id = 61283 }, -- Darkgrasp Gloves
                { id = 61272 }, -- Deepstone Boots
                { id = 61244 }, -- Leggings of Shrouding Winds
                { id = 61278 }, -- Vampiric Kris
                { id = 61816 }, -- Araxxna's Husk
                {},
                { id = 58275, dropRate = 100 }, -- Handbook of Noxious Assault IV
                {},
                { id = 37011, dropRate = 20 }, -- Araxxna's Hatchling
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(lKarazhanShare),
}
},
        {
            id = "LKHGrizikil",
            prefix = "3)",
            name = BB["Grizikil"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 61291, dropRate = 20 }, -- Darkflame Helm
                { id = 61253, dropRate = 20 }, -- Aetherforged Gauntlets
                { id = 61276, dropRate = 20 }, -- Hyperchromatic Deflector
                { id = 61292, dropRate = 20 }, -- Totem of Crackling Thunder
                { id = 61251, dropRate = 20 }, -- Medivh's Foresight
                {},
                { id = 61252 }, -- Red Hat of Destruction
                { id = 61261 }, -- Battlescarred Cloak
                { id = 61267 }, -- Sparkgrasp Gloves
                { id = 61288 }, -- Nightwoven Belt
                { id = 61289 }, -- Aurious Boots
                { id = 61298 }, -- Overgrown Gloves
                { id = 61450 }, -- The Mind's Key
                {},
                { id = 41392, dropRate = 100 }, -- Comically Large Candle
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(lKarazhanShare),
}
},
        {
            prefix = "c)",
            name = L["Councilman Kyleson"],
            color = "|cff9d9d9d",
},
        {
            id = "LKHClawlordHowlfang",
            prefix = "4)",
            name = BB["Clawlord Howlfang"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 61281, dropRate = 20 }, -- Shadeweave Boots
                { id = 61273, dropRate = 20 }, -- Earthbreaker Belt
                { id = 61249, dropRate = 20 }, -- Pelt of the Great Howler
                { id = 61293, dropRate = 20 }, -- Idol of the Moonfang
                { id = 61248, dropRate = 20 }, -- Beasthunter's Blunderbuss
                {},
                { id = 61250 }, -- Reedwoven Tunic
                { id = 61285 }, -- Duskwrapped Leggings
                { id = 61271 }, -- Boots of Blazing Steps
                { id = 61274 }, -- Pulverizer Gauntlets
                { id = 61290 }, -- Zephyrian Girdle
                { id = 61263 }, -- Tooth of the Packlord
                { id = 61451 }, -- Sliver of Hope
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(lKarazhanShare),
}
},
        {
            id = "LKHLordBlackwaldII",
            prefix = "5)",
            name = BB["Lord Blackwald II"],
            defaults = { dropRate = 14 },
            loot = {
                { id = 61266, dropRate = 20 }, -- Rune Infused Gauntlets
                { id = 61246, dropRate = 20 }, -- Sabatons of the Endless March
                { id = 61262, dropRate = 20 }, -- Royal Signet of Blackwald II
                { id = 61247, dropRate = 20 }, -- Shadowbringer
                { id = 61443, dropRate = 20 }, -- Libram of the Faithful
                {},
                { id = 61184, dropRate = 0.85, disc = L["Legendary"] }, -- The Scythe of Elune
                {},
                { id = 61282 }, -- Deepshadow Bracers
                { id = 61449 }, -- Searhide Bracers
                { id = 61279 }, -- Slateplate Leggings
                { id = 61287 }, -- Gusthewn Chestplate
                { id = 61294 }, -- Dark Rider's Signet
                { id = 61255 }, -- Tuning Fork of Charged Lightning
                { id = 61286 }, -- Bloodfang Effigy
                {},
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(lKarazhanShare),
}
},
        {
            prefix = "d)",
            name = L["Lord Ebonlocke"],
            color = "|cff9d9d9d",
},
        {
            prefix = "e)",
            name = L["Obsidian Rod"],
            color = "|cff9d9d9d",
},
        {
            prefix = "f)",
            name = L["Duke Rothlen"],
            color = "|cff9d9d9d",
},
        {
            id = "LKHMoroes",
            prefix = "6)",
            name = BB["Moroes"],
            defaults = { dropRate = 10 },
            loot = {
                { id = 61284, dropRate = 10 }, -- Vest of Encroaching Darkness
                { id = 61256, dropRate = 10 }, -- Leggings of the Misty Marsh
                { id = 61265, dropRate = 10 }, -- Leggings of the Inferno
                { id = 61257, dropRate = 10 }, -- Cloudplate Wristguards
                { id = 61275, dropRate = 10 }, -- Breastplate of Earthen Might
                {},
                { id = 61674, dropRate = 70, disc = L["Reagent"] }, -- Overcharged Ley Energy
                {},
                { id = 61277, dropRate = 10 }, -- Fist of the Forgotten Order
                { id = 61264, dropRate = 10 }, -- Ansirem's Runeweaver
                { id = 61299, dropRate = 10 }, -- Shawl of the Castellan
                { id = 61454, dropRate = 10 }, -- Rod of Resuscitation
                { id = 61453, dropRate = 10 }, -- Anasterian's Legacy
                {},
                { id = 61231, dropRate = 100 }, -- Key to the Upper Chambers
                { id = 41987, container = { 41986 }, dropRate = 100 }, -- Crest of Heroism
                unpack(lKarazhanShare),
}
},
        {
            id = "LKHTrash",
            name = L["Trash Mobs"].."-"..BZ["Lower Karazhan Halls"],
            defaults = { dropRate = .15 },
            loot = {
                { id = 51326, dropRate = .3, container = { 61666 } }, -- Scribbled Cooking Notes
                {},
                { id = 61254 }, -- Reedmesh Belt
                { id = 61288 }, -- Nightwoven Belt
                { id = 61280 }, -- Granitized Bracers
                { id = 61290 }, -- Zephyrian Girdle
                {},
                { id = 61295 }, -- Dawnstone Bludgeon
                { id = 61452 }, -- Skycleaver
                {},
                { id = 92002, dropRate = .32, disc = L["Book"]..", "..BF["Alliance"] }, -- Tome of Portals: Theramore
                { id = 92004, dropRate = .32, disc = L["Book"]..", "..BF["Horde"] }, -- Tome of Portals: Stonard
                {},
                { id = 37006 }, -- Skitterweb Hatchling
                {},
                { id = 8547, dropRate = .03, container = { 8546 } }, -- Formula: Powerful Smelling Salts
                { id = 61177, dropRate = .03, container = { 61181 } }, -- Recipe: Potion of Quickness
                { id = 61178, dropRate = .03, container = { 61182 } }, -- Plans: Thorium Spurs
                { id = 61180, dropRate = .03 }, -- Formula: Enchant Cloak - Greater Arcane Resistance
}
},
        {
            id = "LKHEnchants",
            name = L["Lower Karazhan Halls Enchants"],
            defaults = { dropRate = 0 },
            loot = {
                { id = 92005, disc = L["Head"]..", "..L["Legs"]..L["Enchant"] }, -- Invocation of Shattering
                { id = 92006, disc = L["Head"]..", "..L["Legs"]..L["Enchant"] }, -- Invocation of Greater Protection
                { id = 92007, disc = L["Head"]..", "..L["Legs"]..L["Enchant"] }, -- Invocation of Expansive Mind
                { id = 92008, disc = L["Head"]..", "..L["Legs"]..L["Enchant"] }, -- Invocation of Greater Arcane Fortitude
}
}
}
}

for _, bossData in ipairs(AtlasTW.InstanceData.LowerKarazhan.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil 
end
