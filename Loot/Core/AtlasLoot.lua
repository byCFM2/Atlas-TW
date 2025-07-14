AtlasLoot = AceLibrary("AceAddon-2.0"):new("AceDBa-2.0")

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.Loot = AtlasTW.Loot or {}

--Instance required libraries
local L = AtlasTW.Local

--Compatibility with old EquipCompare/EQCompare
ATLASLOOT_OPTIONS_EQUIPCOMPARE = L["Use EquipCompare"]
ATLASLOOT_OPTIONS_EQUIPCOMPARE_DISABLED = L["|cff9d9d9dUse EquipCompare|r"]

--Make the Hewdrop menu in the standalone loot browser accessible here
AtlasLoot_Hewdrop = AceLibrary("Hewdrop-2.0")
AtlasLoot_HewdropSubMenu = AceLibrary("Hewdrop-2.0")

--Variable to cap debug spam
ATLASLOOT_DEBUGSHOWN = false

-- Colours stored for code readability
local RED = "|cffff0000"
local WHITE = "|cffFFFFFF"
local BLUE = "|cff0070dd"
local DEFAULT = "|cffFFd200"

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

AtlasLoot_Data["AtlasLootFallback"] = {
	EmptyInstance = {}
}
-- Функция для ограничения длины текста с учетом паттернов
local function StripFormatting(text)
	-- Проверяем текст на пустоту
 	if not text then return "" end
	-- Сначала удаляем все виды скобок и их содержимое
	text = string.gsub(text, "%(.-%)" , "")  -- Круглые скобки ()
	text = string.gsub(text, "%[.-%]" , "")  -- Квадратные скобки []
	text = string.gsub(text, "%{.-%}" , "")  -- Фигурные скобки {}
	text = string.gsub(text, "<.->", "")     -- Угловые скобки <>

	-- Удаляем все возможные коды форматирования WoW
	-- Цветовые коды |cffRRGGBB...|r
--	text = string.gsub(text, "|c%x%x%x%x%x%x%x%x(.-)|r", "%1")
	text = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
	-- Удаляем оставшиеся |r коды (завершающие цветовые коды)
	text = string.gsub(text, "|r", "")
	-- Удаляем ссылки |Hlink|htext|h
	text = string.gsub(text, "|H(.-)|h(.-)|h", "%2")
	-- Удаляем иконки |Tpath|t
	text = string.gsub(text, "|T.-|t", "")
	-- Удаляем переводы строк |n
	text = string.gsub(text, "|n", "")
	-- Удаляем любые другие коды, начинающиеся с |
	text = string.gsub(text, "|%w+", "")
	text = string.gsub(text, "|%d+", "")
	-- Удаляем оставшиеся одиночные | символы
	text = string.gsub(text, "|", "")
    return text
end

local function TruncateText(text, maxLength)
    local stripped_text = StripFormatting(text)
    local current_len = string.len(stripped_text)
    if current_len > maxLength then
        -- Если maxLength слишком мало для "...", то просто возвращаем "..."
        if maxLength <= 3 then
            return "..."
        end

        local truncated_stripped_text = string.sub(stripped_text, 1, maxLength - 3) .. "..."
        return truncated_stripped_text
    else
        return stripped_text
    end
end

--[[
	Invoked by the VARIABLES_LOADED event. Now that we are sure all the assets
	the addon needs are in place, we can properly set up the mod
]]
function AtlasLoot_GetBossNavigation(dataID)
    if not dataID then return nil end
    for instanceKey, instanceData in pairs(AtlasLoot_TableRegistry) do
        if instanceData.Entry then
            for i, bossData in ipairs(instanceData.Entry) do
                if bossData.ID == dataID then
                    local nav = {}
                    nav.Title = bossData.Title
                    local numEntries = table.getn(instanceData.Entry)

                    -- Previous page (with loop)
                    local prevIndex = i - 1
                    if prevIndex < 1 then
                        prevIndex = numEntries -- Loop to the last item
                    end
                    nav.Prev_Page = instanceData.Entry[prevIndex].ID
                    nav.Prev_Title = instanceData.Entry[prevIndex].Name

                    -- Next page (with loop)
                    local nextIndex = i + 1
                    if nextIndex > numEntries then
                        nextIndex = 1 -- Loop to the first item
                    end
                    nav.Next_Page = instanceData.Entry[nextIndex].ID
                    nav.Next_Title = instanceData.Entry[nextIndex].Name

					nav.Back_Page = AtlasTW.Loot.BackTableRegistry[instanceData.Name] or instanceKey
					nav.Back_Title = instanceData.Name

                    return nav
                end
            end
        end
    end
    return nil
end

function AtlasLoot_OnEvent()
	if not AtlasTWCharDB then AtlasTWCharDB = {} end
	if not AtlasTWCharDB["WishList"] then AtlasTWCharDB["WishList"] = {} end
	if not AtlasTWCharDB["QuickLooks"] then AtlasTWCharDB["QuickLooks"] = {} end
	if not AtlasTWCharDB["SearchResult"] then AtlasTWCharDB["SearchResult"] = {} end

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

	--Position relevant UI objects for loot browser and set up menu
	AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(AtlasTWCharDB.LastBossText, 30))
	AtlasLootItemsFrame_SelectedTable:SetText("")
	AtlasLootItemsFrame_SelectedCategory:Show()
	AtlasLootItemsFrame_SelectedTable:Show()
	AtlasLootItemsFrame_SubMenu:Disable()
end

--[[
	Required as the Atlas function cannot deal with the AtlasLoot button template or the added Atlasloot entries
]]
function AtlasTW.Loot.ScrollBarUpdate()
	local lineplusoffset
	local highlightTexture
	if _G["AtlasBossLine1_Text"] ~= nil then
		local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
		--Update the contents of the Atlas scroll frames
		FauxScrollFrame_Update(AtlasTWScrollBar, AtlasTW.CurrentLine, AtlasTW.NUM_LINES, 15)
		--Make note of how far in the scroll frame we are
		for line=1, AtlasTW.NUM_LINES do
			lineplusoffset = line + FauxScrollFrame_GetOffset(AtlasTWScrollBar)
			local bossLine = _G["AtlasBossLine"..line]
			if lineplusoffset <= AtlasTW.CurrentLine then
				-- Включаем интерактивность и текстуру для видимых кнопок
				bossLine:EnableMouse(true)
				highlightTexture = bossLine:GetHighlightTexture()
				highlightTexture:Show()
				local loot = _G["AtlasBossLine"..line.."_Loot"]
				local selected = _G["AtlasBossLine"..line.."_Selected"]
				_G["AtlasBossLine"..line.."_Text"]:SetText(AtlasTW.ScrollList[lineplusoffset])
				local instData = AtlasTW.InstanceData[zoneID]
				local hasLoot = instData and (instData.Bosses[lineplusoffset] and instData.Bosses[lineplusoffset].Items)
					or (instData.Reputation and instData.Reputation[1]) or (instData.Keys and instData.Keys[1])
				if AtlasLootItemsFrame.activeBoss == lineplusoffset then
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
				-- Полностью отключаем интерактивность
				bossLine:EnableMouse(false)
				-- Скрываем HighlightTexture явно
				highlightTexture = bossLine:GetHighlightTexture()
				if highlightTexture then
					highlightTexture:Hide()
				end
			end
		end
	end
