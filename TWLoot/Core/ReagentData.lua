local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local LS = AtlasTW.Localization.Spells

AtlasTW.ReagentData = {}
local ReagentData = AtlasTW.ReagentData

local ReagentIndex = nil
local RecipeInfo = nil

-- Helper to extract profession name from table key
local function GetProfessionName(tableKey)
    if not tableKey then return nil, nil end
    if string.find(tableKey, "^Alchemy") then return LS["Alchemy"], "Alchemy" end
    if string.find(tableKey, "^Blacksmithing") then return LS["Blacksmithing"], "Blacksmithing" end
    if string.find(tableKey, "^Enchanting") then return LS["Enchanting"], "Enchanting" end
    if string.find(tableKey, "^Engineering") then return LS["Engineering"], "Engineering" end
    if string.find(tableKey, "^Leatherworking") then return LS["Leatherworking"], "Leatherworking" end
    if string.find(tableKey, "^Leather") then return LS["Leatherworking"], "Leatherworking" end
    if string.find(tableKey, "^Tailoring") then return LS["Tailoring"], "Tailoring" end
    if string.find(tableKey, "^Cooking") then return LS["Cooking"], "Cooking" end
    if string.find(tableKey, "^FirstAid") then return LS["First Aid"], "First Aid" end
    if string.find(tableKey, "^Jewelcrafting") then return LS["Jewelcrafting"], "Jewelcrafting" end
    if string.find(tableKey, "^Poisons") then return LS["Poisons"], "Poisons" end
    if string.find(tableKey, "^Smelting") then return LS["Mining"], "Mining" end
    return nil, nil
end

-- Helper to get player's skill in a profession
function ReagentData.GetPlayerProfessionSkill(professionName)
    if not professionName then return 0 end
    for i = 1, GetNumSkillLines() do
        local skillName, _, _, skillRank, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(i)
        if skillName == professionName then
            return skillRank
        end
    end
    return 0
end

function ReagentData.BuildIndex()
    if ReagentIndex then return end
    ReagentIndex = {}
    RecipeInfo = {}

    -- 1. Build RecipeInfo from Crafting Data
    if AtlasTWLoot_Data then
        for key, data in pairs(AtlasTWLoot_Data) do
            local profession, professionKey = GetProfessionName(key)
            if profession and type(data) == "table" then
                for _, entry in ipairs(data) do
                    if entry.id then
                        local skill = 0
                        if entry.skill and type(entry.skill) == "table" then
                            skill = entry.skill[1] or 0
                        end
                        RecipeInfo[entry.id] = {
                            profession = profession,
                            professionKey = professionKey,
                            skill = skill
                        }
                    end
                end
            end
        end
    end

    -- 2. Build ReagentIndex from SpellDB
    if AtlasTW.SpellDB then
        for _, spells in pairs(AtlasTW.SpellDB) do
            if type(spells) == "table" then
                for spellID, spellData in pairs(spells) do
                    -- Only index if we have RecipeInfo (i.e. we know the profession)
                    local info = RecipeInfo[spellID]
                    if info and type(spellData) == "table" and spellData.reagents then
                        for _, reagent in ipairs(spellData.reagents) do
                            local reagentID = reagent[1]
                            if reagentID then
                                if not ReagentIndex[reagentID] then
                                    ReagentIndex[reagentID] = {}
                                end

                                local profession = info.profession
                                local professionKey = info.professionKey
                                local skill = info.skill

                                local name = spellData.name
                                local itemID = spellData.item

                                table.insert(ReagentIndex[reagentID], {
                                    spellID = spellID,
                                    itemID = itemID,
                                    name = name,
                                    profession = profession,
                                    professionKey = professionKey,
                                    skill = skill
                                })
                            end
                        end
                    end
                end
            end
        end

        -- Sort all lists
        for _, list in pairs(ReagentIndex) do
            table.sort(list, function(a, b)
                if a.profession ~= b.profession then
                    return a.profession < b.profession
                end
                if a.skill ~= b.skill then
                    return a.skill < b.skill
                end
                return (a.name or "") < (b.name or "")
            end)
        end
    end
end

function ReagentData.GetRecipes(itemID)
    if not ReagentIndex then ReagentData.BuildIndex() end
    return ReagentIndex[itemID]
end
