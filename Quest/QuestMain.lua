---
--- QuestMain.lua - Atlas quest system main functionality
--- 
--- This file contains the main quest system functionality for Atlas-TW.
--- It handles quest display, quest data processing, quest UI management,
--- and provides the core infrastructure for the Atlas quest browser.
--- 
--- Features:
--- - Quest display and management
--- - Quest data processing
--- - Quest UI state handling
--- - Quest navigation system
--- - Quest filtering and search
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
local L = AtlasTW.Local
-----------------------------------------------------------------------------
-- Colours
-----------------------------------------------------------------------------
local red = "|cffff0000"
local white = "|cffFFFFFF"
local grey = "|cff808080"
local orange = "|cffff8000"
local blue = "|cff0070dd"
local green = "|cff00FF00"
local yellow = "|cffffd200"
-----------------------------------------------------------------------------
-- AtlasTW
-----------------------------------------------------------------------------
local kQuestInstChanged
local kQQuestColor

-----------------------------------------------------------------------------
-- Buttons
-----------------------------------------------------------------------------
---
--- Clears all quest-related UI elements and resets quest state
--- Hides quest frames and resets current quest selection
--- @return nil
--- @usage Called when switching maps or clearing quest display
---
function AtlasTW.Quest.ClearAll()
	AtlasTW.Quest.UI.PageCount:SetText()
	AtlasTW.Quest.UI.NextPageButtonRight:Hide()
	AtlasTW.Quest.UI.NextPageButtonLeft:Hide()
	AtlasTW.Quest.UI.QuestName:SetText()
	AtlasTW.Quest.UI.QuestLevel:SetText()
	AtlasTW.Quest.UI.Prerequisite:SetText()
	AtlasTW.Quest.UI.QuestAttainLevel:SetText()
	AtlasTW.Quest.UI.Rewards:SetText()
	AtlasTW.Quest.UI.Story:SetText()
	AtlasTW.Quest.UI.FinishedQuestText:SetText()
    AtlasTW.Quest.UI.FinishedQuestCheckbox:Hide()
	for b = 1, AtlasTW.QMAXQUESTITEMS do
        AtlasTW.Quest.UI.QuestItems[b].Icon:SetTexture()
        AtlasTW.Quest.UI.QuestItems[b].Name:SetText()
        AtlasTW.Quest.UI.QuestItems[b].Extra:SetText()
        AtlasTW.Quest.UI.QuestItems[b].Frame:Disable()
	end
end

-----------------------------------------------------------------------------
-- Hide the AtlasLoot Frame if available
-----------------------------------------------------------------------------
---
--- Hides the AtlasLoot frame if it's currently visible
--- Ensures quest UI doesn't conflict with loot display
--- @return nil
--- @usage Called before showing quest details
---
function AtlasTW.Quest.HideAtlasLootFrame()
	if AtlasLootItemsFrame then
		AtlasLootItemsFrame:Hide() -- hide atlasloot
	end
end

-----------------------------------------------------------------------------
-- Helper function to check if a quest exists
-- Returns true if quest exists, false otherwise
-----------------------------------------------------------------------------
---
--- Checks if a quest exists in the database for given parameters
--- @param instance string - Instance name (defaults to current)
--- @param questId number - Quest ID to check
--- @param faction string - Faction name (defaults to current player faction)
--- @return boolean - True if quest exists, false otherwise
--- @usage Used internally to validate quest existence
---
local function kQQuestExists(instance, questId, faction)
    -- Default to current instance and faction if not provided
    instance = instance or AtlasTW.QCurrentInstance
    faction = faction or (AtlasTW.isHorde and "Horde" or "Alliance")

    -- Check if quest exists in the new format
    return AtlasTW.Quest.DataBase and
           AtlasTW.Quest.DataBase[instance] and
           AtlasTW.Quest.DataBase[instance][faction] and
           AtlasTW.Quest.DataBase[instance][faction][questId] ~= nil
end

