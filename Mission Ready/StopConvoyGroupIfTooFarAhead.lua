 -- get the distance between 2 groups and stop group1 until group2 comes within a given distance
--assert(loadfile("C:\\Users\\matth\\Saved Games\\DCS.openbeta\\Missions\\Scripts\\My Missions\\Playground\\Scheduler.lua"))()


-- CHANGE THESE FOR PROD --
g1, g2 = "Convoy Lead", "Convoy Supplies"
maxDist = 1000

-- returns float of 2D distance between 2 groups
function GetGroupDistance(g1, g2)
BASE:F3("Group Distance")
local grp1Coord = GROUP:FindByName(g1):GetCoordinate()
local grp2Coord = GROUP:FindByName(g2):GetCoordinate()
return grp1Coord:Get2DDistance(grp2Coord)
end


function StopMove(group)
local Command = group:CommandStopRoute(true)
group:SetCommand(Command)
--group:CommandSetFrequency(45,radio.Modulation.AM,0) 
end


function StartMove(group)
BASE:E("Start") -- logging purposes only?
local Command = group:CommandStopRoute(false)
group:SetCommand(Command)
end

function StopLeadIfTooFarAway(g1, g2, maxDist)
BASE:E("StopLead")

distBetweenGroups = GetGroupDistance(g1, g2)
 
 if distBetweenGroups >= maxDist
  then
-- Get lead APC group units
apc1Group = GROUP:FindByName(g1)
Scheduler = SCHEDULER:New(nil)
ScheduleIDStop = Scheduler:Schedule(nil,StopMove,{apc1Group},1,0)

env.warning("Lead convoy too far; holding", false)
  else
ScheduleIDStart = Scheduler:Schedule(nil,StartMove,{apc1Group},1,0)
  end
end


-- StopLeadIfTooFarAway(g1,g2,maxDist)
 -- main starts here --
sleepSched = SCHEDULER:New(nil, StopLeadIfTooFarAway, {g1, g2, maxDist}, 1, 15, 0, 0)