end

-- Вспомогательная функция для получения loot зная ID
local function GetLootByID(zoneID, id)
    local instData = AtlasTW.InstanceData[zoneID]
    if not instData then return nil end
    local bossIndex = id
    if instData.Reputation then
		local numLines = getn(instData.Reputation)
        if bossIndex <= numLines then
            return instData.Reputation[bossIndex]
        end
        bossIndex = bossIndex - numLines
    end
    if instData.Keys then
		local numLines = getn(instData.Keys)
        if bossIndex <= numLines then
            return instData.Keys[bossIndex]
        end
        bossIndex = bossIndex - numLines
    end
    if instData.Bosses and instData.Bosses[bossIndex] and instData.Bosses[bossIndex].Items then
        return instData.Bosses[bossIndex].Items
    end
    return nil
end

local function GetLootByName(zoneID, name)
	local instData = AtlasTW.InstanceData[zoneID]
	if instData and instData.Bosses then
		for _, bossData in ipairs(instData.Bosses) do
			if bossData.name == name then
				return bossData.Items
			end
		end
	end
	return nil
end

function AtlasLootBoss_OnClick(button)
    local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local id = this.idnum

    if AtlasLootItemsFrame.activeBoss == id then
        AtlasLootItemsFrame:Hide()
        AtlasLootItemsFrame.activeBoss = nil
    else
        local loot = GetLootByID(zoneID, id)
        if loot and getn(loot) > 0 then
            local bossName = StripFormatting(AtlasTW.ScrollList[id])
            AtlasLoot_ShowBossLoot(loot, bossName)
            AtlasLootItemsFrame.activeBoss = id
        else
            AtlasLootItemsFrame:Hide()
            AtlasLootItemsFrame.activeBoss = nil
        end
    end

    AtlasTW.Loot.ScrollBarUpdate()
    AtlasLootItemsFrame.externalBoss = nil
    if AtlasTW.Quest.UI.InsideAtlasFrame then
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    end
end

function AtlasLoot_ShowBossLoot(lootTable, bossName)
	AtlasLoot_ShowItemsFrame(bossName, lootTable, bossName)
end

