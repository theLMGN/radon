local prm = require(script.Parent.Parent.Modules.playerResolvingModule)
return {
	name = "kill",
	description = "Kills a user.",
	perm = 2,
	exec = function(user,message,functs)
		
		local players = prm.resolvePlayersSafe(message,user)
		for i,v in pairs(players) do
			pcall(function()
				v.Character:BreakJoints()	
			end)
		end
		
	end
}

