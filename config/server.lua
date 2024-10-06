return {
    minimumPolice = 0,
    notEnoughCopsNotify = true,
    requiredItems = {'advancedlockpick', 'screwdriverset'},
    -- Each key is it's own 'pool'. You can create as many as you want and add them to Config.Interiors per loot spot you add.
    -- togive determines how many random unique items to give. toget determines the amount of said unique item you should get
    rewards = {
        {items = {'metal', 'plastic', 'copper', 'iron', 'aluminum', 'steel', 'glass'},
            togive = {min = 2, max = 5},
            toget = {min = 2, max = 5}},
        {items = {'weed', 'weed_wrap', 'weed_crumbs', 'weed_grinder'},
            togive = {min = 1, max = 2},
            toget = {min = 1, max = 2}},
        {items = {'meth', 'empty_meth_pipe'},
            togive = {min = 1, max = 2},
            toget = {min = 2, max = 5}},
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