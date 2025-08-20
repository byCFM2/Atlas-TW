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
--[[ 
AtlasLoot_Data["AtlasLootFallback"] = {
	EmptyInstance = {}
} ]]
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
function AtlasLoot_GetBossNavigation(data) --TODO remake
	--print("AtlasLoot_GetBossNavigation")
	--if type(data)=="string" then print(data) end
    if not data then return nil end
    for instanceKey, instanceData in pairs(AtlasLoot_TableRegistry) do
        if instanceData.Entry then
            for i, bossData in ipairs(instanceData.Entry) do
                if bossData.Title == data then
					--print("bossData.ID")
                    local nav = {}
                    nav.Title = bossData.Title
                    local numEntries = table.getn(instanceData.Entry)

                    -- Previous page (with loop)
                    local prevIndex = i - 1
                    if prevIndex < 1 then
                        prevIndex = numEntries -- Loop to the last item
                    end
                    nav.Prev_Page = instanceData.Entry[prevIndex].Title
                    nav.Prev_Title = instanceData.Entry[prevIndex].Name

                    -- Next page (with loop)
                    local nextIndex = i + 1
                    if nextIndex > numEntries then
                        nextIndex = 1 -- Loop to the first item
                    end
                    nav.Next_Page = instanceData.Entry[nextIndex].Title
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
-- Константы для AtlasLoot скроллинга
--AtlasTW.LOOT_NUM_LINES = 30  -- Количество видимых элементов в AtlasLootItemsFrame (2 ряда по 15)
--AtlasTW.LootCurrentItems = nil  -- Текущие элементы для отображения

-- Глобальный индекс боссов для быстрого поиска
AtlasTW.BossLootIndex = {}

-- Функция построения индекса боссов (вызывается при инициализации)
function AtlasTW.BuildBossLootIndex()
--	print("AtlasLoot: Построение индекса боссов...")
	for instanceKey, instanceData in pairs(AtlasTW.InstanceData) do
		if type(instanceData) == "table" and instanceData.Bosses then
			for bossIndex, bossData in ipairs(instanceData.Bosses) do
				if bossData.name and bossData.items then
					local bossName = bossData.name
					-- Создаем запись в индексе
					if not AtlasTW.BossLootIndex[bossName] then
						AtlasTW.BossLootIndex[bossName] = {}
					end
					table.insert(AtlasTW.BossLootIndex[bossName], {
						instance = instanceKey,
						instanceName = instanceData.Name,
						bossIndex = bossIndex,
						lootTable = bossData.items
					})
				end
			end
		end
	end
	local count = 0
	for _ in pairs(AtlasTW.BossLootIndex) do
		count = count + 1
	end
	--print("AtlasLoot: Индекс боссов построен. Всего уникальных имен: " .. count)
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
					return AL_ResolveItems(elemData.items)
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

--[[ -- Вспомогательная функция для получения loot зная ID
local function GetLootByStringID(elemID, instanceName)
	-- Если указан инстанс строкой-ключом
	if instanceName and AtlasTW.InstanceData[instanceName] then
		local inst = AtlasTW.InstanceData[instanceName]
 		if inst.Reputation then
			for _, v in ipairs(inst.Reputation) do
				if v.loot == elemID then
					return AtlasLoot_Data[v.loot]
				end
			end
		end
		if inst.Keys then
			for _, v in ipairs(inst.Keys) do
				if v.loot == elemID then
					return AtlasLoot_Data[v.loot]
				end
			end
		end
		if inst.Bosses then
			for _, elemData in ipairs(inst.Bosses) do
				if elemData.id == elemID then
					return elemData.items
				end
			end
		end
		return nil--print("Wrong elemname or instancename")
	end
	-- Поиск по всем инстансам
	for _, inst in pairs(AtlasTW.InstanceData) do
		if type(inst) == "table" then
			if inst.Reputation then
				for _, v in ipairs(inst.Reputation) do
					if v.name == elemID then
						return AtlasLoot_Data[v.loot]
					end
				end
			end
			if inst.Keys then
				for _, v in ipairs(inst.Keys) do
					if v.name == elemID then
						return AtlasLoot_Data[v.loot]
					end
				end
			end
			if inst.Bosses then
				for _, elemData in ipairs(inst.Bosses) do
					if elemData.id == elemID then
						-- Для сетов элемент строка, брать из AtlasLoot_Data
						-- Для меню возвращаем строку с названием меню для запуска через _G
						if type(elemData.items) ~="string" then
							return elemData.items
						else
							return AtlasLoot_Data[elemData.items] or elemData.items
						end
					end
				end
			end
		end
	end
	return nil--print("Wrong elemname or instancename Last try")
end ]]

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

