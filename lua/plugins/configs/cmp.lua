local present, cmp = pcall(require, "cmp")

if not present then
	return
end

vim.opt.completeopt = "menuone,noselect"

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "f",
	Variable = "v",
	Class = "c",
	Interface = "i",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local options = {
	window = {
		completion = {
			border = border "CmpBorder",
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = border "CmpDocBorder",
		},
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
			-- NOTE: order matters
			vim_item.menu = ({
				nvim_lsp = "",
				nvim_lua = "",
				luasnip = "",
				buffer = "",
				path = "",
			})[entry.source.name]
			return vim_item
		end,
	},


	mapping = {
		-- ["<C-p>"] = cmp.mapping.select_prev_item(),
		-- ["<C-n>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, 
		{
			"i",
			"s",
		}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, 
		{
			"i",
			"s",
		}),
	},

	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

require "cmp".setup(options)