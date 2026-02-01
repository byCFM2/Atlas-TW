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
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.Interactions = AtlasTW.Interactions or {}

-- Local references for performance
local L = AtlasTW.Localization.UI
local LM = AtlasTW.Localization.MapData

local WHITE = AtlasTW.Colors.WHITE
local BLUE = AtlasTW.Colors.BLUE
local YELLOW = AtlasTW.Colors.YELLOW2

---
--- Determines default chat channel and target, considering WIM activity and ChatFrame state
--- @return string, string|nil, table channel, target, wimActivityList
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
--- @return nil
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
				craftnumber = type(quantity) == "table" and (quantity[1] .. "-" .. quantity[2] .. "x") or
					(quantity .. "x")
			end

			local craftMessage = L["To craft "] ..
				craftnumber .. AtlasTW.LootUtils.GetChatLink(craftitem) .. L[" the following reagents are needed:"]
			AtlasTW.Interactions.ChatSend(craftMessage, channel, chatnumber)

			local chatline, itemCount = "", 0
			local reagents = spellData.reagents
			if reagents then
				local n = table.getn(reagents)
				for j = 1, n do
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
				local n = table.getn(reagents)
				for j = 1, n do
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
		local enchantLink = YELLOW .. "|Henchant:" .. id .. ":0:0:0|h[" .. (enchantName or "Enchant") .. "]|h|r"

		local message
		if enchantItem then
			message = L["To craft "] ..
				AtlasTW.LootUtils.GetChatLink(enchantItem) .. L[" you need this: "] .. enchantLink
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
			itemMessage = "\124" ..
				string.sub(color or WHITE, 2) ..
				"\124Hitem:" .. id .. ":0:0:0\124h[" .. (name or tostring(id)) .. "]\124h\124r"
		end
		AtlasTW.Interactions.ChatSend(itemMessage, channel, chatnumber)
	end
end

-- Local table for building material strings to reduce GC pressure
local materialStrings = {}

-- Helper function to create materials string (tools/reagents)
local function BuildMaterialString(materials, isReagent)
	if not materials or type(materials) ~= "table" then
		return ""
	end

	-- Clear previous values using table.setn for 1.12 compatibility
	for k in pairs(materialStrings) do materialStrings[k] = nil end
	table.setn(materialStrings, 0)

	local m = table.getn(materials)
	for i = 1, m do
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
	AtlasTWLootTooltip:SetOwner(anchor, "ANCHOR_NONE")
	AtlasTWLootTooltip:SetPoint("BOTTOMLEFT", anchor, "TOPRIGHT", -(anchor:GetWidth() / 2), 24)
	AtlasTWLootTooltip:ClearLines()

	-- Data-driven structure for tooltip lines
	local tooltipLines = {
		{ text = link.name },
		{ text = link.requires,                            prefix = WHITE .. L["Requires"] .. ": " },
		{ text = BuildMaterialString(link.tools),          prefix = WHITE .. L["Tools: "],         wrap = true },
		{ text = BuildMaterialString(link.reagents, true), prefix = WHITE .. L["Reagents: "],      wrap = true },
		{ text = link.text,                                wrap = true },
	}

	-- Dynamic addition of lines to tooltip
	local n = table.getn(tooltipLines)
	for i = 1, n do
		local lineInfo = tooltipLines[i]
		if lineInfo.text and lineInfo.text ~= "" then
			AtlasTWLootTooltip:AddLine((lineInfo.prefix or "") .. lineInfo.text, nil, nil, nil, lineInfo.wrap)
		end
	end

	-- Add spell ID if option is enabled
	if AtlasTWOptions.TooltipShowID then
		local spellID = GetDisplaySpellID(elemID)
		AtlasTWLootTooltip:AddLine(BLUE .. L["SpellID:"] .. " " .. spellID, nil, nil, nil, true)
	end

	AtlasTWLootTooltip:Show()
end

