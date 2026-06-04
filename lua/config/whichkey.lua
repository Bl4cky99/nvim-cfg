local wk = require("which-key")

wk.setup({
	preset = "modern",
	delay = 300,
	win = {
		border = "rounded",
	},
})

wk.add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>c", group = "Code" },
	{ "<leader>d", group = "Diagnostic" },
	{ "<leader>f", group = "Find (fzf)" },
	{ "<leader>g", group = "Git" },
	{ "<leader>h", group = "Git Hunks" },
	{ "<leader>r", group = "Refactor/Remote" },
	{ "<leader>e", desc = "Diagnostic Float" },
})
