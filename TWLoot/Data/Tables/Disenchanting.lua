---
--- Disenchanting.lua - Disenchanting data table
---
--- This module contains data for disenchanting rates and item level ranges.
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
local L = AtlasTW.Localization.UI

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

AtlasTWLoot_Data["EnchantingDisenchant"] = {
	-- Dusts (Green Armor/Weapons)
	{ id=10940, disc=L["Item Level"].." 1-20", dropRate = 80, quantity = {1,2} }, -- Strange Dust
	{ id=11083, disc=L["Item Level"].." 21-30", dropRate = 75, quantity = {2,5} }, -- Soul Dust
	{ id=11137, disc=L["Item Level"].." 31-40", dropRate = 75, quantity = {2,5} }, -- Vision Dust
	{ id=11176, disc=L["Item Level"].." 41-50", dropRate = 75, quantity = {2,5} }, -- Dream Dust
	{ id=16204, disc=L["Item Level"].." 51-60", dropRate = 75, quantity = {2,5} }, -- Illusion Dust
    {},
	-- Shards (Blue Items)
	{ id=10978, disc=L["Item Level"].." 1-20", dropRate = 100 }, -- Small Glimmering Shard
	{ id=11084, disc=L["Item Level"].." 21-25", dropRate = 100 }, -- Large Glimmering Shard
	{ id=11138, disc=L["Item Level"].." 26-30", dropRate = 100 }, -- Small Glowing Shard
	{ id=11139, disc=L["Item Level"].." 31-35", dropRate = 100 }, -- Large Glowing Shard
	{ id=11177, disc=L["Item Level"].." 36-40", dropRate = 100 }, -- Small Radiant Shard
	{ id=11178, disc=L["Item Level"].." 41-45", dropRate = 100 }, -- Large Radiant Shard
	{ id=14343, disc=L["Item Level"].." 46-50", dropRate = 100 }, -- Small Brilliant Shard
	{ id=14344, disc=L["Item Level"].." 51-60", dropRate = 100 }, -- Large Brilliant Shard
    {},
	-- Essences (Green Weapons/Armor)
	{ id=10938, disc=L["Item Level"].." 1-10", dropRate = 20, quantity = {1,2} }, -- Lesser Magic Essence
	{ id=10939, disc=L["Item Level"].." 11-15", dropRate = 20, quantity = {1,2} }, -- Greater Magic Essence
	{ id=10998, disc=L["Item Level"].." 16-20", dropRate = 20, quantity = {1,2} }, -- Lesser Astral Essence
	{ id=11082, disc=L["Item Level"].." 21-25", dropRate = 20, quantity = {1,2} }, -- Greater Astral Essence
	{ id=11134, disc=L["Item Level"].." 26-30", dropRate = 20, quantity = {1,2} }, -- Lesser Mystic Essence
	{ id=11135, disc=L["Item Level"].." 31-35", dropRate = 20, quantity = {1,2} }, -- Greater Mystic Essence
	{ id=11174, disc=L["Item Level"].." 36-40", dropRate = 20, quantity = {1,2} }, -- Lesser Nether Essence
	{ id=11175, disc=L["Item Level"].." 41-45", dropRate = 20, quantity = {1,2} }, -- Greater Nether Essence
	{ id=16202, disc=L["Item Level"].." 46-50", dropRate = 20, quantity = {1,2} }, -- Lesser Eternal Essence
	{ id=16203, disc=L["Item Level"].." 51-60", dropRate = 20, quantity = {1,2} }, -- Greater Eternal Essence
    {},
	-- Crystals (Epic Items)
	{ id=20725, disc=L["Item Level"].." 51+", dropRate = 100 }, -- Nexus Crystal
}
