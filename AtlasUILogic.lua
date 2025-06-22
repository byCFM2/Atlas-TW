-- Functions the atlas UI logic
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

-- Minimap button logic
-- Установка позиции кнопки
local function atlasTWButtonSetPosition(v)
	if v < 0 then
		v = v + 360
	end
	AtlasTWOptions.AtlasButtonPosition = v
	AtlasTW.MinimapButtonUpdatePosition()
end

-- Инициализация кнопки
function AtlasTW.MinimapButtonInit()
	if AtlasTWOptions.AtlasButtonShown then
		AtlasButtonFrame:Show()
	else
		AtlasButtonFrame:Hide()
	end
	AtlasTW.MinimapButtonUpdatePosition()
end

-- Переключение видимости кнопки
function AtlasTW.MinimapButtonOnClick()
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
function AtlasTW.MinimapButtonUpdatePosition()
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
function AtlasTW.MinimapButtonBeingDragged()
	local xpos, ypos = GetCursorPosition()
	local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()
	local scale = UIParent:GetScale()
	xpos = xmin - xpos / scale + 70
	ypos = ypos / scale - ymin - 70
	atlasTWButtonSetPosition(math.deg(math.atan2(ypos, xpos)))
end

-- Обработчик наведения мыши
function AtlasTW.MinimapButtonOnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT")
	GameTooltip:SetText(AtlasTW.Name)
	GameTooltipTextLeft1:SetTextColor(1, 1, 1)
	GameTooltip:AddLine(L["Left-click to open Atlas-TW.\nMiddle-click for Atlas-TW options.\nRight-click and drag to move this button."])
	GameTooltip:Show()
end

-- AtlasTW logic
--Sets the transparency of the Atlas frame based on AtlasAlpha
function AtlasTW.OptionsUpdateAlpha()
	AtlasFrame:SetAlpha(AtlasTWOptions.AtlasAlpha)
end

--Sets the scale of the Atlas frame based on AtlasScale
function AtlasTW.OptionsUpdateScale()
	AtlasFrame:SetScale(AtlasTWOptions.AtlasScale)
end

--Simple function to toggle the visibility of the Atlas frame
function AtlasTW.ToggleAtlas()
	if AtlasFrame:IsVisible() then
		AtlasFrame:Hide()
	else
		AtlasFrame:Show()
	end
end

--Parses slash commands
--If an unrecognized command is given, toggle Atlas
function AtlasTW.SlashCommand(msg)
	if msg == "options" or msg == "opt" then
		AtlasTW.OptionsOnClick()
	else
		AtlasTW.ToggleAtlas()
	end
end

--Begin moving the Atlas frame if it's unlocked
function AtlasTW.StartMoving()
	if not AtlasTWOptions.AtlasLocked then
		AtlasFrame:StartMoving()
		AtlasFrame.isMoving = true
	end
end

--RightButton closes Atlas and open the World Map if the RightClick option is turned on
function AtlasTW.OnClick()
	if arg1 == "RightButton" then
		if AtlasTWOptions.AtlasRightClick then
			AtlasTW.ToggleAtlas()
			ToggleWorldMap()
		end
	end
end