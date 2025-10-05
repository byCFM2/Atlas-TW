---
--- Interactions.lua - User interaction event handlers for Atlas-TW
---
--- This module handles all user interaction events including mouse clicks,
--- hover events, and keyboard interactions for the loot browser interface.
--- It provides centralized event handling for item tooltips, navigation,
--- and user interface interactions.
---
--- Features:
--- • Item click event handling (left, right, shift+click)
--- • Mouse enter/leave tooltip management
--- • Boss and menu item click processing
--- • Navigation button event handling
--- • Chat link generation and wish list operations
--- • Container item interaction support
---
--- @since 1.0.0
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.Interactions = AtlasTW.Interactions or {}

-- Local references for performance
local L = AtlasTW.Local
local WHITE = AtlasTW.Colors.WHITE
local BLUE = AtlasTW.Colors.BLUE

---
--- Determines default chat channel and target, considering WIM activity and ChatFrame state
--- @return string, string|nil, table channel, target, wimActivityList
--- @since 1.0.0
---
function AtlasTW.Interactions.ChatGetDefaultChannelTarget()
    local tListActivity = {}
    if WIM_IconItems and WIM_Icon_SortByActivity then
        for key in WIM_IconItems do
            table.insert(tListActivity, key)
        end
        table.sort(tListActivity, WIM_Icon_SortByActivity)
    end

    local channel, chatnumber
    if tListActivity[1] and WIM_Windows and WIM_Windows[tListActivity[1]].is_visible then
        channel = "WHISPER"
        chatnumber = tListActivity[1]
    else
        channel = ChatFrameEditBox.chatType
        if channel == "WHISPER" then
            chatnumber = ChatFrameEditBox.tellTarget
        elseif channel == "CHANNEL" then
            chatnumber = ChatFrameEditBox.channelTarget
        end
    end
    return channel, chatnumber, tListActivity
end

---
--- Sends a message to chat using resolved channel/target
--- @param message string
--- @param channel string|nil
--- @param chatnumber string|number|nil
--- @return void
--- @since 1.0.0
---
function AtlasTW.Interactions.ChatSend(message, channel, chatnumber)
    if not message or message == "" then return end
    if not channel then channel = ChatFrameEditBox.chatType end
    if channel == "WHISPER" and not chatnumber then
        chatnumber = ChatFrameEditBox.tellTarget
    elseif channel == "CHANNEL" and not chatnumber then
        chatnumber = ChatFrameEditBox.channelTarget
    end
    SendChatMessage(message, channel, nil, chatnumber)
end

---
--- Outputs crafting/enchant reagents for specified id to chat
--- Mirrors legacy behavior but centralized under AtlasTW.Interactions.Chat
--- @param id number
--- @param color string
--- @param name string
--- @param safe boolean
--- @return void
--- @since 1.0.0
---
function AtlasTW.Interactions.ChatSayItemReagents(id, color, name, safe)
    if not id then return end

    local channel, chatnumber, tListActivity = AtlasTW.Interactions.ChatGetDefaultChannelTarget()

    -- Handle craft spells
    if AtlasTW.SpellDB.craftspells[id] then
        local spellData = AtlasTW.SpellDB.craftspells[id]
        local craftitem = spellData.item

        if craftitem and craftitem ~= "" then
            local craftnumber = ""
            local quantity = spellData.quantity
            if quantity then
                craftnumber = type(quantity) == "table" and (quantity[1] .. "-" .. quantity[2] .. "x") or (quantity .. "x")
            end

            local craftMessage = L["To craft "] .. craftnumber .. AtlasTW.LootUtils.GetChatLink(craftitem) .. L[" the following reagents are needed:"]
            AtlasTW.Interactions.ChatSend(craftMessage, channel, chatnumber)

            local chatline, itemCount = "", 0
            local reagents = spellData.reagents
            if reagents then
                for j = 1, table.getn(reagents) do
                    local reagentCount = reagents[j][2] or 1
                    local reagentItem = reagents[j][1]

                    chatline = chatline .. reagentCount .. "x" .. AtlasTW.LootUtils.GetChatLink(reagentItem) .. " "
                    itemCount = itemCount + 1

                    if itemCount == 4 then
                        AtlasTW.Interactions.ChatSend(chatline, channel, chatnumber)
                        chatline = ""
                        itemCount = 0
                    end
                end
                if itemCount > 0 then
                    AtlasTW.Interactions.ChatSend(chatline, channel, chatnumber)
                end
            end
        else
            -- Handle spells without items (reagents only)
            local spellName = spellData.name
            local castMessage = L["To cast "] .. spellName .. L[" the following items are needed:"]
            AtlasTW.Interactions.ChatSend(castMessage, channel, chatnumber)

            local chatline, itemCount = "", 0
            local reagents = spellData.reagents
            if reagents then
                for j = 1, table.getn(reagents) do
                    local reagentCount = reagents[j][2] or 1
                    local reagentItem = reagents[j][1]

                    chatline = chatline .. reagentCount .. "x" .. AtlasTW.LootUtils.GetChatLink(reagentItem) .. " "
                    itemCount = itemCount + 1

                    if itemCount == 4 then
                        AtlasTW.Interactions.ChatSend(chatline, channel, chatnumber)
                        chatline = ""
                        itemCount = 0
                    end
                end
                if itemCount > 0 then
                    AtlasTW.Interactions.ChatSend(chatline, channel, chatnumber)
                end
            end
        end

    -- Handle enchantments
    elseif AtlasTW.SpellDB.enchants[id] then
        local enchantData = AtlasTW.SpellDB.enchants[id]
        local enchantItem = enchantData["item"]
        local enchantName = enchantData["name"] or GetItemInfo(enchantItem)
        local enchantLink = "|cffFFd200|Henchant:" .. id .. ":0:0:0|h[" .. (enchantName or "Enchant") .. "]|h|r"

        local message
        if enchantItem then
            message = L["To craft "] .. AtlasTW.LootUtils.GetChatLink(enchantItem) .. L[" you need this: "] .. enchantLink
        else
            message = enchantLink
        end

        if tListActivity[1] and WIM_Windows and WIM_Windows[tListActivity[1]].is_visible then
            AtlasTW.Interactions.ChatSend(message, channel, chatnumber)
        elseif ChatFrameEditBox:IsVisible() then
            ChatFrameEditBox:Insert(message)
        else
            AtlasTW.Interactions.ChatSend(message, channel, chatnumber)
        end

    -- Handle regular items
    else
        local itemMessage
        if safe then
            itemMessage = "[" .. (name or "Item") .. "]"
        else
            itemMessage = "\124" .. string.sub(color or "|cffffffff", 2) .. "\124Hitem:" .. id .. ":0:0:0\124h[" .. (name or tostring(id)) .. "]\124h\124r"
        end
        AtlasTW.Interactions.ChatSend(itemMessage, channel, chatnumber)
    end
