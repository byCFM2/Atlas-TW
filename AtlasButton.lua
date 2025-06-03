-- Functions the atlas buttons logic

function AtlasButton_OnClick()
	Atlas_Toggle()
end

function AtlasButton_Init()
	if AtlasTWOptions.AtlasButtonShown then
		AtlasButtonFrame:Show()
	else
		AtlasButtonFrame:Hide()
	end
end

function AtlasButton_Toggle()
	if AtlasButtonFrame:IsVisible() then
		AtlasButtonFrame:Hide()
		AtlasTWOptions.AtlasButtonShown = false
	else
		AtlasButtonFrame:Show()
		AtlasTWOptions.AtlasButtonShown = true
	end
	AtlasOptions_Init()
end

function AtlasButton_UpdatePosition()
	AtlasButtonFrame:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (AtlasTWOptions.AtlasButtonRadius * cos(AtlasTWOptions.AtlasButtonPosition)),
		(AtlasTWOptions.AtlasButtonRadius * sin(AtlasTWOptions.AtlasButtonPosition)) - 55
	)
	AtlasOptions_Init()
end

function AtlasButton_BeingDragged()
	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()

	xpos = xmin-xpos/UIParent:GetScale()+70
	ypos = ypos/UIParent:GetScale()-ymin-70

	AtlasButton_SetPosition(math.deg(math.atan2(ypos,xpos)))
end

function AtlasButton_SetPosition(v)
	if v < 0 then
		v = v + 360
	end

	AtlasTWOptions.AtlasButtonPosition = v
	AtlasButton_UpdatePosition()
end

function AtlasButton_OnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT")
	GameTooltip:SetText("Atlas")
	GameTooltipTextLeft1:SetTextColor(1, 1, 1)
	GameTooltip:AddLine(ATLAS_BUTTON_TOOLTIP_HINT)
	GameTooltip:Show()
end