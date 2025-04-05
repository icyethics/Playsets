Playsets.Set { 
    key = "debugset",
    metadata = {
        -- Inclusive set to true if you want the elements in the list to be added to the run. Exclusive removes them
        inclusive = true,

        -- Pool types. qualify the pools the game should iterate through. Comment in or out depending on which are relevant for your set
        affected_pools = {
            -- "Booster",
            -- "Default",
            -- "Enhanced",
            -- "Edition",
            "Joker",
            -- "Tarot",
            -- "Planet",
            -- "Tarot_Planet",
            -- "Spectral",
            -- "Consumeables",
            -- "Voucher",
            -- "Back",
            -- "Tag",
            -- "Seal",
            -- "Stake",
            -- "Demo",
        },

        -- the IDs of the required mods. The card set will only load if each of these mods has been loaded
        required_mods = {

        }
    },
    set_content = {
        cards = {
            -- Jokers (Add the full key here, as a string, to add it to the playset)
            -- j_joker,
            "j_joker",
            "j_greedy_joker",
            "j_lusty_joker",
            "j_wrathful_joker",
            "j_gluttenous_joker",
            "j_jolly",
            "j_zany",
            "j_mad",
            "j_crazy",
            "j_droll",
            "j_sly",
            "j_wily",
            "j_clever",
            "j_devious",
            "j_crafty",
            "j_half"
    
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