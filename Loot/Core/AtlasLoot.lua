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

-- Функция для формирования текста с цветом для скилла
local function formSkillStyle(skilltext)
	if not skilltext or type(skilltext) ~= "table" then return "" end
	return L["Skill:"].." "..ORANGE..skilltext[1]..", "..YELLOW..skilltext[2]..", "..
		GREEN..skilltext[3]..", "..GREY..skilltext[4]
end

-- Функция для ограничения длины текста с учетом паттернов
local function StripFormatting(text)
	-- Проверяем текст на пустоту
 	if not text then return "" end
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
	-- Удаляем все виды скобок и их содержимое
	text = string.gsub(text, "%(.-%)", "")  -- Круглые скобки ()
	text = string.gsub(text, "%[.-%]", "")  -- Квадратные скобки []
	text = string.gsub(text, "%{.-%}", "")  -- Фигурные скобки {}
	text = string.gsub(text, "%<.-%>", "")  -- Угловые скобки <>
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
function AtlasLoot_GetBossNavigation(data)
    if not data then return nil end
    -- Получаем текущий инстанс из настроек
    local currentZoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local currentInstanceData = AtlasTW.InstanceData[currentZoneID]

    -- Ищем босса только в текущем инстансе
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
                -- функция для поиска валидного элемента
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

                -- Поиск предыдущего валидного элемента
                local prevBoss = findValidEntry(i, -1)
                if prevBoss then
                    nav.Prev_Page = prevBoss.name
                    nav.Prev_Title = prevBoss.name or prevBoss.id
                end

                -- Поиск следующего валидного элемента
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
end

-- функция получения лута по имени босса без построения индексов
local function GetLootByElemName(elemName, instanceName)
	-- Вспомогательная функция для разрешения элементов лута
	local function AL_ResolveItems(items)
		if type(items) ~= "string" then
			return items
		else
			return AtlasLoot_Data[items] or items
		end
	end

	-- Вспомогательная функция для поиска в конкретном инстансе
	local function AL_FindInInstance(inst, name)
		if type(inst) ~= "table" then return nil end

		-- Поиск в репутациях
		if inst.Reputation then
			for _, v in ipairs(inst.Reputation) do
				if v.loot == name or v.name == name then
					return AtlasLoot_Data[v.loot]
				end
			end
		end

		-- Поиск в ключах
		if inst.Keys then
			for _, v in ipairs(inst.Keys) do
				if v.loot == name or v.name == name then
					return AtlasLoot_Data[v.loot]
				end
			end
		end

		-- Поиск в боссах
		if inst.Bosses then
			for _, elemData in ipairs(inst.Bosses) do
				if elemData.name == name or elemData.id == name then
					return AL_ResolveItems(elemData.items or elemData.loot)
				end
			end
		end

		return nil
	end

	-- Если указан конкретный инстанс
	if instanceName and AtlasTW.InstanceData[instanceName] then
		return AL_FindInInstance(AtlasTW.InstanceData[instanceName], elemName)
	end

	-- Поиск по всем инстансам
	for _, inst in pairs(AtlasTW.InstanceData) do
		local result = AL_FindInInstance(inst, elemName)
		if result then
			return result
		end
	end

	return nil
end

-- Вспомогательная функция для получения loot зная ID
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

function AtlasTW.Loot.ScrollBarUpdate()
	local lineplusoffset
	local highlightTexture
	if _G["AtlasBossLine1_Text"] ~= nil then
		local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
		--Update the contents of the Atlas scroll frames
		FauxScrollFrame_Update(AtlasTWScrollBar, AtlasTW.CurrentLine, AtlasTW.NUM_LINES, 15)
		--Make note of how far in the scroll frame we are

		-- Теперь показываем только нужные элементы
		for line=1, AtlasTW.NUM_LINES do
			lineplusoffset = line + FauxScrollFrame_GetOffset(AtlasTWScrollBar)
			local bossLine = _G["AtlasBossLine"..line]
			if bossLine and lineplusoffset <= AtlasTW.CurrentLine then
				-- Включаем интерактивность и текстуру для видимых кнопок
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


-- Глобальный кэш проверенных наборов предметов
if not ATLASTWLOOT_CHECKED_SETS then
    ATLASTWLOOT_CHECKED_SETS = {}
    ATLASTWLOOT_CHECKED_SETS_COUNT = 0
end

-- Периодическая очистка кэша для экономии памяти
local function CleanupMemoCache()
    if ATLASTWLOOT_CHECKED_SETS_COUNT > 100 then
        ATLASTWLOOT_CHECKED_SETS = {}
        ATLASTWLOOT_CHECKED_SETS_COUNT = 0
    end
end

-- Функция для создания хэша набора предметов
local function CreateItemSetHash(itemList)
    table.sort(itemList)  -- Сортируем для стабильного хэша
    return table.concat(itemList, ",")
end

