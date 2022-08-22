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
    callback = function()
        vim.opt.laststatus = 0
        vim.opt.cmdheight  = 0
        vim.opt.showtabline = 1
    end,
})

autocmd("BufUnload", {
    buffer = 0,
    callback = function()
        vim.opt.laststatus = 3
        vim.opt.cmdheight  = 1
        vim.opt.showtabline = 2
    end,
})

----------------------- Don't Auto Commenting New Lines -----------------------

autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
})

