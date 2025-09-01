--File containing functions related to the wish list.
local L = AtlasTW.Local

-- Colours stored for code readability
local GREY = "|cff999999"
local RED = "|cffff0000"
local BLUE = "|cff0070dd"

--[[
Displays the WishList
]]
function AtlasLoot_ShowWishList()
	-- Инициализируем список желаний, если его нет
	if not AtlasTWCharDB.WishList then
		AtlasTWCharDB.WishList = {}
	end

	-- Миграция на хранение instance как ключ инстанса и корректный sourcePage
	-- Вспомогательная функция: получить ключ инстанса по имени или вернуть ключ как есть
	local function _GetInstanceKeyByName(instName)
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

function AtlasLoot_AddToWishlist(itemID)
	-- Инициализируем список желаний, если его нет
	if not AtlasTWCharDB.WishList then
		AtlasTWCharDB.WishList = {}
	end

	-- Определяем тип элемента и получаем соответствующую информацию
	local elementType = "item"
	local name = nil
	local actualItemID = itemID

	-- Проверяем, является ли это заклинанием
	if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[itemID] then
		elementType = "spell"
		local spellData = AtlasTW.SpellDB.craftspells[itemID]
		name = spellData.name
		-- Для заклинаний используем ID заклинания
		actualItemID = itemID
	-- Проверяем, является ли это зачарованием
	elseif AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[itemID] then
		elementType = "enchant"
		local enchantData = AtlasTW.SpellDB.enchants[itemID]
		name = enchantData.name
		-- Для зачарований используем ID заклинания
		actualItemID = itemID
	else
		-- Обычный предмет
		name = GetItemInfo(itemID)
	end

	-- Проверяем, есть ли уже этот элемент в списке желаний
	for i = 1, table.getn(AtlasTWCharDB.WishList) do
		local v = AtlasTWCharDB.WishList[i]
		if v and v.id == actualItemID and (v.type == elementType or (not v.type and elementType == "item")) then
			print(BLUE.."AtlasLoot"..":".. (name or "Unknown") ..RED..L[" already in the WishList!"])
			return
		end
	end

	-- Получаем текущий контекст UI
	local currentElement = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredElement or nil
	local currentInstanceKey = AtlasLootItemsFrame and AtlasLootItemsFrame.StoredMenu or nil

	-- Если знаем имя босса, но не знаем ключ инстанса — найдём его по базе
	if currentElement and not currentInstanceKey then
		local foundInstanceKey, foundName = FindInstanceByElemName(currentElement)
		if foundInstanceKey then
			currentInstanceKey = foundInstanceKey
			currentElement = foundName or currentElement
		end
	end

	-- Для чар/спеллов/предметов, если нет контекста — попробуем найти местоположение по ID
	if (not currentElement or not currentInstanceKey) and actualItemID then
		local locName, locInstKey = FindLocationById(actualItemID)
		if locName and locInstKey then
			currentElement = locName
			currentInstanceKey = locInstKey
		end
	end

	-- Добавляем запись в список желаний в новом формате: instance хранит ключ инстанса, плюс sourcePage
	local record = { id = actualItemID, element = currentElement, instance = currentInstanceKey, type = elementType }
	if currentElement and currentInstanceKey then
		record.sourcePage = currentElement.."|"..currentInstanceKey
	end
	table.insert(AtlasTWCharDB.WishList, record)
	print(BLUE.."AtlasLoot"..":".. (name or "Unknown") ..GREY..L[" added to the WishList."])
end

--[[
Deletes the specified items from the wishlist
]]
function AtlasLoot_DeleteFromWishList(itemID)
	if not AtlasTWCharDB.WishList then
		return
	end

	-- Удаляем элемент из списка желаний по ID
	for i = table.getn(AtlasTWCharDB.WishList), 1, -1 do
		local v = AtlasTWCharDB.WishList[i]
		if v.id == itemID then
			table.remove(AtlasTWCharDB.WishList, i)
			break
		end
	end

	-- Обновляем отображение, если список желаний активен
	if AtlasLootItemsFrame and AtlasLootItemsFrame:IsVisible() and AtlasLootItemsFrame.StoredElement == "WishList" then
		AtlasTW.Loot.ScrollBarLootUpdate()
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

	-- Проходим по списку без сортировки и добавляем заголовки при смене категории
	local lastCategory = nil
	for i = 1, table.getn(wishList) do
		local v = wishList[i]
		local currentCategory

		-- Поддержка обоих форматов: словарь (WishList) и массив (SearchResult)
		local elem = (v.element ~= nil) and v.element or v[2]
		local inst = (v.instance ~= nil) and v.instance or v[3]
		local src = (v.sourcePage ~= nil) and v.sourcePage or v[5]

		if elem and inst and elem ~= "" and inst ~= "" then
			-- Новый формат с информацией о боссе и инстансе
			currentCategory = AtlasLoot_GetWishListSubheadingBoss(elem, inst)
		elseif src and src ~= "" then
			-- Попытка извлечь boss|instance из sourcePage
			local b, ik = AtlasLoot_Strsplit("|", src)
			if ik and ik ~= "" then
				currentCategory = AtlasLoot_GetWishListSubheadingBoss(b, ik)
				-- Обновим elem/inst, чтобы ниже корректно вычислить extratext
				if not elem or elem == "" then elem = b end
				if not inst or inst == "" then inst = ik end
			else
				-- src может быть ключом страницы лута (например, крафт)
				currentCategory = b or src
			end
		else
			-- Для SearchResult без явных elem/inst используем нейтральный заголовок
			currentCategory = L["Search Result"] or "Search Result"
		end

		-- Если категория изменилась, добавляем заголовок
		if currentCategory ~= lastCategory then
			-- Добавляем пустую строку между категориями (кроме первой)
			if table.getn(result) > 0 then
				table.insert(result, {})
			end

			-- Определяем extratext (подзаголовок)
			local extratext = ""
			if inst and inst ~= "" then
				-- Есть информация об инстансе - используем его как extratext
				extratext = GetLootTableParent(elem, inst) or ""
			elseif src and src ~= "" then
				local b, ik = AtlasLoot_Strsplit("|", src)
				if ik and ik ~= "" then
					extratext = GetLootTableParent(b, ik) or ""
				else
					extratext = ""
				end
			end

			-- Добавляем заголовок категории: имя босса/страницы как заголовок, инстанс как extratext
			table.insert(result, { 0, currentCategory, extratext })
			lastCategory = currentCategory
		end

		-- Добавляем предмет с учетом типа элемента
		local elementType = (v.type ~= nil) and v.type or v[4] or "item"
		local id = (v.id ~= nil) and v.id or v[1]
		local displayItem = { id, elem, inst, elementType }
		-- Пробрасываем 5-й элемент (sourcePage), если он есть
		local src = v.sourcePage or v[5]
		if src then
			table.insert(displayItem, src)
		end
		table.insert(result, displayItem)
	end

	collectgarbage()
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
