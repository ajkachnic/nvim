local c = require("core")
c.bootstrap()

vim.g.maplocalleader = " m"
vim.g.mapleader = " "

c.load_modules({
	"config.bindings",

	"lang.lua",
	"lang.go",
	"lang.rust",

	"completion.cmp",
	"completion.lsp",

	"editor.comment",
	"editor.surround",
	"editor.telescope",
	{ "editor.format", on_save = true },

	"tools.git",
	"tools.treesitter",

	"ui.indentline",
	"ui.themes",
	"ui.whichkey",
	{ "ui.git", blame = true },
	--    require("modules.editor.telescope"),
})

c.use({
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[ colorscheme oxocarbon ]])
	end,
})

-- Load packages into lazy
c.unpack()
