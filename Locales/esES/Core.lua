---
--- Core.lua - Spanish UI Localization
---
--- Core UI strings, bindings, and general interface text
---
--- @compatible World of Warcraft 1.12
---

if GetLocale() ~= "esES" then return end

-- Zone name substitutions (for display purposes)
AtlasTWSortIgnore = { "the (.+)", "el (.+)", "la (.+)", "los (.+)", "las (.+)" }

AtlasTWZoneSubstitutions = {
    ["El Templo de Atal'Hakkar"] = "Templo Sumergido"
}

---
--- Key binding definitions for Atlas-TW addon
---
BINDING_HEADER_ATLASTW_TITLE = "Atajos de Atlas-TW"
BINDING_NAME_ATLASTW_TOGGLE = "Alternar Atlas-TW"
BINDING_NAME_ATLASTW_OPTIONS = "Alternar Opciones"
BINDING_HEADER_ATLASTWLOOT_TITLE = "Atajos de AtlasTW Botín"
BINDING_NAME_ATLASTWLOOT_QL1 = "Vista Rápida 1"
BINDING_NAME_ATLASTWLOOT_QL2 = "Vista Rápida 2"
BINDING_NAME_ATLASTWLOOT_QL3 = "Vista Rápida 3"
BINDING_NAME_ATLASTWLOOT_QL4 = "Vista Rápida 4"
BINDING_NAME_ATLASTWLOOT_QL5 = "Vista Rápida 5"
BINDING_NAME_ATLASTWLOOT_QL6 = "Vista Rápida 6"
BINDING_NAME_ATLASTWLOOT_WISHLIST = "Lista de Deseos"

AtlasTW = AtlasTW or {}

