---
--- AtlasTWpfUI.lua - pfUI Integration for Atlas-TW
---
--- This file contains pfUI styling integration for Atlas-TW frames and components.
--- It applies pfUI's CreateBackdrop and CreateBackdropShadow functions to all Atlas
--- frames when pfUI is detected, creating a unified visual style.
---
--- Features:
--- - Automatic detection of pfUI addon
--- - Application of pfUI backdrops to main Atlas frame
--- - Styling of dropdown menus and buttons
--- - Integration with pfUI's border and color system
--- - Styling of loot panel and quest frames
--- - pfUI tooltip integration
---
--- @compatible World of Warcraft 1.12
--- @requires pfUI addon
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

-- Initialize pfUI integration module
AtlasTW.pfUI = {}

---
--- Checks if pfUI addon is loaded and available
--- Also checks if the user has enabled pfUI styling in Atlas options
--- @return boolean - true if pfUI is loaded and enabled
---
local function IsPfUILoaded()
    if not (IsAddOnLoaded("pfUI") and pfUI and pfUI.api and pfUI.api.CreateBackdrop) then
        return false
    end

    -- Check if user has disabled pfUI styling in options
    if AtlasTWOptions and AtlasTWOptions.pfUIEnabled == false then
        return false
    end

    return true
end

---
--- Applies pfUI styling to the main Atlas frame
--- Removes default textures and applies pfUI backdrop
---
local function StyleMainFrame()
    if not AtlasTWFrame then return end

    -- Hide default Atlas textures
    local textures = {
        "AtlasTWMap",
    }

    -- Note: We keep the border textures visible as they define the Atlas window shape
    -- Only hide background if user wants full pfUI integration

    -- Adjust frame strata to work with pfUI
    if AtlasTWFrame.backdrop then
        AtlasTWFrame.backdrop:SetFrameStrata("MEDIUM")
    end

    -- Style the close button (X button)
    if AtlasTWCloseButton then
        -- Close button needs special handling - it's a UIPanelCloseButton template
        -- User requested no large black contour. pfUI might auto-skin it, so we hide its backdrop.
        if AtlasTWCloseButton.backdrop then
            AtlasTWCloseButton.backdrop:Hide()
        end

        AtlasTWCloseButton:SetNormalTexture("")
        AtlasTWCloseButton:SetPushedTexture("")
        AtlasTWCloseButton:SetHighlightTexture("")

        -- Create custom X texture
        if not AtlasTWCloseButton.customX then
            local customX = AtlasTWCloseButton:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            customX:SetPoint("CENTER", 0, 0)
            customX:SetText("×")
            customX:SetTextColor(1, 0.2, 0.2)
            customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            AtlasTWCloseButton.customX = customX
        end

        -- Set fixed size to avoid wide background if any
        AtlasTWCloseButton:SetWidth(20)
        AtlasTWCloseButton:SetHeight(20)
        AtlasTWCloseButton:ClearAllPoints()
        AtlasTWCloseButton:SetPoint("TOPRIGHT", AtlasTWFrame, "TOPRIGHT", -1, -14)

        -- Hover effect
        AtlasTWCloseButton:SetScript("OnEnter", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.4, 0.4)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 22, "OUTLINE")
            end
        end)
        AtlasTWCloseButton:SetScript("OnLeave", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.2, 0.2)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            end
        end)

        AtlasTWCloseButton.pfui_skinned = true
    end

    -- Style the lock button
    if AtlasTWLockButton then
        -- No backdrop for lock button as requested. Hide pfUI auto-backdrop if present.
        if AtlasTWLockButton.backdrop then
            AtlasTWLockButton.backdrop:Hide()
        end

        -- Use textures instead of text for better reliability
        AtlasTWLockButton:SetWidth(20)
        AtlasTWLockButton:SetHeight(20)
        AtlasTWLockButton:ClearAllPoints()
        AtlasTWLockButton:SetPoint("RIGHT", AtlasTWCloseButton, "LEFT", -2, 0)

        -- Hook the toggle function to update display
        local originalOnClick = AtlasTWLockButton:GetScript("OnClick")
        AtlasTWLockButton:SetScript("OnClick", function()
            if originalOnClick then originalOnClick() end
            if AtlasTW.UpdateLock then
                AtlasTW.UpdateLock()
            end
        end)

        if AtlasTW.UpdateLock then
            AtlasTW.UpdateLock()
        end
        AtlasTWLockButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

        AtlasTWLockButton.pfui_skinned = true
    end
end

