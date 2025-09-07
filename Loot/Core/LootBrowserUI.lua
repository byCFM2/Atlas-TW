---
--- LootBrowserUI.lua - Loot browser user interface functionality
--- 
--- This module handles the user interface components for the loot browser.
--- It manages scrollbar updates, boss line rendering, and visual state management
--- for the Atlas loot display system.
--- 
--- Features:
--- - Boss list scrollbar management
--- - Loot items scrollbar management
--- - Visual state indicators (loot available, selected)
--- - Boss line element creation and updates
--- - Frame visibility and interaction handling
--- 
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.LootBrowserUI = AtlasTW.LootBrowserUI or {}

-- Instance required libraries
local L = AtlasTW.Local

---
--- Updates the scroll bar display for Atlas boss list
--- Manages visibility and state of boss line elements based on scroll position
--- Handles loot indicators and selection highlighting
--- @return void
--- @usage AtlasTW.LootBrowserUI.ScrollBarUpdate()
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.ScrollBarUpdate()
    local lineplusoffset
    local highlightTexture

    if _G["AtlasBossLine1_Text"] ~= nil then
        local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]

        -- Update the contents of the Atlas scroll frames
        FauxScrollFrame_Update(AtlasTWScrollBar, AtlasTW.CurrentLine, AtlasTW.NUM_LINES, 15)

        -- Now show only needed elements
        for line = 1, AtlasTW.NUM_LINES do
            lineplusoffset = line + FauxScrollFrame_GetOffset(AtlasTWScrollBar)
            local bossLine = _G["AtlasBossLine"..line]

            if bossLine and lineplusoffset <= AtlasTW.CurrentLine then
                -- Enable interactivity and texture for visible buttons
                bossLine:Show()
                bossLine:EnableMouse(true)
                highlightTexture = bossLine:GetHighlightTexture()
                highlightTexture:Show()

                local loot = _G["AtlasBossLine"..line.."_Loot"]
                local selected = _G["AtlasBossLine"..line.."_Selected"]
                _G["AtlasBossLine"..line.."_Text"]:SetText(AtlasTW.ScrollList[lineplusoffset].line)

                -- Check if this boss has loot data
                local hasLoot = AtlasTW.DataResolver.AtlasTW.DataResolver.GetLootByID(zoneID, lineplusoffset)

                if AtlasLootItemsFrame.activeElement == lineplusoffset then
                    bossLine:Enable()
                    loot:Hide()
                    selected:Show()
                elseif hasLoot then
                    bossLine:Enable()
                    loot:Show()
                    selected:Hide()
                else
                    bossLine:Disable()
                    loot:Hide()
                    selected:Hide()
                end

                bossLine.idnum = lineplusoffset
                bossLine:Show()
            elseif bossLine then
                -- Hide lines that are not needed
                bossLine:Hide()
                -- Completely disable interactivity
                bossLine:EnableMouse(false)
                -- Hide HighlightTexture explicitly
                highlightTexture = bossLine:GetHighlightTexture()
                if highlightTexture then
                    highlightTexture:Hide()
                end
            end
        end
    end
end

---
--- Updates the scrollbar and content for the loot items frame
--- Loads and displays loot data for the currently selected element
--- @return nil
--- @usage AtlasTW.LootBrowserUI.ScrollBarLootUpdate() -- Called when loot data changes
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
    -- Load data for the current clicked element line
    local dataID = AtlasLootItemsFrame.StoredElement
    local instanceKey = (AtlasLootItemsFrame and type(AtlasLootItemsFrame.StoredMenu) == "string") and AtlasLootItemsFrame.StoredMenu or nil
    local dataSource = AtlasTW.DataResolver.AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKey) or AtlasLootItemsFrame.StoredMenu

    -- Special handling for wish list and search results
    if type(dataSource) == "table" and dataSource.wishlist then
        AtlasTW.LootBrowserUI.DisplayWishList(dataSource.wishlist)
        return
    end

    if type(dataSource) == "table" and dataSource.searchResults then
        AtlasTW.LootBrowserUI.DisplaySearchResults(dataSource.searchResults)
        return
    end

    -- Handle menu data
    if type(dataSource) == "table" and not dataSource[1] then
        AtlasTW.LootBrowserUI.DisplayMenuData(dataSource)
        return
    end

    -- Handle regular loot data
    if type(dataSource) == "table" then
        AtlasTW.LootBrowserUI.DisplayLootData(dataSource)
    else
        AtlasTW.LootBrowserUI.ClearLootDisplay()
    end

    -- Show the loot frame
    AtlasLootItemsFrame:Show()
