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
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
local L = AtlasTW.Local
AtlasTW = _G.AtlasTW

-----------------------------------------------------------------------------
-- Colours
-----------------------------------------------------------------------------
local red = "|cffff0000"
local white = "|cffFFFFFF"
local blue = "|cff0070dd"

---
--- Handles mouse enter event for quest reward items
--- Displays detailed tooltip information when the mouse enters a quest reward item
--- @param itemIndex number Index of the reward item (1-6)
--- @return nil
--- @usage Called automatically on mouse enter event
--- @since 1.0.0
---
function AtlasTW.Quest.OnItemEnter(itemIndex)
    if not itemIndex then
        return print("AtlasTW.Quest.OnItemEnter failed itemIndex!")
    end
    local frame = this
    -- Get the frame that triggered this event
    if not frame then
        return print("AtlasTW.Quest.OnItemEnter failed frame and name!")
    end
    -- Get current quest data
    local instance = AtlasTW.QCurrentInstance
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"

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
    local itemDescription = rewardItem.desc

    -- Set up tooltip
    AtlasTW.Quest.Tooltip:SetOwner(frame, "ANCHOR_RIGHT")
    AtlasTW.Quest.Tooltip:ClearLines()

    -- Try to get item info from game cache first
    if itemId and GetItemInfo(itemId) then
        -- Use game's tooltip if item is in cache
        AtlasTW.Quest.Tooltip:SetHyperlink("item:" .. itemId)
    else
        -- Fallback to manual tooltip creation
        -- Set item name with color
        AtlasTW.Quest.Tooltip:AddLine(L["Item not found in cache"], 1, 1, 1)

        -- Add description if available
        if itemDescription and itemDescription ~= "" then
            AtlasTW.Quest.Tooltip:AddLine(itemDescription, 0.8, 0.8, 0.8, 1)
        end

        -- Add error message if we have ID but can't load item
        if itemId then
            AtlasTW.Quest.Tooltip:AddLine(red .. L["This item is not safe!"], 1, 0, 0)
            AtlasTW.Quest.Tooltip:AddLine(L["You can right-click to attempt to query the server."])
        end
    end

    -- Show the tooltip
    AtlasTW.Quest.Tooltip:Show()
end

---
--- Handles mouse leave event for quest reward items
--- Hides the tooltip when the mouse leaves a quest reward item
--- @return nil
--- @usage Called automatically on mouse leave event
--- @since 1.0.0
---
function AtlasTW.Quest.OnItemLeave()
    -- Hide all tooltips when mouse leaves item
    local tooltips = {GameTooltip, AtlasTW.Quest.Tooltip}
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

---
--- Handles mouse click events on quest reward items
--- Processes clicks on quest reward items for various actions like linking to chat
--- @param mouseButton string Mouse button pressed ("LeftButton", "RightButton")
--- @param itemIndex number Index of the clicked reward item (1-6)
--- @return nil
--- @usage Called automatically on item click event
--- @since 1.0.0
---
function AtlasTW.Quest.OnItemClick(mouseButton, itemIndex)
    if not itemIndex then
        return print("AtlasTW.Quest.OnItemClick failed itemIndex!")
    end
    local frame = this
    if not frame then
        return print("AtlasTW.Quest.OnItemClick failed frame or name!")
    end
    -- Get current quest data
    local instance = AtlasTW.QCurrentInstance
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"

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

    -- Handle right click - show tooltip
    if mouseButton == "RightButton" then
        AtlasTW.Quest.Tooltip:SetOwner(frame, "ANCHOR_RIGHT", -(frame:GetWidth() / 2), 24)
        AtlasTW.Quest.Tooltip:SetHyperlink(string.format("item:%d:0:0:0", itemId))
        AtlasTW.Quest.Tooltip:Show()
        if not AtlasTWOptions.QuestQuerySpam then
            print(string.format("%s[%s%s%s]%s",
                L["AtlasQuest is querying the server for: "], white, L["Item not found in cache"], white, L[" Please click right until you see the Item frame."]))
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
            print("Item unsafe! Right click to get the item ID")
            ChatFrameEditBox:Insert(string.format("[%s]", L["Item not found in cache"]))
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
--- @since 1.0.0
---
function AtlasTW.Quest.CloseDetails()
    AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    AtlasTW.QCurrentButton = 0
end


---
--- Inserts a quest link into the chat frame
--- Creates a clickable quest link for sharing with other players
--- @return nil
--- @usage Called internally when Shift+clicking quest buttons
--- @since 1.0.0
---
local function atlasTWQuestInsertQuestLink()
    local questID = AtlasTW.QCurrentQuest
    local instance = AtlasTW.QCurrentInstance
    local faction = AtlasTW.isHorde and "Horde" or "Alliance"

    local questData = AtlasTW.Quest.DataBase and
                      AtlasTW.Quest.DataBase[instance] and
                      AtlasTW.Quest.DataBase[instance][faction] and
                      AtlasTW.Quest.DataBase[instance][faction][questID]

    if questData and questData.Title then
        local questName = questData.Title
