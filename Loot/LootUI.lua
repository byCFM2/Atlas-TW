local _G = getfenv()

-- Функция для копирования свойств родительского шаблона
function AtlasLoot_ApplyParentTemplate(frame)
    frame:SetWidth(236)
    frame:SetHeight(28)
    frame:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

    -- Icon texture
    local icon = frame:CreateTexture(frame:GetName().."_Icon", "ARTWORK")
    icon:SetWidth(25)
    icon:SetHeight(25)
    icon:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)

    -- Quantity text
    local quantity = frame:CreateFontString(frame:GetName().."_Quantity", "ARTWORK", "GameFontNormal")
    quantity:SetWidth(25)
    quantity:SetHeight(0)
    quantity:SetFont("Fonts\\ARIALN.TTF", 12, "OUTLINE")
    quantity:SetJustifyH("RIGHT")
    quantity:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 1)

    -- Name text
    local name = frame:CreateFontString(frame:GetName().."_Name", "ARTWORK", "GameFontNormal")
    name:SetWidth(205)
    name:SetHeight(12)
    name:SetJustifyH("LEFT")
    name:SetPoint("TOPLEFT", icon, "TOPRIGHT", 3, 0)

    -- Extra text
    local extra = frame:CreateFontString(frame:GetName().."_Extra", "ARTWORK", "GameFontNormalSmall")
    extra:SetWidth(205)
    extra:SetHeight(10)
    extra:SetJustifyH("LEFT")
    extra:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -1)
    extra:Hide()

    -- Price elements (5 sets of text + icon)
    for i = 1, 5 do
        local priceText = frame:CreateFontString(frame:GetName().."_PriceText"..i, "ARTWORK", "GameFontNormalSmall")
        priceText:SetJustifyH("RIGHT")
        priceText:Hide()

        local priceIcon = frame:CreateTexture(frame:GetName().."_PriceIcon"..i, "ARTWORK")
        priceIcon:SetWidth(12)
        priceIcon:SetHeight(12)
        priceIcon:Hide()

        if i == 1 then
            priceText:SetWidth(60)
            priceText:SetHeight(10)
            priceText:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 12, -1)
            priceText:SetText("333333")
            priceIcon:SetPoint("TOPLEFT", priceText, "TOPRIGHT")
        else
            priceText:SetWidth(20)
            priceText:SetHeight(10)
            priceText:SetText("120")
            local prevIcon = frame:GetName().."_PriceIcon"..(i-1)
            priceText:SetPoint("TOPLEFT", prevIcon, "TOPRIGHT")
            priceIcon:SetPoint("TOPLEFT", priceText, "TOPRIGHT")
        end
    end

    -- Unsafe texture (background layer)
    local unsafe = frame:CreateTexture(frame:GetName().."_Unsafe", "BACKGROUND")
    unsafe:SetWidth(27)
    unsafe:SetHeight(27)
    unsafe:SetPoint("TOPLEFT", frame, "TOPLEFT")
    unsafe:SetVertexColor(1, 0, 0, 1)
    unsafe:Hide()

    -- Border texture
    local border = frame:CreateTexture(frame:GetName().."Border", "BACKGROUND")
    border:SetWidth(29)
    border:SetHeight(29)
    border:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
    border:SetPoint("TOPLEFT", frame, "TOPLEFT", -1, 1)
    border:Hide()
end

-- Функция для применения свойств AtlasLootClassButtonTemplate
function AtlasLoot_ApplyClassButtonTemplate(button)
    button:SetWidth(80)
    button:SetHeight(22)
    button:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    button:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
    button:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
    button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight", "ADD")
    -- В WoW 1.12 используется SetTextFontObject вместо SetNormalFontObject
    button:SetTextFontObject("GameFontNormal")
end

-- Функция для применения свойств AtlasLootPanelButtonTemplate
function AtlasLoot_ApplyPanelButtonTemplate(button)
    button:SetWidth(80)
    button:SetHeight(22)
    button:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    button:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
    button:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
    button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight", "ADD")
    -- В WoW 1.12 используется SetTextFontObject вместо SetNormalFontObject
    button:SetTextFontObject("GameFontNormal")
end

-- Функция для применения свойств навигационных кнопок
function AtlasLoot_ApplyNavigationButtonTemplate(button, buttonType)
    button:SetWidth(32)
    button:SetHeight(32)
    button:SetFrameStrata("MEDIUM")

    if buttonType == "next" then
        button:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
        button:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
        button:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
    elseif buttonType == "prev" then
        button:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
        button:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
        button:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
    end

    button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
end
-- Create AtlasLootContainerItemTemplate
function AtlasLoot_CreateContainerItemTemplate()
    local template = CreateFrame("Button", "AtlasLootContainerItemTemplate", UIParent)
    template:SetWidth(40)
    template:SetHeight(40)
    template:Hide()

    -- Create backdrop
    template:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        edgeSize = 19,
        tileSize = 8,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })

    -- Create icon texture
    local icon = template:CreateTexture(template:GetName().."Icon", "BACKGROUND")
    icon:SetWidth(32)
    icon:SetHeight(32)
    icon:SetPoint("TOPLEFT", template, "TOPLEFT", 4, -4)

    -- Create quantity text
    local quantity = template:CreateFontString(template:GetName().."_Quantity", "BACKGROUND", "GameFontNormal")
    quantity:SetWidth(25)
    quantity:SetHeight(0)
    quantity:SetFont("Fonts\\ARIALN.TTF", 12, "OUTLINE")
    quantity:SetJustifyH("RIGHT")
    quantity:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 1)

    -- Set click script
    template:SetScript("OnClick", function()
        AtlasLoot_ContainerItem_OnClick(arg1)
    end)

    return template
end

