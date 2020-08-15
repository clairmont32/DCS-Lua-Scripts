-- adds radio menu commands to spawn BVR/WVR with skill levels

env.setErrorMessageBoxEnabled(false)
env.info("Loading CAP menus")
Menu = MENU_MISSION:New("CAP Management")

-- spawn BVR CAP based on skill
local function SpawnBVR(skill)
  local log = "Attempting to spawning BVR "..skill
  env.info(log)
  if skill == "high" then
    CapFlag = USERFLAG:New(90)
    CapFlag:Set(2,0)
  end
end

-- spawn WVR CAP based on skill
local function SpawnWVR(skill)
  local log = "Attempting to spawning WVR "..skill
  env.info(log)
  if skill == "high" then
    CapFlag = USERFLAG:New(90)
    CapFlag:Set(1,0)
  end
end


-- type management
local MenuBVR = MENU_MISSION:New("BVR Mgt", Menu)
local MenuWVR = MENU_MISSION:New("WVR Mgt", Menu)

-- BVR Menus
local BVRHigh = MENU_MISSION_COMMAND:New("High", MenuBVR,SpawnBVR, "high")
local BVRGood = MENU_MISSION_COMMAND:New("Good", MenuBVR, SpawnBVR, "good")
local BVRAvg = MENU_MISSION_COMMAND:New("Avg", MenuBVR, SpawnBVR, "Avg")

-- WVR Menus
local WVRHigh = MENU_MISSION_COMMAND:New("WVR High", MenuWVR, SpawnWVR, "high")
local WVRGood = MENU_MISSION_COMMAND:New("WVR Good", MenuWVR, SpawnWVR, "good")
local WVRAvg = MENU_MISSION_COMMAND:New("WVR Avg", MenuWVR, SpawnWVR, "avg")