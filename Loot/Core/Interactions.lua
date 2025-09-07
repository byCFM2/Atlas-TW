---
--- Interactions.lua - User interaction event handlers for Atlas-TW
---
--- This module handles all user interaction events including mouse clicks,
--- hover events, and keyboard interactions for the loot browser interface.
--- It provides centralized event handling for item tooltips, navigation,
--- and user interface interactions.
---
--- Features:
--- • Item click event handling (left, right, shift+click)
--- • Mouse enter/leave tooltip management
--- • Boss and menu item click processing
--- • Navigation button event handling
--- • Chat link generation and wish list operations
--- • Container item interaction support
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.Interactions = {}

-- Local references for performance
local L = AtlasTW.Local

-- Tooltip handler map for different item types
local TOOLTIP_HANDLERS = {
    spell = function(spellID, anchor)
        AtlasLootTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
        AtlasLootTooltip:SetSpell(spellID, 1)
        AtlasLootTooltip:Show()
    end,
    enchant = function(enchantID, anchor)
        AtlasLootTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
        AtlasLootTooltip:SetText("Enchant ID: " .. enchantID)
        AtlasLootTooltip:Show()
    end,
    item = function(itemID, dropRate, anchor)
        AtlasLootTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
        AtlasLootTooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
        if dropRate then
            AtlasLootTooltip:AddLine(L["Drop Rate:"] .. " " .. dropRate, 0.2, 0.4, 0.3)
        end
        if AtlasTWOptions.LootItemIDs then
            AtlasLootTooltip:AddLine("|cff0070dd" .. L["ItemID:"] .. " " .. itemID, nil, nil, nil, 1)
        end
        AtlasLootTooltip:Show()
    end,
}

---
--- Generates a chat link for an item
--- Creates properly formatted item links for chat output
--- @param id number Item ID to create link for
--- @return string Formatted chat link
--- @usage local link = AtlasTW.Interactions.GetChatLink(12345)
--- @since 1.0.0
---
function AtlasTW.Interactions.GetChatLink(id)
    local itemName, itemLink, itemQuality = GetItemInfo(tonumber(id))
    if not itemName or not itemLink or not itemQuality then
        -- If item is not cached, return simple link
        return "[Item:" .. tostring(id) .. "]"
    end

    local _, _, _, colorCode = GetItemQualityColor(itemQuality)
    local colorHex = string.sub(colorCode, 2)
    return "\124" .. colorHex .. "\124H" .. itemLink .. "\124h[" .. itemName .. "]\124h\124r"
end

---
--- Handles mouse enter events on loot item buttons
--- Shows appropriate tooltip based on item type (item, spell, enchant)
--- @return nil
--- @usage AtlasLootItem_OnEnter() -- Called automatically on mouse enter
--- @since 1.0.0
---
function AtlasLootItem_OnEnter()
    if not this or not this.typeID or this.typeID == 0 or this.typeID == "" then
        return
    end

    local itemType = this.typeID
    local handler = TOOLTIP_HANDLERS[itemType]

    if handler then
        -- Call appropriate handler, passing necessary parameters
        if itemType == "spell" or itemType == "enchant" then
            handler(this.elemID, this)
        elseif itemType == "item" then
            handler(this.itemID, this.droprate, this)
        end
    end
end

---
--- Handles mouse leave events on loot item buttons
--- Hides all active tooltips when mouse cursor leaves the item
--- @return nil
--- @usage AtlasLootItem_OnLeave() -- Called automatically on mouse leave
--- @since 1.0.0
---
function AtlasLootItem_OnLeave()
    -- Hide the necessary tooltips
    if AtlasTWOptions.LootlinkTT then
        AtlasLootTooltip:Hide()
        AtlasLootTooltip2:Hide()
    elseif AtlasTWOptions.LootItemSyncTT then
        if GameTooltip:IsVisible() then
            GameTooltip:Hide()
            AtlasLootTooltip2:Hide()
        end
    else
        if this.itemID ~= nil then
            AtlasLootTooltip:Hide()
            GameTooltip:Hide()
            AtlasLootTooltip2:Hide()
        end
    end

    if ShoppingTooltip2:IsVisible() or ShoppingTooltip1.IsVisible then
        ShoppingTooltip2:Hide()
        ShoppingTooltip1:Hide()
    end
end