---
--- Compares quest with player's quest log and sets appropriate color
--- @param questId number - Quest ID to compare (defaults to current quest)
--- @return boolean - True if quest is found in quest log, false otherwise
--- @usage Used to highlight completed or active quests
---
local function kQCompareQuestLogtoQuest(questId)
    -- Early return if quest log checking is disabled
    if not AtlasTWOptions.QuestCheckQuestlog then
        return false
    end

    -- Use current shown quest if no specific quest ID provided
    local targetQuest = questId or AtlasTW.QCurrentQuest

    -- Get quest data from new structure
    local instanceData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance]
    if not instanceData then
        return false
    end

    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questData = instanceData[faction] and instanceData[faction][targetQuest]

    if questData and not questData.Title then
        return false
    end

    -- Extract quest name from title (remove number prefix like "1. ")
    local questTitle = questData.Title
    local questName = questTitle
    if questTitle and strlen(questTitle) > 0 then
        local _, _, extractedName = strfind(questTitle, "^%d+%.%s*(.+)")
        questName = extractedName or questTitle
    end

    -- Remove parentheses and content within them for better matching
    local startPos, _ = strfind(questName, " %(.*%)")
    if startPos then
        questName = strsub(questName, 1, startPos - 1)
    end

    -- Remove special characters for better matching
    questName = string.gsub(questName, "[%p%c]", "")

    -- Iterate through all quest log entries to find a match
    local totalQuestEntries = GetNumQuestLogEntries()
    for questIndex = 1, totalQuestEntries do
        local logQuestTitle, _, _ = GetQuestLogTitle(questIndex)

        -- Process the quest log title to match our format
        local processedTitle = logQuestTitle
        if processedTitle then

            -- Remove parentheses content and special characters
            local pos = strfind(processedTitle, " %(.*%)")
            if pos then
                processedTitle = strsub(processedTitle, 1, pos - 1)
            end
            processedTitle = string.gsub(processedTitle, "[%p%c]", "")

            -- Case insensitive comparison
            if string.lower(processedTitle) == string.lower(questName) then
                return true
            end
        end
    end

    -- Quest not found in quest log
    return false
end

---
--- Sets the checkbox state for finished quest tracking
--- Updates UI checkbox based on quest completion status
--- @return nil
--- @usage Called when updating quest completion display
---
local function kQuestFinishedSetChecked()
	local questKey = "Completed_"..AtlasTW.QCurrentInstance.."_Quest_"..AtlasTW.QCurrentQuest
	questKey = questKey..(AtlasTW.isHorde and "_Horde" or "_Alliance")
	AtlasTW.Quest.UI.FinishedQuestCheckbox:SetChecked(AtlasTW.Q[questKey] == 1)
end

---
--- Handles multi-page quest display and navigation
--- Sets up page navigation for quests with multiple pages
--- @return nil
--- @usage Called when displaying quests with extended content
---
local function kQuestExtendedPages()
    -- Determine current faction
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questId = AtlasTW.QCurrentQuest
    local instance = AtlasTW.QCurrentInstance

    -- In the new format, check if the quest has Pages data
    local questData = AtlasTW.Quest.DataBase and
        AtlasTW.Quest.DataBase[instance] and
        AtlasTW.Quest.DataBase[instance][faction] and
        AtlasTW.Quest.DataBase[instance][faction][questId]

    -- If we have quest data and it has Pages
    if questData and questData.Page and type(questData.Page) == "table" then
        local pageCount = questData.Page[1] -- The first element contains the total number of pages

        if pageCount and pageCount > 1 then
            -- Show the navigation button for additional pages
            AtlasTW.Quest.UI.NextPageButtonRight:Show()
            -- Set the current page type to "Quest" for proper navigation handling
            AtlasTW.Quest.NextPageCount = "Quest"
            -- Initialize to the first page
            AtlasTW.QCurrentPage = 1
            -- Update the page counter display with current/total format
            AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage .. "/" .. pageCount)
            return
        end
    end
end

