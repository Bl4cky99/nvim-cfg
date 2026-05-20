return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	root_markers = { ".git" },
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},

			validate = true,
			hover = true,
			completion = true,

			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
				["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
				["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.{yml,yaml}",
				["https://json.schemastore.org/gitlab-ci.json"] = ".gitlab-ci.{yml,yaml}",
				["https://json.schemastore.org/dependabot-2.0.json"] = ".github/dependabot.{yml,yaml}",
				["https://raw.githubusercontent.com/Lin-Buo-Ren/symfony-config-schemas/master/symfony-config.json"] = "config/**/*.{yml,yaml}",
			},

			format = {
				enable = true,
				singleQuote = false,
				bracketSpacing = true,
			},

			customTags = {
				"!Ref",
				"!Sub",
				"!GetAtt",
			},
		},
	},
}
