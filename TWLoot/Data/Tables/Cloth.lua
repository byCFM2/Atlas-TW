---
--- Cloth.lua - Cloth data table
---
--- This module contains data for cloth drops and mob level ranges.
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
local L = AtlasTW.Localization.UI

AtlasTWLoot_Data = AtlasTWLoot_Data or {}

AtlasTWLoot_Data["ClothTable"] = {
	{ id=2589, disc=L["Level: "].."1-15", dropRate = 80, quantity = {1,3} }, -- Linen Cloth
	{ id=2592, disc=L["Level: "].."15-30", dropRate = 70, quantity = {1,3} }, -- Wool Cloth
	{ id=4306, disc=L["Level: "].."30-45", dropRate = 60, quantity = {1,3} }, -- Silk Cloth
	{ id=4338, disc=L["Level: "].."45-55", dropRate = 50, quantity = {1,3} }, -- Mageweave Cloth
	{ id=14047, disc=L["Level: "].."50-60", dropRate = 40, quantity = {1,3} }, -- Runecloth
	{ id=14256, disc=L["Level: "].."50-60 ("..L["Demons"]..")", dropRate = 5, quantity = {1,2} }, -- Felcloth
}