-- Create Preset buttons (QuickLook buttons)
function AtlasLoot_CreatePresetButtons(frame)
    local presetButtons = {}

    for i = 1, 4 do
        local presetButton = CreateFrame("Button", frame:GetName().."_Preset"..i, frame, "OptionsButtonTemplate")
        presetButton:SetWidth(130)
        presetButton:SetHeight(20)
        presetButton:Hide()
        if i ~= 1 then
            presetButton:SetPoint("LEFT", presetButtons[i-1], "RIGHT", 0, 0)
        else
            presetButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 40, 75)
        end

        presetButton:SetScript("OnEnter", function()
            local L = AceLibrary("AceLocale-2.2"):new("Atlas")
            if this:IsEnabled() then
                GameTooltip:ClearLines()
                GameTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 5)
                GameTooltip:AddLine(AtlasLootCharDB["QuickLooks"][i][3])
                GameTooltip:AddLine(L["|cff9d9d9dALT+Click to clear|r"])
                GameTooltip:Show()
            end
        end)

        presetButton:SetScript("OnLeave", function()
            if GameTooltip:IsVisible() then
                GameTooltip:Hide()
            end
        end)

        presetButton:SetScript("OnMouseUp", function()
            if IsAltKeyDown() then
                AtlasLoot_ClearQuickLookButton(i)
            end
        end)

        presetButton:SetScript("OnClick", function()
            if AtlasLoot_IsLootTableAvailable(AtlasLootCharDB["QuickLooks"][i][1]) then
                pFrame = { "TOPLEFT", "AtlasLootDefaultFrame_LootBackground", "TOPLEFT", "2", "-2" }
                AtlasLoot_ShowItemsFrame(AtlasLootCharDB["QuickLooks"][i][1], AtlasLootCharDB["QuickLooks"][i][2], AtlasLootCharDB["QuickLooks"][i][3], pFrame)
            end
        end)

        presetButton:SetScript("OnShow", function()
            local L = AceLibrary("AceLocale-2.2"):new("Atlas")
            this:SetText(L["QuickLook"].." "..i)
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
            if ((not AtlasLootCharDB["QuickLooks"][i]) or (not AtlasLootCharDB["QuickLooks"][i][1])) or (AtlasLootCharDB["QuickLooks"][i][1]==nil) then
                this:Disable()
            end
        end)

        presetButtons[i] = presetButton
    end

    return presetButtons
end

-- Create Search Box and related buttons
function AtlasLoot_CreateSearchElements(frame)
    -- Search Box
    local searchBox = CreateFrame("EditBox", "AtlasLootDefaultFrameSearchBox", frame, "InputBoxTemplate")
    searchBox:SetWidth(180)
    searchBox:SetHeight(32)
    searchBox:SetPoint("BOTTOM", frame, "BOTTOM", -88, 40)
    searchBox:SetAutoFocus(false)
    searchBox:SetTextInsets(0, 8, 0, 0)
    searchBox:SetMaxLetters(100)

    searchBox:SetScript("OnEnterPressed", function()
        AtlasLoot:Search(this:GetText())
        this:ClearFocus()
    end)

    -- Search String (label)
    local searchString = searchBox:CreateFontString("AtlasLootDefaultFrameSearchString", "ARTWORK", "GameFontNormal")

    -- Search Button
    local searchButton = CreateFrame("Button", "AtlasLootDefaultFrameSearchButton", searchBox, "UIPanelButtonTemplate2")
    searchButton:SetWidth(69)
    searchButton:SetHeight(32)
    searchButton:SetPoint("LEFT", searchBox, "RIGHT", 0, 0)

    searchButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Search"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    searchButton:SetScript("OnClick", function()
        AtlasLoot:Search(AtlasLootDefaultFrameSearchBox:GetText())
        AtlasLootDefaultFrameSearchBox:ClearFocus()
        CloseDropDownMenus()
    end)

    -- Search Options Button
    local searchOptionsButton = CreateFrame("Button", "AtlasLootDefaultFrameSearchOptionsButton", searchButton)
    searchOptionsButton:SetWidth(28)
    searchOptionsButton:SetHeight(28)
    searchOptionsButton:SetPoint("LEFT", searchButton, "RIGHT", -6, 0)

    searchOptionsButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
    searchOptionsButton:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
    searchOptionsButton:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
    searchOptionsButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

    searchOptionsButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    searchOptionsButton:SetScript("OnClick", function()
        AtlasLoot:ShowSearchOptions(this)
    end)

    -- Clear Button
    local clearButton = CreateFrame("Button", "AtlasLootDefaultFrameSearchClearButton", searchBox, "UIPanelButtonTemplate2")
    clearButton:SetWidth(58)
    clearButton:SetHeight(32)
    clearButton:SetPoint("LEFT", searchOptionsButton, "RIGHT", -2, 0)

    clearButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Clear"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    clearButton:SetScript("OnClick", function()
        AtlasLootDefaultFrameSearchBox:SetText("")
        AtlasLootDefaultFrameSearchBox:ClearFocus()
        CloseDropDownMenus()
    end)

    -- Last Result Button
    local lastResultButton = CreateFrame("Button", "AtlasLootDefaultFrameLastResultButton", searchBox, "UIPanelButtonTemplate2")
    lastResultButton:SetWidth(100)
    lastResultButton:SetHeight(32)
    lastResultButton:SetPoint("LEFT", clearButton, "RIGHT", 0, 0)

    lastResultButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Last Result"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    lastResultButton:SetScript("OnClick", function()
        AtlasLoot:ShowSearchResult()
        CloseDropDownMenus()
    end)

    -- WishList Button
    local wishListButton = CreateFrame("Button", "AtlasLootDefaultFrameWishListButton", frame, "UIPanelButtonTemplate2")
    wishListButton:SetWidth(100)
    wishListButton:SetHeight(32)
    wishListButton:SetPoint("RIGHT", searchBox, "LEFT", -7, 0)

    wishListButton:SetScript("OnClick", function()
        AtlasLoot_ShowWishList()
        CloseDropDownMenus()
        AtlasLootDefaultFrame_SubMenu:Disable()
        AtlasLootDefaultFrame_SelectedTable:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLoot_QuickLooks:Hide()
    end)

    wishListButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["WishList"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    wishListButton:SetScript("OnEnter", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        if this:IsEnabled() then
            GameTooltip:ClearLines()
            GameTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 5)
            GameTooltip:AddLine("|cffFFFFFF"..L["WishList"].."|r")
            GameTooltip:AddLine(L["ALT+Click on item to add or remove it from WishList"])
            GameTooltip:Show()
        end
    end)

    wishListButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    return {
        searchBox = searchBox,
        searchButton = searchButton,
        searchOptionsButton = searchOptionsButton,
        clearButton = clearButton,
        lastResultButton = lastResultButton,
        wishListButton = wishListButton
    }
