local RopeDrawShadowEnabled = RopeDrawShadowEnabled
local CascadeShadowsClearShadowSampleType = CascadeShadowsClearShadowSampleType
local CascadeShadowsSetAircraftMode = CascadeShadowsSetAircraftMode
local CascadeShadowsEnableEntityTracker = CascadeShadowsEnableEntityTracker
local CascadeShadowsSetDynamicDepthMode = CascadeShadowsSetDynamicDepthMode
local CascadeShadowsSetEntityTrackerScale = CascadeShadowsSetEntityTrackerScale
local CascadeShadowsSetDynamicDepthValue = CascadeShadowsSetDynamicDepthValue
local CascadeShadowsSetCascadeBoundsScale = CascadeShadowsSetCascadeBoundsScale
local SetFlashLightFadeDistance = SetFlashLightFadeDistance
local SetLightsCutoffDistanceTweak = SetLightsCutoffDistanceTweak
local DistantCopCarSirens = DistantCopCarSirens
local DisableOcclusionThisFrame = DisableOcclusionThisFrame
local SetDisableDecalRenderingThisFrame = SetDisableDecalRenderingThisFrame
local RemoveParticleFxInRange = RemoveParticleFxInRange
local OverrideLodscaleThisFrame = OverrideLodscaleThisFrame
local SetArtificialLightsState = SetArtificialLightsState
local ClearAllBrokenGlass = ClearAllBrokenGlass
local LeaderboardsReadClearAll = LeaderboardsReadClearAll
local ClearBrief = ClearBrief
local ClearGpsFlags = ClearGpsFlags
local ClearPrints = ClearPrints
local ClearSmallPrints = ClearSmallPrints
local ClearReplayStats = ClearReplayStats
local LeaderboardsClearCacheData = LeaderboardsClearCacheData
local ClearFocus = ClearFocus
local ClearHdArea = ClearHdArea
local ClearPedBloodDamage = ClearPedBloodDamage
local ClearPedWetness = ClearPedWetness
local ClearPedEnvDirt = ClearPedEnvDirt
local ResetPedVisibleDamage = ResetPedVisibleDamage
local ClearPedLastWeaponDamage = ClearPedLastWeaponDamage
local ClearExtraTimecycleModifier = ClearExtraTimecycleModifier
local ClearTimecycleModifier = ClearTimecycleModifier
local ClearOverrideWeather = ClearOverrideWeather
local DisableVehicleDistantlights = DisableVehicleDistantlights
local DisableScreenblurFade = DisableScreenblurFade
local SetRainLevel = SetRainLevel
local SetWindSpeed = SetWindSpeed

OpenMainMenu = function()
    ESX.UI.Menu.CloseAll()
    local MENU = {}

    if Config.Menu.informations then
        MENU[#MENU + 1] = {
            title = Strings.info_title,
            description = Strings.info_desc,
            arrow = true,
            onSelect = function()
                OpenInfoMenu()
            end
        }
    end

    if Config.Menu.idcard then
        MENU[#MENU + 1] = {
            title = Strings.idcard_title,
            description = Strings.idcard_desc,
            arrow = true,
            onSelect = function()
                OpenIDcardMenu()
            end
        }
    end

    if Config.Menu.settings then
        MENU[#MENU + 1] = {
            title = Strings.setting_title,
            description = Strings.setting_desc,
            arrow = true,
            onSelect = function()
                OpenSettingMenu()
            end
        }
    end

    if Config.Menu.vehicle then
        if (DoesEntityExist(cache.vehicle)) and GetPedInVehicleSeat(cache.vehicle, -1) == cache.ped then
            MENU[#MENU + 1] = {
                title = Strings.veh_title,
                description = Strings.veh_desc,
                arrow = true,
                onSelect = function()
                    OpenVehicleMenu()
                end
            }
        end
    end

    if Config.Menu.bills then
        MENU[#MENU + 1] = {
            title = Strings.bills_title,
            description = Strings.bills_desc,
            arrow = true,
            onSelect = function()
                OpenBillMenu()
            end
        }
    end

    if Config.Menu.company then
        if IsGradeAllowed() then
            MENU[#MENU + 1] = {
                title = Strings.company_title,
                description = Strings.company_desc,
                arrow = true,
                onSelect = function()
                    OpenCompanyMenu()
                end
            }
        end
    end

    if Config.Menu.navigation then
        MENU[#MENU + 1] = {
            title = Strings.navi_title,
            description = Strings.navi_desc,
            arrow = true,
            onSelect = function()
                OpenNavigationMenu()
            end
        }
    end

    if Config.Menu.server then
        MENU[#MENU + 1] = {
            title = Strings.server_title,
            description = Strings.server_desc,
            arrow = false,
            metadata = Config.Server
        }
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:main',
        title = Strings.menu_main,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:main')
