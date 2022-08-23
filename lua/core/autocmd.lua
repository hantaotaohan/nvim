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