function AtlasLoot_ShowItemsFrame(dataID, dataSource, boss)
    local iconFrame, nameFrame, extraFrame, itemButton, borderFrame, spellName, spellIcon
    local text, extra
    local isItem, isEnchant, isSpell

    if type(dataSource) ~= "table" then
        dataSource = AtlasLoot_Data[dataSource] or nil
        if not dataSource then return end
    end

	-- Hide the AtlasQuestFrame if it's open
    if AtlasTW.Quest.UI.InsideAtlasFrame then
        AtlasTW.Quest.UI.InsideAtlasFrame:Hide()
    end

    AtlasLoot_QuickLooks:Hide()
    AtlasLootQuickLooksButton:Hide()

    for i = 1, 30 do
        _G["AtlasLootMenuItem_"..i]:Hide()
    end
	--Store data about the state of the items frame to allow minor tweaks or a recall of the current loot page
	AtlasLootItemsFrame.refresh = {dataID, dataSource_backup, boss, AtlasFrame}
	--Escape out of this function if creating a menu, this function only handles loot tables.
	--Inserting escapes in this way allows consistant calling of data whether it is a loot table or a menu.
	local handlerName = AtlasLoot_MenuHandlers[dataID]
	if handlerName and type(_G[handlerName]) == "function" then
		_G[handlerName]()
	elseif type(dataSource) == "table" then
		-- New modular system
		for i = 1, 30 do
			local item = dataSource[i]
			if item then
				itemButton = _G["AtlasLootItem_"..i]
				iconFrame = _G["AtlasLootItem_"..i.."_Icon"]
				nameFrame = _G["AtlasLootItem_"..i.."_Name"]
				extraFrame = _G["AtlasLootItem_"..i.."_Extra"]
				borderFrame = _G["AtlasLootItem_"..i.."Border"]

				local itemID = item.id
				local itemName, itemLink, itemQuality, itemTexture

				if itemID and itemID ~= 0 then
					itemName = GetItemInfo(itemID)
					if not itemName then
						AtlasLoot_CacheItem(itemID)
					end
					itemName, itemLink, itemQuality, _, _, _, _, _, itemTexture = GetItemInfo(itemID)
					if itemName then
						local r, g, b = GetItemQualityColor(itemQuality)
						nameFrame:SetText(itemName)
						nameFrame:SetTextColor(r, g, b)
					end
				end

				-- Set the discription text
				extraFrame:SetText(AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, item.slot))
				extraFrame:Show()

				-- Set the icon
				iconFrame:SetTexture(itemTexture or "Interface\\Icons\\INV_Misc_QuestionMark")

				-- Set the container
				itemButton.container = item.container
				borderFrame:Hide()
				if itemButton.container then
					-- Cache the items in the container
					for f = 1, getn(itemButton.container) do
						AtlasLoot_CacheItem(itemButton.container[f])
					end
					borderFrame:Show()
				end

				-- Set the drop rate text
				if item.dropRate then itemButton.droprate = item:GetDropRateText() end

				itemButton.itemID = itemID
				itemButton.itemLink = itemLink
				itemButton:Show()
			else
				_G["AtlasLootItem_"..i]:Hide()
			end
		end
	else
		--Iterate through each item object and set its properties
		for i = 1, 30 do
			--Check for a valid object (that it exists, and that it has a name)
			if dataSource and dataSource[dataID] and dataSource[dataID][i] and dataSource[dataID][i][3] ~= "" then
				if string.sub(dataSource[dataID][i][1], 1, 1) == "s" then
					isItem = false
					isEnchant = false
					isSpell = true
				elseif string.sub(dataSource[dataID][i][1], 1, 1) == "e" then
					isItem = false
					isEnchant = true
					isSpell = false
				else
					isItem = true
					isEnchant = false
					isSpell = false
				end
				local quantityFrame
				if isItem then
					local itemName, _, itemQuality = GetItemInfo(dataSource[dataID][i][1])
					--If the client has the name of the item in cache, use that instead.
					--This is poor man's localisation, English is replaced be whatever is needed
					if GetItemInfo(dataSource[dataID][i][1]) then
						local _, _, _, itemColor = GetItemQualityColor(itemQuality)
						text = itemColor..itemName
					else
						text = dataSource[dataID][i][3]
						text = AtlasLoot_FixText(text)
					end
					quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
					quantityFrame:SetText("")
				elseif isEnchant then
					--spellName = GetSpellInfoAtlasLootDB["enchants"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["name"]
					spellName = AtlasLoot_FixText(dataSource[dataID][i][3])
					spellIcon = dataSource[dataID][i][2]
					text = AtlasLoot_FixText(string.sub(dataSource[dataID][i][3], 1, 4)..spellName)
					quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
					quantityFrame:SetText("")
				elseif isSpell then
					spellName = dataSource[dataID][i][3]
					spellIcon = dataSource[dataID][i][2]
					text = AtlasLoot_FixText(spellName)
					local qtyMin = GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["craftQuantityMin"]
					local qtyMax = GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["craftQuantityMax"]
					if qtyMin and qtyMin ~= "" then
						if qtyMax and qtyMax ~= "" then
							quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
							quantityFrame:SetText(qtyMin.. "-"..qtyMax)
						else
							quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
							quantityFrame:SetText(qtyMin)
						end
					else
						quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
						quantityFrame:SetText("")
					end
				end
				--This is a valid QuickLook, so show the UI objects
				if dataID ~= "SearchResult" and dataID ~= "WishList" then
					AtlasLoot_QuickLooks:Show()
					AtlasLootQuickLooksButton:Show()
				end
				--Insert the item description
				extra = dataSource[dataID][i][4]
				extra = AtlasLoot_FixText(extra)
				--Use shortcuts for easier reference to parts of the item button
				itemButton = _G["AtlasLootItem_"..i]
				iconFrame = _G["AtlasLootItem_"..i.."_Icon"]
				nameFrame = _G["AtlasLootItem_"..i.."_Name"]
				extraFrame = _G["AtlasLootItem_"..i.."_Extra"]
				local border = _G["AtlasLootItem_"..i.."Border"]
				local pricetext1 = _G["AtlasLootItem_"..i.."_PriceText1"]
				local pricetext2 = _G["AtlasLootItem_"..i.."_PriceText2"]
				local pricetext3 = _G["AtlasLootItem_"..i.."_PriceText3"]
				local pricetext4 = _G["AtlasLootItem_"..i.."_PriceText4"]
				local pricetext5 = _G["AtlasLootItem_"..i.."_PriceText5"]
				local priceicon1 = _G["AtlasLootItem_"..i.."_PriceIcon1"]
				local priceicon2 = _G["AtlasLootItem_"..i.."_PriceIcon2"]
				local priceicon3 = _G["AtlasLootItem_"..i.."_PriceIcon3"]
				local priceicon4 = _G["AtlasLootItem_"..i.."_PriceIcon4"]
				local priceicon5 = _G["AtlasLootItem_"..i.."_PriceIcon5"]
				--If there is no data on the texture an item should have, show a big red question mark
				if dataSource[dataID][i][2] == "?" then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
				elseif dataSource[dataID][i][2] == "" then
					local _, _, _, _, _, _, _, _, itemTexture1 = GetItemInfo(dataSource[dataID][i][1])
					iconFrame:SetTexture(itemTexture1)
				elseif not isItem and spellIcon then
					if type(dataSource[dataID][i][2]) == "number" then
						local _, _, _, _, _, _, _, _, itemTexture2 = GetItemInfo(dataSource[dataID][i][2])
						iconFrame:SetTexture(itemTexture2)
					elseif type(dataSource[dataID][i][2]) == "string" then
						iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][2])
					else
						iconFrame:SetTexture(spellIcon)
					end
				else
					--else show the texture
					if strfind(dataSource[dataID][i][2], "^CLASS") then
						local class = gsub(dataSource[dataID][i][2], "CLASS", "")
						iconFrame:SetTexture("Interface\\AddOns\\AtlasLoot\\Images\\"..class)
					else
						iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][2])
					end
				end
				if iconFrame:GetTexture() == nil then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
				end
				--Set the name and description of the item
				nameFrame:SetText(text)
				extraFrame:SetText(extra)
				extraFrame:Show()
				pricetext1:Hide()
				pricetext2:Hide()
				pricetext3:Hide()
				pricetext4:Hide()
				pricetext5:Hide()
				priceicon1:Hide()
				priceicon2:Hide()
				priceicon3:Hide()
				priceicon4:Hide()
				priceicon5:Hide()
				if dataSource[dataID][i][6] then
					if dataSource[dataID][i][6]~="" then
						pricetext1:SetText(dataSource[dataID][i][6])
						priceicon1:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][7]))
						extraFrame:Show()
						pricetext1:Show()
						priceicon1:Show()
					end
				end
				if dataSource[dataID][i][8] then
					if dataSource[dataID][i][8]~="" then
						pricetext2:SetText(dataSource[dataID][i][8])
						priceicon2:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][9]))
						extraFrame:Show()
						pricetext2:Show()
						priceicon2:Show()
					end
				end
				if dataSource[dataID][i][10] then
					if dataSource[dataID][i][10]~="" then
						pricetext3:SetText(dataSource[dataID][i][10])
						priceicon3:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][11]))
						extraFrame:Show()
						pricetext3:Show()
						priceicon3:Show()
					end
				end
				if dataSource[dataID][i][12] then
					if dataSource[dataID][i][12]~="" then
						pricetext4:SetText(dataSource[dataID][i][12])
						priceicon4:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][13]))
						extraFrame:Show()
						pricetext4:Show()
						priceicon4:Show()
					end
				end
				if dataSource[dataID][i][14] then
					if dataSource[dataID][i][14]~="" then
						pricetext5:SetText(dataSource[dataID][i][14])
						priceicon5:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][15]))
						extraFrame:Show()
						pricetext5:Show()
						priceicon5:Show()
					end
				end
				--Set prices for items, up to 5 different currencies can be used in combination
				if (dataID == "SearchResult" or dataID == "WishList") and dataSource[dataID][i][5] then
					local wishDataID, wishDataSource = AtlasLoot_Strsplit("|", dataSource[dataID][i][5])
					if wishDataSource == "AtlasLootRepItems" then
						if wishDataID and AtlasLoot_IsLootTableAvailable(wishDataID) then
							for _, v in ipairs(AtlasLoot_Data[wishDataSource][wishDataID]) do
								if dataSource[dataID][i][1] == v[1] then
									if v[6] then
										if v[6]~="" then
											pricetext1:SetText(v[6])
											priceicon1:SetTexture(AtlasLoot_FixText(v[7]))
											extraFrame:Show()
											pricetext1:Show()
											priceicon1:Show()
										end
									end
									if v[8] then
										if v[8]~="" then
											pricetext2:SetText(v[8])
											priceicon2:SetTexture(AtlasLoot_FixText(v[9]))
											extraFrame:Show()
											pricetext2:Show()
											priceicon2:Show()
										end
									end
									if v[10] then
										if v[10]~="" then
											pricetext3:SetText(v[10])
											priceicon3:SetTexture(AtlasLoot_FixText(v[11]))
											extraFrame:Show()
											pricetext3:Show()
											priceicon3:Show()
										end
									end
									if v[12] then
										if v[12]~="" then
											pricetext4:SetText(v[12])
											priceicon4:SetTexture(AtlasLoot_FixText(v[13]))
											extraFrame:Show()
											pricetext4:Show()
											priceicon4:Show()
										end
									end
									if v[14] then
										if v[14]~="" then
											pricetext5:SetText(v[14])
											priceicon5:SetTexture(AtlasLoot_FixText(v[15]))
											extraFrame:Show()
											pricetext5:Show()
											priceicon5:Show()
										end
									end
									break
								end
							end
						end
					end
				end
				--For convenience, we store information about the objects in the objects so that it can be easily accessed later
				itemButton.itemID = dataSource[dataID][i][1]
				itemButton.itemIDName = dataSource[dataID][i][3]
				itemButton.itemIDExtra = dataSource[dataID][i][4]
				itemButton.container = dataSource[dataID][i][16]
				border:Hide()
				if itemButton.container then
					border:Show()
				end
				local spellID
				if isItem then
					itemButton.dressingroomID = dataSource[dataID][i][1]
				elseif isEnchant then
					spellID = tonumber(string.sub(dataSource[dataID][i][1], 2))
					if GetSpellInfoAtlasLootDB["enchants"][spellID] and GetSpellInfoAtlasLootDB["enchants"][spellID]["item"] and GetSpellInfoAtlasLootDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoAtlasLootDB["enchants"][spellID]["item"] ~= "" then
						itemButton.dressingroomID = GetSpellInfoAtlasLootDB["enchants"][spellID]["item"]
					else
						itemButton.dressingroomID = spellID
					end
					if GetSpellInfoAtlasLootDB["enchants"][spellID] and GetSpellInfoAtlasLootDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoAtlasLootDB["enchants"][spellID]["item"] ~= "" then
						if not GetItemInfo(GetSpellInfoAtlasLootDB["enchants"][spellID]["item"]) then
							GameTooltip:SetHyperlink("item:"..GetSpellInfoAtlasLootDB["enchants"][spellID]["item"]..":0:0:0")
						end
					end
				elseif isSpell then
					spellID = tonumber(string.sub(dataSource[dataID][i][1], 2))
					itemButton.dressingroomID = GetSpellInfoAtlasLootDB["craftspells"][spellID]["craftItem"]
					if GetSpellInfoAtlasLootDB["craftspells"][spellID]["craftItem"] ~= "" then
						if not GetItemInfo(GetSpellInfoAtlasLootDB["craftspells"][spellID]["craftItem"]) then
							GameTooltip:SetHyperlink("item:"..GetSpellInfoAtlasLootDB["craftspells"][spellID]["craftItem"]..":0:0:0")
						end
					end
					if GetSpellInfoAtlasLootDB["craftspells"][spellID]["reagents"] ~= "" then
						for i = 1, table.getn(GetSpellInfoAtlasLootDB["craftspells"][spellID]["reagents"]) do
							local reagent = GetSpellInfoAtlasLootDB["craftspells"][spellID]["reagents"][i]
							if not GetItemInfo(reagent[1]) then
								GameTooltip:SetHyperlink("item:"..reagent[1]..":0:0:0")
							end
						end
					end
					if GetSpellInfoAtlasLootDB["craftspells"][spellID]["tools"] ~= "" then
						for i = 1, table.getn(GetSpellInfoAtlasLootDB["craftspells"][spellID]["tools"]) do
							if not GetItemInfo(GetSpellInfoAtlasLootDB["craftspells"][spellID]["tools"][i]) then
								GameTooltip:SetHyperlink("item:"..GetSpellInfoAtlasLootDB["craftspells"][spellID]["tools"][i]..":0:0:0")
							end
						end
					end
				end
				itemButton.droprate = nil
				if dataID == "SearchResult" or dataID == "WishList" then
					itemButton.sourcePage = dataSource[dataID][i][5]
				else
					local droprate = dataSource[dataID][i][5]
					if droprate and string.find(droprate, "%%") then itemButton.droprate = droprate end
				end
				itemButton:Show()
				if MouseIsOver(itemButton) then
					itemButton:Hide()
					itemButton:Show()
				end
			else
				_G["AtlasLootItem_"..i]:Hide()
			end
		end
		--Hide navigation buttons by default, only show what we need
		_G["AtlasLootItemsFrame_BACK"]:Hide()
		_G["AtlasLootItemsFrame_NEXT"]:Hide()
		_G["AtlasLootItemsFrame_PREV"]:Hide()
		AtlasLoot_BossName:SetText(boss)
		--Consult the button registry to determine what nav buttons are required
		if dataID == "SearchResult" or dataID == "WishList" then
			if wlPage < wlPageMax then
				_G["AtlasLootItemsFrame_NEXT"]:Show()
				_G["AtlasLootItemsFrame_NEXT"].lootpage = dataID.."Page"..(wlPage + 1)
			end
			if wlPage > 1 then
				_G["AtlasLootItemsFrame_PREV"]:Show()
				_G["AtlasLootItemsFrame_PREV"].lootpage = dataID.."Page"..(wlPage - 1)
			end
		else
			local nav = AtlasLoot_GetBossNavigation(dataID)
			if nav then
				AtlasLoot_BossName:SetText(nav.Title)

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
	end

	AtlasLootItemsFrame_CloseButton:Show()
	local subMenu = nil
	local bossName = ""
	for k in pairs(AtlasLoot_HewdropDown_SubTables) do
		if subMenu then
			break
		end
		for _, n in pairs(AtlasLoot_HewdropDown_SubTables[k]) do
			if n[2] == dataID then
				subMenu = AtlasLoot_HewdropDown_SubTables[k]
				bossName = n[1]
				break
			end
		end
	end
	if subMenu then
		AtlasLoot_HewdropSubMenuRegister(subMenu)
		AtlasLootItemsFrame_SubMenu:Enable()
		AtlasLootItemsFrame_SelectedTable:SetText(TruncateText(bossName, 30))
		AtlasLootItemsFrame_SelectedTable:Show()
	else
		AtlasLootItemsFrame_SubMenu:Disable()
		AtlasLootItemsFrame_SelectedTable:Hide()
	end
	--Anchor the item frame where it is supposed to be
	AtlasLoot_QueryLootPage()
	AtlasLootItemsFrame:Show()
	AtlasLootItemsFrameContainer:Hide()
