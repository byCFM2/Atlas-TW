-----------------------------------------------------------------------------
-- Button handlers
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Automatically show Horde or Alliance quests 
-- based on player's faction when AtlasQuest is opened.
-----------------------------------------------------------------------------
function KQ_OnShow()
	if UnitFactionGroup("player") == "Horde" then
		AtlasKTW.isHorde = true
		KQuestHordeCheckBox:SetChecked(AtlasKTW.isHorde)
		KQuestAllianceCheckBox:SetChecked(not AtlasKTW.isHorde)
	else
		AtlasKTW.isHorde = false
		KQuestHordeCheckBox:SetChecked(AtlasKTW.isHorde)
		KQuestAllianceCheckBox:SetChecked(not AtlasKTW.isHorde)
	end
	KQuestSetTextandButtons()
end
-- Close button
function KQCLOSE1_OnClick()
    HideUIPanel(KQuestFrame)
end
-- Options button
function KQOPTION1_OnClick()
    if KQuestOptionFrame:IsVisible() then
        HideUIPanel(KQuestOptionFrame)
    else
        KQuestOptionFrame:Show()
    end
end
-- Story button
function KQSTORY1_OnClick()
	KQuestHideAL()
	if KQuestInsideFrame:IsVisible() == nil then
		ShowUIPanel(KQuestInsideFrame)
		KQuestWhichButton = STORY
		KQuestButtonStory_SetText()
	elseif KQuestWhichButton == STORY then
		HideUIPanel(KQuestInsideFrame)
	else
		KQuestWhichButton = STORY
		KQuestButtonStory_SetText()
	end
end
-- Alliance handler
function Alliance_OnClick()
	AtlasKTW.isHorde = false
    KQuestAllianceCheckBox:SetChecked(not AtlasKTW.isHorde)
    KQuestHordeCheckBox:SetChecked(AtlasKTW.isHorde)
    KQuest_SaveData()
    AtlasKTW.QUpdateNOW = true
end
-- Horde handler
function Horde_OnClick()
	AtlasKTW.isHorde = true
    KQuestAllianceCheckBox:SetChecked(not AtlasKTW.isHorde)
    KQuestHordeCheckBox:SetChecked(AtlasKTW.isHorde)
    KQuest_SaveData()
    AtlasKTW.QUpdateNOW = true
end
-- General button handler
function AQGeneral_OnClick(button)
	-- first clear display
	KQClearALL()
	KQuestHideAL()
	if KQuestInsideFrame:IsVisible() then
		HideUIPanel(KQuestInsideFrame)
	else
		ShowUIPanel(KQuestInsideFrame)
	end
    local instGeneral = _G["Inst"..AtlasKTW.Instances.."General"]
    if instGeneral ~= nil then
        KQuestName:SetText(BLUE..instGeneral[1][1])
        KQuestStory:SetText(WHITE..instGeneral[1][2].."\n \n"..instGeneral[1][3])
        -- Show Next side button if next site is avaiable
        AQ_NextPageCount = "Boss"
        if instGeneral[2] ~= nil then
            ShowUIPanel(KQNextPageButton_Right)
            AtlasKTW.Q.CurrentPage = 1
            -- shows total amount of pages
            KQuestPageCount:SetText(AtlasKTW.Q.CurrentPage.."/"..getn(instGeneral))
        end
    end
end

-----------------------------------------------------------------------------
-- Insert Quest Information into the chat box
-----------------------------------------------------------------------------
local function kQInsertQuestInformation()
	-- Get current quest ID from global variable
	local questID = AtlasKTW.Q.ShownQuest
	local faction = AtlasKTW.isHorde and "Horde" or "Alliance"
	local questName = nil
	if KQuestInstanceData and 
	   KQuestInstanceData[AtlasKTW.Instances] and 
	   KQuestInstanceData[AtlasKTW.Instances].Quests and
	   KQuestInstanceData[AtlasKTW.Instances].Quests[faction] and
	   KQuestInstanceData[AtlasKTW.Instances].Quests[faction][questID] then
		questName = KQuestInstanceData[AtlasKTW.Instances].Quests[faction][questID].Title
	end
	-- Insert formatted quest name into chat box if found
	if questName then
		-- Remove level prefix if present (pattern like "60. " at the beginning)
		local levelPattern = "^%d+%. "
		questName = string.gsub(questName, levelPattern, "")
		ChatFrameEditBox:Insert("["..questName.."]")
	end
