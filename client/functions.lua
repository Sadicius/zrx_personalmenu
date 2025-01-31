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
local GetPlayerName = GetPlayerName
local DoesEntityExist = DoesEntityExist
local GetPedInVehicleSeat = GetPedInVehicleSeat
local SetVehicleEngineOn = SetVehicleEngineOn
local SetVehicleUndriveable = SetVehicleUndriveable
local GetEntityCoords = GetEntityCoords
local GetPlayerServerId = GetPlayerServerId
local GetPlayerPed = GetPlayerPed
local DoesExtraExist = DoesExtraExist
local IsVehicleExtraTurnedOn = IsVehicleExtraTurnedOn
local SetVehicleExtra = SetVehicleExtra
local GetVehicleNumberPlateText = GetVehicleNumberPlateText
local GetVehicleLiveryCount = GetVehicleLiveryCount
local SetVehicleLivery = SetVehicleLivery
local SetVehicleInteriorlight = SetVehicleInteriorlight
local SetVehicleLights = SetVehicleLights
local DisableVehicleNeonLights = DisableVehicleNeonLights
local RollUpWindow = RollUpWindow
local RollDownWindow = RollDownWindow
local RollDownWindows = RollDownWindows
local SetVehicleDoorShut = SetVehicleDoorShut
local SetVehicleDoorOpen = SetVehicleDoorOpen
local SetVehicleDoorsShut = SetVehicleDoorsShut
local LoadResourceFile = LoadResourceFile
local GetCurrentResourceName = GetCurrentResourceName
local SetVisualSettingFloat = SetVisualSettingFloat
local Wait = Wait
local TriggerServerEvent = TriggerServerEvent
local vector3 = vector3
local TaskPlayAnim = TaskPlayAnim
local ClearPedTasks = ClearPedTasks
local GetPedDrawableVariation = GetPedDrawableVariation
local GetPedTextureVariation = GetPedTextureVariation
local SetPedComponentVariation = SetPedComponentVariation
local SetPedPropIndex = SetPedPropIndex
local GetPedPropIndex = GetPedPropIndex
local GetPedPropTextureIndex = GetPedPropTextureIndex
local ClearPedProp = ClearPedProp

local CLOTHE_DATA = {
    ComponentId = {
        --| face = 0,
        mask = 1,
        --| hair = 2,
        arms = 3,
        pants = 4,
        bag = 5,
        shoes = 6,
        neck = 7,
        shirt = 8,
        vest = 9,
        --| decals = 10,
        torso = 11,
    },

    PropId = {
        hat = 0,
        glass = 1,
        ears = 2,
        watch = 6,
        bracelets = 7,
    },

    Set = {
        hat = {
            off = {
                anim = 'take_off_helmet_stand',
                dict = 'missheist_agency2ahelmet',
                duration = 1000,
            },

            on = {
                anim = 'put_on_mask',
                dict = 'mp_masks@standard_car@ds@',
                duration = 1000,
            }
        },

        glass = {
            anim = 'take_off',
            dict = 'clothingspecs',
            duration = 1000,
        },

        ears = {
            anim = 'b_think',
            dict = 'mp_cp_stolen_tut',
            duration = 1000,
        },

        watch = {
            anim = 'cs_nigel_dual-10',
            dict = 'nmt_3_rcm-10',
            duration = 1000,
        },

        bracelets = {
            anim = 'cs_nigel_dual-10',
            dict = 'nmt_3_rcm-10',
            duration = 1000,
        },

        mask = {
            anim = 'put_on_mask',
            dict = 'mp_masks@standard_car@ds@',
            duration = 800,
        },

        arms = {
            anim = 'cs_nigel_dual',
            dict = 'nmt_3_rcm-10',
            duration = 2000,
        },

        pants = {
            anim = 'out_of_breath',
            dict = 're@construction',
            duration = 1000,
        },

        bag = {
            anim = 'intro',
            dict = 'anim@heists@ornate_bank@grab_cash',
            duration = 1500,
        },

        shoes = {
            anim = 'pickup_low',
            dict = 'random@domestic',
            duration = 1500,
        },

        shirt = {
            anim = 'try_tie_negative_a',
            dict = 'clothingtie',
            duration = 1500,
        },

        vest = {
            anim = 'try_tie_negative_a',
            dict = 'clothingtie',
            duration = 1000,
        },

        torso = {
            anim = 'michael_tux_fidget',
            dict = 'missmic4',
            duration = 1500,
        },

        neck = {
            anim = 'try_tie_positive_a',
            dict = 'clothingtie',
            duration = 2000,
        }
    }
}

