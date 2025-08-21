-- AtlasLootMenu.lua
local _G = getfenv()
local BZ = AceLibrary("Babble-Zone-2.2a")

--[[ function AtlasLoot_GetDataSource(dataID, name)
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
]]
function AtlasLoot_ShowMenu(menuData, options)
    print("Show Menu")
--[[ 
    options = options or {}
    local defaultIcon = options.defaultIcon or "Interface\\Icons\\INV_Misc_QuestionMark"
    local itemData, menuButton, extraText, itemButton
    for i = 1, AtlasTW.LOOT_NUM_LINES do
        itemData = menuData[i] or {}
        menuButton = _G["AtlasLootMenuItem_"..i]
		itemButton = _G["AtlasLootItem_"..i]
        if itemData.name then
            if itemData.extra then
                 extraText = BZ[itemData.extra]
            elseif itemData.Extra then
                 extraText = itemData.Extra
            else
                 extraText = ""
            end
            _G["AtlasLootMenuItem_"..i.."_Name"]:SetText(itemData.name)
            _G["AtlasLootMenuItem_"..i.."_Extra"]:SetText(extraText)
            _G["AtlasLootMenuItem_"..i.."_Icon"]:SetTexture(itemData.icon or defaultIcon)
            menuButton.name = itemData.name_orig or itemData.name
            menuButton.lootpage = itemData.lootpage
            menuButton.container = itemData.container
            if itemData.container then
                _G["AtlasLootMenuItem_"..i.."Border"]:Show()
            else
                _G["AtlasLootMenuItem_"..i.."Border"]:Hide()
            end
            menuButton:Show()
            -- Show extra text field
            _G["AtlasLootMenuItem_" .. i .. "_Extra"]:Show()
        else
            menuButton:Hide()
        end
        -- Скрываем кнопки предметов и контейнеров
        itemButton:Hide()
        AtlasLootItemsFrameContainer:Hide()
    end
    AtlasLoot_LootPageName:SetText(options.menuName or "")
    AtlasLootItemsFrame:Show() ]]
end