---
--- AtlasLoot.lua - Core loot system and item display functionality
--- 
--- This file contains the main loot system functionality for Atlas-TW.
--- It handles item display, tooltip management, loot data processing,
--- and provides the core infrastructure for the loot browser interface.
--- --- 
--- @since 1.0.0
---

AtlasLoot = AceLibrary("AceAddon-2.0"):new("AceDBa-2.0")

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.Loot = AtlasTW.Loot or {}
--Instance required libraries
local L = AtlasTW.Local

--Compatibility with old EquipCompare/EQCompare
ATLASLOOT_OPTIONS_EQUIPCOMPARE = L["Use EquipCompare"]
ATLASLOOT_OPTIONS_EQUIPCOMPARE_DISABLED = L["|cff9d9d9dUse EquipCompare|r"]

-- Colours stored for code readability
local RED = AtlasLoot_Colors.RED
local WHITE = AtlasLoot_Colors.WHITE
local BLUE = AtlasLoot_Colors.BLUE

AtlasLoot:RegisterDB("AtlasLootDB")

--Popup Box for first time users
StaticPopupDialogs["ATLASLOOT_SETUP"] = {
	text = "Welcome to Atlas-TW Edition. Please take a moment to set your preferences.",
	button1 = L["Setup"],
	OnAccept = function()
		AtlasTW.OptionsOnClick()
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
}


---
--- Gets navigation data for boss/element browsing
--- Creates navigation structure with previous/next boss links within current instance
--- @param data string Name or ID of the boss/element to get navigation for
--- @return table|nil Navigation table with Title, Back_Page, Prev_Page, Next_Page properties
--- @usage local nav = AtlasLoot_GetBossNavigation("Ragnaros")
--- @since 1.0.0
---
function AtlasLoot_GetBossNavigation(data)
    if not data then return nil end
    -- Get current instance from settings
    local currentZoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local currentInstanceData = AtlasTW.InstanceData[currentZoneID]

    -- Search for boss only in current instance
    if currentInstanceData and currentInstanceData.Bosses then
        for i, bossData in ipairs(currentInstanceData.Bosses) do
            if bossData.name == data then
                local nav = {}
                nav.Title = bossData.name or bossData.id
				if bossData.items and type(bossData.items) == "table" then
					-- Back to dungeons menu
					nav.Back_Page = "DUNGEONSMENU"
					nav.Back_Title = L["Dungeons & Raids"]
				end

                local numEntries = table.getn(currentInstanceData.Bosses)
				if numEntries <= 1 then return nav end
                -- function to find valid element
                local function findValidEntry(startIndex, direction)
                    for j = 1, numEntries do
                        local checkIndex = startIndex + (j * direction)
                        if checkIndex < 1 then
                            checkIndex = numEntries + checkIndex
                        elseif checkIndex > numEntries then
                            checkIndex = checkIndex - numEntries
                        end
                        local checkBoss = currentInstanceData.Bosses[checkIndex]
                        if checkBoss and checkBoss.name and (checkBoss.items or checkBoss.loot) and type(checkBoss.items) ~= "string" then
                            return checkBoss
                        end
                    end
                    return nil
                end

                -- Search for previous valid element
                local prevBoss = findValidEntry(i, -1)
                if prevBoss then
                    nav.Prev_Page = prevBoss.name
                    nav.Prev_Title = prevBoss.name or prevBoss.id
                end

                -- Search for next valid element
                local nextBoss = findValidEntry(i, 1)
                if nextBoss then
                    nav.Next_Page = nextBoss.name
                    nav.Next_Title = nextBoss.name or nextBoss.id
                end
                return nav
            end
        end
    end
    return nil
end


