-- UIIntegration.lua - Пример интеграции новой системы с существующим UI
-- Показывает, как адаптировать существующий код для работы с модульной структурой

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}
AtlasTW.UIIntegration = {}

-- Константы для UI
local MAX_ITEMS_PER_PAGE = 30
local ITEMS_PER_ROW = 2

-- Кэш для UI элементов
local buttonCache = {}
local currentPage = 1
local currentCategory = "instances"
local currentSource = nil
local itemsData = {}

-- Функция создания кнопки предмета (улучшенная версия оригинальной)
local function CreateItemButton(index)
    local buttonName = "AtlasLootMenuItem_" .. index
    local button = _G[buttonName]

    if not button then
        -- Создаем новую кнопку, если она не существует
        button = CreateFrame("Button", buttonName, AtlasLootItemsFrame, "AtlasLootItemButtonTemplate")

        -- Позиционирование кнопки
        local row = floor((index - 1) / ITEMS_PER_ROW)
        local col = mod(index - 1, ITEMS_PER_ROW)

        button:SetPoint("TOPLEFT", AtlasLootItemsFrame, "TOPLEFT",
                       10 + col * 190, -10 - row * 20)

        -- Настройка размеров
        button:SetWidth(180)
        button:SetHeight(16)

        -- Создание текстур и текста
        button.icon = button:CreateTexture(nil, "ARTWORK")
        button.icon:SetPoint("LEFT", button, "LEFT", 2, 0)
        button.icon:SetWidth(14)
        button.icon:SetHeight(14)

        button.text = button:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
        button.text:SetPoint("LEFT", button.icon, "RIGHT", 4, 0)
        button.text:SetPoint("RIGHT", button, "RIGHT", -2, 0)
        button.text:SetJustifyH("LEFT")

        -- Обработчики событий
        button:SetScript("OnEnter", function()
            AtlasTW.UIIntegration.ShowItemTooltip(this)
        end)

        button:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        button:SetScript("OnClick", function()
            AtlasTW.UIIntegration.OnItemClick(this)
        end)

        -- Кэшируем кнопку
        buttonCache[index] = button
    end

    return button
end

-- Функция обновления отображения предметов (современная версия)
function AtlasTW.UIIntegration.UpdateItemDisplay(category, source, page)
    category = category or currentCategory
    source = source or currentSource
    page = page or currentPage

    -- Сохраняем текущие параметры
    currentCategory = category
    currentSource = source
    currentPage = page

    -- Получаем данные через адаптер
    local items = {}
    if AtlasTW.ModernAdapter then
        items = AtlasTW.ModernAdapter.GetLegacyData(category, source)
    else
        -- Fallback на старую систему
        items = AtlasLoot_Data[source] or {}
    end

    -- Сохраняем данные для пагинации
    itemsData = items

    -- Вычисляем диапазон для текущей страницы
    local startIndex = (page - 1) * MAX_ITEMS_PER_PAGE + 1
    local endIndex = min(startIndex + MAX_ITEMS_PER_PAGE - 1, getn(items))

    -- Скрываем все кнопки
    for i = 1, MAX_ITEMS_PER_PAGE do
        local button = _G["AtlasLootMenuItem_" .. i]
        if button then
            button:Hide()
        end
    end

    -- Отображаем предметы для текущей страницы
    local displayIndex = 1
    for i = startIndex, endIndex do
        local itemData = items[i]
        if itemData then
            local button = CreateItemButton(displayIndex)
            AtlasTW.UIIntegration.SetupItemButton(button, itemData, i)
            button:Show()
            displayIndex = displayIndex + 1
        end
    end

    -- Обновляем информацию о пагинации
    AtlasTW.UIIntegration.UpdatePaginationInfo(page, items)
end

-- Функция настройки кнопки предмета
function AtlasTW.UIIntegration.SetupItemButton(button, itemData, originalIndex)
    if not button or not itemData then
        return
    end

    -- Сохраняем данные предмета в кнопке
    button.itemData = itemData
    button.originalIndex = originalIndex

    -- Настройка иконки
    local iconTexture = itemData[2] or "INV_Misc_QuestionMark"
    button.icon:SetTexture("Interface\\Icons\\" .. iconTexture)

    -- Настройка текста
    local itemText = itemData[3] or "Unknown Item"

    -- Обработка цветового кодирования качества
    if string.find(itemText, "=q") then
        -- Извлекаем качество и название
        local _, _, quality, name = string.find(itemText, "=q(%d+)=(.+)")
        if quality and name then
            local qualityColor = AtlasTW.UIIntegration.GetQualityColor(tonumber(quality))
            button.text:SetText(qualityColor .. name .. "|r")
        else
            button.text:SetText(itemText)
        end
    else
        button.text:SetText(itemText)
    end

    -- Настройка состояния кнопки
    if itemData[1] == 0 then
        -- Это разделитель или заголовок
        button:SetNormalTexture("")
        button:SetHighlightTexture("")
        button:EnableMouse(false)
    else
        -- Это обычный предмет
        button:SetNormalTexture("Interface\\Buttons\\UI-Listbox-Highlight2")
        button:SetHighlightTexture("Interface\\Buttons\\UI-Listbox-Highlight")
        button:EnableMouse(true)
    end
