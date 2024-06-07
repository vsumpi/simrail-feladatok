-- SimRail - The Railway Simulator
-- LUA Scripting scenario
-- Version: 1.0
--
require("SimRailCore")

DeveloperMode = function()
    return true
end

StartPosition = { -8702.15, 295.39, -1841.03 }
Trains = {}
AiTrains = {}
Sounds = {}
ScenarioStep = "0"

function PrepareScenario()
    DisplayMessage(
        "Most hoztad vissza az üres szenes kocsikat a bányához. A pihenőidődet a csonka vágányon fogod tölteni. Szállj le és csatold le az üres szenes kocsikat!",
        40)
end

function EarlyScenarioStart()
    SetDateTime(DateTimeCreate(2017, 05, 15, 20, 48, 46))
end

function StartScenario()
    StartRecorder()
    -- FindSignal("StB_N1")KMStaszic
    -- FindSignal("Sk_E")Janów - Dandowka
    Trains[0] = SpawnTrainsetOnSignal("Player", FindSignal("SDn_Z"), 550, false, true, false, true, {
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_134, false) --[[,
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false)
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false)]]
    })
    Trains[0].SetState(DynamicState.dsStop, TrainsetState.tsShunting, true) --aktivált kabin
    Trains[0].SetRadioChannel(3, true)
    ScenarioStep = "Start"
end

function OnVirtualDispatcherReady()
    Log("VD: OK")
    CreateCoroutine(function()
        Log("coroutine OK")
        Log(ScenarioStep)
        ScenarioStep = "szetcsatlas"
        Log(ScenarioStep)
        coroutine.yield(CoroutineYields.WaitForSeconds, 10)
        Log("Hívhatod")
        DisplayMessage("Hívd a diszpécsert (ZEW3)", 10)
    end)
    CreateTrackTrigger(FindTrack("t476"), 27, 1, -- KMStaszic Kijárat
        {
            check = function(trainset)
                DisplayMessage("Ellenőrizd még egyszer a gépet és válts normál vezetés módba. Hívd a diszpécsert.", 10)
                return true
            end,
            result = function(trainset)

            end
        })

    CreateTrackTrigger(FindTrack("t5518"), 1, 1, -- Stawiska Kijárat
        {
            check = UnconditialCheck,
            result = function(trainset)
                DisplayChatText("[Stawiska]: 443210 Tehernek szabad az elsőn")
                SpawnTrainsetOnSignalAsync("dragon-teher", FindSignal("Sk_D"), 16, false, false, true,
                    {
                        CreateNewSpawnVehicleDescriptor(LocomotiveNames.E6ACTadb_027, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3151_5351_989_9, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false)
                    }, function(trainset)
                        AiTrains[1] = trainset
                        VDSetRoute("Sk_D", "Sk_Mkps", VDOrderType.TrainRoute) -- Dandowka felől Janow Bejáratig
                        trainset.SetState(DynamicState.dsAccSlow, TrainsetState.tsTrain, true)
                    end)
                return true
            end
        })

    CreateTrackTrigger(FindTrack("t5490"), 3, 1,
        {
            check = UnconditialCheck,
            result = function(trainset)
                Log("Teher áthaladt")
            end
        })


    CreateTrackTrigger(FindTrack("t7843"), 21,-1, -- Dragon Teher X Player
        {
            check = UnconditialCheck,
            result = function(trainset)
                Log("Despawn")
                DespawnTrainset(AiTrains[1])
                Log("Kijárat")
                DisplayChatText("EP07_135 gépnek Dandowka-ig szabad az út. Esemény mentest!")
                VDSetRoute("Sk_E", "Sk_Xkps", VDOrderType.TrainRoute) -- Janow Kijárat Dandowkara
                VDSetRoute("SDn_Z", "SDn1_H", VDOrderType.TrainRoute) -- Dandowka Bejárat
            end
        })
    CreateTrackTrigger(FindTrack("t27818"), 22, 1, --Dandowka atjaro
        {
            check = UnconditialCheck,
            result = function(trainset)
                Log("lerobbant ec spawn")
                SpawnTrainsetOnSignalAsync("lerobbant-ec", FindSignal("SDN1_F"), 302, false, false, false, {
                    CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_241, false),
                    CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false),
                    CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false),
                    CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false),
                    CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false)
                },function(trainset)
                    AiTrains[3] = trainset
                    trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                end)
            end
        })
        

    CreateTrackTrigger(FindTrack("t6509"), 14, -1, -- Dandowka Kijárat X Tolatás
        {
            check = function(trainset)
                CreateCoroutine(function()
                    coroutine.yield(CoroutineYields.WaitForSeconds, 5)
                    DisplayChatText("[Dandowka]: ")
                    AiTrains[1] = SpawnTrainsetOnSignalAsync("Also vonali szemely", FindSignal("SDn_A"), 500, false, false,
                        true, {
                            CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN96_001, false)
                        }, function(trainset)
                            AiTrains[1] = trainset
                            VDSetRoute("SDn_A", "SDn_N", VDOrderType.TrainRoute) -- Dandowka bejárat Ai szemely
                            trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                        end)
                        VDSetSwitchPosition("z_sdn1_17", true)
                        VDSetSwitchPosition("z_sdn1_12", true)
                        VDSetSwitchPosition("z_sdn1_8", false)
                        VDSetSwitchPosition("z_sdn1_6", true)
                        VDSetSubstituteSignal("SDn1_H", false)
                        VDSetManualSignalLightsState("SDn1_H", SignalLightType.White1, LuaSignalLightState.Flashing)
                end)
                return true
            end,
            result = function(trainset)

            end
        })