OpenMainMenu = function()
    if not Config.CanOpenMenu() then return end
    local MENU = {}

    ESX.UI.Menu.CloseAll()
    ESX.CloseContext()

    if Config.Menu.player then
        MENU[#MENU + 1] = {
            title = Strings.info_title,
            description = Strings.info_desc,
            arrow = true,
            icon = 'fa-solid fa-user',
            iconColor = Config.IconColor,
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
            icon = 'fa-solid fa-id-card',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenIDcardMenu()
            end
        }
    end

    if Config.Menu.clothe then
        MENU[#MENU + 1] = {
            title = Strings.clothe_title,
            description = Strings.clothe_desc,
            arrow = true,
            icon = 'fa-solid fa-shirt',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenClotheMenu()
            end
        }
    end

    if Config.Menu.settings then
        MENU[#MENU + 1] = {
            title = Strings.setting_title,
            description = Strings.setting_desc,
            arrow = true,
            icon = 'fa-solid fa-gears',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenSettingMenu()
            end
        }
    end

    if Config.Menu.vehicle then
        MENU[#MENU + 1] = {
            title = Strings.veh_title,
            description = Strings.veh_desc,
            arrow = true,
            icon = 'fa-solid fa-car',
            iconColor = Config.IconColor,
            disabled = not IsVehicleValid(),
            onSelect = function()
                OpenVehicleMenu()
            end
        }
    end

    if Config.Menu.bills then
        MENU[#MENU + 1] = {
            title = Strings.bills_title,
            description = Strings.bills_desc,
            arrow = true,
            icon = 'fa-solid fa-money-bill',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenBillMenu()
            end
        }
    end

    if Config.Menu.company then
        MENU[#MENU + 1] = {
            title = Strings.company_title,
            description = Strings.company_desc,
            arrow = true,
            icon = 'fa-solid fa-building',
            iconColor = Config.IconColor,
            disabled = not IsGradeAllowed(),
            onSelect = function()
                OpenCompanyMenu()
            end
        }
    end

    if Config.Menu.navigation then
        MENU[#MENU + 1] = {
            title = Strings.navi_title,
            description = Strings.navi_desc,
            arrow = true,
            icon = 'fa-solid fa-compass',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenNavigationMenu()
            end
        }
    end

    if Config.Menu.information then
        MENU[#MENU + 1] = {
            title = Strings.information_title,
            description = Strings.information_desc,
            arrow = false,
            icon = 'fa-solid fa-circle-info',
            iconColor = Config.IconColor,
            metadata = Config.Information
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
    local MENU = {}
    local PLAYER_DATA = lib.callback.await('zrx_personalmenu:server:getPlayerData', 500)

    if COOLDOWN or not PLAYER_DATA?.name then
        Config.Notification(nil, Strings.on_cooldown)
        return OpenMainMenu()
    end
    StartCooldown()

    MENU[#MENU + 1] = {
        title = Strings.player_title,
        description = (Strings.player_desc):format(cache.serverId, GetPlayerName(cache.playerId), PLAYER_DATA.ping),
        arrow = false,
        icon = 'fa-solid fa-user',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.rpname_title,
        description = (Strings.rpname_desc):format(PLAYER_DATA.name),
        arrow = false,
        icon = 'fa-solid fa-signature',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.dob_title,
        description = (Strings.dob_desc):format(PLAYER_DATA.dob),
        arrow = false,
        icon = 'fa-solid fa-calendar-days',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.height_title,
        description = (Strings.height_desc):format(PLAYER_DATA.height),
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.sex_title,
        description = (Strings.sex_desc):format(ESX.PlayerData.sex == 'm' and Strings.male or Strings.female),
        arrow = false,
        icon = 'fa-solid fa-genderless',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.job_title,
        description = (Strings.job_desc):format(PLAYER_DATA.job.label),
        arrow = false,
        icon = 'fa-solid fa-briefcase',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.job_grade_title,
        description = (Strings.job_grade_desc):format(PLAYER_DATA.job.grade_label, PLAYER_DATA.job.grade),
        arrow = false,
        icon = 'fa-solid fa-briefcase',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.bank_title,
        description = (Strings.bank_desc):format(ESX.Math.GroupDigits(PLAYER_DATA.bank)),
        arrow = false,
        icon = 'fa-solid fa-credit-card',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.money_title,
        description = (Strings.money_desc):format(ESX.Math.GroupDigits(PLAYER_DATA.money)),
        arrow = false,
        icon = 'fa-solid fa-coins',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.black_money_title,
        description = (Strings.black_money_desc):format(ESX.Math.GroupDigits(PLAYER_DATA.black_money)),
        arrow = false,
        icon = 'fa-solid fa-dollar-sign',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.lice_title,
        description = Strings.lice_desc,
        arrow = true,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenInfoLicenseMenu()
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:info',
        title = Strings.menu_info,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:info')
end

OpenInfoLicenseMenu = function()
    local MENU = {}
    local PLAYER_LICENSES = lib.callback.await('zrx_personalmenu:server:getPlayerLicenses', 500)

    StartCooldown()

    if #PLAYER_LICENSES > 0 then
        for k, data in pairs(PLAYER_LICENSES) do
            MENU[#MENU + 1] = {
                title = Config.Licenses[data.type] or data.type:upper(),
                arrow = false,
                icon = 'fa-solid fa-id-card',
                iconColor = Config.IconColor,
            }
        end
    else
        MENU[#MENU + 1] = {
            title = Strings.lice_no,
            description = Strings.lice_no_desc,
            arrow = false,
            icon = 'fa-solid fa-xmark',
            iconColor = Config.IconColor,
        }
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:info:licenses',
        title = Strings.menu_info_lice,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:info'
    })

    lib.showContext('zrx_personalmenu:personal_menu:info:licenses')
