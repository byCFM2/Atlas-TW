local variables = AtlasKTW
-----------------------------------------------------------------------------
-- Button handlers
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Automatically show Horde or Alliance quests 
-- based on player's faction when AtlasQuest is opened.
-----------------------------------------------------------------------------
local function kQuest_OnShow()
    local isHorde = UnitFactionGroup("player") == "Horde"
    variables.isHorde = isHorde
    KQuestHordeCheckBox:SetChecked(isHorde)
    KQuestAllianceCheckBox:SetChecked(not isHorde)
    KQuestSetTextandButtons()
end

-- Options button
local function kQuestOption1_OnClick()
    if KQuestOptionFrame:IsVisible() then
        HideUIPanel(KQuestOptionFrame)
    else
        KQuestOptionFrame:Show()
    end
end

-- Story button
local function kQuestStory1_OnClick()
	KQuestHideAL()
	if KQuestInsideFrame:IsVisible() == nil then
		ShowUIPanel(KQuestInsideFrame)
		variables.QCurrentButton = -1
		KQuestButtonStory_SetText()
	elseif variables.QCurrentButton == -1 then
		HideUIPanel(KQuestInsideFrame)
	else
		variables.QCurrentButton = -1
		KQuestButtonStory_SetText()
	end
end

-- Alliance handler
local function kQuestAlliance_OnClick()
	variables.isHorde = false
    KQuestAllianceCheckBox:SetChecked(true)
    KQuestHordeCheckBox:SetChecked(false)
    KQuest_SaveData()
    variables.QUpdateNow = true  --TODO run update instantly from functions and purge function OnUpdate, without use global var

end

-- Horde handler
local function kQuestHorde_OnClick()
	variables.isHorde = true
    KQuestAllianceCheckBox:SetChecked(false)
    KQuestHordeCheckBox:SetChecked(true)
    KQuest_SaveData()
    variables.QUpdateNow = true
end

-----------------------------------------------------------------------------
-- Insert Quest Information into the chat box
-----------------------------------------------------------------------------
local function kQInsertQuestInformation()
    local questID = variables.QCurrentQuest
    local instanceID = variables.QCurrentInstance
    local faction = variables.isHorde and "Horde" or "Alliance"

    local questData = KQuestInstanceData and
                      KQuestInstanceData[instanceID] and
                      KQuestInstanceData[instanceID].Quests and
                      KQuestInstanceData[instanceID].Quests[faction] and
                      KQuestInstanceData[instanceID].Quests[faction][questID]

    if questData and questData.Title then
        local questName = questData.Title
        -- Remove level prefix if present (pattern like "60. " at the beginning)
        local levelPattern = "^%d+%. "
        questName = string.gsub(questName, levelPattern, "")
        -- pfQuest quest link
        if pfQuestCompat then
            pfQuestCompat.InsertQuestLink(0,questName)
        else
            ChatFrameEditBox:Insert("["..questName.."]")
        end
    end
end