end

-- Create FontStrings for the frame
function AtlasLoot_CreateFontStrings(frame)
    -- Notice text
    local notice = frame:CreateFontString(frame:GetName().."_Notice", "ARTWORK", "GameFontNormal")
    notice:SetPoint("BOTTOM", frame, "BOTTOM", 0, 17)

    -- Selected Category text
    local selectedCategory = frame:CreateFontString(frame:GetName().."_SelectedCategory", "OVERLAY", "GameFontNormal")
    selectedCategory:SetPoint("TOP", frame, "TOP", 0, -50)
    selectedCategory:SetText("Test")

    -- Selected Table text
    local selectedTable = frame:CreateFontString(frame:GetName().."_SelectedTable", "OVERLAY", "GameFontNormal")
    selectedTable:SetPoint("TOP", frame, "TOP", 0, -50)
    selectedTable:SetText("Test")

    return {
        notice = notice,
        selectedCategory = selectedCategory,
        selectedTable = selectedTable
    }
end

-- Create tooltips
function AtlasLoot_CreateTooltips()
    local tooltip1 = CreateFrame("GameTooltip", "AtlasLootTooltip", UIParent, "GameTooltipTemplate")
    tooltip1:Hide()

    local tooltip2 = CreateFrame("GameTooltip", "AtlasLootTooltip2", UIParent, "GameTooltipTemplate")
    tooltip2:Hide()

    return {
        tooltip1 = tooltip1,
        tooltip2 = tooltip2
    }
end

-- Функция для создания кнопок на основе шаблонов
function AtlasLoot_CreateButtonFromTemplate(name, parent, templateType)
    local button

    if templateType == "AtlasLootItem_Template" then
        button = CreateFrame("Button", name, parent)
        AtlasLoot_ApplyParentTemplate(button)

        button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
        button:SetScript("OnEnter", function() AtlasLootItem_OnEnter() end)
        button:SetScript("OnLeave", function() AtlasLootItem_OnLeave() end)
        button:SetScript("OnClick", function() AtlasLootItem_OnClick(arg1); CloseDropDownMenus() end)
        button:SetScript("OnShow", function() this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1) end)

    elseif templateType == "AtlasLootMenuItem_Template" then
        button = CreateFrame("Button", name, parent)
        AtlasLoot_ApplyParentTemplate(button)

        button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
        button:SetScript("OnClick", function() AtlasLootMenuItem_OnClick() end)
        button:SetScript("OnShow", function() this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1) end)

    elseif templateType == "AtlasLootNewBossLineTemplate" then
        button = CreateFrame("Button", name, parent)
        button:SetWidth(336)
        button:SetHeight(15)
        button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

        -- Добавляем элементы как в оригинальном шаблоне
        local text = button:CreateFontString(button:GetName().."_Text", "ARTWORK", "GameFontNormal")
        text:SetWidth(320)
        text:SetHeight(15)
        text:SetJustifyH("LEFT")
        text:SetPoint("LEFT", button, "LEFT")

        local lootIcon = button:CreateTexture(button:GetName().."_Loot", "ARTWORK")
        lootIcon:SetWidth(16)
        lootIcon:SetHeight(16)
        lootIcon:SetTexture("Interface\\AddOns\\Atlas-TW\\Loot\\Images\\looticon")
        lootIcon:SetPoint("RIGHT", button, "RIGHT")
        lootIcon:Hide()

        local selectedIcon = button:CreateTexture(button:GetName().."_Selected", "ARTWORK")
        selectedIcon:SetWidth(16)
        selectedIcon:SetHeight(16)
        selectedIcon:SetTexture("Interface\\AddOns\\Atlas-TW\\Loot\\Images\\gold")
        selectedIcon:SetPoint("RIGHT", button, "RIGHT")
        selectedIcon:Hide()

        button:SetScript("OnLeave", function() GameTooltip:Hide() end)
        button:SetScript("OnClick", function() AtlasLootBoss_OnClick(this:GetName()) end)
        button:SetScript("OnShow", function() this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1) end)
    end

    return button
end

-- Create AtlasLootInfo frame
function AtlasLoot_CreateInfoFrame()
    local frame = CreateFrame("Frame", "AtlasLootInfo", UIParent)
    frame:SetWidth(128)
    frame:SetHeight(75)

    -- Hide Panel button
    local hidePanelButton = CreateFrame("Button", frame:GetName().."HidePanel", frame, "UIPanelButtonTemplate2")
    hidePanelButton:SetWidth(140)
    hidePanelButton:SetHeight(20)
    hidePanelButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", -5, -3)

    hidePanelButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        this:SetText(L["Loot Panel"])
    end)

    hidePanelButton:SetScript("OnClick", function()
        if AtlasLootCharDB.HidePanel then
            AtlasLootCharDB.HidePanel = false
            if AtlasFrame then
                if AtlasFrame:IsVisible() then
                    AtlasLootPanel:Show()
                end
            end
        else
            AtlasLootCharDB.HidePanel = true
            if AtlasFrame then
                if AtlasFrame:IsVisible() then
                    AtlasLootPanel:Hide()
                end
            end
        end
        AtlasLootOptionsFrameHidePanel:SetChecked(AtlasLootCharDB.HidePanel)
        AtlasLoot_SetupForAtlas()
    end)

    return frame
end

