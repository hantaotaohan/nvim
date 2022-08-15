local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
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

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Nvim-Tree
keymap("n", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("i", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)
keymap("v", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)



keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',opts)