-- Quest buttons handler
-- Handles click events on quest buttons in the Atlas interface
local function kQuest_OnClick()
    -- Check if shift-click while chat edit box is open (for quest linking)
    if ChatFrameEditBox:IsVisible() and IsShiftKeyDown() then
        kQInsertQuestInformation()
    else
        -- Hide the AtlasLoot frame if it's visible
        KQuestHideAL()
        -- Clear the story text
        KQuestStory:SetText("")

        -- Toggle quest details frame visibility
        if KQuestInsideFrame:IsVisible() and variables.QCurrentButton == variables.QCurrentQuest then
            -- Hide quest frame if showing the same quest
            HideUIPanel(KQuestInsideFrame)
            variables.QCurrentButton = nil
        else
            -- Show quest frame if not visible, or update to show different quest
            ShowUIPanel(KQuestInsideFrame)
            variables.QCurrentButton = variables.QCurrentQuest
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
    frame:SetScript("OnShow", kQuest_OnShow)
    frame:SetScript("OnUpdate", KQuest_OnUpdate)

    -- Helper function to set frame level on show
    local function setFrameLevelOnShow()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end

    -- Create close button
    local closeButton = CreateFrame("Button", "", frame, "UIPanelCloseButton")
    closeButton:SetWidth(27)
    closeButton:SetHeight(27)
    closeButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
    closeButton:SetText("X")
    closeButton:SetScript("OnClick", KQuestClose1_OnClick)
    closeButton:SetScript("OnShow", setFrameLevelOnShow)

    -- Function to create a button
    local function CreateButton(name, width, height, point, relativePoint, relativeTo, xOffset, yOffset, text, onClick)
        local button = CreateFrame("Button", name, frame, "OptionsButtonTemplate")
        button:SetWidth(width)
        button:SetHeight(height)
        button:SetPoint(point, relativeTo or frame, relativePoint or point, xOffset, yOffset)
        button:SetText(text)
        button:SetScript("OnClick", onClick)
        button:SetScript("OnShow", setFrameLevelOnShow)
        return button
    end

    -- Create options button
    CreateButton("OPTIONbutton", 80, 20, "BOTTOMRIGHT", nil, nil, -20, 15, AQOptionB, kQuestOption1_OnClick)
    -- Create story button
    CreateButton("STORYbutton", 70, 20, "TOP", nil, nil, 0, -13, AQStoryB, kQuestStory1_OnClick)

    -- Function to create a checkbox
    local function CreateCheckbox(name, point, relativePoint, relativeTo, xOffset, yOffset, onClick)
        local checkbox = CreateFrame("CheckButton", name, frame, "OptionsCheckButtonTemplate")
        checkbox:SetWidth(30)
        checkbox:SetHeight(30)
        checkbox:SetPoint(point, relativeTo or frame, relativePoint or point, xOffset, yOffset)
        checkbox:SetChecked(false)
        checkbox:SetHitRectInsets(0, 0, 0, 0)
        checkbox:SetScript("OnClick", onClick)
        checkbox:SetScript("OnShow", setFrameLevelOnShow)
        return checkbox
    end

    -- Function to create a faction texture
    local function CreateFactionTexture(faction)
        local texture = frame:CreateTexture("KQuest"..faction.."Texture", "OVERLAY")
        texture:SetWidth(50)
        texture:SetHeight(50)
        texture:SetPoint(
            faction == "Alliance" and "TOPLEFT" or "TOPRIGHT",
            frame, faction == "Alliance" and "TOPLEFT" or "TOPRIGHT",
            faction == "Alliance" and 38 or -26, -30
        )
        texture:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..faction)
        return texture
    end

    -- Function to create a quest button
    local function CreateQuestButton(index, relativeTo, yOffset)
        local button = CreateFrame("Button", "KQuestButton"..index, frame)
        local isNotFirst = index ~= 1
        button:SetWidth(165)
        button:SetHeight(20)
        button:SetPoint("TOPLEFT", isNotFirst and relativeTo or frame, "TOPLEFT", isNotFirst and 0 or 15, isNotFirst and yOffset or -60)
        button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
        button:SetText(index)
        button:SetScript("OnClick", function()
            variables.QCurrentQuest = index
            kQuest_OnClick()
        end)
        button:SetScript("OnShow", setFrameLevelOnShow)
        return button
    end

    -- Function to create an arrow
    local function CreateArrow(index, relativeTo, yOffset)
        local arrow = frame:CreateTexture("KQuestlineArrow_"..index, "OVERLAY")
        local isNotFirst = index ~= 1
        arrow:SetWidth(13)
        arrow:SetHeight(15)
        arrow:SetPoint("TOPLEFT", isNotFirst and relativeTo or frame, "TOPLEFT", isNotFirst and 0 or 16, isNotFirst and yOffset or -65)
        arrow:SetTexture("Interface\\Glues\\Login\\UI-BackArrow")
        return arrow
    end

    -- Function to create button text
    local function CreateButtonText(index, relativeTo, yOffset)
        local text = frame:CreateFontString("KQuestButtonText"..index, "OVERLAY", "GameFontNormalSmall")
        local isNotFirst = index ~= 1
        text:SetWidth(165)
        text:SetHeight(20)
        text:SetJustifyH("LEFT")
        text:SetPoint("TOPLEFT", isNotFirst and relativeTo or frame, "TOPLEFT",  isNotFirst and 0 or 30, isNotFirst and yOffset or -60)
        text:SetText(index)
        return text
    end

    -- Create Alliance and Horde checkboxes
    local allianceCheckbox = CreateCheckbox("KQuestAllianceCheckBox", "TOPLEFT", nil, nil, 12, -30, kQuestAlliance_OnClick)
    allianceCheckbox:SetChecked(true)
    CreateCheckbox("KQuestHordeCheckBox", "TOPRIGHT", nil, nil, -12, -30, kQuestHorde_OnClick)

    -- Create Alliance and Horde textures
    CreateFactionTexture("Alliance")
    CreateFactionTexture("Horde")

    -- Create quest count text field
    local countQuest = frame:CreateFontString("KQuestCounter", "ARTWORK", "GameFontNormal")
    countQuest:SetWidth(60)
    countQuest:SetHeight(40)
    countQuest:SetPoint("TOP", frame, "TOP", 0, -25)

    -- Create quest buttons, arrows and texts
    local prevButton = nil
    local prevArrow = nil
    local prevText = nil
    for i = 1, variables.QMAXQUESTS do
        prevButton = CreateQuestButton(i,i ~=1 and prevButton or nil,i ~=1 and -20 or 0)
        prevArrow = CreateArrow(i,i ~=1 and prevArrow or nil,i ~=1 and -20 or 0)
        prevText = CreateButtonText(i,i ~=1 and prevText or nil,i ~=1 and -20 or 0)
    end

    return frame
end