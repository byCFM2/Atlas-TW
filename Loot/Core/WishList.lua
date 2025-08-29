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
function AtlasLoot_AddToWishlist(itemID, bossName, instanceName)
	-- Если передан только itemID, получаем остальную информацию автоматически
	local name = GetItemInfo(itemID)
	
	-- Инициализируем исходный список, если его нет
	if not AtlasTWCharDB.WishListRaw then
		AtlasTWCharDB.WishListRaw = {}
	end
	
	-- Проверяем, есть ли уже этот предмет в исходном списке желаний
	for _, v in ipairs(AtlasTWCharDB.WishListRaw) do
		if v[1] == itemID then
			print(BLUE.."AtlasLoot"..":"..name..RED..L[" already in the WishList!"])
			return
		end
	end

	-- Получаем информацию о текущем боссе и инстансе
	local currentBoss = bossName
	local currentInstance = instanceName
	
	-- Если информация не передана, пытаемся получить из текущего контекста
	if not currentBoss or not currentInstance then
		local currentZoneID = AtlasTW.DropDowns and AtlasTW.DropDowns[AtlasTWOptions.AtlasType] and AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
		if currentZoneID and AtlasTW.InstanceData and AtlasTW.InstanceData[currentZoneID] then
			currentInstance = currentInstance or AtlasTW.InstanceData[currentZoneID].Name
			-- Если есть активный элемент, получаем имя босса
			if AtlasLootItemsFrame.StoredElement and AtlasLootItemsFrame.StoredElement ~= "WishList" then
				currentBoss = currentBoss or AtlasLootItemsFrame.StoredElement
			end
		end
	end

	-- Добавляем запись в исходный список желаний
	table.insert(AtlasTWCharDB.WishListRaw, { itemID, currentBoss, currentInstance })
	print(BLUE.."AtlasLoot"..":"..name..GREY..L[" added to the WishList."])
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
			deletedItemName = GetItemInfo(itemID) or "Unknown Item"
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
		local name1 = GetItemInfo(temp1[1]) or ""
		local name2 = GetItemInfo(temp2[1]) or ""
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
		
		-- Добавляем предмет
		table.insert(result, v)
	end
	
	collectgarbage()
	return result
end