end

OpenInfoMenu = function()
    if COOLDOWN then
        Config.Notification(nil, Strings.on_cooldown)
        return
    end
    StartCooldown()

    local MENU = {}
    local PLAYER_DATA = lib.callback.await('zrx_personalmenu:server:getPlayerData', 500)
    local SID = GetPlayerServerId(cache.playerId)

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenMainMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.player_title,
        description = (Strings.player_desc):format(SID, GetPlayerName(cache.playerId), PLAYER_DATA.ping),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.rpname_title,
        description = (Strings.rpname_desc):format(PLAYER_DATA.name),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.dob_title,
        description = (Strings.dob_desc):format(PLAYER_DATA.dob),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.height_title,
        description = (Strings.height_desc):format(PLAYER_DATA.height),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.sex_title,
        description = (Strings.sex_desc):format(ESX.PlayerData.sex == 'm' and Strings.male or Strings.female),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.job_title,
        description = (Strings.job_desc):format(PLAYER_DATA.job.label),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.job_grade_title,
        description = (Strings.job_grade_desc):format(PLAYER_DATA.job.grade_label, PLAYER_DATA.job.grade),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.bank_title,
        description = (Strings.bank_desc):format(ESX.Math.GroupDigits(PLAYER_DATA.bank)),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.money_title,
        description = (Strings.money_desc):format(ESX.Math.GroupDigits(PLAYER_DATA.money)),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.black_money_title,
        description = (Strings.black_money_desc):format(ESX.Math.GroupDigits(PLAYER_DATA.black_money)),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.lice_title,
        description = Strings.lice_desc,
        arrow = true,
        onSelect = function()
            OpenInfoLicenseMenu()
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:info',
        title = Strings.menu_info,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:info')
end

OpenInfoLicenseMenu = function()
    local MENU = {}
    local PLAYER_LICENSES = lib.callback.await('zrx_personalmenu:server:getPlayerLicenses', 500)

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenInfoMenu()
        end
    }

    for k, data in pairs(PLAYER_LICENSES) do
        MENU[#MENU + 1] = {
            title = data.type:upper(),
            arrow = false,
        }
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:info:licenses',
        title = Strings.menu_info_lice,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:info:licenses')
end

