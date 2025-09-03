--File containing functions related to the wish list.
local L = AtlasTW.Local
local BS = AceLibrary("Babble-Spell-2.2a")

-- Colours stored for code readability
local GREY = "|cff999999"
local RED = "|cffff0000"
local BLUE = "|cff0070dd"
-- Кэш категоризации результатов WishList/SearchResult
if not AtlasTW then AtlasTW = {} end
if not AtlasTW._CatCache then AtlasTW._CatCache = {} end
if not AtlasTW._CatRev then AtlasTW._CatRev = {} end
function AtlasLoot_InvalidateCategorizedList(key)
	if not key then return end
	if not AtlasTW then return end
	if not AtlasTW._CatRev then AtlasTW._CatRev = {} end
	AtlasTW._CatRev[key] = (AtlasTW._CatRev[key] or 0) + 1
	if AtlasTW._CatCache and AtlasTW._CatCache[key] then
		AtlasTW._CatCache[key].data = nil
		AtlasTW._CatCache[key].rev = AtlasTW._CatRev[key]
	end
end

-- Предварительное объявление, чтобы использовать функцию до её определения
local _GetInstanceKeyByName

--[[
Displays the WishList
]]
function AtlasLoot_ShowWishList()
	-- Инициализируем список желаний, если его нет
	if not AtlasTWCharDB.WishList then
		AtlasTWCharDB.WishList = {}
	end

	for i = 1, table.getn(AtlasTWCharDB.WishList) do
		local v = AtlasTWCharDB.WishList[i]
		if v then
			-- Нормализуем поле instance: если записано имя, заменим на ключ
			if v.instance and v.instance ~= "" then
				if not (AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[v.instance]) then
					local k = _GetInstanceKeyByName(v.instance)
					if k then v.instance = k end
				end
			end
			-- Нормализуем sourcePage: вторая часть должна быть ключом
			if v.sourcePage and v.sourcePage ~= "" then
				local bossName, instPart = AtlasLoot_Strsplit("|", v.sourcePage)
				if instPart and instPart ~= "" then
					if not (AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[instPart]) then
						local k = _GetInstanceKeyByName(instPart)
						if k then
							v.sourcePage = (bossName or (v.element or "")).."|"..k
							if not v.instance or v.instance == "" then v.instance = k end
						end
					end
				end
			elseif v.element and v.instance and v.element ~= "" and v.instance ~= "" then
				v.sourcePage = v.element.."|"..v.instance
			end
		end
	end

	-- Сброс позиции прокрутки
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)

	-- Устанавливаем данные для отображения списка желаний
	AtlasLootItemsFrame.StoredElement = "WishList"
	AtlasLootItemsFrame.StoredMenu = nil
	AtlasLootItemsFrame.activeElement = nil

	-- Инвалидация кэша после возможной нормализации данных
	AtlasLoot_InvalidateCategorizedList("WishList")

	-- Обновляем отображение
	AtlasTW.Loot.ScrollBarLootUpdate()
end

-- Вспомогательная функция: поиск первого местоположения ID (числового) в базе инстансов
local function FindLocationById(targetId)
	if not targetId or not AtlasTW or not AtlasTW.InstanceData then return nil, nil end
	local function scanItems(items)
		if not items then return false end
		if type(items) == "string" then return false end
		if type(items) ~= "table" then return false end
		for _, it in ipairs(items) do
			if type(it) == "number" then
				if it == targetId then return true end
			elseif type(it) == "table" then
				if it.id and it.id == targetId then return true end
				if it.container then
					if scanItems(it.container) then return true end
				end
			end
		end
		return false
	end
	for instKey, inst in pairs(AtlasTW.InstanceData) do
		if inst.Reputation then
			for _, src in ipairs(inst.Reputation) do
				if scanItems(src.items or src.loot) then
					return (src.name or "Reputation"), instKey
				end
			end
		end
		if inst.Keys then
			for _, src in ipairs(inst.Keys) do
				if scanItems(src.items or src.loot) then
					return (src.name or "Keys"), instKey
				end
			end
		end
		if inst.Bosses then
			for _, boss in ipairs(inst.Bosses) do
				if scanItems(boss.items or boss.loot) then
					return (boss.name or boss.Name or "?"), instKey
				end
			end
		end
	end
	return nil, nil
