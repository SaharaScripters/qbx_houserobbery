local config = require 'config.client'
local sharedConfig = require 'config.shared'
local bossLocations = config.bossLocations
local bossPeds = {}
local houseLoot = {}
local houseBlip = nil
local house = 1
local ITEMS = exports.ox_inventory:Items()

local function dropFingerprint()
    if qbx.isWearingGloves() then return end

    local coords = GetEntityCoords(cache.ped)
    if config.fingerprintChance > math.random(0, 100) then
        TriggerServerEvent('evidence:server:CreateFingerDrop', coords)
    end
end

local function removeHouseBlip()
    if houseBlip then
        RemoveBlip(houseBlip)
        houseBlip = nil
    end
end

local function createHouseBlip(coords)
    if houseBlip then
        removeHouseBlip()
    end
    houseBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(houseBlip, 40)
    SetBlipScale(houseBlip, 0.8)
    SetBlipColour(houseBlip, 3)
    SetBlipAsShortRange(houseBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('House Robbery')
    EndTextCommandSetBlipName(houseBlip)
end

local function removeBossPeds()
    exports.ox_target:removeLocalEntity(bossPeds)
    for _, ped in pairs(bossPeds) do
        DeleteEntity(ped)
    end
    bossPeds = {}
end

local function openBossMenu()
    local menuItems = {}
    local availableInteriors = lib.callback.await('qbx_houserobbery:server:getAvailableInteriors', false)
    for i = 1, #sharedConfig.interiors do
        if availableInteriors[i] and availableInteriors[i] > 0 then
            local description = 'Click to get house coords'
            description = '\n' .. 'Price: ' .. sharedConfig.interiors[i].infoPrice .. '$'
            menuItems[#menuItems + 1] = {
                title = 'Available Class(' .. i .. '): ' .. availableInteriors[i],
                icon = 'fas fa-door-open',
                description = description,
                onSelect = function()
                    TriggerServerEvent('qbx_houserobbery:server:getHouseCoords', i)
                end,
            }
        end
    end
    if #menuItems == 0 then
        menuItems[#menuItems + 1] = {
            title = 'No Available Houses',
            icon = 'fas fa-door-closed',
            description = 'No houses available to rob',
        }
    end

    lib.registerContext({
        id = 'house_robbery_boss_menu',
        title = 'Robbery Boss Menu',
        options = menuItems,
    })
    lib.showContext('house_robbery_boss_menu')
end

--- @param targetData table
--- @return number
local function spawnBossPed(targetData)
    local hash = joaat(targetData.model)
    lib.requestModel(hash, 10000)
    local ped = CreatePed(4, hash, targetData.coords.x, targetData.coords.y, targetData.coords.z, targetData.coords.w, false, false)
    TaskStartScenarioInPlace(ped, targetData.scenario, 1, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetModelAsNoLongerNeeded(hash)
    return ped
end

  --- @param ped number
  --- @param targetData table
local function attachBossTarget(ped, targetData)
    local options = {
        {
            icon = 'fas fa-car',
            label = 'open boss menu',
            canInteract = function()
            if not IsPedInAnyVehicle(cache.ped, false) then
                return true
            end
            end,
            onSelect = function()
                openBossMenu()
            end,
            distance = targetData.distance or 2.5,
        },
    }
    exports.ox_target:addLocalEntity(ped, options)
    bossPeds[1 + #bossPeds] = ped
end

local function loadBossPeds()
    for _, targetData in pairs(bossLocations) do
        local ped = spawnBossPed(targetData)
        attachBossTarget(ped, targetData)
    end
end

-- Handle pickup of objects in an IPL. These are props that are part of the IPL
-- currentDistance is used because
---@param pickup table Loot pickup point
local function handleHousePickup(pickup)
    local pickupId = pickup.housePickup
    if pickup.currentDistance < 0.8 and not sharedConfig.houses[house].pickups[pickupId].isOpened then
        if config.showPrompts then
            local rewardLabel = ITEMS[sharedConfig.houses[house].pickups[pickupId].reward]['label']
            local label = locale('text.pickup', rewardLabel)
            if config.useDrawText then
                qbx.drawText3d({ text = label, coords = sharedConfig.houses[house].pickups[pickupId].coords })
            elseif not lib.isTextUIOpen() then
                lib.showTextUI(label, { position = 'left-center' })
            end
        end
        if IsControlJustReleased(0, 38) then
            dropFingerprint()
            local canStart = lib.callback.await('qbx_houserobbery:server:checkPickup', false, house, pickupId)
            if not canStart then return end
            if lib.progressCircle({
                    duration = math.random(4000, 8000),
                    position = 'bottom',
                    canCancel = true,
                    disable = {
                        move = true,
                        combat = true,
                    },
                    anim = {
                        dict = 'missexile3',
                        clip = 'ex03_dingy_search_case_base_michael',
                        flag = 1,
                        blendIn = 1.0
                    },
                }) then
                TriggerServerEvent('qbx_houserobbery:server:pickupFinished', house, pickupId)
            else
                TriggerServerEvent('qbx_houserobbery:server:pickupCancelled', house, pickupId)
            end
        end
    elseif sharedConfig.houses[house].pickups[pickupId].isOpened then
        local pickupProp = sharedConfig.houses[house].pickups[pickupId]
        local entity = GetClosestObjectOfType(pickup.coords.x, pickup.coords.y, pickup.coords.z, 3.0, joaat(pickupProp.prop), false, false, false)
        if DoesEntityExist(entity) then
            SetEntityVisible(entity, false, false)
        end
    end
end

-- Function for handling loot pickup and display inside interiors.
---@param lootId number Index number for loot point
local function handleHouseLoot(lootId)
    if not sharedConfig.houses[house].opened then return end
    if not sharedConfig.houses[house].loot[lootId].isOpened then
        local label = locale('text.search')
        if config.useDrawText then
            qbx.drawText3d({ text = label, coords = sharedConfig.houses[house].loot[lootId].coords })
        elseif not lib.isTextUIOpen() then
            lib.showTextUI(locale('text.search'), { position = 'left-center' })
        end
        if IsControlJustReleased(0, 38) then
            dropFingerprint()
            local canStart = lib.callback.await('qbx_houserobbery:server:checkLoot', false, house, lootId)
            if not canStart then return end
            if lib.progressCircle({
                    duration = math.random(4000, 8000),
                    position = 'bottom',
                    canCancel = true,
                    disable = {
                        move = true,
                        combat = true,
                    },
                    anim = {
                        dict = 'missexile3',
                        clip = 'ex03_dingy_search_case_base_michael',
                        flag = 1,
                        blendIn = 1.0
                    },
                }) then
                TriggerServerEvent('qbx_houserobbery:server:lootFinished', house, lootId)
            else
                TriggerServerEvent('qbx_houserobbery:server:lootCancelled', house, lootId)
            end
        end
    end
end

-- Setup loot on entrance since we reuse ipl interiors
local function setupLoot()
    for k, v in pairs(sharedConfig.houses[house].loot) do
        local point = lib.points.new({
            coords = v.coords.xyz,
            distance = 0.8,
            houseLoot = k
        })
        function point:onExit()
            lib.hideTextUI()
        end

        function point:nearby()
            handleHouseLoot(self.houseLoot)
        end

        houseLoot[#houseLoot + 1] = point
    end
    for k, v in pairs(sharedConfig.houses[house].pickups) do
        local point = lib.points.new({
            coords = v.coords.xyz,
            distance = 30,
            housePickup = k
        })
        function point:onExit()
            lib.hideTextUI()
        end

        function point:nearby()
            handleHousePickup(self)
        end
        houseLoot[#houseLoot + 1] = point
    end
end

-- Removes loot from interiors on exit and unload
local function removeLoot()
    for _, v in pairs(houseLoot) do
        v:remove()
    end
end

-- Handles showing house entrance text and processing entrance for opened houses
---@param houseId table
local function handleHouseEntrance(houseId)
    local id = houseId.id
    local isSecured = sharedConfig.houses[id].secured
    if isSecured then return end
    local isOpen = sharedConfig.houses[id].opened
    if isOpen then
        if IsControlJustReleased(0, 38) then
            lib.playAnim(cache.ped, 'anim@heists@keycard@', 'exit', 5.0, 1.0, -1, 16, 0, false, false, false)
            TriggerServerEvent('qbx_houserobbery:server:enterHouse', houseId.id)
        elseif IsControlJustReleased(0, 47) then
            lib.playAnim(cache.ped, 'anim@heists@keycard@', 'exit', 5.0, 1.0, -1, 16, 0, false, false, false)
            TriggerServerEvent('qbx_houserobbery:server:secureHouse', houseId.id)
        end
    end
    local displayMessage = isOpen and locale('text.enter_house') or locale('text.enter_requirements')
    if isOpen and QBX.PlayerData.job.name == 'police' then
        displayMessage = displayMessage .. '\n' .. locale('text.police_secure')
    end
    if config.useDrawText then
        qbx.drawText3d({ text = displayMessage, coords = houseId.coords })
    elseif not lib.isTextUIOpen() then
        lib.showTextUI(displayMessage, { position = 'left-center' })
    end
end

-- Handles showing house exit text and processing exit
---@param interiorId table
local function handleHouseExits(interiorId)

    local label = locale('text.leave_house')
    if config.useDrawText then
        qbx.drawText3d({ text = label, coords = interiorId.coords })
    elseif not lib.isTextUIOpen() then
        lib.showTextUI(label, { position = 'left-center' })
    end
    if IsControlJustReleased(0, 38) then
        lib.playAnim(cache.ped, 'anim@heists@keycard@', 'exit', 5.0, 1.0, -1, 16, 0, false, false, false)
        TriggerServerEvent('qbx_houserobbery:server:leaveHouse')
        removeLoot()
    end
end

-- Setup house entrance and exit points using ox_lib points
local function setupHouses()
    for i = 1, #sharedConfig.houses do
        local point = lib.points.new({
            id = i,
            coords = sharedConfig.houses[i].coords.xyz,
            distance = config.debugPoints and 50 or 1.6,
            interior = sharedConfig.houses[i].interior
        })
        function point:onEnter()
            house = self.id
        end

        function point:onExit()
            lib.hideTextUI()
        end

        function point:nearby()
            handleHouseEntrance(self)
        end
    end
    for i = 1, #sharedConfig.interiors do
        local point = lib.points.new({
            id = i,
            coords = sharedConfig.interiors[i].exit.xyz,
            distance = 1.6,
        })
        function point:onExit()
            lib.hideTextUI()
        end

        function point:nearby()
            handleHouseExits(self)
        end
    end
end

RegisterNetEvent('lockpicks:UseLockpick', function(itemData)
    local isAdvanced = itemData?.name == 'advancedlockpick'
    TriggerServerEvent('qbx_houserobbery:server:enterHouse', isAdvanced)
end)

---@param difficulty table
lib.callback.register('qbx_houserobbery:client:startSkillcheck', function(difficulty)
    lib.playAnim(cache.ped, 'veh@break_in@0h@p_m_one@', 'std_force_entry_rds', 3.0, 3.0, -1, 17, 0, false, false, false)
    local success = lib.skillCheck(difficulty)
    ClearPedTasks(cache.ped)
    return success
end)

lib.callback.register('qbx_houserobbery:client:checkTime', function()
    local currentHour = GetClockHours()
    return currentHour >= config.startHours or currentHour <= config.endHours
end)

RegisterNetEvent('qbx_houserobbery:client:enterHouse', setupLoot)

---@param data table Table of loot data for houses
---@param index number Used to sync just a specific house number
RegisterNetEvent('qbx_houserobbery:client:syncconfig', function(data, index)
    if index then
        sharedConfig.houses[index] = data
    else
        sharedConfig.houses = data
    end
end)

RegisterNetEvent('qbx_houserobbery:client:showHouseCoords', function(houseCoords)
    createHouseBlip(houseCoords)
    SetTimeout(5 * 60 * 1000, function()
        removeHouseBlip()
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    loadBossPeds()
    setupHouses()
end)

-- Remove all points created by script to prevent duplicate points
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for _, v in pairs(lib.points.getAllPoints()) do
        v:remove()
    end
    removeBossPeds()
    removeHouseBlip()
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    loadBossPeds()
    setupHouses()
end)

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    for _, v in pairs(lib.points.getAllPoints()) do
        v:remove()
    end
    removeBossPeds()
    removeHouseBlip()
end)

RegisterNetEvent('qbx_houserobbery:client:screenfade', function()
    DoScreenFadeOut(250)
    while not IsScreenFadedOut() do Wait(50) end
    DoScreenFadeIn(500)
end)