-- Create AtlasLootItemsFrame with all item buttons
function AtlasLoot_CreateItemsFrame()
    local frame = CreateFrame("Frame", "AtlasLootItemsFrame", UIParent)
    frame:SetWidth(510)
    frame:SetHeight(510)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	frame:RegisterEvent("PLAYER_LOGIN")
    frame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_ENTERING_WORLD" then
            AtlasLoot_OnLoad()
            AtlasLoot_OnEvent()
            AtlasLoot_SetupForAtlas()
            AtlasLoot_AtlasScrollBar_Update()

            local L = AceLibrary("AceLocale-2.2"):new("Atlas")
            local backButton = _G["AtlasLootItemsFrame_BACK"]
            if backButton then
                backButton:SetText(L["Back"])
                backButton:SetHeight(25)
                backButton:SetWidth(100)
                backButton:SetPoint("RIGHT", frame, "RIGHT", -154, 0)
            end
            _G["AtlasLoot_QuickLooks"]:SetText(L["Add to QuickLooks:"])

        end
    end)
    frame:SetScript("OnMouseWheel", function()
        if arg1 == 1 and AtlasLootItemsFrame_NEXT:IsVisible() then
            AtlasLootItemsFrame_NEXT:Click()
        elseif arg1 == -1 and AtlasLootItemsFrame_PREV:IsVisible() then
            AtlasLootItemsFrame_PREV:Click()
        end
    end)
    frame:Hide()

    -- Close button
    local closeButton = CreateFrame("Button", frame:GetName().."_CloseButton", frame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
    closeButton:SetScript("OnClick", function()
        AtlasLootItemsFrame_OnCloseButton()
    end)
    closeButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- Query Server button
    local queryButton = CreateFrame("Button", frame:GetName().."_QueryServer", frame, "UIPanelButtonTemplate2")
    queryButton:SetWidth(100)
    queryButton:SetHeight(20)
    queryButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -20)
    queryButton:Hide()

    queryButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Query Server"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    queryButton:SetScript("OnClick", function()
        --AtlasLoot_QueryServer()
    end)

    -- QuickLooks button
    local quickLooksButton = CreateFrame("Button", "AtlasLootQuickLooksButton", frame, "UIPanelButtonTemplate2")
    quickLooksButton:SetWidth(100)
    quickLooksButton:SetHeight(20)
    quickLooksButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 130, -20)
    quickLooksButton:Hide()

    quickLooksButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["QuickLooks"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    quickLooksButton:SetScript("OnClick", function()
        --AtlasLoot_QuickLooks_Toggle()
    end)

    -- Container frame
    local container = CreateFrame("Frame", frame:GetName().."Container", frame)
    container:SetWidth(510)
    container:SetHeight(510)
    container:SetPoint("CENTER", frame, "CENTER")

    container:SetScript("OnMouseWheel", function()
        if arg1 > 0 then
            AtlasLoot_NavButton_OnClick("PREV") --TODO
        else
            AtlasLoot_NavButton_OnClick("NEXT") --TODO
        end
    end)

    -- Create 30 item buttons (2 columns, 15 rows each)
    local itemButtons = {}
    for i = 1, 30 do
        local itemButton = AtlasLoot_CreateButtonFromTemplate("AtlasLootItem_"..i, frame, "AtlasLootItem_Template")
        itemButton:SetID(i)
        itemButtons[i] = itemButton
        if i == 1 then
            itemButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -43)
        elseif i == 16 then
            itemButton:SetPoint("TOPLEFT", itemButtons[1], "TOPRIGHT", 0, 0)
        elseif i <= 15 then
            itemButton:SetPoint("TOPLEFT", itemButtons[i-1], "BOTTOMLEFT")
        else
            itemButton:SetPoint("TOPLEFT", itemButtons[i-1], "BOTTOMLEFT")
        end
    end

    -- Create 30 menu item buttons
 --   local menuButtons = {}
    for i = 1, 30 do
        local menuButton = AtlasLoot_CreateButtonFromTemplate("AtlasLootMenuItem_"..i, frame, "AtlasLootMenuItem_Template")
        menuButton:SetID(i)
     --   menuButtons[i] = menuButton

        if i == 1 then
            menuButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -43)
        elseif i == 16 then
            menuButton:SetPoint("TOPLEFT", itemButtons[1], "TOPRIGHT", 0, 0)
        elseif i <= 15 then
            if i == 2 then
                menuButton:SetPoint("TOPLEFT", itemButtons[1], "BOTTOMLEFT")
            else
                menuButton:SetPoint("TOPLEFT", itemButtons[i-1], "BOTTOMLEFT")
            end
        else
            if i == 17 then
                menuButton:SetPoint("TOPLEFT", itemButtons[16], "BOTTOMLEFT")
            else
                menuButton:SetPoint("TOPLEFT", itemButtons[i-1], "BOTTOMLEFT")
            end
        end
    end

    -- Back button
    local backButton = CreateFrame("Button", frame:GetName().."_BACK", frame)
    AtlasLoot_ApplyClassButtonTemplate(backButton)
    backButton:SetPoint("BOTTOM", frame, "BOTTOM", 0, 8)
    backButton:Hide()

    -- Prev button
    local prevButton = CreateFrame("Button", frame:GetName().."_PREV", frame)
    AtlasLoot_ApplyNavigationButtonTemplate(prevButton, "prev")
    prevButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 5, 5)

    prevButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    prevButton:SetScript("OnEnter", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Previous"])
        GameTooltip:Show()
    end)

    prevButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    prevButton:SetScript("OnClick", function()
        AtlasLoot_NavButton_OnClick()
        CloseDropDownMenus()
    end)

    -- Next button
    local nextButton = CreateFrame("Button", frame:GetName().."_NEXT", frame)
    AtlasLoot_ApplyNavigationButtonTemplate(nextButton, "next")
    nextButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -5, 5)
    nextButton:SetScript("OnClick", function()
        AtlasLoot_NavButton_OnClick()
        CloseDropDownMenus()
    end)
    nextButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    return frame
end

