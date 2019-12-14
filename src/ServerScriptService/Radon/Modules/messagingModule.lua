local module = {}
function module.message(speaker,message,color)
	local event = game.ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents").OnNewMessage
	print("[Broadcast] [" .. speaker .. "] " .. message)
	--game.ReplicatedStorage.radonEvent:FireAllClients({name="notify",data={author=speaker,message=message}})
	local data = {
		MessageLength = message:len(),
		FromSpeaker = speaker,
		OriginalChannel = "All",
		Message = message,
		Time = tick(),
		SpeakerUserId = -1,
		ID = -1,
		IsFiltered = true,
		ExtraData = {
			NameColor = color,
			Tags = {}
		},
		MessageType = "Message"
	}
	event:FireAllClients(data,"All")
end

function module.messageOne(usr,speaker,message,color)
	local event = game.ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents").OnNewMessage
	--game.ReplicatedStorage.radonEvent:FireClient(usr,{name="notify",data={author=speaker,message=message}})
	print("[To "..usr.Name.."] [" .. speaker .. "] " .. message)
	local data = {
		MessageLength = message:len(),
		FromSpeaker = speaker,
		OriginalChannel = "All",
		Message = message,
		Time = tick(),
		SpeakerUserId = -1,
		ID = -1,
		IsFiltered = true,
		ExtraData = {
			NameColor = color,
			Tags = {}
		},
		MessageType = "Message"
	}
	event:FireClient(usr,data,"All")
end

return module
