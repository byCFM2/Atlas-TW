---
--- Initialization and event handling for AtlasLoot
--- Sets up SavedVariables, options, UISpecialFrames and integrations on VARIABLES_LOADED
--- @since 1.0.0
---

-- Local references for performance and compatibility
local _G = getfenv()
local L = AtlasTW.Local
local tinsert = table.insert

---
--- Handles VARIABLES_LOADED event and initializes addon
--- Sets up character database, wish lists, UI special frames and addon integrations
--- Disables unavailable addon integration options with fallback handling
--- @return nil
--- @usage Called automatically on VARIABLES_LOADED event via AtlasLootInitFrame
--- @since 1.0.0
---
function AtlasLoot_OnEvent()
	-- Initialize character database structure
	AtlasLoot_InitializeCharacterDatabase()

	-- Initialize UI special frames and panel windows
	AtlasLoot_InitializeUIFrames()

	-- Initialize addon integrations
	AtlasTW.Integrations.Initialize()

	-- Set up options frame and validate options
	AtlasTW.OptionsInit()
	AtlasTW.Integrations.ValidateOptions()

	-- Apply visual options (background opacity)
	AtlasLoot_ApplyVisualOptions()

	-- Set up the menu in the loot browser
	AtlasLoot_HewdropRegister()

	-- Apply addon integrations based on current options
	AtlasTW.Integrations.ApplyEquipCompareIntegration()

	-- Legacy Atlas load-on-demand support
	if AtlasButton_LoadAtlas then
		AtlasButton_LoadAtlas()
	end
end

---
--- Initializes character database structure
--- Sets up SavedVariables tables and invalidates category caches
--- @return nil
--- @usage AtlasLoot_InitializeCharacterDatabase() -- Called during initialization
--- @since 1.0.0
---
function AtlasLoot_InitializeCharacterDatabase()
	if not AtlasTWCharDB then AtlasTWCharDB = {} end
	if not AtlasTWCharDB["WishList"] then AtlasTWCharDB["WishList"] = {} end
	if not AtlasTWCharDB["QuickLooks"] then AtlasTWCharDB["QuickLooks"] = {} end
	if not AtlasTWCharDB["SearchResult"] then AtlasTWCharDB["SearchResult"] = {} end

	-- Invalidate category cache after initialization
	if AtlasLoot_InvalidateCategorizedList then
		AtlasLoot_InvalidateCategorizedList("WishList")
		AtlasLoot_InvalidateCategorizedList("SearchResult")
	end
end

---
--- Initializes UI special frames and panel windows
--- Adds frames to UISpecialFrames and sets up UIPanelWindows
--- @return nil
--- @usage AtlasLoot_InitializeUIFrames() -- Called during initialization
--- @since 1.0.0
---
function AtlasLoot_InitializeUIFrames()
	-- Add the loot browser to the special frames tables to enable closing with the ESC key
	tinsert(UISpecialFrames, "AtlasLootOptionsFrame")
	
	-- Set up panel window configuration
	UIPanelWindows['AtlasLootOptionsFrame'] = {area = 'center', pushable = 0}
end

---
--- Applies visual options based on current settings
--- Handles background opacity and other visual customizations
--- @return nil
--- @usage AtlasLoot_ApplyVisualOptions() -- Called during initialization
--- @since 1.0.0
---
function AtlasLoot_ApplyVisualOptions()
	-- If using an opaque items frame, change the alpha value of the backing texture
	if AtlasTWOptions.LootOpaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
end

-- Create a hidden frame to bind VARIABLES_LOADED to AtlasLoot_OnEvent
local AtlasLootInitFrame = CreateFrame("Frame", "AtlasLootInitFrame")
AtlasLootInitFrame:RegisterEvent("VARIABLES_LOADED")
-- Global function call wrapper is recommended for WoW 1.12 style
AtlasLootInitFrame:SetScript("OnEvent", function()
	AtlasLoot_OnEvent()
end)