---
--- Re-applies pfUI styling to a button
--- @param buttonName string - Name of the button to restyle
---
function AtlasTW.pfUI.RestyleButton(buttonName)
    if not IsPfUILoaded() then return end
    local button = _G[buttonName]
    if not button then return end

    if pfUI.api.SkinButton then
        -- If not already skinned, skin it
        if not button.pfui_skinned then
            pfUI.api.SkinButton(button)
            button.pfui_skinned = true
        end

        -- If it was already skinned but textures became visible (e.g. after Show/SetText)
        -- we just hide them instead of re-skinning to avoid multiple backdrops
        if button:GetNormalTexture() and button:GetNormalTexture():IsShown() then
            button:GetNormalTexture():Hide()
        end
        if button:GetPushedTexture() and button:GetPushedTexture():IsShown() then
            button:GetPushedTexture():Hide()
        end
        if button:GetDisabledTexture() and button:GetDisabledTexture():IsShown() then
            button:GetDisabledTexture():Hide()
        end
    end
end

---
--- Skins an arrow button with pfUI style but keeps arrow indication
--- @param button Button - The button to skin
--- @param direction string - Direction of arrow ("left", "right", "up", "down")
---
function AtlasTW.pfUI.SkinArrowButton(button, direction)
    if not IsPfUILoaded() then return end
    if not button then return end

    -- Fix button size (pfUI arrows are small, standard buttons might be too big)
    button:SetWidth(18)
    button:SetHeight(18)

    -- Ensure no backdrop is applied (pfUI arrows are floating textures)
    if button.backdrop then
        button.backdrop:Hide()
    end
    button.pfui_skinned = true

    -- Set pfUI arrow textures
    -- Note: We assume standard pfUI directory structure
    local texturePath = "Interface\\AddOns\\pfUI\\img\\"

    if direction == "left" then
        button:SetNormalTexture(texturePath .. "left")
        button:SetPushedTexture(texturePath .. "left")
        button:SetDisabledTexture(texturePath .. "left")
    elseif direction == "right" then
        button:SetNormalTexture(texturePath .. "right")
        button:SetPushedTexture(texturePath .. "right")
        button:SetDisabledTexture(texturePath .. "right")
    elseif direction == "up" then
        button:SetNormalTexture(texturePath .. "up")
        button:SetPushedTexture(texturePath .. "up")
        button:SetDisabledTexture(texturePath .. "up")
    elseif direction == "down" then
        button:SetNormalTexture(texturePath .. "down")
        button:SetPushedTexture(texturePath .. "down")
        button:SetDisabledTexture(texturePath .. "down")
    end

    -- Adjust Pushed/Disabled visual feedback
    if button:GetPushedTexture() then
        button:GetPushedTexture():SetVertexColor(0.5, 0.5, 0.5)
        button:GetPushedTexture():SetPoint("TOPLEFT", 1, -1) -- Simulate button press offset
    end

    if button:GetDisabledTexture() then
        button:GetDisabledTexture():SetDesaturated(true)
        button:GetDisabledTexture():SetAlpha(0.5)
    end

    button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
end