end

-- Helper function to create materials string (tools/reagents)
local function BuildMaterialString(materials, isReagent)
    if not materials or type(materials) ~= "table" then
        return ""
    end

    local materialStrings = {}
    for i = 1, table.getn(materials) do
        local itemInfo = materials[i]
        local checkedItem
        if isReagent then
            -- Reagent is a table {itemID, quantity}
           -- AtlasTW.LootCache.ForceCacheItemWithDelay(itemInfo[1], 1)
            checkedItem = AtlasTW.LootUtils.CheckBagsForItems(itemInfo[1], itemInfo[2] or 1)
        else
            -- Tool is just itemID
          --  AtlasTW.LootCache.ForceCacheItemWithDelay(itemInfo, 1)
            checkedItem = AtlasTW.LootUtils.CheckBagsForItems(itemInfo)
        end
        table.insert(materialStrings, checkedItem)
    end

    -- table.concat is much faster than loop concatenation for Lua 5.0
    return table.concat(materialStrings, WHITE .. ", ")
end

-- Helper function to determine correct spell ID (with profession hacks)
local function GetDisplaySpellID(elemID)
    if elemID >= 100000 then
        if elemID <= 100007 then return 2575 end -- Mining Apprentice 75
        if elemID <= 100010 then return 2576 end -- Mining Journeyman 125
        if elemID <= 100017 then return 3564 end -- Mining Expert 225
        if elemID <= 100035 then return 10248 end -- Mining Artisan 275
    end
    return elemID
end

-- Main function for displaying spell tooltip
local function ShowSpellTooltip(link, elemID, anchor)
    AtlasLootTooltip:SetOwner(anchor, "ANCHOR_NONE")
    AtlasLootTooltip:SetPoint("BOTTOMLEFT", anchor, "TOPRIGHT", -(anchor:GetWidth() / 2), 24)
    AtlasLootTooltip:ClearLines()

    -- Data-driven structure for tooltip lines
    local tooltipLines = {
        { text = link.name },
        { text = link.requires, prefix = WHITE .. L["Requires"]..": " },
        { text = BuildMaterialString(link.tools), prefix = WHITE .. L["Tools: "], wrap = true },
        { text = BuildMaterialString(link.reagents, true), prefix = WHITE .. L["Reagents: "], wrap = true },
        { text = link.text, wrap = true },
    }

    -- Dynamic addition of lines to tooltip
    for i = 1, table.getn(tooltipLines) do
        local lineInfo = tooltipLines[i]
        if lineInfo.text and lineInfo.text ~= "" then
            AtlasLootTooltip:AddLine((lineInfo.prefix or "") .. lineInfo.text, nil, nil, nil, lineInfo.wrap)
        end
    end

    -- Add spell ID if option is enabled
    if AtlasTWOptions.LootItemIDs then
        local spellID = GetDisplaySpellID(elemID)
        AtlasLootTooltip:AddLine(BLUE .. L["SpellID:"] .. " " .. spellID, nil, nil, nil, true)
    end

    AtlasLootTooltip:Show()
end

-- Main function for displaying crafted item tooltip
local function ShowCraftedItemTooltip(link, anchorTooltip, anchorFrame)
	local itemID = link.item
    if not itemID then return end
    AtlasLootTooltip2:SetOwner(anchorFrame, "ANCHOR_NONE")
    AtlasLootTooltip2:SetPoint("TOPLEFT", anchorTooltip, "BOTTOMLEFT", 0, 0)
    AtlasLootTooltip2:ClearLines()
    AtlasLootTooltip2:SetHyperlink("item:" .. itemID.. ":0:0:0")
    if link.extra then
        AtlasLootTooltip2:AddLine(link.extra, nil, nil, nil, true)
    end
    if AtlasTWOptions.LootItemIDs then
        AtlasLootTooltip2:AddLine(BLUE .. L["ItemID:"] .. " " .. itemID, nil, nil, nil, true)
    end
    AtlasLootTooltip2:Show()
end

