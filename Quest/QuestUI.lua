-- AtlasTW Quest UI Frame Creation

AtlasTW = AtlasTW or {}
AtlasTW.Quest = AtlasTW.Quest or {}

-- Constants
local FRAME_WIDTH = 220
local FRAME_HEIGHT = 570
local FRAME_POINT = { "TOP", "AtlasFrame", -556, -30 }

-- Main Frame
local frame = CreateFrame("Frame", "", AtlasFrame)
frame:SetWidth(FRAME_WIDTH)
frame:SetHeight(FRAME_HEIGHT)
frame:SetPoint(unpack(FRAME_POINT))
frame:SetMovable(false)
frame:EnableMouse(true)
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
frame:Hide()

-- UI Elements Table
local UI_Main = { Frame = frame }

-- Helper to create elements
local function CreateElement(type, name, parent, template, width, height, point, text)
    local element = CreateFrame(type, name, parent, template)
    element:SetWidth(width)
    element:SetHeight(height)
    element:SetPoint(unpack(point))
    if text then element:SetText(text) end
    return element
end

-- Helper to create FontStrings
local function CreateText(name, parent, font, point, width, height, justifyH, justifyV)
    local text = parent:CreateFontString(name, "ARTWORK", font)
    text:SetWidth(width)
    text:SetHeight(height)
    text:SetPoint(unpack(point))
    text:SetJustifyH(justifyH or "CENTER")
    text:SetJustifyV(justifyV or "MIDDLE")
    return text
end

-- Set Frame Level on Show
local function setFrameLevelOnShow()
    this:SetFrameLevel(this:GetParent():GetFrameLevel() + 1)
end

-- Close Button
UI_Main.CloseButton = CreateElement("Button", "", frame, "UIPanelCloseButton", 27, 27, { "TOPLEFT", 10, -10 })
UI_Main.CloseButton:SetScript("OnClick", function () AtlasTW.Quest.CloseQuestFrame() end)
UI_Main.CloseButton:SetScript("OnShow", setFrameLevelOnShow)

-- Story Button
UI_Main.StoryButton = CreateElement("Button", "", frame, "OptionsButtonTemplate", 70, 20, { "TOP", 0, -13 }, AQStoryB)
UI_Main.StoryButton:SetScript("OnClick", function () AtlasTW.Quest.OnStoryClick() end)
UI_Main.StoryButton:SetScript("OnShow", setFrameLevelOnShow)

-- Checkboxes
UI_Main.AllianceCheck = CreateElement("CheckButton", "", frame, "OptionsCheckButtonTemplate", 30, 30, { "TOPLEFT", 12, -30 })
UI_Main.AllianceCheck:SetChecked(true)
UI_Main.AllianceCheck:SetHitRectInsets(0, 0, 0, 0)
UI_Main.AllianceCheck:SetScript("OnClick", function () AtlasTW.Quest.OnAllianceClick() end)
UI_Main.AllianceCheck:SetScript("OnShow", setFrameLevelOnShow)

UI_Main.HordeCheck = CreateElement("CheckButton", "", frame, "OptionsCheckButtonTemplate", 30, 30, { "TOPRIGHT", -12, -30 })
UI_Main.HordeCheck:SetChecked(false)
UI_Main.HordeCheck:SetHitRectInsets(0, 0, 0, 0)
UI_Main.HordeCheck:SetScript("OnClick", function () AtlasTW.Quest.OnHordeClick() end)
UI_Main.HordeCheck:SetScript("OnShow", setFrameLevelOnShow)

-- Faction Textures
UI_Main.AllianceTexture = frame:CreateTexture("", "OVERLAY")
UI_Main.AllianceTexture:SetWidth(50)
UI_Main.AllianceTexture:SetHeight(50)
UI_Main.AllianceTexture:SetPoint("TOPLEFT", 38, -30)
UI_Main.AllianceTexture:SetTexture("Interface\\TargetingFrame\\UI-PVP-Alliance")

UI_Main.HordeTexture = frame:CreateTexture("", "OVERLAY")
UI_Main.HordeTexture:SetWidth(50)
UI_Main.HordeTexture:SetHeight(50)
UI_Main.HordeTexture:SetPoint("TOPRIGHT", -26, -30)
UI_Main.HordeTexture:SetTexture("Interface\\TargetingFrame\\UI-PVP-Horde")

-- Quest Counter Text
UI_Main.QuestCounter = CreateText("", frame, "GameFontNormal", { "TOP", 0, -25 }, 60, 40)

-- Quest Buttons, Arrows, and Texts
UI_Main.QuestButtons = {}
for i = 1, AtlasTW.QMAXQUESTS do
    local index = i
    local yOffset = -60 - (i - 1) * 20
    local button = CreateElement("Button", "", frame, nil, 165, 20, { "TOPLEFT", 15, yOffset })
    button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    button:SetScript("OnClick", function() AtlasTW.Quest.OnQuestClick(index) end)
    button:SetScript("OnShow", setFrameLevelOnShow)

    local arrow = frame:CreateTexture("", "OVERLAY")
    arrow:SetWidth(13)
    arrow:SetHeight(15)
    arrow:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -2.5)
    arrow:SetTexture("Interface\\Glues\\Login\\UI-BackArrow")

    local text = CreateText("", button, "GameFontNormalSmall", { "TOPLEFT", 15, 0 }, 150, 20, "LEFT")

    UI_Main.QuestButtons[i] = { Button = button, Arrow = arrow, Text = text }
end

-- Register Events
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function () AtlasTW.Quest.OnEvent() end)
frame:SetScript("OnShow", function () AtlasTW.Quest.OnQuestFrameShow() end)

-- Assign UI table to the global namespace
AtlasTW.Quest.UI_Main = UI_Main