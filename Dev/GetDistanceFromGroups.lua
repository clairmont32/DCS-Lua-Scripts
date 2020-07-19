-- EDIT DISTANCE BETWEEN GROUPS HERE --
maxDistance = 1000

-- returns float of 2D distance between 2 groups
function GetGroupDistance(g1, g2)
grp1Coord = GROUP:FindByName(g1):GetCoordinate()
grp2Coord = GROUP:FindByName(g2):GetCoordinate()
return grp1Coord:Get2DDistance(grp2Coord)
end

distBetweenGroups = GetGroupDistance("APC1", "APC2")
env.setErrorMessageBoxEnabled(true)

if distBetweenGroups >= maxDistance
then return true
else return false
end