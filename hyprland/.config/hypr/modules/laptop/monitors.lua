-- Laptop monitor
hl.monitor({ output = "eDP-1", mode = "1920x1080@144.15", position = "0x0", scale = 1 })
-- Laptop external monitor (mirrored)
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0", scale = 1, mirror = "eDP-1" })
