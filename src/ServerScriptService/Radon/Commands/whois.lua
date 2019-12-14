local prm = require(script.Parent.Parent.Modules.playerResolvingModule)
return {
	name = "whois",
	description = "Shows basic user information",
	perm = 2,
	exec = function(user,message,functs)
		
		local players = prm.resolvePlayersSafe(message,user)
		for i,v in pairs(players) do
			functs["msgOne"](user,v.Name, "UserID: " .. tostring(v.UserId) .. ", AccountAge: ".. tostring(v.AccountAge) .. "days, BC/Prem: ".. tostring(v.MembershipType),v.TeamColor.Color)
		end
		
	end
}

