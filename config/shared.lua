return {
    -- Pre set interiors to use in Config.Houses. Shouldn't touch this unless you know what you are doing. You can however change the skillcheck difficulty.
    -- And change the loot pools around to give players different rewards. The player will randomly get the rewards from one of the pools defined underneath.
    interiors = {
        [1] = {
            exit = vec4(151.36, -1008.06, -99.00, 180),
            skillcheck = {'easy', 'easy', 'easy', 'easy'},
            callCopsTimeout = 1000,
            loot = {
                {coords = vec3(154.90, -1005.86, -99.00), pool = {1, 3}},
                {coords = vec3(154.58, -1003.37, -99.00), pool = {1, 2}},
                {coords = vec3(150.81, -1004.56, -99.04), pool = {1, 2}},
                {coords = vec3(151.72, -1001.20, -99.00), pool = {1, 2}},
            },
            pickups = {
                {coords = vec3(151.25, -1003.10, -99.00), model = 'prop_kettle', reward = 'tier1_kettle'},
            },
            cooldown = {
                amount = 3,
                period = 10*60, -- 10 mins
            },
            infoPrice = 100,
            requiredPersonalSkills = {
                { name = 'lockpicking', level = 1 },
                { name = 'houserobbery', level = 1 }
            },
            rewardPersonalSkills = {
                { name = 'lockpicking', exp = 1 }
            },
            lootSkillReward = {
                { name = 'houserobbery', exp = 1 }
            },
        },
        [2] = {
            exit = vec4(266.11, -1007.61, -101.01, 357.68),
            skillcheck = {'easy', 'easy', 'easy', 'easy'},
            callCopsTimeout = 30000,
            loot = {
                {coords = vec3(265.97, -999.46, -99.01), pool = {1, 3, 4}},
                {coords = vec3(265.66, -997.40, -99.01), pool = {1, 2, 3, 4}},
                {coords = vec3(263.69, -995.40, -99.01), pool = {1, 2, 4}},
                {coords = vec3(262.67, -999.88, -99.01), pool = {1, 3, 4}},
                {coords = vec3(257.01, -995.84, -99.01), pool = {1, 2, 3, 4}},
                {coords = vec3(256.73, -998.34, -99.01), pool = {1, 2, 3, 4}},
                {coords = vec3(259.98, -1004.0, -99.01), pool = {1, 2, 4}},
            },
            pickups = {
                {coords = vec3(262.77, -1002.53, -99.01), model = 'prop_tv_flat_03', reward = 'small_tv'},
                {coords = vec3(265.85, -995.46, -99.01),  model = 'prop_toaster_02', reward = 'toaster'}
            },
            cooldown = {
                amount = 3,
                period = 10*60, -- 10 mins
            },
            infoPrice = 1000,
            requiredPersonalSkills = {
                { name = 'lockpicking', level = 1 },
                { name = 'houserobbery', level = 1 }
            },
            rewardPersonalSkills = {
                { name = 'lockpicking', exp = 10 }
            },
            lootSkillReward = {
                { name = 'houserobbery', exp = 1 }
            },
        },
        [3] = {
            exit = vec4(346.55, -1012.83, -99.2, 5.8),
            skillcheck = {'easy', 'easy', 'easy', 'easy'},
            callCopsTimeout = 25000,
            loot = {
                {coords = vec3(346.15, -1001.71, -99.2), pool = {1, 3, 4, 5, 6, 7}},
                {coords = vec3(345.01, -995.49, -99.2),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(341.97, -997.45, -99.2),  pool = {1, 2, 4, 5, 6, 7}},
                {coords = vec3(340.69, -995.03, -99.2),  pool = {1, 3, 4, 5, 6, 7}},
                {coords = vec3(338.35, -995.22, -99.2),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(338.31, -997.88, -99.2),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(339.71, -1000.35, -99.2), pool = {1, 2, 4, 5, 6, 7}},
                {coords = vec3(338.6, -1003.18, -99.2),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(351.13, -999.23, -99.2),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(351.31, -993.76, -99.2),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(349.36, -995.05, -99.2),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(347.5, -994.17, -99.2),   pool = {1, 2, 3, 4, 5, 6, 7}},
            },
            pickups = {
                {coords = vec3(344.14, -1002.33, -99.2), model = 'prop_micro_01',   reward = 'microwave'},
                {coords = vec3(342.31, -1003.3, -99.2),  model = 'prop_toaster_01', reward = 'toaster'}
            },
            cooldown = {
                amount = 2,
                period = 10*60,
            },
            infoPrice = 2000,
            requiredPersonalSkills = {
                { name = 'lockpicking', level = 3 },
                { name = 'houserobbery', level = 2 }
            },
            rewardPersonalSkills = {
                { name = 'lockpicking', exp = 20 }
            },
            lootSkillReward = {
                { name = 'houserobbery', exp = 2 }
            },
        },
        --[[[3] = {
            exit = vec4(-174.27, 497.71, 137.65, 191.5),
            skillcheck = {'easy', 'easy', 'easy', 'easy'},
            callCopsTimeout = 20000,
            loot = {
                {coords = vec3(-170.21, 495.82, 137.65), pool = {1, 3, 4, 5, 6, 7}},
                {coords = vec3(-168.18, 494.13, 137.65), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-171.02, 486.88, 137.44), pool = {1, 2, 4, 5, 6, 7}},
                {coords = vec3(-163.0, 482.49, 137.27),  pool = {1, 3, 4, 5, 6, 7}},
                {coords = vec3(-164.44, 487.09, 137.44), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-170.32, 482.18, 133.85), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-162.86, 482.02, 133.87), pool = {1, 2, 4, 5, 6, 7}},
                {coords = vec3(-167.4, 487.85, 133.84),  pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-165.71, 495.38, 133.85), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-172.71, 500.42, 130.04), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-174.45, 496.08, 130.04), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-170.01, 491.14, 130.04), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-174.03, 493.64, 130.04), pool = {1, 2, 3, 4, 5, 6, 7}},
                {coords = vec3(-175.79, 492.05, 130.04), pool = {1, 2, 3, 4, 5, 6, 7}},
            },
            pickups = {
                {coords = vec3(-165.26, 495.01, 137.65), model = 'prop_micro_02',   reward = 'microwave'},
                {coords = vec3(-165.89, 497.0, 137.65),  model = 'prop_toaster_01', reward = 'toaster'}
            },
            cooldown = {
                amount = 1,
                period = 10*60,
            },
            infoPrice = 3000,
            requiredPersonalSkills = {
                { name = 'lockpicking', level = 5 },
                { name = 'houserobbery', level = 3 }
            },
            rewardPersonalSkills = {
                { name = 'lockpicking', exp = 30 }
            },
            lootSkillReward = {
                { name = 'houserobbery', exp = 3 }
            },
        },--]]
    },
    houses = {
        [1] = {
            label = 'Forum Dr 1, 9091',
            routingbucket = 500,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-157.93, -1679.86, 33.83),
            deathCoords = vec3(-151.28, -1695.86, 32.87),
            setup = {
                loot = {
                    min = 2,
                    max = 3
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [2] = {
            label = 'Forum Dr 3, 9091',
            routingbucket = 501,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-146.86, -1688.44, 33.07),
            deathCoords = vec3(-151.28, -1695.86, 32.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [3] = {
            label = 'Forum Dr 5, 9091',
            routingbucket = 502,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-141.57, -1693.64, 33.07),
            deathCoords = vec3(-151.28, -1695.86, 32.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [4] = {
            label = 'Forum Dr 7, 9091',
            routingbucket = 503,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-141.63, -1692.83, 36.17),
            deathCoords = vec3(-151.28, -1695.86, 32.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [5] = {
            label = 'Forum Dr 9, 9091',
            routingbucket = 504,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-147.97, -1687.55, 36.17),
            deathCoords = vec3(-151.28, -1695.86, 32.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [6] = {
            label = 'Forum Dr 11, 9091',
            routingbucket = 505,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-158.61, -1679.32, 36.97),
            deathCoords = vec3(-151.28, -1695.86, 32.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [7] = {
            label = 'Forum Dr 1L, 9090',
            routingbucket = 506,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-124.03, -1671.34, 32.56),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [8] = {
            label = 'Forum Dr 3L, 9090',
            routingbucket = 507,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-138.80, -1658.97, 33.34),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [9] = {
            label = 'Forum Dr 5L, 9090',
            routingbucket = 508,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-124.00, -1671.27, 35.71),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [10] = {
            label = 'Forum Dr 7L, 9090',
            routingbucket = 509,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-138.68, -1658.99, 36.51),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [11] = {
            label = 'Forum Dr 1R, 9090',
            routingbucket = 510,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-114.30, -1659.74, 32.56),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [12] = {
            label = 'Forum Dr 3R, 9090',
            routingbucket = 511,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-129.01, -1647.30, 33.30),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [13] = {
            label = 'Forum Dr 5R, 9090',
            routingbucket = 512,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-114.38, -1659.73, 35.71),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [14] = {
            label = 'Forum Dr 7R, 9090',
            routingbucket = 513,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-129.06, -1647.38, 36.51),
            deathCoords = vec3(-119.85, -1664.86, 32.85),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [15] = {
            label = 'Forum Dr 1, 9089',
            routingbucket = 514,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-83.61, -1623.04, 31.48),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [16] = {
            label = 'Forum Dr 3, 9089',
            routingbucket = 515,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-97.12, -1639.16, 32.10),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [17] = {
            label = 'Forum Dr 5, 9089',
            routingbucket = 516,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-109.71, -1628.53, 32.91),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [18] = {
            label = 'Forum Dr 7, 9089',
            routingbucket = 517,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-93.63, -1607.27, 32.31),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [19] = {
            label = 'Forum Dr 9, 9089',
            routingbucket = 518,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-80.19, -1607.88, 31.48),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [20] = {
            label = 'Forum Dr 11, 9089',
            routingbucket = 519,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-89.50, -1630.08, 34.69),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [21] = {
            label = 'Forum Dr 13, 9089',
            routingbucket = 520,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-98.05, -1638.88, 35.48),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [22] = {
            label = 'Forum Dr 15, 9089',
            routingbucket = 521,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-109.57, -1628.48, 36.29),
            deathCoords = vec3(-83.59, -1612.67, 31.48),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [23] = {
            label = 'Forum Dr 1, 9087',
            routingbucket = 522,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-120.05, -1574.48, 34.18),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [24] = {
            label = 'Forum Dr 7, 9087',
            routingbucket = 523,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-147.84, -1596.47, 34.83),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [25] = {
            label = 'Forum Dr 9, 9087',
            routingbucket = 524,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-134.30, -1580.37, 34.21),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [26] = {
            label = 'Forum Dr 11, 9087',
            routingbucket = 525,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-114.00, -1579.47, 37.41),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [27] = {
            label = 'Forum Dr 13, 9087',
            routingbucket = 526,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-123.12, -1591.25, 37.41),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [28] = {
            label = 'Forum Dr 15, 9087',
            routingbucket = 527,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-140.30, -1599.57, 38.21),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [29] = {
            label = 'Forum Dr 17, 9087',
            routingbucket = 528,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-147.78, -1596.37, 38.21),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [30] = {
            label = 'Forum Dr 19, 9087',
            routingbucket = 529,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-134.35, -1580.33, 37.41),
            deathCoords = vec3(-134.70, -1592.31, 34.24),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [31] = {
            label = 'Forum Dr 1, 9084',
            routingbucket = 530,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-208.62, -1600.51, 34.87),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [32] = {
            label = 'Forum Dr 3, 9084',
            routingbucket = 531,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-212.12, -1617.61, 34.87),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [33] = {
            label = 'Forum Dr 5, 9084',
            routingbucket = 532,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-223.17, -1617.60, 34.87),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [34] = {
            label = 'Forum Dr 7, 9084',
            routingbucket = 533,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-223.16, -1585.78, 34.87),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [35] = {
            label = 'Forum Dr 9, 9084',
            routingbucket = 534,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-215.71, -1576.36, 34.87),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [36] = {
            label = 'Forum Dr 13, 9084',
            routingbucket = 535,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-215.71, -1576.34, 38.05),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [37] = {
            label = 'Forum Dr 15, 9084',
            routingbucket = 536,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-223.12, -1585.92, 38.05),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [38] = {
            label = 'Forum Dr 17, 9084',
            routingbucket = 537,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-223.16, -1617.51, 38.06),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [39] = {
            label = 'Forum Dr 19, 9084',
            routingbucket = 538,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-212.08, -1617.67, 38.05),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [40] = {
            label = 'Forum Dr 21, 9084',
            routingbucket = 539,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-208.62, -1600.55, 38.05),
            deathCoords = vec3(-215.00, -1585.15, 34.87),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [41] = {
            label = 'Forum Dr 1, 9134',
            routingbucket = 540,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-77.66, -1515.21, 34.25),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [42] = {
            label = 'Forum Dr 3, 9134',
            routingbucket = 541,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-65.01, -1512.84, 33.44),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [43] = {
            label = 'Forum Dr 5, 9134',
            routingbucket = 542,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-53.18, -1523.77, 33.44),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [44] = {
            label = 'Forum Dr 7, 9134',
            routingbucket = 543,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-62.37, -1532.65, 34.24),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [45] = {
            label = 'Forum Dr 9, 9134',
            routingbucket = 544,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-77.71, -1515.07, 37.42),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [46] = {
            label = 'Forum Dr 11, 9134',
            routingbucket = 545,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-65.13, -1512.85, 36.62),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [47] = {
            label = 'Forum Dr 13, 9134',
            routingbucket = 546,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-53.23, -1523.68, 36.62),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [48] = {
            label = 'Forum Dr 15, 9134',
            routingbucket = 547,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-62.43, -1532.61, 37.42),
            deathCoords = vec3(-67.27, -1522.53, 34.25),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [49] = {
            label = 'Bay City Ave 1, 7218',
            routingbucket = 548,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1493.71, -668.28, 29.03),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [50] = {
            label = 'Bay City Ave 3, 7218',
            routingbucket = 549,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1495.41, -661.66, 29.03),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [51] = {
            label = 'Bay City Ave 5, 7218',
            routingbucket = 550,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1486.81, -655.40, 29.58),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [52] = {
            label = 'Bay City Ave 7, 7218',
            routingbucket = 551,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1478.27, -649.18, 29.58),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [53] = {
            label = 'Bay City Ave 9, 7218',
            routingbucket = 552,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1469.65, -643.02, 29.58),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [54] = {
            label = 'Bay City Ave 11, 7218',
            routingbucket = 553,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1461.38, -640.80, 29.58),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [55] = {
            label = 'Bay City Ave 13, 7218',
            routingbucket = 554,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1454.34, -655.91, 29.58),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [56] = {
            label = 'Bay City Ave 15, 7218',
            routingbucket = 555,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1462.94, -662.15, 29.58),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [57] = {
            label = 'Bay City Ave 17, 7218',
            routingbucket = 556,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1471.49, -668.41, 29.58),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [58] = {
            label = 'Bay City Ave 19, 7218',
            routingbucket = 557,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1457.93, -645.47, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [59] = {
            label = 'Bay City Ave 21, 7218',
            routingbucket = 558,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1452.42, -653.27, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [60] = {
            label = 'Bay City Ave 25, 7218',
            routingbucket = 559,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1458.91, -659.24, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [61] = {
            label = 'Bay City Ave 27, 7218',
            routingbucket = 560,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1476.03, -671.67, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [62] = {
            label = 'Bay City Ave 29, 7218',
            routingbucket = 561,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1469.66, -642.96, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [63] = {
            label = 'Bay City Ave 31, 7218',
            routingbucket = 562,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1478.22, -649.13, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [64] = {
            label = 'Bay City Ave 33, 7218',
            routingbucket = 563,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1486.76, -655.39, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [65] = {
            label = 'Bay City Ave 35, 7218',
            routingbucket = 564,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1495.38, -661.75, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [66] = {
            label = 'Bay City Ave 37, 7218',
            routingbucket = 565,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1493.73, -668.29, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [67] = {
            label = 'Bay City Ave 69, 7218',
            routingbucket = 566,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-1490.01, -671.37, 33.38),
            deathCoords = vec3(-1468.34, -656.66, 29.50),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [68] = {
            label = 'Hawick Ave 1, 7109',
            routingbucket = 567,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(312.84, -218.85, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [69] = {
            label = 'Hawick Ave 3, 7109',
            routingbucket = 568,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(307.20, -216.60, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [70] = {
            label = 'Hawick Ave 5, 7109',
            routingbucket = 569,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(309.46, -208.09, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [71] = {
            label = 'Hawick Ave 7, 7109',
            routingbucket = 570,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(315.71, -194.81, 54.23),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [72] = {
            label = 'Hawick Ave 11, 7109',
            routingbucket = 571,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(312.85, -218.86, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [73] = {
            label = 'Hawick Ave 13, 7109',
            routingbucket = 572,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(307.24, -216.73, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [74] = {
            label = 'Hawick Ave 15, 7109',
            routingbucket = 573,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(309.56, -208.00, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [75] = {
            label = 'Hawick Ave 17, 7109',
            routingbucket = 574,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(313.31, -198.16, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [76] = {
            label = 'Hawick Ave 19, 7109',
            routingbucket = 575,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(319.23, -196.18, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [77] = {
            label = 'Hawick Ave 21, 7109',
            routingbucket = 576,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(329.33, -225.14, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [78] = {
            label = 'Hawick Ave 23, 7109',
            routingbucket = 577,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(335.10, -227.41, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [79] = {
            label = 'Hawick Ave 25, 7109',
            routingbucket = 578,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(339.19, -219.39, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [80] = {
            label = 'Hawick Ave 27, 7109',
            routingbucket = 579,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(342.97, -209.59, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [81] = {
            label = 'Hawick Ave 29, 7109',
            routingbucket = 580,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(346.77, -199.70, 54.22),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [82] = {
            label = 'Hawick Ave 31, 7109',
            routingbucket = 581,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(331.37, -225.95, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [83] = {
            label = 'Hawick Ave 33, 7109',
            routingbucket = 582,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(337.21, -224.73, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [84] = {
            label = 'Hawick Ave 35, 7109',
            routingbucket = 583,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(341.00, -214.86, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [85] = {
            label = 'Hawick Ave 37, 7109',
            routingbucket = 584,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(344.70, -205.02, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [86] = {
            label = 'Hawick Ave 39, 7109',
            routingbucket = 585,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(346.81, -199.65, 58.02),
            deathCoords = vec3(327.70, -205.50, 54.09),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [87] = {
            label = 'Little Bighorn Ave 1, 9177',
            routingbucket = 586,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(566.20, -1778.28, 29.35),
            deathCoords = vec3(562.14, -1770.46, 29.36),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [88] = {
            label = 'Little Bighorn Ave 3, 9177',
            routingbucket = 587,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(552.20, -1771.52, 29.31),
            deathCoords = vec3(562.14, -1770.46, 29.36),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [89] = {
            label = 'Little Bighorn Ave 5, 9177',
            routingbucket = 588,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(557.79, -1759.69, 29.31),
            deathCoords = vec3(562.14, -1770.46, 29.36),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [90] = {
            label = 'Little Bighorn Ave 7, 9177',
            routingbucket = 589,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(560.16, -1777.11, 33.44),
            deathCoords = vec3(562.14, -1770.46, 29.36),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [91] = {
            label = 'Little Bighorn Ave 11, 9177',
            routingbucket = 590,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(552.57, -1765.26, 33.44),
            deathCoords = vec3(562.14, -1770.46, 29.36),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
        [92] = {
            label = 'Little Bighorn Ave 15, 9177',
            routingbucket = 591,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(561.78, -1747.29, 33.44),
            deathCoords = vec3(562.14, -1770.46, 29.36),
            setup = {
                loot = {
                    min = 2,
                    max = 4
                },
                pickups = {
                    min = 1,
                    max = 1
                }
            },
            loot = {},
            pickups = {}
        },
    }
}