local function GetLootByName(zoneID, name)
	--print("Get2LootByName: ".. (name or ""))
	local instData = AtlasTW.InstanceData[zoneID]
	if not instData then return end
	if instData.Bosses then
		for _, data in ipairs(instData.Bosses or {}) do
			if data.name == name then
				return data.items or data.id
			end
		end
	end
	if instData.Reputation then
		for _, data in ipairs(instData.Reputation or {}) do
			if data.name == name then
				return data.loot
			end
		end
	end
	if instData.Keys then
		for _, data in ipairs(instData.Keys or {}) do
			if data.name == name then
				return data.loot
			end
		end
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
					if item.skill then
						itemID = GetSpellInfoAtlasLootDB.enchants[itemID] and GetSpellInfoAtlasLootDB.enchants[itemID].item or
						GetSpellInfoAtlasLootDB.craftspells[itemID] and GetSpellInfoAtlasLootDB.craftspells[itemID].item
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
        -- print("Набор предметов уже проверен ранее, пропускаем кэширование")
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
      --  print("Все предметы уже кэшированы, мгновенно открываем окно")
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
function AtlasTW.Loot.ScrollBarLootUpdate() --TODO need support menu
	--Load data for the current clicked element line
	local dataID = AtlasLootItemsFrame.StoredElement
	local dataSource = GetLootByElemName(dataID) or AtlasLootItemsFrame.StoredMenu
	--Check if dataID and dataSource are valid
 	if not dataID and not dataSource then
		return print("AtlasTW.Loot.ScrollBarLootUpdate: No dataID and No dataSource!")
	end
	if AtlasLoot_Data[dataID] or AtlasLoot_Data[dataSource] then
		dataSource = AtlasLoot_Data[dataID] or AtlasLoot_Data[dataSource]
	end
	if type(dataSource) == "table" then
	--	print("AtlasLoot_Show2ItemsFrame: table")
		local totalItems = getn(dataSource)
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
			local itemButton = _G["AtlasLootItem_"..i]
			local menuButton = _G["AtlasLootMenuItem_"..i]

			if itemButton then
				local iconFrame = _G["AtlasLootItem_"..i.."_Icon"]
				local nameFrame = _G["AtlasLootItem_"..i.."_Name"]
				local extraFrame = _G["AtlasLootItem_"..i.."_Extra"]
				local borderFrame = _G["AtlasLootItem_"..i.."Border"]
				local quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]

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

				local shouldShow = false

				-- Показываем кнопку если индекс в пределах таблицы
				if itemIndex <= totalItems and dataSource[itemIndex] then
					local element = dataSource[itemIndex]
					-- Проверяем, есть ли данные для отображения
					if element and (element.id or element.name) then
						-- Новая система - обновляем содержимое кнопки
						local itemTexture, itemID, extratext, link, quantity = "", 0, "", "", ""
						local itemName = element.name
						local elemID = element.id
						local itemQuality = 0
						if elemID and elemID ~= 0 then
							link = GetSpellInfoAtlasLootDB.enchants[elemID] or GetSpellInfoAtlasLootDB.craftspells[elemID]
							--spell or item
							if element.skill and not (element.type and element.type=="item") then
								-- Set original ID for itemButton (enchant or spell)
								itemButton.elemID = elemID
								-- Set type for itemButton (enchant or spell)
								if GetSpellInfoAtlasLootDB.enchants[elemID] then
									itemButton.typeID = "enchant"
								elseif GetSpellInfoAtlasLootDB.craftspells[elemID] then
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
						-- Set the dressing room ID
						itemButton.dressingroomID = itemID

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
							--print("parsing "..(itemID or "no itemID"))
							parsedText = link and link.extra and (link.extra..", "..parsedText) or parsedText
							extratext = parsedText~="" and extratext..", "..parsedText or extratext
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
						if element.GetDropRateText then
							itemButton.droprate = element:GetDropRateText()
						end

						itemButton.itemID = itemID or 0

						--itemButton.itemLink = itemLink

						shouldShow = true
					end
				else
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
				end

				if shouldShow then
					itemButton:Show()
				else
					itemButton:Hide()
				end
			end

			-- Скрываем кнопки меню при отображении предметов
			if menuButton then
				menuButton:Hide()
			end
		end
	elseif type(_G[dataSource]) == "function" then
	--	print("AtlasLoot_Show2ItemsFrame: function")
		_G[dataSource]()
	else

	--	print("Unknown dataSource type: "..type(dataSource)..(dataSource or " nil"))
	end
	if dataID == "SearchResult" or dataID == "WishList" then