CreateTrackTrigger(FindTrack("t1047"), 50, -1, --Dandowka tolatas szemelyre
{
	check = function(trainset)
        DisplayMessage("Állj meg készülj fel a tolatásra!")
        VDSetRoute("SDn1_Tm1", "SDn_R", VDOrderType.ManeuverRoute)
        VDSetManualSignalLightsState("SDn1_H", SignalLightType.White1, LuaSignalLightState.Default)
		return true
	end,
	result = function(trainset)
	
	end
})


end

function OnVirtualDispatcherResponseReceived(ordered_id, status)
    if (status == VDReponseCode.Error or status == VDReponseCode.Undefined) then
        Log("VD response to order ID " .. ordered_id .. " => " .. status)
    end
end

function OnPlayerRadioCall(trainsetInfo, radio_SelectionCall)
    Log("Call pressed in " .. trainsetInfo.name .. ". Call type: " .. tostring(radio_SelectionCall))
    --Log(RailstockGetPlayerTrainset().GetCurrentlyUsedChannel())
    --Log("kurva")
    if (ScenarioStep == "szetcsatlas") then
        if (RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 3) then
            ScenarioStep = "csonkan"
            Log("Vétel")
            DisplayMessage("Teszt", 5)
            Log("Kihuzohoz")
            VDSetRoute("StB_N1", "t1574k", VDOrderType.ManeuverRoute) --J-ről csonkára
            DisplayMessage("Irány a csonkavágány!", 10)
            --Comms("Hello")
            return
        end
    end
    if (ScenarioStep == "csonkan") then
        if (RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 3) then
            ScenarioStep = "F"
            Log("Vétel")
            DisplayMessage("Jó pihit!", 5)
            SetDateTime(DateTimeCreate(2017, 05, 16, 4, 20, 0))
            Log("F-re")
            VDSetRoute("StB_Tm26", "StA_F", VDOrderType.ManeuverRoute) --Csonkáról F-re
            --Comms("Hello")
            return
        end
    end
    if (ScenarioStep == "F") then
        if (RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 3) then
            Log("F -> Janow Bejárat")
            VDSetRoute("StA_F", "StA_Akps", VDOrderType.TrainRoute)   --KMStaszic Kijárat
            VDSetRoute("Ssc_D", "Ssc_Bkps", VDOrderType.TrainRoute)   -- Staszic Kijárat
            VDSetRoute("KMB_Y25", "KMB_Lkps", VDOrderType.TrainRoute) -- Janów Bejárat
            VDSetRoute("KJw_Z", "KJw_Wkps", VDOrderType.TrainRoute)   -- Janów kijárat
            DisplayChatText("[KMStaszic]: Esemény mentest kollega, útengedély Janów-ig!")
            return
        end
    end
end

function UnconditialCheck(e)
    return true
end

