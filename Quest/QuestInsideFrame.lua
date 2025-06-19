-- AtlasTW Quest Inside Atlas frame

local L = AtlasTW.L

-- Constants for configuration
local FRAME_WIDTH = 510
local FRAME_HEIGHT = 510
local FRAME_POINT = { "TOPLEFT", 18, -84 }

local QUEST_ITEM_WIDTH = 236
local QUEST_ITEM_HEIGHT = 30

-- Data-driven configuration for quest items
local QUEST_ITEM_POSITIONS = {
    { x = 20,  y = 120 }, -- Left column, top
    { x = 266, y = 120 }, -- Right column, top
    { x = 20,  y = 70 },  -- Left column, middle
    { x = 266, y = 70 },  -- Right column, middle
    { x = 20,  y = 20 },  -- Left column, bottom
    { x = 266, y = 20 },  -- Right column, bottom
}

-- Main container frame
local frameMain = CreateFrame("Frame", "KQuestInsideFrame", AtlasFrame)
frameMain:SetHeight(FRAME_HEIGHT)
frameMain:SetWidth(FRAME_WIDTH)
frameMain:SetPoint(unpack(FRAME_POINT))
frameMain:EnableMouse(true)
frameMain:Show()

-- Initialize the logic associated with this frame
frameMain:SetScript("OnLoad", function()
    AtlasTW.Quest.Initialize()
end)

-- Table to hold our UI elements for easy access
local UI = {}

-- Helper function to create UI elements
local function CreateElement(type, name, parent, template, width, height, point, text)
    local element = CreateFrame(type, name, parent, template)
    element:SetWidth(width)
    element:SetHeight(height)
    element:SetPoint(unpack(point))
    if text then element:SetText(text) end
    return element
end

-- Helper function to create FontStrings
local function CreateText(name, parent, font, point, width, height, justifyH, justifyV)
    local text = parent:CreateFontString(name, "ARTWORK", font)
    text:SetWidth(width)
    text:SetHeight(height)
    text:SetPoint(unpack(point))
    text:SetJustifyH(justifyH or "CENTER")
    text:SetJustifyV(justifyV or "MIDDLE")
    return text
end

-- Create Quest Item Frames using a loop
UI.QuestItems = {}
for i, pos in ipairs(QUEST_ITEM_POSITIONS) do
    local frameName = "KQuestItemframe" .. i
    local frame = CreateElement("Button", frameName, frameMain, nil, QUEST_ITEM_WIDTH, QUEST_ITEM_HEIGHT, { "BOTTOMLEFT", pos.x, pos.y })
    frame:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

    local icon = frame:CreateTexture(frameName .. "_Icon", "ARTWORK")
    icon:SetWidth(24)
    icon:SetHeight(24)
    icon:SetPoint("TOPLEFT", 0, 0)

    local name = CreateText(frameName .. "_Name", frame, "GameFontNormal", { "TOPLEFT", icon, "TOPRIGHT", 3, 0 }, 205, 12, "LEFT")
    local extra = CreateText(frameName .. "_Extra", frame, "GameFontNormalSmall", { "TOPLEFT", name, "BOTTOMLEFT" }, 205, 10, "LEFT")
    frame:RegisterForClicks("LeftButtonDown", "RightButtonDown")
    frame:SetScript("OnEnter", function()
        AtlasTW.Quest.OnItemEnter()
    end)
    frame:SetScript("OnLeave", function()
        AtlasTW.Quest.OnItemLeave()
    end)
    frame:SetScript("OnClick", function()
        AtlasTW.Quest.OnItemClick(arg1)
    end)
    frame:SetScript("OnShow", function()
        frame:SetFrameLevel(frameMain:GetFrameLevel() + 1)
    end)

    UI.QuestItems[i] = { frame = frame, icon = icon, name = name, extra = extra }
end

