---
--- LootBrowserUI.lua - Loot browser user interface functionality
--- 
--- This module handles the user interface components for the loot browser.
--- It manages scrollbar updates, boss line rendering, and visual state management
--- for the Atlas loot display system.
--- 
--- Features:
--- - Boss list scrollbar management
--- - Loot items scrollbar management
--- - Visual state indicators (loot available, selected)
--- - Boss line element creation and updates
--- - Frame visibility and interaction handling
--- 
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.LootBrowserUI = AtlasTW.LootBrowserUI or {}

-- Instance required libraries
local L = AtlasTW.Localization.UI

local GREEN = AtlasTW.Colors.GREEN
local GREY = AtlasTW.Colors.GREY
local ORANGE = AtlasTW.Colors.ORANGE
local YELLOW = AtlasTW.Colors.YELLOW

---
--- Updates the scroll bar display for Atlas boss list
--- Manages visibility and state of boss line elements based on scroll position
--- Handles loot indicators and selection highlighting
--- @return void
--- @usage AtlasTW.LootBrowserUI.ScrollBarUpdate()
---
function AtlasTW.LootBrowserUI.ScrollBarUpdate()
    local lineplusoffset
    local highlightTexture
    if _G["AtlasTWBossLine1_Text"] ~= nil then
        local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]

        -- Update the contents of the Atlas scroll frames
        FauxScrollFrame_Update(AtlasTWScrollBar, AtlasTW.CurrentLine, AtlasTW.NUM_LINES, 15)

        -- Now show only needed elements
        for line = 1, AtlasTW.NUM_LINES do
            lineplusoffset = line + FauxScrollFrame_GetOffset(AtlasTWScrollBar)
            local bossLine = _G["AtlasTWBossLine"..line]

            if bossLine and lineplusoffset <= AtlasTW.CurrentLine then
                -- Enable interactivity and texture for visible buttons
                bossLine:Show()
                bossLine:EnableMouse(true)
                highlightTexture = bossLine:GetHighlightTexture()
                highlightTexture:Show()

                local loot = _G["AtlasTWBossLine"..line.."_Loot"]
                local selected = _G["AtlasTWBossLine"..line.."_Selected"]
                _G["AtlasTWBossLine"..line.."_Text"]:SetText(AtlasTW.ScrollList[lineplusoffset].line)

                -- Check if this boss has loot data
                local hasLoot = AtlasTW.DataResolver.GetLootByID(zoneID, lineplusoffset)

                if AtlasTWLootItemsFrame.activeElement == lineplusoffset then
                    bossLine:Enable()
                    loot:Hide()
                    selected:Show()
                elseif hasLoot then
                    bossLine:Enable()
                    loot:Show()
                    selected:Hide()
                else
                    bossLine:Disable()
                    loot:Hide()
                    selected:Hide()
                end

                bossLine.idnum = lineplusoffset
                bossLine:Show()
            elseif bossLine then
                -- Hide lines that are not needed
                bossLine:Hide()
                -- Completely disable interactivity
                bossLine:EnableMouse(false)
                -- Hide HighlightTexture explicitly
                highlightTexture = bossLine:GetHighlightTexture()
                if highlightTexture then
                    highlightTexture:Hide()
                end
            end
        end
    end
end

---
--- Formats skill text with appropriate color coding
--- Applies color codes to skill level requirements for display
--- @param skilltext table Table containing skill level values [1-4]
--- @return string Formatted skill text with color codes
--- @usage local formatted = formSkillStyle({"100", "150", "200", "250"})
---
local function formSkillStyle(skilltext)
	if not skilltext or type(skilltext) ~= "table" then return "" end
	return L["Skill:"].." "..ORANGE..skilltext[1]..", "..YELLOW..skilltext[2]..", "..
		GREEN..skilltext[3]..", "..GREY..skilltext[4]
end

-- Implement triple blink using OnUpdate (arg1 is elapsed time).
-- Note: OnUpdate does not run while a frame is hidden in WoW 1.12,
-- so we toggle alpha instead of Hide/Show to keep the handler active.
local function AtlasTWLoot_BlinkScrollHint()
    local f = AtlasTWLootScrollHint
    if f._blinkActive then return end
    f._blinkActive = true
    f:Show()
    f:SetAlpha(1)
    f._blinkRemaining = 2 -- set to 2 for triple blink
    f._blinkPhase = "on"
    f._blinkElapsed = 0
    f:SetScript("OnUpdate", function()
        this._blinkElapsed = (this._blinkElapsed or 0) + arg1
        if this._blinkElapsed >= .7 then
            if this._blinkPhase == "on" then
                this:SetAlpha(0)
                this._blinkPhase = "off"
                this._blinkElapsed = 0
            else
                if (this._blinkRemaining or 0) > 1 then
                    this._blinkRemaining = this._blinkRemaining - 1
                    this._blinkPhase = "on"
                    this._blinkElapsed = 0
                	this:SetAlpha(1)
                else
                    -- Final state: visible, stop OnUpdate to avoid CPU overhead
                    this._blinkElapsed = nil
                    this._blinkPhase = nil
                    this._blinkRemaining = nil
                    this._blinkActive = nil
                    this:SetScript("OnUpdate", nil)
                	this:SetAlpha(0)
                end
            end
        end
    end)
end

