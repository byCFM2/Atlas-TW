local L = AtlasTW.Local
local RED = "|cffff0000"
local WHITE = "|cffFFFFFF"

function AtlasLoot:ShowSearchResult()
	-- Сброс позиции прокрутки
	FauxScrollFrame_SetOffset(AtlasLootScrollBar, 0)
	AtlasLootScrollBarScrollBar:SetValue(0)
	-- Устанавливаем данные для отображения результатов поиска
	AtlasLootItemsFrame.StoredElement = "SearchResult"
	AtlasLootItemsFrame.StoredMenu = nil
	AtlasLootItemsFrame.activeElement = nil
	-- Обновляем отображение
	AtlasTW.Loot.ScrollBarLootUpdate()
end

local function strtrim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
function AtlasLoot:Search(Text)
    if not Text then return end
    Text = strtrim(Text)
    if Text == "" then return end
    local text = string.lower(Text)

    AtlasTWCharDB.SearchResult = {}
    AtlasLoot_InvalidateCategorizedList("SearchResult")
    AtlasTWCharDB.LastSearchedText = Text

    local partial = AtlasTWCharDB.PartialMatching

    local function isMatch(name)
        if not name then return false end
        local ln = string.lower(name)
        if partial then
            return string.find(ln, text, 1, true)
        else
            return ln == text
        end
    end

    -- Локальный кэш уже добавленных результатов (уникализация по типу и id)
    local seen = {}
    local function addUnique(entry)
        local ty = entry[4] or "item"
        local id = entry[1]
        local key = ty .. ":" .. tostring(id)
        if not seen[key] then
            table.insert(AtlasTWCharDB.SearchResult, entry)
            seen[key] = true
        end
    end

    -- Поиск первого вхождения id (item/spell/enchant) в базе инстансов, чтобы получить boss и instanceKey
    local function findFirstLocationForId(targetId)
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
                        local f = scanItems(it.container)
                        if f then return true end
                    end
                end
            end
            return false
        end
        for instKey, inst in pairs(AtlasTW.InstanceData) do
            if inst.Bosses then
                for _, boss in ipairs(inst.Bosses) do
                    local bossName = boss.name or boss.Name or "?"
                    local items = boss.items or boss.loot
                    if scanItems(items) then
                        return bossName, instKey
                    end
                end
            end
            if inst.Reputation then
                for _, src in pairs(inst.Reputation) do
                    local items = src.items or src.loot
                    local label = (src.name or "Reputation")
                    if scanItems(items) then
                        return label, instKey
                    end
                end
            end
            if inst.Keys then
                for _, src in pairs(inst.Keys) do
                    local items = src.items or src.loot
                    local label = (src.name or "Keys")
                    if scanItems(items) then
                        return label, instKey
                    end
                end
            end
        end
        return nil, nil
    end

    local function addItemResult(itemID, bossName, instanceName, instanceKey)
        if not itemID or itemID == 0 then return end
        local itemName = GetItemInfo(itemID)
        if itemName and isMatch(itemName) then
            -- В SearchResult храним: [1]=id, [2]=bossName, [3]=instanceKey, [4]=type, [5]=sourcePage (optional)
            local entry = { itemID, bossName, instanceKey, "item" }
            if instanceKey and instanceKey ~= "" then
                table.insert(entry, (bossName or "").."|"..instanceKey)
            end
            addUnique(entry)
        end
    end

    local function searchItemsList(items, bossName, instanceName, instanceKey)
        if not items then return end
        if type(items) == "string" then
            -- Старые ссылочные форматы таблиц пропускаем
            return
        end
        if type(items) ~= "table" then return end
        for _, it in ipairs(items) do
            if type(it) == "number" then
                addItemResult(it, bossName, instanceName, instanceKey)
            elseif type(it) == "table" then
                if it.id then
                    addItemResult(it.id, bossName, instanceName, instanceKey)
                end
                if it.container then
                    searchItemsList(it.container, bossName, instanceName, instanceKey)
                end
            end
        end
    end

    -- Поиск предметов в инстансах/боссах новой структуры
    if AtlasTW.InstanceData then
        for instKey, inst in pairs(AtlasTW.InstanceData) do
            local instanceName = inst.Name or instKey
            if inst.Bosses then
                for _, boss in ipairs(inst.Bosses) do
                    local bossName = boss.name or boss.Name or "?"
                    local items = boss.items or boss.loot
                    searchItemsList(items, bossName, instanceName, instKey)
                end
            end
            -- Дополнительно проверим вспомогательные источники, если заданы
            if inst.Reputation then
                for _, src in pairs(inst.Reputation) do
                    local items = src.items or src.loot
                    local label = (src.name or "Reputation")
                    searchItemsList(items, label, instanceName, instKey)
                end
            end
            if inst.Keys then
                for _, src in pairs(inst.Keys) do
                    local items = src.items or src.loot
                    local label = (src.name or "Keys")
                    searchItemsList(items, label, instanceName, instKey)
                end
            end
        end
    end

    -- Дополнительный поиск предметов на страницах крафта/профессий и прочих лут-страницах (AtlasLoot_Data)
    local function searchItemsInLootTables()
        if not AtlasLoot_Data then return end
        local function considerItem(itemID, pageKey)
            if not itemID or itemID == 0 then return end
            local itemName = GetItemInfo(itemID)
            if itemName and isMatch(itemName) then
                -- [1]=id, [2]=bossName, [3]=instanceKey, [4]=type, [5]=sourcePage (ключ страницы)
                addUnique({ itemID, "", "", "item", pageKey })
            end
        end
        for key, tbl in pairs(AtlasLoot_Data) do
            if type(tbl) == "table" then
                for i = 1, table.getn(tbl) do
                    local el = tbl[i]
                    if type(el) == "table" then
                        if el.id then
                            considerItem(el.id, key)
                        end
                        if el.container and type(el.container) == "table" then
                            for j = 1, table.getn(el.container) do
                                local c = el.container[j]
                                if type(c) == "number" then
                                    considerItem(c, key)
                                elseif type(c) == "table" then
                                    if c[1] then
                                        considerItem(c[1], key)
                                    elseif c.id then
                                        considerItem(c.id, key)
                                    end
                                end
                            end
                        end
                    elseif type(el) == "number" then
                        considerItem(el, key)
                    end
                end
            end
        end
    end
    searchItemsInLootTables()

    -- Локатор страницы крафта/профессий: ищем первую таблицу лута, где встречается spellID (локальный для использования в enchants)
    local function findCraftLootPageLocal(spellID)
        if not AtlasLoot_Data then return nil end
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

    -- Поиск зачарований по названию в новой базе заклинаний
    if AtlasTW.SpellDB and AtlasTW.SpellDB.enchants then
        for spellID, data in pairs(AtlasTW.SpellDB.enchants) do
            local nm = data and data.name
            -- Fallback: если в базе нет названия зачарования, пробуем получить имя по itemID
            if (not nm or nm == "") and data and data.item then
                nm = GetItemInfo(data.item)
            end
            if isMatch(nm) then
                local bossName, instKey = findFirstLocationForId(spellID)
                if bossName and instKey then
                    addUnique({ spellID, bossName, instKey, "enchant", bossName.."|"..instKey })
                else
                    -- Попробуем привязать к странице крафта/профессии, если она найдена
                    local lootPage = findCraftLootPageLocal(spellID)
                    if lootPage then
                        addUnique({ spellID, "", "", "enchant", lootPage })
                    else
                        -- Без инстанса и крафт-страницы: остаётся пусто
                        addUnique({ spellID, "", "", "enchant" })
                    end
                end
            end
        end
    end

    -- Локатор страницы крафта: ищем первую таблицу лута, где встречается spellID
    local function findFirstCraftLootPageForSpell(spellID)
        if not AtlasLoot_Data then return nil end
        for key, tbl in pairs(AtlasLoot_Data) do
            if type(tbl) == "table" then
                -- Используем table.getn, т.к. # не поддерживается в 1.12
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

    -- Поиск крафтовых заклинаний: по имени заклинания, если есть, иначе по названию создаваемого предмета
    if AtlasTW.SpellDB and AtlasTW.SpellDB.craftspells then
        for spellID, data in pairs(AtlasTW.SpellDB.craftspells) do
            local nm = data and data.name
            if not nm and data and data.item then
                nm = GetItemInfo(data.item)
            end
            if isMatch(nm) then
                local bossName, instKey = findFirstLocationForId(spellID)
                if bossName and instKey then
                    addUnique({ spellID, bossName, instKey, "spell", bossName.."|"..instKey })
                else
                    -- Попробуем привязать к странице крафта, если она найдена
                    local lootPage = findFirstCraftLootPageForSpell(spellID)
                    if lootPage then
                        addUnique({ spellID, "", "", "spell", lootPage })
                    else
                        addUnique({ spellID, "", "", "spell" })
                    end
                end
            end
        end
    end

    AtlasLoot_InvalidateCategorizedList("SearchResult")
    if table.getn(AtlasTWCharDB.SearchResult) == 0 then
        print(RED.."AtlasLoot"..": "..WHITE..L["No match found for"].." \""..Text.."\".")
    else
        -- Отображаем всю выдачу, скролл занимается фреймом лута
        AtlasLoot:ShowSearchResult()
    end
end

function AtlasLoot:ShowSearchOptions(button)
	local Hewdrop = AceLibrary("Hewdrop-2.0")
	if Hewdrop:IsOpen(button) then
		Hewdrop:Close(1)
	else
		local setOptions = function()
			Hewdrop:AddLine(
				"text", L["Search options"],
				"isTitle", true,
				"notCheckable", true
			)
			Hewdrop:AddLine(
				"text", L["Partial matching"],
				"checked", AtlasTWCharDB.PartialMatching,
				"tooltipTitle", L["Partial matching"],
				"tooltipText", L["If checked, AtlasLoot searches item names for a partial match."],
				"func", function() AtlasTWCharDB.PartialMatching = not AtlasTWCharDB.PartialMatching end
			)
		end
		Hewdrop:Open(button,
			'point', function(parent)
				return "BOTTOMLEFT", "BOTTOMRIGHT"
			end,
			"children", setOptions
		)
	end
end

function AtlasLoot:GetOriginalDataFromSearchResult(itemID)
	for i, v in ipairs(AtlasTWCharDB.SearchResult) do
		if v[1] == itemID then return unpack(v) end
	end
end