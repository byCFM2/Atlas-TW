---
--- DataResolver.lua - Data resolution and navigation functionality
--- 
--- This module handles data resolution for loot items and boss navigation.
--- It provides functions to find loot data by element name or ID and
--- creates navigation structures for boss browsing.
--- 
--- Features:
--- - Loot data resolution by name and ID
--- - Boss navigation structure creation
--- - Instance data searching and filtering
--- - Support for cross-instance data lookup
--- 
--- @compatible World of Warcraft 1.12
---

local _G = getfenv()
AtlasTW = _G.AtlasTW
AtlasTW.DataResolver = AtlasTW.DataResolver or {}

-- Instance required libraries
local LU = AtlasTW.Localization.UI
local LM = AtlasTW.Localization.MapData

---
--- Helper function to resolve loot items
--- @param items string|table The items to resolve - string key for AtlasTWLoot_Data lookup or table data
--- @return table|string|nil Returns resolved items from AtlasTWLoot_Data if string key found, original table if table passed, or nil if string key not found
--- @usage local resolved = AL_ResolveItems("MC_Ragnaros") -- resolves from AtlasTWLoot_Data
local function AL_ResolveItems(items)
    if type(items) ~= "string" then
        return items
    else
        return AtlasTWLoot_Data[items] or items
    end
end

---
--- Helper function to find boss/element in a specific instance
--- Searches sequentially through reputation, keys, and bosses data sections
--- @param instData table Instance data with optional fields: Reputation, Keys, Bosses (each containing arrays of objects with 'name' field)
--- @param elemName string Name of element to find (exact match)
--- @return table|string|nil Found element's loot/items data (resolved if string reference), or nil if not found
--- @usage local result = AL_FindInInstance(instanceData, "Ragnaros")
local function AL_FindInInstance(instData, elemName)
    if not instData or not elemName then return nil end

    -- Search in reputation data
    if instData.Reputation then
        for _, repData in ipairs(instData.Reputation) do
            if repData.name == elemName then
                return AL_ResolveItems(repData.loot or repData.items)
            end
        end
    end

    -- Search in keys data
    if instData.Keys then
        for _, keyData in ipairs(instData.Keys) do
            if keyData.name == elemName then
                return AL_ResolveItems(keyData.loot or keyData.items)
            end
        end
    end

    -- Search in bosses data
    if instData.Bosses then
        for _, bossData in ipairs(instData.Bosses) do
            if bossData.name == elemName then
                return AL_ResolveItems(bossData.items or bossData.loot)
            end
        end
    end

    return nil
end

---
--- Gets loot data by boss/element name without building indexes
--- Searches through instance data to find matching boss or element
--- @param elemName string Name of the boss or element to find
--- @param instanceName string|nil Optional specific instance to search in
--- @return table|nil Loot data table or nil if not found
--- @usage local loot = AtlasTW.DataResolver.GetLootByElemName("Ragnaros", "Molten Core")
---
function AtlasTW.DataResolver.GetLootByElemName(elemName, instanceName)
    if not elemName then return nil end

    -- If a specific instance is provided
    if instanceName and AtlasTW.InstanceData[instanceName] then
        return AL_FindInInstance(AtlasTW.InstanceData[instanceName], elemName)
    end

    -- Search across all instances
    for _, inst in pairs(AtlasTW.InstanceData) do
        local result = AL_FindInInstance(inst, elemName)
        if result then
            return result
        end
    end

    return nil
end

---
--- Gets loot data by numeric ID within a specific zone
--- Searches through reputation, keys, and bosses in order
--- @param zoneID string Zone identifier to search within
--- @param id number Numeric ID of the element
--- @return table|string|nil Loot data or nil if not found
--- @usage local loot = AtlasTW.DataResolver.GetLootByID("MC", 3)
---
function AtlasTW.DataResolver.GetLootByID(zoneID, id)
    local instData = AtlasTW.InstanceData[zoneID]
    if not instData then return end

    local bossIndex = id

    -- Check reputation data first
    if instData.Reputation then
        local numLines = table.getn(instData.Reputation)
        if bossIndex <= numLines then
            return instData.Reputation[bossIndex].loot
        end
        bossIndex = bossIndex - numLines
    end

    -- Check keys data second
    if instData.Keys then
        local numLines = table.getn(instData.Keys)
        if bossIndex <= numLines then
            return instData.Keys[bossIndex].loot
        end
        bossIndex = bossIndex - numLines
    end

    -- Check bosses data last
    if instData.Bosses and instData.Bosses[bossIndex] and instData.Bosses[bossIndex].items then
        return instData.Bosses[bossIndex].items
    end

    return nil
