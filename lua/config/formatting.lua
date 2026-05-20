require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		php = { "php_cs_fixer" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},

	formatters = {
		shfmt = {
			prepend_args = { "-i", "2", "-ci" },
		},
	},
})
