local core = require("core")

return function(config, meta)
	local spec = {
		{
			"echasnovski/mini.comment",
			version = false,
			opts = {},
		},
	}

	if core.enabled("tools.treesitter") then
		table.insert(spec, {
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {},
		})
	end

	return spec
end