-- Функция для кэширования всех предметов из таблицы лута
local function CacheAllLootItems(dataSource, callback)
    CleanupMemoCache()
    if not dataSource or type(dataSource) ~= "table" then
        if callback then callback() end
        return --print("CacheAllLooItems: dataSource is not a table"..(dataSource or "dataSource not string"))
    end
    local itemsToCache = {}

    -- Собираем все ID предметов для кэширования
    for i = 1, getn(dataSource) do
        local item = dataSource[i]
        local itemID = nil
		if item then
			if type(item) == "table" then
				-- Проверяем разные форматы данных
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

    -- Проверка по мемоизации: если этот набор уже целиком кэширован, пропускаем проверки
    local itemsCopy = {}
    for i = 1, getn(itemsToCache) do itemsCopy[i] = itemsToCache[i] end
    local setHash = CreateItemSetHash(itemsCopy)
    if ATLASTWLOOT_CHECKED_SETS[setHash] then
        if callback then callback() end
        return
    end

    -- Супербыстрая предварительная проверка: тестируем первые 5 предметов
    local quickCheckCount = math.min(5, totalToCache)
    local quickCachedCount = 0

    for i = 1, quickCheckCount do
        local itemID = itemsToCache[i]
        if GetItemInfo(itemID) then
            quickCachedCount = quickCachedCount + 1
        end
    end

    -- Если все проверенные предметы кэшированы, вероятно кэшированы и остальные
    local probablyAllCached = (quickCachedCount == quickCheckCount)

    -- Полная проверка: проверяем все предметы синхронно
    local uncachedItems = {}
    local alreadyCachedCount = 0

    for i = 1, totalToCache do
        local itemID = itemsToCache[i]
        if GetItemInfo(itemID) then
            alreadyCachedCount = alreadyCachedCount + 1
        else
            table.insert(uncachedItems, itemID)
            -- Если ожидали, что всё кэшировано, но нашли некэшированный предмет
            if probablyAllCached then
                probablyAllCached = false
            end
        end
    end

    local uncachedCount = getn(uncachedItems)

    -- Если все предметы уже кэшированы, мгновенно вызываем callback
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

    -- Батчинг для больших наборов: 3 предмета за тик, 0.07s затем 0.09s, максимум 2 итерации
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
                    -- После последнего батча даём клиенту короткий тик, затем проверяем оставшиеся
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

