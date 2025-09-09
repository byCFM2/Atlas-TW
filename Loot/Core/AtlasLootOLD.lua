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

--Make the Hewdrop menu in the standalone loot browser accessible here
AtlasLoot_Hewdrop = AceLibrary("Hewdrop-2.0")

-- Colours stored for code readability
local RED = "|cffff0000"
local WHITE = "|cffFFFFFF"
local BLUE = "|cff0070dd"
local DEFAULT = "|cffFFd200"
local GREEN = "|cff00FF00"
local GREY = "|cff9d9d9d"
local ORANGE = "|cffFFA500"
local PURPLE = "|cff9370DB"
local YELLOW = "|cffFFD700"

--Set the default anchor for the loot frame to the Atlas frame
--AtlasLoot_AnchorFrame = AtlasLootItemsFrame

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

---
--- Removes all WoW formatting codes from text
--- Strips color codes, links, icons, and other formatting elements
--- @param text string Text to strip formatting from
--- @return string Clean text without formatting codes
--- @usage local clean = StripFormatting("|cffff0000Red Text|r")
--- @since 1.0.0
---
local function StripFormatting(text)
	-- Check if text is empty
 	if not text then return "" end
	-- Remove all possible WoW formatting codes
	-- Color codes |cffRRGGBB...|r
--	text = string.gsub(text, "|c%x%x%x%x%x%x%x%x(.-)|r", "%1")
	text = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
	-- Remove remaining |r codes (closing color codes)
	text = string.gsub(text, "|r", "")
	-- Remove links |Hlink|htext|h
	text = string.gsub(text, "|H(.-)|h(.-)|h", "%2")
	-- Remove icons |Tpath|t
	text = string.gsub(text, "|T.-|t", "")
	-- Remove line breaks |n
	text = string.gsub(text, "|n", "")
	-- Remove any other codes starting with |
	text = string.gsub(text, "|%w+", "")
	text = string.gsub(text, "|%d+", "")
	-- Remove remaining single | symbols
	text = string.gsub(text, "|", "")
	-- Remove all types of brackets and their content
	text = string.gsub(text, "%(.-%)", "")  -- Round brackets ()
	text = string.gsub(text, "%[.-%]", "")  -- Square brackets []
	text = string.gsub(text, "%{.-%}", "")  -- Curly brackets {}
	text = string.gsub(text, "%<.-%>", "")  -- Angle brackets <>
    return text
end

---
--- Truncates text to specified length with ellipsis
--- Strips formatting before measuring length and adds "..." if needed
--- @param text string Text to truncate
--- @param maxLength number Maximum allowed length
--- @return string Truncated text with ellipsis if needed
--- @usage local short = TruncateText("Very long text", 10)
--- @since 1.0.0
---
local function TruncateText(text, maxLength)
    local stripped_text = StripFormatting(text)
    local current_len = string.len(stripped_text)
    if current_len > maxLength then
        -- If maxLength is too small for "...", just return "..."
        if maxLength <= 3 then
            return "..."
        end

        local truncated_stripped_text = string.sub(stripped_text, 1, maxLength - 3) .. "..."
        return truncated_stripped_text
    else
        return stripped_text
    end
end

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
--- Handles VARIABLES_LOADED event and initializes addon
--- Sets up character database, wish lists, and UI special frames
--- Disables unavailable addon integration options
--- @return void
--- @usage Called automatically on VARIABLES_LOADED event
--- @since 1.0.0
---
function AtlasLoot_OnEvent()
	if not AtlasTWCharDB then AtlasTWCharDB = {} end
	if not AtlasTWCharDB["WishList"] then AtlasTWCharDB["WishList"] = {} end
	if not AtlasTWCharDB["QuickLooks"] then AtlasTWCharDB["QuickLooks"] = {} end
	if not AtlasTWCharDB["SearchResult"] then AtlasTWCharDB["SearchResult"] = {} end

	-- Invalidate category cache after initialization
	if AtlasLoot_InvalidateCategorizedList then
		AtlasLoot_InvalidateCategorizedList("WishList")
		AtlasLoot_InvalidateCategorizedList("SearchResult")
	end

	--Add the loot browser to the special frames tables to enable closing wih the ESC key
	tinsert(UISpecialFrames, "AtlasLootOptionsFrame")
	--Disable checkboxes of missing addons
	if not LootLink_SetTooltip then
		AtlasTWOptionLootlinkTT:Disable()
		AtlasTWOptionLootlinkTTText:SetText(L["|cff9d9d9dLootlink Tooltips|r"])
	end
	if not ItemSync and not ISync then
		AtlasTWOptionItemSyncTT:Disable()
		AtlasTWOptionItemSyncTTText:SetText(L["|cff9d9d9dItemSync Tooltips|r"])
	end
	if not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare") then
		AtlasTWOptionEquipCompare:Disable()
		AtlasTWOptionEquipCompareText:SetText(L["|cff9d9d9dUse EquipCompare|r"])
	end

	--Set up options frame
	AtlasTW.OptionsInit()

	UIPanelWindows['AtlasLootOptionsFrame'] = {area = 'center', pushable = 0}

	--Legacy code for those using the ultimately failed attempt at making Atlas load on demand
	if AtlasButton_LoadAtlas then
		AtlasButton_LoadAtlas()
	end

	--Disable options that don't have the supporting mods
	if not LootLink_SetTooltip and AtlasTWOptions.LootlinkTT == true then
		AtlasTWOptions.LootlinkTT = false
		AtlasTWOptions.LootDefaultTT = true
	end
	if not ItemSync and not ISync and AtlasTWOptions.LootItemSyncTT == true then
		AtlasTWOptions.LootItemSyncTT = false
		AtlasTWOptions.LootDefaultTT = true
	end
	if not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare") and AtlasTWOptions.EquipCompare == true then
		AtlasTWOptions.LootEquipCompare = false
	end
	--If using an opaque items frame, change the alpha value of the backing texture

	if AtlasTWOptions.LootOpaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end

	--Set up the menu in the loot browser
	AtlasLoot_HewdropRegister()
	--Enable or disable AtlasLootFu based on seleced options
	--If EquipCompare is available, use it
	if (IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare")) and AtlasTWOptions.EquipCompare == true then
		EquipCompare_RegisterTooltip(AtlasLootTooltip)
		EquipCompare_RegisterTooltip(AtlasLootTooltip2)
	end
	if(IsAddOnLoaded("EQCompare") and (AtlasTWOptions.LootEquipCompare == true)) then
		EQCompare:RegisterTooltip(AtlasLootTooltip)
		EQCompare:RegisterTooltip(AtlasLootTooltip2)
	end
end

---
--- Gets loot data by boss/element name without building indexes
--- Searches through instance data to find matching boss or element
--- @param elemName string Name of the boss or element to find
--- @param instanceName string|nil Optional specific instance to search in
--- @return table|nil Loot data table or nil if not found
--- @usage local loot = GetLootByElemName("Ragnaros", "Molten Core")
--- @since 1.0.0
---
local function GetLootByElemName(elemName, instanceName)
	-- Helper to resolve loot items
	local function AL_ResolveItems(items)
		if type(items) ~= "string" then
			return items
		else
			return AtlasLoot_Data[items] or items
		end
	end

	-- Helper: search within a specific instance
	local function AL_FindInInstance(inst, name)
		if type(inst) ~= "table" then return nil end

		-- Search in Reputations
		if inst.Reputation then
			for _, v in ipairs(inst.Reputation) do
				if v.loot == name or v.name == name then
					return AtlasLoot_Data[v.loot]
				end
			end
		end

		-- Search in Keys
		if inst.Keys then
			for _, v in ipairs(inst.Keys) do
				if v.loot == name or v.name == name then
					return AtlasLoot_Data[v.loot]
				end
			end
		end

		-- Search in Bosses
		if inst.Bosses then
			for _, elemData in ipairs(inst.Bosses) do
				if elemData.name == name or elemData.id == name then
					return AL_ResolveItems(elemData.items or elemData.loot)
				end
			end
		end

		return nil
	end

	-- If a specific instance is provided
	if instanceName and AtlasTW.InstanceData[instanceName] then
		return AL_FindInInstance(AtlasTW.InstanceData[instanceName], elemName)
	end

	-- Search across all instances
	for _, inst in pairs(AtlasTW.InstanceData) do
		local result = AL_FindInInstance(inst, elemName)
		if result then
			return result
		end
	end

	return nil
end

---
--- Gets loot data by numeric ID within a specific zone
--- Searches through reputation, keys, and bosses in order
--- @param zoneID string Zone identifier to search within
--- @param id number Numeric ID of the element
--- @return table|string|nil Loot data or nil if not found
--- @usage local loot = GetLootByID("MC", 3)
--- @since 1.0.0
---
local function GetLootByID(zoneID, id)
    local instData = AtlasTW.InstanceData[zoneID]
    if not instData then return end
    local bossIndex = id
    if instData.Reputation then
		local numLines = getn(instData.Reputation)
        if bossIndex <= numLines then
            return instData.Reputation[bossIndex].loot
        end
        bossIndex = bossIndex - numLines
    end
    if instData.Keys then
		local numLines = getn(instData.Keys)
        if bossIndex <= numLines then
            return instData.Keys[bossIndex].loot
        end
        bossIndex = bossIndex - numLines
    end
    if instData.Bosses and instData.Bosses[bossIndex] and instData.Bosses[bossIndex].items then
        return instData.Bosses[bossIndex].items
    end
    return nil
end

---
--- Updates the scroll bar display for Atlas boss list
--- Manages visibility and state of boss line elements based on scroll position
--- Handles loot indicators and selection highlighting
--- @return void
--- @usage AtlasTW.Loot.ScrollBarUpdate()
--- @since 1.0.0
---
function AtlasTW.Loot.ScrollBarUpdate()
	local lineplusoffset
	local highlightTexture
	if _G["AtlasBossLine1_Text"] ~= nil then
		local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]

		--Update the contents of the Atlas scroll frames
		FauxScrollFrame_Update(AtlasTWScrollBar, AtlasTW.CurrentLine, AtlasTW.NUM_LINES, 15)

		--Make note of how far in the scroll frame we are

		-- Now show only needed elements
		for line=1, AtlasTW.NUM_LINES do
			lineplusoffset = line + FauxScrollFrame_GetOffset(AtlasTWScrollBar)
			local bossLine = _G["AtlasBossLine"..line]
			if bossLine and lineplusoffset <= AtlasTW.CurrentLine then
				-- Enable interactivity and texture for visible buttons
				bossLine:Show()
				bossLine:EnableMouse(true)
				highlightTexture = bossLine:GetHighlightTexture()
				highlightTexture:Show()
				local loot = _G["AtlasBossLine"..line.."_Loot"]
				local selected = _G["AtlasBossLine"..line.."_Selected"]
				_G["AtlasBossLine"..line.."_Text"]:SetText(AtlasTW.ScrollList[lineplusoffset].line)
				--local instData = AtlasTW.InstanceData[zoneID]
				local hasLoot = GetLootByID(zoneID, lineplusoffset)
				if AtlasLootItemsFrame.activeElement == lineplusoffset then
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
				--Hide lines that are not needed
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


