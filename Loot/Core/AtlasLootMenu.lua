-- AtlasLootMenu.lua
local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BZ = AceLibrary("Babble-Zone-2.2a")

function AtlasLoot_GetDataSource(dataID)
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
        AtlasTWCharDB.LastBossText = title or "nil"
    end
    if backPage then
        AtlasLootItemsFrame_BACK:Show()
        AtlasLootItemsFrame_BACK.lootpage = backPage
    else
        AtlasLootItemsFrame_BACK:Hide()
    end

    AtlasLootItemsFrame_NEXT:Hide()
    AtlasLootItemsFrame_PREV:Hide()

    AtlasLoot_BossName:SetText("|cffFFFFFF" .. title)
    AtlasLootItemsFrame:Show()
end

function AtlasLoot_ShowMenu(menuData, options)
    options = options or {}
    local maxItems = options.maxItems or 30
    local defaultIcon = options.defaultIcon or "Interface\\Icons\\INV_Misc_QuestionMark"
    local itemData, menuItem, lib, nameText, extraText, libExtra
    for i = 1, maxItems do
        itemData = menuData[i] or {}
        menuItem = _G["AtlasLootMenuItem_"..i]
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
    end
    for i = 1, maxItems do
        local button = _G["AtlasLootMenuItem_" .. i]
        if button.lootpage then
            button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
        end
    end
end