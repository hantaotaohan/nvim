-- Setup installer & lsp configs
local mason_ok, mason = pcall(require, 'mason')
local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')

if not mason_ok or not mason_lsp_ok then
    return
end

-------------------------------------------------------------------------------
-- Mason --
-------------------------------------------------------------------------------

mason.setup {

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

    max_concurrent_installers = 10,

    github = {
        download_url_template = "https://hub.fastgit.xyz/%s/releases/download/%s/%s",
    },
}

-------------------------------------------------------------------------------
-- Mason Lsp Config --
-------------------------------------------------------------------------------

mason_lsp.setup {

    ensure_installed = {
        "lua-language-server",
        "bash-language-server",
        "pyright",
        "rome",
        "djlint",
        "json-lsp",
    },

    automatic_installation = true,
}

-------------------------------------------------------------------------------
-- Nvim Lsp Config --
-------------------------------------------------------------------------------

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

-------------------------------------------------------------------------------
-- Lsp Config --
-------------------------------------------------------------------------------

local function on_attach(client, bufnr)
    -- set up buffer keymaps, etc.
end

lspconfig.bashls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = require('plugins.configs.lsp.config.bashls').settings,
}

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    -- on_attach = require('plugins.configs.lsp.config.pyright').on_attach,
    settings = require('plugins.configs.lsp.config.pyright').settings,
}

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    -- on_attach = require('plugins.configs.lsp.config.sumneko_lua').on_attach,
    settings = require('plugins.configs.lsp.config.sumneko_lua').settings,
}

for _, server in ipairs { "bashls", "pyright", "sumneko_lua" } do
    lspconfig[server].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
