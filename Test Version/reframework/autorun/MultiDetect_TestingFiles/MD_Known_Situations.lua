-- ✅ Confirmed, human-readable situation mappings, with comments as to WHEN they exactly trigger. Add/Update entries as you confirm them!
-- Once all (44 as of writing) situations are confirmed, this list will only neeed to be changed when/if new updates arrive that modify them.
return {
    [1]  = "Online",                      -- Player is not Offline or Solo-Online
    [2]  = "SoloOnline",                  -- Exclusive to the Solo-Online mode
    [3]  = "OfflineorMainMenu",           -- Game is in Offline mode, also true while in the main menu
    [4]  = "inArenaQuestWaitingAsHost",   -- Waiting for Arena Quest, playing as Host.
    [5]  = "inQuestPreparing",            -- Player has accepted a Quest but has chosen to "Prepare"
    [6]  = "inQuestReady",                -- Player has accepted a Quest and has chosen "Ready"
    [7]  = "inQuestPlayingHost",          -- In Quest playing as Host. Useful for Custom Difficulty Mods.
    [8]  = "inQuestPlayingGuest",         -- In Quest playing as Guest
    [10] = "inArenaQuestPlayingAsHost",   -- (DeclarationQuestPlayingHost) - The Quest has started and the Player is the Host
    [16] = "inQuestPressSelectToEnd",     -- (QuestHagitori) - End Quest UI prompt active 
    [17] = "inQuestEndAnnounce",          -- "Quest Complete"/"Quest Abandonned"/"Quest Failed" small cutscene
    [18] = "inQuestResultScreen",         -- Viewing Quest results screen
    [29] = "inQuestLoadingResult",        -- (Lv2 missions)  - Loading that happens before results
    [36] = "inTrainingArea",              -- Player is in training area
    [37] = "inJunctionArea",              -- Special transition or linking zone (example: Suja <-> Wyveria passage)
    [38] = "inSuja",                      -- (ST503) - Player is in Suja 
    [39] = "inGrandHall",                 -- (ST404) - Player is in the GrandHall 
    [40] = "inTrainingArea",              -- (Lobby) - Second check for the Training area
    [41] = "inBowlingGame",               -- True once the player confirms with the NPC that they wish to start a Bowling mini-game
    [42] = "inArmWrestling",              -- True as soon as the player sits at a Arm wrestling table
    [43] = "atTable",                     -- Sitting at gathering hub table
    [44] = "AlwaysOn"                     -- Don't know what it does, seemly always on while in session
}