end

-- Миграция на хранение instance как ключ инстанса и корректный sourcePage
-- Вспомогательная функция: получить ключ инстанса по имени или вернуть ключ как есть
_GetInstanceKeyByName = function(instName)
	if not instName or instName == "" then return nil end
	if AtlasTW and AtlasTW.InstanceData then
		if AtlasTW.InstanceData[instName] then return instName end
		for key, inst in pairs(AtlasTW.InstanceData) do
			if inst and inst.Name == instName then
				return key
			end
		end
	end
	return nil
end

-- Функция поиска инстанса по имени элемента; возвращает instKey и нормализованное имя элемента
local function FindInstanceByElemName(elemName)
	if not elemName or not AtlasTW or not AtlasTW.InstanceData then
		return nil, elemName
	end
	for instKey, instanceData in pairs(AtlasTW.InstanceData) do
		-- Поиск в репутациях
		if instanceData.Reputation then
			for _, v in ipairs(instanceData.Reputation) do
				if v.name == elemName or v.loot == elemName then
					return instKey, (v.name or elemName)
				end
			end
		end
		-- Поиск в ключах
		if instanceData.Keys then
			for _, v in ipairs(instanceData.Keys) do
				if v.name == elemName or v.loot == elemName then
					return instKey, (v.name or elemName)
				end
			end
		end
		-- Поиск в боссах
		if instanceData.Bosses then
			for _, bossData in ipairs(instanceData.Bosses) do
				if bossData.name == elemName or bossData.id == elemName then
					return instKey, (bossData.name or elemName)
				end
			end
		end
	end
	return nil, elemName
end

-- Возвращает локализованное/читаемое имя для страницы лута (lootpage) по её ключу
local function AtlasLoot_GetLootPageDisplayName(pageKey)
	if not pageKey or pageKey == "" then return nil end
	if AtlasLoot_IsLootTableAvailable and AtlasLoot_Data and AtlasLoot_Data[pageKey] then
		local page = AtlasLoot_Data[pageKey]
		if type(page) == "table" then
			for i = 1, table.getn(page) do
				local e = page[i]
				if type(e) == "table" and e.name and e.name ~= "" then
					return e.name
				end
			end
		end
	end
	return pageKey
end

-- Новый помощник: найти первую крафтовую страницу по ID заклинания
local function FindFirstCraftLootPageForSpell(spellID)
	if not AtlasLoot_Data or not spellID then return nil end
	for key, tbl in pairs(AtlasLoot_Data) do
		if type(tbl) == "table" then
			for i = 1, table.getn(tbl) do
				local el = tbl[i]
				if type(el) == "table" and el.id and el.id == spellID then
					return key
				end
			end
		end
	end
	return nil
end

