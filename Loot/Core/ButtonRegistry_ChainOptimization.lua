-- Альтернативная оптимизация ButtonRegistry через систему цепочек навигации
-- Совместимо с WoW 1.12

local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")
local BF = AceLibrary("Babble-Faction-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")
local BIS = AceLibrary("Babble-ItemSet-2.2a")

-- Система определения цепочек навигации
local NavigationChains = {
	-- Цепочка для Horde Quests
	["HQ_Chain"] = {
		"HQHighForemanBargulBlackhammer",
		"HQEngineerFiggles", 
		"HQCorrosis",
		"HQHatereaverAnnihilator",
		"HQHargeshDoomcaller",
		"HQTrash"
	},
	
	-- Цепочка для Blackrock Depths
	["BRD_Chain"] = {
		"BRDLordRoccor",
		"BRDHighInterrogatorGerstahn",
		"BRDAnubshiah",
		"BRDEviscerator",
		"BRDGorosh",
		"BRDGrizzle",
		"BRDHedrum",
		"BRDOkthor",
		"BRDTheldren",
		"BRDHoundmaster",
		"BRDPyromancerLoregrain",
		"BRDTheVault",
		"BRDWarderStilgiss",
		"BRDVerek",
		"BRDFineousDarkvire",
		"BRDLordIncendius",
		"BRDBaelGar",
		"BRDGeneralAngerforge",
		"BRDGolemLordArgelmach",
		"BRDGuzzler",
		"BRDFlamelash",
		"BRDPanzor",
		"BRDTomb",
		"BRDMagmus",
		"BRDPrincess",
		"BRDEmperorDagranThaurissan",
		"BRDTrash"
	},
	
	-- Цепочка для Lower Blackrock Spire
	["LBRS_Chain"] = {
		"LBRSSpirestoneButcher",
		"LBRSSpirestoneBattleLord",
		"LBRSSpirestoneLordMagus",
		"LBRSOmokk",
		"LBRSVosh",
		"LBRSVoone",
		"LBRSFelguard",
		"LBRSGrayhoof",
		"LBRSGrimaxe",
		"LBRSSmolderweb",
		"LBRSCrystalFang"
	},
	
	-- Цепочка для профессий (пример)
	["Survival_Chain"] = {
		"Survival1",
		"Survival2"
	}
}

