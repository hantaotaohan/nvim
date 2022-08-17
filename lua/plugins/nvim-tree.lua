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
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  ignore_buf_on_tab_change = {},
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "disable", -- function(bufnr). If nil, will use the deprecated mapping strategy
  remove_keymaps = false, -- boolean (disable totally or not) or list of key (lhs)
  view = {
    adaptive_size = true,
    centralize_selection = false,
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    -- @deprecated
    mappings = {
      custom_only = true,
      list = {
        { key = {"<CR>","o"}   ,     action = "edit"               },
        { key = "O"            ,     action = "edit_no_picker"     },
        { key = "C"            ,     action = "cd"                 },
        { key = "<C-v>"        ,     action = "vsplit"             },
        { key = "<C-x>"        ,     action = "split"              },
        { key = "<C-t>"        ,     action = "tabnew"             },
        { key = "<BS>"         ,     action = "close_node"         },
        { key = "go"           ,     action = "preview"            },
        { key = "H"            ,     action = "toggle_dotfiles"    },
        { key = "R"            ,     action = "refresh"            },
        { key = "a"            ,     action = "create"             },
        { key = "d"            ,     action = "remove"             },
        { key = "D"            ,     action = "trash"              },
        { key = "r"            ,     action = "rename"             },
        { key = "<C-r>"        ,     action = "full_rename"        },
        { key = "x"            ,     action = "cut"                },
        { key = "c"            ,     action = "copy"               },
        { key = "p"            ,     action = "paste"              },
        { key = "y"            ,     action = "copy_name"          },
        { key = "Y"            ,     action = "copy_path"          },
        { key = "gy"           ,     action = "copy_absolute_path" },
        { key = "u"            ,     action = "dir_up"             },
        { key = "s"            ,     action = "system_open"        },
        { key = "/"            ,     action = "live_filter"        },
        { key = "<Esc>"        ,     action = "clear_live_filter"  },
        { key = ";q"           ,     action = "close"              },
        { key = "W"            ,     action = "collapse_all"       },
        { key = "E"            ,     action = "expand_all"         },
        { key = "S"            ,     action = "search_node"        },
        { key = "."            ,     action = "run_file_command"   },
        { key = "<C-k>"        ,     action = "toggle_file_info"   },
        { key = "g?"           ,     action = "toggle_help"        },
        { key = "m"            ,     action = "toggle_mark"        },
      },
    },
    float = {
      enable = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
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
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = false,
        folder = true,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "▐",
        folder = {
          arrow_closed = "+",
          arrow_open = "-",
          default = "▰ " ,
          open = "▱ " ,
          empty = "▰⚋",
          empty_open = "▱ ",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = " м",
          staged = " а",
          unmerged = " E",
          renamed = " R",
          untracked = " ★",
          deleted = " D",
          ignored = " I",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = false,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 10,
        row = 10,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[Search]: ",
    always_show_folders = false,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}


-- 关闭最后一个buffer时 自动退出nvim-tree
-- vim.o.confirm = true
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--   callback = function()
--     local layout = vim.api.nvim_call_function("winlayout", {})
--     if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("quit") end
--   end
-- })

-- 自定义高亮
local highlight = function(group, fg, bg, attr, sp)
  fg = fg and "guifg=" .. fg or "guifg=NONE"
  bg = bg and "guibg=" .. bg or "guibg=NONE"
  attr = attr and "gui=" ..attr or "gui=NONE"
  sp = sp and "guisp=" .. sp or ""

  vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr .. " " .. sp)
end

function NvimTreeHighlight()

-- Default linked group follows name.