--        local levelPattern = "^%d+%) "
--        questName = string.gsub(questName, levelPattern, "")
        if pfQuestCompat then
            pfQuestCompat.InsertQuestLink(0,questName)
        else
            ChatFrameEditBox:Insert("["..questName.."]")
        end
    end
end

---
--- Handles click events on quest buttons
--- Toggles quest details display or inserts quest link to chat if Shift is held
--- @param questIndex number Index of the clicked quest button
--- @return nil
--- @usage Called automatically when quest button is clicked
--- @since 1.0.0
---
function AtlasTW.Quest.OnQuestClick(questIndex)
    if not questIndex then return print("AtlasTW.Quest.OnQuestClick without questIndex.") end
    AtlasTW.QCurrentQuest = questIndex
    if not AtlasTW.Quest.UI or not AtlasTW.Quest.UI.InsideAtlasFrame then
        return print("AtlasTW.Quest.OnQuestClick: Quest UI not fully loaded.")
    end
    if ChatFrameEditBox:IsVisible() and IsShiftKeyDown() then
        atlasTWQuestInsertQuestLink()
    else
        AtlasTW.Quest.HideAtlasLootFrame()
        AtlasTW.Quest.UI.Story:SetText("")

        if AtlasTW.Quest.UI.InsideAtlasFrame:IsVisible() and AtlasTW.QCurrentButton == AtlasTW.QCurrentQuest then
            AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
            AtlasTW.QCurrentButton = nil
        else
            AtlasTW.Quest.UI.InsideAtlasFrame:Show()
            AtlasTW.QCurrentButton = AtlasTW.QCurrentQuest
            AtlasTW.Quest.SetQuestText()
        end
    end
end

---
--- Toggles the finished status of the current quest
--- Updates quest completion state and saves it to character database
--- @return nil
--- @usage Called when finished quest checkbox is clicked
--- @since 1.0.0
---
function AtlasTW.Quest.ToggleFinishedFilter()
    -- Build the quest key based on faction
    local questKey = "Completed_"..AtlasTW.QCurrentInstance.."_Quest_"..AtlasTW.QCurrentQuest
    questKey = questKey..(AtlasTW.isHorde and "_Horde" or "_Alliance")
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
--- @since 1.0.0
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
            AtlasTW.Quest.UI.Story:SetText(white..story["Page"..AtlasTW.QCurrentPage])
            AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage.."/"..story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Caption[AtlasTW.QCurrentPage]
            AtlasTW.Quest.UI.QuestName:SetText(blue..(pageCaption or caption))

            -- Hide next button if we're on the last page
            if not story["Page"..SideAfterThis] then
                AtlasTW.Quest.UI.NextPageButtonRight:Hide()
            else
                AtlasTW.Quest.UI.NextPageButtonRight:Show()
            end
        end
    end

    -- Handle quest text pages
    if AtlasTW.Quest.NextPageCount == "Quest" then
        local faction = AtlasTW.isHorde and "Horde" or "Alliance"
        local questData = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance][faction][AtlasTW.QCurrentQuest]

        -- Check for Page
        if questData and questData.Page then
            local pageContent = questData.Page[AtlasTW.QCurrentPage]
            local pageCount = questData.Page[1] or 1

            if pageContent then
                AtlasTW.Quest.UI.Story:SetText(white..pageContent)
                AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage.."/"..pageCount)

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
--- @since 1.0.0
---
---
--- Goes back to the previous page of quest or story content
--- Handles both story pages and multi-page quest descriptions
--- @return nil
--- @usage Called when previous page button is clicked
--- @since 1.0.0
---
function AtlasTW.Quest.PreviousPage()
    AtlasTW.QCurrentPage = AtlasTW.QCurrentPage - 1

    -- Handle story text pages
    if AtlasTW.Quest.NextPageCount == "Story" then
        local story = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Story
        local caption = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Caption

        if type(story) == "table" then
            -- Display current page content
            AtlasTW.Quest.UI.Story:SetText(white..story["Page"..AtlasTW.QCurrentPage])
            AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage.."/"..story["MaxPages"])

            -- Handle page-specific captions if available
            local pageCaption = AtlasTW.Quest.DataBase[AtlasTW.QCurrentInstance].Caption[AtlasTW.QCurrentPage]
            AtlasTW.Quest.UI.QuestName:SetText(blue..(pageCaption or caption))

            -- Hide back button if we're on the first page
            if AtlasTW.QCurrentPage == 1 then
                AtlasTW.Quest.UI.NextPageButtonLeft:Hide()
            end
        end
    end
    -- Handle quest text pages
    if AtlasTW.Quest.NextPageCount == "Quest" then
        local faction = AtlasTW.isHorde and "Horde" or "Alliance"
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
                    AtlasTW.Quest.UI.Story:SetText(white..pageContent)
                    AtlasTW.Quest.UI.PageCount:SetText(AtlasTW.QCurrentPage.."/"..pageCount)
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
--- @since 1.0.0
---
---
--- Handles the quest frame show event
--- Initializes faction checkboxes and refreshes quest buttons
--- @return nil
--- @usage Called automatically when quest frame is shown
--- @since 1.0.0
---
function AtlasTW.Quest.OnQuestFrameShow()
    if not AtlasTW.Quest.UI_Main then
        return print("AtlasTW.Quest.OnQuestFrameShow: Quest UI not fully loaded.")
    end
    AtlasTW.Quest.UI_Main.HordeCheck:SetChecked(AtlasTW.isHorde)
    AtlasTW.Quest.UI_Main.AllianceCheck:SetChecked(not AtlasTW.isHorde)
    AtlasTW.Quest.SetQuestButtons()