-- AtlasLootOptionsFrame
function AtlasLoot_CreateOptionsFrame()
    local frame = CreateFrame("Frame", "AtlasLootOptionsFrame", UIParent)
    frame:SetWidth(650)
    frame:SetHeight(370)
    frame:Hide()
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    frame:SetFrameStrata("DIALOG")
    frame:SetToplevel(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:EnableKeyboard(true)
    frame:Hide()

    -- Backdrop
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "",
        tile = false,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })

    -- Title
    local title = frame:CreateFontString(frame:GetName().."_Title", "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", 0, -15)

    -- CheckButtons
    local safeLinks = CreateFrame("CheckButton", frame:GetName().."SafeLinks", frame, "OptionsCheckButtonTemplate")
    safeLinks:SetPoint("TOPLEFT", 20, -40)
    safeLinks:Disable()

    local allLinks = CreateFrame("CheckButton", frame:GetName().."AllLinks", frame, "OptionsCheckButtonTemplate")
    allLinks:SetPoint("TOPLEFT", 20, -70)

    local defaultTT = CreateFrame("CheckButton", frame:GetName().."DefaultTT", frame, "OptionsCheckButtonTemplate")
    defaultTT:SetPoint("TOPLEFT", 20, -130)

    local lootlinkTT = CreateFrame("CheckButton", frame:GetName().."LootlinkTT", frame, "OptionsCheckButtonTemplate")
    lootlinkTT:SetPoint("TOPLEFT", 20, -160)

    local itemSyncTT = CreateFrame("CheckButton", frame:GetName().."ItemSyncTT", frame, "OptionsCheckButtonTemplate")
    itemSyncTT:SetPoint("TOPLEFT", 20, -190)

    local showSource = CreateFrame("CheckButton", frame:GetName().."ShowSource", frame, "OptionsCheckButtonTemplate")
    showSource:SetPoint("TOPLEFT", 20, -220)

    local equipCompare = CreateFrame("CheckButton", frame:GetName().."EquipCompare", frame, "OptionsCheckButtonTemplate")
    equipCompare:SetPoint("TOPLEFT", 20, -250)

    local itemID = CreateFrame("CheckButton", frame:GetName().."ItemID", frame, "OptionsCheckButtonTemplate")
    itemID:SetPoint("TOPLEFT", 20, -280)

    local minimap = CreateFrame("CheckButton", frame:GetName().."Minimap", frame, "OptionsCheckButtonTemplate")
    minimap:SetPoint("TOP", 20, -40)

    local hidePanel = CreateFrame("CheckButton", frame:GetName().."HidePanel", frame, "OptionsCheckButtonTemplate")
    hidePanel:SetPoint("TOP", 20, -70)

    local opaque = CreateFrame("CheckButton", frame:GetName().."Opaque", frame, "OptionsCheckButtonTemplate")
    opaque:SetPoint("TOP", 20, -100)

    local itemSpam = CreateFrame("CheckButton", frame:GetName().."ItemSpam", frame, "OptionsCheckButtonTemplate")
    itemSpam:SetPoint("TOP", 20, -160)

    -- Sliders
    local sliderButtonRad = CreateFrame("Slider", frame:GetName().."SliderButtonRad", frame, "OptionsSliderTemplate")
    sliderButtonRad:SetWidth(240)
    sliderButtonRad:SetHeight(16)
    sliderButtonRad:SetPoint("TOP", 128, -260)

    local sliderButtonPos = CreateFrame("Slider", frame:GetName().."SliderButtonPos", frame, "OptionsSliderTemplate")
    sliderButtonPos:SetWidth(240)
    sliderButtonPos:SetHeight(16)
    sliderButtonPos:SetPoint("TOP", 128, -220)

    -- Buttons
    local doneButton = CreateFrame("Button", frame:GetName().."Done", frame, "UIPanelButtonTemplate2")
    doneButton:SetWidth(80)
    doneButton:SetHeight(20)
    doneButton:SetPoint("BOTTOM", 0, 20)

    local resetPosButton = CreateFrame("Button", frame:GetName().."ResetPosition", frame, "UIPanelButtonTemplate2")
    resetPosButton:SetWidth(160)
    resetPosButton:SetHeight(20)
    resetPosButton:SetPoint("BOTTOM", 168, 20)

    local defaultSettingsButton = CreateFrame("Button", frame:GetName().."DefaultSettings", frame, "UIPanelButtonTemplate2")
    defaultSettingsButton:SetWidth(160)
    defaultSettingsButton:SetHeight(20)
    defaultSettingsButton:SetPoint("BOTTOM", -168, 20)

    -- Scripts
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function() this:StartMoving() end)
    frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)

    -- Event handlers for checkboxes and buttons
    allLinks:SetScript("OnClick", function() AtlasLootOptions_AllLinksToggle() end)
    defaultTT:SetScript("OnClick", function() AtlasLootOptions_DefaultTTToggle() end)
    lootlinkTT:SetScript("OnClick", function() AtlasLootOptions_DefaultTTToggle() end)
    itemSyncTT:SetScript("OnClick", function() AtlasLootOptions_DefaultTTToggle() end)
    showSource:SetScript("OnClick", function() AtlasLootOptions_ShowSourceToggle() end)
    equipCompare:SetScript("OnClick", function() AtlasLootOptions_EquipCompareToggle() end)
    itemID:SetScript("OnClick", function() AtlasLootOptions_ItemIDToggle() end)
    opaque:SetScript("OnClick", function() AtlasLootOptions_OpaqueToggle() end)
    itemSpam:SetScript("OnClick", function() AtlasLootOptions_ItemSpam() end)
    doneButton:SetScript("OnClick", function() AtlasLootOptions_Toggle() end)
    resetPosButton:SetScript("OnClick", function() AtlasLootOptions_ResetPosition() end)
    defaultSettingsButton:SetScript("OnClick", function() AtlasLootOptions_DefaultSettings() end)

    minimap:SetScript("OnClick", function()
        if AtlasLootCharDB.MinimapButton == true then
            AtlasLootCharDB.MinimapButton = false
        else
            AtlasLootCharDB.MinimapButton = true
        end
        AtlasLootMinimapButton_Init()
    end)

    hidePanel:SetScript("OnClick", function()
        if AtlasLootCharDB.HidePanel == true then
            AtlasLootCharDB.HidePanel = false
            if (AtlasFrame) then
                if AtlasFrame:IsVisible() then
                    AtlasLootPanel:Show()
                end
            end
        else
            AtlasLootCharDB.HidePanel = true
            if (AtlasFrame) then
                if AtlasFrame:IsVisible() then
                    AtlasLootPanel:Hide()
                end
            end
        end
    end)

    sliderButtonRad:SetScript("OnValueChanged", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        -- Передаем слайдер явно в функцию
        AtlasLootOptions_UpdateSliderWithFrame(sliderButtonRad, L["Button Radius"])
        AtlasLootCharDB.MinimapButtonRadius = sliderButtonRad:GetValue()
        AtlasLootMinimapButton_UpdatePosition()
    end)

    sliderButtonPos:SetScript("OnValueChanged", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        -- Передаем слайдер явно в функцию
        AtlasLootOptions_UpdateSliderWithFrame(sliderButtonPos, L["Button Position"])
        AtlasLootCharDB.MinimapButtonPosition = sliderButtonPos:GetValue()
        AtlasLootMinimapButton_UpdatePosition()
    end)

    return frame
