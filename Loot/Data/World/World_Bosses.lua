-- World_Bosses.lua - Данные предметов с мировых боссов
-- Модульная структура данных для Atlas-TW

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.WorldData = AtlasTW.WorldData or {}

-- Подключаем ItemDB для создания предметов
local ItemDB = AtlasTW.ItemDB

-- Данные мировых боссов
AtlasTW.WorldData.WorldBosses = {
    -- Азурегос
    Azuregos = {
        name = "Azuregos",
        id = 6109,
        level = 62,
        zone = "Azshara",
        respawnTime = "4 days",
        faction = "neutral",
        items = {
            ItemDB.CreateSeparator("Эпические предметы", 6),
            ItemDB.CreateItem({
                id = 18704,
                name = "Mature Blue Dragon Sinew",
                icon = "INV_Misc_MonsterParts_03",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                dropRate = 100,
                source = "Azuregos",
                zone = "Azshara",
                notes = "Материал для лука охотника"
            }),
            ItemDB.CreateItem({
                id = 18202,
                name = "Eskhandar's Left Claw",
                icon = "INV_Gauntlets_05",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                slot = ItemDB.EQUIPMENT_SLOT.HANDS,
                armorType = ItemDB.ARMOR_TYPE.LEATHER,
                dropRate = 20,
                validClasses = {"ROGUE", "DRUID"},
                source = "Azuregos",
                zone = "Azshara"
            }),
            ItemDB.CreateItem({
                id = 18208,
                name = "Drape of Benediction",
                icon = "INV_Misc_Cape_11",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                slot = ItemDB.EQUIPMENT_SLOT.BACK,
                dropRate = 20,
                source = "Azuregos",
                zone = "Azshara"
            }),
            ItemDB.CreateItem({
                id = 18545,
                name = "Leggings of Arcane Supremacy",
                icon = "INV_Pants_08",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                slot = ItemDB.EQUIPMENT_SLOT.LEGS,
                armorType = ItemDB.ARMOR_TYPE.CLOTH,
                dropRate = 20,
                validClasses = {"MAGE", "WARLOCK", "PRIEST"},
                source = "Azuregos",
                zone = "Azshara"
            })
        }
    },

    -- Лорд Каззак
    LordKazzak = {
        name = "Lord Kazzak",
        id = 12397,
        level = 63,
        zone = "Blasted Lands",
        respawnTime = "3-7 days",
        faction = "neutral",
        items = {
            ItemDB.CreateSeparator("Эпические предметы", 6),
            ItemDB.CreateItem({
                id = 18204,
                name = "Eskhandar's Pelt",
                icon = "INV_Misc_Pelt_Bear_03",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                slot = ItemDB.EQUIPMENT_SLOT.BACK,
                dropRate = 20,
                source = "Lord Kazzak",
                zone = "Blasted Lands"
            }),
            ItemDB.CreateItem({
                id = 18203,
                name = "Eskhandar's Right Claw",
                icon = "INV_Gauntlets_05",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                slot = ItemDB.EQUIPMENT_SLOT.HANDS,
                armorType = ItemDB.ARMOR_TYPE.LEATHER,
                dropRate = 20,
                validClasses = {"ROGUE", "DRUID"},
                source = "Lord Kazzak",
                zone = "Blasted Lands"
            }),
            ItemDB.CreateItem({
                id = 18665,
                name = "The Eye of Shadow",
                icon = "INV_Misc_Eye_01",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                dropRate = 100,
                source = "Lord Kazzak",
                zone = "Blasted Lands",
                notes = "Материал для посоха жреца Benediction"
            })
        }
    },

    -- Изумрудные драконы
    EmeraldDragons = {
        name = "Emerald Dragons",
        description = "Четыре изумрудных дракона Кошмара",
        level = 62,
        respawnTime = "4 days",
        faction = "neutral",

        -- Эмерисс
        Emeriss = {
            name = "Emeriss",
            id = 14889,
            zone = "The Hinterlands",
            items = {
                ItemDB.CreateItem({
                    id = 20623,
                    name = "Circlet of Restless Dreams",
                    icon = "INV_Helmet_18",
                    quality = ItemDB.ITEM_QUALITY.EPIC,
                    slot = ItemDB.EQUIPMENT_SLOT.HEAD,
                    armorType = ItemDB.ARMOR_TYPE.CLOTH,
                    dropRate = 25,
                    validClasses = {"MAGE", "WARLOCK", "PRIEST"},
                    source = "Emeriss",
                    zone = "The Hinterlands"
                }),
                ItemDB.CreateItem({
                    id = 20624,
                    name = "Ring of the Unliving",
                    icon = "INV_Jewelry_Ring_15",
                    quality = ItemDB.ITEM_QUALITY.EPIC,
                    slot = ItemDB.EQUIPMENT_SLOT.RING,
                    dropRate = 25,
                    source = "Emeriss",
                    zone = "The Hinterlands"
                })
            }
        },

        -- Летон
        Lethon = {
            name = "Lethon",
            id = 14888,
            zone = "Ashenvale",
            items = {
                ItemDB.CreateItem({
                    id = 20625,
                    name = "Belt of the Dark Bog",
                    icon = "INV_Belt_12",
                    quality = ItemDB.ITEM_QUALITY.EPIC,
                    slot = ItemDB.EQUIPMENT_SLOT.WAIST,
                    armorType = ItemDB.ARMOR_TYPE.LEATHER,
                    dropRate = 25,
                    validClasses = {"ROGUE", "DRUID"},
                    source = "Lethon",
                    zone = "Ashenvale"
                })
            }
        },

        -- Общие предметы для всех драконов
        sharedItems = {
            ItemDB.CreateItem({
                id = 20579,
                name = "Green Dragonflight Insignia",
                icon = "INV_Jewelry_Talisman_10",
                quality = ItemDB.ITEM_QUALITY.EPIC,
                slot = ItemDB.EQUIPMENT_SLOT.TRINKET,
                dropRate = 100,
                source = "Emerald Dragons",
                zone = "Various",
                notes = "Выпадает с любого изумрудного дракона"
            })
        }
    }
}

