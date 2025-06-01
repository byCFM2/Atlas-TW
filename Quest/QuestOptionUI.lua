-----------------------------------------------------------------------------
-- Option handlers
-----------------------------------------------------------------------------

-- Autoshow
function KQAutoshowOption_OnClick()
	AtlasKTW.Q.WithAtlas = not AtlasKTW.Q.WithAtlas
	KQAutoshowOption:SetChecked(AtlasKTW.Q.WithAtlas)
	ChatFrame1:AddMessage(AtlasKTW.Q.WithAtlas and AQAtlasAutoON or AQAtlasAutoOFF)
	KQuest_SaveData()
end

-- Right position
function KQRIGHTOption_OnClick()
	KQuestFrame:ClearAllPoints()
	KQuestFrame:SetPoint("TOP", "AtlasFrame", 567, -36)
	KQRIGHTOption:SetChecked(true)
	KQLEFTOption:SetChecked(false)
	AtlasKTW.Q.ShownSide = "Right"
	KQuest_SaveData()
end

-- Left position
function KQLEFTOption_OnClick()
	if AtlasKTW.Q.ShownSide == "Right" then
		KQuestFrame:ClearAllPoints()
		KQuestFrame:SetPoint("TOP", "AtlasFrame", -556, -36)
	end
	KQRIGHTOption:SetChecked(false)
	KQLEFTOption:SetChecked(true)
	if AtlasKTW.Q.ShownSide ~= "Left" then
		ChatFrame1:AddMessage(AQShowLeft)
	end
	AtlasKTW.Q.ShownSide = "Left"
	KQuest_SaveData()
end

-- Color check
function KQColourOption_OnClick()
	AtlasKTW.Q.ColourCheck = not AtlasKTW.Q.ColourCheck
	KQColourOption:SetChecked(AtlasKTW.Q.ColourCheck)
	ChatFrame1:AddMessage(AtlasKTW.Q.ColourCheck and AQCCON or AQCCOFF)
	KQuest_SaveData()
	AtlasKTW.QUpdateNOW = true
end

-- Questlog check
function KQCheckQuestlogButton_OnClick()
	AtlasKTW.Q.CheckQuestlog = not AtlasKTW.Q.CheckQuestlog
	KQCheckQuestlogButton:SetChecked(AtlasKTW.Q.CheckQuestlog)
	KQuest_SaveData()
	AtlasKTW.QUpdateNOW = true
end

-- Auto query
function KQAutoQueryOption_OnClick()
	AtlasKTW.Q.AutoQuery = not AtlasKTW.Q.AutoQuery
	KQAutoQueryOption:SetChecked(AtlasKTW.Q.AutoQuery)
	KQuest_SaveData()
end

-- Query spam suppression
function KQQuerySpamOption_OnClick()
	AtlasKTW.Q.QuerySpam = not AtlasKTW.Q.QuerySpam
	KQQuerySpamOption:SetChecked(AtlasKTW.Q.QuerySpam)
	KQuest_SaveData()
end

-- Tooltip comparison
function KQCompareTooltipOption_OnClick()
	AtlasKTW.Q.CompareTooltip = not AtlasKTW.Q.CompareTooltip
	KQCompareTooltipOption:SetChecked(AtlasKTW.Q.CompareTooltip)
	if AtlasKTW.Q.CompareTooltip then
		if KQuestRegisterTooltip then
			KQuestRegisterTooltip()
		end
	else
		if KQuestUnRegisterTooltip then
			KQuestUnRegisterTooltip()
		end
	end
	KQuest_SaveData()
end

-- Options panel initialization
function KQuestOptionFrame_OnShow()
	-- Autoshow
	KQAutoshowOption:SetChecked(AtlasKTW.Q.WithAtlas)

	-- Position (left/right)
	local isLeft = AtlasKTW.Q.ShownSide == "Left"
	KQLEFTOption:SetChecked(isLeft)
	KQRIGHTOption:SetChecked(not isLeft)

	-- Color check
	KQColourOption:SetChecked(AtlasKTW.Q.ColourCheck)
	-- Questlog check
	KQCheckQuestlogButton:SetChecked(AtlasKTW.Q.CheckQuestlog)

	-- Auto query
	KQAutoQueryOption:SetChecked(AtlasKTW.Q.AutoQuery)

	-- Query spam suppression
	KQQuerySpamOption:SetChecked(AtlasKTW.Q.QuerySpam)

	-- Tooltip comparison
	KQCompareTooltipOption:SetChecked(AtlasKTW.Q.CompareTooltip)
