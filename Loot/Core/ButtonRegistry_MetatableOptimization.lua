-- Альтернативная оптимизация ButtonRegistry через метатаблицы и ленивую загрузку
-- Совместимо с WoW 1.12

local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

-- Кэш для уже созданных страниц
local PageCache = {}

-- Конфигурация групп и их последовательностей
local GroupConfigs = {
	["HQ"] = {
		prefix = "HQ",
		sequence = {
			{id = "HighForemanBargulBlackhammer", title = "High Foreman Bargul Blackhammer"},
			{id = "EngineerFiggles", title = "Engineer Figgles"},
			{id = "Corrosis", title = "Corrosis"},
			{id = "HatereaverAnnihilator", title = "Hatereaver Annihilator"},
			{id = "HargeshDoomcaller", title = "Hargesh Doomcaller"},
			{id = "Trash", title = function() return L["Trash Mobs"] end}
		}
	},
	
	["BRD"] = {
		prefix = "BRD",
		sequence = {
			{id = "LordRoccor", title = "Lord Roccor"},
			{id = "HighInterrogatorGerstahn", title = "High Interrogator Gerstahn"},
			{id = "Anubshiah", title = "Anub'shiah"},
			{id = "Eviscerator", title = "Eviscerator"},
			{id = "Gorosh", title = "Gorosh the Dervish"},
			{id = "Grizzle", title = "Grizzle"},
			{id = "Hedrum", title = "Hedrum the Creeper"},
			{id = "Okthor", title = "Ok'thor the Breaker"},
			{id = "Theldren", title = "Theldren"},
			{id = "Houndmaster", title = "Houndmaster Grebmar"},
			{id = "PyromancerLoregrain", title = function() return "Pyromancer Loregrain".." ("..L["Rare"]..")"; end},
			{id = "TheVault", title = "The Vault"},
			{id = "WarderStilgiss", title = function() return "Warder Stilgiss".." ("..L["Rare"]..")"; end},
			{id = "Verek", title = function() return "Verek".." ("..L["Rare"]..")"; end},
			{id = "FineousDarkvire", title = "Fineous Darkvire"},
			{id = "LordIncendius", title = "Lord Incendius"},
			{id = "BaelGar", title = "Bael'Gar"},
			{id = "GeneralAngerforge", title = "General Angerforge"},
			{id = "GolemLordArgelmach", title = "Golem Lord Argelmach"},
			{id = "Guzzler", title = "The Grim Guzzler"},
			{id = "Flamelash", title = "Ambassador Flamelash"},
			{id = "Panzor", title = function() return "Panzor the Invincible".." ("..L["Rare"]..")"; end},
			{id = "Tomb", title = "Summoner's Tomb"},
			{id = "Magmus", title = "Magmus"},
			{id = "Princess", title = "Princess Moira Bronzebeard"},
			{id = "EmperorDagranThaurissan", title = "Emperor Dagran Thaurissan"},
			{id = "Trash", title = "Trash Mobs"}
		}
	},
	
	["LBRS"] = {
		prefix = "LBRS",
		sequence = {
			{id = "SpirestoneButcher", title = function() return "Spirestone Butcher".." ("..L["Rare"]..")"; end},
			{id = "SpirestoneBattleLord", title = function() return "Spirestone Battle Lord".." ("..L["Rare"]..")"; end},
			{id = "SpirestoneLordMagus", title = function() return "Spirestone Lord Magus".." ("..L["Rare"]..")"; end},
			{id = "Omokk", title = "Highlord Omokk"},
			{id = "Vosh", title = "Shadow Hunter Vosh'gajin"},
			{id = "Voone", title = "War Master Voone"},
			{id = "Felguard", title = function() return "Burning Felguard".." ("..L["Rare"]..")"; end},
			{id = "Grayhoof", title = "Mor Grayhoof"},
			{id = "Grimaxe", title = function() return "Bannok Grimaxe".." ("..L["Rare"]..")"; end},
			{id = "Smolderweb", title = "Mother Smolderweb"},
			{id = "CrystalFang", title = function() return "Crystal Fang".." ("..L["Rare"]..")"; end}
		}
	}
}