-- Базовые данные страниц (только уникальная информация)
local PageData = {
	-- Horde Quests
	["HQHighForemanBargulBlackhammer"] = {
		Title = "High Foreman Bargul Blackhammer"
	},
	["HQEngineerFiggles"] = {
		Title = "Engineer Figgles"
	},
	["HQCorrosis"] = {
		Title = "Corrosis"
	},
	["HQHatereaverAnnihilator"] = {
		Title = "Hatereaver Annihilator"
	},
	["HQHargeshDoomcaller"] = {
		Title = "Hargesh Doomcaller"
	},
	["HQTrash"] = {
		Title = L["Trash Mobs"]
	},
	
	-- Blackrock Depths
	["BRDLordRoccor"] = {
		Title = "Lord Roccor"
	},
	["BRDHighInterrogatorGerstahn"] = {
		Title = "High Interrogator Gerstahn"
	},
	["BRDAnubshiah"] = {
		Title = "Anub'shiah"
	},
	["BRDEviscerator"] = {
		Title = "Eviscerator"
	},
	["BRDGorosh"] = {
		Title = "Gorosh the Dervish"
	},
	["BRDGrizzle"] = {
		Title = "Grizzle"
	},
	["BRDHedrum"] = {
		Title = "Hedrum the Creeper"
	},
	["BRDOkthor"] = {
		Title = "Ok'thor the Breaker"
	},
	["BRDTheldren"] = {
		Title = "Theldren"
	},
	["BRDHoundmaster"] = {
		Title = "Houndmaster Grebmar"
	},
	["BRDPyromancerLoregrain"] = {
		Title = "Pyromancer Loregrain".." ("..L["Rare"]..")"
	},
	["BRDTheVault"] = {
		Title = "The Vault"
	},
	["BRDWarderStilgiss"] = {
		Title = "Warder Stilgiss".." ("..L["Rare"]..")"
	},
	["BRDVerek"] = {
		Title = "Verek".." ("..L["Rare"]..")"
	},
	["BRDFineousDarkvire"] = {
		Title = "Fineous Darkvire"
	},
	["BRDLordIncendius"] = {
		Title = "Lord Incendius"
	},
	["BRDBaelGar"] = {
		Title = "Bael'Gar"
	},
	["BRDGeneralAngerforge"] = {
		Title = "General Angerforge"
	},
	["BRDGolemLordArgelmach"] = {
		Title = "Golem Lord Argelmach"
	},
	["BRDGuzzler"] = {
		Title = "The Grim Guzzler"
	},
	["BRDFlamelash"] = {
		Title = "Ambassador Flamelash"
	},
	["BRDPanzor"] = {
		Title = "Panzor the Invincible".." ("..L["Rare"]..")"
	},
	["BRDTomb"] = {
		Title = "Summoner's Tomb"
	},
	["BRDMagmus"] = {
		Title = "Magmus"
	},
	["BRDPrincess"] = {
		Title = "Princess Moira Bronzebeard"
	},
	["BRDEmperorDagranThaurissan"] = {
		Title = "Emperor Dagran Thaurissan"
	},
	["BRDTrash"] = {
		Title = "Trash Mobs"
	},
	
	-- Lower Blackrock Spire
	["LBRSSpirestoneButcher"] = {
		Title = "Spirestone Butcher".." ("..L["Rare"]..")"
	},
	["LBRSSpirestoneBattleLord"] = {
		Title = "Spirestone Battle Lord".." ("..L["Rare"]..")"
	},
	["LBRSSpirestoneLordMagus"] = {
		Title = "Spirestone Lord Magus".." ("..L["Rare"]..")"
	},
	["LBRSOmokk"] = {
		Title = "Highlord Omokk"
	},
	["LBRSVosh"] = {
		Title = "Shadow Hunter Vosh'gajin"
	},
	["LBRSVoone"] = {
		Title = "War Master Voone"
	},
	["LBRSFelguard"] = {
		Title = "Burning Felguard".." ("..L["Rare"]..")"
	},
	["LBRSGrayhoof"] = {
		Title = "Mor Grayhoof"
	},
	["LBRSGrimaxe"] = {
		Title = "Bannok Grimaxe".." ("..L["Rare"]..")"
	},
	["LBRSSmolderweb"] = {
		Title = "Mother Smolderweb"
	},
	["LBRSCrystalFang"] = {
		Title = "Crystal Fang".." ("..L["Rare"]..")"
	},
	
	-- Профессии
	["Survival1"] = {
		Title = BS["Survival"],
		Back_Page = "SURVIVALMENU",
		Back_Title = BS["Survival"]
	},
	["Survival2"] = {
		Title = BS["Garderning"],
		Back_Page = "SURVIVALMENU",
		Back_Title = BS["Survival"]
	},
	["FirstAid1"] = {
		Title = BS["First Aid"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = L["Crafting"]
	},
	["Poisons1"] = {
		Title = BS["Poisons"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = L["Crafting"]
	}
}

-- Функция для поиска позиции страницы в цепочке
local function FindPageInChain(pageId)
	for chainName, chain in pairs(NavigationChains) do
		for i = 1, getn(chain) do
			if chain[i] == pageId then
				return chainName, i
			end
		end
	end
	return nil, nil
end

-- Функция для автоматической генерации навигации
local function GenerateNavigation(pageId, baseData)
	local chainName, position = FindPageInChain(pageId)
	if not chainName or not position then
		return baseData
	end
	
	local chain = NavigationChains[chainName]
	local result = {}
	
	-- Копируем базовые данные
	for key, value in pairs(baseData) do
		result[key] = value
	end
	
	-- Добавляем Previous навигацию
	if position > 1 then
		local prevPageId = chain[position - 1]
		local prevData = PageData[prevPageId]
		if prevData then
			result.Prev_Page = prevPageId
			result.Prev_Title = prevData.Title
		end
	end
	
	-- Добавляем Next навигацию
	if position < getn(chain) then
		local nextPageId = chain[position + 1]
		local nextData = PageData[nextPageId]
		if nextData then
			result.Next_Page = nextPageId
			result.Next_Title = nextData.Title
		end
	end
	
	return result
end

-- Функция для получения данных страницы с автоматической навигацией
function AtlasLoot_GetPageData(pageId)
	local baseData = PageData[pageId]
	if not baseData then
		return nil
	end
	
	return GenerateNavigation(pageId, baseData)
end

-- Функция для добавления новой цепочки навигации
function AtlasLoot_AddNavigationChain(chainName, pageList)
	NavigationChains[chainName] = pageList
end

-- Функция для добавления страницы в существующую цепочку
function AtlasLoot_AddPageToChain(chainName, pageId, position)
	local chain = NavigationChains[chainName]
	if not chain then
		DEFAULT_CHAT_FRAME:AddMessage("Цепочка "..chainName.." не найдена")
		return
	end
	
	if position then
		-- Вставляем в определенную позицию
		tinsert(chain, position, pageId)
	else
		-- Добавляем в конец
		tinsert(chain, pageId)
	end
end

-- Функция для регистрации новой страницы
function AtlasLoot_RegisterPage(pageId, pageData)
	PageData[pageId] = pageData
end

-- Функция для получения всех страниц в цепочке
function AtlasLoot_GetChainPages(chainName)
	return NavigationChains[chainName]
end

-- Функция для валидации цепочек
function AtlasLoot_ValidateChains()
	local errors = {}
	
	for chainName, chain in pairs(NavigationChains) do
		for i = 1, getn(chain) do
			local pageId = chain[i]
			if not PageData[pageId] then
				tinsert(errors, "Страница "..pageId.." в цепочке "..chainName.." не найдена в PageData")
			end
		end
	end
	
	if getn(errors) > 0 then
		DEFAULT_CHAT_FRAME:AddMessage("Найдены ошибки в цепочках навигации:")
		for i = 1, getn(errors) do
			DEFAULT_CHAT_FRAME:AddMessage(errors[i])
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage("Все цепочки навигации валидны")
	end
end

-- Создаем совместимую таблицу для обратной совместимости
AtlasLoot_ButtonRegistry = {}

-- Функция инициализации для создания полной таблицы
function AtlasLoot_InitializeButtonRegistry()
	for pageId, baseData in pairs(PageData) do
		AtlasLoot_ButtonRegistry[pageId] = GenerateNavigation(pageId, baseData)
	end
	DEFAULT_CHAT_FRAME:AddMessage("ButtonRegistry инициализирован с "..getn(PageData).." страницами")
end

-- Автоматическая инициализация при загрузке
AtlasLoot_InitializeButtonRegistry()

-- Пример использования:
-- local pageData = AtlasLoot_GetPageData("BRDLordRoccor")
-- AtlasLoot_AddNavigationChain("NewChain", {"Page1", "Page2", "Page3"})
-- AtlasLoot_RegisterPage("NewPage", {Title = "New Page Title"})
-- AtlasLoot_ValidateChains()