---
--- Handles click events on loot item buttons
--- Processes item links, wish list operations, and chat output based on click type
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return nil
--- @usage AtlasLootItem_OnClick("LeftButton") -- Called by item button clicks
--- @since 1.0.0
---
function AtlasLootItem_OnClick(arg1)
    local id = this:GetID()
    local color = string.sub(_G["AtlasLootItem_"..id.."_Name"]:GetText() or "", 1, 10)
    local name = string.sub(_G["AtlasLootItem_"..id.."_Name"]:GetText() or "", 11)
    local texture = AtlasLoot_Strsplit("\\", getglobal("AtlasLootItem_"..id.."_Icon"):GetTexture(), 0, true)
    local dataID = AtlasLootItemsFrame.StoredElement
    local instanceKeyClick = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil
    local dataSource = AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKeyClick)

    if this.typeID == "item" then
        local itemName, itemLink, qualityId = GetItemInfo(this.itemID)
        _, _, _, color = GetItemQualityColor(qualityId or 0)

        -- If shift-clicked, link in the chat window
        if IsShiftKeyDown() and not itemName and this.itemID ~= 0 then
            if AtlasTWOptions.LootSafeLinks then
                if WIM_EditBoxInFocus then
                    WIM_EditBoxInFocus:Insert("["..itemName.."]")
                elseif ChatFrameEditBox:IsVisible() then
                    ChatFrameEditBox:Insert("["..itemName.."]")
                else
                    AtlasLoot_SayItemReagents(this.itemID, nil, itemName, true)
                end
            elseif AtlasTWOptions.LootAllLinks then
                if WIM_EditBoxInFocus then
                    WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r")
                elseif ChatFrameEditBox:IsVisible() then
                    ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r")
                end
            end
        -- Control+click for dressing room
        elseif IsControlKeyDown() and itemName then
            DressUpItemLink(itemLink)
        -- Alt+click for wish list operations
        elseif IsAltKeyDown() and this.itemID ~= 0 then
            local ElemName = AtlasLootItemsFrame.StoredElement
            local instKey = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil

            if ElemName == "WishList" then
                AtlasLoot_DeleteFromWishList(this.itemID)
            elseif ElemName == "SearchResult" then
                AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
            else
                local srcPage = nil
                if ElemName and instKey then
                    srcPage = ElemName.."|"..instKey
                elseif ElemName and AtlasLoot_IsLootTableAvailable and AtlasLoot_IsLootTableAvailable(ElemName) then
                    -- Craft/set/other loot table page without instanceKey
                    srcPage = ElemName
                end
                AtlasLoot_AddToWishlist(this.itemID, ElemName, instKey, "item", srcPage)
            end
        end
    end
end

---
--- Handles click events on boss/element buttons in the Atlas frame
--- Shows or hides the loot frame and loads appropriate loot data
--- @param buttonName string Name of the clicked button (unused parameter)
--- @return nil
--- @usage AtlasLootBoss_OnClick() -- Called by button click events
--- @since 1.0.0
---
function AtlasLootBoss_OnClick(buttonName)
    -- Reset scroll position to top
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
    AtlasLootScrollBarScrollBar:SetValue(0)

    local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local id = this.idnum
    local elemName = AtlasTW.ScrollList[id].name
    local lootTable = AtlasTW.DataResolver.GetLootByElemName(elemName, zoneID)

    if AtlasLootItemsFrame.activeElement == id then
        AtlasLootItemsFrame:Hide()
        AtlasLootItemsFrame.activeElement = nil
    else
        -- Get the loot table for the element, either by name or by ID
        if lootTable then
            -- Store the loot table, boss name and navigation pages
            AtlasLootItemsFrame.StoredElement = elemName
            AtlasLootItemsFrame.StoredMenu = zoneID
            AtlasLootItemsFrame.activeElement = id

            -- Update the loot display
            AtlasTW.Loot.ScrollBarLootUpdate()
            AtlasLootItemsFrame:Show()
        end
    end
end

---
--- Handles menu item click events in the loot browser
--- Processes container display or loads loot data based on menu selection
--- @param button string Button identifier for the clicked menu item
--- @return nil
--- @usage AtlasLootMenuItem_OnClick("button1") -- Called by menu item clicks
--- @since 1.0.0
---
function AtlasLootMenuItem_OnClick(button)
    if this.container then
        AtlasLoot_ShowContainerFrame()
        return
    end

    -- Reset scroll position to top
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)

    -- Get the table source and data ID
    local dataID = this.name_orig or this.name
    local TableSource = this.lootpage
    local pagename

    if this.isheader == nil or this.isheader == false then
        pagename = _G[this:GetName().."_Name"]:GetText()

        -- Reliable instance determination by click name
        local effectiveInstanceKey, effectiveFirstBoss
        if type(dataID) == "string" and AtlasTW and AtlasTW.MenuData and AtlasTW.MenuData.Dungeons then
            for _, entry in ipairs(AtlasTW.MenuData.Dungeons) do
                if entry and entry.name_orig == dataID and entry.lootpage then
                    effectiveInstanceKey = entry.lootpage
                    effectiveFirstBoss = entry.firstBoss
                    break
                end
            end
        end

        if not effectiveInstanceKey then
            effectiveInstanceKey = this.lootpage
            effectiveFirstBoss = this.firstBoss
        end

        -- Store the selected element and update display
        AtlasLootItemsFrame.StoredElement = dataID
        AtlasLootItemsFrame.StoredMenu = effectiveInstanceKey
        AtlasTW.Loot.ScrollBarLootUpdate()
        AtlasLootItemsFrame:Show()
    end
end