-- Функция получения всех предметов с мировых боссов
function AtlasTW.WorldData.WorldBosses.GetAllItems()
    local allItems = {}

    for bossName, bossData in pairs(AtlasTW.WorldData.WorldBosses) do
        if type(bossData) == "table" and bossData.items then
            for i = 1, getn(bossData.items) do
                tinsert(allItems, bossData.items[i])
            end
        end
    end

    return allItems
end

-- Функция получения предметов конкретного босса
function AtlasTW.WorldData.WorldBosses.GetBossItems(bossName)
    local boss = AtlasTW.WorldData.WorldBosses[bossName]
    if boss and boss.items then
        return boss.items
    end
    return {}
end

-- Функция получения боссов по зоне
function AtlasTW.WorldData.WorldBosses.GetBossesByZone(zoneName)
    local bosses = {}

    for bossName, bossData in pairs(AtlasTW.WorldData.WorldBosses) do
        if type(bossData) == "table" and bossData.zone == zoneName then
            tinsert(bosses, bossData)
        end
    end

    return bosses
end

-- Функция получения информации о времени респауна
function AtlasTW.WorldData.WorldBosses.GetRespawnInfo(bossName)
    local boss = AtlasTW.WorldData.WorldBosses[bossName]
    if boss and boss.respawnTime then
        return {
            name = boss.name,
            zone = boss.zone,
            respawnTime = boss.respawnTime,
            level = boss.level
        }
    end
    return nil
end

-- Функция поиска предметов по названию
function AtlasTW.WorldData.WorldBosses.FindItemsByName(searchName)
    local allItems = AtlasTW.WorldData.WorldBosses.GetAllItems()
    local foundItems = {}

    searchName = strlower(searchName)

    for i = 1, getn(allItems) do
        local item = allItems[i]
        if item.name and strfind(strlower(item.name), searchName) then
            tinsert(foundItems, item)
        end
    end

    return foundItems
end

DEFAULT_CHAT_FRAME:AddMessage("WorldBosses: Данные загружены")