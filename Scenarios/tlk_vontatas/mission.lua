-- SimRail - The Railway Simulator
-- LUA Scripting scenario
-- Version: 1.0
--
require("SimRailCore")

DeveloperMode = function()
    return true
end

-- Kötelező alapbeállítások
StartPosition = { -8702.15, 295.39, -1841.03 }
Trains = {}
AiTrains = {}
Sounds = {}
Dragon = {}
ScenarioStep = "0"


function PrepareScenario()
    DisplayMessage("Intro",40)
end

-- Korai Beállítások
function EarlyScenarioStart()
    SetDateTime(DateTimeCreate(2017, 05, 15, 20, 48, 46))
end

-- Játék kezdete
function StartScenario()
    -- Ide jöhet minden ami a játék alatt történik
    StartRecorder()
    -- FindSignal("StB_N1")KMStaszic
    -- FindSignal("Sk_M")Janów - Dandowka
    -- FindSignal("SDn_Sz1N")Dandowka bejárat
    -- FindSignal("DZ_Z")Hutakatowice

    -- Játékos szerelvénye
    Trains[0] = SpawnTrainsetOnSignal("Traxx", FindSignal("StB_N1"), 30, false, true, false, true, {
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_134, false),
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
        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false)
    })
    Trains[0].SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
    Trains[0].SetRadioChannel(3, true)

    AiTrains[0] = SpawnTrainsetOnSignalAsync("Dragon", FindSignal("StB_Tm25"), 16, false, false, true,{
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.E6ACTadb_027, false)
    },function(trainset)
        AiTrains[0] = trainset
        trainset.SetState(DynamicState.dsStop, TrainsetState.tsActivation, true)
        Teher(trainset)
    end)

    CreateTrackTrigger(FindTrack("t511"), 151, 1, 
    {
    	check = function(trainset)
    		return true
    	end,
    	result = function(trainset)
        DespawnTrainset(AiTrains[0])
    	end
    })

    CreateTrackTrigger(FindTrack("t476"), 27, 1, -- KMStaszic Kijárat
    {
        check = function(trainset)
            return true
        end,
        result = function(trainset)
            DisplayMessage("hatar", 5)
            ScenarioStep = "hatar"
        end
    })

    CreateSignalTrigger(FindSignal("Sk_M"), 200, -- Stawiska Kijárat
        {
            check = UnconditialCheck,
            result = function(trainset)
                Dragon[0] = SpawnTrainsetOnSignalAsync("dragon-teher", FindSignal("Sk_D"), 16, false, false, true,
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
                        CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false)
                    }, function(trainset)
                        Dragon[0] = trainset
                        VDSetRoute("Sk_D", "Sk_Ekps", VDOrderType.TrainRoute) -- Dandowka felől Janow Bejáratig
                        trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                    end)
                return true
            end
        })

        CreateSignalTrigger(FindSignal("KJw_W"), 1162, 
        {
            check = function (trainset)
                return true
            end,
            result = function(trainset)
                DisplayChatText("stawiska")
                VDSetRoute("Sk_M", "Sk_Dbl", VDOrderType.TrainRoute) -- Janow Kijárat Dandowkara
            end
        })
        
        CreateSignalTrigger(FindSignal("KJw_W"), 300, 
    {
	check = function (trainset)
		return true
	end,
	result = function(trainset)
        DespawnTrainset(Teher[0])
	end
    })



    CreateTrackTrigger(FindTrack("t6510"), 1, -1, -- Dandowka Kijárat X Tolatás
    {
        check = function(trainset)
            return true
        end,
        result = function(trainset)
            CreateCoroutine(function()
                DisplayMessage("ack", 5)
                coroutine.yield(CoroutineYields.WaitForSeconds, 5)
                DisplayChatText("")
                AiTrains[1] = SpawnTrainsetOnSignalAsync("Also vonali szemely", FindSignal("SDn_A"), 1300, false, false,
                    true, {
                        CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN96_001, false)
                    }, function(trainset)
                        AiTrains[1] = trainset
                        VDSetRoute("SDn_A", "SDn_N", VDOrderType.TrainRoute) -- Dandowka bejárat Ai szemely
                        trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                    end)
            end)
        end
    })

    CreateSignalTrigger(FindSignal("SDn1_J"), 46, 
    {
        check = function (trainset)
            return true
        end,
        result = function(trainset)
            ScenarioStep="dandowkatolatas"
        end
    })
    CreateSignalTrigger(FindSignal("SDn1_Tm2"), 25, 
{
	check = function (trainset)
		return true
	end,
	result = function(trainset)
        ScenarioStep = "tolatas_szemelyre"
	end
})

    CreateTrackTrigger(FindTrack("t349"), 1, 1, --Dandowka atjaro
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
                ScenarioStep = "dandowka"
            end)
        end
    })
    
    CreateSignalTrigger(FindSignal("SDn_N"), 71, --also vonali szemely despawn
    {
	check = function (trainset)
		return true
	end,
	result = function(trainset)
        CreateCoroutine(function ()
            DespawnTrainset(AiTrains[1])
        end)
	end
    })

