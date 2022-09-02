local present, glow = pcall(require, "glow")

if not present then
    return
end

local options = {
    -- glow_path = "", -- filled automatically with your glow bin in $PATH,
    -- glow_install_path = "~/.local/bin", -- default path for installing glow binary
    border = "shadow", -- floating window border config
    style = "dark", -- filled automatically with your current editor background, you can override using glow json style
    pager = false,
    width = 80,
}

require "glow".setup(options)
