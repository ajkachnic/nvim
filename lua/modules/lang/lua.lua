return function(config, meta)
	meta.completion.lsp.servers.lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	}
end
