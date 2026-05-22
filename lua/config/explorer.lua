local oil = require("oil")

oil.setup({
	view_options = { show_hidden = true },
	delete_to_trash = false,
})

map("n", "-", "<cmd>Oil<cr>", "open parent directory")

autocmd("DirChanged", {
	desc = "open oil after remote-sshfs connection",
	pattern = "global",
	callback = function()
		local cwd = vim.fn.getcwd()
		local sshfs_base = vim.fn.expand("$HOME/.sshfs/")

		if vim.startswith(cwd, sshfs_base) then
			vim.schedule(function()
				oil.open(cwd)
			end)
		end
	end,
})
