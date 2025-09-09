---
--- Dungeons.lua - Dungeon and raid loot system
---
--- This module handles dungeon and raid loot tables and menu systems for Atlas-TW.
--- It dynamically generates menu data from AtlasTW.InstanceData, organizing instances
--- by level ranges and player limits with automatic sorting and categorization.
---
--- Features:
--- • Dynamic instance menu generation
--- • Level-based instance categorization
--- • Player limit organization (5-man, 10-man, 40-man)
--- • Automatic sorting and filtering
--- • Color-coded instance type display
---
--- @since 1.0.0
--- @compatible World of Warcraft 1.12
---

AtlasTW = _G.AtlasTW
AtlasTW.MenuData = AtlasTW.MenuData or {}
local L = AtlasTW.Local

---
--- Get the formatted string for the instance with color coding
--- @param instanceType string - The instance type (e.g., "[RAID]", "[15-25]")
--- @param mainString string - The main instance name
--- @return string - Formatted string with color codes
--- @usage local formatted = getFormString("[RAID]", "Molten Core")
--- @since 1.0.0
---
local function getFormString(instanceType, mainString)
    return "|cffff0000"..instanceType.." |cffffd200"..mainString
end

---
--- Generate menu data from AtlasTW.InstanceData
--- Dynamically creates dungeon and raid menu entries with proper sorting and categorization
--- @return table - Generated menu data sorted by level ranges
--- @usage local menuData = GenerateMenuDataFromInstanceData()
--- @since 1.0.0
---
local function GenerateMenuDataFromInstanceData()
    local menuData = {}

    -- Skip these instances as they have special handling
    local skipInstances = {
    }

    -- Iterate through InstanceData
    for instanceKey, instanceData in pairs(AtlasTW.InstanceData) do
        if type(instanceData) == "table" and instanceData.Name and instanceData.Level and not skipInstances[instanceKey] then
            if not string.find(instanceKey, "^BG") and (type(instanceData.Level) == "table" and instanceData.Level[1] ~= 1 or type(instanceData.Level) == "number") then
                local name = instanceData.Name
                local location = instanceData.Location or ""
                local level = instanceData.Level
                local maxPlayers = instanceData.MaxPlayers
                -- Determine first boss name (if exists)
                local firstBoss = nil
                if instanceData.Bosses then
                    for _, boss in ipairs(instanceData.Bosses) do
                        if boss and boss.name and (boss.items or boss.loot) then
                            firstBoss = boss.name
                            break
                        end
                    end
                end

                -- Use instance key as lootpage (TableSource) to restrict search within this instance
                local lootpage = instanceKey

                -- Determine instance type and target menu
                local instanceType

                if maxPlayers == 40 or maxPlayers == 20 or maxPlayers == 10 then
                    instanceType = "[RAID]"
                else
                    if type(level) == "table" then
                        instanceType = "[" .. level[1].."-"..level[2] .. "]"
                    else
                        instanceType = "[".. level.. "]"
                    end
                end

                -- Create menu entry
                local menuEntry = {
                    name = getFormString(instanceType, name),
                    name_orig = name,
                    Extra = location,
                    lootpage = lootpage,
                    firstBoss = firstBoss,
                    playerLimit = tonumber(maxPlayers) or 5
                }

                -- Add icon for raids and level 60 instances
                if instanceType == "[RAID]" then
                    menuEntry.icon = "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar"
                else
                    menuEntry.icon = "Interface\\Icons\\Spell_Arcane_PortalIronForge"
                end

                table.insert(menuData, menuEntry)
            end
        end
    end

    -- Sort menus by level range
    local function sortByLevel(a, b)
        -- Extract level from [XX] or [XX-XX] format
        local aStart = string.find(a.name, "%[")
        local aEnd = string.find(a.name, "%]")
        local bStart = string.find(b.name, "%[")
        local bEnd = string.find(b.name, "%]")

        if aStart and aEnd and bStart and bEnd then
            local aLevelStr = string.sub(a.name, aStart + 1, aEnd - 1)
            local bLevelStr = string.sub(b.name, bStart + 1, bEnd - 1)

            -- Handle RAID case
            if aLevelStr == "RAID" then
                return false
            end
            if bLevelStr == "RAID" then
                return true
            end

            -- Extract first number from level range (e.g., "15-25" -> 15)
            local aDash = string.find(aLevelStr, "-")
            local bDash = string.find(bLevelStr, "-")

            local aLevel = tonumber(aDash and string.sub(aLevelStr, 1, aDash - 1) or aLevelStr)
            local bLevel = tonumber(bDash and string.sub(bLevelStr, 1, bDash - 1) or bLevelStr)

            if aLevel and bLevel then
                return aLevel < bLevel
            end
        end
        return false
    end

    table.sort(menuData, sortByLevel)

    return menuData
end

-- Data for Dungeons & Raids - Auto-generated from AtlasTW.InstanceData
AtlasTW.MenuData.Dungeons = GenerateMenuDataFromInstanceData()

---
--- Displays the dungeons and raids menu
--- Shows all available dungeons and raids organized by level ranges and player limits
--- @return nil
--- @usage AtlasLoot_DungeonsMenu()
--- @since 1.0.0
---
function AtlasLoot_DungeonsMenu()
    AtlasTW.LootBrowserUI.PrepMenu(L["Dungeons & Raids"], AtlasTW.MenuData.Dungeons)
end