-- Возвращает локализованное название профессии по ключу страницы лута (крафт-странице)
local function GetProfessionByLootPageKey(pageKey)
	if not pageKey or type(pageKey) ~= "string" then return nil end
	if not AtlasTW or not AtlasTW.MenuData then return nil end

	local MenuData = AtlasTW.MenuData

	-- Сопоставление ключей таблиц меню к локализованным названиям профессий
	local ProfByTableKey = {
		Alchemy = BS["Alchemy"] or "Alchemy",
		Smithing = BS["Blacksmithing"] or "Blacksmithing",
		Enchanting = BS["Enchanting"] or "Enchanting",
		Engineering = BS["Engineering"] or "Engineering",
		Leatherworking = BS["Leatherworking"] or "Leatherworking",
		Mining = BS["Mining"] or "Mining",
		Tailoring = BS["Tailoring"] or "Tailoring",
		Jewelcrafting = BS["Jewelcrafting"] or "Jewelcrafting",
		Cooking = BS["Cooking"] or "Cooking",
		FirstAid = BS["First Aid"] or "First Aid",
		Poisons = BS["Poisons"] or "Poisons",
		Herbalism = BS["Herbalism"] or "Herbalism",
		Survival = BS["Survival"] or "Survival",
	}

	-- Локальный помощник: безопасный проход по разреженным массивам
	local function GetMaxNumericIndex(tbl)
		local maxIndex = 0
		for k, v in pairs(tbl) do
			if type(k) == "number" and k > maxIndex and v then
				maxIndex = k
			end
		end
		return maxIndex
	end

	-- Локальный помощник: попытка найти профессию по таблице меню
	local function TryResolveByTable(tableKey)
		local t = MenuData[tableKey]
		if not t or type(t) ~= "table" then return nil end
		local maxIndex = GetMaxNumericIndex(t)
		for i = 1, maxIndex do
			local e = t[i]
			if e and e.lootpage == pageKey then
				-- Если в названии есть префикс до двоеточия — используем его (напр. "Alchemy: Apprentice")
				if e.name and type(e.name) == "string" then
					local pos = string.find(e.name, ":")
					if pos and pos > 1 then
						return string.sub(e.name, 1, pos - 1)
					end
				end
				-- Иначе возвращаем локализованное имя по ключу таблицы меню
				return ProfByTableKey[tableKey]
			end
		end
		return nil
	end

	-- 1) Прямое совпадение в основных таблицах профессий
	for tableKey, _ in pairs(ProfByTableKey) do
		local r = TryResolveByTable(tableKey)
		if r and r ~= "" then return r end
	end

	-- 2) Совпадение в верхнем уровне Crafting (на случай, если передали ключ меню профессии типа "AtlasLoot_AlchemyMenu")
	if MenuData.Crafting and type(MenuData.Crafting) == "table" then
		local maxIndex = GetMaxNumericIndex(MenuData.Crafting)
		for i = 1, maxIndex do
			local e = MenuData.Crafting[i]
			if e and e.lootpage == pageKey then
				if e.name and e.name ~= "" then
					return e.name
				end
				break
			end
		end
	end

	-- 3) Фоллбек на префиксы (как было раньше), если не нашли в MenuData
	if string.sub(pageKey, 1, 11) == "Engineering" then return BS and BS["Engineering"] or "Engineering" end
	if string.sub(pageKey, 1, 10) == "Enchanting" then return BS and BS["Enchanting"] or "Enchanting" end
	if string.sub(pageKey, 1, 9) == "Tailoring" then return BS and BS["Tailoring"] or "Tailoring" end
	if string.sub(pageKey, 1, 8) == "Smithing" then return BS and BS["Blacksmithing"] or "Blacksmithing" end
	if string.sub(pageKey, 1, 8) == "Alchemy" then return BS and BS["Alchemy"] or "Alchemy" end
	if string.sub(pageKey, 1, 7) == "Leather" then return BS and BS["Leatherworking"] or "Leatherworking" end
	if string.sub(pageKey, 1, 7) == "Cooking" then return BS and BS["Cooking"] or "Cooking" end
	if string.sub(pageKey, 1, 7) == "Mining" then return BS and BS["Mining"] or "Mining" end
	if string.sub(pageKey, 1, 13) == "Jewelcrafting" then return BS and BS["Jewelcrafting"] or "Jewelcrafting" end

	return nil
end

