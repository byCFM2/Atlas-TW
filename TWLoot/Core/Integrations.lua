---
--- Integrations.lua - Third-party addon integration management
---
--- This module handles integration with external addons such as EquipCompare,
--- EQCompare. It provides centralized management of
--- addon compatibility, tooltip registration, and option handling.
---
--- Features:
--- • EquipCompare/EQCompare tooltip registration
--- • Addon availability detection
--- • Option state management
--- • Fallback handling for missing addons
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.Integrations = AtlasTW.Integrations or {}
local GREY = (AtlasTW.Colors and AtlasTW.Colors.GREY2) or "|cff808080"

-- Local references for performance
local L = AtlasTW.Localization.UI

---
--- Checks if EquipCompare or EQCompare addon is available
--- @return boolean True if either addon is loaded
--- @usage local hasEquipCompare = AtlasTW.Integrations.HasEquipCompare()
---
function AtlasTW.Integrations.HasEquipCompare()
    return IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare") or AtlasTW.Integrations.HasShaguTweaks()
end

---
--- Checks if ShaguTweaks Equip Compare module is available and enabled
--- @return boolean True if ShaguTweaks Equip Compare is enabled
---
function AtlasTW.Integrations.HasShaguTweaks()
    return IsAddOnLoaded("ShaguTweaks") and ShaguTweaks_config and ShaguTweaks_config["Equip Compare"] == 1
end

---
--- Checks if pfQuest addon is available
--- @return boolean True if pfQuest is loaded
--- @usage local hasPfQuest = AtlasTW.Integrations.HasPfQuest()
---
function AtlasTW.Integrations.HasPfQuest()
    return pfBrowser ~= nil
end

---
--- Checks if an item can be purchased from a vendor.
--- Relies on pfQuest database or a small hardcoded lookup for common items.
--- @param itemID number The item ID to check
--- @return boolean True if it's a vendor item
---
local vendorItems = {
    [2320] = true,  -- Coarse Thread
    [2321] = true,  -- Fine Thread
    [4291] = true,  -- Silken Thread
    [8343] = true,  -- Heavy Silken Thread
    [14341] = true, -- Rune Thread
    [2324] = true,  -- Bleach
    [2325] = true,  -- Black Dye
    [2604] = true,  -- Red Dye
    [2605] = true,  -- Green Dye
    [4340] = true,  -- Gray Dye
    [4341] = true,  -- Yellow Dye
    [4342] = true,  -- Purple Dye
    [6260] = true,  -- Blue Dye
    [6261] = true,  -- Orange Dye
    [10290] = true, -- Pink Dye
    [818] = true,   -- Polishing Oil
    [17020] = true, -- Shining Polish
    [2880] = true,  -- Weak Flux
    [3466] = true,  -- Strong Flux
    [10271] = true, -- Phial of Phantasm
    [3371] = true,  -- Empty Vial
    [3372] = true,  -- Leaded Vial
    [8925] = true,  -- Crystal Vial
    [18256] = true, -- Imbued Vial
    [4289] = true,  -- Salt
    [2692] = true,  -- Hot Spices
    [2678] = true,  -- Mild Spices
    [3713] = true,  -- Soothing Spices
    [8939] = true,  -- Holiday Spices
    [4536] = true,  -- Shiny Red Apple
    [17056] = true, -- Holiday Spirits
    [2894] = true,  -- Rhapsody Malt
    [159] = true,   -- Refreshing Spring Water
    [2665] = true,  -- Stormwind Seasoning Herbs
    [14491] = true, -- Simple Wood
    [6217] = true,  -- Copper Rod
    [4471] = true,  -- Unlit Poor Torch
    [18288] = true,  -- Molasses Firewater
    [50231] = true,  -- Sturdy Rope
    [7011] = true,  -- Rugged String
    [42006] = true,  -- Springy Rope
    [42005] = true,  -- Remedy Herbs
}

local vendorCache = {}

