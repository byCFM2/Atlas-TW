


local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}


AtlasTW.InstanceData.HateforgeQuarry = {
    Name = BZ["Hateforge Quarry"],
    Location = BZ["Burning Steppes"],
    Level = { 48, 60 },
    Acronym = "HQ",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) " .. L["Entrance"] }
},
    Bosses = {
        {
            id = "HQHighForemanBargulBlackhammer",
            prefix = "1)",
            name = BB["High Foreman Bargul Blackhammer"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 60566 }, -- Visor of Command
                { id = 60569 }, -- Taskmaster's Tag
                { id = 60567 }, -- Blackhammer Pauldrons
                { id = 60568 }, -- Incendosaur Skin Boots
                { id = 60570, dropRate = 15 }, -- Dark Iron Hooked Net
                { id = 60565 }, -- Hateforged Cleaver
                {},
                { id = 60775, disc = L["Book"], dropRate = 15 }, -- Manual: Intervene
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 41460, dropRate = 100 }, -- Fingerbreaker
                { id = 61462, dropRate = 100, container = { 61465 } }, -- Hammer of Hate
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                {},
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
}
},
        {
            id = "HQEngineerFiggles",
            prefix = "2)",
            name = BB["Engineer Figgles"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 60540 }, -- The Creator's Goggles
                { id = 60542 }, -- Figgle's Coveralls
                { id = 60541 }, -- Electroconductive Mitts
                { id = 60543 }, -- Wrench of Creation
                { id = 60545 }, -- Techrifle X-TREME 5200
                {},
                { id = 60539, dropRate = 15 }, -- Decoy Dragonling Remote
                {},
                { id = 13325, dropRate = .025 }, -- Fluorescent Green Mechanostrider
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
}
},
        {
            prefix = "a)",
            name = L["Hateforge Chemistry Documents"],
            color = "|cff9d9d9d",
},
        {
            id = "HQCorrosis",
            prefix = "3)",
            name = BB["Corrosis"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 80672 }, -- Venomsight Mask
                { id = 80673 }, -- Murkwater Leggings
                { id = 80670 }, -- Sludge-drenched Sabatons
                { id = 80671 }, -- Toxic Ripper
                {},
                { id = 41003, dropRate = 100, container = { 40080 } }, -- Essence of Corrosis
                { id = 80674 }, -- Corrosive Core
}
},
        {
            id = "HQHatereaverAnnihilator",
            prefix = "4)",
            name = BB["Hatereaver Annihilator"],
            defaults = { dropRate = 20 },
            loot = {
                { id = 60562 }, -- Ragereaver's Helm
                { id = 60564 }, -- Empowered Power Core
                { id = 60563 }, -- Blackstone Stompers
                { id = 60561 }, -- Flameforged Lugnut
                { id = 60559 }, -- Hatereaver Cog
                {},
                { id = 60560, dropRate = 15 }, -- Steamrigged Servohammer
                {},
                { id = 70226, disc = L["Quest Item"], dropRate = 1 }, -- Ancient Warfare Text
                { id = 51217, disc = L["Transmogrification"], dropRate = 5 }, -- Fashion Coin
}
},
        {
            id = "HQHargeshDoomcaller",
            prefix = "5)",
            name = BB["Har'gesh Doomcaller"],
            defaults = { dropRate = 25 },
            loot = {
                { id = 51045 }, -- Toxic Talisman
                { id = 51047 }, -- Sacrosanct Epaulets
                { id = 51048 }, -- The Veil of Hatred
                { id = 51046 }, -- Call of Shadow
                {},
                { id = 60549, dropRate = 20 }, -- Shawl of End Times
                { id = 60548, dropRate = 20 }, -- Cuffs of Dawnfall
                { id = 60550, dropRate = 20 }, -- Shadowruned Girdle
                { id = 60547, dropRate = 20 }, -- Band of Calamity
                { id = 60546, dropRate = 20 }, -- Doomcaller Staff
                {},
                { id = 60551, dropRate = 1.2 }, -- Pendant of the Faceless
                {},
                { id = 41985, dropRate = 100, container = { 41986 } }, -- Crest of Valor
                { id = 70226, disc = L["Quest Item"], dropRate = 3, container = { 70227, 70228, 70229, 70230, 70231, 70232, 70233, -- Ancient Warfare Text
                    70234, 70235, 70236, 70238 } },
                { id = 51217, disc = L["Transmogrification"], dropRate = 100 }, -- Fashion Coin
}
},
        {
            id = "HQTrash",
            name = L["Trash Mobs"].."-"..BZ["Hateforge Quarry"],
            defaults = { dropRate = .005 },
            loot = {
                { id = 84010, container = { 60576 } }, -- Plans: Hateforge Belt
                { id = 84011, container = { 60578 } }, -- Plans: Hateforge Boots
                { id = 84012, container = { 60577 } }, -- Plans: Hateforge Grips
                { id = 84013, container = { 60574 } }, -- Plans: Hateforge Cuirass
                { id = 84014, container = { 60573 } }, -- Plans: Hateforge Helmet
                { id = 84015, container = { 60575 } }, -- Plans: Hateforge Leggings
                {},
                { id = 60616 }, -- Shadowcaller Axe
                { id = 60582 }, -- Incendosaur Skin Gloves
                { id = 60572, disc = L["Outside"], dropRate = .1 }, -- Incendosaur Skin Pauldrons
                { id = 60612, dropRate = .0025 }, -- Mixologist Goggles
}
},
        { name = BIS["Incendosaur Skin Armor"], items = "IncendosaurSkinArmor" },
}
}

-- Initialize items for all bosses
for _, bossData in ipairs(AtlasTW.InstanceData.HateforgeQuarry.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Clear temporary data
end
