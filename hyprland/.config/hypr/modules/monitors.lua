local utils = require("modules.utils")

if utils.hostname == "sun" then
	require("modules.pc.monitors")
elseif utils.hostname == "mars" then
	require("modules.laptop.monitors")
else
	-- Fallback for any other display (projectors, TVs)
	hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
end

-- Laptop monitor
hl.monitor({ output = "eDP-1", mode = "1920x1080@144.15", position = "0x0", scale = 1 })
-- Laptop external monitor (mirrored)
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0", scale = 1, mirror = "eDP-1" })
