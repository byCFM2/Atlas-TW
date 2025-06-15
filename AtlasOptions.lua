---------------
--- COLOURS ---
---------------
local red = "|cffff0000"
local blue = "|cff0070dd"
-- Локальные ссылки на глобальные функции для повышения производительности
local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local uIDropDownMenu_SetSelectedID = UIDropDownMenu_SetSelectedID

-- Локальные переменные для часто используемых элементов UI
local atlasOptionsFrame, atlasFrame, atlasTWOptions = AtlasOptionsFrame, AtlasFrame, nil

-- Инициализация локальных ссылок
local function initializeLocalReferences()
    atlasTWOptions = AtlasTWOptions
end

-- Утилитарная функция для округления
local function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Установка значений по умолчанию
function AtlasOptions_DefaultSettings()
	AtlasLootCharDB.SafeLinks = false
	AtlasLootCharDB.AllLinks = true
	AtlasLootCharDB.DefaultTT = true
	AtlasLootCharDB.LootlinkTT = false
	AtlasLootCharDB.ItemSyncTT = false
	AtlasLootCharDB.ShowSource = true
	AtlasLootCharDB.EquipCompare = false
	AtlasLootCharDB.FirstTime = true
	AtlasLootCharDB.Opaque = true
	AtlasLootCharDB.ItemIDs = true
	AtlasLootCharDB.ItemSpam = true
	AtlasLootCharDB.ShowPanel = true
	AtlasLootCharDB.PartialMatching = true
	AtlasLootCharDB.LastBoss = "DUNGEONSMENU1"
	AtlasLootCharDB.LastBossText = L["Dungeons & Raids"]
	AtlasLootCharDB["QuickLooks"] = {}
	AtlasLootCharDB["WishList"] = {}
    AtlasKTW = {
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
    }
	AtlasLoot_RefreshQuickLookButtons()
	AtlasOptions_Init()
	DEFAULT_CHAT_FRAME:AddMessage(blue.."Atlas-TW"..": "..red..L["Default settings applied!"])
end

function AtlasOptionsShowPanelButton_OnClick()
    local showPanelStatus = AtlasLootCharDB.ShowPanel
    AtlasLootCharDB.ShowPanel = not showPanelStatus
    if showPanelStatus then
        AtlasLootPanel:Hide()
    else
        AtlasLootPanel:Show()
    end
    AtlasLootOptionsFrameShowPanel:SetChecked(AtlasLootCharDB.ShowPanel)
end

-- Основные функции переключения опций
function AtlasOptions_Toggle()
    if atlasOptionsFrame:IsVisible() then
        atlasOptionsFrame:Hide()
    else
        atlasOptionsFrame:Show()
    end
    -- Refresh tooltip settings to ensure they take effect immediately
    if AtlasLootCharDB.DefaultTT then
        AtlasLootOptions_DefaultTTToggle()
    elseif AtlasLootCharDB.LootlinkTT then
        AtlasLootOptions_LootlinkTTToggle()
    elseif AtlasLootCharDB.ItemSyncTT then
        AtlasLootOptions_ItemSyncTTToggle()
    end
end

function AtlasOptions_AutoSelectToggle()
    if not atlasTWOptions then
        initializeLocalReferences()
    end
    atlasTWOptions.AtlasAutoSelect = not atlasTWOptions.AtlasAutoSelect
    AtlasOptions_Init()
end

function AtlasOptions_RightClickToggle()
    if not atlasTWOptions then
        initializeLocalReferences()
    end

    atlasTWOptions.AtlasRightClick = not atlasTWOptions.AtlasRightClick
    AtlasOptions_Init()
end

function AtlasOptions_AcronymsToggle()
    if not atlasTWOptions then
        initializeLocalReferences()
    end

    atlasTWOptions.AtlasAcronyms = not atlasTWOptions.AtlasAcronyms
    AtlasOptions_Init()
    Atlas_Refresh()
end

function AtlasOptions_ClampedToggle()
    if not atlasTWOptions or not atlasFrame then
        initializeLocalReferences()
    end

    atlasTWOptions.AtlasClamped = not atlasTWOptions.AtlasClamped
    atlasFrame:SetClampedToScreen(atlasTWOptions.AtlasClamped)
    AtlasOptions_Init()
    Atlas_Refresh()
end