OpenIDcardMenu = function()
    local MENU = {}
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenMainMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.idcard_view_title,
        description = Strings.idcard_view_desc,
        arrow = false,
        onSelect = function()
            Config.IdcardMenu({ author = cache.serverId }, 'idcard')
        end
    }

    if DoesEntityExist(nearPlayerPed) then
        MENU[#MENU + 1] = {
            title = Strings.idcard_show_title,
            description = Strings.idcard_show_desc,
            arrow = false,
            onSelect = function()
                Config.IdcardMenu({ author = cache.serverId, target = nearPlayerId }, 'idcard')
            end
        }
    end

    MENU[#MENU + 1] = {
        title = Strings.driver_view_title,
        description = Strings.driver_view_desc,
        arrow = false,
        onSelect = function()
            Config.IdcardMenu({ author = cache.serverId }, 'driver')
        end
    }

    if DoesEntityExist(nearPlayerPed) then
        MENU[#MENU + 1] = {
            title = Strings.driver_show_title,
            description = Strings.driver_show_desc,
            arrow = false,
            onSelect = function()
                Config.IdcardMenu({ author = cache.serverId, target = nearPlayerId }, 'driver')
            end
        }
    end

    MENU[#MENU + 1] = {
        title = Strings.weapon_view_title,
        description = Strings.weapon_view_desc,
        arrow = false,
        onSelect = function()
            Config.IdcardMenu({ author = cache.serverId }, 'weapon')
        end
    }

    if DoesEntityExist(nearPlayerPed) then
        MENU[#MENU + 1] = {
            title = Strings.weapon_show_title,
            description = Strings.weapon_show_desc,
            arrow = false,
            onSelect = function()
                Config.IdcardMenu({ author = cache.serverId, target = nearPlayerId }, 'weapon')
            end
        }
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:idcard',
        title = Strings.menu_idcard,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:idcard')
end

DATA_ENGINE = true
OpenVehicleMenu = function()
    if not (DoesEntityExist(cache.vehicle)) or GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        OpenMainMenu()
        return
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenMainMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.eng_title,
        description = Strings.eng_desc,
        arrow = false,
        onSelect = function()
            if DATA_ENGINE then
                DATA_ENGINE = false

                while not DATA_ENGINE and DoesEntityExist(cache.vehicle) and GetPedInVehicleSeat(cache.vehicle, -1) == cache.ped do
                    SetVehicleEngineOn(cache.vehicle, false, false, false)
                    SetVehicleUndriveable(cache.vehicle, true)
                    Wait()
                end
            else
                DATA_ENGINE = true

                SetVehicleEngineOn(cache.vehicle, true, false, false)
                SetVehicleUndriveable(cache.vehicle, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.extra_title,
        description = Strings.extra_desc,
        arrow = true,
        onSelect = function()
            OpenVehicleExtrasMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.livery_title,
        description = Strings.livery_desc,
        arrow = true,
        onSelect = function()
            OpenVehicleLiveryMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.lights_title,
        description = Strings.lights_desc,
        arrow = true,
        onSelect = function()
            OpenVehicleLightsMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.window_title,
        description = Strings.window_desc,
        arrow = true,
        onSelect = function()
            OpenVehicleWindowMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.doors_title,
        description = Strings.doors_desc,
        arrow = true,
        onSelect = function()
            OpenVehicleDoorsMenu()
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle',
        title = Strings.menu_veh,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle')
end

OpenGiveVehicleMenu = function()
    if not (DoesEntityExist(cache.vehicle)) or GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        OpenMainMenu()
        return
    end

    local MENU = {}
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    MENU[#MENU + 1] = {
        title = Strings.give_title,
        description = Strings.give_desc,
        arrow = false,
        onSelect = function()
            if DoesEntityExist(nearPlayerPed) then
                local plate = GetVehicleNumberPlateText(cache.vehicle)

                TriggerServerEvent('zrx_personalmenu:server:giveCar', nearPlayerId, plate)
            else
                Config.Notification(nil, Strings.no_nearby)
            end
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:give',
        title = Strings.menu_veh_give,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:give')
end

OpenVehicleExtrasMenu = function()
    if not (DoesEntityExist(cache.vehicle)) or GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        OpenMainMenu()
        return
    elseif not Config.CanOpenExtras() then
        Config.Notification(nil, Strings.extra_cannot)
        OpenVehicleMenu()
        return
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenVehicleMenu()
        end
    }

    for i = 0, 20 do
        if DoesExtraExist(cache.vehicle, i) then
            MENU[#MENU + 1] = {
                title = (Strings.extra_title2):format(i, IsVehicleExtraTurnedOn(cache.vehicle, i) and Strings.on or Strings.off),
                description = Strings.extra_desc2,
                arrow = false,
                args = { id = i },
                onSelect = function(args)
                    if IsVehicleExtraTurnedOn(cache.vehicle, args.id) then
                        SetVehicleExtra(cache.vehicle, args.id, 1)
                    else
                        SetVehicleExtra(cache.vehicle, args.id, 0)
                    end

                    OpenVehicleExtrasMenu()
                end
            }
		end
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle:extras',
        title = Strings.menu_veh_extra,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:extras')
end

OpenVehicleLiveryMenu = function()
    if not (DoesEntityExist(cache.vehicle)) or GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        OpenMainMenu()
        return
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenVehicleMenu()
        end
    }

    for i = 0, GetVehicleLiveryCount(cache.vehicle) do
        MENU[#MENU + 1] = {
            title = (Strings.livery_title2):format(i),
            description = Strings.livery_desc2,
            arrow = false,
            args = { id = i },
            onSelect = function(args)
                SetVehicleLivery(cache.vehicle, args.id)

                OpenVehicleLiveryMenu()
            end
        }
	end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle:livery',
        title = Strings.menu_veh_livery,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:livery')