-- Global cache of checked item sets
if not ATLASTWLOOT_CHECKED_SETS then
    ATLASTWLOOT_CHECKED_SETS = {}
    ATLASTWLOOT_CHECKED_SETS_COUNT = 0
end

-- Periodic cache cleanup for memory optimization
local function CleanupMemoCache()
    if ATLASTWLOOT_CHECKED_SETS_COUNT > 100 then
        ATLASTWLOOT_CHECKED_SETS = {}
        ATLASTWLOOT_CHECKED_SETS_COUNT = 0
    end
end

---
--- Creates a hash string from an item list for caching purposes
--- Sorts the item list and concatenates IDs for stable hash generation
--- @param itemList table List of item IDs to hash
--- @return string Hash string representing the item set
--- @usage local hash = CreateItemSetHash({1234, 5678, 9012})
--- @since 1.0.0
---
local function CreateItemSetHash(itemList)
    table.sort(itemList)  -- Sort for stable hash
    return table.concat(itemList, ",")
end

---
--- Caches all items from a loot table for tooltip performance
--- Processes item data and triggers client-side item caching
--- @param dataSource table Loot data table containing items to cache
--- @param callback function|nil Optional callback to execute when caching completes
--- @return void
--- @usage CacheAllLootItems(lootData, function() print("Caching complete") end)
--- @since 1.0.0
---
local function CacheAllLootItems(dataSource, callback)
    CleanupMemoCache()
    if not dataSource or type(dataSource) ~= "table" then
        if callback then callback() end
        return --print("CacheAllLooItems: dataSource is not a table"..(dataSource or "dataSource not string"))
    end
    local itemsToCache = {}

    -- Collect all item IDs for caching
    for i = 1, getn(dataSource) do
        local item = dataSource[i]
        local itemID = nil
		if item then
			if type(item) == "table" then
				-- Check different data formats
				if item.id then
					itemID = item.id
					--Check for spell or enchant
					if item.skill and item.type~="item" then
						--print("item.skill: "..(itemID or "no itemID"))
						if AtlasTW.SpellDB.enchants[itemID] then
							itemID = AtlasTW.SpellDB.enchants[itemID].item
						elseif AtlasTW.SpellDB.craftspells[itemID] then
							itemID = AtlasTW.SpellDB.craftspells[itemID].item
						end
						--print("item.skill: new "..(itemID or "no itemID"))
					end
				elseif item[1] then
					itemID = item[1]
				end
			elseif type(item) == "number" then
				itemID = item
			end
			if itemID and itemID ~= 0 then
				table.insert(itemsToCache, itemID)
			end
		end
    end

    local totalToCache = getn(itemsToCache)

    if totalToCache == 0 then
        if callback then callback() end
        return
    end

    -- Memoization check: if this set is already fully cached, skip checks
    local itemsCopy = {}
    for i = 1, getn(itemsToCache) do itemsCopy[i] = itemsToCache[i] end
    local setHash = CreateItemSetHash(itemsCopy)
    if ATLASTWLOOT_CHECKED_SETS[setHash] then
        if callback then callback() end
        return
    end

    -- Super-fast preliminary check: test first 5 items
    local quickCheckCount = math.min(5, totalToCache)
    local quickCachedCount = 0

    for i = 1, quickCheckCount do
        local itemID = itemsToCache[i]
        if GetItemInfo(itemID) then
            quickCachedCount = quickCachedCount + 1
        end
    end

    -- If all checked items are cached, probably others are cached too
    local probablyAllCached = (quickCachedCount == quickCheckCount)

    -- Full check: check all items synchronously
    local uncachedItems = {}
    local alreadyCachedCount = 0

    for i = 1, totalToCache do
        local itemID = itemsToCache[i]
        if GetItemInfo(itemID) then
            alreadyCachedCount = alreadyCachedCount + 1
        else
            table.insert(uncachedItems, itemID)
            -- If expected everything cached but found uncached item
            if probablyAllCached then
                probablyAllCached = false
            end
        end
    end

    local uncachedCount = getn(uncachedItems)

    -- If all items already cached, instantly call callback
    if uncachedCount == 0 then
        if not ATLASTWLOOT_CHECKED_SETS[setHash] then
            ATLASTWLOOT_CHECKED_SETS[setHash] = true
            ATLASTWLOOT_CHECKED_SETS_COUNT = ATLASTWLOOT_CHECKED_SETS_COUNT + 1
        end
        if callback then
            callback()
        end
        return
    end

    -- Batching for large sets: 3 items per tick, 0.07s then 0.09s, max 2 iterations
        local batchSize = 3
        local maxIterations = 2
        local iteration = 1

        local tooltipName = "AtlasLootHiddenTooltip_Batch"
        local tooltip = _G[tooltipName]
        if not tooltip then
            tooltip = CreateFrame("GameTooltip", tooltipName, UIParent, "GameTooltipTemplate")
            tooltip:SetOwner(UIParent, "ANCHOR_NONE")
            _G[tooltipName] = tooltip
        end

        local function runIteration()
            local idx = 1
            local total = getn(uncachedItems)

			local function processBatch()
                local processed = 0
                while processed < batchSize and idx <= total do
                    local itemID = uncachedItems[idx]
                    tooltip:ClearLines()
                    tooltip:SetHyperlink("item:" .. itemID .. ":0:0:0")
                    idx = idx + 1
                    processed = processed + 1
                end

                if idx <= total then
                    local delay = (iteration == 1) and 0.07 or 0.09
                    StartTimer(delay, function()
                        processBatch()
                    end)
                else
                    -- After last batch give client short tick, then check remaining
                    local delay = (iteration == 1) and 0.07 or 0.09
                    StartTimer(delay, function()
                        local remaining = {}
                        for i = 1, total do
                            local id = uncachedItems[i]
                            if not GetItemInfo(id) then
                                table.insert(remaining, id)
                            end
                        end
                        uncachedItems = remaining

                        if getn(uncachedItems) == 0 or iteration >= maxIterations then
                            if not ATLASTWLOOT_CHECKED_SETS[setHash] then
                                ATLASTWLOOT_CHECKED_SETS[setHash] = true
                                ATLASTWLOOT_CHECKED_SETS_COUNT = ATLASTWLOOT_CHECKED_SETS_COUNT + 1
                            end
                            if callback then callback() end
                        else
                            iteration = iteration + 1
                            local nextDelay = (iteration == 1) and 0.07 or 0.09
                            StartTimer(nextDelay, function()
                                runIteration()
                            end)
                        end
                    end)
                end
            end
            processBatch()
        end
        runIteration()
