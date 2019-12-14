local start = tick()

return {
	name = "uptime",
	description = "Lets the user view the uptime of the game server.",
	perm = 0,
	exec = function(user,message,functs)
		wait()
		functs["msgOne"](user,"Radon","This game server has been running for " .. math.floor((tick() - start) / 60) .." minutes", Color3.new(249/255,92/255,57/255))
	end
}

