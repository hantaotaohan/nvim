-- Modes

-- Normal_Mode          =      "n"
-- Insert_Mode          =      "i"
-- Visual_Mode          =      "v"
-- Visual_Block_Mode    =      "x"
-- Term_mode            =      "t"
-- Command_mode         =      "c"

-- Shorten function name
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = ";"

keymap("n", "<LocalLeader>w", "<cmd>w<CR>", opts)
keymap("i", "<LocalLeader>w", "<cmd>w<CR>", opts)
keymap("v", "<LocalLeader>w", "<cmd>w<CR>", opts)

-- keymap("n", "<LocalLeader>q", "<cmd>Bdelete! %d<CR>", opts)
-- keymap("i", "<LocalLeader>q", "<cmd>Bdelete! %d<CR>", opts)
-- keymap("v", "<LocalLeader>q", "<cmd>Bdelete! %d<CR>", opts)

keymap("n", "<LocalLeader>q", "<cmd>q<CR>", opts)
keymap("i", "<LocalLeader>q", "<cmd>q<CR>", opts)
keymap("v", "<LocalLeader>q", "<cmd>q<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("i", "<C-h>", "<Esc><C-w>h", opts)
keymap("i", "<C-j>", "<Esc><C-w>j", opts)
keymap("i", "<C-k>", "<Esc><C-w>k", opts)
keymap("i", "<C-l>", "<Esc><C-w>l", opts)

keymap("v", "<C-h>", "<Esc><C-w>h", opts)
keymap("v", "<C-j>", "<Esc><C-w>j", opts)
keymap("v", "<C-k>", "<Esc><C-w>k", opts)
keymap("v", "<C-l>", "<Esc><C-w>l", opts)

keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<LocalLeader><Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<LocalLeader><S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<LocalLeader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
keymap("n", "<LocalLeader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
keymap("n", "<LocalLeader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
keymap("n", "<LocalLeader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
keymap("n", "<LocalLeader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
keymap("n", "<LocalLeader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
keymap("n", "<LocalLeader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
keymap("n", "<LocalLeader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
keymap("n", "<LocalLeader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)

keymap("i", "<LocalLeader><Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("i", "<LocalLeader><S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("i", "<LocalLeader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
keymap("i", "<LocalLeader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
keymap("i", "<LocalLeader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
keymap("i", "<LocalLeader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
keymap("i", "<LocalLeader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
keymap("i", "<LocalLeader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
keymap("i", "<LocalLeader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
keymap("i", "<LocalLeader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
keymap("i", "<LocalLeader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)

keymap("v", "<LocalLeader><Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("v", "<LocalLeader><S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("v", "<LocalLeader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
keymap("v", "<LocalLeader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
keymap("v", "<LocalLeader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
keymap("v", "<LocalLeader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
keymap("v", "<LocalLeader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
keymap("v", "<LocalLeader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
keymap("v", "<LocalLeader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
keymap("v", "<LocalLeader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
keymap("v", "<LocalLeader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)

keymap("t", "<LocalLeader><Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("t", "<LocalLeader><S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("t", "<LocalLeader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
keymap("t", "<LocalLeader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
keymap("t", "<LocalLeader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
keymap("t", "<LocalLeader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
keymap("t", "<LocalLeader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
keymap("t", "<LocalLeader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
keymap("t", "<LocalLeader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
keymap("t", "<LocalLeader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
keymap("t", "<LocalLeader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Nvim-Tree
keymap("n", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("i", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)
keymap("v", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)

-- ToggleTerm
keymap('n', '<LocalLeader>cc', '<CMD>ToggleTerm size=10 direction=horizontal<CR>', opts)
keymap('i', '<LocalLeader>cc', '<CMD>ToggleTerm size=10 direction=horizontal<CR>', opts)
keymap('v', '<LocalLeader>cc', '<CMD>ToggleTerm size=10 direction=horizontal<CR>', opts)
keymap('t', '<LocalLeader>cc', '<C-\\><C-n><CMD>ToggleTerm size=10 direction=horizontal<CR>',opts)

keymap('n', '<LocalLeader>cv', '<CMD>ToggleTerm size=80 direction=vertical<CR>', opts)
keymap('i', '<LocalLeader>cv', '<CMD>ToggleTerm size=80 direction=vertical<CR>', opts)
keymap('v', '<LocalLeader>cv', '<CMD>ToggleTerm size=80 direction=vertical<CR>', opts)
keymap('t', '<LocalLeader>cv', '<C-\\><C-n><CMD>ToggleTerm size=80 direction=vertical<CR>',opts)

keymap('n', '<LocalLeader>ct', '<CMD>ToggleTerm direction=tab<CR>', opts)
keymap('i', '<LocalLeader>ct', '<CMD>ToggleTerm direction=tab<CR>', opts)
keymap('v', '<LocalLeader>ct', '<CMD>ToggleTerm direction=tab<CR>', opts)
keymap('t', '<LocalLeader>ct', '<C-\\><C-n><CMD>ToggleTerm direction=tab<CR>',opts)

keymap('n', '<LocalLeader>cf', '<CMD>ToggleTerm direction=float<CR>', opts)
keymap('i', '<LocalLeader>cf', '<CMD>ToggleTerm direction=float<CR>', opts)
keymap('v', '<LocalLeader>cf', '<CMD>ToggleTerm direction=float<CR>', opts)
keymap('t', '<LocalLeader>cf', '<C-\\><C-n><CMD>ToggleTerm direction=float<CR>',opts)

-- Sayonara
keymap('n', '<LocalLeader>q', '<CMD>Sayonara<CR>', opts)
keymap('i', '<LocalLeader>q', '<CMD>Sayonara<CR>', opts)
keymap('v', '<LocalLeader>q', '<CMD>Sayonara<CR>', opts)


-- Telescope
keymap('n', '<LocalLeader>ff', '<CMD>Telescope find_files <CR>', opts)
keymap('n', '<LocalLeader>fa', '<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>', opts)
keymap('n', '<LocalLeader>fw', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', '<LocalLeader>fo', '<CMD>Telescope oldfiles<CR>', opts)
keymap('n', '<LocalLeader>fh', '<CMD>Telescope keymaps <CR><CR>', opts)
keymap('n', '<LocalLeader>cm', '<CMD>Telescope git_commits<CR>', opts)
keymap('n', '<LocalLeader>gt', '<CMD>Telescope git_status<CR>', opts)
keymap('n', '<LocalLeader>tt', '<CMD>Telescope colorscheme<CR>', opts)

-- RunCode
keymap('n', '<LocalLeader>rr', '<CMD>RunFile<CR>', opts)
keymap('n', '<LocalLeader>rc', '<CMD>RunCode<CR>', opts)
keymap('n', '<LocalLeader>rt', '<CMD>RunFile tab<CR>', opts)
keymap('n', '<LocalLeader>rp', '<CMD>RunProject<CR>', opts)
keymap('n', '<LocalLeader>rc', '<CMD>RunClose<CR>', opts)
