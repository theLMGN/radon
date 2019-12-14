print("[Rn] Loading modules...")
local config = require(script.Configuration)
local perm = require(script.Modules.permissionModule)
local msg = require(script.Modules.messagingModule)

print("[Rn] Setting up client/server communication")
local re = Instance.new("RemoteEvent",game.ReplicatedStorage)
re.Name = "radonEvent"

print("[Rn] Setting up command handling")
local commands = {}

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function handleCommand(player,message)
	if stringstarts(message,config.prefix) then
		for i,v in pairs(commands) do
			if stringstarts(message,config.prefix .. v.name) then
				local shouldRun = false
				local pPerm = 0
				if v.perm == 0 then
					shouldRun = true
				else
					pPerm = perm.getPermission(player)
					if pPerm >= v.perm then
						shouldRun = true
					end
				end
				if shouldRun then 
					print("[Rn] ".. player.Name .. " is running command " .. v.name)
					local s,m = pcall(function()
						local functs = {
							msgOne = msg.messageOne,
							chatBroadcast = msg.message,
							clientMsg = function(data) re:FireClient(player,{name=v.name,data=data}) end,
							clientBc = function(data) re:FireAllClients({name=v.name,data=data}) end,
							remoteEvent = re
						}
						v.exec(player,message,functs)
					end)
					if s == false then
						msg.messageOne(player,"Radon Error", m,Color3.new(1,0,0))
					end
				else
					msg.messageOne(player,"Radon", "You cannot access the command " .. v.name .. " since you do not have sufficient permissions, you need " .. perm.permissionFriendlyName(v.perm) .. " but you only have ".. perm.permissionFriendlyName(perm.getPermission(player)),Color3.new(1,0,0))
					print("[Rn] ".. player.Name .. " was denied access to command " .. v.name)
				end
			end
		end
	end
end

print("[Rn] Setting up commands")
for i,v in pairs(script.Commands:GetChildren()) do
	print("[Rn] Loading command "..v.Name)
	local command = require(v)
	table.insert(commands,#commands, command)
end

print("[Rn] Setting up command handling")
game.Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(m,rec)
		if not rec then
			handleCommand(p,m)
		end
	end)
	wait(1)
	msg.messageOne(p,"Radon","Welcome " .. p.Name .. ", to " .. game.Name .. ", this game uses the Radon admin script by theLMGN, The prefix for this game is '" .. config.prefix .. "'.",Color3.new(249/255,92/255,57/255))
end)
re.OnServerEvent:connect(function(p,data)
	if data.name == "runCommand" then
		handleCommand(p,config.prefix..data.data)
	end
end)

script.radonLocal.Parent = game.StarterPlayer.StarterPlayerScripts
print([[Radon Admin a0.1 by theLMGN (DareDev)
            ▒▓█ Loaded █▓▒]])