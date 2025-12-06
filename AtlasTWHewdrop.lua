---
--- AtlasTWHewdrop.lua - Hewdrop-based dropdown menu system for Atlas-TW
---
--- This file provides wrapper functions for Hewdrop library to replace
--- the standard UIDropDownMenu which has a ~32 element limit.
--- Hewdrop supports unlimited elements with mouse wheel scrolling.
---
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

-- Get the Hewdrop instance (loaded before us in TOC)
local Hewdrop = ATWHewdrop

-- Module namespace
AtlasTW.HewdropMenus = {}

--- Opens the category selection menu (Continent, Party Size, Level, Type, All)
--- @param parent frame The button/frame to anchor the menu to
--- @return nil
function AtlasTW.HewdropMenus:OpenCategoryMenu(parent)
    -- Ensure data is initialized
    if not AtlasTW.DropDowns or not next(AtlasTW.DropDowns) then
        if AtlasTW.PopulateDropdowns then
            AtlasTW.PopulateDropdowns()
        end
    end

    local sortType = AtlasTW_DropDownSortOrder and AtlasTW_DropDownSortOrder[AtlasTWOptions.AtlasSortBy]
    if not sortType then return end
    
    local subcatOrder = AtlasTW_DropDownGetLayoutOrder and AtlasTW_DropDownGetLayoutOrder(sortType)
    if not subcatOrder then return end

    Hewdrop:Open(parent,
        'children', function(level, value)
            for i, catName in ipairs(subcatOrder) do
                local index = i -- Create local copy for closure
                local checked = (AtlasTWOptions.AtlasType == index)
                Hewdrop:AddLine(
                    'text', catName,
                    'checked', checked,
                    'isRadio', true,
                    'func', function()
                        AtlasTWOptions.AtlasType = index
                        AtlasTWOptions.AtlasZone = 1
                        AtlasTW.UpdateDropdownLabels()
                        AtlasTW.Refresh()
                    end,
                    'closeWhenClicked', true
                )
            end
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Opens the instance/map selection menu
--- @param parent frame The button/frame to anchor the menu to
--- @return nil
function AtlasTW.HewdropMenus:OpenInstanceMenu(parent)
    -- Ensure DropDowns are populated
    if not AtlasTW.DropDowns or not next(AtlasTW.DropDowns) then
        if AtlasTW.PopulateDropdowns then
            AtlasTW.PopulateDropdowns()
        end
    end

    local instances = (AtlasTW.DropDowns and AtlasTW.DropDowns[AtlasTWOptions.AtlasType]) or {}

    if table.getn(instances) == 0 then
        -- Try to repopulate if empty
        if AtlasTW.PopulateDropdowns then
            AtlasTW.PopulateDropdowns()
            instances = (AtlasTW.DropDowns and AtlasTW.DropDowns[AtlasTWOptions.AtlasType]) or {}
        end
    end

    Hewdrop:Open(parent,
        'children', function(level, value)
            for i, v in ipairs(instances) do
                local index = i -- Create local copy for closure
                local checked = (AtlasTWOptions.AtlasZone == index)
                local instanceName = AtlasTW.InstanceData[v] and AtlasTW.InstanceData[v].Name or v
                Hewdrop:AddLine(
                    'text', instanceName,
                    'checked', checked,
                    'isRadio', true,
                    'func', function()
                        AtlasTWOptions.AtlasZone = index
                        AtlasTW.UpdateDropdownLabels()
                        AtlasTW.Refresh()
                    end,
                    'closeWhenClicked', true
                )
            end
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Opens the entrance/instance switch menu
--- @param parent frame The button/frame to anchor the menu to
--- @param switchData table Array of instance keys to switch between
--- @param onSelect function Callback function when item is selected (receives index)
--- @return nil
function AtlasTW.HewdropMenus:OpenSwitchMenu(parent, switchData, onSelect)
    if not switchData or table.getn(switchData) == 0 then
        return
    end

    Hewdrop:Open(parent,
        'children', function(level, value)
            for i, v in ipairs(switchData) do
                local index = i -- Create local copy for closure
                local instanceName = AtlasTW.InstanceData[v] and AtlasTW.InstanceData[v].Name or v
                Hewdrop:AddLine(
                    'text', instanceName,
                    'notCheckable', true,
                    'func', function()
                        if onSelect then
                            onSelect(index)
                        end
                    end,
                    'closeWhenClicked', true
                )
            end
        end,
        'point', "TOPLEFT",
        'relativePoint', "BOTTOMLEFT"
    )
end

--- Closes any open Hewdrop menu
--- @return nil
function AtlasTW.HewdropMenus:Close()
    Hewdrop:Close()
end

--- Checks if a Hewdrop menu is currently open
--- @param parent frame Optional parent to check against
--- @return boolean True if menu is open
function AtlasTW.HewdropMenus:IsOpen(parent)
    return Hewdrop:IsOpen(parent)
end

--- Updates the text labels on dropdown buttons to show current selection
--- Called after changing category or instance
--- @return nil
function AtlasTW.UpdateDropdownLabels()
    -- Update category button text
    if AtlasTWFrameDropDownType and AtlasTWFrameDropDownTypeText then
        local sortType = AtlasTW_DropDownSortOrder and AtlasTW_DropDownSortOrder[AtlasTWOptions.AtlasSortBy]
        local subcatOrder = sortType and AtlasTW_DropDownGetLayoutOrder and AtlasTW_DropDownGetLayoutOrder(sortType) or {}
        local catName = subcatOrder[AtlasTWOptions.AtlasType] or ""
        AtlasTWFrameDropDownTypeText:SetText(catName)
    end

    -- Update instance button text
    if AtlasTWFrameDropDown and AtlasTWFrameDropDownText then
        local instances = AtlasTW.DropDowns and AtlasTW.DropDowns[AtlasTWOptions.AtlasType] or {}
        local instanceKey = instances[AtlasTWOptions.AtlasZone]
        local instanceName = ""
        if instanceKey and AtlasTW.InstanceData and AtlasTW.InstanceData[instanceKey] then
            instanceName = AtlasTW.InstanceData[instanceKey].Name
        end
        AtlasTWFrameDropDownText:SetText(instanceName)
    end
end
