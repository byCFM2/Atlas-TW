---
--- QuestLogic.lua - Atlas quest logic and event handling
---
--- This file contains the quest logic and event handling for Atlas-TW.
--- It handles quest item interactions, tooltip management, quest reward display,
--- and provides the core logic for quest-related UI interactions.
---
--- Features:
--- - Quest item event handling
--- - Tooltip management for quest items
--- - Quest reward display logic
--- - Mouse interaction handling
--- - Quest data processing
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()

local LU = AtlasTW.Localization.UI

AtlasTW = _G.AtlasTW
local Colors = AtlasTW.Colors


---
--- Handles mouse enter event for quest reward items
--- Displays detailed tooltip information when the mouse enters a quest reward item
--- @param itemIndex number Index of the reward item (1-6)
--- @return nil
--- @usage Called automatically on mouse enter event
---
function AtlasTW.Quest.OnItemEnter(itemIndex)
    if not itemIndex then
        return PrintA("AtlasTW.Quest.OnItemEnter failed itemIndex!")
    end
    local frame = this
    -- Get the frame that triggered this event
    if not frame then
        return PrintA("AtlasTW.Quest.OnItemEnter failed frame and name!")
    end
    -- Get current quest data
    local instance = AtlasTW.QCurrentInstance
    local faction = AtlasTW.Faction

    -- Get quest data from new database structure
    local questData = AtlasTW.Quest.DataBase and
        AtlasTW.Quest.DataBase[instance] and
        AtlasTW.Quest.DataBase[instance][faction] and
        AtlasTW.Quest.DataBase[instance][faction][AtlasTW.QCurrentQuest]

    if not questData or not questData.Rewards then
        return
    end

    -- Get the specific reward item by index
    local rewardItem = questData.Rewards[itemIndex]
    if not rewardItem then
        return
    end

    -- Extract item data
    local itemId = rewardItem.id

    -- Set up tooltip
    GameTooltip:SetOwner(frame, "ANCHOR_RIGHT", -(frame:GetWidth() / 2), 24)
    GameTooltip:SetHyperlink("item:" .. itemId .. ":0:0:0")
    GameTooltip:Show()
end

---
--- Handles mouse leave event for quest reward items
--- Hides the tooltip when the mouse leaves a quest reward item
--- @return nil
--- @usage Called automatically on mouse leave event
---
function AtlasTW.Quest.OnItemLeave()
    GameTooltip:Hide()
end

---
--- Handles mouse click events on quest reward items
--- Processes clicks on quest reward items for various actions like linking to chat
--- @param mouseButton string Mouse button pressed ("LeftButton", "RightButton")
--- @param itemIndex number Index of the clicked reward item (1-6)
--- @return nil
--- @usage Called automatically on item click event
---
function AtlasTW.Quest.OnItemClick(mouseButton, itemIndex)
    if not itemIndex then
        return PrintA("AtlasTW.Quest.OnItemClick failed itemIndex!")
    end
    local frame = this
    if not frame then
        return PrintA("AtlasTW.Quest.OnItemClick failed frame or name!")
    end
    -- Get current quest data
    local instance = AtlasTW.QCurrentInstance
    local faction = AtlasTW.Faction

    -- Get quest data from new database structure
    local questData = AtlasTW.Quest.DataBase and
        AtlasTW.Quest.DataBase[instance] and
        AtlasTW.Quest.DataBase[instance][faction] and
        AtlasTW.Quest.DataBase[instance][faction][AtlasTW.QCurrentQuest]

    if questData and not questData.Rewards then
        return
    end

    -- Get the specific reward item by index
    local rewardItem = questData.Rewards[itemIndex]
    if not rewardItem then
        return
    end

    -- Extract item data
    local itemId = rewardItem.id

    -- Handle right click - search in pfQuest
    if mouseButton == "RightButton" and not IsShiftKeyDown() and not IsControlKeyDown() then
        local itemName = GetItemInfo(itemId)
        if itemName then
            AtlasTW.Integrations.SearchPfQuest(itemName)
        end
        return
    end

    -- Handle shift click - insert item link
    if IsShiftKeyDown() then
        local itemName, _, itemQuality = GetItemInfo(itemId)
        if itemName then
            local _, _, _, hex = GetItemQualityColor(itemQuality)
            local itemLink = string.format("%s|Hitem:%d:0:0:0|h[%s]|h|r",
                hex, itemId, itemName)
            if WIM_EditBoxInFocus then
                WIM_EditBoxInFocus:Insert(itemLink)
            else
                ChatFrameEditBox:Insert(itemLink)
            end
        else
            ChatFrameEditBox:Insert(string.format("%s [%s]", Colors.GREY2, LU["Item not found in cache"]))
        end
        return
    end
    -- Handle control click - dress up item
    if IsControlKeyDown() and GetItemInfo(itemId) then
        DressUpItemLink(itemId)
        return
    end
