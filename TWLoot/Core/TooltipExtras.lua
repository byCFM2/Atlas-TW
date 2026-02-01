---
--- TooltipExtras.lua - Universal tooltip enhancements (Icon and ItemID)
---

local _G = getfenv()
local AtlasTW = _G.AtlasTW or {}
AtlasTW.TooltipExtras = {}

local BLUE = AtlasTW.Colors.BLUE
local L = AtlasTW.Localization.UI

-- Create the icon frame
local iconFrame = CreateFrame("Frame", "AtlasTWTooltipIcon", UIParent)
iconFrame:SetWidth(36)
iconFrame:SetHeight(36)
iconFrame:SetFrameStrata("TOOLTIP")
iconFrame:Hide()

local iconTexture = iconFrame:CreateTexture(nil, "ARTWORK")
iconTexture:SetAllPoints(iconFrame)

-- Function to show icon for a tooltip
function AtlasTW.TooltipExtras.ShowIcon(tooltip, texture)
    if not texture or not AtlasTWOptions.TooltipShowIcon then
        AtlasTW.TooltipExtras.HideIcon()
        return
    end

    iconTexture:SetTexture(texture)
    iconTexture:SetAlpha(1.0)
    iconFrame:SetParent(tooltip)
    iconFrame:SetPoint("BOTTOMLEFT", tooltip, "TOPLEFT", -2, 3)

    -- IMPORTANT: EnableMouse(false) is critical.
    iconFrame:EnableMouse(false)

    iconFrame:Show()
end

-- Function to hide icon
function AtlasTW.TooltipExtras.HideIcon()
    iconFrame:Hide()
end

-- Function to add ItemID to tooltip
function AtlasTW.TooltipExtras.AddItemID(tooltip, itemID)
    if not itemID or not AtlasTWOptions.TooltipShowID then return end

    -- Check if it's already there to prevent double IDs
    -- In 1.12 we don't have a reliable way to check lines without iterating
    -- but Extend is usually called once per show.
    tooltip:AddLine(BLUE .. L["ItemID:"] .. " " .. itemID)
    tooltip:Show() -- Force resize to include the new lines correctly
end

-- Main entry point called from Tooltip.lua
function AtlasTW.TooltipExtras.Extend(tooltip, itemID, showIcon)
    if not tooltip or not itemID then
        AtlasTW.TooltipExtras.HideIcon()
        return
    end

    -- Show Icon (if explicitly requested)
    if showIcon then
        local _, _, _, _, _, _, _, _, texture = GetItemInfo(itemID)
        if texture then
            AtlasTW.TooltipExtras.ShowIcon(tooltip, texture)
        else
            -- If texture not immediately available, try again shortly
            if AtlasTWOptions.TooltipShowIcon then
                iconFrame.waitID = itemID
                iconFrame.waitTooltip = tooltip
                iconFrame:Show() -- Show to trigger OnUpdate
            end
        end
    else
        -- ONLY hide icon if it was previously attached to this specific tooltip
        -- This prevents GameTooltip (hovering items) from hiding the ItemRefTooltip icon
        if iconFrame:GetParent() == tooltip then
            AtlasTW.TooltipExtras.HideIcon()
        end
    end

    -- Add ItemID (always at the bottom)
    AtlasTW.TooltipExtras.AddItemID(tooltip, itemID)
end

-- OnUpdate handler for iconFrame to handle async texture loading
iconFrame:SetScript("OnUpdate", function()
    -- Handle waiting for texture
    if this.waitID then
        local _, _, _, _, _, _, _, _, texture = GetItemInfo(this.waitID)
        if texture then
            AtlasTW.TooltipExtras.ShowIcon(this.waitTooltip, texture)
            this.waitID = nil
            this.waitTooltip = nil
        end
    end
end)

-- Function to hide icon and reset wait state
function AtlasTW.TooltipExtras.HideIcon()
    iconFrame:Hide()
    iconFrame.waitID = nil
    iconFrame.waitTooltip = nil
end
