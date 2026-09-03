local utils = require("modules.utils")

if utils.hostname == "sun" then
	require("modules.pc.monitors")
elseif utils.hostname == "mars" then
	require("modules.laptop.monitors")
end

-- Fallback for any other display (projectors, TVs)
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
