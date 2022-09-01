M = {}

M.devicons = function()
  local present, devicons = pcall(require, "nvim-web-devicons")

  if present then

    local options = { override = require("plugins.configs.lsp.icon").devicons }

    devicons.setup(options)
  end
end

return M