--[[ 		if wlPage < wlPageMax then
			_G["AtlasLootItemsFrame_NEXT"]:Show()
			_G["AtlasLootItemsFrame_NEXT"].lootpage = dataID.."Page"..(wlPage + 1)
		end
		if wlPage > 1 then
			_G["AtlasLootItemsFrame_PREV"]:Show()
			_G["AtlasLootItemsFrame_PREV"].lootpage = dataID.."Page"..(wlPage - 1)
		end ]]
	else
		local nav = AtlasLoot_GetBossNavigation(dataID)
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

	-- Скрываем QuickLooks
    AtlasLoot_QuickLooks:Hide()
    AtlasLootQuickLooksButton:Hide()

	-- Set the loot page name
	AtlasLoot_LootPageName:SetText(dataID or "No Name")

	--Hide the container frame
	AtlasLootItemsFrameContainer:Hide()

	--Show the loot frame
	AtlasLootItemsFrame:Show()
end

local function AtlasLoot_ShowItemsFrame(dataID, dataSource, boss) --+
--print("Run: AtlasLoot_ShowItemsFrame "..(dataID or " no dataID").." _"..
	--(dataSource or " no dataSource").." _"..(boss or " no boss") )
--[[ 
    if not dataID or not dataSource then return end

    local spellName, spellIcon, text, extra, isItem, isEnchant, isSpell
    local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
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
	AtlasLootItemsFrame.storedBoss = {dataID, dataSource, boss, AtlasFrame}
	--Escape out of this function if creating a menu, this function only handles loot tables.
	--Inserting escapes in this way allows consistant calling of data whether it is a loot table or a menu.
	local handlerName = AtlasLoot_MenuHandlers[dataID]
	if handlerName and type(_G[handlerName]) == "function" then
		print("AtlasLoot_Show2ItemsFrame: function")
		_G[handlerName]()
	elseif type(dataSource) == "table" then
		-- New modular system
		print("AtlasLoot_Show2ItemsFrame: table")

		AtlasLoot_QueryLootPage()
		for i = 1, 30 do
			local item = dataSource[i]
			if item and (item.id or item.name) then
				local itemButton,iconFrame,nameFrame,extraFrame,borderFrame = _G["AtlasLootItem_"..i],_G["AtlasLootItem_"..i.."_Icon"],_G["AtlasLootItem_"..i.."_Name"],_G["AtlasLootItem_"..i.."_Extra"],_G["AtlasLootItem_"..i.."Border"]
				local itemLink, itemQuality, itemTexture
				local itemName =  item.name
				local itemID = item.id

				if itemID and itemID ~= 0 then
					itemName, itemLink, itemQuality, _, _, _, _, _, itemTexture = GetItemInfo(itemID)
					if not itemName then
						print("AtlasLoot_Show2ItemsFrame: item not found in cache "..itemID)
					else
						local r, g, b = GetItemQualityColor(itemQuality)
						nameFrame:SetTextColor(r, g, b)
					end
					nameFrame:SetText(itemName or L["Item not found in cache"])
				elseif item.name then

					-- Handle the case where item is a separator
					local table = AtlasTW.ItemDB.CreateSeparator(item.name, item.icon, item.quality)
					itemName = table.name
					itemQuality = table.quality
					itemTexture = table.texture

					local r, g, b = GetItemQualityColor(itemQuality)
					nameFrame:SetTextColor(r, g, b)
					nameFrame:SetText(itemName or L["Item not found in cache"])
				end

				-- Set the discription text
				extraFrame:SetText(AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, item.disc) or "")
				extraFrame:Show()

				-- Set the icon
				iconFrame:SetTexture(itemTexture or "Interface\\Icons\\INV_Misc_QuestionMark")

				-- Save the item button data
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

				-- Set the item drop rate
				itemButton.droprate = item:GetDropRateText()

				itemButton.itemID = itemID or 0
				itemButton.itemLink = itemLink

				-- Set the item button visibility
				itemButton:Show()

			else
				_G["AtlasLootItem_"..i]:Hide()
			end
		end

		-- Set the loot page name
		AtlasLoot_LootPageName:SetText(TruncateText(dataID, 40) or "No name")
	else
		print("AtlasLoot_Show2ItemsFrame: ELSE")
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
		AtlasLoot_LootPageName:SetText(boss)
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
				AtlasLoot_LootPageName:SetText(nav.Title)

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

	-- Set current items for scrollbar
	AtlasTW.LootCurrentItems = dataSource

	-- Reset scroll position to top
	if AtlasLootScrollBar then
	--	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	end

	-- Update scrollbar
	AtlasTW.Loot.ScrollBarLootUpdate()

	AtlasLootItemsFrame:Show()
	AtlasLootItemsFrameContainer:Hide() ]]
