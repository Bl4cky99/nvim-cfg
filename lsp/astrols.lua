return {
	cmd = { "astro-ls", "--stdio" },
	filetypes = { "astro" },
	root_markers = { "package.json", "astro.config.mjs", "astro.config.ts", "astro.config.js", ".git" },
	init_options = {
		typescript = {},
	},

	before_init = function(_, config)
		local found = vim.fs.find("node_modules/typescript/lib", {
			path = config.root_dir,
			upward = true,
			type = "directory",
			limit = 1,
		})

		if #found > 0 then
			config.init_options.typescript.tsdk = found[1]
		end
	end,
}
