---
--- QuestData_enUS.lua - Definições de dados do registro de missões do Atlas para localização em português
--- 
--- Este arquivo contém todas as definições de dados de missões para o Atlas-TW em Português.
--- Inclui informações de missões, recompensas, localizações e requisitos
--- para todas as instâncias e zonas suportadas pelo Atlas-TW.
--- 
--- Features:
--- - Base de dados de missões para todas as instâncias
--- - Definições de recompensas de missão
--- - Informações de localização e NPC
--- - Sistema de herança de missão
--- - Dados de missão localizados para o português
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

if GetLocale() ~= "ptBR" then return end

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
    Story = "Antes o maior centro de produção de ouro nas terras humanas, as Minas Mortas foram abandonadas quando a Horda arrasou a cidade de Ventobravo durante a Primeira Guerra. Agora a Irmandade Défias tomou residência e transformou os túneis escuros em seu santuário privado. Rumores dizem que os ladrões recrutaram os astutos goblins para ajudá-los a construir algo terrível no fundo das minas - mas o que isso pode ser ainda é incerto. Dizem que o caminho para as Minas Mortas passa pela quieta e humilde vila de Entardecer.",
    Caption = "Minas Mortas",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheDeadmines.Alliance[1] = {
    Title = "Bandanas de seda vermelha",
    Id = 214,
    Level = 17,
    Attain = 14,
    Aim = "A Batedora Riell, na Torre da Colina Sentinela, quer que você traga 10 Bandanas de Seda Vermelha para ela.",
    Location = "Batedor Riell (Cerro Oeste - Colina Sentinel "..yellow.."56, 47"..white..")",
    Note = "Você pode obter as Bandanas de seda vermelha dos mineradores nas Minas Mortas ou na cidade onde a instância está localizada. A missão fica disponível após você completar a sequência de missões A Irmandade Défias até a parte onde você tem que matar Edwin Vancleef.",
    Prequest = "A Irmandade Défias",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 2074 }, --Solid Shortblade One-Hand, Sword
        { id = 2089 }, --Scrimshaw Dagger One-Hand, Dagger
        { id = 6094 }, --Piercing Axe Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[2] = {
    Title = "Coletando Memórias",
    Id = 168,
    Level = 18,
    Attain = 14,
    Aim = "Recupere 4 Cartas de União de Mineiros e devolva-as para Wilder Thistlettle em Ventobravo.",
    Location = "Espinho de Cardo Selvagem (Stormwind - Distrito Anão "..yellow.."65, 21"..white..")",
    Note = "As cartas são dropadas de criaturas mortas-vivas fora da instância na área próxima a "..yellow.."[3]"..white.." no mapa da Entrada.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 2037 }, --Tunneler's Boots Feet, Mail
        { id = 2036 }, --Dusty Mining Gloves Hands, Leather
    }
}
kQuestInstanceData.TheDeadmines.Alliance[3] = {
    Title = "Ah, irmão. . .",
    Id = 167,
    Level = 20,
    Attain = 15,
    Aim = "Leve a Insígnia da Liga dos Exploradores do Capataz Thistlettle para Wilder Thistlettle em Ventobravo.",
    Location = "Espinho de Cardo Selvagem (Stormwind - Distrito Anão "..yellow.."65,21"..white..")",
    Note = "Encarregado Cardurtiga é encontrado fora da instância na área dos mortos-vivos em "..yellow.."[3]"..white.." no mapa da Entrada.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 1893 }, --Miner's Revenge Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[4] = {
    Title = "Ataque Subterrâneo",
    Id = 2040,
    Level = 20,
    Attain = 15,
    Aim = "Recupere o Gnoam Sprecklesprocket das Minas Mortas e devolva-o para Shoni, o Shilent, em Ventobravo.",
    Location = "Shoni, o Silencioso (Ventobravo - Distrito Anão "..yellow.."55,12"..white..")",
    Note = "A missão prévia pode ser obtida de Gnoarn (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."24.5,30.4"..white..").\nA Detonadora de Sneed dropa o Sprecklesprocket "..yellow.."[3]"..white..".",
    Prequest = "Fale com Shoni",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 7606 }, --Polar Gauntlets Hands, Mail
        { id = 7607 }, --Sable Wand Wand
    }
}
kQuestInstanceData.TheDeadmines.Alliance[5] = {
    Title = "A Irmandade Défias",
    Id = 166,
    Level = 22,
    Attain = 14,
    Aim = "Gryan Stoutmantle quer que você fale com Wiley em Lagoshire.",
    Location = "Gryan Manto Robusto (Cerro Oeste - Colina Sentinel "..yellow.."56,47"..white..")",
    Note = "Você inicia esta sequência de missões com Gryan Manto Robusto (Cerro Oeste - Colina Sentinel "..yellow.."56,47"..white..").\nEdwin VanCleef é o último chefe das Minas Mortas. Você pode encontrá-lo no topo de seu navio "..yellow.."[6]"..white..".",
    Prequest = "A Irmandade Défias",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6087 }, --Chausses of Cerro Oeste Legs, Mail
        { id = 2041 }, --Tunic of Cerro Oeste Chest, Leather
        { id = 2042 }, --Staff of Cerro Oeste Staff
    }
}
kQuestInstanceData.TheDeadmines.Alliance[6] = {
    Title = "O Teste da Justiça",
    Id = 1654,
    Level = 22,
    Attain = 20,
    Aim = "Fale com Jordan Stilwell em Altaforja.",
    Location = "Jardel Calmafonte (Dun Morogh - Altaforja Entrance "..yellow.."52,36"..white..")",
    Note = red.."Apenas Paladino"..white..": Para ver a nota clique em "..yellow.."[Informações de O Teste da Justiça]"..white..".",
    Prequest = "O Tomo do Valor -> O Teste da Justiça",
    Folgequest = "O Teste da Justiça",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = {2, "Apenas Paladinos podem pegar esta missão!\n\n1. Você consegue a Madeira de Carvalho Whitestone de Escultores de Madeira Goblins em "..yellow.."[Minas Mortas]"..white.." perto de "..yellow.."[3]"..white..".\n\n2. Para conseguir a Remessa de Minério Refinado de Bailor, você deve falar com Bailor Manopedra (Loch Modan - Thelsamar "..yellow.."35,44"..white.."). Ele te dá a missão 'Remessa de minério do fiador'. Você encontra o Óculos de Espionagem de Jon-Jon atrás de uma árvore em "..yellow.."71,21"..white.."\n\n3. Você consegue a Remessa de Minério de Jordan em "..yellow.."[Bastilha da Presa Negra]"..white.." em "..yellow.."[3]"..white..".\n\n4. Para conseguir uma Joia Kor, você deve ir até Trovejius Tecevento (Costa Negra - Auberdina "..yellow.."37,40"..white..") e fazer a missão 'Procurando a joia Kor'. Para esta missão, você deve matar oráculos ou sacerdotisas de Profundezas antes de "..yellow.."[Profundezas Negras]"..white..". Elas dropam uma Joia Kor corrompida. Trovejius Tecevento irá limpá-la para você.", },
}
kQuestInstanceData.TheDeadmines.Alliance[7] = {
    Title = "A carta não enviada",
    Id = 373,
    Level = 22,
    Attain = 16,
    Aim = "Entregue a Carta ao Arquiteto da Cidade para Baros Alexston em Ventobravo.",
    Location = "Uma Carta Não Enviada (dropada de Edwin Vancleef "..yellow.."[6]"..white..")",
    Note = "Baros Aleixo está em Ventobravo, ao lado da Catedral da Luz em "..yellow.."49,30"..white..".",
    Folgequest = "Bazil Thredd",

}
kQuestInstanceData.TheDeadmines.Alliance[8] = {
    Title = "A Vingança do Capitão Grayson",
    Id = 40396,
    Level = 22,
    Attain = 15,
    Aim = "Fim do biscoito.",
    Location = "Capitão Grayson (Cerro Oeste - Faro "..yellow.."30,86"..white..")",
    Note = "Você inicia esta sequência de missões na ilha noroeste em Cerro Oeste; Livro vermelho no chão "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "Alimento para pensamentos sobre navegação?",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Alliance[9] = {
    Title = "O Mistério do Golem da Colheita",
    Id = 40478,
    Level = 19,
    Attain = 15,
    Aim = "Aventure-se nas Minas Mortas e mate o Ceifador da Obra-Prima. Depois, retorne para Maltimor Gartside na Propriedade Gartside em Cerro Oeste.",
    Location = "Maltimor Ladogarda (Cerro Oeste - ao norte da Pedreira Costa Dourada "..yellow.."31.3,37.6"..white..")",
    Note = "Você inicia esta sequência de missões com Cristóvão Cavo (Cerro Oeste - Pousada da Colina Sentinel "..yellow.."52.3,52.8"..white..").\nA sequência tem 16 missões. Recompensa final itens azuis:1) Mão Secundária Int/res Sombrio/dano e cura, 2) Ombros de Malha For/Vigor, 3) Luvas de Couro For/Agi/Vigor\nCeifador Magistral está em "..yellow.."[6]"..white..".",
    Prequest = "O Mistério do Golem da Colheita VIII",
    Folgequest = "O Mistério do Golem da Colheita X",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60684 }, --Tinkering Belt Waist, Leather
        { id = 60685 }, --Safety Wraps Wrist, Cloth
        { id = 60686 }, --Harvest Golem Arm Two-Hand, Mace
    }
}
kQuestInstanceData.TheDeadmines.Alliance[10] = {
    Title = "Fechando a torneira",
    Id = 41392,
    Level = 20,
    Attain = 14,
    Aim = "Infiltre-se nas Minas Mortas em Cerro Oeste e adquira a Cerveja Quente de Voss.",
    Location = "Renzik 'A Navalha' (Ventobravo - Cidade Velha "..yellow.."76, 60"..white..")",
    Note = "Você inicia esta sequência de missões no mesmo NPC. O drop de Jared Voss está em "..yellow.."[1]"..white..".",
    Prequest = "Drones em Cerro Oeste -> Entrega de empreendimento",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 70239 }, --Operative Cloak Back
        { id = 70240 }, --Cuffs of Integrity Wrist, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[1] = {
    Title = "Roubo de protótipo",
    Id = 55005,
    Level = 18,
    Attain = 16,
    Aim = "Leve o esquema do protótipo Shredder X0-1 para Wrix Ozzlenut.",
    Location = "Wrix Nozleve (Durotar - Porto Sparkwater "..yellow.."58.3,25.7"..white..")",
    Note = "Sneed dropa o Esquema do Protótipo Shredder X0-1 "..yellow.."[3]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 81316 }, --Foe Chopper Two-Hand, Axe
        { id = 81317 }, --Shining Electro-lantern Held In Off-hand
    }
}
kQuestInstanceData.TheDeadmines.Horde[2] = {
    Title = "A Vingança do Capitão Grayson",
    Id = 40396,
    Level = 22,
    Attain = 15,
    Aim = "Fim do biscoito.",
    Location = "Capitão Grayson (Cerro Oeste - Faro "..yellow.."30,86"..white..")",
    Note = "Você inicia esta sequência de missões na ilha noroeste em Cerro Oeste; Livro vermelho no chão "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "Alimento para pensamentos sobre navegação?",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[3] = {
    Title = "Machado do Defensor da Horda",
    Id = 39998,
    Level = 18,
    Attain = 15,
    Aim = "Fale com um Guarda da Horda na Encruzilhada",
    Location = "Brígida Cranston <Portal Trainer> (Penhasco do Trovão"..yellow.."34.4,20.3"..white..")",
    Note = "Você inicia esta sequência de missões com Nargal Olho da Morte (Encruzilhada "..yellow.."51.2,29.1"..white..").\nEsta missão "..red.."APENAS TELEPORTA você para CERRO OESTE"..white..". Você pode completar esta missão e pegar a recompensa após completar a sequência ou usá-la como teleporte para Cerro Oeste retomando a missão.",
    Prequest = "Machado do Defensor da Horda",
    Folgequest = "Machado do Defensor da Horda",
    Rewards = {
        Text = "Recompensa: ",
        { id = 40065 }, --Horde Defender's Axe Two-Hand, Axe
    }
}

--------------- Wailing Caverns ---------------
kQuestInstanceData.WailingCaverns = {
    Story = "Recentemente, um druida elfo noturno chamado Naralex descobriu uma rede de cavernas subterrâneas no coração dos Sertões. Apelidadas de 'Cavernas Ululantes', essas cavernas naturais eram cheias de fissuras de vapor que produziam longos e melancólicos lamentos ao ventilar. Naralex acreditava que poderia usar as nascentes subterrâneas das cavernas para restaurar a exuberância e fertilidade aos Sertões - mas para fazer isso seria necessário sugar as energias do lendário Sonho Esmeralda. Uma vez conectado ao Sonho, no entanto, a visão do druida de alguma forma se tornou um pesadelo. Logo as Cavernas Ululantes começaram a mudar - as águas se tornaram sujas e as criaturas antes dóceis dentro se metamorfosearam em predadores viciosos e mortais. Dizem que o próprio Naralex ainda reside em algum lugar dentro do coração do labirinto, preso além das bordas do Sonho Esmeralda. Até seus antigos acólitos foram corrompidos pelo pesadelo desperto de seu mestre - transformados nos perversos Druidas da Presa.",
    Caption = "Caverna Ululante",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.WailingCaverns.Alliance[1] = {
    Title = "Desviar se esconde",
    Id = 1486,
    Level = 17,
    Attain = 13,
    Aim = "Nalpak, nas Cavernas das Lamentações, quer 20 Peles Desviadas.",
    Location = "Nalpak (Barrens - Caverna Ululante "..yellow.."47,36"..white..")",
    Note = "Todas as criaturas desviadas dentro e logo antes da entrada da instância podem dropar peles.\nNalpak pode ser encontrado em uma caverna escondida acima da entrada real da caverna. O caminho mais fácil para ele parece ser subir a colina do lado de fora e atrás da entrada e descer pela pequena saliência acima da entrada da caverna.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6480 }, --Slick Deviate Leggings Legs, Leather
        { id = 918 }, --Deviate Hide Pack Bag
    }
}
kQuestInstanceData.WailingCaverns.Alliance[2] = {
    Title = "Problemas nas docas",
    Id = 959,
    Level = 18,
    Attain = 14,
    Aim = "O Operador de Guindaste Bigglefuzz em Ratchet quer que você recupere a garrafa de Porto de 99 Anos de Mad Magglish, que está escondido nas Cavernas das Lamentações.",
    Location = "Operador de Grua Mafuá (Barrens - Vila Catraca "..yellow.."63,37"..white..")",
    Note = "Você pega a garrafa logo antes de entrar na instância matando Maluc Insano. Quando você entrar pela primeira vez na caverna, vire imediatamente à direita para encontrá-lo no final da passagem. Ele está furtivo junto à parede em "..yellow.."[2] no Mapa de Entrada"..white..".",
}
kQuestInstanceData.WailingCaverns.Alliance[3] = {
    Title = "Bebidas Inteligentes",
    Id = 1491,
    Level = 18,
    Attain = 13,
    Aim = "Leve 6 porções de Essência Lamuriosa para Mebok Mizzyrix em Catraca.",
    Location = "Cáliper Porcatraca (Barrens - Vila Catraca "..yellow.."62,37"..white..")",
    Note = "A missão prévia pode ser obtida de Cáliper Porcatraca também.\nTodos os inimigos Ectoplasma dentro e antes da instância dropam a Essência.",
    Prequest = "Chifres de Raptor",
}
kQuestInstanceData.WailingCaverns.Alliance[4] = {
    Title = "Erradicação do Desvio",
    Id = 1487,
    Level = 21,
    Attain = 15,
    Aim = "Ebru nas Wailing Caverns quer que você mate 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers e 7 Deviate Dreadfangs.",
    Location = "Ebru (Barrens - Caverna Ululante "..yellow.."47,36"..white..")",
    Note = "Ebru está em uma caverna escondida acima da entrada da caverna. O caminho mais fácil para ele parece ser subir a colina do lado de fora e atrás da entrada e descer pela pequena saliência acima da entrada da caverna.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6476 }, --Pattern: Deviate Scale Belt Pattern
        { id = 8071 }, --Sizzle Stick Wand
        { id = 6481 }, --Dagmire Gauntlets Hands, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[5] = {
    Title = "O fragmento brilhante",
    Id = 6981,
    Level = 26,
    Attain = 15,
    Aim = "Viaje para Ratchet para descobrir o significado por trás do Nightmare Shard.",
    Location = "O Fragmento Brilhante (dropado de Mutanus, o Devorador "..yellow.."[9]"..white..")",
    Note = "Mutanus, o Devorador só aparecerá se você matar os quatro druidas líderes da presa e escoltar o druida tauren na entrada.\nQuando você tiver o Fragmento, deve levá-lo ao Banco em Vila Catraca, e depois de volta ao topo da colina sobre a Caverna Ululante até Falla Vento Sábio.",
    Folgequest = "Em pesadelos",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 10657 }, --Talbar Mantle Shoulder, Cloth
        { id = 10658 }, --Quagmire Galoshes Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[6] = {
    Title = "Serpente Flor",
    Id = 60125,
    Level = 18,
    Attain = 16,
    Aim = "O Boticário Zamah em Penhasco Trovão quer que você colete 10 Serpentbloom.",
    Location = "Alanndária Noturcanto (Auberdine - Costa Negra "..yellow.."37.7,40.7"..white..")",
    Note = "Você pega a Flor de Serpente dentro da caverna em frente à instância e dentro da instância. Jogadores com Herborismo podem ver as plantas no minimapa.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 51850 }, --Greenweave Sash Waist, Cloth
        { id = 51851 }, --Verdant Boots Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[7] = {
    Title = "Preso no pesadelo",
    Id = 60124,
    Level = 19,
    Attain = 16,
    Aim = "Alanndarian Nightsong quer que você se aventure nas Cavernas das Lamentações nos Sertões Setentrionais e liberte Naralex do Pesadelo. Encontre seu discípulo nas cavernas para saber como. Volte para ela quando libertar Naralex.",
    Location = "Alanndária Noturcanto (Auberdine - Costa Negra "..yellow.."37.7,40.7"..white..")",
    Note = "Mutanus, o Devorador só aparecerá se você matar os quatro druidas líderes da presa e escoltar o druida tauren na entrada.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 51848 }, --Ancient Elven Robes Chest, Cloth
        { id = 51849 }, --Thunderhorn Two-Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Alliance[8] = {
    Title = "Ervas daninhas desenfreadas",
    Id = 41363,
    Level = 20,
    Attain = 16,
    Aim = "Thundris Windweaver em Auberdine precisa de amostras das Crescimentos Não Naturais nas Cavernas das Lamentações.",
    Location = "Trovejius Tecevento (Auberdine - Costa Negra "..yellow.."37.4,40.1"..white..")",
    Note = "Elementals - Crescimento Desnatural drop Overgrowth Samples.",
    Rewards = {
        Text = "Recompensa: 1 ou 2",
        { id = 3827, quantity = 3 }, --Mana Potion Potion
        { id = 1710, quantity = 3 }, --Greater Healing Potion Potion
    }
}
kQuestInstanceData.WailingCaverns.Horde[1] = kQuestInstanceData.WailingCaverns.Alliance[1]
kQuestInstanceData.WailingCaverns.Horde[2] = kQuestInstanceData.WailingCaverns.Alliance[2]
kQuestInstanceData.WailingCaverns.Horde[3] = {
    Title = "Serpente Flor",
    Id = 962,
    Level = 18,
    Attain = 14,
    Aim = "O Boticário Zamah em Penhasco Trovão quer que você colete 10 Serpentbloom.",
    Location = "Boticário Zaqueu (Penhasco do Trovão - Cume Spirit "..yellow.."22,20"..white..")",
    Note = "Boticário Zaqueu está em uma caverna sob o Cume Spirit. Você pega a missão prévia de Boticário Hermógenes (Sertões - Encruzilhada "..yellow.."51,30"..white..").\nVocê pega a Flor de Serpente dentro da caverna em frente à instância e dentro da instância. Jogadores com Herborismo podem ver as plantas no minimapa.",
    Prequest = "Esporos de fungos -> Boticário Zamah",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10919 }, --Apothecary Gloves Hands, Cloth
    }
}
kQuestInstanceData.WailingCaverns.Horde[4] = {
    Title = "Bebidas Inteligentes",
    Id = 1491,
    Level = 18,
    Attain = 13,
    Aim = "Leve 6 porções de Essência Lamuriosa para Mebok Mizzyrix em Catraca.",
    Location = "Cáliper Porcatraca (Barrens - Vila Catraca "..yellow.."62,37"..white..")",
    Note = "A missão prévia pode ser obtida de Cáliper Porcatraca também.\nTodos os inimigos Ectoplasma dentro e antes da instância dropam a Essência.",
    Prequest = "Chifres de Raptor",
}
kQuestInstanceData.WailingCaverns.Horde[5] = {
    Title = "Erradicação do Desvio",
    Id = 1487,
    Level = 21,
    Attain = 15,
    Aim = "Ebru nas Wailing Caverns quer que você mate 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers e 7 Deviate Dreadfangs.",
    Location = "Ebru (Barrens - Caverna Ululante "..yellow.."47,36"..white..")",
    Note = "Ebru está em uma caverna escondida acima da entrada da caverna. O caminho mais fácil para ele parece ser subir a colina do lado de fora e atrás da entrada e descer pela pequena saliência acima da entrada da caverna.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6476 }, --Pattern: Deviate Scale Belt Pattern
        { id = 8071 }, --Sizzle Stick Wand
        { id = 6481 }, --Dagmire Gauntlets Hands, Mail
    }
}
kQuestInstanceData.WailingCaverns.Horde[6] = {
    Title = "Líderes da Fang",
    Id = 914,
    Level = 22,
    Attain = 11,
    Aim = "Leve as joias de Cobrahn, Anacondra, Pythas e Serpentis para Nara Wildmane em Penhasco Trovão.",
    Location = "Nara Juba Agreste (Penhasco do Trovão - Elevado dos Anciãos "..yellow.."75,31"..white..")",
    Note = "A sequência de missões começa com Hamuul Totem Rúnico (Penhasco do Trovão - Elevado dos Anciãos "..yellow.."78,28"..white..")\nOs 4 druidas dropam as gemas "..yellow.."[2]"..white..", "..yellow.."[3]"..white..", "..yellow.."[5]"..white..", "..yellow.."[7]"..white..".",
    Prequest = "Os oásis de Ermos -> Nara Juba Selvagem",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6505 }, --Crescent Staff Staff
        { id = 6504 }, --Wingblade Main Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Horde[7] = {
    Title = "O fragmento brilhante",
    Id = 6981,
    Level = 26,
    Attain = 15,
    Aim = "Viaje para Ratchet para descobrir o significado por trás do Nightmare Shard.",
    Location = "O Fragmento Brilhante (dropado de Mutanus, o Devorador "..yellow.."[9]"..white..")",
    Note = "Mutanus, o Devorador só aparecerá se você matar os quatro druidas líderes da presa e escoltar o druida tauren na entrada.\nQuando você tiver o Fragmento, deve levá-lo ao Banco em Vila Catraca, e depois de volta ao topo da colina sobre a Caverna Ululante até Falla Vento Sábio.",
    Folgequest = "Em pesadelos",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 10657 }, --Talbar Mantle Shoulder, Cloth
        { id = 10658 }, --Quagmire Galoshes Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Horde[8] = {
    Title = "Armas Arcanas",
    Id = 80312,
    Level = 18,
    Attain = 14,
    Aim = "Traga para Chok'Garok 5 pedaços de Madeira Tocada pela Lua, um Cristal da Serpente e uma Essência Sempre Mutável das Cavernas das Lamentações.",
    Location = "Chok'garok <Clã Martelodepedra> (em uma margem do Rio Fúriasul nos Sertões "..yellow.."62.4,10.8"..white..")",
    Note = red.."Apenas MAGO."..white.." A sequência de missões começa com Ureda <Treinador de Mago> (Orgrimmar) com a missão 'Dominando o Arcano'.\nMadeira Tocada pela Lua você consegue de "..yellow.."trash"..white..", um Cristal da Serpente de Lorde Serpentis <Senhor da Presa>"..yellow.."[7]"..white..", e uma Essência Mutável de Lorde Pítias <Senhor da Presa> "..yellow.."[5]"..white..".",
    Prequest = "Dominando o Arcano",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 80860 }, --Staff of the Arcane Path Staff
        { id = 80861 }, --Spellweaving Dagger One-Hand, Dagger
    }
}
kQuestInstanceData.WailingCaverns.Horde[9] = {
    Title = "Contra o Sonho Kolkar",
    Id = 41367,
    Level = 23,
    Attain = 17,
    Aim = "Mate Zandara Casco de Vento nas Cavernas das Lamentações e leve a cabeça dela de volta para Nalpak, nos Sertões.",
    Location = "Nalpak (Barrens - Caverna Ululante "..yellow.."47,36"..white..")",
    Note = "Você precisa matar Zandara Casco do Vento [6] e pegar a cabeça dela.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70224 }, --Kolkar Drape Back
    }
}

--------------- Ragefire Chasm ---------------
kQuestInstanceData.RagefireChasm = {
    Story = "O Abismo Ígneo consiste em uma rede de cavernas vulcânicas que ficam abaixo da nova capital dos orcs, Orgrimmar. Recentemente, rumores se espalharam de que um culto leal ao demoníaco Conselho das Sombras tomou residência nas profundezas ardentes do Abismo. Este culto, conhecido como Lâmina Flamejante, ameaça a própria soberania de Durotar. Muitos acreditam que o Chefe de Guerra orc, Thrall, está ciente da existência da Lâmina e optou por não destruí-la na esperança de que seus membros possam levá-lo diretamente ao Conselho das Sombras. De qualquer forma, os poderes sombrios que emanam do Abismo Ígneo poderiam desfazer tudo o que os orcs lutaram para conquistar.",
    Caption = "Cavernas Ígneas",
    Horde = {}
}
kQuestInstanceData.RagefireChasm.Horde[1] = {
    Title = "Testando a força de um inimigo",
    Id = 5723,
    Level = 15,
    Attain = 9,
    Aim = "Procure Orgrimmar por Ragefire Chasm, depois mate 8 Ragefire Troggs e 8 Ragefire Shaman antes de retornar para Rahauro em Penhasco Trovão.",
    Location = "Rahauro (Penhasco do Trovão - Elevado dos Anciãos "..yellow.."70,29"..white..")",
    Note = "Você encontra os troggs no início.",
}
kQuestInstanceData.RagefireChasm.Horde[2] = {
    Title = "O poder de destruir...",
    Id = 5725,
    Level = 16,
    Attain = 9,
    Aim = "Leve os livros Feitiços de Sombra e Encantamentos do Submundo para Varimathras na Cidade Baixa.",
    Location = "Varimatras (Cidade Baixa - Bairro Real "..yellow.."56,92"..white..")",
    Note = "Cultistas e Bruxos da Lâmina Ardente dropam os livros",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 15449 }, --Ghastly Trousers Legs, Cloth
        { id = 15450 }, --Dredgemire Leggings Legs, Leather
        { id = 15451 }, --Gargoyle Leggings Legs, Mail
    }
}
kQuestInstanceData.RagefireChasm.Horde[3] = {
    Title = "Em busca da mochila perdida",
    Id = 5722,
    Level = 16,
    Attain = 9,
    Aim = "Procure no Ragefire Chasm o cadáver de Maur Grimtotem e procure por qualquer item de interesse.",
    Location = "Rahauro (Penhasco do Trovão - Elevado dos Anciãos "..yellow.."70,29"..white..")",
    Note = "Você encontra Mauren Temível Totem em "..yellow.."[1]"..white..". Depois de pegar a mochila, você deve levá-la de volta para Rahauro em Penhasco do Trovão",
    Folgequest = "Devolvendo a mochila perdida",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 15452 }, --Featherbead Bracers Wrist, Cloth
        { id = 15453 }, --Savannah Bracers Wrist, Leather
    }
}
kQuestInstanceData.RagefireChasm.Horde[4] = {
    Title = "Inimigos Ocultos",
    Id = 5728,
    Level = 16,
    Attain = 9,
    Aim = "Leve uma Insígnia de Tenente para Thrall em Orgrimmar.",
    Location = "Thrall (Orgrimmar - Vale da Sabedoria "..yellow.."31,37"..white..")",
    Note = "Você encontra Bazzalan em "..yellow.."[4]"..white.." e Jergosh em "..yellow.."[3]"..white..". A sequência de missões começa com o Chefe de Guerra Thrall em Orgrimmar.",
    Prequest = "Inimigos Ocultos",
    Folgequest = "Inimigos Ocultos",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 15443 }, --Kris of Orgrimmar One-Hand, Dagger
        { id = 15445 }, --Hammer of Orgrimmar Main Hand, Mace
        { id = 15424 }, --Axe of Orgrimmar Two-Hand, Axe
        { id = 15444 }, --Staff of Orgrimmar Staff
    }
}
kQuestInstanceData.RagefireChasm.Horde[5] = {
    Title = "Matando a Besta",
    Id = 5761,
    Level = 16,
    Attain = 9,
    Aim = "Entre no Ragefire Chasm e mate Taragaman, o Faminto, depois leve seu coração de volta para Neeru Fireblade em Orgrimmar.",
    Location = "Neeru Cortafogo (Orgrimmar - Fenda das Sombras "..yellow.."49,50"..white..")",
    Note = "Você encontra Taragaman em "..yellow.."[2]"..white..".",
}

--------------- Uldaman ---------------
kQuestInstanceData.Uldaman = {
    Story = "Uldaman é um antigo cofre dos Titãs que ficou enterrado nas profundezas da terra desde a criação do mundo. Escavações anãs recentemente penetraram esta cidade esquecida, liberando as primeiras criações fracassadas dos Titãs: os troggs. Lendas dizem que os Titãs criaram troggs a partir de pedra. Quando consideraram o experimento um fracasso, os Titãs trancaram os troggs e tentaram novamente - resultando na criação da raça anã. Os segredos da criação dos anões estão registrados nos lendários Discos de Norgannon - artefatos Titânicos massivos que ficam no fundo da cidade antiga. Recentemente, os anões Ferro Negro lançaram uma série de incursões em Uldaman, esperando reivindicar os discos para seu mestre ardente, Ragnaros. No entanto, protegendo a cidade enterrada estão vários guardiões - construtos gigantes de pedra viva que esmagam quaisquer intrusos desafortunados que encontram. Os próprios Discos são guardados por um massivo Guardião de Pedra senciente chamado Archaedas. Alguns rumores até sugerem que os ancestrais de pele de pedra dos anões, os tèrreos, ainda habitam nas profundezas dos recessos escondidos da cidade.",
    Caption = "Uldaman",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Uldaman.Alliance[1] = {
    Title = "Um sinal de esperança",
    Id = 721,
    Level = 35,
    Attain = 33,
    Aim = "Encontre o Prospector Ryedol e informe-o que Hammertoe Grez está vivo.",
    Location = "Prospector Ryedol (Ermos "..yellow.."53,43"..white..")",
    Note = "A missão prévia começa no Mapa Amassado (Ermos "..yellow.."53,33"..white..").\nVocê encontra Grez Pé-de-malho antes de entrar na instância, em "..yellow.."[1]"..white.." no mapa da Entrada.",
    Prequest = "Um sinal de esperança",
    Folgequest = "Amuleto dos Segredos",
}
kQuestInstanceData.Uldaman.Alliance[2] = {
    Title = "Amuleto dos Segredos",
    Id = 722,
    Level = 40,
    Attain = 35,
    Aim = "Encontre o Amuleto do Martelo e devolva-o para ele em Uldaman.",
    Location = "Grez Pé-de-malho (Uldaman "..yellow.."[1] on Entrance Map"..white..").",
    Note = "O Amuleto dropa de Magregan Sombrafunda em "..yellow.."[2] no Mapa de Entrada"..white..".",
    Prequest = "Um sinal de esperança",
    Folgequest = "Perspectiva de Fé",
}
kQuestInstanceData.Uldaman.Alliance[3] = {
    Title = "As Tábuas Perdidas da Vontade",
    Id = 1139,
    Level = 45,
    Attain = 35,
    Aim = "Encontre a Tábua da Vontade e devolva-a ao Conselheiro Belgrum em Altaforja.",
    Location = "Conselheiro Belgrum (Altaforja - Salão dos Exploradores "..yellow.."77,10"..white..")",
    Note = "A tábua está em "..yellow.."[8]"..white..".",
    Prequest = "Amuleto dos Segredos -> Um Embaixador do Mal",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6723 }, --Medal of Courage Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[4] = {
    Title = "Pedras de Poder",
    Id = 2418,
    Level = 36,
    Attain = 30,
    Aim = "Leve 8 Pedras de Poder Dentrium e 8 Pedras de Poder de An'Alleum para Rigglefuzz nas Terras Ermas.",
    Location = "Bertolezo (Ermos "..yellow.."42,52"..white..")",
    Note = "As pedras podem ser encontradas em quaisquer inimigos Forjassombra antes e dentro da instância.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9522 }, --Energized Stone Circle Shield
        { id = 10358 }, --Duracin Bracers Wrist, Mail
        { id = 10359 }, --Everlast Boots Feet, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[5] = {
    Title = "O destino de Agmond",
    Id = 704,
    Level = 38,
    Attain = 30,
    Aim = "Leve 4 Urnas de Pedra Esculpida para o Prospector Ironband em Loch Modan.",
    Location = "Prospector Bandaferro (Loch Modan - Sítio de Escavação de Ironband "..yellow.."65,65"..white..")",
    Note = "A missão prévia começa com Prospector Lançatroz (Altaforja - Salão dos Exploradores "..yellow.."74,12"..white..").\nAs Urnas estão espalhadas pelas cavernas antes da instância.",
    Prequest = "Ironband quer você! -> Murdaloc",
    Rewards = {
        Text = "Recompensa: ",
        { id = 4980 }, --Prospector Gloves Hands, Leather
    }
}
kQuestInstanceData.Uldaman.Alliance[6] = {
    Title = "Solução para a desgraça",
    Id = 709,
    Level = 40,
    Attain = 30,
    Aim = "Leve a Placa de Ryun'eh para Theldurin, o Perdido.",
    Location = "Theldurin, o Perdido (Ermos "..yellow.."51,76"..white..")",
    Note = "A tábua fica ao norte das cavernas, na extremidade leste de um túnel, antes da instância. No mapa de Entrada, está em "..yellow.."[3]"..white..".",
    Folgequest = "Para Ironforge para Yagyin's Digest",
    Rewards = {
        Text = "Recompensa: ",
        { id = 4746 }, --Doomsayer's Robe Chest, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[7] = {
    Title = "Os anões perdidos",
    Id = 2398,
    Level = 40,
    Attain = 35,
    Aim = "Encontre Baelog em Uldaman.",
    Location = "Prospector Lançatroz (Altaforja - Salão dos Exploradores "..yellow.."75,12"..white..")",
    Note = "Baelog está em "..yellow.."[1]"..white..".",
    Folgequest = "A Câmara Oculta",
}
kQuestInstanceData.Uldaman.Alliance[8] = {
    Title = "A Câmara Oculta",
    Id = 2240,
    Level = 40,
    Attain = 35,
    Aim = "Leia o Diário de Baelog, explore a câmara escondida e depois apresente-se ao Prospector Stormpike.",
    Location = "Baelog (Uldaman "..yellow.."[1]"..white..")",
    Note = "A Câmara Oculta está em "..yellow.."[4]"..white..". Para abrir a Câmara Oculta você precisa O Eixo de Tsol de Revelosh "..yellow.."[3]"..white.." e o Medalhão de Gni'kiv do Baú de Baelog "..yellow.."[1]"..white..". Combine esses dois itens para formar o Cajado de Prehistória. O Cajado é usado na Sala de Mapas entre "..yellow.."[3] e [4]"..white.." para invocar Ferronaya. Depois de matá-la, corra para dentro da sala de onde ela veio para obter crédito da missão.",
    Prequest = "Os anões perdidos",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9626 }, --Dwarven Charge Two-Hand, Axe
        { id = 9627 }, --Explorer's League Lodestar Held In Off-hand
    }
}
kQuestInstanceData.Uldaman.Alliance[9] = {
    Title = "O colar quebrado",
    Id = 2198,
    Level = 41,
    Attain = 37,
    Aim = "Procure o criador original do colar quebrado para saber seu valor potencial.",
    Location = "Colar Quebrado (drop aleatório de Uldaman)",
    Note = "Leve o colar para Didiê Du Mocó (Altaforja - A Ala Mística "..yellow.."36,3"..white..").",
    Folgequest = "Conhecimento por um preço",
}
kQuestInstanceData.Uldaman.Alliance[10] = {
    Title = "De volta a Uldaman",
    Id = 2200,
    Level = 42,
    Attain = 37,
    Aim = "Procure pistas sobre a localização atual do colar de Talvash em Uldaman.  O paladino morto que ele mencionou foi a pessoa que ficou com ele por último.",
    Location = "Didiê Du Mocó (Altaforja - A Ala Mística "..yellow.."36,3"..white..")",
    Note = "O Paladino está em "..yellow.."[2]"..white..".",
    Prequest = "Conhecimento por um preço",
    Folgequest = "Encontre as joias",
}
kQuestInstanceData.Uldaman.Alliance[11] = {
    Title = "Encontre as joias",
    Id = 2201,
    Level = 43,
    Attain = 40,
    Aim = "Encontre o rubi, a safira e o topázio que estão espalhados por Uldaman.  Uma vez adquirido, entre em contato com Talvash del Kissel remotamente usando o Frasco de Vidência que ele lhe deu anteriormente.$B$BDo diário, você sabe...$B* O rubi foi escondido em uma área barricada de Shadowforge.$B* O topázio foi escondido em uma urna em uma das áreas Trogg, perto de alguns anões da Aliança.$B$B* A safira foi reivindicada por Grimlok, o líder trogg.",
    Location = "Restos Mortais de um Paladino (Uldaman "..yellow.."[2]"..white..")",
    Note = "As gemas estão em "..yellow.."[1]"..white.." em uma Urna Conspícua, "..yellow.."[8]"..white.." do Esconderijo Forjassombra, e "..yellow.."[9]"..white.." de Grimlok. Note que ao abrir o Esconderijo Forjassombra, algumas criaturas surgirão e atacarão você.\nUse a Tigela de Vidência de Talvash para entregar a missão e receber a sequência.",
    Prequest = "De volta a Uldaman",
    Folgequest = "Restaurando o Colar",
}
kQuestInstanceData.Uldaman.Alliance[12] = {
    Title = "Restaurando o Colar",
    Id = 2204,
    Level = 44,
    Attain = 37,
    Aim = "Obtenha uma fonte de energia da construção mais poderosa que você pode encontrar em Uldaman e entregue-a a Talvash del Kissel em Altaforja.",
    Location = "Talvash's Scrying Bowl",
    Note = "A Fonte de Poder do Colar Quebrado dropa de Arkhaedas "..yellow.."[10]"..white..".",
    Prequest = "Encontre as joias",
    Rewards = {
        Text = "Recompensa: ",
        { id = 7673 }, --Talvash's Enhancing Necklace Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[13] = {
    Title = "Execução do reagente Uldaman",
    Id = 17,
    Level = 42,
    Attain = 36,
    Aim = "Leve 12 cápsulas de fungo magenta para Ghak Healtouch em Thelsamar.",
    Location = "Ghak Toquecura (Loch Modan - Thelsamar "..yellow.."37,49"..white..")",
    Note = "As tampas estão espalhadas por toda a instância. Herbalistas podem vê-las no minimapa se Rastrear Ervas estiver ativo e tiverem a missão.",
    Prequest = "Execução do reagente de Badlands",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[14] = {
    Title = "Tesouros Recuperados",
    Id = 1360,
    Level = 43,
    Attain = 33,
    Aim = "Pegue o bem precioso de Krom Braço Forte em seu baú no Salão Comum do Norte de Uldaman e leve-o para ele em Altaforja.",
    Location = "Krom Braçoforte (Altaforja - Salão dos Exploradores "..yellow.."74,9"..white..")",
    Note = "Você encontra o tesouro antes de entrar na instância. Está ao norte das cavernas, na extremidade sudeste do primeiro túnel. No mapa de entrada, está em "..yellow.."[4]"..white..".",
}
kQuestInstanceData.Uldaman.Alliance[15] = {
    Title = "Os discos de platina",
    Id = 2278,
    Level = 47,
    Attain = 40,
    Aim = "Fale com o observador de pedra e aprenda que tradição antiga ele guarda.  Depois de aprender o que ele tem a oferecer, ative os Discos de Norgannon.",
    Location = "Os Discos de Norgannon (Uldaman "..yellow.."[11]"..white..")",
    Note = "Depois de receber a missão, fale com o guardião de pedra à esquerda dos discos. Em seguida, use os discos de platina novamente para receber discos em miniatura, que você terá que levar para o Alto-explorador Magellas em Altaforja - Salão dos Exploradores ("..yellow.."69,18"..white.."). A sequência começa com outro NPC que está por perto.",
    Folgequest = "Presságios de Uldum",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3",
        { id = 9587 }, --Thawpelt Sack Bag
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[16] = {
    Title = "Poder em Uldaman",
    Id = 1956,
    Level = 40,
    Attain = 35,
    Aim = "Recupere uma Fonte de Poder Obsidiana e leve-a para Tabetha em Dustwallow Marsh.",
    Location = "Tabetha (Pântano Vadeoso "..yellow.."46,57"..white..")",
    Note = red.."Apenas Mago"..white..": A Fonte de Poder de Obsidiana dropa do Sentinela de Obsidiana em "..yellow.."[5]"..white..".",
    Prequest = "O Exorcismo",
    Folgequest = "Surtos de mana",
}
kQuestInstanceData.Uldaman.Alliance[17] = { --1.18
    Title = "Roubando um Núcleo",
    Id = 40129,
    Level = 45,
    Attain = 45,
    Aim = "Leve um Núcleo de Poder Intacto dos Tesouros Antigos de Uldaman para Torble Sparksprocket, no sul dos Sertões.",
    Location = "Torble Faisgrenagem (Sertões "..yellow.."48.6,83"..white.." gnomo com óculos roxos sob a tenda, ao lado do anão)",
    Note = "Núcleo de Energia Intacto "..yellow.."[11]"..white..", na sala com disco de platina atrás do último chefe no baú atrás do pilar direito.\nA sequência de missões começa em Sertões do Sul -> Bael Modan -> um pouco ao norte do caminho para Bastião de Bael'dun sob a tenda. A primeira missão pode ser obtida no nível 18, a última no nível 53",
    Prequest = "Uma aquisição antiga",
    Folgequest = "A ativação",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}
kQuestInstanceData.Uldaman.Horde[1] = {
    Title = "Pedras de Poder",
    Id = 2418,
    Level = 36,
    Attain = 30,
    Aim = "Leve 8 Pedras de Poder Dentrium e 8 Pedras de Poder de An'Alleum para Rigglefuzz nas Terras Ermas.",
    Location = "Bertolezo (Ermos "..yellow.."42,52"..white..")",
    Note = "As pedras podem ser encontradas em quaisquer inimigos Forjassombra antes e dentro da instância.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9522 }, --Energized Stone Circle Shield
        { id = 10358 }, --Duracin Bracers Wrist, Mail
        { id = 10359 }, --Everlast Boots Feet, Cloth
    }
}
kQuestInstanceData.Uldaman.Horde[2] = {
    Title = "Solução para a desgraça",
    Id = 709,
    Level = 40,
    Attain = 30,
    Aim = "Leve a Placa de Ryun'eh para Theldurin, o Perdido.",
    Location = "Theldurin, o Perdido (Ermos "..yellow.."51,76"..white..")",
    Note = "A tábua fica ao norte das cavernas, na extremidade leste de um túnel, antes da instância. No mapa de Entrada, está em "..yellow.."[3]"..white..".",
    Folgequest = "Para Ironforge para Yagyin's Digest",
    Rewards = {
        Text = "Recompensa: ",
        { id = 4746 }, --Doomsayer's Robe Chest, Cloth
    }
}
kQuestInstanceData.Uldaman.Horde[3] = {
    Title = "Recuperação de colar",
    Id = 2283,
    Level = 41,
    Attain = 37,
    Aim = "Procure um colar valioso na escavação de Uldaman e leve-o para Dran Droffers em Orgrimmar.  O colar pode estar danificado.",
    Location = "Dran Droffers (Orgrimmar - A Arranca "..yellow.."59,36"..white..")",
    Note = "O colar é um drop aleatório na instância.",
    Folgequest = "Recuperação de colar, Take 2",
}
kQuestInstanceData.Uldaman.Horde[4] = {
    Title = "Recuperação de colar, Take 2",
    Id = 2284,
    Level = 41,
    Attain = 37,
    Aim = "Encontre uma pista sobre o paradeiro das joias nas profundezas de Uldaman.",
    Location = "Dran Droffers (Orgrimmar - A Arranca "..yellow.."59,36"..white..")",
    Note = "O Paladino está em "..yellow.."[2]"..white..".",
    Prequest = "Recuperação de colar",
    Folgequest = "Traduzindo o Diário",
}
kQuestInstanceData.Uldaman.Horde[5] = {
    Title = "Traduzindo o Diário",
    Id = 2318,
    Level = 42,
    Attain = 37,
    Aim = "Encontre alguém que possa traduzir o diário do paladino.  O local mais próximo que pode ter alguém é Kargath, em Badlands.",
    Location = "Restos Mortais de um Paladino (Uldaman "..yellow.."[2]"..white..")",
    Note = "O tradutor Jarkal Limuno está em Kargath (Ermos "..yellow.."2,46"..white..").",
    Prequest = "Recuperação de colar, Take 2",
    Folgequest = "Encontre as joias e a fonte de energia",
}
kQuestInstanceData.Uldaman.Horde[6] = {
    Title = "Encontre as joias e a fonte de energia",
    Id = 2339,
    Level = 44,
    Attain = 37,
    Aim = "Recupere todas as três joias e uma fonte de energia para o colar de Uldaman e leve-as para Jarkal Mossmeld em Kargath.  Jarkal acredita que uma fonte de energia pode ser encontrada no construto mais forte presente em Uldaman.$B$BDo diário, você sabe...$B* O rubi foi escondido em uma área barricada de Shadowforge.$B* O topázio foi escondido em uma urna em uma das áreas Trogg, perto de alguns anões da Aliança.$B* A safira foi reivindicada por Grimlok, o líder trogg.",
    Location = "Jarkal Limuno (Ermos - Kargath "..yellow.."2,46"..white..")",
    Note = "As gemas estão em "..yellow.."[1]"..white.." em uma Urna Conspícua, "..yellow.."[8]"..white.." do Esconderijo Forjassombra, e "..yellow.."[9]"..white.." de Grimlok. Note que ao abrir o Esconderijo Forjassombra, algumas criaturas surgirão e atacarão você. A Fonte de Poder do Colar Quebrado dropa de Arkhaedas "..yellow.."[10]"..white..".",
    Prequest = "Traduzindo o Diário",
    Folgequest = "Entregue as joias",
    Rewards = {
        Text = "Recompensa: ",
        { id = 7888 }, --Jarkal's Enhancing Necklace Neck
    }
}
kQuestInstanceData.Uldaman.Horde[7] = {
    Title = "Execução do reagente Uldaman",
    Id = 2202,
    Level = 42,
    Attain = 36,
    Aim = "Leve 12 cápsulas de fungo magenta para Ghak Healtouch em Thelsamar.",
    Location = "Jarkal Limuno (Ermos - Kargath "..yellow.."2,69"..white..")",
    Note = "Você pega a missão prévia de Jarkal Limuno também.\nAs tampas estão espalhadas por toda a instância. Herbalistas podem vê-las no minimapa se Rastrear Ervas estiver ativo e tiverem a missão.",
    Prequest = "Execução do reagente de Badlands",
    Folgequest = "Execução II do reagente de Badlands",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Horde[8] = {
    Title = "Tesouros Recuperados",
    Id = 2342,
    Level = 43,
    Attain = 33,
    Aim = "Pegue o bem precioso de Krom Braço Forte em seu baú no Salão Comum do Norte de Uldaman e leve-o para ele em Altaforja.",
    Location = "Patrício Garreta (Cidade Baixa "..yellow.."72,48"..white..")",
    Note = "Você encontra o tesouro antes de entrar na instância. Está no final do túnel sul. No mapa de entrada, está em "..yellow.."[5]"..white..".",
}
kQuestInstanceData.Uldaman.Horde[9] = createInheritedQuest(
    kQuestInstanceData.Uldaman.Alliance[15],
    {
        Aim = "Fale com o observador de pedra e aprenda que tradição antiga ele guarda.  Depois de aprender o que ele tem a oferecer, ative os Discos de Norgannon.",
        Note = "Depois de receber a missão, fale com o guardião de pedra à esquerda dos discos. Em seguida, use os discos de platina novamente para receber discos em miniatura, que você terá que levar para Sábio Devoto da Verdade em Penhasco do Trovão ("..yellow.."34,46"..white.."). A sequência começa com outro NPC que está por perto.",
    }
)

kQuestInstanceData.Uldaman.Horde[10] = kQuestInstanceData.Uldaman.Alliance[16]
kQuestInstanceData.Uldaman.Horde[11] = {
    Title = "Requisitando um Núcleo",
    Id = 40131,
    Level = 45,
    Attain = 45,
    Aim = "Leve um Núcleo de Poder Intacto dos Tesouros Antigos de Uldaman para Kex Blowmaster no sul dos Sertões.",
    Location = "Kex Mestredetiro (Sertões "..yellow.."45.7,83.6"..white.." goblin sob a tenda.",
    Note = "Núcleo de Energia Intacto "..yellow.."[11]"..white..", na sala com disco de platina atrás do último chefe no baú atrás do pilar direito.\nA sequência de missões começa em Sertões do Sul -> Bael Modan -> lado oeste da estrada para As Mil Agulhas, em frente à Escavação de Bael Modan. A primeira missão pode ser obtida no nível 18. A última no nível 53.",
    Prequest = "Uma aquisição lucrativa",
    Folgequest = "A ativação lucrativa",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}

--------------- Blackrock Depths ---------------
kQuestInstanceData.BlackrockDepths = {
    Story = "Antes a capital dos anões Ferro Negro, este labirinto vulcânico agora serve como sede de poder para Ragnaros, o Senhor do Fogo. Ragnaros descobriu o segredo de criar vida a partir de pedra e planeja construir um exército de golens imparáveis para ajudá-lo a conquistar toda a Montanha Rocha Negra. Obcecado em derrotar Nefarian e seus lacaios dracônicos, Ragnaros irá a qualquer extremo para alcançar a vitória final.",
    Caption = "Abismo Rocha Negra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockDepths.Alliance[1] = {
    Title = "Legado do Ferro Negro",
    Id = 3802,
    Level = 52,
    Attain = 48,
    Aim = "Fale com Franclorn Forgewright se estiver interessado em obter a chave da cidade principal.",
    Location = "Franclorn Forjífice (Montanha Rocha Negra "..yellow.."[3] on Entrance map"..white..")",
    Note = "Franclorn está no meio da rocha negra, acima de seu túmulo. Você tem que estar morto para vê-lo! Fale 2 vezes com ele para iniciar a missão.\nFineous Escurovira está em "..yellow.."[9]"..white..". Você encontra o Santuário ao lado da arena "..yellow.."[7]"..white..".",
    Prequest = "Legado do Ferro Negro",
    Rewards = {
        Text = "Recompensa: ",
        { id = 11000 }, --Shadowforge Key Key
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[2] = {
    Title = "Torneira de parafuso Ribble",
    Id = 4136,
    Level = 53,
    Attain = 48,
    Aim = "Leve a Cabeça de Ribblely para Yuka Screwpigot nas Estepes Ardentes.",
    Location = "Yuka Parafuseta (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,22"..white..")",
    Note = "Você pega a missão prévia de Yorba Parafuseta (Tanaris - Porto Engenhoca Veloz "..yellow.."67,23"..white..").\nRibbly está em "..yellow.."[15]"..white..".",
    Prequest = "Torneira de parafuso Yuka",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 11865 }, --Rancor Boots Feet, Cloth
        { id = 11963 }, --Penance Spaulders Shoulder, Leather
        { id = 12049 }, --Splintsteel Armor Chest, Mail
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[3] = {
    Title = "A poção do amor",
    Id = 4201,
    Level = 54,
    Attain = 50,
    Aim = "Leve 4 Sangue de Groms, 10 Veios de Prata Gigantes e o Frasco Cheio de Nagmara para a Senhora Nagmara nas Profundezas da Rocha Negra.",
    Location = "Lady Nagmara (Abismo Rocha Negra "..yellow.."[15]"..white..")",
    Note = "Você consegue as Veias de Prata Gigantes dos Gigantes em Azshara. Sangue-de-grom pode ser adquirido mais facilmente de um herbalista ou na Casa de Leilões. Por fim, o frasco pode ser preenchido na cratera Gol-Lakka (Cratera Un'goro "..yellow.."31,50"..white..").\nDepois de completar a missão, você pode usar a porta dos fundos em vez de matar Falange.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 11962 }, --Manacle Cuffs Wrist, Cloth
        { id = 11866 }, --Nagmara's Whipping Belt Waist, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[4] = {
    Title = "Hurley Bafo Negro",
    Id = 4126,
    Level = 55,
    Attain = 50,
    Aim = "Leve a Receita Perdida da Cerveja Trovejante para Ragnar Cerveja Trovejante em Kharanos.",
    Location = "Ragnar Cervaforte  (Dun Morogh - Kharanos "..yellow.."46,52"..white..")",
    Note = "Você pega a missão prévia de Elomara Cervaforte (Barreira do Inferno - Fortaleza de Nethergarde "..yellow.."61,18"..white..").\nVocê pega a receita de um dos guardas que aparecem se você destruir a cerveja "..yellow.."[15]"..white..".",
    Prequest = "Ragnar Cerveja Trovejante",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3",
        { id = 12003, quantity = 10 }, --Dark Dwarven Lager Potion
        { id = 11964 }, --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 }, --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[5] = {
    Title = "Incêndio!",
    Id = 4263,
    Level = 56,
    Attain = 48,
    Aim = "Encontre Lord Incendius nas Profundezas da Rocha Negra e destrua-o!",
    Location = "Jalinda Ramo (Estepes Ardentes - Vigília de Morgan "..yellow.."85,69"..white..")",
    Note = "Você pega a missão prévia de Jalinda Ramo também. Você encontra Lorde Incendius em "..yellow.."[10]"..white..".",
    Prequest = "Mestre Supremo Pyron",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12113 }, --Sunborne Cape Back
        { id = 12114 }, --Nightfall Gloves Hands, Leather
        { id = 12112 }, --Crypt Demon Bracers Wrist, Mail
        { id = 12115 }, --Stalwart Clutch Waist, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[6] = {
    Title = "O coração da montanha",
    Id = 4123,
    Level = 55,
    Attain = 50,
    Aim = "Leve o Coração da Montanha para Maxwort Uberglint nas Estepes Ardentes.",
    Location = "Maxwort Uberraio (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,23"..white..")",
    Note = "Você encontra o Coração em "..yellow.."[8]"..white.." em um cofre. Você pega a chave do cofre de Carcereiro Quietogiss. Ele aparece após abrir todos os cofres pequenos.",
}
kQuestInstanceData.BlackrockDepths.Alliance[7] = {
    Title = "As coisas boas",
    Id = 4286,
    Level = 56,
    Attain = 50,
    Aim = "Viaje para as Profundezas da Rocha Negra e recupere 20 pochetes Dark Iron. Volte para Oralius quando tiver concluído esta tarefa. Você presume que os anões Ferro Negro dentro das Profundezas da Rocha Negra carregam essas engenhocas de 'pochete'.",
    Location = "Oralius (Estepes Ardentes - Vigília de Morgan "..yellow.."84,68"..white..")",
    Note = "Todos os anões podem dropar os pacotes.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 11883 }, --A Dingy Fanny Pack Container
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[8] = {
    Title = "Marechal Windsor",
    Id = 4241,
    Level = 54,
    Attain = 48,
    Aim = "Viaje para a Montanha Rocha Negra no noroeste e entre nas Profundezas da Rocha Negra. Descubra o que aconteceu com o marechal Windsor.$B$BVocê se lembra de Ragged John falando sobre Windsor sendo arrastado para uma prisão.",
    Location = "Oficial Maxwell (Estepes Ardentes - Vigília de Morgan "..yellow.."84,68"..white..")",
    Note = "Isto faz parte da sequência de missões de sintonia com Onyxia. Começa com Helendis Flumicórnio (Estepes Ardentes - Vigília de Morgan "..yellow.."85,68"..white..").\nMarechal Vilasboas está em "..yellow.."[4]"..white..". Você tem que voltar para Maxwell depois de completar esta missão.",
    Prequest = "Ameaça Draconiana -> Os Verdadeiros Mestres",
    Folgequest = "Esperança abandonada",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12018 }, --Conservator Helm Head, Mail
        { id = 12021 }, --Shieldplate Sabatons Feet, Plate
        { id = 12041 }, --Windshear Leggings Legs, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[9] = {
    Title = "Uma nota amassada",
    Id = 4264,
    Level = 58,
    Attain = 50,
    Aim = "Você pode ter descoberto algo que o Marechal Windsor estaria interessado em ver. Afinal, pode haver esperança.",
    Location = "Nota Amassada (drop aleatório do Abismo Rocha Negra)",
    Note = "Isto faz parte da sequência de missões de sintonia com Onyxia. Marechal Vilasboas está em "..yellow.."[4]"..white..". A melhor chance de drops parece ser das criaturas Ferro Negro em torno da Pedreira.",
    Prequest = "Esperança abandonada",
    Folgequest = "Um fragmento de esperança",
}
kQuestInstanceData.BlackrockDepths.Alliance[10] = {
    Title = "Um fragmento de esperança",
    Id = 4282,
    Level = 58,
    Attain = 50,
    Aim = "Devolva as informações perdidas do Marechal Windsor.$B$BMarechal Windsor acredita que as informações estão sendo mantidas pelo Golem Lord Argelmach e pelo General Angerforge.",
    Location = "Marechal Vilasboas (Abismo Rocha Negra "..yellow.."[4]"..white..")",
    Note = "Isto faz parte da sequência de missões de sintonia com Onyxia. Marechal Vilasboas está em "..yellow.."[4]"..white.."..\nVocê encontra Lorde Golem Argelmach em "..yellow.."[14]"..white..", General Forjaversa em "..yellow.."[13]"..white..".",
    Prequest = "Uma nota amassada",
    Folgequest = "Fuga da prisão!",
}
kQuestInstanceData.BlackrockDepths.Alliance[11] = {
    Title = "Fuga da prisão!",
    Id = 4322,
    Level = 58,
    Attain = 50,
    Aim = "Ajude o Marechal Windsor a recuperar seu equipamento e libertar seus amigos. Volte para o Marechal Maxwell se tiver sucesso.",
    Location = "Marechal Vilasboas (Abismo Rocha Negra "..yellow.."[4]"..white..")",
    Note = "Isto faz parte da sequência de missões de sintonia com Onyxia. Marechal Vilasboas está em "..yellow.."[4]"..white.."..\nA missão é mais fácil se você limpar o Ringue da Lei ("..yellow.."[6]"..white..") e o caminho até a entrada antes de iniciar o evento. Você encontra Oficial Maxwell em Estepes Ardentes - Vigília de Morgan ("..yellow.."84,68"..white..")",
    Prequest = "Um fragmento de esperança",
    Folgequest = "Encontro de Ventobravo",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3",
        { id = 12065 }, --Ward of the Elements Trinket
        { id = 12061 }, --Blade of Reckoning One-Hand, Sword
        { id = 12062 }, --Skilled Fighting Blade One-Hand, Dagger
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[12] = {
    Title = "Um Gosto de Chama",
    Id = 4024,
    Level = 58,
    Attain = 52,
    Aim = "Mostre a Cyrus Therepentous o Black Dragonflight Molt que você recebeu de Kalaran Windblade.",
    Location = "Ciro Terepento (Estepes Ardentes "..yellow.."94,31"..white..")",
    Note = "A sequência de missões começa com Velarok Lamicélere (Garganta Abrasadora "..yellow.."39,38"..white..").\nBael'Gar está em "..yellow.."[11]"..white..".",
    Prequest = "A Chama Impecável -> Um Gosto de Chama",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[13] = {
    Title = "Kharan Martelo de Poder",
    Id = 4341,
    Level = 59,
    Attain = 50,
    Aim = "Viaje para as Profundezas da Rocha Negra e encontre Kharan Mighthammer.$B$BA rei mencionou que Kharan estava sendo mantido prisioneiro lá - talvez você devesse tentar procurar uma prisão.",
    Location = "Rei Magni Barbabronze (Altaforja "..yellow.."39,55"..white..")",
    Note = "A missão prévia começa com Historiadora Real Arquefilis (Altaforja "..yellow.."38,55"..white.."). Kharan Feromalho está em "..yellow.."[2]"..white..".",
    Prequest = "As Ruínas Fumegantes de Thaurissan",
    Folgequest = "Conto de Kharan",
}
kQuestInstanceData.BlackrockDepths.Alliance[14] = {
    Title = "O Destino do Reino",
    Id = 4362,
    Level = 59,
    Attain = 50,
    Aim = "Retorne às Profundezas da Rocha Negra e resgate a Princesa Moira Barbabronze das garras malignas do Imperador Dagran Thaurissan.",
    Location = "Rei Magni Barbabronze (Altaforja "..yellow.."39,55"..white..")",
    Note = "Princesa Moira Barbabronze está em "..yellow.."[21]"..white..". Durante a luta ela pode curar Dagran. Tente interrompê-la sempre que possível, mas apresse-se pois ela não deve morrer ou você não poderá completar a missão! Após falar com ela, você deve retornar a Magni Barbabronze.",
    Prequest = "O portador de más notícias",
    Folgequest = "A surpresa da princesa",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12548 }, --Magni's Will Ring
        { id = 12543 }, --Songstone of Ironforge Ring
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[15] = {
    Title = "Sintonização com o Núcleo",
    Id = 7848,
    Level = 60,
    Attain = 55,
    Aim = "Aventure-se no portal de entrada do Núcleo Derretido nas Profundezas da Rocha Negra e recupere um Fragmento de Núcleo. Volte para Lothos Riftwaker na Montanha Rocha Negra quando tiver recuperado o Fragmento de Núcleo.",
    Location = "Lothos Fendespéril (Montanha Rocha Negra "..yellow.."[2] on Entrance Map"..white..")",
    Note = "Após completar esta missão, você pode usar a pedra ao lado de Lothos Fendespéril para entrar no Núcleo Derretido.\nVocê encontra o Fragmento do Núcleo perto de "..yellow.."[23]"..white..", muito próximo ao portal do Núcleo Derretido.",
}
kQuestInstanceData.BlackrockDepths.Alliance[16] = {
    Title = "O desafio",
    Id = 9015,
    Level = 60,
    Attain = 58,
    Aim = "Viaje até o Círculo da Lei nas Profundezas da Rocha Negra e coloque a Bandeira da Provocação em seu centro enquanto você é sentenciado pelo Supremo Juiz Grimstone.  Mate Theldren e seus gladiadores e retorne para Anthion Harmon nas Terras Pestilentas Orientais com a primeira peça do amuleto de Lord Valthalak.",
    Location = "Falrin Arboril (Gládio Cruel West "..yellow.."[1] Library"..white..")",
    Note = "A missão seguinte é diferente para cada classe. A sequência inteira começa com a missão 'Uma proposta séria' de Deliana Altaforja na sala do Rei atrás do Banco",
    Prequest = "O Encantamento do Instigador",
    Folgequest = "(Class Quests)",
}
kQuestInstanceData.BlackrockDepths.Alliance[17] = {
    Title = "O Cálice Espectral",
    Id = 4083,
    Level = 55,
    Attain = 40,
    Aim = "As gemas não fazem som ao caírem nas profundezas do cálice...",
    Location = "Umbra'rel (Abismo Rocha Negra "..yellow.."[18]"..white..")",
    Note = red.."Apenas Mineradores com habilidade 230 ou maior podem pegar esta missão para aprender Fundir Ferro Sombrio."..white.." Materiais para o Cálice: 2 [Rubi Estelar], 20 [Barra de Arcanita], 10 [Barra de Veraprata]. Depois, se você tiver [Minério de Ferro Sombrio], pode levá-lo à Forja Negra em "..yellow.."[22]"..white.." e Fundi-lo.",
}
kQuestInstanceData.BlackrockDepths.Alliance[18] = {
    Title = "Operação Ajuda Jabbey",
    Id = 40757,
    Level = 58,
    Attain = 50,
    Aim = "Aventure-se nas Profundezas da Rocha Negra e recupere o 'Rapé Extremamente Potente' de Darneg Barba Negra perto do Domicílio, para Jabbey no Porto Steamwheedle em Tanaris.",
    Location = "Jebbs (Tanaris, Porto Steamwheedle "..yellow.."67,24"..white..")",
    Note = "A sequência de missões começa com Bixxle Parafuscado (Tel'Abim "..yellow.."52,34"..white.."). Drop de Darneg Umbrabarba. Recompensas da missão Operação Reparos Finais (Colares) e da missão final - O Profanador de Ferro Sombrio (Arma).",
    Prequest = "Operação Screwfuse 1000 -> Operação FIX Screwfuse 1000",
    Folgequest = "Operação Ajuda Jabbey 2 -> Operação Retorno ao Screwfuse -> Operação Reparos Finais -> Segredos do Profanador Ferro Negro -> O Profanador Ferro Negro",
    Rewards = {
        Text = "Recompensa: 1 ou 2 e 3",
        { id = 60996 }, --Bixxle's Necklace of Control Neck
        { id = 60997 }, --Bixxle's Necklace of Mastery Neck
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[19] = {
    Title = "O Profanador Ferro Negro",
    Id = 40762,
    Level = 60,
    Attain = 55,
    Aim = "Colete um Rifle de Ferro Negro, um Condensador de Magma, um Barril de Arcanita Intrincado e um Fragmento Derretido para o Fusível Bixxle no Armazém de Bixxle em Tel'Abim.",
    Location = "Bixxle Parafuscado (Ilha de Tel'Abim a leste de Tanaris)",
    Note = "Esta missão requer coletar 4 itens.\n1) Condensador de Magma (Abismo Rocha Negra no Caixa de Condensador de Magma) \n2) Barril Intricado de Arcanita (Pico da Rocha Negra no container de Barris Intricados de Arcanita)\n3) Fragmento Fundido (Núcleo Derretido de Destruidor Derretido).\n4) Rifle de Ferro Sombrio (criado por Engenheiros).\nPara terminar a construção, também precisarei de Núcleo Ardente(x3) encontrado no Núcleo Derretido, e Barras Encantadas de Tório(x10).",
    Prequest = "Operação Ajuda Jabbey -> Segredos do Profanador Ferro Negro",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[20] = {
    Title = "Vingança Senador",
    Id = 40464,
    Level = 56,
    Attain = 45,
    Aim = "Mate 25 Senadores da Forja Sombria nas profundezas das Profundezas da Rocha Negra para Orvak Sternrock na Passagem da Rocha Negra, nas Estepes Ardentes.",
    Location = "Orvak Pedraaustera (após passar Montanhas Cristarrubra - Estepes Ardentes "..yellow.."76,68"..white..", oeste do acampamento da aliança)",
    Note = "Esta sequência de missões começa com Radgan Chama Profunda ao lado de Orvak Pedraaustera com a missão 'Ganhando a confiança de Orvak'",
    Prequest = "Ganhando a confiança de Orvak -> Ouvindo a história de Orvak -> O esconderijo Sternrock",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60668 }, --Badge of Shadowforge Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[21] = {
    Title = "O Núcleo do Golem Arcano",
    Id = 40467,
    Level = 55,
    Attain = 45,
    Aim = "Encontre e colete um Núcleo de Golem Arcano do Lorde Golem Argelmach nas Profundezas da Rocha Negra e retorne para Radgan Chama Profunda na Passagem da Rocha Negra nas Estepes Ardentes.",
    Location = "Radgan Chama Profunda (após passar Montanhas Cristarrubra - Estepes Ardentes "..yellow.."76,68"..white..", oeste do acampamento da aliança)",
    Note = "Esta sequência de missões começa com Radgan Chama Profunda ao lado de Orvak Pedraaustera com a missão 'Ganhando a confiança de Orvak'",
    Prequest = "Ganhando a confiança de Orvak -> Ouvindo a história de Orvak -> O esconderijo Sternrock -> Descobrindo os segredos do Golem -> Para adquirir informações secretas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60672 }, --Energized Golem Core Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[22] = {
    Title = "Para construir um Pounder",
    Id = 80401,
    Level = 60,
    Attain = 30,
    Aim = "Adquira o Thorium Tuned Servo do Arsenal do Monastério Escarlate, obtenha o Perfect Golem Core nas Blackrocks Depths do Golem Lord Argelmach, encontre o Adamantite Rod em Stratholme. Retorne para Oglethorpe Obnoticus.",
    Location = "Olhatorto Obnótico <Master Engenheiro Gnomo> (Selva do Espinhaço; Angra do Butim "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Apenas Engenheiros)"..white.."Esta missão requer coletar 3 itens. \n1) Servo Afinado de Tório (Monastério Escarlate de Mirmidão Escarlate)\n2) Núcleo de Golem Perfeito (Abismo Rocha Negra de Lorde Golem Argelmach)\n3) Vara de Adamantita (Stratholme de Forjador de Martelos Carmesim)\n'Espanca-gente 9-60' em Gnomeregan dropa 'Mainframe de Impacto Intacto' que inicia a Missão Prévia 'Um cérebro forte'.",
    Prequest = "Um cérebro forte"..red.."(Engineers only)", --80398
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[23] = {
    Title = "Cerveja Véu de Inverno",
    Id = 40748,
    Level = 55,
    Attain = 45,
    Aim = "Recupere o Barril do Véu de Inverno nas cavernas das Profundezas da Rocha Negra para o Machado de Fogo Bomarn no Vale do Véu de Inverno.",
    Location = "Bomarn Machado de Fogo  at Vale do Véu de Inverno",
    Note = red.."DISPONÍVEL APENAS durante o evento de feriado Festa do Solstício de Inverno!"..white.."Aqueles malditos Ferro Negro roubaram, sem dúvida escondido em sua taverna "..yellow.."[15]"..white.." nas profundezas do Abismo Rocha Negra.",
}
for i = 1, 3 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end
kQuestInstanceData.BlackrockDepths.Horde[4] = {
    Title = "Receita perdida de Thunderbrew",
    Id = 4134,
    Level = 55,
    Attain = 50,
    Aim = "Leve a Receita Perdida da Cerveja Trovejante para Vivian Lagrave em Kargath.",
    Location = "Umbramante Vivian Latumba (Ermos - Kargath "..yellow.."2,47"..white..")",
    Note = "Você pega a missão prévia de Boticária Zilda na Cidade Baixa - O Apotecário ("..yellow.."50,68"..white..").\nVocê pega a receita de um dos guardas que aparecem se você destruir a cerveja "..yellow.."[15]"..white..".",
    Prequest = "Viviane Lagrave",
    Rewards = {
        Text = "Recompensa: 1 e 2 e 3 ou 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 11964 }, --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 }, --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Horde[5] = {
    Title = "O coração da montanha",
    Id = 4123,
    Level = 55,
    Attain = 50,
    Aim = "Leve o Coração da Montanha para Maxwort Uberglint nas Estepes Ardentes.",
    Location = "Maxwort Uberraio (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,23"..white..")",
    Note = "Você encontra o Coração em "..yellow.."[8]"..white.." em um cofre. Você pega a chave do cofre de Carcereiro Quietogiss. Ele aparece após abrir todos os cofres pequenos.",
}
kQuestInstanceData.BlackrockDepths.Horde[6] = {
    Title = "MATAR À VISTA: Anões Ferro Negro",
    Id = 4081,
    Level = 52,
    Attain = 48,
    Aim = "Aventure-se nas Profundezas da Rocha Negra e destrua os agressores vis!$B$BSenhor da Guerra Trincador quer que você mate 15 Guardas Forjadasbiga, 10 Guardiões Forjadasbiga e 5 Lacaios Forjadasbiga. Volte para ele assim que sua tarefa for concluída.",
    Location = "Sign Post (Ermos - Kargath "..yellow.."3,47"..white..")",
    Note = "Você encontra os anões na primeira parte do Abismo Rocha Negra.\nVocê encontra Senhor da Guerra Trincador em Kargath no topo da torre (Ermos, "..yellow.."5,47"..white..").",
    Folgequest = "MATAR À VISTA: Oficiais Dark Iron de alto escalão",
}
kQuestInstanceData.BlackrockDepths.Horde[7] = {
    Title = "MATAR À VISTA: Oficiais Dark Iron de alto escalão",
    Id = 4082,
    Level = 54,
    Attain = 50,
    Aim = "Aventure-se nas Profundezas da Rocha Negra e destrua os agressores vis!$B$BSenhor da Guerra Trincador quer que você mate 10 Médicos Forjadasbiga, 10 Soldados Forjadasbiga e 10 Oficiais Forjadasbiga. Volte para ele assim que sua tarefa for concluída.",
    Location = "Sign Post (Ermos - Kargath "..yellow.."3,47"..white..")",
    Note = "Você encontra os anões perto de Bael'gar "..yellow.."[11]"..white..". Você encontra Senhor da Guerra Trincador em Kargath no topo da torre (Ermos, "..yellow.."5,47"..white..").\nA missão seguinte começa com Lexlort (Ermos - Kargath "..yellow.."5,47"..white.."). Você encontra Grark Lorkrub nas Estepes Ardentes ("..yellow.."38,35"..white.."). Você deve reduzir sua vida abaixo de 50% para amarrá-lo e iniciar uma missão de Escolta.",
    Prequest = "MATAR À VISTA: Anões Ferro Negro",
    Folgequest = "Grark Lorkrub -> Situação Precária (Escort quest)",
}
kQuestInstanceData.BlackrockDepths.Horde[8] = {
    Title = "Operação: Morte a Angerforge",
    Id = 4132,
    Level = 58,
    Attain = 52,
    Aim = "Viaje para as Profundezas da Rocha Negra e mate o General Forjaversa! Retorne ao Senhor da Guerra Trincador quando a tarefa for concluída.",
    Location = "Senhor da Guerra Trincador (Ermos - Kargath "..yellow.."5,47"..white..")",
    Note = "Você encontra General Forjaversa em "..yellow.."[13]"..white..". Ele chama ajuda abaixo de 30%!\nA sequência de missões começa com Lexlort (Ermos - Kargath, na torre) com a missão 'Grark Lorkrub'.",
    Prequest = "Grark Lorkrub -> Situação Precária",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12059 }, --Conqueror's Medallion Neck
    }
}
kQuestInstanceData.BlackrockDepths.Horde[9] = {
    Title = "A ascensão das máquinas",
    Id = 4063,
    Level = 58,
    Attain = 52,
    Aim = "Aventure-se nas Estepes Ardentes e recupere 10 Fragmentos Elementais Fraturados para a Hierofante Theodora Mulvadania.$B$BVocê se lembra de Theodora mencionando os golens e elementais daquela região como sendo uma fonte para esses fragmentos.",
    Location = "Lotwil Viriato (Ermos "..yellow.."25,44"..white..")",
    Note = "Você pega a missão prévia de Hierofante Theodora Malvadania (Ermos - Kargath "..yellow.."3,47"..white..").\nVocê encontra Argelmach em "..yellow.."[14]"..white..".",
    Prequest = "A ascensão das máquinas",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12109 }, --Azure Moon Amice Back
        { id = 12110 }, --Raincaster Drape Back
        { id = 12108 }, --Basaltscale Armor Chest, Mail
        { id = 12111 }, --Lavaplate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Horde[10] = {
    Title = "Um Gosto de Chama",
    Id = 4024,
    Level = 58,
    Attain = 52,
    Aim = "Mostre a Cyrus Therepentous o Black Dragonflight Molt que você recebeu de Kalaran Windblade.",
    Location = "Ciro Terepento (Estepes Ardentes "..yellow.."94,31"..white..")",
    Note = "A sequência de missões começa com Velarok Lamicélere (Garganta Abrasadora "..yellow.."39,38"..white..").\nBael'Gar está em "..yellow.."[11]"..white..".",
    Prequest = "A Chama Impecável -> Um Gosto de Chama",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Horde[11] = {
    Title = "Desarmonia do Fogo",
    Id = 3907,
    Level = 56,
    Attain = 48,
    Aim = "Entre nas Profundezas da Rocha Negra e localize Lord Incendius. Mate-o e devolva qualquer fonte de informação que encontrar para Thunderheart.",
    Location = "Coração Trovejante (Ermos - Kargath "..yellow.."3,48"..white..")",
    Note = "Você pega a missão prévia de Coração Trovejante também.\nVocê encontra Lorde Incendius em "..yellow.."[10]"..white..".",
    Prequest = "Desarmonia da Chama",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12113 }, --Sunborne Cape Back
        { id = 12114 }, --Nightfall Gloves Hands, Leather
        { id = 12112 }, --Crypt Demon Bracers Wrist, Mail
        { id = 12115 }, --Stalwart Clutch Waist, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Horde[12] = {
    Title = "The Last Element",
    Id = 3911,
    Level = 54,
    Attain = 48,
    Aim = "Viaje para as Profundezas da Rocha Negra e recupere 10 Essências dos Elementos. Sua primeira inclinação é procurar nos golens e fabricantes de golens. Você se lembra de Vivian Lagrave também murmurando algo sobre elementais.",
    Location = "Umbramante Vivian Latumba (Ermos - Kargath "..yellow.."2,47"..white..")",
    Note = "Você pega a missão prévia de Coração Trovejante (Ermos - Kargath "..yellow.."3,48"..white..").\nQualquer elemental pode dropar a Essência",
    Prequest = "Desarmonia da Chama",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12038 }, --Lagrave's Seal Ring
    }
}
kQuestInstanceData.BlackrockDepths.Horde[13] = {
    Title = "Comandante Gor'shak",
    Id = 3981,
    Level = 52,
    Attain = 48,
    Aim = "Encontre o Comandante Gor'shak nas Profundezas da Rocha Negra.$B$BVocê se lembra que a imagem grosseiramente desenhada do orc incluía barras desenhadas sobre o retrato. Talvez você devesse procurar algum tipo de prisão.",
    Location = "Galamav, o Atirador Perito (Ermos - Kargath "..yellow.."5,47"..white..")",
    Note = "Você pega a missão prévia de Coração Trovejante (Ermos - Kargath "..yellow.."3,48"..white..").\nVocê encontra Comandante Gor'shak em "..yellow.."[3]"..white..". A chave para abrir a prisão dropa de Suprema Interrogadora Gerstahn "..yellow.."[5]"..white..". Se você falar com ele e iniciar a próxima Missão, inimigos aparecem.",
    Prequest = "Desarmonia da Chama",
    Folgequest = "O que está acontecendo?",
}
kQuestInstanceData.BlackrockDepths.Horde[14] = {
    Title = "O resgate real",
    Id = 4003,
    Level = 59,
    Attain = 48,
    Aim = "Mate o Imperador Dagran Thaurissan e liberte a Princesa Moira Bronzebeard de seu feitiço maligno. ",
    Location = "Thrall (Orgrimmar "..yellow.."31,37"..white..")",
    Note = "Após falar com Kharan Feromalho e Thrall você recebe esta missão.\nVocê encontra Imperador Dagran Thaurissan em "..yellow.."[21]"..white..". A Princesa cura Dagran mas você não deve matá-la para completar a missão! Tente interromper seus feitiços de cura. (Recompensas são de A Princesa Salva?)",
    Prequest = "Comandante Gor'shak -> O que está acontecendo? (x2) -> O Reino do Leste",
    Folgequest = "A princesa salva?",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12544 }, --Thrall's Resolve Ring
        { id = 12545 }, --Eye of Orgrimmar Ring
    }
}
for i = 15, 23 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end

--------------- Blackwing Lair ---------------
kQuestInstanceData.BlackwingLair = {
    Story = {
	    ["Page1"] = "Covil da Asa Negra pode ser encontrado no ponto mais alto da Cidadela da Rocha Negra. É lá, nos recessos escuros do pico da montanha, que Nefarian começou a desdobrar os estágios finais de seu plano para destruir Ragnaros de uma vez por todas e levar seu exército à supremacia indiscutível sobre todas as raças de Azeroth.",
        ["Page2"] = "A poderosa fortaleza esculpida nas entranhas ardentes da Montanha Rocha Negra foi projetada pelo mestre anão-pedreiro, Franclorn Forjaférrea. Destinada a ser o símbolo do poder dos Anões Ferro Negro, a fortaleza foi mantida pelos anões sinistros por séculos. No entanto, Nefarian - o astuto filho do dragão Asa da Morte - tinha outros planos para a grande fortaleza. Ele e seus lacaios dracônicos assumiram o controle do Pico superior e travaram guerra contra as posses dos anões nas profundezas vulcânicas da montanha, que servem como sede de poder para Ragnaros, o Senhor do Fogo. Ragnaros descobriu o segredo para criar vida a partir da pedra e planeja construir um exército de golens imparáveis para ajudá-lo a conquistar toda a Montanha Rocha Negra.",
        ["Page3"] = "Nefarian prometeu esmagar Ragnaros. Para este fim, ele recentemente começou a reforçar suas forças, assim como seu pai Asa da Morte tentou fazer em eras passadas. No entanto, onde Asa da Morte falhou, agora parece que o astuto Nefarian pode estar tendo sucesso. A louca tentativa de Nefarian por domínio até mesmo atraiu a ira do Voo Dragônico Vermelho, que sempre foi o maior inimigo do Voo Negro. Embora as intenções de Nefarian sejam conhecidas, os métodos que ele está usando para alcançá-las permanecem um mistério. Acredita-se, no entanto, que Nefarian tem experimentado com o sangue de todos os vários Voos Dragônicos para produzir guerreiros imparáveis.\n \nO santuário de Nefarian, Covil da Asa Negra, pode ser encontrado no ponto mais alto da Cidadela da Rocha Negra. É lá, nos recessos escuros do pico da montanha, que Nefarian começou a desdobrar os estágios finais de seu plano para destruir Ragnaros de uma vez por todas e levar seu exército à supremacia indiscutível sobre todas as raças de Azeroth.",
        ["MaxPages"] = "3",
	},
    Caption = {
        "Covil da Asa Negra",
        "Covil da Asa Negra (Parte da História 1)",
        "Covil da Asa Negra (Parte da História 2)",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackwingLair.Alliance[1] = {
    Title = "A corrupção de Nefarius",
    Id = 8730,
    Level = 60,
    Attain = 60,
    Aim = "Mate Nefarian e recupere o Fragmento do Cetro Vermelho. Devolva o Fragmento do Cetro Vermelho para Anachronos nas Cavernas do Tempo em Tanaris. Você tem 5 horas para concluir esta tarefa.",
    Location = "Vaelastrasz, o Corrupto (Covil Asa Negra "..yellow.."[2]"..white..")",
    Note = "Apenas uma pessoa pode saquear o Fragmento. Anacronos (Tanaris - Cavernas do Tempo "..yellow.."65,49"..white..")",
    Prequest = "Encomienda a los Vuelos",
    Folgequest = "O Poder de Kalimdor (Deve completar as sequências de missões verde e azul também)",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 21530 }, --Onyx Embedded Leggings Legs, Mail
        { id = 21529 }, --Amulet of Shadow Shielding Neck
    }
}
kQuestInstanceData.BlackwingLair.Alliance[2] = {
    Title = "O Senhor da Rocha Negra",
    Id = 7781,
    Level = 60,
    Attain = 60,
    Aim = "Devolva a Cabeça de Nefarian ao Grão-lorde Bolvar Fordragon em Ventobravo.",
    Location = "Cabeça de Nefarian (dropada de Nefarian "..yellow.."[9]"..white..")",
    Note = "Grão-lorde Bolvar Fordragon está em (Ventobravo - Castelo de Ventobravo "..yellow.."78,20"..white.."). A sequência seguinte envia você para Marechal de Campo Afrasiabi (Ventobravo - Vale dos Heróis "..yellow.."67,72"..white..") para a recompensa.",
    Folgequest = "O Senhor da Rocha Negra",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 19383 }, --Master Dragonslayer's Medallion Neck
        { id = 19366 }, --Master Dragonslayer's Orb Held In Off-hand
        { id = 19384 }, --Master Dragonslayer's Ring Ring
    }
}
kQuestInstanceData.BlackwingLair.Alliance[3] = {
    Title = "Apenas Um Pode Subir",
    Id = 8288,
    Level = 60,
    Attain = 60,
    Aim = "Devolva a Cabeça do Açoitador do Senhor da Ninhada para Baristolth das Areias Mutáveis, no Forte Cenariano, em Silithus.",
    Location = "Cabeça do Senhor das Camadas Flagelador (dropada de Mestre do Chicote Flagelador "..yellow.."[3]"..white..")",
    Note = "Apenas uma pessoa pode pegar a cabeça.",
    Prequest = "O que o amanhã traz",
    Folgequest = "O Caminho dos Justos",
}
kQuestInstanceData.BlackwingLair.Alliance[4] = {
    Title = "A única receita",
    Id = 8620,
    Level = 60,
    Attain = 60,
    Aim = "Recupere os 8 capítulos perdidos de Dracônico para Leigos e combine-os com a Encadernação de Livro Mágico e devolva o livro completo de Dracônico para Leigos: Volume II para Narain Suavefantasia em Tanaris.",
    Location = "Narain Suavestilo (Tanaris "..yellow.."65,18"..white..")",
    Note = "O capítulo pode ser saqueado por várias pessoas. Dracônico para Leigos (saqueado de uma mesa "..green.."[2']"..white..")",
    Prequest = "Chamariz!",
    Folgequest = "As boas e as más notícias (Deve completar as sequências de missões Stewvul, Ex-Melhor Amigo e Nunca Me Pergunte Sobre Meus Negócios)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.BlackwingLair.Alliance[5] = {
    Title = "A chave para Karazhan IX",
    Id = 40828,
    Level = 60,
    Attain = 58,
    Aim = "Encontre o 'Tratado sobre Fechaduras e Chaves Mágicas' e leve-o de volta para Vandol. Há rumores de que é mantido em Blackwing Lair.",
    Location = "Dolvan Bracewind (Pântano Vadeoso - Vale Westhaven  "..yellow.."71,73"..white..")",
    Note = "Missão prévia - Lorde Ebanez (Salões Inferiores de Karazhan). O livro 'Tratado sobre Fechaduras e Chaves Mágicas' está na sala do último chefe "..yellow.."[9]"..white..", ao lado do trono. Recompensa da próxima missão.",
    Prequest = "A chave para Karazhan VIII (DMW)",
    Folgequest = "A chave para Karazhan X",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61234 }, --Upper Karazhan Tower Key Key
    }
}
kQuestInstanceData.BlackwingLair.Alliance[6] = {
    Title = "Foice da Deusa",
    Id = 41067,
    Level = 60,
    Attain = 58,
    Aim = "Mate Clawlord Howlfang e apresente-se a Lord Ebonlocke.",
    Location = "Arquidruida Brisasonho (Hyjal - Nordanaar "..yellow.."84.8,29.3"..white.." andar superior da grande árvore)",
    Note = "Nefarian "..yellow.."[9]"..white.." dropa 'Cópia Queimada de Vorgendor'.\nA sequência de missões começa com drop raro de item lendário 'A Foice de Elune' do chefe Lorde Blackwald II em "..yellow.."[Karazhan]"..white..".",
    Prequest = "Foice da Deusa",
    Folgequest = "Foice da Deusa"..yellow.."[Upper Karazhan]"..white.." ", -- 41087
}
kQuestInstanceData.BlackwingLair.Horde[1] = kQuestInstanceData.BlackwingLair.Alliance[1]
kQuestInstanceData.BlackwingLair.Horde[2] = {
    Title = "O Senhor da Rocha Negra",
    Id = 7783,
    Level = 60,
    Attain = 60,
    Aim = "Devolva a Cabeça de Nefarian ao Grão-lorde Bolvar Fordragon em Ventobravo.",
    Location = "Cabeça de Nefarian (dropada de Nefarian "..yellow.."[9]"..white..")",
    Note = "A sequência seguinte envia você para Lorde Supremo Saurfang (Orgrimmar - Vale da Força "..yellow.."51,76"..white..") para a recompensa.",
    Folgequest = "O Senhor da Rocha Negra",
    Rewards = kQuestInstanceData.BlackwingLair.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.BlackwingLair.Horde[i] = kQuestInstanceData.BlackwingLair.Alliance[i]
end

--------------- Profundezas Deeps ---------------
kQuestInstanceData.BlackfathomDeeps = {
    Story = "Situada ao longo da Costa de Zoram de Vila Gris, as Profundezas Negras já foi um templo glorioso dedicado à deusa da lua dos elfos noturnos, Elune. No entanto, o grande Cataclismo destruiu o templo - afundando-o sob as ondas do Mar Velado. Lá permaneceu intocado - até que, atraídos por seu poder antigo - os naga e sátiros emergiram para sondar seus segredos. Lendas afirmam que a besta antiga, Aku'mai, tomou residência nas ruínas do templo. Aku'mai, um animal de estimação favorito dos primordiais Deuses Antigos, tem predado a área desde então. Atraído pela presença de Aku'mai, o culto conhecido como Martelo do Crepúculo também veio para se banhar na presença maligna dos Deuses Antigos.",
    Caption = "Profundezas Negras",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackfathomDeeps.Alliance[1] = {
    Title = "Conhecimento nas profundezas",
    Id = 971,
    Level = 23,
    Attain = 10,
    Aim = "Leve o Manuscrito de Lordalis para Gerrig Bonegrip na Caverna Esquecida em Altaforja.",
    Location = "Gerrig Agarrosso (Altaforja - A Caverna Desolada "..yellow.."50,5"..white..")",
    Note = "Você encontra o Manuscrito em "..yellow.."[2]"..white.." na água.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6743 }, --Sustaining Ring Ring
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[2] = {
    Title = "Pesquisando a corrupção",
    Id = 1275,
    Level = 24,
    Attain = 18,
    Aim = "Gershala Nightwhisper em Auberdine quer 8 troncos cerebrais corrompidos.",
    Location = "Gershala Umbrurmúrio (Costa Negra - Auberdine "..yellow.."38,43"..white..")",
    Note = "Você pega de Argos Umbrurmúrio em (Ventobravo - O Parque "..yellow.."21,55"..white.."). \n\nTodos os Nagas antes e dentro das Profundezas Negras dropam os cérebros.",
    Prequest = "A corrupção no exterior",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 7003 }, --Beetle Clasps Wrist, Mail
        { id = 7004 }, --Prelacy Cape Back
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[3] = {
    Title = "Em Busca de Thaelrid",
    Id = 1198,
    Level = 24,
    Attain = 18,
    Aim = "Procure o Guarda Argênteo Thaelrid nas Profundezas Negras.",
    Location = "Vigilalva Saedlass (Darnassus - Terraço dos Artesãos "..yellow.."55,24"..white..")",
    Note = "Você encontra Guarda Argênteo Thaelrid em "..yellow.."[4]"..white..".",
    Folgequest = "Vilania Negra",
}
kQuestInstanceData.BlackfathomDeeps.Alliance[4] = {
    Title = "Vilania Negra",
    Id = 1200,
    Level = 27,
    Attain = 18,
    Aim = "Leve a cabeça do Lorde do Crepúsculo Kelris para o Vigilante da Alvorada Selgorm em Darnassus.",
    Location = "Guarda Argênteo Thaelrid (Profundezas Negras "..yellow.."[4]"..white..")",
    Note = "Senhor do Crepúsculo Kelris está em "..yellow.."[8]"..white..". Você encontra Vigilalva Selgorm em Darnassus - Terraço dos Artesãos ("..yellow.."55,24"..white.."). \n\nATENÇÃO! Se você acender as chamas ao lado de Lorde Kelris, inimigos aparecem e atacam você.",
    Prequest = "Em Busca de Thaelrid",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 7001 }, --Gravestone Scepter Wand
        { id = 7002 }, --Arctic Buckler Shield
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[5] = {
    Title = "Crepúsculo cai",
    Id = 1199,
    Level = 25,
    Attain = 20,
    Aim = "Leve 10 Pingentes do Crepúsculo para o Guarda Argênteo Manados em Darnassus.",
    Location = "Guarda Argênteo Manados (Darnassus - Terraço dos Artesãos "..yellow.."55,23"..white..")",
    Note = "Qualquer criatura Crepúsculo pode dropar os pingentes.",
    Rewards = {
        Text = "Rewards:",
        { id = 6998 }, --Nimbus Boots Feet, Cloth
        { id = 7000 }, --Heartwood Girdle Waist, Leather
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[6] = {
    Title = "O Orbe de Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Encontre 3 Fragmentos de Soran'ruk e 1 Fragmento Grande de Soran'ruk e devolva-os para Doan Karhan nos Sertões.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Apenas Bruxo"..white..": Você pega os 3 Fragmentos de Soran'ruk dos Acólitos do Crepúsculo em "..yellow.."[Profundezas Negras]"..white..". Você pega o Fragmento Grande de Soran'ruk em "..yellow.."[Bastilha da Presa Negra]"..white.." das Almas Negras Dente de Shadowfang.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[7] = {
    Title = "As Ruínas do Santuário Lunar",
    Id = 41812,
    Level = 26,
    Attain = 18,
    Aim = "Aventure-se nas profundezas das Cavernas da Brazanegra e recupere uma 'Semente Florescente' das Ruínas do Santuário Lunar. Uma vez adquirida, retorne para Aelennia Florestelar a leste da Enseada Zoram em Valefresno.",
    Location = "Aelennia Florastral (Vale Gris "..yellow.."17,26"..white..")",
    Note = "'Semente da Floração' estão localizados sob a árvore ao lado "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa:",
        { id = 41919 }, --Starbloom Ring
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[1] = {
    Title = "A Essência de Aku'Mai",
    Id = 6563,
    Level = 22,
    Attain = 17,
    Aim = "Leve 20 safiras de Aku'Mai para Je'neu Sancrea no Vale Gris.",
    Location = "Je'neu Sancrea (Vale Gris - Posto Zoram'gar "..yellow.."11,33"..white..")",
    Note = "Você pega a missão prévia Problemas nas Profundezas de Tsunomem (Cordilheira das Torres de Pedra - Retiro Sol Rock "..yellow.."47,64"..white.."). Os cristais podem ser encontrados nos túneis antes da instância.",
    Prequest = "Problemas nas Profundezas",
    Folgequest = "Entre as ruínas",
}
kQuestInstanceData.BlackfathomDeeps.Horde[2] = {
    Title = "Fidelidade aos Deuses Antigos",
    Id = 6565,
    Level = 26,
    Attain = 17,
    Aim = "Leve o Bilhete Úmido para Je'neu Sancrea no Vale Gris.",
    Location = "Nota Úmida (drop - see note)",
    Note = "Você pega a Nota Úmida de Sacerdotisa da Maré das Profundezas Negras (5% de chance de drop). Então leve-a para Je'neu Sancrea (Vale Gris - Posto Zoram'gar "..yellow.."11,33"..white.."). Lorgus Jett está em "..yellow.."[6]"..white..".",
    Prequest = "Fidelidade aos Deuses Antigos",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 17694 }, --Band of the Fist Ring
        { id = 17695 }, --Chestnut Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[3] = {
    Title = "Entre as ruínas",
    Id = 908,
    Level = 27,
    Attain = 21,
    Aim = "Leve o Núcleo Profundo para Je'neu Sancrea no Posto Avançado Zoram'gar, Vale Gris.",
    Location = "Je'neu Sancrea (Vale Gris - Posto Zoram'gar "..yellow.."11,33"..white..")",
    Note = "Você encontra o Núcleo de Fathom em "..yellow.."[7]"..white.." na água. Quando você pega o núcleo, Barão Aquanis aparece e ataca você. Ele dropa um item de missão que você deve levar de volta para Je'neu Sancrea.",
}
kQuestInstanceData.BlackfathomDeeps.Horde[4] = {
    Title = "Vilania Negra",
    Id = 6561,
    Level = 27,
    Attain = 18,
    Aim = "Leve a cabeça do Lorde do Crepúsculo Kelris para o Vigilante da Alvorada Selgorm em Darnassus.",
    Location = "Argent guard Thaelrid (Profundezas Negras "..yellow.."[4]"..white..")",
    Note = "Senhor do Crepúsculo Kelris está em "..yellow.."[8]"..white..". Você encontra Bashana Runa Totem em Penhasco do Trovão - O Elevado dos Anciãos ("..yellow.."70,33"..white.."). \n\nATENÇÃO! Se você acender as chamas ao lado de Lorde Kelris, inimigos aparecem e atacam você.",
    Rewards = kQuestInstanceData.BlackfathomDeeps.Alliance[4].Rewards
}
kQuestInstanceData.BlackfathomDeeps.Horde[5] = {
    Title = "O Orbe de Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Encontre 3 Fragmentos de Soran'ruk e 1 Fragmento Grande de Soran'ruk e devolva-os para Doan Karhan nos Sertões.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Apenas Bruxo"..white..": Você pega os 3 Fragmentos de Soran'ruk dos Acólitos do Crepúsculo em "..yellow.."[Profundezas Negras]"..white..". Você pega o Fragmento Grande de Soran'ruk em "..yellow.."[Bastilha da Presa Negra]"..white.." das Almas Negras Dente de Shadowfang.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[6] = {
    Title = "Barão Aquanis",
    Id = 909,
    Level = 30,
    Attain = 21,
    Aim = "Leve o Estranho Globo de Água para Je'neu Sancrea no Posto Avançado Zoram'gar, Vale Gris.",
    Location = "Globo d'Água Estranho (Profundezas Negras "..yellow.."[7]"..white..")",
    Note = "Usar a Pedra de Fathom "..yellow.."[7]"..white.." para a missão #3 invoca Barão Aquanis. Ele dropa Globo d'Água Estranho que inicia a missão.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 16886 }, --Outlaw Sabre One-Hand, Sword
        { id = 16887 }, --Witch's Finger Held In Off-hand
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[7] = kQuestInstanceData.BlackfathomDeeps.Alliance[7]

--------------- Lower Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireLower = {
    Story = "A poderosa fortaleza esculpida nas entranhas ardentes da Montanha Rocha Negra foi projetada pelo mestre pedreiro-anão, Franclorn Forgewright. Destinada a ser o símbolo do poder Ferro Negro, a fortaleza foi mantida pelos anões sinistros por séculos. No entanto, Nefarian - o astuto filho do dragão, Asa da Morte - tinha outros planos para a grande fortaleza. Ele e seus lacaios dracônicos tomaram controle do Pico superior e fizeram guerra nas posses dos anões nas profundezas vulcânicas da montanha. Percebendo que os anões eram liderados pelo poderoso elemental de fogo, Ragnaros - Nefarian jurou esmagar seus inimigos e reivindicar toda a Montanha Rocha Negra para si.",
    Caption = "Lower Pico da Rocha Negra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireLower.Alliance[1] = {
    Title = "As Tábuas Finais",
    Id = 4788,
    Level = 58,
    Attain = 40,
    Aim = "Leve a Quinta e a Sexta Tábuas de Mosh'aru para o Prospector Bota de Ferro em Tanaris.",
    Location = "Prospector Botaférrea (Tanaris - Porto Steamwheedle "..yellow.."66,23"..white..")",
    Note = "Você encontra as tábuas perto de "..yellow.."[7]"..white.." e "..yellow.."[9]"..white.."..\nAs Recompensas pertencem a 'Enfrente Yeh'kinya'. Você encontra Yeh'kinya perto de Prospector Botaférrea.",
    Prequest = "As Tábuas Perdidas de Mosh'aru",
    Folgequest = "Enfrente Yeh'kinya",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 20218 }, --Faded Hakkari Cloak Back
        { id = 20219 }, --Tattered Hakkari Cape Back
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[2] = {
    Title = "Animais de estimação exóticos de Kibler",
    Id = 4729,
    Level = 59,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e encontre filhotes de Worg Machado Sangrento. Use a gaiola para carregar os feras ferozes. Traga de volta um filhote de Worg enjaulado para Kibler.",
    Location = "Kibler (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,22"..white..")",
    Note = "Você encontra a Copa Worg em "..yellow.."[17]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12264 }, --Worg Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[3] = {
    Title = "En-Ay-Es-Tee-Porquê",
    Id = 4862,
    Level = 59,
    Attain = 55,
    Aim = "Viaje para o Pináculo da Rocha Negra e colete 15 Ovos de Aranha do Pináculo para Kibler.$B$BBao que parece, esses ovos podem ser encontrados perto de aranhas.",
    Location = "Kibler (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,22"..white..")",
    Note = "Você encontra os ovos de aranha perto de "..yellow.."[13]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12529 }, --Smolderweb Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[4] = {
    Title = "Leite Materno",
    Id = 4866,
    Level = 60,
    Attain = 55,
    Aim = "No coração de Blackrock Spire você encontrará Mother Smolderweb. Envolva-a e faça com que ela envenene você. Há boas chances de você ter que matá-la também. Volte para Ragged John quando você estiver envenenado para que ele possa 'ordenhar' você.",
    Location = "João Roto (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,23"..white..")",
    Note = "Mãe Queimateia está em "..yellow.."[13]"..white..". O efeito de veneno prende jogadores próximos também. Se for removido ou dissipado, você falha na missão.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 15873 }, --Ragged John's Neverending Cup Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[5] = {
    Title = "Coloque-a no chão",
    Id = 4701,
    Level = 59,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e destrua a fonte da ameaça worg. Ao sair de Helendis, ele gritou um nome: Halycon. É a isso que os orcs se referem em relação ao worg.",
    Location = "Helendis Flumicórnio (Estepes Ardentes - Vigília de Morgan "..yellow.."5,47"..white..")",
    Note = "Você encontra Halycon em "..yellow.."[17]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 15824 }, --Astoria Robes Chest, Cloth
        { id = 15825 }, --Traphook Jerkin Chest, Leather
        { id = 15827 }, --Jadescale Breastplate Chest, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[6] = {
    Title = "Urok Uivo da Perdição",
    Id = 4867,
    Level = 60,
    Attain = 55,
    Aim = "Leia o pergaminho de Warosh.  Leve o Mojo de Warosh para Warosh.",
    Location = "Warosh (Pico da Rocha Negra "..yellow.."[2]"..white..")",
    Note = "Para pegar Mojo de Warosh você deve evocar e matar Urok Uivo-da-ruína "..yellow.."[15]"..white..". Para sua Evocação você precisa de uma Lança e Cabeça do Grão-lorde Omokk "..yellow.."[5]"..white..". A Lança está em "..yellow.."[3]"..white..". Durante a Evocação algumas ondas de ogros aparecem antes de Urok Uivo-da-ruína atacá-lo. Você pode usar a Lança durante a luta para danificar os ogros.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 15867 }, --Prismcharm Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[7] = {
    Title = "Pertences de Bijou",
    Id = 5001,
    Level = 59,
    Attain = 55,
    Aim = "Encontre os pertences de Bijou e devolva-os para ela. Você se lembra dela mencionando que os escondeu no último andar da cidade.",
    Location = "Biju (Pico da Rocha Negra "..yellow.."[3]"..white..")",
    Note = "Você encontra Pertences de Biju no caminho para Mãe Queimateia em "..yellow.."[13]"..white.."..\nMaxwell está em (Estepes Ardentes - Vigília de Morgan "..yellow.."84,58"..white..").",
    Folgequest = "Mensagem para Maxwell",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[8] = {
    Title = "A missão de Maxwell",
    Id = 5081,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e destrua o Mestre da Guerra Voone, o Grão-lorde Omokk e o Overlord Wyrmthalak. Volte para o Marechal Maxwell quando o trabalho estiver concluído.",
    Location = "Oficial Maxwell (Estepes Ardentes - Vigília de Morgan "..yellow.."84,58"..white..")",
    Note = "Você encontra Senhor da Guerra Voone em "..yellow.."[9]"..white..", Grão-lorde Omokk em "..yellow.."[5]"..white.." e Lorde Supremo Wyrmthalak em "..yellow.."[19]"..white..".",
    Prequest = "Mensagem para Maxwell",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 13958 }, --Wyrmthalak's Shackles Wrist, Cloth
        { id = 13959 }, --Omokk's Girth Restrainer Waist, Plate
        { id = 13961 }, --Halycon's Muzzle Shoulder, Leather
        { id = 13962 }, --Vosh'gajin's Strand Waist, Leather
        { id = 13963 }, --Voone's Vice Grips Hands, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[9] = {
    Title = "Selo da Ascensão",
    Id = 4742,
    Level = 60,
    Attain = 57,
    Aim = "Encontre as três pedras preciosas de comando: A Pedra Preciosa de Smolderthorn, a Pedra Preciosa de Spirestone e a Pedra Preciosa de Machado Sangrento. Devolva-os, junto com o Selo Sem Adornos da Ascensão, para Vaelan.$B$BOs generais, conforme dito a você por Vaelan, são: Mestre de Guerra Voone de Smolderthorn; Grão-lorde Omokk da Pedra do Pináculo; e Overlord Wyrmthalak do Bloodaxe.",
    Location = "Vaelan (Pico da Rocha Negra "..yellow.."[1]"..white..")",
    Note = "Você pega a Gema de Spirestone de Grão-lorde Omokk em "..yellow.."[5]"..white..", a Gema de Smolderthorn de Senhor da Guerra Voone em "..yellow.."[9]"..white.." e a Gema de Bloodaxe de Lorde Supremo Wyrmthalak em "..yellow.."[19]"..white..". O Selo de Ascensão Sem Adornos pode dropar de quase todos os inimigos no Pico da Rocha Negra Inferior. Você pega a Chave para o Pico da Rocha Negra Superior se completar esta sequência de missões.",
    Folgequest = "Selo da Ascensão",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[10] = {
    Title = "Comando do General Drakkisath",
    Id = 5089,
    Level = 60,
    Attain = 55,
    Aim = "Leve o comando do General Drakkisath ao Marechal Maxwell nas Estepes Ardentes.",
    Location = "Comando do General Drakkisath (dropado de Lorde Supremo Wyrmthalak "..yellow.."[19]"..white..")",
    Note = "Oficial Maxwell está nas Estepes Ardentes - Vigília de Morgan; ("..yellow.."84,58"..white..").",
    Folgequest = "Morte do General Drakkisath ("..yellow.."Upper Blackrock Spire"..white..")", -- 5102
}
kQuestInstanceData.BlackrockSpireLower.Alliance[11] = {
    Title = "A peça esquerda do amuleto de Lord Valthalak",
    Id = 8966,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Volte para Bodley dentro da Montanha Rocha Negra com o Pedaço Esquerdo do Amuleto de Lord Valthalak e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nMor Grayhoof é invocado em "..yellow.."[9]"..white..".",
    Prequest = "Componentes de importância",
    Folgequest = "Vejo a Ilha Alcaz no seu futuro...",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[12] = {
    Title = "A peça certa do amuleto de Lord Valthalak",
    Id = 8989,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Retorne a Bodley dentro da Montanha Rocha Negra com o Amuleto de Lord Valthalak recombinado e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nMor Grayhoof é invocado em "..yellow.."[9]"..white..".",
    Prequest = "Mais componentes de importância",
    Folgequest = "Preparativos Finais ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994
}
kQuestInstanceData.BlackrockSpireLower.Alliance[13] = {
    Title = "Pedra da Serpente da Caçadora das Sombras",
    Id = 5306,
    Level = 60,
    Attain = 50,
    Aim = "Viaje para o Pico da Rocha Negra e mate o Caçador Sombrio Vosh'gajin. Recupere a Pedra da Serpente de Vosh'gajin e volte para Kilram.",
    Location = "Kilram (Hibérnia - Visteterna "..yellow.."61,37"..white..")",
    Note = "Missão de Ferreiro. Caçadora Sombria Vosh'gajin está em "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12821 }, --Plans: Dawn's Edge Pattern
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[14] = {
    Title = "Morte ardente e quente",
    Id = 5103,
    Level = 60,
    Attain = 60,
    Aim = "Alguém neste mundo deve saber o que fazer com estas manoplas. Boa sorte!",
    Location = "Human Remains (Lower Pico da Rocha Negra "..yellow.."[9]"..white..")",
    Note = "Missão de Ferreiro. Certifique-se de pegar as Manoplas de Placa Não Forjadas perto dos Restos Mortais Humanos em "..yellow.."[11]"..white..". Entregue para Málifus Trevamalho (Hibérnia - Visteterna "..yellow.."61,39"..white.."). As recompensas listadas são da sequência seguinte.",
    Folgequest = "Manoplas de Placas de Fogo",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 12699 }, --Plans: Fiery Plate Gauntlets Pattern
        { id = 12631 }, --Fiery Plate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[15] = {
    Title = "O Profanador Ferro Negro",
    Id = 40762,
    Level = 60,
    Attain = 55,
    Aim = "Colete um Rifle de Ferro Negro, um Condensador de Magma, um Barril de Arcanita Intrincado e um Fragmento Derretido para o Fusível Bixxle no Armazém de Bixxle em Tel'Abim.",
    Location = "Bixxle Screwfuse (Tel'Abim "..yellow.."52,34"..white..")",
    Note = "Esta missão requer coletar 4 itens.\n1) Condensador de Magma (Abismo Rocha Negra no Caixa de Condensador de Magma) \n2) Barril Intricado de Arcanita (Pico da Rocha Negra no container de Barris Intricados de Arcanita)\n3) Fragmento Fundido (Núcleo Derretido de Destruidor Derretido).\n4) Rifle de Ferro Sombrio (criado por Engenheiros).\nNúcleo Ardente(x3) encontrado no Núcleo Derretido, e Barras Encantadas de Tório(x10).",
    Prequest = "Segredos do Profanador Ferro Negro",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireLower.Horde[i] = kQuestInstanceData.BlackrockSpireLower.Alliance[i]
end
kQuestInstanceData.BlackrockSpireLower.Horde[5] = {
    Title = "A Senhora da Matilha",
    Id = 4724,
    Level = 59,
    Attain = 55,
    Aim = "Mate Halycon, amante do worg Machado Sangrento.",
    Location = "Galamav, o Atirador Perito (Ermos - Kargath "..yellow.."5,47"..white..")",
    Note = "Você encontra Halycon em "..yellow.."[17]"..white..".",
    Rewards = kQuestInstanceData.BlackrockSpireLower.Alliance[5].Rewards
}
kQuestInstanceData.BlackrockSpireLower.Horde[6] = kQuestInstanceData.BlackrockSpireLower.Alliance[6]
kQuestInstanceData.BlackrockSpireLower.Horde[7] = {
    Title = "Bijuteria Operativa",
    Id = 4981,
    Level = 59,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e descubra o que aconteceu com Bijou.",
    Location = "Lexlort (Ermos - Kargath "..yellow.."5,47"..white..")",
    Note = "Você encontra Biju em "..yellow.."[8]"..white..".",
    Folgequest = "Pertences de Bijou",
}
kQuestInstanceData.BlackrockSpireLower.Horde[8] = {
    Title = "Pertences de Bijou",
    Id = 4982,
    Level = 59,
    Attain = 55,
    Aim = "Encontre os pertences de Bijou e devolva-os para ela. Você se lembra dela mencionando que os escondeu no último andar da cidade.",
    Location = "Biju (Pico da Rocha Negra "..yellow.."[3]"..white..")",
    Note = "Você encontra Pertences de Biju no caminho para Mãe Queimateia em "..yellow.."[13]"..white.."..\nAs Recompensas pertencem a 'Relatório de Reconhecimento de Biju'.",
    Prequest = "Bijuteria Operativa",
    Folgequest = "Relatório de Reconhecimento de Bijou",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 15858 }, --Freewind Gloves Hands, Cloth
        { id = 15859 }, --Seapost Girdle Waist, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[9] = kQuestInstanceData.BlackrockSpireLower.Alliance[9]
kQuestInstanceData.BlackrockSpireLower.Horde[10] = {
    Title = "Comando do Senhor da Guerra",
    Id = 4903,
    Level = 60,
    Attain = 55,
    Aim = "Mate o Grão-lorde Omokk, o Senhor da Guerra Voone e o Lorde Supremo Wyrmthalak. Recupere documentos importantes da Rocha Negra. Retorne ao Senhor da Guerra Trincador em Kargath quando a missão for cumprida.",
    Location = "Senhor da Guerra Trincador (Ermos - Kargath "..yellow.."65,22"..white..")",
    Note = "Missão prévia de Onyxia.\nVocê encontra Grão-lorde Omokk em "..yellow.."[5]"..white..", Senhor da Guerra Voone em "..yellow.."[9]"..white.." e Lorde Supremo Wyrmthalak em "..yellow.."[19]"..white..". Os Documentos da Rocha Negra podem aparecer ao lado de um desses 3 chefes.",
    Folgequest = "Sabedoria de Eitrigg -> Pela Horda! ("..yellow.."Pico da Rocha Negra Superior"..white..")",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
    Title = "Escória de Trolls da Floresta",
    Id = 40495,
    Level = 60,
    Attain = 48,
    Location = "Capataz Ok'gog (Estepes Ardentes - Fortaleza Karfang "..yellow.."95.1,22.8"..white..")",
    Note = "Mate Senhor da Guerra Voone "..yellow.."[9]"..white.." no Pico da Rocha Negra Inferior e leve suas presas de volta para Capataz Ok'gog na Fortaleza Karfang nas Estepes Ardentes.",
    Prequest = "A tarefa Firegut",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60715 }, --Taskmaster Whip Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[17] = {
    Title = "Ataque do Raider",
    Id = 40498,
    Level = 58,
    Attain = 50,
    Aim = "Mate Gizrul, o Escravagista, no Pico da Rocha Negra, e depois apresente-se ao Invasor Fargosh no Forte Karfang.",
    Location = "Invasor Fargosh (Estepes Ardentes - Fortaleza Karfang "..yellow.."93.6,23.2"..white..")",
    Note = "Gizrul, o Subjugador aparece após você matar o chefe Halycon "..yellow.."[17]"..white..".",
    Prequest = "A vingança do invasor -> Nova montaria do Raider",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60717 }, --Worg Rider Sash Waist, Leather
        { id = 60718 }, --Sootwalker Sandals Feet, Cloth
        { id = 60719 }, --Axe of Fargosh Main Hand, Axe
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[18] = {
    Title = "A última rachadura",
    Id = 40509,
    Level = 59,
    Attain = 50,
    Location = "Karfang (Estepes Ardentes - Fortaleza Karfang "..yellow.."95.1,22.8"..white..")",
    Note = "Mate Intendente Zigris "..yellow.."[16]"..white.." nas profundezas do Pico da Rocha Negra para Karfang na Fortaleza Karfang nas Estepes Ardentes.",
    Prequest = "Protegendo Sangue Fresco -> Reporte para Molk -> Destrua todos os rastros... -> Não se arrisque",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60739 }, --Tarnished Lancelot Ring Ring
    }
}

--------------- Upper Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireUpper = {
    Story = "A poderosa fortaleza esculpida nas entranhas ardentes da Montanha Rocha Negra foi projetada pelo mestre pedreiro-anão, Franclorn Forgewright. Destinada a ser o símbolo do poder Ferro Negro, a fortaleza foi mantida pelos anões sinistros por séculos. No entanto, Nefarian - o astuto filho do dragão, Asa da Morte - tinha outros planos para a grande fortaleza. Ele e seus lacaios dracônicos tomaram controle do Pico superior e fizeram guerra nas posses dos anões nas profundezas vulcânicas da montanha. Percebendo que os anões eram liderados pelo poderoso elemental de fogo, Ragnaros - Nefarian jurou esmagar seus inimigos e reivindicar toda a Montanha Rocha Negra para si.",
    Caption = "Upper Pico da Rocha Negra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[1] = {
    Title = "O Protetorado da Matrona",
    Id = 5160,
    Level = 60,
    Attain = 57,
    Aim = "Viaje para Winterspring e encontre Haleh. Dê a ela a escala de Awbee.",
    Location = "Albi (Pico da Rocha Negra "..yellow.."[7]"..white..")",
    Note = "Você encontra Albi na sala após a Arena em "..yellow.."[7]"..white..". Ela está em uma saliência.\nHaleh está em Hibérnia ("..yellow.."54,51"..white.."). Use o sinal de portal no final da caverna para chegar até ela.",
    Folgequest = "Ira do Voo Azul",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[2] = {
    Title = "Finkle Einhorn, ao seu serviço!",
    Id = 5047,
    Level = 60,
    Attain = 55,
    Aim = "Fale com Malyfous Darkhammer em Everlook.",
    Location = "Finkle Einhorn (Pico da Rocha Negra "..yellow.."[8]"..white..")",
    Note = "Finkle Einhorn aparece após esfolar A Fera. Você encontra Malyfous em (Hibérnia - Visteterna "..yellow.."61,38"..white..").",
    Folgequest = "Perneiras de Arcana, Capuz do Salvador Escarlate, Peitoral da Sede de Sangue e Ombreiras do Portador da Luz",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[3] = {
    Title = "Congelamento de Ovos",
    Id = 4734,
    Level = 60,
    Attain = 57,
    Aim = "Use o Protótipo do Ovosciloscópio em um ovo no Rookery.",
    Location = "Vera Brequim (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,24"..white..")",
    Note = "Você encontra os ovos na sala do Pai da Chama em "..yellow.."[2]"..white..".",
    Prequest = "Essência de ninhada -> Fervura a Vapor Tinkee",
    Folgequest = "Coleta de Ovos -> Leonid Bartalomeu -> O Gambito do Amanhecer ("..yellow.."Scholomance"..white..")",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[4] = {
    Title = "Olho do Emberseer",
    Id = 6821,
    Level = 60,
    Attain = 56,
    Aim = "Leve o Olho do Vidente das Brasas para o Duque Hydraxis em Azshara.",
    Location = "Duque Hidráxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Você pode encontrar Piroguarda Mirabrasa em "..yellow.."[1]"..white..".",
    Prequest = "Água Envenenada, Tempesteiros e Retumbadores",
    Folgequest = "O Núcleo Derretido",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[5] = {
    Title = "Morte do General Drakkisath",
    Id = 5102,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e destrua o General Drakkisath. Volte para o Marechal Maxwell quando o trabalho estiver concluído.",
    Location = "Oficial Maxwell (Estepes Ardentes - Vigília de Morgan "..yellow.."82,68"..white..")",
    Note = "Você encontra General Drakkisath em "..yellow.."[9]"..white..".",
    Prequest = "Comando do General Drakkisath ("..yellow.."Lower Blackrock Spire"..white..")",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[6] = {
    Title = "Fecho do Doomrigger",
    Id = 4764,
    Level = 60,
    Attain = 57,
    Aim = "Leve o Fecho do Doomrigger para Mayara Brightwing nas Estepes Ardentes.",
    Location = "Mayara Asaluz (Estepes Ardentes - Vigília de Morgan "..yellow.."84,69"..white..")",
    Note = "Você pega a missão prévia de Conde Capistrano de Espargosa (Ventobravo - Castelo de Ventobravo "..yellow.."74,30"..white..").\n\nFecho de Doomrigger está em "..yellow.."[3]"..white.." em um baú.",
    Prequest = "Mayara Asa Brilhante",
    Folgequest = "Entrega em Ridgewell",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[7] = {
    Title = "Amuleto de Fogo Dracônico",
    Id = 6502,
    Level = 60,
    Attain = 50,
    Aim = "Você deve recuperar o Campeão do Sangue do Dragão Negro do General Drakkisath. Drakkisath pode ser encontrado em sua sala do trono atrás dos Salões da Ascensão no Pináculo da Rocha Negra.",
    Location = "Haleh (Hibérnia "..yellow.."54,51"..white..")",
    Note = "Última parte da sequência de missões de Onyxia para a Aliança. Você encontra General Drakkisath em "..yellow.."[9]"..white..".",
    Prequest = "O Olho do Dragão",
    Rewards = {
        Text = "Recompensa: ",
        { id = 16309 }, --Drakefire Amulet Neck
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[8] = {
    Title = "Comando de Mão Negra",
    Id = 7761,
    Level = 60,
    Attain = 55,
    Aim = "Esse é um orc estúpido. Parece que você precisa encontrar esta marca e obter a Marca de Drakkisath para acessar o Orbe de Comando.$B$BA carta indica que o General Drakkisath guarda a marca. Talvez você devesse investigar.",
    Location = "Comando de Mão Negra (dropado de Intendente do Escudo Marcado "..yellow.."[7] no Mapa de Entrada"..white..")",
    Note = "Missão de sintonia do Covil Asa Negra. Intendente do Escudo Marcado é encontrado se você virar à direita antes do portal LBRS/UBRS.\n\nGeneral Drakkisath está em "..yellow.."[9]"..white..". A marca está atrás dele.",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[9] = {
    Title = "Preparativos Finais",
    Id = 8994,
    Level = 60,
    Attain = 58,
    Aim = "Reúna 40 Braçadeiras da Rocha Negra e adquira um Frasco de Poder Supremo. Devolva-os para Bodley dentro da Montanha Rocha Negra.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'. Braçadeiras da Rocha Negra dropam de criaturas com Mão Negra no nome. Frasco de Poder Supremo é feito por um Alquimista.",
    Prequest = "A peça certa do amuleto de Lord Valthalak ("..yellow.."Upper Blackrock Spire"..white..")",
    Folgequest = "Mea Culpa, Senhor Valthalak",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[10] = {
    Title = "Mea Culpa, Senhor Valthalak",
    Id = 8995,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar Lord Valthalak. Despache-o e use o Amuleto de Lord Valthalak no cadáver. Em seguida, devolva o Amuleto de Lord Valthalak ao Espírito de Lord Valthalak.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'. Lorde Valthalak é invocado em "..yellow.."[8]"..white..". As recompensas listadas são de Voltar para Bodley.",
    Prequest = "Preparativos Finais",
    Folgequest = "Voltar para Bodley",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 22057 }, --Brazier of Invocation Item
        { id = 22344 }, --Brazier of Invocation: User's Manual Item
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[11] = {
    Title = "A Forja Demoníaca",
    Id = 5127,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e encontre Goraluk Rachadastra. Mate-o e use o Pique Manchado de Sangue em seu cadáver. Depois que sua alma for desviada, o pique ficará Manchado de Alma.$B$BVocê também deve encontrar o Peitoral Coberto de Runas Não Forjadas.$B$BDevolva tanto o Pique Manchado de Alma quanto o Peitoral Coberto de Runas Não Forjadas para Lorax em Hibérnia.",
    Location = "Vegax (Hibérnia "..yellow.."64,74"..white..")",
    Note = "Missão de Ferreiro. Goraluk Rachadastra está em "..yellow.."[5]"..white..".",
    Prequest = "Conto de Lorax",
    Rewards = {
        Text = "Recompensa: 1 e 2 e 3",
        { id = 12696 }, --Plans: Demon Forged Breastplate Pattern
        { id = 9224, quantity = 5 }, --Elixir of Demonslaying Potion
        { id = 12849 }, --Demon Kissed Sack Container
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[12] = {
    Title = "A Ligação Superior I",
    Id = 41011,
    Level = 60,
    Attain = 55,
    Aim = "Reúna uma carga de Dragonkin dos Dragonkin Negros no Pico da Rocha Negra para Parnabus em Guilnéas.",
    Location = "Parnabus <Mago Errante> (Gilneas "..yellow.."[22.9,74.4]"..white..", muito ao sul da Cidade de Gilneas, oeste do rio. dentro de uma casa solitária).",
    Note = "Altamente recomendado pegar a missão prévia 'A Ligação de Xanthar' de Hanvar, o Justo (Trilha do Vento Morto na pequena igreja fora de Karazhan "..yellow.."[40.9,79.3]"..white..").\nA recompensa da última missão da sequência de missões A Ligação Superior será o item de missão 'A Ligação Superior de Xanthar' para a missão 'A Ligação de Xanthar'.",
    Prequest = "A Ligação de Xanthar",
    Folgequest = "A Ligação Superior II -> A Ligação Superior III"..yellow.."[Gládio Cruel Oeste]"..white.." -> A Ligação Superior IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61696 }, --The Upper Binding of Xanthar Quest Item
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireUpper.Horde[i] = kQuestInstanceData.BlackrockSpireUpper.Alliance[i]
end
kQuestInstanceData.BlackrockSpireUpper.Horde[5] = {
    Title = "A Tabuleta de Pedra Negra",
    Id = 4768,
    Level = 60,
    Attain = 57,
    Aim = "Leve a Tabuleta de Pedra Negra para a Maga das Sombras Vivian Lagrave em Kargath.",
    Location = "Umbramante Vivian Latumba (Ermos - Kargath "..yellow.."2,47"..white..")",
    Note = "Você pega a missão prévia de Boticária Zilda na Cidade Baixa - O Apotecário ("..yellow.."50,68"..white..").\n\nA Tabuleta de Pedra Sombria está em "..yellow.."[3]"..white.." em um baú.",
    Prequest = "Vivian Lagrave e a Tábua Darkstone",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[6] = {
    Title = "Para a Horda!",
    Id = 4974,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e mate o Chefe Guerreiro Rend Mão Negra. Pegue sua cabeça e volte para Orgrimmar.",
    Location = "Thrall (Orgrimmar "..yellow.."31,38"..white..")",
    Note = "Missão de sintonia de Onyxia. Você encontra Chefe Guerreiro Laceral Mão Negra em "..yellow.."[6]"..white..".",
    Prequest = "Comando do Senhor da Guerra -> Sabedoria de Eitrigg",
    Folgequest = "O que o vento carrega",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[7] = {
    Title = "Ilusões de Oculus",
    Id = 6569,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para o Pináculo da Rocha Negra e colete 20 Olhos de Crias de Dragões Negros. Volte para Myranda, a Bruxa, quando a tarefa for concluída.",
    Location = "Myranda, a Bruxa Velha (Terras Pestilentas Ocidentais "..yellow.."50,77"..white..")",
    Note = "Dracônidas dropam os olhos.",
    Prequest = "Para a Horda! -> O que o vento carrega -> O Testamento de Rexxar",
    Folgequest = "Emberstrife",
}
kQuestInstanceData.BlackrockSpireUpper.Horde[8] = {
    Title = "Campeão do Sangue do Dragão Negro",
    Id = 6602,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para o Pico da Rocha Negra e mate o General Drakkisath. Reúna o sangue dele e devolva-o para Rexxar.",
    Location = "Rexxar (Desolação - Aldeia Shadowprey "..yellow.."25,71"..white..")",
    Note = "Última parte da missão prévia de Onyxia. Você encontra General Drakkisath em "..yellow.."[9]"..white..".",
    Prequest = "Emberstrife -> Ascensão...",
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
    Story = "Construída há doze mil anos por uma seita secreta de feiticeiros elfos noturnos, a cidade antiga de Eldre'Thalas foi usada para proteger os segredos arcanos mais preciosos da Rainha Azshara. Embora tenha sido devastada pelo Grande Cataclismo do mundo, muito da maravilhosa cidade ainda permanece como o imponente Gládio Cruel. Os três distritos distintos das ruínas foram invadidos por todo tipo de criaturas - especialmente os espectros altonatos, sátiros imundos e ogros brutais. Apenas o grupo mais ousado de aventureiros pode entrar nesta cidade quebrada e enfrentar os males antigos trancados em seus cofres ancestrais.",
    Caption = "Gládio Cruel (East)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulEast.Alliance[1] = {
    Title = "Pusillin e o Ancião Azj'Tordin",
    Id = 7441,
    Level = 58,
    Attain = 54,
    Aim = "Viaje para Dire Maul e localize o Imp, Pusillin. Convença Pusillin a lhe dar o Livro de Encantamentos de Azj'Tordin por qualquer meio necessário.$B$BRVolte para Azj'Tordin no Pavilhão Lariss em Feralas caso você recupere o Livro de Encantamentos.",
    Location = "Azj'Tordin (Feralas - Lariss Pavillion "..yellow.."76,37"..white..")",
    Note = "Pusillin está em Gládio Cruel "..yellow.."Leste"..white.." em "..yellow.."[1]"..white..". Ele corre quando você fala com ele, mas para e luta em "..yellow.."[2]"..white..". Ele dropará a Chave Crescente que é usada para Gládio Cruel Norte e Oeste.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 18411 }, --Spry Boots Feet, Leather
        { id = 18410 }, --Sprinter's Sword Two-Hand, Sword
    }
}
kQuestInstanceData.DireMaulEast.Alliance[2] = {
    Title = "Teia de Lethtendris",
    Id = 7488,
    Level = 57,
    Attain = 54,
    Aim = "Leve a Teia de Lethtendris para Latronicus Moonspear na Fortaleza Feathermoon em Feralas.",
    Location = "Latrônicus Lunalança (Feralas - Fortaleza Penacero "..yellow.."30,46"..white..")",
    Note = "Letendris está em Gládio Cruel "..yellow.."Leste"..white.." em "..yellow.."[3]"..white..". A missão prévia vem de Mensageiro Desçomalho em Altaforja. Ele percorre toda a cidade.",
    Prequest = "Domínio de Plumaluna",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18491 }, --Lorespinner Main Hand, Dagger
    }
}
kQuestInstanceData.DireMaulEast.Alliance[3] = {
    Title = "Fragmentos de Felvine",
    Id = 5526,
    Level = 60,
    Attain = 56,
    Aim = "Encontre o Felvine em Dire Maul e adquira um fragmento dele.  Provavelmente, você só conseguirá adquirir um com o desaparecimento de Alzzin, o Moldador Selvagem.  Use o Relicário da Pureza para selar com segurança o fragmento interno e devolva-o para Rabine Saturna em Nighthaven, Moonglade.",
    Location = "Ravine Saturna (Clareira da Lua - Refúgio Noturno "..yellow.."51,44"..white..")",
    Note = "Você encontra Aliz, a Metamorfa nos "..yellow.."Leste"..white.." de Gládio Cruel em "..yellow.."[5]"..white..". A relíquia está em Silithus em "..yellow.."62,54"..white..". A missão prévia vem de Ravina Saturna também.",
    Prequest = "Um Relicário de Pureza",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 18535 }, --Milli's Shield Shield
        { id = 18536 }, --Milli's Lexicon Held In Off-hand
    }
}
kQuestInstanceData.DireMaulEast.Alliance[4] = {
    Title = "A peça esquerda do amuleto de Lord Valthalak",
    Id = 8967,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Volte para Bodley dentro da Montanha Rocha Negra com o Pedaço Esquerdo do Amuleto de Lord Valthalak e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nIsalien é invocado em "..yellow.."[5]"..white..".",
    Prequest = "Componentes de importância",
    Folgequest = "Vejo a Ilha Alcaz no seu futuro...",
}
kQuestInstanceData.DireMaulEast.Alliance[5] = {
    Title = "A peça certa do amuleto de Lord Valthalak",
    Id = 8990,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Retorne a Bodley dentro da Montanha Rocha Negra com o Amuleto de Lord Valthalak recombinado e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nIsalien é invocado em "..yellow.."[5]"..white..".",
    Prequest = "Mais componentes de importância",
    Folgequest = "Preparativos Finais ("..yellow.."Upper Blackrock Spire"..white..")",
}
kQuestInstanceData.DireMaulEast.Alliance[6] = {
    Title = "As amarras da prisão",
    Id = 7581,
    Level = 60,
    Attain = 60,
    Aim = "Viaje para Gládio Cruel em Feralas e recupere 15 Sangue de Sátiro dos Sátiros Criasselvagem que habitam o Bairro Madeirasserp. Volte para Daio na Cicatriz Maculada quando isso for feito.",
    Location = "Daio, o Decrépito (Barreira do Inferno - A Cicatriz Corrompida "..yellow.."34,50"..white..")",
    Note = red.."Apenas Bruxo"..white..": Esta junto com outra missão dada por Daio, o Decrépito são missões exclusivas de Bruxo para o feitiço Ritual da Perdição. A maneira mais fácil de chegar aos Sátiros Criasselvagem é entrar em Gládio Cruel Leste pela 'porta dos fundos' no Pavilhão Lariss (Feralas "..yellow.."77,37"..white.."). Você precisará da Chave Crescente, no entanto.",
}
kQuestInstanceData.DireMaulEast.Alliance[7] = {
    Title = "Refresco Arcano",
    Id = 7463,
    Level = 60,
    Attain = 60,
    Aim = "Viaje para o bairro Warpwood de Dire Maul e mate o elemental da água, Hydrospawn. Retorne ao Lorekeeper Lydros no Ateneu com a Essência Hydrospawn.",
    Location = "Erudito Lydros (Gládio Cruel - West ou North "..yellow.."[1] Library"..white..")",
    Note = red.."Apenas Mago"..white..": Essência de Rebentágua dropa de [3] Rebentágua. Recompensa: você pode usar Água Cristalina Conjurada.",
    Folgequest = "Um tipo especial de convocação",
    Rewards = {
        Text = "Recompensa: ",
        { id = 83002 }, --Tome of Refreshment Ritual Pattern
    }
}
kQuestInstanceData.DireMaulEast.Alliance[8] = {
    Title = "O Moldador Selvagem",
    Id = 41016,
    Level = 60,
    Attain = 55,
    Aim = "Leve a Cabeça de Alzzin, o Moldador Selvagem, para o Arquidruida Vento Sonho em Nordanaar, em Hyjal.",
    Location = "Arquidruida Brisasonho (Hyjal - Nordanaar "..yellow.."84.8,29.3"..white.." andar superior da grande árvore)",
    Note = "Você encontra Aliz, a Metamorfa em "..yellow.."[5]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 61199 }, --Bright Dream Shard Reagent
        { id = 61703 }, --Talisman of the Dreamshaper Neck
    }
}
kQuestInstanceData.DireMaulEast.Alliance[9] = {
    Title = "Embrulhando Warpwood",
    Id = 41376,
    Level = 61,
    Attain = 60,
    Aim = "Leve 5 Folhas Azuis para o Guardião das Histórias Lydros",
    Location = "Erudito Lydros (Gládio Cruel - West ou North "..yellow.."[1] Library"..white..")",
    Note = red.."Apenas Druida"..white..": Folhas Azuis dropam de Entes.\nInício da missão prévia [de Antigos e Entes] - (Torre de Karazhan "..yellow.."perto de [0]"..white..")",
    Rewards = {
        Text = "Recompensa: ",
        { id = 51070 }, --Glyph of the Arcane Treant Glyph
    }
}
kQuestInstanceData.DireMaulEast.Horde[1] = kQuestInstanceData.DireMaulEast.Alliance[1]
kQuestInstanceData.DireMaulEast.Horde[2] = {
    Title = "Teia de Lethtendris",
    Id = 7489,
    Level = 57,
    Attain = 54,
    Aim = "Leve a Teia de Lethtendris para Latronicus Moonspear na Fortaleza Feathermoon em Feralas.",
    Location = "Talo Casco de Espinhos (Feralas - Acampamento Mojache "..yellow.."76,43"..white..")",
    Note = "Letendris está em Gládio Cruel "..yellow.."Leste"..white.." em "..yellow.."[3]"..white..". A missão prévia vem de Belarauto Garganto em Orgrimmar. Ele percorre toda a cidade.",
    Prequest = "Acampamento Mojache",
    Rewards = kQuestInstanceData.DireMaulEast.Alliance[2].Rewards
}
for i = 3, 9 do
    kQuestInstanceData.DireMaulEast.Horde[i] = kQuestInstanceData.DireMaulEast.Alliance[i]
end

--------------- Dire Maul (North) ---------------
kQuestInstanceData.DireMaulNorth = {
    Story = kQuestInstanceData.DireMaulEast.Story,
    Caption = "Gládio Cruel (North)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulNorth.Alliance[1] = {
    Title = "Uma armadilha quebrada",
    Id = 1193,
    Level = 60,
    Attain = 56,
    Aim = "Conserte a armadilha.",
    Location = "Uma armadilha quebrada (Gládio Cruel "..yellow.."North"..white..")",
    Note = "Missão repetível. Para consertar a armadilha você deve usar uma [Engrenagem de Tório] e um [Óleo de Gelo].",
}
kQuestInstanceData.DireMaulNorth.Alliance[2] = {
    Title = "O Traje de Ogro Gordok",
    Id = 5518,
    Level = 60,
    Attain = 56,
    Aim = "Leve 4 peças de runa, 8 couro resistente, 2 fios rúnicos e tanino de ogro para Knot Thimblejack.  Ele está atualmente acorrentado dentro da ala Gordok do Dire Maul.",
    Location = "Fiapo Agulhacerta (Gládio Cruel "..yellow.."North, [4]"..white..")",
    Note = "Missão repetível. Você pega o Tanino de Ogre perto de "..yellow.."[4] (acima)"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18258 }, --Gordok Ogre Suit Disguise
    }
}
kQuestInstanceData.DireMaulNorth.Alliance[3] = {
    Title = "Nó grátis!",
    Id = 5525,
    Level = 60,
    Attain = 57,
    Aim = "Colete uma Chave de Algema Gordok para Knot Dedaldal.",
    Location = "Fiapo Agulhacerta (Gládio Cruel "..yellow.."North, [4]"..white..")",
    Note = "Missão repetível. Qualquer carcereiro pode dropar a chave.",
}
kQuestInstanceData.DireMaulNorth.Alliance[4] = {
    Title = "Negócio Gordok inacabado",
    Id = 1318,
    Level = 60,
    Attain = 56,
    Aim = "Encontre a Manopla de Gordok Might e devolva-a ao Capitão Kromcrush em Dire Maul.$B$BAde acordo com Kromcrush, a 'velha história' diz que Tortheldrin - um elfo 'assustador' que se autodenominava príncipe - a roubou de um dos Reis Gordok.",
    Location = "Capitão Kebrapaw (Gládio Cruel "..yellow.."North, [5]"..white..")",
    Note = "Príncipe está em Gládio Cruel "..yellow.."Oeste"..white.." em "..yellow.."[7]"..white..". A Manopla está perto dele em um baú. Você só pode pegar esta missão após uma corrida de Tributo e ter o buff 'Rei dos Gordok'.",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
    Caption = "Gládio Cruel (West)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulWest.Alliance[1] = {
    Title = "Lendas Élficas",
    Id = 7482,
    Level = 60,
    Attain = 54,
    Aim = "Procure por Kariel Winthalus em Dire Maul. Apresente-se ao Sage Korolusk em Camp Mojache com todas as informações que encontrar.",
    Location = "Erudita Runacardos (Feralas - Fortaleza Penacero "..yellow.."31,43"..white..")",
    Note = "Você encontra Kariel Winthalus na "..yellow.."Biblioteca (Oeste)"..white..".",
}
kQuestInstanceData.DireMaulWest.Alliance[2] = {
    Title = "A loucura interior",
    Id = 7461,
    Level = 60,
    Attain = 56,
    Aim = "Você deve destruir os guardiões que cercam os 5 pilares que alimentam a Prisão de Immol'thar. Assim que os Pylons forem desligados, o campo de força ao redor de Immol'thar terá se dissipado.$B$BEntre na Prisão de Immol'thar e erradique o demônio imundo que está em seu coração. Finalmente, confronte o Príncipe Tortheldrin no Ateneu.$B$BRVolte para o Ancião Shen'dralar no pátio caso você complete esta missão.",
    Location = "Anciã Shen'dralar (Gládio Cruel "..yellow.."West, [1] (above)"..white..")",
    Note = "Os Pilões estão marcados como "..blue.."[B]"..white..". Immol'thar está em "..yellow.."[6]"..white..", Príncipe Tortheldrin em "..yellow.."[7]"..white..".",
    Folgequest = "O Tesouro de Shen'dralar",
}
kQuestInstanceData.DireMaulWest.Alliance[3] = {
    Title = "O Tesouro de Shen'dralar",
    Id = 7462,
    Level = 60,
    Attain = 56,
    Aim = "Volte ao Ateneu e encontre o Tesouro de Shen'dralar. Reivindique sua recompensa!",
    Location = "Anciã Shen'dralar (Gládio Cruel "..yellow.."West, [1]"..white..")",
    Note = "Você pode encontrar o Tesouro embaixo das escadas "..yellow.."[7]"..white..".",
    Prequest = "A loucura interior",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 18424 }, --Sedge Boots Feet, Leather
        { id = 18421 }, --Backwood Helm Head, Mail
        { id = 18420 }, --Bonecrusher Two-Hand, Mace
    }
}
kQuestInstanceData.DireMaulWest.Alliance[4] = {
    Title = "Corcel Temidor de Xoroth",
    Id = 7631,
    Level = 60,
    Attain = 60,
    Aim = "Leia as instruções de Mor'zul.  Evoque um Dreadsteed Xorothiano, derrote-o e vincule seu espírito a você.",
    Location = "Mor'zul Trazangre (Estepes Ardentes "..yellow.."12,31"..white..")",
    Note = red.."Apenas Bruxo"..white..": Missão Final na sequência de missões da montaria épica de Bruxo. Primeiro você deve desligar todos os Pilões marcados com "..blue.."[B]"..white.." e então matar Immol'thar em "..yellow.."[6]"..white..". Depois disso, você pode começar o Ritual de Invocação. Certifique-se de ter mais de 20 Fragmentos de Alma prontos e ter um Bruxo especificamente designado para manter o Sino, Vela e Roda ativos. Os Guardas do Juízo que vêm podem ser escravizados. Após a conclusão, fale com o fantasma do Corcel Medonho para completar a missão.",
    Prequest = "Entrega de Imp ("..yellow.."Scholomance"..white..")", -- 7629",
}
kQuestInstanceData.DireMaulWest.Alliance[5] = {
    Title = "O sonho esmeralda...",
    Id = 7506,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "O Sonho Esmeralda (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Druida"..white..": Você entrega o livro para Erudito Javon na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18470 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[6] = {
    Title = "A maior raça de caçadores",
    Id = 7503,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "A Maior Raça de Caçadores (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Caçador"..white..": Você entrega o livro para Erudita Mykos na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18473 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[7] = {
    Title = "O livro de receitas do Arcanista",
    Id = 7500,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "O Livro de Receitas do Arcanista (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Mago"..white..": Você entrega o livro para Erudito Kildrath na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18468 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[8] = {
    Title = "A luz e como balançá-la",
    Id = 7501,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "A luz e como balançá-la (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Paladino"..white..": Você entrega o livro para Erudita Mykos na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18472 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[9] = {
    Title = "Santa Bolonha: o que a luz não lhe dirá",
    Id = 7504,
    Level = 60,
    Attain = 56,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "Sagrado Bologna: O que a Luz Não Contará (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Sacerdote"..white..": Você entrega o livro para Erudito Javon na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18469 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[10] = {
    Title = "Garona: um estudo sobre furtividade e traição",
    Id = 7498,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "Garona: Um Estudo sobre Furtividade e Traição (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Ladino"..white..": Você entrega o livro para Erudito Kildrath na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18465 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[11] = {
    Title = "Choque gelado e você",
    Id = 7505,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "Choque de Gelo e Você (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Xamã"..white..": Você entrega o livro para Erudito Javon na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18471 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[12] = {
    Title = "Aproveitando as sombras",
    Id = 7502,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "Dominando Sombras (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Bruxo"..white..": Você entrega o livro para Erudita Mykos na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18467 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[13] = {
    Title = "Códice de Defesa",
    Id = 7499,
    Level = 60,
    Attain = 54,
    Aim = "Devolva o livro aos seus legítimos proprietários.",
    Location = "Códice de Defesa (randomly drops off bosses in all Gládio Cruel wings)",
    Note = red.."Apenas Guerreiro"..white..": Você entrega o livro para Erudito Kildrath na "..yellow.."Biblioteca 1'"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18466 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[14] = {
    Title = "Biblioteca de Foco",
    Id = 7479,
    Level = 60,
    Attain = 58,
    Aim = "Leve um Libram of Focus, 1 Diamante Negro Perfeito, 4 Fragmentos Brilhantes Grandes e 2 Pele de Sombra para o Guardião do Conhecimento Lydros em Gládio Cruel para receber um Arcanum of Focus.",
    Location = "Erudito Lydros (Gládio Cruel - West ou North "..yellow.."[1] Library"..white..")",
    Note = "Não é uma missão prévia, mas Lendas Élficas deve ser completado antes que esta missão possa ser iniciada.\nO Libram é um drop aleatório em Gládio Cruel e é negociável, então pode ser encontrado na Casa de Leilões. Pele de Sombra é Vinculada quando Coletada e pode dropar de alguns chefes, Construtos Reerguidos e Carcereiro Reanimado em "..yellow.."Scolomântia"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18330 }, --Arcanum of Focus Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[15] = {
    Title = "Biblioteca de Proteção",
    Id = 7480,
    Level = 60,
    Attain = 58,
    Aim = "Leve uma Libra de Proteção, 1 Diamante Negro Imaculado, 2 Fragmentos Grandes Brilhantes e 1 Costura de Abominação Desfiada para o Guardião das Histórias Lydros em Dire Maul para receber um Arcano de Proteção.",
    Location = "Erudito Lydros (Gládio Cruel - West ou North "..yellow.."[1] Library"..white..")",
    Note = "Não é uma missão prévia, mas Lendas Élficas deve ser completado antes que esta missão possa ser iniciada.\nO Libram é um drop aleatório em Gládio Cruel e é negociável, então pode ser encontrado na Casa de Leilões. Costura de Abominação Desfiada é Vinculada quando Coletada e pode dropar de Ramstein, o Devorador, Cuspebile, Cospebile e Terror Remendado em "..yellow.."Stratholme"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18331 }, --Arcanum of Protection Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[16] = {
    Title = "Biblioteca da Rapidez",
    Id = 7478,
    Level = 60,
    Attain = 58,
    Aim = "Leve uma Libra da Rapidez, 1 Diamante Negro Imaculado, 2 Fragmentos Grandes Brilhantes e 2 Sangue de Heróis para o Guardião das Histórias Lydros em Dire Maul para receber um Arcano da Rapidez.",
    Location = "Erudito Lydros (Gládio Cruel - West ou North "..yellow.."[1] Library"..white..")",
    Note = "Não é uma missão prévia, mas Lendas Élficas deve ser completado antes que esta missão possa ser iniciada.\nO Libram é um drop aleatório em Gládio Cruel e é negociável, então pode ser encontrado na Casa de Leilões. Sangue dos Heróis é Vinculado quando Coletado e pode ser encontrado no chão em lugares aleatórios nas Terras Pestilentas Ocidentais e Orientais.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18329 }, --Arcanum of Rapidity Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[17] = {
    Title = "Compêndio de Foror",
    Id = 7507,
    Level = 60,
    Attain = 60,
    Aim = "Devolva o Compêndio de Matança de Dragões de Foror ao Ateneu.",
    Location = "Compêndio de Foror sobre Matar Dragões (random boss drop in "..yellow.."Gládio Cruel"..white..")",
    Note = red.."Missão de Guerreiro ou Paladino."..white.." Entregue para Erudito Lydros (Gládio Cruel - Oeste ou Norte "..yellow.."Biblioteca [1]"..white.."). Entregar isso permite que você inicie a missão para Quel'Serrar.",
    Folgequest = "A Forja de Quel'Serrar",
}
kQuestInstanceData.DireMaulWest.Alliance[18] = {
    Title = "Mantendo Segredos",
    Id = 40254,
    Level = 58,
    Attain = 45,
    Aim = "Viaje para Dire Maul e mate o grande ser maligno que os Altaneiros estão sugando energia, reúna dele a Essência Pura de Ley e retorne para a Guardiã Laena em Azshara.",
    Location = "Guardiã Laena (Azshara "..yellow.."44,45.4"..white..")",
    Note = "Immol'thar "..yellow.."[6]"..white.." dropa Essência Pura de Ley.\nA sequência de missões começa com a missão 'A Tarefa dos Guardiões' em Guardião Iselus "..yellow.."89,8,33.8"..white.." Azshara, canto nordeste da costa.",
    Prequest = "Restaurando as Linhas Ley",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60333 }, --Azshara Keeper's Staff Staff
        { id = 60334 }, --Ring of Eldara Ring
    }
}
kQuestInstanceData.DireMaulWest.Alliance[19] = {
    Title = "A Ligação Superior III",
    Id = 41013,
    Level = 60,
    Attain = 55,
    Aim = "Reúna uma Ressonância Arcana Supercarregada dos elementais arcanos de Grito Maul para Parnabus em Guilnéas.",
    Location = "Parnabus <Mago Errante> (Gilneas "..yellow.."[22.9,74.4]"..white..", muito ao sul da Cidade de Gilneas, oeste do rio. dentro de uma casa solitária).",
    Note = "Altamente recomendado pegar a missão prévia 'A Ligação de Xanthar' de Hanvar, o Justo (Trilha do Vento Morto na pequena igreja fora de Karazhan "..yellow.."[40.9,79.3]"..white..").\nA recompensa da última missão da sequência de missões A Ligação Superior será o item de missão 'A Ligação Superior de Xanthar' para a missão 'A Ligação de Xanthar'.\nTorrentes Arcanas grandes elementais no círculo ao redor de "..yellow.."[6]"..white.." dropam Ressonância Arcana Supercarregada.",
    Prequest = "A Ligação de Xanthar -> A Ligação Superior I"..yellow.."[Pico da Rocha Negra Superior]"..white.." -> A Ligação Superior II",
    Folgequest = "A Ligação Superior IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61696 }, --The Upper Binding of Xanthar Quest Item
    }
}
kQuestInstanceData.DireMaulWest.Alliance[20] = {
    Title = "A chave para Karazhan VIII",
    Id = 40827,
    Level = 60,
    Attain = 58,
    Aim = "Mate Immol'thar em Dire Maul, recupere joias de sua pele e retorne para Vandol.",
    Location = "Dolvan Bracewind (Pântano Vadeoso -  "..yellow.."[71.1,73.2]"..white..")",
    Note = "Missões prévias Salões Inferiores de Karazhan. Gemas Arcanizadas dropam de "..yellow.."[6].",
    Prequest = "A Chave para Karazhan I - VI -> A chave para Karazhan VII"..yellow.."[Stratholme]"..white.." ",
    Folgequest = "A chave para Karazhan IX (BWL) -> A chave para Karazhan X",
}
kQuestInstanceData.DireMaulWest.Alliance[21] = {
    Title = "Dentro do Sonho III",
    Id = 40959,
    Level = 60,
    Attain = 58,
    Aim = "Colete um Fragmento de Aprisionamento de Quebradores de Penhascos em Azshara, Prisma Arcano Sobrecarregado de Torrentes Arcanas na ala oeste de Dire Maul e um Fragmento do Adormecido de Weaver no Templo Submerso. Apresente-se a Itharius no Pântano das Mágoas com os itens coletados.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."[81.6,27.7]"..white.." a green dragonkin)",
    Note = "Torrentes Arcanas grandes elementais no círculo ao redor de "..yellow.."[6]"..white.." dropam Prisma Arcano Sobrecargado.\nAo terminar esta sequência de missões você pega o colar e poderá entrar na instância de raide de Hyjal Santuário Esmeralda.",
    Prequest = "Dentro do sonho eu -> Dentro do sonho II",
    Folgequest = "No Sonho IV - VI",
    Rewards = {
        Text = "Recompensa: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.DireMaulWest.Horde[1] = {
    Title = "Lendas Élficas",
    Id = 7481,
    Level = 60,
    Attain = 54,
    Aim = "Procure por Kariel Winthalus em Dire Maul. Apresente-se ao Sage Korolusk em Camp Mojache com todas as informações que encontrar.",
    Location = "Sábio Korolusk (Feralas - Acampamento Mojache "..yellow.."74,43"..white..")",
    Note = "Você encontra Kariel Winthalus na "..yellow.."Biblioteca (Oeste)"..white..".",
}
for i = 2, 21 do
    kQuestInstanceData.DireMaulWest.Horde[i] = kQuestInstanceData.DireMaulWest.Alliance[i]
end

--------------- Maraudon ---------------
kQuestInstanceData.Maraudon = {
    Story = "Protegida pelos ferozes centauros Maraudinos, Maraudon é um dos lugares mais sagrados dentro de Desolação. O grande templo/caverna é o lugar de sepultamento de Zaetar, um dos dois filhos imortais nascidos do semideus, Cenarius. A lenda diz que Zaetar e a princesa elemental da terra, Theradras, geraram a raça mal-gerada dos centauros. Diz-se que ao emergirem, os centauros bárbaros voltaram-se contra seu pai e o mataram. Alguns acreditam que Theradras, em sua dor, aprisionou o espírito de Zaetar dentro da caverna sinuosa - usando suas energias para algum propósito maligno. Os túneis subterrâneos são povoados pelos viciosos fantasmas há muito mortos dos Khans Centauros, assim como os próprios lacaios elementais furiosos de Theradras.",
    Caption = "Maraudon",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Maraudon.Alliance[1] = {
    Title = "Fragmentos de Fragmentos Sombrios",
    Id = 7070,
    Level = 42,
    Attain = 38,
    Aim = "Colete 10 fragmentos de Shadowshard de Maraudon e devolva-os para Uthel'nay em Orgrimmar.",
    Location = "Arquimago Tervosh (Pântano Vadeoso - A Ilha Theramore "..yellow.."66,49"..white..")",
    Note = "Você pega os Fragmentos de Fragmentos Sombrios de 'Estrondor Lascanegra' ou 'Depredador Lascanegra' fora da instância no lado Roxo.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 17772 }, --Zealous Shadowshard Pendant Neck
        { id = 17773 }, --Prodigious Shadowshard Pendant Neck
    }
}
kQuestInstanceData.Maraudon.Alliance[2] = {
    Title = "Corrupção da língua vil",
    Id = 7041,
    Level = 47,
    Attain = 41,
    Aim = "Encha o Frasco de Cerúleo Revestido na piscina de cristal laranja em Maraudon.$B$BUse o Frasco de Cerúleo Preenchido nas vinhas de Vylestem para forçar o Scion Noxxious corrompido a emergir.$B$BCure 8 plantas matando esses Scion Noxxious, depois retorne para Vark Battlescar na Vila Shadowprey.",
    Location = "Talendria (Desolação - Ponto de Nijel "..yellow.."68,8"..white..")",
    Note = "Você pode encher o Frasco em qualquer poça fora da instância no lado Laranja. As plantas estão nas áreas laranja e roxa dentro da instância.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 17768 }, --Woodseed Hoop Ring
        { id = 17778 }, --Sagebrush Girdle Waist, Leather
        { id = 17770 }, --Branchclaw Gauntlets Hands, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[3] = {
    Title = "Males Distorcidos",
    Id = 7028,
    Level = 47,
    Attain = 41,
    Aim = "Colete 25 esculturas de cristal Theradric para Willow em Desolace.",
    Location = "Faia (Desolação "..yellow.."62,39"..white..")",
    Note = "A maioria das criaturas em Maraudon dropam as Gravuras.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 17775 }, --Acumen Robes Chest, Cloth
        { id = 17776 }, --Sprightring Helm Head, Leather
        { id = 17777 }, --Relentless Chain Chest, Mail
        { id = 17779 }, --Hulkstone Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[4] = {
    Title = "As instruções do pária",
    Id = 7067,
    Level = 48,
    Attain = 39,
    Aim = "Leia as instruções do pária. Depois, obtenha o Amuleto da União de Maraudon e devolva-o ao Centauro Pária no sul da Desolação.",
    Location = "Centauro Pária (Desolação "..yellow.."45,86"..white..")",
    Note = "Os 5 Khans (desc para As Instruções do Pária)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 17774 }, --Mark of the Chosen Trinket
    },
    page = {2, "Você encontra o Pária Centauro no sul de Desolação. Ele anda entre "..yellow.."44,85"..white.." e "..yellow.."50,87"..white..".\nPrimeiro, você deve matar o Profeta Sem Nome ("..yellow.."[A] no Mapa da Entrada"..white.."). Você o encontra antes de entrar na instância, antes do ponto onde você pode escolher se pega a entrada roxa ou a laranja. Depois de matá-lo, você deve matar os 5 Khans. Você encontra o primeiro se escolher o caminho do meio ("..yellow.."[1] no Mapa da Entrada"..white.."). O segundo está na parte roxa de Maraudon, mas antes de entrar na instância ("..yellow.."[2] no Mapa da Entrada"..white.."). O terceiro está na parte laranja antes de entrar na instância ("..yellow.." [3] no Mapa da Entrada"..white.."). O quarto está perto de "..yellow.."[4]"..white.." e o quinto está perto de "..yellow.."[1]"..white.."." },
}
kQuestInstanceData.Maraudon.Alliance[5] = {
    Title = "Lendas de Maraudon",
    Id = 7044,
    Level = 49,
    Attain = 41,
    Aim = "Recupere as duas partes do Cetro de Celebras: o Celebrian Rod e o Celebrian Diamond.$B$BEncontre uma maneira de falar com Celebras.",
    Location = "Cavindra (Desolação - Maraudon "..yellow.."[4] on Entrance Map"..white..")",
    Note = "Você encontra Cavindra no início da parte laranja antes de entrar na instância.\nVocê pega o Cajado de Celebrian de Tóxxico em "..yellow.."[2]"..white..", o Diamante de Celebrian de Lorde Torpelíngua em "..yellow.."[5]"..white..". Celebras está em "..yellow.."[7]"..white..". Você deve derrotá-lo para poder falar com ele.",
    Folgequest = "O Cetro de Celebras",
}
kQuestInstanceData.Maraudon.Alliance[6] = {
    Title = "O Cetro de Celebras",
    Id = 7046,
    Level = 49,
    Attain = 41,
    Aim = "Ajude Celebras, o Redimido enquanto ele cria o Cetro de Celebras.$B$BFale com ele quando o ritual for concluído.",
    Location = "Celebras, o Redimido (Maraudon "..yellow.."[7]"..white..")",
    Note = "Celebras cria o Cetro. Fale com ele depois que ele terminar.",
    Prequest = "Lendas de Maraudon",
    Rewards = {
        Text = "Recompensa: ",
        { id = 17191 }, --Scepter of Celebras Item
    }
}
kQuestInstanceData.Maraudon.Alliance[7] = {
    Title = "Corrupção da Terra e da Semente",
    Id = 7065,
    Level = 51,
    Attain = 45,
    Aim = "Mate a Princesa Theradras e volte para Selendra, perto da Vila Presa Sombria, em Desolação.",
    Location = "Guardião Marandis (Desolação - Ponto de Nijel "..yellow.."63,10"..white..")",
    Note = "Você encontra Princesa Theradras em "..yellow.."[11]"..white..".",
    Folgequest = "Semente da Vida",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 17705 }, --Thrash Blade One-Hand, Sword
        { id = 17743 }, --Resurgence Rod Staff
        { id = 17753 }, --Verdant Keeper's Aim Bow
    }
}
kQuestInstanceData.Maraudon.Alliance[8] = {
    Title = "Semente da Vida",
    Id = 7066,
    Level = 51,
    Attain = 45,
    Aim = "Procure Remulos em Moonglade e dê a ele a Semente da Vida.",
    Location = "Zaetars Ghost (Maraudon "..yellow.."[11]"..white..")",
    Note = "O Fantasma de Zaetar aparece após matar Princesa Theradras "..yellow.."[11]"..white..". Você encontra Guardião Remulos em (Clareira da Lua - Santuário de Remulos "..yellow.."36,41"..white..").",
    Prequest = "Corrupção da Terra e da Semente",
}
kQuestInstanceData.Maraudon.Alliance[9] = {
    Title = "Arnês de Quimerano",
    Id = 41052,
    Level = 48,
    Attain = 38,
    Aim = "Recupere o Arreio do Quimerano de Maraudon e leve-o de volta para Velos Golpe Afiado no Vale do Poleiro da Quimera, em Feralas.",
    Location = "Velos Golpe Afiado (Feralas - Vale Ninho de Quimera "..yellow.."[82.0,62.3]"..white.." canto sudeste de Feralas)",
    Note = "Purple Maraudon satir boss Lorde Torpelíngua "..yellow.."[5]"..white.." drops Arreio de Quimera.",
    Prequest = "Limpando o poleiro -> Alimentando os filhotes",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61517 }, --Chimaera's Eye Trinket
    }
}
kQuestInstanceData.Maraudon.Alliance[10] = {
    Title = "Por que não ambos?",
    Id = 41142,
    Level = 50,
    Attain = 40,
    Aim = "Obtenha o Coração de Soterrador das profundezas de Maraudon e a Essência de Corrosão da Pedreira Forjaódio para Frig Forjatrovão no Ninho da Águia",
    Location = "Frig Thunderforge (Hinterlands - Ninho da Águia "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Soterrador está em "..yellow.."[8]"..white..".",
    Prequest = "Provando um ponto -> Eu li isso em um livro uma vez",
    Folgequest = "Maestria de Trovãoforja",
    Rewards = {
        Text = "Recompensa: ",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
kQuestInstanceData.Maraudon.Alliance[11] = {
    Title = "Preparação",
    Id = 41281,
    Level = 48,
    Attain = 34,
    Aim = "Recupere um pedaço do corpo de Landslide de Mauradon e leve-o para Thegren perto das Ruínas de Corthan em Badlands.",
    Location = "Thegren <Artisan Gemologist> (Ermos - Ruínas de Corthan "..yellow.."[29, 27]"..white..").",
    Note = red.."Apenas Joalheria."..white.." Sequência de missões para especialização em Gemologista.\nSoterrador está em "..yellow.."[8]"..white..".",
    Prequest = "Dominando Gemologia -> A força vital -> Demonstração",
    Folgequest = "O corte final",
}
kQuestInstanceData.Maraudon.Horde[1] = {
    Title = "Fragmentos de Fragmentos Sombrios",
    Id = 7068,
    Level = 42,
    Attain = 38,
    Aim = "Colete 10 fragmentos de Shadowshard de Maraudon e devolva-os para Uthel'nay em Orgrimmar.",
    Location = "Uthel'nay (Orgrimmar - Vale dos Espíritos "..yellow.."39,86"..white..")",
    Note = "Você pega os Fragmentos de Fragmentos Sombrios de 'Estrondor Lascanegra' ou 'Depredador Lascanegra' fora da instância no lado Roxo.",
    Rewards = kQuestInstanceData.Maraudon.Alliance[1].Rewards
}
kQuestInstanceData.Maraudon.Horde[2] = {
    Title = "Corrupção da língua vil",
    Id = 7029,
    Level = 47,
    Attain = 41,
    Aim = "Encha o Frasco de Cerúleo Revestido na piscina de cristal laranja em Maraudon.$B$BUse o Frasco de Cerúleo Preenchido nas vinhas de Vylestem para forçar o Scion Noxxious corrompido a emergir.$B$BCure 8 plantas matando esses Scion Noxxious, depois retorne para Vark Battlescar na Vila Shadowprey.",
    Location = "Vark Chaga de Guerra (Desolação - Aldeia Shadowprey "..yellow.."23,70"..white..")",
    Note = "Você pode encher o Frasco em qualquer poça fora da instância no lado Laranja. As plantas estão nas áreas laranja e roxa dentro da instância.",
    Rewards = kQuestInstanceData.Maraudon.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.Maraudon.Horde[i] = kQuestInstanceData.Maraudon.Alliance[i]
end
kQuestInstanceData.Maraudon.Horde[7] = {
    Title = "Corrupção da Terra e da Semente",
    Id = 7064,
    Level = 51,
    Attain = 45,
    Aim = "Mate a Princesa Theradras e volte para Selendra, perto da Vila Presa Sombria, em Desolação.",
    Location = "Selendra (Desolação "..yellow.."27,77"..white..")",
    Note = "Você encontra Princesa Theradras em "..yellow.."[11]"..white..".",
    Folgequest = "Semente da Vida",
    Rewards = kQuestInstanceData.Maraudon.Alliance[7].Rewards
}
kQuestInstanceData.Maraudon.Horde[8] = kQuestInstanceData.Maraudon.Alliance[8]
kQuestInstanceData.Maraudon.Horde[9] = {
    Title = "Preparação",
    Id = 41281,
    Level = 48,
    Attain = 34,
    Aim = "Recupere um pedaço do corpo de Landslide de Mauradon e leve-o para Thegren perto das Ruínas de Corthan em Badlands.",
    Location = "Thegren <Artisan Gemologist> (Ermos - Ruínas de Corthan "..yellow.."[29, 27]"..white..").",
    Note = red.."Apenas Joalheria."..white.." Sequência de missões para especialização em Gemologista.\nSoterrador está em "..yellow.."[8]"..white..".",
    Prequest = "Dominando Gemologia -> A força vital -> Demonstração",
    Folgequest = "O corte final",
}

--------------- Molten Core ---------------
kQuestInstanceData.MoltenCore = {
    Story = "O Núcleo Derretido fica no fundo do Abismo Rocha Negra. É o coração da Montanha Rocha Negra e o local exato onde, há muito tempo em uma tentativa desesperada de mudar o rumo da guerra civil dos anões, o Imperador Thaurissan invocou o Senhor do Fogo elemental, Ragnaros, para o mundo. Embora o senhor do fogo seja incapaz de se afastar muito do Núcleo ardente, acredita-se que seus lacaios elementais comandam os anões Ferro Negro, que estão no meio da criação de exércitos de pedra viva. O lago ardente onde Ragnaros dorme age como uma fenda conectando ao plano do fogo, permitindo que os elementais maliciosos atravessem. O principal entre os agentes de Ragnaros é Mordomo Executus - pois este elemental astuto é o único capaz de chamar o Senhor do Fogo de seu sono.",
    Caption = "Núcleo Derretido",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.MoltenCore.Alliance[1] = {
    Title = "O Núcleo Derretido",
    Id = 6822,
    Level = 60,
    Attain = 57,
    Aim = "Mate 1 Senhor do Fogo, 1 Gigante Derretido, 1 Cão Antigo do Núcleo e 1 Cirurgião de Lava, depois volte para o Duque Hydraxis em Azshara.",
    Location = "Duque Hidráxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Estes são não-chefes dentro do Núcleo Derretido.",
    Prequest = "Olho do Emberseer ("..yellow.."Upper Blackrock Spire"..white..")", -- 6821",
    Folgequest = "Agente da Hidráxis",
}
kQuestInstanceData.MoltenCore.Alliance[2] = {
    Title = "Mãos do Inimigo",
    Id = 6824,
    Level = 60,
    Attain = 60,
    Aim = "Leve as Mãos de Lucifron, Sulfuron, Gehennas e Shazzrah para o Duque Hydraxis em Azshara.",
    Location = "Duque Hidráxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Lúcifron está em "..yellow.."[2]"..white..", Sulfuron está em "..yellow.."[8]"..white.." e Shazzrah está em "..yellow.."[6]"..white..".",

    Prequest = "Agente da Hidráxis",
    Folgequest = "A recompensa de um herói",
}
kQuestInstanceData.MoltenCore.Alliance[3] = {
    Title = "Thunderaan, o Caçador do Vento",
    Id = 7786,
    Level = 60,
    Attain = 60,
    Aim = "Para libertar Thunderaan, o Caçador do Vento, de sua prisão, você deve apresentar as metades direita e esquerda das Amarrações do Caçador do Vento, 10 barras de Elementium e a Essência do Senhor do Fogo ao Senhor Supremo Demitrian. ",
    Location = "Grão-lorde Dimitriano (Silithus "..yellow.."22,9"..white..")",
    Note = "Parte da sequência de missões Thunderfury, Lâmina Bendita do Buscador dos Ventos. Começa após obter a Braçadeira esquerda ou direita do Busca-ventos de Garr em "..yellow.."[4]"..white.." ou Barão Geddon em "..yellow.."[6]"..white..". Então fale com Grão-lorde Dimitriano para iniciar a sequência. Essência do Senhor do Fogo dropa de Ragnaros em "..yellow.."[10]"..white..". Após entregar esta parte, Príncipe Trovejardus é invocado e você deve matá-lo. Ele é um chefe de raide de 40 jogadores.",
    Prequest = "Examine o navio",
    Folgequest = "Levante-se, Fúria do Trovão!",
}
kQuestInstanceData.MoltenCore.Alliance[4] = {
    Title = "Um contrato vinculativo",
    Id = 7604,
    Level = 60,
    Attain = 60,
    Aim = "Entregue o Contrato da Irmandade do Tório para Lokhtos Darkbargainer se desejar receber os planos do Sulfuron.",
    Location = "Lokhtos Umbrarganha (Abismo Rocha Negra "..yellow.."[15]"..white..")",
    Note = "Você precisa de um Lingote de Sulfuron para pegar o contrato de Lokhtos. Eles dropam de Golemagg, o Incinerador no Núcleo Derretido em "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18592 }, --Plans: Sulfuron Hammer Pattern
    }
}
kQuestInstanceData.MoltenCore.Alliance[5] = {
    Title = "A Folha Antiga",
    Id = 7632,
    Level = 60,
    Attain = 60,
    Aim = "Encontre o dono da Antiga Folha Petrificada. Boa sorte, $N; É um mundo grande.",
    Location = "Folha Petrificada Antiga (dropa de Cache do Senhor do Fogo "..yellow.."[9]"..white..")",
    Note = "Entregue para Vartrus, o Anciente em (Selva Maleva - Bosques Irontree "..yellow.."49,24"..white..").",
    Folgequest = "Lâmina Envolta em Tendão Antigo ("..yellow.."Azuregos"..white..")", -- 7634",
}
kQuestInstanceData.MoltenCore.Alliance[6] = {
    Title = "A única receita",
    Id = 8620,
    Level = 60,
    Attain = 60,
    Aim = "Recupere os 8 capítulos perdidos de Dracônico para Leigos e combine-os com a Encadernação de Livro Mágico e devolva o livro completo de Dracônico para Leigos: Volume II para Narain Suavefantasia em Tanaris.",
    Location = "Narain Suavestilo (Tanaris "..yellow.."65,18"..white..")",
    Note = "Apenas uma pessoa pode saquear o Capítulo. Dracônico para Leigos VIII (dropa de Ragnaros "..yellow.."[10]"..white..")",
    Prequest = "Chamariz!",
    Folgequest = "As boas e as más notícias (Deve completar as sequências de missões Stewvul, Ex-Melhor Amigo e Nunca Me Pergunte Sobre Meus Negócios)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.MoltenCore.Alliance[7] = {
    Title = "Óculos de Vidência? Sem problemas!",
    Id = 8578,
    Level = 60,
    Attain = 60,
    Aim = "Encontre os Óculos de Vidência de Narain e devolva-os para Narain Soothfancy em Tanaris.",
    Location = "Narain Suavestilo (Tanaris "..yellow.."65,18"..white..")",
    Note = "Dropa de chefe no Núcleo Derretido.",
    Prequest = "Stewvul, ex-B.F.F.",
    Folgequest = "As boas e as más notícias (Deve completar as sequências de missões Dracônico para Leigos e Nunca Me Pergunte Sobre Meus Negócios)",
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
    Story = "Flutuando acima das Terras Pestilentas, a necrópole conhecida como Naxxramas serve como sede de um dos oficiais mais poderosos do Rei Lich, o temido lich Kel'Thuzad. Horrores do passado e novos terrores ainda a serem libertados estão se reunindo dentro da necrópole enquanto os servos do Rei Lich preparam seu ataque. Em breve o Flagelo marchará novamente...",
    Caption = "Naxxramas",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Naxxramas.Alliance[1] = {
    Title = "A Queda de Kel'Thuzad",
    Id = 9120,
    Level = 60,
    Attain = 60,
    Aim = "Leve o Filactério de Kel'Thuzad para a Capela Esperança da Luz, nas Terras Pestilentas Orientais.",
    Location = "Kel'Thuzad (Naxxramas "..yellow.."green 2"..white..")",
    Note = "Padre Inigo Montoy (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,58"..white..")",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 23206 }, --Mark of the Champion Trinket
        { id = 23207 }, --Mark of the Champion Trinket
    }
}
kQuestInstanceData.Naxxramas.Alliance[2] = {
    Title = "A única música que conheço...",
    Id = 9232,
    Level = 60,
    Attain = 60,
    Aim = "O Artesão Wilhelm, da Capela Esperança da Luz, nas Terras Pestilentas Orientais, quer que você traga para ele 2 Runas Congeladas, 2 Essências de Água, 2 Safiras Azuis e 30 peças de ouro.",
    Location = "Artesão Wilhelm (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,60"..white..")",
    Note = "Runas Congeladas vêm de Machados Profanos em Naxxramas.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 22700 }, --Glacial Leggings Legs, Cloth
        { id = 22699 }, --Icebane Leggings Legs, Plate
        { id = 22702 }, --Icy Scale Leggings Legs, Mail
        { id = 22701 }, --Polar Leggings Legs, Leather
    }
}
kQuestInstanceData.Naxxramas.Alliance[3] = {
    Title = "Ecos da Guerra",
    Id = 9033,
    Level = 60,
    Attain = 60,
    Aim = "O Comandante Eligor Dawnbringer, na Capela Esperança da Luz, nas Terras Pestilentas Orientais, quer que você mate 5 Monstruosidades Vivas, 5 Gárgulas de Pele Rochosa, 8 Capitães Cavaleiros da Morte e 3 Espreitadores Venenosos.",
    Location = "Comandante Eligor Alvorada (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."82,58"..white..")",
    Note = "As criaturas para esta missão são criaturas comuns no início de cada ala de Naxxramas. Esta missão é um pré-requisito para as missões de armadura Tier 3.",
    Prequest = "A Cidadela do Terror - Naxxramas",
}
kQuestInstanceData.Naxxramas.Alliance[4] = {
    Title = "O Destino de Ramaladni",
    Id = 9229,
    Level = 60,
    Attain = 60,
    Aim = "Entre em Naxxramas e descubra o destino de Ramaladni.",
    Location = "Korfax, Campeão da Luz (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."82,58"..white..")",
    Note = "Um anel para esta missão dropará de uma criatura aleatória em Naxxramas. Todos que têm a missão podem pegá-lo.",
    Folgequest = "Aperto Gelado de Ramaladni",
}
kQuestInstanceData.Naxxramas.Alliance[5] = {
    Title = "Aperto Gelado de Ramaladni",
    Id = 9230,
    Level = 60,
    Attain = 60,
    Aim = "Korfax, na Capela Esperança da Luz, nas Terras Pestilentas Orientais, quer que você traga para ele 1 Runa Congelada, 1 Safira Azul e 1 Barra de Arcanita.",
    Location = "Korfax, Campeão da Luz (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."82,58"..white..")",
    Note = "Runas Congeladas vêm de Machados Profanos em Naxxramas.",
    Prequest = "O Destino de Ramaladni",
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
    Story = "Onyxia é a filha do poderoso dragão Asa da Morte, e irmã do conspirador Nefarian, Senhor do Pico da Rocha Negra. Diz-se que Onyxia se deleita em corromper as raças mortais ao interferir em seus assuntos políticos. Para este fim, acredita-se que ela assume várias formas humanoides e usa seu charme e poder para influenciar assuntos delicados entre as diferentes raças. Alguns acreditam que Onyxia até assumiu um pseudônimo uma vez usado por seu pai - o título da casa real Prestor. Quando não está se intrometendo em assuntos mortais, Onyxia reside em uma caverna ardente abaixo do Dragopântano, um pântano sombrio localizado no Pântano Vadeoso. Lá ela é guardada por seus parentes, os membros restantes do insidioso Voo de Dragões Negros.",
    Caption = "Onyxias Lair",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.OnyxiasLair.Alliance[1] = {
    Title = "A Forja de Quel'Serrar",
    Id = 7509,
    Level = 60,
    Attain = 60,
    Aim = "Dê a Lâmina Élfica Opaca e Plana para o Guardião das Histórias Lydros.",
    Location = "Erudito Lydros (Gládio Cruel - West ou North "..yellow.."[1] Library"..white..")",
    Note = "Solte a Espada na frente de Onyxia quando ela estiver com 10% a 15% de vida. Ela terá que respirar nela e aquecê-la. Quando Onyxia morrer, pegue a espada de volta, clique em seu cadáver e use a espada. Então você estará pronto para entregar a missão.",
    Prequest = "Compêndio de Foror ("..yellow.."Gládio Cruel Oeste"..white..") -> A Forja de Quel'Serrar",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18348 }, --Quel'Serrar Main Hand, Sword
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[2] = {
    Title = "A única receita",
    Id = 8620,
    Level = 60,
    Attain = 60,
    Aim = "Recupere os 8 capítulos perdidos de Dracônico para Leigos e combine-os com a Encadernação de Livro Mágico e devolva o livro completo de Dracônico para Leigos: Volume II para Narain Suavefantasia em Tanaris.",
    Location = "Narain Suavestilo (Tanaris "..yellow.."65, 18"..white..")".."Dracônico para Leigos (dropa de Onyxia "..yellow.."[3]"..white..")",
    Note = "Apenas uma pessoa pode saquear o Capítulo. Dracônico para Leigos VI (dropa de Onyxia "..yellow.."[3]"..white..")",
    Prequest = "Chamariz!",
    Folgequest = "As boas e as más notícias (Deve completar as sequências de missões Stewvul, Ex-Melhor Amigo e Nunca Me Pergunte Sobre Meus Negócios)",
    Rewards = {
        Text = "Recompensa: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[3] = {
    Title = "Vitória para a Aliança",
    Id = 7490,
    Level = 60,
    Attain = 60,
    Aim = "Leve a Cabeça de Onyxia para o Grão-lorde Bolvar Fordragon em Ventobravo.",
    Location = "Cabeça de Onyxia (dropa de Onyxia "..yellow.."[3]"..white..")",
    Note = "Grão-lorde Bolvar Fordragon está em (Ventobravo - Castelo de Ventobravo "..yellow.."78,20"..white.."). Apenas uma pessoa na raide pode saquear este item e a missão só pode ser feita uma vez.\nRecompensas listadas são da sequência seguinte.",
    Folgequest = "Comemorando bons momentos",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
        Title = "Vitória para a Horda",
        Aim = "Leve a Cabeça de Onyxia para Thrall em Orgrimmar.",
        Note = "Thrall está em (Orgrimmar - Vale da Sabedoria "..yellow.."31, 37"..white.."). Apenas uma pessoa na raide pode saquear este item e a missão só pode ser feita uma vez.\nRecompensas listadas são da sequência seguinte.",
        Folgequest = "Para todos verem",
    }
)

--------------- Trincheira dos Espinhos ---------------
kQuestInstanceData.RazorfenDowns = {
    Story = "Construída das mesmas vinhas poderosas que Urzal dos Tuscos, Urzal dos Mortos é a capital tradicional da raça dos javardos. O labirinto extenso e cheio de espinhos abriga um verdadeiro exército de javardos leais, bem como seus sumos sacerdotes - a tribo Cabeça da Morte. Recentemente, no entanto, uma sombra ameaçadora caiu sobre o covil rude. Agentes do Flagelo morto-vivo - liderados pelo lich, Amnennar, o Frigífero - tomaram controle sobre a raça dos javardos e transformaram o labirinto de espinhos em um bastião do poder morto-vivo. Agora os javardos lutam uma batalha desesperada para reconquistar sua amada cidade antes que Amnennar espalhe seu controle pelos Sertões.",
    Caption = "Urzal dos Mortos",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenDowns.Alliance[1] = {
    Title = "Uma Hoste do Mal",
    Id = 6626,
    Level = 35,
    Attain = 28,
    Aim = "Mate 8 Guardas de Batalha de Razorfen, 8 Tecelões de Espinhos de Razorfen e 8 Cabeças da Morte Cultists e retorne para Myriam Moonsinger perto da entrada de Trincheira dos Espinhos.",
    Location = "Mírian Lunacanto (Sertões "..yellow.."49,94"..white..")",
    Note = "Você pode encontrar as criaturas e o doador de missão na área logo antes da entrada da instância.",
}
kQuestInstanceData.RazorfenDowns.Alliance[2] = {
    Title = "Extinguindo o ídolo",
    Id = 3525,
    Level = 37,
    Attain = 32,
    Aim = "Acompanhe Belnistrasz até o ídolo do Quilboar em Trincheira dos Espinhos.$B$BProteja Belnistrasz enquanto ele realiza o ritual para desligar o ídolo.",
    Location = "Belnistrasz (Urzal dos Mortos "..yellow.."[2]"..white..")",
    Note = "A missão prévia é apenas você concordando em ajudá-lo. Várias criaturas aparecem e atacam Belnistrasz enquanto ele tenta desligar o ídolo. Após completar a missão, você pode entregar a missão no braseiro em frente ao ídolo.",
    Prequest = "Flagelo dos Downs",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Alliance[3] = {
    Title = "Traga a luz",
    Id = 3636,
    Level = 42,
    Attain = 39,
    Aim = "O Arcebispo Bendictus quer que você mate Amnennar, o Coldbringer, em Trincheira dos Espinhos.",
    Location = "Arcebispo Benedictus (Ventobravo - Catedral da Luz "..yellow.."39,27"..white..")",
    Note = "Amnennar, o Frigífero é o último chefe em Urzal dos Mortos. Você pode encontrá-lo em "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[1] = kQuestInstanceData.RazorfenDowns.Alliance[1]
kQuestInstanceData.RazorfenDowns.Horde[2] = {
    Title = "Uma aliança profana",
    Id = 6521,
    Level = 36,
    Attain = 28,
    Aim = "Leve a Cabeça do Embaixador Malcin para Varimathras, na Cidade Baixa.",
    Location = "Varimatras (Cidade Baixa - Bairro Real "..yellow.."56,92"..white..")",
    Note = "A missão anterior pode ser obtida do último Chefe em Urzal dos Tuscos. Você encontra Malcin fora (Sertões "..yellow.."48,92"..white..").",
    Prequest = "Uma aliança profana",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 17039 }, --Skullbreaker Main Hand, Mace
        { id = 17042 }, --Nail Spitter Gun
        { id = 17043 }, --Zealot's Robe Chest, Cloth
    }
}
kQuestInstanceData.RazorfenDowns.Horde[3] = {
    Title = "Extinguindo o ídolo",
    Id = 3525,
    Level = 37,
    Attain = 32,
    Aim = "Acompanhe Belnistrasz até o ídolo do Quilboar em Trincheira dos Espinhos.$B$BProteja Belnistrasz enquanto ele realiza o ritual para desligar o ídolo.",
    Location = "Belnistrasz (Urzal dos Mortos "..yellow.."[2]"..white..")",
    Note = "A missão prévia é apenas você concordando em ajudá-lo. Várias criaturas aparecem e atacam Belnistrasz enquanto ele tenta desligar o ídolo. Após completar a missão, você pode entregar a missão no braseiro em frente ao ídolo.",
    Prequest = "Flagelo dos Downs",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Horde[4] = {
    Title = "Traga o fim",
    Id = 3341,
    Level = 42,
    Attain = 37,
    Aim = "Andrew Brownell quer que você mate Amnennar, o Coldbringer, e devolva seu crânio.",
    Location = "André Rosado (Cidade Baixa - O Bairro Mágico "..yellow.."72,32"..white..")",
    Note = "Amnennar, o Frigífero é o último Chefe em Urzal dos Mortos. Você pode encontrá-lo em "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[5] = {
    Title = "Os poderes além",
    Id = 40995,
    Level = 44,
    Attain = 38,
    Aim = "Aventure-se em Trincheira dos Espinhos, mate Amnennar, o Coldbringer, e recupere seu filactério para o Bispo Sombrio Mordren na Igreja Stillward, em Guilnéas.",
    Location = "Bispo Sombrio Mordren (Gilneas - Igreja Stillward "..yellow.."57.7,39.6"..white..")",
    Note = "A sequência de missões começa com a missão 'Através da Magia Maior' em Bispo Sombrio Mordren.\nAmnennar, o Frigífero "..yellow.."[6]"..white.." dropa Fylactério de Obsidiana.\nVocê receberá a recompensa ao terminar a última missão da sequência.",
    Prequest = "Através da Magia Maior -> O Cetro Ravenwood",
    Folgequest = "A Pedra Greymane"..yellow.."[Cidade de Gilneas]"..white.."-> Dádiva do Bispo Sombrio",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}

--------------- Razorfen Kraul ---------------
kQuestInstanceData.RazorfenKraul = {
    Story = "Há dez mil anos - durante a Guerra dos Antigos, o poderoso semideus, Agamaggan, surgiu para combater a Legião Ardente. Embora o javali colossal tenha caído em combate, suas ações ajudaram a salvar Azeroth da ruína. No entanto, com o tempo, nas áreas onde seu sangue caiu, vinhas massivas cheias de espinhos brotaram da terra. Os javardos - acreditados serem os descendentes mortais do poderoso deus, vieram a ocupar essas regiões e mantê-las sagradas. O coração dessas colônias de espinhos era conhecido como Urzal. A grande massa de Urzal dos Tuscos foi conquistada pela velha megera, Charlga Lâmina Navalha. Sob seu governo, os javardos xamanísticos realizam ataques em tribos rivais, bem como vilas da Horda. Alguns especulam que Charlga tem até negociado com agentes do Flagelo - alinhando sua tribo desavisada com as fileiras dos Mortos-Vivos para algum propósito insidioso.",
    Caption = "Urzal dos Tuscos",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenKraul.Alliance[1] = {
    Title = "Tubérculos de folha azul",
    Id = 1221,
    Level = 26,
    Attain = 20,
    Aim = "Pegue uma caixa com buracos.$BPegue um bastão de comando Snufflenose.$BPegue e leia o manual do proprietário do Snufflenose.$B$BEm Razorfen Kraul, use a caixa com buracos para invocar um esquilo Snufflenose e use o bastão de comando no esquilo para fazer procure por tubérculos.$B$BBring 6 tubérculos de folha azul, o bastão de comando Snufflenose e a caixa com furos para o Mebok Mizzyrix em Catraca.",
    Location = "Cáliper Porcatraca (Sertões - Vila Catraca "..yellow.."62,37"..white..")",
    Note = "A Caixa, o Bastão e o Manual podem ser encontrados perto de Cáliper Porcatraca.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6755 }, --A Small Container of Gems Container
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[2] = {
    Title = "A mortalidade diminui",
    Id = 1142,
    Level = 30,
    Attain = 25,
    Aim = "Encontre e devolva o Pingente de Treshala para Treshala Fallowbrook em Darnassus.",
    Location = "Heraltha Fallowbrook (Urzal dos Tuscos "..yellow.."[8]"..white..")",
    Note = "O pingente é um drop aleatório. Você deve levar o pingente de volta para Treshala Corregofulvo em Darnassus - Terraço dos Comerciantes ("..yellow.."69,67"..white..").",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6751 }, --Mourning Shawl Back
        { id = 6752 }, --Lancer Boots Feet, Leather
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[3] = {
    Title = "Willix, o Importador",
    Id = 1144,
    Level = 30,
    Attain = 23,
    Aim = "Escolte Willix, o Importador, para fora de Razorfen Kraul.",
    Location = "Importador Willix (Urzal dos Tuscos "..yellow.."[8]"..white..")",
    Note = "Importador Willix deve ser escoltado até a entrada da instância. A missão é entregue a ele quando concluída.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[4] = {
    Title = "A Velha do Kraul",
    Id = 1101,
    Level = 34,
    Attain = 29,
    Aim = "Leve o Medalhão de Navalha para Falfindel Waywarder em Thalanaar.",
    Location = "Falfindel Trilhemas (Feralas - Thalanaar "..yellow.."89,46"..white..")",
    Note = "Charlga Talhaflanco "..yellow.."[7]"..white.." dropa o Medalhão necessário para esta missão.",
    Prequest = "Diário de Lonebrow",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[5] = {
    Title = "Correio endurecido contra fogo",
    Id = 1701,
    Level = 28,
    Attain = 20,
    Aim = "Reúna os materiais que Furen Barba Longa precisa e leve-os para ele em Ventobravo.",
    Location = "Furen Barbalonga (Stormwind - Distrito Anão "..yellow.."57,16"..white..")",
    Note = red.."Apenas Guerreiro"..white..": Você pega o Frasco de Veneno de Aranha de Rugug em "..yellow.."[1]"..white..".\nA missão seguinte é diferente para cada raça. Sangue Ardente para Humanos, Coral de Ferro para Anões e Gnomos e Conchas Queimadas pelo Sol para Elfos Noturnos.", -- 1705, 1710, 1708    Prequest = "O Escudeiro",
    Folgequest = "(See Note)",
}
kQuestInstanceData.RazorfenKraul.Horde[1] = kQuestInstanceData.RazorfenKraul.Alliance[1]
kQuestInstanceData.RazorfenKraul.Horde[2] = {
    Title = "Willix, o Importador",
    Id = 1144,
    Level = 30,
    Attain = 23,
    Aim = "Escolte Willix, o Importador, para fora de Razorfen Kraul.",
    Location = "Importador Willix (Urzal dos Tuscos "..yellow.."[8]"..white..")",
    Note = "Importador Willix deve ser escoltado até a entrada da instância. A missão é entregue a ele quando concluída.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Horde[3] = {
    Title = "Indo, Indo, Guano!",
    Id = 1109,
    Level = 33,
    Attain = 30,
    Aim = "Leve 1 pilha de Kraul Guano para o Mestre Boticário Faranell na Cidade Baixa.",
    Location = "Mestre-boticário Faranello (Cidade Baixa - O Apotecário "..yellow.."48,69 "..white..")",
    Note = "Guano de Kraul é dropado por qualquer morcego encontrado dentro da instância.",
    Folgequest = "Corações de Zelo ("..yellow.."[Scarlet Monastery]"..white..")", -- 1113",
}
kQuestInstanceData.RazorfenKraul.Horde[4] = {
    Title = "Um destino vingativo",
    Id = 1102,
    Level = 34,
    Attain = 29,
    Aim = "Leve o Coração de Razorflank para Auld Stonespire em Penhasco Trovão.",
    Location = "Auld Agulha de Pedra (Penhasco do Trovão "..yellow.."36,59"..white..")",
    Note = "Você pode encontrar Charlga Talhaflanco em "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Horde[5] = {
    Title = "Armadura Brutal",
    Id = 1838,
    Level = 30,
    Attain = 20,
    Aim = "Leve para Thun'grim Olho de Fogo 15 Lingotes de Ferro Fumegante, 10 Azurita em Pó, 10 Barras de Ferro e um Frasco de Flogístico.",
    Location = "Thun'grim Olhafogo (Sertões "..yellow.."57,30"..white..")",
    Note = red.."Apenas Guerreiro"..white..": Você pega o Frasco de Veneno de Aranha de Rugug em "..yellow.."[1]"..white..".\n\nCompletar esta missão permite que você inicie quatro novas missões do mesmo NPC.",
    Prequest = "Fale com Thun'grim",
    Folgequest = "(See Note)",
}
kQuestInstanceData.RazorfenKraul.Horde[6] = {
    Title = "Coração de Zarza Corrompido",
    Id = 41758,
    Level = 30,
    Attain = 20,
    Aim = "Destrua a encarnação viva da corrupção natural nas profundezas de Razorfen Kraul e traga o Coração de Espinhos Corrompido para Kym Wildmane em Penhasco do Trovão.",
    Location = "Kym Juba Agreste (Penhasco do Trovão - O Elevado dos Anciãos "..yellow.."77,29"..white..")",
    Note = "Coração de Espinho Contaminado é dropado por Podrespinho, localizado em "..yellow.."[5]|r.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 41854 }, --Wildbranch Leggings, Cloth
        { id = 41855 }, --Fenweave Gloves, Mail
    }
}

--------------- SM: Library ---------------
kQuestInstanceData.ScarletMonasteryLibrary = {
    Story = "O Monastério já foi um orgulhoso bastião do sacerdócio de Lordaeron - um centro de aprendizado e iluminação. Com a ascensão do Flagelo morto-vivo durante a Terceira Guerra, o pacífico Monastério foi convertido em uma fortaleza da fanática Cruzada Escarlate. Os Cruzados não toleram todas as raças não humanas, independentemente de aliança ou afiliação. Eles acreditam que todos os forasteiros são potenciais portadores da praga morta-viva - e devem ser destruídos. Relatórios indicam que aventureiros que entram no monastério são forçados a enfrentar Comandante Escarlate Mograine - que comanda uma grande guarnição de guerreiros fanaticamente devotados. No entanto, o verdadeiro mestre do monastério é Alta-inquisidora Cristalba - uma sacerdotisa temível que possui a habilidade de ressuscitar guerreiros caídos para lutar em seu nome.",
    Caption = "Monastério Escarlate: Library",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1] = {
    Title = "Em Nome da Luz",
    Id = 1053,
    Level = 40,
    Attain = 34,
    Aim = "Mate o Alto Inquisidor Juba Branca, o Comandante Escarlate Mograine, Herodes, o Campeão Escarlate e o Mestre de Caça Loksey e depois apresente-se a Raleigh, o Devoto, em Costa Sul.",
    Location = "Raul, o Devotado (Contraforte de Eira dos Montes - Litoral Sul "..yellow.."51,58"..white..")",
    Note = "Esta sequência de missões começa com Irmão Crowley com a missão 'Irmão Anton' em Ventobravo - Catedral da Luz ("..yellow.."42,24"..white..").\nVocê pode encontrar Alta-inquisidora Cristalba e Comandante Escarlate Mograine em "..yellow.."SM: Catedral [2]"..white..", Herodes em "..yellow.."SM: Armaria [1]"..white.." e Mestre de Matilha Lobato em "..yellow.."SM: Biblioteca [1]"..white..".",
    Prequest = "Irmão Anton -> Descendo o Caminho Escarlate",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6829 }, --Sword of Serenity One-Hand, Sword
        { id = 6830 }, --Bonebiter Two-Hand, Axe
        { id = 6831 }, --Black Menace One-Hand, Dagger
        { id = 11262 }, --Orb of Lorica Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[2] = {
    Title = "Mitologia dos Titãs",
    Id = 1050,
    Level = 38,
    Attain = 28,
    Aim = "Recupere a Mitologia dos Titãs do Monastério e leve-a para a bibliotecária Mae Paledust em Altaforja.",
    Location = "Bibliotecária Maé Palidopó (Altaforja - Salão dos Exploradores "..yellow.."74,12"..white..")",
    Note = "O livro está no chão no lado esquerdo de um dos corredores que levam ao Arcanista Doan ("..yellow.."[2]"..white..").",
    Rewards = {
        Text = "Recompensa: ",
        { id = 7746 }, --Explorers' League Commendation Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[3] = {
    Title = "Rituais de Poder",
    Id = 1951,
    Level = 40,
    Attain = 30,
    Aim = "Leve o livro Rituais de Poder para Tabetha em Pântano Vadeoso.",
    Location = "Tabetha (Pântano Vadeoso "..yellow.."43,57"..white..")",
    Note = red.."Apenas Mago"..white..": Você pode encontrar o livro no último corredor que leva ao Arcanista Doan ("..yellow.."[2]"..white..").",
    Prequest = "Obtenha a informação",
    Folgequest = "Varinha do Mago",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[1] = {
    Title = "Corações de Zelo",
    Id = 1113,
    Level = 33,
    Attain = 30,
    Aim = "Mestre Boticário Faranell na Cidade Baixa quer 20 Corações de Zelo.",
    Location = "Mestre-boticário Faranello (Cidade Baixa - O Apotecário "..yellow.."48,69"..white..")",
    Note = "Todas as criaturas no Monastério Escarlate dropam Corações de Zelo.",
    Prequest = "Indo, Indo, Guano! ("..yellow.."[Razorfen Kraul]"..white..")", -- 1109",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[2] = {
    Title = "No Mosteiro Escarlate",
    Id = 1048,
    Level = 42,
    Attain = 33,
    Aim = "Mate o Alto Inquisidor Juba Branca, o Comandante Escarlate Mograine, Herodes, o Campeão Escarlate e o Mestre de Caça Loksey e depois apresente-se a Varimathras na Cidade Baixa.",
    Location = "Varimatras (Cidade Baixa - Bairro Real "..yellow.."56,92"..white..")",
    Note = "Você pode encontrar Alta-inquisidora Cristalba e Comandante Escarlate Mograine em "..yellow.."SM: Catedral [2]"..white..", Herodes em "..yellow.."SM: Armaria [1]"..white.." e Mestre de Matilha Lobato em "..yellow.."SM: Biblioteca [1]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6802 }, --Sword of Omen One-Hand, Sword
        { id = 6803 }, --Prophetic Cane Held In Off-hand
        { id = 10711 }, --Dragon's Blood Necklace Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[3] = {
    Title = "Compêndio dos Caídos",
    Id = 1049,
    Level = 38,
    Attain = 28,
    Aim = "Recupere o Compêndio dos Derrotados do Monastério nas Clareiras de Tirisfal e retorne ao Sábio Buscador da Verdade em Penhasco do Trovão.",
    Location = "Sábio Devoto da Verdade (Penhasco do Trovão "..yellow.."34,47"..white..")",
    Note = "Você pode encontrar o livro na seção Biblioteca do Monastério Escarlate.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 7747 }, --Vile Protector Shield
        { id = 17508 }, --Forcestone Buckler Shield
        { id = 7749 }, --Omega Orb Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[4] = {
    Title = "Teste de Conhecimento",
    Id = 1160,
    Level = 36,
    Attain = 25,
    Aim = "Encontre Braug Dimspirit perto da entrada do Caminho Talondeep nas Montanhas Stonetalon.",
    Location = "Pasqual Fintallas (Cidade Baixa - O Apotecário "..yellow.."57,65"..white..")",
    Note = "A sequência de missões começa com Dorn Espreitaprados com a missão 'Teste de Fé' (Mil Agulhas "..yellow.."53,41"..white.."). Você pode encontrar o livro na Biblioteca do Monastério Escarlate.",
    Prequest = "Teste de Fé -> Teste de Conhecimento",
    Folgequest = "Teste de Conhecimento",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[5] = {
    Title = "Rituais de Poder",
    Id = 1951,
    Level = 40,
    Attain = 30,
    Aim = "Leve o livro Rituais de Poder para Tabetha em Pântano Vadeoso.",
    Location = "Tabetha (Pântano Vadeoso "..yellow.."43,57"..white..")",
    Note = red.."Apenas Mago"..white..": Você pode encontrar o livro no último corredor que leva ao Arcanista Doan ("..yellow.."[2]"..white..").",
    Prequest = "Obtenha a informação",
    Folgequest = "Varinha do Mago",
}

--------------- SM: Armory ---------------
kQuestInstanceData.ScarletMonasteryArmory = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Monastério Escarlate: Armory",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryArmory.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[2] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[2]
kQuestInstanceData.ScarletMonasteryArmory.Horde[3] = {
    Title = "Uma reminiscência de aço",
    Id = 41368,
    Level = 39,
    Attain = 33,
    Aim = "Mate o Intendente do Arsenal Daghelm e devolva o diário de Basil para ele na Cidade Baixa.",
    Location = "Basílio Frias (Cidade Baixa "..yellow.."60, 29"..white..")",
    Note = "Dropado de Intendente de Armaria Daghelm [2].",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 7964 }, --Solid Sharpening Stone Enchant
        { id = 7965 }, --Solid Weightstone Enchant
    }
}

--------------- SM: Cathedral ---------------
kQuestInstanceData.ScarletMonasteryCathedral = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Monastério Escarlate: Cathedral",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[2] = {
    Title = "O Orbe de Kaladus",
    Id = 40233,
    Level = 38,
    Attain = 30,
    Aim = "Aventure-se no Monastério Escarlate e encontre o Orbe de Kaladus, recupere-o e retorne para vigiar o Paladino Janathos na Fortaleza da Guarda da Dor.",
    Location = "Paladino da Vigia Janathos (Pântano das Mágoas - Fortaleza Sorrowguard "..yellow.."2,51"..white..")",
    Note = "Baú de Madeira Antigo contém o item. Você pode encontrar Orbe de Kaladus dentro da segunda câmara, à esquerda de "..yellow.."[2]"..white..".",
    Prequest = "Contos do Passado -> O Tomo Esquecido -> Voltando para Janathos",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60316 }, --Truthkeeper Mantle Shoulder, Plate
        { id = 60317 }, --Lightgraced Mallet Main Hand, Mace
        { id = 60318 }, --Sorrowguard Clutch Waist, Leather
    }
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[3] = {
    Title = "Corrupção Escarlate",
    Id = 40935,
    Level = 44,
    Attain = 35,
    Aim = "Descubra a verdade sobre o destino do Alto Inquisidor Fairbanks para o Irmão Elias na Taverna Shademore em Guilnéas.",
    Location = "Irmão Elias <Scarlet Crusade Emissary> (Gilneas - Ruínas de Greyshire - Estalagem Sombral "..yellow.."[33.6,54.1]"..white..", 2nd floor.)",
    Note = "Aliados contra os mortos-vivos start at same NPC.",
    Prequest = "Aliados contra os mortos-vivos",
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
    Caption = "Monastério Escarlate: Graveyard",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[2] = {
    Title = "A Vingança de Vorrel",
    Id = 1051,
    Level = 33,
    Attain = 25,
    Aim = "Devolva a aliança de casamento de Vorrel Sengutz para Monika Sengutz em Tarren Mill.",
    Location = "Vorrel Sentripaz (Monastério Escarlate - Graveyard "..yellow.."[1]"..white..")",
    Note = "Você pode encontrar Vorrel Sentripaz no início da seção Cemitério do Monastério Escarlate. Nancy Visas, que dropa o anel necessário para esta missão, pode ser encontrada em uma casa nas Montanhas de Alterac ("..yellow.."31,32"..white..").",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3",
        { id = 7751 }, --Vorrel's Boots Feet, Leather
        { id = 7750 }, --Mantle of Woe Shoulder, Cloth
        { id = 4643 }, --Grimsteel Cape Back
    }
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[3] = {
    Title = "Pinte as rosas de vermelho",
    Id = 60116,
    Level = 29,
    Attain = 27,
    Aim = "Elimine as forças Escarlate fora do Monastério Escarlate e depois retorne para Deathguard Burgess em Brill.",
    Location = "Necroguarda Belchior (Clareiras de Tirisfal - Brill "..yellow.."61,52"..white..")",
    Note = "Você pode completar esta missão do lado de fora.\nA sequência de missões começa com Estalajadeiro Ronan <Estalajadeiro> em Cidade Baixa com a missão 'Escarlate de raiva'.",
    Prequest = "Escarlate de raiva",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 51832 }, --Nathrezim Wedge Main Hand, Axe
        { id = 51833 }, --Femur Staff Staff
        { id = 51834 }, --Scarlet Pillar Two-Hand, Mace
    }
}

--------------- Scholomance ---------------
kQuestInstanceData.Scholomance = {
    Story = "A Scolomântia está alojada dentro de uma série de criptas que ficam sob as ruínas de Caer Darrow. Uma vez propriedade da nobre família Barov, Caer Darrow caiu em ruína após a Segunda Guerra. Enquanto o mago Kel'thuzad recrutava seguidores para seu Culto do Condenado, ele frequentemente prometia imortalidade em troca de servir seu Rei Lich. A família Barov caiu sob a influência carismática de Kel'thuzad e doou o forte e suas criptas ao Flagelo. Os cultistas então mataram os Barovs e transformaram as antigas criptas em uma escola de necromancia conhecida como Scolomântia. Embora Kel'thuzad não resida mais nas criptas, cultistas devotados e instrutores ainda permanecem. O poderoso lich, Ras Friomúrmuro, governa o local e o guarda em nome do Flagelo - enquanto o necromante mortal, Mestre Sombrio Gandling, serve como o insidioso diretor da escola.",
    Caption = "Scolomântia",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Scholomance.Alliance[1] = {
    Title = "Filhotes Atormentados",
    Id = 5529,
    Level = 58,
    Attain = 55,
    Aim = "Mate 20 Filhotes Pesteados e depois volte para Betina Bigglezink na Capela Esperança da Luz.",
    Location = "Betina Bigozinco (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Os Filhotes Atormentados estão no caminho para Ossorrange em uma grande sala.",
    Folgequest = "Escama de Dragão Saudável",
}
kQuestInstanceData.Scholomance.Alliance[2] = {
    Title = "Escama de Dragão Saudável",
    Id = 5582,
    Level = 58,
    Attain = 55,
    Aim = "Leve a Escama de Dragão Saudável para Betina Bigglezink na Capela Esperança da Luz, nas Terras Pestilentas Orientais.",
    Location = "Escama Saudável de Dragão (random drop in Scolomântia)",
    Note = "Filhotes Atormentados dropam as Escamas de Dragão Saudáveis (8% de chance de drop). Você pode encontrar Betina Bigozinco em Terras Pestilentas Orientais - Capela da Esperança da Luz ("..yellow.."81,59"..white..").",
    Prequest = "Filhotes Atormentados",
}
kQuestInstanceData.Scholomance.Alliance[3] = {
    Title = "Doutor Theolen Krastinov, o Açougueiro",
    Id = 5382,
    Level = 60,
    Attain = 55,
    Aim = "Encontre o Doutor Theolen Krastinov dentro da Scolomântia. Destrua-o e queime os restos mortais de Eva Sarkhoff e os restos mortais de Lucien Sarkhoff. Volte para Eva Sarkhoff quando a tarefa for concluída.",
    Location = "Eva Sarkhoff (Terras Pestilentas Ocidentais - Caer Darrow "..yellow.."70,73"..white..")",
    Note = "Você encontra Doutor Theolen Krastinov, os restos mortais de Eva Sarkhoff e os restos mortais de Lucien Sarkhoff em "..yellow.."[9]"..white..".",
    Folgequest = "Saco de Horrores de Krastinov",
}
kQuestInstanceData.Scholomance.Alliance[4] = {
    Title = "Krastinov's Bag of Horrors",
    Id = 5515,
    Level = 60,
    Attain = 55,
    Aim = "Leve o Saco de Horrores para Eva Sarkhoff em Caer Darrow.",
    Location = "Eva Sarkhoff (Terras Pestilentas Ocidentais - Caer Darrow "..yellow.."70,73"..white..")",
    Note = "Você pode encontrar Janice Barov em "..yellow.."[3]"..white..".",
    Prequest = "Doutor Theolen Krastinov, o Açougueiro",
    Folgequest = "Kirtonos, o Arauto",
}
kQuestInstanceData.Scholomance.Alliance[5] = {
    Title = "Kirtonos, o Arauto",
    Id = 5384,
    Level = 60,
    Attain = 55,
    Aim = "Retorne à Scholomance com o Sangue dos Inocentes. Encontre a varanda e coloque o Sangue dos Inocentes no braseiro. Kirtonos virá festejar com sua alma.$B$BLute valentemente, não ceda nem um centímetro! Destrua Kirtonos e retorne para Eva Sarkhoff.",
    Location = "Eva Sarkhoff (Terras Pestilentas Ocidentais - Caer Darrow "..yellow.."70,73"..white..")",
    Note = "A varanda está em "..yellow.."[2]"..white..".",
    Prequest = "Saco de Horrores de Krastinov",
    Folgequest = "O Humano, Ras Sussurro Gélido",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3",
        { id = 13544 }, --Spectral Essence Trinket
        { id = 15805 }, --Penelope's Rose Held In Off-hand
        { id = 15806 }, --Mirah's Song One-Hand, Sword
    }
}
kQuestInstanceData.Scholomance.Alliance[6] = {
    Title = "O Lich, Ras Sussurro Gélido",
    Id = 5466,
    Level = 60,
    Attain = 57,
    Aim = "Encontre Ras Frostwhisper em Scholomance. Quando você o encontrar, use o Soulbound Keepsake em seu rosto de morto-vivo. Se você conseguir revertê-lo a um mortal, derrube-o e recupere a Cabeça Humana de Ras Sussurro Gélido. Leve a cabeça de volta ao Magistrado Marduke.",
    Location = "Magistrado Marduque (Terras Pestilentas Ocidentais - Caer Darrow "..yellow.."70,73"..white..")",
    Note = "Você pode encontrar Ras Friomúrmuro em "..yellow.."[7]"..white..".",
    Prequest = "O Humano, Ras Sussurro Gélido -> Lembrança vinculada à alma",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3 ou 4",
        { id = 14002 }, --Darrowshire Strongguard Shield
        { id = 13982 }, --Warblade of Caer Darrow Two-Hand, Sword
        { id = 13986 }, --Crown of Caer Darrow Head, Cloth
        { id = 13984 }, --Darrowspike One-Hand, Dagger
    }
}
kQuestInstanceData.Scholomance.Alliance[7] = {
    Title = "Fortuna da família Barov",
    Id = 5343,
    Level = 60,
    Attain = 52,
    Aim = "Aventure-se em Scholomance e recupere a fortuna da família Barov. Quatro escrituras constituem esta fortuna: A Escritura de Caer Darrow; A Escritura para Brill; A escritura de Tarren Mill; e A escritura de Southshore. Volte para Alexi Barov quando tiver concluído esta tarefa.",
    Location = "Weldon Barov (Terras Pestilentas Ocidentais - Acampamento de Ventogelado "..yellow.."43,83"..white..")",
    Note = "Você pode encontrar O Título de Caer Darrow em "..yellow.."[12]"..white..", O Título de Brill em "..yellow.."[7]"..white..", O Título de Moinho Tarren em "..yellow.."[4]"..white.." e O Título de Litoral Sul em "..yellow.."[1]"..white..".",
    Folgequest = "O Último Barov",
}
kQuestInstanceData.Scholomance.Alliance[8] = {
    Title = "O Gambito do Amanhecer",
    Id = 4771,
    Level = 60,
    Attain = 57,
    Aim = "Coloque o Gambito de Dawn na Sala de Observação de Scholomance.  Derrote Vectus e volte para Betina Bigglezink.",
    Location = "Betina Bigozinco (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Essência da Ninhada começa com Vera Brequim (Estepes Ardentes - Ponto de Brasaférrea "..yellow.."65,23"..white.."). A Sala de Observação está em "..yellow.."[6]"..white..".",
    Prequest = "Essência de ninhada -> Betina Bigglezink",
    Rewards = {
        Text = "Rewards:",
        { id = 15853 }, --Windreaper One-Hand, Axe
        { id = 15854 }, --Dancing Sliver Staff
    }
}
kQuestInstanceData.Scholomance.Alliance[9] = {
    Title = "Entrega de Imp",
    Id = 7629,
    Level = 60,
    Attain = 60,
    Aim = "Leve o Diabrete em uma Jarra para o laboratório de alquimia em Scolomântia. Depois que o pergaminho for criado, devolva o frasco para Gorzeeki Selvagolhos.",
    Location = "Gorzeeki Olholouco (Estepes Ardentes "..yellow.."12,31"..white..")",
    Note = red.."Apenas Bruxo"..white..": Você encontra o laboratório de alquimia em "..yellow.."[7]"..white..".",
    Prequest = "Mor'zul Sanguinário -> Poeira Estelar Xorothiana",
    Folgequest = "Corcel Temidor de Xoroth ("..yellow.."Dire Maul West"..white..")", -- 7631",
}
kQuestInstanceData.Scholomance.Alliance[10] = {
    Title = "A peça esquerda do amuleto de Lord Valthalak",
    Id = 8969,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Volte para Bodley dentro da Montanha Rocha Negra com o Pedaço Esquerdo do Amuleto de Lord Valthalak e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nKormok é invocado em "..yellow.."[7]"..white..".",
    Prequest = "Componentes de importância",
    Folgequest = "Vejo a Ilha Alcaz no seu futuro...",
}
kQuestInstanceData.Scholomance.Alliance[11] = {
    Title = "A peça certa do amuleto de Lord Valthalak",
    Id = 8992,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Retorne a Bodley dentro da Montanha Rocha Negra com o Amuleto de Lord Valthalak recombinado e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nKormok é invocado em "..yellow.."[7]"..white..".",
    Prequest = "Mais componentes de importância",
    Folgequest = "Preparativos Finais ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
}
kQuestInstanceData.Scholomance.Alliance[12] = {
    Title = "Um favor para Farsan",
    Id = 40237,
    Level = 58,
    Attain = 55,
    Aim = "Aventure-se em Scolomântia e recupere o livro 'Invocação e Comando do Fogo' para Strahad Farsan em Vila Catraca.",
    Location = "Strahad Farsan (Sertões - Vila Catraca "..yellow.."62.6,35.5"..white..")",
    Note = "A sequência de missões começa com Artesão Wilhelm (Terras Pestilentas Orientais - Capela da Esperança da Luz) com a missão 'Uma nova fronteira rúnica'.\n!!! Você receberá esta recompensa ao terminar a última missão da sequência.",
    Prequest = "Uma nova fronteira rúnica -> Os segredos da forja negra -> Os segredos da forja negra",
    Folgequest = "Um encontro com o Dreadlord",
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
        Aim = "Aventure-se em Scolomântia e recupere o livro 'Invocação e Comando do Fogo' para Strahad Farsan em Vila Catraca.",
        Location = "Alexei Barov (Clareiras de Tirisfal - A Muralha "..yellow.."80,73"..white..")",
    }
)

--------------- Shadowfang Keep ---------------
kQuestInstanceData.ShadowfangKeep = {
    Story = "Durante a Terceira Guerra, os magos do Kirin Tor lutaram contra os exércitos mortos-vivos do Flagelo. Quando os magos de Dalaran morriam em batalha, eles logo se levantavam - adicionando seu antigo poder ao crescente Flagelo. Frustrado por sua falta de progresso (e contra o conselho de seus pares) o Arquimago, Arugal decidiu invocar entidades extra-dimensionais para reforçar as fileiras cada vez menores de Dalaran. A invocação de Arugal trouxe os vorazes worgens para o mundo de Azeroth. Os homens-lobo selvagens massacraram não apenas o Flagelo, mas rapidamente se voltaram contra os próprios magos. Os worgens sitiaram o forte do nobre, Barão Vilver. Situado acima da pequena vila de Taurapíreo, o forte rapidamente caiu em sombras e ruína. Enlouquecido pela culpa, Arugal adotou os worgens como seus filhos e recuou para a recém-apelidada 'Bastilha da Presa Negra'. Diz-se que ele ainda reside lá, protegido por seu enorme animal de estimação, Fenrus - e assombrado pelo fantasma vingativo do Barão Vilver.",
    Caption = "Bastilha da Presa Negra",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ShadowfangKeep.Alliance[1] = {
    Title = "O Teste da Justiça",
    Id = 1654,
    Level = 22,
    Attain = 20,
    Aim = "Fale com Jordan Stilwell em Altaforja.",
    Location = "Jardel Calmafonte (Dun Morogh - Altaforja Entrance "..yellow.."52,36"..white..")",
    Note = red.."Apenas Paladino"..white..": Para ver a nota clique em "..yellow.."[Informações de O Teste da Justiça]"..white..".",
    Prequest = "O Tomo do Valor -> O Teste da Justiça",
    Folgequest = "O Teste da Justiça",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = kQuestInstanceData.TheDeadmines.Alliance[6].Page
}
kQuestInstanceData.ShadowfangKeep.Alliance[2] = {
    Title = "O Orbe de Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Encontre 3 Fragmentos de Soran'ruk e 1 Fragmento Grande de Soran'ruk e devolva-os para Doan Karhan nos Sertões.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Apenas BRUXO"..white..": Você pega os 3 Fragmentos de Soran'ruk de Acólitos do Crepúsculo em "..yellow.."[Profundezas Negras]"..white..". Você pega o Fragmento de Soran'ruk Grande em "..yellow.."[Bastilha da Presa Negra]"..white.." de Almasombrias Dente de Shadowfang.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[3] = {
    Title = "A loucura de Arugal",
    Id = 99,
    Level = 27,
    Attain = 22,
    Location = "Grão-Feiticeiro Andromath (Ventobravo - O Distrito Mago, Torre do Mago)",
    Note = "Grão-Feiticeiro Andromath o encarregou com a morte de Arquimago Arugal "..yellow.."[12]"..white..". Retorne a ele quando terminar.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 51805 }, --Signet of Arugal Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[4] = {
    Title = "O Feiticeiro Desaparecido",
    Id = 60109,
    Level = 24,
    Attain = 22,
    Aim = "O Alto Feiticeiro Andromath quer que você viaje até a Bastilha Presa Negra, na Floresta de Pinhaprata, e descubra o que aconteceu com o Feiticeiro Ashcrombe.",
    Location = "Grão-Feiticeiro Andromath (Ventobravo - O Distrito Mago, Torre do Mago)",
    Note = "Feiticeiro Ashcrombe está na jaula "..yellow.."[1]"..white..".",
}
kQuestInstanceData.ShadowfangKeep.Alliance[5] = {
    Title = "Sangue de Vorgendor",
    Id = 41378,
    Level = 60,
    Attain = 60,
    Aim = "Colete sangue de worgen para Fandral Staghelm. Ele exige amostras de sangue de Karazhan, Gilneas City e Shadowfang Keep.",
    Location = "Arquidruida Fandral Guenelmo (Darnassus - Enclave Cenariano "..yellow.."35,9"..white..").",
    Note = "[Sangue de Dente de Shadowfang] dropa de Worgens."..white.."\n[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Foice da Deusa",
    Folgequest = "Sangue de lobo",
}
kQuestInstanceData.ShadowfangKeep.Horde[1] = {
    Title = "Perseguidores da Morte em Presa Sombria",
    Id = 1098,
    Level = 25,
    Attain = 18,
    Aim = "Encontre o Deathstalker Adamant e o Deathstalker Vincent.",
    Location = "Alto-executor Hadrec (Floresta de Pinhaprata - O Sepulcro "..yellow.."43,40"..white..")",
    Note = "Você encontra Sicário Admeto em "..yellow.."[1]"..white..". Sicário Vicente está no lado direito quando você entra no pátio em "..yellow.."[2]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 3324 }, --Ghostly Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[2] = {
    Title = "O Livro de Ur",
    Id = 1013,
    Level = 26,
    Attain = 16,
    Aim = "Leve o Livro de Ur para o Guardião Bel'dugur no Boticário na Cidade Baixa.",
    Location = "Guardião Bel'dugur (Cidade Baixa - O Apotecário "..yellow.."53,54"..white..")",
    Note = "Você encontra o livro em "..yellow.."[8]"..white.." no lado esquerdo quando você entra na sala.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6335 }, --Grizzled Boots Feet, Leather
        { id = 4534 }, --Steel-clasped Bracers Wrist, Mail
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[3] = {
    Title = "Arugal deve morrer",
    Id = 1014,
    Level = 27,
    Attain = 18,
    Aim = "Mate Arugal e leve sua cabeça para Dalar Dawnweaver no Sepulcro.",
    Location = "Dalar Tessalba (Floresta de Pinhaprata - O Sepulcro "..yellow.."44,39"..white..")",
    Note = "Você encontra Arquimago Arugal em "..yellow.."[12]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 6414 }, --Seal of Sylvanas Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[4] = {
    Title = "O Orbe de Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Encontre 3 Fragmentos de Soran'ruk e 1 Fragmento Grande de Soran'ruk e devolva-os para Doan Karhan nos Sertões.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Apenas BRUXO"..white..": Você pega os 3 Fragmentos de Soran'ruk de Acólitos do Crepúsculo em "..yellow.."[Profundezas Negras]"..white..". Você pega o Fragmento de Soran'ruk Grande em "..yellow.."[Bastilha da Presa Negra]"..white.." de Almasombrias Dente de Shadowfang.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[5] = {
    Title = "Nas mandíbulas",
    Id = 40281,
    Level = 25,
    Attain = 15,
    Aim = "Encontre os pertences de Melenas na Biblioteca da Fortaleza Presa Negra e devolva-os para Pierce Shackleton na Cidade Baixa.",
    Location = "Frederico Grilhões (Cidade Baixa - Magic Quarter "..yellow.."85.4,13.6"..white..")",
    Note = "Você encontra Pertences de Melenas em "..yellow.."[12]"..white..", uma caixa no chão entre duas estantes à esquerda.\nA sequência de missões começa com Duque Nargelas (Clareiras de Tirisfal - Comarca do Vale, oeste de Clareiras de Tirisfal).\nVocê receberá a recompensa da missão ao terminar a próxima missão.",
    Prequest = "Patrimônio de Darlthos -> Um tipo diferente de bloqueio -> Caminhos da Magia",
    Folgequest = "Legado de Darlthos",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60392 }, --Sword of Laneron Two-Hand, Sword
        { id = 60393 }, --Shield of Mathela Shield
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[6] = {
    Title = "Tarde demais para prelado",
    Id = 41366,
    Level = 22,
    Attain = 16,
    Aim = "Mate o Prelado Juba de Ferro e retorne ao Padre Brightcopf em Glenshire.",
    Location = "Padre Brightcopf (Shire do Vale "..yellow.."20.8, 68.7"..white..")",
    Note = "Você precisa matar Prelado Juba de Ferro [13].\nSequência de missões começa com Necroguarda Rodrigo (Floresta de Pinhaprata - O Sepulcro "..yellow.."43, 42"..white..")",
    Prequest = "Para proteger os mortos-vivos -> Para ajudar Brightcopf",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70225 }, --Necklace of Redemption Neck
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[7] = {
    Title = "O Lobo, a Velha e a Foice",
    Id = 41381,
    Level = 60,
    Attain = 60,
    Aim = "Colete sangue de worgen para Magatha Grimtotem. Ela exige amostras de sangue de Karazhan, Gilneas City e Shadowfang Keep.",
    Location = "Magatha Temível Totem (Penhasco do Trovão - O Elevado dos Anciãos "..yellow.."70,31"..white..").",
    Note = "[Sangue de Dente de Shadowfang] dropa de Worgens."..white.."\n[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Foice da Deusa",
    Folgequest = "Sangue de lobo",
}

--------------- Stratholme ---------------
kQuestInstanceData.Stratholme = {
    Story = "Uma vez a joia do norte de Lordaeron, a cidade de Stratholme é onde o Príncipe Arthas se voltou contra seu mentor, Uther Portador da Luz, e massacrou centenas de seus próprios súditos que se acreditava terem contraído a temida praga da não-morte. A espiral descendente de Arthas e sua rendição final ao Rei Lich logo se seguiu. A cidade quebrada agora é habitada pelo Flagelo morto-vivo - liderado pelo poderoso lich, Kel'thuzad. Um contingente de Cruzados Escarlates, liderados pelo Grão-Cruzado Dathrohan, também controla uma porção da cidade devastada. Os dois lados estão travados em combate constante e violento. Aqueles aventureiros corajosos (ou tolos) o suficiente para entrar em Stratholme serão forçados a enfrentar ambas as facções em breve. Diz-se que a cidade é guardada por três torres de vigia massivas, assim como poderosos necromantes, banshees e abominações. Também houve relatos de um maléfico Cavaleiro da Morte cavalgando sobre um corcel profano - dispensando fúria indiscriminada em todos aqueles que se aventuram dentro do reino do Flagelo.",
    Caption = "Stratholme",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Stratholme.Alliance[1] = {
    Title = "A carne não mente",
    Id = 5212,
    Level = 60,
    Attain = 55,
    Aim = "Recupere 20 Amostras de Carne Pesteada de Stratholme e devolva-as para Betina Bigglezink. Você suspeita que qualquer criatura em Stratholme teria dito amostra de carne.",
    Location = "Betina Bigozinco (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "A maioria das criaturas em Stratholme pode dropar as Amostras de Carne Pestilenta.",
    Folgequest = "O Agente Ativo",
}
kQuestInstanceData.Stratholme.Alliance[2] = {
    Title = "O Agente Ativo",
    Id = 5213,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para Stratholme e procure nos zigurates. Encontre e devolva novos dados do Flagelo para Betina Bigglezink.",
    Location = "Betina Bigozinco (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Os Dados da Praga estão em uma das 3 Torres, você encontra perto de "..yellow.."[15]"..white..", "..yellow.."[16]"..white.." e "..yellow.."[17]"..white..".",
    Prequest = "A carne não mente",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 13209 }, --Seal of the Dawn Trinket
        { id = 19812 }, --Rune of the Dawn Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[3] = {
    Title = "Casas do Santo",
    Id = 5243,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para Stratholme, no norte. Procure nas caixas de suprimentos que estão espalhadas pela cidade e recupere 5 Água Benta de Stratholme. Volte para Leonid Barthalomew, o Reverenciado, quando tiver coletado o suficiente do fluido abençoado.",
    Location = "Leonid Bartolomeu, o Venerado (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."80,58"..white..")",
    Note = "Você pode encontrar a Água Benta em baús em todos os lugares em Stratholme. Mas se você abrir um baú, insetos podem aparecer e atacá-lo.",
    Rewards = {
        Text = "Recompensa: 1 e 2 e 3 ou 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 13216 }, --Crown of the Penitent Head, Cloth
        { id = 13217 }, --Band of the Penitent Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[4] = {
    Title = "O Grande Halric Emberlain",
    Id = 5214,
    Level = 60,
    Attain = 55,
    Aim = "Encontre a tabacaria de Halric Emberlain em Stratholme e recupere uma caixa de Tabaco Premium de Siabi. Volte para Smokey LaRue quando o trabalho estiver concluído.",
    Location = "Leandro Leonardo (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."80,58"..white..")",
    Note = "Você encontra a loja de fumo perto de "..yellow.."[1]"..white..". Fras Siabi aparece quando você abre a caixa.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 13171 }, --Smokey's Lighter Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[5] = {
    Title = "As almas inquietas",
    Id = 5282,
    Level = 60,
    Attain = 55,
    Aim = "Encontre Egan. Você só sabe que ele foi visto pela última vez perto de Stratholme.",
    Location = "Egan (Terras Pestilentas Orientais "..yellow.."14,33"..white..")",
    Note = "Você pega a missão prévia de Zelador Alen (Terras Pestilentas Orientais - Capela da Esperança da Luz "..yellow.."79,63"..white.."). Os cidadãos espectrais caminham por toda Stratholme.",
    Prequest = "As almas inquietas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 13315 }, --Testament of Hope Held In Off-hand
    }
}
kQuestInstanceData.Stratholme.Alliance[6] = {
    Title = "De amor e família",
    Id = 5848,
    Level = 60,
    Attain = 52,
    Aim = "Viaje para a ilha de Caer Darrow, na região centro-sul das Terras Pestilentas, e procure por pistas sobre o paradeiro da pintura.",
    Location = "Artista Renée (Terras Pestilentas Ocidentais - Caer Darrow "..yellow.."65,75"..white..")",
    Note = "Você pega a missão prévia de Tirion Fordring (Terras Pestilentas Ocidentais "..yellow.."7,43"..white.."). Você pode encontrar a pintura perto de "..yellow.."[10]"..white..".",
    Prequest = "Redenção -> De amor e família",
    Folgequest = "Encontre Myranda",
}
kQuestInstanceData.Stratholme.Alliance[7] = {
    Title = "Presente de Menethil",
    Id = 5463,
    Level = 60,
    Attain = 57,
    Aim = "Viaje para Stratholme e encontre o presente de Menethil. Coloque a Lembrança da Lembrança no solo profano. ",
    Location = "Leonid Bartolomeu, o Venerado (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."80,58"..white..")",
    Note = "Você pega a missão prévia de Magistrado Marduque (Terras Pestilentas Ocidentais - Caer Darrow "..yellow.."70,73"..white.."). Você encontra a placa perto de "..yellow.."[19]"..white..". Veja também: "..yellow.."[O Lich, Ras Friomúrmuro]"..white.." em Scolomântia.",
    Prequest = "O Humano Ras Frostraunen -> O Moribundo, Ras Frostwhisper",
    Folgequest = "Presente de Menethil",
}
kQuestInstanceData.Stratholme.Alliance[8] = {
    Title = "O cálculo de Aurius",
    Id = 5125,
    Level = 60,
    Attain = 55,
    Aim = "Mate o Barão.",
    Location = "Aurius (Stratholme "..yellow.."[13]"..white..")",
    Note = "Para iniciar a missão você deve dar a Aurius [O Medalhão da Fé]. Você pega o Medalhão de um baú (Caixa Forte de Malor "..yellow.."[7]"..white..") na primeira câmara do bastião (antes dos caminhos se dividirem). Depois de dar a Aurius o Medalhão, ele apoia seu grupo na luta contra o Barão "..yellow.."[19]"..white..". Depois de matar o Barão você deve falar com Aurius novamente para pegar as Recompensas.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 17044 }, --Will of the Martyr Neck
        { id = 17045 }, --Blood of the Martyr Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[9] = {
    Title = "O Arquivista",
    Id = 5251,
    Level = 60,
    Attain = 55,
    Aim = "Viaje para Stratholme e encontre o Arquivista Galford da Cruzada Escarlate. Destrua-o e queime o Arquivo Escarlate.",
    Location = "Duque Nicolau Zverenhoff (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Você pode encontrar o Arquivo e o Arquivista em "..yellow.."[10]"..white..".",
    Folgequest = "A verdade desaba",
}
kQuestInstanceData.Stratholme.Alliance[10] = {
    Title = "A verdade desaba",
    Id = 5262,
    Level = 60,
    Attain = 55,
    Aim = "Leve a Cabeça de Balnazzar ao Duque Nicholas Zverenhoff nas Terras Pestilentas Orientais.",
    Location = "Balnazzar (Stratholme "..yellow.."[11]"..white..")",
    Note = "Você encontra Duque Nicolau Zverenhoff nas Terras Pestilentas Orientais - Capela da Esperança da Luz ("..yellow.."81,59"..white..").",
    Prequest = "O Arquivista",
    Folgequest = "Acima e além",
}
kQuestInstanceData.Stratholme.Alliance[11] = {
    Title = "Acima e além",
    Id = 5263,
    Level = 60,
    Attain = 55,
    Aim = "Aventure-se em Stratholme e destrua o Barão Rivendare. Pegue sua cabeça e volte para o duque Nicholas Zverenhoff.",
    Location = "Duque Nicolau Zverenhoff (Terras Pestilentas Orientais - Capilla Esperanza de la Luz "..yellow.."81,59"..white..")",
    Note = "Você pode encontrar o Barão em "..yellow.."[19]"..white..".",
    Prequest = "A verdade desaba",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 13243 }, --Argent Defender Shield
        { id = 13249 }, --Argent Crusader Staff
        { id = 13246 }, --Argent Avenger One-Hand, Sword
    }
}
kQuestInstanceData.Stratholme.Alliance[12] = {
    Title = "O apelo do homem morto",
    Id = 8945,
    Level = 60,
    Attain = 58,
    Aim = "Vá para Stratholme e resgate Ysida Harmon do Barão Rivendare.",
    Location = "Anthion Harmon (Terras Pestilentas Orientais - Stratholme)",
    Note = "Anthion está logo do lado de fora do portal de Stratholme. Você precisa do Revelador Extra-Dimensional de Fantasmas para vê-lo. Ele vem da missão prévia. A sequência de missões começa com Apenas Compensação. Deliana em Altaforja ("..yellow.."43,52"..white..") para Aliança, Mokvar em Orgrimmar ("..yellow.."38,37"..white..") para Horda.\nEsta é a infame corrida de 45 minutos do Barão.",
    Prequest = "Em busca do antião",
    Folgequest = "Prova de Vida",
}
kQuestInstanceData.Stratholme.Alliance[13] = {
    Title = "A peça esquerda do amuleto de Lord Valthalak",
    Id = 8968,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Volte para Bodley dentro da Montanha Rocha Negra com o Pedaço Esquerdo do Amuleto de Lord Valthalak e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nJarien e Soeiro são invocados em "..yellow.."[11]"..white..".",
    Prequest = "Componentes de importância",
    Folgequest = "Vejo a Ilha Alcaz no seu futuro...",
}
kQuestInstanceData.Stratholme.Alliance[14] = {
    Title = "A peça certa do amuleto de Lord Valthalak",
    Id = 8991,
    Level = 60,
    Attain = 58,
    Aim = "Use o Braseiro do Aceno para invocar o espírito de Mor Casco Cinzento e matá-lo. Retorne a Bodley dentro da Montanha Rocha Negra com o Amuleto de Lord Valthalak recombinado e o Braseiro do Aceno.",
    Location = "Bodley (Montanha Rocha Negra "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Revelador Extra-Dimensional de Fantasmas é necessário para ver Bodley. Você o pega da missão 'Em busca do antião'.\n\nJarien e Soeiro são invocados em "..yellow.."[11]"..white..".",
    Prequest = "Mais componentes de importância",
    Folgequest = "Preparativos Finais ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
}
kQuestInstanceData.Stratholme.Alliance[15] = {
    Title = "Atiesh, Grande Cajado do Guardião",
    Id = 9257,
    Level = 60,
    Attain = 60,
    Aim = "Anachronos, nas Cavernas do Tempo, em Tanaris, quer que você leve Atiesh, Grande Cajado do Guardião, para Stratholme e use-o na Terra Consagrada. Derrote a entidade que foi exorcizada do cajado e retorne para ele.",
    Location = "Anacronos (Tanaris - Cavernas do Tempo "..yellow.."65,49"..white..")",
    Note = "Atiesh é invocado em "..yellow.."[2]"..white..".",
    Prequest = "Quadro de Atiesh -> Atiesh, o Grande Cajado Contaminado",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 22589 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22630 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22631 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22632 }, --Atiesh, Greatstaff of the Guardian Staff
    }
}
kQuestInstanceData.Stratholme.Alliance[16] = {
    Title = "Corrupção",
    Id = 5307,
    Level = 60,
    Attain = 50,
    Aim = "Encontre o Espadachim da Guarda Negra em Stratholme e destrua-o. Recupere a Insígnia da Guarda Negra e retorne para Seril Flagelim.",
    Location = "Seril Flagelicida (Hibérnia - Visteterna "..yellow.."61,37"..white..")",
    Note = red.."Apenas Ferreiro"..white..": O Cuteleiro da Guarda Negra é invocado perto de "..yellow.."[15]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12825 }, --Plans: Blazing Rapier Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[17] = {
    Title = "Doce Serenidade",
    Id = 5305,
    Level = 60,
    Attain = 50,
    Aim = "Viaje para Stratholme e mate o Forjador de Martelo Carmesim. Recupere o Avental do Martelo Carmesim e volte para Lilith.",
    Location = "Lilith, a Ligeira (Hibérnia - Visteterna "..yellow.."61,37"..white..")",
    Note = red.."Apenas Ferreiro"..white..": O Forjador de Martelos Carmesim é invocado em "..yellow.."[8]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 12824 }, --Plans: Enchanted Battlehammer Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[18] = {
    Title = "Para construir um Pounder",
    Id = 80401,
    Level = 60,
    Attain = 30,
    Aim = "Adquira o Servo Afinado de Tório do Arsenal do Monastério Escarlate, obtenha o Núcleo de Golem Perfeito nas Profundezas da Rocha Negra do Lorde Golem Argelmach, encontre a Vara de Adamantita em Stratholme. Retorne para Oglethorpe Obnoticus.",
    Location = "Olhatorto Obnótico <Master Engenheiro Gnomo> (Selva do Espinhaço; Angra do Butim "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Apenas Engenheiros)"..white.."Esta missão requer coletar 3 itens. \n1) Servo Afinado de Tório (Monastério Escarlate de Mirmidão Escarlate)\n2) Núcleo de Golem Perfeito (Abismo Rocha Negra de Lorde Golem Argelmach)\n3) Vara de Adamantita (Stratholme de Forjador de Martelos Carmesim "..yellow.."[8]"..white..")\n'Espanca-gente 9-60' em Gnomeregan dropa 'Mainframe de Impacto Intacto' que inicia a Missão Prévia 'Um cérebro forte'.",
    Prequest = "Um cérebro forte",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.Stratholme.Alliance[19] = {
    Title = "To Wake The Ashbringer",
    Id = 20002,
    Level = 60,
    Attain = 60,
    Aim = "Recupere Tabardo do Portador da Lâmina de Fogo (mate Grão-Cruzado Dathrohan) e Capa de Alexandros de Stratholme.",
    Location = "Tirion Fordring (Terras Pestilentas Ocidentais - Capilla Esperanza de la Luz "..yellow.."67.3,24.2"..white..").",
    Note = "Tabardo do Portador da Lâmina de Fogo dropa de Grão-Cruzado Dathrohan "..yellow.."[11]"..white..", Capa de Alexandros dropa de Barão Rivendare"..yellow.."[19]"..white.."\nA sequência de missões começa em Naxxramas após matar 4 Cavaleiros com a missão 'Orbe de Luz Pura'",
    Prequest = "Orbe de Luz Pura -> Procure Ajuda em Outro Lugar",
    Folgequest = "Espírito do Portador da Lâmina de Fogo",
    Rewards = {
        Text = "Recompensa: ",
        { id = 82002 }, --Tabard of the Ashbringer Tabard
    }
}
kQuestInstanceData.Stratholme.Alliance[20] = {
    Title = "Broche da Família Rothlen",
    Id = 41000,
    Level = 60,
    Attain = 55,
    Aim = "Recupere o Broche da Família Rothlen de Stratholme para o Duque Rothlen em Karazhan.",
    Location = "Duque Rothlen (Karazhan "..yellow.."[Karazhan - c]"..white..")",
    Note = "Broche da Família Rothlen ao lado do chefe O Imperdoável "..yellow.."[4]"..white.." no baú.\nSequência de missões começa com drop aleatório de item épico 'Notas de Culinária Rabiscadas' "..yellow.."[Karazhan]"..white..".",
    Prequest = "Notas de culinária rabiscadas"..yellow.."[Karazhan]"..white.." -> Perdido e Achado "..yellow.."[Karazhan]"..white.."", -- 40998, 40999",
    Folgequest = "A receita secreta ("..yellow.."[Karazhan]"..white..")",
}
kQuestInstanceData.Stratholme.Alliance[21] = {
    Title = "A chave para Karazhan VII",
    Id = 40826,
    Level = 60,
    Attain = 58,
    Aim = "Encontre quatro Ecos de Medivh. Eles podem ser encontrados em locais de grande importância para o mago. Então volte para Dolvan com a chave.",
    Location = "Dolvan Bracewind (Pântano Vadeoso - Vale Westhaven "..yellow.."[71.1,73.2]"..white..")",
    Note = "Segunda Pena de Medivh no chão no lugar onde Ancião Murmulonge (Festival Lunar) "..yellow.."[5]"..white.." está.\nPrimeira Pena de Medivh "..yellow.."[Cidade Baixa]"..white.." atrás do trono da entrada.\nTerceira Pena de Medivh "..yellow.."[Montanhas de Alterac]"..white.." no final do primeiro penhasco (oeste) "..yellow.."[30.8,87.4]"..white..".\nQuarta Pena de Medivh "..yellow.."[Hyjal]"..white.." no final do penhasco "..yellow.."[31.8,70.5]"..white..".",
    Prequest = "A chave para Karazhan VI",
    Folgequest = "A chave para Karazhan VIII ("..yellow.."Dire Maul West"..white..")",
}
for i = 1, 17 do
    kQuestInstanceData.Stratholme.Horde[i] = kQuestInstanceData.Stratholme.Alliance[i]
end
kQuestInstanceData.Stratholme.Horde[18] = {
    Title = "Ramstein",
    Id = 6163,
    Level = 60,
    Attain = 56,
    Aim = "Viaje para Stratholme e mate Ramstein, o Devorador. Leve a cabeça dele como lembrança para Nathanos.",
    Location = "Nathanos Arauto da Praga (Terras Pestilentas Orientais "..yellow.."26,74"..white..")",
    Note = "Você pega a missão prévia de Nathanos Arauto da Praga também. Você pode encontrar Ramstein em "..yellow.."[18]"..white..".",
    Prequest = "A ordem do Lorde Ranger -> Duskwing, oh, como eu te odeio...",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 18022 }, --Royal Seal of Alexis Ring
        { id = 17001 }, --Elemental Circle Ring
    }
}
kQuestInstanceData.Stratholme.Horde[19] = {
    Title = "Para construir um Pounder",
    Id = 80401,
    Level = 60,
    Attain = 30,
    Aim = "Adquira o Servo Afinado de Tório do Arsenal do Monastério Escarlate, obtenha o Núcleo de Golem Perfeito nas Profundezas da Rocha Negra do Lorde Golem Argelmach, encontre a Vara de Adamantita em Stratholme. Retorne para Oglethorpe Obnoticus.",
    Location = "Olhatorto Obnótico <Master Engenheiro Gnomo> (Selva do Espinhaço; Angra do Butim "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Apenas Engenheiros)"..white.."Esta missão requer coletar 3 itens. \n1) Servo Afinado de Tório (Monastério Escarlate de Mirmidão Escarlate)\n2) Núcleo de Golem Perfeito (Abismo Rocha Negra de Lorde Golem Argelmach)\n3) Vara de Adamantita (Stratholme de Forjador de Martelos Carmesim "..yellow.."[8]"..white..")\n'Espanca-gente 9-60' em Gnomeregan dropa 'Mainframe de Impacto Intacto' que inicia a Missão Prévia 'Um cérebro forte'.",
    Prequest = "Um cérebro forte",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
    Story = "Durante as horas finais da Guerra das Areias Movediças, as forças combinadas dos elfos noturnos e dos quatro voos de dragões levaram a batalha ao próprio coração do império qiraji, à cidade fortaleza de Ahn'Qiraj. Mas nos portões da cidade, os exércitos de Kalimdor encontraram uma concentração de drones de guerra silítida mais massiva do que qualquer uma que haviam encontrado antes. No fim, os silítida e seus mestres qiraji não foram derrotados, mas meramente aprisionados dentro de uma barreira mágica, e a guerra deixou a cidade amaldiçoada em ruínas. Mil anos se passaram desde aquele dia, mas as forças qiraji não ficaram ociosas. Um novo e terrível exército foi gerado das colmeias, e as ruínas de Ahn'Qiraj estão repletas novamente com massas enxameantes de silítida e qiraji. Esta ameaça deve ser eliminada, ou então toda Azeroth pode cair diante do poder aterrorizante do novo exército qiraji.",
    Caption = "Ruínas de Ahn'qiraj",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[1] = {
    Title = "A Queda de Ossiriano",
    Id = 8791,
    Level = 60,
    Attain = 60,
    Aim = "Entregue a Cabeça de Ossirian, o Imaculado, ao Comandante Mar'alith, no Forte Cenariano, em Silithus.",
    Location = "Cabeça de Ossirian o Imaculado (dropa de Ossirian, o Intocado "..yellow.."[6]"..white..")",
    Note = "Comandante Mar'alith (Silithus - Forte Cenariano "..yellow.."49,34"..white..")",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 21504 }, --Charm of the Shifting Sands Neck
        { id = 21507 }, --Amulet of the Shifting Sands Neck
        { id = 21505 }, --Choker of the Shifting Sands Neck
        { id = 21506 }, --Pendant of the Shifting Sands Neck
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[2] = {
    Title = "O Veneno Perfeito",
    Id = 9023,
    Level = 60,
    Attain = 60,
    Aim = "Dirk Thunderwood, do Castelo Cenariano, quer que você traga para ele o Saco de Veneno de Venoxis e o Saco de Veneno de Kurinnaxx.",
    Location = "Adaga Fortelenho (Silithus - Forte Cenariano "..yellow.."52,39"..white..")",
    Note = "Saco de Veneno de Venoxis dropa de Alto sacerdote Venoxis em "..yellow.."Zul'gurub"..white..". Saco de Veneno de Korinnaxx dropa nas "..yellow.."Ruínas de Ahn'qiraj"..white.." em "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 22378 }, --Ravenholdt Slicer One-Hand, Sword
        { id = 22379 }, --Shivsprocket's Shiv Main Hand, Dagger
        { id = 22377 }, --The Thunderwood Poker One-Hand, Dagger
        { id = 22348 }, --Doomulus Prime Two-Hand, Mace
        { id = 22347 }, --Fahrad's Reloading Repeater Crossbow
        { id = 22380 }, --Simone's Cultivating Hammer Main Hand, Mace
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[3] = {
    Title = "Perdido nas areias",
    Id = 70001,
    Level = 60,
    Attain = 60,
    Aim = "Leve um Fragmento de Obsidiana Perfeito para o Arquimago Xylem.",
    Location = "Arquimago Tauriel (Azshara "..yellow.."28,47"..white..")",
    Note = red.."Apenas Mago"..white..": missão prévia de Erudito Lydros (Gládio Cruel - Oeste ou Norte "..yellow.."[1] Biblioteca"..white.."). Fragmento de Obsidiana Perfeito dropa de "..yellow.."[3]"..white..".",
    Prequest = "Refresco Arcano -> Um tipo especial de convocação",
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
    Story = "As Masmorras são um complexo prisional de alta segurança, escondido sob o distrito dos canais da cidade de Ventobravo. Presididas pelo Guardião Thelwater, as Masmorras abrigam ladrões de pouca monta, insurgentes políticos, assassinos e uma série dos criminosos mais perigosos da terra. Recentemente, uma revolta liderada por prisioneiros resultou em um estado de pandemônio dentro das Masmorras - onde os guardas foram expulsos e os condenados vagam livres. Guardião Thelwater conseguiu escapar da área de detenção e está atualmente recrutando bravos aventureiros para se aventurar na prisão e matar o mentor da revolta - o astuto criminoso, Bazil Thredd.",
    Caption = "O Cárcere",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheStockade.Alliance[1] = {
    Title = "O que vem por aí...",
    Id = 386,
    Level = 25,
    Attain = 22,
    Aim = "Leve a cabeça de Targorr, o Temido, para o Guarda Berton em Lagoshire.",
    Location = "Guarda Berton (Montanhas Cristarrubra - Lagoshire "..yellow.."26,46"..white..")",
    Note = "Você pode encontrar Targorr em "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 3400 }, --Lucine Longsword Main Hand, Sword
        { id = 1317 }, --Hardened Root Staff Staff
    }
}
kQuestInstanceData.TheStockade.Alliance[2] = {
    Title = "Crime e Castigo",
    Id = 377,
    Level = 26,
    Attain = 22,
    Aim = "O vereador Millstipe, de Darkshire, quer que você lhe traga a mão de Dextren Ward.",
    Location = "Millstipe (Floresta do Crepúsculo - Vila Sombria "..yellow.."72,47"..white..")",
    Note = "Você pode encontrar Dextren em "..yellow.."[5]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 2033 }, --Ambassador's Boots Feet, Leather
        { id = 2906 }, --Darkshire Mail Leggings Legs, Mail
    }
}
kQuestInstanceData.TheStockade.Alliance[3] = {
    Title = "Acabar com a revolta",
    Id = 387,
    Level = 26,
    Attain = 22,
    Aim = "O Diretor Thelwater de Ventobravo quer que você mate 10 Prisioneiros Défias, 8 Condenados Défias e 8 Insurgentes Défias na Paliçada.",
    Location = "Carcereiro-chefe Thelágua (Ventobravo - O Cárcere "..yellow.."41,58"..white..")",
}
kQuestInstanceData.TheStockade.Alliance[4] = {
    Title = "A Cor do Sangue",
    Id = 388,
    Level = 26,
    Attain = 22,
    Aim = "Nikova Raskol de Ventobravo quer que você colete 10 Bandanas de Lã Vermelha.",
    Location = "Nikova Raskol (Ventobravo - Cidade Velha "..yellow.."73,46"..white..")",
    Note = "Todas as criaturas dentro da instância dropam Bandanas de Lã Vermelha.",
}
kQuestInstanceData.TheStockade.Alliance[5] = {
    Title = "A fúria é profunda",
    Id = 378,
    Level = 27,
    Attain = 22,
    Aim = "Motley Garmason quer que a cabeça de Kam Deepfury seja levada até ele em Dun Modr.",
    Location = "Rocio Garmason (Pântanos - Dun Modr "..yellow.."49,18"..white..")",
    Note = "A missão prévia pode ser obtida de Motley também. Você pode encontrar Kam Fundafúria em "..yellow.."[2]"..white..".",
    Prequest = "A Guerra do Ferro Negro",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 3562 }, --Belt of Vindication Waist, Leather
        { id = 1264 }, --Headbasher Two-Hand, Mace
    }
}
kQuestInstanceData.TheStockade.Alliance[6] = {
    Title = "Os motins da paliçada",
    Id = 391,
    Level = 29,
    Attain = 16,
    Aim = "Mate Bazil Thredd e leve sua cabeça de volta para o Diretor Thelwater na Stockade.",
    Location = "Carcereiro-chefe Thelágua (Ventobravo - O Cárcere "..yellow.."41,58"..white..")",
    Note = "Para mais detalhes sobre a missão prévia veja "..yellow.."[Minas Mortas, A Irmandade Défias]"..white..".\nVocê pode encontrar Basílio Taborda em "..yellow.."[4]"..white..".",
    Prequest = "A Irmandade Défias -> Bazil Thredd",
    Folgequest = "O visitante curioso",
}
kQuestInstanceData.TheStockade.Alliance[7] = {
    Title = "The Stockade's Search",
    Id = 55221,
    Level = 24,
    Attain = 18,
    Aim = "Mergulhe nas Masmorras e encontre informações sobre Martin Corinth.",
    Location = "Mestre Mathias Shaw <Líder da SI:7> (Ventobravo - Cidade Velha, distrito dos Ladinos "..yellow.."75.8,59.8"..white..")",
    Note = "Você pode encontrar Informação de Martin Corinth dentro de Caixa de Documentos Selados "..yellow.."[1]"..white.." na sala do outro lado da entrada da masmorra.\nA sequência de missões começa com a missão 'Descobrindo o mistério' em Lorde Comandante Ryke (Pântano Vadeoso - Vigília do Falcão "..yellow.."36.4,67.3"..white.." sob a tenda)\nVocê receberá a recompensa ao terminar a última missão da sequência.",
    Prequest = "Relatório de Robb",
    Folgequest = "Investigando Corinto",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 81416 }, --Valiant Medallion Neck
        { id = 81417 }, --Ambient Talisman Neck
        { id = 81418 }, --Magnificent Necklace Neck
    }
}

--------------- The Sunken Temple ---------------
kQuestInstanceData.TheSunkenTemple = {
    Story = "Há mais de mil anos, o poderoso Império Gurubashi foi dilacerado por uma enorme guerra civil. Um grupo influente de sacerdotes trolls, conhecido como os Atal'ai, tentou trazer de volta um antigo deus do sangue chamado Hakkar, o Esfola-almas. Embora os sacerdotes tenham sido derrotados e finalmente exilados, o grande império troll desmoronou sobre si mesmo. Os sacerdotes exilados fugiram para o norte, para o Pântano das Mágoas. Lá eles ergueram um grande templo para Hakkar - onde poderiam se preparar para sua chegada ao mundo físico. O grande Aspecto dragão, Ysera, soube dos planos dos Atal'ai e esmagou o templo sob os pântanos. Até hoje, as ruínas submersas do templo são guardadas pelos dragões verdes que impedem qualquer um de entrar ou sair. No entanto, acredita-se que alguns dos fanáticos Atal'ai possam ter sobrevivido à fúria de Ysera - e se comprometido novamente com o serviço sombrio de Hakkar.",
    Caption = "The Templo Submerso",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheSunkenTemple.Alliance[1] = {
    Title = "No Templo de Atal'Hakkar",
    Id = 1475,
    Level = 50,
    Attain = 41,
    Aim = "Reúna 10 Tabuletas de Atal'ai para Brohann Barriga de Barril em Ventobravo.",
    Location = "Brohann Barrilga (Ventobravo - Distrito Anão "..yellow.."64,20"..white..")",
    Note = "A sequência de missões prévias vem do mesmo NPC e tem várias etapas.\n\nVocê pode encontrar as Tábuas em todos os lugares no Templo, tanto fora quanto dentro da instância.",
    Prequest = "Em Busca do Templo -> Conto da Rapsódia",
    Rewards = {
        Text = "Recompensa: ",
        { id = 1490 }, --Guardian Talisman Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[2] = {
    Title = "Névoa do Mal",
    Id = 4143,
    Level = 52,
    Attain = 47,
    Aim = "Colete 5 amostras de Atal'ai Haze e depois retorne para Muigin na Cratera Un'Goro.",
    Location = "Gregan Cospechope (Feralas "..yellow.."45,25"..white..")",
    Note = "A Missão Prévia 'Melco e Lário' começa com Melco (Cratera Un'goro - Refúgio Marshal "..yellow.."42,9"..white.."). Você pega a Névoa de Espreitadores Profundos, Vermes da Lama ou Limos no Templo.",
    Prequest = "Muigin e Larion -> Uma visita a Gregan",
}
kQuestInstanceData.TheSunkenTemple.Alliance[3] = {
    Title = "Nas profundezas",
    Id = 3446,
    Level = 51,
    Attain = 46,
    Aim = "Encontre o Altar de Hakkar no Templo Submerso em Pântano das Dores.",
    Location = "Marlon Catarrebite (Tanaris "..yellow.."52,45"..white..")",
    Note = "O Altar está em "..yellow.."[1]"..white..".\nA sequência de missões da Aliança começa com Ângela Brisaluna (Feralas - Fortaleza Pena de Prata "..yellow.."31.8,45.6"..white..") com a missão 'O Templo Submerso'.\nA sequência de missões da Horda começa com Mandingueiro Uzer'i (Feralas - Acampamento Mojache "..yellow.."74.4,43.4"..white..") com a missão 'O Templo Submerso'.",
    Prequest = "O Círculo de Pedra",
    Folgequest = "Segredo do Círculo",
}
kQuestInstanceData.TheSunkenTemple.Alliance[4] = {
    Title = "Segredo do Círculo",
    Id = 3447,
    Level = 51,
    Attain = 46,
    Aim = "Viaje para o Templo Submerso e descubra o segredo escondido no círculo de estátuas.",
    Location = "Altar de Hakkar (Templo Submerso "..yellow.."1"..white..")",
    Note = "Você encontra as estátuas em "..yellow.."[1]"..white..". Veja o mapa para a ordem de ativação.",
    Prequest = "Nas profundezas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10773 }, --Hakkari Urn Container
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[5] = {
    Title = "O Deus Hakkar",
    Id = 3528,
    Level = 53,
    Attain = 40,
    Aim = "Leve o Ovo Recheado de Hakkar para Yeh'kinya em Tanaris.",
    Location = "Yeh'kinya (Tanaris - Porto Steamwheedle "..yellow.."66,22"..white..")",
    Note = "A Sequência de Missões começa com 'Espíritos Gritadores' no mesmo NPC (Veja "..yellow.."[Zul'farrak]"..white..").\nVocê deve usar o Ovo em "..yellow.."[3]"..white.." para iniciar o Evento. Uma vez iniciado, inimigos aparecem e atacam você. Alguns deles dropam o sangue de Hakkar. Com este sangue você pode apagar a tocha ao redor do círculo. Depois disso o Avatar de Hakkar aparece. Você o mata e saqueia a 'Essência de Hakkar' que você usa para encher o ovo.",
    Prequest = "Espíritos Gritadores -> O ovo antigo",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 10749 }, --Avenguard Helm Head, Plate
        { id = 10750 }, --Lifeforce Dirk One-Hand, Dagger
        { id = 10751 }, --Gemburst Circlet Head, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[6] = {
    Title = "Jammal'an, o Profeta",
    Id = 1446,
    Level = 53,
    Attain = 38,
    Aim = "O Exilado Atal'ai nas Terras Agrestes quer o Chefe de Jammal'an.",
    Location = "O Atal'ai Exilado (Terras Agrestes "..yellow.."33,75"..white..")",
    Note = "Você encontra Jammal'an em "..yellow.."[4]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 11123 }, --Rainstrider Leggings Legs, Cloth
        { id = 11124 }, --Helm of Exile Head, Mail
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[7] = {
    Title = "A Essência de Eranikus",
    Id = 3373,
    Level = 55,
    Attain = 48,
    Aim = "Coloque a Essência de Eranikus na Fonte de Essência localizada neste covil no Templo Submerso.",
    Location = "A Essência de Eranikus (dropa de Vulto de Erânicos "..yellow.."[6]"..white..")",
    Note = "Você encontra a Fonte da Essência ao lado de onde Vulto de Erânicos está em "..yellow.."[6]"..white..".\n"..red.."Não"..white.." venda ou jogue fora o pingente de recompensa Essência Encadeada de Eranikus. Você precisará dele para a próxima missão em Itharius (Pântano das Mágoas - Caverna de Itharius "..yellow.."[13.6,71.7]"..white..", depois de falar com ele você receberá um item que inicia a missão.",
    Folgequest = "A Essência de Eranikus",
    Rewards = {
        Text = "Recompensa: ",
        { id = 10455 }, --Chained Essence of Eranikus Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[8] = {
    Title = "Trolls de uma Pena",
    Id = 8422,
    Level = 52,
    Attain = 50,
    Aim = "Traga um total de 6 penas de vodu dos trolls no templo submerso.",
    Location = "Diabretim (Selva Maleva "..yellow.."42,45"..white..")",
    Note = red.."Apenas Bruxo"..white..": Pena dropa de cada um dos trolls nomeados nas saliências com vista para a grande sala com o buraco no centro.",
    Prequest = "Pedido de um Imp -> A coisa errada",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 20536 }, --Soul Harvester Staff
        { id = 20534 }, --Abyss Shard Trinket
        { id = 20530 }, --Robes of Servitude Chest, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[9] = {
    Title = "Penas de vodu",
    Id = 8425,
    Level = 52,
    Attain = 50,
    Aim = "Leve as Penas de Voodoo dos trolls no Templo Submerso para o Herói Caído da Horda.",
    Location = "Herói Caído da Horda (Pântano das Mágoas "..yellow.."34,66"..white..")",
    Note = red.."Apenas Guerreiro"..white..": Pena dropa de cada um dos trolls nomeados nas saliências com vista para a grande sala com o buraco no centro.\nA sequência de missões da Horda começa em Orgrimmar com o treinador de guerreiros Sorek "..yellow.."80.4,32.3"..white..".",
    Prequest = "Um espírito perturbado -> Guerra aos Shadowsworn",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 20521 }, --Fury Visor Head, Plate
        { id = 20130 }, --Diamond Flask Trinket
        { id = 20517 }, --Razorsteel Shoulders Shoulder, Plate
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[10] = {
    Title = "Um ingrediente melhor",
    Id = 9053,
    Level = 52,
    Attain = 50,
    Aim = "Recupere uma Videira Pútrida do guardião na parte inferior do Templo Submerso e retorne ao Torwa Pathfinder.",
    Location = "Torwa Mateiro (Cratera Un'goro "..yellow.."72,76"..white..")",
    Note = red.."Apenas Druida"..white..": A Videira Putrefata dropa de Atal'alarion que é invocado em "..yellow.."[1]"..white.." ativando as estátuas na ordem listada no mapa.",
    Prequest = "Desbravador Torwa -> Teste Tóxico",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 22274 }, --Grizzled Pelt Chest, Leather
        { id = 22272 }, --Forest's Embrace Chest, Leather
        { id = 22458 }, --Moonshadow Stave Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[11] = {
    Title = "O Dragão Verde",
    Id = 8232,
    Level = 52,
    Attain = 50,
    Aim = "Leve o Dente de Morfaz para Ogtinc em Azshara.  Ogtinc reside no topo dos penhascos a nordeste das Ruínas de Eldarath.",
    Location = "Ogtinc (Azshara "..yellow.."42,43"..white..")",
    Note = red.."Apenas Caçador"..white..": Morphaz está em "..yellow.."[5]"..white..".",
    Prequest = "O encanto do caçador -> Destruidor de ondas",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 20083 }, --Hunting Spear Polearm
        { id = 19991 }, --Devilsaur Eye Trinket
        { id = 19992 }, --Devilsaur Tooth Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[12] = {
    Title = "Destrua Morfaz",
    Id = 8253,
    Level = 52,
    Attain = 50,
    Aim = "Recupere o Fragmento Arcano de Morphaz e retorne ao Arquimago Xylem.",
    Location = "Arquimago Tauriel (Azshara "..yellow.."29,40"..white..")",
    Note = red.."Apenas Mago"..white..": Morphaz está em "..yellow.."[5]"..white..".",
    Prequest = "Poeira Mágica -> O Coral da Sereia",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 20035 }, --Glacial Spike One-Hand, Dagger
        { id = 20037 }, --Arcane Crystal Pendant Neck
        { id = 20036 }, --Fire Ruby Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[13] = {
    Title = "Sangue de Morfaz",
    Id = 8257,
    Level = 52,
    Attain = 50,
    Aim = "Mate Morphaz no templo submerso de Atal'Hakkar e devolva seu sangue para Greta Casco Musgo em Selva Maleva.  A entrada para o templo submerso pode ser encontrada no Pântano das Dores.",
    Location = "Ogtinc (Azshara "..yellow.."42,43"..white..")",
    Note = red.."Apenas Sacerdote"..white..": Morphaz está em "..yellow.."[5]"..white..". Greta Musgo no Casco está em Selva Maleva - Santuário Esmeralda ("..yellow.."51,82"..white..").",
    Prequest = "Ajuda Cenariana -> O Ichor da Morte",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 19990 }, --Blessed Prayer Beads Trinket
        { id = 20082 }, --Woestave Wand
        { id = 20006 }, --Circle of Hope Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[14] = {
    Title = "A chave Azure",
    Id = 8236,
    Level = 52,
    Attain = 50,
    Aim = "Devolva a Chave Azure para Lord Jorach Ravenholdt.",
    Location = "Arquimago Tauriel (Azshara "..yellow.."29,40"..white..")",
    Note = red.."Apenas Ladino"..white..": A Chave Lazúli dropa de Morphaz em "..yellow.."[5]"..white..". Lorde Jorach Corvoforte está em Montanhas de Alterac - Corvoforte ("..yellow.."86,79"..white..").",
    Prequest = "Um pedido simples -> Fragmentos Codificados",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 19984 }, --Ebon Mask Head, Leather
        { id = 20255 }, --Whisperwalk Boots Feet, Leather
        { id = 19982 }, --Duskbat Drape Back
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[15] = {
    Title = "Eranikus, Tirano do Sonho",
    Id = 8733,
    Level = 60,
    Attain = 60,
    Aim = "Viaje para o continente de Teldrassil e encontre o agente de Malfurion em algum lugar fora dos muros de Darnassus.",
    Location = "Malfurion Tempesfúria (Spawns at Vulto de Erânicos "..yellow.."[8]"..white..")",
    Note = "Fogo-fátuo da Floresta (Teldrassil "..yellow.."37,47"..white..")",
    Prequest = "Encomienda a los Vuelos",
    Folgequest = "Tyrande e Remulos",
}
kQuestInstanceData.TheSunkenTemple.Alliance[16] = {
    Title = "Por Qualquer Meio Necessário IV",
    Id = 40400,
    Level = 53,
    Attain = 47,
    Aim = "Viaje para o Templo Submerso e encontre os Dragonkin Hazzas, mate-o e devolva o Coração de Hazzas para Niremius Darkwind.",
    Location = "Niremius Ventonegro (Selva Maleva "..yellow.."40,30"..white..")",
    Note = "Dropa do chefe [7]. Recompensa da próxima missão.",
    Prequest = "Por qualquer meio necessário eu -> Por Qualquer Meio Necessário II -> Por Qualquer Meio Necessário III",
    Folgequest = "Por Qualquer Meio Necessário V",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60536 }, --Darkwind Glaive One-Hand, Sword
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[17] = {
    Title = "Forjando a Pedra do Poder",
    Id = 8418,
    Level = 52,
    Attain = 50,
    Aim = "Leve as penas de vodu para Ashlam Valorfist.",
    Location = "Comandante Ashlam Punhobom (Terras Pestilentas Ocidentais - Acampamento de Ventogelado "..yellow.."43,85"..white..")",
    Note = red.."Apenas Paladino"..white..": Pena dropa de cada um dos trolls nomeados nas saliências com vista para a grande sala com o buraco no centro.",
    Prequest = "Pedras do Flagelo Inertes",
    Rewards = {
        Text = "Recompensa: 1 e 2 ou 3 ou 4",
        { id = 20620 }, --Holy Mightstone Enchant
        { id = 20504 }, --Lightforged Blade Two-Hand, Sword
        { id = 20512 }, --Sanctified Orb Trinket
        { id = 20505 }, --Chivalrous Signet Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[18] = {
    Title = "Dentro do Sonho III",
    Id = 40959,
    Level = 60,
    Attain = 58,
    Aim = "Colete um Fragmento de Aprisionamento de Quebradores de Penhascos em Azshara, Prisma Arcano Sobrecarregado de Torrentes Arcanas na ala oeste de Dire Maul e um Fragmento do Adormecido de Weaver no Templo Submerso. Apresente-se a Itharius no Pântano das Mágoas com os itens coletados.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."85,30"..white..")",
    Note = "Tecelão "..yellow.."[6]"..white.." 1 de 4 dragões dropa Fragmento do Sonhador, aparecerá após matar Jammal'an, o Profeta "..yellow.."[4]"..white..". A barreira para o Profeta desaparecerá após limpar 6 sacadas "..blue.."[C]"..white.."\nTerminando esta sequência de missões você pega o colar e poderá entrar na instância de raide de Hyjal Santuário Esmeralda.",
    Prequest = "Dentro do sonho eu -> Dentro do sonho II",
    Folgequest = "Dentro do Sonho IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[19] = {
    Title = "A bengala do Riftwalker",
    Id = 41323,
    Level = 54,
    Attain = 30,
    Aim = "Retorne com a Bengala do Andarilho da Fenda de Akh Z'ador e o Mojo de Jammal'an para Akh Z'ador em Azshara.",
    Location = "Akh Z'ador (Azshara "..yellow.."51,37"..white..")",
    Note = "Sequência de missões começa com Sanv K'la (Pântano das Mágoas "..yellow.."25, 30"..white.."). Jammal'an, o Profeta "..yellow.."[4]."..white.."\nTerminando esta sequência de missões você pega uma recompensa Pedra de Draenethyst Pura.",
    Prequest = "O encanto Sanv -> Encontrando Akh Z'ador -> Fadiga da Fenda: Corpo",
    Folgequest = "Novato em uma terra árida",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41385 }, --Pure Draenethyst Gemstone Quest Item
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[1] = {
    Title = "O Templo de Atal’Hakkar",
    Id = 1445,
    Level = 50,
    Attain = 38,
    Aim = "Colete 20 Fetiches de Hakkar e leve-os para Fel'Zerul em Stonard.",
    Location = "Fel'Zerul (Pântano das Mágoas - Stonard "..yellow.."47,54"..white..")",
    Note = "Todos os inimigos no Templo dropam Fetiches.\nA sequência de missões começa com Fel'Zerul (Pântano das Mágoas - Stonard "..yellow.."47,54"..white..")",
    Prequest = "Piscina de Lágrimas -> Voltar para Fel'Zerul",
    Rewards = kQuestInstanceData.TheSunkenTemple.Alliance[1].Rewards
}
kQuestInstanceData.TheSunkenTemple.Horde[2] = {
    Title = "Combustível Zapper",
    Id = 4146,
    Level = 52,
    Attain = 47,
    Aim = "Entregue o Zapper Descarregado e 5 amostras de Atal'ai Haze para Larion no Refúgio do Marechal.",
    Location = "Fanny Quito (Barrens "..yellow.."62,38"..white..")",
    Note = "A Missão Prévia 'Lário e Melco' começa com Lário (Cratera Un'goro "..yellow.."45,8"..white.."). Você pega a Névoa de Espreitadores Profundos, Vermes da Lama ou Limos no Templo.",
    Prequest = "Larion e Muigin -> Oficina de Marvon",
}
for i = 3, 16 do
    kQuestInstanceData.TheSunkenTemple.Horde[i] = kQuestInstanceData.TheSunkenTemple.Alliance[i]
end
kQuestInstanceData.TheSunkenTemple.Horde[17] = {
    Title = "Da vodu",
    Id = 8413,
    Level = 52,
    Attain = 50,
    Aim = "Leve as penas de vodu para Bath'rah, a Vigilante do Vento.",
    Location = "Bath'rah, o Vigia dos Ventos (Montanhas de Alterac "..yellow.."80,67"..white..")",
    Note = red.."Apenas Xamã"..white..": Pena dropa de cada um dos trolls nomeados nas saliências com vista para a grande sala com o buraco no centro.",
    Prequest = "Totem Espiritual",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 20369 }, --Azurite Fists Hands, Mail
        { id = 20503 }, --Enamored Water Spirit Trinket
        { id = 20556 }, --Wildstaff Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[18] = {
    Title = "A crise de Maul'ogg VII",
    Id = 40270,
    Level = 54,
    Attain = 45,
    Aim = "Aventure-se nas profundezas do Templo de Atal'Hakkar e reúna o Atal'ai Rod, leve-o para Insom'ni para terminar o feitiço.",
    Location = "Insom'ni <O Grande Eremita> (Ilha Kazon, norte da Ilha Gillijim "..yellow.."57.2,10.1"..white..")",
    Note = "Bastão de Atal'ai do pequeno baú de madeira verde no chão atrás de Jammal'an, o Profeta "..yellow.."[4]"..white..".\nA sequência de missões começa com Haz'gorg, o Grande Vidente (Selva do Espinhaço - Ilha de Gillijim(oeste de Angra do Butim) - Refúgio Martelo'Ogg, dentro da caverna sudeste "..yellow.."78.1,81"..white..".)\nVocê receberá a recompensa ao terminar a última missão da sequência.",
    Prequest = "A Crise Maul'ogg VI",
    Folgequest = "A crise de Maul'ogg VIII",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60346 }, --The Ogre Mantle Shoulder, Leather
        { id = 60347 }, --Staff of the Ogre Seer Staff
        { id = 60348 }, --Favor of Cruk'Zogg Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[19] = {
    Title = "Dentro do Sonho III",
    Id = 40959,
    Level = 60,
    Attain = 58,
    Aim = "Colete um Fragmento de Aprisionamento de Quebradores de Penhascos em Azshara, Prisma Arcano Sobrecarregado de Torrentes Arcanas na ala oeste de Dire Maul e um Fragmento do Adormecido de Weaver no Templo Submerso. Apresente-se a Itharius no Pântano das Mágoas com os itens coletados.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."85,30"..white..")",
    Note = "Tecelão "..yellow.."[6]"..white.." 1 de 4 dragões dropa Fragmento do Sonhador, aparecerá após matar Jammal'an, o Profeta "..yellow.."[4]"..white..". A barreira para o Profeta desaparecerá após limpar 6 sacadas "..blue.."[C]"..white.."\nTerminando esta sequência de missões você pega o colar e poderá entrar na instância de raide de Hyjal Santuário Esmeralda.",
    Prequest = "Dentro do sonho eu -> Dentro do sonho II",
    Folgequest = "Dentro do Sonho IV",
    Rewards = {
        Text = "Recompensa: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[20] = {
    Title = "A bengala do Riftwalker",
    Id = 41323,
    Level = 54,
    Attain = 30,
    Aim = "Retorne com a Bengala do Andarilho da Fenda de Akh Z'ador e o Mojo de Jammal'an para Akh Z'ador em Azshara.",
    Location = "Akh Z'ador (Azshara "..yellow.."51,37"..white..")",
    Note = "Sequência de missões começa com Sanv K'la (Pântano das Mágoas "..yellow.."25, 30"..white.."). Jammal'an, o Profeta "..yellow.."[4]."..white.."\nTerminando esta sequência de missões você pega uma recompensa Pedra de Draenethyst Pura.",
    Prequest = "O encanto Sanv -> Encontrando Akh Z'ador -> Fadiga da Fenda: Corpo",
    Folgequest = "Novato em uma terra árida",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41385 }, --Pure Draenethyst Gemstone Quest Item
    }
}

--------------- Temple of Ahn'Qiraj ---------------
kQuestInstanceData.TheTempleofAhnQiraj = {
    Story = "No coração de Ahn'Qiraj fica um antigo complexo de templo. Construído na época antes da história registrada, é tanto um monumento a deuses indescritíveis quanto um enorme campo de criação para o exército qiraji. Desde que a Guerra das Areias Movediças terminou há mil anos, os Imperadores Gêmeos do império qiraji foram presos dentro de seu templo, mal contidos atrás da barreira mágica erguida pelo dragão de bronze Anachronos e os elfos noturnos. Agora que o Cetro das Areias Movediças foi remontado e o selo foi quebrado, o caminho para o santuário interno de Ahn'Qiraj está aberto. Além da loucura rastejante das colmeias, sob o Templo de Ahn'Qiraj, legiões de qiraji se preparam para a invasão. Eles devem ser parados a todo custo antes que possam liberar seus exércitos insectoides vorazes em Kalimdor mais uma vez, e uma segunda Guerra das Areias Movediças comece!",
    Caption = "Temple of Ahn'qiraj",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1] = {
    Title = "El legado de C'Thun",
    Id = 8801,
    Level = 60,
    Attain = 60,
    Aim = "Llévale el ojo de C'Thun a Caelastrasz en el Templo de Ahn'Qiraj.",
    Location = "Olho de C'Thun (dropa de C'Thun "..yellow.."[9]"..white..")",
    Note = "Celestrasz (Templo de Ahn'qiraj "..yellow.."2'"..white..")\nAs recompensas listadas são para a sequência.",
    Folgequest = "O Salvador de Kalimdor",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 21712 }, --Amulet of the Fallen God Neck
        { id = 21710 }, --Cloak of the Fallen God Back
        { id = 21709 }, --Ring of the Fallen God Ring
    }
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2] = {
    Title = "Segredos do Qiraji",
    Id = 8784,
    Level = 60,
    Attain = 60,
    Aim = "Leve o Antigo Artefato Qiraji para os dragões escondidos perto da entrada do templo.",
    Location = "Artefato Qiraji Antigo (drop aleatório no Templo de Ahn'qiraj)",
    Note = "Entregue para Andorgos (Templo de Ahn'qiraj "..yellow.."1'"..white..").",
}
kQuestInstanceData.TheTempleofAhnQiraj.Horde[1] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1]
kQuestInstanceData.TheTempleofAhnQiraj.Horde[2] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2]

--------------- Zul'Farrak ---------------
kQuestInstanceData.ZulFarrak = {
    Story = "Esta cidade queimada pelo sol é o lar dos trolls Sanguilvar, conhecidos por sua particular crueldade e misticismo sombrio. As lendas trolls falam de uma espada poderosa chamada Sul'thraze, o Açoitador, uma arma capaz de instilar medo e fraqueza até mesmo nos adversários mais formidáveis. Há muito tempo, a arma foi dividida ao meio. No entanto, rumores circularam que as duas metades podem ser encontradas em algum lugar dentro das paredes de Zul'Farrak. Relatórios também sugeriram que um grupo de mercenários fugindo de Gadgetzan vagou para a cidade e ficou preso. Seu destino permanece desconhecido. Mas talvez o mais perturbador de tudo sejam os sussurros abafados de uma criatura antiga dormindo dentro de uma piscina sagrada no coração da cidade - um poderoso semideus que causará destruição incalculável em qualquer aventureiro tolo o suficiente para acordá-lo.",
    Caption = "Zul'farrak",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ZulFarrak.Alliance[1] = {
    Title = "Medalhão de Nekrum",
    Id = 2991,
    Level = 47,
    Attain = 40,
    Aim = "Leve o Medalhão de Nekrum para Thadius Grimshade nas Barreiras do Inferno.",
    Location = "Tádius Sombraustera (A Barreira do Inferno - Fortaleza de Nethergarde "..yellow.."66,19"..white..")",
    Note = "A Sequência de Missões começa com Mestre de Grifos Garra-de-acha (Terras Agrestes - Fortaleza Martelo Feroz "..yellow.."9,44"..white..").\nNekrum aparece em "..yellow.."[4]"..white.." com a multidão final que você luta para o evento do Templo.",
    Prequest = "Gaiolas de casca murcha -> Thadius Sombra Sombria",
    Folgequest = "A adivinhação",
}
kQuestInstanceData.ZulFarrak.Alliance[2] = {
    Title = "Temperamento de troll",
    Id = 3042,
    Level = 45,
    Attain = 40,
    Aim = "Leve 20 Frascos de Temperamento de Troll para Trenton Martelo Leve em Geringontzan.",
    Location = "Trenton Lumartelo (Tanaris - Geringontzan "..yellow.."51,28"..white..")",
    Note = "Qualquer Troll pode dropar os Têmperas.",
}
kQuestInstanceData.ZulFarrak.Alliance[3] = {
    Title = "Conchas de escaravelho",
    Id = 2865,
    Level = 45,
    Attain = 40,
    Aim = "Leve 5 conchas de escaravelho não quebradas para Tran'rek em Geringontzan.",
    Location = "Tran'rek (Tanaris - Geringontzan "..yellow.."51,26"..white..")",
    Note = "A missão prévia começa com Krazek (Selva do Espinhaço - Angra do Butim "..yellow.."25,77"..white..").\nQualquer Escaravelho pode dropar as Conchas. Muitos Escaravelhos estão em "..yellow.."[2]"..white..".",
    Prequest = "Tran'rek",
}
kQuestInstanceData.ZulFarrak.Alliance[4] = {
    Title = "Tiara das Profundezas",
    Id = 2846,
    Level = 46,
    Attain = 40,
    Aim = "Leve a Tiara das Profundezas para Tabetha no Pântano Vadeoso.",
    Location = "Tabetha (Pântano Vadeoso "..yellow.."46,57"..white..")",
    Note = "Hidromante Velratha dropa a Tiara das Profundezas em "..yellow.."[6]"..white..".",
    Prequest = "A tarefa de Tabetha",
    Rewards = {
        Text = "Rewards:",
        { id = 9527 }, --Spellshifter Rod Staff
        { id = 9531 }, --Gemshale Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.ZulFarrak.Alliance[5] = {
    Title = "A Profecia de Mosh'aru",
    Id = 3527,
    Level = 47,
    Attain = 40,
    Aim = "Leve a primeira e a segunda tábuas de Mosh'aru para Yeh'kinya em Tanaris.",
    Location = "Yeh'kinya (Tanaris - Porto Steamwheedle "..yellow.."66,22"..white..")",
    Note = "Você pega a missão prévia do mesmo NPC.\nAs Tábuas dropam de Theka, o Mártir em "..yellow.."[2]"..white.." e Hidromante Velratha em "..yellow.."[6]"..white..".",
    Prequest = "Espíritos Gritadores",
    Folgequest = "O ovo antigo",
}
kQuestInstanceData.ZulFarrak.Alliance[6] = {
    Title = "Vara Divino-mática",
    Id = 2768,
    Level = 47,
    Attain = 40,
    Aim = "Leve o Bastão Divinomático para o Engenheiro-Chefe Bilgewhizzle em Geringontzan.",
    Location = "Engenheiro-chefe Silvadágua (Tanaris - Geringontzan "..yellow.."52,28"..white..")",
    Note = "Você pega a Vara de Sargento Bly. Você pode encontrá-lo em "..yellow.."[4]"..white.." após o evento do Templo.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9533 }, --Masons Fraternity Ring Ring
        { id = 9534 }, --Engineer's Guild Headpiece Head, Leather
    }
}
kQuestInstanceData.ZulFarrak.Alliance[7] = {
    Title = "Gahz'rilla",
    Id = 2770,
    Level = 50,
    Attain = 40,
    Aim = "Leve a Escama Eletrificada de Gahz'rilla para Wizzle Brassbolts nas Planícies Cintilantes.",
    Location = "Capu Latafuso (Thousands Needles - Carrera Mirage "..yellow.."78,77"..white..")",
    Note = "Você pega a missão prévia de Cronomorfus Espanafuso (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."23.6,28"..white.."). Não é necessário ter a missão prévia para pegar a missão Gahz'rilla.\nVocê invoca Gahz'rilla em "..yellow.."[6]"..white.." com o Martelo de Zul'farrak.\nO Martelo Sagrado vem de Qiaga, a Guardiã (Terras Áridas - O Altar de Zul "..yellow.."49,70"..white..") e deve ser completado no Altar em Jinta'Alor em "..yellow.."59,77"..white.." antes de poder ser usado em Zul'farrak.",
    Prequest = "Os irmãos Brassbolts",
    Rewards = {
        Text = "Recompensa: ",
        { id = 11122 }, --Carrot on a Stick Trinket
    }
}
kQuestInstanceData.ZulFarrak.Alliance[8] = {
    Title = "À deriva pela areia",
    Id = 40519,
    Level = 46,
    Attain = 40,
    Aim = "Aventure-se em Zul'Farrak e encontre os Antigos Restos de Trolls, depois devolva-os para Hansu Go'sha nas Ruínas de Southmoon em Tanaris.",
    Location = "Hansu Go'sha (Tanaris "..yellow.."42,73"..white..")",
    Note = "Na sala com Doutor Bruxo Zum'Rah "..yellow.."[3]"..white.." Recipiente de Sepultamento Antigo (pequena caixa de madeira verde).",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60759 }, --Southmoon Pendant Neck
    }
}
kQuestInstanceData.ZulFarrak.Alliance[9] = {
    Title = "O Ancestral Farraki",
    Id = 41811,
    Level = 46,
    Attain = 40,
    Aim = "Aventure-se em Zul'Farrak e mate Zel'jeb, o Ancestral, então retorne a Zalsu, o Errante, que pode ser encontrado ao sul de Zul'Farrak.",
    Location = "Zalsu, o Errante (Tanaris "..yellow.."39,34"..white..")",
    Note = "Vá para Zel'jeb the Ancião "..yellow.."[8]"..white..". Você precisa de 'Chama de Farrak' "..yellow.."[6]"..white.." para matá-lo.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 41916 }, --Dune Wanderer's Hauberk
        { id = 41917 }, --Desert Seeker's Pants
    }
}
kQuestInstanceData.ZulFarrak.Horde[1] = {
    Title = "O Deus Aranha",
    Id = 2936,
    Level = 45,
    Attain = 40,
    Aim = "Leia a Tábua de Theka para saber o nome do deus aranha Cascamurcha e depois retorne ao Mestre Gadrin.",
    Location = "Meister Gadrin (Durotar - Aldeia Sen'jin "..yellow.."55,74"..white..")",
    Note = "A Sequência de Missões começa com um Frasco de Veneno, que é encontrado em mesas nas Vilas Troll nas Terras Agrestes.\nVocê encontra a Tábua em "..yellow.."[2]"..white..".",
    Prequest = "Garrafas de veneno -> Consulte Mestre Gadrin",
    Folgequest = "Invocando Shadra",
}
for i = 2, 9 do
    kQuestInstanceData.ZulFarrak.Horde[i] = kQuestInstanceData.ZulFarrak.Alliance[i]
end
kQuestInstanceData.ZulFarrak.Horde[10] = {
    Title = "Fim do Ukorz Sandscalp",
    Id = 40527,
    Level = 48,
    Attain = 40,
    Aim = "Mate Ukorz Sandscalp e Ruuzlu em Zul'Farrak para o Campeão Taza'go na Aldeia Sandmoon em Tanaris.",
    Location = "Campeão Taza'go (Tanaris - Vila Sandmoon; canto nordeste de Tanaris, noroeste de Porto Steamwheedle)",
    Note = "A Sequência de Missões começa com a missão 'Redenção Sanguilvar I' em Vidente Maz'ek na Vila Sandmoon(Tanaris) "..yellow.."59.1,17.1"..white..".",
    Prequest = "Situação da Fúria da Areia",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
    Title = "Uma coleção de cabeças",
    Id = 8201,
    Level = 60,
    Attain = 58,
    Aim = "Amarre 5 Cabeças de Canalizador e devolva a Coleção de Cabeças de Troll para Exzhal na Ilha Yojamba.",
    Location = "Exzhal (Selva do Espinhaço - Ilha Yojamba "..yellow.."15,15"..white..")",
    Note = "Certifique-se de saquear todos os sacerdotes.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 20213 }, --Belt of Shrunken Heads Waist, Plate
        { id = 20215 }, --Belt of Shriveled Heads Waist, Mail
        { id = 20216 }, --Belt of Preserved Heads Waist, Leather
        { id = 20217 }, --Belt of Tiny Heads Waist, Cloth
    }
}
kQuestInstanceData.ZulGurub.Alliance[2] = {
    Title = "O Coração de Hakkar",
    Id = 8183,
    Level = 60,
    Attain = 58,
    Aim = "Leve o Coração de Hakkar para Molthor na Ilha Yojamba.",
    Location = "Coração de Hakkar (dropa de Hakkar "..yellow.."[11]"..white..")",
    Note = "Molthor (Selva do Espinhaço - Ilha Yojamba "..yellow.."15,15"..white..")",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 19948 }, --Zandalarian Hero Badge Trinket
        { id = 19950 }, --Zandalarian Hero Charm Trinket
        { id = 19949 }, --Zandalarian Hero Medallion Trinket
    }
}
kQuestInstanceData.ZulGurub.Alliance[3] = {
    Title = "Fita métrica de Nat",
    Id = 8227,
    Level = 60,
    Attain = 58,
    Aim = "Devolva a fita métrica de Nat para Nat Pagle em Dustwallow Marsh.",
    Location = "Caixa de Apetrechos Maltratada (Zul'gurub - Nordeste pela água da Ilha de Hakkar)",
    Note = "Nat Pagle está em Pântano Vadeoso ("..yellow.."59,60"..white.."). Entregar a missão permite que você compre Iscas Mudskunk de Nat Pagle para invocar Gahz'ranka em Zul'gurub.",
}
kQuestInstanceData.ZulGurub.Alliance[4] = {
    Title = "O Veneno Perfeito",
    Id = 9023,
    Level = 60,
    Attain = 60,
    Aim = "Dirk Thunderwood, do Castelo Cenariano, quer que você traga para ele o Saco de Veneno de Venoxis e o Saco de Veneno de Kurinnaxx.",
    Location = "Adaga Fortelenho (Silithus - Forte Cenariano "..yellow.."52,39"..white..")",
    Note = "Saco de Veneno de Venoxis dropa de Alto sacerdote Venoxis em "..yellow.."Zul'gurub"..white.." em "..yellow.."[2]"..white..". Saco de Veneno de Korinnaxx dropa nas "..yellow.."Ruínas de Ahn'qiraj"..white.." em "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
    Story = "Localizada em Dun Morogh, a maravilha tecnológica conhecida como Gnomeregan tem sido a capital dos gnomos por gerações. Recentemente, uma raça hostil de troggs mutantes infestou várias regiões de Dun Morogh - incluindo a grande cidade gnômica. Em uma tentativa desesperada de destruir os troggs invasores, o Alto Inventor Mekkatorque ordenou a ventilação de emergência dos tanques de lixo radioativo da cidade. Vários gnomos buscaram abrigo dos poluentes transportados pelo ar enquanto aguardavam os troggs morrerem ou fugirem. Infelizmente, embora os troggs tenham ficado irradiados pelo ataque tóxico - seu cerco continuou, sem diminuir. Aqueles gnomos que não foram mortos pela infiltração nociva foram forçados a fugir, buscando refúgio na cidade anã próxima de Altaforja. Lá, o Alto Inventor Mekkatorque partiu para recrutar almas corajosas para ajudar seu povo a recuperar sua amada cidade. Diz-se que o outrora confiável conselheiro de Mekkatorque, Mecangenheiro Termaplugue, traiu seu povo ao permitir que a invasão acontecesse. Agora, com sua sanidade despedaçada, Termaplugue permanece em Gnomeregan - promovendo seus esquemas sombrios e agindo como o novo tecno-senhor da cidade.",
    Caption = "Gnomeregan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Gnomeregan.Alliance[1] = {
    Title = "Salve o cérebro do Techbot!",
    Id = 2922,
    Level = 26,
    Attain = 20,
    Aim = "Leve o Núcleo de Memória do Techbot para Tinkmaster Overspark no Centro de Recuperação de Gnomeregan.",
    Location = "Mestre-faz-tudo Superchispa (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."24.4,29.8"..white..")",
    Note = "Você pega a missão prévia de Irmão Sarmo (Ventobravo - Praça da Catedral "..yellow.."40,30"..white..").\nVocê encontra Tecnobô antes de entrar na instância perto da porta dos fundos, em "..yellow.."[4] no Mapa de Entrada"..white..".",
    Prequest = "Tinkmaster Overspark",
}
kQuestInstanceData.Gnomeregan.Alliance[2] = {
    Title = "Gnogaína",
    Id = 2926,
    Level = 27,
    Attain = 20,
    Aim = "Use o Frasco de Coleta de Chumbo Vazio em Invasores Irradiados ou Saqueadores Irradiados para coletar precipitação radioativa. Quando estiver cheio, leve-o de volta para Ozzie Togglevolt em Kharanos.",
    Location = "Ozzie Mudavolt (Dun Morogh - Kharanos "..yellow.."45,49"..white..")",
    Note = "Você pega a missão prévia de Gnoarn (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."24.5,30.4"..white..").\nPara pegar a precipitação você deve usar o Frasco em Invasores Irradiados ou Saqueadores Irradiados "..red.."vivos"..white..".",
    Prequest = "O dia seguinte",
    Folgequest = "A única cura é mais brilho verde",
}
kQuestInstanceData.Gnomeregan.Alliance[3] = {
    Title = "A única cura é mais brilho verde",
    Id = 2962,
    Level = 30,
    Attain = 20,
    Aim = "Viaje para Gnomeregan e traga de volta a precipitação radioativa de alta potência. Esteja avisado, a precipitação radioativa é instável e entrará em colapso rapidamente.$B$BOzzie também exigirá seu Frasco de Coleta de Chumbo Pesado quando a tarefa for concluída.",
    Location = "Ozzie Mudavolt (Dun Morogh - Kharanos "..yellow.."45,49"..white..")",
    Note = "Para pegar a precipitação você deve usar o Frasco em Limos Irradiados ou Horrores "..red.."vivos"..white..".",
    Prequest = "Gnogaína",
}
kQuestInstanceData.Gnomeregan.Alliance[4] = {
    Title = "Escavadeiras Girodrimáticas",
    Id = 2928,
    Level = 30,
    Attain = 20,
    Aim = "Leve vinte e quatro tripas robomecânicas para Shoni em Ventobravo.",
    Location = "Shoni, o Silencioso (Ventobravo - Distrito Anão "..yellow.."55,12"..white..")",
    Note = "Todos os Robôs podem dropar as Entranhas Mecânicas de Robô.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9608 }, --Shoni's Disarming Tool Off Hand, Axe
        { id = 9609 }, --Shilly Mitts Hands, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[5] = {
    Title = "Artificiais Essenciais",
    Id = 2924,
    Level = 30,
    Attain = 24,
    Aim = "Leve 12 Artificiais Essenciais para Klockmort Spannerspan no Centro de Recuperação de Gnomeregan.",
    Location = "Cronomorfus Espanafuso (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."23.6,28"..white..")",
    Note = "Você pega a missão prévia de Mathiel (Darnassus - Terraço do Guerreiro "..yellow.."59,45"..white.."). A missão prévia é apenas uma missão de apontamento e não é necessária para pegar esta missão.\nOs Artificiais Essenciais vêm de máquinas espalhadas pela instância.",
    Prequest = "Fundamentos de Klockmort",
}
kQuestInstanceData.Gnomeregan.Alliance[6] = {
    Title = "Resgate de dados",
    Id = 2930,
    Level = 30,
    Attain = 25,
    Aim = "Leve um Cartão Perfurado Prismático para o Mestre Mecânico Fundecano no Centro de Recuperação de Gnomeregan em Dun Morogh.",
    Location = "Mestre Mecânico Fundecano (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."24.1,29.8"..white..")",
    Note = "Você pega a missão prévia de Gaxim Deuxabu (Cordilheira das Torres de Pedra "..yellow.."59,67"..white.."). A missão prévia é apenas uma missão de apontamento e não é necessária para pegar esta missão.\nO cartão branco é um drop aleatório. Você encontra o primeiro terminal ao lado da entrada dos fundos antes de entrar na instância em "..yellow.."[3] no Mapa de Entrada"..white..". O 3005-B está em "..yellow.."[3]"..white..", o 3005-C em "..yellow.."[5]"..white.." e o 3005-D está em "..yellow.."[6]"..white..".",
    Prequest = "Tarefa do Castpipe",
    Rewards = {
        Text = "Rewards:",
        { id = 9605 }, --Repairman's Cape Back
        { id = 9604 }, --Mechanic's Pipehammer Two-Hand, Mace
    }
}
kQuestInstanceData.Gnomeregan.Alliance[7] = {
    Title = "Uma bela bagunça",
    Id = 2904,
    Level = 30,
    Attain = 24,
    Aim = "Escolte Kernobee até a saída Clockwerk Run e depois apresente-se a Scooty em Booty Bay.",
    Location = "Kernobill (Gnomeregan "..yellow.."[3]"..white..")",
    Note = "Missão de escolta! Você encontra Scooty em Selva do Espinhaço - Angra do Butim ("..yellow.."27,77"..white..").",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[8] = {
    Title = "A Grande Traição",
    Id = 2929,
    Level = 35,
    Attain = 25,
    Aim = "Aventure-se em Gnomeregan e mate Mecangenheiro Termaplugue. Volte para Alto Inventor Mekkatorque quando a tarefa for concluída.",
    Location = "Grão-faz-tudo Mekkatorque (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."24.2,29.7"..white..")",
    Note = "Você encontra Termaplugue em "..yellow.."[8]"..white..". Ele é o último chefe em Gnomeregan.\nDurante a luta você deve desativar as colunas pressionando o botão ao lado.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Alliance[9] = {
    Title = "Anel incrustado de sujeira",
    Id = 2945,
    Level = 34,
    Attain = 28,
    Aim = "Descubra uma maneira de remover a sujeira do anel incrustado de sujeira.",
    Location = "Anel Encrustado de Sujeira (drop aleatório de Gnomeregan)",
    Note = "O Anel pode ser limpo no Sparklematic 5200 na Sala Limpa em "..yellow.."[2]"..white..".",
    Folgequest = "Retorno do Anel",
}
kQuestInstanceData.Gnomeregan.Alliance[10] = {
    Title = "Retorno do Anel",
    Id = 2947,
    Level = 34,
    Attain = 28,
    Aim = "Você pode ficar com o anel ou encontrar a pessoa responsável pela impressão e gravuras no interior da pulseira.",
    Location = "Anel de Ouroboros Brilhante (obtido da missão Anel Encrustado de Sujeira)",
    Note = "Entregue para Didiê Du Mocó (Altaforja - Ala Mística "..yellow.."36,3"..white.."). A sequência para aprimorar o anel é opcional.",
    Prequest = "Anel incrustado de sujeira",
    Folgequest = "Melhoria do Gnomo",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Alliance[11] = {
    Title = "Um cérebro forte",
    Id = 80398,
    Level = 30,
    Attain = 30,
    Aim = "Encontre alguém que possa descobrir o que fazer com o Mainframe.",
    Location = "Mainframe de Impacto Intacto",
    Note = "Mainframe de Impacto Intacto que inicia a missão pode dropar de Espanca-gente 9-60 "..yellow.."[6]"..white.." (chance baixa).\n"..red.."Disponível para ENGENHEIROS com habilidade 125+.",
    Folgequest = "Para construir um Pounder",
}
kQuestInstanceData.Gnomeregan.Alliance[12] = {
    Title = "Regulador de alta energia",
    Id = 40861,
    Level = 33,
    Attain = 25,
    Aim = "Encontre o Esquema: Regulador de Alta Energia em Gnomeregan e leve-o para Weezan Pequenoengrenagem no Centro de Recuperação de Gnomeregan em Dun Morogh.",
    Location = "Weezan Pequenoengrenagem (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."[25.2,31.6]"..white..")",
    Note = "Esquema: Regulador de Alta Energia está na mesa em "..yellow.."[3]"..white.." canto sudeste da câmara inferior sul "..yellow.."[a]"..white..".",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61393 }, --Low Energy Regulator Trinket
    }
}
kQuestInstanceData.Gnomeregan.Alliance[13] = {
    Title = "Ativação do sistema de backup",
    Id = 40856,
    Level = 33,
    Attain = 25,
    Aim = "Ative a Válvula do Canal Alfa e a Alavanca do Canal da Bomba de Reserva nas profundezas de Gnomeregan para o Técnico Mestre Espanafio em Dun Morogh.",
    Location = "Técnico Mestre Espanafio (Dun Morogh - Fábrica da Reclamação de Gnomeregan "..yellow.."[26.8,31.1]"..white..")",
    Note = "Válvula do Canal Alfa está em "..yellow.."[6]"..white..", use o elevador para descer. lado sul do mecanismo central.\nAlavanca do Canal da Bomba de Reserva está em "..yellow.."[b]"..white.." no chão.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61383 }, --Intricate Gnomish Blunderbuss Gun
        { id = 61384 }, --Ionized Metal Grips Hands, Mail
        { id = 61385 }, --Magnetic Band Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[1] = {
    Title = "Gnomer-gooooone!",
    Id = 2843,
    Level = 35,
    Attain = 20,
    Aim = "Espere que Scooty calibre o Transponder Goblin.",
    Location = "Scooty (Selva do Espinhaço - Angra do Butim "..yellow.."27,77"..white..")",
    Note = "Você pega a missão prévia de Sovik (Orgrimmar - Vale da Honra "..yellow.."75,25"..white..").\nQuando você completa esta missão você pode usar o transponder em Angra do Butim.",
    Prequest = "Engenheiro Chefe Scooty",
}
kQuestInstanceData.Gnomeregan.Horde[2] = {
    Title = "Uma bela bagunça",
    Id = 2904,
    Level = 30,
    Attain = 24,
    Aim = "Escolte Kernobee até a saída Clockwerk Run e depois apresente-se a Scooty em Booty Bay.",
    Location = "Kernobill (Gnomeregan "..yellow.."[3]"..white..")",
    Note = "Missão de escolta! Você encontra Scooty em Selva do Espinhaço - Angra do Butim ("..yellow.."27,77"..white..").",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Horde[3] = {
    Title = "Guerras de plataformas",
    Id = 2841,
    Level = 35,
    Attain = 25,
    Aim = "Recupere os Projetos da Plataforma e a Combinação Segura do Thermaplugg de Gnomeregan e leve-os para Nogg em Orgrimmar.",
    Location = "Nogg (Orgrimmar - Vale da Honra "..yellow.."75,25"..white..")",
    Note = "Você encontra Termaplugue em "..yellow.."[8]"..white..". Ele é o último chefe em Gnomeregan.\nDurante a luta você deve desativar as colunas pressionando o botão ao lado.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Horde[4] = {
    Title = "Anel incrustado de sujeira",
    Id = 2945,
    Level = 34,
    Attain = 28,
    Aim = "Descubra uma maneira de remover a sujeira do anel incrustado de sujeira.",
    Location = "Anel Encrustado de Sujeira (drop aleatório de Gnomeregan)",
    Note = "O Anel pode ser limpo no Sparklematic 5200 na Sala Limpa em "..yellow.."[2]"..white..".",
    Folgequest = "Retorno do Anel",
}
kQuestInstanceData.Gnomeregan.Horde[5] = {
    Title = "Retorno do Anel",
    Id = 2947,
    Level = 34,
    Attain = 28,
    Aim = "Você pode ficar com o anel ou encontrar a pessoa responsável pela impressão e gravuras no interior da pulseira.",
    Location = "Anel de Ouroboros Brilhante (obtido da missão Anel Encrustado de Sujeira)",
    Note = "Entregue para Nogg (Orgrimmar - O Vale da Honra "..yellow.."75,25"..white.."). A sequência para aprimorar o anel é opcional.",
    Prequest = "Anel incrustado de sujeira",
    Folgequest = "Anel de Nogg refazer",
    Rewards = {
        Text = "Recompensa: ",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[6] = {
    Title = "Um cérebro forte",
    Id = 80398,
    Level = 30,
    Attain = 30,
    Aim = "Encontre alguém que possa descobrir o que fazer com o Mainframe.",
    Location = "Mainframe de Impacto Intacto",
    Note = "Mainframe de Impacto Intacto que inicia a missão pode dropar de Espanca-gente 9-60 "..yellow.."[6]"..white.." (chance baixa).\n"..red.."Disponível para ENGENHEIROS com habilidade 125+.",
    Folgequest = "Para construir um Pounder",
}
kQuestInstanceData.Gnomeregan.Horde[7] = {
    Title = "Capacitor de reserva",
    Id = 55006,
    Level = 34,
    Attain = 29,
    Aim = "Leve o Capacitor Megaflux para o Técnico Grimzlow.",
    Location = "Técnico Grimzlow (Durotar - Porto Sparkwater "..yellow.."57.4,25.7"..white..").",
    Note = "Missão prévia 'Uma nova fonte de energia' começa com Técnico Spuzzle(Durotar - Porto Sparkwater "..yellow.."57.4,25.8"..white..") no nível 7.\nCapacitor Megaflux dropa de Mecangenheiro Termaplugue. Você encontra Mecangenheiro Termaplugue em "..yellow.."[8]"..white..". Ele é o último chefe em Gnomeregan.\nDurante a luta você deve desativar as colunas pressionando o botão ao lado.",
    Prequest = "Uma nova fonte de energia",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
    Title = "Envolto em pesadelo",
    Id = 8446,
    Level = 60,
    Attain = 60,
    Aim = "Encontre alguém capaz de decifrar o significado por trás do Objeto Engolido pelo Pesadelo.$B$BTalvez um druida de grande poder possa ajudá-lo.",
    Location = "Objeto Engolfado pelo Pesadelo (dropa de Emeriss, Taerar, Lethon ou Ysondra)",
    Note = "Missão entregue para Guardião Remulos em (Clareira da Lua - Santuário de Remulos "..yellow.."36,41"..white.."). A recompensa listada é para a sequência.",
    Folgequest = "Despertando Lendas",
    Rewards = {
        Text = "Recompensa: ",
        { id = 20600 }, --Malfurion's Signet Ring Ring
    }
}
kQuestInstanceData.FourDragons.Horde[1] = kQuestInstanceData.FourDragons.Alliance[1]

--------------- Azuregos ---------------
kQuestInstanceData.Azuregos = {
    Story = "Antes do Grande Cataclismo, a cidade elfa noturna de Eldarath floresceu na terra que agora é conhecida como Azshara. Acredita-se que muitos artefatos antigos e poderosos dos Altinatos possam ser encontrados entre as ruínas da outrora poderosa fortaleza. Por incontáveis gerações, o Voo de Dragões Azuis tem guardado artefatos poderosos e conhecimento mágico, garantindo que eles não caiam em mãos mortais. A presença de Azuregos, o dragão Azul, parece sugerir que itens de extrema significância, talvez os próprios lendários Frascos da Eternidade, possam ser encontrados nas terras selvagens de Azshara. Seja o que for que Azuregos procura, uma coisa é certa: ele lutará até a morte para defender os tesouros mágicos de Azshara.",
    Caption = "Azuregos",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Azuregos.Alliance[1] = {
    Title = "Lâmina Envolta em Tendão Antigo",
    Id = 7634,
    Level = 60,
    Attain = 60,
    Aim = "Hastat, o Ancião, pediu que você trouxesse para ele um Tendão de Dragão Azul Maduro. Se você encontrar este tendão, devolva-o para Hastat em Selva Maleva.",
    Location = "Hastat, o Anciente (Selva Maleva - Bosques Irontree "..yellow.."48,24"..white..")",
    Note = red.."Apenas Caçador"..white..": Mate Azuregos para pegar o Tendão de Dragão Azul Maduro. Ele anda pelo meio da península sul em Azshara perto de "..yellow.."[1]"..white..".",
    Prequest = "A Folha Antiga ("..yellow.."Molten Core"..white..")", -- 7632",
    Rewards = {
        Text = "Recompensa: ",
        { id = 18714 }, --Ancient Sinew Wrapped Lamina Quiver
    }
}
kQuestInstanceData.Azuregos.Alliance[2] = {
    Title = "Livro Mágico de Azuregos",
    Id = 8575,
    Level = 60,
    Attain = 60,
    Aim = "Entregue o Livro Mágico de Azuregos para Narain Soothfancy em Tanaris.",
    Location = "Espírito de Azuregos (Azshara "..yellow.."56,83"..white..")",
    Note = "Você pode encontrar Narain Suavestilo em Tanaris em "..yellow.."65.17"..white..".",
    Prequest = "Encomienda a los Vuelos",
    Folgequest = "Traduzindo o livro-razão",
}
kQuestInstanceData.Azuregos.Horde[1] = kQuestInstanceData.Azuregos.Alliance[1]
kQuestInstanceData.Azuregos.Horde[2] = kQuestInstanceData.Azuregos.Alliance[2]

--------------- Lord Kazzak ---------------
kQuestInstanceData.LordKazzak = {
    Story = "Após a derrota da Legião Ardente no final da Terceira Guerra, as forças inimigas restantes, lideradas pelo colossal lorde demoníaco Kazzak, recuaram para as Terras Desoladas. Eles continuam a habitar lá até hoje em uma área chamada a Cicatriz Maculada, aguardando a reabertura do Portal das Trevas. Diz-se que uma vez que o Portal seja reaberto, Kazzak viajará com suas forças restantes para Terralém. Uma vez o mundo natal orc de Draenor, Terralém foi despedaçado pela ativação simultânea de vários portais criados pelo xamã orc Ner'zhul, e agora existe como um mundo despedaçado ocupado por legiões de agentes demoníacos sob o comando do traidor elfo noturno, Illidan.",
    Caption = "Lorde Kazzak",
    Alliance = {},
    Horde = {}
}

--------------- Alterac Valley ---------------
kQuestInstanceData.BGAlteracValleyNorth = {
    Story = "Há muito tempo, antes da Primeira Guerra, o bruxo Gul'dan exilou um clã de orcs chamado Lobos Gélidos para um vale escondido no fundo do coração das Montanhas de Alterac. É aqui, nas regiões sul do vale, que os Lobos Gélidos conseguiram uma vida até a chegada de Thrall.\nApós a triunfante união dos clãs por Thrall, os Lobos Gélidos, agora liderados pelo Xamã Orc Drek'Thar, escolheram permanecer no vale que há tanto tempo chamavam de lar. Em tempos recentes, no entanto, a paz relativa dos Lobos Gélidos foi desafiada pela chegada da Expedição Anã Martelo Feroz.\nOs Martelo Feroz se estabeleceram no vale para procurar recursos naturais e relíquias antigas. Apesar de suas intenções, a presença Anã provocou conflito acirrado com os Orcs Lobo Gélido ao sul, que juraram expulsar os intrusos de suas terras. ",
    Caption = "Vale Alterac",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[1] = {
    Title = "O Imperativo Soberano",
    Id = 7261,
    Level = 60,
    Attain = 51,
    Aim = "Viaje para o Vale Alterac no sopé de Hillsbrad. Fora do túnel de entrada, encontre e fale com o Tenente Haggerdin.$B$BPela glória de Bronzebeard!",
    Location = "Tenente Rotimer (Altaforja - Os Comuns "..yellow.."30,62"..white..")",
    Note = "Tenente Haggerdin está em (Montanhas de Alterac "..yellow.."39,81"..white..").",
    Folgequest = "Campos de Provas",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[2] = {
    Title = "Campos de Provas",
    Id = 7162,
    Level = 60,
    Attain = 51,
    Aim = "Viaje para a caverna Wildpaw localizada a sudeste da base principal em Alterac Valley e encontre o Frostwolf Banner. Devolva a Bandeira do Lobo do Gelo ao Mestre Guerreiro Laggrond. ",
    Location = "Tenente Haggerdin (Montanhas de Alterac "..yellow.."39,81"..white..")",
    Note = "A Bandeira Martelo Feroz está na Caverna Gélida em "..yellow.."[11]"..white.." no mapa Vale Alterac - Norte. Fale com o mesmo NPC cada vez que ganhar um novo nível de Reputação para uma Insígnia aprimorada.\n\nA missão prévia não é necessária para obter esta missão, mas rende cerca de 9550 de experiência.",
    Prequest = "O Imperativo Soberano",
    Folgequest = "Levante-se e seja reconhecido -> O Olho do Comando",
    Rewards = {
        Text = "Rewards:",
        { id = 17691 }, --Stormpike Insignia Rank 1 Trinket
        { id = 19484 }, --The Frostwolf Artichoke Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[3] = {
    Title = "A Batalha de Alterac",
    Id = 7141,
    Level = 60,
    Attain = 51,
    Aim = "Entre no Vale Alterac, derrote o general da Horda Drek'thar e depois retorne ao Prospector Stonehewer nas Montanhas Alterac.",
    Location = "Prospectora Entalharrocha (Montanhas de Alterac "..yellow.."41,80"..white..") e\n(Vale Alterac - North "..yellow.."[B]"..white..")",
    Note = "Drek'thar está em (Vale Alterac - Sul "..yellow.."[B]"..white.."). Ele não precisa realmente ser morto para completar a missão. O campo de batalha só precisa ser ganho pelo seu lado de qualquer maneira.\nDepois de entregar esta missão, fale com o NPC novamente para a recompensa.",
    Folgequest = "Herói do Stormpike",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 19107 }, --Bloodseeker Crossbow
        { id = 19106 }, --Ice Barbed Spear Polearm
        { id = 19108 }, --Wand of Biting Cold Wand
        { id = 20648 }, --Cold Forged Hammer Main Hand, Mace
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[4] = {
    Title = "O Intendente",
    Id = 7121,
    Level = 60,
    Attain = 51,
    Aim = "Fale com o Intendente Lançatroz.",
    Location = "Montanhista Tony Troante (Vale Alterac - North "..yellow.."Near [3] Before Bridge"..white..")",
    Note = "O Intendente de Lançatroz está em (Vale Alterac - Norte "..yellow.."[7]"..white..") e fornece mais missões.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[5] = {
    Title = "Suprimentos para Dentes Frios",
    Id = 6982,
    Level = 60,
    Attain = 51,
    Aim = "Leve 10 Suprimentos Coldtooth para o Quatermaster da Horda na Fortaleza Lobo do Gelo.",
    Location = "Intendente de Lançatroz (Vale Alterac - North "..yellow.."[7]"..white..")",
    Note = "Os suprimentos podem ser encontrados na Mina Dentegelo em (Vale Alterac - Sul "..yellow.."[6]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[6] = {
    Title = "Suprimentos para Profunda Ferro",
    Id = 5892,
    Level = 60,
    Attain = 51,
    Aim = "Leve 10 Suprimentos da Profundeza de Ferro para o Intendente da Aliança em Dun Baldar.",
    Location = "Intendente de Lançatroz (Vale Alterac - North "..yellow.."[7]"..white..")",
    Note = "Os suprimentos podem ser encontrados na Mina Ferrodoente em (Vale Alterac - Norte "..yellow.."[1]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[7] = {
    Title = "Restos de Armadura",
    Id = 7223,
    Level = 60,
    Attain = 51,
    Aim = "Leve 20 restos de armadura para Murgot Deepforge em Dun Baldar.",
    Location = "Murgot Baixaforja (Vale Alterac - North "..yellow.."[4]"..white..")",
    Note = "Saque o cadáver de jogadores inimigos por retalhos. A sequência é apenas a mesma missão, mas repetível.",
    Folgequest = "Mais restos de armadura",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[8] = {
    Title = "Capture uma mina",
    Id = 7122,
    Level = 60,
    Attain = 51,
    Aim = "Capture uma mina que o Stormpike não controla e depois retorne ao Sargento Durgen Stormpike nas Montanhas Alterac.",
    Location = "Sargento Durgen Lançatroz (Montanhas de Alterac "..yellow.."37,77"..white..")",
    Note = "Para completar a missão, você deve matar Morloch na Mina Ferrodoente em (Vale Alterac - Norte "..yellow.."[1]"..white..") ou Capataz Ranhento na Mina Dentegelo em (Vale Alterac - Sul "..yellow.."[6]"..white..") enquanto a Horda a controla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[9] = {
    Title = "Torres e Bunkers",
    Id = 7102,
    Level = 60,
    Attain = 51,
    Aim = "Capture uma torre inimiga e depois retorne ao Cabo Teeka Bloodsnarl nas Montanhas Alterac.",
    Location = "Sargento Durgen Lançatroz (Montanhas de Alterac "..yellow.."37,77"..white..")",
    Note = "Segundo relatos, a Torre ou Bunker não precisa realmente ser destruída para completar a missão, apenas assaltada.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[10] = {
    Title = "Cemitérios do Vale Alterac",
    Id = 7081,
    Level = 60,
    Attain = 51,
    Aim = "Ataque um cemitério e depois retorne ao Sargento Durgen Stormpike nas Montanhas Alterac.",
    Location = "Sargento Durgen Lançatroz (Montanhas de Alterac "..yellow.."37,77"..white..")",
    Note = "Segundo relatos você não precisa fazer nada além de estar perto de um cemitério quando a Aliança o assaltar. Não precisa ser capturado, apenas assaltado.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[11] = {
    Title = "Estábulos Vazios",
    Id = 7027,
    Level = 60,
    Attain = 51,
    Aim = "Localize um Lobo do Gelo no Vale Alterac. Use o Focinho do Lobo do Gelo quando estiver perto do Lobo do Gelo para 'domar' a fera. Uma vez domesticado, o Frostwolf irá segui-lo de volta ao Frostwolf Stable Master. Fale com o Frostwolf Stable Master para ganhar crédito pela captura.",
    Location = "Mestre de Estábulo de Lançatroz (Vale Alterac - North "..yellow.."[6]"..white..")",
    Note = "Você pode encontrar um Carneiro fora da base. O processo de domação é igual ao de um Caçador domando um animal. A missão é repetível até um total de 25 vezes por campo de batalha pelo mesmo jogador ou jogadores. Depois que 25 Carneiros foram domados, a Cavalaria Martelo Feroz chegará para ajudar na batalha.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[12] = {
    Title = "Arneses de equitação de carneiro",
    Id = 7026,
    Level = 60,
    Attain = 51,
    Aim = "nulo",
    Location = "Comandante de Carneiros de Lançatroz (Vale Alterac - North "..yellow.."[6]"..white..")",
    Note = "Lobos Gélidos podem ser encontrados na área sul do Vale Alterac.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[13] = {
    Title = "Aglomerado de Cristal",
    Id = 7386,
    Level = 60,
    Attain = 51,
    Aim = "nulo",
    Location = "Arquidruida Renferal (Vale Alterac - North "..yellow.."[2]"..white..")",
    Note = "Depois de entregar 200 ou mais cristais, Arquidruida Renferal começará a caminhar em direção a (Vale Alterac - Norte "..yellow.."[19]"..white.."). Uma vez lá, ela começará um ritual de invocação que exigirá 10 pessoas para ajudar. Se bem-sucedido, Ivus, o Senhor da Floresta será invocado para ajudar a batalha.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[14] = {
    Title = "Ivus, o Senhor da Floresta",
    Id = 6881,
    Level = 60,
    Attain = 51,
    Aim = "O Clã Lobo Gélido é protegido por uma mácula de energia elemental. Seus xamãs se intrometem em poderes que certamente nos destruirão a todos se não forem controlados.\n\nOs soldados Lobo Gélido carregam amuletos elementais chamados cristais de tempestade. Podemos usar os amuletos para conjurar Ivus. Aventure-se e reivindique os cristais.",
    Location = "Arquidruida Renferal (Vale Alterac - North "..yellow.."[2]"..white..")",
    Note = "Depois de entregar 200 ou mais cristais, Arquidruida Renferal começará a caminhar em direção a (Vale Alterac - Norte "..yellow.."[19]"..white.."). Uma vez lá, ela começará um ritual de invocação que exigirá 10 pessoas para ajudar. Se bem-sucedido, Ivus, o Senhor da Floresta será invocado para ajudar a batalha.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[15] = {
    Title = "Call of Air - Frota de Slidore",
    Id = 6942,
    Level = 60,
    Attain = 51,
    Aim = "Meus grifos estão prontos para atacar as linhas de frente, mas não podem fazer o ataque até que as linhas sejam reduzidas.\n\nOs guerreiros Lobo Gélido encarregados de manter as linhas de frente usam medalhas de serviço orgulhosamente em seus peitos. Arranque essas medalhas de seus cadáveres podres e traga-as de volta aqui.\n\nUma vez que a linha de frente esteja suficientemente reduzida, farei a chamada para o ar! Morte de cima!",
    Location = "Comandante de Ala Slidore (Vale Alterac - North "..yellow.."[8]"..white..")",
    Note = "Mate NPCs da Horda pela Medalha do Soldado Lobo do Gelo.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[16] = {
    Title = "Call of Air - Frota de Vipore",
    Id = 6941,
    Level = 60,
    Attain = 51,
    Aim = "As unidades de elite Lobo Gélido que guardam as linhas devem ser enfrentadas, soldado! Estou te encarregando de reduzir aquele rebanho de selvagens. Retorne para mim com medalhas de seus tenentes e legionários. Quando eu sentir que o suficiente da ralé foi tratado, implantarei o ataque aéreo.",
    Location = "Comandante de Ala Vipore (Vale Alterac - North "..yellow.."[8]"..white..")",
    Note = "Mate NPCs da Horda pela Medalha do Tenente Lobo do Gelo.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[17] = {
    Title = "Call of Air - Frota de Ichman",
    Id = 6943,
    Level = 60,
    Attain = 51,
    Aim = "Retorne ao campo de batalha e ataque o coração do comando Lobo Gélido. Derrube seus comandantes e guardiões. Retorne para mim com o máximo de medalhas deles que você conseguir enfiar em sua mochila! Prometo a você, quando meus grifos virem a recompensa e cheirarem o sangue de nossos inimigos, eles voarão novamente! Vá agora!",
    Location = "Comandante de Ala Ichman (Vale Alterac - North "..yellow.."[8]"..white..")",
    Note = "Mate NPCs da Horda pelas Medalhas do Comandante Lobo do Gelo. Depois de entregar 50, Comandante de Ala Ichman enviará um grifo para atacar a base da Horda ou lhe dará um sinalizador para plantar no Cemitério Queda de Neve. Se o sinalizador for protegido tempo suficiente, um grifo virá defendê-lo.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[1] = {
    Title = "Em Defesa do Lobo do Gelo",
    Id = 7241,
    Level = 60,
    Attain = 51,
    Aim = "Aventure-se no Vale Alterac, localizado nas Montanhas Alterac. Encontre e fale com Warmaster Laggrond – que está do lado de fora da entrada do túnel – para começar sua carreira como soldado de Frostwolf. Você encontrará o Vale Alterac ao norte do Moinho Tarren, na base das Montanhas Alterac.",
    Location = "Embaixatriz dos Lobo do Gelo Rokhstrom (Orgrimmar - Vale da Força "..yellow.."50,71"..white..")",
    Note = "Mestre Guerreiro Laggrond está em (Montanhas de Alterac "..yellow.."62,59"..white..").",
    Folgequest = "Campos de Provas",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[2] = {
    Title = "Campos de Provas",
    Id = 7161,
    Level = 60,
    Attain = 51,
    Aim = "Viaje para a caverna Wildpaw localizada a sudeste da base principal em Alterac Valley e encontre o Frostwolf Banner. Devolva a Bandeira do Lobo do Gelo ao Mestre Guerreiro Laggrond. ",
    Location = "Mestre Guerreiro Laggrond (Montanhas de Alterac "..yellow.."62,59"..white..")",
    Note = "A Bandeira Lobo do Gelo está na Caverna Pata Selvagem em (Vale Alterac - Sul "..yellow.."[9]"..white.."). Fale com o mesmo NPC cada vez que ganhar um novo nível de Reputação para uma Insígnia aprimorada.\n\nA missão prévia não é necessária para obter esta missão, mas rende cerca de 9550 de experiência.",
    Prequest = "Em Defesa do Lobo do Gelo",
    Folgequest = "Levante-se e seja reconhecido -> O Olho do Comando",
    Rewards = {
        Text = "Rewards:",
        { id = 17690 }, --Frostwolf Insignia Rank 1 Trinket
        { id = 19483 }, --Peeling the Onion Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[3] = {
    Title = "A Batalha por Alterac",
    Id = 7142,
    Level = 60,
    Attain = 51,
    Aim = "Entre no Vale Alterac e derrote o general anão, Vanndar Stormpike.  Em seguida, retorne para Voggah Deathgrip nas Montanhas Alterac.",
    Location = "Voggah Garramort (Montanhas de Alterac "..yellow.."64,60"..white..")",
    Note = "Vanndar Lançatroz está em (Vale Alterac - Norte "..yellow.."[B]"..white.."). Ele não precisa realmente ser morto para completar a missão. O campo de batalha só precisa ser ganho pelo seu lado de qualquer maneira.\nDepois de entregar esta missão, fale com o NPC novamente para a recompensa.",
    Folgequest = "Herói do Lobo do Gelo",
    Rewards = kQuestInstanceData.BGAlteracValleyNorth.Alliance[3].Rewards
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[4] = {
    Title = "Fale com nosso Intendente",
    Id = 7123,
    Level = 60,
    Attain = 51,
    Aim = "Fale com o Intendente Lobo do Gelo.",
    Location = "Jotek (Vale Alterac - South "..yellow.."[8]"..white..")",
    Note = "O Intendente dos Lobo do Gelo está em "..yellow.."[10]"..white.." e fornece mais missões.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[5] = {
    Title = "Suprimentos para Dentes Frios",
    Id = 5893,
    Level = 60,
    Attain = 51,
    Aim = "Leve 10 Suprimentos Coldtooth para o Quatermaster da Horda na Fortaleza Lobo do Gelo.",
    Location = "Intendente dos Lobo do Gelo (Vale Alterac - South "..yellow.."[10]"..white..")",
    Note = "Os suprimentos podem ser encontrados na Mina Dentegelo em (Vale Alterac - Sul "..yellow.."[6]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[6] = {
    Title = "Suprimentos para Profunda Ferro",
    Id = 6985,
    Level = 60,
    Attain = 51,
    Aim = "Leve 10 Suprimentos da Profundeza de Ferro para o Intendente da Aliança em Dun Baldar.",
    Location = "Intendente dos Lobo do Gelo (Vale Alterac - South "..yellow.."[10]"..white..")",
    Note = "Os suprimentos podem ser encontrados na Mina Ferrodoente em (Vale Alterac - Norte "..yellow.."[1]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[7] = {
    Title = "Espólio Inimigo",
    Id = 7224,
    Level = 60,
    Attain = 51,
    Aim = "Leve 20 restos de armadura para Smith Regzar na Vila Lobo do Gelo.",
    Location = "Ferreiro Regzar (Vale Alterac - South "..yellow.."[8]"..white..")",
    Note = "Saque o cadáver de jogadores inimigos por retalhos. A sequência é apenas a mesma missão, mas repetível.",
    Folgequest = "Mais saque!",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[8] = {
    Title = "Capture uma mina",
    Id = 7124,
    Level = 60,
    Attain = 51,
    Aim = "Capture uma mina que o Stormpike não controla e depois retorne ao Sargento Durgen Stormpike nas Montanhas Alterac.",
    Location = "Cabo Tika Rosnassangue (Montanhas de Alterac "..yellow.."66,55"..white..")",
    Note = "Para completar a missão, você deve matar Morloch na Mina Ferrodoente em (Vale Alterac - Norte "..yellow.."[1]"..white..") ou Capataz Ranhento na Mina Dentegelo em (Vale Alterac - Sul "..yellow.."[6]"..white..") enquanto a Aliança a controla.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[9] = {
    Title = "Torres e Bunkers",
    Id = 7101,
    Level = 60,
    Attain = 51,
    Aim = "Capture uma torre inimiga e depois retorne ao Cabo Teeka Bloodsnarl nas Montanhas Alterac.",
    Location = "Cabo Tika Rosnassangue (Montanhas de Alterac "..yellow.."66,55"..white..")",
    Note = "Segundo relatos, a Torre ou Bunker não precisa realmente ser destruída para completar a missão, apenas assaltada.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[10] = {
    Title = "Os Cemitérios de Alterac",
    Id = 7082,
    Level = 60,
    Attain = 51,
    Aim = "Ataque um cemitério e depois volte para falar com o Cabo Teeka Bloodsnarl nas Montanhas Alterac.",
    Location = "Cabo Tika Rosnassangue (Montanhas de Alterac "..yellow.."66,55"..white..")",
    Note = "Segundo relatos você não precisa fazer nada além de estar perto de um cemitério quando a Horda o assaltar. Não precisa ser capturado, apenas assaltado.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[11] = {
    Title = "Estábulos Vazios",
    Id = 7001,
    Level = 60,
    Attain = 51,
    Aim = "Localize um Lobo do Gelo no Vale Alterac. Use o Focinho do Lobo do Gelo quando estiver perto do Lobo do Gelo para 'domar' a fera. Uma vez domesticado, o Frostwolf irá segui-lo de volta ao Frostwolf Stable Master. Fale com o Frostwolf Stable Master para ganhar crédito pela captura.",
    Location = "Mestre de Estábulo dos Lobo do Gelo (Vale Alterac - South "..yellow.."[9]"..white..")",
    Note = "Você pode encontrar um Lobo do Gelo fora da base. O processo de domação é igual ao de um Caçador domando um animal. A missão é repetível até um total de 25 vezes por campo de batalha pelo mesmo jogador ou jogadores. Depois que 25 Carneiros foram domados, a Cavalaria Lobo do Gelo chegará para ajudar na batalha.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[12] = {
    Title = "Arneses de pele de carneiro",
    Id = 7002,
    Level = 60,
    Attain = 51,
    Aim = "nulo",
    Location = "Comandante Cavalga-lobo dos Lobo do Gelo (Vale Alterac - South "..yellow.."[9]"..white..")",
    Note = "Os Carneiros podem ser encontrados na área norte do Vale Alterac.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[13] = {
    Title = "Um galão de sangue",
    Id = 7385,
    Level = 60,
    Attain = 51,
    Aim = "nulo",
    Location = "Primevista Thurloga (Vale Alterac - South "..yellow.."[8]"..white..")",
    Note = "Depois de entregar 150 ou mais Sangue, Primevista Thurloga começará a caminhar em direção a (Vale Alterac - Sul "..yellow.."[14]"..white.."). Uma vez lá, ela começará um ritual de invocação que exigirá 10 pessoas para ajudar. Se bem-sucedido, Lokholar, o Senhor do Gelo será invocado para matar jogadores da Aliança.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[14] = {
    Title = "Lokholar, o Senhor do Gelo",
    Id = 6801,
    Level = 60,
    Attain = 51,
    Aim = "Você deve derrubar nossos inimigos e trazer-me seu sangue. Uma vez que sangue suficiente tenha sido reunido, o ritual de invocação pode começar.\n\nA vitória será garantida quando o senhor elemental for solto sobre o exército Martelo Feroz.",
    Location = "Primevista Thurloga (Vale Alterac - South "..yellow.."[8]"..white..")",
    Note = "Depois de entregar 150 ou mais Sangue, Primevista Thurloga começará a caminhar em direção a (Vale Alterac - Sul "..yellow.."[14]"..white.."). Uma vez lá, ela começará um ritual de invocação que exigirá 10 pessoas para ajudar. Se bem-sucedido, Lokholar, o Senhor do Gelo será invocado para matar jogadores da Aliança.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[15] = {
    Title = "Call of Air - Frota de Guse",
    Id = 6825,
    Level = 60,
    Attain = 51,
    Aim = "Meus cavaleiros estão prontos para fazer um ataque no campo de batalha central; mas primeiro, devo aguçar seus apetites - preparando-os para o ataque.\n\nPreciso de Carne de Soldado Martelo Feroz suficiente para alimentar uma frota! Centenas de libras! Com certeza você pode lidar com isso, sim? Vá em frente!",
    Location = "Comandante de Ala Guze (Vale Alterac - South "..yellow.."[13]"..white..")",
    Note = "Mate NPCs da Horda pela Carne do Soldado Martelo Feroz. Segundo relatos, 90 carnes são necessárias para fazer a Comandante de Ala fazer o que quer que ela faça.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[16] = {
    Title = "Call of Air - Frota de Jeztor",
    Id = 6826,
    Level = 60,
    Attain = 51,
    Aim = "Meus Cavaleiros de Guerra devem provar a carne de seus alvos. Isso garantirá um ataque cirúrgico contra nossos inimigos!\n\nMinha frota é a segunda mais poderosa em nosso comando aéreo. Portanto, eles atacarão os mais poderosos de nossos adversários. Para isso, então, eles precisam da carne dos Tenentes Martelo Feroz.",
    Location = "Comandante de Ala Jeztor (Vale Alterac - South "..yellow.."[13]"..white..")",
    Note = "Mate NPCs da Aliança pela Carne do Tenente Martelo Feroz.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[17] = {
    Title = "Call of Air - Frota de Mulverick",
    Id = 6827,
    Level = 60,
    Attain = 51,
    Aim = "Primeiro, meus cavaleiros de guerra precisam de alvos para mirar - alvos de alta prioridade. Vou precisar alimentá-los com a carne dos Comandantes Martelo Feroz. Infelizmente, esses pequenos estão entrincheirados profundamente atrás das linhas inimigas! Você definitivamente tem muito trabalho pela frente.",
    Location = "Comandante de Ala Mulverick (Vale Alterac - South "..yellow.."[13]"..white..")",
    Note = "Mate NPCs da Aliança pela Carne do Comandante Martelo Feroz.",
}

--------------- Arathi Basin ---------------
kQuestInstanceData.BGArathiBasin = {
    Story = "A Bacia Arathi, localizada nas Terras Altas de Arathi, é um Campo de Batalha rápido e emocionante. A própria Bacia é rica em recursos e cobiçada tanto pela Horda quanto pela Aliança. Os Conspurcadores Renegados e a Liga de Arathor chegaram à Bacia Arathi para travar guerra por esses recursos naturais e reivindicá-los em nome de seus respectivos lados.",
    Caption = "Bacia Arathi",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGArathiBasin.Alliance[1] = {
    Title = "A Batalha pela Bacia Arathi!",
    Id = 8105,
    Level = 55,
    Attain = 50,
    Aim = "Ataque a mina, a serraria, o ferreiro e a fazenda, depois retorne ao Marechal de Campo Oslight em Refuge Pointe.",
    Location = "Marechal-de-campo Oslight (Planalto Arathi - Ponto de Refúgio "..yellow.."46,45"..white..")",
    Note = "Os locais a serem assaltados estão marcados no mapa como 2 a 5.",
}
kQuestInstanceData.BGArathiBasin.Alliance[2] = {
    Title = "Controle Quatro Bases",
    Id = 8114,
    Level = 60,
    Attain = 60,
    Aim = "Entre na Bacia Arathi, capture e controle quatro bases ao mesmo tempo e depois retorne ao Marechal de Campo Oslight em Refuge Pointe.",
    Location = "Marechal-de-campo Oslight (Planalto Arathi - Ponto de Refúgio "..yellow.."46,45"..white..")",
    Note = "Você precisa ser Amigável com a Liga de Arathor para pegar esta missão.",
}
kQuestInstanceData.BGArathiBasin.Alliance[3] = {
    Title = "Controle cinco bases",
    Id = 8115,
    Level = 60,
    Attain = 60,
    Aim = "Controle 5 bases na Bacia Arathi ao mesmo tempo e depois retorne ao Marechal de Campo Oslight em Refuge Pointe.",
    Location = "Marechal-de-campo Oslight (Planalto Arathi - Ponto de Refúgio "..yellow.."46,45"..white..")",
    Note = "Você precisa ser Exaltado com a Liga de Arathor para pegar esta missão.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 20132 }, --Arathor Battle Tabard Tabard
    }
}
kQuestInstanceData.BGArathiBasin.Horde[1] = {
    Title = "A Batalha pela Bacia Arathi!",
    Id = 8120,
    Level = 25,
    Attain = 25,
    Aim = "Ataque a mina, a serraria, o ferreiro e a fazenda, depois retorne ao Marechal de Campo Oslight em Refuge Pointe.",
    Location = "Senhora da Morte Dwire (Planalto Arathi - Queda do Martelo "..yellow.."74,35"..white..")",
    Note = "Os locais a serem assaltados estão marcados no mapa como 1 a 4.",
}
kQuestInstanceData.BGArathiBasin.Horde[2] = {
    Title = "Pegue quatro bases",
    Id = 8121,
    Level = 60,
    Attain = 60,
    Aim = "Mantenha quatro bases ao mesmo tempo na Bacia Arathi e depois retorne ao Deathmaster Dwire em Hammerfall.",
    Location = "Senhora da Morte Dwire (Planalto Arathi - Queda do Martelo "..yellow.."74,35"..white..")",
    Note = "Você precisa ser Amigável com Os Conspurcadores para pegar esta missão.",
}
kQuestInstanceData.BGArathiBasin.Horde[3] = {
    Title = "Pegue cinco bases",
    Id = 8122,
    Level = 60,
    Attain = 60,
    Aim = "Mantenha cinco bases na Bacia Arathi ao mesmo tempo e depois retorne ao Deathmaster Dwire em Hammerfall.",
    Location = "Senhora da Morte Dwire (Planalto Arathi - Queda do Martelo "..yellow.."74,35"..white..")",
    Note = "Você precisa ser Exaltado com Os Conspurcadores para pegar esta missão.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 20131 }, --Battle Tabard of the Defilers Tabard
    }
}

--------------- Warsong Gulch ---------------
kQuestInstanceData.BGWarsongGulch = {
    Story = "Aninhado na região sul da floresta de Freixo Cinzento, a Ravina Brado Guerreiro fica perto da área onde Grom Grito Infernal e seus Orcs cortaram enormes faixas de floresta durante os eventos da Terceira Guerra. Alguns orcs permaneceram nas proximidades, continuando seu desmatamento para alimentar a expansão da Horda. Eles se chamam os Mensageiros Brado Guerreiro.\nOs Elfos Noturnos, que começaram um impulso massivo para retomar as florestas de Freixo Cinzento, agora estão concentrando sua atenção em livrar sua terra dos Mensageiros de uma vez por todas. E assim, as Sentinelas Asa de Prata responderam ao chamado e juraram que não descansarão até que cada último Orc seja derrotado e expulso da Ravina Brado Guerreiro. ",
    Caption = "Ravina Brado Guerreiro",
    Alliance = {},
    Horde = {}
}

--------------- The Crescent Grove ---------------
kQuestInstanceData.TheCrescentGrove = {
    Story = "Um bosque escondido no sul de Freixo Cinzento com vista para o Lago Mystral que já foi um retiro para druidas por vários anos, uma presença maligna criou raízes na região.\nOriginalmente um bosque escondido que serviu como um retiro calmo para druidas, em tempos recentes a tribo Groveweald se mudou para cá enquanto fugia da loucura da tribo Foulweald, expulsando vários dos habitantes originais no processo. No entanto, apesar de suas tentativas de escapar da loucura, eles sucumbiram a ela com o tempo.\nKalanar Brightshine viveu aqui uma vez, antes de ser expulso do Bosque pelos furbolgs Groveweald e sua casa foi queimada.\nForças demoníacas da Legião Ardente lideradas pelo guarda da perdição Mestre Raxxieth se estabeleceram dentro do bosque, começando a corromper a clareira. Já, a Legião deixou sua marca na forma da Cicatriz Vilethorn, perturbando o equilíbrio e incomodando espíritos.",
    Caption = "The Bosque Crescente",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheCrescentGrove.Alliance[1] = {
    Title = "O Groveweald desenfreado",
    Id = 40089,
    Level = 33,
    Attain = 26,
    Aim = "Aventure-se no Bosque Crescente e colete 8 Insígnias de Groveweald dos pelursos lá dentro para Grol, o Exilado.",
    Location = "Grol, o Exilado (Vale Gris "..yellow.."56,59"..white..")",
    Note = "Dropa de furbolgs.",
}
kQuestInstanceData.TheCrescentGrove.Alliance[2] = {
    Title = "Os Anciãos Insensatos",
    Id = 40090,
    Level = 34,
    Attain = 26,
    Aim = "Traga as patas do Ancião 'One Eye' e do Ancião Blackmaw de dentro do Bosque Crescente para Grol, o Exilado.",
    Location = "Grol, o Exilado (Vale Gris "..yellow.."56,59"..white..")",
    Note = "Dropa de furbolgs perto do primeiro chefe.",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60179 }, --Grol's Band Ring
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[3] = {
    Title = "O Bosque Crescente",
    Id = 40091,
    Level = 37,
    Attain = 28,
    Aim = "Destrua a fonte de corrupção dentro de Crescent Grove e retorne para Denatharion em Teldrassil.",
    Location = "Denatharion <Druid Trainer> (Teldrassil - Darnassus "..yellow.."24,48"..white..")",
    Note = "Você precisa matar o último chefe.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60180 }, --Sentinel Chain Chest, Mail
        { id = 60181 }, --Groveweave Cloak Back
        { id = 60182 }, --Epaulets of Forest Wisdom Shoulder, Cloth
        { id = 60183 }, --Bushstalker Mask Head, Leather
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[4] = {
    Title = "Marreta de Kalanar",
    Id = 40326,
    Level = 33,
    Attain = 25,
    Aim = "Viaje para Crescent Grove e encontre a casa incendiada de Kalanar Brightshine. Em seguida, recupere o Marreta de Kalanar e devolva-o para ele em Astranaar.",
    Location = "Kalanar Brilhaluz (Vale Gris "..yellow.."36,52"..white..")",
    Note = "Contido na 'Caixa Forte de Kalanar'"..yellow.." [a]",
}
kQuestInstanceData.TheCrescentGrove.Horde[1] = kQuestInstanceData.TheCrescentGrove.Alliance[1]
kQuestInstanceData.TheCrescentGrove.Horde[2] = kQuestInstanceData.TheCrescentGrove.Alliance[2]
kQuestInstanceData.TheCrescentGrove.Horde[3] = {
    Title = "Enraizando o Mal",
    Id = 40147,
    Level = 37,
    Attain = 26,
    Aim = "Aventure-se em Crescent Grove e elimine o mal que existe dentro dele.",
    Location = "Loruk Andarilho da Mata (Vale Gris - Posto Splintertree "..yellow.."73,59"..white..")",
    Note = "A Sequência de Missões começa com Loruk Andarilho da Mata também. Você precisa matar o último chefe.",
    Prequest = "Mistérios do Bosque -> Relatório de Feran",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60213 }, --Outrider Chain Chest, Mail
        { id = 60214 }, --Strongwind Cloak Back
        { id = 60215 }, --Foreststrider Spaulders Shoulder, Leather
        { id = 60216 }, --Hat of Forest Medicine Head, Cloth
    }
}

--------------- Karazhan Crypt ---------------
kQuestInstanceData.KarazhanCrypt = {
    Story = "A Cripta de Karazhan é uma instância de masmorra localizada em Passo Ventobravo. Algo está torcendo os mortos de volta à vida nas criptas desoladas, encontre a fonte para que os mortos possam descansar novamente.",
    Caption = "Cripta de Karazhan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.KarazhanCrypt.Alliance[1] = {
    Title = "O Mistério de Karazhan VII",
    Id = 40317,
    Level = 60,
    Attain = 58,
    Aim = "Aventure-se nas criptas de Karazhan e, uma vez lá dentro, mate Alarus, o observador das criptas do Magus Ariden Dusktower em Deadwind Pass.",
    Location = "Torre do Crepúsculo do Mago Ariden (Trilha do Vento Morto "..yellow.."52,34"..white..")",
    Note = "Chave do Cripto de Karazhan da missão (O Névoaério de Karazhan VI). Você pode encontrar Alarus em [5].",
    Prequest = "O Mistério de Karazhan I >> O Mistério de Karazhan VI",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60463 }, --Arcane Charged Pendant Neck
        { id = 60464 }, --Orb of Kaladoon Trinket
        { id = 60465 }, --Arcane Strengthened Band Ring
    }
}
kQuestInstanceData.KarazhanCrypt.Alliance[2] = {
    Title = "Nenhuma honra entre os chefs",
    Id = 41374,
    Level = 61,
    Attain = 60,
    Aim = "Mate os Strigoi Vorazes nas Criptas de Karazhan e retorne ao Cozinheiro nos Salões Inferiores de Karazhan.",
    Location = "O Cozinheiro perto de ("..yellow.."[Salões Inferiores de Karazhan - e]"..white..")",
    Note = "Dropa de [Strigoi Voraz].\nA sequência de missões começa [Receitas de Kezan] pegue em "..yellow.."[Torre de Karazhan]"..white..".",
    Prequest = "Majestade de um Chef",
    Rewards = {
        Text = "Recompensa: ",
        { id = 92045 }, --Recipe: Empowering Herbal Salad Pattern
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[1] = {
    Title = "As Profundezas de Karazhan VII",
    Id = 40310,
    Level = 60,
    Attain = 58,
    Aim = "Aventure-se nas criptas de Karazhan e, uma vez lá dentro, mate Alarus, o observador das criptas de Kor'gan em Stonard.",
    Location = "Kor'gan (Pântano das Mágoas "..yellow.."44,55"..white..")",
    Note = "Chave do Cripto de Karazhan da missão (As profundezas de Karazhan VI). Você pode encontrar Alarus em [5].",
    Prequest = "As Profundezas de Karazhan I >> As Profundezas de Karazhan VI",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60459 }, --Charged Arcane Ring Ring
        { id = 60460 }, --Tusk of Gardon Neck
        { id = 60461 }, --Blackfire Orb Trinket
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[2] = kQuestInstanceData.KarazhanCrypt.Alliance[2]

--------------- Caverns Of Time: The Black Morass ---------------
kQuestInstanceData.CavernsOfTimeBlackMorass = {
    Story = "Nas Cavernas do Tempo, em Tanaris, o Portal das Trevas reencena a história de sua primeira abertura. Os Dragões de Bronze, guardiões do tempo, precisam de sua ajuda para manter a estabilidade da linha do tempo e esmagar a conspiração dos caídos.",
    Caption = "Caverns Of Time: Lamaçal Negro",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[1] = {
    Title = "A primeira abertura do Portal Negro",
    Id = 80605,
    Level = 60,
    Attain = 60,
    Aim = "Entre nos Caminhos do Tempo no passado de Black Morass e mate Antnormi. Traga a cabeça dela para Kheyna.",
    Location = "Crona (Tanaris - Cavernas do Tempo "..yellow.."57,59"..white..")",
    Note = "Sequência de missões começa com Lizzarik <Comerciante de Armas> (Sertões - patrulha da Encruzilhada até Vila Catraca "..yellow.."57,37"..white.."). Dropa de [4].",
    Prequest = "Uma Oportunidade Brilhante > Um Bom Ato Sangrento > Uma Carta de um Amigo >> Uma Jornada nas Cavernas",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 82950 }, --X-51 Arcane Ocular Implants Head, Cloth
        { id = 82951 }, --X-52 Stealth Ocular Implants Head, Leather
        { id = 82952 }, --X-53 Ranger Ocular Implants Head, Mail
        { id = 82953 }, --X-54 Guardian Ocular Implants Head, Plate
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[2] = {
    Title = "A Traição de Bronze",
    Id = 40342,
    Level = 60,
    Attain = 58,
    Aim = "Mate Chronar e leve sua cabeça para Tyvadrius nas Cavernas do Tempo.",
    Location = "Tyvadrius (Tanaris - Cavernas do Tempo "..yellow.."59,60"..white..")",
    Note = "Você precisa matar o primeiro chefe.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60497 }, --Pendant of Tyvadrius Neck
        { id = 60498 }, --Halberd of the Bronze Defender Polearm
        { id = 60499 }, --Ring of Tyvadrius Ring
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[3] = {
    Title = "Areia Corrompida",
    Id = 40340,
    Level = 60,
    Attain = 58,
    Aim = "Colete uma Areia Corrompida para Dronormu nas Cavernas do Tempo.",
    Location = "Dronormu (Tanaris - Cavernas do Tempo "..yellow.."63,58"..white..")",
    Note = "Dropa de criaturas e chefes.",
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[4] = {
    Title = "Areia a granel",
    Id = 40341,
    Level = 60,
    Attain = 58,
    Aim = "Colete 10 Areias Corrompidas para Dronormu nas Cavernas do Tempo.",
    Location = "Dronormu (Tanaris - Cavernas do Tempo "..yellow.."63,58"..white..")",
    Note = "Dropa de criaturas e chefes.",
}
for i = 1, 4 do
    kQuestInstanceData.CavernsOfTimeBlackMorass.Horde[i] = kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[i]
end

--------------- Hateforge Quarry ---------------
kQuestInstanceData.HateforgeQuarry = {
    Story = "A Pedreira Forja do Ódio é uma instância de masmorra localizada nas Estepes Ardentes. Escondida nas paredes sudeste das Estepes Ardentes, a Pedreira Forja do Ódio é o mais novo esforço dos anões Ferro Negro para encontrar uma nova arma para usar contra seus adversários. A pedreira de aparência inocente esconde uma caverna insidiosa, onde os anões Forja das Sombras tramam novos esquemas contra todos aqueles que se opõem a eles.",
    Caption = "Pedreira Forja do Ódio",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.HateforgeQuarry.Alliance[1] = {
    Title = "Presença rival",
    Id = 40458,
    Level = 54,
    Attain = 47,
    Aim = "Descubra o que está sendo desenterrado na Pedreira Hateforge.",
    Location = "Feitor Mão-de-graxa <A Irmandade do Tório> (Garganta Abrasadora - O Ponto de Tório "..yellow.."38.1,27.0"..white..").",
    Note = "Criaturas Químico da Forja do Ódio dropam Frasco Cheio de Breu Forja do Ódio para a missão.",
}
kQuestInstanceData.HateforgeQuarry.Alliance[2] = {
    Title = "Motim II do Sindicato dos Mineiros",
    Id = 40468,
    Level = 50,
    Attain = 45,
    Aim = "Mate 20 Mineiros da Forja do Ódio na Pedreira da Forja do Ódio e volte para Morgrim Lúcio de Fogo no Passo da Rocha Negra, nas Estepes Ardentes.",
    Location = "Morgrim Luciflama (Estepes Ardentes - Passagem Rocha Negra "..yellow.."75.6,68.3"..white..").",
    Note = "Sequência de missões começa com Radgan Chama Profunda com a missão 'Ganhando a confiança de Orvak' (Estepes Ardentes - Passagem Rocha Negra "..yellow.."76.1,67.6"..white..").",
    Prequest = "Ganhando a confiança de Orvak -> Ouvindo a história de Orvak -> O esconderijo Sternrock -> Motim do Sindicato dos Mineiros",
    Rewards = {
        Text = "Recompensa: ",
        { id = 60673 }, --Cuffs of Justice Wrist, Plate
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[3] = {
    Title = "O Verdadeiro Alto Capataz",
    Id = 40463,
    Level = 51,
    Attain = 45,
    Aim = "Mate Bargul Martelo Negro e recupere as Ordens do Senado para Orvak Sternrock na Passagem da Rocha Negra, nas Estepes Ardentes.",
    Location = "Orvak Sternrock (Estepes Ardentes - Passagem Rocha Negra "..yellow.."75.9,68.2"..white..").",
    Note = "Sequência de missões começa com Radgan Chama Profunda com a missão 'Ganhando a confiança de Orvak' (Estepes Ardentes - Passagem Rocha Negra "..yellow.."76.1,67.6"..white..").\nMate Bargul Martelo Negro e pegue Ordens do Senado na mesa ao lado do chefe.",
    Prequest = "Ganhando a confiança de Orvak -> Ouvindo a história de Orvak -> O esconderijo Sternrock",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60665 }, --Deepblaze Signet Ring
        { id = 60666 }, --Sternrock Trudgers Feet, Leather
        { id = 60667 }, --Firepike's Lucky Trousers Legs, Cloth
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[4] = {
    Title = "Sangue Brilhante",
    Id = 41361,
    Level = 50,
    Attain = 50,
    Aim = "Encontre alguém para lhe ensinar sobre a pedra preciosa escaldante.",
    Location = "Fragmento de Luz Trêmula (Pedreira Forja do Ódio"..yellow.."[74, 73]"..white..").",
    Note = red.."(Apenas Joalheria)"..white.." Encontre 'Fragmento de Luz Trêmula' e pegue a missão.\nVocê receberá a recompensa ao terminar a última missão da sequência.",
    Folgequest = "Maestria de Trovãoforja",
    Rewards = {
        Text = "Recompensa: All",
        { id = 61818 }, --Gorgeous Mountain Gemstone Enchant
        { id = 70209 }, --Plans: Gorgeous Mountain Gemstone Pattern
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[5] = {
    Title = "Rumores sobre a cerveja Hateforge",
    Id = 40490,
    Level = 54,
    Attain = 45,
    Aim = "Mergulhe na Pedreira de Hateforge e recupere um Frasco de Ferro Negro e os Documentos Químicos de Hateforge, depois volte para Varlag Barbado Crepúsculo na Vigília de Morgan, nas Estepes Ardentes.",
    Location = "Varlag Sombrabarba (Estepes Ardentes - Vigília de Morgan "..yellow.."85.1,67.6"..white..").",
    Note = "Criaturas Químico da Forja do Ódio dropam Frasco de Ferro Sombrio para a missão, Documentos de Química Forja do Ódio está na caixa"..yellow.."[a]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 2686 }, --Thunder Ale Drinkable
        { id = 60699 }, --Varlag's Clutches Hands, Leather
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[6] = {
    Title = "Atacar Hateforge",
    Id = 40489,
    Level = 57,
    Attain = 45,
    Aim = "Aventure-se na Pedreira Hateforge e remova a presença do Martelo do Crepúsculo de dentro, quando concluído, retorne ao Rei Magni Bronzebeard em Ironforge.",
    Location = "Senador Granitebelt (Estepes Ardentes - Vigília de Morgan "..yellow.."85.2,67.9"..white..").",
    Note = "Mate o último chefe Har'gesh Invocador da Perdição "..yellow.."[5]"..white..".\nSequência de missões começa com a missão 'Investigando Hateforge' no mesmo doador de missões.",
    Prequest = "Investigando Hateforge -> O Relatório Hateforge -> A resposta do rei",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60694 }, --Crown of Grobi Head, Mail
        { id = 60695 }, --Sigil of Heritage Ring
        { id = 60696 }, --Rubyheart Mallet One-Hand, Mace
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[7] = {
    Title = "Por que não ambos?",
    Id = 41142,
    Level = 50,
    Attain = 40,
    Aim = "Obtenha o Coração de Deslizamento de Terra das profundezas de Maraudon e a Essência de Corrosão da Pedreira Forja do Ódio para Frig Forja do Trovão em Pico Ninho da Águia",
    Location = "Frig Thunderforge (Hinterlands - Ninho da Águia "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Corrosão está em "..yellow.."[3]"..white..".",
    Prequest = "Provando um ponto -> Eu li isso em um livro uma vez",
    Folgequest = "Maestria de Trovãoforja",
    Rewards = {
        Text = "Recompensa: ",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
for i = 1, 4 do
    kQuestInstanceData.HateforgeQuarry.Horde[i] = kQuestInstanceData.HateforgeQuarry.Alliance[i]
end
kQuestInstanceData.HateforgeQuarry.Horde[5] = {
    Title = "Engenheiro de Caça Figgles",
    Id = 40539,
    Level = 55,
    Attain = 48,
    Location = "Senhora Katalla (Estepes Ardentes - Fortaleza Karfang "..yellow.."89.4,24.5"..white.." canto nordeste das Estepes Ardentes).",
    Note = "Mate Engenheiro Figgles "..yellow.."[2]"..white.." na Pedreira Forja do Ódio para Worg Senhora Katalla.",
    Prequest = "Peculiar nem vai funcionar",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60771 }, --Pyrehand Gloves Hands, Cloth
        { id = 60772 }, --Fur of Navakesh Back
        { id = 60773 }, --Blackrock Authority One-Hand, Mace
        { id = 60774 }, --Girdle of Galron Waist, Mail
    }
}
kQuestInstanceData.HateforgeQuarry.Horde[6] = {
    Title = "Do novo e do antigo IV",
    Id = 40504,
    Level = 57,
    Attain = 45,
    Aim = "Aventure-se na Pedreira Hateforge e remova a presença do Martelo do Crepúsculo em Karfang no Forte Karfang.",
    Location = "Karfang (Estepes Ardentes - Fortaleza Karfang "..yellow.."90.1,22.5"..white.." canto nordeste das Estepes Ardentes).",
    Note = "Mate o último chefe Har'gesh Invocador da Perdição "..yellow.."[5]"..white..".\nSequência de missões começa com Conselheiro Vargek (Estepes Ardentes - Fortaleza Karfang "..yellow.."90.0,22.7"..white.." canto nordeste das Estepes Ardentes) com a missão 'Do novo e do velho'.",
    Prequest = "Do novo e do velho -> Do novo e do velho II -> Do novo e do antigo III",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60734 }, --Blade of the Warleader Main Hand, Sword
        { id = 60735 }, --Obsidian Gem Choker Neck
        { id = 60736 }, --Battlemaster Helm Head, Plate
    }
}

--------------- Stormwind Vault ---------------
kQuestInstanceData.StormwindVault = {
    Story = "O Cofre de Ventobravo é uma instância de masmorra localizada em Ventobravo. As runas de proteção do Cofre estão enfraquecendo enquanto os horrores dentro ameaçam Azeroth mais uma vez, você deve aventurar-se para baixo e parar esses demônios de uma vez por todas.",
    Caption = "Cofre de Ventobravo",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwindVault.Alliance[1] = {
    Title = "Recuperando Algemas do Vault",
    Id = 40426,
    Level = 63,
    Attain = 55,
    Aim = "Dentro do Cofre de Ventobravo, mate Construtos Rúnicos por 2 Algemas Rúnicas e devolva-os para Koli Steamheart.",
    Location = "Koli Coração a Vapor (Ventobravo "..yellow.."54,47"..white..")",
    Note = "Você precisa matar as criaturas Constructo Rúnico.",
}
kQuestInstanceData.StormwindVault.Alliance[2] = {
    Title = "Finalizando Arc'Tiras",
    Id = 40427,
    Level = 63,
    Attain = 55,
    Aim = "Aventure-se nas profundezas do Cofre de Ventobravo, encontre Arc'tiras e mate-o pelo bem de Ventobravo. Quando terminar, volte para Pepin Ainsworth.",
    Location = "Pepin Ainsworth (Ventobravo "..yellow.."54,47"..white..")",
    Note = "Você precisa matar o último chefe.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 60624 }, --Goldplated Royal Crossbow Crossbow
        { id = 60625 }, --Manoplas Douradas de Ventobravo Mãos, Placas
        { id = 60626 }, --Regal Goldthreaded Sash Waist, Cloth
    }
}
kQuestInstanceData.StormwindVault.Alliance[3] = {
    Title = "O inimigo estabelece",
    Id = 41357,
    Level = 62,
    Attain = 60,
    Aim = "Leve o Núcleo de Arc'Tiras de volta para Al'Dorel",
    Location = "Al'Dorel (Hibérnia "..yellow.."56,45"..white..")",
    Note = "Você precisa matar o último chefe.\nSequência de missões começa com Ametista Encantada dropada do chefe "..yellow.."Torre de Karazhan [2]"..white..".\nRecompensa da última missão da sequência.",
    Prequest = "Dormindo sob a neve",
    Folgequest = "Acordei ao nascer do sol",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 55133 }, --Claw of the Mageweaver Off Hand, Fist Weapon
        { id = 55134 }, --Rod of Permafrost Wand
        { id = 55135 }, --Shard of Leyflow Trinket
    }
}
kQuestInstanceData.StormwindVault.Alliance[4] = {
    Title = "O Tomo das Complexidades Arcanas e do Fenômeno Mágico IX",
    Id = 40425,
    Level = 63,
    Attain = 58,
    Aim = "Recupere o Tomo das Complexidades Arcanas e o Fenômeno Mágico IX para Mazen Mac'Nadir em Ventobravo.",
    Location = "Mazen Mac'nadir (Ventobravo "..yellow.."42,64"..white..")",
    Note = "Perto do chefe "..yellow.."[3]"..white..".",
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
    Title = "Guardião do portão",
    Id = 40107,
    Level = 60,
    Attain = 58,
    Aim = "Derrote Ostarius. Retorne ao Salão dos Exploradores e informe o Alto Explorador Magellas sobre os eventos que ocorreram no portão.",
    Location = "Pedestal de Uldum (Tanaris "..yellow.."37,81"..white..")",
    Note = "Missão prévia de Alto-explorador Magellas (Altaforja - Salão dos Exploradores "..yellow.."69.9,18.5"..white.."). Você precisa matar Ostarius.",
    Prequest = "Parceria Incomum -> Dono Original -> Portões de Uldum",
}
kQuestInstanceData.Ostarius.Horde[1] = {
    Title = "Guardião do Portão",
    Id = 40115,
    Level = 60,
    Attain = 58,
    Aim = "Derrote Ostarius. Retorne ao Penhasco Trovão e informe Sage Truthseeker sobre os eventos que ocorreram no portão.",
    Location = "Pedestal de Uldum (Tanaris "..yellow.."37,81"..white..")",
    Note = "Missão prévia de Sábio Devoto da Verdade (Penhasco do Trovão "..yellow.."34,47"..white.."). Você precisa matar Ostarius.",
    Prequest = "O Lobo Solitário -> Cicatrizes do Passado -> Uldum Aguarda",
}

--------------- Gilneas City ---------------
kQuestInstanceData.GilneasCity = {
    Story = "A Cidade de Gilneas é uma instância de masmorra localizada em Gilneas. Localizada no coração desta terra outrora isolada, a Cidade de Gilneas já foi um bastião de esperança para seu povo. Estabelecida após se libertar do governo dos senhores Arathorian, ela se ergueu como um símbolo de resiliência e prosperidade. No entanto, agora é apenas uma casca de sua antiga beleza, com uma presença sombria lançando uma sombra dominante sobre Gilneas e servindo como um lembrete de seu passado glorioso. Uivos distantes ecoam pela cidade, lembretes assombrosos de seus novos ocupantes. No entanto, há uma possibilidade de que nem todos tenham ido embora e que seu rei amaldiçoado ainda possa viver.",
    Caption = "Cidade de Gilneas",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.GilneasCity.Alliance[1] = {
    Title = "O Juiz e o Fantasma",
    Id = 40975,
    Level = 46,
    Attain = 35,
    Aim = "Mate o juiz Sutherland na cidade de Gilneas para o Fantasma Irritado no Glaymore Stead em Gilneas.",
    Location = "Fantasma Irritado (Gilneas -Assentamento de Glaymore "..yellow.."52.9,27.9"..white..")",
    Note = "Você pode encontrar Fantasma Irritado dentro do prédio na montanha. Entrando pelos portões de Gilneas, siga a montanha à sua esquerda (leste), passando por um campo com moinhos de vento você encontrará um caminho para o mar, quase na borda vire ao norte siga o caminho (mal perceptível).",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61620 }, --Glaymore Family Breastplate Chest, Mail
        { id = 61621 }, --Ceremonial Gilnean Pike Polearm
        { id = 61622 }, --Glaymore Shawl Back
    }
}
kQuestInstanceData.GilneasCity.Alliance[2] = {
    Title = "Atrás da parede",
    Id = 40841,
    Level = 41,
    Attain = 36,
    Aim = "Aventure-se na cidade de Guilnéas e recupere os planos de Dawnstone para Therum Deepforge em Ventobravo.",
    Location = "Therum Baixaforja <Ferreiro Especialista> (Ventobravo - Distrito Anão"..yellow.."63.3,37"..white..", pode estar andando por lá)",
    Note = "os Planos de Pedra da Aurora no prédio "..yellow.."[a]"..white.." na caixa.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61348 }, --Inlaid Plate Boots Feet, Plate
        { id = 61349 }, --Dwarven Battle Bludgeon Main Hand, Mace
    }
}
kQuestInstanceData.GilneasCity.Alliance[3] = {
    Title = "A escritura de Vila dos Corvos",
    Id = 40966,
    Level = 45,
    Attain = 38,
    Aim = "Encontre a Escritura de Vila dos Corvos na cidade de Guilnéas e leve-a de volta para Caliban Silverlaine.",
    Location = "Barão Caliban Silverlaine (Gilneas - Ravenshire (main building) "..yellow.."58.4,67.8"..white..")",
    Note = "a Escritura de Vila dos Corvos na mesa atrás de Senhora-Regente Celia Harlow e Lorde-Regente Mortimer Harlow, ao lado do Baú da Família Harlow"..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61601 }, --Ebonmere Axe One-Hand, Axe
        { id = 61602 }, --Gilneas Brigade Helmet Head, Plate
        { id = 61603 }, --Robes of Ravenshire Chest, Cloth
        { id = 61604 }, --Greyshire Pauldrons Shoulder, Leather
    }
}
kQuestInstanceData.GilneasCity.Alliance[4] = {
    Title = "A ambição de Ravencroft",
    Id = 41112,
    Level = 45,
    Attain = 40,
    Aim = "Recupere o Livro de Ur: Volume Dois da biblioteca em Gilneas City e retorne para Ethan Ravencroft.",
    Location = "Ethan Ravencroft (Gilneas - Cemitério Teia Oca - Cripta(canto sudoeste de Gilneas, leste do rio)"..yellow.."33,76"..white..")",
    Note = "o Livro de Ur no prédio "..yellow.."[b]"..white..", vá para a direita, na mesa (lado sul).",
}
kQuestInstanceData.GilneasCity.Alliance[5] = {
    Title = "Desfazendo a Presença Dracônica",
    Id = 40943,
    Level = 47,
    Attain = 35,
    Aim = "Acabe com a influência dracônica sobre Guilnéas matando a regente-senhora Celia Harlow e o regente-lorde Mortimer Harlow para Magus Orelius em Vila dos Corvos, em Gilnéas.",
    Location = "Mago Orelius <Kirin Tor> (Gilneas - Ravenshire (main building) "..yellow.."57.7,68.5"..white..")",
    Note = "Traga 1 Fragmento Brilhante Grande, você precisará de 1 para a missão prévia. encantadores os têm ou a casa de leilões pode ajudar. deve ser barato.",
    Prequest = "Fonte dos Arcanos -> Presença Mágica -> Presença Dracônica?",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61486 }, --Violet Sash Waist, Cloth
        { id = 61487 }, --Gauntlets of Insight Hands, Mail
    }
}
kQuestInstanceData.GilneasCity.Alliance[6] = {
    Title = "A Queda e Ascensão de Greymane",
    Id = 40956,
    Level = 42,
    Attain = 35,
    Aim = "Salve 'Genn e recupere a Coroa Greymane para Lord Darius Ravenwood em Vila dos Corvos em Gilneas.",
    Location = "Lorde Darius Ravenwood (Gilneas - Ravenshire (main building) "..yellow.."58.4,67.6"..white..")",
    Note = "Sequência de missões começa com a missão 'Lobo Entre Ovelhas' em Barão Caliban Vilver (Gilneas - Vila dos Corvos (prédio principal) "..yellow.."58.4,67.8"..white..")\nA Coroa Greymane dropa de Genn Greymane "..yellow.."[8]"..white..", último chefe no topo da torre.",
    Prequest = "Lobo entre ovelhas -> Uma corrente de cada vez -> Na trilha da lenda -> De volta a Vila dos Corvos -> Luz fraca na escuridão -> O mais vil dos homens -> Um acordo encruzilhada -> Assaltando a Fortaleza Freyshear",
    Rewards = {
        Text = "Recompensa: 1 ou 2 ou 3 e 4",
        { id = 61497 }, --Ravenwood Belt Waist, Mail
        { id = 61498 }, --Signet of Gilneas Ring
        { id = 61499 }, --Ravenshire Gloves Hands, Leather
        { id = 61369 }, --Ravenshire Tabard Tabard
    }
}
kQuestInstanceData.GilneasCity.Alliance[7] = {
    Title = "Manuscrito sobre Hidromancia II",
    Id = 41114,
    Level = 45,
    Attain = 38,
    Aim = "Recupere o Manuscrito sobre Hidromancia II para Magus Hallister na Ilha Theramore em Dustwallow Marsh.",
    Location = "Magus Hallister (Pântano Vadeoso - Theramore, central Tower)",
    Note = red.."(Apenas Mago)"..white.." Missão de teleporte de Mago para Theramore.\no Manuscrito sobre Hidromancia II no prédio "..yellow.."[b]"..white..", vá para a direita, na cômoda (lado sul).",
    Prequest = "Sigilo Demoníaco de Mannoroc",
    Rewards = {
        Text = "Recompensa: ",
        { id = 92001 }, --Tome of Teleportation: Theramore Spell
    }
}
kQuestInstanceData.GilneasCity.Alliance[8] = {
    Title = "Deixado de má fé",
    Id = 41285,
    Level = 44,
    Attain = 40,
    Aim = "Retorne com o colar do aventureiro para Talvash del Kissel em Altaforja.",
    Location = "Didiê Du Mocó (Altaforja - A Ala Mística "..yellow.."36,3"..white..").",
    Note = red.."(Joalheiro: Apenas Ourives)"..white.." Missão prévia de Mayva Togview (Altaforja - Salão dos Exploradores "..yellow.."60,24"..white.."). \nDustivan Pelenegra "..yellow.."[4]"..white.." dropa o Colar de Citrino Enferrujado",
    Prequest = "Dominando a Ourivesaria",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Alliance[9] = {
    Title = "Sangue de Vorgendor",
    Id = 41378,
    Level = 60,
    Attain = 60,
    Aim = "Colete sangue de worgen para Fandral Staghelm. Ele exige amostras de sangue de Karazhan, Gilneas City e Shadowfang Keep.",
    Location = "Arquidruida Fandral Guenelmo (Darnassus - Enclave Cenariano "..yellow.."35,9"..white..").",
    Note = "[Sangue de Pelescuras] dropa de Worgens."..white.."\n[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Foice da Deusa",
    Folgequest = "Sangue de lobo",
}
kQuestInstanceData.GilneasCity.Alliance[10] = {
    Title = "Gilnean Pricolich",
    Id = 41385,
    Level = 60,
    Attain = 60,
    Aim = "Aventure-se na cidade de Guilnéas e procure o paradeiro do segundo Pricolich.",
    Note = "[Diário de Celia] colocado perto de "..yellow.."[7]"..white.."\n[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Bosquenereo II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Pricolich Gnarlmoon",
    Folgequest = "Pricolich Lycan",
}
kQuestInstanceData.GilneasCity.Horde[1] = kQuestInstanceData.GilneasCity.Alliance[1]
kQuestInstanceData.GilneasCity.Horde[2] = {
    Title = "Assuntos Ebonmere",
    Id = 40979,
    Level = 45,
    Attain = 35,
    Aim = "Mate Dustivan Blackcowl e recupere a Escritura de Ébano para Joshua Ebonmere na Fazenda Ebonmere em Guilnéas.",
    Location = "Josué Ebonmere (Gilneas - Fazenda Ebonmere "..yellow.."[49.5,31.1]"..white.."). Entrando pelos portões de Gilneas, siga a montanha à sua esquerda (leste), no campo com moinhos de vento você encontrará Josué Ebonmere.",
    Note = "Missão prévia 'Infestação de morcegos Ebonmere' e 'Infestação de Worgen de Ébano'.\nDustivan Pelenegra "..yellow.."[4]"..white.." dropa a Escritura de Ebonmere",
    Prequest = "Infestação de morcegos Ebonmere -> Infestação de Worgen de Ébano",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61627 }, --Ebonmere Reaver One-Hand, Axe
        { id = 61628 }, --Clutch of Joshua Waist, Cloth
        { id = 61629 }, --Farmer's Musket Gun
        { id = 61630 }, --Ebonmere Vambracers Wrist, Plate
    }
}
kQuestInstanceData.GilneasCity.Horde[3] = {
    Title = "Um assalto real",
    Id = 41113,
    Level = 45,
    Attain = 40,
    Aim = "Roube a pintura da biblioteca em Gilneas City e retorne para Luke Agamand no Blackthorn's Camp em Gilneas.",
    Location = "Lucas Agamand (Gilneas - Acampamento de Aguilhanegra "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "O retrato de Mia Greymane no prédio "..yellow.."[b]"..white..", vá para a esquerda, na parede (canto noroeste).",
}
kQuestInstanceData.GilneasCity.Horde[4] = {
    Title = "O mal me fez fazer isso",
    Id = 40881,
    Level = 46,
    Attain = 35,
    Aim = "Encontre 'Sobre os Poderes do Sangue' em Gilneas City e depois retorne para Orvan Darkeye nas Ruínas de Greyshire em Gilneas.",
    Location = "Orvan Olho Negro (Gilneas - ruínas de Greyshire "..yellow.."[31.3,47.0]"..white..")",
    Note = red.."Sequência de missões começa com Sicária Alynna (Gilneas Igreja Stillward "..yellow.."[57.3,39.6]"..white..", dentro) com a missão 'Morto até escurecer'.\nLivro 'Sobre os Poderes do Sangue' na mesa atrás de Senhora-Regente Celia Harlow e Lorde-Regente Mortimer Harlow, ao lado do Baú da Família Harlow"..yellow.."[7]"..white..".\nVocê receberá a recompensa ao terminar a próxima missão.",
    Prequest = "Morto até escurecer -> Tudo que precisamos é de sangue -> O último dos mortos-vivos -> Nós tiramos isso dos vivos",
    Folgequest = "Sangue por Sangue",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61422 }, --Pure Bloodvial Pendant Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[5] = {
    Title = "Genn Greymane deve morrer!",
    Id = 40849,
    Level = 49,
    Attain = 40,
    Aim = "Entre na cidade de Gilneas e mate Genn Greymane, depois leve sua cabeça para Blackthorn no acampamento de Blackthorn em Gilneas.",
    Location = "Aguilhanegra (Gilneas - Acampamento de Aguilhanegra "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "2 Sequências de missões precisam ser terminadas para iniciar esta missão 'Reporte para Lucas Agamand' e 'Reporte para Lívia Braçoforte' em Aguilhanegra.\n",
    Prequest = "'Reporte para Luke Agamand' -> Assalto na Mina Dryrock -> Reporte para Lívia Braçoforte -> Encontro com o Infiltrador -> Tempo de qualidade com Blackthorn",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61353 }, --Blackthorn Gauntlets Hands, Leather
        { id = 61354 }, --Banshee's Tear Ring
        { id = 61355 }, --Dark Footpad Belt Waist, Mail
    }
}
kQuestInstanceData.GilneasCity.Horde[6] = {
    Title = "A Pedra Greymane",
    Id = 40996,
    Level = 47,
    Attain = 38,
    Aim = "Recupere o Fragmento da Meia-Noite para o Bispo Sombrio Mordren na Igreja Stillward.",
    Location = "Bispo Sombrio Mordren (Gilneas - Igreja Stillward "..yellow.."57.7,39.6"..white..")",
    Note = "Sequência de missões começa com a missão 'Através da Magia Maior' em Bispo Sombrio Mordren.\nFragmento da Meia-Noite está atrás do último chefe Genn Greymane "..yellow.."[8]"..white.."\nVocê receberá a recompensa ao terminar a próxima missão.",
    Prequest = "Através da Magia Maior -> O Cetro Ravenwood -> Os poderes além"..yellow.."[Currais Ázegos]"..white..".",
    Folgequest = "Presente do Bispo das Trevas",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[7] = {
    Title = "Conhecimento Estrangeiro",
    Id = 41289,
    Level = 44,
    Attain = 34,
    Aim = "Procure um livro adequado na cidade de Guilnéas e leve-o para Jarkal Mossmeld em Kargath, nas Terras Ermas.",
    Location = "Jarkal Limuno (Ermos - Kargath "..yellow.."2,46"..white..").",
    Note = red.."(Joalheiro: Apenas Ourives)"..white.." Missão prévia de Gulmire Fartower (Cidade Baixa - O Bairro dos Ladinos "..yellow.."77,76"..white.."). \n'Joias de Gilnean: Um Compêndio' (onde?) contém item.",
    Prequest = "Dominando a Ourivesaria",
    Rewards = {
        Text = "Recompensa: ",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Horde[8] = {
    Title = "O Lobo, a Velha e a Foice",
    Id = 41381,
    Level = 60,
    Attain = 60,
    Aim = "Colete sangue de worgen para Magatha Grimtotem. Ela exige amostras de sangue de Karazhan, Gilneas City e Shadowfang Keep.",
    Location = "Magatha Temível Totem (Penhasco do Trovão - O Elevado dos Anciãos "..yellow.."70,31"..white..").",
    Note = "[Sangue de Pelescuras] dropa de Worgens."..white.."\n[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Foice da Deusa",
    Folgequest = "Sangue de lobo",
}
kQuestInstanceData.GilneasCity.Horde[9] = {
    Title = "Gilnean Pricolich",
    Id = 41385,
    Level = 60,
    Attain = 60,
    Aim = "Aventure-se na cidade de Guilnéas e procure o paradeiro do segundo Pricolich.",
    Note = "[Diário de Celia] colocado perto de "..yellow.."[7]"..white.."\n[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Bosquenereo II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Pricolich Gnarlmoon",
    Folgequest = "Pricolich Lycan",
}

--------------- Lower Karazhan Halls ---------------
kQuestInstanceData.LowerKarazhan = {
    Story = "Os Salões Inferiores de Karazhan é uma instância de raide localizada em Passo Ventobravo. Karazhan, outrora a imponente fortaleza do antigo Guardião de Tirisfal, agora zumbe com energia mágica enquanto se empoleira no topo de uma poderosa linha ley. Seus corredores há muito esquecidos, cobertos de poeira, tornaram-se um refúgio para várias criaturas, embora pareça que nem todos os seus habitantes partiram voluntariamente. Nas profundezas dos salões inferiores, o leal castelão de Medivh, Moroes, permanece um guardião vigilante. Se você conseguir impressioná-lo, ele pode lhe conceder acesso aos andares superiores.",
    Caption = "Lower Karazhan Halls",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.LowerKarazhan.Alliance[1] = {
    Title = "Acomodações adequadas",
    Id = 41083,
    Level = 60,
    Attain = 55,
    Aim = "Encontre um travesseiro confortável para o vereador Kyleson em Karazhan.",
    Location = "Conselheiro Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "Você pode encontrar Travesseiro Confortável em "..yellow.."(b)"..white.." nas caixas.",
    Folgequest = "Uma bebida para dormir",
}
kQuestInstanceData.LowerKarazhan.Alliance[2] = {
    Title = "Uma bebida para dormir",
    Id = 41084,
    Level = 60,
    Attain = 55,
    Aim = "Fale com alguém que saiba como adquirir vinho para o vereador Kyleson.",
    Location = "Conselheiro Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "Entregue a missão para O Cozinheiro perto de "..yellow.."[Karazhan - e]"..white..".",
    Prequest = "Acomodações adequadas",
    Folgequest = "Vinho Espectral",
}
kQuestInstanceData.LowerKarazhan.Alliance[3] = {
    Title = "Vinho Espectral",
    Id = 41085,
    Level = 60,
    Attain = 55,
    Aim = "Reúna 3 Essências da Morte, 5 Frascos de Porto e um Cogumelo Fantasma para o Cozinheiro em Karazhan.",
    Location = "O Cozinheiro perto de ("..yellow.."[Salões Inferiores de Karazhan - e]"..white..")",
    Note = "Frasco de Porto vendido por vendedores de álcool. Todos os itens podem ser comprados na Casa de Leilões.",
    Prequest = "Uma bebida para dormir",
    Folgequest = "Vinho para Kyleson",
}
kQuestInstanceData.LowerKarazhan.Alliance[4] = {
    Title = "Vinho para Kyleson",
    Id = 41086,
    Level = 60,
    Attain = 55,
    Location = "O Cozinheiro perto de ("..yellow.."[Salões Inferiores de Karazhan - e]"..white..")",
    Note = "Entregue o Vinho Espectral para Conselheiro Kyleson "..yellow.."[Karazhan - c]"..white.." em Karazhan.",
    Prequest = "Vinho Espectral",
}
kQuestInstanceData.LowerKarazhan.Alliance[5] = {
    Title = "A chave para Karazhan I",
    Id = 40817,
    Level = 60,
    Attain = 58,
    Aim = "Ouça a história de Lord Ebonlocke.",
    Location = "Lorde Ebanez ("..yellow.."[Karazhan - d]"..white..")",
    Folgequest = "A chave para Karazhan II",
}
kQuestInstanceData.LowerKarazhan.Alliance[6] = {
    Title = "A chave para Karazhan II",
    Id = 40818,
    Level = 60,
    Attain = 58,
    Location = "Lorde Ebanez ("..yellow.."[Karazhan - d]"..white..")",
    Note = "Mate Moroes "..yellow.."[6]"..white.." e recupere a Chave das Câmaras Superiores. Moroes reside nos Salões Inferiores de Karazhan. Traga a chave de volta para Lorde Ebanez.",
    Prequest = "A chave para Karazhan I",
    Folgequest = "A chave para Karazhan III",
}
kQuestInstanceData.LowerKarazhan.Alliance[7] = {
    Title = "A chave para Karazhan III",
    Id = 40819,
    Level = 60,
    Attain = 58,
    Aim = "Encontre alguém do Kirin Tor que possa saber algo sobre Vandol. Dalaran pode ser um bom lugar para começar sua busca.",
    Location = "O Cozinheiro perto de ("..yellow.."[Salões Inferiores de Karazhan - e]"..white..")",
    Note = "Entregue a missão para Arquimago Ansirem Tecerrunas <Kirin Tor> (Montanhas de Alterac - Dalaran "..yellow.."[18.9,78.5]"..white..")",
    Prequest = "A chave para Karazhan II",
    Folgequest = "A chave para Karazhan IV",
}
kQuestInstanceData.LowerKarazhan.Alliance[8] = {
    Title = "Notas de culinária rabiscadas",
    Id = 40998,
    Level = 60,
    Attain = 55,
    Aim = "Encontre alguém que saiba algo sobre as Notas de Culinária Rabiscadas.",
    Location = "Notas de Culinária Rabiscadas",
    Note = "Entregue a missão para Duque Rothlen "..yellow.."[Karazhan - f]"..white.." na varanda ao lado de Senhor das Garras Howlfang "..yellow.."[4]"..white..".",
    Folgequest = "Achados e perdidos",
}
kQuestInstanceData.LowerKarazhan.Alliance[9] = {
    Title = "Achados e perdidos",
    Id = 40999,
    Level = 60,
    Attain = 55,
    Aim = "Recupere a Pulseira Dourada Gravada para o Duque Rothlen em Karazhan.",
    Location = "Duque Rothlen "..yellow.."[Karazhan - f]"..white..".",
    Note = "Você pode encontrar 'Pulseira Dourada Gravada' no baú em "..yellow.."[Karazhan - a]"..white..".",
    Prequest = "Notas de culinária rabiscadas",
    Folgequest = "Broche da Família Rothlen",
}
kQuestInstanceData.LowerKarazhan.Alliance[10] = {
    Title = "Broche da Família Rothlen",
    Id = 41000,
    Level = 60,
    Attain = 55,
    Aim = "Recupere o Broche da Família Rothlen de Stratholme para o Duque Rothlen em Karazhan.",
    Location = "Duque Rothlen (Karazhan "..yellow.."[Karazhan - f]"..white..")",
    Note = "Broche da Família Rothlen ao lado do chefe O Imperdoável "..yellow.."[4]"..white.." no baú em "..yellow.."[Stratholme]"..white..".",
    Prequest = "Achados e perdidos",
    Folgequest = "A receita secreta",
}
kQuestInstanceData.LowerKarazhan.Alliance[11] = {
    Title = "A receita secreta",
    Id = 41001,
    Level = 60,
    Attain = 55,
    Location = "Duque Rothlen (Karazhan "..yellow.."[Karazhan - f]"..white..")",
    Note = "Fale com 'O Cozinheiro' "..yellow.."[perto de e]"..white.." nos Salões Inferiores de Karazhan.",
    Prequest = "Broche da Família Rothlen",
    Folgequest = "O porteiro de Karazhan",
}
kQuestInstanceData.LowerKarazhan.Alliance[12] = {
    Title = "O porteiro de Karazhan",
    Id = 41002,
    Level = 60,
    Attain = 55,
    Aim = "Fale com o porteiro Montigue em Karazhan.",
    Location = "O Cozinheiro perto de ("..yellow.."[Salões Inferiores de Karazhan - e]"..white..")",
    Note = "Porteiro Montigue"..blue.." "..white.."no início da masmorra em frente às escadas.",
    Prequest = "A receita secreta",
    Folgequest = "Carga de Karazhan",
}
kQuestInstanceData.LowerKarazhan.Alliance[13] = {
    Title = "Carga de Karazhan",
    Id = 41003,
    Level = 60,
    Attain = 55,
    Aim = "Leve 10 Essências de Morte-Viva, 10 Essências Vivas e 25 de Ouro para o Porteiro Montique em Karazhan.",
    Location = "Porteiro Montigue"..blue.." "..white.."no início da masmorra em frente às escadas.",
    Note = "Todos podem ser comprados na Casa de Leilões. vivos 10-15 prata cada, mortos-vivos - 1-3 ouro cada.",
    Prequest = "O porteiro de Karazhan",
    Folgequest = "Le Fishe Au Chocolat",
}
kQuestInstanceData.LowerKarazhan.Alliance[14] = {
    Title = "Le Fishe Au Chocolat",
    Id = 41004,
    Level = 60,
    Attain = 55,
    Location = "Porteiro Montigue"..blue.." "..white.."no início da masmorra em frente às escadas.",
    Note = "Traga a Carga de Karazhan para O Cozinheiro perto de"..yellow.."[e]"..white.." nos Salões Inferiores de Karazhan.",
    Prequest = "Carga de Karazhan",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61666 }, --Recipe: Le Fishe Au Chocolat Pattern
        { id = 84040 }, --Le Fishe Au Chocolat Pattern
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[15] = {
    Title = "Foice da Deusa",
    Id = 41062,
    Level = 60,
    Attain = 60,
    Aim = "Mate Clawlord Howlfang e apresente-se a Lord Ebonlocke.",
    Location = "A Foice de Elune "..yellow.."[5]"..white..".",
    Note = red.."Apenas Mago, Sacerdote, Bruxo, Druida"..white..":\nSequência de missões começa com o item lendário 'A Foice de Elune' que dropa de Lorde Grisarbore II "..yellow.."[5]"..white.." (chance baixa).\nSequência de missões para pingente lendário.",
    Folgequest = "Foice da Deusa",
}
kQuestInstanceData.LowerKarazhan.Alliance[16] = {
    Title = "Contribuição para a Igreja",
    Id = 41078,
    Level = 60,
    Attain = 55,
    Aim = "Reúna 15 Essências Arcanas, 20 Pós de Ilusão e 10 Essências Eternas Maiores para o Heirofante Nerseus na igreja perto de Karazhan.",
    Location = "Hierofante Nerseus (Trilha do Vento Morto, em frente à igreja ao lado de Karazhan "..yellow.."[40.3,77.2]"..white..").",
    Note = "15x Essência Arcana - saque aleatório de lixo;\n20x Pó de Ilusão - Encantadores ou Casa de Leilões;\n10x Essência Eterna Maior - Encantadores ou Casa de Leilões;\nDepois de terminar esta missão você poderá pegar uma missão para encantamentos de cabeça/perna. Para cada um deles você precisará:\n 1x Energia Ley Sobrecargada - item raro aleatório de lixo/chefe em Karazhan;\n6x Essência Arcana - saque aleatório de lixo.",
    Folgequest = "Invocação de Estilhaçamento, Invocação de Proteção Maior, Invocação de Mente Expansiva, Invocação de Fortitude Arcana Maior",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 92005 }, --Invocation of Shattering Enchant
        { id = 92006 }, --Invocation of Greater Protection Enchant
        { id = 92007 }, --Invocation of Expansive Mind Enchant
        { id = 92008 }, --Invocation of Greater Arcane Fortitude Enchant
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[17] = {
    Title = "Vela Comicamente Grande",
    Id = 41344,
    Level = 61,
    Attain = 60,
    Aim = "Recupere a Vela Comicamente Grande de Grizikil e retorne para Big Whiskers em Upper Karazhan.",
    Location = "Porteiro Montigue"..blue.." "..white.."no início da masmorra em frente às escadas.",
    Note = red.."Apenas Mago"..white..": Grizikil "..yellow.."[3]"..white.." dropa 'Vela Comicamente Grande'.\nA sequência de missões começa com Bigodudo em "..yellow.."[Torre de Karazhan]"..white..".",
    Prequest = "Eu não sou nenhum rato",
    Rewards = {
        Text = "Recompensa: ",
        { id = 92025 }, --Tome of Polymorph: Rodent Spell
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[18] = {
    Title = "Sangue de Vorgendor",
    Id = 41381,
    Level = 60,
    Attain = 60,
    Aim = "Colete sangue de worgen para Fandral Staghelm. Ele exige amostras de sangue de Karazhan, Gilneas City e Shadowfang Keep.",
    Location = "Arquidruida Fandral Guenelmo (Darnassus - Enclave Cenariano "..yellow.."35,9"..white..").",
    Note = "[Sangue de Shadowbane] dropa de Worgens."..white.."\n[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Foice da Deusa",
    Folgequest = "Sangue de lobo",
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
        Aim = "Colete sangue de worgen para Fandral Staghelm. Ele exige amostras de sangue de Karazhan, Gilneas City e Shadowfang Keep.",
        Note = "Entregue a missão para Boanerges Stalactus (Cidade Baixa - O Bairro Mágico"..yellow.."[84.1,17.5]"..white..", zona de treinador de mago.)",
    }
)
kQuestInstanceData.LowerKarazhan.Horde[18] = createInheritedQuest(
    kQuestInstanceData.LowerKarazhan.Alliance[18],
    {
        Title = "O Lobo, a Velha e a Foice",
        Aim = "Colete sangue de worgen para Magatha Grimtotem. Ela exige amostras de sangue de Karazhan, Gilneas City e Shadowfang Keep.",
        Location = "Magatha Temível Totem (Penhasco do Trovão - O Elevado dos Anciãos "..yellow.."70,31"..white..").",
    }
)

--------------- Emerald Sanctum ---------------
kQuestInstanceData.EmeraldSanctum = {
    Story = "Santuário Esmeralda é uma instância de raide localizada em Hyjal. Uma névoa de corrupção desceu sobre o Sonho Esmeralda, torcendo a moral e as intenções até mesmo dos mais nobres e puros. O Despertador corrompido está se preparando para enviar uma chamada prematura de despertar; se não for parado, seus parentes se levantarão e sairão em um frenesi de fúria por Azeroth.",
    Caption = "Santuário Esmeralda",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.EmeraldSanctum.Alliance[1] = {
    Title = "Essência de Sonho Fumegante",
    Id = 40905,
    Level = 60,
    Attain = 55,
    Aim = "Leve a Essência dos Sonhos Fumegantes para o Arquidruida Vento Sonho em Nordanaar, Hyjal.",
    Location = "Essência do Sonho Fumegante [2]",
    Note = red.."Apenas Druida"..white..": Arquidruida Brisasonho está em (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Apenas uma pessoa na raide pode saquear este item e a missão só pode ser feita uma vez.\n\nAs recompensas listadas são para a sequência.",
    Folgequest = "Essência de Sonho Purificada",
    Rewards = {
        Text = "Recompensa: ",
        { id = 61445 }, --Purified Emerald Essence Pattern
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[2] = {
    Title = "Chefe de Solnius",
    Id = 40963,
    Level = 60,
    Attain = 58,
    Aim = "Leve a Cabeça de Solnius para Ralathius em Nordanaar, em Hyjal.",
    Location = "Cabeça de Solnius [2]",
    Note = "Ralathius está em (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Apenas uma pessoa na raide pode saquear este item e a missão só pode ser feita uma vez.",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 61195 }, --Ring of Nordrassil Ring
        { id = 61194 }, --The Heart of Dreams Neck
        { id = 61193 }, --Verdant Eye Necklace Trinket
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[3] = {
    Title = "A Garra de Erennius",
    Id = 41038,
    Level = 60,
    Attain = 55,
    Aim = "Leve a Garra de Erennius para alguém que possa considerá-la útil.",
    Location = "Garra de Erennius [1]",
    Note = "Ralathius está em (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Apenas uma pessoa na raide pode saquear este item e a missão só pode ser feita uma vez.",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
    Story = "Torre de Karazhan é uma instância de raide localizada em Passo Ventobravo. Karazhan, outrora a imponente fortaleza do antigo Guardião de Tirisfal, agora zumbe com energia mágica enquanto se empoleira no topo de uma poderosa linha ley. Seus corredores há muito esquecidos, cobertos de poeira, tornaram-se um refúgio para várias criaturas, embora pareça que nem todos os seus habitantes partiram voluntariamente.",
    Caption = "Torre de Karazhan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TowerofKarazhan.Alliance[1] = {
    Title = "O Cetro de Medivh",
    Id = 41369,
    Level = 60,
    Attain = 60,
    Aim = "Para restaurar o Cetro de Medivh, Anelace, o Clarividente da Conspiração de Morgan em Passagem do Vento Morto, precisa de uma grande quantidade de energia arcana.",
    Location = "Anelace, a Clarividente (Trilha do Vento Morto - Sepultura de Morgan "..yellow.."41.2,79.2"..white..")",
    Note = "Cajado de Obsidiana "..yellow.."Salões Inferiores de Karazhan [e]."..white.." Resíduo Cósmico dropa de "..yellow.."[3]."..white.."\nA missão prévia A Ligação de Xanthar começa com Hanvar, o Justo (Trilha do Vento Morto - Sepultura de Morgan "..yellow.."40.9, 79.3"..white.."), missão prévia Vinho para Kyleson começa com O Cozinheiro "..yellow.."(Salões Inferiores de Karazhan [e])",
    Prequest = "Vinho para Kyleson, A Ligação de Xanthar",
    Folgequest = "Vestígio de Tirisfal",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41413 }, --Scepter Rod of Medivh Quest Item
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[2] = {
    Title = "Vestígio de Tirisfal",
    Id = 41370,
    Level = 60,
    Attain = 60,
    Aim = "Uma invenção de Medivh é necessária para imbuir o Cetro de Medivh. Leve-o para Anelace, o Clarividente, na Conspiração de Morgan, nos arredores de Karazhan.",
    Location = "Anelace, a Clarividente (Trilha do Vento Morto - Sepultura de Morgan "..yellow.."41.2,79.2"..white..")",
    Note = "Dropa de "..yellow.."Eco de Medivh [4]."..white.."\nDiário de Khadgar [?] inicia esta sequência de missões.\nRecompensa da última missão da sequência.\nSanv K'la (Pântano das Mágoas "..yellow.."25, 30"..white..") inicia a sequência de missões O Encanto de Sanv.",
    Prequest = "Embreagem de Thanlar -> Restauração",
    Folgequest = "O encanto Sanv -> Um favor pedido -> O Cetro do Outro Mundo de Medivh -> Um caminho aberto",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41415, desc = "Open Portal" }, --The Scepter of Medivh Quest Item
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[3] = {
    Title = "Eu não sou nenhum rato",
    Id = 41343,
    Level = 61,
    Attain = 60,
    Aim = "Fale com o Porteiro Montigue nos Salões Inferiores de Karazhan.",
    Location = "Bigodudo (Torre de Karazhan "..yellow.."0, 0"..white..")",
    Note = red.."Apenas Mago"..white..": Porteiro Montigue nos Salões Inferiores de Karazhan no início da masmorra em frente às escadas.",
    Folgequest = "Vela Comicamente Grande",
}
kQuestInstanceData.TowerofKarazhan.Alliance[4] = {
    Title = "Majestade de um Chef",
    Id = 41373,
    Level = 60,
    Attain = 60,
    Aim = "Encontre o cozinheiro nos salões inferiores de Karazhan.",
    Location = "Receitas de Kezan (Torre de Karazhan "..yellow.."perto de [1]"..white..")",
    Note = "O Cozinheiro perto de ("..yellow.."[Salões Inferiores de Karazhan - e]"..white..".\nUma missão para obter uma receita de culinária.",
    Folgequest = "Nenhuma honra entre os chefs",
}
kQuestInstanceData.TowerofKarazhan.Alliance[5] = {
    Title = "Fria é a noite",
    Id = 41353,
    Level = 62,
    Attain = 60,
    Aim = "Investigue os mistérios da Ametista Encantada.",
    Location = "Ametista Encantada (Torre de Karazhan drop "..yellow.."[2] "..white.."boss)",
    Note = "Quest line continues at Cofre de Ventobravo as "..yellow.."[O inimigo estabelece]"..white.." quest.",
    Folgequest = "Abraçado pela Lua",
}
kQuestInstanceData.TowerofKarazhan.Alliance[6] = {
    Title = "Um estudo de árvores mágicas",
    Id = 41375,
    Level = 61,
    Attain = 60,
    Aim = "Viaje para Dire Maul e procure o Lorekeeper Lydros.",
    Location = "Dos Antigos e dos Entes (Torre de Karazhan "..yellow.."perto de [] "..white..")",
    Note = red.."Apenas Druida"..white..": Erudito Lydros (Gládio Cruel - Oeste ou Norte "..yellow.."[1] Biblioteca"..white..")\nSequência de missões para [Glifo do Arvoroso Arcano] em Gládio Cruel Leste.",
    Folgequest = "Embrulhando Warpwood",
}
kQuestInstanceData.TowerofKarazhan.Alliance[7] = {
    Title = "Foice da Deusa",
    Id = 41087,
    Level = 60,
    Attain = 60,
    Aim = "Mate Clawlord Howlfang e apresente-se a Lord Ebonlocke.",
    Location = "Arquidruida Brisasonho (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "'Vorgendor: Mitos da Dimensão de Sangue' (perto da Entrada) contém item de missão.\n"..white.."[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Foice da Deusa",
    Folgequest = "Foice da Deusa",
}
kQuestInstanceData.TowerofKarazhan.Alliance[8] = {
    Title = "Pricolich Gnarlmoon",
    Id = 41384,
    Level = 60,
    Attain = 60,
    Aim = "Mate o Guardião Gnarlmoon. Ele pode ser encontrado nas Câmaras Superiores de Karazhan.",
    Location = "Arquidruida Brisasonho (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "Precisa matar "..yellow.."Guardião Gnarlmoon [1].\n"..white.."[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).",
    Prequest = "Foice da Deusa -> Sabedoria de Ur",
    Folgequest = "Gilnean Pricolich",
}
kQuestInstanceData.TowerofKarazhan.Alliance[9] = {
    Title = "Foice da Deusa",
    Id = 41394,
    Level = 60,
    Attain = 60,
    Aim = "Mate Clawlord Howlfang e apresente-se a Lord Ebonlocke.",
    Location = "Arquidruida Brisasonho (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "[Alma de um Senhor do Medo] dropa de "..yellow.."Mefistroth [8].\n"..white.."[Foice da Deusa] missão prévia começa em A Foice de Elune dropada de Lorde Grisarbore II "..yellow.."(Salões Inferiores de Karazhan [5]).\n"..white.."Tecido Lunar de Alfaiataria, Fragmento de Pedra do Sonho Eterno de Encantamento.",
    Prequest = "Foice da Deusa -> Pricolich Lycan",
    Folgequest = "O Poder da Deusa",
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
    Story = "Retiro Dragonmaw é uma instância de masmorra localizada nas Terras Úmidas. Fragmentos de uma civilização anã mais antiga ainda desconhecida, essas cavernas foram usadas como parte das redes de mineração de Grim Batol. Desde seu segundo abandono, os Dragonmaw transformaram esta rede esquecida em uma base de operações. Agora de posse de um fragmento da Alma do Demônio, eles não vão parar por nada para retomar as Terras Úmidas e os Alcances Sombrios com a ajuda de seu exército de dragões vermelhos hipnotizados.",
    Caption = "Retiro Presa do Dragão",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DragonmawRetreat.Alliance[1] = {
    Title = "Pedestal da Unidade",
    Id = 41774,
    Level = 30,
    Attain = 25,
    Aim = "O Pedestal da Unidade permanece intacto e livre de danos graves.",
    Location = "Pedestal da Unidade (Retiro Presa do Dragão "..yellow.."35,93"..white..")",
    Note = "Pedestal perto de "..yellow.."[5]"..white.."\n'Fragmento de Algoron' dropa de "..yellow.."[3]"..white.."\n'Fragmento de Dathronag' está no 'Baú de Dathronag'",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41876, desc = "Chave" }, --Lower Reserve Key
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[2] = {
    Title = "Derrota de Colmillomiedo",
    Id = 41750,
    Level = 28,
    Attain = 20,
    Aim = "Vingue os gnolls Pelemusgo matando seu antigo líder Gowlfang no Retiro Presa do Dragão. Retorne para Grimbite em seu acampamento no Cinturão Verde em Pântano Salgado depois.",
    Location = "Grimbit (Pântanos - O Cinturão Verde "..yellow.."55,35"..white..")",
    Note = "'Cabeça de Gowlfang' dropa de 'Gowlfang' "..yellow.."[1]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41830 }, --Mosshide Ring
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[3] = {
    Title = "Recuperação dos Golems de Pedra",
    Id = 41749,
    Level = 28,
    Attain = 22,
    Aim = "Obtenha a pedra rúnica de um Golem de Pedra Desmoronado dentro do Retiro Presa do Dragão e leve para Kixxle na estrada principal em Pântano Salgado.",
    Location = "Kixxel (Pântanos - O Cinturão Verde "..yellow.."50,38"..white..")",
    Note = "Pedra Rúnica do Golem de Pedra dropa de Golem de Pedra em Ruínas perto de "..yellow.."[6]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41826 }, --Mosshide Cinch
        { id = 41827 }, --Fenwater Gloves
        { id = 41828 }, --Mosschain Bracers
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[4] = {
    Title = "A Ninhada Faucedraco",
    Id = 41751,
    Level = 34,
    Attain = 24,
    Aim = "Nydiszanz nos Portões Presa do Dragão em Pântano Salgado deseja libertar seu irmão Searistrasz de seu cativeiro pelos orcs Presa do Dragão no Retiro Presa do Dragão.",
    Location = "Nydiszanz (Pântanos - Portões Presa do Dragão "..yellow.."74,48"..white..")",
    Note = "Dragonetes e Searistrasz "..yellow.."[8]",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 41831 }, --Runebound Dagger
        { id = 41832 }, --Flameweave Sash
        { id = 41833 }, --Cuffs of Burning Rage
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[5] = {
    Title = "Jugo da Rainha Dragão",
    Id = 41785,
    Level = 30,
    Attain = 24,
    Aim = "Busca en los Humedales a un dragón rojo dispuesto a escucharte.",
    Location = "Fragmento da Alma Demoníaca (Retiro Presa do Dragão - "..yellow.."[10]"..white..")",
    Note = "Dropa de Zuluhed, o Doido "..yellow.."[10]",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 58234 }, --Pendant of Ember Blood
        { id = 58235 }, --"Pendant of Ember Blessing
        { id = 58236 }, --Pendant of Ember Hatred
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[6] = {
    Title = "Carta de Korlag Doomsong",
    Id = 41657,
    Level = 35,
    Attain = 30,
    Aim = "Entregue a carta para alguém de alta autoridade nos Alcances Sombrios.",
    Location = "Carta de Korlag Cantofúnebre (Retiro Presa do Dragão - Zuluhed o Insano "..yellow.."[10]"..white..")",
    Note = "Entregue para 'Magistrado Hurdam Punhoforte' em 'Recônditos Sombrios' "..yellow.."51, 58"..white.."\nVocê receberá a recompensa ao terminar a próxima missão. Precisa matar 'Comandante Korlag Canto Maldito' Recônditos Sombrios - Fortaleza Zarm'Geth "..yellow.."56, 11",
    Folgequest = "Destruição dos Faucedraco",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 41713 }, -- Doomsong Cuffs
        { id = 41714 }, -- Sash of Zarm'geth
        { id = 41715 }, -- Legging's of Geth'kar
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[7] = {
    Title = "Aplastar os Faucedraco",
    Id = 41756,
    Level = 29,
    Attain = 21,
    Aim = "Mate Veteranos Presa do Dragão no Retiro Presa do Dragão e retorne para o Capitão Punho Firme no Porto de Menethil.",
    Location = "Capitão Punhoforte (Pântanos - Puerto Menethil - "..yellow.."10, 58"..white..")",
    Note = "'Veterano Presa do Dragão' perto de "..yellow.."[4, 6 e 8]",
}
kQuestInstanceData.DragonmawRetreat.Alliance[8] = {
    Title = "A Queda de Corazónoscuro",
    Id = 41757,
    Level = 31,
    Attain = 23,
    Aim = "Leve a cabeça do Senhor da Guerra Negracordis para o Capitão Punho Firme no Porto de Menethil.",
    Location = "Capitão Punhoforte (Pântanos - Puerto Menethil - "..yellow.."10, 58"..white..")",
    Note = "'Cabeça de Coração Negro' dropa de 'Lorde Supremo Coração Negro' "..yellow.."[7]",
    Prequest = "Derrote Nek'rosh",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 41842 }, --Menethil Greaves
        { id = 41843 }, --Stoutheart Shawl
        { id = 41844 }, --Torwyll's Cuffs
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[9] = {
    Title = "A Mentira dos Bandidos Vermelhos",
    Id = 41754,
    Level = 28,
    Attain = 22,
    Aim = "Leve a Tabuleta Rubrorruna para um dos historiadores na Biblioteca de Altaforja.",
    Location = "Tabuleta Rubramarca (Retiro Presa do Dragão "..yellow.."34,93"..white..")",
    Note = "Você receberá a recompensa ao terminar a próxima missão.\nTábua perto de "..yellow.."[5]",
    Folgequest = "A Mentira dos Bandidos Vermelhos",
    Rewards = {
        Text = "Recompensa: Escolha um",
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
        Note = "Entregue para 'Comandante Aggnash' em Recônditos Sombrios - Posto Lâmina Estilhaçada - "..yellow.."60, 30"..white.."\nVocê receberá a recompensa ao terminar a próxima missão.\nPrecisa matar 'Comandante Korlag Canto Maldito' Recônditos Sombrios - Fortaleza Zarm'Geth "..yellow.."56, 11",
    }
)
kQuestInstanceData.DragonmawRetreat.Horde[7] = {
    Title = "Extrato de Teia Cavernosa",
    Id = 41752,
    Level = 27,
    Attain = 21,
    Aim = "Mate a Mãe da Ninhada Teia da Caverna no Retiro Presa do Dragão e entregue seu saco de veneno para Okal em Martelo Furioso.",
    Location = "Okul (Planalto Arathi - Queda do Martelo "..yellow.."74, 34"..white..")",
    Note = "'Saco da Mãe dos Brotos' dropa de 'Prolemadre Espeleoteia' "..yellow.."[2]",
}
kQuestInstanceData.DragonmawRetreat.Horde[8] = {
    Title = "Uma Fogo Inextinguível",
    Id = 41753,
    Level = 30,
    Attain = 24,
    Aim = "Recupere a Chama Eterna de dentro do Retiro Presa do Dragão e leve para Shara Blazen em Serraria Tarren.",
    Location = "Clara Brilhosa (Contraforte de Eira dos Montes - Moinho Tarren "..yellow.."64, 21"..white..")",
    Note = "'Chama Eterna' está perto de "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41836 }, --Ancient Flame Pendant
    }
}

--------------- Stormwrought Ruins ---------------
kQuestInstanceData.StormwroughtRuins = {
    Story = "Ruínas Forjatormenta é uma instância de masmorra localizada em Balor, dentro das ruínas do Castelo Forjatormenta. Uma fortaleza inexpugnável, outrora a casa e sede de poder do Duque Balor, o Castelo Forjatormenta jaz abandonado no topo dos penhascos açoitados pelas ondas de Balor. Tomado durante a Primeira Guerra, todos os seus habitantes foram massacrados viciosamente, e aqueles menos afortunados foram levados cativos para serem usados em rituais hediondos. Anos depois, esta ruína abandonada foi reivindicada novamente, pelo clã orc Devastador da Tempestade e seus sinistros senhores do Conselho das Sombras. Os salões não mais pristinos do castelo abrigam uma coleção de horrores e depravação, com fantasmas persistentes, demônios corpulentos e cultistas murmurantes espreitando pelos corredores escuros como breu deste lugar horrível.",
    Caption = "Ruínas Forjatormenta",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwroughtRuins.Alliance[1] = {
    Title = "O Falecido Duque Balor",
    Id = 41814,
    Level = 34,
    Attain = 28,
    Aim = "Devolva a Coroa de Balor para Olmir Chifre Médio.",
    Location = "Olmir Halfhorn (Balor "..yellow.."30, 51"..white..")",
    Note = "'Coroa de Balor' dropa de 'Duque Balor IV' "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 58261 }, --Drinking Halfhorn
        { id = 58262 }, --Enchanted Glass Kopis
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[2] = {
    Title = "Caveira e Ossos",
    Id = 41760,
    Level = 34,
    Attain = 28,
    Aim = "Entre no Castelo Forjatormenta e recupere o Anel de Selo de Balor para Lorde Olivert Grahan em sua propriedade no oeste de Balor.",
    Location = "Lorde Olivert Grahan (Balor "..yellow.."36, 66"..white..")",
    Note = "'Anel do Sinal de Balor' dropa de 'Duque Balor IV' "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 58073 }, --Grahan Family Seal
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[3] = {
    Title = "Os Mortos Não Podem Reclamar",
    Id = 41844,
    Level = 34,
    Attain = 28,
    Aim = "Rikki Fizmask quer que saqueie as Ruínas Stormwrought em Balor e volte para ela nos restos da Alabarda da Gaivota.",
    Location = "Rikki Fizmask (Balor "..yellow.."29, 11"..white..")",
    Note = "'Tesouro de Balor' dropa de 'Convidados Translúcidos e Nobres Acorrentados' perto de "..yellow.."[4]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 58281 }, --Trusty Goblin Shiv
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[4] = {
    Title = "A Vontade de Balor",
    Id = 41845,
    Level = 38,
    Attain = 32,
    Aim = "Mate a súcubo que retém a alma de Arthur e devolva-a na sala do trono do Castelo Stormwrought.",
    Location = "Guardião do Cofre Arthur Vandris (Ruínas Forjatormenta "..yellow.."perto de [4]"..white..")",
    Note = "'Fragmento da Alma de Guardião do Cofre Arthur' dropa de 'Lady Drazare' "..yellow.."[10]",
}
kQuestInstanceData.StormwroughtRuins.Alliance[5] = {
    Title = "Antiguidades",
    Id = 41842,
    Level = 35,
    Attain = 29,
    Aim = "Recupere o 'Compêndio do Comércio Bem-Sucedido' dentro do Castelo Stormwrought para Noppsy Spickerspan no posto avançado Si:7 em Balor.",
    Location = "Noppsy Spickerspan (Balor - Posto Avançado SI:7 "..yellow.."70, 77"..white..")",
    Note = "'Compêndio do Comércio Bem-sucedido' dropa de 'Bibliotecário Theodorus' "..yellow.."[3]",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 58279 }, --Antiquated Slasher
        { id = 58280 }, --Chainmail of Many Pockets
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[6] = {
    Title = "Assassino em Treinamento",
    Id = 41843,
    Level = 35,
    Attain = 29,
    Aim = "Reduza a cadeia de comando dentro das Ruínas Stormwrought e volte para Nippsy Spickerspan no posto avançado Si:7 em Balor.",
    Location = "Nippsy Spickerspan (Balor - Posto Avançado SI:7 "..yellow.."70, 78"..white..")",
    Note = "'Oronk Coração Partido' "..yellow.."[1]"..white.."\n'Chefe Canção da Tempestade' "..yellow.."[5]"..white.."\n'Mestres de Batalha Devastador da Tempestade' perto de "..yellow.."[5]",
    Prequest = "Avaliar a Situação -> Noppsy Spickerspan -> Notícias Angustiantes -> Para o Ninho da Vespa",
}
kQuestInstanceData.StormwroughtRuins.Alliance[7] = {
    Title = "Coração das Trevas",
    Id = 41787,
    Level = 38,
    Attain = 21,
    Aim = "Detén al Consejo de las Sombras en las Ruinas Forjapiedra.",
    Location = "Verona Gillian (Balor - Posto Avançado SI:7 "..yellow.."70, 77"..white..")",
    Note = "'Ighal'for e Mergothid' "..yellow.."[11]",
    Prequest = "Avaliar a Situação -> Noppsy Spickerspan -> Notícias Angustiantes -> Para o Ninho da Vespa",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 58080 }, --Rufus' Trusty Tankard
        { id = 58081 }, --Kinrial's Scalpel
        { id = 58082 }, --Noppsy's Compendium
        { id = 58083 }, --Nippsy's Precision Rifle
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[8] = {
    Title = "Impressão Cristalina",
    Id = 41879,
    Level = 38,
    Attain = 34,
    Aim = "Encontre um cristal forjado em tempestade para Grukson Barba Pizarra na forja Barba Pizarra.",
    Location = "Grukson Babavelha (Recônditos Sombrios - O Abismo Sombrio "..yellow.."56, 70"..white..")",
    Note = "'Cristal Forjatrovoada' está perto de "..yellow.."[9]",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41980 }, --Slatebeard Amulet
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[9] = {
    Title = "Tudo Que Restou",
    Id = 41840,
    Level = 38,
    Attain = 32,
    Aim = "Leve a espada de brinquedo de madeira para alguém que conheça seu dono. Você pode ter sorte em Vento Norte, onde tudo começou.",
    Location = "Espada de Brinquedo Gravada (Restos dos Inocentes - Santuário de Sangue "..yellow.."[12]"..white..")",
    Note = "Entregue para 'Judith Flenning' em Vento Norte - Ambershire "..yellow.."50, 55",
}
for i = 1, 4 do
    kQuestInstanceData.StormwroughtRuins.Horde[i] = kQuestInstanceData.StormwroughtRuins.Alliance[i]
end
kQuestInstanceData.StormwroughtRuins.Horde[5] = {
    Title = "Inocência Perdida",
    Id = 41821,
    Level = 34,
    Attain = 28,
    Aim = "Mate os restos dos inocentes e retorne para O'jin em Ponta Tempestade.",
    Location = "O'jin (Balor - Ponto Stormbreaker "..yellow.."71, 46"..white..")",
    Note = "'Restos dos Inocentes' "..yellow.."[12]",
}
kQuestInstanceData.StormwroughtRuins.Horde[6] = {
    Title = "Mycellakos",
    Id = 41824,
    Level = 33,
    Attain = 27,
    Aim = "Mate Mycellakos e traga o Núcleo de Mycellakos de volta para Uda'pe Pastosol em Ponta Tempestade.",
    Location = "Uda'pe Erva do Sol (Balor - Ponto Stormbreaker "..yellow.."71, 48"..white..")",
    Note = "Você receberá a recompensa ao terminar a próxima missão.\n'Coração de Mycellakos' dropa de 'Mycellakos' "..yellow.."[8]",
    Prequest = "Cogumelo Vivo",
    Folgequest = "A Matriarca Saberá",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 58268 }, --Left
        { id = 58269 }, --Right
        { id = 58270 }, --Totem of An'she
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[7] = {
    Title = "O Poder de Uth'okk",
    Id = 41730,
    Level = 38,
    Attain = 30,
    Aim = "Mate Oronok Coração Partido e recupere o Pingente de Uth'okk das Ruínas Forjadas pela Tormenta para o Vidente Mothang no Posto Lâmina Partida nos Alcances Sombrios.",
    Location = "Vidente Distante Mothang (Recônditos Sombrios - Posto Quebra Espada "..yellow.."59, 29"..white..")",
    Note = "Você receberá a recompensa ao terminar a próxima missão.\n'O Pingente de Uth'okk' dropa de 'Oronk Coração Partido' "..yellow.."[1]",
    Prequest = "Magia Encantada -> Remédios Naturais -> Essência Sombria",
    Folgequest = "O Ritual de Uth'okk",
    Rewards = {
        Text = "Recompensa: ",
        { id = 41798 }, --The Pendant of Uth'okk
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[8] = {
    Title = "Não Pode Chover o Tempo Todo",
    Id = 41833,
    Level = 38,
    Attain = 32,
    Aim = "Mate Dagar o Guloso, Oronok Coração Partido, Ighal'for e volte para Kilrogg Olho Morto em Punta Rompetormentas.",
    Location = "Kilrogg Olho-morto (Balor - Ponto Stormbreaker "..yellow.."71, 47"..white..")",
    Note = "Você receberá a recompensa ao terminar a próxima missão.\n'Oronk Coração Partido' "..yellow.."[1]"..white.."\n'Dagar, o Glutão' "..yellow.."[2]"..white.."\n'Ighal'for' "..yellow.."[11]",
    Prequest = "Nas Profundezas das Minas -> Pensamentos Simples -> Colônia de Formigas",
    Folgequest = "O Fim da Tempestade",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 58272 }, --Kor'kron Crown
        { id = 58273 }, --Voodoo Jerkin
        { id = 58274 }, --Totemic Headdress
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[9] = {
    Title = "Artefato da Dama Sombria",
    Id = 41841,
    Level = 38,
    Attain = 32,
    Aim = "Entregue o pingente de pedra de sangue para Lady Sylvanas Windrunner em Entrañas.",
    Location = "Pingente Partido de Pedra-sangue (Ruínas Forjatormenta - Ighal'for "..yellow.."[11]"..white..")",
    Note = "Prequest start at 'Magus Ordínio Olharvazio' (Contraforte de Eira dos Montes - Moinho Tarren "..yellow.."62, 21"..white..")",
    Prequest = "Arrombamento da prisão",
    Rewards = {
        Text = "Recompensa: Escolha um",
        { id = 58277 }, --Lady Winter's Touch",
        { id = 58278 }, --Ring of Judgement
    }
}
--------------- Windhorn Canyon ---------------
kQuestInstanceData.WindhornCanyon = {
    Story = "Este antigo canyon tem sido o lar de muitas tribos tauren que no passado lutaram pelo domínio de suas águas correntes e abrigo dos perigos de Kalimdor. As culturas e tradições de muitos viveram dentro do Canyon Windhorn, o que pode ser visto dos antigos abrigos esculpidos na encosta da montanha, até as relíquias cobiçadas pelos Tauren. Recentemente, os Tauren Windhorn foram expulsos e afastados pelos Grimtotem que o conquistaram e reivindicaram para si.",
    Caption = "Windhorn Canyon",
    Alliance = {},
    Horde = {}
}
--------------- Timbermaw Hold ---------------
kQuestInstanceData.TimbermawHold = {
    Story = "Tão antigo quanto Kalimdor em si, esta enigmática rede labiríntica de túneis e cavernas sob o Monte Hyjal tem sido o lar dos Furbolgs desde bem antes do Cataclismo. Seus salões são sagrados entre as tribos, um lugar de adoração aos seus progenitores, os deuses gêmeos Ursoc e Ursol. Hoje em dia, no entanto, apenas baforadas de vapores pútridos escapam das cavernas podres e sussurros de venerar um deus imundo ecoam por toda a Toca Presa da Madeira…",
    Caption = "Domínio dos Presamatos",
    Alliance = {},
    Horde = {}
}
AtlasTW.Quest.DataBase = kQuestInstanceData
