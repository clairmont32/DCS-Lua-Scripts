-- creates and manages fires within a set of ME zones over a city


-- ReturnFireZone finds and returns ZONE of a CitySmoke+Num 
-- This can be used for spawning new city fire zones or retrieving their properties
function ReturnFireZone(zoneNum)
    return ZONE:FindByName("CitySmoke" .. zoneNum)
end

local zoneNum = math.random(1, 4)
local CitySmokeZone = ReturnFireZone(zoneNum)

-- 
function CheckIfHelosInZones(CitySmokeZone)
    if GROUP:FindByName("Transport"):FilterStart():IsHelicopter() and GROUP:IsPartlyInZone(CitySmokeZone) then
        env.info("Transport helicopter entered " .. CitySmokeZone:GetName())
    end
end