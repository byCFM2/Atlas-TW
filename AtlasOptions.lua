---------------
--- COLOURS ---
---------------
local red = "|cffff0000"
local blue = "|cff0070dd"
-- Локальные ссылки на глобальные функции для повышения производительности
local _G = getfenv()
local AtlasTW = _G.AtlasTW
local L = AtlasTW.Local
local uIDropDownMenu_SetSelectedID = UIDropDownMenu_SetSelectedID

-- Локальные переменные для часто используемых элементов UI
local atlasOptionsFrame, atlasFrame  = AtlasOptionsFrame, AtlasFrame

-- Утилитарная функция для округления
local function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Локальные функции для dropdown меню
local function atlasOptionsFrameDropDownCats_OnClick()
    local thisID = this:GetID()
    uIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, thisID)
    AtlasTWOptions.AtlasSortBy = thisID
    AtlasTWOptions.AtlasZone = 1
    AtlasTWOptions.AtlasType = 1

    -- Обновление интерфейса
    AtlasTW.PopulateDropdowns()
    AtlasTW.Refresh()
    AtlasTW.FrameDropDownTypeOnShow()
    AtlasTW.FrameDropDownOnShow()
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

-- Установка значений по умолчанию
function AtlasTW.OptionDefaultSettings()
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
	AtlasTWCharDB.LastBoss = "AtlasLoot_DungeonsMenu1"
	AtlasTWCharDB.LastBossText = L["Dungeons & Raids"]
	AtlasTWCharDB["QuickLooks"] = {}
	AtlasTWCharDB["WishList"] = {}
	AtlasLoot_RefreshQuickLookButtons()
	AtlasTW.OptionsInit()
	DEFAULT_CHAT_FRAME:AddMessage(blue.."Atlas-TW"..": "..red..L["Default settings applied!"])
end

function AtlasTW.OptionShowPanelOnClick()
    local showPanelStatus = AtlasTWOptions.LootShowPanel
    AtlasTWOptions.LootShowPanel = not showPanelStatus
    if showPanelStatus then
        AtlasLootPanel:Hide()
    else
        AtlasLootPanel:Show()
    end
    AtlasTWOptionShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
	AtlasTW.OptionsInit()
end

-- Основные функции переключения опций
function AtlasTW.OptionsOnClick()
    if atlasOptionsFrame:IsVisible() then
        atlasOptionsFrame:Hide()
    else
        atlasOptionsFrame:Show()
    end
    -- Refresh tooltip settings to ensure they take effect immediately
    if AtlasTWOptions.LootDefaultTT then
        AtlasTW.OptionDefaultTTOnClick()
    elseif AtlasTWOptions.LootlinkTT then
        AtlasTW.OptionLootlinkTTOnClick()
    elseif AtlasTWOptions.LootItemSyncTT then
        AtlasTW.OptionItemSyncTTOnClick()
    end
end

function AtlasTW.OptionsAutoSelectOnClick()
    AtlasTWOptions.AtlasAutoSelect = not AtlasTWOptions.AtlasAutoSelect
    AtlasTW.OptionsInit()
end

function AtlasTW.OptionsWorldMapOnClick()
    AtlasTWOptions.AtlasRightClick = not AtlasTWOptions.AtlasRightClick
    AtlasTW.OptionsInit()
end

function AtlasTW.OptionsAcronymsOnClick()
    AtlasTWOptions.AtlasAcronyms = not AtlasTWOptions.AtlasAcronyms
    AtlasTW.OptionsInit()
    AtlasTW.Refresh()
end

