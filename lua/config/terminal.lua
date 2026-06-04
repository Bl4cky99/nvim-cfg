require("toggleterm").setup({
	size = 15,
	open_mapping = [[<C-\>]],
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
})

local Terminal = require("toggleterm.terminal").Terminal

local remote_terms = {}
local local_term = nil

local function detect_remote_host()
	local cwd = vim.fn.getcwd()
	local sshfs_base = vim.fn.expand("$HOME/.sshfs/")

	if not vim.startswith(cwd, sshfs_base) then
		return nil
	end

	local rest = cwd:sub(#sshfs_base + 1)
	return rest:match("^([^/]+)")
end

local function toggle_smart_terminal()
	local host = detect_remote_host()

	if host then
		if not remote_terms[host] then
			remote_terms[host] = Terminal:new({
				cmd = "ssh " .. host,
				direction = "horizontal",
				hidden = true,
				close_on_exit = false,
				display_name = "ssh:" .. host,
			})
		end
		remote_terms[host]:toggle()
	else
		if not local_term then
			local_term = Terminal:new({
				direction = "horizontal",
				hidden = true,
				display_name = "local",
			})
		end
		local_term:toggle()
	end
end

vim.keymap.set({ "n", "t" }, [[<C-\>]], toggle_smart_terminal, {
	desc = "terminal: smart toggle (local/ssh)",
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
