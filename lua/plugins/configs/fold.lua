local present, fold = pcall(require, "pretty-fold")

if not present then
    return
end

local options = {

    keep_indentation = false,
    remove_fold_markers = true,
    process_comment_signs = false,
    fill_char = '━',
    sections = {
        left = {
            '', function() return string.rep(' FOLDED ' , vim.v.foldlevel) end, ' ██ ', 'content', '██  '
        },
        right = {
            '  ██  ', 'number_of_folded_lines', ': ', 'percentage', '   ',
        }
    },
     matchup_patterns = {
      { '^%s*do$', 'end' }, -- do ... end blocks
      { '^%s*if', 'end' },  -- if ... end
      { '^%s*for', 'end' }, -- for
      { 'function%s*%(', 'end' }, -- 'function( or 'function (''
      {  '{', '}' },
      { '%(', ')' }, -- % to escape lua pattern char
      { '%[', ']' }, -- % to escape lua pattern char
   },

}

require("pretty-fold").setup(options)
