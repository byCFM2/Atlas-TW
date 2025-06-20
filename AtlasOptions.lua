---------------
--- COLOURS ---
---------------
local red = "|cffff0000"
local blue = "|cff0070dd"
-- Локальные ссылки на глобальные функции для повышения производительности
local _G = getfenv()
local AtlasTW = _G.AtlasTW
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local uIDropDownMenu_SetSelectedID = UIDropDownMenu_SetSelectedID

-- Локальные переменные для часто используемых элементов UI
local atlasOptionsFrame, atlasFrame  = AtlasOptionsFrame, AtlasFrame

-- Утилитарная функция для округления
local function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Установка значений по умолчанию
function AtlasOptions_DefaultSettings()
    AtlasTWOptions = {
        AtlasButtonPosition = 305,
        AtlasButtonRadius = 76,
        AtlasButtonShown = true,
        AtlasRightClick = false,
        AtlasType = 1,
        AtlasScale = 1,
        AtlasVersion = AtlasTW.Version,
        AtlasZone = 1,
        AtlasSortBy = 1,
        AtlasAutoSelect = false,
        AtlasLocked = false,
        AtlasAlpha = 1.0,
        AtlasAcronyms = true,
        AtlasClamped = true,
        QuestCurrentSide = "Left",
        QuestWithAtlas = true,
        QuestColourCheck = true,
        QuestCheckQuestlog = true,
        QuestAutoQuery = true,
        QuestQuerySpam = true,
        QuestCompareTooltip = true,
        LootSafeLinks = true,
        LootAllLinks = false,
        LootDefaultTT = true,
        LootlinkTT = false,
        LootItemSyncTT = false,
        LootShowSource = true,
        LootEquipCompare = false,
        LootOpaque = true,
        LootItemIDs = true,
        LootItemSpam = true,
        LootShowPanel = true
    }
	AtlasTWCharDB.PartialMatching = true
	AtlasTWCharDB.LastBoss = "DUNGEONSMENU1"
	AtlasTWCharDB.LastBossText = L["Dungeons & Raids"]
	AtlasTWCharDB["QuickLooks"] = {}
	AtlasTWCharDB["WishList"] = {}
	AtlasLoot_RefreshQuickLookButtons()
	AtlasTW.OptionsInit()
	DEFAULT_CHAT_FRAME:AddMessage(blue.."Atlas-TW"..": "..red..L["Default settings applied!"])
end

function AtlasOptionsShowPanelButton_OnClick()
    local showPanelStatus = AtlasTWOptions.LootShowPanel
    AtlasTWOptions.LootShowPanel = not showPanelStatus
    if showPanelStatus then
        AtlasLootPanel:Hide()
    else
        AtlasLootPanel:Show()
    end
    AtlasLootOptionsFrameShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
end

-- Основные функции переключения опций
function AtlasOptions_Toggle()
    if atlasOptionsFrame:IsVisible() then
        atlasOptionsFrame:Hide()
    else
        atlasOptionsFrame:Show()
    end
    -- Refresh tooltip settings to ensure they take effect immediately
    if AtlasTWOptions.LootDefaultTT then
        AtlasLootOptions_DefaultTTToggle()
    elseif AtlasTWOptions.LootlinkTT then
        AtlasLootOptions_LootlinkTTToggle()
    elseif AtlasTWOptions.LootItemSyncTT then
        AtlasLootOptions_ItemSyncTTToggle()
    end
end

function AtlasOptions_AutoSelectToggle()
    AtlasTWOptions.AtlasAutoSelect = not AtlasTWOptions.AtlasAutoSelect
    AtlasTW.OptionsInit()
end

function AtlasOptions_RightClickToggle()
    AtlasTWOptions.AtlasRightClick = not AtlasTWOptions.AtlasRightClick
    AtlasTW.OptionsInit()
end

function AtlasOptions_AcronymsToggle()

    AtlasTWOptions.AtlasAcronyms = not AtlasTWOptions.AtlasAcronyms
    AtlasTW.OptionsInit()
    Atlas_Refresh()
end

function AtlasOptions_ClampedToggle()
    AtlasTWOptions.AtlasClamped = not AtlasTWOptions.AtlasClamped
    atlasFrame:SetClampedToScreen(AtlasTWOptions.AtlasClamped)
    AtlasTW.OptionsInit()
    Atlas_Refresh()
end

