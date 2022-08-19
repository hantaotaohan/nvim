-------------------------
-- Startup performance --
-------------------------
vim.defer_fn(function()
    pcall(require, "impatient")
end, 0)

-- 全局设置
require "core.options"
require "core.autocmd"

-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
    print "Cloning packer .."
    fn.system { "git", "clone", "--depth", "1", "https://hub.fastgit.xyz/wbthomason/packer.nvim", install_path }

    -- install plugins + compile their configs
    vim.cmd "packadd packer.nvim"
    require "plugins"
    vim.cmd "PackerSync"
end

-- 快捷键设置
require "core.keymaps"

-- 自动命令设置
-- require "plugins.autocommands"

-- 自定义函数设置
-- require "plugins.functions"