end

---
--- Helper function to find valid entry in boss list
--- Searches for valid boss entries with loot data
--- @param currentIndex number Current boss index
--- @param direction number Search direction (-1 for previous, 1 for next)
--- @return table|nil Valid boss entry or nil
--- @usage local boss = findValidEntry(3, 1)
---
local function findValidEntry(currentIndex, direction)
    local currentZoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local currentInstanceData = AtlasTW.InstanceData[currentZoneID]

    if not currentInstanceData or not currentInstanceData.Bosses then
        return nil
    end

    local numEntries = table.getn(currentInstanceData.Bosses)
    local searchIndex = currentIndex + direction

    while searchIndex >= 1 and searchIndex <= numEntries do
        local entry = currentInstanceData.Bosses[searchIndex]
        if entry and (entry.items or entry.loot) then
            return entry
        end
        searchIndex = searchIndex + direction
    end

    return nil
end

---
--- Gets navigation data for boss/element browsing
--- Creates navigation structure with previous/next boss links within current instance
--- @param data string Name or ID of the boss/element to get navigation for
--- @return table|nil Navigation table with Title, Back_Page, Prev_Page, Next_Page properties
--- @usage local nav = AtlasTW.DataResolver.GetBossNavigation("Ragnaros")
---
function AtlasTW.DataResolver.GetBossNavigation(data)
    if not data then return nil end
    -- Get current instance from settings
    local currentZoneID = AtlasTW.DropDowns[AtlasTWOptions.AtlasType][AtlasTWOptions.AtlasZone]
    local currentInstanceData = AtlasTW.InstanceData[currentZoneID]

    -- Search for boss only in current instance
    if currentInstanceData and currentInstanceData.Bosses then
        for i, bossData in ipairs(currentInstanceData.Bosses) do
            if bossData.name == data then
                local nav = {}
                nav.Title = bossData.name or bossData.id
				if bossData.items and type(bossData.items) == "table" then
					-- Back to dungeons menu
					nav.Back_Page = "DUNGEONSMENU"
					nav.Back_Title = LU["Dungeons & Raids"]
				end

                local numEntries = table.getn(currentInstanceData.Bosses)
				if numEntries <= 1 then return nav end

                -- Search for previous valid element
                local prevBoss = findValidEntry(i, -1)
                if prevBoss then
                    nav.Prev_Page = prevBoss.name
                    nav.Prev_Title = prevBoss.name or prevBoss.id
                end

                -- Search for next valid element
                local nextBoss = findValidEntry(i, 1)
                if nextBoss then
                    nav.Next_Page = nextBoss.name
                    nav.Next_Title = nextBoss.name or nextBoss.id
                end
                return nav
            end
        end
    end
    return nil
end

