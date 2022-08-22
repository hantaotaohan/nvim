-------------------------------------------------------------------------------
                           -- Startup Performance --
-------------------------------------------------------------------------------

vim.defer_fn(function()
    pcall(require, "impatient")
end, 0)

-------------------------------------------------------------------------------
                            -- Gloabl Performance --
-------------------------------------------------------------------------------

require "core.options"
require "core.autocmd"

-------------------------------------------------------------------------------
                       -- Setup Packer Install Plugins --
-------------------------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
    print "Cloning Packer ..."
    fn.system { "git", "clone", "--depth", "1", "https://hub.fastgit.xyz/wbthomason/packer.nvim", install_path }
    vim.cmd "packadd packer.nvim"
    require "plugins"
    vim.cmd "PackerSync"
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]])

-------------------------------------------------------------------------------
                            -- Import Key Mapping --
-------------------------------------------------------------------------------

require "core.keymaps"

-------------------------------------------------------------------------------
                           -- Import Autocommands --
-------------------------------------------------------------------------------

require "core.autocmd"

-------------------------------------------------------------------------------
                             -- Import Functions --
-------------------------------------------------------------------------------

-- require "plugins.functions"