end

--[[
	tablename - Name of the loot table in the database
	text - Heading for the loot table
	tabletype - Whether the tablename indexes an actual table or needs to generate a submenu
	Called when a button in AtlasLoot_Hewdrop is clicked
]]
function AtlasLoot_HewdropClick(tablename, text, tabletype)
	AtlasTWCharDB.LastMenu = { tablename, text, tabletype }
	--If the button clicked was linked to a loot table (default behavior for simplified structure)
	--DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot_HewdropClick: tablename "..tablename)
	if not tabletype or tabletype == "Table" then
	--if tabletype == "Table" then
		--Show the loot table
		AtlasLoot_ShowBossLoot(tablename, text)
		--Save needed info for fuure re-display of the table
		AtlasTWCharDB.LastBoss = tablename
		AtlasTWCharDB.LastBossText = text
		--Purge the text label for the submenu and disable the submenu
		AtlasLootItemsFrame_SubMenu:Disable()
		AtlasLootItemsFrame_SelectedTable:SetText("")
		AtlasLootItemsFrame_SelectedTable:Show()
	--If the button links to a sub menu definition
	else
		--Enable the submenu button
		AtlasLootItemsFrame_SubMenu:Enable()
		--Show the first loot table associated with the submenu
		AtlasLoot_ShowBossLoot(AtlasLoot_HewdropDown_SubTables[tablename][1][2], AtlasLoot_HewdropDown_SubTables[tablename][1][1])
		--Save needed info for fuure re-display of the table
		AtlasTWCharDB.LastBoss = AtlasLoot_HewdropDown_SubTables[tablename][1][2]
		AtlasTWCharDB.LastBossText = AtlasLoot_HewdropDown_SubTables[tablename][1][1]
		--Load the correct submenu and associated with the button
		AtlasLoot_HewdropSubMenu:Unregister(AtlasLootItemsFrame_SubMenu)
		AtlasLoot_HewdropSubMenuRegister(AtlasLoot_HewdropDown_SubTables[tablename])
		--Show a text label of what has been selected
		AtlasLootItemsFrame_SelectedTable:SetText(TruncateText(AtlasLoot_HewdropDown_SubTables[tablename][1][1], 30))
		AtlasLootItemsFrame_SelectedTable:Show()
	end
	--Show the category that has been selected
	AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(text, 30))
	AtlasLootItemsFrame_SelectedCategory:Show()
	AtlasLoot_Hewdrop:Close(1)