end

---
--- Closes the quest details frame
--- Hides the quest information display and resets current button state
--- @return nil
--- @usage Called when closing quest details
---
function AtlasTW.Quest.CloseDetails()
    AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    AtlasTW.QCurrentButton = 0
    AtlasTW.Quest.ClearAll()
end

---
--- Inserts a quest link into the chat frame
--- Creates a clickable quest link for sharing with other players
--- @return nil
--- @usage Called internally when Shift+clicking quest buttons
---
local function atlasTWQuestInsertQuestLink()
    local questID = AtlasTW.QCurrentQuest
    local instance = AtlasTW.QCurrentInstance
    local faction = AtlasTW.Faction

    local questData = AtlasTW.Quest.DataBase and
        AtlasTW.Quest.DataBase[instance] and
        AtlasTW.Quest.DataBase[instance][faction] and
        AtlasTW.Quest.DataBase[instance][faction][questID]

    if questData and questData.Title then
        local questName = questData.Title
        --        local levelPattern = "^%d+%) "
        --        questName = string.gsub(questName, levelPattern, "")
        if pfQuestCompat then
            pfQuestCompat.InsertQuestLink(0, questName)
        else
            ChatFrameEditBox:Insert("[" .. questName .. "]")
        end
    end
end


---
--- Hides the highlight textures and unlocks the highlight for all quest buttons.
---
--- @return nil
--- @usage Called internally by other quest logic functions to reset button states.
---
function AtlasTW.Quest.HideQuestButtonHighlights()
    for i = 1, AtlasTW.QMAXQUESTS do
        local b = AtlasTW.Quest.UI_Main.QuestButtons[i].Button
        --local h = b:GetHighlightTexture()
        --h:Hide()
        b:UnlockHighlight()
    end
end

---
--- Handles click events on quest buttons
--- Toggles quest details display or inserts quest link to chat if Shift is held
--- @param questIndex number Index of the clicked quest button
--- @return nil
--- @usage Called automatically when quest button is clicked
---
function AtlasTW.Quest.OnQuestClick(questIndex, button)
    if not questIndex then return PrintA("AtlasTW.Quest.OnQuestClick without questIndex.") end
    AtlasTW.QCurrentQuest = questIndex
    if not AtlasTW.Quest.UI or not AtlasTW.Quest.UI.InsideAtlasFrame then
        return PrintA("AtlasTW.Quest.OnQuestClick: Quest UI not fully loaded.")
    end

    -- Handle Right Click - Show in pfQuest
    if button == "RightButton" then
        local questData = AtlasTW.Quest.DataBase and
            AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance] and
            AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance][AtlasTW.Faction] and
            AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance][AtlasTW.Faction][questIndex]

        if questData and questData.Title then
            AtlasTW.Integrations.ShowQuestInPfQuest(questData.Title)
        end
        return
    end

    if ChatFrameEditBox:IsVisible() and IsShiftKeyDown() then
        atlasTWQuestInsertQuestLink()
    else
        AtlasTW.Quest.HideAtlasTWLootFrame()
        AtlasTW.Quest.UI.Story:SetText("")
        local button = AtlasTW.Quest.UI_Main.QuestButtons[questIndex].Button
        local highlightTexture = button:GetHighlightTexture()
        AtlasTW.Quest.HideQuestButtonHighlights()
        if AtlasTW.Quest.UI.InsideAtlasFrame:IsVisible() and AtlasTW.QCurrentButton == AtlasTW.QCurrentQuest then
            AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
            AtlasTW.QCurrentButton = nil
        else
            AtlasTW.Quest.UI.InsideAtlasFrame:Show()
            AtlasTW.QCurrentButton = AtlasTW.QCurrentQuest
            AtlasTW.Quest.SetQuestText()
            highlightTexture:Show()
            button:LockHighlight()
        end
    end
end

---
--- Toggles the finished status of the current quest
--- Updates quest completion state and saves it to character database
--- @return nil
--- @usage Called when finished quest checkbox is clicked
---
function AtlasTW.Quest.ToggleFinishedFilter()
    -- Build the quest key based on faction
    local questKey = "Completed_" .. AtlasTW.QCurrentInstance .. "_Quest_" .. AtlasTW.QCurrentQuest
    questKey = questKey .. (AtlasTW.isHorde and "_Horde" or "_Alliance")
    -- Update quest completion status
    AtlasTW.Q[questKey] = AtlasTW.Quest.UI.FinishedQuestCheckbox:GetChecked() and 1 or nil
    -- Save to player options
    AtlasTWCharDB[questKey] = AtlasTW.Q[questKey]
    -- Update UI
    AtlasTW.Quest.SetQuestButtons()
    AtlasTW.Quest.SetQuestText()
