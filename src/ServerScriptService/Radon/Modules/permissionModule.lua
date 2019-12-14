local module = {}
local config = require(script.Parent.Parent.Configuration)
-- Permissions:
--	0: Regular
--  1: VIP
--	2: Moderation
--  3. Administration
-- 	4. Root
module.permissionsEnum = {
	GUEST = 0,
	VIP = 1,
	MOD = 2,
	ADMIN = 3,
	ROOT = 4
}
local pE =module.permissionsEnum 

local cache = {}
module.getPermission = function(user)
	for i,v in pairs(cache) do
		if (v.user == user.UserId) then
			return v.perm
		end
	end
	if game.CreatorType == Enum.CreatorType.User then
		if game.CreatorId == user.UserId then
			return pE.ROOT
		end
	else
		if user:GetRankInGroup(game.CreatorId) == 255 then
			table.insert(cache,#cache,{user = user.UserId, perm = 4})
			return pE.ROOT
		end
	end

	for i,v in pairs(config.permissions) do
		if v.permType == "player" then
			if user.UserId == v.id then
				return v.perm
			end
		end
		if v.permType == "group" then
			if user:GetRankInGroup(v.id) >= v.minRole then
				table.insert(cache,#cache,{user = user.UserId, perm = v.perm})
				return v.perm
			end
		end
		if v.permType == "owner" then
			if v.isGamepass then
				if game.MarketplaceService:UserOwnsGamePassAsync(v.id) then
					table.insert(cache,#cache,{user = user.UserId, perm = v.perm})
					return v.perm
				end
			else
				if game.MarketplaceService:PlayerOwnsAsset(v.id) then
					table.insert(cache,#cache,{user = user.UserId, perm = v.perm})
					return v.perm
				end
			end
		end
	end
	return 0
end
function module.permissionFriendlyName(permission)
	if permission == pE.GUEST then return "Guest" end
	if permission == pE.VIP then return "V.I.P." end
	if permission == pE.MOD then return "Moderator" end
	if permission == pE.ADMIN then return "Administrator" end
	if permission == pE.ROOT then return "Root" end
	return "Unknown permission "..permission
end
return module
