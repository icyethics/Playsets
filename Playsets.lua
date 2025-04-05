Playsets = {}
Playsets.mod_dir = ''..SMODS.current_mod.path
Playsets.config = SMODS.current_mod.config

-- G.GAME.banned_keys

local helper, load_error = SMODS.load_file("playset_object.lua")
if load_error then
    sendDebugMessage ("The error is: "..load_error)
    else
    helper()
end

-- Register the Card Blinds
local files = NFS.getDirectoryItems(Playsets.mod_dir .. "Items/playsets")
for _, file in ipairs(files) do
    assert(SMODS.load_file("Items/playsets/" .. file))()
end

local igo = Game.init_game_object
Game.init_game_object = function(self)
    local ret = igo(self)

    ret.playsets = {}
    -- While there is no config or ui set up, you change the used playsets by adding its key to this list
    local _playset_keys = {
        "playset_debugset"
    }

    for _, _playset in ipairs(_playset_keys) do
        ret.playsets[#ret.playsets + 1] = _playset
    end
    load_playsets(ret)

    return ret
end

function load_playsets(ret)
    if ret.playsets then

        local _poolTypes = {}
        local _inclusiveKeys = {}
        local _exclusiveKeys = {}

        -- Set up the playsets
        for _index, _playsetkey in ipairs(ret.playsets) do
            local _playset = Playsets.Sets[_playsetkey]

        -- add cards to playset
            for _, _poolkey in ipairs(_playset.metadata.affected_pools) do
                _poolTypes[_poolkey] = true
            end

            local _settingArray = _inclusiveKeys
            if not _playset.metadata.inclusive then
                _settingArray = _exclusiveKeys
            end

            if _playset.set_content.cards then
                for k, v in ipairs(_playset.set_content.cards) do
                    _settingArray[v] = true
                end
            end
            if _playset.set_content.tags then
                for k, v in ipairs(_playset.set_content.tags) do
                    _settingArray[v] = true
                end
            end
            if _playset.set_content.other then
                for k, v in ipairs(_playset.set_content.other) do
                    _settingArray[v] = true
                end
            end
        end

        for _key, bool in pairs(_inclusiveKeys) do
            if _exclusiveKeys[_key] then
                _inclusiveKeys[_key] = false
            end
        end

        for _poolkey, _bool in pairs(_poolTypes) do 
            local _array = G.P_CENTER_POOLS[_poolkey]
            for _index, _item in ipairs(_array) do

                if not _inclusiveKeys[_item.key] then
                    ret.banned_keys[_item.key] = true
                end
            end
        end
    end
end