end

---
--- Updates the scrollbar and content for the loot items frame
--- Loads and displays loot data for the currently selected element
--- @return nil
--- @usage AtlasTW.Loot.ScrollBarLootUpdate() -- Called when loot data changes
--- @since 1.0.0
---
function AtlasTW.Loot.ScrollBarLootUpdate() --TODO need improve
	--Load data for the current clicked element line
	local dataID = AtlasLootItemsFrame.StoredElement
	local instanceKey = (AtlasLootItemsFrame and type(AtlasLootItemsFrame.StoredMenu)=="string") and AtlasLootItemsFrame.StoredMenu or nil
	local dataSource = GetLootByElemName(dataID, instanceKey) or AtlasLootItemsFrame.StoredMenu

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
		dataSource = AtlasLoot_CategorizeWishList(list)
	else
		if type(dataID) == "string" and (AtlasLoot_Data[dataID] or AtlasLoot_Data[dataSource]) then
			dataSource = AtlasLoot_Data[dataID] or AtlasLoot_Data[dataSource]
		end
		if type(dataSource) == "string" then
			dataSource = GetLootByElemName(dataSource, instanceKey) or dataSource
		end
	end
	--Check if dataID and dataSource are valid
 	if not dataID and not dataSource then
		return print("AtlasTW.Loot.ScrollBarLootUpdate: No dataID and No dataSource!")
	end
	-- Hide navigation buttons by default
	_G["AtlasLootItemsFrame_BACK"]:Hide()
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	if type(dataSource) == "table" then
		local BZ = AceLibrary("Babble-Zone-2.2a")
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
		local num_scroll_steps = 0

		if totalItems > AtlasTW.LOOT_NUM_LINES then
			local numRows = math.ceil(totalItems/ 2)
			num_scroll_steps = numRows - 7 -- TODO need remake
		end
		-- Set scroll bar range
		FauxScrollFrame_Update(AtlasLootScrollBar, num_scroll_steps + 1, 2, 1)
		AtlasLootScrollBar.scrollMax = num_scroll_steps

		local offset = FauxScrollFrame_GetOffset(AtlasLootScrollBar)
		-- Update content and visibility of AtlasLootItem buttons
		for i = 1, AtlasTW.LOOT_NUM_LINES do
			itemButton = _G["AtlasLootItem_"..i]
			menuButton = _G["AtlasLootMenuItem_"..i]

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
					nameFrame = _G["AtlasLootMenuItem_"..i.."_Name"]
					iconFrame = _G["AtlasLootMenuItem_"..i.."_Icon"]
					extraFrame = _G["AtlasLootMenuItem_"..i.."_Extra"]
					borderFrame = _G["AtlasLootMenuItem_"..i.."Border"]
					quantityFrame = nil
					local element = dataSource[itemIndex]
					defaultIcon = dataID.defaultIcon or "Interface\\Icons\\INV_Misc_QuestionMark"
					if element.name then
						if element.extra then
							extraText = BZ[element.extra]
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
					nameFrame = _G["AtlasLootItem_"..i.."_Name"]
					iconFrame = _G["AtlasLootItem_"..i.."_Icon"]
					extraFrame = _G["AtlasLootItem_"..i.."_Extra"]
					borderFrame = _G["AtlasLootItem_"..i.."Border"]
					quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]

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
							link = AtlasTW.SpellDB.enchants[elemID] or AtlasTW.SpellDB.craftspells[elemID]
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
								CacheAllLootItems(link and link.reagents)
								CacheAllLootItems(link and link.tools)
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
							nameFrame:SetText(itemName or L["Item not found in cache"])
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
							nameFrame:SetText(itemName or L["Item not found in cache"])
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
				nameFrame = _G["AtlasLootMenuItem_"..i.."_Name"]
				iconFrame = _G["AtlasLootMenuItem_"..i.."_Icon"]
				extraFrame = _G["AtlasLootMenuItem_"..i.."_Extra"]
				borderFrame = _G["AtlasLootMenuItem_"..i.."Border"]
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
				iconFrame = _G["AtlasLootItem_"..i.."_Icon"]
				extraFrame = _G["AtlasLootItem_"..i.."_Extra"]
				borderFrame = _G["AtlasLootItem_"..i.."Border"]
				quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
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
	if AtlasLootItemsFrame.StoredBackMenuName then
		_G["AtlasLootItemsFrame_BACK"]:Show()
		_G["AtlasLootItemsFrame_BACK"].lootpage = "BackToMenu"
		_G["AtlasLootItemsFrame_BACK"].title = AtlasLootItemsFrame.StoredBackMenuName
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
			nav = AtlasLoot_GetBossNavigation(dataID)
		end

		-- If boss navigation not found, try menu navigation
		if not nav and type(AtlasLoot_GetMenuNavigation) == "function" then
			nav = AtlasLoot_GetMenuNavigation(dataID)
		end

		-- If navigation not found and we have StoredBackMenuName, try to find navigation for it
		if not nav and AtlasLootItemsFrame.StoredBackMenuName then
			local backMenuKey = AtlasLootItemsFrame.StoredBackMenuName
			nav = AtlasLoot_GetMenuNavigation(backMenuKey)
			if nav then
				-- Add "Back" button to parent menu
				nav.Back_Page = "BackToMenu"
				nav.Back_Title = backMenuKey
			end
		end

		if nav then
			if nav.Next_Page then
				_G["AtlasLootItemsFrame_NEXT"]:Show()
				_G["AtlasLootItemsFrame_NEXT"].lootpage = nav.Next_Page
				_G["AtlasLootItemsFrame_NEXT"].title = nav.Next_Title
			end
			if nav.Prev_Page then
				_G["AtlasLootItemsFrame_PREV"]:Show()
				_G["AtlasLootItemsFrame_PREV"].lootpage = nav.Prev_Page
				_G["AtlasLootItemsFrame_PREV"].title = nav.Prev_Title
			end
			if nav.Back_Page then
				_G["AtlasLootItemsFrame_BACK"]:Show()
				_G["AtlasLootItemsFrame_BACK"].lootpage = nav.Back_Page
				_G["AtlasLootItemsFrame_BACK"].title = nav.Back_Title
			end
		end
	end

	-- QuickLooks display management: hide on search/wishlist, show on regular pages
	if dataID == "SearchResult" or dataID == "WishList" then
    	AtlasLoot_QuickLooks:Hide()
    	AtlasLootQuickLooksButton:Hide()
	else
		if AtlasLoot_QuickLooks then
			AtlasLoot_QuickLooks:SetText(L["QuickLook"])
			AtlasLoot_QuickLooks:Show()
		end
		if AtlasLootQuickLooksButton then
			AtlasLootQuickLooksButton:Show()
		end
	end

	-- Set the loot page name
	if dataID == "SearchResult" then
		local text = AtlasTWCharDB and AtlasTWCharDB.LastSearchedText or ""
		AtlasLoot_LootPageName:SetText(string.format(L["Search Result: %s"], text))
	elseif dataID == "WishList" then
		AtlasLoot_LootPageName:SetText(L["Wish List"] or "Wish List")
	else
		AtlasLoot_LootPageName:SetText(dataID and type(dataID)=="string" and dataID or (dataID and dataID.menuName))
	end

	--Hide the container frame
	AtlasLootItemsFrameContainer:Hide()

	--Show the loot frame
	AtlasLootItemsFrame:Show()