-- Main function for displaying crafted item tooltip
local function ShowCraftedItemTooltip(link, anchorTooltip, anchorFrame)
	local itemID = link.item
	if not itemID then return end
	AtlasTWLootTooltip2:SetOwner(anchorFrame, "ANCHOR_NONE")
	AtlasTWLootTooltip2:SetPoint("TOPLEFT", anchorTooltip, "BOTTOMLEFT", 0, 0)
	AtlasTWLootTooltip2:ClearLines()
	AtlasTWLootTooltip2:SetHyperlink("item:" .. itemID .. ":0:0:0")
	if link.extra then
		AtlasTWLootTooltip2:AddLine(link.extra, nil, nil, nil, true)
	end
	if AtlasTWOptions.TooltipShowID then
		AtlasTWLootTooltip2:AddLine(BLUE .. L["ItemID:"] .. " " .. itemID, nil, nil, nil, true)
	end
	AtlasTWLootTooltip2:Show()
end

--[[
  Унифицированная модульная система для обработки тултипов
]]
-- Handler for "spell" type
local function HandleSpellTooltip(elemID, anchor)
	local link = AtlasTW.SpellDB.craftspells[elemID]
	if not link then
		-- PrintA("AtlasTWLoot Error: Missing spell data for ID: " .. tostring(elemID))
		return
	end
	ShowSpellTooltip(link, elemID, anchor)
	ShowCraftedItemTooltip(link, AtlasTWLootTooltip, anchor)
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
			PrintA(L["Old version of SuperWoW detected..."])
			messageShown = true
		end
	end

	AtlasTWLootTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
	AtlasTWLootTooltip:SetHyperlink(enchantLink)

	if AtlasTWOptions.TooltipShowID then
		AtlasTWLootTooltip:AddLine(BLUE .. L["SpellID:"] .. " " .. spellID, nil, nil, nil, 1)
	end
	AtlasTWLootTooltip:Show()

	-- Show linked item if it exists
	local enchantData = AtlasTW.SpellDB.enchants[spellID]
	if enchantData and enchantData.item then
		ShowCraftedItemTooltip(enchantData, AtlasTWLootTooltip, anchor)
	end
end

-- Handler for "item" type
local function HandleItemTooltip(itemID, dropRate, anchor)
	AtlasTWLootTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
	AtlasTWLootTooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
	if dropRate then
		AtlasTWLootTooltip:AddLine(L["Drop Rate:"] .. " " .. dropRate, 0, .5, .7)
	end
	if AtlasTWOptions.TooltipShowID then
		AtlasTWLootTooltip:AddLine(L["ItemID:"] .. " " .. itemID, 0, .5, .7)
	end
	AtlasTWLootTooltip:Show()
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

	local n = table.getn(AtlasTW.ScrollList)
	for i = 1, n do
		local entry = AtlasTW.ScrollList[i]
		if entry and (entry.id == bossIdOrName or entry.name == bossIdOrName) then
			--PrintA("FindBossIndexInScrollList: found boss " .. tostring(bossIdOrName) .. " at index " .. tostring(i))
			return i
		end
	end

	--PrintA("FindBossIndexInScrollList: boss " .. tostring(bossIdOrName) .. " not found in ScrollList")
	return nil
end