end

function AtlasLootBoss_OnClick(buttonName)
	-- Reset scroll position to top
    FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)
   local zoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local id = this.idnum
    local elemName = AtlasTW.ScrollList[id].name ~= "Trash Mobs" and AtlasTW.ScrollList[id].name or AtlasTW.ScrollList[id].id
	--print("elemName "..(elemName or " no elemname"))
	local lootTable = GetLootByElemName(elemName,zoneID)
	--print(tostring(lootTable).." lootTable")

    if AtlasLootItemsFrame.activeElement == id then
        AtlasLootItemsFrame:Hide()
        AtlasLootItemsFrame.activeElement = nil
    else
	--	print(elemName.. " elemName")
		--Get the loot table for the element, either by name or by ID how reserv metod
		--lootTable = GetLootByName(zoneID, bossname) or GetLootByID(zoneID, id)
        if lootTable then
	--		print(tostring(lootTable).." lootTable")
			AtlasLootItemsFrame:Show()
			local scrollStartTime = GetTime()
			AtlasLoot_ShowScrollBarLoading()

		   --Store the loot table and boss name
			AtlasLootItemsFrame.StoredElement = elemName
            AtlasLootItemsFrame.activeElement = id

			CacheAllLootItems(lootTable, function()
				local elapsed = GetTime() - scrollStartTime
				print("AtlasLoot: время загрузки страницы: " .. string.format("%.2f", elapsed) .. " c")
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
	AtlasTWCharDB.LastMenu = { tablename, text, tabletype }
	--If the button clicked was linked to a loot table (default behavior for simplified structure)
	--DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot_HewdropClick: tablename "..tablename)
	if not tabletype or tabletype == "Table" then
	--if tabletype == "Table" then
		--Store the loot table and boss name
		AtlasLootItemsFrame.StoredElement = text
		-- Update scrollbar
		AtlasTW.Loot.ScrollBarLootUpdate()
		--Save needed info for fuure re-display of the table
		--AtlasTWCharDB.LastBoss = tablename
		--AtlasTWCharDB.LastBossText = text
		--Purge the text label for the submenu and disable the submenu
		AtlasLootItemsFrame_SubMenu:Disable()
		AtlasLootItemsFrame_SelectedTable:SetText("")
		AtlasLootItemsFrame_SelectedTable:Show()
	--If the button links to a sub menu definition
	else
		--Enable the submenu button
		AtlasLootItemsFrame_SubMenu:Enable()
		--Store the loot table and boss name
		AtlasLootItemsFrame.StoredElement = AtlasLoot_HewdropDown_SubTables[tablename][1][1]
		-- Update scrollbar
		AtlasTW.Loot.ScrollBarLootUpdate()
		--Save needed info for fuure re-display of the table
	--	AtlasTWCharDB.LastBoss = AtlasLoot_HewdropDown_SubTables[tablename][1][2]
	--	AtlasTWCharDB.LastBossText = AtlasLoot_HewdropDown_SubTables[tablename][1][1]
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
	--Store the loot table and boss name
	AtlasLootItemsFrame.StoredElement = text
	-- Update scrollbar
	AtlasTW.Loot.ScrollBarLootUpdate()
	--Save needed info for fuure re-display of the table
	--AtlasTWCharDB.LastBoss = tablename
	--AtlasTWCharDB.LastBossText = text
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
		[L["Crafting"]] = "AtlasLootCraftingMenu",
		[L["PvP Rewards"]] = "AtlasLootPvPMenu",
		[L["World Events"]] = "AtlasLootWorldEventMenu",
		[L["Collections"]] = "AtlasLootSetMenu",
		[L["Factions"]] = "AtlasLootRepMenu",
		[L["World"]] = "AtlasLootWorldMenu",
		[L["Dungeons & Raids"]] = "AtlasLoot_DungeonsMenu1",
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
 		for _, v in ipairs(AtlasLoot_HewdropDown) do
			if v[1] and not (type(v[1]) == "table") then
				for _, v2 in pairs(v) do
					for _, v3 in pairs(v2) do
						for _, v4 in pairs(v3) do
							if not (type(v4[1]) == "table") then
								if v4[1] == pagename and (not v4[3] or v4[3] == "Table") then
									AtlasLoot_HewdropClick(v4[2],this.name_orig or dataID,v4[3]) --TODO need change to  better
									--AtlasLoot_HewdropClick(v4[2],v4[1],v4[3])
								end
							else
								for _,v5 in pairs(v4) do
									if v5[1] == pagename then
										AtlasLoot_HewdropClick(v5[2],this.name_orig or dataID,v5[3])
										--AtlasLoot_HewdropClick(v5[2],v5[1],v5[3])
									end
								end
							end
						end
					end
				end
			end
		end
		CloseDropDownMenus()
		AtlasTWCharDB.LastBoss = TableSource
		AtlasTWCharDB.LastBossText = pagename

		print(dataID.." - dataID, "..TableSource.." - TableSource")
		AtlasLootItemsFrame:Show()
		local scrollStartTime = GetTime()
		AtlasLoot_ShowScrollBarLoading()

		--Store the loot table and boss name
		AtlasLootItemsFrame.StoredElement = pagename
		AtlasLootItemsFrame.StoredMenu = TableSource
		if type(TableSource) == "string" then
			TableSource = AtlasLoot_Data[TableSource] or GetLootByElemName(dataID)
		end

		CacheAllLootItems(TableSource, function()
			local elapsed = GetTime() - scrollStartTime
			print("AtlasLootMenuItem_OnClick: время загрузки страницы: " .. string.format("%.2f", elapsed) .. " c")
			AtlasLoot_HideScrollBarLoading()
			-- Update scrollbar
			AtlasTW.Loot.ScrollBarLootUpdate()
		end)
		AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(pagename, 30))
		AtlasLootItemsFrame_SelectedCategory:Show()
	end