---
--- Updates the scrollbar and content for the loot items frame
--- Loads and displays loot data for the currently selected element
--- @return nil
--- @usage AtlasTW.LootBrowserUI.ScrollBarLootUpdate() -- Called when loot data changes
---
function AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
    	--Load data for the current clicked element line
	local dataID = AtlasTWLootItemsFrame.StoredElement
	local instanceKey = (AtlasTWLootItemsFrame and type(AtlasTWLootItemsFrame.StoredMenu)=="string") and AtlasTWLootItemsFrame.StoredMenu or nil
	local dataSource = AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKey) or AtlasTWLootItemsFrame.StoredMenu

	-- Special handling for wish list and search results
	if dataID == "WishList" or dataID == "SearchResult" then
		if dataID == "WishList" and not AtlasTWCharDB["WishList"] then
			AtlasTWCharDB["WishList"] = {}
		end
		if dataID == "SearchResult" and not AtlasTWCharDB["SearchResult"] then
			AtlasTWCharDB["SearchResult"] = {}
		end
		-- Create categorized list for display
		local list = (dataID == "WishList") and AtlasTWCharDB["WishList"] or AtlasTWCharDB["SearchResult"]
		dataSource = AtlasTWLoot_CategorizeWishList(list)
	else
		if type(dataID) == "string" and (AtlasTWLoot_Data[dataID] or AtlasTWLoot_Data[dataSource]) then
			dataSource = AtlasTWLoot_Data[dataID] or AtlasTWLoot_Data[dataSource]
		end
		if type(dataSource) == "string" then
			dataSource = AtlasTW.DataResolver.GetLootByElemName(dataSource, instanceKey) or dataSource
		end
	end
	--Check if dataID and dataSource are valid
 	if not dataID and not dataSource then
		return PrintA("AtlasTW.LootBrowserUI.ScrollBarLootUpdate: No dataID and No dataSource!")
	end
	-- Hide navigation buttons by default
	_G["AtlasTWLootItemsFrame_BACK"]:Hide()
	_G["AtlasTWLootItemsFrame_NEXT"]:Hide()
	_G["AtlasTWLootItemsFrame_PREV"]:Hide()
	if type(dataSource) == "table" then
		local LZ = AtlasTW.Localization.Zones
    	local quantityFrame, menuButton, extraText, defaultIcon, itemButton, iconFrame, nameFrame, extraFrame, borderFrame

		-- Helper function to count maximum numeric index (sparse array support)
		local function GetMaxNumericIndex(tbl)
			local maxIndex = 0
			for k, v in pairs(tbl) do
				if type(k) == "number" and k > maxIndex and v then
					maxIndex = k
				end
			end
			return maxIndex
		end

		local totalItems = GetMaxNumericIndex(dataSource)

		if totalItems > AtlasTW.LOOT_NUM_LINES then
			AtlasTWLoot_BlinkScrollHint()
		else
			AtlasTWLootScrollHint:SetAlpha(0)
		end
		-- Set scroll bar range
		local scrollLines =  math.floor(totalItems / 30) * 15 + math.min(math.mod(totalItems, 30), 15)

		AtlasTWLootScrollBar.scrollMax = math.max(0, scrollLines - 15)
		FauxScrollFrame_Update(AtlasTWLootScrollBar, scrollLines, 15, 15)

		local offset = FauxScrollFrame_GetOffset(AtlasTWLootScrollBar)
		-- Update content and visibility of AtlasTWLootItem buttons
		for i = 1, AtlasTW.LOOT_NUM_LINES do
			itemButton = _G["AtlasTWLootItem_"..i]
			menuButton = _G["AtlasTWLootMenuItem_"..i]

			-- Calculate correct index for two columns
			local itemIndex = i + offset
			if offset > 0 then
				local col_size = 15

				local i_zero = i - 1
				local col_idx = math.floor(i_zero / col_size)
				local offset_block = math.floor((offset - 1) / col_size)
				local item_block = math.floor((itemIndex - 1) / col_size)

				local expected_block = col_idx + offset_block
				local adjustment = 0

				if item_block == expected_block and offset_block > 0 then
					adjustment = offset_block * col_size
				elseif item_block == expected_block + 1 then
					adjustment = (offset_block + 1) * col_size
				end

				if adjustment > 0 then
					itemIndex = itemIndex + adjustment
				end
			end
			if itemIndex <= totalItems and dataSource[itemIndex] then
				if menuButton and type(dataID)=="table" then
					nameFrame = _G["AtlasTWLootMenuItem_"..i.."_Name"]
					iconFrame = _G["AtlasTWLootMenuItem_"..i.."_Icon"]
					extraFrame = _G["AtlasTWLootMenuItem_"..i.."_Extra"]
					borderFrame = _G["AtlasTWLootMenuItem_"..i.."Border"]
					quantityFrame = nil
					local element = dataSource[itemIndex]
					defaultIcon = dataID.defaultIcon or "Interface\\Icons\\INV_Misc_QuestionMark"
					if element.name then
						if element.extra then
							extraText = LZ[element.extra]
						elseif element.Extra then
							extraText = element.Extra
						else
							extraText = ""
						end
						nameFrame:SetText(element.name)
						extraFrame:SetText(extraText)
						extraFrame:Show()
						iconFrame:SetTexture(element.icon or defaultIcon)
 						menuButton.name = element.name_orig or element.name
						menuButton.lootpage = element.lootpage
						menuButton.container = element.container
						menuButton.firstBoss = element.firstBoss
						if element.container then
							borderFrame:Show()
						else
							borderFrame:Hide()
						end
						menuButton:Show()
					else
						-- Clear fields to prevent stale data usage
						menuButton.name = nil
						menuButton.lootpage = nil
						menuButton.container = nil
						menuButton.firstBoss = nil
						menuButton:Hide()
					end
					-- Hide item and container buttons
					if itemButton then
						itemButton:Hide()
					end
				elseif itemButton then
					nameFrame = _G["AtlasTWLootItem_"..i.."_Name"]
					iconFrame = _G["AtlasTWLootItem_"..i.."_Icon"]
					extraFrame = _G["AtlasTWLootItem_"..i.."_Extra"]
					borderFrame = _G["AtlasTWLootItem_"..i.."Border"]
					quantityFrame = _G["AtlasTWLootItem_"..i.."_Quantity"]

					local shouldShow = false

					local element = dataSource[itemIndex]
					-- Normalize WishList/SearchResult elements (excluding headers) to common format of regular elements
					local sourcePageVal = nil
					if (dataID == "WishList" or dataID == "SearchResult") and element and type(element) == "table" then
						sourcePageVal = element[5]
						-- In 1.12 there are entries where [5] or [2]/[3] can be tables; protect concatenation
						if type(sourcePageVal) ~= "string" then
							sourcePageVal = nil
						end
						if not sourcePageVal then
							local e2, e3 = element[2], element[3]
							if (type(e2) == "string" or type(e2) == "number") and (type(e3) == "string" or type(e3) == "number") then
								sourcePageVal = tostring(e2).."|"..tostring(e3)
							elseif type(e2) == "table" or type(e3) == "table" then
							end
						end
					end
					if (dataID == "WishList" or dataID == "SearchResult") and element and type(element) == "table" and element[1] and element[1] ~= 0 then
						local wlItemID = element[1]
						local wlElementType = element[4]
						-- Convert WishList/SearchResult element to regular element structure
						if wlElementType ~= "item" then
							-- For spells/enchants: ID may be 's123' or 'e456'; convert to number
							local elemNum = wlItemID
							if type(wlItemID) == "string" and string.len(wlItemID) > 1 then
								elemNum = tonumber(string.sub(wlItemID, 2)) or wlItemID
							end
							element = { id = elemNum, skill = 1 }
						else
							-- For regular items explicitly mark the type
							element = { id = wlItemID, type = "item" }
						end
					end
					-- Special handling ONLY for WishList/SearchResult headers (elements with id == 0)
					if (dataID == "WishList" or dataID == "SearchResult") and element and type(element) == "table" and element[1] == 0 then
						-- This is a separator/header
						local wlBossName = element[2]
						local wlInstanceName = element[3]
						local separator = AtlasTW.ItemDB.CreateSeparator(wlBossName, "INV_Box_01", 6)
						nameFrame:SetText(separator.name~="" and separator.name or wlBossName)
						local r, g, b = GetItemQualityColor(6)
						nameFrame:SetTextColor(r, g, b)
						iconFrame:SetTexture("Interface\\Icons\\INV_Box_01")
						extraFrame:SetText(wlInstanceName or "")
						extraFrame:Show()
						quantityFrame:Hide()

						-- Clear button data for separators
						itemButton.itemID = 0
						itemButton.elemID = 0
						itemButton.typeID = nil
						itemButton.sourcePage = nil
						itemButton.container = nil
						itemButton.droprate = nil
						borderFrame:Hide()
						shouldShow = true
					-- Processing for other elements
					elseif element and (element.id or element.name) then
						local itemTexture, itemID, extratext, link, quantity = "", 0, "", "", ""
						local itemName = element.name
						local elemID = element.id
						local itemQuality = 0
						if elemID and elemID ~= 0 then
							if not (element.type and element.type == "item") then
								link = AtlasTW.SpellDB.enchants[elemID] or AtlasTW.SpellDB.craftspells[elemID]
							else
								link = nil
							end
							--spell or item
							if element.skill and not (element.type and element.type=="item") then
								-- Set original ID for itemButton (enchant or spell)
								itemButton.elemID = elemID
								-- Set type for itemButton (enchant or spell)
								if AtlasTW.SpellDB.enchants[elemID] then
									itemButton.typeID = "enchant"
								elseif AtlasTW.SpellDB.craftspells[elemID] then
									itemButton.typeID = "spell"
								else
									itemButton.typeID = "item"
								end
								-- Set itemID from spell
								itemID = link and link.item
								AtlasTW.LootCache.CacheAllItems(link and link.reagents)
								AtlasTW.LootCache.CacheAllItems(link and link.tools)
							else
								itemButton.typeID = "item"
							end
							-- Set skill text coz same items have skill discription like herbalism
							extratext = formSkillStyle(element.skill)
							-- dont want set itemID from elemID coz same ID have items
							if itemButton.typeID ~= "enchant" and not (element.skill and element.skill==0) then
								itemID = itemID and itemID~=0 and itemID or elemID
							end
							--set quantity for items and spells
							if itemButton.typeID == "item" then
								quantity = element.quantity and type(element.quantity)=="table" and
									element.quantity[1].."-"..element.quantity[2] or element.quantity
							else
								quantity = link and link.quantity and type(link.quantity)=="table" and
									link.quantity[1].."-"..link.quantity[2] or link and link.quantity
							end
							--get item name, texture and quality
							itemName, _, itemQuality, _, _, _, _, _, itemTexture = GetItemInfo(itemID or 0)
							if itemName then
								local r, g, b = GetItemQualityColor(itemQuality or 1)
								nameFrame:SetTextColor(r, g, b)
							else
								itemName = link and link.name
								nameFrame:SetTextColor(1, 1, 1)
							end
							-- set name frame text for itemButton
							nameFrame:SetText(itemName or (GREY..L["Item not found in cache"].."|r"))
						elseif element.name then
							-- Handle the case where item is a separator
							local separator = AtlasTW.ItemDB.CreateSeparator(element.name, element.icon, element.quality)
							itemName = separator.name
							itemQuality = separator.quality
							itemTexture = separator.texture

							-- Clear itemButton data from item saves
							itemButton.itemID = 0
							itemButton.elemID = 0
							itemButton.typeID = nil

							local r, g, b = GetItemQualityColor(itemQuality)
							nameFrame:SetTextColor(r, g, b)
							nameFrame:SetText(itemName or (GREY..L["Item not found in cache"].."|r"))
						end

						-- Set description text
						if not element.skill or (element.type and element.type=="item") then -- if item
							local parsedText = AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, element.disc)
							if parsedText and parsedText ~= "" then
								extratext = extratext and extratext..parsedText or parsedText
							else
								extratext = element.extra and extratext..element.extra or extratext
							end
						else -- if spell
							itemTexture = itemTexture or (link and link.icon and "Interface\\Icons\\"..link.icon)
							itemTexture = itemTexture or (element.icon and "Interface\\Icons\\"..element.icon)
							itemTexture = itemTexture or "Interface\\Icons\\Spell_Holy_GreaterHeal"
							local parsedText = AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID)
							parsedText = link and link.extra and (link.extra..", "..parsedText) or parsedText
							if extratext~="" and parsedText~="" then
								extratext = extratext..", "..parsedText
							elseif parsedText~="" then
								extratext = parsedText
							end
						end

						-- Set the description text
						if not itemName then extratext = L["The content patch isn't out yet"] end
						extraFrame:SetText(extratext or "")
						extraFrame:Show()

						-- Set the quantity
						if quantity and quantity ~= "" then
							quantityFrame:SetText(quantity)
							quantityFrame:Show()
						else
							quantityFrame:Hide()
						end

						-- Set the icon
						iconFrame:SetTexture(itemTexture or "Interface\\Icons\\INV_Misc_QuestionMark")

						-- Save the item button data
						itemButton.container = element.container
						borderFrame:Hide()
						if itemButton.container then
							borderFrame:Show()
						end

						-- Set the item drop rate
						itemButton.droprate = element.dropRate and element.dropRate.."%"

						itemButton.itemID = itemID or 0
						itemButton.sourcePage = sourcePageVal

						shouldShow = true

						-- Apply loot filter
						local filterMode = AtlasTWOptions.LootFilterMode or 0
						if filterMode > 0 and itemID and itemID > 0 then
							if not AtlasTW.ItemDB.IsItemSuitable(itemID, filterMode) then
								shouldShow = false
							end
						end
					end
					if shouldShow then
						itemButton:Show()
					else
						itemButton:Hide()
					end
					-- Hide menu buttons when displaying items
					if menuButton then
						menuButton:Hide()
					end
				end
			else
				nameFrame = _G["AtlasTWLootMenuItem_"..i.."_Name"]
				iconFrame = _G["AtlasTWLootMenuItem_"..i.."_Icon"]
				extraFrame = _G["AtlasTWLootMenuItem_"..i.."_Extra"]
				borderFrame = _G["AtlasTWLootMenuItem_"..i.."Border"]
				-- Clear button content if no data
				if iconFrame then iconFrame:SetTexture("") end
				if nameFrame then nameFrame:SetText("") end
				if extraFrame then extraFrame:SetText("") extraFrame:Hide() end
				if borderFrame then borderFrame:Hide() end
				menuButton.name = nil
				menuButton.name_orig = nil
				menuButton.lootpage = nil
				menuButton.container = nil
				menuButton.firstBoss = nil
				iconFrame = _G["AtlasTWLootItem_"..i.."_Icon"]
				extraFrame = _G["AtlasTWLootItem_"..i.."_Extra"]
				borderFrame = _G["AtlasTWLootItem_"..i.."Border"]
				quantityFrame = _G["AtlasTWLootItem_"..i.."_Quantity"]
				-- Clear button content if no data
				if iconFrame then iconFrame:SetTexture("") end
				if nameFrame then nameFrame:SetText("") end
				if extraFrame then extraFrame:SetText("") extraFrame:Hide() end
				if borderFrame then borderFrame:Hide() end
				if quantityFrame then quantityFrame:Hide() end
				itemButton.itemID = 0
				itemButton.elemID = 0
				itemButton.typeID = nil
				itemButton.itemLink = nil
				itemButton.container = nil
				itemButton.droprate = nil
				itemButton:Hide()
				menuButton:Hide()
			end
		end
	elseif type(_G[dataSource]) == "function" then
		_G[dataSource]()
	else
	end
	-- Show "Back" button if there is a parent menu
	if AtlasTWLootItemsFrame.StoredBackMenuName then
		_G["AtlasTWLootItemsFrame_BACK"]:Show()
		_G["AtlasTWLootItemsFrame_BACK"].lootpage = "BackToMenu"
		_G["AtlasTWLootItemsFrame_BACK"].title = AtlasTWLootItemsFrame.StoredBackMenuName
	end

	if dataID ~= "SearchResult" and dataID ~= "WishList" then
		-- Navigation is handled except for Search/WishList
		local nav = nil
		-- Check if this is a rare mob
		local rareMobsData = AtlasTW.InstanceData.RareMobs
		if rareMobsData and rareMobsData.Bosses then
			for i, bossData in ipairs(rareMobsData.Bosses) do
				if bossData.name == dataID then
					-- Create navigation for rare mobs
					nav = {}
					nav.Title = bossData.name
					local numEntries = table.getn(rareMobsData.Bosses)
					if numEntries > 1 then
						-- Previous rare mob
						local prevIndex = i - 1
						if prevIndex < 1 then prevIndex = numEntries end
						local prevBoss = rareMobsData.Bosses[prevIndex]
						if prevBoss then
							nav.Prev_Page = prevBoss.name
							nav.Prev_Title = prevBoss.name
						end
						-- Next rare mob
						local nextIndex = i + 1
						if nextIndex > numEntries then nextIndex = 1 end
						local nextBoss = rareMobsData.Bosses[nextIndex]
						if nextBoss then
							nav.Next_Page = nextBoss.name
							nav.Next_Title = nextBoss.name
						end
					end
					break
				end
			end
		end

		-- If not a rare mob, use regular navigation
		if not nav then
			nav = AtlasTW.DataResolver.GetBossNavigation(dataID)
		end

		-- If boss navigation not found, try menu navigation
		if not nav then
			nav = AtlasTW.DataResolver.GetMenuNavigation(dataID)
		end

		-- If navigation not found and we have StoredBackMenuName, try to find navigation for it
		if not nav and AtlasTWLootItemsFrame.StoredBackMenuName then
			local backMenuKey = AtlasTWLootItemsFrame.StoredBackMenuName
			nav = AtlasTW.DataResolver.GetMenuNavigation(backMenuKey)
			if nav then
				-- Add "Back" button to parent menu
				nav.Back_Page = "BackToMenu"
				nav.Back_Title = backMenuKey
			end
		end

		if nav then
			if nav.Next_Page then
				_G["AtlasTWLootItemsFrame_NEXT"]:Show()
				_G["AtlasTWLootItemsFrame_NEXT"].lootpage = nav.Next_Page
				_G["AtlasTWLootItemsFrame_NEXT"].title = nav.Next_Title
			end
			if nav.Prev_Page then
				_G["AtlasTWLootItemsFrame_PREV"]:Show()
				_G["AtlasTWLootItemsFrame_PREV"].lootpage = nav.Prev_Page
				_G["AtlasTWLootItemsFrame_PREV"].title = nav.Prev_Title
			end
			if nav.Back_Page then
				_G["AtlasTWLootItemsFrame_BACK"]:Show()
				_G["AtlasTWLootItemsFrame_BACK"].lootpage = nav.Back_Page
				_G["AtlasTWLootItemsFrame_BACK"].title = nav.Back_Title
			end
		end
	end

	-- QuickLooks display management: hide on search/wishlist, show on regular pages
	if dataID == "SearchResult" or dataID == "WishList" then
    	AtlasTWLoot_QuickLooks:Hide()
    	AtlasTWLootQuickLooksButton:Hide()
	else
		if AtlasTWLoot_QuickLooks then
			AtlasTWLoot_QuickLooks:SetText(L["QuickLook"])
			AtlasTWLoot_QuickLooks:Show()
		end
		if AtlasTWLootQuickLooksButton then
			AtlasTWLootQuickLooksButton:Show()
		end
	end

	-- Set the loot page name
	if dataID == "SearchResult" then
		local text = AtlasTWCharDB and AtlasTWCharDB.LastSearchedText or ""
		AtlasTWLoot_LootPageName:SetText(string.format(L["Search Result: %s"], text))
	elseif dataID == "WishList" then
		AtlasTWLoot_LootPageName:SetText(L["Wish List"])
	else
		AtlasTWLoot_LootPageName:SetText(dataID and type(dataID)=="string" and dataID or (dataID and dataID.menuName))
	end

	--Hide the container frame
	AtlasTWLootItemsFrameContainer:Hide()

	--Show the loot frame
	AtlasTWLootItemsFrame:Show()