---
--- Builds the sourcePage value for adding items to WishList
--- Handles both regular boss pages and menu pages (where StoredElement may be a table)
--- @param dataID string|table The current StoredElement (boss name, table key, or menu table)
--- @param instanceKey string|nil The current StoredMenu (instance key or menu function name)
--- @return string|nil The constructed sourcePage, or nil if unable to determine
--- @usage local srcPage = BuildSourcePage("Ragnaros", "MoltenCore") -- returns "Ragnaros|MoltenCore"
---
local function BuildSourcePage(dataID, instanceKey)
	-- Case 1: Menu page - StoredElement is a table with menuName
	-- This happens when viewing the menu listing, not a specific crafting page
	if type(dataID) == "table" and dataID.menuName then
		-- When on a menu page, instanceKey contains the menu function name
		-- We cannot construct a meaningful sourcePage from here because
		-- the user is viewing a menu, not a specific loot page
		return nil
	end

	-- Case 2: Both dataID and instanceKey are strings
	if type(dataID) == "string" and type(instanceKey) == "string" then
		-- Check if instanceKey is an INSTANCE key (found in InstanceData)
		-- Instance keys are like "MoltenCore", "BlackwingLair", etc.
		if AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[instanceKey] then
			-- This is a boss page like "Ragnaros|MoltenCore"
			return dataID .. "|" .. instanceKey
		end

		-- instanceKey is NOT an instance - could be menu function name or craft page key
		-- Check if instanceKey is a direct loot table key (craft page like "Leatherworking5")
		if AtlasTWLoot_Data and AtlasTWLoot_Data[instanceKey] then
			-- For craft pages, return just the table key
			return instanceKey
		end

		-- Check if dataID itself is a loot table key
		if AtlasTWLoot_Data and AtlasTWLoot_Data[dataID] then
			return dataID
		end
	end

	-- Case 3: Direct loot table page (craft, sets, etc.) - dataID is string, no valid instanceKey
	if type(dataID) == "string" and AtlasTWLoot_Data and AtlasTWLoot_Data[dataID] then
		return dataID
	end

	return nil
end

---
--- Unified navigation helper for navigating from WishList/SearchResult to source page
--- Handles both menu pages (direct loot table keys) and boss pages (boss|instance format)
--- @param sourcePage string The source page identifier (can be "bossName|instanceKey" or just "lootTableKey")
--- @return boolean True if navigation was successful, false otherwise
--- @usage local success = NavigateFromSourcePage("Alchemy1") -- Navigate to crafting page
---
local function NavigateFromSourcePage(sourcePage)
	if not sourcePage or sourcePage == "" then
		return false
	end

	-- First check: Is this a direct loot table key (craft page, menu page, etc) without the | delimiter?
	-- This handles menu pages like crafting, sets, etc.
	if not string.find(sourcePage, "|") then
		if AtlasTW.DataResolver.IsLootTableAvailable(sourcePage) then
			AtlasTWLootItemsFrame.StoredElement = sourcePage
			AtlasTWLootItemsFrame.StoredMenu = nil
			AtlasTWLootItemsFrame.activeElement = nil
			AtlasTWLootItemsFrame:Show()
			AtlasTW.LootBrowserUI.ShowScrollBarLoading()
			local lootTable = AtlasTWLoot_Data[sourcePage] or AtlasTW.DataResolver.GetLootByElemName(sourcePage)
			AtlasTW.LootCache.CacheAllItems(lootTable, function()
				AtlasTW.LootBrowserUI.HideScrollBarLoading()
				AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
			end)
			return true
		end
		return false
	end

	-- Second check: Parse boss|instance format
	local bossName, instanceKey = AtlasTW.LootUtils.Strsplit("|", sourcePage)
	-- Normalize Strsplit result (old Lua sometimes returns tables)
	if type(bossName) == "table" then
		if not instanceKey then instanceKey = bossName[2] end
		bossName = bossName[1]
	end
	if type(instanceKey) == "table" then instanceKey = instanceKey[1] end

	-- Check if we have valid data
	if not bossName or not instanceKey then
		return false
	end

	-- Try to get loot data
	local hasLoot = AtlasTW.DataResolver.GetLootByElemName and
		AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)

	-- Fallback: if instanceKey turned out to be display name, not key - convert to key
	if not hasLoot and instanceKey and AtlasTW and AtlasTW.InstanceData and not AtlasTW.InstanceData[instanceKey] then
		for k, v in pairs(AtlasTW.InstanceData) do
			if v and v.Name == instanceKey then
				instanceKey = k
				break
			end
		end
		if bossName and instanceKey then
			hasLoot = AtlasTW.DataResolver.GetLootByElemName and
				AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
		end
	end

	if not hasLoot then
		return false
	end

	-- Set target boss and instance
	AtlasTWLootItemsFrame.StoredElement = bossName
	AtlasTWLootItemsFrame.StoredMenu = instanceKey

	-- Switch AtlasTW dropdown lists to needed instance
	if AtlasTW and AtlasTW.DropDowns and AtlasTWOptions then
		local function FindAndSet(instKey)
			if not (AtlasTW and AtlasTW.DropDowns and instKey) then return false end
			local ddCount = table.getn(AtlasTW.DropDowns)
			for typeIndex = 1, ddCount do
				local dropDownData = AtlasTW.DropDowns[typeIndex]
				if type(dropDownData) == "table" then
					local n = table.getn(dropDownData)
					for zoneIndex = 1, n do
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
		AtlasTWLootItemsFrame.activeElement = bossIndex
		AtlasTW.LootBrowserUI.ScrollBarUpdate()
	else
		AtlasTWLootItemsFrame.activeElement = nil
	end

	-- Cache entire page before updating
	AtlasTWLootItemsFrame:Show()
	AtlasTW.LootBrowserUI.ShowScrollBarLoading()
	local lootTable = AtlasTW.DataResolver.GetLootByElemName(bossName, instanceKey)
	AtlasTW.LootCache.CacheAllItems(lootTable, function()
		AtlasTW.LootBrowserUI.HideScrollBarLoading()
		AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
	end)

	return true
