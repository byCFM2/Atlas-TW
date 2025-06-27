-- Альтернативная оптимизация ButtonRegistry через фабрику страниц и шаблоны
-- Совместимо с WoW 1.12

local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

-- Шаблоны для различных типов страниц
local PageTemplates = {
	-- Шаблон для обычного босса в цепочке
	["boss_chain"] = {
		type = "boss_chain",
		fields = {"title"}
	},
	
	-- Шаблон для редкого босса в цепочке
	["rare_boss_chain"] = {
		type = "rare_boss_chain",
		fields = {"title"},
		title_modifier = function(title) return title.." ("..L["Rare"]..")"; end
	},
	
	-- Шаблон для страницы с возвратом
	["craft_page"] = {
		type = "craft_page",
		fields = {"title", "back_page", "back_title"}
	},
	
	-- Шаблон для связанных страниц (например, профессии)
	["linked_page"] = {
		type = "linked_page",
		fields = {"title", "back_page", "back_title", "linked_page", "linked_title"}
	}
}

-- Определения цепочек с использованием компактного формата
local ChainDefinitions = {
	-- Horde Quests - простая цепочка
	["HQ"] = {
		template = "boss_chain",
		prefix = "HQ",
		bosses = {
			"HighForemanBargulBlackhammer|High Foreman Bargul Blackhammer",
			"EngineerFiggles|Engineer Figgles",
			"Corrosis|Corrosis",
			"HatereaverAnnihilator|Hatereaver Annihilator",
			"HargeshDoomcaller|Hargesh Doomcaller",
			"Trash|@TRASH_MOBS" -- @ означает использование локализации
		}
	},
	
	-- Blackrock Depths - смешанная цепочка с редкими боссами
	["BRD"] = {
		template = "boss_chain",
		prefix = "BRD",
		bosses = {
			"LordRoccor|Lord Roccor",
			"HighInterrogatorGerstahn|High Interrogator Gerstahn",
			"Anubshiah|Anub'shiah",
			"Eviscerator|Eviscerator",
			"Gorosh|Gorosh the Dervish",
			"Grizzle|Grizzle",
			"Hedrum|Hedrum the Creeper",
			"Okthor|Ok'thor the Breaker",
			"Theldren|Theldren",
			"Houndmaster|Houndmaster Grebmar",
			"PyromancerLoregrain|Pyromancer Loregrain|rare", -- rare модификатор
			"TheVault|The Vault",
			"WarderStilgiss|Warder Stilgiss|rare",
			"Verek|Verek|rare",
			"FineousDarkvire|Fineous Darkvire",
			"LordIncendius|Lord Incendius",
			"BaelGar|Bael'Gar",
			"GeneralAngerforge|General Angerforge",
			"GolemLordArgelmach|Golem Lord Argelmach",
			"Guzzler|The Grim Guzzler",
			"Flamelash|Ambassador Flamelash",
			"Panzor|Panzor the Invincible|rare",
			"Tomb|Summoner's Tomb",
			"Magmus|Magmus",
			"Princess|Princess Moira Bronzebeard",
			"EmperorDagranThaurissan|Emperor Dagran Thaurissan",
			"Trash|Trash Mobs"
		}
	},
	
	-- Lower Blackrock Spire - цепочка с редкими боссами
	["LBRS"] = {
		template = "boss_chain",
		prefix = "LBRS",
		bosses = {
			"SpirestoneButcher|Spirestone Butcher|rare",
			"SpirestoneBattleLord|Spirestone Battle Lord|rare",
			"SpirestoneLordMagus|Spirestone Lord Magus|rare",
			"Omokk|Highlord Omokk",
			"Vosh|Shadow Hunter Vosh'gajin",
			"Voone|War Master Voone",
			"Felguard|Burning Felguard|rare",
			"Grayhoof|Mor Grayhoof",
			"Grimaxe|Bannok Grimaxe|rare",
			"Smolderweb|Mother Smolderweb",
			"CrystalFang|Crystal Fang|rare"
		}
	}
}