--[[
  Унифицированная модульная система для обработки тултипов
]]
-- Handler for "spell" type
local function HandleSpellTooltip(elemID, anchor)
    local link = AtlasTW.SpellDB.craftspells[elemID]
    if not link then
       -- print("AtlasLoot Error: Missing spell data for ID: " .. tostring(elemID))
        return
    end
    ShowSpellTooltip(link, elemID, anchor)
    ShowCraftedItemTooltip(link, AtlasLootTooltip, anchor)
end

local messageShown = false
-- Handler for "enchant" type
local function HandleEnchantTooltip(spellID, anchor)
    if not spellID then return end
    local enchantLink = "enchant:" .. spellID

     -- For old SuperWoW versions
    if SetAutoloot and (SUPERWOW_VERSION and (tonumber(SUPERWOW_VERSION)) < 1.2) then
        enchantLink = "spell:" .. spellID
        if not messageShown then
            print(BLUE .. L["AtlasLoot"] .. ": " .. WHITE .. "Old version of SuperWoW detected...")
            messageShown = true
        end
    end

    AtlasLootTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
    AtlasLootTooltip:SetHyperlink(enchantLink)

    if AtlasTWOptions.LootItemIDs then
        AtlasLootTooltip:AddLine(BLUE .. L["SpellID:"] .. " " .. spellID, nil, nil, nil, 1)
    end
    AtlasLootTooltip:Show()

    -- Show linked item if it exists
    local enchantData = AtlasTW.SpellDB.enchants[spellID]
    if enchantData and enchantData.item then
        ShowCraftedItemTooltip(enchantData, AtlasLootTooltip, anchor)
    end
end

-- Handler for "item" type
local function HandleItemTooltip(itemID, dropRate, anchor)
    AtlasLootTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
    AtlasLootTooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
    if dropRate then
        AtlasLootTooltip:AddLine(L["Drop Rate:"] .. " " .. dropRate, 0.2, 0.4, 0.3)
    end
    if AtlasTWOptions.LootItemIDs then
        AtlasLootTooltip:AddLine(BLUE .. L["ItemID:"] .. " " .. itemID, nil, nil, nil, 1)
    end
    AtlasLootTooltip:Show()
end

-- Handler map
local TOOLTIP_HANDLERS = {
    spell = HandleSpellTooltip,
    enchant = HandleEnchantTooltip,
    item = HandleItemTooltip,
}

-- Function to find boss index in ScrollList by ID or name
local function FindBossIndexInScrollList(bossIdOrName)
	if not AtlasTW.ScrollList or not bossIdOrName then
		return nil
	end

	for i = 1, table.getn(AtlasTW.ScrollList) do
		local entry = AtlasTW.ScrollList[i]
		if entry and (entry.id == bossIdOrName or entry.name == bossIdOrName) then
			--print("FindBossIndexInScrollList: found boss " .. tostring(bossIdOrName) .. " at index " .. tostring(i))
			return i
		end
	end

	--print("FindBossIndexInScrollList: boss " .. tostring(bossIdOrName) .. " not found in ScrollList")
	return nil
end

---
--- Generates a chat link for an item
--- Creates properly formatted item links for chat output
--- @param id number Item ID to create link for
--- @return string Formatted chat link
--- @usage local link = AtlasTW.Interactions.GetChatLink(12345)
--- @since 1.0.0
---
function AtlasTW.Interactions.GetChatLink(id)
    local itemName, itemLink, itemQuality = GetItemInfo(tonumber(id))
    if not itemName or not itemLink or not itemQuality then
        -- If item is not cached, return simple link
        return "[Item:" .. tostring(id) .. "]"
    end

    local _, _, _, colorCode = GetItemQualityColor(itemQuality)
    local colorHex = string.sub(colorCode, 2)
    return "\124" .. colorHex .. "\124H" .. itemLink .. "\124h[" .. itemName .. "]\124h\124r"
end

---
--- Handles mouse enter events on loot item buttons
--- Shows appropriate tooltip based on item type (item, spell, enchant)
--- @return nil
--- @usage AtlasTW.Interactions.Item_OnEnter() -- Called automatically on mouse enter
--- @since 1.0.0
---
function AtlasTW.Interactions.Item_OnEnter()
    if not this or not this.typeID or this.typeID == 0 or this.typeID == "" then
        return
    end

    local itemType = this.typeID
    local handler = TOOLTIP_HANDLERS[itemType]

    if handler then
        -- Call appropriate handler, passing necessary parameters
        if itemType == "spell" or itemType == "enchant" then
            handler(this.elemID, this)
        elseif itemType == "item" then
            handler(this.itemID, this.droprate, this)
        end
    end
end

---
--- Handles mouse leave events on loot item buttons
--- Hides all active tooltips when mouse cursor leaves the item
--- @return nil
--- @usage AtlasTW.Interactions.Item_OnLeave() -- Called automatically on mouse leave
--- @since 1.0.0
---
function AtlasTW.Interactions.Item_OnLeave()
    -- Hide the necessary tooltips
    if AtlasTWOptions.LootlinkTT then
        AtlasLootTooltip:Hide()
        AtlasLootTooltip2:Hide()
    elseif AtlasTWOptions.LootItemSyncTT then
        if GameTooltip:IsVisible() then
            GameTooltip:Hide()
            AtlasLootTooltip2:Hide()
        end
    else
        if this.itemID ~= nil then
            AtlasLootTooltip:Hide()
            GameTooltip:Hide()
            AtlasLootTooltip2:Hide()
        end
    end

    if ShoppingTooltip2:IsVisible() or ShoppingTooltip1.IsVisible then
        ShoppingTooltip2:Hide()
        ShoppingTooltip1:Hide()
    end
end

