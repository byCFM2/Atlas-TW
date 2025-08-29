local AtlasLootTip = CreateFrame("Frame", "AtlasLootTip", GameTooltip)
local strfind = string.find
local GetItemInfo = GetItemInfo
local GREY = "|cff999999"

-- Debug: Check initial state of required variables
print("AtlasLoot Tooltip Debug: Initializing...")
print("AtlasLoot Tooltip Debug: AtlasTWOptions = " .. tostring(AtlasTWOptions))
print("AtlasLoot Tooltip Debug: AtlasLoot_Data = " .. tostring(AtlasLoot_Data))
print("AtlasLoot Tooltip Debug: AtlasTW = " .. tostring(AtlasTW))
if AtlasTW then
    print("AtlasLoot Tooltip Debug: AtlasTW.InstanceData = " .. tostring(AtlasTW.InstanceData))
end

local insideHook = false
local tooltipMoney = 0
local original_SetTooltipMoney = SetTooltipMoney
function SetTooltipMoney(frame, money)
    if insideHook then
        tooltipMoney = money or 0
    else
        original_SetTooltipMoney(frame, money)
    end
end

local WrappingLines = {
    ["^Set:"] = gsub("^"..ITEM_SET_BONUS, "%%s", ""),
    ["^%(%d%) Set:"] = gsub(gsub(ITEM_SET_BONUS_GRAY, "%(%%d%)", "^%%(%%d%%)"), "%%s", ""),
    ["^Effect:"] = gsub("^"..ITEM_SPELL_EFFECT, "%%s", ""),
    ["^Equip:"] = "^"..ITEM_SPELL_TRIGGER_ONEQUIP,
    ["^Chance on hit:"] = "^"..ITEM_SPELL_TRIGGER_ONPROC,
    ["^Use:"] = "^"..ITEM_SPELL_TRIGGER_ONUSE,
    ["^\nRequires"] = "^\n"..gsub(ITEM_REQ_SKILL, "%%s", "")
}

local lines = {}
for i = 1, 30 do
    lines[i] = {}
end

local function AddSourceLine(tooltip, sourceStr)
    local name = tooltip:GetName()
    local numLines = tooltip:NumLines()
    local left, right
    local leftText, rightText
    local leftR, leftG, leftB
    local rightR, rightG, rightB
    local wrap

    for i in pairs(lines) do
        for j in pairs(lines[i]) do
            lines[i][j] = nil
        end
    end

    for i = 1, numLines do
        left = getglobal(name .. "TextLeft" .. i)
        right = getglobal(name .. "TextRight" .. i)
        leftText = left:GetText()
        rightText = right:IsShown() and right:GetText()
        leftR, leftG, leftB = left:GetTextColor()
        rightR, rightG, rightB = right:GetTextColor()
        lines[i][1] = leftText
        lines[i][2] = rightText
        lines[i][3] = leftR
        lines[i][4] = leftG
        lines[i][5] = leftB
        lines[i][6] = rightR
        lines[i][7] = rightG
        lines[i][8] = rightB
    end

    if not lines[1][1] then
        return
    end

    tooltip:SetText(lines[1][1], lines[1][3], lines[1][4], lines[1][5], 1, false)

    if numLines < 28 then
        tooltip:AddLine(sourceStr)
    elseif lines[2][1] then
        lines[2][1] = sourceStr .. "\n" .. lines[2][1]
    end

    for i = 2, getn(lines) do
        if lines[i][2] then
            tooltip:AddDoubleLine(lines[i][1], lines[i][2], lines[i][3], lines[i][4], lines[i][5], lines[i][6], lines[i][7], lines[i][8])
        else
            wrap = false
            if strsub(lines[i][1] or "", 1, 1) == "\"" then
                wrap = true
            else
                for _, pattern in pairs(WrappingLines) do
                    if strfind(lines[i][1] or "", pattern) then
                        wrap = true
                        break
                    end
                end
            end
            tooltip:AddLine(lines[i][1], lines[i][3], lines[i][4], lines[i][5], wrap)
        end
    end
end

-- Dynamic source lookup without huge static AtlasLootSources
local SourceCache = {}

local function InContainerMatches(container, itemID)
    if type(container) ~= "table" then 
        print("InContainerMatches: container is not a table")
        return false 
    end
    print("InContainerMatches: Checking container for itemID " .. tostring(itemID))
    for _, v in ipairs(container) do
        if type(v) == "table" then
            if v[1] == itemID then 
                print("InContainerMatches: Found itemID " .. tostring(itemID) .. " in container table entry")
                return true 
            end
        else
            if v == itemID then 
                print("InContainerMatches: Found itemID " .. tostring(itemID) .. " in container direct entry")
                return true 
            end
        end
    end
    print("InContainerMatches: itemID " .. tostring(itemID) .. " not found in container")
    return false
