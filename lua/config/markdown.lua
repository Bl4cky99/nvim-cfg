local markdown = require("render-markdown")

markdown.setup({
	completions = { lsp = { enabled = true } },

	heading = {
		sign = false,
		width = "block",
		left_pad = 0,
		right_pad = 2,
		icons = { "█ ", "██ ", "███ ", "████ ", "█████ ", "██████ " },
		backgrounds = {
			"RenderMarkdownH1Bg",
			"RenderMarkdownH2Bg",
			"RenderMarkdownH3Bg",
			"RenderMarkdownH4Bg",
			"RenderMarkdownH5Bg",
			"RenderMarkdownH6Bg",
		},
	},

	code = {
		sign = false,
		width = "block",
		right_pad = 4,
		border = "thin",
	},

	bullet = {
		icons = { "●", "○", "◆", "◇" },
	},

	checkbox = {
		unchecked = { icon = "󰄱 " },
		checked = { icon = "󰱒 ", scope_highlight = "@markup.strikethrough" },
	},

	pipe_table = {
		preset = "round",
	},
})
