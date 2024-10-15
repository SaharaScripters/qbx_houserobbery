local config = require 'config.server'
local sharedConfig = require 'config.shared'

local startedLoot = {}
local startedPickup = {}
-- Track robberies per interior
local robberies = {
    [1] = {},
    [2] = {},
    [3] = {}
}

--- @param interiorType number Interior index number to check for cooldown
--- @return boolean
local function houseOnCooldown(interiorType)
    local cooldownConfig = sharedConfig.interiors[interiorType]?.cooldown
    if not cooldownConfig then
        return false
    end
    local now = os.time()
    local recentRobberies = 0
    -- Count recent robberies within the cooldown period
    for i, time in ipairs(robberies[interiorType]) do
        if now - time < cooldownConfig.period then
            recentRobberies = recentRobberies + 1
        else
            -- Remove old entries
            table.remove(robberies[interiorType], i)
        end
    end
    -- Check if max robberies reached
    return  recentRobberies >= cooldownConfig.amount
end

--- @param interiorType number Interior index number to check for cooldown
--- @param src number Player server Id
--- @return boolean
local function hasRequiredSkills(interiorType, src)
    local requiredSkills = sharedConfig.interiors[interiorType]?.requiredPersonalSkills or {}
    for _, skillReq in ipairs(requiredSkills) do
        local playerSkillLevel = exports.ss_skills:getSkillLevel(src, skillReq.name)
        if playerSkillLevel < skillReq.level then
            return false
        end
    end
    return true
end


--- @param interiorType number Interior index number to check for cooldown
--- @param src number
local function getRewardExp(interiorType, src)
    local rewardSkills = sharedConfig.interiors[interiorType]?.rewardPersonalSkills or {}
    for _, skillReward in ipairs(rewardSkills) do
        local exp = type(skillReward.exp) == 'number' and skillReward.exp or math.random(skillReward.exp.min, skillReward.exp.max)
        exports.ss_skills:addXp(src, skillReward.name, exp)
    end
end

--- @param interiorType number Interior index number to check for cooldown
--- @param src number
local function getLootExp(interiorType, src)
    local rewardSkills = sharedConfig.interiors[interiorType]?.lootSkillReward or {}
    for _, skillReward in ipairs(rewardSkills) do
        local exp = type(skillReward.exp) == 'number' and skillReward.exp or math.random(skillReward.exp.min, skillReward.exp.max)
        exports.ss_skills:addXp(src, skillReward.name, exp)
    end
end

-- Function to check if robbery is allowed
---@param interiorType number Interior index number to check for cooldown
---@param src number Player server Id
---@return boolean
local function canRobHouse(interiorType, src)
    local success = hasRequiredSkills(interiorType, src)
    if not success then
        exports.qbx_core:Notify(src, locale('notify.no_skills'), 'error')
        return false
    end
    success = not houseOnCooldown(interiorType)
    if not success then
        exports.qbx_core:Notify(src, locale('notify.cooldown'), 'error')
        return false
    end
    return true
end

-- Returns closes house index number from sharedConfig table
---@param coords vector3 Point to check for closest house point
---@return integer
local function getClosestHouse(coords)
    local closestHouseIndex
    for i = 1, #sharedConfig.houses do
        if #(coords - sharedConfig.houses[i].coords) <= 3 then
            if closestHouseIndex then
                if #(coords - sharedConfig.houses[i].coords) < #(coords - sharedConfig.houses[closestHouseIndex].coords) then
                    closestHouseIndex = i
                end
            else
                closestHouseIndex = i
            end
        end
    end
    return closestHouseIndex
end

-- Teleports player to house exit inside IPL interior
-- Sets routing bucket for player
-- Triggers loot point creation for client
---@param source number Player server Id
---@param coords vector4 Destination coordinates to teleport player
---@param bucket number Routing bucket to put player in
---@param closestHouseIndex number House index to store with player citizenid so we know what house they are in
local function enterHouse(source, coords, bucket, closestHouseIndex)
    local player = exports.qbx_core:GetPlayer(source)
    player.Functions.SetMetaData('houserobbery', closestHouseIndex)
    TriggerClientEvent('qbx_houserobbery:client:screenfade', source)
    Wait(200)
    local ped = GetPlayerPed(source)
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
    SetEntityHeading(ped, coords.w)
    exports.qbx_core:SetPlayerBucket(source, bucket)
    TriggerClientEvent('qbx_houserobbery:client:enterHouse', source)
    FreezeEntityPosition(ped, true)
    Wait(200)
    FreezeEntityPosition(ped, false)
    lib.logger(source, 'EnteredHouse', json.encode({ coords = coords, bucket = bucket, closestHouseIndex = closestHouseIndex }))
