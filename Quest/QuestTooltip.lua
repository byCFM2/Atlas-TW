AtlasTW = AtlasTW or {}
AtlasTW.Quest = AtlasTW.Quest or {}

local QuestTooltip = CreateFrame("GameTooltip", "QuestTooltip", UIParent, "GameTooltipTemplate")
QuestTooltip:Hide()

function QuestTooltip:Register()
    if IsAddOnLoaded("EquipCompare") and EquipCompare_RegisterTooltip then
        EquipCompare_RegisterTooltip(self)
    end
    if IsAddOnLoaded("EQCompare") and EQCompare and EQCompare.RegisterTooltip then
        EQCompare:RegisterTooltip(self)
    end
    self.isRegistered = true
end

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