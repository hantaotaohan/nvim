vim.cmd "packadd packer.nvim"

local plugins = {

    ---------------------------------------------------------------------------
    -- 加速插件 --
    ---------------------------------------------------------------------------

    {
        "lewis6991/impatient.nvim",
        disable = false,
    },

    ---------------------------------------------------------------------------
    -- 插件管理器 --
    ---------------------------------------------------------------------------

    {
        "wbthomason/packer.nvim", 
        disable = false,
        cmd = require("core.lazyload").packer_cmds,
        config = function()
            require "plugins"
        end,
    },

    ---------------------------------------------------------------------------
    -- 模糊搜索插件依赖项
    ---------------------------------------------------------------------------
    { 
        "nvim-lua/plenary.nvim", 
        disable = false,
        module = "plenary" 
    },

    ---------------------------------------------------------------------------
    -- 模糊搜索插件
    ---------------------------------------------------------------------------
    { 
        "nvim-telescope/telescope.nvim", 
        disable = false,
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end,
    },

    ---------------------------------------------------------------------------
    -- 颜色主题
    ---------------------------------------------------------------------------
    {
        "hantaotaohan/onedark.nvim", 
        disable = false,
        config = function()
            require "plugins.configs.onedark"
        end,
    },

    ---------------------------------------------------------------------------
    -- 标签页插件
    ---------------------------------------------------------------------------
    {
        "akinsho/bufferline.nvim", 
        disable = false,
        tag = "v2.*",
        config = function()
            require "plugins.configs.bufferline"
        end,
    },

    ---------------------------------------------------------------------------
    -- 状态栏插件
    ---------------------------------------------------------------------------
    {
        "nvim-lualine/lualine.nvim", 
        disable = false,
        config = function()
            require "plugins.configs.lualine"
        end,
    },

    ---------------------------------------------------------------------------
    -- 文件浏览器
    ---------------------------------------------------------------------------
    {
        "kyazdani42/nvim-tree.lua",
        disable = false,
        ft = "alpha",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.configs.nvim-tree"
        end,
    },

    ---------------------------------------------------------------------------
    -- 标签浏览器
    ---------------------------------------------------------------------------
    {
        'stevearc/aerial.nvim',
        disable = false,
        opt = true,
        after = "nvim-lspconfig",
        config = function()
            require "plugins.configs.aerial"
        end,
    },

    ---------------------------------------------------------------------------
    -- 终端插件
    ---------------------------------------------------------------------------
    {
        "akinsho/toggleterm.nvim", tag = 'v2.*',
        disable = false,
        config = function()
            require "plugins.configs.toggleterm"
        end,

    },

    ---------------------------------------------------------------------------
    -- 代码运行插件
    ---------------------------------------------------------------------------
    {
        'CRAG666/code_runner.nvim',
        disable = false,
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require "plugins.configs.coderunner"
        end,


    },

    ---------------------------------------------------------------------------
    -- 缩进提示插件
    ---------------------------------------------------------------------------
    {
        "lukas-reineke/indent-blankline.nvim",
        disable = false,
        opt = true,
        setup = function()
            require("core.lazyload").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require "plugins.configs.blankline"
        end,

    },

    ---------------------------------------------------------------------------
    -- 关闭标签页插件 --
    ---------------------------------------------------------------------------

    {
        'mhinz/vim-sayonara',
        disable = false,
    },

    ---------------------------------------------------------------------------
    -- 差异显示插件 --
    ---------------------------------------------------------------------------

    {
        'lewis6991/gitsigns.nvim', 
        disable = false,
        ft = "gitcommit", 
        event = "BufRead",
        config = function()
            require('gitsigns').setup()
        end,
    },

    ---------------------------------------------------------------------------
    -- 注释插件
    ---------------------------------------------------------------------------
    {
        "numToStr/Comment.nvim",
        disable = false,
        config = function()
            require "plugins.configs.comment"
        end,

    },

    ---------------------------------------------------------------------------
    -- 快捷键提示插件
    ---------------------------------------------------------------------------
    { 
        "folke/which-key.nvim", 
        disable = false,
        module = "which-key",
        keys = "<localleader>",
        config = function()
            require "plugins.configs.whichkey"
        end,
    },

    ---------------------------------------------------------------------------
    -- 语法渲染插件
    ---------------------------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter", 
        disable = false,
        module = "nvim-treesitter", 
        -- run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },     -- Syntax highlighting


    ---------------------------------------------------------------------------
    -- LSP
    ---------------------------------------------------------------------------

    {
        "williamboman/mason.nvim",
        disable = false,
        config = function()
            require "plugins.configs.mason"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        disable = false,
        opt = true,
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    ---------------------------------------------------------------------------
    -- Load Luasnips + CMP Related In Insert Mode Only
    ---------------------------------------------------------------------------

    {
        "rafamadriz/friendly-snippets",
        disable = false,
        module = { "cmp", "cmp_nvim_lsp" },
        event = "InsertEnter",
    },

    {
        "hrsh7th/nvim-cmp",
        disable = false,
        after = "friendly-snippets",
        config = function()
            require "plugins.configs.cmp"
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        disable = false,
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            require("plugins.configs.luasnip")
        end,
    },

    {
        "saadparwaiz1/cmp_luasnip",
        disable = false,
        after = "LuaSnip",
    },

    { 
        "hrsh7th/cmp-nvim-lua",
        disable = false,
        after = "cmp_luasnip",
    },

    {
        "hrsh7th/cmp-nvim-lsp",
        disable = false,
        after = "cmp-nvim-lua",
    },

    {
        "hrsh7th/cmp-buffer",
        disable = false,
        after = "cmp-nvim-lsp",
    },

    {
        "hrsh7th/cmp-path",
        disable = false,
        after = "cmp-buffer",
    },

    ---------------------------------------------------------------------------
    -- misc plugins
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- 自动补全括号
    ---------------------------------------------------------------------------
    {
        "windwp/nvim-autopairs",
        disable = false,
        after = "nvim-cmp",
        config = function()
            require("plugins.configs.autopairs")
        end,
    },

    ---------------------------------------------------------------------------
    -- 欢迎页
    ---------------------------------------------------------------------------
    {
        "goolord/alpha-nvim",
        disable = false,
        after = "onedark.nvim",
        config = function()
            require "plugins.configs.alpha"
        end,
    },
    ---------------------------------------------------------------------------
    -- 快速修改匹配括号
    ---------------------------------------------------------------------------

    {
        "kylechui/nvim-surround",
        disable = false,
        config = function()
            require("nvim-surround").setup()
        end,
    },

    ---------------------------------------------------------------------------
    -- 记住光标位置
    ---------------------------------------------------------------------------

    {
        "vladdoster/remember.nvim",
        disable = false,
        config = function()
            require "plugins.configs.remember"
        end,
    },

    ---------------------------------------------------------------------------
}

require("core.packer").run(plugins)
