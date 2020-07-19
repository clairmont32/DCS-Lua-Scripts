function spawnRAT(groupName, depart, FL, dist, amt) 
local rat=RAT:New(groupName)
rat:SetDeparture(depart)
rat:SetFLcruise(FL)
rat:SetMaxDistance(dist)
rat:SetTakeoff("cold")
rat:Commute()
rat:EnableATC(true)
rat:SetROE("return")
rat:SetSpawnInterval(.5)
rat:Spawn(amt)
end

spawnRAT("RAT_C17A", "Batumi", 200, 100, 2)
spawnRAT("RAT_P51","Batumi",30, 75, 4)
spawnRAT("RAT_Blackhawk","Batumi", 007, 50, 4)
