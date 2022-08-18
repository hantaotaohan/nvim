vim.cmd "packadd packer.nvim"

local plugins = {

    -- 加速插件
    {
        "lewis6991/impatient.nvim"
    },

    -- 模糊搜索插件
    { 
        "nvim-telescope/telescope.nvim", 
        cmd = "Telescope",
        config = function()
        require "plugins.configs.telescope"
        end,
    },

    -- 模糊搜索插件依赖项
    { 
        "nvim-lua/plenary.nvim", 
        module = "plenary" 
    },

    -- 插件管理器
    {
        "wbthomason/packer.nvim", 
        cmd = require("core.lazyload").packer_cmds,
        config = function()
            require "plugins"
        end,
    },

    -- 颜色主题
    {
        "hantaotaohan/onedark.nvim", 
        config = function()
            require "plugins.configs.onedark"
        end,
    },

    -- 标签页插件
    {
        "akinsho/bufferline.nvim", 
        tag = "v2.*",
        config = function()
            require "plugins.configs.bufferline"
        end,
    },

    -- 状态栏插件
    {
        "nvim-lualine/lualine.nvim", 
        config = function()
            require "plugins.configs.lualine"
        end,
    },

    -- 文件浏览器
    {
        "kyazdani42/nvim-tree.lua",
        ft = "alpha",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.configs.nvim-tree"
        end,
    },

    -- 终端插件
    {
        "numToStr/FTerm.nvim",
        config = function()
            require "plugins.configs.fterm"
        end,

    },

    -- 缩进提示插件
    {
        "lukas-reineke/indent-blankline.nvim",
        opt = true,
        setup = function()
            require("core.lazyload").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require "plugins.configs.blankline"
        end,

    },

    -- 关闭标签页插件
    {
        'mhinz/vim-sayonara'
    },

    -- 差异显示插件
    {
        'lewis6991/gitsigns.nvim', 
        ft = "gitcommit", 
        event = "BufRead",
        config = function()
            require('gitsigns').setup()
        end,
    },
}

require("core.packer").run(plugins)


---------------------------------------------------------------------------------------------

---- Install your plugins here
--return packer.startup(function(use)

--    ---------------------
--    -- Package Manager --
--    ---------------------

--    use "wbthomason/packer.nvim"

--    ----------------------
--    -- Impatient --
--    ----------------------

--    use { 'lewis6991/impatient.nvim' }

--    ----------------------
--    -- Dependencies --
--    ----------------------

--    use { "nvim-lua/plenary.nvim", module = "plenary" }
--    -- use { 'kyazdani42/nvim-web-devicons', module = "nvim-web-devicons" }

--    ----------------------
--    -- General --
--    ----------------------

--    -- use { "folke/which-key.nvim", module = "which-key" }

--    -----------------------------------------------
--    -- Themes, Icons, Tree, Statusbar, Bufferbar --
--    -----------------------------------------------

--    -- Colorschemes - onedark
--    use { "hantaotaohan/onedark.nvim",
--    config = function()
--        local status_ok, onedark = pcall(require, "onedark")
--        if status_ok then
--            require('onedark').load()
--        end
--    end, 
--}

---- Buffer (Tab) line
--use { "akinsho/bufferline.nvim", tag = "v2.*" }

---- Status Line
--use { 'nvim-lualine/lualine.nvim' }

---- BUffer Delete Sayonara
--use { 'mhinz/vim-sayonara' }


----Dashboard
---- use { "goolord/alpha-nvim", after = "colorscheme", disable = false }

----------------------------------------
---- File Navigation and Fuzzy Search --
----------------------------------------

---- Nvim Tree
--use { "kyazdani42/nvim-tree.lua", tag = 'nightly' }

---- Telescope
--use { "nvim-telescope/telescope.nvim", cmd = "Telescope" }

----------------------------------------
---- Autocompletion --
----------------------------------------

---- use { "rafamadriz/friendly-snippets", event = "InsertEnter" }
---- use { "hrsh7th/nvim-cmp",  after = "friendly-snippets" }                                             -- Completion (cmp) plugin
---- use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }                                                 -- Cmp source for buffer words
---- use { "hrsh7th/cmp-path", after = "cmp-buffer" }                                                     -- Cmp source for path
---- use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }                                               -- Cmp source for LSP client
---- use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }                                                -- Cmp source for nvim lua
---- use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }                                                -- Luasnip completion source
---- use { "L3MON4D3/LuaSnip", wants = "friendly-snippets",  after = "nvim-cmp" }

----------------------------------------
---- LSP --
----------------------------------------

---- use { "neovim/nvim-lspconfig", opt = true }                         -- Enable native LSP

----------------------------------------
---- Features --
----------------------------------------

----Terminal
--use {"numToStr/FTerm.nvim"}

----Show colors
---- use {"norcalli/nvim-colorizer.lua", opt = true, event = "BufRead"}

----------------------------------------
---- Editing --
----------------------------------------

---- Commenting
--use {'numToStr/Comment.nvim', module = "Comment", keys = { "gc", "gb" },
--config = function()
--    require('Comment').setup()
--end
--    }

--    --------------------------------------
--    -- Git --
--    --------------------------------------
--    use {
--        'lewis6991/gitsigns.nvim', ft = "gitcommit", event = "BufRead",
--        config = function()
--            require('gitsigns').setup()
--        end
--    }

--    -----------------------------------
--    -- Treesitter --
--    -----------------------------------

--    -- Treesitter 
--    use {"nvim-treesitter/nvim-treesitter", module = "nvim-treesitter", run = ":TSUpdate"}      -- Syntax highlighting
--    -- use {"windwp/nvim-autopairs", after = "nvim-cmp"}                                           -- Autoclose quotes, parentheses etc.


--    -- Automatically set up your configuration after cloning packer.nvim
--    -- Put this at the end after all plugins
--    if PACKER_BOOTSTRAP then
--        require("packer").sync()
--    end
--end)

