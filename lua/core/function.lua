local cmd = vim.cmd
local fn = vim.fn

local M = {}

-- check if a variable is not empty nor nil
M.isNotEmpty = function(s)
  return s ~= nil and s ~= ""
end

-------------------------------------------------------------------------------
-- Toggle QuickFix
-------------------------------------------------------------------------------

M.toggle_qf = function()
    local windows = fn.getwininfo()
    local qf_exists = false
    for _, win in pairs(windows) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        cmd("cclose")
        return
    end
    if M.isNotEmpty(fn.getqflist()) then
        cmd("copen")
    end
end

-------------------------------------------------------------------------------
-- Toggle ColorColumn
-------------------------------------------------------------------------------

M.toggle_colorcolumn = function()
    local value = vim.inspect(vim.opt.colorcolumn:get())
    if value == "{}" then
        vim.opt.colorcolumn = "80"
    else
        vim.opt.colorcolumn = {}
    end
end

-------------------------------------------------------------------------------
-- Toggle DiagnoStics
-------------------------------------------------------------------------------

DIAGNOSTICS_ACTIVE = true -- must be global since the toggle function is called in which.lua
M.toggle_diagnostics = function()
    DIAGNOSTICS_ACTIVE = not DIAGNOSTICS_ACTIVE
    if DIAGNOSTICS_ACTIVE then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end

-------------------------------------------------------------------------------
-- Toggle Null-ls
-------------------------------------------------------------------------------

AUTOFORMAT_ACTIVE = true
M.toggle_autoformat = function()
    M.notify("Toggling autoformatting", "info", "functions.lua")
    AUTOFORMAT_ACTIVE = not AUTOFORMAT_ACTIVE
end

-------------------------------------------------------------------------------

return M
