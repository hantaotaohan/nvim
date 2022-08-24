-------------------------------------------------------------------------------
                          -- Shorten Function Name --
-------------------------------------------------------------------------------

local o = vim.opt
local g = vim.g

local vim_data_path = vim.fn.stdpath("data")

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
                             -- Use Filetype.lua --
-------------------------------------------------------------------------------

g.vim_version = vim.version().minor

if g.vim_version < 8 then
    g.did_load_filetypes = 0
    g.do_filetype_lua = 1
end

-------------------------------------------------------------------------------
                             -- Start Configure --
-------------------------------------------------------------------------------

-- 编码设置
g.encoding = "utf-8"
o.fileencoding = "utf-8"

-- 光标设置
o.whichwrap = ""
o.scrolloff = 8
o.sidescrolloff = 8

-- 行号边栏设置
o.number = true
o.numberwidth = 6
o.signcolumn = "yes"
o.relativenumber = false

-- 编辑区域设置
o.list = false
o.cursorline = true
o.colorcolumn = "80"
o.listchars:append("eol:↲" ) 
o.listchars:append("tab:·")
o.listchars:append("space:⋅")
o.listchars:append("trail:•")
o.listchars:append("extends:▸") 
o.listchars:append("precedes:◂") 
o.listchars:append("conceal:┊")
o.listchars:append("nbsp:␣")

-- 缩进设置
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.shiftround = true
o.autoindent = true
o.smartindent = true

-- 搜索设置
o.wrapscan = true
o.hlsearch = true
o.smartcase = true
o.infercase = true
o.incsearch = true
o.ignorecase = true

-- 命令行区域设置
o.ruler = true
o.cmdheight = 1
o.laststatus = 2
o.showmode = false

-- 行为设置
o.wrap = false
o.title = true
o.mouse = "a"
o.history = 9000
o.autoread = true
o.winblend = 20
o.lazyredraw = true
o.splitbelow = false
o.splitright = false
o.jumpoptions = 'view'
o.shortmess:append "c"
o.shortmess:append 'A'
o.shortmess:append 'I'
o.shortmess:append 'O'
o.shortmess:append 'T'
o.shortmess:append 'a'
o.shortmess:append 'o'
o.shortmess:append 't'
o.termguicolors = true
o.clipboard:append "unnamedplus"

-- 标签页设置
o.hidden = true
o.showtabline = 2

-- 备份文件设置
o.backup = false
o.undofile = true
o.swapfile = false
o.undolevels = 10000
o.writebackup = false
o.undodir = vim_data_path .. "/undo"

-- 设置超时时间
o.timeoutlen = 500
o.ttimeoutlen = 10
o.updatetime = 300

-- 补全设置
o.pumheight = 10
o.wildmenu = true

-------------------------------------------------------------------------------
                        -- Disable Nvim Built Plugins --
-------------------------------------------------------------------------------

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-------------------------------------------------------------------------------
                      -- Disable  Third-party Languages --
-------------------------------------------------------------------------------

local default_providers = {
    "node",
    "perl",
    "ruby",
    "python3",
}

for _, provider in ipairs(default_providers) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