end

--[[
	tablename - Name of the loot table in the database
	text - Heading for the loot table
	Called when a button in AtlasLoot_HewdropSubMenu is clicked
]]
function AtlasLoot_HewdropSubMenuClick(tablename, text)
	--Show the select loot table
	AtlasLoot_ShowBossLoot(tablename, text)
	--Save needed info for fuure re-display of the table
	AtlasTWCharDB.LastBoss = tablename
	AtlasTWCharDB.LastBossText = text
	--Show the table that has been selected
	AtlasLootItemsFrame_SelectedTable:SetText(TruncateText(text, 30))
	AtlasLootItemsFrame_SelectedTable:Show()
	AtlasLoot_HewdropSubMenu:Close(1)
end

--[[
	loottable - Table defining the sub menu
	Generates the sub menu needed by passing a table of loot tables and titles
]]
function AtlasLoot_HewdropSubMenuRegister(loottable)
	AtlasLoot_HewdropSubMenu:Register(AtlasLootItemsFrame_SubMenu,
		'point', function()
			return "TOP", "BOTTOM"
		end,
		'children', function(level, _)
			if level == 1 then
				for _,v in pairs(loottable) do
					AtlasLoot_HewdropSubMenu:AddLine(
						'text', v[1],
						'func', AtlasLoot_HewdropSubMenuClick,
						'arg1', v[2],
						'arg2', v[1],
						'notCheckable', true
					)
				end
			end
		end,
		'dontHook', true
	)
end

--[[
	Constructs the main category menu from a tiered table
]]
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

function AtlasLoot_OpenMenu(menuName)
	AtlasLoot_QuickLooks:Hide()
	AtlasLootQuickLooksButton:Hide()
	AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(menuName, 30))
	AtlasLootItemsFrame_SubMenu:Disable()
	AtlasLootItemsFrame_SelectedTable:SetText("")
	AtlasLootItemsFrame_SelectedTable:Show()
	AtlasTWCharDB.LastBoss = this.lootpage
	AtlasTWCharDB.LastBossText = menuName
	local menuMapping = {
		[L["Crafting"]] = "Crafting",
		[L["PvP Rewards"]] = "PvP",
		[L["World Events"]] = "WorldEvents",
		[L["Collections"]] = "Collections",
		[L["Factions"]] = "Factions",
		[L["World"]] = "World",
		[L["Dungeons & Raids"]] = "DUNGEONSMENU1",
	}

	local lootTable = menuMapping[menuName]
	if lootTable then
		AtlasLoot_ShowItemsFrame(lootTable, "dummy", "dummy")
	end
	CloseDropDownMenus()
end
--[[
	Called when the close button on the item frame is clicked
]]
function AtlasLootItemsFrame_OnCloseButton()
	--Set no loot table as currently selected
	AtlasLootItemsFrame.activeBoss = nil
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

--[[
	Requests the relevant loot page from a menu screen
]]
function AtlasLootMenuItem_OnClick(button)
    if button.useModern then
        AtlasLoot_ShowMenu({useModern = true, category = button.category, boss = button.boss})
        return
    end
	if this.container then
		AtlasLoot_ShowContainerFrame()
		return
	end
	if this.isheader == nil or this.isheader == false then
		local pagename = _G[this:GetName().."_Name"]:GetText()
 		for _, v in ipairs(AtlasLoot_HewdropDown) do
			if v[1] and not (type(v[1]) == "table") then
				for _, v2 in pairs(v) do
					for _, v3 in pairs(v2) do
						for _, v4 in pairs(v3) do
							if not (type(v4[1]) == "table") then
								if v4[1] == pagename and (not v4[3] or v4[3] == "Table") then
									AtlasLoot_HewdropClick(v4[2],v4[1],v4[3])
								end
							else
								for _,v5 in pairs(v4) do
									if v5[1] == pagename then
										AtlasLoot_HewdropClick(v5[2],v5[1],v5[3])
									end
								end
							end
						end
					end
				end
			end
		end
		CloseDropDownMenus()
		AtlasTWCharDB.LastBoss = this.lootpage
		AtlasTWCharDB.LastBossText = pagename
		AtlasLoot_ShowBossLoot(this.lootpage, pagename)
		AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(pagename, 30))
		AtlasLootItemsFrame_SelectedCategory:Show()
	end
end

