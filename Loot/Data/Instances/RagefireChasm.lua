-- RagefireChasm Loot Data
-- Compatible with Atlas Loot TW

local L = AtlasTW.Local
local BZ = AceLibrary("Babble-Zone-2.2a")
local BB = AceLibrary("Babble-Boss-2.2a")

AtlasTW.InstanceData = AtlasTW.InstanceData or {}

AtlasTW.InstanceData.RagefireChasm = {
    Name = BZ["Ragefire Chasm"],
    Location = BZ["Orgrimmar"],
    Level = {8,18},
    Acronym = "RFC",
    MaxPlayers = 5,
    DamageType = L["Physical"],
    Entrances = {
        { letter = "A) "..L["Entrance"] }
    },

    Bosses = {
        {
            id = "RFCOggleflint",
            prefix = "1)",
            name = BB["Oggleflint"],
            loot = {
                {id=80700, dropRate=35},
                {id=80701, dropRate=35},
                {id=80702, dropRate=30},
                {},
                {id=17041, disc=L["Level One Lunatic Challenge"], dropRate=100},
            }
        },
        {
            id = "RFCTaragaman",
            prefix = "2)",
            name = BB["Taragaman the Hungerer"],
            defaults = { dropRate = 33 },
            loot = {
                {id=14149},
                {id=14148},
                {id=14145},
                {},
                {id=64, disc=L["Level One Lunatic Challenge"], dropRate=100},
            }
        },
        {
            id = "RFCJergosh",
            prefix = "3)",
            name = BB["Jergosh the Invoker"],
            defaults = { dropRate = 33 },
            loot = {
                {id=14150},
                {id=14147},
                {id=14151},
                {},
                {id=80111, disc=L["Level One Lunatic Challenge"], dropRate=100},
            }
        },
        {
            id = "RFCBazzalan",
            prefix = "4)",
            name = BB["Bazzalan"],
            defaults = { dropRate = 30 },
            loot = {
                {id=80705},
                {id=80704},
                {id=80703},
                {},
                {id=5235, disc=L["Level One Lunatic Challenge"], dropRate=100},
                {},
                {id=51217, disc=L["Transmogrification"], dropRate=1},
            }
        },
        {
            id = "RFCTrash",
            name = L["Trash Mobs"].."-"..BZ["Ragefire Chasm"],
            loot = {
                {id=12862, disc=L["Level One Lunatic Challenge"], dropRate = 25},
            }
        },
    },
}

-- Инициализация предметов для всех боссов
for _, bossData in ipairs(AtlasTW.InstanceData.RagefireChasm.Bosses) do
    bossData.items = bossData.items or AtlasTW.CreateItemsFromLootTable(bossData)
    bossData.loot = nil -- Очищаем временные данные
end