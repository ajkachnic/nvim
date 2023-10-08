return function()
	return {
		{
			"xero/miasma.nvim",
			event = "VeryLazy",
		},
		{
			"sainnhe/sonokai",
		},
		{
			"NTBBloodbath/doom-one.nvim",
			event = "VeryLazy",

			setup = function()
				-- Add color to cursor
				vim.g.doom_one_cursor_coloring = false
				-- Set :terminal colors
				vim.g.doom_one_terminal_colors = true
				-- Enable italic comments
				vim.g.doom_one_italic_comments = false
				-- Enable TS support
				vim.g.doom_one_enable_treesitter = true
				-- Pumblend transparency
				vim.g.doom_one_pumblend_enable = false
				vim.g.doom_one_pumblend_transparency = 20

				-- Plugins integration
				vim.g.doom_one_plugin_telescope = true
				vim.g.doom_one_plugin_whichkey = true
				vim.g.doom_one_plugin_indent_blankline = true
			end,
		},
	}
end
