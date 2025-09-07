---
--- Integrations.lua - Third-party addon integration management
---
--- This module handles integration with external addons such as EquipCompare,
--- EQCompare, LootLink, and ItemSync. It provides centralized management of
--- addon compatibility, tooltip registration, and option handling.
---
--- Features:
--- • EquipCompare/EQCompare tooltip registration
--- • LootLink tooltip integration
--- • ItemSync tooltip support
--- • Addon availability detection
--- • Option state management
--- • Fallback handling for missing addons
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.Integrations = {}

-- Local references for performance
local L = AtlasTW.Local

---
--- Checks if EquipCompare or EQCompare addon is available
--- @return boolean True if either addon is loaded
--- @usage local hasEquipCompare = AtlasTW.Integrations.HasEquipCompare()
--- @since 1.0.0
---
function AtlasTW.Integrations.HasEquipCompare()
    return IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare")
end

---
--- Checks if LootLink addon is available
--- @return boolean True if LootLink is loaded and functional
--- @usage local hasLootLink = AtlasTW.Integrations.HasLootLink()
--- @since 1.0.0
---
function AtlasTW.Integrations.HasLootLink()
    return LootLink_SetTooltip ~= nil
end

---
--- Checks if ItemSync addon is available
--- @return boolean True if ItemSync or ISync is loaded
--- @usage local hasItemSync = AtlasTW.Integrations.HasItemSync()
--- @since 1.0.0
---
function AtlasTW.Integrations.HasItemSync()
    return ItemSync ~= nil or ISync ~= nil
end

---
--- Registers tooltips with EquipCompare addon
--- @param tooltip1 table First tooltip frame to register
--- @param tooltip2 table Second tooltip frame to register
--- @return nil
--- @usage AtlasTW.Integrations.RegisterEquipCompareTooltips(AtlasLootTooltip, AtlasLootTooltip2)
--- @since 1.0.0
---
function AtlasTW.Integrations.RegisterEquipCompareTooltips(tooltip1, tooltip2)
    if IsAddOnLoaded("EquipCompare") and EquipCompare_RegisterTooltip then
        EquipCompare_RegisterTooltip(tooltip1)
        if tooltip2 then
            EquipCompare_RegisterTooltip(tooltip2)
        end
    end

    if IsAddOnLoaded("EQCompare") and EQCompare and EQCompare.RegisterTooltip then
        EQCompare:RegisterTooltip(tooltip1)
        if tooltip2 then
            EQCompare:RegisterTooltip(tooltip2)
        end
    end
end

---
--- Unregisters tooltips from EquipCompare addon
--- @param tooltip1 table First tooltip frame to unregister
--- @param tooltip2 table Second tooltip frame to unregister
--- @return nil
--- @usage AtlasTW.Integrations.UnregisterEquipCompareTooltips(AtlasLootTooltip, AtlasLootTooltip2)
--- @since 1.0.0
---
function AtlasTW.Integrations.UnregisterEquipCompareTooltips(tooltip1, tooltip2)
    if IsAddOnLoaded("EquipCompare") and EquipCompare_UnregisterTooltip then
        EquipCompare_UnregisterTooltip(tooltip1)
        if tooltip2 then
            EquipCompare_UnregisterTooltip(tooltip2)
        end
    end

    if IsAddOnLoaded("EQCompare") and EQCompare and EQCompare.UnRegisterTooltip then
        EQCompare:UnRegisterTooltip(tooltip1)
        if tooltip2 then
            EQCompare:UnRegisterTooltip(tooltip2)
        end
    end
end

