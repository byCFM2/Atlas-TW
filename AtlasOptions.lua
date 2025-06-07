-- Локальные ссылки на глобальные функции для повышения производительности
local _G = getfenv()
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

-- Основные функции переключения опций
function AtlasOptions_Toggle()
    if atlasOptionsFrame:IsVisible() then
        atlasOptionsFrame:Hide()
    else
        atlasOptionsFrame:Show()
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

    -- Установка значений напрямую
    AtlasOptionsFrameToggleButton:SetChecked(atlasTWOptions.AtlasButtonShown)
    AtlasOptionsFrameAutoSelect:SetChecked(atlasTWOptions.AtlasAutoSelect)
    AtlasOptionsFrameRightClick:SetChecked(atlasTWOptions.AtlasRightClick)
    AtlasOptionsFrameAcronyms:SetChecked(atlasTWOptions.AtlasAcronyms)
    AtlasOptionsFrameClamped:SetChecked(atlasTWOptions.AtlasClamped)
    AtlasOptionsFrameSliderButtonPos:SetValue(atlasTWOptions.AtlasButtonPosition)
    AtlasOptionsFrameSliderButtonRad:SetValue(atlasTWOptions.AtlasButtonRadius)
    AtlasOptionsFrameSliderAlpha:SetValue(atlasTWOptions.AtlasAlpha)
    AtlasOptionsFrameSliderScale:SetValue(atlasTWOptions.AtlasScale)
end

-- Сброс позиции
function AtlasOptions_ResetPosition()
    if not atlasTWOptions then
        initializeLocalReferences()
    end

    atlasFrame:ClearAllPoints()
    atlasFrame:SetPoint("TOPLEFT", 0, -104)

    -- Сброс настроек к значениям по умолчанию
    atlasTWOptions.AtlasButtonPosition = 336
    atlasTWOptions.AtlasButtonRadius = 78
    atlasTWOptions.AtlasAlpha = 1.0
    atlasTWOptions.AtlasScale = 1.0

    AtlasOptions_Init()
end

-- Настройка слайдера (улучшенная версия)
function AtlasOptions_SetupSlider(text, mymin, mymax, step)
    local sliderName = this:GetName()
    local textElement = _G[sliderName .. "Text"]
    local lowElement = _G[sliderName .. "Low"]
    local highElement = _G[sliderName .. "High"]

    if textElement then
        textElement:SetText(text .. " (" .. this:GetValue() .. ")")
    end

    this:SetMinMaxValues(mymin, mymax)

    if lowElement then
        lowElement:SetText(mymin)
    end

    if highElement then
        highElement:SetText(mymax)
    end

    this:SetValueStep(step)
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
    UIDropDownMenu_SetWidth(100, dropDownCats)
end