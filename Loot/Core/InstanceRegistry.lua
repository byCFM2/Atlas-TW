--[[
  This file contains the structured data for instances and their bosses.
  The data is organized in a way that makes it easy to navigate through bosses sequentially.

  Structure:
  AtlasLoot_InstanceData = {
      ["InstanceInternalName"] = {
          Name = "Localized Instance Name",
          Bosses = {
              { ID = "BossID1", Title = "Localized Boss Name 1" },
              { ID = "BossID2", Title = "Localized Boss Name 2" },
              -- ... more bosses
          }
      },
      -- ... more instances
  }
]]
local L = AceLibrary("AceLocale-2.2"):new("Atlas")
local BB = AceLibrary("Babble-Boss-2.2a")
local BZ = AceLibrary("Babble-Zone-2.2a")

AtlasLoot_InstanceData = {
    ["HellfireQuarry"] = {
        Name = "Hellfire Quarry", -- NOTE: Instance name is a guess as 'HQ' is not standard
        Bosses = {
            { ID = "HQHighForemanBargulBlackhammer", Title = "High Foreman Bargul Blackhammer" },
            { ID = "HQEngineerFiggles", Title = "Engineer Figgles" },
            { ID = "HQCorrosis", Title = "Corrosis" },
            { ID = "HQHatereaverAnnihilator", Title = "Hatereaver Annihilator" },
            { ID = "HQHargeshDoomcaller", Title = "Hargesh Doomcaller" },
            { ID = "HQTrash", Title = L["Trash Mobs"] },
        }
    },
    ["BlackrockDepths"] = {
        Name = BZ["Blackrock Depths"],
        Bosses = {
            { ID = "BRDLordRoccor", Title = "Lord Roccor" },
            { ID = "BRDHighInterrogatorGerstahn", Title = "High Interrogator Gerstahn" },
            { ID = "BRDAnubshiah", Title = "Anub'shiah" },
            { ID = "BRDEviscerator", Title = "Eviscerator" },
            { ID = "BRDGorosh", Title = "Gorosh the Dervish" },
            { ID = "BRDGrizzle", Title = "Grizzle" },
            { ID = "BRDHedrum", Title = "Hedrum the Creeper" },
            { ID = "BRDOkthor", Title = "Ok'thor the Breaker" },
            { ID = "BRDTheldren", Title = "Theldren" },
            { ID = "BRDHoundmaster", Title = "Houndmaster Grebmar" },
            { ID = "BRDPyromancerLoregrain", Title = "Pyromancer Loregrain".." ("..L["Rare"]..")" },
            { ID = "BRDTheVault", Title = "The Vault" },
            { ID = "BRDWarderStilgiss", Title = "Warder Stilgiss".." ("..L["Rare"]..")" },
            { ID = "BRDVerek", Title = "Verek".." ("..L["Rare"]..")" },
            { ID = "BRDFineousDarkvire", Title = "Fineous Darkvire" },
            { ID = "BRDLordIncendius", Title = "Lord Incendius" },
            { ID = "BRDBaelGar", Title = "Bael'Gar" },
            { ID = "BRDGeneralAngerforge", Title = "General Angerforge" },
            { ID = "BRDGolemLordArgelmach", Title = "Golem Lord Argelmach" },
            { ID = "BRDGuzzler", Title = "The Grim Guzzler" },
            { ID = "BRDFlamelash", Title = "Ambassador Flamelash" },
            { ID = "BRDPanzor", Title = "Panzor the Invincible".." ("..L["Rare"]..")" },
            { ID = "BRDTomb", Title = "Summoner's Tomb" },
            { ID = "BRDMagmus", Title = "Magmus" },
            { ID = "BRDPrincess", Title = "Princess Moira Bronzebeard" },
            { ID = "BRDEmperorDagranThaurissan", Title = "Emperor Dagran Thaurissan" },
            { ID = "BRDTrash", Title = "Trash Mobs" },
        }
    },
}