end

--[[
	Called when <-, -> or 'Back' are pressed and calls up the appropriate loot page
]]
function AtlasLoot_NavButton_OnClick()
	--print("AtlasLoot_NavButton_OnClick")
	--[[ -- If the back button is clicked, set the LastBoss to the new page
	if this == AtlasLootItemsFrame_BACK then
		AtlasLootItemsFrame.externalBoss = this.lootpage
	end
	if AtlasLootItemsFrame.StoredElement then
		if AtlasLootItemsFrame.StoredElement == "AtlasLoot_DungeonsMenu1" then
			AtlasLootItemsFrame.StoredElement = "AtlasLoot_DungeonsMenu2"
			AtlasLoot_DungeonsMenu2()
			AtlasLootItemsFrame_SubMenu:Disable()
			return
		elseif AtlasLootItemsFrame.StoredElement == "AtlasLoot_DungeonsMenu2" then
			AtlasLootItemsFrame.StoredElement = "AtlasLoot_DungeonsMenu1"
			AtlasLoot_DungeonsMenu1()
			AtlasLootItemsFrame_SubMenu:Disable()
			return
		end
		if this.lootpage and string.sub(this.lootpage, 1, 16) == "SearchResultPage" then
			AtlasLoot_ShowItemsFrame("SearchResult", this.lootpage, string.format((L["Search Result: %s"]), AtlasTWCharDB.LastSearchedText or ""))
		elseif this.lootpage and string.sub(this.lootpage, 1, 12) == "WishListPage" then
			AtlasLoot_ShowItemsFrame("WishList", this.lootpage, L["WishList"])
		else
			AtlasTWCharDB.LastBoss = this.lootpage
			AtlasTWCharDB.LastBossText = this.title

			AtlasLootItemsFrame.StoredElement.loot = this.lootpage
			-- Update scrollbar
			AtlasTW.Loot.ScrollBarLootUpdate()
			AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.StoredElement)
			if AtlasLootItemsFrame_SelectedTable:GetText()~=nil then
				AtlasLootItemsFrame_SelectedTable:SetText(TruncateText(AtlasLoot_LootPageName:GetText(), 30))
			else
				AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(AtlasLoot_LootPageName:GetText(), 30))
			end
		end
	elseif AtlasLootItemsFrame.StoredElement then

		AtlasLootItemsFrame.storedBoss.name = this.title
		-- Update scrollbar
		AtlasTW.Loot.ScrollBarLootUpdate()
		AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.StoredElement)
	else
		--Fallback for if the requested loot page is a menu and does not have a .refresh instance
		AtlasLoot_ShowItemsFrame(this.lootpage, "dummy", this.title)
		AtlasLootItemsFrame.storedBoss.loot = this.lootpage
		-- Update scrollbar
		AtlasTW.Loot.ScrollBarLootUpdate()
	end
	if AtlasLoot_MenuHandlers[this.lootpage] then
		AtlasLootItemsFrame_SubMenu:Disable()
		--	DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot_NavButton_OnClick: "..this.lootpage)
		AtlasLootItemsFrame_SelectedCategory:SetText(TruncateText(AtlasTWCharDB.LastBossText, 30))
		AtlasLootItemsFrame_SelectedTable:SetText()
	end ]]
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
						AtlasTWCharDB["QuickLooks"][index] = AtlasLootItemsFrame.StoredElement
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
    local link = GetSpellInfoAtlasLootDB.craftspells[elemID]
    if not link then
        print("AtlasLoot Error: Missing spell data for ID: " .. tostring(elemID))
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
    local enchantData = GetSpellInfoAtlasLootDB.enchants[spellID]
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
	local dataSource = GetLootByElemName(dataID)

	if this.typeID == "item" then
		local itemName, itemLink, qualityId = GetItemInfo(this.itemID)
		_, _, _, color = GetItemQualityColor(qualityId or 0)
		--If shift-clicked, link in the chat window
		if AtlasFrame and AtlasFrame:IsVisible() and arg1=="RightButton" then
			getglobal("AtlasLootItem_"..id.."_Unsafe"):Hide()
		elseif(arg1=="RightButton" and not itemName and this.itemID ~= 0) then
			AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0")
			if not AtlasTWOptions.LootItemSpam then
				print(L["Server queried for "]..color.."["..itemName.."]".."|r"..L[". Right click on any other item to refresh the loot page."])
			end
			AtlasLootItemsFrame:Hide()

			-- Update scrollbar
			AtlasTW.Loot.ScrollBarLootUpdate()

			--AtlasLoot_ShowItemsFrame(dataID, dataSource)
