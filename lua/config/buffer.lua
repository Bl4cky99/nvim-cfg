local function smart_bdelete(force)
	local current = vim.api.nvim_get_current_buf()

	local others = vim.tbl_filter(function(b)
		return b ~= current and vim.bo[b].buflisted and vim.api.nvim_buf_is_valid(b)
	end, vim.api.nvim_list_bufs())

	if not force and vim.bo[current].modified then
		vim.notify("Buffer has unsaved changes... Use <leader>bD to force", vim.log.levels.WARN)
		return
	end

	if #others > 0 then
		vim.cmd("bprevious")
	else
		vim.cmd("enew")
	end

	vim.cmd((force and "bdelete! " or "bdelete ") .. current)
end

map("n", "<S-h>", "<cmd>bprevious<cr>", "buffer: prev")
map("n", "<S-l>", "<cmd>bnext<cr>", "buffer: next")
map("n", "<leader>bd", function()
	smart_bdelete(false)
end, "buffer: delete")
map("n", "<leader>bD", function()
	smart_bdelete(true)
end, "buffer: delete (force)")
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", "buffer: only this one")
