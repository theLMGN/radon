local commands = {}
for i,v in pairs(script.Parent:GetChildren()) do
	if v.Name == script.Name then
	else
		local command = require(v)
		table.insert(commands,#commands, command)
	end
end

return {
	name = "help",
	description = "List the commands you can use with Radon.",
	perm = 0,
	exec = function(user,message,functs)
		wait()
		print(#commands)
		for i,v in pairs(commands) do
			print(v.name)
			functs["msgOne"](user,v.name, v.description,Color3.fromHSV(v.perm / 4, 0.77,1))
		
		end
		
	end
}

