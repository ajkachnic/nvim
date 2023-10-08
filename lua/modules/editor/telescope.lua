function init()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			set_env = { COLORTERM = "truecolor" },
			layout_strategy = "flex",
		},
	})

	telescope.load_extension("ui-select")
	telescope.load_extension("project")
	telescope.load_extension("file_browser")

	-- Bindings
	vim.keymap.set("n", "<leader>,", "<cmd>Telescope buffers<CR>", { desc = "Switch buffer" })
	vim.keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<CR>", {
		desc = "Find file in project",
	})
	vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", {
		desc = "Search project",
	})

	-- +buffer
	vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Switch buffer" })
	vim.keymap.set("n", "<leader>bB", "<cmd>Telescope telescope-tabs list_tabs<CR>", {
		desc = "Switch tab",
	})
end

return function(config)
	return {
		"nvim-lua/telescope.nvim",

		config = init,
		tag = "0.1.3",

		dependencies = {
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-lua/plenary.nvim",
		},
	}
end
