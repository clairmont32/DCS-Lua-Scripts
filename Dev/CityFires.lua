-- creates and manages fires within a set of ME zones over a city

-- SETUP -- 

WaterZones = {"WaterZone1", "WaterZone2", "WaterZone3"}

-- populate a table with the amount of ME zones created and start their fires
firezones = {}
count = 0
MaxMEzones = 15
while count <= MaxMEzones do
  num = math.random(1,10)
  firezones[num] = true
  count = count + 1
end


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
  for i, Player in pairs(Players) do
    player = UNIT:FindByName(Player)
    -- iterate through table of fire zones to determine if inside the zone or not
    for i, v in pairs(firezones) do
      if player:IsCompletelyInZone(ZONE:FindByName("CitySmoke" .. i)) and (player:GetAirspeedTrue() < 30) then
        if player:GetAltitude(true) < 200 then
          player:Explode(200, 5)
          MessageToBlue(player:GetPlayerName() .. " blew up by getting too close to the fire!",20 ,"Too close to fire")
        end
        
        -- remove water cargo and put out fire
        player:RemoveCargo(WaterContainer)
        ExplosionName = "CitySmokeFire" .. i
        CitySmokeCoords:StopBigSmokeAndFire(ExplosionName)
        MessageToBlue(player:GetPlayerName() .. "put out a fire!",20,"Fire out")
      else env.warning("else",false) 
      end
    end
  end
end

-- Loads water into the make believe bambi bucket when below 100ft/30m after 10 seconds
function LoadWater()
Players = GROUP:FindByName("Rotary-1")

-- TODO --
-- FIGURE OUT HOW TO DO INDIVIDUAL UNIT CARGO LOADS AND UNLOADS
  for i, Player in pairs(Players) do
      for i, WaterZone in pairs(WaterZones) do
        player = UNIT:FindByName(Player)
        if player:IsCompletelyInZone(ZONE:FindByName(WaterZone)) and (player:GetAltitude(true) <= 30) and player:IsCargoEmpty() then
          player:AddCargo(WaterContainer)
          MessageToBlue(player .. " loaded their bambi bucket",10,"Water loaded")
        end
      end
  end  
end

function ClearEvent()
  for i, Player in pairs(Players) do UNIT:FindByName(Player):RemoveCargo(WaterContainer) end
  for i, bool in pairs(firezones) do CitySmokeCoords:StopBigSmokeAndFire("CitySmokeFire" .. i) end
end


-- MAIN -- 

-- start all the fires in the randomly selected zones from above "firezones"
for i, v in pairs(firezones) do
  StartFire(i)
end 


 -- SCHEDULERS -- 
WaterContainer = CARGO:New("BambiBucket","WaterContainer",440)
-- initiate a single scheduler to check if we need to add water weight to helicopter
SCHEDULER:New(nil, LoadWater, {}, 1, 10, 0, 15)


-- initiate a single scheduler to check if we need to put out any fires
SCHEDULER:New(nil, StopFire, {}, 1, 10, 0, 15)

-- server event cleanup
SCHEDULER:New(nil,ClearEvent,{}, 30, 0, 0 , 60)


-- TODO --
-- Deploy ropes?


env.info("CityFireNew loaded successfully", true)