---
--- Handles click events on loot item buttons
--- Processes item links, wish list operations, and chat output based on click type
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return nil
--- @usage AtlasTW.Interactions.Item_OnClick("LeftButton") -- Called by item button clicks
--- @since 1.0.0
---
function AtlasTW.Interactions.Item_OnClick(arg1)
    local id = this:GetID()
    local color = string.sub(_G["AtlasLootItem_"..id.."_Name"]:GetText() or "", 1, 10)
    local name = string.sub(_G["AtlasLootItem_"..id.."_Name"]:GetText() or "", 11)
    local texture = AtlasTW.LootUtils.Strsplit("\\", getglobal("AtlasLootItem_"..id.."_Icon"):GetTexture(), 0, true)
    local dataID = AtlasLootItemsFrame.StoredElement
    local instanceKeyClick = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil
    local dataSource = AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKeyClick)

	if this.typeID == "item" then
		local itemName, itemLink, qualityId = GetItemInfo(this.itemID)
		_, _, _, color = GetItemQualityColor(qualityId or 0)
		--If shift-clicked, link in the chat window
		if IsShiftKeyDown() and not itemName and this.itemID ~= 0 then
			if AtlasTWOptions.LootSafeLinks then
				if WIM_EditBoxInFocus then
					WIM_EditBoxInFocus:Insert("["..itemName.."]")
				elseif ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("["..itemName.."]")
				else
					AtlasTW.Interactions.ChatSayItemReagents(this.itemID, nil, itemName, true)
				end
			elseif AtlasTWOptions.LootAllLinks then
				if WIM_EditBoxInFocus then
					WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r")
				elseif ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r")
				else
					AtlasTW.Interactions.ChatSayItemReagents(this.itemID, color, name)
				end
			end
		elseif (itemName and IsShiftKeyDown()) and this.itemID ~= 0 then
			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert(color.."|Hitem:"..this.itemID..":0:0:0|h["..itemName.."]|h|r")
			elseif ( ChatFrameEditBox:IsVisible() ) then
				ChatFrameEditBox:Insert(color.."|Hitem:"..this.itemID..":0:0:0|h["..itemName.."]|h|r")
			end
		--If control-clicked, use the dressing room
		elseif IsControlKeyDown() and itemName then
			DressUpItemLink(itemLink)
		elseif IsAltKeyDown() and this.itemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(this.itemID))
			else
			-- Pass boss and instance context for correct categorization in WishList
			local srcPage = nil
			if dataID and instanceKeyClick then
				srcPage = dataID.."|"..instanceKeyClick
			elseif dataID and AtlasTW.DataResolver.IsLootTableAvailable and AtlasTW.DataResolver.IsLootTableAvailable(dataID) then
				-- Craft/set/other loot table page without instanceKey
				srcPage = dataID
			end
				AtlasLoot_AddToWishlist(this.itemID, dataID, instanceKeyClick, "item", srcPage)
		end
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasTW.LootUtils.Strsplit("|", this.sourcePage)
			-- Normalize Strsplit result (old Lua sometimes returns tables)
			if type(bossName) == "table" then bossName = bossName[1] end
			if type(instanceKey) == "table" then instanceKey = instanceKey[1] end
			local hasLoot = bossName and instanceKey and AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
			-- Fallback: if instanceKey turned out to be display name, not key - convert to key
			if not hasLoot and instanceKey and AtlasTW and AtlasTW.InstanceData and not AtlasTW.InstanceData[instanceKey] then
				for k, v in pairs(AtlasTW.InstanceData) do
					if v and v.Name == instanceKey then
						instanceKey = k
						break
					end
				end
				if bossName and instanceKey then
					hasLoot = AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
				end
			end
			if hasLoot then
				-- Set target boss and instance
				AtlasLootItemsFrame.StoredElement = bossName
				AtlasLootItemsFrame.StoredMenu = instanceKey
				-- Switch AtlasTW dropdown lists to needed instance
				if AtlasTW and AtlasTW.DropDowns and AtlasTWOptions then
					local function FindAndSet(instKey)
						if not (AtlasTW and AtlasTW.DropDowns and instKey) then return false end
						local ddCount = table.getn(AtlasTW.DropDowns)
						for typeIndex = 1, ddCount do
							local dropDownData = AtlasTW.DropDowns[typeIndex]
							if type(dropDownData) == "table" then
								for zoneIndex = 1, table.getn(dropDownData) do
									if dropDownData[zoneIndex] == instKey then
										AtlasTWOptions.AtlasType = typeIndex
										AtlasTWOptions.AtlasZone = zoneIndex
										AtlasTW.Refresh()
										AtlasTW.FrameDropDownTypeOnShow()
										AtlasTW.FrameDropDownOnShow()
										return true
									end
								end
							end
						end
						return false
					end
					if not FindAndSet(instanceKey) then
						if AtlasTW.PopulateDropdowns then
							AtlasTW.PopulateDropdowns()
							FindAndSet(instanceKey)
						end
					end
				end
				-- Highlight boss in left list
				local bossIndex = FindBossIndexInScrollList(bossName)
				if bossIndex then
					AtlasLootItemsFrame.activeElement = bossIndex
					AtlasTW.LootBrowserUI.ScrollBarUpdate()
				else
					AtlasLootItemsFrame.activeElement = nil
				end
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasTW.LootBrowserUI.ShowScrollBarLoading()
				local lootTable = AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
				AtlasTW.LootCache.CacheAllItems(lootTable, function()
					AtlasTW.LootBrowserUI.HideScrollBarLoading()
					AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
				end)
			elseif dataID ~= "SearchResult" and dataID ~= "WishList" and AtlasTW.DataResolver.IsLootTableAvailable(this.sourcePage) then
				-- sourcePage contains only table key (e.g., craft page)
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasTW.LootBrowserUI.ShowScrollBarLoading()
				local lootTable = AtlasLoot_Data[this.sourcePage] or AtlasTW.DataResolver.GetLootByElemName(this.sourcePage)
				AtlasTW.LootCache.CacheAllItems(lootTable, function()
					AtlasTW.LootBrowserUI.HideScrollBarLoading()
					AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
				end)
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
		end
	elseif this.typeID == "enchant" then
		if IsShiftKeyDown() then
			AtlasTW.Interactions.ChatSayItemReagents(this.elemID)
		elseif IsAltKeyDown() and this.elemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.elemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(this.elemID))
			else
				-- Pass boss and instance context for correct categorization in WishList
				local srcPage = nil
				if dataID and instanceKeyClick then
					srcPage = dataID.."|"..instanceKeyClick
				elseif dataID and AtlasTW.DataResolver.IsLootTableAvailable and AtlasTW.DataResolver.IsLootTableAvailable(dataID) then
					-- Craft/set/other loot table page without instanceKey
					srcPage = dataID
				end
				AtlasLoot_AddToWishlist(this.elemID, dataID, instanceKeyClick, "enchant", srcPage)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.itemID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasTW.LootUtils.Strsplit("|", this.sourcePage)
			-- Normalize Strsplit result
			if type(bossName) == "table" then bossName = bossName[1] end
			if type(instanceKey) == "table" then instanceKey = instanceKey[1] end
			local hasLoot = bossName and instanceKey and AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
			if not hasLoot and instanceKey and AtlasTW and AtlasTW.InstanceData and not AtlasTW.InstanceData[instanceKey] then
				for k, v in pairs(AtlasTW.InstanceData) do
					if v and v.Name == instanceKey then
						instanceKey = k
						break
					end
				end
				if bossName and instanceKey then
					hasLoot = AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
				end
			end
			if hasLoot then
				AtlasLootItemsFrame.StoredElement = bossName
				AtlasLootItemsFrame.StoredMenu = instanceKey
				if AtlasTW and AtlasTW.DropDowns and AtlasTWOptions then
					for typeIndex, dropDownData in pairs(AtlasTW.DropDowns) do
						for zoneIndex, zoneKey in pairs(dropDownData) do
							if zoneKey == instanceKey then
								AtlasTWOptions.AtlasType = typeIndex
								AtlasTWOptions.AtlasZone = zoneIndex
								AtlasTW.Refresh()
								AtlasTW.FrameDropDownTypeOnShow()
								AtlasTW.FrameDropDownOnShow()
								break
							end
						end
					end
				end
				local bossIndex = FindBossIndexInScrollList(bossName)
				if bossIndex then
					AtlasLootItemsFrame.activeElement = bossIndex
					AtlasTW.LootBrowserUI.ScrollBarUpdate()
				else
					AtlasLootItemsFrame.activeElement = nil
				end
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasTW.LootBrowserUI.ShowScrollBarLoading()
				local lootTable = AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
				AtlasTW.LootCache.CacheAllItems(lootTable, function()
					AtlasTW.LootBrowserUI.HideScrollBarLoading()
					AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
				end)
			elseif AtlasTW.DataResolver.IsLootTableAvailable(this.sourcePage) then
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				AtlasLootItemsFrame:Show()
				AtlasTW.LootBrowserUI.ShowScrollBarLoading()
				local lootTable = AtlasLoot_Data[this.sourcePage] or AtlasTW.DataResolver.GetLootByElemName(this.sourcePage)
				AtlasTW.LootCache.CacheAllItems(lootTable, function()
					AtlasTW.LootBrowserUI.HideScrollBarLoading()
					AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
				end)
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
		end
	elseif this.typeID == "spell" then
		if IsShiftKeyDown() then
			if this.elemID < 100000 then
				if WIM_EditBoxInFocus then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						WIM_EditBoxInFocus:Insert(AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]))
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						ChatFrameEditBox:Insert(AtlasTW.LootUtils.GetChatLink(craftitem)) -- Fix for Gurky's discord chat bot
					else
						ChatFrameEditBox:Insert(name)
					end
				else
					AtlasTW.Interactions.ChatSayItemReagents(this.elemID)
				end
			else
				if WIM_EditBoxInFocus then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						WIM_EditBoxInFocus:Insert(AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]))
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						ChatFrameEditBox:Insert(AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]))
					else
						ChatFrameEditBox:Insert(name)
					end
				else
					local chatnumber
					if channel == "WHISPER" then
						chatnumber = ChatFrameEditBox.tellTarget
					elseif channel == "CHANNEL" then
						chatnumber = ChatFrameEditBox.channelTarget
					end
					AtlasTW.Interactions.ChatSend(AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]),channel,nil,chatnumber)
				end
			end
		elseif IsAltKeyDown() and this.elemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.elemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(this.elemID))
			else
				-- Pass boss and instance context for correct categorization in WishList
				local srcPage = nil
				if dataID and instanceKeyClick then
					srcPage = dataID.."|"..instanceKeyClick
				elseif dataID and AtlasTW.DataResolver.IsLootTableAvailable and AtlasTW.DataResolver.IsLootTableAvailable(dataID) then
					-- Craft/set/other loot table page without instanceKey
					srcPage = dataID
				end
				AtlasLoot_AddToWishlist(this.elemID, dataID, instanceKeyClick, "spell", srcPage)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.itemID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasTW.LootUtils.Strsplit("|", this.sourcePage)
			-- Normalize Strsplit result: if table of parts returned, extract [1] and [2]
			if type(bossName) == "table" then
				if not instanceKey then instanceKey = bossName[2] end
				bossName = bossName[1]
			end
			if type(instanceKey) == "table" then instanceKey = instanceKey[1] end
			local hasLoot = bossName and instanceKey and AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
			if not hasLoot and instanceKey and AtlasTW and AtlasTW.InstanceData and not AtlasTW.InstanceData[instanceKey] then
				for k, v in pairs(AtlasTW.InstanceData) do
					if v and v.Name == instanceKey then
						instanceKey = k
						break
					end
				end
				if bossName and instanceKey then
					hasLoot = AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
				end
			end
			if hasLoot then
				AtlasLootItemsFrame.StoredElement = bossName
				AtlasLootItemsFrame.StoredMenu = instanceKey
				if AtlasTW and AtlasTW.DropDowns and AtlasTWOptions then
					for typeIndex, dropDownData in pairs(AtlasTW.DropDowns) do
						for zoneIndex, zoneKey in pairs(dropDownData) do
							if zoneKey == instanceKey then
								AtlasTWOptions.AtlasType = typeIndex
								AtlasTWOptions.AtlasZone = zoneIndex
								AtlasTW.Refresh()
								AtlasTW.FrameDropDownTypeOnShow()
								AtlasTW.FrameDropDownOnShow()
								break
							end
						end
					end
				end
				local bossIndex = FindBossIndexInScrollList(bossName)
				if bossIndex then
					AtlasLootItemsFrame.activeElement = bossIndex
					AtlasTW.LootBrowserUI.ScrollBarUpdate()
				else
					AtlasLootItemsFrame.activeElement = nil
				end
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasTW.LootBrowserUI.ShowScrollBarLoading()
				local lootTable = AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
				AtlasTW.LootCache.CacheAllItems(lootTable, function()
					AtlasTW.LootBrowserUI.HideScrollBarLoading()
					AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
				end)
			elseif AtlasTW.DataResolver.IsLootTableAvailable(this.sourcePage) then
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				AtlasLootItemsFrame:Show()
				AtlasTW.LootBrowserUI.ShowScrollBarLoading()
				local lootTable = AtlasLoot_Data[this.sourcePage] or AtlasTW.DataResolver.GetLootByElemName(this.sourcePage)
				AtlasTW.LootCache.CacheAllItems(lootTable, function() 
					AtlasTW.LootBrowserUI.HideScrollBarLoading()
					AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
				end)
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
		end
	end
