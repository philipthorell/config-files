------------------
---- MONITORS ----
------------------

-- PC monitors
hl.monitor({ output = "DP-1", mode = "1920x1080@144", position = "1920x0", scale = 1 })
hl.monitor({ output = "DP-3", mode = "1920x1080@60", position = "0x0", scale = 1 })

-- Laptop monitor
hl.monitor({ output = "eDP-1", mode = "1920x1080@144.15", position = "0x0", scale = 1 })

-- Laptop external monitor (mirrored)
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0", scale = 1, mirror = "eDP-1" })

-- Fallback for any other display (projectors, TVs)
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & swaync & hypridle & hyprpaper")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd("hyprctl setcursor aosp-cursors 24")
	hl.exec_cmd("~/.config/waybar/scripts/update-check.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "aosp-cursors")
hl.env("HYPRSHOT_DIR", "/home/philip/Pictures/screenshots")
hl.env("LIBVA_DRIVER_NAME", "nvidia")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 25,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			size = 4,
			passes = 3,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
	master = {
		new_status = "master",
	},
	xwayland = {
		force_zero_scaling = true,
	},
	input = {
		kb_layout = "se",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
		},
	},
})

--------------------
---- ANIMATIONS ----
--------------------

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-------------
---- INPUT DEVICES ----
-------------

-- PC Mouse
hl.device({ name = "razer-razer-deathadder-elite", sensitivity = -0.7 })

-- Laptop Touchpad
hl.device({ name = "pixa3848:00-093a:3848-touchpad", sensitivity = 0 })

-- Default example device
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

---------------------
---- KEYBINDINGS ----
---------------------

local mod = "SUPER"
local modShift = "SUPER + SHIFT"

-- Applications
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + N", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("pycharm"))
hl.bind(mod .. " + M", hl.dsp.exec_cmd("thunderbird"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))

-- Exit Hyprland
hl.bind(
	mod .. " + END",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)

-- Window management
hl.bind(mod .. " + X", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + I", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + F11", hl.dsp.window.fullscreen_state({ internal = 0, client = 0, action = "toggle" }))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --freeze"))

-- Lock screen
hl.bind(mod .. " + HOME", hl.dsp.exec_cmd("hyprlock"))

-- Toggle touchpad (Copilot key on laptop)
local touchpad = "pixa3848:00-093a:3848-touchpad"
local touchpad_enabled = true

local function toggle_touchpad()
	touchpad_enabled = not touchpad_enabled
	hl.config({
		device = {
			name = touchpad,
			enabled = touchpad_enabled,
		},
	})
	if touchpad_enabled then
		hl.exec_cmd("notify-send -u low -t 2000 'Touchpad' 'Enabled 󰟜'")
	else
		hl.exec_cmd("notify-send -u low -t 2000 'Touchpad' 'Disabled 󰟙'")
	end
end

hl.bind(modShift .. " + F23", function()
	toggle_touchpad()
end)

-- Focus movement (vim-style)
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move window (vim-style)
hl.bind(modShift .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(modShift .. " + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(modShift .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(modShift .. " + L", hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces / move window to workspace (1-10)
local function switch_workspace(n)
	local monitor = hl.get_active_monitor()
	local offset
	if monitor.name == "DP-1" then
		offset = 0
	elseif monitor.name == "DP-3" then
		offset = 10
	elseif monitor.name == "eDP-1" then
		offset = 20
	else
		offset = 30
	end
	hl.dispatch(hl.dsp.focus({ workspace = n + offset }))
end

local function move_to_workspace(n)
	local monitor = hl.get_active_monitor()
	local offset
	if monitor.name == "DP-1" then
		offset = 0
	elseif monitor.name == "DP-3" then
		offset = 10
	elseif monitor.name == "eDP-1" then
		offset = 20
	else
		offset = 30
	end
	hl.dispatch(hl.dsp.window.move({ workspace = n + offset }))
end

for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(mod .. " + " .. key, function()
		switch_workspace(i)
	end)
	hl.bind(modShift .. " + " .. key, function()
		move_to_workspace(i)
	end)
end

-- Special workspace (scratchpad)
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(modShift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mouse wheel
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Drag / resize windows with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia & brightness (repeating + works on lock screen)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Playerctl (media controls)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------
---- WINDOW RULES ----
--------------------

-- Ignore maximize requests from all apps
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Hyprland-run floating terminal
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

-- Audio control floating
hl.window_rule({
	name = "floating-audio-control",
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	center = true,
	size = "1000 650",
})

-- File picker floating
hl.window_rule({
	name = "floating-file-picker",
	match = {
		class = "^(.*)$",
		title = "^(Open Files?|Open|Open Folder|Save|Save As|Save Files?|Export|Import|Choose File|Rename|Location|Select a folder)$",
	},
	float = true,
	center = true,
})

-- XDG portal floating
hl.window_rule({
	name = "floating-xdg",
	match = { class = "^([xX]dg-desktop-portal-gtk|[xX]dg-desktop-portal-hyprland)$" },
	float = true,
	center = true,
})

-- GTK portal no border
hl.window_rule({
	name = "gtk-no-border",
	match = { class = "^(Xdg-desktop-portal-gtk)$" },
	border_size = 0,
})

-- swaync no border
hl.window_rule({
	name = "swaync-no-border",
	match = { class = "^(swaync)$" },
	border_size = 0,
})

--------------------
---- WORKSPACES ----
--------------------

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
