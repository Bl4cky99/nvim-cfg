require("oil").setup({
	view_options = { show_hidden = true },
	delete_to_trash = false,
})

map("n", "-", "<cmd>Oil<cr>", "open parent directory")
