env.setErrorMessageBoxEnabled(false)
env.info("Loading SAM menus")

SAMParent = MENU_MISSION:New("Spawn SAMs", nil)
DespawnParent = MENU_MISSION:New("Despawn SAMs", nil)

-- determine if its alive already and spawn a new one if its not
function SpawnSAM(name)
  SAMGroup = GROUP:FindByName(name)
  if not SAMGroup:IsAlive() then 
    SPAWN:New(name):Spawn()
    MESSAGE:New(name.." Spawned",MESSAGE.Type.Information,true)
  end
end

-- simply find and despawn the sam by name
function DespawnSAM(name)
  env.info("Attempting to despawn")
    
  GROUP:FindByName(name):Explode(100, 3)
  --SAMGroup:Destroy( true ) -- not working for some reason?
  env.info("Bye Bye")
end

Strat = MENU_MISSION:New("Strategic",SAMParent)
Tact = MENU_MISSION:New( "Tactical",SAMParent)

DesStrat = MENU_MISSION:New("Strategic",DespawnParent)
DesTact = MENU_MISSION:New("Tactical",DespawnParent)


-- strategic SAMS
MENU_MISSION_COMMAND:New("SA-2", Strat, SpawnSAM, "SA-2")
MENU_MISSION_COMMAND:New("SA-3", Strat, SpawnSAM, "SA-3")
MENU_MISSION_COMMAND:New("SA-5", Strat, SpawnSAM, "SA-5")
MENU_MISSION_COMMAND:New("SA-10",Strat, SpawnSAM, "SA-10")

-- tactical SAMS
MENU_MISSION_COMMAND:New("SA-6", Tact, SpawnSAM, "SA-6")
MENU_MISSION_COMMAND:New("SA-8", Tact, SpawnSAM, "SA-8")
MENU_MISSION_COMMAND:New("SA-11", Tact, SpawnSAM, "SA-11")
MENU_MISSION_COMMAND:New("SA-13", Tact, SpawnSAM, "SA-13")
MENU_MISSION_COMMAND:New("SA-15", Tact, SpawnSAM, "SA-15")
MENU_MISSION_COMMAND:New("SA-17", Tact, SpawnSAM, "SA-17")
MENU_MISSION_COMMAND:New("SA-19", Tact, SpawnSAM, "SA-19")


-- Strategic SAMS
MENU_MISSION_COMMAND:New("SA-2", DesStrat, DespawnSAM, "SA-2")
MENU_MISSION_COMMAND:New("SA-3", DesStrat, DespawnSAM, "SA-3")
MENU_MISSION_COMMAND:New("SA-5", DesStrat, DespawnSAM, "SA-5")
MENU_MISSION_COMMAND:New("SA-10", DesStrat, DespawnSAM, "SA-10")

-- tactical SAMS
MENU_MISSION_COMMAND:New("SA-6", DesTact, DespawnSAM, "SA-6")
MENU_MISSION_COMMAND:New("SA-8", DesTact, DespawnSAM, "SA-8")
MENU_MISSION_COMMAND:New("SA-11", DesTact, DespawnSAM, "SA-11")
MENU_MISSION_COMMAND:New("SA-13", DesTact, DespawnSAM, "SA-13")
MENU_MISSION_COMMAND:New("SA-15", DesTact, DespawnSAM, "SA-15")
MENU_MISSION_COMMAND:New("SA-17", DesTact, DespawnSAM, "SA-17")
MENU_MISSION_COMMAND:New("SA-19", DesTact, DespawnSAM, "SA-19")

