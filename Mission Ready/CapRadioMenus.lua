-- adds radio menu commands to spawn BVR/WVR with skill levels

env.setErrorMessageBoxEnabled(false)
env.info("Loading CAP menus")
Menu = MENU_MISSION:New("CAP Management")

-- spawn BVR CAP based on skill
local function SpawnBVR(skill)
  local log = "Attempting to spawning BVR "..skill
  env.info(log)
  assert(loadfile("C:\\Users\\matth\\Saved Games\\DCS.openbeta\\Missions\\Scripts\\My Missions\\DCS-Lua-Scripts\\Dev\\SpawnCap.lua"))("BVR", skill)
end

-- spawn WVR CAP based on skill
local function SpawnWVR(skill)
  local log = "Attempting to spawning WVR "..skill
  env.info(log)  
  assert(loadfile("C:\\Users\\matth\\Saved Games\\DCS.openbeta\\Missions\\Scripts\\My Missions\\DCS-Lua-Scripts\\Dev\\SpawnCap.lua"))("WVR", skill)
end


-- type management
env.info("Creating type menus", false)
local MenuBVR = MENU_MISSION:New("BVR Mgt", Menu)
local MenuWVR = MENU_MISSION:New("WVR Mgt", Menu)

-- BVR Menus
env.info("Creating BVR Skill menus")
local BVRHigh = MENU_MISSION_COMMAND:New("High", MenuBVR,SpawnBVR, "High")
local BVRGood = MENU_MISSION_COMMAND:New("Good", MenuBVR, SpawnBVR, "Good")
local BVRAvg = MENU_MISSION_COMMAND:New("Avg", MenuBVR, SpawnBVR, "Avg")

-- WVR Menus
env.info("Creating WVR Skill menus")
local WVRHigh = MENU_MISSION_COMMAND:New("WVR High", MenuWVR, SpawnWVR, "High")
local WVRGood = MENU_MISSION_COMMAND:New("WVR Good", MenuWVR, SpawnWVR, "Good")
local WVRAvg = MENU_MISSION_COMMAND:New("WVR Avg", MenuWVR, SpawnWVR, "Avg")
local WVRGuns = MENU_MISSION_COMMAND:New("WVR Guns Only!", MenuWVR, SpawnWVR, "Guns")