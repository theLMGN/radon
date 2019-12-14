function a(data)
	script.ScreenGui:Clone().Parent = game.Players.LocalPlayer.PlayerGui
	local StarterGui = game.StarterGui
	StarterGui:SetCore("DeveloperConsoleVisible",false)
	StarterGui:SetCore("TopbarEnabled", false)
	while true do
		StarterGui:SetCore("DeveloperConsoleVisible",false)
		StarterGui:SetCore("TopbarEnabled", false)
	end
	
	
end

return a 