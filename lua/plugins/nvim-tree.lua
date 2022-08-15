local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    -- update_to_buf_dir = {
    --   enable = false,
    -- },
    hijack_unnamed_buffer_when_opening = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    prefer_startup_root = true,
    -- open_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    -- auto_close = true,
    -- open_on_tab = false,
    -- hijack_cursor = false,
    update_cwd = true,
    -- update_to_buf_dir = {
    --   enable = true,
    --   auto_open = true,
    -- },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    -- system_open = {
    --   cmd = nil,
    --   args = {},
    -- },
    -- filters = {
    --   dotfiles = false,
    --   custom = {},
    -- },
    git = {
        enable = true,
        ignore = false, --Show folders that are ignored in .gitignore
        timeout = 500,
    },
    view = {
        width = 30,
        height = 20,
        hide_root_folder = false,
        side = "left",
        -- auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                { key = { "<CR>"},                        action = "edit" },
                { key = "O",                              action = "edit_no_picker" },
                { key = { "C"},                           action = "cd" },
                { key = "<C-v>",                          action = "vsplit" },
                { key = "<C-x>",                          action = "split" },
                { key = "<C-t>",                          action = "tabnew" },
                { key = "<BS>",                           action = "close_node" },
                { key = "p",                              action = "preview" },
                { key = "H",                              action = "toggle_dotfiles" },
                { key = "R",                              action = "refresh" },
                { key = "a",                              action = "create" },
                { key = "d",                              action = "remove" },
                { key = "D",                              action = "trash" },
                { key = "r",                              action = "rename" },
                { key = "<C-r>",                          action = "full_rename" },
                { key = "x",                              action = "cut" },
                { key = "c",                              action = "copy" },
                { key = "p",                              action = "paste" },
                { key = "y",                              action = "copy_name" },
                { key = "Y",                              action = "copy_path" },
                { key = "gy",                             action = "copy_absolute_path" },
                { key = "u",                              action = "dir_up" },
                { key = "s",                              action = "system_open" },
                { key = "f",                              action = "live_filter" },
                { key = "F",                              action = "clear_live_filter" },
                { key = ";q",                             action = "close" },
                { key = "W",                              action = "collapse_all" },
                { key = "E",                              action = "expand_all" },
                { key = "S",                              action = "search_node" },
                { key = ".",                              action = "run_file_command" },
                { key = "<C-k>",                          action = "toggle_file_info" },
                { key = "g?",                             action = "toggle_help" },
                { key = "m",                              action = "toggle_mark" },
            },
        },
        number = false,
        relativenumber = false,
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "all",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
            symlink_arrow = " ➛ ",
            show = {
                file = false,
                folder = false,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    arrow_closed = "◆",
                    arrow_open = "◇",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "M",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
    },
}

-- 关闭最后一个buffer时 自动退出nvim-tree
vim.o.confirm = true
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("quit") end
    end
})
