local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	go = { "golangcilint" },
	php = { "phpstan" },
}

autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		pcall(lint.try_lint)
	end,
})

map("n", "<leader>cl", function()
	lint.try_lint()
end, { desc = "run linter" })