end

DATA_LIGHTS = {
    interior = true,
    exterior = true,
    neon = true
}
OpenVehicleLightsMenu = function()
    if not (DoesEntityExist(cache.vehicle)) or GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        OpenMainMenu()
        return
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenVehicleMenu()
        end
    }

    MENU[#MENU + 1] = {
        title =  Strings.lights_int_title,
        description = Strings.lights_int_desc,
        arrow = false,
        onSelect = function()
            if DATA_LIGHTS.interior then
                DATA_LIGHTS.interior = false
                SetVehicleInteriorlight(cache.vehicle, false)
            else
                DATA_LIGHTS.interior = true
                SetVehicleInteriorlight(cache.vehicle, true)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.lights_ext_title,
        description = Strings.lights_ext_desc,
        arrow = false,
        onSelect = function()
            if DATA_LIGHTS.exterior then
                DATA_LIGHTS.exterior = false
                SetVehicleLights(cache.vehicle, false)
            else
                DATA_LIGHTS.exterior = true
                SetVehicleLights(cache.vehicle, true)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.lights_neon_title,
        description = Strings.lights_neon_desc,
        arrow = false,
        onSelect = function()
            if DATA_LIGHTS.neon then
                DATA_LIGHTS.neon = false
                DisableVehicleNeonLights(cache.vehicle, false, false, false)
            else
                DATA_LIGHTS.neon = true
                DisableVehicleNeonLights(cache.vehicle, true, false, false)
            end
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle:lights',
        title = Strings.menu_veh_lights,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:lights')
end

DATA_WINDOWS = {
    front_left = false,
    front_right = false,
    back_left = false,
    back_right = false
}
OpenVehicleWindowMenu = function()
    if not (DoesEntityExist(cache.vehicle)) or GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        OpenMainMenu()
        return
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenVehicleMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_front_win_title,
        description = Strings.left_front_win_desc,
        arrow = false,
        onSelect = function()
            if DATA_WINDOWS.front_left then
                DATA_LIGHTS.front_left = false
                RollUpWindow(cache.vehicle, 0)
            else
                DATA_LIGHTS.front_left = true
                RollDownWindow(cache.vehicle, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_front_win_title,
        description = Strings.right_front_win_desc,
        arrow = false,
        onSelect = function()
            if DATA_WINDOWS.front_right then
                DATA_LIGHTS.front_right = false
                RollUpWindow(cache.vehicle, 1)
            else
                DATA_LIGHTS.front_right = true
                RollDownWindow(cache.vehicle, 1)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_back_win_title,
        description = Strings.left_back_win_desc,
        arrow = false,
        onSelect = function()
            if DATA_WINDOWS.back_left then
                DATA_LIGHTS.back_left = false
                RollUpWindow(cache.vehicle, 2)
            else
                DATA_LIGHTS.back_left = true
                RollDownWindow(cache.vehicle, 2)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_back_win_title,
        description = Strings.right_back_win_desc,
        arrow = false,
        onSelect = function()
            if DATA_WINDOWS.back_right then
                DATA_LIGHTS.back_right = false
                RollUpWindow(cache.vehicle, 3)
            else
                DATA_LIGHTS.back_right = true
                RollDownWindow(cache.vehicle, 3)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.all_win_down_title,
        description = Strings.all_win_down_desc,
        arrow = false,
        onSelect = function()
            for i = 1, #DATA_WINDOWS do
                DATA_WINDOWS[i] = false
            end

            RollDownWindows(cache.vehicle)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.all_win_up_title,
        description = Strings.all_win_up_desc,
        arrow = false,
        onSelect = function()
            for i = 1, #DATA_WINDOWS do
                DATA_WINDOWS[i] = true
            end

            for i = 0, 3 do
                RollUpWindow(cache.vehicle, i)
            end
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle:windows',
        title = Strings.menu_veh_win,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:windows')
end

DATA_DOORS = {
    front_left = false,
    front_right = false,
    back_left = false,
    back_right = false,
    hood = false,
    trunk = false
}
OpenVehicleDoorsMenu = function()
    if not (DoesEntityExist(cache.vehicle)) or GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        OpenMainMenu()
        return
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenVehicleMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_front_door_title,
        description = Strings.left_front_door_desc,
        arrow = false,
        onSelect = function()
            if DATA_DOORS.front_left then
                DATA_DOORS.front_left = false
                SetVehicleDoorShut(cache.vehicle, 0, false)
            else
                DATA_DOORS.front_left = true
                SetVehicleDoorOpen(cache.vehicle, 0, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_front_door_title,
        description = Strings.right_front_door_desc,
        arrow = false,
        onSelect = function()
            if DATA_DOORS.front_right then
                DATA_DOORS.front_right = false
                SetVehicleDoorShut(cache.vehicle, 1, false)
            else
                DATA_DOORS.front_right = true
                SetVehicleDoorOpen(cache.vehicle, 1, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_back_door_title,
        description = Strings.left_back_door_desc,
        arrow = false,
        onSelect = function()
            if DATA_DOORS.back_left then
                DATA_DOORS.back_left = false
                SetVehicleDoorShut(cache.vehicle, 2, false)
            else
                DATA_DOORS.back_left = true
                SetVehicleDoorOpen(cache.vehicle, 2, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_back_door_title,
        description = Strings.right_back_door_desc,
        arrow = false,
        onSelect = function()
            if DATA_DOORS.back_right then
                DATA_DOORS.back_right = false
                SetVehicleDoorShut(cache.vehicle, 3, false)
            else
                DATA_DOORS.back_right = true
                SetVehicleDoorOpen(cache.vehicle, 3, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.hood_title,
        description = Strings.hood_desc,
        arrow = false,
        onSelect = function()
            if DATA_DOORS.hood then
                DATA_DOORS.hood = false
                SetVehicleDoorShut(cache.vehicle, 4, false)
            else
                DATA_DOORS.hood = true
                SetVehicleDoorOpen(cache.vehicle, 4, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.trunk_title,
        description = Strings.trunk_desc,
        arrow = false,
        onSelect = function()
            if DATA_DOORS.trunk then
                DATA_DOORS.trunk = false
                SetVehicleDoorShut(cache.vehicle, 5, false)
            else
                DATA_DOORS.trunk = true
                SetVehicleDoorOpen(cache.vehicle, 5, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.all_doors_close_title,
        description = Strings.all_doors_close_desc,
        arrow = false,
        onSelect = function()
            for i = 1, #DATA_DOORS do
                DATA_DOORS[i] = true
            end

            for i = 0, 4 do
                SetVehicleDoorOpen(cache.vehicle, i, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.all_doors_open_title,
        description = Strings.all_doors_open_desc,
        arrow = false,
        onSelect = function()
            for i = 1, #DATA_DOORS do
                DATA_DOORS[i] = false
            end

            SetVehicleDoorsShut(cache.vehicle)
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle:doors',
        title = Strings.menu_veh_doors,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:doors')
end

DATA_SETTINGS = {
    graphic = false,
    booster = false
}
OpenSettingMenu = function()
    local MENU = {}
    local settingsFile, lines, setting

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenMainMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.graphic_title,
        description = Strings.graphic_desc,
        arrow = false,
        onSelect = function()
            if DATA_SETTINGS.graphic then
                DATA_SETTINGS.graphic = false
                settingsFile = LoadResourceFile(GetCurrentResourceName(), 'files/graphic_off.dat')
                lines = StringSplit(settingsFile, '\n')

                for k, v in ipairs(lines) do
                    if not StartsWith(v, '#') and not StartsWith(v, '//') and (v ~= '' or v ~= ' ') and #v > 1 then
                        v = v:gsub('%s+', ' ')
                        setting = StringSplit(v, ' ')

                        if setting[1] and setting[2] and tonumber(setting[2]) then
                            SetVisualSettingFloat(setting[1], tonumber(setting[2])+.0 )
                        end
                    end
                end
            else
                DATA_SETTINGS.graphic = true
                settingsFile = LoadResourceFile(GetCurrentResourceName(), 'files/graphic_on.dat')
                lines = StringSplit(settingsFile, '\n')

                for k, v in ipairs(lines) do
                    if not StartsWith(v, '#') and not StartsWith(v, '//') and (v ~= '' or v ~= ' ') and #v > 1 then
                        v = v:gsub('%s+', ' ')
                        setting = StringSplit(v, ' ')

                        if setting[1] and setting[2] and tonumber(setting[2]) then
                            SetVisualSettingFloat(setting[1], tonumber(setting[2])+.0 )
                        end
                    end
                end
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.booster_title,
        description = Strings.booster_desc,
        arrow = false,
        onSelect = function()
            OnBooster(not DATA_SETTINGS.booster)
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:setting',
        title = Strings.menu_setting,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:setting')
end

OpenBillMenu = function()
    if COOLDOWN then
        Config.Notification(nil, Strings.on_cooldown)
        return
    end
    StartCooldown()

    local MENU = {}
    local PLAYER_BILLS = lib.callback.await('zrx_personalmenu:server:getPlayerBills', 500)

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenMainMenu()
        end
    }

    for k, data in pairs(PLAYER_BILLS) do
        MENU[#MENU + 1] = {
            title = (Strings.bill_title):format(k --[[data.id DATABASE ID]]),
            description = Strings.bill_desc,
            arrow = false,
            args = { id = data.id, label = data.label, amount = data.amount },
            onSelect = function()
                COOLDOWN = false
                PayBill(data.id)
                Wait(100)
                OpenBillMenu()
            end,
            metadata = {
                { label = Strings.bill_reason, value = data.label },
                { label = Strings.bill_amount, value = (Strings.bill_amount_value):format(data.amount) },
            }
        }
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:bills',
        title = Strings.menu_bills,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:bills')
end

OpenCompanyMenu = function()
    if COOLDOWN then
        Config.Notification(nil, Strings.on_cooldown)
        return
    end
    StartCooldown()

    if not IsGradeAllowed() then
        OpenMainMenu()
        return
    end

    local MENU = {}
    local DATA_SOC_MONEY = lib.callback.await('zrx_personalmenu:server:getSocietyMoney', 500, ESX.PlayerData.job.name)
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenMainMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_money_title,
        description = (Strings.company_money_desc):format(ESX.Math.GroupDigits(DATA_SOC_MONEY)),
        arrow = false,
    }

    MENU[#MENU + 1] = {
        title = Strings.company_hire_title,
        description = Strings.company_hire_desc,
        arrow = false,
        onSelect = function()
            if not DoesEntityExist(nearPlayerPed) then
                Config.Notification(nil, Strings.no_nearby)
            else
                TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'hire')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_fire_title,
        description = Strings.company_fire_desc,
        arrow = false,
        onSelect = function()
            if not DoesEntityExist(nearPlayerPed) then
                Config.Notification(nil, Strings.no_nearby)
            else
                TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'fire')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_promote_title,
        description = Strings.company_promote_desc,
        arrow = false,
        onSelect = function()
            if not DoesEntityExist(nearPlayerPed) then
                Config.Notification(nil, Strings.no_nearby)
            else
                TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'promote')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_derank_title,
        description = Strings.company_derank_desc,
        arrow = false,
        onSelect = function()
            if not DoesEntityExist(nearPlayerPed) then
                Config.Notification(nil, Strings.no_nearby)
            else
                TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'derank')
            end
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:company',
        title = Strings.menu_company,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:company')
end

OpenNavigationMenu = function()
    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.back,
        onSelect = function()
            OpenMainMenu()
        end
    }

    for k, data in pairs(Config.Navigation.destinations) do
        MENU[#MENU + 1] = {
            title = data.label,
            description = Strings.navi_desc2,
            arrow = false,
            args = { label = data.label },
            onSelect = function(args)
                local found = false

                for v, data2 in pairs(DATA_ROUTE) do
                    if data.coords == data2.coords then
                        found = true
                    end
                end

                if found then
                    Config.Notification(nil, (Strings.navi_already):format(data.label))
                else
                    local blip = Config.Navigation.route(vector3(data.coords.x, data.coords.y, data.coords.z), (Strings.navi_dest):format(args.label))
                    DATA_ROUTE[#DATA_ROUTE + 1] = {
                        blip = blip,
                        coords = data.coords,
                        time = Config.Navigation.timeout
                    }

                    Config.Notification(nil, (Strings.navi_set):format(data.label))
                end
            end,
        }
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:navigation',
        title = Strings.menu_navi,
        options = MENU,
    })

    lib.showContext('zrx_personalmenu:personal_menu:navigation')
end

OnBooster = function(state)
    DATA_SETTINGS.booster = state
    print(state)
    if not state then
        RopeDrawShadowEnabled(true)
        CascadeShadowsSetAircraftMode(true)
        CascadeShadowsEnableEntityTracker(false)
        CascadeShadowsSetDynamicDepthMode(true)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(5.0)
        CascadeShadowsSetCascadeBoundsScale(5.0)
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        DistantCopCarSirens(true)
        SetArtificialLightsState(false)
    else
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetCascadeBoundsScale(0.0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
    end

    local pedCoords
    CreateThread(function()
        while DATA_SETTINGS.booster do
            pedCoords = GetEntityCoords(cache.ped)
            DisableOcclusionThisFrame()
            SetDisableDecalRenderingThisFrame()
            RemoveParticleFxInRange(vector3(pedCoords.x, pedCoords.y, pedCoords.z), 10.0)
            OverrideLodscaleThisFrame(0.4)
            SetArtificialLightsState(true)
            ClearAllBrokenGlass()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ClearPedBloodDamage(cache.ped)
            ClearPedWetness(cache.ped)
            ClearPedEnvDirt(cache.ped)
            ResetPedVisibleDamage(cache.ped)
            ClearPedLastWeaponDamage(cache.ped)
            ClearExtraTimecycleModifier()
            ClearTimecycleModifier()
            ClearOverrideWeather()
            DisableVehicleDistantlights(false)
            DisableScreenblurFade()
            SetRainLevel(0.0)
            SetWindSpeed(0.0)
            Wait()
        end
    end)
end

PayBill = function(bill)
    ESX.TriggerServerCallback('esx_billing:payBill', function()
    end, bill)
end

StartCooldown = function()
    COOLDOWN = true

    SetTimeout(Config.Cooldown, function()
        COOLDOWN = false
    end)
end

IsGradeAllowed = function()
    return Config.Company.allowedGrades[ESX.PlayerData.job.grade_name] or false
end