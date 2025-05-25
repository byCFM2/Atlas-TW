-- FRAME INSIDE ATLAS
-- AtlasTW Quest Inside Atlas frame

-- Main container frame
local KQuestInsideFrame = CreateFrame("Frame", "KQuestInsideFrame", AtlasFrame)
KQuestInsideFrame:SetWidth(510)
KQuestInsideFrame:SetHeight(510)
KQuestInsideFrame:SetPoint("TOPLEFT", 18, -84)
KQuestInsideFrame:EnableMouse(true)
KQuestInsideFrame:SetToplevel(true)
KQuestInsideFrame:Show()

-- Helper function to create quest item frames
local function CreateQuestItemFrame(frameNumber, xOffset, yOffset)
    local frameName = "KQuestItemframe" .. frameNumber
    local frame = CreateFrame("Button", frameName, KQuestInsideFrame)
    frame:SetWidth(236)
    frame:SetHeight(30)
    frame:SetPoint("BOTTOMLEFT", xOffset, yOffset)
    frame:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

    -- Create icon texture
    local icon = frame:CreateTexture(frameName .. "_Icon", "ARTWORK")
    icon:SetWidth(24)
    icon:SetHeight(24)
    icon:SetPoint("TOPLEFT", frame, "TOPLEFT")

    -- Create name font string
    local name = frame:CreateFontString(frameName .. "_Name", "ARTWORK", "GameFontNormal")
    name:SetWidth(205)
    name:SetHeight(12)
    name:SetPoint("TOPLEFT", icon, "TOPRIGHT", 3, 0)
    name:SetJustifyH("LEFT")

    -- Create extra info font string
    local extra = frame:CreateFontString(frameName .. "_Extra", "ARTWORK", "GameFontNormalSmall")
    extra:SetWidth(205)
    extra:SetHeight(10)
    extra:SetPoint("TOPLEFT", name, "BOTTOMLEFT")
    extra:SetJustifyH("LEFT")

    -- Register events and scripts
    frame:RegisterForClicks("LeftButtonDown", "RightButtonDown")
    frame:SetScript("OnEnter", function()
        AQTHISISSHOWN = frameNumber
        KQuestItem_OnEnter()
    end)
    frame:SetScript("OnLeave", function()
        KQuestItem_OnLeave()
    end)
    frame:SetScript("OnClick", function()
        KQuestItem_OnClick(arg1)
    end)
    frame:SetScript("OnShow", function()
        this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
    end)

    return frame
end

CreateQuestItemFrame(1, 20, 120)   -- Left column, top
CreateQuestItemFrame(2, 266, 120) -- Right column, top
CreateQuestItemFrame(3, 20, 70)   -- Left column, middle
CreateQuestItemFrame(4, 266, 70)  -- Right column, middle
CreateQuestItemFrame(5, 20, 20)   -- Left column, bottom
CreateQuestItemFrame(6, 266, 20)  -- Right column, bottom

-- Close button
local closeButton = CreateFrame("Button", "CLOSEbutton2", KQuestInsideFrame, "UIPanelCloseButton")
closeButton:SetWidth(30)
closeButton:SetHeight(30)
closeButton:SetPoint("TOPRIGHT", -5, -3)
closeButton:SetText("X")
closeButton:SetScript("OnClick", function()
    KQuestCLOSE2_OnClick()
end)
closeButton:SetScript("OnShow", function()
    this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
end)

-- Finished quest checkbox
local finishedQuestCheckbox = CreateFrame("CheckButton", "KQuestFinished", KQuestInsideFrame, "OptionsCheckButtonTemplate")
finishedQuestCheckbox:SetWidth(25)
finishedQuestCheckbox:SetHeight(25)
finishedQuestCheckbox:SetPoint("TOPRIGHT", -20, -45)
finishedQuestCheckbox:SetChecked(false)
finishedQuestCheckbox:SetHitRectInsets(0, 0, 0, 0)
finishedQuestCheckbox:SetScript("OnClick", function()
    KQFinishedQuest_OnClick()
end)
finishedQuestCheckbox:SetScript("OnShow", function()
    this:SetFrameLevel(this:GetParent():GetFrameLevel() + 2)
end)

-- Navigation buttons
local nextPageButtonRight = CreateFrame("Button", "KQNextPageButton_Right", KQuestInsideFrame)
nextPageButtonRight:SetWidth(40)
nextPageButtonRight:SetHeight(40)
nextPageButtonRight:SetPoint("BOTTOM", 45, 10)
nextPageButtonRight:SetNormalTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Up")
nextPageButtonRight:SetPushedTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Down")
nextPageButtonRight:SetHighlightTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Highlight", "ADD")
nextPageButtonRight:Hide()
nextPageButtonRight:SetScript("OnClick", function()
    KQNextPageR_OnClick()
end)
nextPageButtonRight:SetScript("OnShow", function() 
    this:SetFrameLevel(this:GetParent():GetFrameLevel() + 2)
end)

