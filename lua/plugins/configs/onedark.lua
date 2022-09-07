local present, onedark = pcall(require, "onedark")

if not present then
    return
end

local M = {}

M.base_30 = {
  white = "#abb2bf",
  darker_black = "#1b1f27",
  black = "#1e222a", --  nvim bg
  black2 = "#252931",
  one_bg = "#282c34", -- real bg of onedark
  one_bg2 = "#353b45",
  one_bg3 = "#373b43",
  grey = "#42464e",
  grey_fg = "#565c64",
  grey_fg2 = "#6f737b",
  light_grey = "#6f737b",
  red = "#e06c75",
  baby_pink = "#DE8C92",
  pink = "#ff75a0",
  line = "#31353d", -- for lines like vertsplit
  green = "#98c379",
  vibrant_green = "#7eca9c",
  nord_blue = "#81A1C1",
  blue = "#61afef",
  yellow = "#e7c787",
  yellow_F = "#e2c08d",
  -- yellow_G = "#746a5b",
  yellow_G = "#b59c7a",
  sun = "#EBCB8B",
  purple = "#de98fd",
  dark_purple = "#c882e7",
  teal = "#519ABA",
  orange = "#fca2aa",
  cyan = "#a3b8ef",
  statusline_bg = "#22262e",
  lightbg = "#2d3139",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
}

M.base_16 = {
  base00 = "#1e222a",
  base01 = "#353b45",
  base02 = "#3e4451",
  base03 = "#545862",
  base04 = "#565c64",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
  base0F = "#be5046",
}