---
--- Gets navigation data for menu browsing
--- Creates navigation structure for moving between different menu sections
--- @param current string|table Current menu item name or loot table key
--- @return table|nil Navigation table with menu links or nil if not found
--- @usage local nav = AtlasLoot_GetMenuNavigation("DungeonsMenu")
--- @since 1.0.0
---
function AtlasLoot_GetMenuNavigation(current)
    -- Universal navigation function for all addon menus
    -- current can be menu item name or loot table key
 	if type(current) == "table" and current.menuName then
		current = current.menuName
	end
    local function getAllMenuData()
        local menus = {}
        if AtlasTW and AtlasTW.MenuData then
            for _, value in pairs(AtlasTW.MenuData) do
                if type(value) == "table" and table.getn(value) > 0 then
                    table.insert(menus, value)
                end
            end
        end
        return menus
    end

    local candidates = getAllMenuData()

    local function findInMenu(menu)
        if not menu then return nil end
        local size = table.getn(menu)
        local idx = nil
        -- Search element by name (priority) or by lootpage (for compatibility)
        for i = 1, size do
            local e = menu[i]
            if e and e.name then
                -- Check exact match
                if e.name == current then
                    idx = i
                    break
                -- Check match without color codes
                elseif string.find(e.name, "|c") then
                    -- Remove color codes from name
                    local cleanName = string.gsub(e.name, "|c%x%x%x%x%x%x%x%x", "")
                    cleanName = string.gsub(cleanName, "|r", "")
                    if cleanName == current then
                        idx = i
                        break
                    end
                end
            end
        end

        -- If not found by name, try by lootpage for backward compatibility
        if not idx then
            for i = 1, size do
                local e = menu[i]
                if e and e.lootpage and e.lootpage == current then
                    idx = i
                    break
                end
            end
        end

        if not idx then
            return nil
        end

        local result = {}
        -- Search for previous item among valid elements
        for j = idx - 1, 1, -1 do
            local pe = menu[j]
            if pe and pe.lootpage and not pe.isheader then
                result.Prev_Page = pe.lootpage ~= L["Rare Mobs"] and pe.lootpage or L["Shade Mage"]
                result.Prev_Title = pe.name ~= L["Rare Mobs"] and pe.name or L["Shade Mage"]
                break
            end
        end
        -- If not found, wrap around from the end
        if not result.Prev_Page then
            for j = size, 1, -1 do
                if j ~= idx then
                    local pe = menu[j]
                    if pe and pe.lootpage and not pe.isheader then
                        result.Prev_Page = pe.lootpage ~= L["Rare Mobs"] and pe.lootpage or L["Shade Mage"]
                        result.Prev_Title = pe.name ~= L["Rare Mobs"] and pe.name or L["Shade Mage"]
                        break
                    end
                end
            end
        end

        -- Search for next item
        for j = idx + 1, size do
            local ne = menu[j]
            if ne and ne.lootpage and not ne.isheader then
                result.Next_Page = ne.lootpage ~= L["Rare Mobs"] and ne.lootpage or L["Shade Mage"]
                result.Next_Title = ne.name ~= L["Rare Mobs"] and ne.name or L["Shade Mage"]
                break
            end
        end
        -- If not found, wrap around from the beginning
        if not result.Next_Page then
            for j = 1, size do
                if j ~= idx then
                    local ne = menu[j]
                    if ne and ne.lootpage and not ne.isheader then
                        result.Next_Page = ne.lootpage ~= L["Rare Mobs"] and ne.lootpage or L["Shade Mage"]
                        result.Next_Title = ne.name ~= L["Rare Mobs"] and ne.name or L["Shade Mage"]
                        break
                    end
                end
            end
        end
        return result
    end
    -- Scan all addon menus
	for k = 1, table.getn(candidates) do
		local nav = findInMenu(candidates[k])
		if nav and (nav.Next_Page or nav.Prev_Page) then
			return nav
		end
	end

    return nil
end

---
--- Checks if a loot table is available in memory
--- Searches for loot table by dataID or element name
--- @param dataID string Loot table identifier to check
--- @return boolean True if loot table is available, false otherwise
--- @usage local available = AtlasLoot_IsLootTableAvailable("MC_Ragnaros")
--- @since 1.0.0
---
function AtlasLoot_IsLootTableAvailable(dataID)
	if not dataID then return false end
	-- Direct loot table
	if AtlasLoot_Data and AtlasLoot_Data[dataID] then
		return true
	end
	-- Search by element name within current instance or globally
	local instanceKey = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu
	local loot = AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKey) or nil
	if loot and type(loot) == "table" then
		return true
	end
	-- Try without considering instance
	loot = AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(dataID) or nil
	if loot and type(loot) == "table" then
		return true
	end
	return false
end

