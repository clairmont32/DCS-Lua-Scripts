function Hello(foo, bar)
g1 = GROUP:FindByName(foo)
g1:Destroy(nil,3)
g2 = GROUP:FindByName(bar)
g2:Destroy(nil,3)

env.warning(g1,true)
--Goodbye("Baby", "Shark")
end


sleepSched = SCHEDULER:New(GROUP:FindByName("Convoy Supplies"))
sleepSched:New(nil,Hello,{"Convoy Lead", "Convoy Supplies"},1,10,0,10)
--sleepScheduleStart = sleepSched:ScheduleRepeat(1, 5, 0, 0, Hello, {"Convoy Supplies" })