end

---
--- Advances to the next page of quest or story content
--- Handles both story pages and multi-page quest descriptions
--- @return nil
--- @usage Called when next page button is clicked
---
function AtlasTW.Quest.NextPage()
    local SideAfterThis = AtlasTW.QCurrentPage + 2
    AtlasTW.QCurrentPage = AtlasTW.QCurrentPage + 1

    -- Clear display
    AtlasTW.Quest.ClearAll()

    -- Handle story text pages
    if AtlasTW.Quest.NextPageCount == "Story" then
        local story = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Story
        local caption = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Caption

        if type(story) == "table" then
            -- Display current page content
            AtlasTW.Quest.UI.Story:SetText(Colors.WHITE .. story["Page" .. AtlasTW.QCurrentPage])
            AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage .. "/" .. story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Caption[AtlasTW.QCurrentPage]
            AtlasTW.Quest.UI.QuestName:SetText(Colors.BLUE .. (pageCaption or caption))

            -- Hide next button if we're on the last page
            if not story["Page" .. SideAfterThis] then
                AtlasTW.Quest.UI.NextPageButtonRight:Hide()
            else
                AtlasTW.Quest.UI.NextPageButtonRight:Show()
            end
        end
    end

    -- Handle quest text pages
    if AtlasTW.Quest.NextPageCount == "Quest" then
        local faction = AtlasTW.Faction
        local questData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance][faction][AtlasTW.QCurrentQuest]

        -- Check for Page
        if questData and questData.Page then
            local pageContent = questData.Page[AtlasTW.QCurrentPage]
            local pageCount = questData.Page[1] or 1

            if pageContent then
                AtlasTW.Quest.UI.Story:SetText(Colors.WHITE .. pageContent)
                AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage .. "/" .. pageCount)

                -- Hide next button if we're on the last page
                if AtlasTW.QCurrentPage >= pageCount then
                    AtlasTW.Quest.UI.NextPageButtonRight:Hide()
                else
                    AtlasTW.Quest.UI.NextPageButtonRight:Show()
                end
            end
        end
    end
    -- Show back button
    AtlasTW.Quest.UI.NextPageButtonLeft:Show()
end

---
--- Goes back to the previous page of quest or story content
--- Handles both story pages and multi-page quest descriptions
--- @return nil
--- @usage Called when previous page button is clicked
---
---
--- Goes back to the previous page of quest or story content
--- Handles both story pages and multi-page quest descriptions
--- @return nil
--- @usage Called when previous page button is clicked
---
function AtlasTW.Quest.PreviousPage()
    AtlasTW.QCurrentPage = AtlasTW.QCurrentPage - 1

    -- Handle story text pages
    if AtlasTW.Quest.NextPageCount == "Story" then
        local story = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Story
        local caption = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Caption

        if type(story) == "table" then
            -- Display current page content
            AtlasTW.Quest.UI.Story:SetText(Colors.WHITE .. story["Page" .. AtlasTW.QCurrentPage])
            AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage .. "/" .. story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Caption[AtlasTW.QCurrentPage]
            AtlasTW.Quest.UI.QuestName:SetText(Colors.BLUE .. (pageCaption or caption))

            -- Hide back button if we're on the first page
            if AtlasTW.QCurrentPage == 1 then
                AtlasTW.Quest.UI.NextPageButtonLeft:Hide()
            end
        end
    end
    -- Handle quest text pages
    if AtlasTW.Quest.NextPageCount == "Quest" then
        local faction = AtlasTW.Faction
        local questData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance][faction][AtlasTW.QCurrentQuest]
        -- Go back to main quest text if we're returning to page 1
        if AtlasTW.QCurrentPage == 1 then
            AtlasTW.Quest.SetQuestText()
        else
            -- Check for Page
            if questData and questData.Page then
                local pageContent = questData.Page[AtlasTW.QCurrentPage]
                local pageCount = questData.Page[1] or 1
                if pageContent then
                    AtlasTW.Quest.UI.Story:SetText(Colors.WHITE .. pageContent)
                    AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage .. "/" .. pageCount)
                end
            end
        end
    end
    -- Always show next button when going back
    AtlasTW.Quest.UI.NextPageButtonRight:Show()
end