function AtlasLoot_AddToWishlist(itemID, elemFromSearch, instKeyFromSearch, typeFromSearch, srcFromSearch)
 	-- Инициализируем список желаний, если его нет
 	if not AtlasTWCharDB.WishList then
 		AtlasTWCharDB.WishList = {}
 	end
	-- Определяем тип элемента и получаем соответствующую информацию
	local elementType = typeFromSearch or "item"
	local name = nil
	local actualItemID = itemID

	-- Если тип не пришел из поиска, определяем по базам
	if not typeFromSearch then
		if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[itemID] then
			elementType = "spell"
			local spellData = AtlasTW.SpellDB.craftspells[itemID]
			name = spellData.name
			actualItemID = itemID
		elseif AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[itemID] then
			elementType = "enchant"
			local enchantData = AtlasTW.SpellDB.enchants[itemID]
			name = enchantData.name
			actualItemID = itemID
		else
			name = GetItemInfo(itemID)
			actualItemID = itemID
		end
	else
		-- Тип пришёл из поиска: подставим имя для отладки/поиска по имени при необходимости
		if elementType == "spell" and AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[itemID] then
			name = AtlasTW.SpellDB.craftspells[itemID].name
		elseif elementType == "enchant" and AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[itemID] then
			name = AtlasTW.SpellDB.enchants[itemID].name
		else
			name = GetItemInfo(itemID)
		end
	end
	-- Берем данные из результата поиска, если они были переданы
	local currentElement = elemFromSearch
	local currentInstanceKey = instKeyFromSearch

	-- Если из поиска ничего не пришло, попробуем определить локацию и источник только для предметов
	if (not currentElement and not currentInstanceKey) and elementType == "item" then
		local foundElem, foundInst = FindLocationById(actualItemID)
		currentElement = foundElem
		currentInstanceKey = foundInst
		-- Если не нашли по ID, попробуем по имени
		if not currentElement then
			local instKeyByName, normalizedElem = FindInstanceByElemName(name)
			currentElement = normalizedElem
			currentInstanceKey = instKeyByName
		end
	end

 	-- Формируем запись для WishList
 	local record = {
 		id = actualItemID,
 		element = currentElement,
 		instance = currentInstanceKey,
 		type = elementType,
 	}

	-- Формируем sourcePage: в приоритете значение, пришедшее из поиска (например, крафтовая страница)
	if type(srcFromSearch) == "string" and srcFromSearch ~= "" then
		record.sourcePage = srcFromSearch
	elseif currentElement and currentInstanceKey then
		record.sourcePage = currentElement.."|"..currentInstanceKey
	elseif currentInstanceKey then
		record.sourcePage = currentInstanceKey
	end

	-- Если sourcePage ещё не установлен и есть валидные elem/inst
	if not record.sourcePage and currentElement and currentInstanceKey then
		record.sourcePage = currentElement.."|"..currentInstanceKey
	end

 	-- Сохраняем в список желаний
	table.insert(AtlasTWCharDB.WishList, record)

	-- Сообщение в чат о добавлении
	if name and name ~= "" then
		print(name..L[" added to the WishList."])
	else
		print(tostring(actualItemID)..L[" added to the WishList."])
	end

	-- Инвалидация кэша категорий для списка желаний
	if AtlasLoot_InvalidateCategorizedList then
		AtlasLoot_InvalidateCategorizedList("WishList")
	end

	-- Обновляем только если сейчас открыта страница WishList
	if AtlasLootItemsFrame and AtlasLootItemsFrame.storedBoss and AtlasLootItemsFrame.storedBoss.name == "WishList" then
		AtlasLoot_ShowWishList()
	end
end