---
--- Retrieves and formats item information for quest rewards
--- @param count number - Index of the item in the quest rewards list
--- @return string - Formatted item name or description text
--- @usage Called when displaying quest reward items
---
local function kQuestGetItemInf(count)
    -- Local AtlasTW
    local instance = AtlasTW.QCurrentInstance
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"

    -- Validate input parameters
    if not count or count < 1 then
        return nil
    end

    -- Get quest data from new database structure
    local questData = AtlasTW.Quest.DataBase and
                      AtlasTW.Quest.DataBase[instance] and
                      AtlasTW.Quest.DataBase[instance][faction] and
                      AtlasTW.Quest.DataBase[instance][faction][AtlasTW.QCurrentQuest]

    if not questData or not questData.Rewards then
        return nil
    end

    -- Get the specific reward item by index
    local rewardItem = questData.Rewards[count]
    if not rewardItem then
        return nil
    end

    -- Extract item data from the new structure
    local itemId = rewardItem.id
    local itemDescription = AtlasTW.ItemDB.ParseTooltipForItemInfo(itemId, rewardItem.desc)
    local itemName = white .. L["Item not found in cache"]

    -- Try to get item info from the game
    if itemId and GetItemInfo(itemId) then
        -- Item exists in cache, format with proper quality color
        local gameItemName, _, itemQuality, _, _, _, _, _, itemTexture = GetItemInfo(itemId or 0)
        local _, _, _, hex = GetItemQualityColor(itemQuality)
        local itemtext = hex .. gameItemName

        -- Return requested information type
        return itemtext, itemTexture, itemDescription
    else
        -- Item not in cache, use fallback text from database
        if itemId then
            -- Add error message only if we have an ID but can't load the item
            itemDescription = itemDescription .. " " .. red .. L["This item is not safe!"]
        end
        return itemName, "Interface\\Icons\\INV_Misc_QuestionMark", itemDescription
    end
end

-----------------------------------------------------------------------------
-- set the Quest text
-- executed when you push a button
-----------------------------------------------------------------------------
---
--- Sets up quest text display in the quest details frame
--- Handles multi-page quest descriptions and story text
--- @return nil
--- @usage Called when displaying quest information
---
function AtlasTW.Quest.SetQuestText()
    -- Local AtlasTW for item information
    local itemId, itemName, itemColor, itemTexture, itemDiscription
    -- Clear all previous quest information
    AtlasTW.Quest.ClearAll()
    -- Show the finished quest checkbox
    AtlasTW.Quest.UI.FinishedQuestCheckbox:Show()
    AtlasTW.Quest.UI.FinishedQuestText:SetText(blue .. L["Quest finished:"])

    -- Get quest data from new structure
    local instanceData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance]
    if not instanceData then
        return
    end

    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questData = instanceData[faction] and instanceData[faction][AtlasTW.QCurrentQuest]

    if questData then
        -- Check if quest is in the player's quest log
        kQCompareQuestLogtoQuest(AtlasTW.QCurrentQuest)

        -- Set quest name with appropriate color
        AtlasTW.Quest.UI.QuestName:SetText(kQQuestColor..questData.Title)

        -- Set quest level information
        AtlasTW.Quest.UI.QuestLevel:SetText(blue..L["Level: "]..white..questData.Level)
        AtlasTW.Quest.UI.QuestAttainLevel:SetText(blue..L["Attain: "]..white..questData.Attain)

        -- Set quest details
        AtlasTW.Quest.UI.Prerequisite:SetText(
            blue..L["Prequest: "]..white..(questData.Prequest or L["No"]).."\n \n"..
            blue..L["Quest follows: "]..white..(questData.Folgequest or L["No"]).."\n \n"..
            blue..L["Starts at: \n"]..white..(questData.Location or "").."\n \n"..
            blue..L["Objective: \n"]..white..(questData.Aim or "").."\n \n"..
            blue..L["Note: \n"]..white..(questData.Note or "")
        )

        -- Set reward text from structure if available
        local rewards = questData.Rewards and questData.Rewards.Text
        if rewards then
            -- Process each potential quest reward item (up to 6)
            for itemIndex = 1, AtlasTW.QMAXQUESTITEMS do
                if questData.Rewards[itemIndex] then
                    itemId = questData.Rewards[itemIndex].id or ""
                    -- Handle auto-query functionality if enabled
                    if AtlasTWOptions.QuestAutoQuery then
                        -- Query server for item data if not in cache
                        if not GetItemInfo(itemId) then
                            GameTooltip:SetHyperlink("item:"..itemId..":0:0:0")
                            if not AtlasTWOptions.QuestQuerySpam then
                                print(L["AtlasQuest is querying the server for: "]..
                                "["..white..L["Item not found in cache"]..white.."]"..L[" Try moving the cursor over the item in a second."])
                            end
                        end
                    end
                    --Get item information
                    itemName, itemTexture, itemDiscription = kQuestGetItemInf(itemIndex)
                    -- Set item texture
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Icon:SetTexture(itemTexture)
                    -- Set item name and description
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Name:SetText(itemName)
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Extra:SetText(itemDiscription)
                    -- Enable the item button
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Frame:Enable()
                else
                    -- Clear and disable item slot if no data
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Icon:SetTexture()
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Name:SetText()
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Extra:SetText()
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Frame:Disable()
                end
            end
        else
            rewards = blue..L["No Rewards"]
            -- Disable items frame if no rewards are available
            for itemIndex = 1, AtlasTW.QMAXQUESTITEMS do
                AtlasTW.Quest.UI.QuestItems[itemIndex].Icon:SetTexture()
                AtlasTW.Quest.UI.QuestItems[itemIndex].Name:SetText()
                AtlasTW.Quest.UI.QuestItems[itemIndex].Extra:SetText()
                AtlasTW.Quest.UI.QuestItems[itemIndex].Frame:Disable()
            end
        end
        AtlasTW.Quest.UI.Rewards:SetText(rewards)
    end

    -- Update finished quest checkbox state
    kQuestFinishedSetChecked()

    -- Check for and setup multi-page quest text
    kQuestExtendedPages()
