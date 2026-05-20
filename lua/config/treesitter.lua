require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"lua",
	"vim",
	"vimdoc",
	"query",
	"go",
	"gomod",
	"gosum",
	"javascript",
	"typescript",
	"tsx",
	"jsdoc",
	"php",
	"phpdoc",
	"html",
	"css",
	"json",
	"yaml",
	"toml",
	"markdown",
	"markdown_inline",
	"bash",
	"regex",
	"gitignore",
	"gitcommit",
})

autocmd("FileType", {
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if not pcall(vim.treesitter.start, args.buf, ft) then
			return
		end
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"
		vim.wo.foldlevel = 99
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