---
--- Skins an editbox with pfUI style
--- @param editbox EditBox - The editbox to skin
---
function AtlasTW.pfUI.SkinEditBox(editbox)
    if not IsPfUILoaded() then return end
    if not editbox then return end
    if editbox.pfui_skinned then return end

    -- Hide standard WoW editbox textures to prevent "strange border" look
    local name = editbox:GetName()
    if name then
        local left = _G[name .. "Left"]
        local middle = _G[name .. "Middle"]
        local right = _G[name .. "Right"]

        if left then left:Hide() end
        if middle then middle:Hide() end
        if right then right:Hide() end
    end

    -- Also hide any textures attached directly to regions if they are standard borders
    -- (This is a fallback if names don't match or for anonymous frames)
    for _, region in ipairs({ editbox:GetRegions() }) do
        if region:GetObjectType() == "Texture" then
            local texture = region:GetTexture()
            if texture then
                -- Check for standard editbox textures
                if string.find(texture, "Interface\\Common\\Common-Input-Border") or
                    string.find(texture, "Interface\\ChatFrame\\UI-Chat-") then
                    region:Hide()
                end
            end
        end
    end

    if pfUI.api.CreateBackdrop then
        pfUI.api.CreateBackdrop(editbox, nil, true)
    end
    editbox.pfui_skinned = true
end

---
--- Applies pfUI styling to dropdown buttons
--- Styles the category and map selection dropdowns
---
local function StyleDropdowns()
    local dropdowns = {
        AtlasTWFrameDropDownType,
        AtlasTWFrameDropDown,
    }

    for _, dropdown in ipairs(dropdowns) do
        if dropdown then
            -- Apply pfUI backdrop
            pfUI.api.CreateBackdrop(dropdown, nil, true, 0.8)

            -- Adjust colors to match pfUI
            if dropdown.backdrop then
                local r, g, b, a = pfUI.api.GetStringColor(pfUI_config.appearance.border.background)
                dropdown.backdrop:SetBackdropColor(r, g, b, a)
            end
        end
    end
end

---
--- Applies pfUI styling to buttons
--- Styles all major buttons in the Atlas interface using pfUI.api.SkinButton
---
local function StyleButtons()
    -- Use pfUI's SkinButton function for proper button styling
    if not pfUI.api.SkinButton then return end

    -- Direct named buttons
    local namedButtons = {
        "AtlasTWSwitchButton",
        "AtlasTWLootFilterButton",
    }

    for _, buttonName in ipairs(namedButtons) do
        local button = _G[buttonName]
        if button then
            if not button.pfui_skinned then
                pfUI.api.SkinButton(button)
                button.pfui_skinned = true
            end
        end
    end

    -- Find and style all button children of AtlasTWFrame
    if AtlasTWFrame then
        for _, child in ipairs({ AtlasTWFrame:GetChildren() }) do
            if not child.pfui_skinned then
                if child:GetObjectType() == "Button" then
                    -- Skip close and lock buttons as they are handled separately
                    if child ~= AtlasTWCloseButton and child ~= AtlasTWLockButton then
                        pfUI.api.SkinButton(child)
                        child.pfui_skinned = true
                    end
                elseif child:GetObjectType() == "CheckButton" and pfUI.api.SkinCheckbox then
                    pfUI.api.SkinCheckbox(child)
                    child.pfui_skinned = true
                end
            end
        end
    end

    -- Style search buttons in main frame
    if AtlasTWSearchEditBox then
        -- The search and clear buttons are children of the edit box, not siblings!
        for _, child in ipairs({ AtlasTWSearchEditBox:GetChildren() }) do
            if child:GetObjectType() == "Button" and not child.pfui_skinned then
                pfUI.api.SkinButton(child)
                child.pfui_skinned = true
            end
        end
    end
end

---
--- Applies pfUI styling to search box
--- Styles the loot search editbox WITHOUT backdrop (editboxes shouldn't have backdrop)
---
local function StyleSearchBox()
    -- Style the main Atlas search editbox
    if not AtlasTWSearchEditBox then return end

    AtlasTW.pfUI.SkinEditBox(AtlasTWSearchEditBox)
    AtlasTWSearchEditBox:SetHeight(20) -- Fix height for pfUI style

    if pfUI.api.SkinButton and AtlasTWNoticeBox then
        AtlasTW.pfUI.SkinEditBox(AtlasTWNoticeBox)
    end
    -- Also style the search button in the loot panel (handled in StyleLootPanel, but just in case)
    if pfUI.api.SkinButton and AtlasTWLootSearchBox then
        AtlasTW.pfUI.SkinEditBox(AtlasTWLootSearchBox)
    end
end

---
--- Skins a scrollbar with pfUI style
--- @param scrollFrame ScrollFrame - The scrollframe to skin
---
function AtlasTW.pfUI.SkinScrollBar(scrollFrame)
    if not IsPfUILoaded() then return end
    if not scrollFrame then return end
    if scrollFrame.pfui_skinned then return end

    -- Detect if this is a FauxScrollFrame or similar wrapper where the actual scrollbar is a child
    local scrollBarWidget = scrollFrame
    local name = scrollFrame:GetName()
    if name then
        -- Check for "ScrollBar" suffix child, which is standard for FauxScrollFrameTemplate
        local childScrollBar = _G[name .. "ScrollBar"]
        if childScrollBar then
            scrollBarWidget = childScrollBar
        end
    end

    -- Use pfUI's built-in scrollbar skinner if available
    if pfUI.api.SkinScrollbar then
        -- Wrap in pcall to prevent errors if the scrollbar structure is unexpected
        -- Pass the widget that is likely the slider/scrollbar
        local success, err = pcall(pfUI.api.SkinScrollbar, scrollBarWidget)
        -- if not success then PrintA("AtlasTW: pfUI SkinScrollbar error: " .. tostring(err)) end
    else
        -- Manual fallback if pfUI doesn't expose SkinScrollbar
        local sbName = scrollBarWidget:GetName()
        if sbName then
            local upButton = _G[sbName .. "ScrollUpButton"]
            local downButton = _G[sbName .. "ScrollDownButton"]

            if upButton then AtlasTW.pfUI.SkinArrowButton(upButton, "up") end
            if downButton then AtlasTW.pfUI.SkinArrowButton(downButton, "down") end
        end
    end

    scrollFrame.pfui_skinned = true
    -- Also mark the child as skinned to prevent double skinning if called directly later
    if scrollBarWidget ~= scrollFrame then
        scrollBarWidget.pfui_skinned = true
    end
end

---
--- Applies pfUI styling to the scrollbar frame
--- Styles the loot items scrollbar
---
local function StyleScrollBar()
    if AtlasTWScrollBar then
        -- Style scrollbar background
        pfUI.api.CreateBackdrop(AtlasTWScrollBar, nil, nil, 0.3)
        AtlasTW.pfUI.SkinScrollBar(AtlasTWScrollBar)
    end

    if AtlasTWLootScrollBar then
        AtlasTW.pfUI.SkinScrollBar(AtlasTWLootScrollBar)
    end
end

---
--- Applies pfUI styling to loot items frame
--- Styles the main loot display area with black background
---
local function StyleLootItemsFrame()
    if not AtlasTWLootItemsFrame then return end

    -- Apply backdrop to loot items frame
    pfUI.api.CreateBackdrop(AtlasTWLootItemsFrame, nil, nil, 1.0)

    -- Use pfUI background color if available, otherwise pure black
    if AtlasTWLootItemsFrame.backdrop then
        local r, g, b, a = 0, 0, 0, 1
        if pfUI_config and pfUI_config.appearance and pfUI_config.appearance.border and pfUI_config.appearance.border.background then
            r, g, b, a = pfUI.api.GetStringColor(pfUI_config.appearance.border.background)
        end
        AtlasTWLootItemsFrame.backdrop:SetBackdropColor(r, g, b, 1) -- Ensure alpha is 1 for "completely black"
    end

    -- Style the original background texture to match the backdrop
    for _, region in ipairs({ AtlasTWLootItemsFrame:GetRegions() }) do
        if region:GetObjectType() == "Texture" then
            local r, g, b, a = 0, 0, 0, 1
            if AtlasTWLootItemsFrame.backdrop then
                r, g, b, a = AtlasTWLootItemsFrame.backdrop:GetBackdropColor()
            end
            region:SetTexture(r, g, b, 1) -- Set alpha to 1 for "completely black"
            region:SetAlpha(1)
        end
    end

    -- Style the loot items frame close button
    local itemsCloseButton = _G["AtlasTWLootItemsFrame_CloseButton"]
    if itemsCloseButton then
        -- Hide pfUI auto-backdrop if present.
        if itemsCloseButton.backdrop then
            itemsCloseButton.backdrop:Hide()
        end

        itemsCloseButton:SetNormalTexture("")
        itemsCloseButton:SetPushedTexture("")
        itemsCloseButton:SetHighlightTexture("")

        -- Create custom X texture
        if not itemsCloseButton.customX then
            local customX = itemsCloseButton:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            customX:SetPoint("CENTER", 0, 0)
            customX:SetText("×")
            customX:SetTextColor(1, 0.2, 0.2)
            customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            itemsCloseButton.customX = customX
        end

        -- Position and size to match main frame buttons
        itemsCloseButton:SetWidth(20)
        itemsCloseButton:SetHeight(20)
        itemsCloseButton:ClearAllPoints()
        itemsCloseButton:SetPoint("TOPRIGHT", AtlasTWLootItemsFrame, "TOPRIGHT", -3, -3)

        -- Hover effect
        itemsCloseButton:SetScript("OnEnter", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.4, 0.4)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 22, "OUTLINE")
            end
        end)
        itemsCloseButton:SetScript("OnLeave", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.2, 0.2)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            end
        end)

        itemsCloseButton.pfui_skinned = true
    end

    -- Style all item buttons in the loot frame
    for i = 1, 30 do
        local button = _G["AtlasTWLootItem" .. i]
        if button and not button.pfui_styled then
            -- Item buttons should have subtle backdrop
            pfUI.api.CreateBackdrop(button, nil, true, 0.3)
            button.pfui_styled = true
        end
    end

    -- Style Select Loot Table button
    if AtlasTWLootItemsFrame_Menu and not AtlasTWLootItemsFrame_Menu.pfui_skinned then
        pfUI.api.SkinButton(AtlasTWLootItemsFrame_Menu)
        AtlasTWLootItemsFrame_Menu.pfui_skinned = true
    end

    -- Style Back/Prev/Next buttons and QuickLooks button
    local navButtons = {
        "AtlasTWLootItemsFrame_BACK",
        "AtlasTWLootItemsFrame_PREV",
        "AtlasTWLootItemsFrame_NEXT",
        "AtlasTWLootQuickLooksButton"
    }

    for _, btnName in ipairs(navButtons) do
        local btn = _G[btnName]
        if btn and not btn.pfui_skinned then
            if btnName == "AtlasTWLootItemsFrame_BACK" then
                pfUI.api.SkinButton(btn)
            elseif btnName == "AtlasTWLootItemsFrame_PREV" then
                AtlasTW.pfUI.SkinArrowButton(btn, "left")
            elseif btnName == "AtlasTWLootItemsFrame_NEXT" then
                AtlasTW.pfUI.SkinArrowButton(btn, "right")
            elseif btnName == "AtlasTWLootQuickLooksButton" then
                AtlasTW.pfUI.SkinArrowButton(btn, "down")
            end
            btn.pfui_skinned = true
        end
    end
