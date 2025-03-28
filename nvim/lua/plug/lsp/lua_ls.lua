require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			format = {
				enable = false,
				--				enable = function()
				--      	if vim.fs.root(0, ".stylua.toml") == nil then
				--	return true
				--	end
				--		return false
				--end ,
			},
		},
	},
})
