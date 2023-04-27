staticBarrels = STATIC:FindByName("Cargo_Barrels")
cargoBarrels = CARGO_CRATE:New(staticBarrels,"Fuel Barrels",10,25)

-- sets up a HQ, mission and tasking for cargo deliveries


local HQ = GROUP:FindByName("HQ", "Command")
local CommandCenter = COMMANDCENTER:New(HQ)
local Scoring = SCORING:New("Cargo Deliveries")


-- CargoMission returns a cargo mission for tasking
-- It takes a string to make the delivery item a bit more dynamic 
function CargoMission(item)
local CargoMission = MISSION
      :New(CommandCenter,"Transport " + item, High, "Deliver " + item + " to FARP Alpha", coalition.side.BLUE)
      :AddScoring(Scoring)
      
      return CargoMission
end
