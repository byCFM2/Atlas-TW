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
	-- Сброс позиции прокрутки
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)

	-- Устанавливаем данные для отображения списка желаний
	AtlasLootItemsFrame.StoredElement = "WishList"
	AtlasLootItemsFrame.StoredMenu = nil
	AtlasLootItemsFrame.activeElement = nil

	-- Показываем фрейм
	AtlasLootItemsFrame:Show()

	-- Обновляем отображение
	AtlasTW.Loot.ScrollBarLootUpdate()
end

--[[
Looks for an empty slot in the wishlist and slots the item in
]]
-- Функция поиска названия страницы в AtlasTW.MenuData по ключу
local function FindPageNameInMenuData(dataKey)
	if not AtlasTW.MenuData then
		return dataKey
	end
	
	-- Проходим по всем категориям в MenuData
	for menuName, menuCategory in pairs(AtlasTW.MenuData) do
		if type(menuCategory) == "table" then
			for _, menuItem in pairs(menuCategory) do
				if type(menuItem) == "table" and menuItem.name == dataKey then
					return menuName
				end
			end
		end
	end
	
	return dataKey
end

-- Функция поиска инстанса по имени элемента
local function FindInstanceByElemName(elemName)
	if not elemName then
		return nil
	end
 	local pageName = FindPageNameInMenuData(elemName)
	if pageName then
		return pageName, elemName
	end

	print("FindInstanceByElemName: " .. elemName)
	-- Поиск в AtlasTW.InstanceData (обычные инстансы)
	if AtlasTW.InstanceData then
		for _, instanceData in pairs(AtlasTW.InstanceData) do
			if instanceData.Bosses then
				for _, bossData in pairs(instanceData.Bosses) do
					if bossData.name == elemName then
						return instanceData.Name, elemName
					end
				end
			end
		end
	end

	return nil, elemName
end

function AtlasLoot_AddToWishlist(itemID, elemName, instanceName)
	-- Инициализируем исходный список, если его нет
	if not AtlasTWCharDB.WishListRaw then
		AtlasTWCharDB.WishListRaw = {}
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
		-- Для заклинаний используем ID заклинания, а не предмета
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
	
	-- Проверяем, есть ли уже этот элемент в исходном списке желаний
	for _, v in ipairs(AtlasTWCharDB.WishListRaw) do
		if v[1] == actualItemID and (v[4] == elementType or (not v[4] and elementType == "item")) then
			print(BLUE.."AtlasLoot"..":".. (name or "Unknown") ..RED..L[" already in the WishList!"])
			return
		end
	end

	print("AtlasLoot_AddToWishlist: " .. actualItemID .. " " .. (elemName or " no") .. " " .. (instanceName or " no") .. " type: " .. elementType)
	-- Получаем информацию о боссе и инстансе
	local currentElement = elemName or AtlasLootItemsFrame.StoredElement
	local currentInstance = instanceName
	
	-- Если у нас есть имя босса, всегда ищем правильный инстанс по базе данных
	local foundInstance, foundName = FindInstanceByElemName(currentElement)
	if foundInstance then
		currentInstance = foundInstance
		currentElement = foundName or currentElement
		print("Найден инстанс по имени элемента: " .. tostring(currentElement) .. " -> " .. tostring(currentInstance))
	end

	-- Добавляем запись в исходный список желаний с типом элемента
	table.insert(AtlasTWCharDB.WishListRaw, { actualItemID, currentElement, currentInstance, elementType })
	print(BLUE.."AtlasLoot"..":".. (name or "Unknown") ..GREY..L[" added to the WishList."])
	-- Пересоздаем категоризированный список
	AtlasTWCharDB.WishList = AtlasLoot_CategorizeWishList(AtlasTWCharDB.WishListRaw)
end