end

function AtlasTW.Loot.PrepMenu(menuTitle, menuItems, prevMenuText, defIcon)
    AtlasLootItemsFrame.StoredElement = { menuName = menuTitle, defaultIcon = defIcon }
    AtlasLootItemsFrame.StoredMenu = menuItems
    AtlasLootItemsFrame.StoredBackMenuName = prevMenuText
    AtlasTW.Loot.ScrollBarLootUpdate()
end

---
--- Handles click events on boss/element buttons in the Atlas frame
--- Shows or hides the loot frame and loads appropriate loot data
--- @param buttonName string Name of the clicked button (unused parameter)
--- @return nil
--- @usage AtlasLootBoss_OnClick() -- Called by button click events
--- @since 1.0.0
---
function AtlasLootBoss_OnClick(buttonName)
	-- Reset scroll position to top
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)
   local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local id = this.idnum
    local elemName = AtlasTW.ScrollList[id].name
	local lootTable = GetLootByElemName(elemName,zoneID)

    if AtlasLootItemsFrame.activeElement == id then
        AtlasLootItemsFrame:Hide()
        AtlasLootItemsFrame.activeElement = nil
    else
		--Get the loot table for the element, either by name or by ID how reserv metod
        if lootTable then
		   --Store the loot table, boss name and navigation pages
			AtlasLootItemsFrame.StoredElement = elemName
			AtlasLootItemsFrame.StoredMenu = zoneID
            AtlasLootItemsFrame.activeElement = id
			AtlasLootItemsFrame:Show()
			AtlasLoot_ShowScrollBarLoading()
			CacheAllLootItems(lootTable, function()
				AtlasLoot_HideScrollBarLoading()
				-- Update scrollbar
				AtlasTW.Loot.ScrollBarLootUpdate()
			end)
        else
            AtlasLootItemsFrame:Hide()
            AtlasLootItemsFrame.activeElement = nil
        end
    end

    AtlasTW.Loot.ScrollBarUpdate()
  --  AtlasLootItemsFrame.externalBoss = nil

    if AtlasTW.Quest.UI.InsideAtlasFrame then
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    end
end
---
--- Handles clicks on AtlasLoot Hewdrop menu items
--- Processes menu selection and displays corresponding loot table
--- @param tablename string|table Name of the loot table to display
--- @param text string Heading text for the loot table
--- @param tabletype string Whether tablename indexes actual table or submenu
--- @return void
--- @usage AtlasLoot_HewdropClick("MC_Ragnaros", "Ragnaros", "Boss")
--- @since 1.0.0
---
function AtlasLoot_HewdropClick(tablename, text, tabletype)
	-- Reset scroll to top, as in clicks on dungeon page items
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)

	if not tablename then return end

	-- Save parent menu for "Back" button
	local prevStored = AtlasLootItemsFrame.StoredElement
	if type(prevStored) == "table" and prevStored.menuName then
		AtlasLootItemsFrame.StoredBackMenuName = prevStored.menuName
	end

	-- Initialize table source and page name
	local TableSource = tablename
	local pagename = text

	-- If item from Dungeons, try to determine instance and first boss
	local effectiveInstanceKey, effectiveFirstBoss
	if type(tablename) == "string" and AtlasTW and AtlasTW.MenuData and AtlasTW.MenuData.Dungeons then
		for _, entry in ipairs(AtlasTW.MenuData.Dungeons) do
			if entry and (entry.lootpage == tablename or entry.lootpage == tablename) then
				effectiveInstanceKey = entry.lootpage
				effectiveFirstBoss = entry.firstBoss
				break
			end
		end
	end

	if effectiveInstanceKey and effectiveFirstBoss then
		TableSource = effectiveInstanceKey
		pagename = effectiveFirstBoss
		AtlasLootItemsFrame.StoredCurrentInstance = effectiveInstanceKey

		-- Set current instance in Atlas dropdown lists
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
							if AtlasTW.Refresh then AtlasTW.Refresh() end
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
		-- After changing instance, select first boss in right list if it exists
		if effectiveFirstBoss then
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
			AtlasTW.Loot.ScrollBarUpdate()
		end
	end
	-- Special handling for Rare Mobs
	if pagename == L["Rare Mobs"] then
		pagename = L["Shade Mage"]
	end

	-- Remove color codes from text if available
	if StripFormatting then
		pagename = StripFormatting(pagename)
	end

	-- Display and loading
	AtlasLootItemsFrame:Show()
	AtlasLoot_ShowScrollBarLoading()

	AtlasLootItemsFrame.StoredElement = pagename
	AtlasLootItemsFrame.StoredMenu = TableSource

	local newTable = nil
	if type(TableSource) == "table" then
		newTable = TableSource
	elseif type(TableSource) == "string" then
		newTable = AtlasLoot_Data[TableSource]
		if not newTable and type(pagename) == "string" then
			newTable = GetLootByElemName(pagename, TableSource)
		end
		if not newTable and type(pagename) == "string" then
			newTable = GetLootByElemName(pagename)
		end
		if not newTable then
			newTable = GetLootByElemName(TableSource)
		end
	end

	CacheAllLootItems(newTable, function()
		AtlasLoot_HideScrollBarLoading()
		AtlasTW.Loot.ScrollBarLootUpdate()
	end)

	AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(pagename, 30))
	AtlasLootItemsFrame_SelectedCategory:Show()
	AtlasLoot_Hewdrop:Close(1)
