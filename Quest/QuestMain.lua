local _G = getfenv()
AtlasTW = _G.AtlasTW
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
function AtlasTW.Quest.HideAtlasLootFrame()
	if AtlasLootItemsFrame then
		AtlasLootItemsFrame:Hide() -- hide atlasloot
	end
end

-- Function to get quest data from the new format
-----------------------------------------------------------------------------
local function kQGetQuestData(instanceId, questId, faction, field)
    -- Default to current instance and quest if not provided
    instanceId = instanceId or AtlasTW.QCurrentInstance
    questId = questId or AtlasTW.QCurrentQuest
    faction = faction or (AtlasTW.isHorde and "Horde" or "Alliance")

    -- Ensure AtlasTW.Quest.DataBase is available
    if not AtlasTW.Quest.DataBase or not AtlasTW.Quest.DataBase[instanceId] or
       not AtlasTW.Quest.DataBase[instanceId].Quests or
       not AtlasTW.Quest.DataBase[instanceId].Quests[faction] or
       (questId and not AtlasTW.Quest.DataBase[instanceId].Quests[faction][questId]) then
        return nil
    end

    if (field or "Title") then
        return AtlasTW.Quest.DataBase[instanceId].Quests[faction][questId][field]
    end
    -- Field wasn't found
    return nil
end

-----------------------------------------------------------------------------
-- Helper function to check if a quest exists
-- Returns true if quest exists, false otherwise
-----------------------------------------------------------------------------
local function kQQuestExists(instanceId, questId, faction)
    -- Default to current instance and faction if not provided
    instanceId = instanceId or AtlasTW.QCurrentInstance
    faction = faction or (AtlasTW.isHorde and "Horde" or "Alliance")

    -- Check if quest exists in the new format
    return AtlasTW.Quest.DataBase and
           AtlasTW.Quest.DataBase[instanceId] and
           AtlasTW.Quest.DataBase[instanceId].Quests and
           AtlasTW.Quest.DataBase[instanceId].Quests[faction] and
           AtlasTW.Quest.DataBase[instanceId].Quests[faction][questId] ~= nil
end

-- Check if a quest exists in the player's quest log and set appropriate color
-- Returns true if quest is found in quest log, false otherwise
local function kQCompareQuestLogtoQuest(questId)
    -- Early return if quest log checking is disabled
    if not AtlasTWOptions.QuestCheckQuestlog then
        return false
    end

    -- Use current shown quest if no specific quest ID provided
    local targetQuest = questId or AtlasTW.QCurrentQuest

    -- Get quest data from new structure
    local instanceData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance]
    if not instanceData or not instanceData.Quests then
        return false
    end

    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questData = instanceData.Quests[faction] and instanceData.Quests[faction][targetQuest]

    if not questData or not questData.Title then
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

-----------------------------------------------------------------------------
-- set the checkbox for the finished quest check
-- swaped out to get the code clear
-----------------------------------------------------------------------------
local function kQuestFinishedSetChecked()
	local questKey = "AtlasTWQuestFinishedInst"..AtlasTW.QCurrentInstance.."Quest"..AtlasTW.QCurrentQuest
	questKey = questKey..(AtlasTW.isHorde and "Horde" or "Alliance")
	AtlasTW.Quest.UI.FinishedQuestCheckbox:SetChecked(AtlasTW.Q[questKey] == 1)
end

-----------------------------------------------------------------------------
-- Allow pages
-- In the new format, we need to implement proper handling of multi-page quests
-----------------------------------------------------------------------------
local function kQuestExtendedPages()
    -- Determine current faction
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questId = AtlasTW.QCurrentQuest
    local instanceId = AtlasTW.QCurrentInstance

    -- In the new format, check if the quest has Pages data
    local questData = AtlasTW.Quest.DataBase and
        AtlasTW.Quest.DataBase[instanceId] and
        AtlasTW.Quest.DataBase[instanceId].Quests and
        AtlasTW.Quest.DataBase[instanceId].Quests[faction] and
        AtlasTW.Quest.DataBase[instanceId].Quests[faction][questId]

    -- If we have quest data and it has Pages
    if questData and questData.Page and type(questData.Page) == "table" then
        local pageCount = questData.Page[1] -- Первый элемент содержит количество страниц

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