--[[
Deletes the specified items from the wishlist
]]
function AtlasLoot_DeleteFromWishList(itemID)
	if itemID and itemID == 0 then return end
	
	-- Получаем исходный некатегоризированный список
	local rawWishList = AtlasTWCharDB.WishListRaw or {}
	local newRawWishList = {}
	local itemDeleted = false
	local deletedItemName = ""
	
	-- Удаляем предмет из исходного списка
	for i, v in ipairs(rawWishList) do
		if v[1] and v[1] == itemID and not itemDeleted then
			-- Определяем имя элемента в зависимости от типа
			local elementType = v[4] or "item"
			if elementType == "spell" and AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[itemID] then
				deletedItemName = AtlasTW.SpellDB.craftspells[itemID].name or "Unknown Spell"
			elseif elementType == "enchant" and AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[itemID] then
				deletedItemName = AtlasTW.SpellDB.enchants[itemID].name or "Unknown Enchant"
			else
				deletedItemName = GetItemInfo(itemID) or "Unknown Item"
			end
			itemDeleted = true
			-- Пропускаем этот элемент
		else
			table.insert(newRawWishList, v)
		end
	end
	
	if itemDeleted then
		print(RED.."AtlasLoot"..":"..deletedItemName..GREY..L[" deleted from the WishList."])
		-- Обновляем исходный список
		AtlasTWCharDB.WishListRaw = newRawWishList
		-- Пересоздаем категоризированный список
		AtlasTWCharDB.WishList = AtlasLoot_CategorizeWishList(newRawWishList)
		
		-- Если мы находимся в окне списка желаний, обновляем отображение
		if AtlasLootItemsFrame.StoredElement == "WishList" and AtlasLootItemsFrame:IsVisible() then
			AtlasTW.Loot.ScrollBarLootUpdate()
		else
			AtlasLootItemsFrame:Hide()
		end
	end
end

--[[
Sorts the Wishlist
]]
function AtlasLoot_WishListSort()
	-- Инициализируем исходный список, если его нет
	if not AtlasTWCharDB.WishListRaw then
		AtlasTWCharDB.WishListRaw = {}
	end

	local j=0
	local P=2
	local temp={}
	local check=false
	local wishListSize = table.getn(AtlasTWCharDB.WishListRaw)

	while(P<=wishListSize) do
		temp=AtlasTWCharDB.WishListRaw[P]
		j=P
		check=AtlasLoot_WishListSortCheck(AtlasTWCharDB.WishListRaw[j-1], temp)
		while((j>1) and check) do
			AtlasTWCharDB.WishListRaw[j] = AtlasTWCharDB.WishListRaw[j-1]
			j=j-1
			check=AtlasLoot_WishListSortCheck(AtlasTWCharDB.WishListRaw[j-1], temp)
		end
		AtlasTWCharDB.WishListRaw[j]=temp
		P=P+1
	end
	
	-- Пересоздаем категоризированный список после сортировки
	AtlasTWCharDB.WishList = AtlasLoot_CategorizeWishList(AtlasTWCharDB.WishListRaw)
end

--[[
Checks if temp1 > temp2
Sorts by rarity, then alphabetically.
]]
function AtlasLoot_WishListSortCheck(temp1, temp2)
	if (temp1 == nil) then
		return false
	elseif (temp2 == nil) then
		return false
	end
	if temp2[1] == 0 then
		return false
	elseif temp1[1] == 0 then
		return true
	elseif temp1[1] and temp2[1] then
		-- Получаем имена элементов в зависимости от типа
		local name1 = ""
		local name2 = ""
		
		local elementType1 = temp1[4] or "item"
		local elementType2 = temp2[4] or "item"
		
		if elementType1 == "spell" and AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[temp1[1]] then
			name1 = AtlasTW.SpellDB.craftspells[temp1[1]].name or ""
		elseif elementType1 == "enchant" and AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[temp1[1]] then
			name1 = AtlasTW.SpellDB.enchants[temp1[1]].name or ""
		else
			name1 = GetItemInfo(temp1[1]) or ""
		end
		
		if elementType2 == "spell" and AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells and AtlasTW.SpellDB.craftspells[temp2[1]] then
			name2 = AtlasTW.SpellDB.craftspells[temp2[1]].name or ""
		elseif elementType2 == "enchant" and AtlasTW.SpellDB and AtlasTW.SpellDB.enchants and AtlasTW.SpellDB.enchants[temp2[1]] then
			name2 = AtlasTW.SpellDB.enchants[temp2[1]].name or ""
		else
			name2 = GetItemInfo(temp2[1]) or ""
		end
		
		local prefix1=string.lower(string.sub(name1, 1, 10))
		local prefix2=string.lower(string.sub(name2, 1, 10))
		if prefix1 ~= prefix2 then
			if prefix1 == "|cffff0000" then
				return false
			elseif (prefix1 == "|cffff8000") and (prefix2 ~= "|cffff0000") then
				return false
			elseif (prefix1 == "|cffa335ee") then
				if (prefix2 == "|cffff8000") or (prefix2 == "|cffff0000") then
					return true
				else
					return false
				end
			elseif (prefix1 == "|cff0070dd") then
				if (prefix2 == "|cffa335ee") or (prefix2 == "|cffff8000") or (prefix2 == "|cffff0000") then
					return true
				else
					return false
				end
			elseif (prefix1 == "|cff1eff00") then
				if (prefix2 == "|cffffffff") or (prefix2 == "|cff9d9d9d") then
					return false
				else
					return true
				end
			elseif (prefix1 == "|cff9d9d9d") then
				return true
			elseif (prefix1 == "|cffffffff") and (prefix2~="|cff9d9d9d") then
				return true
			else
				return false
			end
		else
			if(name1 > name2) then
				return true
			else
				return false
			end
		end
	end
