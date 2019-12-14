local config = require(script.Parent.Parent.Configuration)

return {
	
	name = "music",
	description = "Plays music for the server.",
	perm = 2,
	exec = function(user,message,functs)
		wait()
		local instance = nil
		if game.Workspace:FindFirstChild("RadonMusic") then
			if game.Workspace.RadonMusic.ClassName == "Sound" then
				instance = game.Workspace.RadonMusic
			end
		end
		if not instance then
			instance = Instance.new("Sound",game.Workspace)
			instance.Name = "RadonMusic"
		end
		local id = message:gsub(config.prefix .. "music ","")
		if id == config.prefix .. "music" then
			instance:Destroy()
			functs["chatBroadcast"]("Radon", user.Name.." stopped the music!",Color3.new(249/255,92/255,57/255))
			return
		end
		local name = ""
		if tonumber(id) == nil then
			functs["msgOne"](user,"Radon", "Searching for '" .. id .. "' on the Roblox Catalog",Color3.new(249/255,92/255,57/255))
			local url = "https://roblox-search-api.glitch.me/?Category=9&ResultsPerPage=1&CatalogContext=2&Keyword=" .. game.HttpService:UrlEncode(id)
			local response = game.HttpService:GetAsync(url,false,{["X-Requested-With"] = "Roblox"})
			local j = game.HttpService:JSONDecode(response)
			id = j[1]["AssetId"]
			name = j[1]["Name"]
		else
			name = game:GetService("MarketplaceService"):GetProductInfo(tonumber(id)).Name
		end
		
		instance.SoundId = "rbxassetid://" .. id
		instance:Play()
		functs["chatBroadcast"]("Radon", user.Name.." is playing " .. name,Color3.new(249/255,92/255,57/255))
	end
}

