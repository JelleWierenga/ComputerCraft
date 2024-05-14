local monitor = peripheral.wrap("right")
monitor.clear()
monitor.setTextScale(0.5)
local width, height = monitor.getSize()

local chest = peripheral.find("minecraft:chest")
while true do
  local time = os.date("%X")

  monitor.setCursorPos(width - #time + 1, 1)
  monitor.write(time)

  local y = math.floor(height / 2)

  for slot, item in pairs(chest.list()) do
    local itemName = string.gsub(item.name, "minecraft:", "")
    local itemCount = ("%dx"):format(item.count)
    
    local xItemName = math.floor((width - #itemName) / 2) + 1
    local xItemCount = math.floor((width - #itemCount) / 2) + 1

    monitor.setCursorPos(xItemName, y + (slot - 1) * 2)
    monitor.write(itemName)
    
    monitor.setCursorPos(xItemCount, y + (slot - 1) * 2 + 1)
    monitor.write(itemCount)
  end

  sleep(5)
  monitor.clear()
end
