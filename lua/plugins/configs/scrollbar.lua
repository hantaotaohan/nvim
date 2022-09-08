local present, scrollbar = pcall(require, "scrollbar")

if not present then
    return
end

local options = {

    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    handle = {
        text = " ",
        color = "#323641",
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Search = {
            text = { "█" },
            priority = 0,
            color = nil,
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "▕" },
            priority = 1,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "▕" },
            priority = 2,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "▕" },
            priority = 3,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "▕" },
            priority = 4,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "▕" },
            priority = 5,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
        GitAdd = {
            color = "#186B50",
            text = { "▍" },
            priority = 5,
            cterm = nil,
            highlight = "CursorColumn",
        },
        GitDelete = {
            color = "#6a3037",
            text = { "▍" },
            priority = 5,
            cterm = nil,
            highlight = "CursorColumn",
        },
        GitChange = {
            color = "#67634c",
            text = { "▍" },
            priority = 5,
            cterm = nil,
            highlight = "CursorColumn",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "NvimTree",
        "alpha",
        "packer",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        diagnostic = true,
        search = false, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
        git = true,
    },
}

scrollbar.setup(options)

require("packer").loader("gitsigns.nvim")
local gitsign = require('gitsigns')
local gitsign_hunks = require('gitsigns.hunks')

require('scrollbar.handlers').register('git', function(bufnr)
    local nb_lines = vim.api.nvim_buf_line_count(bufnr)
    local colors_type = {
        add = 'GitAdd',
        delete = 'GitDelete',
        change = 'GitChange',
        changedelete = 'GitChange'
    }

    local lines = {}
    local hunks = gitsign.get_hunks(bufnr)
    if hunks then
        for _, hunk in ipairs(hunks) do
            hunk.vend = math.min(hunk.added.start, hunk.removed.start) + hunk.added.count + hunk.removed.count
            local signs = gitsign_hunks.calc_signs(hunk, 0, nb_lines)
            for _, sign in ipairs(signs) do
                table.insert(lines, {
                    line = sign.lnum,
                    type = colors_type[sign.type]
                })
            end
        end
    end
    return lines
end)