end

---
--- Constructs and registers the main category menu
--- Creates tiered dropdown menu structure for loot browsing
--- @return void
--- @usage AtlasLoot_HewdropRegister()
--- @since 1.0.0
---
function AtlasLoot_HewdropRegister()
	AtlasLoot_Hewdrop:Register(AtlasLootItemsFrame_Menu,
		'point', function()
			return "TOP", "BOTTOM"
		end,
		'children', function(level, value)
			if level == 1 then
				if AtlasLoot_HewdropDown then
					for _,v in ipairs(AtlasLoot_HewdropDown) do
						--If a link to show a submenu
						if type(v[1]) == "table" and type(v[1][1]) == "string" then
							if v[1][3] == "Submenu" then
								AtlasLoot_Hewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_HewdropClick,
									'arg1', v[1][2],
									'arg2', v[1][1],
									'arg3', v[1][3],
									'notCheckable', true
								)
							end
						else
							local lock=0
							--If an entry linked to a subtable
							for i,j in pairs(v) do
								if lock==0 then
									AtlasLoot_Hewdrop:AddLine(
										'text', i,
										'textR', 1,
										'textG', 0.82,
										'textB', 0,
										'hasArrow', true,
										'value', j,
										'func', AtlasLoot_OpenMenu,
										'arg1', i,
										'notCheckable', true
									)
									lock=1
								end
							end
						end
					end
				end
			elseif level == 2 then
				if value then
					for _,v in ipairs(value) do
						if type(v) == "table" then
							if type(v[1]) == "table" and type(v[1][1]) == "string" then
								--If an entry to show a submenu
								if v[1][3] == "Submenu" then
									AtlasLoot_Hewdrop:AddLine(
										'text', v[1][1],
										'textR', 1,
										'textG', 0.82,
										'textB', 0,
										'func', AtlasLoot_HewdropClick,
										'arg1', v[1][2],
										'arg2', v[1][1],
										'arg3', v[1][3],
										'notCheckable', true
								)
								--An entry to show a specific loot page
							else
								AtlasLoot_Hewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_HewdropClick,
									'arg1', v[1][2],
									'arg2', v[1][1],
									'arg3', v[1][3] or "Table",
									'notCheckable', true
								)
							end
							else
								local lock=0
								--Entry to link to a sub table
								for i,j in pairs(v) do
									if lock==0 then
										AtlasLoot_Hewdrop:AddLine(
											'text', i,
											'textR', 1,
											'textG', 0.82,
											'textB', 0,
											'hasArrow', true,
											'value', j,
											'notCheckable', true
										)
										lock=1
									end
								end
							end
						end
					end
				end
			elseif level == 3 then
				--Essentially the same as level == 2
				if value then
					for k,v in pairs(value) do
						if type(v[1]) == "string" then
							if v[3] == "Submenu" then
								AtlasLoot_Hewdrop:AddLine(
									'text', v[1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_HewdropClick,
									'arg1', v[2],
									'arg2', v[1],
									'arg3', v[3],
									'notCheckable', true
								)
							else
							AtlasLoot_Hewdrop:AddLine(
								'text', v[1],
								'textR', 1,
								'textG', 0.82,
								'textB', 0,
								'func', AtlasLoot_HewdropClick,
								'arg1', v[2],
								'arg2', v[1],
								'arg3', v[3] or "Table",
								'notCheckable', true
							)
							end
						elseif type(v) == "table" then
							AtlasLoot_Hewdrop:AddLine(
								'text', k,
								'textR', 1,
								'textG', 0.82,
								'textB', 0,
								'hasArrow', true,
								'value', v,
								'notCheckable', true
							)
						end
					end
				end
			end
		end,
		'dontHook', true
	)
end

---
--- Opens a specific loot menu category
--- Maps menu names to their corresponding functions and executes them
--- @param menuName string Name of the menu to open
--- @return nil
--- @usage AtlasLoot_OpenMenu("Crafting") -- Opens crafting menu
--- @since 1.0.0
---
function AtlasLoot_OpenMenu(menuName)
	AtlasLoot_QuickLooks:Hide()
	AtlasLootQuickLooksButton:Hide()
	AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(menuName, 30))
	local menuMapping = {
		[L["Crafting"]] = "AtlasLoot_CraftingMenu",
		[L["World"]] = "AtlasLoot_WorldMenu",
		[L["PvP Rewards"]] = "AtlasLootPvPMenu",
		[L["World Events"]] = "AtlasLootWorldEventMenu",
		[L["Collections"]] = "AtlasLootSetMenu",
		[L["Factions"]] = "AtlasLootRepMenu",
		[L["Dungeons & Raids"]] = "AtlasLoot_DungeonsMenu",
		[BS["Alchemy"]] = "AtlasLoot_AlchemyMenu",
		[BS["Blacksmithing"]] = "AtlasLoot_SmithingMenu",
		[BS["Enchanting"]] = "AtlasLoot_EnchantingMenu",
		[BS["Engineering"]] = "AtlasLoot_EngineeringMenu",
		[BS["Leatherworking"]] = "AtlasLoot_LeatherworkingMenu",
		[BS["Mining"]] = "AtlasLoot_MiningMenu",
		[BS["Tailoring"]] = "AtlasLoot_TailoringMenu",
		[BS["Jewelcrafting"]] = "AtlasLoot_JewelcraftingMenu",
		[BS["Cooking"]] = "AtlasLoot_CookingMenu",
		[L["Crafted Sets"]] = "AtlasLootCraftedSetMenu",
		[L["PvP Armor Sets"]] = "AtlasLootPVPSetMenu",
		[L["Priest Sets"]] = "AtlasLootPriestSetMenu",
		[L["Mage Sets"]] = "AtlasLootMageSetMenu",
		[L["Warrior Sets"]] = "AtlasLootWarriorSetMenu",
		[L["Rogue Sets"]] = "AtlasLootRogueSetMenu",
		[L["Shaman Sets"]] = "AtlasLootShamanSetMenu",
		[L["Paladin Sets"]] = "AtlasLootPaladinSetMenu",
		[L["Druid Sets"]] = "AtlasLootDruidSetMenu",
		[L["Hunter Sets"]] = "AtlasLootHunterSetMenu",
		[L["Warlock Sets"]] = "AtlasLootWarlockSetMenu",
		[L["Pre 60 Sets"]] = "AtlasLootPRE60SetMenu",
		[L["Zul'Gurub Sets"]] = "AtlasLootZGSetMenu",
		[L["Temple of Ahn'Qiraj Sets"]] = "AtlasLootAQ40SetMenu",
		[L["Ruins of Ahn'Qiraj Sets"]] = "AtlasLootAQ20SetMenu",
		[L["Tower of Karazhan Sets"]] = "AtlasLootUKSetMenu",
		[L["Tier 0/0.5 Sets"]] = "AtlasLootT0SetMenu",
		[L["Tier 1 Sets"]] = "AtlasLootT1SetMenu",
		[L["Tier 2 Sets"]] = "AtlasLootT2SetMenu",
		[L["Tier 3 Sets"]] = "AtlasLootT3SetMenu",
		[L["World Blues"]] = "AtlasLootWorldBluesMenu",
	}

	local lootTable = menuMapping[menuName]
	if lootTable then
		--print("AtlasLoot_OpenMenu: found menu "..menuName.." -> "..lootTable)
		AtlasLootItemsFrame.StoredElement = { menuName = menuName }
		AtlasLootItemsFrame.StoredMenu = lootTable
		-- Call menu function
		if type(_G[lootTable]) == "function" then
			_G[lootTable]()
		else
			--print("AtlasLoot_OpenMenu: ScrollBarLootUpdate")
			AtlasTW.Loot.ScrollBarLootUpdate()
		end
	else
		--print("AtlasLoot_OpenMenu: menu not found - "..menuName)
	end
	CloseDropDownMenus()
