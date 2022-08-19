local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
	config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://hub.fastgit.xyz/")
end

local options = {
	ensure_installed = { "lua", "python" },
	sync_install = false,
	-- NOTE: need to ignore installation of phpdoc parser because it is not ready for Mac m1 arm64 architecture
	ignore_install = { "c", "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing
	autopairs = { enable = true },
	autotag = {enable = true},
	-- 启用代码高亮模块
	highlight = {
		enable = false,
		additional_vim_regex_highlighting = false,
	},

	-- 启用增量选择模块
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- 启用代码缩进模块 (=)
	indent = {
		enable = true,
	},

	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#95ca60",
			"#ee6985",
			"#D6A760",
			"#7794f4",
			"#b38bf5",
			"#7cc7fe",
		}, -- table of hex strings
		-- termcolors = { } -- table of colour name strings
	},
}


-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

require("nvim-treesitter.install").prefer_git = true
require "nvim-treesitter.configs".setup(options)
