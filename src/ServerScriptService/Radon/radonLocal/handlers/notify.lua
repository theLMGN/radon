return function(data)
	game.StarterGui:SetCore("SendNotification",{
		Title = data.author;
		Text = data.message;
		Duration = 10;
	})
end
