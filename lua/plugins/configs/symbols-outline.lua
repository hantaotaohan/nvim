local present, symbols_outline = pcall(require, "symbols-outline")

if not present then
    return
end

local options = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = "right",
    width = 20,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "<LoaclLeader>q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "p",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
}

symbols_outline.setup(options)
