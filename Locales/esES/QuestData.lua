---
--- QuestData_esES.lua - Definiciones de datos de misiones de Atlas para la localización española
--- 
--- Este archivo contiene todas las definiciones de datos de misiones para Atlas-TW en español.
--- Incluye información de misiones, recompensas, ubicaciones y requisitos
--- para todas las instancias y zonas compatibles con Atlas-TW.
--- 
--- Características:
--- - Base de datos de misiones completa para todas las instancias
--- - Definiciones de recompensas de misiones
--- - Información de ubicación y NPC de misiones
--- - Sistema de herencia de misiones
--- - Datos de misiones localizados para español
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

if GetLocale() ~= "esES" then return end

---------------
--- COLOURS ---
---------------
local red = AtlasTW.Colors.RED
local white = AtlasTW.Colors.WHITE
local green = AtlasTW.Colors.GREEN2
local blue = AtlasTW.Colors.BLUE
local yellow = AtlasTW.Colors.YELLOW2

----------------------------------------------
------------- Quest Instance Data ------------
----------------------------------------------

local kQuestInstanceData = {}

---
--- Creates an inherited quest object using metatable inheritance
--- @param baseQuest table The base quest object to inherit from
--- @param overrides table The quest-specific overrides to apply
--- @return table The new quest object with inheritance
--- @usage local newQuest = createInheritedQuest(baseQuest, { Title = "New Title" })
---
local function createInheritedQuest(baseQuest, overrides)
    local metatable = { __index = baseQuest }
    setmetatable(overrides, metatable)
    return overrides
end

--------------- The Deadmines ---------------
kQuestInstanceData.TheDeadmines = {
    Story = "Antaño el mayor centro de producción de oro de los reinos humanos, las Minas de la Muerte fueron abandonadas cuando la Horda arrasó la ciudad de Ventormenta durante la Primera Guerra. Ahora, la Hermandad Defias se ha instalado allí y ha convertido los oscuros túneles en su santuario privado. Se rumorea que los ladrones han reclutado a los ingeniosos goblins para ayudarles a construir algo terrible en el fondo de las minas, pero lo que pueda ser es aún incierto. Se rumorea que el camino hacia las Minas de la Muerte pasa por el tranquilo y modesto pueblo de Arroyo de la Luna.",
    Caption = "Las Minas de la Muerte",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheDeadmines.Alliance[1] = {
    Title = "Pañuelos de Seda Roja",
    Level = 17,
    Attain = 14,
    Aim = "La Exploradora Riell en la Torre de la Colina del Centinela quiere que le lleves 10 Pañuelos de Seda Roja.",
    Location = "Explorador Riell (Páramos de Poniente - Colina del Centinela "..yellow.."56, 47"..white..")",
    Note = "Puedes obtener los Pañuelos de Seda Roja de los mineros en las Minas de la Muerte o en el pueblo donde se encuentra la mazmorra. La misión estará disponible después de completar la cadena de misiones de La Hermandad de los Defias hasta la parte donde tienes que matar a Edwin VanCleef.",
    Prequest = "La Hermandad de los Defias",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 2074 }, --Solid Shortblade One-Hand, Sword
        { id = 2089 }, --Scrimshaw Dagger One-Hand, Dagger
        { id = 6094 }, --Piercing Axe Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[2] = {
    Title = "Recolectando Recuerdos",
    Level = 18,
    Attain = 14,
    Aim = "Recupera 4 tarjetas del Sindicato de Mineros y devuélveselos a Wilder Cardortiga en Ventormenta.",
    Location = "Wilder Cardortiga (Ventormenta - Distrito de los Enanos "..yellow.."65, 21"..white..")",
    Note = "Las cartas caen de los enemigos no-muertos fuera de la mazmorra en el área cerca de "..yellow.."[3]"..white.." en el mapa de Entrada.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 2037 }, --Tunneler's Boots Feet, Mail
        { id = 2036 }, --Dusty Mining Gloves Hands, Leather
    }
}
kQuestInstanceData.TheDeadmines.Alliance[3] = {
    Title = "Oh, Hermano...",
    Level = 20,
    Attain = 15,
    Aim = "Lleva la Insignia de la Liga de Expedicionarios de Capataz Cardortiga a Wilder Cardortiga en Ventormenta.",
    Location = "Wilder Cardortiga (Ventormenta - Distrito de los Enanos "..yellow.."65,21"..white..")",
    Note = "El Supervisor Cardortiga se encuentra fuera de la mazmorra en el área de no-muertos en "..yellow.."[3]"..white.." en el mapa de Entrada.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 1893 }, --Miner's Revenge Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[4] = {
    Title = "Asalto Subterráneo",
    Level = 20,
    Attain = 15,
    Aim = "Recupera el Gnoam Sprecklesprocket de las Minas de la Muerte y llévaselo a Shoni la Silenciosa en Ventormenta.",
    Location = "Shoni la Silenciosa (Ventormenta - Distrito de los Enanos "..yellow.."55,12"..white..")",
    Note = "La misión anterior se puede obtener de Gnoarn (Dun Morogh - Instalación de Reclamación Gnomeregan "..yellow.."24.5,30.4"..white..")\nLa trituradora de Sneed deja caer el Piñón de Spreckle "..yellow.."[3]"..white..".",
    Prequest = "Hablar con Shoni",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 7606 }, --Polar Gauntlets Hands, Mail
        { id = 7607 }, --Sable Wand Wand
    }
}
kQuestInstanceData.TheDeadmines.Alliance[5] = {
    Title = "La Hermandad de los Defias",
    Level = 22,
    Attain = 14,
    Aim = "Gryan Mantorrecio quiere que hables con Wiley en Villa del Lago.",
    Location = "Gryan Mantorrecio (Páramos de Poniente - Colina del Centinela "..yellow.."56,47"..white..")",
    Note = "Comienzas esta cadena de misiones con Gryan Mantorrecio (Páramos de Poniente - Colina del Centinela "..yellow.."56,47"..white..").\nEdwin VanCleef es el último jefe de Las Minas de la Muerte. Puedes encontrarlo en la parte superior de su barco "..yellow.."[6]"..white..".",
    Prequest = "La Hermandad de los Defias",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6087 }, --Chausses of Páramos de Poniente Legs, Mail
        { id = 2041 }, --Tunic of Páramos de Poniente Chest, Leather
        { id = 2042 }, --Staff of Páramos de Poniente Staff
    }
}
kQuestInstanceData.TheDeadmines.Alliance[6] = {
    Title = "La Prueba de la Rectitud",
    Level = 22,
    Attain = 20,
    Aim = "Habla con Jordan Stilwell en Forjaz.",
    Location = "Jordan Fontana (Dun Morogh - Forjaz Entrance "..yellow.."52,36"..white..")",
    Note = red.."Solo Paladín"..white..": Para ver la nota haz clic en "..yellow.."[Información de La Prueba de la Rectitud]"..white..".",
    Prequest = "El Tomo de Valentía -> La Prueba de la Rectitud",
    Folgequest = "La Prueba de la Rectitud",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = {2, "¡Solo los Paladines pueden obtener esta misión!\n\n1. Obtienes la **Madera de Roble de Piedra Blanca** de los Talladores goblin en "..yellow.."[Las Minas de la Muerte]"..white.." cerca de "..yellow.."[3]"..white..".\n\n2. Para conseguir el **Envío de Mineral Refinado de Bailor**, debes hablar con **Bailor Petramano** (Loch Modan - Thelsamar "..yellow.."35,44"..white.."). Él te da la misión 'El Envío de Mineral de Bailor'. Encontrarás el **Envío de Mineral de Jordan** detrás de un árbol en "..yellow.."71,21"..white..".\n\n3. Obtienes el **Martillo de Herrería de Jordan** en "..yellow.."[Castillo de Colmillo Oscuro]"..white.." en "..yellow.."[3]"..white..".\n\n4. Para obtener una **Gema Kor**, debes ir con **Thundris Tejevientos** (Costa Oscura – Auberdine "..yellow.."37,40"..white..") y hacer la misión 'Buscando la Gema Kor'. Para esta misión debes matar oráculos o sacerdotisas de Brazanegra cerca de "..yellow.."[Cavernas de Brazanegra]"..white..". Sueltan una **Gema Kor corrupta**. Thundris Tejevientos la purificará por ti.", };
}
kQuestInstanceData.TheDeadmines.Alliance[7] = {
    Title = "La Carta No Enviada",
    Level = 22,
    Attain = 16,
    Aim = "Entrega la Carta al Arquitecto de la Ciudad a Baros Alexston en Ventormenta.",
    Location = "Una Carta Sin Enviar (cae de Edwin VanCleef "..yellow.."[6]"..white..")",
    Note = "Baros Alexston está en la Ciudad de Ventormenta, junto a la Catedral de la Luz en "..yellow.."49,30"..white..".",
    Folgequest = "Bazil Thredd",

}
kQuestInstanceData.TheDeadmines.Alliance[8] = {
    Title = "La Venganza del Capitán Grayson",
    Level = 22,
    Attain = 15,
    Aim = "Acaba con Cookie.",
    Location = "Capitán Grisillo (Páramos de Poniente - Faro "..yellow.."30,86"..white..")",
    Note = "Comienzas esta cadena de misiones en la isla noroeste de Páramos de Poniente; Libro rojo en el suelo "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "¿Comida para Pensamientos Náuticos?",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Alliance[9] = {
    Title = "El Misterio del Gólem de la Cosecha",
    Level = 19,
    Attain = 15,
    Aim = "Recolecta una Runa de Animación Agrietada para Christopher Hewen en Colina del Centinela.",
    Location = "Maltimor Gartside (Páramos de Poniente - al norte de la Mina de la Costa del Oro "..yellow.."31.3,37.6"..white..")",
    Note = "Comienzas esta cadena de misiones con Christopher Hewen (Páramos de Poniente - Posada de la Colina del Centinela "..yellow.."52.3,52.8"..white..").\nLa cadena tiene 16 misiones. Recompensa final objetos azules: 1) Mano izq. Int/Res Sombra/daño y sanación, 2) Hombreras de malla Fue/Agu, 3) Guantes de cuero Fue/Agi/Agu\nGilnid está en "..yellow.."[4]"..white..".",
    Prequest = "El misterio del gólem de la cosecha VIII",
    Folgequest = "El misterio del gólem de la cosecha X",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60684 }, --Tinkering Belt Waist, Leather
        { id = 60685 }, --Safety Wraps Wrist, Cloth
        { id = 60686 }, --Harvest Golem Arm Two-Hand, Mace
    }
}
kQuestInstanceData.TheDeadmines.Alliance[10] = {
    Title = "Entrega de Venture Co.",
    Level = 20,
    Attain = 14,
    Aim = "Infiltrate en las Minas de la Muerte en los Páramos del Oeste y adquiere la Cerveza Chispeante de Voss.",
    Location = "Renzik 'El Chivato' (Ventormenta - Casco Antiguo "..yellow.."76, 60"..white..")",
    Note = "Comienzas esta cadena de misiones con el mismo PNJ. El objeto de Jared Voss está en "..yellow.."[1]"..white..".",
    Prequest = "Prueba -> Drones en Páramos de Poniente",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 70239 }, --Operative Cloak Back
        { id = 70240 }, --Cuffs of Integrity Wrist, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[1] = {
    Title = "Robo de Prototipo",
    Level = 18,
    Attain = 16,
    Aim = "Lleva el Esquema del Prototipo Desmenuzadora X0-1 a Wrix Ozzlenut.",
    Location = "Wrix Tuerca de Ozzle (Durotar - Puerto Aguachispa "..yellow.."58.3,25.7"..white..")",
    Note = "Sneed deja caer el Esquema del Triturador Prototipo X0-1 "..yellow.."[3]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 81316 }, --Foe Chopper Two-Hand, Axe
        { id = 81317 }, --Shining Electro-lantern Held In Off-hand
    }
}
kQuestInstanceData.TheDeadmines.Horde[2] = {
    Title = "La Venganza del Capitán Grayson",
    Level = 22,
    Attain = 15,
    Aim = "Acaba con Cookie.",
    Location = "Capitán Grisillo (Páramos de Poniente - Faro "..yellow.."30,86"..white..")",
    Note = "Comienzas esta cadena de misiones en la isla noroeste de Páramos de Poniente; Libro rojo en el suelo "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "¿Comida para Pensamientos Náuticos?",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[3] = {
    Title = "Hacha de Defensor de la Horda",
    Level = 18,
    Attain = 15,
    Aim = "Habla con un Guardia de la Horda en El Cruce.",
    Location = "Birgitte Cranston <Portal Trainer> (Cima del Trueno"..yellow.."34.4,20.3"..white..")",
    Note = "Comienzas esta cadena de misiones con Nargal Ojo de Muerte (El Cruce "..yellow.."51.2,29.1"..white..").\nEsta misión "..red.."SOLO TE TELETRANSPORTA a PÁRAMOS DE PONIENTE"..white..". Puedes terminar esta misión y obtener la recompensa después de completar la cadena o usarla como teletransporte a Páramos de Poniente retomando la misión.",
    Prequest = "Hacha de Defensor de la Horda",
    Folgequest = "Hacha de Defensor de la Horda",
    Rewards = {
        Text = "Recompensa: ",
        { id = 40065 }, --Horde Defender's Axe Two-Hand, Axe
    }
}

--------------- Wailing Caverns ---------------
kQuestInstanceData.WailingCaverns = {
    Story = "Recientemente, un druida elfo de la noche llamado Naralex descubrió una red de cavernas subterráneas en el corazón de los Baldíos. Apodadas las 'Cuevas de los Lamentos', estas cuevas naturales estaban llenas de fisuras de vapor que producían largos y lúgubres lamentos al ventilarse. Naralex creía que podía usar los manantiales subterráneos de las cavernas para restaurar la exuberancia y fertilidad de los Baldíos, pero para hacerlo necesitaría desviar las energías del legendario Sueño Esmeralda. Sin embargo, una vez conectado al Sueño, la visión del druida se convirtió de alguna manera en una pesadilla. Pronto, las Cuevas de los Lamentos comenzaron a cambiar: las aguas se volvieron fétidas y las criaturas, antes dóciles, se metamorfosearon en depredadores viciosos y mortales. Se dice que el propio Naralex aún reside en algún lugar del corazón del laberinto, atrapado más allá de los límites del Sueño Esmeralda. Incluso sus antiguos acólitos han sido corrompidos por la pesadilla despierta de su maestro, transformados en los malvados Druidas del Colmillo.",
    Caption = "Cuevas de los Lamentos",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.WailingCaverns.Alliance[1] = {
    Title = "Pieles Desviadas",
    Level = 17,
    Attain = 13,
    Aim = "Nalpak en las Cuevas de los Lamentos quiere 20 Pieles Desviadas.",
    Location = "Nalpak (Barrens - Cuevas de los Lamentos "..yellow.."47,36"..white..")",
    Note = "Todos los enemigos descarriados dentro y justo antes de la entrada a la mazmorra pueden soltar pieles.\nNalpak se puede encontrar en una cueva oculta sobre la entrada real de la cueva. La forma más fácil de llegar a él parece ser subir la colina fuera y detrás de la entrada y dejarse caer en la pequeña repisa sobre la entrada de la cueva.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6480 }, --Slick Deviate Leggings Legs, Leather
        { id = 918 }, --Deviate Hide Pack Bag
    }
}
kQuestInstanceData.WailingCaverns.Alliance[2] = {
    Title = "Problemas en los Muelles",
    Level = 18,
    Attain = 14,
    Aim = "El Operador de Grúa Bigglefuzz en Ratchet quiere que recuperes la botella de Oporto Añejo de 99 Años de Mad Magglish, quien se esconde en las Cuevas de los Lamentos.",
    Location = "Operador de Grúa Pelardo (Barrens - Ratchett "..yellow.."63,37"..white..")",
    Note = "Consigues la botella justo antes de entrar en la mazmorra matando a Magglish el Loco. Cuando entres por primera vez en la cueva, gira inmediatamente a la derecha para encontrarlo al final del pasaje. Está en sigilo junto a la pared en "..yellow.."[2] en el mapa de Entrada"..white..".",
}
kQuestInstanceData.WailingCaverns.Alliance[3] = {
    Title = "Bebidas Inteligentes",
    Level = 18,
    Attain = 13,
    Aim = "Lleva 6 Porciones de Esencia Lamentosa a Mebok Mizzyrix en Ratchet.",
    Location = "Mebok Mizzyrix (Barrens - Ratchett "..yellow.."62,37"..white..")",
    Note = "La misión anterior también se puede obtener de Mebok Mizzyrix.\nTodos los enemigos Ectoplasmas dentro y antes de la mazmorra sueltan la Esencia.",
    Prequest = "Cuernos de Raptor",
}
kQuestInstanceData.WailingCaverns.Alliance[4] = {
    Title = "Erradicación Desviada",
    Level = 21,
    Attain = 15,
    Aim = "Ebru en las Cuevas de los Lamentos quiere que mates 7 Devastadores Descarriados, 7 Víbora Descarrriada, 7 Vagantes Descarrriados y 7 Colmillos del Terror Descarrriados.",
    Location = "Ebru (Barrens - Cuevas de los Lamentos "..yellow.."47,36"..white..")",
    Note = "Ebru está en una cueva oculta sobre la entrada de la cueva. La forma más fácil de llegar a él parece ser subir la colina fuera y detrás de la entrada y dejarse caer en la pequeña repisa sobre la entrada de la cueva.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6476 }, --Pattern: Deviate Scale Belt Pattern
        { id = 8071 }, --Sizzle Stick Wand
        { id = 6481 }, --Dagmire Gauntlets Hands, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[5] = {
    Title = "El Fragmento Brillante",
    Level = 26,
    Attain = 15,
    Aim = "Viaja a Ratchet para encontrar el significado detrás del Fragmento de Pesadilla.",
    Location = "El Fragmento Resplandeciente (cae de Mutanus el Devorador "..yellow.."[9]"..white..")",
    Note = "Mutanus el Devorador solo aparecerá si matas a los cuatro líderes druidas del colmillo y escoltas al druida tauren en la entrada.\nCuando tengas el Fragmento, debes llevarlo al Banco en Trinquete, y luego de vuelta a la cima de la colina sobre Cuevas de los Lamentos a Fala Viento Sabio.",
    Folgequest = "En Pesadillas",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 10657 }, --Talbar Mantle Shoulder, Cloth
        { id = 10658 }, --Quagmire Galoshes Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[6] = {
    Title = "Flor de Serpiente",
    Level = 18,
    Attain = 16,
    Aim = "El Boticario Zamah en Cima del Trueno quiere que recolectes 10 Flores de Serpiente.",
    Location = "Alanndarian Arrullanoche (Auberdine - Costa Oscura "..yellow.."37.7,40.7"..white..")",
    Note = "Consigues la Retama de Serpiente dentro de la cueva frente a la mazmorra y dentro de la mazmorra. Los jugadores con Herboristería pueden ver las plantas en su minimapa.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 51850 }, --Greenweave Sash Waist, Cloth
        { id = 51851 }, --Verdant Boots Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[7] = {
    Title = "Atrapado en la Pesadilla",
    Level = 19,
    Attain = 16,
    Aim = "Alanndarian Nightsong quiere que te aventures en las Cuevas de los Lamentos en los Baldíos del Norte y liberes a Naralex de la Pesadilla. Encuentra a su Discípulo en las cavernas para saber cómo. Regresa con ella cuando liberes a Naralex.",
    Location = "Alanndarian Arrullanoche (Auberdine - Costa Oscura "..yellow.."37.7,40.7"..white..")",
    Note = "Mutanus el Devorador solo aparecerá si matas a los cuatro líderes druidas del colmillo y escoltas al druida tauren en la entrada.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 51848 }, --Ancient Elven Robes Chest, Cloth
        { id = 51849 }, --Thunderhorn Two-Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Alliance[8] = {
    Title = "Maleza Desenfrenada",
    Level = 20,
    Attain = 16,
    Aim = "Thundris Tejeviento en Auberdine necesita muestras de los Crecimientos Antinaturales en las Cuevas de los Lamentos.",
    Location = "Thundris Tejevientos (Auberdine - Costa Oscura "..yellow.."37.4,40.1"..white..")",
    Note = "Elementals - Crecimiento Antinatural drop Overgrowth Samples.",
    Rewards = {
        Text = "Recompensa: 1 o 2",
        { id = 3827, quantity = 3 }, --Mana Potion Potion
        { id = 1710, quantity = 3 }, --Greater Healing Potion Potion
    }
}
kQuestInstanceData.WailingCaverns.Horde[1] = kQuestInstanceData.WailingCaverns.Alliance[1]
kQuestInstanceData.WailingCaverns.Horde[2] = kQuestInstanceData.WailingCaverns.Alliance[2]
kQuestInstanceData.WailingCaverns.Horde[3] = {
    Title = "Flor de Serpiente",
    Level = 18,
    Attain = 14,
    Aim = "El Boticario Zamah en Cima del Trueno quiere que recolectes 10 Flores de Serpiente.",
    Location = "Boticaria Zamah (Cima del Trueno - Cima del Espíritu "..yellow.."22,20"..white..")",
    Note = "La Boticaria Zamah está en una cueva bajo la Cima del Espíritu. Obtienes la misión anterior del Boticario Helbrim (Los Baldíos - El Cruce "..yellow.."51,30"..white..").\nConsigues la Retama de Serpiente dentro de la cueva frente a la mazmorra y dentro de la mazmorra. Los jugadores con Herboristería pueden ver las plantas en su minimapa.",
    Prequest = "Esporas Fungales -> Boticario Zamah",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10919 }, --Apothecary Gloves Hands, Cloth
    }
}
kQuestInstanceData.WailingCaverns.Horde[4] = {
    Title = "Bebidas Inteligentes",
    Level = 18,
    Attain = 13,
    Aim = "Lleva 6 Porciones de Esencia Lamentosa a Mebok Mizzyrix en Ratchet.",
    Location = "Mebok Mizzyrix (Barrens - Ratchett "..yellow.."62,37"..white..")",
    Note = "La misión anterior también se puede obtener de Mebok Mizzyrix.\nTodos los enemigos Ectoplasmas dentro y antes de la mazmorra sueltan la Esencia.",
    Prequest = "Cuernos de Raptor",
}
kQuestInstanceData.WailingCaverns.Horde[5] = {
    Title = "Erradicación Desviada",
    Level = 21,
    Attain = 15,
    Aim = "Ebru en las Cuevas de los Lamentos quiere que mates 7 Devastadores Descarriados, 7 Víbora Descarrriada, 7 Vagantes Descarrriados y 7 Colmillos del Terror Descarrriados.",
    Location = "Ebru (Barrens - Cuevas de los Lamentos "..yellow.."47,36"..white..")",
    Note = "Ebru está en una cueva oculta sobre la entrada de la cueva. La forma más fácil de llegar a él parece ser subir la colina fuera y detrás de la entrada y dejarse caer en la pequeña repisa sobre la entrada de la cueva.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6476 }, --Pattern: Deviate Scale Belt Pattern
        { id = 8071 }, --Sizzle Stick Wand
        { id = 6481 }, --Dagmire Gauntlets Hands, Mail
    }
}
kQuestInstanceData.WailingCaverns.Horde[6] = {
    Title = "Líderes del Colmillo",
    Level = 22,
    Attain = 11,
    Aim = "Lleva las Gemas de Cobrahn, Anacondra, Pythas y Serpentis a Nara Wildmane en Cima del Trueno.",
    Location = "Nara Bravacrín (Cima del Trueno - Cima del Ancestro "..yellow.."75,31"..white..")",
    Note = "La cadena de misiones comienza con Hamuul Runetotem (Cima del Trueno - Cima del Ancestro "..yellow.."78,28"..white..")\nLos 4 druidas sueltan las gemas "..yellow.."[2]"..white..", "..yellow.."[3]"..white..", "..yellow.."[5]"..white..", "..yellow.."[7]"..white..".",
    Prequest = "Los Oasis de Los Baldíos -> Nara Pezuña Salvaje",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6505 }, --Crescent Staff Staff
        { id = 6504 }, --Wingblade Main Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Horde[7] = {
    Title = "El Fragmento Brillante",
    Level = 26,
    Attain = 15,
    Aim = "Viaja a Ratchet para encontrar el significado detrás del Fragmento de Pesadilla.",
    Location = "El Fragmento Resplandeciente (cae de Mutanus el Devorador "..yellow.."[9]"..white..")",
    Note = "Mutanus el Devorador solo aparecerá si matas a los cuatro líderes druidas del colmillo y escoltas al druida tauren en la entrada.\nCuando tengas el Fragmento, debes llevarlo al Banco en Trinquete, y luego de vuelta a la cima de la colina sobre Cuevas de los Lamentos a Fala Viento Sabio.",
    Folgequest = "En Pesadillas",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 10657 }, --Talbar Mantle Shoulder, Cloth
        { id = 10658 }, --Quagmire Galoshes Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Horde[8] = {
    Title = "Brazos Arcanos",
    Level = 18,
    Attain = 14,
    Aim = "Lleva a Chok'Garok 5 piezas de Madera Toque Lunar, un Cristal de la Serpiente y una Esencia Cambiante de las Cuevas de los Lamentos.",
    Location = "Chok'Garok <Clan Machacamiedo> (en la orilla del Río Furia del Sur en los Baldíos "..yellow.."62.4,10.8"..white..")",
    Note = red.."SOLO Mago."..white.." La cadena de misiones comienza con Ureda <Instructora de magos> (Orgrimmar) con la misión 'Dominando lo Arcano'.\nLa Madera tocada por la luna la obtienes de "..yellow.."enemigos comunes"..white..", un Cristal de la Serpiente de Lord Serpentis <Señor del Colmillo>"..yellow.."[7]"..white..", y una Esencia Siempre Cambiante de Lord Pythas <Señor del Colmillo> "..yellow.."[5]"..white..".",
    Prequest = "Dominando lo Arcano",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 80860 }, --Staff of the Arcane Path Staff
        { id = 80861 }, --Spellweaving Dagger One-Hand, Dagger
    }
}
kQuestInstanceData.WailingCaverns.Horde[9] = {
    Title = "Contra el Sueño de los Kolkar",
    Level = 23,
    Attain = 17,
    Aim = "Mata a Zandara Pezuña de Viento dentro de las Cuevas de los Lamentos, y lleva su cabeza de vuelta a Nalpak en los Baldíos.",
    Location = "Nalpak (Barrens - Cuevas de los Lamentos "..yellow.."47,36"..white..")",
    Note = "Tienes que matar a Zandara Pezuña de Viento [6] y tomar su cabeza.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70224 }, --Kolkar Drape Back
    }
}

--------------- Ragefire Chasm ---------------
kQuestInstanceData.RagefireChasm = {
    Story = "Sima Ígnea consiste en una red de cavernas volcánicas que se encuentran debajo de la nueva ciudad capital de los orcos, Orgrimmar. Recientemente, se han extendido rumores de que un culto leal al demoníaco Consejo de la Sombra se ha instalado en las profundidades ardientes de la Sima. Este culto, conocido como el Filo Ardiente, amenaza la soberanía misma de Durotar. Muchos creen que el Jefe de Guerra orco, Thrall, es consciente de la existencia del Filo y ha decidido no destruirlo con la esperanza de que sus miembros puedan llevarlo directamente al Consejo de la Sombra. De cualquier manera, los poderes oscuros que emanan de Sima Ígnea podrían deshacer todo lo que los orcos han luchado por lograr.",
    Caption = "Sima Ígnea",
    Horde = {}
}
kQuestInstanceData.RagefireChasm.Horde[1] = {
    Title = "Probando la Fuerza de un Enemigo",
    Level = 15,
    Attain = 9,
    Aim = "Busca en Orgrimmar la Sima Ígnea, luego mata 8 Troggs de la Sima Ígnea y 8 Chamán de la Sima Ígnea antes de regresar con Rahauro en Cima del Trueno.",
    Location = "Rahauro (Cima del Trueno - Cima del Ancestro "..yellow.."70,29"..white..")",
    Note = "Encuentras a los troggs al principio.",
}
kQuestInstanceData.RagefireChasm.Horde[2] = {
    Title = "El Poder de Destruir...",
    Level = 16,
    Attain = 9,
    Aim = "Lleva los libros Hechizos de las Sombras y Conjuros del Vacío a Varimathras en Entrañas.",
    Location = "Varimathras (Entrañas - Barrio Real "..yellow.."56,92"..white..")",
    Note = "Los Cultistas y Brujos del Hoja Abrasadora sueltan los libros",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 15449 }, --Ghastly Trousers Legs, Cloth
        { id = 15450 }, --Dredgemire Leggings Legs, Leather
        { id = 15451 }, --Gargoyle Leggings Legs, Mail
    }
}
kQuestInstanceData.RagefireChasm.Horde[3] = {
    Title = "Buscando la Bolsa Perdida",
    Level = 16,
    Attain = 9,
    Aim = "Busca en la Sima Ígnea el cadáver de Maur Totem Siniestro y regístralo en busca de objetos de interés.",
    Location = "Rahauro (Cima del Trueno - Cima del Ancestro "..yellow.."70,29"..white..")",
    Note = "Encuentras a Maur Tótem Siniestro en "..yellow.."[1]"..white..". Después de conseguir la cartera debes llevarla de vuelta a Rahauro en Cima del Trueno",
    Folgequest = "Devolviendo la Bolsa Perdida",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 15452 }, --Featherbead Bracers Wrist, Cloth
        { id = 15453 }, --Savannah Bracers Wrist, Leather
    }
}
kQuestInstanceData.RagefireChasm.Horde[4] = {
    Title = "Enemigos Ocultos",
    Level = 16,
    Attain = 9,
    Aim = "Lleva una Insignia de Teniente a Thrall en Orgrimmar.",
    Location = "Thrall (Orgrimmar - Valle de la Sabiduría "..yellow.."31,37"..white..")",
    Note = "Encuentras a Bazzalan en "..yellow.."[4]"..white.." y a Jergosh en "..yellow.."[3]"..white..". La cadena de misiones comienza con el Jefe de Guerra Thrall en Orgrimmar.",
    Prequest = "Enemigos Ocultos",
    Folgequest = "Enemigos Ocultos",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 15443 }, --Kris of Orgrimmar One-Hand, Dagger
        { id = 15445 }, --Hammer of Orgrimmar Main Hand, Mace
        { id = 15424 }, --Axe of Orgrimmar Two-Hand, Axe
        { id = 15444 }, --Staff of Orgrimmar Staff
    }
}
kQuestInstanceData.RagefireChasm.Horde[5] = {
    Title = "Matar a la Bestia",
    Level = 16,
    Attain = 9,
    Aim = "Entra en la Sima Ígnea y mata a Taragaman el Hambriento, luego lleva su corazón de vuelta a Neeru Hojafuego en Orgrimmar.",
    Location = "Neeru Hojafuego (Orgrimmar - Cueva de las Sombras "..yellow.."49,50"..white..")",
    Note = "Encuentras a Taragaman en "..yellow.."[2]"..white..".",
}

--------------- Uldaman ---------------
kQuestInstanceData.Uldaman = {
    Story = "Uldaman es una antigua cámara de los Titanes que ha permanecido enterrada en las profundidades de la tierra desde la creación del mundo. Las excavaciones de los enanos han penetrado recientemente en esta ciudad olvidada, liberando las primeras creaciones fallidas de los Titanes: los troggs. Las leyendas dicen que los Titanes crearon a los troggs a partir de la piedra. Cuando consideraron que el experimento fue un fracaso, los Titanes encerraron a los troggs e intentaron de nuevo, resultando en la creación de la raza enana. Los secretos de la creación de los enanos están registrados en los legendarios Discos de Norgannon, enormes artefactos de los Titanes que yacen en el fondo de la antigua ciudad. Recientemente, los enanos Hierro Negro han lanzado una serie de incursiones en Uldaman, con la esperanza de reclamar los discos para su maestro ardiente, Ragnaros. Sin embargo, protegiendo la ciudad enterrada hay varios guardianes: construcciones gigantes de piedra viva que aplastan a cualquier intruso desafortunado que encuentren. Los propios Discos están custodiados por un enorme Guardián de Piedra consciente llamado Archaedas. Algunos rumores incluso sugieren que los antepasados de piel de piedra de los enanos, los terráneos, todavía habitan en lo profundo de los recovecos ocultos de la ciudad.",
    Caption = "Uldaman",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Uldaman.Alliance[1] = {
    Title = "Una Señal de Esperanza",
    Level = 35,
    Attain = 33,
    Aim = "Encuentra al Prospector Ryedol y hazle saber que Hammertoe Grez está vivo.",
    Location = "Prospector Ryedol (Tierras Inhóspitas "..yellow.."53,43"..white..")",
    Note = "La misión anterior comienza en el Mapa Arrugado (Tierras Inhóspitas "..yellow.."53,33"..white..").\nEncuentras a Grez Dedomaza antes de entrar en la mazmorra, en "..yellow.."[1]"..white.." en el mapa de Entrada.",
    Prequest = "Una Señal de Esperanza",
    Folgequest = "Amuleto de los Secretos",
}
kQuestInstanceData.Uldaman.Alliance[2] = {
    Title = "Amuleto de los Secretos",
    Level = 40,
    Attain = 35,
    Aim = "Encuentra el Amuleto de Dedoduro y devuélveselo en Uldaman.",
    Location = "Grez Dedomaza (Uldaman "..yellow.."[1] on Entrance Map"..white..").",
    Note = "El Amuleto cae de Magregan Sombraprofunda en "..yellow.."[2] en el mapa de Entrada"..white..".",
    Prequest = "Una Señal de Esperanza",
    Folgequest = "Perspectiva de Fe",
}
kQuestInstanceData.Uldaman.Alliance[3] = {
    Title = "Las Tablas Perdidas de la Voluntad",
    Level = 45,
    Attain = 35,
    Aim = "Encuentra la Tablilla de la Voluntad y llévasela al Consejero Belgrum en Forjaz.",
    Location = "Consejero Belgrum (Forjaz - Sala de los Expedicionarios "..yellow.."77,10"..white..")",
    Note = "La tablilla está en "..yellow.."[8]"..white..".",
    Prequest = "Amuleto de los Secretos -> Un Embajador del Mal",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6723 }, --Medal of Courage Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[4] = {
    Title = "Piedras de Poder",
    Level = 36,
    Attain = 30,
    Aim = "Lleva 8 Piedras de Poder Dentrium y 8 Piedras de Poder An'Alleum a Rigglefuzz en las Tierras Inhóspitas.",
    Location = "Aparejez (Tierras Inhóspitas "..yellow.."42,52"..white..")",
    Note = "Las piedras se pueden encontrar en cualquier enemigo Forjatiniebla antes y dentro de la mazmorra.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9522 }, --Energized Stone Circle Shield
        { id = 10358 }, --Duracin Bracers Wrist, Mail
        { id = 10359 }, --Everlast Boots Feet, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[5] = {
    Title = "El Destino de Agmond",
    Level = 38,
    Attain = 30,
    Aim = "Lleva 4 Urnas de Piedra Talladas al Prospector Ironband en Loch Modan.",
    Location = "Prospector Vetaferro (Loch Modan - Sitio de Excavación de Ironband "..yellow.."65,65"..white..")",
    Note = "La misión anterior comienza con el Prospector Pico Tormenta (Forjaz - Sala de los Expedicionarios "..yellow.."74,12"..white..").\nLas Urnas están dispersas por las cuevas antes de la mazmorra.",
    Prequest = "¡Vetaferro te Quiere! -> Murdaloc",
    Rewards = {
        Text = "Recompensa: ",
        { id = 4980 }, --Prospector Gloves Hands, Leather
    }
}
kQuestInstanceData.Uldaman.Alliance[6] = {
    Title = "Solución para la Perdición",
    Level = 40,
    Attain = 30,
    Aim = "Lleva la Tablilla de Ryun'eh a Theldurin el Perdido.",
    Location = "Theldurin el Perdido (Tierras Inhóspitas "..yellow.."51,76"..white..")",
    Note = "La tablilla está al norte de las cuevas, en el extremo este de un túnel, antes de la mazmorra. En el mapa de Entrada, está en "..yellow.."[3]"..white..".",
    Folgequest = "A Forjaz por el Digest de Yagyin",
    Rewards = {
        Text = "Recompensa: ",
        { id = 4746 }, --Doomsayer's Robe Chest, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[7] = {
    Title = "Los Enanos Perdidos",
    Level = 40,
    Attain = 35,
    Aim = "Encuentra a Baelog en Uldaman.",
    Location = "Prospector Pico Tormenta (Forjaz - Sala de los Expedicionarios "..yellow.."75,12"..white..")",
    Note = "Baelog está en "..yellow.."[1]"..white..".",
    Folgequest = "La Cámara Oculta",
}
kQuestInstanceData.Uldaman.Alliance[8] = {
    Title = "La Cámara Oculta",
    Level = 40,
    Attain = 35,
    Aim = "Lee el Diario de Baelog, explora la cámara oculta, luego informa al Prospector Pico Tormenta.",
    Location = "Baelog (Uldaman "..yellow.."[1]"..white..")",
    Note = "La Cámara Oculta está en "..yellow.."[4]"..white..". Para abrir la Cámara Oculta necesitas El Eje de Tsol de Revelosh "..yellow.."[3]"..white.." y el Medallón de Gni'kiv del Cofre de Baelog "..yellow.."[1]"..white..". Combina estos dos objetos para formar el Báculo de Prehistoria. El Báculo se usa en la Sala de Mapas entre "..yellow.."[3] y [4]"..white.." para invocar a Hierraya. Después de matarla, corre dentro de la habitación de donde salió para obtener crédito de la misión.",
    Prequest = "Los Enanos Perdidos",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9626 }, --Dwarven Charge Two-Hand, Axe
        { id = 9627 }, --Explorer's League Lodestar Held In Off-hand
    }
}
kQuestInstanceData.Uldaman.Alliance[9] = {
    Title = "El Collar Destrozado",
    Level = 41,
    Attain = 37,
    Aim = "Busca al creador original del collar destrozado para conocer su valor potencial.",
    Location = "Collar Destrozado (caída aleatoria en Uldaman)",
    Note = "Lleva el collar a Talvash del Kissel (Forjaz - El Barrio Místico "..yellow.."36,3"..white..").",
    Folgequest = "Conocimiento por un Precio",
}
kQuestInstanceData.Uldaman.Alliance[10] = {
    Title = "Regreso a Uldaman",
    Level = 42,
    Attain = 37,
    Aim = "Busca pistas sobre el paradero actual del collar de Talvash dentro de Uldaman. El paladín asesinado que mencionó fue la última persona que lo tuvo.",
    Location = "Talvash del Kissel (Forjaz - El Barrio Místico "..yellow.."36,3"..white..")",
    Note = "El Paladín está en "..yellow.."[2]"..white..".",
    Prequest = "Conocimiento por un Precio",
    Folgequest = "Encontrar las Gemas",
}
kQuestInstanceData.Uldaman.Alliance[11] = {
    Title = "Encontrar las Gemas",
    Level = 43,
    Attain = 40,
    Aim = "Encuentra el rubí, el zafiro y el topacio que están esparcidos por Uldaman. Una vez adquiridos, contacta a Talvash del Kissel remotamente usando el Frasco de Videncia que te dio anteriormente.$B$BDel diario, sabes...$B* El rubí ha sido escondido en un área de los Forjatiniebla bloqueada.$B* El topacio ha sido escondido en una urna en una de las áreas de los Troggs, cerca de algunos enanos de la Alianza.$B$B* El zafiro ha sido reclamado por Grimlok, el líder de los troggs.",
    Location = "Restos de un Paladín (Uldaman "..yellow.."[2]"..white..")",
    Note = "Las gemas están en "..yellow.."[1]"..white.." en una Urna Llamativa, "..yellow.."[8]"..white.." del Alijo de Forjatiniebla, y "..yellow.."[9]"..white.." de Grimlok. Ten en cuenta que al abrir el Alijo de Forjatiniebla, aparecerán algunos enemigos y te atacarán.\nUsa el Cuenco de adivinación de Talvash para entregar la misión y obtener la siguiente.",
    Prequest = "Regreso a Uldaman",
    Folgequest = "Restaurando el Collar",
}
kQuestInstanceData.Uldaman.Alliance[12] = {
    Title = "Restaurando el Collar",
    Level = 44,
    Attain = 37,
    Aim = "Consigue una fuente de poder del constructo más poderoso que puedas encontrar en Uldaman y entrégasela a Talvash del Kissel en Forjaz.",
    Location = "Talvash's Scrying Bowl",
    Note = "La Fuente de Energía de Collar Fragmentado cae de Archaedas "..yellow.."[10]"..white..".",
    Prequest = "Encontrar las Gemas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 7673 }, --Talvash's Enhancing Necklace Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[13] = {
    Title = "Componentes de Uldaman",
    Level = 42,
    Attain = 36,
    Aim = "Lleva 12 Setas Magenta a Ghak Sanadón en Thelsamar.",
    Location = "Ghak Sanadón (Loch Modan - Thelsamar "..yellow.."37,49"..white..")",
    Note = "Las setas están dispersas por toda la mazmorra. Los herboristas pueden verlas en su minimapa si Rastrear hierbas está activado y tienen la misión.",
    Prequest = "Recolección de Reagentes en las Tierras Inhóspitas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[14] = {
    Title = "Tesoros Recuperados",
    Level = 43,
    Attain = 33,
    Aim = "Consigue la posesión más preciada de Krom Brazorrecio de su cofre en la Sala Común Norte de Uldaman, y llévasela a él en Forjaz.",
    Location = "Krom Brazorrecio (Forjaz - Sala de los Expedicionarios "..yellow.."74,9"..white..")",
    Note = "Encuentras el tesoro antes de entrar en la mazmorra. Está en el norte de las cuevas, en el extremo sureste del primer túnel. En el mapa de entrada, está en "..yellow.."[4]"..white..".",
}
kQuestInstanceData.Uldaman.Alliance[15] = {
    Title = "Los Discos de Platino",
    Level = 47,
    Attain = 40,
    Aim = "Habla con el vigía de piedra y aprende la antigua sabiduría que guarda. Una vez que hayas aprendido lo que tiene para ofrecer, activa los Discos de Norgannon.",
    Location = "Los Discos de Norgannon (Uldaman "..yellow.."[11]"..white..")",
    Note = "Después de recibir la misión, habla con el vigilante de piedra a la izquierda de los discos. Luego usa los discos de platino nuevamente para recibir discos en miniatura, que tendrás que llevar al Alto Expedicionario Magellas en Forjaz - Sala de los Expedicionarios ("..yellow.."69,18"..white.."). La siguiente misión comienza con otro PNJ que está cerca.",
    Folgequest = "Presagios de Uldum",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3",
        { id = 9587 }, --Thawpelt Sack Bag
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[16] = {
    Title = "Poder en Uldaman",
    Level = 40,
    Attain = 35,
    Aim = "Recupera una Fuente de Poder de Obsidiana y llévasela a Tabetha en Los Pantanos de Dustwallow.",
    Location = "Tabetha (Marjal Revolcafango "..yellow.."46,57"..white..")",
    Note = red.."Solo Mago"..white..": La Fuente de Energía de Obsidiana cae del Centinela Obsidiano en "..yellow.."[5]"..white..".",
    Prequest = "El Exorcismo",
    Folgequest = "Oleadas de Maná",
}
kQuestInstanceData.Uldaman.Alliance[17] = { --1.18
    Title = "Robando un Núcleo",
    Level = 45,
    Attain = 45,
    Aim = "Lleva un Núcleo de Energía Intacto de los Tesoros Antiguos de Uldaman a Torble Chisporroteo en los Baldíos del Sur.",
    Location = "Torble Chispamuelle (Los Baldíos "..yellow.."48.6,83"..white.." gnomo con gafas moradas bajo la tienda, junto al enano)",
    Note = "Núcleo de Energía Intacto "..yellow.."[11]"..white..", en la habitación con el disco de platino detrás del último jefe en el cofre detrás del pilar derecho.\nLa cadena de misiones comienza en Los Baldíos del Sur -> Bael Modan -> un poco al norte del camino al Castillo de Bael'dun bajo la tienda. La primera misión se puede obtener al nivel 18, la última al nivel 53",
    Prequest = "Una Adquisición Antigua",
    Folgequest = "La Activación",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}
kQuestInstanceData.Uldaman.Horde[1] = {
    Title = "Piedras de Poder",
    Level = 36,
    Attain = 30,
    Aim = "Lleva 8 Piedras de Poder Dentrium y 8 Piedras de Poder An'Alleum a Rigglefuzz en las Tierras Inhóspitas.",
    Location = "Aparejez (Tierras Inhóspitas "..yellow.."42,52"..white..")",
    Note = "Las piedras se pueden encontrar en cualquier enemigo Forjatiniebla antes y dentro de la mazmorra.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9522 }, --Energized Stone Circle Shield
        { id = 10358 }, --Duracin Bracers Wrist, Mail
        { id = 10359 }, --Everlast Boots Feet, Cloth
    }
}
kQuestInstanceData.Uldaman.Horde[2] = {
    Title = "Solución para la Perdición",
    Level = 40,
    Attain = 30,
    Aim = "Lleva la Tablilla de Ryun'eh a Theldurin el Perdido.",
    Location = "Theldurin el Perdido (Tierras Inhóspitas "..yellow.."51,76"..white..")",
    Note = "La tablilla está al norte de las cuevas, en el extremo este de un túnel, antes de la mazmorra. En el mapa de Entrada, está en "..yellow.."[3]"..white..".",
    Folgequest = "A Forjaz por el Digest de Yagyin",
    Rewards = {
        Text = "Recompensa: ",
        { id = 4746 }, --Doomsayer's Robe Chest, Cloth
    }
}
kQuestInstanceData.Uldaman.Horde[3] = {
    Title = "Recuperación del Collar",
    Level = 41,
    Attain = 37,
    Aim = "Busca un collar valioso dentro del sitio de excavación de Uldaman y llévaselo a Dran Droffers en Orgrimmar. El collar puede estar dañado.",
    Location = "Dran Droffers (Orgrimmar - El Callejón "..yellow.."59,36"..white..")",
    Note = "El collar es una caída aleatoria en la mazmorra.",
    Folgequest = "Recuperación del Collar, Toma 2",
}
kQuestInstanceData.Uldaman.Horde[4] = {
    Title = "Recuperación del Collar, Toma 2",
    Level = 41,
    Attain = 37,
    Aim = "Encuentra una pista sobre el paradero de las gemas en las profundidades de Uldaman.",
    Location = "Dran Droffers (Orgrimmar - El Callejón "..yellow.."59,36"..white..")",
    Note = "El Paladín está en "..yellow.."[2]"..white..".",
    Prequest = "Recuperación del Collar",
    Folgequest = "Traduciendo el Diario",
}
kQuestInstanceData.Uldaman.Horde[5] = {
    Title = "Traduciendo el Diario",
    Level = 42,
    Attain = 37,
    Aim = "Encuentra a alguien que pueda traducir el diario del paladín. El lugar más cercano donde podría haber alguien es Kargath, en las Tierras Inhóspitas.",
    Location = "Restos de un Paladín (Uldaman "..yellow.."[2]"..white..")",
    Note = "El traductor Jarkal Musgofusión está en Kargath (Tierras Inhóspitas "..yellow.."2,46"..white..").",
    Prequest = "Recuperación del Collar, Toma 2",
    Folgequest = "Encontrar las Gemas y la Fuente de Poder",
}
kQuestInstanceData.Uldaman.Horde[6] = {
    Title = "Encontrar las Gemas y la Fuente de Poder",
    Level = 44,
    Attain = 37,
    Aim = "Recupera las tres gemas y una fuente de poder para el collar de Uldaman, y luego llévaselas a Jarkal Musgofusión en Kargath. Jarkal cree que una fuente de poder podría encontrarse en el constructo más fuerte presente en Uldaman.$B$BDel diario, sabes que...$B* El rubí ha sido escondido en un área de los Forjatiniebla bloqueada.$B* El topacio ha sido escondido en una urna en una de las áreas de los Troggs, cerca de algunos enanos de la Alianza.$B* El zafiro ha sido reclamado por Grimlok, el líder de los troggs.",
    Location = "Jarkal Musgofusión (Tierras Inhóspitas - Kargath "..yellow.."2,46"..white..")",
    Note = "Las gemas están en "..yellow.."[1]"..white.." en una Urna Llamativa, "..yellow.."[8]"..white.." del Alijo de Forjatiniebla, y "..yellow.."[9]"..white.." de Grimlok. Ten en cuenta que al abrir el Alijo de Forjatiniebla, aparecerán algunos enemigos y te atacarán. La Fuente de Energía de Collar Fragmentado cae de Archaedas "..yellow.."[10]"..white..".",
    Prequest = "Traduciendo el Diario",
    Folgequest = "Entregar las Gemas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 7888 }, --Jarkal's Enhancing Necklace Neck
    }
}
kQuestInstanceData.Uldaman.Horde[7] = {
    Title = "Componentes de Uldaman",
    Level = 42,
    Attain = 36,
    Aim = "Lleva 12 Setas Magenta a Ghak Sanadón en Thelsamar.",
    Location = "Jarkal Musgofusión (Tierras Inhóspitas - Kargath "..yellow.."2,69"..white..")",
    Note = "También obtienes la misión anterior de Jarkal Musgofusión.\nLas setas están dispersas por toda la mazmorra. Los herboristas pueden verlas en su minimapa si Rastrear hierbas está activado y tienen la misión.",
    Prequest = "Recolección de Reagentes en las Tierras Inhóspitas",
    Folgequest = "Recolección de Reagentes en las Tierras Inhóspitas II",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Horde[8] = {
    Title = "Tesoros Recuperados",
    Level = 43,
    Attain = 33,
    Aim = "Consigue la posesión más preciada de Krom Brazorrecio de su cofre en la Sala Común Norte de Uldaman, y llévasela a él en Forjaz.",
    Location = "Patrick Garrett (Entrañas "..yellow.."72,48"..white..")",
    Note = "Encuentras el tesoro antes de entrar en la mazmorra. Está al final del túnel sur. En el mapa de entrada, está en "..yellow.."[5]"..white..".",
}
kQuestInstanceData.Uldaman.Horde[9] = {
    Title = "Los Discos de Platino",
    Level = 47,
    Attain = 40,
    Aim = "Habla con el vigía de piedra y aprende la antigua sabiduría que guarda. Una vez que hayas aprendido lo que tiene para ofrecer, activa los Discos de Norgannon.",
    Location = "Los Discos de Norgannon (Uldaman "..yellow.."[11]"..white..")",
    Note = "Después de recibir la misión, habla con el vigilante de piedra a la izquierda de los discos. Luego usa los discos de platino nuevamente para recibir discos en miniatura, que tendrás que llevar al Sabio Buscaverdad en Cima del Trueno ("..yellow.."34,46"..white.."). La siguiente misión comienza con otro PNJ que está cerca.",
    Folgequest = "Presagios de Uldum",
    Rewards = {
        Text = "Recompensa: 1 o 2 o 3",
        { id = 9587 }, --Thawpelt Sack Bag
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
    }
}
kQuestInstanceData.Uldaman.Horde[10] = {
    Title = "Poder en Uldaman",
    Level = 40,
    Attain = 35,
    Aim = "Recupera una Fuente de Poder de Obsidiana y llévasela a Tabetha en Los Pantanos de Dustwallow.",
    Location = "Tabetha (Marjal Revolcafango "..yellow.."46,57"..white..")",
    Note = red.."Solo Mago"..white..": La Fuente de Energía de Obsidiana cae del Centinela Obsidiano en "..yellow.."[5]"..white..".",
    Prequest = "El Exorcismo",
    Folgequest = "Oleadas de Maná",
}
kQuestInstanceData.Uldaman.Horde[11] = {
    Title = "Requisando un Núcleo",
    Level = 45,
    Attain = 45,
    Aim = "Lleva un Núcleo de Energía Intacto de los Tesoros Antiguos de Uldaman a Kex Soplamaster en los Baldíos del Sur.",
    Location = "Kex Maestro de Explosiones (Los Baldíos "..yellow.."45.7,83.6"..white.." goblin bajo la tienda.",
    Note = "Núcleo de Energía Intacto "..yellow.."[11]"..white..", en la habitación con el disco de platino detrás del último jefe en el cofre detrás del pilar derecho.\nLa cadena de misiones comienza en Los Baldíos del Sur -> Bael Modan -> lado oeste del camino a Las Mil Agujas, frente a la Excavación de Bael Modan. La primera misión se puede tomar al nivel 18, la última al nivel 53.",
    Prequest = "Una Adquisición Rentable",
    Folgequest = "La Activación Rentable",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}

--------------- Blackrock Depths ---------------
kQuestInstanceData.BlackrockDepths = {
    Story = "Antaño la ciudad capital de los enanos Hierro Negro, este laberinto volcánico ahora sirve como sede de poder para Ragnaros el Señor del Fuego. Ragnaros ha descubierto el secreto para crear vida a partir de la piedra y planea construir un ejército de gólems imparables para ayudarlo a conquistar toda la Montaña Roca Negra. Obsesionado con derrotar a Nefarian y sus secuaces dracónicos, Ragnaros irá a cualquier extremo para lograr la victoria final.",
    Caption = "Profundidades de Roca Negra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockDepths.Alliance[1] = {
    Title = "Legado Hierro Negro",
    Level = 52,
    Attain = 48,
    Aim = "Habla con Franclorn Forgewright si estás interesado en obtener una llave de la ciudad principal.",
    Location = "Franclorn Forjador (Montaña Roca Negra "..yellow.."[3] on Entrance map"..white..")",
    Note = "Franclorn está en medio de la Roca Negra, sobre su tumba. ¡Tienes que estar muerto para verlo! Habla 2 veces con él para comenzar la misión.\nFineous Darkvire está en "..yellow.."[9]"..white..". Encuentras el Santuario junto a la arena "..yellow.."[7]"..white..".",
    Prequest = "Legado Hierro Negro",
    Rewards = {
        Text = "Recompensa: ",
        { id = 11000 }, --Shadowforge Key Key
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[2] = {
    Title = "Ribbly Llavepig",
    Level = 53,
    Attain = 48,
    Aim = "Lleva la Cabeza de Ribbly a Yuka Llaverosca en las Estepas Ardientes.",
    Location = "Yuka Llavenrosca (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,22"..white..")",
    Note = "Obtienes la misión anterior de Yorba Llavenrosca (Tanaris - Puerto Steamwheedle "..yellow.."67,23"..white..").\nRibbly está en "..yellow.."[15]"..white..".",
    Prequest = "Yuka Llavepig",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 11865 }, --Rancor Boots Feet, Cloth
        { id = 11963 }, --Penance Spaulders Shoulder, Leather
        { id = 12049 }, --Splintsteel Armor Chest, Mail
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[3] = {
    Title = "La Poción del Amor",
    Level = 54,
    Attain = 50,
    Aim = "Lleva 4 Gromsblood, 10 Filones de Plata Gigantes y el Frasco Lleno de Nagmara a la Maestra Nagmara en las Profundidades de Roca Negra.",
    Location = "Coima Nagmara (Profundidades de Roca Negra "..yellow.."[15]"..white..")",
    Note = "Obtienes las Vetas de Plata Gigantes de Gigantes en Azshara. Sangre de Grom se puede adquirir más fácilmente de un herborista o en la Casa de Subastas. Por último, el vial se puede llenar en el cráter Go-Lakka (Cráter de Un'goro "..yellow.."31,50"..white..").\nDespués de completar la misión, puedes usar la puerta trasera en lugar de matar a Falange.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 11962 }, --Manacle Cuffs Wrist, Cloth
        { id = 11866 }, --Nagmara's Whipping Belt Waist, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[4] = {
    Title = "Hurley Negrálito",
    Level = 55,
    Attain = 50,
    Aim = "Lleva la Receta Perdida de Cebatruenos a Ragnar Thunderbrew en Kharanos.",
    Location = "Ragnar Cebatruenos  (Dun Morogh - Kharanos "..yellow.."46,52"..white..")",
    Note = "Obtienes la misión anterior de Enohar Cebatruenos (Las Tierras Devastadas - Bastión Nethergarde "..yellow.."61,18"..white..").\nConsigues la receta de uno de los guardias que aparecen si destruyes la cerveza "..yellow.."[15]"..white..".",
    Prequest = "Ragnar Cebatruenos",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3",
        { id = 12003, quantity = 10 }, --Dark Dwarven Lager Potion
        { id = 11964 }, --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 }, --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[5] = {
    Title = "¡Incendius!",
    Level = 56,
    Attain = 48,
    Aim = "¡Encuentra a Lord Incendius en las Profundidades de Roca Negra y destrúyelo!",
    Location = "Jalinda Espiga (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."85,69"..white..")",
    Note = "También obtienes la misión anterior de Jalinda Espiga. Encuentras a Lord Incendius en "..yellow.."[10]"..white..".",
    Prequest = "Maestro Supremo Pyron",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12113 }, --Sunborne Cape Back
        { id = 12114 }, --Nightfall Gloves Hands, Leather
        { id = 12112 }, --Crypt Demon Bracers Wrist, Mail
        { id = 12115 }, --Stalwart Clutch Waist, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[6] = {
    Title = "El Corazón de la Montaña",
    Level = 55,
    Attain = 50,
    Aim = "Lleva el Corazón de la Montaña a Maxwort Uberglint en las Estepas Ardientes.",
    Location = "Maxwort Suprandor (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,23"..white..")",
    Note = "Encuentras el Corazón en "..yellow.."[8]"..white.." en una caja fuerte. Consigues la llave de la caja fuerte de Warder Stillgiss. Aparece después de abrir todas las cajas fuertes pequeñas.",
}
kQuestInstanceData.BlackrockDepths.Alliance[7] = {
    Title = "Lo Bueno",
    Level = 56,
    Attain = 50,
    Aim = "Viaja a las Profundidades de Roca Negra y recupera 20 Riñoneras Hierro Negro. Regresa con Oralius cuando hayas completado esta tarea. Asumes que los enanos Hierro Negro dentro de las Profundidades de Roca Negra llevan estos artefactos de 'riñonera'.",
    Location = "Oralius (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."84,68"..white..")",
    Note = "Todos los enanos pueden soltar los paquetes.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 11883 }, --A Dingy Fanny Pack Container
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[8] = {
    Title = "Mariscal Windsor",
    Level = 54,
    Attain = 48,
    Aim = "Viaja a la Montaña Roca Negra en el noroeste y entra en las Profundidades de Roca Negra. Averigua qué le pasó al Mariscal Windsor.$B$BRecuerdas que Ragged John habló de Windsor siendo arrastrado a una prisión.",
    Location = "Mariscal Maxwell (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."84,68"..white..")",
    Note = "Esto es parte de la cadena de misiones de sintonización de Onyxia. Comienza en Helendis Rivacuerno (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."85,68"..white..").\nEl Mariscal Windsor está en "..yellow.."[4]"..white..". Tienes que volver a Maxwell después de completar esta misión.",
    Prequest = "Amenaza de los Dragonkin -> Los Verdaderos Amos",
    Folgequest = "Esperanza Abandonada",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12018 }, --Conservator Helm Head, Mail
        { id = 12021 }, --Shieldplate Sabatons Feet, Plate
        { id = 12041 }, --Windshear Leggings Legs, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[9] = {
    Title = "Una Nota Arrugada",
    Level = 58,
    Attain = 50,
    Aim = "Puede que hayas tropezado con algo que el Mariscal Windsor estaría interesado en ver. Puede que todavía haya esperanza.",
    Location = "Una Nota Arrugada (caída aleatoria en Profundidades de Roca Negra)",
    Note = "Esto es parte de la cadena de misiones de sintonización de Onyxia. El Mariscal Windsor está en "..yellow.."[4]"..white..". La mejor oportunidad de caída parece ser de los enemigos Hierro Negro alrededor de la Cantera.",
    Prequest = "Esperanza Abandonada",
    Folgequest = "Un Jirón de Esperanza",
}
kQuestInstanceData.BlackrockDepths.Alliance[10] = {
    Title = "Un Jirón de Esperanza",
    Level = 58,
    Attain = 50,
    Aim = "Devuelve la Información Perdida del Mariscal Windsor.$B$BEl Mariscal Windsor cree que la información está en poder del Señor Gólem Argelmach y el General Forjirabia.",
    Location = "Mariscal Windsor (Profundidades de Roca Negra "..yellow.."[4]"..white..")",
    Note = "Esto es parte de la cadena de misiones de sintonización de Onyxia. El Mariscal Windsor está en "..yellow.."[4]"..white..".\nEncuentras al Señor Gólem Argelmach en "..yellow.."[14]"..white..", al General Forjainquina en "..yellow.."[13]"..white..".",
    Prequest = "Una Nota Arrugada",
    Folgequest = "¡Fuga de la Prisión!",
}
kQuestInstanceData.BlackrockDepths.Alliance[11] = {
    Title = "¡Fuga de la Prisión!",
    Level = 58,
    Attain = 50,
    Aim = "Ayuda al Mariscal Windsor a recuperar su equipo y liberar a sus amigos. Regresa con el Mariscal Maxwell si tienes éxito.",
    Location = "Mariscal Windsor (Profundidades de Roca Negra "..yellow.."[4]"..white..")",
    Note = "Esto es parte de la cadena de misiones de sintonización de Onyxia. El Mariscal Windsor está en "..yellow.."[4]"..white..".\nLa misión es más fácil si limpias el Anillo de la Ley ("..yellow.."[6]"..white..") y el camino a la entrada antes de comenzar el evento. Encuentras al Mariscal Maxwell en Las Estepas Ardientes - Vigilancia de Morgan ("..yellow.."84,68"..white..")",
    Prequest = "Un Jirón de Esperanza",
    Folgequest = "Encuentro en Ventormenta",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3",
        { id = 12065 }, --Ward of the Elements Trinket
        { id = 12061 }, --Blade of Reckoning One-Hand, Sword
        { id = 12062 }, --Skilled Fighting Blade One-Hand, Dagger
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[12] = {
    Title = "Un Gusto de Llama",
    Level = 58,
    Attain = 52,
    Aim = "Muéstrale a Cyrus Therepentous la Muda de la Facción del Dragón Negro que recibiste de Kalaran Viento de Hoja.",
    Location = "Cyrus Therepentio (Las Estepas Ardientes "..yellow.."94,31"..white..")",
    Note = "La cadena de misiones comienza en Kalaran Espada Del Viento (La Garganta de Fuego "..yellow.."39,38"..white..").\nBael'Gar está en "..yellow.."[11]"..white..".",
    Prequest = "La Llama Perfecta -> Un Gusto de Llama",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[13] = {
    Title = "Kharan Martillazo",
    Level = 59,
    Attain = 50,
    Aim = "Viaja a las Profundidades de Roca Negra y encuentra a Kharan Mightyhammer.$B$BEl Rey mencionó que Kharan estaba prisionero allí - quizás deberías buscar en una prisión.",
    Location = "Rey Magni Barbabronce (Forjaz "..yellow.."39,55"..white..")",
    Note = "La misión anterior comienza con la Historiadora Real Archesonus (Forjaz "..yellow.."38,55"..white.."). Kharan Martillo Poderoso está en "..yellow.."[2]"..white..".",
    Prequest = "Las Ruinas Humeantes de Thaurissan",
    Folgequest = "El Relato de Kharan",
}
kQuestInstanceData.BlackrockDepths.Alliance[14] = {
    Title = "El Destino del Reino",
    Level = 59,
    Attain = 50,
    Aim = "Regresa a las Profundidades de Roca Negra y rescata a la Princesa Moira Barbabronce de las garras del malvado Emperador Dagran Thaurissan.",
    Location = "Rey Magni Barbabronce (Forjaz "..yellow.."39,55"..white..")",
    Note = "La Princesa Moira Barbabronce está en "..yellow.."[21]"..white..". Durante la pelea, podría curar a Dagran. Intenta interrumpirla tan a menudo como sea posible, ¡pero date prisa ya que no debe morir o no podrás completar la misión! Después de hablar con ella, tienes que volver con Magni Barbabronce.",
    Prequest = "El Portador de Malas Noticias",
    Folgequest = "La Sorpresa de la Princesa",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12548 }, --Magni's Will Ring
        { id = 12543 }, --Songstone of Ironforge Ring
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[15] = {
    Title = "La Armonización con el Núcleo",
    Level = 60,
    Attain = 55,
    Aim = "Viaja al portal de entrada del Núcleo de Magma en las Profundidades de Roca Negra y recupera un Fragmento del Núcleo. Regresa con Lothos Riftwaker en la Montaña Roca Negra cuando hayas recuperado el Fragmento del Núcleo.",
    Location = "Lothos Despertador de Grietas (Montaña Roca Negra "..yellow.."[2] on Entrance Map"..white..")",
    Note = "Después de completar esta misión, puedes usar la piedra junto a Lothos Despertador de Grietas para entrar en el Núcleo de Magma.\nEncuentras el Trozo del Núcleo cerca de "..yellow.."[23]"..white..", muy cerca del portal del Núcleo de Magma.",
}
kQuestInstanceData.BlackrockDepths.Alliance[16] = {
    Title = "El Desafío",
    Level = 60,
    Attain = 58,
    Aim = "Viaja al Círculo de la Ley en las Profundidades de Roca Negra y coloca el Estandarte de la Provocación en su centro mientras eres sentenciado por el Alto Juez Grimstone. Mata a Theldren y sus gladiadores y regresa con Anthion Harmon en las Tierras de la Peste del Este con la primera pieza del amuleto de Lord Valthalak.",
    Location = "Falrin Tallarbol (La Masacre West "..yellow.."[1] Library"..white..")",
    Note = "La misión siguiente es diferente para cada clase. Toda la cadena de misiones comienza con la misión 'Una Proposición Sincera' de Deliana en la sala del Rey de Forjaz, detrás del Banco",
    Prequest = "El Encantamiento del Instigador",
    Folgequest = "(Class Quests)",
}
kQuestInstanceData.BlackrockDepths.Alliance[17] = {
    Title = "El Cáliz Espectral",
    Level = 55,
    Attain = 40,
    Aim = "Las gemas no hacen ruido al caer en las profundidades del cáliz... ",
    Location = "Gloom'rel (Profundidades de Roca Negra "..yellow.."[18]"..white..")",
    Note = red.."Solo Mineros con habilidad 230 o superior pueden obtener esta misión para aprender a Fundir Hierro Negro."..white.." Materiales para el Cáliz: 2 [Rubí Estelar], 20 [Barra de Oro], 10 [Barra de Veraplata]. Después, si tienes [Mineral de Hierro Oscuro] puedes llevarlo a La Forja Negra en "..yellow.."[22]"..white.." y fundirlo.",
}
kQuestInstanceData.BlackrockDepths.Alliance[18] = {
    Title = "Operación Ayuda a Jabbey",
    Level = 58,
    Attain = 50,
    Aim = "Adéntrate en las Profundidades de Roca Negra y recupera el 'Rapé Extremadamente Potente' de Darneg Darkbeard cerca de la Domicilia, para Jabbey en Puerto Bonvapor en Tanaris.",
    Location = "Jabbey (Tanaris, Puerto Steamwheedle "..yellow.."67,24"..white..")",
    Note = "La cadena de misiones comienza con Bixxle Tornillos (Tel'Abim "..yellow.."52,34"..white.."). Cae de Darneg Barbanegra. Recompensas de la misión Operación Reparaciones Finales (Collares) y la misión final - El Desacreditador de Hierro Oscuro (Arma de fuego).",
    Prequest = "Operación Tornillofusible 1000 -> Operación ARREGLAR Tornillofusible 1000",
    Folgequest = "Operación Ayuda a Jabbey 2 -> Operación Regreso a Tornillofusible -> Operación Reparaciones Finales -> Secretos del Profanador Hierro Negro -> El Profanador Hierro Negro",
    Rewards = {
        Text = "Recompensa: 1 o 2 y 3",
        { id = 60996 }, --Bixxle's Necklace of Control Neck
        { id = 60997 }, --Bixxle's Necklace of Mastery Neck
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[19] = {
    Title = "El Profanador Hierro Negro",
    Level = 60,
    Attain = 55,
    Aim = "Recolecta un Rifle Hierro Negro, un Condensador de Magma, un Cañón de Arcanita Intrincado y un Fragmento Fundido para Bixxle Tuercafundida en el Almacén de Bixxle en Tel'Abim.",
    Location = "Bixxle Tornillos (Isla Tel'Abim al este de Tanaris)",
    Note = "Esta misión requiere recolectar 4 objetos.\n1) Condensador de Magma (Profundidades de Roca Negra en Caja de Condensador de Magma) \n2) Barril de Arcanita Intrincado (Cumbre de Roca Negra en contenedor de Barriles de Arcanita Intrincados)\n3) Fragmento Fundido (Núcleo de Magma de Destructor Fundido).\n4) Rifle Hierro Negro (fabricado por Ingenieros).\nPara terminar la construcción, también necesitaré Núcleo de Fuego(x3) encontrado en Núcleo de Magma, y Barras de Torio Encantado(x10).",
    Prequest = "Operación Ayuda a Jabbey -> Secretos del Profanador Hierro Negro",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[20] = {
    Title = "Venganza Senatorial",
    Level = 56,
    Attain = 45,
    Aim = "Mata 25 Senadores Forjatiniebla en lo profundo de las Profundidades de Roca Negra para Orvak Sternrock en el Paso Roca Negra en las Estepas Ardientes.",
    Location = "Orvak Roca Severa (después del paso Montañas Crestagrana - Las Estepas Ardientes "..yellow.."76,68"..white..", al oeste del campamento de la alianza)",
    Note = "Esta cadena de misiones comienza con Radgan Llamaprofunda junto a Orvak Roca Severa con la misión 'Ganando la Confianza de Orvak'",
    Prequest = "Ganando la Confianza de Orvak -> Escuchando la Historia de Orvak -> El Alijo de Sternrock",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60668 }, --Badge of Shadowforge Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[21] = {
    Title = "El Núcleo del Gólem Arcano",
    Level = 55,
    Attain = 45,
    Aim = "Encuentra y recolecta un Núcleo de Gólem Arcano del Señor de los Gólems Argelmach en las Profundidades de Roca Negra y llévaselo a Radgan Llama Profunda en el Paso de Roca Negra en las Estepas Ardientes.",
    Location = " Radgan Llamaprofunda (después del paso Montañas Crestagrana - Las Estepas Ardientes "..yellow.."76,68"..white..", al oeste del campamento de la alianza)",
    Note = "Esta cadena de misiones comienza con Radgan Llamaprofunda junto a Orvak Roca Severa con la misión 'Ganando la Confianza de Orvak'",
    Prequest = "Ganando la Confianza de Orvak -> Escuchando la Historia de Orvak -> El Alijo de Sternrock -> Descubriendo los Secretos de los Gólems -> Para Comprar Información Secreta",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60672 }, --Energized Golem Core Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[22] = {
    Title = "Para Construir un Golpeador",
    Level = 60,
    Attain = 30,
    Aim = "Consigue el Servo Sintonizado de Torio de la Armería del Monasterio Escarlata, obtén el Núcleo de Gólem Perfecto en las Profundidades de Roca Negra de Lord Argelmach Gólem, encuentra la Vara de Adamantita en Stratholme. Regresa con Oglethorpe Obnoticus.",
    Location = "Oglethorpe Obnoticus <Master Ingeniero Gnomo> (Vega de Tuercespina; Bahía del Botín "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Solo Ingenieros)"..white.."Esta misión requiere recolectar 3 objetos. \n1) Servo Sintonizado de Torio (Monasterio Escarlata de Mirmidón Escarlata)\n2) Núcleo de Gólem Perfecto (Profundidades de Roca Negra de Señor Gólem Argelmach)\n3) Varita de Adamantita (Stratholme de Forjamartillos Carmesí)\n'Golpeamasa 9-60' en Gnomeregan suelta 'Estampador Intacto' que inicia la Misión Anterior 'Un Golpe en la Cabeza'.",
    Prequest = "Un Golpe en la Cabeza"..red.."(Engineers only)", --80398
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[23] = {
    Title = "Cerveza del Festín de Invierno",
    Level = 55,
    Attain = 45,
    Aim = "Recupera el Barril del Festival de Invierno en las cavernas de las Profundidades de Roca Negra para Bomarn Hachafuego en el Valle del Festival de Invierno.",
    Location = "Bomarn Hachafuego at Valle del Velo Invernal",
    Note = red.."¡DISPONIBLE SOLO mientras el evento del Festival de Invierno está activo!"..white.."Esos cobardes Hierro Negro lo robaron, sin duda escondido en su taberna "..yellow.."[15]"..white.." en lo profundo de las Profundidades de Roca Negra.",
}
for i = 1, 3 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end
kQuestInstanceData.BlackrockDepths.Horde[4] = {
    Title = "Receta Perdida de Cebatruenos",
    Level = 55,
    Attain = 50,
    Aim = "Lleva la Receta Perdida de Cebatruenos a Vivian Lagrave en Kargath.",
    Location = "Maga Oscura Vivian Lagrave (Tierras Inhóspitas - Kargath "..yellow.."2,47"..white..")",
    Note = "Obtienes la misión anterior de la Boticaria Zinge en Entrañas - El Apothecarium ("..yellow.."50,68"..white..").\nObtienes la receta de uno de los guardias que aparecen si destruyes la cerveza "..yellow.."[15]"..white..".",
    Prequest = "Vivian Lagrave",
    Rewards = {
        Text = "Recompensa: 1 y 2 y 3 o 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 11964 }, --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 }, --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Horde[5] = {
    Title = "El Corazón de la Montaña",
    Level = 55,
    Attain = 50,
    Aim = "Lleva el Corazón de la Montaña a Maxwort Uberglint en las Estepas Ardientes.",
    Location = "Maxwort Suprandor (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,23"..white..")",
    Note = "Encuentras el Corazón en "..yellow.."[8]"..white.." en una caja fuerte. Obtienes la llave de la caja fuerte de Carcelero Stillgiss. Aparece después de abrir todas las cajas fuertes pequeñas.",
}
kQuestInstanceData.BlackrockDepths.Horde[6] = {
    Title = "MATAR AL VER: Enanos Hierro Negro",
    Level = 52,
    Attain = 48,
    Aim = "Viaja a las Profundidades de Roca Negra y destruye a los viles agresores.$B$BEl Señor de la Guerra Goretooth quiere que mates a 15 Guardias Yunque Colérico, 10 Celadores Yunque Colérico y 5 Soldados de Infantería Yunque Colérico. Regresa con él una vez completada tu tarea.",
    Location = "Sign Post (Tierras Inhóspitas - Kargath "..yellow.."3,47"..white..")",
    Note = "Encuentras a los enanos en la primera parte de Profundidades de Roca Negra.\nEncuentras al Señor de la Guerra Dientegore en Kargath en la cima de la torre (Tierras Inhóspitas, "..yellow.."5,47"..white..").",
    Folgequest = "MATAR AL VER: Oficiales de Alto Rango Hierro Negro",
}
kQuestInstanceData.BlackrockDepths.Horde[7] = {
    Title = "MATAR AL VER: Oficiales de Alto Rango Hierro Negro",
    Level = 54,
    Attain = 50,
    Aim = "Viaja a las Profundidades de Roca Negra y destruye a los viles agresores.$B$BEl Señor de la Guerra Goretooth quiere que mates a 10 Médicos Yunque Colérico, 10 Soldados Yunque Colérico y 10 Oficiales Yunque Colérico. Regresa con él una vez completada tu tarea.",
    Location = "Sign Post (Tierras Inhóspitas - Kargath "..yellow.."3,47"..white..")",
    Note = "Encuentras a los enanos cerca de Bael'Gar "..yellow.."[11]"..white..". Encuentras al Señor de la Guerra Dientegore en Kargath en la cima de la torre (Tierras Inhóspitas, "..yellow.."5,47"..white..").\n La misión siguiente comienza con Lexlort (Tierras Inhóspitas - Kargath "..yellow.."5,47"..white.."). Encuentras a Grark Lorkrub en Las Estepas Ardientes ("..yellow.."38,35"..white.."). Tienes que reducir su vida por debajo del 50% para atarlo e iniciar una misión de Escolta.",
    Prequest = "MATAR AL VER: Enanos Hierro Negro",
    Folgequest = "Grark Lorkrub -> Predicamento Precario (Escort quest)",
}
kQuestInstanceData.BlackrockDepths.Horde[8] = {
    Title = "Operación: Muerte a Forjira",
    Level = 58,
    Attain = 52,
    Aim = "Viaja a las Profundidades de Roca Negra y mata al General Angerforge. Regresa con el Señor de la Guerra Goretooth cuando hayas completado la tarea.",
    Location = "Señor de la Guerra Dientegore (Tierras Inhóspitas - Kargath "..yellow.."5,47"..white..")",
    Note = "Encuentras al General Forjainquina en "..yellow.."[13]"..white..". ¡Pide ayuda por debajo del 30%!\nLa cadena de misiones comienza con Lexlort (Tierras Inhóspitas - Kargath, en la torre) con la misión 'Grark Lorkrub'.",
    Prequest = "Grark Lorkrub -> Predicamento Precario",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12059 }, --Conqueror's Medallion Neck
    }
}
kQuestInstanceData.BlackrockDepths.Horde[9] = {
    Title = "El Ascenso de las Máquinas",
    Level = 58,
    Attain = 52,
    Aim = "Viaja a las Estepas Ardientes y recupera 10 Fragmentos de Elemental Fracturado para la Hierofante Theodora Mulvadania.$B$BRecuerdas que Theodora mencionó que los golems y elementales de esa región son una fuente de estos fragmentos.",
    Location = "Lotwil Veriatus (Tierras Inhóspitas "..yellow.."25,44"..white..")",
    Note = "Obtienes la misión anterior de la Hierofante Theodora Mulvadania (Tierras Inhóspitas - Kargath "..yellow.."3,47"..white..").\nEncuentras a Argelmach en "..yellow.."[14]"..white..".",
    Prequest = "El Ascenso de las Máquinas",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12109 }, --Azure Moon Amice Back
        { id = 12110 }, --Raincaster Drape Back
        { id = 12108 }, --Basaltscale Armor Chest, Mail
        { id = 12111 }, --Lavaplate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Horde[10] = {
    Title = "Un Gusto de Llama",
    Level = 58,
    Attain = 52,
    Aim = "Muéstrale a Cyrus Therepentous la Muda de la Facción del Dragón Negro que recibiste de Kalaran Viento de Hoja.",
    Location = "Cyrus Therepentio (Las Estepas Ardientes "..yellow.."94,31"..white..")",
    Note = "La cadena de misiones comienza con Kalaran Espada Del Viento (La Garganta de Fuego "..yellow.."39,38"..white..").\nBael'Gar está en "..yellow.."[11]"..white..".",
    Prequest = "La Llama Perfecta -> Un Gusto de Llama",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Horde[11] = {
    Title = "Desarmonía del Fuego",
    Level = 56,
    Attain = 48,
    Aim = "Entra en las Profundidades de Roca Negra y localiza a Lord Incendius. Mátalo y devuelve cualquier fuente de información que encuentres a Thunderheart.",
    Location = "Corazón Atronador (Tierras Inhóspitas - Kargath "..yellow.."3,48"..white..")",
    Note = "Obtienes la misión anterior de Corazón Atronador también.\nEncuentras a Lord Incendius en "..yellow.."[10]"..white..".",
    Prequest = "Desarmonía de la Llama",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12113 }, --Sunborne Cape Back
        { id = 12114 }, --Nightfall Gloves Hands, Leather
        { id = 12112 }, --Crypt Demon Bracers Wrist, Mail
        { id = 12115 }, --Stalwart Clutch Waist, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Horde[12] = {
    Title = "The Last Element",
    Level = 54,
    Attain = 48,
    Aim = "Viaja a Profundidades de Roca Negra y recupera 10 Esencias de los Elementos. Tu primera inclinación es buscar a los gólems y creadores de gólems. Recuerdas que Vivian Lagrave también murmuraba algo sobre elementales.",
    Location = "Maga Oscura Vivian Lagrave (Tierras Inhóspitas - Kargath "..yellow.."2,47"..white..")",
    Note = "Obtienes la misión anterior de Corazón Atronador (Tierras Inhóspitas - Kargath "..yellow.."3,48"..white..").\n Cada elemental puede soltar la Esencia",
    Prequest = "Desarmonía de la Llama",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12038 }, --Lagrave's Seal Ring
    }
}
kQuestInstanceData.BlackrockDepths.Horde[13] = {
    Title = "Comandante Gor'shak",
    Level = 52,
    Attain = 48,
    Aim = "Encuentra al Comandante Gor'shak en las Profundidades de Roca Negra.$B$BRecuerdas que el dibujo tosco del orco incluía barras sobre el retrato. Quizás deberías buscar una prisión de algún tipo.",
    Location = "Galamav el Tirador (Tierras Inhóspitas - Kargath "..yellow.."5,47"..white..")",
    Note = "Obtienes la misión anterior de Corazón Atronador (Tierras Inhóspitas - Kargath "..yellow.."3,48"..white..").\nEncuentras al Comandante Gor'Shak en "..yellow.."[3]"..white..". La llave para abrir la prisión cae de la Alta Interrogadora Gerstahn "..yellow.."[5]"..white..". Si hablas con él e inicias la siguiente Misión, aparecen enemigos.",
    Prequest = "Desarmonía de la Llama",
    Folgequest = "¿Qué Está Pasando?",
}
kQuestInstanceData.BlackrockDepths.Horde[14] = {
    Title = "El Rescate Real",
    Level = 59,
    Attain = 48,
    Aim = "Mata al Emperador Dagran Thaurissan y libera a la Princesa Moira Barbabronce de su malvado hechizo.",
    Location = "Thrall (Orgrimmar "..yellow.."31,37"..white..")",
    Note = "Después de hablar con Kharan Martillo Poderoso y Thrall obtienes esta misión.\nEncuentras al Emperador Dagran Thaurissan en "..yellow.."[21]"..white..". La Princesa cura a Dagran, ¡pero no debes matarla para completar la misión! Intenta interrumpir sus hechizos de curación. (¿Las recompensas son por La Princesa Salvada?)",
    Prequest = "Comandante Gor'shak -> ¿Qué Está Pasando? (x2) -> El Reino del Este",
    Folgequest = "¿La Princesa Rescatada?",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12544 }, --Thrall's Resolve Ring
        { id = 12545 }, --Eye of Orgrimmar Ring
    }
}
for i = 15, 23 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end

--------------- Guarida de Alanegra ---------------
kQuestInstanceData.BlackwingLair = {
    Story = {
	    ["Page1"] = "La Guarida de Alanegra se encuentra en lo más alto de la Cumbre de Roca Negra. Es allí, en los oscuros recovecos de la cima de la montaña, donde Nefarian ha comenzado a desplegar las etapas finales de su plan para destruir a Ragnaros de una vez por todas y llevar a su ejército a la supremacía indiscutible sobre todas las razas de Azeroth.",
	    ["Page2"] = "La poderosa fortaleza excavada en las entrañas ardientes de la Montaña Roca Negra fue diseñada por el maestro enano-albañil, Franclorn Forgewright. Destinada a ser el símbolo del poder del Hierro Negro, la fortaleza fue mantenida por los siniestros enanos durante siglos. Sin embargo, Nefarian, el astuto hijo del dragón Alamuerte, tenía otros planes para la gran fortaleza. Él y sus secuaces dracónicos tomaron el control de la Cumbre superior y le declararon la guerra a las posesiones de los enanos en las profundidades volcánicas de la montaña, que sirven como sede de poder para Ragnaros el Señor del Fuego. Ragnaros ha descubierto el secreto para crear vida a partir de la piedra y planea construir un ejército de gólems imparables para ayudarlo a conquistar toda la Montaña Roca Negra.",
	    ["Page3"] = "Nefarian ha jurado aplastar a Ragnaros. Con este fin, recientemente ha comenzado a reforzar sus fuerzas, tal como su padre Alamuerte había intentado hacer en épocas pasadas. Sin embargo, donde Alamuerte fracasó, ahora parece que el intrigante Nefarian podría estar teniendo éxito. La loca apuesta de Nefarian por el dominio incluso ha atraído la ira del Vuelo Rojo, que siempre ha sido el mayor enemigo del Vuelo Negro. Aunque las intenciones de Nefarian son conocidas, los métodos que está utilizando para lograrlas siguen siendo un misterio. Se cree, sin embargo, que Nefarian ha estado experimentando con la sangre de todos los diversos Vuelos de Dragón para producir guerreros imparables.\n \nEl santuario de Nefarian, la Guarida de Alanegra, se encuentra en lo más alto de la Cumbre de Roca Negra. Es allí, en los oscuros recovecos de la cima de la montaña, donde Nefarian ha comenzado a desplegar las etapas finales de su plan para destruir a Ragnaros de una vez por todas y llevar a su ejército a la supremacía indiscutible sobre todas las razas de Azeroth.",
	    ["MaxPages"] = "3",
	},
    Caption = {
        "Guarida de Alanegra",
        "Guarida de Alanegra (Parte de la historia 1)",
        "Guarida de Alanegra (Parte de la historia 2)",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackwingLair.Alliance[1] = {
    Title = "La Corrupción de Nefarius",
    Level = 60,
    Attain = 60,
    Aim = "Mata a Nefarian y recupera el Fragmento del Cetro Rojo. Devuelve el Fragmento del Cetro Rojo a Anachronos en las Cavernas del Tiempo en Tanaris. Tienes 5 horas para completar esta tarea.",
    Location = "Vaelastrasz el Corrupto (Guarida de Alanegra "..yellow.."[2]"..white..")",
    Note = "Solo una persona puede despojar el Fragmento. Anacronos (Tanaris - Cavernas del Tiempo "..yellow.."65,49"..white..")",
    Prequest = "La Carga de los Vuelos de Dragones",
    Folgequest = "El Poder de Kalimdor (Must complete green & blue quest chains as well)",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 21530 }, --Onyx Embedded Leggings Legs, Mail
        { id = 21529 }, --Amulet of Shadow Shielding Neck
    }
}
kQuestInstanceData.BlackwingLair.Alliance[2] = {
    Title = "El Señor de Roca Negra",
    Level = 60,
    Attain = 60,
    Aim = "Devuelve la Cabeza de Nefarian al Alto Señor Bolvar Fordragón en Ventormenta.",
    Location = "Cabeza de Nefarian (cae de Nefarian "..yellow.."[9]"..white..")",
    Note = "El Alto Señor Bolvar ForDragón está en (Ciudad de Ventormenta - Castillo de Ventormenta "..yellow.."78,20"..white.."). La siguiente misión te envía al Mariscal Afrasiabi (Ventormenta - Valle de los Héroes "..yellow.."67,72"..white..") para la recompensa.",
    Folgequest = "El Señor de Roca Negra",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 19383 }, --Master Dragonslayer's Medallion Neck
        { id = 19366 }, --Master Dragonslayer's Orb Held In Off-hand
        { id = 19384 }, --Master Dragonslayer's Ring Ring
    }
}
kQuestInstanceData.BlackwingLair.Alliance[3] = {
    Title = "Solo Uno Puede Alzarse",
    Level = 60,
    Attain = 60,
    Aim = "Devuelve la Cabeza del Señor de la Prole Lativeneno a Baristolth de las Arenas Cambiantes en el Bastión del Honor en Silithus.",
    Location = "Cabeza del Señor de la Cría Capazote (cae del Señor de Prole Capazote "..yellow.."[3]"..white..")",
    Note = "Solo una persona puede recoger la cabeza.",
    Prequest = "Lo que el Mañana Trae",
    Folgequest = "El Camino del Justo",
}
kQuestInstanceData.BlackwingLair.Alliance[4] = {
    Title = "La Única Receta",
    Level = 60,
    Attain = 60,
    Aim = "Recupera los 8 capítulos perdidos de Dracónico para Tontos y combínalos con la Encuadernación Mágica de Libros y devuelve el libro completo de Dracónico para Tontos: Volumen II a Narain Soothfancy en Tanaris.",
    Location = "Narain Sabelotodo (Tanaris "..yellow.."65,18"..white..")",
    Note = "El capítulo puede ser despojado por varias personas. Dracónico para Principiantes (despojado de una mesa "..green.."[2']"..white..")",
    Prequest = "¡Señuelo!",
    Folgequest = "Las Buenas y las Malas Noticias (Debes completar las cadenas de misiones de Stewvul, Ex-B.F.F. y Nunca me preguntes sobre mi negocio)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.BlackwingLair.Alliance[5] = {
    Title = "La Llave de Karazhan IX",
    Level = 60,
    Attain = 58,
    Aim = "Encuentra 'Tratado sobre Cerraduras y Llaves Mágicas' y llévaselo a Vandol. Se rumorea que se guarda en el Cubil de Alanegra.",
    Location = "Dolvan Vientofirme (Marjal Revolcafango - Hondonada Westhaven  "..yellow.."71,73"..white..")",
    Note = "Misión anterior - Lord Ebonlocke (Salones Inferiores de Karazhan). El libro 'Tratado sobre Cerraduras y Llaves Mágicas' está en la habitación del último jefe "..yellow.."[9]"..white..", junto al trono. Recompensa de la siguiente misión.",
    Prequest = "La Llave de Karazhan VIII (DMW)",
    Folgequest = "La Llave de Karazhan X",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61234 }, --Upper Karazhan Tower Key Key
    }
}
kQuestInstanceData.BlackwingLair.Alliance[6] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 58,
    Aim = "Mata a Clawlord Howlfang e informa a Lord Cerro Negro.",
    Location = "Archidruida Vientosueño (Hyjal - Nordanaar "..yellow.."84.8,29.3"..white.." piso superior del gran árbol)",
    Note = "Nefarian "..yellow.."[9]"..white.." suelta 'Copia Quemada de Vorgendor'.\nLa cadena de misiones comienza con el objeto legendario de caída rara 'La Guadaña de Elune' del jefe Lord Bosquenegro II en "..yellow.."[Karazhan]"..white..".",
    Prequest = "Guadaña de la Diosa",
    Folgequest = "Guadaña de la Diosa"..yellow.."[Upper Karazhan]"..white.." ", -- 41087
}
kQuestInstanceData.BlackwingLair.Horde[1] = kQuestInstanceData.BlackwingLair.Alliance[1]
kQuestInstanceData.BlackwingLair.Horde[2] = {
    Title = "El Señor de Roca Negra",
    Level = 60,
    Attain = 60,
    Aim = "Devuelve la Cabeza de Nefarian al Alto Señor Bolvar Fordragón en Ventormenta.",
    Location = "Cabeza de Nefarian (cae de Nefarian "..yellow.."[9]"..white..")",
    Note = "La siguiente misión te envía al Alto Señor de la Guerra Colmillosauro (Orgrimmar - Valle de la Fuerza "..yellow.."51,76"..white..") para la recompensa.",
    Folgequest = "El Señor de Roca Negra",
    Rewards = kQuestInstanceData.BlackwingLair.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.BlackwingLair.Horde[i] = kQuestInstanceData.BlackwingLair.Alliance[i]
end

--------------- Blackfathom Deeps ---------------
kQuestInstanceData.BlackfathomDeeps = {
    Story = "Situado a lo largo de la Costa de Zoram de Vallefresno, Cavernas de Brazanegra fue una vez un glorioso templo dedicado a la diosa de la luna de los elfos de la noche, Elune. Sin embargo, el gran Cataclismo destrozó el templo, hundiéndolo bajo las olas del Mar Velado. Allí permaneció intacto, hasta que, atraídos por su antiguo poder, los naga y los sátiros emergieron para sondear sus secretos. Las leyendas sostienen que la antigua bestia, Aku'mai, se ha instalado dentro de las ruinas del templo. Aku'mai, una mascota favorita de los primordiales Dioses Antiguos, ha depredado el área desde entonces. Atraídos por la presencia de Aku'mai, el culto conocido como el Martillo Crepuscular también ha venido a disfrutar de la malvada presencia de los Dioses Antiguos.",
    Caption = "Cavernas de Brazanegra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackfathomDeeps.Alliance[1] = {
    Title = "Conocimiento en las Profundidades",
    Level = 23,
    Attain = 10,
    Aim = "Lleva el Manuscrito de Lorgalis a Gerrig Bonegrip en la Caverna Forlorn en Forjaz.",
    Location = "Gerrig Agarrahueso (Forjaz - La Caverna Lúgubre "..yellow.."50,5"..white..")",
    Note = "Encuentras el Manuscrito en "..yellow.."[2]"..white.." en el agua.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6743 }, --Sustaining Ring Ring
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[2] = {
    Title = "Investigando la Corrupción",
    Level = 24,
    Attain = 18,
    Aim = "Gershala Susurro Nocturno en Auberdine quiere 8 Tallos Cerebrales Corruptos.",
    Location = "Gershala Susurro Nocturno (Costa Oscura - Auberdine "..yellow.."38,43"..white..")",
    Note = "Lo obtienes de Argos Susurro Nocturno en (Ventormenta - El Parque "..yellow.."21,55"..white.."). \n\nTodos los Nagas antes y en Cavernas de Brazanegra sueltan los cerebros.",
    Prequest = "La Corrupción en el Extranjero",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 7003 }, --Beetle Clasps Wrist, Mail
        { id = 7004 }, --Prelacy Cape Back
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[3] = {
    Title = "En Busca de Thaelrid",
    Level = 24,
    Attain = 18,
    Aim = "Busca al Guardia Argenta Thaelrid en las Cavernas de Brazanegra.",
    Location = "Shaedlass Guardalbas (Darnassus - Bancal de los Artesanos "..yellow.."55,24"..white..")",
    Note = "Encuentras al Explorador Argenta Thaelrid en "..yellow.."[4]"..white..".",
    Folgequest = "Villanía de Foso Negro",
}
kQuestInstanceData.BlackfathomDeeps.Alliance[4] = {
    Title = "Villanía de Foso Negro",
    Level = 27,
    Attain = 18,
    Aim = "Lleva la cabeza del Señor Crepuscular Kelris a Dawnwatcher Selgorm en Darnassus.",
    Location = "Explorador Argenta Thaelrid (Cavernas de Brazanegra "..yellow.."[4]"..white..")",
    Note = "El Señor Crepuscular Kelris está en "..yellow.."[8]"..white..". Encuentras a Selgorm Guardalbas en Darnassus - Bancal de los Artesanos ("..yellow.."55,24"..white.."). \n\n¡ATENCIÓN! Si enciendes las llamas junto a Lord Kelris, aparecen enemigos y te atacan.",
    Prequest = "En Busca de Thaelrid",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 7001 }, --Gravestone Scepter Wand
        { id = 7002 }, --Arctic Buckler Shield
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[5] = {
    Title = "Cae el Crepúsculo",
    Level = 25,
    Attain = 20,
    Aim = "Lleva 10 Colgantes Crepusculares al Guardia Argenta Manados en Darnassus.",
    Location = "Guardia Argenta Manados (Darnassus - Bancal de los Artesanos "..yellow.."55,23"..white..")",
    Note = "Cada enemigo Crepuscular puede soltar los colgantes.",
    Rewards = {
        Text = "Rewards:",
        { id = 6998 }, --Nimbus Boots Feet, Cloth
        { id = 7000 }, --Heartwood Girdle Waist, Leather
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[6] = {
    Title = "El Orbe de Soran'ruk",
    Level = 25,
    Attain = 20,
    Aim = "Encuentra 3 Fragmentos de Soran'ruk y 1 Fragmento Grande de Soran'ruk y llévaselos a Doan Karhan en Los Baldíos.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Solo Brujo"..white..": Obtienes los 3 Fragmentos de Soran'ruk de Acólitos Crepusculares en "..yellow.."[Cavernas de Brazanegra]"..white..". Obtienes el Fragmento Grande de Soran'ruk en "..yellow.."[Castillo de Colmillo Oscuro]"..white.." de Colmillo de las Sombras Darksouls.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[1] = {
    Title = "La Esencia de Aku'Mai",
    Level = 22,
    Attain = 17,
    Aim = "Lleva 20 Zafiros de Aku'Mai a Je'neu Sancrea en Vallefresno.",
    Location = "Je'neu Sancrea (Vallefresno - Avanzada Zoram'gar "..yellow.."11,33"..white..")",
    Note = "Obtienes la misión anterior Problemas en las Profundidades de Tsunaman (Sierra Espolón - Refugio Roca del Sol "..yellow.."47,64"..white.."). Los cristales se pueden encontrar en los túneles antes de la instancia.",
    Prequest = "Problemas en las Profundidades",
    Folgequest = "Entre las Ruinas",
}
kQuestInstanceData.BlackfathomDeeps.Horde[2] = {
    Title = "Lealtad a los Dioses Antiguos",
    Level = 26,
    Attain = 17,
    Aim = "Lleva la Nota Húmeda a Je'neu Sancrea en Vallefresno.",
    Location = "Nota Empapada (drop - see note)",
    Note = "Obtienes la Nota Empapada de la Sacerdotisa de las Mareas Brazanegra (5% tasa de caída). Luego llévala a Je'neu Sancrea (Vallefresno - Avanzada Zoram'gar "..yellow.."11,33"..white.."). Lorgus Jett está en "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 17694 }, --Band of the Fist Ring
        { id = 17695 }, --Chestnut Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[3] = {
    Title = "Entre las Ruinas",
    Level = 27,
    Attain = 21,
    Aim = "Lleva el Núcleo de las Profundidades a Je'neu Sancrea en el Campamento Zoram'gar, Vallefresno.",
    Location = "Je'neu Sancrea (Vallefresno - Avanzada Zoram'gar "..yellow.."11,33"..white..")",
    Note = "Encuentras el Núcleo de Profundidades en "..yellow.."[7]"..white.." en el agua. Cuando obtienes el núcleo, el Barón Aquanis aparece y te ataca. Suelta un objeto de misión que tienes que llevar de vuelta a Je'neu Sancrea.",
}
kQuestInstanceData.BlackfathomDeeps.Horde[4] = {
    Title = "Villanía de Foso Negro",
    Level = 27,
    Attain = 18,
    Aim = "Lleva la cabeza del Señor Crepuscular Kelris a Dawnwatcher Selgorm en Darnassus.",
    Location = "Argent guard Thaelrid (Cavernas de Brazanegra "..yellow.."[4]"..white..")",
    Note = "El Señor Crepuscular Kelris está en "..yellow.."[8]"..white..". Encuentras a Bashana Runatótem en Cima del Trueno - La Cima del Ancestro ("..yellow.."70,33"..white.."). \n\n¡ATENCIÓN! Si enciendes las llamas junto a Lord Kelris, aparecen enemigos y te atacan.",
    Rewards = kQuestInstanceData.BlackfathomDeeps.Alliance[4].Rewards
}
kQuestInstanceData.BlackfathomDeeps.Horde[5] = {
    Title = "El Orbe de Soran'ruk",
    Level = 25,
    Attain = 20,
    Aim = "Encuentra 3 Fragmentos de Soran'ruk y 1 Fragmento Grande de Soran'ruk y llévaselos a Doan Karhan en Los Baldíos.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Solo Brujo"..white..": Obtienes los 3 Fragmentos de Soran'ruk de Acólitos Crepusculares en "..yellow.."[Cavernas de Brazanegra]"..white..". Obtienes el Fragmento Grande de Soran'ruk en "..yellow.."[Castillo de Colmillo Oscuro]"..white.." de Colmillo de las Sombras Darksouls.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[6] = {
    Title = "Barón Aquanis",
    Level = 30,
    Attain = 21,
    Aim = "Lleva el Globo de Agua Extraño a Je'neu Sancrea en el Campamento Zoram'gar, Vallefresno.",
    Location = "Globo de Agua Extraño (Cavernas de Brazanegra "..yellow.."[7]"..white..")",
    Note = "Usar la Piedra de las Profundidades "..yellow.."[7]"..white.." para la misión #3 invoca al Barón Aquanis. Él suelta el Globo de Agua Extraño que inicia la misión.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 16886 }, --Outlaw Sabre One-Hand, Sword
        { id = 16887 }, --Witch's Finger Held In Off-hand
    }
}

--------------- Lower Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireLower = {
    Story = "La poderosa fortaleza tallada dentro de las entrañas ardientes de la Montaña Roca Negra fue diseñada por el maestro albañil enano, Franclorn Forgewright. Destinada a ser el símbolo del poder de los Hierro Negro, la fortaleza fue mantenida por los siniestros enanos durante siglos. Sin embargo, Nefarian, el astuto hijo del dragón Alamuerte, tenía otros planes para la gran fortaleza. Él y sus secuaces dracónicos tomaron el control de la Cumbre superior e hicieron la guerra a las posesiones de los enanos en las profundidades volcánicas de la montaña. Al darse cuenta de que los enanos estaban liderados por el poderoso elemental de fuego, Ragnaros, Nefarian juró aplastar a sus enemigos y reclamar toda la montaña Roca Negra para sí mismo.",
    Caption = "Lower Cumbre de Roca Negra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireLower.Alliance[1] = {
    Title = "Las Tablillas Finales",
    Level = 58,
    Attain = 40,
    Aim = "Lleva la Quinta y Sexta Tablillas Mosh'aru al Prospector Ironboot en Tanaris.",
    Location = "Prospector Ferrobota (Tanaris - Puerto Steamwheedle "..yellow.."66,23"..white..")",
    Note = "Encuentras las tablillas cerca de "..yellow.."[7]"..white.." y "..yellow.."[9]"..white..".\nLas recompensas pertenecen a 'Enfrentar a Yeh'kinya'. Encuentras a Yeh'kinya cerca del Prospector Ferrobota.",
    Prequest = "Las Tablillas Perdidas de Mosh'aru",
    Folgequest = "Enfrentar a Yeh'kinya",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 20218 }, --Faded Hakkari Cloak Back
        { id = 20219 }, --Tattered Hakkari Cape Back
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[2] = {
    Title = "Mascotas Exóticas de Kibler",
    Level = 59,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y encuentra Cachorros de Huargo Hacha de Sangre. Usa la jaula para transportar a las pequeñas bestias feroces. Devuelve un Cachorro de Huargo Enjaulado a Kibler.",
    Location = "Kibler (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,22"..white..")",
    Note = "Encuentras la Copa de Huargo en "..yellow.."[17]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12264 }, --Worg Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[3] = {
    Title = "E-N-A-Y-E-S-T-E-Y",
    Level = 59,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y recolecta 15 Huevos de Araña de la Cumbre para Kibler.$B$BPor lo que parece, estos huevos podrían encontrarse cerca de arañas.",
    Location = "Kibler (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,22"..white..")",
    Note = "Encuentras los huevos de araña cerca de "..yellow.."[13]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12529 }, --Smolderweb Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[4] = {
    Title = "Leche de Madre",
    Level = 60,
    Attain = 55,
    Aim = "En el corazón de la Cumbre de Roca Negra encontrarás a Madre Telaraña Humeante. Enfréntate a ella y haz que te envenene. Es probable que también tengas que matarla. Regresa con John el Harapiento cuando estés envenenado para que pueda 'ordeñarte'.",
    Location = "John Andrajoso (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,23"..white..")",
    Note = "Madre Telabrasada está en "..yellow.."[13]"..white..". El efecto de veneno atrapa a los jugadores cercanos también. Si se elimina o disipa, fallas la misión.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 15873 }, --Ragged John's Neverending Cup Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[5] = {
    Title = "Acaba con Ella",
    Level = 59,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y destruye la fuente de la amenaza de los huargos. Cuando dejaste a Helendis, gritó un nombre: Halycon. Es a lo que los orcos se refieren en relación con el huargo.",
    Location = "Helendis Rivacuerno (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."5,47"..white..")",
    Note = "Encuentras a Halycon en "..yellow.."[17]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 15824 }, --Astoria Robes Chest, Cloth
        { id = 15825 }, --Traphook Jerkin Chest, Leather
        { id = 15827 }, --Jadescale Breastplate Chest, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[6] = {
    Title = "Urok Aullador del Apocalipsis",
    Level = 60,
    Attain = 55,
    Aim = "Lee el Pergamino de Warosh. Llévale el Mojo de Warosh a Warosh.",
    Location = "Warosh (Cumbre de Roca Negra "..yellow.."[2]"..white..")",
    Note = "Para obtener el Mojo de Warosh tienes que invocar y matar a Urok Aullapocalipsis "..yellow.."[15]"..white..". Para su Invocación necesitas una Lanza y al Alto Señor Cabeza de Omokk "..yellow.."[5]"..white..". La Lanza está en "..yellow.."[3]"..white..". Durante la Invocación aparecen algunas oleadas de ogros antes de que Urok Aullapocalipsis te ataque. Puedes usar la Lanza durante la pelea para dañar a los ogros.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 15867 }, --Prismcharm Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[7] = {
    Title = "Pertenencias de Bijou",
    Level = 59,
    Attain = 55,
    Aim = "Encuentra las Pertenecías de Bijou y devuélveselas. ¡Buena suerte!",
    Location = "Bijou (Cumbre de Roca Negra "..yellow.."[3]"..white..")",
    Note = "Encuentras las Pertenencias de Bijou en el camino a Madre Telabrasada en "..yellow.."[13]"..white..".\nMaxwell está en (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."84,58"..white..").",
    Folgequest = "Mensaje para Maxwell",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[8] = {
    Title = "La Misión de Maxwell",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y destruye al Maestro de Guerra Voone, al Alto Señor Omokk y al Señor Supremo Wyrmthalak. Regresa con el Mariscal Maxwell cuando hayas completado el trabajo.",
    Location = "Mariscal Maxwell (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."84,58"..white..")",
    Note = "Encuentras al Maestro de Guerra Voone en "..yellow.."[9]"..white..", al Alto Señor Omokk en "..yellow.."[5]"..white.." y al Señor Supremo Vermiothalak en "..yellow.."[19]"..white..".",
    Prequest = "Mensaje para Maxwell",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 13958 }, --Wyrmthalak's Shackles Wrist, Cloth
        { id = 13959 }, --Omokk's Girth Restrainer Waist, Plate
        { id = 13961 }, --Halycon's Muzzle Shoulder, Leather
        { id = 13962 }, --Vosh'gajin's Strand Waist, Leather
        { id = 13963 }, --Voone's Vice Grips Hands, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[9] = {
    Title = "Sello de Ascensión",
    Level = 60,
    Attain = 57,
    Aim = "Encuentra las tres gemas de mando: la Gema de los Tronacuerno, la Gema de los Cumbrerroca y la Gema de los Hacha de Sangre. Devuélveselas, junto con el Sello de Ascensión sin Adornar, a Vaelan.$B$BLos Generales, como te dijo Vaelan, son: Maestro de Guerra Voone de los Tronacuerno, Alto Señor Omokk de los Cumbrerroca, y Señor Supremo Wyrmthalak de los Hacha de Sangre.",
    Location = "Vaelan (Cumbre de Roca Negra "..yellow.."[1]"..white..")",
    Note = "Obtienes la Gema de Piedra de Aguja del Alto Señor Omokk en "..yellow.."[5]"..white..", la Gema de Espino de Brasa del Maestro de Guerra Voone en "..yellow.."[9]"..white.." y la Gema de Hacha de Sangre del Señor Supremo Vermiothalak en "..yellow.."[19]"..white..". El Sello sin Adornar de Ascensión puede caer de casi todos los enemigos en la Cumbre de Roca Negra Inferior. Obtienes la Llave para la Cumbre de Roca Negra Superior si completas esta cadena de misiones.",
    Folgequest = "Sello de Ascensión",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[10] = {
    Title = "La Orden del General Drakkisath",
    Level = 60,
    Attain = 55,
    Aim = "Lleva la Orden del General Drakkisath al Mariscal Maxwell en las Estepas Ardientes.",
    Location = "Orden del General Drakkisath (cae del Señor Supremo Vermiothalak "..yellow.."[19]"..white..")",
    Note = "El Mariscal Maxwell está en Las Estepas Ardientes - Vigilancia de Morgan; ("..yellow.."84,58"..white..").",
    Folgequest = "La Muerte del General Drakkisath ("..yellow.."Upper Blackrock Spire"..white..")", -- 5102
}
kQuestInstanceData.BlackrockSpireLower.Alliance[11] = {
    Title = "La Pieza Izquierda del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con la Pieza Izquierda del Amuleto de Lord Valthalak y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'.\n\nMor Grayhoof es invocado en "..yellow.."[9]"..white..".",
    Prequest = "Componentes Importantes",
    Folgequest = "Veo la Isla de Alcaz en Tu Futuro...",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[12] = {
    Title = "La Pieza Derecha del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con el Amuleto de Lord Valthalak recombinado y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'.\n\nMor Grayhoof es invocado en "..yellow.."[9]"..white..".",
    Prequest = "Más Componentes Importantes",
    Folgequest = "Preparativos Finales ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994
}
kQuestInstanceData.BlackrockSpireLower.Alliance[13] = {
    Title = "Piedra de Serpiente de la Cazadora de las Sombras",
    Level = 60,
    Attain = 50,
    Aim = "Viaja a la Cumbre de Roca Negra y mata a la Cazadora de las Sombras Vosh'gajin. Recupera la Piedra de Serpiente de Vosh'gajin y entrégasela a Kilram.",
    Location = "Kilram (Cuna del Invierno - Mirada Eterna "..yellow.."61,37"..white..")",
    Note = "Misión de Herrería. El Cazador de las Sombras Vosh'gajin está en "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12821 }, --Plans: Dawn's Edge Pattern
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[14] = {
    Title = "Muerte Ardiente",
    Level = 60,
    Attain = 60,
    Aim = "Alguien en este mundo debe saber qué hacer con estos guanteletes. ¡Buena suerte!",
    Location = "Human Remains (Lower Cumbre de Roca Negra "..yellow.."[9]"..white..")",
    Note = "Misión de Herrería. Asegúrate de recoger los Guanteletes de Placas Sin Cocer cerca de los Restos Humanos en "..yellow.."[11]"..white..". Entregar a Malyfous Martillo Oscuro (Cuna del Invierno - Mirada Eterna "..yellow.."61,39"..white.."). Las recompensas listadas son para la siguiente misión.",
    Folgequest = "Guanteletes de Placa Ardiente",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 12699 }, --Plans: Fiery Plate Gauntlets Pattern
        { id = 12631 }, --Fiery Plate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[15] = {
    Title = "El Profanador Hierro Negro",
    Level = 60,
    Attain = 55,
    Aim = "Recolecta un Rifle Hierro Negro, un Condensador de Magma, un Cañón de Arcanita Intrincado y un Fragmento Fundido para Bixxle Tuercafundida en el Almacén de Bixxle en Tel'Abim.",
    Location = "Bixxle Tornillos (Tel'Abim "..yellow.."52,34"..white..")",
    Note = "Esta misión requiere recolectar 4 objetos.\n1) Condensador de Magma (Profundidades de Roca Negra en Caja de Condensador de Magma) \n2) Barril de Arcanita Intrincado (Cumbre de Roca Negra en contenedor de Barriles de Arcanita Intrincados)\n3) Fragmento Fundido (Núcleo de Magma de Destructor Fundido).\n4) Rifle Hierro Negro (fabricado por Ingenieros).\nNúcleo de Fuego(x3) encontrado en Núcleo de Magma, y Barras de Torio Encantado(x10).",
    Prequest = "Secretos del Profanador Hierro Negro",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireLower.Horde[i] = kQuestInstanceData.BlackrockSpireLower.Alliance[i]
end
kQuestInstanceData.BlackrockSpireLower.Horde[5] = {
    Title = "La Maestra de la Manada",
    Level = 59,
    Attain = 55,
    Aim = "Mata a Halycon, la maestra de manada de los huargos Hacha de Sangre.",
    Location = "Galamav el Tirador (Tierras Inhóspitas - Kargath "..yellow.."5,47"..white..")",
    Note = "Encuentras a Halycon en "..yellow.."[17]"..white..".",
    Rewards = kQuestInstanceData.BlackrockSpireLower.Alliance[5].Rewards
}
kQuestInstanceData.BlackrockSpireLower.Horde[6] = kQuestInstanceData.BlackrockSpireLower.Alliance[6]
kQuestInstanceData.BlackrockSpireLower.Horde[7] = {
    Title = "Operativa Bijou",
    Level = 59,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y averigua qué le pasó a Bijou.",
    Location = "Lexlort (Tierras Inhóspitas - Kargath "..yellow.."5,47"..white..")",
    Note = "Encuentras a Bijou en "..yellow.."[8]"..white..".",
    Folgequest = "Pertenencias de Bijou",
}
kQuestInstanceData.BlackrockSpireLower.Horde[8] = {
    Title = "Pertenencias de Bijou",
    Level = 59,
    Attain = 55,
    Aim = "Encuentra las Pertenecías de Bijou y devuélveselas. ¡Buena suerte!",
    Location = "Bijou (Cumbre de Roca Negra "..yellow.."[3]"..white..")",
    Note = "Encuentras las Pertenencias de Bijou en el camino a Madre Telabrasada en "..yellow.."[13]"..white..".\nLas recompensas pertenecen a 'Informe de reconocimiento de Bijou'.",
    Prequest = "Operativa Bijou",
    Folgequest = "Informe de Reconocimiento de Bijou",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 15858 }, --Freewind Gloves Hands, Cloth
        { id = 15859 }, --Seapost Girdle Waist, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[9] = kQuestInstanceData.BlackrockSpireLower.Alliance[9]
kQuestInstanceData.BlackrockSpireLower.Horde[10] = {
    Title = "La Orden del Señor de la Guerra",
    Level = 60,
    Attain = 55,
    Aim = "Mata al Alto Señor Omokk, Maestro de Guerra Voone y Señor Supremo Wyrmthalak. Recupera Documentos Importantes de Roca Negra. Regresa con el Señor de la Guerra Goretooth en Kargath cuando hayas completado la misión.",
    Location = "Señor de la Guerra Dientegore (Tierras Inhóspitas - Kargath "..yellow.."65,22"..white..")",
    Note = "Misión anterior de Onyxia.\nEncuentras al Alto Señor Omokk en "..yellow.."[5]"..white..", al Maestro de Guerra Voone en "..yellow.."[9]"..white.." y al Señor Supremo Vermiothalak en "..yellow.."[19]"..white..". Los Documentos de Roca Negra podrían aparecer junto a uno de estos 3 jefes.",
    Folgequest = "La Sabiduría de Eitrigg -> ¡Por la Horda! ("..yellow.."Cumbre de Roca Negra Superior"..white..")",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 13958 }, --Wyrmthalak's Shackles Wrist, Cloth
        { id = 13959 }, --Omokk's Girth Restrainer Waist, Plate
        { id = 13961 }, --Halycon's Muzzle Shoulder, Leather
        { id = 13962 }, --Vosh'gajin's Strand Waist, Leather
        { id = 13963 }, --Voone's Vice Grips Hands, Mail
    }
}
for i = 11, 15 do
    kQuestInstanceData.BlackrockSpireLower.Horde[i] = kQuestInstanceData.BlackrockSpireLower.Alliance[i]
end
kQuestInstanceData.BlackrockSpireLower.Horde[16] = {
    Title = "Escoria de los Forest Troll",
    Level = 60,
    Attain = 48,
    Location = "Capataz Ok'gog (Las Estepas Ardientes - Bastión Karfang "..yellow.."95.1,22.8"..white..")",
    Note = "Mata al Maestro de Guerra Voone "..yellow.."[9]"..white.." en la Cumbre de Roca Negra Inferior y lleva sus colmillos de vuelta al Capataz Ok'gog en el Bastión Karfang en Las Estepas Ardientes.",
    Prequest = "La Tarea de Firegut",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60715 }, --Taskmaster Whip Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[17] = {
    Title = "La Incursión del Asaltante",
    Level = 58,
    Attain = 50,
    Aim = "Mata a Gizrul el Esclavizador en la Cumbre de Roca Negra, luego informa a Asaltante Fargosh en el Bastión Karfang.",
    Location = "Asaltante Fargosh (Las Estepas Ardientes - Bastión Karfang "..yellow.."93.6,23.2"..white..")",
    Note = "Gizrul el Esclavista aparece después de matar al jefe Halycon "..yellow.."[17]"..white..".",
    Prequest = "La Venganza del Asaltante -> El Nuevo Montura del Asaltante",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60717 }, --Worg Rider Sash Waist, Leather
        { id = 60718 }, --Sootwalker Sandals Feet, Cloth
        { id = 60719 }, --Axe of Fargosh Main Hand, Axe
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[18] = {
    Title = "La Grieta Final",
    Level = 59,
    Attain = 50,
    Location = "Karfang (Las Estepas Ardientes - Bastión Karfang "..yellow.."95.1,22.8"..white..")",
    Note = "Mata al Intendente Zigris "..yellow.."[16]"..white.." en las profundidades de la Cumbre de Roca Negra para Karfang en el Bastión Karfang en Las Estepas Ardientes.",
    Prequest = "Protegiendo la Sangre Fresca -> Informe a Molk -> Destruye Todo Rastro... -> No Te Arriesgues",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60739 }, --Tarnished Lancelot Ring Ring
    }
}

--------------- Upper Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireUpper = {
    Story = "La poderosa fortaleza tallada dentro de las entrañas ardientes de la Montaña Roca Negra fue diseñada por el maestro albañil enano, Franclorn Forgewright. Destinada a ser el símbolo del poder de los Hierro Negro, la fortaleza fue mantenida por los siniestros enanos durante siglos. Sin embargo, Nefarian, el astuto hijo del dragón Alamuerte, tenía otros planes para la gran fortaleza. Él y sus secuaces dracónicos tomaron el control de la Cumbre superior e hicieron la guerra a las posesiones de los enanos en las profundidades volcánicas de la montaña. Al darse cuenta de que los enanos estaban liderados por el poderoso elemental de fuego, Ragnaros, Nefarian juró aplastar a sus enemigos y reclamar toda la montaña Roca Negra para sí mismo.",
    Caption = "Upper Cumbre de Roca Negra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[1] = {
    Title = "El Protectorado de la Matrona",
    Level = 60,
    Attain = 57,
    Aim = "Viaja a Cuna del Invierno y encuentra a Haleh. Entrégale la escama de Awbee.",
    Location = "Awbee (Cumbre de Roca Negra "..yellow.."[7]"..white..")",
    Note = "Encuentras a Awbee en la habitación después de la Arena en "..yellow.."[7]"..white..". Ella está en un saliente.\nHaleh está en Cuna del Invierno ("..yellow.."54,51"..white.."). Usa la señal del portal al final de la cueva para llegar a ella.",
    Folgequest = "La Ira del Vuelo Azul",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[2] = {
    Title = "Finkle Einhorn, ¡A Tu Servicio!",
    Level = 60,
    Attain = 55,
    Aim = "Habla con Malyfous Martilloscuro en Vista Eterna.",
    Location = "Pip Perspicaz (Cumbre de Roca Negra "..yellow.."[8]"..white..")",
    Note = "Pip Perspicaz aparece después de desollar a La Bestia. Encuentras a Malyfous en (Cuna del Invierno - Mirada Eterna "..yellow.."61,38"..white..").",
    Folgequest = "Leotardos de Arcana, Gorra del Sabio Escarlata, Coraza de Sed de Sangre y Hombreras del Portador de la Luz",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[3] = {
    Title = "Congelación de Huevos",
    Level = 60,
    Attain = 57,
    Aim = "Usa el Prototipo de Huevoscopio en un huevo en la Crianza.",
    Location = "Tinkee Vaporhirviendo (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,24"..white..")",
    Note = "Encuentras los huevos en la habitación del Padre Llama en "..yellow.."[2]"..white..".",
    Prequest = "Esencia de Cría -> Tinkee Vaporollante",
    Folgequest = "Recolección de Huevos -> Leonid Barthalomew -> Gambito del Alba ("..yellow.."Scholomance"..white..")",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[4] = {
    Title = "Ojo del Embrasen",
    Level = 60,
    Attain = 56,
    Aim = "Lleva el Ojo del Embrasador al Duque Hydraxis en Azshara.",
    Location = "Duque Hydraxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Puedes encontrar al Piroguardián Brasadivino en "..yellow.."[1]"..white..".",
    Prequest = "Agua Envenenada, Atormentadores y Retumbadores",
    Folgequest = "El Núcleo de Magma",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[5] = {
    Title = "La Muerte del General Drakkisath",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y destruye al General Drakkisath. Regresa con el Mariscal Maxwell cuando hayas completado el trabajo.",
    Location = "Mariscal Maxwell (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."82,68"..white..")",
    Note = "Encuentras al General Drakkisath en "..yellow.."[9]"..white..".",
    Prequest = "La Orden del General Drakkisath ("..yellow.."Lower Blackrock Spire"..white..")",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[6] = {
    Title = "El Broche de Doomrigger",
    Level = 60,
    Attain = 57,
    Aim = "Lleva el Broche de Malarregio a Mayara Alasol en las Estepas Ardientes.",
    Location = "Mayara Alasol (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."84,69"..white..")",
    Note = "Obtienes la misión anterior del Conde Remington Bonacresta (Ventormenta - Castillo de Ventormenta "..yellow.."74,30"..white..").\n\nEl Cierre de Doomrigger está en "..yellow.."[3]"..white.." en un cofre.",
    Prequest = "Mayara Alablanca",
    Folgequest = "Entrega a Ridgewell",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[7] = {
    Title = "Amuleto de Fuego de Dragón",
    Level = 60,
    Attain = 50,
    Aim = "Debes recuperar la Sangre del Campeón de Dragones Negros del General Drakkisath. Drakkisath se encuentra en su sala del trono detrás de las Salas de Ascensión en la Cumbre de Roca Negra.",
    Location = "Haleh (Cuna del Invierno "..yellow.."54,51"..white..")",
    Note = "Última parte de la cadena de misiones de Onyxia para la Alianza. Encuentras al General Drakkisath en "..yellow.."[9]"..white..".",
    Prequest = "El Ojo del Dragón",
    Rewards = {
        Text = "Recompensa: ",
        { id = 16309 }, --Drakefire Amulet Neck
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[8] = {
    Title = "La Orden de Puño Negro",
    Level = 60,
    Attain = 55,
    Aim = "Ese orco es un idiota. Parece que necesitas encontrar esta marca y obtener la Marca de Drakkisath para acceder al Orbe de Comando. La carta indica que el General Drakkisath guarda la marca. Quizás deberías investigar.",
    Location = "Orden de Puño Negro (cae del Intendente Escudo del Estigma "..yellow.."[7] en el Mapa de Entrada"..white..")",
    Note = "Misión de sintonización de Guarida de Alanegra. El Intendente Escudo del Estigma se encuentra si giras a la derecha antes del portal LBRS/UBRS.\n\nEl General Drakkisath está en "..yellow.."[9]"..white..". La marca está detrás de él.",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[9] = {
    Title = "Preparativos Finales",
    Level = 60,
    Attain = 58,
    Aim = "Reúne 40 Brazales de Roca Negra y adquiere un Frasco de Poder Supremo. Devuélveselos a Bodley dentro de la Montaña Roca Negra.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'. Los Brazales de Roca Negra caen de enemigos con Puño Negro en el nombre. El Frasco de Poder Supremo es hecho por un Alquimista.",
    Prequest = "La Pieza Derecha del Amuleto de Lord Valthalak ("..yellow.."Upper Blackrock Spire"..white..")",
    Folgequest = "Mea Culpa, Lord Valthalak",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[10] = {
    Title = "Mea Culpa, Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar a Lord Valthalak. Acaba con él y usa el Amuleto de Lord Valthalak en el cadáver. Luego, devuelve el Amuleto de Lord Valthalak al Espíritu de Lord Valthalak.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'. Lord Valthalak es invocado en "..yellow.."[8]"..white..". Las recompensas listadas son para Regreso con Bodley.",
    Prequest = "Preparativos Finales",
    Folgequest = "Regreso con Bodley",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 22057 }, --Brazier of Invocation Item
        { id = 22344 }, --Brazier of Invocation: User's Manual Item
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[11] = {
    Title = "La Forja del Demonio",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y encuentra a Goraluk Anvilcrack. Mátalo y luego usa la Pica Manchada de Sangre en su cadáver. Después de que su alma haya sido absorbida, la pica estará Manchada de Alma.$B$BTambién debes encontrar el Peto Cubierto de Runas sin Forjar.$B$BDevuelve tanto la Pica Manchada de Alma como el Peto Cubierto de Runas sin Forjar a Lorax en Cuna del Invierno.",
    Location = "Lorax (Cuna del Invierno "..yellow.."64,74"..white..")",
    Note = "Misión de Herrería. Goraluk Yunquegrieta está en "..yellow.."[5]"..white..".",
    Prequest = "El Relato de Lorax",
    Rewards = {
        Text = "Recompensa: 1 y 2 y 3",
        { id = 12696 }, --Plans: Demon Forged Breastplate Pattern
        { id = 9224, quantity = 5 }, --Elixir of Demonslaying Potion
        { id = 12849 }, --Demon Kissed Sack Container
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[12] = {
    Title = "La Unión Superior I",
    Level = 60,
    Attain = 55,
    Aim = "Reúne una Carga de Dragonante de los Dragonantes Negros dentro de la Cumbre de Roca Negra para Parnabus en Gilneas.",
    Location = "Parnabus <Mago Errante> (Gilneas "..yellow.."[22.9,74.4]"..white..", muy al sur de la Ciudad de Gilneas, al oeste del río. dentro de una casa solitaria).",
    Note = "Se recomienda encarecidamente tomar la misión anterior 'La Atadura de Xanthar' de Hanvar el Justo (Paso de la Muerte en la pequeña iglesia fuera de Karazhan "..yellow.."[40.9,79.3]"..white..").\nLa recompensa por la última misión de la cadena de misiones de La Unión Superior será el objeto de misión 'La Atadura Superior de Xanthar' para la misión 'La Atadura de Xanthar'.",
    Prequest = "La Unión de Xanthar",
    Folgequest = "La Unión Superior II -> La Unión Superior III"..yellow.."[La Masacre Oeste]"..white.." -> La Unión Superior IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61696 }, --The Upper Binding of Xanthar Quest Item
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireUpper.Horde[i] = kQuestInstanceData.BlackrockSpireUpper.Alliance[i]
end
kQuestInstanceData.BlackrockSpireUpper.Horde[5] = {
    Title = "La Tablilla de Piedranegra",
    Level = 60,
    Attain = 57,
    Aim = "Lleva la Tablilla de Piedra Oscura a la Maga de las Sombras Vivian Lagrave en Kargath.",
    Location = "Maga Oscura Vivian Lagrave (Tierras Inhóspitas - Kargath "..yellow.."2,47"..white..")",
    Note = "Obtienes la misión anterior de la Boticaria Zinge en Entrañas - El Apothecarium ("..yellow.."50,68"..white..").\n\nThe Tablilla de Rocanegra está en "..yellow.."[3]"..white.." en un cofre.",
    Prequest = "Vivian Lagrave y la Tablilla de Piedranegra",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[6] = {
    Title = "¡Por la Horda!",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y mata al Jefe de Guerra Rend Blackhand. Toma su cabeza y regresa a Orgrimmar.",
    Location = "Thrall (Orgrimmar "..yellow.."31,38"..white..")",
    Note = "Misión de sintonización de Onyxia. Encuentras al Jefe de Guerra Desgarro Puño Negro en "..yellow.."[6]"..white..".",
    Prequest = "La Orden del Señor de la Guerra -> La Sabiduría de Eitrigg",
    Folgequest = "Lo que el Viento Lleva",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[7] = {
    Title = "Ilusiones del Oculus",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y recolecta 20 Ojos de Descendiente de Dragón Negro. Regresa con Myranda la Bruja cuando hayas completado la tarea.",
    Location = "Myranda la Fada (Tierras de la Peste del Oeste "..yellow.."50,77"..white..")",
    Note = "Los dragonantes sueltan los ojos.",
    Prequest = "¡Por la Horda! -> Lo que el Viento Lleva -> El Testamento de Rexxar",
    Folgequest = "Emberstrife",
}
kQuestInstanceData.BlackrockSpireUpper.Horde[8] = {
    Title = "Sangre del Campeón del Dragón Negro",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a la Cumbre de Roca Negra y mata al General Drakkisath. Recolecta su sangre y entrégasela a Rexxar.",
    Location = "Rexxar (Desolace - Poblado Presacaz "..yellow.."25,71"..white..")",
    Note = "Última parte de la misión anterior de Onyxia. Encuentras al General Drakkisath en "..yellow.."[9]"..white..".",
    Prequest = "Emberstrife -> Ascensión...",
    Rewards = {
        Text = "Recompensa: ",
        { id = 16309 }, --Drakefire Amulet Neck
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[9] = kQuestInstanceData.BlackrockSpireUpper.Alliance[8]
kQuestInstanceData.BlackrockSpireUpper.Horde[10] = kQuestInstanceData.BlackrockSpireUpper.Alliance[9]
kQuestInstanceData.BlackrockSpireUpper.Horde[11] = kQuestInstanceData.BlackrockSpireUpper.Alliance[10]
kQuestInstanceData.BlackrockSpireUpper.Horde[12] = kQuestInstanceData.BlackrockSpireUpper.Alliance[11]
kQuestInstanceData.BlackrockSpireUpper.Horde[13] = kQuestInstanceData.BlackrockSpireUpper.Alliance[12]

--------------- Dire Maul (East) ---------------
kQuestInstanceData.DireMaulEast = {
    Story = "Construida hace doce mil años por una secta secreta de hechiceros elfos de la noche, la antigua ciudad de Eldre'Thalas se usó para proteger los secretos arcanos más preciados de la Reina Azshara. Aunque fue devastada por el Gran Cataclismo del mundo, gran parte de la maravillosa ciudad aún permanece como la imponente La Masacre. Las tres zonas distintas de las ruinas han sido invadidas por todo tipo de criaturas, especialmente los espectrales altonatos, los viles sátiros y los brutales ogros. Solo el grupo más audaz de aventureros puede entrar en esta ciudad rota y enfrentar los antiguos males encerrados en sus antiguas cámaras.",
    Caption = "La Masacre (East)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulEast.Alliance[1] = {
    Title = "Pusillin y el Anciano Azj'Tordin",
    Level = 58,
    Attain = 54,
    Aim = "Viaja a La Masacre y localiza al Diablillo, Pusillin. Convence a Pusillin de que te dé el Libro de Conjuros de Azj'Tordin por cualquier medio necesario.$B$BRegresa con Azj'Tordin en el Pabellón Lariss en Feralas si recuperas el Libro de Conjuros.",
    Location = "Azj'Tordin (Feralas - Lariss Pavillion "..yellow.."76,37"..white..")",
    Note = "Pusillín está en La Masacre "..yellow.."Este"..white.." en "..yellow.."[1]"..white..". Corre cuando hablas con él, pero se detiene y lucha en "..yellow.."[2]"..white..". Soltará la Llave Creciente que se usa para La Masacre Norte y Oeste.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 18411 }, --Spry Boots Feet, Leather
        { id = 18410 }, --Sprinter's Sword Two-Hand, Sword
    }
}
kQuestInstanceData.DireMaulEast.Alliance[2] = {
    Title = "La Red de Lethtendris",
    Level = 57,
    Attain = 54,
    Aim = "Lleva la Tela de Lethtendris a Latronicus Lanzaspear en el Bastión Plumaluna en Feralas.",
    Location = "Latronicus Lanzaluna (Feralas - Bastión Pluma Lunar "..yellow.."30,46"..white..")",
    Note = "Lethtendris está en La Masacre "..yellow.."Este"..white.." en "..yellow.."[3]"..white..". La misión anterior viene del Heraldo Sentencia en Forjaz. Él recorre toda la ciudad.",
    Prequest = "Bastión Plumaluna",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18491 }, --Lorespinner Main Hand, Dagger
    }
}
kQuestInstanceData.DireMaulEast.Alliance[3] = {
    Title = "Fragmentos de la Vid de la Perdición",
    Level = 60,
    Attain = 56,
    Aim = "Encuentra la Felbruna en La Masacre y adquiere un fragmento de ella. Lo más probable es que solo puedas obtener uno con la muerte de Alzzin el Formaferal. Usa el Relicario de Pureza para sellar el fragmento de forma segura y llévaselo a Rabine Saturna en el Puesto de la Guardia Nocturna, Claro de la Luna.",
    Location = "Rabine Saturna (Claro de la Luna - Refugio Nocturno "..yellow.."51,44"..white..")",
    Note = "Encuentras a Alliz el Formacampos en la parte "..yellow.."Este"..white.." de La Masacre en "..yellow.."[5]"..white..". La reliquia está en Silithus en "..yellow.."62,54"..white..". La misión anterior también viene de Rabine Saturna.",
    Prequest = "Un Relicario de Pureza",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 18535 }, --Milli's Shield Shield
        { id = 18536 }, --Milli's Lexicon Held In Off-hand
    }
}
kQuestInstanceData.DireMaulEast.Alliance[4] = {
    Title = "La Pieza Izquierda del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con la Pieza Izquierda del Amuleto de Lord Valthalak y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'.\n\nIsalien es invocado en "..yellow.."[5]"..white..".",
    Prequest = "Componentes Importantes",
    Folgequest = "Veo la Isla de Alcaz en Tu Futuro...",
}
kQuestInstanceData.DireMaulEast.Alliance[5] = {
    Title = "La Pieza Derecha del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con el Amuleto de Lord Valthalak recombinado y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'.\n\nIsalien es invocado en "..yellow.."[5]"..white..".",
    Prequest = "Más Componentes Importantes",
    Folgequest = "Preparativos Finales ("..yellow.."Upper Blackrock Spire"..white..")",
}
kQuestInstanceData.DireMaulEast.Alliance[6] = {
    Title = "Ataduras de la Prisión",
    Level = 60,
    Attain = 60,
    Aim = "Viaja a La Masacre en Feralas y recupera 15 Sangre de Sátiro de los Sátiros Engendro Salvaje que habitan el Barrio Alabeo. Regresa con Daio en la Cicatriz Contaminada cuando hayas completado esto.",
    Location = "Daio el Decrépito (Las Tierras Devastadas - La Cicatriz Manchada "..yellow.."34,50"..white..")",
    Note = red.."Solo Brujo"..white..": Esta junto con otra misión dada por Daio el Decrépito son misiones exclusivas de Brujo para el hechizo Ritual de Perdición. La forma más fácil de llegar al Sátiro Mala Hierba es entrar a La Masacre Este por la 'puerta trasera' en el Pabellón de Lariss (Feralas "..yellow.."77,37"..white.."). Sin embargo, necesitarás la Llave Creciente.",
}
kQuestInstanceData.DireMaulEast.Alliance[7] = {
    Title = "Refrigerio Arcano",
    Level = 60,
    Attain = 60,
    Aim = "Viaja al Barrio Alabeo de La Masacre y mata al elemental de agua, Hidrosaurio. Regresa con el Conservador de conocimientos Lydros en el Ateneo con la Esencia de Hidrosaurio.",
    Location = "Tradicionalista Lydros (La Masacre - West o North "..yellow.."[1] Library"..white..")",
    Note = red.."Solo Mago"..white..": La Esencia de Hidrocría cae de [3] Hidromilecio. Recompensa: puedes usar Agua Cristalina Conjurada.",
    Folgequest = "Un Tipo Especial de Convocatoria",
    Rewards = {
        Text = "Recompensa: ",
        { id = 83002 }, --Tome of Refreshment Ritual Pattern
    }
}
kQuestInstanceData.DireMaulEast.Alliance[8] = {
    Title = "El Transformador Salvaje",
    Level = 60,
    Attain = 55,
    Aim = "Lleva la Cabeza de Alzzin el Formaferal al Archidruida Dreamwind en Nordanaar en Hyjal.",
    Location = "Archidruida Vientosueño (Hyjal - Nordanaar "..yellow.."84.8,29.3"..white.." piso superior del gran árbol)",
    Note = "Encuentras a Alliz el Formacampos en "..yellow.."[5]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 61199 }, --Bright Dream Shard Reagent
        { id = 61703 }, --Talisman of the Dreamshaper Neck
    }
}
kQuestInstanceData.DireMaulEast.Alliance[9] = {
    Title = "Un Estudio de Árboles Mágicos",
    Level = 61,
    Attain = 60,
    Aim = "Lleva 5 Hojas Azules al Guardián del Conocimiento Lydros.",
    Location = "Tradicionalista Lydros (La Masacre - West o North "..yellow.."[1] Library"..white..")",
    Note = red.."Solo Druida"..white..": Las Hojas Azules caen de los Treants.\nLa misión anterior comienza [de Ancianos y Treants] - (Torre de Karazhan "..yellow.."cerca de [0]"..white..")", --2020112    Prequest = "No Hay Honor Entre Chefs",
    Rewards = {
        Text = "Recompensa: ",
        { id = 51070 }, --Glyph of the Arcane Treant Glyph
    }
}
kQuestInstanceData.DireMaulEast.Horde[1] = kQuestInstanceData.DireMaulEast.Alliance[1]
kQuestInstanceData.DireMaulEast.Horde[2] = {
    Title = "La Red de Lethtendris",
    Level = 57,
    Attain = 54,
    Aim = "Lleva la Tela de Lethtendris a Latronicus Lanzaspear en el Bastión Plumaluna en Feralas.",
    Location = "Talo Pezuñahendida (Feralas - Campamento Mojache "..yellow.."76,43"..white..")",
    Note = "Lethtendris está en La Masacre "..yellow.."Este"..white.." en "..yellow.."[3]"..white..". La misión anterior viene del Clamaguerras Gorlach en Orgrimmar. Él recorre toda la ciudad.",
    Prequest = "Campamento Mojache",
    Rewards = kQuestInstanceData.DireMaulEast.Alliance[2].Rewards
}
for i = 3, 9 do
    kQuestInstanceData.DireMaulEast.Horde[i] = kQuestInstanceData.DireMaulEast.Alliance[i]
end

--------------- Dire Maul (North) ---------------
kQuestInstanceData.DireMaulNorth = {
    Story = kQuestInstanceData.DireMaulEast.Story,
    Caption = "La Masacre (North)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulNorth.Alliance[1] = {
    Title = "Una Trampa Rota",
    Level = 60,
    Attain = 56,
    Aim = "Repara la trampa.",
    Location = "Una Trampa Rota (La Masacre "..yellow.."North"..white..")",
    Note = "Misión repetible. Para reparar la trampa tienes que usar un [Widget de Torio] y un [Aceite de Escarcha].",
}
kQuestInstanceData.DireMaulNorth.Alliance[2] = {
    Title = "El Traje de Ogro Gordok",
    Level = 60,
    Attain = 56,
    Aim = "Lleva 4 Piezas de Paño Rúnico, 8 Cuero Rugoso, 2 Hilos Rúnicos y Tanino de Ogro a Knot Thimblejack. Actualmente está encadenado en el ala Gordok de La Masacre.",
    Location = "Knot Llavededo (La Masacre "..yellow.."North, [4]"..white..")",
    Note = "Misión repetible. Obtienes el Tanino de Ogro cerca de "..yellow.."[4] (arriba)"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18258 }, --Gordok Ogre Suit Disguise
    }
}
kQuestInstanceData.DireMaulNorth.Alliance[3] = {
    Title = "¡Libera a Nudo!",
    Level = 60,
    Attain = 57,
    Aim = "Consigue una Llave de Grillete Gordok para Knot Thimblejack.",
    Location = "Knot Llavededo (La Masacre "..yellow.."North, [4]"..white..")",
    Note = "Misión repetible. Cualquier carcelero puede soltar la llave.",
}
kQuestInstanceData.DireMaulNorth.Alliance[4] = {
    Title = "Asuntos Inconclusos de Gordok",
    Level = 60,
    Attain = 56,
    Aim = "Encuentra el Guantelete del Poderío de Gordok y llévaselo al Capitán Kromcrush en La Masacre.$B$BSegún Kromcrush, la 'historia antigua' dice que Tortheldrin, un elfo 'espeluznante' que se hacía llamar príncipe, lo robó de uno de los reyes Gordok.",
    Location = "Capitán Kromcrush (La Masacre "..yellow.."North, [5]"..white..")",
    Note = "El príncipe está en La Masacre "..yellow.."Oeste"..white.." en "..yellow.."[7]"..white..". El Guantelete está cerca de él en un cofre. Solo puedes obtener esta misión después de una carrera de Tributo y tener el beneficio 'Rey de los Gordok'.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 18369 }, --Gordok's Handwraps Hands, Cloth
        { id = 18368 }, --Gordok's Gloves Hands, Leather
        { id = 18367 }, --Gordok's Gauntlets Hands, Mail
        { id = 18366 }, --Gordok's Handguards Hands, Plate
    }
}
for i = 1, 4 do
    kQuestInstanceData.DireMaulNorth.Horde[i] = kQuestInstanceData.DireMaulNorth.Alliance[i]
end

--------------- Dire Maul (West) ---------------
kQuestInstanceData.DireMaulWest = {
    Story = kQuestInstanceData.DireMaulEast.Story,
    Caption = "La Masacre (West)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulWest.Alliance[1] = {
    Title = "Leyendas Élficas",
    Level = 60,
    Attain = 54,
    Aim = "Busca en La Masacre a Kariel Winthalus. Informa al Sabio Korolusk en Campamento Mojache con cualquier información que puedas encontrar.",
    Location = "Erudita Runaespina (Feralas - Bastión Pluma Lunar "..yellow.."31,43"..white..")",
    Note = "Encuentras a Kariel Winthalus en la "..yellow.."Biblioteca (Oeste)"..white..".",
}
kQuestInstanceData.DireMaulWest.Alliance[2] = {
    Title = "La Locura Interior",
    Level = 60,
    Attain = 56,
    Aim = "Debes destruir a los guardianes que rodean los 5 Pilones que alimentan la Prisión de Immol'thar. Una vez que los Pilones se hayan desactivado, el campo de fuerza que rodea a Immol'thar se disipará.$B$BEntra en la Prisión de Immol'thar y erradica al demonio vil que se encuentra en su corazón. Finalmente, enfréntate al Príncipe Tortheldrin en el Athenaeum.$B$BRegresa con el Anciano Shen'dralar en el patio si completas esta misión.",
    Location = "Anciano Shen'dralar (La Masacre "..yellow.."West, [1] (above)"..white..")",
    Note = "Los Pilones están marcados como "..blue.."[B]"..white..". Immol'thar está en "..yellow.."[6]"..white..", el Príncipe Tortheldrin en "..yellow.."[7]"..white..".",
    Folgequest = "El Tesoro de los Shen'dralar",
}
kQuestInstanceData.DireMaulWest.Alliance[3] = {
    Title = "El Tesoro de los Shen'dralar",
    Level = 60,
    Attain = 56,
    Aim = "Regresa al Ateneo y encuentra el Tesoro de los Shen'dralar. ¡Reclama tu recompensa!",
    Location = "Anciano Shen'dralar (La Masacre "..yellow.."West, [1]"..white..")",
    Note = "Puedes encontrar el Tesoro debajo de las escaleras "..yellow.."[7]"..white..".",
    Prequest = "La Locura Interior",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 18424 }, --Sedge Boots Feet, Leather
        { id = 18421 }, --Backwood Helm Head, Mail
        { id = 18420 }, --Bonecrusher Two-Hand, Mace
    }
}
kQuestInstanceData.DireMaulWest.Alliance[4] = {
    Title = "Corcel de Xoroth",
    Level = 60,
    Attain = 60,
    Aim = "Lee las Instrucciones de Mor'zul. Invoca un Corcel del Terror Xorothiano, derrótalo, luego ata su espíritu a ti.",
    Location = "Mor'zul Portador de Sangre (Las Estepas Ardientes "..yellow.."12,31"..white..")",
    Note = red.."Solo Brujo"..white..": Misión final en la cadena de misiones de la montura épica de Brujo. Primero debes apagar todos los Pilones marcados con "..blue.."[B]"..white.." y luego matar a Immol'thar en "..yellow.."[6]"..white..". Después de eso, puedes comenzar el Ritual de Invocación. Asegúrate de tener más de 20 Fragmentos de Alma listos y ten un Brujo específicamente asignado para mantener la Campana, la Vela y la Rueda activas. Los Guardias del Terror que vienen pueden ser esclavizados. Después de completar, habla con el fantasma del Corcel de la Perdición para completar la misión.",
    Prequest = "Entrega de Diablillo ("..yellow.."Scholomance"..white..")", -- 7629",
}
kQuestInstanceData.DireMaulWest.Alliance[5] = {
    Title = "El Sueño Esmeralda...",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "El Sueño Esmeralda (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Druida"..white..": Entregas el libro al Tradicionalista Javon en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18470 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[6] = {
    Title = "La Mejor Raza de Cazadores",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "La Carrera Más Grande de Cazadores (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Cazador"..white..": Entregas el libro al Tradicionalista Mykos en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18473 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[7] = {
    Title = "El Libro de Cocina del Arcanista",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "El Libro de Cocina del Arcanista (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Mago"..white..": Entregas el libro al Tradicionalista Kildrath en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18468 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[8] = {
    Title = "La Luz y Cómo Blandirla",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "La Luz y Cómo Blandirla (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Paladín"..white..": Entregas el libro al Tradicionalista Mykos en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18472 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[9] = {
    Title = "Boloña Sagrada: Lo que la Luz No Te Dirá",
    Level = 60,
    Attain = 56,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "Bologna Sagrada: Lo que la Luz no te Contará (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Sacerdote"..white..": Entregas el libro al Tradicionalista Javon en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18469 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[10] = {
    Title = "Garona: Un Estudio sobre el Sigilo y la Traición",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "Garona: Un Estudio sobre Sigilo y Traición (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Pícaro"..white..": Entregas el libro al Tradicionalista Kildrath en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18465 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[11] = {
    Title = "Choque de Escarcha y Tú",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "Choque de Escarcha y Tú (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Chamán"..white..": Entregas el libro al Tradicionalista Javon en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18471 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[12] = {
    Title = "Domando las Sombras",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "Aprovechamiento de Sombras (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Brujo"..white..": Entregas el libro al Tradicionalista Mykos en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18467 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[13] = {
    Title = "Códice de Defensa",
    Level = 60,
    Attain = 54,
    Aim = "Devuelve el libro a sus legítimos dueños.",
    Location = "Códice de Defensa (randomly drops off bosses in all La Masacre wings)",
    Note = red.."Solo Guerrero"..white..": Entregas el libro al Tradicionalista Kildrath en la "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18466 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[14] = {
    Title = "Libram de Enfoque",
    Level = 60,
    Attain = 58,
    Aim = "Lleva un Libro de Foco, 1 Diamante Negro Pristino, 4 Fragmentos Grandes Brillantes y 2 Pieles de las Sombras al Guardián del Conocimiento Lydros en La Masacre para recibir un Arcanum de Foco.",
    Location = "Tradicionalista Lydros (La Masacre - West o North "..yellow.."[1] Library"..white..")",
    Note = "No es una misión anterior, pero Leyendas Élficas debe completarse antes de que esta misión pueda iniciarse.\nEl Libram es una caída aleatoria en La Masacre y es comerciable, por lo que puede encontrarse en la Casa de Subastas. La Piel de Sombra es Ligado al recoger y puede caer de algunos jefes, Constructos Resucitados y Guardahuesos Resucitados en "..yellow.."Scholomance"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18330 }, --Arcanum of Focus Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[15] = {
    Title = "Libram de Protección",
    Level = 60,
    Attain = 58,
    Aim = "Lleva un Libro de Protección, 1 Diamante Negro Pristino, 2 Fragmentos Grandes Brillantes y 1 Costura de Abominación Deshilachada al Guardián del Conocimiento Lydros en La Masacre para recibir un Arcanum de Protección.",
    Location = "Tradicionalista Lydros (La Masacre - West o North "..yellow.."[1] Library"..white..")",
    Note = "No es una misión anterior, pero Leyendas Élficas debe completarse antes de que esta misión pueda iniciarse.\nEl Libram es una caída aleatoria en La Masacre y es comerciable, por lo que puede encontrarse en la Casa de Subastas. Las Costuras de Abominación Desgastadas son Ligado al recoger y pueden caer de Ramstein el Empachador, Escupebilis Venenosos, Vomitón Bílico y Horrores de Retazos en "..yellow.."Stratholme"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18331 }, --Arcanum of Protection Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[16] = {
    Title = "Libram de Rapidez",
    Level = 60,
    Attain = 58,
    Aim = "Lleva un Libro de Rapidez, 1 Diamante Negro Pristino, 2 Fragmentos Grandes Brillantes y 2 Sangre de Héroes al Guardián del Conocimiento Lydros en La Masacre para recibir un Arcanum de Rapidez.",
    Location = "Tradicionalista Lydros (La Masacre - West o North "..yellow.."[1] Library"..white..")",
    Note = "No es una misión anterior, pero Leyendas Élficas debe completarse antes de que esta misión pueda iniciarse.\nEl Libram es una caída aleatoria en La Masacre y es comerciable, por lo que puede encontrarse en la Casa de Subastas. La Sangre de Héroes es Ligado al recoger y puede encontrarse en el suelo en lugares aleatorios en las Tierras de la Peste del Oeste y del Este.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18329 }, --Arcanum of Rapidity Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[17] = {
    Title = "El Compendio de Foror",
    Level = 60,
    Attain = 60,
    Aim = "Devuelve el Compendio de Matanza de Dragones de Foror al Ateneo.",
    Location = "Compendio de Foror de Matanza de Dragones (random boss drop in "..yellow.."La Masacre"..white..")",
    Note = red.."Misión de Guerrero o Paladín."..white.." Se entrega al Tradicionalista Lydros (La Masacre - Oeste o Norte "..yellow.."[1] Biblioteca"..white.."). Entregar esto te permite comenzar la misión para Quel'Serrar.",
    Folgequest = "La Forja de Quel'Serrar",
}
kQuestInstanceData.DireMaulWest.Alliance[18] = {
    Title = "Manteniendo Secretos",
    Level = 58,
    Attain = 45,
    Aim = "Viaja a La Masacre y mata al gran ser maligno del que los Altonato están extrayendo energía, recolecta de él Esencia Ley Pura y regresa con Keeper Laena en Azshara.",
    Location = "Guardiana Laena (Azshara "..yellow.."44,45.4"..white..")",
    Note = "Immol'thar "..yellow.."[6]"..white.." suelta la Esencia de Ley Pura.\nLa cadena de misiones comienza con la misión 'La Carga del Guardián' en el Guardián Iselus "..yellow.."89.8,33.8"..white.." Azshara, esquina noreste de la costa.",
    Prequest = "Restaurando las Líneas Ley",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60333 }, --Azshara Keeper's Staff Staff
        { id = 60334 }, --Ring of Eldara Ring
    }
}
kQuestInstanceData.DireMaulWest.Alliance[19] = {
    Title = "La Unión Superior III",
    Level = 60,
    Attain = 55,
    Aim = "Reúne una Resonación Arcana Sobrecargada de los elementales arcanos de La Masacre para Parnabus en Gilneas.",
    Location = "Parnabus <Mago Errante> (Gilneas "..yellow.."[22.9,74.4]"..white..", muy al sur de la Ciudad de Gilneas, al oeste del río. dentro de una casa solitaria).",
    Note = "Se recomienda encarecidamente tomar la misión anterior 'La Atadura de Xanthar' de Hanvar el Justo (Paso de la Muerte en la pequeña iglesia fuera de Karazhan "..yellow.."[40.9,79.3]"..white..").\nLa recompensa por la última misión de la cadena de misiones de La Unión Superior será el objeto de misión 'La Atadura Superior de Xanthar' para la misión 'La Atadura de Xanthar'.\nLos elementales grandes Torrentes Arcanos en el círculo alrededor de "..yellow.."[6]"..white.." sueltan Resonancia Arcana Sobrecargada.",
    Prequest = "La Unión de Xanthar -> La Unión Superior I"..yellow.."[Cumbre de Roca Negra Superior]"..white.." -> La Unión Superior II", --41015, 41011, 41012",
    Folgequest = "La Unión Superior IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61696 }, --The Upper Binding of Xanthar Quest Item
    }
}
kQuestInstanceData.DireMaulWest.Alliance[20] = {
    Title = "La Llave de Karazhan VIII",
    Level = 60,
    Attain = 58,
    Aim = "Mata a Immol'thar en La Masacre y recupera gemas de su piel, luego regresa con Vandol.",
    Location = "Dolvan Vientofirme (Marjal Revolcafango -  "..yellow.."[71.1,73.2]"..white..")",
    Note = "Misiones anteriores de los Salones Inferiores de Karazhan. Las Gemas Arcanizadas caen de "..yellow.."[6].",
    Prequest = "La Llave de Karazhan I - VI -> La Llave de Karazhan VII"..yellow.."[Stratholme]"..white.." ", --40817",
    Folgequest = "La Llave de Karazhan IX (BWL) -> La Llave de Karazhan X",
}
kQuestInstanceData.DireMaulWest.Alliance[21] = {
    Title = "Dentro del Sueño III",
    Level = 60,
    Attain = 58,
    Aim = "Reúne un Fragmento de Atadura de los Rompeacantiles en Azshara, un Prisma Arcano Sobrecargado de los Torrentes Arcanos en el ala occidental de La Masacre y un Fragmento del Durmiente de los Tejedores en el Templo Sumergido. Informa a Itharius en los Pantanos de las Penas con los objetos recolectados.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."[81.6,27.7]"..white.." a green dragonkin)",
    Note = "Los elementales grandes Torrentes Arcanos en el círculo alrededor de "..yellow.."[6]"..white.." sueltan el Prisma Arcano Sobrecargado.\nAl completar esta cadena de misiones obtienes el collar y podrás entrar a la instancia de banda de Hyjal, Sanctum Esmeralda.",
    Prequest = "Dentro del Sueño I -> Dentro del Sueño II",
    Folgequest = "Dentro del Sueño IV - VI",
    Rewards = {
        Text = "Recompensa: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.DireMaulWest.Horde[1] = {
    Title = "Leyendas Élficas",
    Level = 60,
    Attain = 54,
    Aim = "Busca en La Masacre a Kariel Winthalus. Informa al Sabio Korolusk en Campamento Mojache con cualquier información que puedas encontrar.",
    Location = "Sabio Korolusk (Feralas - Campamento Mojache "..yellow.."74,43"..white..")",
    Note = "Encuentras a Kariel Winthalus en la "..yellow.."Biblioteca (Oeste)"..white..".",
}
for i = 2, 21 do
    kQuestInstanceData.DireMaulWest.Horde[i] = kQuestInstanceData.DireMaulWest.Alliance[i]
end

--------------- Maraudon ---------------
kQuestInstanceData.Maraudon = {
    Story = "Protegido por los feroces centauros Marodinos, Maraudon es uno de los sitios más sagrados dentro de Desolace. El gran templo/caverna es el lugar de sepultura de Zaetar, uno de los dos hijos inmortales nacidos del semidiós Cenarius. La leyenda sostiene que Zaetar y la princesa elemental de tierra Theradras engendraron la mal concebida raza centauro. Se dice que al emerger, los bárbaros centauros se volvieron contra su padre y lo mataron. Algunos creen que Theradras, en su dolor, atrapó el espíritu de Zaetar dentro de la caverna sinuosa, usando sus energías para algún propósito maligno. Los túneles subterráneos están poblados por los viciosos fantasmas muertos hace mucho de los Khans Centauros, así como los propios secuaces elementales furiosos de Theradras.",
    Caption = "Maraudon",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Maraudon.Alliance[1] = {
    Title = "Fragmentos de Sombrastilla",
    Level = 42,
    Attain = 38,
    Aim = "Recolecta 10 Fragmentos de Sombrarriostra de Maraudon y llévaselos a Uthel'nay en Orgrimmar.",
    Location = "Archimago Tervosh (Marjal Revolcafango - Isla Theramore "..yellow.."66,49"..white..")",
    Note = "Obtienes los Fragmentos de Sombrastilla de 'Estruendor Fragmento Oscuro' o 'Quebrantador Fragmento Oscuro' fuera de la instancia en el lado Morado.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 17772 }, --Zealous Shadowshard Pendant Neck
        { id = 17773 }, --Prodigious Shadowshard Pendant Neck
    }
}
kQuestInstanceData.Maraudon.Alliance[2] = {
    Title = "Corrupción de Lenguavil",
    Level = 47,
    Attain = 41,
    Aim = "Llena el Vial Cerúleo Cubierto en el estanque de cristal naranja en Maraudon.$B$BUsa el Vial Cerúleo Lleno en las Enredaderas Vylestem para forzar a que emerja el Vástago Nocivo corrupto.$B$BCura 8 plantas matando a estos Vástagos Nocivos, luego regresa con Vark Cicatriz de Batalla en Aldea Cazasombras.",
    Location = "Talendria (Desolace - Punta de Nijel "..yellow.."68,8"..white..")",
    Note = "Puedes llenar el Vial en cualquier charco fuera de la instancia en el lado Naranja. Las plantas están en las áreas naranja y morada dentro de la instancia.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 17768 }, --Woodseed Hoop Ring
        { id = 17778 }, --Sagebrush Girdle Waist, Leather
        { id = 17770 }, --Branchclaw Gauntlets Hands, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[3] = {
    Title = "Maldiciones Retorcidas",
    Level = 47,
    Attain = 41,
    Aim = "Recolecta 25 Tallas de Cristal Theradric para Willow en Desolace.",
    Location = "Willow (Desolace "..yellow.."62,39"..white..")",
    Note = "La mayoría de los enemigos en Maraudon sueltan las Tallas.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 17775 }, --Acumen Robes Chest, Cloth
        { id = 17776 }, --Sprightring Helm Head, Leather
        { id = 17777 }, --Relentless Chain Chest, Mail
        { id = 17779 }, --Hulkstone Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[4] = {
    Title = "Instrucciones del Paria",
    Level = 48,
    Attain = 39,
    Aim = "Lee las Instrucciones del Paria. Después, obtén el Amuleto de Unión de Maraudon y devuélveselo al Paria Centauro en el sur de Desolace.",
    Location = "Paria Centauro (Desolace "..yellow.."45,86"..white..")",
    Note = "Los 5 Khans (desc para Las Instrucciones del Paria)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 17774 }, --Mark of the Chosen Trinket
    },
    page = {2, "Encontrarás al Paria Centauro en el sur de Desolace. Camina entre "..yellow.."44,85"..white.." y "..yellow.."50,87"..white..".\nPrimero, tienes que matar al Profeta Sin Nombre ("..yellow.."[A] en el Mapa de Entrada"..white.."). Lo encuentras antes de entrar a la instancia, antes del punto donde puedes elegir si tomas la entrada morada o la naranja. Después de matarlo, debes matar a los 5 Kahns. El primero lo encuentras si eliges el camino del medio ("..yellow.."[1] en el Mapa de Entrada"..white.."). El segundo está en la parte morada de Maraudon pero antes de entrar a la instancia ("..yellow.."[2] en el Mapa de Entrada"..white.."). El tercero está en la parte naranja antes de entrar a la instancia ("..yellow.."[3] en el Mapa de Entrada"..white.."). El cuarto está cerca de "..yellow.."[4]"..white.." y el quinto está cerca de "..yellow.."[1]"..white.."."},
}
kQuestInstanceData.Maraudon.Alliance[5] = {
    Title = "Leyendas de Maraudon",
    Level = 49,
    Attain = 41,
    Aim = "Recupera las dos partes del Cetro de Celebras: la Vara Celebriana y el Diamante Celebriano.$B$BEncuentra una manera de hablar con Celebras.",
    Location = "Cavindra (Desolace - Maraudon "..yellow.."[4] on Entrance Map"..white..")",
    Note = "Encuentras a Cavindra al principio de la parte naranja antes de entrar a la instancia.\nObtienes la Vara de Celebras de Noxxion en "..yellow.."[2]"..white..", el Diamante de Celebras del Señor Lenguavil en "..yellow.."[5]"..white..". Celebras está en "..yellow.."[7]"..white..". Tienes que derrotarlo para poder hablar con él.",
    Folgequest = "El Cetro de Celebras",
}
kQuestInstanceData.Maraudon.Alliance[6] = {
    Title = "El Cetro de Celebras",
    Level = 49,
    Attain = 41,
    Aim = "Asiste a Celebras el Redimido mientras crea el Cetro de Celebras.$B$BHabla con él cuando se complete el ritual.",
    Location = "Celebras el Redimido (Maraudon "..yellow.."[7]"..white..")",
    Note = "Celebras crea el Cetro. Habla con él después de que termine.",
    Prequest = "Leyendas de Maraudon",
    Rewards = {
        Text = "Recompensa: ",
        { id = 17191 }, --Scepter of Celebras Item
    }
}
kQuestInstanceData.Maraudon.Alliance[7] = {
    Title = "Corrupción de la Tierra y la Semilla",
    Level = 51,
    Attain = 45,
    Aim = "Mata a la Princesa Theradras y regresa con Selendra cerca de la Aldea de los Pesares en Desolace.",
    Location = "Vigilante Marandis (Desolace - Punta de Nijel "..yellow.."63,10"..white..")",
    Note = "Encuentras a la Princesa Theradras en "..yellow.."[11]"..white..".",
    Folgequest = "Semilla de Vida",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 17705 }, --Thrash Blade One-Hand, Sword
        { id = 17743 }, --Resurgence Rod Staff
        { id = 17753 }, --Verdant Keeper's Aim Bow
    }
}
kQuestInstanceData.Maraudon.Alliance[8] = {
    Title = "Semilla de Vida",
    Level = 51,
    Attain = 45,
    Aim = "Busca a Remulos en Claro de la Luna y entrégale la Semilla de Vida.",
    Location = "Zaetars Ghost (Maraudon "..yellow.."[11]"..white..")",
    Note = "El Fantasma de Zaetar aparece después de matar a la Princesa Theradras "..yellow.."[11]"..white..". Encuentras al Guardián Remulos en (Claro de la Luna - Santuario de Remulos "..yellow.."36,41"..white..").",
    Prequest = "Corrupción de la Tierra y la Semilla",
}
kQuestInstanceData.Maraudon.Alliance[9] = {
    Title = "Arnés de Quimera",
    Level = 48,
    Attain = 38,
    Aim = "Recupera el Arnés Quimérico de Maraudon y llévaselo a Velos Filocero en el Valle Quimera en Feralas.",
    Location = "Velos Golpe Agudo (Feralas - Valle Nido de Quimera "..yellow.."[82.0,62.3]"..white.." esquina sureste de Feralas)",
    Note = "Purple Maraudon satir boss Lord Lenguavil "..yellow.."[5]"..white.." drops Arnés de Quimera.",
    Prequest = "Limpiando el Nido -> Alimentando a los Jóvenes",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61517 }, --Chimaera's Eye Trinket
    }
}
kQuestInstanceData.Maraudon.Alliance[10] = {
    Title = "¿Por Qué No Ambos?",
    Level = 50,
    Attain = 40,
    Aim = "Consigue el Corazón de Derrumbe de las profundidades de Maraudon, y la Esencia de Corrosis de la Cantera Forjodio para Frig Truenforja en Pico Nidal.",
    Location = "Frig Forjatormenta (Hinterlands - Pico Aerie "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Derrumblo está en "..yellow.."[8]"..white..".",
    Prequest = "Demostrando un Punto -> Lo Leí en un Libro Una Vez",
    Folgequest = "Maestría de Forjatinieblas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
kQuestInstanceData.Maraudon.Alliance[11] = {
    Title = "Preparación",
    Level = 48,
    Attain = 34,
    Aim = "Recupera un trozo del cuerpo de Avalancha de Maraudon y llévaselo a Thegren cerca de las Ruinas de Corthan en las Tierras Inhóspitas.",
    Location = "Thegren <Artisan Gemologist> (Tierras Inhóspitas - Ruinas de Corthan "..yellow.."[29, 27]"..white..").",
    Note = red.."Solo Joyería."..white.." Cadena de misiones para la especialización de Gemólogo.\nDerrumblo está en "..yellow.."[8]"..white..".",
    Prequest = "Dominando la Gemología -> La Sangre Vital -> Demostración",
    Folgequest = "El Corte Final",
}
kQuestInstanceData.Maraudon.Horde[1] = {
    Title = "Fragmentos de Sombrastilla",
    Level = 42,
    Attain = 38,
    Aim = "Recolecta 10 Fragmentos de Sombrarriostra de Maraudon y llévaselos a Uthel'nay en Orgrimmar.",
    Location = "Uthel'nay (Orgrimmar - Valle de los Espíritus "..yellow.."39,86"..white..")",
    Note = "Obtienes los Fragmentos de Sombrastilla de 'Estruendor Fragmento Oscuro' o 'Quebrantador Fragmento Oscuro' fuera de la instancia en el lado Morado.",
    Rewards = kQuestInstanceData.Maraudon.Alliance[1].Rewards
}
kQuestInstanceData.Maraudon.Horde[2] = {
    Title = "Corrupción de Lenguavil",
    Level = 47,
    Attain = 41,
    Aim = "Llena el Vial Cerúleo Cubierto en el estanque de cristal naranja en Maraudon.$B$BUsa el Vial Cerúleo Lleno en las Enredaderas Vylestem para forzar a que emerja el Vástago Nocivo corrupto.$B$BCura 8 plantas matando a estos Vástagos Nocivos, luego regresa con Vark Cicatriz de Batalla en Aldea Cazasombras.",
    Location = "Vark MarcaGuerra (Desolace - Poblado Presacaz "..yellow.."23,70"..white..")",
    Note = "Puedes llenar el Vial en cualquier charco fuera de la instancia en el lado Naranja. Las plantas están en las áreas naranja y morada dentro de la instancia.",
    Rewards = kQuestInstanceData.Maraudon.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.Maraudon.Horde[i] = kQuestInstanceData.Maraudon.Alliance[i]
end
kQuestInstanceData.Maraudon.Horde[7] = {
    Title = "Corrupción de la Tierra y la Semilla",
    Level = 51,
    Attain = 45,
    Aim = "Mata a la Princesa Theradras y regresa con Selendra cerca de la Aldea de los Pesares en Desolace.",
    Location = "Selendra (Desolace "..yellow.."27,77"..white..")",
    Note = "Encuentras a la Princesa Theradras en "..yellow.."[11]"..white..".",
    Folgequest = "Semilla de Vida",
    Rewards = kQuestInstanceData.Maraudon.Alliance[7].Rewards
}
kQuestInstanceData.Maraudon.Horde[8] = kQuestInstanceData.Maraudon.Alliance[8]
kQuestInstanceData.Maraudon.Horde[9] = {
    Title = "Preparación",
    Level = 48,
    Attain = 34,
    Aim = "Recupera un trozo del cuerpo de Avalancha de Maraudon y llévaselo a Thegren cerca de las Ruinas de Corthan en las Tierras Inhóspitas.",
    Location = "Thegren <Artisan Gemologist> (Tierras Inhóspitas - Ruinas de Corthan "..yellow.."[29, 27]"..white..").",
    Note = red.."Solo Joyería."..white.." Cadena de misiones para la especialización de Gemólogo.\nDerrumblo está en "..yellow.."[8]"..white..".",
    Prequest = "Dominando la Gemología -> La Sangre Vital -> Demostración",
    Folgequest = "El Corte Final",
}

--------------- Molten Core ---------------
kQuestInstanceData.MoltenCore = {
    Story = "El Núcleo de Magma yace en el fondo mismo de las Profundidades de Roca Negra. Es el corazón de la Montaña Roca Negra y el lugar exacto donde, hace mucho tiempo en un intento desesperado por cambiar el rumbo de la guerra civil de los enanos, el Emperador Thaurissan invocó al Señor del Fuego elemental, Ragnaros, al mundo. Aunque el señor del fuego es incapaz de alejarse mucho del Núcleo ardiente, se cree que sus secuaces elementales comandan a los enanos Hierro Negro, que están en medio de crear ejércitos de piedra viva. El lago ardiente donde Ragnaros yace durmiendo actúa como una grieta que conecta con el plano del fuego, permitiendo que los elementales maliciosos pasen. El principal entre los agentes de Ragnaros es Mayordomo Executus, ya que este astuto elemental es el único capaz de llamar al Señor del Fuego de su letargo.",
    Caption = "Núcleo de Magma",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.MoltenCore.Alliance[1] = {
    Title = "El Núcleo de Magma",
    Level = 60,
    Attain = 57,
    Aim = "Mata 1 Señor del Fuego, 1 Gigante de Magma, 1 Can del Núcleo Antiguo y 1 Oleada de Lava, luego regresa con el Duque Hydraxis en Azshara.",
    Location = "Duque Hydraxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Estos son enemigos que no son jefes dentro del Núcleo de Magma.",
    Prequest = "Ojo del Embrasen ("..yellow.."Upper Blackrock Spire"..white..")", -- 6821",
    Folgequest = "Agente de Hydraxis",
}
kQuestInstanceData.MoltenCore.Alliance[2] = {
    Title = "Las Manos de los Enemigos",
    Level = 60,
    Attain = 60,
    Aim = "Lleva las Manos de Lucifron, Sulfuron, Gehennas y Shazzrah al Duque Hydraxis en Azshara.",
    Location = "Duque Hydraxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Lucifrón está en "..yellow.."[2]"..white..", Sulfuron está en "..yellow.."[8]"..white.." y Shazzrah está en "..yellow.."[6]"..white..".",

    Prequest = "Agente de Hydraxis",
    Folgequest = "Recompensa de un Héroe",
}
kQuestInstanceData.MoltenCore.Alliance[3] = {
    Title = "Thunderaan el Buscavientos",
    Level = 60,
    Attain = 60,
    Aim = "Para liberar a Thunderaan el Buscavientos de su prisión, debes presentar las mitades derecha e izquierda de las Ataduras del Buscavientos, 10 barras de elementium y la Esencia del Señor del Fuego al Alto Señor Demitrian.",
    Location = "Alto Señor Demitrian (Silithus "..yellow.."22,9"..white..")",
    Note = "Parte de la cadena de misiones de Furia de Trueno, Hoja Bendita del Buscavientos. Comienza después de obtener las Ataduras del Hijo del Viento izquierda o derecha de Garr en "..yellow.."[4]"..white.." o del Barón Geddon en "..yellow.."[6]"..white..". Luego habla con el Alto Señor Demitrian para comenzar la cadena de misiones. La Esencia del Señor del Fuego cae de Ragnaros en "..yellow.."[10]"..white..". Después de entregar esta parte, el Príncipe Thunderaan es invocado y debes matarlo. Es un jefe de banda de 40 jugadores.",
    Prequest = "Examinar el Recipiente",
    Folgequest = "¡Levántate, Furiatrueno!",
}
kQuestInstanceData.MoltenCore.Alliance[4] = {
    Title = "Un Contrato Vinculante",
    Level = 60,
    Attain = 60,
    Aim = "Entrega el Contrato de la Hermandad del Torio a Lokhtos Tratoscuro si deseas recibir los planos de Sulfuron.",
    Location = "Lokhtos Tratoscuro (Profundidades de Roca Negra "..yellow.."[15]"..white..")",
    Note = "Necesitas un Lingote de Sulfuron para obtener el contrato de Lokhtos. Caen de Golemagg el Incinerador en el Núcleo de Magma en "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18592 }, --Plans: Sulfuron Hammer Pattern
    }
}
kQuestInstanceData.MoltenCore.Alliance[5] = {
    Title = "La Hoja Antigua",
    Level = 60,
    Attain = 60,
    Aim = "Encuentra al dueño de la Hoja Antigua Petrificada. Buena suerte, $N, es un mundo grande.",
    Location = "Hoja Petrificada Antigua (cae del Alijo del Señor del Fuego "..yellow.."[9]"..white..")",
    Note = "Se entrega a Vartrus el Ancestro en (Frondavil - Bosques Árbol de Hierro "..yellow.."49,24"..white..").",
    Folgequest = "Lámina Antigua Envuelta en Tendón ("..yellow.."Azuregos"..white..")", -- 7634",
}
kQuestInstanceData.MoltenCore.Alliance[6] = {
    Title = "La Única Receta",
    Level = 60,
    Attain = 60,
    Aim = "Recupera los 8 capítulos perdidos de Dracónico para Tontos y combínalos con la Encuadernación Mágica de Libros y devuelve el libro completo de Dracónico para Tontos: Volumen II a Narain Soothfancy en Tanaris.",
    Location = "Narain Sabelotodo (Tanaris "..yellow.."65,18"..white..")",
    Note = "Solo una persona puede despojar el Capítulo. Dracónico para Principiantes VIII (cae de Ragnaros "..yellow.."[10]"..white..")",
    Prequest = "¡Señuelo!",
    Folgequest = "Las Buenas y las Malas Noticias (Debes completar las cadenas de misiones de Stewvul, Ex-B.F.F. y Nunca me preguntes sobre mi negocio)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.MoltenCore.Alliance[7] = {
    Title = "¿Unas Gafas? ¡Sin Problemas!",
    Level = 60,
    Attain = 60,
    Aim = "Encuentra las Gafas de Visión de Narain y devuélveselas a Narain Hablacenteno en Tanaris.",
    Location = "Narain Sabelotodo (Tanaris "..yellow.."65,18"..white..")",
    Note = "Cae de un jefe en el Núcleo de Magma.",
    Prequest = "Stewvul, Ex-M.E.J.A.",
    Folgequest = "Las Buenas y las Malas Noticias (Debes completar las cadenas de misiones de Dracónico para Principiantes y Nunca me preguntes sobre mi negocio)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18253, quantity = 3 }, --Major Rejuvenation Potion Potion
    }
}
for i = 1, 7 do
    kQuestInstanceData.MoltenCore.Horde[i] = kQuestInstanceData.MoltenCore.Alliance[i]
end

--------------- Naxxramas ---------------
kQuestInstanceData.Naxxramas = {
    Story = "Flotando sobre las Tierras de la Peste, la necrópolis conocida como Naxxramas sirve como sede de uno de los oficiales más poderosos del Rey Exánime, el temible liche Kel'Thuzad. Los horrores del pasado y nuevos terrores aún por desatarse se están reuniendo dentro de la necrópolis mientras los sirvientes del Rey Exánime preparan su asalto. Pronto la Plaga marchará de nuevo...",
    Caption = "Naxxramas",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Naxxramas.Alliance[1] = {
    Title = "La Caída de Kel'Thuzad",
    Level = 60,
    Attain = 60,
    Aim = "Lleva el Filacteria de Kel'Thuzad a la Capilla de la Esperanza de la Luz en las Tierras de la Peste del Este.",
    Location = "Kel'Thuzad (Naxxramas "..yellow.."green 2"..white..")",
    Note = "Padre Íñigo Montoya (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,58"..white..")",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 23206 }, --Mark of the Champion Trinket
        { id = 23207 }, --Mark of the Champion Trinket
    }
}
kQuestInstanceData.Naxxramas.Alliance[2] = {
    Title = "La Única Canción que Conozco...",
    Level = 60,
    Attain = 60,
    Aim = "El Artesano Wilhelm en la Capilla de la Esperanza de la Luz en las Tierras de la Peste del Este quiere que le traigas 2 Runas Congeladas, 2 Esencias de Agua, 2 Zafiros Azules y 30 piezas de oro.",
    Location = "Artesano Fijalontad (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,60"..white..")",
    Note = "Las Runas Congeladas vienen de las Hachas Profanas en Naxxramas.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 22700 }, --Glacial Leggings Legs, Cloth
        { id = 22699 }, --Icebane Leggings Legs, Plate
        { id = 22702 }, --Icy Scale Leggings Legs, Mail
        { id = 22701 }, --Polar Leggings Legs, Leather
    }
}
kQuestInstanceData.Naxxramas.Alliance[3] = {
    Title = "Ecos de Guerra",
    Level = 60,
    Attain = 60,
    Aim = "El Comandante Eligor Albar en la Capilla de la Esperanza de la Luz en las Tierras de la Peste del Este quiere que mates 5 Monstruosidades Vivientes, 5 Gárgolas Pielpiedra, 8 Capitanes Caballero de la Muerte y 3 Acechadores Venenosos.",
    Location = "Comandante Eligor Albar (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."82,58"..white..")",
    Note = "Los enemigos para esta misión son enemigos menores al principio de cada ala de Naxxramas. Esta misión es un requisito previo para las misiones de armadura de Nivel 3.",
    Prequest = "La Ciudadela del Terror - Naxxramas",
}
kQuestInstanceData.Naxxramas.Alliance[4] = {
    Title = "El Destino de Ramaladni",
    Level = 60,
    Attain = 60,
    Aim = "Entra en Naxxramas y descubre el Destino de Ramaladni.",
    Location = "Korfax, Campeón de la Luz (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."82,58"..white..")",
    Note = "Un anillo para esta misión caerá de un enemigo aleatorio en Naxxramas. Todos los que tengan la misión pueden recogerlo.",
    Folgequest = "El Apretón Helado de Ramaladni",
}
kQuestInstanceData.Naxxramas.Alliance[5] = {
    Title = "El Apretón Helado de Ramaladni",
    Level = 60,
    Attain = 60,
    Aim = "Korfax en la Capilla de la Esperanza de la Luz en las Tierras de la Peste del Este quiere que le traigas 1 Runa Helada, 1 Zafiro Azul y 1 Barra de Arcanita.",
    Location = "Korfax, Campeón de la Luz (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."82,58"..white..")",
    Note = "Las Runas Congeladas vienen de las Hachas Profanas en Naxxramas.",
    Prequest = "El Destino de Ramaladni",
    Rewards = {
        Text = "Recompensa: ",
        { id = 22707 }, --Ramaladni's Icy Grasp Ring
    }
}
for i = 1, 5 do
    kQuestInstanceData.Naxxramas.Horde[i] = kQuestInstanceData.Naxxramas.Alliance[i]
end

--------------- Onyxias Lair ---------------
kQuestInstanceData.OnyxiasLair = {
    Story = "Onyxia es la hija del poderoso dragón Alamuerte, y hermana del intrigante Nefarian, Señor de la Cumbre de Roca Negra. Se dice que Onyxia se deleita en corromper las razas mortales al entrometerse en sus asuntos políticos. Con este fin, se cree que adopta varias formas humanoides y usa su encanto y poder para influir en asuntos delicados entre las diferentes razas. Algunos creen que Onyxia incluso ha asumido un alias usado una vez por su padre: el título de la Casa real Prestor. Cuando no se entromete en asuntos mortales, Onyxia reside en una cueva ardiente debajo del Dragonmurk, un pantano lúgubre ubicado dentro del Marjal Revolcafango. Allí está custodiada por sus parientes, los miembros restantes del insidioso Vuelo de Dragones Negros.",
    Caption = "Onyxias Lair",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.OnyxiasLair.Alliance[1] = {
    Title = "La Forja de Quel'Serrar",
    Level = 60,
    Attain = 60,
    Aim = "Dale la Espada Elfa Deslustrada y Sin Filo al Guardián del Conocimiento Lydros.",
    Location = "Tradicionalista Lydros (La Masacre - West o North "..yellow.."[1] Library"..white..")",
    Note = "Suelta la Espada frente a Onyxia cuando esté al 10% o 15% de salud. Ella tendrá que respirar sobre ella y calentarla. Cuando Onyxia muera, recoge la espada de nuevo, haz clic en su cadáver y usa la espada. Entonces estarás listo para entregar la misión.",
    Prequest = "El Compendio de Foror ("..yellow.."La Masacre Oeste"..white..") -> La Forja de Quel'Serrar", -- 7507 -> 7508",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18348 }, --Quel'Serrar Main Hand, Sword
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[2] = {
    Title = "La Única Receta",
    Level = 60,
    Attain = 60,
    Aim = "Recupera los 8 capítulos perdidos de Dracónico para Tontos y combínalos con la Encuadernación Mágica de Libros y devuelve el libro completo de Dracónico para Tontos: Volumen II a Narain Soothfancy en Tanaris.",
    Location = "Narain Sabelotodo (Tanaris "..yellow.."65, 18"..white..")".."Dracónico para Principiantes (cae de Onyxia "..yellow.."[3]"..white..")",
    Note = "Solo una persona puede despojar el Capítulo. Dracónico para Principiantes VI (cae de Onyxia "..yellow.."[3]"..white..")",
    Prequest = "¡Señuelo!",
    Folgequest = "Las Buenas y las Malas Noticias (Debes completar las cadenas de misiones de Stewvul, Ex-B.F.F. y Nunca me preguntes sobre mi negocio)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[3] = {
    Title = "Victoria para la Alianza",
    Level = 60,
    Attain = 60,
    Aim = "Lleva la Cabeza de Onyxia al Alto Señor Bolvar Fordragón en Ventormenta.",
    Location = "Cabeza de Onyxia (cae de Onyxia "..yellow.."[3]"..white..")",
    Note = "El Alto Señor Bolvar ForDragón está en (Ciudad de Ventormenta - Castillo de Ventormenta "..yellow.."78,20"..white.."). Solo una persona en la banda puede despojar este objeto y la misión solo se puede hacer una vez.\nLas recompensas listadas son para la misión siguiente.",
    Folgequest = "Celebrando Buenos Tiempos",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 18406 }, --Onyxia Blood Talisman Trinket
        { id = 18403 }, --Dragonslayer's Signet Ring
        { id = 18404 }, --Onyxia Tooth Pendant Neck
    }
}
kQuestInstanceData.OnyxiasLair.Horde[1] = kQuestInstanceData.OnyxiasLair.Alliance[1]
kQuestInstanceData.OnyxiasLair.Horde[2] = kQuestInstanceData.OnyxiasLair.Alliance[2]
kQuestInstanceData.OnyxiasLair.Horde[3] = createInheritedQuest(
    kQuestInstanceData.OnyxiasLair.Alliance[3],
    {
        Title = "Victoria para la Horda",
        Aim = "Lleva la Cabeza de Onyxia a Thrall en Orgrimmar.",
        Note = "Thrall está en (Orgrimmar - Valle de la Sabiduría "..yellow.."31, 37"..white.."). Solo una persona en la banda puede despojar este objeto y la misión solo se puede hacer una vez.\nLas recompensas listadas son para la misión siguiente.",
        Folgequest = "Para que Todos lo Vean",
    }
)

--------------- Zahúrda Rajacieno ---------------
kQuestInstanceData.RazorfenDowns = {
    Story = "Forjado de las mismas poderosas enredaderas que Horado Rajacieno, Zahúrda Rajacieno es la ciudad capital tradicional de la raza jabalí. El extenso laberinto plagado de espinas alberga un verdadero ejército de jabalíes leales así como sus sumos sacerdotes: la tribu Cabeza de Muerte. Sin embargo, recientemente, una sombra amenazante ha caído sobre la tosca guarida. Agentes de la Plaga no-muerta, liderados por el liche Amnennar el Gélido, han tomado control sobre la raza jabalí y han convertido el laberinto de espinas en un bastión del poder no-muerto. Ahora los jabalíes luchan una batalla desesperada para reclamar su amada ciudad antes de que Amnennar extienda su control a través de Los Baldíos.",
    Caption = "Zahúrda Rajacieno",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenDowns.Alliance[1] = {
    Title = "Un Anfitrión del Mal",
    Level = 35,
    Attain = 28,
    Aim = "Mata 8 Guardias de Batalla de los Baldíos, 8 Tejeespinas de los Baldíos y 8 Cultistas Cabeza de la Muerte y regresa con Myriam Cantoluna cerca de la entrada a las Cuevas de los Lamentos.",
    Location = "Myriam Lunacanta (Los Baldíos "..yellow.."49,94"..white..")",
    Note = "Puedes encontrar a los enemigos y al dador de misiones en el área justo antes de la entrada de la instancia.",
}
kQuestInstanceData.RazorfenDowns.Alliance[2] = {
    Title = "Extinguir el Ídolo",
    Level = 37,
    Attain = 32,
    Aim = "Escolta a Belnistrasz hasta el ídolo de los Quilboar en los Horados de Rajacieno.$B$BProtege a Belnistrasz mientras realiza el ritual para desactivar el ídolo.",
    Location = "Belnistrasz (Zahúrda Rajacieno "..yellow.."[2]"..white..")",
    Note = "La misión anterior es solo que aceptas ayudarlo. Varios enemigos aparecen y atacan a Belnistrasz mientras intenta apagar el ídolo. Después de completar la misión, puedes entregarla en el brasero frente al ídolo.",
    Prequest = "El Azote de los Llanos",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Alliance[3] = {
    Title = "Trae la Luz",
    Level = 42,
    Attain = 39,
    Aim = "El Arzobispo Bendictus quiere que mates a Amnennar el Portafrío en los Túmulos de Laderaguja.",
    Location = "Arzobispo Benedictus (Ventormenta - Catedral de la Luz "..yellow.."39,27"..white..")",
    Note = "Amnennar el Gélido es el último jefe en Zahúrda Rajacieno. Puedes encontrarlo en "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[1] = kQuestInstanceData.RazorfenDowns.Alliance[1]
kQuestInstanceData.RazorfenDowns.Horde[2] = {
    Title = "Una Alianza Nefasta",
    Level = 36,
    Attain = 28,
    Aim = "Lleva la Cabeza del Embajador Malcin a Varimathras en Entrañas.",
    Location = "Varimathras (Entrañas - Barrio Real "..yellow.."56,92"..white..")",
    Note = "La misión anterior se puede obtener del último Jefe en Horado Rajacieno. Encuentras a Malcín afuera (Los Baldíos "..yellow.."48,92"..white..").",
    Prequest = "Una Alianza Nefasta",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 17039 }, --Skullbreaker Main Hand, Mace
        { id = 17042 }, --Nail Spitter Gun
        { id = 17043 }, --Zealot's Robe Chest, Cloth
    }
}
kQuestInstanceData.RazorfenDowns.Horde[3] = {
    Title = "Extinguir el Ídolo",
    Level = 37,
    Attain = 32,
    Aim = "Escolta a Belnistrasz hasta el ídolo de los Quilboar en los Horados de Rajacieno.$B$BProtege a Belnistrasz mientras realiza el ritual para desactivar el ídolo.",
    Location = "Belnistrasz (Zahúrda Rajacieno "..yellow.."[2]"..white..")",
    Note = "La misión anterior es solo que aceptas ayudarlo. Varios enemigos aparecen y atacan a Belnistrasz mientras intenta apagar el ídolo. Después de completar la misión, puedes entregarla en el brasero frente al ídolo.",
    Prequest = "El Azote de los Llanos",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Horde[4] = {
    Title = "Acaba con la Amenaza",
    Level = 42,
    Attain = 37,
    Aim = "Andrew Brownell quiere que mates a Amnennar el Portafrío y devuelvas su cráneo.",
    Location = "Andrew Brownell (Entrañas - El Barrio Mágico "..yellow.."72,32"..white..")",
    Note = "Amnennar el Gélido es el último Jefe en Zahúrda Rajacieno. Puedes encontrarlo en "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[5] = {
    Title = "Los Poderes Más Allá",
    Level = 44,
    Attain = 38,
    Aim = "Adéntrate en las Cuevas de los Lamentos, mata a Amnennar el Portafrío y recupera su filacteria para el Obispo Oscuro Mordren en la Iglesia Stillward en Gilneas.",
    Location = "Obispo Oscuro Mordren (Gilneas - Iglesia Stillward "..yellow.."57.7,39.6"..white..")",
    Note = "La cadena de misiones comienza con la misión 'A Través de la Magia Superior' en el Obispo Oscuro Mordren.\nAmnennar el Gélido "..yellow.."[6]"..white.." suelta la Filacteria de Obsidiana.\nObtendrás la recompensa al completar la última misión de la cadena.",
    Prequest = "A Través de la Magia Superior -> El Cetro de Cuervarbol",
    Folgequest = "La Piedra de Cringris"..yellow.."[Ciudad de Gilneas]"..white.."-> El Don del Obispo Oscuro", -- 40996, 40997",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}

--------------- Razorfen Kraul ---------------
kQuestInstanceData.RazorfenKraul = {
    Story = "Hace diez mil años, durante la Guerra de los Ancestros, el poderoso semidiós Agamaggan se presentó para batallar contra la Legión Ardiente. Aunque el colosal jabalí cayó en combate, sus acciones ayudaron a salvar a Azeroth de la ruina. Sin embargo, con el tiempo, en las áreas donde cayó su sangre, brotaron de la tierra enormes enredaderas plagadas de espinas. Los jabalíes, considerados como la descendencia mortal del poderoso dios, llegaron a ocupar estas regiones y las consideraron sagradas. El corazón de estas colonias de espinas se conoció como Rajacieno. La gran masa de Horado Rajacieno fue conquistada por la vieja bruja, Charlga Flanco Navaja. Bajo su gobierno, los jabalíes chamánicos organizan ataques contra tribus rivales así como aldeas de la Horda. Algunos especulan que Charlga incluso ha estado negociando con agentes de la Plaga, alineando a su tribu desprevenida con las filas de los No-muertos para algún propósito insidioso.",
    Caption = "Horado Rajacieno",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenKraul.Alliance[1] = {
    Title = "Los Tubérculos Hojazul",
    Level = 26,
    Attain = 20,
    Aim = "Toma una Caja con Agujeros.$BToma un Bastón de Mando de Hocicono.$BToma y lee el Manual del Dueño de Hocicono.$B$BEn Zanja Cardizal, usa la Caja con Agujeros para invocar un Hocicono, y usa el Bastón de Mando en el hocicono para hacer que busque Tubérculos.$B$BTrae 6 Tubérculos Hoja Azul, el Bastón de Mando de Hocicono y la Caja con Agujeros a Mebok Mizzyrix en Ratchet.",
    Location = "Mebok Mizzyrix (Los Baldíos - Ratchett "..yellow.."62,37"..white..")",
    Note = "La Caja, el Palo y el Manual se pueden encontrar cerca de Mebok Mizzyrix.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6755 }, --A Small Container of Gems Container
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[2] = {
    Title = "La Mortalidad Disminuye",
    Level = 30,
    Attain = 25,
    Aim = "Encuentra y devuelve el Colgante de Treshala a Treshala Pardoluna en Darnassus.",
    Location = "Heraltha Fallowbrook (Horado Rajacieno "..yellow.."[8]"..white..")",
    Note = "El colgante es una caída aleatoria. Debes llevar el colgante a Treshala Arroyobarbecho en Darnassus - Terraza de los Comerciantes ("..yellow.."69,67"..white..").",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6751 }, --Mourning Shawl Back
        { id = 6752 }, --Lancer Boots Feet, Leather
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[3] = {
    Title = "Willix el Importador",
    Level = 30,
    Attain = 23,
    Aim = "Escolta a Willix el Importador fuera de Rajacieno.",
    Location = "Willix el Importador (Horado Rajacieno "..yellow.."[8]"..white..")",
    Note = "Willix el Importador debe ser escoltado hasta la entrada de la instancia. La misión se entrega a él cuando se completa.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[4] = {
    Title = "La Bruja del Horado",
    Level = 34,
    Attain = 29,
    Aim = "Lleva el Medallón de Filocorto a Falfindel Errante en Thalanaar.",
    Location = "Díscolo Falfindel (Feralas - Thalanaar "..yellow.."89,46"..white..")",
    Note = "Charlga Filonavaja "..yellow.."[7]"..white.." suelta el Medallón requerido para esta misión.",
    Prequest = "El Diario de Lonebrow",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[5] = {
    Title = "Malla Endurecida por el Fuego",
    Level = 28,
    Attain = 20,
    Aim = "Reúne los materiales que Furen Barba Larga requiere y llévaselos a él en Ventormenta.",
    Location = "Furen Barbalarga (Ventormenta - Distrito de los Enanos "..yellow.."57,16"..white..")",
    Note = red.."Solo Guerrero"..white..": Obtienes el Frasco de Flogisto de Roogug en "..yellow.."[1]"..white..".La misión siguiente es diferente para cada raza. Sangre Ardiente para Humanos, Coral de Hierro para Enanos y Gnomos y Conchas Abrasadas por el Sol para Elfos de la Noche.", -- 1705, 1710, 1708    Prequest = "El Forjador de Escudos",
    Folgequest = "(Ver nota)",
}
kQuestInstanceData.RazorfenKraul.Horde[1] = kQuestInstanceData.RazorfenKraul.Alliance[1]
kQuestInstanceData.RazorfenKraul.Horde[2] = {
    Title = "Willix el Importador",
    Level = 30,
    Attain = 23,
    Aim = "Escolta a Willix el Importador fuera de Rajacieno.",
    Location = "Willix el Importador (Horado Rajacieno "..yellow.."[8]"..white..")",
    Note = "Willix el Importador debe ser escoltado hasta la entrada de la instancia. La misión se entrega a él cuando se completa.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Horde[3] = {
    Title = "Guano del Horado",
    Level = 33,
    Attain = 30,
    Aim = "Lleva 1 montón de Guano de Kraul al Maestro Boticario Faranell en Entrañas.",
    Location = "Maestro Boticario Faranell (Entrañas - El Apotecarium "..yellow.."48,69 "..white..")",
    Note = "El Guano de Kraul es soltado por cualquiera de los murciélagos encontrados dentro de la instancia.",
    Folgequest = "Corazones de Celos ("..yellow.."[Scarlet Monastery]"..white..")", -- 1113",
}
kQuestInstanceData.RazorfenKraul.Horde[4] = {
    Title = "Un Destino Vengador",
    Level = 34,
    Attain = 29,
    Aim = "Lleva el Corazón de Filocorto a Auld Pico de Piedra en Cima del Trueno.",
    Location = "Auld Picopiedra (Thunderbluff "..yellow.."36,59"..white..")",
    Note = "Puedes encontrar a Charlga Filonavaja en "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Horde[5] = {
    Title = "Armadura Brutal",
    Level = 30,
    Attain = 20,
    Aim = "Lleva a Thun'grim Firegaze 15 Lingotes de Hierro Ahumado, 10 Azurita en Polvo, 10 Barras de Hierro y un Frasco de Flogisto.",
    Location = "Thun'Grim Vistafuego (Los Baldíos "..yellow.."57,30"..white..")",
    Note = red.."Solo Guerrero"..white..": Obtienes el Frasco de Flogisto de Roogug en "..yellow.."[1]"..white.."Completar esta misión te permite comenzar cuatro nuevas misiones del mismo PNJ.",
    Prequest = "Hablar con Thun'grim",
    Folgequest = "(Ver nota)",
}
kQuestInstanceData.RazorfenKraul.Horde[6] = {
    Title = "Corazón de zarza corrompido",
    Level = 30,
    Attain = 20,
    Aim = "Destruye la encarnación viva de la corrupción natural dentro de las profundidades de Razorfen Kraul y lleva el Corazón de Espinas Corrompido a Kym Wildmane en Thunderbluff.",
    Location = "Kym Bravacrín (Cima del Trueno - La Cima del Ancestro "..yellow.."77,29"..white..")",
    Note = "El Corazón espinoso contaminado es soltado por Espina Podrida, ubicado en "..yellow.."[5]|r.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 41854 }, --Wildbranch Leggings, Cloth
        { id = 41855 }, --Fenweave Gloves, Mail
    }
}

--------------- SM: Library ---------------
kQuestInstanceData.ScarletMonasteryLibrary = {
    Story = "El Monasterio fue una vez un bastión orgulloso del sacerdocio de Lordaeron - un centro de aprendizaje e iluminación. Con el surgimiento de la Plaga no-muerta durante la Tercera Guerra, el pacífico Monasterio se convirtió en una fortaleza de la fanática Cruzada Escarlata. Los Cruzados son intolerantes con todas las razas no humanas, independientemente de su alianza o afiliación. Creen que todos los forasteros son portadores potenciales de la plaga no-muerta - y deben ser destruidos. Los informes indican que los aventureros que entran al monasterio se ven obligados a enfrentarse al Comandante Escarlata Mograine - quien comanda una gran guarnición de guerreros fanáticamente devotos. Sin embargo, el verdadero maestro del monasterio es la Alta Inquisidora Melenablanca - una temible sacerdotisa que posee la habilidad de resucitar guerreros caídos para luchar en su nombre.",
    Caption = "Monasterio Escarlata: Library",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1] = {
    Title = "En el Nombre de la Luz",
    Level = 40,
    Attain = 34,
    Aim = "Mata a la Gran Inquisidora Canisbia, al Comandante Escarlata Mograine, a Herod el Campeón Escarlata y al Maestro de canes Loksey, luego informa a Raleigh el Devoto en Costasur.",
    Location = "Raleigh el Devoto (Laderas de Trabalomas - Costa Sur "..yellow.."51,58"..white..")",
    Note = "Esta línea de misiones comienza en Hermano Cuerviz con la misión 'Hermano Anton' en Ventormenta - Catedral de la Luz ("..yellow.."42,24"..white..").Puedes encontrar a la Alta Inquisidora Melenablanca y al Comandante Escarlata Mograine en "..yellow.."MS: Catedral [2]"..white..", a Herod en "..yellow.."MS: Armería [1]"..white.." y al Maestro de Canes Loksey en "..yellow.."MS: Biblioteca [1]"..white..".",
    Prequest = "Hermano Anton -> Por el Sendero Escarlata",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6829 }, --Sword of Serenity One-Hand, Sword
        { id = 6830 }, --Bonebiter Two-Hand, Axe
        { id = 6831 }, --Black Menace One-Hand, Dagger
        { id = 11262 }, --Orb of Lorica Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[2] = {
    Title = "Mitología de los Titanes",
    Level = 38,
    Attain = 28,
    Aim = "Recupera la Mitología de los Titanes del Monasterio y llévasela a la Bibliotecaria Mae Polvovana en Forjaz.",
    Location = "Bibliotecaria Mae Palipolvo (Forjaz - Salón de los Exploradores "..yellow.."74,12"..white..")",
    Note = "El libro está en el suelo en el lado izquierdo de uno de los corredores que conducen al Arcanista Doan ("..yellow.."[2]"..white..").",
    Rewards = {
        Text = "Recompensa: ",
        { id = 7746 }, --Explorers' League Commendation Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[3] = {
    Title = "Rituales de Poder",
    Level = 40,
    Attain = 30,
    Aim = "Lleva el libro Rituales de Poder a Tabetha en los Pantanos de Dustwallow.",
    Location = "Tabetha (Marjal Revolcafango "..yellow.."43,57"..white..")",
    Note = red.."Solo Mago"..white..": Puedes encontrar el libro en el último corredor que conduce al Arcanista Doan ("..yellow.."[2]"..white..").",
    Prequest = "Obtener la Primicia",
    Folgequest = "Varita del Mago",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[1] = {
    Title = "Corazones de Celos",
    Level = 33,
    Attain = 30,
    Aim = "El Maestro Boticario Faranell en Entrañas quiere 20 Corazones de Celador.",
    Location = "Maestro Boticario Faranell (Entrañas - El Apotecarium "..yellow.."48,69"..white..")",
    Note = "Todos los enemigos en el Monasterio Escarlata sueltan Corazones de Celos.",
    Prequest = "Guano del Horado ("..yellow.."[Razorfen Kraul]"..white..")", -- 1109",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[2] = {
    Title = "Al Monasterio Escarlata",
    Level = 42,
    Attain = 33,
    Aim = "Mata a la Gran Inquisidora Canisbia, al Comandante Escarlata Mograine, a Herod el Campeón Escarlata y al Maestro de canes Loksey, luego informa a Varimathras en Entrañas.",
    Location = "Varimathras (Entrañas - Barrio Real "..yellow.."56,92"..white..")",
    Note = "Puedes encontrar a la Alta Inquisidora Melenablanca y al Comandante Escarlata Mograine en "..yellow.."MS: Catedral [2]"..white..", a Herod en "..yellow.."MS: Armería [1]"..white.." y al Maestro de Canes Loksey en "..yellow.."MS: Biblioteca [1]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6802 }, --Sword of Omen One-Hand, Sword
        { id = 6803 }, --Prophetic Cane Held In Off-hand
        { id = 10711 }, --Dragon's Blood Necklace Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[3] = {
    Title = "Compendio de los Caídos",
    Level = 38,
    Attain = 28,
    Aim = "Recupera el Compendio de los Caídos del Monasterio en los Claros de Tirisfal y llévaselo al Sabio Buscador de la Verdad en Cima del Trueno.",
    Location = "Sabio Buscaverdad (Thunderbluff "..yellow.."34,47"..white..")",
    Note = "Puedes encontrar el libro en la sección de la Biblioteca del Monasterio Escarlata.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 7747 }, --Vile Protector Shield
        { id = 17508 }, --Forcestone Buckler Shield
        { id = 7749 }, --Omega Orb Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[4] = {
    Title = "Prueba de Sabiduría",
    Level = 36,
    Attain = 25,
    Aim = "Encuentra a Braug Espíritu Tenue cerca de la entrada al Sendero Talondeep en las Montañas Filospada.",
    Location = "Parqual Fintallas (Entrañas - El Apotecarium "..yellow.."57,65"..white..")",
    Note = "La línea de misiones comienza en Dorn Acechallanos con la misión 'Prueba de Fe' (Las Mil Agujas "..yellow.."53,41"..white.."). Puedes encontrar el libro en la Biblioteca del Monasterio Escarlata.",
    Prequest = "Prueba de Fe -> Prueba de Sabiduría",
    Folgequest = "Prueba de Sabiduría",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[5] = {
    Title = "Rituales de Poder",
    Level = 40,
    Attain = 30,
    Aim = "Lleva el libro Rituales de Poder a Tabetha en los Pantanos de Dustwallow.",
    Location = "Tabetha (Marjal Revolcafango "..yellow.."43,57"..white..")",
    Note = red.."Solo Mago"..white..": Puedes encontrar el libro en el último corredor que conduce al Arcanista Doan ("..yellow.."[2]"..white..").",
    Prequest = "Obtener la Primicia",
    Folgequest = "Varita del Mago",
}

--------------- SM: Armory ---------------
kQuestInstanceData.ScarletMonasteryArmory = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Monasterio Escarlata: Armory",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryArmory.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[2] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[2]
kQuestInstanceData.ScarletMonasteryArmory.Horde[3] = {
    Title = "Reminiscencia de Acero",
    Level = 39,
    Attain = 33,
    Aim = "Mata al Intendente del Arsenal Daghelm y devuelve el diario de Basil a él en Entrañas.",
    Location = "Basil Frye (Entrañas "..yellow.."60, 29"..white..")",
    Note = "Cae del Sargento del Arsenal Daghelm [2].",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 7964 }, --Solid Sharpening Stone Enchant
        { id = 7965 }, --Solid Weightstone Enchant
    }
}

--------------- SM: Cathedral ---------------
kQuestInstanceData.ScarletMonasteryCathedral = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Monasterio Escarlata: Cathedral",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[2] = {
    Title = "El Orbe de Kaladus",
    Level = 38,
    Attain = 30,
    Aim = "Adéntrate en el Monasterio Escarlata y encuentra el Orbe de Kaladus, recúperalo y devuélveselo al Guarda Paladín Janathos en el Bastión Penasur.",
    Location = "Paladín de la Guardia Janathos (Pantano de las Penas - Castillo de la Guardia del Dolor "..yellow.."2,51"..white..")",
    Note = "El Cofre de Madera Envejecida contiene el objeto. Puedes encontrar el Orbe de Kaladus dentro de la segunda cámara, a la izquierda de "..yellow.."[2]"..white..".",
    Prequest = "La Rata de Agua -> El Tomo Olvidado -> Regresando con Janathos",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60316 }, --Truthkeeper Mantle Shoulder, Plate
        { id = 60317 }, --Lightgraced Mallet Main Hand, Mace
        { id = 60318 }, --Sorrowguard Clutch Waist, Leather
    }
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[3] = {
    Title = "Corrupción Escarlata",
    Level = 44,
    Attain = 35,
    Aim = "Descubre la verdad sobre el destino del Alto Inquisidor Fairbanks para el Hermano Elias en la Taberna Sombría en Gilneas.",
    Location = "Hermano Elias <Scarlet Crusade Emissary> (Gilneas - Ruinas de Greyshire - Taberna Sombraloma "..yellow.."[33.6,54.1]"..white..", 2nd floor.)",
    Note = "Aliados Contra la No Muerte start at same NPC.",
    Prequest = "Aliados Contra la No Muerte",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61478 }, --Ring of Holy Sacrement Ring
    }
}
kQuestInstanceData.ScarletMonasteryCathedral.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryCathedral.Horde[2] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[2]

--------------- SM: Graveyard ---------------
kQuestInstanceData.ScarletMonasteryGraveyard = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Monasterio Escarlata: Graveyard",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[2] = {
    Title = "La Venganza de Vorrel",
    Level = 33,
    Attain = 25,
    Aim = "Devuelve el anillo de bodas de Vorrel Sengutz a Monika Sengutz en Molino Tarren.",
    Location = "Vorrel Sengutz (Monasterio Escarlata - Graveyard "..yellow.."[1]"..white..")",
    Note = "Puedes encontrar a Vorrel Sengutz al principio de la sección del Cementerio del Monasterio Escarlata. Nancy Vishas, quien suelta el anillo necesario para esta misión, puede encontrarse en una casa en las Montañas de Alterac ("..yellow.."31,32"..white..").",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3",
        { id = 7751 }, --Vorrel's Boots Feet, Leather
        { id = 7750 }, --Mantle of Woe Shoulder, Cloth
        { id = 4643 }, --Grimsteel Cape Back
    }
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[3] = {
    Title = "Pinta las Rosas de Rojo",
    Level = 29,
    Attain = 27,
    Aim = "Elimina a las fuerzas Escarlata fuera del Monasterio Escarlata, luego regresa con el Guardia de la Muerte Burgess en Rémol.",
    Location = "Guardia de la Muerte Burgess (Claros de Tirisfal - Brill "..yellow.."61,52"..white..")",
    Note = "Puedes completar esta misión afuera. La línea de misiones comienza en el Tabernero Norman <Tabernero> en Entrañas con la misión 'Escarlata de Rabia'.",
    Prequest = "Escarlata de Rabia",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 51832 }, --Nathrezim Wedge Main Hand, Axe
        { id = 51833 }, --Femur Staff Staff
        { id = 51834 }, --Scarlet Pillar Two-Hand, Mace
    }
}

--------------- Scholomance ---------------
kQuestInstanceData.Scholomance = {
    Story = "La Scholomance está alojada dentro de una serie de criptas que yacen bajo el torreón en ruinas de Castel Darrow. Una vez propiedad de la noble familia Barov, Castel Darrow cayó en ruinas después de la Segunda Guerra. Cuando el mago Kel'Thuzad reclutó seguidores para su Culto de los Condenados, a menudo prometía inmortalidad a cambio de servir a su Rey Exánime. La familia Barov cayó bajo la influencia carismática de Kel'Thuzad y donó el torreón y sus criptas a la Plaga. Los cultistas luego mataron a los Barov y convirtieron las antiguas criptas en una escuela de nigromancia conocida como la Scholomance. Aunque Kel'Thuzad ya no reside en las criptas, cultistas devotos e instructores aún permanecen. El poderoso liche, Ras Levescarcha, gobierna sobre el sitio y lo guarda en nombre de la Plaga - mientras que el nigromante mortal, Maestro Oscuro Gandling, sirve como el insidioso director de la escuela.",
    Caption = "Scholomance",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Scholomance.Alliance[1] = {
    Title = "Crías de la Plaga",
    Level = 58,
    Attain = 55,
    Aim = "Mata 20 Crías Apestadas, luego regresa con Betina Bigglezink en la Capilla de la Esperanza de la Luz.",
    Location = "Betina Bigglezink (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Las Crías de la Plaga están en el camino a Traquesangre en una habitación grande.",
    Folgequest = "Escama de Dragón Saludable",
}
kQuestInstanceData.Scholomance.Alliance[2] = {
    Title = "Escama de Dragón Saludable",
    Level = 58,
    Attain = 55,
    Aim = "Lleva la Escama de Dragón Saludable a Betina Bigglezink en la Capilla de la Esperanza de la Luz en las Tierras de la Peste del Este.",
    Location = "Escama de Dragón Saludable (random drop in Scholomance)",
    Note = "Las Crías de la Plaga sueltan las Escamas de Dragón Sanas (8% de probabilidad de caída). Puedes encontrar a Betina Bigglezink en Tierras de la Peste del Este - Capilla de la Esperanza de la Luz ("..yellow.."81,59"..white..").",
    Prequest = "Crías de la Plaga",
}
kQuestInstanceData.Scholomance.Alliance[3] = {
    Title = "Doctor Theolen Krastinov, el Carnicero",
    Level = 60,
    Attain = 55,
    Aim = "Encuentra al Doctor Theolen Krastinov dentro de Scholomance. Destrúyelo, luego quema los Restos de Eva Sarkhoff y los Restos de Lucien Sarkhoff. Regresa con Eva Sarkhoff cuando la tarea esté completa.",
    Location = "Eva Sarkhoff (Tierras de la Peste del Oeste - Castel Darrow "..yellow.."70,73"..white..")",
    Note = "Encuentras al Doctor Theolen Krastinov, los restos de Eva Sarkhoff y los restos de Lucien Sarkhoff en "..yellow.."[9]"..white..".",
    Folgequest = "El Saco de Horrores de Krastinov",
}
kQuestInstanceData.Scholomance.Alliance[4] = {
    Title = "Krastinov's Bag of Horrors",
    Level = 60,
    Attain = 55,
    Aim = "Lleva el Saco de Horrores a Eva Sarkhoff en Castel Darrow.",
    Location = "Eva Sarkhoff (Tierras de la Peste del Oeste - Castel Darrow "..yellow.."70,73"..white..")",
    Note = "Puedes encontrar a Jandice Barov en "..yellow.."[3]"..white..".",
    Prequest = "Doctor Theolen Krastinov, el Carnicero",
    Folgequest = "Kirtonos el Heraldo",
}
kQuestInstanceData.Scholomance.Alliance[5] = {
    Title = "Kirtonos el Heraldo",
    Level = 60,
    Attain = 55,
    Aim = "Regresa a Scholomance con la Sangre de los Inocentes. Encuentra el porche y coloca la Sangre de los Inocentes en el brasero. Kirtonos vendrá a alimentarse de tu alma.$B$B¡Lucha con valentía, no cedas ni un centímetro! Destruye a Kirtonos y regresa con Eva Sarkhoff.",
    Location = "Eva Sarkhoff (Tierras de la Peste del Oeste - Castel Darrow "..yellow.."70,73"..white..")",
    Note = "El porche está en "..yellow.."[2]"..white..".",
    Prequest = "El Saco de Horrores de Krastinov",
    Folgequest = "Peones Perezosos",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3",
        { id = 13544 }, --Spectral Essence Trinket
        { id = 15805 }, --Penelope's Rose Held In Off-hand
        { id = 15806 }, --Mirah's Song One-Hand, Sword
    }
}
kQuestInstanceData.Scholomance.Alliance[6] = {
    Title = "Recuerdo Ligado al Alma",
    Level = 60,
    Attain = 57,
    Aim = "Encuentra a Ras Murmuhielo en Scholomance. Cuando lo encuentres, usa la Reliquia de Almas en su rostro no muerto. Si logras revertirlo a su forma mortal, mátalo y recupera la Cabeza Humana de Ras Murmuhielo. Lleva la cabeza de vuelta al Magistrado Marduke.",
    Location = "Magistrado Marduke (Tierras de la Peste del Oeste - Castel Darrow "..yellow.."70,73"..white..")",
    Note = "Puedes encontrar a Ras Levescarcha en "..yellow.."[7]"..white..".",
    Prequest = "Peones Perezosos -> El Regalo de Menethil",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3 o 4",
        { id = 14002 }, --Darrowshire Strongguard Shield
        { id = 13982 }, --Warblade of Caer Darrow Two-Hand, Sword
        { id = 13986 }, --Crown of Caer Darrow Head, Cloth
        { id = 13984 }, --Darrowspike One-Hand, Dagger
    }
}
kQuestInstanceData.Scholomance.Alliance[7] = {
    Title = "La Fortuna de la Familia Barov",
    Level = 60,
    Attain = 52,
    Aim = "Viaja a Scholomance y recupera la fortuna de la familia Barov. Esta fortuna consta de cuatro escrituras: La Escritura de Castel Darrow, La Escritura de Rémol, La Escritura de Molino Tarren y La Escritura de Costasur. Regresa con Alexi Barov cuando hayas completado esta tarea.",
    Location = "Weldon Barov (Tierras de la Peste del Oeste - Campo de Viento Frío "..yellow.."43,83"..white..")",
    Note = "Puedes encontrar La Escritura de Castel Darrow en "..yellow.."[12]"..white..", La Escritura de Claros de Tirisfal en "..yellow.."[7]"..white..", La Escritura de Molino Tarren en "..yellow.."[4]"..white.." y La Escritura de Costasur en "..yellow.."[1]"..white..".",
    Folgequest = "El Último Barov",
}
kQuestInstanceData.Scholomance.Alliance[8] = {
    Title = "Gambito del Alba",
    Level = 60,
    Attain = 57,
    Aim = "Coloca la Jugada de Alba en la Sala de Observación de Scholomance. Derrota a Vectus, luego regresa con Betina Bigglezink.",
    Location = "Betina Bigglezink (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Esencia de Cría comienza en Tinkee Vaporhirviendo (Las Estepas Ardientes - Cresta de Llama "..yellow.."65,23"..white.."). La Sala de Observación está en "..yellow.."[6]"..white..".",
    Prequest = "Esencia de Cría -> Betina Bigglezink",
    Rewards = {
        Text = "Rewards:",
        { id = 15853 }, --Windreaper One-Hand, Axe
        { id = 15854 }, --Dancing Sliver Staff
    }
}
kQuestInstanceData.Scholomance.Alliance[9] = {
    Title = "Entrega de Diablillo",
    Level = 60,
    Attain = 60,
    Aim = "Lleva el Diablo en un Tarro al laboratorio de alquimia en Scholomance. Después de crear el pergamino, devuelve el tarro a Gorzeeki Wildeyes.",
    Location = "Gorzeeki Ojos Salvajes (Las Estepas Ardientes "..yellow.."12,31"..white..")",
    Note = red.."Solo Brujo"..white..": Encuentras el laboratorio de alquimia en "..yellow.."[7]"..white..".",
    Prequest = "Mor'zul Sangreoscura -> Polvo Estelar Xorothiano",
    Folgequest = "Corcel de Xoroth ("..yellow.."Dire Maul West"..white..")", -- 7631",
}
kQuestInstanceData.Scholomance.Alliance[10] = {
    Title = "La Pieza Izquierda del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con la Pieza Izquierda del Amuleto de Lord Valthalak y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'.Kormok es invocado en "..yellow.."[7]"..white..".",
    Prequest = "Componentes Importantes",
    Folgequest = "Veo la Isla de Alcaz en Tu Futuro...",
}
kQuestInstanceData.Scholomance.Alliance[11] = {
    Title = "La Pieza Derecha del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con el Amuleto de Lord Valthalak recombinado y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'. Kormok es invocado en "..yellow.."[7]"..white..".",
    Prequest = "Más Componentes Importantes",
    Folgequest = "Preparativos Finales ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
}
kQuestInstanceData.Scholomance.Alliance[12] = {
    Title = "Un Favor para Farsan",
    Level = 58,
    Attain = 55,
    Aim = "Adéntrate en Scholomance y recupera el libro 'Llamamiento y Mando del Fuego' para Strahad Farsan en Ratchet.",
    Location = "Strahad Farsan (Los Baldíos - Ratchett "..yellow.."62.6,35.5"..white..")",
    Note = "La línea de misiones comienza en el Artesano Fijalontad (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz) con la misión 'Una Nueva Frontera Rúnica' !!! Obtendrás esta recompensa después de completar la última misión de la línea de misiones.",
    Prequest = "Una Nueva Frontera Rúnica -> Los Secretos de la Forja Oscura -> Los Secretos de la Forja Oscura",
    Folgequest = "Una Reunión con el Señor del Terror",
    Rewards = {
        Text = "Recompensa: ",
        { id = 81060 }, --Tempered Runeblade Two-Hand, Sword
    }
}
for i = 1, 12 do
    if i ~= 7 then
        kQuestInstanceData.Scholomance.Horde[i] = kQuestInstanceData.Scholomance.Alliance[i]
    end
end
kQuestInstanceData.Scholomance.Horde[7] = createInheritedQuest(
    kQuestInstanceData.Scholomance.Alliance[7],
    {
        Aim = "Adéntrate en Scholomance y recupera el libro 'Llamamiento y Mando del Fuego' para Strahad Farsan en Ratchet.",
        Location = "Alexi Barov (Claros de Tirisfal - El Baluarte "..yellow.."80,73"..white..")",
    }
)

--------------- Shadowfang Keep ---------------
kQuestInstanceData.ShadowfangKeep = {
    Story = "Durante la Tercera Guerra, los magos del Kirin Tor lucharon contra los ejércitos no-muertos de la Plaga. Cuando los magos de Dalaran morían en batalla, se levantaban poco después - añadiendo su antiguo poder a la creciente Plaga. Frustrado por su falta de progreso (y contra el consejo de sus compañeros) el Archimago, Arugal decidió invocar entidades extradimensionales para reforzar las menguantes filas de Dalaran. La invocación de Arugal trajo a los voraces huargos al mundo de Azeroth. Los feroces hombres lobo masacraron no solo a la Plaga, sino que rápidamente se volvieron contra los propios magos. Los huargos sitiaron el torreón del noble, Barón Oscuras Fauces. Situado sobre la pequeña aldea de Pyrebrote, el torreón rápidamente cayó en sombra y ruina. Enloquecido por la culpa, Arugal adoptó a los huargos como sus hijos y se retiró al recién nombrado 'Castillo de Colmillo Oscuro'. Se dice que aún reside allí, protegido por su enorme mascota, Fenrus - y atormentado por el fantasma vengativo del Barón Oscuras Fauces.",
    Caption = "Castillo de Colmillo Oscuro",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ShadowfangKeep.Alliance[1] = {
    Title = "La Prueba de la Rectitud",
    Level = 22,
    Attain = 20,
    Aim = "Habla con Jordan Stilwell en Forjaz.",
    Location = "Jordan Fontana (Dun Morogh - Forjaz Entrance "..yellow.."52,36"..white..")",
    Note = red.."Solo Paladín"..white..": Para ver la nota haz clic en "..yellow.."[Información de La Prueba de la Rectitud]"..white..".",
    Prequest = "El Tomo de Valentía -> La Prueba de la Rectitud",
    Folgequest = "La Prueba de la Rectitud",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = kQuestInstanceData.TheDeadmines.Alliance[6].Page
}
kQuestInstanceData.ShadowfangKeep.Alliance[2] = {
    Title = "El Orbe de Soran'ruk",
    Level = 25,
    Attain = 20,
    Aim = "Encuentra 3 Fragmentos de Soran'ruk y 1 Fragmento Grande de Soran'ruk y llévaselos a Doan Karhan en Los Baldíos.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Solo BRUJO"..white..": Obtienes los 3 Fragmentos de Soran'ruk de los Acólitos del Crepúsculo en "..yellow.."[Cavernas de Brazanegra]"..white..". Obtienes el Fragmento Grande de Soran'ruk en "..yellow.."[Castillo de Colmillo Oscuro]"..white.." de las Almas Oscuras Colmillo de las Sombras.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[3] = {
    Title = "La Locura de Arugal",
    Level = 27,
    Attain = 22,
    Location = "Sumo Hechicero Andromath (Ventormenta - El Barrio de los Magos, Torre de Magos)",
    Note = "El Sumo Hechicero Andromath te ha encargado la muerte del Archimago Arugal "..yellow.."[12]"..white..". Regresa con él cuando hayas terminado.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 51805 }, --Signet of Arugal Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[4] = {
    Title = "El Hechicero Perdido",
    Level = 24,
    Attain = 22,
    Aim = "El Alto Hechicero Andromath quiere que viajes al Castillo de Colmillo Oscuro en el Bosque de Argénteos y descubras qué le pasó al Hechicero Ashcrombe.",
    Location = "Sumo Hechicero Andromath (Ventormenta - El Barrio de los Magos, Torre de Magos)",
    Note = "El Hechicero Ashcrombe está en la jaula "..yellow.."[1]"..white..".",
}
kQuestInstanceData.ShadowfangKeep.Alliance[5] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Recoge sangre de huargen para Fandral Corzocelada. Necesita muestras de sangre de Karazhan, Ciudad de Gilneas y el Castillo de Colmillo Oscuro.",
    Location = "Archidruida Fandral Corzocelada (Darnassus - Enclave Cenarion "..yellow.."35,9"..white..").",
    Note = "[Sangre de Colmillo de Sombras] cae de los Huargos."..white.." [Guadaña de la Diosa] la misión anterior comienza con La Guadaña de Elune que cae del Señor Bosque Negro II "..yellow.."(Salones Inferiores de Karazhan [5]).",
    Prequest = "Guadaña de la Diosa",
    Folgequest = "Sangre de Vorgendor",
}
kQuestInstanceData.ShadowfangKeep.Horde[1] = {
    Title = "Mortacechadores en Castel Darrow",
    Level = 25,
    Attain = 18,
    Aim = "Encuentra a los Acechamuerte Adamant y Acechamuerte Vincent.",
    Location = "Sumo Ejecutor Hadrec (Bosque de Argénteos - El Sepulcro "..yellow.."43,40"..white..")",
    Note = "Encuentras al Mortacechador Adamant en "..yellow.."[1]"..white..". El Mortacechador Vincent está en el lado derecho cuando entras al patio en "..yellow.."[2]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 3324 }, --Ghostly Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[2] = {
    Title = "El Libro de Ur",
    Level = 26,
    Attain = 16,
    Aim = "Lleva el Libro de Ur a Guardián Bel'dugur en el Apothecarium en Entrañas.",
    Location = "Vigilante Bel'Dugur (Entrañas - El Apotecarium "..yellow.."53,54"..white..")",
    Note = "Encuentras el libro en "..yellow.."[8]"..white.." en el lado izquierdo cuando entras a la habitación.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6335 }, --Grizzled Boots Feet, Leather
        { id = 4534 }, --Steel-clasped Bracers Wrist, Mail
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[3] = {
    Title = "Arugal debe morir",
    Level = 27,
    Attain = 18,
    Aim = "Mata a Arugal y lleva su cabeza a Dalar Tejealba en el Sepulcro.",
    Location = "Dalar Tejealba (Bosque de Argénteos - El Sepulcro "..yellow.."44,39"..white..")",
    Note = "Encuentras al Archimago Arugal en "..yellow.."[12]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6414 }, --Seal of Sylvanas Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[4] = {
    Title = "El Orbe de Soran'ruk",
    Level = 25,
    Attain = 20,
    Aim = "Encuentra 3 Fragmentos de Soran'ruk y 1 Fragmento Grande de Soran'ruk y llévaselos a Doan Karhan en Los Baldíos.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Solo BRUJO"..white..": Obtienes los 3 Fragmentos de Soran'ruk de los Acólitos del Crepúsculo en "..yellow.."[Cavernas de Brazanegra]"..white..". Obtienes el Fragmento Grande de Soran'ruk en "..yellow.."[Castillo de Colmillo Oscuro]"..white.." de las Almas Oscuras Colmillo de las Sombras.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[5] = {
    Title = "En las Fauces",
    Level = 25,
    Attain = 15,
    Aim = "Encuentra las pertenencias de Melenas en la Biblioteca de Castillo de Colmillo Oscuro y devuélveselas a Pierce Shackleton en Entrañas.",
    Location = "Pierce Esqueletonio (Entrañas - Magic Quarter "..yellow.."85.4,13.6"..white..")",
    Note = "Encuentras las Pertenencias de Melenas en "..yellow.."[12]"..white..", una caja en el suelo entre dos estantes de libros a la izquierda. La línea de misiones comienza en el Duque Nargelas (Claros de Tirisfal - Villa del Valle, al oeste de Claros de Tirisfal). La recompensa de la misión la obtendrás después de completar la siguiente misión.",
    Prequest = "Herencia de Darlthos -> Un Tipo Diferente de Cerradura -> Formas de Magia",
    Folgequest = "Legado de Darlthos",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60392 }, --Sword of Laneron Two-Hand, Sword
        { id = 60393 }, --Shield of Mathela Shield
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[6] = {
    Title = "Demasiado Tarde para el Prelado",
    Level = 22,
    Attain = 16,
    Aim = "Mata al Prelado Yelmoférreo y regresa con el Padre Brightcopf en Villa del Arroyo.",
    Location = "Padre Brilcopf (Villa del Valle "..yellow.."20.8, 68.7"..white..")",
    Note = "Necesitas matar al Prelado Melena de Hierro [13]. La cadena de misiones comienza en Guardia de la Muerte Podrig (Bosque de Argénteos - El Sepulcro "..yellow.."43, 42"..white..")",
    Prequest = "Proteger a los No Muertos -> Ayudar a Brightcopf",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70225 }, --Necklace of Redemption Neck
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[7] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Recoge sangre de huargen para Fandral Corzocelada. Necesita muestras de sangre de Karazhan, Ciudad de Gilneas y el Castillo de Colmillo Oscuro.",
    Location = "Magatha Tótem Siniestro (Cima del Trueno - La Cima del Ancestro "..yellow.."70,31"..white..").",
    Note = "[Sangre de Colmillo de Sombras] cae de los Huargos."..white.." [Guadaña de la Diosa] la misión anterior comienza con La Guadaña de Elune que cae del Señor Bosque Negro II "..yellow.."(Salones Inferiores de Karazhan [5]).",
    Prequest = "Guadaña de la Diosa",
    Folgequest = "Sangre de Vorgendor",
}

--------------- Stratholme ---------------
kQuestInstanceData.Stratholme = {
    Story = "Una vez la joya del norte de Lordaeron, la ciudad de Stratholme es donde el Príncipe Arthas se volvió contra su mentor, Uther el Portador de la Luz, y masacró a cientos de sus propios súbditos que se creía habían contraído la temida plaga de la no-muerte. La espiral descendente de Arthas y su última rendición al Rey Exánime siguieron poco después. La ciudad rota ahora está habitada por la Plaga no-muerta - liderada por el poderoso liche, Kel'Thuzad. Un contingente de Cruzados Escarlata, liderado por el Gran Cruzado Dathrohan, también mantiene una porción de la ciudad devastada. Los dos lados están encerrados en un combate constante y violento. Aquellos aventureros lo suficientemente valientes (o tontos) para entrar a Stratholme se verán obligados a enfrentarse a ambas facciones antes de mucho tiempo. Se dice que la ciudad está custodiada por tres torres de vigilancia masivas, así como por poderosos nigromantes, banshees y abominaciones. También ha habido informes de un maléfico Caballero de la Muerte montando un corcel profano - dispensando ira indiscriminada sobre todos aquellos que se aventuran dentro del reino de la Plaga.",
    Caption = "Stratholme",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Stratholme.Alliance[1] = {
    Title = "La Carne No Miente",
    Level = 60,
    Attain = 55,
    Aim = "Recupera 20 muestras de carne infectada de Stratholme y llévaselas a Betina Bigglezink. Sospechas que cualquier criatura en Stratholme tendría dicha muestra de carne.",
    Location = "Betina Bigglezink (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "La mayoría de los enemigos en Stratholme pueden soltar las Muestras de Carne Plagada.",
    Folgequest = "El Agente Activo",
}
kQuestInstanceData.Stratholme.Alliance[2] = {
    Title = "El Agente Activo",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a Stratholme y busca en los zigurats. Encuentra y devuelve nuevos Datos de la Plaga a Betina Bigglezink.",
    Location = "Betina Bigglezink (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Los Datos de la Plaga están en una de las 3 Torres, que encuentras cerca de "..yellow.."[15]"..white..", "..yellow.."[16]"..white.." y "..yellow.."[17]"..white..".",
    Prequest = "La Carne No Miente",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 13209 }, --Seal of the Dawn Trinket
        { id = 19812 }, --Rune of the Dawn Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[3] = {
    Title = "Casas de lo Sagrado",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a Stratholme, en el norte. Busca en las cajas de suministros que salpican la ciudad y recupera 5 Agua Bendita de Stratholme. Regresa con Leonid Barthalomew el Venerado cuando hayas recolectado suficiente del líquido bendito.",
    Location = "Leonid Barthalomew el Venerado (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."80,58"..white..")",
    Note = "Puedes encontrar el Agua Bendita en cofres por todas partes en Stratholme. Pero si abres un cofre pueden aparecer bichos y atacarte.",
    Rewards = {
        Text = "Recompensa: 1 y 2 y 3 o 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 13216 }, --Crown of the Penitent Head, Cloth
        { id = 13217 }, --Band of the Penitent Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[4] = {
    Title = "El Gran Halric Emberlain",
    Level = 60,
    Attain = 55,
    Aim = "Encuentra la tienda de tabaco de Halric Emberlain en Stratholme y recupera una caja de Tabaco Premium de Siabi. Regresa con Smokey LaRue cuando el trabajo esté hecho.",
    Location = "Smokey LaRue (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."80,58"..white..")",
    Note = "Encuentras la tienda de humo cerca de "..yellow.."[1]"..white..". Fras Siabi aparece cuando abres la caja.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 13171 }, --Smokey's Lighter Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[5] = {
    Title = "Las Almas Inquietas",
    Level = 60,
    Attain = 55,
    Aim = "Encuentra a Egan. Solo sabes que fue visto por última vez cerca de Stratholme.",
    Location = "Egan (Tierras de la Peste del Este "..yellow.."14,33"..white..")",
    Note = "Obtienes la misión anterior del Custodio Alen (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."79,63"..white.."). Los ciudadanos espectrales caminan por todo Stratholme.",
    Prequest = "Las Almas Inquietas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 13315 }, --Testament of Hope Held In Off-hand
    }
}
kQuestInstanceData.Stratholme.Alliance[6] = {
    Title = "De Amor y Familia",
    Level = 60,
    Attain = 52,
    Aim = "Viaja a la isla de Caer Darrow, en la región centro-sur de las Tierras de la Peste, y busca cualquier pista sobre el paradero de la pintura.",
    Location = "Artista Renfray (Tierras de la Peste del Oeste - Castel Darrow "..yellow.."65,75"..white..")",
    Note = "Obtienes la misión anterior de Tirión Vadín (Tierras de la Peste del Oeste "..yellow.."7,43"..white.."). Puedes encontrar el cuadro cerca de "..yellow.."[10]"..white..".",
    Prequest = "Redención -> De Amor y Familia",
    Folgequest = "Encontrar a Myranda",
}
kQuestInstanceData.Stratholme.Alliance[7] = {
    Title = "El Moribundo, Ras Frostwhisper",
    Level = 60,
    Attain = 57,
    Aim = "Viaja a Stratholme y encuentra el Regalo de Menethil. Coloca el Recuerdo del Recuerdo en el suelo profano.",
    Location = "Leonid Barthalomew el Venerado (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."80,58"..white..")",
    Note = "Obtienes la misión anterior del Magistrado Marduke (Tierras de la Peste del Oeste - Castel Darrow "..yellow.."70,73"..white.."). Encuentras el cartel cerca de "..yellow.."[19]"..white..". Ver también: "..yellow.."[El Liche, Ras Levescarcha]"..white.." en Scholomance.",
    Prequest = "El Humano Ras Frostraunen -> El Humano, Ras Frostwhisper",
    Folgequest = "El Moribundo, Ras Frostwhisper",
}
kQuestInstanceData.Stratholme.Alliance[8] = {
    Title = "La Venganza de Aurius",
    Level = 60,
    Attain = 55,
    Aim = "Mata al Barón.",
    Location = "Aurius (Stratholme "..yellow.."[13]"..white..")",
    Note = "Para comenzar la misión debes darle a Aurius [El Medallón de Fe]. Obtienes el Medallón de un cofre (Caja fuerte de Malor "..yellow.."[7]"..white..") en la primera cámara del bastión (antes de que los caminos se dividan). Después de darle a Aurius el Medallón, él apoya a tu grupo en la lucha contra el Barón "..yellow.."[19]"..white..". Después de matar al Barón, debes hablar con Aurius de nuevo para obtener las Recompensas.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 17044 }, --Will of the Martyr Neck
        { id = 17045 }, --Blood of the Martyr Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[9] = {
    Title = "El Archivista",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a Stratholme y encuentra al Archivista Galford de la Cruzada Escarlata. Destrúyelo y quema el Archivo Escarlata.",
    Location = "Duque Nicholas Zverenhoff (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Puedes encontrar el Archivo y al Archivista en "..yellow.."[10]"..white..".",
    Folgequest = "La Verdad se Desmorona",
}
kQuestInstanceData.Stratholme.Alliance[10] = {
    Title = "La Verdad se Desmorona",
    Level = 60,
    Attain = 55,
    Aim = "Lleva la Cabeza de Balnazzar al Duque Nicholas Zverenhoff en las Tierras de la Peste del Este.",
    Location = "Balnazzar (Stratholme "..yellow.."[11]"..white..")",
    Note = "Encuentras al Duque Nicholas Zverenhoff en las Tierras de la Peste del Este - Capilla de la Esperanza de la Luz ("..yellow.."81,59"..white..").",
    Prequest = "El Archivista",
    Folgequest = "Más Allá",
}
kQuestInstanceData.Stratholme.Alliance[11] = {
    Title = "Más Allá",
    Level = 60,
    Attain = 55,
    Aim = "Viaja a Stratholme y destruye al Barón Osahendido. Toma su cabeza y devuélvesela al Duque Nicholas Zverenhoff.",
    Location = "Duque Nicholas Zverenhoff (Tierras de la Peste del Este - Capilla de la Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Puedes encontrar al Barón en "..yellow.."[19]"..white..".",
    Prequest = "La Verdad se Desmorona",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 13243 }, --Argent Defender Shield
        { id = 13249 }, --Argent Crusader Staff
        { id = 13246 }, --Argent Avenger One-Hand, Sword
    }
}
kQuestInstanceData.Stratholme.Alliance[12] = {
    Title = "Súplica de un Hombre Muerto",
    Level = 60,
    Attain = 58,
    Aim = "Entra en Stratholme y rescata a Ysida Harmon del Barón Osahendido.",
    Location = "Anthion Harmon (Tierras de la Peste del Este - Stratholme)",
    Note = "Anthion está justo afuera del portal de Stratholme. Necesitas el Revelador de Fantasmas Extradimensional para verlo. Viene de la misión anterior. La línea de misiones comienza con Una Fuente de Energía Portátil. Deliana en Forjaz ("..yellow.."43,52"..white..") para la Alianza, Mokvar en Orgrimmar ("..yellow.."38,37"..white..") para la Horda. Esta es la infame carrera del Barón de '45 minutos'.",
    Prequest = "Un Mercader Astuto",
    Folgequest = "Prueba de Vida",
}
kQuestInstanceData.Stratholme.Alliance[13] = {
    Title = "La Pieza Izquierda del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con la Pieza Izquierda del Amuleto de Lord Valthalak y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'. Jarien y Sothos son invocados en "..yellow.."[11]"..white..".",
    Prequest = "Componentes Importantes",
    Folgequest = "Veo la Isla de Alcaz en Tu Futuro...",
}
kQuestInstanceData.Stratholme.Alliance[14] = {
    Title = "La Pieza Derecha del Amuleto de Lord Valthalak",
    Level = 60,
    Attain = 58,
    Aim = "Usa el Brasero de Invocación para convocar al espíritu de Mor Grayhoof y mátalo. Regresa con Bodley dentro de la Montaña Roca Negra con el Amuleto de Lord Valthalak recombinado y el Brasero de Invocación.",
    Location = "Bodley (Montaña Roca Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "El Revelador de Fantasmas Extradimensional es necesario para ver a Bodley. Lo obtienes de la misión 'Un Mercader Astuto'. Jarien y Sothos son invocados en "..yellow.."[11]"..white..".",
    Prequest = "Más Componentes Importantes",
    Folgequest = "Preparativos Finales ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
}
kQuestInstanceData.Stratholme.Alliance[15] = {
    Title = "Atiesh, Gran Bastón del Guardián",
    Level = 60,
    Attain = 60,
    Aim = "Anachronos en las Cavernas del Tiempo en Tanaris quiere que lleves Atiesh, Gran Bastón del Guardián a Stratholme y lo uses en Tierra Consagrada. Derrota a la entidad que es exorcizada del bastón y regresa con él.",
    Location = "Anacronos (Tanaris - Cavernas del Tiempo "..yellow.."65,49"..white..")",
    Note = "Atiesh es invocado en "..yellow.."[2]"..white..".",
    Prequest = "Marco de Atiesh -> Atiesh, el Gran Bastón Corrupto",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 22589 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22630 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22631 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22632 }, --Atiesh, Greatstaff of the Guardian Staff
    }
}
kQuestInstanceData.Stratholme.Alliance[16] = {
    Title = "Corrupción",
    Level = 60,
    Attain = 50,
    Aim = "Encuentra al Forjador de Espadas de la Guardia Negra en Stratholme y destrúyelo. Recupera el Insignia de la Guardia Negra y llévasela a Seril Azotamuertos.",
    Location = "Seril Finiquiplaga (Cuna del Invierno - Mirada Eterna "..yellow.."61,37"..white..")",
    Note = red.."Solo Herrería"..white..": El Armero Guardia Negra es invocado cerca de "..yellow.."[15]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12825 }, --Plans: Blazing Rapier Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[17] = {
    Title = "Dulce Serenidad",
    Level = 60,
    Attain = 50,
    Aim = "Viaja a Stratholme y mata al Herrero Martillo Carmesí. Recupera el Delantal del Herrero Martillo Carmesí y entrégaselo a Lilith.",
    Location = "Lilith la Ágil (Cuna del Invierno - Mirada Eterna "..yellow.."61,37"..white..")",
    Note = red.."Solo Herrería"..white..": El Forjamartillos Carmesí es invocado en "..yellow.."[8]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12824 }, --Plans: Enchanted Battlehammer Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[18] = {
    Title = "Para Construir un Golpeador",
    Level = 60,
    Attain = 30,
    Aim = "Consigue el Servo Sintonizado de Torio de la Armería del Monasterio Escarlata, obtén el Núcleo de Gólem Perfecto en las Profundidades de Roca Negra de Lord Argelmach Gólem, encuentra la Vara de Adamantita en Stratholme. Regresa con Oglethorpe Obnoticus.",
    Location = "Oglethorpe Obnoticus <Master Ingeniero Gnomo> (Vega de Tuercespina; Bahía del Botín "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Solo Ingenieros)"..white.."Esta misión requiere recolectar 3 objetos. \n1) Servo Sintonizado de Torio (Monasterio Escarlata de Mirmidón Escarlata)\n2) Núcleo de Gólem Perfecto (Profundidades de Roca Negra del Señor Gólem Argelmach) \n3) Varita de Adamantita (Stratholme del Forjamartillos Carmesí "..yellow.."[8]"..white..") \n'Golpeamasa 9-60' en Gnomeregan suelta 'Estampador Intacto' que comienza la Misión Anterior 'Un Golpe en la Cabeza'.",
    Prequest = "Un Golpe en la Cabeza",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.Stratholme.Alliance[19] = {
    Title = "To Wake The Ashbringer",
    Level = 60,
    Attain = 60,
    Aim = "Recupera el Tabardo del Portador de Cenizas (mata al Gran Cruzado Dathrohan) y la Capa de Alexandros de Stratholme.",
    Location = "Tirión Vadín (Tierras de la Peste del Oeste - Capilla de la Esperanza de la Luz "..yellow.."67.3,24.2"..white..").",
    Note = "El Tabardo del Portador de Cenizas cae del Gran Cruzado Dathrohan "..yellow.."[11]"..white..", la Capa de Alexandros cae del Barón Osahendido "..yellow.."[19]"..white.."\nLa línea de misiones comienza en Naxxramas después de matar a los 4 Jinetes con la misión 'Orbe de Luz Pura'",
    Prequest = "Orbe de Luz Pura -> Busca Ayuda en Otro Lugar",
    Folgequest = "Espíritu del Portador de Cenizas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 82002 }, --Tabard of the Ashbringer Tabard
    }
}
kQuestInstanceData.Stratholme.Alliance[20] = {
    Title = "Broche de la Familia Rothlen",
    Level = 60,
    Attain = 55,
    Aim = "Recupera el Broche de la Familia Rothlen de Stratholme para el Duque Rothlen en Karazhan.",
    Location = "Duque Rothlen (Karazhan "..yellow.."[Karazhan - c]"..white..")",
    Note = "El Broche de la Familia Rothlen está junto al jefe El Imperdonable "..yellow.."[4]"..white.." en el cofre.\nLa cadena de misiones comienza con el objeto épico aleatorio 'Notas de Cocina Garabateadas' "..yellow.."[Karazhan]"..white..".",
    Prequest = "Notas de Cocina Garabateadas"..yellow.."[Karazhan]"..white.." -> Objetos Perdidos "..yellow.."[Karazhan]"..white.."", -- 40998, 40999",
    Folgequest = "La Receta Secreta ("..yellow.."[Karazhan]"..white..")",
}
kQuestInstanceData.Stratholme.Alliance[21] = {
    Title = "La Llave de Karazhan VII",
    Level = 60,
    Attain = 58,
    Aim = "Encuentra cuatro Ecos de Medivh. Podrían encontrarse en lugares de gran importancia para el mago. Luego regresa con Dolvan con la llave.",
    Location = "Dolvan Vientofirme (Marjal Revolcafango - Hondonada Westhaven "..yellow.."[71.1,73.2]"..white..")",
    Note = "La Segunda Pluma de Medivh está en el suelo en el lugar donde está el Ancestro Levesusurro (Festival Lunar) "..yellow.."[5]"..white..".\nLa Primera Pluma de Medivh está en "..yellow.."[Entrañas]"..white.." detrás del trono de la entrada.\nLa Tercera Pluma de Medivh está en "..yellow.."[Montañas de Alterac]"..white.." al final del primer acantilado (occidental) "..yellow.."[30.8,87.4]"..white..".\nLa Cuarta Pluma de Medivh está en "..yellow.."[Hyjal]"..white.." al final del acantilado "..yellow.."[31.8,70.5]"..white..".",
    Prequest = "La Llave de Karazhan VI",
    Folgequest = "La Llave de Karazhan VIII ("..yellow.."Dire Maul West"..white..")",
}
for i = 1, 17 do
    kQuestInstanceData.Stratholme.Horde[i] = kQuestInstanceData.Stratholme.Alliance[i]
end
kQuestInstanceData.Stratholme.Horde[18] = {
    Title = "Ramstein",
    Level = 60,
    Attain = 56,
    Aim = "Viaja a Stratholme y mata a Ramstein el Empalador. Toma su cabeza como recuerdo para Nathanos.",
    Location = "Nathanos Clamañublo (Tierras de la Peste del Este "..yellow.."26,74"..white..")",
    Note = "También obtienes la misión anterior de Nathanos Clamañublo. Puedes encontrar a Ramstein en "..yellow.."[18]"..white..".",
    Prequest = "La Orden del Señor de los Bosques -> Alasombría, Oh Cómo Te Odio...",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 18022 }, --Royal Seal of Alexis Ring
        { id = 17001 }, --Elemental Circle Ring
    }
}
kQuestInstanceData.Stratholme.Horde[19] = {
    Title = "Para Construir un Golpeador",
    Level = 60,
    Attain = 30,
    Aim = "Consigue el Servo Sintonizado de Torio de la Armería del Monasterio Escarlata, obtén el Núcleo de Gólem Perfecto en las Profundidades de Roca Negra de Lord Argelmach Gólem, encuentra la Vara de Adamantita en Stratholme. Regresa con Oglethorpe Obnoticus.",
    Location = "Oglethorpe Obnoticus <Master Ingeniero Gnomo> (Vega de Tuercespina; Bahía del Botín "..yellow.."28.4,76.3"..white..").",
    Note = "(Solo Ingenieros)Esta misión requiere recolectar 3 objetos. \n1) Servo Sintonizado de Torio (Monasterio Escarlata de Mirmidón Escarlata)\n2) Núcleo de Gólem Perfecto (Profundidades de Roca Negra del Señor Gólem Argelmach)\n3) Varita de Adamantita (Stratholme del Forjamartillos Carmesí "..yellow.."[8]"..white..")\n'Golpeamasa 9-60' en Gnomeregan suelta 'Estampador Intacto' que comienza la Misión Anterior 'Un Golpe en la Cabeza'.",
    Prequest = "Un Golpe en la Cabeza",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.Stratholme.Horde[20] = kQuestInstanceData.Stratholme.Alliance[19]
kQuestInstanceData.Stratholme.Horde[21] = kQuestInstanceData.Stratholme.Alliance[21]

--------------- Ruins of Ahn'Qiraj ---------------
kQuestInstanceData.TheRuinsofAhnQiraj = {
    Story = "Durante las horas finales de la Guerra de las Arenas Movedizas, las fuerzas combinadas de los elfos de la noche y los cuatro vuelos de dragones llevaron la batalla al corazón mismo del imperio qiraji, a la ciudad fortaleza de Ahn'Qiraj. Sin embargo, en las puertas de la ciudad, los ejércitos de Kalimdor se encontraron con una concentración de zánganos de guerra silítidos más masiva que cualquiera que hubieran encontrado antes. En última instancia, los silítidos y sus maestros qiraji no fueron derrotados, sino simplemente aprisionados dentro de una barrera mágica, y la guerra dejó a la ciudad maldita en ruinas. Han pasado mil años desde ese día, pero las fuerzas qiraji no han estado inactivas. Un nuevo y terrible ejército ha sido engendrado desde las colmenas, y las ruinas de Ahn'Qiraj están repletas una vez más de masas pululantes de silítidos y qiraji. Esta amenaza debe ser eliminada, o todo Azeroth puede caer ante el aterrador poder del nuevo ejército qiraji.",
    Caption = "Ruinas de Ahn'Qiraj",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[1] = {
    Title = "La Caída de Ossirian",
    Level = 60,
    Attain = 60,
    Aim = "Entrega la Cabeza de Ossirian el Sin Cicatriz al Comandante Mar'alith en el Fuerte Cenarion en Silithus.",
    Location = "Cabeza de Ossirian el Imborrable (cae de Osirio el Sinmarcas "..yellow.."[6]"..white..")",
    Note = "Comandante Mar'alith (Silithus - Bastión Cenarion "..yellow.."49,34"..white..")",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 21504 }, --Charm of the Shifting Sands Neck
        { id = 21507 }, --Amulet of the Shifting Sands Neck
        { id = 21505 }, --Choker of the Shifting Sands Neck
        { id = 21506 }, --Pendant of the Shifting Sands Neck
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[2] = {
    Title = "El Veneno Perfecto",
    Level = 60,
    Attain = 60,
    Aim = "Dirk Truenomad en el Bastión Cenarion quiere que le traigas el Saco de Veneno de Venoxis y el Saco de Veneno de Kurinnaxx.",
    Location = "Puñal Truenedera (Silithus - Bastión Cenarion "..yellow.."52,39"..white..")",
    Note = "El Saco de Veneno de Venoxis cae del Sumo Sacerdote Venoxis en "..yellow.."Zul'Gurub"..white..". El Saco de Veneno de Kurinnaxx cae en las "..yellow.."Ruinas de Ahn'Qiraj"..white.." en "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 22378 }, --Ravenholdt Slicer One-Hand, Sword
        { id = 22379 }, --Shivsprocket's Shiv Main Hand, Dagger
        { id = 22377 }, --The Thunderwood Poker One-Hand, Dagger
        { id = 22348 }, --Doomulus Prime Two-Hand, Mace
        { id = 22347 }, --Fahrad's Reloading Repeater Crossbow
        { id = 22380 }, --Simone's Cultivating Hammer Main Hand, Mace
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[3] = {
    Title = "Perdido en las Arenas",
    Level = 60,
    Attain = 60,
    Aim = "Lleva un Fragmento de Obsidiana Perfecto al Archimago Xylem.",
    Location = "Archimago Xylem (Azshara "..yellow.."28,47"..white..")",
    Note = red.."Solo Mago"..white..": misión anterior del Tradicionalista Lydros (La Masacre - Oeste o Norte "..yellow.."[1] Biblioteca"..white.."). El Fragmento de Obsidiana Perfecto cae de "..yellow.."[3]"..white..".",
    Prequest = "Refrigerio Arcano -> Un Tipo Especial de Convocatoria",
    Rewards = {
        Text = "Recompensa: ",
        { id = 83002 }, --Tome of Refreshment Ritual Pattern
    }
}
for i = 1, 3 do
    kQuestInstanceData.TheRuinsofAhnQiraj.Horde[i] = kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[i]
end

--------------- The Stockade ---------------
kQuestInstanceData.TheStockade = {
    Story = "Las Mazmorras son un complejo de prisión de alta seguridad, escondido bajo el distrito de los canales de la ciudad de Ventormenta. Presidido por el Celador Thelwater, las Mazmorras son el hogar de ladrones mezquinos, insurgentes políticos, asesinos y una veintena de los criminales más peligrosos de la tierra. Recientemente, una revuelta liderada por prisioneros ha resultado en un estado de pandemonio dentro de las Mazmorras - donde los guardias han sido expulsados y los convictos deambulan libres. El Celador Thelwater ha logrado escapar del área de detención y actualmente está reclutando buscadores de emociones valientes para aventurarse en la prisión y matar al cerebro del levantamiento - el astuto criminal, Bazil Thredd.",
    Caption = "Las Mazmorras",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheStockade.Alliance[1] = {
    Title = "Lo Que Va, Viene...",
    Level = 25,
    Attain = 22,
    Aim = "Lleva la cabeza de Targorr el Temible al Guardia Berton en Villa del Lago.",
    Location = "Guardia Berton (Montañas Crestagrana - Villa del Lago "..yellow.."26,46"..white..")",
    Note = "Puedes encontrar a Targorr en "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 3400 }, --Lucine Longsword Main Hand, Sword
        { id = 1317 }, --Hardened Root Staff Staff
    }
}
kQuestInstanceData.TheStockade.Alliance[2] = {
    Title = "Crimen y Castigo",
    Level = 26,
    Attain = 22,
    Aim = "El Concejal Millstipe de Villa Oscura quiere que le lleves la mano de Dextren Ward.",
    Location = "Millstipe (Bosque del Ocaso - Villa Oscura "..yellow.."72,47"..white..")",
    Note = "Puedes encontrar a Dextren en "..yellow.."[5]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 2033 }, --Ambassador's Boots Feet, Leather
        { id = 2906 }, --Darkshire Mail Leggings Legs, Mail
    }
}
kQuestInstanceData.TheStockade.Alliance[3] = {
    Title = "Calmar el Levantamiento",
    Level = 26,
    Attain = 22,
    Aim = "El Celador Thelwater de Ventormenta quiere que mates a 10 Prisioneros Defias, 8 Reos Defias y 8 Insurgentes Defias en Las Mazmorras.",
    Location = "Celador Thelagua (Stormwind - Las Mazmorras "..yellow.."41,58"..white..")",
}
kQuestInstanceData.TheStockade.Alliance[4] = {
    Title = "El Color de la Sangre",
    Level = 26,
    Attain = 22,
    Aim = "Nikova Raskol de Ventormenta quiere que recolectes 10 Pañuelos de Lana Roja.",
    Location = "Nikova Raskol (Stormwind - Old Town "..yellow.."73,46"..white..")",
    Note = "Todos los enemigos dentro de la instancia sueltan Pañuelos de lana roja."
}
kQuestInstanceData.TheStockade.Alliance[5] = {
    Title = "La Furia es Profunda",
    Level = 27,
    Attain = 22,
    Aim = "Motley Garmason quiere que le lleves la cabeza de Kam Furiahonda a Dun Modr.",
    Location = "Motley Garmason (Los Humedales - Dun Modr "..yellow.."49,18"..white..")",
    Note = "La misión previa también se puede obtener de Motley. Puedes encontrar a Kam Deephunter en "..yellow.."[2]"..white..".",
    Prequest = "La Guerra Hierro Negro",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 3562 }, --Belt of Vindication Waist, Leather
        { id = 1264 }, --Headbasher Two-Hand, Mace
    }
}
kQuestInstanceData.TheStockade.Alliance[6] = {
    Title = "Los Motines de Las Mazmorras",
    Level = 29,
    Attain = 16,
    Aim = "Mata a Bazil Thredd y lleva su cabeza de vuelta al Alcaide Thelwater en Las Mazmorras.",
    Location = "Celador Thelagua (Stormwind - Las Mazmorras "..yellow.."41,58"..white..")",
    Note = "Para más detalles sobre la misión previa consulta "..yellow.."[Las Minas de la Muerte, La Hermandad Defias]"..white..".\nPuedes encontrar a Bazil Thredd en "..yellow.."[4]"..white..".",
    Prequest = "La Hermandad de los Defias -> Bazil Thredd",
    Folgequest = "El Visitante Curioso",
}
kQuestInstanceData.TheStockade.Alliance[7] = {
    Title = "The Stockade's Search",
    Level = 24,
    Attain = 18,
    Aim = "Adéntrate en Las Mazmorras y encuentra información sobre Marthin Corinth.",
    Location = "Maestro Mathias Shaw <Líder de SI:7> (Ventormenta - Barrio Antiguo, Distrito pícaro "..yellow.."75.8,59.8"..white..")",
    Note = "Puedes encontrar Información de Marthin Corinth dentro de la Caja de documentos sellados "..yellow.."[1]"..white.." en la sala al otro lado de la entrada de la mazmorra.\nLa cadena de misiones comienza con la misión 'Revelando secretos' del Lord Comandante Ryke (Los Humedales - Refugio del Halcón "..yellow.."36.4,67.3"..white.." bajo la tienda)\nRecibirás la recompensa tras completar la última misión de la cadena.",
    Prequest = "Informe de Robb",
    Folgequest = "Investigando Corinth",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 81416 }, --Valiant Medallion Neck
        { id = 81417 }, --Ambient Talisman Neck
        { id = 81418 }, --Magnificent Necklace Neck
    }
}

--------------- The Sunken Temple ---------------
kQuestInstanceData.TheSunkenTemple = {
    Story = "Hace más de mil años, el poderoso Imperio Gurubashi fue desgarrado por una masiva guerra civil. Un influyente grupo de sacerdotes trols, conocidos como los Atal'ai, intentaron traer de vuelta a un antiguo dios de la sangre llamado Hakkar el Almasjador. Aunque los sacerdotes fueron derrotados y finalmente exiliados, el gran imperio trol se derrumbó sobre sí mismo. Los sacerdotes exiliados huyeron hacia el norte, al Pantano de las Penas. Allí erigieron un gran templo a Hakkar, donde prepararse para su llegada al mundo físico. La gran Aspecto dragón, Ysera, descubrió los planes de los Atal'ai y hundió el templo bajo los pantanos. Hasta el día de hoy, las ruinas sumergidas del templo están vigiladas por los dragones verdes que impiden que nadie entre o salga. Sin embargo, se cree que algunos de los fanáticos Atal'ai pudieron haber sobrevivido a la ira de Ysera y se comprometieron nuevamente al oscuro servicio de Hakkar.",
    Caption = "The Templo Sumergido",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheSunkenTemple.Alliance[1] = {
    Title = "En el Templo de Atal'Hakkar",
    Level = 50,
    Attain = 41,
    Aim = "Reúne 10 Tablillas Atal'ai para Brohann Barriga de Barril en Ventormenta.",
    Location = "Brohann Barriliga (Ventormenta - Distrito de los Enanos "..yellow.."64,20"..white..")",
    Note = "La cadena de misiones previas proviene del mismo PNJ y tiene bastantes pasos.\n\nPuedes encontrar las Tablillas por todas partes en el Templo, tanto afuera como dentro de la instancia.",
    Prequest = "En Busca del Templo -> El Cuento de Rhapsody",
    Rewards = {
        Text = "Recompensa: ",
        { id = 1490 }, --Guardian Talisman Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[2] = {
    Title = "Niebla del Mal",
    Level = 52,
    Attain = 47,
    Aim = "Recolecta 5 muestras de Niebla Atal'ai, luego regresa con Muigin en el Cráter de Un'Goro.",
    Location = "Gregan Tirabirras (Feralas "..yellow.."45,25"..white..")",
    Note = "La misión previa 'Muigin y Larion' comienza en Muigin (Cráter de Un'Goro - Refugio de Marshal "..yellow.."42,9"..white.."). Obtienes la Bruma de los Acechadores profundos, Gusanos del lodo o Cienos en el Templo.",
    Prequest = "Muigin y Larion -> Una Visita a Gregan",
}
kQuestInstanceData.TheSunkenTemple.Alliance[3] = {
    Title = "En las Profundidades",
    Level = 51,
    Attain = 46,
    Aim = "Encuentra el Altar de Hakkar en el Templo Sumergido en los Pantanos de las Penas.",
    Location = "Marvon Buscarroblones (Tanaris "..yellow.."52,45"..white..")",
    Note = "El Altar está en "..yellow.."[1]"..white..".\nLa cadena de misiones de la Alianza comienza en Ángelas Brisa Lunar (Feralas - Bastión Plumaluna "..yellow.."31.8,45.6"..white..") con la misión 'El Templo Sumergido'.\nLa cadena de misiones de la Horda comienza en Médico Brujo Uzer'i (Feralas - Campamento Mojache "..yellow.."74.4,43.4"..white..") con la misión 'El Templo Sumergido'.",
    Prequest = "El Círculo de Piedra",
    Folgequest = "El Secreto del Círculo",
}
kQuestInstanceData.TheSunkenTemple.Alliance[4] = {
    Title = "El Secreto del Círculo",
    Level = 51,
    Attain = 46,
    Aim = "Viaja al Templo Sumergido y descubre el secreto oculto en el círculo de estatuas.",
    Location = "Altar de Hakkar (El Templo Sumergido "..yellow.."1"..white..")",
    Note = "Encuentras las estatuas en "..yellow.."[1]"..white..". Consulta el mapa para el orden de activación.",
    Prequest = "En las Profundidades",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10773 }, --Hakkari Urn Container
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[5] = {
    Title = "El Dios Hakkar",
    Level = 53,
    Attain = 40,
    Aim = "Lleva el Huevo Lleno de Hakkar a Yeh'kinya en Tanaris.",
    Location = "Yeh'kinya (Tanaris - Puerto Steamwheedle "..yellow.."66,22"..white..")",
    Note = "La cadena de misiones comienza con 'Espíritus de Escalofón' del mismo PNJ (Consulta "..yellow.."[Zul'Farrak]"..white..").\nDebes usar el Huevo en "..yellow.."[3]"..white.." para iniciar el Evento. Una vez iniciado, aparecen enemigos y te atacan. Algunos de ellos sueltan la sangre de Hakkar. Con esta sangre puedes apagar las antorchas alrededor del círculo. Después de esto aparece el Avatar de Hakkar. Lo matas y saqueas la 'Esencia de Hakkar' que usas para llenar el huevo.",
    Prequest = "Espíritus de Chillón -> El Huevo Antiguo",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 10749 }, --Avenguard Helm Head, Plate
        { id = 10750 }, --Lifeforce Dirk One-Hand, Dagger
        { id = 10751 }, --Gemburst Circlet Head, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[6] = {
    Title = "Jammal'an el Profeta",
    Level = 53,
    Attain = 38,
    Aim = "El Exiliado Atal'ai en las Tierras del Interior quiere la Cabeza de Jammal'an.",
    Location = "El Exiliado Atal'ai (Tierras del Interior "..yellow.."33,75"..white..")",
    Note = "Encuentras a Jammal'an en "..yellow.."[4]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 11123 }, --Rainstrider Leggings Legs, Cloth
        { id = 11124 }, --Helm of Exile Head, Mail
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[7] = {
    Title = "La Esencia de Eranikus",
    Level = 55,
    Attain = 48,
    Aim = "Coloca la Esencia de Eranikus en la Fuente de Esencia ubicada en esta guarida en el Templo Sumergido.",
    Location = "La Esencia de Eranikus (se obtiene de Sombra de Eranikus "..yellow.."[6]"..white..")",
    Note = "Encuentras la Fuente de la Esencia junto a donde está Sombra de Eranikus en "..yellow.."[6]"..white..".\n"..red.."No"..white.." vendas ni tires el abalorio de recompensa Esencia Encadenada de Eranikus. Lo necesitarás para la siguiente misión en Itharius (Pantano de las Penas - Cueva de Itharius "..yellow.."[13.6,71.7]"..white..", después de hablar con él obtendrás un objeto que inicia la misión.",
    Folgequest = "La Esencia de Eranikus",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10455 }, --Chained Essence of Eranikus Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[8] = {
    Title = "Trols de la Misma Pluma",
    Level = 52,
    Attain = 50,
    Aim = "Lleva un total de 6 Plumas Vudú de los trolls en el Templo Sumergido.",
    Location = "Diblis (Frondavil "..yellow.."42,45"..white..")",
    Note = red.."Solo brujo"..white..": La Pluma se obtiene de cada uno de los trols con nombre en las repisas que dan al gran salón con el agujero en el centro.",
    Prequest = "La Petición de un Diablillo -> La Cosa Equivocada",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 20536 }, --Soul Harvester Staff
        { id = 20534 }, --Abyss Shard Trinket
        { id = 20530 }, --Robes of Servitude Chest, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[9] = {
    Title = "Plumas de Vudú",
    Level = 52,
    Attain = 50,
    Aim = "Lleva las Plumas Vudú de los trolls en el Templo Sumergido al Héroe Caído de la Horda.",
    Location = "Héroe Caído de la Horda (Pantano de las Penas "..yellow.."34,66"..white..")",
    Note = red.."Solo guerrero"..white..": La Pluma se obtiene de cada uno de los trols con nombre en las repisas que dan al gran salón con el agujero en el centro.\nLa cadena de misiones de la Horda comienza en Orgrimmar con el entrenador de guerreros Sorek "..yellow.."80.4,32.3"..white..".",
    Prequest = "Un Espíritu Atormentado -> Guerra contra los Sombrajurados",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 20521 }, --Fury Visor Head, Plate
        { id = 20130 }, --Diamond Flask Trinket
        { id = 20517 }, --Razorsteel Shoulders Shoulder, Plate
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[10] = {
    Title = "Un Ingrediente Mejor",
    Level = 52,
    Attain = 50,
    Aim = "Recupera un Zarcillo Pútrido del guardián en el fondo del Templo Sumergido y llévaselo a Torwa Exploradora.",
    Location = "Abrecaminos Torwa (Cráter de Un'goro "..yellow.."72,76"..white..")",
    Note = red.."Solo druida"..white..": La Vid Pútrida se obtiene de Atal'alarion que es invocado en "..yellow.."[1]"..white.." activando las estatuas en el orden indicado en el mapa.",
    Prequest = "Explorador Torwa -> Prueba Tóxica",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 22274 }, --Grizzled Pelt Chest, Leather
        { id = 22272 }, --Forest's Embrace Chest, Leather
        { id = 22458 }, --Moonshadow Stave Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[11] = {
    Title = "El Dracoleón Verde",
    Level = 52,
    Attain = 50,
    Aim = "Lleva el Diente de Morphaz a Ogtinc en Azshara. Ogtinc reside en lo alto de los acantilados al noreste de las Ruinas de Eldarath.",
    Location = "Ogtinc (Azshara "..yellow.."42,43"..white..")",
    Note = red.."Solo cazador"..white..": Morphaz está en "..yellow.."[5]"..white..".",
    Prequest = "El Amuleto del Cazador -> Azotamiento de las Olas",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 20083 }, --Hunting Spear Polearm
        { id = 19991 }, --Devilsaur Eye Trinket
        { id = 19992 }, --Devilsaur Tooth Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[12] = {
    Title = "Destruir a Morphaz",
    Level = 52,
    Attain = 50,
    Aim = "Recupera el Fragmento Arcano de Morphaz y llévaselo al Archimago Xylem.",
    Location = "Archimago Xylem (Azshara "..yellow.."29,40"..white..")",
    Note = red.."Solo mago"..white..": Morphaz está en "..yellow.."[5]"..white..".",
    Prequest = "Polvo Mágico -> El Coral de la Sirena",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 20035 }, --Glacial Spike One-Hand, Dagger
        { id = 20037 }, --Arcane Crystal Pendant Neck
        { id = 20036 }, --Fire Ruby Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[13] = {
    Title = "Sangre de Morphaz",
    Level = 52,
    Attain = 50,
    Aim = "Mata a Morphaz en el Templo Sumergido de Atal'Hakkar, y lleva su sangre a Greta Pezuñamusgo en Frondavil. La entrada al templo sumergido se encuentra en los Pantanos de las Penas.",
    Location = "Ogtinc (Azshara "..yellow.."42,43"..white..")",
    Note = red.."Solo sacerdote"..white..": Morphaz está en "..yellow.."[5]"..white..". Greta Cuerno de Musgo está en Frondavil - Santuario Esmeralda ("..yellow.."51,82"..white..").",
    Prequest = "Ayuda Cenarion -> El Icor de la No Muerte",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 19990 }, --Blessed Prayer Beads Trinket
        { id = 20082 }, --Woestave Wand
        { id = 20006 }, --Circle of Hope Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[14] = {
    Title = "La Llave de Azur",
    Level = 52,
    Attain = 50,
    Aim = "Devuelve la Llave de Azur a Lord Jorach Cuervo.",
    Location = "Archimago Xylem (Azshara "..yellow.."29,40"..white..")",
    Note = red.."Solo pícaro"..white..": La Llave Cerúlea se obtiene de Morphaz en "..yellow.."[5]"..white..". Lord Jorach Ravenholdt está en Montañas de Alterac - Ravenholdt ("..yellow.."86,79"..white..").",
    Prequest = "Una Sencilla Petición -> Fragmentos Codificados",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 19984 }, --Ebon Mask Head, Leather
        { id = 20255 }, --Whisperwalk Boots Feet, Leather
        { id = 19982 }, --Duskbat Drape Back
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[15] = {
    Title = "Eranikus, Tirano del Sueño",
    Level = 60,
    Attain = 60,
    Aim = "Viaja al continente de Teldrassil y encuentra al agente de Malfurion en algún lugar fuera de los muros de Darnassus.",
    Location = "Malfurion Tempestira (Spawns at Sombra de Eranikus "..yellow.."[8]"..white..")",
    Note = "Brizna del bosque (Teldrassil "..yellow.."37,47"..white..")",
    Prequest = "La Carga de los Vuelos de Dragones",
    Folgequest = "Tyrande y Remulos",
}
kQuestInstanceData.TheSunkenTemple.Alliance[16] = {
    Title = "Por Cualquier Medio Necesario IV",
    Level = 53,
    Attain = 47,
    Aim = "Viaja al Templo Sumergido, encuentra al Dragonkin Hazzas, mátalo y regresa el Corazón de Hazzas a Niremius Darkwind.",
    Location = "Niremius Viento Oscuro (Frondavil "..yellow.."40,30"..white..")",
    Note = "Se obtiene del jefe [7]. Recompensa de la siguiente misión.",
    Prequest = "Por Cualquier Medio Necesario I -> Por Cualquier Medio Necesario II -> Por Cualquier Medio Necesario III",
    Folgequest = "Por Cualquier Medio Necesario V",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60536 }, --Darkwind Glaive One-Hand, Sword
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[17] = {
    Title = "Forjando la Piedra de Poder",
    Level = 52,
    Attain = 50,
    Aim = "Lleva las plumas vudú a Ashlam Valorfist.",
    Location = "Comandante Ashlam Puñovalor (Tierras de la Peste del Oeste - Campo de Viento Frío "..yellow.."43,85"..white..")",
    Note = red.."Solo paladín"..white..": La Pluma se obtiene de cada uno de los trols con nombre en las repisas que dan al gran salón con el agujero en el centro.",
    Prequest = "Piedras de la Plaga Inertes",
    Rewards = {
        Text = "Recompensa: 1 y 2 o 3 o 4",
        { id = 20620 }, --Holy Mightstone Enchant
        { id = 20504 }, --Lightforged Blade Two-Hand, Sword
        { id = 20512 }, --Sanctified Orb Trinket
        { id = 20505 }, --Chivalrous Signet Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[18] = {
    Title = "Dentro del Sueño III",
    Level = 60,
    Attain = 58,
    Aim = "Reúne un Fragmento de Atadura de los Rompeacantiles en Azshara, un Prisma Arcano Sobrecargado de los Torrentes Arcanos en el ala occidental de La Masacre y un Fragmento del Durmiente de los Tejedores en el Templo Sumergido. Informa a Itharius en los Pantanos de las Penas con los objetos recolectados.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."85,30"..white..")",
    Note = "Telar "..yellow.."[6]"..white.." uno de los 4 dragones suelta Fragmento del Durmiente, aparecerá tras matar a Jammal'an el Profeta "..yellow.."[4]"..white..". La barrera al Profeta desaparecerá tras limpiar los 6 balcones "..blue.."[C]"..white.."\nAl completar esta cadena de misiones obtienes el collar y podrás entrar a la banda de Hyjal Santuario Esmeralda.",
    Prequest = "Dentro del Sueño I -> Dentro del Sueño II",
    Folgequest = "Dentro del Sueño IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[19] = {
    Title = "El Bastón del Caminante de la Falla",
    Level = 54,
    Attain = 30,
    Aim = "Regresa con el Bastón de Abisario de Akh Z'ador y el Mojo de Jammal'an para Akh Z'ador en Azshara.",
    Location = "Akh Z'ador (Azshara "..yellow.."51,37"..white..")",
    Note = "La cadena de misiones comienza en Sanv K'la (Pantano de las Penas "..yellow.."25, 30"..white.."). Jammal'an el Profeta "..yellow.."[4]."..white.."\nAl completar esta cadena de misiones obtienes la recompensa Gema de Draenethyst Pura.",
    Prequest = "El Amuleto Sanv -> Encontrando a Akh Z'ador -> Fatiga de la Falla: Cuerpo",
    Folgequest = "Novato en una Tierra Estéril",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41385 }, --Pure Draenethyst Gemstone Quest Item
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[1] = {
    Title = "El Templo de Atal'Hakkar",
    Level = 50,
    Attain = 38,
    Aim = "Recolecta 20 Fetiches de Hakkar y llévaselos a Fel'Zerul en Rocal.",
    Location = "Fel'Zerul (Pantano de las Penas - Rocal "..yellow.."47,54"..white..")",
    Note = "Todos los enemigos en el Templo sueltan Fetiches.\nLa cadena de misiones comienza en Fel'Zerul (Pantano de las Penas - Rocal "..yellow.."47,54"..white..")",
    Prequest = "El Charco de Lágrimas -> Regreso con Fel'Zerul",
    Rewards = kQuestInstanceData.TheSunkenTemple.Alliance[1].Rewards
}
kQuestInstanceData.TheSunkenTemple.Horde[2] = {
    Title = "Combustible para el Zapper",
    Level = 52,
    Attain = 47,
    Aim = "Entrega el Zapper Descargado y 5 muestras de Niebla Atal'ai a Larion en el Refugio de Marshal.",
    Location = "Liv Rizzlefix (Barrens "..yellow.."62,38"..white..")",
    Note = "La misión previa 'Larion y Muigin' comienza en Larion (Cráter de Un'Goro "..yellow.."45,8"..white.."). Obtienes la Bruma de los Acechadores profundos, Gusanos del lodo o Cienos en el Templo.",
    Prequest = "Larion y Muigin -> El Taller de Marvon",
}
for i = 3, 16 do
    kQuestInstanceData.TheSunkenTemple.Horde[i] = kQuestInstanceData.TheSunkenTemple.Alliance[i]
end
kQuestInstanceData.TheSunkenTemple.Horde[17] = {
    Title = "El Vudú",
    Level = 52,
    Attain = 50,
    Aim = "Lleva las plumas vudú a Bath'rah el Vigía del Viento.",
    Location = "Bath'rah el Vigía del Viento (Montañas de Alterac "..yellow.."80,67"..white..")",
    Note = red.."Solo chamán"..white..": La Pluma se obtiene de cada uno de los trols con nombre en las repisas que dan al gran salón con el agujero en el centro.",
    Prequest = "Tótem de Espíritu",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 20369 }, --Azurite Fists Hands, Mail
        { id = 20503 }, --Enamored Water Spirit Trinket
        { id = 20556 }, --Wildstaff Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[18] = {
    Title = "La Crisis Maul'ogg VII",
    Level = 54,
    Attain = 45,
    Aim = "Adéntrate en las profundidades del Templo de Atal'Hakkar y consigue la Vara Atal'ai, llévasela a Insom'ni para completar el hechizo.",
    Location = "Insom'ni <El Gran Ermitaño> (Isla Kazon, al norte de la Isla Gillijim "..yellow.."57.2,10.1"..white..")",
    Note = "Varita Atal'ai del pequeño cofre de madera verde en el suelo detrás de Jammal'an el Profeta "..yellow.."[4]"..white..".\nLa cadena de misiones comienza en Haz'gorg el Gran Vidente (Vega de Tuercespina - Isla de Gillijim(oeste de Bahía del Botín) - Refugio Maza'Ogg, dentro de la cueva sureste "..yellow.."78.1,81"..white..")\nRecibirás la recompensa al completar la última misión de la cadena.",
    Prequest = "La Crisis Maul'ogg VI",
    Folgequest = "La Crisis Maul'ogg VIII",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60346 }, --The Ogre Mantle Shoulder, Leather
        { id = 60347 }, --Staff of the Ogre Seer Staff
        { id = 60348 }, --Favor of Cruk'Zogg Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[19] = {
    Title = "Dentro del Sueño III",
    Level = 60,
    Attain = 58,
    Aim = "Reúne un Fragmento de Atadura de los Rompeacantiles en Azshara, un Prisma Arcano Sobrecargado de los Torrentes Arcanos en el ala occidental de La Masacre y un Fragmento del Durmiente de los Tejedores en el Templo Sumergido. Informa a Itharius en los Pantanos de las Penas con los objetos recolectados.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."85,30"..white..")",
    Note = "Telar "..yellow.."[6]"..white.." uno de los 4 dragones suelta Fragmento del Durmiente, aparecerá tras matar a Jammal'an el Profeta "..yellow.."[4]"..white..". La barrera al Profeta desaparecerá tras limpiar los 6 balcones "..blue.."[C]"..white.."\nAl completar esta cadena de misiones obtienes el collar y podrás entrar a la banda de Hyjal Santuario Esmeralda.",
    Prequest = "Dentro del Sueño I -> Dentro del Sueño II",
    Folgequest = "Dentro del Sueño IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[20] = {
    Title = "El Bastón del Caminante de la Falla",
    Level = 54,
    Attain = 30,
    Aim = "Regresa con el Bastón de Abisario de Akh Z'ador y el Mojo de Jammal'an para Akh Z'ador en Azshara.",
    Location = "Akh Z'ador (Azshara "..yellow.."51,37"..white..")",
    Note = "La cadena de misiones comienza en Sanv K'la (Pantano de las Penas "..yellow.."25, 30"..white.."). Jammal'an el Profeta "..yellow.."[4]."..white.."\nAl completar esta cadena de misiones obtienes la recompensa Gema de Draenethyst Pura.",
    Prequest = "El Amuleto Sanv -> Encontrando a Akh Z'ador -> Fatiga de la Falla: Cuerpo",
    Folgequest = "Novato en una Tierra Estéril",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41385 }, --Pure Draenethyst Gemstone Quest Item
    }
}

--------------- Temple of Ahn'Qiraj ---------------
kQuestInstanceData.TheTempleofAhnQiraj = {
    Story = "En el corazón de Ahn'Qiraj yace un antiguo complejo de templos. Construido en la época anterior a la historia registrada, es tanto un monumento a dioses innombrables como un masivo campo de cría para el ejército qiraji. Desde que la Guerra de las Arenas Movedizas terminó hace mil años, los Emperadores Gemelos del imperio qiraji han estado atrapados dentro de su templo, apenas contenidos tras la barrera mágica erigida por el dragón de bronce Anachronos y los elfos de la noche. Ahora que el Cetro de las Arenas Movedizas ha sido reensamblado y el sello ha sido roto, el camino al santuario interior de Ahn'Qiraj está abierto. Más allá de la reptante locura de las colmenas, bajo el Templo de Ahn'Qiraj, legiones de qiraji se preparan para la invasión. Deben ser detenidos a toda costa antes de que puedan desatar sus voraces ejércitos insectoides sobre Kalimdor una vez más, ¡y estalle una segunda Guerra de las Arenas Movedizas!",
    Caption = "Temple of Ahn'Qiraj",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1] = {
    Title = "El Legado de C'Thun",
    Level = 60,
    Attain = 60,
    Aim = "Lleva el Ojo de C'Thun a Caelastrasz en el Templo de Ahn'Qiraj.",
    Location = "Ojo de C'Thun (se obtiene de C'Thun "..yellow.."[9]"..white..")",
    Note = "Caelestrasz (Templo de Ahn'Qiraj "..yellow.."2'"..white..")\nLas recompensas listadas son para la misión siguiente.",
    Folgequest = "El Salvador de Kalimdor",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 21712 }, --Amulet of the Fallen God Neck
        { id = 21710 }, --Cloak of the Fallen God Back
        { id = 21709 }, --Ring of the Fallen God Ring
    }
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2] = {
    Title = "Secretos de los Qiraji",
    Level = 60,
    Attain = 60,
    Aim = "Lleva el Artefacto Qiraji Antiguo a los dragones escondidos cerca de la entrada del templo.",
    Location = "Artefacto Qiraji Antiguo (botín aleatorio en el Templo de Ahn'Qiraj)",
    Note = "Se entrega a Andorgos (Templo de Ahn'Qiraj "..yellow.."1'"..white..").",
}
kQuestInstanceData.TheTempleofAhnQiraj.Horde[1] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1]
kQuestInstanceData.TheTempleofAhnQiraj.Horde[2] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2]

--------------- Zul'Farrak ---------------
kQuestInstanceData.ZulFarrak = {
    Story = "Esta ciudad abrasada por el sol es el hogar de los trols Furiaarena, conocidos por su particular crueldad y misticismo oscuro. Las leyendas trol hablan de una poderosa espada llamada Sul'thraze el Lacerante, un arma capaz de infundir miedo y debilidad incluso en los adversarios más formidables. Hace mucho tiempo, el arma fue dividida en dos mitades. Sin embargo, han circulado rumores de que las dos mitades pueden encontrarse en algún lugar dentro de los muros de Zul'Farrak. Los informes también han sugerido que una banda de mercenarios que huían de Gadgetzan vagaron hacia la ciudad y quedaron atrapados. Su destino sigue siendo desconocido. Pero quizás lo más inquietante de todo son los susurros sobre una antigua criatura durmiendo dentro de un estanque sagrado en el corazón de la ciudad: un poderoso semidiós que desatará una destrucción incalculable sobre cualquier aventurero lo bastante necio como para despertarlo.",
    Caption = "Zul'Farrak",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ZulFarrak.Alliance[1] = {
    Title = "El Medallón de Nekrum",
    Level = 47,
    Attain = 40,
    Aim = "Lleva el Medallón de Nekrum a Thadius Grimshade en las Tierras Devastadas.",
    Location = "Thadius Sombramacabra (Las Tierras Devastadas - Bastión Nethergarde "..yellow.."66,19"..white..")",
    Note = "La cadena de misiones comienza en Maestro de Grifos Garracha (Tierras del Interior - Bastión Wildhammer "..yellow.."9,44"..white..").\nNekrum aparece en "..yellow.."[4]"..white.." con la oleada final que combates en el evento del Templo.",
    Prequest = "Jaulas de los Secacorteza -> Thadius Grimshade",
    Folgequest = "La Adivinación",
}
kQuestInstanceData.ZulFarrak.Alliance[2] = {
    Title = "Temperamento de Troll",
    Level = 45,
    Attain = 40,
    Aim = "Lleva 20 Viales de Temperamento de Troll a Trenton Lighthammer en Gadgetzan.",
    Location = "Trenton Mazaligera (Tanaris - Gadgetzan "..yellow.."51,28"..white..")",
    Note = "Cualquier trol puede soltar los Temples."
}
kQuestInstanceData.ZulFarrak.Alliance[3] = {
    Title = "Caparazones de Escarabajo",
    Level = 45,
    Attain = 40,
    Aim = "Lleva 5 Caparazones de Escarabajo sin Romper a Tran'rek en Gadgetzan.",
    Location = "Tran'rek (Tanaris - Gadgetzan "..yellow.."51,26"..white..")",
    Note = "La misión previa comienza en Krazek (Vega de Tuercespina - Bahía del Botín "..yellow.."25,77"..white..").\nCualquier Escarabajo puede soltar las Caparazones. Hay muchos Escarabajos en "..yellow.."[2]"..white..".",
    Prequest = "Tran'rek",
}
kQuestInstanceData.ZulFarrak.Alliance[4] = {
    Title = "La Tiara de las Profundidades",
    Level = 46,
    Attain = 40,
    Aim = "Lleva la Tiara de las Profundidades a Tabetha en los Pantanos de Dustwallow.",
    Location = "Tabetha (Marjal Revolcafango "..yellow.."46,57"..white..")",
    Note = "Hidromántica Velratha suelta la Tiara de las Profundidades en "..yellow.."[6]"..white..".",
    Prequest = "La Tarea de Tabetha",
    Rewards = {
        Text = "Rewards:",
        { id = 9527 }, --Spellshifter Rod Staff
        { id = 9531 }, --Gemshale Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.ZulFarrak.Alliance[5] = {
    Title = "La Profecía de Mosh'aru",
    Level = 47,
    Attain = 40,
    Aim = "Lleva la Primera y Segunda Tablillas Mosh'aru a Yeh'kinya en Tanaris.",
    Location = "Yeh'kinya (Tanaris - Puerto Steamwheedle "..yellow.."66,22"..white..")",
    Note = "Obtienes la misión previa del mismo PNJ.\nLas Tablillas se obtienen de Theka el Mártir en "..yellow.."[2]"..white.." e Hidromántica Velratha en "..yellow.."[6]"..white..".",
    Prequest = "Espíritus de Chillón",
    Folgequest = "El Huevo Antiguo",
}
kQuestInstanceData.ZulFarrak.Alliance[6] = {
    Title = "Vara Divino-Mática",
    Level = 47,
    Attain = 40,
    Aim = "Lleva la Vara Divino-mática al Jefe Ingeniero Bilgewhizzle en Gadgetzan.",
    Location = "Ingeniero Jefe Silvaina (Tanaris - Gadgetzan "..yellow.."52,28"..white..")",
    Note = "Obtienes la Vara del Sargento Bly. Puedes encontrarlo en "..yellow.."[4]"..white.." después del evento del Templo.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9533 }, --Masons Fraternity Ring Ring
        { id = 9534 }, --Engineer's Guild Headpiece Head, Leather
    }
}
kQuestInstanceData.ZulFarrak.Alliance[7] = {
    Title = "Gahz'rilla",
    Level = 50,
    Attain = 40,
    Aim = "Lleva la Escala Electrificada de Gahz'rilla a Wizzle Tornillos en Los Baldíos Brillantes.",
    Location = "Wizzle Pernolatón (Thousands Needles - Circuito del Espejismo "..yellow.."78,77"..white..")",
    Note = "Obtienes la misión previa de Klockmort Palmalicate (Dun Morogh - Instalación de Reclamación de Gnomeregan "..yellow.."23.6,28"..white.."). No es necesario tener la misión previa para obtener la misión de Gahz'rilla.\nInvocas a Gahz'rilla en "..yellow.."[6]"..white.." con el Mazo de Zul'Farrak.\nEl Mazo Sagrado proviene de Qiaga la Vigilante (Tierras del Interior - El Altar de Zul "..yellow.."49,70"..white..") y debe completarse en el Altar en Jinta'Alor en "..yellow.."59,77"..white.." antes de poder usarse en Zul'Farrak.",
    Prequest = "Los Hermanos Pernolatón",
    Rewards = {
        Text = "Recompensa: ",
        { id = 11122 }, --Carrot on a Stick Trinket
    }
}
kQuestInstanceData.ZulFarrak.Alliance[8] = {
    Title = "Deriva a Través de la Arena",
    Level = 46,
    Attain = 40,
    Aim = "Adéntrate en Zul'Farrak y encuentra los Restos de Troll Antiguo, luego devuélveselos a Hansu Go'sha en las Ruinas de la Luna del Sur en Tanaris.",
    Location = "Hansu Go'sha (Tanaris "..yellow.."42,73"..white..")",
    Note = "En la sala con el Médico Brujo Zum'Rah "..yellow.."[3]"..white.." Enterramiento antiguo (pequeño cofre de madera verde).",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60759 }, --Southmoon Pendant Neck
    }
}
kQuestInstanceData.ZulFarrak.Horde[1] = {
    Title = "El Dios Araña",
    Level = 45,
    Attain = 40,
    Aim = "Lee de la Tablilla de Theka para aprender el nombre del dios araña Secacorteza, luego regresa con el Maestro Gadrin.",
    Location = "Meister Gadrin (Durotar - Aldea Sen'jin "..yellow.."55,74"..white..")",
    Note = "La cadena de misiones comienza con una Botella de Veneno, que se encuentra en mesas en Pueblos Trol de las Tierras del Interior.\nEncuentras la Tablilla en "..yellow.."[2]"..white..".",
    Prequest = "Botellas de Veneno -> Consultar al Maestro Gadrin",
    Folgequest = "Invocando a Shadra",
}
for i = 2, 8 do
    kQuestInstanceData.ZulFarrak.Horde[i] = kQuestInstanceData.ZulFarrak.Alliance[i]
end
kQuestInstanceData.ZulFarrak.Horde[9] = {
    Title = "Termina con Ukorz Sandscalp",
    Level = 48,
    Attain = 40,
    Aim = "Mata a Ukorz Cabellera de Arena y a Ruuzlu dentro de Zul'Farrak para el Campeón Taza'go en la Aldea Sandmoon en Tanaris.",
    Location = "Campeón Taza'go (Tanaris - Poblado de Luna de Arena; esquina noreste de Tanaris, noroeste de Puerto Bonvapor)",
    Note = "La cadena de misiones comienza con la misión 'Redención de los FuriaArena I' en Vidente Maz'ek en Poblado de Luna de Arena(Tanaris) "..yellow.."59.1,17.1"..white..".",
    Prequest = "La Situación de los Sandfury",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60764 }, --The Dune Blade Main Hand, Sword
        { id = 60765 }, --Sandmoon Greaves Legs, Mail
    }
}

--------------- Zul'Gurub ---------------
kQuestInstanceData.ZulGurub = {
    Story = {
        ["Page1"] = "Over a thousand years ago the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, called forth the avatar of an ancient and terrible blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire collapsed upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows, where they erected a great temple to Hakkar in order to prepare for his arrival into the physical world.",
        ["Page2"] = "In time, the Atal'ai priests discovered that Hakkar's physical form could only be summoned within the ancient capital of the Gurubashi Empire, Zul'Gurub. Unfortunately, the priests have met with recent success in their quest to call forth Hakkar - reports confirm the presence of the dreaded Soulflayer in the heart of the Gurubashi ruins.\n\nIn order to quell the blood god, the trolls of the land banded together and sent a contingent of High Priests into the ancient city. Each priest was a powerful champion of the Primal Gods - Bat, Panther, Tiger, Spider, and Snake - but despite their best efforts, they fell under the sway of Hakkar. Now the champions and their Primal God aspects feed the awesome power of the Soulflayer. Any adventurers brave enough to venture into the foreboding ruins must overcome the High Priests if they are to have any hope of confronting the mighty blood god.",
        ["MaxPages"] = "2",
    },
    Caption = {
        "Zul'Gurub",
        "Zul'Gurub (page 2)",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ZulGurub.Alliance[1] = {
    Title = "Una Colección de Cabezas",
    Level = 60,
    Attain = 58,
    Aim = "Ensarta 5 Cabezas de Canalizador, luego devuelve la Colección de Cabezas de Troll a Exzhal en la Isla Yojamba.",
    Location = "Exzhal (Vega de Tuercespina - Isla Yojamba "..yellow.."15,15"..white..")",
    Note = "Asegúrate de saquear a todos los sacerdotes.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 20213 }, --Belt of Shrunken Heads Waist, Plate
        { id = 20215 }, --Belt of Shriveled Heads Waist, Mail
        { id = 20216 }, --Belt of Preserved Heads Waist, Leather
        { id = 20217 }, --Belt of Tiny Heads Waist, Cloth
    }
}
kQuestInstanceData.ZulGurub.Alliance[2] = {
    Title = "El Corazón de Hakkar",
    Level = 60,
    Attain = 58,
    Aim = "Lleva el Corazón de Hakkar a Molthor en la Isla Yojamba.",
    Location = "Corazón de Hakkar (se obtiene de Hakkar "..yellow.."[11]"..white..")",
    Note = "Molthor (Vega de Tuercespina - Isla Yojamba "..yellow.."15,15"..white..")",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 19948 }, --Zandalarian Hero Badge Trinket
        { id = 19950 }, --Zandalarian Hero Charm Trinket
        { id = 19949 }, --Zandalarian Hero Medallion Trinket
    }
}
kQuestInstanceData.ZulGurub.Alliance[3] = {
    Title = "Cinta de Medir de Nat",
    Level = 60,
    Attain = 58,
    Aim = "Devuelve la Cinta Métrica de Nat a Nat Pagle en Los Baldíos.",
    Location = "Caja de aparejos maltratada (Zul'Gurub - Noreste cerca del agua desde la Isla de Hakkar)",
    Note = "Nat Pagle está en Marjal Revolcafango ("..yellow.."59,60"..white.."). Entregar la misión te permite comprar Señuelos de mangosta fangosa de Nat Pagle para invocar a Gahz'ranka en Zul'Gurub.",
}
kQuestInstanceData.ZulGurub.Alliance[4] = {
    Title = "El Veneno Perfecto",
    Level = 60,
    Attain = 60,
    Aim = "Dirk Truenomad en el Bastión Cenarion quiere que le traigas el Saco de Veneno de Venoxis y el Saco de Veneno de Kurinnaxx.",
    Location = "Puñal Truenedera (Silithus - Bastión Cenarion "..yellow.."52,39"..white..")",
    Note = "Saco de Veneno de Venoxis se obtiene de Sumo sacerdote Venoxis en "..yellow.."Zul'Gurub"..white.." en "..yellow.."[2]"..white..". Saco de Veneno de Kurinnaxx se obtiene en las "..yellow.."Ruinas de Ahn'Qiraj"..white.." en "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 22378 }, --Ravenholdt Slicer One-Hand, Sword
        { id = 22379 }, --Shivsprocket's Shiv Main Hand, Dagger
        { id = 22377 }, --The Thunderwood Poker One-Hand, Dagger
        { id = 22348 }, --Doomulus Prime Two-Hand, Mace
        { id = 22347 }, --Fahrad's Reloading Repeater Crossbow
        { id = 22380 }, --Simone's Cultivating Hammer Main Hand, Mace
    }
}
for i = 1, 4 do
    kQuestInstanceData.ZulGurub.Horde[i] = kQuestInstanceData.ZulGurub.Alliance[i]
end

--------------- Gnomeregan ---------------
kQuestInstanceData.Gnomeregan = {
    Story = "Ubicada en Dun Morogh, la maravilla tecnológica conocida como Gnomeregan ha sido la ciudad capital de los gnomos por generaciones. Recientemente, una raza hostil de troggs mutantes infestó varias regiones de Dun Morogh, incluyendo la gran ciudad gnoma. En un intento desesperado por destruir a los troggs invasores, el Alto Manitas Mekkatorque ordenó el vaciado de emergencia de los tanques de desechos radiactivos de la ciudad. Varios gnomos buscaron refugio de los contaminantes aerotransportados mientras esperaban que los troggs murieran o huyeran. Desafortunadamente, aunque los troggs quedaron irradiados por el asalto tóxico, su asedio continuó, sin disminuir. Aquellos gnomos que no fueron asesinados por las filtraciones nocivas se vieron obligados a huir, buscando refugio en la cercana ciudad enana de Forjaz. Allí, el Alto Manitas Mekkatorque se propuso reclutar almas valientes para ayudar a su pueblo a reclamar su amada ciudad. Se rumorea que el alguna vez confiable consejero de Mekkatorque, Mecángeniero Termochufe, traicionó a su pueblo al permitir que la invasión sucediera. Ahora, con su cordura destrozada, Termochufe permanece en Gnomeregan, promoviendo sus oscuros planes y actuando como el nuevo tecno-señor de la ciudad.",
    Caption = "Gnomeregan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Gnomeregan.Alliance[1] = {
    Title = "¡Salvar el Cerebro de Techbot!",
    Level = 26,
    Attain = 20,
    Aim = "Lleva el Núcleo de Memoria de Tecnoide a Maestro Tragaldabas en la Instalación de Reclamación de Gnomeregan.",
    Location = "Maestro Manitas Sobrechispa (Dun Morogh - Instalación de Reclamación Gnomeregan "..yellow.."24.4,29.8"..white..")",
    Note = "Obtienes la misión previa de Hermano Sarno (Ventormenta - Plaza de la Catedral "..yellow.."40,30"..white..").\nEncuentras a Tecnobot antes de entrar a la instancia cerca de la puerta trasera, en "..yellow.."[4] en el Mapa de Entrada"..white..".",
    Prequest = "Tinkmaster Overspark",
}
kQuestInstanceData.Gnomeregan.Alliance[2] = {
    Title = "Gnogaine",
    Level = 27,
    Attain = 20,
    Aim = "Usa el Frasco de Colección de Plomo Vacío en Invasores Irradiados o Saqueadores Irradiados para recolectar lluvia radiactiva. Una vez esté lleno, llévaselo a Ozzie Togglevolt en Kharanos.",
    Location = "Ozzie Voltio Cambiante (Dun Morogh - Kharanos "..yellow.."45,49"..white..")",
    Note = "Obtienes la misión previa de Gnoarn (Dun Morogh - Instalación de Reclamación de Gnomeregan "..yellow.."24.5,30.4"..white..").\nPara obtener la precipitación debes usar el Frasco en Invasores irradiados o Saqueadores irradiados "..red.."vivos"..white..".",
    Prequest = "El Día Después",
    Folgequest = "La Única Cura es Más Resplandor Verde",
}
kQuestInstanceData.Gnomeregan.Alliance[3] = {
    Title = "La Única Cura es Más Resplandor Verde",
    Level = 30,
    Attain = 20,
    Aim = "Viaja a Gnomeregan y trae de vuelta Lluvia Radiactiva de Alta Potencia. Ten cuidado, la lluvia es inestable y colapsará rápidamente.$B$BOzzie también requerirá tu Frasco de Colección de Plomo Pesado cuando la tarea esté completa.",
    Location = "Ozzie Voltio Cambiante (Dun Morogh - Kharanos "..yellow.."45,49"..white..")",
    Note = "Para obtener la precipitación debes usar el Frasco en Cienos irradiados u Horrores "..red.."vivos"..white..".",
    Prequest = "Gnogaine",
}
kQuestInstanceData.Gnomeregan.Alliance[4] = {
    Title = "Excavadores Girodrillmatic",
    Level = 30,
    Attain = 20,
    Aim = "Lleva veinticuatro Tripas Robo-mecánicas a Shoni en Ventormenta.",
    Location = "Shoni el Silencioso (Ventormenta - Barrio Enano "..yellow.."55,12"..white..")",
    Note = "Todos los Robots pueden soltar las Tripas Robo-Mecánicas.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9608 }, --Shoni's Disarming Tool Off Hand, Axe
        { id = 9609 }, --Shilly Mitts Hands, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[5] = {
    Title = "Artificiales Esenciales",
    Level = 30,
    Attain = 24,
    Aim = "Lleva 12 Artificiales Esenciales a Klockmort Spannerspan en la Instalación de Reclamación de Gnomeregan.",
    Location = "Klockmort Palmalicate (Dun Morogh - Instalación de Reclamación Gnomeregan "..yellow.."23.6,28"..white..")",
    Note = "Obtienes la misión previa de Mathiel (Darnassus - Terraza del Guerrero "..yellow.."59,45"..white.."). La misión previa es solo una misión indicadora y no es necesaria para obtener esta misión.\nLos Elementos Esenciales provienen de máquinas dispersas por toda la instancia.",
    Prequest = "Esenciales de Klockmort",
}
kQuestInstanceData.Gnomeregan.Alliance[6] = {
    Title = "Rescate de Datos",
    Level = 30,
    Attain = 25,
    Aim = "Lleva una Tarjeta Perforada Prismática al Maestro Mecánico Castpipe en la Instalación de Reclamación de Gnomeregan en Dun Morogh.",
    Location = "Maestro Mecánico Funditubo (Dun Morogh - Instalación de Reclamación Gnomeregan "..yellow.."24.1,29.8"..white..")",
    Note = "Obtienes la misión previa de Gaxim Herrumbrosa (Sierra Espolón "..yellow.."59,67"..white.."). La misión previa es solo una misión indicadora y no es necesaria para obtener esta misión.\nLa tarjeta blanca es un botín aleatorio. Encuentras el primer terminal junto a la entrada trasera antes de entrar a la instancia en "..yellow.."[3] en el Mapa de Entrada"..white..". La 3005-B está en "..yellow.."[3]"..white..", la 3005-C en "..yellow.."[5]"..white.." y la 3005-D está en "..yellow.."[6]"..white..".",
    Prequest = "La Tarea de Castpipe",
    Rewards = {
        Text = "Rewards:",
        { id = 9605 }, --Repairman's Cape Back
        { id = 9604 }, --Mechanic's Pipehammer Two-Hand, Mace
    }
}
kQuestInstanceData.Gnomeregan.Alliance[7] = {
    Title = "Un Buen Lío",
    Level = 30,
    Attain = 24,
    Aim = "Escolta a Kernobee hasta la salida de la Ruta Mecánica y luego informa a Scooty en Bahía del Botín.",
    Location = "Kernobee (Gnomeregan "..yellow.."[3]"..white..")",
    Note = "¡Misión de escolta! Encuentras a Pedrito en Vega de Tuercespina - Bahía del Botín ("..yellow.."27,77"..white..").",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[8] = {
    Title = "La Gran Traición",
    Level = 35,
    Attain = 25,
    Aim = "Viaja a Gnomeregan y mata al Mecánico Termochufe. Regresa con el Alto Tóquer Mekkatorque cuando hayas completado la tarea.",
    Location = "Alto Mecachifle Mekkatorque (Dun Morogh - Instalación de Reclamación Gnomeregan "..yellow.."24.2,29.7"..white..")",
    Note = "Encuentras a Termochufe en "..yellow.."[8]"..white..". Es el último jefe en Gnomeregan.\nDurante la pelea debes desactivar las columnas presionando el botón en el lateral.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Alliance[9] = {
    Title = "Anillo Cubierto de Mugre",
    Level = 34,
    Attain = 28,
    Aim = "Encuentra una manera de quitar la mugre del Anillo Cubierto de Mugre.",
    Location = "Anillo Lleno de Mugre (botín aleatorio de Gnomeregan)",
    Note = "El Anillo puede limpiarse en el Brillomatico 5200 en la Sala Limpia en "..yellow.."[2]"..white..".",
    Folgequest = "El Regreso del Anillo",
}
kQuestInstanceData.Gnomeregan.Alliance[10] = {
    Title = "El Regreso del Anillo",
    Level = 34,
    Attain = 28,
    Aim = "Puedes quedarte con el anillo, o puedes encontrar a la persona responsable de la impresión y grabados en el interior de la banda.",
    Location = "Anillo de Oro Brillante (obtenido de la misión Anillo Lleno de Mugre)",
    Note = "Se entrega a Talvash del Kissel (Forjaz - Barrio Místico "..yellow.."36,3"..white.."). La misión siguiente para mejorar el anillo es opcional.",
    Prequest = "Anillo Cubierto de Mugre",
    Folgequest = "Mejora de Gnomos",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Alliance[11] = {
    Title = "Un Golpe en la Cabeza",
    Level = 30,
    Attain = 30,
    Aim = "Encuentra a alguien que pueda averiguar qué hacer con el Mainframe.",
    Location = "Estampador Intacto",
    Note = "Estampador Intacto que inicia la misión puede ser obtenido de Golpeamasa 9-60 "..yellow.."[6]"..white.." (probabilidad baja).\n"..red.."Disponible para INGENIEROS con habilidad 125+.",
    Folgequest = "Para Construir un Golpeador",
}
kQuestInstanceData.Gnomeregan.Alliance[12] = {
    Title = "Regulador de Alta Energía",
    Level = 33,
    Attain = 25,
    Aim = "Encuentra el Esquema: Regulador de Alta Energía dentro de Gnomeregan y llévaselo a Weezan Pequeño Engranaje en las Instalaciones de Reclamación de Gnomeregan en Dun Morogh.",
    Location = "Weezan Engranaje Pequeño (Dun Morogh - Instalación de Reclamación Gnomeregan "..yellow.."[25.2,31.6]"..white..")",
    Note = "Esquema: Regulador de Alta Energía está sobre la mesa en "..yellow.."[3]"..white.." esquina sureste cámara inferior sur "..yellow.."[a]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61393 }, --Low Energy Regulator Trinket
    }
}
kQuestInstanceData.Gnomeregan.Alliance[13] = {
    Title = "Activación del Sistema de Respaldo",
    Level = 33,
    Attain = 25,
    Aim = "Activa la Válvula del Canal Alfa y la Palanca del Canal de la Bomba de Reserva en lo profundo de Gnomeregan para el Maestro Técnico Wirespanner en Dun Morogh.",
    Location = "Maestro Técnico Alambretenso (Dun Morogh - Instalación de Reclamación Gnomeregan "..yellow.."[26.8,31.1]"..white..")",
    Note = "Válvula del Canal Alfa está en "..yellow.."[6]"..white..", usa el ascensor para bajar. lado sur del mecanismo central.\nPalanca del Canal de Bomba de Reserva está en "..yellow.."[b]"..white.." en el suelo.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61383 }, --Intricate Gnomish Blunderbuss Gun
        { id = 61384 }, --Ionized Metal Grips Hands, Mail
        { id = 61385 }, --Magnetic Band Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[1] = {
    Title = "¡Gnomer-gooooone!",
    Level = 35,
    Attain = 20,
    Aim = "Espera a que Scooty calibre el Transpondedor Goblin.",
    Location = "Pedrito (Vega de Tuercespina - Bahía del Botín "..yellow.."27,77"..white..")",
    Note = "Obtienes la misión previa de Sovik (Orgrimmar - Valle del Honor "..yellow.."75,25"..white..").\nCuando completes esta misión podrás usar el transpondedor en Bahía del Botín.",
    Prequest = "Ingeniero Jefe Scooty",
}
kQuestInstanceData.Gnomeregan.Horde[2] = {
    Title = "Un Buen Lío",
    Level = 30,
    Attain = 24,
    Aim = "Escolta a Kernobee hasta la salida de la Ruta Mecánica y luego informa a Scooty en Bahía del Botín.",
    Location = "Kernobee (Gnomeregan "..yellow.."[3]"..white..")",
    Note = "¡Misión de escolta! Encuentras a Pedrito en Vega de Tuercespina - Bahía del Botín ("..yellow.."27,77"..white..").",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Horde[3] = {
    Title = "Guerras de Plataformas",
    Level = 35,
    Attain = 25,
    Aim = "Recupera los Planos de la Plataforma y la Combinación de la Caja Fuerte de Thermaplugg de Gnomeregan y llévaselos a Nogg en Orgrimmar.",
    Location = "Nogg (Orgrimmar - Valle del Honor "..yellow.."75,25"..white..")",
    Note = "Encuentras a Termochufe en "..yellow.."[8]"..white..". Es el último jefe en Gnomeregan.\nDurante la pelea debes desactivar las columnas presionando el botón en el lateral.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Horde[4] = {
    Title = "Anillo Cubierto de Mugre",
    Level = 34,
    Attain = 28,
    Aim = "Encuentra una manera de quitar la mugre del Anillo Cubierto de Mugre.",
    Location = "Anillo Lleno de Mugre (botín aleatorio de Gnomeregan)",
    Note = "El Anillo puede limpiarse en el Brillomatico 5200 en la Sala Limpia en "..yellow.."[2]"..white..".",
    Folgequest = "El Regreso del Anillo",
}
kQuestInstanceData.Gnomeregan.Horde[5] = {
    Title = "El Regreso del Anillo",
    Level = 34,
    Attain = 28,
    Aim = "Puedes quedarte con el anillo, o puedes encontrar a la persona responsable de la impresión y grabados en el interior de la banda.",
    Location = "Anillo de Oro Brillante (obtenido de la misión Anillo Lleno de Mugre)",
    Note = "Se entrega a Nogg (Orgrimmar - El Valle del Honor "..yellow.."75,25"..white.."). La misión siguiente para mejorar el anillo es opcional.",
    Prequest = "Anillo Cubierto de Mugre",
    Folgequest = "El Anillo de Nogg Redo",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[6] = {
    Title = "Un Golpe en la Cabeza",
    Level = 30,
    Attain = 30,
    Aim = "Encuentra a alguien que pueda averiguar qué hacer con el Mainframe.",
    Location = "Estampador Intacto",
    Note = "Estampador Intacto que inicia la misión puede ser obtenido de Golpeamasa 9-60 "..yellow.."[6]"..white.." (probabilidad baja).\n"..red.."Disponible para INGENIEROS con habilidad 125+.",
    Folgequest = "Para Construir un Golpeador",
}
kQuestInstanceData.Gnomeregan.Horde[7] = {
    Title = "Condensador de Respaldo",
    Level = 34,
    Attain = 29,
    Aim = "Lleva el Megaflux Capacitor al Técnico Grimzlow.",
    Location = "Técnico Grimzlow (Durotar - Puerto Aguachispa "..yellow.."57.4,25.7"..white..").",
    Note = "Misión previa 'Una Nueva Fuente de Poder' comienza en Técnico Spuzzle(Durotar - Puerto Aguachispa "..yellow.."57.4,25.8"..white..") en nivel 7.\nCapacitor de Megaflujo se obtiene de Mecángeniero Termochufe. Encuentras a Mecángeniero Termochufe en "..yellow.."[8]"..white..". Es el último jefe en Gnomeregan.\nDurante la pelea debes desactivar las columnas presionando el botón en el lateral.",
    Prequest = "Una Nueva Fuente de Energía",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 81319 }, --Razorblade Buckler Shield
        { id = 81320 }, --Crackling Zapper Wand
    }
}

--------------- Dragons of Nightmare ---------------
kQuestInstanceData.FourDragons = {
    Story = {
	    ["Page1"] = "There is a disturbance at the Great Trees. A new threat menaces these secluded areas found in Ashenvale, Duskwood, Feralas, and Hinterlands. Four great guardians of the green Dragonflight have arrived from the Dream, but these once-proud protectors now seek only destruction and death. Take arms with your fellows and march to these hidden groves -- only you can defend Azeroth from the corruption they bring.",
	    ["Page2"] = "Ysera, the great Dreaming dragon Aspect rules over the enigmatic Green dragonflight. Her domain is the fantastic, mystical realm of the Emerald Dream - and it is said that from there she guides the evolutionary path of the world itself. She is the protector of nature and imagination, and it is the charge of her flight to guard all of the Great Trees across the world, which only druids use to enter the Dream itself. In recent times, Ysera's most trusted lieutenants have been warped by a dark new power within the Emerald Dream. Now these wayward sentinels have passed through the Great Trees into Azeroth, intending to spread madness and terror throughout the mortal kingdoms. Even the mightiest of adventurers would be well advised to give the dragons a wide berth, or suffer the consequences of their misguided wrath.",
	    ["Page3"] = "Lethon's exposure to the aberration within the Emerald Dream not only darkened the hue of the mighty dragon's scales, but also empowered him with the ability to extract malevolent shades from his enemies. Once joined with their master, the shades imbue the dragon with healing energies. It should come as no surprise, then, that Lethon is considered to be among the most formidable of Ysera's wayward lieutenants",
	    ["Page4"] = "A  mysterious dark power within the Emerald Dream has transformed the once-majestic Emeriss into a rotting, diseased monstrosity. Reports from the few who have survived encounters with the dragon have told horrifying tales of putrid mushrooms erupting from the corpses of their dead companions. Emeriss is truly the most gruesome and appalling of Ysera's estranged green dragons.",
	    ["Page5"] = "Taerar was perhaps the most affected of Ysera's rogue lieutenants. His interaction with the dark force within the Emerald Dream shattered Taerar's sanity as well as his corporeal form. The dragon now exists as a specter with the ability to split into multiple entities, each of which possesses destructive magical powers. Taerar is a cunning and relentless foe who is intent on turning the madness of his existence into reality for the inhabitants of Azeroth.",
	    ["Page6"] = "Once one of Ysera's most trusted lieutenants, Ysondre has now gone rogue, sewing terror and chaos across the land of Azeroth. Her formerly beneficent healing powers have given way to dark magics, enabling her to cast smoldering lightning waves and summon the aid of fiendish druids. Ysondre and her kin also possess the ability to induce sleep, sending her unfortunate mortal foes to the realm of their most terrifying nightmares.",
	    ["MaxPages"] = "6",
    },
    Caption = {
        "Dragons of Nightmare",
        "Ysera and the Green Dragonflight",
        "Lethon",
        "Emeriss",
        "Taerar",
        "Ysondre",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.FourDragons.Alliance[1] = {
    Title = "Cubierto por la Pesadilla",
    Level = 60,
    Attain = 60,
    Aim = "Encuentra a alguien capaz de descifrar el significado detrás del Objeto Envuelto en Pesadilla.$B$BTal vez un druida de gran poder pueda ayudarte.",
    Location = "Objeto Engullido por Pesadilla (se obtiene de Emeriss, Taerar, Lethon o Ysondre)",
    Note = "La misión se entrega a Guardián Remulos en (Claro de la Luna - Santuario de Remulos "..yellow.."36,41"..white.."). La recompensa listada es para la misión siguiente.",
    Folgequest = "Despertando Leyendas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 20600 }, --Malfurion's Signet Ring Ring
    }
}
kQuestInstanceData.FourDragons.Horde[1] = kQuestInstanceData.FourDragons.Alliance[1]

--------------- Azuregos ---------------
kQuestInstanceData.Azuregos = {
    Story = "Antes de la Gran Fractura, la ciudad elfa de la noche de Eldarath florecía en la tierra que ahora se conoce como Azshara. Se cree que muchos artefactos Altonato antiguos y poderosos pueden encontrarse entre las ruinas de la alguna vez poderosa fortaleza. Durante incontables generaciones, el Vuelo Dragón Azul ha salvaguardado artefactos poderosos y conocimiento mágico, asegurando que no caigan en manos mortales. La presencia de Azuregos, el dragón Azul, parece sugerir que objetos de extrema importancia, quizás los fabulosos Frascos de la Eternidad mismos, pueden encontrarse en la naturaleza de Azshara. Sea lo que sea que Azuregos busque, una cosa es cierta: luchará hasta la muerte para defender los tesoros mágicos de Azshara.",
    Caption = "Azuregos",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Azuregos.Alliance[1] = {
    Title = "Lámina Antigua Envuelta en Tendón",
    Level = 60,
    Attain = 60,
    Aim = "Hastat el Antiguo te ha pedido que le traigas un Tendón de Dragón Azul Maduro. Si encuentras este tendón, devuélveselo a Hastat en Frondavil.",
    Location = "Hastat el Ancestro (Frondavil - Bosques Árbol de Hierro "..yellow.."48,24"..white..")",
    Note = red.."Solo cazador"..white..": Mata a Azuregos para obtener el Tendón de Dragón Azul Maduro. Camina por el medio de la península sur en Azshara cerca de "..yellow.."[1]"..white..".",
    Prequest = "La Hoja Antigua ("..yellow.."Molten Core"..white..")", -- 7632",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18714 }, --Ancient Sinew Wrapped Lamina Quiver
    }
}
kQuestInstanceData.Azuregos.Alliance[2] = {
    Title = "El Libro de Cuentas Mágico de Azuregos",
    Level = 60,
    Attain = 60,
    Aim = "Entrega el Libro de Cuentas Mágico de Azuregos a Narain Soothfancy en Tanaris.",
    Location = "Espíritu de Azuregos (Azshara "..yellow.."56,83"..white..")",
    Note = "Puedes encontrar a Narain Sabelo Todo en Tanaris en "..yellow.."65.17"..white..".",
    Prequest = "La Carga de los Vuelos de Dragones",
    Folgequest = "Traduciendo el Libro de Cuentas",
}
kQuestInstanceData.Azuregos.Horde[1] = kQuestInstanceData.Azuregos.Alliance[1]
kQuestInstanceData.Azuregos.Horde[2] = kQuestInstanceData.Azuregos.Alliance[2]

--------------- Lord Kazzak ---------------
kQuestInstanceData.LordKazzak = {
    Story = "Tras la derrota de la Legión Ardiente al final de la Tercera Guerra, las fuerzas enemigas restantes, lideradas por el colosal señor demonio Kazzak, se retiraron a las Tierras Devastadas. Continúan morando allí hasta el día de hoy en un área llamada la Cicatriz Mancillada, esperando la reapertura del Portal Oscuro. Se rumorea que una vez que el Portal sea reabierto, Kazzak viajará con sus fuerzas restantes a Terrallende. Alguna vez el mundo natal orco de Draenor, Terrallende fue desgarrado por la activación simultánea de varios portales creados por el chamán orco Ner'zhul, y ahora existe como un mundo destrozado ocupado por legiones de agentes demoníacos bajo el mando del traidor elfo de la noche, Illidan.",
    Caption = "Lord Kazzak",
    Alliance = {},
    Horde = {}
}

--------------- Alterac Valley ---------------
kQuestInstanceData.BGAlteracValleyNorth = {
    Story = "Hace mucho tiempo, antes de la Primera Guerra, el brujo Gul'dan exilió a un clan de orcos llamado los Lobo Gélido a un valle oculto en las profundidades del corazón de las Montañas de Alterac. Fue aquí en las regiones del sur del valle donde los Lobo Gélido se ganaron la vida hasta la llegada de Thrall.\nTras la triunfante unificación de los clanes por Thrall, los Lobo Gélido, ahora liderados por el Chamán Orco Drek'Thar, eligieron permanecer en el valle que por tanto tiempo habían llamado su hogar. Sin embargo, en tiempos recientes, la paz relativa de los Lobo Gélido ha sido desafiada por la llegada de la Expedición Pico Tormenta Enana.\nLos Pico Tormenta han establecido residencia en el valle para buscar recursos naturales y reliquias antiguas. A pesar de sus intenciones, la presencia Enana ha desatado un conflicto acalorado con los Orcos Lobo Gélido al sur, quienes han jurado expulsar a los intrusos de sus tierras. ",
    Caption = "Valle de Alterac",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[1] = {
    Title = "El Imperativo Soberano",
    Level = 60,
    Attain = 51,
    Aim = "Viaja al Valle de Alterac en las Tierras Altas de Trabalomas. Fuera del túnel de entrada, encuentra y habla con el Teniente Haggerdin.$B$B¡Por la gloria de Barbabronce!",
    Location = "Teniente Rotimer (Forjaz - La Explanada "..yellow.."30,62"..white..")",
    Note = "Teniente Haggerdin está en (Montañas de Alterac "..yellow.."39,81"..white..").",
    Folgequest = "Campos de Prueba",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[2] = {
    Title = "Campos de Prueba",
    Level = 60,
    Attain = 51,
    Aim = "Viaja a la cueva Zarpa Salvaje ubicada al sureste de la base principal en el Valle de Alterac y encuentra el Estandarte Lobo Gélido. Devuelve el Estandarte Lobo Gélido al Maestro de guerra Laggrond.",
    Location = "Teniente Haggerdin (Montañas de Alterac "..yellow.."39,81"..white..")",
    Note = "El Estandarte de Pico Tormenta está en la Caverna Alashelada en "..yellow.."[11]"..white.." en el mapa Valle de Alterac - Norte. Habla con el mismo PNJ cada vez que obtengas un nuevo nivel de Reputación para conseguir una Insignia mejorada.\n\nLa misión previa no es necesaria para obtener esta misión, pero otorga alrededor de 9550 de experiencia.",
    Prequest = "El Imperativo Soberano",
    Folgequest = "Levántate y Sé Reconocido -> El Ojo del Mando",
    Rewards = {
        Text = "Rewards:",
        { id = 17691 }, --Stormpike Insignia Rank 1 Trinket
        { id = 19484 }, --The Frostwolf Artichoke Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[3] = {
    Title = "La Batalla de Alterac",
    Level = 60,
    Attain = 51,
    Aim = "Entra en el Valle de Alterac, derrota al general de la Horda Drek'Thar y luego regresa con el Prospector Stonehewer en las Montañas de Alterac.",
    Location = "Prospectora Tallapiedra (Montañas de Alterac "..yellow.."41,80"..white..") y\n(Valle de Alterac - North "..yellow.."[B]"..white..")",
    Note = "Drek'thar está en (Valle de Alterac - Sur "..yellow.."[B]"..white.."). En realidad no necesita ser asesinado para completar la misión. El campo de batalla solo tiene que ser ganado por tu bando de cualquier manera.\nDespués de entregar esta misión, habla con el PNJ de nuevo para obtener la recompensa.",
    Folgequest = "Héroe de los Pico Tormenta",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 19107 }, --Bloodseeker Crossbow
        { id = 19106 }, --Ice Barbed Spear Polearm
        { id = 19108 }, --Wand of Biting Cold Wand
        { id = 20648 }, --Cold Forged Hammer Main Hand, Mace
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[4] = {
    Title = "El Intendente",
    Level = 60,
    Attain = 51,
    Aim = "Habla con el Intendente Pico Tormenta.",
    Location = "Montaraz Bramibum (Valle de Alterac - North "..yellow.."Near [3] Before Bridge"..white..")",
    Note = "El Intendente Pico Tormenta está en (Valle de Alterac - Norte "..yellow.."[7]"..white..") y proporciona más misiones.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[5] = {
    Title = "Suministros de Colmillo Helado",
    Level = 60,
    Attain = 51,
    Aim = "Lleva 10 Suministros Colmillo Frío al Intendente de la Horda en la Fortaleza Lobo Gélido.",
    Location = "Intendente Pico Tormenta (Valle de Alterac - North "..yellow.."[7]"..white..")",
    Note = "Los suministros se pueden encontrar en la Mina Colmillo Gélido en (Valle de Alterac - Sur "..yellow.."[6]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[6] = {
    Title = "Suministros de Dentefrío",
    Level = 60,
    Attain = 51,
    Aim = "Lleva 10 Suministros de Ferrohondo al Intendente de la Alianza en Dun Baldar.",
    Location = "Intendente Pico Tormenta (Valle de Alterac - North "..yellow.."[7]"..white..")",
    Note = "Los suministros se pueden encontrar en la Mina Fondo de Hierro en (Valle de Alterac - Norte "..yellow.."[1]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[7] = {
    Title = "Fragmentos de Armadura",
    Level = 60,
    Attain = 51,
    Aim = "Lleva 20 Fragmentos de Armadura a Murgot Deepforge en Dun Baldar.",
    Location = "Murgot Forjahonda (Valle de Alterac - North "..yellow.."[4]"..white..")",
    Note = "Saquea el cadáver de jugadores enemigos para obtener retales. La misión siguiente es la misma, pero repetible.",
    Folgequest = "Más Fragmentos de Armadura",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[8] = {
    Title = "Captura una Mina",
    Level = 60,
    Attain = 51,
    Aim = "Captura una mina que no esté controlada por los Pico Tormenta, luego regresa con el Sargento Durgen Pico Tormenta en las Montañas de Alterac.",
    Location = "Sargento Durgen Pico Tormenta (Montañas de Alterac "..yellow.."37,77"..white..")",
    Note = "Para completar la misión, debes matar a Morloch en la Mina Fondo de Hierro en (Valle de Alterac - Norte "..yellow.."[1]"..white..") o Capataz Snivvle en la Mina Colmillo Gélido en (Valle de Alterac - Sur "..yellow.."[6]"..white..") mientras la Horda la controla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[9] = {
    Title = "Torres y Bunkers",
    Level = 60,
    Attain = 51,
    Aim = "Captura una torre enemiga, luego regresa con el Cabo Teeka Sangre de Furia en las Montañas de Alterac.",
    Location = "Sargento Durgen Pico Tormenta (Montañas de Alterac "..yellow.."37,77"..white..")",
    Note = "Según se informa, la Torre o Búnker no necesita ser destruida para completar la misión, solo asaltada.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[10] = {
    Title = "Cementerios del Valle de Alterac",
    Level = 60,
    Attain = 51,
    Aim = "Asalta un cementerio, luego regresa con el Sargento Durgen Stormpike en las Montañas de Alterac.",
    Location = "Sargento Durgen Pico Tormenta (Montañas de Alterac "..yellow.."37,77"..white..")",
    Note = "Según se informa, no necesitas hacer nada excepto estar cerca de un cementerio cuando la Alianza lo asalta. No necesita ser capturado, solo asaltado.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[11] = {
    Title = "Establos Vacíos",
    Level = 60,
    Attain = 51,
    Aim = "Localiza un Lobo Gélido en el Valle de Alterac. Usa el Bozal de Lobo Gélido cuando estés cerca del Lobo Gélido para 'domar' a la bestia. Una vez domado, el Lobo Gélido te seguirá hasta el Maestro de Establos Lobo Gélido. Habla con el Maestro de Establos Lobo Gélido para obtener crédito por la captura.",
    Location = "Maestra de Establos Pico Tormenta (Valle de Alterac - North "..yellow.."[6]"..white..")",
    Note = "Puedes encontrar un Carnero fuera de la base. El proceso de doma es igual que el de un Cazador domando una mascota. La misión es repetible hasta un total de 25 veces por campo de batalla por el mismo jugador o jugadores. Después de que 25 Carneros hayan sido domados, la Caballería Pico Tormenta llegará para ayudar en la batalla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[12] = {
    Title = "Arnés para Montar Carneros",
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Comandante de Jinetes de Carneros Pico Tormenta (Valle de Alterac - North "..yellow.."[6]"..white..")",
    Note = "Los Lobos Gélidos se pueden encontrar en el área sur del Valle de Alterac.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[13] = {
    Title = "Racimo de Cristal",
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Archidruida Renferal (Valle de Alterac - North "..yellow.."[2]"..white..")",
    Note = "Después de entregar 200 o más cristales, Archidruida Renferal comenzará a caminar hacia (Valle de Alterac - Norte "..yellow.."[19]"..white.."). Una vez allí, comenzará un ritual de invocación que requerirá que 10 personas ayuden. Si tiene éxito, Ivus el Señor del Bosque será invocado para ayudar en la batalla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[14] = {
    Title = "Ivus el Señor del Bosque",
    Level = 60,
    Attain = 51,
    Aim = "El Clan Lobo Gélido está protegido por una corrupción de energía elemental. Sus chamanes se entrometen en poderes que seguramente nos destruirán a todos si no se controlan.\n\nLos soldados Lobo Gélido llevan amuletos elementales llamados cristales de tormenta. Podemos usar los amuletos para conjurar a Ivus. Aventúrate y reclama los cristales.",
    Location = "Archidruida Renferal (Valle de Alterac - North "..yellow.."[2]"..white..")",
    Note = "Después de entregar 200 o más cristales, Archidruida Renferal comenzará a caminar hacia (Valle de Alterac - Norte "..yellow.."[19]"..white.."). Una vez allí, comenzará un ritual de invocación que requerirá que 10 personas ayuden. Si tiene éxito, Ivus el Señor del Bosque será invocado para ayudar en la batalla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[15] = {
    Title = "Llamado del Aire - Flota de Slidore",
    Level = 60,
    Attain = 51,
    Aim = "Mis grifos están listos para atacar las líneas del frente, pero no pueden hacer el ataque hasta que las líneas se debiliten.\n\nLos guerreros Lobo Gélido encargados de mantener las líneas del frente llevan medallas de servicio con orgullo en sus pechos. Arranca esas medallas de sus cadáveres podridos y tráelas aquí.\n\nUna vez que la línea del frente se haya debilitado lo suficiente, ¡daré la orden de ataque aéreo! ¡Muerte desde arriba!",
    Location = "Comandante Del Aire Slidore (Valle de Alterac - North "..yellow.."[8]"..white..")",
    Note = "Mata PNJs de la Horda para obtener la Medalla de Soldado Lobo Gélido.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[16] = {
    Title = "Llamado del Aire - Flota de Vipore",
    Level = 60,
    Attain = 51,
    Aim = "¡Las unidades élite Lobo Gélido que protegen las líneas deben ser tratadas, soldado! Te encargo que reduzcas esa horda de salvajes. Regresa a mí con medallas de sus tenientes y legionarios. Cuando sienta que se ha tratado con suficiente gentuza, desplegaré el ataque aéreo.",
    Location = "Comandante Del Aire Vipore (Valle de Alterac - North "..yellow.."[8]"..white..")",
    Note = "Mata PNJs de la Horda para obtener la Medalla de Teniente Lobo Gélido.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[17] = {
    Title = "Llamado del Aire - Flota de Ichman",
    Level = 60,
    Attain = 51,
    Aim = "Regresa al campo de batalla y ataca el corazón del mando de los Lobo Gélido. Acaba con sus comandantes y guardianes. ¡Regresa a mí con tantas de sus medallas como puedas meter en tu mochila! Te lo prometo, cuando mis grifos vean el botín y huelan la sangre de nuestros enemigos, ¡volarán de nuevo! ¡Ve ahora!",
    Location = "Comandante Del Aire Ichman (Valle de Alterac - North "..yellow.."[8]"..white..")",
    Note = "Mata PNJs de la Horda para obtener las Medallas de Comandante Lobo Gélido. Después de entregar 50, Comandante del Aire Ichman enviará un grifo para atacar la base de la Horda o te dará una baliza para plantar en el Cementerio de Nevadaluna. Si la baliza es protegida el tiempo suficiente, un grifo vendrá a defenderla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[1] = {
    Title = "En Defensa de Lobo Gélido",
    Level = 60,
    Attain = 51,
    Aim = "Viaja al Valle de Alterac, ubicado en las Montañas de Alterac. Encuentra y habla con Maestro de Guerra Laggrond - que se encuentra fuera de la entrada del túnel - para comenzar tu carrera como soldado de los Lobo Gélido. Encontrarás el Valle de Alterac al norte de Molino Tarren, al pie de las Montañas de Alterac.",
    Location = "Embajadora Rokhstrom Lobo Gélido (Orgrimmar - Valle de la Fuerza "..yellow.."50,71"..white..")",
    Note = "Maestro de Guerra Laggrond está en (Montañas de Alterac "..yellow.."62,59"..white..").",
    Folgequest = "Campos de Prueba",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[2] = {
    Title = "Campos de Prueba",
    Level = 60,
    Attain = 51,
    Aim = "Viaja a la cueva Zarpa Salvaje ubicada al sureste de la base principal en el Valle de Alterac y encuentra el Estandarte Lobo Gélido. Devuelve el Estandarte Lobo Gélido al Maestro de guerra Laggrond.",
    Location = "Maestro de Guerra Laggrond (Montañas de Alterac "..yellow.."62,59"..white..")",
    Note = "El Estandarte de Lobo Gélido está en la Caverna Zarpa Salvaje en (Valle de Alterac - Sur "..yellow.."[9]"..white.."). Habla con el mismo PNJ cada vez que obtengas un nuevo nivel de Reputación para conseguir una Insignia mejorada.\n\nLa misión previa no es necesaria para obtener esta misión, pero otorga alrededor de 9550 de experiencia.",
    Prequest = "En Defensa de Lobo Gélido",
    Folgequest = "Levántate y Sé Reconocido -> El Ojo del Mando",
    Rewards = {
        Text = "Rewards:",
        { id = 17690 }, --Frostwolf Insignia Rank 1 Trinket
        { id = 19483 }, --Peeling the Onion Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[3] = {
    Title = "La Batalla por Alterac",
    Level = 60,
    Attain = 51,
    Aim = "Entra en el Valle de Alterac y derrota al general enano, Vanndar Pico Tormenta. Luego, regresa con Voggah Apretón Mortal en las Montañas de Alterac.",
    Location = "Voggah Agarre Letal (Montañas de Alterac "..yellow.."64,60"..white..")",
    Note = "Vanndar Pico Tormenta está en (Valle de Alterac - Norte "..yellow.."[B]"..white.."). En realidad no necesita ser asesinado para completar la misión. El campo de batalla solo tiene que ser ganado por tu bando de cualquier manera.\nDespués de entregar esta misión, habla con el PNJ de nuevo para obtener la recompensa.",
    Folgequest = "Héroe de los Lobo Gélido",
    Rewards = kQuestInstanceData.BGAlteracValleyNorth.Alliance[3].Rewards
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[4] = {
    Title = "Habla con Nuestro Intendente",
    Level = 60,
    Attain = 51,
    Aim = "Habla con el Intendente Lobo Gélido.",
    Location = "Jotek (Valle de Alterac - South "..yellow.."[8]"..white..")",
    Note = "El Intendente Lobo Gélido está en "..yellow.."[10]"..white.." y proporciona más misiones.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[5] = {
    Title = "Suministros de Colmillo Helado",
    Level = 60,
    Attain = 51,
    Aim = "Lleva 10 Suministros Colmillo Frío al Intendente de la Horda en la Fortaleza Lobo Gélido.",
    Location = "Intendente Lobo Gélido (Valle de Alterac - South "..yellow.."[10]"..white..")",
    Note = "Los suministros se pueden encontrar en la Mina Colmillo Gélido en (Valle de Alterac - Sur "..yellow.."[6]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[6] = {
    Title = "Suministros de Dentefrío",
    Level = 60,
    Attain = 51,
    Aim = "Lleva 10 Suministros de Ferrohondo al Intendente de la Alianza en Dun Baldar.",
    Location = "Intendente Lobo Gélido (Valle de Alterac - South "..yellow.."[10]"..white..")",
    Note = "Los suministros se pueden encontrar en la Mina Fondo de Hierro en (Valle de Alterac - Norte "..yellow.."[1]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[7] = {
    Title = "Botín del Enemigo",
    Level = 60,
    Attain = 51,
    Aim = "Lleva 20 Fragmentos de Armadura a Smith Regzar en la Aldea Lobo Gélido.",
    Location = "Herrero Regzar (Valle de Alterac - South "..yellow.."[8]"..white..")",
    Note = "Saquea el cadáver de jugadores enemigos para obtener retales. La misión siguiente es la misma, pero repetible.",
    Folgequest = "¡Más Botín!",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[8] = {
    Title = "Captura una Mina",
    Level = 60,
    Attain = 51,
    Aim = "Captura una mina que no esté controlada por los Pico Tormenta, luego regresa con el Sargento Durgen Pico Tormenta en las Montañas de Alterac.",
    Location = "Cabo Teeka Gruñido Sangriento (Montañas de Alterac "..yellow.."66,55"..white..")",
    Note = "Para completar la misión, debes matar a Morloch en la Mina Fondo de Hierro en (Valle de Alterac - Norte "..yellow.."[1]"..white..") o Capataz Snivvle en la Mina Colmillo Gélido en (Valle de Alterac - Sur "..yellow.."[6]"..white..") mientras la Alianza la controla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[9] = {
    Title = "Torres y Bunkers",
    Level = 60,
    Attain = 51,
    Aim = "Captura una torre enemiga, luego regresa con el Cabo Teeka Sangre de Furia en las Montañas de Alterac.",
    Location = "Cabo Teeka Gruñido Sangriento (Montañas de Alterac "..yellow.."66,55"..white..")",
    Note = "Según se informa, la Torre o Búnker no necesita ser destruida para completar la misión, solo asaltada.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[10] = {
    Title = "Los Cementerios de Alterac",
    Level = 60,
    Attain = 51,
    Aim = "Asalta un cementerio, luego regresa con el Cabo Teeka Bloodsnarl en las Montañas de Alterac.",
    Location = "Cabo Teeka Gruñido Sangriento (Montañas de Alterac "..yellow.."66,55"..white..")",
    Note = "Según se informa, no necesitas hacer nada excepto estar cerca de un cementerio cuando la Horda lo asalta. No necesita ser capturado, solo asaltado.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[11] = {
    Title = "Establos Vacíos",
    Level = 60,
    Attain = 51,
    Aim = "Localiza un Lobo Gélido en el Valle de Alterac. Usa el Bozal de Lobo Gélido cuando estés cerca del Lobo Gélido para 'domar' a la bestia. Una vez domado, el Lobo Gélido te seguirá hasta el Maestro de Establos Lobo Gélido. Habla con el Maestro de Establos Lobo Gélido para obtener crédito por la captura.",
    Location = "Maestra de Establos Lobo Gélido (Valle de Alterac - South "..yellow.."[9]"..white..")",
    Note = "Puedes encontrar un Lobo Gélido fuera de la base. El proceso de doma es igual que el de un Cazador domando una mascota. La misión es repetible hasta un total de 25 veces por campo de batalla por el mismo jugador o jugadores. Después de que 25 Carneros hayan sido domados, la Caballería Lobo Gélido llegará para ayudar en la batalla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[12] = {
    Title = "Arnés de Piel de Carnero",
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Comandate Jinete de Lobos Lobo Gélido (Valle de Alterac - South "..yellow.."[9]"..white..")",
    Note = "Los Carneros se pueden encontrar en el área norte del Valle de Alterac.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[13] = {
    Title = "Un Galón de Sangre",
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Primalista Thurloga (Valle de Alterac - South "..yellow.."[8]"..white..")",
    Note = "Después de entregar 150 o más Sangre, Primalista Thurloga comenzará a caminar hacia (Valle de Alterac - Sur "..yellow.."[14]"..white.."). Una vez allí, comenzará un ritual de invocación que requerirá que 10 personas ayuden. Si tiene éxito, Lokholar el Señor del Hielo será invocado para matar jugadores de la Alianza.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[14] = {
    Title = "Lokholar el Señor del Hielo",
    Level = 60,
    Attain = 51,
    Aim = "Debes abatir a nuestros enemigos y traerme su sangre. Una vez que se haya reunido suficiente sangre, el ritual de invocación puede comenzar.\n\nLa victoria estará asegurada cuando el señor elemental sea liberado sobre el ejército Pico Tormenta.",
    Location = "Primalista Thurloga (Valle de Alterac - South "..yellow.."[8]"..white..")",
    Note = "Después de entregar 150 o más Sangre, Primalista Thurloga comenzará a caminar hacia (Valle de Alterac - Sur "..yellow.."[14]"..white.."). Una vez allí, comenzará un ritual de invocación que requerirá que 10 personas ayuden. Si tiene éxito, Lokholar el Señor del Hielo será invocado para matar jugadores de la Alianza.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[15] = {
    Title = "Llamado del Aire - Flota de Guse",
    Level = 60,
    Attain = 51,
    Aim = "Mis jinetes están listos para hacer un ataque en el campo de batalla central; pero primero, debo abrir su apetito - preparándolos para el asalto.\n\nNecesito suficiente Carne de Soldado Pico Tormenta para alimentar una flota. ¡Cientos de libras! Seguramente puedes con eso, ¿verdad? ¡En marcha!",
    Location = "Comandante Del Aire Guse (Valle de Alterac - South "..yellow.."[13]"..white..")",
    Note = "Mata PNJs de la Alianza para obtener la Carne de Soldado Pico Tormenta. Según se informa, se necesitan 90 carnes para hacer que la Comandante del Ala haga lo que sea que haga.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[16] = {
    Title = "Llamado del Aire - Flota de Jeztor",
    Level = 60,
    Attain = 51,
    Aim = "Mis Jinetes de Guerra deben probar la carne de sus objetivos. ¡Esto asegurará un ataque quirúrgico contra nuestros enemigos!\n\nMi flota es la segunda más poderosa en nuestro mando aéreo. Por lo tanto, atacarán a los más poderosos de nuestros adversarios. Para esto, entonces, necesitan la carne de los Tenientes Pico Tormenta.",
    Location = "Comandante Del Aire Jeztor (Valle de Alterac - South "..yellow.."[13]"..white..")",
    Note = "Mata PNJs de la Alianza para obtener la Carne de Teniente Pico Tormenta.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[17] = {
    Title = "Llamado del Aire - Flota de Mulverick",
    Level = 60,
    Attain = 51,
    Aim = "Primero, mis jinetes de guerra necesitan objetivos a los que disparar - objetivos de alta prioridad. Voy a necesitar alimentarlos con la carne de Comandantes Pico Tormenta. Desafortunadamente, ¡esos pequeños están atrincherados profundamente detrás de las líneas enemigas! Definitivamente tienes mucho trabajo por delante.",
    Location = "Comandante Del Aire Mulverick (Valle de Alterac - South "..yellow.."[13]"..white..")",
    Note = "Mata PNJs de la Alianza para obtener la Carne de Comandante Pico Tormenta.",
}

--------------- Arathi Basin ---------------
kQuestInstanceData.BGArathiBasin = {
    Story = "La Cuenca de Arathi, ubicada en las Tierras Altas de Arathi, es un campo de batalla rápido y emocionante. La Cuenca en sí es rica en recursos y codiciada tanto por la Horda como por la Alianza. Los Profanadores Renegados y la Liga de Arathor han llegado a la Cuenca de Arathi para librar una guerra por estos recursos naturales y reclamarlos en nombre de sus respectivos bandos.",
    Caption = "Cuenca de Arathi",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGArathiBasin.Alliance[1] = {
    Title = "¡La Batalla por la Cuenca de Arathi!",
    Level = 55,
    Attain = 50,
    Aim = "Asalta la mina, el aserradero, la herrería y la granja, luego regresa con el Mariscal de Campo Oslight en Refugio de la Zaga.",
    Location = "Alguacil de Campo Uluz (Tierras Altas de Arathi - Punta del Refugio "..yellow.."46,45"..white..")",
    Note = "Los lugares a asaltar están marcados en el mapa como 2 a 5.",
}
kQuestInstanceData.BGArathiBasin.Alliance[2] = {
    Title = "Controlar Cuatro Bases",
    Level = 60,
    Attain = 60,
    Aim = "Entra en la Cuenca de Arathi, captura y controla cuatro bases al mismo tiempo y luego regresa con el Mariscal de Campo Oslight en Refugio de la Zaga.",
    Location = "Alguacil de Campo Uluz (Tierras Altas de Arathi - Punta del Refugio "..yellow.."46,45"..white..")",
    Note = "Necesitas ser Amistoso con la Liga de Arathor para obtener esta misión.",
}
kQuestInstanceData.BGArathiBasin.Alliance[3] = {
    Title = "Controlar Cinco Bases",
    Level = 60,
    Attain = 60,
    Aim = "Controla 5 bases en la Cuenca de Arathi al mismo tiempo, luego regresa con el Mariscal de Campo Oslight en Refugio de la Zaga.",
    Location = "Alguacil de Campo Uluz (Tierras Altas de Arathi - Punta del Refugio "..yellow.."46,45"..white..")",
    Note = "Necesitas ser Exaltado con la Liga de Arathor para obtener esta misión.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 20132 }, --Arathor Battle Tabard Tabard
    }
}
kQuestInstanceData.BGArathiBasin.Horde[1] = {
    Title = "¡La Batalla por la Cuenca de Arathi!",
    Level = 25,
    Attain = 25,
    Aim = "Asalta la mina, el aserradero, la herrería y la granja, luego regresa con el Mariscal de Campo Oslight en Refugio de la Zaga.",
    Location = "Maestro de la Muerte Duire (Tierras Altas de Arathi - Caída de Martillo "..yellow.."74,35"..white..")",
    Note = "Los lugares a asaltar están marcados en el mapa como 1 a 4.",
}
kQuestInstanceData.BGArathiBasin.Horde[2] = {
    Title = "Tomar Cuatro Bases",
    Level = 60,
    Attain = 60,
    Aim = "Mantén cuatro bases al mismo tiempo en la Cuenca de Arathi, y luego regresa con Maestro de la Muerte Dwire en Grito de Guerra.",
    Location = "Maestro de la Muerte Duire (Tierras Altas de Arathi - Caída de Martillo "..yellow.."74,35"..white..")",
    Note = "Necesitas ser Amistoso con Los Profanadores para obtener esta misión.",
}
kQuestInstanceData.BGArathiBasin.Horde[3] = {
    Title = "Tomar Cinco Bases",
    Level = 60,
    Attain = 60,
    Aim = "Mantén cinco bases en la Cuenca de Arathi al mismo tiempo, luego regresa con Maestro de la Muerte Dwire en Grito de Guerra.",
    Location = "Maestro de la Muerte Duire (Tierras Altas de Arathi - Caída de Martillo "..yellow.."74,35"..white..")",
    Note = "Necesitas ser Exaltado con Los Profanadores para obtener esta misión.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 20131 }, --Battle Tabard of the Defilers Tabard
    }
}

--------------- Warsong Gulch ---------------
kQuestInstanceData.BGWarsongGulch = {
    Story = "Ubicada en la región sur del bosque de Vallefresno, la Garganta Grito de Guerra está cerca del área donde Grom Grito Infernal y sus Orcos talaron enormes extensiones de bosque durante los eventos de la Tercera Guerra. Algunos orcos han permanecido en las cercanías, continuando su deforestación para alimentar la expansión de la Horda. Se llaman a sí mismos los Jinetes Grito de Guerra.\nLos Elfos de la Noche, que han comenzado un impulso masivo para reconquistar los bosques de Vallefresno, ahora están enfocando su atención en deshacerse de los Jinetes de su tierra de una vez por todas. Y así, las Centinelas Ala de Plata han respondido al llamado y jurado que no descansarán hasta que cada último Orco sea derrotado y expulsado de la Garganta Grito de Guerra. ",
    Caption = "Garganta Grito de Guerra",
    Alliance = {},
    Horde = {}
}

--------------- The Crescent Grove ---------------
kQuestInstanceData.TheCrescentGrove = {
    Story = "Un claro oculto en el sur de Vallefresno con vistas al Lago Mystral que una vez fue un retiro para druidas durante varios años, una presencia maligna ha echado raíces en la región.\nOriginalmente un claro oculto que servía como un retiro tranquilo para druidas, en tiempos recientes la tribu Groveweald se ha mudado huyendo de la locura de la tribu Foulweald, expulsando a varios de los habitantes originales en el proceso. Sin embargo, a pesar de sus intentos de escapar de la locura, sucumbieron a ella con el tiempo.\nKalanar Brillosol una vez vivió aquí, antes de ser expulsado del Claro por los furbolgs Groveweald y su hogar fue quemado.\nLas fuerzas demoníacas de la Legión Ardiente lideradas por el guardia apocalíptico Maestro Raxxieth se han establecido dentro del claro, comenzando a corromper la arboleda. Ya la Legión ha dejado su marca en forma de la Cicatriz Vilethorn, alterando el equilibrio y perturbando a los espíritus.",
    Caption = "The Claro de la Media Luna",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheCrescentGrove.Alliance[1] = {
    Title = "Cabeza de la Manada",
    Level = 33,
    Attain = 26,
    Aim = "Adéntrate en la Arboleda Creciente y recolecta 8 Emblemas de Arboleda de los furbolgs del interior para Grol el Exiliado.",
    Location = "Grol el Exiliado (Vallefresno "..yellow.."56,59"..white..")",
    Note = "Se obtiene de furbolgs.",
}
kQuestInstanceData.TheCrescentGrove.Alliance[2] = {
    Title = "El Groveweald Desenfrenado",
    Level = 34,
    Attain = 26,
    Aim = "Lleva las garras del Anciano 'Un Ojo' y el Anciano Blackmaw desde la Arboleda Creciente a Grol el Exiliado.",
    Location = "Grol el Exiliado (Vallefresno "..yellow.."56,59"..white..")",
    Note = "Se obtiene de furbolgs cerca del primer jefe.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60179 }, --Grol's Band Ring
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[3] = {
    Title = "Los Ancianos Imprudentes",
    Level = 37,
    Attain = 28,
    Aim = "Destruye la fuente de corrupción dentro de la Arboleda Creciente y regresa con Denatharion en Teldrassil.",
    Location = "Denatharion <Instructor de druidas> (Teldrassil – Darnassus) "..yellow.."24,48"..white..")",
    Note = "Necesitas matar al último jefe.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60180 }, --Sentinel Chain Chest, Mail
        { id = 60181 }, --Groveweave Cloak Back
        { id = 60182 }, --Epaulets of Forest Wisdom Shoulder, Cloth
        { id = 60183 }, --Bushstalker Mask Head, Leather
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[4] = {
    Title = "El Mazo de Kalanar",
    Level = 33,
    Attain = 25,
    Aim = "Viaja a la Arboleda Creciente y encuentra la casa quemada de Kalanar Brightshine. Luego recupera el Mazo de Kalanar y devuélveselo a él en Astranaar.",
    Location = "Kalanar Brillo Brillante (Vallefresno "..yellow.."36,52"..white..")",
    Note = "Contenido en la caja fuerte de Kalanar.",
}
kQuestInstanceData.TheCrescentGrove.Horde[1] = kQuestInstanceData.TheCrescentGrove.Alliance[1]
kQuestInstanceData.TheCrescentGrove.Horde[2] = kQuestInstanceData.TheCrescentGrove.Alliance[2]
kQuestInstanceData.TheCrescentGrove.Horde[3] = {
    Title = "Extirpando el Mal",
    Level = 37,
    Attain = 26,
    Aim = "Adéntrate en la Arboleda Creciente y elimina el mal que hay en su interior.",
    Location = "Loruk Trotabosques (Vallefresno - Puesto de Árbol Astillado "..yellow.."73,59"..white..")",
    Note = "La cadena de misiones comienza en Loruk Andabosques también. Necesitas matar al último jefe.",
    Prequest = "Misterios del Bosque -> Informe de Feran",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60213 }, --Outrider Chain Chest, Mail
        { id = 60214 }, --Strongwind Cloak Back
        { id = 60215 }, --Foreststrider Spaulders Shoulder, Leather
        { id = 60216 }, --Hat of Forest Medicine Head, Cloth
    }
}

--------------- Karazhan Crypt ---------------
kQuestInstanceData.KarazhanCrypt = {
    Story = "La Cripta de Karazhan es una mazmorra de instancia ubicada en el Paso de Viento Muerto. Algo está retorciendo a los muertos de vuelta a la vida en las desoladas catacumbas, encuentra la fuente para que los muertos puedan descansar de nuevo.",
    Caption = "Cripta de Karazhan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.KarazhanCrypt.Alliance[1] = {
    Title = "El Misterio de Karazhan VII",
    Level = 60,
    Attain = 58,
    Aim = "Adéntrate en las Criptas de Karazhan, una vez dentro mata a Alarus, el vigilante de las Criptas, para el Magus Ariden Dusktower en el Paso de la Muerte.",
    Location = "Magus Ariden Torre Oscura (Paso de la Muerte "..yellow.."52,34"..white..")",
    Note = "Llave de la Cripta de Karazhan de la misión (El Misterio de Karazhan VI). Puedes encontrar a Alarus en [5].",
    Prequest = "El Misterio de Karazhan I >> El Misterio de Karazhan VI",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60463 }, --Arcane Charged Pendant Neck
        { id = 60464 }, --Orb of Kaladoon Trinket
        { id = 60465 }, --Arcane Strengthened Band Ring
    }
}
kQuestInstanceData.KarazhanCrypt.Alliance[2] = {
    Title = "La Majestad de un Chef",
    Level = 61,
    Attain = 60,
    Aim = "Mata a los Strigoi Voraces en las Criptas de Karazhan y regresa con El Cocinero en los Pasillos Inferiores de Karazhan.",
    Location = "El Cocinero near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Se obtiene de [Strigoi Voraz].\nLa cadena de misiones comienza con [Recetas de Kezan] que se obtiene en "..yellow.."[Torre de Karazhan]"..white..".",
    Prequest = "Un Camino Abierto",
    Rewards = {
        Text = "Recompensa: ",
        { id = 92045 }, --Recipe: Empowering Herbal Salad Pattern
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[1] = {
    Title = "Las Profundidades de Karazhan VII",
    Level = 60,
    Attain = 58,
    Aim = "Adéntrate en las Criptas de Karazhan, una vez dentro mata a Alarus, el vigilante de las Criptas, para Kor'gan en Rocal.",
    Location = "Kor'gan (Pantano de las Penas "..yellow.."44,55"..white..")",
    Note = "Llave de la Cripta de Karazhan de la misión (Las Profundidades de Karazhan VI). Puedes encontrar a Alarus en [5].",
    Prequest = "Las Profundidades de Karazhan I >> Las Profundidades de Karazhan VI",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60459 }, --Charged Arcane Ring Ring
        { id = 60460 }, --Tusk of Gardon Neck
        { id = 60461 }, --Blackfire Orb Trinket
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[2] = kQuestInstanceData.KarazhanCrypt.Alliance[2]

--------------- Caverns Of Time: The Black Morass ---------------
kQuestInstanceData.CavernsOfTimeBlackMorass = {
    Story = "En las Cavernas del Tiempo, en Tanaris, el Portal Oscuro recrea la historia de su primera apertura. Los Dragones de Bronce, guardianes del tiempo, necesitan tu ayuda para mantener la estabilidad de la línea temporal y aplastar la conspiración de los caídos.",
    Caption = "Caverns Of Time: El Morass Negro",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[1] = {
    Title = "La Primera Apertura del Portal Oscuro",
    Level = 60,
    Attain = 60,
    Aim = "Entra en los Caminos del Tiempo en el pasado de la Ciénaga Negra y mata a Antnormi. Lleva su cabeza a Kheyna.",
    Location = "Cromi (Tanaris - Cavernas del Tiempo "..yellow.."57,59"..white..")",
    Note = "La cadena de misiones comienza en Lizzarik <Comerciante de Armas> (Los Baldíos - patrulla desde la Encrucijada hasta Trinquete "..yellow.."57,37"..white.."). Se obtiene de [4].",
    Prequest = "Una Oportunidad Reluciente > Una Buena Acción Sangrienta > Una Carta de un Amigo >> Un Viaje a las Cavernas",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 82950 }, --X-51 Arcane Ocular Implants Head, Cloth
        { id = 82951 }, --X-52 Stealth Ocular Implants Head, Leather
        { id = 82952 }, --X-53 Ranger Ocular Implants Head, Mail
        { id = 82953 }, --X-54 Guardian Ocular Implants Head, Plate
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[2] = {
    Title = "La Traición del Bronce",
    Level = 60,
    Attain = 58,
    Aim = "Mata a Chronar y lleva su cabeza a Tyvadrius en las Cavernas del Tiempo.",
    Location = "Tyvadrius (Tanaris - Cavernas del Tiempo "..yellow.."59,60"..white..")",
    Note = "Necesitas matar al primer jefe.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60497 }, --Pendant of Tyvadrius Neck
        { id = 60498 }, --Halberd of the Bronze Defender Polearm
        { id = 60499 }, --Ring of Tyvadrius Ring
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[3] = {
    Title = "Arena Corrupta",
    Level = 60,
    Attain = 58,
    Aim = "Recolecta una Arena Corrupta para Dronormu en las Cavernas del Tiempo.",
    Location = "Dronormu (Tanaris - Cavernas del Tiempo "..yellow.."63,58"..white..")",
    Note = "Se obtiene de enemigos y jefes.",
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[4] = {
    Title = "Arena a Granel",
    Level = 60,
    Attain = 58,
    Aim = "Recolecta 10 Arenas Corruptas para Dronormu en las Cavernas del Tiempo.",
    Location = "Dronormu (Tanaris - Cavernas del Tiempo "..yellow.."63,58"..white..")",
    Note = "Se obtiene de enemigos y jefes.",
}
for i = 1, 4 do
    kQuestInstanceData.CavernsOfTimeBlackMorass.Horde[i] = kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[i]
end

--------------- Hateforge Quarry ---------------
kQuestInstanceData.HateforgeQuarry = {
    Story = "La Cantera Forja del Odio es una mazmorra de instancia ubicada en las Estepas Ardientes. Escondida en los muros del sureste de las Estepas Ardientes, la Cantera Forja del Odio es el esfuerzo más reciente de los enanos Hierro Negro para encontrar una nueva arma para usar contra sus adversarios. La cantera de aspecto inocente oculta una caverna insidiosa, donde los enanos Forja de Sombras traman nuevos planes contra todos aquellos que se les oponen.",
    Caption = "Cantera Hateforge",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.HateforgeQuarry.Alliance[1] = {
    Title = "Presencia Rival",
    Level = 54,
    Attain = 47,
    Aim = "Averigua qué están desenterrando en la Cantera Forjodio.",
    Location = "Sobrestante Puñaceite <La Hermandad del Torio> (La Garganta de Fuego - Punta de Torio "..yellow.."38.1,27.0"..white..").",
    Note = "Los enemigos Químico Forja de Odio sueltan Frasco Lleno de Brebaje de Forja de Odio para la misión.",
}
kQuestInstanceData.HateforgeQuarry.Alliance[2] = {
    Title = "Motín de la Unión de Mineros II",
    Level = 50,
    Attain = 45,
    Aim = "Mata 20 Mineros Forjodio en la Cantera Forjodio y regresa con Morgrim Pico de Fuego en el Paso Roca Negra en las Estepas Ardientes.",
    Location = "Morgrim Pica de Fuego (Las Estepas Ardientes - Paso de Roca Negra "..yellow.."75.6,68.3"..white..").",
    Note = "La cadena de misiones comienza en Radgan Llamaprofunda con la misión 'Ganando la Confianza de Orvak' (Las Estepas Ardientes - Paso de Roca Negra "..yellow.."76.1,67.6"..white..").",
    Prequest = "Ganando la Confianza de Orvak -> Escuchando la Historia de Orvak -> El Alijo de Sternrock -> Motín de la Unión de Mineros",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60673 }, --Cuffs of Justice Wrist, Plate
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[3] = {
    Title = "El Verdadero Alto Capataz",
    Level = 51,
    Attain = 45,
    Aim = "Mata a Bargul Martillonegro y recupera las Órdenes del Senado para Orvak Rocaferrea en el Paso Roca Negra en las Estepas Ardientes.",
    Location = "Orvak Roca Severa (Las Estepas Ardientes - Paso de Roca Negra "..yellow.."75.9,68.2"..white..").",
    Note = "La cadena de misiones comienza en Radgan Llamaprofunda con la misión 'Ganando la Confianza de Orvak' (Las Estepas Ardientes - Paso de Roca Negra "..yellow.."76.1,67.6"..white..").\nMata a Bargul Martillonegro y toma las Órdenes del Senado en la mesa junto al jefe.",
    Prequest = "Ganando la Confianza de Orvak -> Escuchando la Historia de Orvak -> El Alijo de Sternrock",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60665 }, --Deepblaze Signet Ring
        { id = 60666 }, --Sternrock Trudgers Feet, Leather
        { id = 60667 }, --Firepike's Lucky Trousers Legs, Cloth
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[4] = {
    Title = "Sangre Reluciente",
    Level = 50,
    Attain = 50,
    Aim = "Encuentra a alguien que te enseñe sobre la gema abrasadora.",
    Location = "Fragmento de Luz Trémula (Cantera Hateforge"..yellow.."[74, 73]"..white..").",
    Note = red.."(Solo JOYERÍA)"..white.." Encuentra 'Fragmento de Luz Trémula' y obtén la misión.\nRecibirás la recompensa al completar la última misión de la cadena.",
    Folgequest = "Maestría de Forjatinieblas",
    Rewards = {
        Text = "Recompensa: All",
        { id = 61818 }, --Gorgeous Mountain Gemstone Enchant
        { id = 70209 }, --Plans: Gorgeous Mountain Gemstone Pattern
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[5] = {
    Title = "Rumores de la Cerveza Hateforge",
    Level = 54,
    Attain = 45,
    Aim = "Adéntrate en la Cantera Forjodio y recupera un Frasco Hierro Negro y los Documentos de Química Forjodio, luego regresa con Varlag Barba Oscura en la Vigilia de Morgan en las Tierras Devastadas.",
    Location = "Varlag Barba Crepuscular (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."85.1,67.6"..white..").",
    Note = "Los enemigos Químico Forja de Odio sueltan Frasco de Hierro Oscuro para la misión, los Documentos de Química de Forja de Odio están en la caja"..yellow.."[a]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 2686 }, --Thunder Ale Drinkable
        { id = 60699 }, --Varlag's Clutches Hands, Leather
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[6] = {
    Title = "Asaltando Hateforge",
    Level = 57,
    Attain = 45,
    Aim = "Adéntrate en la Cantera Hateforge y elimina la presencia del Martillo Crepuscular en su interior. Cuando hayas terminado, regresa con el Rey Magni Bronzebeard en Forjaz.",
    Location = "Senador Cinturón de Granito (Las Estepas Ardientes - Vigilancia de Morgan "..yellow.."85.2,67.9"..white..").",
    Note = "Mata al último jefe Har'gesh Clamor del Destino "..yellow.."[5]"..white..".\nLa cadena de misiones comienza con la misión 'Investigando Hateforge' del mismo PNJ.",
    Prequest = "Investigando Hateforge -> El Informe de Hateforge -> La Respuesta del Rey",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60694 }, --Crown of Grobi Head, Mail
        { id = 60695 }, --Sigil of Heritage Ring
        { id = 60696 }, --Rubyheart Mallet One-Hand, Mace
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[7] = {
    Title = "¿Por Qué No Ambos?",
    Level = 50,
    Attain = 40,
    Aim = "Consigue el Corazón de Derrumbe de las profundidades de Maraudon, y la Esencia de Corrosis de la Cantera Forjodio para Frig Truenforja en Pico Nidal.",
    Location = "Frig Forjatormenta (Hinterlands - Pico Aerie "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Corrosión está en "..yellow.."[3]"..white..".",
    Prequest = "Demostrando un Punto -> Lo Leí en un Libro Una Vez",
    Folgequest = "Maestría de Forjatinieblas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
for i = 1, 4 do
    kQuestInstanceData.HateforgeQuarry.Horde[i] = kQuestInstanceData.HateforgeQuarry.Alliance[i]
end
kQuestInstanceData.HateforgeQuarry.Horde[5] = {
    Title = "Cazando al Ingeniero Figgles",
    Level = 55,
    Attain = 48,
    Location = "Señora Katalla (Las Estepas Ardientes - Bastión Karfang "..yellow.."89.4,24.5"..white.." esquina noreste de Las Estepas Ardientes).",
    Note = "Mata al Ingeniero Figgles "..yellow.."[2]"..white.." en la Cantera Hateforge para el Huargo de la Señora Katalla.",
    Prequest = "Peculiar No Es Suficiente",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60771 }, --Pyrehand Gloves Hands, Cloth
        { id = 60772 }, --Fur of Navakesh Back
        { id = 60773 }, --Blackrock Authority One-Hand, Mace
        { id = 60774 }, --Girdle of Galron Waist, Mail
    }
}
kQuestInstanceData.HateforgeQuarry.Horde[6] = {
    Title = "De Nuevo y Viejo IV",
    Level = 57,
    Attain = 45,
    Aim = "Adéntrate en la Cantera Hateforge y elimina la presencia del Martillo Crepuscular en su interior para Karfang en el Bastión Karfang.",
    Location = "Karfang (Las Estepas Ardientes - Bastión Karfang "..yellow.."90.1,22.5"..white.." esquina noreste de Las Estepas Ardientes).",
    Note = "Mata al último jefe Har'gesh Clamor del Destino "..yellow.."[5]"..white..".\nLa cadena de misiones comienza en Consejero Vargek (Las Estepas Ardientes - Bastión Karfang "..yellow.."90.0,22.7"..white.." esquina noreste de Las Estepas Ardientes) con la misión 'De Nuevo y Viejo'.",
    Prequest = "De Nuevo y Viejo -> De Nuevo y Viejo II -> De Nuevo y Viejo III",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60734 }, --Blade of the Warleader Main Hand, Sword
        { id = 60735 }, --Obsidian Gem Choker Neck
        { id = 60736 }, --Battlemaster Helm Head, Plate
    }
}

--------------- Stormwind Vault ---------------
kQuestInstanceData.StormwindVault = {
    Story = "La Bóveda de Ventormenta es una mazmorra de instancia ubicada en Ventormenta. Las runas de protección de la Bóveda se están debilitando mientras los horrores en su interior amenazan Azeroth una vez más, debes aventurarte y detener a estos demonios de una vez por todas.",
    Caption = "Cámara de Ventormenta",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwindVault.Alliance[1] = {
    Title = "Recuperando Grilletes de la Bóveda",
    Level = 63,
    Attain = 55,
    Aim = "Dentro de la Cámara de Ventormenta, mata Constructos Rúnicos para obtener 2 Grilletes Rúnicos y entrégaselos a Koli Steamheart.",
    Location = "Koli Corazón de Vapor (Stormwind "..yellow.."54,47"..white..")",
    Note = "Necesitas matar a los enemigos Constructo Rúnico.",
}
kQuestInstanceData.StormwindVault.Alliance[2] = {
    Title = "Terminando con Arc'Tiras",
    Level = 63,
    Attain = 55,
    Aim = "Adéntrate en la Cámara de Ventormenta, encuentra a Arc'tiras y mátalo por el bien de Ventormenta. Cuando lo hayas hecho, regresa con Pepin Ainsworth.",
    Location = "Pepin Ainsworth (Stormwind "..yellow.."54,47"..white..")",
    Note = "Necesitas matar al último jefe.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 60624 }, --Goldplated Royal Crossbow Crossbow
        { id = 60625 }, --Golden Gauntlets of Stormwind Hands, Plate
        { id = 60626 }, --Regal Goldthreaded Sash Waist, Cloth
    }
}
kQuestInstanceData.StormwindVault.Alliance[3] = {
    Title = "El Enemigo Acecha",
    Level = 62,
    Attain = 60,
    Aim = "Lleva el Núcleo de Arc'Tiras de vuelta a Al'Dorel.",
    Location = "Al'Dorel (Cuna del Invierno "..yellow.."56,45"..white..")",
    Note = "Necesitas matar al último jefe.\nLa cadena de misiones comienza con Amatista Encantada que se obtiene del jefe "..yellow.."Torre de Karazhan [2]"..white..".\nRecompensa de la última misión de la cadena.",
    Prequest = "Dormido Bajo la Nieve",
    Folgequest = "Despertó al Amanecer",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 55133 }, --Claw of the Mageweaver Off Hand, Fist Weapon
        { id = 55134 }, --Rod of Permafrost Wand
        { id = 55135 }, --Shard of Leyflow Trinket
    }
}
kQuestInstanceData.StormwindVault.Alliance[4] = {
    Title = "El Tomo de Intrincados Arcanos y Fenómenos Mágicos IX",
    Level = 63,
    Attain = 58,
    Aim = "Recupera el Tomo de Intrincados Arcanos y Fenómenos Mágicos IX para Mazen Mac'Nadir en Ventormenta.",
    Location = "Mazen Mac'Nadir (Stormwind "..yellow.."42,64"..white..")",
    Note = "Cerca de "..yellow.."[3]"..white.." jefe.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60622 }, --Ring of the Academy Ring
    }
}
for i = 1, 3 do
    kQuestInstanceData.StormwindVault.Horde[i] = kQuestInstanceData.StormwindVault.Alliance[i]
end

--------------- Ostarius ---------------
kQuestInstanceData.Ostarius = {
    Story = "",
    Caption = "Ostarius",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Ostarius.Alliance[1] = {
    Title = "Puertas de Uldum",
    Level = 60,
    Attain = 58,
    Aim = "Derrota a Ostarius. Regresa al Salón de los Expedicionarios e informa al Alto Expedicionario Magellas sobre los eventos ocurridos en la puerta.",
    Location = "Pedestal de Uldum (Tanaris "..yellow.."37,81"..white..")",
    Note = "Misión previa de Alto Expedicionario Magellas (Forjaz - Sala de los Exploradores "..yellow.."69.9,18.5"..white.."). Necesitas matar a Ostarius.",
    Prequest = "Asociación Inusual -> Propietario Original -> Puertas de Uldum",
}
kQuestInstanceData.Ostarius.Horde[1] = {
    Title = "Uldum Espera",
    Level = 60,
    Attain = 58,
    Aim = "Derrota a Ostarius. Regresa a Cima del Trueno e informa al Sabio Buscador de la Verdad sobre los eventos ocurridos en la puerta.",
    Location = "Pedestal de Uldum (Tanaris "..yellow.."37,81"..white..")",
    Note = "Misión previa de Sabio Buscaverdad (Cima del Trueno "..yellow.."34,47"..white.."). Necesitas matar a Ostarius.",
    Prequest = "El Lobo Solitario -> Cicatrices del Pasado -> Uldum Aguarda",
}

--------------- Gilneas City ---------------
kQuestInstanceData.GilneasCity = {
    Story = "La Ciudad de Gilneas es una mazmorra de instancia ubicada en Gilneas. Situada en el corazón de esta tierra una vez aislada, la Ciudad de Gilneas fue una vez un bastión de esperanza para su pueblo. Establecida después de liberarse del gobierno de los señores de Arathor, se erigió como un símbolo de resiliencia y prosperidad. Sin embargo, ahora es un mero cascarón de su antigua belleza, con una presencia oscura proyectando una sombra sobre Gilneas y sirviendo como recordatorio de su glorioso pasado. Aullidos distantes resuenan por la ciudad, recordatorios inquietantes de sus nuevos ocupantes. Sin embargo, existe la posibilidad de que no todos se hayan ido y que su rey maldito aún viva.",
    Caption = "Ciudad Gilneas",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.GilneasCity.Alliance[1] = {
    Title = "El Juez y el Fantasma",
    Level = 46,
    Attain = 35,
    Aim = "Mata al Juez Sutherland dentro de la Ciudad de Gilneas para el Fantasma Enfurecido en la Granja Glaymore en Gilneas.",
    Location = "Fantasma Encolerizado (Gilneas -Granja Glaymore "..yellow.."52.9,27.9"..white..")",
    Note = "Puedes encontrar al Fantasma Encolerizado dentro de un edificio en la montaña. Al entrar por las puertas de Gilneas, sigue la montaña a tu izquierda (este), pasando un campo con molinos encontrarás un camino hacia el mar, casi al borde gira al norte sigue el camino (apenas perceptible).",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61620 }, --Glaymore Family Breastplate Chest, Mail
        { id = 61621 }, --Ceremonial Gilnean Pike Polearm
        { id = 61622 }, --Glaymore Shawl Back
    }
}
kQuestInstanceData.GilneasCity.Alliance[2] = {
    Title = "Detrás del Muro",
    Level = 41,
    Attain = 36,
    Aim = "Adéntrate en la Ciudad de Gilneas y recupera los Planos del Alba para Therum Forjahonda en Ventormenta.",
    Location = "Therum Forjahonda <Experto en Herrería> (Ventormenta - Distrito de los Enanos"..yellow.."63.3,37"..white..", puede que esté caminando por ahí)",
    Note = "Los Planos de Piedra del Amanecer en el edificio "..yellow.."[a]"..white.." en la caja.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61348 }, --Inlaid Plate Boots Feet, Plate
        { id = 61349 }, --Dwarven Battle Bludgeon Main Hand, Mace
    }
}
kQuestInstanceData.GilneasCity.Alliance[3] = {
    Title = "La Escritura de Ravenshire",
    Level = 45,
    Attain = 38,
    Aim = "Encuentra la Escritura de Cuerval en la Ciudad de Gilneas y devuélvesela a Caliban Filargenta.",
    Location = "Barón Caliban Línea Plateada (Gilneas - Villa Cuervo (main building) "..yellow.."58.4,67.8"..white..")",
    Note = "La Escritura de Villa Cuervo en la mesa detrás de Regenta Celia Harlow y Regente Mortimer Harlow, junto al Cofre de la Familia Harlow"..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61601 }, --Ebonmere Axe One-Hand, Axe
        { id = 61602 }, --Gilneas Brigade Helmet Head, Plate
        { id = 61603 }, --Robes of Ravenshire Chest, Cloth
        { id = 61604 }, --Greyshire Pauldrons Shoulder, Leather
    }
}
kQuestInstanceData.GilneasCity.Alliance[4] = {
    Title = "La Ambición de Ravencroft",
    Level = 45,
    Attain = 40,
    Aim = "Recupera el Libro de Ur: Volumen Dos de la biblioteca en la Ciudad de Gilneas y devuélveselo a Ethan Ravencroft.",
    Location = "Ethan Cuervocumbre (Gilneas - Cementerio Tejidos Oscuros - Cripta(esquina suroeste de Gilneas, este del río)"..yellow.."33,76"..white..")",
    Note = "El Libro de Ur en el edificio "..yellow.."[b]"..white..", ve a la derecha, en la mesa (lado sur).",
}
kQuestInstanceData.GilneasCity.Alliance[5] = {
    Title = "Deshaciendo la Presencia Dracónica",
    Level = 47,
    Attain = 35,
    Aim = "Termina con la Influencia Dracónica sobre Gilneas matando a la Regente-Lady Celia Harlow y al Regente-Lord Mortimer Harlow para Magus Orelius en Cuerval en Gilneas.",
    Location = "Mago Orelius <Kirin Tor> (Gilneas - Villa Cuervo (main building) "..yellow.."57.7,68.5"..white..")",
    Note = "Trae 1 Fragmento Resplandeciente Grande, necesitarás 1 para la misión previa. Los encantadores los tienen o la casa de subastas puede ayudar. Debería ser barato.",
    Prequest = "Fuente de Arcana -> Presencia Mágica -> ¿Presencia Dracónica?",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61486 }, --Violet Sash Waist, Cloth
        { id = 61487 }, --Gauntlets of Insight Hands, Mail
    }
}
kQuestInstanceData.GilneasCity.Alliance[6] = {
    Title = "La Caída y Ascenso de Cringris",
    Level = 42,
    Attain = 35,
    Aim = "Salva a Genn y recupera la Corona de Cringris para Lord Darius Ravenwood en Cuerval de Gilneas.",
    Location = "Lord Darius Roblebosque (Gilneas - Villa Cuervo (main building) "..yellow.."58.4,67.6"..white..")",
    Note = "La cadena de misiones comienza con la misión 'Lobo entre Ovejas' en Barón Caliban Línea Plateada (Gilneas - Villa Cuervo (edificio principal) "..yellow.."58.4,67.8"..white..")\nLa Corona Cringrís se obtiene de Genn Cringrís "..yellow.."[8]"..white..", último jefe en la cima de la torre.",
    Prequest = "Un Lobo entre Ovejas -> Una Cadena a la Vez -> Tras el Rastro de la Leyenda -> De Vuelta a Ravenshire -> Luz Tenue en la Oscuridad -> El Más Vil de los Hombres -> Un Trato en el Cruce -> Asaltando el Fuerte Freyshear",
    Rewards = {
        Text = "Recompensa: 1 o 2 o 3 y 4",
        { id = 61497 }, --Ravenwood Belt Waist, Mail
        { id = 61498 }, --Signet of Gilneas Ring
        { id = 61499 }, --Ravenshire Gloves Hands, Leather
        { id = 61369 }, --Ravenshire Tabard Tabard
    }
}
kQuestInstanceData.GilneasCity.Alliance[7] = {
    Title = "Manuscrito sobre Hidromancia II",
    Level = 45,
    Attain = 38,
    Aim = "Recupera el Manuscrito sobre Hidromancia II para el Magus Hallister en Theramore en los Pantanos de Dustwallow.",
    Location = "Magus Hallister (Marjal Revolcafango - Theramore, central Tower)",
    Note = red.."(Solo MAGO)"..white.." Misión de teletransporte de mago a Theramore.\nEl Manuscrito sobre Hidromancia II en el edificio "..yellow.."[b]"..white..", ve a la derecha, en el tocador (lado sur).",
    Prequest = "Sigilo Demoníaco de Mannoroc",
    Rewards = {
        Text = "Recompensa: ",
        { id = 92001 }, --Tome of Teleportation: Theramore Spell
    }
}
kQuestInstanceData.GilneasCity.Alliance[8] = {
    Title = "Dejado en Mala Fe",
    Level = 44,
    Attain = 40,
    Aim = "Regresa con el collar del aventurero para Talvash del Kissel en Forjaz.",
    Location = "Talvash del Kissel (Forjaz - El Barrio Místico "..yellow.."36,3"..white..").",
    Note = red.."(Solo Joyero: Orfebre)"..white.." Misión previa de Mayva Togview (Forjaz - Sala de los Exploradores "..yellow.."60,24"..white.."). \nDustivan Capucha Negra "..yellow.."[4]"..white.." suelta la Gargantilla de Citrino Deslustrada",
    Prequest = "Dominando la Orfebrería",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Alliance[9] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Recoge sangre de huargen para Fandral Corzocelada. Necesita muestras de sangre de Karazhan, Ciudad de Gilneas y el Castillo de Colmillo Oscuro.",
    Location = "Archidruida Fandral Corzocelada (Darnassus - Enclave Cenarion "..yellow.."35,9"..white..").",
    Note = "[Sangre de Pelaje Oscuro] se obtiene de Huargen."..white.."\n[Guadaña de la Diosa] la misión previa comienza con La Guadaña de Elune que se obtiene de Lord Bosque Negro II "..yellow.."(Salas Inferiores de Karazhan [5]).",
    Prequest = "Guadaña de la Diosa",
    Folgequest = "Sangre de Vorgendor",
}
kQuestInstanceData.GilneasCity.Alliance[10] = {
    Title = "Pricólico Gnarlmoon",
    Level = 60,
    Attain = 60,
    Aim = "Viaja a la Ciudad de Gilneas y busca el paradero del segundo Pricolich.",
    Location = "Archidruida Vientosueño (Hyjal - Nordanaar "..yellow.."85, 30"..white..")", --61512
    Note = "[Diario de Celia] ubicado cerca de "..yellow.."[7]"..white..".\n[Guadaña de la Diosa] La pre-misión comienza en La Guadaña de Elune, que cae de Lord Bosque Negro II "..yellow.."(Salas Inferiores de Karazhan [5]).",
    Prequest = "Sabiduría de Ur",
    Folgequest = "Pricólico de Gilneas",
}
kQuestInstanceData.GilneasCity.Horde[1] = kQuestInstanceData.GilneasCity.Alliance[1]
kQuestInstanceData.GilneasCity.Horde[2] = {
    Title = "Asuntos de Ebonmere",
    Level = 45,
    Attain = 35,
    Aim = "Mata a Dustivan Cubrenegro y recupera la Escritura de Negropuente para Joshua Negropuente en la Granja Negropuente en Gilneas.",
    Location = "Joshua Estanque de Ébano (Gilneas - Granja Ebonmere "..yellow.."[49.5,31.1]"..white.."). Al entrar por las puertas de Gilneas, sigue la montaña a tu izquierda (este), en el campo con molinos encontrarás a Joshua Estanque de Ébano.",
    Note = "Misiones previas 'Infestación de Murciélagos de Ebonmere' e 'Infestación de Huargen de Ebonmere'.\nDustivan Capucha Negra "..yellow.."[4]"..white.." suelta la Escritura de Ébano",
    Prequest = "Infestación de Murciélagos de Ebonmere -> Infestación de Huargen de Ebonmere",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61627 }, --Ebonmere Reaver One-Hand, Axe
        { id = 61628 }, --Clutch of Joshua Waist, Cloth
        { id = 61629 }, --Farmer's Musket Gun
        { id = 61630 }, --Ebonmere Vambracers Wrist, Plate
    }
}
kQuestInstanceData.GilneasCity.Horde[3] = {
    Title = "Un Robo Real",
    Level = 45,
    Attain = 40,
    Aim = "Roba la pintura de la biblioteca en la Ciudad de Gilneas y regresa con Luke Agamand en el Campamento de Blackthorn en Gilneas.",
    Location = "Luke Agamand (Gilneas - Campamento Espino Negro "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "El retrato de Mia Cringrís en el edificio "..yellow.."[b]"..white..", ve a la izquierda, en la pared (esquina noroeste).",
}
kQuestInstanceData.GilneasCity.Horde[4] = {
    Title = "El Mal Me Hizo Hacerlo",
    Level = 46,
    Attain = 35,
    Aim = "Encuentra 'Sobre los Poderes de la Sangre' en Ciudad de Gilneas, luego regresa con Orvan Ojo Oscuro en las Ruinas de Greyshire en Gilneas.",
    Location = "Orvan Ojoscuro (Gilneas - ruinas de Greyshire "..yellow.."[31.3,47.0]"..white..")",
    Note = red.."La cadena de misiones comienza en Acechadora de la Muerte Alynna (Gilneas Iglesia Stillward "..yellow.."[57.3,39.6]"..white..", dentro) con la misión 'Muerto Hasta el Anochecer'.\nEl libro 'Sobre los Poderes de la Sangre' en la mesa detrás de Regenta Celia Harlow y Regente Mortimer Harlow, junto al Cofre de la Familia Harlow"..yellow.."[7]"..white..".\nRecibirás la recompensa al completar la siguiente misión.",
    Prequest = "Muerto Hasta el Anochecer -> Todo lo que Necesitamos es Sangre -> El Último de los Muertos Vivientes -> Lo Tomamos de los Vivos",
    Folgequest = "Sangre por Sangre",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61422 }, --Pure Bloodvial Pendant Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[5] = {
    Title = "¡Genn Cringris Debe Morir!",
    Level = 49,
    Attain = 40,
    Aim = "Entra en la Ciudad de Gilneas y mata a Genn Greymane, luego lleva su cabeza a Blackthorn en el Campamento de Blackthorn en Gilneas.",
    Location = "Espinonegro (Gilneas - Campamento Espino Negro "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "Se necesitan completar 2 cadenas de misiones para comenzar esta misión 'Informe a Luke Agamand' e 'Informe a Livia Brazofuerte' en Espinonegro.\n",
    Prequest = "'Informe a Luke Agamand' -> Robo en la Mina Secarock -> Informe a Livia Brazofuerte -> Encuentro con el Infiltrado -> Tiempo de Calidad con Blackthorn",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61353 }, --Blackthorn Gauntlets Hands, Leather
        { id = 61354 }, --Banshee's Tear Ring
        { id = 61355 }, --Dark Footpad Belt Waist, Mail
    }
}
kQuestInstanceData.GilneasCity.Horde[6] = {
    Title = "La Piedra de Cringris",
    Level = 47,
    Attain = 38,
    Aim = "Recupera el Fragmento de Medianoche para el Obispo Oscuro Mordren en la Iglesia del Reposo Eterno.",
    Location = "Obispo Oscuro Mordren (Gilneas - Iglesia Stillward "..yellow.."57.7,39.6"..white..")",
    Note = "La cadena de misiones comienza con la misión 'A Través de la Magia Superior' en Obispo Oscuro Mordren.\nFragmento de Medianoche está detrás del último jefe Genn Cringrís "..yellow.."[8]"..white.."\nRecibirás la recompensa al completar la siguiente misión.",
    Prequest = "A Través de la Magia Superior -> El Cetro de Cuervarbol -> Los Poderes Más Allá"..yellow.."[Zahúrda Rajacieno]"..white..".", -- 40993, 40994, 40995",
    Folgequest = "El Regalo del Obispo Oscuro",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[7] = {
    Title = "Conocimiento Extranjero",
    Level = 44,
    Attain = 34,
    Aim = "Busca un libro adecuado en la Ciudad de Gilneas y llévaselo a Jarkal Musgofusión en Kargath en las Tierras Inhóspitas.",
    Location = "Jarkal Musgofusión (Tierras Inhóspitas - Kargath "..yellow.."2,46"..white..").",
    Note = red.."(Solo Joyero: Orfebre)"..white.." Misión previa de Gulmire Torrealta (Entrañas - El Barrio de los Pícaros "..yellow.."77,76"..white.."). \n'Joyería de Gilneas: Un Compendio' (¿dónde?) contiene el objeto.",
    Prequest = "Dominando la Orfebrería",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Horde[8] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Recoge sangre de huargen para Fandral Corzocelada. Necesita muestras de sangre de Karazhan, Ciudad de Gilneas y el Castillo de Colmillo Oscuro.",
    Location = "Magatha Tótem Siniestro (Cima del Trueno - La Cima del Ancestro "..yellow.."70,31"..white..").",
    Note = "[Sangre de Pelaje Oscuro] se obtiene de Huargen."..white.."\n[Guadaña de la Diosa] la misión previa comienza con La Guadaña de Elune que se obtiene de Lord Bosque Negro II "..yellow.."(Salas Inferiores de Karazhan [5]).",
    Prequest = "Guadaña de la Diosa",
    Folgequest = "Sangre de Vorgendor",
}
kQuestInstanceData.GilneasCity.Horde[9] = kQuestInstanceData.GilneasCity[11]

--------------- Lower Karazhan Halls ---------------
kQuestInstanceData.LowerKarazhan = {
    Story = "Las Salas Inferiores de Karazhan es una banda de instancia ubicada en el Paso de Viento Muerto. Karazhan, una vez la imponente fortaleza del antiguo Guardián de Tirisfal, ahora zumba con energía mágica mientras se posa sobre una poderosa línea ley. Sus corredores olvidados durante mucho tiempo, cubiertos de polvo, se han convertido en un refugio para varias criaturas, aunque parece que no todos sus habitantes se han ido voluntariamente. En las profundidades de las salas inferiores, Moroes, el leal castellano de Medivh, permanece como un guardián vigilante. Si logras impresionarlo, puede concederte acceso a los pisos superiores.",
    Caption = "Lower Karazhan Halls",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.LowerKarazhan.Alliance[1] = {
    Title = "Alojamiento Adecuado",
    Level = 60,
    Attain = 55,
    Aim = "Encuentra una Almohada Cómoda para el Concejal Kyleson en Karazhan.",
    Location = "Concejal Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "Puedes encontrar la Almohada Cómoda en "..yellow.."(b)"..white.." en las cajas.",
    Folgequest = "Una Bebida para Dormir",
}
kQuestInstanceData.LowerKarazhan.Alliance[2] = {
    Title = "Una Bebida para Dormir",
    Level = 60,
    Attain = 55,
    Aim = "Habla con alguien que pueda saber cómo adquirir vino para el Concejal Kyleson.",
    Location = "Concejal Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "Entrega la misión a El Cocinero cerca de "..yellow.."[Karazhan - e]"..white..".",
    Prequest = "Alojamiento Adecuado",
    Folgequest = "Vino Espectral",
}
kQuestInstanceData.LowerKarazhan.Alliance[3] = {
    Title = "Vino Espectral",
    Level = 60,
    Attain = 55,
    Aim = "Reúne 3 Esencias de Muerte, 5 Frascos de Oporto y una Seta Fantasma para El Cocinero en Karazhan.",
    Location = "El Cocinero near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Frasco de Oporto vendido por vendedores de alcohol. Todos los objetos se pueden comprar en la Casa de Subastas.",
    Prequest = "Una Bebida para Dormir",
    Folgequest = "Vino para Kyleson",
}
kQuestInstanceData.LowerKarazhan.Alliance[4] = {
    Title = "Vino para Kyleson",
    Level = 60,
    Attain = 55,
    Location = "El Cocinero near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Entrega el Vino Espectral a Concejal Kyleson "..yellow.."[Karazhan - c]"..white.." en Karazhan.",
    Prequest = "Vino Espectral",
}
kQuestInstanceData.LowerKarazhan.Alliance[5] = {
    Title = "La Llave de Karazhan I",
    Level = 60,
    Attain = 58,
    Aim = "Escucha la historia de Lord Cerranegra.",
    Location = "Lord Ebonlocke ("..yellow.."[Karazhan - d]"..white..")",
    Folgequest = "La Llave de Karazhan II",
}
kQuestInstanceData.LowerKarazhan.Alliance[6] = {
    Title = "La Llave de Karazhan II",
    Level = 60,
    Attain = 58,
    Location = "Lord Ebonlocke ("..yellow.."[Karazhan - d]"..white..")",
    Note = "Mata a Moroes "..yellow.."[6]"..white.." y recupera la Llave de las Cámaras Superiores. Moroes reside en las Salas Inferiores de Karazhan. Lleva la llave de vuelta a Lord Ebonlocke.",
    Prequest = "La Llave de Karazhan I",
    Folgequest = "La Llave de Karazhan III",
}
kQuestInstanceData.LowerKarazhan.Alliance[7] = {
    Title = "La Llave de Karazhan III",
    Level = 60,
    Attain = 58,
    Aim = "Encuentra a alguien del Kirin Tor que pueda saber algo sobre Vandol. Dalaran podría ser un buen lugar para comenzar tu búsqueda.",
    Location = "El Cocinero near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Entrega la misión a Archimago Ansirem Tejerruna <Kirin Tor> (Montañas de Alterac - Dalaran "..yellow.."[18.9,78.5]"..white..")",
    Prequest = "La Llave de Karazhan II",
    Folgequest = "La Llave de Karazhan IV",
}
kQuestInstanceData.LowerKarazhan.Alliance[8] = {
    Title = "Notas de Cocina Garabateadas",
    Level = 60,
    Attain = 55,
    Aim = "Encuentra a alguien que pueda saber algo sobre las Notas de Cocina Garabateadas.",
    Location = "Notas de Cocina Garabateadas",
    Note = "Entrega la misión a Duque Rothlen "..yellow.."[Karazhan - f]"..white.." en el balcón junto a Señor de las Garras Colmilloullador "..yellow.."[4]"..white..".",
    Folgequest = "Perdido y Encontrado",
}
kQuestInstanceData.LowerKarazhan.Alliance[9] = {
    Title = "Perdido y Encontrado",
    Level = 60,
    Attain = 55,
    Aim = "Recupera el Brazalete de Oro Grabado para el Duque Rothlen en Karazhan.",
    Location = "Duque Rothlen "..yellow.."[Karazhan - f]"..white..".",
    Note = "Puedes encontrar el 'Brazalete Dorado Grabado' en el cofre en "..yellow.."[Karazhan - a]"..white..".",
    Prequest = "Notas de Cocina Garabateadas",
    Folgequest = "Broche de la Familia Rothlen",
}
kQuestInstanceData.LowerKarazhan.Alliance[10] = {
    Title = "Broche de la Familia Rothlen",
    Level = 60,
    Attain = 55,
    Aim = "Recupera el Broche de la Familia Rothlen de Stratholme para el Duque Rothlen en Karazhan.",
    Location = "Duque Rothlen (Karazhan "..yellow.."[Karazhan - f]"..white..")",
    Note = "Broche de la Familia Rothlen junto al jefe de "..yellow.."[Stratholme]"..white.." El Imperdonable "..yellow.."[4]"..white.." en el cofre.",
    Prequest = "Perdido y Encontrado",
    Folgequest = "La Receta Secreta",
}
kQuestInstanceData.LowerKarazhan.Alliance[11] = {
    Title = "La Receta Secreta",
    Level = 60,
    Attain = 55,
    Location = "Duque Rothlen (Karazhan "..yellow.."[Karazhan - f]"..white..")",
    Note = "Habla con 'El Cocinero' "..yellow.."[cerca de e]"..white.." en las Salas Inferiores de Karazhan.",
    Prequest = "Broche de la Familia Rothlen",
    Folgequest = "El Portero de Karazhan",
}
kQuestInstanceData.LowerKarazhan.Alliance[12] = {
    Title = "El Portero de Karazhan",
    Level = 60,
    Attain = 55,
    Aim = "Habla con el Portero Montigue en Karazhan.",
    Location = "El Cocinero near ("..yellow.."[Lower Karazhan Halls- e]"..white..")",
    Note = "Portero Montigue"..blue.." "..white.."al comienzo de la mazmorra frente a las escaleras.",
    Prequest = "La Receta Secreta",
    Folgequest = "Carga de Karazhan",
}
kQuestInstanceData.LowerKarazhan.Alliance[13] = {
    Title = "Carga de Karazhan",
    Level = 60,
    Attain = 55,
    Aim = "Lleva 10 Esencias de No-Muerto, 10 Esencias Vivas y 25 de Oro a Doorman Montique en Karazhan.",
    Location = "Portero Montigue"..blue.." "..white.."al comienzo de la mazmorra frente a las escaleras.",
    Note = "Todo se puede comprar en la Casa de Subastas. Vida 10-15 plata cada uno, no-muertos - 1-3 oro cada uno.",
    Prequest = "El Portero de Karazhan",
    Folgequest = "Le Fishe Au Chocolat",
}
kQuestInstanceData.LowerKarazhan.Alliance[14] = {
    Title = "Le Fishe Au Chocolat",
    Level = 60,
    Attain = 55,
    Location = "Portero Montigue"..blue.." "..white.."al comienzo de la mazmorra frente a las escaleras.",
    Note = "Lleva la Carga de Karazhan a El Cocinero cerca de"..yellow.."[e]"..white.." en las Salas Inferiores de Karazhan.",
    Prequest = "Carga de Karazhan",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61666 }, --Recipe: Le Fishe Au Chocolat Pattern
        { id = 84040 }, --Le Fishe Au Chocolat Pattern
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[15] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Mata a Clawlord Howlfang e informa a Lord Cerro Negro.",
    Location = "La Guadaña de Elune "..yellow.."[5]"..white..".",
    Note = red.."Solo Mago, Sacerdote, Brujo, Druida"..white..":\nLa cadena de misiones comienza con el objeto legendario 'La Guadaña de Elune' que se obtiene de Lord Bosquenegro II "..yellow.."[5]"..white.." (probabilidad baja).\nCadena de misiones para abalorio legendario.",
    Folgequest = "Guadaña de la Diosa",
}
kQuestInstanceData.LowerKarazhan.Alliance[16] = {
    Title = "Contribución a la Iglesia",
    Level = 60,
    Attain = 55,
    Aim = "Reúne 15 Esencia Arcana, 20 Polvo de Ilusión y 10 Esencias Eternas Superiores para el Hierofante Nerseus en la iglesia fuera de Karazhan.",
    Location = "Hierofante Nerseus (Paso de Viento Muerto, frente a la iglesia junto a Karazhan "..yellow.."[40.3,77.2]"..white..").",
    Note = "15x Esencia Arcana - botín aleatorio de enemigos;\n20x Polvo de Ilusión - Encantadores o Casa de Subastas;\n10x Esencia Eterna Mayor - Encantadores o Casa de Subastas;\nDespués de completar esta misión podrás obtener misiones para encantamientos de cabeza/piernas. Para cada uno necesitarás:\n 1x Energía de Línea Ley Sobrecargada - objeto raro aleatorio de enemigos/jefe en Karazhan;\n6x Esencia Arcana - botín aleatorio de enemigos.",
    Folgequest = "Invocación de Fragmentación, Invocación de Mayor Protección, Invocación de Mente Expansiva, Invocación de Mayor Fortificación Arcana",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 92005 }, --Invocation of Shattering Enchant
        { id = 92006 }, --Invocation of Greater Protection Enchant
        { id = 92007 }, --Invocation of Expansive Mind Enchant
        { id = 92008 }, --Invocation of Greater Arcane Fortitude Enchant
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[17] = {
    Title = "Vela Cómicamente Grande",
    Level = 61,
    Attain = 60,
    Aim = "Recupera la Vela Cómicamente Grande de Grizikil y llévasela a Bigotes Grandes en Karazhan Superior.",
    Location = "Portero Montigue"..blue.." "..white.."al comienzo de la mazmorra frente a las escaleras.",
    Note = red.."Solo mago"..white..": Grizikil "..yellow.."[3]"..white.." suelta 'Vela Cómica Gigante'.\nLa cadena de misiones comienza en Grandes Bigotes en "..yellow.."[Torre de Karazhan]"..white..".",
    Prequest = "No Soy una Rata",
    Rewards = {
        Text = "Recompensa: ",
        { id = 92025 }, --Tome of Polymorph: Rodent Spell
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[18] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Recoge sangre de huargen para Fandral Corzocelada. Necesita muestras de sangre de Karazhan, Ciudad de Gilneas y el Castillo de Colmillo Oscuro.",
    Location = "Archidruida Fandral Corzocelada (Darnassus - Enclave Cenarion "..yellow.."35,9"..white..").",
    Note = "[Sangre de Azote de Sombras] se obtiene de Huargen."..white.."\n[Guadaña de la Diosa] la misión previa comienza con La Guadaña de Elune que se obtiene de Lord Bosque Negro II "..yellow.."(Salas Inferiores de Karazhan [5]).",
    Prequest = "Guadaña de la Diosa",
    Folgequest = "Sangre de Vorgendor",
}
for i = 1, 17 do
    if i ~= 7 then
        kQuestInstanceData.LowerKarazhan.Horde[i] = kQuestInstanceData.LowerKarazhan.Alliance[i]
    end
end
-- fix for horde quests
kQuestInstanceData.LowerKarazhan.Horde[7] = createInheritedQuest(
    kQuestInstanceData.LowerKarazhan.Alliance[7],
    {
        Aim = "Recoge sangre de huargen para Fandral Corzocelada. Necesita muestras de sangre de Karazhan, Ciudad de Gilneas y el Castillo de Colmillo Oscuro.",
        Note = "Entrega la misión a Bethor Duroyelo (Entrañas - El Barrio Mágico"..yellow.."[84.1,17.5]"..white..", zona de entrenador de magos.)",
    }
)
kQuestInstanceData.LowerKarazhan.Horde[18] = createInheritedQuest(
    kQuestInstanceData.LowerKarazhan.Alliance[18],
    {
        Title = "Guadaña de la Diosa",
        Aim = "Recoge sangre de huargen para Fandral Corzocelada. Necesita muestras de sangre de Karazhan, Ciudad de Gilneas y el Castillo de Colmillo Oscuro.",
        Location = "Magatha Tótem Siniestro (Cima del Trueno - La Cima del Ancestro "..yellow.."70,31"..white..").",
    }
)

--------------- Emerald Sanctum ---------------
kQuestInstanceData.EmeraldSanctum = {
    Story = "El Santuario Esmeralda es una banda de instancia ubicada en Hyjal. Una niebla de corrupción ha descendido sobre el Sueño Esmeralda, retorciendo la moral y las intenciones incluso de los más nobles y puros. El Despertador corrupto se está preparando para enviar un llamado de despertar prematuro; si no se detiene, sus hermanos se levantarán y desatarán un frenesí de destrucción por Azeroth.",
    Caption = "Sanctum Esmeralda",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.EmeraldSanctum.Alliance[1] = {
    Title = "Esencia Onírica Humeante",
    Level = 60,
    Attain = 55,
    Aim = "Lleva la Esencia de Sueño Humeante al Archidruida Dreamwind en Nordanaar en Hyjal.",
    Location = "Esencia de Sueño Abrasador [2]",
    Note = red.."Solo druida"..white..": Archidruida Vientosueño está en (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Solo una persona en la banda puede saquear este objeto y la misión solo se puede hacer una vez.\n\nLas recompensas listadas son para la misión siguiente.",
    Folgequest = "Esencia Onírica Purificada",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61445 }, --Purified Emerald Essence Pattern
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[2] = {
    Title = "Cabeza de Solnius",
    Level = 60,
    Attain = 58,
    Aim = "Lleva la Cabeza de Solnius a Ralathius en Nordanaar en Hyjal.",
    Location = "Cabeza de Solnius [2]",
    Note = "Ralathius está en (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Solo una persona en la banda puede saquear este objeto y la misión solo se puede hacer una vez.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61195 }, --Ring of Nordrassil Ring
        { id = 61194 }, --The Heart of Dreams Neck
        { id = 61193 }, --Verdant Eye Necklace Trinket
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[3] = {
    Title = "La Garra de Erennius",
    Level = 60,
    Attain = 55,
    Aim = "Lleva la Garra de Erennius a alguien que pueda encontrarla útil.",
    Location = "Garra de Erennius [1]",
    Note = "Ralathius está en (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Solo una persona en la banda puede saquear este objeto y la misión solo se puede hacer una vez.",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 61650 }, --Jadestone Skewer Polearm
        { id = 61651 }, --Jadestone Mallet Main Hand, Mace
        { id = 61740 }, --Claw of Senthos Main Hand, Fist Weapon
    }
}
for i = 1, 3 do
    kQuestInstanceData.EmeraldSanctum.Horde[i] = kQuestInstanceData.EmeraldSanctum.Alliance[i]
end

--------------- Tower of Karazhan ---------------
kQuestInstanceData.TowerofKarazhan = {
    Story = "La Torre de Karazhan es una banda de instancia ubicada en el Paso de Viento Muerto. Karazhan, una vez la imponente fortaleza del antiguo Guardián de Tirisfal, ahora zumba con energía mágica mientras se posa sobre una poderosa línea ley. Sus corredores olvidados durante mucho tiempo, cubiertos de polvo, se han convertido en un refugio para varias criaturas, aunque parece que no todos sus habitantes se han ido voluntariamente.",
    Caption = "Torre de Karazhan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TowerofKarazhan.Alliance[1] = {
    Title = "Reminiscencia de Acero",
    Level = 60,
    Attain = 60,
    Aim = "Para restaurar el Cetro de Medivh, Anelace la Clarividente en la Parcela de Morgan en el Paso de la Muerte necesita una gran cantidad de energía arcana.",
    Location = "Anelace la Clarividente (Paso de la Muerte - Tumba de Morgan "..yellow.."41.2,79.2"..white..")",
    Note = "Vara de Obsidiana "..yellow.."Salas Inferiores de Karazhan [e]."..white.." Residuo Cósmico se obtiene de "..yellow.."[3]."..white.."\nLa misión previa La Vinculación de Xanthar comienza en Hanvar el Justo (Paso de Viento Muerto - Tumba de Morgan "..yellow.."40.9, 79.3"..white.."), la misión previa Vino para Kyleson comienza en El Cocinero "..yellow.."(Salas Inferiores de Karazhan [e])",
    Prequest = "Vino para Kyleson, La Vinculación de Xanthar",
    Folgequest = "El Cetro de Medivh",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41413 }, --Scepter Rod of Medivh Quest Item
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[2] = {
    Title = "El Cetro de Medivh",
    Level = 60,
    Attain = 60,
    Aim = "Un fragmento de Medivh es necesario para imbuir el Cetro de Medivh. Llévalo a Anelace la Clarividente en la Parcela de Morgan fuera de Karazhan.",
    Location = "Anelace la Clarividente (Paso de la Muerte - Tumba de Morgan "..yellow.."41.2,79.2"..white..")",
    Note = "Se obtiene del "..yellow.."Eco de Medivh [4]."..white.."\nDiario de Khadgar [?] inicia esta cadena de misiones.\nRecompensa de la última misión de la cadena.\nSanv K'la (Pantano de las Penas "..yellow.."25, 30"..white..") inicia la cadena de misiones El Abalorio de Sanv.",
    Prequest = "Garras de Thanlar -> Restauración",
    Folgequest = "El Amuleto Sanv -> Un Favor Pedido -> El Vestigio de Tirisfal -> El Cetro de Medivh de Otro Mundo",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41415, desc = "Open Portal" }, --The Scepter of Medivh Quest Item
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[3] = {
    Title = "No Soy una Rata",
    Level = 61,
    Attain = 60,
    Aim = "Habla con el Portero Montigue en los Pasillos Inferiores de Karazhan.",
    Location = "Grandes Bigotes (Torre de Karazhan "..yellow.."0, 0"..white..")",
    Note = red.."Solo mago"..white..": Portero Montigue en las Salas Inferiores de Karazhan al comienzo de la mazmorra frente a las escaleras.",
    Folgequest = "Vela Cómicamente Grande",
}
kQuestInstanceData.TowerofKarazhan.Alliance[4] = {
    Title = "Un Camino Abierto",
    Level = 60,
    Attain = 60,
    Aim = "Encuentra al Cocinero en las Salas Inferiores de Karazhan.",
    Location = "Recetas de Kezan (Torre de Karazhan "..yellow.."cerca de [1]"..white..")",
    Note = "El Cocinero cerca de ("..yellow.."[Salas Inferiores de Karazhan - e]"..white..".\nUna misión para obtener una receta de cocina.",
    Folgequest = "La Majestad de un Chef",
}
kQuestInstanceData.TowerofKarazhan.Alliance[5] = {
    Title = "Fría es la Noche",
    Level = 62,
    Attain = 60,
    Aim = "Investiga los misterios de la Amatista Encantada.",
    Location = "Amatista Encantada (Torre de Karazhan drop "..yellow.."[2] "..white.."boss)",
    Note = "Quest line continues at Cámara de Ventormenta as "..yellow.."[El Enemigo Acecha]"..white.." quest.",
    Folgequest = "Abrazado por la Luna",
}
kQuestInstanceData.TowerofKarazhan.Alliance[6] = {
    Title = "No Hay Honor Entre Chefs",
    Level = 61,
    Attain = 60,
    Aim = "Viaja a La Masacre y busca al Conservador de conocimientos Lydros.",
    Location = "De Antiguos y Ents (Torre de Karazhan "..yellow.."near [] "..white..")",
    Note = red.."Solo druida"..white..": Tradicionalista Lydros (La Masacre - Oeste o Norte "..yellow.."[1] Biblioteca"..white..")\nCadena de misiones para [Glifo del Antárbol Arcano] en La Masacre Este.",
    Folgequest = "Un Estudio de Árboles Mágicos",
}
kQuestInstanceData.TowerofKarazhan.Alliance[7] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Mata a Clawlord Howlfang e informa a Lord Cerro Negro.",
    Location = "Archidruida Vientosueño (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "Vorgendor: Mitos de la Dimensión de Sangre (cerca de la Entrada) contiene el objeto de misión.\n"..white.."[Guadaña de la Diosa] la misión previa comienza con La Guadaña de Elune que se obtiene de Lord Bosque Negro II "..yellow.."(Salas Inferiores de Karazhan [5]).",
    Prequest = "Guadaña de la Diosa",
    Folgequest = "Guadaña de la Diosa",
}
kQuestInstanceData.TowerofKarazhan.Alliance[8] = {
    Title = "Sabiduría de Ur",
    Level = 60,
    Attain = 60,
    Aim = "Mata al Guardián Dienteluna. Puede encontrarse en las Cámaras Superiores de Karazhan.",
    Location = "Archidruida Vientosueño (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "Necesitas matar a "..yellow.."Guardián Gnarlmoon [1].\n"..white.."[Guadaña de la Diosa] la misión previa comienza con La Guadaña de Elune que se obtiene de Lord Bosque Negro II "..yellow.."(Salas Inferiores de Karazhan [5]).",
    Prequest = "Guadaña de la Diosa -> Sangre de Lobo",
    Folgequest = "Pricólico Gnarlmoon",
}
kQuestInstanceData.TowerofKarazhan.Alliance[9] = {
    Title = "Guadaña de la Diosa",
    Level = 60,
    Attain = 60,
    Aim = "Mata a Clawlord Howlfang e informa a Lord Cerro Negro.",
    Location = "Archidruida Vientosueño (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "[Alma de un Señor del Terror] se obtiene de "..yellow.."Mephistroth [8].\n"..white.."[Guadaña de la Diosa] la misión previa comienza con La Guadaña de Elune que se obtiene de Lord Bosque Negro II "..yellow.."(Salas Inferiores de Karazhan [5]).\n"..white.."Tela Lunar de Sastrería, Fragmento de Piedra de Sueño Eterno de Encantamiento.",
    Prequest = "Guadaña de la Diosa -> Pricólico de Gilneas",
    Folgequest = "El Poder de la Diosa",
    Rewards = {
        Text = "Recompensa: ",
        { id = 55505 }, --The Scythe of Elune Trinket
    }
}
for i = 1, 9 do
    kQuestInstanceData.TowerofKarazhan.Horde[i] = kQuestInstanceData.TowerofKarazhan.Alliance[i]
end

--------------- Dragonmaw Retreat ---------------
kQuestInstanceData.DragonmawRetreat = {
    Story = "Retiro Faucedraco es una mazmorra de instancia ubicada en los Humedales. Fragmentos de una civilización enana más antigua pero desconocida, estas cavernas fueron usadas como parte de las redes mineras de Grim Batol. Desde su segundo abandono, los Faucedraco han tallado esta red olvidada en una base de operaciones. Ahora en posesión de un fragmento del Alma de Demonio, no se detendrán ante nada para recuperar los Humedales y las Tierras Sombrías con la ayuda de su ejército de dragones rojos sometidos.",
    Caption = "Retiro Faucedraco",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DragonmawRetreat.Alliance[1] = {
    Title = "Pedestal de la Unidad",
    Level = 30,
    Attain = 25,
    Aim = "El Pedestal de la Unidad permanece intacto y libre de daños graves.",
    Location = "Pedestal de la Unidad (Retiro Faucedraco "..yellow.."35,93"..white..")",
    Note = "Pedestal cerca de "..yellow.."[5]"..white.."\n'Fragmento de Algoron' se obtiene de "..yellow.."[3]"..white.."\n'Fragmento de Dathronag' se encuentra en 'Cofre de Dathronag' "..yellow.."[a]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41876, desc = "Llave" }, --Lower Reserve Key
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[2] = {
    Title = "Derrota de Colmillomiedo",
    Level = 28,
    Attain = 20,
    Aim = "Venga a los gnolls Mosshide matando a su antiguo líder Gowlfang en el Reposo Faucedraco. Regresa con Grimbite en su campamento en El Cinturón Verde en Los Humedales después.",
    Location = "Grimbit (Los Humedales - El Cinturón Verde "..yellow.."55,35"..white..")",
    Note = "'Cabeza de Colmillo de Lobo' se obtiene de 'Colmillo de Lobo' "..yellow.."[1]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41830 }, --Mosshide Ring
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[3] = {
    Title = "Recuperación de Gólems de Piedra",
    Level = 28,
    Attain = 22,
    Aim = "Consigue la piedra rúnica de un Gólem de Piedra Desmoronado dentro del Refugio Faucedraco y llévasela a Kixxle en el camino principal de Los Humedales.",
    Location = "Kixxle (Los Humedales - El Cinturón Verde "..yellow.."50,38"..white..")",
    Note = "Piedra Rúnica del Gólem de Piedra se obtiene del Gólem de Piedra Derrumbado cerca de "..yellow.."[6]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41826 }, --Mosshide Cinch
        { id = 41827 }, --Fenwater Gloves
        { id = 41828 }, --Mosschain Bracers
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[4] = {
    Title = "La Camada Faucedraco",
    Level = 34,
    Attain = 24,
    Aim = "Nydiszanz en las Puertas Faucedraco en Los Humedales desea liberar a su hermano Searistrasz de su captura por los orcos Faucedraco en el Reposo Faucedraco.",
    Location = "Nydiszanz (Los Humedales - Puertas de Garganta de Dragón "..yellow.."74,48"..white..")",
    Note = "Crías de dragón y Searistrasz "..yellow.."[8]",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 41831 }, --Runebound Dagger
        { id = 41832 }, --Flameweave Sash
        { id = 41833 }, --Cuffs of Burning Rage
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[5] = {
    Title = "Yugo de la Reina Dragón",
    Level = 30,
    Attain = 24,
    Aim = "Procure no Pântano por um dragão vermelho disposto a ouvir você.",
    Location = "Fragmento del alma demoníaca (Retiro Faucedraco - "..yellow.."[10]"..white..")",
    Note = "Se obtiene de Zuluhed el Enloquecido "..yellow.."[10]",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 58234 }, --Pendant of Ember Blood
        { id = 58235 }, --"Pendant of Ember Blessing
        { id = 58236 }, --Pendant of Ember Hatred
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[6] = {
    Title = "Carta de Korlag Canciónfatal",
    Level = 35,
    Attain = 30,
    Aim = "Lleva la carta a alguien de alta autoridad en Los Territorios Sombríos.",
    Location = "Carta de Korlag Cantofunesto (Retiro Faucedraco - Zuluhed el Apaleado "..yellow.."[10]"..white..")",
    Note = "Entrega a 'Magistrado Hurdam Manodura' en 'Tierras Sombrías' "..yellow.."51, 58"..white.."\nRecibirás la recompensa al completar la siguiente misión.\nNecesitas matar al 'Comandante Korlag Doomsong' en Grim Reaches – Bastión Zarm'Geth. "..yellow.."56, 11",
    Folgequest = "Destrucción de los Faucedraco",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 41713 }, -- Doomsong Cuffs
        { id = 41714 }, -- Sash of Zarm'geth
        { id = 41715 }, -- Legging's of Geth'kar
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[7] = {
    Title = "Aplastar a los Faucedraco",
    Level = 29,
    Attain = 21,
    Aim = "Mata a veteranos Faucedraco en el Reposo Faucedraco y regresa con el Capitán Puño Fuerte en el Puerto de Menethil.",
    Location = "Capitán Puñorrecio (Los Humedales - Puerto Menethil - "..yellow.."10, 58"..white..")",
    Note = "'Veterano de Faucedraco' cerca de "..yellow.."[4, 6 y 8]",
}
kQuestInstanceData.DragonmawRetreat.Alliance[8] = {
    Title = "La Caída de Corazónoscuro",
    Level = 31,
    Attain = 23,
    Aim = "Llévale la cabeza del Señor de la Guerra Negrazón al Capitán Puño Fuerte en el Puerto de Menethil.",
    Location = "Capitán Puñorrecio (Los Humedales - Puerto Menethil - "..yellow.."10, 58"..white..")",
    Note = "'Cabeza de Corazón Negro' se obtiene del 'Señor Supremo Corazón Negro' "..yellow.."[7]",
    Prequest = "Derrota a Nek'rosh",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 41842 }, --Menethil Greaves
        { id = 41843 }, --Stoutheart Shawl
        { id = 41844 }, --Torwyll's Cuffs
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[9] = {
    Title = "La Mentira de los Bandidos Rojo",
    Level = 28,
    Attain = 22,
    Aim = "Lleva la Tablilla Brandirroja a uno de los historiadores en La Biblioteca de Forjaz.",
    Location = "Tableta Redbrand (Retiro Faucedraco "..yellow.."34,93"..white..")",
    Note = "Recibirás la recompensa al completar la siguiente misión.\nTableta cerca de "..yellow.."[5]",
    Folgequest = "La Mentira de los Bandidos Rojo",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 41838 }, --Gravelweave Pantaloons
        { id = 41839 }, --Defender of Dorgal
        { id = 41840 }, --Gemlaced Sash
    }
}
for i = 1, 5 do
    kQuestInstanceData.DragonmawRetreat.Horde[i] = kQuestInstanceData.DragonmawRetreat.Alliance[i]
end
kQuestInstanceData.DragonmawRetreat.Horde[6] = createInheritedQuest(
    kQuestInstanceData.DragonmawRetreat.Alliance[6],
    {
        Note = "Entrega a 'Comandante Aggnash' en Tierras Sombrías - Puesto Hojafilo - "..yellow.."60, 30"..white.."\nRecibirás la recompensa al completar la siguiente misión.\nNecesitas matar al 'Comandante Korlag Doomsong' en Grim Reaches – Bastión Zarm'Geth. "..yellow.."56, 11"
    }
)
kQuestInstanceData.DragonmawRetreat.Horde[7] = {
    Title = "Extracto de Telaraña Cavernosa",
    Level = 27,
    Attain = 21,
    Aim = "Mata a la Madre de la Camada Cavernícola en el Reposo Faucedraco y entrega su saco de veneno a Okal en Quijaforte.",
    Location = "Okul (Tierras Altas de Arathi - Caída de Martillo "..yellow.."74, 34"..white..")",
    Note = "'Saco de la Madre de los Brotes' se obtiene de 'Madre Criadora Tejecaverna' "..yellow.."[2]",
}
kQuestInstanceData.DragonmawRetreat.Horde[8] = {
    Title = "Un Fuego Inagotable",
    Level = 30,
    Attain = 24,
    Aim = "Recupera la Llama Eterna de dentro del Reposo Faucedraco y llévasela a Shara Blazen en Molino Tarren.",
    Location = "Shara Blazen (Laderas de Trabalomas - Molino Tarren "..yellow.."64, 21"..white..")",
    Note = "'Llama Eterna' contiene cerca de "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41836 }, --Ancient Flame Pendant
    }
}

--------------- Stormwrought Ruins ---------------
kQuestInstanceData.StormwroughtRuins = {
    Story = "Ruinas Forjadas por la Tormenta es una mazmorra de instancia ubicada en Balor, dentro de las ruinas del Castillo Forjado por la Tormenta. Una fortaleza inexpugnable, una vez hogar del Duque Balor y sede de poder, el Castillo Forjado por la Tormenta yace abandonado sobre los acantilados azotados por las olas de Balor. Tomado durante la Primera Guerra, todos sus habitantes fueron masacrados brutalmente, y los menos afortunados fueron capturados para ser usados en rituales atroces. Años después, esta ruina abandonada ha sido reclamada nuevamente, por el clan orco Rompecielos y sus siniestros señores del Consejo de las Sombras. Los salones ya no prístinos del castillo albergan una colección de horrores y depravación, con fantasmas persistentes, demonios corpulentos y cultistas murmurantes acechando por los pasillos negros como la brea de este horrible lugar.",
    Caption = "Ruinas Forjatormenta",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwroughtRuins.Alliance[1] = {
    Title = "El Difunto Duque Balor",
    Level = 34,
    Attain = 28,
    Aim = "Devuelve la Corona de Balor a Olmir Cuernomedio.",
    Location = "Olmir Medio Cuerno (Balor "..yellow.."30, 51"..white..")",
    Note = "'Corona de Balor' se obtiene del 'Duque Balor IV' "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 58261 }, --Drinking Halfhorn
        { id = 58262 }, --Enchanted Glass Kopis
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[2] = {
    Title = "Calavera y Huesos",
    Level = 34,
    Attain = 28,
    Aim = "Entra en el Castillo Forjatormenta y recupera el Anillo de Sello de Balor para Lord Olivert Grahan en su mansión en el oeste de Balor.",
    Location = "Lord Olivert Grahan (Balor "..yellow.."36, 66"..white..")",
    Note = "'Anillo del Sigilo de Balor' se obtiene del 'Duque Balor IV' "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 58073 }, --Grahan Family Seal
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[3] = {
    Title = "Los Muertos No Pueden Quejarse",
    Level = 34,
    Attain = 28,
    Aim = "Rikki Fizmask quiere que saqueen las Ruinas Forjatormenta en Balor y regresen con ella en los restos del Alabarda del Gaviota.",
    Location = "Rikki Mascarilla (Balor "..yellow.."29, 11"..white..")",
    Note = "'Tesoro Baloriano' se obtiene de 'Huéspedes Translúcidos y Nobles Atados' cerca de "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 58281 }, --Trusty Goblin Shiv
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[4] = {
    Title = "La Voluntad de Balor",
    Level = 38,
    Attain = 32,
    Aim = "Mata a la súcubo que retiene el alma de Arthur y devuélvesela en la sala del trono del Castillo Forjatormenta.",
    Location = "Arthur Vandris (Ruinas Forjatormenta "..yellow.."near [4]"..white..")",
    Note = "'Fragmento del Alma de Arthur' se obtiene de 'Lady Drazare' "..yellow.."[10]",
}
kQuestInstanceData.StormwroughtRuins.Alliance[5] = {
    Title = "Antigüedades",
    Level = 35,
    Attain = 29,
    Aim = "Recupera el 'Compendio de Comercio Exitoso' dentro del Castillo Forjatormenta para Noppsy Spickerspan en el puesto avanzado Si:7 en Balor.",
    Location = "Noppsy Tramazona (Balor - Avanzada IV:7 "..yellow.."70, 77"..white..")",
    Note = "'Compendio del Comercio Exitoso' se obtiene del 'Bibliotecario Theodorus' "..yellow.."[3]",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 58279 }, --Antiquated Slasher
        { id = 58280 }, --Chainmail of Many Pockets
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[6] = {
    Title = "Asesino en Entrenamiento",
    Level = 35,
    Attain = 29,
    Aim = "Reduce la cadena de mando dentro de las Ruinas Forjatormenta y regresa con Nippsy Spickerspan en el puesto avanzado Si:7 en Balor.",
    Location = "Nippsy Tramazona (Balor - Avanzada IV:7 "..yellow.."70, 78"..white..")",
    Note = "'Oronok Corazón Roto' "..yellow.."[1]"..white.."\n'Jefe Tormentanción' "..yellow.."[5]"..white.."\n'Maestros de batalla Forjatormenta' cerca de "..yellow.."[5]",
    Prequest = "Evaluar la Situación -> Noppsy Spickerspan -> Noticias Angustiosas -> Hacia el Nido de Avispas",
}
kQuestInstanceData.StormwroughtRuins.Alliance[7] = {
    Title = "Corazón de la Oscuridad",
    Level = 38,
    Attain = 21,
    Aim = "Detén al Consejo de las Sombras en las Ruinas Forjatormenta.",
    Location = "Verona Gillian (Balor - Avanzada IV:7 "..yellow.."70, 77"..white..")",
    Note = "'Ighal'for y Mergothid' "..yellow.."[11]",
    Prequest = "Evaluar la Situación -> Noppsy Spickerspan -> Noticias Angustiosas -> Hacia el Nido de Avispas",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 58080 }, --Rufus' Trusty Tankard
        { id = 58081 }, --Kinrial's Scalpel
        { id = 58082 }, --Noppsy's Compendium
        { id = 58083 }, --Nippsy's Precision Rifle
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[8] = {
    Title = "Impresión Cristalina",
    Level = 38,
    Attain = 34,
    Aim = "Encuentra un Cristal Forjatormenta para Grukson Barba Pizarra en la forja Barba Pizarra.",
    Location = "Grukson Barbalaja (Territorios Sombríos - El Abismo Sombrío "..yellow.."56, 70"..white..")",
    Note = "'Cristal Forjatormenta' contiene cerca de "..yellow.."[9]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41980 }, --Slatebeard Amulet
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[9] = {
    Title = "Todo Lo Que Queda",
    Level = 38,
    Attain = 32,
    Aim = "Lleva la espada de juguete de madera a alguien que conociera a su dueño. Puedes tener suerte en Viento Norte, donde todo comenzó.",
    Location = "Espada de Juguete Grabada (Restos del Inocente - Sanctum de Sangre "..yellow.."[12]"..white..")",
    Note = "Entrega a 'Judith Flenning' en Viento Norte - Villa Ámbar "..yellow.."50, 55",
}
for i = 1, 4 do
    kQuestInstanceData.StormwroughtRuins.Horde[i] = kQuestInstanceData.StormwroughtRuins.Alliance[i]
end
kQuestInstanceData.StormwroughtRuins.Horde[5] = {
    Title = "Inocencia Perdida",
    Level = 34,
    Attain = 28,
    Aim = "Mata los restos de los inocentes y regresa con O'jin en Punta Rompetormenta.",
    Location = "O'jin (Balor - Punta Rompetormenta "..yellow.."71, 46"..white..")",
    Note = "'Restos del Inocente' "..yellow.."[12]",
}
kQuestInstanceData.StormwroughtRuins.Horde[6] = {
    Title = "Mycellakos",
    Level = 33,
    Attain = 27,
    Aim = "Mata a Mycellakos y trae el Núcleo de Mycellakos de vuelta a Uda'pe Pastosol en Punta Rompetormenta.",
    Location = "Uda'pe Hierbasolar (Balor - Punta Rompetormenta "..yellow.."71, 48"..white..")",
    Note = "Recibirás la recompensa al completar la siguiente misión.\n'Corazón de Mycellakos' se obtiene de 'Mycellakos' "..yellow.."[8]",
    Prequest = "Hongo Viviente",
    Folgequest = "La Matriarca Sabrá",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 58268 }, --Left
        { id = 58269 }, --Right
        { id = 58270 }, --Totem of An'she
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[7] = {
    Title = "El Poder de Uth'okk",
    Level = 38,
    Attain = 30,
    Aim = "Mata a Oronok Corazón Roto y recupera el Colgante de Uth'okk de las Ruinas Forjadas por la Tormenta para el Profeta Lejano Mothang en el Puesto Rompehoja en Los Territorios Sombríos.",
    Location = "Vidente Lejano Mothang (Territorios Sombríos - Puesto de Cuchilla Rota "..yellow.."59, 29"..white..")",
    Note = "Recibirás la recompensa al completar la siguiente misión.\n'El Colgante de Uth'okk' se obtiene de 'Oronok Corazón Roto' "..yellow.."[1]",
    Prequest = "Magia Hechizada -> Remedios Naturales -> Esencia Oscura",
    Folgequest = "El Ritual de Uth'okk",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41798 }, --The Pendant of Uth'okk
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[8] = {
    Title = "No Puede Llover Todo el Tiempo",
    Level = 38,
    Attain = 32,
    Aim = "Mata a Dagar el Glotón, Oronok Corazón Destrozado, Ighal'for y regresa con Kilrogg Ojo Muerto en Punta Rompetormentas.",
    Location = "Kilrogg Mortojo (Balor - Punta Rompetormenta "..yellow.."71, 47"..white..")",
    Note = "Recibirás la recompensa al completar la siguiente misión.\n'Oronok Corazón Roto' "..yellow.."[1]"..white.."\n'Dagar el Glotón' "..yellow.."[2]"..white.."\n'Ighal'for' "..yellow.."[11]",
    Prequest = "En lo Profundo de las Minas -> Meros Pensamientos -> Colonia de Hormigas",
    Folgequest = "El Fin de la Tormenta",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 58272 }, --Kor'kron Crown
        { id = 58273 }, --Voodoo Jerkin
        { id = 58274 }, --Totemic Headdress
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[9] = {
    Title = "Artefacto de la Dama Oscura",
    Level = 38,
    Attain = 32,
    Aim = "Entrega el colgante de piedra de sangre a Lady Sylvanas Brisaveloz en Entrañas.",
    Location = "Colgante Roto de Piedra de Sangre (Ruinas Forjatormenta - Ighal'for "..yellow.."[11]"..white..")",
    Note = "La pre-misión comienza en 'Magus Wordeen Vacuamirada' (Laderas de Trabalomas - Molino Tarren "..yellow.."62, 21"..white..")",
    Prequest = "Fuga de la Prisión",
    Rewards = {
        Text = "Recompensa: Elige uno",
        { id = 58277 }, --Lady Winter's Touch",
        { id = 58278 }, --Ring of Judgement
    }
}
--------------- Windhorn Canyon ---------------
kQuestInstanceData.WindhornCanyon = {
    Story = "Este antiguo cañón ha sido hogar de muchas tribus tauren que en años pasados lucharon por el dominio de sus aguas corrientes y refugio de los peligros de Kalimdor. Las culturas y tradiciones de muchos han vivido dentro del Cañón Cuerno de Viento, lo cual se puede ver desde los antiguos refugios tallados en la ladera de la montaña, hasta las reliquias codiciadas por los Tauren. Recientemente, los Tauren Cuerno de Viento fueron expulsados y alejados por los Tótem Siniestro que lo han conquistado y reclamado para sí mismos.",
    Caption = "Cañón Cuerno de Viento",
    Alliance = {},
    Horde = {}
}
--------------- Timbermaw Hold ---------------
kQuestInstanceData.TimbermawHold = {
    Story = "Tan antiguo como Kalimdor mismo, esta enigmática red laberíntica de túneles y cuevas bajo el Monte Hyjal ha sido el hogar de los Furbolgs desde mucho antes del Cataclismo. Sus salones son sagrados entre las tribus, un lugar de adoración a sus progenitores, los dioses gemelos Ursoc y Ursol. Sin embargo, en estos días, solo vaharadas de vapores pútridos escapan de las cavernas podridas y susurros de venerar a un dios inmundo resuenan por todo Timbermaw Hold…",
    Caption = "Bastión Fauces de Madera",
    Alliance = {},
    Horde = {}
}
AtlasTW.Quest.DataBase = kQuestInstanceData
