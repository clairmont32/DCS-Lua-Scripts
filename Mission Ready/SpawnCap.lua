-- RED CAP will stick to a patrol region and engage when a BLUE is in range --
-- taken from demo mission
env.setErrorMessageBoxEnabled(false)
env.info("SpawnCap.lua loaded", false)

local CapType, skill = ...
env.info(CapType)
env.info(skill)


function SpawnBVR(skill)
  PatrolZone = ZONE:New( "BVR_CAP" )
  unitName = "RED CAP BVR "..skill
  capSpawn = SPAWN:New(unitName):SpawnInZone(PatrolZone, true, 15000, 30000, nil)
  env.info("BVR CAP Spawned in CAP Zone")
  
  AICapZone = AI_CAP_ZONE:New( PatrolZone, 4572, 12192, 400, 600, "BARO" )
  AICapZone:SetEngageRange( 64820 ) -- Set the Engage Range to 45nm. The AI won't engage when the enemy is beyond this range
  AICapZone:SetControllable(capSpawn)
  
  -- CAP Options
  capSpawn:OptionProhibitAfterburner(true)
  capSpawn:OptionAlarmStateRed()
  capSpawn:OptionROEWeaponFree()
  
  -- Spawns the CAP
  AICapZone:__Start( 1 )
  if capSpawn:IsAlive() then
    env.info("CAP loaded and patrolling")
    msgText = "BVR CAP "..skill.." spawned over Mineralyn Vody"
    msg = MESSAGE:New(msgText, 15)
  end

end


function SpawnWVR(skill)
  PatrolZone = ZONE:New( "WVR_CAP" )
  unitName = "RED CAP WVR "..skill
  capSpawn = SPAWN:New(unitName):SpawnInZone(PatrolZone, true, 5000, 9000, nil)
  env.info("BVR CAP Spawned in CAP Zone",false)
  
  AICapZone = AI_CAP_ZONE:New( PatrolZone, 3048, 9000, 5000, 9000, "BARO" )
  AICapZone:SetEngageRange( 7408 ) -- Set the Engage Range to 4nm. The AI won't engage when the enemy is beyond this range
  AICapZone:SetControllable(capSpawn)
  
  -- CAP Options
  capSpawn:OptionProhibitAfterburner(true)
  capSpawn:OptionAlarmStateRed()
  capSpawn:OptionROEWeaponFree()
  
  -- Spawns the CAP
  AICapZone:__Start( 1 )
  if capSpawn:IsAlive() then
    env.info("CAP loaded and patrolling")
    msgText = "BVR CAP "..skill.." spawned over Sochi-Adler"
    msg = MESSAGE:New(msgText, 15)
  end
end

-- call function for correct type
if CapType == "BVR" then
  SpawnBVR(skill)
end  

if CapType == "WVR" then
  SpawnWVR(skill)
end

