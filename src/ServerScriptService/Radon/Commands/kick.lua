local prm = require(script.Parent.Parent.Modules.playerResolvingModule)
return {
	name = "kick",
	description = "Kick a user from the game.",
	perm = 2,
	exec = function(user,message,functs)
		wait()
		
		local players = prm.resolvePlayersSafe(message,user)
		for i,v in pairs(players) do
			game.ReplicatedStorage.radonEvent:FireClient(v,{name="kick",data=nil})
			v:Kick("You were kicked from the game by the player "..user.Name)
			functs["chatBroadcast"]("Radon","The user ".. v.Name .. " has been kicked by " .. user.Name .. ".", Color3.new(249/255,92/255,57/255))
			
		end
		
	end
}

