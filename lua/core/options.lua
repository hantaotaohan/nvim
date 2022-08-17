local o = vim.opt
local g = vim.g

-- utf8
g.encoding = "UTF-8"
o.fileencoding = "utf-8"

-- jkhl 移动时光标周围保留8行
o.scrolloff = 8
o.sidescrolloff = 8

-- 显示左侧图标指示列
o.signcolumn = "yes"

-- 右侧参考线
o.colorcolumn = "80"

-- 缩进4个空格等于一个Tab
o.tabstop = 4
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.shiftround = true
o.autoindent = true
o.smartindent = true

-- 搜索大小写不敏感，除非包含大写
o.ignorecase = true
o.smartcase = true
-- 搜索高亮
o.hlsearch = true
-- 边输入边搜索
o.incsearch = true

-- 命令行高为2，提供足够的显示空间
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

-- smaller updatetime
o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
-- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
o.timeoutlen = 500
-- split window 从下边和右边出现
o.splitbelow = true
o.splitright = true
o.termguicolors = true
-- 是否显示不可见字符
o.list = false
-- 不可见字符的显示，这里只把空格显示为一个点
o.listchars = "space:·,tab:··"
-- 补全增强
o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
o.shortmess = vim.o.shortmess .. "c"
-- 补全最多显示10行
o.pumheight = 10
-- 永远显示 tabline
o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
o.showmode = false


o.laststatus = 3 -- global statusline

o.title = true
o.clipboard = "unnamedplus"
o.cul = true -- cursor line

-- Indenting

o.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true

-- Numbers
o.number = true
o.numberwidth = 4
o.ruler = true

-- disable nvim intro
o.shortmess:append "sI"

o.undofile = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line

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


local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

--vim.cmd "set whichwrap+=<,>,[,],h,l"
--vim.opt.fillchars:append { eob = " " } -- hide tildes at the end of buffers
--vim.opt.fillchars:append { vert = " "} -- hide borders of split vertical windows (nvim tree)

--vim.cmd "highlight EndOfBuffer ctermfg=NONE ctermbg=NONE guibg=NONE"
--vim.cmd "highlight VertSplit ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE"

----Enable fenced code blocks syntax highlighting in markdown files for these languages
--vim.g.vim_markdown_fenced_languages = 'c++=cpp', 'python', 'viml=vim', 'bash=sh', 'javascript=js', 'java', 'html', 'xml', 'markdown'

