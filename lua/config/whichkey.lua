local wk = require("which-key")

wk.setup({
	preset = "modern",
	delay = 300,
	win = {
		border = "rounded",
	},
})

wk.add({
	{ "<leader>c", group = "Code" },
	{ "<leader>d", group = "Diagnostic" },
	{ "<leader>f", group = "Find (fzf)" },
	{ "<leader>g", group = "Git" },
	{ "<leader>h", group = "Git Hunks" },
	{ "<leader>t", group = "Toggle" },
	{ "<leader>r", group = "Refactor/Remote" },
	{ "<leader>e", desc = "Diagnostic Float" },
})