end
---
--- Handles close button click on the loot items frame
--- Resets active element selection and updates boss button display states
--- @return void
--- @usage AtlasLootItemsFrame_OnCloseButton() -- Called by close button click
--- @since 1.0.0
---
function AtlasLootItemsFrame_OnCloseButton()
	--Set no loot table as currently selected
	AtlasLootItemsFrame.activeElement = nil
	--Fix the boss buttons so the correct icons are displayed
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
	--Hide the item frame
	AtlasLootItemsFrame:Hide()
end

---
--- Handles menu item click events in the loot browser
--- Processes container display or loads loot data based on menu selection
--- @param button string Button identifier for the clicked menu item
--- @return void
--- @usage AtlasLootMenuItem_OnClick("button1") -- Called by menu item clicks
--- @since 1.0.0
---
function AtlasLootMenuItem_OnClick(button)
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
                AtlasTW.Loot.ScrollBarUpdate()
            end
        end

		pagename = StripFormatting(pagename)
		dataID = StripFormatting(dataID)
		CloseDropDownMenus()

		AtlasLootItemsFrame:Show()
		AtlasLoot_ShowScrollBarLoading()
		if pagename == L["Rare Mobs"] then
			pagename = L["Shade Mage"]
		end
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
				newTable = GetLootByElemName(pagename, TableSource)
			end
			-- 3) Try globally by name
			if not newTable and type(pagename) == "string" then
				newTable = GetLootByElemName(pagename)
			end
			-- 4) Last resort: try by TableSource itself
			if not newTable then
				newTable = GetLootByElemName(TableSource)
			end
		end
		CacheAllLootItems(newTable, function()
			AtlasLoot_HideScrollBarLoading()
			AtlasTW.Loot.ScrollBarLootUpdate()
		end)
		AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(pagename, 30))
		AtlasLootItemsFrame_SelectedCategory:Show()
	end
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
--- Handles navigation button clicks (Previous, Next, Back)
--- Processes navigation between loot pages and menu sections
--- @return nil
--- @usage AtlasLoot_NavButton_OnClick() -- Called by navigation button clicks
--- @since 1.0.0
---
function AtlasLoot_NavButton_OnClick()
	-- Reset scroll on navigation
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)

	if not this or not this.lootpage then
		return print("NavButton_OnClick: выход - нет this или lootpage")
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
	AtlasLoot_ShowScrollBarLoading()
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
		AtlasTW.Loot.ScrollBarUpdate()
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
		if type(lp) == "string" then
			lootData = AtlasLoot_Data[lp] or GetLootByElemName(lp)
		else
			lootData = lp
		end
	end

	CacheAllLootItems(lootData, function()
		AtlasLoot_HideScrollBarLoading()
		AtlasTW.Loot.ScrollBarLootUpdate()
	end)
	-- Update title text
	local title = this.title or lp
	if title then
		AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(title, 30))
		AtlasLootItemsFrame_SelectedCategory:Show()
	end
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
	local loot = GetLootByElemName and GetLootByElemName(dataID, instanceKey) or nil
	if loot and type(loot) == "table" then
		return true
	end
	-- Try without considering instance
	loot = GetLootByElemName and GetLootByElemName(dataID) or nil
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

