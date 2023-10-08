local core = require("core")
return function(config, meta)
	return {
		"nvim-treesitter/nvim-treesitter",

		config = function()
			local filetypes = meta.tools.treesitter.parsers
			
			require("nvim-treesitter.configs").setup({
				ensure_installed = filetypes,

				indent = { enable = true },
				highlight = { enable = true },
				context_commentstring = { enable = true },
				rainbow = { enable = true },
			})
		end,

		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	}
end