---
--- Gets navigation data for menu browsing
--- Creates navigation structure for moving between different menu sections
--- @param current string|table Current menu item name or loot table key
--- @return table|nil Navigation table with menu links or nil if not found
--- @usage local nav = AtlasTW.DataResolver.GetMenuNavigation("DungeonsMenu")
---
function AtlasTW.DataResolver.GetMenuNavigation(current)
    -- Support passing a menu element table
    if type(current) == "table" and current.menuName then
        current = current.menuName
    end

    local function getAllMenuData()
        local menus = {}
        if AtlasTW and AtlasTW.MenuData then
            for _, value in pairs(AtlasTW.MenuData) do
                if type(value) == "table" and table.getn(value) > 0 then
                    table.insert(menus, value)
                end
            end
        end
        return menus
    end

    local candidates = getAllMenuData()

    local function findInMenu(menu)
        if not menu then return nil end
        local size = table.getn(menu)
        local idx = nil

        -- Search element by name (priority) or by lootpage (for compatibility)
        for i = 1, size do
            local e = menu[i]
            if e and e.name then
                -- Exact match first
                if e.name == current then
                    idx = i
                    break
                elseif string.find(e.name, "|c") then
                    -- Remove color codes and compare
                    local cleanName = string.gsub(e.name, "|c%x%x%x%x%x%x%x%x", "")
                    cleanName = string.gsub(cleanName, "|r", "")
                    if cleanName == current then
                        idx = i
                        break
                    end
                end
            end
        end

        -- If not found by name, try by lootpage for backward compatibility
        if not idx then
            for i = 1, size do
                local e = menu[i]
                if e and e.lootpage and e.lootpage == current then
                    idx = i
                    break
                end
            end
        end

        if not idx then
            return nil
        end

        local result = {}
        -- Search for previous item among valid elements
        for j = idx - 1, 1, -1 do
            local pe = menu[j]
            if pe and pe.lootpage and not pe.isheader then
                result.Prev_Page = pe.lootpage ~= LU["Rare Mobs"] and pe.lootpage or LM["Shade Mage"]
                result.Prev_Title = pe.name ~= LU["Rare Mobs"] and pe.name or LM["Shade Mage"]
                break
            end
        end
        -- If not found, wrap around from the end
        if not result.Prev_Page then
            for j = size, 1, -1 do
                if j ~= idx then
                    local pe = menu[j]
                    if pe and pe.lootpage and not pe.isheader then
                        result.Prev_Page = pe.lootpage ~= LU["Rare Mobs"] and pe.lootpage or LM["Shade Mage"]
                        result.Prev_Title = pe.name ~= LU["Rare Mobs"] and pe.name or LM["Shade Mage"]
                        break
                    end
                end
            end
        end

        -- Search for next item
        for j = idx + 1, size do
            local ne = menu[j]
            if ne and ne.lootpage and not ne.isheader then
                result.Next_Page = ne.lootpage ~= LU["Rare Mobs"] and ne.lootpage or LM["Shade Mage"]
                result.Next_Title = ne.name ~= LU["Rare Mobs"] and ne.name or LM["Shade Mage"]
                break
            end
        end
        -- If not found, wrap around from the beginning
        if not result.Next_Page then
            for j = 1, size do
                if j ~= idx then
                    local ne = menu[j]
                    if ne and ne.lootpage and not ne.isheader then
                        result.Next_Page = ne.lootpage ~= LU["Rare Mobs"] and ne.lootpage or LM["Shade Mage"]
                        result.Next_Title = ne.name ~= LU["Rare Mobs"] and ne.name or LM["Shade Mage"]
                        break
                    end
                end
            end
        end
        return result
    end

    -- Scan all addon menus
    local n = table.getn(candidates)
    for k = 1, n do
        local nav = findInMenu(candidates[k])
        if nav and (nav.Next_Page or nav.Prev_Page) then
            return nav
        end
    end

    return nil
end

---
--- Checks if a loot table is available in memory or can be resolved
--- Searches by direct table key and by element name within current or any instance
--- @param dataID string Loot table identifier or element name
--- @return boolean True if loot table exists, false otherwise
--- @usage local available = AtlasTW.DataResolver.IsLootTableAvailable("MC_Ragnaros")
---
function AtlasTW.DataResolver.IsLootTableAvailable(dataID)
    if not dataID then return false end
    -- Direct loot table
    if AtlasTWLoot_Data and AtlasTWLoot_Data[dataID] then
        return true
    end
    -- Search by element name within current instance or globally
    local instanceKey = AtlasTWLootItemsFrame and AtlasTWLootItemsFrame.StoredMenu
    local loot = AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(dataID, instanceKey) or nil
    if loot and type(loot) == "table" then
        return true
    end
    -- Try without considering instance
    loot = AtlasTW.DataResolver.GetLootByElemName and AtlasTW.DataResolver.GetLootByElemName(dataID) or nil
    if loot and type(loot) == "table" then
        return true
    end
    return false
end