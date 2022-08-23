local present, code_runner = pcall(require, "code_runner")

if not present then
    return
end

local options = {

    mode = 'term',
    focus = true,
    startinsert = false,

    term = {
        position = "bot",
        size = 8,
    },

    float = {
        border = "none",
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
        border_hl = "FloatBorder",
        float_hl = "Normal",
        blend = 0,
    },

    filetype_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/code_runner.json",

    filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "deno run",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
    },

    project_path = vim.fn.stdpath("data")
        .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/project_manager.json",

    --    project = {
    -- 	["~/deno/example"] = {
    -- 		name = "ExapleDeno",
    -- 		description = "Project with deno using other command",
    -- 		file_name = "http/main.ts",
    -- 		command = "deno run --allow-net"
    -- 	},
    -- 	["~/cpp/example"] = {
    -- 		name = "ExapleCpp",
    -- 		description = "Project with make file",
    -- 		command = "make buid & cd buid/ & ./compiled_file"
    -- 	}
    -- },-- put here the commands by filetype

}

require "code_runner".setup(options)
