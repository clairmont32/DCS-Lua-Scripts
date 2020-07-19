-- RED CAP will stick to a patrol region and engage when a BLUE is in range --
-- taken from demo mission

CapPlane = GROUP:FindByName( "RED CAP" )

PatrolZone = ZONE:New( "RED CAP" )

AICapZone = AI_CAP_ZONE:New( PatrolZone, 6000, 13700, 450, 600, "BARO" )

AICapZone:SetControllable( CapPlane )
AICapZone:SetEngageRange( 30000 ) -- Set the Engage Range to 20.000 meters. The AI won't engage when the enemy is beyond 20.000 meters.

AICapZone:__Start( 1 ) -- They should statup, and start patrolling in the PatrolZone.