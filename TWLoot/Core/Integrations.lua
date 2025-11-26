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
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.Integrations = {}
local GREY = AtlasTW.Colors.GREY2

-- Local references for performance
local L = AtlasTW.Localization.UI

---
--- Checks if EquipCompare or EQCompare addon is available
--- @return boolean True if either addon is loaded
--- @usage local hasEquipCompare = AtlasTW.Integrations.HasEquipCompare()
---
function AtlasTW.Integrations.HasEquipCompare()
    return IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare")
end

---
--- Checks if LootLink addon is available
--- @return boolean True if LootLink is loaded and functional
--- @usage local hasLootLink = AtlasTW.Integrations.HasLootLink()
---
function AtlasTW.Integrations.HasLootLink()
    return LootLink_SetTooltip ~= nil
end

---
--- Checks if ItemSync addon is available
--- @return boolean True if ItemSync or ISync is loaded
--- @usage local hasItemSync = AtlasTW.Integrations.HasItemSync()
---
function AtlasTW.Integrations.HasItemSync()
    return ItemSync ~= nil or ISync ~= nil
end

---
--- Registers tooltips with EquipCompare addon
--- @param tooltip1 table First tooltip frame to register
--- @param tooltip2 table Second tooltip frame to register
--- @return nil
--- @usage AtlasTW.Integrations.RegisterEquipCompareTooltips(AtlasTWLootTooltip, AtlasTWLootTooltip2)
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
--- @usage AtlasTW.Integrations.UnregisterEquipCompareTooltips(AtlasTWLootTooltip, AtlasTWLootTooltip2)
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
---
function AtlasTW.Integrations.Initialize()
    -- Disable LootLink option if addon is not available
    if not AtlasTW.Integrations.HasLootLink() then
        if AtlasTWOptionLootlinkTT then
            AtlasTWOptionLootlinkTT:Disable()
        end
        if AtlasTWOptionLootlinkTTText then
            AtlasTWOptionLootlinkTTText:SetText(GREY..L["Lootlink Tooltips"])
        end
    end

    -- Disable ItemSync option if addon is not available
    if not AtlasTW.Integrations.HasItemSync() then
        if AtlasTWOptionItemSyncTT then
            AtlasTWOptionItemSyncTT:Disable()
        end
        if AtlasTWOptionItemSyncTTText then
            AtlasTWOptionItemSyncTTText:SetText(GREY..L["ItemSync Tooltips"])
        end
    end

    -- Disable EquipCompare option if addon is not available
    if not AtlasTW.Integrations.HasEquipCompare() then
        if AtlasTWOptionEquipCompare then
            AtlasTWOptionEquipCompare:Disable()
        end
        if AtlasTWOptionEquipCompareText then
            AtlasTWOptionEquipCompareText:SetText(GREY..L["Use EquipCompare"])
        end
    end
end

---
--- Validates and corrects addon option states
--- Ensures options are disabled if supporting addons are not available
--- @return nil
--- @usage AtlasTW.Integrations.ValidateOptions() -- Called during option validation
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
---
function AtlasTW.Integrations.ApplyEquipCompareIntegration()
    if AtlasTW.Integrations.HasEquipCompare() and AtlasTWOptions.EquipCompare == true then
        AtlasTW.Integrations.RegisterEquipCompareTooltips(AtlasTWLootTooltip, AtlasTWLootTooltip2)
    end

    -- Handle EQCompare separately for compatibility
    if IsAddOnLoaded("EQCompare") and AtlasTWOptions.LootEquipCompare == true then
        if EQCompare and EQCompare.RegisterTooltip then
            EQCompare:RegisterTooltip(AtlasTWLootTooltip)
            EQCompare:RegisterTooltip(AtlasTWLootTooltip2)
        end
    end
end

---
--- Handles EquipCompare option toggle
--- Registers or unregisters tooltips based on the new option state
--- @return nil
--- @usage AtlasTW.Integrations.ToggleEquipCompare() -- Called by option UI
---
function AtlasTW.Integrations.ToggleEquipCompare()
    AtlasTWOptions.LootEquipCompare = not AtlasTWOptions.LootEquipCompare

    if AtlasTWOptions.LootEquipCompare then
        -- Register tooltips if EquipCompare is enabled
        AtlasTW.Integrations.RegisterEquipCompareTooltips(AtlasTWLootTooltip, AtlasTWLootTooltip2)
    else
        -- Unregister tooltips if EquipCompare is disabled
        AtlasTW.Integrations.UnregisterEquipCompareTooltips(AtlasTWLootTooltip, AtlasTWLootTooltip2)
    end
end