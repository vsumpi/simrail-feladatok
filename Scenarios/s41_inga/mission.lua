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
ScenarioStep = "0"


function PrepareScenario()
    DisplayMessage("Intro",40)
end

-- Korai Beállítások
function EarlyScenarioStart()
    SetDateTime(DateTimeCreate(2024, 04, 20, 04, 00, 00))
end

-- Játék kezdete
function StartScenario()
    -- Ide jöhet minden ami a játék alatt történik
    StartRecorder()

    Trains[0] = SpawnTrainsetOnSignal("Traxx", FindSignal("DZ_Z"), 30, false, true, false, true, {
    })
end

function OnTrainsetsSplit(oldTrainset, newTrainset)

end

function OnTrainsetsJoined(builtTrainset, destroyedTrainset)

end

function OnVirtualDispatcherReady()

end

function OnPlayerRadioCall(trainsetInfo, radio_SelectionCall)

end