--[[
	Called when <-, -> or 'Back' are pressed and calls up the appropriate loot page
]]
function AtlasLoot_NavButton_OnClick()
	-- If the back button is clicked, set the LastBoss to the new page
	if this == AtlasLootItemsFrame_BACK then
		AtlasLootItemsFrame.externalBoss = this.lootpage
	end
	if AtlasLootItemsFrame.refresh and AtlasLootItemsFrame.refresh[1] and AtlasLootItemsFrame.refresh[2] and AtlasLootItemsFrame.refresh[4] then
		if AtlasLootItemsFrame.refresh[1] == "DUNGEONSMENU1" then
			AtlasLootItemsFrame.refresh[1] = "DUNGEONSMENU2"
			AtlasLoot_DungeonsMenu2()
			AtlasLootItemsFrame_SubMenu:Disable()
			return
		elseif AtlasLootItemsFrame.refresh[1] == "DUNGEONSMENU2" then
			AtlasLootItemsFrame.refresh[1] = "DUNGEONSMENU1"
			AtlasLoot_DungeonsMenu1()
			AtlasLootItemsFrame_SubMenu:Disable()
			return
		end
		if string.sub(this.lootpage, 1, 16) == "SearchResultPage" then
			AtlasLoot_ShowItemsFrame("SearchResult", this.lootpage, string.format((L["Search Result: %s"]), AtlasTWCharDB.LastSearchedText or ""))
		elseif string.sub(this.lootpage, 1, 12) == "WishListPage" then
			AtlasLoot_ShowItemsFrame("WishList", this.lootpage, L["WishList"])
		else
			AtlasTWCharDB.LastBoss = this.lootpage
			AtlasTWCharDB.LastBossText = this.title
		--	DEFAULT_CHAT_FRAME:AddMessage(tostring(AtlasLootItemsFrame.refresh[2]))
			AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.refresh[2], this.title)
			if AtlasLootItemsFrame_SelectedTable:GetText()~=nil then
				AtlasLootItemsFrame_SelectedTable:SetText(TruncateText(AtlasLoot_BossName:GetText(), 30))
			else
				AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(AtlasLoot_BossName:GetText(), 30))
			end
		end
	elseif AtlasLootItemsFrame.refresh and AtlasLootItemsFrame.refresh[2] then
		AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.refresh[2], this.title)
	else
		--Fallback for if the requested loot page is a menu and does not have a .refresh instance
		AtlasLoot_ShowItemsFrame(this.lootpage, "dummy", this.title)
	end
	if AtlasLoot_MenuHandlers[this.lootpage] then
		AtlasLootItemsFrame_SubMenu:Disable()
		--	DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot_NavButton_OnClick: "..this.lootpage)
		AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(AtlasTWCharDB.LastBossText, 30))
		AtlasLootItemsFrame_SelectedTable:SetText()
	end
end

--[[
	Checks if a loot table is in memory and attempts to load the correct LoD module if it isn't
	dataID: Loot table dataID
]]
function AtlasLoot_IsLootTableAvailable(dataID)
	if not dataID then return false end
	if AtlasLoot_MenuHandlers[dataID] then
		return true
	else
		if not AtlasLoot_TableNames[dataID] then
			DEFAULT_CHAT_FRAME:AddMessage(RED..L["AtlasLoot Error!"].." "..
				WHITE..dataID..L[" not listed in loot table registry, please report this message to the AtlasLoot forums at https://github.com/KasVital/Atlas-TW/issues"])
			return false
		end
		local dataSource = AtlasLoot_TableNames[dataID][2]
		if AtlasLoot_Data[dataSource] then
			if AtlasLoot_Data[dataSource][dataID] then
				return true
			end
		end
	end
end

--[[
	button: Identity of the button pressed to trigger the function
	Shows the GUI for setting Quicklooks
]]
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
						AtlasTWCharDB["QuickLooks"][index] = {AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]}
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

--[[
	Enables/disables the quicklook buttons depending on what is assigned
]]
function AtlasLoot_RefreshQuickLookButtons()
	local i=1
	while i<7 do
		if not AtlasTWCharDB["QuickLooks"][i] or not AtlasTWCharDB["QuickLooks"][i][1] or AtlasTWCharDB["QuickLooks"][i][1]==nil then
			_G["AtlasLootPanel_Preset"..i]:Disable()
		else
			_G["AtlasLootPanel_Preset"..i]:Enable()
		end
		i=i+1
	end
end

--[[
	Clears a quicklook button.
]]
function AtlasLoot_ClearQuickLookButton(button)
	if not button or button == nil then return end
	AtlasTWCharDB["QuickLooks"][button] = nil
	AtlasLoot_RefreshQuickLookButtons()
	DEFAULT_CHAT_FRAME:AddMessage(BLUE.."AtlasLoot"..": "..WHITE..L["QuickLook"].." "..button.." "..L["has been reset!"])
end

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

--------------------------------------------------------------------------------
-- Called when a loot item is moused over
--------------------------------------------------------------------------------
local messageShown = false

function AtlasLootItem_OnEnter()
    if not this or not this.itemID or this.itemID == 0 then
        return
    end

    local isItem, isEnchant, isSpell
    if string.sub(this.itemID, 1, 1) == "s" then
        isItem = false
        isEnchant = false
        isSpell = true
    elseif string.sub(this.itemID, 1, 1) == "e" then
        isItem = false
        isEnchant = true
        isSpell = false
    else
        isItem = true
        isEnchant = false
        isSpell = false
    end

    AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT")

    if isItem then
        AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0")
        if this.droprate then
            AtlasLootTooltip:AddLine(L["Drop Rate:"] .. " " .. this.droprate, .1, .4, .2)
        end
        if AtlasTWOptions.LootItemIDs then
            AtlasLootTooltip:AddLine(BLUE..L["ItemID:"].." "..this.itemID, nil, nil, nil, 1)
        end
    elseif isEnchant then
        local enchantID = string.sub(this.itemID, 2)
        AtlasLootTooltip:SetHyperlink("enchant:"..enchantID)
        if AtlasTWOptions.LootItemIDs then
            AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." "..enchantID, nil, nil, nil, 1)
        end
    elseif isSpell then
        local spellID = string.sub(this.itemID, 2)
        AtlasLootTooltip:SetHyperlink("spell:"..spellID)
        if AtlasTWOptions.LootItemIDs then
            AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." "..spellID, nil, nil, nil, 1)
        end
    end

    AtlasLootTooltip:Show()
end

--------------------------------------------------------------------------------
-- Item OnLeave
-- Called when the mouse cursor leaves a loot item
--------------------------------------------------------------------------------
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
	local a, b, c = GetItemInfo(tonumber(id))
	local _, _, _, d = GetItemQualityColor(c)
	local e = string.sub(d, 2)
	return "\124"..e.."\124H"..b.."\124h["..a.."]\124h\124r"
end