end

---
--- Sets up story text display in the quest frame
--- Displays lore and background information for the current instance
--- @return nil
--- @usage Called when story button is clicked
---
function AtlasTW.Quest.SetStoryText()
    -- Clear display
    AtlasTW.Quest.ClearAll()

    local instanceData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance]
    local story = instanceData and instanceData.Story
    local caption = instanceData and instanceData.Caption

    -- Show story text if available
    if story then
        if type(story) == "table" then
            -- Display first page of multi-page story
            AtlasTW.Quest.UI.QuestName:SetText(blue .. caption[1])
            AtlasTW.Quest.UI.Story:SetText(white .. story["Page1"])

            -- Show navigation buttons if more than one page
            if story["Page2"] then
                AtlasTW.Quest.UI.NextPageButtonRight:Show()
                AtlasTW.QCurrentPage = 1

                -- Show page counter
                local maxPages = story["MaxPages"] or 0
                for i = 1, 20 do -- Reasonable upper limit
                    if not story["Page" .. i] then
                        maxPages = i - 1
                        break
                    end
                end
                AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage .. "/" .. maxPages)

                -- Set page type
                AtlasTW.Quest.NextPageCount = "Story"
            end
        elseif type(story) == "string" then
            -- Display single page story
            AtlasTW.Quest.UI.QuestName:SetText(blue .. caption)
            AtlasTW.Quest.UI.Story:SetText(white .. story)
        end
    else
        -- No story available
        AtlasTW.Quest.UI.QuestName:SetText(L["Not Available"])
        AtlasTW.Quest.UI.Story:SetText(L["Not Available"])
    end
end

-----------------------------------------------------------------------------
-- Loads the saved AtlasTW
-----------------------------------------------------------------------------
---
--- Loads and displays finished quests for the current map
--- Filters quests based on faction and completion status
--- @return nil
--- @usage Called when loading quest data for a map
---
function AtlasTW.Quest.LoadFinishedQuests()
    AtlasTWCharDB = AtlasTWCharDB or {}
    AtlasTW.Q = AtlasTW.Q or {}

    -- Iterate over all known instances from the new database
    if AtlasTW.InstanceData then
        for instanceName, _ in pairs(AtlasTW.InstanceData) do
            for _, faction in ipairs({ "_Alliance", "_Horde" }) do
                for questId = 1, AtlasTW.QMAXQUESTS do
                    local key = "Completed_" .. instanceName .. "_Quest_" .. questId .. faction
                    if AtlasTWCharDB[key] then
                        AtlasTW.Q[key] = AtlasTWCharDB[key]
                    end
                end
            end
        end
    end
end

--******************************************
-- Events: OnUpdate
--******************************************
---
--- Updates the quest display with current quest data
--- Refreshes quest buttons and handles page navigation
--- @return nil
--- @usage Called when quest data changes or page is switched
---
function AtlasTW.Quest.Update()
	local previousInstance = AtlasTW.QCurrentInstance
	-- Update instance information
    AtlasTW.QCurrentInstance = AtlasTW.CurrentMap or ""
	-- Check if we need to hide/update the quest panels
	if AtlasTW.QCurrentInstance ~= previousInstance then
		AtlasTW.Quest.SetQuestButtons()
	elseif AtlasTW.QCurrentInstance == "" then
		AtlasTW.Quest.UI_Main.Frame:Hide()
		AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
	end
end

