-- RED CAP will stick to a patrol region and engage when a BLUE is in range --
-- taken from demo mission
local name=...

CapPlane = GROUP:FindByName(name)
msg = string.format("Destroying %s",name)
env.info(msg, false)
CapPlane:Destroy(true)
msg = string.format("%s destroyed", name)
env.info(msg, false)