end

-----------------------------------------------------------------------------
-- Options frame creation
-----------------------------------------------------------------------------
function CreateKQuestOptionFrame()
	local frame = CreateFrame("Frame", "KQuestOptionFrame", UIParent)
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:Hide()
	frame:SetFrameStrata("DIALOG")
	frame:EnableKeyboard(true)
	frame:SetToplevel(true)
	frame:SetWidth(300)
	frame:SetHeight(350)
	frame:SetPoint("CENTER", 0, -240)
	frame:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "",
		tile = false
	})
	-- Registration of events and handlers
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnShow", KQuestOptionFrame_OnShow)
	frame:SetScript("OnKeyDown", function()
		if arg1 == "ESCAPE" then
			HideUIPanel(this)
		end
	end)
	frame:SetScript("OnHide", function()
		KQuestOptionFrame:StopMovingOrSizing()
	end)
	frame:SetScript("OnDragStart", function()
		this:StartMoving()
		this.isMoving = true
	end)
	frame:SetScript("OnDragStop", function()
		this:StopMovingOrSizing()
		this.isMoving = false
	end)
	-- Title
	local title = frame:CreateFontString("$parent_Title", "ARTWORK", "GameFontNormal")
	title:SetPoint("TOP", 0, -15)
	title:SetText(AQOptionsCaptionTEXT)
	title:SetJustifyH("CENTER")
	-- Close button
	local closeButton = CreateFrame("Button", "", frame, "OptionsButtonTemplate")
	closeButton:SetWidth(80)
	closeButton:SetHeight(20)
	closeButton:SetPoint("BOTTOM", 0, 15)
	closeButton:SetText(AQ_OK)
	closeButton:SetScript("OnClick", function()
		HideUIPanel(KQuestOptionFrame)
	end)
	closeButton:SetScript("OnShow", function()
		this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
	end)
	-- Function to create option text
	local function CreateOptionText(name, yOffset, height)
		local text = frame:CreateFontString(name, "ARTWORK", "GameFontNormalSmall")
		text:SetWidth(240)
		text:SetHeight(height or 25)
		text:SetPoint("TOPLEFT", 45, yOffset)
		text:SetJustifyH("LEFT")
		text:SetText(getglobal(string.gsub(name, "TEXT", "Local")))
		return text
	end
	-- Function to create checkbox
	local function CreateCheckbox(name, yOffset, onClick)
		local checkbox = CreateFrame("CheckButton", name, frame, "OptionsCheckButtonTemplate")
		checkbox:SetWidth(30)
		checkbox:SetHeight(30)
		checkbox:SetPoint("TOPLEFT", 10, yOffset)
		checkbox:SetChecked(true)
		checkbox:SetHitRectInsets(0, 0, 0, 0)
		checkbox:SetScript("OnClick", onClick)
		checkbox:SetScript("OnShow", function()
			this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
		end)
		return checkbox
	end

	-- Create option texts
	CreateOptionText("KQAutoshowOptionTEXT", -50)
	CreateOptionText("KQLEFTOptionTEXT", -80)
	CreateOptionText("KQRIGHTOptionTEXT", -110)
	CreateOptionText("KQColourOptionTEXT", -140)
	CreateOptionText("KQCheckQuestlogTEXT", -170)
	CreateOptionText("KQAutoQueryTEXT", -200, 35)
	CreateOptionText("KQQuerySpamTEXT", -230, 35)
	CreateOptionText("KQCompareTooltipTEXT", -260, 35)

	-- Create checkboxes
	CreateCheckbox("KQAutoshowOption", -50, KQAutoshowOption_OnClick)
	CreateCheckbox("KQLEFTOption", -80, KQLEFTOption_OnClick)
	CreateCheckbox("KQRIGHTOption", -110, KQRIGHTOption_OnClick)
	CreateCheckbox("KQColourOption", -140, KQColourOption_OnClick)
	CreateCheckbox("KQCheckQuestlogButton", -170, KQCheckQuestlogButton_OnClick)
	CreateCheckbox("KQAutoQueryOption", -200, KQAutoQueryOption_OnClick)
	CreateCheckbox("KQQuerySpamOption", -230, KQQuerySpamOption_OnClick)
	CreateCheckbox("KQCompareTooltipOption", -260, KQCompareTooltipOption_OnClick)

	return frame
end