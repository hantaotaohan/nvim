local opt = vim.opt
local g = vim.g

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
g.mapleader = " "


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