end

-- AtlasLootPanel
function AtlasLoot_CreatePanel()
    local frame = CreateFrame("Frame", "AtlasLootPanel", UIParent)
    frame:SetWidth(870)
    frame:SetHeight(110)
    frame:Hide()
    frame:EnableMouse(true)

    -- Backdrop
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })

    -- Top row buttons
    local worldEvents = CreateFrame("Button", frame:GetName().."_WorldEvents", frame)
    AtlasLoot_ApplyPanelButtonTemplate(worldEvents)
    worldEvents:SetPoint("LEFT", frame, "LEFT", 15, 29)

    local sets = CreateFrame("Button", frame:GetName().."_Sets", frame)
    AtlasLoot_ApplyPanelButtonTemplate(sets)
    sets:SetPoint("LEFT", worldEvents, "RIGHT", 0, 0)

    local reputation = CreateFrame("Button", frame:GetName().."_Reputation", frame)
    AtlasLoot_ApplyPanelButtonTemplate(reputation)
    reputation:SetPoint("LEFT", sets, "RIGHT", 0, 0)

    local pvp = CreateFrame("Button", frame:GetName().."_PvP", frame)
    AtlasLoot_ApplyPanelButtonTemplate(pvp)
    pvp:SetPoint("LEFT", reputation, "RIGHT", 0, 0)

    local crafting = CreateFrame("Button", frame:GetName().."_Crafting", frame)
    AtlasLoot_ApplyPanelButtonTemplate(crafting)
    crafting:SetPoint("LEFT", pvp, "RIGHT", 0, 0)

    local wishList = CreateFrame("Button", frame:GetName().."_WishList", frame)
    AtlasLoot_ApplyPanelButtonTemplate(wishList)
    wishList:SetPoint("LEFT", crafting, "RIGHT", 0, 0)

    -- Bottom row buttons
    local options = CreateFrame("Button", frame:GetName().."_Options", frame)
    AtlasLoot_ApplyPanelButtonTemplate(options)
    options:SetPoint("TOP", worldEvents, "BOTTOM", 0, -2)

    local atlasLoot = CreateFrame("Button", frame:GetName().."_AtlasLoot", frame)
    AtlasLoot_ApplyPanelButtonTemplate(atlasLoot)
    atlasLoot:SetPoint("TOP", sets, "BOTTOM", 0, -2)

    local preset1 = CreateFrame("Button", frame:GetName().."_Preset1", frame)
    AtlasLoot_ApplyPanelButtonTemplate(preset1)
    preset1:SetPoint("TOP", reputation, "BOTTOM", 0, -2)

    local preset2 = CreateFrame("Button", frame:GetName().."_Preset2", frame)
    AtlasLoot_ApplyPanelButtonTemplate(preset2)
    preset2:SetPoint("TOP", pvp, "BOTTOM", 0, -2)

    local preset3 = CreateFrame("Button", frame:GetName().."_Preset3", frame)
    AtlasLoot_ApplyPanelButtonTemplate(preset3)
    preset3:SetPoint("TOP", crafting, "BOTTOM", 0, -2)

    local preset4 = CreateFrame("Button", frame:GetName().."_Preset4", frame)
    AtlasLoot_ApplyPanelButtonTemplate(preset4)
    preset4:SetPoint("TOP", wishList, "BOTTOM", 0, -2)

    -- Search elements
    local searchBox = CreateFrame("EditBox", "AtlasLootSearchBox", frame, "InputBoxTemplate")
    searchBox:SetWidth(300)
    searchBox:SetHeight(35)
    searchBox:SetPoint("BOTTOM", -123, 20)
    searchBox:SetAutoFocus(false)
    searchBox:SetTextInsets(0, 8, 0, 0)
    searchBox:SetMaxLetters(100)

    local searchButton = CreateFrame("Button", "AtlasLootSearchButton", searchBox, "UIPanelButtonTemplate2")
    searchButton:SetWidth(69)
    searchButton:SetHeight(32)
    searchButton:SetPoint("LEFT", searchBox, "RIGHT", 0, 0)

    local searchOptionsButton = CreateFrame("Button", "AtlasLootSearchOptionsButton", searchButton)
    searchOptionsButton:SetWidth(28)
    searchOptionsButton:SetHeight(28)
    searchOptionsButton:SetPoint("LEFT", searchButton, "RIGHT", -2, 0)
    searchOptionsButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
    searchOptionsButton:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
    searchOptionsButton:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
    searchOptionsButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

    local searchClearButton = CreateFrame("Button", "AtlasLootSearchClearButton", searchBox, "UIPanelButtonTemplate")
    searchClearButton:SetWidth(58)
    searchClearButton:SetHeight(32)
    searchClearButton:SetPoint("LEFT", searchOptionsButton, "RIGHT", -2, 0)

    local lastResultButton = CreateFrame("Button", "AtlasLootLastResultButton", frame)
    AtlasLoot_ApplyPanelButtonTemplate(lastResultButton)
    lastResultButton:SetPoint("LEFT", searchClearButton, "RIGHT", 0, 0)

    -- Event handlers
    worldEvents:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLootWorldEventMenu()
    end)

    sets:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLootSetMenu()
    end)

    reputation:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLootRepMenu()
    end)

    pvp:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLootPvPMenu()
    end)

    crafting:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLoot_CraftingMenu()
    end)

    wishList:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLoot_ShowWishList()
    end)

    options:SetScript("OnClick", function() AtlasLootOptions_Toggle() end)

    atlasLoot:SetScript("OnClick", function()
        if AtlasLootSearchBox:GetText() ~= "" then
            AtlasLootDefaultFrameSearchBox:SetText(AtlasLootSearchBox:GetText())
            AtlasLootDefaultFrameSearchBox:ClearFocus()
        end
        AtlasLoot_Toggle()
    end)

    searchBox:SetScript("OnEnterPressed", function()
        AtlasLoot:Search(this:GetText())
        this:ClearFocus()
    end)

    searchButton:SetScript("OnClick", function()
        AtlasLoot:Search(AtlasLootSearchBox:GetText())
        AtlasLootSearchBox:ClearFocus()
    end)

    searchOptionsButton:SetScript("OnClick", function() AtlasLoot:ShowSearchOptions(this) end)

    searchClearButton:SetScript("OnClick", function()
        AtlasLootSearchBox:SetText("")
        AtlasLootSearchBox:ClearFocus()
    end)

    lastResultButton:SetScript("OnClick", function() AtlasLoot:ShowSearchResult() end)

    return frame
