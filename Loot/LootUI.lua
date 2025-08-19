local _G = getfenv()

local L = AtlasTW.Local

-- Функция для копирования свойств родительского шаблона
local function AtlasLoot_ApplyParentTemplate(frame)
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
        priceText:SetWidth(30)
        priceText:SetHeight(5)
        priceText:SetText("")
        priceText:Hide()
        -- Позиционирование будет установлено динамически при показе элементов
        priceIcon:SetPoint("TOPRIGHT", name, "BOTTOMRIGHT", 20, -2)
        priceText:SetPoint("TOPRIGHT", priceIcon, "TOPRIGHT", 2, 2)
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

-- Функция для применения свойств навигационных кнопок
local function AtlasLoot_ApplyNavigationButtonTemplate(button, buttonType)
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

-- Функция для применения свойств AtlasLootContainerItemTemplate
function AtlasLoot_ApplyContainerItemTemplate(button)
    button:SetWidth(40)
    button:SetHeight(40)

    -- Create backdrop
    button:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        edgeSize = 19,
        tileSize = 8,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })

    -- Create icon texture
    local icon = button:CreateTexture(button:GetName().."Icon", "BACKGROUND")
    icon:SetWidth(32)
    icon:SetHeight(32)
    icon:SetPoint("TOPLEFT", button, "TOPLEFT", 4, -4)

    -- Create quantity text
    local quantity = button:CreateFontString(button:GetName().."_Quantity", "BACKGROUND", "GameFontNormal")
    quantity:SetWidth(25)
    quantity:SetHeight(0)
    quantity:SetFont("Fonts\\ARIALN.TTF", 12, "OUTLINE")
    quantity:SetJustifyH("RIGHT")
    quantity:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 1)

    -- Set click script
    button:SetScript("OnClick", function()
        AtlasLoot_ContainerItem_OnClick(arg1)
    end)
end

-- Create Preset buttons (QuickLook buttons)
local function AtlasLoot_CreatePresetButtons(frame)
    local presetButton = {}
    for i = 1, 6 do
        presetButton[i] = CreateFrame("Button", frame:GetName().."_Preset"..i, frame, "OptionsButtonTemplate")
        presetButton[i]:SetText(L["QuickLook"].." "..i)
        if i == 1 then
            presetButton[i]:SetPoint("LEFT", 15, 1)
        else
            presetButton[i]:SetPoint("LEFT", presetButton[i-1], "RIGHT", 0, 0)
        end

        -- Создаем локальную переменную для захвата правильного индекса
        local buttonIndex = i
        presetButton[i]:SetScript("OnEnter", function()
            if this:IsEnabled() then
                GameTooltip:ClearLines()
                GameTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 5)
                if AtlasTWCharDB and AtlasTWCharDB["QuickLooks"] and AtlasTWCharDB["QuickLooks"][buttonIndex] and AtlasTWCharDB["QuickLooks"][buttonIndex][3] then
                    GameTooltip:AddLine(AtlasTWCharDB["QuickLooks"][buttonIndex][3])
                end
                GameTooltip:AddLine(L["|cff9d9d9dALT+Click to clear|r"])
                GameTooltip:Show()
            end
        end)

        presetButton[i]:SetScript("OnLeave", function()
            if GameTooltip:IsVisible() then
                GameTooltip:Hide()
            end
        end)

        presetButton[i]:SetScript("OnMouseUp", function()
            if IsAltKeyDown() then
                AtlasLoot_ClearQuickLookButton(buttonIndex)
            end
        end)

        presetButton[i]:SetScript("OnClick", function()
            if AtlasTWCharDB and AtlasTWCharDB["QuickLooks"] and AtlasTWCharDB["QuickLooks"][buttonIndex] and AtlasTWCharDB["QuickLooks"][buttonIndex][1] then
                if AtlasLoot_IsLootTableAvailable(AtlasTWCharDB["QuickLooks"][buttonIndex][1]) then
                    AtlasLoot_ShowItemsFrame(AtlasTWCharDB["QuickLooks"][buttonIndex][1], AtlasTWCharDB["QuickLooks"][buttonIndex][2], AtlasTWCharDB["QuickLooks"][buttonIndex][3])
                end
            end
        end)

        presetButton[i]:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
            if (not AtlasTWCharDB) or (not AtlasTWCharDB["QuickLooks"]) or (not AtlasTWCharDB["QuickLooks"][buttonIndex]) or (not AtlasTWCharDB["QuickLooks"][buttonIndex][1]) or
                (AtlasTWCharDB["QuickLooks"][buttonIndex][1] == nil) then
                this:Disable()
            else
                this:Enable()
            end
        end)
    end

    return presetButton