end

-- Returns player to house entrace in routing bucket 0
---@param source number
---@param coords vector3
local function leaveHouse(source, coords)
    TriggerClientEvent('qbx_houserobbery:client:screenfade', source)
    Wait(200)
    local ped = GetPlayerPed(source)
    local player = exports.qbx_core:GetPlayer(source)
    player.Functions.SetMetaData('houserobbery', 0)
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
    exports.qbx_core:SetPlayerBucket(source, 0)
    FreezeEntityPosition(ped, true)
    Wait(200)
    FreezeEntityPosition(ped, false)
    lib.logger(source, 'LeftHouse', json.encode({ coords = coords }))
end

-- Shuffle loot tables
---@param index number House interior table to shuffle loot
local function shuffleTables(index)
    for i = #sharedConfig.interiors[index].loot, 2, -1 do
        local j = math.random(i)
        sharedConfig.interiors[index].loot[i], sharedConfig.interiors[index].loot[j] = sharedConfig.interiors[index].loot[j], sharedConfig.interiors[index].loot[i]
    end
    for i = #sharedConfig.interiors[index].pickups, 2, -1 do
        local j = math.random(i)
        sharedConfig.interiors[index].pickups[i], sharedConfig.interiors[index].pickups[j] = sharedConfig.interiors[index].pickups[j], sharedConfig.interiors[index].pickups[i]
    end
    for b = 1, #config.rewards do
        for i = #config.rewards[b].items, 2, -1 do
            local j = math.random(i)
            config.rewards[b].items[i], config.rewards[b].items[j] = config.rewards[b].items[j], config.rewards[b].items[i]
        end
    end
end

---@param src number
local function checkPlayerSpawnLocation(src)
    local player = exports.qbx_core:GetPlayer(src)
    local index = player.Functions.GetMetaData('houserobbery')
    if not index or index == 0 then return end
    local house = sharedConfig.houses[index]
    if not house then return end
    local bucket = house.routingbucket
    exports.qbx_core:SetPlayerBucket(source, bucket)
    -- lib.logger(src, 'InvalidTargetOrSrc', json.encode({ target = target, src = src }))
    lib.logger(src, 'SpawnedIn', json.encode({ index = index, house = house }))
end

-- Alert police to house robbery in progress
---@param src number Player server Id
---@param text string Text to send
---@param interiorId number Interior index number to fetch timeout from config
---@param coords vector3 Coords to send
local function policeAlert(src, text, interiorId, coords)
    SetTimeout(sharedConfig.interiors[interiorId].callCopsTimeout, function()
        local callData = {
            code = '10-31',
            offense = 'House Robbery',
            info =  {
                {
                    label = text,
                    icon = 'home',
                }
            },
            coords = {coords.x, coords.y},
            blip = 67,
            isEmergency = true,
            blipCoords = coords
        }
        exports['bub-mdt']:createCall(callData)
        lib.logger(src, 'PoliceAlerted', json.encode({ text = text, interiorId = interiorId, coords = coords }))
    end)
end

-- Lockpick event handler for entering houses.
-- Triggers skillcheck callback on calling player before teleporting them inside
---@param isAdvanced boolean Is this an advanced lockpick
RegisterNetEvent('qbx_houserobbery:server:enterHouse', function(isAdvanced)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local closestHouseIndex = getClosestHouse(playerCoords)
    local house = sharedConfig.houses[closestHouseIndex]
    local amount = exports.qbx_core:GetDutyCountType('leo')
    if not house then return end
    if house.opened then return end
    if not isAdvanced and not player.Functions.GetItemByName(config.requiredItems[2]) then return end
    if amount < config.minimumPolice then
        if config.notEnoughCopsNotify then
            exports.qbx_core:Notify(src, locale('notify.no_police', config.minimumPolice), 'error')
            return
        end
    end

    local result = lib.callback.await('qbx_houserobbery:client:checkTime', src)

    if not result then return end
    if not canRobHouse(house.interior, src) then return end
    local skillcheck = lib.callback.await('qbx_houserobbery:client:startSkillcheck', src, sharedConfig.interiors[house.interior].skillcheck)

    if skillcheck then
        lib.logger(src, 'OpenedHouse', json.encode({ closestHouseIndex = closestHouseIndex, house = house }))
        table.insert(robberies[house.interior], os.time())
        sharedConfig.houses[closestHouseIndex].opened = true
        exports.qbx_core:Notify(src, locale('notify.success_skillcheck'), 'success')
        TriggerClientEvent('qbx_houserobbery:client:syncconfig', -1, house, closestHouseIndex)
        getRewardExp(house.interior, src)
        enterHouse(src, sharedConfig.interiors[house.interior].exit, house.routingbucket, closestHouseIndex)
        policeAlert(src, locale('notify.police_alert'), house.interior, house.coords)
    else
        exports.qbx_core:Notify(src, locale('notify.fail_skillcheck'), 'error')
    end
end)

