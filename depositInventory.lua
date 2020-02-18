--dumps as much of the player's inventory as possible (excluding hotbar) into the the block he is looking at
--target inventory size must be specified (54 for double chest, etc.)

function depositInventory(tslots)
  use()
  sleep(1000)
  local inv = openInventory()
  local map = inv.mapping.inventory
  for i=tslots+1,tslots+27 do
    inv.quick(i)
    sleep(100)
  end
  inv.close()
return end

return depositInventory