-----------------------------------------------------------------------------
-- Retrieves and formats item information for quest rewards
-- @param count - Index of the item in the quest rewards list
-- @param what - Type of information to return ("name" or "extra")
-- @return Formatted item name or description text
-----------------------------------------------------------------------------
local function kQuestGetItemInf(count, what)
    -- Local AtlasTW
    local instanceId = AtlasTW.QCurrentInstance
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"

    -- Validate input parameters
    if not count or count < 1 then
        return nil
    end

    -- Get quest data from new database structure
    local questData = AtlasTW.Quest.DataBase and
                      AtlasTW.Quest.DataBase[instanceId] and
                      AtlasTW.Quest.DataBase[instanceId].Quests and
                      AtlasTW.Quest.DataBase[instanceId].Quests[faction] and
                      AtlasTW.Quest.DataBase[instanceId].Quests[faction][AtlasTW.QCurrentQuest]

    if not questData or not questData.Rewards then
        return nil
    end

    -- Get the specific reward item by index
    local rewardItem = questData.Rewards[count]
    if not rewardItem then
        return nil
    end

    -- Extract item data from the new structure
    local itemId = rewardItem.ID
    local itemDescription = rewardItem.Description
    local itemColor = rewardItem.Color or white
    local itemName = rewardItem.Name

    -- Cache fallback text in case item info isn't available
    local itemTEXTSAVED = itemColor .. itemName

    -- Try to get item info from the game
    if itemId and GetItemInfo(itemId) then
        -- Item exists in cache, format with proper quality color
        local gameItemName, _, itemQuality = GetItemInfo(itemId)
        local _, _, _, hex = GetItemQualityColor(itemQuality)
        local itemtext = hex .. gameItemName

        -- Return requested information type
        if what == "name" then
            return itemtext
        elseif what == "extra" then
            return itemDescription or ""
        end
    else
        -- Item not in cache, use fallback text from database
        local itemtext = itemTEXTSAVED
        if what == "name" then
            return itemtext
        elseif what == "extra" then
            local description = itemDescription or ""
            if itemId then
                -- Add error message only if we have an ID but can't load the item
                description = description .. " " .. red .. (AQERRORNOTSHOWN or "Item not found")
            end
            return description
        end
    end

    return nil
end

-----------------------------------------------------------------------------
-- get reward info
-----------------------------------------------------------------------------
local function getRewardItemData(questData, itemIndex, field)
    if questData and questData.Rewards and
        questData.Rewards[itemIndex] and
        questData.Rewards[itemIndex][field] then
        return questData.Rewards[itemIndex][field]
    end
    return nil
end

