local utils = {}

-- Get system hostname
local handle = io.popen("uname -n")
utils.hostname = handle and handle:read("*l") or ""
if handle then
	handle:close()
end

return utils
