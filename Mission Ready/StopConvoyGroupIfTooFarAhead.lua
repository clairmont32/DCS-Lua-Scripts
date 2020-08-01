 -- get the distance between 2 groups and stop group1 until group2 comes within a given distance
--assert(loadfile("C:\\Users\\matth\\Saved Games\\DCS.openbeta\\Missions\\Scripts\\My Missions\\Playground\\Scheduler.lua"))()

-- returns float of 2D distance between 2 groups
function GetGroupDistance(g1, g2)
BASE:F3("Group Distance")
grp1Coord = GROUP:FindByName(g1):GetCoordinate()
grp2Coord = GROUP:FindByName(g2):GetCoordinate()
dist = grp1Coord:Get2DDistance(grp2Coord)
return dist
end


function StopLeadIfTooFarAway(g1, g2, maxDist)
BASE:E("StopLead")
distBetweenGroups = GetGroupDistance(g1, g2)

blah = math.floor(distBetweenGroups)
env.info(blah, false)
 if blah >= maxDist then
-- Get lead APC group units

Sched = SCHEDULER:New(nil)
ScheduleIDStop = Sched:ScheduleOnce(2,StopMove,g1,1,0)

env.info("Lead convoy too far; holding", false)
  else
  env.info("Groups within range; starting convoy",false)
ScheduleIDStart = Sched:ScheduleOnce(2,StartMove,g1,1,0)
  end
end

function StopMove( g1 )
  BASE:E("Stop")
  stopGroup = GROUP:FindByName(g1)
  local Command = stopGroup:CommandStopRoute( true )
  stopGroup:SetCommand(Command)

end

--- @param Wrapper.Group#GROUP GroundGroup
function StartMove( g1 )
  BASE:E("Start")
  stopGroup = GROUP:FindByName(g1)
  local Command = stopGroup:CommandStopRoute( false )
  stopGroup:SetCommand(Command)

end
 -- main starts here --
 -- CHANGE THESE FOR PROD --
g1, g2 = "ConvoyLead", "ConvoySupplies"
--StopLeadIfTooFarAway(g1,g2,800) 
sleepSched = SCHEDULER:New(nil, StopLeadIfTooFarAway, {g1, g2, 800}, 1, 15, 0, 0)