---
--- Shows the GUI for setting QuickLook assignments
--- Creates dropdown menu for assigning current loot table to QuickLook slots
--- @param button table Button frame that triggered the function
--- @usage AtlasLoot_ShowQuickLooks(buttonFrame)
--- @since 1.0.0
---
function AtlasLoot_ShowQuickLooks(button)
	local Hewdrop = AceLibrary("Hewdrop-2.0")
	if Hewdrop:IsOpen(button) then
		Hewdrop:Close(1)
	else
		local setOptions = function()
			for i = 1, 6 do
				local index = i
				Hewdrop:AddLine(
					"text", L["QuickLook"].." "..i,
					"tooltipTitle", L["QuickLook"].." "..i,
					"tooltipText", L["Assign this loot table to QuickLook"].." "..i,
					"func", function()
						local dataID = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredElement or nil
						local storedMenu = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil
						if not AtlasTWCharDB["QuickLooks"] then AtlasTWCharDB["QuickLooks"] = {} end
						local titleText = nil
						if AtlasLoot_LootPageName and AtlasLoot_LootPageName:GetText() and AtlasLoot_LootPageName:GetText() ~= "" then
							titleText = AtlasLoot_LootPageName:GetText()
						elseif type(dataID) == "table" then
							if dataID.menuName then
								titleText = dataID.menuName
							elseif dataID.title then
								titleText = dataID.title
							end
						end
						if not titleText and dataID then
							titleText = tostring(dataID)
						end
						AtlasTWCharDB["QuickLooks"][index] = { dataID, storedMenu, titleText }
						AtlasLoot_RefreshQuickLookButtons()
						Hewdrop:Close(1)
					end
				)
			end
		end
		Hewdrop:Open(button,
			'point', function(parent)
				return "BOTTOMLEFT", "BOTTOMRIGHT"
			end,
			"children", setOptions
		)
	end
end

---
--- Refreshes QuickLook button states based on assignments
--- Enables or disables buttons depending on stored QuickLook data
--- @return void
--- @usage AtlasLoot_RefreshQuickLookButtons()
--- @since 1.0.0
---
function AtlasLoot_RefreshQuickLookButtons()
	local i=1
	while i<7 do
		local entry = AtlasTWCharDB["QuickLooks"][i]
		local btnPanel = _G["AtlasLootPanel_Preset"..i]
		local btnItems = _G["AtlasLootItemsFrame_Preset"..i]
		local enable = false
		if entry then
			if type(entry) == "table" then
				if entry[1] ~= nil then enable = true end
			else
				if entry ~= "" then enable = true end
			end
		end
		if btnPanel then if enable then btnPanel:Enable() else btnPanel:Disable() end end
		if btnItems then if enable then btnItems:Enable() else btnItems:Disable() end end
		i=i+1
	end
end

---
--- Clears a specific QuickLook button assignment
--- Removes stored data and refreshes button states
--- @param button number QuickLook button number to clear (1-6)
--- @return void
--- @usage AtlasLoot_ClearQuickLookButton(3)
--- @since 1.0.0
---
function AtlasLoot_ClearQuickLookButton(button)
	if not button or button == nil then return end
	AtlasTWCharDB["QuickLooks"][button] = nil
	AtlasLoot_RefreshQuickLookButtons()
	print(BLUE.."AtlasLoot"..": "..WHITE..L["QuickLook"].." "..button.." "..L["has been reset!"])
end

---
--- Splits a string by delimiter with optional limits
--- Custom string splitting function with control over result count
--- @param delim string Delimiter to split by
--- @param str string String to split
--- @param maxNb number|nil Maximum number of splits (0 for unlimited)
--- @param onlyLast boolean|nil If true, return only the last part
--- @return string|table Split results as table or last part if onlyLast
--- @usage local parts = AtlasLoot_Strsplit("|", "a|b|c", 2)
--- @since 1.0.0
---
function AtlasLoot_Strsplit(delim, str, maxNb, onlyLast)
	-- Eliminate bad cases...
	if string.find(str, delim) == nil then
		return { str }
	end
	if maxNb == nil or maxNb < 1 then
		maxNb = 0
	end
	local result = {}
	local pat = "(.-)" .. delim .. "()"
	local nb = 0
	local lastPos
	for part, pos in string.gfind(str, pat) do
		nb = nb + 1
		result[nb] = part
		lastPos = pos
		if nb == maxNb then break end
	end
	-- Handle the last field
	if nb ~= maxNb then
		result[nb+1] = string.sub(str, lastPos)
	end
	if onlyLast then
		return result[nb+1]
	else
		return result[1], result[2]
	end
