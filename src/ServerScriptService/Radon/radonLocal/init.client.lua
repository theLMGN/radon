local e = game.ReplicatedStorage:WaitForChild("radonEvent")

e.OnClientEvent:connect(function(d)
	for i,v in pairs(script.handlers:GetChildren()) do
	
		if v.Name == d.name then
			require(v)(d.data)
		end
	end
end)
script.Parent.radonLocal.RadonUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
print([[Radon Local a0.1 by theLMGN (DareDev)
            ▒▓█ Loaded █▓▒]])