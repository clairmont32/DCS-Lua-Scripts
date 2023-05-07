-- creates and manages fires within a set of ME zones over a city

-- Start the fires for each ME zone found and give them each a specific name
function StartFire(num)
  CitySmoke = ZONE:FindByName("CitySmoke" .. num)
  CitySmokeCoords = CitySmoke:GetCoordinate(1)
  ExplosionName = "CitySmokeFire" .. num
  CitySmokeCoords:BigSmokeAndFireHuge(1, ExplosionName)
end

-- determines if a group has entered the zone and come to a near hover inside of it
-- upon these conditions, stop the fire, remove the scheduler, and marker
function StopFire()
  Player = GROUP:FindByName("Rotary-1")
  if Player:IsCompletelyInZone(CitySmoke) and Player:GetAirspeedTrue() < 20 then
    CitySmokeCoords:StopBigSmokeAndFire(ExplosionName)  
    env.info("Fire out", false)
  end
end


-- populate a table with the amount of ME zones created and start their fires
firezones = {}
count = 0
while count <= 7 do
  num = math.random(1,5)
  firezones[num] = true
  count = count + 1
end


for i, v in pairs(firezones) do
  StartFire(i)
end 



for fire, v in pairs(firezones) do
  SchedulerID = SCHEDULER:New(nil, StopFire, {}, 1, 3, 0, 900)
  env.info("Scheduled for " .. fire, true)
  SchedulerID:Remove()
  env.info("Scheduler removed",true)
end  

env.info("Its working!", true)


