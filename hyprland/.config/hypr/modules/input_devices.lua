local utils = require("modules.utils")

if utils.hostname == "sun" then
	require("modules.pc.input_devices")
elseif utils.hostname == "mars" then
	require("modules.laptop.input_devices")
end

-- Laptop Touchpad
hl.device({ name = "pixa3848:00-093a:3848-touchpad", sensitivity = 0 })