end

---
--- Handles click events on the story button
--- Toggles story text display in the quest details frame
--- @return nil
--- @usage Called when story button is clicked
--- @since 1.0.0
---
---
--- Handles click events on the story button
--- Toggles story text display in the quest details frame
--- @return nil
--- @usage Called when story button is clicked
--- @since 1.0.0
---
function AtlasTW.Quest.OnStoryClick()
	AtlasTW.Quest.HideAtlasLootFrame()
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
--- @since 1.0.0
---
---
--- Handles click events on the Alliance faction button
--- Switches to Alliance faction and refreshes quest display
--- @return nil
--- @usage Called when Alliance checkbox is clicked
--- @since 1.0.0
---
function AtlasTW.Quest.OnAllianceClick()
    if not AtlasTW.Quest.UI_Main then
        return print("AtlasTW.Quest.OnAllianceClick: Quest UI not fully loaded.")
    end
	AtlasTW.isHorde = false
    AtlasTW.Quest.UI_Main.AllianceCheck:SetChecked(true)
    AtlasTW.Quest.UI_Main.HordeCheck:SetChecked(false)
    AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

---
--- Handles click events on the Horde faction button
--- Switches to Horde faction and refreshes quest display
--- @return nil
--- @usage Called when Horde checkbox is clicked
--- @since 1.0.0
---
---
--- Handles click events on the Horde faction button
--- Switches to Horde faction and refreshes quest display
--- @return nil
--- @usage Called when Horde checkbox is clicked
--- @since 1.0.0
---
function AtlasTW.Quest.OnHordeClick()
    if not AtlasTW.Quest.UI_Main then
        return print("AtlasTW.Quest.OnHordeClick: Quest UI not fully loaded.")
    end
	AtlasTW.isHorde = true
    AtlasTW.Quest.UI_Main.AllianceCheck:SetChecked(false)
    AtlasTW.Quest.UI_Main.HordeCheck:SetChecked(true)
    AtlasTW.OptionsInit()
    AtlasTW.Quest.SetQuestButtons()
end

---
--- Closes the quest frame and updates options
--- Toggles quest display option and hides all quest UI elements
--- @return nil
--- @usage Called when quest frame close button is clicked
--- @since 1.0.0
---
---
--- Closes the quest frame and updates options
--- Toggles quest display option and hides all quest UI elements
--- @return nil
--- @usage Called when quest frame close button is clicked
--- @since 1.0.0
---
function AtlasTW.Quest.CloseQuestFrame()
    AtlasTWOptions.QuestWithAtlas = not AtlasTWOptions.QuestWithAtlas
    AtlasTW.Quest.UI_Main.Frame:Hide()
    AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    AtlasTWOptionAutoshow:SetChecked(AtlasTWOptions.QuestWithAtlas)
    AtlasTW.OptionsInit()
end

---
--- Toggles the visibility of the main quest frame
--- Shows or hides the quest UI based on current state
--- @return nil
--- @usage Called when quest frame toggle button is clicked
--- @since 1.0.0
---
---
--- Toggles the visibility of the main quest frame
--- Shows or hides the quest UI based on current state
--- @return nil
--- @usage Called when quest frame toggle button is clicked
--- @since 1.0.0
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
    AtlasTW.OptionsInit()
end

---
--- Handles quest-related game events and initialization
--- Loads finished quests and configures tooltip settings
--- @return nil
--- @usage Called automatically when the player starts the game
--- @since 1.0.0
---
---
--- Handles quest-related game events and initialization
--- Loads finished quests and configures tooltip settings
--- @return nil
--- @usage Called automatically when the player starts the game
--- @since 1.0.0
---
function AtlasTW.Quest.OnEvent()
    if type(AtlasTWCharDB) == "table" then
        AtlasTW.Quest.LoadFinishedQuests()
    else
        print("|cff00ff00Atlas-TW Quest:|r|cff00ffffAtlasTW not loaded!|r")
    end
    -- Register Tooltip with EquipCompare if enabled.
    if AtlasTWOptions.QuestCompareTooltip then
        AtlasTW.Quest.Tooltip:Register()
    else
        AtlasTW.Quest.Tooltip:Unregister()
    end
end