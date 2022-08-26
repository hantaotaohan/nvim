local present, colorizer = pcall(require, "colorizer")

if not present then
    return
end

local options = {

  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; html = { mode = 'background' };}; -- Disable parsing "names" like Blue or Gray
  lua = { names = false; html = { mode = 'background' };}; -- Disable parsing "names" like Blue or Gray

}

require "colorizer".setup(options)
