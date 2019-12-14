local prm = require(script.Parent.Parent.Modules.playerResolvingModule)
local config = require(script.Parent.Parent.Configuration)
return {
	name = "broadcast",
	description = "Broadcasts a message to the whole server.",
	perm = 1,
	exec = function(user,message,functs)
		wait()
		functs["remoteEvent"]:FireAllClients({name="message",data={
			content = message:gsub(config.prefix .. "broadcast ",""),
			title = "Broadcast from " .. user.Name
		}})
	end
}

