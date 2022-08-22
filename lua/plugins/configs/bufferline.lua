local present, bufferline = pcall(require, "bufferline")

if not present then
    return
end

local options = {
    options = {
        numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = "┃",
        buffer_close_icon = "✖",
        modified_icon = "●",
        close_icon = "",
        -- close_icon = '',
        -- left_trunc_marker = "",
        -- right_trunc_marker = "",
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        --   -- remove extension from markdown files for example
        --   if buf.name:match('%.md') then
        --     return vim.fn.fnamemodify(buf.name, ':t:r')
        --   end
        -- end,
        max_name_length = 25,
        max_prefix_length = 25, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = false, -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   return "("..count..")"
        -- end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number)
        --   -- filter out filetypes you don't want to see
        --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --     return true
        --   end
        --   -- filter out by buffer name
        --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --     return true
        --   end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --     return true
        --   end
        -- end,
        offsets = { { filetype = "NvimTree", text = "NvimTree", padding = 1, highlight = "BufferLineFill", text_align = "center"  } },
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = { '', '' }, -- slant | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --   -- add custom logic
        --   return buffer_a.modified > buffer_b.modified
        -- end
    },
    highlights = {

        -- fill                  = { fg = '#606B70', bg = '#1E2227' },
        -- background            = { fg = '#606B70', bg = None },

        fill                  = {  bg = '#1E2227' },
        background            = {  bg = none },

        -- close_button          = { fg = '#606B70', bg = '#1E2227' },
        -- close_button_visible  = { fg = '#606B70', bg = '#1E2227' },
        -- close_button_selected = { fg = '#DCDCDC', bg = '#23272E' },



        buffer_visible        = { fg = '#606B70', bg = '#1E2227' },
        buffer_selected       = { fg = '#DCDCDC', bg = '#23272E', bold = true, italic = false },

        numbers_visible       = { fg = '#606B70', bg = '#1E2227' },
        numbers_selected      = { fg = '#DCDCDC', bg = '#23272E', bold = true, italic = false },
        -- 
        --
        modified              = { fg = '#E2B86B'},
        modified_visible      = { fg = '#E2B86B', bg = '#1E2227' },
        modified_selected     = { fg = '#E2B86B', bg = '#23272E' },
        --
        --            separator             = { bg = '#23272E' },
        --            separator_visible     = { fg = '#606B70', bg = '#1E2227' },
        --            separator_selected    = { fg = '#DCDCDC', bg = '#23272E' },

        -- indicator_visible     = { fg = '#61AFEF', bg = '#1E2227' },
        indicator_selected    = { fg = '#61AFEF', bg = '#23272E' },

    },
}

require "bufferline".setup(options)