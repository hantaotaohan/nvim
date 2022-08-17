local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local colors = {
    black = '#282C34',
    black_1 = '#30363f',
    red = '#E06c75',
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < 'x'
        for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = colors.black, bg = colors.black } })
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = '' } or { left = '' }
        end
    end
    return sections
end

lualine.setup {
    options = {
        icons_enabled = false,
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
    sections = process_sections {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', '%r'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},

        lualine_b = {
            'branch',
            {
                'diff',
                colored = true, -- Displays a colored diff status if set to true
                symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
                source = nil, -- A function that works as a data source for diff.
                -- It must return a table as such:
                --   { added = add_count, modified = modified_count, removed = removed_count }
                -- or nil on failure. count <= 0 won't be displayed.
                color = { fg = colors.black_1, bg = colors.black_1 }
            },
            {
                '%R',
                cond = function()
                return vim.o.readonly
                end,
                color = { fg = colors.red, bg = colors.black_1 }
            },

            "diagnostics"

        },
        lualine_c = {
            {
                'filename',
                file_status = true,      -- Displays file status (readonly status, modified status)
                newfile_status = false,   -- Display new file status (new file means no write after created)
                path = 3,                -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory

                shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '  [+]',      -- Text to show when the buffer is modified
                    alternate_file = '#', -- Text to show to identify the alternate file
                    directory =  'DIRECTORY',     -- Text to show when the buffer is a directory
                    readonly = 'ReadOnly',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]'     -- Text to show for new created file before first writting
                },
            },



        }
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

    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },

    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },


    extensions = {'quickfix','nvim-tree'}
}