end

---
--- Displays wish list items in the loot frame
--- @param wishlistData table Wish list data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplayWishList(wishlistData)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.DisplayWishList(wishlistData)
    -- Implementation for wish list display
    -- This would handle the specific formatting and display of wish list items
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not wishlistData or table.getn(wishlistData) == 0 then
        return
    end

    -- Display wish list items
    for i, item in ipairs(wishlistData) do
        if i <= AtlasTW.NUM_LOOT_LINES then
            AtlasTW.LootBrowserUI.SetLootLine(i, item)
        end
    end
end

---
--- Displays search results in the loot frame
--- @param searchResults table Search results data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplaySearchResults(searchResults)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.DisplaySearchResults(searchResults)
    -- Implementation for search results display
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not searchResults or table.getn(searchResults) == 0 then
        return
    end

    -- Display search results
    for i, item in ipairs(searchResults) do
        if i <= AtlasTW.NUM_LOOT_LINES then
            AtlasTW.LootBrowserUI.SetLootLine(i, item)
        end
    end
end

---
--- Displays menu data in the loot frame
--- @param menuData table Menu data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplayMenuData(menuData)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.DisplayMenuData(menuData)
    -- Implementation for menu data display
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not menuData then
        return
    end

    local lineIndex = 1
    for _, item in pairs(menuData) do
        if lineIndex <= AtlasTW.NUM_LOOT_LINES then
            AtlasTW.LootBrowserUI.SetLootLine(lineIndex, item)
            lineIndex = lineIndex + 1
        end
    end
end

---
--- Displays regular loot data in the loot frame
--- @param lootData table Loot data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplayLootData(lootData)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.DisplayLootData(lootData)
    -- Implementation for regular loot data display
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not lootData or table.getn(lootData) == 0 then
        return
    end

    -- Update scrollbar for loot items
    local numItems = table.getn(lootData)
    FauxScrollFrame_Update(AtlasLootScrollBar, numItems, AtlasTW.NUM_LOOT_LINES, 16)

    local offset = FauxScrollFrame_GetOffset(AtlasLootScrollBar)

    -- Display loot items
    for i = 1, AtlasTW.NUM_LOOT_LINES do
        local itemIndex = i + offset
        if itemIndex <= numItems then
            AtlasTW.LootBrowserUI.SetLootLine(i, lootData[itemIndex])
        else
            AtlasTW.LootBrowserUI.ClearLootLine(i)
        end
    end
end

---
--- Sets the content of a specific loot line
--- @param lineIndex number Line index to set (1-based)
--- @param itemData table Item data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.SetLootLine(1, itemData)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.SetLootLine(lineIndex, itemData)
    if not lineIndex or not itemData then
        return
    end

    local button = _G["AtlasLootItem_"..lineIndex]
    if not button then
        return
    end

    -- Set item data and make visible
    button.itemData = itemData
    button:Show()

    -- Update button appearance based on item data
    if itemData.itemID then
        AtlasTW.LootBrowserUI.UpdateItemButton(button, itemData)
    else
        AtlasTW.LootBrowserUI.UpdateTextButton(button, itemData)
    end
end

