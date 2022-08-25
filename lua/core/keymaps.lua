-------------------------------------------------------------------------------
                                  -- Modes --
-------------------------------------------------------------------------------

-- Normal_Mode          =      "n"
-- Insert_Mode          =      "i"
-- Visual_Mode          =      "v"
-- Visual_Block_Mode    =      "x"
-- Term_mode            =      "t"
-- Command_mode         =      "c"

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
                          -- Shorten Function Name --
-------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }
local bufopts = { noremap=true, silent=true, buffer=bufnr }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-------------------------------------------------------------------------------
                             -- Disable Keymaps --
-------------------------------------------------------------------------------

keymap("n", "q", "<nop>", opts)
keymap("v", "q", "<nop>", opts)

keymap("n", "<C-f>", "<nop>", opts)
keymap("n", "<C-b>", "<nop>", opts)

---------------------- Remap Leader And LocalLeader Key -----------------------

vim.g.mapleader = "\\"
vim.g.maplocalleader = ";"

------------------------------- Completion Menu -------------------------------

vim.cmd [[ cnoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>" ]]
vim.cmd [[ cnoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>" ]]

-------------------------------- No Highlight ---------------------------------

-- keymap("n", "<Space>", "<cmd>noh<CR>", opts)
-- keymap("v", "<Space>", "<cmd>noh<CR>", opts)

keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

----------------------------- Move Selected Line ------------------------------

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

--------------------------------- Quick Save ----------------------------------

keymap("n", "<LocalLeader>w", "<cmd>w<CR>", opts)
keymap("i", "<LocalLeader>w", "<cmd>w<CR>", opts)
keymap("v", "<LocalLeader>w", "<cmd>w<CR>", opts)

---------------------------- Quick Quit [ Sayonara ]---------------------------

keymap('n', '<LocalLeader>q', '<CMD>Sayonara<CR>', opts)
keymap('i', '<LocalLeader>q', '<CMD>Sayonara<CR>', opts)
keymap('v', '<LocalLeader>q', '<CMD>Sayonara<CR>', opts)

------------------------------ Navigation Window ------------------------------

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

-------------------------------- Resize Windows -------------------------------

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--------------------------------- Indent Mode ---------------------------------

keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("i", "<S-Tab>", "<C-d>", opts)

---------------------------------- Nvim-Tree ----------------------------------

keymap("n", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("i", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)
keymap("v", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)

------------------------------- NvimTreeToggle --------------------------------

keymap("n", "<LocalLeader>t", "<cmd>SymbolsOutline<CR>", opts)
keymap("i", "<LocalLeader>t", "<cmd>SymbolsOutline<CR><Esc>", opts)
keymap("v", "<LocalLeader>t", "<cmd>SymbolsOutline<CR><Esc>", opts)

---------------------------------- ToggleTerm ---------------------------------

keymap('n', '<LocalLeader>cc', '<CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>', opts)
keymap('i', '<LocalLeader>cc', '<CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>', opts)
keymap('v', '<LocalLeader>cc', '<CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>', opts)
keymap('t', '<LocalLeader>cc', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>',opts)

keymap('n', '<LocalLeader>cv', '<CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>', opts)
keymap('i', '<LocalLeader>cv', '<CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>', opts)
keymap('v', '<LocalLeader>cv', '<CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>', opts)
keymap('t', '<LocalLeader>cv', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>',opts)

keymap('n', '<LocalLeader>ct', '<CMD>ToggleTerm dir=%:p:h direction=tab<CR>', opts)
keymap('i', '<LocalLeader>ct', '<CMD>ToggleTerm dir=%:p:h direction=tab<CR>', opts)
keymap('v', '<LocalLeader>ct', '<CMD>ToggleTerm dir=%:p:h direction=tab<CR>', opts)
keymap('t', '<LocalLeader>ct', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h direction=tab<CR>',opts)

keymap('n', '<LocalLeader>cf', '<CMD>ToggleTerm dir=%:p:h direction=float<CR>', opts)
keymap('i', '<LocalLeader>cf', '<CMD>ToggleTerm dir=%:p:h direction=float<CR>', opts)
keymap('v', '<LocalLeader>cf', '<CMD>ToggleTerm dir=%:p:h direction=float<CR>', opts)
keymap('t', '<LocalLeader>cf', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h direction=float<CR>',opts)

---------------------------------- Telescope --------------------------------- 

keymap('n', '<LocalLeader>ff', '<CMD>Telescope find_files <CR>', opts)
keymap('n', '<LocalLeader>fa', '<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>', opts)
keymap('n', '<LocalLeader>fw', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', '<LocalLeader>fo', '<CMD>Telescope oldfiles<CR>', opts)
keymap('n', '<LocalLeader>fh', '<CMD>Telescope keymaps <CR><CR>', opts)
keymap('n', '<LocalLeader>cm', '<CMD>Telescope git_commits<CR>', opts)
keymap('n', '<LocalLeader>gt', '<CMD>Telescope git_status<CR>', opts)
keymap('n', '<LocalLeader>tt', '<CMD>Telescope colorscheme<CR>', opts)

----------------------------------- RunCode -----------------------------------

keymap('n', '<LocalLeader>rr', '<CMD>RunFile<CR>', opts)
keymap('n', '<LocalLeader>rc', '<CMD>RunCode<CR>', opts)
keymap('n', '<LocalLeader>rt', '<CMD>RunFile tab<CR>', opts)
keymap('n', '<LocalLeader>rp', '<CMD>RunProject<CR>', opts)
keymap('n', '<LocalLeader>rc', '<CMD>RunClose<CR>', opts)

----------------------- Navigate Buffers [ bufferline ] -----------------------

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

------------------------------------- LSP -------------------------------------

keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", bufopts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", bufopts)
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", bufopts)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", bufopts)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", bufopts)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", bufopts)
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", bufopts)

------------------------------------ Alpha ------------------------------------

keymap("n", "<LocalLeader>s", "<cmd>Alpha<CR>", opts)
keymap("i", "<LocalLeader>s", "<cmd>Alpha<CR>", opts)
keymap("v", "<LocalLeader>s", "<cmd>Alpha<CR>", opts)

------------------------------ IndentBlankLine --------------------------------

keymap("n", "<LocalLeader>tl", "<cmd>IndentBlanklineToggle<CR>", opts)
keymap("i", "<LocalLeader>tl", "<cmd>IndentBlanklineToggle<CR>", opts)
keymap("v", "<LocalLeader>tl", "<cmd>IndentBlanklineToggle<CR>", opts)

---------------------------------- Gitsigns -----------------------------------

keymap("n", "<LocalLeader>tgs", "<cmd>Gitsigns toggle_signs<CR>", opts)
keymap("i", "<LocalLeader>tgs", "<cmd>Gitsigns toggle_signs<CR>", opts)
keymap("v", "<LocalLeader>tgs", "<cmd>Gitsigns toggle_signs<CR>", opts)

keymap("n", "<LocalLeader>tgl", "<cmd>Gitsigns toggle_linehl<CR>", opts)
keymap("i", "<LocalLeader>tgl", "<cmd>Gitsigns toggle_linehl<CR>", opts)
keymap("v", "<LocalLeader>tgl", "<cmd>Gitsigns toggle_linehl<CR>", opts)

keymap("n", "<LocalLeader>tgw", "<cmd>Gitsigns toggle_word_diff<CR>", opts)
keymap("i", "<LocalLeader>tgw", "<cmd>Gitsigns toggle_word_diff<CR>", opts)
keymap("v", "<LocalLeader>tgw", "<cmd>Gitsigns toggle_word_diff<CR>", opts)

keymap("n", "<LocalLeader>tgb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
keymap("i", "<LocalLeader>tgb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
keymap("v", "<LocalLeader>tgb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)

