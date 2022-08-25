local present, onedark = pcall(require, "onedark")

if not present then
    return
end

local options = {
    -- Main options --
    style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = true, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Custom Highlights --
    colors = {
    }, -- Override default colors

    highlights = {
        -- EndOfBuffer = {bg = '$deep_dark'},
        -- TSString = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
        -- TSFunction = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

require "onedark".setup(options)
require "onedark".load()

-- 自定义高亮
local highlight = function(group, fg, bg, attr, sp)
    fg = fg and "guifg=" .. fg or "guifg=NONE"
    bg = bg and "guibg=" .. bg or "guibg=NONE"
    attr = attr and "gui=" ..attr or "gui=NONE"
    sp = sp and "guisp=" .. sp or ""

    vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr .. " " .. sp)
end

function NvimTreeHighlight()

------------------------------------------------------------------------------- 
-- Nvim-tree
------------------------------------------------------------------------------- 

    highlight("NvimTreeSymlink"                    , nil        ,nil  ,nil  ,nil)
    highlight("NvimTreeFolderName"                 , nil        ,nil  ,nil  ,nil)
    highlight("NvimTreeRootFolder"                 , nil        ,nil  ,nil  ,nil)
    highlight("NvimTreeFolderIcon"                 , "#61AFEF"  ,nil  ,nil  ,nil)
    highlight("NvimTreeFileIcon"                   , "#ABB2BF"  ,nil  ,nil  ,nil)
    highlight("NvimTreeEmptyFolderName"            , "#535965"  ,nil  ,nil  ,nil)   -- Directory
    highlight("NvimTreeOpenedFolderName"           , nil        ,nil  ,nil  ,nil)   -- Directory
    highlight("NvimTreeExecFile"                   , nil        ,nil  ,nil  ,nil)
    highlight("NvimTreeOpenedFile"                 , nil        ,nil  ,nil  ,nil)
    highlight("NvimTreeSpecialFile"                , nil        ,nil  ,nil  ,nil)
    highlight("NvimTreeImageFile"                  , nil        ,nil  ,nil  ,nil)
    highlight("NvimTreeIndentMarker"               , "#535965"  ,nil  ,nil  ,nil)

    highlight("NvimTreeLspDiagnosticsError"        , nil        ,nil  ,nil  ,nil)   -- DiagnosticError 
    highlight("NvimTreeLspDiagnosticsWarning"      , nil        ,nil  ,nil  ,nil)   -- DiagnosticWarn
    highlight("NvimTreeLspDiagnosticsInformation"  , nil        ,nil  ,nil  ,nil)   -- DiagnosticInfo
    highlight("NvimTreeLspDiagnosticsHint"         , nil        ,nil  ,nil  ,nil)   -- DiagnosticHint

    highlight("NvimTreeGitDirty"                   , "#E5C07B"  ,nil  ,nil  ,nil)
    highlight("NvimTreeGitStaged"                  , "#C678DD"  ,nil  ,nil  ,nil)
    highlight("NvimTreeGitMerge"                   , "#56B6C2"  ,nil  ,nil  ,nil)
    highlight("NvimTreeGitRenamed"                 , "#61AFEF"  ,nil  ,nil  ,nil)
    highlight("NvimTreeGitNew"                     , "#98C379"  ,nil  ,nil  ,nil)
    highlight("NvimTreeGitDeleted"                 , "#E06C75"  ,nil  ,nil  ,nil)
    highlight("NvimTreeGitIgnored"                 , "#535965"  ,nil  ,nil  ,nil)   -- Comment

    -- There are also links to normal bindings to style the tree itself.

    -- highlight("NvimTreeNormal"                     , nil        ,nil  ,nil  ,nil) 
    -- highlight("NvimTreeEndOfBuffer"                , nil        ,nil  ,nil  ,nil)   -- NonText
    -- highlight("NvimTreeCursorLine"                 , nil        ,nil  ,nil  ,nil)   -- CursorLine
    -- highlight("NvimTreeVertSplit"                  , nil        ,nil  ,nil  ,nil)   -- VertSplit
    -- highlight("NvimTreeWinSeparator"               , nil        ,nil  ,nil  ,nil)   -- VertSplit
    -- highlight("NvimTreeCursorColumn"               , nil        ,nil  ,nil  ,nil)   -- CursorColumn

    -- There are also links for file highlight with git properties, linked to their Git equivalent:

    -- highlight("NvimTreeFileDirty"                  , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitDirty
    -- highlight("NvimTreeFileStaged"                 , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitStaged
    -- highlight("NvimTreeFileMerge"                  , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitMerge
    -- highlight("NvimTreeFileRenamed"                , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitRenamed
    -- highlight("NvimTreeFileNew"                    , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitNew
    -- highlight("NvimTreeFileDeleted"                , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitDeleted
    -- highlight("NvimTreeFileIgnored"                , nil        ,nil  ,nil  ,nil)   -- NvimTreeGitIgnored

    -- There are 2 highlight groups for the live filter feature

    highlight("NvimTreeLiveFilterPrefix"           , "#C678DD"  ,nil  ,nil  ,nil)
    highlight("NvimTreeLiveFilterValue"            , "#E06C75"  ,nil  ,nil  ,nil)

    -- Color of the bookmark icon

    highlight("NvimTreeBookmark"                   , "#C678DD"  ,nil  ,nil  ,nil)

------------------------------------------------------------------------------- 
-- IndenBlank
------------------------------------------------------------------------------- 

    -- highlight("IndentBlanklineChar"                , nil        ,nil  ,nil  ,nil)
    -- highlight("IndentBlanklineSpaceChar"           , nil        ,nil  ,nil  ,nil)
    -- highlight("IndentBlanklineContextChar"         , nil        ,nil  ,nil  ,nil)
    -- highlight("IndentBlanklineContextStart"        , nil        ,nil  ,nil  ,nil)

------------------------------------------------------------------------------- 
-- CMP
------------------------------------------------------------------------------- 

	highlight ("CMPPmenu"                          , "#ABB2BF"  , "#1E2227", nil, nil )
	highlight ("CMPPmenuSel"                       , "#ABB2BF"  , "#282C34", nil, nil )
	highlight ("CmpItemAbbrDeprecated"             , "#282C34"  , nil ,nil  ,nil)
	highlight ("CmpBorder"                         , "#565960"  , nil ,nil  ,nil)
	highlight ("CmpDocBorder"                      , "#565960"  , nil ,nil  ,nil)

	highlight ("CmpItemAbbrMatch"                  , "#61AFEF"  ,nil  ,nil  ,nil)
	highlight ("CmpItemKindFile"                   , "#E5C07B"  ,nil  ,nil  ,nil)
	highlight ("CmpItemKindConstructor"            , "#E5C07B"  ,nil  ,nil  ,nil)
	highlight ("CmpItemAbbrMatchFuzzy"             , "#61AFEF"  ,nil  ,nil  ,nil)
	-- light l(ue
	highlight ("CmpItemKindVariable"               , "#C678DD"  ,nil  ,nil  ,nil)
	highlight ("CmpItemKindInterface"              , "#9CDCFE"  ,nil  ,nil  ,nil)
	highlight ("CmpItemKindText"                   , "#ABB2BF"  ,nil  ,nil  ,nil)
	-- pink
	highlight ("CmpItemKindFunction"               , "#C678DD"  ,nil  ,nil  ,nil)
	highlight ("CmpItemKindMethod"                 , "#C678DD"  ,nil  ,nil  ,nil)
	-- front
	highlight ("CmpItemKindKeyword"                , "#D4D4D4"  ,nil  ,nil  ,nil)
	highlight ("CmpItemKindProperty"               , "#D4D4D4"  ,nil  ,nil  ,nil)
	highlight ("CmpItemKindUnit"                   , "#D4D4D4"  ,nil  ,nil  ,nil)

	highlight ("CmpItemMenu"                       , "#E06C75"  ,nil)

------------------------------------------------------------------------------- 
-- lualine
------------------------------------------------------------------------------- 

    highlight ("lualine_a_terminal"                , "#282C34"  , "#61AFEF", "bold", "bold")

------------------------------------------------------------------------------- 
-- Telescope
------------------------------------------------------------------------------- 

	-- 设置选择器中选定项目的突出显示
    highlight("TelescopeSelection               ",         nil,        "#3E4552",  nil,        nil )
    highlight("TelescopeSelectionCaret          ",         "#61AFEF",  nil,        nil,        nil )
    highlight("TelescopeMultiSelection          ",         "#E06C75",  nil,        nil,        nil )
    highlight("TelescopeMultiIcon               ",         "#E06C75",  nil,        nil,        nil )

	-- 望远镜创建的浮动窗口中的“正常”。
    highlight("TelescopeNormal                  ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewNormal           ",         nil,        nil,        nil,        nil )
    highlight("TelescopePromptNormal            ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsNormal           ",         nil,        nil,        nil,        nil )

	-- 边框高亮组
    highlight("TelescopeBorder                  ",         "#646870",  nil,        nil,        nil )
    highlight("TelescopePromptBorder            ",         "#646870",  nil,        nil,        nil )
    highlight("TelescopeResultsBorder           ",         "#646870",  nil,        nil,        nil )
    highlight("TelescopePreviewBorder           ",         "#646870",  nil,        nil,        nil )

	-- 标题高亮组                                                                                   
    highlight("TelescopeTitle                   ",         nil,        nil,        nil,        nil )
    highlight("TelescopePromptTitle             ",         nil,        nil,        nil,        nil )
    highlight("TelescopeResultsTitle            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePreviewTitle            ",         nil,        nil,        nil,        nil )
    highlight("TelescopePromptCounter           ",         nil,        nil,        nil,        nil )

	-- 用于突出显示您匹配的字符。
    highlight("TelescopeMatching                ",         "#61AFEF",  nil,        nil,        nil )

	-- 用于提示前缀
    highlight("TelescopePromptPrefix            ",         nil,        nil,        nil,        nil )

	-- 用于在预览器中突出显示匹配的行。仅适用于 (vim_buffer_ previewer)
    highlight("TelescopePreviewLine             ",         nil,        "#4E5666",  nil,        nil )
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


------------------------------------------------------------------------------- 
-- System
------------------------------------------------------------------------------- 
    highlight("Search                           ",         "#282C34",  "#E06C75",  nil,        nil )
    highlight("IncSearch                        ",         "#282C34",  "#E06C75",  nil,        nil )
    highlight("Folded                           ",         "#282C34",  "#80868F",  nil,        nil )
    highlight("FoldColumn                       ",         "#4E5666",  "#23272E",  nil,        nil )

    -- highlight("ColorColumn       ",         "#ABB2BF",        "#23272E",        nil,        nil )
    -- highlight("SignColumn        ",         nil,              "#23272E",        nil,        nil )
    -- highlight("CursorColumn      ",         nil,              "#23272E",        nil,        nil )

    -- highlight("QuickFixLine      ",         "#ABB2BF",        "#282C34",        nil,        nil )
    -- highlight("SignColumn        ",         "#E06C75",        "#282C34",        nil,        nil )
    -- highlight("DiffDelete        ",         "#E06C75",        "#E06C75",        nil,        nil )
    -- highlight("CursorLineNr      ",         "#61AFEF",        "#282C34",        nil,        nil )
    -- highlight("Cursor            ",         "#282C34",        "#ABB2BF",        nil,        nil )

------------------------------------------------------------------------------- 

end

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "lua NvimTreeHighlight()",
})

