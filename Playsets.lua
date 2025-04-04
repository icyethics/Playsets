Playsets = {}
Playsets.mod_dir = ''..SMODS.current_mod.path
Playsets.config = SMODS.current_mod.config

-- G.GAME.banned_keys

local igo = Game.init_game_object
Game.init_game_object = function(self)
    local ret = igo(self)

    if G.GAME.playsets then
        -- add cards to playset
        if _ch.restrictions.banned_cards then
            for k, v in ipairs(_ch.restrictions.banned_cards) do
                G.GAME.banned_keys[v.id] = true
                if v.ids then
                    for kk, vv in ipairs(v.ids) do
                        G.GAME.banned_keys[vv] = true
                    end
                end
            end
        end
        if _ch.restrictions.banned_tags then
            for k, v in ipairs(_ch.restrictions.banned_tags) do
                G.GAME.banned_keys[v.id] = true
            end
        end
        if _ch.restrictions.banned_other then
            for k, v in ipairs(_ch.restrictions.banned_other) do
                G.GAME.banned_keys[v.id] = true
            end
        end
    end

    return ret
end