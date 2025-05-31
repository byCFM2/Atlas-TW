-- Create Tooltip
local tooltip = CreateFrame("GameTooltip", "KQuestTooltip", UIParent, "GameTooltipTemplate")
tooltip:Hide()

-- Register Tooltip
function KQuestRegisterTooltip()
    if IsAddOnLoaded("EquipCompare") then
        EquipCompare_RegisterTooltip(tooltip)
    end
    if IsAddOnLoaded("EQCompare") then
        EQCompare:RegisterTooltip(tooltip)
    end
end

-- Unregister Tooltip
function KQuestUnRegisterTooltip()
    if IsAddOnLoaded("EquipCompare") then
        EquipCompare_UnregisterTooltip(tooltip)
    end
    if IsAddOnLoaded("EQCompare") then
        EQCompare:UnRegisterTooltip(tooltip)
    end
end