--------------------------------------------------------------------------------
-- Item OnClick
-- Called when a loot item is clicked on
--------------------------------------------------------------------------------
function AtlasLootItem_OnClick(arg1)
	local isItem, isEnchant, isSpell
	local color = strsub(_G["AtlasLootItem_"..this:GetID().."_Name"]:GetText() or "", 1, 10)
	local id = this:GetID()
	local name = strsub(_G["AtlasLootItem_"..this:GetID().."_Name"]:GetText() or "", 11)
	local texture = AtlasLoot_Strsplit("\\", getglobal("AtlasLootItem_"..this:GetID().."_Icon"):GetTexture(), 0, true)
	local dataID = AtlasLootItemsFrame.refresh[1]
	local dataSource = AtlasLootItemsFrame.refresh[2]
	local bossName = AtlasLootItemsFrame.refresh[3]
	if string.sub(this.itemID, 1, 1) == "s" then
		isItem = false
		isEnchant = false
		isSpell = true
	elseif string.sub(this.itemID, 1, 1) == "e" then
		isItem = false
		isEnchant = true
		isSpell = false
	else
		isItem = true
		isEnchant = false
		isSpell = false
	end
	if isItem then
		local itemName, itemLink = GetItemInfo(this.itemID)
		--If shift-clicked, link in the chat window
		if AtlasFrame and AtlasFrame:IsVisible() and arg1=="RightButton" then
			getglobal("AtlasLootItem_"..id.."_Unsafe"):Hide()
		elseif(arg1=="RightButton" and not itemName and this.itemID ~= 0) then
			AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0")
			if not AtlasTWOptions.LootItemSpam then
				DEFAULT_CHAT_FRAME:AddMessage(L["Server queried for "]..color.."["..name.."]".."|r"..L[". Right click on any other item to refresh the loot page."])
			end
			AtlasLootItemsFrame:Hide()
			AtlasLoot_ShowItemsFrame(dataID, dataSource, bossName)
		elseif arg1=="RightButton" and itemName then
			AtlasLootItemsFrame:Hide()
			AtlasLoot_ShowItemsFrame(dataID, dataSource, bossName)
			if not AtlasTWOptions.LootItemSpam then
				DEFAULT_CHAT_FRAME:AddMessage(itemName..L[" is safe."])
				DEFAULT_CHAT_FRAME:AddMessage(AtlasLootItemsFrame.activeBoss)
			end
		elseif IsShiftKeyDown() and not itemName and this.itemID ~= 0 then
			if AtlasTWOptions.LootSafeLinks then
				if WIM_EditBoxInFocus then
					WIM_EditBoxInFocus:Insert("["..name.."]")
				elseif ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("["..name.."]")
				else
					AtlasLoot_SayItemReagents(this.itemID, nil, name, true)
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
				WIM_EditBoxInFocus:Insert(color.."|Hitem:"..this.itemID..":0:0:0|h["..name.."]|h|r")
			elseif ( ChatFrameEditBox:IsVisible() ) then
				ChatFrameEditBox:Insert(color.."|Hitem:"..this.itemID..":0:0:0|h["..name.."]|h|r")
			end
		elseif IsShiftKeyDown() and itemName and this.itemID ~= 0 then
			AtlasLoot_SayItemReagents(this.itemID, color, name)
			--If control-clicked, use the dressing room
		elseif IsControlKeyDown() and itemName then
			DressUpItemLink(itemLink)
		elseif IsAltKeyDown() and this.itemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
			else

				AtlasLoot_AddToWishlist(this.itemID, texture, this.itemIDName, this.itemIDExtra, dataID.."|"..dataSource)
			end
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local dataID, dataSource = AtlasLoot_Strsplit("|", this.sourcePage)
			if dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, AtlasLoot_TableNames[dataID][1])
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
		end
	elseif isEnchant then
		if IsShiftKeyDown() then
			AtlasLoot_SayItemReagents(this.itemID)
		elseif IsAltKeyDown() and this.itemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
			else
				AtlasLoot_AddToWishlist(this.itemID, texture, this.itemIDName, this.itemIDExtra, dataID.."|"..dataSource)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local dataID, dataSource = AtlasLoot_Strsplit("|", this.sourcePage)
			if dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, bossName)
			end
		end
	elseif isSpell then
		if IsShiftKeyDown() then
			if tonumber(string.sub(this.itemID, 2)) < 100000 then
				if WIM_EditBoxInFocus then
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem.."\124h["..craftname.."]|h|r")
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						--ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem.."\124h["..craftname.."]|h|r")
						ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem..":0:0:0\124h["..craftname.."]|h|r") -- Fix for Gurky's discord chat bot
					else
						ChatFrameEditBox:Insert(name)
					end
				else
					AtlasLoot_SayItemReagents(this.itemID)
				end
			else
				if WIM_EditBoxInFocus then
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						WIM_EditBoxInFocus:Insert(AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]))
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						ChatFrameEditBox:Insert(AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]))
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
					SendChatMessage(AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]),channel,nil,chatnumber)
				end
			end
		elseif IsAltKeyDown() and this.itemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
			else
				AtlasLoot_AddToWishlist(this.itemID, texture, this.itemIDName, this.itemIDExtra, dataID.."|"..dataSource)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local dataID2, dataSource2 = AtlasLoot_Strsplit("|", this.sourcePage)
			if dataID2 and dataSource2 and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLoot_ShowItemsFrame(dataID2, dataSource2, bossName)
			end
		end
	end
end

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

function AtlasLoot_CacheItem(linkOrID)
    if not linkOrID or linkOrID == 0 then
        return false
    end
    if tonumber(linkOrID) then
        if GetItemInfo(linkOrID) then
            return true
        else
            local item = "item:" .. linkOrID .. ":0:0:0"
            local _, _, itemLink = string.find(item, "(item:%d+:%d+:%d+:%d+)")
            linkOrID = itemLink
        end
    else
        if type(linkOrID) ~= "string" then
            return false
        end
        if string.find(linkOrID, "|", 1, true) then
            local _, _, itemLink = string.find(linkOrID, "(item:%d+:%d+:%d+:%d+)")
            linkOrID = itemLink
            if GetItemInfo(AtlasLoot_IDFromLink(linkOrID)) then
                return true
            end
        end
    end
    GameTooltip:SetHyperlink(linkOrID)
end

local containerItems = {}
local lastSelectedButton
function AtlasLoot_ShowContainerFrame()
	local containerTable = this.container
	if not containerTable then
		return
	end
	if this ~= lastSelectedButton then
		AtlasLootItemsFrameContainer:Show()
		lastSelectedButton = this
	elseif AtlasLootItemsFrameContainer:IsVisible() then
		AtlasLootItemsFrameContainer:Hide()
		lastSelectedButton = nil
		return
	end
	if not AtlasLootItemsFrameContainer:IsVisible() and lastSelectedButton == this then
		AtlasLootItemsFrameContainer:Show()
	end
	local getn = table.getn
	for i =1, getn(containerItems) do
		getglobal("AtlasLootContainerItem"..i):Hide()
	end
	local row = 0
	local col = 0
	local buttonIndex = 1
	local maxCols = 1

	for i = 1, getn(containerTable) do
		col = 0
		--for j = 1, getn(containerTable[i]) do
			if not containerItems[buttonIndex] then
				containerItems[buttonIndex] = CreateFrame("Button", "AtlasLootContainerItem"..buttonIndex, AtlasLootItemsFrameContainer)
				AtlasLoot_ApplyContainerItemTemplate(containerItems[buttonIndex])
			end
			local itemButton = getglobal("AtlasLootContainerItem"..buttonIndex)
			local itemID = containerTable[i]--[j][1]
			AtlasLoot_CacheItem(itemID)
			--itemButton.extraInfo = containerTable[i][j][2]
			--itemButton.dressingroomID = itemID
			local _,_,quality,_,_,_,_,_,tex = GetItemInfo(itemID)
			local icon = getglobal("AtlasLootContainerItem"..buttonIndex.."Icon")
			local r, g, b = 1, 1, 1
			if quality then
				r, g, b  = GetItemQualityColor(quality)
			end
			if not tex then
				tex = "Interface\\Icons\\INV_Misc_QuestionMark"
			end
			itemButton:SetPoint("TOPLEFT", AtlasLootItemsFrameContainer, (col * 35) + 5, -(row * 35) - 5)
			itemButton:SetBackdropBorderColor(r, g, b)
			itemButton:SetID(itemID)
			itemButton:Show()
			icon:SetTexture(tex)
			AtlasLoot_AddContainerItemTooltip(itemButton, itemID)
			col = col + 1
			if col > maxCols then
				maxCols = col
			end
			buttonIndex = buttonIndex + 1
		--end
		row = row + 1
	end
	AtlasLootItemsFrameContainer:SetPoint("TOPLEFT", this , "BOTTOMLEFT", -2, 2)
	AtlasLootItemsFrameContainer:SetWidth(16 + (maxCols * 35))
	AtlasLootItemsFrameContainer:SetHeight(16 + (row * 35))
