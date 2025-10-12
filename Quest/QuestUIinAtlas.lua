---
--- QuestUIinAtlas.lua - Atlas quest UI integration within main Atlas frame
--- 
--- This file contains the quest UI integration within the main Atlas frame for Atlas-TW.
--- It handles quest display inside the Atlas window, quest item positioning,
--- and provides the embedded quest interface functionality.
--- 
--- Features:
--- - Quest UI integration within Atlas frame
--- - Quest item positioning and layout
--- - Embedded quest display management
--- - Quest frame configuration
--- - Atlas-quest UI coordination
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

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
local frameMain = CreateFrame("Frame", "", AtlasFrame)
frameMain:SetHeight(FRAME_HEIGHT)
frameMain:SetWidth(FRAME_WIDTH)
frameMain:SetPoint(unpack(FRAME_POINT))
frameMain:EnableMouse(true)
frameMain:Show()

-- Table to hold our UI elements for easy access
local UI = {InsideAtlasFrame = frameMain}

---
--- Helper function to create UI elements with common properties
--- @param type string The frame type to create (e.g., "Button", "Frame")
--- @param name string The name for the frame (can be empty string)
--- @param parent table The parent frame object
--- @param template string The template to use for the frame (optional)
--- @param width number The width of the element in pixels
--- @param height number The height of the element in pixels
--- @param point table The positioning point as {anchor, x, y} or {anchor, relativeTo, relativeAnchor, x, y}
--- @param text string Optional text to set on the element
--- @return table The created UI element
--- @usage local button = CreateElement("Button", "", parent, "UIPanelButtonTemplate", 100, 30, {"CENTER", 0, 0}, "Click Me")
---
local function CreateElement(type, name, parent, template, width, height, point, text)
    local element = CreateFrame(type, name, parent, template)
    element:SetWidth(width)
    element:SetHeight(height)
    element:SetPoint(unpack(point))
    if text then element:SetText(text) end
    return element
end

---
--- Helper function to create FontString objects with common properties
--- @param name string The name for the FontString (can be empty string)
--- @param parent table The parent frame object
--- @param font string The font template to use (e.g., "GameFontNormal")
--- @param point table The positioning point as {anchor, x, y} or {anchor, relativeTo, relativeAnchor, x, y}
--- @param width number The width of the text area in pixels
--- @param height number The height of the text area in pixels
--- @param justifyH string Horizontal justification ("LEFT", "CENTER", "RIGHT"), defaults to "CENTER"
--- @param justifyV string Vertical justification ("TOP", "MIDDLE", "BOTTOM"), defaults to "MIDDLE"
--- @return table The created FontString object
--- @usage local label = CreateText("", parent, "GameFontNormal", {"TOP", 0, -10}, 200, 20, "LEFT", "TOP")
---
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
    local index = i
    local frame = CreateElement("Button", "", frameMain, nil, QUEST_ITEM_WIDTH, QUEST_ITEM_HEIGHT, { "BOTTOMLEFT", pos.x, pos.y })
    frame:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

    local icon = frame:CreateTexture("", "ARTWORK")
    icon:SetWidth(24)
    icon:SetHeight(24)
    icon:SetPoint("TOPLEFT", 0, 0)

    local name = CreateText("", frame, "GameFontNormal", { "TOPLEFT", icon, "TOPRIGHT", 3, 0 }, 205, 12, "LEFT")
    local extra = CreateText("", frame, "GameFontNormalSmall", { "TOPLEFT", name, "BOTTOMLEFT" }, 205, 10, "LEFT")
    frame:RegisterForClicks("LeftButtonDown", "RightButtonDown")
    frame:SetScript("OnEnter", function()
        AtlasTW.Quest.OnItemEnter(index)
    end)
    frame:SetScript("OnLeave", function()
        AtlasTW.Quest.OnItemLeave()
    end)
    frame:SetScript("OnClick", function()
        AtlasTW.Quest.OnItemClick(arg1, index)
    end)
    frame:SetScript("OnShow", function()
        frame:SetFrameLevel(frameMain:GetFrameLevel() + 1)
    end)

    UI.QuestItems[i] = { Frame = frame, Icon = icon, Name = name, Extra = extra }
end

-- Control Buttons
UI.CloseButton = CreateElement("Button", "", frameMain, "UIPanelCloseButton", 30, 30, { "TOPRIGHT", -5, -3 })
UI.CloseButton:SetScript("OnClick", function() AtlasTW.Quest.CloseDetails() end)

UI.FinishedQuestCheckbox = CreateElement("CheckButton", "", frameMain, "OptionsCheckButtonTemplate", 25, 25, { "TOPRIGHT", -10, -50 })
UI.FinishedQuestCheckbox:SetHitRectInsets(0, 0, 0, 0)
UI.FinishedQuestCheckbox:SetScript("OnClick", function() AtlasTW.Quest.ToggleFinishedFilter() end)

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
UI.QuestName = CreateText("", frameMain, "GameFontNormal", { "TOP", 0, -20 }, 400, 12)
UI.QuestLevel = CreateText("", frameMain, "GameFontNormal", { "TOPLEFT", 20, -50 }, 400, 12, "LEFT", "TOP")
UI.QuestAttainLevel = CreateText("", frameMain, "GameFontNormal", { "TOPLEFT", 140, -50 }, 400, 12, "LEFT", "TOP")
UI.Prerequisite = CreateText("", frameMain, "GameFontNormal", { "TOPLEFT", 20, -75 }, 450, 500, "LEFT", "TOP")
UI.Story = CreateText("", frameMain, "GameFontNormal", { "TOPLEFT", 50, -50 }, 410, 450, "LEFT", "TOP")
UI.Rewards = CreateText("", frameMain, "GameFontNormal", { "BOTTOMLEFT", 20, 155 }, 400, 12, "LEFT", "TOP")
UI.FinishedQuestText = CreateText("", UI.FinishedQuestCheckbox, "GameFontNormal", { "RIGHT", 0, 2 }, 150, 12)
UI.PageCount = CreateText("", frameMain, "GameFontNormal", { "BOTTOM", 0, 18 }, 50, 20, "CENTER", "TOP")

-- Assign UI table to the global namespace for access from other files
AtlasTW.Quest.UI = UI