require "core"                               -- 加载 /lua/core/ 文件夹内的文件 
require "core.options"                       -- 加载 /lua/core/options.lua 模块

require("core.utils").load_mappings()        -- 加载 /lua/core/utils.lua 模块

require("core.packer").bootstrap()           -- 加载 /lua/core/packer 包管理模块
require "plugins"                            -- 加载 /lua/plugins/ 内的所有模块

pcall(require, "custom")                     -- 加载自定义模块