-- Функция обновления скроллбара для AtlasLootItemsFrame
function AtlasTW.Loot.ScrollBarLootUpdate() --TODO need improve
	--Load data for the current clicked element line
	local dataID = AtlasLootItemsFrame.StoredElement
	local instanceKey = (AtlasLootItemsFrame and type(AtlasLootItemsFrame.StoredMenu)=="string") and AtlasLootItemsFrame.StoredMenu or nil
	local dataSource = GetLootByElemName(dataID, instanceKey) or AtlasLootItemsFrame.StoredMenu

	-- Специальная обработка для списка желаний и результатов поиска
	if dataID == "WishList" or dataID == "SearchResult" then
		if dataID == "WishList" and not AtlasTWCharDB["WishList"] then
			AtlasTWCharDB["WishList"] = {}
		end
		if dataID == "SearchResult" and not AtlasTWCharDB["SearchResult"] then
			AtlasTWCharDB["SearchResult"] = {}
		end
		-- Создаем категоризированный список для отображения
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
	-- Скрываем кнопки навигации по умолчанию
	_G["AtlasLootItemsFrame_BACK"]:Hide()
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	if type(dataSource) == "table" then
		local BZ = AceLibrary("Babble-Zone-2.2a")
    	local quantityFrame, menuButton, extraText, defaultIcon, itemButton, iconFrame, nameFrame, extraFrame, borderFrame

		-- Вспомогательная функция для подсчета максимального числового индекса (поддержка разреженных массивов)
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
		-- Обновляем содержимое и видимость кнопок AtlasLootItem
		for i = 1, AtlasTW.LOOT_NUM_LINES do
			itemButton = _G["AtlasLootItem_"..i]
			menuButton = _G["AtlasLootMenuItem_"..i]

			-- Вычисляем правильный индекс для двух столбцов
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
						menuButton.instanceKey = element.instanceKey
						menuButton.firstBoss = element.firstBoss
						if element.container then
							borderFrame:Show()
						else
							borderFrame:Hide()
						end
						menuButton:Show()
					else
						-- Очистка полей для предотвращения использования устаревших данных
						menuButton.name = nil
						menuButton.lootpage = nil
						menuButton.container = nil
						menuButton.instanceKey = nil
						menuButton.firstBoss = nil
						menuButton:Hide()
					end
					-- Скрываем кнопки предметов и контейнеров
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
					-- Нормализация элементов WishList/SearchResult (кроме заголовков) под общий формат обычных элементов
					local sourcePageVal = nil
					if (dataID == "WishList" or dataID == "SearchResult") and element and type(element) == "table" then
						sourcePageVal = element[5]
						if not sourcePageVal and element[2] and element[3] then
							sourcePageVal = element[2].."|"..element[3]
						end
					end
					if (dataID == "WishList" or dataID == "SearchResult") and element and type(element) == "table" and element[1] and element[1] ~= 0 then
						local wlItemID = element[1]
						local wlElementType = element[4]
						-- Преобразуем элемент WishList/SearchResult к структуре обычного элемента
						if wlElementType ~= "item" then
							-- Для заклинаний/зачарований: ID может быть в формате 's123' или 'e456', преобразуем в число
							local elemNum = wlItemID
							if type(wlItemID) == "string" and string.len(wlItemID) > 1 then
								elemNum = tonumber(string.sub(wlItemID, 2)) or wlItemID
							end
							element = { id = elemNum, skill = 1 }
						else
							-- Для обычных предметов явно отмечаем тип
							element = { id = wlItemID, type = "item" }
						end
					end
					-- Специальная обработка ТОЛЬКО для заголовков WishList/SearchResult (элементы с id == 0)
					if (dataID == "WishList" or dataID == "SearchResult") and element and type(element) == "table" and element[1] == 0 then
						-- Это разделитель/заголовок
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

						-- Очищаем данные кнопки для разделителей
						itemButton.itemID = 0
						itemButton.elemID = 0
						itemButton.typeID = nil
						itemButton.sourcePage = nil
						itemButton.container = nil
						itemButton.droprate = nil
						borderFrame:Hide()
						shouldShow = true
					-- обработка для остальных элементов
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
							extratext = extratext~="" and parsedText~="" and extratext..", "..parsedText or extratext
							extratext = parsedText~="" and parsedText or extratext
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
					-- Скрываем кнопки меню при отображении предметов
					if menuButton then
						menuButton:Hide()
					end
				end
			else
				nameFrame = _G["AtlasLootMenuItem_"..i.."_Name"]
				iconFrame = _G["AtlasLootMenuItem_"..i.."_Icon"]
				extraFrame = _G["AtlasLootMenuItem_"..i.."_Extra"]
				borderFrame = _G["AtlasLootMenuItem_"..i.."Border"]
				-- Очищаем содержимое кнопки если нет данных
				if iconFrame then iconFrame:SetTexture("") end
				if nameFrame then nameFrame:SetText("") end
				if extraFrame then extraFrame:SetText("") extraFrame:Hide() end
				if borderFrame then borderFrame:Hide() end
				menuButton.name = nil
				menuButton.name_orig = nil
				menuButton.lootpage = nil
				menuButton.container = nil
				menuButton.instanceKey = nil
				menuButton.firstBoss = nil
				menuButton.name = nil
				menuButton.lootpage = nil
				menuButton.container = nil
				menuButton.instanceKey = nil
				menuButton.firstBoss = nil
				iconFrame = _G["AtlasLootItem_"..i.."_Icon"]
				extraFrame = _G["AtlasLootItem_"..i.."_Extra"]
				borderFrame = _G["AtlasLootItem_"..i.."Border"]
				quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
				-- Очищаем содержимое кнопки если нет данных
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
	-- Показываем кнопку "Назад" если есть родительское меню
	if AtlasLootItemsFrame.StoredBackMenuName then
		_G["AtlasLootItemsFrame_BACK"]:Show()
		_G["AtlasLootItemsFrame_BACK"].lootpage = "BackToMenu"
		_G["AtlasLootItemsFrame_BACK"].title = AtlasLootItemsFrame.StoredBackMenuName
	end

	if dataID ~= "SearchResult" and dataID ~= "WishList" then
		-- навигация обрабатывается кроме Search/WishList
		local nav = nil
		-- Проверяем, является ли это редким мобом
		local rareMobsData = AtlasTW.InstanceData.RareMobs
		if rareMobsData and rareMobsData.Bosses then
			for i, bossData in ipairs(rareMobsData.Bosses) do
				if bossData.name == dataID then
					-- Создаем навигацию для редких мобов
					nav = {}
					nav.Title = bossData.name
					local numEntries = table.getn(rareMobsData.Bosses)
					if numEntries > 1 then
						-- Предыдущий редкий моб
						local prevIndex = i - 1
						if prevIndex < 1 then prevIndex = numEntries end
						local prevBoss = rareMobsData.Bosses[prevIndex]
						if prevBoss then
							nav.Prev_Page = prevBoss.name
							nav.Prev_Title = prevBoss.name
						end
						-- Следующий редкий моб
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

		-- Если не редкий моб, используем обычную навигацию
		if not nav then
			nav = AtlasLoot_GetBossNavigation(dataID)
		end

		-- Если навигация босса не найдена, пробуем навигацию по меню
		if not nav and type(AtlasLoot_GetMenuNavigation) == "function" then
			nav = AtlasLoot_GetMenuNavigation(dataID)
		end

		-- Если навигация не найдена и у нас есть StoredBackMenuName, попробуем найти навигацию для него
		if not nav and AtlasLootItemsFrame.StoredBackMenuName then
			local backMenuKey = AtlasLootItemsFrame.StoredBackMenuName
			nav = AtlasLoot_GetMenuNavigation(backMenuKey)
			if nav then
				-- Добавляем кнопку "Назад" в родительское меню
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

	-- Управление показом QuickLooks: скрываем на поиске/вишлисте, показываем на обычных страницах
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
		AtlasLoot_LootPageName:SetText(string.format((L["Search Result: %s"] or "Search Result: %s"), text))
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
			AtlasLootItemsFrame.StoredMenu = nil
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
--[[
	tablename - Name of the loot table in the database
	text - Heading for the loot table
	tabletype - Whether the tablename indexes an actual table or needs to generate a submenu
	Called when a button in AtlasLoot_Hewdrop is clicked
]]
function AtlasLoot_HewdropClick(tablename, text, tabletype)
	--AtlasTWCharDB.LastMenu = { tablename, text, tabletype }
	--If the button clicked was linked to a loot table (default behavior for simplified structure)
	--print("AtlasLoot_HewdropClick: tablename "..(tablename or "-"))
	--print("AtlasLoot_HewdropClick: text "..(text or "-"))
	if tablename then
		-- Сохраняем текущее меню для кнопки "Назад"
		local prevStored = AtlasLootItemsFrame.StoredElement
		if type(prevStored) == "table" and prevStored.menuName then
			AtlasLootItemsFrame.StoredBackMenuName = prevStored.menuName
		end
		--Store the loot table and boss name
		AtlasLootItemsFrame:Show()
		AtlasLoot_ShowScrollBarLoading()
		--Store the loot table and boss name
		AtlasLootItemsFrame.StoredElement = tablename
		AtlasLootItemsFrame.StoredMenu = tablename
		if type(tablename) == "string" then
			tablename = AtlasLoot_Data[tablename] or GetLootByElemName(tablename)
		end
		CacheAllLootItems(tablename, function()
			AtlasLoot_HideScrollBarLoading()
			AtlasTW.Loot.ScrollBarLootUpdate()
		end)
	end
	--Show the category that has been selected
	AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(text, 30))
	AtlasLootItemsFrame_SelectedCategory:Show()
	AtlasLoot_Hewdrop:Close(1)
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
		--print("AtlasLoot_OpenMenu: найдено меню "..menuName.." -> "..lootTable)
		AtlasLootItemsFrame.StoredElement = { menuName = menuName }
		AtlasLootItemsFrame.StoredMenu = lootTable
		-- НЕ очищаем StoredBackMenuName при возврате в меню, чтобы сохранить навигацию
		-- AtlasLootItemsFrame.StoredBackMenuName = nil -- Закомментировано для исправления навигации
		-- Вызываем функцию меню
		if type(_G[lootTable]) == "function" then
			_G[lootTable]()
		else
			--print("AtlasLoot_OpenMenu: ScrollBarLootUpdate")
			AtlasTW.Loot.ScrollBarLootUpdate()
		end
	else
		--print("AtlasLoot_OpenMenu: меню не найдено - "..menuName)
	end
	CloseDropDownMenus()
