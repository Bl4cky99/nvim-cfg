vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
		tmpl = "gotmpl",
	},
})

vim.filetype.add({
	extension = {
		bu = "yaml",
	},
})

autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})

autocmd("FileType", {
	pattern = {
		"help",
		"qf",
		"man",
		"lspinfo",
		"checkhealth",
		"notify",
		"fugitive",
		"NeogitStatus",
		"NeogitPopup",
		"NeogitCommitView",
		"NeogitLogView",
		"DiffviewFiles",
		"DiffviewFileHistory",
		"gitsigns-blame",
		"oil",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
			desc = "Buffer schließen",
		})
	end,
})

autocmd("TermOpen", {
	callback = function(event)
		vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", {
			buffer = event.buf,
			desc = "Terminal schließen",
		})
	end,
})

autocmd({ "InsertLeave", "TextChanged", "FocusLost", "BufLeave" }, {
	callback = function(event)
		local buf = event.buf

		if vim.bo[buf].buftype ~= "" then
			return
		end
		if vim.api.nvim_buf_get_name(buf) == "" then
			return
		end
		if not vim.bo[buf].modified or not vim.bo[buf].modifiable then
			return
		end
		if vim.bo[buf].readonly then
			return
		end

		vim.api.nvim_buf_call(buf, function()
			vim.cmd("silent! write")
		end)
	end,
})

autocmd("FileType", {
	pattern = "sh",
	callback = function(args)
		if vim.b[args.buf].is_bash == 1 then
			vim.bo[args.buf].filetype = "bash"
		end
	end,
})