end

---
--- Generates a chat link for an item
--- Creates properly formatted item links for chat output
--- @param id number Item ID to create link for
--- @return string Formatted chat link
--- @usage local link = AtlasTW.Interactions.GetChatLink(12345)
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
---
function AtlasTW.Interactions.Item_OnLeave()
	-- Hide the necessary tooltips
	if AtlasTWOptions.LootlinkTT then
		AtlasTWLootTooltip:Hide()
		AtlasTWLootTooltip2:Hide()
	elseif AtlasTWOptions.LootItemSyncTT then
		if GameTooltip:IsVisible() then
			GameTooltip:Hide()
			AtlasTWLootTooltip2:Hide()
		end
	else
		if this.itemID ~= nil then
			AtlasTWLootTooltip:Hide()
			GameTooltip:Hide()
			AtlasTWLootTooltip2:Hide()
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
---
function AtlasTW.Interactions.Item_OnClick(arg1)
	local id = this:GetID()
	local fullname = _G["AtlasTWLootItem_" .. id .. "_Name"]:GetText() or ""
	local color = string.sub(fullname, 1, 10)
	local name = string.sub(fullname, 11)
	--  local texture = AtlasTW.LootUtils.Strsplit("\\", getglobal("AtlasTWLootItem_"..id.."_Icon"):GetTexture(), 0, true)
	local dataID = AtlasTWLootItemsFrame.StoredElement
	local instanceKeyClick = AtlasTWLootItemsFrame and AtlasTWLootItemsFrame.StoredMenu or nil
	--  local dataSource = AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKeyClick)

	if arg1 == "RightButton" and not IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
		if fullname then
			AtlasTW.Integrations.SearchPfQuest(fullname)
		end
		return
	end

	if this.typeID == "item" then
		local itemid = this.itemID
		local itemName, itemLink, qualityId = GetItemInfo(itemid)
		_, _, _, color = GetItemQualityColor(qualityId or 0)
		--If shift-clicked, link in the chat window
		if IsShiftKeyDown() and not itemName and itemid ~= 0 then
			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert("[ItemID" .. itemid .. "]")
			elseif ChatFrameEditBox:IsVisible() then
				ChatFrameEditBox:Insert("[ItemID:" .. itemid .. "]")
			else
				AtlasTW.Interactions.ChatSayItemReagents(itemid, nil, itemName, true)
			end
		elseif (itemName and IsShiftKeyDown()) and itemid ~= 0 then
			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert(color .. "|Hitem:" .. itemid .. ":0:0:0|h[" .. itemName .. "]|h|r")
			elseif (ChatFrameEditBox:IsVisible()) then
				ChatFrameEditBox:Insert(color .. "|Hitem:" .. itemid .. ":0:0:0|h[" .. itemName .. "]|h|r")
			end
			--If control-clicked, use the dressing room
		elseif IsControlKeyDown() and itemName then
			DressUpItemLink(itemLink)
		elseif IsAltKeyDown() and itemid ~= 0 then
			if dataID == "WishList" then
				AtlasTWLoot_DeleteFromWishList(itemid)
			elseif dataID == "SearchResult" then
				AtlasTWLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(itemid, "item"))
			else
				-- Pass boss and instance context for correct categorization in WishList
				local srcPage = BuildSourcePage(dataID, instanceKeyClick)
				AtlasTWLoot_AddToWishlist(this.itemID, dataID, instanceKeyClick, "item", srcPage)
			end
		elseif (dataID == "SearchResult" or dataID == "WishList") then
			-- Use unified navigation helper
			NavigateFromSourcePage(this.sourcePage)
		elseif this.container and arg1 == "LeftButton" then
			AtlasTWLoot_ShowContainerFrame()
		end
	elseif this.typeID == "enchant" then
		local elemid = this.elemID
		if IsShiftKeyDown() then
			local itemid = AtlasTW.SpellDB.enchants[elemid]["item"]
			local itemlink = itemid and AtlasTW.LootUtils.GetChatLink(itemid)
			local enchantName = AtlasTW.SpellDB.enchants[elemid]["name"] or GetItemInfo(itemid)
			local enchantLink = YELLOW .. "|Henchant:" .. id .. ":0:0:0|h[" .. (enchantName or "Enchant") .. "]|h|r"

			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert(itemlink or enchantLink)
			elseif ChatFrameEditBox:IsVisible() then
				ChatFrameEditBox:Insert(itemlink or enchantLink)
			else
				AtlasTW.Interactions.ChatSayItemReagents(elemid)
			end
		elseif IsAltKeyDown() and elemid ~= 0 then
			if dataID == "WishList" then
				AtlasTWLoot_DeleteFromWishList(elemid)
			elseif dataID == "SearchResult" then
				AtlasTWLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(elemid, "enchant"))
			else
				-- Pass boss and instance context for correct categorization in WishList
				local srcPage = BuildSourcePage(dataID, instanceKeyClick)
				AtlasTWLoot_AddToWishlist(elemid, dataID, instanceKeyClick, "enchant", srcPage)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:" .. this.itemID .. ":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") then
			-- Use unified navigation helper
			NavigateFromSourcePage(this.sourcePage)
		elseif this.container and arg1 == "LeftButton" then
			AtlasTWLoot_ShowContainerFrame()
		end
	elseif this.typeID == "spell" then
		if IsShiftKeyDown() then
			if this.elemID < 100000 then
				if WIM_EditBoxInFocus then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						WIM_EditBoxInFocus:Insert(AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"]
							[this.elemID]["item"]))
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
						WIM_EditBoxInFocus:Insert(AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"]
							[this.elemID]["item"]))
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						ChatFrameEditBox:Insert(AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"]
							[this.elemID]["item"]))
					else
						ChatFrameEditBox:Insert(name)
					end
				else
					local channel, chatnumber = AtlasTW.Interactions.ChatGetDefaultChannelTarget()
					AtlasTW.Interactions.ChatSend(
						AtlasTW.LootUtils.GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]), channel,
						chatnumber)
				end
			end
		elseif IsAltKeyDown() and this.elemID ~= 0 then
			if dataID == "WishList" then
				AtlasTWLoot_DeleteFromWishList(this.elemID)
			elseif dataID == "SearchResult" then
				AtlasTWLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(this.elemID, "spell"))
			else
				-- Pass boss and instance context for correct categorization in WishList
				local srcPage = BuildSourcePage(dataID, instanceKeyClick)
				AtlasTWLoot_AddToWishlist(this.elemID, dataID, instanceKeyClick, "spell", srcPage)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:" .. this.itemID .. ":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") then
			-- Use unified navigation helper
			NavigateFromSourcePage(this.sourcePage)
		elseif this.container and arg1 == "LeftButton" then
			AtlasTWLoot_ShowContainerFrame()
		end
	end