end
--[[
	Called when the close button on the item frame is clicked
]]
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

--[[
	Requests the relevant loot page from a menu screen
]]
function AtlasLootMenuItem_OnClick(button)
	if this.container then
		AtlasLoot_ShowContainerFrame()
		return
	end
	-- Reset scroll position to top
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)
	-- Get the table source and data ID
	local dataID = this.name_orig or this.name
	local TableSource = this.lootpage
	local pagename
 	if this.isheader == nil or this.isheader == false then
		pagename = _G[this:GetName().."_Name"]:GetText()
        -- Надёжное определение инстанса по имени клика: сначала пробуем меню подземелий, затем поля кнопки
        local effectiveInstanceKey, effectiveFirstBoss
         if type(dataID) == "string" and AtlasTW and AtlasTW.MenuData and AtlasTW.MenuData.Dungeons then
             for _, entry in ipairs(AtlasTW.MenuData.Dungeons) do
                 if entry and entry.name_orig == dataID and entry.instanceKey then
                     effectiveInstanceKey = entry.instanceKey
                     effectiveFirstBoss = entry.firstBoss
                     break
                 end
             end
         end
         if not effectiveInstanceKey then
             effectiveInstanceKey = this.instanceKey
             effectiveFirstBoss = this.firstBoss
         end
        -- Если это пункт подземелья с данными инстанса, переопределяем страницу на первого босса
        if effectiveInstanceKey and effectiveFirstBoss then
            TableSource = effectiveInstanceKey
            pagename = effectiveFirstBoss
            AtlasLootItemsFrame.StoredCurrentInstance = effectiveInstanceKey
            -- Установим текущий инстанс в выпадающих списках для корректной навигации (используем числовые индексы и при необходимости пересобираем)
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
        end

		pagename = StripFormatting(pagename)
		dataID = StripFormatting(dataID)
		CloseDropDownMenus()

		AtlasLootItemsFrame:Show()
		AtlasLoot_ShowScrollBarLoading()
		if pagename == L["Rare Mobs"] then
			pagename = L["Shade Mage"]
		end
		-- Запоминаем родительское меню для кнопки "Назад"
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
			-- 1) Прямой ключ в AtlasLoot_Data
			newTable = AtlasLoot_Data[TableSource]
			-- 2) Попробуем получить по имени выбранного элемента в рамках инстанса
			if not newTable and type(pagename) == "string" then
				newTable = GetLootByElemName(pagename, TableSource)
			end
			-- 3) Попробуем глобально по имени
			if not newTable and type(pagename) == "string" then
				newTable = GetLootByElemName(pagename)
			end
			-- 4) Крайний случай: пробуем по самому TableSource
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

-- Функция поиска индекса босса в ScrollList по ID или имени
local function FindBossIndexInScrollList(bossIdOrName)
	if not AtlasTW.ScrollList or not bossIdOrName then
		return nil
	end

	for i = 1, table.getn(AtlasTW.ScrollList) do
		local entry = AtlasTW.ScrollList[i]
		if entry and (entry.id == bossIdOrName or entry.name == bossIdOrName) then
			--print("FindBossIndexInScrollList: найден босс " .. tostring(bossIdOrName) .. " на индексе " .. tostring(i))
			return i
		end
	end

	--print("FindBossIndexInScrollList: босс " .. tostring(bossIdOrName) .. " не найден в ScrollList")
	return nil
end

-- Навигация по меню
function AtlasLoot_GetMenuNavigation(current)
    -- Универсальная функция навигации для всех меню аддона
    -- current может быть названием пункта меню или ключом таблицы лута
 	if type(current) == "table" and current.menuName then
		current = current.menuName
	end
    -- Автоматически собираем все таблицы MenuData
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
        -- Ищем элемент по названию (приоритет) или по lootpage (для совместимости)
        for i = 1, size do
            local e = menu[i]
            if e and e.name then
                -- Проверяем точное совпадение
                if e.name == current then
                    idx = i
                    break
                -- Проверяем совпадение без цветовых кодов
                elseif string.find(e.name, "|c") then
                    -- Убираем цветовые коды из названия
                    local cleanName = string.gsub(e.name, "|c%x%x%x%x%x%x%x%x", "")
                    cleanName = string.gsub(cleanName, "|r", "")
                    if cleanName == current then
                        idx = i
                        break
                    end
                end
            end
        end

        -- Если не нашли по названию, пробуем по lootpage для обратной совместимости
        if not idx then
            for i = 1, size do
                local e = menu[i]
                if e and e.lootpage and e.lootpage == current then
                    idx = i
                    --print("findInMenu: найден по lootpage на индексе "..tostring(i))
                    break
                end
            end
        end

        if not idx then
            return nil
        end

        local result = {}
        -- Ищем предыдущий пункт среди валидных элементов
        for j = idx - 1, 1, -1 do
            local pe = menu[j]
            if pe and pe.lootpage and not pe.isheader then
                result.Prev_Page = pe.lootpage ~= L["Rare Mobs"] and pe.lootpage or L["Shade Mage"]
                result.Prev_Title = pe.name ~= L["Rare Mobs"] and pe.name or L["Shade Mage"]
                break
            end
        end
        -- Если не нашли, делаем обход с конца (wrap-around)
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

        -- Ищем следующий пункт
        for j = idx + 1, size do
            local ne = menu[j]
            if ne and ne.lootpage and not ne.isheader then
                result.Next_Page = ne.lootpage ~= L["Rare Mobs"] and ne.lootpage or L["Shade Mage"]
                result.Next_Title = ne.name ~= L["Rare Mobs"] and ne.name or L["Shade Mage"]
                break
            end
        end
        -- Если не нашли, делаем обход с начала (wrap-around)
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
    -- Сканируем все меню аддона
	for k = 1, table.getn(candidates) do
		local nav = findInMenu(candidates[k])
		if nav and (nav.Next_Page or nav.Prev_Page) then

			return nav
		end
	end

    return nil