end

---
--- Handles click events on boss/element buttons in the Atlas frame
--- Shows or hides the loot frame and loads appropriate loot data
--- @param buttonName string Name of the clicked button (unused parameter)
--- @return nil
--- @usage AtlasTW.Interactions.ElementList_OnClick() -- Called by button click events
--- @since 1.0.0
---
function AtlasTW.Interactions.ElementList_OnClick(buttonName)
    -- Reset scroll position to top
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
    AtlasLootScrollBarScrollBar:SetValue(0)

    local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local id = this.idnum
    local elemName = AtlasTW.ScrollList[id].name
    local lootTable = AtlasTW.DataResolver.GetLootByElemName(elemName, zoneID)

    if AtlasLootItemsFrame.activeElement == id then
        AtlasLootItemsFrame:Hide()
        AtlasLootItemsFrame.activeElement = nil
    else
        -- Get the loot table for the element, either by name or by ID
        if lootTable then
            -- Store the loot table, boss name and navigation pages
            AtlasLootItemsFrame.StoredElement = elemName
            AtlasLootItemsFrame.StoredMenu = zoneID
            AtlasLootItemsFrame.activeElement = id

            -- Update the loot display
            AtlasLootItemsFrame:Show()
			AtlasTW.LootBrowserUI.ShowScrollBarLoading()
			AtlasTW.LootCache.CacheAllItems(lootTable, function()
				AtlasTW.LootBrowserUI.HideScrollBarLoading()
				-- Update scrollbar
				AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
			end)
        else
            AtlasLootItemsFrame:Hide()
            AtlasLootItemsFrame.activeElement = nil
        end
    end
    AtlasTW.LootBrowserUI.ScrollBarUpdate()
    if AtlasTW.Quest.UI.InsideAtlasFrame then
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    end
end

