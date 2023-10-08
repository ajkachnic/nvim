return function()
	return {
		"tpope/vim-fugitive",

		keys = {
			{ "<leader>gl", "<cmd>Git log<CR>", desc = "Open log" },
		},
	}
end
