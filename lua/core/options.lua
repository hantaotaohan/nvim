-------------------------------------------------------------------------------
                          -- Shorten Function Name --
-------------------------------------------------------------------------------

local o = vim.opt
local g = vim.g

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

-- UTF8 字符编码设置

g.encoding = "UTF-8"
o.fileencoding = "utf-8"

-- 移动时光标周围保留8行

o.scrolloff = 8
o.sidescrolloff = 8

-- 使用相对行号

o.number = true
o.relativenumber = false

-- 行号宽度
o.numberwidth = 4

-- 高亮所在行

o.cursorline = true

-- 显示左侧图标指示列

o.signcolumn = "yes"

-- 右侧参考线

o.colorcolumn = "80"

-- 缩进4个空格等于一个Tab

o.tabstop = 4
o.softtabstop = 4
o.shiftround = true

-- 手动缩进时移动长度

o.shiftwidth = 4

-- 空格替代tab

o.expandtab = true

-- 新行对齐当前行

o.autoindent = true
o.smartindent = true

-- 搜索大小写不敏感，除非包含大写

o.ignorecase = true
o.smartcase = true
o.infercase = true
o.wrapscan = true

-- 边输入边搜索

o.incsearch = true

-- 搜索高亮

o.hlsearch = true

-- 命令行高为 1，提供足够的显示空间

o.cmdheight = 1

-- 当文件被外部程序修改时，自动加载

o.autoread = true

-- 禁止折行

o.wrap = false

-- 光标在行首尾时<Left><Right>可以跳到下一行

o.whichwrap = ""

-- 允许隐藏被修改过的buffer

o.hidden = true

-- 鼠标支持

o.mouse = "a"

-- 禁止创建备份文件

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- 设置超时时间

o.timeoutlen=500    
o.ttimeoutlen=10   
o.updatetime=300  

-- Split Window 从下边和右边出现

o.splitbelow = true
o.splitright = true
o.termguicolors = true

-- 自动补全不自动选中

-- vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- Terminal 支持 256

vim.o.termguicolors = true

-- 是否显示不可见字符

o.list = false

-- 不可见字符的显示，这里只把空格显示为一个点

o.listchars = "space:·,tab:'|',trail:.,extends:>,precedes:<"

-- 补全增强

o.wildmenu = true

-- 不要将消息传递到|输入菜单

o.shortmess = vim.o.shortmess .. "c"

-- 补全最多显示10行

o.pumheight = 10

-- 永远显示 tabline

o.showtabline = 2

-- 使用增强状态栏插件后不再需要 vim 的模式提示

o.showmode = false


-- StatusLine 高度

o.laststatus = 3 -- global statusline

-- 设置 Nvim 的标题

o.title = true

-- 打通剪贴板

o.clipboard = "unnamedplus"

-- Status 右下角显示标尺

o.ruler = true

-- 允许保存撤销文件

o.undofile = true

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

