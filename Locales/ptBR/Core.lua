---
--- Core.lua - UI Localization (Portuguese)
---
--- Core UI strings, bindings, and general interface text
---
--- @compatible World of Warcraft 1.12
---

if GetLocale() ~= "ptBR" then return end

-- Zone name substitutions (for display purposes)
AtlasTWSortIgnore = { "the (.+)", "o (.+)", "a (.+)", "os (.+)", "as (.+)" }

AtlasTWZoneSubstitutions = {
    ["O Templo de Atal'Hakkar"] = "Templo Submerso"
}

---
--- Key binding definitions for Atlas-TW addon
---
BINDING_HEADER_ATLASTW_TITLE = "Atalhos do Atlas-TW"
BINDING_NAME_ATLASTW_TOGGLE = "Alternar Atlas-TW"
BINDING_NAME_ATLASTW_OPTIONS = "Alternar Opções"
BINDING_HEADER_ATLASTWLOOT_TITLE = "Atalhos do AtlasTW Saques"
BINDING_NAME_ATLASTWLOOT_QL1 = "Visualização Rápida 1"
BINDING_NAME_ATLASTWLOOT_QL2 = "Visualização Rápida 2"
BINDING_NAME_ATLASTWLOOT_QL3 = "Visualização Rápida 3"
BINDING_NAME_ATLASTWLOOT_QL4 = "Visualização Rápida 4"
BINDING_NAME_ATLASTWLOOT_QL5 = "Visualização Rápida 5"
BINDING_NAME_ATLASTWLOOT_QL6 = "Visualização Rápida 6"
BINDING_NAME_ATLASTWLOOT_WISHLIST = "Lista de Desejos"

AtlasTW = AtlasTW or {}

