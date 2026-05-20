local fzf = require("fzf-lua")

fzf.setup({
	"default-title",

	winopts = {
		height = 0.85,
		width = 0.85,
		preview = {
			layout = "vertical",
			vertical = "down:55%",
		},
	},

	defaults = {
		formatter = "path.filename_first",
	},
})

map("n", "<leader>ff", fzf.files, "find files")
map("n", "<leader>fg", fzf.live_grep, "live grep (content)")
map("n", "<leader>fb", fzf.buffers, "find buffers")
map("n", "<leader>fh", fzf.help_tags, "search help-tags")
map("n", "<leader>fr", fzf.resume, "continue last picker")

map("n", "<leader>fs", fzf.lsp_document_symbols, "symbols in buffer")
map("n", "<leader>fS", fzf.lsp_workspace_symbols, "symbols in project")
map("n", "<leader>fd", fzf.diagnostics_document, "buffer diagnostics")
map("n", "<leader>fD", fzf.diagnostics_workspace, "project diagnostics")