--[[     -- Load data for the current clicked element line
    local dataID = AtlasTWLootItemsFrame.StoredElement
    local instanceKey = (AtlasTWLootItemsFrame and type(AtlasTWLootItemsFrame.StoredMenu) == "string") and AtlasTWLootItemsFrame.StoredMenu or nil
    local dataSource = AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKey) or AtlasTWLootItemsFrame.StoredMenu

    -- Special handling for wish list and search results
    if type(dataSource) == "table" and dataSource.wishlist then
        AtlasTW.LootBrowserUI.DisplayWishList(dataSource.wishlist)
        return
    end

    if type(dataSource) == "table" and dataSource.searchResults then
        AtlasTW.LootBrowserUI.DisplaySearchResults(dataSource.searchResults)
        return
    end

    -- Handle menu data
    if type(dataSource) == "table" and not dataSource[1] then
        AtlasTW.LootBrowserUI.DisplayMenuData(dataSource)
        return
    end

    -- Handle regular loot data
    if type(dataSource) == "table" then
        AtlasTW.LootBrowserUI.DisplayLootData(dataSource)
    else
        AtlasTW.LootBrowserUI.ClearLootDisplay()
    end

    -- Show the loot frame
    AtlasTWLootItemsFrame:Show() ]]
end

---
--- Displays wish list items in the loot frame
--- @param wishlistData table Wish list data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplayWishList(wishlistData)
---
function AtlasTW.LootBrowserUI.DisplayWishList(wishlistData)
    -- Implementation for wish list display
    -- This would handle the specific formatting and display of wish list items
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not wishlistData or table.getn(wishlistData) == 0 then
        return
    end

    -- Ensure item buttons are visible and menu buttons hidden
    if AtlasTW.LootBrowserUI.ShowItemButtons then
        AtlasTW.LootBrowserUI.ShowItemButtons()
    end

    -- Update scrollbar for wish list
    local numItems = table.getn(wishlistData)

	-- Set scroll bar range
	local scrollLines =  math.floor(numItems / 30) * 15 + math.min(math.mod(numItems, 30), 15)

	AtlasTWLootScrollBar.scrollMax = math.max(0, scrollLines - 15)
	FauxScrollFrame_Update(AtlasTWLootScrollBar, scrollLines, 15, 15)

    local offset = FauxScrollFrame_GetOffset(AtlasTWLootScrollBar)

    -- Display wish list items with offset
    for i = 1, AtlasTW.LOOT_NUM_LINES do
        local itemIndex = i + offset
        if itemIndex <= numItems then
            AtlasTW.LootBrowserUI.SetLootLine(i, wishlistData[itemIndex])
        else
            AtlasTW.LootBrowserUI.ClearLootLine(i)
        end
    end