-- Определения отдельных страниц
local SinglePageDefinitions = {
	["FirstAid1"] = {
		template = "craft_page",
		title = "@FIRST_AID", -- Ссылка на BS["First Aid"]
		back_page = "CRAFTINGMENU",
		back_title = "@CRAFTING" -- Ссылка на L["Crafting"]
	},
	
	["Poisons1"] = {
		template = "craft_page",
		title = "@POISONS", -- Ссылка на BS["Poisons"]
		back_page = "CRAFTINGMENU",
		back_title = "@CRAFTING"
	},
	
	["Survival1"] = {
		template = "linked_page",
		title = "@SURVIVAL", -- Ссылка на BS["Survival"]
		back_page = "SURVIVALMENU",
		back_title = "@SURVIVAL",
		linked_page = "Survival2",
		linked_title = "@GARDERNING" -- Ссылка на BS["Garderning"]
	},
	
	["Survival2"] = {
		template = "linked_page",
		title = "@GARDERNING",
		back_page = "SURVIVALMENU",
		back_title = "@SURVIVAL",
		linked_page = "Survival1",
		linked_title = "@SURVIVAL"
	}
}

-- Словарь локализации для быстрого доступа
local LocalizationMap = {
	["@TRASH_MOBS"] = function() return L["Trash Mobs"]; end,
	["@CRAFTING"] = function() return L["Crafting"]; end,
	["@FIRST_AID"] = function() return BS["First Aid"]; end,
	["@POISONS"] = function() return BS["Poisons"]; end,
	["@SURVIVAL"] = function() return BS["Survival"]; end,
	["@GARDERNING"] = function() return BS["Garderning"]; end,
	["@RARE"] = function() return L["Rare"]; end
}

-- Функция для разрешения локализованных строк
local function ResolveLocalization(text)
	if type(text) == "string" and string.sub(text, 1, 1) == "@" then
		local resolver = LocalizationMap[text]
		if resolver then
			return resolver()
		else
			DEFAULT_CHAT_FRAME:AddMessage("Неизвестная локализация: "..text)
			return text
		end
	else
		return text
	end
end

-- Функция для парсинга строки босса
local function ParseBossString(bossStr)
	local parts = {}
	local current = ""
	local i = 1
	
	-- Простой парсер, разделяющий по |
	while i <= string.len(bossStr) do
		local char = string.sub(bossStr, i, i)
		if char == "|" then
			tinsert(parts, current)
			current = ""
		else
			current = current .. char
		end
		i = i + 1
	end
	
	if current ~= "" then
		tinsert(parts, current)
	end
	
	return {
		id = parts[1],
		title = parts[2],
		modifier = parts[3]
	}
end

-- Фабрика для создания страниц
local PageFactory = {
	-- Создание страницы цепочки боссов
	["boss_chain"] = function(pageId, chainData, position, bossData)
		local page = {}
		local title = ResolveLocalization(bossData.title)
		
		-- Применяем модификатор если есть
		if bossData.modifier == "rare" then
			title = title .. " (" .. ResolveLocalization("@RARE") .. ")"
		end
		
		page.Title = title
		
		-- Добавляем навигацию
		local bosses = chainData.bosses
		if position > 1 then
			local prevBoss = ParseBossString(bosses[position - 1])
			page.Prev_Page = chainData.prefix .. prevBoss.id
			local prevTitle = ResolveLocalization(prevBoss.title)
			if prevBoss.modifier == "rare" then
				prevTitle = prevTitle .. " (" .. ResolveLocalization("@RARE") .. ")"
			end
			page.Prev_Title = prevTitle
		end
		
		if position < getn(bosses) then
			local nextBoss = ParseBossString(bosses[position + 1])
			page.Next_Page = chainData.prefix .. nextBoss.id
			local nextTitle = ResolveLocalization(nextBoss.title)
			if nextBoss.modifier == "rare" then
				nextTitle = nextTitle .. " (" .. ResolveLocalization("@RARE") .. ")"
			end
			page.Next_Title = nextTitle
		end
		
		return page
	end,
	
	-- Создание страницы крафта
	["craft_page"] = function(pageId, pageData)
		return {
			Title = ResolveLocalization(pageData.title),
			Back_Page = pageData.back_page,
			Back_Title = ResolveLocalization(pageData.back_title)
		}
	end,
	
	-- Создание связанной страницы
	["linked_page"] = function(pageId, pageData)
		return {
			Title = ResolveLocalization(pageData.title),
			Back_Page = pageData.back_page,
			Back_Title = ResolveLocalization(pageData.back_title),
			Next_Page = pageData.linked_page,
			Next_Title = ResolveLocalization(pageData.linked_title),
			Prev_Page = pageData.linked_page,
			Prev_Title = ResolveLocalization(pageData.linked_title)
		}
	end
}