end

function OnTrainsetsSplit(oldTrainset, newTrainset)
    Log("szetcsatlas")
    if (ScenarioStep == "Start") then
        ScenarioStep = "gepmenet"
    end
end

function OnTrainsetsJoined(builtTrainset, destroyedTrainset)
    Log("csatlas")
    DisplayMessage("help", 40)
    ScenarioStep = "csatlas"
end

function OnVirtualDispatcherReady()

    ScenarioStep = "Start"

    Teher(AiTrains[0]) --Dragon elindul

        if (ScenarioStep == "Start") then
            DisplayMessage("IntroStart", 15)
        end

        CreateTrackTrigger(FindTrack("t563"), 15, -1, -- Csonkavágány
    {
    	check = function(trainset)
    		return true
    	end,
    	result = function(trainset)
            ScenarioStep = "csonka"
            Log("CsonkaHatár")
            DisplayMessage("hatar", 5)
    	end
    })

    CreateTrackTrigger(FindTrack("t710"), 75, 1, 
    {
	check = function(trainset)
		return true
	end,
	result = function(trainset)
	
	end
    })

    CreateTrackTrigger(FindTrack("t28309"), 105, 1, 
    {
	check = function(trainset)
		return true
	end,
	result = function(trainset)
        SetWeather(WeatherConditionCode.LightRain, 25, 1000, 30, 3983, 180, 30, 10, false)
        VDSetRoute("Dra_E", "Dra_Kkps", VDOrderType.TrainRoute) -- Dorota -> Południowa
        VDSetRoute("DP1_K", "DP_C", VDOrderType.TrainRoute) -- Południowa Bejárat
        VDSetRoute("DP_C", "DP_Lkps", VDOrderType.TrainRoute) -- Południowa Kijárat 
        VDSetRoute("DGHK_L", "DGHK_Hkps", VDOrderType.TrainRoute) -- Huta Katowice Bejárat
        VDSetRoute("DZ_Z", "DZ_S102", VDOrderType.TrainRoute)
	end
    })
    
    CreateTrackTrigger(FindTrack("t807"), 22, 1, 
    {
        check = function(trainset)
            return true
        end,
        result = function(trainset)
            SetWeather(WeatherConditionCode.BrokenClouds, 25, 1000, 30, 10000, 180, 30, 10, false)
        end
    })
    CreateTrackTrigger(FindTrack("t10117"), 3, 1, 
    {
        check = function(trainset)
            return true
        end,
        result = function(trainset)
        DisplayChatText("hutakatowice")
        end
    })

    CreateTrackTrigger(FindTrack("t28926"), 146, 1, --AI_IC
    {
	check = function(trainset)
		return true
	end,
	result = function(trainset)
	    AiTrains[4] = SpawnTrainsetOnSignalAsync("ai_ic",FindSignal("DZ_X"), 500, false, false, true, {
            CreateNewSpawnVehicleDescriptor(LocomotiveNames.ED250_018, false)
        },function (trainset)
            AiTrains[4] = trainset
            trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            VDSetRoute("DZ_X", "DZ_K", VDOrderType.TrainRoute)
            VDSetRoute("DZ_K", "DZ_C12", VDOrderType.TrainRoute)
        end)

        AiTrains[5] = SpawnTrainsetOnSignalAsync("szembe_teher",FindSignal("DZ_N4"), 16, false, false, true, {
            CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_929, false),
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
        },function (trainset)
            AiTrains[5] = trainset
            trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
        end)

        AiTrains[6] = SpawnTrainsetOnSignalAsync("szembe_ec", FindSignal("DZ_O"), 25, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EP08_013, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10ou_5051_2000_608_3, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.A9ou_5051_1908_136_0, false)
            },function(trainset)
            AiTrains[6] = trainset
            trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
        end)
	end
    })

    CreateSignalTrigger(FindSignal("DZ_K"), 8, 
    {
	check = function (trainset)
		return true
	end,
	result = function(trainset)
        CreateCoroutine(function ()
            VDSetRoute("DZ_O", "DZ_U101", VDOrderType.TrainRoute)
            coroutine.yield(CoroutineYields.WaitForSeconds, 10)
            VDSetRoute("DZ_S102", "DZ_L1", VDOrderType.TrainRoute) -- DGZabkowice Bejárat
            VDSetRoute("DZ_L1", "DZ_D", VDOrderType.TrainRoute) -- DGZabkowice Kijárat
            VDSetRoute("DZ_D", "DZ_E2kps", VDOrderType.TrainRoute) -- LazyŁc Bejárat
            VDSetRoute("LC_W2", "LC_S2kps", VDOrderType.TrainRoute) -- Lazy Bejárat
            VDSetRoute("LB_P2", "LB_R2", VDOrderType.TrainRoute) -- Lazy Kijárat
            VDSetRoute("LB_R2", "LB_G2kps", VDOrderType.TrainRoute) -- LazyŁb Bejárat
            VDSetRouteWithVariant("LA_E2", "LA_C2kps", VDOrderType.TrainRoute, {
            GetMidPointVariant("z_LA_49", false),
            GetMidPointVariant("z_LA_47", false),
            GetMidPointVariant("z_LA_35", false),
            GetMidPointVariant("z_LA_34", false),
            GetMidPointVariant("z_LA_6", false)})
        end)
    VDSetRoute("Zw_N", "Zw_E1", VDOrderType.TrainRoute) -- Zawierce platform
	end
    })

    CreateSignalTrigger(FindSignal("DZ_C12"), 20, 
    {
	check = function (trainset)
		return true
	end,
	result = function(trainset)
        DespawnTrainset(AiTrains[4])
	end
    })

    CreateSignalTrigger(FindSignal("DZ_U101"), 20, 
    {
	check = function (trainset)
		return true
	end,
	result = function(trainset)
        DespawnTrainset(AiTrains[6])
	end
    })

    CreateTrackTrigger(FindTrack("t25662"), 76, 1, 
    {
	check = function(trainset)
		return true
	end,
	result = function(trainset)
        AiTrains[7] = SpawnTrainsetOnSignalAsync("szembe_szemely", FindSignal("LB_H1"), 500, false, false, true,{
            CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN76_022, false),
            CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN76_006, false)
        }, function ()
            VDSetRoute("LB_H1", "LB_P1kps", VDOrderType.TrainRoute)
            VDSetRoute("LC_S1", "LC_W1kps", VDOrderType.TrainRoute)
        end)
	end
    })

    CreateSignalTrigger(FindSignal("LC_S1"), 900, 
    {
    	check = function (trainset)
    		return true
    	end,
    	result = function(trainset)
            DespawnTrainset(AiTrains[5])
            DespawnTrainset(AiTrains[7])
    	end
    })

    

    CreateTrackTrigger(FindTrack("t11990"), 41, -1, 
    {
        check = function(trainset)
            return true
        end,
        result = function(trainset)
            ScenarioStep = "zaw"
        end
    })
    
    CreateTrackTrigger(FindTrack("t26460"), 15, 1, 
    {
        check = function(trainset)
            return true
        end,
        result = function(trainset)
        FinishMission(MissionResultEnum.Success)
        end
    })
    
