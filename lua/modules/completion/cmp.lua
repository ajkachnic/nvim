return function(config, meta)
	return {
		"hrsh7th/nvim-cmp",

		-- event = "InsertEnter",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				experimental = {
					ghost_text = true,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping(function()
						if not cmp.visible() then
							cmp.complete()
						end
						cmp.abort()
					end, { "i", "s" }),
					["<c-y>"] = cmp.mapping(function(fallback)
						if not cmp.visible() then
							fallback()
						end
						cmp.scroll_docs(-1)
					end, { "i", "s" }),
					["<c-e>"] = cmp.mapping(function(fallback)
						if not cmp.visible() then
							fallback()
						end
						cmp.scroll_docs(1)
					end, { "i", "s" }),
					["<s-tab>"] = cmp.mapping(function(fallback)
						if not cmp.visible() then
							fallback()
						end
						cmp.select_prev_item()
					end, { "i", "s" }),
					["<tab>"] = cmp.mapping(function(fallback)
						if not cmp.visible() then
							fallback()
						end
						cmp.select_next_item()
					end, { "i", "s" }),
					["<cr>"] = cmp.mapping(function(fallback)
						if cmp.get_selected_entry() == nil then
							fallback()
						end
						cmp.confirm({ behavior = "replace" })
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,

		dependencies = {
			-- TODO: Allow configuration without lsp
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- TODO: Allow configuring snippet engine
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
			},
		},
	}
end
