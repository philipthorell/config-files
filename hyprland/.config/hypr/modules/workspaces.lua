-- PC right/main monitor (DP-1): workspaces 1-10
for i = 1, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1", persistent = true, default = (i == 1) })
end

-- PC left monitor (DP-3): workspaces 11-20
for i = 11, 20 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-3", persistent = true, default = (i == 11) })
end

-- Laptop (eDP-1): workspaces 21-30
for i = 21, 30 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1", persistent = true, default = (i == 21) })
end

-- Extra monitor (anything that isn't DP-1, DP-3, or eDP-1): workspaces 31-40
for i = 31, 40 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "desc:^(?!(DP-1|DP-3|eDP-1)).*$",
		persistent = true,
		default = (i == 31),
	})
end