end

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
		if icon:GetTexture() == "Interface\\Icons\\INV_Misc_QuestionMark" then
			local _,_,quality,_,_,_,_,_,tex = GetItemInfo(itemID)
			if tex and quality then
				local r, g, b  = GetItemQualityColor(quality)
				icon:SetTexture(tex)
				this:SetBackdropBorderColor(r, g, b)
			end
		end
    end)
    frame:SetScript("OnLeave", function()
        AtlasLootTooltip:Hide()
        AtlasLootTooltip.itemID = nil
    end)
end

function AtlasLoot_ContainerItem_OnClick(arg1)
	local itemID = this:GetID()
	local name, link, quality, _, _, _, _, _, tex = GetItemInfo(itemID)
	local _, _, _, color = GetItemQualityColor(quality)
	tex = string.gsub(tex, "Interface\\Icons\\", "")
	local extra = this.extraInfo
	local lootpage, dataSource
	if lastSelectedButton then
		lootpage = lastSelectedButton.lootpage
		dataSource = lastSelectedButton.dataSource
	end
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
		if lootpage then
			AtlasLoot_AddToWishlist(itemID, tex, name, extra, lootpage.."|"..dataSource)
		elseif AtlasLootItemsFrame.refresh then
			local dataID = AtlasLootItemsFrame.refresh[1]
			local dataSource2 = AtlasLootItemsFrame.refresh[2]
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(itemID))
			else
				AtlasLoot_AddToWishlist(itemID, tex, name, extra, dataID.."|"..dataSource2)
			end
		end
	end
end

--[[
	Querys all valid items on the current loot page.
]]
function AtlasLoot_QueryLootPage()
	for i = 1, 30 do
		local button = _G["AtlasLootItem_"..i]
		local queryitem = button.itemID
		if (queryitem) and (queryitem ~= nil) and (queryitem ~= "") and (queryitem ~= 0) and
			(string.sub(queryitem, 1, 1) ~= "s") and (string.sub(queryitem, 1, 1) ~= "e") then
			if not GetItemInfo(queryitem) then
				GameTooltip:SetHyperlink("item:"..queryitem..":0:0:0")
			end
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

function AtlasLoot_CheckBagsForItems(id, qty)
	if not id then DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot_CheckBagsForItems: no ID specified!") return end
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

function AtlasLoot_SayItemReagents(id, color, name, safe)
	if not id then return end
	local chatline = ""
	local itemCount = 0

	local tListActivity = {}
	local tCount = 0

	if (WIM_IconItems and WIM_Icon_SortByActivity) then
		for key in WIM_IconItems do
			table.insert(tListActivity, key)
			tCount = tCount + 1
		end

		table.sort(tListActivity, WIM_Icon_SortByActivity)
	end
	local channel, chatnumber
	if tListActivity[1] and WIM_Windows and WIM_Windows[tListActivity[1]].is_visible then
		channel = "WHISPER"
		chatnumber = tListActivity[1]
	else
		channel = ChatFrameEditBox.chatType
		if channel=="WHISPER" then
			chatnumber = ChatFrameEditBox.tellTarget
		elseif channel == "CHANNEL" then
			chatnumber = ChatFrameEditBox.channelTarget
		end
	end
	if string.sub( id, 1, 1 ) == "s" then
		local spellid = string.sub( id, 2 )
		local craftitem = GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["craftItem"]
		if craftitem ~= nil and craftitem ~= "" then
			local craftnumber = ""
			local qtyMin = GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["craftQuantityMin"]
			local qtyMax = GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["craftQuantityMax"]
			if qtyMin and qtyMin ~= "" then
				if qtyMax and qtyMax ~= "" then
					craftnumber = craftnumber..qtyMin.. "-"..qtyMax.."x"
				else
					craftnumber = craftnumber..qtyMin.."x"
				end
			end
			SendChatMessage(L["To craft "]..craftnumber..AtlasLoot_GetChatLink(craftitem)..L[" the following reagents are needed:"],channel,nil,chatnumber)
			for j = 1, table.getn(GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["reagents"]) do
				local tempnumber = GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["reagents"][j][2]
				if not tempnumber or tempnumber == nil or tempnumber == "" then
					tempnumber = 1
				end
				chatline = chatline..tempnumber.."x"..AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["reagents"][j][1]).." "
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
		else
			SendChatMessage(L["To cast "]..GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["name"]..L[" the following items are needed:"],channel,nil,chatnumber)
			for j = 1, table.getn(GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["reagents"]) do
				local tempnumber = GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["reagents"][j][2]
				if not tempnumber or tempnumber == nil or tempnumber == "" then
					tempnumber = 1
				end
				chatline = chatline..tempnumber.."x"..AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][tonumber(spellid)]["reagents"][j][1]).." "
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
	elseif string.sub( id,1 ,1 ) == "e" then
		local spellid = string.sub( id, 2 )
		local name = GetSpellInfoAtlasLootDB["enchants"][tonumber(spellid)]["name"]
		if tListActivity[1] and WIM_Windows[tListActivity[1]].is_visible then
			if not GetSpellInfoAtlasLootDB["enchants"][tonumber(spellid)]["item"] then
				SendChatMessage("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber)
			else
				SendChatMessage("To craft "..AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["enchants"][tonumber(spellid)]["item"])..L[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber)
			end

		elseif ChatFrameEditBox:IsVisible() then
			if not GetSpellInfoAtlasLootDB["enchants"][tonumber(spellid)]["item"] then
				ChatFrameEditBox:Insert("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber)
			else
				ChatFrameEditBox:Insert(L["To craft "]..AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["enchants"][tonumber(spellid)]["item"])..L[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber)
			end
		else
			if not GetSpellInfoAtlasLootDB["enchants"][tonumber(spellid)]["item"] then
				SendChatMessage("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber)
			else
				SendChatMessage(L["To craft "]..AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["enchants"][tonumber(spellid)]["item"])..L[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber)
			end
		end
	else
		if safe then
			SendChatMessage("["..name.."]", channel, nil, chatnumber)
		else
			SendChatMessage("\124"..string.sub(color, 2).."\124Hitem:"..id..":0:0:0\124h["..name.."]\124h\124r", channel, nil, chatnumber)
		end
	end
end