function AtlasTW.OptionsClampedOnClick()
    AtlasTWOptions.AtlasClamped = not AtlasTWOptions.AtlasClamped
    atlasFrame:SetClampedToScreen(AtlasTWOptions.AtlasClamped)
    AtlasTW.OptionsInit()
    AtlasTW.Refresh()
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
    AtlasTWOptionToggleButton:SetChecked(AtlasTWOptions.AtlasButtonShown)
    AtlasTWOptionAutoSelect:SetChecked(AtlasTWOptions.AtlasAutoSelect)
    AtlasTWOptionRightClick:SetChecked(AtlasTWOptions.AtlasRightClick)
    AtlasTWOptionAcronyms:SetChecked(AtlasTWOptions.AtlasAcronyms)
    AtlasTWOptionClamped:SetChecked(AtlasTWOptions.AtlasClamped)
    AtlasTWOptionSliderButtonPos:SetValue(AtlasTWOptions.AtlasButtonPosition)
    AtlasTWOptionSliderButtonRad:SetValue(AtlasTWOptions.AtlasButtonRadius)
    AtlasTWOptionSliderAlpha:SetValue(AtlasTWOptions.AtlasAlpha)
    AtlasTWOptionSliderScale:SetValue(AtlasTWOptions.AtlasScale)

	-- Quest Options
	AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
	AtlasTWOptionLeftSide:SetChecked(AtlasTWOptions.QuestCurrentSide == "Left")
	AtlasTWOptionRightSide:SetChecked(AtlasTWOptions.QuestCurrentSide == "Right")
     if AtlasTWOptionRightSide:GetChecked() then
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", 567, -36)
    else
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", -556, -36)
    end
	AtlasTWOptionColor:SetChecked(AtlasTWOptions.QuestColourCheck)
	AtlasTWOptionQuestlog:SetChecked(AtlasTWOptions.QuestCheckQuestlog)
	AtlasTWOptionAutoQuery:SetChecked(AtlasTWOptions.QuestAutoQuery)
	AtlasTWOptionQuerySpam:SetChecked(AtlasTWOptions.QuestQuerySpam)
	AtlasTWOptionCompareTooltip:SetChecked(AtlasTWOptions.QuestCompareTooltip)

	-- Loot Options
	AtlasTWOptionSafeLinks:SetChecked(AtlasTWOptions.LootSafeLinks)
	AtlasTWOptionAllLinks:SetChecked(AtlasTWOptions.LootAllLinks)
	AtlasTWOptionDefaultTT:SetChecked(AtlasTWOptions.LootDefaultTT)
	AtlasTWOptionLootlinkTT:SetChecked(AtlasTWOptions.LootlinkTT)
	AtlasTWOptionItemSyncTT:SetChecked(AtlasTWOptions.LootItemSyncTT)
	AtlasTWOptionShowSource:SetChecked(AtlasTWOptions.LootShowSource)
	AtlasTWOptionEquipCompare:SetChecked(AtlasTWOptions.LootEquipCompare)
	AtlasTWOptionOpaque:SetChecked(AtlasTWOptions.LootOpaque)
	AtlasTWOptionItemID:SetChecked(AtlasTWOptions.LootItemIDs)
	AtlasTWOptionItemSpam:SetChecked(AtlasTWOptions.LootItemSpam)
    AtlasTWOptionShowPanel:SetChecked(AtlasTWOptions.LootShowPanel)
end

-- Сброс позиции
function AtlasTW.OptionResetPosition()
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

-- Показ dropdown категорий
function AtlasTW.OptionFrameDropDownCatsOnShow()
    local dropDownCats = AtlasOptionsFrameDropDownCats

    UIDropDownMenu_Initialize(dropDownCats, atlasOptionsFrameDropDownCats_Initialize)
    uIDropDownMenu_SetSelectedID(dropDownCats, AtlasTWOptions.AtlasSortBy)
end

-----------------------------------------------------------------------------
-- Option handlers
-----------------------------------------------------------------------------
-- Autoshow
function AtlasTW.OptionAutoshowOnClick()
	AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
	AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTW.OptionsInit()
end

-- Right position
function AtlasTW.OptionRightSideOnClick()
    AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
    AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", 567, -36)
	AtlasTWOptionRightSide:SetChecked(true)
	AtlasTWOptionLeftSide:SetChecked(false)
	AtlasTWOptions.QuestCurrentSide = "Right"
	AtlasTW.OptionsInit()
end

-- Left position
function AtlasTW.OptionLeftSideOnClick()
    if AtlasTWOptions.QuestCurrentSide == "Right" then
        AtlasTW.Quest.UI_Main.Frame:ClearAllPoints()
        AtlasTW.Quest.UI_Main.Frame:SetPoint("TOP", "AtlasFrame", -556, -36)
    end
	AtlasTWOptionRightSide:SetChecked(false)
	AtlasTWOptionLeftSide:SetChecked(true)
	AtlasTWOptions.QuestCurrentSide = "Left"
	AtlasTW.OptionsInit()
end

-- Color check
function AtlasTW.OptionColorOnClick()
	AtlasTWOptions.QuestColourCheck = not AtlasTWOptions.QuestColourCheck
	AtlasTWOptionColor:SetChecked(AtlasTWOptions.QuestColourCheck)
	AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