end

OpenIDcardMenu = function()
    local MENU = {}
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    MENU[#MENU + 1] = {
        title = Strings.idcard_view_title,
        description = Strings.idcard_view_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            Config.IdcardMenu('idcard')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.idcard_show_title,
        description = Strings.idcard_show_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            Config.IdcardMenu('idcard', nearPlayerId)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.driver_view_title,
        description = Strings.driver_view_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            Config.IdcardMenu('driver')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.driver_show_title,
        description = Strings.driver_show_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            Config.IdcardMenu('driver', nearPlayerId)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.weapon_view_title,
        description = Strings.weapon_view_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            Config.IdcardMenu('weapon')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.weapon_show_title,
        description = Strings.weapon_show_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            Config.IdcardMenu('weapon', nearPlayerId)
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:idcard',
        title = Strings.menu_idcard,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:idcard')
end

OpenClotheMenu = function()
    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.reset_title,
        description = Strings.reset_desc,
        arrow = false,
        icon = 'fa-solid fa-power-off',
        iconColor = Config.IconColor,
        onSelect = function()
            DATA_CLOTHING.isRemoveDisabled = false

            ChangeComponent('reset', 'torso')
            ChangeComponent('reset', 'mask')
            ChangeComponent('reset', 'arms')
            ChangeComponent('reset', 'pants')
            ChangeComponent('reset', 'bag')
            ChangeComponent('reset', 'shoes')
            ChangeComponent('reset', 'shirt')
            ChangeComponent('reset', 'vest')
            ChangeComponent('reset', 'neck')
            ChangeProp('reset', 'hat')
            ChangeProp('reset', 'glass')
            ChangeProp('reset', 'ears')
            ChangeProp('reset', 'watch')
            ChangeProp('reset', 'bracelets')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.remove_title,
        description = Strings.remove_desc,
        arrow = false,
        icon = 'fa-solid fa-ban',
        iconColor = Config.IconColor,
        disabled = DATA_CLOTHING?.isRemoveDisabled,
        onSelect = function()
            DATA_CLOTHING.isRemoveDisabled = true

            ChangeComponent('set', 'torso', 15, 0)
            ChangeComponent('set', 'mask', 0, 0)
            ChangeComponent('set', 'arms', 15, 0)
            ChangeComponent('set', 'pants', 21, 0)
            ChangeComponent('set', 'bag', 0, 0)
            ChangeComponent('set', 'shoes', 34, 0)
            ChangeComponent('set', 'shirt', 15, 0)
            ChangeComponent('set', 'vest', 0, 0)
            ChangeComponent('set', 'neck', 0, 0)
            ChangeProp('remove', 'hat')
            ChangeProp('remove', 'glass')
            ChangeProp('remove', 'ears')
            ChangeProp('remove', 'watch')
            ChangeProp('remove', 'bracelets')
        end
    }


    MENU[#MENU + 1] = {
        title = Strings.hat_title,
        description = Strings.hat_desc,
        arrow = false,
        icon = 'fa-brands fa-redhat',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.hat?.state then
                ChangeProp('reset', 'hat')
            else
                ChangeProp('remove', 'hat')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.mask_title,
        description = Strings.mask_desc,
        arrow = false,
        icon = 'fa-solid fa-masks-theater',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.mask?.state then
                ChangeComponent('reset', 'mask')
            else
                ChangeComponent('set', 'mask', 0, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.ears_title,
        description = Strings.ears_desc,
        arrow = false,
        icon = 'fa-solid fa-ear-listen',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.ears?.state then
                ChangeProp('reset', 'ears')
            else
                ChangeProp('remove', 'ears')
            end
        end
    }


    MENU[#MENU + 1] = {
        title = Strings.glasses_title,
        description = Strings.glasses_desc,
        arrow = false,
        icon = 'fa-solid fa-glasses',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.glass?.state then
                ChangeProp('reset', 'glass')
            else
                ChangeProp('remove', 'glass')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.shirt_title,
        description = Strings.shirt_desc,
        arrow = false,
        icon = 'fa-solid fa-shirt',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.shirt?.state then
                ChangeComponent('reset', 'shirt')
                if not DATA_CLOTHING?.torso?.state then
                    ChangeComponent('reset', 'arms', -1, -1, true)
                end
            else
                ChangeComponent('set', 'shirt', 15, 0)
                if not DATA_CLOTHING?.torso?.state then
                    ChangeComponent('set', 'arms', 15, 0, true)
                end
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.torso_title,
        description = Strings.torso_desc,
        arrow = false,
        icon = 'fa-solid fa-shirt',
        iconColor = Config.IconColor,
        disabled = GetPedDrawableVariation(cache.ped, 11) == 15 and GetPedTextureVariation(cache.ped, 11) == 0 and not DATA_CLOTHING?.torso?.state,
        onSelect = function()
            if DATA_CLOTHING?.torso?.state then
                ChangeComponent('reset', 'torso')
                if not DATA_CLOTHING?.shirt?.state then
                    ChangeComponent('reset', 'arms', -1, -1, true)
                end
            else
                ChangeComponent('set', 'torso', 15, 0)
                if not DATA_CLOTHING?.shirt?.state then
                    ChangeComponent('set', 'arms', 15, 0, true)
                end
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.neck_title,
        description = Strings.neck_desc,
        arrow = false,
        icon = 'fa-brands fa-black-tie',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.neck?.state then
                ChangeComponent('reset', 'neck')
            else
                ChangeComponent('set', 'neck', 0, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.vest_title,
        description = Strings.vest_desc,
        arrow = false,
        icon = 'fa-solid fa-vest',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.vest?.state then
                ChangeComponent('reset', 'vest')
            else
                ChangeComponent('set', 'vest', 0, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.bag_title,
        description = Strings.bag_desc,
        arrow = false,
        icon = 'fa-solid fa-bag-shopping',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.bag?.state then
                ChangeComponent('reset', 'bag')
            else
                ChangeComponent('set', 'bag', 0, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.pants_title,
        description = Strings.pants_desc,
        arrow = false,
        icon = 'fa-solid fa-xmark',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.pants?.state then
                ChangeComponent('reset', 'pants')
            else
                ChangeComponent('set', 'pants', 21, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.shoes_title,
        description = Strings.shoes_desc,
        arrow = false,
        icon = 'fa-solid fa-shoe-prints',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.shoes?.state then
                ChangeComponent('reset', 'shoes')
            else
                ChangeComponent('set', 'shoes', 34, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.watch_title,
        description = Strings.watch_desc,
        arrow = false,
        icon = 'fa-solid fa-stopwatch',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.watch?.state then
                ChangeProp('reset', 'watch')
            else
                ChangeProp('remove', 'watch')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.bracelets_title,
        description = Strings.bracelets_desc,
        arrow = false,
        icon = 'fa-solid fa-hand',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.bracelets?.state then
                ChangeProp('reset', 'bracelets')
            else
                ChangeProp('remove', 'bracelets')
            end
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:clothing',
        title = Strings.menu_clothing,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:clothing')
end

local DATA_ENGINE = true
OpenVehicleMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.eng_title,
        description = Strings.eng_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_ENGINE then
                DATA_ENGINE = false

                while not DATA_ENGINE and IsVehicleValid() do
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleExtrasMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.livery_title,
        description = Strings.livery_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleLiveryMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.lights_title,
        description = Strings.lights_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleLightsMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.window_title,
        description = Strings.window_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleWindowMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.doors_title,
        description = Strings.doors_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleDoorsMenu()
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle',
        title = Strings.menu_veh,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle')
end

OpenGiveVehicleMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    MENU[#MENU + 1] = {
        title = Strings.give_title,
        description = Strings.give_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            local plate = GetVehicleNumberPlateText(cache.vehicle)
            TriggerServerEvent('zrx_personalmenu:server:giveCar', nearPlayerId, plate)
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:give',
        title = Strings.menu_veh_give,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:vehicle'
    })

    lib.showContext('zrx_personalmenu:personal_menu:give')
end

OpenVehicleExtrasMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    elseif not Config.CanOpenExtras() then
        Config.Notification(nil, Strings.extra_cannot)
        return OpenVehicleMenu()
    end

    local MENU = {}

    for i = 0, 20 do
        MENU[#MENU + 1] = {
            title = (Strings.extra_title2):format(i, IsVehicleExtraTurnedOn(cache.vehicle, i) and Strings.on or Strings.off),
            description = Strings.extra_desc2,
            arrow = false,
            icon = 'fa-solid fa-car',
            iconColor = Config.IconColor,
            disabled = not DoesExtraExist(cache.vehicle, i),
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

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:vehicle:extras',
        title = Strings.menu_veh_extra,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:vehicle'
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:extras')
end

OpenVehicleLiveryMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    for i = 0, GetVehicleLiveryCount(cache.vehicle) do
        MENU[#MENU + 1] = {
            title = (Strings.livery_title2):format(i),
            description = Strings.livery_desc2,
            arrow = false,
            icon = 'fa-solid fa-car',
            iconColor = Config.IconColor,
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
        menu = 'zrx_personalmenu:personal_menu:vehicle'
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:livery')
end

local DATA_LIGHTS = {
    interior = true,
    exterior = true,
    neon = true
}
OpenVehicleLightsMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title =  Strings.lights_int_title,
        description = Strings.lights_int_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        menu = 'zrx_personalmenu:personal_menu:vehicle'
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:lights')
end

local DATA_WINDOWS = {
    front_left = false,
    front_right = false,
    back_left = false,
    back_right = false
}
OpenVehicleWindowMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.left_front_win_title,
        description = Strings.left_front_win_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        menu = 'zrx_personalmenu:personal_menu:vehicle'
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:windows')
end

local DATA_DOORS = {
    front_left = false,
    front_right = false,
    back_left = false,
    back_right = false,
    hood = false,
    trunk = false
}
OpenVehicleDoorsMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.left_front_door_title,
        description = Strings.left_front_door_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
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
        menu = 'zrx_personalmenu:personal_menu:vehicle'
    })

    lib.showContext('zrx_personalmenu:personal_menu:vehicle:doors')
end

local DATA_SETTINGS = {
    graphic = false,
    booster = false
}
OpenSettingMenu = function()
    local MENU = {}
    local settingsFile, lines, setting

    MENU[#MENU + 1] = {
        title = Strings.graphic_title,
        description = Strings.graphic_desc,
        arrow = false,
        icon = 'fa-solid fa-brush',
        iconColor = Config.IconColor,
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
        icon = 'fa-solid fa-rocket',
        iconColor = Config.IconColor,
        onSelect = function()
            OnBooster(not DATA_SETTINGS.booster)
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:setting',
        title = Strings.menu_setting,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:setting')
end

OpenBillMenu = function()
    local MENU = {}
    local PLAYER_BILLS = lib.callback.await('zrx_personalmenu:server:getPlayerBills', 500)

    if COOLDOWN then
        Config.Notification(nil, Strings.on_cooldown)
        return OpenMainMenu()
    end
    StartCooldown()

    if #PLAYER_BILLS > 0 then
        for k, data in pairs(PLAYER_BILLS) do
            MENU[#MENU + 1] = {
                title = (Strings.bill_title):format(k --[[data.id DATABASE ID]]),
                description = Strings.bill_desc,
                arrow = false,
                icon = 'fa-solid fa-money-bill',
                iconColor = Config.IconColor,
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
    else
        MENU[#MENU + 1] = {
            title = Strings.bill_no,
            description = Strings.bill_no_desc,
            arrow = false,
            icon = 'fa-solid fa-xmark',
            iconColor = Config.IconColor,
        }
    end

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:bills',
        title = Strings.menu_bills,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:bills')
end

OpenCompanyMenu = function()
    local MENU = {}
    local DATA_SOCIETY = lib.callback.await('zrx_personalmenu:server:getSocietyData', 500, ESX.PlayerData.job.name)
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    if COOLDOWN then
        Config.Notification(nil, Strings.on_cooldown)
        return OpenMainMenu()
    elseif not IsGradeAllowed() then
        return OpenMainMenu()
    end
    StartCooldown()

    MENU[#MENU + 1] = {
        title = Strings.company_money_title,
        description = (Strings.company_money_desc):format(ESX.Math.GroupDigits(DATA_SOCIETY.money)),
        arrow = false,
        icon = 'fa-solid fa-credit-card',
        iconColor = Config.IconColor,
    }

    MENU[#MENU + 1] = {
        title = Strings.company_hire_title,
        description = Strings.company_hire_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'hire')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_fire_title,
        description = Strings.company_fire_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'fire')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_promote_title,
        description = Strings.company_promote_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'promote')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_derank_title,
        description = Strings.company_derank_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'derank')
        end
    }

    lib.registerContext({
        id = 'zrx_personalmenu:personal_menu:company',
        title = Strings.menu_company,
        options = MENU,
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:company')
end

OpenNavigationMenu = function()
    local MENU = {}

    for k, data in pairs(Config.Navigation.destinations) do
        MENU[#MENU + 1] = {
            title = data.label,
            description = Strings.navi_desc2,
            arrow = false,
            icon = data.icon or 'fa-solid fa-location-dot',
            iconColor = Config.IconColor,
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
        menu = 'zrx_personalmenu:personal_menu:main'
    })

    lib.showContext('zrx_personalmenu:personal_menu:navigation')
end

OnBooster = function(state)
    DATA_SETTINGS.booster = state

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
    if not Config.Cooldown then return end
    COOLDOWN = true

    CreateThread(function()
        SetTimeout(Config.Cooldown * 1000, function()
            COOLDOWN = false
        end)
    end)
end

IsGradeAllowed = function()
    return not not Config.Company.allowedGrades[ESX.PlayerData.job.grade_name]
end

IsVehicleValid = function()
    return not not (DoesEntityExist(cache.vehicle) and GetPedInVehicleSeat(cache.vehicle, -1) == cache.ped)
end

PlayAnimation = function(dict, anim, duration)
    lib.requestAnimDict(dict, 500)
    TaskPlayAnim(cache.ped, dict, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
    Wait(duration)
    ClearPedTasks(cache.ped)
end

ChangeComponent = function(action, type, drawable, texture, skipAnim)
    if action == 'set' then
        DATA_CLOTHING[type] = {
            name = type,
            drawable = GetPedDrawableVariation(cache.ped, CLOTHE_DATA.ComponentId[type]),
            texture = GetPedTextureVariation(cache.ped, CLOTHE_DATA.ComponentId[type]),
            state = true
        }

        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type].duration)
        end

        SetPedComponentVariation(cache.ped, CLOTHE_DATA.ComponentId[type], drawable, texture, 2)
    elseif action == 'reset' then
        if not DATA_CLOTHING[type]?.drawable or not DATA_CLOTHING[type]?.texture then return end
        if DATA_CLOTHING[type]?.drawable == -1 or DATA_CLOTHING[type]?.texture == -1 then return end
        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type].duration)
        end

        SetPedComponentVariation(cache.ped, CLOTHE_DATA.ComponentId[type], DATA_CLOTHING[type].drawable, DATA_CLOTHING[type].texture, 2)

        DATA_CLOTHING[type] = {
            name = type,
            drawable = -1,
            texture = -1,
            state = false
        }
    end
end

ChangeProp = function(action, type, drawable, texture, skipAnim)
    if action == 'set' then
        DATA_CLOTHING[type] = {
            name = type,
            drawable = GetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            texture = GetPedPropTextureIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            state = true
        }

        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type]?.on?.dict or CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type]?.on?.anim or CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type]?.on?.duration or CLOTHE_DATA.Set[type].duration)
        end

        SetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type], drawable, texture, true)
    elseif action == 'remove' then
        DATA_CLOTHING[type] = {
            name = type,
            drawable = GetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            texture = GetPedPropTextureIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            state = true
        }

        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type]?.off?.dict or CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type]?.off?.anim or CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type]?.off?.duration or CLOTHE_DATA.Set[type].duration)
        end

        ClearPedProp(cache.ped, CLOTHE_DATA.PropId[type])
    elseif action == 'reset' then
        if not DATA_CLOTHING[type]?.drawable or not DATA_CLOTHING[type]?.texture then return end
        if DATA_CLOTHING[type]?.drawable == -1 or DATA_CLOTHING[type]?.texture == -1 then return end
        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type]?.on?.dict or CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type]?.on?.anim or CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type]?.on?.duration or CLOTHE_DATA.Set[type].duration)
        end

        SetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type], DATA_CLOTHING[type].drawable, DATA_CLOTHING[type].texture, true)

        DATA_CLOTHING[type] = {
            name = type,
            drawable = -1,
            texture = -1,
            state = false
        }
    end
end