--- @file QuickLook.lua
--- @brief Manages the Quick Look functionality for AtlasLoot.
--- This file provides functions to save, clear, and refresh quick access slots for frequently viewed loot tables.
--- It integrates with the Hewdrop-2.0 library for UI interactions and stores user-defined quick look data in AtlasTWCharDB.
--- @since 1.0.0
local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.QuickLook = {}

-- Local references for performance
local L = AtlasTW.Local
local BLUE = AtlasTW.Colors.BLUE
local WHITE = AtlasTW.Colors.WHITE
---
--- Clears a specific QuickLook button assignment
--- Removes stored data and refreshes button states
--- @param button number QuickLook button number to clear (1-6)
--- @return nil
--- @usage AtlasTW.QuickLook.ClearButton(3)
--- @since 1.0.0
---
function AtlasTW.QuickLook.ClearButton(button)
	if not button or button == nil then return end
	AtlasTWCharDB["QuickLooks"][button] = nil
	AtlasTW.QuickLook.RefreshButtons()
	print(BLUE.."AtlasLoot"..": "..WHITE..L["QuickLook"].." "..button.." "..L["has been reset!"])
end

---
--- Opens Hewdrop menu to assign current loot table to QuickLook slots
--- @param button table Button frame that triggered the menu
--- @return void
--- @usage AtlasTW.QuickLook.ShowMenu(button)
--- @since 1.0.0
---
function AtlasTW.QuickLook.ShowMenu(button)
	local Hewdrop = AceLibrary("Hewdrop-2.0")
	if Hewdrop:IsOpen(button) then
		Hewdrop:Close(1)
	else
		local setOptions = function()
			for i = 1, 6 do
				local index = i
				Hewdrop:AddLine(
					"text", L["QuickLook"].." "..i,
					"tooltipTitle", L["QuickLook"].." "..i,
					"tooltipText", L["Assign this loot table to QuickLook"].." "..i,
					"func", function()
						local dataID = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredElement or nil
						local storedMenu = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil
						if not AtlasTWCharDB["QuickLooks"] then AtlasTWCharDB["QuickLooks"] = {} end
						local titleText = nil
						if AtlasLoot_LootPageName and AtlasLoot_LootPageName:GetText() and AtlasLoot_LootPageName:GetText() ~= "" then
							titleText = AtlasLoot_LootPageName:GetText()
						elseif type(dataID) == "table" then
							if dataID.menuName then
								titleText = dataID.menuName
							elseif dataID.title then
								titleText = dataID.title
							end
						end
						if not titleText and dataID then
							titleText = tostring(dataID)
						end
						AtlasTWCharDB["QuickLooks"][index] = { dataID, storedMenu, titleText }
						AtlasTW.QuickLook.RefreshButtons()
						Hewdrop:Close(1)
					end
				)
			end
		end
		Hewdrop:Open(button,
			'point', function(parent)
				return "BOTTOMLEFT", "BOTTOMRIGHT"
			end,
			"children", setOptions
		)
	end
end

---
--- Refreshes QuickLook buttons availability based on saved assignments
--- @return void
--- @usage AtlasTW.QuickLook.RefreshButtons()
--- @since 1.0.0
---
function AtlasTW.QuickLook.RefreshButtons()
	local i=1
	while i<7 do
		local entry = AtlasTWCharDB["QuickLooks"][i]
		local btnPanel = _G["AtlasLootPanel_Preset"..i]
		local btnItems = _G["AtlasLootItemsFrame_Preset"..i]
		local enable = false
		if entry then
			if type(entry) == "table" then
				if entry[1] ~= nil then enable = true end
			else
				if entry ~= "" then enable = true end
			end
		end
		if btnPanel then if enable then btnPanel:Enable() else btnPanel:Disable() end end
		if btnItems then if enable then btnItems:Enable() else btnItems:Disable() end end
		i=i+1
	end
end