end

---
--- Handles click events on boss/element buttons in the Atlas frame
--- Shows or hides the loot frame and loads appropriate loot data
--- @param buttonName string Name of the clicked button (unused parameter)
--- @return nil
--- @usage AtlasTW.Interactions.ElementList_OnClick() -- Called by button click events
---
function AtlasTW.Interactions.ElementList_OnClick(buttonName)
	-- Reset scroll position to top
	FauxScrollFrame_SetOffset(AtlasTWLootScrollBar, 0)
	AtlasTWLootScrollBarScrollBar:SetValue(0)

	local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
	local id = this.idnum
	local elemName = AtlasTW.ScrollList[id].name
	local lootTable = AtlasTW.DataResolver.GetLootByElemName(elemName, zoneID)

	if AtlasTWLootItemsFrame.activeElement == id then
		AtlasTWLootItemsFrame:Hide()
		AtlasTWLootItemsFrame.activeElement = nil
	else
		-- Get the loot table for the element, either by name or by ID
		if lootTable then
			-- Store the loot table, boss name and navigation pages
			AtlasTWLootItemsFrame.StoredElement = elemName
			AtlasTWLootItemsFrame.StoredMenu = zoneID
			AtlasTWLootItemsFrame.activeElement = id

			-- Update the loot display
			AtlasTWLootItemsFrame:Show()
			AtlasTW.LootBrowserUI.ShowScrollBarLoading()
			AtlasTW.LootCache.CacheAllItems(lootTable, function()
				AtlasTW.LootBrowserUI.HideScrollBarLoading()
				-- Update scrollbar
				AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
			end)
		else
			AtlasTWLootItemsFrame:Hide()
			AtlasTWLootItemsFrame.activeElement = nil
		end
	end
	AtlasTW.LootBrowserUI.ScrollBarUpdate()
	if AtlasTW.Quest.UI.InsideAtlasFrame then
		AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
	end
