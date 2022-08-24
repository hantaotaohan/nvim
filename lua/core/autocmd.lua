-------------------------------------------------------------------------------
                            -- Create Autocmd API --
-------------------------------------------------------------------------------

local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-------------------------- Dont List Quickfix Buffers -------------------------

autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

------------- Disable Statusline or Tabline or Cmdline In Dashboard -----------

autocmd("FileType", {
	pattern = "alpha",
    command = "set showtabline=0 laststatus=0 cmdheight=0 | autocmd BufUnload <buffer> set showtabline=2 laststatus=2 cmdheight=1"
})

----------------------- Don't Auto Commenting New Lines -----------------------

autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
})

----------------------------- Auto Exit Nvim-Tree -----------------------------

autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("quit") end
    end
})


----------------------------------- WSL Yank ----------------------------------

autocmd("TextYankPost", {
	pattern = "*",
    command = "if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif"
})

-------------------------------- Yank highlight -------------------------------

autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = 'lualine_a_visual', timeout = 200 })
    end
})

