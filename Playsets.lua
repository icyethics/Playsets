Playsets = {}
Playsets.mod_dir = ''..SMODS.current_mod.path
Playsets.config = SMODS.current_mod.config

-- G.GAME.banned_keys

local igo = Game.init_game_object
Game.init_game_object = function(self)
    local ret = igo(self)

    if G.GAME.playsets then
        -- add cards to playset
    end

    return ret
end