end

-- Helper function to set current instance in dropdown lists for correct navigation
local function FindAndSetAtlasIndicesByInstance(instKey)
	if not (AtlasTW and AtlasTW.DropDowns and instKey) then return false end
	local ddCount = table.getn(AtlasTW.DropDowns)
	for typeIndex = 1, ddCount do
		local dropDownData = AtlasTW.DropDowns[typeIndex]
		if type(dropDownData) == "table" then
			local n = table.getn(dropDownData)
			for zoneIndex = 1, n do
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

---
--- Handles menu item click events in the loot browser
--- Processes container display or loads loot data based on menu selection
--- @param button string Button identifier for the clicked menu item
--- @return nil
--- @usage AtlasTW.Interactions.MenuItem_OnClick("button1") -- Called by menu item clicks
---
function AtlasTW.Interactions.MenuItem_OnClick(button)
	if this.container then
		AtlasTWLoot_ShowContainerFrame()
		return
	end
	-- Reset scroll position to top
	FauxScrollFrame_SetOffset(AtlasTWLootScrollBar, 0)
	-- Get the table source and data ID
	local dataID = this.name_orig or this.name
	local TableSource = this.lootpage
	local pagename
	if this.isheader == nil or this.isheader == false then
		pagename = _G[this:GetName() .. "_Name"]:GetText()
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
			AtlasTWLootItemsFrame.StoredCurrentInstance = effectiveInstanceKey
			-- Set current instance in dropdown lists
			local matched = FindAndSetAtlasIndicesByInstance(effectiveInstanceKey)
			if not matched then
				if AtlasTW and AtlasTW.PopulateDropdowns then AtlasTW.PopulateDropdowns() end
				matched = FindAndSetAtlasIndicesByInstance(effectiveInstanceKey)
			end
			-- After changing instance, try to select first boss in right list
			if matched and effectiveFirstBoss then
				AtlasTWLootItemsFrame.activeElement = nil
				if AtlasTW and AtlasTW.ScrollList and AtlasTW.CurrentLine then
					for i = 1, AtlasTW.CurrentLine do
						local e = AtlasTW.ScrollList[i]
						if e then
							if e.id == effectiveFirstBoss or (type(effectiveFirstBoss) == "string" and (e.name == effectiveFirstBoss or e.line == effectiveFirstBoss)) then
								AtlasTWLootItemsFrame.activeElement = i
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

		AtlasTWLootItemsFrame:Show()
		AtlasTW.LootBrowserUI.ShowScrollBarLoading()
		pagename = pagename == L["Rare Mobs"] and LM["Shade Mage"] or pagename
		-- Remember parent menu for "Back" button
		local prevStored = AtlasTWLootItemsFrame.StoredElement
		if type(prevStored) == "table" and prevStored.menuName then
			AtlasTWLootItemsFrame.StoredBackMenuName = prevStored.menuName
		end
		--Store the loot table and boss name
		AtlasTWLootItemsFrame.StoredElement = pagename
		AtlasTWLootItemsFrame.StoredMenu = TableSource
		local newTable = nil
		if type(TableSource) == "table" then
			newTable = TableSource
		elseif type(TableSource) == "string" then
			-- 1) Direct key in AtlasTWLoot_Data
			newTable = AtlasTWLoot_Data[TableSource]
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
		AtlasTWLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(pagename, 30))
		AtlasTWLootItemsFrame_SelectedCategory:Show()
	end