end

-- Quest buttons handler
-- Handles click events on quest buttons in the Atlas interface
function Quest_OnClick(button)
	-- Check if shift-click while chat edit box is open (for quest linking)
	if ChatFrameEditBox:IsVisible() and IsShiftKeyDown() then
		kQInsertQuestInformation()
	else
		-- Hide the AtlasLoot frame if it's visible
		KQuestHideAL()
		-- Clear the story text
		KQuestStory:SetText("")
		-- Toggle quest details frame visibility
		if not KQuestInsideFrame:IsVisible() then
			-- Show quest frame if not visible
			ShowUIPanel(KQuestInsideFrame)
			KQuestWhichButton = AtlasKTW.Q.ShownQuest
			KQButton_SetText()
		elseif KQuestWhichButton == AtlasKTW.Q.ShownQuest then
			-- Hide quest frame if showing the same quest
			HideUIPanel(KQuestInsideFrame)
			KQuestWhichButton = 0
		else
			-- Update quest frame to show different quest
			KQuestWhichButton = AtlasKTW.Q.ShownQuest
			KQButton_SetText()
		end
	end
end
-----------------------------------------------------------------------------
-- Quest Frame creation
-----------------------------------------------------------------------------
function CreateKQuestFrame()
    local frame = CreateFrame("Frame", "KQuestFrame", AtlasFrame)
    frame:EnableMouse(true)
    frame:SetMovable(false)
    frame:Hide()
    frame:SetWidth(220)
    frame:SetHeight(570)
    frame:SetPoint("TOP", "AtlasFrame", -556, -30)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    -- Register events
    frame:RegisterEvent("VARIABLES_LOADED")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    -- Set event handler
    frame:SetScript("OnEvent", KQuest_OnEvent)
    frame:SetScript("OnShow", KQ_OnShow)
    frame:SetScript("OnUpdate", KQ_OnUpdate)
    -- Create close button
    local closeButton = CreateFrame("Button", "CLOSEbutton", frame, "UIPanelCloseButton")
    closeButton:SetWidth(27)
    closeButton:SetHeight(27)
    closeButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
    closeButton:SetText("X")
    closeButton:SetScript("OnClick", KQCLOSE1_OnClick)
    closeButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)
    -- Function to create a button
    local function CreateButton(name, width, height, point, relativePoint, relativeTo, xOffset, yOffset, text, onClick)
        local button = CreateFrame("Button", name, frame, "OptionsButtonTemplate")
        button:SetWidth(width)
        button:SetHeight(height)
        button:SetPoint(point, relativeTo or frame, relativePoint or point, xOffset, yOffset)
        button:SetText(text)
        button:SetScript("OnClick", onClick)
        button:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)
        return button
    end
    -- Create options button
    CreateButton("OPTIONbutton", 80, 20, "BOTTOMRIGHT", nil, nil, -20, 15, AQOptionB, KQOPTION1_OnClick)
    -- Create story button
    CreateButton("STORYbutton", 70, 20, "TOP", nil, nil, 0, -13, AQStoryB, KQSTORY1_OnClick)
    -- Function to create a checkbox
    local function CreateCheckbox(name, point, relativePoint, relativeTo, xOffset, yOffset, onClick)
        local checkbox = CreateFrame("CheckButton", name, frame, "OptionsCheckButtonTemplate")
        checkbox:SetWidth(30)
        checkbox:SetHeight(30)
        checkbox:SetPoint(point, relativeTo or frame, relativePoint or point, xOffset, yOffset)
        checkbox:SetChecked(false)
        checkbox:SetHitRectInsets(0, 0, 0, 0)
        checkbox:SetScript("OnClick", onClick)
        checkbox:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)
        return checkbox
    end
    -- Function to create an fraction texture
    local function CreateFactionTexture(faction)
        local texture = frame:CreateTexture("AQ_"..faction.."Texture", "OVERLAY")
        texture:SetWidth(50)
        texture:SetHeight(50)
        if faction == "Alliance" then
            texture:SetPoint("TOPLEFT", frame, "TOPLEFT", 38, -30)
        else
            texture:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -26, -30)
        end
        texture:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..faction)
        return texture
    end
    -- Function to create a quest button
    local function CreateQuestButton(index, relativeTo, yOffset)
        local button = CreateFrame("Button", "AQQuestbutton"..index, frame)
        button:SetWidth(165)
        button:SetHeight(20)
        if index ~= 1 then
            button:SetPoint("TOPLEFT", relativeTo, "TOPLEFT", 0, yOffset)
        else
            button:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -60)
        end
        button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
        button:SetText(index)
        button:SetScript("OnClick", function()
            AtlasKTW.Q.ShownQuest = index
            Quest_OnClick(arg1)
        end)
        button:SetScript("OnShow", function()
            this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
        end)
        return button
    end
    -- Function to create an arrow
    local function CreateArrow(index, relativeTo, yOffset)
        local arrow = frame:CreateTexture("KQuestlineArrow_"..index, "OVERLAY")
        arrow:SetWidth(13)
        arrow:SetHeight(15)
        if index ~= 1 then
            arrow:SetPoint("TOPLEFT", relativeTo, "TOPLEFT", 0, yOffset)
        else
            arrow:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -65)
        end
        arrow:SetTexture("Interface\\Glues\\Login\\UI-BackArrow")
        return arrow
    end
    -- Function to create button text
    local function CreateButtonText(index, relativeTo, yOffset)
        local text = frame:CreateFontString("AQBUTTONTEXT"..index, "OVERLAY", "GameFontNormalSmall")
        text:SetWidth(165)
        text:SetHeight(20)
        text:SetJustifyH("LEFT")
        if index ~= 1 then
            text:SetPoint("TOPLEFT", relativeTo, "TOPLEFT", 0, yOffset)
        else
            text:SetPoint("TOPLEFT", frame, "TOPLEFT", 30, -60)
        end
        text:SetText(index)
        return text
    end

    -- Create Alliance and Horde checkboxes
    local allianceCheckbox = CreateCheckbox("KQuestAllianceCheckBox", "TOPLEFT", nil, nil, 12, -30, Alliance_OnClick)
    allianceCheckbox:SetChecked(true)
    CreateCheckbox("KQuestHordeCheckBox", "TOPRIGHT", nil, nil, -12, -30, Horde_OnClick)

    -- Create Alliance and Horde textures
    CreateFactionTexture("Alliance")
    CreateFactionTexture("Horde")

    -- Create general button
    local generalButton = CreateFrame("Button", "AQGeneralButton", frame)
    generalButton:SetWidth(165)
    generalButton:SetHeight(20)
    generalButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -30)
    generalButton:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    generalButton:SetText("G")
    generalButton:SetScript("OnClick", function()
        AQGeneral_OnClick(arg1)
    end)
    generalButton:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    -- Create quest count text field
    local anzahl = frame:CreateFontString("AtlasQuestAnzahl", "ARTWORK", "GameFontNormal")
    anzahl:SetWidth(60)
    anzahl:SetHeight(40)
    anzahl:SetPoint("TOP", frame, "TOP", 0, -25)
    -- Create quest buttons, arrows and texts
    local prevButton = nil
    local prevArrow = nil
    local prevText = nil
    for i = 1, 23 do
        if i ~=1 then
            prevButton = CreateQuestButton(i, prevButton, -20)
            prevArrow = CreateArrow(i, prevArrow, -20)
            prevText = CreateButtonText(i, prevText, -20)
        else
            prevButton = CreateQuestButton(i, nil, 0)
            prevArrow = CreateArrow(i, nil, 0)
            prevText = CreateButtonText(i, nil, 0)
        end
    end

    return frame
end