-- Специальные страницы (не входящие в последовательности)
local SpecialPages = {
	["FirstAid1"] = {
		Title = function() return BS["First Aid"]; end,
		Back_Page = "CRAFTINGMENU",
		Back_Title = function() return L["Crafting"]; end
	},
	["Poisons1"] = {
		Title = function() return BS["Poisons"]; end,
		Back_Page = "CRAFTINGMENU",
		Back_Title = function() return L["Crafting"]; end
	},
	["Survival1"] = {
		Title = function() return BS["Survival"]; end,
		Back_Page = "SURVIVALMENU",
		Back_Title = function() return BS["Survival"]; end,
		Next_Page = "Survival2",
		Next_Title = function() return BS["Garderning"]; end
	},
	["Survival2"] = {
		Title = function() return BS["Garderning"]; end,
		Back_Page = "SURVIVALMENU",
		Back_Title = function() return BS["Survival"]; end,
		Prev_Page = "Survival1",
		Prev_Title = function() return BS["Survival"]; end
	}
}

-- Функция для получения заголовка (поддерживает функции и строки)
local function GetTitle(titleData)
	if type(titleData) == "function" then
		return titleData()
	else
		return titleData
	end
end

-- Функция для поиска страницы в группах
local function FindPageInGroups(pageId)
	for groupName, config in pairs(GroupConfigs) do
		local prefix = config.prefix
		local sequence = config.sequence
		
		-- Проверяем, начинается ли pageId с префикса группы
		if string.sub(pageId, 1, string.len(prefix)) == prefix then
			local suffix = string.sub(pageId, string.len(prefix) + 1)
			
			-- Ищем в последовательности
			for i = 1, getn(sequence) do
				if sequence[i].id == suffix then
					return groupName, i, sequence[i]
				end
			end
		end
	end
	return nil, nil, nil
end

-- Функция для создания страницы динамически
local function CreatePage(pageId)
	-- Проверяем кэш
	if PageCache[pageId] then
		return PageCache[pageId]
	end
	
	-- Проверяем специальные страницы
	if SpecialPages[pageId] then
		local page = {}
		local special = SpecialPages[pageId]
		
		for key, value in pairs(special) do
			if type(value) == "function" then
				page[key] = value()
			else
				page[key] = value
			end
		end
		
		PageCache[pageId] = page
		return page
	end
	
	-- Ищем в группах
	local groupName, position, pageData = FindPageInGroups(pageId)
	if not groupName then
		return nil
	end
	
	local config = GroupConfigs[groupName]
	local sequence = config.sequence
	local page = {}
	
	-- Устанавливаем заголовок
	page.Title = GetTitle(pageData.title)
	
	-- Добавляем навигацию Previous
	if position > 1 then
		local prevData = sequence[position - 1]
		page.Prev_Page = config.prefix .. prevData.id
		page.Prev_Title = GetTitle(prevData.title)
	end
	
	-- Добавляем навигацию Next
	if position < getn(sequence) then
		local nextData = sequence[position + 1]
		page.Next_Page = config.prefix .. nextData.id
		page.Next_Title = GetTitle(nextData.title)
	end
	
	-- Кэшируем результат
	PageCache[pageId] = page
	return page
end

-- Метатаблица для ленивой загрузки
local RegistryMetatable = {
	__index = function(table, key)
		return CreatePage(key)
	end,
	
	__newindex = function(table, key, value)
		-- Запрещаем прямое изменение
		DEFAULT_CHAT_FRAME:AddMessage("Прямое изменение ButtonRegistry запрещено. Используйте AtlasLoot_RegisterSpecialPage()")
	end
}

-- Создаем основную таблицу с метатаблицей
AtlasLoot_ButtonRegistry = {}
setmetatable(AtlasLoot_ButtonRegistry, RegistryMetatable)

-- Функция для регистрации специальной страницы
function AtlasLoot_RegisterSpecialPage(pageId, pageData)
	SpecialPages[pageId] = pageData
	-- Очищаем кэш для этой страницы
	PageCache[pageId] = nil
end

-- Функция для добавления новой группы
function AtlasLoot_RegisterGroup(groupName, config)
	GroupConfigs[groupName] = config
	-- Очищаем кэш для всех страниц этой группы
	for pageId, _ in pairs(PageCache) do
		if string.sub(pageId, 1, string.len(config.prefix)) == config.prefix then
			PageCache[pageId] = nil
		end
	end
end

-- Функция для очистки кэша
function AtlasLoot_ClearPageCache(pageId)
	if pageId then
		PageCache[pageId] = nil
	else
		-- Очищаем весь кэш
		PageCache = {}
	end
end

-- Функция для получения статистики кэша
function AtlasLoot_GetCacheStats()
	local count = 0
	for _ in pairs(PageCache) do
		count = count + 1
	end
	return count
end

