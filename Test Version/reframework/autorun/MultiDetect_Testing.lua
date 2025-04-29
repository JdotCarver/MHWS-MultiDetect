-- ============================================================================
--             MultiDetect Situation Watcher (Testing Version)
-- ============================================================================
-- Requires:
-- MultiDetect_Testing.lua (this file)
-- MD_Known_Situations.lua
-- MD_Possible_Situations.lua
--
-- Default Install:
-- reframework/
-- └── autorun/
-- ├── MultiDetect_Testing.lua
-- └── MultiDetect_TestingFiles/
--     ├── MD_Known_Situations.lua
--     └── MD_Possible_Situations.lua
-- 
-- Usage:
-- Open MH:Wilds and start the REFramework console to see the logs it prints in-game.
-- When a new un-confirmed situation arises, the log will notify you and attempt to suggest possible candidates.
-- When you are pretty sure you can confirm the situation, add it in MD_Known_Situations.lua, and save.
-- In REFramework, click the "Reset Scripts" button to load the changes and continue finding unconfirmed situations until satisfied.
-- ============================================================================

print("------------------ MultiDetect Situation Watcher Active ------------------")
print("")

local known_situations = require("MultiDetect_TestingFiles.MD_Known_Situations")
local situation_field_names = require("MultiDetect_TestingFiles.MD_Possible_Situations")

local prev_situation_ids = {}
local suggestion_counts = {}
local first_run = true

local function suggest_enum_candidates(id, confirmed_ids)
    local suggestions = {}
    local used_names = {}

    local function is_valid_suggestion(index)
        local candidate = situation_field_names[index]
        if not candidate or used_names[candidate] or (suggestion_counts[candidate] or 0) >= 3 then
            return false
        end

        for _, assigned in pairs(confirmed_ids) do
            if assigned:lower():find(candidate:lower(), 1, true) then
                return false
            end
        end

        return true
    end

    local function add_suggestion(index)
        local name = situation_field_names[index]
        if name then
            suggestion_counts[name] = (suggestion_counts[name] or 0) + 1
            used_names[name] = true
            table.insert(suggestions, name)
        end
    end

    for offset = -1, 1 do
        local index = id + offset
        if is_valid_suggestion(index) then
            add_suggestion(index)
        end
    end

    while #suggestions < 3 do
        local rand_index = math.random(1, #situation_field_names)
        if is_valid_suggestion(rand_index) then
            add_suggestion(rand_index)
        end
    end

    return suggestions
end

sdk.hook(
    sdk.find_type_definition("System.Collections.Generic.List`1<app.cGUIMaskContentsManager.SITUATION>"):get_method("ToArray"),
    function(args)
        local this = sdk.to_managed_object(args[2])
        if not this then return end

        local count = this:call("get_Count")
        local new_ids = {}
        for i = 0, count - 1 do
            local value = this:call("get_Item", i)
            table.insert(new_ids, value)
        end

        local changed = false
        if #new_ids ~= #prev_situation_ids then
            changed = true
        else
            for i = 1, #new_ids do
                if new_ids[i] ~= prev_situation_ids[i] then
                    changed = true
                    break
                end
            end
        end

        if changed then
            -- Track additions, removals, and persistents
            local prev_set = {}
            for _, id in ipairs(prev_situation_ids) do prev_set[id] = true end

            local new_set = {}
            for _, id in ipairs(new_ids) do new_set[id] = true end

            local added = {}
            local removed = {}
            local still_active = {}

            for _, id in ipairs(prev_situation_ids) do
                if id ~= 44 then --We ignore 44 as always on
                    if not new_set[id] then
                        table.insert(removed, id)
                    elseif new_set[id] then
                        table.insert(still_active, id)
                    end
                end
            end
            
            for _, id in ipairs(new_ids) do
                if id ~= 44 and not prev_set[id] then --We ignore 44 as always on
                    table.insert(added, id)
                end
            end

            -- Unknown situation handler
            for _, id in ipairs(new_ids) do
                if not known_situations[id] then
                    print("-> New Unknown Situation : Number [" .. id .. "]")
                    local candidates = suggest_enum_candidates(id, known_situations)
                    print("Could be one of these? :O")
                    for _, name in ipairs(candidates) do
                        print("- " .. name)
                    end
                    print("")
                end
            end

            -- Output the grouped log
            if first_run then
                print("-= Initial Player Situation has been successfully recorded. The next situation change will display details. :) =-")
            else
                print("-= Situation change detected =-")
            end
            print("")

            if #still_active > 0 then
                print(" Player still:")
                for _, id in ipairs(still_active) do
                    local name = known_situations[id] or ("<Unknown %d>"):format(id)
                    print(" = " .. name .. " [" .. id .. "]")
                end
                print("")
            end
            
            if #removed > 0 then
                print(" Player no longer:")
                for _, id in ipairs(removed) do
                    local name = known_situations[id] or ("<Unknown %d>"):format(id)
                    print(" - " .. name .. " [" .. id .. "]")
                end
                print("")
            end

            if #added > 0 then
                if first_run then 
                    if #added == 1 then --Haha, yes, I know, "ConsoleUI".
                        print(" Player started in this Situation:") 
                    else
                        print(" Player started in these Situations:") 
                    end
                else 
                    print(" Player now:")
                end
                for _, id in ipairs(added) do
                    local name = known_situations[id] or ("<Unknown %d>"):format(id)
                    print(" + " .. name .. " [" .. id .. "]")
                end
                print("")
            end

            if first_run then 
                print("")
                first_run = false 
                else
                    print("") print("")
            end
        end

        prev_situation_ids = new_ids
    end,
    function(retval) return retval end
)
