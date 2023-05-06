env.info("Loading CSAR Mission")

local mycsar = CSAR:New(coalition.side.BLUE, "DownedPilot")
mycsar.verbose = 2
mycsar.immortalcrew = true
mycsar.invisiblecrew = false
mycsar.allowFARPRescue = true
mycsar.autosmoke = true
mycsar.autosmokedistance = 2000
mycsar.smokecolor = 4 -- Color of smokemarker, 0 is green, 1 is red, 2 is white, 3 is orange and 4 is blue.
mycsar.csarOncrash = true
mycsar.enableForAI = true
mycsar.pilotRuntoExtractPoint = true -- Downed pilot will run to the rescue helicopter up to mycsar.extractDistance in meters. 
mycsar.extractDistance = 500 -- Distance the downed pilot will start to run to the rescue helicopter.
mycsar.immortalcrew = true -- Set to true to make wounded crew immortal.
mycsar.loadDistance = 50 -- configure distance for pilots to get into helicopter in meters.
mycsar.max_units = 6 -- max number of pilots that can be carried if #CSAR.AircraftType is undefined.
mycsar.messageTime = 20 -- Time to show messages for in seconds. Doubled for long messages.
mycsar.radioSound = "beacon.ogg" -- the name of the sound file to use for the pilots\' radio beacons. 
mycsar.useprefix = false  -- Requires CSAR helicopter #GROUP names to have the prefix(es) defined below.
mycsar.verbose = 0 -- set to > 1 for stats output for debugging.
-- limit amount of downed pilots spawned by **ejection** events
mycsar.limitmaxdownedpilots = true
mycsar.maxdownedpilots = 3 
-- allow to set far/near distance for approach and optionally pilot must open doors
mycsar.approachdist_far = 5000 -- switch do 10 sec interval approach mode, meters
mycsar.approachdist_near = 3000 -- switch to 5 sec interval approach mode, meters
mycsar.pilotmustopendoors = true -- switch to true to enable check of open doors
mycsar.suppressmessages = false -- switch off all messaging if you want to do your own
mycsar.rescuehoverheight = 20 -- max height for a hovering rescue in meters
mycsar.rescuehoverdistance = 10 -- max distance for a hovering rescue in meters
-- Country codes for spawned pilots
mycsar.countryblue= country.id.USA
mycsar.countryred = country.id.RUSSIA
mycsar.countryneutral = country.id.UN_PEACEKEEPERS
mycsar.topmenuname = "CSAR" -- set the menu entry name
mycsar.ADFRadioPwr = 1000 -- ADF Beacons sending with 1KW as default
mycsar.PilotWeight = 80 --  Loaded pilots weigh 80kgs each
mycsar.frequency = 35
mycsar.modulation = radio.modulation.FM


mycsar.SRSPath = "C:\\Progra~1\\DCS-SimpleRadio-Standalone\\" -- adjust your own path in your SRS installation -- server(!)
mycsar.SRSchannel = 300 -- radio channel
mycsar.SRSModulation = radio.modulation.AM -- modulation
mycsar.SRSport = 5002  -- and SRS Server port
mycsar.SRSCulture = "en-GB" -- SRS voice culture

local zoneNumber = math.random(1, 4)

mycsar:SpawnCSARAtZone("CSAR_"..1, coalition.side.BLUE, "Rescue the pilot", true)

mycsar:Start()

env.info("CSAR Loaded Successfully!", false)