-- BEÁLLÍTANDÓ
-- AITEHER ("DZ_N4"), 16
-- AISZEMELY SZEMBE ("DZ_O"), 16
VDSetRouteWithVariant("DZ_U101", "DZ_Ykps", VDOrderType.TrainRoute, {
	GetMidPointVariant("z_DZ_118", false),
	GetMidPointVariant("z_DZ_119", false),
	GetMidPointVariant("z_DZ_252", false)
})
-- 
-- VDSetRoute("DZ_S102", "DZ_L1", VDOrderType.TrainRoute) -- DGZabkowice Bejárat
-- 
-- VDSetRoute("DZ_D", "DZ_E2kps", VDOrderType.TrainRoute) -- LazyŁc Bejárat
-- VDSetRoute("LC_W2", "LC_S2kps", VDOrderType.TrainRoute) -- Lazy Bejárat
-- VDSetRoute("LB_P2", "LB_R2", VDOrderType.TrainRoute) -- Lazy Kijárat
-- VDSetRoute("LB_R2", "LB_G2kps", VDOrderType.TrainRoute) -- LazyŁb Bejárat
--[[VDSetRouteWithVariant("LA_E2", "LA_C2kps", VDOrderType.TrainRoute, {
	GetMidPointVariant("z_LA_49", false),
	GetMidPointVariant("z_LA_47", false),
	GetMidPointVariant("z_LA_35", false),
	GetMidPointVariant("z_LA_34", false),
	GetMidPointVariant("z_LA_6", false)
})]] -- LazyŁb kijárat
-- VDSetRoute("Zw_N", "Zw_E1", VDOrderType.TrainRoute) -- Zawierce platform
-- VDSetRoute("Zw_E1", "t26460k", VDOrderType.ManeuverRoute) -- Zawierce Tolatás

--AI VISSZA
--[[CreateTrackTrigger(FindTrack("t10251"), 130, 1, -- HutaKatowice Kijárat AI SPAWN
{
	check = function(trainset)
		return true
	end,
	result = function(trainset)
	
	end
})]]
-- VDSetRoute("DZ_O", "DZ_U101", VDOrderType.TrainRoute) -- AI DGZabkowice Kijárat
--[[VDSetRouteWithVariant("DZ_U101", "DZ_Ykps", VDOrderType.TrainRoute, {-- AI HutaKatowice Bejárat
	GetMidPointVariant("z_DZ_118", false),
	GetMidPointVariant("z_DZ_119", false),
	GetMidPointVariant("z_DZ_252", false)
})]]
--[[CreateSignalTrigger(FindSignal("DGHK_ToG"), 3, -- AI HutaKatowice Despawn
{
	check = function (trainset)
		return true
	end,
	result = function(trainset)
	end
})]]

--AI ELÉNK
--[[CreateSignalTrigger(FindSignal("DZ_X"), 250, -- AI DGZabkowice Bejárat
{
	check = function (trainset)
		return true
	end,
	result = function(trainset)
	end
})]]
-- VDSetRoute("DZ_X", "DZ_K", VDOrderType.TrainRoute) --DGZabkowice Bejárat
-- VDSetRoute("DZ_K", "DZ_C12", VDOrderType.TrainRoute) --DGZ
-- UA mint saját
-- VDSetRoute("Zw_N", "Zw_E2", VDOrderType.TrainRoute) -- Zawierce Bejárat
--[[VDSetRouteWithVariant("Zw_E2", "Zw_Akps", VDOrderType.TrainRoute, { -- Zawierce Kijárat
	GetMidPointVariant("z_zw_28", false),
	GetMidPointVariant("z_zw_12", false),
	GetMidPointVariant("z_zw_10", false),
	GetMidPointVariant("z_zw_7", false),
	GetMidPointVariant("z_zw_6", true),
	GetMidPointVariant("z_zw_4", true)
})]]

--[[CreateTrackTrigger(FindTrack("t11721"), 30, 1, -- AI Despawn
{
	check = function(trainset)
		return true
	end,
	result = function(trainset)
	
	end
})]]

--[[CreateSignalTrigger(FindSignal("KMB_M"), 87, -- AI Katowice Much KMB teher
{
	check = function (trainset)
		return true
	end,
	result = function(trainset)
	end
})
CreateTrackTrigger(FindTrack("t6100"), 20, 1, -- AI Katowice Much KMB teher despawn
{
	check = function(trainset)
		return true
	end,
	result = function(trainset)
	
	end
})
]]