end

-- AtlasLootMinimapButtonFrame
function AtlasLoot_CreateMinimapButton()
    local frame = CreateFrame("Frame", "AtlasLootMinimapButtonFrame", Minimap)
    frame:SetWidth(32)
    frame:SetHeight(32)
    frame:SetPoint("TOPLEFT", Minimap, "RIGHT", 2, 0)
    frame:EnableMouse(true)
    frame:Hide()
    frame:SetFrameStrata("LOW")

    local button = CreateFrame("Button", "AtlasLootMinimapButton", frame)
    button:SetWidth(33)
    button:SetHeight(33)
    button:SetPoint("TOPLEFT", 0, 0)
    button:SetNormalTexture("Interface\\AddOns\\Atlas-TW\\Loot\\Images\\AtlasLootMinimap")
    button:SetPushedTexture("Interface\\AddOns\\Atlas-TW\\Loot\\Images\\AtlasLootMinimap")
    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

    button:RegisterForDrag("RightButton")
    button.aldragme = false

    button:SetScript("OnDragStart", function() this.aldragme = true end)
    button:SetScript("OnDragStop", function() this.aldragme = false end)
    button:SetScript("OnUpdate", function()
        if this.aldragme == true then
            AtlasLootMinimapButton_BeingDragged()
        end
    end)
    button:SetScript("OnClick", function() AtlasLootMinimapButton_OnClick(arg1) end)
    button:SetScript("OnMouseUp", function()
        if arg1 == "MiddleButton" then
            AtlasLootOptions_Toggle()
        end
    end)
    button:SetScript("OnEnter", function() AtlasLootMinimapButton_OnEnter() end)
    button:SetScript("OnLeave", function() GameTooltip:Hide() end)

    frame:RegisterEvent("VARIABLES_LOADED")
    frame:SetScript("OnEvent", function() AtlasLootMinimapButton_Init() end)

    return frame
end

-- Функция инициализации опций (заменяет OnLoad события)
function AtlasLoot_InitializeOptionsFrame()
    local L = AceLibrary("AceLocale-2.2"):new("Atlas")

    -- Инициализация заголовка
    _G["AtlasLootOptionsFrame_Title"]:SetText(L["Atlasloot Options"])

    -- Инициализация текстов чекбоксов
    _G["AtlasLootOptionsFrameSafeLinksText"]:SetText(L["Safe Chat Links |cff1eff00(recommended)|r"])
    _G["AtlasLootOptionsFrameAllLinksText"]:SetText(L["Enable all Chat Links |cffff0000(use at own risk)|r"])
    _G["AtlasLootOptionsFrameDefaultTTText"]:SetText(L["Default Tooltips"])
    _G["AtlasLootOptionsFrameLootlinkTTText"]:SetText(L["Lootlink Tooltips"])
    _G["AtlasLootOptionsFrameItemSyncTTText"]:SetText(L["ItemSync Tooltips"])
    _G["AtlasLootOptionsFrameShowSourceText"]:SetText(L["Show Source on Tooltips"])
    _G["AtlasLootOptionsFrameEquipCompareText"]:SetText(L["Use EquipCompare"])
    _G["AtlasLootOptionsFrameItemIDText"]:SetText(L["Show IDs at all times"])
    _G["AtlasLootOptionsFrameMinimapText"]:SetText(L["Show Minimap Button"])
    _G["AtlasLootOptionsFrameHidePanelText"]:SetText(L["Hide AtlasLoot Panel"])
    _G["AtlasLootOptionsFrameOpaqueText"]:SetText(L["Make Loot Table Opaque"])
    _G["AtlasLootOptionsFrameItemSpamText"]:SetText(L["Suppress text spam when querying items"])

    -- Инициализация слайдеров
    AtlasLootOptions_SetupSliderWithFrame(AtlasLootOptionsFrameSliderButtonRad, L["Button Radius"], 0, 200, 1)
    AtlasLootOptions_SetupSliderWithFrame(AtlasLootOptionsFrameSliderButtonPos, L["Button Position"], 0, 360, 1)

    -- Инициализация кнопок
    _G["AtlasLootOptionsFrameDone"]:SetText(L["Done"])
    _G["AtlasLootOptionsFrameResetPosition"]:SetText(L["Reset Position"])
    _G["AtlasLootOptionsFrameDefaultSettings"]:SetText(L["Default Settings"])
end

