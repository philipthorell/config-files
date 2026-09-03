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
