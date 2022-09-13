local M = {}

function M.setup()

    vim.g.vimwiki_list = {

        {
            path = "~/vimwiki11",
            syntax = "markdown",
            ext = ".md",
            template_path = "default",
            template_default = "default",
            path_html = "~/vimwiki",
            custom_wiki2html = "vimwiki_markdown",
            template_ext = ".tpl",
        }

    }

    vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
        [".wiki"] = "markdown"
    }

    vim.cmd('filetype plugin indent on')
    vim.cmd[[autocmd FileType vimwiki setlocal filetype=vimwiki.markdown]]

end

return M
