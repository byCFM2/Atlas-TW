---
--- Initialization and event handling for AtlasTWLoot
--- Sets up SavedVariables, options, UISpecialFrames and integrations on VARIABLES_LOADED
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
--- @usage Called automatically on VARIABLES_LOADED event via AtlasTWLootInitFrame
---
function AtlasTWLoot_OnEvent()
	-- Initialize character database structure
	AtlasTWLoot_InitializeCharacterDatabase()

	-- Initialize UI special frames and panel windows
	AtlasTWLoot_InitializeUIFrames()

	-- Initialize addon integrations
	AtlasTW.Integrations.Initialize()

	-- Set up options frame and validate options
	AtlasTW.OptionsInit()
	AtlasTW.Integrations.ValidateOptions()

	-- Apply visual options (background opacity)
	AtlasTWLoot_ApplyVisualOptions()

	-- Set up the menu in the loot browser
	AtlasTWLoot_HewdropRegister()

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
--- @usage AtlasTWLoot_InitializeCharacterDatabase() -- Called during initialization
---
function AtlasTWLoot_InitializeCharacterDatabase()
	if not AtlasTWCharDB then AtlasTWCharDB = {} end
	if not AtlasTWCharDB["WishList"] then AtlasTWCharDB["WishList"] = {} end
	if not AtlasTWCharDB["QuickLooks"] then AtlasTWCharDB["QuickLooks"] = {} end
	if not AtlasTWCharDB["SearchResult"] then AtlasTWCharDB["SearchResult"] = {} end

	-- Invalidate category cache after initialization
	if AtlasTWLoot_InvalidateCategorizedList then
		AtlasTWLoot_InvalidateCategorizedList("WishList")
		AtlasTWLoot_InvalidateCategorizedList("SearchResult")
	end
end

---
--- Initializes UI special frames and panel windows
--- Adds frames to UISpecialFrames and sets up UIPanelWindows
--- @return nil
--- @usage AtlasTWLoot_InitializeUIFrames() -- Called during initialization
---
function AtlasTWLoot_InitializeUIFrames()
	-- Add the loot browser to the special frames tables to enable closing with the ESC key
	tinsert(UISpecialFrames, "AtlasTWLootOptionsFrame")

	-- Set up panel window configuration
	UIPanelWindows['AtlasTWLootOptionsFrame'] = {area = 'center', pushable = 0}
end

---
--- Applies visual options based on current settings
--- Handles background opacity and other visual customizations
--- @return nil
--- @usage AtlasTWLoot_ApplyVisualOptions() -- Called during initialization
---
function AtlasTWLoot_ApplyVisualOptions()
	-- If using an opaque items frame, change the alpha value of the backing texture
	if AtlasTWOptions.LootOpaque then
		AtlasTWLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasTWLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
end

-- Create a hidden frame to bind VARIABLES_LOADED to AtlasTWLoot_OnEvent
local AtlasTWLootInitFrame = CreateFrame("Frame", "AtlasTWLootInitFrame")
AtlasTWLootInitFrame:RegisterEvent("VARIABLES_LOADED")
-- Global function call wrapper is recommended for WoW 1.12 style
AtlasTWLootInitFrame:SetScript("OnEvent", function()
	AtlasTWLoot_OnEvent()
end)