---
--- Handles menu item click events in the loot browser
--- Processes container display or loads loot data based on menu selection
--- @param button string Button identifier for the clicked menu item
--- @return nil
--- @usage AtlasTW.Interactions.MenuItem_OnClick("button1") -- Called by menu item clicks
--- @since 1.0.1
---
function AtlasTW.Interactions.MenuItem_OnClick(button)
	if this.container then
		AtlasLoot_ShowContainerFrame()
		return
	end
	-- Reset scroll position to top
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	-- Get the table source and data ID
	local dataID = this.name_orig or this.name
	local TableSource = this.lootpage
	local pagename
 	if this.isheader == nil or this.isheader == false then
		pagename = _G[this:GetName().."_Name"]:GetText()
        -- Reliable instance determination by click name: first try dungeon menu, then button fields
        local effectiveInstanceKey, effectiveFirstBoss
         if type(dataID) == "string" and AtlasTW and AtlasTW.MenuData and AtlasTW.MenuData.Dungeons then
             for _, entry in ipairs(AtlasTW.MenuData.Dungeons) do
                 if entry and entry.name_orig == dataID and entry.lootpage then
                     effectiveInstanceKey = entry.lootpage
                     effectiveFirstBoss = entry.firstBoss
                     break
                 end
             end
         end
         if not effectiveInstanceKey then
             effectiveInstanceKey = this.lootpage
             effectiveFirstBoss = this.firstBoss
         end
        -- If this is a dungeon item with instance data, redirect page to first boss
        if effectiveInstanceKey and effectiveFirstBoss then
            TableSource = effectiveInstanceKey
            pagename = effectiveFirstBoss
            AtlasLootItemsFrame.StoredCurrentInstance = effectiveInstanceKey
            -- Set current instance in dropdown lists for correct navigation (use numeric indices and rebuild if necessary)
            local function FindAndSetAtlasIndicesByInstance(instKey)
                if not (AtlasTW and AtlasTW.DropDowns and instKey) then return false end
                local ddCount = table.getn(AtlasTW.DropDowns)
                for typeIndex = 1, ddCount do
                    local dropDownData = AtlasTW.DropDowns[typeIndex]
                    if type(dropDownData) == "table" then
                        for zoneIndex = 1, table.getn(dropDownData) do
                            if dropDownData[zoneIndex] == instKey then
                                AtlasTWOptions.AtlasType = typeIndex
                                AtlasTWOptions.AtlasZone = zoneIndex
                                AtlasTW.Refresh()
								AtlasTW.FrameDropDownTypeOnShow()
								AtlasTW.FrameDropDownOnShow()
                                return true
                            end
                        end
                    end
                end
                return false
            end
            local matched = FindAndSetAtlasIndicesByInstance(effectiveInstanceKey)
            if not matched then
                if AtlasTW and AtlasTW.PopulateDropdowns then AtlasTW.PopulateDropdowns() end
                matched = FindAndSetAtlasIndicesByInstance(effectiveInstanceKey)
            end
            -- After changing instance, try to select first boss in right list
            if matched and effectiveFirstBoss then
                AtlasLootItemsFrame.activeElement = nil
                if AtlasTW and AtlasTW.ScrollList and AtlasTW.CurrentLine then
                    for i = 1, AtlasTW.CurrentLine do
                        local e = AtlasTW.ScrollList[i]
                        if e then
                            if e.id == effectiveFirstBoss or (type(effectiveFirstBoss) == "string" and (e.name == effectiveFirstBoss or e.line == effectiveFirstBoss)) then
                                AtlasLootItemsFrame.activeElement = i
                                break
                            end
                        end
                    end
                end
                AtlasTW.LootBrowserUI.ScrollBarUpdate()
            end
        end

		pagename = AtlasTW.LootUtils.StripFormatting(pagename)
		dataID = AtlasTW.LootUtils.StripFormatting(dataID)
		CloseDropDownMenus()

		AtlasLootItemsFrame:Show()
		AtlasTW.LootBrowserUI.ShowScrollBarLoading()
		pagename = pagename == L["Rare Mobs"] and L["Shade Mage"] or pagename
		-- Remember parent menu for "Back" button
		local prevStored = AtlasLootItemsFrame.StoredElement
		if type(prevStored) == "table" and prevStored.menuName then
			AtlasLootItemsFrame.StoredBackMenuName = prevStored.menuName
		end
		--Store the loot table and boss name
		AtlasLootItemsFrame.StoredElement = pagename
		AtlasLootItemsFrame.StoredMenu = TableSource
		local newTable = nil
		if type(TableSource) == "table" then
			newTable = TableSource
		elseif type(TableSource) == "string" then
			-- 1) Direct key in AtlasLoot_Data
			newTable = AtlasLoot_Data[TableSource]
			-- 2) Try to get by selected element name within instance
			if not newTable and type(pagename) == "string" then
				newTable = AtlasTW.DataResolver.GetLootByElemName(pagename, TableSource)
			end
			-- 3) Try globally by name
			if not newTable and type(pagename) == "string" then
				newTable = AtlasTW.DataResolver.GetLootByElemName(pagename)
			end
			-- 4) Last resort: try by TableSource itself
			if not newTable then
				newTable = AtlasTW.DataResolver.GetLootByElemName(TableSource)
			end
		end
		AtlasTW.LootCache.CacheAllItems(newTable, function()
			AtlasTW.LootBrowserUI.HideScrollBarLoading()
			AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
		end)
		AtlasLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(pagename, 30))
		AtlasLootItemsFrame_SelectedCategory:Show()
	end
