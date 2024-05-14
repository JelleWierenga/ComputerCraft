shell.run("wget run https://raw.githubusercontent.com/JelleWierenga/ComputerCraft/main/Chest%20monitor/chest_monitor.lua")

local file = fs.open("startup.lua", "w")
file.write("shell.run('chest_monitor.lua')")
file.close()

shell.run("reboot")