end

-- Функция получения цвета качества предмета
function AtlasTW.UIIntegration.GetQualityColor(quality)
    local colors = {
        [0] = "|cff9d9d9d", -- Poor (серый)
        [1] = "|cffffffff", -- Common (белый)
        [2] = "|cff1eff00", -- Uncommon (зеленый)
        [3] = "|cff0070dd", -- Rare (синий)
        [4] = "|cffa335ee", -- Epic (фиолетовый)
        [5] = "|cffff8000", -- Legendary (оранжевый)
        [6] = "|cffe6cc80", -- Artifact (золотой)
        [7] = "|cff00ccff"  -- Heirloom (голубой)
    }

    return colors[quality] or "|cffffffff"
end

-- Функция отображения тултипа предмета
function AtlasTW.UIIntegration.ShowItemTooltip(button)
    if not button or not button.itemData then
        return
    end

    local itemData = button.itemData

    -- Если это разделитель, не показываем тултип
    if itemData[1] == 0 then
        return
    end

    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")

    -- Показываем стандартный тултип предмета
    if itemData[1] and itemData[1] > 0 then
        GameTooltip:SetHyperlink("item:" .. itemData[1])
    else
        -- Показываем кастомный тултип
        GameTooltip:SetText(itemData[3] or "Unknown Item")

        if itemData[4] and itemData[4] ~= "" then
            GameTooltip:AddLine(itemData[4], 1, 1, 1, true)
        end

        if itemData[5] and itemData[5] ~= "" then
            GameTooltip:AddLine("Drop Rate: " .. itemData[5], 0.8, 0.8, 0.8)
        end
    end

    GameTooltip:Show()
end

-- Функция обработки клика по предмету
function AtlasTW.UIIntegration.OnItemClick(button)
    if not button or not button.itemData then
        return
    end

    local itemData = button.itemData

    -- Если это разделитель, ничего не делаем
    if itemData[1] == 0 then
        return
    end

    -- Обработка клика с модификаторами
    if IsShiftKeyDown() then
        -- Shift+Click - вставить ссылку в чат
        if itemData[1] and itemData[1] > 0 then
            local itemLink = "item:" .. itemData[1]
            if ChatFrameEditBox:IsVisible() then
                ChatFrameEditBox:Insert(itemLink)
            end
        end
    elseif IsControlKeyDown() then
        -- Ctrl+Click - показать дополнительную информацию
        AtlasTW.UIIntegration.ShowItemDetails(itemData)
    else
        -- Обычный клик - показать в окне просмотра
        AtlasTW.UIIntegration.ShowItemPreview(itemData)
    end
end

-- Функция показа детальной информации о предмете
function AtlasTW.UIIntegration.ShowItemDetails(itemData)
    DEFAULT_CHAT_FRAME:AddMessage("=== Информация о предмете ===")
    DEFAULT_CHAT_FRAME:AddMessage("ID: " .. (itemData[1] or "N/A"))
    DEFAULT_CHAT_FRAME:AddMessage("Иконка: " .. (itemData[2] or "N/A"))
    DEFAULT_CHAT_FRAME:AddMessage("Название: " .. (itemData[3] or "N/A"))
    DEFAULT_CHAT_FRAME:AddMessage("Описание: " .. (itemData[4] or "N/A"))
    DEFAULT_CHAT_FRAME:AddMessage("Шанс выпадения: " .. (itemData[5] or "N/A"))
end

-- Функция предварительного просмотра предмета
function AtlasTW.UIIntegration.ShowItemPreview(itemData)
    -- Здесь можно добавить логику для показа предмета в специальном окне
    -- Пока просто выводим в чат
    local itemName = itemData[3] or "Unknown Item"
    -- Убираем цветовое кодирование для вывода в чат
    itemName = string.gsub(itemName, "=q%d+=(.+)", "%1")
    DEFAULT_CHAT_FRAME:AddMessage("Просмотр предмета: " .. itemName)
end

