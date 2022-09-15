local present, comment_box = pcall(require, "comment-box")

if not present then
    return
end

local options = {
    doc_width = 80, -- width of the document
    box_width = 72, -- width of the boxes
    borders = { -- symbols used to draw a box
        top = "─",
        bottom = "─",
        left = "│",
        right = "│",
        top_left = "╭",
        top_right = "╮",
        bottom_left = "╰",
        bottom_rsight = "╯",
    },
    line_width = 74, -- width of the lines
    line = { -- symbols used to draw a line
        line = "─",
        line_start = "─",
        line_end = "─",
    },
    outer_blank_lines = true, -- insert a blank line above and below the box
    inner_blank_lines = false, -- insert a blank line above and below the text
    line_blank_line_above = true, -- insert a blank line above the line
    line_blank_line_below = true, -- insert a blank line below the line
}

comment_box.setup(options)