end

---
--- Displays search results in the loot frame
--- @param searchResults table Search results data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplaySearchResults(searchResults)
---
function AtlasTW.LootBrowserUI.DisplaySearchResults(searchResults)
    -- Implementation for search results display
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not searchResults or table.getn(searchResults) == 0 then
        return
    end

    -- Ensure item buttons are visible and menu buttons hidden
    if AtlasTW.LootBrowserUI.ShowItemButtons then
        AtlasTW.LootBrowserUI.ShowItemButtons()
    end

    -- Update scrollbar for search results
    local numItems = table.getn(searchResults)

	-- Set scroll bar range
	local scrollLines =  math.floor(numItems / 30) * 15 + math.min(math.mod(numItems, 30), 15)

	AtlasTWLootScrollBar.scrollMax = math.max(0, scrollLines - 15)
	FauxScrollFrame_Update(AtlasTWLootScrollBar, scrollLines, 15, 15)
    local offset = FauxScrollFrame_GetOffset(AtlasTWLootScrollBar)

    -- Display search results with offset
    for i = 1, AtlasTW.LOOT_NUM_LINES do
        local itemIndex = i + offset
        if itemIndex <= numItems then
            AtlasTW.LootBrowserUI.SetLootLine(i, searchResults[itemIndex])
        else
            AtlasTW.LootBrowserUI.ClearLootLine(i)
        end
    end