end

local function ScanItemsList(items, itemID)
    if type(items) ~= "table" then 
        print("ScanItemsList: items is not a table")
        return false 
    end
    print("ScanItemsList: Scanning items list for itemID " .. tostring(itemID))
    for _, r in ipairs(items) do
        if type(r) == "table" then
            if r.id and r.id == itemID then 
                print("ScanItemsList: Found itemID " .. tostring(itemID) .. " via r.id")
                return true 
            end
            if r[1] and r[1] == itemID then 
                print("ScanItemsList: Found itemID " .. tostring(itemID) .. " via r[1]")
                return true 
            end
            if r.container and InContainerMatches(r.container, itemID) then 
                print("ScanItemsList: Found itemID " .. tostring(itemID) .. " in container")
                return true 
            end
        end
    end
    print("ScanItemsList: itemID " .. tostring(itemID) .. " not found in items list")
    return false
end

local function FindItemSourceInInstance(instKey, inst, itemID)
    if type(inst) ~= "table" then 
        print("FindItemSourceInInstance: inst is not a table for " .. tostring(instKey))
        return nil 
    end
    local instName = inst.Name or instKey
    print("FindItemSourceInInstance: Checking instance " .. tostring(instName) .. " for itemID " .. tostring(itemID))

    if inst.Bosses then
        print("FindItemSourceInInstance: Found Bosses in " .. tostring(instName))
        for _, boss in ipairs(inst.Bosses) do
            local bossName = boss.name or boss.id or "?"
            print("FindItemSourceInInstance: Checking boss " .. tostring(bossName))
            local items = boss.items or boss.loot
            if type(items) == "string" then
                print("FindItemSourceInInstance: Boss items is string reference: " .. tostring(items))
                local data = AtlasLoot_Data and AtlasLoot_Data[items]
                if type(data) == "table" then
                    print("FindItemSourceInInstance: Found data table for " .. tostring(items))
                    for _, rec in ipairs(data) do
                        if type(rec) == "table" and type(rec[1]) == "number" and rec[1] == itemID then
                            print("FindItemSourceInInstance: Found itemID " .. tostring(itemID) .. " in boss " .. tostring(bossName))
                            return instName.." - "..tostring(bossName)
                        end
                    end
                else
                    print("FindItemSourceInInstance: No data table found for " .. tostring(items))
                end
            else
                print("FindItemSourceInInstance: Boss items is direct table")
                if ScanItemsList(items, itemID) then
                    print("FindItemSourceInInstance: Found itemID " .. tostring(itemID) .. " in boss " .. tostring(bossName) .. " direct items")
                    return instName.." - "..tostring(bossName)
                end
            end
        end
    else
        print("FindItemSourceInInstance: No Bosses found in " .. tostring(instName))
    end

    local function scanList(list, label)
        if type(list) ~= "table" then return nil end
        for _, v in ipairs(list) do
            local items = v.items or v.loot
            if type(items) == "string" then
                local data = AtlasLoot_Data and AtlasLoot_Data[items]
                if type(data) == "table" then
                    for _, rec in ipairs(data) do
                        if type(rec) == "table" and type(rec[1]) == "number" and rec[1] == itemID then
                            local name = v.name or v.loot or label
                            return instName.." - "..tostring(name or label or "?")
                        end
                    end
                end
            else
                if ScanItemsList(items, itemID) then
                    local name = v.name or v.loot or label
                    return instName.." - "..tostring(name or label or "?")
                end
            end
        end
        return nil
    end

    local r = scanList(inst.Reputation, "Reputation")
    if r then return r end
    r = scanList(inst.Keys, "Keys")
    if r then return r end

    return nil
end

