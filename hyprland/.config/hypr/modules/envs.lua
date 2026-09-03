local utils = require("modules.utils")

if utils.hostname == "sun" then
	require("modules.pc.envs")
elseif utils.hostname == "mars" then
	require("modules.laptop.envs")
end

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "aosp-cursors")
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/screenshots")
