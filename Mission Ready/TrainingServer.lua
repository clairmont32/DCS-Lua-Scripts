-- adds radio menu commands to spawn BVR/WVR with skill levels

env.setErrorMessageBoxEnabled(false)
MESSAGE:New("Training Scenario Loaded!",5,MESSAGE.Type.Information,true)
env.info("Loading menus")
CapMenu = MENU_MISSION:New("CAP Management")
InvasionParent = MENU_MISSION:New("Spawn Invasion")

-- type management
env.info("Creating type menus")
MenuBVR = MENU_MISSION:New("BVR Mgt", CapMenu)
MenuWVR = MENU_MISSION:New("WVR Mgt", CapMenu)

-- type management
env.info("Creating invasion menus")
MENU_MISSION_COMMAND:New("Invasion Easy", InvasionParent, SpawnInvasion,"Invasion-Easy")
MENU_MISSION_COMMAND:New("Invasion Medium", InvasionParent, SpawnInvasion,"Invasion-Medium")
MENU_MISSION_COMMAND:New("Invasion Hard", InvasionParent, SpawnInvasion,"Invasion-Hard")

-- Spawns a random Invasion provided a base group name such as "Invasion-Easy"
local function SpawnInvasion(GroupName)
  num = math.random(1,3)
  InvasionNum = GroupName .. "-" .. num
  env.info("Attempting to spawn " .. InvasionNum)
  local Insurgent = GROUP:FindByName(InvasionNum)
  if not Insurgent:IsActive() then
     Insurgent:Activate(2)
     if Insurgent:IsActive() then
       env.info("" .. InvasionNum .. " spawned successfully")    
       MessageToBlue(InvasionNum .. " Spawned", 10, nil)
     else 
       MessageToBlue("Error spawning " .. InvasionNum, 10, "Spawn error")
     end
  end

end

-- RED CAP will stick to a patrol region and engage when a BLUE is in range --
-- taken from demo mission
function SpawnBVR(skill)
  PatrolZone = ZONE:New( "BVR CAP" )
  unitName = "RED CAP BVR " .. skill
  capSpawn = SPAWN:New(unitName):SpawnInZone(PatrolZone, true, 5000, 6000, nil)

  env.info("BVR CAP Spawned in CAP Zone")
  
 
  AICapZone = AI_CAP_ZONE:New( PatrolZone, 5500, 6000, 300, 450, "BARO" )
  AICapZone:SetEngageRange( 212664 ) -- Set the Engage Range to 35nm. The AI won't engage when the enemy is beyond this range
  AICapZone:SetControllable(capSpawn)
  
  -- Spawns the CAP
  AICapZone:__Start( 1 )
  if capSpawn:IsAlive() then
    env.info("CAP loaded and patrolling")
    msgText = "BVR CAP "..skill.." spawned 50nm W of Kobuleti"
    msg = MESSAGE:New(msgText, 15)
  end

end

function SpawnWVR(skill)
  PatrolZone = ZONE:New( "WVR CAP" )
  unitName = "RED CAP WVR " .. skill
  capSpawn = SPAWN:New(unitName):SpawnInZone(PatrolZone, true, 5000, 6000, nil)
  env.info("WVR CAP Spawned in CAP Zone",false)
  
  AICapZone = AI_CAP_ZONE:New( PatrolZone, 5500, 6000, 300, 450, "BARO" )
  AICapZone:SetEngageRange( 60761 ) -- Set the Engage Range to 4nm. The AI won't engage when the enemy is beyond this range
  AICapZone:SetControllable(capSpawn)
  
  -- CAP Options
  capSpawn:OptionProhibitAfterburner(true)
  capSpawn:OptionAlarmStateRed()
  capSpawn:OptionROEWeaponFree()
  
  -- Spawns the CAP
  AICapZone:__Start( 1 )
  if capSpawn:IsAlive() then
    env.info("CAP loaded and patrolling")
    msgText = "WVR CAP "..skill.." spawned over Sochi-Adler"
    msg = MESSAGE:New(msgText, 15)
  end
end


-- BVR Menus
env.info("Creating BVR Skill menus")
BVRHigh = MENU_MISSION_COMMAND:New("Veteran", MenuBVR,SpawnBVR, "Veteran")
BVRGood = MENU_MISSION_COMMAND:New("Trained", MenuBVR, SpawnBVR, "Trained")
BVRAvg = MENU_MISSION_COMMAND:New("Rookie", MenuBVR, SpawnBVR, "Rookie")

-- WVR Menus
env.info("Creating WVR Skill menus")
WVRHigh = MENU_MISSION_COMMAND:New("WVR Veteran", MenuWVR, SpawnWVR, "Veteran")
WVRGood = MENU_MISSION_COMMAND:New("WVR Trained", MenuWVR, SpawnWVR, "Trained")
WVRAvg = MENU_MISSION_COMMAND:New("WVR Rookie", MenuWVR, SpawnWVR, "Rookie")
WVRGuns = MENU_MISSION_COMMAND:New("WVR Guns Only!", MenuWVR, SpawnWVR, "Guns")

env.info("CAP radio menu loaded")
MESSAGE:New("CAP radio menus loaded",5)


env.warning("Restart Mission Menu",false)
 -- MISSION RESTART MENUS
function RestartMissionFlag()
MISSION:Start()
  missionRestart = USERFLAG:New(99)
  missionRestart:Set(99,3) -- flag 99, value 99 is dedicated to mission restarts
end

RestartMenu = MENU_MISSION:New("Restart mission")
restart = MENU_MISSION_COMMAND:New("I have informed everyone a restart is occurring!", RestartMenu, RestartMissionFlag)