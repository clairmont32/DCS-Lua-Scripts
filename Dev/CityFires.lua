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
function StopFire(ExplosionName)
  Player = GROUP:FindByName("Rotary-1")
  
  -- iterate through table of fire zones to determine if inside the zone or not
  for i, v in pairs(firezones) do
    if Player:IsCompletelyInZone(ZONE:FindByName("CitySmoke" .. i)) and Player:GetAirspeedTrue() < 30 then
      ExplosionName = "CitySmokeFire" .. i
      CitySmokeCoords:StopBigSmokeAndFire(ExplosionName)  
      env.info("Fire out", true)
    else env.warning("else",false) 
    end
  end
end


-- populate a table with the amount of ME zones created and start their fires
firezones = {}
count = 0
MEZoneCount = 15
while count <=  MEZoneCount = 15 do
  num = math.random(1,5)
  firezones[num] = true
  count = count + 1
end


-- start all the fires in the randomly selected zones from above "firezones"
for i, v in pairs(firezones) do
  StartFire(i)
end 


-- initiate a single scheduler to check if we need to put out any fires
SchedulerID = SCHEDULER:New(nil, StopFire, {}, 1, 3, 0, 900)
 
env.info("CityFireNew loaded successfully", true)