end
--[[
	Called when <-, -> or 'Back' are pressed and calls up the appropriate loot page
]]
function AtlasLoot_NavButton_OnClick()
	-- Сброс прокрутки при навигации
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)

	if not this or not this.lootpage then
		return print("NavButton_OnClick: выход - нет this или lootpage")
	end

	-- Обработка кнопки "Назад" в родительское меню (без учета регистра + резерв из title)
	if this == _G["AtlasLootItemsFrame_BACK"] then
		local lpLower = string.lower(this.lootpage or "")
		if lpLower == "backtomenu" then
			local targetMenu = AtlasLootItemsFrame.StoredBackMenuName or this.title
			--print("Возврат в меню: "..tostring(targetMenu))
			if targetMenu then
				AtlasLoot_OpenMenu(targetMenu)
				AtlasLootItemsFrame.StoredBackMenuName = nil
			else
				_G["AtlasLootItemsFrame_BACK"]:Hide()
			end
			return
		end
	end

	-- Обработка кнопки "Назад" в меню подземелий
	if this == _G["AtlasLootItemsFrame_BACK"] and this.lootpage == "DUNGEONSMENU" then
		AtlasLoot_OpenMenu(L["Dungeons & Raids"])
		return
	end

	local lp = this.lootpage

	-- Проверяем, является ли это навигацией по редким мобам
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

	-- По умолчанию: обрабатываем как страницу лута/босса
	AtlasLootItemsFrame:Show()
	AtlasLoot_ShowScrollBarLoading()
	AtlasLootItemsFrame.StoredElement = this.title or lp
	-- Для редких мобов не меняем StoredMenu, для остальных - устанавливаем lp
	if isRareMobNavigation then
		AtlasLootItemsFrame.StoredBackMenuName = L["World"]
	else
		AtlasLootItemsFrame.StoredMenu = lp
	end
-------------------------------------
	-- Найти индекс босса в ScrollList и обновить activeElement
	local bossIndex = FindBossIndexInScrollList(lp)
	if bossIndex then
		AtlasLootItemsFrame.activeElement = bossIndex
		-- Обновить отображение списка боссов
		AtlasTW.Loot.ScrollBarUpdate()
	else
		AtlasLootItemsFrame.activeElement = nil
	end

	-- Получаем данные лута
	local lootData = nil
	if isRareMobNavigation then
		-- Для редких мобов ищем данные в RareMobs
		for _, bossData in ipairs(rareMobsData.Bosses) do
			if bossData.name == lp then
				lootData = bossData.items
				break
			end
		end
	else
		-- Обычная логика для других боссов
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
	-- Обновляем текст заголовка
	local title = this.title or lp
	if title then
		AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(title, 30))
		AtlasLootItemsFrame_SelectedCategory:Show()
	end
end

--[[
	Checks if a loot table is in memory and attempts to load the correct LoD module if it isn't
	dataID: Loot table dataID
]]
function AtlasLoot_IsLootTableAvailable(dataID)
	if not dataID then return false end
	-- Прямая таблица лута
	if AtlasLoot_Data and AtlasLoot_Data[dataID] then
		return true
	end
	-- Поиск по имени элемента в рамках текущего инстанса либо глобально
	local instanceKey = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu
	local loot = GetLootByElemName and GetLootByElemName(dataID, instanceKey) or nil
	if loot and type(loot) == "table" then
		return true
	end
	-- Попробуем без учета инстанса
	loot = GetLootByElemName and GetLootByElemName(dataID) or nil
	if loot and type(loot) == "table" then
		return true
	end
	return false
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

--[[
	Enables/disables the quicklook buttons depending on what is assigned
]]
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

--[[
	Clears a quicklook button.
]]
function AtlasLoot_ClearQuickLookButton(button)
	if not button or button == nil then return end
	AtlasTWCharDB["QuickLooks"][button] = nil
	AtlasLoot_RefreshQuickLookButtons()
	print(BLUE.."AtlasLoot"..": "..WHITE..L["QuickLook"].." "..button.." "..L["has been reset!"])
end

function AtlasLoot_Strsplit(delim, str, maxNb, onlyLast) --TODO check
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

-- Вспомогательная функция для создания строки материалов (инструменты/реагенты)
local function BuildMaterialString(materials, isReagent)
    if not materials or type(materials) ~= "table" then
        return ""
    end

    local materialStrings = {}
    for i = 1, table.getn(materials) do
        local itemInfo = materials[i]
        local checkedItem
        if isReagent then
            -- Реагент это таблица {itemID, количество}
           -- AtlasLoot_ForceCacheItemWithDelay(itemInfo[1], 1)
            checkedItem = AtlasLoot_CheckBagsForItems(itemInfo[1], itemInfo[2] or 1)
        else
            -- Инструмент это просто itemID
          --  AtlasLoot_ForceCacheItemWithDelay(itemInfo, 1)
            checkedItem = AtlasLoot_CheckBagsForItems(itemInfo)
        end
        table.insert(materialStrings, checkedItem)
    end

    -- table.concat намного быстрее, чем конкатенация в цикле для Lua 5.0
    return table.concat(materialStrings, WHITE .. ", ")
end

