local M = {}

M.options = {
    package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
    compile_path = util.join_paths(vim.fn.stdpath('data'), 'plugin', 'packer_compiled.lua'),
    max_jobs = nil,
    auto_clean = true,
    compile_on_sync = true,
    git = { 
        depth = 1,
        clone_timeout = 60,
        default_url_format = 'https://hub.fastgit.xyz/%s'
    },
    display = {
        working_sym = "✚ ",
        error_sym = "✖ ",
        done_sym = "✔ ",
        removed_sym = "⚫",
        moved_sym = "✱ ",
        header_sym = '━',
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}


M.run = function(plugins)
    local present, packer = pcall(require, "packer")

    if not present then
        return
    end

    packer.init(M.options)

    packer.startup(function(use)
        for _, v in pairs(plugins) do
            use(v)
        end
    end)
end

return M
