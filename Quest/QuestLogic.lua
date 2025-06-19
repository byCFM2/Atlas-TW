-- AtlasTW Quest Logic for the Inside Frame

-- Ensure the namespace exists
AtlasTW = AtlasTW or {}
AtlasTW.Quest = AtlasTW.Quest or {}

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

-- Local reference to the UI elements for convenience
local UI = AtlasTW.Quest.UI or {}

-- This function should be called when the frame is initialized
function AtlasTW.Quest.Initialize()
    -- Get a local reference to the UI table created in QuestInsideFrame.lua
    if not UI then return end
    -- Initial population of the quest list
    AtlasTW.Quest.UpdateQuestList()
end

function AtlasTW.Quest.OnItemEnter()
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
    local itemDescription = rewardItem.Description

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
        local displayName = itemColor .. (itemName or "Unknown Item")
        AtlasTW.Quest.Tooltip:AddLine(displayName, 1, 1, 1)

        -- Add description if available
        if itemDescription and itemDescription ~= "" then
            AtlasTW.Quest.Tooltip:AddLine(itemDescription, 0.8, 0.8, 0.8, 1)
        end

        -- Add error message if we have ID but can't load item
        if itemId then
            AtlasTW.Quest.Tooltip:AddLine(red .. (AQERRORNOTSHOWN or "Item not found in cache"), 1, 0, 0)
            AtlasTW.Quest.Tooltip:AddLine(AQERRORASKSERVER)
        end
    end

    -- Show the tooltip
    AtlasTW.Quest.Tooltip:Show()
end

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

function AtlasTW.Quest.OnItemClick(mouseButton)
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
end

-- Function to close the quest details frame
function AtlasTW.Quest.CloseDetails()
    HideUIPanel(KQuestInsideFrame)
    AtlasTW.QCurrentButton = 0
end

-- Toggles the finished status of a quest and updates the UI
function AtlasTW.Quest.ToggleFinishedFilter()
    -- Build the quest key based on faction
    local questKey = "AtlasTWQuestFinishedInst"..AtlasTW.QCurrentInstance.."Quest"..AtlasTW.QCurrentQuest
    questKey = questKey..(AtlasTW.isHorde and "HORDE" or "")
    -- Update quest completion status
    AtlasTW.Q[questKey] = UI.FinishedQuestCheckbox:GetChecked() and 1 or nil
    -- Save to player options
    AtlasTWCharDB[questKey] = AtlasTW.Q[questKey]
    -- Update UI
    KQuestSetTextandButtons()
    KQButton_SetText()
end

function AtlasTW.Quest.NextPage()
    local SideAfterThis = AtlasTW.QCurrentPage + 2
    AtlasTW.QCurrentPage = AtlasTW.QCurrentPage + 1

    -- Clear display
    AtlasTW.Quest.ClearAll()

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
end

function AtlasTW.Quest.PreviousPage()
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
end