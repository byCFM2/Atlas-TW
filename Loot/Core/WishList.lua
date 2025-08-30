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

-- Функция поиска инстанса по имени элемента
local function FindInstanceByElemName(elemName)
	if not elemName then
		return nil
	end

	-- Проходим по всем категориям в MenuData
	for menuName, menuCategory in pairs(AtlasTW.MenuData) do
		if type(menuCategory) == "table" then
			for _, menuItem in pairs(menuCategory) do
				if type(menuItem) == "table" and menuItem.name == elemName then
					return menuName, elemName
				end
			end
		end
	end

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

	-- Проверяем, есть ли уже этот элемент в списке желаний
	for _, v in ipairs(AtlasTWCharDB.WishList) do
		if v.id == actualItemID and (v.type == elementType or (not v.type and elementType == "item")) then
			print(BLUE.."AtlasLoot"..":".. (name or "Unknown") ..RED..L[" already in the WishList!"])
			return
		end
	end

	--print("AtlasLoot_AddToWishlist: " .. actualItemID .." type: " .. elementType)
	-- Получаем информацию о боссе и инстансе
	local currentElement = AtlasLootItemsFrame.StoredElement
	local currentInstance

	-- Если у нас есть имя босса, всегда ищем правильный инстанс по базе данных
	local foundInstance, foundName = FindInstanceByElemName(currentElement)
	if foundInstance then
		currentInstance = foundInstance
		currentElement = foundName or currentElement
	end

	-- Добавляем запись в список желаний с типом элемента
	table.insert(AtlasTWCharDB.WishList, { id = actualItemID, element = currentElement, instance = currentInstance, type = elementType })
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



function AtlasLoot_GetWishListSubheadingBoss(bossName, instanceName)
	-- Возвращаем имя босса или страницы как заголовок
	if bossName and bossName ~= "" then
		return bossName
	end

	-- Если нет имени босса, возвращаем имя инстанса
	if instanceName and instanceName ~= "" then
		return instanceName
	end

	-- Возвращаем "Unknown" если ничего не найдено
	return L["Unknown"] or "Unknown"
end

function GetLootTableParent(bossName, instanceName)
	-- Возвращаем имя инстанса как extratext (подзаголовок)
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

		if v.element and v.instance and v.element ~= "" and v.instance ~= "" then
			-- Новый формат с информацией о боссе и инстансе
			currentCategory = AtlasLoot_GetWishListSubheadingBoss(v.element, v.instance)
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

			-- Определяем extratext (подзаголовок)
			local extratext = "Wish List"
			if v.instance and v.instance ~= "" then
				-- Есть информация об инстансе - используем его как extratext
				extratext = GetLootTableParent(v.element, v.instance) or "Unknown"
			end

			-- Добавляем заголовок категории: имя босса/страницы как заголовок, инстанс как extratext
			table.insert(result, { 0, currentCategory, extratext })
			lastCategory = currentCategory
		end

		-- Добавляем предмет с учетом типа элемента
		local elementType = v.type or "item"
		local displayItem = { v.id, v.element, v.instance, elementType }
		table.insert(result, displayItem)
	end

	collectgarbage()
	return result
end
