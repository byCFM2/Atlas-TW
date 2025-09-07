---
--- Initialization and event handling for AtlasLoot
--- Sets up SavedVariables, options, UISpecialFrames and integrations on VARIABLES_LOADED
--- @author Atlas-TW Team
--- @since 1.0.0
---

---
--- Handles VARIABLES_LOADED event and initializes addon
--- Sets up character database, wish lists, UI special frames and addon integrations
--- Disables unavailable addon integration options with fallback handling
--- @return nil
--- @usage Called automatically on VARIABLES_LOADED event via AtlasLootInitFrame
--- @since 1.0.0
--- @author Atlas-TW Team
---
function AtlasLoot_OnEvent()
	if not AtlasTWCharDB then AtlasTWCharDB = {} end
	if not AtlasTWCharDB["WishList"] then AtlasTWCharDB["WishList"] = {} end
	if not AtlasTWCharDB["QuickLooks"] then AtlasTWCharDB["QuickLooks"] = {} end
	if not AtlasTWCharDB["SearchResult"] then AtlasTWCharDB["SearchResult"] = {} end

	-- Invalidate category cache after initialization
	if AtlasLoot_InvalidateCategorizedList then
		AtlasLoot_InvalidateCategorizedList("WishList")
		AtlasLoot_InvalidateCategorizedList("SearchResult")
	end

	--Add the loot browser to the special frames tables to enable closing wih the ESC key
	tinsert(UISpecialFrames, "AtlasLootOptionsFrame")
	--Disable checkboxes of missing addons
	if not LootLink_SetTooltip then
		AtlasTWOptionLootlinkTT:Disable()
		AtlasTWOptionLootlinkTTText:SetText(L["|cff9d9d9dLootlink Tooltips|r"])
	end
	if not ItemSync and not ISync then
		AtlasTWOptionItemSyncTT:Disable()
		AtlasTWOptionItemSyncTTText:SetText(L["|cff9d9d9dItemSync Tooltips|r"])
	end
	if not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare") then
		AtlasTWOptionEquipCompare:Disable()
		AtlasTWOptionEquipCompareText:SetText(L["|cff9d9d9dUse EquipCompare|r"])
	end

	--Set up options frame
	AtlasTW.OptionsInit()

	UIPanelWindows['AtlasLootOptionsFrame'] = {area = 'center', pushable = 0}

	--Legacy code for those using the ultimately failed attempt at making Atlas load on demand
	if AtlasButton_LoadAtlas then
		AtlasButton_LoadAtlas()
	end

	--Disable options that don't have the supporting mods
	if not LootLink_SetTooltip and AtlasTWOptions.LootlinkTT == true then
		AtlasTWOptions.LootlinkTT = false
		AtlasTWOptions.LootDefaultTT = true
	end
	if not ItemSync and not ISync and AtlasTWOptions.LootItemSyncTT == true then
		AtlasTWOptions.LootItemSyncTT = false
		AtlasTWOptions.LootDefaultTT = true
	end
	if not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare") and AtlasTWOptions.EquipCompare == true then
		AtlasTWOptions.LootEquipCompare = false
	end
	--If using an opaque items frame, change the alpha value of the backing texture

	if AtlasTWOptions.LootOpaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end

	--Set up the menu in the loot browser
	AtlasLoot_HewdropRegister()
	--Enable or disable AtlasLootFu based on seleced options
	--If EquipCompare is available, use it
	if (IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare")) and AtlasTWOptions.EquipCompare == true then
		EquipCompare_RegisterTooltip(AtlasLootTooltip)
		EquipCompare_RegisterTooltip(AtlasLootTooltip2)
	end
	if(IsAddOnLoaded("EQCompare") and (AtlasTWOptions.LootEquipCompare == true)) then
		EQCompare:RegisterTooltip(AtlasLootTooltip)
		EQCompare:RegisterTooltip(AtlasLootTooltip2)
	end
end

-- Create a hidden frame to bind VARIABLES_LOADED to AtlasLoot_OnEvent
local AtlasLootInitFrame = CreateFrame("Frame", "AtlasLootInitFrame")
AtlasLootInitFrame:RegisterEvent("VARIABLES_LOADED")
-- Global function call wrapper is recommended for WoW 1.12 style
AtlasLootInitFrame:SetScript("OnEvent", function()
	AtlasLoot_OnEvent()
end)