---
--- Clears the content of a specific loot line
--- @param lineIndex number Line index to clear (1-based)
--- @return nil
--- @usage AtlasTW.LootBrowserUI.ClearLootLine(1)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.ClearLootLine(lineIndex)
    if not lineIndex then
        return
    end

    local button = _G["AtlasLootItem_"..lineIndex]
    if button then
        button.itemData = nil
        button:Hide()
    end
end

---
--- Clears all loot display lines
--- @return nil
--- @usage AtlasTW.LootBrowserUI.ClearLootDisplay()
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.ClearLootDisplay()
    for i = 1, AtlasTW.NUM_LOOT_LINES or 30 do
        AtlasTW.LootBrowserUI.ClearLootLine(i)
    end
end

---
--- Updates an item button with item data
--- @param button table Button frame to update
--- @param itemData table Item data containing itemID and other properties
--- @return nil
--- @usage AtlasTW.LootBrowserUI.UpdateItemButton(button, itemData)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.UpdateItemButton(button, itemData)
    if not button or not itemData then
        return
    end

    -- Set item icon
    local icon = button:GetNormalTexture()
    if icon and itemData.icon then
        icon:SetTexture(itemData.icon)
    end

    -- Set item text
    local text = _G[button:GetName().."_Text"]
    if text and itemData.name then
        text:SetText(itemData.name)
    end

    -- Set item quality color
    if itemData.quality then
        local color = AtlasLoot_GetItemQualityColor(itemData.quality)
        if text and color then
            text:SetTextColor(color.r, color.g, color.b)
        end
    end
end

---
--- Updates a text button with text data
--- @param button table Button frame to update
--- @param textData table Text data containing text and formatting
--- @return nil
--- @usage AtlasTW.LootBrowserUI.UpdateTextButton(button, textData)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.UpdateTextButton(button, textData)
    if not button or not textData then
        return
    end

    -- Clear item icon
    local icon = button:GetNormalTexture()
    if icon then
        icon:SetTexture(nil)
    end

    -- Set text
    local text = _G[button:GetName().."_Text"]
    if text and textData.text then
        text:SetText(textData.text)

        -- Set text color if specified
        if textData.color then
            text:SetTextColor(textData.color.r or 1, textData.color.g or 1, textData.color.b or 1)
        else
            text:SetTextColor(1, 1, 1) -- Default white
        end
    end
end

---
--- Handles close button click on the loot items frame
--- Resets active element selection and updates boss button display states
--- @return void
--- @usage AtlasTW.LootBrowserUI.OnCloseButton() -- Called by close button click
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.OnCloseButton()
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
--- Prepares and displays a menu in the loot browser
--- @param menuTitle string Title of the menu
--- @param menuItems table Menu items data
--- @param prevMenuText string|nil Previous menu text for back navigation
--- @param defIcon string|nil Default icon for the menu
--- @return nil
--- @usage AtlasTW.LootBrowserUI.PrepMenu("Dungeons", menuData)
--- @since 1.0.0
---
function AtlasTW.LootBrowserUI.PrepMenu(menuTitle, menuItems, prevMenuText, defIcon)
    AtlasLootItemsFrame.StoredElement = { menuName = menuTitle, defaultIcon = defIcon }
    AtlasLootItemsFrame.StoredMenu = menuItems
    AtlasLootItemsFrame.StoredBackMenuName = prevMenuText
    AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
end

-- Backward compatibility - expose functions globally
AtlasTW.Loot.ScrollBarUpdate = AtlasTW.LootBrowserUI.ScrollBarUpdate
AtlasTW.Loot.ScrollBarLootUpdate = AtlasTW.LootBrowserUI.ScrollBarLootUpdate
AtlasTW.Loot.PrepMenu = AtlasTW.LootBrowserUI.PrepMenu
AtlasLootItemsFrame_OnCloseButton = AtlasTW.LootBrowserUI.OnCloseButton