---
--- Handles the quest frame show event
--- Initializes faction checkboxes and refreshes quest buttons
--- @return nil
--- @usage Called automatically when quest frame is shown
---
---
--- Handles the quest frame show event
--- Initializes faction checkboxes and refreshes quest buttons
--- @return nil
--- @usage Called automatically when quest frame is shown
---
function AtlasTW.Quest.OnQuestFrameShow()
    if not AtlasTW.Quest.UI_Main then
        return PrintA("AtlasTW.Quest.OnQuestFrameShow: Quest UI not fully loaded.")
    end

    if AtlasTW.isHorde then
        AtlasTW.Quest.UI_Main.HordeButton:SetAlpha(1.0)
        AtlasTW.Quest.UI_Main.AllianceButton:SetAlpha(0.5)
    else
        AtlasTW.Quest.UI_Main.HordeButton:SetAlpha(0.5)
        AtlasTW.Quest.UI_Main.AllianceButton:SetAlpha(1.0)
    end

    AtlasTW.Quest.SetQuestButtons()
end

---
--- Handles click events on the story button
--- Toggles story text display in the quest details frame
--- @return nil
--- @usage Called when story button is clicked
---
---
--- Handles click events on the story button
--- Toggles story text display in the quest details frame
--- @return nil
--- @usage Called when story button is clicked
---
function AtlasTW.Quest.OnStoryClick()
    AtlasTW.Quest.HideAtlasTWLootFrame()
    if not AtlasTW.Quest.UI.InsideAtlasFrame:IsVisible() then
        AtlasTW.Quest.UI.InsideAtlasFrame:Show()
        AtlasTW.QCurrentButton = -1
        AtlasTW.Quest.SetStoryText()
    elseif AtlasTW.QCurrentButton == -1 then
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    else
        AtlasTW.QCurrentButton = -1
        AtlasTW.Quest.SetStoryText()
    end
end

---
--- Handles click events on the Alliance faction button
--- Switches to Alliance faction and refreshes quest display
--- @return nil
--- @usage Called when Alliance checkbox is clicked
---
---
--- Handles click events on the Alliance faction button
--- Switches to Alliance faction and refreshes quest display
--- @return nil
--- @usage Called when Alliance checkbox is clicked
---
function AtlasTW.Quest.OnAllianceClick()
    if not AtlasTW.Quest.UI_Main then
        return PrintA("AtlasTW.Quest.OnAllianceClick: Quest UI not fully loaded.")
    end
    AtlasTW.isHorde = false
    AtlasTW.Faction = "Alliance"
    AtlasTW.Quest.UI_Main.AllianceButton:SetAlpha(1.0)
    AtlasTW.Quest.UI_Main.HordeButton:SetAlpha(0.5)
    AtlasTW.Quest.CloseDetails()
    AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

---
--- Handles click events on the Horde faction button
--- Switches to Horde faction and refreshes quest display
--- @return nil
--- @usage Called when Horde checkbox is clicked
---
function AtlasTW.Quest.OnHordeClick()
    if not AtlasTW.Quest.UI_Main then
        return PrintA("AtlasTW.Quest.OnHordeClick: Quest UI not fully loaded.")
    end
    AtlasTW.isHorde = true
    AtlasTW.Faction = "Horde"
    AtlasTW.Quest.UI_Main.AllianceButton:SetAlpha(0.5)
    AtlasTW.Quest.UI_Main.HordeButton:SetAlpha(1.0)
    AtlasTW.Quest.CloseDetails()
    AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

---
--- Closes the quest frame and updates options
--- Toggles quest display option and hides all quest UI elements
--- @return nil
--- @usage Called when quest frame close button is clicked
---
---
--- Closes the quest frame and updates options
--- Toggles quest display option and hides all quest UI elements
--- @return nil
--- @usage Called when quest frame close button is clicked
---
function AtlasTW.Quest.CloseQuestFrame()
    AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
    AtlasTW.Quest.UI_Main.Frame:Hide()
    AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTW.Quest.CloseDetails()
    AtlasTW.OptionsInit()
end

---
--- Toggles the visibility of the main quest frame
--- Shows or hides the quest UI based on current state
--- @return nil
--- @usage Called when quest frame toggle button is clicked
---
---
--- Toggles the visibility of the main quest frame
--- Shows or hides the quest UI based on current state
--- @return nil
--- @usage Called when quest frame toggle button is clicked
---
function AtlasTW.Quest.ToggleQuestFrame()
    AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
    if not AtlasTWOptions.QuestWithAtlas then
        AtlasTW.Quest.UI_Main.Frame:Hide()
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    else
        AtlasTW.Quest.UI_Main.Frame:Show()
    end
    AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTW.Quest.ClearAll()
    AtlasTW.OptionsInit()
end

---
--- Handles quest-related game events and initialization
--- Loads finished quests and configures tooltip settings
--- @return nil
--- @usage Called automatically when the player starts the game
---
function AtlasTW.Quest.OnEvent()
    if type(AtlasTWCharDB) == "table" then
        AtlasTW.Quest.LoadFinishedQuests()
    else
        PrintA(Colors.GREEN .. "Atlas-TW Quest:|r|cff00ffffAtlasTW not loaded!|r")
    end
end
