-- Set miscelaneous bindings
--
-- Module-specific keys are set in each module
return function()
	-- +buffer
	vim.keymap.set("n", "<leader>b[", ":<cmd>bprevious<CR>", { desc = "Previous buffer" })
	vim.keymap.set("n", "<leader>bp", ":<cmd>bprevious<CR>", { desc = "Previous buffer" })
	vim.keymap.set("n", "<leader>b]", ":<cmd>bnext<CR>", { desc = "Next buffer" })
	vim.keymap.set("n", "<leader>bn", ":<cmd>bnext<CR>", { desc = "Next buffer" })

	vim.keymap.set("n", "<leader>bl", ":<cmd>e#<CR>", { desc = "Switch to last buffer" })
	vim.keymap.set("n", "<leader>bd", ":<cmd>bw<CR>", { desc = "Delete buffer" })
	vim.keymap.set("n", "<leader>bk", ":<cmd>bd<CR>", { desc = "Kill buffer" })
	vim.keymap.set("n", "<leader>bK", ":<cmd>bd<CR>", { desc = "Kill all buffers" })
	vim.keymap.set("n", "<leader>by", ":<cmd>%y+<CR>", { desc = "Yank buffer" })
end