-----------------------------------------------------------------------------
-- set the Quest text
-- executed when you push a button
-----------------------------------------------------------------------------
function AtlasTW.Quest.SetQuestText()
    -- Local AtlasTW for item information
    local itemId, itemName, itemColor, itemTexture
    -- Clear all previous quest information
    AtlasTW.Quest.ClearAll()
    -- Show the finished quest checkbox
    AtlasTW.Quest.UI.FinishedQuestCheckbox:Show()
    AtlasTW.Quest.UI.FinishedQuestText:SetText(blue .. AQQuestFinished)

    -- Get quest data from new structure
    local instanceData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance]
    if not instanceData or not instanceData.Quests then
        return
    end

    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questData = instanceData.Quests[faction] and instanceData.Quests[faction][AtlasTW.QCurrentQuest]

    if questData then
        -- Check if quest is in the player's quest log
        kQCompareQuestLogtoQuest(AtlasTW.QCurrentQuest)

        -- Set quest name with appropriate color
        AtlasTW.Quest.UI.QuestName:SetText(kQQuestColor..questData.Title)

        -- Set quest level information
        AtlasTW.Quest.UI.QuestLevel:SetText(blue..AQDiscription_LEVEL..white..questData.Level)
        AtlasTW.Quest.UI.QuestAttainLevel:SetText(blue..AQDiscription_ATTAIN..white..questData.Attain)

        -- Set quest details
        AtlasTW.Quest.UI.Prerequisite:SetText(
            blue..AQDiscription_PREQUEST..white..(questData.Prequest or "").."\n \n"..
            blue..AQDiscription_FOLGEQUEST..white..(questData.Folgequest or "").."\n \n"..
            blue..AQDiscription_START..white..(questData.Location or "").."\n \n"..
            blue..AQDiscription_AIM..white..(questData.Aim or "").."\n \n"..
            blue..AQDiscription_NOTE..white..(questData.Note or "")
        )

        -- Set reward text from structure if available
        local rewards = questData.Rewards and questData.Rewards["Text"] or AQNoReward
        AtlasTW.Quest.UI.Rewards:SetText(rewards)
        if rewards ~= AQNoReward then
            -- Process each potential quest reward item (up to 6)
            for itemIndex = 1, AtlasTW.QMAXQUESTITEMS do
                if questData.Rewards[itemIndex] then
                    itemId = getRewardItemData(questData,itemIndex,"ID") or ""
                    -- Handle auto-query functionality if enabled
                    if AtlasTWOptions.QuestAutoQuery then
                        itemColor = getRewardItemData(questData,itemIndex,"Color") or ""
                        itemName = getRewardItemData(questData,itemIndex,"Name") or ""
                        -- Query server for item data if not in cache
                        if not GetItemInfo(itemId) then
                            GameTooltip:SetHyperlink("item:"..itemId..":0:0:0")
                            if not AtlasTWOptions.QuestQuerySpam then
                                DEFAULT_CHAT_FRAME:AddMessage(AQSERVERASK.."["..itemColor..itemName..white.."]"..AQSERVERASKAuto)
                            end
                        end
                    end

                    -- Get item texture and set it
                    _, _, _, _, _, _, _, _, itemTexture = GetItemInfo(itemId)
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Icon:SetTexture(itemTexture)

                    -- Set item name and description
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Name:SetText(kQuestGetItemInf(itemIndex, "name"))
                    AtlasTW.Quest.UI.QuestItems[itemIndex].Extra:SetText(kQuestGetItemInf(itemIndex, "extra"))
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
            -- Disable items frame if no rewards are available
            for itemIndex = 1, AtlasTW.QMAXQUESTITEMS do
                AtlasTW.Quest.UI.QuestItems[itemIndex].Icon:SetTexture()
                AtlasTW.Quest.UI.QuestItems[itemIndex].Name:SetText()
                AtlasTW.Quest.UI.QuestItems[itemIndex].Extra:SetText()
                AtlasTW.Quest.UI.QuestItems[itemIndex].Frame:Disable()
            end
        end
    end

    -- Update finished quest checkbox state
    kQuestFinishedSetChecked()

    -- Check for and setup multi-page quest text
    kQuestExtendedPages()
end

-----------------------------------------------------------------------------
-- Set Story Text
-----------------------------------------------------------------------------
function AtlasTW.Quest.SetStoryText()
    -- Clear display
    AtlasTW.Quest.ClearAll()

    -- Get story information directly from AtlasTW.Quest.DataBase
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
        AtlasTW.Quest.UI.QuestName:SetText(AQNotAvailable)
        AtlasTW.Quest.UI.Story:SetText(AQNotAvailable)
    end
end