-- Инициализация настроек
function AtlasTW.OptionsInit()
    if not AtlasTWOptions then
        DEFAULT_CHAT_FRAME:AddMessage(AtlasTW.Name..": Failed to initialize local references.")
        return
    end
    if AtlasTWOptions.QuestWithAtlas then
        AtlasTW.Quest.UI_Main.Frame:Show()
    else
        AtlasTW.Quest.UI_Main.Frame:Hide()
    end
	--Consult the saved variable table to see whether to show the bottom panel
	if AtlasTWOptions.LootShowPanel then
		AtlasLootPanel:Show()
	else
		AtlasLootPanel:Hide()
	end
    -- Установка значений при загрузке
    AtlasOptionsFrameToggleButton:SetChecked(AtlasTWOptions.AtlasButtonShown)
    AtlasOptionsFrameAutoSelect:SetChecked(AtlasTWOptions.AtlasAutoSelect)
    AtlasOptionsFrameRightClick:SetChecked(AtlasTWOptions.AtlasRightClick)
    AtlasOptionsFrameAcronyms:SetChecked(AtlasTWOptions.AtlasAcronyms)
    AtlasOptionsFrameClamped:SetChecked(AtlasTWOptions.AtlasClamped)
    AtlasOptionsFrameSliderButtonPos:SetValue(AtlasTWOptions.AtlasButtonPosition)
    AtlasOptionsFrameSliderButtonRad:SetValue(AtlasTWOptions.AtlasButtonRadius)
    AtlasOptionsFrameSliderAlpha:SetValue(AtlasTWOptions.AtlasAlpha)
    AtlasOptionsFrameSliderScale:SetValue(AtlasTWOptions.AtlasScale)

	-- Quest Options
	KQAutoshowOption:SetChecked(AtlasTWOptions.QuestWithAtlas)
	KQLEFTOption:SetChecked(AtlasTWOptions.QuestCurrentSide == "Left")
	KQRIGHTOption:SetChecked(AtlasTWOptions.QuestCurrentSide == "Right")
     if KQRIGHTOption:GetChecked() then
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", 567, -36)
    else
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", -556, -36)
    end
	KQColourOption:SetChecked(AtlasTWOptions.QuestColourCheck)
	KQCheckQuestlogButton:SetChecked(AtlasTWOptions.QuestCheckQuestlog)
	KQAutoQueryOption:SetChecked(AtlasTWOptions.QuestAutoQuery)
	KQQuerySpamOption:SetChecked(AtlasTWOptions.QuestQuerySpam)
	KQCompareTooltipOption:SetChecked(AtlasTWOptions.QuestCompareTooltip)

	-- Loot Options
	AtlasLootOptionsFrameSafeLinks:SetChecked(AtlasTWOptions.LootSafeLinks)
	AtlasLootOptionsFrameAllLinks:SetChecked(AtlasTWOptions.LootAllLinks)
	AtlasLootOptionsFrameDefaultTT:SetChecked(AtlasTWOptions.LootDefaultTT)
	AtlasLootOptionsFrameLootlinkTT:SetChecked(AtlasTWOptions.LootlinkTT)
	AtlasLootOptionsFrameItemSyncTT:SetChecked(AtlasTWOptions.LootItemSyncTT)
	AtlasLootOptionsFrameShowSource:SetChecked(AtlasTWOptions.LootShowSource)
	AtlasLootOptionsFrameEquipCompare:SetChecked(AtlasTWOptions.LootEquipCompare)
	AtlasLootOptionsFrameOpaque:SetChecked(AtlasTWOptions.LootOpaque)
	AtlasLootOptionsFrameItemID:SetChecked(AtlasTWOptions.LootItemIDs)
	AtlasLootOptionsFrameItemSpam:SetChecked(AtlasTWOptions.LootItemSpam)
    AtlasLootOptionsFrameShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
end

-- Сброс позиции
function AtlasOptions_ResetPosition()
    atlasFrame:ClearAllPoints()
    atlasFrame:SetPoint("TOP", 0, -104)

    -- Сброс настроек к значениям по умолчанию
    AtlasTWOptions.AtlasButtonPosition = 305
    AtlasTWOptions.AtlasButtonRadius = 76
    AtlasTWOptions.AtlasAlpha = 1.0
    AtlasTWOptions.AtlasScale = 1.0

    AtlasTW.OptionsInit()
end

-- Обновление слайдера
function AtlasOptions_UpdateSlider(text)
    local sliderName = this:GetName()
    local textElement = _G[sliderName .. "Text"]
    if textElement then
        textElement:SetText(text .. " (" .. round(this:GetValue(), 2) .. ")")
    end
end

-- Локальные функции для dropdown меню
local function atlasOptionsFrameDropDownCats_OnClick()
    local thisID = this:GetID()
    uIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, thisID)
    AtlasTWOptions.AtlasSortBy = thisID
    AtlasTWOptions.AtlasZone = 1
    AtlasTWOptions.AtlasType = 1

    -- Обновление интерфейса
    Atlas_PopulateDropdowns()
    Atlas_Refresh()
    AtlasFrameDropDownType_OnShow()
    AtlasFrameDropDown_OnShow()
end

local function atlasOptionsFrameDropDownCats_Initialize()
    local info
    local dropDownOrder = AtlasTW_DropDownSortOrder

    if not dropDownOrder then
        return
    end

    for i = 1, getn(dropDownOrder) do
        info = {
            text = dropDownOrder[i],
            func = atlasOptionsFrameDropDownCats_OnClick
        }
        UIDropDownMenu_AddButton(info)
    end
end

-- Показ dropdown категорий
function AtlasOptionsFrameDropDownCats_OnShow()
    local dropDownCats = AtlasOptionsFrameDropDownCats

    UIDropDownMenu_Initialize(dropDownCats, atlasOptionsFrameDropDownCats_Initialize)
    uIDropDownMenu_SetSelectedID(dropDownCats, AtlasTWOptions.AtlasSortBy)
end