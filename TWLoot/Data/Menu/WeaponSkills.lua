---
--- WeaponSkills.lua - Weapon skills menu
---
--- This module defines the menu structure for the Weapon Skills page,
--- allowing players to select their class to view available weapon trainers.
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}

local L = AtlasTW.Localization.UI
local LC = AtlasTW.Localization.Classes
local Colors = AtlasTW.Colors

AtlasTW.MenuData.WeaponSkills = {
    {},
    {},
    { name = Colors.Priest .. LC["Priest"].." "..L["Weapon Skills"],   icon = "Interface\\Icons\\Spell_Holy_PowerWordShield",   lootpage = "WeaponSkills_Priest" },
    { name = Colors.Mage .. LC["Mage"].." "..L["Weapon Skills"],       icon = "Interface\\Icons\\Spell_Frost_IceStorm",         lootpage = "WeaponSkills_Mage" },
    { name = Colors.Warlock .. LC["Warlock"].." "..L["Weapon Skills"], icon = "Interface\\Icons\\Spell_Shadow_CurseOfTounges", lootpage = "WeaponSkills_Warlock" },
    { name = Colors.Rogue .. LC["Rogue"].." "..L["Weapon Skills"],     icon = "Interface\\Icons\\Ability_BackStab",             lootpage = "WeaponSkills_Rogue" },
    { name = Colors.Druid .. LC["Druid"].." "..L["Weapon Skills"],     icon = "Interface\\Icons\\Spell_Nature_Regeneration",    lootpage = "WeaponSkills_Druid" },
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    { name = Colors.Hunter .. LC["Hunter"].." "..L["Weapon Skills"],   icon = "Interface\\Icons\\Ability_Hunter_RunningShot",   lootpage = "WeaponSkills_Hunter" },
    { name = Colors.Shaman .. LC["Shaman"].." "..L["Weapon Skills"],   icon = "Interface\\Icons\\Spell_FireResistanceTotem_01", lootpage = "WeaponSkills_Shaman" },
    { name = Colors.Paladin .. LC["Paladin"].." "..L["Weapon Skills"], icon = "Interface\\Icons\\Spell_Holy_SealOfMight",     lootpage = "WeaponSkills_Paladin" },
    { name = Colors.Warrior .. LC["Warrior"].." "..L["Weapon Skills"], icon = "Interface\\Icons\\INV_Shield_05",              lootpage = "WeaponSkills_Warrior" },
}

---
-- Weapon Skills menu function
-- @return nil
-- @usage AtlasTWLoot_WeaponSkillsMenu()
---
function AtlasTWLootWeaponSkillsMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Weapon Skills"], AtlasTW.MenuData.WeaponSkills, L["World"])
end
