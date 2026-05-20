require("lualine").setup({
	options = {
		theme = "auto",
		section_separators = "",
		component_separators = "│",
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{ "filename", path = 1 },
			{
				"diagnostics",
				symbols = { error = "✘ ", warn = "▲ ", info = "ⓘ ", hint = "⚑ " },
			},
		},
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

