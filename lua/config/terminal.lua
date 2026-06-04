require("toggleterm").setup({
	size = 15,
	open_mapping = [[<C-\>]],
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
})

autocmd("TermOpen", {
	pattern = "term://*toggleterm#*",
	callback = function()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	end,
})
