local core = require("core")

return function(config, meta)
	if core.enabled("tools.treesitter") then
		table.insert(meta.tools.treesitter.parsers, "rust")
		table.insert(meta.tools.treesitter.parsers, "cpp")
		table.insert(meta.tools.treesitter.parsers, "toml") -- Cargo.toml
	end

	if core.enabled("completion.lsp") then
		meta.completion.lsp.servers.rust_analyzer = {}
	end

	return {}
end
