local present, telescope = pcall(require, "telescope")

if not present then
    return
end

vim.g.theme_switcher_loaded = true

local options = {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },

    extensions_list = { "themes", "terms" },

}

require "telescope".setup(options)

-- load extensions
pcall(function()
    for _, ext in ipairs(options.extensions_list) do
        telescope.load_extension(ext)
    end
end)


-- 自定义高亮
local highlight = function(group, fg, bg, attr, sp)
    fg = fg and "guifg=" .. fg or "guifg=NONE"
    bg = bg and "guibg=" .. bg or "guibg=NONE"
    attr = attr and "gui=" ..attr or "gui=NONE"
    sp = sp and "guisp=" .. sp or ""

    vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr .. " " .. sp)
end

function TelescopeHighlight()

	-- 设置选择器中选定项目的突出显示
    highlight("TelescopeSelection               ",         nil,        nil,        nil,        nil )
    highlight("TelescopeSelectionCaret          ",         nil,        nil,        nil,        nil )
    highlight("TelescopeMultiSelection          ",         nil,        nil,        nil,        nil )
    highlight("TelescopeMultiIcon               ",         nil,        nil,        nil,        nil )

	-- 望远镜创建的浮动窗口中的“正常”。
    highlight("TelescopeNormal                  ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewNormal           ",         nil,        nil,        nil,        nil )
    highlight("TelescopePromptNormal            ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsNormal           ",         nil,        nil,        nil,        nil )

	-- 边框高亮组
    highlight("TelescopeBorder                  ",         "#61AFEF",        nil,        nil,        nil )
    highlight("TelescopePromptBorder            ",         "#61AFEF",        nil,        nil,        nil )
    highlight("TelescopeResultsBorder           ",         "#61AFEF",        nil,        nil,        nil )
    highlight("TelescopePreviewBorder           ",         "#61AFEF",        nil,        nil,        nil )

	-- 标题高亮组                                                                                   
    highlight("TelescopeTitle                   ",         nil,        nil,        nil,        nil )
    highlight("TelescopePromptTitle             ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsTitle            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewTitle            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePromptCounter           ",         nil,        nil,        nil,        nil )

	-- 用于突出显示您匹配的字符。
    highlight("TelescopeMatching                ",         nil,        nil,        nil,        nil )

	-- 用于提示前缀
    highlight("TelescopePromptPrefix            ",         nil,        nil,        nil,        nil )

	-- 用于在预览器中突出显示匹配的行。仅适用于 (vim_buffer_ previewer)
    highlight("TelescopePreviewLine             ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewMatch            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewPipe             ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewCharDev          ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewDirectory        ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewBlock            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewLink             ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewSocket           ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewRead             ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewWrite            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewExecute          ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewHyphen           ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewSticky           ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewSize             ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewUser             ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewGroup            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewDate             ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewMessage          ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewMessageFillchar  ",         nil,        nil,        nil,        nil )

	-- 用于选择器特定的结果突出显示
    highlight("TelescopeResultsClass            ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsConstant         ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsField            ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsFunction         ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsMethod           ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsOperator         ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsStruct           ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsVariable         ",         nil,        nil,        nil,        nil )

    highlight("TelescopeResultsLineNr           ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsIdentifier       ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsNumber           ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsComment          ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsSpecialComment   ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsFileIcon         ",         nil,        nil,        nil,        nil )

	-- 用于 git status 结果高亮
    highlight("TelescopeResultsDiffChange       ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsDiffAdd          ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsDiffDelete       ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsDiffUntracked    ",         nil,        nil,        nil,        nil )

end

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "lua TelescopeHighlight()",
})

