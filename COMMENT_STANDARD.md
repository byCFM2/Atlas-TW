# Modern Function Comment Standard for Atlas-TW

This document defines the standardized comment format for all Lua functions in the Atlas-TW project, following modern JSDoc-style conventions adapted for World of Warcraft 1.12.

## Standard Comment Template

```lua
---
--- Brief description of what the function does
--- @param paramName type Description of the parameter
--- @param optionalParam type|nil Optional parameter description (default: value)
--- @return type Description of what is returned
--- @usage Example of how to use the function
--- @since Version when function was added
--- @author Author name (optional)
---
function FunctionName(paramName, optionalParam)
    -- Function implementation
end
```

## Parameter Types for WoW 1.12

- `string` - Text values
- `number` - Numeric values (integers and floats)
- `boolean` - true/false values
- `table` - Lua tables/arrays
- `function` - Function references
- `frame` - WoW UI frames
- `nil` - Nil values
- `any` - Any type accepted
- `type1|type2` - Multiple types accepted

## Examples

### Simple Function
```lua
---
--- Toggles the visibility of the Atlas frame
--- @return boolean True if frame is now visible, false otherwise
--- @usage AtlasTW.Toggle()
--- @since 1.0.0
---
function AtlasTW.Toggle()
    if AtlasFrame:IsVisible() then
        AtlasFrame:Hide()
        return false
    else
        AtlasFrame:Show()
        return true
    end
end
```

### Function with Parameters
```lua
---
--- Performs a search through Atlas data based on input text
--- @param text string The search text to filter Atlas entries by
--- @param caseSensitive boolean|nil Whether search should be case sensitive (default: false)
--- @return table Array of search results containing matched entries
--- @usage local results = AtlasTW.Search("blackrock", false)
--- @since 1.0.0
---
function AtlasTW.Search(text, caseSensitive)
    -- Function implementation
end
```

### Event Handler Function
```lua
---
--- Main Atlas event handler for ADDON_LOADED and other events
--- Initializes the addon when loaded and handles faction detection
--- @return nil
--- @usage Automatically called by WoW event system
--- @since 1.0.0
---
function AtlasTW.OnEvent()
    -- Function implementation
end
```

### UI Callback Function
```lua
---
--- Handles click events on dropdown menu items
--- Updates the selected zone and refreshes the display
--- @return nil
--- @usage Called automatically by UI dropdown system
--- @since 1.0.0
---
local function atlasFrameDropDown_OnClick()
    -- Function implementation
end
```

### Utility Function
```lua
---
--- Formats skill text with appropriate color coding
--- @param skilltext table Array containing skill level thresholds [orange, yellow, green, grey]
--- @return string Formatted skill text with color codes
--- @usage local formatted = formSkillStyle({100, 150, 200, 250})
--- @since 1.0.0
---
local function formSkillStyle(skilltext)
    -- Function implementation
end
```

## Migration Guidelines

1. **Replace old comments**: Convert existing single-line comments to the new multi-line format
2. **Add missing documentation**: Document all parameters and return values
3. **Include usage examples**: Provide clear examples for complex functions
4. **Maintain consistency**: Use the same format across all files
5. **Update incrementally**: Focus on core functions first, then utilities

## Old vs New Format Comparison

### Old Format (to be replaced)
```lua
-- Performs a search through Atlas data based on input text
-- @param text The search text to filter Atlas entries by
function AtlasTW.Search(text)
```

### New Format (modern standard)
```lua
---
--- Performs a search through Atlas data based on input text
--- @param text string The search text to filter Atlas entries by
--- @return table Array of search results containing matched entries
--- @usage local results = AtlasTW.Search("blackrock")
--- @since 1.0.0
---
function AtlasTW.Search(text)
```

## Special Considerations for WoW 1.12

- Use `this` instead of `self` in comments when referring to frame context
- Document WoW API function dependencies
- Include frame size constraints (SetWidth/SetHeight instead of SetSize)
- Note any 1.12-specific limitations or workarounds
- Document event handling patterns specific to 1.12

## Implementation Priority

1. **High Priority**: Core Atlas functions (Atlas.lua)
2. **Medium Priority**: UI and Options functions
3. **Low Priority**: Utility and helper functions

This standard ensures consistent, readable, and maintainable code documentation across the entire Atlas-TW project.