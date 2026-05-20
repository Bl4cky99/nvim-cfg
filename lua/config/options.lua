local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.updatetime = 250
opt.shell = "/usr/bin/zsh"
vim.cmd.colorscheme("gottlos-auf-mutter")

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
		source = "if_many",
	},

	signs = {
		text = {
			[severity.ERROR] = "✘",
			[severity.WARN] = "▲",
			[severity.INFO] = "ⓘ",
			[severity.HINT] = "⚑",
		},
	},

	underline = true,
	update_in_insert = false,
	severity_sort = true,

	float = {
		border = "rounded",
		source = "if_many",
	},
})

