---
--- AtlasUILogic.lua - Atlas UI logic and minimap button functionality
--- 
--- This file contains UI logic functions for Atlas-TW including minimap button
--- management, position handling, and UI interaction logic. It provides the
--- core functionality for Atlas UI components and user interface behavior.
--- 
--- Features:
--- - Minimap button initialization and positioning
--- - UI state management and updates
--- - Button interaction handling
--- - Position calculation and storage
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI

-- Minimap button logic
---
--- Sets the minimap button position
--- Updates the button position angle and refreshes the display
--- @param v number Position angle in degrees
--- @return nil
--- @usage atlasTWButtonSetPosition(45) -- Set button to 45 degrees
---
local function atlasTWButtonSetPosition(v)
	if v < 0 then
		v = v + 360
	end
	AtlasTWOptions.AtlasButtonPosition = v
	AtlasTW.MinimapButtonUpdatePosition()
end

---
--- Initializes the minimap button
--- Shows or hides the button based on settings and updates position
--- @return nil
--- @usage AtlasTW.MinimapButtonInit() -- Called during addon initialization
---
function AtlasTW.MinimapButtonInit()
	if AtlasTWOptions.AtlasButtonShown then
		AtlasTWButtonFrame:Show()
	else
		AtlasTWButtonFrame:Hide()
	end
	AtlasTW.MinimapButtonUpdatePosition()
end

---
--- Toggles minimap button visibility
--- Shows or hides the minimap button and saves the setting
--- @return nil
--- @usage AtlasTW.MinimapButtonOnClick() -- Called by button click
---
function AtlasTW.MinimapButtonOnClick()
	if AtlasTWButtonFrame:IsVisible() then
		AtlasTWButtonFrame:Hide()
		AtlasTWOptions.AtlasButtonShown = false
	else
		AtlasTWButtonFrame:Show()
		AtlasTWOptions.AtlasButtonShown = true
	end
	AtlasTW.OptionsInit()
end

---
--- Updates the minimap button position
--- Calculates and sets the button position based on radius and angle
--- @return nil
--- @usage AtlasTW.MinimapButtonUpdatePosition() -- Called when position changes
---
function AtlasTW.MinimapButtonUpdatePosition()
	local radius = AtlasTWOptions.AtlasButtonRadius
	local position = AtlasTWOptions.AtlasButtonPosition
	AtlasTWButtonFrame:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (radius * cos(position)),
		(radius * sin(position)) - 55
	)
	AtlasTW.OptionsInit()
end

-- Handles minimap button dragging
---
--- Handles minimap button dragging
--- Updates button position while being dragged around the minimap
--- @return nil
--- @usage AtlasTW.MinimapButtonBeingDragged() -- Called during drag events
---
function AtlasTW.MinimapButtonBeingDragged()
	local xpos, ypos = GetCursorPosition()
	local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()
	local scale = UIParent:GetScale()
	xpos = xmin - xpos / scale + 70
	ypos = ypos / scale - ymin - 70
	atlasTWButtonSetPosition(math.deg(math.atan2(ypos, xpos)))
end

-- Minimap button OnEnter handler
---
--- Handles mouse enter events for minimap button
--- Shows tooltip with Atlas information when hovering over button
--- @return nil
--- @usage AtlasTW.MinimapButtonOnEnter() -- Called on mouse enter
---
function AtlasTW.MinimapButtonOnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT")
	GameTooltip:SetText(AtlasTW.Name)
	GameTooltip:AddLine(L["Left-click to open Atlas-TW.\nMiddle-click for Atlas-TW options.\nRight-click and drag to move this button."],1,1,1,true)
	GameTooltip:Show()
end

-- AtlasTW logic
--Sets the transparency of the Atlas frame based on AtlasAlpha
---
--- Updates the Atlas frame transparency
--- Sets the frame alpha based on current option settings
--- @return nil
--- @usage AtlasTW.OptionsUpdateAlpha() -- Called when alpha setting changes
---
function AtlasTW.OptionsUpdateAlpha()
	AtlasTWFrame:SetAlpha(AtlasTWOptions.AtlasAlpha)
end

--Sets the scale of the Atlas frame based on AtlasScale
---
--- Updates the Atlas frame scale
--- Sets the frame scale based on current option settings
--- @return nil
--- @usage AtlasTW.OptionsUpdateScale() -- Called when scale setting changes
---
function AtlasTW.OptionsUpdateScale()
	AtlasTWFrame:SetScale(AtlasTWOptions.AtlasScale)
end

--Simple function to toggle the visibility of the Atlas frame
---
--- Toggles the Atlas frame visibility
--- Shows or hides the main Atlas frame
--- @return nil
--- @usage AtlasTW.ToggleAtlas() -- Called by slash command or button
---
function AtlasTW.ToggleAtlas()
	if AtlasTWFrame:IsVisible() then
		AtlasTWFrame:Hide()
	else
		AtlasTWFrame:Show()
	end
end

---
--- Shows the update marker on the main frame based on version state
--- @return nil
---
function AtlasTW.UpdateMarkerRefresh()
    local marker = _G["AtlasTWUpdateMarker"]
    if not marker then return end
	AtlasTWUpdateMarker:Show()
end

--Parses slash commands
--If an unrecognized command is given, toggle Atlas
---
--- Handles Atlas slash commands
--- Processes slash command arguments and executes appropriate actions
--- @param msg string Command arguments from slash command
--- @return nil
--- @usage AtlasTW.SlashCommand("toggle") -- Process slash command
---
---
function AtlasTW.SlashCommand(msg)
  	msg = string.lower(msg or '')
	if msg == "options" or msg == "opt" then
		AtlasTW.OptionsOnClick()
	elseif msg == 'ver check' then
		AtlasTW.VersionCheck.publishVersion()
		PrintA(format(L["Version check sent to %s"], AtlasTW.VersionCheck.channelName))
	elseif msg == 'ver' then
    	PrintA(format(L["Version: %s"], AtlasTW.VersionCheck.getLocalVersionString()))
	else
		AtlasTW.ToggleAtlas()
	end
end

--Begin moving the Atlas frame if it's unlocked
---
--- Starts moving the Atlas frame
--- Initiates frame dragging if not locked
--- @return nil
--- @usage AtlasTW.StartMoving() -- Called on drag start
---
function AtlasTW.StartMoving()
	if not AtlasTWOptions.AtlasLocked then
		AtlasTWFrame:StartMoving()
		AtlasTWFrame.isMoving = true
	end
end

--RightButton closes Atlas and open the World Map if the RightClick option is turned on
---
--- Handles Atlas frame click events
--- Processes mouse clicks on the Atlas frame
--- @return nil
--- @usage AtlasTW.OnClick() -- Called on frame click
---
function AtlasTW.OnClick()
	if arg1 == "RightButton" then
		if AtlasTWOptions.AtlasRightClick then
			AtlasTW.ToggleAtlas()
			ToggleWorldMap()
		end
	end
end