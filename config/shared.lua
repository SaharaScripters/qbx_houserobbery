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
            routingbucket = 500,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-35.82, -1555.30, 30.68),
            deathCoords = vec3(-33.57, -1552.68, 30.69),
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
            routingbucket = 501,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-44.67, -1547.12, 31.45),
            deathCoords = vec3(-41.23, -1545.76, 30.69),
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
            routingbucket = 502,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-36.14, -1536.95, 31.45),
            deathCoords = vec3(-36.97, -1540.72, 30.69),
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
            routingbucket = 503,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-26.62, -1544.21, 30.68),
            deathCoords = vec3(-28.08, -1546.89, 30.69),
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
            routingbucket = 504,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-24.74, -1556.90, 30.69),
            deathCoords = vec3(-26.62, -1555.12, 30.69),
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
            routingbucket = 505,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-36.09, -1536.99, 34.62),
            deathCoords = vec3(-32.97, -1542.95, 30.68),
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
            routingbucket = 506,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-44.59, -1547.17, 34.62),
            deathCoords = vec3(-39.09, -1548.36, 30.69),
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
            routingbucket = 507,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-77.71, -1515.28, 34.25),
            deathCoords = vec3(-74.91, -1516.46, 34.25),
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
            routingbucket = 508,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-71.79, -1508.08, 33.44),
            deathCoords = vec3(-70.96, -1511.87, 33.44),
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
            routingbucket = 509,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-53.24, -1523.76, 33.44),
            deathCoords = vec3(-57.78, -1523.09, 33.45),
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
            routingbucket = 610,
            interior = 2,
            opened = false,
            secured = false,
            coords = vec3(1240.51, -601.62, 69.78),
            setup = {
                loot = {
                    min = 4,
                    max = 12
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
            routingbucket = 611,
            interior = 2,
            opened = false,
            secured = false,
            coords = vec3(1098.57, -464.54, 67.32),
            setup = {
                loot = {
                    min = 4,
                    max = 12
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
            routingbucket = 612,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(69.43, -56.69, 73.02),
            setup = {
                loot = {
                    min = 3,
                    max = 7
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
            routingbucket = 613,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-102.84, -11.91, 70.52),
            setup = {
                loot = {
                    min = 3,
                    max = 7
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
            routingbucket = 614,
            interior = 2,
            opened = false,
            secured = false,
            coords = vec3(-332.97, 57.08, 54.43),
            setup = {
                loot = {
                    min = 3,
                    max = 12
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
            routingbucket = 615,
            interior = 2,
            opened = false,
            secured = false,
            coords = vec3(-1009.5, 479.12, 79.59),
            setup = {
                loot = {
                    min = 6,
                    max = 12
                },
                pickups = {
                    min = 1,
                    max = 2
                }
            },
            loot = {},
            pickups = {}
        },
        [17] = {
            routingbucket = 616,
            interior = 2,
            opened = false,
            secured = false,
            coords = vec3(-371.74, 343.46, 109.94),
            setup = {
                loot = {
                    min = 6,
                    max = 12
                },
                pickups = {
                    min = 1,
                    max = 2
                }
            },
            loot = {},
            pickups = {}
        },
        [18] = {
            routingbucket = 617,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(1435.45, 3657.04, 34.4),
            setup = {
                loot = {
                    min = 2,
                    max = 6
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
            routingbucket = 618,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(1808.93, 3907.97, 33.74),
            setup = {
                loot = {
                    min = 2,
                    max = 6
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
            routingbucket = 619,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-480.95, 6266.33, 13.63),
            setup = {
                loot = {
                    min = 2,
                    max = 6
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
            routingbucket = 620,
            interior = 1,
            opened = false,
            secured = false,
            coords = vec3(-280.54, 6350.67, 32.6),
            setup = {
                loot = {
                    min = 2,
                    max = 6
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
            routingbucket = 621,
            interior = 3,
            opened = false,
            secured = false,
            coords = vec3(-174.65, 502.47, 137.42),
            setup = {
                loot = {
                    min = 2,
                    max = 6
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