local function FindItemSourceInAtlasLootData(itemID)
    if not AtlasLoot_Data then 
        print("FindItemSourceInAtlasLootData: AtlasLoot_Data not available")
        return nil 
    end
    
    print("FindItemSourceInAtlasLootData: Searching for itemID " .. tostring(itemID))
    
    for dataSource, sourceData in pairs(AtlasLoot_Data) do
        if dataSource ~= "AtlasLootFallback" and dataSource ~= "AtlasLootSources" then
            print("FindItemSourceInAtlasLootData: Checking dataSource " .. tostring(dataSource))
            if type(sourceData) == "table" then
                for dataID, data in pairs(sourceData) do
                    if type(data) == "table" then
                        print("FindItemSourceInAtlasLootData: Checking dataID " .. tostring(dataID) .. " in " .. tostring(dataSource))
                        for _, v in ipairs(data) do
                            if type(v) == "table" and type(v[1]) == "number" then
                                if v[1] == itemID then
                                    print("FindItemSourceInAtlasLootData: Found match! itemID " .. tostring(itemID) .. " in " .. tostring(dataSource) .. "/" .. tostring(dataID))
                                    local zoneName
                                    if AtlasLoot_TableNamesBoss and type(AtlasLoot_TableNamesBoss) == "table" then
                                        for parent, mappings in pairs(AtlasLoot_TableNamesBoss) do
                                            if type(mappings) == "table" then
                                                for k, _ in pairs(mappings) do
                                                    if k == dataID then zoneName = parent break end
                                                end
                                            end
                                            if zoneName then break end
                                        end
                                    end
                                    if zoneName then
                                        return tostring(zoneName).." - "..tostring(dataID)
                                    else
                                        return tostring(dataSource).." - "..tostring(dataID)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    print("FindItemSourceInAtlasLootData: No match found for itemID " .. tostring(itemID))
    return nil
end

local function FindItemSource(itemID)
    if not itemID then 
        print("FindItemSource: itemID is nil")
        return nil 
    end
    
    print("FindItemSource: Searching for itemID " .. tostring(itemID))
    
    if SourceCache[itemID] ~= nil then
        print("FindItemSource: Found in cache for itemID " .. tostring(itemID) .. ": " .. tostring(SourceCache[itemID]))
        if SourceCache[itemID] == false then return nil end
        return SourceCache[itemID]
    end

    print("FindItemSource: Checking AtlasTW.InstanceData")
    if AtlasTW and AtlasTW.InstanceData then
        print("FindItemSource: AtlasTW.InstanceData exists")
        for instKey, inst in pairs(AtlasTW.InstanceData) do
            print("FindItemSource: Checking instance " .. tostring(instKey))
            local src = FindItemSourceInInstance(instKey, inst, itemID)
            if src then
                print("FindItemSource: Found in instance " .. tostring(instKey) .. ": " .. tostring(src))
                SourceCache[itemID] = src
                return src
            end
        end
    else
        print("FindItemSource: AtlasTW.InstanceData not available")
    end

    print("FindItemSource: Checking AtlasLoot_Data")
    local src = FindItemSourceInAtlasLootData(itemID)
    if src then
        print("FindItemSource: Found in AtlasLoot_Data: " .. tostring(src))
        SourceCache[itemID] = src
        return src
    end

    print("FindItemSource: No source found for itemID " .. tostring(itemID))
    SourceCache[itemID] = false
    return nil
end

local lastItemID, lastSourceStr
local function ExtendTooltip(tooltip)
    print("ExtendTooltip: Called")
    if AtlasTWOptions and AtlasTWOptions.LootShowSource then
        print("ExtendTooltip: LootShowSource is enabled")
        local itemID = tonumber(tooltip.itemID)
        print("ExtendTooltip: itemID = " .. tostring(itemID))
        if itemID and itemID ~= 51217 then -- 51217 Fashion Coin
            if itemID ~= lastItemID then
                print("ExtendTooltip: New itemID, searching for source")
                lastItemID = itemID
                lastSourceStr = nil
                local source = FindItemSource(itemID)
                if source then
                    print("ExtendTooltip: Source found: " .. tostring(source))
                    local str = GREY .. source .. "|r"
                    lastSourceStr = str
                else
                    print("ExtendTooltip: No source found")
                end
            else
                print("ExtendTooltip: Same itemID as last time")
            end
            if lastSourceStr then
                print("ExtendTooltip: Adding source line to tooltip")
                AddSourceLine(tooltip, lastSourceStr)
                tooltip:Show()
            else
                print("ExtendTooltip: No source string to add")
            end
        else
            print("ExtendTooltip: itemID is nil, 0, or Fashion Coin")
        end
    else
        print("ExtendTooltip: LootShowSource is disabled or AtlasTWOptions not available")
    end
    if tooltipMoney > 0 then
        original_SetTooltipMoney(tooltip, tooltipMoney)
        tooltip:Show()
    end
end

local lastSearchName
local lastSearchID