end

---
--- Handles navigation button clicks (Previous, Next, Back)
--- Processes navigation between loot pages and menu sections
--- @return nil
--- @usage AtlasTW.Interactions.NavButton_OnClick() -- Called by navigation button clicks
--- @since 1.0.1
---
function AtlasTW.Interactions.NavButton_OnClick()
    -- Reset scroll on navigation
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)

	if not this or not this.lootpage then
		return print("NavButton_OnClick: out - no this or lootpage")
	end

	-- Handle "Back" button to parent menu (case insensitive + fallback from title)
	if this == _G["AtlasLootItemsFrame_BACK"] then
		local lpLower = string.lower(this.lootpage or "")
		if lpLower == "backtomenu" then
			local targetMenu = AtlasLootItemsFrame.StoredBackMenuName or this.title
			--print("Return to menu: "..tostring(targetMenu))
			if targetMenu then
				AtlasLoot_OpenMenu(targetMenu)
				AtlasLootItemsFrame.StoredBackMenuName = nil
			else
				_G["AtlasLootItemsFrame_BACK"]:Hide()
			end
			return
		end
	end

	-- Handle "Back" button to dungeons menu
	if this == _G["AtlasLootItemsFrame_BACK"] and this.lootpage == "DUNGEONSMENU" then
		AtlasLoot_OpenMenu(L["Dungeons & Raids"])
		return
	end

	local lp = this.lootpage

	-- Check if this is rare mobs navigation
	local isRareMobNavigation = false
	local rareMobsData = AtlasTW.InstanceData.RareMobs
	if rareMobsData and rareMobsData.Bosses then
		for _, bossData in ipairs(rareMobsData.Bosses) do
			if bossData.name == lp then
				isRareMobNavigation = true
				break
			end
		end
	end

	-- Default: handle as loot/boss page
	AtlasLootItemsFrame:Show()
	AtlasTW.LootBrowserUI.ShowScrollBarLoading()
	AtlasLootItemsFrame.StoredElement = this.title or lp
	-- For rare mobs don't change StoredMenu, for others - set lp
	if isRareMobNavigation then
		AtlasLootItemsFrame.StoredBackMenuName = L["World"]
	else
		AtlasLootItemsFrame.StoredMenu = lp
	end
