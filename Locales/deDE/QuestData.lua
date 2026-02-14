---
--- QuestData_enUS.lua - Atlas quest data definitions for English localization
--- 
--- This file contains all quest data definitions for Atlas-TW in English.
--- It includes quest information, rewards, locations, and requirements
--- for all instances and zones supported by Atlas-TW.
--- 
--- Features:
--- - Complete quest database for all instances
--- - Quest reward definitions
--- - Quest location and NPC information
--- - Quest inheritance system
--- - Localized quest data for English
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW

if GetLocale() ~= "deDE" then return end

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
    Story = "Einst das größte Goldproduktionszentrum der menschlichen Länder, wurden die Todesminen aufgegeben, als die Horde Sturmwind während des Ersten Krieges niederbrannte. Jetzt hat die Bruderschaft der Defias dort Unterschlupf gefunden und die dunklen Tunnel in ihr privates Heiligtum verwandelt. Es wird gemunkelt, dass die Diebe die cleveren Goblins eingezogen haben, um ihnen zu helfen, etwas Schreckliches am Grund der Minen zu bauen - aber was das sein mag, ist noch ungewiss. Gerüchten zufolge führt der Weg in die Todesminen durch das ruhige, unscheinbare Dorf Mondsichel.",
    Caption = "Die Todesminen",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheDeadmines.Alliance[1] = {
    Title = "Rote Seidenkopftücher",
    Id = 214,
    Level = 17,
    Attain = 14,
    Aim = "Späherin Riell am Turm auf der Späherkuppe möchte, dass Ihr ihr 10 rote Seidenkopftücher bringt.",
    Location = "Späherin Riell (Westfall - Späherkuppe "..yellow.."56, 47"..white..")",
    Note = "Ihr könnt die Roten Seidenkopftücher von Minenarbeitern in den Todesminen oder in der Stadt, in der sich die Instanz befindet, erhalten. Die Quest wird verfügbar, nachdem Ihr die Questreihe Die Bruderschaft der Defias bis zu dem Teil abgeschlossen habt, in dem Ihr Edwin van Cleef töten müsst.",
    Prequest = "Die Bruderschaft der Defias",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 2074 }, --Solid Shortblade One-Hand, Sword
        { id = 2089 }, --Scrimshaw Dagger One-Hand, Dagger
        { id = 6094 }, --Piercing Axe Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[2] = {
    Title = "Die Suche nach Andenken",
    Id = 168,
    Level = 18,
    Attain = 14,
    Aim = "Beschafft 4 Gewerkschaftsausweise und bringt sie nach Sturmwind zu Wilder Distelklette.",
    Location = "Wilder Distelklette (Sturmwind - Zwergenviertel "..yellow.."65, 21"..white..")",
    Note = "Die Karten droppen von Untoten-Gegnern außerhalb der Instanz im Gebiet bei "..yellow.."[3]"..white.." auf der Eingangskarte.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 2037 }, --Tunneler's Boots Feet, Mail
        { id = 2036 }, --Dusty Mining Gloves Hands, Leather
    }
}
kQuestInstanceData.TheDeadmines.Alliance[3] = {
    Title = "Oh Bruder...",
    Id = 167,
    Level = 20,
    Attain = 15,
    Aim = "Bringt Großknecht Distelklettes Abzeichen der Forscherliga nach Sturmwind zu Wilder Distelklette.",
    Location = "Wilder Distelklette (Sturmwind - Zwergenviertel "..yellow.."65,21"..white..")",
    Note = "Großknecht Distelklette befindet sich außerhalb der Instanz im Untoten-Gebiet bei "..yellow.."[3]"..white.." auf der Eingangskarte.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 1893 }, --Miner's Revenge Two-Hand, Axe
    }
}
kQuestInstanceData.TheDeadmines.Alliance[4] = {
    Title = "Unterirdischer Angriff",
    Id = 2040,
    Level = 20,
    Attain = 15,
    Aim = "Holt das Gnoamsprenkelspross aus den Todesminen und bringt es Shoni der Schtillen in Sturmwind.",
    Location = "Shoni die Stille (Sturmwind - Zwergenviertel "..yellow.."55,12"..white..")",
    Note = "Die Vorquest kann von Gnoarn erhalten werden (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."24.5,30.4"..white..").\nSneeds Schredder lässt das Gnomsprenkelsproß fallen "..yellow.."[3]"..white..".",
    Prequest = "Sprecht mit Shoni",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 7606 }, --Polar Gauntlets Hands, Mail
        { id = 7607 }, --Sable Wand Wand
    }
}
kQuestInstanceData.TheDeadmines.Alliance[5] = {
    Title = "Die Bruderschaft der Defias",
    Id = 166,
    Level = 22,
    Attain = 14,
    Aim = "Gryan Starkmantel möchte, dass Ihr in Seenhain mit Wiley sprecht.",
    Location = "Marschall Gryan Starkmantel (Westfall - Späherkuppe "..yellow.."56,47"..white..")",
    Note = "Ihr beginnt diese Questreihe bei Marschall Gryan Starkmantel (Westfall - Späherkuppe "..yellow.."56,47"..white..").\nEdwin VanCleef ist der letzte Boss der Todesminen. Ihr findet ihn oben auf seinem Schiff "..yellow.."[6]"..white..".",
    Prequest = "Die Bruderschaft der Defias",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6087 }, --Chausses of Westfall Legs, Mail
        { id = 2041 }, --Tunic of Westfall Chest, Leather
        { id = 2042 }, --Staff of Westfall Staff
    }
}
kQuestInstanceData.TheDeadmines.Alliance[6] = {
    Title = "Die Prüfung der Rechtschaffenheit",
    Id = 1654,
    Level = 22,
    Attain = 20,
    Aim = "Sprecht mit Jordan Stillbrunn in Eisenschmiede.",
    Location = "Jordan Stillbrunn (Dun Morogh - Eisenschmiede Entrance "..yellow.."52,36"..white..")",
    Note = red.."Nur Paladin"..white..": Um die Notiz zu sehen, klickt auf "..yellow.."[Die Prüfung der Rechtschaffenheit Information]"..white..".",
    Prequest = "Der Foliant der Tapferkeit -> Die Prüfung der Rechtschaffenheit",
    Folgequest = "Die Prüfung der Rechtschaffenheit",
    Rewards = {
        Text = "Belohnung: ",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = {2, "Nur Paladine können diese Quest erhalten!\n\n1. Du bekommst das Weißsteineichenholz von Goblinschnitzern in "..yellow.."[Die Todesminen]"..white.." nahe "..yellow.."[3]"..white..".\n\n2. Um Bailors Veredeltes Erzpaket zu erhalten, musst du mit Bailor Steinhand sprechen (Loch Modan – Thelsamar "..yellow.."35,44"..white.."). Er gibt dir die Quest 'Bailors Erzlieferung'. Du findest Jordans Erzlieferung hinter einem Baum bei "..yellow.."71,21"..white..".\n\n3. Jordans Schmiedehammer erhältst du in "..yellow.."[Burg Schattenfang]"..white.." bei "..yellow.."[3]"..white..".\n\n4. Um einen Kor-Edelstein zu bekommen, musst du zu Thundris Windwirker (Dunkelküste – Auberdine "..yellow.."37,40"..white..") gehen und die Quest 'Suche nach dem Koredelstein' erledigen. Dafür musst du Schwarzfathom-Orakel oder -Priesterinnen vor dem Eingang zu "..yellow.."[Tiefschwarze Grotte]"..white.." töten. Sie lassen einen verdorbenen Kor-Edelstein fallen. Thundris Windwirker wird ihn für dich reinigen.", };
}
kQuestInstanceData.TheDeadmines.Alliance[7] = {
    Title = "Der nie verschickte Brief",
    Id = 373,
    Level = 22,
    Attain = 16,
    Aim = "Bringt den Brief nach Sturmwind zum Stadtarchitekten Baros Alexston.",
    Location = "Ein nie abgeschickter Brief (droppt von Edwin van Cleef "..yellow.."[6]"..white..")",
    Note = "Baros Alexston befindet sich in Sturmwind, neben der Kathedrale des Lichts bei "..yellow.."49,30"..white..".",
    Folgequest = "Bazil Thredd",

}
kQuestInstanceData.TheDeadmines.Alliance[8] = {
    Title = "Captain Graysons Rache",
    Id = 40396,
    Level = 22,
    Attain = 15,
    Aim = "End Cookie.",
    Location = "Kapitän Grausohn (Westfall - Leuchtturm "..yellow.."30,86"..white..")",
    Note = "Ihr beginnt diese Questreihe auf der nordwestlichen Insel im Westfall; Rotes Buch auf dem Boden "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "Nährstoff für wandernde Gedanken?",
    Rewards = {
        Text = "Belohnung: ",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Alliance[9] = {
    Title = "Das Rätsel um die Erntegolems",
    Id = 40478,
    Level = 19,
    Attain = 15,
    Aim = "Begebt euch in die Todesminen und tötet den Meisterwerk-Ernter. Kehrt danach zu Maltimor Gartside beim Gartside-Grab in Westfall zurück.", --TODO check
    Location = "Maltimor Gartseit (Westfall - nördlich von Der Goldküstensteinbruch "..yellow.."31.3,37.6"..white..")",
    Note = "Ihr beginnt diese Questreihe bei Christopher Klopf (Westfall - Gasthaus Späherkuppe "..yellow.."52.3,52.8"..white..").\nDie Questreihe hat 16 Quests. Endbelohnung blaue Gegenstände: 1) Schildhand Int/Schattenresi/Schaden und Heilung, 2) Stoffschultern Str/Ausdauer, 3) Lederhandschuhe Str/Bewegl/Ausdauer\nMeisterwerk Ernter ist bei "..yellow.."[4]"..white..".",
    Prequest = "Das Rätsel um die Erntegolems VIII",
    Folgequest = "Das Rätsel um die Erntegolems X",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60684 }, --Tinkering Belt Waist, Leather
        { id = 60685 }, --Safety Wraps Wrist, Cloth
        { id = 60686 }, --Harvest Golem Arm Two-Hand, Mace
    }
}
kQuestInstanceData.TheDeadmines.Alliance[10] = {
    Title = "Den Hahn zudrehen",
    Id = 41392,
    Level = 20,
    Attain = 14,
    Aim = "Infiltriert die Todesminen im Westfall und beschafft Voss' Brutzelbräu.",
    Location = "Renzik 'der Spitze' (Sturmwind - Altstadt "..yellow.."76, 60"..white..")",
    Note = "Ihr beginnt diese Questreihe beim selben NPC. Der Drop von Jared Voss ist bei "..yellow.."[1]"..white..".",
    Prequest = "Drohnen in Westfall -> Venture Lieferung",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 70239 }, --Operative Cloak Back
        { id = 70240 }, --Cuffs of Integrity Wrist, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[1] = {
    Title = "Der Prototypen Diebstahl",
    Id = 55005,
    Level = 18,
    Attain = 16,
    Aim = "Bringt den Prototyp-Schredder X0-1 Bauplan zu Wrix Ozzlenut.",
    Location = "Wrix Ozzlenut (Durotar - Funkelwasserhafen "..yellow.."58.3,25.7"..white..")",
    Note = "Sneed lässt den Prototyp-Schredder X0-1 Bauplan fallen "..yellow.."[3]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 81316 }, --Foe Chopper Two-Hand, Axe
        { id = 81317 }, --Shining Electro-lantern Held In Off-hand
    }
}
kQuestInstanceData.TheDeadmines.Horde[2] = {
    Title = "Captain Graysons Rache",
    Id = 40396,
    Level = 22,
    Attain = 15,
    Aim = "End Cookie.",
    Location = "Kapitän Grausohn (Westfall - Leuchtturm "..yellow.."30,86"..white..")",
    Note = "Ihr beginnt diese Questreihe auf der nordwestlichen Insel im Westfall; Rotes Buch auf dem Boden "..yellow.."26.1,16.5"..white..").\n",
    Prequest = "Nährstoff für wandernde Gedanken?",
    Rewards = {
        Text = "Belohnung: ",
        { id = 70070 }, --Grayson's Hat Head, Cloth
    }
}
kQuestInstanceData.TheDeadmines.Horde[3] = {
    Title = "Verteidigeraxt der Horde",
    Id = 39998,
    Level = 18,
    Attain = 15,
    Aim = "Sprich mit einem Horde-Wachposten im Wegekreuz.",
    Location = "Birgitte Kranstein <Portal Trainer> (Donnerfels"..yellow.."34.4,20.3"..white..")",
    Note = "Ihr beginnt diese Questreihe bei Nargal Totauge (Crossroads "..yellow.."51.2,29.1"..white..").\nDiese Quest "..red.."TELEPORTIERT EUCH NUR NACH WESTFALL"..white..". Ihr könnt entweder diese Quest abschließen und die Belohnung nach Abschluss der Questreihe erhalten oder sie als Westfall-Teleport nutzen, indem Ihr die Quest erneut annehmt.",
    Prequest = "Verteidigeraxt der Horde",
    Folgequest = "Verteidigeraxt der Horde",
    Rewards = {
        Text = "Belohnung: ",
        { id = 40065 }, --Horde Defender's Axe Two-Hand, Axe
    }
}

--------------- Wailing Caverns ---------------
kQuestInstanceData.WailingCaverns = {
    Story = "Vor kurzem entdeckte ein Nachtelfen-Druide namens Naralex ein Netzwerk unterirdischer Höhlen im Herzen des Brachlandes. Diese als 'Höhlen des Wehklagens' bezeichneten natürlichen Höhlen waren mit Dampfspalten gefüllt, die beim Entweichen lange, klagende Wehklagen erzeugten. Naralex glaubte, er könne die unterirdischen Quellen der Höhlen nutzen, um dem Brachland Üppigkeit und Fruchtbarkeit zurückzugeben - aber dazu müsste er die Energien des sagenumwobenen Smaragdgrünen Traums anzapfen. Sobald jedoch die Verbindung zum Traum hergestellt war, verwandelte sich die Vision des Druiden irgendwie in einen Alptraum. Bald begannen sich die Höhlen des Wehklagens zu verändern - das Wasser wurde faul und die einst zahmen Kreaturen darin verwandelten sich in bösartige, tödliche Raubtiere. Es heißt, dass Naralex selbst noch immer irgendwo im Herzen des Labyrinths verweilt, gefangen jenseits der Grenzen des Smaragdgrünen Traums. Sogar seine einstigen Akolythen wurden durch den wachen Alptraum ihres Meisters verdorben - verwandelt in die bösen Druiden des Fangs.",
    Caption = "Höhlen des Wehklagens",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.WailingCaverns.Alliance[1] = {
    Title = "Deviatbälge",
    Id = 1486,
    Level = 17,
    Attain = 13,
    Aim = "Nalpak in den Höhlen des Wehklagens möchte 20 Deviatbälge.",
    Location = "Nalpak (Barrens - Höhlen des Wehklagens "..yellow.."47,36"..white..")",
    Note = "Alle Deviat-Gegner innerhalb und direkt vor dem Eingang zur Instanz können Bälge fallen lassen.\nNalpak kann in einer versteckten Höhle über dem eigentlichen Höhleneingang gefunden werden. Der einfachste Weg zu ihm scheint zu sein, den Hügel außerhalb und hinter dem Eingang hinaufzulaufen und den kleinen Felsvorsprung über dem Höhleneingang hinunterzuspringen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6480 }, --Slick Deviate Leggings Legs, Leather
        { id = 918 }, --Deviate Hide Pack Bag
    }
}
kQuestInstanceData.WailingCaverns.Alliance[2] = {
    Title = "Ärger auf den Docks",
    Id = 959,
    Level = 18,
    Attain = 14,
    Aim = "Kranführer Moppelfuzz in Ratschet möchte, dass Ihr Zausel dem Verrückten, der sich in den Höhlen des Wehklagens versteckt, die Flasche mit 99-jährigem Portwein wieder abnehmt.",
    Location = "Kranführer Moppelfuzz (Barrens - Ratschet "..yellow.."63,37"..white..")",
    Note = "Ihr bekommt die Flasche kurz bevor Ihr in die Instanz geht, indem Ihr Zausel den Verrückten tötet. Wenn Ihr die Höhle zum ersten Mal betretet, geht sofort nach rechts, um ihn am Ende des Durchgangs zu finden. Er ist getarnt an der Wand bei "..yellow.."[2] auf der Eingangskarte"..white..".",
}
kQuestInstanceData.WailingCaverns.Alliance[3] = {
    Title = "Klugheitstränke",
    Id = 1491,
    Level = 18,
    Attain = 13,
    Aim = "Sammelt 6 Portionen Klageessenz.",
    Location = "Mebok Mizzyrix (Barrens - Ratschet "..yellow.."62,37"..white..")",
    Note = "Die Vorquest kann auch von Mebok Mizzyrix erhalten werden.\nAlle Ektoplasma-Gegner in und vor der Instanz lassen die Essenz fallen.",
    Prequest = "Es muss im Horn stecken",
}
kQuestInstanceData.WailingCaverns.Alliance[4] = {
    Title = "Ausrottung der Deviat",
    Id = 1487,
    Level = 21,
    Attain = 15,
    Aim = "Ebru in den Höhlen des Wehklagens möchte, dass Ihr 7 Deviatverheerer, 7 Deviatvipern, 7 Deviatschlurfer und 7 Deviatschreckensfange tötet.",
    Location = "Ebru (Barrens - Höhlen des Wehklagens "..yellow.."47,36"..white..")",
    Note = "Ebru befindet sich in einer versteckten Höhle über dem Höhleneingang. Der einfachste Weg zu ihm scheint zu sein, den Hügel außerhalb und hinter dem Eingang hinaufzulaufen und den kleinen Felsvorsprung über dem Höhleneingang hinunterzuspringen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6476 }, --Pattern: Deviate Scale Belt Pattern
        { id = 8071 }, --Sizzle Stick Wand
        { id = 6481 }, --Dagmire Gauntlets Hands, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[5] = {
    Title = "Der leuchtende Splitter",
    Id = 6981,
    Level = 26,
    Attain = 15,
    Aim = "Reist nach Ratschet, um die Bedeutung des Alptraumsplitters herauszufinden.",
    Location = "Der Leuchtende Splitter (droppt von Mutanus dem Verschlinger "..yellow.."[9]"..white..")",
    Note = "Mutanus der Verschlinger erscheint nur, wenn Ihr die vier Anführer-Druiden des Fangs tötet und den Tauren-Druiden am Eingang eskortiert.\nWenn Ihr den Splitter habt, müsst Ihr ihn zur Bank in Ratschet bringen und dann zurück zur Spitze des Hügels über den Höhlen des Wehklagens zu Falla Weisenwind.",
    Folgequest = "Alptraum",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 10657 }, --Talbar Mantle Shoulder, Cloth
        { id = 10658 }, --Quagmire Galoshes Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[6] = {
    Title = "Schlangenflaum",
    Id = 60125,
    Level = 18,
    Attain = 16,
    Aim = "Die Apothekerin Zamah in Donnerfels möchte, dass Ihr zehn Schlangenflaum für sie sammelt.",
    Location = "Alanndarian Nachtweise (Auberdine - Dunkelküste "..yellow.."37.7,40.7"..white..")",
    Note = "Ihr bekommt den Schlangenflaum in der Höhle vor der Instanz und innerhalb der Instanz. Spieler mit Kräuterkunde können die Pflanzen auf ihrer Minimap sehen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 51850 }, --Greenweave Sash Waist, Cloth
        { id = 51851 }, --Verdant Boots Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Alliance[7] = {
    Title = "Gefangen im Alptraum",
    Id = 60124,
    Level = 19,
    Attain = 16,
    Aim = "Alanndarian Nachtweise möchte, dass Ihr Euch in die Höhlen des Wehklagens im nördlichen Brachland wagt und Naralex aus dem Alptraum befreit. Findet seinen Jünger in den Höhlen, um zu erfahren, wie. Kehrt zu ihr zurück, wenn Ihr Naralex befreit habt.",
    Location = "Alanndarian Nachtweise (Auberdine - Dunkelküste "..yellow.."37.7,40.7"..white..")",
    Note = "Mutanus der Verschlinger erscheint nur, wenn Ihr die vier Anführer-Druiden des Fangs tötet und den Tauren-Druiden am Eingang eskortiert.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 51848 }, --Ancient Elven Robes Chest, Cloth
        { id = 51849 }, --Thunderhorn Two-Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Alliance[8] = {
    Title = "Wucherndes Unkraut",
    Id = 41363,
    Level = 20,
    Attain = 16,
    Aim = "Thundris Windwirker in Auberdine benötigt Proben der unnatürlichen Überwucherungen in den Höhlen des Wehklagens.",
    Location = "Thundris Windwirker (Auberdine - Dunkelküste "..yellow.."37.4,40.1"..white..")",
    Note = "Elementals - Unnatürliche Überwucherung drop Overgrowth Samples.",
    Rewards = {
        Text = "Belohnung: 1 oder 2",
        { id = 3827, quantity = 3 }, --Mana Potion Potion
        { id = 1710, quantity = 3 }, --Greater Healing Potion Potion
    }
}
kQuestInstanceData.WailingCaverns.Horde[1] = kQuestInstanceData.WailingCaverns.Alliance[1]
kQuestInstanceData.WailingCaverns.Horde[2] = kQuestInstanceData.WailingCaverns.Alliance[2]
kQuestInstanceData.WailingCaverns.Horde[3] = {
    Title = "Schlangenflaum",
    Id = 962,
    Level = 18,
    Attain = 14,
    Aim = "Die Apothekerin Zamah in Donnerfels möchte, dass Ihr zehn Schlangenflaum für sie sammelt.",
    Location = "Apothekerin Zamah (Donnerfels - Die Anhöhe der Geister "..yellow.."22,20"..white..")",
    Note = "Apothekerin Zamah befindet sich in einer Höhle unter der Anhöhe der Geister. Ihr bekommt die Vorquest von Apotheker Helbrim (Brachland - Crossroads "..yellow.."51,30"..white..").\nIhr bekommt den Schlangenflaum in der Höhle vor der Instanz und innerhalb der Instanz. Spieler mit Kräuterkunde können die Pflanzen auf ihrer Minimap sehen.",
    Prequest = "Pilzsporen -> Apothekerin Zamah",
    Rewards = {
        Text = "Belohnung: ",
        { id = 10919 }, --Apothecary Gloves Hands, Cloth
    }
}
kQuestInstanceData.WailingCaverns.Horde[4] = {
    Title = "Klugheitstränke",
    Id = 1491,
    Level = 18,
    Attain = 13,
    Aim = "Sammelt 6 Portionen Klageessenz.",
    Location = "Mebok Mizzyrix (Barrens - Ratschet "..yellow.."62,37"..white..")",
    Note = "Die Vorquest kann auch von Mebok Mizzyrix erhalten werden.\nAlle Ektoplasma-Gegner in und vor der Instanz lassen die Essenz fallen.",
    Prequest = "Es muss im Horn stecken",
}
kQuestInstanceData.WailingCaverns.Horde[5] = {
    Title = "Ausrottung der Deviat",
    Id = 1487,
    Level = 21,
    Attain = 15,
    Aim = "Ebru in den Höhlen des Wehklagens möchte, dass Ihr 7 Deviatverheerer, 7 Deviatvipern, 7 Deviatschlurfer und 7 Deviatschreckensfange tötet.",
    Location = "Ebru (Barrens - Höhlen des Wehklagens "..yellow.."47,36"..white..")",
    Note = "Ebru befindet sich in einer versteckten Höhle über dem Höhleneingang. Der einfachste Weg zu ihm scheint zu sein, den Hügel außerhalb und hinter dem Eingang hinaufzulaufen und den kleinen Felsvorsprung über dem Höhleneingang hinunterzuspringen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6476 }, --Pattern: Deviate Scale Belt Pattern
        { id = 8071 }, --Sizzle Stick Wand
        { id = 6481 }, --Dagmire Gauntlets Hands, Mail
    }
}
kQuestInstanceData.WailingCaverns.Horde[6] = {
    Title = "Anführer der Giftzähne",
    Id = 914,
    Level = 22,
    Attain = 11,
    Aim = "Bringt die Edelsteine von Kobrahn, Anacondra, Pythas und Serpentis nach Donnerfels zu Nara Wildmähne.",
    Location = "Nara Wildmähne (Donnerfels - Die Anhöhe der Ältesten "..yellow.."75,31"..white..")",
    Note = "Die Questreihe beginnt bei Hamuul Runentotem (Donnerfels - Die Anhöhe der Ältesten "..yellow.."78,28"..white..")\nDie 4 Druiden lassen die Edelsteine fallen "..yellow.."[2]"..white..", "..yellow.."[3]"..white..", "..yellow.."[5]"..white..", "..yellow.."[7]"..white..".",
    Prequest = "Die Oasen des Brachlandes -> Nara Wildmähne",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6505 }, --Crescent Staff Staff
        { id = 6504 }, --Wingblade Main Hand, Sword
    }
}
kQuestInstanceData.WailingCaverns.Horde[7] = {
    Title = "Der leuchtende Splitter",
    Id = 6981,
    Level = 26,
    Attain = 15,
    Aim = "Reist nach Ratschet, um die Bedeutung des Alptraumsplitters herauszufinden.",
    Location = "Der Leuchtende Splitter (droppt von Mutanus dem Verschlinger "..yellow.."[9]"..white..")",
    Note = "Mutanus der Verschlinger erscheint nur, wenn Ihr die vier Anführer-Druiden des Fangs tötet und den Tauren-Druiden am Eingang eskortiert.\nWenn Ihr den Splitter habt, müsst Ihr ihn zur Bank in Ratschet bringen und dann zurück zur Spitze des Hügels über den Höhlen des Wehklagens zu Falla Weisenwind.",
    Folgequest = "Alptraum",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 10657 }, --Talbar Mantle Shoulder, Cloth
        { id = 10658 }, --Quagmire Galoshes Feet, Mail
    }
}
kQuestInstanceData.WailingCaverns.Horde[8] = {
    Title = "Arkane Waffen",
    Id = 80312,
    Level = 18,
    Attain = 14,
    Aim = "Bringt Chok'Garok 5 Stücke Mondberührtes Holz, einen Kristall der Schlange und eine Ewig wechselnde Essenz aus den Höhlen des Wehklagens.",
    Location = "Chok Garok <Steinhammerklan> (an einem Ufer des Südstroms im Brachland "..yellow.."62.4,10.8"..white..")",
    Note = red.."NUR Magier."..white.." Die Questreihe beginnt bei Ureda <Magierlehrer> (Orgrimar) mit der Quest 'Die Arkane meistern'.\nMondberührtes Holz bekommt Ihr von "..yellow.."Trash"..white..", einen Kristall der Schlange von Lord Serpentis <Fangfürst>"..yellow.."[7]"..white..", und eine Ewig wechselnde Essenz von Lord Pythas <Fangfürst> "..yellow.."[5]"..white..".",
    Prequest = "Die Arkane meistern",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 80860 }, --Staff of the Arcane Path Staff
        { id = 80861 }, --Spellweaving Dagger One-Hand, Dagger
    }
}
kQuestInstanceData.WailingCaverns.Horde[9] = {
    Title = "Gegen den Traum der Kolkar",
    Id = 41367,
    Level = 23,
    Attain = 17,
    Aim = "Tötet Zandara Windhuf in den Höhlen des Wehklagens und bringt ihren Kopf zurück zu Nalpak im Brachland.",
    Location = "Nalpak (Barrens - Höhlen des Wehklagens "..yellow.."47,36"..white..")",
    Note = "Ihr müsst Zandara Windhuf [6] töten und ihren Kopf nehmen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 70224 }, --Kolkar Drape Back
    }
}

--------------- Ragefire Chasm ---------------
kQuestInstanceData.RagefireChasm = {
    Story = "Der Flammenschlund besteht aus einem Netzwerk vulkanischer Höhlen, die unter der neuen Hauptstadt der Orks, Orgrimmar, liegen. Vor kurzem verbreiteten sich Gerüchte, dass ein Kult, der dem dämonischen Rat der Schatten treu ergeben ist, in den feurigen Tiefen der Schlucht Unterschlupf gefunden hat. Dieser Kult, bekannt als die Brennende Klinge, bedroht die Souveränität Durotars. Viele glauben, dass der Kriegshäuptling der Orks, Thrall, sich der Existenz der Klinge bewusst ist und sich entschieden hat, sie nicht zu zerstören, in der Hoffnung, dass ihre Mitglieder ihn direkt zum Rat der Schatten führen könnten. So oder so könnten die dunklen Mächte, die vom Flammenschlund ausgehen, alles zunichte machen, wofür die Orks gekämpft haben.",
    Caption = "Der Flammenschlund",
    Horde = {}
}
kQuestInstanceData.RagefireChasm.Horde[1] = {
    Title = "Die Kraft des Feindes wird auf die Probe gestellt",
    Id = 5723,
    Level = 15,
    Attain = 9,
    Aim = "Sucht in Orgrimmar nach dem Flammenschlund, tötet dann 8 Flammenschlundtroggs und 8 Schamanen der Flammenschlundtroggs und kehrt anschließend zu Rahauro in Donnerfels zurück.",
    Location = "Rahauro (Donnerfels - Die Anhöhe der Ältesten "..yellow.."70,29"..white..")",
    Note = "Ihr findet die Troggs am Anfang.",
}
kQuestInstanceData.RagefireChasm.Horde[2] = {
    Title = "Die Macht zu Zerstören...",
    Id = 5725,
    Level = 16,
    Attain = 9,
    Aim = "Bringt die Bücher 'Schattenzauber' und 'Zauberformeln aus dem Nether' zu Varimathras nach Unterstadt.",
    Location = "Varimathras (Unterstadt - Königsviertel "..yellow.."56,92"..white..")",
    Note = "Sengklinge-Kultisten und Hexenmeister lassen die Bücher fallen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 15449 }, --Ghastly Trousers Legs, Cloth
        { id = 15450 }, --Dredgemire Leggings Legs, Leather
        { id = 15451 }, --Gargoyle Leggings Legs, Mail
    }
}
kQuestInstanceData.RagefireChasm.Horde[3] = {
    Title = "Die Suche nach dem verloren gegangenen Ranzen",
    Id = 5722,
    Level = 16,
    Attain = 9,
    Aim = "Sucht im Flammenschlund nach Maur Grimmtotems Leiche und durchsucht sie nach interessanten Gegenständen.",
    Location = "Rahauro (Donnerfels - Die Anhöhe der Ältesten "..yellow.."70,29"..white..")",
    Note = "Ihr findet Maur Grimmtotem bei "..yellow.."[1]"..white..". Nachdem Ihr den Ranzen erhalten habt, müsst Ihr ihn zurück zu Rahauro in Donnerfels bringen.",
    Folgequest = "Wiederbeschaffung des verloren gegangenen Ranzens",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 15452 }, --Featherbead Bracers Wrist, Cloth
        { id = 15453 }, --Savannah Bracers Wrist, Leather
    }
}
kQuestInstanceData.RagefireChasm.Horde[4] = {
    Title = "Verborgene Feinde",
    Id = 5728,
    Level = 16,
    Attain = 9,
    Aim = "Bringt ein Insigne des Leutnants zu Thrall nach Orgrimmar.",
    Location = "Thrall (Orgrimmar - Tal der Weisheit "..yellow.."31,37"..white..")",
    Note = "Ihr findet Bazzalan bei "..yellow.."[4]"..white.." und Jergosh bei "..yellow.."[3]"..white..". Die Questreihe beginnt bei Kriegshäuptling Thrall in Orgrimmar.",
    Prequest = "Verborgene Feinde",
    Folgequest = "Verborgene Feinde",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 15443 }, --Kris of Orgrimmar One-Hand, Dagger
        { id = 15445 }, --Hammer of Orgrimmar Main Hand, Mace
        { id = 15424 }, --Axe of Orgrimmar Two-Hand, Axe
        { id = 15444 }, --Staff of Orgrimmar Staff
    }
}
kQuestInstanceData.RagefireChasm.Horde[5] = {
    Title = "Vernichtung der Bestie",
    Id = 5761,
    Level = 16,
    Attain = 9,
    Aim = "Begebt Euch in den Flammenschlund und erschlagt Taragaman den Hungerleider. Bringt anschließend dessen Herz zu Neeru Feuerklinge nach Orgrimmar.",
    Location = "Neeru Feuerklinge (Orgrimmar - Kluft der Schatten "..yellow.."49,50"..white..")",
    Note = "Ihr findet Taragaman bei "..yellow.."[2]"..white..".",
}

--------------- Uldaman ---------------
kQuestInstanceData.Uldaman = {
    Story = "Uldaman ist ein uraltes Titanengewölbe, das seit der Erschaffung der Welt tief in der Erde vergraben liegt. Zwergische Ausgrabungen haben kürzlich diese vergessene Stadt durchdrungen und dabei die ersten gescheiterten Schöpfungen der Titanen freigesetzt: die Troggs. Legenden besagen, dass die Titanen Troggs aus Stein erschufen. Als sie das Experiment für gescheitert erklärten, sperrten die Titanen die Troggs weg und versuchten es erneut - was zur Erschaffung des Zwergenvolkes führte. Die Geheimnisse der Erschaffung der Zwerge sind auf den sagenumwobenen Scheiben von Norgannon festgehalten - massiven Titanenartefakten, die ganz unten in der antiken Stadt liegen. Kürzlich starteten die Dunkeleisenzwerge eine Reihe von Überfällen auf Uldaman, in der Hoffnung, die Scheiben für ihren feurigen Meister Ragnaros zu erbeuten. Die vergrabene Stadt wird jedoch von mehreren Wächtern beschützt - riesige Konstrukte aus lebendigem Stein, die alle unglücklichen Eindringlinge, die sie finden, zermalmen. Die Scheiben selbst werden von einem massiven, fühlenden Steinwächter namens Archaedas bewacht. Einige Gerüchte deuten sogar darauf hin, dass die steinhäutigen Vorfahren der Zwerge, die Irdenen, noch immer tief in den verborgenen Winkeln der Stadt verweilen.",
    Caption = "Uldaman",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Uldaman.Alliance[1] = {
    Title = "Ein Hoffnungsschimmer",
    Id = 721,
    Level = 35,
    Attain = 33,
    Aim = "Sucht Ausgrabungsleiter Roggendol und teilt ihm mit, dass Hammerzeh Grez noch am Leben ist.",
    Location = "Ausgrabungsleiter Roggendol (Ödland "..yellow.."53,43"..white..")",
    Note = "Die Vorquest beginnt bei der Zerknitterten Karte (Ödland "..yellow.."53,33"..white..").\nIhr findet Hammerzeh Grez bevor Ihr die Instanz betretet, bei "..yellow.."[1]"..white.." auf der Eingangskarte.",
    Prequest = "Ein Hoffnungsschimmer",
    Folgequest = "Amulett der Geheimnisse",
}
kQuestInstanceData.Uldaman.Alliance[2] = {
    Title = "Amulett der Geheimnisse",
    Id = 722,
    Level = 40,
    Attain = 35,
    Aim = "Sucht Hammerzehs Amulett und bringt es ihm nach Uldaman.",
    Location = "Hammerzeh Grez (Uldaman "..yellow.."[1] on Entrance Map"..white..").",
    Note = "Das Amulett droppt von Magregan Grubenschatten bei "..yellow.."[2] auf der Eingangskarte"..white..".",
    Prequest = "Ein Hoffnungsschimmer",
    Folgequest = "Ein Funken Hoffnung",
}
kQuestInstanceData.Uldaman.Alliance[3] = {
    Title = "Die verlorene Tafel des Willens",
    Id = 1139,
    Level = 45,
    Attain = 35,
    Aim = "Sucht die Tafel des Willens und bringt sie zu Berater Belgrum in Eisenschmiede.",
    Location = "Berater Belgrum (Eisenschmiede - Halle der Erforscher "..yellow.."77,10"..white..")",
    Note = "Die Tafel befindet sich bei "..yellow.."[8]"..white..".",
    Prequest = "Amulett der Geheimnisse -> Ein Botschafter des Bösen",
    Rewards = {
        Text = "Belohnung: ",
        { id = 6723 }, --Medal of Courage Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[4] = {
    Title = "Kraftsteine",
    Id = 2418,
    Level = 36,
    Attain = 30,
    Aim = "Bringt Riggelfuzz im Ödland 8 Kraftsteine aus Dentrium und 8 Kraftsteine aus An'Alleum.",
    Location = "Riggelfuzz (Ödland "..yellow.."42,52"..white..")",
    Note = "Die Steine können von allen Schattenschmiede-Gegnern vor und in der Instanz gefunden werden.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9522 }, --Energized Stone Circle Shield
        { id = 10358 }, --Duracin Bracers Wrist, Mail
        { id = 10359 }, --Everlast Boots Feet, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[5] = {
    Title = "Agmonds Schicksal",
    Id = 704,
    Level = 38,
    Attain = 30,
    Aim = "Bringt Ausgrabungsleiter Eisenband am Loch Modan 4 verzierte Steinurnen.",
    Location = "Ausgrabungsleiter Eisenband (Loch Modan - Eisenbands Ausgrabungsstätte "..yellow.."65,65"..white..")",
    Note = "Die Vorquest beginnt bei Ausgrabungsleiter Sturmlanze (Eisenschmiede - Halle der Erforscher "..yellow.."74,12"..white..").\nDie Urnen sind in den Höhlen vor der Instanz verstreut.",
    Prequest = "Eisenband sucht Euch! -> Murdaloc",
    Rewards = {
        Text = "Belohnung: ",
        { id = 4980 }, --Prospector Gloves Hands, Leather
    }
}
kQuestInstanceData.Uldaman.Alliance[6] = {
    Title = "Lösung der Verdammnis",
    Id = 709,
    Level = 40,
    Attain = 30,
    Aim = "Bringt Theldurin dem Verirrten die Schrifttafel von Ryun'eh.",
    Location = "Theldurin der Verirrte (Ödland "..yellow.."51,76"..white..")",
    Note = "Die Tafel befindet sich nördlich der Höhlen, am östlichen Ende eines Tunnels, vor der Instanz. Auf der Eingangskarte ist sie bei "..yellow.."[3]"..white..".",
    Folgequest = "Auf nach Eisenschmiede zu 'Yagyins Zusammenstellung'",
    Rewards = {
        Text = "Belohnung: ",
        { id = 4746 }, --Doomsayer's Robe Chest, Cloth
    }
}
kQuestInstanceData.Uldaman.Alliance[7] = {
    Title = "Die verschollenen Zwerge",
    Id = 2398,
    Level = 40,
    Attain = 35,
    Aim = "Sucht in Uldaman nach Baelog.",
    Location = "Ausgrabungsleiter Sturmlanze (Eisenschmiede - Halle der Erforscher "..yellow.."75,12"..white..")",
    Note = "Baelog ist bei "..yellow.."[1]"..white..".",
    Folgequest = "Die geheime Kammer",
}
kQuestInstanceData.Uldaman.Alliance[8] = {
    Title = "Die geheime Kammer",
    Id = 2240,
    Level = 40,
    Attain = 35,
    Aim = "Lest Baelogs Tagebuch, erforscht die geheime Kammer und erstattet dann Ausgrabungsleiter Sturmlanze Bericht.",
    Location = "Baelog (Uldaman "..yellow.."[1]"..white..")",
    Note = "Die geheime Kammer befindet sich bei "..yellow.."[4]"..white..". Um die Geheime Kammer zu öffnen, benötigt Ihr den Schaft von Tsol von Revelosh "..yellow.."[3]"..white.." und das Medaillon von Gni'kiv aus Baelogs Truhe "..yellow.."[1]"..white..". Kombiniert diese beiden Gegenstände zum Stab der Prähistorie. Der Stab wird im Kartenraum zwischen "..yellow.."[3] und [4]"..white.." benutzt, um Ironaya zu beschwören. Nachdem Ihr sie getötet habt, lauft in den Raum, aus dem sie kam, um die Quest abzuschließen.",
    Prequest = "Die verschollenen Zwerge",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9626 }, --Dwarven Charge Two-Hand, Axe
        { id = 9627 }, --Explorer's League Lodestar Held In Off-hand
    }
}
kQuestInstanceData.Uldaman.Alliance[9] = {
    Title = "Die zerrissene Halskette",
    Id = 2198,
    Level = 41,
    Attain = 37,
    Aim = "Sucht nach dem Erschaffer der zerrissenen Halskette, um etwas über ihren möglichen Wert zu erfahren.",
    Location = "Zerbrochene Halskette (zufälliger Drop in Uldaman)",
    Note = "Bringt die Halskette zu Talvash del Kissel (Eisenschmiede - Die Mystische Wacht "..yellow.."36,3"..white..").",
    Folgequest = "Lehren haben ihren Preis",
}
kQuestInstanceData.Uldaman.Alliance[10] = {
    Title = "Rückkehr nach Uldaman",
    Id = 2200,
    Level = 42,
    Attain = 37,
    Aim = "Sucht in Uldaman nach Hinweisen auf den momentanen Zustand von Talvashs Halskette. Der getötete Paladin, den Talvash erwähnte, hatte die Kette zuletzt.",
    Location = "Talvash del Kissel (Eisenschmiede - Die Mystische Wacht "..yellow.."36,3"..white..")",
    Note = "Der Paladin ist bei "..yellow.."[2]"..white..".",
    Prequest = "Lehren haben ihren Preis",
    Folgequest = "Suche nach den Edelsteinen",
}
kQuestInstanceData.Uldaman.Alliance[11] = {
    Title = "Suche nach den Edelsteinen",
    Id = 2201,
    Level = 43,
    Attain = 40,
    Aim = "Findet den Rubin, den Saphir und den Topas, die in ganz Uldaman verstreut sind. Wenn Ihr sie habt, wendet Euch aus der Ferne an Talvash del Kissel, indem Ihr die Wahrsagephiole nutzt, die er Euch zuvor gegeben hat.$B$BAus dem Tagebuch, wisst Ihr...$B* Der Rubin wurde in einer Bastion der Zwerge der Schattenschmiede versteckt.$B* Der Topas steckt in einer Urne in einem der Trogggebiete, in der Nähe einiger Zwerge der Allianz.$B$B* Der Saphir wurde von Grimlok, dem Anführer der Troggs, mitgenommen.",
    Location = "Überreste eines Paladins (Uldaman "..yellow.."[2]"..white..")",
    Note = "Die Edelsteine befinden sich bei "..yellow.."[1]"..white.." in einer Auffälligen Urne, bei "..yellow.."[8]"..white.." im Schattenschmiede-Versteck und bei "..yellow.."[9]"..white.." von Grimlok. Beachtet, dass beim Öffnen des Schattenschmiede-Verstecks einige Gegner spawnen und Euch angreifen.\nBenutzt Talvashs Wahrsageschale, um die Quest abzugeben und die Folgequest zu erhalten.",
    Prequest = "Rückkehr nach Uldaman",
    Folgequest = "Restaurierung der Halskette",
}
kQuestInstanceData.Uldaman.Alliance[12] = {
    Title = "Restaurierung der Halskette",
    Id = 2204,
    Level = 44,
    Attain = 37,
    Aim = "Besorgt Euch eine Kraftquelle vom mächtigsten Konstrukt, das Ihr in Uldaman finden könnt, und liefert sie bei Talvash del Kissel in Eisenschmiede ab.",
    Location = "Talvash's Scrying Bowl",
    Note = "Die Kraftquelle der zerrissenen Halskette droppt von Archaedas "..yellow.."[10]"..white..".",
    Prequest = "Suche nach den Edelsteinen",
    Rewards = {
        Text = "Belohnung: ",
        { id = 7673 }, --Talvash's Enhancing Necklace Neck
    }
}
kQuestInstanceData.Uldaman.Alliance[13] = {
    Title = "Reagenzsuche in Uldaman",
    Id = 17,
    Level = 42,
    Attain = 36,
    Aim = "Bringt zwölf Magentafunguskappen nach Thelsamar zu Ghak Heilsegen.",
    Location = "Ghak Heilsegen (Loch Modan - Thelsamar "..yellow.."37,49"..white..")",
    Note = "Die Kappen sind in der gesamten Instanz verstreut. Kräuterkundler können sie auf ihrer Minimap sehen, wenn Kräuter aufspüren aktiviert ist und sie die Quest haben.",
    Prequest = "Reagenziensuche im Ödland",
    Rewards = {
        Text = "Belohnung: ",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[14] = {
    Title = "Wiederbeschaffte Schätze",
    Id = 1360,
    Level = 43,
    Attain = 33,
    Aim = "Holt Krom Starkarms wertvollen Besitz aus seiner Truhe in der Nördlichen Bankenhalle von Uldaman und bringt den Schatz zu ihm nach Eisenschmiede.",
    Location = "Krom Starkarm (Eisenschmiede - Halle der Erforscher "..yellow.."74,9"..white..")",
    Note = "Ihr findet den Schatz bevor Ihr die Instanz betretet. Er befindet sich im Norden der Höhlen, am südöstlichen Ende des ersten Tunnels. Auf der Eingangskarte ist er bei "..yellow.."[4]"..white..".",
}
kQuestInstanceData.Uldaman.Alliance[15] = {
    Title = "Die Platinscheiben",
    Id = 2278,
    Level = 47,
    Attain = 40,
    Aim = "Sprecht mit dem Steinbehüter und findet heraus, welche uralten Lehren er aufbewahrt. Sobald Ihr alles erfahren habt, was er weiß, aktiviert die Scheiben von Norgannon.",
    Location = "Die Scheiben von Norgannon (Uldaman "..yellow.."[11]"..white..")",
    Note = "Nachdem Ihr die Quest erhalten habt, sprecht mit dem Steinwächter links von den Scheiben. Dann benutzt die Platinscheiben erneut, um Miniaturdiscs zu erhalten, die Ihr zu Hochforscher Magellas in Eisenschmiede - Halle der Erforscher ("..yellow.."69,18"..white..") bringen müsst. Die Folgequest startet bei einem anderen NPC in der Nähe.",
    Folgequest = "Omen von Uldum",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3",
        { id = 9587 }, --Thawpelt Sack Bag
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
    }
}
kQuestInstanceData.Uldaman.Alliance[16] = {
    Title = "Kraft in Uldaman",
    Id = 1956,
    Level = 40,
    Attain = 35,
    Aim = "Beschafft Euch eine Obsidiankraftquelle und bringt sie in die Düstermarschen zu Tabetha.",
    Location = "Tabetha (Düstermarschen "..yellow.."46,57"..white..")",
    Note = red.."Nur Magier"..white..": Die Obsidiankraftquelle droppt vom Obsidianwächter bei "..yellow.."[5]"..white..".",
    Prequest = "Die Austreibung",
    Folgequest = "Manawogen",
}
kQuestInstanceData.Uldaman.Alliance[17] = { --1.18
    Title = "Einen Kern stehlen",
    Id = 40129,
    Level = 45,
    Attain = 45,
    Aim = "Bringt einen Intakten Kraftkern aus Uldamans Antiken Schätzen zu Torble Funkenritzel ins südliche Brachland.",
    Location = "Torble Funkenritzel (Brachland "..yellow.."48.6,83"..white.." Gnom mit lila Brille unter dem Zelt, neben dem Zwerg)",
    Note = "Intakter Kraftkern "..yellow.."[11]"..white..", im Raum mit der Platinscheibe hinter dem letzten Boss in der Truhe hinter der rechten Säule.\nDie Questreihe beginnt im Südlichen Brachland -> Bael Modan -> ein wenig nördlich vom Pfad zu Burg Bael'dun unter dem Zelt. Die erste Quest kann auf Stufe 18 angenommen werden, die letzte auf Stufe 53.",
    Prequest = "Eine uralte Entdeckung",
    Folgequest = "Die Aktivierung",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}
kQuestInstanceData.Uldaman.Horde[1] = {
    Title = "Kraftsteine",
    Id = 2418,
    Level = 36,
    Attain = 30,
    Aim = "Bringt Riggelfuzz im Ödland 8 Kraftsteine aus Dentrium und 8 Kraftsteine aus An'Alleum.",
    Location = "Riggelfuzz (Ödland "..yellow.."42,52"..white..")",
    Note = "Die Steine können von allen Schattenschmiede-Gegnern vor und in der Instanz gefunden werden.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9522 }, --Energized Stone Circle Shield
        { id = 10358 }, --Duracin Bracers Wrist, Mail
        { id = 10359 }, --Everlast Boots Feet, Cloth
    }
}
kQuestInstanceData.Uldaman.Horde[2] = {
    Title = "Lösung der Verdammnis",
    Id = 709,
    Level = 40,
    Attain = 30,
    Aim = "Bringt Theldurin dem Verirrten die Schrifttafel von Ryun'eh.",
    Location = "Theldurin der Verirrte (Ödland "..yellow.."51,76"..white..")",
    Note = "Die Tafel befindet sich nördlich der Höhlen, am östlichen Ende eines Tunnels, vor der Instanz. Auf der Eingangskarte ist sie bei "..yellow.."[3]"..white..".",
    Folgequest = "Auf nach Eisenschmiede zu 'Yagyins Zusammenstellung'",
    Rewards = {
        Text = "Belohnung: ",
        { id = 4746 }, --Doomsayer's Robe Chest, Cloth
    }
}
kQuestInstanceData.Uldaman.Horde[3] = {
    Title = "Wiederbeschaffung der Halskette",
    Id = 2283,
    Level = 41,
    Attain = 37,
    Aim = "Sucht in der Grabungsstätte von Uldaman nach einer wertvollen Halskette und bringt sie nach Orgrimmar zu Dran Droffers. Die Halskette ist vielleicht beschädigt.",
    Location = "Dran Droffers (Orgrimmar - Der Schläfrige Drache "..yellow.."59,36"..white..")",
    Note = "Die Halskette ist ein zufälliger Drop in der Instanz.",
    Folgequest = "Wiederbeschaffung der Halskette, Teil 2",
}
kQuestInstanceData.Uldaman.Horde[4] = {
    Title = "Wiederbeschaffung der Halskette, Teil 2",
    Id = 2284,
    Level = 41,
    Attain = 37,
    Aim = "Sucht in den Tiefen von Uldaman nach einem Hinweis auf den Verbleib der Edelsteine.",
    Location = "Dran Droffers (Orgrimmar - Der Schläfrige Drache "..yellow.."59,36"..white..")",
    Note = "Der Paladin ist bei "..yellow.."[2]"..white..".",
    Prequest = "Wiederbeschaffung der Halskette",
    Folgequest = "Übersetzung des Tagebuchs",
}
kQuestInstanceData.Uldaman.Horde[5] = {
    Title = "Übersetzung des Tagebuchs",
    Id = 2318,
    Level = 42,
    Attain = 37,
    Aim = "Sucht jemanden, der das Tagebuch des Paladins übersetzen kann. Der nächstgelegene Ort, wo Ihr so jemanden finden könntet, ist Kargath im Ödland.",
    Location = "Überreste eines Paladins (Uldaman "..yellow.."[2]"..white..")",
    Note = "Der Übersetzer Jarkal Moosblut befindet sich in Kargath (Ödland "..yellow.."2,46"..white..").",
    Prequest = "Wiederbeschaffung der Halskette, Teil 2",
    Folgequest = "Findet die Edelsteine und die Kraftquelle",
}
kQuestInstanceData.Uldaman.Horde[6] = {
    Title = "Findet die Edelsteine und die Kraftquelle",
    Id = 2339,
    Level = 44,
    Attain = 37,
    Aim = "Beschafft in Uldaman alle drei Edelsteine sowie eine Kraftquelle für die Halskette und bringt sie anschließend zu Jarkal Moosblut nach Kargath. Jarkal glaubt, dass sich eine Kraftquelle vielleicht im stärksten Konstrukt in Uldaman findet.$B$BAus dem Tagebuch, wisst Ihr...$B* Der Rubin wurde in einer Bastion der Zwerge der Schattenschmiede versteckt.$B* Der Topas steckt in einer Urne in einem der Trogggebiete, in der Nähe einiger Zwerge der Allianz.$B* Der Saphir wurde von Grimlok, dem Anführer der Troggs, mitgenommen.",
    Location = "Jarkal Moosblut (Ödland - Kargath "..yellow.."2,46"..white..")",
    Note = "Die Edelsteine befinden sich bei "..yellow.."[1]"..white.." in einer Auffälligen Urne, bei "..yellow.."[8]"..white.." im Schattenschmiede-Versteck und bei "..yellow.."[9]"..white.." von Grimlok. Beachtet, dass beim Öffnen des Schattenschmiede-Verstecks einige Gegner spawnen und Euch angreifen. Die Kraftquelle der zerrissenen Halskette droppt von Archaedas "..yellow.."[10]"..white..".",
    Prequest = "Übersetzung des Tagebuchs",
    Folgequest = "Ablieferung der Edelsteine",
    Rewards = {
        Text = "Belohnung: ",
        { id = 7888 }, --Jarkal's Enhancing Necklace Neck
    }
}
kQuestInstanceData.Uldaman.Horde[7] = {
    Title = "Reagenzsuche in Uldaman",
    Id = 2202,
    Level = 42,
    Attain = 36,
    Aim = "Bringt zwölf Magentafunguskappen nach Thelsamar zu Ghak Heilsegen.",
    Location = "Jarkal Moosblut (Ödland - Kargath "..yellow.."2,69"..white..")",
    Note = "Die Vorquest bekommt Ihr auch von Jarkal Moosblut.\nDie Kappen sind in der gesamten Instanz verstreut. Kräuterkundler können sie auf ihrer Minimap sehen, wenn Kräuter aufspüren aktiviert ist und sie die Quest haben.",
    Prequest = "Reagenziensuche im Ödland",
    Folgequest = "Reagenziensuche im Ödland II",
    Rewards = {
        Text = "Belohnung: ",
        { id = 9030, quantity = 5 }, --Restorative Potion Potion
    }
}
kQuestInstanceData.Uldaman.Horde[8] = {
    Title = "Wiederbeschaffte Schätze",
    Id = 2342,
    Level = 43,
    Attain = 33,
    Aim = "Holt Krom Starkarms wertvollen Besitz aus seiner Truhe in der Nördlichen Bankenhalle von Uldaman und bringt den Schatz zu ihm nach Eisenschmiede.",
    Location = "Patrick Garrett (Unterstadt "..yellow.."72,48"..white..")",
    Note = "Ihr findet den Schatz bevor Ihr die Instanz betretet. Er befindet sich am Ende des südlichen Tunnels. Auf der Eingangskarte ist er bei "..yellow.."[5]"..white..".",
}
kQuestInstanceData.Uldaman.Horde[9] = createInheritedQuest(
    kQuestInstanceData.Uldaman.Alliance[15],
    {
        Aim = "Sprecht mit dem Steinbehüter und findet heraus, welche uralten Lehren er aufbewahrt. Sobald Ihr alles erfahren habt, was er weiß, aktiviert die Scheiben von Norgannon.",
        Note = "Nachdem Ihr die Quest erhalten habt, sprecht mit dem Steinwächter links von den Scheiben. Dann benutzt die Platinscheiben erneut, um Miniaturdiscs zu erhalten, die Ihr zu Weiser Wahrspruch in Donnerfels ("..yellow.."34,46"..white..") bringen müsst. Die Folgequest startet bei einem anderen NPC in der Nähe.",
    }
)

kQuestInstanceData.Uldaman.Horde[10] = kQuestInstanceData.Uldaman.Alliance[16]
kQuestInstanceData.Uldaman.Horde[11] = {
    Title = "Einen Kern requirieren",
    Id = 40131,
    Level = 45,
    Attain = 45,
    Aim = "Bringt einen Intakten Kraftkern aus Uldamans Antiken Schätzen zu Kex Knallspreng ins südliche Brachland.",
    Location = "Kex Knallspreng (Brachland "..yellow.."45.7,83.6"..white.." Goblin unter dem Zelt)",
    Note = "Intakter Kraftkern "..yellow.."[11]"..white..", im Raum mit der Platinscheibe hinter dem letzten Boss in der Truhe hinter der rechten Säule.\nDie Questreihe beginnt im Südlichen Brachland -> Bael Modan -> westliche Seite der Straße zu Den Tausend Nadeln, gegenüber der Bael Modan Ausgrabungsstätte. Die erste Quest kann auf Stufe 18 angenommen werden, die letzte auf Stufe 53.",
    Prequest = "Eine lohnende Entdeckung",
    Folgequest = "Die gewinnbringende Aktivierung",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60518 }, --Broken Core Pendant Neck
    }
}

--------------- Blackrock Depths ---------------
kQuestInstanceData.BlackrockDepths = {
    Story = "Einst die Hauptstadt der Dunkeleisenzwerge, dient dieses vulkanische Labyrinth nun als Machtsitz für Ragnaros den Feuerfürsten. Ragnaros hat das Geheimnis entdeckt, Leben aus Stein zu erschaffen, und plant, eine Armee unaufhaltsamer Golems zu bauen, um ihm bei der Eroberung des gesamten Schwarzfelsbergs zu helfen. Besessen davon, Nefarian und seine drachischen Schergen zu besiegen, wird Ragnaros bis zum Äußersten gehen, um den endgültigen Sieg zu erringen.",
    Caption = "Schwarzfelstiefen",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockDepths.Alliance[1] = {
    Title = "Dunkeleisenerbe",
    Id = 3802,
    Level = 52,
    Attain = 48,
    Aim = "Sprecht mit Franclorn Schmiedevater bei Schmiedevaters Grabmal im Schwarzfels, wenn Ihr daran interessiert seid, einen Schlüssel für die Hauptstadt zu erhalten.",
    Location = "Franclorn Schmiedevater (Der Schwarzfels "..yellow.."[3] on Entrance map"..white..")",
    Note = "Franclorn befindet sich in der Mitte des Schwarzfels, über seinem Grab. Ihr müsst tot sein, um ihn zu sehen! Sprecht 2 Mal mit ihm, um die Quest zu starten.\nFineous Dunkelglut ist bei "..yellow.."[9]"..white..". Ihr findet den Schrein neben der Arena "..yellow.."[7]"..white..".",
    Prequest = "Dunkeleisenerbe",
    Rewards = {
        Text = "Belohnung: ",
        { id = 11000 }, --Shadowforge Key Key
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[2] = {
    Title = "Ribbly Schraubstutz",
    Id = 4136,
    Level = 53,
    Attain = 48,
    Aim = "Bringt Yuka Schraubstutz in der Brennenden Steppe Ribblys Kopf.",
    Location = "Yuka Schraubstutz (Brennende Steppe - Flammenkamm "..yellow.."65,22"..white..")",
    Note = "Die Vorquest bekommt Ihr von Yorba Schraubstutz (Tanaris - Dampfdruckpier "..yellow.."67,23"..white..").\nRibbly ist bei "..yellow.."[15]"..white..".",
    Prequest = "Yuka Schraubstutz",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 11865 }, --Rancor Boots Feet, Cloth
        { id = 11963 }, --Penance Spaulders Shoulder, Leather
        { id = 12049 }, --Splintsteel Armor Chest, Mail
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[3] = {
    Title = "Der Liebestrank",
    Id = 4201,
    Level = 54,
    Attain = 50,
    Aim = "Bringt 4 Gromsblut-Kräuter, 10 Riesensilbervenen und Nagmaras gefüllte Phiole zu Herrin Nagmara in den Schwarzfelstiefen.",
    Location = "Herrin Nagmara (Schwarzfelstiefen "..yellow.."[15]"..white..")",
    Note = "Die Riesigen Silberadern bekommt Ihr von Riesen in Azshara. Gromsblut kann am einfachsten von einem Kräuterkundler oder im Auktionshaus erworben werden. Schließlich kann die Phiole am Go-Lakka-Krater gefüllt werden (Krater von Un'Goro "..yellow.."31,50"..white..").\nNach Abschluss der Quest könnt Ihr die Hintertür benutzen, anstatt Phalanx zu töten.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 11962 }, --Manacle Cuffs Wrist, Cloth
        { id = 11866 }, --Nagmara's Whipping Belt Waist, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[4] = {
    Title = "Hurley Pestatem",
    Id = 4126,
    Level = 55,
    Attain = 50,
    Aim = "Bringt Ragnar Donnerbräu in Kharanos das gestohlene Donnerbräurezept.",
    Location = "Ragnar Donnerbräu  (Dun Morogh - Kharanos "..yellow.."46,52"..white..")",
    Note = "Die Vorquest bekommt Ihr von Enohar Donnerbräu (Verwüstete Lande - Burg Nethergarde "..yellow.."61,18"..white..").\nIhr bekommt das Rezept von einem der Wachen, die erscheinen, wenn Ihr das Bier zerstört "..yellow.."[15]"..white..".",
    Prequest = "Ragnar Donnerbräu",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3",
        { id = 12003, quantity = 10 }, --Dark Dwarven Lager Potion
        { id = 11964 }, --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 }, --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[5] = {
    Title = "Incendius!",
    Id = 4263,
    Level = 56,
    Attain = 48,
    Aim = "Sucht Lord Incendius in den Schwarzfelstiefen und vernichtet ihn!",
    Location = "Jalinda Sprig (Brennende Steppe - Morgans Wacht "..yellow.."85,69"..white..")",
    Note = "Die Vorquest bekommt Ihr auch von Jalinda Sprig. Ihr findet Lord Incendius bei "..yellow.."[10]"..white..".",
    Prequest = "Übermeister Pyron",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12113 }, --Sunborne Cape Back
        { id = 12114 }, --Nightfall Gloves Hands, Leather
        { id = 12112 }, --Crypt Demon Bracers Wrist, Mail
        { id = 12115 }, --Stalwart Clutch Waist, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[6] = {
    Title = "Das Herz des Berges",
    Id = 4123,
    Level = 55,
    Attain = 50,
    Aim = "Bringt das 'Herz des Berges' zu Maxwort Funkelglanz in der Brennenden Steppe.",
    Location = "Maxwort Funkelglanz (Brennende Steppe - Flammenkamm "..yellow.."65,23"..white..")",
    Note = "Ihr findet das Herz bei "..yellow.."[8]"..white.." in einem Safe. Den Schlüssel für den Safe bekommt Ihr von Aufseher Stillgiss. Er erscheint, nachdem alle kleinen Safes geöffnet wurden.",
}
kQuestInstanceData.BlackrockDepths.Alliance[7] = {
    Title = "Das gute Zeug",
    Id = 4286,
    Level = 56,
    Attain = 50,
    Aim = "Beschafft Euch 20 Dunkeleisengürteltaschen.",
    Location = "Oralius (Brennende Steppe - Morgans Wacht "..yellow.."84,68"..white..")",
    Note = "Alle Zwerge können die Taschen fallen lassen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 11883 }, --A Dingy Fanny Pack Container
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[8] = {
    Title = "Marschall Windsor",
    Id = 4241,
    Level = 54,
    Attain = 48,
    Aim = "Reist zum Schwarzfels im Nordwesten und dann weiter zu den Schwarzfelstiefen. Findet heraus, was aus Marschall Windsor geworden ist.$B$BIhr erinnert Euch daran, dass der struppige John sagte, man hätte Windsor in ein Gefängnis verschleppt.",
    Location = "Marschall Maxwell (Brennende Steppe - Morgans Wacht "..yellow.."84,68"..white..")",
    Note = "Dies ist Teil der Onyxia-Einstimmungsquestreihe. Sie beginnt bei Helendis Flusshorn (Brennende Steppe - Morgans Wacht "..yellow.."85,68"..white..").\nMarschall Windsor ist bei "..yellow.."[4]"..white..". Ihr müsst nach Abschluss dieser Quest zu Maxwell zurückkehren.",
    Prequest = "Drachkin-Bedrohung -> Die wahren Meister",
    Folgequest = "Verlorene Hoffnung",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12018 }, --Conservator Helm Head, Mail
        { id = 12021 }, --Shieldplate Sabatons Feet, Plate
        { id = 12041 }, --Windshear Leggings Legs, Leather
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[9] = {
    Title = "Eine zusammengeknüllte Notiz",
    Id = 4264,
    Level = 58,
    Attain = 50,
    Aim = "Soeben seid Ihr auf etwas gestoßen, das Marschall Windsor mit Sicherheit sehr interessiert. Vielleicht besteht ja doch noch Hoffnung.",
    Location = "Eine zusammengeknüllte Notiz (zufälliger Drop in Schwarzfelstiefen)",
    Note = "Dies ist Teil der Onyxia-Einstimmungsquestreihe. Marschall Windsor ist bei "..yellow.."[4]"..white..". Die beste Chance auf Drops scheinen die Dunkeleisen-Gegner um den Steinbruch zu sein.",
    Prequest = "Verlorene Hoffnung",
    Folgequest = "Ein Funken Hoffnung",
}
kQuestInstanceData.BlackrockDepths.Alliance[10] = {
    Title = "Ein Funken Hoffnung",
    Id = 4282,
    Level = 58,
    Attain = 50,
    Aim = "Holt Marschall Windsors verloren gegangene Informationen zurück.$B$BMarschall Windsor glaubt, dass sich die Informationen in den Händen des Golemlords Argelmach und des Generals Zornesschmied befinden.",
    Location = "Marschall Windsor (Schwarzfelstiefen "..yellow.."[4]"..white..")",
    Note = "Dies ist Teil der Onyxia-Einstimmungsquestreihe. Marschall Windsor ist bei "..yellow.."[4]"..white..".\nIhr findet Golemlord Argelmach bei "..yellow.."[14]"..white..", General Zornesschmied bei "..yellow.."[13]"..white..".",
    Prequest = "Eine zusammengeknüllte Notiz",
    Folgequest = "Gefängnisausbruch!",
}
kQuestInstanceData.BlackrockDepths.Alliance[11] = {
    Title = "Gefängnisausbruch!",
    Id = 4322,
    Level = 58,
    Attain = 50,
    Aim = "Helft Marschall Windsor, seine Ausrüstung zurückzuholen und seine Freunde zu befreien. Kehrt zu Marschall Maxwell zurück, wenn Ihr Erfolg hattet.",
    Location = "Marschall Windsor (Schwarzfelstiefen "..yellow.."[4]"..white..")",
    Note = "Dies ist Teil der Onyxia-Einstimmungsquestreihe. Marschall Windsor ist bei "..yellow.."[4]"..white..".\nDie Quest ist einfacher, wenn Ihr den Ring des Gesetzes ("..yellow.."[6]"..white..") und den Weg zum Eingang säubert, bevor Ihr das Ereignis startet. Ihr findet Marschall Maxwell in Brennende Steppe - Morgans Wacht ("..yellow.."84,68"..white..")",
    Prequest = "Ein Funken Hoffnung",
    Folgequest = "Treffen in Sturmwind",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3",
        { id = 12065 }, --Ward of the Elements Trinket
        { id = 12061 }, --Blade of Reckoning One-Hand, Sword
        { id = 12062 }, --Skilled Fighting Blade One-Hand, Dagger
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[12] = {
    Title = "Eine Kostprobe der Flamme",
    Id = 4024,
    Level = 58,
    Attain = 52,
    Aim = "Zeigt Cyrus Therepentous die abgestreifte Haut des schwarzen Drachenschwarms, die Ihr von Kalaran Windklinge erhalten habt.",
    Location = "Cyrus Therepentous (Brennende Steppe "..yellow.."94,31"..white..")",
    Note = "Die Questreihe beginnt bei Kalaran Windklinge (Sengende Schlucht "..yellow.."39,38"..white..").\nBael'Gar ist bei "..yellow.."[11]"..white..".",
    Prequest = "Die fehlerlose Flamme -> Eine Kostprobe der Flamme",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[13] = {
    Title = "Kharan Hammermacht",
    Id = 4341,
    Level = 59,
    Attain = 50,
    Aim = "Begebt Euch in die Schwarzfelstiefen und findet Kharan Hammermacht.$B$BDer König erwähnte, dass Kharan dort gefangen sei - vielleicht solltet Ihr nach einem Gefängnis Ausschau halten.",
    Location = "König Magni Bronzebart (Eisenschmiede "..yellow.."39,55"..white..")",
    Note = "Die Vorquest beginnt bei Königliche Historikerin Archesonus (Eisenschmiede "..yellow.."38,55"..white.."). Kharan Hammermacht ist bei "..yellow.."[2]"..white..".",
    Prequest = "Die glimmenden Ruinen von Thaurissan",
    Folgequest = "Kharans Geschichte",
}
kQuestInstanceData.BlackrockDepths.Alliance[14] = {
    Title = "Das Schicksal des Königreichs",
    Id = 4362,
    Level = 59,
    Attain = 50,
    Aim = "Kehrt in die Schwarzfelstiefen zurück und rettet Prinzessin Moira Bronzebart aus den Fängen des bösen Imperators Dagran Thaurissan.",
    Location = "König Magni Bronzebart (Eisenschmiede "..yellow.."39,55"..white..")",
    Note = "Prinzessin Moira Bronzebart ist bei "..yellow.."[21]"..white..". Während des Kampfes könnte sie Dagran heilen. Versucht, sie so oft wie möglich zu unterbrechen, aber beeilt Euch, da sie nicht sterben darf oder Ihr die Quest nicht abschließen könnt! Nachdem Ihr mit ihr gesprochen habt, müsst Ihr zu Magni Bronzebart zurückkehren.",
    Prequest = "Der Überbringer schlechter Botschaften...",
    Folgequest = "Die Überraschung der Prinzessin",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12548 }, --Magni's Will Ring
        { id = 12543 }, --Songstone of Ironforge Ring
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[15] = {
    Title = "Abstimmung mit dem Kern",
    Id = 7848,
    Level = 60,
    Attain = 55,
    Aim = "Begebt Euch zum Portal in den Schwarzfelstiefen, das in den Geschmolzenen Kern führt, und findet ein Kernfragment. Kehrt mit dem Fragment zu Lothos Felsspalter im Schwarzfels zurück.",
    Location = "Lothos Felsspalter (Der Schwarzfels "..yellow.."[2] on Entrance Map"..white..")",
    Note = "Nach Abschluss dieser Quest könnt Ihr den Stein neben Lothos Felsspalter benutzen, um den Geschmolzenen Kern zu betreten.\nIhr findet das Kernfragment nahe "..yellow.."[23]"..white..", ganz in der Nähe des Portals zum Geschmolzenen Kern.",
}
kQuestInstanceData.BlackrockDepths.Alliance[16] = {
    Title = "Die Herausforderung",
    Id = 9015,
    Level = 60,
    Attain = 58,
    Aim = "Reist zum Ring des Gesetzes der Schwarzfelstiefen und errichtet das Banner der Provokation in dessen Mitte, während Ihr von Oberrichter Grimmstein verurteilt werdet. Tötet Theldren und seine Gladiatoren und kehrt dann mit dem ersten Stück von Lord Valthalaks Amulett zu Anthion Harmon in den Östlichen Pestländern zurück.",
    Location = "Falrin Rankenweber (Düsterbruch West "..yellow.."[1] Library"..white..")",
    Note = "Die Folgequest ist für jede Klasse unterschiedlich. Die gesamte Questreihe beginnt mit der Quest 'Ein aufrichtiges Angebot' von Deliana im Königsraum von Eisenschmiede hinter der Bank.",
    Prequest = "Die Verzauberung des Aufhetzers",
    Folgequest = "(Class Quests)",
}
kQuestInstanceData.BlackrockDepths.Alliance[17] = {
    Title = "Der spektrale Kelch",
    Id = 4083,
    Level = 55,
    Attain = 40,
    Aim = "Die Edelsteine machen kein Geräusch, wenn sie in die Tiefen des Kelches fallen...",
    Location = "Dunk'rel (Schwarzfelstiefen "..yellow.."[18]"..white..")",
    Note = red.."Nur Bergleute mit Fertigkeit 230 oder höher können diese Quest annehmen, um Dunkeleisen verhütten zu lernen."..white.." Materialien für den Kelch: 2 [Sternrubin], 20 [Goldbarren], 10 [Echtsilberbarren]. Danach könnt Ihr, wenn Ihr [Dunkeleisenerz] habt, zur Schwarzen Schmiede bei "..yellow.."[22]"..white.." gehen und es verhütten.",
}
kQuestInstanceData.BlackrockDepths.Alliance[18] = {
    Title = "Operation Hilfe für Jabbey",
    Id = 40757,
    Level = 58,
    Attain = 50,
    Aim = "Wagt Euch in die Schwarzfelstiefen und holt den 'Extrem potenten Schnupftabak' von Darneg Dunkelbart nahe der Residenz für Jabbey am Dampfdruckpier in Tanaris.",
    Location = "Stupser (Tanaris, Dampfdruckpier "..yellow.."67,24"..white..")",
    Note = "Die Questreihe beginnt bei Bixxle Schraubsicherung (Tel'Abim "..yellow.."52,34"..white.."). Droppt von Darneg Dunkelbart. Belohnungen von der Quest Operation Letzte Reparaturen (Halsketten) und der finalen Quest - Der Dunkeleisen Schänder (Gewehr).",
    Prequest = "Operation Schraubfunke 1000 -> Operation REPARATUR Schraubfunke 1000",
    Folgequest = "Operation Hilfe für Jabbey 2 -> Operation Rückkehr zu Schraubfunke -> Operation Letzte Reparaturen -> Geheimnisse des Dunkeleisen Schänders -> Der Dunkeleisen Schänder",
    Rewards = {
        Text = "Belohnung: 1 oder 2 und 3",
        { id = 60996 }, --Bixxle's Necklace of Control Neck
        { id = 60997 }, --Bixxle's Necklace of Mastery Neck
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[19] = {
    Title = "Der Dunkeleisen Schänder",
    Id = 40762,
    Level = 60,
    Attain = 55,
    Aim = "Sammelt ein Dunkeleisengewehr, einen Magmakondensator, einen Komplexen Arkanitlauf und ein Geschmolzenes Fragment für Bixxle Schraubsicherung in Bixxles Lagerhaus auf Tel'Abim.",
    Location = "Bixxle Schraubsicherung (Tel'Abim-Insel östlich von Tanaris)",
    Note = "Diese Quest erfordert das Sammeln von 4 Gegenständen.\n1) Magmakondensator (Schwarzfelstiefen in Magmakondensator-Kiste)\n2) Komplexer Arkanitlauf (Schwarzfelsspitze im Behälter für komplexe Arkanitläufe)\n3) Geschmolzenes Fragment (Geschmolzener Kern von Geschmolzener Zerstörer)\n4) Dunkeleisengewehr (von Ingenieuren hergestellt).\nUm die Konstruktion abzuschließen, benötige ich auch Feuerkern (x3) im Geschmolzenen Kern und Verzauberte Thoriumbarren (x10).",
    Prequest = "Operation Hilfe für Jabbey -> Geheimnisse des Dunkeleisen Schänders",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[20] = {
    Title = "Rache des Senats",
    Id = 40464,
    Level = 56,
    Attain = 45,
    Aim = "Tötet 25 Schattenschmiede-Senatoren tief in den Schwarzfelstiefen für Orvak Sternfels am Schwarzfelspass in der Brennenden Steppe.",
    Location = "Orvak Sternfels (nach Rotkammgebirge - Brennende Steppe-Pass "..yellow.."76,68"..white..", westlich vom Allianzlager)",
    Note = "Diese Questreihe beginnt bei Radgan Tiefenbrand neben Orvak Sternfels mit der Quest 'Orvaks Vertrauen gewinnen'.",
    Prequest = "Orvaks Vertrauen gewinnen -> Orvaks Geschichte anhören -> Das Versteck von Felsgrim",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60668 }, --Badge of Shadowforge Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[21] = {
    Title = "Der arkane Golemkern",
    Id = 40467,
    Level = 55,
    Attain = 45,
    Aim = "Findet und sammelt einen Arkanen Golemkern von Golemlord Argelmach in den Schwarzfelstiefen und kehrt zu Radgan Tiefenbrand am Schwarzfelspass in der Brennenden Steppe zurück.",
    Location = "Radgan Tiefenbrand (nach Rotkammgebirge - Brennende Steppe-Pass "..yellow.."76,68"..white..", westlich vom Allianzlager)",
    Note = "Diese Questreihe beginnt bei Radgan Tiefenbrand neben Orvak Sternfels mit der Quest 'Orvaks Vertrauen gewinnen'.",
    Prequest = "Orvaks Vertrauen gewinnen -> Orvaks Geschichte anhören -> Das Versteck von Felsgrim -> Golemgeheimnisse aufdecken -> Geheime Informationen kaufen",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60672 }, --Energized Golem Core Trinket
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[22] = {
    Title = "Einen Stampfer bauen",
    Id = 80401,
    Level = 60,
    Attain = 30,
    Aim = "Beschafft den thoriumjustierten Servomechanismus aus der Waffenkammer des Scharlachroten Klosters, besorgt den perfekten Golemkern bei Golemlord Argelmach in den Schwarzfelstiefen und findet die Adamantitrute in Stratholme. Kehrt danach zu Oglethorpe Obnoticus zurück.",
    Location = "Glotz Widrikus <Master Gnomeningenieur> (Schlingendorntal; Beutebucht "..yellow.."28.4,76.3"..white..").",
    Note = red.."(Nur Ingenieure)"..white.."Diese Quest erfordert das Sammeln von 3 Gegenständen.\n1) Thoriumjustierter Servomechanismus (Das Scharlachrote Kloster von Scharlachroter Myrmidon)\n2) Perfekter Golemkern (Schwarzfelstiefen von Golemlord Argelmach)\n3) Adamantitstab (Stratholme von Auferstandener Hammerschmied)\n'Meuteverprügler 9-60' in Gnomeregan lässt 'Intaktes Stampfer-Hauptgehirn' fallen, das die Vorquest 'Ein pulsierendes Gehirn' startet.",
    Prequest = "Ein pulsierendes Gehirn"..red.."(Engineers only)", --80398
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 81253 }, --Reinforced Red Pounder Mount
        { id = 81252 }, --Reinforced Green Pounder Mount
        { id = 81251 }, --Reinforced Blue Pounder Mount
        { id = 81250 }, --Reinforced Black Pounder Mount
    }
}
kQuestInstanceData.BlackrockDepths.Alliance[23] = {
    Title = "Winterhauch Gebräu",
    Id = 40748,
    Level = 55,
    Attain = 45,
    Aim = "Holt das Winterhauchfass in den Höhlen der Schwarzfelstiefen für Bomarn Feueraxt im Winterhauchtal.",
    Location = "Bomarn Feueraxt at Winterhauchtal",
    Note = red.."NUR VERFÜGBAR während des Winterhauch-Feiertagsereignisses!"..white.."Diese hinterlistigen Dunkeleisen haben es gestohlen, zweifellos versteckt in ihrer Taverne "..yellow.."[15]"..white.." tief in den Schwarzfelstiefen.",
}
for i = 1, 3 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end
kQuestInstanceData.BlackrockDepths.Horde[4] = {
    Title = "Verlorenes Donnerbräurezept",
    Id = 4134,
    Level = 55,
    Attain = 50,
    Aim = "Bringt Vivian Lagrave in Kargath das gestohlene Donnerbräurezept.",
    Location = "Schattenmagierin Vivian Lagrave (Ödland - Kargath "..yellow.."2,47"..white..")",
    Note = "Die Vorquest bekommt Ihr von Apothekerin Zinge in Unterstadt - Das Apothekarium ("..yellow.."50,68"..white..").\nIhr bekommt das Rezept von einem der Wachen, die erscheinen, wenn Ihr das Bier zerstört "..yellow.."[15]"..white..".",
    Prequest = "Vivian Lagrave",
    Rewards = {
        Text = "Belohnung: 1 und 2 und 3 oder 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 11964 }, --Swiftstrike Cudgel Main Hand, Mace
        { id = 12000 }, --Limb Cleaver Two-Hand, Axe
    }
}
kQuestInstanceData.BlackrockDepths.Horde[5] = {
    Title = "Das Herz des Berges",
    Id = 4123,
    Level = 55,
    Attain = 50,
    Aim = "Bringt das 'Herz des Berges' zu Maxwort Funkelglanz in der Brennenden Steppe.",
    Location = "Maxwort Funkelglanz (Brennende Steppe - Flammenkamm "..yellow.."65,23"..white..")",
    Note = "Ihr findet das Herz bei "..yellow.."[8]"..white.." in einem Safe. Den Schlüssel für den Safe bekommt Ihr von Aufseher Stillgiss. Er erscheint, nachdem alle kleinen Safes geöffnet wurden.",
}
kQuestInstanceData.BlackrockDepths.Horde[6] = {
    Title = "SOFORT TÖTEN: Dunkeleisenzwerge",
    Id = 4081,
    Level = 52,
    Attain = 48,
    Aim = "Begebt Euch in die Schwarzfelstiefen und vernichtet die üblen Aggressoren!$B$BKriegsherr Bluthauer möchte, dass Ihr 15 Gardisten der Zorneshämmer, 10 Aufseher der Zorneshämmer und 5 Fußsoldaten der Zorneshämmer tötet. Kehrt zu ihm zurück, sobald Ihr die Aufgabe erfüllt habt.",
    Location = "Sign Post (Ödland - Kargath "..yellow.."3,47"..white..")",
    Note = "Ihr findet die Zwerge im ersten Teil der Schwarzfelstiefen.\nIhr findet Kriegsherr Bluthauer in Kargath oben im Turm (Ödland, "..yellow.."5,47"..white..").",
    Folgequest = "SOFORT TÖTEN: Hochrangige Führungskräfte der Dunkeleisenzwerge",
}
kQuestInstanceData.BlackrockDepths.Horde[7] = {
    Title = "SOFORT TÖTEN: Hochrangige Führungskräfte der Dunkeleisenzwerge",
    Id = 4082,
    Level = 54,
    Attain = 50,
    Aim = "Begebt Euch in die Schwarzfelstiefen und vernichtet die üblen Aggressoren!$B$BKriegsherr Bluthauer möchte, dass Ihr 10 Sanitäter der Zorneshämmer, 10 Soldaten der Zorneshämmer und 10 Offiziere der Zorneshämmer tötet. Kehrt zu ihm zurück, sobald Ihr die Aufgabe erfüllt habt.",
    Location = "Sign Post (Ödland - Kargath "..yellow.."3,47"..white..")",
    Note = "Ihr findet die Zwerge nahe Bael'Gar "..yellow.."[11]"..white..". Ihr findet Kriegsherr Bluthauer in Kargath oben im Turm (Ödland, "..yellow.."5,47"..white..").\nDie Folgequest beginnt bei Lexlort (Ödland - Kargath "..yellow.."5,47"..white.."). Ihr findet Grark Lorkrub in der Brennenden Steppe ("..yellow.."38,35"..white.."). Ihr müsst sein Leben unter 50% senken, um ihn zu binden und eine Eskortquest zu starten.",
    Prequest = "SOFORT TÖTEN: Dunkeleisenzwerge",
    Folgequest = "Grark Lorkrub -> Gefährliche Zwickmühle (Escort quest)",
}
kQuestInstanceData.BlackrockDepths.Horde[8] = {
    Title = "Operation: Tod dem Zornesschmied",
    Id = 4132,
    Level = 58,
    Attain = 52,
    Aim = "Begebt Euch zu den Schwarzfelstiefen und eliminiert General Zornesschmied! Kehrt zum Kriegsherrn Bluthauer zurück, sobald Ihr diese Aufgabe erledigt habt.",
    Location = "Kriegsherr Bluthauer (Ödland - Kargath "..yellow.."5,47"..white..")",
    Note = "Ihr findet General Zornesschmied bei "..yellow.."[13]"..white..". Er ruft Hilfe unter 30%!\nDie Questreihe beginnt bei Lexlort (Ödland - Kargath, auf dem Turm) mit der Quest 'Grark Lorkrub'.",
    Prequest = "Grark Lorkrub -> Gefährliche Zwickmühle",
    Rewards = {
        Text = "Belohnung: ",
        { id = 12059 }, --Conqueror's Medallion Neck
    }
}
kQuestInstanceData.BlackrockDepths.Horde[9] = {
    Title = "Aufstieg der Maschinen",
    Id = 4063,
    Level = 58,
    Attain = 52,
    Aim = "Begebt Euch in die Brennende Steppe und beschafft für Theodora Mulvadania 10 gerissene Elementarsplitter.$B$BEuch fällt ein, dass Theodora gesagt hat, die Golems und Elementare in der Gegend seien eine gute Quelle für solche Splitter.",
    Location = "Lotwil Veriatus (Ödland "..yellow.."25,44"..white..")",
    Note = "Die Vorquest bekommt Ihr von Hierophantin Theodora Mulvadania (Ödland - Kargath "..yellow.."3,47"..white..").\nIhr findet Argelmach bei "..yellow.."[14]"..white..".",
    Prequest = "Aufstieg der Maschinen",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12109 }, --Azure Moon Amice Back
        { id = 12110 }, --Raincaster Drape Back
        { id = 12108 }, --Basaltscale Armor Chest, Mail
        { id = 12111 }, --Lavaplate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockDepths.Horde[10] = {
    Title = "Eine Kostprobe der Flamme",
    Id = 4024,
    Level = 58,
    Attain = 52,
    Aim = "Zeigt Cyrus Therepentous die abgestreifte Haut des schwarzen Drachenschwarms, die Ihr von Kalaran Windklinge erhalten habt.",
    Location = "Cyrus Therepentous (Brennende Steppe "..yellow.."94,31"..white..")",
    Note = "Die Questreihe beginnt bei Kalaran Windklinge (Sengende Schlucht "..yellow.."39,38"..white..").\nBael'Gar ist bei "..yellow.."[11]"..white..".",
    Prequest = "Die fehlerlose Flamme -> Eine Kostprobe der Flamme",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12066 }, --Shaleskin Cape Back
        { id = 12082 }, --Wyrmhide Spaulders Shoulder, Leather
        { id = 12083 }, --Valconian Sash Waist, Cloth
    }
}
kQuestInstanceData.BlackrockDepths.Horde[11] = {
    Title = "Disharmonie des Feuers",
    Id = 3907,
    Level = 56,
    Attain = 48,
    Aim = "Betretet die Schwarzfelstiefen und spürt Lord Incendius auf. Tötet ihn und bringt jegliche Informationsquelle, die Ihr finden könnt, zu Donnerherz.",
    Location = "Donnerherz (Ödland - Kargath "..yellow.."3,48"..white..")",
    Note = "Die Vorquest bekommt Ihr auch von Donnerherz.\nIhr findet Lord Incendius bei "..yellow.."[10]"..white..".",
    Prequest = "Disharmonie der Flamme",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Aim = "Reist zu den Schwarzfelstiefen und beschafft 10 Essenz der Elemente. Eure erste Vermutung ist, bei den Golems und Golemherstellern zu suchen. Ihr erinnert Euch, dass Vivian Lagrave auch etwas über Elementare murmelte.",
    Location = "Schattenmagierin Vivian Lagrave (Ödland - Kargath "..yellow.."2,47"..white..")",
    Note = "Die Vorquest bekommt Ihr von Donnerherz (Ödland - Kargath "..yellow.."3,48"..white..").\nJeder Elementar kann die Essenz fallen lassen.",
    Prequest = "Disharmonie der Flamme",
    Rewards = {
        Text = "Belohnung: ",
        { id = 12038 }, --Lagrave's Seal Ring
    }
}
kQuestInstanceData.BlackrockDepths.Horde[13] = {
    Title = "Kommandant Gor'shak",
    Id = 3981,
    Level = 52,
    Attain = 48,
    Aim = "Sucht Kommandant Gor'shak in den Schwarzfelstiefen.$B$BIhr erinnert Euch, dass auf dem primitiv gezeichneten Bild des Orcs auch Gitter vor dem Gesicht zu sehen waren. Vielleicht solltet Ihr nach einer Art Gefängnis suchen.",
    Location = "Galamav der Schütze (Ödland - Kargath "..yellow.."5,47"..white..")",
    Note = "Die Vorquest bekommt Ihr von Donnerherz (Ödland - Kargath "..yellow.."3,48"..white..").\nIhr findet Kommandant Gor'shak bei "..yellow.."[3]"..white..". Der Schlüssel zum Öffnen des Gefängnisses droppt von Verhörmeisterin Gerstahn "..yellow.."[5]"..white..". Wenn Ihr mit ihm sprecht und die nächste Quest startet, erscheinen Gegner.",
    Prequest = "Disharmonie der Flamme",
    Folgequest = "Was ist los?",
}
kQuestInstanceData.BlackrockDepths.Horde[14] = {
    Title = "Die königliche Rettung",
    Id = 4003,
    Level = 59,
    Attain = 48,
    Aim = "Tötet Imperator Dagran Thaurissan und befreit Prinzessin Moira Bronzebart von seinem bösen Zauber.",
    Location = "Thrall (Orgrimmar "..yellow.."31,37"..white..")",
    Note = "Nachdem Ihr mit Kharan Hammermacht und Thrall gesprochen habt, bekommt Ihr diese Quest.\nIhr findet Imperator Dagran Thaurissan bei "..yellow.."[21]"..white..". Die Prinzessin heilt Dagran, aber Ihr dürft sie nicht töten, um die Quest abzuschließen! Versucht, ihre Heilzauber zu unterbrechen. (Belohnungen sind für 'Ist die Prinzessin gerettet?')",
    Prequest = "Kommandant Gor'shak -> Was ist los? (x2) -> Das Östliche Königreich",
    Folgequest = "Ist die Prinzessin gerettet?",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12544 }, --Thrall's Resolve Ring
        { id = 12545 }, --Eye of Orgrimmar Ring
    }
}
for i = 15, 23 do
    kQuestInstanceData.BlackrockDepths.Horde[i] = kQuestInstanceData.BlackrockDepths.Alliance[i]
end

--------------- Pechschwingenhort ---------------
kQuestInstanceData.BlackwingLair = {
    Story = {
	    ["Page1"] = "Der Pechschwingenhort befindet sich auf der höchsten Spitze des Schwarzfels. Dort, in den dunklen Tiefen des Berggipfels, hat Nefarian begonnen, die letzten Phasen seines Plans zu entfalten, um Ragnaros ein für alle Mal zu vernichten und seine Armee zur unangefochtenen Vorherrschaft über alle Rassen Azeroths zu führen.",
        ["Page2"] = "Die mächtige Festung, die in den feurigen Eingeweiden des Schwarzfels gehauen wurde, wurde vom Meister-Zwergenmaurer Franclorn Forgewright entworfen. Als Symbol der Macht der Dunkeleisen gedacht, wurde die Festung jahrhundertelang von den finsteren Zwergen gehalten. Doch Nefarian – der gerissene Sohn des Drachen Todesschwinge – hatte andere Pläne für die große Festung. Er und seine drakonischen Schergen übernahmen die Kontrolle über die obere Spitze und führten Krieg gegen die Besitzungen der Zwerge in den vulkanischen Tiefen des Berges, die als Machtzentrum für Ragnaros den Feuerfürsten dienen. Ragnaros hat das Geheimnis entdeckt, Leben aus Stein zu erschaffen, und plant, eine Armee unaufhaltsamer Golems aufzubauen, um ihn bei der Eroberung des gesamten Schwarzfels zu unterstützen.",
        ["Page3"] = "Nefarian hat geschworen, Ragnaros zu zerschmettern. Zu diesem Zweck hat er kürzlich begonnen, seine Streitkräfte zu stärken, ähnlich wie sein Vater Todesschwinge in vergangenen Zeiten versucht hatte. Doch wo Todesschwinge scheiterte, scheint der intrigante Nefarian nun Erfolg zu haben. Nefarians wahnsinniger Versuch der Dominanz hat sogar den Zorn des Roten Drachenschwarms auf sich gezogen, der seit jeher der größte Feind des Schwarzen Schwarms war. Obwohl Nefarians Absichten bekannt sind, bleiben die Methoden, die er verwendet, um sie zu erreichen, ein Rätsel. Es wird jedoch angenommen, dass Nefarian mit dem Blut aller verschiedenen Drachenschwärme experimentiert hat, um unaufhaltsame Krieger zu produzieren.\n \nNefarians Heiligtum, der Pechschwingenhort, befindet sich auf der höchsten Spitze des Schwarzfels. Dort, in den dunklen Tiefen des Berggipfels, hat Nefarian begonnen, die letzten Phasen seines Plans zu entfalten, um Ragnaros ein für alle Mal zu vernichten und seine Armee zur unangefochtenen Vorherrschaft über alle Rassen Azeroths zu führen.",
        ["MaxPages"] = "3",
	},
    Caption = {
        "Pechschwingenhort",
        "Pechschwingenhort (Geschichte Teil 1)",
        "Pechschwingenhort (Geschichte Teil 2)",
    },
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackwingLair.Alliance[1] = {
    Title = "Nefarius' Verderbnis",
    Id = 8730,
    Level = 60,
    Attain = 60,
    Aim = "Tötet Nefarian und bringt den roten Szeptersplitter wieder in Euren Besitz. Bringt den roten Szeptersplitter zu Anachronos in den Höhlen der Zeit in Tanaris. Euch bleiben ein und halb Stunden, um diese Aufgabe zu erfüllen.",
    Location = "Vaelastrasz der Verdorbene (Pechschwingenhort "..yellow.."[2]"..white..")",
    Note = "Nur eine Person kann den Splitter plündern. Anachronos (Tanaris - Höhlen der Zeit "..yellow.."65,49"..white..")",
    Prequest = "Der Bund der Drachenschwärme",
    Folgequest = "Die Macht von Kalimdor (Must complete green & blue quest chains as well)",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 21530 }, --Onyx Embedded Leggings Legs, Mail
        { id = 21529 }, --Amulet of Shadow Shielding Neck
    }
}
kQuestInstanceData.BlackwingLair.Alliance[2] = {
    Title = "Der Herrscher des Schwarzfels",
    Id = 7781,
    Level = 60,
    Attain = 60,
    Aim = "Bringt König Varian Wrynn in Sturmwind den Kopf von Nefarian.",
    Location = "Kopf von Nefarian (droppt von Nefarian "..yellow.."[9]"..white..")",
    Note = "Hochlord Bolvar Fordragon befindet sich in (Sturmwind - Festung Sturmwind "..yellow.."78,20"..white.."). Die Folgequest schickt Euch zu Feldmarschall Afrasiabi (Sturmwind - Das Tal der Helden "..yellow.."67,72"..white..") für die Belohnung.",
    Folgequest = "Der Herrscher des Schwarzfels",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 19383 }, --Master Dragonslayer's Medallion Neck
        { id = 19366 }, --Master Dragonslayer's Orb Held In Off-hand
        { id = 19384 }, --Master Dragonslayer's Ring Ring
    }
}
kQuestInstanceData.BlackwingLair.Alliance[3] = {
    Title = "Nur einer kann sich erheben",
    Id = 8288,
    Level = 60,
    Attain = 60,
    Aim = "Bringt Brutwächter Dreschbringers Kopf zu Baristolth der Sandstürme in die Burg Cenarius in Silithus.",
    Location = "Kopf des Brutwächters Dreschbringer (droppt von Brutwächter Dreschbringer "..yellow.."[3]"..white..")",
    Note = "Nur eine Person kann den Kopf aufheben.",
    Prequest = "Was uns morgen erwartet",
    Folgequest = "Der Pfad des Gerechten",
}
kQuestInstanceData.BlackwingLair.Alliance[4] = {
    Title = "Der einzige Weg",
    Id = 8620,
    Level = 60,
    Attain = 60,
    Aim = "Findet die 8 verlorenen Kapitel von Drachisch für Dummies und vereint sie mit dem magischen Bucheinband. Bringt das vollständige Buch Drachisch für Dummies: Band 2 zu Narain Pfauentraum in Tanaris.",
    Location = "Narain Pfauentraum (Tanaris "..yellow.."65,18"..white..")",
    Note = "Kapitel können von mehreren Personen geplündert werden. Drakonisch für Dummies (von einem Tisch geplündert "..green.."[2']"..white..")",
    Prequest = "Lockvogel!",
    Folgequest = "Die gute und die schlechte Nachricht (Müsst Stewvul, Ex-B.F.F. und Fragt mich nie nach meinem Geschäft Questreihen abschließen)",
    Rewards = {
        Text = "Belohnung: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.BlackwingLair.Alliance[5] = {
    Title = "Der Schlüssel zu Karazhan IX",
    Id = 40828,
    Level = 60,
    Attain = 58,
    Aim = "Findet 'Abhandlung über magische Schlösser und Schlüssel' und bringt es zu Vandol zurück. Es wird gemunkelt, dass es im Pechschwingenhort aufbewahrt wird.",
    Location = "Dolvan Windbrace (Düstermarschen - Westhafenkluft  "..yellow.."71,73"..white..")",
    Note = "Vorquest - Lord Ebonlocke (Untere Karazhan-Hallen). Buch 'Abhandlung über magische Schlösser und Schlüssel' befindet sich im letzten Bossraum "..yellow.."[9]"..white..", neben dem Thron. Belohnung von der nächsten Quest.",
    Prequest = "Der Schlüssel zu Karazhan VIII (DMW)",
    Folgequest = "Der Schlüssel zu Karazhan X",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61234 }, --Upper Karazhan Tower Key Key
    }
}
kQuestInstanceData.BlackwingLair.Alliance[6] = {
    Title = "Sense der Göttin",
    Id = 41067,
    Level = 60,
    Attain = 58,
    Aim = "Tötet Klauenfürst Heuler und meldet Euch bei Lord Ebonlocke.",
    Location = "Erzdruide Traumwind (Hyjal - Nordanaar "..yellow.."84.8,29.3"..white.." oberstes Stockwerk des großen Baums)",
    Note = "Nefarian "..yellow.."[9]"..white.." lässt 'Verbrannte Kopie von Vorgendor' fallen.\nDie Questreihe beginnt mit dem seltenen legendären Drop 'Die Sichel von Elune' von Boss Lord Schwarzwald II in "..yellow.."[Karazhan]"..white..".",
    Prequest = "Sense der Göttin",
    Folgequest = "Sense der Göttin"..yellow.."[Upper Karazhan]"..white.." ", -- 41087
}
kQuestInstanceData.BlackwingLair.Horde[1] = kQuestInstanceData.BlackwingLair.Alliance[1]
kQuestInstanceData.BlackwingLair.Horde[2] = {
    Title = "Der Herrscher des Schwarzfels",
    Id = 7783,
    Level = 60,
    Attain = 60,
    Aim = "Bringt König Varian Wrynn in Sturmwind den Kopf von Nefarian.",
    Location = "Kopf von Nefarian (droppt von Nefarian "..yellow.."[9]"..white..")",
    Note = "Die Folgequest schickt Euch zu Hochfürst Saurfang (Orgrimmar - Tal der Stärke "..yellow.."51,76"..white..") für die Belohnung.",
    Folgequest = "Der Herrscher des Schwarzfels",
    Rewards = kQuestInstanceData.BlackwingLair.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.BlackwingLair.Horde[i] = kQuestInstanceData.BlackwingLair.Alliance[i]
end

--------------- Blackfathom Deeps ---------------
kQuestInstanceData.BlackfathomDeeps = {
    Story = "An der Zoram-Küste von Ashenvale gelegen, war die Tiefschwarze Grotte einst ein herrlicher Tempel, der der Mondgöttin Elune der Nachtelfen gewidmet war. Doch die große Zerreißung zerschmetterte den Tempel und versenkte ihn unter den Wellen der Verschleierten See. Dort blieb er unberührt - bis, von seiner antiken Macht angezogen, die Naga und Satyrn auftauchten, um seine Geheimnisse zu ergründen. Legenden besagen, dass die antike Bestie Aku'mai innerhalb der Tempelruinen Wohnsitz genommen hat. Aku'mai, ein bevorzugtes Haustier der uralten Alten Götter, raubt seitdem in der Gegend. Angezogen von Aku'mais Präsenz, ist auch der Kult bekannt als Hammer der Dämmerung gekommen, um in der bösen Präsenz der Alten Götter zu schwelgen.",
    Caption = "Tiefschwarze Grotte",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackfathomDeeps.Alliance[1] = {
    Title = "Wissen in der Tiefe",
    Id = 971,
    Level = 23,
    Attain = 10,
    Aim = "Bringt das 'Manuskript von Lorgalis' zu Schildwachenschülerin Issara zum Stützpunkt an der Grotte.",
    Location = "Gerrig Knochengriff (Eisenschmiede - Die Einsame Höhle "..yellow.."50,5"..white..")",
    Note = "Ihr findet das Manuskript bei "..yellow.."[2]"..white.." im Wasser.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 6743 }, --Sustaining Ring Ring
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[2] = {
    Title = "Erforschung der Verderbnis",
    Id = 1275,
    Level = 24,
    Attain = 18,
    Aim = "Relwyn Schattenstern am Stützpunkt an der Grotte benötigt 8 verderbte Gehinstämme.",
    Location = "Gershala Nachtraunen (Dunkelküste - Auberdine "..yellow.."38,43"..white..")",
    Note = "Ihr bekommt es von Argos Nachtraunen in (Sturmwind - Der Park "..yellow.."21,55"..white..").\n\nAlle Nagas vor und in der Tiefschwarzen Grotte lassen die Gehirne fallen.",
    Prequest = "Verderbnis in der Fremde",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 7003 }, --Beetle Clasps Wrist, Mail
        { id = 7004 }, --Prelacy Cape Back
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[3] = {
    Title = "Auf der Suche nach Thaelrid",
    Id = 1198,
    Level = 24,
    Attain = 18,
    Aim = "Sucht Späher Thaelrid in der Tiefschwarzen Grotte auf.",
    Location = "Dämmerungsbehüter Shaedlass (Darnassus - Die Terrasse der Handwerker "..yellow.."55,24"..white..")",
    Note = "Ihr findet Späher Thaelrid bei "..yellow.."[4]"..white..".",
    Folgequest = "Schurkerei in der Tiefschwarzen Grotte",
}
kQuestInstanceData.BlackfathomDeeps.Alliance[4] = {
    Title = "Schurkerei in der Tiefschwarzen Grotte",
    Id = 1200,
    Level = 27,
    Attain = 18,
    Aim = "Bringt den Kopf von Zwielichtfürst Kelris zu Ashelan Nordwald im Stützpunkt an der Grotte.",
    Location = "Späher Thaelrid (Tiefschwarze Grotte "..yellow.."[4]"..white..")",
    Note = "Zwielichtfürst Kelris ist bei "..yellow.."[8]"..white..". Ihr findet Dämmerungsbehüter Selgorm in Darnassus - Die Terrasse der Handwerker ("..yellow.."55,24"..white..").\n\nACHTUNG! Wenn Ihr die Flammen neben Lord Kelris entzündet, erscheinen Gegner und greifen Euch an.",
    Prequest = "Auf der Suche nach Thaelrid",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 7001 }, --Gravestone Scepter Wand
        { id = 7002 }, --Arctic Buckler Shield
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[5] = {
    Title = "Die Stunde der Finsternis",
    Id = 1199,
    Level = 25,
    Attain = 20,
    Aim = "Bringt 10 Zwielichtanhänger zu Schildwache Aluwyn im Stützpunkt an der Grotte.",
    Location = "Argentumwache Manados (Darnassus - Die Terrasse der Handwerker "..yellow.."55,23"..white..")",
    Note = "Jeder Dämmerungs-Gegner kann die Anhänger fallen lassen.",
    Rewards = {
        Text = "Rewards:",
        { id = 6998 }, --Nimbus Boots Feet, Cloth
        { id = 7000 }, --Heartwood Girdle Waist, Leather
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[6] = {
    Title = "Die Kugel von Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Sucht 3 Fragmente von Soran'ruk und 1 großes Fragment von Soran'ruk und bringt sie zu Doan Karhan im Brachland.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Ihr bekommt die 3 Fragmente von Soran'ruk von Zwielichtakolythen in "..yellow.."[Tiefschwarze Grotte]"..white..". Ihr bekommt das Große Fragment von Soran'ruk in "..yellow.."[Burg Schattenfang]"..white.." von Klinge von Schattenfang Düsterseelen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Alliance[7] = {
    Title = "Die Ruinen des Mondschreins",
    Id = 41812,
    Level = 26,
    Attain = 18,
    Aim = "Durchqueren Sie die Tiefschwarzen Grotte und sammeln Sie "..yellow.."'Seed of Bloom'"..white.." aus den Ruinen des Mondschreins. Sobald Sie es gefunden haben, bringen Sie es zu Aelennia Starbloom im Ashenvale.",
    Location = "Aelennia Starbloom (Eschental "..yellow.."17,26"..white..")",
    Note = "'Seed of Bloom' sind unter dem Baum neben "..yellow.."[4]",
    Rewards = {
        Text = "Belohnung:",
        { id = 41919 }, --Starbloom Ring
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[1] = {
    Title = "Die Essenz von Aku'mai",
    Id = 6563,
    Level = 22,
    Attain = 17,
    Aim = "Bringt 20 Saphire von Aku'mai zu Je'neu Sancrea im Eschental.",
    Location = "Je'neu Sancrea (Eschental - Außenposten von Zoram'gar "..yellow.."11,33"..white..")",
    Note = "Die Vorquest Ärger in der Tiefe bekommt Ihr von Tsunaman (Steinkrallengebirge - Sonnenfels "..yellow.."47,64"..white.."). Die Kristalle können in den Tunneln vor der Instanz gefunden werden.",
    Prequest = "Ärger in der Tiefe",
    Folgequest = "Inmitten der Ruinen",
}
kQuestInstanceData.BlackfathomDeeps.Horde[2] = {
    Title = "Treue zu den Alten Göttern",
    Id = 6565,
    Level = 26,
    Attain = 17,
    Aim = "Bringt die durchfeuchtete Notiz zu Je'neu Sancrea im Eschental.",
    Location = "Feuchte Notiz (drop - see note)",
    Note = "Ihr bekommt die Feuchte Notiz von Gezeitenpriesterin der Tiefschwarzen Grotte (5% Droprate). Bringt sie dann zu Je'neu Sancrea (Eschental - Außenposten von Zoram'gar "..yellow.."11,33"..white.."). Lorgus Jett ist bei "..yellow.."[6]"..white..".",
    Prequest = "Treue zu den Alten Göttern",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 17694 }, --Band of the Fist Ring
        { id = 17695 }, --Chestnut Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[3] = {
    Title = "Inmitten der Ruinen",
    Id = 908,
    Level = 27,
    Attain = 21,
    Aim = "Bringt den Tiefenkern zu Je'neu Sancrea beim Außenposten von Zoram'gar im Eschental.",
    Location = "Je'neu Sancrea (Eschental - Außenposten von Zoram'gar "..yellow.."11,33"..white..")",
    Note = "Ihr findet den Tiefenkern bei "..yellow.."[7]"..white.." im Wasser. Wenn Ihr den Kern bekommt, erscheint Baron Aquanis und greift Euch an. Er lässt einen Questgegenstand fallen, den Ihr zurück zu Je'neu Sancrea bringen müsst.",
}
kQuestInstanceData.BlackfathomDeeps.Horde[4] = {
    Title = "Schurkerei in der Tiefschwarzen Grotte",
    Id = 6561,
    Level = 27,
    Attain = 18,
    Aim = "Bringt den Kopf von Zwielichtfürst Kelris zu Ashelan Nordwald im Stützpunkt an der Grotte.",
    Location = "Argent guard Thaelrid (Tiefschwarze Grotte "..yellow.."[4]"..white..")",
    Note = "Zwielichtfürst Kelris ist bei "..yellow.."[8]"..white..". Ihr findet Bashana Runentotem in Donnerfels - Die Anhöhe der Ältesten ("..yellow.."70,33"..white..").\n\nACHTUNG! Wenn Ihr die Flammen neben Lord Kelris entzündet, erscheinen Gegner und greifen Euch an.",
    Rewards = kQuestInstanceData.BlackfathomDeeps.Alliance[4].Rewards
}
kQuestInstanceData.BlackfathomDeeps.Horde[5] = {
    Title = "Die Kugel von Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Sucht 3 Fragmente von Soran'ruk und 1 großes Fragment von Soran'ruk und bringt sie zu Doan Karhan im Brachland.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Ihr bekommt die 3 Fragmente von Soran'ruk von Zwielichtakolythen in "..yellow.."[Tiefschwarze Grotte]"..white..". Ihr bekommt das Große Fragment von Soran'ruk in "..yellow.."[Burg Schattenfang]"..white.." von Klinge von Schattenfang Düsterseelen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[6] = {
    Title = "Baron Aquanis",
    Id = 909,
    Level = 30,
    Attain = 21,
    Aim = "Bringt die seltsame Wasserkugel zu Je'neu Sancrea beim Außenposten von Zoram'gar im Eschental.",
    Location = "Seltsame Wasserkugel (Tiefschwarze Grotte "..yellow.."[7]"..white..")",
    Note = "Die Benutzung des Tiefensteins "..yellow.."[7]"..white.." für Quest #3 beschwört Baron Aquanis. Er lässt die Seltsame Wasserkugel fallen, die die Quest startet.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 16886 }, --Outlaw Sabre One-Hand, Sword
        { id = 16887 }, --Witch's Finger Held In Off-hand
    }
}
kQuestInstanceData.BlackfathomDeeps.Horde[7] = kQuestInstanceData.BlackfathomDeeps.Alliance[7]

--------------- Lower Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireLower = {
    Story = "Die mächtige Festung, die in den feurigen Eingeweiden des Schwarzfelsbergs ausgehauen wurde, wurde vom Meisterzwergenmauerer Franclorn Schmiedevater entworfen. Als Symbol der Macht der Dunkeleisen gedacht, wurde die Festung jahrhundertelang von den finsteren Zwergen gehalten. Doch Nefarian - der gerissene Sohn des Drachens Todesschwinge - hatte andere Pläne für die große Festung. Er und seine drachischen Schergen übernahmen die Kontrolle über die obere Spitze und führten Krieg gegen die Besitztümer der Zwerge in den vulkanischen Tiefen des Berges. Als Nefarian erkannte, dass die Zwerge vom mächtigen Feuerelementar Ragnaros angeführt wurden, schwor er, seine Feinde zu vernichten und den gesamten Schwarzfelsberg für sich zu beanspruchen.",
    Caption = "Lower Schwarzfelsspitze",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireLower.Alliance[1] = {
    Title = "Die letzten Schrifttafeln",
    Id = 4788,
    Level = 58,
    Attain = 40,
    Aim = "Bringt Ausgrabungsleiter Eisenschuh in Tanaris die fünfte und sechste Schrifttafel von Mosh'aru.",
    Location = "Ausgrabungsleiter Eisenschuh (Tanaris - Dampfdruckpier "..yellow.."66,23"..white..")",
    Note = "Ihr findet die Tafeln nahe "..yellow.."[7]"..white.." und "..yellow.."[9]"..white..".\nDie Belohnungen gehören zu 'Konfrontiert Yeh'kinya'. Ihr findet Yeh'kinya nahe Ausgrabungsleiter Eisenschuh.",
    Prequest = "Die verlorenen Schrifttafeln von Mosh'aru",
    Folgequest = "Konfrontiert Yeh'kinya",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 20218 }, --Faded Hakkari Cloak Back
        { id = 20219 }, --Tattered Hakkari Cape Back
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[2] = {
    Title = "Kiblers Exotische Tiere",
    Id = 4729,
    Level = 59,
    Attain = 55,
    Aim = "Begebt Euch zur Schwarzfelsspitze und sucht Worgwelpen der Blutäxte. Benutzt den Käfig, um die wilden kleinen Bestien zu transportieren. Bringt einen eingesperrten Worgwelpen zu Kibler.",
    Location = "Kibler (Brennende Steppe - Flammenkamm "..yellow.."65,22"..white..")",
    Note = "Ihr findet den Worgwelpen bei "..yellow.."[17]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 12264 }, --Worg Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[3] = {
    Title = "Be-Öh-Es-Eh",
    Id = 4862,
    Level = 59,
    Attain = 55,
    Aim = "Reist zur Schwarzfelsspitze und sammelt 15 Spitzenspinneneier für Kibler.$B$BLogischerweise müsstet Ihr diese Eier in der Nähe von Spinnen finden.",
    Location = "Kibler (Brennende Steppe - Flammenkamm "..yellow.."65,22"..white..")",
    Note = "Ihr findet die Spinneneier nahe "..yellow.."[13]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 12529 }, --Smolderweb Carrier Pet
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[4] = {
    Title = "Muttermilch",
    Id = 4866,
    Level = 60,
    Attain = 55,
    Aim = "Ihr findet Mutter Glimmernetz im Herzen der Schwarzfelsspitze. Kämpft mit ihr und bringt sie dazu, Euch zu vergiften. Es kann gut sein, dass Ihr sie sogar töten müsst. Kehrt zum struppigen John zurück, sobald Ihr vergiftet seid, damit er Euch 'melken' kann.",
    Location = "Struppiger John (Brennende Steppe - Flammenkamm "..yellow.."65,23"..white..")",
    Note = "Mutter Glimmernetz ist bei "..yellow.."[13]"..white..". Der Gifteffekt verlangsamt auch Spieler in der Nähe. Wenn er entfernt oder aufgehoben wird, scheitert Ihr bei der Quest.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 15873 }, --Ragged John's Neverending Cup Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[5] = {
    Title = "Stellt sie ab",
    Id = 4701,
    Level = 59,
    Attain = 55,
    Aim = "Begebt Euch zur Schwarzfelsspitze und vernichtet die Quelle der Bedrohung durch die Worgs. Als Ihr Helendis verlasst, ruft er Euch noch einen Namen hinterher: Halycon. Darauf beziehen sich die Orcs im Zusammenhang mit den Worgs.",
    Location = "Helendis Flusshorn (Brennende Steppe - Morgans Wacht "..yellow.."5,47"..white..")",
    Note = "Ihr findet Halycon bei "..yellow.."[17]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 15824 }, --Astoria Robes Chest, Cloth
        { id = 15825 }, --Traphook Jerkin Chest, Leather
        { id = 15827 }, --Jadescale Breastplate Chest, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[6] = {
    Title = "Urok Schreckensbote",
    Id = 4867,
    Level = 60,
    Attain = 55,
    Aim = "Lest Waroshs Rolle. Bringt Waroshs Mojo zu Warosh.",
    Location = "Warosh (Schwarzfelsspitze "..yellow.."[2]"..white..")",
    Note = "Um Waroshs Mojo zu bekommen, müsst Ihr Urok Schreckensbote "..yellow.."[15]"..white.." beschwören und töten. Für seine Beschwörung benötigt Ihr einen Speer und Hochlord Omokks Kopf "..yellow.."[5]"..white..". Der Speer ist bei "..yellow.."[3]"..white..". Während der Beschwörung erscheinen einige Wellen von Ogern, bevor Urok Schreckensbote Euch angreift. Ihr könnt den Speer während des Kampfes benutzen, um den Ogern Schaden zuzufügen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 15867 }, --Prismcharm Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[7] = {
    Title = "Bijous Habseligkeiten",
    Id = 5001,
    Level = 59,
    Attain = 55,
    Aim = "Sucht Bijous Habseligkeiten und bringt sie ihr. Ihr erinnert Euch daran, dass sie erwähnte, ihre Sachen auf der untersten Ebene der Stadt versteckt zu haben.",
    Location = "Bijou (Schwarzfelsspitze "..yellow.."[3]"..white..")",
    Note = "Ihr findet Bijous Habseligkeiten auf dem Weg zu Mutter Glimmernetz bei "..yellow.."[13]"..white..".\nMaxwell ist in (Brennende Steppe - Morgans Wacht "..yellow.."84,58"..white..").",
    Folgequest = "Nachricht an Maxwell",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[8] = {
    Title = "Maxwells Mission",
    Id = 5081,
    Level = 60,
    Attain = 55,
    Aim = "Reist zur Schwarzfelsspitze und schaltet Kriegsmeister Voone, Hochlord Omokk und Oberanführer Wyrmthalak aus.",
    Location = "Marschall Maxwell (Brennende Steppe - Morgans Wacht "..yellow.."84,58"..white..")",
    Note = "Ihr findet Kriegsmeister Voone bei "..yellow.."[9]"..white..", Hochlord Omokk bei "..yellow.."[5]"..white.." und Oberanführer Wyrmthalak bei "..yellow.."[19]"..white..".",
    Prequest = "Nachricht an Maxwell",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 13958 }, --Wyrmthalak's Shackles Wrist, Cloth
        { id = 13959 }, --Omokk's Girth Restrainer Waist, Plate
        { id = 13961 }, --Halycon's Muzzle Shoulder, Leather
        { id = 13962 }, --Vosh'gajin's Strand Waist, Leather
        { id = 13963 }, --Voone's Vice Grips Hands, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[9] = {
    Title = "Siegel des Aufstiegs",
    Id = 4742,
    Level = 60,
    Attain = 57,
    Aim = "Sucht die drei Edelsteine der Befehlsgewalt: den Edelstein der Gluthauer, den Edelstein der Felsspitzoger und den Edelstein der Blutäxte. Bringt sie zusammen mit dem unverzierten Siegel des Aufstiegs zu Vaelan zurück.$B$BVaelan nannte Euch auch die Namen der drei Generäle: Kriegsmeister Voone von den Gluthauern, Hochlord Omokk von den Felsspitzogern und Oberanführer Wyrmthalak von den Blutäxten.",
    Location = "Acride (Schwarzfelsspitze "..yellow.."[1]"..white..")",
    Note = "Ihr bekommt den Edelstein der Felsspitzoger von Hochlord Omokk bei "..yellow.."[5]"..white..", den Edelstein der Gluthauer von Kriegsmeister Voone bei "..yellow.."[9]"..white.." und den Edelstein der Blutäxte von Oberanführer Wyrmthalak bei "..yellow.."[19]"..white..". Das Unverzierte Siegel des Aufstiegs kann von fast allen Gegnern in der Unteren Schwarzfelsspitze droppen. Ihr bekommt den Schlüssel für die Obere Schwarzfelsspitze, wenn Ihr diese Questreihe abschließt.",
    Folgequest = "Siegel des Aufstiegs",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[10] = {
    Title = "General Drakkisaths Befehl",
    Id = 5089,
    Level = 60,
    Attain = 55,
    Aim = "Bringt den Befehl von General Drakkisath zu Marschall Maxwell in der Brennenden Steppe.",
    Location = "General Drakkisaths Befehl (droppt von Oberanführer Wyrmthalak "..yellow.."[19]"..white..")",
    Note = "Marschall Maxwell befindet sich in Brennende Steppe - Morgans Wacht ("..yellow.."84,58"..white..").",
    Folgequest = "General Drakkisaths Niedergang ("..yellow.."Upper Blackrock Spire"..white..")", -- 5102
}
kQuestInstanceData.BlackrockSpireLower.Alliance[11] = {
    Title = "Das linke Stück von Lord Valthalaks Amulett",
    Id = 8966,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nMor Grimmtotem wird bei "..yellow.."[9]"..white.." beschworen.",
    Prequest = "Komponenten von großer Wichtigkeit",
    Folgequest = "Ich sehe die Insel Alcaz in Eurer Zukunft",
}
kQuestInstanceData.BlackrockSpireLower.Alliance[12] = {
    Title = "Das rechte Stück von Lord Valthalaks Amulett",
    Id = 8989,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit Lord Valthalaks zusammengesetzten Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nMor Grimmtotem wird bei "..yellow.."[9]"..white.." beschworen.",
    Prequest = "Mehr Komponenten von großer Wichtigkeit",
    Folgequest = "Letzte Vorbereitungen ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994
}
kQuestInstanceData.BlackrockSpireLower.Alliance[13] = {
    Title = "Schlangenstein der Schattenjägerin",
    Id = 5306,
    Level = 60,
    Attain = 50,
    Aim = "Begebt Euch zur Schwarzfelsspitze und erschlagt Schattenjägerin Vosh'gajin. Holt Vosh'gajins Schlangenstein und kehrt zu Kilram zurück.",
    Location = "Kilram (Winterquell - Ewige Warte "..yellow.."61,37"..white..")",
    Note = "Schmiedequest. Schattenjägerin Vosh'gajin ist bei "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 12821 }, --Plans: Dawn's Edge Pattern
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[14] = {
    Title = "Heißer, feuriger Tod",
    Id = 5103,
    Level = 60,
    Attain = 60,
    Aim = "Jemand auf dieser Welt muss doch wissen, was mit diesen Stulpen zu tun ist. Viel Glück!",
    Location = "Human Remains (Lower Schwarzfelsspitze "..yellow.."[9]"..white..")",
    Note = "Schmiedequest. Hebt unbedingt die Ungebrannten Plattenstulpen nahe den menschlichen Überresten bei "..yellow.."[11]"..white.." auf. Abgabe bei Malyfous Düsterhammer (Winterquell - Ewige Warte "..yellow.."61,39"..white.."). Die aufgelisteten Belohnungen sind für die Folgequest.",
    Folgequest = "Feurige Plattenstulpen",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 12699 }, --Plans: Fiery Plate Gauntlets Pattern
        { id = 12631 }, --Fiery Plate Gauntlets Hands, Plate
    }
}
kQuestInstanceData.BlackrockSpireLower.Alliance[15] = {
    Title = "Der Dunkeleisen Schänder",
    Id = 40762,
    Level = 60,
    Attain = 55,
    Aim = "Sammelt ein Dunkeleisengewehr, einen Magmakondensator, einen Komplexen Arkanitlauf und ein Geschmolzenes Fragment für Bixxle Schraubsicherung in Bixxles Lagerhaus auf Tel'Abim.",
    Location = "Bixxle Schraubsicherung (Tel'Abim "..yellow.."52,34"..white..")",
    Note = "Diese Quest erfordert das Sammeln von 4 Gegenständen.\n1) Magmakondensator (Schwarzfelstiefen in Magmakondensator-Kiste)\n2) Komplexer Arkanitlauf (Schwarzfelsspitze im Behälter für komplexe Arkanitläufe)\n3) Geschmolzenes Fragment (Geschmolzener Kern von Geschmolzener Zerstörer)\n4) Dunkeleisengewehr (von Ingenieuren hergestellt).\nFeuerkern (x3) im Geschmolzenen Kern und Verzauberte Thoriumbarren (x10).",
    Prequest = "Geheimnisse des Dunkeleisen Schänders",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61068 }, --Dark Iron Desecrator Gun
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireLower.Horde[i] = kQuestInstanceData.BlackrockSpireLower.Alliance[i]
end
kQuestInstanceData.BlackrockSpireLower.Horde[5] = {
    Title = "Die Herrin der Meute",
    Id = 4724,
    Level = 59,
    Attain = 55,
    Aim = "Erschlagt Halycon, die Rudelführerin der Worgs der Blutäxte.",
    Location = "Galamav der Schütze (Ödland - Kargath "..yellow.."5,47"..white..")",
    Note = "Ihr findet Halycon bei "..yellow.."[17]"..white..".",
    Rewards = kQuestInstanceData.BlackrockSpireLower.Alliance[5].Rewards
}
kQuestInstanceData.BlackrockSpireLower.Horde[6] = kQuestInstanceData.BlackrockSpireLower.Alliance[6]
kQuestInstanceData.BlackrockSpireLower.Horde[7] = {
    Title = "Agentin Bijou",
    Id = 4981,
    Level = 59,
    Attain = 55,
    Aim = "Begebt Euch zur Schwarzfelsspitze und findet heraus, was aus Bijou geworden ist.",
    Location = "Lexlort (Ödland - Kargath "..yellow.."5,47"..white..")",
    Note = "Ihr findet Bijou bei "..yellow.."[8]"..white..".",
    Folgequest = "Bijous Habseligkeiten",
}
kQuestInstanceData.BlackrockSpireLower.Horde[8] = {
    Title = "Bijous Habseligkeiten",
    Id = 4982,
    Level = 59,
    Attain = 55,
    Aim = "Sucht Bijous Habseligkeiten und bringt sie ihr. Ihr erinnert Euch daran, dass sie erwähnte, ihre Sachen auf der untersten Ebene der Stadt versteckt zu haben.",
    Location = "Bijou (Schwarzfelsspitze "..yellow.."[3]"..white..")",
    Note = "Ihr findet Bijous Habseligkeiten auf dem Weg zu Mutter Glimmernetz bei "..yellow.."[13]"..white..".\nDie Belohnungen gehören zu 'Bijous Aufklärungsbericht'.",
    Prequest = "Agentin Bijou",
    Folgequest = "Bijous Aufklärungsbericht",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 15858 }, --Freewind Gloves Hands, Cloth
        { id = 15859 }, --Seapost Girdle Waist, Mail
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[9] = kQuestInstanceData.BlackrockSpireLower.Alliance[9]
kQuestInstanceData.BlackrockSpireLower.Horde[10] = {
    Title = "Befehl des Kriegsherrn",
    Id = 4903,
    Level = 60,
    Attain = 55,
    Aim = "Tötet Hochlord Omokk, Kriegsmeister Voone und Oberanführer Wyrmthalak. Findet die wichtigen Schwarzfelsdokumente. Kehrt zum Kriegsherrn Bluthauer nach Kargath zurück, sobald Ihr diese Mission erledigt habt.",
    Location = "Kriegsherr Bluthauer (Ödland - Kargath "..yellow.."65,22"..white..")",
    Note = "Onyxia-Vorquest.\nIhr findet Hochlord Omokk bei "..yellow.."[5]"..white..", Kriegsmeister Voone bei "..yellow.."[9]"..white.." und Oberanführer Wyrmthalak bei "..yellow.."[19]"..white..". Die Schwarzfelsdokumente können neben einem dieser 3 Bosse erscheinen.",
    Folgequest = "Etriggs Weisheit -> Für die Horde! ("..yellow.."Obere Schwarzfelsspitze"..white..")",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Title = "Dschungeltroll Abschaum",
    Id = 40495,
    Level = 60,
    Attain = 48,
    Location = "Taskmaster Ok'gog (Brennende Steppe - Karfang Festung "..yellow.."95.1,22.8"..white..")",
    Note = "Tötet Kriegsmeister Voone "..yellow.."[9]"..white.." in der Unteren Schwarzfelsspitze und bringt seine Hauer zu Taskmaster Ok'gog in der Karfang Festung in der Brennenden Steppe zurück.",
    Prequest = "Der Feuerbauch Auftrag",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60715 }, --Taskmaster Whip Trinket
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[17] = {
    Title = "Der Überfall des Plünderers",
    Id = 40498,
    Level = 58,
    Attain = 50,
    Aim = "Tötet Gizrul den Geifernden in der Schwarzfelsspitze und meldet Euch dann bei Räuber Fargosh in der Karfang Festung.",
    Location = "Räuber Fargosh (Brennende Steppe - Karfang Festung "..yellow.."93.6,23.2"..white..")",
    Note = "Gizrul der Geifernde erscheint, nachdem Ihr Boss Halycon "..yellow.."[17]"..white.." getötet habt.",
    Prequest = "Rache des Plünderers -> Neues Reittier des Plünderers",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60717 }, --Worg Rider Sash Waist, Leather
        { id = 60718 }, --Sootwalker Sandals Feet, Cloth
        { id = 60719 }, --Axe of Fargosh Main Hand, Axe
    }
}
kQuestInstanceData.BlackrockSpireLower.Horde[18] = {
    Title = "Der letzte Riss",
    Id = 40509,
    Level = 59,
    Attain = 50,
    Location = "Karfang (Brennende Steppe - Karfang Festung "..yellow.."95.1,22.8"..white..")",
    Note = "Tötet Rüstmeister Zigris "..yellow.."[16]"..white.." tief in der Schwarzfelsspitze für Karfang in der Karfang Festung in der Brennenden Steppe.",
    Prequest = "Schutz des frischen Blutes -> Meldet euch bei Molk -> Vernichtet alle Spuren … -> Geht auf Nummer sicher",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60739 }, --Tarnished Lancelot Ring Ring
    }
}

--------------- Upper Blackrock Spire ---------------
kQuestInstanceData.BlackrockSpireUpper = {
    Story = "Die mächtige Festung, die in den feurigen Eingeweiden des Schwarzfelsbergs ausgehauen wurde, wurde vom Meisterzwergenmauerer Franclorn Schmiedevater entworfen. Als Symbol der Macht der Dunkeleisen gedacht, wurde die Festung jahrhundertelang von den finsteren Zwergen gehalten. Doch Nefarian - der gerissene Sohn des Drachens Todesschwinge - hatte andere Pläne für die große Festung. Er und seine drachischen Schergen übernahmen die Kontrolle über die obere Spitze und führten Krieg gegen die Besitztümer der Zwerge in den vulkanischen Tiefen des Berges. Als Nefarian erkannte, dass die Zwerge vom mächtigen Feuerelementar Ragnaros angeführt wurden, schwor er, seine Feinde zu vernichten und den gesamten Schwarzfelsberg für sich zu beanspruchen.",
    Caption = "Upper Schwarzfelsspitze",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[1] = {
    Title = "Die oberste Beschützerin",
    Id = 5160,
    Level = 60,
    Attain = 57,
    Aim = "Begebt Euch nach Winterquell und sucht Haleh. Gebt ihr Awbees Schuppe.",
    Location = "Awbee (Schwarzfelsspitze "..yellow.."[7]"..white..")",
    Note = "Ihr findet Awbee im Raum nach der Arena bei "..yellow.."[7]"..white..". Sie steht auf einem Vorsprung.\nHaleh ist in Winterquell ("..yellow.."54,51"..white.."). Benutzt das Portalschild am Ende der Höhle, um zu ihr zu gelangen.",
    Folgequest = "Der Zorn des blauen Drachenschwarms",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[2] = {
    Title = "Finkle Einhorn, zu Euren Diensten!",
    Id = 5047,
    Level = 60,
    Attain = 55,
    Aim = "Sprecht mit Malyfous Düsterhammer in der Ewigen Warte.",
    Location = "Finkle Einhorn (Schwarzfelsspitze "..yellow.."[8]"..white..")",
    Note = "Finkle Einhorn erscheint nach dem Häuten von Die Bestie. Ihr findet Malyfous in (Winterquell - Ewige Warte "..yellow.."61,38"..white..").",
    Folgequest = "Gamaschen der Arkana, Kappe des Scharlachroten Gelehrten, Brustplatte des Blutdursts und Schulterschützer des Lichtbringers",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[3] = {
    Title = "Ei-Frosten",
    Id = 4734,
    Level = 60,
    Attain = 57,
    Aim = "Benutzt den Prototyp des Eiszilloskops an einem Ei im Horst der Schwarzfelsspitze.",
    Location = "Tinkee Kesseldampf (Brennende Steppe - Flammenkamm "..yellow.."65,24"..white..")",
    Note = "Ihr findet die Eier im Raum von Vater Flamme bei "..yellow.."[2]"..white..".",
    Prequest = "Brutlingessenz -> Tinkee Kesseldampf",
    Folgequest = "Eiersammlung -> Leonidas Bartholomäus -> Dämmerungstrickfalle ("..yellow.."Scholomance"..white..")",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[4] = {
    Title = "Auge des Glutsehers",
    Id = 6821,
    Level = 60,
    Attain = 56,
    Aim = "Bringt das Auge des Glutsehers zu Fürst Hydraxis in Azshara.",
    Location = "Fürst Hydraxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Ihr findet Feuerwache Glutseher bei "..yellow.."[1]"..white..".",
    Prequest = "Vergiftetes Wasser, Stürmer und Rumbler",
    Folgequest = "Der Geschmolzene Kern",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[5] = {
    Title = "General Drakkisaths Niedergang",
    Id = 5102,
    Level = 60,
    Attain = 55,
    Aim = "Begebt Euch zur Schwarzfelsspitze und schaltet General Drakkisath aus.",
    Location = "Marschall Maxwell (Brennende Steppe - Morgans Wacht "..yellow.."82,68"..white..")",
    Note = "Ihr findet General Drakkisath bei "..yellow.."[9]"..white..".",
    Prequest = "General Drakkisaths Befehl ("..yellow.."Lower Blackrock Spire"..white..")",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[6] = {
    Title = "Doomriggers Schnalle",
    Id = 4764,
    Level = 60,
    Attain = 57,
    Aim = "Bringt Mayara Wolkenglanz in der Brennenden Steppe Doomriggers Schnalle.",
    Location = "Mayara Wolkenglanz (Brennende Steppe - Morgans Wacht "..yellow.."84,69"..white..")",
    Note = "Die Vorquest bekommt Ihr von Graf Remington Kronenbrunn (Sturmwind - Festung Sturmwind "..yellow.."74,30"..white..").\n\nDoomriggers Schnalle befindet sich bei "..yellow.."[3]"..white.." in einer Truhe.",
    Prequest = "Mayara Wolkenglanz",
    Folgequest = "Lieferung an Kronenbrunn",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[7] = {
    Title = "Drachenfeueramulett",
    Id = 6502,
    Level = 60,
    Attain = 50,
    Aim = "Ihr müsst das Blut des schwarzen Drachenhelden von General Drakkisath bekommen. Ihr findet Drakkisath in seinem Thronsaal hinter den Hallen des Aufstiegs auf der Schwarzfelsspitze.",
    Location = "Haleh (Winterquell "..yellow.."54,51"..white..")",
    Note = "Letzter Teil der Onyxia-Questreihe für die Allianz. Ihr findet General Drakkisath bei "..yellow.."[9]"..white..".",
    Prequest = "Das Großdrachenauge",
    Rewards = {
        Text = "Belohnung: ",
        { id = 16309 }, --Drakefire Amulet Neck
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[8] = {
    Title = "Schwarzfausts Befehl",
    Id = 7761,
    Level = 60,
    Attain = 55,
    Aim = "Das war ja vielleicht mal ein dummer Orc. Es sieht so aus, als müsstet Ihr dieses Brandzeichen finden, um an das Mal von Drakkisath zu gelangen. Damit sollte sich die Befehlskugel aktivieren lassen.$B$BDem Brief zufolge, wird das Brandzeichen von General Drakkisath bewacht. Vielleicht solltet Ihr diesem Hinweis nachgehen.",
    Location = "Schwarzfausts Befehl (droppt vom Rüstmeister der Schmetterschilde "..yellow.."[7] auf der Eingangskarte"..white..")",
    Note = "Pechschwingenhort-Einstimmungsquest. Der Rüstmeister der Schmetterschilde befindet sich, wenn Ihr vor dem LBRS/UBRS-Portal rechts abbiegt.\n\nGeneral Drakkisath ist bei "..yellow.."[9]"..white..". Das Brandzeichen ist hinter ihm.",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[9] = {
    Title = "Letzte Vorbereitungen",
    Id = 8994,
    Level = 60,
    Attain = 58,
    Aim = "Bringt Bodley im Schwarzfels 40 Schwarzfelsarmschienen und ein Fläschchen der obersten Macht.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'. Schwarzfelsarmschienen droppen von Gegnern mit Schwarzfaust im Namen. Fläschchen der obersten Macht wird von einem Alchemisten hergestellt.",
    Prequest = "Das rechte Stück von Lord Valthalaks Amulett ("..yellow.."Upper Blackrock Spire"..white..")",
    Folgequest = "Mea Culpa, Lord Valthalak",
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[10] = {
    Title = "Mea Culpa, Lord Valthalak",
    Id = 8995,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um Lord Valthalak zu beschwören. Macht ihn unschädlich und benutzt dann Lord Valthalaks Amulett bei seiner Leiche. Danach werdet Ihr dem Geist von Lord Valthalak sein Amulett zurückgeben müssen.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'. Lord Valthalak wird bei "..yellow.."[8]"..white.." beschworen. Die aufgelisteten Belohnungen sind für 'Rückkehr zu Bodley'.",
    Prequest = "Letzte Vorbereitungen",
    Folgequest = "Rückkehr zu Bodley",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 22057 }, --Brazier of Invocation Item
        { id = 22344 }, --Brazier of Invocation: User's Manual Item
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[11] = {
    Title = "Die Dämonenschmiede",
    Id = 5127,
    Level = 60,
    Attain = 55,
    Aim = "Begebt Euch zur Schwarzfelsspitze und sucht Goraluk Hammerbruch. Erschlagt ihn und wendet dann die blutbefleckte Pike auf seine Leiche an. Nachdem seine Seele abgesaugt wurde, wird die Pike seelenbefleckt sein.$B$BIhr müsst außerdem die ungeschmiedete runenbedeckte Brustplatte finden.$B$BBringt die seelenbefleckte Pike und die ungeschmiedete runenbedeckte Brustplate zu Lorax in Winterquell.",
    Location = "Lorax (Winterquell "..yellow.."64,74"..white..")",
    Note = "Schmiedequest. Goraluk Hammerbruch ist bei "..yellow.."[5]"..white..".",
    Prequest = "Lorax' Geschichte",
    Rewards = {
        Text = "Belohnung: 1 und 2 und 3",
        { id = 12696 }, --Plans: Demon Forged Breastplate Pattern
        { id = 9224, quantity = 5 }, --Elixir of Demonslaying Potion
        { id = 12849 }, --Demon Kissed Sack Container
    }
}
kQuestInstanceData.BlackrockSpireUpper.Alliance[12] = {
    Title = "Die obere Bindung I",
    Id = 41011,
    Level = 60,
    Attain = 55,
    Aim = "Sammelt eine Drachenkinladung von den schwarzen Drachenkin in der Schwarzfelsspitze für Parnabus in Gilneas.",
    Location = "Parnabus <Wandernder Zauberer> (Gilneas "..yellow.."[22.9,74.4]"..white..", ganz im Süden von Gilneas, westlich vom Fluss, in einem einsamen Haus)",
    Note = "Sehr empfehlenswert: Nehmt die Vorquest 'Die Bindung von Xanthar' von Hanvar der Rechtschaffene (Gebirgspass der Totenwinde in der kleinen Kirche außerhalb von Karazhan "..yellow.."[40.9,79.3]"..white..") an.\nDie Belohnung für die letzte Quest der Oberen Bindung-Questreihe ist das Questitem 'Die Obere Bindung von Xanthar' für die Quest 'Die Bindung von Xanthar'.",
    Prequest = "Die Bindung von Xanthar",
    Folgequest = "Die obere Bindung II -> Die obere Bindung III "..yellow.."[Düsterbruch West]"..white.." -> Die obere Bindung IV",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61696 }, --The Upper Binding of Xanthar Quest Item
    }
}
for i = 1, 4 do
    kQuestInstanceData.BlackrockSpireUpper.Horde[i] = kQuestInstanceData.BlackrockSpireUpper.Alliance[i]
end
kQuestInstanceData.BlackrockSpireUpper.Horde[5] = {
    Title = "Die Dunkelsteinschrifttafel",
    Id = 4768,
    Level = 60,
    Attain = 57,
    Aim = "Bringt der Schattenmagierin Vivian Lagrave in Kargath die Dunkelsteinschrifttafel.",
    Location = "Schattenmagierin Vivian Lagrave (Ödland - Kargath "..yellow.."2,47"..white..")",
    Note = "Die Vorquest bekommt Ihr von Apothekerin Zinge in Unterstadt - Das Apothekarium ("..yellow.."50,68"..white..").\n\nDie Dunkelsteinschrifttafel befindet sich bei "..yellow.."[3]"..white.." in einer Truhe.",
    Prequest = "Vivian Lagrave und die Dunkelsteinschrifttafel",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 15861 }, --Swiftfoot Treads Feet, Leather
        { id = 15860 }, --Blinkstrike Armguards Wrist, Plate
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[6] = {
    Title = "Für die Horde!",
    Id = 4974,
    Level = 60,
    Attain = 55,
    Aim = "Begebt Euch zur Schwarzfelsspitze und tötet den Kriegshäuptling Rend Schwarzfaust. Nehmt seinen Kopf und kehrt nach Orgrimmar zurück.",
    Location = "Thrall (Orgrimmar "..yellow.."31,38"..white..")",
    Note = "Onyxia-Einstimmungsquest. Ihr findet Kriegshäuptling Rend Schwarzfaust bei "..yellow.."[6]"..white..".",
    Prequest = "Befehl des Kriegsherrn -> Etriggs Weisheit",
    Folgequest = "Was der Wind erzählt",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 13966 }, --Mark of Tyranny Trinket
        { id = 13968 }, --Eye of the Beast Trinket
        { id = 13965 }, --Blackhand's Breadth Trinket
    }
}
kQuestInstanceData.BlackrockSpireUpper.Horde[7] = {
    Title = "Oculus-Illusionen",
    Id = 6569,
    Level = 60,
    Attain = 55,
    Aim = "Reist zur Schwarzfelsspitze und sammelt 20 schwarze Drachenbrutaugen. Kehrt zu Myranda der Vettel zurück, sobald Ihr die Aufgabe erfüllt habt.",
    Location = "Myranda die Vettel (Westliche Pestländer "..yellow.."50,77"..white..")",
    Note = "Drachenkin lassen die Augen fallen.",
    Prequest = "Für die Horde! -> Was der Wind erzählt -> Meisterin der Illusionen",
    Folgequest = "Aschenschwinge",
}
kQuestInstanceData.BlackrockSpireUpper.Horde[8] = {
    Title = "Blut des schwarzen Großdrachenhelden",
    Id = 6602,
    Level = 60,
    Attain = 55,
    Aim = "Begebt Euch zur Schwarzfelsspitze und tötet General Drakkisath. Sammelt sein Blut und bringt es zu Rokaro.",
    Location = "Rokaro (Desolace - Schattenflucht "..yellow.."25,71"..white..")",
    Note = "Letzter Teil der Onyxia-Vorquest. Ihr findet General Drakkisath bei "..yellow.."[9]"..white..".",
    Prequest = "Aschenschwinge -> Aufstieg...",
    Rewards = {
        Text = "Belohnung: ",
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
    Story = "Vor zwölftausend Jahren von einer geheimen Sekte von Nachtelfen-Zauberern erbaut, wurde die antike Stadt Eldre'Thalas genutzt, um Königin Azsharas wertvollste arkane Geheimnisse zu schützen. Obwohl sie von der Großen Zerreißung der Welt verwüstet wurde, steht ein Großteil der wundersamen Stadt noch immer als imposantes Düsterbruch. Die drei unterschiedlichen Bezirke der Ruinen wurden von allen möglichen Kreaturen überrannt - besonders von spektralen Hochgeborenen, üblen Satyren und brutalen Ogern. Nur die waghalsigste Gruppe von Abenteurern kann diese zerbrochene Stadt betreten und sich den antiken Übeln stellen, die in ihren uralten Gewölben eingeschlossen sind.",
    Caption = "Düsterbruch (East)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulEast.Alliance[1] = {
    Title = "Pusillin und der Älteste Azj'Tordin",
    Id = 7441,
    Level = 58,
    Attain = 54,
    Aim = "Reist nach Düsterbruch und macht den Dämonen Pusillin ausfindig. Überzeugt ihn mit allen Mitteln davon, Euch Azj'Tordin's Buch der Zauberformeln zu geben.$B$BKehrt mit dem Buch zu Az'Tordin, beim Larisspavillon in Feralas, zurück.",
    Location = "Azj'Tordin (Feralas - Lariss Pavillion "..yellow.."76,37"..white..")",
    Note = "Pusillin ist in Düsterbruch "..yellow.."Ost"..white.." bei "..yellow.."[1]"..white..". Er rennt weg, wenn Ihr mit ihm sprecht, hält aber an und kämpft bei "..yellow.."[2]"..white..". Er lässt den Mondsichelschlüssel fallen, der für Düsterbruch Nord und West benutzt wird.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 18411 }, --Spry Boots Feet, Leather
        { id = 18410 }, --Sprinter's Sword Two-Hand, Sword
    }
}
kQuestInstanceData.DireMaulEast.Alliance[2] = {
    Title = "Lethtendris' Netz",
    Id = 7488,
    Level = 57,
    Attain = 54,
    Aim = "Bringt Lethtendris' Netz zu Latronicus Mondspeer in der Mondfederfeste in Feralas.",
    Location = "Latronicus Mondspeer (Feralas - Mondfederfeste "..yellow.."30,46"..white..")",
    Note = "Lethtendris ist in Düsterbruch "..yellow.."Ost"..white.." bei "..yellow.."[3]"..white..". Die Vorquest kommt von Kurier Hammerfall in Eisenschmiede. Er durchstreift die ganze Stadt.",
    Prequest = "Die Mondfederfeste",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18491 }, --Lorespinner Main Hand, Dagger
    }
}
kQuestInstanceData.DireMaulEast.Alliance[3] = {
    Title = "Die Splitter der Teufelsranke",
    Id = 5526,
    Level = 60,
    Attain = 56,
    Aim = "Sucht die Teufelsranke in Düsterbruch und nehmt einen Teufelsrankensplitter mit Euch. Aller Wahrscheinlichkeit nach werdet Ihr Alzzin den Wildformer töten müssen, um an die Teufelsranke zu gelangen. Benutzt das Reliquiar der Reinheit, um darin den Splitter sicher zu versiegeln, und bringt das versiegelte Reliquiar zu Rabine Saturna in Nachthafen auf der Mondlichtung.",
    Location = "Rabine Saturna (Mondlichtung - Nachthafen "..yellow.."51,44"..white..")",
    Note = "Ihr findet Alzzin den Wildformer im "..yellow.."Ost"..white.."-Teil von Düsterbruch bei "..yellow.."[5]"..white..". Das Relikt befindet sich in Silithus bei "..yellow.."62,54"..white..". Die Vorquest kommt ebenfalls von Rabine Saturna.",
    Prequest = "Ein Reliquiar der Reinheit",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 18535 }, --Milli's Shield Shield
        { id = 18536 }, --Milli's Lexicon Held In Off-hand
    }
}
kQuestInstanceData.DireMaulEast.Alliance[4] = {
    Title = "Das linke Stück von Lord Valthalaks Amulett",
    Id = 8967,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nIsalien wird bei "..yellow.."[5]"..white.." beschworen.",
    Prequest = "Komponenten von großer Wichtigkeit",
    Folgequest = "Ich sehe die Insel Alcaz in Eurer Zukunft",
}
kQuestInstanceData.DireMaulEast.Alliance[5] = {
    Title = "Das rechte Stück von Lord Valthalaks Amulett",
    Id = 8990,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit Lord Valthalaks zusammengesetzten Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nIsalien wird bei "..yellow.."[5]"..white.." beschworen.",
    Prequest = "Mehr Komponenten von großer Wichtigkeit",
    Folgequest = "Letzte Vorbereitungen ("..yellow.."Upper Blackrock Spire"..white..")",
}
kQuestInstanceData.DireMaulEast.Alliance[6] = {
    Title = "Das Fundament des Gefängnisses",
    Id = 7581,
    Level = 60,
    Attain = 60,
    Aim = "Reist nach Düsterbruch in Feralas und holt Euch das Blut von 15 Satyrn der Wildhufe, die im Wucherborkenviertel ansässig sind. Kehrt anschließend zu Daio in der Faulenden Narbe zurück.",
    Location = "Daio der Klapprige (Verwüstete Lande - Die Faulende Narbe "..yellow.."34,50"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Dies und eine weitere Quest von Daio der Klapprige sind Hexenmeister-Quests für den Zauber Ritual der Verdammnis. Der einfachste Weg zu den Satyren der Wildhufe ist, Düsterbruch Ost durch die 'Hintertür' am Larisspavillon (Feralas "..yellow.."77,37"..white..") zu betreten. Ihr benötigt jedoch den Mondsichelschlüssel.",
}
kQuestInstanceData.DireMaulEast.Alliance[7] = {
    Title = "Arkane Erfrischung",
    Id = 7463,
    Level = 60,
    Attain = 60,
    Aim = "Reist nach Düsterbruch in das Wucherborkenviertel und besiegt den Wasserelementar Hydrobrut. Kehrt anschließend mit der Hydrobrutessenz zum Wissenshüter Lydros im Athenaeum zurück.",
    Location = "Wissenshüter Lydros (Düsterbruch - West oder North "..yellow.."[1] Library"..white..")",
    Note = red.."Nur Magier"..white..": Hydrobrutessenz droppt von [3] Hydrobrut. Belohnung: Ihr könnt Herbeigezaubertes Kristallwasser benutzen.",
    Folgequest = "Eine besondere Art der Beschwörung",
    Rewards = {
        Text = "Belohnung: ",
        { id = 83002 }, --Tome of Refreshment Ritual Pattern
    }
}
kQuestInstanceData.DireMaulEast.Alliance[8] = {
    Title = "Der Wildformer",
    Id = 41016,
    Level = 60,
    Attain = 55,
    Aim = "Bringt den Kopf von Alzzin dem Wildformer zu Erzdruide Traumwind in Nordanaar in Hyjal.",
    Location = "Erzdruide Traumwind (Hyjal - Nordanaar "..yellow.."84.8,29.3"..white.." oberstes Stockwerk des großen Baums)",
    Note = "Ihr findet Alzzin den Wildformer bei "..yellow.."[5]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 61199 }, --Bright Dream Shard Reagent
        { id = 61703 }, --Talisman of the Dreamshaper Neck
    }
}
kQuestInstanceData.DireMaulEast.Alliance[9] = {
    Title = "Warpbaum einwickeln",
    Id = 41376,
    Level = 61,
    Attain = 60,
    Aim = "Bringt 5 Blaue Blätter zu Wissenshüter Lydros.",
    Location = "Wissenshüter Lydros (Düsterbruch - West oder North "..yellow.."[1] Library"..white..")",
    Note = red.."Nur Druiden"..white..": Blaue Blätter droppen von Baumschreiter.\nVorquest beginnt bei [von Uralten und Baumschreitern] - (Turm von Karazhan "..yellow.."nahe [0]"..white..")",
    Rewards = {
        Text = "Belohnung: ",
        { id = 51070 }, --Glyph of the Arcane Treant Glyph
    }
}
kQuestInstanceData.DireMaulEast.Horde[1] = kQuestInstanceData.DireMaulEast.Alliance[1]
kQuestInstanceData.DireMaulEast.Horde[2] = {
    Title = "Lethtendris' Netz",
    Id = 7489,
    Level = 57,
    Attain = 54,
    Aim = "Bringt Lethtendris' Netz zu Latronicus Mondspeer in der Mondfederfeste in Feralas.",
    Location = "Talo Dornhuf (Feralas - Camp Mojache "..yellow.."76,43"..white..")",
    Note = "Lethtendris ist in Düsterbruch "..yellow.."Ost"..white.." bei "..yellow.."[3]"..white..". Die Vorquest kommt von Kriegsrufer Gorlach in Orgrimmar. Er durchstreift die ganze Stadt.",
    Prequest = "Camp Mojache",
    Rewards = kQuestInstanceData.DireMaulEast.Alliance[2].Rewards
}
for i = 3, 9 do
    kQuestInstanceData.DireMaulEast.Horde[i] = kQuestInstanceData.DireMaulEast.Alliance[i]
end

--------------- Dire Maul (North) ---------------
kQuestInstanceData.DireMaulNorth = {
    Story = kQuestInstanceData.DireMaulEast.Story,
    Caption = "Düsterbruch (North)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulNorth.Alliance[1] = {
    Title = "Eine beschädigte Falle",
    Id = 1193,
    Level = 60,
    Attain = 56,
    Aim = "Repariert die Falle.",
    Location = "Eine beschädigte Falle (Düsterbruch "..yellow.."North"..white..")",
    Note = "Wiederholbare Quest. Um die Falle zu reparieren, müsst Ihr einen [Thoriumapparat] und ein [Frostöl] benutzen.",
}
kQuestInstanceData.DireMaulNorth.Alliance[2] = {
    Title = "Der Ogeranzug der Gordok",
    Id = 5518,
    Level = 60,
    Attain = 56,
    Aim = "Bringt 4 Runenstoffballen, 8 Stücke unverwüstliches Leder, 2 Runenfaden und etwas Ogergerbemittel zu Knot Zwingschraub. Momentan ist er im Gordokflügel von Düsterbruch angekettet.",
    Location = "Knot Zwingschraub (Düsterbruch "..yellow.."North, [4]"..white..")",
    Note = "Wiederholbare Quest. Ihr bekommt das Ogergerbemittel nahe "..yellow.."[4] (oben)"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18258 }, --Gordok Ogre Suit Disguise
    }
}
kQuestInstanceData.DireMaulNorth.Alliance[3] = {
    Title = "Befreit Knot!",
    Id = 5525,
    Level = 60,
    Attain = 57,
    Aim = "Sammelt einen Gordok-Fesselschlüssel für Knot Zwingschraub.",
    Location = "Knot Zwingschraub (Düsterbruch "..yellow.."North, [4]"..white..")",
    Note = "Wiederholbare Quest. Jeder Aufseher kann den Schlüssel droppen.",
}
kQuestInstanceData.DireMaulNorth.Alliance[4] = {
    Title = "Die offene Rechnung der Gordok",
    Id = 1318,
    Level = 60,
    Attain = 56,
    Aim = "Findet die Stulpen der Gordokmacht und bringt sie zu Hauptmann Krombruch in Düsterbruch.$B$BKrombruch zufolge sagen die \"Alte Zeit Geschichten\", dass Tortheldrin - ein \"gruseliger\" Elf, der sich selbst als Prinz bezeichnet- sie einem der Gordokkönige gestohlen hat.",
    Location = "Hauptmann Krombruch (Düsterbruch "..yellow.."North, [5]"..white..")",
    Note = "Der Prinz ist in Düsterbruch "..yellow.."West"..white.." bei "..yellow.."[7]"..white..". Der Handschuh befindet sich in seiner Nähe in einer Truhe. Ihr könnt diese Quest nur nach einem Tributlauf annehmen und müsst den Buff 'König der Gordok' haben.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Caption = "Düsterbruch (West)",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DireMaulWest.Alliance[1] = {
    Title = "Elfische Legenden",
    Id = 7482,
    Level = 60,
    Attain = 54,
    Aim = "Sucht in Düsterbruch nach Kariel Winthalus. Meldet Euch anschließend bei dem Weisen Korolusk in Camp Mojache.",
    Location = "Gelehrte Runendorn (Feralas - Mondfederfeste "..yellow.."31,43"..white..")",
    Note = "Ihr findet Kariel Winthalus in der "..yellow.."Bibliothek (West)"..white..".",
}
kQuestInstanceData.DireMaulWest.Alliance[2] = {
    Title = "Der innere Wahnsinn",
    Id = 7461,
    Level = 60,
    Attain = 56,
    Aim = "Zerstört alle Wächter, die um die 5 Pylonen herumstehen, welche Immol'thars Gefängnis mit Energie versorgen. Sobald die Pylone deaktiviert wurden, wird sich das Kraftfeld, das Immol'thar umgibt, auflösen.$B$BBetretet Immol'thars Gefängnis und vernichtet den verdorbenen Dämonen. Anschließend müsst Ihr Prinz Tortheldrin im Athenaeum entgegentreten.$B$BKehrt nach Abschluss der Aufgabe zur uralten Shen'dralar im Hof zurück.",
    Location = "Uralte Shen'dralar (Düsterbruch "..yellow.."West, [1] (above)"..white..")",
    Note = "Die Pylone sind als "..blue.."[B]"..white.." markiert. Immol'thar ist bei "..yellow.."[6]"..white..", Prinz Tortheldrin bei "..yellow.."[7]"..white..".",
    Folgequest = "Der Schatz der Shen'dralar",
}
kQuestInstanceData.DireMaulWest.Alliance[3] = {
    Title = "Der Schatz der Shen'dralar",
    Id = 7462,
    Level = 60,
    Attain = 56,
    Aim = "Kehrt in das Athenaeum zurück und sucht den Schatz der Shen'dralar. Nehmt Euch Eure Belohnung!",
    Location = "Uralte Shen'dralar (Düsterbruch "..yellow.."West, [1]"..white..")",
    Note = "Ihr findet den Schatz unter der Treppe "..yellow.."[7]"..white..".",
    Prequest = "Der innere Wahnsinn",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 18424 }, --Sedge Boots Feet, Leather
        { id = 18421 }, --Backwood Helm Head, Mail
        { id = 18420 }, --Bonecrusher Two-Hand, Mace
    }
}
kQuestInstanceData.DireMaulWest.Alliance[4] = {
    Title = "Schreckensross von Xoroth",
    Id = 7631,
    Level = 60,
    Attain = 60,
    Aim = "Lest Morzuls Anweisungen. Beschwört ein xorothianisches Schreckensross, besiegt es und bindet seinen Geist an Euch.",
    Location = "Mor'zul Blutbringer (Brennende Steppe "..yellow.."12,31"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Finale Quest der Hexenmeister-Episches-Reittier-Questreihe. Zuerst müsst Ihr alle mit "..blue.."[B]"..white.." markierten Pylone abschalten und dann Immol'thar bei "..yellow.."[6]"..white.." töten. Danach könnt Ihr mit dem Beschwörungsritual beginnen. Stellt sicher, dass Ihr über 20 Seelensteine dabei habtone und einen Hexenmeister speziell dafür einteilt, die Glocke, Kerze und Rad aufrechtzuerhalten. Die erscheinenden Verdammniswachen können versklavt werden. Nach Abschluss sprecht mit dem Schreckensross-Geist, um die Quest abzuschließen.",
    Prequest = "Wichtellieferung ("..yellow.."Scholomance"..white..")", -- 7629",
}
kQuestInstanceData.DireMaulWest.Alliance[5] = {
    Title = "Der Smaragdgrüne Traum",
    Id = 7506,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Der Smaragdgrüne Traum (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Druiden"..white..": Ihr gebt das Buch bei Wissenshüter Javon in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18470 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[6] = {
    Title = "Das größte Volk von Jägern",
    Id = 7503,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Das größte Volk von Jägern (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Jäger"..white..": Ihr gebt das Buch bei Wissenshüterin Mykos in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18473 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[7] = {
    Title = "Das Arkanistenkochbuch",
    Id = 7500,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Das Arkanistenkochbuch (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Magier"..white..": Ihr gebt das Buch bei Wissenshüter Kildrath in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18468 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[8] = {
    Title = "Vom Licht und wie man es schwingt",
    Id = 7501,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Vom Licht und wie man es schwingt (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Paladine"..white..": Ihr gebt das Buch bei Wissenshüterin Mykos in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18472 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[9] = {
    Title = "Heiliger Fleischklops: Was das Licht Dir nicht erzählt",
    Id = 7504,
    Level = 60,
    Attain = 56,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Heiliger Fleischklops: Was das Licht Dir nicht erzählt (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Priester"..white..": Ihr gebt das Buch bei Wissenshüter Javon in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18469 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[10] = {
    Title = "Garona: Eine Studie über Heimlichkeit und Verrat",
    Id = 7498,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Garona: Eine Studie über Heimlichkeit und Verrat (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Schurken"..white..": Ihr gebt das Buch bei Wissenshüter Kildrath in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18465 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[11] = {
    Title = "Frostschock und Du",
    Id = 7505,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Frostschock und Du (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Schamanen"..white..": Ihr gebt das Buch bei Wissenshüter Javon in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18471 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[12] = {
    Title = "Schatten einspannen",
    Id = 7502,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Schatten einspannen (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Hexenmeister"..white..": Ihr gebt das Buch bei Wissenshüterin Mykos in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18467 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[13] = {
    Title = "Kodex der Verteidigung",
    Id = 7499,
    Level = 60,
    Attain = 54,
    Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück.",
    Location = "Kodex der Verteidigung (randomly drops off bosses in all Düsterbruch wings)",
    Note = red.."Nur Krieger"..white..": Ihr gebt das Buch bei Wissenshüter Kildrath in der "..yellow.."1' Bibliothek"..white.." ab.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18466 }, --Royal Seal of Eldre'Thalas Trinket
    }
}
kQuestInstanceData.DireMaulWest.Alliance[14] = {
    Title = "Foliant der Fokussierung",
    Id = 7479,
    Level = 60,
    Attain = 58,
    Aim = "Bringt ein Libram der Fokussierung, 1 Lupenreiner schwarzer Diamant, 4 Große brillante Scherben und 2 Schattenhaut zu Wissenshüter Lydros in Düsterbruch, um ein Arkanum der Fokussierung zu erhalten.",
    Location = "Wissenshüter Lydros (Düsterbruch - West oder North "..yellow.."[1] Library"..white..")",
    Note = "Es ist keine Vorquest, aber Elfische Legenden muss abgeschlossen sein, bevor diese Quest gestartet werden kann.\nDas Libram ist ein zufälliger Drop in Düsterbruch und handelbar, kann also im Auktionshaus gefunden werden. Schattenhaut ist Seelengebunden und kann von einigen Bossen, Auferstandenen Konstrukten und Auferstandenen Knochenwärtern in "..yellow.."Scholomance"..white.." droppen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18330 }, --Arcanum of Focus Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[15] = {
    Title = "Foliant des Schutzes",
    Id = 7480,
    Level = 60,
    Attain = 58,
    Aim = "Bringt ein Libram des Schutzes, 1 Lupenreiner schwarzer Diamant, 2 Große brillante Scherben und 1 Ausgefranste Monstrositätenstickerei zu Wissenshüter Lydros in Düsterbruch, um ein Arkanum des Schutzes zu erhalten.",
    Location = "Wissenshüter Lydros (Düsterbruch - West oder North "..yellow.."[1] Library"..white..")",
    Note = "Es ist keine Vorquest, aber Elfische Legenden muss abgeschlossen sein, bevor diese Quest gestartet werden kann.\nDas Libram ist ein zufälliger Drop in Düsterbruch und handelbar, kann also im Auktionshaus gefunden werden. Ausgefranste Monstrositätenstickerei ist Seelengebunden und kann von Ramstein der Verschlinger, Gallspeier, Gallenspucker und Flickwerkschrecken in "..yellow.."Stratholme"..white.." droppen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18331 }, --Arcanum of Protection Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[16] = {
    Title = "Foliant der Schnelligkeit",
    Id = 7478,
    Level = 60,
    Attain = 58,
    Aim = "Bringt ein Libram der Schnelligkeit, 1 Lupenreiner schwarzer Diamant, 2 Große brillante Scherben und 2 Blut von Helden zu Wissenshüter Lydros in Düsterbruch, um ein Arkanum der Schnelligkeit zu erhalten.",
    Location = "Wissenshüter Lydros (Düsterbruch - West oder North "..yellow.."[1] Library"..white..")",
    Note = "Es ist keine Vorquest, aber Elfische Legenden muss abgeschlossen sein, bevor diese Quest gestartet werden kann.\nDas Libram ist ein zufälliger Drop in Düsterbruch und handelbar, kann also im Auktionshaus gefunden werden. Blut von Helden ist Seelengebunden und kann an zufälligen Orten auf dem Boden in den Westlichen und Östlichen Pestländern gefunden werden.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18329 }, --Arcanum of Rapidity Enchant
    }
}
kQuestInstanceData.DireMaulWest.Alliance[17] = {
    Title = "Forors Kompendium",
    Id = 7507,
    Level = 60,
    Attain = 60,
    Aim = "Bringt Forors Kompendium des Drachentötens zurück in das Athenaeum.",
    Location = "Forors Kompendium des Drachentötens (random boss drop in "..yellow.."Düsterbruch"..white..")",
    Note = red.."Krieger- oder Paladinquest."..white.." Abgabe bei Wissenshüter Lydros (Düsterbruch - West oder Nord "..yellow.."[1] Bibliothek"..white.."). Die Abgabe ermöglicht es Euch, die Quest für Quel'Serrar zu starten.",
    Folgequest = "Das Schmieden von Quel'Serrar",
}
kQuestInstanceData.DireMaulWest.Alliance[18] = {
    Title = "Geheimnisse bewahren",
    Id = 40254,
    Level = 58,
    Attain = 45,
    Aim = "Reist nach Düsterbruch und tötet das große Böse, von dem die Hochgeborenen Energie absaugen, sammelt daraus Reine Leyessenz und kehrt zu Hüterin Laena in Azshara zurück.",
    Location = "Hüterin Laena (Azshara "..yellow.."44,45.4"..white..")",
    Note = "Immol'thar "..yellow.."[6]"..white.." lässt Reine Leyessenz fallen.\nDie Questreihe beginnt mit der Quest 'Die Aufgabe der Hüter' bei Hüter Iselus "..yellow.."89,8,33.8"..white.." Azshara, nordöstliche Küstenecke.",
    Prequest = "Wiederherstellung der Ley-Linien",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60333 }, --Azshara Keeper's Staff Staff
        { id = 60334 }, --Ring of Eldara Ring
    }
}
kQuestInstanceData.DireMaulWest.Alliance[19] = {
    Title = "Die obere Bindung III",
    Id = 41013,
    Level = 60,
    Attain = 55,
    Aim = "Sammelt eine Überladene arkane Resonanz von den Arkanelementaren von Düsterbruch für Parnabus in Gilneas.",
    Location = "Parnabus <Wandernder Zauberer> (Gilneas "..yellow.."[22.9,74.4]"..white..", ganz im Süden von Gilneas, westlich vom Fluss, in einem einsamen Haus)",
    Note = "Sehr empfehlenswert: Nehmt die Vorquest 'Die Bindung von Xanthar' von Hanvar der Rechtschaffene (Gebirgspass der Totenwinde in der kleinen Kirche außerhalb von Karazhan "..yellow.."[40.9,79.3]"..white..") an.\nDie Belohnung für die letzte Quest der Oberen Bindung-Questreihe ist das Questitem 'Die Obere Bindung von Xanthar' für die Quest 'Die Bindung von Xanthar'.\nArkane Torrents große Elementare im Kreis um "..yellow.."[6]"..white.." lassen Überladene arkane Resonanz fallen.",
    Prequest = "Die Bindung von Xanthar -> Die obere Bindung I "..yellow.."[Obere Schwarzfelsspitze]"..white.." -> Die obere Bindung II",
    Folgequest = "Die obere Bindung IV",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61696 }, --The Upper Binding of Xanthar Quest Item
    }
}
kQuestInstanceData.DireMaulWest.Alliance[20] = {
    Title = "Der Schlüssel zu Karazhan VIII",
    Id = 40827,
    Level = 60,
    Attain = 58,
    Aim = "Tötet Immol'thar in Düsterbruch, holt Edelsteine aus seiner Haut und kehrt zu Vandol zurück.",
    Location = "Dolvan Windbrace (Düstermarschen -  "..yellow.."[71.1,73.2]"..white..")",
    Note = "Vorquests Untere Karazhan-Hallen. Arkanisierte Edelsteine droppen von "..yellow.."[6]"..white..".",
    Prequest = "Der Schlüssel zu Karazhan I - VI -> Der Schlüssel zu Karazhan VII "..yellow.."[Stratholme]"..white.."",
    Folgequest = "Der Schlüssel zu Karazhan IX (BWL) -> Der Schlüssel zu Karazhan X",
}
kQuestInstanceData.DireMaulWest.Alliance[21] = {
    Title = "In den Traum III",
    Id = 40959,
    Level = 60,
    Attain = 58,
    Aim = "Sammelt ein Bindungsfragment von Klippenbrecher in Azshara, Überladenes arkanes Prisma von Arkanen Torrents im Westflügel von Düsterbruch und einen Splitter des Schlummerers vom Weber im Versunkenen Tempel. Meldet Euch mit den gesammelten Gegenständen bei Itharius in den Sümpfen des Elends.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."[81.6,27.7]"..white.." a green dragonkin)",
    Note = "Arkane Torrents große Elementare im Kreis um "..yellow.."[6]"..white.." lassen Überladenes arkanes Prisma fallen.\nDurch Abschluss dieser Questreihe erhaltet Ihr die Halskette und könnt die Hyjal-Raidinstanz Smaragdsanktum betreten.",
    Prequest = "In den Traum I -> In den Traum II",
    Folgequest = "In den Traum IV - VI",
    Rewards = {
        Text = "Belohnung: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.DireMaulWest.Horde[1] = {
    Title = "Elfische Legenden",
    Id = 7481,
    Level = 60,
    Attain = 54,
    Aim = "Sucht in Düsterbruch nach Kariel Winthalus. Meldet Euch anschließend bei dem Weisen Korolusk in Camp Mojache.",
    Location = "Weiser Korolusk (Feralas - Camp Mojache "..yellow.."74,43"..white..")",
    Note = "Ihr findet Kariel Winthalus in der "..yellow.."Bibliothek (West)"..white..".",
}
for i = 2, 21 do
    kQuestInstanceData.DireMaulWest.Horde[i] = kQuestInstanceData.DireMaulWest.Alliance[i]
end

--------------- Maraudon ---------------
kQuestInstanceData.Maraudon = {
    Story = "Geschützt von den wilden Maraudine-Zentauren ist Maraudon einer der heiligsten Orte in Desolace. Der große Tempel/die Höhle ist die Grabstätte von Zaetar, einem von zwei unsterblichen Söhnen des Halbgottes Cenarius. Die Legende besagt, dass Zaetar und die Erdelementarprinzessin Theradras das missratene Zentaurenvolk zeugten. Es wird erzählt, dass sich die barbarischen Zentauren bei ihrer Entstehung gegen ihren Vater wandten und ihn töteten. Einige glauben, dass Theradras in ihrer Trauer Zaetars Geist in der verschlungenen Höhle gefangen hielt - seine Energien für einen bösartigen Zweck nutzte. Die unterirdischen Tunnel sind von den bösartigen, längst toten Geistern der Zentauren-Khane bevölkert, sowie von Theradras' eigenen tobenden Elementarschergen.",
    Caption = "Maraudon",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Maraudon.Alliance[1] = {
    Title = "Schattensplitter",
    Id = 7070,
    Level = 42,
    Attain = 38,
    Aim = "Sammelt 10 Schattensplitter aus Maraudon und bringt sie zu Uthel'nay nach Orgrimmar.",
    Location = "Erzmagier Tervosh (Düstermarschen - Die Insel Theramore "..yellow.."66,49"..white..")",
    Note = "Ihr bekommt den Schattensplitter von 'Schattensteinrumpler' oder 'Schattensteinzerkracher' außerhalb der Instanz auf der violetten Seite.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 17772 }, --Zealous Shadowshard Pendant Neck
        { id = 17773 }, --Prodigious Shadowshard Pendant Neck
    }
}
kQuestInstanceData.Maraudon.Alliance[2] = {
    Title = "Schlangenzunges Verderbnis",
    Id = 7041,
    Level = 47,
    Attain = 41,
    Aim = "Füllt die beschichtete himmelblaue Phiole am orangefarbenen Kristallteich in Maraudon.$B$BBenutzt die gefüllte himmelblaue Phiole mit den Schlangenstrunkranken, damit der verderbte Noxxiousspross herausgezwungen wird.$B$BHeilt 8 Pflanzen, indem Ihr diesen Noxxiousspross tötet und kehrt dann zu Vark Schlachtnarbe in Schattenflucht zurück.",
    Location = "Talendria (Desolace - Die Nijelspitze "..yellow.."68,8"..white..")",
    Note = "Ihr könnt die Phiole an jedem Tümpel außerhalb der Instanz auf der orangenen Seite füllen. Die Pflanzen befinden sich in den orangenen und violetten Bereichen innerhalb der Instanz.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 17768 }, --Woodseed Hoop Ring
        { id = 17778 }, --Sagebrush Girdle Waist, Leather
        { id = 17770 }, --Branchclaw Gauntlets Hands, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[3] = {
    Title = "Dunkles Böses",
    Id = 7028,
    Level = 47,
    Attain = 41,
    Aim = "Sammelt 15 theradrische Kristallschnitzereien für Trista in Desolace.",
    Location = "Weide (Desolace "..yellow.."62,39"..white..")",
    Note = "Die meisten Gegner in Maraudon lassen die Schnitzereien fallen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 17775 }, --Acumen Robes Chest, Cloth
        { id = 17776 }, --Sprightring Helm Head, Leather
        { id = 17777 }, --Relentless Chain Chest, Mail
        { id = 17779 }, --Hulkstone Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.Maraudon.Alliance[4] = {
    Title = "Die Anweisungen des Pariahs",
    Id = 7067,
    Level = 48,
    Attain = 39,
    Aim = "Lest die Anweisungen des Pariahs. Beschafft Euch danach das Amulett der Vereinigung von Maraudon und bringt es dem Zentaurenpariah im südlichen Desolace.",
    Location = "Zentaurenpariah (Desolace "..yellow.."45,86"..white..")",
    Note = "Die 5 Khane (Beschreibung für Die Anleitung des Pariahs)",
    Rewards = {
        Text = "Belohnung: ",
        { id = 17774 }, --Mark of the Chosen Trinket
    },
    page = {2, "Du findest den Zentaurenparia im Süden von Desolace. Er wandert zwischen "..yellow.."44,85"..white.." und "..yellow.."50,87"..white..".\nZuerst musst du den Namenlosen Propheten töten ("..yellow.."[A] auf der Eingangs-Karte"..white.."). Du findest ihn, bevor du die Instanz betrittst – an der Stelle, an der du entscheiden kannst, ob du den lila oder den orangefarbenen Eingang nimmst. Nachdem du ihn getötet hast, musst du die 5 Kahns töten. Den ersten findest du, wenn du den mittleren Weg wählst ("..yellow.."[1] auf der Eingangs-Karte"..white.."). Den zweiten findest du im lila Teil von Maraudon, aber noch vor dem eigentlichen Instanzeingang ("..yellow.."[2] auf der Eingangs-Karte"..white.."). Der dritte befindet sich im orangefarbenen Teil vor dem Instanzeingang ("..yellow.."[3] auf der Eingangs-Karte"..white.."). Der vierte ist in der Nähe von "..yellow.."[4]"..white.." und der fünfte in der Nähe von "..yellow.."[1]"..white..".", },
}
kQuestInstanceData.Maraudon.Alliance[5] = {
    Title = "Legenden von Maraudon",
    Id = 7044,
    Level = 49,
    Attain = 41,
    Aim = "Beschafft die beiden Teile des Szepters von Celebras: den Celebriangriff und den Celebriandiamanten.$B$BFindet einen Weg, um mit Celebras zu sprechen.",
    Location = "Cavindra (Desolace - Maraudon "..yellow.."[4] on Entrance Map"..white..")",
    Note = "Ihr findet Cavindra am Anfang des orangenen Teils, bevor Ihr die Instanz betretet.\nIhr bekommt den Celebriangriff von Noxxion bei "..yellow.."[2]"..white..", den Celebriandiamant von Lord Schlangenzunge bei "..yellow.."[5]"..white..". Celebras ist bei "..yellow.."[7]"..white..". Ihr müsst ihn besiegen, um mit ihm sprechen zu können.",
    Folgequest = "Das Szepter von Celebras",
}
kQuestInstanceData.Maraudon.Alliance[6] = {
    Title = "Das Szepter von Celebras",
    Id = 7046,
    Level = 49,
    Attain = 41,
    Aim = "Helft Celebras dem Erlösten, während er das Szepter von Celebras herstellt.$B$BSprecht mit ihm, nachdem das Ritual vollendet ist.",
    Location = "Celebras der Erlöste (Maraudon "..yellow.."[7]"..white..")",
    Note = "Celebras stellt das Zepter her. Sprecht mit ihm, nachdem er fertig ist.",
    Prequest = "Legenden von Maraudon",
    Rewards = {
        Text = "Belohnung: ",
        { id = 17191 }, --Scepter of Celebras Item
    }
}
kQuestInstanceData.Maraudon.Alliance[7] = {
    Title = "Verderbnis von Erde und Samenkorn",
    Id = 7065,
    Level = 51,
    Attain = 45,
    Aim = "Tötet Prinzessin Theradras und kehrt zu Selendra in der Nähe von Schattenflucht in Desolace zurück.",
    Location = "Bewahrer Marandis (Desolace - Die Nijelspitze "..yellow.."63,10"..white..")",
    Note = "Ihr findet Prinzessin Theradras bei "..yellow.."[11]"..white..".",
    Folgequest = "Samenkorn des Lebens",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 17705 }, --Thrash Blade One-Hand, Sword
        { id = 17743 }, --Resurgence Rod Staff
        { id = 17753 }, --Verdant Keeper's Aim Bow
    }
}
kQuestInstanceData.Maraudon.Alliance[8] = {
    Title = "Samenkorn des Lebens",
    Id = 7066,
    Level = 51,
    Attain = 45,
    Aim = "Sucht Remulos bei der Mondlichtung auf und gebt ihm das Samenkorn des Lebens.",
    Location = "Zaetars Ghost (Maraudon "..yellow.."[11]"..white..")",
    Note = "Zaetars Geist erscheint nach dem Töten von Prinzessin Theradras "..yellow.."[11]"..white..". Ihr findet Bewahrer Remulos in (Mondlichtung - Der Schrein von Remulos "..yellow.."36,41"..white..").",
    Prequest = "Verderbnis von Erde und Samenkorn",
}
kQuestInstanceData.Maraudon.Alliance[9] = {
    Title = "Geschirr der Chimäre",
    Id = 41052,
    Level = 48,
    Attain = 38,
    Aim = "Holt das Geschirr der Chimäre aus Maraudon und bringt es zu Velos Scharfstoß im Chimaeratal in Feralas zurück.",
    Location = "Velos Scharfstoß (Feralas - Chimaeratal "..yellow.."[82.0,62.3]"..white.." südöstliche Ecke von Feralas)",
    Note = "Purple Maraudon satir boss Lord Schlangenzunge "..yellow.."[5]"..white.." drops Geschirr der Chimäre.",
    Prequest = "Reinigung des Nests -> Die Jungen füttern",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61517 }, --Chimaera's Eye Trinket
    }
}
kQuestInstanceData.Maraudon.Alliance[10] = {
    Title = "Warum nicht beides?",
    Id = 41142,
    Level = 50,
    Attain = 40,
    Aim = "Besorgt das Herz von Erdrutsch aus den Tiefen von Maraudon und die Essenz der Korrosion aus dem Hassschmiedebruch für Frig Donnerschmiede in Aerie Peak.",
    Location = "Frig Donneresschmied (Hinterlands - Nistgipfel "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Erdrutsch ist bei "..yellow.."[8]"..white..".",
    Prequest = "Ein Zeichen setzen -> Hab ich mal in einem Buch gelesen",
    Folgequest = "Meisterschaft des Donnerhammers",
    Rewards = {
        Text = "Belohnung: ",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
kQuestInstanceData.Maraudon.Alliance[11] = {
    Title = "Vorbereitung",
    Id = 41281,
    Level = 48,
    Attain = 34,
    Aim = "Holt eine Platte von Erdrutschs Körper aus Maraudon und bringt sie zu Thegren nahe den Ruinen von Corthan im Ödland.",
    Location = "Thegren <Artisan Gemologist> (Ödland - Ruinen von Corthan "..yellow.."[29, 27]"..white..").",
    Note = red.."Nur Juwelierskunst."..white.." Questreihe für Gemmologen-Spezialisierung.\nErdrutsch ist bei "..yellow.."[8]"..white..".",
    Prequest = "Meisterschaft in Edelsteinkunde -> Lebensblut -> Vorführung",
    Folgequest = "Der letzte Schliff",
}
kQuestInstanceData.Maraudon.Horde[1] = {
    Title = "Schattensplitter",
    Id = 7068,
    Level = 42,
    Attain = 38,
    Aim = "Sammelt 10 Schattensplitter aus Maraudon und bringt sie zu Uthel'nay nach Orgrimmar.",
    Location = "Uthel'nay (Orgrimmar - Tal der Geister "..yellow.."39,86"..white..")",
    Note = "Ihr bekommt den Schattensplitter von 'Schattensteinrumpler' oder 'Schattensteinzerkracher' außerhalb der Instanz auf der violetten Seite.",
    Rewards = kQuestInstanceData.Maraudon.Alliance[1].Rewards
}
kQuestInstanceData.Maraudon.Horde[2] = {
    Title = "Schlangenzunges Verderbnis",
    Id = 7029,
    Level = 47,
    Attain = 41,
    Aim = "Füllt die beschichtete himmelblaue Phiole am orangefarbenen Kristallteich in Maraudon.$B$BBenutzt die gefüllte himmelblaue Phiole mit den Schlangenstrunkranken, damit der verderbte Noxxiousspross herausgezwungen wird.$B$BHeilt 8 Pflanzen, indem Ihr diesen Noxxiousspross tötet und kehrt dann zu Vark Schlachtnarbe in Schattenflucht zurück.",
    Location = "Vark Schlachtnarbe (Desolace - Schattenflucht "..yellow.."23,70"..white..")",
    Note = "Ihr könnt die Phiole an jedem Tümpel außerhalb der Instanz auf der orangenen Seite füllen. Die Pflanzen befinden sich in den orangenen und violetten Bereichen innerhalb der Instanz.",
    Rewards = kQuestInstanceData.Maraudon.Alliance[2].Rewards
}
for i = 3, 6 do
    kQuestInstanceData.Maraudon.Horde[i] = kQuestInstanceData.Maraudon.Alliance[i]
end
kQuestInstanceData.Maraudon.Horde[7] = {
    Title = "Verderbnis von Erde und Samenkorn",
    Id = 7064,
    Level = 51,
    Attain = 45,
    Aim = "Tötet Prinzessin Theradras und kehrt zu Selendra in der Nähe von Schattenflucht in Desolace zurück.",
    Location = "Selendra (Desolace "..yellow.."27,77"..white..")",
    Note = "Ihr findet Prinzessin Theradras bei "..yellow.."[11]"..white..".",
    Folgequest = "Samenkorn des Lebens",
    Rewards = kQuestInstanceData.Maraudon.Alliance[7].Rewards
}
kQuestInstanceData.Maraudon.Horde[8] = kQuestInstanceData.Maraudon.Alliance[8]
kQuestInstanceData.Maraudon.Horde[9] = {
    Title = "Vorbereitung",
    Id = 41281,
    Level = 48,
    Attain = 34,
    Aim = "Holt eine Platte von Erdrutschs Körper aus Maraudon und bringt sie zu Thegren nahe den Ruinen von Corthan im Ödland.",
    Location = "Thegren <Artisan Gemologist> (Ödland - Ruinen von Corthan "..yellow.."[29, 27]"..white..").",
    Note = red.."Nur Juwelierskunst."..white.." Questreihe für Gemmologen-Spezialisierung.\nErdrutsch ist bei "..yellow.."[8]"..white..".",
    Prequest = "Meisterschaft in Edelsteinkunde -> Lebensblut -> Vorführung",
    Folgequest = "Der letzte Schliff",
}

--------------- Molten Core ---------------
kQuestInstanceData.MoltenCore = {
    Story = "Der Geschmolzene Kern liegt ganz unten in den Schwarzfelstiefen. Er ist das Herz des Schwarzfelsbergs und genau die Stelle, an der vor langer Zeit in einem verzweifelten Versuch, das Blatt im Zwergen-Bürgerkrieg zu wenden, Imperator Thaurissan den Elementarfeuerfürsten Ragnaros in die Welt beschwor. Obwohl der Feuerfürst unfähig ist, sich weit vom lodernden Kern zu entfernen,wird geglaubt, dass seine Elementarschergen die Dunkeleisenzwerge befehligen, die dabei sind, Armeen aus lebendigem Stein zu erschaffen. Der brennende See, in dem Ragnaros schlummert, fungiert als Riss, der zur Ebene des Feuers führt und es den bösartigen Elementaren ermöglicht, hindurchzukommen. Der wichtigste von Ragnaros' Agenten ist Majordomus Exekutus - denn nur dieser gerissene Elementar ist in der Lage, den Feuerfürsten aus seinem Schlummer zu rufen.",
    Caption = "Geschmolzener Kern",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.MoltenCore.Alliance[1] = {
    Title = "Der Geschmolzene Kern",
    Id = 6822,
    Level = 60,
    Attain = 57,
    Aim = "Tötet 1 Feuerlord, 1 geschmolzenen Riesen, 1 uralten Kernhund sowie 1 Lavawoger und kehrt dann zu Fürst Hydraxis in Azshara zurück.",
    Location = "Fürst Hydraxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Dies sind Nicht-Bosse im Geschmolzenen Kern.",
    Prequest = "Auge des Glutsehers ("..yellow.."Upper Blackrock Spire"..white..")", -- 6821",
    Folgequest = "Agent von Hydraxis",
}
kQuestInstanceData.MoltenCore.Alliance[2] = {
    Title = "Hände des Feindes",
    Id = 6824,
    Level = 60,
    Attain = 60,
    Aim = "Bringt die Hände von Lucifron, Sulfuron, Gehennas und Shazzrah zu Fürst Hydraxis in Azshara.",
    Location = "Fürst Hydraxis (Azshara "..yellow.."79,73"..white..")",
    Note = "Lucifron ist bei "..yellow.."[2]"..white..", Sulfuron ist bei "..yellow.."[8]"..white.." und Shazzrah ist bei "..yellow.."[6]"..white..".",

    Prequest = "Agent von Hydraxis",
    Folgequest = "Die Belohnung eines Helden",
}
kQuestInstanceData.MoltenCore.Alliance[3] = {
    Title = "Donneraan der Windsucher",
    Id = 7786,
    Level = 60,
    Attain = 60,
    Aim = "Um Donneraan den Windsucher aus seiner Gefangenschaft zu befreien, müsst Ihr Hochlord Demitrian die rechten und linken H?lften der Fesseln des Windsuchers, 10 Elementiumbarren und die Essenz des Feuerfürsten bringen.",
    Location = "Hochlord Demitrian (Silithus "..yellow.."22,9"..white..")",
    Note = "Teil der Donnerzorn, Gesegnete Klinge des Windsuchers-Questreihe. Sie beginnt nach Erhalt der linken oder rechten Fesseln des Windsuchers von Garr bei "..yellow.."[4]"..white.." oder Baron Geddon bei "..yellow.."[6]"..white..". Sprecht dann mit Hochlord Demitrian, um die Questreihe zu starten. Essenz des Feuerfürsten droppt von Ragnaros bei "..yellow.."[10]"..white..". Nach Abgabe dieses Teils wird Prinz Donneraan beschworen und Ihr müsst ihn töten. Er ist ein 40-Mann-Raidboss.",
    Prequest = "Untersuchung des Gefäßes",
    Folgequest = "Donnerzorn erwache!",
}
kQuestInstanceData.MoltenCore.Alliance[4] = {
    Title = "Ein verbindlicher Vertrag",
    Id = 7604,
    Level = 60,
    Attain = 60,
    Aim = "Bringt den Vertrag der Thoriumbruderschaft zu Lokhtos Düsterfeilsch, wenn Ihr die Pläne für das Sulfuron erhalten möchtet.",
    Location = "Lokhtos Düsterfeilsch (Schwarzfelstiefen "..yellow.."[15]"..white..")",
    Note = "Ihr benötigt einen Sulfuronblock, um den Vertrag von Lokhtos zu bekommen. Sie droppen von Golemagg der Verbrenner im Geschmolzenen Kern bei "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18592 }, --Plans: Sulfuron Hammer Pattern
    }
}
kQuestInstanceData.MoltenCore.Alliance[5] = {
    Title = "Das uralte Blatt",
    Id = 7632,
    Level = 60,
    Attain = 60,
    Aim = "Findet den Besitzer des uralten, versteinerten Blatts. Viel Glück, $n; die Welt ist groß.",
    Location = "Uraltes versteinertes Blatt (droppt vom Schatz des Feuerfürsten "..yellow.."[9]"..white..")",
    Note = "Abgabe bei Vartrus der Uralte in (Teufelswald - Der Eisenwald "..yellow.."49,24"..white..").",
    Folgequest = "Uraltes in Sehnen eingewickeltes Laminablatt ("..yellow.."Azuregos"..white..")", -- 7634",
}
kQuestInstanceData.MoltenCore.Alliance[6] = {
    Title = "Der einzige Weg",
    Id = 8620,
    Level = 60,
    Attain = 60,
    Aim = "Findet die 8 verlorenen Kapitel von Drachisch für Dummies und vereint sie mit dem magischen Bucheinband. Bringt das vollständige Buch Drachisch für Dummies: Band 2 zu Narain Pfauentraum in Tanaris.",
    Location = "Narain Pfauentraum (Tanaris "..yellow.."65,18"..white..")",
    Note = "Nur eine Person kann das Kapitel plündern. Drakonisch für Dummies VIII (droppt von Ragnaros "..yellow.."[10]"..white..")",
    Prequest = "Lockvogel!",
    Folgequest = "Die gute und die schlechte Nachricht (Müsst Stewvul, Ex-B.F.F. und Fragt mich nie nach meinem Geschäft Questreihen abschließen)",
    Rewards = {
        Text = "Belohnung: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.MoltenCore.Alliance[7] = {
    Title = "Wahrsagerbrille? Kein Problem!",
    Id = 8578,
    Level = 60,
    Attain = 60,
    Aim = "Findet Narains Wahrsagerbrille und bringt sie Narain Pfauentraum in Tanaris.",
    Location = "Narain Pfauentraum (Tanaris "..yellow.."65,18"..white..")",
    Note = "Droppt von Bossen im Geschmolzenen Kern.",
    Prequest = "Stewvul, ehemals allerbester Freund",
    Folgequest = "Die gute und die schlechte Nachricht (Müsst Drakonisch für Dummies und Fragt mich nie nach meinem Geschäft Questreihen abschließen)",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18253, quantity = 3 }, --Major Rejuvenation Potion Potion
    }
}
for i = 1, 7 do
    kQuestInstanceData.MoltenCore.Horde[i] = kQuestInstanceData.MoltenCore.Alliance[i]
end

--------------- Naxxramas ---------------
kQuestInstanceData.Naxxramas = {
    Story = "Über den Pestländern schwebend dient die Nekropole namens Naxxramas als Sitz eines der mächtigsten Offiziere des Lichkönigs, des gefürchteten Lichs Kel'Thuzad. Schrecken der Vergangenheit und neue Schrecken, die noch entfesselt werden müssen, sammeln sich in der Nekropole, während die Diener des Lichkönigs ihren Angriff vorbereiten. Bald wird die Geißel wieder marschieren...",
    Caption = "Naxxramas",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Naxxramas.Alliance[1] = {
    Title = "Der Niedergang Kel'Thuzads",
    Id = 9120,
    Level = 60,
    Attain = 60,
    Aim = "Bringt Kel'Thuzads Phylakterium zu der Kapelle des Hoffnungsvollen Lichts in den Östlichen Pestländern.",
    Location = "Kel'Thuzad (Naxxramas "..yellow.."green 2"..white..")",
    Note = "Vater Inigo Montoy (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,58"..white..")",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 23206 }, --Mark of the Champion Trinket
        { id = 23207 }, --Mark of the Champion Trinket
    }
}
kQuestInstanceData.Naxxramas.Alliance[2] = {
    Title = "Das Einzige, das ich kann...",
    Id = 9232,
    Level = 60,
    Attain = 60,
    Aim = "Handwerker Wilhelm in der Kapelle des Hoffnungsvollen Lichts möchte, dass Ihr ihm 2 gefrorene Runen, 2 Essenzen des Wassers, 2 blaue Saphire und 30 Goldstücke bringt.",
    Location = "Handwerker Wilhelm (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,60"..white..")",
    Note = "Gefrorene Runen kommen von Unheiligen Äxten in Naxxramas.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 22700 }, --Glacial Leggings Legs, Cloth
        { id = 22699 }, --Icebane Leggings Legs, Plate
        { id = 22702 }, --Icy Scale Leggings Legs, Mail
        { id = 22701 }, --Polar Leggings Legs, Leather
    }
}
kQuestInstanceData.Naxxramas.Alliance[3] = {
    Title = "Echo des Krieges",
    Id = 9033,
    Level = 60,
    Attain = 60,
    Aim = "Kommandant Eligor Morgenbringer bei der Kapelle des Hoffnungsvollen Lichts in den Östlichen Pestländern möchte, dass Ihr 5 lebende Monstrositäten, 5 Steinhautgargoyles, 8 Hauptmänner der Todesritter und 3 Giftpirscher tötet.",
    Location = "Kreuzzugskommandant Eligor Morgenbringer (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."82,58"..white..")",
    Note = "Die Gegner für diese Quest sind Trashmobs am Anfang jedes Flügels von Naxxramas. Diese Quest ist eine Voraussetzung für die Tier-3-Rüstungsquests.",
    Prequest = "Die Zitadelle des Schreckens - Naxxramas",
}
kQuestInstanceData.Naxxramas.Alliance[4] = {
    Title = "Ramaladnis Schicksal",
    Id = 9229,
    Level = 60,
    Attain = 60,
    Aim = "Betretet Naxxramas und bringt Ramaladnis Schicksal in Erfahrung.",
    Location = "Kreuzzugskommandant Korfax (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."82,58"..white..")",
    Note = "Ein Ring für diese Quest wird von einem zufälligen Gegner in Naxxramas droppen. Jeder, der die Quest hat, kann ihn aufheben.",
    Folgequest = "Ramaladnis eisiger Griff",
}
kQuestInstanceData.Naxxramas.Alliance[5] = {
    Title = "Ramaladnis eisiger Griff",
    Id = 9230,
    Level = 60,
    Attain = 60,
    Aim = "Korfax in der Kapelle des Hoffnungsvollen Lichtes möchte, dass Ihr ihm 1 gefrorene Rune, 1 blauen Saphir und 1 Arkanitbarren bringt.",
    Location = "Kreuzzugskommandant Korfax (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."82,58"..white..")",
    Note = "Gefrorene Runen kommen von Unheiligen Äxten in Naxxramas.",
    Prequest = "Ramaladnis Schicksal",
    Rewards = {
        Text = "Belohnung: ",
        { id = 22707 }, --Ramaladni's Icy Grasp Ring
    }
}
for i = 1, 5 do
    kQuestInstanceData.Naxxramas.Horde[i] = kQuestInstanceData.Naxxramas.Alliance[i]
end

--------------- Onyxias Lair ---------------
kQuestInstanceData.OnyxiasLair = {
    Story = "Onyxia ist die Tochter des mächtigen Drachens Todesschwinge und Schwester des intriganten Nefarian, Herrscher der Schwarzfelsspitze. Es wird gesagt, dass Onyxia Freude daran hat, die sterblichen Völker zu korrumpieren, indem sie sich in ihre politischen Angelegenheiten einmischt. Zu diesem Zweck wird geglaubt, dass sie verschiedene humanoide Gestalten annimmt und ihren Charme und ihre Macht nutzt, um heikle Angelegenheiten zwischen den verschiedenen Völkern zu beeinflussen. Einige glauben, dass Onyxia sogar einen Alias angenommen hat, den einst ihr Vater benutzte - den Titel des königlichen Hauses Prestor. Wenn sie sich nicht in sterbliche Belange einmischt, residiert Onyxia in einer feurigen Höhle unter dem Drachensumpf, einem tristen Sumpf im Düstermarschen. Dort wird sie von ihren Verwandten bewacht, den verbliebenen Mitgliedern des heimtückischen Schwarzen Drachenschwarms.",
    Caption = "Onyxias Lair",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.OnyxiasLair.Alliance[1] = {
    Title = "Das Schmieden von Quel'Serrar",
    Id = 7509,
    Level = 60,
    Attain = 60,
    Aim = "Bringt dem Wissenshüter Lydros die stumpfe und glanzlose Elfenklinge.",
    Location = "Wissenshüter Lydros (Düsterbruch - West oder North "..yellow.."[1] Library"..white..")",
    Note = "Lasst das Schwert vor Onyxia fallen, wenn sie bei 10% bis 15% Leben ist. Sie muss darauf atmen und es erhitzen. Wenn Onyxia stirbt, hebt das Schwert wieder auf, klickt auf ihren Leichnam und benutzt das Schwert. Dann seid Ihr bereit, die Quest abzugeben.",
    Prequest = "Forors Kompendium ("..yellow.."Düsterbruch West"..white..") -> Die Schmiedung von Quel'Serrar",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18348 }, --Quel'Serrar Main Hand, Sword
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[2] = {
    Title = "Der einzige Weg",
    Id = 8620,
    Level = 60,
    Attain = 60,
    Aim = "Findet die 8 verlorenen Kapitel von Drachisch für Dummies und vereint sie mit dem magischen Bucheinband. Bringt das vollständige Buch Drachisch für Dummies: Band 2 zu Narain Pfauentraum in Tanaris.",
    Location = "Narain Pfauentraum (Tanaris "..yellow.."65, 18"..white..")".."Drakonisch für Dummies (droppt von Onyxia "..yellow.."[3]"..white..")",
    Note = "Nur eine Person kann das Kapitel plündern. Drakonisch für Dummies VI (droppt von Onyxia "..yellow.."[3]"..white..")",
    Prequest = "Lockvogel!",
    Folgequest = "Die gute und die schlechte Nachricht (Müsst Stewvul, Ex-B.F.F. und Fragt mich nie nach meinem Geschäft Questreihen abschließen)",
    Rewards = {
        Text = "Belohnung: ",
        { id = 21517 }, --Gnomish Turban of Psychic Might Head, Cloth
    }
}
kQuestInstanceData.OnyxiasLair.Alliance[3] = {
    Title = "Sieg für die Allianz",
    Id = 7490,
    Level = 60,
    Attain = 60,
    Aim = "Bringt Onyxias Kopf zu König Varian Wrynn in Sturmwind.",
    Location = "Kopf von Onyxia (droppt von Onyxia "..yellow.."[3]"..white..")",
    Note = "Hochlord Bolvar Fordragon befindet sich in (Sturmwind - Festung Sturmwind "..yellow.."78,20"..white.."). Nur eine Person im Raid kann diesen Gegenstand plündern und die Quest kann nur einmal gemacht werden.\nDie aufgelisteten Belohnungen sind für die Folgequest.",
    Folgequest = "Gute Zeiten feiern",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
        Title = "Sieg für die Horde",
        Aim = "Bringt Onyxias Kopf zu Garrosh in Orgrimmar.",
        Note = "Thrall befindet sich in (Orgrimmar - Tal der Weisheit "..yellow.."31, 37"..white.."). Nur eine Person im Raid kann diesen Gegenstand plündern und die Quest kann nur einmal gemacht werden.\nDie aufgelisteten Belohnungen sind für die Folgequest.",
        Folgequest = "Für alle sichtbar",
    }
)

--------------- Hügel der Klingenhauer ---------------
kQuestInstanceData.RazorfenDowns = {
    Story = "Erbaut aus denselben mächtigen Ranken wie Kral der Klingenhauer ist Hügel der Klingenhauer die traditionelle Hauptstadt des Quilboarvolkes. Das weitläufige, dornenübersäte Labyrinth beherbergt eine regelrechte Armee loyaler Quilboar sowie ihre Hohepriester - den Stamm des Totenkopfs. Kürzlich ist jedoch ein drohender Schatten über die primitive Höhle gefallen. Agenten der untoten Geißel - angeführt vom Lich Amnennar der Kältebringer - haben die Kontrolle über das Quilboarvolk übernommen und das Dornenlabyrinth in eine Bastion untoten Macht verwandelt. Nun kämpfen die Quilboar einen verzweifelten Kampf, um ihre geliebte Stadt zurückzuerobern, bevor Amnennar seine Kontrolle über das Brachland ausbreitet.",
    Caption = "Hügel der Klingenhauer",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenDowns.Alliance[1] = {
    Title = "Ein Hort des Bösen",
    Id = 6626,
    Level = 35,
    Attain = 28,
    Aim = "Tötet 8 Schlachtwachen der Klingenhauer, 8 Dornenwirker der Klingenhauer und 8 Kultistinnen der Totenköpfe und kehrt dann zu Myriam Mondsang nahe dem Eingang zu den Hügeln der Klingenhauer zurück.",
    Location = "Myriam Mondsang (Brachland "..yellow.."49,94"..white..")",
    Note = "Ihr findet die Gegner und den Questgeber im Bereich kurz vor dem Instanzeingang.",
}
kQuestInstanceData.RazorfenDowns.Alliance[2] = {
    Title = "Ausschalten des Götzen",
    Id = 3525,
    Level = 37,
    Attain = 32,
    Aim = "Begleitet Belnistrasz zum Götzen der Stacheleber in den Hügeln der Klingenhauer.$B$BBeschützt Belnistrasz, während er das Ritual durchführt, um den Götzen auszuschalten.",
    Location = "Belnistrasz (Hügel der Klingenhauer "..yellow.."[2]"..white..")",
    Note = "Die Vorquest ist einfach, dass Ihr zustimmt, ihm zu helfen. Mehrere Gegner erscheinen und greifen Belnistrasz an, während er versucht, das Idol abzuschalten. Nach Abschluss der Quest könnt Ihr die Quest am Kohlenbecken vor dem Idol abgeben.",
    Prequest = "Geißel der Hügel",
    Rewards = {
        Text = "Belohnung: ",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Alliance[3] = {
    Title = "Das Licht bringen",
    Id = 3636,
    Level = 42,
    Attain = 39,
    Aim = "Erzbischof Benedictus will, dass Ihr Amnennar den Kältebringer in den Hügeln der Klingenhauer tötet.",
    Location = "Erzbischof Benedictus (Sturmwind - Kathedrale des Lichts "..yellow.."39,27"..white..")",
    Note = "Amnennar der Kältebringer ist der letzte Boss in Hügel der Klingenhauer. Ihr findet ihn bei "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[1] = kQuestInstanceData.RazorfenDowns.Alliance[1]
kQuestInstanceData.RazorfenDowns.Horde[2] = {
    Title = "Eine unheilige Allianz",
    Id = 6521,
    Level = 36,
    Attain = 28,
    Aim = "Bringt den Kopf von Botschafter Malcin zu Bragor Blutfaust nach Unterstadt.",
    Location = "Varimathras (Unterstadt - Königsviertel "..yellow.."56,92"..white..")",
    Note = "Die vorhergehende Quest kann vom letzten Boss in Kral der Klingenhauer erhalten werden. Ihr findet Malcin außerhalb (Brachland "..yellow.."48,92"..white..").",
    Prequest = "Eine unheilige Allianz",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 17039 }, --Skullbreaker Main Hand, Mace
        { id = 17042 }, --Nail Spitter Gun
        { id = 17043 }, --Zealot's Robe Chest, Cloth
    }
}
kQuestInstanceData.RazorfenDowns.Horde[3] = {
    Title = "Ausschalten des Götzen",
    Id = 3525,
    Level = 37,
    Attain = 32,
    Aim = "Begleitet Belnistrasz zum Götzen der Stacheleber in den Hügeln der Klingenhauer.$B$BBeschützt Belnistrasz, während er das Ritual durchführt, um den Götzen auszuschalten.",
    Location = "Belnistrasz (Hügel der Klingenhauer "..yellow.."[2]"..white..")",
    Note = "Die Vorquest ist einfach, dass Ihr zustimmt, ihm zu helfen. Mehrere Gegner erscheinen und greifen Belnistrasz an, während er versucht, das Idol abzuschalten. Nach Abschluss der Quest könnt Ihr die Quest am Kohlenbecken vor dem Idol abgeben.",
    Prequest = "Geißel der Hügel",
    Rewards = {
        Text = "Belohnung: ",
        { id = 10710 }, --Dragonclaw Ring Ring
    }
}
kQuestInstanceData.RazorfenDowns.Horde[4] = {
    Title = "Das Ende bringen",
    Id = 3341,
    Level = 42,
    Attain = 37,
    Aim = "Andrew Braunell will, dass Ihr Amnennar den Kältebringer tötet und ihm dessen Schädel bringt.",
    Location = "Andrew Braunell (Unterstadt - Das Magierviertel "..yellow.."72,32"..white..")",
    Note = "Amnennar der Kältebringer ist der letzte Boss in Hügel der Klingenhauer. Ihr findet ihn bei "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 10823 }, --Vanquisher's Sword One-Hand, Sword
        { id = 10824 }, --Amberglow Talisman Neck
    }
}
kQuestInstanceData.RazorfenDowns.Horde[5] = {
    Title = "Mächte jenseits",
    Id = 40995,
    Level = 44,
    Attain = 38,
    Aim = "Wagt Euch nach Hügel der Klingenhauer, tötet Amnennar den Kältebringer und holt sein Phylakterium für Dunkelbischof Mordren in der Stillward-Kirche in Gilneas.",
    Location = "Dunkelbischof Mordren (Gilneas - Kirche von Stillwacht "..yellow.."57.7,39.6"..white..")",
    Note = "Die Questreihe beginnt mit der Quest 'Durch große Magie' bei Dunkelbischof Mordren.\nAmnennar der Kältebringer "..yellow.."[6]"..white.." lässt Obsidian-Phylakterium fallen.\nIhr erhaltet die Belohnung nach Abschluss der letzten Quest in der Reihe.",
    Prequest = "Durch große Magie -> Das Zepter von Rabenwald",
    Folgequest = "Der Graumähnestein "..yellow.."[Gilneas City]"..white.." -> Geschenk des Dunkelbischofs",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}

--------------- Razorfen Kraul ---------------
kQuestInstanceData.RazorfenKraul = {
    Story = "Vor zehntausend Jahren - während des Krieges der Ahnen, kam der mächtige Halbgott Agamaggan hervor, um gegen die Brennende Legion zu kämpfen. Obwohl der kolossale Eber im Kampf fiel, halfen seine Taten, Azeroth vor dem Untergang zu bewahren. Doch mit der Zeit sprossen in den Gebieten, wo sein Blut fiel, massive dornenübersäte Ranken aus der Erde. Die Quilboar - von denen man glaubt, dass sie die sterblichen Nachkommen des mächtigen Gottes sind, kamen in diese Regionen und halten sie heilig. Das Herz dieser Dornenkolonien war als das Razorfen bekannt. Die große Masse von Kral der Klingenhauer wurde von der alten Vettel Charlga Klingenflanke erobert. Unter ihrer Herrschaft führen die schamanistischen Quilboar Angriffe auf rivalisierende Stämme sowie Hordendörfer durch. Einige spekulieren, dass Charlga sogar mit Agenten der Geißel verhandelt hat - ihren ahnungslosen Stamm mit den Reihen der Untoten für einen heimtückischen Zweck verbündet.",
    Caption = "Kral der Klingenhauer",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.RazorfenKraul.Alliance[1] = {
    Title = "Blaulaubknollen",
    Id = 1221,
    Level = 26,
    Attain = 20,
    Aim = "Schnappt Euch eine Kiste mit Löchern.$BSchnappt Euch einen Schnüffelnasenleitstecken.$BSchnappt Euch das Handbuch für Schnüffelnasenbesitzer und lest es.$B$BBenutzt im Kral der Klingenhauer die Kiste mit Löchern, um ein Schnüffelnasenziesel zu beschwören, und benutzt den Leitstecken bei dem Ziesel, damit es nach Knollen sucht.$B$BBringt 6 Blaulaubknollen, den Schnüffelnasenleitstecken und die Kiste mit Löchern zu Mebok Mizzyrix in Ratschet.",
    Location = "Mebok Mizzyrix (Brachland - Ratschet "..yellow.."62,37"..white..")",
    Note = "Die Kiste, der Stab und das Handbuch können alle in der Nähe von Mebok Mizzyrix gefunden werden.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 6755 }, --A Small Container of Gems Container
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[2] = {
    Title = "Die Sterblichkeit schwindet",
    Id = 1142,
    Level = 30,
    Attain = 25,
    Aim = "Sucht und bringt Treshalas Anhänger zu Treshala Bachquell in Darnassus.",
    Location = "Heraltha Fallowbrook (Kral der Klingenhauer "..yellow.."[8]"..white..")",
    Note = "Der Anhänger ist ein zufälliger Drop. Ihr müsst den Anhänger zu Treshala Bachquell in Darnassus - Tradesmen Terrace ("..yellow.."69,67"..white..") zurückbringen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6751 }, --Mourning Shawl Back
        { id = 6752 }, --Lancer Boots Feet, Leather
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[3] = {
    Title = "Willix der Importeur",
    Id = 1144,
    Level = 30,
    Attain = 23,
    Aim = "Führt Willix den Importeur aus dem Kral der Klingenhauer hinaus.",
    Location = "Willix der Importeur (Kral der Klingenhauer "..yellow.."[8]"..white..")",
    Note = "Willix der Importeur muss zum Eingang der Instanz eskortiert werden. Die Quest wird bei ihm abgegeben, wenn sie abgeschlossen ist.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[4] = {
    Title = "Die Greisin des Krals",
    Id = 1101,
    Level = 34,
    Attain = 29,
    Aim = "Bringt Falfindel Wegeshut in Thalanaar Klingenflankes Medaillon.",
    Location = "Falfindel Wegeshut (Feralas - Thalanaar "..yellow.."89,46"..white..")",
    Note = "Charlga Klingenflanke "..yellow.."[7]"..white.." lässt das für diese Quest benötigte Medaillon fallen.",
    Prequest = "Einbraues Tagebuch",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Alliance[5] = {
    Title = "Feuergehärteter Panzer",
    Id = 1701,
    Level = 28,
    Attain = 20,
    Aim = "Sammelt die Materialien, die Furen Langbart benötigt, und bringt sie zu ihm nach Sturmwind.",
    Location = "Furen Langbart (Sturmwind - Zwergenviertel "..yellow.."57,16"..white..")",
    Note = red.."Nur Krieger"..white..": Ihr bekommt die Phiole mit Phlogiston von Roogug bei "..yellow.."[1]"..white..".\nDie Folgequest ist für jede Rasse unterschiedlich. Brennendes Blut für Menschen, Eisenkoralle für Zwerge und Gnome und Sonnenverbrannte Schalen für Nachtelfen.",
    Folgequest = "(See Note)",
}
kQuestInstanceData.RazorfenKraul.Horde[1] = kQuestInstanceData.RazorfenKraul.Alliance[1]
kQuestInstanceData.RazorfenKraul.Horde[2] = {
    Title = "Willix der Importeur",
    Id = 1144,
    Level = 30,
    Attain = 23,
    Aim = "Führt Willix den Importeur aus dem Kral der Klingenhauer hinaus.",
    Location = "Willix der Importeur (Kral der Klingenhauer "..yellow.."[8]"..white..")",
    Note = "Willix der Importeur muss zum Eingang der Instanz eskortiert werden. Die Quest wird bei ihm abgegeben, wenn sie abgeschlossen ist.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6748 }, --Monkey Ring Ring
        { id = 6750 }, --Snake Hoop Ring
        { id = 6749 }, --Tiger Band Ring
    }
}
kQuestInstanceData.RazorfenKraul.Horde[3] = {
    Title = "Go, Go, Guano!",
    Id = 1109,
    Level = 33,
    Attain = 30,
    Aim = "Bringt dem Apothekermeister Faranell in Unterstadt 1 Häufchen Kralguano.",
    Location = "Apothekermeister Faranell (Unterstadt - Das Apothekarium "..yellow.."48,69"..white..")",
    Note = "Kralguano wird von allen Fledermäusen in der Instanz gedroppt.",
    Folgequest = "Herzen des Eifers ("..yellow.."[Scarlet Monastery]"..white..")", -- 1113",
}
kQuestInstanceData.RazorfenKraul.Horde[4] = {
    Title = "Ein schreckliches Schicksal",
    Id = 1102,
    Level = 34,
    Attain = 29,
    Aim = "Bringt Auld Steinkeil in Donnerfels Klingenflankes Herz.",
    Location = "Auld Steinkeil (Donnerfels "..yellow.."36,59"..white..")",
    Note = "Ihr findet Charlga Klingenflanke bei "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 4197 }, --Berylline Pads Shoulder, Cloth
        { id = 6742 }, --Stonefist Girdle Waist, Mail
        { id = 6725 }, --Marbled Buckler Shield
    }
}
kQuestInstanceData.RazorfenKraul.Horde[5] = {
    Title = "Brutale Rüstung",
    Id = 1838,
    Level = 30,
    Attain = 20,
    Aim = "Bringt Thun'grim Brandblick 15 rauchige Eisenblöcke, 10 pulverisierte Azurite, 10 Eisenbarren und 1 Phiole Phlogiston.",
    Location = "Thun'grim Brandblick (Brachland "..yellow.."57,30"..white..")",
    Note = red.."Nur Krieger"..white..": Ihr bekommt die Phiole mit Phlogiston von Roogug bei "..yellow.."[1]"..white..".\n\nDurch Abschluss dieser Quest könnt Ihr vier neue Quests beim selben NPC starten.",
    Prequest = "Gespräch mit Thun'grim",
    Folgequest = "(See Note)",
}
kQuestInstanceData.RazorfenKraul.Horde[6] = {
    Title = "Besudeltes Dornherz",
    Id = 41758,
    Level = 30,
    Attain = 20,
    Aim = "Zerstört die lebendige Verkörperung natürlicher Verderbnis in den Tiefen von Kral der Klingenhauer und bringt das Befleckte Dornherz zu Kym Wildmähne in Donnerfels.",
    Location = "Kym Wildmähne (Donnerfels - Die Anhöhe der Ältesten "..yellow.."77,29"..white..")",
    Note = "Besudeltes Dornherz wird von Rotdorn gedroppt, der sich bei "..yellow.."[5]"..white.." befindet.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 41854 }, --Wildbranch Leggings, Cloth
        { id = 41855 }, --Fenweave Gloves, Mail
    }
}

--------------- SM: Library ---------------
kQuestInstanceData.ScarletMonasteryLibrary = {
    Story = "Das Kloster war einst eine stolze Bastion von Lordaerons Priesterschaft - ein Zentrum für Lernen und Erleuchtung. Mit dem Aufstieg der untoten Geißel während des Dritten Krieges wurde das friedliche Kloster in eine Festung des fanatischen Scharlachroten Kreuzzugs umgewandelt. Die Kreuzritter sind intolerant gegenüber allen nicht-menschlichen Völkern, unabhängig von Bündnis oder Zugehörigkeit. Sie glauben, dass alle Außenstehenden potenzielle Träger der Untotenplage sind - und vernichtet werden müssen. Berichte zeigen, dass Abenteurer, die das Kloster betreten, sich mit Scharlachrotem Kommandant Mograine auseinandersetzen müssen - der eine große Garnison fanatisch ergebener Krieger befehligt. Der wahre Meister des Klosters ist jedoch Hochinquisitorin Weißsträhne - eine furchteinflößende Priesterin, die die Fähigkeit besitzt, gefallene Krieger zu erwecken, um in ihrem Namen zu kämpfen.",
    Caption = "Das Scharlachrote Kloster: Library",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1] = {
    Title = "Im Namen des Lichts",
    Id = 1053,
    Level = 40,
    Attain = 34,
    Aim = "Tötet Hochinquisitorin Weißsträhne, den Scharlachroten Kommandant Mograine, Herod, den Scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Raleigh dem Andächtigen in Süderstade.",
    Location = "Raleigh der Andächtige (Vorgebirge des Hügellandes - Süderstade "..yellow.."51,58"..white..")",
    Note = "Diese Questreihe beginnt bei Bruder Crowley mit der Quest 'Bruder Anton' in Sturmwind - Kathedrale des Lichts ("..yellow.."42,24"..white..").\nIhr findet Hochinquisitorin Weißsträhne und Scharlachroter Kommandant Mograine bei "..yellow.."SM: Kathedrale [2]"..white..", Herod bei "..yellow.."SM: Waffenkammer [1]"..white.." und Hundemeister Loksey bei "..yellow.."SM: Bibliothek [1]"..white..".",
    Prequest = "Bruder Anton -> Auf dem Scharlachroten Pfad",
    Rewards = {
        Text = "Belohnung: ",
        { id = 6829 }, --Sword of Serenity One-Hand, Sword
        { id = 6830 }, --Bonebiter Two-Hand, Axe
        { id = 6831 }, --Black Menace One-Hand, Dagger
        { id = 11262 }, --Orb of Lorica Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[2] = {
    Title = "Mythologie der Titanen",
    Id = 1050,
    Level = 38,
    Attain = 28,
    Aim = "Holt die 'Mythologie der Titanen' aus dem Kloster und bringt die der Bibliothekarin Mae Bleichstaub in Eisenschmiede.",
    Location = "Bibliothekarin Mae Bleichstaub (Eisenschmiede - Halle der Erforscher "..yellow.."74,12"..white..")",
    Note = "Das Buch liegt auf dem Boden links in einem der Korridore, die zu Arkanist Doan ("..yellow.."[2]"..white..") führen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 7746 }, --Explorers' League Commendation Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Alliance[3] = {
    Title = "Rituale der Macht",
    Id = 1951,
    Level = 40,
    Attain = 30,
    Aim = "Bringt das Buch 'Rituale der Macht' zu Tabetha in den Düstermarschen.",
    Location = "Tabetha (Düstermarschen "..yellow.."43,57"..white..")",
    Note = red.."Nur Magier"..white..": Ihr findet das Buch im letzten Korridor, der zu Arkanist Doan ("..yellow.."[2]"..white..") führt.",
    Prequest = "Der Knüller schlechthin",
    Folgequest = "Der Zauberstab des Magiers",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[1] = {
    Title = "Herzen des Eifers",
    Id = 1113,
    Level = 33,
    Attain = 30,
    Aim = "Apothekermeister Faranell in Unterstadt möchte 20 Herzen des Eifers.",
    Location = "Apothekermeister Faranell (Unterstadt - Das Apothekarium "..yellow.."48,69"..white..")",
    Note = "Alle Gegner im Scharlachroten Kloster lassen Herzen des Eifers fallen.",
    Prequest = "Go, Go, Guano! ("..yellow.."[Razorfen Kraul]"..white..")", -- 1109",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[2] = {
    Title = "In das Scharlachrote Kloster",
    Id = 1048,
    Level = 42,
    Attain = 33,
    Aim = "Tötet Hochinquisitorin Weißsträhne, den Scharlachroten Kommandant Mograine, Herod, den Scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Varimathras in Unterstadt.",
    Location = "Varimathras (Unterstadt - Königsviertel "..yellow.."56,92"..white..")",
    Note = "Ihr findet Hochinquisitorin Weißsträhne und Scharlachroter Kommandant Mograine bei "..yellow.."SM: Kathedrale [2]"..white..", Herod bei "..yellow.."SM: Waffenkammer [1]"..white.." und Hundemeister Loksey bei "..yellow.."SM: Bibliothek [1]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6802 }, --Sword of Omen One-Hand, Sword
        { id = 6803 }, --Prophetic Cane Held In Off-hand
        { id = 10711 }, --Dragon's Blood Necklace Neck
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[3] = {
    Title = "Kompendium der Gefallenen",
    Id = 1049,
    Level = 38,
    Attain = 28,
    Aim = "Holt das 'Kompendium der Gefallenen' aus dem Kloster in Tirisfal und bringt es zu dem Weisen Wahrspruch in Donnerfels.",
    Location = "Weiser Wahrspruch (Donnerfels "..yellow.."34,47"..white..")",
    Note = "Ihr findet das Buch im Bibliotheksteil des Scharlachroten Klosters.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 7747 }, --Vile Protector Shield
        { id = 17508 }, --Forcestone Buckler Shield
        { id = 7749 }, --Omega Orb Held In Off-hand
    }
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[4] = {
    Title = "Test der Lehre",
    Id = 1160,
    Level = 36,
    Attain = 25,
    Aim = "Sucht Braug Dämmergeist in der Nähe des Eingangs zum Steinkrallenpfad im Steinkrallengebirge.",
    Location = "Parqual Fintallas (Unterstadt - Das Apothekarium "..yellow.."57,65"..white..")",
    Note = "Die Questreihe beginnt bei Dorn Ebenenpirscher mit der Quest 'Test des Glaubens' (Tausend Nadeln "..yellow.."53,41"..white.."). Ihr findet das Buch in der Bibliothek des Scharlachroten Klosters.",
    Prequest = "Test des Glaubens -> Test der Lehre",
    Folgequest = "Test der Lehre",
}
kQuestInstanceData.ScarletMonasteryLibrary.Horde[5] = {
    Title = "Rituale der Macht",
    Id = 1951,
    Level = 40,
    Attain = 30,
    Aim = "Bringt das Buch 'Rituale der Macht' zu Tabetha in den Düstermarschen.",
    Location = "Tabetha (Düstermarschen "..yellow.."43,57"..white..")",
    Note = red.."Nur Magier"..white..": Ihr findet das Buch im letzten Korridor, der zu Arkanist Doan ("..yellow.."[2]"..white..") führt.",
    Prequest = "Der Knüller schlechthin",
    Folgequest = "Der Zauberstab des Magiers",
}

--------------- SM: Armory ---------------
kQuestInstanceData.ScarletMonasteryArmory = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Das Scharlachrote Kloster: Armory",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryArmory.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryArmory.Horde[2] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[2]
kQuestInstanceData.ScarletMonasteryArmory.Horde[3] = {
    Title = "Erinnert an Stahl",
    Id = 41368,
    Level = 39,
    Attain = 33,
    Aim = "Tötet Rüstmeister Daghelm und bringt Basils Tagebuch zu ihm nach Unterstadt zurück.",
    Location = "Basil Frye (Unterstadt "..yellow.."60, 29"..white..")",
    Note = "Droppt von Rüstmeister Daghelm [2].",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 7964 }, --Solid Sharpening Stone Enchant
        { id = 7965 }, --Solid Weightstone Enchant
    }
}

--------------- SM: Cathedral ---------------
kQuestInstanceData.ScarletMonasteryCathedral = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Das Scharlachrote Kloster: Cathedral",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[1] = kQuestInstanceData.ScarletMonasteryLibrary.Alliance[1]
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[2] = {
    Title = "Die Kugel von Kaladus",
    Id = 40233,
    Level = 38,
    Attain = 30,
    Aim = "Wagt Euch in das Scharlachrote Kloster und findet die Kugel von Kaladus, holt sie und kehrt zu Wachtpaladin Janathos in der Burg Sorgenwacht zurück.",
    Location = "Wachpaladin Janathos (Sümpfe des Elends - Trauerwacht Festung "..yellow.."2,51"..white..")",
    Note = "Veralterte Holztruhe enthält den Gegenstand. Ihr findet die Kugel von Kaladus in der zweiten Kammer, links von "..yellow.."[2]"..white..".",
    Prequest = "Geschichten vergangener Tage -> Der vergessene Foliant -> Rückkehr zu Janathos",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60316 }, --Truthkeeper Mantle Shoulder, Plate
        { id = 60317 }, --Lightgraced Mallet Main Hand, Mace
        { id = 60318 }, --Sorrowguard Clutch Waist, Leather
    }
}
kQuestInstanceData.ScarletMonasteryCathedral.Alliance[3] = {
    Title = "Scharlachrote Verderbnis",
    Id = 40935,
    Level = 44,
    Attain = 35,
    Aim = "Entdeckt die Wahrheit über das Schicksal von Hochinquisitor Fairbanks für Bruder Elias in der Schattenmoore-Taverne in Gilneas.",
    Location = "Bruder Elias <Scarlet Crusade Emissary> (Gilneas - Ruinen von Graufurt - Gasthaus 'Zum Schattenmoor' "..yellow.."[33.6,54.1]"..white..", 2nd floor.)",
    Note = "Verbündete gegen das Untote start at same NPC.",
    Prequest = "Verbündete gegen das Untote",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61478 }, --Ring of Holy Sacrement Ring
    }
}
kQuestInstanceData.ScarletMonasteryCathedral.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryCathedral.Horde[2] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[2]

--------------- SM: Graveyard ---------------
kQuestInstanceData.ScarletMonasteryGraveyard = {
    Story = kQuestInstanceData.ScarletMonasteryLibrary.Story,
    Caption = "Das Scharlachrote Kloster: Graveyard",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[1] = kQuestInstanceData.ScarletMonasteryLibrary.Horde[1]
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[2] = {
    Title = "Vorrels Rache",
    Id = 1051,
    Level = 33,
    Attain = 25,
    Aim = "Bringt Monika Sengutz in Tarrens Mühle den Ehering von Vorrel Sengutz.",
    Location = "Vorrel Sengutz (Das Scharlachrote Kloster - Graveyard "..yellow.."[1]"..white..")",
    Note = "Ihr findet Vorrel Sengutz am Anfang des Friedhofsteils des Scharlachroten Klosters. Nancy Vishas, die den für diese Quest benötigten Ring droppt, befindet sich in einem Haus im Alteracgebirge ("..yellow.."31,32"..white..").",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3",
        { id = 7751 }, --Vorrel's Boots Feet, Leather
        { id = 7750 }, --Mantle of Woe Shoulder, Cloth
        { id = 4643 }, --Grimsteel Cape Back
    }
}
kQuestInstanceData.ScarletMonasteryGraveyard.Horde[3] = {
    Title = "Färbt die Rosen rot",
    Id = 60116,
    Level = 29,
    Attain = 27,
    Aim = "Vernichtet die Scharlachroten Streitkräfte außerhalb des Scharlachroten Klosters und kehrt dann zu Todeswache Burgess in Brill zurück.",
    Location = "Todeswache Burgess (Tirisfal - Brill "..yellow.."61,52"..white..")",
    Note = "Ihr könnt diese Quest draußen abschließen.\nDie Questreihe beginnt bei Gastwirt Norman <Gastwirt> in Unterstadt mit der Quest 'Scharlachrot vor Wut'.",
    Prequest = "Scharlachrot vor Wut",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 51832 }, --Nathrezim Wedge Main Hand, Axe
        { id = 51833 }, --Femur Staff Staff
        { id = 51834 }, --Scarlet Pillar Two-Hand, Mace
    }
}

--------------- Scholomance ---------------
kQuestInstanceData.Scholomance = {
    Story = "Die Scholomance befindet sich in einer Reihe von Krypten, die unter der Ruine der Festung von Caer Darrow liegen. Einst im Besitz der adeligen Familie Barov, verfiel Caer Darrow nach dem Zweiten Krieg zur Ruine. Als der Zauberer Kel'Thuzad Anhänger für seinen Kult der Verdammten anwarb, versprach er oft Unsterblichkeit im Austausch für den Dienst an seinem Lichkönig. Die Familie Barov fiel Kel'Thuzads charismatischem Einfluss zum Opfer und spendete die Festung und ihre Krypten der Geißel. Die Kultisten töteten dann die Barovs und verwandelten die antiken Krypten in eine Schule für Nekromantie namens Scholomance. Obwohl Kel'Thuzad nicht mehr in den Krypten residiert, bleiben ergebene Kultisten und Instruktoren bestehen. Der mächtige Lich Ras Frostraunen herrscht über den Ort und bewacht ihn im Namen der Geißel - während der sterbliche Nekromant Dunkelmeister Gandling als heimtückischer Schulleiter dient.",
    Caption = "Scholomance",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Scholomance.Alliance[1] = {
    Title = "Verseuchte Jungtiere",
    Id = 5529,
    Level = 58,
    Attain = 55,
    Aim = "Tötet 20 verseuchte Jungtiere und kehrt dann zu Betina Moppelzink bei der Kapelle des Hoffnungsvollen Lichts zurück.",
    Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,59"..white..")",
    Note = "Die Verseuchten Jungtiere befinden sich auf dem Weg zu Blutrippe in einem großen Raum.",
    Folgequest = "Gesunde Großdrachenschuppe",
}
kQuestInstanceData.Scholomance.Alliance[2] = {
    Title = "Gesunde Großdrachenschuppe",
    Id = 5582,
    Level = 58,
    Attain = 55,
    Aim = "Bringt die gesunde Großdrachenschuppe zu Betina Moppelzink bei der Kapelle des Hoffnungsvollen Lichts in den Östlichen Pestländern.",
    Location = "Gesunde Großdrachenschuppe (random drop in Scholomance)",
    Note = "Verseuchte Jungtiere lassen die Gesunden Drachenschuppen fallen (8% Dropchance). Ihr findet Betina Moppelzink in Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts ("..yellow.."81,59"..white..").",
    Prequest = "Verseuchte Jungtiere",
}
kQuestInstanceData.Scholomance.Alliance[3] = {
    Title = "Doktor Theolen Krastinov, der Schlächter",
    Id = 5382,
    Level = 60,
    Attain = 55,
    Aim = "Sucht Doktor Theolen Krastinov in Scholomance. Vernichtet ihn, verbrennt dann die Überreste von Eva Sarkhoff und die Überreste von Lucien Sarkhoff. Kehrt zu Eva Sarkhoff zurück, sobald Ihr die Aufgabe erfüllt habt.",
    Location = "Eva Sarkhoff (Westliche Pestländer - Darrowehr "..yellow.."70,73"..white..")",
    Note = "Ihr findet Doktor Theolen Krastinov, die Überreste von Eva Sarkhoff und die Überreste von Lucien Sarkhoff bei "..yellow.."[9]"..white..".",
    Folgequest = "Krastinovs Tasche der Schrecken",
}
kQuestInstanceData.Scholomance.Alliance[4] = {
    Title = "Krastinov's Bag of Horrors",
    Id = 5515,
    Level = 60,
    Attain = 55,
    Aim = "Bringt die Tasche der Schrecken zu Eva Sarkhoff auf Caer Darrow.",
    Location = "Eva Sarkhoff (Westliche Pestländer - Darrowehr "..yellow.."70,73"..white..")",
    Note = "Ihr findet Jandice Barov bei "..yellow.."[3]"..white..".",
    Prequest = "Doktor Theolen Krastinov, der Schlächter",
    Folgequest = "Kirtonos der Herold",
}
kQuestInstanceData.Scholomance.Alliance[5] = {
    Title = "Kirtonos der Herold",
    Id = 5384,
    Level = 60,
    Attain = 55,
    Aim = "Kehrt mit dem Blut Unschuldiger zur Scholomance zurück. Sucht die Veranda und legt das Blut der Unschuldigen in die Kohlenpfanne. Kirtonos wird kommen, um sich von Eurer Seele zu nähren.$B$BKämpft tapfer, gebt keinen Fußbreit nach! Vernichtet Kirtonos und kehrt zu Eva Sarkhoff zurück.",
    Location = "Eva Sarkhoff (Westliche Pestländer - Darrowehr "..yellow.."70,73"..white..")",
    Note = "Die Veranda ist bei "..yellow.."[2]"..white..".",
    Prequest = "Krastinovs Tasche der Schrecken",
    Folgequest = "Der Mensch Ras Frostraunen",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3",
        { id = 13544 }, --Spectral Essence Trinket
        { id = 15805 }, --Penelope's Rose Held In Off-hand
        { id = 15806 }, --Mirah's Song One-Hand, Sword
    }
}
kQuestInstanceData.Scholomance.Alliance[6] = {
    Title = "Der Lich Ras Frostraunen",
    Id = 5466,
    Level = 60,
    Attain = 57,
    Aim = "Sucht Ras Frostraunen in Scholomance. Wenn Ihr ihn gefunden habt, wendet das seelengebundene Andenken auf sein untotes Antlitz an. Solltet Ihr ihn erfolgreich in einen Sterblichen zurückverwandeln können, dann schlagt ihn nieder und nehmt den menschlichen Kopf von Ras Frostraunen an Euch. Bringt den Kopf zu Magistrat Marduk.",
    Location = "Magistrat Marduk (Westliche Pestländer - Darrowehr "..yellow.."70,73"..white..")",
    Note = "Ihr findet Ras Frostraunen bei "..yellow.."[7]"..white..".",
    Prequest = "Der Mensch Ras Frostraunen -> Seelengebundenes Andenken",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3 oder 4",
        { id = 14002 }, --Darrowshire Strongguard Shield
        { id = 13982 }, --Warblade of Caer Darrow Two-Hand, Sword
        { id = 13986 }, --Crown of Caer Darrow Head, Cloth
        { id = 13984 }, --Darrowspike One-Hand, Dagger
    }
}
kQuestInstanceData.Scholomance.Alliance[7] = {
    Title = "Das Familienvermögen der Barovs",
    Id = 5343,
    Level = 60,
    Attain = 52,
    Aim = "Begebt Euch zur Scholomance und holt das Familienvermögen der Barovs zurück. Dieses Vermögen besteht aus vier Besitzurkunden: Es sind die Besitzurkunde für Darrowehr, die Besitzurkunde für Brill, die Besitzurkunde für Tarrens Mühle und die Besitzurkunde für Süderstade. Kehrt zu Alexi Barov zurück, sobald die Aufgabe erledigt ist.",
    Location = "Weldon Barov (Westliche Pestländer - Zugwindlager "..yellow.."43,83"..white..")",
    Note = "Ihr findet Die Besitzurkunde für Darrowehr bei "..yellow.."[12]"..white..", Die Besitzurkunde für Brill bei "..yellow.."[7]"..white..", Die Besitzurkunde für Tarrens Mühle bei "..yellow.."[4]"..white.." und Die Besitzurkunde für Süderstade bei "..yellow.."[1]"..white..".",
    Folgequest = "Der letzte Barov",
}
kQuestInstanceData.Scholomance.Alliance[8] = {
    Title = "Dämmerungstrickfalle",
    Id = 4771,
    Level = 60,
    Attain = 57,
    Aim = "Legt die Dämmerungstrickfalle in den Vorführraum von Scholomance. Besiegt Vectus und kehrt dann zu Betina Moppelzink zurück.",
    Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,59"..white..")",
    Note = "Brutlingessenz beginnt bei Tinkee Kesseldampf (Brennende Steppe - Flammenkamm "..yellow.."65,23"..white.."). Der Beobachtungsraum ist bei "..yellow.."[6]"..white..".",
    Prequest = "Brutlingessenz -> Betina Moppelzink",
    Rewards = {
        Text = "Rewards:",
        { id = 15853 }, --Windreaper One-Hand, Axe
        { id = 15854 }, --Dancing Sliver Staff
    }
}
kQuestInstanceData.Scholomance.Alliance[9] = {
    Title = "Wichtellieferung",
    Id = 7629,
    Level = 60,
    Attain = 60,
    Aim = "Bringt den Wichtel im Glas in das Alchemielabor in Scholomance. Bringt das Glas nach der Herstellung des Pergaments zurück zu Gorzeeki Wildaug.",
    Location = "Gorzeeki Wildaug (Brennende Steppe "..yellow.."12,31"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Ihr findet das Alchemielabor bei "..yellow.."[7]"..white..".",
    Prequest = "Mor'zul Blutbringer -> Xorothianischer Sternenstaub",
    Folgequest = "Schreckensross von Xoroth ("..yellow.."Dire Maul West"..white..")", -- 7631",
}
kQuestInstanceData.Scholomance.Alliance[10] = {
    Title = "Das linke Stück von Lord Valthalaks Amulett",
    Id = 8969,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nKormok wird bei "..yellow.."[7]"..white.." beschworen.",
    Prequest = "Komponenten von großer Wichtigkeit",
    Folgequest = "Ich sehe die Insel Alcaz in Eurer Zukunft",
}
kQuestInstanceData.Scholomance.Alliance[11] = {
    Title = "Das rechte Stück von Lord Valthalaks Amulett",
    Id = 8992,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit Lord Valthalaks zusammengesetzten Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nKormok wird bei "..yellow.."[7]"..white.." beschworen.",
    Prequest = "Mehr Komponenten von großer Wichtigkeit",
    Folgequest = "Letzte Vorbereitungen ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
}
kQuestInstanceData.Scholomance.Alliance[12] = {
    Title = "Eine Bitte für Farsan",
    Id = 40237,
    Level = 58,
    Attain = 55,
    Aim = "Wagt Euch in die Scholomance und holt das Buch 'Feuer herbeirufen und befehligen' für Strahad Farsan in Ratschet.",
    Location = "Strahad Farsan (Brachland - Ratschet "..yellow.."62.6,35.5"..white..")",
    Note = "Die Questreihe beginnt bei Handwerker Wilhelm (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts) mit der Quest 'Eine neue Runengrenze'.\n!!! Ihr erhaltet diese Belohnung nach Abschluss der letzten Quest in der Questreihe.",
    Prequest = "Eine neue Runengrenze -> Die Geheimnisse der Dunkelschmiedekunst -> Die Geheimnisse der Dunkelschmiedekunst",
    Folgequest = "Eine Audienz beim Schreckenslord",
    Rewards = {
        Text = "Belohnung: ",
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
        Aim = "Wagt Euch in die Scholomance und holt das Buch 'Feuer herbeirufen und befehligen' für Strahad Farsan in Ratschet.",
        Location = "Alexi Barov (Tirisfal - Das Bollwerk "..yellow.."80,73"..white..")",
    }
)

--------------- Shadowfang Keep ---------------
kQuestInstanceData.ShadowfangKeep = {
    Story = "Während des Dritten Krieges kämpften die Zauberer des Kirin Tor gegen die Untotenarmeen der Geißel. Als die Zauberer von Dalaran in der Schlacht starben, erhoben sie sich bald darauf - und fügten ihre frühere Macht der wachsenden Geißel hinzu. Frustriert über ihren mangelnden Fortschritt (und gegen den Rat seiner Kollegen) beschloss der Erzmagier Arugal, extradimensionale Wesen zu beschwören, um Dalarans schwindende Reihen zu verstärken. Arugals Beschwörung brachte die gefräßigen Worgen in die Welt von Azeroth. Die wilden Wolfsmenschen metzelten nicht nur die Geißel nieder, sondern wandten sich schnell gegen die Zauberer selbst. Die Worgen belagerten die Festung des edlen Baron Silberlain. Über dem kleinen Weiler Pyrewood gelegen, fiel die Festung schnell in Schatten und Verfall. Vom Schuldgefühl in den Wahnsinn getrieben, adoptierte Arugal die Worgen als seine Kinder und zog sich in die neu betitelte 'Burg Schattenfang' zurück. Es wird gesagt, dass er noch immer dort residiert, beschützt von seinem riesigen Haustier Fenrus - und heimgesucht vom rachsüchtigen Geist von Baron Silberlain.",
    Caption = "Burg Schattenfang",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ShadowfangKeep.Alliance[1] = {
    Title = "Die Prüfung der Rechtschaffenheit",
    Id = 1654,
    Level = 22,
    Attain = 20,
    Aim = "Sprecht mit Jordan Stillbrunn in Eisenschmiede.",
    Location = "Jordan Stillbrunn (Dun Morogh - Eisenschmiede Entrance "..yellow.."52,36"..white..")",
    Note = red.."Nur Paladine"..white..": Um die Notiz zu sehen, klickt auf "..yellow.."[Die Prüfung der Rechtschaffenheit Information]"..white..".",
    Prequest = "Der Foliant der Tapferkeit -> Die Prüfung der Rechtschaffenheit",
    Folgequest = "Die Prüfung der Rechtschaffenheit",
    Rewards = {
        Text = "Belohnung: ",
        { id = 6953 }, --Verigan's Fist Two-Hand, Mace
    },
    Page = kQuestInstanceData.TheDeadmines.Alliance[6].Page
}
kQuestInstanceData.ShadowfangKeep.Alliance[2] = {
    Title = "Die Kugel von Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Sucht 3 Fragmente von Soran'ruk und 1 großes Fragment von Soran'ruk und bringt sie zu Doan Karhan im Brachland.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Ihr bekommt die 3 Fragmente von Soran'ruk von Zwielichtakolythen in "..yellow.."[Tiefschwarze Grotte]"..white..". Ihr bekommt das Große Fragment von Soran'ruk in "..yellow.."[Burg Schattenfang]"..white.." von Klinge von Schattenfang Düsterseelen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
        { id = 15109 }, --Staff of Soran'ruk Staff
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[3] = {
    Title = "Arugals Torheit",
    Id = 99,
    Level = 27,
    Attain = 22,
    Location = "Zaubermeister Andromath (Sturmwind - Das Magierviertel, Magierturm)",
    Note = "Zaubermeister Andromath hat Euch beauftragt, Erzmagier Arugal "..yellow.."[12]"..white.." zu töten. Kehrt zu ihm zurück, wenn Ihr fertig seid.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 51805 }, --Signet of Arugal Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Alliance[4] = {
    Title = "Der verschwundene Zauberer",
    Id = 60109,
    Level = 24,
    Attain = 22,
    Aim = "Erzzauberer Andromath möchte, dass Ihr zur Burg Schattenfang im Silberwald reist und herausfindet, was mit Zauberer Aschengrund geschehen ist.",
    Location = "Zaubermeister Andromath (Sturmwind - Das Magierviertel, Magierturm)",
    Note = "Zauberer Aschengrund befindet sich im Käfig "..yellow.."[1]"..white..".",
}
kQuestInstanceData.ShadowfangKeep.Alliance[5] = {
    Title = "Blut von Vorgendor",
    Id = 41378,
    Level = 60,
    Attain = 60,
    Aim = "Sammelt Worgenblut für Fandral Hirschhelm. Er benötigt Blutproben aus Karazhan, Gilneas City und Burg Schattenfang.",
    Location = "Erzdruide Fandral Hirschhaupt (Darnassus - Die Enklave des Cenarius "..yellow.."35,9"..white..").",
    Note = "[Klinge von Schattenfang Blut] droppt von Worgen."..white.."\n[Sense der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Sense der Göttin",
    Folgequest = "Wolfsblut",
}
kQuestInstanceData.ShadowfangKeep.Horde[1] = {
    Title = "Todespirscher in Burg Schattenfang",
    Id = 1098,
    Level = 25,
    Attain = 18,
    Aim = "Sucht die Todespirscher Adamant und Vincent.",
    Location = "Hochexekutor Hadrec (Silberwald - Das Grabmal "..yellow.."43,40"..white..")",
    Note = "Ihr findet Todespirscher Adamant bei "..yellow.."[1]"..white..". Todespirscher Vincent befindet sich rechts, wenn Ihr in den Innenhof geht, bei "..yellow.."[2]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 3324 }, --Ghostly Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[2] = {
    Title = "Das Buch von Ur",
    Id = 1013,
    Level = 26,
    Attain = 16,
    Aim = "Bringt dem Bewahrer Bel'dugur im Apothekarium in Unterstadt das Buch von Ur.",
    Location = "Bewahrer Bel'dugur (Unterstadt - Das Apothekarium "..yellow.."53,54"..white..")",
    Note = "Ihr findet das Buch bei "..yellow.."[8]"..white.." auf der linken Seite, wenn Ihr den Raum betretet.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6335 }, --Grizzled Boots Feet, Leather
        { id = 4534 }, --Steel-clasped Bracers Wrist, Mail
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[3] = {
    Title = "Arugal muss sterben",
    Id = 1014,
    Level = 27,
    Attain = 18,
    Aim = "Tötet Arugal und bringt Dalar Morgenweber in dem Grabmal seinen Kopf.",
    Location = "Dalar Morgenweber (Silberwald - Das Grabmal "..yellow.."44,39"..white..")",
    Note = "Ihr findet Erzmagier Arugal bei "..yellow.."[12]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 6414 }, --Seal of Sylvanas Ring
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[4] = {
    Title = "Die Kugel von Soran'ruk",
    Id = 1740,
    Level = 25,
    Attain = 20,
    Aim = "Sucht 3 Fragmente von Soran'ruk und 1 großes Fragment von Soran'ruk und bringt sie zu Doan Karhan im Brachland.",
    Location = "Doan Karhan (Barrens "..yellow.."49,57"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Ihr bekommt die 3 Fragmente von Soran'ruk von Zwielichtakolythen in "..yellow.."[Tiefschwarze Grotte]"..white..". Ihr bekommt das Große Fragment von Soran'ruk in "..yellow.."[Burg Schattenfang]"..white.." von Klinge von Schattenfang Düsterseelen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 6898 }, --Orb of Soran'ruk Held In Off-hand
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[5] = {
    Title = "In die Klauen des Unheils",
    Id = 40281,
    Level = 25,
    Attain = 15,
    Aim = "Findet Melenas Habseligkeiten in der Bibliothek von Burg Schattenfang und bringt sie zu Pierce Shackleton in Unterstadt.",
    Location = "Pierce Knechtler (Unterstadt - Magic Quarter "..yellow.."85.4,13.6"..white..")",
    Note = "Ihr findet Melenas Habseligkeiten bei "..yellow.."[12]"..white..", eine Kiste auf dem Boden zwischen zwei linken Bücherregalen.\nDie Questreihe beginnt bei Herzog Nargelas (Tirisfal - Talhain, westlich von Tirisfal).\nDie Questbelohnung erhaltet Ihr nach Abschluss der nächsten Quest.",
    Prequest = "Darlthos Erbe -> Eine andere Art von Schloss -> Wege der Magie",
    Folgequest = "Darlthos Vermächtnis",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60392 }, --Sword of Laneron Two-Hand, Sword
        { id = 60393 }, --Shield of Mathela Shield
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[6] = {
    Title = "Zu spät für den Prälaten",
    Id = 41366,
    Level = 22,
    Attain = 16,
    Aim = "Tötet Prälat Eisenmähne und kehrt zu Vater Brightcopf in Glenshire zurück.",
    Location = "Pater Hellerkopf (Talhain "..yellow.."20.8, 68.7"..white..")",
    Note = "Ihr müsst Prälat Eisenmähne [13] töten.\nDie Questreihe beginnt bei Todeswache Podrig (Silberwald - Das Grabmal "..yellow.."43, 42"..white..").",
    Prequest = "Die Untoten beschützen -> Brightcopf zur Hilfe",
    Rewards = {
        Text = "Belohnung: ",
        { id = 70225 }, --Necklace of Redemption Neck
    }
}
kQuestInstanceData.ShadowfangKeep.Horde[7] = {
    Title = "Der Wolf, die Alte und die Sense",
    Id = 41381,
    Level = 60,
    Attain = 60,
    Aim = "Sammelt Worgenblut für Magatha Grimmtotem. Sie benötigt Blutproben aus Karazhan, Gilneas City und Burg Schattenfang.",
    Location = "Magatha Grimmtotem (Donnerfels - Die Anhöhe der Ältesten "..yellow.."70,31"..white..").",
    Note = "[Klinge von Schattenfang Blut] droppt von Worgen."..white.."\n[Sense der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Sense der Göttin",
    Folgequest = "Wolfsblut",
}

--------------- Stratholme ---------------
kQuestInstanceData.Stratholme = {
    Story = "Einst das Juwel des nördlichen Lordaeron, ist die Stadt Stratholme der Ort, and dem Prinz Arthas sich gegen seinen Mentor Uther Lichtbringer wandte und Hunderte seiner eigenen Untertanen abschlachtete, von denen man glaubte, sie hätten sich mit der gefürchteten Untotenplage infiziert. Arthas' Abwärtsspirale und letztendliche Unterwerfung unter den Lichkönig folgten bald. Die zerbrochene Stadt wird nun von der untoten Geißel bewohnt - angeführt vom mächtigen Lich Kel'Thuzad. Ein Kontingent Scharlachroter Kreuzritter, angeführt von Großkreuzfahrer Dathrohan, hält auch einen Teil der verwüsteten Stadt. Die beiden Seiten sind in ständigen, gewalttätigen Kämpfen verhaftet. Abenteurer, die mutig (oder töricht) genug sind, Stratholme zu betreten, werden gezwungen sein, sich mit beiden Fraktionen auseinanderzusetzen. Es wird gesagt, dass die Stadt von drei massiven Wachtürmen sowie mächtigen Nekromanten, Banshees und Greueln bewacht wird. Es gab auch Berichte über einen üblen Todesritter, der auf einem unheiligen Ross reitet - und wahllos Zorn auf alle austeilt, die sich in das Reich der Geißel wagen.",
    Caption = "Stratholme",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Stratholme.Alliance[1] = {
    Title = "Das Fleisch lügt nicht",
    Id = 5212,
    Level = 60,
    Attain = 55,
    Aim = "Sammelt 10 verseuchte Fleischproben in Stratholme und bringt sie zu Betina Moppelzink zurück. Ihr vermutet, dass Ihr besagte Fleischproben bei jeder Kreatur in Stratholme finden könnt.",
    Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,59"..white..")",
    Note = "Die meisten Gegner in Stratholme können die Verseuchten Fleischproben droppen.",
    Folgequest = "Der aktive Wirkstoff",
}
kQuestInstanceData.Stratholme.Alliance[2] = {
    Title = "Der aktive Wirkstoff",
    Id = 5213,
    Level = 60,
    Attain = 55,
    Aim = "Reist nach Stratholme und durchsucht die Ziggurats. Sucht neue Geißeldaten und bringt sie zu Betina Moppelzink zurück.",
    Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,59"..white..")",
    Note = "Die Geißeldaten befinden sich in einem der 3 Türme, die Ihr nahe "..yellow.."[15]"..white..", "..yellow.."[16]"..white.." und "..yellow.."[17]"..white.." findet.",
    Prequest = "Das Fleisch lügt nicht",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 13209 }, --Seal of the Dawn Trinket
        { id = 19812 }, --Rune of the Dawn Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[3] = {
    Title = "Häuser der Heiligen",
    Id = 5243,
    Level = 60,
    Attain = 55,
    Aim = "Begebt Euch nach Stratholme im Norden. Durchsucht die Vorratskisten, die über die Stadt verstreut sind, und holt 5 Einheiten Weihwasser von Stratholme. Kehrt zu Leonidas Bartholomäus dem Geachteten zurück, wenn Ihr genug der gesegneten Flüssigkeit gesammelt habt.",
    Location = "Leonidas Bartholomäus der Geachtete (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."80,58"..white..")",
    Note = "Ihr findet das Weihwasser in Truhen überall in Stratholme. Aber wenn Ihr eine Truhe öffnet, können Käfer erscheinen und Euch angreifen.",
    Rewards = {
        Text = "Belohnung: 1 und 2 und 3 oder 4",
        { id = 3928, quantity = 5 }, --Superior Healing Potion Potion
        { id = 6149, quantity = 5 }, --Greater Mana Potion Potion
        { id = 13216 }, --Crown of the Penitent Head, Cloth
        { id = 13217 }, --Band of the Penitent Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[4] = {
    Title = "Der große Fras Siabi",
    Id = 5214,
    Level = 60,
    Attain = 55,
    Aim = "Sucht Fras Siabis Raucherladen in Stratholme und bergt einen Kasten von Siabis Tollem Tabak. Kehrt zu Smokey LaRue zurück, wenn Eure Aufgabe erledigt ist.",
    Location = "Smokey LaRue (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."80,58"..white..")",
    Note = "Ihr findet den Tabakwarenladen nahe "..yellow.."[1]"..white..". Fras Siabi erscheint, wenn Ihr die Kiste öffnet.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 13171 }, --Smokey's Lighter Trinket
    }
}
kQuestInstanceData.Stratholme.Alliance[5] = {
    Title = "Die ruhelosen Seelen",
    Id = 5282,
    Level = 60,
    Attain = 55,
    Aim = "Sucht Egan. Ihr wisst nur, dass er zuletzt in der Nähe von Stratholme gesehen wurde.",
    Location = "Egan (Östliche Pestländer "..yellow.."14,33"..white..")",
    Note = "Die Vorquest bekommt Ihr von Verwalter Alen (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."79,63"..white.."). Die Spektralbürger laufen durch ganz Stratholme.",
    Prequest = "Die ruhelosen Seelen",
    Rewards = {
        Text = "Belohnung: ",
        { id = 13315 }, --Testament of Hope Held In Off-hand
    }
}
kQuestInstanceData.Stratholme.Alliance[6] = {
    Title = "Von Liebe und Familie",
    Id = 5848,
    Level = 60,
    Attain = 52,
    Aim = "Begebt Euch zur Insel Darrowehr im südlich-zentralen Bereich der Pestländer und sucht nach Hinweisen, wo sich das Gemälde befinden könnte.",
    Location = "Künstlerin Renfray (Westliche Pestländer - Darrowehr "..yellow.."65,75"..white..")",
    Note = "Die Vorquest bekommt Ihr von Tirion Fordring (Westliche Pestländer "..yellow.."7,43"..white.."). Ihr findet das Bild nahe "..yellow.."[10]"..white..".",
    Prequest = "Erlösung -> Von Liebe und Familie",
    Folgequest = "Myranda suchen",
}
kQuestInstanceData.Stratholme.Alliance[7] = {
    Title = "Menethils Geschenk",
    Id = 5463,
    Level = 60,
    Attain = 57,
    Aim = "Begebt Euch nach Stratholme und sucht Menethils Geschenk. Platziert das Andenken der Erinnerung auf dem unheiligen Boden.",
    Location = "Leonidas Bartholomäus der Geachtete (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."80,58"..white..")",
    Note = "Die Vorquest bekommt Ihr von Magistrat Marduk (Westliche Pestländer - Darrowehr "..yellow.."70,73"..white.."). Ihr findet das Schild nahe "..yellow.."[19]"..white..". Siehe auch: "..yellow.."[Der Lich, Ras Frostraunen]"..white.." in Scholomance.",
    Prequest = "Der Mensch Ras Frostraunen -> Der Sterbende Ras Frostraunen",
    Folgequest = "Menethils Geschenk",
}
kQuestInstanceData.Stratholme.Alliance[8] = {
    Title = "Aurius' Abrechnung",
    Id = 5125,
    Level = 60,
    Attain = 55,
    Aim = "Tötet den Baron.",
    Location = "Aurius (Stratholme "..yellow.."[13]"..white..")",
    Note = "Um die Quest zu starten, müsst Ihr Aurius [Das Medaillon des Glaubens] geben. Ihr bekommt das Medaillon aus einer Truhe (Malors Schatztruhe "..yellow.."[7]"..white..") in der ersten Kammer der Bastion (bevor sich die Wege teilen). Nachdem Ihr Aurius das Medaillon gegeben habt, unterstützt er Eure Gruppe im Kampf gegen den Baron "..yellow.."[19]"..white..". Nach dem Töten des Barons müsst Ihr erneut mit Aurius sprechen, um die Belohnungen zu erhalten.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 17044 }, --Will of the Martyr Neck
        { id = 17045 }, --Blood of the Martyr Ring
    }
}
kQuestInstanceData.Stratholme.Alliance[9] = {
    Title = "Der Archivar",
    Id = 5251,
    Level = 60,
    Attain = 55,
    Aim = "Reist nach Stratholme und sucht Archivar Galford vom Scharlachroten Kreuzzug. Vernichtet ihn und verbrennt das Scharlachrote Archiv.",
    Location = "Fürst Nicholas Zverenhoff (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,59"..white..")",
    Note = "Ihr findet das Archiv und den Archivar bei "..yellow.."[10]"..white..".",
    Folgequest = "Die Wahrheit zeigt sich mit Macht",
}
kQuestInstanceData.Stratholme.Alliance[10] = {
    Title = "Die Wahrheit zeigt sich mit Macht",
    Id = 5262,
    Level = 60,
    Attain = 55,
    Aim = "Bringt den Kopf von Balnazzar zu Fürst Nicholas Zverenhoff in den Östlichen Pestländern.",
    Location = "Balnazzar (Stratholme "..yellow.."[11]"..white..")",
    Note = "Ihr findet Fürst Nicholas Zverenhoff in Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts ("..yellow.."81,59"..white..").",
    Prequest = "Der Archivar",
    Folgequest = "Übertroffen",
}
kQuestInstanceData.Stratholme.Alliance[11] = {
    Title = "Übertroffen",
    Id = 5263,
    Level = 60,
    Attain = 55,
    Aim = "Zieht nach Stratholme und vernichtet Baron Totenschwur. Nehmt seinen Kopf und kehrt zu Fürst Nicholas Zverenhoff zurück.",
    Location = "Fürst Nicholas Zverenhoff (Östliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."81,59"..white..")",
    Note = "Ihr findet den Baron bei "..yellow.."[19]"..white..".",
    Prequest = "Die Wahrheit zeigt sich mit Macht",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 13243 }, --Argent Defender Shield
        { id = 13249 }, --Argent Crusader Staff
        { id = 13246 }, --Argent Avenger One-Hand, Sword
    }
}
kQuestInstanceData.Stratholme.Alliance[12] = {
    Title = "Die letzte Bitte eines toten Mannes",
    Id = 8945,
    Level = 60,
    Attain = 58,
    Aim = "Geht nach Stratholme und befreit Ysida Harmon aus den Fängen von Baron Totenschwur.",
    Location = "Anthion Harmon (Östliche Pestländer - Stratholme)",
    Note = "Anthion steht direkt außerhalb des Stratholme-Portals. Ihr benötigt den Extradimensionalen Geisterdetektor, um ihn zu sehen. Er stammt aus der Vorquest. Die Questreihe beginnt mit Die angemessene Entlohnung. Deliana in Eisenschmiede ("..yellow.."43,52"..white..") für Allianz, Mokvar in Orgrimmar ("..yellow.."38,37"..white..") für Horde.\nDies ist der berüchtigte '45-Minuten'-Baron-Lauf.",
    Prequest = "Suche nach Anthion",
    Folgequest = "Lebensbeweis",
}
kQuestInstanceData.Stratholme.Alliance[13] = {
    Title = "Das linke Stück von Lord Valthalaks Amulett",
    Id = 8968,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nJarien und Sothos werden bei "..yellow.."[11]"..white.." beschworen.",
    Prequest = "Komponenten von großer Wichtigkeit",
    Folgequest = "Ich sehe die Insel Alcaz in Eurer Zukunft",
}
kQuestInstanceData.Stratholme.Alliance[14] = {
    Title = "Das rechte Stück von Lord Valthalaks Amulett",
    Id = 8991,
    Level = 60,
    Attain = 58,
    Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit Lord Valthalaks zusammengesetzten Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück.",
    Location = "Bodley (Der Schwarzfels "..yellow.."[D] on Entrance Map"..white..")",
    Note = "Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Ihr bekommt ihn von der Quest 'Suche nach Anthion'.\n\nJarien und Sothos werden bei "..yellow.."[11]"..white.." beschworen.",
    Prequest = "Mehr Komponenten von großer Wichtigkeit",
    Folgequest = "Letzte Vorbereitungen ("..yellow.."Upper Blackrock Spire"..white..")", -- 8994",
}
kQuestInstanceData.Stratholme.Alliance[15] = {
    Title = "Atiesh, Hohestab des Wächters",
    Id = 9257,
    Level = 60,
    Attain = 60,
    Aim = "Anachronos in den Höhlen der Zeit in Tanaris möchte, dass Ihr Atiesh, den Hohestab des Wächters, nach Stratholme bringt und dort auf dem geheiligten Boden platziert. Bezwingt das Wesen, das aus dem Stab getrieben wurde, und kehrt danach wieder zu ihm zurück.",
    Location = "Anachronos (Tanaris - Höhlen der Zeit "..yellow.."65,49"..white..")",
    Note = "Atiesh wird bei "..yellow.."[2]"..white.." beschworen.",
    Prequest = "Grundstab von Atiesh -> Atiesh, der korrumpierte Hohestab",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 22589 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22630 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22631 }, --Atiesh, Greatstaff of the Guardian Staff
        { id = 22632 }, --Atiesh, Greatstaff of the Guardian Staff
    }
}
kQuestInstanceData.Stratholme.Alliance[16] = {
    Title = "Verderbnis",
    Id = 5307,
    Level = 60,
    Attain = 50,
    Aim = "Findet den Schwertschmied der schwarzen Wache in Stratholme und vernichtet ihn. Holt die Insignien der schwarzen Wache und kehrt zu Seril Geißelbann zurück.",
    Location = "Seril Geißelbann (Winterquell - Ewige Warte "..yellow.."61,37"..white..")",
    Note = red.."Nur Schmiede"..white..": Der Schwertschmied der schwarzen Wache wird nahe "..yellow.."[15]"..white.." beschworen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 12825 }, --Plans: Blazing Rapier Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[17] = {
    Title = "Süße Beschaulichkeit",
    Id = 5305,
    Level = 60,
    Attain = 50,
    Aim = "Begebt Euch nach Stratholme und tötet den purpurroten Hammerschmied. Nehmt die Schürze des purpurroten Hammerschmiedes und kehrt zu Lilith zurück.",
    Location = "Lilith die Liebliche (Winterquell - Ewige Warte "..yellow.."61,37"..white..")",
    Note = red.."Nur Schmiede"..white..": Der Auferstandene Hammerschmied wird bei "..yellow.."[8]"..white.." beschworen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 12824 }, --Plans: Enchanted Battlehammer Pattern
    }
}
kQuestInstanceData.Stratholme.Alliance[18] = {
    Title = "Einen Stampfer bauen",
    Id = 80401,
    Level = 60,
    Attain = 30,
    Aim = "Beschafft den thoriumjustierten Servomechanismus aus der Waffenkammer des Scharlachroten Klosters, besorgt den perfekten Golemkern bei Golemlord Argelmach in den Schwarzfelstiefen und findet die Adamantitrute in Stratholme. Kehrt danach zu Oglethorpe Obnoticus zurück.",
    Location = "Glotz Widrikus <Master Gnomeningenieur> (Schlingendorntal; Beutebucht "..yellow.."28.4,76.3"..white..").",
    Note = red.."Nur Ingenieure"..white.."Diese Quest erfordert das Sammeln von 3 Gegenständen.\n1) Thoriumgestimmter Servo (Das Scharlachrote Kloster von Scharlachroter Myrmidone)\n2) Perfekter Golemkern (Schwarzfelstiefen von Golemlord Argelmach)\n3) Adamantitstab (Stratholme vom Auferstandenen Hammerschmied "..yellow.."[8]"..white..")\n'Meuteverprügler 9-60' in Gnomeregan lässt 'Intaktes Stampfer-Hauptsystem' fallen, das die Vorquest 'Ein pulsierendes Gehirn' startet.",
    Prequest = "Ein pulsierendes Gehirn",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Aim = "Holt Wappenrock des Aschenbringers (tötet Großkreuzfahrer Dathrohan) und Umhang von Alexandros aus Stratholme.",
    Location = "Tirion Fordring (Westliche Pestländer - Kapelle des Hoffnungsvollen Lichts "..yellow.."67.3,24.2"..white..").",
    Note = "Wappenrock des Aschenbringers droppt von Großkreuzfahrer Dathrohan "..yellow.."[11]"..white..", Umhang von Alexandros droppt von Baron Totenschwur "..yellow.."[19]"..white.."\nDie Questreihe beginnt in Naxxramas nach dem Töten der 4 Reiter mit der Quest 'Kugel des reinen Lichts'.",
    Prequest = "Kugel des reinen Lichts -> Sucht anderswo Hilfe",
    Folgequest = "Geist des Aschenbringers",
    Rewards = {
        Text = "Belohnung: ",
        { id = 82002 }, --Tabard of the Ashbringer Tabard
    }
}
kQuestInstanceData.Stratholme.Alliance[20] = {
    Title = "Brosche der Familie Rothlen",
    Id = 41000,
    Level = 60,
    Attain = 55,
    Aim = "Holt die Brosche der Familie Rothlen aus Stratholme für Herzog Rothlen in Karazhan.",
    Location = "Herzog Rothlen (Karazhan "..yellow.."[Karazhan - c]"..white..")",
    Note = "Brosche der Familie Rothlen neben Boss Der Unverziehene "..yellow.."[4]"..white.." in der Truhe.\nDie Questrei begins mit epischem Gegenstand-Zufallsdrop 'Gekritzelte Kochnotizen' "..yellow.."[Karazhan]"..white..".",
    Prequest = "Gekritzelte Kochnotizen "..yellow.."[Karazhan]"..white.." -> Fundbüro "..yellow.."[Karazhan]"..white.."",
    Folgequest = "Das geheime Rezept ("..yellow.."[Karazhan]"..white..")",
}
kQuestInstanceData.Stratholme.Alliance[21] = {
    Title = "Der Schlüssel zu Karazhan VII",
    Id = 40826,
    Level = 60,
    Attain = 58,
    Aim = "Findet vier Echos von Medivh. Sie könnten an Orten großer Bedeutung für den Magier gefunden werden. Kehrt dann mit dem Schlüssel zu Dolvan zurück.",
    Location = "Dolvan Windbrace (Düstermarschen - Westhafenkluft "..yellow.."[71.1,73.2]"..white..")",
    Note = "Zweite Feder von Medivh auf dem Boden an dem Ort, wo Urahne Fernwisper (Mondfest) "..yellow.."[5]"..white.." ist.\nErste Feder von Medivh "..yellow.."[Unterstadt]"..white.." hinter dem Eingangsthron.\nDritte Feder von Medivh "..yellow.."[Alteracgebirge]"..white.." am Ende der ersten (westlichen) Klippe "..yellow.."[30.8,87.4]"..white.."\nVierte Feder von Medivh "..yellow.."[Hyjal]"..white.." am Ende der Klippe "..yellow.."[31.8,70.5]"..white..".",
    Prequest = "Der Schlüssel zu Karazhan VI",
    Folgequest = "Der Schlüssel zu Karazhan VIII ("..yellow.."Dire Maul West"..white..")",
}
for i = 1, 17 do
    kQuestInstanceData.Stratholme.Horde[i] = kQuestInstanceData.Stratholme.Alliance[i]
end
kQuestInstanceData.Stratholme.Horde[18] = {
    Title = "Ramstein",
    Id = 6163,
    Level = 60,
    Attain = 56,
    Aim = "Reist nach Stratholme und tötet Ramstein den Würger. Bringt seinen Kopf als Souvenir zu Nathanos.",
    Location = "Nathanos Pestrufer (Östliche Pestländer "..yellow.."26,74"..white..")",
    Note = "Die Vorquest bekommt Ihr auch von Nathanos Pestrufer. Ihr findet Ramstein bei "..yellow.."[18]"..white..".",
    Prequest = "Das Ersuchen des Waldläuferlords -> Dämmerschwinge, oh, wie ich Euch hasse...",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 18022 }, --Royal Seal of Alexis Ring
        { id = 17001 }, --Elemental Circle Ring
    }
}
kQuestInstanceData.Stratholme.Horde[19] = {
    Title = "Einen Stampfer bauen",
    Id = 80401,
    Level = 60,
    Attain = 30,
    Aim = "Beschafft den thoriumjustierten Servomechanismus aus der Waffenkammer des Scharlachroten Klosters, besorgt den perfekten Golemkern bei Golemlord Argelmach in den Schwarzfelstiefen und findet die Adamantitrute in Stratholme. Kehrt danach zu Oglethorpe Obnoticus zurück.",
    Location = "Glotz Widrikus <Master Gnomeningenieur> (Schlingendorntal; Beutebucht "..yellow.."28.4,76.3"..white..").",
    Note = red.."Nur Ingenieure"..white.."Diese Quest erfordert das Sammeln von 3 Gegenständen.\n1) Thoriumgestimmter Servo (Das Scharlachrote Kloster von Scharlachroter Myrmidone)\n2) Perfekter Golemkern (Schwarzfelstiefen von Golemlord Argelmach)\n3) Adamantitstab (Stratholme vom Auferstandenen Hammerschmied "..yellow.."[8]"..white..")\n'Meuteverprügler 9-60' in Gnomeregan lässt 'Intaktes Stampfer-Hauptsystem' fallen, das die Vorquest 'Ein pulsierendes Gehirn' startet.",
    Prequest = "Ein pulsierendes Gehirn",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Story = "Während der letzten Stunden des Krieges der Treibsande trieben die vereinten Streitkräfte der Nachtelfen und der vier Drachenschwärme die Schlacht bis ins Herz des Qiraji-Reiches, zur Festungsstadt Ahn'Qiraj. Doch an den Stadttoren stießen die Armeen von Kalimdor auf eine Konzentration von Silithid-Kriegsdrohnen, die massiver war als alles, was sie zuvor angetroffen hatten. Letztendlich wurden die Silithid und ihre Qiraji-Meister nicht besiegt, sondern lediglich in einer magischen Barriere eingesperrt, und der Krieg ließ die verfluchte Stadt in Ruinen zurück. Tausend Jahre sind seit jenem Tag vergangen, aber die Qiraji-Streitkräfte waren nicht untätig. Eine neue und schreckliche Armee wurde aus den Bienenstöcken hervorgebracht, und die Ruinen von Ahn'Qiraj wimmeln wieder von schwärmenden Massen von Silithid und Qiraji. Diese Bedrohung muss beseitigt werden, sonst könnte ganz Azeroth vor der erschreckenden Macht der neuen Qiraji-Armee fallen.",
    Caption = "Ruinen von Ahn'Qiraj",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[1] = {
    Title = "Der Untergang von Ossirian",
    Id = 8791,
    Level = 60,
    Attain = 60,
    Aim = "Bringt den Kopf von Ossirian dem Narbenlosen zu Kommandant Mar'alith auf Burg Cenarius in Silithus.",
    Location = "Kopf von Ossirian dem Narbenlosen (droppt von Ossirian der Narbenlose "..yellow.."[6]"..white..")",
    Note = "Kommandant Mar'alith (Silithus - Burg Cenarius "..yellow.."49,34"..white..")",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 21504 }, --Charm of the Shifting Sands Neck
        { id = 21507 }, --Amulet of the Shifting Sands Neck
        { id = 21505 }, --Choker of the Shifting Sands Neck
        { id = 21506 }, --Pendant of the Shifting Sands Neck
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[2] = {
    Title = "Das perfekte Gift",
    Id = 9023,
    Level = 60,
    Attain = 60,
    Aim = "Dirk Donnerholz in der Burg Cenarius will, dass Ihr ihm Venoxis' Giftbeutel und Kurinnaxx' Giftbeutel bringt.",
    Location = "Langdolch Donnerholz (Silithus - Burg Cenarius "..yellow.."52,39"..white..")",
    Note = "Venoxis' Giftbeutel droppt von Hohepriester Venoxis in "..yellow.."Zul'Gurub"..white..". Kurinnaxx' Giftbeutel droppt in den "..yellow.."Ruinen von Ahn'Qiraj"..white.." bei "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 22378 }, --Ravenholdt Slicer One-Hand, Sword
        { id = 22379 }, --Shivsprocket's Shiv Main Hand, Dagger
        { id = 22377 }, --The Thunderwood Poker One-Hand, Dagger
        { id = 22348 }, --Doomulus Prime Two-Hand, Mace
        { id = 22347 }, --Fahrad's Reloading Repeater Crossbow
        { id = 22380 }, --Simone's Cultivating Hammer Main Hand, Mace
    }
}
kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[3] = {
    Title = "Verloren im Sand",
    Id = 70001,
    Level = 60,
    Attain = 60,
    Aim = "Bringt einen Perfekten Obsidiansplitter zu Erzmagier Xylem.",
    Location = "Erzmagier Xylem (Azshara "..yellow.."28,47"..white..")",
    Note = red.."Nur Magier"..white..": Vorquest von Wissenshüter Lydros (Düsterbruch - West oder Nord "..yellow.."[1] Bibliothek"..white.."). Perfekter Obsidiansplitter droppt von "..yellow.."[3]"..white..".",
    Prequest = "Arkane Erfrischung -> Eine besondere Art der Beschwörung",
    Rewards = {
        Text = "Belohnung: ",
        { id = 83002 }, --Tome of Refreshment Ritual Pattern
    }
}
for i = 1, 3 do
    kQuestInstanceData.TheRuinsofAhnQiraj.Horde[i] = kQuestInstanceData.TheRuinsofAhnQiraj.Alliance[i]
end

--------------- The Stockade ---------------
kQuestInstanceData.TheStockade = {
    Story = "Die Verlies sind ein Hochsicherheitsgefängniskomplex, verborgen unter dem Kanalviertel der Stadt Sturmwind. Unter der Leitung von Kerkermeister Thelwater sind die Verlies die Heimat von Kleinkriminellen, politischen Aufständischen, Mördern und einer Schar der gefährlichsten Verbrecher des Landes. Kürzlich hat eine von Gefangenen angeführte Revolte zu einem Zustand des Chaos in den Verliesen geführt - wo die Wachen vertrieben wurden und die Sträflinge frei herumlaufen. Kerkermeister Thelwater ist es gelungen, aus dem Haftbereich zu entkommen und wirbt derzeit mutige Nervenkitzel-Suchende an, sich ins Gefängnis zu wagen und den Drahtzieher des Aufstands zu töten - den gerissenen Straftäter Bazil Thredd.",
    Caption = "Das Verlies",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheStockade.Alliance[1] = {
    Title = "Verbrechen lohnt sich nicht",
    Id = 386,
    Level = 25,
    Attain = 22,
    Aim = "Bringt Wache Berton in Seenhain den Kopf von Targorr dem Schrecklichen.",
    Location = "Wache Berton (Rotkammgebirge - Seenhain "..yellow.."26,46"..white..")",
    Note = "Ihr findet Targorr bei "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 3400 }, --Lucine Longsword Main Hand, Sword
        { id = 1317 }, --Hardened Root Staff Staff
    }
}
kQuestInstanceData.TheStockade.Alliance[2] = {
    Title = "Verbrechen und Strafe",
    Id = 377,
    Level = 26,
    Attain = 22,
    Aim = "Ratsherr Mühlenstein von Dunkelhain will, dass Ihr ihm die Hand von Dextren Ward bringt.",
    Location = "Millstipe (Dämmerwald - Dunkelhain "..yellow.."72,47"..white..")",
    Note = "Ihr findet Dextren bei "..yellow.."[5]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 2033 }, --Ambassador's Boots Feet, Leather
        { id = 2906 }, --Darkshire Mail Leggings Legs, Mail
    }
}
kQuestInstanceData.TheStockade.Alliance[3] = {
    Title = "Niederschlagung des Aufstandes",
    Id = 387,
    Level = 26,
    Attain = 22,
    Aim = "Aufseher Thelwasser aus Sturmwind will, dass Ihr im Verlies 10 Gefangene, 8 Sträflinge und 8 Aufrührer tötet.",
    Location = "Aufseher Thelwasser (Sturmwind - Das Verlies "..yellow.."41,58"..white..")",
}
kQuestInstanceData.TheStockade.Alliance[4] = {
    Title = "Die Farbe von Blut",
    Id = 388,
    Level = 26,
    Attain = 22,
    Aim = "Nikova Raskol von Sturmwind will, dass Ihr 10 rote Wollkopftücher für sie sammelt.",
    Location = "Nikova Raskol (Sturmwind - Old Town "..yellow.."73,46"..white..")",
    Note = "Alle Gegner in der Instanz lassen Rote Wollbandanas fallen.",
}
kQuestInstanceData.TheStockade.Alliance[5] = {
    Title = "Tief empfundener Zorn",
    Id = 378,
    Level = 27,
    Attain = 22,
    Aim = "Motley Garmason in Dun Modr verlangt Kam Tiefenzorns Kopf.",
    Location = "Motley Garmason (Sumpfland - Dun Modr "..yellow.."49,18"..white..")",
    Note = "Die vorhergehende Quest kann auch von Motley erhalten werden. Ihr findet Kam Tiefenzorn bei "..yellow.."[2]"..white..".",
    Prequest = "Der Dunkeleisenkrieg",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 3562 }, --Belt of Vindication Waist, Leather
        { id = 1264 }, --Headbasher Two-Hand, Mace
    }
}
kQuestInstanceData.TheStockade.Alliance[6] = {
    Title = "Aufstand im Verlies",
    Id = 391,
    Level = 29,
    Attain = 16,
    Aim = "Tötet Bazil Thredd und bringt seinen Kopf mit zurück zu Aufseher Thelwasser im Verlies.",
    Location = "Aufseher Thelwasser (Sturmwind - Das Verlies "..yellow.."41,58"..white..")",
    Note = "Für weitere Details über die vorhergehende Quest siehe "..yellow.."[Deadmines, Die Bruderschaft der Defias]"..white.."\nIhr findet Bazil Thredd bei "..yellow.."[4]"..white..".",
    Prequest = "Die Bruderschaft der Defias -> Bazil Thredd",
    Folgequest = "Der seltsame Besucher",
}
kQuestInstanceData.TheStockade.Alliance[7] = {
    Title = "The Stockade's Search",
    Id = 55221,
    Level = 24,
    Attain = 18,
    Aim = "Dringt in die Verlies ein und findet Informationen über Martin Corinth.",
    Location = "Meister Mathias Shaw <Anführer des SI:7> (Sturmwind - Altstadt, Schurkenbereich "..yellow.."75.8,59.8"..white..")",
    Note = "Ihr findet Martin Corinths Informationen in der Versiegelten Dokumentenkiste "..yellow.."[1]"..white.." im Raum gegenüber dem Dungeoneingang.\nDie Questreihe beginnt mit der Quest 'Ein Geheimnis aufdecken' bei Lordkommandant Ryke (Sumpfland - Falkenwacht "..yellow.."36.4,67.3"..white.." unter dem Zelt).\nIhr erhaltet die Belohnung, nachdem Ihr die letzte Quest der Questreihe abgeschlossen habt.",
    Prequest = "Robbs Bericht",
    Folgequest = "Ermittlungen in Corinth",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 81416 }, --Valiant Medallion Neck
        { id = 81417 }, --Ambient Talisman Neck
        { id = 81418 }, --Magnificent Necklace Neck
    }
}

--------------- The Sunken Temple ---------------
kQuestInstanceData.TheSunkenTemple = {
    Story = "Vor über tausend Jahren wurde das mächtige Gurubashi-Reich durch einen massiven Bürgerkrieg zerrissen. Eine einflussreiche Gruppe von Trollpriestern, bekannt als die Atal'ai, versuchte einen alten Blutgott namens Hakkar den Seelenschinder zurückzubringen. Obwohl die Priester besiegt und letztendlich verbannt wurden, brach das große Trollreich in sich zusammen. Die verbannten Priester flohen weit nach Norden in die Sümpfe des Elends. Dort errichteten sie einen großen Tempel für Hakkar - wo sie sich auf seine Ankunft in der physischen Welt vorbereiten konnten. Der große Drachenaspekt Ysera erfuhr von den Plänen der Atal'ai und zerschmetterte den Tempel unter den Sümpfen. Bis heute werden die ertrunkenen Ruinen des Tempels von den grünen Drachen bewacht, die verhindern, dass jemand hinein- oder hinauskommt. Es wird jedoch geglaubt, dass einige der fanatischen Atal'ai Yseras Zorn überlebt haben - und sich erneut dem dunklen Dienst an Hakkar verschrieben haben.",
    Caption = "The Versunkener Tempel",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheSunkenTemple.Alliance[1] = {
    Title = "Im Tempel von Atal'Hakkar",
    Id = 1475,
    Level = 50,
    Attain = 41,
    Aim = "Sammelt 10 Schrifttafeln der Atal'ai für Brohann Fassbauch in Sturmwind.",
    Location = "Brohann Fassbauch (Sturmwind - Zwergenviertel "..yellow.."64,20"..white..")",
    Note = "Die Vorquestlinie kommt vom selben NPC und hat einige Schritte.\n\nIhr findet die Tafeln überall im Tempel, sowohl draußen als auch innerhalb der Instanz.",
    Prequest = "Auf der Suche nach dem Tempel -> Rhapsodies Geschichte",
    Rewards = {
        Text = "Belohnung: ",
        { id = 1490 }, --Guardian Talisman Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[2] = {
    Title = "Der Dunst des Bösen",
    Id = 4143,
    Level = 52,
    Attain = 47,
    Aim = "Sammelt 5 Proben Dunst der Atal'ai und bringt sie Muigin im Krater von Un'Goro.",
    Location = "Gregan Hopfenspei (Feralas "..yellow.."45,25"..white..")",
    Note = "Die Vorquest 'Muigin und Larion' beginnt bei Muigin (Krater von Un'Goro - Marschalls Zuflucht "..yellow.."42,9"..white.."). Ihr bekommt den Dunst von Tieflauerer, Düsterewürmer oder Schleimen im Tempel.",
    Prequest = "Muigin und Larion -> Ein Besuch bei Gregan",
}
kQuestInstanceData.TheSunkenTemple.Alliance[3] = {
    Title = "In die Tiefen",
    Id = 3446,
    Level = 51,
    Attain = 46,
    Aim = "Sucht den Altar von Hakkar im Versunkenen Tempel in den Sümpfen des Elends.",
    Location = "Marvon Nietensucher (Tanaris "..yellow.."52,45"..white..")",
    Note = "Der Altar ist bei "..yellow.."[1]"..white.."\nDie Allianz-Questreihe beginnt bei Angelas Mondhauch (Feralas - Mondfederfeste "..yellow.."31.8,45.6"..white..") mit der Quest 'Der Versunkene Tempel'.\nDie Horde-Questreihe beginnt bei Hexendoktor Uzer'i (Feralas - Camp Mojache "..yellow.."74.4,43.4"..white..") mit der Quest 'Der Versunkene Tempel'.",
    Prequest = "Der runde Stein",
    Folgequest = "Das Geheimnis des Kreises",
}
kQuestInstanceData.TheSunkenTemple.Alliance[4] = {
    Title = "Das Geheimnis des Kreises",
    Id = 3447,
    Level = 51,
    Attain = 46,
    Aim = "Reist zum Versunkenen Tempel und enthüllt das Geheimnis, das sich in dem Kreis der Statuen verbirgt.",
    Location = "Altar von Hakkar (Versunkener Tempel "..yellow.."1"..white..")",
    Note = "Ihr findet die Statuen bei "..yellow.."[1]"..white..". Siehe Karte für die Reihenfolge der Aktivierung.",
    Prequest = "In die Tiefen",
    Rewards = {
        Text = "Belohnung: ",
        { id = 10773 }, --Hakkari Urn Container
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[5] = {
    Title = "Der Gott Hakkar",
    Id = 3528,
    Level = 53,
    Attain = 40,
    Aim = "Bringt das gefüllte Ei von Hakkar zu Yeh'kinya nach Tanaris.",
    Location = "Yeh'kinya (Tanaris - Dampfdruckpier "..yellow.."66,22"..white..")",
    Note = "Die Questreihe beginnt mit 'Kreischergeister' beim selben NPC (Siehe "..yellow.."[Zul'Farrak]"..white..").\nIhr müsst das Ei bei "..yellow.."[3]"..white.." benutzen, um das Event zu starten. Sobald es beginnt, erscheinen Gegner und greifen Euch an. Einige von ihnen lassen das Blut von Hakkar fallen. Mit diesem Blut könnt Ihr die Fackel um den Kreis löschen. Danach erscheint der Avatar von Hakkar. Ihr tötet ihn und plündert die 'Essenz von Hakkar', die Ihr benutzt, um das Ei zu füllen.",
    Prequest = "Kreischergeister -> Das uralte Ei",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 10749 }, --Avenguard Helm Head, Plate
        { id = 10750 }, --Lifeforce Dirk One-Hand, Dagger
        { id = 10751 }, --Gemburst Circlet Head, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[6] = {
    Title = "Jammal'an der Prophet",
    Id = 1446,
    Level = 53,
    Attain = 38,
    Aim = "Der Verbannte der Atal'ai im Hinterland möchte den Kopf von Jammal'an.",
    Location = "Der Verbannte der Atal'ai (Hinterland "..yellow.."33,75"..white..")",
    Note = "Ihr findet Jammal'an bei "..yellow.."[4]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 11123 }, --Rainstrider Leggings Legs, Cloth
        { id = 11124 }, --Helm of Exile Head, Mail
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[7] = {
    Title = "Die Essenz des Eranikus",
    Id = 3373,
    Level = 55,
    Attain = 48,
    Aim = "Legt die Essenz von Eranikus in den Essenzborn, der sich in dem Versunkenen Tempel in seinem Unterschlupf befindet.",
    Location = "Die Essenz des Eranikus (droppt von Eranikus' Schemen "..yellow.."[6]"..white..")",
    Note = "Ihr findet den Essenzquell neben der Stelle, wo Eranikus' Schemen bei "..yellow.."[6]"..white.." ist.\n"..red.."Verkauft nicht"..white.." oder werft nicht die Belohnungs-Schmuckstück Gebundene Essenz des Eranikus weg. Ihr benötigt es für die nächste Quest bei Itharius (Sümpfe des Elends - Itharius' Höhle "..yellow.."[13.6,71.7]"..white..". Nach dem Gespräch mit ihm erhaltet Ihr einen Gegenstand, der die Quest startet.",
    Folgequest = "Die Essenz des Eranikus",
    Rewards = {
        Text = "Belohnung: ",
        { id = 10455 }, --Chained Essence of Eranikus Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[8] = {
    Title = "Federn von Trollen",
    Id = 8422,
    Level = 52,
    Attain = 50,
    Aim = "Bringt 6 Voodoofedern von den Trollen aus dem Versunkenen Tempel.",
    Location = "Impsy (Teufelswald "..yellow.."42,45"..white..")",
    Note = red.."Nur Hexenmeister"..white..": Feder droppt von jedem der benannten Trolle auf den Vorsprüngen mit Blick auf den großen Raum mit dem Loch in der Mitte.",
    Prequest = "Die Bitte eines Wichtels -> Das richtige Zeug",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 20536 }, --Soul Harvester Staff
        { id = 20534 }, --Abyss Shard Trinket
        { id = 20530 }, --Robes of Servitude Chest, Cloth
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[9] = {
    Title = "Voodoofedern",
    Id = 8425,
    Level = 52,
    Attain = 50,
    Aim = "Bringt die Voodoofedern der Trolle im Versunkenen Tempel zu dem gefallenen Helden der Horde.",
    Location = "Gefallener Held der Horde (Sümpfe des Elends "..yellow.."34,66"..white..")",
    Note = red.."Nur Krieger"..white..": Feder droppt von jedem der benannten Trolle auf den Vorsprüngen mit Blick auf den großen Raum mit dem Loch in der Mitte.\nDie Horde-Questreihe beginnt in Orgrimmar beim Kriegerlehrer Sorek "..yellow.."80.4,32.3"..white..".",
    Prequest = "Ein geplagter Geist -> Krieg den Schattenanbetern",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 20521 }, --Fury Visor Head, Plate
        { id = 20130 }, --Diamond Flask Trinket
        { id = 20517 }, --Razorsteel Shoulders Shoulder, Plate
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[10] = {
    Title = "Eine bessere Zutat",
    Id = 9053,
    Level = 52,
    Attain = 50,
    Aim = "Beschafft Euch eine Fäulnisranke von dem Wächter auf dem Grund des Versunkenen Tempels und kehrt zu Torwa Pfadfinder zurück.",
    Location = "Torwa Pfadfinder (Krater von Un'Goro "..yellow.."72,76"..white..")",
    Note = red.."Nur Druiden"..white..": Die Fäulnisranke droppt von Atal'alarion, der bei "..yellow.."[1]"..white.." beschworen wird, indem die Statuen in der auf der Karte aufgeführten Reihenfolge aktiviert werden.",
    Prequest = "Torwa Pfadfinder -> Giftexperiment",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 22274 }, --Grizzled Pelt Chest, Leather
        { id = 22272 }, --Forest's Embrace Chest, Leather
        { id = 22458 }, --Moonshadow Stave Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[11] = {
    Title = "Der grüne Drache",
    Id = 8232,
    Level = 52,
    Attain = 50,
    Aim = "Bringt Morphaz' Zahn zu Ogtinc in Azshara. Ogtinc wohnt oberhalb des Kliffs, nordöstlich der Ruinen von Eldarath.",
    Location = "Ogtinc (Azshara "..yellow.."42,43"..white..")",
    Note = red.."Nur Jäger"..white..": Morphaz ist bei "..yellow.."[5]"..white..".",
    Prequest = "Der Talisman des Jägers -> Wellenjagd",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 20083 }, --Hunting Spear Polearm
        { id = 19991 }, --Devilsaur Eye Trinket
        { id = 19992 }, --Devilsaur Tooth Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[12] = {
    Title = "Vernichtet Morphaz",
    Id = 8253,
    Level = 52,
    Attain = 50,
    Aim = "Beschafft den arkanen Splitter von Morphaz' Leichnam und kehrt mit ihm zu Erzmagier Xylem zurück.",
    Location = "Erzmagier Xylem (Azshara "..yellow.."29,40"..white..")",
    Note = red.."Nur Magier"..white..": Morphaz ist bei "..yellow.."[5]"..white..".",
    Prequest = "Magischer Staub -> Die Koralle der Sirenen",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 20035 }, --Glacial Spike One-Hand, Dagger
        { id = 20037 }, --Arcane Crystal Pendant Neck
        { id = 20036 }, --Fire Ruby Trinket
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[13] = {
    Title = "Morphaz' Blut",
    Id = 8257,
    Level = 52,
    Attain = 50,
    Aim = "Tötet Morphaz im Versunkenen Tempel von Atal'Hakkar und bringt Greta Mooshuf im Teufelswald sein Blut. Der Eingang zum Versunkenen Tempel liegt in den Sümpfen des Elends.",
    Location = "Ogtinc (Azshara "..yellow.."42,43"..white..")",
    Note = red.."Nur Priester"..white..": Morphaz ist bei "..yellow.."[5]"..white..". Greta Mooshuf ist in Teufelswald - Das Smaragdrefugium ("..yellow.."51,82"..white..").",
    Prequest = "Cenarische Hilfe -> Sekret des Untodes",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 19990 }, --Blessed Prayer Beads Trinket
        { id = 20082 }, --Woestave Wand
        { id = 20006 }, --Circle of Hope Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[14] = {
    Title = "Der azurblaue Schlüssel",
    Id = 8236,
    Level = 52,
    Attain = 50,
    Aim = "Bringt den azurblauen Schlüssel zu Lord Jorach Rabenholdt.",
    Location = "Erzmagier Xylem (Azshara "..yellow.."29,40"..white..")",
    Note = red.."Nur Schurken"..white..": Der Azurblaue Schlüssel droppt von Morphaz bei "..yellow.."[5]"..white..". Lord Jorach Rabenholdt ist im Alteracgebirge - Rabenholdt ("..yellow.."86,79"..white..").",
    Prequest = "Ein simples Anliegen -> Verschlüsselte Fragmente",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 19984 }, --Ebon Mask Head, Leather
        { id = 20255 }, --Whisperwalk Boots Feet, Leather
        { id = 19982 }, --Duskbat Drape Back
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[15] = {
    Title = "Eranikus, der Tyrann des Traums",
    Id = 8733,
    Level = 60,
    Attain = 60,
    Aim = "Reist nach Teldrassil und sucht Malfurions Agenten irgendwo außerhalb der Stadtmauern von Darnassus auf.",
    Location = "Malfurion Sturmgrimm (Spawns at Eranikus' Schemen "..yellow.."[8]"..white..")",
    Note = "Waldirrlicht (Teldrassil "..yellow.."37,47"..white..")",
    Prequest = "Der Bund der Drachenschwärme",
    Folgequest = "Tyrande und Remulos",
}
kQuestInstanceData.TheSunkenTemple.Alliance[16] = {
    Title = "Mit allen nötigen Mitteln IV",
    Id = 40400,
    Level = 53,
    Attain = 47,
    Aim = "Reist zum Versunkenen Tempel und findet den Drachenkin Hazzas, tötet ihn und bringt das Herz von Hazzas zu Niremius Dunkelwind.",
    Location = "Niremius Dunkelwind (Teufelswald "..yellow.."40,30"..white..")",
    Note = "Droppt von Boss [7]. Belohnung von der nächsten Quest.",
    Prequest = "Mit allen nötigen Mitteln I -> Mit allen nötigen Mitteln II -> Mit allen nötigen Mitteln III",
    Folgequest = "Mit allen nötigen Mitteln V",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60536 }, --Darkwind Glaive One-Hand, Sword
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[17] = {
    Title = "Erschaffung des Steins der Macht",
    Id = 8418,
    Level = 52,
    Attain = 50,
    Aim = "Beschafft Euch gelbe, blaue und grüne Voodoofedern von den Trollen im Versunkenen Tempel.",
    Location = "Kommandant Ashlam Ehrenschlag (Westliche Pestländer - Zugwindlager "..yellow.."43,85"..white..")",
    Note = red.."Nur Paladine"..white..": Feder droppt von jedem der benannten Trolle auf den Vorsprüngen mit Blick auf den großen Raum mit dem Loch in der Mitte.",
    Prequest = "Gereinigte Geißelsteine",
    Rewards = {
        Text = "Belohnung: 1 und 2 oder 3 oder 4",
        { id = 20620 }, --Holy Mightstone Enchant
        { id = 20504 }, --Lightforged Blade Two-Hand, Sword
        { id = 20512 }, --Sanctified Orb Trinket
        { id = 20505 }, --Chivalrous Signet Ring
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[18] = {
    Title = "In den Traum III",
    Id = 40959,
    Level = 60,
    Attain = 58,
    Aim = "Sammelt ein Bindungsfragment von Klippenbrecher in Azshara, Überladenes arkanes Prisma von Arkanen Torrents im Westflügel von Düsterbruch und einen Splitter des Schlummerers vom Weber im Versunkenen Tempel. Meldet Euch mit den gesammelten Gegenständen bei Itharius in den Sümpfen des Elends.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."85,30"..white..")",
    Note = "Wirker "..yellow.."[6]"..white.." einer von 4 Drachen lässt Splitter des Schlummerers fallen, erscheint nach dem Töten von Jammal'an der Prophet "..yellow.."[4]"..white..". Die Barriere zum Propheten verschwindet nach dem Reinigen von 6 Balkonen "..blue.."[C]"..white.."\nDurch Abschluss dieser Questreihe erhaltet Ihr die Halskette und könnt die Hyjal-Raidinstanz Smaragdsanktum betreten.",
    Prequest = "In den Traum I -> In den Traum II",
    Folgequest = "In den Traum IV",
    Rewards = {
        Text = "Belohnung: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Alliance[19] = {
    Title = "Der Stab des Risswandlers",
    Id = 41323,
    Level = 54,
    Attain = 30,
    Aim = "Kehrt mit Akh Z'adors Risswanderer-Stab und dem Mojo von Jammal'an zu Akh Z'ador in Azshara zurück.",
    Location = "Akh Zador (Azshara "..yellow.."51,37"..white..")",
    Note = "Die Questreihe beginnt bei Sanv Kla (Sümpfe des Elends "..yellow.."25, 30"..white.."). Jammal'an der Prophet "..yellow.."[4]"..white.."\nDurch Abschluss dieser Questreihe erhaltet Ihr eine Belohnung Reine Draenethyst-Edelstein.",
    Prequest = "Der Sanv-Talisman -> Akh Z'ador finden -> Rissmüdigkeit: Körper",
    Folgequest = "Novize im öden Land",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41385 }, --Pure Draenethyst Gemstone Quest Item
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[1] = {
    Title = "Der Tempel von Atal'Hakkar",
    Id = 1445,
    Level = 50,
    Attain = 38,
    Aim = "Sammelt 20 Fetische von Hakkar und bringt sie zu Fel'Zerul in Steinard.",
    Location = "Fel'Zerul (Sümpfe des Elends - Steinard "..yellow.."47,54"..white..")",
    Note = "Alle Gegner im Tempel lassen Fetische fallen.\nDie Questreihe beginnt bei Fel'Zerul (Sümpfe des Elends - Steina "..yellow.."47,54"..white..").",
    Prequest = "Tränenteich -> Rückkehr zu Fel'Zerul",
    Rewards = kQuestInstanceData.TheSunkenTemple.Alliance[1].Rewards
}
kQuestInstanceData.TheSunkenTemple.Horde[2] = {
    Title = "Treibstoff für die Unkrautvernichtung",
    Id = 4146,
    Level = 52,
    Attain = 47,
    Aim = "Bringt Larion in Marschalls Zuflucht den ungeladenen Unkrautvernichter und 5 Proben Dunst der Atal'ai.",
    Location = "Liv Ritzelflick (Barrens "..yellow.."62,38"..white..")",
    Note = "Die Vorquest 'Larion und Muigin' beginnt bei Larion (Krater von Un'Goro "..yellow.."45,8"..white.."). Ihr bekommt den Dunst von Tieflauerer, Düsterewürmer oder Schleimen im Tempel.",
    Prequest = "Larion und Muigin -> Marvons Werkstatt",
}
for i = 3, 16 do
    kQuestInstanceData.TheSunkenTemple.Horde[i] = kQuestInstanceData.TheSunkenTemple.Alliance[i]
end
kQuestInstanceData.TheSunkenTemple.Horde[17] = {
    Title = "Die Macht des Voodoos",
    Id = 8413,
    Level = 52,
    Attain = 50,
    Aim = "Bringt Bath'rah dem Windbehüter die Voodoofedern.",
    Location = "Bath'rah der Windbehüter (Alteracgebirge "..yellow.."80,67"..white..")",
    Note = red.."Nur Schamanen"..white..": Feder droppt von jedem der benannten Trolle auf den Vorsprüngen mit Blick auf den großen Raum mit dem Loch in der Mitte.",
    Prequest = "Geistertotem",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 20369 }, --Azurite Fists Hands, Mail
        { id = 20503 }, --Enamored Water Spirit Trinket
        { id = 20556 }, --Wildstaff Staff
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[18] = {
    Title = "Die Maulogg Krise VII",
    Id = 40270,
    Level = 54,
    Attain = 45,
    Aim = "Wagt Euch in die Tiefen des Tempels von Atal'Hakkar und sammelt den Atal'ai-Stab, bringt ihn zu Insom'ni, um den Zauber zu vollenden.",
    Location = "Insom'ni <Der Große Eremit> (Insel Kazon, nördlich von Gillijims Insel "..yellow.."57.2,10.1"..white..")",
    Note = "Atal'ai-Stab aus der kleinen grünen Holztruhe auf dem Boden hinter Jammal'an der Prophet "..yellow.."[4]"..white.."\nDie Questreihe beginnt bei Haz'gorg der Große Seher (Schlingendorntal - Gillijims Insel (westlich von Beutebucht) - Schlägel'Ogg-Zuflucht, innerhalb der südöstlichen Höhle "..yellow.."78.1,81"..white..").\nIhr erhaltet die Belohnung nach Abschluss der letzten Quest in der Questreihe.",
    Prequest = "Die Maulogg Krise VI",
    Folgequest = "Die Maulogg Krise VIII",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60346 }, --The Ogre Mantle Shoulder, Leather
        { id = 60347 }, --Staff of the Ogre Seer Staff
        { id = 60348 }, --Favor of Cruk'Zogg Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[19] = {
    Title = "In den Traum III",
    Id = 40959,
    Level = 60,
    Attain = 58,
    Aim = "Sammelt ein Bindungsfragment von Klippenbrecher in Azshara, Überladenes arkanes Prisma von Arkanen Torrents im Westflügel von Düsterbruch und einen Splitter des Schlummerers vom Weber im Versunkenen Tempel. Meldet Euch mit den gesammelten Gegenständen bei Itharius in den Sümpfen des Elends.",
    Location = "Ralathius (Hyjal - Nordanaar "..yellow.."85,30"..white..")",
    Note = "Wirker "..yellow.."[6]"..white.." einer von 4 Drachen lässt Splitter des Schlummerers fallen, erscheint nach dem Töten von Jammal'an der Prophet "..yellow.."[4]"..white..". Die Barriere zum Propheten verschwindet nach dem Reinigen von 6 Balkonen "..blue.."[C]"..white.."\nDurch Abschluss dieser Questreihe erhaltet Ihr die Halskette und könnt die Hyjal-Raidinstanz Smaragdsanktum betreten.",
    Prequest = "In den Traum I -> In den Traum II",
    Folgequest = "In den Traum IV",
    Rewards = {
        Text = "Belohnung: ",
        { id = 50545 }, --Gemstone of Ysera Neck
    }
}
kQuestInstanceData.TheSunkenTemple.Horde[20] = {
    Title = "Der Stab des Risswandlers",
    Id = 41323,
    Level = 54,
    Attain = 30,
    Aim = "Kehrt mit Akh Z'adors Risswanderer-Stab und dem Mojo von Jammal'an zu Akh Z'ador in Azshara zurück.",
    Location = "Akh Zador (Azshara "..yellow.."51,37"..white..")",
    Note = "Die Questreihe beginnt bei Sanv Kla (Sümpfe des Elends "..yellow.."25, 30"..white.."). Jammal'an der Prophet "..yellow.."[4]"..white.."\nDurch Abschluss dieser Questreihe erhaltet Ihr eine Belohnung Reine Draenethyst-Edelstein.",
    Prequest = "Der Sanv-Talisman -> Akh Z'ador finden -> Rissmüdigkeit: Körper",
    Folgequest = "Novize im öden Land",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41385 }, --Pure Draenethyst Gemstone Quest Item
    }
}

--------------- Temple of Ahn'Qiraj ---------------
kQuestInstanceData.TheTempleofAhnQiraj = {
    Story = "Im Herzen von Ahn'Qiraj liegt ein alter Tempelkomplex. Erbaut in der Zeit vor der aufgezeichneten Geschichte, ist er sowohl ein Monument für unaussprechliche Götter als auch ein massiver Brutstätte für die Qiraji-Armee. Seit dem Ende des Krieges der Treibsande vor tausend Jahren sind die Zwillingsimperatoren des Qiraji-Reiches in ihrem Tempel gefangen, kaum hinter der magischen Barriere zurückgehalten, die vom Bronzedrachen Anachronos und den Nachtelfen errichtet wurde. Nun, da das Zepter der Treibsande wieder zusammengesetzt und das Siegel gebrochen wurde, ist der Weg in das innere Heiligtum von Ahn'Qiraj offen. Jenseits des kriechenden Wahnsinns der Bienenstöcke, unter dem Tempel von Ahn'Qiraj, bereiten sich Legionen von Qiraji auf die Invasion vor. Sie müssen um jeden Preis gestoppt werden, bevor sie ihre gefräßigen insektoiden Armeen erneut auf Kalimdor entfesseln können und ein zweiter Krieg der Treibsande losbricht!",
    Caption = "Temple of Ahn'Qiraj",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1] = {
    Title = "C'Thuns Vermächtnis",
    Id = 8801,
    Level = 60,
    Attain = 60,
    Aim = "Bringt Caelastrasz im Tempel von Ahn'Qiraj das Auge von C'Thun.",
    Location = "Auge von C'Thun (droppt von C'Thun "..yellow.."[9]"..white..")",
    Note = "Caelestrasz (Tempel von Ahn'Qiraj "..yellow.."2'"..white..")\nDie aufgelisteten Belohnungen sind für die Folgequest.",
    Folgequest = "Der Retter von Kalimdor",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 21712 }, --Amulet of the Fallen God Neck
        { id = 21710 }, --Cloak of the Fallen God Back
        { id = 21709 }, --Ring of the Fallen God Ring
    }
}
kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2] = {
    Title = "Geheimnisse der Qiraji",
    Id = 8784,
    Level = 60,
    Attain = 60,
    Aim = "Bringt das uralte Qirajiartefakt zu den Drachen, die sich nahe des Tempeleingangs versteckt halten.",
    Location = "Uraltes Qirajiartefakt (Zufallsdrop im Tempel von Ahn'Qiraj)",
    Note = "Abgabe bei Andorgos (Tempel von Ahn'Qiraj "..yellow.."1'"..white..").",
}
kQuestInstanceData.TheTempleofAhnQiraj.Horde[1] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[1]
kQuestInstanceData.TheTempleofAhnQiraj.Horde[2] = kQuestInstanceData.TheTempleofAhnQiraj.Alliance[2]

--------------- Zul'Farrak ---------------
kQuestInstanceData.ZulFarrak = {
    Story = "Diese von der Sonne versengte Stadt ist die Heimat der Sandwut-Trolle, bekannt für ihre besondere Rücksichtslosigkeit und dunkle Mystik. Trolllegenden erzählen von einem mächtigen Schwert namens Sul'thraze der Peitscher, einer Waffe, die in der Lage ist, selbst den mächtigsten Gegnern Furcht und Schwäche einzuflößen. Vor langer Zeit wurde die Waffe in zwei Hälften geteilt. Es kursieren jedoch Gerüchte, dass die beiden Hälften irgendwo in den Mauern von Zul'Farrak zu finden sein könnten. Berichte deuten auch darauf hin, dass eine Bande Söldner, die aus Gadgetzan fliehen, in die Stadt gewandert ist und gefangen wurde. Ihr Schicksal bleibt unbekannt. Doch vielleicht am beunruhigendsten sind die gedämpften Flüstern über eine antike Kreatur, die in einem heiligen Teich im Herzen der Stadt schläft - ein mächtiger Halbgott, der unvorstellbare Zerstörung über jeden Abenteurer bringen wird, der töricht genug ist, ihn zu wecken.",
    Caption = "Zul'Farrak",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.ZulFarrak.Alliance[1] = {
    Title = "Nekrums Medaillon",
    Id = 2991,
    Level = 47,
    Attain = 40,
    Aim = "Bringt Thadius Grimmschatten in den Verwüsteten Landen Nekrums Medaillon.",
    Location = "Thadius Grimmschatten (Die Verwüstete Lande - Burg Nethergarde "..yellow.."66,19"..white..")",
    Note = "Die Questreihe beginnt bei Greifenmeister Krallenaxt (Hinterland - Wildhammerbastion "..yellow.."9,44"..white..").\nNekrum erscheint bei "..yellow.."[4]"..white.." mit der letzten Menschenmenge, gegen die Ihr beim Tempelevent kämpft.",
    Prequest = "Käfige der Bleichborken -> Thadius Grimmschatten",
    Folgequest = "Die Weissagung",
}
kQuestInstanceData.ZulFarrak.Alliance[2] = {
    Title = "Trollaushärter",
    Id = 3042,
    Level = 45,
    Attain = 40,
    Aim = "Bringt 20 Phiolen Trollaushärter zu Trenton Lichthammer in Gadgetzan.",
    Location = "Trenton Lichthammer (Tanaris - Gadgetzan "..yellow.."51,28"..white..")",
    Note = "Jeder Troll kann die Härtemittel fallen lassen.",
}
kQuestInstanceData.ZulFarrak.Alliance[3] = {
    Title = "Skarabäuspanzerschalen",
    Id = 2865,
    Level = 45,
    Attain = 40,
    Aim = "Bringt Tran'rek in Gadgetzan 5 unbeschädigte Skarabäuspanzerschalen.",
    Location = "Tran'rek (Tanaris - Gadgetzan "..yellow.."51,26"..white..")",
    Note = "Die Vorquest beginnt bei Krazek (Schlingendorntal - Beutebucht "..yellow.."25,77"..white..").\nJeder Skarabäus kann die Muscheln fallen lassen. Viele Skarabäen sind bei "..yellow.."[2]"..white..".",
    Prequest = "Tran'rek",
}
kQuestInstanceData.ZulFarrak.Alliance[4] = {
    Title = "Tiara der Tiefen",
    Id = 2846,
    Level = 46,
    Attain = 40,
    Aim = "Bringt die Tiara der Tiefen zu Tabetha in den Düstermarschen.",
    Location = "Tabetha (Düstermarschen "..yellow.."46,57"..white..")",
    Note = "Hydromantin Velratha lässt die Tiara der Tiefen bei "..yellow.."[6]"..white.." fallen.",
    Prequest = "Tabethas Aufgabe",
    Rewards = {
        Text = "Rewards:",
        { id = 9527 }, --Spellshifter Rod Staff
        { id = 9531 }, --Gemshale Pauldrons Shoulder, Plate
    }
}
kQuestInstanceData.ZulFarrak.Alliance[5] = {
    Title = "Die Prophezeiung von Mosh'aru",
    Id = 3527,
    Level = 47,
    Attain = 40,
    Aim = "Bringt die erste und die zweite Schrifttafel von Mosh'aru zu Yeh'kinya nach Tanaris.",
    Location = "Yeh'kinya (Tanaris - Dampfdruckpier "..yellow.."66,22"..white..")",
    Note = "Ihr bekommt die Vorquest vom selben NPC.\nDie Tafeln droppen von Theka der Märtyrer bei "..yellow.."[2]"..white.." und Hydromantin Velratha bei "..yellow.."[6]"..white..".",
    Prequest = "Kreischergeister",
    Folgequest = "Das uralte Ei",
}
kQuestInstanceData.ZulFarrak.Alliance[6] = {
    Title = "Wünschel-mato-Rute",
    Id = 2768,
    Level = 47,
    Attain = 40,
    Aim = "Bringt die Wünschel-mato-Rute nach Gadgetzan zu Chefingenieur Bilgenritzel.",
    Location = "Chefingenieur Bilgenritzel (Tanaris - Gadgetzan "..yellow.."52,28"..white..")",
    Note = "Ihr bekommt den Stab von Unteroffizier Bly. Ihr findet ihn bei "..yellow.."[4]"..white.." nach dem Tempelevent.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9533 }, --Masons Fraternity Ring Ring
        { id = 9534 }, --Engineer's Guild Headpiece Head, Leather
    }
}
kQuestInstanceData.ZulFarrak.Alliance[7] = {
    Title = "Gahz'rilla",
    Id = 2770,
    Level = 50,
    Attain = 40,
    Aim = "Bringt Wizzel Kupferbolz in der Schimmernden Ebene Gahz'rillas energiegeladene Schuppe.",
    Location = "Wizzel Kupferbolz (Thousands Needles - Illusionenrennbahn "..yellow.."78,77"..white..")",
    Note = "Die Vorquest bekommt Ihr von Klockmort Spannersplint (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."23.6,28"..white.."). Es ist nicht notwendig, die Vorquest zu haben, um die Gahz'rilla-Quest zu bekommen.\nIhr beschwört Gahz'rilla bei "..yellow.."[6]"..white.." mit dem Schlaghammer von Zul'Farrak.\nDer Hochheilige Schlaghammer kommt von Qiaga die Bewahrerin (Hinterland - Der Altar von Zul "..yellow.."49,70"..white..") und muss am Altar in Jinta'Alor bei "..yellow.."59,77"..white.." vervollständigt werden, bevor er in Zul'Farrak verwendet werden kann.",
    Prequest = "Die Brüder Kupferbolz",
    Rewards = {
        Text = "Belohnung: ",
        { id = 11122 }, --Carrot on a Stick Trinket
    }
}
kQuestInstanceData.ZulFarrak.Alliance[8] = {
    Title = "Treibend über den Sand",
    Id = 40519,
    Level = 46,
    Attain = 40,
    Aim = "Wagt Euch nach Zul'Farrak und findet die Alten Trollüberreste, dann bringt sie zu Hansu Go'sha bei den Südmondruinen in Tanaris zurück.",
    Location = "Hansu Go'sha (Tanaris "..yellow.."42,73"..white..")",
    Note = "Im Raum mit Hexendoktor Zum'Rah "..yellow.."[3]"..white.." Alter Grabkasten (kleine grüne Holzkiste).",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60759 }, --Southmoon Pendant Neck
    }
}
kQuestInstanceData.ZulFarrak.Alliance[9] = {
    Title = "The Farraki Ancient", --TODO check database for correct translate
    Id = 41811,
    Level = 46,
    Attain = 40,
    Aim = "Venture in Zul'Farrak, and slay Zel'jeb der Uralte, then return to Zalsu the Wanderer, who can be found south of Zul'Farrak.",
    Location = "Zalsu the Wanderer (Tanaris "..yellow.."39,34"..white..")",
    Note = "Zel'jeb der Uralte "..yellow.."[8]"..white..". Du benötigst 'Flamme von Farrak' "..yellow.."[6]"..white.." um ihn zu töten.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 41916 }, --Dune Wanderer's Hauberk
        { id = 41917 }, --Desert Seeker's Pants
    }
}
kQuestInstanceData.ZulFarrak.Horde[1] = {
    Title = "Der Spinnengott",
    Id = 2936,
    Level = 45,
    Attain = 40,
    Aim = "Lest von der Schrifttafel des Theka, um den Namen des Spinnengottes der Bleichborken zu erfahren, und kehrt dann zu Meister Gadrin zurück.",
    Location = "Meister Gadrin (Durotar - Sen'jin "..yellow.."55,74"..white..")",
    Note = "Die Questreihe beginnt bei einer Giftflasche, die auf Tischen in Trolldörfern im Hinterland gefunden wird.\nIhr findet die Tafel bei "..yellow.."[2]"..white..".",
    Prequest = "Giftflaschen -> Konsultiert Meister Gadrin",
    Folgequest = "Die Beschwörung von Shadra",
}
for i = 2, 9 do
    kQuestInstanceData.ZulFarrak.Horde[i] = kQuestInstanceData.ZulFarrak.Alliance[i]
end
kQuestInstanceData.ZulFarrak.Horde[10] = {
    Title = "Beendet Ukorz Sandkrall",
    Id = 40527,
    Level = 48,
    Attain = 40,
    Aim = "Tötet Ukorz Sandscalp und Ruuzlu in Zul'Farrak für Champion Taza'go im Sandmonddorf in Tanaris.",
    Location = "Champion Taza'go (Tanaris - Sandmond; nordöstliche Ecke von Tanaris, nordwestlich vom Dampfdruckpier)",
    Note = "Die Questreihe beginnt mit der Quest 'Sandwut Erlösung I' bei Seher Maz'ek in Sandmond (Tanaris) "..yellow.."59.1,17.1"..white..".",
    Prequest = "Die Not der Sandohr",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Title = "Die Schädelsammlung",
    Id = 8201,
    Level = 60,
    Attain = 58,
    Aim = "Reiht die Köpfe der 5 Kanalisierer auf der heiligen Kordel aneinander. Bringt dann die Trollschädelsammlung zu Exzhal auf der Insel Yojamba.",
    Location = "Exzhal (Schlingendorntal - Die Insel Yojamba "..yellow.."15,15"..white..")",
    Note = "Stellt sicher, dass Ihr alle Priester plündert.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 20213 }, --Belt of Shrunken Heads Waist, Plate
        { id = 20215 }, --Belt of Shriveled Heads Waist, Mail
        { id = 20216 }, --Belt of Preserved Heads Waist, Leather
        { id = 20217 }, --Belt of Tiny Heads Waist, Cloth
    }
}
kQuestInstanceData.ZulGurub.Alliance[2] = {
    Title = "Das Herz von Hakkar",
    Id = 8183,
    Level = 60,
    Attain = 58,
    Aim = "Bringt das Herz von Hakkar zu Molthor auf die Insel Yojamba.",
    Location = "Herz von Hakkar (droppt von Hakkar "..yellow.."[11]"..white..")",
    Note = "Molthor (Schlingendorntal - Die Insel Yojamba "..yellow.."15,15"..white..")",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 19948 }, --Zandalarian Hero Badge Trinket
        { id = 19950 }, --Zandalarian Hero Charm Trinket
        { id = 19949 }, --Zandalarian Hero Medallion Trinket
    }
}
kQuestInstanceData.ZulGurub.Alliance[3] = {
    Title = "Nats Maßband",
    Id = 8227,
    Level = 60,
    Attain = 58,
    Aim = "Bringt Nats Maßband zu Nat Pagle in den Düstermarschen zurück.",
    Location = "Ramponierte Ausrüstungsbox (Zul'Gurub - Nordosten am Wasser von Hakkars Insel)",
    Note = "Nat Pagle ist in Düstermarschen ("..yellow.."59,60"..white.."). Durch Abgabe der Quest könnt Ihr Modderschlickköder von Nat Pagle kaufen, um Gahz'ranka in Zul'Gurub zu beschwören.",
}
kQuestInstanceData.ZulGurub.Alliance[4] = {
    Title = "Das perfekte Gift",
    Id = 9023,
    Level = 60,
    Attain = 60,
    Aim = "Dirk Donnerholz in der Burg Cenarius will, dass Ihr ihm Venoxis' Giftbeutel und Kurinnaxx' Giftbeutel bringt.",
    Location = "Langdolch Donnerholz (Silithus - Burg Cenarius "..yellow.."52,39"..white..")",
    Note = "Venoxis' Giftbeutel droppt von Hohepriester Venoxis in "..yellow.."Zul'Gurub"..white.." bei "..yellow.."[2]"..white..". Kurinnaxx' Giftbeutel droppt in den "..yellow.."Ruinen von Ahn'Qiraj"..white.." bei "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Story = "In Dun Morogh gelegen, ist das technologische Wunder Gnomeregan seit Generationen die Hauptstadt der Gnome. Kürzlich infizierte eine feindliche Rasse mutierter Troggs mehrere Regionen von Dun Morogh - einschließlich der großen Gnomenstadt. In einem verzweifelten Versuch, die eindringenden Troggs zu vernichten, befahl Oberingenieur Mekkatorque das Notablassen der radioaktiven Abfalltanks der Stadt. Mehrere Gnome suchten Schutz vor den luftgetragenen Schadstoffen, während sie darauf warteten, dass die Troggs sterben oder fliehen. Unglücklicherweise wurde die Belagerung der Troggs trotz radioaktiver Verseuchung durch den toxischen Angriff ungebremst fortgesetzt. Jene Gnome, die nicht durch giftiges Austreten getötet wurden, waren gezwungen zu fliehen und suchten Zuflucht in der nahen Zwergenstadt Eisenschmiede. Dort machte sich Oberingenieur Mekkatorque daran, mutige Seelen anzuwerben, um seinem Volk zu helfen, ihre geliebte Stadt zurückzuerobern. Es wird gemunkelt, dass Mekkatorques einst vertrauenswürdiger Berater, Mekgenieur Thermadraht, sein Volk verraten hat, indem er die Invasion zuließ. Nun, sein Verstand zerrüttet, bleibt Thermadraht in Gnomeregan - verfolgt seine dunklen Pläne und fungiert als neuer Techno-Oberherr der Stadt.",
    Caption = "Gnomeregan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Gnomeregan.Alliance[1] = {
    Title = "Rettet Techbots Hirn!",
    Id = 2922,
    Level = 26,
    Attain = 20,
    Aim = "Bringt Techbots Speicherkern zu Tüftlermeister Oberfunks nach Eisenschmiede.",
    Location = "Tüftlermeister Oberfunks (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."24.4,29.8"..white..")",
    Note = "Die Vorquest bekommt Ihr von Bruder Sarno (Sturmwind - Kathedralenplatz "..yellow.."40,30"..white..").\nIhr findet Techbot bevor Ihr die Instanz betretet, nahe der Hintertür, bei "..yellow.."[4] auf der Eingangskarte"..white..".",
    Prequest = "Tüftlermeister Oberfunks",
}
kQuestInstanceData.Gnomeregan.Alliance[2] = {
    Title = "Gnogaine",
    Id = 2926,
    Level = 27,
    Attain = 20,
    Aim = "Sammelt mit der leeren bleiernen Sammelphiole radioaktive Ablagerungen bestrahlter Eindringlinge oder Plünderer. Sobald sie voll ist, bringt Ihr sie zu Ozzie Wechselvolt nach Kharanos zurück.",
    Location = "Ozzie Wechselvolt (Dun Morogh - Kharanos "..yellow.."45,49"..white..")",
    Note = "Die Vorquest bekommt Ihr von Gnoarn (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."24.5,30.4"..white..").\nUm Fallout zu bekommen, müsst Ihr die Phiole an "..red.."lebenden"..white.." Verstrahlten Eindringlingen oder Verstrahlten Plünderern benutzen.",
    Prequest = "Der Tag danach",
    Folgequest = "Das einzige Heilmittel ist mehr grünes Leuchten",
}
kQuestInstanceData.Gnomeregan.Alliance[3] = {
    Title = "Das einzige Heilmittel ist mehr grünes Leuchten",
    Id = 2962,
    Level = 30,
    Attain = 20,
    Aim = "Reist nach Gnomeregan und bringt etwas von der hoch konzentrierten radioaktiven Ablagerung zurück. Seid gewarnt, die Ablagerung ist instabil und wird ziemlich schnell zerfallen.$B$BOzzie wird außerdem Eure schwere bleierne Phiole benötigen, nachdem die Aufgabe erledigt ist.",
    Location = "Ozzie Wechselvolt (Dun Morogh - Kharanos "..yellow.."45,49"..white..")",
    Note = "Um Fallout zu bekommen, müsst Ihr die Phiole an "..red.."lebenden"..white.." Verstrahlten Schleimen oder Schrecken benutzen.",
    Prequest = "Gnogaine",
}
kQuestInstanceData.Gnomeregan.Alliance[4] = {
    Title = "Gyrobohrmatische Exkavation",
    Id = 2928,
    Level = 30,
    Attain = 20,
    Aim = "Bringt 24 robomechanische Innereien zu Shoni nach Sturmwind.",
    Location = "Shoni the Silent (Sturmwind - Zwergenviertel "..yellow.."55,12"..white..")",
    Note = "Alle Roboter können die Robomechanischen Gedärme fallen lassen.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9608 }, --Shoni's Disarming Tool Off Hand, Axe
        { id = 9609 }, --Shilly Mitts Hands, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[5] = {
    Title = "Grundlegende Artifixe",
    Id = 2924,
    Level = 30,
    Attain = 24,
    Aim = "Bringt Klockmort Spannsplint in Eisenschmiede 12 grundlegende Artifixe.",
    Location = "Klockmort Spannersplint (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."23.6,28"..white..")",
    Note = "Die Vorquest bekommt Ihr von Mathiel (Darnassus - Die Terrasse der Krieger "..yellow.."59,45"..white.."). Die Vorquest ist nur eine Wegweiserquest und nicht erforderlich, um diese Quest zu bekommen.\nDie Grundlegenden Artifixe kommen von Maschinen, die in der Instanz verstreut sind.",
    Prequest = "Klockmorts Grundlagen",
}
kQuestInstanceData.Gnomeregan.Alliance[6] = {
    Title = "Datenrettung",
    Id = 2930,
    Level = 30,
    Attain = 25,
    Aim = "Bringt Mechanikermeister Gussmuff in Eisenschmiede eine Prismalochkarte.",
    Location = "Mechanikermeister Gussmuff (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."24.1,29.8"..white..")",
    Note = "Die Vorquest bekommt Ihr von Gaxim Rostknirsch (Steinkrallengebirge "..yellow.."59,67"..white.."). Die Vorquest ist nur eine Wegweiserquest und nicht erforderlich, um diese Quest zu bekommen.\nDie weiße Karte ist ein Zufallsdrop. Ihr findet das erste Terminal neben dem Hintereingang, bevor Ihr die Instanz betretet, bei "..yellow.."[3] auf der Eingangskarte"..white..". Die 3005-B ist bei "..yellow.."[3]"..white..", die 3005-C bei "..yellow.."[5]"..white.." und die 3005-D ist bei "..yellow.."[6]"..white..".",
    Prequest = "Gussmuffs Auftrag",
    Rewards = {
        Text = "Rewards:",
        { id = 9605 }, --Repairman's Cape Back
        { id = 9604 }, --Mechanic's Pipehammer Two-Hand, Mace
    }
}
kQuestInstanceData.Gnomeregan.Alliance[7] = {
    Title = "Eine schöne Bescherung",
    Id = 2904,
    Level = 30,
    Attain = 24,
    Aim = "Begleitet Kernobee zur Uhrwerkgasse und meldet Euch dann wieder bei Scooty in Beutebucht.",
    Location = "Kernobee (Gnomeregan "..yellow.."[3]"..white..")",
    Note = "Eskortquest! Ihr findet Scooty in Schlingendorntal - Beutebucht ("..yellow.."27,77"..white..").",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Alliance[8] = {
    Title = "Der große Verrat",
    Id = 2929,
    Level = 35,
    Attain = 25,
    Aim = "Reist nach Gnomeregan und tötet Robogenieur Thermadraht. Kehrt zu Hochtüftler Mekkadrill zurück, wenn der Auftrag ausgeführt ist.",
    Location = "Hochtüftler Mekkadrill (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."24.2,29.7"..white..")",
    Note = "Ihr findet Thermadraht bei "..yellow.."[8]"..white..". Er ist der letzte Boss in Gnomeregan.\nWährend des Kampfes müsst Ihr die Säulen durch Drücken des Knopfes an der Seite deaktivieren.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Alliance[9] = {
    Title = "Schmutzverkrusteter Ring",
    Id = 2945,
    Level = 34,
    Attain = 28,
    Aim = "Findet einen Weg, den schmutzverkrusteten Ring zu säubern.",
    Location = "Schmutzverkrusteter Ring (Zufallsdrop aus Gnomeregan)",
    Note = "Der Ring kann am Sparklematic 5200 im Reinraum bei "..yellow.."[2]"..white.." gereinigt werden.",
    Folgequest = "Die Rückkehr des Rings",
}
kQuestInstanceData.Gnomeregan.Alliance[10] = {
    Title = "Die Rückkehr des Rings",
    Id = 2947,
    Level = 34,
    Attain = 28,
    Aim = "Ihr könnt den Ring entweder behalten oder die Person finden, die für die Prägung und Gravuren auf der Innenseite des Rings verantwortlich ist.",
    Location = "Blitzender Goldring (erhalten von der Quest Schmutzverkrusteter Ring)",
    Note = "Abgabe bei Talvash del Kissel (Eisenschmiede - Mystisches Viertel "..yellow.."36,3"..white.."). Die Folgequest zur Verbesserung des Rings ist optional.",
    Prequest = "Schmutzverkrusteter Ring",
    Folgequest = "Gnomenverbesserungen",
    Rewards = {
        Text = "Belohnung: ",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Alliance[11] = {
    Title = "Ein pulsierendes Gehirn",
    Id = 80398,
    Level = 30,
    Attain = 30,
    Aim = "Findet jemanden, der herausfinden kann, was mit dem Zentralrechner zu tun ist.",
    Location = "Intact Pounder Mainframe",
    Note = "Intaktes Stampfer-Hauptsystem, das die Quest startet, kann von Meuteverprügler 9-60 "..yellow.."[6]"..white.." droppen (geringe Chance).\n"..red.."Verfügbar für INGENIEURE mit 125+ Fertigkeit.",
    Folgequest = "Einen Stampfer bauen",
}
kQuestInstanceData.Gnomeregan.Alliance[12] = {
    Title = "Hochenergieregler",
    Id = 40861,
    Level = 33,
    Attain = 25,
    Aim = "Findet das Bauplan: Hochenergieregler in Gnomeregan und bringt es zu Weezan Littlegear bei der Gnomeregan Wiedergewinnungsanlage in Dun Morogh.",
    Location = "Weezan Kleingetriebe (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."[25.2,31.6]"..white..")",
    Note = "Bauplan: Hochenergieregler befindet sich auf dem Tisch bei "..yellow.."[3]"..white.." südöstliche Ecke untere südliche Kammer "..yellow.."[a]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61393 }, --Low Energy Regulator Trinket
    }
}
kQuestInstanceData.Gnomeregan.Alliance[13] = {
    Title = "Aktivierung des Ersatzsystems",
    Id = 40856,
    Level = 33,
    Attain = 25,
    Aim = "Aktiviert das Alphakanal-Ventil und den Reservepumpenkanalhhebel tief in Gnomeregan für Meistertechniker Seilwinder in Dun Morogh.",
    Location = "Meistertechniker Drahtspanner (Dun Morogh - Gnomeregan Wiedergewinnungsanlage "..yellow.."[26.8,31.1]"..white..")",
    Note = "Alphakanal-Ventil ist bei "..yellow.."[6]"..white..", benutzt den Aufzug, um nach unten zu fahren, Südseite des zentralen Mechanismus.\nReservepumpenkanalhebel ist bei "..yellow.."[b]"..white.." auf dem Boden.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61383 }, --Intricate Gnomish Blunderbuss Gun
        { id = 61384 }, --Ionized Metal Grips Hands, Mail
        { id = 61385 }, --Magnetic Band Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[1] = {
    Title = "Gnomer-weeeeg!",
    Id = 2843,
    Level = 35,
    Attain = 20,
    Aim = "Wartet, bis Scooty den Goblintransponder kalibriert hat.",
    Location = "Scooty (Schlingendorntal - Beutebucht "..yellow.."27,77"..white..")",
    Note = "Die Vorquest bekommt Ihr von Sovik (Orgrimmar - Tal der Ehre "..yellow.."75,25"..white..").\nWenn Ihr diese Quest abschließt, könnt Ihr den Transponder in Beutebucht benutzen.",
    Prequest = "Chefingenieur Scooty",
}
kQuestInstanceData.Gnomeregan.Horde[2] = {
    Title = "Eine schöne Bescherung",
    Id = 2904,
    Level = 30,
    Attain = 24,
    Aim = "Begleitet Kernobee zur Uhrwerkgasse und meldet Euch dann wieder bei Scooty in Beutebucht.",
    Location = "Kernobee (Gnomeregan "..yellow.."[3]"..white..")",
    Note = "Eskortquest! Ihr findet Scooty in Schlingendorntal - Beutebucht ("..yellow.."27,77"..white..").",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9535 }, --Fire-welded Bracers Wrist, Mail
        { id = 9536 }, --Fairywing Mantle Shoulder, Cloth
    }
}
kQuestInstanceData.Gnomeregan.Horde[3] = {
    Title = "Maschinenkriege",
    Id = 2841,
    Level = 35,
    Attain = 25,
    Aim = "Besorgt die Maschinenblaupausen und Thermadrahts Safekombination aus Gnomeregan und bringt sie zu Nogg nach Orgrimmar.",
    Location = "Nogg (Orgrimmar - Tal der Ehre "..yellow.."75,25"..white..")",
    Note = "Ihr findet Thermadraht bei "..yellow.."[8]"..white..". Er ist der letzte Boss in Gnomeregan.\nWährend des Kampfes müsst Ihr die Säulen durch Drücken des Knopfes an der Seite deaktivieren.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 9623 }, --Civinad Robes Chest, Cloth
        { id = 9624 }, --Triprunner Dungarees Legs, Leather
        { id = 9625 }, --Dual Reinforced Leggings Legs, Mail
    }
}
kQuestInstanceData.Gnomeregan.Horde[4] = {
    Title = "Schmutzverkrusteter Ring",
    Id = 2945,
    Level = 34,
    Attain = 28,
    Aim = "Findet einen Weg, den schmutzverkrusteten Ring zu säubern.",
    Location = "Schmutzverkrusteter Ring (Zufallsdrop aus Gnomeregan)",
    Note = "Der Ring kann am Sparklematic 5200 im Reinraum bei "..yellow.."[2]"..white.." gereinigt werden.",
    Folgequest = "Die Rückkehr des Rings",
}
kQuestInstanceData.Gnomeregan.Horde[5] = {
    Title = "Die Rückkehr des Rings",
    Id = 2947,
    Level = 34,
    Attain = 28,
    Aim = "Ihr könnt den Ring entweder behalten oder die Person finden, die für die Prägung und Gravuren auf der Innenseite des Rings verantwortlich ist.",
    Location = "Blitzender Goldring (erhalten von der Quest Schmutzverkrusteter Ring)",
    Note = "Abgabe bei Nogg (Orgrimmar - Das Tal der Ehre "..yellow.."75,25"..white.."). Die Folgequest zur Verbesserung des Rings ist optional.",
    Prequest = "Schmutzverkrusteter Ring",
    Folgequest = "Noggs Ringerneuerung",
    Rewards = {
        Text = "Belohnung: ",
        { id = 9362 }, --Brilliant Gold Ring Ring
    }
}
kQuestInstanceData.Gnomeregan.Horde[6] = {
    Title = "Ein pulsierendes Gehirn",
    Id = 80398,
    Level = 30,
    Attain = 30,
    Aim = "Findet jemanden, der herausfinden kann, was mit dem Zentralrechner zu tun ist.",
    Location = "Intact Pounder Mainframe",
    Note = "Intaktes Stampfer-Hauptsystem, das die Quest startet, kann von Meuteverprügler 9-60 "..yellow.."[6]"..white.." droppen (geringe Chance).\n"..red.."Verfügbar für INGENIEURE mit 125+ Fertigkeit.",
    Folgequest = "Einen Stampfer bauen",
}
kQuestInstanceData.Gnomeregan.Horde[7] = {
    Title = "Ersatzkondensator",
    Id = 55006,
    Level = 34,
    Attain = 29,
    Aim = "Bringt den Megaflusskondensator zu Techniker Grimzlow.",
    Location = "Techniker Grimzlow (Durotar - Funkelwasserhafen "..yellow.."57.4,25.7"..white..").",
    Note = "Vorquest 'Eine neue Energiequelle' beginnt bei Techniker Spuzzle (Durotar - Funkelwasserhafen "..yellow.."57.4,25.8"..white..") ab Stufe 7.\nMegaflusskondensator droppt von Robogenieur Thermadraht. Ihr findet Robogenieur Thermadraht bei "..yellow.."[8]"..white..". Er ist der letzte Boss in Gnomeregan.\nWährend des Kampfes müsst Ihr die Säulen durch Drücken des Knopfes an der Seite deaktivieren.",
    Prequest = "Eine neue Energiequelle",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Title = "Eingehüllt in Alpträume",
    Id = 8446,
    Level = 60,
    Attain = 60,
    Aim = "Sucht nach jemandem, der die Bedeutung des in Alpträume gehüllten Gegenstands entschlüsseln kann.$B$BVielleicht kann Euch ein Druide von großer Macht weiterhelfen.",
    Location = "In Alpträume gehüllter Gegenstand (droppt von Smariss, Taerar, Lethon oder Ysondre)",
    Note = "Quest wird bei Bewahrer Remulos abgegeben (Mond lichtung - Der Schrein von Remulos "..yellow.."36,41"..white.."). Die aufgelistete Belohnung ist für die Folgequest.",
    Folgequest = "Legenden erwachen",
    Rewards = {
        Text = "Belohnung: ",
        { id = 20600 }, --Malfurion's Signet Ring Ring
    }
}
kQuestInstanceData.FourDragons.Horde[1] = kQuestInstanceData.FourDragons.Alliance[1]

--------------- Azuregos ---------------
kQuestInstanceData.Azuregos = {
    Story = "Vor der Großen Zerreißung blühte die Nachtelfenstadt Eldarath in dem Land, das heute als Azshara bekannt ist. Es wird geglaubt, dass viele alte und mächtige Hochgeborenen-Artefakte unter den Ruinen der einst mächtigen Festung gefunden werden können. Über unzählige Generationen hat der Blaue Drachenschwarm mächtige Artefakte und magisches Wissen bewacht und sichergestellt, dass sie nicht in sterbliche Hände fallen. Die Anwesenheit von Azuregos, dem blauen Drachen, scheint darauf hinzudeuten, dass Gegenstände von extremer Bedeutung, vielleicht die sagenumwobenen Phiolen der Ewigkeit selbst, in der Wildnis von Azshara gefunden werden könnten. Was auch immer Azuregos sucht, eines ist sicher: Er wird bis zum Tod kämpfen, um Azsharas magische Schätze zu verteidigen.",
    Caption = "Azuregos",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.Azuregos.Alliance[1] = {
    Title = "Uraltes in Sehnen eingewickeltes Laminablatt",
    Id = 7634,
    Level = 60,
    Attain = 60,
    Aim = "Hastat der Uralte hat Euch um die Beschaffung einer Sehne eines ausgewachsenen, blauen Drachen gebeten. Kehrt zu Hastat im Teufelswald zurück, solltet Ihr diese Sehne finden.",
    Location = "Hastat der Uralte (Teufelswald - Der Eisenwald "..yellow.."48,24"..white..")",
    Note = red.."Nur Jäger"..white..": Tötet Azuregos, um die Sehne eines ausgewachsenen blauen Drachen zu bekommen. Er läuft in der Mitte der südlichen Halbinsel in Azshara nahe "..yellow.."[1]"..white.." herum.",
    Prequest = "Das uralte Blatt ("..yellow.."Molten Core"..white..")", -- 7632",
    Rewards = {
        Text = "Belohnung: ",
        { id = 18714 }, --Ancient Sinew Wrapped Lamina Quiver
    }
}
kQuestInstanceData.Azuregos.Alliance[2] = {
    Title = "Azuregos' magisches Buch",
    Id = 8575,
    Level = 60,
    Attain = 60,
    Aim = "Bringt Azuregos' magisches Buch zu Narain Pfauentraum in Tanaris.",
    Location = "Geist von Azuregos (Azshara "..yellow.."56,83"..white..")",
    Note = "Ihr findet Narain Pfauentraum in Tanaris bei "..yellow.."65,17"..white..".",
    Prequest = "Der Bund der Drachenschwärme",
    Folgequest = "Übersetzung des Buchs",
}
kQuestInstanceData.Azuregos.Horde[1] = kQuestInstanceData.Azuregos.Alliance[1]
kQuestInstanceData.Azuregos.Horde[2] = kQuestInstanceData.Azuregos.Alliance[2]

--------------- Lord Kazzak ---------------
kQuestInstanceData.LordKazzak = {
    Story = "Nach der Niederlage der Brennenden Legion am Ende des Dritten Krieges zogen sich die verbleibenden feindlichen Streitkräfte, angeführt vom kolossalen Dämonenlord Kazzak, in die Verwüsteten Lande zurück. Sie verweilen bis heute dort in einem Gebiet namens Die Verseuchte Narbe und warten auf die Wiedereröffnung des Dunklen Portals. Es wird gemunkelt, dass Kazzak, sobald das Portal wieder geöffnet wird, mit seinen verbleibenden Streitkräften nach Outland reisen wird. Einst die Ork-Heimatwelt Draenor, wurde Outland durch die gleichzeitige Aktivierung mehrerer Portale, die vom Ork-Schamanen Ner'zhul erschaffen wurden, zerrissen und existiert nun als zerbrochene Welt, besetzt von Legionen dämonischer Agenten unter dem Kommando des Nachtelfen-Verräters Illidan.",
    Caption = "Lord Kazzak",
    Alliance = {},
    Horde = {}
}

--------------- Alterac Valley ---------------
kQuestInstanceData.BGAlteracValleyNorth = {
    Story = "Vor langer Zeit, vor dem Ersten Krieg, verbannte der Hexenmeister Gul'dan einen Orkklan namens Frostwölfe in ein verstecktes Tal tief im Herzen des Alteracgebirges. Hier in den südlichen Ausläufern des Tals schufteten die Frostwölfe bis zur Ankunft von Thrall.\nNach Thralls triumphaler Vereinigung der Klans entschieden sich die Frostwölfe, nun angeführt vom Ork-Schamanen Drek'Thar, im Tal zu bleiben, das sie so lange ihr Zuhause nannten. In jüngster Zeit wurde jedoch der relative Frieden der Frostwölfe durch die Ankunft der Zwergischen Sturmlanzen-Expedition herausgefordert.\nDie Sturmlanzen haben sich im Tal niedergelassen, um nach natürlichen Ressourcen und alten Relikten zu suchen. Trotz ihrer Absichten hat die Anwesenheit der Zwerge hitzige Konflikte mit den Frostwolf-Orks im Süden ausgelöst, die geschworen haben, die Eindringlinge aus ihren Ländern zu vertreiben.",
    Caption = "Alteractal",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[1] = {
    Title = "Die hoheitliche Anordnung",
    Id = 7261,
    Level = 60,
    Attain = 51,
    Aim = "Reist ins Alteractal im Vorgebirge des Hügellands. Wenn Ihr dort angekommen seid, meldet Euch umgehend bei Leutnant Haggerdin.$B$BFür den Ruhm von Bronzebart!",
    Location = "Leutnant Rotimer (Eisenschmiede - Das gemeine Volk "..yellow.."30,62"..white..")",
    Note = "Leutnant Haggerdin ist bei (Alteracgebirge "..yellow.."39,81"..white..").",
    Folgequest = "Flaggenjagd",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[2] = {
    Title = "Flaggenjagd",
    Id = 7162,
    Level = 60,
    Attain = 51,
    Aim = "Begebt Euch in die Höhle der Wildpfoten südöstlich vom Hauptstützpunkt und findet das Banner der Frostwölfe. Bringt anschließend Kriegsmeister Laggrond das Banner.",
    Location = "Leutnant Haggerdin (Alteracgebirge "..yellow.."39,81"..white..")",
    Note = "Das Banner der Sturmlanzen befindet sich in der Eisschwingenhöhle bei "..yellow.."[11]"..white.." auf der Alterac tal - Nord-Karte. Sprecht jedes Mal, wenn Ihr eine neue Rufebene erreicht, mit demselben NPC für ein verbessertes Abzeichen.\n\nDie Vorquest ist nicht notwendig, um diese Quest zu erhalten, aber sie bringt etwa 9550 Erfahrung.",
    Prequest = "Die hoheitliche Anordnung",
    Folgequest = "Aufstieg und Anerkennung -> Das Auge der Führung",
    Rewards = {
        Text = "Rewards:",
        { id = 17691 }, --Stormpike Insignia Rank 1 Trinket
        { id = 19484 }, --The Frostwolf Artichoke Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[3] = {
    Title = "Die Schlacht um Alterac",
    Id = 7141,
    Level = 60,
    Attain = 51,
    Aim = "Betretet das Alteractal, bezwingt den Hordegeneral Drek'thar und kehrt dann zu Ausgrabungsleiter Steinhauer im Alteracgebirge zurück.",
    Location = "Ausgrabungsleiter Steinhauer (Alteracgebirge "..yellow.."41,80"..white..") und\n(Alteractal - North "..yellow.."[B]"..white..")",
    Note = "Drek'thar ist bei (Alteractal - Süd "..yellow.."[B]"..white.."). Er muss nicht wirklich getötet werden, um die Quest abzuschließen. Das Schlachtfeld muss nur von Eurer Seite auf irgendeine Weise gewonnen werden.\nNachdem Ihr diese Quest abgegeben habt, sprecht erneut mit dem NPC für die Belohnung.",
    Folgequest = "Held der Sturmlanzen",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 19107 }, --Bloodseeker Crossbow
        { id = 19106 }, --Ice Barbed Spear Polearm
        { id = 19108 }, --Wand of Biting Cold Wand
        { id = 20648 }, --Cold Forged Hammer Main Hand, Mace
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[4] = {
    Title = "Der Rüstmeister",
    Id = 7121,
    Level = 60,
    Attain = 51,
    Aim = "Sprecht mit dem Rüstmeister der Sturmlanzen.",
    Location = "Gebirgsjäger Donnerbrüll (Alteractal – Norden "..yellow.."Nahe [3] vor der Brücke"..white..")",
    Note = "Der Rüstmeister der Sturmlanzen ist bei (Alteractal - Nord "..yellow.."[7]"..white..") und bietet weitere Quests.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[5] = {
    Title = "Vorräte der Eisbeißermine",
    Id = 6982,
    Level = 60,
    Attain = 51,
    Aim = "Bringt 10 Vorräte der Eisbeißermine zum Rüstmeister der Horde in die Burg Frostwolf.",
    Location = "Rüstmeister der Sturmlanzen (Alteractal - North "..yellow.."[7]"..white..")",
    Note = "Die Vorräte befinden sich in der Eisbeißermine bei (Alteractal - Süd "..yellow.."[6]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[6] = {
    Title = "Vorräte der Eisenschachtmine",
    Id = 5892,
    Level = 60,
    Attain = 51,
    Aim = "Bringt 10 Vorräte der Eisenschachtmine zum Rüstmeister der Allianz in Dun Baldar.",
    Location = "Rüstmeister der Sturmlanzen (Alteractal - North "..yellow.."[7]"..white..")",
    Note = "Die Vorräte befinden sich in der Eisenschachtmine bei (Alteractal - Nord "..yellow.."[1]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[7] = {
    Title = "Rüstungsfetzen",
    Id = 7223,
    Level = 60,
    Attain = 51,
    Aim = "Bringt Murgot Tiefenschmied in Dun Baldar 20 Rüstungsfetzen.",
    Location = "Murgot Tiefenschmied (Alteractal - North "..yellow.."[4]"..white..")",
    Note = "Plündert die Leichen feindlicher Spieler für Fetzen. Die Folgequest ist nur dieselbe Quest, aber wiederholbar.",
    Folgequest = "Mehr Rüstungsfetzen",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[8] = {
    Title = "Eine Mine erobern",
    Id = 7122,
    Level = 60,
    Attain = 51,
    Aim = "Erobert eine Mine, die die Sturmlanzen noch nicht kontrollieren, und kehrt dann zu Unteroffizier Durgen Sturmlanze im Alteracgebirge zurück.",
    Location = "Unteroffizier Durgen Sturmlanze (Alteracgebirge "..yellow.."37,77"..white..")",
    Note = "Um die Quest abzuschließen, müsst Ihr entweder Morloch in der Eisenschachtmine bei (Alteractal - Nord "..yellow.."[1]"..white..") oder Zuchtmeister Schnuffel in der Eisbeißermine bei (Alteractal - Süd "..yellow.."[6]"..white..") töten, während die Horde sie kontrolliert.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[9] = {
    Title = "Türme und Bunker",
    Id = 7102,
    Level = 60,
    Attain = 51,
    Aim = "Erobert einen gegnerischen Turm und kehrt anschließend zu Korporal Teeka Murrblut im Alteracgebirge zurück.",
    Location = "Unteroffizier Durgen Sturmlanze (Alteracgebirge "..yellow.."37,77"..white..")",
    Note = "Angeblich muss der Turm oder Bunker nicht wirklich zerstört werden, um die Quest abzuschließen, nur angegriffen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[10] = {
    Title = "Die Friedhöfe im Alteractal",
    Id = 7081,
    Level = 60,
    Attain = 51,
    Aim = "Erobert einen Friedhof und kehrt zu Unteroffizier Durgen Sturmlanze im Alteracgebirge zurück.",
    Location = "Unteroffizier Durgen Sturmlanze (Alteracgebirge "..yellow.."37,77"..white..")",
    Note = "Angeblich müsst Ihr nichts tun, außer in der Nähe eines Friedhofs zu sein, wenn die Allianz ihn angreift. Er muss nicht erobert werden, nur angegriffen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[11] = {
    Title = "Verwaiste Ställe",
    Id = 7027,
    Level = 60,
    Attain = 51,
    Aim = "Findet einen Frostwolf im Alteractal. Wenn Ihr Euch in der Nähe eines Frostwolfs befindet, benutzt den Frostwolfmaulkorb um das Tier einzufangen. Nach erfolgreicher Zähmung, folgt Euch der Frostwolf bis zum Stallmeister zurück. Sprecht mit dem Stallmeister um für Euren Fang belohnt zu werden.",
    Location = "Stallmeister der Sturmlanzen (Alteractal - North "..yellow.."[6]"..white..")",
    Note = "Ihr findet einen Widder außerhalb der Basis. Der Zähmungsprozess ist genau wie bei einem Jäger, der ein Haustier zähmt. Die Quest ist bis zu insgesamt 25 Mal pro Schlachtfeld vom selben Spieler oder Spielern wiederholbar. Nachdem 25 Widder gezähmt wurden, trifft die Sturmlanzenkavallerie ein, um im Kampf zu helfen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[12] = {
    Title = "Widderzaumzeug",
    Id = 7026,
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Kommandant der Sturmlanzenwidderreiter (Alteractal - North "..yellow.."[6]"..white..")",
    Note = "Frostwölfe können im südlichen Bereich von Alteractal gefunden werden.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[13] = {
    Title = "Haufenweise Kristalle",
    Id = 7386,
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Erzdruidin Renferal (Alteractal - North "..yellow.."[2]"..white..")",
    Note = "Nachdem etwa 200 oder so Kristalle abgegeben wurden, beginnt Erzdruidin Renferal zum (Alteractal - Nord "..yellow.."[19]"..white..") zu gehen. Dort angekommen, beginnt sie ein Beschwörungsritual, das 10 Personen zur Unterstützung benötigt. Wenn erfolgreich, wird Ivus der Waldfürst beschworen, um im Kampf zu helfen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[14] = {
    Title = "Ivus der Waldfürst",
    Id = 6881,
    Level = 60,
    Attain = 51,
    Aim = "Der Frostwolfklan wird durch einen Makel elementarer Energie geschützt. Ihre Schamanen mischen sich in Kräfte ein, die uns sicherlich alle zerstören werden, wenn sie nicht kontrolliert werden.\n\nDie Frostwolfsoldaten tragen Elementaramulette namens Sturmkristalle. Wir können die Amulette benutzen, um Ivus zu beschwören. Wagt Euch vor und beansprucht die Kristalle.",
    Location = "Erzdruidin Renferal (Alteractal - North "..yellow.."[2]"..white..")",
    Note = "Nachdem etwa 200 oder so Kristalle abgegeben wurden, beginnt Erzdruidin Renferal zum (Alteractal - Nord "..yellow.."[19]"..white..") zu gehen. Dort angekommen, beginnt sie ein Beschwörungsritual, das 10 Personen zur Unterstützung benötigt. Wenn erfolgreich, wird Ivus der Waldfürst beschworen, um im Kampf zu helfen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[15] = {
    Title = "Ruf der Lüfte - Slidores Luftflotte",
    Id = 6942,
    Level = 60,
    Attain = 51,
    Aim = "Meine Greifen sind bereit, an der Front zuzuschlagen, können den Angriff aber erst durchführen, wenn die Linien ausgedünnt sind.\n\nDie Frostwolfkrieger, die mit dem Halten der Frontlinien beauftragt sind, tragen stolz Dienstmedaillen auf ihrer Brust. Reißt diese Medaillen von ihren verrottenden Leichen und bringt sie hier zurück.\n\nSobald die Frontlinie ausreichend ausgedünnt ist, gebe ich den Befehl zur Luft! Tod von oben!",
    Location = "Schwadronskommandant Slidore (Alteractal - North "..yellow.."[8]"..white..")",
    Note = "Tötet Horde-NPCs für die Medaille des Soldaten der Frostwölfe.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[16] = {
    Title = "Ruf der Lüfte - Vipores Luftflotte",
    Id = 6941,
    Level = 60,
    Attain = 51,
    Aim = "Die Elite-Frostwolfeinheiten, die die Linien bewachen, müssen erledigt werden, Soldat! Ich beauftrage Euch damit, diese Herde von Wilden auszudünnen. Kehrt mit Medaillen ihrer Leutnants und Legionäre zu mir zurück. Wenn ich das Gefühl habe, dass genug vom Gesindel erledigt wurde, setze ich den Luftangriff ein.",
    Location = "Schwadronskommandant Vipore (Alteractal - North "..yellow.."[8]"..white..")",
    Note = "Tötet Horde-NPCs für die Medaille des Leutnants der Frostwölfe.",
}
kQuestInstanceData.BGAlteracValleyNorth.Alliance[17] = {
    Title = "Ruf der Lüfte - Ichmans Luftflotte",
    Id = 6943,
    Level = 60,
    Attain = 51,
    Aim = "Kehrt zum Schlachtfeld zurück und schlagt das Herz von Frostwolfs Kommando. Erledigt ihre Kommandanten und Wächter. Kehrt zu mir zurück mit so vielen ihrer Medaillen, wie Ihr in Euren Rucksack stopfen könnt! Ich verspreche Euch, wenn meine Greifen die Beute sehen und das Blut unserer Feinde riechen, werden sie wieder fliegen! Geht jetzt!",
    Location = "Schwadronskommandant Ichman (Alteractal - North "..yellow.."[8]"..white..")",
    Note = "Tötet Horde-NPCs für die Frostwolf-Komman dantenmedaillen. Nach Abgabe von 50 wird Schwadronskommandant Ichman entweder einen Greifen schicken, um die Hordenbasis anzugreifen, oder Euch ein Leuchtfeuer geben, um es auf dem Schneewehenfriedhof zu platzieren. Wenn das Leuchtfeuer lange genug geschützt wird, kommt ein Greif, um es zu verteidigen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[1] = {
    Title = "Die Verteidigung der Frostwölfe",
    Id = 7241,
    Level = 60,
    Attain = 51,
    Aim = "Reist ins Alteractal im Vorgebirge des Hügellands. Sucht dort Kriegsmeister Laggrond auf und beginnt Eure Karriere als Soldat der Frostwölfe.",
    Location = "Botschafterin Rokhstrom der Frostwölfe (Orgrimmar - Tal der Stärke "..yellow.."50,71"..white..")",
    Note = "Kriegsmeister Laggrond ist bei (Alteracgebirge "..yellow.."62,59"..white..").",
    Folgequest = "Flaggenjagd",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[2] = {
    Title = "Flaggenjagd",
    Id = 7161,
    Level = 60,
    Attain = 51,
    Aim = "Begebt Euch in die Höhle der Wildpfoten südöstlich vom Hauptstützpunkt und findet das Banner der Frostwölfe. Bringt anschließend Kriegsmeister Laggrond das Banner.",
    Location = "Kriegsmeister Laggrond (Alteracgebirge "..yellow.."62,59"..white..")",
    Note = "Das Banner der Frostwölfe befindet sich in der Höhle der Wildpfoten bei (Alteractal - Süd "..yellow.."[9]"..white.."). Sprecht jedes Mal, wenn Ihr eine neue Rufebene erreicht, mit demselben NPC für ein verbessertes Abzeichen.\n\nDie Vorquest ist nicht notwendig, um diese Quest zu erhalten, aber sie bringt etwa 9550 Erfahrung.",
    Prequest = "Die Verteidigung der Frostwölfe",
    Folgequest = "Aufstieg und Anerkennung -> Das Auge der Führung",
    Rewards = {
        Text = "Rewards:",
        { id = 17690 }, --Frostwolf Insignia Rank 1 Trinket
        { id = 19483 }, --Peeling the Onion Book
    }
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[3] = {
    Title = "Die Schlacht ums Alteractal",
    Id = 7142,
    Level = 60,
    Attain = 51,
    Aim = "Betretet das Alteractal und bezwingt den Zwergengeneral, Vanndar Sturmlanze. Kehrt anschließend zu Voggah Todesgriff im Alteracgebirge zurück.",
    Location = "Voggah Todesgriff (Alteracgebirge "..yellow.."64,60"..white..")",
    Note = "Vanndar Sturmlanze ist bei (Alteractal - Nord "..yellow.."[B]"..white.."). Er muss nicht wirklich getötet werden, um die Quest abzuschließen. Das Schlachtfeld muss nur von Eurer Seite auf irgendeine Weise gewonnen werden.\nNachdem Ihr diese Quest abgegeben habt, sprecht erneut mit dem NPC für die Belohnung.",
    Folgequest = "Held der Frostwölfe",
    Rewards = kQuestInstanceData.BGAlteracValleyNorth.Alliance[3].Rewards
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[4] = {
    Title = "Sprecht mit unserem Rüstmeister",
    Id = 7123,
    Level = 60,
    Attain = 51,
    Aim = "Sprecht mit dem Rüstmeister der Frostwölfe.",
    Location = "Jotek (Alteractal - South "..yellow.."[8]"..white..")",
    Note = "Der Rüstmeister der Frostwölfe ist bei "..yellow.."[10]"..white.." und bietet weitere Quests.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[5] = {
    Title = "Vorräte der Eisbeißermine",
    Id = 5893,
    Level = 60,
    Attain = 51,
    Aim = "Bringt 10 Vorräte der Eisbeißermine zum Rüstmeister der Horde in die Burg Frostwolf.",
    Location = "Rüstmeister der Frostwölfe (Alteractal - South "..yellow.."[10]"..white..")",
    Note = "Die Vorräte befinden sich in der Eisbeißermine bei (Alteractal - Süd "..yellow.."[6]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[6] = {
    Title = "Vorräte der Eisenschachtmine",
    Id = 6985,
    Level = 60,
    Attain = 51,
    Aim = "Bringt 10 Vorräte der Eisenschachtmine zum Rüstmeister der Allianz in Dun Baldar.",
    Location = "Rüstmeister der Frostwölfe (Alteractal - South "..yellow.."[10]"..white..")",
    Note = "Die Vorräte befinden sich in der Eisenschachtmine bei (Alteractal - Nord "..yellow.."[1]"..white..").",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[7] = {
    Title = "Beutezug im Feindesland",
    Id = 7224,
    Level = 60,
    Attain = 51,
    Aim = "Bringt 20 Rüstungsfetzen zu Schmied Regzar im Dorf der Frostwölfe.",
    Location = "Schmied Regzar (Alteractal - South "..yellow.."[8]"..white..")",
    Note = "Plündert die Leichen feindlicher Spieler für Fetzen. Die Folgequest ist nur dieselbe Quest, aber wiederholbar.",
    Folgequest = "Mehr Beute!",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[8] = {
    Title = "Eine Mine erobern",
    Id = 7124,
    Level = 60,
    Attain = 51,
    Aim = "Erobert eine Mine, die die Sturmlanzen noch nicht kontrollieren, und kehrt dann zu Unteroffizier Durgen Sturmlanze im Alteracgebirge zurück.",
    Location = "Korporal Teeka Murrblut (Alteracgebirge "..yellow.."66,55"..white..")",
    Note = "Um die Quest abzuschließen, müsst Ihr entweder Morloch in der Eisenschachtmine bei (Alteractal - Nord "..yellow.."[1]"..white..") oder Zuchtmeister Schnuffel in der Eisbeißermine bei (Alteractal - Süd "..yellow.."[6]"..white..") töten, während die Allianz sie kontrolliert.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[9] = {
    Title = "Türme und Bunker",
    Id = 7101,
    Level = 60,
    Attain = 51,
    Aim = "Erobert einen gegnerischen Turm und kehrt anschließend zu Korporal Teeka Murrblut im Alteracgebirge zurück.",
    Location = "Korporal Teeka Murrblut (Alteracgebirge "..yellow.."66,55"..white..")",
    Note = "Angeblich muss der Turm oder Bunker nicht wirklich zerstört werden, um die Quest abzuschließen, nur angegriffen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[10] = {
    Title = "Die Friedhöfe von Alterac",
    Id = 7082,
    Level = 60,
    Attain = 51,
    Aim = "Erobert einen Friedhof und kehrt zu Korporal Teeka Murrblut im Alteracgebirge zurück.",
    Location = "Korporal Teeka Murrblut (Alteracgebirge "..yellow.."66,55"..white..")",
    Note = "Angeblich müsst Ihr nichts tun, außer in der Nähe eines Friedhofs zu sein, wenn die Horde ihn angreift. Er muss nicht erobert werden, nur angegriffen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[11] = {
    Title = "Verwaiste Ställe",
    Id = 7001,
    Level = 60,
    Attain = 51,
    Aim = "Findet einen Frostwolf im Alteractal. Wenn Ihr Euch in der Nähe eines Frostwolfs befindet, benutzt den Frostwolfmaulkorb um das Tier einzufangen. Nach erfolgreicher Zähmung, folgt Euch der Frostwolf bis zum Stallmeister zurück. Sprecht mit dem Stallmeister um für Euren Fang belohnt zu werden.",
    Location = "Stallmeister der Frostwölfe (Alteractal - South "..yellow.."[9]"..white..")",
    Note = "Ihr findet einen Frostwolf außerhalb der Basis. Der Zähmungsprozess ist genau wie bei einem Jäger, der ein Haustier zähmt. Die Quest ist bis zu insgesamt 25 Mal pro Schlachtfeld vom selben Spieler oder Spielern wiederholbar. Nachdem 25 Widder gezähmt wurden, trifft die Frostwolfkavallerie ein, um im Kampf zu helfen.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[12] = {
    Title = "Widderledernes Zaumzeug",
    Id = 7002,
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Wolfsreiterkommandant der Frostwölfe (Alteractal - South "..yellow.."[9]"..white..")",
    Note = "Die Widder können im nördlichen Bereich von Alteractal gefunden werden.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[13] = {
    Title = "Eine Gallone Blut",
    Id = 7385,
    Level = 60,
    Attain = 51,
    Aim = "null",
    Location = "Primalist Thurloga (Alteractal - South "..yellow.."[8]"..white..")",
    Note = "Nachdem etwa 150 oder so Blut abgegeben wurde, beginnt Primalistin Thurloga zum (Alteractal - Süd "..yellow.."[14]"..white..") zu gehen. Dort angekommen, beginnt sie ein Beschwörungsritual, das 10 Personen zur Unterstützung benötigt. Wenn erfolgreich, wird Lokholar der Eislord beschworen, um Allianzspieler zu töten.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[14] = {
    Title = "Lokholar der Eislord",
    Id = 6801,
    Level = 60,
    Attain = 51,
    Aim = "Ihr müsst unsere Feinde niederschlagen und mir ihr Blut bringen. Sobald genug Blut gesammelt wurde, kann das Beschwörungsritual beginnen.\n\nDer Sieg wird gesichert sein, wenn der Elementarlord auf die Sturmlanzenarmee losgelassen wird.",
    Location = "Primalist Thurloga (Alteractal - South "..yellow.."[8]"..white..")",
    Note = "Nachdem etwa 150 oder so Blut abgegeben wurde, beginnt Primalistin Thurloga zum (Alteractal - Süd "..yellow.."[14]"..white..") zu gehen. Dort angekommen, beginnt sie ein Beschwörungsritual, das 10 Personen zur Unterstützung benötigt. Wenn erfolgreich, wird Lokholar der Eislord beschworen, um Allianzspieler zu töten.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[15] = {
    Title = "Ruf der Lüfte - Guses Luftflotte",
    Id = 6825,
    Level = 60,
    Attain = 51,
    Aim = "Meine Reiter sind bereit, einen Schlag auf das zentrale Schlachtfeld zu führen; aber zuerst muss ich ihren Appetit anregen - sie auf den Angriff vorbereiten.\n\nIch brauche genug Sturmlanzen soldatenfleisch, um eine Flotte zu füttern! Hunderte von Pfund! Ihr könnt das sicherlich bewältigen, oder? Los geht's!",
    Location = "Schwadronskommandantin Guse (Alteractal - South "..yellow.."[13]"..white..")",
    Note = "Tötet Allianz-NPCs für das Fleisch eines Sturmlanzensoldaten. Angeblich werden 90 Fleisch benötigt, damit die Geschwaderkommandantin tut, was auch immer sie tut.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[16] = {
    Title = "Ruf der Lüfte - Jeztors Luftflotte",
    Id = 6826,
    Level = 60,
    Attain = 51,
    Aim = "Meine Kriegsreiter müssen im Fleisch ihrer Ziele kosten. Dies wird einen chirurgischen Schlag gegen unsere Feinde sicherstellen!\n\nMeine Flotte ist die zweitmächtigste in unserem Luftkommando. Daher werden sie gegen die Mächtigeren unserer Widersacher zuschlagen. Dafür brauchen sie das Fleisch der Sturmlanzenleutnants.",
    Location = "Schwadronskommandantin Jeztor (Alteractal - South "..yellow.."[13]"..white..")",
    Note = "Tötet Allianz-NPCs für das Fleisch eines Sturmlanzenleutnants.",
}
kQuestInstanceData.BGAlteracValleyNorth.Horde[17] = {
    Title = "Ruf der Lüfte - Mulvericks Luftflotte",
    Id = 6827,
    Level = 60,
    Attain = 51,
    Aim = "Zuerst brauchen meine Kriegsreiter Ziele, auf die sie schießen können - hochpriorisierte Ziele. Ich werde sie mit dem Fleisch von Sturmlanzenkommandanten füttern müssen. Unglücklicherweise sind diese kleinen Biester tief hinter feindlichen Linien verschanzt! Ihr habt definitiv Eure Arbeit vor Euch.",
    Location = "Schwadronskommandant Mulverick (Alteractal - South "..yellow.."[13]"..white..")",
    Note = "Tötet Allianz-NPCs für das Fleisch eines Sturmlanzenkommandanten.",
}

--------------- Arathi Basin ---------------
kQuestInstanceData.BGArathiBasin = {
    Story = "Arathib ecken, gelegen im Arathihochland, ist ein schnelles und aufregendes Schlachtfeld. Das Becken selbst ist reich an Ressourcen und wird sowohl von der Horde als auch von der Allianz begehrt. Die Verlassenen Schand und die Liga von Arathor sind im Arathibecken eingetroffen, um Krieg über diese natürlichen Ressourcen zu führen und sie im Namen ihrer jeweiligen Seiten zu beanspruchen.",
    Caption = "Arathibecken",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.BGArathiBasin.Alliance[1] = {
    Title = "Die Schlacht um das Arathibecken!",
    Id = 8105,
    Level = 55,
    Attain = 50,
    Aim = "Erobert die Mine, das Sägewerk, die Schmiede und die Farm und meldet Euch anschließend bei Feldmarschall Lichtmark in der Zuflucht.",
    Location = "Feldmarschall Lichtmark (Arathihochland - Die Zuflucht "..yellow.."46,45"..white..")",
    Note = "Die anzugreifenden Orte sind auf der Karte als 2 bis 5 markiert.",
}
kQuestInstanceData.BGArathiBasin.Alliance[2] = {
    Title = "Kontrolliert vier Stützpunkte",
    Id = 8114,
    Level = 60,
    Attain = 60,
    Aim = "Betretet das Arathibecken, erobert und kontrolliert gleichzeitig vier Stützpunkte im Arathibecken und kehrt danach zu Feldmarschall Lichtmark in der Zuflucht zurück.",
    Location = "Feldmarschall Lichtmark (Arathihochland - Die Zuflucht "..yellow.."46,45"..white..")",
    Note = "Ihr müsst Freundlich mit der Liga von Arathor sein, um diese Quest zu bekommen.",
}
kQuestInstanceData.BGArathiBasin.Alliance[3] = {
    Title = "Kontrolliert fünf Stützpunkte",
    Id = 8115,
    Level = 60,
    Attain = 60,
    Aim = "Kontrolliert gleichzeitig fünf Stützpunkte im Arathibecken und kehrt danach zu Feldmarschall Lichtmark in der Zuflucht zurück.",
    Location = "Feldmarschall Lichtmark (Arathihochland - Die Zuflucht "..yellow.."46,45"..white..")",
    Note = "Ihr müsst Ehrfürchtig mit der Liga von Arathor sein, um diese Quest zu bekommen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 20132 }, --Arathor Battle Tabard Tabard
    }
}
kQuestInstanceData.BGArathiBasin.Horde[1] = {
    Title = "Die Schlacht um das Arathibecken!",
    Id = 8120,
    Level = 25,
    Attain = 25,
    Aim = "Erobert die Mine, das Sägewerk, die Schmiede und die Farm und meldet Euch anschließend bei Feldmarschall Lichtmark in der Zuflucht.",
    Location = "Todesmeister Dunkels (Arathihochland - Hammerfall "..yellow.."74,35"..white..")",
    Note = "Die anzugreifenden Orte sind auf der Karte als 1 bis 4 markiert.",
}
kQuestInstanceData.BGArathiBasin.Horde[2] = {
    Title = "Erobert vier Stützpunkte",
    Id = 8121,
    Level = 60,
    Attain = 60,
    Aim = "Haltet vier Stützpunkte zur selben Zeit im Arathibecken und kehrt danach zu Todesmeister Dunkels nach Hammerfall zurück.",
    Location = "Todesmeister Dunkels (Arathihochland - Hammerfall "..yellow.."74,35"..white..")",
    Note = "Ihr müsst Freundlich mit den Entehrern sein, um diese Quest zu bekommen.",
}
kQuestInstanceData.BGArathiBasin.Horde[3] = {
    Title = "Erobert fünf Stützpunkte",
    Id = 8122,
    Level = 60,
    Attain = 60,
    Aim = "Haltet fünf Stützpunkte zur selben Zeit im Arathibecken und kehrt danach zu Todesmeister Dunkels nach Hammerfall zurück.",
    Location = "Todesmeister Dunkels (Arathihochland - Hammerfall "..yellow.."74,35"..white..")",
    Note = "Ihr müsst Ehrfürchtig mit den Entehrern sein, um diese Quest zu bekommen.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 20131 }, --Battle Tabard of the Defilers Tabard
    }
}

--------------- Warsong Gulch ---------------
kQuestInstanceData.BGWarsongGulch = {
    Story = "Im südlichen Bereich des Eschenwaldes gelegen, liegt die Warsongschlucht nahe dem Gebiet, wo Grom Hellscream und seine Orks während der Ereignisse des Dritten Krieges riesige Waldgebiete abholzten. Einige Orks sind in der Nähe geblieben und setzen ihre Abholzung fort, um die Expansion der Horde anzutreiben. Sie nennen sich die Kriegshymnenaußenreiter.\nDie Nachtelfen, die einen massiven Vorstoß zur Rückeroberung der Wälder von Eschental begonnen haben, richten nun ihre Aufmerksamkeit darauf, ihr Land ein für alle Mal von den Außenreitern zu befreien. Und so haben die Silberschwingenwächter den Ruf beantwortet und geschworen, dass sie nicht ruhen werden, bis jeder letzte Ork besiegt und aus der Warsongschlucht vertrieben ist.",
    Caption = "Kriegshymnenschlucht",
    Alliance = {},
    Horde = {}
}

--------------- The Crescent Grove ---------------
kQuestInstanceData.TheCrescentGrove = {
    Story = "Ein versteckter Hain im südlichen Eschental mit Blick auf den Mystral-See, der einst mehrere Jahre lang ein Rückzugsort für Druiden war, hat eine böse Präsenz in der Region Wurzeln geschlagen.\nUrsprünglich ein versteckter Hain, der als ruhiger Rückzugsort für Druiden diente, ist in jüngster Zeit der Hainwald-Stamm eingezogen, während er vor dem Wahnsinn des Übelwald-Stammes flieht und dabei mehrere der ursprünglichen Bewohner vertreibt. Trotz ihrer Versuche, dem Wahnsinn zu entkommen, erlagen sie ihm mit der Zeit.\nKalanar Hellschein lebte einst hier, bevor er vom Hainwald-Furbolg aus dem Hain vertrieben wurde und sein Haus niedergebrannt wurde.\nDämonische Kräfte der Brennenden Legion, angeführt vom Verdammniswächter Meister Raxxieth, haben sich im Hain etabliert und beginnen, die Lichtung zu korrumpieren. Bereits hat die Legion ihre Spuren in Form der Übelrankennarbe hinterlassen, das Gleichgewicht gestört und Geister beunruhigt.",
    Caption = "The Mondsichelhain",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TheCrescentGrove.Alliance[1] = {
    Title = "Der wuchernde Hainwald",
    Id = 40089,
    Level = 33,
    Attain = 26,
    Aim = "Wagt Euch in den Mondsichel hain und sammelt 8 Hainwald-Abzeichen von den Furbolgs darin für Grol den Verbannten.",
    Location = "Grol der Verbannte (Eschental "..yellow.."56,59"..white..")",
    Note = "Droppt von Furbolgs.",
}
kQuestInstanceData.TheCrescentGrove.Alliance[2] = {
    Title = "Die törichten Ältesten",
    Id = 40090,
    Level = 34,
    Attain = 26,
    Aim = "Bringt die Pfoten von Älteste 'Einauge' und Älteste Schwarzmaul aus dem Mondsichelhain zu Grol dem Verbannten.",
    Location = "Grol der Verbannte (Eschental "..yellow.."56,59"..white..")",
    Note = "Droppt von Furbolgs nahe dem ersten Boss.",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60179 }, --Grol's Band Ring
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[3] = {
    Title = "Der Mondsichelhain",
    Id = 40091,
    Level = 37,
    Attain = 28,
    Aim = "Zerstört die Quelle der Verderbnis im Mondsichelhain und kehrt zu Denatharion in Teldrassil zurück.",
    Location = "Denatharion <Druid Trainer> (Teldrassil - Darnassus "..yellow.."24,48"..white..")",
    Note = "Ihr müsst den letzten Boss töten.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60180 }, --Sentinel Chain Chest, Mail
        { id = 60181 }, --Groveweave Cloak Back
        { id = 60182 }, --Epaulets of Forest Wisdom Shoulder, Cloth
        { id = 60183 }, --Bushstalker Mask Head, Leather
    }
}
kQuestInstanceData.TheCrescentGrove.Alliance[4] = {
    Title = "Kalanars Hammer",
    Id = 40326,
    Level = 33,
    Attain = 25,
    Aim = "Reist zum Mondsichelhain und findet das niedergebrannte Haus von Kalanar Hellschein. Holt dann Kalanars Schlegel und bringt ihn zu ihm nach Astranaar zurück.",
    Location = "Kalanar Glanzschein (Eschental "..yellow.."36,52"..white..")",
    Note = "Enthalten in 'Kalanars Truhe'"..yellow.." [a]",
}
kQuestInstanceData.TheCrescentGrove.Horde[1] = kQuestInstanceData.TheCrescentGrove.Alliance[1]
kQuestInstanceData.TheCrescentGrove.Horde[2] = kQuestInstanceData.TheCrescentGrove.Alliance[2]
kQuestInstanceData.TheCrescentGrove.Horde[3] = {
    Title = "Das Böse an der Wurzel packen",
    Id = 40147,
    Level = 37,
    Attain = 26,
    Aim = "Wagt Euch in den Mondsichelhain und rottet das Böse darin aus.",
    Location = "Loruk Waldschleicher (Eschental - Splitterholzposten "..yellow.."73,59"..white..")",
    Note = "Die Questreihe beginnt auch bei Loruk Waldschleicher. Ihr müsst den letzten Boss töten.",
    Prequest = "Geheimnisse des Hains -> Ferans Bericht",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60213 }, --Outrider Chain Chest, Mail
        { id = 60214 }, --Strongwind Cloak Back
        { id = 60215 }, --Foreststrider Spaulders Shoulder, Leather
        { id = 60216 }, --Hat of Forest Medicine Head, Cloth
    }
}

--------------- Karazhan Crypt ---------------
kQuestInstanceData.KarazhanCrypt = {
    Story = "Die Karazhan-Krypta ist ein Instanzdungeon im Gebirgspass der Totenwinde. Etwas verdreht die Toten zurück ins Leben in den verlassenen Katakomben, findet die Quelle, damit die Toten wieder ruhen können.",
    Caption = "Karazhan Krypta",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.KarazhanCrypt.Alliance[1] = {
    Title = "Das Geheimnis von Karazhan VII",
    Id = 40317,
    Level = 60,
    Attain = 58,
    Aim = "Wagt Euch in die Karazhan-Krypten, tötet dort Alarus, den Wächter der Krypten für Magus Ariden Dunkelturm im Gebirgspass der Totenwinde.",
    Location = "Magus Ariden Dämmerturm (Gebirgspass der Totenwinde "..yellow.."52,34"..white..")",
    Note = "Karazhan Krypta Schlüssel von der Quest (Das Geheimnis von Karazhan VI). Ihr findet Alarus bei [5].",
    Prequest = "Das Geheimnis von Karazhan I >> Das Geheimnis von Karazhan VI",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60463 }, --Arcane Charged Pendant Neck
        { id = 60464 }, --Orb of Kaladoon Trinket
        { id = 60465 }, --Arcane Strengthened Band Ring
    }
}
kQuestInstanceData.KarazhanCrypt.Alliance[2] = {
    Title = "Keine Ehre unter Köchen",
    Id = 41374,
    Level = 61,
    Attain = 60,
    Aim = "Tötet den Hungrigen Strigoi in den Karazhan-Krypten und kehrt zum Koch in den Unteren Karazhan-Hallen zurück.",
    Location = "Der Koch Nahe ("..yellow.."[Untere Hallen von Karazhan- e]"..white..")",
    Note = "Droppt von [Hungriger Strigoi].\nDie Questreihe beginnt [Rezepte von Kezan], die Ihr im "..yellow.."[Turm von Karazhan]"..white.." bekommt.",
    Prequest = "Die Majestät des Kochs",
    Rewards = {
        Text = "Belohnung: ",
        { id = 92045 }, --Recipe: Empowering Herbal Salad Pattern
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[1] = {
    Title = "Die Tiefen von Karazhan VII",
    Id = 40310,
    Level = 60,
    Attain = 58,
    Aim = "Wagt Euch in die Karazhan-Krypten, tötet dort Alarus, den Wächter der Krypten für Kor'gan in Steinard.",
    Location = "Kor'gan (Sümpfe des Elends "..yellow.."44,55"..white..")",
    Note = "Karazhan Krypta Schlüssel von der Quest (Die Tiefen von Karazhan VI). Ihr findet Alarus bei [5].",
    Prequest = "Die Tiefen von Karazhan I >> Die Tiefen von Karazhan VI",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60459 }, --Charged Arcane Ring Ring
        { id = 60460 }, --Tusk of Gardon Neck
        { id = 60461 }, --Blackfire Orb Trinket
    }
}
kQuestInstanceData.KarazhanCrypt.Horde[2] = kQuestInstanceData.KarazhanCrypt.Alliance[2]

--------------- Caverns Of Time: The Black Morass ---------------
kQuestInstanceData.CavernsOfTimeBlackMorass = {
    Story = "In den Höhlen der Zeit, in Tanaris, spielt das Dunkle Portal die Geschichte seiner ersten Öffnung nach. Die Bronzedrachen, Hüter der Zeit, brauchen Eure Hilfe, um die Stabilität der Zeitlinie aufrechtzuerhalten und die Verschwörung der Gefallenen zu zerschlagen.",
    Caption = "Caverns Of Time: Der Schwarze Morast",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[1] = {
    Title = "Die erste Öffnung des Dunklen Portals",
    Id = 80605,
    Level = 60,
    Attain = 60,
    Aim = "Betretet die Zeitströme in die Vergangenheit des Schwarzen Morasts und erschlagt Antnormi. Bringt ihren Kopf zu Khenya Drehscharf.",
    Location = "Chromie (Tanaris - Höhlen der Zeit "..yellow.."57,59"..white..")",
    Note = "Die Questreihe beginnt bei Lizzarik <Waffenhändler> (Brachland - Patrouille von den Crossroads nach Ratschet "..yellow.."57,37"..white.."). Droppt von [4].",
    Prequest = "Eine glänzende Gelegenheit > Eine blutig gute Tat > Ein Brief von einem Freund >> Eine Reise in die Höhlen",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 82950 }, --X-51 Arcane Ocular Implants Head, Cloth
        { id = 82951 }, --X-52 Stealth Ocular Implants Head, Leather
        { id = 82952 }, --X-53 Ranger Ocular Implants Head, Mail
        { id = 82953 }, --X-54 Guardian Ocular Implants Head, Plate
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[2] = {
    Title = "Der bronzene Verrat",
    Id = 40342,
    Level = 60,
    Attain = 58,
    Aim = "Tötet Chronar und bringt seinen Kopf zu Tyvadrius in den Höhlen der Zeit.",
    Location = "Tyvadrius (Tanaris - Höhlen der Zeit "..yellow.."59,60"..white..")",
    Note = "Ihr müsst den ersten Boss töten.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60497 }, --Pendant of Tyvadrius Neck
        { id = 60498 }, --Halberd of the Bronze Defender Polearm
        { id = 60499 }, --Ring of Tyvadrius Ring
    }
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[3] = {
    Title = "Verderbter Sand",
    Id = 40340,
    Level = 60,
    Attain = 58,
    Aim = "Sammelt einen Verderbten Sand für Dronormu in den Höhlen der Zeit.",
    Location = "Dronormu (Tanaris - Höhlen der Zeit "..yellow.."63,58"..white..")",
    Note = "Droppt von Gegnern und Bossen.",
}
kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[4] = {
    Title = "Sand in Massen",
    Id = 40341,
    Level = 60,
    Attain = 58,
    Aim = "Sammelt 10 Verderbte Sand für Dronormu in den Höhlen der Zeit.",
    Location = "Dronormu (Tanaris - Höhlen der Zeit "..yellow.."63,58"..white..")",
    Note = "Droppt von Gegnern und Bossen.",
}
for i = 1, 4 do
    kQuestInstanceData.CavernsOfTimeBlackMorass.Horde[i] = kQuestInstanceData.CavernsOfTimeBlackMorass.Alliance[i]
end

--------------- Hateforge Quarry ---------------
kQuestInstanceData.HateforgeQuarry = {
    Story = "Der Hassschmiedebruch ist ein Instanzdungeon in der Brennenden Steppe. Versteckt an den südöstlichen Mauern der Brennenden Steppe ist der Hassschmiedebruch die neueste Bemühung der Dunkeleisenzwerge, eine neue Waffe gegen ihre Gegner zu finden. Der harmlos aussehende Steinbruch verbirgt eine heimtückische Höhle, in der die Schattenschmiede-Zwerge neue Pläne gegen alle schmieden, die sich ihnen widersetzen.",
    Caption = "Steinbruch der Hassschmiede",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.HateforgeQuarry.Alliance[1] = {
    Title = "Rivalisierende Präsenz",
    Id = 40458,
    Level = 54,
    Attain = 47,
    Aim = "Findet heraus, was im Hassschmiedebruch ausgegraben wird.",
    Location = "Aufseher Schlickfaust <Die Thoriumbruderschaft> (Sengende Schlucht - Thoriumspitze "..yellow.."38.1,27.0"..white..")",
    Note = "Chemiker der Hassschmiede-Gegner lassen Gefüllte Hassschmiedebrauen-Phiole für die Quest fallen.",
}
kQuestInstanceData.HateforgeQuarry.Alliance[2] = {
    Title = "Aufstand der Minenarbeitergewerkschaft II",
    Id = 40468,
    Level = 50,
    Attain = 45,
    Aim = "Tötet 20 Hassschmiedeminenarbeiter im Hassschmiedebruch und kehrt zu Morgrim Feuerspieß am Schwarzfelspass in der Brennenden Steppe zurück.",
    Location = "Morgrim Feuerpike (Brennende Steppe - Schwarzfelspass "..yellow.."75.6,68.3"..white..").",
    Note = "Die Questreihe beginnt bei Radgan Tiefenbrand mit der Quest 'Orvaks Vertrauen gewinnen' (Brennende Steppe - Schwarzfelspass "..yellow.."76.1,67.6"..white..").",
    Prequest = "Orvaks Vertrauen gewinnen -> Orvaks Geschichte anhören -> Das Versteck von Felsgrim -> Aufstand der Minenarbeitergewerkschaft",
    Rewards = {
        Text = "Belohnung: ",
        { id = 60673 }, --Cuffs of Justice Wrist, Plate
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[3] = {
    Title = "Der wahre Obervorarbeiter",
    Id = 40463,
    Level = 51,
    Attain = 45,
    Aim = "Tötet Bargul Schwarzhammer und holt die Befehle des Senats für Orvak Sternfels am Schwarzfelspass in der Brennenden Steppe.",
    Location = "Orvak Sternfels (Brennende Steppe - Schwarzfelspass "..yellow.."75.9,68.2"..white..").",
    Note = "Die Questreihe beginnt bei Radgan Tiefenbrand mit der Quest 'Orvaks Vertrauen gewinnen' (Brennende Steppe - Schwarzfelspass "..yellow.."76.1,67.6"..white..").\nTötet Bargul Schwarzhammer und nehmt die Befehle des Senats auf dem Tisch neben dem Boss.",
    Prequest = "Orvaks Vertrauen gewinnen -> Orvaks Geschichte anhören -> Das Versteck von Felsgrim",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60665 }, --Deepblaze Signet Ring
        { id = 60666 }, --Sternrock Trudgers Feet, Leather
        { id = 60667 }, --Firepike's Lucky Trousers Legs, Cloth
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[4] = {
    Title = "Schimmerndes Blut",
    Id = 41361,
    Level = 50,
    Attain = 50,
    Aim = "Findet jemanden, der Euch etwas über den versengenden Edelstein beibringen kann.",
    Location = "Glimmering Shard (Steinbruch der Hassschmiede"..yellow.."[74, 73]"..white..").",
    Note = red.."Nur Juwelierskunst"..white.." Findet 'Schimmernder Splitter' und bekommt die Quest.\nIhr erhaltet die Belohnung nach Abschluss der letzten Quest in der Questreihe.",
    Folgequest = "Meisterschaft des Donnerhammers",
    Rewards = {
        Text = "Belohnung: All",
        { id = 61818 }, --Gorgeous Mountain Gemstone Enchant
        { id = 70209 }, --Plans: Gorgeous Mountain Gemstone Pattern
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[5] = {
    Title = "Gerüchte um Hassschmiede-Gebräu",
    Id = 40490,
    Level = 54,
    Attain = 45,
    Aim = "Dringt in den Hassschmiedebruch ein und holt eine Dunkeleisen-Phiole und die Hassschmiedechemie-Dokumente, dann kehrt zu Varlag Dunkelbart bei Morgans Wacht in der Brennenden Steppe zurück.",
    Location = "Varlag Dämmerbart (Brennende Steppe - Morgans Wacht "..yellow.."85.1,67.6"..white..").",
    Note = "Chemiker der Hassschmiede-Gegner lassen Dunkeleisen-Phiole für die Quest fallen, Hassschmiedechemie-Dokumente befinden sich in der Kiste "..yellow.."[a]"..white..".",
    Rewards = {
        Text = "Rewards:",
        { id = 2686 }, --Thunder Ale Drinkable
        { id = 60699 }, --Varlag's Clutches Hands, Leather
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[6] = {
    Title = "Angriff auf Hassschmiede",
    Id = 40489,
    Level = 57,
    Attain = 45,
    Aim = "Wagt Euch in den Hassschmiedebruch und beseitigt die Präsenz des Schattenhammers aus der Tiefe, kehrt dann zu König Magni Bronzebart in Eisenschmiede zurück.",
    Location = "Senator Granitgürtel (Brennende Steppe - Morgans Wacht "..yellow.."85.2,67.9"..white..").",
    Note = "Tötet den letzten Boss Har'gesh Unheilsrufer "..yellow.."[5]"..white.."\nDie Questreihe beginnt mit der Quest 'Untersuchung der Hassschmiede' beim selben Questgeber.",
    Prequest = "Untersuchung der Hassschmiede -> Der Hassschmiede Bericht -> Die Antwort des Königs",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60694 }, --Crown of Grobi Head, Mail
        { id = 60695 }, --Sigil of Heritage Ring
        { id = 60696 }, --Rubyheart Mallet One-Hand, Mace
    }
}
kQuestInstanceData.HateforgeQuarry.Alliance[7] = {
    Title = "Warum nicht beides?",
    Id = 41142,
    Level = 50,
    Attain = 40,
    Aim = "Besorgt das Herz von Erdrutsch aus den Tiefen von Maraudon und die Essenz der Korrosion aus dem Hassschmiedebruch für Frig Donnerschmiede bei Aerie Peak.",
    Location = "Frig Donneresschmied (Hinterlands - Nistgipfel "..yellow.."[10.0, 49.3]"..white..").",
    Note = "Korrosis ist bei "..yellow.."[3]"..white..".",
    Prequest = "Ein Zeichen setzen -> Hab ich mal in einem Buch gelesen",
    Folgequest = "Meisterschaft des Donnerhammers",
    Rewards = {
        Text = "Belohnung: ",
        { id = 40080 }, --Thunderforge Lance Polearm
    }
}
for i = 1, 4 do
    kQuestInstanceData.HateforgeQuarry.Horde[i] = kQuestInstanceData.HateforgeQuarry.Alliance[i]
end
kQuestInstanceData.HateforgeQuarry.Horde[5] = {
    Title = "Jagd auf Ingenieur Figgles",
    Id = 40539,
    Level = 55,
    Attain = 48,
    Location = "Herrin Katalla (Brennende Steppe - Karfang Festung "..yellow.."89.4,24.5"..white.." nordöstliche Ecke der Brennenden Steppe)",
    Note = "Tötet Ingenieur Figgles "..yellow.."[2]"..white.." im Steinbruch der Hassschmiede für Worgherrin Katalla.",
    Prequest = "'Seltsam' ist noch untertrieben",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60771 }, --Pyrehand Gloves Hands, Cloth
        { id = 60772 }, --Fur of Navakesh Back
        { id = 60773 }, --Blackrock Authority One-Hand, Mace
        { id = 60774 }, --Girdle of Galron Waist, Mail
    }
}
kQuestInstanceData.HateforgeQuarry.Horde[6] = {
    Title = "Von Neuem und Altem IV",
    Id = 40504,
    Level = 57,
    Attain = 45,
    Aim = "Wagt Euch in den Hassschmiedebruch und beseitigt die Schattenhammer-Präsenz darin für Karfang in der Karfang Festung.",
    Location = "Karfang (Brennende Steppe - Karfang Festung "..yellow.."90.1,22.5"..white.." nordöstliche Ecke der Brennenden Steppe)",
    Note = "Tötet den letzten Boss Har'gesh Unheilsrufer "..yellow.."[5]"..white.."\nDie Questreihe beginnt bei Ratsherr Vargek (Brennende Steppe - Karfang Festung "..yellow.."90.0,22.7"..white.." nordöstliche Ecke der Brennenden Steppe) mit der Quest 'Von Neuem und Altem'.",
    Prequest = "Von Neuem und Altem -> Von Neuem und Altem II -> Von Neuem und Altem III",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60734 }, --Blade of the Warleader Main Hand, Sword
        { id = 60735 }, --Obsidian Gem Choker Neck
        { id = 60736 }, --Battlemaster Helm Head, Plate
    }
}

--------------- Sturmwind Vault ---------------
kQuestInstanceData.StormwindVault = {
    Story = "Das Sturmwindgewölbe ist ein Instanzdungeon in Sturmwind. Die Bannrunen des Gewölbes schwächen sich ab, während die Schrecken darin Azeroth erneut bedrohen, Ihr müsst hinuntergehen und diese Unholde ein für alle Mal stoppen.",
    Caption = "Gewölbe von Sturmwind",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwindVault.Alliance[1] = {
    Title = "Sicherstellung der Gewölbeketten",
    Id = 40426,
    Level = 63,
    Attain = 55,
    Aim = "Tötet im Sturmwindgewölbe Runenkonstrukte für 2 Runenfesseln und bringt sie zu Koli Steamheart zurück.",
    Location = "Koli Dampfpuls (Sturmwind "..yellow.."54,47"..white..")",
    Note = "Ihr müsst die Runenkonstrukt-Gegner töten.",
}
kQuestInstanceData.StormwindVault.Alliance[2] = {
    Title = "Das Ende von Arc'Tiras",
    Id = 40427,
    Level = 63,
    Attain = 55,
    Aim = "Wagt Euch tief ins Sturmwindgewölbe, findet Arc'tiras und tötet ihn für das Wohl von Sturmwind. Kehrt dann zu Pepin Ainsworth zurück.",
    Location = "Pepin Ainsworth (Sturmwind "..yellow.."54,47"..white..")",
    Note = "Ihr müsst den letzten Boss töten.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 60624 }, --Goldplated Royal Crossbow Crossbow
        { id = 60625 }, --Golden Gauntlets of Sturmwind Hands, Plate
        { id = 60626 }, --Regal Goldthreaded Sash Waist, Cloth
    }
}
kQuestInstanceData.StormwindVault.Alliance[3] = {
    Title = "Der Feind lauert",
    Id = 41357,
    Level = 62,
    Attain = 60,
    Aim = "Bringt den Kern von Arc'Tiras zu Al'Dorel zurück.",
    Location = "Al'Dorel (Winterquell "..yellow.."56,45"..white..")",
    Note = "Ihr müsst den letzten Boss töten.\nDie Questreihe beginnt bei Verzauberter Amethyst, droppt im "..yellow.."Turm von Karazhan [2]"..white.." Boss.\nBelohnung von der letzten Quest in der Reihe.",
    Prequest = "Schlafend unter Schnee",
    Folgequest = "Erwacht bei Sonnenaufgang",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 55133 }, --Claw of the Mageweaver Off Hand, Fist Weapon
        { id = 55134 }, --Rod of Permafrost Wand
        { id = 55135 }, --Shard of Leyflow Trinket
    }
}
kQuestInstanceData.StormwindVault.Alliance[4] = {
    Title = "Foliant arkaner Feinheiten und magischer Phänomene IX",
    Id = 40425,
    Level = 63,
    Attain = 58,
    Aim = "Holt das Buch der arkanen Feinheiten und Magisches Phänomen IX für Mazen Mac'Nadir in Sturmwind.",
    Location = "Mazen Mac'Nadir (Sturmwind "..yellow.."42,64"..white..")",
    Note = "Nahe "..yellow.."[3]"..white.." boss.",
    Rewards = {
        Text = "Belohnung: ",
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
    Title = "Torwächter",
    Id = 40107,
    Level = 60,
    Attain = 58,
    Aim = "Besiegt Ostarius. Kehrt zur Halle der Erforscher zurück und informiert Hochforscher Magellas über die Ereignisse am Tor.",
    Location = "Podest von Uldum (Tanaris "..yellow.."37,81"..white..")",
    Note = "Vorquest von Hochforscher Magellas (Eisenschmiede - Halle der Erforscher "..yellow.."69.9,18.5"..white.."). Ihr müsst Ostarius töten.",
    Prequest = "1.Ungewöhnliche Partnerschaft -> 2.Ursprünglicher Besitzer -> 7.Tore von Uldum",
}
kQuestInstanceData.Ostarius.Horde[1] = {
    Title = "Wächter des Tores",
    Id = 40115,
    Level = 60,
    Attain = 58,
    Aim = "Besiegt Ostarius. Kehrt nach Donnerfels zurück und informiert Weiser Wahrspruch über die Ereignisse am Tor.",
    Location = "Podest von Uldum (Tanaris "..yellow.."37,81"..white..")",
    Note = "Vorquest von Weiser Wahrspruch (Donnerfels "..yellow.."34,47"..white.."). Ihr müsst Ostarius töten.",
    Prequest = "1.Der einsame Wolf -> 2.Narben der Vergangenheit -> 7.Uldum wartet",
}

--------------- Gilneas City ---------------
kQuestInstanceData.GilneasCity = {
    Story = "Gilneas City ist ein Instanzdungeon in Gilneas. Im Herzen dieses einst isolierten Landes gelegen, war Gilneas City einst eine Bastion der Hoffnung für sein Volk. Nach der Befreiung von der Herrschaft der Arathorischen Lords gegründet, stand sie als Symbol für Widerstandskraft und Wohlstand. Doch nun ist sie nur noch eine Hülle ihrer früheren Schönheit, mit einer dunklen Präsenz, die einen festen Schatten über Gilneas wirft und als Erinnerung an ihre einst glorreiche Vergangenheit dient. Fernes Heulen hallt durch die Stadt, heimsuchende Erinnerungen an ihre neuen Bewohner. Doch es besteht die Möglichkeit, dass nicht alle verschwunden sind und dass ihr verfluchter König noch leben könnte.",
    Caption = "Gilneas",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.GilneasCity.Alliance[1] = {
    Title = "Der Richter und das Phantom",
    Id = 40975,
    Level = 46,
    Attain = 35,
    Aim = "Tötet Richter Sutherland in Gilneas City für den Erzürnten Phantom auf dem Glimmergut in Gilneas.",
    Location = "Erzürnter Phantom (Gilneas -Glanzmoor Hof "..yellow.."52.9,27.9"..white..")",
    Note = "Ihr findet den Erzürnten Phantom im Gebäude auf dem Berg. Wenn Ihr die Gilneas-Tore betretet, folgt dem Berg links (Osten), passiert ein Feld mit Windmühlen, Ihr findet einen Pfad zum Meer, fast am Rand dreht nach Norden, folgt dem Pfad (kaum erkennbar).",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61620 }, --Glaymore Family Breastplate Chest, Mail
        { id = 61621 }, --Ceremonial Gilnean Pike Polearm
        { id = 61622 }, --Glaymore Shawl Back
    }
}
kQuestInstanceData.GilneasCity.Alliance[2] = {
    Title = "Hinter der Mauer",
    Id = 40841,
    Level = 41,
    Attain = 36,
    Aim = "Wagt Euch nach Gilneas City und holt die Dämmerstein-Pläne für Therum Tiefenschmiede in Sturmwind.",
    Location = "Therum Tiefenschmied <Expert Schmiede> (Sturmwind - Zwergenviertel"..yellow.."63.3,37"..white..", kann dort herumlaufen)",
    Note = "Die Dämmerstein-Pläne befinden sich im Gebäude "..yellow.."[a]"..white.." auf der Kiste.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61348 }, --Inlaid Plate Boots Feet, Plate
        { id = 61349 }, --Dwarven Battle Bludgeon Main Hand, Mace
    }
}
kQuestInstanceData.GilneasCity.Alliance[3] = {
    Title = "Die Besitzurkunde von Rabenruh",
    Id = 40966,
    Level = 45,
    Attain = 38,
    Aim = "Findet die Rabenruh-Urkunde in Gilneas City und bringt sie zu Caliban Silbermähne zurück.",
    Location = "Baron Caliban Silbermähne (Gilneas - Rabenruh (main building) "..yellow.."58.4,67.8"..white..")",
    Note = "Die Rabenruh-Urkunde befindet sich auf dem Tisch hinter Regentenlady Celia Harlow und Regentenlord Mortimer Harlow, neben der Harlow-Familientruhe "..yellow.."[7]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61601 }, --Ebonmere Axe One-Hand, Axe
        { id = 61602 }, --Gilneas Brigade Helmet Head, Plate
        { id = 61603 }, --Robes of Ravenshire Chest, Cloth
        { id = 61604 }, --Greyshire Pauldrons Shoulder, Leather
    }
}
kQuestInstanceData.GilneasCity.Alliance[4] = {
    Title = "Ravencrofts Ehrgeiz",
    Id = 41112,
    Level = 45,
    Attain = 40,
    Aim = "Holt das Buch von Ur: Band Zwei aus der Bibliothek in Gilneas City und kehrt zu Ethan Rabenschlund zurück.",
    Location = "Ethan Rabenschlund (Gilneas - Düsternetz Friedhof - Krypta (südwestliche Ecke von Gilneas, östlich vom Fluss) "..yellow.."33,76"..white..")",
    Note = "Das Buch von Ur befindet sich im Gebäude "..yellow.."[b]"..white..", geht rechts, auf dem Tisch (Südseite).",
}
kQuestInstanceData.GilneasCity.Alliance[5] = {
    Title = "Drachische Präsenz bannen",
    Id = 40943,
    Level = 47,
    Attain = 35,
    Aim = "Beendet den Dracheneinfluss über Gilneas, indem Ihr Regentenlady Celia Harlow und Regentenlord Mortimer Harlow für Magus Orelius in Rabenruh in Gilneas tötet.",
    Location = "Magus Orelius <Kirin Tor> (Gilneas - Rabenruh (main building) "..yellow.."57.7,68.5"..white..")",
    Note = "Bringt 1 Großen brillanten Splitter mit, Ihr benötigt 1 für die Vorquest. Verzauberer haben sie oder das Auktionshaus kann helfen, es sollte billig sein.",
    Prequest = "Quelle der Arkana -> Magische Präsenz -> Drachische Präsenz?",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61486 }, --Violet Sash Waist, Cloth
        { id = 61487 }, --Gauntlets of Insight Hands, Mail
    }
}
kQuestInstanceData.GilneasCity.Alliance[6] = {
    Title = "Aufstieg und Fall von Graumähne",
    Id = 40956,
    Level = 42,
    Attain = 35,
    Aim = "'Rettet' Genn und holt die Graumähnenkrone für Lord Darius Rabenholz in Rabenruh in Gilneas.",
    Location = "Lord Darius Rabenholz (Gilneas - Rabenruh (main building) "..yellow.."58.4,67.6"..white..")",
    Note = "Die Questreihe beginnt mit der Quest 'Wolf unter Schafen' bei Baron Caliban Silbermähne (Gilneas - Rabenruh (Hauptgebäude) "..yellow.."58.4,67.8"..white..")\nDie Graumähnenkrone droppt von Genn Graumähne "..yellow.."[8]"..white..", letzter Boss oben auf dem Turm.",
    Prequest = "Ein Wolf unter Schafen -> Eine Kette nach der anderen -> Auf der Spur der Legende -> Zurück nach Rabenruh -> Schwaches Licht in der Dunkelheit -> Der niederträchtigste aller Männer -> Ein Handel am Scheideweg -> Angriff auf Wachfeste Freiblick",
    Rewards = {
        Text = "Belohnung: 1 oder 2 oder 3 und 4",
        { id = 61497 }, --Ravenwood Belt Waist, Mail
        { id = 61498 }, --Signet of Gilneas Ring
        { id = 61499 }, --Ravenshire Gloves Hands, Leather
        { id = 61369 }, --Ravenshire Tabard Tabard
    }
}
kQuestInstanceData.GilneasCity.Alliance[7] = {
    Title = "Manuskript über Hydromantie II",
    Id = 41114,
    Level = 45,
    Attain = 38,
    Aim = "Holt das Manuskript über Hydromantie II für Magus Hallister auf der Theramore-Insel in Düstermarschen.",
    Location = "Magus Hallister (Düstermarschen - Theramore, central Tower)",
    Note = red.."Nur Magier"..white.." Magier-Theramore-Teleport-Quest.\nDas Manuskript über Hydromantie II befindet sich im Gebäude "..yellow.."[b]"..white..", geht rechts, auf der Kommode (Südseite).",
    Prequest = "Dämonensiegel der Mannoroc",
    Rewards = {
        Text = "Belohnung: ",
        { id = 92001 }, --Tome of Teleportation: Theramore Spell
    }
}
kQuestInstanceData.GilneasCity.Alliance[8] = {
    Title = "Im schlechten Glauben zurückgelassen",
    Id = 41285,
    Level = 44,
    Attain = 40,
    Aim = "Kehrt mit der Halskette des Abenteurers zu Talvash del Kissel in Eisenschmiede zurück.",
    Location = "Talvash del Kissel (Eisenschmiede - Das mystische Viertel "..yellow.."36,3"..white..")",
    Note = red.."Nur Juweliere: Goldschmied"..white.." Vorquest von Mayva Aussicht (Eisenschmiede - Halle der Erforscher "..yellow.."60,24"..white..").\nDustivan Schwarzkutte "..yellow.."[4]"..white.." lässt den Angelaufenen Zitrinenhalsband fallen.",
    Prequest = "Meisterschaft im Goldschmieden",
    Rewards = {
        Text = "Belohnung: ",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Alliance[9] = {
    Title = "Blut von Vorgendor",
    Id = 41378,
    Level = 60,
    Attain = 60,
    Aim = "Sammelt Worgenblut für Fandral Hirschhelm. Er benötigt Blutproben aus Karazhan, Gilneas City und Burg Schattenfang.",
    Location = "Erzdruide Fandral Hirschhaupt (Darnassus - Die Enklave des Cenarius "..yellow.."35,9"..white..").",
    Note = "[Dunkelfellblut] droppt von Worgen."..white.."\n[Sichel der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Sense der Göttin",
    Folgequest = "Wolfsblut",
}
kQuestInstanceData.GilneasCity.Alliance[10] = {
    Title = "Gilnearischer Pricolich",
    Id = 41385,
    Level = 60,
    Attain = 60,
    Aim = "Wagt Euch nach Gilneas City und sucht nach dem Aufenthaltsort des zweiten Pricoliken.",
    Location = "Erzdruide Traumwind (Hyjal - Nordanaar "..yellow.."85, 30"..white..")", --61512
    Note = "[Celias Tagebuch] liegt in der Nähe von "..yellow.."[7]"..white..".".."[Sichel der Göttin] – Vorquest beginnt bei Die Sichel von Elune, Drop von Fürst Schwarzstahl II "..yellow.."(Obere Hallen von Karazhan [5]).",
    Prequest = "Pricolich Knorrmond",
    Folgequest = "Pricolich Lykan",
}
kQuestInstanceData.GilneasCity.Horde[1] = kQuestInstanceData.GilneasCity.Alliance[1]
kQuestInstanceData.GilneasCity.Horde[2] = {
    Title = "Angelegenheiten von Ebenwasser",
    Id = 40979,
    Level = 45,
    Attain = 35,
    Aim = "Tötet Dustivan Schwarzkutte und holt die Ebenmeer-Urkunde für Joshua Ebenmeer auf der Ebenmeer-Farm in Gilneas.",
    Location = "Joshua Ebenmeer (Gilneas - Ebenmeer-Hof "..yellow.."[49.5,31.1]"..white.."). Beim Betreten der Gilneas-Tore folgt dem Berg links (Osten), auf dem Feld mit Windmühlen findet Ihr Joshua Ebenmeer.",
    Note = "Vorquest 'Fledermausplage in Ebenwasser' und 'Worgenplage in Eben wasser'.\nDustivan Schwarzkutte "..yellow.."[4]"..white.." lässt die Ebenmeer-Urkunde fallen.",
    Prequest = "Fledermausplage in Ebenwasser -> Worgenplage in Ebenwasser",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61627 }, --Ebonmere Reaver One-Hand, Axe
        { id = 61628 }, --Clutch of Joshua Waist, Cloth
        { id = 61629 }, --Farmer's Musket Gun
        { id = 61630 }, --Ebonmere Vambracers Wrist, Plate
    }
}
kQuestInstanceData.GilneasCity.Horde[3] = {
    Title = "Königlicher Raubzug",
    Id = 41113,
    Level = 45,
    Attain = 40,
    Aim = "Stehlt das Gemälde aus der Bibliothek in Gilneas City und kehrt zu Luke Agamand im Schwarzdorn-Lager in Gilneas zurück.",
    Location = "Luke Agamand (Gilneas - Schwarzdorn's Lager "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "Das Porträt von Mia Graumähne befindet sich im Gebäude "..yellow.."[b]"..white..", geht links, an der Wand (nordwestliche Ecke).",
}
kQuestInstanceData.GilneasCity.Horde[4] = {
    Title = "Das Böse hat mich dazu gebracht",
    Id = 40881,
    Level = 46,
    Attain = 35,
    Aim = "Findet 'Über die Kräfte des Blutes' in Gilneas City und kehrt dann zu Orvan Dunkelauge in den Ruinen von Greyshire in Gilneas zurück.",
    Location = "Orvan Dunkelauge (Gilneas - Ruinen von Greyshire "..yellow.."[31.3,47.0]"..white..")",
    Note = red.."Die Questreihe beginnt bei Todespirscherin Alynna (Gilneas Kirche von Stillwacht "..yellow.."[57.3,39.6]"..white..", innen) mit der Quest 'Tot bis zum Einbruch der Dunkelheit'.\n'Über die Kräfte des Blutes'-Buch auf dem Tisch hinter Regentenlady Celia Harlow und Regentenlord Mortimer Harlow, neben der Harlow-Familientruhe "..yellow.."[7]"..white.."\nIhr erhaltet die Belohnung nach Abschluss der nächsten Quest.",
    Prequest = "Tot bis zum Einbruch der Dunkelheit -> Alles, was wir brauchen, ist Blut -> Der Letzte der lebenden Toten -> Wir nehmen es von den Lebenden",
    Folgequest = "Blut für Blut",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61422 }, --Pure Bloodvial Pendant Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[5] = {
    Title = "Genn Graumähne muss sterben!",
    Id = 40849,
    Level = 49,
    Attain = 40,
    Aim = "Betretet Gilneas City und tötet Genn Graumähne, bringt dann seinen Kopf zu Schwarzdorn im Schwarzdorn-Lager in Gilneas.",
    Location = "Schwarzdorn (Gilneas - Schwarzdorn's Lager "..yellow.."[14.1,33.7]"..white..", camp at northwest corner shore.)",
    Note = "2 Questreihen müssen abgeschlossen sein, um diese Quest zu starten: 'Meldung bei Luke Agamand' und 'Meldung bei Livia Starkarm' bei Schwarzdorn.",
    Prequest = "'Meldung bei Luke Agamand' -> Raub in der Trockenfelsmine -> Meldung bei Livia Starkarm -> Treffen mit dem Infiltrator -> Qualitätszeit mit Schwarzdorn",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61353 }, --Blackthorn Gauntlets Hands, Leather
        { id = 61354 }, --Banshee's Tear Ring
        { id = 61355 }, --Dark Footpad Belt Waist, Mail
    }
}
kQuestInstanceData.GilneasCity.Horde[6] = {
    Title = "Der Graumähnestein",
    Id = 40996,
    Level = 47,
    Attain = 38,
    Aim = "Holt den Splitter der Mitternacht für Dunkelbischof Mordren in der Stillward-Kirche.",
    Location = "Dunkelbischof Mordren (Gilneas - Kirche von Stillwacht "..yellow.."57.7,39.6"..white..")",
    Note = "Die Questreihe beginnt mit der Quest 'Durch große Magie' bei Dunkelbischof Mordren.\nSplitter der Mitternacht befindet sich hinter dem letzten Boss Genn Graumähne "..yellow.."[8]"..white.."\nIhr erhaltet die Belohnung nach Abschluss der nächsten Quest.",
    Prequest = "Durch große Magie -> Das Zepter von Rabenwald -> Mächte jenseits"..yellow.."[Hügel der Klingenhauer]"..white..".", -- 40993, 40994, 40995",
    Folgequest = "Gabe des Dunkelbischofs",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61660 }, --Garalon's Might Two-Hand, Sword
        { id = 61661 }, --Varimathras' Cunning Staff
        { id = 61662 }, --Stillward Amulet Neck
    }
}
kQuestInstanceData.GilneasCity.Horde[7] = {
    Title = "Fremdes Wissen",
    Id = 41289,
    Level = 44,
    Attain = 34,
    Aim = "Sucht ein passendes Buch in Gilneas City und bringt es zu Jarkal Mossmeld in Kargath im Ödland.",
    Location = "Jarkal Moosblut (Ödland - Kargath "..yellow.."2,46"..white..").",
    Note = red.."Nur Juweliere: Goldschmied"..white.." Vorquest von Gulmire Rußturm (Unterstadt - Das Schurkenquartier "..yellow.."77,76"..white..").\n'Gilneanischer Schmuck: Ein Kompendium' (wo?) enthält Questgegenstand.",
    Prequest = "Meisterschaft im Goldschmieden",
    Rewards = {
        Text = "Belohnung: ",
        { id = 70134 }, --Plans: Alluring Citrine Choker Pattern
    }
}
kQuestInstanceData.GilneasCity.Horde[8] = {
    Title = "Der Wolf, die Alte und die Sense",
    Id = 41381,
    Level = 60,
    Attain = 60,
    Aim = "Sammelt Worgenblut für Magatha Grimmtotem. Sie benötigt Blutproben aus Karazhan, Gilneas City und Burg Schattenfang.",
    Location = "Magatha Grimmtotem (Donnerfels - Die Anhöhe der Ältesten "..yellow.."70,31"..white..")",
    Note = "[Dunkelfellblut] droppt von Worgen."..white.."\n[Sichel der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Sense der Göttin",
    Folgequest = "Wolfsblut",
}
kQuestInstanceData.GilneasCity.Horde[9] = {
    Title = "Gilnearischer Pricolich",
    Id = 41385,
    Level = 60,
    Attain = 60,
    Aim = "Wagt Euch nach Gilneas City und sucht nach dem Aufenthaltsort des zweiten Pricoliken.",
    Location = "Erzdruide Traumwind (Hyjal - Nordanaar "..yellow.."85, 30"..white..")", --61512
    Note = "[Celias Tagebuch] liegt in der Nähe von "..yellow.."[7]"..white.."\n[Sichel der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Pricolich Knorrmond",
    Folgequest = "Pricolich Lykan",
}

--------------- Untere Hallen von Karazhan ---------------
kQuestInstanceData.LowerKarazhan = {
    Story = "Die Unteren Karazhan-Hallen sind eine Raid-Instanz im Gebirgspass der Totenwinde. Karazhan, einst die hoch aufragende Festung des ehemaligen Hüters von Tirisfal, summt nun vor magischer Energie, während es auf einer mächtigen Leylinie thront. Seine längst vergessenen Korridore, von Staub bedeckt, sind zur Heimat verschiedener Kreaturen geworden, obwohl es scheint, dass nicht alle ihre Bewohner freiwillig gegangen sind. In den Tiefen der unteren Hallen bleibt Medivhs treuer Kastellan Moroes ein wachsamer Wächter. Wenn Ihr ihn beeindrucken könnt, gewährt er Euch vielleicht Zugang zu den oberen Stockwerken.",
    Caption = "Untere Hallen von Karazhan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.LowerKarazhan.Alliance[1] = {
    Title = "Angemessene Unterkunft",
    Id = 41083,
    Level = 60,
    Attain = 55,
    Aim = "Findet ein Bequemes Kissen für Ratsmann Kyleson in Karazhan.",
    Location = "Ratsmann Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "Ihr findet das Bequeme Kissen bei "..yellow.."(b)"..white.." in den Kisten.",
    Folgequest = "Ein Trank zum Schlafen",
}
kQuestInstanceData.LowerKarazhan.Alliance[2] = {
    Title = "Ein Trank zum Schlafen",
    Id = 41084,
    Level = 60,
    Attain = 55,
    Aim = "Sprecht mit jemandem, der vielleicht weiß, wie man Wein für Ratsmann Kyleson beschaffen kann.",
    Location = "Ratsmann Kyleson ("..yellow.."[Karazhan - c]"..white..")",
    Note = "Gebt die Quest bei Der Koch nahe "..yellow.."[Karazhan - e]"..white.." ab.",
    Prequest = "Angemessene Unterkunft",
    Folgequest = "Geisterwein",
}
kQuestInstanceData.LowerKarazhan.Alliance[3] = {
    Title = "Geisterwein",
    Id = 41085,
    Level = 60,
    Attain = 55,
    Aim = "Sammelt 3 Essenz des Todes, 5 Fläschchen Portwein und einen Geisterpilz für Der Koch in Karazhan.",
    Location = "Der Koch Nahe ("..yellow.."[Untere Hallen von Karazhan- e]"..white..")",
    Note = "Fläschchen Portwein wird von Alkoholhändlern verkauft. Alle Gegenstände können im Auktionshaus gekauft werden.",
    Prequest = "Ein Trank zum Schlafen",
    Folgequest = "Wein für Kyleson",
}
kQuestInstanceData.LowerKarazhan.Alliance[4] = {
    Title = "Wein für Kyleson",
    Id = 41086,
    Level = 60,
    Attain = 55,
    Location = "Der Koch Nahe ("..yellow.."[Untere Hallen von Karazhan- e]"..white..")",
    Note = "Liefert den Geisterwein an Ratsmann Kyleson "..yellow.."[Karazhan - c]"..white.." in Karazhan.",
    Prequest = "Geisterwein",
}
kQuestInstanceData.LowerKarazhan.Alliance[5] = {
    Title = "Der Schlüssel zu Karazhan I",
    Id = 40817,
    Level = 60,
    Attain = 58,
    Aim = "Hört Euch die Geschichte von Lord Ebonlocke an.",
    Location = "Lord Ebonlocke ("..yellow.."[Karazhan - d]"..white..")",
    Folgequest = "Der Schlüssel zu Karazhan II",
}
kQuestInstanceData.LowerKarazhan.Alliance[6] = {
    Title = "Der Schlüssel zu Karazhan II",
    Id = 40818,
    Level = 60,
    Attain = 58,
    Location = "Lord Ebonlocke ("..yellow.."[Karazhan - d]"..white..")",
    Note = "Tötet Moroes "..yellow.."[6]"..white.." und holt den Schlüssel zu den oberen Kammern. Moroes residiert in den Unteren Karazhan-Hallen. Bringt den Schlüssel zu Lord Ebonlocke zurück.",
    Prequest = "Der Schlüssel zu Karazhan I",
    Folgequest = "Der Schlüssel zu Karazhan III",
}
kQuestInstanceData.LowerKarazhan.Alliance[7] = {
    Title = "Der Schlüssel zu Karazhan III",
    Id = 40819,
    Level = 60,
    Attain = 58,
    Aim = "Findet jemanden vom Kirin Tor, der etwas über Vandol wissen könnte. Dalaran könnte ein guter Ort sein, um Eure Suche zu beginnen.",
    Location = "Der Koch Nahe ("..yellow.."[Untere Hallen von Karazhan- e]"..white..")",
    Note = "Gebt die Quest bei Erzmagier Ansirem Runenweber <Kirin Tor> (Alteracgebirge - Dalaran "..yellow.."[18.9,78.5]"..white..") ab.",
    Prequest = "Der Schlüssel zu Karazhan II",
    Folgequest = "Der Schlüssel zu Karazhan IV",
}
kQuestInstanceData.LowerKarazhan.Alliance[8] = {
    Title = "Gekritzelte Kochnotizen",
    Id = 40998,
    Level = 60,
    Attain = 55,
    Aim = "Findet jemanden, der vielleicht etwas über die Gekritzelten Kochnotizen weiß.",
    Location = "Gekritzelte Kochnotizen",
    Note = "Gebt die Quest bei Herzog Rothlen "..yellow.."[Karazhan - f]"..white.." auf dem Balkon neben Krallfürst Heulzahn "..yellow.."[4]"..white.." ab.",
    Folgequest = "Verloren und gefunden",
}
kQuestInstanceData.LowerKarazhan.Alliance[9] = {
    Title = "Verloren und gefunden",
    Id = 40999,
    Level = 60,
    Attain = 55,
    Aim = "Holt das Gravierte goldene Armband für Herzog Rothlen in Karazhan.",
    Location = "Herzog Rothlen "..yellow.."[Karazhan - f]"..white..".",
    Note = "Ihr findet das 'Gravierte goldene Armband' in der Truhe bei "..yellow.."[Karazhan - a]"..white..".",
    Prequest = "Gekritzelte Kochnotizen",
    Folgequest = "Brosche der Familie Rothlen",
}
kQuestInstanceData.LowerKarazhan.Alliance[10] = {
    Title = "Brosche der Familie Rothlen",
    Id = 41000,
    Level = 60,
    Attain = 55,
    Aim = "Holt die Brosche der Familie Rothlen aus Stratholme für Herzog Rothlen in Karazhan.",
    Location = "Herzog Rothlen (Karazhan "..yellow.."[Karazhan - f]"..white..")",
    Note = "Brosche der Familie Rothlen neben "..yellow.."[Stratholme]"..white.." Boss Der Unverziehene "..yellow.."[4]"..white.." in der Truhe.",
    Prequest = "Verloren und gefunden",
    Folgequest = "Das geheime Rezept",
}
kQuestInstanceData.LowerKarazhan.Alliance[11] = {
    Title = "Das geheime Rezept",
    Id = 41001,
    Level = 60,
    Attain = 55,
    Location = "Herzog Rothlen (Karazhan "..yellow.."[Karazhan - f]"..white..")",
    Note = "Sprecht mit 'Der Koch' "..yellow.."[nahe e]"..white.." in den Unteren Karazhan-Hallen.",
    Prequest = "Brosche der Familie Rothlen",
    Folgequest = "Der Türhüter von Karazhan",
}
kQuestInstanceData.LowerKarazhan.Alliance[12] = {
    Title = "Der Türhüter von Karazhan",
    Id = 41002,
    Level = 60,
    Attain = 55,
    Aim = "Sprecht mit Türsteher Montigue in Karazhan.",
    Location = "Der Koch Nahe ("..yellow.."[Untere Hallen von Karazhan- e]"..white..")",
    Note = "Türsteher Montigue"..blue.." "..white.."am Anfang des Dungeons vor der Treppe.",
    Prequest = "Das geheime Rezept",
    Folgequest = "Sturm auf Karazhan",
}
kQuestInstanceData.LowerKarazhan.Alliance[13] = {
    Title = "Sturm auf Karazhan",
    Id = 41003,
    Level = 60,
    Attain = 55,
    Aim = "Bringt 10 Essenz des Untods, 10 Lebensessenz und 25 Gold zu Türsteher Montique in Karazhan.",
    Location = "Türsteher Montigue"..blue.." "..white.."am Anfang des Dungeons vor der Treppe.",
    Note = "Alle können im Auktionshaus gekauft werden. Lebende 10-15 Silber jeweils, Untod - 1-3 Gold jeweils.",
    Prequest = "Der Türhüter von Karazhan",
    Folgequest = "Le Fishe au Chocolat",
}
kQuestInstanceData.LowerKarazhan.Alliance[14] = {
    Title = "Le Fishe au Chocolat",
    Id = 41004,
    Level = 60,
    Attain = 55,
    Location = "Türsteher Montigue"..blue.." "..white.."am Anfang des Dungeons vor der Treppe.",
    Note = "Bringt den Sturm auf Karazhan zu Der Koch nahe "..yellow.."[e]"..white.." in den Unteren Karazhan-Hallen.",
    Prequest = "Sturm auf Karazhan",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61666 }, --Recipe: Le Fishe Au Chocolat Pattern
        { id = 84040 }, --Le Fishe Au Chocolat Pattern
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[15] = {
    Title = "Sense der Göttin",
    Id = 41062,
    Level = 60,
    Attain = 60,
    Aim = "Tötet Krallfürst Heulzahn und meldet Euch bei Lord Ebonlocke.",
    Location = "Die Sichel von Elune "..yellow.."[5]"..white..".",
    Note = red.."Nur Magier, Priester, Hexenmeister, Druiden"..white..":\nDie Questreihe beginnt mit legendärem Gegenstand 'Die Sichel von Elune', der von Lord Schwarzwald II "..yellow.."[5]"..white.." droppt (geringe Chance).\nQuestreihe für legendären Schmuck.",
    Folgequest = "Sense der Göttin",
}
kQuestInstanceData.LowerKarazhan.Alliance[16] = {
    Title = "Spende an die Kirche",
    Id = 41078,
    Level = 60,
    Attain = 55,
    Aim = "Sammelt 15 Arkane Essenz, 20 Illusionsstaub und 10 Große ewige Essenz für Hierophant Nerseus bei der Kirche außerhalb von Karazhan.",
    Location = "Hierophant Nerseus (Gebirgspass der Totenwinde, vor der Kirche neben Karazhan "..yellow.."[40.3,77.2]"..white..")",
    Note = "15x Arkane Essenz - zufällige Trash-Beute;\n20x Illusionsstaub - Verzauberer oder Auktionshaus;\n10x Große ewige Essenz - Verzauberer oder Auktionshaus;\nNach Abschluss dieser Quest könnt Ihr eine Quest für Kopf-/Bein-Verzauberungen bekommen. Für jede davon benötigt Ihr:\n1x Überladene Leyenergie - zufälliger seltener Gegenstand von Trash/Boss in Karazhan;\n6x Arkane Essenz - zufällige Trash-Beute.",
    Folgequest = "Anrufung der Zerschmetterung, Anrufung des größeren Schutzes, Anrufung des erweiterten Geistes, Anrufung der größeren arkanen Stärke",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 92005 }, --Invocation of Shattering Enchant
        { id = 92006 }, --Invocation of Greater Protection Enchant
        { id = 92007 }, --Invocation of Expansive Mind Enchant
        { id = 92008 }, --Invocation of Greater Arcane Fortitude Enchant
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[17] = {
    Title = "Komisch große Kerze",
    Id = 41344,
    Level = 61,
    Attain = 60,
    Aim = "Holt die Komisch große Kerze von Grizikil und kehrt zu Großbart in Obere Karazhan zurück.",
    Location = "Türsteher Montigue"..blue.." "..white.."am Anfang des Dungeons vor der Treppe.",
    Note = red.."Nur Magier"..white..": Grizikil "..yellow.."[3]"..white.." lässt 'Komisch große Kerze' fallen.\nDie Questreihe beginnt bei Großbart im "..yellow.."[Turm von Karazhan]"..white..".",
    Prequest = "Ich bin keine Ratte",
    Rewards = {
        Text = "Belohnung: ",
        { id = 92025 }, --Tome of Polymorph: Rodent Spell
    }
}
kQuestInstanceData.LowerKarazhan.Alliance[18] = {
    Title = "Blut von Vorgendor",
    Id = 41381,
    Level = 60,
    Attain = 60,
    Aim = "Sammelt Worgenblut für Fandral Hirschhelm. Er benötigt Blutproben aus Karazhan, Gilneas City und Burg Schattenfang.",
    Location = "Erzdruide Fandral Hirschhaupt (Darnassus - Die Enklave des Cenarius "..yellow.."35,9"..white..").",
    Note = "[Schattenfluchblut] droppt von Worgen."..white.."\n[Sichel der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Sense der Göttin",
    Folgequest = "Wolfsblut",
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
        Aim = "Sammelt Worgenblut für Fandral Hirschhelm. Er benötigt Blutproben aus Karazhan, Gilneas City und Burg Schattenfang.",
        Note = "Gebt die Quest bei Bethor Eismacht (Unterstadt - Das Magierviertel "..yellow.."[84.1,17.5]"..white..", Magierlehrer-Zone) ab.",
    }
)
kQuestInstanceData.LowerKarazhan.Horde[18] = createInheritedQuest(
    kQuestInstanceData.LowerKarazhan.Alliance[18],
    {
        Title = "Der Wolf, die Alte und die Sense",
        Aim = "Sammelt Worgenblut für Magatha Grimmtotem. Sie benötigt Blutproben aus Karazhan, Gilneas City und Burg Schattenfang.",
        Location = "Magatha Grimmtotem (Donnerfels - Die Anhöhe der Ältesten "..yellow.."70,31"..white..")",
    }
)

--------------- Emerald Sanctum ---------------
kQuestInstanceData.EmeraldSanctum = {
    Story = "Das Smaragdsanktum ist eine Raid-Instanz in Hyjal. Ein Nebel der Verderbnis ist über den Smaragdgrünen Traum hereingebrochen und verdreht die Moral und Absichten selbst der edelsten und reinsten. Der korrumpierte Erwecker bereitet sich darauf vor, einen verfrühten Erweckungsruf auszusenden; wenn er nicht aufgehalten wird, werden seine Verwandten erwachen und in einem rasenden Amoklauf über Azeroth ziehen.",
    Caption = "Smaragdsanktum",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.EmeraldSanctum.Alliance[1] = {
    Title = "Glimmende Traumessenz",
    Id = 40905,
    Level = 60,
    Attain = 55,
    Aim = "Bringt die Schwelende Traumessenz zu Erzdruide Traumwind in Nordanaar in Hyjal.",
    Location = "Glimmende Traumessenz [2]",
    Note = red.."Nur Druiden"..white..": Erzdruide Traumwind ist bei (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Nur eine Person im Raid kann diesen Gegenstand plündern und die Quest kann nur einmal gemacht werden.\n\nDie aufgelisteten Belohnungen sind für die Folgequest.",
    Folgequest = "Geläuterte Traumessenz",
    Rewards = {
        Text = "Belohnung: ",
        { id = 61445 }, --Purified Emerald Essence Pattern
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[2] = {
    Title = "Kopf von Solnius",
    Id = 40963,
    Level = 60,
    Attain = 58,
    Aim = "Bringt den Kopf von Solnius zu Ralathius in Nordanaar in Hyjal.",
    Location = "Kopf von Solnius [2]",
    Note = "Ralathius ist bei (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Nur eine Person im Raid kann diesen Gegenstand plündern und die Quest kann nur einmal gemacht werden.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 61195 }, --Ring of Nordrassil Ring
        { id = 61194 }, --The Heart of Dreams Neck
        { id = 61193 }, --Verdant Eye Necklace Trinket
    }
}
kQuestInstanceData.EmeraldSanctum.Alliance[3] = {
    Title = "Erennius’ Klaue",
    Id = 41038,
    Level = 60,
    Attain = 55,
    Aim = "Bringt die Klaue von Erennius zu jemandem, der sie nützlich finden könnte.",
    Location = "Klaue von Erennius [1]",
    Note = "Ralathius ist bei (Hyjal - Nordanaar "..yellow.."85,30"..white.."). Nur eine Person im Raid kann diesen Gegenstand plündern und die Quest kann nur einmal gemacht werden.",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
    Story = "Der Turm von Karazhan ist eine Raid-Instanz im Gebirgspass der Totenwinde. Karazhan, einst die hoch aufragende Festung des ehemaligen Hüters von Tirisfal, summt nun vor magischer Energie, während es auf einer mächtigen Leylinie thront. Seine längst vergessenen Korridore, von Staub bedeckt, sind zur Heimat verschiedener Kreaturen geworden, obwohl es scheint, dass nicht alle ihre Bewohner freiwillig gegangen sind.",
    Caption = "Turm von Karazhan",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.TowerofKarazhan.Alliance[1] = {
    Title = "Das Szepter Medivhs",
    Id = 41369,
    Level = 60,
    Attain = 60,
    Aim = "Um den Zepterstab von Medivh wiederherzustellen, braucht Anelace die Hellsichtige bei Morgans Grund im Gebirgspass der Totenwinde eine große Menge arkaner Energie.",
    Location = "Anelace die Hellseherin (Gebirgspass der Totenwinde - Morgans Grund "..yellow.."41.2,79.2"..white..")",
    Note = "Obsidianstab "..yellow.."Untere Karazhan-Hallen [e]"..white.." Kosmischer Rückstand droppt von "..yellow.."[3]"..white.."\nDie Bindung von Xanthar Vorquest beginnt bei Hanvar der Rechtschaffene (Gebirgspass der Totenwinde - Morgans Grund "..yellow.."40.9, 79.3"..white.."), Wein für Kyleson Vorquest beginnt bei Der Koch "..yellow.."(Untere Karazhan-Hallen [e])"..white.."",
    Prequest = "Wein für Kyleson, Die Bindung von Xanthar",
    Folgequest = "Relikt von Tirisfal",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41413 }, --Scepter Rod of Medivh Quest Item
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[2] = {
    Title = "Relikt von Tirisfal",
    Id = 41370,
    Level = 60,
    Attain = 60,
    Aim = "Ein Echo von Medivh ist notwendig, um das Zepter von Medivh damit zu erfüllen. Bringt es zu Anelace der Hellsichtigen bei Morgans Grund außerhalb von Karazhan.",
    Location = "Anelace die Hellseherin (Gebirgspass der Totenwinde - Morgans Grund "..yellow.."41.2,79.2"..white..")",
    Note = "Droppt von "..yellow.."Echo von Medivh [4]"..white.."\nKhadgars Tagebuch [?] startet diese Questreihe.\nBelohnung von der letzten Quest in der Questreihe.\nSanv K'la (Sümpfe des Elends "..yellow.."25, 30"..white..") startet die Sanv-Talisman-Questreihe.",
    Prequest = "Brut von Thanlar -> Die Wiederherstellung",
    Folgequest = "Der Sanv-Talisman -> Um einen Gefallen gebeten -> Medivhs überweltliches Szepter -> Ein Pfad eröffnet",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41415, desc = "Open Portal" }, --The Scepter of Medivh Quest Item
    }
}
kQuestInstanceData.TowerofKarazhan.Alliance[3] = {
    Title = "Ich bin keine Ratte",
    Id = 41343,
    Level = 61,
    Attain = 60,
    Aim = "Sprecht mit Türsteher Montigue in den Unteren Karazhan-Hallen.",
    Location = "Großbart (Turm von Karazhan "..yellow.."0, 0"..white..")",
    Note = red.."Nur Magier"..white..": Türsteher Montigue in den Unteren Karazhan-Hallen am Anfang des Dungeons vor der Treppe.",
    Folgequest = "Komisch große Kerze",
}
kQuestInstanceData.TowerofKarazhan.Alliance[4] = {
    Title = "Die Majestät des Kochs",
    Id = 41373,
    Level = 60,
    Attain = 60,
    Aim = "Findet Der Koch in den Unteren Karazhan-Hallen.",
    Location = "Rezepte von Kezan (Turm von Karazhan "..yellow.."nahe [1]"..white..")",
    Note = "Der Koch nahe ("..yellow.."[Untere Karazhan-Hallen - e]"..white..").\nEine Quest, um ein Kochrezept zu erhalten.",
    Folgequest = "Keine Ehre unter Köchen",
}
kQuestInstanceData.TowerofKarazhan.Alliance[5] = {
    Title = "Kalt ist die Nacht",
    Id = 41353,
    Level = 62,
    Attain = 60,
    Aim = "Untersucht die Mysterien des Verzauberten Amethysts.",
    Location = "Enchanted Amethyst (Turm von Karazhan drop "..yellow.."[2] "..white.."boss)",
    Note = "Quest line continues at Gewölbe von Sturmwind as "..yellow.."[Der Feind lauert]"..white.." quest.",
    Folgequest = "Vom Mond umarmt",
}
kQuestInstanceData.TowerofKarazhan.Alliance[6] = {
    Title = "Eine Studie über magische Bäume",
    Id = 41375,
    Level = 61,
    Attain = 60,
    Aim = "Reist nach Düsterbruch und sucht Wissenshüter Lydros.",
    Location = "der Uralten und Baumschreiter (Turm von Karazhan "..yellow.."nahe []"..white..")",
    Note = red.."Nur Druiden"..white..": Wissenshüter Lydros (Düsterbruch - West oder Nord "..yellow.."[1] Bibliothek"..white..")\nQuestreihe für [Glyphe des arkanen Baumschreters] in Düsterbruch Ost.",
    Folgequest = "Warpbaum einwickeln",
}
kQuestInstanceData.TowerofKarazhan.Alliance[7] = {
    Title = "Sense der Göttin",
    Id = 41087,
    Level = 60,
    Attain = 60,
    Aim = "Tötet Krallfürst Heulzahn und meldet Euch bei Lord Ebonlocke.",
    Location = "Erzdruide Traumwind (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "Vorgendor: Mythen aus der Blutdimension (nahe Eingang) enthält Questgegenstand.\n"..white.."[Sichel der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Sense der Göttin",
    Folgequest = "Sense der Göttin",
}
kQuestInstanceData.TowerofKarazhan.Alliance[8] = {
    Title = "Pricolich Knorrmond",
    Id = 41384,
    Level = 60,
    Attain = 60,
    Aim = "Tötet Hüter Knorrmond. Er ist in den Oberen Kammern von Karazhan zu finden.",
    Location = "Erzdruide Traumwind (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "Müsst "..yellow.."Hüter Knorrmond [1]"..white.." töten.\n[Sichel der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white..".",
    Prequest = "Sense der Göttin -> Weisheit von Ur",
    Folgequest = "Gilnearischer Pricolich",
}
kQuestInstanceData.TowerofKarazhan.Alliance[9] = {
    Title = "Sense der Göttin",
    Id = 41394,
    Level = 60,
    Attain = 60,
    Aim = "Tötet Krallfürst Heulzahn und meldet Euch bei Lord Ebonlocke.",
    Location = "Erzdruide Traumwind (Hyjal - Nordanaar "..yellow.."85, 30"..white..")",
    Note = "[Seele eines Schreckensherren] droppt von "..yellow.."Mephistroth [8]"..white.."\n[Sichel der Göttin] Vorquest beginnt bei Die Sichel von Elune, droppt von Fürst Schwarzstahl II "..yellow.."(Untere Karazhan-Hallen [5])"..white.."\nMondstoff von Schneiderei, Ewiger Traumsteinsplitter von Verzauberung.",
    Prequest = "Sense der Göttin -> Pricolich Lykan",
    Folgequest = "Die Macht der Göttin",
    Rewards = {
        Text = "Belohnung: ",
        { id = 55505 }, --The Scythe of Elune Trinket
    }
}
for i = 1, 9 do
    kQuestInstanceData.TowerofKarazhan.Horde[i] = kQuestInstanceData.TowerofKarazhan.Alliance[i]
end

--------------- Dragonmaw Retreat ---------------
kQuestInstanceData.DragonmawRetreat = {
    Story = "Drachenmal-Zuflucht ist ein Instanzdungeon in den Sumpfland. Fragmente einer älteren, aber unbekannten Zwergenzivilisation, diese Höhlen wurden als Teil der Minennetzwerke von Grimfang genutzt. Seit ihrer zweiten Aufgabe haben die Drachenmal diese vergessenen Netzwerke in eine Operationsbasis verwandelt. Nun im Besitz eines Splitters der Dämonenseele werden sie vor nichts zurückschrecken, um die Sumpfland und die Grimweiten mit Hilfe ihrer Armee verzauberter roter Drachen zurückzuerobern.",
    Caption = "Drachenmal Zuflucht",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.DragonmawRetreat.Alliance[1] = {
    Title = "Sockel der Einheit",
    Id = 41774,
    Level = 30,
    Attain = 25,
    Aim = "Das Podest der Einheit steht ungebrochen und frei von ernsthaften Schäden.",
    Location = "Sockel der Einheit (Drachenmal Zuflucht "..yellow.."35,93"..white..")",
    Note = "Podest nahe "..yellow.."[5]"..white.."\n'Fragment von Algoron' droppt von "..yellow.."[3]"..white.."\n'Fragment von Dathronag' befindet sich in 'Truhe von Dathronag'."..yellow.."[a]",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41876, desc = "Schlüssel" }, --Lower Reserve Key
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[2] = {
    Title = "Gowlfangs Niederlage",
    Id = 41750,
    Level = 28,
    Attain = 20,
    Aim = "Rächt die Mooshaut-Gnolls, indem Ihr ihren ehemaligen Anführer Gowlfang in der Drachenmal-Zuflucht tötet. Kehrt dann zu Grimbite in ihrem Lager im Grünen Gürtel in den Sumpfland zurück.",
    Location = "Grimbit (Sumpfland - Der Grüne Gürtel "..yellow.."55,35"..white..")",
    Note = "'Gowlfangs Kopf' droppt von 'Gowlfang' "..yellow.."[1]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41830 }, --Mosshide Ring
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[3] = {
    Title = "Bergung des Steingolems",
    Id = 41749,
    Level = 28,
    Attain = 22,
    Aim = "Besorgt den Runenstein eines Bröckelnden Steingolem in der Drachenmal-Zuflucht und bringt ihn zu Kixxle an der Hauptstraße in den Sumpfland.",
    Location = "Kixxle (Sumpfland - Der Grüne Gürtel "..yellow.."50,38"..white..")",
    Note = "Steingolem-Runenstein droppt von Bröckelnder Steingolem nahe "..yellow.."[6]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41826 }, --Mosshide Cinch
        { id = 41827 }, --Fenwater Gloves
        { id = 41828 }, --Mosschain Bracers
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[4] = {
    Title = "Die Brut des Drachenmalklans",
    Id = 41751,
    Level = 34,
    Attain = 24,
    Aim = "Nydiszanz an den Drachenmal-Toren in den Sumpfland wünscht, seinen Bruder Searistrasz aus seiner Gefangenschaft durch die Drachenmal-Orks in der Drachenmal-Zuflucht zu befreien.",
    Location = "Nydiszanz (Sumpfland - Tore des Drachenmals "..yellow.."74,48"..white..")",
    Note = "Welplinge und Searistrasz "..yellow.."[8]",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 41831 }, --Runebound Dagger
        { id = 41832 }, --Flameweave Sash
        { id = 41833 }, --Cuffs of Burning Rage
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[5] = {
    Title = "Joch der Drachenkönigin",
    Id = 41785,
    Level = 30,
    Attain = 24,
    Aim = "Durchsucht die Sumpfland nach einem roten Drachen, der bereit ist, Euch anzuhören.",
    Location = "Splitter der Dämonenseele (Drachenmal-Zuflucht - "..yellow.."[10]"..white..")",
    Note = "Droppt von Zuluhed der Bekloppte "..yellow.."[10]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 58234 }, --Pendant of Ember Blood
        { id = 58235 }, --"Pendant of Ember Blessing
        { id = 58236 }, --Pendant of Ember Hatred
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[6] = {
    Title = "Brief von Korlag Unheilslied",
    Id = 41657,
    Level = 35,
    Attain = 30,
    Aim = "Bringt den Brief zu jemandem mit hoher Autorität in den Grimweiten.",
    Location = "Brief von Korlag Unheilslied (Drachenmal Zuflucht - Zuluhed der Geschlagene "..yellow.."[10]"..white..")",
    Note = "Abgabe bei 'Magistrat Hurdam Hartfaust' in 'Düsterweiten' "..yellow.."51, 58"..white.."".."\nIhr erhaltet die Belohnung, wenn ihr die nächste Quest abschließt. Ihr müsst 'Kommandant Korlag Doomsong' in den Grimmen Weiten - Zarm'Geths Festung "..yellow.."56, 11",
    Folgequest = "Drachenmal Vernichtung",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 41713 }, -- Doomsong Cuffs
        { id = 41714 }, -- Sash of Zarm'geth
        { id = 41715 }, -- Legging's of Geth'kar
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[7] = {
    Title = "Den Drachenmalklan zerschmettern",
    Id = 41756,
    Level = 29,
    Attain = 21,
    Aim = "Tötet Drachenmal-Veteranen in der Drachenmal-Zuflucht und kehrt zu Kapitän Grimmfaust in Menethilhafen zurück.",
    Location = "Hauptmann Starkfaust (Sumpfland - Hafen von Menethil - "..yellow.."10, 58"..white..")",
    Note = "'Veteran des Drachenmalklans' Nahe "..yellow.."[4, 6 und 8]",
}
kQuestInstanceData.DragonmawRetreat.Alliance[8] = {
    Title = "Schwarzherz Untergang",
    Id = 41757,
    Level = 31,
    Attain = 23,
    Aim = "Bringt Kapitän Grimmfaust in Menethilhafen den Kopf von Oberanführer Schwarzherz.",
    Location = "Hauptmann Starkfaust (Sumpfland - Hafen von Menethil - "..yellow.."10, 58"..white..")",
    Note = "'Schwarzherz' Kopf' droppt von 'Oberanführer Schwarzherz' "..yellow.."[7]"..white..".",
    Prequest = "Sieg über Nek'rosh",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 41842 }, --Menethil Greaves
        { id = 41843 }, --Stoutheart Shawl
        { id = 41844 }, --Torwyll's Cuffs
    }
}
kQuestInstanceData.DragonmawRetreat.Alliance[9] = {
    Title = "Die Lüge der Rotbände",
    Id = 41754,
    Level = 28,
    Attain = 22,
    Aim = "Bringt die Rotmark-Tafel zu einem der Historiker in der Bibliothek in Eisenschmiede.",
    Location = "Rotbrand Tafel (Drachenmal Zuflucht "..yellow.."34,93"..white..")",
    Note = "Ihr erhaltet die Belohnung nach Abschluss der nächsten Quest.\nTafel nahe "..yellow.."[5]"..white..".",
    Folgequest = "Die Lüge der Rotbände",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
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
        Note = "Abgabe bei 'Kommandant Aggnash' in den Düsterweiten – Außenposten Zersplitterklinge – "..yellow.."60, 30"..white.."".."\nDu erhältst die Belohnung, wenn du die nächste Quest abschließt.\nDu musst 'Kommandant Korlag Verdammnislied' töten – Grimmige Weiten – Zarm'Geth Festung "..yellow.."56, 11"
    }
)
kQuestInstanceData.DragonmawRetreat.Horde[7] = {
    Title = "Höhlennetzextrakt",
    Id = 41752,
    Level = 27,
    Attain = 21,
    Aim = "Tötet die Höhlenweber-Brutmutter in der Drachenmal-Zuflucht und liefert ihren Giftsack an Okal in Hammerfall.",
    Location = "Okul (Arathihochland - Hammerfall "..yellow.."74, 34"..white..")",
    Note = "'Brutmutters Sack' droppt von 'Höhlenweber Brutmutter' "..yellow.."[2]"..white..".",
}
kQuestInstanceData.DragonmawRetreat.Horde[8] = {
    Title = "Ein endloses Feuer",
    Id = 41753,
    Level = 30,
    Attain = 24,
    Aim = "Holt die Ewige Flamme aus der Drachenmal-Zuflucht und bringt sie zu Shara Blazen in Tarrens Mühle.",
    Location = "Shara Flamm (Vorgebirge des Hügellandes - Tarrens Mühle "..yellow.."64, 21"..white..")",
    Note = "'Ewige Flamme' befindet sich nahe "..yellow.."[4]",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41836 }, --Ancient Flame Pendant
    }
}

--------------- Stormwrought Ruins ---------------
kQuestInstanceData.StormwroughtRuins = {
    Story = "Die Sturmgeschmiedeten Ruinen sind ein Instanzdungeon in Balor, innerhalb der Ruinen von Burg Sturmgeschmiedet. Eine uneinnehmbare Festung, einst Herzog Balors Zuhause und Machtsitz, liegt Burg Sturmgeschmiedet verlassen auf den von Wellen umtosten Klippen von Balor. Während des Ersten Krieges erobert, wurden alle ihre Bewohner brutal abgeschlachtet, und die weniger Glücklichen wurden gefangen genommen, um in abscheulichen Ritualen verwendet zu werden. Jahre später wurde diese verlassene Ruine nun wieder beansprucht, vom orkischen Sturmbrecher-Klan und ihren finsteren Oberherren des Schattenrats. Die nicht mehr makellosen Hallen der Burg beherbergen eine Menagerie von Horror und Verderbtheit, mit verweilenden Geistern, gewaltigen Dämonen und murmelnden Kultisten, die durch die pechschwarzen Hallen dieses schrecklichen Ortes schleichen.",
    Caption = "Ruine von Sturmschmied",
    Alliance = {},
    Horde = {}
}
kQuestInstanceData.StormwroughtRuins.Alliance[1] = {
    Title = "The Late Duke Balor",
    Id = 41814,
    Level = 34,
    Attain = 28,
    Aim = "Bringt die Krone von Balor zu Olmir Halfhorn zurück.",
    Location = "Olmir Halbhorn (Balor "..yellow.."30, 51"..white..")",
    Note = "'Krone von Balor' droppt von 'Herzog Balor der IV.' "..yellow.."[4]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 58261 }, --Drinking Halfhorn
        { id = 58262 }, --Enchanted Glass Kopis
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[2] = {
    Title = "Schädel und Gebein",
    Id = 41760,
    Level = 34,
    Attain = 28,
    Aim = "Betretet Burg Sturmgeschmiedet und holt den Balor-Siegelring für Lord Olivert Grahan auf seinem Anwesen im westlichen Balor.",
    Location = "Lord Olivert Grahan (Balor "..yellow.."36, 66"..white..")",
    Note = "'Balor-Siegelring' droppt von 'Herzog Balor der IV.' "..yellow.."[4]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 58073 }, --Grahan Family Seal
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[3] = {
    Title = "Die Toten klagen nicht",
    Id = 41844,
    Level = 34,
    Attain = 28,
    Aim = "Rikki Fizmask möchte, dass Ihr die Sturmgeschmiedeten Ruinen auf Balor plündert und zu ihr am Möwenflügel-Wrack zurückkehrt.",
    Location = "Rikki Zischmaske (Balor "..yellow.."29, 11"..white..")",
    Note = "'Balorianischer Schatz' droppt von 'Durchscheinende Gäste und Gefesselte Adlige' nahe "..yellow.."[4]"..white..".",
    Rewards = {
        Text = "Belohnung: ",
        { id = 58281 }, --Trusty Goblin Shiv
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[4] = {
    Title = "Der Wille von Balor",
    Id = 41845,
    Level = 38,
    Attain = 32,
    Aim = "Tötet die Sukkubus, die Arthurs Seele festhält, und bringt sie ihm im Thronsaal von Burg Sturmgeschmiedet zurück.",
    Location = "Kammermeister Arthur Vandris (Ruine von Sturmschmied "..yellow.."Nahe [4]"..white..")",
    Note = "'Kammermeister Arthurs Seelenfragment' droppt von 'Lady Drazare' "..yellow.."[10]"..white..".",
}
kQuestInstanceData.StormwroughtRuins.Alliance[5] = {
    Title = "Altertümer",
    Id = 41842,
    Level = 35,
    Attain = 29,
    Aim = "Holt 'Kompendium erfolgreichen Handels' in Burg Sturmgeschmiedet für Noppsy Spickerspan am SI:7-Außenposten auf Balor.",
    Location = "Noppsy Ritzfunken (Balor - Der SI:7 Außenposten "..yellow.."70, 77"..white..")",
    Note = "'Kompendium erfolgreichen Handels' droppt von 'Bibliothekar Theodorus' "..yellow.."[3]"..white..".",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 58279 }, --Antiquated Slasher
        { id = 58280 }, --Chainmail of Many Pockets
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[6] = {
    Title = "Attentäter in Ausbildung",
    Id = 41843,
    Level = 35,
    Attain = 29,
    Aim = "Dünnt die Befehlskette in den Sturmgeschmiedeten Ruinen aus und kehrt zu Nippsy Spickerspan im SI:7-Außenposten auf Balor zurück.",
    Location = "Nippsy Ritzfunken (Balor - Der SI:7 Außenposten "..yellow.."70, 78"..white..")",
    Note = "'Oronok Zerreißherz' "..yellow.."[1]"..white.."\n'Häuptling Sturmgesang' "..yellow.."[5]"..white.."\n'Sturmbrecher-Kampfmeister' nahe "..yellow.."[5]",
    Prequest = "Die Lage bewerten -> Noppsy Spickerspan -> Schreckliche Neuigkeiten -> Ins Wespennest",
}
kQuestInstanceData.StormwroughtRuins.Alliance[7] = {
    Title = "Herz der Dunkelheit",
    Id = 41787,
    Level = 38,
    Attain = 21,
    Aim = "Stoppt den Schattenrat in den Sturmgeschmiedeten Ruinen.",
    Location = "Verona Gillian (Balor - Der SI:7 Außenposten "..yellow.."70, 77"..white..")",
    Note = "'Ighal'for und Mergothid' "..yellow.."[11]",
    Prequest = "Die Lage bewerten -> Noppsy Spickerspan -> Schreckliche Neuigkeiten -> Ins Wespennest",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 58080 }, --Rufus' Trusty Tankard
        { id = 58081 }, --Kinrial's Scalpel
        { id = 58082 }, --Noppsy's Compendium
        { id = 58083 }, --Nippsy's Precision Rifle
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[8] = {
    Title = "Kristallklare Prägung",
    Id = 41879,
    Level = 38,
    Attain = 34,
    Aim = "Findet einen Sturmgeschmiedeten Kristall für Grukson Slatebeard in Slatebeards Schmiede.",
    Location = "Grukson Schieferbart (Düsterweiten - Die Finstersenke "..yellow.."56, 70"..white..")",
    Note = "'Sturmgeschmiedeter Kristall' befindet sich nahe "..yellow.."[9]",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41980 }, --Slatebeard Amulet
    }
}
kQuestInstanceData.StormwroughtRuins.Alliance[9] = {
    Title = "Alles, was bleibt",
    Id = 41840,
    Level = 38,
    Attain = 32,
    Aim = "Bringt das hölzerne Spielzeugschwert zu jemandem, der seinen Besitzer kannte. Ihr könntet Glück in Nordwind haben, wo das alles begann.",
    Location = "Graviertes Spielzeugschwert (Überreste der Unschuldigen - Sanktu m des Blutes "..yellow.."[12]"..white..")",
    Note = "Abgabe bei 'Judith Flenning' in Nordwind - Bernhain "..yellow.."50, 55"..white.."",
}
for i = 1, 4 do
    kQuestInstanceData.StormwroughtRuins.Horde[i] = kQuestInstanceData.StormwroughtRuins.Alliance[i]
end
kQuestInstanceData.StormwroughtRuins.Horde[5] = {
    Title = "Innocence Lost",
    Id = 41821,
    Level = 34,
    Attain = 28,
    Aim = "Tötet Überreste der Unschuldigen und kehrt zu O'jin am Sturmbrecher-Punkt zurück.",
    Location = "O'jin (Balor - Sturmbruchspitze "..yellow.."71, 46"..white..")",
    Note = "'Überreste der Unschuldigen' "..yellow.."[12]",
}
kQuestInstanceData.StormwroughtRuins.Horde[6] = {
    Title = "Mycellakos",
    Id = 41824,
    Level = 33,
    Attain = 27,
    Aim = "Tötet Mycellakos und bringt den Kern von Mycellakos zu Uda'pe Sungrass am Sturmbrecher-Punkt zurück.",
    Location = "Uda'pe Sonnengras (Balor - Sturmbruchspitze "..yellow.."71, 48"..white..")",
    Note = "Ihr erhaltet die Belohnung nach Abschluss der nächsten Quest.\n'Herz von Mycellakos' droppt von 'Mycellakos' "..yellow.."[8]"..white..".",
    Prequest = "Living Fungus",
    Folgequest = "Die Matrone wird es wissen",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 58268 }, --Left
        { id = 58269 }, --Right
        { id = 58270 }, --Totem of An'she
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[7] = {
    Title = "Die Macht von Uth'okk",
    Id = 41730,
    Level = 38,
    Attain = 30,
    Aim = "Tötet Oronok Zerreißherz und holt das Medaillon von Uth'okk aus den Sturmgeschmiedeten Ruinen für Fernseher Mothang am Zersplitterklinge-Posten in den Grimweiten.",
    Location = "Seher Mothang (Düsterweiten - Außenposten der Splitterklingen "..yellow.."59, 29"..white..")",
    Note = "Ihr erhaltet die Belohnung nach Abschluss der nächsten Quest.\n'Das Medaillon von Uth'okk' droppt von 'Oronok Zerreißherz' "..yellow.."[1]"..white..".",
    Prequest = "Gebannte Magie -> Natürliche Heilmittel -> Dunkle Essenz",
    Folgequest = "Das Ritual von Uth'okk",
    Rewards = {
        Text = "Belohnung: ",
        { id = 41798 }, --The Pendant of Uth'okk
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[8] = {
    Title = "Es kann nicht immer Regnen",
    Id = 41833,
    Level = 38,
    Attain = 32,
    Aim = "Tötet Dagar den Gefräßigen, Oronok Zerreißherz, Ighal'for und kehrt zu Kilrogg Deadauge am Sturmbrecher-Punkt zurück.",
    Location = "Kilrogg Totauge (Balor - Sturmbruchspitze "..yellow.."71, 47"..white..")",
    Note = "Ihr erhaltet die Belohnung nach Abschluss der nächsten Quest.\n'Oronok Zerreißherz' "..yellow.."[1]"..white.."\n'Dagar der Gefräßige' "..yellow.."[2]"..white.."\n'Ighal'for' "..yellow.."[11]"..white..".",
    Prequest = "Tief in den Minen -> Reine Gedanken -> Kolonie der Ameisen",
    Folgequest = "Ende des Sturms",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 58272 }, --Kor'kron Crown
        { id = 58273 }, --Voodoo Jerkin
        { id = 58274 }, --Totemic Headdress
    }
}
kQuestInstanceData.StormwroughtRuins.Horde[9] = {
    Title = "Artefakte der Dunklen Lady",
    Id = 41841,
    Level = 38,
    Attain = 32,
    Aim = "Liefert das Blutsteinmedaillon an Lady Sylvanas Windläufer in Unterstadt.",
    Location = "Broken Bloodstone Pendant (Ruine von Sturmschmied - Ighal'for "..yellow.."[11]"..white..")",
    Note = "Vorquest beginnt bei 'Magus Wordeen Leermacht' (Vorgebirge des Hügellandes - Tarrens Mühle "..yellow.."62, 21"..white..")",
    Prequest = "Gefängniseinbruch",
    Rewards = {
        Text = "Belohnung: Wählt eins aus",
        { id = 58277 }, --Lady Winter's Touch",
        { id = 58278 }, --Ring of Judgement
    }
}
--------------- Windhorn Canyon ---------------
kQuestInstanceData.WindhornCanyon = {
    Story = "Diese uralte Schlucht war die Heimat vieler Taurenstämme, die in der Vergangenheit um die Vorherrschaft über ihre fließenden Gewässer und den Schutz vor den Gefahren Kalimdors kämpften. Die Kulturen und Traditionen vieler haben in der Windhorn-Schlucht gelebt, was an den antiken Unterkünften zu sehen ist, die in die Bergseite gehauen wurden, bis zu den von den Tauren begehrten Relikten. Vor kurzem wurden die Windhorn-Tauren vertrieben und von den Grimmtotem vertrieben, die sie erobert und für sich beansprucht haben.",
    Caption = "Windhorn Canyon",
    Alliance = {},
    Horde = {}
}
--------------- Timbermaw Hold ---------------
kQuestInstanceData.TimbermawHold = {
    Story = "So alt wie Kalimdor selbst, ist dieses rätselhafte labyrinthische Netzwerk von Tunneln und Höhlen unter dem Berg Hyjal seit weit vor der Zerreißung die Heimat der Furbolgs. Seine Hallen sind unter den Stämmen heilig, ein Ort der Verehrung für ihre Ahnen, die Zwillingsgötter Ursoc und Ursol. Heutzutage jedoch entweichen nur Schwaden fauliger Dämpfe den verrotteten Höhlen und Flüstern über die Verehrung eines üblen Gottes hallen durch die Hügelklauenfeste...",
    Caption = "Holzschlundfeste",
    Alliance = {},
    Horde = {}
}
AtlasTW.Quest.DataBase = kQuestInstanceData