---
--- Initializes all addon integrations and sets up option states
--- Disables unavailable addon options and provides fallback handling
--- @return nil
--- @usage AtlasTW.Integrations.Initialize() -- Called during addon initialization
--- @since 1.0.0
---
function AtlasTW.Integrations.Initialize()
    -- Disable LootLink option if addon is not available
    if not AtlasTW.Integrations.HasLootLink() then
        if AtlasTWOptionLootlinkTT then
            AtlasTWOptionLootlinkTT:Disable()
        end
        if AtlasTWOptionLootlinkTTText then
            AtlasTWOptionLootlinkTTText:SetText(L["|cff9d9d9dLootlink Tooltips|r"])
        end
    end

    -- Disable ItemSync option if addon is not available
    if not AtlasTW.Integrations.HasItemSync() then
        if AtlasTWOptionItemSyncTT then
            AtlasTWOptionItemSyncTT:Disable()
        end
        if AtlasTWOptionItemSyncTTText then
            AtlasTWOptionItemSyncTTText:SetText(L["|cff9d9d9dItemSync Tooltips|r"])
        end
    end

    -- Disable EquipCompare option if addon is not available
    if not AtlasTW.Integrations.HasEquipCompare() then
        if AtlasTWOptionEquipCompare then
            AtlasTWOptionEquipCompare:Disable()
        end
        if AtlasTWOptionEquipCompareText then
            AtlasTWOptionEquipCompareText:SetText(L["|cff9d9d9dUse EquipCompare|r"])
        end
    end
end

---
--- Validates and corrects addon option states
--- Ensures options are disabled if supporting addons are not available
--- @return nil
--- @usage AtlasTW.Integrations.ValidateOptions() -- Called during option validation
--- @since 1.0.0
---
function AtlasTW.Integrations.ValidateOptions()
    -- Disable LootLink option and fallback to default if addon is missing
    if not AtlasTW.Integrations.HasLootLink() and AtlasTWOptions.LootlinkTT == true then
        AtlasTWOptions.LootlinkTT = false
        AtlasTWOptions.LootDefaultTT = true
    end

    -- Disable ItemSync option and fallback to default if addon is missing
    if not AtlasTW.Integrations.HasItemSync() and AtlasTWOptions.LootItemSyncTT == true then
        AtlasTWOptions.LootItemSyncTT = false
        AtlasTWOptions.LootDefaultTT = true
    end

    -- Disable EquipCompare option if addon is missing
    if not AtlasTW.Integrations.HasEquipCompare() and AtlasTWOptions.EquipCompare == true then
        AtlasTWOptions.LootEquipCompare = false
    end
end

---
--- Applies EquipCompare integration based on current options
--- Registers or unregisters tooltips based on option state and addon availability
--- @return nil
--- @usage AtlasTW.Integrations.ApplyEquipCompareIntegration() -- Called when options change
--- @since 1.0.0
---
function AtlasTW.Integrations.ApplyEquipCompareIntegration()
    if AtlasTW.Integrations.HasEquipCompare() and AtlasTWOptions.EquipCompare == true then
        AtlasTW.Integrations.RegisterEquipCompareTooltips(AtlasLootTooltip, AtlasLootTooltip2)
    end

    -- Handle EQCompare separately for compatibility
    if IsAddOnLoaded("EQCompare") and AtlasTWOptions.LootEquipCompare == true then
        if EQCompare and EQCompare.RegisterTooltip then
            EQCompare:RegisterTooltip(AtlasLootTooltip)
            EQCompare:RegisterTooltip(AtlasLootTooltip2)
        end
    end
end

---
--- Handles EquipCompare option toggle
--- Registers or unregisters tooltips based on the new option state
--- @return nil
--- @usage AtlasTW.Integrations.ToggleEquipCompare() -- Called by option UI
--- @since 1.0.0
---
function AtlasTW.Integrations.ToggleEquipCompare()
    AtlasTWOptions.LootEquipCompare = not AtlasTWOptions.LootEquipCompare

    if AtlasTWOptions.LootEquipCompare then
        -- Register tooltips if EquipCompare is enabled
        AtlasTW.Integrations.RegisterEquipCompareTooltips(AtlasLootTooltip, AtlasLootTooltip2)
    else
        -- Unregister tooltips if EquipCompare is disabled
        AtlasTW.Integrations.UnregisterEquipCompareTooltips(AtlasLootTooltip, AtlasLootTooltip2)
    end
end