-- Функция инициализации панели (заменяет OnShow события)
function AtlasLoot_InitializePanelButtons()
    local L = AceLibrary("AceLocale-2.2"):new("Atlas")

    -- Инициализация текстов кнопок
    _G["AtlasLootPanel_WorldEvents"]:SetText(L["World Events"])
    _G["AtlasLootPanel_Sets"]:SetText(L["Collections"])
    _G["AtlasLootPanel_Reputation"]:SetText(L["Factions"])
    _G["AtlasLootPanel_PvP"]:SetText(L["PvP Rewards"])
    _G["AtlasLootPanel_Crafting"]:SetText(L["Crafting"])
    _G["AtlasLootPanel_WishList"]:SetText(L["WishList"])
    _G["AtlasLootPanel_Options"]:SetText(L["Options"])
    _G["AtlasLootPanel_AtlasLoot"]:SetText(L["AtlasLoot"])
    _G["AtlasLootPanel_Preset1"]:SetText(L["QuickLook"].." 1")
    _G["AtlasLootPanel_Preset2"]:SetText(L["QuickLook"].." 2")
    _G["AtlasLootPanel_Preset3"]:SetText(L["QuickLook"].." 3")
    _G["AtlasLootPanel_Preset4"]:SetText(L["QuickLook"].." 4")
    _G["AtlasLootSearchButton"]:SetText(L["Search"])
    _G["AtlasLootSearchClearButton"]:SetText(L["Clear"])
    _G["AtlasLootLastResultButton"]:SetText(L["Last Result"])
end

-- Create main AtlasLootDefaultFrame with all child elements
function AtlasLoot_CreateDefaultFrame()
    local frame = CreateFrame("Frame", "AtlasLootDefaultFrame", UIParent)
    frame:SetWidth(600)
    frame:SetHeight(700)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:EnableKeyboard(true)
    frame:Hide()

    -- Set backdrop
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        tile = false
    })
    frame:SetBackdropColor(0.75, 0, 0.75)

    -- Make frame draggable
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function()
        this:StartMoving()
    end)
    frame:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
    end)

    -- Frame scripts
    frame:SetScript("OnMouseUp", function()
        CloseDropDownMenus()
    end)

    frame:SetScript("OnShow", function()
        AtlasLootDefaultFrame_OnShow()
    end)

    frame:SetScript("OnHide", function()
        AtlasLootDefaultFrame_OnHide()
    end)

    -- Close button
    local closeButton = CreateFrame("Button", frame:GetName().."_CloseButton", frame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10, -10)
    closeButton:SetScript("OnClick", function()
        AtlasLootDefaultFrame:Hide()
    end)
    closeButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- Atlas button
    local atlasButton = CreateFrame("Button", frame:GetName().."_Atlas", frame, "OptionsButtonTemplate")
    atlasButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -38, -15)
    atlasButton:SetWidth(130)
    atlasButton:SetHeight(20)
    atlasButton:Hide()
    atlasButton:SetScript("OnClick", function()
        if AtlasLootDefaultFrameSearchBox:GetText() ~= "" then
            AtlasLootSearchBox:SetText(AtlasLootDefaultFrameSearchBox:GetText())
            AtlasLootSearchBox:ClearFocus()
        end
        Atlas_Toggle()
        CloseDropDownMenus()
    end)
    atlasButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Atlas"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        this:Enable()
    end)

    -- Options button
    local optionsButton = CreateFrame("Button", frame:GetName().."_Options", frame, "OptionsButtonTemplate")
    optionsButton:SetWidth(130)
    optionsButton:SetHeight(20)
    optionsButton:Hide()
    optionsButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -15)
    optionsButton:SetScript("OnClick", function()
        AtlasLootOptions_Toggle()
        CloseDropDownMenus()
    end)
    optionsButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Options"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- Menu button
    local menuButton = CreateFrame("Button", frame:GetName().."_Menu", frame, "OptionsButtonTemplate")
    menuButton:SetWidth(130)
    menuButton:SetHeight(20)
    menuButton:SetPoint("TOP", frame, "TOP", -130, -40)
    menuButton:SetScript("OnClick", function()
        if AtlasLoot_Hewdrop:IsOpen() then
            AtlasLoot_Hewdrop:Close()
        else
            AtlasLoot_Hewdrop:Open(this)
        end
    end)
    menuButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Select Loot Table"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- SubMenu button
    local subMenuButton = CreateFrame("Button", frame:GetName().."_SubMenu", frame, "OptionsButtonTemplate")
    subMenuButton:SetWidth(130)
    subMenuButton:SetHeight(20)
    subMenuButton:SetPoint("TOP", frame, "TOP", 130, -40)
    subMenuButton:SetScript("OnClick", function()
        if AtlasLoot_HewdropSubMenu:IsOpen() then
            AtlasLoot_HewdropSubMenu:Close()
        else
            AtlasLoot_HewdropSubMenu:Open(this)
        end
    end)
    subMenuButton:SetScript("OnShow", function()
        local L = AceLibrary("AceLocale-2.2"):new("Atlas")
        this:SetText(L["Select Sub-Table"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- Loot background frame
    local lootBg = CreateFrame("Frame", frame:GetName().."_LootBackground", frame)
    lootBg:SetWidth(515)
    lootBg:SetHeight(515)
    lootBg:SetPoint("BOTTOM", frame, "BOTTOM", 0, 100)

    local lootBgTexture = lootBg:CreateTexture(lootBg:GetName().."_Back", "BACKGROUND")
    lootBgTexture:SetAllPoints(lootBg)
    lootBgTexture:SetVertexColor(0, 0, 1, 0.5)

    -- Create all child elements
    AtlasLoot_CreatePresetButtons(frame)
    AtlasLoot_CreateSearchElements(frame)
    AtlasLoot_CreateFontStrings(frame)

    return frame
end

-- Updated initialization function
function AtlasLoot_InitializeUI()
    AtlasLoot_CreateContainerItemTemplate()
    AtlasLoot_CreateTooltips()
    AtlasLoot_CreateInfoFrame()
    AtlasLoot_CreateItemsFrame()
    AtlasLoot_CreateDefaultFrame()
    AtlasLoot_CreateOptionsFrame()
    AtlasLoot_CreatePanel()
    AtlasLoot_CreateMinimapButton()

    -- Инициализируем тексты после создания фреймов
    AtlasLoot_InitializeOptionsFrame()
    AtlasLoot_InitializePanelButtons()
end