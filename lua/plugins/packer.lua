local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })

if fn.empty(fn.glob(install_path)) > 0 then
    print "Cloning packer .."
    PACKER_BOOTSTRAP = fn.system ({ "git", "clone", "--depth", "1", "https://hub.fastgit.xyz/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd ([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- -- Performance
-- pcall(require, "impatient") -- Call impatient plugin before all others to improve performance. Keep this line here.

-- Have packer use a popup window
packer.init {
    auto_clean = true,
    compile_on_sync = true,
    git = {
        clone_timeout = 60,
        default_url_format = 'https://hub.fastgit.xyz/%s'
    },
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)

    ---------------------
    -- Package Manager --
    ---------------------

    use "wbthomason/packer.nvim"                       -- Packer manage itself

    ----------------------
    -- Dependencies --
    ----------------------

    -- use { "nvim-lua/plenary.nvim", module = "plenary" }
    -- use { 'kyazdani42/nvim-web-devicons', module = "nvim-web-devicons" }
    -- use { 'lewis6991/impatient.nvim' }

    ----------------------
    -- General --
    ----------------------

    -- use { "folke/which-key.nvim", module = "which-key" }

    -----------------------------------------------
    -- Themes, Icons, Tree, Statusbar, Bufferbar --
    -----------------------------------------------

    -- Colorschemes
    use { "navarasu/onedark.nvim"  }


    -- Buffer (Tab) line
    use { "akinsho/bufferline.nvim", tag = "v2.*" }

    -- Status Line
    use { 'nvim-lualine/lualine.nvim' }

    use { 'famiu/bufdelete.nvim', config = function() require('bufdelete').bufdelete(0, true) end , }

    
    --Dashboard
    -- use { "goolord/alpha-nvim", after = "colorscheme", disable = false }

    --------------------------------------
    -- File Navigation and Fuzzy Search --
    --------------------------------------

    -- Nvim Tree
    use { "kyazdani42/nvim-tree.lua", tag = 'nightly' }

    -- Telescope
    use { "nvim-telescope/telescope.nvim", cmd = "Telescope" }

    --------------------------------------
    -- Autocompletion --
    --------------------------------------

    -- use { "rafamadriz/friendly-snippets", event = "InsertEnter" }
    -- use { "hrsh7th/nvim-cmp",  after = "friendly-snippets" }                                             -- Completion (cmp) plugin
    -- use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }                                                 -- Cmp source for buffer words
    -- use { "hrsh7th/cmp-path", after = "cmp-buffer" }                                                     -- Cmp source for path
    -- use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }                                               -- Cmp source for LSP client
    -- use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }                                                -- Cmp source for nvim lua
    -- use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }                                                -- Luasnip completion source
    -- use { "L3MON4D3/LuaSnip", wants = "friendly-snippets",  after = "nvim-cmp" }

    --------------------------------------
    -- LSP --
    --------------------------------------

    -- use { "neovim/nvim-lspconfig", opt = true }                         -- Enable native LSP

    --------------------------------------
    -- Features --
    --------------------------------------

    --Terminal
    -- use {"NvChad/nvterm", module = "nvterm" }

    --Show colors
    -- use {"norcalli/nvim-colorizer.lua", opt = true, event = "BufRead"}

    --------------------------------------
    -- Editing --
    --------------------------------------

    --Commenting
    -- use {'numToStr/Comment.nvim', module = "Comment", keys = { "gc", "gb" },
    --     config = function()
    --         require('Comment').setup()
    --     end
    -- }

    --------------------------------------
    -- Git --
    --------------------------------------
    -- use {
    --     'lewis6991/gitsigns.nvim', ft = "gitcommit", event = "BufRead",
    --     config = function()
    --         require('gitsigns').setup()
    --     end
    -- }

    -----------------------------------
    -- Treesitter --
    -----------------------------------

    -- Treesitter 
    -- use {"nvim-treesitter/nvim-treesitter", module = "nvim-treesitter", run = ":TSUpdate"}      -- Syntax highlighting
    -- use {"windwp/nvim-autopairs", after = "nvim-cmp"}                                           -- Autoclose quotes, parentheses etc.


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
  end)
  