end

---
--- Applies pfUI styling to loot panel
--- Styles the bottom panel with navigation buttons
---
local function StyleLootPanel()
    if not AtlasTWLootPanel then return end

    -- Apply pfUI backdrop
    pfUI.api.CreateBackdrop(AtlasTWLootPanel, nil, nil, 1.0)
    pfUI.api.CreateBackdropShadow(AtlasTWLootPanel)

    -- Use pfUI background color if available, otherwise pure black
    if AtlasTWLootPanel.backdrop then
        local r, g, b, a = 0, 0, 0, 1
        if pfUI_config and pfUI_config.appearance and pfUI_config.appearance.border and pfUI_config.appearance.border.background then
            r, g, b, a = pfUI.api.GetStringColor(pfUI_config.appearance.border.background)
        end
        AtlasTWLootPanel.backdrop:SetBackdropColor(r, g, b, 1)
    end

    -- Style the original background texture to match the backdrop in loot panel
    for _, region in ipairs({ AtlasTWLootPanel:GetRegions() }) do
        if region:GetObjectType() == "Texture" then
            local r, g, b, a = 0, 0, 0, 1
            if AtlasTWLootPanel.backdrop then
                r, g, b, a = AtlasTWLootPanel.backdrop:GetBackdropColor()
            end
            region:SetTexture(r, g, b, 1) -- Set alpha to 1 for "completely black"
            region:SetAlpha(1)
        end
    end

    -- Style all named loot panel buttons
    local panelButtons = {
        "AtlasTWLootPanel_Instances",   -- World
        "AtlasTWLootPanel_WorldEvents", -- World Events
        "AtlasTWLootPanel_Sets",        -- Collections
        "AtlasTWLootPanel_Reputation",  -- Factions
        "AtlasTWLootPanel_PvP",         -- PvP Rewards
        "AtlasTWLootPanel_Crafting",    -- Crafting
        "AtlasTWLootPanel_Dungeons",    -- Dungeons & Raids
    }

    if pfUI.api.SkinButton then
        for _, buttonName in ipairs(panelButtons) do
            local button = _G[buttonName]
            if button and not button.pfui_skinned then
                pfUI.api.SkinButton(button)
                button.pfui_skinned = true
            end
        end
    end

    -- Style menu item buttons (numbered buttons in panel)
    if pfUI.api.SkinButton then
        for i = 1, 20 do
            local button = _G["AtlasTWLootMenuItem" .. i]
            if button and not button.pfui_skinned then
                pfUI.api.SkinButton(button)
                button.pfui_skinned = true
            end
        end
    end

    -- Style all button children of the loot panel (includes Search, Clear, Last Result, WishList, etc)
    if pfUI.api.SkinButton and AtlasTWLootPanel then
        for _, child in ipairs({ AtlasTWLootPanel:GetChildren() }) do
            if child:GetObjectType() == "Button" and not child.pfui_skinned then
                pfUI.api.SkinButton(child)
                child.pfui_skinned = true
            end
        end
    end

    -- Style checkboxes in loot panel if any (like "Safe Links" etc are in options, but maybe some here)
    if pfUI.api.SkinCheckbox and AtlasTWLootPanel then
        for _, child in ipairs({ AtlasTWLootPanel:GetChildren() }) do
            if child:GetObjectType() == "CheckButton" and not child.pfui_skinned then
                pfUI.api.SkinCheckbox(child)
                child.pfui_skinned = true
            end
        end
    end

    -- Also style buttons that are children of the search box
    if pfUI.api.SkinButton and AtlasTWLootSearchBox then
        -- Style the search box itself
        AtlasTW.pfUI.SkinEditBox(AtlasTWLootSearchBox)

        for _, child in ipairs({ AtlasTWLootSearchBox:GetChildren() }) do
            if child:GetObjectType() == "Button" and not child.pfui_skinned then
                pfUI.api.SkinButton(child)
                child.pfui_skinned = true
            end
        end

        -- Style children of button children (for searchOptionsButton which is child of searchButton)
        for _, child in ipairs({ AtlasTWLootSearchBox:GetChildren() }) do
            if child:GetObjectType() == "Button" then
                for _, subchild in ipairs({ child:GetChildren() }) do
                    if subchild:GetObjectType() == "Button" and not subchild.pfui_skinned then
                        -- Check if this is the search options arrow button
                        local normalTexture = subchild:GetNormalTexture()
                        local texPath = normalTexture and normalTexture:GetTexture() or ""
                        if string.find(texPath, "NextPage") then
                            AtlasTW.pfUI.SkinArrowButton(subchild, "right")
                        elseif string.find(texPath, "PrevPage") then
                            AtlasTW.pfUI.SkinArrowButton(subchild, "left")
                        else
                            pfUI.api.SkinButton(subchild)
                        end
                        subchild.pfui_skinned = true
                    end
                end
            end
        end
    end
