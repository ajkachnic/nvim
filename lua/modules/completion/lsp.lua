return function(config, meta)
	return {
		"neovim/nvim-lspconfig",

		-- event = "InsertEnter",

		config = function()
			local lspconfig = require("lspconfig")

			local servers = meta.completion.lsp.servers
			for name, config in pairs(servers) do
				lspconfig[name].setup(config)
			end

			vim.keymap.set("n", "<space>ce", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
						buffer = ev.buf,
						desc = "Code action",
					})
					vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {
						buffer = ev.buf,
						desc = "Jump to definition",
					})
					vim.keymap.set("n", "<leader>cD", vim.lsp.buf.references, {
						buffer = ev.buf,
						desc = "Jump to references",
					})

					vim.keymap.set("n", "<space>ct", vim.lsp.buf.type_definition, {
						buffer = ev.buf,
						desc = "Jump to type definition",
					})
					vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, {
						buffer = ev.buf,
						desc = "Rename symbol",
					})
				end,
			})
		end,
	}
end