RegisterNetEvent('qbx_houserobbery:server:secureHouse', function(index)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local house = sharedConfig.houses[index]
    if not house then return end
    if not house.opened then return end
    if house.secured then return end
    if not player.PlayerData.job.name == 'police' then return end
    sharedConfig.houses[index].secured = true
    exports.qbx_core:Notify(src, locale('notify.secured'), 'success')
    TriggerClientEvent('qbx_houserobbery:client:syncconfig', -1, house, index)
    lib.logger(src, 'SecuredHouse', json.encode({ index = index, house = house }))
end)

-- Teleports player inside house and sets routing bucket.
---@param index number House index number to locate in config
RegisterNetEvent('qbx_houserobbery:server:enterHouse', function(index)
    local playerCoords = GetEntityCoords(GetPlayerPed(source --[[@as number]]))
    local closestHouseIndex = getClosestHouse(playerCoords)

    if closestHouseIndex ~= index then return end
    if not closestHouseIndex then return end
    if not sharedConfig.houses[index].opened then return end

    enterHouse(source --[[@as number]], sharedConfig.interiors[sharedConfig.houses[closestHouseIndex].interior].exit, sharedConfig.houses[closestHouseIndex].routingbucket, closestHouseIndex)
end)

-- NetEvent to handle player exiting house
RegisterNetEvent('qbx_houserobbery:server:leaveHouse', function()
    local playerCoords = GetEntityCoords(GetPlayerPed(source --[[@as number]]))
    local player = exports.qbx_core:GetPlayer(source)
    local index = player.Functions.GetMetaData('houserobbery')
    if not index or index == 0 then return end
    local exit = vec3(sharedConfig.interiors[sharedConfig.houses[index].interior].exit.x, sharedConfig.interiors[sharedConfig.houses[index].interior].exit.y, sharedConfig.interiors[sharedConfig.houses[index].interior].exit.z)

    if #(playerCoords - exit) > 3 then return end

    leaveHouse(source --[[@as number]], sharedConfig.houses[index].coords)
end)

-- Callback to check if loot is busy/already looted
---@param source number Player server Id
---@param houseIndex number House index from sharedConfig
---@param lootIndex number Loot index from sharedConfig (dynamically generated)
---@return boolean?
lib.callback.register('qbx_houserobbery:server:checkLoot', function(source, houseIndex, lootIndex)
    local playerCoords = GetEntityCoords(GetPlayerPed(source))
    local loot = sharedConfig.houses[houseIndex].loot[lootIndex]

    if #(playerCoords - loot.coords) > 3 then return end
    if loot.isBusy then exports.qbx_core:Notify(source, locale('notify.busy')) return end
    if loot.isOpened then return end
    if not sharedConfig.houses[houseIndex].opened then return end

    startedLoot[source] = true
    sharedConfig.houses[houseIndex].loot[lootIndex].isBusy = true
    return true
end)

