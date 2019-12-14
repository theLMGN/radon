local permission = {
	GUEST = 0,
	VIP = 1,
	MOD = 2,
	ADMIN = 3,
	ROOT = 4
}
local module = {
	prefix = "r!",
	blacklist = {
		{
			id = 8166491, -- 1x1x1x1
			reason = "spoopy"
		}
	},
	-- Valid permissions:
	--	0: Regular
	--  1: VIP
	--	2: Moderation
	--  3. Administration
	-- 	4. Root
	permissions = {
		{
			permType = "player",	-- Is a player
			id = 47757673,		 	-- ID of user
			perm = permission.ROOT -- Permission to grant, see above.
		},
		{
			permType = "group", 	-- has a role in a group
			id = 3534114,  		 	-- ID of group
			minRole = 252, 		 	-- Minimum role, all roles above will apply to this, set to 0 for all members of a group
			perm = permission.ROOT -- Permission to grant, see above.
		},
		{
			permType = "owner", 	-- Owns an asset
			isGamepass = false,	 	-- Item is a gamepass.
			id = 977734037,		 	-- Asset to own
			perm = permission.ROOT -- Permission to grant, see above.
		}
	},
	datastoreName = "radon" -- Name for the Radon datastores. 
}

return module