-- Инициализация настроек
function AtlasOptions_Init()
    if not atlasTWOptions then
        initializeLocalReferences()
    end
    if not atlasTWOptions then
        DEFAULT_CHAT_FRAME:AddMessage(AtlasTW.Name..": Failed to initialize local references.")
        return
    end
	--Consult the saved variable table to see whether to show the bottom panel
	if AtlasLootCharDB.ShowPanel then
		AtlasLootPanel:Show()
	else
		AtlasLootPanel:Hide()
	end
    -- Установка значений при загрузке
    AtlasOptionsFrameToggleButton:SetChecked(AtlasKTW.AtlasButtonShown)
    AtlasOptionsFrameAutoSelect:SetChecked(AtlasKTW.AtlasAutoSelect)
    AtlasOptionsFrameRightClick:SetChecked(AtlasKTW.AtlasRightClick)
    AtlasOptionsFrameAcronyms:SetChecked(AtlasKTW.AtlasAcronyms)
    AtlasOptionsFrameClamped:SetChecked(AtlasKTW.AtlasClamped)
    AtlasOptionsFrameSliderButtonPos:SetValue(AtlasKTW.AtlasButtonPosition)
    AtlasOptionsFrameSliderButtonRad:SetValue(AtlasKTW.AtlasButtonRadius)
    AtlasOptionsFrameSliderAlpha:SetValue(AtlasKTW.AtlasAlpha)
    AtlasOptionsFrameSliderScale:SetValue(AtlasKTW.AtlasScale)

	-- Quest Options
	KQAutoshowOption:SetChecked(AtlasKTW.QWithAtlas)
	KQLEFTOption:SetChecked(AtlasKTW.QCurrentSide == "Left")
	KQRIGHTOption:SetChecked(AtlasKTW.QCurrentSide ~= "Left")
	KQColourOption:SetChecked(AtlasKTW.QColourCheck)
	KQCheckQuestlogButton:SetChecked(AtlasKTW.QCheckQuestlog)
	KQAutoQueryOption:SetChecked(AtlasKTW.QAutoQuery)
	KQQuerySpamOption:SetChecked(AtlasKTW.QQuerySpam)
	KQCompareTooltipOption:SetChecked(AtlasKTW.QCompareTooltip)

	-- Loot Options
	AtlasLootOptionsFrameSafeLinks:SetChecked(AtlasLootCharDB.SafeLinks)
	AtlasLootOptionsFrameAllLinks:SetChecked(AtlasLootCharDB.AllLinks)
	AtlasLootOptionsFrameDefaultTT:SetChecked(AtlasLootCharDB.DefaultTT)
	AtlasLootOptionsFrameLootlinkTT:SetChecked(AtlasLootCharDB.LootlinkTT)
	AtlasLootOptionsFrameItemSyncTT:SetChecked(AtlasLootCharDB.ItemSyncTT)
	AtlasLootOptionsFrameShowSource:SetChecked(AtlasLootCharDB.ShowSource)
	AtlasLootOptionsFrameEquipCompare:SetChecked(AtlasLootCharDB.EquipCompare)
	AtlasLootOptionsFrameOpaque:SetChecked(AtlasLootCharDB.Opaque)
	AtlasLootOptionsFrameItemID:SetChecked(AtlasLootCharDB.ItemIDs)
	AtlasLootOptionsFrameItemSpam:SetChecked(AtlasLootCharDB.ItemSpam)
    AtlasLootOptionsFrameShowPanel:SetChecked(AtlasLootCharDB.ShowPanel)
end

-- Сброс позиции
function AtlasOptions_ResetPosition()
    if not atlasTWOptions then
        initializeLocalReferences()
    end

    atlasFrame:ClearAllPoints()
    atlasFrame:SetPoint("TOP", 0, -104)

    -- Сброс настроек к значениям по умолчанию
    atlasTWOptions.AtlasButtonPosition = 305
    atlasTWOptions.AtlasButtonRadius = 76
    atlasTWOptions.AtlasAlpha = 1.0
    atlasTWOptions.AtlasScale = 1.0

    AtlasOptions_Init()
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
    if not atlasTWOptions then
        initializeLocalReferences()
    end
    uIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, thisID)
    atlasTWOptions.AtlasSortBy = thisID
    atlasTWOptions.AtlasZone = 1
    atlasTWOptions.AtlasType = 1

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
    if not atlasTWOptions then
        initializeLocalReferences()
    end

    local dropDownCats = AtlasOptionsFrameDropDownCats

    UIDropDownMenu_Initialize(dropDownCats, atlasOptionsFrameDropDownCats_Initialize)
    uIDropDownMenu_SetSelectedID(dropDownCats, atlasTWOptions.AtlasSortBy)
   -- UIDropDownMenu_SetWidth(100, dropDownCats)
end