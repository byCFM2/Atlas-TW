---
--- LocalizationFramework.lua - Core Localization System
---
--- Simplified and robust localization system.
---

AtlasTW = _G.AtlasTW or {}

AtlasTW.Localization = {
    currentLocale = GetLocale(),
    namespaces = {}
}

---
--- Debug function to check loaded translations
---
function AtlasTW.Localization:DebugPrint()
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00AtlasTW Localization Debug:|r")
    DEFAULT_CHAT_FRAME:AddMessage("Current Locale: " .. tostring(self.currentLocale))

    for name, data in pairs(self.namespaces) do
        local enCount = 0
        local curCount = 0
        if data.enUS then
            for _ in pairs(data.enUS) do enCount = enCount + 1 end
        end
        if data.current then
            for _ in pairs(data.current) do curCount = curCount + 1 end
        end
        DEFAULT_CHAT_FRAME:AddMessage(string.format("  - %s: enUS=%d, current=%d", name, enCount, curCount))
    end
end

function AtlasTW.Localization:DebugMissing(limit)
    local frame = DEFAULT_CHAT_FRAME
    local out = function(msg) if frame then frame:AddMessage(msg) else print(msg) end end
    limit = tonumber(limit) or 40
    out("|cff00ff00AtlasTW Missing Keys:|r " .. tostring(self.currentLocale))
    for name, ns in pairs(self.namespaces) do
        local missing = {}
        local en = ns.enUS or {}
        local cur = ns.current or {}
        for k,_ in pairs(en) do
            if cur[k] == nil then table.insert(missing, k) end
        end
        out("  " .. name .. ": missing=" .. tostring(table.getn(missing)))
        if table.getn(missing) > 0 then
            local list = {}
            local n = math.min(limit, table.getn(missing))
            for i=1,n do list[i] = missing[i] end
            out("    " .. table.concat(list, ", "))
        end
    end
end

---
--- Register a new localization namespace
---
function AtlasTW.Localization:RegisterNamespace(namespace, locale, translations)
    if not self.namespaces[namespace] then
        self.namespaces[namespace] = {
            enUS = {},
            current = {}
        }
    end

    local ns = self.namespaces[namespace]

    -- Always load enUS as fallback
    if locale == "enUS" then
        for k, v in pairs(translations) do
            ns.enUS[k] = v
        end
    end

    -- Load current locale if it matches
    if locale == self.currentLocale then
        for k, v in pairs(translations) do
            ns.current[k] = v
        end
    end
end

---
--- Get a namespace for use
---
function AtlasTW.Localization:GetNamespace(namespace)
    if not self.namespaces[namespace] then
        -- Initialize if accessed before registration
        self:RegisterNamespace(namespace, "enUS", {})
    end

    local t = {}
    local ns_data = self.namespaces[namespace]

    setmetatable(t, {
        __index = function(tab, key)
            -- 1. Try current locale
            local val = ns_data.current[key]
            if val then
                if val == true then return key end
                return val
            end

            -- 2. Try enUS fallback
            val = ns_data.enUS[key]
            if val then
                if val == true then return key end
                return val
            end

            -- 3. Return key (fallback)
            return key
        end
    })

    return t
end

-- Define standard namespaces
AtlasTW.Localization.UI = AtlasTW.Localization:GetNamespace("UI")
AtlasTW.Localization.Zones = AtlasTW.Localization:GetNamespace("Zones")
AtlasTW.Localization.Bosses = AtlasTW.Localization:GetNamespace("Bosses")
AtlasTW.Localization.Classes = AtlasTW.Localization:GetNamespace("Classes")
AtlasTW.Localization.Factions = AtlasTW.Localization:GetNamespace("Factions")
AtlasTW.Localization.Spells = AtlasTW.Localization:GetNamespace("Spells")
AtlasTW.Localization.ItemSets = AtlasTW.Localization:GetNamespace("ItemSets")
AtlasTW.Localization.MapData = AtlasTW.Localization:GetNamespace("MapData")
