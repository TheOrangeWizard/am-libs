--helper function for tree farms
--breaktime is roughly calibrated for diamond e4 axe, should be higher for slower tools.
--d is the direction of the tree to chop down relative to the player
--player should start 3 blocks away from the trunk (i.e. adjacent to the leaves but not under them)
--finishes under the trunk. should be combined with extra walkToward calls and replant saplings in a complete farm script

function doTree(d)
  breaktime=650
  walkToward = require("walkToward")
  x,y,z=getPlayerBlockPos()
  if d == 0 then
    tx, tz = x, z-3
  elseif d == 90 then
    tx, tz = x-3, z
  elseif d == 180 then
    tx, tz = x, z+3
  elseif d == 270 then
    tx, tz = x+3, z
  end
  --log(x, " ", z)
  --log(tx, " ", tz)
  look(d,0)
  --log(1)
  attack(breaktime*3)
  sleep(breaktime*3)
  look(d,15)
  --log(2)
  attack(breaktime*1)
  sleep(breaktime*1)
  walkToward(tx,tz)
  look(d,-90)
  --log(3)
  attack(breaktime*5)
  sleep(breaktime*5)
  look(d,0)
  --log(4)
  attack(breaktime*3)
  sleep(breaktime*3)
return end

return doTree
