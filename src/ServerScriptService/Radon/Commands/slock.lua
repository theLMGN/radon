local permission = require(script.Parent.Parent.Modules.permissionModule)
local slocked = false
local slockingUser = "server"
game.Players.PlayerAdded:Connect(function(p)
	if slocked then
		if permission.getPermission(p) == 0 then
			p:Kick("Server was locked by " .. slockingUser .. ", please try a different server.")
		end
		
	end
end)
return {
	name = "slock",
	description = "Lock server, preventing guests from getting in.",
	perm = 2,
	exec = function(user,message,functs)
		wait()
		slockingUser = user.Name
		if slocked then
			functs["chatBroadcast"]("Radon","Server has been unlocked by " .. user.Name .. ".",Color3.new(92/255,249/255,57/255))
		else
			functs["chatBroadcast"]("Radon","Server has been locked by " .. user.Name .. ".", Color3.new(249/255,92/255,57/255))
		end
		slocked = not slocked
	end
}

