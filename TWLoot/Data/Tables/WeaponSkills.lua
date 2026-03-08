---
--- WeaponSkills.lua - Weapon trainer and skill data
---
--- This module contains data for weapon skills available to each class
--- and the trainers that teach them.
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

local L = AtlasTW.Localization.UI
local LF = AtlasTW.Localization.Factions
local LZ = AtlasTW.Localization.Zones
local LC = AtlasTW.Localization.Classes
local LB = AtlasTW.Localization.Bosses

local colors = AtlasTW.Colors

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

local WeaponIcons = {
    [L["One-Handed Axes"]] = "INV_ThrowingAxe_01",
    [L["Two-Handed Axes"]] = "INV_ThrowingAxe_06",
    [L["Bows"]] = "INV_Weapon_Bow_02",
    [L["Guns"]] = "INV_Weapon_Rifle_07",
    [L["One-Handed Maces"]] = "INV_Hammer_15",
    [L["Two-Handed Maces"]] = "INV_Hammer_17",
    [L["Polearms"]] = "INV_Spear_05",
    [L["Staves"]] = "INV_Staff_29",
    [L["One-Handed Swords"]] = "INV_Sword_05",
    [L["Two-Handed Swords"]] = "INV_Sword_23",
    [L["Daggers"]] = "INV_Sword_33",
    [L["Fist Weapons"]] = "INV_Gauntlets_04",
    [L["Crossbows"]] = "INV_Weapon_Crossbow_02",
    [L["Wands"]] = "INV_Wand_05",
    [L["Thrown"]] = "INV_ThrowingKnife_01"
}

-- Trainers Data
-- Faction: 1=Alliance, 2=Horde
local Trainers = {
    { name = LB["Woo Ping"],        loc = LF["Stormwind"],   faction = 1, skills = { L["Crossbows"], L["Daggers"], L["One-Handed Swords"], L["Staves"], L["Two-Handed Swords"], L["Polearms"] } },
    { name = LB["Bixi Wobblebonk"], loc = LZ["Ironforge"],   faction = 1, skills = { L["Crossbows"], L["Daggers"], L["Thrown"] } },
    { name = LB["Buliwyf Stonehand"], loc = LZ["Ironforge"], faction = 1, skills = { L["Fist Weapons"], L["Guns"], L["One-Handed Axes"], L["Two-Handed Axes"], L["One-Handed Maces"], L["Two-Handed Maces"] } },
    { name = LB["Ilyenia Moonfire"], loc = LZ["Darnassus"],  faction = 1, skills = { L["Bows"], L["Daggers"], L["Fist Weapons"], L["Staves"], L["Thrown"] } },

    { name = LB["Hanashi"],         loc = LZ["Orgrimmar"],   faction = 2, skills = { L["Bows"], L["One-Handed Axes"], L["Staves"], L["Thrown"], L["Two-Handed Axes"] } },
    { name = LB["Sayoc"],           loc = LZ["Orgrimmar"],   faction = 2, skills = { L["Bows"], L["Daggers"], L["Fist Weapons"], L["One-Handed Axes"], L["Staves"], L["Thrown"], L["Two-Handed Axes"] } },
    { name = LB["Archibald"],       loc = LZ["Undercity"],   faction = 2, skills = { L["Crossbows"], L["Daggers"], L["One-Handed Swords"], L["Two-Handed Swords"], L["Polearms"] } },
    { name = LB["Ansekhwa"],        loc = LZ["Thunder Bluff"], faction = 2, skills = { L["Guns"], L["One-Handed Maces"], L["Staves"], L["Two-Handed Maces"] } }
}