---
--- Handles mouse enter events on loot item buttons
--- Shows appropriate tooltip based on item type (item, spell, enchant)
--- @return void
--- @usage AtlasLootItem_OnEnter() -- Called automatically on mouse enter
--- @since 1.0.0
---
function AtlasLootItem_OnEnter()
    if not this or not this.typeID or this.typeID==0 or this.typeID=="" then return end
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
--- @return void
--- @usage AtlasLootItem_OnLeave() -- Called automatically on mouse leave
--- @since 1.0.0
---
function AtlasLootItem_OnLeave()
	--Hide the necessary tooltips
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
--- Handles click events on loot item buttons
--- Processes item links, wish list operations, and chat output based on click type
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return void
--- @usage AtlasLootItem_OnClick("LeftButton") -- Called by item button clicks
--- @since 1.0.0
---
function AtlasLootItem_OnClick(arg1)
	local id = this:GetID()
	local color = strsub(_G["AtlasLootItem_"..id.."_Name"]:GetText() or "", 1, 10)
	local name = strsub(_G["AtlasLootItem_"..id.."_Name"]:GetText() or "", 11)
	local texture = AtlasLoot_Strsplit("\\", getglobal("AtlasLootItem_"..id.."_Icon"):GetTexture(), 0, true)
	local dataID = AtlasLootItemsFrame.StoredElement
	local instanceKeyClick = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil
	local dataSource = GetLootByElemName(dataID, instanceKeyClick)

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
					AtlasLoot_SayItemReagents(this.itemID, nil, itemName, true)
				end
			elseif AtlasTWOptions.LootAllLinks then
				if WIM_EditBoxInFocus then
					WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r")
				elseif ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r")
				else
					AtlasLoot_SayItemReagents(this.itemID, color, name)
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
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
			else
			-- Pass boss and instance context for correct categorization in WishList
			local srcPage = nil
			if dataID and instanceKeyClick then
				srcPage = dataID.."|"..instanceKeyClick
			elseif dataID and AtlasLoot_IsLootTableAvailable and AtlasLoot_IsLootTableAvailable(dataID) then
				-- Craft/set/other loot table page without instanceKey
				srcPage = dataID
			end
				AtlasLoot_AddToWishlist(this.itemID, dataID, instanceKeyClick, "item", srcPage)
		end
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasLoot_Strsplit("|", this.sourcePage)
			-- Normalize Strsplit result (old Lua sometimes returns tables)
			if type(bossName) == "table" then bossName = bossName[1] end
			if type(instanceKey) == "table" then instanceKey = instanceKey[1] end
			local hasLoot = bossName and instanceKey and GetLootByElemName and GetLootByElemName(bossName, instanceKey)
			-- Fallback: if instanceKey turned out to be display name, not key - convert to key
			if not hasLoot and instanceKey and AtlasTW and AtlasTW.InstanceData and not AtlasTW.InstanceData[instanceKey] then
				for k, v in pairs(AtlasTW.InstanceData) do
					if v and v.Name == instanceKey then
						instanceKey = k
						break
					end
				end
				if bossName and instanceKey then
					hasLoot = GetLootByElemName and GetLootByElemName(bossName, instanceKey)
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
					AtlasTW.Loot.ScrollBarUpdate()
				else
					AtlasLootItemsFrame.activeElement = nil
				end
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasLoot_ShowScrollBarLoading()
				local lootTable = GetLootByElemName(bossName, instanceKey)
				CacheAllLootItems(lootTable, function()
					AtlasLoot_HideScrollBarLoading()
					AtlasTW.Loot.ScrollBarLootUpdate()
				end)
			elseif dataID ~= "SearchResult" and dataID ~= "WishList" and AtlasLoot_IsLootTableAvailable(this.sourcePage) then
				-- sourcePage contains only table key (e.g., craft page)
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasLoot_ShowScrollBarLoading()
				local lootTable = AtlasLoot_Data[this.sourcePage] or GetLootByElemName(this.sourcePage)
				CacheAllLootItems(lootTable, function()
					AtlasLoot_HideScrollBarLoading()
					AtlasTW.Loot.ScrollBarLootUpdate()
				end)
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
		end
	elseif this.typeID == "enchant" then
		if IsShiftKeyDown() then
			AtlasLoot_SayItemReagents(this.elemID)
		elseif IsAltKeyDown() and this.elemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.elemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.elemID))
			else
				-- Pass boss and instance context for correct categorization in WishList
				local srcPage = nil
				if dataID and instanceKeyClick then
					srcPage = dataID.."|"..instanceKeyClick
				elseif dataID and AtlasLoot_IsLootTableAvailable and AtlasLoot_IsLootTableAvailable(dataID) then
					-- Craft/set/other loot table page without instanceKey
					srcPage = dataID
				end
				AtlasLoot_AddToWishlist(this.elemID, dataID, instanceKeyClick, "enchant", srcPage)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.itemID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasLoot_Strsplit("|", this.sourcePage)
			-- Normalize Strsplit result
			if type(bossName) == "table" then bossName = bossName[1] end
			if type(instanceKey) == "table" then instanceKey = instanceKey[1] end
			local hasLoot = bossName and instanceKey and GetLootByElemName and GetLootByElemName(bossName, instanceKey)
			if not hasLoot and instanceKey and AtlasTW and AtlasTW.InstanceData and not AtlasTW.InstanceData[instanceKey] then
				for k, v in pairs(AtlasTW.InstanceData) do
					if v and v.Name == instanceKey then
						instanceKey = k
						break
					end
				end
				if bossName and instanceKey then
					hasLoot = GetLootByElemName and GetLootByElemName(bossName, instanceKey)
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
								break
							end
						end
					end
				end
				local bossIndex = FindBossIndexInScrollList(bossName)
				if bossIndex then
					AtlasLootItemsFrame.activeElement = bossIndex
					AtlasTW.Loot.ScrollBarUpdate()
				else
					AtlasLootItemsFrame.activeElement = nil
				end
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasLoot_ShowScrollBarLoading()
				local lootTable = GetLootByElemName(bossName, instanceKey)
				CacheAllLootItems(lootTable, function()
					AtlasLoot_HideScrollBarLoading()
					AtlasTW.Loot.ScrollBarLootUpdate()
				end)
			elseif AtlasLoot_IsLootTableAvailable(this.sourcePage) then
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				AtlasLootItemsFrame:Show()
				AtlasLoot_ShowScrollBarLoading()
				local lootTable = AtlasLoot_Data[this.sourcePage] or GetLootByElemName(this.sourcePage)
				CacheAllLootItems(lootTable, function()
					AtlasLoot_HideScrollBarLoading()
					AtlasTW.Loot.ScrollBarLootUpdate()
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
						WIM_EditBoxInFocus:Insert(AtlasLoot_GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]))
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						ChatFrameEditBox:Insert(AtlasLoot_GetChatLink(craftitem)) -- Fix for Gurky's discord chat bot
					else
						ChatFrameEditBox:Insert(name)
					end
				else
					AtlasLoot_SayItemReagents(this.elemID)
				end
			else
				if WIM_EditBoxInFocus then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						WIM_EditBoxInFocus:Insert(AtlasLoot_GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]))
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = AtlasTW.SpellDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						ChatFrameEditBox:Insert(AtlasLoot_GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]))
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
					SendChatMessage(AtlasLoot_GetChatLink(AtlasTW.SpellDB["craftspells"][this.elemID]["item"]),channel,nil,chatnumber)
				end
			end
		elseif IsAltKeyDown() and this.elemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.elemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.elemID))
			else
				-- Pass boss and instance context for correct categorization in WishList
				local srcPage = nil
				if dataID and instanceKeyClick then
					srcPage = dataID.."|"..instanceKeyClick
				elseif dataID and AtlasLoot_IsLootTableAvailable and AtlasLoot_IsLootTableAvailable(dataID) then
					-- Craft/set/other loot table page without instanceKey
					srcPage = dataID
				end
				AtlasLoot_AddToWishlist(this.elemID, dataID, instanceKeyClick, "spell", srcPage)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.itemID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasLoot_Strsplit("|", this.sourcePage)
			-- Normalize Strsplit result: if table of parts returned, extract [1] and [2]
			if type(bossName) == "table" then
				if not instanceKey then instanceKey = bossName[2] end
				bossName = bossName[1]
			end
			if type(instanceKey) == "table" then instanceKey = instanceKey[1] end
			local hasLoot = bossName and instanceKey and GetLootByElemName and GetLootByElemName(bossName, instanceKey)
			if not hasLoot and instanceKey and AtlasTW and AtlasTW.InstanceData and not AtlasTW.InstanceData[instanceKey] then
				for k, v in pairs(AtlasTW.InstanceData) do
					if v and v.Name == instanceKey then
						instanceKey = k
						break
					end
				end
				if bossName and instanceKey then
					hasLoot = GetLootByElemName and GetLootByElemName(bossName, instanceKey)
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
								break
							end
						end
					end
				end
				local bossIndex = FindBossIndexInScrollList(bossName)
				if bossIndex then
					AtlasLootItemsFrame.activeElement = bossIndex
					AtlasTW.Loot.ScrollBarUpdate()
				else
					AtlasLootItemsFrame.activeElement = nil
				end
				-- Cache entire page before updating
				AtlasLootItemsFrame:Show()
				AtlasLoot_ShowScrollBarLoading()
				local lootTable = GetLootByElemName(bossName, instanceKey)
				CacheAllLootItems(lootTable, function()
					AtlasLoot_HideScrollBarLoading()
					AtlasTW.Loot.ScrollBarLootUpdate()
				end)
			elseif AtlasLoot_IsLootTableAvailable(this.sourcePage) then
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				AtlasLootItemsFrame:Show()
				AtlasLoot_ShowScrollBarLoading()
				local lootTable = AtlasLoot_Data[this.sourcePage] or GetLootByElemName(this.sourcePage)
				CacheAllLootItems(lootTable, function() 
					AtlasLoot_HideScrollBarLoading()
					AtlasTW.Loot.ScrollBarLootUpdate()
				end)
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
		end
	end
end

---
--- Extracts item ID from an item link string
--- Parses WoW item link format to retrieve numeric item ID
--- @param link string Item link in WoW format
--- @return number|nil Item ID or nil if parsing fails
--- @usage local id = AtlasLoot_IDFromLink("|Hitem:12345:0:0:0|h[Item Name]|h")
--- @since 1.0.0
---
function AtlasLoot_IDFromLink(link)
	if not link then
        return nil
    end

	local strsplit = function(str, delimiter)
		local result = {}
		local from = 1
		local delim_from, delim_to = string.find(str, delimiter, from, true)
		while delim_from do
			table.insert(result, string.sub(str, from, delim_from - 1))
			from = delim_to + 1
			delim_from, delim_to = string.find(str, delimiter, from, true)
		end
		table.insert(result, string.sub(str, from))
		return result
	end
    local itemSplit = strsplit(link, ":")

    if itemSplit[2] and tonumber(itemSplit[2]) then
        return tonumber(itemSplit[2])
    end

    return nil
end


local containerItems = {}
local lastSelectedButton

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
--- Shows loading indicator for the container frame
--- Displays spinner overlay on the container items frame
--- @return void
--- @usage AtlasLoot_ShowContainerLoading()
--- @since 1.0.0
---
function AtlasLoot_ShowContainerLoading()
	AtlasLoot_CreateLoadingFrame("AtlasLootContainerLoadingFrame", AtlasLootItemsFrameContainer)
end

