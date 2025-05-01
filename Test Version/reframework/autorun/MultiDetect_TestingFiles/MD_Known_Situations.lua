-- ✅ Confirmed, human-readable situation mappings, with comments as to WHEN they exactly trigger. Add/Update entries as you confirm them! And don't forget to share your findings on the repo (https://github.com/JdotCarver/MHWS-MultiDetect/blob/main/Test%20Version/reframework/autorun/MultiDetect_TestingFiles/MD_Known_Situations.lua)
-- Once all (44 as of writing) situations are confirmed, this list will only neeed to be changed when/if new updates arrive that modify them.

-- [ArrayPosition] = "FriendlyName",      -- DataminedName                  - Details as of when this situation arises.
return {
    [1]  = "isOnline",                          -- Online                         - Player is not Offline or Solo-Online
    [2]  = "isSoloOnline",                      -- SoloOnline                     - Exclusive to the Solo-Online mode
    [3]  = "isOfflineorMainMenu",               -- Offline                        - Game is in Offline mode, also true while in the main menu
    [4]  = "isinQuestPreparing",                -- QuestPreparing                 - Player has accepted a Quest but has chosen to "Prepare"
    [5]  = "isinQuestReady",                    -- QuestReady                     - Player has accepted a Quest and has chosen "Ready"
    [6]  = "isinQuestPlayingasHost",            -- QuestPlayingHost               - In Quest playing as Host (not Arena)
    [7]  = "isinQuestPlayingasGuest",            -- QuestPlayingHost               - In Quest playing as Host (not Arena)
    [8]  = "isinQuestPlayingfromFieldSurvey",   -- (???)                          - In Quest when the quest was started as a Field Survey
    [9]  = "isinQuestPlayingasGuest",           -- QuestPlayingGuest              - In Quest playing as Guest (not Arena)
    [10] = "isinArenaQuestPlayingasHost",       -- DeclarationQuestPlayingHost    - The Quest has started and the Player is the Host
    [16] = "isinQuestPressSelectToEnd",         -- QuestHagitori                  - End Quest UI prompt active 
    [17] = "isinQuestEndAnnounce",              -- QuestEndAnnounce               - The "Quest Complete"/"Quest Abandonned"/"Quest Failed" small cutscene
    [18] = "isinQuestResultScreen",             -- QuestResult                    - Viewing Quest results screen
    [29] = "isinQuestLoadingResult",            -- Lv2 missions                   - Loading that happens before results
    [36] = "isinTrainingArea",                  -- (???)                          - Player is in training area
    [37] = "isinJunctionArea",                  -- JunctionArea                   - Special transition or linking zone (example: Suja <-> Wyveria passage)
    [38] = "isinSuja",                          -- ST503                          - Player is in the town of Suja 
    [39] = "isinGrandHub",                      -- ST404                          - Player is in the GrandHall 
    [40] = "isinTrainingArea",                  -- Arena                          - Second check for the Training area
    [41] = "isinBowlingGame",                   -- PlayingBowlingGame             - True once the player confirms with the NPC that they wish to start a Bowling mini-game
    [42] = "isinArmWrestling",                  -- PlayingArmWrestling            - True as soon as the player sits at a Arm wrestling table
    [43] = "isatTable",                         -- TableAction                    - Sitting at gathering hub table
    [44] = "isAlwaysOn"                         -- (???)                          - Don't know what it does, seemly always on while in session
}