end

---
--- Creates a universal loading indicator frame
--- Generates animated spinner with backdrop for loading states
--- @param frameName string Name for the loading frame
--- @param parentFrame table Parent frame to attach loading indicator to
--- @param debugName string|nil Optional debug name for console output
--- @return void
--- @usage AtlasLoot_CreateLoadingFrame("MyLoadingFrame", parentFrame, "MyLoader")
--- @since 1.0.0
---
function AtlasLoot_CreateLoadingFrame(frameName, parentFrame, debugName)
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
		print("AtlasLoot: show " .. debugName .. " spinner")
	end
end

---
--- Hides a loading indicator frame
--- Stops animation and hides the specified loading frame
--- @param frameName string Name of the loading frame to hide
--- @param debugName string|nil Optional debug name for console output
--- @return void
--- @usage AtlasLoot_HideLoadingFrame("MyLoadingFrame", "MyLoader")
--- @since 1.0.0
---
function AtlasLoot_HideLoadingFrame(frameName, debugName)
	local loadingFrame = getglobal(frameName)
	if loadingFrame then
		loadingFrame:Hide()
		if debugName then
			print("AtlasLoot: hide " .. debugName .. " spinner")
		end
	end
end

---
--- Shows loading indicator for the scroll bar area
--- Displays spinner overlay on the main items frame
--- @return void
--- @usage AtlasLoot_ShowScrollBarLoading()
--- @since 1.0.0
---
function AtlasLoot_ShowScrollBarLoading()
	AtlasLoot_CreateLoadingFrame("AtlasLootScrollBarLoadingFrame", AtlasLootItemsFrame)
end

---
--- Hides loading indicator for the scroll bar area
--- Removes spinner overlay from the main items frame
--- @return void
--- @usage AtlasLoot_HideScrollBarLoading()
--- @since 1.0.0
---
function AtlasLoot_HideScrollBarLoading()
	AtlasLoot_HideLoadingFrame("AtlasLootScrollBarLoadingFrame")
end

---
--- Checks player bags for specific items and quantities
--- Returns colored item name based on availability in bags
--- @param id number|string Item ID to search for
--- @param qty number Quantity required (default: 1)
--- @return string Colored item name (WHITE if found, RED if missing)
--- @usage local result = AtlasLoot_CheckBagsForItems(12345, 5)
--- @since 1.0.0
---
function AtlasLoot_CheckBagsForItems(id, qty)
	if not id then print("AtlasLoot_CheckBagsForItems: no ID specified!") return end
	if not qty then qty = 1 end
	local itemsfound = 0
	if not GetItemInfo then return RED..L["Unknown"] end
	local itemName = GetItemInfo(id)
	if not itemName then itemName = "Uncached" end
	for i=0,NUM_BAG_FRAMES do
		for j=1,GetContainerNumSlots(i) do
			local itemLink = GetContainerItemLink(i, j)
			if itemLink and AtlasTW.LootUtils.IdFromLink(itemLink) == tonumber(id) then
				local _, stackCount = GetContainerItemInfo(i, j)
				itemsfound = itemsfound + stackCount
				if itemsfound >= qty then
					if qty == 1 then
						return WHITE..itemName
					else
						return WHITE..itemName.." ("..qty..")"
					end
				end
			end
		end
	end
	if qty == 1 then
		return RED..itemName
	else
		return RED..itemName.." ("..qty..")"
	end
end

