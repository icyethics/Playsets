Playsets.Sets = {}

Playsets.Set = SMODS.GameObject:extend {
    obj_table = Playsets.Sets,
    obj_buffer = {},
    class_prefix = 'playset',
    required_params = {
        'key',
    },
    set = "ContentSet",
    inject = function() end,
        -- The additional info about your playset
    metadata = {
        -- Inclusive set to true if you want the elements in the list to be added to the run. Exclusive removes them
        inclusive = true,

        -- the IDs of the required mods. The card set will only load if each of these mods has been loaded
        required_mods = {

        }
    },
    set_content = {
        cards = {
            -- Jokers (Add the full key here, as a string, to add it to the playset)
            -- j_jimbo,
    
            -- Consumables
    
            -- Boosters
    
            -- Enhancements
    
            -- Editions
    
            -- Vouchers
        },
        tags = {
            
    
        },
        other = {
            -- Objects banned in the other category need not only their id but their 
            
            -- Blinds
    
    
        },
    }
}