local function GetItemIDByName(name)
    if not name then return nil end
    if name ~= lastSearchName then
        for itemID = 1, 99999 do
            local itemName = GetItemInfo(itemID)
            if itemName and itemName == name then
                lastSearchID = itemID
                break
            end
        end
        lastSearchName = name
    end
    return lastSearchID
end

local function HookTooltip(tooltip)
    local original_SetLootRollItem    = tooltip.SetLootRollItem
    local original_SetLootItem        = tooltip.SetLootItem
    local original_SetMerchantItem    = tooltip.SetMerchantItem
    local original_SetQuestLogItem    = tooltip.SetQuestLogItem
    local original_SetQuestItem       = tooltip.SetQuestItem
    local original_SetHyperlink       = tooltip.SetHyperlink
    local original_SetBagItem         = tooltip.SetBagItem
    local original_SetInboxItem       = tooltip.SetInboxItem
    local original_SetInventoryItem   = tooltip.SetInventoryItem
    local original_SetCraftItem       = tooltip.SetCraftItem
    local original_SetCraftSpell      = tooltip.SetCraftSpell
    local original_SetTradeSkillItem  = tooltip.SetTradeSkillItem
    local original_SetAuctionItem     = tooltip.SetAuctionItem
    local original_SetAuctionSellItem = tooltip.SetAuctionSellItem
    local original_SetTradePlayerItem = tooltip.SetTradePlayerItem
    local original_SetTradeTargetItem = tooltip.SetTradeTargetItem

    local original_OnHide             = tooltip:GetScript("OnHide")

    tooltip:SetScript("OnHide", function()
        if original_OnHide then original_OnHide() end
        this.itemID = nil
        tooltipMoney = 0
    end)

    function tooltip.SetLootRollItem(self, rollID)
        insideHook = true
        original_SetLootRollItem(self, rollID)
        insideHook = false
        local _, _, id = strfind(GetLootRollItemLink(rollID) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetLootItem(self, slot)
        insideHook = true
        original_SetLootItem(self, slot)
        insideHook = false
        local _, _, id = strfind(GetLootSlotLink(slot) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetMerchantItem(self, merchantIndex)
        insideHook = true
        original_SetMerchantItem(self, merchantIndex)
        insideHook = false
        local _, _, id = strfind(GetMerchantItemLink(merchantIndex) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetQuestLogItem(self, itemType, index)
        insideHook = true
        original_SetQuestLogItem(self, itemType, index)
        insideHook = false
        local _, _, id = strfind(GetQuestLogItemLink(itemType, index) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetQuestItem(self, itemType, index)
        insideHook = true
        original_SetQuestItem(self, itemType, index)
        insideHook = false
        local _, _, id = strfind(GetQuestItemLink(itemType, index) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetHyperlink(self, arg1)
        insideHook = true
        original_SetHyperlink(self, arg1)
        insideHook = false
        local _, _, id = strfind(arg1 or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetBagItem(self, container, slot)
        insideHook = true
        local hasCooldown, repairCost = original_SetBagItem(self, container, slot)
        insideHook = false
        local _, _, id = strfind(GetContainerItemLink(container, slot) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
        return hasCooldown, repairCost
    end

    function tooltip.SetInboxItem(self, mailID, attachmentIndex)
        insideHook = true
        original_SetInboxItem(self, mailID, attachmentIndex)
        insideHook = false
        local itemName = GetInboxItem(mailID)
        self.itemID = GetItemIDByName(itemName)
        ExtendTooltip(self)
    end

    function tooltip.SetInventoryItem(self, unit, slot)
        insideHook = true
        local hasItem, hasCooldown, repairCost = original_SetInventoryItem(self, unit, slot)
        insideHook = false
        local _, _, id = strfind(GetInventoryItemLink(unit, slot) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
        return hasItem, hasCooldown, repairCost
    end

    function tooltip.SetCraftItem(self, skill, slot)
        insideHook = true
        original_SetCraftItem(self, skill, slot)
        insideHook = false
        local _, _, id = strfind(GetCraftReagentItemLink(skill, slot) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetCraftSpell(self, slot)
        insideHook = true
        original_SetCraftSpell(self, slot)
        insideHook = false
        local _, _, id = strfind(GetCraftItemLink(slot) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetTradeSkillItem(self, skillIndex, reagentIndex)
        insideHook = true
        original_SetTradeSkillItem(self, skillIndex, reagentIndex)
        insideHook = false
        if reagentIndex then
            local _, _, id = strfind(GetTradeSkillReagentItemLink(skillIndex, reagentIndex) or "", "item:(%d+)")
            self.itemID = tonumber(id)
        else
            local _, _, id = strfind(GetTradeSkillItemLink(skillIndex) or "", "item:(%d+)")
            self.itemID = tonumber(id)
        end
        ExtendTooltip(self)
    end

    function tooltip.SetAuctionItem(self, atype, index)
        insideHook = true
        original_SetAuctionItem(self, atype, index)
        insideHook = false
        local _, _, id = strfind(GetAuctionItemLink(atype, index) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetAuctionSellItem(self)
        insideHook = true
        original_SetAuctionSellItem(self)
        insideHook = false
        self.itemID = tonumber(GetItemIDByName(GetAuctionSellItemInfo()))
        ExtendTooltip(self)
    end

    function tooltip.SetTradePlayerItem(self, index)
        insideHook = true
        original_SetTradePlayerItem(self, index)
        insideHook = false
        local _, _, id = strfind(GetTradePlayerItemLink(index) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end

    function tooltip.SetTradeTargetItem(self, index)
        insideHook = true
        original_SetTradeTargetItem(self, index)
        insideHook = false
        local _, _, id = strfind(GetTradeTargetItemLink(index) or "", "item:(%d+)")
        self.itemID = tonumber(id)
        ExtendTooltip(self)
    end
end

HookTooltip(GameTooltip)

local original_SetItemRef = SetItemRef
function SetItemRef(link, text, button)
    local item, _, id = string.find(link, "item:(%d+)")
    ItemRefTooltip.itemID = id
    original_SetItemRef(link, text, button)
    if not IsShiftKeyDown() and not IsControlKeyDown() and item then
        ExtendTooltip(ItemRefTooltip)
    end
end

local original_OnHide = ItemRefTooltip:GetScript("OnHide")
ItemRefTooltip:SetScript("OnHide", function()
    original_OnHide()
    ItemRefTooltip.itemID = nil
end)

AtlasLootTip:SetScript("OnShow", function()
    if aux_frame and aux_frame:IsVisible() then
        if GetMouseFocus():GetParent() then
            if GetMouseFocus():GetParent().row then
                if GetMouseFocus():GetParent().row.record.item_id then
                    GameTooltip.itemID = GetMouseFocus():GetParent().row.record.item_id
                    ExtendTooltip(GameTooltip)
                end
            end
        end
    end
end)

-- adapted from http://shagu.org/ShaguTweaks/
AtlasLootTip.HookAddonOrVariable = function(addon, func)
    local lurker = CreateFrame("Frame", nil)
    lurker.func = func
    lurker:RegisterEvent("ADDON_LOADED")
    lurker:RegisterEvent("VARIABLES_LOADED")
    lurker:RegisterEvent("PLAYER_ENTERING_WORLD")
    lurker:SetScript("OnEvent", function()
        if IsAddOnLoaded(addon) or getglobal(addon) then
            this:func()
            this:UnregisterAllEvents()
        end
    end)
end

AtlasLootTip.HookAddonOrVariable("Tmog", function()
    HookTooltip(TmogTooltip)
end)

-- Debug function to test item source lookup
function AtlasLootTip_TestItemSource(itemID)
    if not itemID then
        print("Usage: AtlasLootTip_TestItemSource(itemID)")
        return
    end
    print("=== Testing item source lookup for itemID " .. tostring(itemID) .. " ===")
    local source = FindItemSource(itemID)
    if source then
        print("Result: Source found - " .. tostring(source))
    else
        print("Result: No source found")
    end
    print("=== Test completed ===")
end

-- Debug function to check available data sources
function AtlasLootTip_CheckDataSources()
    print("=== Checking available data sources ===")
    print("AtlasTWOptions: " .. tostring(AtlasTWOptions))
    if AtlasTWOptions then
        print("AtlasTWOptions.LootShowSource: " .. tostring(AtlasTWOptions.LootShowSource))
    end
    print("AtlasLoot_Data: " .. tostring(AtlasLoot_Data))
    if AtlasLoot_Data then
        local count = 0
        for k, v in pairs(AtlasLoot_Data) do
            count = count + 1
            print("  Data source: " .. tostring(k) .. " (type: " .. type(v) .. ")")
        end
        print("  Total data sources: " .. count)
    end
    print("AtlasTW: " .. tostring(AtlasTW))
    if AtlasTW and AtlasTW.InstanceData then
        local count = 0
        for k, v in pairs(AtlasTW.InstanceData) do
            count = count + 1
            print("  Instance: " .. tostring(k) .. " (type: " .. type(v) .. ")")
        end
        print("  Total instances: " .. count)
    end
    print("=== Check completed ===")
end