--[[ 		elseif arg1=="RightButton" and itemName then
			AtlasLootItemsFrame:Hide()

			-- Update scrollbar
			AtlasTW.Loot.ScrollBarLootUpdate()

			--AtlasLoot_ShowItemsFrame(dataID, dataSource)
			if not AtlasTWOptions.LootItemSpam then
				print(itemName..L[" is safe."])
				--print(AtlasLootItemsFrame.activeElement)
			end ]]
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
--[[ 		elseif IsShiftKeyDown() and itemName and this.itemID ~= 0 then
			AtlasLoot_SayItemReagents(this.itemID, color, name)
			--If control-clicked, use the dressing room ]]
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
	elseif this.typeID == "enchant" then
		if IsShiftKeyDown() then
			AtlasLoot_SayItemReagents(this.elemID)
		elseif IsAltKeyDown() and this.elemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.elemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.elemID))
			else
				AtlasLoot_AddToWishlist(this.elemID, texture, this.elemIDName, this.elemIDExtra, dataID.."|"..dataSource)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local dataID, dataSource = AtlasLoot_Strsplit("|", this.sourcePage)
			if dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLootItemsFrame.StoredElement=dataID
				-- Update scrollbar
				AtlasTW.Loot.ScrollBarLootUpdate()
				--AtlasLoot_ShowItemsFrame(dataID, dataSource)
			end
		elseif this.container and arg1 == "LeftButton" then
			AtlasLoot_ShowContainerFrame()
		end
	elseif this.typeID == "spell" then
		if IsShiftKeyDown() then
			if this.elemID < 100000 then
				if WIM_EditBoxInFocus then
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem.."\124h["..craftname.."]|h|r")
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][this.elemID]["item"]
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
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						WIM_EditBoxInFocus:Insert(AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][this.elemID]["item"]))
					else
						WIM_EditBoxInFocus:Insert(name)
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = GetSpellInfoAtlasLootDB["craftspells"][this.elemID]["item"]
					if craftitem ~= nil and craftitem ~= "" then
						ChatFrameEditBox:Insert(AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][this.elemID]["item"]))
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
					SendChatMessage(AtlasLoot_GetChatLink(GetSpellInfoAtlasLootDB["craftspells"][this.elemID]["item"]),channel,nil,chatnumber)
				end
			end
		elseif IsAltKeyDown() and this.elemID ~= 0 then
			if dataID == "WishList" then
				AtlasLoot_DeleteFromWishList(this.elemID)
			elseif dataID == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.elemID))
			else
				AtlasLoot_AddToWishlist(this.elemID, texture, this.elemIDName, this.elemIDExtra, dataID.."|"..dataSource)
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0")
		elseif (dataID == "SearchResult" or dataID == "WishList") and this.sourcePage then
			local dataID, dataSource = AtlasLoot_Strsplit("|", this.sourcePage)
			if dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLootItemsFrame.StoredElement=dataID
				-- Update scrollbar
				AtlasTW.Loot.ScrollBarLootUpdate()
				--AtlasLoot_ShowItemsFrame(dataID, dataSource)
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

    local containerStartTime = GetTime()
	-- Кэшируем все предметы контейнера асинхронно, затем обновляем фрейм
	CacheAllLootItems(containerTable, function()
        local elapsed = GetTime() - containerStartTime
       -- print("AtlasLoot: время загрузки контейнера: " .. string.format("%.2f", elapsed) .. " c")
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
			AtlasLoot_AddToWishlist(itemID, tex, name, extra, ElemName.."|"..ElemLoot)
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
			AtlasLoot_AddToWishlist(itemID, tex, name, extra, lootpage.."|"..dataSource)
		elseif AtlasLootItemsFrame.storedBoss then
			local ElemName = AtlasLootItemsFrame.storedBoss.name
			local ElemLoot = GetLootByElemName(ElemName)

			if ElemName == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif ElemName == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(itemID))
			else
				AtlasLoot_AddToWishlist(itemID, tex, name, extra, ElemName.."|"..ElemLoot)
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
	if GetSpellInfoAtlasLootDB["craftspells"][id] then
		local spellData = GetSpellInfoAtlasLootDB["craftspells"][id]
		local craftitem = spellData["item"]

		if craftitem and craftitem ~= "" then
			-- Формирование строки количества предметов
			local craftnumber = ""
			local quantity = spellData["quantity"]

			if quantity then
				local qtyMin, qtyMax

				-- Проверяем тип quantity: число или массив
				if type(quantity) == "table" then
					qtyMin = quantity[1]
					qtyMax = quantity[2]
				else
					qtyMin = quantity
					qtyMax = quantity
				end

				if qtyMin and qtyMin ~= "" then
					if qtyMax and qtyMax ~= "" and qtyMin ~= qtyMax then
						craftnumber = qtyMin .. "-" .. qtyMax .. "x"
					else
						craftnumber = qtyMin .. "x"
					end
				end
			end

			-- Отправка сообщения о крафте
			local craftMessage = L["To craft "] .. craftnumber .. AtlasLoot_GetChatLink(craftitem) .. L[" the following reagents are needed:"]
			SendChatMessage(craftMessage, channel, nil, chatnumber)

			-- Отправка списка реагентов
			local reagents = spellData["reagents"]
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
			local spellName = spellData["name"]
			local castMessage = L["To cast "] .. spellName .. L[" the following items are needed:"]
			SendChatMessage(castMessage, channel, nil, chatnumber)

			-- Сброс переменных для новой секции
			chatline = ""
			itemCount = 0

			-- Отправка списка реагентов для заклинания
			local reagents = spellData["reagents"]
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
	elseif GetSpellInfoAtlasLootDB["enchants"][id] then
		local enchantData = GetSpellInfoAtlasLootDB["enchants"][id]
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