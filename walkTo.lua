--walks the player in a given cardinal direction until reaching tx,tz
--walkToward is a better implementation of similar behaviour

function walkTo(dir,tx,tz,announce)
  announce = announce or false
  if announce then
    log(string.format("walking to %d %d",xt,zt))
  end
  look(dir,0)
  forward(-1)
  repeat
    look(dir,0)
    local x,y,z=getPlayerBlockPos()
    sleep(50)
  until tx == x and tz == z
  forward(0)
  if announce then log("walked") end
return end

return walkTo