end

---
--- Handles navigation button clicks (Previous, Next, Back)
--- Processes navigation between loot pages and menu sections
--- @return nil
--- @usage AtlasTW.Interactions.NavButton_OnClick() -- Called by navigation button clicks
---
function AtlasTW.Interactions.NavButton_OnClick()
	-- Reset scroll on navigation
	FauxScrollFrame_SetOffset(AtlasTWLootScrollBar, 0)
	AtlasTWLootScrollBarScrollBar:SetValue(0)

	if not this or not this.lootpage then
		return PrintA("NavButton_OnClick: out - no this or lootpage")
	end

	-- Handle "Back" button to parent menu (case insensitive + fallback from title)
	if this == _G["AtlasTWLootItemsFrame_BACK"] then
		local lpLower = string.lower(this.lootpage or "")
		if lpLower == "backtomenu" then
			local targetMenu = AtlasTWLootItemsFrame.StoredBackMenuName or this.title
			--PrintA("Return to menu: "..tostring(targetMenu))
			if targetMenu then
				AtlasTWLoot_OpenMenu(targetMenu)
				AtlasTWLootItemsFrame.StoredBackMenuName = nil
			else
				_G["AtlasTWLootItemsFrame_BACK"]:Hide()
			end
			return
		end
	end

	-- Handle "Back" button to dungeons menu
	if this == _G["AtlasTWLootItemsFrame_BACK"] and this.lootpage == "DUNGEONSMENU" then
		AtlasTWLoot_OpenMenu(L["Dungeons & Raids"])
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
	AtlasTWLootItemsFrame:Show()
	AtlasTW.LootBrowserUI.ShowScrollBarLoading()
	AtlasTWLootItemsFrame.StoredElement = this.title or lp
	-- For rare mobs don't change StoredMenu, for others - set lp
	if isRareMobNavigation then
		AtlasTWLootItemsFrame.StoredBackMenuName = L["World"]
	else
		AtlasTWLootItemsFrame.StoredMenu = lp
	end
	-------------------------------------
	-- Find boss index in ScrollList and update activeElement
	local bossIndex = FindBossIndexInScrollList(lp)
	if bossIndex then
		AtlasTWLootItemsFrame.activeElement = bossIndex
		-- Update boss list display
		AtlasTW.LootBrowserUI.ScrollBarUpdate()
	else
		AtlasTWLootItemsFrame.activeElement = nil
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
			lootData = AtlasTWLoot_Data[lp]
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
		AtlasTWLootItemsFrame_SelectedCategory:SetText(AtlasTW.LootUtils.TruncateText(title, 30))
		AtlasTWLootItemsFrame_SelectedCategory:Show()
	end