end

---
--- Displays menu data in the loot frame
--- @param menuData table Menu data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplayMenuData(menuData)
---
function AtlasTW.LootBrowserUI.DisplayMenuData(menuData)
    -- Implementation for menu data display
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not menuData then
        return
    end

    -- Ensure menu buttons are visible and item buttons hidden
    AtlasTW.LootBrowserUI.ShowMenuButtons()

    -- Convert associative table to array for deterministic scrolling
    local entries = {}
    local count = 0
    for _, item in pairs(menuData) do
        count = count + 1
        entries[count] = item
    end

    -- Update scrollbar for menu entries
    local numItems = count

	-- Set scroll bar range
	local scrollLines =  math.floor(numItems / 30) * 15 + math.min(math.mod(numItems, 30), 15)

	AtlasTWLootScrollBar.scrollMax = math.max(0, scrollLines - 15)
	FauxScrollFrame_Update(AtlasTWLootScrollBar, scrollLines, 15, 15)
    local offset = FauxScrollFrame_GetOffset(AtlasTWLootScrollBar)

    for i = 1, AtlasTW.LOOT_NUM_LINES do
        local itemIndex = i + offset
        if itemIndex <= numItems then
            AtlasTW.LootBrowserUI.SetMenuLine(i, entries[itemIndex])
        else
            AtlasTW.LootBrowserUI.ClearMenuLine(i)
        end
    end
