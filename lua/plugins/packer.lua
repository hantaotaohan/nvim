local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://hub.fastgit.xyz/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim'
    use 'navarasu/onedark.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lua/plenary.nvim'

    config = {
        auto_reload_compiled = true,
        -- plugin_package = 'packer',
        max_jobs = nil, 
        auto_clean = true,
        -- profile = {
            -- enable = true,
            -- threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
        -- },
        git = {
            -- cmd = 'git', -- The base command for git operations
            -- subcommands = { -- Format strings for git subcommands
            --     update         = 'pull --ff-only --progress --rebase=false',
            --     install        = 'clone --depth %i --no-single-branch --progress',
            --     fetch          = 'fetch --depth 999999 --progress',
            --     checkout       = 'checkout %s --',
            --     update_branch  = 'merge --ff-only @{u}',
            --     current_branch = 'branch --show-current',
            --     diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
            --     diff_fmt       = '%%h %%s (%%cr)',
            --     get_rev        = 'rev-parse --short HEAD',
            --     get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
            --     submodules     = 'submodule update --init --recursive --progress'
            -- },
            depth = 1, -- Git clone depth
            clone_timeout = 60, -- Timeout, in seconds, for git clones
            default_url_format = 'https://hub.fastgit.xyz/%s' -- Lua format string used for "aaa/bbb" style plugins
        },
        display = {
            -- non_interactive = false, -- If true, disable display windows for all operations
            -- open_fn  = nil, -- An optional function to open a window for packer's display
            open_fn = require('packer.util').float,
            open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
            working_sym = '⟳⟳⟳', -- The symbol for a plugin being installed/updated
            error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
            done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
            removed_sym = '-', -- The symbol for an unused plugin which was removed
            moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
            header_sym = '━', -- The symbol for the header line in packer's display
            show_all_info = true, -- Should packer show all update details automatically?
            prompt_border = 'double', -- Border style of prompt popups.
            keybindings = { -- Keybindings for the display window
                quit = 'q',
                toggle_info = '<CR>',
                diff = 'd',
                prompt_revert = 'r',
            }
        },
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
