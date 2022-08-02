local colorscheme = "onedark"

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


