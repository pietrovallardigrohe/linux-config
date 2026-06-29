local platform = require("utils.platform")

---@type Config
local options = {
	default_prog = {},
	launch_menu = {},
}

if platform.is_win then
	options.default_prog = { "pwsh", "-NoLogo" }
	options.launch_menu = {
		{ label = "PowerShell Core", args = { "pwsh", "-NoLogo" } },
		{ label = "PowerShell Desktop", args = { "powershell" } },
	}
elseif platform.is_mac then
	options.default_prog = { "/opt/homebrew/bin/fish", "-l" }
	options.launch_menu = {
		{ label = "Zsh", args = { "zsh", "-l" } },
	}
elseif platform.is_linux then
	options.default_prog = { "zsh", "-l" }
	options.launch_menu = {
		{ label = "Zsh", args = { "zsh", "-l" } },
		{ label = "Bash", args = { "bash", "-l" } },
	}
end

return options
