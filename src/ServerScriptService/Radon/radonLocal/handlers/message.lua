return function(data)
	local text = Instance.new("Message",workspace)
	text.Text = data["content"]
	local title = Instance.new("Hint",workspace)
	title.Text = data["title"]
	wait(5)
	text:Destroy()
	title:Destroy()
end
