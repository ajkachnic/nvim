local std = require("std")

-- Speed ups
vim.o.updatetime = 250
vim.o.timeoutlen = 400

-- Tab options
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtapstop = 4
vim.o.expandtab = true

local meta = {
	completion = {
		lsp = { servers = {} },
	},
	tools = {
		treesitter = { parsers = {} },
	},
}

local pack = {}
local M = {}

local enabled_modules = {}

function M.enabled(module)
	for _, v in ipairs(enabled_modules) do
		if module == v then
			return true
		end
	end

	return false
end

local function module_name(module)
	if type(module) == "table" then
		return module[1]
	elseif type(module) == "string" then
		return module
	end

	return ""
end

function M.load_modules(modules)
	local MODULE_BASE = "modules."

	for _, module in ipairs(modules) do
		local name = module_name(module)

		table.insert(enabled_modules, name)
	end

	for _, module in ipairs(modules) do
		if type(module) == "table" then
			local path = module[1]
			local ok, m = pcall(require, MODULE_BASE .. path)

			if ok then
				M.use(m(module, meta))
			else
				vim.notify("WARNING: Failed to load module " .. path, vim.log.levels.WARN)
			end
		elseif type(module) == "string" then
			local ok, m = pcall(require, MODULE_BASE .. module)
			if ok then
				M.use(m({}, meta))
			else
				vim.notify("WARNING: Failed to load module " .. module, vim.log.levels.WARN)
			end
		end
	end
end

function M.bootstrap()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

function M.use(opts)
	table.insert(pack, opts)
end

function M.unpack(_)
	vim.notify("INFO(core): Configuring " .. #pack .. " modules", vim.log.levels.INFO)
	require("lazy").setup(pack, {})
end

return M