end

---
--- Applies pfUI styling to container window
--- Styles the item set/container popup
---
local function StyleContainerFrame()
    if not AtlasTWLootItemsFrameContainer then return end

    -- Apply pfUI backdrop to container
    pfUI.api.CreateBackdrop(AtlasTWLootItemsFrameContainer, nil, nil, 0.9)
    pfUI.api.CreateBackdropShadow(AtlasTWLootItemsFrameContainer)

    -- Style container item buttons
    for i = 1, 50 do
        local button = _G["AtlasTWLootItemsFrameContainerButton" .. i]
        if button and not button.pfui_styled then
            -- Container item buttons get subtle backdrop
            pfUI.api.CreateBackdrop(button, nil, true, 0.5)
            button.pfui_styled = true
        end
    end
end

---
--- Applies pfUI styling to quest frame
--- Styles the quest display panel
---
local function StyleQuestFrame()
    -- Get the quest frame reference
    local questFrame = AtlasTW.Quest and AtlasTW.Quest.UI_Main and AtlasTW.Quest.UI_Main.Frame
    if not questFrame then return end

    -- Clear existing backdrop if any (QuestUI.lua sets a DialogBox backdrop)
    questFrame:SetBackdrop(nil)

    -- Apply pfUI backdrop
    pfUI.api.CreateBackdrop(questFrame, nil, nil, 1.0)
    pfUI.api.CreateBackdropShadow(questFrame)

    -- Use pfUI background color if available, otherwise pure black
    if questFrame.backdrop then
        local r, g, b, a = 0, 0, 0, 1
        if pfUI_config and pfUI_config.appearance and pfUI_config.appearance.border and pfUI_config.appearance.border.background then
            r, g, b, a = pfUI.api.GetStringColor(pfUI_config.appearance.border.background)
        end
        questFrame.backdrop:SetBackdropColor(r, g, b, 1) -- Ensure alpha is 1 for "completely black"
    end

    -- Style the close button
    if AtlasTW.Quest.UI_Main.CloseButton then
        local closeButton = AtlasTW.Quest.UI_Main.CloseButton

        -- User requested no large black contour. Hide pfUI auto-backdrop if present.
        if closeButton.backdrop then
            closeButton.backdrop:Hide()
        end

        closeButton:SetNormalTexture("")
        closeButton:SetPushedTexture("")
        closeButton:SetHighlightTexture("")

        -- Create custom X texture
        if not closeButton.customX then
            local customX = closeButton:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            customX:SetPoint("CENTER", 0, 0)
            customX:SetText("×")
            customX:SetTextColor(1, 0.2, 0.2)
            customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            closeButton.customX = customX
        end

        -- Position and size
        closeButton:SetWidth(20)
        closeButton:SetHeight(20)
        closeButton:ClearAllPoints()
        closeButton:SetPoint("TOPRIGHT", questFrame, "TOPRIGHT", -3, -3)

        -- Hover effect
        closeButton:SetScript("OnEnter", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.4, 0.4)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 22, "OUTLINE")
            end
        end)
        closeButton:SetScript("OnLeave", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.2, 0.2)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            end
        end)
    end

    -- Style the Story button
    if AtlasTW.Quest.UI_Main.StoryButton and pfUI.api.SkinButton then
        pfUI.api.SkinButton(AtlasTW.Quest.UI_Main.StoryButton)
    end

    -- Style all quest buttons
    if AtlasTW.Quest.UI_Main.QuestButtons and pfUI.api.SkinButton then
        for i, questBtn in ipairs(AtlasTW.Quest.UI_Main.QuestButtons) do
            if questBtn.Button and not questBtn.Button.pfui_styled then
                pfUI.api.CreateBackdrop(questBtn.Button, nil, true, 0.3)
                questBtn.Button.pfui_styled = true
            end
        end
    end