function AtlasTW.Integrations.IsVendorItem(itemID)
    if not itemID then return false end

    if vendorCache[itemID] ~= nil then return vendorCache[itemID] end

    if vendorItems[itemID] then
        vendorCache[itemID] = true
        return true
    end

--[[     -- pfQuest DB fallback
    if pfDB and pfDB.items and pfDB.items.data then
        local itemData = pfDB.items.data[itemID]
        if itemData and type(itemData) == "table" and itemData["V"] then
            vendorCache[itemID] = true
            return true
        end
    end ]]

    vendorCache[itemID] = false
    return false
end

---
--- Searches for a query in pfQuest
--- @param query string The text to search for
--- @return nil
--- @usage AtlasTW.Integrations.SearchPfQuest("Hearthstone")
---
function AtlasTW.Integrations.SearchPfQuest(query)
    local clearquery = AtlasTW.LootUtils.StripFormatting(query)
    if AtlasTW.Integrations.HasPfQuest() and clearquery then
        pfBrowser:Show()
        if pfBrowser.input then
            pfBrowser.input:SetText(clearquery)
        end
    end
end

---
--- Shows a specific quest in pfQuest map
--- @param questName string The name of the quest to show
--- @return nil
--- @usage AtlasTW.Integrations.ShowQuestInPfQuest("Quest Name")
---
function AtlasTW.Integrations.ShowQuestInPfQuest(questName)
    if not AtlasTW.Integrations.HasPfQuest() then return end

    -- Clean up quest name (remove level prefix if present)
    -- Example: "14) Quest Name" -> "Quest Name"
    local cleanName = string.gsub(questName, "^%d+%) ", "")

    -- Search specifically for quest
    local maps = pfDatabase:SearchQuest(cleanName)
    if maps and next(maps) then
        pfMap:ShowMapID(pfDatabase:GetBestMap(maps))
        --PrintA(AtlasTW.Colors.GREEN .. "Found quest location in pfQuest: " .. AtlasTW.Colors.WHITE .. cleanName)
    else
        -- PrintA(AtlasTW.Colors.RED .. "Quest not found in pfQuest: " .. AtlasTW.Colors.WHITE .. cleanName)
    end
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
--- ShaguTweaks Comparison Integration
--- This logic is adapted from ShaguTweaks/mods/equip-compare.lua
---

local shaguSlots = nil
local shaguSlotsOther = nil

local function InitializeShaguSlotTables()
    if shaguSlots then return end

    shaguSlots = {
        [INVTYPE_2HWEAPON or "Two-Hand"] = "MainHandSlot",
        [INVTYPE_BODY or "Shirt"] = "ShirtSlot",
        [INVTYPE_CHEST or "Chest"] = "ChestSlot",
        [INVTYPE_CLOAK or "Back"] = "BackSlot",
        [INVTYPE_FEET or "Feet"] = "FeetSlot",
        [INVTYPE_FINGER or "Finger"] = "Finger0Slot",
        [INVTYPE_HAND or "Hands"] = "HandsSlot",
        [INVTYPE_HEAD or "Head"] = "HeadSlot",
        [INVTYPE_HOLDABLE or "Held In Off-hand"] = "SecondaryHandSlot",
        [INVTYPE_LEGS or "Legs"] = "LegsSlot",
        [INVTYPE_NECK or "Neck"] = "NeckSlot",
        [INVTYPE_RANGED or "Ranged"] = "RangedSlot",
        [INVTYPE_RELIC or "Relic"] = "RangedSlot",
        [INVTYPE_ROBE or "Robe"] = "ChestSlot",
        [INVTYPE_SHIELD or "Shield"] = "SecondaryHandSlot",
        [INVTYPE_SHOULDER or "Shoulder"] = "ShoulderSlot",
        [INVTYPE_TABARD or "Tabard"] = "TabardSlot",
        [INVTYPE_TRINKET or "Trinket"] = "Trinket0Slot",
        [INVTYPE_WAIST or "Waist"] = "WaistSlot",
        [INVTYPE_WEAPON or "One-Hand"] = "MainHandSlot",
        [INVTYPE_WEAPONMAINHAND or "Main-Hand"] = "MainHandSlot",
        [INVTYPE_WEAPONOFFHAND or "Off-Hand"] = "SecondaryHandSlot",
        [INVTYPE_WRIST or "Wrist"] = "WristSlot",
        [INVTYPE_WAND or "Wand"] = "RangedSlot",
        [INVTYPE_GUN or "Gun"] = "RangedSlot",
        [INVTYPE_PROJECTILE or "Projectile"] = "AmmoSlot",
        [INVTYPE_CROSSBOW or "Crossbow"] = "RangedSlot",
        [INVTYPE_THROWN or "Thrown"] = "RangedSlot",
    }

    -- Add variants for multiple slots
    shaguSlotsOther = {
        [INVTYPE_FINGER or "Finger"] = "Finger1Slot",
        [INVTYPE_TRINKET or "Trinket"] = "Trinket1Slot",
        [INVTYPE_WEAPON or "One-Hand"] = "SecondaryHandSlot",
    }
