function ClearZone(ZoneName)
  MESSAGE:New("Zone is shrinking 5nm from BULLSEYE!", 10, nil, true):ToAll()
  Players = CLIENT:GetPlayers()
  
  
  for i, v in pairs(Players) do
    if Player:IsNotInZone(ZONE:FindByName(ZoneName)) then 
       MESSAGE:New(v .. " IS OUT OF " .. ZoneName .. "!", 5, nil, true)
       Player:SetUnitInternalCargo(40000)
       Player:SetSpeed(10, true)
       Player:ScheduleOnce(15,Player:Destroy(true))
    end
  end
  
end


StartZone = ZONE:New("Start")
StartZone:DrawZone(coalition.side.BLUE,{0,0,2},1,{0,200,0},0,1,true)
StartZone:Sche(60,ClearZone)
