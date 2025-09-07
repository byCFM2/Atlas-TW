---
--- AtlasLoot.lua - Core loot system and item display functionality
--- 
--- This file contains the main loot system functionality for Atlas-TW.
--- It handles item display, tooltip management, loot data processing,
--- and provides the core infrastructure for the loot browser interface.
--- 
--- Features:
--- - Item display and tooltip management
--- - Loot data processing and caching
--- - Boss navigation and menu systems
--- - Integration with various tooltip addons
--- - Wish list and quick look functionality
--- 
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

AtlasLoot = AceLibrary("AceAddon-2.0"):new("AceDBa-2.0")

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.Loot = AtlasTW.Loot or {}
local BS = AceLibrary("Babble-Spell-2.2a")
--Instance required libraries
local L = AtlasTW.Local

--Compatibility with old EquipCompare/EQCompare
ATLASLOOT_OPTIONS_EQUIPCOMPARE = L["Use EquipCompare"]
ATLASLOOT_OPTIONS_EQUIPCOMPARE_DISABLED = L["|cff9d9d9dUse EquipCompare|r"]

-- Colours stored for code readability
local RED = AtlasLoot_Colors.RED
local WHITE = AtlasLoot_Colors.WHITE
local BLUE = AtlasLoot_Colors.BLUE
local GREEN = AtlasLoot_Colors.GREEN
local GREY = AtlasLoot_Colors.GREY
local ORANGE = AtlasLoot_Colors.ORANGE
local YELLOW = AtlasLoot_Colors.YELLOW

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
--- Formats skill text with appropriate color coding
--- Applies color codes to skill level requirements for display
--- @param skilltext table Table containing skill level values [1-4]
--- @return string Formatted skill text with color codes
--- @usage local formatted = formSkillStyle({"100", "150", "200", "250"})
--- @since 1.0.0
---
local function formSkillStyle(skilltext)
	if not skilltext or type(skilltext) ~= "table" then return "" end
	return L["Skill:"].." "..ORANGE..skilltext[1]..", "..YELLOW..skilltext[2]..", "..
		GREEN..skilltext[3]..", "..GREY..skilltext[4]
end

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
--- @return void
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
           -- AtlasLoot_ForceCacheItemWithDelay(itemInfo[1], 1)
            checkedItem = AtlasLoot_CheckBagsForItems(itemInfo[1], itemInfo[2] or 1)
        else
            -- Tool is just itemID
          --  AtlasLoot_ForceCacheItemWithDelay(itemInfo, 1)
            checkedItem = AtlasLoot_CheckBagsForItems(itemInfo)
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


local function AtlasLoot_GetChatLink(id)
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
			if itemLink and AtlasLoot_IdFromLink(itemLink) == tonumber(id) then
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
			local craftMessage = L["To craft "] .. craftnumber .. AtlasLoot_GetChatLink(craftitem) .. L[" the following reagents are needed:"]
			SendChatMessage(craftMessage, channel, nil, chatnumber)

			-- Send reagent list
			local reagents = spellData.reagents
			if reagents then
				for j = 1, table.getn(reagents) do
					local reagentCount = reagents[j][2] or 1
					local reagentItem = reagents[j][1]

					chatline = chatline .. reagentCount .. "x" .. AtlasLoot_GetChatLink(reagentItem) .. " "
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

					chatline = chatline .. reagentCount .. "x" .. AtlasLoot_GetChatLink(reagentItem) .. " "
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
			message = L["To craft "] .. AtlasLoot_GetChatLink(enchantItem) .. L[" you need this: "] .. enchantLink
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