end

local function AddShaguHeader(tooltip)
    local name = tooltip:GetName()
    local sides = { "Left", "Right" }

    -- shift all entries one line down
    for i = tooltip:NumLines(), 1, -1 do
        for _, side in pairs(sides) do
            local current = _G[name .. "Text" .. side .. i]
            local below = _G[name .. "Text" .. side .. i + 1]

            if current and current:IsShown() then
                local text = current:GetText()
                local r, g, b = current:GetTextColor()

                if text and text ~= "" then
                    if tooltip:NumLines() < i + 1 then
                        -- add new line if required
                        tooltip:AddLine(text, r, g, b, true)
                    else
                        -- update existing lines
                        below:SetText(text)
                        below:SetTextColor(r, g, b)
                        below:Show()

                        -- hide processed line
                        current:Hide()
                    end
                end
            end
        end
    end

    -- add label to first line
    _G[name .. "TextLeft1"]:SetTextColor(.5, .5, .5, 1)
    _G[name .. "TextLeft1"]:SetText(L["Currently Equipped"])
    _G[name .. "TextLeft1"]:Show()

    -- update tooltip sizes
    tooltip:Show()
end

local function ShowShaguCompare(tooltip)
    -- abort if shift is not pressed
    if not IsShiftKeyDown() then
        ShoppingTooltip1:Hide()
        ShoppingTooltip2:Hide()
        return
    end

    InitializeShaguSlotTables()

    for i = 1, tooltip:NumLines() do
        local tmpText = _G[tooltip:GetName() .. "TextLeft" .. i]
        local slotType = tmpText:GetText()

        if slotType and shaguSlots[slotType] then
            local slotName = shaguSlots[slotType]
            local slotID = GetInventorySlotInfo(slotName)

            -- determine screen part
            local x = GetCursorPosition() / UIParent:GetEffectiveScale()
            local anchor = x < GetScreenWidth() / 2 and "TOPLEFT" or "TOPRIGHT"
            local relative = x < GetScreenWidth() / 2 and "TOPRIGHT" or "TOPLEFT"

            -- overwrite position for tooltips without owner
            local pos, parent = tooltip:GetPoint()
            if parent and parent == UIParent and pos == "TOPRIGHT" then
                anchor = "TOPRIGHT"
                relative = "TOPLEFT"
            end

            -- first tooltip
            ShoppingTooltip1:SetOwner(tooltip, "ANCHOR_NONE")
            ShoppingTooltip1:ClearAllPoints()
            ShoppingTooltip1:SetPoint(anchor, tooltip, relative, 0, 0)
            ShoppingTooltip1:SetInventoryItem("player", slotID)
            ShoppingTooltip1:Show()
            AddShaguHeader(ShoppingTooltip1)

            -- second tooltip
            if shaguSlotsOther[slotType] then
                local slotID_other = GetInventorySlotInfo(shaguSlotsOther[slotType])
                ShoppingTooltip2:SetOwner(tooltip, "ANCHOR_NONE")
                ShoppingTooltip2:ClearAllPoints()
                if ShoppingTooltip1:IsShown() then
                    ShoppingTooltip2:SetPoint(anchor, ShoppingTooltip1, relative, 0, 0)
                else
                    ShoppingTooltip2:SetPoint(anchor, tooltip, relative, 0, 0)
                end
                ShoppingTooltip2:SetInventoryItem("player", slotID_other)
                ShoppingTooltip2:Show()
                AddShaguHeader(ShoppingTooltip2)
            end
            return -- Found and handled
        end
    end
