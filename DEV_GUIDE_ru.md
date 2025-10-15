# Atlas‑TW — Developer Guide (RU)

Цель: кратко и точно описать публичные функции аддона и как их вызывать в окружении WoW 1.12.

1) Окружение и ограничения WoW 1.12
- Используйте this вместо self в обработчиках UI.
- Для размеров фреймов применяйте SetWidth/SetHeight, не SetSize.
- SetScript: локальная функция — SetScript("Event", "LocalFuncName"); глобальная/анонимная — SetScript("Event", function() ... end).
- Не используйте #:len, string.match/gmatch — их нет в 1.12.
- Для отладки используйте print("..."), без сложных форматтеров.

2) Архитектура модулей
- Ядро/фрейм: Atlas.lua, AtlasUI.lua, AtlasUILogic.lua — окно карты, выпадающие списки, кнопка у миникарты, слайдеры скейла/прозрачности, слэш‑команда /atlas.
- Опции: AtlasOptions.lua — окно настроек и обработчики чекбоксов/слайдеров.
- Лут: Loot/Core/*, Loot/LootUI.lua — нижняя панель, меню, скролл, обработчики предметов.
- Квесты: Quest/* — боковая панель квестов и внутренняя панель в Atlas.
- Данные предметов/квестов: Loot/Data/*, Quest/Data/*.

3) Публичные функции (AtlasTW.*)
Atlas.lua
- AtlasTW.Search(text): запустить поиск по данным Atlas/луту по строке text; обновляет UI. Вызывать при изменении поискового поля.
- AtlasTW.OnEvent(): общий обработчик событий Atlas; регистрируется на PLAYER_LOGIN и др.
- AtlasTW.PopulateDropdowns(): заполнение выпадающих списков (категории/инстансы). Обычно вызывается ядром при инициализации/обновлении.
- AtlasTW.ToggleLock(): переключить блокировку перемещения окна Atlas.
- AtlasTW.Refresh(): полностью перерисовать текущую карту и связанные панели после смены категории/инстанса/опций.
- AtlasTW.SwitchButtonOnClick(): обработчик клика по кнопке переключения режимов (в верхней панели Atlas).
- AtlasTW.FrameDropDownTypeOnShow(), AtlasTW.FrameDropDownOnShow(): обработчики OnShow для дропдаунов (инициализация списков).
- AtlasTW.OnShow(): логика при показе главного окна Atlas.

AtlasUILogic.lua
- AtlasTW.MinimapButtonInit(): создать/инициализировать кнопку у миникарты и позицию.
- AtlasTW.MinimapButtonOnClick(): ЛКМ/СКМ действия: открыть Atlas/опции.
- AtlasTW.MinimapButtonUpdatePosition(): применить сохранённые углы/радиус.
- AtlasTW.MinimapButtonBeingDragged(): обработчик перетаскивания.
- AtlasTW.MinimapButtonOnEnter(): подсказка и состояние при наведении.
- AtlasTW.OptionsUpdateAlpha(), AtlasTW.OptionsUpdateScale(): применить прозрачность/масштаб к главному окну.
- AtlasTW.ToggleAtlas(): показать/скрыть главное окно Atlas, при необходимости синхронизировать нижнюю панель лута.
- AtlasTW.SlashCommand(msg): обработчик /atlas, команды: пусто — toggle, options/opt — открыть опции.
- AtlasTW.StartMoving(): начало перемещения окна (при разблокировке).
- AtlasTW.OnClick(): обработчик кликов на кнопках верхней панели.

AtlasOptions.lua (обработчики опций)
- AtlasTW.OptionDefaultSettings(): применить/вернуть значения по умолчанию для настроек.
- AtlasTW.OptionsOnClick(): показать/скрыть окно настроек.
- AtlasTW.OptionsInit(): инициализация элементов окна опций их текущими значениями.
- AtlasTW.OptionShowPanelOnClick(), OptionAutoshowOnClick(), OptionRightSideOnClick(), OptionLeftSideOnClick(), OptionColorOnClick() и т. п.: обработчики конкретных чекбоксов/кнопок, обновляют SavedVariables и перерисовывают UI.
- AtlasTW.OptionResetPosition(): вернуть основное окно Atlas в дефолтную позицию.
- Дополнительно: WorldMap/Acronyms/Clamped/Questlog/SafeLinks/CompareTooltip/DefaultTT/LootlinkTT/ItemSyncTT/ItemID/ItemSpam — по названию видно назначение; каждый обработчик меняет соответствующую опцию и вызывает Refresh/пересборку UI.

4) Публичные функции квестового модуля (AtlasTW.Quest.*)
- OnItemEnter(itemIndex)/OnItemLeave(): подсказки предметов в списке квестов.
- OnItemClick(mouseButton, itemIndex): клик по предмету в списке; открыть детали/линк в чат.
- CloseDetails(): закрыть панель деталей квеста.
- OnQuestClick(questIndex): выбрать квест и показать подробности.
- ToggleFinishedFilter(): фильтр «завершённые».
- NextPage()/PreviousPage(): листание страниц списка квестов.
- OnQuestFrameShow(): инициализация при показе панели квестов.
- OnStoryClick(): показать текст «Story/History» инстанса.
- OnAllianceClick()/OnHordeClick(): переключение фракции для квестов.
- CloseQuestFrame()/ToggleQuestFrame(): скрыть/переключить панель квестов.
- OnEvent(): обработка событий модуля (инициализация, регистрация тултипов).
- ClearAll()/HideAtlasTWLootFrame(): служебные; очистка/синхронизация с лут‑панелью.
- SetQuestText()/SetStoryText()/LoadFinishedQuests()/Update()/SetQuestButtons(): обновление текста/кнопок/состояния UI.

5) Публичные функции лут‑модуля (AtlasTW.LootBrowserUI.* и ключевые AtlasTWLoot_*)
- AtlasTW.LootBrowserUI.ScrollBarUpdate(): обновление состояния скроллбара меню.
- AtlasTW.LootBrowserUI.ScrollBarLootUpdate(): обновить список предметов в контейнере (нижняя панель) при смене страницы/фильтра.
- AtlasTW.LootBrowserUI.PrepMenu(menuTitle, menuItems, prevMenuText, defIcon): подготовить меню (заголовок, элементы, иконка «назад»).
- AtlasTWLoot_InitializeUI(): инициализация UI нижней панели лута (создание фреймов, кнопок, скролла).
- В пространстве имен AtlasTWLoot_* расположены обработчики кликов, переключателей страниц, меню разделов (Dungeons, World, PvP, Factions, Crafting и пр.) и тултипы (Item_OnEnter/OnLeave/OnClick). Их можно вызывать напрямую для сборки/переключения меню при необходимости.

6) ItemDB (работа с предметами)
- AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext): разбор тултипа предмета для извлечения доп.информации (качество, источник).
- AtlasTW.CreateItemsFromLootTable(bossData): создать отображаемый список элементов из лут‑таблицы босса.
- AtlasTW.ItemDB.CreateItem(data), CreateSeparator(text, icon, quality): фабрики для кнопок/разделителей в контейнере лута.

7) Как вызывать (примеры для 1.12)
- Toggle окна:
  if AtlasTWFrame and AtlasTWFrame:IsShown() then AtlasTW.ToggleAtlas() else AtlasTW.ToggleAtlas() end
- Принудительный рефреш после смены опций:
  AtlasTW.Refresh(); print("Atlas: обновлено")
- Применить скейл/альфу при движении слайдера:
  AtlasTW.OptionsUpdateScale(); AtlasTW.OptionsUpdateAlpha()
- Показать панель квестов и выбрать квест:
  AtlasTW.Quest.ToggleQuestFrame(); AtlasTW.Quest.OnQuestClick(1)
- Обновить список лута текущей страницы:
  AtlasTW.LootBrowserUI.ScrollBarLootUpdate()

8) Лучшие практики
- Делаем все функции и переменные локальными по умолчанию; глобальные — только публичный API.
- Учитывайте порядок загрузки из .toc (сначала ядро, затем UI/Options/Loot/Quest).
- Проверяйте nil перед обращением к фреймам/полям; окружение аддонов загружается поэтапно.
- Комментарии в коде — только на английском (см. ниже).

9) Стиль комментариев (EN‑only)
- Заголовок файла: кратко, что делает модуль.
- Перед каждой публичной функцией: короткий однострочник Purpose/Params/Returns/Side effects.
- Внутри длинных процедур: блочные комментарии для ключевых шагов.

10) Отладка
- Вставляйте print("AtlasTW: message") в критических ветках и обработчиках событий.

11) SavedVariables
- Account-wide: AtlasTWOptions
  - AtlasButtonShown (bool): показывать кнопку у миникарты.
  - AtlasButtonPosition (number): угол расположения кнопки на миникарте (в градусах).
  - AtlasButtonRadius (number): радиус от центра миникарты.
  - AtlasAlpha (number): прозрачность окна Atlas (0.0–1.0).
  - AtlasScale (number): масштаб окна Atlas.
  - AtlasLocked (bool): запрет перемещения окна.
  - AtlasClamped (bool): запрет вывода окна за край экрана (SetClampedToScreen).
  - AtlasAutoSelect (bool): автоподбор инстанса по текущей зоне.
  - AtlasRightClick (bool): особое поведение ПКМ в окне.
  - AtlasAcronyms (bool): показывать аббревиатуры карт.
  - AtlasCursorCoords (bool): показывать оверлей координат курсора на стандартной Карте мира.
  - AtlasType (number): выбранная категория в левом дропдауне.
  - AtlasZone (number): выбранная карта/инстанс в правом дропдауне.
  - LootShowPanel (bool): показывать нижнюю панель лута.
  - LootDefaultTT / LootlinkTT / LootItemSyncTT (bool): режимы подсказок предметов (взаимоисключающие).
  - LootShowSource (bool): показывать источник/данные в тултипе предметов.
  - LootEquipCompare (bool): интеграция с EquipCompare/EQCompare (если аддоны доступны).
  - LootOpaque (bool): непрозрачный фон панели лута.
  - LootItemIDs (bool): показывать ItemID рядом с предметом.
  - LootItemSpam (bool): подавлять спам ссылок предметов в чат.
  - LootSafeLinks / LootAllLinks (bool): безопасные/все ссылки предметов (взаимоисключающие).
  - QuestWithAtlas (bool): показывать панель квестов вместе с Atlas.
  - QuestCurrentSide ("Left"|"Right"): сторона панели квестов.
  - QuestColourCheck (bool): цветовое оформление квестов.
  - QuestCheckQuestlog (bool): сверка с журналом квестов.
  - QuestAutoQuery (bool): авто-запрос данных квестов у сервера.
  - QuestQuerySpam (bool): подавление спама запросов.
  - QuestCompareTooltip (bool): сравнение предметов в тултипах (с учётом pfUI/EquipCompare).
  - AtlasSortBy (number): сортировка категорий в опциях.
  - AtlasVersion (string): служебное поле версии.

- Per-character: AtlasTWCharDB
  - FirstTime (bool): первое открытие (приветствие/инициализация).
  - QuickLooks (array): быстрые закладки лута [{dataID, storedMenu, titleText}].
  - WishList (array): список желаний (массив записей предметов).
  - SearchResult (array): результаты последнего поиска.
  - LastSearchedText (string): последний поисковый запрос.
  - PartialMatching (bool): режим частичного совпадения в поиске.
  - Пер-сущность: ключи квестов/прогресса (см. Quest.* сохранения).

12) Основные фреймы и элементы UI
- Главное окно: AtlasTWFrame — базовый родитель большинства элементов Atlas.
- Дропдауны: AtlasTWFrameDropDownType (категория), AtlasTWFrameDropDown (карта/инстанс).
- Поле поиска: AtlasTWSearchEditBox.
- Переключатели/кнопки: AtlasTWSwitchButton, кнопки опций/квестов.
- Миникарта: AtlasTWButtonFrame (контейнер), AtlasTWMinimapButton (кнопка), логика — MinimapButton*.
- Карта мира: оверлей координат курсора — виден только при открытой WorldMapFrame; учитывает AtlasTWOptions.AtlasCursorCoords.
- Панель лута: AtlasTWLootItemsFrame (контейнер), AtlasTWLootScrollBar (скролл), AtlasTWLootItemsFrameContainer (динамическая сетка кнопок предметов).
- Панель опций: AtlasTWOptionsFrame (+ AtlasTWOptionsFrameDropDownCats).
- Панель квестов: Quest.UI_Main.Frame (боковая), Quest.UI.InsideAtlasFrame (встроенная в Atlas).

13) События и жизненный цикл
- ADDON_LOADED: ранняя инициализация фреймов/ресурсов.
- VARIABLES_LOADED: чтение/нормализация SavedVariables (некоторые фреймы подписаны).
- PLAYER_ENTERING_WORLD: финальная инициализация, расстановка мини-кнопки и автопоказ панелей.
- Примечание: обработчики OnShow/OnHide/OnEvent у AtlasTWFrame и подпанелей синхронизируют состояние лута/квестов.

14) Слэш-команды и бинды
- /atlas — AtlasTW.SlashCommand: без аргументов — показать/скрыть окно; options/opt — открыть окно опций.
- Клавиши: Bindings.xml содержит действия для навигации Atlas, завязанные на видимость AtlasTWFrame.

15) Потоки данных (типичные сценарии)
- Поиск:
  1) Пользователь вводит текст в AtlasTWSearchEditBox → AtlasTW.Search(text).
  2) Модуль поиска формирует AtlasTWCharDB.SearchResult и LastSearchedText.
  3) Панель лута читает SearchResult и показывает результаты; ScrollBarLootUpdate обновляет контейнер.
- Навигация по лут‑меню:
  1) AtlasTW.LootBrowserUI.PrepMenu подготавливает меню/заголовок/«Назад».
  2) Клики по элементам/страницам обновляют StoredElement/StoredMenu/activeElement.
  3) ScrollBarLootUpdate и кнопки навигации (NEXT/PREV/BACK) меняют видимую страницу.
- Квесты:
  1) Открытие панели → OnQuestFrameShow/ToggleQuestFrame.
  2) Выбор квеста → OnQuestClick → SetQuestText/SetQuestButtons → Update.
  3) Тултипы предметов квестов → OnItemEnter/OnItemLeave.

16) Полный перечень API (по модулям)
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
- AtlasTW.OptionCompareTooltipOnClick()
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
- AtlasTWLoot_InitializeUI() и связанные AtlasTWLoot_* (создание UI, навигация, обработчики кликов/тултипов)

ItemDB (Loot/Data/ItemDB.lua)
- AtlasTW.ItemDB.ParseTooltipForItemInfo(itemID, extratext)
- AtlasTW.CreateItemsFromLootTable(bossData)
- AtlasTW.ItemDB.CreateItem(data)
- AtlasTW.ItemDB.CreateSeparator(text, icon, quality)

17) Интеграция с другими аддонами
- EquipCompare/EQCompare: если найден — включается сравнение в тултипах при AtlasTWOptions.LootEquipCompare.
- LootLink/ItemSync: если отсутствуют — принудительно активируется LootDefaultTT и снимаются соответствующие флаги.
- pfUI: учитывается в логике QuestCompareTooltip.

18) Позиционирование/масштаб/прозрачность
- Масштаб и альфа применяются к AtlasTWFrame через OptionsUpdateScale/OptionsUpdateAlpha.
- Позиция окна сбрасывается OptionResetPosition(); перетаскивание работает при снятой блокировке (AtlasLocked=false).
- Кнопка у миникарты позиционируется по AtlasButtonPosition/AtlasButtonRadius; покраска/hover управляются в MinimapButton*.

19) Примеры
- Включить безопасные ссылки и обновить UI:
  AtlasTWOptions.LootSafeLinks = true; AtlasTWOptions.LootAllLinks = false; AtlasTW.Refresh(); print("Atlas: links updated")
- Переключить сторону панели квестов и заново выставить кнопки:
  AtlasTWOptions.QuestCurrentSide = "Right"; AtlasTW.Quest.Update();
- Добавить быстрый просмотр (QuickLooks) текущей категории (примерно):
  -- проверьте AtlasTWCharDB.QuickLooks; сохраните {dataID, storedMenu, titleText}; вызовите ScrollBarUpdate.

## Рассылка версии и индикатор обновления

- Модули: `AtlasTWVersion.lua` (логика версий), `AtlasTW.lua` (фрейм и хук обновления), `AtlasTWUI.lua` (UI-элементы).
- Префикс: `VC.abbrev = "ATW"`.
- Канал: `VC.channelName = "LFT"`.
- Формат сообщения: `ATW:<number>:v`, где `<number> = major*1000 + minor` (например, `1.35` → `1035`).
- Парсер: `([^:]+):([^:]+):([^:]+)`; собственные сообщения игнорируются (`sender ~= UnitName("player")`).

### Планирование присоединения/публикации

- На событие `PLAYER_ENTERING_WORLD` модуль планирует присоединение через `VC.joinAt = GetTime() + 5` и сбрасывает тайминги публикации.
- `VC.OnUpdate(self, elapsed)` тикает раз в секунду (`VC.updateTick = 1.0`) и:
  - Пытается присоединиться к `LFT` в момент/после `VC.joinAt`.
  - Периодически публикует локальную версию через `VC.publishVersion()` по истечении задержки.

### Логика UI-индикатора

- UI-элемент: `AtlasTWUpdateMarker` определён в `AtlasTWUI.lua` (красный `Update!` рядом с текстом версии).
- Контроллер видимости: `AtlasTW.UpdateMarkerRefresh()` в `AtlasTW.lua`:
  - Показывает индикатор, если `VC.updateAvailable` истинно или если известная удалённая версия строго больше локальной (`VC.remoteVersion > VC.localVersion`).
  - Скрывает индикатор иначе.
- Обновление вызывается:
  - Из `AtlasTW.OnShow()` при каждом показе основного фрейма.
  - Из `AtlasTWVersion.lua` после обработки входящих версий, если функция доступна.

### Флаги и помощники

- `VC.remoteVersionSeen` устанавливается при разборе корректной удалённой версии.
- `VC.updateAvailable` устанавливается, когда удалённая версия превышает локальную.
- `VC.getLocalVersionString()` читает строку версии из файла `.toc` аддона.
- `VC.getVersionNumber()` конвертирует версию в `major*1000 + minor`.

### Тестовые макросы

- Сымитировать входящее сообщение канала:
  - `/run event="CHAT_MSG_CHANNEL"; arg1="ATW:1035:v"; arg2="OtherPlayer"; arg4="3. LFT"; AtlasTWVersionFrame:GetScript("OnEvent")()`
- Напечатать локальную версию:
  - `/run local VC=AtlasTW.VersionCheck; DEFAULT_CHAT_FRAME:AddMessage("Version: "..(VC.getLocalVersionString() or "?"))`
- Принудительно опубликовать версию:
  - `/run local VC=AtlasTW.VersionCheck; VC.resetPublishDelay(); VC.publishVersion()`

### Слэш-команды

- `/atlastw` — переключить окно Atlas‑TW; `options`/`opt` открывает настройки.
- `/atlastw ver` — вывести локальную версию Atlas‑TW в чат.
- `/atlastw ver check` — немедленно опубликовать вашу версию в канале `LFT` и вывести подтверждение.

Реализация:
- Регистрация в `AtlasTWUI.lua`:
  - `SLASH_ATLASTW1 = "/atlastw"`
  - `SlashCmdList["ATLASTW"] = AtlasTW.SlashCommand`
- Обработчик в `AtlasTWUILogic.lua`:
  - `AtlasTW.SlashCommand(msg)` распознаёт `options|opt|ver|ver check`; действие по умолчанию — переключить главное окно.