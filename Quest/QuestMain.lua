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

-----------------------------------------------------------------------------
-- Variables
-----------------------------------------------------------------------------
local kQQuestColor
local variables = AtlasKTW
local kQuestNextPageCount
local kQuestInstChanged
local playerName = UnitName("player")
local kQuestInstanceData = KQuestInstanceData


-----------------------------------------------------------------------------
-- Buttons
-----------------------------------------------------------------------------
local function kQuestClearAll()
	KQuestPageCount:SetText()
	HideUIPanel(KQNextPageButton_Right)
	HideUIPanel(KQNextPageButton_Left)
	KQuestName:SetText()
	KQuestLevel:SetText()
	KQuestDetails:SetText()
	KQuestAttainLevel:SetText()
	KQuestReward:SetText()
	KQuestStory:SetText()
	KQuestFinishedText:SetText()
    HideUIPanel(KQuestFinished)
	for b=1, variables.QMAXQUESTITEMS do
		_G["KQuestItemframe"..b.."_Icon"]:SetTexture()
		_G["KQuestItemframe"..b.."_Name"]:SetText()
		_G["KQuestItemframe"..b.."_Extra"]:SetText()
		_G["KQuestItemframe"..b]:Disable()
	end
end

-----------------------------------------------------------------------------
-- upper right button / to show/close panel
-----------------------------------------------------------------------------
function KQuestCLOSE_OnClick()
	if KQuestFrame:IsVisible() then
		HideUIPanel(KQuestFrame)
		HideUIPanel(KQuestInsideFrame)
	else
		ShowUIPanel(KQuestFrame)
	end
	variables.QUpdateNow = true
end

-----------------------------------------------------------------------------
-- inside button to close the quest display
-----------------------------------------------------------------------------
function KQuestCLOSE2_OnClick()
	HideUIPanel(KQuestInsideFrame)
	variables.QCurrentButton = 0
end

-----------------------------------------------------------------------------
-- Hide the AtlasLoot Frame if available
-----------------------------------------------------------------------------
function KQuestHideAL()
	if AtlasLootItemsFrame ~= nil then
		AtlasLootItemsFrame:Hide() -- hide atlasloot
	end
end

-- Function to get quest data from the new format
-----------------------------------------------------------------------------
local function kQGetQuestData(instanceId, questId, faction, field)
    -- Default to current instance and quest if not provided
    instanceId = instanceId or variables.QCurrentInstance
    questId = questId or variables.QCurrentQuest
    faction = faction or (variables.isHorde and "Horde" or "Alliance")

    -- Ensure kQuestInstanceData is available
    if not kQuestInstanceData or not kQuestInstanceData[instanceId] or
       not kQuestInstanceData[instanceId].Quests or
       not kQuestInstanceData[instanceId].Quests[faction] or
       (questId and not kQuestInstanceData[instanceId].Quests[faction][questId]) then
        return nil
    end

    if (field or "Title") then
        return kQuestInstanceData[instanceId].Quests[faction][questId][field]
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
    instanceId = instanceId or variables.QCurrentInstance
    faction = faction or (variables.isHorde and "Horde" or "Alliance")

    -- Check if quest exists in the new format
    return kQuestInstanceData and
           kQuestInstanceData[instanceId] and
           kQuestInstanceData[instanceId].Quests and
           kQuestInstanceData[instanceId].Quests[faction] and
           kQuestInstanceData[instanceId].Quests[faction][questId] ~= nil
end

-- Check if a quest exists in the player's quest log and set appropriate color
-- Returns true if quest is found in quest log, false otherwise
local function kQCompareQuestLogtoQuest(questId)
    -- Early return if quest log checking is disabled
    if not variables.QCheckQuestlog then
        return false
    end

    -- Use current shown quest if no specific quest ID provided
    local targetQuest = questId or variables.QCurrentQuest

    -- Get quest data from new structure
    local instanceData = kQuestInstanceData[variables.QCurrentInstance]
    if not instanceData or not instanceData.Quests then
        return false
    end

    local faction = variables.isHorde and "Horde" or "Alliance"
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
	local questKey = "KQFinishedQuest_Inst"..variables.QCurrentInstance.."Quest"..variables.QCurrentQuest
	questKey = questKey..(variables.isHorde and "HORDE" or "")
	KQuestFinished:SetChecked(variables.Q[questKey] == 1)
