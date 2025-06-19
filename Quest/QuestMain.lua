local _G = getfenv()
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
local UI = AtlasTW.Quest.UI or {}
-----------------------------------------------------------------------------
-- AtlasTW
-----------------------------------------------------------------------------
local kQQuestColor
AtlasTW = AtlasTW or {}
local kQuestInstChanged

-----------------------------------------------------------------------------
-- Buttons
-----------------------------------------------------------------------------
function AtlasTW.Quest.ClearAll()
	KQuestPageCount:SetText()
	HideUIPanel(UI.NextPageButtonRight)
	HideUIPanel(UI.NextPageButtonLeft)
	KQuestName:SetText()
	KQuestLevel:SetText()
	KQuestDetails:SetText()
	KQuestAttainLevel:SetText()
	KQuestReward:SetText()
	KQuestStory:SetText()
	UI.FinishedQuestText:SetText()
    HideUIPanel(UI.FinishedQuestCheckbox)
	for b = 1, AtlasTW.QMAXQUESTITEMS do
		_G["KQuestItemframe"..b.."_Icon"]:SetTexture()
		_G["KQuestItemframe"..b.."_Name"]:SetText()
		_G["KQuestItemframe"..b.."_Extra"]:SetText()
		_G["KQuestItemframe"..b]:Disable()
	end
end

function KQuestClose1_OnClick()
	AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
    HideUIPanel(KQuestFrame)
    HideUIPanel(KQuestInsideFrame)
    KQAutoshowOption:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasOptions_Init()
end

-----------------------------------------------------------------------------
-- upper right button / to show/close panel
-----------------------------------------------------------------------------
function KQuestCLOSE_OnClick()
	AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
	if not AtlasTWOptions.QuestWithAtlas then
		HideUIPanel(KQuestFrame)
		HideUIPanel(KQuestInsideFrame)
	else
		ShowUIPanel(KQuestFrame)
	end
    KQAutoshowOption:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasOptions_Init()
end

-----------------------------------------------------------------------------
-- inside button to close the quest display
-----------------------------------------------------------------------------
--[[ function KQuestCLOSE2_OnClick()
	HideUIPanel(KQuestInsideFrame)
	AtlasTW.QCurrentButton = 0
end ]]

-----------------------------------------------------------------------------
-- Hide the AtlasLoot Frame if available
-----------------------------------------------------------------------------
function KQuestHideAL()
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

    -- Ensure KQuestInstanceData is available
    if not KQuestInstanceData or not KQuestInstanceData[instanceId] or
       not KQuestInstanceData[instanceId].Quests or
       not KQuestInstanceData[instanceId].Quests[faction] or
       (questId and not KQuestInstanceData[instanceId].Quests[faction][questId]) then
        return nil
    end

    if (field or "Title") then
        return KQuestInstanceData[instanceId].Quests[faction][questId][field]
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
    return KQuestInstanceData and
           KQuestInstanceData[instanceId] and
           KQuestInstanceData[instanceId].Quests and
           KQuestInstanceData[instanceId].Quests[faction] and
           KQuestInstanceData[instanceId].Quests[faction][questId] ~= nil
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
    local instanceData = KQuestInstanceData[AtlasTW.QCurrentInstance]
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
	questKey = questKey..(AtlasTW.isHorde and "HORDE" or "")
	UI.FinishedQuestCheckbox:SetChecked(AtlasTW.Q[questKey] == 1)
end