--Default map to auto-select to when no SubZone data is available
AtlasTW.AssocDefaults = {
    ["Gládio Cruel"] = "DireMaulNorth",
    ["Pico da Rocha Negra"] = "BlackrockSpireLower",
    ["Monastério Escarlate"] = "ScarletMonasteryEnt"
}
--Links maps together that are part of the same instance
AtlasTW.SubZoneAssoc = {
    ["DireMaulNorth"] = "Gládio Cruel",
    ["DireMaulEast"] = "Gládio Cruel",
    ["DireMaulWest"] = "Gládio Cruel",
    ["DireMaulEnt"] = "Gládio Cruel",
    ["BlackrockSpireLower"] = "Pico da Rocha Negra",
    ["BlackrockSpireUpper"] = "Pico da Rocha Negra",
    ["BlackrockMountainEnt"] = "Pico da Rocha Negra",
    ["ScarletMonasteryGraveyard"] = "Monastério Escarlate",
    ["ScarletMonasteryLibrary"] = "Monastério Escarlate",
    ["ScarletMonasteryArmory"] = "Monastério Escarlate",
    ["ScarletMonasteryCathedral"] = "Monastério Escarlate",
    ["ScarletMonasteryEnt"] = "Monastério Escarlate"
}
--Links SubZone values with specific instance maps
AtlasTW.SubZoneData = {
    ["Salões da Destruição"] = "DireMaulNorth",
    ["Assento de Gordok"] = "DireMaulNorth",
    ["Distrito Lenhatorta"] = "DireMaulEast",
    ["A Passagem Oculta"] = "DireMaulEast",
    ["O Conservatório"] = "DireMaulEast",
    ["O Santuário de Eldretharr"] = "DireMaulEast",
    ["Jardins Capitais"] = "DireMaulWest",
    ["Corte dos Altaneiros"] = "DireMaulWest",
    ["Prisão de Immol'thar"] = "DireMaulWest",
    ["O Ateneu"] = "DireMaulWest",
    ["Mok'Doom"] = "BlackrockSpireLower",
    ["Tazz'Alaor"] = "BlackrockSpireLower",
    ["Túneis Skitterweb"] = "BlackrockSpireLower",
    ["O Armazém"] = "BlackrockSpireLower",
    ["Câmara de Batalha"] = "BlackrockSpireLower",
    ["Salão do Pináculo Dracônico"] = "BlackrockSpireUpper",
    ["Salão da Vinculação"] = "BlackrockSpireUpper",
    ["O Viveiro"] = "BlackrockSpireUpper",
    ["Salão da Mão Negra"] = "BlackrockSpireUpper",
    ["Estádio Rocha Negra"] = "BlackrockSpireUpper",
    ["A Fornalha"] = "BlackrockSpireUpper",
    ["Cidade Hordemar"] = "BlackrockSpireUpper",
    ["Trono do Pináculo"] = "BlackrockSpireUpper",
    ["Câmara da Redenção"] = "ScarletMonasteryGraveyard",
    ["Claustro Abandonado"] = "ScarletMonasteryGraveyard",
    ["Tumba de Honra"] = "ScarletMonasteryGraveyard",
    ["Claustro do Caçador"] = "ScarletMonasteryLibrary",
    ["Galeria dos Tesouros"] = "ScarletMonasteryLibrary",
    ["Ateneu"] = "ScarletMonasteryLibrary",
    ["Campos de Treinamento"] = "ScarletMonasteryArmory",
    ["Arsenal do Lacaio"] = "ScarletMonasteryArmory",
    ["Arsenal do Cruzado"] = "ScarletMonasteryArmory",
    ["Salão dos Campeões"] = "ScarletMonasteryArmory",
    ["Jardins da Capela"] = "ScarletMonasteryCathedral",
    ["Capela do Cruzado"] = "ScarletMonasteryCathedral",
    ["O Grande Vestíbulo"] = "ScarletMonasteryEnt"
}
--Maps to auto-select to from outdoor zones.
AtlasTW.OutdoorZoneToAtlas = {
    ["Vale Gris"] = "BlackfathomDeepsEnt",
    ["Ermos"] = "UldamanEnt",
    ["Montanha Rocha Negra"] = "BlackrockMountainEnt",
    ["Estepes Ardentes"] = "HateforgeQuarry",       -- TurtleWOW
    ["Trilha do Vento Morto"] = "KarazhanCrypt",    -- TurtleWOW
    ["Desolação"] = "MaraudonEnt",
    ["Dun Morogh"] = "GnomereganEnt",
    ["Feralas"] = "DireMaulEnt",
    ["Garganta Abrasadora"] = "BlackrockMountainEnt",
    ["Pântano das Mágoas"] = "TheSunkenTempleEnt",
    ["Tanaris"] = "ZulFarrak",
    ["Sertões"] = "WailingCavernsEnt",
    ["Gilneas"] = "GilneasCity",     -- TurtleWOW
    ["Clareiras de Tirisfal"] = "ScarletMonasteryEnt",
    ["Cerro Oeste"] = "TheDeadminesEnt",
    ["Orgrimmar"] = "RagefireChasm",
    ["Pântano Vadeoso"] = "OnyxiasLair",
    ["Silithus"] = "TheTempleofAhnQiraj",
    ["Terras Pestilentas Ocidentais"] = "Scholomance",
    ["Floresta de Pinhaprata"] = "ShadowfangKeep",
    ["Terras Pestilentas Orientais"] = "Stratholme",
    ["Ventobravo"] = "TheStockade",
    ["Selva do Espinhaço"] = "ZulGurub",
    ["Balor"] = "StormwroughtRuins",                     -- TurtleWOW
    ["Pantanal"] = "DragonmawRetreat"                    -- TurtleWOW
}

