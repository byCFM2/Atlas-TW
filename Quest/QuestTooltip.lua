---
--- QuestTooltip.lua - Atlas quest tooltip management
--- 
--- This file contains the quest tooltip system for Atlas-TW.
--- It handles quest item tooltips, addon integration for tooltip comparison,
--- and provides enhanced tooltip functionality for quest-related items.
--- 
--- Features:
--- - Quest tooltip creation and management
--- - EquipCompare and EQCompare integration
--- - Tooltip registration system
--- - Enhanced quest item information display
--- - Addon compatibility handling
--- 
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

AtlasTW = AtlasTW or {}
AtlasTW.Quest = AtlasTW.Quest or {}

local QuestTooltip = CreateFrame("GameTooltip", "QuestTooltip", UIParent, "GameTooltipTemplate")
QuestTooltip:Hide()

---
--- Registers the quest tooltip with compatible addon comparison systems
--- Integrates with EquipCompare and EQCompare addons if they are loaded
--- @usage QuestTooltip:Register()
--- @since 1.0.0
---
function QuestTooltip:Register()
    if IsAddOnLoaded("EquipCompare") and EquipCompare_RegisterTooltip then
        EquipCompare_RegisterTooltip(self)
    end
    if IsAddOnLoaded("EQCompare") and EQCompare and EQCompare.RegisterTooltip then
        EQCompare:RegisterTooltip(self)
    end
    self.isRegistered = true
end

---
--- Unregisters the quest tooltip from addon comparison systems
--- Removes integration with EquipCompare and EQCompare addons if they are loaded
--- @usage QuestTooltip:Unregister()
--- @since 1.0.0
---
function QuestTooltip:Unregister()
    if IsAddOnLoaded("EquipCompare") and EquipCompare_UnregisterTooltip then
        EquipCompare_UnregisterTooltip(self)
    end
    if IsAddOnLoaded("EQCompare") and EQCompare and EQCompare.UnRegisterTooltip then
        EQCompare:UnRegisterTooltip(self)
    end
    self.isRegistered = false
end

AtlasTW.Quest.Tooltip = QuestTooltip