---
--- Sets up quest buttons with current quest data
--- Configures button text, colors, and click handlers
--- @return nil
--- @usage Called when refreshing quest display
---
function AtlasTW.Quest.SetQuestButtons()
	local instance = AtlasTW.QCurrentInstance
	local faction = AtlasTW.isHorde and "Horde" or "Alliance"
	local questName
	local playerLevel = UnitLevel("player")
	-- Hide inner frame if instance changed
	if kQuestInstChanged ~= instance then
		AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
	end
	-- Update current instance
	kQuestInstChanged = instance
	-- Set quest count text
	local questCount = AtlasTW.Quest.DataBase[instance] and AtlasTW.Quest.DataBase[instance][faction]
        and getn(AtlasTW.Quest.DataBase[instance][faction])
    if questCount then
        if questCount == 1 then
            questCount = "1 Quest"
        elseif questCount == 0 then
            questCount = nil
        else
            questCount = questCount .. " Quests"
        end
    end
	AtlasTW.Quest.UI_Main.QuestCounter:SetText(questCount or "No Quests")
	-- Process quests
	for b = 1, AtlasTW.QMAXQUESTS do
		-- Define keys for current faction
	    -- Check for quest existence
        if kQQuestExists(instance, b, faction) then
             -- Define keys for current faction (for both formats)
            local finishedKey = "Completed_"..instance.."_Quest_"..b.."_"..faction
            -- Get quest data
            questName = AtlasTW.Quest.DataBase[instance][faction][b].Title
            local followQuest = AtlasTW.Quest.DataBase[instance][faction][b].Folgequest
            local preQuest = AtlasTW.Quest.DataBase[instance][faction][b].Prequest
            local questLevel = tonumber(AtlasTW.Quest.DataBase[instance][faction][b].Level)
            -- Set quest line arrows
            local arrowTexture
            if preQuest and preQuest ~= "No" then
                arrowTexture = "Interface\\Glues\\Login\\UI-BackArrow"
            elseif followQuest and followQuest ~= "No" then
                arrowTexture = "Interface\\GossipFrame\\PetitionGossipIcon"
            end
            -- Check for completed quests
            if AtlasTW.Q[finishedKey] == 1 then
                arrowTexture = "Interface\\GossipFrame\\BinderGossipIcon"
            end
            -- Apply arrow texture
            local arrow = AtlasTW.Quest.UI_Main.QuestButtons[b].Arrow
            if arrowTexture then
                arrow:SetTexture(arrowTexture)
                arrow:Show()
            else
                arrow:Hide()
            end
			-- Determine quest color based on level
            if questLevel then
                local levelDiff = questLevel - playerLevel
                -- Determine color based on level difference
                if levelDiff >= -2 and levelDiff <= 2 then
                    kQQuestColor = yellow
                elseif levelDiff > 2 and levelDiff <= 4 then
                    kQQuestColor = orange
                elseif levelDiff > 4 and questLevel ~= 100 then
                    kQQuestColor = red
                elseif levelDiff < -7 then
                    kQQuestColor = grey
                elseif levelDiff >= -7 and levelDiff < -2 then
                    kQQuestColor = green
                end
                -- Apply color settings
                if not AtlasTWOptions.QuestColourCheck then
                    kQQuestColor = yellow
                end
                if questLevel == 100 or kQCompareQuestLogtoQuest(b) then
                    kQQuestColor = blue
                end
                if AtlasTW.Q[finishedKey] == 1 then
                    kQQuestColor = white
                end
            end
			-- Activate button and set text
            AtlasTW.Quest.UI_Main.QuestButtons[b].Button:Enable()
            AtlasTW.Quest.UI_Main.QuestButtons[b].Text:SetText(kQQuestColor..b..") "..questName)
	    else
			-- Deactivate button if quest doesn't exist
            AtlasTW.Quest.UI_Main.QuestButtons[b].Button:Disable()
			AtlasTW.Quest.UI_Main.QuestButtons[b].Text:SetText()
            -- Hide arrow
            AtlasTW.Quest.UI_Main.QuestButtons[b].Arrow:Hide()
		end
	end
end

-- Show version message
print(red.."A"..yellow.."t"..green.."l"..orange.."a"..blue.."s"..white.."-|cff800080TW |cff00FFFFv.|cffFFC0CB"..AtlasTW.Version.." |cffA52A2Aloaded.")