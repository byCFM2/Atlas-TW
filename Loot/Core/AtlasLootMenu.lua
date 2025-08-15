-- AtlasLootMenu.lua
local _G = getfenv()
local BZ = AceLibrary("Babble-Zone-2.2a")

function AtlasLoot_GetDataSource(dataID, name)
   -- print("AtlasLoot_GetDataSource"..dataID..name)
	for k, v in pairs(AtlasLoot_Data) do
		if v[dataID] then
			return k
		end
	end
	return nil
end

function AtlasLoot_PrepMenu(backPage, title, menu)
    for i = 1, 30 do
        -- Hide item buttons and borders
        _G["AtlasLootItem_" .. i]:Hide()
        _G["AtlasLootItem_" .. i .. "Border"]:Hide()

        -- Hide and reset menu item buttons
        local button = _G["AtlasLootMenuItem_" .. i]
        _G["AtlasLootMenuItem_" .. i .. "Border"]:Hide()
        button:Hide()
        button.isheader = false
        button.container = nil
        button.dataSource = nil
        _G["AtlasLootMenuItem_" .. i .. "_Icon"]:SetTexCoord(0, 1, 0, 1)

        -- Show extra text field
        _G["AtlasLootMenuItem_" .. i .. "_Extra"]:Show()
    end
    if menu then
        AtlasTWCharDB.LastBoss = menu or nil
        AtlasTWCharDB.LastBossText = title or ""
    end
    if backPage then
        AtlasLootItemsFrame_BACK:Show()
        AtlasLootItemsFrame_BACK.lootpage = backPage
    else
        AtlasLootItemsFrame_BACK:Hide()
    end

    AtlasLootItemsFrame_NEXT:Hide()
    AtlasLootItemsFrame_PREV:Hide()

    AtlasLoot_LootPageName:SetText(title)
    AtlasLootItemsFrame:Show()
end

function AtlasLoot_ShowMenu(menuData, options)
    --print("Show Menu:"..(menuData[4] and menuData[4].name or "no data for 4 element"))

    options = options or {}
    local maxItems = options.maxItems or 30
    local defaultIcon = options.defaultIcon or "Interface\\Icons\\INV_Misc_QuestionMark"
    local itemData, menuItem, lib, nameText, extraText, libExtra, itemButton
    for i = 1, maxItems do
        itemData = menuData[i] or {}
        menuItem = _G["AtlasLootMenuItem_"..i]
		itemButton = _G["AtlasLootItem_"..i]
        if itemData.name then
            lib = itemData.lib or nil
            if lib then
                nameText = lib[itemData.name]
            else
                nameText = itemData.name
            end
            if options.getExtraText then
                extraText = options.getExtraText(itemData)
            elseif itemData.extra then
                 libExtra = itemData.libExtra or BZ
                 extraText = libExtra[itemData.extra]
            elseif itemData.Extra then
                 extraText = itemData.Extra
            else
                 extraText = ""
            end
            _G["AtlasLootMenuItem_"..i.."_Name"]:SetText(nameText)
            _G["AtlasLootMenuItem_"..i.."_Extra"]:SetText(extraText)
            _G["AtlasLootMenuItem_"..i.."_Icon"]:SetTexture(itemData.icon or defaultIcon)
            menuItem.name = itemData.name_orig or itemData.name
            menuItem.lootpage = itemData.lootpage
            menuItem.container = itemData.container
            if itemData.container then
                _G["AtlasLootMenuItem_"..i.."Border"]:Show()
            else
                _G["AtlasLootMenuItem_"..i.."Border"]:Hide()
            end
            menuItem:Show()
        else
            menuItem:Hide()
        end
--[[         -- Сохраняем таблицу для дальнейшего использования
        if itemData.lootpage and itemData.name then
            menuItem.lootpage = AtlasLoot_GetDataSource(itemData.lootpage,itemData.name)
        end ]]
        -- Скрываем кнопки предметов и контейнеров
        itemButton:Hide()
        AtlasLootItemsFrameContainer:Hide()
    end
end