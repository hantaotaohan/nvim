local present, blankline = pcall(require, "indent_blankline")

if not present then
    return
end

local options = {

    indentLine_enabled = 1,

    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "",
    },

    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
}

vim.cmd[[ highlight IndentBlanklineContextStart guibg=#3E4452 gui=bold ]]

require "indent_blankline".setup(options)