---
--- Handles navigation button clicks (Previous, Next, Back)
--- Processes navigation between loot pages and menu sections
--- @return nil
--- @usage AtlasLoot_NavButton_OnClick() -- Called by navigation button clicks
--- @since 1.0.0
---
function AtlasLoot_NavButton_OnClick()
    -- Reset scroll on navigation
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
    AtlasLootScrollBarScrollBar:SetValue(0)

    if not this or not this.lootpage then
        return print("NavButton_OnClick: exit - no this or lootpage")
    end

    -- Handle "Back" button to parent menu (case insensitive + fallback from title)
    if this == _G["AtlasLootItemsFrame_BACK"] then
        local lpLower = string.lower(this.lootpage or "")
        if lpLower == "backtomenu" then
            local targetMenu = AtlasLootItemsFrame.StoredBackMenuName or this.title
            if targetMenu then
                AtlasLoot_OpenMenu(targetMenu)
                AtlasLootItemsFrame.StoredBackMenuName = nil
            else
                _G["AtlasLootItemsFrame_BACK"]:Hide()
            end
            return
        end
    end

    -- Handle "Back" button to dungeons menu
    if this == _G["AtlasLootItemsFrame_BACK"] and this.lootpage == "DUNGEONSMENU" then
        AtlasLoot_OpenMenu(L["Dungeons & Raids"])
        return
    end

    local lp = this.lootpage

    -- Check if this is rare mobs navigation
    local isRareMobNavigation = false
    local rareMobsData = AtlasTW.InstanceData.RareMobs
    if rareMobsData and rareMobsData.Bosses then
        for _, boss in ipairs(rareMobsData.Bosses) do
            if boss.name == lp then
                isRareMobNavigation = true
                break
            end
        end
    end

    -- Process navigation based on type
    if isRareMobNavigation then
        -- Handle rare mob navigation
        AtlasLootItemsFrame.StoredElement = lp
        AtlasLootItemsFrame.StoredMenu = "RareMobs"
    else
        -- Handle regular navigation
        AtlasLootItemsFrame.StoredElement = lp
        if this.instanceKey then
            AtlasLootItemsFrame.StoredMenu = this.instanceKey
        end
    end

    -- Update the display
    AtlasTW.Loot.ScrollBarLootUpdate()
end

---
--- Handles close button click on the loot items frame
--- Resets active element selection and updates boss button display states
--- @return nil
--- @usage AtlasLootItemsFrame_OnCloseButton() -- Called by close button click
--- @since 1.0.0
---
function AtlasLootItemsFrame_OnCloseButton()
    -- Set no loot table as currently selected
    AtlasLootItemsFrame.activeElement = nil

    -- Fix the boss buttons so the correct icons are displayed
    if AtlasFrame and AtlasFrame:IsVisible() then
        if AtlasTW.CurrentLine then
            for i = 1, AtlasTW.CurrentLine do
                if _G["AtlasBossLine"..i.."_Selected"]:IsVisible() then
                    _G["AtlasBossLine"..i.."_Selected"]:Hide()
                    _G["AtlasBossLine"..i.."_Loot"]:Show()
                end
            end
        end
    end

    -- Hide the item frame
    AtlasLootItemsFrame:Hide()
end

---
--- Handles click events on container items
--- Processes item links and chat output for container items
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return nil
--- @usage AtlasLoot_ContainerItem_OnClick("LeftButton") -- Called by container item clicks
--- @since 1.0.1
---
function AtlasLoot_ContainerItem_OnClick(arg1)
    local itemID = this:GetID()
    local name, link, quality, _, _, _, _, _, tex = GetItemInfo(itemID)
    local _, _, _, color = GetItemQualityColor(quality)
    tex = string.gsub(tex, "Interface\\Icons\\", "")

    if IsShiftKeyDown() and arg1 == "LeftButton" then
        if AtlasTWOptions.LootAllLinks then
            if WIM_EditBoxInFocus then
                WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..itemID.."\124h["..name.."]|h|r")
            elseif ChatFrameEditBox:IsVisible() then
                ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..itemID.."\124h["..name.."]|h|r")
            end
        end
    elseif IsControlKeyDown() and name then
        DressUpItemLink(link)
    elseif IsAltKeyDown() and itemID ~= 0 then
        local ElemName = AtlasLootItemsFrame.StoredElement
        local instKey = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil

        if ElemName == "WishList" then
            AtlasLoot_DeleteFromWishList(this.itemID)
        elseif ElemName == "SearchResult" then
            AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(itemID))
        else
            local srcPage = nil
            if ElemName and instKey then
                srcPage = ElemName.."|"..instKey
            elseif ElemName and AtlasLoot_IsLootTableAvailable and AtlasLoot_IsLootTableAvailable(ElemName) then
                -- Craft/set/other loot table page without instanceKey
                srcPage = ElemName
            end
            AtlasLoot_AddToWishlist(itemID, ElemName, instKey, "item", srcPage)
        end
    end
end