---
--- Hides loading indicator for the container frame
--- Removes spinner overlay from the container items frame
--- @return void
--- @usage AtlasLoot_HideContainerLoading()
--- @since 1.0.0
---
function AtlasLoot_HideContainerLoading()
	AtlasLoot_HideLoadingFrame("AtlasLootContainerLoadingFrame")
end

---
--- Shows or toggles the container frame display
--- Manages container visibility and caching for item containers
--- @return void
--- @usage AtlasLoot_ShowContainerFrame()
--- @since 1.0.0
---
function AtlasLoot_ShowContainerFrame()
	if this ~= lastSelectedButton then
		lastSelectedButton = this
		-- Hide old container until caching is complete for new one
		AtlasLootItemsFrameContainer:Hide()
	elseif AtlasLootItemsFrameContainer:IsVisible() then
		AtlasLootItemsFrameContainer:Hide()
		lastSelectedButton = nil
		return
	end
	for i = 1, table.getn(containerItems) do
		getglobal("AtlasLootContainerItem"..i):Hide()
	end

	local containerTable = this.container
	if not containerTable then
		return
	end

	-- Show container with "Loading" placeholder
	AtlasLootItemsFrameContainer:Show()
	AtlasLootItemsFrameContainer:ClearAllPoints()
	AtlasLootItemsFrameContainer:SetPoint("TOPLEFT", this , "BOTTOMLEFT", -2, 2)
	AtlasLootItemsFrameContainer:SetWidth(50)
	AtlasLootItemsFrameContainer:SetHeight(50)

	AtlasLoot_ShowContainerLoading()

	-- Cache all container items asynchronously, then update frame
	CacheAllLootItems(containerTable, function()
		AtlasLoot_UpdateContainerDisplay()
	end)
end

---
--- Updates container display after item caching is complete
--- Calculates optimal layout and displays all container items
--- @return void
--- @usage AtlasLoot_UpdateContainerDisplay() -- Called after caching completes
--- @since 1.0.0
---
function AtlasLoot_UpdateContainerDisplay()
	if not lastSelectedButton or not lastSelectedButton.container then
		return
	end
	AtlasLoot_HideContainerLoading()
	local containerTable = lastSelectedButton.container
	if not AtlasLootItemsFrameContainer:IsVisible() and lastSelectedButton then
		AtlasLootItemsFrameContainer:Show()
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
				containerItems[buttonIndex] = CreateFrame("Button", "AtlasLootContainerItem"..buttonIndex, AtlasLootItemsFrameContainer)
				AtlasLoot_ApplyContainerItemTemplate(containerItems[buttonIndex])
			end
			local itemButton = getglobal("AtlasLootContainerItem"..buttonIndex)
			local itemID
			local quantityText = getglobal("AtlasLootContainerItem"..buttonIndex.."_Quantity")
			if type(containerTable[i]) == "table" then
				itemID = containerTable[i][1]
				quantityText:SetText(containerTable[i][2] and type(containerTable[i][2])=="table" and
					containerTable[i][2][1].."-"..containerTable[i][2][2] or containerTable[i][2])
			else
				itemID = containerTable[i]
				quantityText:SetText("")
				quantityText:Hide()
			end
			local icon = getglobal("AtlasLootContainerItem"..buttonIndex.."Icon")
			local _,_,quality,_,_,_,_,_,tex = GetItemInfo(itemID)
			local r, g, b = 1, 1, 1
			if quality then
				r, g, b  = GetItemQualityColor(quality)
			end
			if not tex then
				tex = "Interface\\Icons\\INV_Misc_QuestionMark"
			end
			-- Place elements in 5x? grid
			itemButton:SetPoint("TOPLEFT", AtlasLootItemsFrameContainer, (col * 35) + 5, -(row * 35) - 5)
			itemButton:SetBackdropBorderColor(r, g, b)
			itemButton:SetID(itemID)
			itemButton:Show()
			quantityText:Show()
			AtlasLoot_AddContainerItemTooltip(itemButton, itemID)
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

		AtlasLootItemsFrameContainer:ClearAllPoints()
		AtlasLootItemsFrameContainer:SetPoint("TOPLEFT", lastSelectedButton , "BOTTOMLEFT", -2, 2)
		AtlasLootItemsFrameContainer:SetWidth(16 + ((row==0 and col or maxCols) * 35))
		AtlasLootItemsFrameContainer:SetHeight(16 + (row * 35))
end

---
--- Adds tooltip functionality to container item frames
--- Sets up OnEnter and OnLeave scripts for item tooltip display
--- @param frame table UI frame to add tooltip to
--- @param itemID number Item ID for tooltip content
--- @return void
--- @usage AtlasLoot_AddContainerItemTooltip(button, 12345)
--- @since 1.0.0
---
function AtlasLoot_AddContainerItemTooltip(frame ,itemID)
	frame:SetScript("OnEnter", function()
        AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 4), -(this:GetHeight() / 4))
        AtlasLootTooltip:SetHyperlink("item:"..tostring(itemID))
        AtlasLootTooltip.itemID = itemID
        local numLines = AtlasLootTooltip:NumLines()
		if AtlasTWOptions.LootItemIDs then
			if numLines and numLines > 0 then
				local lastLine = getglobal("AtlasLootTooltipTextLeft"..numLines)
				if lastLine:GetText() then
					lastLine:SetText(lastLine:GetText().."\n\n"..DEFAULT..L["ItemID:"].." "..itemID)
				end
			end
		end
        AtlasLootTooltip:Show()
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
			AtlasLoot_ForceCacheItem(itemID, 1)
		end
    end)
    frame:SetScript("OnLeave", function()
        AtlasLootTooltip:Hide()
        AtlasLootTooltip.itemID = nil
    end)
end

---
--- Handles click events on container item buttons
--- Processes item links and chat output for container items
--- @param arg1 string Click type ("LeftButton", "RightButton", etc.)
--- @return void
--- @usage AtlasLoot_ContainerItem_OnClick("LeftButton") -- Called by container item clicks
--- @since 1.0.0
---
function AtlasLoot_ContainerItem_OnClick(arg1)
	local itemID = this:GetID()
	local name, link, quality, _, _, _, _, _, tex = GetItemInfo(itemID)
	local _, _, _, color = GetItemQualityColor(quality)
	tex = string.gsub(tex, "Interface\\Icons\\", "")
	local extra = this.extraInfo
	if IsShiftKeyDown() and arg1 == "LeftButton" then
		if AtlasTWOptions.LootAllLinks then
			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..itemID.."\124h["..name.."]|h|r")
			elseif ChatFrameEditBox:IsVisible() then
				ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..itemID.."\124h["..name.."]|h|r")
			end
		end
	elseif(IsControlKeyDown() and name) then
		DressUpItemLink(link)
	elseif(IsAltKeyDown() and (itemID ~= 0)) then
		local ElemName = AtlasLootItemsFrame.StoredElement
		local instKey = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil

		if ElemName == "WishList" then
			AtlasLoot_DeleteFromWishList(this.itemID)
		elseif ElemName == "SearchResult" then
			AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(itemID))
		else
			local srcPage = nil
			if ElemName and instKey then
				srcPage = ElemName.."|"..instKey
			elseif ElemName and AtlasLoot_IsLootTableAvailable and AtlasLoot_IsLootTableAvailable(ElemName) then
				-- Craft/set/other loot table page without instanceKey
				srcPage = ElemName
			end
			AtlasLoot_AddToWishlist(itemID, ElemName, instKey, "item", srcPage)
		end
	end
end

local function idFromLink(itemlink)
	if itemlink then
		local _,_,id = string.find(itemlink, "|Hitem:([^:]+)%:")
		return tonumber(id)
	end
	return nil
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
			if itemLink and idFromLink(itemLink) == tonumber(id) then
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