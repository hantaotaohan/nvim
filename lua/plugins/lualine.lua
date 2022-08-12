local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        show_filename_only = true,   -- Shows shortened relative path when set to false.
        hide_filename_extension = false,   -- Hide filename extension when set to true.
        show_modified_status = true, -- Shows indicator when the buffer is modified.
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = {},
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        symbols = {
            modified = ' ●',      -- Text to show when the buffer is modified
            alternate_file = '#', -- Text to show to identify the alternate file
            directory =  '',     -- Text to show when the buffer is a directory
        },

        filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha'
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

        buffers_color = {
            -- Same values as the general color option can be used here.
            active = 'lualine_{section}_normal',     -- Color for active buffer.
            inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
