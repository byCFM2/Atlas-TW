---
--- Constants.lua - Color constants and common values for Atlas-TW Loot
--- Provides centralized color definitions and shared constants
--- Features:
--- • WoW color code constants for item quality and UI elements
--- • Shared string constants and formatting values
--- • Centralized configuration values
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

---
--- Color constants for item quality and UI elements
--- Based on WoW 1.12 item quality color codes
--- @since 1.0.0
---
if not AtlasLoot_Colors then
    AtlasLoot_Colors = {
        RED     = "|cffff0000",  -- Poor quality, errors
        WHITE   = "|cffFFFFFF",  -- Common quality, normal text
        BLUE    = "|cff0070dd",  -- Rare quality, info text
        DEFAULT = "|cffFFd200",  -- Default highlight color
        GREEN   = "|cff00FF00",  -- Uncommon quality, success
        GREY    = "|cff9d9d9d",  -- Disabled text, vendor trash
        ORANGE  = "|cffFFA500",  -- Legendary quality, warnings
        PURPLE  = "|cff9370DB",  -- Epic quality, special items
        YELLOW  = "|cffFFD700"   -- Quest items, important text
    }
end

---
--- Common string constants
--- @since 1.0.0
---
AtlasLoot_Constants = {
    -- UI text limits
    MAX_CATEGORY_TEXT_LENGTH = 30,
    MAX_TOOLTIP_LINE_LENGTH = 50,

    -- Item display constants
    ITEMS_PER_PAGE = 30,
    MAX_QUICKLOOK_SLOTS = 6,

    -- Search constants
    MIN_SEARCH_LENGTH = 2,
    MAX_SEARCH_RESULTS = 100,

    -- Cache constants
    CACHE_BATCH_SIZE = 10,
    CACHE_DELAY_MS = 100
}