--Default map to auto-select to when no SubZone data is available
AtlasTW.AssocDefaults = {
    ["La Masacre"] = "DireMaulNorth",
    ["Cumbre de Roca Negra"] = "BlackrockSpireLower",
    ["Monasterio Escarlata"] = "ScarletMonasteryEnt"
}
--Links maps together that are part of the same instance
AtlasTW.SubZoneAssoc = {
    ["DireMaulNorth"] = "La Masacre",
    ["DireMaulEast"] = "La Masacre",
    ["DireMaulWest"] = "La Masacre",
    ["DireMaulEnt"] = "La Masacre",
    ["BlackrockSpireLower"] = "Cumbre de Roca Negra",
    ["BlackrockSpireUpper"] = "Cumbre de Roca Negra",
    ["BlackrockMountainEnt"] = "Cumbre de Roca Negra",
    ["ScarletMonasteryGraveyard"] = "Monasterio Escarlata",
    ["ScarletMonasteryLibrary"] = "Monasterio Escarlata",
    ["ScarletMonasteryArmory"] = "Monasterio Escarlata",
    ["ScarletMonasteryCathedral"] = "Monasterio Escarlata",
    ["ScarletMonasteryEnt"] = "Monasterio Escarlata"
}
--Links SubZone values with specific instance maps
AtlasTW.SubZoneData = {
    ["Salones de la Destrucción"] = "DireMaulNorth",
    ["Asiento de Gordok"] = "DireMaulNorth",
    ["Barrio de la Madera Corrupta"] = "DireMaulEast",
    ["El Alcance Oculto"] = "DireMaulEast",
    ["El Conservatorio"] = "DireMaulEast",
    ["El Santuario de Eldretharr"] = "DireMaulEast",
    ["Jardines del Capital"] = "DireMaulWest",
    ["Corte de los Altos Elfos"] = "DireMaulWest",
    ["Prisión de Immol'thar"] = "DireMaulWest",
    ["El Ateneo"] = "DireMaulWest",
    ["Mok'Doom"] = "BlackrockSpireLower",
    ["Tazz'Alaor"] = "BlackrockSpireLower",
    ["Túneles de Telaraña Rastrilladora"] = "BlackrockSpireLower",
    ["El Almacén"] = "BlackrockSpireLower",
    ["Cámara de la Batalla"] = "BlackrockSpireLower",
    ["Salón Dragonspire"] = "BlackrockSpireUpper",
    ["Salón de la Vinculación"] = "BlackrockSpireUpper",
    ["La Colonia de Grajos"] = "BlackrockSpireUpper",
    ["Salón de Blackhand"] = "BlackrockSpireUpper",
    ["Estadio Roca Negra"] = "BlackrockSpireUpper",
    ["El Horno"] = "BlackrockSpireUpper",
    ["Ciudad Hordemar"] = "BlackrockSpireUpper",
    ["Trono de la Aguja"] = "BlackrockSpireUpper",
    ["Cámara de la Expiación"] = "ScarletMonasteryGraveyard",
    ["Claustro Abandonado"] = "ScarletMonasteryGraveyard",
    ["Tumba de Honor"] = "ScarletMonasteryGraveyard",
    ["Claustro del Cazador"] = "ScarletMonasteryLibrary",
    ["Galería de Tesoros"] = "ScarletMonasteryLibrary",
    ["Athenaeum"] = "ScarletMonasteryLibrary",
    ["Campo de Entrenamiento"] = "ScarletMonasteryArmory",
    ["Armería del Pié"] = "ScarletMonasteryArmory",
    ["Armería del Cruzado"] = "ScarletMonasteryArmory",
    ["Salón de los Campeones"] = "ScarletMonasteryArmory",
    ["Jardines de la Capilla"] = "ScarletMonasteryCathedral",
    ["Capilla del Cruzado"] = "ScarletMonasteryCathedral",
    ["El Gran Vestibulo"] = "ScarletMonasteryEnt"
}
--Maps to auto-select to from outdoor zones.
AtlasTW.OutdoorZoneToAtlas = {
    ["Vallefresno"] = "BlackfathomDeepsEnt",
    ["Tierras Inhóspitas"] = "UldamanEnt",
    ["Montaña Roca Negra"] = "BlackrockMountainEnt",
    ["Las Estepas Ardientes"] = "HateforgeQuarry", -- TurtleWOW
    ["Paso de la Muerte"] = "KarazhanCrypt",       -- TurtleWOW
    ["Desolace"] = "MaraudonEnt",
    ["Dun Morogh"] = "GnomereganEnt",
    ["Feralas"] = "DireMaulEnt",
    ["La Garganta de Fuego"] = "BlackrockMountainEnt",
    ["Pantano de las Penas"] = "TheSunkenTempleEnt",
    ["Tanaris"] = "ZulFarrak",
    ["Los Baldíos"] = "WailingCavernsEnt",
    ["Gilneas"] = "GilneasCity", -- TurtleWOW
    ["Claros de Tirisfal"] = "ScarletMonasteryEnt",
    ["Páramos de Poniente"] = "TheDeadminesEnt",
    ["Orgrimmar"] = "RagefireChasm",
    ["Marjal Revolcafango"] = "OnyxiasLair",
    ["Silithus"] = "TheTempleofAhnQiraj",
    ["Tierras de la Peste del Oeste"] = "Scholomance",
    ["Bosque de Argénteos"] = "ShadowfangKeep",
    ["Tierras de la Peste del Este"] = "Stratholme",
    ["Ciudad de Ventormenta"] = "TheStockade",
    ["Vega de Tuercespina"] = "ZulGurub",
    ["Balor"] = "StormwroughtRuins",       -- TurtleWOW
    ["Los Humedales"] = "DragonmawRetreat" -- TurtleWOW
}