-------------------------------------
	-- Find boss index in ScrollList and update activeElement
	local bossIndex = FindBossIndexInScrollList(lp)
	if bossIndex then
		AtlasLootItemsFrame.activeElement = bossIndex
		-- Update boss list display
		AtlasTW.LootBrowserUI.ScrollBarUpdate()
	else
		AtlasLootItemsFrame.activeElement = nil
	end

	-- Get loot data
	local lootData = nil
	if isRareMobNavigation then
		-- For rare mobs search data in RareMobs
		for _, bossData in ipairs(rareMobsData.Bosses) do
			if bossData.name == lp then
				lootData = bossData.items
				break
			end
		end
	else
		-- Normal logic for other bosses
		if type(lp) == "table" then
			lootData = lp
		elseif type(lp) == "string" then
			lootData = AtlasLoot_Data[lp]
			if not lootData and type(this.title) == "string" then
				lootData = AtlasTW.DataResolver.GetLootByElemName(this.title, lp)
			end
			if not lootData and type(this.title) == "string" then
				lootData = AtlasTW.DataResolver.GetLootByElemName(this.title)
			end
			if not lootData then
				lootData = AtlasTW.DataResolver.GetLootByElemName(lp)
			end
		end
	end

	AtlasTW.LootCache.CacheAllItems(lootData, function()
		AtlasTW.LootBrowserUI.HideScrollBarLoading()
		AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
	end)
	-- Update title text
	local title = this.title or lp
	if title then
		AtlasLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(title, 30))
		AtlasLootItemsFrame_SelectedCategory:Show()
	end
end

---
--- Handles close button click on the loot items frame
--- Resets active element selection and updates boss button display states
--- @return nil
--- @usage AtlasTW.Interactions.OnCloseButton() -- Called by close button click
--- @since 1.0.0
---
function AtlasTW.Interactions.OnCloseButton()
    -- Set no loot table as currently selected
    AtlasLootItemsFrame.activeElement = nil

    -- Fix the boss buttons so the correct icons are displayed
    if AtlasFrame and AtlasFrame:IsVisible() then
        if AtlasTW.CurrentLine then
            for i = 1, AtlasTW.CurrentLine do
                if _G["AtlasBossLine"..i.."_Selected"]:IsVisible() then
                    _G["AtlasBossLine"..i.."_Selected"]:Hide()
                    _G["AtlasBossLine"..i.."_Loot"]:Show()
                end
            end
        end
    end

    -- Hide the item frame
    AtlasLootItemsFrame:Hide()
end

---
--- Handles click events on container items
--- Processes item links and chat output for container items
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return nil
--- @usage AtlasTW.Interactions.ContainerItem_OnClick("LeftButton") -- Called by container item clicks
--- @since 1.0.1
---
function AtlasTW.Interactions.ContainerItem_OnClick(arg1)
    local itemID = this:GetID()
    local name, link, quality, _, _, _, _, _, tex = GetItemInfo(itemID)
    local _, _, _, color = GetItemQualityColor(quality)
    tex = string.gsub(tex, "Interface\\Icons\\", "")

    if IsShiftKeyDown() and arg1 == "LeftButton" then
        if AtlasTWOptions.LootAllLinks then
            if WIM_EditBoxInFocus then
                WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..itemID.."\124h["..name.."]|h|r")
            elseif ChatFrameEditBox:IsVisible() then
                ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..itemID.."\124h["..name.."]|h|r")
            end
        end
    elseif IsControlKeyDown() and name then
        DressUpItemLink(link)
    elseif IsAltKeyDown() and itemID ~= 0 then
        local ElemName = AtlasLootItemsFrame.StoredElement
        local instKey = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil

        if ElemName == "WishList" then
            AtlasLoot_DeleteFromWishList(this.itemID)
        elseif ElemName == "SearchResult" then
            AtlasLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(itemID))
        else
            local srcPage = nil
            if ElemName and instKey then
                srcPage = ElemName.."|"..instKey
            elseif ElemName and AtlasTW.DataResolver.IsLootTableAvailable and AtlasTW.DataResolver.IsLootTableAvailable(ElemName) then
                -- Craft/set/other loot table page without instanceKey
                srcPage = ElemName
            end
            AtlasLoot_AddToWishlist(itemID, ElemName, instKey, "item", srcPage)
        end
    end
end