-- Функция для предварительной загрузки группы
function AtlasLoot_PreloadGroup(groupName)
	local config = GroupConfigs[groupName]
	if not config then
		DEFAULT_CHAT_FRAME:AddMessage("Группа "..groupName.." не найдена")
		return
	end
	
	local loaded = 0
	for i = 1, getn(config.sequence) do
		local pageId = config.prefix .. config.sequence[i].id
		if not PageCache[pageId] then
			CreatePage(pageId)
			loaded = loaded + 1
		end
	end
	
	DEFAULT_CHAT_FRAME:AddMessage("Предварительно загружено "..loaded.." страниц для группы "..groupName)
end

-- Функция для получения всех доступных групп
function AtlasLoot_GetAvailableGroups()
	local groups = {}
	for groupName, _ in pairs(GroupConfigs) do
		tinsert(groups, groupName)
	end
	return groups
end

-- Функция для получения информации о группе
function AtlasLoot_GetGroupInfo(groupName)
	local config = GroupConfigs[groupName]
	if not config then
		return nil
	end
	
	return {
		prefix = config.prefix,
		pageCount = getn(config.sequence),
		firstPage = config.prefix .. config.sequence[1].id,
		lastPage = config.prefix .. config.sequence[getn(config.sequence)].id
	}
end

-- Функция для валидации конфигурации
function AtlasLoot_ValidateConfiguration()
	local errors = {}
	
	-- Проверяем группы
	for groupName, config in pairs(GroupConfigs) do
		if not config.prefix then
			tinsert(errors, "Группа "..groupName.." не имеет префикса")
		end
		
		if not config.sequence or getn(config.sequence) == 0 then
			tinsert(errors, "Группа "..groupName.." не имеет последовательности")
		else
			for i = 1, getn(config.sequence) do
				local item = config.sequence[i]
				if not item.id then
					tinsert(errors, "Элемент "..i.." в группе "..groupName.." не имеет id")
				end
				if not item.title then
					tinsert(errors, "Элемент "..i.." в группе "..groupName.." не имеет title")
				end
			end
		end
	end
	
	-- Проверяем специальные страницы
	for pageId, pageData in pairs(SpecialPages) do
		if not pageData.Title then
			tinsert(errors, "Специальная страница "..pageId.." не имеет Title")
		end
	end
	
	if getn(errors) > 0 then
		DEFAULT_CHAT_FRAME:AddMessage("Найдены ошибки конфигурации:")
		for i = 1, getn(errors) do
			DEFAULT_CHAT_FRAME:AddMessage(errors[i])
		end
		return false
	else
		DEFAULT_CHAT_FRAME:AddMessage("Конфигурация валидна")
		return true
	end
end

-- Функция для отладочного вывода информации о странице
function AtlasLoot_DebugPage(pageId)
	local page = AtlasLoot_ButtonRegistry[pageId]
	if not page then
		DEFAULT_CHAT_FRAME:AddMessage("Страница "..pageId.." не найдена")
		return
	end
	
	DEFAULT_CHAT_FRAME:AddMessage("=== Информация о странице "..pageId.." ===")
	DEFAULT_CHAT_FRAME:AddMessage("Title: "..(page.Title or "нет"))
	DEFAULT_CHAT_FRAME:AddMessage("Prev_Page: "..(page.Prev_Page or "нет"))
	DEFAULT_CHAT_FRAME:AddMessage("Prev_Title: "..(page.Prev_Title or "нет"))
	DEFAULT_CHAT_FRAME:AddMessage("Next_Page: "..(page.Next_Page or "нет"))
	DEFAULT_CHAT_FRAME:AddMessage("Next_Title: "..(page.Next_Title or "нет"))
	DEFAULT_CHAT_FRAME:AddMessage("Back_Page: "..(page.Back_Page or "нет"))
	DEFAULT_CHAT_FRAME:AddMessage("Back_Title: "..(page.Back_Title or "нет"))
end

-- Инициализация и валидация при загрузке
AtlasLoot_ValidateConfiguration()
DEFAULT_CHAT_FRAME:AddMessage("ButtonRegistry с метатаблицами инициализирован")

-- Примеры использования:
-- local page = AtlasLoot_ButtonRegistry["BRDLordRoccor"] -- Автоматически создается
-- AtlasLoot_RegisterSpecialPage("CustomPage", {Title = "Custom Title"})
-- AtlasLoot_PreloadGroup("BRD") -- Предварительная загрузка
-- AtlasLoot_DebugPage("HQCorrosis") -- Отладка
-- local stats = AtlasLoot_GetCacheStats() -- Статистика кэша