end

-- Create Search Box and related buttons
local function AtlasLoot_CreateSearchElements(frame)
    -- Search Box
    local searchBox = CreateFrame("EditBox", "AtlasLootSearchBox", frame, "InputBoxTemplate")
    searchBox:SetWidth(214)
    searchBox:SetHeight(20)
    searchBox:SetPoint("BOTTOMLEFT", 112, 13)
    searchBox:SetAutoFocus(false)
    searchBox:SetTextInsets(0, 8, 0, 0)
    searchBox:SetMaxLetters(100)

    searchBox:SetScript("OnEnterPressed", function()
        AtlasLoot:Search(this:GetText())
        this:ClearFocus()
    end)

    -- Search Button
    local searchButton = CreateFrame("Button", nil, searchBox, "OptionsButtonTemplate")
    searchButton:SetWidth(55)
    searchButton:SetPoint("LEFT", searchBox, "RIGHT", 2, 0)

    searchButton:SetScript("OnShow", function()
        this:SetText(L["Search"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    searchButton:SetScript("OnClick", function()
        AtlasLoot:Search(AtlasLootSearchBox:GetText())
        AtlasLootSearchBox:ClearFocus()
        CloseDropDownMenus()
    end)

    -- Search Options Button
    local searchOptionsButton = CreateFrame("Button", nil, searchButton)
    searchOptionsButton:SetWidth(28)
    searchOptionsButton:SetHeight(28)
    searchOptionsButton:SetPoint("LEFT", searchButton, "RIGHT", -2, 0)

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
    local clearButton = CreateFrame("Button", nil, searchBox, "OptionsButtonTemplate")
    clearButton:SetWidth(58)
    clearButton:SetPoint("LEFT", searchOptionsButton, "RIGHT", -2, 0)

    clearButton:SetScript("OnShow", function()
        this:SetText(L["Clear"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    clearButton:SetScript("OnClick", function()
        AtlasLootSearchBox:SetText("")
        AtlasLootSearchBox:ClearFocus()
        CloseDropDownMenus()
    end)

    -- Last Result Button
    local lastResultButton = CreateFrame("Button", nil, searchBox, "OptionsButtonTemplate")
    lastResultButton:SetPoint("LEFT", clearButton, "RIGHT", 0, 0)

    lastResultButton:SetScript("OnShow", function()
        this:SetText(L["Last Result"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    lastResultButton:SetScript("OnClick", function()
        AtlasLoot:ShowSearchResult()
        CloseDropDownMenus()
    end)

    -- WishList Button
    local wishListButton = CreateFrame("Button", nil, frame, "OptionsButtonTemplate")
    wishListButton:SetPoint("RIGHT", searchBox, "LEFT", -7, 0)

    wishListButton:SetScript("OnClick", function()
        AtlasLoot_ShowWishList()
        CloseDropDownMenus()
        AtlasLootItemsFrame_SubMenu:Disable()
        AtlasLootItemsFrame_SelectedTable:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLoot_QuickLooks:Hide()
    end)

    wishListButton:SetScript("OnShow", function()
        this:SetText(L["WishList"])
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    wishListButton:SetScript("OnEnter", function()
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
local function AtlasLoot_CreateFontStrings(frame)
    -- Selected Category text
    local selectedCategory = frame:CreateFontString(frame:GetName().."_SelectedCategory", "OVERLAY", "GameFontNormal")
    selectedCategory:SetPoint("TOP", "AtlasLootItemsFrame_Menu", "TOP", 0, 15)
    selectedCategory:SetText("Test")

    -- Selected Table text
    local selectedTable = frame:CreateFontString(frame:GetName().."_SelectedTable", "OVERLAY", "GameFontNormal")
	selectedTable:SetPoint("TOP", "AtlasLootItemsFrame_SubMenu", "TOP", 0, 15)
    selectedTable:SetText("Test")

    return {
        selectedCategory = selectedCategory,
        selectedTable = selectedTable
    }
end

-- Create tooltips
local function AtlasLoot_CreateTooltips()
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
        button:SetScript("OnClick", function() AtlasLootMenuItem_OnClick(this) end)
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
        lootIcon:SetWidth(14)
        lootIcon:SetHeight(14)
        lootIcon:SetTexture("Interface\\Icons\\inv_holiday_christmas_present_02")
        lootIcon:SetPoint("RIGHT", button, "RIGHT")
        lootIcon:Hide()

        local selectedIcon = button:CreateTexture(button:GetName().."_Selected", "ARTWORK")
        selectedIcon:SetWidth(16)
        selectedIcon:SetHeight(16)
        selectedIcon:SetTexture("Interface\\Icons\\spell_arcane_teleportorgrimmar")
        selectedIcon:SetPoint("RIGHT", button, "RIGHT")
        selectedIcon:Hide()

        button:SetScript("OnLeave", function() GameTooltip:Hide() end)
        button:SetScript("OnClick", function() AtlasLootBoss_OnClick(this:GetName()) end)
        button:SetScript("OnShow", function() this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1) end)
    end

    return button
end

-- Create фрейм with all item buttons
local function AtlasLoot_CreateItemsFrame()
    local frame = CreateFrame("Frame", "AtlasLootItemsFrame", AtlasFrame)
    frame:SetWidth(510)
    frame:SetHeight(510)
	frame:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84)
    frame:EnableMouse(true)
    frame:EnableMouseWheel(true)
	frame:RegisterEvent("VARIABLES_LOADED")
    frame:SetScript("OnEvent", function()
        AtlasLoot_OnEvent()
    end)
    frame:Hide()

    -- Создаем скроллбар
    local scrollBar = CreateFrame("ScrollFrame", "AtlasLootScrollBar", frame, "FauxScrollFrameTemplate")
    scrollBar:SetPoint("TOPLEFT", frame, "TOPLEFT", -8, 0)
    scrollBar:SetWidth(500)
    scrollBar:SetHeight(510)
    scrollBar:SetScript("OnVerticalScroll", function()
        FauxScrollFrame_OnVerticalScroll(1, AtlasTW.Loot.ScrollBarLootUpdate)
    end)
    scrollBar:SetScript("OnShow", function()
        AtlasTW.Loot.ScrollBarLootUpdate()
    end)
    -- Background texture
    local backTexture = frame:CreateTexture(frame:GetName().."_Back", "BACKGROUND")
    backTexture:SetAllPoints(frame)
    backTexture:SetVertexColor(0, 0, 0, 0.7)

    -- Boss Name FontString
    local pageName = frame:CreateFontString("AtlasLoot_LootPageName", "OVERLAY", "GameFontHighlightLarge")
    pageName:SetWidth(512)
    pageName:SetHeight(30)
    pageName:SetJustifyH("CENTER")
    pageName:SetPoint("TOP", frame, "TOP", 0, 0)

    -- QuickLooks FontString
    local quickLooks = frame:CreateFontString("AtlasLoot_QuickLooks", "OVERLAY", "GameFontNormal")
    quickLooks:SetWidth(200)
    quickLooks:SetHeight(25)
    quickLooks:SetJustifyH("RIGHT")
    quickLooks:SetPoint("BOTTOM", frame, "BOTTOM", -124, 8)

    -- Close button
    local closeButton = CreateFrame("Button", frame:GetName().."_CloseButton", frame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10, -5)
    closeButton:SetScript("OnClick", function()
        AtlasLootItemsFrame_OnCloseButton()
    end)
    closeButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- QuickLooks button
    local quickLooksButton = CreateFrame("Button", "AtlasLootQuickLooksButton", frame)
    quickLooksButton:SetWidth(32)
    quickLooksButton:SetHeight(32)
    quickLooksButton:SetPoint("BOTTOM", frame, "BOTTOM", -20, 5)
    quickLooksButton:Hide()

    quickLooksButton:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up")
    quickLooksButton:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Down")
    quickLooksButton:SetDisabledTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Disabled")
    quickLooksButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

    quickLooksButton:SetScript("OnShow", function()
        if (AtlasLootItemsFrame.StoredElement == "SearchResult")
        or (AtlasLootItemsFrame.StoredElement == "WishList") then
            this:Disable()
        else
            this:Enable()
        end
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    quickLooksButton:SetScript("OnClick", function()
        AtlasLoot_ShowQuickLooks(this)
    end)
    quickLooksButton:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_LEFT")
        GameTooltip:SetText(L["Add to QuickLooks"])
        GameTooltip:Show()
    end)
    quickLooksButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Container frame
    local container = CreateFrame("Frame", frame:GetName().."Container", frame)
    container:SetWidth(40)
    container:SetHeight(40)
    container:SetPoint("TOPLEFT", frame, "TOPRIGHT", 0, 0)
    container:EnableMouse(true)
    container:SetFrameStrata("HIGH")
    container:Hide()
    container:SetMovable(true)
    container:SetClampedToScreen(true)

    -- Backdrop
    container:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        edgeSize = 16,
        tileSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    container:SetBackdropColor(1, 1, 1, 1)
    container:SetBackdropBorderColor(1, 0.82, 0, 1)

    -- Create 30 item buttons (2 columns, 15 rows each)
    local itemButtons = {}
    for i = 1, 30 do
        local itemButton = AtlasLoot_CreateButtonFromTemplate("AtlasLootItem_"..i, frame, "AtlasLootItem_Template")
        itemButton:SetID(i)
        itemButtons[i] = itemButton
        if i == 1 then
            itemButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -35)
        elseif i == 16 then
            itemButton:SetPoint("TOPLEFT", itemButtons[1], "TOPRIGHT", 0, 0)
        elseif i <= 15 then
            itemButton:SetPoint("TOPLEFT", itemButtons[i-1], "BOTTOMLEFT")
        else
            itemButton:SetPoint("TOPLEFT", itemButtons[i-1], "BOTTOMLEFT")
        end
    end

    -- Create 30 menu item buttons
    for i = 1, 30 do
        local menuButton = AtlasLoot_CreateButtonFromTemplate("AtlasLootMenuItem_"..i, frame, "AtlasLootMenuItem_Template")
        menuButton:SetID(i)
        if i == 1 then
            menuButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -35)
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
    local backButton = CreateFrame("Button", frame:GetName().."_BACK", frame, "OptionsButtonTemplate")
    backButton:SetPoint("BOTTOM", frame, "BOTTOM", 40, 10)
    backButton:Hide()
    backButton:SetText(L["Back"])
    backButton:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Back"]..".")
        GameTooltip:Show()
    end)
    backButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    backButton:SetScript("OnClick", function()
        AtlasLoot_NavButton_OnClick()
        CloseDropDownMenus()
    end)

    -- Prev button
    local prevButton = CreateFrame("Button", frame:GetName().."_PREV", frame)
    AtlasLoot_ApplyNavigationButtonTemplate(prevButton, "prev")
    prevButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 5)
    prevButton:SetScript("OnEnter", function()
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
    nextButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, 5)
    nextButton:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Next"])
        GameTooltip:Show()
    end)
    nextButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    nextButton:SetScript("OnClick", function()
        AtlasLoot_NavButton_OnClick()
        CloseDropDownMenus()
    end)

    -- Menu button
    local menuButton = CreateFrame("Button", frame:GetName().."_Menu", frame, "OptionsButtonTemplate")
    menuButton:SetWidth(120)
    menuButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 30, 10)
    menuButton:SetText(L["Select Loot Table"])
    menuButton:SetScript("OnClick", function()
        if AtlasLoot_Hewdrop:IsOpen() then
            AtlasLoot_Hewdrop:Close()
        else
            AtlasLoot_Hewdrop:Open(this)
        end
    end)

    -- SubMenu button
    local subMenuButton = CreateFrame("Button", frame:GetName().."_SubMenu", frame, "OptionsButtonTemplate")
    subMenuButton:SetWidth(120)
    subMenuButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -40, 10)
    subMenuButton:SetText(L["Select Sub-Table"])
    subMenuButton:SetScript("OnClick", function()
        if AtlasLoot_HewdropSubMenu:IsOpen() then
            AtlasLoot_HewdropSubMenu:Close()
        else
            AtlasLoot_HewdropSubMenu:Open(this)
        end
    end)

    -- Font strings
    AtlasLoot_CreateFontStrings(frame)

    return frame
end

-- AtlasLootPanel
local function AtlasLoot_CreatePanel()
    local frame = CreateFrame("Frame", "AtlasLootPanel", AtlasFrame)
    frame:SetWidth(570)
    frame:SetHeight(90)
	frame:SetPoint("TOP", "AtlasFrame", "BOTTOM", 0, 9)
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
    local world = CreateFrame("Button", frame:GetName().."_Instances", frame, "OptionsButtonTemplate")
    world:SetPoint("LEFT", frame, "LEFT", 15, 24)
    world:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
        AtlasLoot_WorldMenu()
    end)
    world:SetScript("OnShow", function()
        world:SetText(L["World"])
        world:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
    world:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["World"])
        GameTooltip:Show()
    end)
    world:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local worldEvents = CreateFrame("Button", frame:GetName().."_WorldEvents", frame, "OptionsButtonTemplate")
    worldEvents:SetPoint("LEFT", world, "RIGHT", 0, 0)
    worldEvents:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
        AtlasLootWorldEventMenu()
    end)
    worldEvents:SetScript("OnShow", function()
        worldEvents:SetText(L["World Events"])
        worldEvents:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
    worldEvents:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["World Events"])
        GameTooltip:Show()
    end)
    worldEvents:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local sets = CreateFrame("Button", frame:GetName().."_Sets", frame, "OptionsButtonTemplate")
    sets:SetPoint("LEFT", worldEvents, "RIGHT", 0, 0)
    sets:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLootSetMenu()
    end)
    sets:SetScript("OnShow", function()
        sets:SetText(L["Collections"])
        sets:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
    sets:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Collections"])
        GameTooltip:Show()
    end)
    sets:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local reputation = CreateFrame("Button", frame:GetName().."_Reputation", frame, "OptionsButtonTemplate")
    reputation:SetPoint("LEFT", sets, "RIGHT", 0, 0)
    reputation:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLootRepMenu()
    end)
    reputation:SetScript("OnShow", function()
        reputation:SetText(L["Factions"])
        reputation:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
    reputation:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Factions"])
        GameTooltip:Show()
    end)
    reputation:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local pvp = CreateFrame("Button", frame:GetName().."_PvP", frame, "OptionsButtonTemplate")
    pvp:SetPoint("LEFT", reputation, "RIGHT", 0, 0)
    pvp:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLootPvPMenu()
    end)
    pvp:SetScript("OnShow", function()
        pvp:SetText(L["PvP Rewards"])
        pvp:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
    pvp:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["PvP Rewards"])
        GameTooltip:Show()
    end)
    pvp:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    local crafting = CreateFrame("Button", frame:GetName().."_Crafting", frame, "OptionsButtonTemplate")
    crafting:SetPoint("LEFT", pvp, "RIGHT", 0, 0)
    crafting:SetScript("OnClick", function()
        AtlasLoot_QuickLooks:Hide()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
        AtlasLootQuickLooksButton:Hide()
        AtlasLoot_CraftingMenu()
    end)
    crafting:SetScript("OnShow", function()
        crafting:SetText(L["Crafting"])
        crafting:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
    crafting:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Crafting"])
        GameTooltip:Show()
    end)
    crafting:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Preset buttons
    AtlasLoot_CreatePresetButtons(frame)
    -- Search elements
    AtlasLoot_CreateSearchElements(frame)

    return frame
end

-- Updated initialization function
function AtlasLoot_InitializeUI()
    AtlasLoot_CreateTooltips()
    AtlasLoot_CreateItemsFrame()
    AtlasLoot_CreatePanel()
end