local M = {}

M.imselect = function()

    local present, im_select = pcall(require, "im_select")

    if not present then
        return
    end

    local options = {

        -- IM will be set to `default_im_select` in `normal` mode(`EnterVim` or `InsertLeave`)
        -- For Windows, default: "1003", aka: English US Keyboard
        -- You can use `im-select` in cli to get the IM name of you preferred
        default_im_select  = "1033",

        -- Set to 1 if you don't want restore IM status when `InsertEnter`
        disable_auto_restore = 0,

    }

    im_select.setup(options)

end


----------------------------------------------------------------------------


M.pangu = function()

    vim.cmd [[ let g:pangu_rule_date = 1 ]]
    vim.cmd [[ autocmd BufWritePre *.md if &ft == 'vimwiki.markdown' | PanguAll]]

end

----------------------------------------------------------------------------
return M