-- Control Buttons
UI.CloseButton = CreateElement("Button", "", frameMain, "UIPanelCloseButton", 30, 30, { "TOPRIGHT", -5, -3 })
UI.CloseButton:SetScript("OnClick", function() AtlasTW.Quest.CloseDetails() end)

UI.FinishedQuestCheckbox = CreateElement("CheckButton", "", frameMain, "OptionsCheckButtonTemplate", 25, 25, { "TOPRIGHT", -10, -50 })
UI.FinishedQuestCheckbox:SetHitRectInsets(0, 0, 0, 0)
UI.FinishedQuestCheckbox:SetScript("OnClick", function() AtlasTW.Quest.ToggleFinishedFilter(UI.FinishedQuestCheckbox:GetChecked()) end)

-- Navigation Buttons
UI.NextPageButtonRight = CreateElement("Button", "", frameMain, nil, 40, 40, { "BOTTOM", 45, 10 })
UI.NextPageButtonRight:SetNormalTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Up")
UI.NextPageButtonRight:SetPushedTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Down")
UI.NextPageButtonRight:SetHighlightTexture("Interface\\Glues\\Common\\Glue-RightArrow-Button-Highlight", "ADD")
UI.NextPageButtonRight:SetScript("OnClick", function() AtlasTW.Quest.NextPage() end)
UI.NextPageButtonRight:Hide()

UI.NextPageButtonLeft = CreateElement("Button", "", frameMain, nil, 40, 40, { "BOTTOM", -45, 10 })
UI.NextPageButtonLeft:SetNormalTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Up")
UI.NextPageButtonLeft:SetPushedTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Down")
UI.NextPageButtonLeft:SetHighlightTexture("Interface\\Glues\\Common\\Glue-LeftArrow-Button-Highlight", "ADD")
UI.NextPageButtonLeft:SetScript("OnClick", function() AtlasTW.Quest.PreviousPage() end)
UI.NextPageButtonLeft:Hide()

-- Set FrameLevels for controls
for _, control in pairs({ UI.CloseButton, UI.FinishedQuestCheckbox, UI.NextPageButtonRight, UI.NextPageButtonLeft }) do
    local frame = control
    control:SetScript("OnShow", function()
        frame:SetFrameLevel(frameMain:GetFrameLevel() + 2) -- Higher level for controls
    end)
end

-- Background
local background = frameMain:CreateTexture(nil, "BACKGROUND")
background:SetAllPoints(frameMain)
background:SetTexture(0, 0, 0, 0.75)

-- Text Fields
UI.QuestName = CreateText("KQuestName", frameMain, "GameFontNormal", { "TOP", 0, -20 }, 400, 12)
UI.QuestLevel = CreateText("KQuestLevel", frameMain, "GameFontNormal", { "TOPLEFT", 20, -50 }, 400, 12, "LEFT", "TOP")
UI.QuestAttainLevel = CreateText("KQuestAttainLevel", frameMain, "GameFontNormal", { "TOPLEFT", 140, -50 }, 400, 12, "LEFT", "TOP")
UI.Prerequisite = CreateText("KQuestDetails", frameMain, "GameFontNormal", { "TOPLEFT", 20, -75 }, 450, 500, "LEFT", "TOP")
UI.Story = CreateText("KQuestStory", frameMain, "GameFontNormal", { "TOPLEFT", 50, -50 }, 410, 450, "LEFT", "TOP")
UI.Rewards = CreateText("KQuestReward", frameMain, "GameFontNormal", { "BOTTOMLEFT", 20, 155 }, 400, 12, "LEFT", "TOP")
UI.FinishedQuestText = CreateText("", UI.FinishedQuestCheckbox, "GameFontNormal", { "RIGHT", 0, 2 }, 150, 12)
UI.PageCount = CreateText("KQuestPageCount", frameMain, "GameFontNormal", { "BOTTOM", 0, 18 }, 50, 20, "CENTER", "TOP")

-- Assign UI table to the global namespace for access from other files
AtlasTW.Quest.UI = UI