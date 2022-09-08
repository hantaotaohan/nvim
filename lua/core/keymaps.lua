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
local keymap = vim.api.nvim_set_keymap

require ("core.function")

-------------------------------------------------------------------------------
                             -- Disable Keymaps --
-------------------------------------------------------------------------------

keymap("n", "q", "<Nop>", opts)
keymap("v", "q", "<Nop>", opts)
keymap("n", "Q", "<Nop>", opts)
keymap("v", "Q", "<Nop>", opts)

keymap("n", "<C-f>", "<nop>", opts)
keymap("n", "<C-b>", "<nop>", opts)

-------------------------------------------------------------------------------
                              -- Start Keymaps --
-------------------------------------------------------------------------------

---------------------- Remap Leader And LocalLeader Key -----------------------

vim.g.mapleader = "\\"
vim.g.maplocalleader = ";"

------------------------------ Mapping for paste ------------------------------

keymap("x", "p", '"_dP', opts)

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

---------------------------- Toggle System Tools -------------------------------

keymap("n", "<F3>", "<cmd>lua require('core.function').toggle_number()<cr>", opts)
keymap("n", "<F4>", "<cmd>lua require('core.function').toggle_column()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require('core.function').toggle_syntax()<cr>", opts)
keymap("n", "<F6>", "<cmd>ScrollbarToggle<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require('core.function').toggle_qf()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require('core.function').toggle_colorcolumn()<cr>", opts)
keymap("n", "<F9>", "<cmd>lua require('core.function').toggle_diagnostics()<cr>", opts)
keymap("n", "<F10>", "<cmd>ColorizerToggle<CR>" , opts)


---------------------------------- Nvim-Tree ----------------------------------

keymap("n", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("i", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)
keymap("v", "<LocalLeader>e", "<cmd>NvimTreeToggle<CR><Esc>", opts)

------------------------------- NvimTreeToggle --------------------------------

keymap("n", "<LocalLeader>t", "<cmd>SymbolsOutline<CR>", opts)
keymap("i", "<LocalLeader>t", "<cmd>SymbolsOutline<CR><Esc>", opts)
keymap("v", "<LocalLeader>t", "<cmd>SymbolsOutline<CR><Esc>", opts)

---------------------------------- ToggleTerm ---------------------------------

keymap("t", "<esc>", "<C-\\><C-n>", opts)

keymap('n', '<LocalLeader>c', '<CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>', opts)
keymap('i', '<LocalLeader>c', '<CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>', opts)
keymap('v', '<LocalLeader>c', '<CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>', opts)
keymap('t', '<LocalLeader>c', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h size=10 direction=horizontal<CR>',opts)

keymap('n', '<Leader>cv', '<CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>', opts)
keymap('i', '<Leader>cv', '<CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>', opts)
keymap('v', '<Leader>cv', '<CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>', opts)
keymap('t', '<Leader>cv', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h size=80 direction=vertical<CR>',opts)

keymap('n', '<Leader>ct', '<CMD>ToggleTerm dir=%:p:h direction=tab<CR>', opts)
keymap('i', '<Leader>ct', '<CMD>ToggleTerm dir=%:p:h direction=tab<CR>', opts)
keymap('v', '<Leader>ct', '<CMD>ToggleTerm dir=%:p:h direction=tab<CR>', opts)
keymap('t', '<Leader>ct', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h direction=tab<CR>',opts)

keymap('n', '<Leader>cc', '<CMD>ToggleTerm dir=%:p:h direction=float<CR>', opts)
keymap('i', '<Leader>cc', '<CMD>ToggleTerm dir=%:p:h direction=float<CR>', opts)
keymap('v', '<Leader>cc', '<CMD>ToggleTerm dir=%:p:h direction=float<CR>', opts)
keymap('t', '<Leader>cc', '<C-\\><C-n><CMD>ToggleTerm dir=%:p:h direction=float<CR>',opts)

---------------------------------- Telescope --------------------------------- 

keymap('n', '<LocalLeader>ff', '<CMD>Telescope find_files <CR>', opts)
keymap('n', '<LocalLeader>fa', '<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>', opts)
keymap('n', '<LocalLeader>fw', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', '<LocalLeader>fo', '<CMD>Telescope oldfiles<CR>', opts)
keymap('n', '<LocalLeader>fh', '<CMD>Telescope keymaps <CR><CR>', opts)
keymap('n', '<LocalLeader>fm', '<CMD>Telescope git_commits<CR>', opts)
keymap('n', '<LocalLeader>ft', '<CMD>Telescope git_status<CR>', opts)
keymap('n', '<LocalLeader>fc', '<CMD>Telescope colorscheme<CR>', opts)
keymap('n', '<LocalLeader>fp', '<CMD>Telescope projects<CR>', opts)

----------------------------------- RunCode -----------------------------------

keymap('n', '<LocalLeader>rr', '<CMD>RunFile<CR>', opts)
keymap('n', '<LocalLeader>rc', '<CMD>RunCode<CR>', opts)
keymap('n', '<LocalLeader>rt', '<CMD>RunFile tab<CR>', opts)
keymap('n', '<LocalLeader>rp', '<CMD>RunProject<CR>', opts)
keymap('n', '<LocalLeader>rc', '<CMD>RunClose<CR>', opts)

---------------------------------- Markdown -----------------------------------

keymap('n', '<LocalLeader>rm', '<CMD>Glow!<CR>', opts)

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

keymap("n", "<LocalLeader>l", "<cmd>IndentBlanklineToggle<CR>", opts)
keymap("i", "<LocalLeader>l", "<cmd>IndentBlanklineToggle<CR>", opts)
keymap("v", "<LocalLeader>l", "<cmd>IndentBlanklineToggle<CR>", opts)

---------------------------------- Gitsigns -----------------------------------

keymap( "n", "]c", "<cmd>Gitsigns next_hunk<CR>" , opts)
keymap( "n", "[c", "<cmd>Gitsigns prev_hunk<CR>" , opts)
keymap( "n", "<leader>gl", "<cmd>Gitsigns blame_line<CR>" , opts)
keymap( "n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>" , opts)
keymap( "n", "<leader>gh", "<cmd>Gitsigns reset_hunk<CR>" , opts)
keymap( "n", "<leader>gr", "<cmd>Gitsigns reset_buffer<CR>" , opts)
keymap( "n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>" , opts)
keymap( "n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>" , opts)
keymap( "n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>" , opts)

---------------------------------- Spectre ------------------------------------

keymap( "n", "<LocalLeader>H", "<cmd>lua require('spectre').open()<CR>" , opts)

---------------------------------- Colorizer ------------------------------------

