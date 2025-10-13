---
-- Container functionality for loot tables and UI interactions
-- Provides showing, updating, and handling of item containers in loot tables, including tooltips and click behavior
-- Features:
-- 1) Loading overlay handling for container area
-- 2) Dynamic grid layout based on number of items
-- 3) Tooltip and hover-based icon/quality refresh for cached items
-- 4) Click handling: chat link insert, dressing room preview, wishlist integration
-- @compatible World of Warcraft 1.12
---

-- Local state used by container UI
local L = AtlasTW.Local
local containerItems = {}
local lastSelectedButton
local DEFAULT = AtlasTW.Colors.DEFAULT
---
--- Shows loading indicator for the container frame
--- Displays spinner overlay on the container items frame
--- @return void
--- @usage AtlasTWLoot_ShowContainerLoading()
---
function AtlasTWLoot_ShowContainerLoading()
	AtlasTW.LootBrowserUI.CreateLoadingFrame("AtlasTWLootContainerLoadingFrame", AtlasTWLootItemsFrameContainer)
end

---
--- Hides loading indicator for the container frame
--- Removes spinner overlay from the container items frame
--- @return void
--- @usage AtlasTWLoot_HideContainerLoading()
---
function AtlasTWLoot_HideContainerLoading()
	AtlasTW.LootBrowserUI.HideLoadingFrame("AtlasTWLootContainerLoadingFrame")
end

---
--- Shows or toggles the container frame display
--- Manages container visibility and caching for item containers
--- @return void
--- @usage AtlasTWLoot_ShowContainerFrame()
---
function AtlasTWLoot_ShowContainerFrame()
	if this ~= lastSelectedButton then
		lastSelectedButton = this
		-- Hide old container until caching is complete for new one
		AtlasTWLootItemsFrameContainer:Hide()
	elseif AtlasTWLootItemsFrameContainer:IsVisible() then
		AtlasTWLootItemsFrameContainer:Hide()
		lastSelectedButton = nil
		return
	end
	for i = 1, table.getn(containerItems) do
		getglobal("AtlasTWLootContainerItem"..i):Hide()
	end

	local containerTable = this.container
	if not containerTable then
		return
	end

	-- Show container with "Loading" placeholder
	AtlasTWLootItemsFrameContainer:Show()
	AtlasTWLootItemsFrameContainer:ClearAllPoints()
	AtlasTWLootItemsFrameContainer:SetPoint("TOPLEFT", this , "BOTTOMLEFT", -2, 2)
	AtlasTWLootItemsFrameContainer:SetWidth(50)
	AtlasTWLootItemsFrameContainer:SetHeight(50)

	AtlasTWLoot_ShowContainerLoading()

	-- Cache all container items asynchronously, then update frame
	AtlasTW.LootCache.CacheAllItems(containerTable, function()
		AtlasTWLoot_UpdateContainerDisplay()
	end)
end

---
--- Updates container display after item caching is complete
--- Calculates optimal layout and displays all container items
--- @return void
--- @usage AtlasTWLoot_UpdateContainerDisplay() -- Called after caching completes
---
function AtlasTWLoot_UpdateContainerDisplay()
	if not lastSelectedButton or not lastSelectedButton.container then
		return
	end
	AtlasTWLoot_HideContainerLoading()
	local containerTable = lastSelectedButton.container
	if not AtlasTWLootItemsFrameContainer:IsVisible() and lastSelectedButton then
		AtlasTWLootItemsFrameContainer:Show()
	end
		local row = 0
		local col = 0
		local buttonIndex = 1

		-- Smart calculation of column count based on total number of elements
		local totalItems = table.getn(containerTable)
		local maxCols
		if totalItems <= 5 then
			maxCols = totalItems  -- One row for small quantity
		elseif totalItems <= 12 then
			maxCols = 4  -- columns for medium containers
		elseif totalItems <= 20 then
			maxCols = 6   -- columns for large containers
		elseif totalItems <= 35 then
			maxCols = 7  -- columns for very large containers
		else
			maxCols = 8  -- Maximum 8 columns
		end
		for i = 1, totalItems do
			if not containerItems[buttonIndex] then
				containerItems[buttonIndex] = CreateFrame("Button", "AtlasTWLootContainerItem"..buttonIndex, AtlasTWLootItemsFrameContainer)
				AtlasTWLoot_ApplyContainerItemTemplate(containerItems[buttonIndex])
			end
			local itemButton = getglobal("AtlasTWLootContainerItem"..buttonIndex)
			local itemID
			local quantityText = getglobal("AtlasTWLootContainerItem"..buttonIndex.."_Quantity")
			if type(containerTable[i]) == "table" then
				itemID = containerTable[i][1]
				quantityText:SetText(containerTable[i][2] and type(containerTable[i][2])=="table" and
					containerTable[i][2][1].."-"..containerTable[i][2][2] or containerTable[i][2])
			else
				itemID = containerTable[i]
				quantityText:SetText("")
				quantityText:Hide()
			end
			local icon = getglobal("AtlasTWLootContainerItem"..buttonIndex.."Icon")
			local _,_,quality,_,_,_,_,_,tex = GetItemInfo(itemID)
			local r, g, b = 1, 1, 1
			if quality then
				r, g, b  = GetItemQualityColor(quality)
			end
			if not tex then
				tex = "Interface\\Icons\\INV_Misc_QuestionMark"
			end
			-- Place elements in grid
			itemButton:SetPoint("TOPLEFT", AtlasTWLootItemsFrameContainer, (col * 35) + 5, -(row * 35) - 5)
			itemButton:SetBackdropBorderColor(r, g, b)
			itemButton:SetID(itemID)
			itemButton:Show()
			quantityText:Show()
			AtlasTWLoot_AddContainerItemTooltip(itemButton, itemID)
			icon:SetTexture(tex)
			col = col + 1
			-- Move to new row after maxCols elements
			if col >= maxCols then
				col = 0
				row = row + 1
			end
			buttonIndex = buttonIndex + 1
		end

		-- If last row is not full, account for it
		if col > 0 then
			row = row + 1
		end

		AtlasTWLootItemsFrameContainer:ClearAllPoints()
		AtlasTWLootItemsFrameContainer:SetPoint("TOPLEFT", lastSelectedButton , "BOTTOMLEFT", -2, 2)
		AtlasTWLootItemsFrameContainer:SetWidth(16 + ((row==0 and col or maxCols) * 35))
		AtlasTWLootItemsFrameContainer:SetHeight(16 + (row * 35))
