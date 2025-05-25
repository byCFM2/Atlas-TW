--[[
	
	Atlas, a World of Warcraft instance map browser
	Copyright 2005 - 2008 Dan Gilbert
	Email me at loglow@gmail.com
	
	This file is part of Atlas.
	
	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.
	
	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
	
--]]
local _G = getfenv()

function AtlasOptions_Toggle()
	if AtlasOptionsFrame:IsVisible() then
		AtlasOptionsFrame:Hide()
	else
		AtlasOptionsFrame:Show()
	end
end

function AtlasOptions_AutoSelectToggle()
	if AtlasTWOptions.AtlasAutoSelect then
		AtlasTWOptions.AtlasAutoSelect = false
	else
		AtlasTWOptions.AtlasAutoSelect = true
	end
	AtlasOptions_Init()
end

function AtlasOptions_RightClickToggle()
	if AtlasTWOptions.AtlasRightClick then
		AtlasTWOptions.AtlasRightClick = false
	else
		AtlasTWOptions.AtlasRightClick = true
	end
	AtlasOptions_Init()
end

function AtlasOptions_AcronymsToggle()
	if AtlasTWOptions.AtlasAcronyms then
		AtlasTWOptions.AtlasAcronyms = false
	else
		AtlasTWOptions.AtlasAcronyms = true
	end
	AtlasOptions_Init()
	Atlas_Refresh()
end

function AtlasOptions_ClampedToggle()
	if AtlasTWOptions.AtlasClamped then
		AtlasTWOptions.AtlasClamped = false
	else
	AtlasTWOptions.AtlasClamped = true
	end
	AtlasFrame:SetClampedToScreen(AtlasTWOptions.AtlasClamped)
	AtlasOptions_Init()
	Atlas_Refresh()
end

function AtlasOptions_CtrlToggle()
	if AtlasTWOptions.AtlasCtrl then
		AtlasTWOptions.AtlasCtrl = false
	else
		AtlasTWOptions.AtlasCtrl = true
	end
	AtlasOptions_Init()
	Atlas_Refresh()
end

function AtlasOptions_OnLoad()
	UIPanelWindows['AtlasOptionsFrame'] = {area = 'center', pushable = 0}
end

function AtlasOptions_Init()
	AtlasOptionsFrameToggleButton:SetChecked(AtlasTWOptions.AtlasButtonShown)
	AtlasOptionsFrameAutoSelect:SetChecked(AtlasTWOptions.AtlasAutoSelect)
	AtlasOptionsFrameRightClick:SetChecked(AtlasTWOptions.AtlasRightClick)
	AtlasOptionsFrameAcronyms:SetChecked(AtlasTWOptions.AtlasAcronyms)
	AtlasOptionsFrameClamped:SetChecked(AtlasTWOptions.AtlasClamped)
	AtlasOptionsFrameSliderButtonPos:SetValue(AtlasTWOptions.AtlasButtonPosition)
	AtlasOptionsFrameSliderButtonRad:SetValue(AtlasTWOptions.AtlasButtonRadius)
	AtlasOptionsFrameSliderAlpha:SetValue(AtlasTWOptions.AtlasAlpha)
	AtlasOptionsFrameSliderScale:SetValue(AtlasTWOptions.AtlasScale)
end

function AtlasOptions_ResetPosition()
	AtlasFrame:ClearAllPoints()
	AtlasFrame:SetPoint("TOPLEFT", 0, -104)
	AtlasTWOptions.AtlasButtonPosition = 336
	AtlasTWOptions.AtlasButtonRadius = 78
	AtlasTWOptions.AtlasAlpha = 1.0
	AtlasTWOptions.AtlasScale = 1.0
	AtlasOptions_Init()
end

function AtlasOptions_SetupSlider(text, mymin, mymax, step)
	_G[this:GetName().."Text"]:SetText(text.." ("..this:GetValue()..")")
	this:SetMinMaxValues(mymin, mymax)
	_G[this:GetName().."Low"]:SetText(mymin)
	_G[this:GetName().."High"]:SetText(mymax)
	this:SetValueStep(step)
end

local function round(num, idp)
	local mult = 10 ^ (idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function AtlasOptions_UpdateSlider(text)
	_G[this:GetName().."Text"]:SetText(text.." ("..round(this:GetValue(),2)..")")
end


function AtlasOptionsFrameDropDownCats_Initialize()
	
	local i
	for i = 1, getn(Atlas_DropDownLayouts_Order), 1 do
		info = {
			text = Atlas_DropDownLayouts_Order[i],
			func = AtlasOptionsFrameDropDownCats_OnClick
		}
		UIDropDownMenu_AddButton(info)
	end
	
end


function AtlasOptionsFrameDropDownCats_OnShow()
	UIDropDownMenu_Initialize(AtlasOptionsFrameDropDownCats, AtlasOptionsFrameDropDownCats_Initialize)
	UIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, AtlasTWOptions.AtlasSortBy)
	UIDropDownMenu_SetWidth(100, AtlasOptionsFrameDropDownCats)
end


function AtlasOptionsFrameDropDownCats_OnClick()
	local thisID = this:GetID()
	UIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, thisID)
	AtlasTWOptions.AtlasSortBy = thisID
	AtlasTWOptions.AtlasZone = 1
	AtlasTWOptions.AtlasType = 1
	Atlas_PopulateDropdowns()
	Atlas_Refresh()
	AtlasFrameDropDownType_OnShow()
	AtlasFrameDropDown_OnShow()
end