end --VDReady

function OnPlayerRadioCall(trainsetInfo, radio_SelectionCall)
    -- Rádió hívások
    Log("Call pressed in " .. trainsetInfo.name .. ". Call type: " .. tostring(radio_SelectionCall))
    if (ScenarioStep == "gepmenet") then
        if (RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 3) then
            Csonkara()
        end
    end
    if (ScenarioStep == "csonka") then
        if (RailstockGetPlayerTrainset().GetCurrentlyUsedChannel() == 3) then
            CreateCoroutine(function ()
                DisplayMessage("piheno", 5)
                coroutine.yield(CoroutineYields.WaitForSeconds, 6)
                ScenarioStep = "ebreszto"
                Ebreszto(Trains[0])
                SpawnTrainsetOnSignalAsync(AiTrains[2],FindSignal("StA_E"), 16, false, false, false, {
                    CreateNewSpawnVehicleDescriptor(LocomotiveNames.E6ACTadb_027, false),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S),
                    CreateNewSpawnFullVehicleDescriptor(FreightLoads_412W_v4.Coal, false, FreightLoads_412W_v4.Coal, 90000, BrakeRegime.S)
                },function (trainset)
                    AiTrains[2] = trainset
                    trainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
                end)
            end)
        end
    end
    if (ScenarioStep == "ebreszto") then
        DisplayChatText("ebresztook")
        ScenarioStep = "ebren"
        Ebreszto(Trains[0])
    end
    if (ScenarioStep == "hatar") then
        CreateCoroutine(function ()
            DisplayChatText("staszicszemely")
            coroutine.yield(CoroutineYields.WaitForSeconds, 6)
            DisplayChatText("staszicdiszpecser")
            coroutine.yield(CoroutineYields.WaitForSeconds, 2)
            VDSetRoute("StA_F", "StA_Akps", VDOrderType.TrainRoute)   --KMStaszic Kijárat
            VDSetRoute("Ssc_D", "Ssc_Bkps", VDOrderType.TrainRoute)   -- Staszic Kijárat
            VDSetRoute("KMB_Y25", "KMB_Mkps", VDOrderType.TrainRoute)
            VDSetRoute("KJw_H", "KJw_Akps", VDOrderType.TrainRoute)
            Trains[0].SetTimetable(LoadTimetableFromFile("staszicrol.xml"), false)
            ScenarioStep="alapjarat" --N
        end)
    end
    if (ScenarioStep == "dandowka") then --Dandowka bejarat
        CreateCoroutine(function ()
            DisplayChatText("dandowka")
            ScenarioStep = "alapjarat" --N
            coroutine.yield(CoroutineYields.WaitForSeconds, 7)
            VDSetSwitchPosition("z_sdn_46", false)
            VDSetSwitchPosition("z_sdn_45", false)
            VDSetSwitchPosition("z_sdn_44", false)
            AllowPassingStopSignal("SDn_Sz1N",function ()
                return true
                end)
            DisplayChatText("dandowkaack")
            
        end)
    end
    if (ScenarioStep == "dandowkatolatas") then --Dandowka tolatas
        CreateCoroutine(function ()
            DisplayChatText("dandowkatolatas")
            DisplayMessage("tolatas", 10)
            coroutine.yield(CoroutineYields.WaitForSeconds, 4)
            VDSetRoute("SDn1_J", "SDn1_Tm2", VDOrderType.ManeuverRoute)
            DisplayChatText("dandowkatolatasack")
            ScenarioStep = "alapjarat" --N
        end)
    end
    if (ScenarioStep == "tolatas_szemelyre") then --Dandowka tolatas szemelyre
        CreateCoroutine(function ()
            DisplayChatText("tolatasok")
            VDSetSwitchPosition("z_sdn1_8", true)
            VDSetSwitchPosition("z_sdn1_11", true)
            coroutine.yield(CoroutineYields.WaitForSeconds, 2)
            DisplayChatText("tolatasack")
            ScenarioStep = "alapjarat" --N
        end)
    end
    if (ScenarioStep == "csatlas") then --Dandowka -> Dorota
        CreateCoroutine(function ()
            DisplayChatText("szemelyok")
            coroutine.yield(CoroutineYields.WaitForSeconds, 6)
            VDSetRoute("SDN1_F", "SDn_Ckps", VDOrderType.TrainRoute) --Dandowka Kijárat
            VDSetRoute("Ju_G", "Ju_Bkps", VDOrderType.TrainRoute) -- Juliusz -> Dorota
            DisplayChatText("szemelyack")
            ScenarioStep = "alapjarat" --N
        end)
    end
    if (ScenarioStep == "zaw") then
        CreateCoroutine(function ()
            DisplayChatText("zaw")
            coroutine.yield(CoroutineYields.WaitForSeconds, 6)
            VDSetRoute("Zw_E1", "t26460k", VDOrderType.ManeuverRoute)
            DisplayChatText("zawack")
        end)
    end