-- Questlog check
function AtlasTW.OptionQuestlogOnClick()
	AtlasTWOptions.QuestCheckQuestlog = not AtlasTWOptions.QuestCheckQuestlog
	AtlasTWOptionQuestlog:SetChecked(AtlasTWOptions.QuestCheckQuestlog)
	AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

-- Auto query
function AtlasTW.OptionAutoQueryOnClick()
	AtlasTWOptions.QuestAutoQuery = not AtlasTWOptions.QuestAutoQuery
	AtlasTWOptionAutoQuery:SetChecked(AtlasTWOptions.QuestAutoQuery)
	AtlasTW.OptionsInit()
end

-- Query spam suppression
function AtlasTW.OptionQuerySpamOnClick()
	AtlasTWOptions.QuestQuerySpam = not AtlasTWOptions.QuestQuerySpam
	AtlasTWOptionQuerySpam:SetChecked(AtlasTWOptions.QuestQuerySpam)
	AtlasTW.OptionsInit()
end

-- Tooltip comparison
function AtlasTW.OptionCompareTooltipOnClick()
	AtlasTWOptions.QuestCompareTooltip = not AtlasTWOptions.QuestCompareTooltip
	AtlasTWOptionCompareTooltip:SetChecked(AtlasTWOptions.QuestCompareTooltip)
	if AtlasTWOptions.QuestCompareTooltip then
		AtlasTW.Quest.Tooltip:Register()
	else
		AtlasTW.Quest.Tooltip:Unregister()
	end
	AtlasTW.OptionsInit()
end
function AtlasTW.OptionSafeLinksOnClick()
	AtlasTWOptions.LootSafeLinks = not AtlasTWOptions.LootSafeLinks
	if AtlasTWOptions.LootSafeLinks then
		AtlasTWOptions.LootAllLinks = false
    else
		AtlasTWOptions.LootAllLinks = true
	end
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionAllLinksOnClick()
	AtlasTWOptions.LootAllLinks = not AtlasTWOptions.LootAllLinks
	if AtlasTWOptions.LootAllLinks then
		AtlasTWOptions.LootSafeLinks = false
    else
		AtlasTWOptions.LootSafeLinks = true
	end
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionDefaultTTOnClick()
	AtlasTWOptions.LootDefaultTT = true
	AtlasTWOptions.LootlinkTT = false
	AtlasTWOptions.LootItemSyncTT = false
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionLootlinkTTOnClick()
	AtlasTWOptions.LootDefaultTT = false
	AtlasTWOptions.LootlinkTT = true
	AtlasTWOptions.LootItemSyncTT = false
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionItemSyncTTOnClick()
	AtlasTWOptions.LootDefaultTT = false
	AtlasTWOptions.LootlinkTT = false
	AtlasTWOptions.LootItemSyncTT = true
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionShowSourceOnClick()
	AtlasTWOptions.LootShowSource = not AtlasTWOptions.LootShowSource
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionEquipCompareOnClick()
	AtlasTWOptions.LootEquipCompare = not AtlasTWOptions.LootEquipCompare
	if AtlasTWOptions.LootEquipCompare then
		-- Register tooltips if EquipCompare is enabled
		if IsAddOnLoaded("EquipCompare") then
			EquipCompare_RegisterTooltip(AtlasLootTooltip)
			EquipCompare_RegisterTooltip(AtlasLootTooltip2)
		end
		if IsAddOnLoaded("EQCompare") then
			EQCompare:RegisterTooltip(AtlasLootTooltip)
			EQCompare:RegisterTooltip(AtlasLootTooltip2)
		end
	else
		-- Unregister tooltips if EquipCompare is disabled
		if IsAddOnLoaded("EquipCompare") then
			EquipCompare_UnregisterTooltip(AtlasLootTooltip)
			EquipCompare_UnregisterTooltip(AtlasLootTooltip2)
		end
		if IsAddOnLoaded("EQCompare") then
			EQCompare:UnRegisterTooltip(AtlasLootTooltip)
			EQCompare:UnRegisterTooltip(AtlasLootTooltip2)
		end
	end
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionOpaqueOnClick()
	AtlasTWOptions.LootOpaque=AtlasTWOptionOpaque:GetChecked()
	if AtlasTWOptions.LootOpaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionItemIDOnClick()
	AtlasTWOptions.LootItemIDs = not AtlasTWOptions.LootItemIDs
	AtlasTW.OptionsInit()
end

function AtlasTW.OptionItemSpamOnClick()
	AtlasTWOptions.LootItemSpam = not AtlasTWOptions.LootItemSpam
	AtlasTW.OptionsInit()
end