end

---
--- Adds tooltip functionality to container item frames
--- Sets up OnEnter and OnLeave scripts for item tooltip display
--- @param frame table UI frame to add tooltip to
--- @param itemID number Item ID for tooltip content
--- @return void
--- @usage AtlasTWLoot_AddContainerItemTooltip(button, 12345)
---
function AtlasTWLoot_AddContainerItemTooltip(frame ,itemID)
	frame:SetScript("OnEnter", function()
        AtlasTWLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 4), -(this:GetHeight() / 4))
        AtlasTWLootTooltip:SetHyperlink("item:"..tostring(itemID))
        AtlasTWLootTooltip.itemID = itemID
        local numLines = AtlasTWLootTooltip:NumLines()
		if AtlasTWOptions.LootItemIDs then
			if numLines and numLines > 0 then
				local lastLine = getglobal("AtlasTWLootTooltipTextLeft"..numLines)
				if lastLine:GetText() then
					lastLine:SetText(lastLine:GetText().."\n\n"..DEFAULT..L["ItemID:"].." "..itemID)
				end
			end
		end
        AtlasTWLootTooltip:Show()
		local icon = getglobal(this:GetName().."Icon")
		-- Automatic icon update on hover if item is now cached
		local _,_,quality,_,_,_,_,_,tex = GetItemInfo(itemID)
		if tex and quality then
			local r, g, b  = GetItemQualityColor(quality)
			if icon:GetTexture() == "Interface\\Icons\\INV_Misc_QuestionMark" or
			   icon:GetTexture() ~= tex then
				icon:SetTexture(tex)
				this:SetBackdropBorderColor(r, g, b)
			end
		elseif icon:GetTexture() == "Interface\\Icons\\INV_Misc_QuestionMark" then
			-- If item is still not cached, try to force cache
			AtlasTW.LootCache.ForceCacheItem(itemID)
		end
    end)
    frame:SetScript("OnLeave", function()
        AtlasTWLootTooltip:Hide()
        AtlasTWLootTooltip.itemID = nil
    end)
end

---
--- Handles click events on container item buttons
--- Processes item links and chat output for container items
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return void
--- @usage AtlasTWLoot_ContainerItem_OnClick("LeftButton") -- Called by container item clicks
---
function AtlasTWLoot_ContainerItem_OnClick(arg1)
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
		elseif AtlasTWOptions.LootSafeLinks then
				if WIM_EditBoxInFocus then
					WIM_EditBoxInFocus:Insert("["..name.."]")
				elseif ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("["..name.."]")
				else
					AtlasTW.Interactions.ChatSayItemReagents(this.itemID, nil, name, true)
				end
		end
	elseif(IsControlKeyDown() and name) then
		DressUpItemLink(link)
	elseif(IsAltKeyDown() and (itemID ~= 0)) then
		local ElemName = AtlasTWLootItemsFrame.StoredElement
		local instKey = AtlasTWLootItemsFrame and AtlasTWLootItemsFrame.StoredMenu or nil

		if ElemName == "WishList" then
			AtlasTWLoot_DeleteFromWishList(this.itemID)
		elseif ElemName == "SearchResult" then
			AtlasTWLoot_AddToWishlist(AtlasTW.SearchLib.GetOriginalDataFromSearchResult(itemID))
		else
			local srcPage = nil
			if ElemName and instKey then
				srcPage = ElemName.."|"..instKey
			elseif ElemName and AtlasTW.DataResolver.IsLootTableAvailable and AtlasTW.DataResolver.IsLootTableAvailable(ElemName) then
				-- Craft/set/other loot table page without instanceKey
				srcPage = ElemName
			end
			AtlasTWLoot_AddToWishlist(itemID, ElemName, instKey, "item", srcPage)
		end
	end
end