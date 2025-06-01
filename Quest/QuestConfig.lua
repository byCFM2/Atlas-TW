-- Variables & Constants Quest Config

AtlasKTW = {

    -- Variables
    Q = {},
    isHorde = UnitFactionGroup("player") == "Horde" or false,
    CurrentMap = nil,
    QLoaded = false,
    QUpdateNow = true,
    QCurrentPage = 0,
    QCurrentQuest = 0,
    QCurrentButton = 0,
    QCurrentInstance = 0,

    --Options
    QCheckQuestlog = true,
    QQuerySpam = true,
    QAutoQuery = true,
    QCurrentSide = "left",
    QWithAtlas = true,
    QColourCheck = true,
    QCompareTooltip = true,

    -- Constants
    QMAXQUESTS = 23,
    QMAXINSTANCES = 98,
    QMAXQUESTITEMS = 6,
}