-----------------------------------------------------------------------------
-- Allow pages
-- In the new format, we need to implement proper handling of multi-page quests
-- HideUIPanel(UI.NextPageButtonLeft) KQuestPageCount:SetText()
-----------------------------------------------------------------------------
local function kQuestExtendedPages()
    -- Determine current faction
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questId = AtlasTW.QCurrentQuest
    local instanceId = AtlasTW.QCurrentInstance

    -- In the new format, check if the quest has Pages data
    local questData = KQuestInstanceData and
        KQuestInstanceData[instanceId] and
        KQuestInstanceData[instanceId].Quests and
        KQuestInstanceData[instanceId].Quests[faction] and
        KQuestInstanceData[instanceId].Quests[faction][questId]

    -- If we have quest data and it has Pages
    if questData and questData.Page and type(questData.Page) == "table" then
        local pageCount = questData.Page[1] -- Первый элемент содержит количество страниц

        if pageCount and pageCount > 1 then
            -- Show the navigation button for additional pages
            ShowUIPanel(UI.NextPageButtonRight)
            -- Set the current page type to "Quest" for proper navigation handling
            AtlasTW.Quest.NextPageCount = "Quest"
            -- Initialize to the first page
            AtlasTW.QCurrentPage = 1
            -- Update the page counter display with current/total format
            KQuestPageCount:SetText(AtlasTW.QCurrentPage .. "/" .. pageCount)
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
    local questData = KQuestInstanceData and
                      KQuestInstanceData[instanceId] and
                      KQuestInstanceData[instanceId].Quests and
                      KQuestInstanceData[instanceId].Quests[faction] and
                      KQuestInstanceData[instanceId].Quests[faction][AtlasTW.QCurrentQuest]

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
function KQButton_SetText()
    -- Local AtlasTW for item information
    local itemId, itemName, itemColor, itemTexture
    -- Clear all previous quest information
    AtlasTW.Quest.ClearAll()
    -- Show the finished quest checkbox
    ShowUIPanel(UI.FinishedQuestCheckbox)
    UI.FinishedQuestText:SetText(blue .. AQQuestFinished)

    -- Get quest data from new structure
    local instanceData = KQuestInstanceData[AtlasTW.QCurrentInstance]
    if not instanceData or not instanceData.Quests then
        return
    end

    local faction = AtlasTW.isHorde and "Horde" or "Alliance"
    local questData = instanceData.Quests[faction] and instanceData.Quests[faction][AtlasTW.QCurrentQuest]

    if questData then
        -- Check if quest is in the player's quest log
        kQCompareQuestLogtoQuest(AtlasTW.QCurrentQuest)

        -- Set quest name with appropriate color
        KQuestName:SetText(kQQuestColor..questData.Title)

        -- Set quest level information
        KQuestLevel:SetText(blue..AQDiscription_LEVEL..white..questData.Level)
        KQuestAttainLevel:SetText(blue..AQDiscription_ATTAIN..white..questData.Attain)

        -- Set quest details
        KQuestDetails:SetText(
            blue..AQDiscription_PREQUEST..white..(questData.Prequest or "").."\n \n"..
            blue..AQDiscription_FOLGEQUEST..white..(questData.Folgequest or "").."\n \n"..
            blue..AQDiscription_START..white..(questData.Location or "").."\n \n"..
            blue..AQDiscription_AIM..white..(questData.Aim or "").."\n \n"..
            blue..AQDiscription_NOTE..white..(questData.Note or "")
        )

        -- Set reward text from structure if available
        local rewards = questData.Rewards and questData.Rewards["Text"] or AQNoReward
        KQuestReward:SetText(rewards)
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
                            if not AtlasTW.QuestQuerySpam then
                                DEFAULT_CHAT_FRAME:AddMessage(AQSERVERASK.."["..itemColor..itemName..white.."]"..AQSERVERASKAuto)
                            end
                        end
                    end

                    -- Get item texture and set it
                    _, _, _, _, _, _, _, _, itemTexture = GetItemInfo(itemId)
                    _G["KQuestItemframe"..itemIndex.."_Icon"]:SetTexture(itemTexture)

                    -- Set item name and description
                    _G["KQuestItemframe"..itemIndex.."_Name"]:SetText(kQuestGetItemInf(itemIndex, "name"))
                    _G["KQuestItemframe"..itemIndex.."_Extra"]:SetText(kQuestGetItemInf(itemIndex, "extra"))

                    -- Enable the item button
                    _G["KQuestItemframe"..itemIndex]:Enable()
                else
                    -- Clear and disable item slot if no data
                    _G["KQuestItemframe"..itemIndex.."_Icon"]:SetTexture()
                    _G["KQuestItemframe"..itemIndex.."_Name"]:SetText()
                    _G["KQuestItemframe"..itemIndex.."_Extra"]:SetText()
                    _G["KQuestItemframe"..itemIndex]:Disable()
                end
            end
        else
            -- Disable items frame if no rewards are available
            for itemIndex = 1, AtlasTW.QMAXQUESTITEMS do
                _G["KQuestItemframe"..itemIndex.."_Icon"]:SetTexture()
                _G["KQuestItemframe"..itemIndex.."_Name"]:SetText()
                _G["KQuestItemframe"..itemIndex.."_Extra"]:SetText()
                _G["KQuestItemframe"..itemIndex]:Disable()
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
function KQuestButtonStory_SetText()
    -- Clear display
    AtlasTW.Quest.ClearAll()

    -- Get story information directly from KQuestInstanceData
    local instanceData = KQuestInstanceData[AtlasTW.QCurrentInstance]
    local story = instanceData and instanceData.Story
    local caption = instanceData and instanceData.Caption

    -- Show story text if available
    if story then
        if type(story) == "table" then
            -- Display first page of multi-page story
            KQuestName:SetText(blue .. caption[1])
            KQuestStory:SetText(white .. story["Page1"])

            -- Show navigation buttons if more than one page
            if story["Page2"] then
                ShowUIPanel(UI.NextPageButtonRight)
                AtlasTW.QCurrentPage = 1

                -- Show page counter
                local maxPages = story["MaxPages"] or 0
                for i = 1, 20 do -- Reasonable upper limit
                    if not story["Page" .. i] then
                        maxPages = i - 1
                        break
                    end
                end

                KQuestPageCount:SetText(AtlasTW.QCurrentPage .. "/" .. maxPages)

                -- Set page type
                AtlasTW.Quest.NextPageCount = "Story"
            end
        elseif type(story) == "string" then
            -- Display single page story
            KQuestName:SetText(blue .. caption)
            KQuestStory:SetText(white .. story)
        end
    else
        -- No story available
        KQuestName:SetText(AQNotAvailable)
        KQuestStory:SetText(AQNotAvailable)
    end
