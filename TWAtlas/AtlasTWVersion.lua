---
--- AtlasTWVersion.lua - Version check and update notification module
---
--- Implements lightweight version broadcast/listen over the 'LFT' channel,
--- similar to PizzaWorldBuffs. Notifies the user if a newer version is seen
--- from another Atlas-TW client.
---
--- @compatible World of Warcraft 1.12

local _G = getfenv()
AtlasTW = _G.AtlasTW or {}

local L = AtlasTW.Localization.UI

local Colors = AtlasTW.Colors

AtlasTW.VersionCheck = AtlasTW.VersionCheck or {}
local VC = AtlasTW.VersionCheck

-- Settings
VC.abbrev = 'ATW'
VC.channelName = 'LFT'
VC.nextPublishAt = nil
VC.joinAt = nil

-- Utilities
---
--- Gets local addon version string from pre-initialized value or metadata.
--- @return string|nil Version string like "1.35" or nil
--- @usage local v = AtlasTW.VersionCheck.getLocalVersionString()
function VC.getLocalVersionString()
  -- Prefer pre-initialized AtlasTW.Version if present; otherwise query metadata.
  return AtlasTW.Version or GetAddOnMetadata(AtlasTW.Name, 'Version')
end

---
--- Converts local version string to comparable number.
--- Interprets "major.minor" as major*1000 + minor.
--- @return number Version as major*1000+minor; 0 if missing
--- @usage local n = AtlasTW.VersionCheck.getVersionNumber()
function VC.getVersionNumber()
  local v = VC.getLocalVersionString()
  if not v or v == '' then return 0 end
  local _, _, major, minor = string.find(v, '^(%d*)%.?(%d*)$')
  major = tonumber(major) or 0
  minor = tonumber(minor) or 0
  return major * 1000 + minor
end

---
--- Looks up a channel ID by channel name.
--- @param channelName string Channel name (e.g., "LFT")
--- @return number|nil Channel ID or nil if not joined
--- @usage local id = getChannelIdByName("LFT")
local function getChannelIdByName(channelName)
  if type(channelName) ~= 'string' then return nil end
  local id,_ = GetChannelName(channelName)
  if id and id > 0 then
    return id
  end
end

---
--- Checks if a channel name matches the configured VersionCheck channel.
--- @param name string Channel display name
--- @return boolean True if matches the configured `VC.channelName`
local function isOurChannel(name)
  return type(name) == 'string' and string.lower(name) == string.lower(VC.channelName)
end

---
--- Schedules next version publish time with a randomized delay.
--- @return nil
function VC.resetPublishDelay()
  local minDelay, maxDelay = 100, 120
  local delay = math.random(minDelay, maxDelay)
  VC.nextPublishAt = time() + delay
end

---
--- Determines if it's time to publish our version.
--- @return boolean True if now >= next scheduled publish time
function VC.shouldPublish()
  return VC.nextPublishAt and time() >= VC.nextPublishAt
end

---
--- Broadcasts addon version to the configured channel.
--- Joins channel if needed and sends `ATW:<number>:v` message.
--- @return nil
function VC.publishVersion()
  local id = getChannelIdByName(VC.channelName)
  if not id or id <= 0 then
    JoinChannelByName(VC.channelName)
    return
  end
  local versionNumber = VC.getVersionNumber()
  local payload = 'v' -- simple marker
  local message = VC.abbrev .. ':' .. tostring(versionNumber) .. ':' .. payload
  SendChatMessage(message, 'CHANNEL', nil, id)
end

---
--- Compares a remote version against the local version.
--- Stops publishing and notifies the user if remote > local. Show update marker.
--- @param remoteVersion number Remote version encoded as major*1000+minor
--- @return nil
local function checkRemoteVersion(remoteVersion)
  if not remoteVersion then return end
  local localVersionNum = VC.getVersionNumber()
  if tonumber(remoteVersion) > localVersionNum then
    VC.nextPublishAt = nil -- Stop publishing
    AtlasTWVersionFrame:UnregisterEvent("CHAT_MSG_CHANNEL") -- Stop listening for version messages
    AtlasTWVersionFrame:SetScript('OnUpdate', nil) -- Stop periodic broadcasts
    PrintA(format(L["NewVersionAvailableFmt"], Colors.RED..L["Link"]))
    AtlasTW.UpdateMarkerRefresh()
  end
end

-- Event frame for version checking
local verFrame = CreateFrame('Frame', 'AtlasTWVersionFrame', UIParent)
verFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
verFrame:RegisterEvent('CHAT_MSG_CHANNEL')
---
--- Handles addon events for version checking.
--- Listens for `PLAYER_ENTERING_WORLD` to schedule join/publish
--- and `CHAT_MSG_CHANNEL` to process incoming version messages.
--- @return nil
verFrame:SetScript('OnEvent', function()
  if event == 'PLAYER_ENTERING_WORLD' then
    VC.joinAt = GetTime() + 5
    VC.resetPublishDelay()
  elseif event == 'CHAT_MSG_CHANNEL' and arg2 ~= UnitName('player') then
    -- Extract "channel base name" from arg4 like "3. LFT" without calling GetChannelName
    local channelName = string.gsub(arg4 or '', '^%d+%.%s*', '')
    if channelName and isOurChannel(channelName) then
      local _, _, addonName, remoteVersionStr,_ = string.find(arg1 or '', '([^:]+):([^:]+):([^:]+)')
      if addonName == VC.abbrev then
        checkRemoteVersion(tonumber(remoteVersionStr))
      end
    end
  end
end)

---
--- Periodic ticker to join the channel and publish our version.
--- Executes once per second; handles deferred join and publish cadence.
--- @return nil
verFrame:SetScript('OnUpdate', function()
  if (this.tick or 1) > GetTime() then return else this.tick = GetTime() + 1 end
  if VC.joinAt and GetTime() >= VC.joinAt then
    local id = getChannelIdByName(VC.channelName)
    if not id or id <= 0 then
      JoinChannelByName(VC.channelName)
    end
    VC.joinAt = nil
  end
  if VC.shouldPublish() then
    VC.publishVersion()
    VC.resetPublishDelay()
  end
end)