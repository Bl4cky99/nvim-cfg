require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})

vim.lsp.enable({ "lua_ls", "gopls", "vtsls", "intelephense", "bashls", "yamlls" })

map("n", "K", vim.lsp.buf.hover, "lsp: hover doku")
map("n", "gd", vim.lsp.buf.definition, "lsp: go to definition")
map("n", "gD", vim.lsp.buf.declaration, "lsp: go to declaration")
map("n", "gr", vim.lsp.buf.references, "lsp: references")
map("n", "<leader>rn", vim.lsp.buf.rename, "lsp: rename")
map("n", "<leader>ca", vim.lsp.buf.code_action, "lsp: code action")
map("n", "<leader>dp", function()
	vim.diagnostic.jump({ count = -1 })
end, "previous diagnostic")
map("n", "<leader>dn", function()
	vim.diagnostic.jump({ count = 1 })
end, "next diagnostic")
map("n", "<leader>e", vim.diagnostic.open_float, "diagnostic floating window")
map("n", "<leader>td", function()
	local current = vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({
		virtual_lines = not current and { current_line = true } or false,
		virtual_text = current and { spacing = 4, prefix = "●" } or false,
	})
end, "toggle diagnostics display mode")
