return function()
	return {
		"folke/which-key.nvim",

		config = function()
			local wk = require("which-key")
			wk.setup({
				icons = {
					separator = "->",
					group = "+",
					layout = { spacing = 3 },
					align = "center",
				},
			})

			wk.register({
				["<tab>"] = { name = "+workspace" },
				b = { name = "+buffer" },
				c = { name = "+code" },
				f = { name = "+file" },
				g = { name = "+git" },
				s = { name = "+search" },
				w = { name = "+window" },

				m = { name = "+localleader" },
			}, { prefix = "<leader>" })

			-- wk.register({ ["<leader><tab>"] = { name = "+workspace" } })
			-- wk.register({ ["<leader>b"] = { name = "+buffer" } })
			-- wk.register({ "<leader>c", name = "+code" })
			-- wk.register({ "<leader>f", name = "+file" })
			-- wk.register({ "<leader>g", name = "+git" })
			-- wk.register({ "<leader>s", name = "+search" })
			-- wk.register({ "<leader>w", name = "+window" })
			-- wk.register({ "<leader>m", name = "+localleader" })
		end,
	}
end