local Classes = {
    ["Warrior"] = { L["One-Handed Axes"], L["Two-Handed Axes"], L["One-Handed Swords"], L["Two-Handed Swords"], L["One-Handed Maces"], L["Two-Handed Maces"], L["Daggers"], L["Polearms"], L["Staves"], L["Fist Weapons"], L["Bows"], L["Crossbows"], L["Guns"], L["Thrown"] },
    ["Paladin"] = { L["One-Handed Axes"], L["Two-Handed Axes"], L["One-Handed Swords"], L["Two-Handed Swords"], L["One-Handed Maces"], L["Two-Handed Maces"], L["Polearms"] },
    ["Hunter"] = { L["One-Handed Axes"], L["Two-Handed Axes"], L["One-Handed Swords"], L["Two-Handed Swords"], L["Daggers"], L["Polearms"], L["Staves"], L["Fist Weapons"], L["Bows"], L["Crossbows"], L["Guns"], L["Thrown"] },
    ["Rogue"] = { L["One-Handed Axes"], L["One-Handed Swords"], L["One-Handed Maces"], L["Daggers"], L["Fist Weapons"], L["Bows"], L["Crossbows"], L["Guns"], L["Thrown"] },
    ["Priest"] = { L["One-Handed Maces"], L["Daggers"], L["Staves"] },
    ["Shaman"] = { L["One-Handed Axes"], L["Two-Handed Axes"], L["One-Handed Maces"], L["Two-Handed Maces"], L["Daggers"], L["Staves"], L["Fist Weapons"] },
    ["Mage"] = { L["One-Handed Swords"], L["Daggers"], L["Staves"] },
    ["Warlock"] = { L["One-Handed Swords"], L["Daggers"], L["Staves"] },
    ["Druid"] = { L["One-Handed Maces"], L["Two-Handed Maces"], L["Daggers"], L["Staves"], L["Fist Weapons"] }
}

-- Generate Data Tables
for class, skills in pairs(Classes) do
    local pageName = "WeaponSkills_" .. class
    AtlasTWLoot_Data[pageName] = {}

    local allianceEntries = {}
    local hordeEntries = {}

    -- Handle faction restrictions
    local isShaman = (class == "Shaman")
    local isPaladin = (class == "Paladin")

    for _, trainer in ipairs(Trainers) do
        local faction = trainer.faction
        if (faction == 1 and not isShaman) or (faction == 2 and not isPaladin) then
            local entries = (faction == 1) and allianceEntries or hordeEntries
            local color = (faction == 1) and colors.BLUE or colors.RED

            for _, tSkill in ipairs(trainer.skills) do
                local canLearn = false
                for _, classSkill in ipairs(skills) do
                    if classSkill == tSkill then
                        canLearn = true
                        break
                    end
                end

                if canLearn then
                    table.insert(entries, {
                        name = color .. trainer.name .. "|r",
                        icon = WeaponIcons[tSkill],
                        extra = tSkill .. ", " .. trainer.loc,
                    })
                end
            end
        end
    end

    -- Add Alliance Header and Entries
    if table.getn(allianceEntries) > 0 then
        table.insert(AtlasTWLoot_Data[pageName], {
            name = colors.BLUE .. LF["Alliance"] .. "|r",
            icon = "INV_BannerPVP_02",
            quality = 5 -- Epic quality for Header
        })
        for _, entry in ipairs(allianceEntries) do
            table.insert(AtlasTWLoot_Data[pageName], entry)
        end
    end

    -- Add Separator between factions if both exist
    local allianceCount = table.getn(allianceEntries)
    local hordeCount = table.getn(hordeEntries)
    if allianceCount > 0 and hordeCount > 0 then
        local fillCount = 14 - allianceCount
        if fillCount > 0 then
            for i = 1, fillCount do
                table.insert(AtlasTWLoot_Data[pageName], {})
            end
        end
    end

    -- Add Horde Header and Entries
    if table.getn(hordeEntries) > 0 then
        table.insert(AtlasTWLoot_Data[pageName], {
            name = colors.RED .. LF["Horde"] .. "|r",
            icon = "INV_BannerPVP_01",
            quality = 5 -- Epic quality for Header
        })
        for _, entry in ipairs(hordeEntries) do
            table.insert(AtlasTWLoot_Data[pageName], entry)
        end
    end
end
