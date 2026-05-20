require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",
		["<Esc>"] = { "cancel", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
		ghost_text = {
			enabled = true,
		},
	},

	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},

	signature = {
		enabled = true,
	},
})
