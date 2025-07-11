local L = AtlasTW.Local
local title = L["Dungeons & Raids"]
--table for create back navigation
AtlasTW.Loot.BackTableRegistry = {}

-- Get the formatted string for the instance and make back navigation button
local function getFormString(instanceType, mainString)
    if instanceType == "[RAID]" then
        AtlasTW.Loot.BackTableRegistry[mainString] = "DUNGEONSMENU2"
        return "|cffff0000"..instanceType.." |cffffd200"..mainString
    else
        AtlasTW.Loot.BackTableRegistry[mainString] = AtlasTW.Loot.BackTableRegistry[mainString] or "DUNGEONSMENU1"
        return "|cffffffff"..instanceType.." |cffffd200"..mainString
    end
end

-- Function to generate menu data from AtlasMaps
local function GenerateMenuDataFromAtlasMaps()
    local menu1Data = {}
    local menu2Data = {}

    -- Mapping from AtlasMaps keys to lootpage names
    local lootpageMapping = {
        ["RagefireChasm"] = "RFCTaragaman",
        ["WailingCaverns"] = "WCLordCobrahn",
        ["TheDeadmines"] = "DMRhahkZor",
        ["ShadowfangKeep"] = "SFKRethilgore",
        ["BlackfathomDeeps"] = "BFDGhamoora",
        ["TheStockade"] = "SWStTargorr",
        ["Gnomeregan"] = "GnGrubbis",
        ["RazorfenKraul"] = "RFKAggem",
        ["RazorfenDowns"] = "RFDTutenkash",
        ["Uldaman"] = "UldBaelog",
        ["Maraudon"] = "MaraNoxxion",
        ["ZulFarrak"] = "ZFAntusul",
        ["TheSunkenTemple"] = "STBalconyMinibosses",
        ["BlackrockDepths"] = "BRDLordRoccor",
        ["Scholomance"] = "SCHOLOKirtonostheHerald",
        ["Stratholme"] = "STRATSkull",
        ["BlackrockSpireLower"] = "LBRSSpirestoneButcher",
        ["BlackrockSpireUpper"] = "UBRSEmberseer",
        ["ZulGurub"] = "ZGJeklik",
        ["TheRuinsofAhnQiraj"] = "AQ20Kurinnaxx",
        ["MoltenCore"] = "MCLucifron",
        ["OnyxiasLair"] = "Onyxia",
        ["BlackwingLair"] = "BWLRazorgore",
        ["TheTempleofAhnQiraj"] = "AQ40Skeram",
        ["Naxxramas"] = "NAXPatchwerk",
        ["LowerKarazhan"] = "LKHRolfen",
        ["TowerofKarazhan"] = "K40Gnarlmoon",
        ["TheBlackMorass"] = "COTBMChronar",
        ["TheStormwindVault"] = "SWVAszoshGrimflame",
        ["EmeraldSanctum"] = "ESErennius",
        ["KarazhanCrypt"] = "KCMarrowspike",
        ["TheCrescentGrove"] = "TCGGrovetenderEngryss",
        ["StormwroughtRuins"] = "RFCTaragaman", --TODO
        ["GilneasCity"] = "GCMatthiasHoltz",
        ["HateforgeQuarry"] = "HQHighForemanBargulBlackhammer",
        ["SMLibrary"] = "SMHoundmasterLoksey",
        ["SMArmory"] = "SMHerod",
        ["SMCathedral"] = "SMFairbanks",
        ["SMGraveyard"] = "SMVishas",
        ["DireMaulWest"] = "DMWTendrisWarpwood",
        ["DireMaulNorth"] = "DMNGuardMoldar",
        ["DireMaulEast"] = "DMEPusillin",
        ["CavernsOfTimeBlackMorass"] = "COTBMChronar",
        ["StormwindVault"] = "SWVAszoshGrimflame",
    }
    -- Skip these instances as they have special handling
    local skipInstances = {
        ["RareMobs"] = true  -- Rare mobs should be in World menu
    }

    -- Iterate through AtlasMaps
    local counter = 0
    for instanceKey, instanceData in pairs(AtlasMaps) do
        if type(instanceData) == "table" and instanceData.ZoneName and instanceData.LevelRange and not skipInstances[instanceKey] then
            -- Skip world bosses (MinLevel = "1") and battlegrounds
            if instanceData.MinLevel ~= "1" and not string.find(instanceKey, "^BG") then
                local zoneName = instanceData.ZoneName
                local location = instanceData.Location or ""
                local levelRange = instanceData.LevelRange
                local playerLimit = instanceData.PlayerLimit
                local acronym = instanceData.Acronym

                -- Get lootpage name
                local lootpage = lootpageMapping[instanceKey] or instanceKey

                -- Modern Data System Integration
                local useModern = false
                if instanceKey == "MoltenCore" then
                    useModern = true
                end

                -- Determine instance type and target menu
                local instanceType
                local targetMenu

                if playerLimit == "40" or playerLimit == "20" or playerLimit == "10" then
                    instanceType = "[RAID]"
                    targetMenu = menu2Data
                elseif counter > 29 then
                    instanceType = "[" .. levelRange .. "]"
                    targetMenu = menu2Data
                else
                    counter = counter + 1
                    instanceType = "[" .. levelRange .. "]"
                    targetMenu = menu1Data
                end

                -- Create menu entry
                local menuEntry = {
                    name = getFormString(instanceType, zoneName),
                    Extra = location,
                    lootpage = lootpage,
                    playerLimit = tonumber(playerLimit) or 5,
                    useModern = useModern,
                    category = "instances",
                    boss = string.gsub(lootpage, "MC", "") -- Extract boss name from lootpage
                }

                -- Add icon for raids and level 60 instances
                if instanceType == "[RAID]" then
                    menuEntry.icon = "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar"
                else
                    menuEntry.icon = "Interface\\Icons\\Spell_Arcane_PortalIronForge"
                end

                table.insert(targetMenu, menuEntry)
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

    -- Sort second menu by player limit (raids first, then by level)
    local function sortByPlayerLimit(a, b)
        local aIsRaid = string.find(a.name, "%[RAID%]")
        local bIsRaid = string.find(b.name, "%[RAID%]")
        -- If both are raids, sort by player limit (40 > 20 > 10)
        if aIsRaid and bIsRaid then
            if a.playerLimit ~= b.playerLimit then
                return a.playerLimit < b.playerLimit
            end
            -- If same player limit, sort by level
            return sortByLevel(a, b)
        end

        -- If both are not raids, sort by level
        if not aIsRaid and not bIsRaid then
            return sortByLevel(a, b)
        end

        -- Raids come first
        return aIsRaid and not bIsRaid
    end

    table.sort(menu1Data, sortByLevel)
    table.sort(menu2Data, sortByPlayerLimit)

    return menu1Data, menu2Data