--[[
Group items with zone/event name etc, and format them by adding subheadings and empty lines
This function returns a single table with all items
wishList: is AtlasTWCharDB["WishList"], parameterized for flexible
]]
function AtlasLoot_CategorizeWishList(wishList)
	local result = {}

	if not wishList then return result end
	-- Используем кэш для WishList/SearchResult
	local cacheKey = nil
	if AtlasTWCharDB then
		if wishList == AtlasTWCharDB.WishList then
			cacheKey = "WishList"
		elseif wishList == AtlasTWCharDB.SearchResult then
			cacheKey = "SearchResult"
		end
	end
	if cacheKey and AtlasTW and AtlasTW._CatCache and AtlasTW._CatRev then
		local currRev = AtlasTW._CatRev[cacheKey] or 0
		local c = AtlasTW._CatCache[cacheKey]
		if c and c.rev == currRev and c.data then
			return c.data
		end
	end

	-- Проходим по списку без сортировки и добавляем заголовки при смене категории
	local lastCategoryKey = nil
	for i = 1, table.getn(wishList) do
		local v = wishList[i]
		local currentCategory

		-- Поддержка обоих форматов: словарь (WishList) и массив (SearchResult)
		local elem = (v.element ~= nil) and v.element or v[2]
		local inst = (v.instance ~= nil) and v.instance or v[3]
		local src = (v.sourcePage ~= nil) and v.sourcePage or v[5]

		-- Тип и ID элемента для дополнительных определений (спеллы/энчанты)
		local elementType = (v.type ~= nil) and v.type or v[4] or "item"
		local elemId = (v.id ~= nil) and v.id or v[1]

		-- Нормализация типов: принимаем только строки/числа; остальные типы (таблицы, функции, bool) отбрасываем
		if not (type(elem) == "string" or type(elem) == "number") then elem = nil end
		if not (type(inst) == "string" or type(inst) == "number") then inst = nil end
		if type(src) ~= "string" then src = nil end

		local elemOK = (elem ~= nil and elem ~= "")
		local instOK = (inst ~= nil and inst ~= "")

		local predefinedHeaderName = nil
		local predefinedExtraText = nil

		if elemOK and instOK then
			currentCategory = AtlasLoot_GetWishListSubheadingBoss(elem, inst)
		elseif src and src ~= "" then
			-- Попробуем извлечь boss|instance из sourcePage
			local b, ik = AtlasLoot_Strsplit("|", src)
			-- В AtlasLoot_Strsplit при отсутствии разделителя возвращается таблица {src}; нормализуем к строке
			if type(b) == "table" then b = b[1] end
			if type(ik) == "table" then ik = ik[1] end
			if (type(ik) == "string" or type(ik) == "number") and ik ~= "" then
				currentCategory = AtlasLoot_GetWishListSubheadingBoss(b, ik)
				if not elemOK then elem = b end
				if not instOK then inst = ik end
				elemOK = (elem ~= nil and elem ~= "")
				instOK = (inst ~= nil and inst ~= "")
			else
				-- src может быть ключом страницы лута (например, крафт) — локализуем имя по данным страницы
				local displayName = AtlasLoot_GetLootPageDisplayName(src)
				-- Для крафтовых страниц заголовком делаем короткое имя категории без префикса профессии
				local headerName = displayName
				local profName = GetProfessionByLootPageKey(src)
				if displayName and profName then
					local prefix = profName..": "
					if string.sub(displayName, 1, string.len(prefix)) == prefix then
						headerName = string.sub(displayName, string.len(prefix) + 1)
					end
				end
				currentCategory = (headerName and headerName ~= "") and headerName or (displayName and displayName ~= "" and displayName or src)
				if not elemOK then elem = currentCategory end
				-- Предзаполним подзаголовок профессией
				predefinedExtraText = GetProfessionByLootPageKey(src) or nil
			end
		else
			-- Попробуем вычислить заголовок/подзаголовок для спеллов/энчантов по крафт-странице
			if (elementType == "spell" or elementType == "enchant") and elemId and elemId ~= 0 then
				local lootPage = FindFirstCraftLootPageForSpell(elemId)
				if lootPage then
					local displayName = AtlasLoot_GetLootPageDisplayName(lootPage)
					local headerName = displayName
					local profName = GetProfessionByLootPageKey(lootPage)
					if displayName and profName then
						local prefix = profName..": "
						if string.sub(displayName, 1, string.len(prefix)) == prefix then
							headerName = string.sub(displayName, string.len(prefix) + 1)
						end
					end
					predefinedHeaderName = (headerName and headerName ~= "") and headerName or (displayName and displayName ~= "" and displayName or lootPage)
					predefinedExtraText = profName or nil
				end
			end
			-- Если не удалось вычислить — используем нейтральный заголовок
			currentCategory = predefinedHeaderName or (L["Search Result"] or "Search Result")
		end

		-- Предварительно вычислим extratext для формирования ключа категории
		local extratext = ""
		if instOK then
			extratext = GetLootTableParent(elem, inst) or ""
		elseif src and src ~= "" then
			local b, ik = AtlasLoot_Strsplit("|", src)
			if (type(ik) == "string" or type(ik) == "number") and ik ~= "" then
				extratext = GetLootTableParent(b, ik) or ""
			else
				-- Если это крафтовая страница, подзаголовок — название профессии
				extratext = GetProfessionByLootPageKey(src) or ""
			end
		end
		-- Фоллбек: если подзаголовок пуст и это спелл/энчант, попробуем определить профессию
		if (not extratext or extratext == "") and (elementType == "spell" or elementType == "enchant") then
			if predefinedExtraText and predefinedExtraText ~= "" then
				extratext = predefinedExtraText
			elseif elementType == "enchant" then
				extratext = BS and BS["Enchanting"] or "Enchanting"
			else
				local lootPage = FindFirstCraftLootPageForSpell(elemId)
				if lootPage then
					extratext = GetProfessionByLootPageKey(lootPage) or ""
				end
			end
		end

		local currentCategoryKey = tostring(currentCategory or "") .. "||" .. tostring(extratext or "")

		-- Если категория изменилась, добавляем заголовок
		if currentCategoryKey ~= lastCategoryKey then
			-- Добавляем пустую строку между категориями (кроме первой)
			if table.getn(result) > 0 then
				table.insert(result, {})
			end

			-- Добавляем заголовок категории: имя босса/страницы как заголовок, инстанс/профессия как extratext
			table.insert(result, { 0, currentCategory, extratext })
			lastCategoryKey = currentCategoryKey
		end

		-- Добавляем предмет с учетом типа элемента
		local displayItem = { (v.id ~= nil) and v.id or v[1], elem, inst, elementType }
		-- Пробрасываем 5-й элемент (sourcePage), только если это строка
		local src2 = nil
		if type(v.sourcePage) == "string" then
			src2 = v.sourcePage
		elseif type(v[5]) == "string" then
			src2 = v[5]
		end
		if src2 then
			table.insert(displayItem, src2)
		end
		table.insert(result, displayItem)
	end

	--collectgarbage()
	-- Сохраняем результат в кэш
	if cacheKey then
		if not AtlasTW._CatCache then AtlasTW._CatCache = {} end
		if not AtlasTW._CatRev then AtlasTW._CatRev = {} end
		AtlasTW._CatCache[cacheKey] = { data = result, rev = AtlasTW._CatRev[cacheKey] or 0 }
	end
	return result
