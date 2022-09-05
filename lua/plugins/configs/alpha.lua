local present, alpha = pcall(require, "alpha")

if not present then
    return
end

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<Localleader>")
    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "AlphaButtons",
    }

    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

local options = {

    header = {
        type = "text",
        val = {
            [[                                              ]],
            [[    _____                 _____               ]],
            [[   |_   _|_ _  ___       |_   _|_ _  ___      ]],
            [[     | |/ _` |/ _ \        | |/ _` |/ _ \     ]],
            [[     | | (_| | (_) |  _    | | (_| | (_) |    ]],
            [[     |_|\__,_|\___/  (_)   |_|\__,_|\___/     ]],
            [[                                              ]],
        },

        opts = {
            position = "center",
            hl = "AlphaHeader",
        },
    },

    buttons = {
        type = "group",

        val = {

            button("f", "  Find File  ", ":Telescope find_files<CR>"),
            button("o", "  Recent File  ", ":Telescope oldfiles<CR>"),
            button("w", "  Find Word  ", ":Telescope live_grep<CR>"),
            button("m", "  Bookmarks  ", ":Telescope marks<CR>"),
            button("h", "  Themes  ", ":ChangeColorScheme<CR>"),

            button("e", "  New File  ", ":ene <BAR> startinsert <CR><Esc>"),
            button("v", "  Nvim Init  ", ":e $MYVIMRC | :cd %:p:h <CR>"),
            button("q", "  Quit Nvim  ", ":qa<CR>"),

            -- button("SPC e e", "  New File  ", ":ene <BAR> startinsert <CR>"),
            -- button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
            -- button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
            -- button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
            -- button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
            -- button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
            -- button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
            -- button("SPC q q", "  Quit Nvim  ", ":qa<CR>"),
        },

        opts = {
            spacing = 1,
        },
    },

    headerPaddingTop = { type = "padding", val = headerPadding },
    headerPaddingBottom = { type = "padding", val = 2 },
}

alpha.setup {
    layout = {
        options.headerPaddingTop,
        options.header,
        options.headerPaddingBottom,
        options.buttons,
    },
    opts = {position = "center"},
}


