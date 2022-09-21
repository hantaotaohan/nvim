-------------------------------------------------------------------------------
                            -- Create Autocmd API --
-------------------------------------------------------------------------------

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                               Quickfix                               │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("QuickDisplay", {})

autocmd("FileType", {
	group = "QuickDisplay",
	pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                                Alpha                                 │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("Alpha", {})

autocmd("FileType", {
	group = "Alpha",
	pattern = "alpha",
    command = "set showtabline=0 laststatus=0 cmdheight=0 | autocmd BufUnload <buffer> set showtabline=2 laststatus=2 cmdheight=1"
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                               Outline                                │
--   ╰──────────────────────────────────────────────────────────────────────╯


augroup("Outline", {})

autocmd("FileType", {
	group = "Outline",
	pattern = "Outline",
    command = "set signcolumn=no | autocmd BufUnload <buffer> set signcolumn=yes"
})


autocmd("BufEnter", {
	group = "Outline",
	pattern = "*",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "Outline" and layout[3] == nil then vim.cmd("quit") end
    end,
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                              Commenting                              │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("Comment", {})

autocmd("FileType", {
	group = "Comment",
    command = "set formatoptions-=cro",
    pattern = "*",
    -- command = "set fo-=c fo-=r fo-=o"
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                               Markdown                               │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("Markdown", {})

autocmd("FileType", {
	group = "Markdown",
    pattern = "vimwiki.markdown",
    callback = function()
      vim.opt_local.formatoptions:append("a")
      vim.opt_local.formatoptions:append("l")
      vim.opt_local.formatoptions:append("m")
      vim.opt_local.formatoptions:append("M")
      vim.opt_local.wrap = true
    end
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                              Nvim-Tree                               │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("NvimTree", {})

autocmd("BufEnter", {
	group = "NvimTree",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("quit") end
    end
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                               WSL Yank                               │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("WslYank", {})

autocmd("TextYankPost", {
	group = "WslYank",
	pattern = "*",
    command = "if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif"
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                            Yank highlight                            │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("YankHeight", {})

autocmd("TextYankPost", {
	group = "YankHeight",
    callback = function()
        vim.highlight.on_yank({ higroup = 'lualine_a_visual', timeout = 100 })
    end
})

--   ╭──────────────────────────────────────────────────────────────────────╮
--   │                         Save Cursor Postion                          │
--   ╰──────────────────────────────────────────────────────────────────────╯

augroup("AutoSaveFolds", {})

autocmd("BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre",{
	group = "AutoSaveFolds",
	pattern = "*",
	command = "silent! mkview!"
})

autocmd("BufWinEnter", {
	group = "AutoSaveFolds",
	pattern = "*",
	command = "silent! loadview"
})

autocmd("BufReadPost", {
	group = "AutoSaveFolds",
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\""))
            vim.cmd("silent! foldopen")
        end
    end,
})