end

function UnconditialCheck(e)
    return true
end

function Teher(trainset)
    if (ScenarioStep == "Start")then
        CreateCoroutine(function ()
            AiTrains[0] = trainset
            DisplayChatText("dragondiszpecser")
            coroutine.yield(CoroutineYields.WaitForVDRouteAccepted, VDSetRoute("StB_Tm25", "StA_G", VDOrderType.ManeuverRoute))
            DisplayChatText("dragonszemelyzet")
            trainset.SetState(DynamicState.dsAccSlow, TrainsetState.tsTrain, true)
            coroutine.yield(CoroutineYields.WaitForSeconds, 5)
            trainset.SetState(DynamicState.dsAccSlow, TrainsetState.tsShunting, true)
        end)
    end
end

function Csonkara()
    CreateCoroutine(function ()
        DisplayChatText("szetcsatlas")
        coroutine.yield(CoroutineYields.WaitForVDRouteAccepted, VDSetRoute("StB_N1", "t1574k", VDOrderType.ManeuverRoute))
        DisplayChatText("szetcsatlasok")
        DisplayMessage("tolatas", 5)
        coroutine.yield(CoroutineYields.WaitForSeconds, 2)
        DisplayChatText("szetcsatlaskezd")
    end)
end

function Ebreszto(trainset)
    if (ScenarioStep == "ebreszto") then
        CreateCoroutine(function ()
            SetDateTime(DateTimeCreate(2017, 05, 16, 5, 28, 0))
            coroutine.yield(CoroutineYields.WaitForSeconds, 3)
            DisplayChatText("ebreszto")
        end)
    end
    if (ScenarioStep == "ebren") then
        DisplayChatText("tartalek")
        VDSetRoute("StB_Tm26", "StA_F", VDOrderType.ManeuverRoute) --Csonkáról F-re
    end
end
