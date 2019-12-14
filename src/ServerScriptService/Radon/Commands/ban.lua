local prm = require(script.Parent.Parent.Modules.playerResolvingModule)
local banned = {}

game.Players.PlayerAdded:Connect(function(p)
	for i,v in pairs(banned) do
		if v == p.UserId then
			game.ReplicatedStorage.radonEvent:FireClient(p,{name="kick",data=nil})
			v:Kick("You were banned from this server.")
		end
	end
end)

return {
	name = "ban",
	description = "Bans a user from the CURRENT server (not permanently).",
	perm = 2,
	exec = function(user,message,functs)
		wait()
		print(message)
		local players = prm.resolvePlayersSafe(message,user)
		for i,v in pairs(players) do
			functs["remoteEvent"]:FireClient(v,{name="kick",data=nil})
			table.insert(banned,#banned,v.UserId)
			v:Kick("You were banned from the server by the player "..user.Name)
			functs["chatBroadcast"]("Radon","The user ".. v.Name .. " has been banned by " .. user.Name .. ".", Color3.new(249/255,92/255,57/255))
			
		end
		
	end
}