end

local shaguHookFrame = nil

function AtlasTW.Integrations.ApplyShaguTweaksIntegration()
    if AtlasTW.Integrations.HasShaguTweaks() and AtlasTWOptions.LootEquipCompare == true then
        if not shaguHookFrame then
            shaguHookFrame = CreateFrame("Frame")
            shaguHookFrame:SetScript("OnUpdate", function()
                if AtlasTWLootTooltip and AtlasTWLootTooltip:IsShown() then
                    ShowShaguCompare(AtlasTWLootTooltip)
                end
                if AtlasTWLootTooltip2 and AtlasTWLootTooltip2:IsShown() then
                    ShowShaguCompare(AtlasTWLootTooltip2)
                end
            end)
        else
            shaguHookFrame:Show()
        end
    elseif shaguHookFrame then
        shaguHookFrame:Hide()
    end
end

---
--- Initializes all addon integrations and sets up option states
--- Disables unavailable addon options and provides fallback handling
--- @return nil
--- @usage AtlasTW.Integrations.Initialize() -- Called during addon initialization
---
function AtlasTW.Integrations.Initialize()
    -- Disable EquipCompare option if addon is not available
    if not AtlasTW.Integrations.HasEquipCompare() then
        if AtlasTWOptionEquipCompare then
            AtlasTWOptionEquipCompare:Disable()
        end
        if AtlasTWOptionEquipCompareText then
            AtlasTWOptionEquipCompareText:SetText(GREY .. L["Use EquipCompare"])
        end
    else
        -- Initialize integration if available
        AtlasTW.Integrations.ApplyEquipCompareIntegration()
    end
end

---
--- Validates and corrects addon option states
--- Ensures options are disabled if supporting addons are not available
--- @return nil
--- @usage AtlasTW.Integrations.ValidateOptions() -- Called during option validation
---
function AtlasTW.Integrations.ValidateOptions()
    -- Disable EquipCompare option if addon is missing
    if not AtlasTW.Integrations.HasEquipCompare() and AtlasTWOptions.LootEquipCompare == true then
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
    if AtlasTWOptions.LootEquipCompare == true then
        -- Integration with ShaguTweaks
        if AtlasTW.Integrations.HasShaguTweaks() then
            AtlasTW.Integrations.ApplyShaguTweaksIntegration()
        end

        -- Integration with EquipCompare/EQCompare
        if IsAddOnLoaded("EquipCompare") then
            AtlasTW.Integrations.RegisterEquipCompareTooltips(AtlasTWLootTooltip, AtlasTWLootTooltip2)
        end

        -- Handle EQCompare separately for compatibility
        if IsAddOnLoaded("EQCompare") then
            if EQCompare and EQCompare.RegisterTooltip then
                EQCompare:RegisterTooltip(AtlasTWLootTooltip)
                EQCompare:RegisterTooltip(AtlasTWLootTooltip2)
            end
        end
    else
        -- Unregister everything if disabled
        if IsAddOnLoaded("EquipCompare") then
            AtlasTW.Integrations.UnregisterEquipCompareTooltips(AtlasTWLootTooltip, AtlasTWLootTooltip2)
        end

        if IsAddOnLoaded("EQCompare") then
            if EQCompare and EQCompare.UnRegisterTooltip then
                EQCompare:UnRegisterTooltip(AtlasTWLootTooltip)
                EQCompare:UnRegisterTooltip(AtlasTWLootTooltip2)
            end
        end

        if shaguHookFrame then
            shaguHookFrame:Hide()
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
    AtlasTW.Integrations.ApplyEquipCompareIntegration()
end
