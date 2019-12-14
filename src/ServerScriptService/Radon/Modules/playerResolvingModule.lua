local perm = require(script.Parent.permissionModule)
local module = {}
function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
function module.resolvePlayer(input)
	local players = {}
	for i,v in pairs(game.Players:GetPlayers()) do
		
		if stringstarts(string.lower(v.Name),string.lower(input)) or input == "all" then
			table.insert(players,#players,v)
		end
	end
	return players
end


function module.resolvePlayers(input,invoker)
	local players = {}
	for token in string.gmatch(input, "[^%s]+") do
		for i,v in pairs(module.resolvePlayer(token)) do
			
			table.insert(players,#players,v)
		end
	end
	return players
end


function module.resolvePlayersSafe(input,invoker)
	local players = {}
	local invokerPerms = perm.getPermission(invoker)
	if invokerPerms == 4 then invokerPerms = 5 end
	for token in string.gmatch(input, "[^%s]+") do
		for i,v in pairs(module.resolvePlayer(token)) do
			local vPerms = perm.getPermission(v)
			if invokerPerms > vPerms then
				table.insert(players,#players,v)
			else
				print(invoker.Name .. " (" .. invokerPerms..") was denied the permission to complete a moderative action against "..v.Name .. " ("..vPerms..")") 
			end
			
		end
	end
	return players
end

return module