end

---
--- Displays regular loot data in the loot frame
--- @param lootData table Loot data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.DisplayLootData(lootData)
---
function AtlasTW.LootBrowserUI.DisplayLootData(lootData)
    -- Implementation for regular loot data display
    AtlasTW.LootBrowserUI.ClearLootDisplay()

    if not lootData or table.getn(lootData) == 0 then
        return
    end

    -- Update scrollbar for loot items
    local numItems = table.getn(lootData)

	-- Set scroll bar range
	local scrollLines =  math.floor(numItems / 30) * 15 + math.min(math.mod(numItems, 30), 15)

	AtlasTWLootScrollBar.scrollMax = math.max(0, scrollLines - 15)
	FauxScrollFrame_Update(AtlasTWLootScrollBar, scrollLines, 15, 15)

    local offset = FauxScrollFrame_GetOffset(AtlasTWLootScrollBar)

    -- Display loot items
    for i = 1, AtlasTW.LOOT_NUM_LINES do
        local itemIndex = i + offset
        if itemIndex <= numItems then
            AtlasTW.LootBrowserUI.SetLootLine(i, lootData[itemIndex])
        else
            AtlasTW.LootBrowserUI.ClearLootLine(i)
        end
    end
end

---
--- Sets the content of a specific loot line
--- @param lineIndex number Line index to set (1-based)
--- @param itemData table Item data to display
--- @return nil
--- @usage AtlasTW.LootBrowserUI.SetLootLine(1, itemData)
---
function AtlasTW.LootBrowserUI.SetLootLine(lineIndex, itemData)
    if not lineIndex or not itemData then
        return
    end

    local button = _G["AtlasTWLootItem_"..lineIndex]
    if not button then
        return
    end

    -- Persist raw data on the button and show it
    button.itemData = itemData
    button:Show()

    -- Decide what kind of entry this is and set button fields used by handlers
    if itemData.id or itemData.itemID then
        -- Regular item entry
        AtlasTW.LootBrowserUI.UpdateItemButton(button, itemData)
    elseif itemData.spellID then
        -- Spell entry
        button.typeID = "spell"
        button.itemID = nil
        button.elemID = itemData.spellID
        button.droprate = itemData.dropRate or itemData.droprate
        AtlasTW.LootBrowserUI.UpdateTextButton(button, itemData)
    elseif itemData.enchantID then
        -- Enchant entry
        button.typeID = "enchant"
        button.itemID = nil
        button.elemID = itemData.enchantID
        button.droprate = itemData.dropRate or itemData.droprate
        AtlasTW.LootBrowserUI.UpdateTextButton(button, itemData)
    else
        -- Menu/text entry
        button.typeID = 0
        button.itemID = nil
        button.elemID = nil
        button.droprate = nil
        button.container = itemData.container
        button.name = itemData.name or itemData.text
        button.name_orig = itemData.name_orig
        button.lootpage = itemData.lootpage
        button.isheader = itemData.isheader
        AtlasTW.LootBrowserUI.UpdateTextButton(button, itemData)
    end
end