end

---
--- Handles close button click on the loot items frame
--- Resets active element selection and updates boss button display states
--- @return nil
--- @usage AtlasTW.Interactions.OnCloseButton() -- Called by close button click
---
function AtlasTW.Interactions.OnCloseButton()
	-- Set no loot table as currently selected
	AtlasTWLootItemsFrame.activeElement = nil

	-- Fix the boss buttons so the correct icons are displayed
	if AtlasTWFrame and AtlasTWFrame:IsVisible() then
		if AtlasTW.CurrentLine then
			for i = 1, AtlasTW.CurrentLine do
				if _G["AtlasTWBossLine" .. i .. "_Selected"]:IsVisible() then
					_G["AtlasTWBossLine" .. i .. "_Selected"]:Hide()
					_G["AtlasTWBossLine" .. i .. "_Loot"]:Show()
				end
			end
		end
	end

	-- Hide the item frame
	AtlasTWLootItemsFrame:Hide()
end

---
--- Handles click events on container items
--- Processes item links and chat output for container items
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return nil
--- @usage AtlasTW.Interactions.ContainerItem_OnClick("LeftButton") -- Called by container item clicks
---
function AtlasTW.Interactions.ContainerItem_OnClick(arg1)
	local itemID = this:GetID()
	local name, link, quality, _, _, _, _, _, tex = GetItemInfo(itemID)
	if not name then return end
	local _, _, _, color = GetItemQualityColor(quality)
	tex = string.gsub(tex, "Interface\\Icons\\", "")

	if arg1 == "RightButton" and not IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
		if name then
			AtlasTW.Integrations.SearchPfQuest(name)
		end
		return
	end

	if IsShiftKeyDown() and arg1 == "LeftButton" then
		if AtlasTWOptions.LootAllLinks then
			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert("\124" .. string.sub(color, 2) .. "|Hitem:" .. itemID ..
					"\124h[" .. name .. "]|h|r")
			elseif ChatFrameEditBox:IsVisible() then
				ChatFrameEditBox:Insert("\124" .. string.sub(color, 2) .. "|Hitem:" .. itemID .. "\124h[" ..
					name .. "]|h|r")
			end
		else
			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert("[" .. name .. "]")
			elseif ChatFrameEditBox:IsVisible() then
				ChatFrameEditBox:Insert("[" .. name .. "]")
			else
				AtlasTW.Interactions.ChatSayItemReagents(this.itemID, nil, name, true)
			end
		end
	elseif IsControlKeyDown() and name then
		DressUpItemLink(link)
	elseif IsAltKeyDown() and itemID ~= 0 then
		local ElemName = AtlasTWLootItemsFrame.StoredElement
		local instKey = AtlasTWLootItemsFrame and AtlasTWLootItemsFrame.StoredMenu or nil

		if ElemName == "WishList" then
			AtlasTWLoot_DeleteFromWishList(this.itemID)
		elseif ElemName == "SearchResult" then
			AtlasTWLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(itemID, "item"))
		else
			local srcPage = BuildSourcePage(ElemName, instKey)
			AtlasTWLoot_AddToWishlist(itemID, ElemName, instKey, "item", srcPage)
		end
	end
end
