function _G.autocmd(event, opts)
	vim.api.nvim_create_autocmd(event, opts)
end

function _G.map(mode, lhs, rhs, opts)
	opts = opts or {}
	if type(opts) == "string" then
		opts = { desc = opts }
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

vim.pack.add({
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/echasnovski/mini.comment" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/NeogitOrg/neogit" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/nosduco/remote-sshfs.nvim" },
})

require("config.lsp")
require("config.treesitter")
require("config.ui")
require("config.completion")
require("config.formatting")
require("config.linting")
require("config.finder")
require("config.explorer")
require("config.git")
require("config.statusline")
require("config.whichkey")
require("config.remote")

