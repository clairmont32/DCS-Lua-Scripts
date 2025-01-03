local pattern = "RED_CONVOY%_%d#%d%d%d"
env.info(pattern)
Tank = GROUP:FindByMatching( pattern )
if Tank:IsAlive() then env.info("found") else env.error("nope") end
Tank:Destroy( true )