end

-----------------------------------------------------------------------------
-- shows the next side
-----------------------------------------------------------------------------
--[[ function KQNextPageR_OnClick()
    local SideAfterThis = AtlasTW.QCurrentPage + 2
    AtlasTW.QCurrentPage = AtlasTW.QCurrentPage + 1
    -- Clear display
    kQuestClearAll()

    -- Handle story text pages
    if AtlasTW.Quest.NextPageCount == "Story" then
        local story = KQuestInstanceData[AtlasTW.QCurrentInstance].Story
        local caption = KQuestInstanceData[AtlasTW.QCurrentInstance].Caption

        if type(story) == "table" then
            -- Display current page content
            KQuestStory:SetText(white..story["Page"..AtlasTW.QCurrentPage])
            KQuestPageCount:SetText(AtlasTW.QCurrentPage.."/"..story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = KQuestInstanceData[AtlasTW.QCurrentInstance].Caption[AtlasTW.QCurrentPage]
            KQuestName:SetText(blue..(pageCaption or caption))

            -- Hide next button if we're on the last page
            if not story["Page"..SideAfterThis] then
                HideUIPanel(UI.NextPageButtonRight)
            else
                ShowUIPanel(UI.NextPageButtonRight)
            end
        end
    end

    -- Handle quest text pages
    if AtlasTW.Quest.NextPageCount == "Quest" then
        local faction = AtlasTW.isHorde and "Horde" or "Alliance"
        local questData = KQuestInstanceData[AtlasTW.QCurrentInstance].Quests[faction][AtlasTW.QCurrentQuest]

        -- Check for Page
        if questData and questData.Page then
            local pageContent = questData.Page[AtlasTW.QCurrentPage]
            local pageCount = questData.Page[1] or 1

            if pageContent then
                KQuestStory:SetText(white..pageContent)
                KQuestPageCount:SetText(AtlasTW.QCurrentPage.."/"..pageCount)

                -- Hide next button if we're on the last page
                if AtlasTW.QCurrentPage >= pageCount then
                    HideUIPanel(UI.NextPageButtonRight)
                else
                    ShowUIPanel(UI.NextPageButtonRight)
                end
            end
        end
    end
    -- Show back button
    ShowUIPanel(UI.NextPageButtonLeft)
end ]]

-----------------------------------------------------------------------------
-- shows the side before this side
-----------------------------------------------------------------------------
--[[ function KQNextPageL_OnClick()
    AtlasTW.QCurrentPage = AtlasTW.QCurrentPage - 1

    -- Handle story text pages
    if AtlasTW.Quest.NextPageCount == "Story" then
        local story = KQuestInstanceData[AtlasTW.QCurrentInstance].Story
        local caption = KQuestInstanceData[AtlasTW.QCurrentInstance].Caption

        if type(story) == "table" then
            -- Display current page content
            KQuestStory:SetText(white..story["Page"..AtlasTW.QCurrentPage])
            KQuestPageCount:SetText(AtlasTW.QCurrentPage.."/"..story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = KQuestInstanceData[AtlasTW.QCurrentInstance].Caption[AtlasTW.QCurrentPage]
            KQuestName:SetText(blue..(pageCaption or caption))

            -- Hide back button if we're on the first page
            if AtlasTW.QCurrentPage == 1 then
                HideUIPanel(UI.NextPageButtonLeft)
            end
        end
    end
    -- Handle quest text pages
    if AtlasTW.Quest.NextPageCount == "Quest" then
        local faction = AtlasTW.isHorde and "Horde" or "Alliance"
        local questData = KQuestInstanceData[AtlasTW.QCurrentInstance].Quests[faction][AtlasTW.QCurrentQuest]
        -- Go back to main quest text if we're returning to page 1
        if AtlasTW.QCurrentPage == 1 then
            KQButton_SetText()
        else
            -- Check for Page
            if questData and questData.Page then
                local pageContent = questData.Page[AtlasTW.QCurrentPage]
                local pageCount = questData.Page[1] or 1
                if pageContent then
                    KQuestStory:SetText(white..pageContent)
                    KQuestPageCount:SetText(AtlasTW.QCurrentPage.."/"..pageCount)
                end
            end
        end
    end
    -- Always show next button when going back
    ShowUIPanel(UI.NextPageButtonRight)
end ]]

-----------------------------------------------------------------------------
-- Checkbox for the finished quest option
-----------------------------------------------------------------------------
--[[ function KQFinishedQuest_OnClick()
    -- Build the quest key based on faction
    local questKey = "KQFinishedQuest_Inst"..AtlasTW.QCurrentInstance.."Quest"..AtlasTW.QCurrentQuest
    questKey = questKey..(AtlasTW.isHorde and "HORDE" or "")
    -- Update quest completion status
    AtlasTW.Q[questKey] = KQuestFinished:GetChecked() and 1 or nil
    -- Save to player options
    AtlasTWCharDB[questKey] = AtlasTW.Q[questKey]
    -- Update UI
    KQuestSetTextandButtons()
    KQButton_SetText()
end ]]

-----------------------------------------------------------------------------
-- Loads the saved AtlasTW
-----------------------------------------------------------------------------
local function kQuest_LoadData()
    AtlasTWCharDB = AtlasTWCharDB or {}
	for i=1, AtlasTW.QMAXINSTANCES do
		for b=1, AtlasTW.QMAXQUESTS do
			AtlasTW.Q["AtlasTWQuestFinishedInst"..i.."Quest"..b] = AtlasTWCharDB["AtlasTWQuestFinishedInst"..i.."Quest"..b]
			AtlasTW.Q["AtlasTWQuestFinishedInst"..i.."Quest"..b.."HORDE"] = AtlasTWCharDB["AtlasTWQuestFinishedInst"..i.."Quest"..b.."HORDE"]
		end
	end
end

-----------------------------------------------------------------------------
-- Called when the player starts the game loads the AtlasTW
-----------------------------------------------------------------------------
function KQuest_OnEvent()
    if type(AtlasTWOptions) == "table" then
        kQuest_LoadData()
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Atlas-TW Quest:|r|cff00ffffAtlasTW not loaded!|r")
    end
    -- Register Tooltip with EquipCompare if enabled.
    if AtlasTWOptions.QuestCompareTooltip then
        AtlasTW.Quest.Tooltip:Register()
    else
        AtlasTW.Quest.Tooltip:Unregister()
    end
end

--******************************************
-- Events: OnUpdate
--******************************************
-----------------------------------------------------------------------------
-- hide panel if instance is 99 (nothing)
-----------------------------------------------------------------------------
function KQuest_Update()
	local previousInstance = AtlasTW.QCurrentInstance
	-- Update instance information
    AtlasTW.QCurrentInstance = AtlasTW.INSTANCEMAP[AtlasTW.CurrentMap] or 99
	-- Check if we need to hide/update the quest panels
	if AtlasTW.QCurrentInstance ~= previousInstance then
		KQuestSetTextandButtons()
	elseif AtlasTW.QCurrentInstance == 99 then
		HideUIPanel(KQuestFrame)
		HideUIPanel(KQuestInsideFrame)
	end
end

-----------------------------------------------------------------------------
-- Set the Buttontext and the buttons if available
-- and check whether its a other inst or not -> works fine
-- added: Check for Questline arrows
-- Questline arrows are shown if InstXQuestYFQuest = "true"
-- QuestStart icon are shown if InstXQuestYPreQuest = "true"
-----------------------------------------------------------------------------
function KQuestSetTextandButtons()
    local isHorde = AtlasTW.isHorde
	local instanceId = AtlasTW.QCurrentInstance
	local faction = isHorde and "Horde" or "Alliance"
	local questName
	local playerLevel = UnitLevel("player")
	-- Hide inner frame if instance changed
	if kQuestInstChanged ~= instanceId then
		HideUIPanel(KQuestInsideFrame)
	end
	-- Update current instance
	kQuestInstChanged = instanceId
	-- Set quest count text
	local questCountKey = isHorde and "QAH" or "QAA"
	local questCount = KQuestInstanceData[instanceId] and KQuestInstanceData[instanceId][questCountKey]
	KQuestCounter:SetText(questCount or "")
	-- Process quests
	for b = 1, AtlasTW.QMAXQUESTS do
		-- Define keys for current faction
	    -- Check for quest existence
        if kQQuestExists(instanceId, b, faction) then
             -- Define keys for current faction (for both formats)
            local finishedKey = "AtlasTWQuestFinishedInst"..instanceId.."Quest"..b..(isHorde and "HORDE" or "")
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
            local arrow = _G["KQuestlineArrow_"..b]
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
			_G["KQuestButton"..b]:Enable()
			_G["KQuestButtonText"..b]:SetText(kQQuestColor..questName)
	    else
			-- Deactivate button if quest doesn't exist
			_G["KQuestButton"..b]:Disable()
			_G["KQuestButtonText"..b]:SetText()
            -- Hide arrow
            _G["KQuestlineArrow_"..b]:Hide()
		end
	end
end
--[[ 
-----------------------------------------------------------------------------
-- Ask Server right-click
-- + shift click to send link
-- + ctrl click for dressroom
-----------------------------------------------------------------------------
function KQuestItem_OnClick(mouseButton)
    -- Get the frame that triggered this event
    local frame = this
    if not frame or not frame:GetName() then
        return
    end

    -- Extract item index from frame name (e.g., "KQuestItemframe1" -> 1)
    local frameName = frame:GetName()

    -- For names like "KQuestItemframe1", "KQuestItemframe2" etc.
    local itemIndex = tonumber(strsub(frameName, -1))

    if not itemIndex then
        return
    end

    -- Get current quest data
    local instanceId = AtlasTW.QCurrentInstance
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"

    -- Get quest data from new database structure
    local questData = KQuestInstanceData and
                      KQuestInstanceData[instanceId] and
                      KQuestInstanceData[instanceId].Quests and
                      KQuestInstanceData[instanceId].Quests[faction] and
                      KQuestInstanceData[instanceId].Quests[faction][AtlasTW.QCurrentQuest]

    if not questData or not questData.Rewards then
        return
    end

    -- Get the specific reward item by index
    local rewardItem = questData.Rewards[itemIndex]
    if not rewardItem then
        return
    end

    -- Extract item data
    local itemId = rewardItem.ID
    local itemName = rewardItem.Name
    local itemColor = rewardItem.Color or white

    -- Handle right click - show tooltip
    if mouseButton == "RightButton" then
        AtlasTW.Quest.Tooltip:SetOwner(frame, "ANCHOR_RIGHT", -(frame:GetWidth() / 2), 24)
        AtlasTW.Quest.Tooltip:SetHyperlink(string.format("item:%d:0:0:0", itemId))
        AtlasTW.Quest.Tooltip:Show()
        if not AtlasTWOptions.QuestQuerySpam then
            DEFAULT_CHAT_FRAME:AddMessage(string.format("%s[%s%s%s]%s",
                AQSERVERASK, itemColor, itemName, white, AQSERVERASKInformation))
        end
        return
    end
    -- Handle shift click - insert item link
    if IsShiftKeyDown() then
        itemName, _, itemQuality = GetItemInfo(itemId)
        if itemName then
            local _, _, _, hex = GetItemQualityColor(itemQuality)
            local itemLink = string.format("%s|Hitem:%d:0:0:0|h[%s]|h|r",
                hex, itemId, itemName)
            ChatFrameEditBox:Insert(itemLink)
        else
            DEFAULT_CHAT_FRAME:AddMessage("Item unsafe! Right click to get the item ID")
            ChatFrameEditBox:Insert(string.format("[%s]", rewardItem.Name))
        end
        return
    end
    -- Handle control click - dress up item
    if IsControlKeyDown() and GetItemInfo(itemId) then
        DressUpItemLink(itemId)
    end
end ]]

-- Initialize AtlasTW and frames on addon load
CreateKQuestFrame()
-- Show version message
DEFAULT_CHAT_FRAME:AddMessage(red.."A"..yellow.."t"..green.."l"..orange.."a"..blue.."s"..white.."-|cff800080TW |cff00FFFFv.|cffFFC0CB"..AtlasTW.Version.." |cffA52A2Aloaded.")