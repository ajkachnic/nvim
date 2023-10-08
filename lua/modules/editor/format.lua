return function(con)
	local config = vim.tbl_extend("force", { on_save = false }, con)
	return {
		"stevearc/conform.nvim",

		event = "BufWritePre",
		config = function()
			local extra = config.on_save
				and {
					format_on_save = {
						-- These options will be passed to conform.format()
						timeout_ms = 500,
						lsp_fallback = true,
					},
				}
				or {}
			require("conform").setup(vim.tbl_extend("force", {
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { { "prettierd", "prettier" } },
				},
			}, extra))
		end,
	}
end