-- Вспомогательная функция для определения корректного ID заклинания (с хаками для профессий)
local function GetDisplaySpellID(elemID)
    if elemID >= 100000 then
        if elemID <= 100007 then return 2575 end -- Mining Apprentice 75
        if elemID <= 100010 then return 2576 end -- Mining Journeyman 125
        if elemID <= 100017 then return 3564 end -- Mining Expert 225
        if elemID <= 100035 then return 10248 end -- Mining Artisan 275
    end
    return elemID
end

-- Основная функция для отображения тултипа заклинания
local function ShowSpellTooltip(link, elemID, anchor)
    AtlasLootTooltip:SetOwner(anchor, "ANCHOR_NONE")
    AtlasLootTooltip:SetPoint("BOTTOMLEFT", anchor, "TOPRIGHT", -(anchor:GetWidth() / 2), 24)
    AtlasLootTooltip:ClearLines()

    -- Управляемая данными структура для строк тултипа
    local tooltipLines = {
        { text = link.name },
        { text = link.requires, prefix = WHITE .. L["Requires"]..": " },
        { text = BuildMaterialString(link.tools), prefix = WHITE .. L["Tools: "], wrap = true },
        { text = BuildMaterialString(link.reagents, true), prefix = WHITE .. L["Reagents: "], wrap = true },
        { text = link.text, wrap = true },
    }

    -- Динамическое добавление строк в тултип
    for i = 1, table.getn(tooltipLines) do
        local lineInfo = tooltipLines[i]
        if lineInfo.text and lineInfo.text ~= "" then
            AtlasLootTooltip:AddLine((lineInfo.prefix or "") .. lineInfo.text, nil, nil, nil, lineInfo.wrap)
        end
    end

    -- Добавление ID заклинания, если опция включена
    if AtlasTWOptions.LootItemIDs then
        local spellID = GetDisplaySpellID(elemID)
        AtlasLootTooltip:AddLine(BLUE .. L["SpellID:"] .. " " .. spellID, nil, nil, nil, true)
    end

    AtlasLootTooltip:Show()
end

-- Основная функция для отображения тултипа создаваемого предмета
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

-- Обработчик для типа "spell"
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
-- Обработчик для типа "enchant"
local function HandleEnchantTooltip(spellID, anchor)
    if not spellID then return end
    local enchantLink = "enchant:" .. spellID

     -- Для старых версий SuperWoW
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

    -- Показываем связанный предмет, если он есть
    local enchantData = AtlasTW.SpellDB.enchants[spellID]
    if enchantData and enchantData.item then
        ShowCraftedItemTooltip(enchantData, AtlasLootTooltip, anchor)
    end
end

-- Обработчик для типа "item"
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

-- Карта обработчиков
local TOOLTIP_HANDLERS = {
    spell = HandleSpellTooltip,
    enchant = HandleEnchantTooltip,
    item = HandleItemTooltip,
}

--------------------------------------------------------------------------------
-- Called when a loot item is moused over
--------------------------------------------------------------------------------

function AtlasLootItem_OnEnter()
    if not this or not this.typeID or this.typeID==0 or this.typeID=="" then return end
    local itemType = this.typeID
    local handler = TOOLTIP_HANDLERS[itemType]
    if handler then
        -- Вызываем нужный обработчик, передавая ему необходимые параметры
        if itemType == "spell" or itemType == "enchant" then
            handler(this.elemID, this)
        elseif itemType == "item" then
            handler(this.itemID, this.droprate, this)
        end
    end
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
	local itemName, itemLink, itemQuality = GetItemInfo(tonumber(id))
	if not itemName or not itemLink or not itemQuality then
		-- Если предмет не закэширован, возвращаем простую ссылку
		return "[Item:" .. tostring(id) .. "]"
	end

	local _, _, _, colorCode = GetItemQualityColor(itemQuality)
	local colorHex = string.sub(colorCode, 2)
	return "\124" .. colorHex .. "\124H" .. itemLink .. "\124h[" .. itemName .. "]\124h\124r"
end

--------------------------------------------------------------------------------
-- Item OnClick
-- Called when a loot item is clicked on
--------------------------------------------------------------------------------
function AtlasLootItem_OnClick(arg1) --TODO check all features
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
		if AtlasFrame and AtlasFrame:IsVisible() and arg1=="RightButton" then
--[[ 			getglobal("AtlasLootItem_"..id.."_Unsafe"):Hide() ]]
		elseif(arg1=="RightButton" and not itemName and this.itemID ~= 0) then