-- NetEvent to update status of loot drops inside house and give reward
---@param houseIndex number House index from sharedConfig
---@param lootIndex number Loot index from sharedConfig (dynamically generated)
RegisterNetEvent('qbx_houserobbery:server:lootFinished', function(houseIndex, lootIndex)
    local src = source
    local playerCoords = GetEntityCoords(GetPlayerPed(src --[[@as number]]))
    local player = exports.qbx_core:GetPlayer(src)
    local loot = sharedConfig.houses[houseIndex].loot[lootIndex]
    local reward = config.rewards[loot.pool[math.random(#loot.pool)]]

    if #(playerCoords - loot.coords) > 3 then return end
    if not startedLoot[src] then return end
    if not loot.isBusy then return end
    if loot.isOpened then return end

    for i = 1, math.random(reward.togive.min, reward.togive.max) do
        player.Functions.AddItem(reward.items[i], math.random(reward.toget.min, reward.toget.max))
    end
    local interiorIndex = sharedConfig.houses[houseIndex].interior
    getLootExp(interiorIndex, src)
    startedLoot[src] = false
    sharedConfig.houses[houseIndex].loot[lootIndex].isBusy = false
    sharedConfig.houses[houseIndex].loot[lootIndex].isOpened = true
    TriggerClientEvent('qbx_houserobbery:client:syncconfig', -1, sharedConfig.houses[houseIndex], houseIndex)
    lib.logger(src, 'Looted', json.encode({ houseIndex = houseIndex, lootIndex = lootIndex, reward = reward }))
end)

-- NetEvent to handle cancelling loot attempt
---@param houseIndex number House index from sharedConfig
---@param lootIndex number Loot index from sharedConfig (dynamically generated)
RegisterNetEvent('qbx_houserobbery:server:lootCancelled', function(houseIndex, lootIndex)
    local playerCoords = GetEntityCoords(GetPlayerPed(source --[[@as number]]))

    if #(playerCoords - sharedConfig.houses[houseIndex].loot[lootIndex].coords) > 3 then return end
    if not startedLoot[source] then return end

    startedLoot[source] = false
    sharedConfig.houses[houseIndex].loot[lootIndex].isBusy = false
end)

-- Callback to check if pickup point is busy or looted
---@param source number Player server Id
---@param houseIndex number House index from sharedConfig
---@param pickupIndex number Pickup index from sharedConfig (dynamically generated)
---@return boolean?
lib.callback.register('qbx_houserobbery:server:checkPickup', function(source, houseIndex, pickupIndex)
    local playerCoords = GetEntityCoords(GetPlayerPed(source))
    local house = sharedConfig.houses[houseIndex]
    if not house or not house.pickups then return end

    local pickup = house.pickups[pickupIndex]
    if not pickup or #(playerCoords - pickup.coords) > 3 then return end
    if pickup.isBusy then
        exports.qbx_core:Notify(source, locale('notify.busy'))
        return
    end
    if pickup.isOpened then return end
    startedPickup[source] = true
    sharedConfig.houses[houseIndex].pickups[pickupIndex].isBusy = true
    return true
end)

lib.callback.register('qbx_houserobbery:server:getAvailableInteriors', function(source)
    local src = source
    local interiors = {}
    for i = 1, #sharedConfig.houses do
        if not sharedConfig.houses[i].opened then
            local interiorIndex = sharedConfig.houses[i].interior
            interiors[interiorIndex] = (interiors[interiorIndex] or 0) + 1
        end
    end
    for interiorIndex, count in pairs(interiors) do
        interiors[interiorIndex] = hasRequiredSkills(interiorIndex, src) and not houseOnCooldown(interiorIndex) and count or 0
    end
    return interiors
end)

-- NetEvent to update pickup point status and give reward
---@param houseIndex number House index from sharedConfig
---@param pickupIndex number Pickup index from sharedConfig (dynamically generated)
RegisterNetEvent('qbx_houserobbery:server:pickupFinished', function(houseIndex, pickupIndex)
    local playerCoords = GetEntityCoords(GetPlayerPed(source --[[@as number]]))
    local player = exports.qbx_core:GetPlayer(source)
    local pickup = sharedConfig.houses[houseIndex].pickups[pickupIndex]

    if #(playerCoords - pickup.coords) > 3 then return end
    if not startedPickup[source] then return end
    if not pickup.isBusy then return end
    if pickup.isOpened then return end

    player.Functions.AddItem(pickup.reward, 1)
    startedPickup[source] = false
    sharedConfig.houses[houseIndex].pickups[pickupIndex].isBusy = false
    sharedConfig.houses[houseIndex].pickups[pickupIndex].isOpened = true
    TriggerClientEvent('qbx_houserobbery:client:syncconfig', -1, sharedConfig.houses[houseIndex], houseIndex)
    lib.logger(source, 'PickedUp', json.encode({ houseIndex = houseIndex, pickupIndex = pickupIndex, reward = pickup.reward }))
end)

-- NetEvent to handle cancelling pickup attempt
---@param houseIndex number House index from sharedConfig
---@param pickupIndex number Pickup index from sharedConfig (dynamically generated)
RegisterNetEvent('qbx_houserobbery:server:pickupCancelled', function(houseIndex, pickupIndex)
    local playerCoords = GetEntityCoords(GetPlayerPed(source --[[@as number]]))

    if #(playerCoords - sharedConfig.houses[houseIndex].pickups[pickupIndex].coords) > 3 then return end
    if not startedPickup[source] then return end

    startedPickup[source] = false
    sharedConfig.houses[houseIndex].pickups[pickupIndex].isBusy = false
end)

RegisterNetEvent('qbx_houserobbery:server:getHouseCoords', function(interiorIndex)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local interiorInfo = sharedConfig.interiors[interiorIndex]
    if not interiorInfo then return end
    if not canRobHouse(interiorIndex, src) then return end
    local price = interiorInfo.infoPrice
    local availabelHouses = {}
    for i = 1, #sharedConfig.houses do
        if sharedConfig.houses[i].interior == interiorIndex and not sharedConfig.houses[i].opened then
            table.insert(availabelHouses, sharedConfig.houses[i])
        end
    end
    if #availabelHouses == 0 then
        exports.qbx_core:Notify(src, locale('notify.no_houses'), 'error')
        return
    end
    if not player.Functions.RemoveMoney('cash', price) then
        exports.qbx_core:Notify(src, locale('notify.no_money'), 'error')
        return
    end
    local houseIndex = math.random(#availabelHouses)
    local houseCoords = availabelHouses[houseIndex].coords
    TriggerClientEvent('qbx_houserobbery:client:showHouseCoords', src, houseCoords)
    lib.logger(src, 'GetCoords', json.encode({ houseIndex = houseIndex, houseCoords = houseCoords, price = price }))
end)

-- Startup thread to shuffle loot for all houses in configuration and sync configuration to clients
CreateThread(function()
    for i = 1, #sharedConfig.houses do
        shuffleTables(sharedConfig.houses[i].interior)
        local randomAmountOfLoot = math.random(sharedConfig.houses[i].setup.loot.min, sharedConfig.houses[i].setup.loot.max)
        for b = 1, randomAmountOfLoot do
            sharedConfig.houses[i].loot[b] = {
                coords = sharedConfig.interiors[sharedConfig.houses[i].interior].loot[b].coords,
                pool = sharedConfig.interiors[sharedConfig.houses[i].interior].loot[b].pool,
                isBusy = false,
                isOpened = false
            }
        end
        local randomAmountOfPickups = math.random(sharedConfig.houses[i].setup.pickups.min, sharedConfig.houses[i].setup.pickups.max)
        for b = 1, randomAmountOfPickups do
            sharedConfig.houses[i].pickups[b] = {
                coords = sharedConfig.interiors[sharedConfig.houses[i].interior].pickups[b].coords,
                prop = sharedConfig.interiors[sharedConfig.houses[i].interior].pickups[b].model,
                reward = sharedConfig.interiors[sharedConfig.houses[i].interior].pickups[b].reward,
                entity = {},
                isBusy = false,
                isOpened = false
            }
        end
    end
    Wait(50)
    TriggerClientEvent('qbx_houserobbery:client:syncconfig', -1, sharedConfig.houses)
end)

RegisterNetEvent('qbx_core:server:onSetMetaData', function(key, oldValue, newValue, source)
    if key == 'isdead' and newValue then
        local src = source
        local player = exports.qbx_core:GetPlayer(src)
        if not player then return end
        local index = player.Functions.GetMetaData('houserobbery')
        if not index or index == 0 then return end
        local house = sharedConfig.houses[index]
        SetTimeout(100, function()
            leaveHouse(src, house.coords)
        end)
    end
end)

-- Event handler to sync configuration to new players joining server
AddEventHandler('playerJoining', function()
    TriggerClientEvent('qbx_houserobbery:client:syncconfig', source, sharedConfig.houses)
end)

RegisterNetEvent("QBCore:Server:OnPlayerLoaded", function ()
    -- spawn player in interior with correct bucket if he was in one
    local src = source
    checkPlayerSpawnLocation(src)
end)

