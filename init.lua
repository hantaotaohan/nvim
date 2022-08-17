-------------------------
-- Startup performance --
-------------------------
vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

-- 全局设置
require "core.options"

-- 快捷键设置
require "core.keymaps"

-- 插件管理器
require "plugins.packer"

-- 主题设置
require "plugins.colorscheme"

-- 自动命令设置
require "plugins.autocommands"

-------------------------
--  Plugins settings   --
-------------------------

-- require "plugins.lsp"
-- require "plugins.cmp"
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

-- 自定义函数设置
require "plugins.functions"
