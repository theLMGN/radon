game.Players.LocalPlayer:WaitForChild("PlayerGui"):SetTopbarTransparency(1)
local mouse = game.Players.LocalPlayer:GetMouse()
local clicked = false
function hide()
	clicked = false
	script.Parent.TextColor3 = Color3.new(1,1,1)
	script.Parent.Parent.TextBox:TweenSize(UDim2.new(1,0,0,0), Enum.EasingDirection.In,Enum.EasingStyle.Quad, 0.36)
	script.Parent.Parent.TextBox:ReleaseFocus()
	script.Parent.Parent.TextBox.Text = ""
	wait(0.36)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
	script.Parent.Parent.TextBox.Visible = false
end
function show()
	clicked = true
	script.Parent.TextColor3 = Color3.new(0,160/255, 250/255)
	script.Parent.Parent.TextBox.Visible = true
	script.Parent.Parent.TextBox:TweenSize(UDim2.new(1,0,1,0), Enum.EasingDirection.In,Enum.EasingStyle.Quad, 0.36)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	script.Parent.Parent.TextBox:CaptureFocus()
	wait(0.36)
end
function thing()
	if clicked then
		hide()
	else
		show()
	end
end
game:GetService("UserInputService").InputBegan:Connect(function(io,b,c)
	if io.UserInputType == Enum.UserInputType.MouseButton1 or io.UserInputType == Enum.UserInputType.Touch then
		local ap = script.Parent.AbsolutePosition
		local as = script.Parent.AbsoluteSize
		if mouse.X >= ap.X and mouse.X <= ap.X + as.X and mouse.Y >= ap.Y and mouse.Y <= ap.Y + as.Y then
			if not clicked then
				show()
			end
		end
	elseif io.UserInputType == Enum.UserInputType.Keyboard then
		if io.KeyCode == Enum.KeyCode.Quote and not b then
			thing()
		end
		if io.KeyCode == Enum.KeyCode.Escape and clicked then
			hide()
		end

	end 
end)
game:GetService("RunService").RenderStepped:Connect(function() 
	game.StarterGui:SetCore("ChatWindowPosition",UDim2.new(0,0,0,script.Parent.Parent.TextBox.AbsoluteSize.Y))
end)
script.Parent.Parent.TextBox.FocusLost:Connect(function()
	if clicked then
		game.ReplicatedStorage:WaitForChild("radonEvent"):FireServer({
			name = "runCommand",
			data = script.Parent.parent.TextBox.Text
		})
		hide()
	end
end)