end

function AtlasLoot_GetWishListSubheadingBoss(bossName, instanceName)
	-- Возвращаем имя босса или страницы как заголовок
	if bossName and bossName ~= "" then
		return bossName
	end

	-- Если нет имени босса, возвращаем имя инстанса
	if instanceName and instanceName ~= "" then
		if AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[instanceName] and AtlasTW.InstanceData[instanceName].Name then
			return AtlasTW.InstanceData[instanceName].Name
		end
		return instanceName
	end

	-- Возвращаем "Unknown" если ничего не найдено
	return L["Unknown"] or "Unknown"
end

function AtlasLoot_DeleteFromWishList(elemID)
	-- Удаляет элемент по его ID из списка желаний (поддержка обоих форматов записи)
	if not elemID then return end
	if not AtlasTWCharDB or not AtlasTWCharDB.WishList then return end

	local removed = false
	local removedName = nil
	local removedType = nil
	local newList = {}
	for i = 1, table.getn(AtlasTWCharDB.WishList) do
		local v = AtlasTWCharDB.WishList[i]
		if v then
			local vId = v.id or v[1]
			if vId ~= elemID then
				table.insert(newList, v)
			else
				removed = true
				removedType = v.type or v[4] or "item"
				-- Получим имя до удаления
				if removedType == "spell" then
					if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[vId] then
						removedName = AtlasTW.SpellDB.craftspells[vId].name
					end
				elseif removedType == "enchant" then
					if AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[vId] then
						removedName = AtlasTW.SpellDB.enchants[vId].name
					end
				else
					removedName = GetItemInfo(vId)
				end
			end
		end
	end
	AtlasTWCharDB.WishList = newList

	if removed then
		if removedName and removedName ~= "" then
			print(removedName..L[" deleted from the WishList."])
		else
			print(tostring(elemID)..L[" deleted from the WishList."])
		end
	else
		print(tostring(elemID)..L[" not found in the WishList."])
	end

	-- Обновляем отображение
	AtlasLoot_InvalidateCategorizedList("WishList")
	AtlasLoot_ShowWishList()
end

function GetLootTableParent(bossName, instanceName)
	-- Возвращаем имя инстанса как extratext (подзаголовок)
	if instanceName and instanceName ~= "" then
		if AtlasTW and AtlasTW.InstanceData and AtlasTW.InstanceData[instanceName] and AtlasTW.InstanceData[instanceName].Name then
			return AtlasTW.InstanceData[instanceName].Name
		end
		return instanceName
	end

	-- Если нет имени инстанса, пытаемся найти его по имени босса
	if bossName and AtlasTW.InstanceData then
		for instanceKey, instanceData in pairs(AtlasTW.InstanceData) do
			if instanceData.Bosses then
				for _, bossData in ipairs(instanceData.Bosses) do
					if bossData.name == bossName then
						return instanceData.Name or instanceKey
					end
				end
			end
		end
	end

	return L["Unknown"] or "Unknown"
end
