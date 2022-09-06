if vim.fn.executable("vim-multiple-cursors") == 1 then

    vim.cmd([[

        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_exit_from_visual_mode=0
        let g:multi_cursor_exit_from_insert_mode=0

        " Default mapping
        let g:multi_cursor_start_word_key      = '<C-n>'
        let g:multi_cursor_select_all_word_key = '<A-n>'
        let g:multi_cursor_start_key           = 'g<C-n>'
        let g:multi_cursor_select_all_key      = 'g<A-n>'
        let g:multi_cursor_next_key            = '<C-n>'
        let g:multi_cursor_prev_key            = '<C-p>'
        let g:multi_cursor_skip_key            = '<C-x>'
        let g:multi_cursor_quit_key            = '<Esc>'

        highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
        highlight link multiple_cursors_visual Visual

    ]])

end