--[[ 			AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0")
			if not AtlasTWOptions.LootItemSpam then
				print(L["Server queried for "]..color.."["..itemName.."]".."|r"..L[". Right click on any other item to refresh the loot page."])
			end
			AtlasLootItemsFrame:Hide()

			-- Update scrollbar
			AtlasTW.Loot.ScrollBarLootUpdate() ]]
		elseif IsShiftKeyDown() and not itemName and this.itemID ~= 0 then
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
				AtlasLoot_AddToWishlist(this.itemID)
			end
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasLoot_Strsplit("|", this.sourcePage)
			if bossName and instanceKey and AtlasLoot_IsLootTableAvailable(bossName) then
				-- Устанавливаем целевой босс и инстанс
				AtlasLootItemsFrame.StoredElement = bossName
				AtlasLootItemsFrame.StoredMenu = instanceKey
				-- Переключаем выпадающие списки AtlasTW на нужный инстанс
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
				-- Подсвечиваем босса в левом списке
				local bossIndex = FindBossIndexInScrollList(bossName)
				if bossIndex then
					AtlasLootItemsFrame.activeElement = bossIndex
					AtlasTW.Loot.ScrollBarUpdate()
				else
					AtlasLootItemsFrame.activeElement = nil
				end
				-- Обновляем лутовую панель
				AtlasTW.Loot.ScrollBarLootUpdate()
			elseif AtlasLoot_IsLootTableAvailable(this.sourcePage) then
				-- sourcePage содержит только ключ таблицы (например, страницу крафта)
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				AtlasTW.Loot.ScrollBarLootUpdate()
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
				AtlasLoot_AddToWishlist(this.elemID)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.itemID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasLoot_Strsplit("|", this.sourcePage)
			if bossName and instanceKey and AtlasLoot_IsLootTableAvailable(bossName) then
				AtlasLootItemsFrame.StoredElement = bossName
				AtlasLootItemsFrame.StoredMenu = instanceKey
				if AtlasTW and AtlasTW.DropDowns and AtlasTWOptions then
					for typeIndex, dropDownData in pairs(AtlasTW.DropDowns) do
						for zoneIndex, zoneKey in pairs(dropDownData) do
							if zoneKey == instanceKey then
								AtlasTWOptions.AtlasType = typeIndex
								AtlasTWOptions.AtlasZone = zoneIndex
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
				AtlasTW.Loot.ScrollBarLootUpdate()
			elseif AtlasLoot_IsLootTableAvailable(this.sourcePage) then
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				AtlasTW.Loot.ScrollBarLootUpdate()
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
						--local craftname = GetItemInfo(craftitem)
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
				AtlasLoot_AddToWishlist(this.elemID)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.itemID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local bossName, instanceKey = AtlasLoot_Strsplit("|", this.sourcePage)
			if bossName and instanceKey and AtlasLoot_IsLootTableAvailable(bossName) then
				AtlasLootItemsFrame.StoredElement = bossName
				AtlasLootItemsFrame.StoredMenu = instanceKey
				if AtlasTW and AtlasTW.DropDowns and AtlasTWOptions then
					for typeIndex, dropDownData in pairs(AtlasTW.DropDowns) do
						for zoneIndex, zoneKey in pairs(dropDownData) do
							if zoneKey == instanceKey then
								AtlasTWOptions.AtlasType = typeIndex
								AtlasTWOptions.AtlasZone = zoneIndex
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
				AtlasTW.Loot.ScrollBarLootUpdate()
			elseif AtlasLoot_IsLootTableAvailable(this.sourcePage) then
				AtlasLootItemsFrame.StoredElement = this.sourcePage
				AtlasLootItemsFrame.StoredMenu = nil
				AtlasLootItemsFrame.activeElement = nil
				AtlasTW.Loot.ScrollBarLootUpdate()
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
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


local containerItems = {}
local lastSelectedButton

-- Универсальная функция создания индикатора загрузки
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

function AtlasLoot_HideLoadingFrame(frameName, debugName)
	local loadingFrame = getglobal(frameName)
	if loadingFrame then
		loadingFrame:Hide()
		if debugName then
			print("AtlasLoot: hide " .. debugName .. " spinner")
		end
	end
end

-- Индикатор загрузки для окна прокрутки
function AtlasLoot_ShowScrollBarLoading()
	AtlasLoot_CreateLoadingFrame("AtlasLootScrollBarLoadingFrame", AtlasLootItemsFrame)
end

function AtlasLoot_HideScrollBarLoading()
	AtlasLoot_HideLoadingFrame("AtlasLootScrollBarLoadingFrame")
end

-- Индикатор загрузки для контейнера
function AtlasLoot_ShowContainerLoading()
	AtlasLoot_CreateLoadingFrame("AtlasLootContainerLoadingFrame", AtlasLootItemsFrameContainer)
end

function AtlasLoot_HideContainerLoading()
	AtlasLoot_HideLoadingFrame("AtlasLootContainerLoadingFrame")
end

function AtlasLoot_ShowContainerFrame()
	if this ~= lastSelectedButton then
		lastSelectedButton = this
		-- Прячем старый контейнер до окончания кэширования для нового
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

	-- Показываем контейнер с заглушкой "Загрузка"
	AtlasLootItemsFrameContainer:Show()
	AtlasLootItemsFrameContainer:ClearAllPoints()
	AtlasLootItemsFrameContainer:SetPoint("TOPLEFT", this , "BOTTOMLEFT", -2, 2)
	AtlasLootItemsFrameContainer:SetWidth(50)
	AtlasLootItemsFrameContainer:SetHeight(50)

	AtlasLoot_ShowContainerLoading()

	-- Кэшируем все предметы контейнера асинхронно, затем обновляем фрейм
	CacheAllLootItems(containerTable, function()
		AtlasLoot_UpdateContainerDisplay()
	end)
end

