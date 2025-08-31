local L = AtlasTW.Local
local RED = "|cffff0000"
local WHITE = "|cffFFFFFF"

local currentPage = 1
local SearchResult = nil

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
            local entry = { itemID, bossName, itemName, "item" }
            if instanceKey and instanceKey ~= "" then
                table.insert(entry, (bossName or "").."|"..instanceKey)
            end
            table.insert(AtlasTWCharDB.SearchResult, entry)
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

    -- Поиск зачарований по названию в новой базе заклинаний
    if AtlasTW.SpellDB and AtlasTW.SpellDB.enchants then
        for spellID, data in pairs(AtlasTW.SpellDB.enchants) do
            local nm = data and data.name
            if isMatch(nm) then
                local bossName, instKey = findFirstLocationForId(spellID)
                if bossName and instKey then
                    table.insert(AtlasTWCharDB["SearchResult"], { spellID, bossName, nm, "enchant", bossName.."|"..instKey })
                else
                    table.insert(AtlasTWCharDB["SearchResult"], { spellID, "", nm, "enchant" })
                end
            end
        end
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
                    table.insert(AtlasTWCharDB["SearchResult"], { spellID, bossName, (nm or Text), "spell", bossName.."|"..instKey })
                else
                    table.insert(AtlasTWCharDB["SearchResult"], { spellID, "", (nm or Text), "spell" })
                end
            end
        end
    end

    if table.getn(AtlasTWCharDB["SearchResult"]) == 0 then
        print(RED.."AtlasLoot"..": "..WHITE..L["No match found for"].." \""..Text.."\".")
    else
        currentPage = 1
        SearchResult = AtlasLoot_CategorizeWishList(AtlasTWCharDB["SearchResult"])
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
	for i, v in ipairs(AtlasTWCharDB["SearchResult"]) do
		if v[1] == itemID then return unpack(v) end
	end
end

-- Copied and modified from AtlasLoot_GetWishListPage
function AtlasLoot:GetSearchResultPage(page)
	if not SearchResult then SearchResult = AtlasLoot_CategorizeWishList(AtlasTWCharDB["SearchResult"]) end
	-- Calc for maximal pages
	local pageMax = math.ceil(getn(SearchResult) / 30)
	if page < 1 then page = 1 end
	if page > pageMax then page = pageMax end
	currentPage = page

	-- Table copy
	local result = {}
	local start = (page - 1) * 30 + 1
	for i = start, start + 29 do
		if not SearchResult[i] then break end
		table.insert(result, SearchResult[i])
	end
	return result, pageMax
end