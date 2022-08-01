local opt                          = vim.opt                                -- 设置功能,等同于vim里的set
local g                            = vim.g                                  -- 设置全局变量

g.mapleader                        = "\\"
g.maplocalleader                   = ";"

opt.laststatus                     = 2                                      -- 启用Status状态栏
opt.showmode                       = false                                  -- 不显示内置的状态指示器

opt.title                          = true                                   -- 启用标题
opt.cursorline                     = true                                   -- 高亮光标所在行
opt.clipboard                      = "unnamedplus"                          -- 增强剪贴板

-- Indenting
opt.shiftwidth                     = 4                                      -- 换行时自动缩进宽度
opt.tabstop                        = 4                                      -- 设置Tab键的宽度
opt.softtabstop                    = 2                                      -- 自动与shiftwidth保持同步
opt.expandtab                      = true                                   -- 将制表符替换为空格
opt.smartindent                    = true                                   -- 启用智能对齐

opt.hidden                         = true
opt.fileformats                    = "unix,mac,dos"
opt.fillchars                      = { eob = " " }
opt.ignorecase                     = true                                   -- 搜索模式里忽略大小写
opt.smartcase                      = true                                   -- 如果搜索模式包含大写字符，不使用忽略大小写选项
opt.mouse                          = "a"                                    -- 开启鼠标功能

-- Numbers
opt.number                         = true                                   -- 开启数字边栏           
opt.numberwidth                    = 2                                      -- 数字边栏宽度
opt.ruler                          = true                                   -- 屏幕右下角显示当前光标所处位置

opt.shortmess                      = "aoOTIcF"                              -- 启动nvim时不显示无用消息

opt.signcolumn                     = "yes"                                  -- 显示标志列,如Git_Status和BookMark标志等
opt.splitbelow                     = true
opt.splitright                     = true
opt.termguicolors                  = true                                   -- 使终端支持256色

opt.timeout                        = true
opt.ttimeout                       = true
opt.timeoutlen                     = 400                                    -- 映射超时
opt.ttimeoutlen                    = 10                                     -- 按键密码超时
opt.redrawtime                     = 2000                                   -- 停止显示重绘的时间（以毫秒为单位）
opt.updatetime                     = 200

opt.undofile                       = true

-- disable some builtin vim plugins
local disable_distribution_plugins = function()
	g.load_filetypes           = 1
	g.load_fzf                 = 1
	g.load_gtags               = 1
	g.load_gzip                = 1
	g.load_tar                 = 1
	g.load_tarPlugin           = 1
	g.load_zip                 = 1
	g.load_zipPlugin           = 1
	g.load_getscript           = 1
	g.load_getscriptPlugin     = 1
	g.load_vimball             = 1
	g.load_vimballPlugin       = 1
	g.load_matchit             = 1
	g.load_matchparen          = 1
	g.load_2html_plugin        = 1
	g.load_logiPat             = 1
	g.load_rrhelper            = 1
	g.load_netrw               = 1
	g.load_netrwPlugin         = 1
	g.load_netrwSettings       = 1
	g.load_netrwFileHandlers   = 1
    g.load_tutor               = 1
    g.load_rplugin             = 1
    g.load_syntax              = 1
    g.load_synmenu             = 1
    g.load_optwin              = 1
    g.load_compiler            = 1
    g.load_bugreport           = 1
    g.load_ftplugin            = 1
end

local disable_default_providers = function()
    g.loaded_node_provider = 0
    g.loaded_perl_provider = 0
    g.loaded_python3_provider = 0
    g.loaded_ruby_provider = 0
end

local load_core = function()
	disable_distribution_plugins()
    disable_default_providers()
end

load_core()