local colors = M.base_30
local theme = M.base_16

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
        darker = false, -- darker colors for diagnostic
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

    highlight("NvimTreeSymlink"                    ,nil                   ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeNormalNC"                   ,nil                   ,colors.darker_black  ,nil  ,nil                 )
    highlight("NvimTreeFolderName"                 ,colors.folder_bg      ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeRootFolder"                 ,colors.red            ,nil                  ,nil  ,"bold"              )
    highlight("NvimTreeFolderIcon"                 ,colors.folder_bg      ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeFileIcon"                   ,"#ABB2BF"             ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeEmptyFolderName"            ,"#535965"             ,nil                  ,nil  ,nil                 )   -- Directory
    highlight("NvimTreeOpenedFolderName"           ,colors.folder_bg      ,nil                  ,nil  ,nil                 )   -- Directory
    highlight("NvimTreeExecFile"                   ,nil                   ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeOpenedFile"                 ,nil                   ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeSpecialFile"                ,colors.yellow         ,nil                  ,nil  ,"bold"              )
    highlight("NvimTreeImageFile"                  ,nil                   ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeIndentMarker"               ,colors.grey_fg        ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeWindowPicker"               ,colors.red            ,colors.black2        ,nil  ,nil                 )

    highlight("NvimTreeLspDiagnosticsError"        ,nil                   ,nil                  ,nil  ,nil                 )   -- DiagnosticError 
    highlight("NvimTreeLspDiagnosticsWarning"      ,nil                   ,nil                  ,nil  ,nil                 )   -- DiagnosticWarn
    highlight("NvimTreeLspDiagnosticsInformation"  ,nil                   ,nil                  ,nil  ,nil                 )   -- DiagnosticInfo
    highlight("NvimTreeLspDiagnosticsHint"         ,nil                   ,nil                  ,nil  ,nil                 )   -- DiagnosticHint

    highlight("NvimTreeGitDirty"                   ,colors.yellow_G       ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeGitStaged"                  ,"#C678DD"             ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeGitMerge"                   ,"#56B6C2"             ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeGitRenamed"                 ,"#61AFEF"             ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeGitNew"                     ,colors.green          ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeGitDeleted"                 ,colors.red            ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeGitIgnored"                 ,colors.light_grey     ,nil                  ,nil  ,nil                 )   -- Comment

    -- There are also links to normal bindings to style the tree itself.

    highlight("NvimTreeNormal"                     ,nil                   ,colors.darker_black  ,nil  ,nil                 )
    highlight("NvimTreeEndOfBuffer"                ,colors.darker_black   ,nil                  ,nil  ,nil                 )   -- NonText
    highlight("NvimTreeCursorLine"                 ,nil                   ,colors.black2        ,nil  ,nil                 )   -- CursorLine
    highlight("NvimTreeWinSeparator"               ,colors.darker_black   ,colors.darker_black  ,nil  ,nil                 )   -- VertSplit
    -- highlight("NvimTreeVertSplit"                  ,nil                   ,nil                  ,nil  ,nil                 )   -- VertSplit
    -- highlight("NvimTreeCursorColumn"               ,nil                   ,nil                  ,nil  ,nil                 )   -- CursorColumn

    -- There are also links for file highlight with git properties, linked to their Git equivalent:

    highlight("NvimTreeFileDirty"                  ,colors.yellow_F       ,nil                  ,nil  ,nil                 )   -- NvimTreeGitDirty
    -- highlight("NvimTreeFileStaged"                 ,nil                   ,nil                  ,nil  ,nil                 )   -- NvimTreeGitStaged
    -- highlight("NvimTreeFileMerge"                  ,nil                   ,nil                  ,nil  ,nil                 )   -- NvimTreeGitMerge
    -- highlight("NvimTreeFileRenamed"                ,nil                   ,nil                  ,nil  ,nil                 )   -- NvimTreeGitRenamed
    -- highlight("NvimTreeFileNew"                    ,nil                   ,nil                  ,nil  ,nil                 )   -- NvimTreeGitNew
    -- highlight("NvimTreeFileDeleted"                ,nil                   ,nil                  ,nil  ,nil                 )   -- NvimTreeGitDeleted
    -- highlight("NvimTreeFileIgnored"                ,nil                   ,nil                  ,nil  ,nil                 )   -- NvimTreeGitIgnored

    -- There are 2 highlight groups for the live filter feature

    highlight("NvimTreeLiveFilterPrefix"           ,"#C678DD"             ,nil                  ,nil  ,nil                 )
    highlight("NvimTreeLiveFilterValue"            ,"#E06C75"             ,nil                  ,nil  ,nil                 )

    -- Color of the bookmark icon

    highlight("NvimTreeBookmark"                   ,"#C678DD"             ,nil                  ,nil  ,nil                 )

    highlight("NvimTreeIndentMarker"               ,"#4F5767"             ,nil                  ,nil  ,nil                 )

------------------------------------------------------------------------------- 
-- Devicons
------------------------------------------------------------------------------- 

    highlight("DevIconDefault"                     , colors.red           ,nil                  ,nil  ,nil                 )
    highlight("DevIconc"                           , colors.blue          ,nil                  ,nil  ,nil                 )
    highlight("DevIconcss"                         , colors.blue          ,nil                  ,nil  ,nil                 )
    highlight("DevIcondeb"                         , colors.cyan          ,nil                  ,nil  ,nil                 )
    highlight("DevIconDockerfile"                  , colors.cyan          ,nil                  ,nil  ,nil                 )
    highlight("DevIconhtml"                        , colors.baby_pink     ,nil                  ,nil  ,nil                 )
    highlight("DevIconjpeg"                        , colors.dark_purple   ,nil                  ,nil  ,nil                 )
    highlight("DevIconjpg"                         , colors.dark_purple   ,nil                  ,nil  ,nil                 )
    highlight("DevIconjs"                          , colors.sun           ,nil                  ,nil  ,nil                 )
    highlight("DevIconkt"                          , colors.orange        ,nil                  ,nil  ,nil                 )
    highlight("DevIconlock"                        , colors.red           ,nil                  ,nil  ,nil                 )
    highlight("DevIconlua"                         , colors.blue          ,nil                  ,nil  ,nil                 )
    highlight("DevIconmp3"                         , colors.white         ,nil                  ,nil  ,nil                 )
    highlight("DevIconmp4"                         , colors.white         ,nil                  ,nil  ,nil                 )
    highlight("DevIconout"                         , colors.white         ,nil                  ,nil  ,nil                 )
    highlight("DevIconpng"                         , colors.dark_purple   ,nil                  ,nil  ,nil                 )
    highlight("DevIconpy"                          , colors.cyan          ,nil                  ,nil  ,nil                 )
    highlight("DevIcontoml"                        , colors.blue          ,nil                  ,nil  ,nil                 )
    highlight("DevIconts"                          , colors.teal          ,nil                  ,nil  ,nil                 )
    highlight("DevIconttf"                         , colors.white         ,nil                  ,nil  ,nil                 )
    highlight("DevIconrb"                          , colors.pink          ,nil                  ,nil  ,nil                 )
    highlight("DevIconrpm"                         , colors.orange        ,nil                  ,nil  ,nil                 )
    highlight("DevIconvue"                         , colors.vibrant_green ,nil                  ,nil  ,nil                 )
    highlight("DevIconwoff"                        , colors.white         ,nil                  ,nil  ,nil                 )
    highlight("DevIconwoff2"                       , colors.white         ,nil                  ,nil  ,nil                 )
    highlight("DevIconxz"                          , colors.sun           ,nil                  ,nil  ,nil                 )
    highlight("DevIconzip"                         , colors.sun           ,nil                  ,nil  ,nil                 )
    highlight("DevIconZig"                         , colors.orange        ,nil                  ,nil  ,nil                 )

------------------------------------------------------------------------------- 
-- TreeSitter
------------------------------------------------------------------------------- 

    highlight("TSAnnotation"                       ,theme.base0F          ,nil                  ,nil  ,nil                 )
    highlight("TSAttribute"                        ,theme.base0A          ,nil                  ,nil  ,nil                 )
    highlight("TSTagAttribute"                     ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSCharacter"                        ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSConstructor"                      ,theme.base0C          ,nil                  ,nil  ,nil                 )
    highlight("TSConstBuiltin"                     ,theme.base09          ,nil                  ,nil  ,nil                 )
    highlight("TSConstMacro"                       ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSError"                            ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSException"                        ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSFloat"                            ,theme.base09          ,nil                  ,nil  ,nil                 )
    highlight("TSKeyword"                          ,theme.base0E          ,nil                  ,nil  ,nil                 )
    highlight("TSKeywordFunction"                  ,theme.base0E          ,nil                  ,nil  ,nil                 )
    highlight("TSKeywordReturn"                    ,theme.base0E          ,nil                  ,nil  ,nil                 )
    highlight("TSFunction"                         ,theme.base0D          ,nil                  ,nil  ,nil                 )
    highlight("TSFuncBuiltin"                      ,theme.base0D          ,nil                  ,nil  ,nil                 )
    highlight("TSFuncMacro"                        ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSKeywordOperator"                  ,theme.base0E          ,nil                  ,nil  ,nil                 )
    highlight("TSMethod"                           ,theme.base0D          ,nil                  ,nil  ,nil                 )
    highlight("TSNamespace"                        ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSNone"                             ,theme.base05          ,nil                  ,nil  ,nil                 )
    highlight("TSParameter"                        ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSParameterReference"               ,theme.base05          ,nil                  ,nil  ,nil                 )
    highlight("TSPunctBracket"                     ,theme.base0F          ,nil                  ,nil  ,nil                 )
    highlight("TSPunctDelimiter"                   ,theme.base0F          ,nil                  ,nil  ,nil                 )
    highlight("TSPunctSpecial"                     ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSStringRegex"                      ,theme.base0C          ,nil                  ,nil  ,nil                 )
    highlight("TSStringEscape"                     ,theme.base0C          ,nil                  ,nil  ,nil                 )
    highlight("TSSymbol"                           ,theme.base0B          ,nil                  ,nil  ,nil                 )
    highlight("TSTagDelimiter"                     ,theme.base0F          ,nil                  ,nil  ,nil                 )
    highlight("TSText"                             ,theme.base05          ,nil                  ,nil  ,nil                 )
    highlight("TSStrong"                           ,nil                   ,nil                  ,nil  ,"bold"              )
    highlight("TSEmphasis"                         ,theme.base09          ,nil                  ,nil  ,nil                 )
    highlight("TSStrike"                           ,theme.base00          ,nil                  ,nil  ,"strikethrough"     )
    highlight("TSLiteral"                          ,theme.base09          ,nil                  ,nil  ,nil                 )
    highlight("TSURI"                              ,theme.base09          ,nil                  ,nil  ,"underline"         )
    highlight("TSTypeBuiltin"                      ,theme.base0A          ,nil                  ,nil  ,nil                 )
    highlight("TSVariableBuiltin"                  ,theme.base09          ,nil                  ,nil  ,nil                 )
    highlight("TSVariable"                         ,theme.base05          ,nil                  ,nil  ,nil                 )
    highlight("TSDefinition"                       ,nil                   ,nil                  ,nil  ,"underline"         )
    highlight("TSDefinitionUsage"                  ,nil                   ,nil                  ,nil  ,"underline"         )
    highlight("TSCurrentScope"                     ,nil                   ,nil                  ,nil  ,"bold"              )
    highlight("luaTSField"                         ,theme.base0D          ,nil                  ,nil  ,nil                 )
    highlight("TSFieldKey"                         ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSProperty"                         ,theme.base08          ,nil                  ,nil  ,nil                 )
    highlight("TSInclude"                          ,"#BF68D9"             ,nil                  ,nil  ,nil                 )
    highlight("TSConditional"                      ,"#BF68D9"             ,nil                  ,nil  ,nil                 )

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
	highlight ("CMPPmenuSel"                       , "#282C34"  , "#61AFEF", nil, nil )
	highlight ("CmpItemAbbrDeprecated"             , "#282C34"  , nil ,nil  ,nil)
	highlight ("CmpBorder"                         , "#565960"  , nil ,nil  ,nil)
	highlight ("CmpDocBorder"                      , "#565960"  , nil ,nil  ,nil)
	highlight ("CmpItemAbbr"                       , "#ABB2BF"  , nil ,nil  ,nil)

	highlight ("CmpItemAbbrMatch"                  , "#61AFEF"  ,nil  ,nil  ,'bold')
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

	highlight ("CmpItemKindConstant     "          , "#d19a66"  ,nil)
	highlight ("CmpItemKindIdentifier   "          , "#e06c75"  ,nil)
	highlight ("CmpItemKindField        "          , "#e06c75"  ,nil)
	highlight ("CmpItemKindSnippet      "          , "#E06C75"  ,nil)
	highlight ("CmpItemKindStructure    "          , "#c678dd"  ,nil)
	highlight ("CmpItemKindType         "          , "#e5c07b"  ,nil)
	highlight ("CmpItemKindFolder       "          , "#c8ccd4"  ,nil)
	highlight ("CmpItemKindModule       "          , "#e5c07b"  ,nil)
	highlight ("CmpItemKindColor        "          , "#E06C75"  ,nil)
	highlight ("CmpItemKindReference    "          , "#abb2bf"  ,nil)
	highlight ("CmpItemKindStruct       "          , "#c678dd"  ,nil)
	highlight ("CmpItemKindOperator     "          , "#abb2bf"  ,nil)
	highlight ("CmpItemKindTypeParameter"          , "#E06C75"  ,nil)

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

    highlight("DiffDelete                       ",         "#282C34",  "#E06C75",  nil,        nil )
    highlight("DiffAdd                          ",         "#282C34",  "#98C379",  nil,        nil )
    highlight("DiffChange                       ",         "#282C34",  "#E5C07B",  nil,        nil )
    highlight("DiffText                         ",         "#282C34",  "#E5C07B",  nil,        nil )

------------------------------------------------------------------------------- 
-- Scrollbar
------------------------------------------------------------------------------- 
    -- highlight("ScrollbarHandle                  ",         "#282C34",  "#3E4552",  nil,        nil )
    -- highlight("IncSearch                        ",         "#282C34",  "#E06C75",  nil,        nil )
    -- highlight("Folded                           ",         "#282C34",  "#80868F",  nil,        nil )
    -- highlight("FoldColumn                       ",         "#4E5666",  "#23272E",  nil,        nil )
    highlight("MarkSignHL                       ",         "#DCDCDC",  "#0366d6",  nil,        nil )

------------------------------------------------------------------------------- 
-- Rainbow
------------------------------------------------------------------------------- 

    highlight("rainbowcol1                       ",         "#Abb2bF",  nil,  nil,        nil )

------------------------------------------------------------------------------- 

end

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "lua NvimTreeHighlight()",
})