---
--- Register Core UI translations
---
AtlasTW.Localization:RegisterNamespace("UI", "esES", {
    --************************************************
    -- Common UI Strings
    --************************************************
    ["Options"] = "Opciones",
    ["Search"] = "Buscar",
    ["Clear"] = "Limpiar",
    ["Done"] = "Hecho",
    ["Yes"] = "Sí",
    ["No"] = "No",
    ["All"] = "Todos",
    ["Type"] = "Tipo",
    ["Level"] = "Nivel",
    ["Player Limit"] = "Limite de Jugadores",
    ["Damage"] = "Dano",
    ["Location"] = "Ubicación",
    ["Continent"] = "Continente",
    ["Instance"] = "Instancia",
    ["Quest"] = "Misión",
    ["Quests"] = "Misiones",
    ["Loot"] = "Botín",
    ["Previous"] = "Anterior",
    ["Next"] = "Siguiente",
    ["Group by Source"] = "Agrupar por Fuente",
    ["Default"] = "Predeterminado",
    ["Check Completed Quests"] = "Ver Misiones Completadas",
    ["Lockpicking"] = "Ganzúa",
    ["Doors"] = "Puertas",


    --************************************************
    -- Colors
    --************************************************
    ["Purple"] = "Morado",
    ["Red"] = "Rojo",
    ["Orange"] = "Naranja",
    ["White"] = "Blanco",

    --************************************************
    -- Mob Types
    --************************************************
    ["Boss"] = "Jefe",
    ["Rare"] = "Raro",
    ["Mini Bosses"] = "Mini jefes",
    ["Trash Mobs"] = "Enemigos basura",
    ["Bat"] = "Murciélago",
    ["Snake"] = "Serpiente",
    ["Raptor"] = "Raptor",
    ["Spider"] = "Araña",
    ["Tiger"] = "Tigre",
    ["Panther"] = "Pantera",
    ["Pet"] = "Mascota",
    ["Rare Mobs"] = "Enemigos raros",

    --************************************************
    -- Damage Types
    --************************************************
    ["Fire"] = "Fuego",
    ["Nature"] = "Naturaleza",
    ["Frost"] = "Escarcha",
    ["Shadow"] = "Sombra",
    ["Arcane"] = "Arcano",
    ["Physical"] = "Físico",

    --************************************************
    -- Directions
    --************************************************
    ["East"] = "Este",
    ["North"] = "Norte",
    ["South"] = "Sur",
    ["West"] = "Oeste",
    ["Lower"] = "Inferior",
    ["Upper"] = "Superior",
    ["Front"] = "Frente",
    ["Side"] = "Lado",
    ["Outside"] = "Exterior",
    ["Back"] = "Atrás",

    --************************************************
    -- Instance Types
    --************************************************
    ["Dungeons"] = "Mazmorras",
    ["Raids"] = "Bandas",
    ["RAID"] = "Incursión",
    ["Battlegrounds"] = "Campos de batalla",
    ["Entrances"] = "Entradas",
    ["Transport Routes"] = "Rutas de transporte",

    --************************************************
    -- Level Ranges
    --************************************************
    ["Instances level 15-29"] = "Instancias nivel 15-29",
    ["Instances level 30-39"] = "Instancias nivel 30-39",
    ["Instances level 40-49"] = "Instancias nivel 40-49",
    ["Instances level 50-59"] = "Instancias nivel 50-59",
    ["Instances 60 level"] = "Instancias nivel 60",

    --************************************************
    -- Party Size
    --************************************************
    ["Party Size"] = "Tamaño del grupo",
    ["Instances for 5 Players"] = "Instancias para 5 jugadores",
    ["Instances for 10 Players"] = "Instancias para 10 jugadores",
    ["Instances for 20 Players"] = "Instancias para 20 jugadores",
    ["Instances for 40 Players"] = "Instancias para 40 jugadores",

    --************************************************
    -- Continents
    --************************************************
    ["Kalimdor Instances"] = "Instancias de Kalimdor",
    ["Eastern Kingdoms Instances"] = "Instancias de Reinos del Este",

    --************************************************
    -- Settings
    --************************************************
    ["Select Category"] = "Seleccionar categoría",
    ["Select Map"] = "Seleccionar mapa",
    ["Select Loot Table"] = "Tabla de botín",
    ["Show the Quest Panel with AtlasTW"] = "Mostrar el panel de misiones con AtlasTW",
    ["Show Quest Panel on the Left"] = "Mostrar el panel de misiones a la izquierda",
    ["Show Quest Panel on the Right"] = "Mostrar el panel de misiones a la derecha",
    ["Color Quests by Level"] = "Colorear las misiones por nivel",
    ["Color Quests from the Questlog"] = "Colorear las misiones del registro de misiones",
    ["Auto-Query Unknown Items"] = "Consultar automáticamente objetos desconocidos",
    ["Show Loot Panel with AtlasTW"] = "Mostrar panel de botín con AtlasTW",
    ["Sort Instance by:"] = "Ordenar instancia por:",
    ["Show Button on Minimap"] = "Mostrar botón en el minimapa",
    ["Auto-Select Instance Map"] = "Mapa de instancia automático",
    ["Transparency"] = "Transparencia",
    ["Right-Click for World Map"] = "Clic derecho para mapa del mundo",
    ["Show Acronyms"] = "Mostrar acrónimos",
    ["Clamp window to screen"] = "Ajustar ventana a la pantalla",
    ["Show Cursor Coordinates on Map"] = "Mostrar coordenadas del cursor en el mapa",
    ["Show Map Markers"] = "Mostrar marcadores del mapa",
    ["Enable pfUI Styling"] = "Habilitar estilo pfUI",
    ["pfUI styling enabled. Type /reload to apply changes."] =
    "Estilo pfUI activado. Escribe /reload para aplicar los cambios.",
    ["pfUI styling disabled. Type /reload to apply changes."] =
    "Estilo pfUI desactivado. Escribe /reload para aplicar los cambios.",
    ["Scale"] = "Escala",

    --************************************************
    -- Quest Related
    --************************************************
    ["Quest finished:"] = "Misión completada:",
    ["No Quests"] = "Sin misiones",
    ["No Rewards"] = "Sin recompensas",
    ["Quest Item"] = "Objeto de Misión",
    ["Quest Reward"] = "Recompensa de misión",
    ["This Item Begins a Quest"] = "Este objeto comienza una misión",
    ["Attain: "] = "Se obtiene: ",
    ["Level: "] = "Nivel: ",
    ["Requires"] = "Requiere",
    ["Tools: "] = "Herramientas: ",
    ["Reagents: "] = "Componentes: ",
    ["Starts at: \n"] = "Comienza en: \n",
    ["Objective: \n"] = "Objetivo: \n",
    ["Note: \n"] = "Nota: \n",
    ["Prequest: "] = "Misión previa: ",
    ["Quest follows: "] = "Misión siguiente: ",
    ["Story"] = "Historia",
    ["Need quest"] = "Necesita misión",

    --************************************************
    -- Search & Results
    --************************************************
    ["Search Unavailable"] = "Búsqueda no disponible",
    ["Not Available"] = "No disponible",
    ["Search Result: %s"] = "Resultado de búsqueda: %s",
    ["Search Result"] = "Resultado de búsqueda",
    ["Last Result"] = "Último resul.",
    ["Search options"] = "Opciones de búsqueda",
    ["Partial matching"] = "Coincidencia parcial",
    ["If checked, AtlasTWLoot searches item names for a partial match."] =
    "Si está marcado, AtlasTWLoot busca nombres de objetos con coincidencia parcial.",
    ["Predict search"] = "Búsqueda predictiva",
    ["If checked, AtlasTWLoot predicts search results."] =
    "Si está marcado, AtlasTWLoot muestra sugerencias mientras escribes.",
    ["No match found for"] = "No se encontraron coincidencias para",

    --************************************************
    -- Items & Loot
    --************************************************
    ["This item is not safe!"] = "¡Este objeto no es seguro!",
    ["Item not found in cache"] = "Objeto no encontrado en la caché",
    ["The content patch isn't out yet"] = "El parche de contenido aún no ha salido",
    ["Old version of SuperWoW detected..."] = "Versión antigua de SuperWoW detectada...",
    ["Slot Bag"] = " - Bolsa",
    ["Various Locations"] = "Varias ubicaciones",
    ["Vendor"] = "Vendedor",
    ["Pickpocketed"] = "Robado mediante carterismo",
    ["Random stats"] = "Estadísticas aleatorias",
    ["<Random enchantment>"] = "<Encantamiento aleatorio>",
    ["Shared"] = "Compartido",
    ["Unique"] = "Único",
    ["Charges"] = "Cargas",

    --************************************************
    -- AtlasTW Loot
    --************************************************
    ["Loot Panel"] = "Panel de botín",
    ["Filter: No Filter"] = "Filtro: Sin filtro",
    ["Filter: My Class"] = "Filtro: Mi clase",
    ["Filter: Available"] = "Filtro: Disponible",
    ["WishList"] = "Deseos",
    ["ALT+Click to clear"] = "ALT+Clic para limpiar",
    ["QuickLook"] = "Vista rápida",
    ["Add to QuickLooks"] = "Agregar a Vistas rápidas",
    ["Assign this loot table to QuickLook"] = "Asignar esta tabla de botín a Vista rápida",
    ["ALT+Click on item to add or remove it from WishList"] =
    "ALT+Clic en el objeto para añadirlo o quitarlo de la Lista de deseos",
    [" added to the WishList."] = " añadido a la Lista de deseos.",
    [" already in the WishList!"] = " ¡ya está en la Lista de deseos!",
    [" deleted from the WishList."] = " eliminado de la Lista de deseos.",
    [" not found in the WishList."] = " no encontrado en la Lista de deseos.",

    --************************************************
    -- Settings & Configuration
    --************************************************
    ["Button Position"] = "Posición del botón",
    ["Button Radius"] = "Radio del botón",
    ["Reset Position"] = "Resetear posición",
    ["has been reset!"] = "¡Se ha restablecido!",
    ["Reset Settings"] = "Resetear configuración",
    ["Default settings applied!"] = "¡Configuración predeterminada aplicada!",
    ["Safe Chat Links |cff1eff00(recommended)|r"] = "Enlaces de chat seguros |cff1eff00(recomendado)|r",
    ["Enable all Chat Links"] = "Habilitar todos los enlaces de chat",
    ["Use EquipCompare"] = "Usar EquipCompare",
    ["Make Loot Table Opaque"] = "Hacer opaca la tabla de botín",
    ["Show IDs in Tooltips"] = "Mostrar IDs en descripciones emergentes",
    ["Show Icon in Tooltips"] = "Mostrar icono en descripciones emergentes",
    ["Show Source on Tooltips"] = "Mostrar origen en descripciones",
    ["Welcome to Atlas-TW Edition. Please take a moment to set your preferences."] =
    "Bienvenido a Atlas-TW Edition. Por favor, tome un momento para configurar sus preferencias.",

    --************************************************
    -- Version & Updates
    --************************************************
    ["Update available"] = "Actualización disponible",
    ["Version: %s"] = "Versión: %s",
    ["Version check sent to %s"] = "Verificación de versión enviada a %s",
    ["NewVersionAvailableFmt"] = "|cffff0000¡Nueva versión disponible!|r |cff00ff00Descarga aquí:|r %s",
    [" |cffA52A2Aloaded."] = " |cffA52A2Acargado.",
    ["NoticeText"] = "Si encuentra algo que falta, infórmelo en:|r",

    --************************************************
    -- Categories & Menus
    --************************************************
    ["Collections"] = "Colecciones",
    ["Factions"] = "Facciones",
    ["World Events"] = "Eventos",
    ["Crafting"] = "Fabricación",
    ["Sets"] = "Conjuntos",
    ["Misc"] = "Varios",
    ["Dungeons & Raids"] = "Mazm. y Bandas",
    ["Weapon Skills"] = "Habilidades de Armas",
    ["Trainers"] = "Instructores",

    --************************************************
    -- Minimap Tooltip
    --************************************************
    ["Left-click to open Atlas-TW.\nMiddle-click for Atlas-TW options.\nRight-click and drag to move this button."] =
    "Clic izquierdo para abrir Atlas-TW.\nClic medio para opciones de Atlas-TW.\nClic derecho y arrastrar para mover este botón.",

    --************************************************
    -- Instance Locations
    --************************************************
    ["Instances"] = "Instancias",

    --************************************************
    -- Common Terms
    --************************************************
    ["Entrance"] = "Entrada",
    ["Exit"] = "Salida",
    ["Portal"] = "Portal",
    ["Teleport"] = "Teletransporte",
    ["Key"] = "Llave",
    ["Ghost"] = "Fantasma",
    ["Meeting Stone"] = "Piedra de Encuentro",
    ["Summon"] = "Invocar",
    ["Random"] = "Aleatorio",
    ["Optional"] = "Opcional",
    ["Reputation"] = "Reputación",
    ["Rescued"] = "Rescatado",
    ["Unknown"] = "Desconocido",
    ["Varies"] = "Varía",
    ["Wanders"] = "Vaga",
    ["Connection"] = "Conexión",
    ["Connections"] = "Conexiones",
    ["Elevator"] = "Ascensor",
    ["Attunement Required"] = "Se requiere sintonización",
    ["Chase Begins"] = "Comienza la persecución",
    ["Chase Ends"] = "Termina la persecución",
    ["Open Portal"] = "Abrir portal",
    ["Moonwell"] = "Pozo de la Luna",
    ["through "] = "a través de ",
    ["Severs"] = "Corta",

    --************************************************
    -- Crafting & Item Info
    --************************************************
    ["To cast "] = "Para lanzar ",
    [" the following items are needed:"] = " se necesitan los siguientes objetos:",
    [" you need this: "] = " necesitas esto: ",
    ["To craft "] = "Para crear ",
    [" the following reagents are needed:"] = " se necesitan los siguientes componentes:",
    ["Setup"] = "Establecer",
    ["Drop Rate:"] = "Tasa de caída:",
    ["ItemID:"] = "ID de objeto:",
    ["SpellID:"] = "ID de hechizo:",
    ["Gemology Plans"] = "Planes de Gemología",
    ["Goldsmithing Plans"] = "Planes de Orfebrería",
    ["Skill:"] = "Habilidad:",

    --************************************************
    -- Class Sets Categories
    --************************************************
    ["Priest Sets"] = "Conjuntos de Sacerdote",
    ["Mage Sets"] = "Conjuntos de Mago",
    ["Warlock Sets"] = "Conjuntos de Brujo",
    ["Rogue Sets"] = "Conjuntos de Pícaro",
    ["Druid Sets"] = "Conjuntos de Druida",
    ["Hunter Sets"] = "Conjuntos de Cazador",
    ["Shaman Sets"] = "Conjuntos de Chamán",
    ["Paladin Sets"] = "Conjuntos de Paladín",
    ["Warrior Sets"] = "Conjuntos de Guerreiro",

    --************************************************
    -- Item Types & Categories
    --************************************************
    ["Mount"] = "Montura",
    ["a mount"] = "una montura",
    ["Glyph"] = "Glifo",
    ["Enchant"] = "Encanta",
    ["Trade Goods"] = "Bienes comerciales",
    ["Book"] = "Libro",
    ["Cloak"] = "Capa",
    ["Weapon"] = "Arma",
    ["Weapons"] = "Armas",
    ["Classes"] = "Clases",
    ["Right Half"] = "Mitad derecha",
    ["Left Half"] = "Mitad izquierda",
    ["Prizes"] = "Premios",
    ["Decks"] = "Mazos",
    ["Container"] = "Contenedor",
    ["Consumable"] = "Consumible",
    ["World"] = "Mundo",
    ["Used to summon boss"] = "Usado para invocar al jefe",
    ["Doll"] = "Muñeca",
    ["Earth"] = "Tierra",
    ["Air"] = "Aire",
    ["Master Angler"] = "Maestro Pescador",
    ["First Prize"] = "Primer premio",
    ["Rare Fish Rewards"] = "Recompensas de peces raros",
    ["Rare Fish"] = "Peces raros",
    ["a companion"] = "una mascota",
    ["Cache"] = "Caché",

    ["Zul'Gurub Rings"] = "Anillos de Zul'Gurub",
    ["Pre 60 Sets"] = "Conjuntos previos al 60",
    ["Crafted Sets"] = "Conjuntos fabricados",
    ["Crafted Epic Weapons"] = "Armas épicas fabricadas",
    ["Tier 0.5"] = "Nivel 0.5",
    ["Tier 0.5 Summonable"] = "Nivel 0.5 invocable",
    ["PvP Rewards"] = "Recomp. JxJ",
    ["PvP Armor Sets"] = "Conjuntos de armadura JcJ",
    ["PvP Weapons"] = "Armas JcJ",
    ["PvP Accessories"] = "Accesorios JcJ",
    ["Collector's Edition"] = "Edición de coleccionista",
    ["Epic Set"] = "Conjunto épico",
    ["Rare Set"] = "Conjunto raro",
    ["Legendary Items"] = "Objetos legendarios",
    ["Artifact Items"] = "Objetos artefacto",
    ["Fire Resistance Gear"] = "Equipamiento de resistencia al fuego",
    ["Arcane Resistance Gear"] = "Equipamiento de resistencia a lo arcano",
    ["Nature Resistance Gear"] = "Equipamiento de resistencia a la naturaleza",
    ["Rare Pets"] = "Mascotas raras",
    ["Rare Mounts"] = "Monturas raras",
    ["Old Mounts"] = "Monturas antiguas",
    ["PvP Mounts"] = "Monturas JcJ",
    ["Tabards"] = "Tabardos",
    ["World Epics"] = "Épicos del mundo",
    ["World Enchants"] = "Encantamientos del mundo",
    ["World Blues"] = "Azules del mundo",
    ["Keys"] = "Llaves",

    ["Level One Lunatic Challenge"] = "Desafío del lunático de nivel uno",


    --************************************************
    -- Events & Holidays
    --************************************************

    ["Children's Week"] = "Semana de los Niños",
    ["Elemental Invasion"] = "Invasión elemental",
    ["Feast of Winter Veil"] = "Fiesta del Velo de Invierno",

    ["Harvest Festival"] = "Festival de la Cosecha",
    ["Love is in the Air"] = "Amor en el Aire",
    ["Midsummer Fire Festival"] = "Festival del Fuego del Solsticio",
    ["Noblegarden"] = "Jardín Noble",

    ["Scourge Invasion"] = "Invasión de la Plaga",
    ["Hallow's End"] = "Fin de la Cosecha",
    ["Lunar Festival"] = "Festival Lunar",


    --************************************************
    -- Professions & Ranks
    --************************************************
    ["Apprentice"] = "Aprendiz",
    ["Journeyman"] = "Oficial",
    ["Expert"] = "Experto",
    ["Artisan"] = "Artesano",
    ["Master Axesmith"] = "Maestro Forjador de Hachas",
    ["Master Hammersmith"] = "Maestro Forjador de Martillos",
    ["Master Swordsmith"] = "Maestro Forjador de Espadas",
    ["Gnomish Engineering"] = "Ingeniería Gnoma",
    ["Goblin Engineering"] = "Ingeniería Goblin",
    ["Rank"] = "Rango",
    ["Engineer"] = "Ingeniero",

    --************************************************
    -- Equipment Slots & Types
    --************************************************
    ["Item"] = "Objeto",
    ["Pattern"] = "Patrón",
    ["Head"] = "Cabeza",
    ["Neck"] = "Cuello",
    ["Shoulder"] = "Hombro",
    ["Chest"] = "Pecho",
    ["Shirt"] = "Camisa",
    ["Tabard"] = "Tabardo",
    ["Wrist"] = "Muñeca",
    ["Demons"] = "Demonios",
    ["Hands"] = "Manos",
    ["Waist"] = "Cintura",
    ["Legs"] = "Piernas",
    ["Feet"] = "Pies",
    ["Ring"] = "Dedo",
    ["Finger"] = "Dedo",
    ["BackEquip"] = "Capa",
    ["Trinket"] = "Abalorio",
    ["Held In Off-hand"] = "Sostenido en la Mano Izquierda",
    ["Relic"] = "Reliquia",
    ["Relics"] = "Reliquias",
    ["One-Hand"] = "Una Mano",
    ["Two-Hand"] = "Arma de Dos Manos",
    ["Main Hand"] = "Mano Principal",
    ["Off Hand"] = "Mano Secundaria",
    ["Ranged"] = "A Distancia",
    ["Axe"] = "Hacha",
    ["Bow"] = "Arco",
    ["Crossbow"] = "Ballesta",
    ["Dagger"] = "Daga",
    ["Gun"] = "Arma de Fuego",
    ["Mace"] = "Maza",
    ["Polearm"] = "Arma de Asta",
    ["Shield"] = "Escudo",
    ["Staff"] = "Bastón",
    ["Sword"] = "Espada",
    ["Thrown"] = "Arma Arrojadiza",
    ["Wand"] = "Varita",
    ["Fist Weapon"] = "Arma de Puño",
    ["Idol"] = "Ídolo",
    ["Totem"] = "Tótem",
    ["Libram"] = "Tratado",
    ["Arrow"] = "Flecha",
    ["Bullet"] = "Bala",
    ["Quiver"] = "Carcaj",
    ["Ammo Pouch"] = "Bolsa de Munición",
    ["Bag"] = "Bolsa",
    ["Potion"] = "Poción",
    ["Reagent"] = "Reactivo",
    ["Darkmoon Faire Card"] = "Carta de la Feria de la Luna Negra",
    ["Fishing Pole"] = "Caña de Pescar",
    ["Gemstones"] = "Gemas",
    ["Token of Blood Rewards"] = "Recompensas de Ficha de Sangre",
    ["Cooking Fire"] = "Fogata de Cocina",
    ["Anvil"] = "Yunque",
    ["Black Anvil"] = "Yunque Negro",
    ["Forge"] = "Forja",
    ["Black Forge"] = "Forja Negra",
    ["Smokywood Pastures Special Gift"] = "Regalo Especial de Ahumaderos Bosquehumo",
    ["Smokywood Pastures"] = "Pastos de Madera Humeante",
    ["Projectile"] = "Proyectil",
    ["Polearms"] = "Armas de Asta",
    ["One-Handed Swords"] = "Espadas de una mano",
    ["One-Handed Axes"] = "Hachas de una mano",
    ["One-Handed Maces"] = "Mazas de una mano",
    ["Two-Handed Swords"] = "Espadas de dos manos",
    ["Two-Handed Axes"] = "Hachas de dos manos",
    ["Two-Handed Maces"] = "Mazas de dos manos",
    ["Daggers"] = "Dagas",
    ["Fist Weapons"] = "Armas de puño",
    ["Staves"] = "Bastones",
    ["Bows"] = "Arcos",
    ["Crossbows"] = "Ballestas",
    ["Guns"] = "Armas de Fuego",
    ["Shields"] = "Escudos",
    ["Wands"] = "Varitas",
    ["Rings"] = "Anillos",
    ["Gloves"] = "Guantes",
    ["Boots"] = "Botas",
    ["2H Weapon"] = "Arma de dos manos",
    ["Flasks"] = "Frascos",
    ["Protection Potions"] = "Pociones de protección",
    ["Healing and Mana Potions"] = "Pociones de sanación y maná",
    ["Transmutes"] = "Transmutaciones",
    ["Transmogrification"] = "Transmogrificación",
    ["Defensive Potions and Elixirs"] = "Pociones y elixires defensivos",
    ["Offensive Potions and Elixirs"] = "Pociones y elixires ofensivos",
    ["Miscellaneous"] = "Miscelánea",
    ["Helm"] = "Yelmo",
    ["Shoulders"] = "Hombreras",
    ["Bracers"] = "Brazales",
    ["Belt"] = "Cinturón",
    ["Pants"] = "Pantalones",
    ["Bags"] = "Bolsas",
    ["Axes"] = "Hachas",
    ["Swords"] = "Espadas",
    ["Maces"] = "Mazas",
    ["Fist"] = "Puño",
    ["Belt Buckles"] = "Hebillas de cinturón",
    ["Equipment"] = "Equipamiento",
    ["Trinkets"] = "Abalorios",
    ["Explosives"] = "Explosivos",
    ["Parts"] = "Piezas",
    ["Amulets"] = "Amuletos",
    ["Scales"] = "Escamas",
    ["Special"] = "Especial",

    --************************************************
    -- Set Categories
    --************************************************
    ["Tier 0/0.5 Sets"] = "Conjuntos 0/0.5",
    ["Zul'Gurub Sets"] = "Conjuntos de Zul'Gurub",
    ["Zul'Gurub Enchants"] = "Encantamientos de Zul'Gurub",
    ["Ruins of Ahn'Qiraj Sets"] = "Conjuntos de Ruinas de Ahn'Qiraj",
    ["Temple of Ahn'Qiraj Sets"] = "Conjuntos del Templo de Ahn'Qiraj",
    ["Tier 1 Sets"] = "Conjuntos de nivel 1",
    ["Tier 2 Sets"] = "Conjuntos de nivel 2",
    ["Tier 3 Sets"] = "Conjuntos de nivel 3",
    ["Item Level"] = "Nivel de Objeto",
    ["Disenchanting"] = "Desencantar",
    ["Reagent Tooltip Options"] = "Opciones de componentes",
    ["Reagent Rows"] = "Filas de componentes",
    ["Other"] = "Otro",
    ["... %d more"] = "... %d más",
    ["Recipe #%d"] = "Receta #%d",
})