end

---
--- Styles the embedded quest display (InsideAtlasFrame)
---
local function StyleInsideAtlasFrame()
    if not AtlasTW.Quest or not AtlasTW.Quest.UI or not AtlasTW.Quest.UI.InsideAtlasFrame then return end
    local frame = AtlasTW.Quest.UI.InsideAtlasFrame

    -- Apply pfUI backdrop
    pfUI.api.CreateBackdrop(frame, nil, nil, 1.0)
    pfUI.api.CreateBackdropShadow(frame)

    -- Use pfUI background color if available, otherwise pure black
    if frame.backdrop then
        local r, g, b, a = 0, 0, 0, 1
        if pfUI_config and pfUI_config.appearance and pfUI_config.appearance.border and pfUI_config.appearance.border.background then
            r, g, b, a = pfUI.api.GetStringColor(pfUI_config.appearance.border.background)
        end
        frame.backdrop:SetBackdropColor(r, g, b, 1) -- Ensure alpha is 1 for "completely black"
    end

    -- Hide or style the original background texture if it exists
    -- In QuestUIinAtlas.lua, it's an anonymous texture created with CreateTexture(nil, "BACKGROUND")
    -- We can iterate through regions to find it or just set all textures to match
    for _, region in ipairs({ frame:GetRegions() }) do
        if region:GetObjectType() == "Texture" then
            local r, g, b, a = 0, 0, 0, 1
            if frame.backdrop then
                r, g, b, a = frame.backdrop:GetBackdropColor()
            end
            region:SetTexture(r, g, b, 1) -- Set alpha to 1 for "completely black"
            region:SetAlpha(1)
        end
    end

    -- Style the close button on InsideAtlasFrame
    if AtlasTW.Quest.UI.CloseButton then
        local closeButton = AtlasTW.Quest.UI.CloseButton

        -- Hide pfUI auto-backdrop if present.
        if closeButton.backdrop then
            closeButton.backdrop:Hide()
        end

        closeButton:SetNormalTexture("")
        closeButton:SetPushedTexture("")
        closeButton:SetHighlightTexture("")

        -- Create custom X texture
        if not closeButton.customX then
            local customX = closeButton:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            customX:SetPoint("CENTER", 0, 0)
            customX:SetText("×")
            customX:SetTextColor(1, 0.2, 0.2)
            customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            closeButton.customX = customX
        end

        -- Position and size to match main frame buttons
        closeButton:SetWidth(20)
        closeButton:SetHeight(20)
        closeButton:ClearAllPoints()
        closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -3, -3)

        -- Hover effect
        closeButton:SetScript("OnEnter", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.4, 0.4)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 22, "OUTLINE")
            end
        end)
        closeButton:SetScript("OnLeave", function()
            if this.customX then
                this.customX:SetTextColor(1, 0.2, 0.2)
                this.customX:SetFont("Fonts\\ARIALN.TTF", 20, "OUTLINE")
            end
        end)
    end

    -- Style navigation buttons if they exist
    if AtlasTW.Quest.UI.NextPageButtonRight and not AtlasTW.Quest.UI.NextPageButtonRight.pfui_skinned then
        AtlasTW.Quest.UI.NextPageButtonRight:SetNormalTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Up")
        AtlasTW.Quest.UI.NextPageButtonRight:SetPushedTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Down")
        AtlasTW.Quest.UI.NextPageButtonRight:SetHighlightTexture(
            "Interface\\Glues\\Common\\Glue-RightArrow-Button-Highlight", "ADD")
        AtlasTW.Quest.UI.NextPageButtonRight.pfui_skinned = true
    end

    if AtlasTW.Quest.UI.NextPageButtonLeft and not AtlasTW.Quest.UI.NextPageButtonLeft.pfui_skinned then
        AtlasTW.Quest.UI.NextPageButtonLeft:SetNormalTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Up")
        AtlasTW.Quest.UI.NextPageButtonLeft:SetPushedTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Down")
        AtlasTW.Quest.UI.NextPageButtonLeft:SetHighlightTexture(
            "Interface\\Glues\\Common\\Glue-LeftArrow-Button-Highlight", "ADD")
        AtlasTW.Quest.UI.NextPageButtonLeft.pfui_skinned = true
    end