-- Функция обновления информации о пагинации
function AtlasTW.UIIntegration.UpdatePaginationInfo(currentPage, allItems)
    local totalItems = getn(allItems)
    local totalPages = ceil(totalItems / MAX_ITEMS_PER_PAGE)

    -- Обновляем текст пагинации (если есть соответствующий элемент UI)
    if AtlasLootPageText then
        AtlasLootPageText:SetText("Страница " .. currentPage .. " из " .. totalPages)
    end

    -- Обновляем состояние кнопок навигации
    if AtlasLootPrevButton then
        if currentPage > 1 then
            AtlasLootPrevButton:Enable()
        else
            AtlasLootPrevButton:Disable()
        end
    end

    if AtlasLootNextButton then
        if currentPage < totalPages then
            AtlasLootNextButton:Enable()
        else
            AtlasLootNextButton:Disable()
        end
    end
end

-- Функции навигации по страницам
function AtlasTW.UIIntegration.NextPage()
    local totalPages = ceil(getn(itemsData) / MAX_ITEMS_PER_PAGE)
    if currentPage < totalPages then
        AtlasTW.UIIntegration.UpdateItemDisplay(currentCategory, currentSource, currentPage + 1)
    end
end

function AtlasTW.UIIntegration.PrevPage()
    if currentPage > 1 then
        AtlasTW.UIIntegration.UpdateItemDisplay(currentCategory, currentSource, currentPage - 1)
    end
end

function AtlasTW.UIIntegration.GoToPage(page)
    local totalPages = ceil(getn(itemsData) / MAX_ITEMS_PER_PAGE)
    if page >= 1 and page <= totalPages then
        AtlasTW.UIIntegration.UpdateItemDisplay(currentCategory, currentSource, page)
    end
end

-- Функция поиска предметов с UI
function AtlasTW.UIIntegration.SearchItems(searchTerm)
    if not searchTerm or searchTerm == "" then
        return
    end

    local results = {}

    if AtlasTW.ModernAdapter then
        -- Используем новую систему поиска
        local modernResults = AtlasTW.ModernAdapter.SearchItems(searchTerm)

        -- Конвертируем в старый формат для отображения
        for i = 1, getn(modernResults) do
            local item = modernResults[i]
            local legacyItem = {
                item.id or 0,
                item.icon or "INV_Misc_QuestionMark",
                "=q" .. (item.quality or 1) .. "=" .. (item.name or "Unknown"),
                "=ds=" .. (item:GetDescription() or ""),
                item:GetDropRateText() or ""
            }
            tinsert(results, legacyItem)
        end
    else
        -- Fallback на старую систему поиска
        -- Здесь можно добавить поиск по старым данным
    end

    -- Отображаем результаты поиска
    itemsData = results
    currentCategory = "search"
    currentSource = "search_results"
    currentPage = 1

    AtlasTW.UIIntegration.UpdateItemDisplay("search", "search_results", 1)

    DEFAULT_CHAT_FRAME:AddMessage("Найдено предметов: " .. getn(results))
end

-- Функция фильтрации предметов
function AtlasTW.UIIntegration.FilterItems(filters)
    if not AtlasTW.ModernAdapter then
        return
    end

    local allItems = AtlasTW.ModernAdapter.SearchItems("") -- Получаем все предметы
    local filteredResults = AtlasTW.ModernAdapter.SearchItems("", filters)

    -- Конвертируем результаты для отображения
    local results = {}
    for i = 1, getn(filteredResults) do
        local item = filteredResults[i]
        local legacyItem = {
            item.id or 0,
            item.icon or "INV_Misc_QuestionMark",
            "=q" .. (item.quality or 1) .. "=" .. (item.name or "Unknown"),
            "=ds=" .. (item:GetDescription() or ""),
            item:GetDropRateText() or ""
        }
        tinsert(results, legacyItem)
    end

    -- Отображаем отфильтрованные результаты
    itemsData = results
    currentCategory = "filtered"
    currentSource = "filtered_results"
    currentPage = 1

    AtlasTW.UIIntegration.UpdateItemDisplay("filtered", "filtered_results", 1)

    DEFAULT_CHAT_FRAME:AddMessage("Отфильтровано предметов: " .. getn(results))
end

-- Функция получения текущего состояния UI
function AtlasTW.UIIntegration.GetCurrentState()
    return {
        category = currentCategory,
        source = currentSource,
        page = currentPage,
        totalItems = getn(itemsData),
        totalPages = ceil(getn(itemsData) / MAX_ITEMS_PER_PAGE)
    }
end

-- Инициализация модуля
function AtlasTW.UIIntegration.Initialize()
    DEFAULT_CHAT_FRAME:AddMessage("UIIntegration: Модуль инициализирован")

    -- Здесь можно добавить дополнительную инициализацию
    -- например, создание UI элементов или регистрацию событий
end

-- Автоматическая инициализация при загрузке
AtlasTW.UIIntegration.Initialize()

DEFAULT_CHAT_FRAME:AddMessage("UIIntegration: Модуль загружен")