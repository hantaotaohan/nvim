-------------------------------------------------------------------------------
                          -- Shorten Function Name --
-------------------------------------------------------------------------------

local o = vim.opt
local g = vim.g

local vim_data_path = vim.fn.stdpath("data")

-- Disable default mappings for speeddating
g.speeddating_no_mappings = 1

g.python_host_skip_check = 1
g.python3_host_skip_check = 1

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
o.virtualedit = 'block'

-- 行号边栏设置
o.number = true
o.numberwidth = 3
o.signcolumn = "yes:3"
o.relativenumber = false

-- 编辑区域设置
o.list = false
o.cursorline = true
o.colorcolumn = ""
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
o.showcmd = false
o.showmatch = true

-- 行为设置
o.re = 1
o.wrap = false
o.title = true
o.mouse = 'a'
o.history = 9000
o.modeline = true
o.autoread = true
o.winblend = 20
o.lazyredraw = true
o.visualbell = false
o.errorbells = false
o.splitbelow = false
o.splitright = false
o.startofline = true
o.breakindent = true
o.showbreak = '↳  '
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

-- 差异对比设置
o.diffopt:append 'vertical'
o.diffopt:append 'algorithm:histogram'
o.diffopt:append 'hiddenoff'
o.diffopt:append 'indent-heuristic'

-- 标签页设置
o.hidden = true
o.showtabline = 2

-- 备份文件设置
o.backup = false
o.undofile = true
o.swapfile = false
o.undolevels = 10000
o.writebackup = false
o.viewoptions:append "cursor"
o.viewoptions:append "curdir"
o.viewoptions:append "folds"
-- o.viewoptions:append "options"
-- o.viewoptions:append "localoptions"
o.viewoptions:append "slash"
o.viewoptions:append "unix"
o.undodir = vim_data_path .. "/undo"

-- o.shada = "'200,<10000,s100,/10000,:1000,n~/.config/nvim/.shada"
o.shadafile = vim.fn.stdpath("data") .. "/shada/main.shada"

-- 设置超时时间
o.timeoutlen = 300
o.ttimeoutlen = 10
o.updatetime = 100
o.updatecount = 0

-- 补全设置
o.pumheight = 10
o.pumblend = 10
o.wildmenu = true

-- 折叠设置
o.foldlevel = 0
o.foldnestmax = 1
o.foldenable = true
o.foldcolumn = "1"
o.foldmethod = "manual"
o.foldtext='NeatFoldText()'
-- o.foldclose = "all"
-- o.foldopen = "all"

vim.cmd[[
    function! NeatFoldText() 
        let line = "█  " . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . "  █" 
        let lines_count = v:foldend - v:foldstart + 1
        let lines_count_text = ' ' . printf("%10s", lines_count . ' lines') . ' '
        let foldchar = matchstr(&fillchars, 'fold:\zs.')
        let foldtextstart = strpart(" FOLDED █" . line , 0, (winwidth(0)*2)/3)
        let foldtextend = "█" . lines_count_text . repeat(foldchar, 8) . "█"
        let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
        return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
    endfunction
]]

vim.cmd [[
    vnoremap <Space> zf
    nnoremap <silent> <Space> @=(foldlevel('.')?'za' : "\<Space>")<CR>
]]

-- UI

o.fillchars:append("stl: ")
o.fillchars:append("stlnc: ")
o.fillchars:append("vert:┃")
o.fillchars:append("fold:█")
-- o.fillchars:append("fold:─")
o.fillchars:append("diff:⣿")
o.fillchars:append("msgsep:‾")
o.fillchars:append("eob: ")
o.fillchars:append("vert:┃")
o.fillchars:append("foldopen:⯆")
o.fillchars:append("foldsep:│")
o.fillchars:append("foldclose:⯈")


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

