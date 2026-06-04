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
	tabline = {
		lualine_a = {
			{
				"buffers",
				mode = 2,
				show_filename_only = true,
				show_modified_status = true,
				symbols = {
					modified = " ●",
					alternate_file = "",
					directory = "",
				},
				buffers_color = {
					active = { fg = "#0A0A0A", bg = "#D4879C", gui = "bold" },
					inactive = { fg = "#7f8c8d", bg = "#241A20" },
				},
				seperator = { left = "", right = "" },
			},
		},
		lualine_z = { "tabs" },
	},
})