-- Кэш созданных страниц
local PageCache = {}

-- Функция для поиска страницы в цепочках
local function FindPageInChains(pageId)
	for chainName, chainData in pairs(ChainDefinitions) do
		local prefix = chainData.prefix
		if string.sub(pageId, 1, string.len(prefix)) == prefix then
			local suffix = string.sub(pageId, string.len(prefix) + 1)
			
			for i = 1, getn(chainData.bosses) do
				local bossData = ParseBossString(chainData.bosses[i])
				if bossData.id == suffix then
					return chainName, chainData, i, bossData
				end
			end
		end
	end
	return nil, nil, nil, nil
end

-- Основная функция создания страницы
local function CreatePage(pageId)
	-- Проверяем кэш
	if PageCache[pageId] then
		return PageCache[pageId]
	end
	
	-- Проверяем отдельные страницы
	local singlePageData = SinglePageDefinitions[pageId]
	if singlePageData then
		local factory = PageFactory[singlePageData.template]
		if factory then
			local page = factory(pageId, singlePageData)
			PageCache[pageId] = page
			return page
		end
	end
	
	-- Проверяем цепочки
	local chainName, chainData, position, bossData = FindPageInChains(pageId)
	if chainName then
		local factory = PageFactory[chainData.template]
		if factory then
			local page = factory(pageId, chainData, position, bossData)
			PageCache[pageId] = page
			return page
		end
	end
	
	return nil
end

-- Метатаблица для ленивой загрузки
local RegistryMetatable = {
	__index = function(table, key)
		return CreatePage(key)
	end
}

-- Создаем основную таблицу
AtlasLoot_ButtonRegistry = {}
setmetatable(AtlasLoot_ButtonRegistry, RegistryMetatable)

-- Функция для регистрации новой цепочки
function AtlasLoot_RegisterChain(chainName, chainData)
	ChainDefinitions[chainName] = chainData
	-- Очищаем кэш для страниц этой цепочки
	local prefix = chainData.prefix
	for pageId, _ in pairs(PageCache) do
		if string.sub(pageId, 1, string.len(prefix)) == prefix then
			PageCache[pageId] = nil
		end
	end
end

-- Функция для регистрации отдельной страницы
function AtlasLoot_RegisterSinglePage(pageId, pageData)
	SinglePageDefinitions[pageId] = pageData
	PageCache[pageId] = nil
end

-- Функция для регистрации нового шаблона
function AtlasLoot_RegisterTemplate(templateName, templateData)
	PageTemplates[templateName] = templateData
end

-- Функция для регистрации фабрики
function AtlasLoot_RegisterFactory(templateName, factoryFunction)
	PageFactory[templateName] = factoryFunction
end

-- Функция для добавления локализации
function AtlasLoot_RegisterLocalization(key, resolver)
	LocalizationMap[key] = resolver
end

