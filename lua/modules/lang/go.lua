local core = require("core")

return function(config, meta)
	if core.enabled("tools.treesitter") then
		table.insert(meta.tools.treesitter.parsers, "go")
	end

	return {}
end
