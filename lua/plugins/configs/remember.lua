local present, remember = pcall(require, "remember")

if not present then
	return
end

local options = {
	open_folds = true,
    ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    ignore_buftype = { "quickfix", "nofile", "help", "dashboard", "telescope", "nvim-tree" },
	-- ignore_filetype = { "gitcommit", "gitrebase", "hgcommit", "svn", "lua", },
}

require "remember".setup(options)