end

-----------------------------------------------------------------------------
-- Allow pages
-- In the new format, we need to implement proper handling of multi-page quests
-- HideUIPanel(KQNextPageButton_Left) KQuestPageCount:SetText()
-----------------------------------------------------------------------------
local function kQuestExtendedPages()
    -- Determine current faction
    local faction = variables.isHorde and "Horde" or "Alliance"
    local questId = variables.QCurrentQuest
    local instanceId = variables.QCurrentInstance

    -- In the new format, check if the quest has Pages data
    local questData = kQuestInstanceData and
        kQuestInstanceData[instanceId] and
        kQuestInstanceData[instanceId].Quests and
        kQuestInstanceData[instanceId].Quests[faction] and
        kQuestInstanceData[instanceId].Quests[faction][questId]

    -- If we have quest data and it has Pages
    if questData and questData.Page and type(questData.Page) == "table" then
        local pageCount = questData.Page[1] -- Первый элемент содержит количество страниц

        if pageCount and pageCount > 1 then
            -- Show the navigation button for additional pages
            ShowUIPanel(KQNextPageButton_Right)
            -- Set the current page type to "Quest" for proper navigation handling
            kQuestNextPageCount = "Quest"
            -- Initialize to the first page
            variables.QCurrentPage = 1
            -- Update the page counter display with current/total format
            KQuestPageCount:SetText(variables.QCurrentPage .. "/" .. pageCount)
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
    -- Local variables
    local instanceId = variables.QCurrentInstance
    local faction = variables.isHorde and "Horde" or "Alliance"

    -- Validate input parameters
    if not count or count < 1 then
        return nil
    end

    -- Get quest data from new database structure
    local questData = kQuestInstanceData and
                      kQuestInstanceData[instanceId] and
                      kQuestInstanceData[instanceId].Quests and
                      kQuestInstanceData[instanceId].Quests[faction] and
                      kQuestInstanceData[instanceId].Quests[faction][variables.QCurrentQuest]

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
    -- Local variables for item information
    local itemId, itemName, itemColor, itemTexture
    -- Clear all previous quest information
    kQuestClearAll()
    -- Show the finished quest checkbox
    ShowUIPanel(KQuestFinished)
    KQuestFinishedText:SetText(blue .. AQQuestFinished)

    -- Get quest data from new structure
    local instanceData = kQuestInstanceData[variables.QCurrentInstance]
    if not instanceData or not instanceData.Quests then
        return
    end

    local faction = variables.isHorde and "Horde" or "Alliance"
    local questData = instanceData.Quests[faction] and instanceData.Quests[faction][variables.QCurrentQuest]

    if questData then
        -- Check if quest is in the player's quest log
        kQCompareQuestLogtoQuest(variables.QCurrentQuest)

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
            for itemIndex = 1, variables.QMAXQUESTITEMS do
                if questData.Rewards[itemIndex] then
                    itemId = getRewardItemData(questData,itemIndex,"ID") or ""
                    -- Handle auto-query functionality if enabled
                    if variables.QAutoQuery then
                        itemColor = getRewardItemData(questData,itemIndex,"Color") or ""
                        itemName = getRewardItemData(questData,itemIndex,"Name") or ""
                        -- Query server for item data if not in cache
                        if not GetItemInfo(itemId) then
                            GameTooltip:SetHyperlink("item:"..itemId..":0:0:0")
                            if not variables.QQuerySpam then
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
            for itemIndex = 1, variables.QMAXQUESTITEMS do
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
    kQuestClearAll()

    -- Get story information directly from kQuestInstanceData
    local instanceData = kQuestInstanceData[variables.QCurrentInstance]
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
                ShowUIPanel(KQNextPageButton_Right)
                variables.QCurrentPage = 1

                -- Show page counter
                local maxPages = story["MaxPages"] or 0
                for i = 1, 20 do -- Reasonable upper limit
                    if not story["Page" .. i] then
                        maxPages = i - 1
                        break
                    end
                end

                KQuestPageCount:SetText(variables.QCurrentPage .. "/" .. maxPages)

                -- Set page type
                kQuestNextPageCount = "Story"
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
function KQNextPageR_OnClick()
    local SideAfterThis = variables.QCurrentPage + 2
    variables.QCurrentPage = variables.QCurrentPage + 1
    -- Clear display
    kQuestClearAll()

    -- Handle story text pages
    if kQuestNextPageCount == "Story" then
        local story = kQuestInstanceData[variables.QCurrentInstance].Story
        local caption = kQuestInstanceData[variables.QCurrentInstance].Caption

        if type(story) == "table" then
            -- Display current page content
            KQuestStory:SetText(white..story["Page"..variables.QCurrentPage])
            KQuestPageCount:SetText(variables.QCurrentPage.."/"..story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = kQuestInstanceData[variables.QCurrentInstance].Caption[variables.QCurrentPage]
            KQuestName:SetText(blue..(pageCaption or caption))

            -- Hide next button if we're on the last page
            if not story["Page"..SideAfterThis] then
                HideUIPanel(KQNextPageButton_Right)
            else
                ShowUIPanel(KQNextPageButton_Right)
            end
        end
    end

    -- Handle quest text pages
    if kQuestNextPageCount == "Quest" then
        local faction = variables.isHorde and "Horde" or "Alliance"
        local questData = kQuestInstanceData[variables.QCurrentInstance].Quests[faction][variables.QCurrentQuest]

        -- Check for Page
        if questData and questData.Page then
            local pageContent = questData.Page[variables.QCurrentPage]
            local pageCount = questData.Page[1] or 1

            if pageContent then
                KQuestStory:SetText(white..pageContent)
                KQuestPageCount:SetText(variables.QCurrentPage.."/"..pageCount)

                -- Hide next button if we're on the last page
                if variables.QCurrentPage >= pageCount then
                    HideUIPanel(KQNextPageButton_Right)
                else
                    ShowUIPanel(KQNextPageButton_Right)
                end
            end
        end
    end
    -- Show back button
    ShowUIPanel(KQNextPageButton_Left)
end

-----------------------------------------------------------------------------
-- shows the side before this side
-----------------------------------------------------------------------------
function KQNextPageL_OnClick()
    variables.QCurrentPage = variables.QCurrentPage - 1

    -- Handle story text pages
    if kQuestNextPageCount == "Story" then
        local story = kQuestInstanceData[variables.QCurrentInstance].Story
        local caption = kQuestInstanceData[variables.QCurrentInstance].Caption

        if type(story) == "table" then
            -- Display current page content
            KQuestStory:SetText(white..story["Page"..variables.QCurrentPage])
            KQuestPageCount:SetText(variables.QCurrentPage.."/"..story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = kQuestInstanceData[variables.QCurrentInstance].Caption[variables.QCurrentPage]
            KQuestName:SetText(blue..(pageCaption or caption))

            -- Hide back button if we're on the first page
            if variables.QCurrentPage == 1 then
                HideUIPanel(KQNextPageButton_Left)
            end
        end
    end
    -- Handle quest text pages
    if kQuestNextPageCount == "Quest" then
        local faction = variables.isHorde and "Horde" or "Alliance"
        local questData = kQuestInstanceData[variables.QCurrentInstance].Quests[faction][variables.QCurrentQuest]
        -- Go back to main quest text if we're returning to page 1
        if variables.QCurrentPage == 1 then
            KQButton_SetText()
        else
            -- Check for Page
            if questData and questData.Page then
                local pageContent = questData.Page[variables.QCurrentPage]
                local pageCount = questData.Page[1] or 1
                if pageContent then
                    KQuestStory:SetText(white..pageContent)
                    KQuestPageCount:SetText(variables.QCurrentPage.."/"..pageCount)
                end
            end
        end
    end
    -- Always show next button when going back
    ShowUIPanel(KQNextPageButton_Right)
end

-----------------------------------------------------------------------------
-- Checkbox for the finished quest option
-----------------------------------------------------------------------------
function KQFinishedQuest_OnClick()
    -- Build the quest key based on faction
    local questKey = "KQFinishedQuest_Inst"..variables.QCurrentInstance.."Quest"..variables.QCurrentQuest
    questKey = questKey..(variables.isHorde and "HORDE" or "")
    -- Update quest completion status
    variables.Q[questKey] = KQuestFinished:GetChecked() and 1 or nil
    -- Save to player options
    KQuest_Options[UnitName("player")][questKey] = variables.Q[questKey]
    -- Update UI
    KQuestSetTextandButtons()
    KQButton_SetText()
end

-----------------------------------------------------------------------------
-- Loads the saved variables
-----------------------------------------------------------------------------
local function kQuest_LoadData()
	variables.QCurrentSide = AtlasTWOptions["QuestShownSide"]
	variables.QWithAtlas = AtlasTWOptions["QuestWithAtlas"]
	variables.QColourCheck = AtlasTWOptions["QuestColourCheck"]
	KQuest_Options = KQuest_Options or {}
	KQuest_Options[playerName] = KQuest_Options[playerName] or {}
	for i=1, variables.QMAXINSTANCES do
		for b=1, variables.QMAXQUESTS do
			variables.Q["KQFinishedQuest_Inst"..i.."Quest"..b] = KQuest_Options[playerName]["KQFinishedQuest_Inst"..i.."Quest"..b]
			variables.Q["KQFinishedQuest_Inst"..i.."Quest"..b.."HORDE"] = KQuest_Options[playerName]["KQFinishedQuest_Inst"..i.."Quest"..b.."HORDE"]
		end
	end
	variables.QCheckQuestlog = AtlasTWOptions["QuestCheckQuestlog"]
	variables.QAutoQuery = AtlasTWOptions["QuestAutoQuery"]
	variables.QQuerySpam = AtlasTWOptions["QuestQuerySpam"]
	variables.QCompareTooltip = AtlasTWOptions["QuestCompareTooltip"]
    variables.QLoaded = true
end

--******************************************
-- Events: OnEvent
--******************************************
-----------------------------------------------------------------------------
-- Detects whether the variables have to be loaded
-- or reestablishes them
-----------------------------------------------------------------------------
local function kQuest_Initialize()
	if not (variables.QLoaded or VariablesLoaded) then
		return
	end
	if type(AtlasTWOptions) == "table" then
		kQuest_LoadData()
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Atlas-TW Quest:|r|cff00ffffVariables not loaded!|r")
	end
	-- Register Tooltip with EquipCompare if enabled.
	if variables.QCompareTooltip then
		KQuestRegisterTooltip()
	else
		KQuestUnRegisterTooltip()
	end
end

-----------------------------------------------------------------------------
-- Called when the player starts the game loads the variables
-----------------------------------------------------------------------------
function KQuest_OnEvent()
    if event == "VARIABLES_LOADED" then
        VariablesLoaded = 1 -- data is loaded completely
    else
        kQuest_Initialize() -- player enters world / initialize the data
    end
end

-----------------------------------------------------------------------------
-- Saves the variables
-----------------------------------------------------------------------------
function KQuest_SaveData()
	-- Save the variables
	AtlasTWOptions["QuestShownSide"] = variables.QCurrentSide
	AtlasTWOptions["QuestWithAtlas"] = variables.QWithAtlas
	AtlasTWOptions["QuestColourCheck"] = variables.QColourCheck
	AtlasTWOptions["QuestCheckQuestlog"] = variables.QCheckQuestlog
	AtlasTWOptions["QuestAutoQuery"] = variables.QAutoQuery
	AtlasTWOptions["QuestQuerySpam"] = variables.QQuerySpam
	AtlasTWOptions["QuestCompareTooltip"] = variables.QCompareTooltip
end

--******************************************
-- Events: OnLoad
--******************************************

-----------------------------------------------------------------------------
-- Call OnLoad set Variables and hides the panel
-----------------------------------------------------------------------------
local function kQuest_OnLoad()
	variables.CurrentMap = AtlasMap:GetTexture()
	variables.QUpdateNow = true
end

--******************************************
-- Events: OnUpdate
--******************************************
-----------------------------------------------------------------------------
-- hide panel if instance is 99 (nothing)
-----------------------------------------------------------------------------
function KQuest_OnUpdate()
	local previousInstance = variables.QCurrentInstance
	-- Update instance information
	KQuest_Instances()
	-- Cache UI panels for better performance
	local questFrame = KQuestFrame
	local insideFrame = KQuestInsideFrame
	-- Check if we need to hide/update the quest panels
	if variables.QCurrentInstance ~= previousInstance or variables.QUpdateNow then
		-- Update quest text and buttons if instance changed or update forced
		KQuestSetTextandButtons()
		variables.QUpdateNow = false
	elseif variables.QCurrentInstance == 99 then
		-- Hide both panels if no quests available
		HideUIPanel(questFrame)
		HideUIPanel(insideFrame)
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
    local isHorde = variables.isHorde
	local instanceId = variables.QCurrentInstance
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
	local questCount = kQuestInstanceData[instanceId] and kQuestInstanceData[instanceId][questCountKey]
	KQuestCounter:SetText(questCount or "")
	-- Process quests
	for b = 1, variables.QMAXQUESTS do
		-- Define keys for current faction
	    -- Check for quest existence
        if kQQuestExists(instanceId, b, faction) then
             -- Define keys for current faction (for both formats)
            local finishedKey = "KQFinishedQuest_Inst"..instanceId.."Quest"..b..(isHorde and "HORDE" or "")
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
            if variables.Q[finishedKey] == 1 then
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
                if not variables.QColourCheck then
                    kQQuestColor = yellow
                end
                if questLevel == 100 or kQCompareQuestLogtoQuest(b) then
                    kQQuestColor = blue
                end
                if variables.Q[finishedKey] == 1 then
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

-- Events: HookScript (function)
local function hookScript(frame, scriptType, handler)
    -- Store original script handler
    local originalScript = frame:GetScript(scriptType)
    -- Set new script that chains both handlers
    frame:SetScript(scriptType, function()
        -- Call original handler if it exists
        if originalScript then
            originalScript()
        end
        -- Call our new handler
        handler()
    end)
end

--******************************************
-- Events: Atlas_OnShow (Hook Atlas function)
--******************************************
-----------------------------------------------------------------------------
-- Shows the panel with atlas
-- function hooked now! thx dan for his help
-----------------------------------------------------------------------------
local original_Atlas_OnShow = Atlas_OnShow
function Atlas_OnShow()
    -- Handle quest frame visibility based on settings
    local function handleQuestFrameVisibility()
        if variables.QWithAtlas then
            ShowUIPanel(KQuestFrame)
        else
            HideUIPanel(KQuestFrame)
        end
        HideUIPanel(KQuestInsideFrame)
    end
    -- Position quest frame if shown on right side
    local function positionQuestFrame()
        if variables.QCurrentSide == "Right" then
            KQuestFrame:ClearAllPoints()
            KQuestFrame:SetPoint("TOP", "AtlasFrame", 567, -36)
        end
    end
    -- Setup pfUI tooltip integration if enabled
    local function setupPfUITooltip()
        if not (variables.QCompareTooltip and IsAddOnLoaded("pfUI") and not KQuestTooltip.backdrop) then
            return
        end
        -- Create pfUI tooltip backdrop
        pfUI.api.CreateBackdrop(KQuestTooltip)
        pfUI.api.CreateBackdropShadow(KQuestTooltip)
        -- Setup equipment comparison if available
        if pfUI.eqcompare then
            hookScript(KQuestTooltip, "OnShow", pfUI.eqcompare.GameTooltipShow)
            hookScript(KQuestTooltip, "OnHide", function()
                ShoppingTooltip1:Hide()
                ShoppingTooltip2:Hide()
            end)
        end
    end

    -- Execute all setup functions
    handleQuestFrameVisibility()
    positionQuestFrame()
    setupPfUITooltip()

    -- Call original show handler
    original_Atlas_OnShow()
end

--******************************************
-- Events: OnEnter/OnLeave SHOW ITEM
--******************************************
-----------------------------------------------------------------------------
-- Hide Tooltip
-----------------------------------------------------------------------------
function KQuestItem_OnLeave()
    -- Hide all tooltips when mouse leaves item
    local tooltips = {GameTooltip, KQuestTooltip}
    local shoppingTooltips = {ShoppingTooltip1, ShoppingTooltip2}
    -- Hide main tooltips if visible
    for _, tooltip in ipairs(tooltips) do
        if tooltip:IsVisible() then
            tooltip:Hide()
            -- Also hide shopping tooltips
            for _, shoppingTip in ipairs(shoppingTooltips) do
                if shoppingTip:IsVisible() then
                    shoppingTip:Hide()
                end
            end
        end
    end
end

-----------------------------------------------------------------------------
-- Show Tooltip and automatically query server if option is enabled
-----------------------------------------------------------------------------
function KQuestItem_OnEnter()
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
    local instanceId = variables.QCurrentInstance
    local faction = variables.isHorde and "Horde" or "Alliance"

    -- Get quest data from new database structure
    local questData = kQuestInstanceData and
                      kQuestInstanceData[instanceId] and
                      kQuestInstanceData[instanceId].Quests and
                      kQuestInstanceData[instanceId].Quests[faction] and
                      kQuestInstanceData[instanceId].Quests[faction][variables.QCurrentQuest]

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
    local itemDescription = rewardItem.Description

    -- Set up tooltip
    KQuestTooltip:SetOwner(frame, "ANCHOR_RIGHT")
    KQuestTooltip:ClearLines()

    -- Try to get item info from game cache first
    if itemId and GetItemInfo(itemId) then
        -- Use game's tooltip if item is in cache
        KQuestTooltip:SetHyperlink("item:" .. itemId)
    else
        -- Fallback to manual tooltip creation
        -- Set item name with color
        local displayName = itemColor .. (itemName or "Unknown Item")
        KQuestTooltip:AddLine(displayName, 1, 1, 1)

        -- Add description if available
        if itemDescription and itemDescription ~= "" then
            KQuestTooltip:AddLine(itemDescription, 0.8, 0.8, 0.8, 1)
        end

        -- Add error message if we have ID but can't load item
        if itemId then
            KQuestTooltip:AddLine(red .. (AQERRORNOTSHOWN or "Item not found in cache"), 1, 0, 0)
            KQuestTooltip:AddLine(AQERRORASKSERVER)
        end
    end

    -- Show the tooltip
    KQuestTooltip:Show()

end

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
    local instanceId = variables.QCurrentInstance
    local faction = variables.isHorde and "Horde" or "Alliance"

    -- Get quest data from new database structure
    local questData = kQuestInstanceData and
                      kQuestInstanceData[instanceId] and
                      kQuestInstanceData[instanceId].Quests and
                      kQuestInstanceData[instanceId].Quests[faction] and
                      kQuestInstanceData[instanceId].Quests[faction][variables.QCurrentQuest]

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
        KQuestTooltip:SetOwner(frame, "ANCHOR_RIGHT", -(frame:GetWidth() / 2), 24)
        KQuestTooltip:SetHyperlink(string.format("item:%d:0:0:0", itemId))
        KQuestTooltip:Show()
        if not variables.QQuerySpam then
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
end

-- Initialize variables and frames on addon load
kQuest_OnLoad()
CreateKQuestFrame()
-- Show version message
DEFAULT_CHAT_FRAME:AddMessage(red.."A"..yellow.."t"..green.."l"..orange.."a"..blue.."s"..white.."-|cff800080TW |cff00FFFFv.|cffFFC0CB"..ATLASTW_VERSION.." |cffA52A2Aloaded.")