end

-- Generate menu data from AtlasMaps
local generatedMenu1Data, generatedMenu2Data = GenerateMenuDataFromAtlasMaps()

-- Data for Dungeons & Raids (Page 1) - Auto-generated from AtlasMaps
AtlasTW.Loot.DungeonsMenu1Data = generatedMenu1Data

-- Data for Dungeons & Raids (Page 2) - Auto-generated from AtlasMaps  
AtlasTW.Loot.DungeonsMenu2Data = generatedMenu2Data

function AtlasLoot_DungeonsMenu1()
    AtlasLoot_PrepMenu(nil, title, "DUNGEONSMENU1")
    AtlasLootItemsFrame_PREV:Show()
    AtlasLootItemsFrame_NEXT:Show()
    local menuData = {
        useModern = true,
        category = "instances",
        boss = "Lucifron"
    }
    -- This is a placeholder to show how to call it for a specific boss.
    -- In a real scenario, you would get the boss from the clicked menu item.
    if AtlasTW.Loot.DungeonsMenu1Data[1] and AtlasTW.Loot.DungeonsMenu1Data[1].useModern then
        AtlasLoot_ShowMenu(AtlasTW.Loot.DungeonsMenu1Data[1])
    else
        AtlasLoot_ShowMenu(AtlasTW.Loot.DungeonsMenu1Data, { defaultIcon = "Interface\\Icons\\Spell_Arcane_PortalIronForge", maxItems = table.getn(AtlasTW.Loot.DungeonsMenu1Data) })
    end
end

function AtlasLoot_DungeonsMenu2()
    AtlasLoot_PrepMenu("DUNGEONSMENU1", title, "DUNGEONSMENU2")
    AtlasLootItemsFrame_PREV:Show()
    AtlasLootItemsFrame_NEXT:Show()
    if AtlasTW.Loot.DungeonsMenu2Data[1] and AtlasTW.Loot.DungeonsMenu2Data[1].useModern then
        AtlasLoot_ShowMenu(AtlasTW.Loot.DungeonsMenu2Data[1])
    else
        AtlasLoot_ShowMenu(AtlasTW.Loot.DungeonsMenu2Data, { defaultIcon = "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar", maxItems = table.getn(AtlasTW.Loot.DungeonsMenu2Data) })
    end
end

-- Original function is being replaced, so we comment it out or remove it.
--[[ function AtlasLoot_DungeonsMenu1()
    AtlasLoot_PrepMenu(nil, title, "DUNGEONSMENU1")
    AtlasLootItemsFrame_PREV:Show()
    AtlasLootItemsFrame_NEXT:Show()
    AtlasLoot_ShowMenu(AtlasTW.Loot.DungeonsMenu1Data, { defaultIcon = "Interface\\Icons\\Spell_Arcane_PortalIronForge", maxItems = table.getn(AtlasTW.Loot.DungeonsMenu1Data) })
end

function AtlasLoot_DungeonsMenu2()
    AtlasLoot_PrepMenu(nil, title, "DUNGEONSMENU2")
    AtlasLootItemsFrame_PREV:Show()
    AtlasLootItemsFrame_NEXT:Show()
    AtlasLoot_ShowMenu(AtlasTW.Loot.DungeonsMenu2Data, { defaultIcon = "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar", maxItems = table.getn(AtlasTW.Loot.DungeonsMenu2Data) })
end]]