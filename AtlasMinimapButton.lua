-- Functions the atlas buttons logic
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
-- Обработчик клика по кнопке
function AtlasButton_OnClick()
	Atlas_Toggle()
end

-- Инициализация кнопки
function AtlasButton_Init()
	if AtlasTWOptions.AtlasButtonShown then
		AtlasButtonFrame:Show()
	else
		AtlasButtonFrame:Hide()
	end
	AtlasButton_UpdatePosition()
end

-- Переключение видимости кнопки
function AtlasButton_Toggle()
	if AtlasButtonFrame:IsVisible() then
		AtlasButtonFrame:Hide()
		AtlasTWOptions.AtlasButtonShown = false
	else
		AtlasButtonFrame:Show()
		AtlasTWOptions.AtlasButtonShown = true
	end
	AtlasTW.OptionsInit()
end

-- Обновление позиции кнопки
function AtlasButton_UpdatePosition()
	local radius = AtlasTWOptions.AtlasButtonRadius
	local position = AtlasTWOptions.AtlasButtonPosition
	AtlasButtonFrame:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (radius * cos(position)),
		(radius * sin(position)) - 55
	)
	AtlasTW.OptionsInit()
end

-- Обработка перетаскивания кнопки
function AtlasButton_BeingDragged()
	local xpos, ypos = GetCursorPosition()
	local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()
	local scale = UIParent:GetScale()
	xpos = xmin - xpos / scale + 70
	ypos = ypos / scale - ymin - 70
	AtlasButton_SetPosition(math.deg(math.atan2(ypos, xpos)))
end

-- Установка позиции кнопки
function AtlasButton_SetPosition(v)
	if v < 0 then
		v = v + 360
	end
	AtlasTWOptions.AtlasButtonPosition = v
	AtlasButton_UpdatePosition()
end

-- Обработчик наведения мыши
function AtlasButton_OnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT")
	GameTooltip:SetText(AtlasTW.Name)
	GameTooltipTextLeft1:SetTextColor(1, 1, 1)
	GameTooltip:AddLine(L["Left-click to open Atlas-TW.\nMiddle-click for Atlas-TW options.\nRight-click and drag to move this button."])
	GameTooltip:Show()
end