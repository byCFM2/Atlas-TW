- Quests: Quest/* — quest sidebar and the inner details panel inside Atlas.
- Data: Loot/Data/*, Quest/Data/*.

3) Public functions (AtlasTW.*)
Atlas.lua
- AtlasTW.Search(text): run a search over Atlas/loot data by text; updates UI. Call on search box changes.
- AtlasTW.OnEvent(): core Atlas event handler; registered on PLAYER_LOGIN and others.
- AtlasTW.PopulateDropdowns(): fill dropdowns (categories/instances). Called during init/refresh.
- AtlasTW.ToggleLock(): toggle window drag lock.
- AtlasTW.Refresh(): full redraw of the current map and related panels after category/instance/options change.
- AtlasTW.SwitchButtonOnClick(): top bar switch button click handler.
- AtlasTW.FrameDropDownTypeOnShow(), AtlasTW.FrameDropDownOnShow(): OnShow handlers to init dropdowns.
- AtlasTW.OnShow(): logic when the main Atlas window is shown.

AtlasUILogic.lua
- AtlasTW.MinimapButtonInit(): create/init the minimap button and its position.
- AtlasTW.MinimapButtonOnClick(): LMB/MMB actions — open Atlas/options.
- AtlasTW.MinimapButtonUpdatePosition(): apply saved angle/radius.
- AtlasTW.MinimapButtonBeingDragged(): dragging handler.
- AtlasTW.MinimapButtonOnEnter(): tooltip and hover state.
- AtlasTW.OptionsUpdateAlpha(), AtlasTW.OptionsUpdateScale(): apply alpha/scale to the main frame.
- AtlasTW.ToggleAtlas(): toggle main Atlas window; sync loot panel if needed.
- AtlasTW.SlashCommand(msg): /atlas handler, commands: empty — toggle, options/opt — open options.
- AtlasTW.StartMoving(): begin moving the window (when unlocked).
- AtlasTW.OnClick(): top bar button click handler.

AtlasOptions.lua (options handlers)
- AtlasTW.OptionDefaultSettings(): apply/return default option values.
- AtlasTW.OptionsOnClick(): show/hide options window.
- AtlasTW.OptionsInit(): initialize option widgets with current values.
- AtlasTW.OptionShowPanelOnClick(), OptionAutoshowOnClick(), OptionRightSideOnClick(), OptionLeftSideOnClick(), OptionColorOnClick() etc.: concrete checkbox/button handlers that update SavedVariables and refresh the UI.
- AtlasTW.OptionResetPosition(): reset main Atlas window position to defaults.
- Additional: WorldMap/Acronyms/Clamped/Questlog/SafeLinks/CompareTooltip/DefaultTT/LootlinkTT/ItemSyncTT/ItemID/ItemSpam — each toggles the respective option and triggers Refresh/UI rebuild.

4) Quest module public functions (AtlasTW.Quest.*)
- OnItemEnter(itemIndex)/OnItemLeave(): item tooltips in the quest list.
- OnItemClick(mouseButton, itemIndex): quest list item click; open details/link to chat.
- CloseDetails(): close quest details panel.
- OnQuestClick(questIndex): pick a quest and show details.
- ToggleFinishedFilter(): toggle completed filter.
- NextPage()/PreviousPage(): paginate the quest list.
- OnQuestFrameShow(): init quest frame on show.
- OnStoryClick(): show instance story/history text.
- OnAllianceClick()/OnHordeClick(): switch quest faction.
- CloseQuestFrame()/ToggleQuestFrame(): hide/toggle quest panel.
- OnEvent(): quest module event processing (init, tooltip registration).
- ClearAll()/HideAtlasTWLootFrame(): service helpers; cleanup/sync with loot panel.
- SetQuestText()/SetStoryText()/LoadFinishedQuests()/Update()/SetQuestButtons(): update quest UI text/buttons/state.

5) Loot module public functions (AtlasTW.LootBrowserUI.* and key AtlasTWLoot_*)
- AtlasTW.LootBrowserUI.ScrollBarUpdate(): update loot menu scrollbar state.
- AtlasTW.LootBrowserUI.ScrollBarLootUpdate(): refresh loot items container after page/filter changes.
- AtlasTW.LootBrowserUI.PrepMenu(menuTitle, menuItems, prevMenuText, defIcon): prepare a menu (title, items, back icon).
- AtlasTWLoot_InitializeUI(): initialize bottom loot UI (create frames, buttons, scrollbar).
- The AtlasTWLoot_* namespace contains click handlers, page switches, section menus (Dungeons, World, PvP, Factions, Crafting, etc.), and item tooltip handlers (Item_OnEnter/OnLeave/OnClick). You may call these directly to build/switch menus if needed.

6) ItemDB (items processing)
- AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext): parse item tooltip to extract meta (quality, source).
- AtlasTW.CreateItemsFromLootTable(bossData): build display list from boss loot table.
- AtlasTW.ItemDB.CreateItem(data), CreateSeparator(text, icon, quality): factories for loot container buttons/separators.

7) How to call (WoW 1.12 examples)
- Toggle window:
  if AtlasTWFrame and AtlasTWFrame:IsShown() then AtlasTW.ToggleAtlas() else AtlasTW.ToggleAtlas() end
- Force refresh after changing options:
  AtlasTW.Refresh(); PrintA("Atlas: refreshed")
- Apply live scale/alpha on slider move:
  AtlasTW.OptionsUpdateScale(); AtlasTW.OptionsUpdateAlpha()
- Show quest panel and pick a quest:
  AtlasTW.Quest.ToggleQuestFrame(); AtlasTW.Quest.OnQuestClick(1)
- Refresh current loot page items:
  AtlasTW.LootBrowserUI.ScrollBarLootUpdate()

8) Best practices
- Prefer local functions/variables; expose only intended public API.
- Mind the .toc loading order (core first, then UI/Options/Loot/Quest).
- Guard against nil when touching frames/fields — addon environment initializes stepwise.
- Keep comments in English only (see below).

9) Comment style (EN‑only)
- File header: short description of module purpose.
- Above every public function: one‑liner with Purpose/Params/Returns/Side effects.
- Inside long routines: block comments for key steps.

10) Debugging
- Place PrintA("message") in critical branches and event handlers.

11) SavedVariables
- Account-wide: AtlasTWOptions
  - AtlasButtonShown (bool): show the minimap button.
  - AtlasButtonPosition (number): angle of the minimap button (degrees).
  - AtlasButtonRadius (number): distance from the minimap center.
  - AtlasAlpha (number): Atlas window transparency (0.0–1.0).
  - AtlasScale (number): Atlas window scale.
  - AtlasLocked (bool): disallow dragging the window.
  - AtlasClamped (bool): clamp the window to the screen (SetClampedToScreen).
  - AtlasAutoSelect (bool): auto-select instance by current zone.
  - AtlasRightClick (bool): special RMB behavior inside the window.
  - AtlasAcronyms (bool): show map acronyms.
  - AtlasCursorCoords (bool): show cursor coordinates overlay on the default World Map.
  - AtlasType (number): selected category in the left dropdown.
  - AtlasZone (number): selected map/instance in the right dropdown.
  - LootShowPanel (bool): show the bottom loot panel.
  - LootDefaultTT / LootlinkTT / LootItemSyncTT (bool): item tooltip modes (mutually exclusive).
  - LootShowSource (bool): show source/meta in item tooltips.
  - LootEquipCompare (bool): integrate with EquipCompare/EQCompare (if available).
  - LootOpaque (bool): opaque background for the loot panel.
  - LootItemIDs (bool): show ItemID near the item.
  - LootItemSpam (bool): suppress item link spam in chat.
  - LootSafeLinks / LootAllLinks (bool): safe/all item links (mutually exclusive).
  - QuestWithAtlas (bool): show the quest panel alongside Atlas.
  - QuestCurrentSide ("Left"|"Right"): side of the quest panel.
  - QuestColourCheck (bool): colored styling for quests.
  - QuestCheckQuestlog (bool): cross-check the WoW quest log.
  - QuestAutoQuery (bool): auto-request quest data from the server.
  - QuestQuerySpam (bool): suppress excessive queries.
  - AtlasSortBy (number): categories sorting in options.
  - AtlasVersion (string): technical version field.

- Per-character: AtlasTWCharDB
  - FirstTime (bool): first open (greeting/initialization).
  - QuickLooks (array): quick loot bookmarks [{dataID, storedMenu, titleText}].
  - WishList (array): wishlist (array of item entries).
  - SearchResult (array): results of the last search.
  - LastSearchedText (string): last search query.
  - PartialMatching (bool): partial match mode for search.
  - Per-entity: quest/progress keys (see Quest.* persistence).

12) Main frames and UI elements
- Main window: AtlasTWFrame — parent for the majority of Atlas UI.
- Dropdowns: AtlasTWFrameDropDownType (category), AtlasTWFrameDropDown (map/instance).
- Search field: AtlasTWSearchEditBox.
- Switches/buttons: AtlasTWSwitchButton plus options/quest buttons.
- Minimap: AtlasTWButtonFrame (container), AtlasTWMinimapButton (button), behavior — MinimapButton*.
- World Map: cursor coordinates overlay — visible only when WorldMapFrame is shown; respects AtlasTWOptions.AtlasCursorCoords.
- Loot panel: AtlasTWLootItemsFrame (container), AtlasTWLootScrollBar (scrollbar), AtlasTWLootItemsFrameContainer (dynamic grid for item buttons).
- Options panel: AtlasTWOptionsFrame (+ AtlasTWOptionsFrameDropDownCats).
- Quest panels: Quest.UI_Main.Frame (sidebar), Quest.UI.InsideAtlasFrame (embedded inside Atlas).

13) Events and lifecycle
- ADDON_LOADED: early initialization of frames/resources.
- VARIABLES_LOADED: read/normalize SavedVariables (some frames subscribe here).
- PLAYER_ENTERING_WORLD: final initialization, place minimap button, auto-show panels.
- Note: OnShow/OnHide/OnEvent handlers on AtlasTWFrame and subpanels keep loot/quests in sync.

14) Slash commands and keybinds
- /atlas — AtlasTW.SlashCommand: no args — toggle window; options/opt — open options window.
- Keybinds: Bindings.xml defines Atlas navigation actions that depend on AtlasTWFrame visibility.

15) Data flows (typical scenarios)
- Search:
  1) User types into AtlasTWSearchEditBox → AtlasTW.Search(text).
  2) The search module fills AtlasTWCharDB.SearchResult and LastSearchedText.
  3) The loot panel reads SearchResult and displays results; ScrollBarLootUpdate refreshes the container.
- Loot menu navigation:
  1) AtlasTW.LootBrowserUI.PrepMenu prepares menu/title/"Back".
  2) Clicks on entries/pages update StoredElement/StoredMenu/activeElement.
  3) ScrollBarLootUpdate and navigation buttons (NEXT/PREV/BACK) change the visible page.
- Quests:
  1) Opening the panel → OnQuestFrameShow/ToggleQuestFrame.
  2) Choosing a quest → OnQuestClick → SetQuestText/SetQuestButtons → Update.
  3) Quest item tooltips → OnItemEnter/OnItemLeave.

16) Full API list (by modules)
Core/UI (Atlas.lua, AtlasUILogic.lua)
- AtlasTW.Search(text)
- AtlasTW.OnEvent()
- AtlasTW.PopulateDropdowns()
- AtlasTW.ToggleLock()
- AtlasTW.Refresh()
- AtlasTW.SwitchButtonOnClick()
- AtlasTW.FrameDropDownTypeOnShow()
- AtlasTW.FrameDropDownOnShow()
- AtlasTW.OnShow()
- AtlasTW.MinimapButtonInit()
- AtlasTW.MinimapButtonOnClick()
- AtlasTW.MinimapButtonUpdatePosition()
- AtlasTW.MinimapButtonBeingDragged()
- AtlasTW.MinimapButtonOnEnter()
- AtlasTW.OptionsUpdateAlpha()
- AtlasTW.OptionsUpdateScale()
- AtlasTW.ToggleAtlas()
- AtlasTW.SlashCommand(msg)
- AtlasTW.StartMoving()
- AtlasTW.OnClick()

Options (AtlasOptions.lua)
- AtlasTW.OptionDefaultSettings()
- AtlasTW.OptionsOnClick()
- AtlasTW.OptionsInit()
- AtlasTW.OptionShowPanelOnClick()
- AtlasTW.OptionAutoshowOnClick()
- AtlasTW.OptionRightSideOnClick()
- AtlasTW.OptionLeftSideOnClick()
- AtlasTW.OptionColorOnClick()
- AtlasTW.OptionQuestlogOnClick()
- AtlasTW.OptionAutoQueryOnClick()
- AtlasTW.OptionQuerySpamOnClick()
- AtlasTW.OptionSafeLinksOnClick()
- AtlasTW.OptionAllLinksOnClick()
- AtlasTW.OptionDefaultTTOnClick()
- AtlasTW.OptionLootlinkTTOnClick()
- AtlasTW.OptionItemSyncTTOnClick()
- AtlasTW.OptionShowSourceOnClick()
- AtlasTW.OptionEquipCompareOnClick()
- AtlasTW.OptionOpaqueOnClick()
- AtlasTW.OptionItemIDOnClick()
- AtlasTW.OptionItemSpamOnClick()
- AtlasTW.OptionsCursorCoordsOnClick()
- AtlasTW.OptionResetPosition()
- AtlasTW.OptionFrameDropDownCatsOnShow()

Quests (QuestMain.lua, QuestLogic.lua)
- AtlasTW.Quest.ClearAll()
- AtlasTW.Quest.HideAtlasTWLootFrame()
- AtlasTW.Quest.SetQuestText()
- AtlasTW.Quest.SetStoryText()
- AtlasTW.Quest.LoadFinishedQuests()
- AtlasTW.Quest.Update()
- AtlasTW.Quest.SetQuestButtons()
- AtlasTW.Quest.OnItemEnter(itemIndex)
- AtlasTW.Quest.OnItemLeave()
- AtlasTW.Quest.OnItemClick(mouseButton, itemIndex)
- AtlasTW.Quest.CloseDetails()
- AtlasTW.Quest.OnQuestClick(questIndex)
- AtlasTW.Quest.ToggleFinishedFilter()
- AtlasTW.Quest.NextPage()
- AtlasTW.Quest.PreviousPage()
- AtlasTW.Quest.OnQuestFrameShow()
- AtlasTW.Quest.OnStoryClick()
- AtlasTW.Quest.OnAllianceClick()
- AtlasTW.Quest.OnHordeClick()
- AtlasTW.Quest.CloseQuestFrame()
- AtlasTW.Quest.ToggleQuestFrame()
- AtlasTW.Quest.OnEvent()

Loot (Loot/Core/Init.lua, Loot/LootUI.lua)
- AtlasTW.LootBrowserUI.ScrollBarUpdate()
- AtlasTW.LootBrowserUI.ScrollBarLootUpdate()
- AtlasTW.LootBrowserUI.PrepMenu(menuTitle, menuItems, prevMenuText, defIcon)
- AtlasTWLoot_InitializeUI() and related AtlasTWLoot_* (UI creation, navigation, click/tooltip handlers)

ItemDB (Loot/Data/ItemDB.lua)
- AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext)
- AtlasTW.CreateItemsFromLootTable(bossData)
- AtlasTW.ItemDB.CreateItem(data)
- AtlasTW.ItemDB.CreateSeparator(text, icon, quality)

17) Integration with other addons
- EquipCompare/EQCompare: if present — enable comparison in item tooltips when AtlasTWOptions.LootEquipCompare is set.
- LootLink/ItemSync: if absent — force-enable LootDefaultTT and clear the related flags.

18) Positioning/scale/transparency
- Scale and alpha are applied to AtlasTWFrame via OptionsUpdateScale/OptionsUpdateAlpha.
- Window position resets via OptionResetPosition(); dragging works when unlocked (AtlasLocked=false).
- Minimap button placement uses AtlasButtonPosition/AtlasButtonRadius; color/hover managed in MinimapButton*.

19) Examples
- Enable safe links and refresh UI:
  AtlasTWOptions.LootSafeLinks = true; AtlasTWOptions.LootAllLinks = false; AtlasTW.Refresh(); PrintA("Atlas: links updated")
- Switch quest panel side and update buttons:
  AtlasTWOptions.QuestCurrentSide = "Right"; AtlasTW.Quest.Update();
- Add a QuickLook for current category (rough sketch):
  -- check AtlasTWCharDB.QuickLooks; save {dataID, storedMenu, titleText}; call ScrollBarUpdate.

## Version Broadcast & Update Marker

- Module files: `AtlasTWVersion.lua` (version logic), `AtlasTW.lua` (frame and refresh hook), `AtlasTWUI.lua` (UI elements).
- Abbrev: `VC.abbrev = "ATW"`.
- Channel: `VC.channelName = "LFT"`.
- Message format: `ATW:<number>:v` where `<number> = major*1000 + minor` (e.g., `1.35` → `1035`).
- Parser: `([^:]+):([^:]+):([^:]+)`; own messages ignored (`sender ~= UnitName("player")`).

### Join / Publish Scheduling

- On `PLAYER_ENTERING_WORLD`, the module schedules a join via `VC.joinAt = GetTime() + 5` and resets publish timing.
- `VC.OnUpdate(self, elapsed)` ticks each second (`VC.updateTick = 1.0`) to:
  - Attempt joining `LFT` at/after `VC.joinAt`.
  - Publish local version periodically via `VC.publishVersion()` when the delay elapses.

### UI Marker Logic

- UI element: `AtlasTWUpdateMarker` defined in `AtlasTWUI.lua` (red `Update!` next to the version text).
- Visibility controller: `AtlasTW.UpdateMarkerRefresh()` in `AtlasTW.lua`:
  - Shows marker if `VC.updateAvailable` is true or if a known remote version is strictly greater than local (`VC.remoteVersion > VC.localVersion`).
  - Hides marker otherwise.
- The refresh is invoked:
  - From `AtlasTW.OnShow()` whenever the main frame is shown.
  - From `AtlasTWVersion.lua` after processing incoming versions when the function is available.

### Flags & Helpers

- `VC.remoteVersionSeen` is set when a valid remote version is parsed.
- `VC.updateAvailable` is set when a remote version exceeds local.
- `VC.getLocalVersionString()` reads the addon's `.toc` version string.
- `VC.getVersionNumber()` converts version to `major*1000 + minor`.

### Test Macros

- Simulate an incoming channel message:
  - `/run event="CHAT_MSG_CHANNEL"; arg1="ATW:1036:v"; arg2="OtherPlayer"; arg4="6. LFT"; AtlasTWVersionFrame:GetScript("OnEvent")()`
- Print local version:
  - `/run local VC=AtlasTW.VersionCheck; DEFAULT_CHAT_FRAME:AddMessage("Version: "..(VC.getLocalVersionString() or "?"))`
- Force publish:
  - `/run local VC=AtlasTW.VersionCheck; VC.resetPublishDelay(); VC.publishVersion()`

### Slash Commands

- `/atlastw` — toggle Atlas‑TW window; `options`/`opt` opens options.
- `/atlastw ver` — print local Atlas‑TW version to chat.
- `/atlastw ver check` — immediately publish your version to `LFT` and print confirmation.

Implementation:
- Registration in `AtlasTWUI.lua`:
  - `SLASH_ATLASTW1 = "/atlastw"`
  - `SlashCmdList["ATLASTW"] = AtlasTW.SlashCommand`
- Handler in `AtlasTWUILogic.lua`:
  - `AtlasTW.SlashCommand(msg)` routes `options|opt|ver|ver check`; default action toggles the main window.

20) Localization System

The addon uses a custom localization system based on Namespaces.
Core file: `LocalizationFramework.lua`.

Localization file structure:
`Locales/<Locale>/<File>.lua`
Example: `Locales/ruRU/Core.lua`, `Locales/enUS/MapData.lua`.

Registering translations:
Use `AtlasTW.Localization:RegisterNamespace(namespaceName, locale, data)`.
Example:
```lua
AtlasTW.Localization:RegisterNamespace("UI", "enUS", {
    ["Options"] = "Options",
    -- ...
})
```

Accessing translations:
Use `AtlasTW.Localization:GetNamespace(namespaceName)`.
Example:
```lua
local L = AtlasTW.Localization:GetNamespace("UI")
PrintA(L["Options"])
```

Available Namespaces:
- `UI`: Core interface strings (Core.lua).
- `MapData`: Map and zone names (MapData.lua).
- `Bosses`: Boss names (Bosses.lua).
- `Classes`: Class names (Classes.lua).
- `Factions`: Faction names (Factions.lua).
- `ItemSets`: Item set names (ItemSets.lua).
- `Spells`: Spell and profession names (Spells.lua).
- `Zones`: Zone names for dropdowns (Zones.lua).

Important:
- Always use `enUS` as the base locale. If a translation is missing in the current locale, the system will automatically fallback to `enUS`.
- For new strings, first add them to `Locales/enUS/Core.lua` (or the relevant file), and then to other locales.