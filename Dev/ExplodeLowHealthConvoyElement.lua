local function healthCheck()
local ammoTrk = GROUP:FindByName("AmmoTruck")
local ammoTrkHealth = ammoTrk:GetLife()
env.info(ammoTrkHealth,false)
if ammoTrkHealth < 2 then
   ammoTrk:Destroy(true)
end
end

--sched = SCHEDULER:New(nil,healthCheck,nil,1,3,0,60)
--ammoTrk = GROUP:FindByName("AmmoTruck"):Respawn(nil,true)

--[[
trk = GROUP:FindByName("AmmoTruck")
unitAmt = GROUP:FindByName("AmmoTruck"):GetUnits()
for k, v in range(unitAmt) do
life = trk:GetUnit(k):GetLife()
env.info(life,false)
end
]]

local function GetHealth(name)
local truckGroup = GROUP:FindByName(name)
local truckUnits = truckGroup:GetUnits()

for i = 1, #truckUnits do
  local truckUnit = truckGroup:GetUnit(i)
  local health = truckUnit:GetLife()
  --logMsg = string.format("unit %d has %.2f health", i, health)
 
  if health > 1 and health < 1.5 then
    truckUnit:Smoke(SMOKECOLOR.White,1,1)
    destroyMsg = string.format("destroying %s unit %d with health %.2f", name, i, health)
    env.info(destroyMsg,false)
    truckUnit:Explode(30,10)
  end
  --env.info(logMsg,false)
end
--env.info("\n",false)
return
end

sched = SCHEDULER:New(nil,GetHealth,{"AmmoTruck"},1,10,0,30)


--[[
for unitID, truckUnit in pairs(truckUnits) do
health = truckUnit
env.info(health, false)
end]]