end

function AtlasLoot_GetWishListSubheadingBoss(bossName, instanceName)
	-- Если передано имя босса, возвращаем его
	if bossName and bossName ~= "" then
		return bossName
	end
	
	-- Если передано имя инстанса, возвращаем его
	if instanceName and instanceName ~= "" then
		return instanceName
	end
	
	-- Возвращаем "Unknown" если ничего не найдено
	return L["Unknown"] or "Unknown"
end

function GetLootTableParent(bossName, instanceName)
	-- Возвращаем имя инстанса как родительский элемент
	if instanceName and instanceName ~= "" then
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

--[[
Group items with zone/event name etc, and format them by adding subheadings and empty lines
This function returns a single table with all items
wlTable: is AtlasTWCharDB["WishList"], parameterized for flexible
]]
function AtlasLoot_CategorizeWishList(wishListRaw)
	local result = {}
	
	if not wishListRaw then return result end
	
	-- Создаем копию списка для сортировки
	local sortedList = {}
	for i = 1, table.getn(wishListRaw) do
		table.insert(sortedList, wishListRaw[i])
	end
	
	-- Сортируем по категориям: сначала по инстансу, потом по боссу, потом по предмету
	table.sort(sortedList, function(a, b)
		local aInstance = a[3] or ""
		local bInstance = b[3] or ""
		local aBoss = a[2] or ""
		local bBoss = b[2] or ""
		
		if aInstance ~= bInstance then
			return aInstance < bInstance
		end
		if aBoss ~= bBoss then
			return aBoss < bBoss
		end
		-- Если категории одинаковые, сортируем по предмету
		return AtlasLoot_WishListSortCheck(a, b)
	end)
	
	-- Проходим по отсортированному списку и добавляем заголовки при смене категории
	local lastCategory = nil
	for i = 1, table.getn(sortedList) do
		local v = sortedList[i]
		local currentCategory
		
		if v[2] and v[3] and v[2] ~= "" and v[3] ~= "" then
			-- Новый формат с информацией о боссе и инстансе
			currentCategory = AtlasLoot_GetWishListSubheadingBoss(v[2], v[3])
		else
			-- Формат без дополнительной информации - только itemID
			currentCategory = L["Wish List"] or "Wish List"
		end
		
		-- Если категория изменилась, добавляем заголовок
		if currentCategory ~= lastCategory then
			-- Добавляем пустую строку между категориями (кроме первой)
			if table.getn(result) > 0 then
				table.insert(result, {})
			end
			
			-- Определяем parent
			local parent = "Wish List"
			if v[3] and v[3] ~= "" then
				-- Есть информация об инстансе
				parent = GetLootTableParent(v[2], v[3]) or "Unknown"
			end
			
			-- Добавляем заголовок категории
			table.insert(result, { 0, "INV_Box_01", currentCategory, parent })
			lastCategory = currentCategory
		end
		
		-- Добавляем предмет с учетом типа элемента
		local elementType = v[4] or "item"
		local displayItem = { v[1], v[2], v[3], elementType }
		table.insert(result, displayItem)
	end
	
	collectgarbage()
	return result
end