highlight("NvimTreeSymlink"                    , nil        ,nil  ,nil  ,nil)
highlight("NvimTreeFolderName"                 , nil        ,nil  ,nil  ,nil)
highlight("NvimTreeRootFolder"                 , nil        ,nil  ,nil  ,nil)
highlight("NvimTreeFolderIcon"                 , "#61AFEF"  ,nil  ,nil  ,nil)
highlight("NvimTreeFileIcon"                   , "#ABB2BF"  ,nil  ,nil  ,nil)
highlight("NvimTreeEmptyFolderName"            , "#535965"  ,nil  ,nil  ,nil)   -- Directory
highlight("NvimTreeOpenedFolderName"           , nil        ,nil  ,nil  ,nil)   -- Directory
highlight("NvimTreeExecFile"                   , nil        ,nil  ,nil  ,nil)
highlight("NvimTreeOpenedFile"                 , nil        ,nil  ,nil  ,nil)
highlight("NvimTreeSpecialFile"                , nil        ,nil  ,nil  ,nil)
highlight("NvimTreeImageFile"                  , nil        ,nil  ,nil  ,nil)
highlight("NvimTreeIndentMarker"               , "#535965"  ,nil  ,nil  ,nil)

highlight("NvimTreeLspDiagnosticsError"        , nil        ,nil  ,nil  ,nil)   -- DiagnosticError 
highlight("NvimTreeLspDiagnosticsWarning"      , nil        ,nil  ,nil  ,nil)   -- DiagnosticWarn
highlight("NvimTreeLspDiagnosticsInformation"  , nil        ,nil  ,nil  ,nil)   -- DiagnosticInfo
highlight("NvimTreeLspDiagnosticsHint"         , nil        ,nil  ,nil  ,nil)   -- DiagnosticHint

highlight("NvimTreeGitDirty"                   , "#E5C07B"  ,nil  ,nil  ,nil)
highlight("NvimTreeGitStaged"                  , "#C678DD"  ,nil  ,nil  ,nil)
highlight("NvimTreeGitMerge"                   , "#56B6C2"  ,nil  ,nil  ,nil)
highlight("NvimTreeGitRenamed"                 , "#61AFEF"  ,nil  ,nil  ,nil)
highlight("NvimTreeGitNew"                     , "#98C379"  ,nil  ,nil  ,nil)
highlight("NvimTreeGitDeleted"                 , "#E06C75"  ,nil  ,nil  ,nil)
highlight("NvimTreeGitIgnored"                 , "#535965"  ,nil  ,nil  ,nil)   -- Comment

-- There are also links to normal bindings to style the tree itself.

-- highlight("NvimTreeNormal"                     , nil        ,nil  ,nil  ,nil) 
-- highlight("NvimTreeEndOfBuffer"                , nil        ,nil  ,nil  ,nil)   -- NonText
-- highlight("NvimTreeCursorLine"                 , nil        ,nil  ,nil  ,nil)   -- CursorLine
-- highlight("NvimTreeVertSplit"                  , nil        ,nil  ,nil  ,nil)   -- VertSplit
-- highlight("NvimTreeWinSeparator"               , nil        ,nil  ,nil  ,nil)   -- VertSplit
-- highlight("NvimTreeCursorColumn"               , nil        ,nil  ,nil  ,nil)   -- CursorColumn

-- There are also links for file highlight with git properties, linked to their Git equivalent:

-- highlight("NvimTreeFileDirty"                  , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitDirty
-- highlight("NvimTreeFileStaged"                 , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitStaged
-- highlight("NvimTreeFileMerge"                  , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitMerge
-- highlight("NvimTreeFileRenamed"                , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitRenamed
-- highlight("NvimTreeFileNew"                    , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitNew
-- highlight("NvimTreeFileDeleted"                , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitDeleted
-- highlight("NvimTreeFileIgnored"                , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitIgnored

-- There are 2 highlight groups for the live filter feature

highlight("NvimTreeLiveFilterPrefix"           , "#C678DD"  ,nil  ,nil  ,nil) 
highlight("NvimTreeLiveFilterValue"            , "#E06C75"  ,nil  ,nil  ,nil) 

-- Color of the bookmark icon

highlight("NvimTreeBookmark"                   , "#C678DD"  ,nil  ,nil  ,nil) 

end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "lua NvimTreeHighlight()",
})