---
--- Register Core UI translations
---
AtlasTW.Localization:RegisterNamespace("UI", "ptBR", {
    --************************************************
    -- Common UI Strings
    --************************************************
    ["Options"] = "Opções",
    ["Search"] = "Buscar",
    ["Clear"] = "Limpar",
    ["Done"] = "Concluído",
    ["Yes"] = "Sim",
    ["No"] = "Não",
    ["All"] = "Todos",
    ["Type"] = "Tipo",
    ["Level"] = "Nível",
    ["Player Limit"] = "Limite de Jogadores",
    ["Damage"] = "Dano",
    ["Location"] = "Localização",
    ["Continent"] = "Continente",
    ["Instance"] = "Instância",
    ["Quest"] = "Missão",
    ["Quests"] = "Missões",
    ["Loot"] = "Saque",
    ["Previous"] = "Anterior",
    ["Next"] = "Próximo",
    ["Group by Source"] = "Agrupar por fonte",
    ["Default"] = "Padrão",
    ["Check Completed Quests"] = "Verificar missões concluídas",
    ["Lockpicking"] = "Arrombamento",
    ["Doors"] = "Portas",


    --************************************************
    -- Colors
    --************************************************
    ["Purple"] = "Roxo",
    ["Red"] = "Vermelho",
    ["Orange"] = "Laranja",
    ["White"] = "Branco",

    --************************************************
    -- Mob Types
    --************************************************
    ["Boss"] = "Chefe",
    ["Rare"] = "Raro",
    ["Mini Bosses"] = "Mini Chefes",
    ["Trash Mobs"] = "Inimigos comuns",
    ["Bat"] = "Morcego",
    ["Snake"] = "Cobra",
    ["Raptor"] = "Raptor",
    ["Spider"] = "Aranha",
    ["Tiger"] = "Tigre",
    ["Panther"] = "Pantera",
    ["Pet"] = "Mascote",
    ["Rare Mobs"] = "Inimigos Raros",

    --************************************************
    -- Damage Types
    --************************************************
    ["Fire"] = "Fogo",
    ["Nature"] = "Natureza",
    ["Frost"] = "Gélido",
    ["Shadow"] = "Sombra",
    ["Arcane"] = "Arcano",
    ["Physical"] = "Físico",

    --************************************************
    -- Directions
    --************************************************
    ["East"] = "Leste",
    ["North"] = "Norte",
    ["South"] = "Sul",
    ["West"] = "Oeste",
    ["Lower"] = "Inferior",
    ["Upper"] = "Superior",
    ["Front"] = "Frente",
    ["Side"] = "Lado",
    ["Outside"] = "Fora",
    ["Back"] = "Voltar",

    --************************************************
    -- Instance Types
    --************************************************
    ["Dungeons"] = "Masmorras",
    ["Raids"] = "Incursões",
    ["RAID"] = "Incursão",
    ["Battlegrounds"] = "Campos de Batalha",
    ["Entrances"] = "Entradas",
    ["Transport Routes"] = "Rotas de Transporte",

    --************************************************
    -- Level Ranges
    --************************************************
    ["Instances level 15-29"] = "Instâncias nível 15-29",
    ["Instances level 30-39"] = "Instâncias nível 30-39",
    ["Instances level 40-49"] = "Instâncias nível 40-49",
    ["Instances level 50-59"] = "Instâncias nível 50-59",
    ["Instances 60 level"] = "Instâncias nível 60",

    --************************************************
    -- Party Size
    --************************************************
    ["Party Size"] = "Tamanho do Grupo",
    ["Instances for 5 Players"] = "Instâncias para 5 jogadores",
    ["Instances for 10 Players"] = "Instâncias para 10 jogadores",
    ["Instances for 20 Players"] = "Instâncias para 20 jogadores",
    ["Instances for 40 Players"] = "Instâncias para 40 jogadores",

    --************************************************
    -- Continents
    --************************************************
    ["Kalimdor Instances"] = "Instâncias em Kalimdor",
    ["Eastern Kingdoms Instances"] = "Instâncias nos Reinos do Leste",

    --************************************************
    -- Settings
    --************************************************
    ["Select Category"] = "Selecionar Categoria",
    ["Select Map"] = "Selecionar Mapa",
    ["Select Loot Table"] = "Tabela de Saque",
    ["Show the Quest Panel with AtlasTW"] = "Mostrar o Painel de Missões com AtlasTW",
    ["Show Quest Panel on the Left"] = "Mostrar Painel de Missões à Esquerda",
    ["Show Quest Panel on the Right"] = "Mostrar Painel de Missões à Direita",
    ["Color Quests by Level"] = "Colorir Missões por Nível",
    ["Color Quests from the Questlog"] = "Colorir Missões do Registro",
    ["Auto-Query Unknown Items"] = "Consultar Itens Desconhecidos auto",
    ["Show Loot Panel with AtlasTW"] = "Mostrar Painel de Saques com AtlasTW",
    ["Sort Instance by:"] = "Ordenar instância por:",
    ["Show Button on Minimap"] = "Mostrar botão no minimapa",
    ["Auto-Select Instance Map"] = "Selecionar mapa de instância auto",
    ["Transparency"] = "Transparência",
    ["Right-Click for World Map"] = "Clique direito para Mapa-múndi",
    ["Show Acronyms"] = "Mostrar acrônimos",
    ["Clamp window to screen"] = "Fixar janela à tela",
    ["Show Cursor Coordinates on Map"] = "Mostrar coordenadas do cursor no mapa",
    ["Enable pfUI Styling"] = "Ativar o estilo pfUI",
    ["pfUI styling enabled. Type /reload to apply changes."] =
    "Estilo pfUI ativado. Digite /reload para aplicar as alterações.",
    ["pfUI styling disabled. Type /reload to apply changes."] =
    "Estilo pfUI desativado. Digite /reload para aplicar as alterações.",
    ["Scale"] = "Escala",

    --************************************************
    -- Quest Related
    --************************************************
    ["Quest finished:"] = "Missão concluída:",
    ["No Quests"] = "Sem missões",
    ["No Rewards"] = "Sem recompensas",
    ["Quest Item"] = "Item de Missão",
    ["Quest Reward"] = "Recompensa de Missão",
    ["This Item Begins a Quest"] = "Este item inicia uma missão",
    ["Attain: "] = "Obter: ",
    ["Level: "] = "Nível: ",
    ["Requires"] = "Requer",
    ["Tools: "] = "Ferramentas: ",
    ["Reagents: "] = "Reagentes: ",
    ["Starts at: \n"] = "Começa em: \n",
    ["Objective: \n"] = "Objetivo: \n",
    ["Note: \n"] = "Nota: \n",
    ["Prequest: "] = "Pré-requisito: ",
    ["Quest follows: "] = "Missão seguinte: ",
    ["Story"] = "História",
    ["Need quest"] = "Precisa da missão",

    --************************************************
    -- Search & Results
    --************************************************
    ["Search Unavailable"] = "Pesquisa indisponível",
    ["Not Available"] = "Indisponível",
    ["Search Result: %s"] = "Resultado da Pesquisa: %s",
    ["Search Result"] = "Resultado da Pesquisa",
    ["Last Result"] = "Último Resul.",
    ["Search options"] = "Opções de Pesquisa",
    ["Partial matching"] = "Correspondência parcial",
    ["If checked, AtlasTWLoot searches item names for a partial match."] =
    "Se marcado, AtlasTWLoot pesquisa nomes de itens por correspondência parcial.",
    ["Predict search"] = "Pesquisa preditiva",
    ["If checked, AtlasTWLoot predicts search results."] =
    "Se marcado, AtlasTWLoot mostra sugestões enquanto você digita.",
    ["No match found for"] = "Nenhuma correspondência encontrada para",

    --************************************************
    -- Items & Loot
    --************************************************
    ["This item is not safe!"] = "Este item não é seguro!",
    ["Item not found in cache"] = "Item não encontrado no cache",
    ["The content patch isn't out yet"] = "O patch de conteúdo ainda não foi lançado",
    ["Old version of SuperWoW detected..."] = "Versão antiga de SuperWoW detectada...",
    ["Slot Bag"] = "Bolsa de Espaços",
    ["Various Locations"] = "Várias localidades",
    ["Vendor"] = "Vendedor",
    ["Pickpocketed"] = "Furtado",
    ["Random stats"] = "Atributos aleatórios",
    ["<Random enchantment>"] = "<Encantamento aleatório>",
    ["Shared"] = "Compartilhado",
    ["Unique"] = "Único",
    ["Charges"] = "Cargas",

    --************************************************
    -- AtlasTW Loot
    --************************************************
    ["Loot Panel"] = "Saques",
    ["Filter: No Filter"] = "Filtro: Sem filtro",
    ["Filter: My Class"] = "Filtro: Minha classe",
    ["Filter: Available"] = "Filtro: Disponível",
    ["WishList"] = "Desejos",
    ["ALT+Click to clear"] = "ALT+Clique para limpar",
    ["QuickLook"] = "Prévia",
    ["Add to QuickLooks"] = "Adicionar às Prévias",
    ["Assign this loot table to QuickLook"] = "Atribuir esta tabela de saque à Prévia",
    ["ALT+Click on item to add or remove it from WishList"] =
    "ALT+Clique no item para adicioná-lo ou removê-lo da Lista de Desejos",
    [" added to the WishList."] = " adicionado à Lista de Desejos.",
    [" already in the WishList!"] = " já está na Lista de Desejos!",
    [" deleted from the WishList."] = " removido da Lista de Desejos.",
    [" not found in the WishList."] = " não encontrado na Lista de Desejos.",

    --************************************************
    -- Settings & Configuration
    --************************************************
    ["Button Position"] = "Posição do botão",
    ["Button Radius"] = "Raio do botão",
    ["Reset Position"] = "Resetar posição",
    ["has been reset!"] = "foi redefinido!",
    ["Reset Settings"] = "Resetar Configurações",
    ["Default settings applied!"] = "Configurações padrão aplicadas!",
    ["Safe Chat Links |cff1eff00(recommended)|r"] = "Links de Chat Seguros |cff1eff00(recomendado)|r",
    ["Enable all Chat Links"] = "Ativar todos os Links de Chat",
    ["Use EquipCompare"] = "Usar EquipCompare",
    ["Make Loot Table Opaque"] = "Tornar a Tabela de Saque opaca",
    ["Show IDs in Tooltips"] = "Mostrar IDs nas dicas",
    ["Show Icon in Tooltips"] = "Mostrar ícone nas dicas",
    ["Show Source on Tooltips"] = "Mostrar origem nas dicas",
    ["Welcome to Atlas-TW Edition. Please take a moment to set your preferences."] =
    "Bem-vindo ao Atlas-TW Edition. Por favor, tome um momento para configurar suas preferências.",

    --************************************************
    -- Version & Updates
    --************************************************
    ["Update available"] = "Atualização disponível",
    ["Version: %s"] = "Versão: %s",
    ["Version check sent to %s"] = "Verificação de versão enviada para %s",
    ["NewVersionAvailableFmt"] = "|cffff0000Nova versão disponível!|r |cff00ff00Baixe aqui:|r %s",
    [" |cffA52A2Aloaded."] = " |cffA52A2Acarregado.",
    ["NoticeText"] = "Encontrou algo faltando? Relate em:|r",

    --************************************************
    -- Categories & Menus
    --************************************************
    ["Collections"] = "Coleções",
    ["Factions"] = "Facções",
    ["World Events"] = "Eventos",
    ["Crafting"] = "Criação",
    ["Sets"] = "Conjuntos",
    ["Misc"] = "Diversos",
    ["Dungeons & Raids"] = "Masm. e Raides",
    ["Weapon Skills"] = "Habilidades de Armas",
    ["Trainers"] = "Treinadores",

    --************************************************
    -- Minimap Tooltip
    --************************************************
    ["Left-click to open Atlas-TW.\nMiddle-click for Atlas-TW options.\nRight-click and drag to move this button."] =
    "Clique esquerdo para abrir Atlas-TW.\nClique do meio para opções do Atlas-TW.\nClique direito e arraste para mover este botão.",

    --************************************************
    -- Instance Locations
    --************************************************
    ["Instances"] = "Instâncias",

    --************************************************
    -- Common Terms
    --************************************************
    ["Entrance"] = "Entrada",
    ["Exit"] = "Saída",
    ["Portal"] = "Portal",
    ["Teleport"] = "Teleporte",
    ["Key"] = "Chave",
    ["Ghost"] = "Fantasma",
    ["Meeting Stone"] = "Pedra de Encontro",
    ["Summon"] = "Evocar",
    ["Random"] = "Aleatório",
    ["Optional"] = "Opcional",
    ["Reputation"] = "Reputação",
    ["Rescued"] = "Resgatado",
    ["Unknown"] = "Desconhecido",
    ["Varies"] = "Varia",
    ["Wanders"] = "Vagueia",
    ["Connection"] = "Conexão",
    ["Connections"] = "Conexões",
    ["Elevator"] = "Elevador",
    ["Attunement Required"] = "Sintonização necessária",
    ["Chase Begins"] = "Início da perseguição",
    ["Chase Ends"] = "Fim da perseguição",
    ["Open Portal"] = "Abrir Portal",
    ["Moonwell"] = "Poço Lunar",
    ["through "] = "através de ",
    ["Severs"] = "Corta",

    --************************************************
    -- Crafting & Item Info
    --************************************************
    ["To cast "] = "Para conjurar ",
    [" the following items are needed:"] = " são necessários os seguintes itens:",
    [" you need this: "] = " você precisa disto: ",
    ["To craft "] = "Para fabricar ",
    [" the following reagents are needed:"] = " são necessários os seguintes reagentes:",
    ["Setup"] = "Armação",
    ["Drop Rate:"] = "Taxa de queda:",
    ["ItemID:"] = "ID do Item:",
    ["SpellID:"] = "ID da Magia:",
    ["Gemology Plans"] = "Planos de Gemologia",
    ["Goldsmithing Plans"] = "Planos de Ourivesaria",
    ["Skill:"] = "Habilidade:",

    --************************************************
    -- Class Sets Categories
    --************************************************
    ["Priest Sets"] = "Conjuntos de Sacerdote",
    ["Mage Sets"] = "Conjuntos de Mago",
    ["Warlock Sets"] = "Conjuntos de Bruxo",
    ["Rogue Sets"] = "Conjuntos de Ladino",
    ["Druid Sets"] = "Conjuntos de Druida",
    ["Hunter Sets"] = "Conjuntos de Caçador",
    ["Shaman Sets"] = "Conjuntos de Xamã",
    ["Paladin Sets"] = "Conjuntos de Paladino",
    ["Warrior Sets"] = "Conjuntos de Guerreiro",

    --************************************************
    -- Item Types & Categories
    --************************************************
    ["Mount"] = "Montaria",
    ["a mount"] = "uma montaria",
    ["Glyph"] = "Glifo",
    ["Enchant"] = "Encantamento",
    ["Trade Goods"] = "Mercadorias",
    ["Book"] = "Livro",
    ["Cloak"] = "Capa",
    ["Weapon"] = "Arma",
    ["Weapons"] = "Armas",
    ["Classes"] = "Classes",
    ["Right Half"] = "Metade direita",
    ["Left Half"] = "Metade esquerda",
    ["Prizes"] = "Prêmios",
    ["Decks"] = "Baralhos",
    ["Container"] = "Recipiente",
    ["Consumable"] = "Consumível",
    ["World"] = "Mundo",
    ["Used to summon boss"] = "Usado para evocar chefe",
    ["Doll"] = "Boneca",
    ["Earth"] = "Terra",
    ["Air"] = "Ar",
    ["Master Angler"] = "Mestre Pescador",
    ["First Prize"] = "Primeiro Prêmio",
    ["Rare Fish Rewards"] = "Recompensas de Peixes Raros",
    ["Rare Fish"] = "Peixes Raros",
    ["a companion"] = "um companheiro",
    ["Cache"] = "Cache",

    ["Zul'Gurub Rings"] = "Anéis de Zul'Gurub",
    ["Pre 60 Sets"] = "Conjuntos pré-60",
    ["Crafted Sets"] = "Conjuntos Fabricados",
    ["Crafted Epic Weapons"] = "Armas Épicas Fabricadas",
    ["Tier 0.5"] = "Tier 0.5",
    ["Tier 0.5 Summonable"] = "Evocável de Tier 0.5",
    ["PvP Rewards"] = "Recomp. JxJ",
    ["PvP Armor Sets"] = "Conjuntos de Armadura JxJ",
    ["PvP Weapons"] = "Armas JxJ",
    ["PvP Accessories"] = "Acessórios JxJ",
    ["Collector's Edition"] = "Edição de Colecionador",
    ["Epic Set"] = "Conjunto Épico",
    ["Rare Set"] = "Conjunto Raro",
    ["Legendary Items"] = "Itens Lendários",
    ["Artifact Items"] = "Itens Artefato",
    ["Fire Resistance Gear"] = "Equipamento de Resistência ao Fogo",
    ["Arcane Resistance Gear"] = "Equipamento de Resistência ao Arcano",
    ["Nature Resistance Gear"] = "Equipamento de Resistência à Natureza",
    ["Rare Pets"] = "Mascotes Raros",
    ["Rare Mounts"] = "Montarias Raras",
    ["Old Mounts"] = "Montarias Antigas",
    ["PvP Mounts"] = "Montarias JxJ",
    ["Tabards"] = "Tabardos",
    ["World Epics"] = "Épicos Mundiais",
    ["World Enchants"] = "Encantamentos Mundiais",
    ["World Blues"] = "Raros Mundiais",
    ["Keys"] = "Chaves",

    ["Level One Lunatic Challenge"] = "Desafio de Lunático Nível 1", --************************************************
    -- Events & Holidays
    --************************************************
    ["Children's Week"] = "Semana das Crianças",
    ["Elemental Invasion"] = "Invasão Elemental",
    ["Feast of Winter Veil"] = "Festa do Véu de Inverno",

    ["Harvest Festival"] = "Festival da Colheita",
    ["Love is in the Air"] = "O Amor Está No Ar",
    ["Midsummer Fire Festival"] = "Festival do Fogo do Meio do Verão",
    ["Noblegarden"] = "Jardim Nobre",

    ["Scourge Invasion"] = "Invasão do Flagelo",
    ["Hallow's End"] = "Fim do Dia das Bruxas",
    ["Lunar Festival"] = "Festival Lunar", --************************************************
    -- Professions & Ranks
    --************************************************
    ["Apprentice"] = "Aprendiz",
    ["Journeyman"] = "Profissional",
    ["Expert"] = "Especialista",
    ["Artisan"] = "Artífice",
    ["Master Axesmith"] = "Mestre Armeiro (Machado)",
    ["Master Hammersmith"] = "Mestre Armeiro (Martelo)",
    ["Master Swordsmith"] = "Mestre Armeiro (Espada)",
    ["Gnomish Engineering"] = "Engenharia Gnômica",
    ["Goblin Engineering"] = "Engenharia Goblínica",
    ["Rank"] = "Patente",
    ["Engineer"] = "Engenheiro",

    --************************************************
    -- Equipment Slots & Types
    --************************************************
    ["Head"] = "Cabeça",
    ["Neck"] = "Pescoço",
    ["Shoulder"] = "Ombro",
    ["Chest"] = "Peitoral",
    ["Shirt"] = "Camisa",
    ["Tabard"] = "Tabardo",
    ["Wrist"] = "Pulso",
    ["Hands"] = "Mãos",
    ["Waist"] = "Cintura",
    ["Legs"] = "Pernas",
    ["Feet"] = "Pés",
    ["Ring"] = "Anel",
    ["Finger"] = "Dedo",
    ["BackEquip"] = "Voltar",
    ["Trinket"] = "Berloque",
    ["Held In Off-hand"] = "Emabanhado na Mão Secundária",
    ["Relic"] = "Relíquia",
    ["Relics"] = "Relíquias",
    ["One-Hand"] = "Uma Mão",
    ["Two-Hand"] = "Duas mãos",
    ["Main Hand"] = "Mão Principal",
    ["Off Hand"] = "Mão Secundária",
    ["Ranged"] = "À distância",
    ["Axe"] = "Machado",
    ["Bow"] = "Arco",
    ["Crossbow"] = "Besta",
    ["Dagger"] = "Adaga",
    ["Gun"] = "Arma de Fogo",
    ["Mace"] = "Maça",
    ["Polearm"] = "Arma de Haste",
    ["Shield"] = "Escudo",
    ["Staff"] = "Cajado",
    ["Sword"] = "Espada",
    ["Thrown"] = "Arremessado",
    ["Wand"] = "Varinha",
    ["Fist Weapon"] = "Arma de Punho",
    ["Idol"] = "Ídolo",
    ["Totem"] = "Totem",
    ["Libram"] = "Incunábulo",
    ["Arrow"] = "Flecha",
    ["Bullet"] = "Bala",
    ["Quiver"] = "Aljava",
    ["Ammo Pouch"] = "Bornal de Munição",
    ["Bag"] = "Bolsa",
    ["Potion"] = "Poção",
    ["Reagent"] = "Reagente", --TODO check
    ["Darkmoon Faire Card"] = "Carta da Feira de Negraluna",
    ["Fishing Pole"] = "Vara de Pesca",
    ["Gemstones"] = "Gemas",
    ["Token of Blood Rewards"] = "Recompensas de Ficha de Sangue",
    ["Cooking Fire"] = "Cozinhando Fogo",
    ["Anvil"] = "Bigorna",
    ["Black Anvil"] = "Bigorna Negra",
    ["Forge"] = "Forja",
    ["Black Forge"] = "Forja Negra",
    ["Smokywood Pastures Special Gift"] = "Presente Especial de Smokywood Pastures",
    ["Smokywood Pastures"] = "Fazenda Bosque Defumado",
    ["Projectile"] = "Projétil",
    ["One-Handed Swords"] = "Espadas de Uma Mão",
    ["One-Handed Axes"] = "Machados de Uma Mão",
    ["One-Handed Maces"] = "Maças de Uma Mão",
    ["Two-Handed Swords"] = "Espadas de Duas Mãos",
    ["Two-Handed Axes"] = "Machados de Duas Mãos",
    ["Two-Handed Maces"] = "Maças de Duas Mãos",
    ["Daggers"] = "Adagas",
    ["Fist Weapons"] = "Armas de Punho",
    ["Polearms"] = "Armas de haste",
    ["Staves"] = "Cajados",
    ["Demons"] = "Demônios",
    ["Bows"] = "Arcos",
    ["Crossbows"] = "Bestas",
    ["Guns"] = "Armas de Fogo",
    ["Shields"] = "Escudos",
    ["Wands"] = "Varinhas",
    ["Rings"] = "Anéis",
    ["Gloves"] = "Luvas",
    ["Boots"] = "Botas",
    ["2H Weapon"] = "Arma de 2M",
    ["Flasks"] = "Frascos",
    ["Protection Potions"] = "Poções de Proteção",
    ["Healing and Mana Potions"] = "Poções de Cura e Mana",
    ["Transmutes"] = "Transmutações",
    ["Transmogrification"] = "Transmogrificação",
    ["Defensive Potions and Elixirs"] = "Poções e Elixires Defensivos",
    ["Offensive Potions and Elixirs"] = "Poções e Elixires Ofensivos",
    ["Miscellaneous"] = "Miscelânea",
    ["Helm"] = "Elmo",
    ["Shoulders"] = "Ombreiras",
    ["Bracers"] = "Braçadeiras",
    ["Belt"] = "Cinto",
    ["Pants"] = "Calças",
    ["Bags"] = "Sacos",
    ["Axes"] = "Machados",
    ["Swords"] = "Espadas",
    ["Maces"] = "Maças",
    ["Fist"] = "Punho",
    ["Belt Buckles"] = "Fivelas de Cinto",
    ["Equipment"] = "Equipamento",
    ["Trinkets"] = "Berloques",
    ["Explosives"] = "Explosivos",
    ["Parts"] = "Componentes",
    ["Amulets"] = "Amuletos",
    ["Scales"] = "Escamas",
    ["Special"] = "Especial",

    --************************************************
    -- Set Categories
    --************************************************
    ["Tier 0/0.5 Sets"] = "Conjuntos Tier 0/0.5",
    ["Zul'Gurub Sets"] = "Conjuntos de Zul'Gurub",
    ["Zul'Gurub Enchants"] = "Encantamentos de Zul'Gurub",
    ["Ruins of Ahn'Qiraj Sets"] = "Conjuntos das Ruínas de Ahn'Qiraj",
    ["Temple of Ahn'Qiraj Sets"] = "Conjuntos do Templo de Ahn'Qiraj",
    ["Tier 1 Sets"] = "Conjuntos Tier 1",
    ["Tier 2 Sets"] = "Conjuntos Tier 2",
    ["Tier 3 Sets"] = "Conjuntos Tier 3",
    ["Item Level"] = "Nível de Item",
    ["Disenchanting"] = "Desencantar",
    ["Reagent Tooltip Options"] = "Opções de Dica de Reagentes",
    ["Reagent Rows"] = "Linhas de Reagentes",
    ["Other"] = "Outro",
    ["... %d more"] = "... %d mais",
    ["Recipe #%d"] = "Receita #%d",
})
