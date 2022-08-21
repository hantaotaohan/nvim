local present, mason = pcall(require, "mason")

if not present then
	return
end

local options = {

	ensure_installed = { "lua-language-server", "bash-language-server", "pyright", "rome", "djlint" }, -- not an option from mason.nvim

	ui = {

		check_outdated_packages_on_open = true,
        border = "none",

		icons = {
            package_installed = "✓ ",
            package_pending = "➜ ",
            package_uninstalled = "✗ "
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},

	-- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

	max_concurrent_installers = 10,

	github = {
		download_url_template = "https://hub.fastgit.xyz/%s/releases/download/%s/%s",
	},
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

require "mason".setup(options)