-- Функция для обновления отображения контейнера после кэширования
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

		-- Умный расчет количества столбцов на основе общего количества элементов
		local totalItems = table.getn(containerTable)
		local maxCols
		if totalItems <= 5 then
			maxCols = totalItems  -- Один ряд для малого количества
		elseif totalItems <= 12 then
			maxCols = 4  -- столбца для средних контейнеров
		elseif totalItems <= 20 then
			maxCols = 6   -- столбцов для больших контейнеров
		elseif totalItems <= 35 then
			maxCols = 7  -- столбцов для очень больших контейнеров
		else
			maxCols = 8  -- Максимум 8 столбцов
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
			-- Размещаем элементы в сетке 5x?
			itemButton:SetPoint("TOPLEFT", AtlasLootItemsFrameContainer, (col * 35) + 5, -(row * 35) - 5)
			itemButton:SetBackdropBorderColor(r, g, b)
			itemButton:SetID(itemID)
			itemButton:Show()
			quantityText:Show()
			AtlasLoot_AddContainerItemTooltip(itemButton, itemID)
			icon:SetTexture(tex)
			col = col + 1
			-- Переходим на новый ряд после maxCols элементов
			if col >= maxCols then
				col = 0
				row = row + 1
			end
			buttonIndex = buttonIndex + 1
		end

		-- Если последний ряд не полный, учитываем его
		if col > 0 then
			row = row + 1
		end

		AtlasLootItemsFrameContainer:ClearAllPoints()
		AtlasLootItemsFrameContainer:SetPoint("TOPLEFT", lastSelectedButton , "BOTTOMLEFT", -2, 2)
		AtlasLootItemsFrameContainer:SetWidth(16 + ((row==0 and col or maxCols) * 35))
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
		-- Автоматическое обновление иконки при наведении, если предмет теперь кэширован
		local _,_,quality,_,_,_,_,_,tex = GetItemInfo(itemID)
		if tex and quality then
			local r, g, b  = GetItemQualityColor(quality)
			if icon:GetTexture() == "Interface\\Icons\\INV_Misc_QuestionMark" or
			   icon:GetTexture() ~= tex then
				icon:SetTexture(tex)
				this:SetBackdropBorderColor(r, g, b)
			end
		elseif icon:GetTexture() == "Interface\\Icons\\INV_Misc_QuestionMark" then
			-- Если предмет всё ещё не кэширован, пытаемся форсированно кэшировать
			AtlasLoot_ForceCacheItem(itemID, 1)
		end
    end)
    frame:SetScript("OnLeave", function()
        AtlasLootTooltip:Hide()
        AtlasLootTooltip.itemID = nil
    end)
end

function AtlasLoot_ContainerItem_OnClick(arg1) --TODO need CHECK
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
		local ElemLoot = GetLootByElemName(ElemName)

		if ElemName == "WishList" then
			AtlasLoot_DeleteFromWishList(this.itemID)
		elseif ElemName == "SearchResult" then
			AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(itemID))
		else
			AtlasLoot_AddToWishlist(itemID)
		end
	end
end
--[[ 	local itemID = this:GetID()
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
			AtlasLoot_AddToWishlist(itemID)
		elseif AtlasLootItemsFrame.storedBoss then
			local ElemName = AtlasLootItemsFrame.storedBoss.name
			local ElemLoot = GetLootByElemName(ElemName)

			if ElemName == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif ElemName == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(itemID))
			else
				AtlasLoot_AddToWishlist(itemID)
			end
		end
	end
end ]]

--[[
	Querys all valid items on the current loot page.
]]
--[[ function AtlasLoot_QueryLootPage() --TODO remove
	for i = 1, 30 do
		local button = _G["AtlasLootItem_"..i]
		AtlasLoot_ForceCacheItemWithDelay(button.itemID, 1)
	end
end ]]

local function idFromLink(itemlink)
	if itemlink then
		local _,_,id = string.find(itemlink, "|Hitem:([^:]+)%:")
		return tonumber(id)
	end
	return nil
end

function AtlasLoot_CheckBagsForItems(id, qty) --TODO need check
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

-- Функция для отправки информации о реагентах предмета в чат
function AtlasLoot_SayItemReagents(id, color, name, safe)
	if not id then
		return
	end

	-- Инициализация переменных
	local chatline = ""
	local itemCount = 0
	local tListActivity = {}
	local tCount = 0

	-- Получение активных WIM окон
	if WIM_IconItems and WIM_Icon_SortByActivity then
		for key in WIM_IconItems do
			table.insert(tListActivity, key)
			tCount = tCount + 1
		end
		table.sort(tListActivity, WIM_Icon_SortByActivity)
	end

	-- Определение канала и цели для отправки сообщения
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
	-- Обработка заклинаний крафта
	if AtlasTW.SpellDB.craftspells[id] then
		local spellData = AtlasTW.SpellDB.craftspells[id]
		local craftitem = spellData.item

		if craftitem and craftitem ~= "" then
			-- Формирование строки количества предметов
			local craftnumber = ""
			local quantity = spellData.quantity
			if quantity then
				-- Проверяем тип quantity: число или массив
				craftnumber = type(quantity) == "table" and (quantity[1] .. "-" .. quantity[2] .. "x") or (quantity .. "x")
			end

			-- Отправка сообщения о крафте
			local craftMessage = L["To craft "] .. craftnumber .. AtlasLoot_GetChatLink(craftitem) .. L[" the following reagents are needed:"]
			SendChatMessage(craftMessage, channel, nil, chatnumber)

			-- Отправка списка реагентов
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
			-- Обработка заклинаний без предметов (только реагенты)
			local spellName = spellData.name
			local castMessage = L["To cast "] .. spellName .. L[" the following items are needed:"]
			SendChatMessage(castMessage, channel, nil, chatnumber)

			-- Сброс переменных для новой секции
			chatline = ""
			itemCount = 0

			-- Отправка списка реагентов для заклинания
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
	-- Обработка зачарований
	elseif AtlasTW.SpellDB.enchants[id] then
		local enchantData = AtlasTW.SpellDB.enchants[id]
		local enchantItem = enchantData["item"]
		local enchantName = enchantData["name"] or GetItemInfo(enchantItem)

		-- Формирование ссылки на зачарование
		local enchantLink = "|cffFFd200|Henchant:" .. id .. ":0:0:0|h[" .. enchantName .. "]|h|r"

		-- Определение сообщения в зависимости от наличия предмета
		local message
		if enchantItem then
			message = L["To craft "] .. AtlasLoot_GetChatLink(enchantItem) .. L[" you need this: "] .. enchantLink
		else
			message = enchantLink
		end

		-- Отправка сообщения в зависимости от активного окна
		if tListActivity[1] and WIM_Windows and WIM_Windows[tListActivity[1]].is_visible then
			SendChatMessage(message, channel, nil, chatnumber)
		elseif ChatFrameEditBox:IsVisible() then
			ChatFrameEditBox:Insert(message)
		else
			SendChatMessage(message, channel, nil, chatnumber)
		end

	-- Обработка обычных предметов
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