end

---
--- Applies pfUI styling to tooltips
--- Already handled in LootUI.lua via setupPfUITooltip()
--- This function ensures consistency if tooltips are created later
---
local function StyleTooltips()
    if AtlasTWLootTooltip then
        pfUI.api.CreateBackdrop(AtlasTWLootTooltip)
        pfUI.api.CreateBackdropShadow(AtlasTWLootTooltip)
    end

    if AtlasTWLootTooltip2 then
        pfUI.api.CreateBackdrop(AtlasTWLootTooltip2)
        pfUI.api.CreateBackdropShadow(AtlasTWLootTooltip2)
    end
end

---
--- Skins a Hewdrop menu level with pfUI style
--- @param level number - The level number to skin
---
function AtlasTW.pfUI.StyleHewdropLevel(level)
    if not IsPfUILoaded() then return end

    local frame = _G["Hewdrop20Level" .. level]
    if frame and not frame.pfui_styled then
        -- The backdrop is a child frame created in AcquireLevel
        -- It's the first child that is a frame and has a backdrop
        for _, child in ipairs({ frame:GetChildren() }) do
            if child:GetObjectType() == "Frame" and child.SetBackdrop then
                -- Apply pfUI backdrop
                pfUI.api.CreateBackdrop(child, nil, true, 0.95)
                pfUI.api.CreateBackdropShadow(child)

                -- Adjust color to match pfUI standard
                if child.backdrop then
                    local r, g, b, a = pfUI.api.GetStringColor(pfUI_config.appearance.border.background)
                    child.backdrop:SetBackdropColor(r, g, b, 0.95)
                end
                break
            end
        end
        frame.pfui_styled = true
    end
end

---
--- Applies pfUI styling to Hewdrop menu frames
--- Styles dropdown menu popups
---
local function StyleHewdropMenus()
    -- Hewdrop menus are created dynamically
    -- We mainly rely on the hook in AtlasTWHewdrop.lua calling AtlasTW.pfUI.StyleHewdropLevel
    -- But we check existing ones here just in case

    for i = 1, 10 do
        AtlasTW.pfUI.StyleHewdropLevel(i)
    end
end