-----------------------------------------------------------------------------
-- Loads the saved AtlasTW
-----------------------------------------------------------------------------
function AtlasTW.Quest.LoadFinishedQuests()
    AtlasTWCharDB = AtlasTWCharDB or {}
	for i=1, AtlasTW.QMAXINSTANCES do
		for b=1, AtlasTW.QMAXQUESTS do
			AtlasTW.Q["AtlasTWQuestFinishedInst"..i.."Quest"..b.."Alliance"] = AtlasTWCharDB["AtlasTWQuestFinishedInst"..i.."Quest"..b.."Alliance"]
			AtlasTW.Q["AtlasTWQuestFinishedInst"..i.."Quest"..b.."Horde"] = AtlasTWCharDB["AtlasTWQuestFinishedInst"..i.."Quest"..b.."Horde"]
		end
	end
end

--******************************************
-- Events: OnUpdate
--******************************************
-----------------------------------------------------------------------------
-- hide panel if instance is 99 (nothing)
-----------------------------------------------------------------------------
function AtlasTW.Quest.Update()
	local previousInstance = AtlasTW.QCurrentInstance
	-- Update instance information
    AtlasTW.QCurrentInstance = AtlasTW.INSTANCEMAP[AtlasTW.CurrentMap] or 99
	-- Check if we need to hide/update the quest panels
	if AtlasTW.QCurrentInstance ~= previousInstance then
		AtlasTW.Quest.SetQuestButtons()
	elseif AtlasTW.QCurrentInstance == 99 then
		AtlasTW.Quest.UI_Main.Frame:Hide()
		AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
	end
end

-----------------------------------------------------------------------------
-- Set the Buttontext and the buttons if available
-- and check whether its a other inst or not -> works fine
-- added: Check for Questline arrows
-- Questline arrows are shown if InstXQuestYFQuest = "true"
-- QuestStart icon are shown if InstXQuestYPreQuest = "true"
-----------------------------------------------------------------------------
function AtlasTW.Quest.SetQuestButtons()
    local isHorde = AtlasTW.isHorde
	local instanceId = AtlasTW.QCurrentInstance
	local faction = isHorde and "Horde" or "Alliance"
	local questName
	local playerLevel = UnitLevel("player")
	-- Hide inner frame if instance changed
	if kQuestInstChanged ~= instanceId then
		AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
	end
	-- Update current instance
	kQuestInstChanged = instanceId
	-- Set quest count text
	local questCountKey = isHorde and "QAH" or "QAA"
	local questCount = AtlasTW.Quest.DataBase[instanceId] and AtlasTW.Quest.DataBase[instanceId][questCountKey]
	AtlasTW.Quest.UI_Main.QuestCounter:SetText(questCount or "")
	-- Process quests
	for b = 1, AtlasTW.QMAXQUESTS do
		-- Define keys for current faction
	    -- Check for quest existence
        if kQQuestExists(instanceId, b, faction) then
             -- Define keys for current faction (for both formats)
            local finishedKey = "AtlasTWQuestFinishedInst"..instanceId.."Quest"..b..(isHorde and "Horde" or "Alliance")
            -- Get quest data
            questName = kQGetQuestData(instanceId, b, faction, "Title")
            local followQuest = kQGetQuestData(instanceId, b, faction, "Folgequest")
            local preQuest = kQGetQuestData(instanceId, b, faction, "Prequest")
            local questLevel = tonumber(kQGetQuestData(instanceId, b, faction, "Level"))
            -- Set quest line arrows
            local arrowTexture
            if preQuest ~= "No" then
                arrowTexture = "Interface\\Glues\\Login\\UI-BackArrow"
            elseif followQuest ~= "No" then
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
            AtlasTW.Quest.UI_Main.QuestButtons[b].Text:SetText(kQQuestColor..questName)
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
DEFAULT_CHAT_FRAME:AddMessage(red.."A"..yellow.."t"..green.."l"..orange.."a"..blue.."s"..white.."-|cff800080TW |cff00FFFFv.|cffFFC0CB"..AtlasTW.Version.." |cffA52A2Aloaded.")