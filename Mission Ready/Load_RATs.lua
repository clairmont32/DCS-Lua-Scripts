-- change bottom start/dest and amount

function spawnRAT(groupName, depart, FL, dist, amt) -- doesnt care where they go
local rat=RAT:New(groupName)
rat:SetDeparture(depart)
rat:SetFLcruise(FL)
rat:SetMaxDistance(dist)
rat:SetTakeoff("runway")
rat:Commute()
rat:SetROE("return")
rat:ATC_Messages(false)
rat:SetSpawnInterval(.5)
rat:Spawn(amt)
end

function spawnRATWithDest(groupName, depart, arrive, FL, dist, amt)
local rat=RAT:New(groupName)
rat:SetDeparture(depart)
rat:SetDestination(arrive)
rat:SetFLcruise(FL)
rat:SetMaxDistance(dist)
rat:SetTakeoff("runway")
rat:Commute()
rat:SetROE("return")
rat:ATC_Messages(false)
rat:SetSpawnInterval(.5)
rat:Spawn(amt)
end

spawnRATWithDest("RAT_C17A", {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, {"Kobuleti", "Kutaisi", "Senaki-Kolkhi", "Batumi"}, 200, 100, 2)
spawnRATWithDest("RAT_Blackhawk","Batumi", {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, 030, 50, 2)
spawnRATWithDest("RAT_CE", {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, 050, 50, 3)
spawnRATWithDest("RAT_CE2", {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, 030, 50, 4)
spawnRATWithDest("RAT_YAK", {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, {"Kobuleti", "Kutaisi", "Senaki-Kolkhi"}, 040, 50, 4)
