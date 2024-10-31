return {
    minimumPolice = 0,
    notEnoughCopsNotify = true,
    requiredItems = {'advancedlockpick'},
    -- Each key is it's own 'pool'. You can create as many as you want and add them to Config.Interiors per loot spot you add.
    -- togive determines how many random unique items to give. toget determines the amount of said unique item you should get
    rewards = {
        {items = {'pretzels', 'cigarette', 'lollipop_blue', 'peanuts', 'water_bottle_purple'},
            togive = {min = 1, max = 2},
            toget = {min = 1, max = 2}},
        {items = {'lockpick', 'joint', 'weed_crumbs', 'tier1_titanuim_ring', 'tier1_oppo_watch'},
            togive = {min = 1, max = 2},
            toget = {min = 1, max = 2}},
        {items = {'tier1_oppo_phone', 'tier1_oppo_tablet', 'tier1_oppo_laptop'},
            togive = {min = 1, max = 1},
            toget = {min = 1, max = 1}},
        {items = {'corn_cob', 'bottled_oil', 'mint', 'raw_coffee_beans', 'roasted_coffee_beans', 'packed_coffee'},
            togive = {min = 1, max = 2},
            toget = {min = 3, max = 8}},
        {items = {'cocaine', 'money_roll', 'bandage', 'syringe_adrenaline', 'painkillers', 'medical_mask', 'lighter'},
            togive = {min = 3, max = 6},
            toget = {min = 6, max = 15}},
        {items = {'lettuce', 'onion', 'potato', 'tomato'},
            togive = {min = 1, max = 3},
            toget = {min = 2, max = 5}},
        {items = {'apple', 'lime', 'orange', 'peach', 'pomegranate', 'pineapple'},
            togive = {min = 3, max = 6},
            toget = {min = 5, max = 18}},
    }
}