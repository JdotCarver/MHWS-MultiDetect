-- ============================================================================
--             MultiDetect Situation Watcher (Production Version)
-- ============================================================================
-- Copy the code into your mod and it will keep `PlayerSituation` up to date.
-- Delete the lines of the situations you do not need to keep track of.
--
-- Usage:
--    if PlayerSituation.isOnline then
--        -- do something
--    end
--
-- ============================================================================


local sdk = sdk
local prev_situation_ids = {}
PlayerSituation = {}

-- Known situation mappings (based on confirmed tests)
local known_situations = {
    -- [ArrayPosition] = "FriendlyName",    -- DataminedName                  - Details as of when this situation arises.

    [1]  = "isOnline",                      -- Online                         - Player is not Offline or Solo-Online
    [2]  = "isSoloOnline",                  -- SoloOnline                     - Exclusive to the Solo-Online mode
    [3]  = "isOfflineorMainMenu",           -- Offline                        - Game is in Offline mode, also true while in the main menu
    [4]  = "isinArenaQuestWaitingasHost",   -- (???)                          - Waiting for Arena Quest, playing as Host.
    [5]  = "isinQuestPreparing",            -- QuestPreparing                 - Player has accepted a Quest but has chosen to "Prepare"
    [6]  = "isinQuestReady",                -- QuestReady                     - Player has accepted a Quest and has chosen "Ready"
    [7]  = "isinQuestPlayingasHost",        -- QuestPlayingHost               - In Quest playing as Host (not Arena)
    [8]  = "isinQuestPlayingasGuest",       -- QuestPlayingGuest              - In Quest playing as Guest (not Arena)
    [10] = "isinArenaQuestPlayingasHost",   -- DeclarationQuestPlayingHost    - The Quest has started and the Player is the Host
    [16] = "isinQuestPressSelectToEnd",     -- QuestHagitori                  - End Quest UI prompt active 
    [17] = "isinQuestEndAnnounce",          -- QuestEndAnnounce               - The "Quest Complete"/"Quest Abandonned"/"Quest Failed" small cutscene
    [18] = "isinQuestResultScreen",         -- QuestResult                    - Viewing Quest results screen
    [29] = "isinQuestLoadingResult",        -- Lv2 missions                   - Loading that happens before results
    [36] = "isinTrainingArea",              -- (???)                          - Player is in training area
    [37] = "isinJunctionArea",              -- JunctionArea                   - Special transition or linking zone (example: Suja <-> Wyveria passage)
    [38] = "isinSuja",                      -- ST503                          - Player is in the town of Suja 
    [39] = "isinGrandHub",                  -- ST404                          - Player is in the GrandHall 
    [40] = "isinTrainingArea",              -- Lobby                          - Second check for the Training area
    [41] = "isinBowlingGame",               -- PlayingBowlingGame             - True once the player confirms with the NPC that they wish to start a Bowling mini-game
    [42] = "isinArmWrestling",              -- PlayingArmWrestling            - True as soon as the player sits at a Arm wrestling table
    [43] = "isatTable",                     -- TableAction                    - Sitting at gathering hub table
    [44] = "isAlwaysOn"                     -- (???)                          - Don't know what it does, seemly always on while in session
}


-- Internal state update
local function update_player_situation(situation_ids)
    -- Reset all to false
    for _, name in pairs(known_situations) do
        PlayerSituation[name] = false
    end

    -- Set currently active ones to true
    for _, id in ipairs(situation_ids) do
        local name = known_situations[id]
        if name then
            PlayerSituation[name] = true
        end
    end
end

-- Compare arrays for changes
local function did_situations_change(new_ids)
    if #new_ids ~= #prev_situation_ids then return true end
    for i = 1, #new_ids do
        if new_ids[i] ~= prev_situation_ids[i] then
            return true
        end
    end
    return false
end

-- Hook into situation state updates
sdk.hook(
    sdk.find_type_definition("System.Collections.Generic.List`1<app.cGUIMaskContentsManager.SITUATION>"):get_method("ToArray"),
    function(args)
        local this = sdk.to_managed_object(args[2])
        if not this then return end

        local count = this:call("get_Count")
        local current_ids = {}
        for i = 0, count - 1 do
            local value = this:call("get_Item", i)
            table.insert(current_ids, value)
        end

        if did_situations_change(current_ids) then
            update_player_situation(current_ids)
            prev_situation_ids = current_ids
        end
    end,
    function(retval) return retval end
)
