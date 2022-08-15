-- Startup performance
vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

-- require "plugins.impatient"

-- Nvim Settings
require "core.options"
require "core.keymaps"

-- Plugins
require "plugins.packer"

-- Plugin settings
-- require "plugins.lsp"
-- require "plugins.cmp"
require "plugins.colorscheme"
-- require "plugins.autocommands"
require "plugins.telescope"
require "plugins.treesitter"
-- require "plugins.autopairs"
require "plugins.nvim-tree"
require "plugins.bufferline"
require "plugins.lualine"
require "plugins.fterm"
-- require "plugins.project"
-- require "plugins.dashboard"
-- require "plugins.whichkey"
-- require "plugins.colorizer"
-- require "plugins.spectre"
-- require "plugins.zen-mode"
-- require "plugins.symbol-outline"
-- require "plugins.functions"