---
--- Applies pfUI styling to checkboxes
--- Styles all checkboxes in Atlas-TW using pfUI.api.SkinCheckbox
---
local function StyleCheckboxes()
    if not pfUI.api.SkinCheckbox then return end

    -- Style checkboxes in options frame
    if AtlasTWOptionsFrame then
        local function SkinCheckboxesRecursive(frame)
            for _, child in ipairs({ frame:GetChildren() }) do
                if child:GetObjectType() == "CheckButton" then
                    if not child.pfui_skinned then
                        pfUI.api.SkinCheckbox(child)
                        child.pfui_skinned = true
                    end
                end
                SkinCheckboxesRecursive(child)
            end
        end
        SkinCheckboxesRecursive(AtlasTWOptionsFrame)
    end

    -- Style "Finished Quest" checkbox in embedded quest display
    if AtlasTW.Quest and AtlasTW.Quest.UI and AtlasTW.Quest.UI.FinishedQuestCheckbox then
        local finishedCheck = AtlasTW.Quest.UI.FinishedQuestCheckbox
        if not finishedCheck.pfui_skinned then
            pfUI.api.SkinCheckbox(finishedCheck)
            finishedCheck.pfui_skinned = true
        end
    end
end

---
--- Applies pfUI styling to options frame
--- Styles the options/settings window
---
local function StyleOptionsFrame()
    if not AtlasTWOptionsFrame then return end

    -- Apply pfUI backdrop
    pfUI.api.CreateBackdrop(AtlasTWOptionsFrame, nil, nil, 0.85)
    pfUI.api.CreateBackdropShadow(AtlasTWOptionsFrame)

    -- Style all buttons and checkboxes in options frame using SkinButton/SkinCheckbox
    if pfUI.api.SkinButton then
        local function SkinElementsRecursive(frame)
            for _, child in ipairs({ frame:GetChildren() }) do
                if not child.pfui_skinned then
                    if child:GetObjectType() == "Button" then
                        pfUI.api.SkinButton(child)
                        child.pfui_skinned = true
                    elseif child:GetObjectType() == "CheckButton" and pfUI.api.SkinCheckbox then
                        pfUI.api.SkinCheckbox(child)
                        child.pfui_skinned = true
                    end
                end
                SkinElementsRecursive(child)
            end
        end
        SkinElementsRecursive(AtlasTWOptionsFrame)
    end

    -- Style checkboxes (calls the dedicated function for any missed or external ones)
    StyleCheckboxes()
end

---
--- Applies pfUI styling to minimap button
--- Styles the minimap icon WITHOUT backdrop (minimap buttons shouldn't have backdrop)
---
local function StyleMinimapButton()
    -- Don't apply backdrop to minimap buttons - they look better without one
    -- The border texture is already part of the button design
    return
end

---
--- Main initialization function
--- Applies all pfUI styling when pfUI is detected
---
function AtlasTW.pfUI.Initialize()
    if not IsPfUILoaded() then
        return
    end

    -- Apply styling to all components
    StyleMainFrame()
    StyleDropdowns()
    StyleButtons()
    StyleSearchBox()
    StyleScrollBar()
    StyleLootItemsFrame()
    StyleLootPanel()
    StyleContainerFrame()
    StyleQuestFrame()
    StyleInsideAtlasFrame()
    StyleTooltips()
    StyleHewdropMenus()
    StyleOptionsFrame()
    StyleCheckboxes()
    StyleMinimapButton()

    -- Create a delayed hook for dynamically created frames
    -- Some frames are created after ADDON_LOADED
    local delayedStyle = CreateFrame("Frame")
    delayedStyle:RegisterEvent("PLAYER_ENTERING_WORLD")
    delayedStyle:SetScript("OnEvent", function()
        -- Restyle components that might be created late
        StyleLootPanel()
        StyleContainerFrame()
        StyleQuestFrame()
        StyleInsideAtlasFrame()
        StyleButtons()
        StyleCheckboxes()
        StyleHewdropMenus()
        this:UnregisterAllEvents()
    end)
end

---
--- Re-applies pfUI styling to a specific frame
--- Useful for frames that reset their appearance
--- @param frameName string - Name of the frame to restyle
---
function AtlasTW.pfUI.RestyleFrame(frameName)
    if not IsPfUILoaded() then return end

    local frame = _G[frameName]
    if not frame then return end

    -- Reapply backdrop
    pfUI.api.CreateBackdrop(frame, nil, nil, 0.85)
    pfUI.api.CreateBackdropShadow(frame)
end

local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_ENTERING_WORLD")
init:SetScript("OnEvent", function()
    if arg1 == "Atlas-TW" then
        this.atlasLoaded = true
    elseif arg1 == "pfUI" then
        this.pfuiLoaded = true
    end

    if (this.atlasLoaded or IsAddOnLoaded("Atlas-TW")) and (this.pfuiLoaded or IsAddOnLoaded("pfUI")) then
        this:SetScript("OnUpdate", function()
            AtlasTW.pfUI.Initialize()
            this:SetScript("OnUpdate", nil)
        end)
        this:UnregisterAllEvents()
    end
end)
