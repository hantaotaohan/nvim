-- autocmds
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