-- Функция для получения статистики
function AtlasLoot_GetFactoryStats()
	local chainCount = 0
	local totalBosses = 0
	local singlePageCount = 0
	local cacheCount = 0
	
	for _, chainData in pairs(ChainDefinitions) do
		chainCount = chainCount + 1
		totalBosses = totalBosses + getn(chainData.bosses)
	end
	
	for _ in pairs(SinglePageDefinitions) do
		singlePageCount = singlePageCount + 1
	end
	
	for _ in pairs(PageCache) do
		cacheCount = cacheCount + 1
	end
	
	return {
		chains = chainCount,
		bosses = totalBosses,
		singlePages = singlePageCount,
		cachedPages = cacheCount,
		totalDefinitions = totalBosses + singlePageCount
	}
end

-- Функция для предварительной загрузки всех страниц
function AtlasLoot_PreloadAllPages()
	local loaded = 0
	
	-- Загружаем цепочки
	for chainName, chainData in pairs(ChainDefinitions) do
		for i = 1, getn(chainData.bosses) do
			local bossData = ParseBossString(chainData.bosses[i])
			local pageId = chainData.prefix .. bossData.id
			if not PageCache[pageId] then
				CreatePage(pageId)
				loaded = loaded + 1
			end
		end
	end
	
	-- Загружаем отдельные страницы
	for pageId, _ in pairs(SinglePageDefinitions) do
		if not PageCache[pageId] then
			CreatePage(pageId)
			loaded = loaded + 1
		end
	end
	
	DEFAULT_CHAT_FRAME:AddMessage("Предварительно загружено "..loaded.." страниц")
end

-- Функция для валидации всех определений
function AtlasLoot_ValidateDefinitions()
	local errors = {}
	
	-- Проверяем цепочки
	for chainName, chainData in pairs(ChainDefinitions) do
		if not chainData.template then
			tinsert(errors, "Цепочка "..chainName.." не имеет шаблона")
		elseif not PageFactory[chainData.template] then
			tinsert(errors, "Шаблон "..chainData.template.." для цепочки "..chainName.." не найден")
		end
		
		if not chainData.prefix then
			tinsert(errors, "Цепочка "..chainName.." не имеет префикса")
		end
		
		if not chainData.bosses or getn(chainData.bosses) == 0 then
			tinsert(errors, "Цепочка "..chainName.." не имеет боссов")
		end
	end
	
	-- Проверяем отдельные страницы
	for pageId, pageData in pairs(SinglePageDefinitions) do
		if not pageData.template then
			tinsert(errors, "Страница "..pageId.." не имеет шаблона")
		elseif not PageFactory[pageData.template] then
			tinsert(errors, "Шаблон "..pageData.template.." для страницы "..pageId.." не найден")
		end
	end
	
	if getn(errors) > 0 then
		DEFAULT_CHAT_FRAME:AddMessage("Найдены ошибки определений:")
		for i = 1, getn(errors) do
			DEFAULT_CHAT_FRAME:AddMessage(errors[i])
		end
		return false
	else
		DEFAULT_CHAT_FRAME:AddMessage("Все определения валидны")
		return true
	end
end

-- Инициализация
AtlasLoot_ValidateDefinitions()
local stats = AtlasLoot_GetFactoryStats()
DEFAULT_CHAT_FRAME:AddMessage("ButtonRegistry Factory инициализирован: "..stats.chains.." цепочек, "..stats.bosses.." боссов, "..stats.singlePages.." отдельных страниц")

-- Примеры использования:
-- local page = AtlasLoot_ButtonRegistry["BRDLordRoccor"]
-- AtlasLoot_RegisterChain("NewChain", {template = "boss_chain", prefix = "NC", bosses = {"Boss1|Boss Title"}})
-- AtlasLoot_RegisterSinglePage("CustomPage", {template = "craft_page", title = "Custom", back_page = "MENU", back_title = "Menu"})
-- AtlasLoot_PreloadAllPages()
-- local stats = AtlasLoot_GetFactoryStats()