---
--- Sends item reagent information to chat
--- Outputs crafting reagents for specified item to chat channel
--- @param id number Item ID to get reagents for
--- @param color string Color code for the item name
--- @param name string Item name to display
--- @param safe boolean Whether to use safe chat output
--- @return nil
--- @usage AtlasLoot_SayItemReagents(12345, "|cff0070dd", "Item Name", true)
--- @since 1.0.0
---
function AtlasLoot_SayItemReagents(id, color, name, safe)
	if not id then
		return
	end

	-- Initialize variables
	local chatline = ""
	local itemCount = 0
	local tListActivity = {}
	local tCount = 0

	-- Get active WIM windows
	if WIM_IconItems and WIM_Icon_SortByActivity then
		for key in WIM_IconItems do
			table.insert(tListActivity, key)
			tCount = tCount + 1
		end
		table.sort(tListActivity, WIM_Icon_SortByActivity)
	end

	-- Determine channel and target for message sending
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
	-- Handle craft spells
	if AtlasTW.SpellDB.craftspells[id] then
		local spellData = AtlasTW.SpellDB.craftspells[id]
		local craftitem = spellData.item

		if craftitem and craftitem ~= "" then
			-- Format item quantity string
			local craftnumber = ""
			local quantity = spellData.quantity
			if quantity then
				-- Check quantity type: number or array
				craftnumber = type(quantity) == "table" and (quantity[1] .. "-" .. quantity[2] .. "x") or (quantity .. "x")
			end

			-- Send craft message
			local craftMessage = L["To craft "] .. craftnumber .. AtlasTW.LootUtils.GetChatLink(craftitem) .. L[" the following reagents are needed:"]
			SendChatMessage(craftMessage, channel, nil, chatnumber)

			-- Send reagent list
			local reagents = spellData.reagents
			if reagents then
				for j = 1, table.getn(reagents) do
					local reagentCount = reagents[j][2] or 1
					local reagentItem = reagents[j][1]

					chatline = chatline .. reagentCount .. "x" .. AtlasTW.LootUtils.GetChatLink(reagentItem) .. " "
					itemCount = itemCount + 1

					if itemCount == 4 then
						SendChatMessage(chatline, channel, nil, chatnumber)
						chatline = ""
						itemCount = 0
					end
				end

				if itemCount > 0 then
					SendChatMessage(chatline, channel, nil, chatnumber)
				end
			end
		else
			-- Handle spells without items (reagents only)
			local spellName = spellData.name
			local castMessage = L["To cast "] .. spellName .. L[" the following items are needed:"]
			SendChatMessage(castMessage, channel, nil, chatnumber)

			-- Reset variables for new section
			chatline = ""
			itemCount = 0

			-- Send reagent list for spell
			local reagents = spellData.reagents
			if reagents then
				for j = 1, table.getn(reagents) do
					local reagentCount = reagents[j][2] or 1
					local reagentItem = reagents[j][1]

					chatline = chatline .. reagentCount .. "x" .. AtlasTW.LootUtils.GetChatLink(reagentItem) .. " "
					itemCount = itemCount + 1

					if itemCount == 4 then
						SendChatMessage(chatline, channel, nil, chatnumber)
						chatline = ""
						itemCount = 0
					end
				end

				if itemCount > 0 then
					SendChatMessage(chatline, channel, nil, chatnumber)
				end
			end
		end
	-- Handle enchantments
	elseif AtlasTW.SpellDB.enchants[id] then
		local enchantData = AtlasTW.SpellDB.enchants[id]
		local enchantItem = enchantData["item"]
		local enchantName = enchantData["name"] or GetItemInfo(enchantItem)

		-- Format enchantment link
		local enchantLink = "|cffFFd200|Henchant:" .. id .. ":0:0:0|h[" .. enchantName .. "]|h|r"

		-- Determine message based on item availability
		local message
		if enchantItem then
			message = L["To craft "] .. AtlasTW.LootUtils.GetChatLink(enchantItem) .. L[" you need this: "] .. enchantLink
		else
			message = enchantLink
		end

		-- Send message based on active window
		if tListActivity[1] and WIM_Windows and WIM_Windows[tListActivity[1]].is_visible then
			SendChatMessage(message, channel, nil, chatnumber)
		elseif ChatFrameEditBox:IsVisible() then
			ChatFrameEditBox:Insert(message)
		else
			SendChatMessage(message, channel, nil, chatnumber)
		end

	-- Handle regular items
	else
		local itemMessage
		if safe then
			itemMessage = "[" .. name .. "]"
		else
			itemMessage = "\124" .. string.sub(color, 2) .. "\124Hitem:" .. id .. ":0:0:0\124h[" .. name .. "]\124h\124r"
		end
		SendChatMessage(itemMessage, channel, nil, chatnumber)
	end
end