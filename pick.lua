--puts a given item on your hotbar if it is in your inventory.
--similar to macromod PICK()
--note this is a suboptimal implementation and can break easily
--sitem = "minecraft:itemname"
--sdmg = minimum damage value, intended for use with tools to prevent breakages
--prefSlot = target hotbar slot
--optInv = dunno how this works, whoever wrote the original script may have some idea

function pick(sitem, sdmg, prefSlot, optInv)
  local inv = optInv or openInventory()
  local map = inv.mapping.inventory
  prefSlot = prefSlot or 1
  --log(sitem)
  --log(prefSlot)
  item = getInventory()[getHotbar()]
  --log (item)
  if item and (item.id==sitem and (sdmg==-1 or sdmg>=item.dmg)) then
    return getHotbar()
  end
  for i,j in pairs(map.hotbar) do
    local item = inv.getSlot(j)
    --if item then log(item.id) else log ("empty") end
    if item and (item.id==sitem and (sdmg==-1 or sdmg>=item.dmg)) then
      --log("item in hotbar")
      setHotbar(i)
      return j
    end
  end
  for i,j in pairs(map.main) do
    local item = inv.getSlot(j)
    --if item then log(item.id) else log ("empty") end
    if item and (item.id==sitem and (sdmg==-1 or sdmg>=item.dmg))  then
      --log("item in inventory")
      setHotbar(prefSlot)
      local p = map.hotbar[prefSlot]
      inv.quick(p)
      sleep(250)
      inv.quick(j)
      sleep(250)
      return prefSlot
    end
    if not optInv then inv.close() end
  end
  return false
end

return pick
