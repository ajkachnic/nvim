return function(config)
	return {
		"lewis6991/gitsigns.nvim",

		event = "VeryLazy",
		opts = {
			current_line_blame = config.blame or false,
		},
	}
end