---
--- Clears the content of a specific loot line
--- @param lineIndex number Line index to clear (1-based)
--- @return nil
--- @usage AtlasTW.LootBrowserUI.ClearLootLine(1)
---
function AtlasTW.LootBrowserUI.ClearLootLine(lineIndex)
    if not lineIndex then
        return
    end

    local button = _G["AtlasTWLootItem_"..lineIndex]
    if button then
        -- Reset data and visuals
        button.itemData = nil
        button.typeID = nil
        button.itemID = nil
        button.elemID = nil
        button.droprate = nil
        local nameFS = _G[button:GetName().."_Name"]
        if nameFS then nameFS:SetText("") end
        local iconTx = _G[button:GetName().."_Icon"]
        if iconTx then iconTx:SetTexture(nil) end
        local extraFS = _G[button:GetName().."_Extra"]
        if extraFS then extraFS:SetText(""); extraFS:Hide() end
        button:Hide()
    end
end

---
--- Clears all loot display lines
--- @return nil
--- @usage AtlasTW.LootBrowserUI.ClearLootDisplay()
---
function AtlasTW.LootBrowserUI.ClearLootDisplay()
    for i = 1, AtlasTW.LOOT_NUM_LINES or 30 do
        -- Clear both item and menu buttons
        AtlasTW.LootBrowserUI.ClearLootLine(i)
        if AtlasTW.LootBrowserUI.ClearMenuLine then
            AtlasTW.LootBrowserUI.ClearMenuLine(i)
        end
    end
end

---
--- Updates an item button with item data
--- @param button table Button frame to update
--- @param itemData table Item data containing itemID and other properties
--- @return nil
--- @usage AtlasTW.LootBrowserUI.UpdateItemButton(button, itemData)
---
function AtlasTW.LootBrowserUI.UpdateItemButton(button, itemData)
    if not button or not itemData then
        return
    end

    -- Mark type for tooltip/click handlers
    button.typeID = "item"
    button.itemID = itemData.id or itemData.itemID or 0
    button.elemID = nil
    button.droprate = itemData.dropRate or itemData.droprate

    -- Set icon (prefer provided icon, otherwise try game item icon, else a question mark)
    local iconTx = _G[button:GetName().."_Icon"]
    if iconTx then
        local texture = itemData.icon
        if not texture and button.itemID ~= 0 then
            local _, _, _, _, _, _, _, _, _, invTexture = GetItemInfo(button.itemID)
            texture = invTexture
        end
        iconTx:SetTexture(texture or "Interface\\Icons\\INV_Misc_QuestionMark")
    end

    -- Set item name with embedded color prefix so Interactions.lua can parse it
    local nameFS = _G[button:GetName().."_Name"]
    if nameFS then
        local itemName, _, quality = GetItemInfo(button.itemID)
        local _, _, _, hex = GetItemQualityColor(quality or 1)
        if not hex then hex = "ffffffff" end
        if itemName then
            nameFS:SetText("|c"..hex..itemName)
        else
            nameFS:SetText("|c"..hex.."Item "..tostring(button.itemID))
        end
    end

    -- Optional extra line: drop rate or explicit extra text
    local extraFS = _G[button:GetName().."_Extra"]
    if extraFS then
        local extraText
        if itemData.extra then
            extraText = itemData.extra
        elseif button.droprate then
            extraText = "("..tostring(button.droprate).."%)"
        end
        if extraText then
            extraFS:SetText(extraText)
            extraFS:Show()
        else
            extraFS:SetText("")
            extraFS:Hide()
        end
    end
end

---
--- Updates a text button with text data
--- @param button table Button frame to update
--- @param textData table Text data containing text and formatting
--- @return nil
--- @usage AtlasTW.LootBrowserUI.UpdateTextButton(button, textData)
---
function AtlasTW.LootBrowserUI.UpdateTextButton(button, textData)
    if not button or not textData then
        return
    end

    -- Update icon if provided, otherwise clear it
    local iconTx = _G[button:GetName().."_Icon"]
    if iconTx then
        if textData.icon then
            iconTx:SetTexture(textData.icon)
        else
            iconTx:SetTexture(nil)
        end
    end

    -- Update visible label
    local nameFS = _G[button:GetName().."_Name"]
    if nameFS then
        local label = textData.name or textData.text or ""
        nameFS:SetText(label)
    end

    -- Extra line for text entries (if any)
    local extraFS = _G[button:GetName().."_Extra"]
    if extraFS then
        if textData.extra then
            extraFS:SetText(textData.extra)
            extraFS:Show()
        else
            extraFS:SetText("")
            extraFS:Hide()
        end
    end
end

-- Сlear a specific menu line content and hide button
-- @function ClearMenuLine
-- @brief Clears a specific menu line in the loot browser UI.
-- @param lineIndex The index of the menu line to clear.
function AtlasTW.LootBrowserUI.ClearMenuLine(lineIndex)
    if not lineIndex then return end
    local button = _G["AtlasTWLootMenuItem_"..lineIndex]
    if button then
        button.container = nil
        button.name = nil
        button.name_orig = nil
        button.lootpage = nil
        button.firstBoss = nil
        button.isheader = nil
        local nameFS = _G[button:GetName().."_Name"]
        if nameFS then nameFS:SetText("") end
        local iconTx = _G[button:GetName().."_Icon"]
        if iconTx then iconTx:SetTexture(nil) end
        local extraFS = _G[button:GetName().."_Extra"]
        if extraFS then extraFS:SetText(""); extraFS:Hide() end
        button:Hide()
    end
end

