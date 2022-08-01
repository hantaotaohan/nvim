-- n, v, i, t = mode names

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

------------------------------------General------------------------------------
M.general = {
  i = {

    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
    ["<C-e>"] = { "<End>", "壟 end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "  move left" },
    ["<C-l>"] = { "<Right>", " move right" },
    ["<C-j>"] = { "<Down>", " move down" },
    ["<C-k>"] = { "<Up>", " move up" },
  },

  n = {

    ["<ESC>"] = { "<cmd> noh <CR>", "  no highlight" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", " window left" },
    ["<C-l>"] = { "<C-w>l", " window right" },
    ["<C-j>"] = { "<C-w>j", " window down" },
    ["<C-k>"] = { "<C-w>k", " window up" },

    -- save
    ["<LocalLeader>w"] = { "<cmd> w <CR>", "﬚  save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "  copy whole file" },

    -- line numbers
    ["<Leader>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
    ["<Leader>rn"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },

    -- toggle themes
    ["<leader>tt"] = {
      function()
        require("base46").toggle_theme()
      end,

      "   toggle theme",
    },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    -- ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    -- ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
  },

  t = {
    ["<C-x>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
    -- switch between windows
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", " window left" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", " window right" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", " window down" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", " window up" },
  },

  v = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
  },
}

------------------------------------Tabufline------------------------------------
M.tabufline = {

  n = {
    -- new buffer
    ["<Leader>bn"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- cycle through buffers
    ["<LocalLeader><TAB>"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
    ["<LocalLeader><S-Tab>"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },

    -- cycle through tabs
    ["<Leader><TAB>"] = { "<cmd> tabprevious <CR>", "  goto next tab" },
    ["<Leader><S-Tab>"] = { "<cmd> tabnext <CR> ", "  goto prev tab" },

    -- close buffer + hide terminal buffer
    ["<LocalLeader>q"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "   close buffer",
    },
  },
}

------------------------------------Comment------------------------------------
M.comment = {

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end,

      "蘒  toggle comment",
    },
  },

  v = {
    ["gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
      "蘒  toggle comment",
    },
  },
}

------------------------------------Nvimtree------------------------------------
M.nvimtree = {

  n = {
    -- toggle
    ["<LocalLeader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

------------------------------------Telescope------------------------------------
M.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
  },
}

------------------------------------Nvterm------------------------------------
M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<LocalLeader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "   toggle floating term",
    },

    ["<LocalLeader>c"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },

    ["<LocalLeader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "   toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<LocalLeader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "   toggle floating term",
    },

    ["<LocalLeader>c"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },

    ["<LocalLeader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "   toggle vertical term",
    },

    -- new

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "   new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "   new vertical term",
    },
  },
}

return M