local nextPageButtonLeft = CreateFrame("Button", "KQNextPageButton_Left", KQuestInsideFrame)
nextPageButtonLeft:SetWidth(40)
nextPageButtonLeft:SetHeight(40)
nextPageButtonLeft:SetPoint("BOTTOM", -45, 10)
nextPageButtonLeft:SetNormalTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Up")
nextPageButtonLeft:SetPushedTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Down")
nextPageButtonLeft:SetHighlightTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Highlight", "ADD")
nextPageButtonLeft:Hide()
nextPageButtonLeft:SetScript("OnClick", function()
    KQNextPageL_OnClick()
end)
nextPageButtonLeft:SetScript("OnShow", function() 
    this:SetFrameLevel(this:GetParent():GetFrameLevel() + 2)
end)

-- Background texture
local background = KQuestInsideFrame:CreateTexture(nil, "BACKGROUND")
background:SetAllPoints(KQuestInsideFrame)
background:SetTexture(0, 0, 0, 0.75)

-- Font strings for quest information
local questName = KQuestInsideFrame:CreateFontString("KQuestName", "BACKGROUND", "GameFontNormal")
questName:SetWidth(400)
questName:SetHeight(12)
questName:SetPoint("TOP", 0, -20)

local questLevelText = KQuestInsideFrame:CreateFontString("KQuestLevel", "BACKGROUND", "GameFontNormal")
questLevelText:SetWidth(400)
questLevelText:SetHeight(12)
questLevelText:SetPoint("TOPLEFT", 20, -50)
questLevelText:SetJustifyH("LEFT")
questLevelText:SetJustifyV("TOP")

local questAttainLevelText = KQuestInsideFrame:CreateFontString("KQuestAttainLevel", "BACKGROUND", "GameFontNormal")
questAttainLevelText:SetWidth(400)
questAttainLevelText:SetHeight(12)
questAttainLevelText:SetPoint("TOPLEFT", 140, -50)
questAttainLevelText:SetJustifyH("LEFT")
questAttainLevelText:SetJustifyV("TOP")

local prerequisiteText = KQuestInsideFrame:CreateFontString("KQuestDetails", "BACKGROUND", "GameFontNormal")
prerequisiteText:SetWidth(450)
prerequisiteText:SetHeight(500)
prerequisiteText:SetPoint("TOPLEFT", 20, -75)
prerequisiteText:SetJustifyH("LEFT")
prerequisiteText:SetJustifyV("TOP")

local storyText = KQuestInsideFrame:CreateFontString("KQuestStory", "BACKGROUND", "GameFontNormal")
storyText:SetWidth(410)
storyText:SetHeight(450)
storyText:SetPoint("TOPLEFT", 50, -50)
storyText:SetJustifyH("LEFT")
storyText:SetJustifyV("TOP")

local rewardsText = KQuestInsideFrame:CreateFontString("KQuestReward", "BACKGROUND", "GameFontNormal")
rewardsText:SetWidth(400)
rewardsText:SetHeight(12)
rewardsText:SetPoint("BOTTOMLEFT", 20, 155)
rewardsText:SetJustifyH("LEFT")
rewardsText:SetJustifyV("TOP")

local finishedQuestText = KQuestInsideFrame:CreateFontString("KQuestFinishedText", "BACKGROUND", "GameFontNormal")
finishedQuestText:SetWidth(150)
finishedQuestText:SetHeight(12)
finishedQuestText:SetPoint("TOPRIGHT", -10, -50)
finishedQuestText:SetJustifyH("LEFT")
finishedQuestText:SetJustifyV("TOP")
finishedQuestText:SetText("|cff0070dd"..AQQuestFinished)

local pageCountText = KQuestInsideFrame:CreateFontString("KQuestPageCount", "BACKGROUND", "GameFontNormal")
pageCountText:SetWidth(50)
pageCountText:SetHeight(20)
pageCountText:SetPoint("BOTTOM", 0, 18)
pageCountText:SetJustifyV("TOP")

-- Event handler
KQuestInsideFrame:SetScript("OnEvent", function()
    AQ_OnEvent(event)
end)

-- Show/Hide button frame (AtlasQuest toggle button)
local atlasQuestButtonFrame = CreateFrame("Frame", "AtlasQuestButtonFrame", AtlasFrame)
atlasQuestButtonFrame:SetWidth(1)
atlasQuestButtonFrame:SetHeight(1)
atlasQuestButtonFrame:SetPoint("TOPRIGHT", AtlasFrame, "TOPRIGHT", 0, 0)
atlasQuestButtonFrame:EnableMouse(true)
atlasQuestButtonFrame:SetToplevel(true)
atlasQuestButtonFrame:Show()

local questsToggleButton = CreateFrame("Button", "CLOSEbutton3", atlasQuestButtonFrame, "OptionsButtonTemplate")
questsToggleButton:SetWidth(90)
questsToggleButton:SetHeight(20)
questsToggleButton:SetPoint("TOPRIGHT", -120, -61)
getglobal("CLOSEbutton3Text"):SetText(AQ_Quests)
questsToggleButton:SetScript("OnClick", function()
    KQuestCLOSE_OnClick()
end)
questsToggleButton:SetScript("OnUpdate", function()
    -- Check if AtlasFrame exists and update visibility accordingly
    if not AtlasFrame then
        this:Hide()
        return
    end
end)
questsToggleButton:SetScript("OnShow", function()
    -- Ensure button is only shown when AtlasFrame exists
    if not AtlasFrame then
        this:Hide()
        return
    end
end)