-- ✅ Confirmed, human-readable situation mappings, with comments as to WHEN they exactly trigger. Add/Update entries as you confirm them!
-- Once all (44 as of writing) situations are confirmed, this list will only neeed to be changed when/if new updates arrive that modify them.
return {
    [1]  = "Online",                -- Player is not Offline or Solo-Online
    [2]  = "SoloOnline",            -- Exclusive to the Solo-Online mode
    [3]  = "Offline",               -- Game is in Offline mode, also true in the main menu
    [5]  = "QuestPreparing",        -- Player has accepted a Quest but has chosen to "Prepare"
    [6]  = "QuestReady",            -- Player has accepted a Quest and has chosen "Ready"
    [7]  = "QuestPlayingHost",      -- In Quest playing as Host. Useful for Custom Difficulty Mods.
    [8]  = "QuestPlayingGuest",     -- In Quest playing as Guest
    [16] = "QuestPressSelectToEnd", -- End Quest UI prompt active (called Hagitori in game files)
    [17] = "QuestEndAnnounce",      -- "Quest Complete"/"Quest Abandonned"/"Quest Failed" small cutscene
    [18] = "QuestResultScreen",     -- Viewing Quest results screen
    [29] = "QuestLoadingResult",    -- Loading that happens before results (called Lv2 missions in game files)
    [36] = "TrainingArea",          -- Player is in training area
    [37] = "JunctionArea",          -- Special transition or linking zone (example: Suja <-> Wyveria passage)
    [38] = "Suja",                  -- (Called ST503 in game files)
    [39] = "GrandHall",             -- (Called ST404 in game files)
    [40] = "TrainingArea",          -- (Called Lobby in game files)
    [41] = "PlayingBowlingGame",    -- True once the player confirms with the NPC that they wish to start a Bowling mini-game
    [42] = "PlayingArmWrestling",   -- True as soon as the player sits at a Arm wrestling table
    [43] = "TableAction",           -- Sitting at gathering hub table
    [44] = "SeemsAlwaysOn"          -- Don't know what it does, possibly always triggered while in session
}
