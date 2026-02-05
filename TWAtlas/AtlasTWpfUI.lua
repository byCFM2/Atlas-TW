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

                -- Add OnShow hook to ensure it stays skinned if it's a template button
                -- Templates like UIPanelButtonTemplate can restore textures on show
                local originalOnShow = button:GetScript("OnShow")
                button:SetScript("OnShow", function()
                    if originalOnShow then originalOnShow() end
                    AtlasTW.pfUI.RestyleButton(buttonName)
                end)
            end

            -- Ensure textures are hidden if they were restored by templates
            if button:GetNormalTexture() and button:GetNormalTexture():IsShown() then
                button:GetNormalTexture():Hide()
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
    -- Don't apply backdrop to EditBoxes - they should not have one
    -- Just ensure the search/clear buttons next to it are styled
    if not AtlasTWSearchEditBox then return end

    -- Style the search and clear buttons next to the search box (main Atlas frame)
    -- These are already handled by StyleButtons() which iterates over children of AtlasTWFrame
    -- But we keep this for safety, ensuring they are marked as skinned.
    if pfUI.api.SkinButton then
        for _, child in ipairs({ AtlasTWSearchEditBox:GetChildren() }) do
            if child:GetObjectType() == "Button" and not child.pfui_skinned then
                pfUI.api.SkinButton(child)
                child.pfui_skinned = true
            end
        end
    end

    -- Also style the search button in the loot panel
    if pfUI.api.SkinButton and AtlasTWLootSearchBox then
        for _, child in ipairs({ AtlasTWLootSearchBox:GetChildren() }) do
            if child:GetObjectType() == "Button" and not child.pfui_skinned then
                pfUI.api.SkinButton(child)
                child.pfui_skinned = true
            end
        end
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

    -- Style Back/Prev/Next buttons
    local navButtons = {
        "AtlasTWLootItemsFrame_BACK",
        "AtlasTWLootItemsFrame_PREV",
        "AtlasTWLootItemsFrame_NEXT"
    }

    for _, btnName in ipairs(navButtons) do
        local btn = _G[btnName]
        if btn and not btn.pfui_skinned then
            if btnName == "AtlasTWLootItemsFrame_BACK" then
                pfUI.api.SkinButton(btn)
            else
                -- PREV/NEXT buttons use textures for arrows.
                -- pfUI SkinButton hides normal texture, so we use backdrop and restore textures.

                if btnName == "AtlasTWLootItemsFrame_PREV" then
                    btn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
                    btn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
                    btn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
                else
                    btn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
                    btn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
                    btn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
                end
                btn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
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
                        -- We want to preserve the arrow texture or style it appropriately
                        local normalTexture = subchild:GetNormalTexture()
                        local texPath = normalTexture and normalTexture:GetTexture() or ""
                        if string.find(texPath, "NextPage") or string.find(texPath, "PrevPage") then
                            -- This is likely an arrow button. pfUI SkinButton hides the normal texture.
                            -- We want to keep it or replace it.
                            -- Ensure texture stays visible
                            if string.find(texPath, "NextPage") then
                                subchild:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
                                subchild:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
                                subchild:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
                            else
                                subchild:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
                                subchild:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
                                subchild:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
                            end
                            subchild:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
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
--- Applies pfUI styling to Hewdrop menu frames
--- Styles dropdown menu popups
---
local function StyleHewdropMenus()
    -- Hewdrop menus are created dynamically
    -- We need to hook into their creation
    if not AtlasTW.HewdropMenus then return end

    -- Create a hook for when Hewdrop frames are shown
    local function HookHewdropFrame(level)
        local frame = _G["AtlasTW_Hewdrop_Level" .. level]
        if frame and not frame.pfui_styled then
            local backdrop = frame:GetChildren()
            if backdrop then
                -- Apply pfUI styling to the backdrop
                pfUI.api.CreateBackdrop(backdrop, nil, true, 0.95)
                pfUI.api.CreateBackdropShadow(backdrop)
            end
            frame.pfui_styled = true
        end
    end

    -- Hook the menu opening to style frames as they're created
    for i = 1, 5 do
        local frame = _G["AtlasTW_Hewdrop_Level" .. i]
        if frame then
            HookHewdropFrame(i)
        end
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

    -- Style faction checkboxes in quest frame
    if AtlasTW.Quest and AtlasTW.Quest.UI_Main then
        local allianceCheck = AtlasTW.Quest.UI_Main.AllianceCheck
        local hordeCheck = AtlasTW.Quest.UI_Main.HordeCheck

        if allianceCheck and not allianceCheck.pfui_skinned then
            pfUI.api.SkinCheckbox(allianceCheck)
            allianceCheck.pfui_skinned = true
        end

        if hordeCheck and not hordeCheck.pfui_skinned then
            pfUI.api.SkinCheckbox(hordeCheck)
            hordeCheck.pfui_skinned = true
        end
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
--- Hook function to style Hewdrop menus when they open
--- Called by Hewdrop when creating menu levels
---
function AtlasTW.pfUI.StyleHewdropLevel(level)
    if not IsPfUILoaded() then return end

    local frame = _G["AtlasTW_Hewdrop_Level" .. level]
    if frame and not frame.pfui_styled then
        -- Get the backdrop child frame
        for _, child in ipairs({ frame:GetChildren() }) do
            if child:GetObjectType() == "Frame" and child.SetBackdrop then
                pfUI.api.CreateBackdrop(child, nil, true, 0.95)
                pfUI.api.CreateBackdropShadow(child)
                break
            end
        end
        frame.pfui_styled = true
    end
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

-- Register initialization hook
-- This will be called from AtlasTW.lua after the main frame is created
if IsPfUILoaded() then
    -- Schedule initialization after all frames are created
    local init = CreateFrame("Frame")
    init:RegisterEvent("ADDON_LOADED")
    init:SetScript("OnEvent", function()
        if arg1 == "Atlas-TW" then
            -- Delay styling until next frame to ensure all UI is created
            this:SetScript("OnUpdate", function()
                AtlasTW.pfUI.Initialize()
                this:SetScript("OnUpdate", nil)
            end)
            this:UnregisterAllEvents()
        end
    end)
end
