--theoretically walks along a line and breaks the crops at its feet.
--harvestLineB is more versatile
--player looks towards given yaw, pitch, walks forward until he reaches coordinates tx,tz

function harvestLine(yaw,tx,tz,slot,pitch)
  slot = slot or 1
  pitch = pitch or 90
  setHotbar(slot)
  look(yaw,pitch)
  sleep(100)
  attack()
  forward(-1)
  repeat
    look (yaw,pitch)
    sleep(50)
    attack()
    local x,y,z = getPlayerBlockPos()
  until x == tx and z == tz
  forward(0)
  attack()
  sleep(100)
  attack()
  sleep(100)
end

return harvestLine