---
--- Prepares and displays a menu in the loot browser
--- @param menuTitle string Title of the menu
--- @param menuItems table Menu items data
--- @param prevMenuText string|nil Previous menu text for back navigation
--- @param defIcon string|nil Default icon for the menu
--- @return nil
--- @usage AtlasTW.LootBrowserUI.PrepMenu("Dungeons", menuData)
---
function AtlasTW.LootBrowserUI.PrepMenu(menuTitle, menuItems, prevMenuText, defIcon)
    AtlasTWLootItemsFrame.StoredElement = { menuName = menuTitle, defaultIcon = defIcon }
    AtlasTWLootItemsFrame.StoredMenu = menuItems
    AtlasTWLootItemsFrame.StoredBackMenuName = prevMenuText
    AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
end

-- Show item buttons, hide menu buttons
-- @function ShowItemButtons
-- @brief Shows the item buttons in the loot browser UI.
function AtlasTW.LootBrowserUI.ShowItemButtons()
    for i = 1, AtlasTW.LOOT_NUM_LINES or 30 do
        local itemBtn = _G["AtlasTWLootItem_"..i]
        local menuBtn = _G["AtlasTWLootMenuItem_"..i]
        if itemBtn then itemBtn:Show() end
        if menuBtn then menuBtn:Hide() end
    end
end

-- Show menu buttons, hide item buttons
-- @function ShowMenuButtons
-- @brief Shows the menu buttons in the loot browser UI.
function AtlasTW.LootBrowserUI.ShowMenuButtons()
    for i = 1, AtlasTW.LOOT_NUM_LINES or 30 do
        local itemBtn = _G["AtlasTWLootItem_"..i]
        local menuBtn = _G["AtlasTWLootMenuItem_"..i]
        if itemBtn then itemBtn:Hide() end
        if menuBtn then menuBtn:Show() end
    end
end

-- Set a specific menu line using menu button template
-- @function SetMenuLine
-- @brief Sets a specific menu line in the loot browser UI using the menu button template.
-- @param lineIndex The index of the menu line to set.
-- @param itemData The data for the menu line.
-- @return nil
-- @usage AtlasTW.LootBrowserUI.SetMenuLine(1, { name = "Dungeons", container = "Dungeons" })
--
function AtlasTW.LootBrowserUI.SetMenuLine(lineIndex, itemData)
    if not lineIndex or not itemData then return end
    local button = _G["AtlasTWLootMenuItem_"..lineIndex]
    if not button then return end

    -- Persist data for click handler
    button.container = itemData.container
    button.name = itemData.name or itemData.text
    button.name_orig = itemData.name_orig
    button.lootpage = itemData.lootpage
    button.firstBoss = itemData.firstBoss
    button.isheader = itemData.isheader

    -- Reuse text button updater to apply visuals
    AtlasTW.LootBrowserUI.UpdateTextButton(button, itemData)
end

---
--- Creates a loading overlay frame with spinning indicator
--- @param frameName string Frame global name
--- @param parentFrame table Parent frame
--- @param debugName string|nil Optional name for debug prints
--- @usage AtlasTW.LootBrowserUI.CreateLoadingFrame("AtlasTWLootScrollBarLoadingFrame", AtlasTWLootItemsFrame)
---
function AtlasTW.LootBrowserUI.CreateLoadingFrame(frameName, parentFrame, debugName)
    local loadingFrame = getglobal(frameName)
    if not loadingFrame then
        loadingFrame = CreateFrame("Frame", frameName, parentFrame)
        loadingFrame:SetAllPoints(parentFrame)
        loadingFrame:SetFrameLevel(parentFrame:GetFrameLevel() + 1)
        loadingFrame:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        loadingFrame:SetBackdropColor(0, 0, 0, 0.5)
        loadingFrame:SetBackdropBorderColor(1, 0.82, 0, 0.8)

        local text = loadingFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetPoint("CENTER", loadingFrame, "CENTER")
        text:SetTextColor(1, 1, 0)
        text:SetText("|")
        loadingFrame.text = text

        loadingFrame.animTimer = 0
        loadingFrame.spinnerIndex = 1
        loadingFrame.spinnerChars = {"|", "/", "-", "\\"}
        loadingFrame:SetScript("OnUpdate", function()
            this.animTimer = this.animTimer + arg1
            if this.animTimer >= 0.15 then
                this.animTimer = 0
                this.spinnerIndex = this.spinnerIndex + 1
                if this.spinnerIndex > 4 then
                    this.spinnerIndex = 1
                end
                this.text:SetText(this.spinnerChars[this.spinnerIndex])
            end
        end)

        setglobal(frameName, loadingFrame)
    end
    loadingFrame:Show()
    if debugName then
        PrintA("AtlasTWLoot: show " .. debugName .. " spinner")
    end
end

---
--- Hides a loading overlay frame
--- @param frameName string Frame global name
--- @param debugName string|nil Optional name for debug prints
--- @usage AtlasTW.LootBrowserUI.HideLoadingFrame("AtlasTWLootScrollBarLoadingFrame")
---
function AtlasTW.LootBrowserUI.HideLoadingFrame(frameName, debugName)
    local loadingFrame = getglobal(frameName)
    if loadingFrame then
        loadingFrame:Hide()
        if debugName then
            PrintA("AtlasTWLoot: hide " .. debugName .. " spinner")
        end
    end
end

---
--- Convenience wrapper to show scroll bar loading overlay
--- @usage AtlasTW.LootBrowserUI.ShowScrollBarLoading()
---
function AtlasTW.LootBrowserUI.ShowScrollBarLoading()
    AtlasTW.LootBrowserUI.CreateLoadingFrame("AtlasTWLootScrollBarLoadingFrame", AtlasTWLootItemsFrame)
end

---
--- Convenience wrapper to hide scroll bar loading overlay
--- @usage AtlasTW.LootBrowserUI.HideScrollBarLoading()
---
function AtlasTW.LootBrowserUI.HideScrollBarLoading()
    AtlasTW.LootBrowserUI.HideLoadingFrame("AtlasTWLootScrollBarLoadingFrame")
end